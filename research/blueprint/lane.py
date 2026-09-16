#!/usr/bin/env python3
"""One worker lane of the blueprint swarm.

A lane repeatedly claims the next eligible job from research/blueprint/queue.json
(under a file lock), runs `claude -p <prompt>` under one account's config
directory, and records the outcome. Rate and weekly limits release the job and
put the lane to sleep until the reset time printed by the CLI.

Usage:
  python3 research/blueprint/lane.py --account claude2 --lane 1 \
      [--workers DIR] [--start-at 2026-09-16T16:10] [--wait-session tmux-name] [--once]
The account name maps to $HOME/.<account> (claude -> $HOME/.claude).
"""
from __future__ import annotations

import argparse
import datetime as dt
import fcntl
import json
import os
import re
import shutil
import subprocess
import sys
import time
from contextlib import contextmanager
from pathlib import Path
from zoneinfo import ZoneInfo

REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "research" / "blueprint" / "queue.json"
LOCK = REPO / "research" / "blueprint" / ".queue.lock"
LEDGER = REPO / "research" / "blueprint" / "ledger.tsv"
LIMIT = re.compile(r"hit your [\w ]*limit|usage limit|limit will reset|reached your [\w ]*limit|rate.limit|"
                   r"Credit balance is too low|overloaded_error|API Error: (?:429|5\d\d)", re.I)
TRANSIENT = re.compile(r"Request timed out|ECONNRESET|socket hang up|fetch failed|Connection error", re.I)
RESET = re.compile(r"resets?\s+(?:at\s+)?(?:(?P<mon>[A-Z][a-z]{2})\s+(?P<day>\d{1,2}),?\s+(?:at\s+)?)?"
                   r"(?P<hour>\d{1,2})(?::(?P<min>\d{2}))?\s*(?P<ampm>am|pm)\s*(?:\((?P<tz>[^)]+)\))?", re.I)
DONE_STATES = {"done", "failed", "superseded"}
ISSUES = REPO / "research" / "blueprint" / "issues.json"
STATE_LABELS = ("state:available", "state:claimed", "state:running", "state:submitted", "state:done")


def issue_number(job_id):
    try:
        return json.loads(ISSUES.read_text()).get(job_id)
    except (OSError, json.JSONDecodeError):
        return None


def issue_labels(number):
    try:
        out = subprocess.run(["gh", "issue", "view", str(number), "--json", "labels", "--jq", ".labels[].name"],
                             capture_output=True, text=True, cwd=REPO, timeout=60)
        return out.stdout.split() if out.returncode == 0 else None
    except Exception:
        return None


def mark_issue(job_id, state, comment=None):
    """Mirror a local state change on the job's GitHub issue; failures are ignored."""
    number = issue_number(job_id)
    if not number:
        return
    labels = issue_labels(number) or []
    command = ["gh", "issue", "edit", str(number), "--add-label", state]
    for label in labels:
        if label in STATE_LABELS and label != state:
            command += ["--remove-label", label]
    try:
        subprocess.run(command, capture_output=True, cwd=REPO, timeout=60)
        if comment:
            subprocess.run(["gh", "issue", "comment", str(number), "--body", comment], capture_output=True, cwd=REPO, timeout=60)
    except Exception:
        pass
DEFAULT_TIMEOUT = 6 * 3600


@contextmanager
def locked_queue():
    LOCK.touch(exist_ok=True)
    with open(LOCK, "r+") as handle:
        fcntl.flock(handle, fcntl.LOCK_EX)
        try:
            queue = json.loads(QUEUE.read_text(encoding="utf-8"))
            yield queue
            tmp = QUEUE.with_suffix(".json.tmp")
            tmp.write_text(json.dumps(queue, indent=1, ensure_ascii=False) + "\n", encoding="utf-8")
            os.replace(tmp, QUEUE)
        finally:
            fcntl.flock(handle, fcntl.LOCK_UN)


def now():
    return dt.datetime.now(dt.timezone.utc)


