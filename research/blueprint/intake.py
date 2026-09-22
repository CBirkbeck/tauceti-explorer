#!/usr/bin/env python3
"""Take in pull requests from external (browser) workers.

  python3 research/blueprint/intake.py list
  python3 research/blueprint/intake.py merge <pr> [--yes] [--complete] [--auto]
  python3 research/blueprint/intake.py sweep [--yes]
  python3 research/blueprint/intake.py mark <pr> opened|reopened|closed [merged]
  python3 research/blueprint/intake.py check-files <path> [...]

A submission is merged only when every changed file lies in a swarm output
path, contains no local filesystem path, is valid JSON where it is JSON, and
the pull request's checks have passed (or none apply). With --auto (the "Swarm
intake" workflow) it must also be a ready pull request from this repository
for one known, unfinished job, touch only that job's deliverables and handoff
note, and, for a review, come from a worker who did not do the work under
review, and the job's deliverables must not already be complete on main. The
one exception is a follow-up: the job's own worker (a branch named after a
session that claimed the job's issue) may still correct a finished job while
nobody has started its review. Anything else is left to the maintainer, with a
comment saying why. `sweep` does this for every open pull request whose "Swarm
submission check" passed.

After the merge the job is complete when its deliverables on main cover the
whole job (issues.deliverables_complete); the sync then finishes it and its
review follows. Otherwise the merge is a checkpoint: the issue is released so
the next worker continues from the merged files and the handoff note.

`mark` keeps the issue in step with the pull request: opening it marks the job
submitted, so nobody else claims it while it waits; closing it unmerged makes
the job available again. `check-files` applies the file rules to a checkout.
"""
from __future__ import annotations

import json
import re
import subprocess
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from issues import STATE_LABELS, deliverables_complete, ready  # noqa: E402

ALLOWED = re.compile(r"^research/(blueprint/(packets|readmes|suggested|restructure|reviews|links|handoff|roadmaps|plans|classify|audit|compare|papers|redteam|errata)/[^/]+"
                     r"|expansion/reviews/[^/]+|expansion/naming/(?:NAME|PLANETS)-\d+\.result\.json)$")
PRIVATE = re.compile(r"/Users/|/private/|/home/[a-z]+/|mcu22seu")
TOKEN = re.compile(r"[A-Za-z0-9_.-]+")
ISSUE = re.compile(r"\b(?:refs|references|closes|fixes|resolves|issue)\s*#(\d+)", re.I)
CLAIM = re.compile(r"^Claimed for (.+?) by @")
BOT = "github-actions[bot]"
CHECK = "Swarm submission check"
# A review's issue with one of these labels has been taken up.
STARTED = ("state:claimed", "state:submitted", "state:running", "state:done")
PENDING = ("EXPECTED", "PENDING", "QUEUED", "IN_PROGRESS", "WAITING", "REQUESTED")
REPO = "CBirkbeck/tauceti-explorer"
ROOT = Path(__file__).resolve().parents[2]
BP = ROOT / "research" / "blueprint"


def gh(*args):
    result = subprocess.run(["gh", *args], capture_output=True, text=True)
    if result.returncode != 0:
        raise SystemExit(f"gh {' '.join(args[:3])}: {result.stderr.strip()[:300]}")
    return result.stdout


def own_files(job):
    return set(job.get("outputs", [])) | {f"research/blueprint/handoff/{job['id']}.md"}


def job_for(files, text, jobs):
    """The job whose deliverables (or handoff note) the pull request adds; when
    files are shared (a review edits an audit in place), the job the description
    names, then one that is ready. Without such files, the job the text names."""
    by_id = {job["id"]: job for job in jobs}
    named = [token.rstrip(".-") for token in TOKEN.findall(text or "")]
    named = [jid for jid in named if jid in by_id]
    hits = {}
    for job in jobs:
        count = sum(1 for path in files if path in own_files(job))
        if count:
            hits[job["id"]] = count

    def rank(jid):
        job = by_id[jid]
        live = job.get("state") in ("pending", "external")
        return (hits[jid], jid in named, live and ready(job, by_id), live)
    if hits:
        return by_id[max(hits, key=rank)]
    return by_id[named[0]] if named else None


def issue_for(job, mapping, text):
    if job and job["id"] in mapping:
        return mapping[job["id"]]
    found = ISSUE.search(text or "")
    return int(found.group(1)) if found else None


def claimants(comments):
    """Session ids from the claim bot's replies ("Claimed for <agent> — <session> by @...")."""
    sessions = set()
    for comment in comments:
        if (comment.get("user") or {}).get("login") != BOT:
            continue
        found = CLAIM.match(comment.get("body") or "")
        if found:
            sessions.add(found.group(1).split(" — ")[-1].strip())
    return sessions


def auto_refusals(job, files, draft, reviewer_sessions, author_sessions, already_complete=False, follow_up=False):
    """Why an automatic merge must leave this pull request to the maintainer.
    follow_up: the job's own worker is correcting it before its review starts."""
    if job is None:
        return ["no job found for the submission"]
    found = []
    if draft:
        found.append("the pull request is a draft")
    if job.get("state") == "done":
        if not follow_up:
            found.append(f"{job['id']} is already done")
    elif job.get("state") in ("superseded", "failed"):
        found.append(f"{job['id']} is {job['state']}")
    elif already_complete and not follow_up:
        found.append(f"{job['id']}'s deliverables on main are already complete")
    own = own_files(job)
    found += [f"{path} is not a deliverable of {job['id']}" for path in files if path not in own]
    others = independent_of(job)
    if others:
        role = "reviewer" if job["kind"] == "review" else "red teamer" if job["kind"] == "redteam" else "worker"
        found += [f"the {role} {session} also did {' or '.join(others)}" for session in sorted(reviewer_sessions & author_sessions)]
    return found


def follow_up(branch, sessions, review_has_started):
    """Whether a pull request for a finished job is its own worker's correction:
    from a branch named after a session that claimed the job (WORKERS.md), while
    nobody has started the job's review. A session id too short to tell workers
    apart does not count."""
    own = any(len(session) >= 6 and (branch == session or branch.startswith((session + "-", session + "/")))
              for session in sessions)
    return own and not review_has_started


def reviews_of(job, jobs):
    """The reviews that check this job."""
    return [other for other in jobs if other["kind"] == "review" and job["id"] in independent_of(other)]


def review_started(review, labels):
    """A review has started once the queue has it past pending, or its issue is taken up."""
    return review.get("state") not in (None, "pending") or any(label in STARTED for label in labels)


def independent_of(job):
    """The jobs whose workers may not do this one: a review's target; a red team's target and its review."""
    return job.get("independentOf") or ((job.get("after") or [])[:1] if job["kind"] == "review" else [])


def latest_checks(rollup):
    """The latest run of each check. A pull request run again on the same commit
    keeps its earlier runs in the rollup; only the latest says anything."""
    latest = {}
    for check in rollup or []:
        key = (check.get("workflowName") or "", check.get("name") or check.get("context") or "")
        when = check.get("startedAt") or check.get("createdAt") or ""
        if key not in latest or when >= (latest[key].get("startedAt") or latest[key].get("createdAt") or ""):
            latest[key] = check
    return list(latest.values())


def swarm_checked(pr):
    """The submission check's latest run on the pull request's latest commit passed."""
    return any(check.get("workflowName") == CHECK and check.get("conclusion") == "SUCCESS"
               for check in latest_checks(pr.get("statusCheckRollup")))


def file_problems(path, text):
    if not ALLOWED.match(path):
        return [f"file outside swarm output paths: {path}"]
    problems = []
    if PRIVATE.search(text):
        problems.append(f"local path in {path}")
    if path.endswith(".json"):
        try:
            json.loads(text)
        except json.JSONDecodeError as exc:
            problems.append(f"invalid JSON in {path}: {exc}")
    return problems


def load_queue():
    jobs = json.loads((BP / "queue.json").read_text())["jobs"]
    mapping = json.loads((BP / "issues.json").read_text())
    return jobs, mapping


def issue_labels(issue):
    return [label["name"] for label in json.loads(gh("issue", "view", str(issue), "--json", "labels"))["labels"]] if issue else []


def comments(issue):
    return json.loads(gh("api", "--paginate", f"repos/{REPO}/issues/{issue}/comments?per_page=100")) if issue else []