def stamp():
    return now().strftime("%Y-%m-%dT%H:%M:%SZ")


def log_has_exit(path: str) -> bool:
    try:
        return any(line.startswith("EXIT:") for line in Path(path).read_text(errors="replace").splitlines())
    except OSError:
        return False


def eligible(job, jobs, account, workers=""):
    if job.get("state") != "pending":
        return False
    if job.get("accounts") and account not in job["accounts"]:
        return False
    for dep in job.get("after", []):
        if jobs.get(dep, {}).get("state") not in DONE_STATES:
            return False
    for log in job.get("waitForLogs", []):
        if not log_has_exit(log.replace("{WORKERS}", workers)):
            return False
    other = job.get("avoidAccountOf")
    if other and jobs.get(other, {}).get("account") == account:
        return False
    if job.get("notBefore") and now() < dt.datetime.fromisoformat(job["notBefore"].replace("Z", "+00:00")):
        return False
    return True


def claim(account, lane, workers=""):
    with locked_queue() as queue:
        jobs = {job["id"]: job for job in queue["jobs"]}
        candidates = [job for job in queue["jobs"] if eligible(job, jobs, account, workers)]
        if not candidates:
            return None
        candidates.sort(key=lambda j: (j.get("priority", 9), j.get("order", 0), j["id"]))
        job = candidates[0]
        job.update(state="running", account=account, lane=lane, startedAt=stamp(),
                   attempts=job.get("attempts", 0) + 1)
        return dict(job)


def finish(job_id, **fields):
    with locked_queue() as queue:
        for job in queue["jobs"]:
            if job["id"] == job_id:
                job.update(fields)
                return dict(job)


def reset_time(text: str):
    matches = list(RESET.finditer(text))
    if not matches:
        return None
    m = matches[-1]
    tz = ZoneInfo((m.group("tz") or "Europe/London").strip())
    hour = int(m.group("hour")) % 12 + (12 if m.group("ampm").lower() == "pm" else 0)
    minute = int(m.group("min") or 0)
    local_now = dt.datetime.now(tz)
    if m.group("mon"):
        month = dt.datetime.strptime(m.group("mon"), "%b").month
        candidate = local_now.replace(month=month, day=int(m.group("day")), hour=hour, minute=minute, second=0, microsecond=0)
        if candidate < local_now - dt.timedelta(days=1):
            candidate = candidate.replace(year=candidate.year + 1)
    else:
        candidate = local_now.replace(hour=hour, minute=minute, second=0, microsecond=0)
        if candidate <= local_now:
            candidate += dt.timedelta(days=1)
    return candidate


def compare_progress(job):
    """(judged, listed) pairs for a pairwise-judgement job."""
    listed = json.loads((REPO / "research" / "blueprint" / "compare" / f"{job['id']}.json").read_text())["pairs"]
    try:
        data = json.loads((REPO / job["outputs"][0]).read_text())
    except (OSError, ValueError):
        return 0, len(listed)
    items = data.get("judgements", []) if isinstance(data, dict) else []
    answered = {(item.get("a"), item.get("b")) for item in items if isinstance(item, dict) and item.get("farther") in ("a", "b", "tie")}
    return sum((pair["a"], pair["b"]) in answered for pair in listed), len(listed)