def inspect(number, jobs, mapping, auto=False):
    data = json.loads(gh("pr", "view", str(number), "--json",
                         "number,title,body,files,headRefName,headRefOid,isDraft,isCrossRepository,statusCheckRollup,state"))
    files = [item["path"] for item in data["files"]]
    problems = []
    for path in files:
        text = "" if not ALLOWED.match(path) else subprocess.run(
            ["gh", "api", f"repos/{REPO}/contents/{path}?ref={data['headRefOid']}", "-H", "Accept: application/vnd.github.raw"],
            capture_output=True, text=True).stdout
        problems += file_problems(path, text)
    checks = [c.get("conclusion") or c.get("state") or c.get("status") for c in latest_checks(data.get("statusCheckRollup"))]
    if any(c not in ("SUCCESS", "SKIPPED", "NEUTRAL") + PENDING for c in checks):
        problems.append(f"checks not passed: {checks}")
    elif any(c in PENDING for c in checks):
        problems.append(f"checks still running: {checks}")
    text = data["title"] + "\n" + (data["body"] or "")
    job = job_for(files, text, jobs)
    issue = issue_for(job, mapping, text)
    if auto:
        if data.get("isCrossRepository"):
            problems.append("the pull request comes from a fork")
        reviewer, author = set(), set()
        if job and independent_of(job):
            reviewer = claimants(comments(issue))
            for other in independent_of(job):
                if mapping.get(other):
                    author |= claimants(comments(mapping[other]))
        complete = bool(job) and deliverables_complete(job, ROOT)
        correction = False
        if job and (job.get("state") == "done" or complete):
            started = any(review_started(review, issue_labels(mapping.get(review["id"]))) for review in reviews_of(job, jobs))
            correction = follow_up(data["headRefName"], claimants(comments(issue)), started)
        problems += auto_refusals(job, files, data["isDraft"], reviewer, author, already_complete=complete, follow_up=correction)
    return data, files, problems, job, issue


def set_issue_state(issue, wanted, note):
    labels = [label["name"] for label in json.loads(gh("issue", "view", str(issue), "--json", "labels"))["labels"]]
    args = ["issue", "edit", str(issue), "--add-label", wanted]
    for name in labels:
        if name in STATE_LABELS and name != wanted:
            args += ["--remove-label", name]
    gh(*args)
    gh("issue", "comment", str(issue), "--body", note)


def merge(number, argv, wait=True):
    auto = "--auto" in argv
    jobs, mapping = load_queue()
    for attempt in range(20 if wait else 1):
        data, files, problems, job, issue = inspect(number, jobs, mapping, auto)
        if not any(problem.startswith("checks still running") for problem in problems):
            break
        time.sleep(15)
    print(f"#{number} job={job and job['id']} issue=#{issue} files={files}")
    if auto and problems == ["the pull request is a draft"]:
        print("a draft; the intake waits until it is ready for review")
        return
    if auto and any(problem.startswith(("checks still running", "checks not passed")) for problem in problems):
        print("not merged:", "; ".join(problems))
        return
    if problems:
        if auto and "--yes" in argv:
            note = ("Swarm intake: left for the maintainer, because " + "; ".join(problems) + ". "
                    "Nothing was merged. If the submission is for a job, name the job's issue with \"Refs #N\" and "
                    "change only that job's deliverables and handoff note.")
            earlier = [c["body"] for c in comments(number)]
            if note not in earlier:
                gh("pr", "comment", str(number), "--body", note)
        raise SystemExit("not merged: " + "; ".join(problems))
    if "--yes" not in argv:
        print("dry run; pass --yes to merge")
        return
    mark_complete = []
    if "--complete" in argv:
        # Orchestrator decision: a full link map whose file predates the status field.
        mark_complete = [path for path in files if path.endswith(".json") and "/links/" in path]
    if data["isDraft"]:
        gh("pr", "ready", str(number))
    # Finished before this merge: an automatic merge then took it as its worker's follow-up.
    correction = bool(job) and (job.get("state") == "done" or deliverables_complete(job, ROOT))
    gh("pr", "merge", str(number), "--squash", "--delete-branch")
    # A description saying "close #N" makes GitHub close the job's issue on merge;
    # the issue stays open until the job is reviewed and integrated.
    if issue and json.loads(gh("issue", "view", str(issue), "--json", "state"))["state"] == "CLOSED":
        gh("issue", "reopen", str(issue))
    subprocess.run(["git", "pull", "--rebase", "--autostash", "-q"], cwd=ROOT, check=True)
    if mark_complete:
        for path in mark_complete:
            target = ROOT / path
            packet = json.loads(target.read_text())
            packet = {"roadmapId": packet.get("roadmapId"), "protocol": packet.get("protocol"), "status": "complete",
                      **{k: v for k, v in packet.items() if k not in ("roadmapId", "protocol", "status")}}
            target.write_text(json.dumps(packet, indent=1, ensure_ascii=False) + "\n")
            subprocess.run(["git", "add", path], cwd=ROOT, check=True)
        subprocess.run(["git", "commit", "-q", "-m",
                        f"Record #{number}'s link map as a complete submission\n\nThe worker's file predates the status field; the orchestrator judged the "
                        f"submission complete for independent review.\n\nCo-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>\n"],
                       cwd=ROOT, check=True)
        subprocess.run(["git", "push", "-q"], cwd=ROOT, check=True)
    complete = bool(job) and deliverables_complete(job, ROOT)
    if correction and complete:
        note = (f"Swarm intake: merged as a follow-up from the worker who did {job['id']}. Nobody had started its review, "
                "so the review will see this version.")
    elif complete:
        note = f"Swarm intake: merged. {job['id']} is complete; the sync records it and its independent review follows."
    else:
        note = "Swarm intake: merged as a checkpoint; the job stays open for continuation from the merged files and the handoff note."
    gh("pr", "comment", str(number), "--body", note)
    if issue and not complete:
        set_issue_state(issue, "state:available",
                        f"Swarm intake: checkpoint from #{number} merged. This job is available again; the next worker "
                        "continues from the merged files and the handoff note.")
    print("merged", number, "complete" if complete else "checkpoint")


def sweep(argv):
    """Merge every open pull request whose submission check passed on its latest commit."""
    subprocess.run(["git", "pull", "--rebase", "--autostash", "-q"], cwd=ROOT, check=True)
    listing = json.loads(gh("pr", "list", "--state", "open", "--limit", "100", "--json", "number,isDraft,statusCheckRollup"))
    for pr in sorted(listing, key=lambda item: item["number"]):
        if pr["isDraft"] or not swarm_checked(pr):
            continue
        try:
            merge(pr["number"], ["--auto", *argv], wait=False)
        except SystemExit as exc:
            print(f"#{pr['number']}: {exc}")


def mark_state(action, merged, pr_state, labels, job_done):
    """The state label a pull request event gives its job's issue, or None.
    Each event acts only if the pull request is still as the event left it, so
    a close and a reopen in quick succession cannot undo each other."""
    if action in ("opened", "reopened") and pr_state == "OPEN":
        if "state:available" in labels or "state:claimed" in labels:
            return "state:submitted"
    if action == "closed" and not merged and pr_state == "CLOSED" and "state:submitted" in labels and not job_done:
        return "state:available"
    return None


def mark(number, action, merged):
    """Opening a pull request marks its job submitted; closing it unmerged releases it."""
    jobs, mapping = load_queue()
    data = json.loads(gh("pr", "view", str(number), "--json", "title,body,files,state"))
    text = data["title"] + "\n" + (data["body"] or "")
    job = job_for([item["path"] for item in data["files"]], text, jobs)
    issue = issue_for(job, mapping, text)
    if not issue:
        print(f"#{number}: no job issue found")
        return
    current = json.loads(gh("issue", "view", str(issue), "--json", "labels,state"))
    labels = [label["name"] for label in current["labels"]]
    if "swarm" not in labels or current["state"] != "OPEN":
        print(f"#{number}: issue #{issue} is not an open swarm issue")
        return
    done = bool(job) and (job.get("state") == "done" or deliverables_complete(job, ROOT))
    wanted = mark_state(action, merged == "true", data["state"], labels, done)
    if wanted == "state:submitted":
        set_issue_state(issue, wanted, f"Submitted in #{number}. The job is nobody else's to claim while the pull request is open; it is "
                                       "merged automatically once its check passes, and released again if it is closed unmerged.")
    elif wanted == "state:available":
        set_issue_state(issue, wanted, f"#{number} was closed without merging, so the job is available again.")
    print(f"#{number}: issue #{issue} {wanted or 'unchanged'}")


def check_files(paths):
    problems = []
    for path in paths:
        target = ROOT / path
        problems += file_problems(path, target.read_text(encoding="utf-8", errors="replace") if target.exists() else "")
    for problem in problems:
        print("ERROR", problem)
    print(f"{len(paths)} file(s), {len(problems)} problem(s)")
    return 1 if problems else 0


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        return 2
    command = sys.argv[1]
    if command == "list":
        jobs, mapping = load_queue()
        for pr in json.loads(gh("pr", "list", "--state", "open", "--limit", "100", "--json", "number,title")):
            _, _, problems, job, issue = inspect(pr["number"], jobs, mapping, auto=True)
            print(f"#{pr['number']} job={job and job['id']} issue=#{issue} problems={problems or 'none'} :: {pr['title'][:70]}")
        return 0
    if command == "merge":
        merge(int(sys.argv[2]), sys.argv[3:])
        return 0
    if command == "sweep":
        sweep(sys.argv[2:])
        return 0
    if command == "mark":
        mark(int(sys.argv[2]), sys.argv[3], sys.argv[4] if len(sys.argv) > 4 else "false")
        return 0
    if command == "check-files":
        return check_files(sys.argv[2:])
    print(__doc__)
    return 2


if __name__ == "__main__":
    sys.exit(main())