def check_outputs(job):
    missing = [pattern for pattern in job.get("outputs", []) if not list(REPO.glob(pattern))]
    result = {}
    if job.get("kind") == "audit" or (job.get("kind") == "review" and job["id"].startswith("REV-AUDIT-")):
        if not missing:
            audit = job["id"].replace("REV-", "")
            listed = [layer["id"] for roadmap in json.loads((REPO / "research" / "blueprint" / "audit" / f"{audit}.json").read_text())["roadmaps"]
                      for layer in roadmap["layers"]]
            try:
                data = json.loads((REPO / job["outputs"][0]).read_text())
            except (OSError, ValueError):
                data = {}
            present = {lid for roadmap in (data.get("roadmaps") or {}).values() for lid in (roadmap.get("layers") or {})}
            result = {"layers": len(listed), "audited": sum(lid in present for lid in listed)}
            if result["audited"] < len(listed):
                missing = [f"{job['outputs'][0]} ({result['audited']} of {len(listed)} layers audited)"]
            elif job["kind"] == "review":
                verdict = (data.get("review") or {}).get("status")
                result["review"] = verdict
                if verdict not in ("accepted", "needs_changes"):
                    missing = [f"{job['outputs'][0]} (no review verdict)"]
        return missing, result
    if job.get("kind") == "compare" and not missing:
        judged, listed = compare_progress(job)
        result = {"judged": judged, "pairs": listed}
        if judged < listed:
            # A partial file is a checkpoint: the job returns to the queue and the next worker completes it.
            missing = [f"{job['outputs'][0]} ({judged} of {listed} pairs judged)"]
        return missing, result
    packets = [str(p) for pattern in job.get("outputs", []) for p in REPO.glob(pattern)
               if p.suffix == ".json" and "/packets/" in str(p)]
    if packets:
        try:
            proc = subprocess.run([sys.executable, str(REPO / "scripts" / "check_blueprint.py"), "--json", *packets],
                                  capture_output=True, text=True, timeout=900)
            reports = json.loads(proc.stdout or "[]")
            result = {"check": [{**r["summary"], "errors": len(r["errors"]), "warnings": len(r["warnings"])} for r in reports]}
        except Exception as exc:  # the check is informative; the orchestrator re-runs it
            result = {"checkError": str(exc)[:300]}
    return missing, result


def run(job, account, workers: Path):
    folder = workers / job["id"]
    folder.mkdir(parents=True, exist_ok=True)
    attempt = job["attempts"]
    log_path = folder / f"run-{attempt}.log"
    prompt = (REPO / job["prompt"]).read_text(encoding="utf-8")
    env = dict(os.environ)
    env["CLAUDE_CONFIG_DIR"] = str(Path.home() / f".{account}")
    env["CLAUDE_CODE_EFFORT_LEVEL"] = "max"
    # Workers run the checkers against the lane's baseline, with any extra tools first on the path.
    env["TAUCETI_BASELINE"] = os.environ.get("TAUCETI_BASELINE", str(workers / "baseline"))
    if os.environ.get("TAUCETI_TOOLS_BIN"):
        env["PATH"] = os.environ["TAUCETI_TOOLS_BIN"] + os.pathsep + env.get("PATH", "")
    started = time.time()
    with open(log_path, "w") as out:
        try:
            proc = subprocess.run(["claude", "--dangerously-skip-permissions", "-p", prompt], cwd=REPO, env=env,
                                  stdout=out, stderr=subprocess.STDOUT, timeout=job.get("timeout", DEFAULT_TIMEOUT))
            code = proc.returncode
        except subprocess.TimeoutExpired:
            code = 124
            out.write("\nLANE: wall-clock timeout\n")
    with open(log_path, "a") as out:
        out.write(f"EXIT:{code}\n")
    shutil.copyfile(log_path, folder / "run.log")
    return code, log_path.read_text(errors="replace"), time.time() - started


def ledger(*fields):
    with open(LEDGER, "a") as handle:
        handle.write("\t".join(str(f) for f in fields) + "\n")


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--account", required=True)
    ap.add_argument("--lane", type=int, default=1)
    ap.add_argument("--workers", default=os.environ.get("TAUCETI_WORKERS", "/tmp/tauceti-workers"))
    ap.add_argument("--start-at", default=None, help="local ISO time (Europe/London) before which the lane sleeps")
    ap.add_argument("--wait-session", default=None, help="tmux session that must end before the lane starts")
    ap.add_argument("--once", action="store_true")
    ap.add_argument("--drain-file", default=None,
                    help="when this file exists the lane finishes its current job and stops (default: research/blueprint/.drain-<host>)")
    args = ap.parse_args()
    workers = Path(args.workers)
    name = f"{args.account}/{args.lane}"
    if args.start_at:
        start = dt.datetime.fromisoformat(args.start_at)
        if start.tzinfo is None:
            start = start.replace(tzinfo=ZoneInfo("Europe/London"))
        while dt.datetime.now(dt.timezone.utc) < start:
            time.sleep(60)
    if args.wait_session:
        while subprocess.run(["tmux", "has-session", "-t", args.wait_session], capture_output=True).returncode == 0:
            time.sleep(60)
    idle = 0
    started_from = Path(__file__).stat().st_mtime
    import socket
    drain = Path(args.drain_file) if args.drain_file else REPO / "research" / "blueprint" / f".drain-{socket.gethostname().split('.')[0]}"
    while True:
        if drain.exists():
            print(f"{stamp()} {name}: drain file {drain.name} present; stopping", flush=True)
            return
        if Path(__file__).stat().st_mtime != started_from:
            print(f"{stamp()} {name}: lane.py changed; reloading", flush=True)
            os.execv(sys.executable, [sys.executable, __file__, *[a for a in sys.argv[1:]]])
        job = claim(args.account, args.lane, str(workers))
        if job is None:
            idle += 1
            if args.once or idle > 72:  # twelve hours without eligible work
                print(f"{stamp()} {name}: no eligible jobs; stopping", flush=True)
                return
            time.sleep(600)
            continue
        idle = 0
        number = issue_number(job["id"])
        if number:
            labels = issue_labels(number) or []
            if "state:claimed" in labels:
                finish(job["id"], state="external", attempts=job["attempts"] - 1, account=None,
                       note=f"claimed on GitHub issue #{number}")
                print(f"{stamp()} {name}: {job['id']} is claimed on GitHub; skipping", flush=True)
                continue
            mark_issue(job["id"], "state:running",
                       f"A local swarm worker ({name}) started this job (attempt {job['attempts']})." if job["attempts"] == 1 else None)
        print(f"{stamp()} {name}: start {job['id']} (attempt {job['attempts']})", flush=True)
        code, log, seconds = run(job, args.account, workers)
        tail = log[-4000:]
        if LIMIT.search(tail) and code != 0:
            wake = reset_time(tail)
            finish(job["id"], state="pending", note=f"released after a usage limit on {name} at {stamp()}",
                   attempts=job["attempts"] - 1, account=None)
            delay = max(300, (wake - dt.datetime.now(wake.tzinfo)).total_seconds() + 300) if wake else 1800
            ledger(stamp(), name, job["id"], "limit", int(seconds), wake.isoformat() if wake else "unknown")
            mark_issue(job["id"], "state:available")
            print(f"{stamp()} {name}: usage limit; sleeping {int(delay)}s", flush=True)
            time.sleep(delay)
            continue
        if code != 0 and TRANSIENT.search(tail):
            state = "pending" if job["attempts"] < 4 else "failed"
            finish(job["id"], state=state, note=f"transient failure on {name} at {stamp()} (exit {code})")
            ledger(stamp(), name, job["id"], "transient", int(seconds), code)
            time.sleep(120)
            continue
        missing, result = check_outputs(job)
        if code == 0 and not missing:
            finish(job["id"], state="done", finishedAt=stamp(), seconds=int(seconds), result=result, note="")
            mark_issue(job["id"], "state:submitted", f"The local swarm worker finished this job; outputs: {', '.join(job.get('outputs', []))}. They await review or integration.")
            ledger(stamp(), name, job["id"], "done", int(seconds), json.dumps(result)[:400])
        else:
            state = "pending" if job["attempts"] < 3 else "failed"
            finish(job["id"], state=state, finishedAt=stamp(), seconds=int(seconds), result=result,
                   note=f"exit {code}; missing outputs {missing}" if missing else f"exit {code}")
            ledger(stamp(), name, job["id"], state, int(seconds), f"exit {code} missing {missing}")
        print(f"{stamp()} {name}: finished {job['id']} exit {code} missing {missing}", flush=True)
        if args.once:
            return


if __name__ == "__main__":
    main()
