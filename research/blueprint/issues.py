#!/usr/bin/env python3
"""Mirror the blueprint queue as GitHub issues, so that local lanes and browser
agents can claim the same jobs.

  python3 research/blueprint/issues.py render [--kinds blueprint,design,link] [--limit N]
      Write issue bodies to research/blueprint/issues-preview/ (not committed).
  python3 research/blueprint/issues.py publish --yes [--kinds ...] [--limit N]
      Create an issue for each selected job that has none (research/blueprint/issues.json).
  python3 research/blueprint/issues.py sync
      Mark jobs claimed on GitHub as `external` in the queue, and close issues of finished jobs.
"""
from __future__ import annotations

import argparse
import re
import json
import subprocess
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
BP = REPO / "research" / "blueprint"
GITHUB = "https://github.com/CBirkbeck/tauceti-explorer"
BLOB = GITHUB + "/blob/main/"
KIND_TITLE = {"blueprint": "Blueprint", "design": "New roadmap", "link": "Links", "review": "Review", "assembly": "Assembly",
              "plan": "Plan", "classify": "Classification", "naming": "Planet names", "status": "Status mapping"}


LOCAL_ONLY = {"PLAN-HABIRO", "REV-PLAN-HABIRO"}
LABEL_COLOURS = {"swarm": "5b6b7a", "state:available": "2da44e", "state:claimed": "bf8700", "state:running": "1f6feb",
                 "state:submitted": "8250df", "state:done": "57606a", "local-only": "b60205"}


def publicize(text):
    """The worker prompt with local paths replaced by their public equivalents."""
    import re
    replacements = [
        (r"/Users/[^\s]*/Downloads/TauCeti_Roadmaps_Revised_[^\s]*/references/?", "public sources (the maintainer's reference library is not available to you; cite public versions)"),
        (r"/Users/[^\s]*/Downloads/Habiro_[A-Za-z_-]*\d*\.pdf", "[course notes available only to the maintainer's local workers]"),
        (r"(/private)?/tmp/tauceti-workers/baseline/declarations\.tsv", "the pinned library (search Loogle, LeanSearch, the docs or GitHub as BROWSER_AGENTS.md describes)"),
        (r"(/private)?/tmp/tauceti-workers/baseline", "the pinned library (Mathlib 082e2d3 and Tau Ceti f790474 on GitHub; see BROWSER_AGENTS.md)"),
        (r"(/private)?/tmp/tauceti-workers/[A-Za-z0-9_.~-]+", "your own scratch space"),
        (r"/Users/[^\s]*/GitHub/tauceti-explorer", "a clone of https://github.com/CBirkbeck/tauceti-explorer"),
        (r"You run unattended in a tmux session as job", "You work on job"),
        (r"You run unattended as job", "You work on job"),
        (r"You run unattended in a tmux session", "You work on this job"),
    ]
    whole_lines = [
        (r"^- Library baseline \(what exists today\):.*$",
         "- Library baseline (what exists today): Mathlib at commit 082e2d3 and Tau Ceti at commit f790474 on GitHub (links in BROWSER_AGENTS.md). Search with Loogle, LeanSearch, the documentation sites or GitHub code search, then open the Lean file at the pinned commit and read the actual statement before citing it. Tau Ceti is a large library (about 70,000 declarations): search it thoroughly before declaring something missing."),
        (r"^- Reference library:.*$",
         "- Sources: use public versions (arXiv, author pages, publishers) and record their URLs and the date you read them. The maintainer's private reference library is not available to you."),
        (r"^Library baseline: .*Reference library: .*$",
         "Library baseline: Mathlib 082e2d3 and Tau Ceti f790474 on GitHub (see BROWSER_AGENTS.md). Sources: public versions only; record their URLs."),
        (r"Your scratch directory is [^.]*\(create it\)\.", "Use your own scratch space."),
        (r"Your scratch directory is [^.]*\.", "Use your own scratch space."),
        (r" \(grep -i -P\)", ""),
        (r"^- The roadmap text and stages: data/atlas\.json.*$",
         "- The roadmap text and stages: research/blueprint/atlas/roadmaps/<id>.json (file name: the roadmap id with ':' and '/' replaced by '_'), which holds the roadmap record, all its stages with full descriptions and every stage edge touching it, together with the roadmap document named in its `document` field. data/atlas.json itself is too large for browser tools (see research/blueprint/atlas/README.md). New roadmaps are defined in research/blueprint/roadmaps/*.json."),
        (r"^- data/atlas\.json: roadmaps\[\].*$",
         "- research/blueprint/atlas/: index.json (every roadmap and stage), roadmaps/<id>.json (one roadmap's stages with descriptions and its stage edges), areas/<area>-<n>.json (every stage description in an area, for text search) and stage-edges.json (all recorded stage links). data/atlas.json itself is too large for browser tools."),
        (r"data/atlas\.json", "data/atlas.json (browser agents: use the extracts in research/blueprint/atlas/, described in its README)"),
    ]
    for pattern, replacement in whole_lines:
        text = re.sub(pattern, replacement, text, flags=re.M)
    for pattern, replacement in replacements:
        text = re.sub(pattern, replacement, text)
    if re.search(r"/Users/|/private/|mcu22seu|/Downloads/", text):
        return None
    return text


def load():
    queue = json.loads((BP / "queue.json").read_text())
    atlas = json.loads((REPO / "data" / "atlas.json").read_text())
    return queue["jobs"], {r["id"]: r for r in atlas["roadmaps"]}, {s["id"]: s for s in atlas["stages"]}


def body(job, jobs, roadmaps, stages):
    lines = [f"**Job** `{job['id']}` · {KIND_TITLE.get(job['kind'], job['kind'])} · priority {job.get('priority')}", ""]
    rids = job.get("roadmapIds") or []
    for rid in rids:
        r = roadmaps.get(rid)
        if r:
            lines.append(f"Roadmap: **{r['title']}** (`{rid}`), [document]({BLOB}{r['sourcePath']})")
            decomposition = REPO / "data" / "decompositions" / (rid.replace(':', '_').replace('/', '_') + ".json")
            if decomposition.exists():
                lines.append(f"Reviewed decomposition already integrated: [{decomposition.name}]({BLOB}data/decompositions/{decomposition.name})")
        else:
            lines.append(f"Roadmap: `{rid}` (new; defined by this job)")
    if job.get("scope"):
        lines += ["", "Stages in scope:"]
        lines += [f"- `{sid}` — {stages[sid]['title']}" for sid in job["scope"] if sid in stages]
    if job.get("outputs"):
        lines += ["", "Deliverables:"] + [f"- `{path}`" for path in job["outputs"]]
    if job.get("after"):
        waiting = [dep for dep in job["after"] if not dep.startswith("LINK-")]
        links = len(job["after"]) - len(waiting)
        text = ", ".join(f"`{d}`" for d in waiting[:12])
        if links:
            text += (", " if text else "") + f"the {links} link jobs"
        lines += ["", f"Starts after: {text}."]
    if job.get("avoidAccountOf"):
        lines += ["", f"Must be done by a different agent from the one that did `{job['avoidAccountOf']}`."]
    reserved = json.loads((BP / "reserved-ids.json").read_text()) if (BP / "reserved-ids.json").exists() else {}
    mine = [nid for nid, v in reserved.items() if v.get("job") == job["id"]]
    if mine:
        lines += ["", "This job must provide nodes with exactly these ids:"] + [f"- `{nid}`: {reserved[nid]['statement']}" for nid in mine]
    prompt_path = REPO / job.get("prompt", "")
    public = publicize(prompt_path.read_text()) if job.get("prompt") and prompt_path.exists() else None
    lines += ["", "### How to work on this",
              f"- Rules: [PROTOCOL.md]({BLOB}research/blueprint/PROTOCOL.md) and [UPSTREAM_GUIDE.md]({BLOB}research/blueprint/UPSTREAM_GUIDE.md).",
              f"- From a browser: [BROWSER_AGENTS.md]({BLOB}research/blueprint/BROWSER_AGENTS.md) (resources, method, submission).",
              "- Comment `/claim` before starting; submit a pull request or attach the files to a comment on this issue.",
              ""]
    if job["id"] in LOCAL_ONLY:
        lines += ["This job relies on files that only the maintainer's local workers have (`local-only`).", ""]
    elif job["kind"] == "classify":
        lines += ["This job needs the zbMATH Open API, which browser sessions cannot reach, so it is done by the local workers (`local-only`).", ""]
    if public:
        lines += ["<details><summary>Full instructions (as given to the local workers, with local paths replaced)</summary>", "", "````text", public.strip(), "````", "", "</details>", ""]
    lines += ["<sub>Generated from the blueprint queue; local swarm workers claim the same jobs through the `state:` labels.</sub>"]
    return "\n".join(lines)


def title(job, roadmaps):
    kind = KIND_TITLE.get(job["kind"], job["kind"])
    jid = job["id"]
    rid = (job.get("roadmapIds") or [None])[0]
    name = roadmaps[rid]["title"] if rid in roadmaps else None
    part = ""
    if job.get("scope") and "--" in jid:
        first = job["scope"][0].split(":", 1)[-1].split("#")[-1]
        part = f" (part from {first[:40]})"
    special = {
        "PLAN-HABIRO": "[Plan] Habiro rings and Habiro cohomology: roadmap structure",
        "REV-PLAN-HABIRO": "[Review] Plan for Habiro rings and Habiro cohomology",
        "DESIGN-LV": "[New roadmap] The Mordell conjecture after Lawrence and Venkatesh",
        "DESIGN-ZAGIER": "[New roadmap] Zagier's conjecture via polylogarithms",
        "REV-DESIGN-LV": "[Review] New roadmap: the Mordell conjecture after Lawrence and Venkatesh",
        "REV-DESIGN-ZAGIER": "[Review] New roadmap: Zagier's conjecture via polylogarithms",
    }
    if jid in special:
        return special[jid]
    if job["kind"] == "classify":
        count = len(job.get("roadmapIds") or [])
        return f"[Classification] Batch {jid.split('-')[-1]}: subject classes and distance from Mathlib for {count} roadmaps"
    if job["kind"] == "naming":
        jobs_file = BP.parent / "expansion" / "naming" / "JOBS.json"
        area = ""
        if jobs_file.exists():
            area = next((j.get("galaxy", "") for j in json.loads(jobs_file.read_text())["jobs"] if j["id"] == jid), "")
        return f"[Planet names] {area or jid}"
    if job["kind"] == "review":
        target = (job.get("after") or [""])[0]
        if target.startswith("LINK-"):
            return f"[Review] Links: {name or rid}"
        if target.startswith("ASM-"):
            return f"[Review] Assembly: {name or rid}"
        return f"[Review] Blueprint: {name or rid}{part}"
    if job["kind"] == "link":
        return f"[Links] {name or rid}"
    return f"[{kind}] {name or rid or jid}{part}"[:240]


def labels_for(job, roadmaps):
    rid = (job.get("roadmapIds") or [None])[0]
    group = roadmaps[rid].get("group") if rid in roadmaps else None
    state = {"pending": "available", "running": "running", "done": "submitted", "external": "claimed"}.get(job.get("state"), "available")
    out = ["swarm", f"kind:{job['kind']}", f"priority:{job.get('priority', 9)}", f"state:{state}"]
    if job["id"] in LOCAL_ONLY or job["kind"] == "classify":
        out.append("local-only")
    if group and job["kind"] not in ("classify", "naming", "plan", "status"):
        out.append(f"area:{group}")
    return out


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("command", choices=["render", "publish", "sync", "refresh"])
    ap.add_argument("--kinds", default="blueprint,design,link,plan,review,assembly,classify,naming")
    ap.add_argument("--pace", type=float, default=7.5, help="seconds between issue creations (GitHub allows about 500 an hour)")
    ap.add_argument("--limit", type=int, default=0)
    ap.add_argument("--yes", action="store_true")
    args = ap.parse_args()
    jobs, roadmaps, stages = load()
    kinds = set(args.kinds.split(","))
    selected = [j for j in jobs if j["kind"] in kinds and j.get("state") in ("pending", "running")]
    selected.sort(key=lambda j: (j.get("priority", 9), j.get("order", 0), j["id"]))
    if args.limit:
        selected = selected[:args.limit]
    mapping_path = BP / "issues.json"
    mapping = json.loads(mapping_path.read_text()) if mapping_path.exists() else {}
    if args.command == "render":
        out = BP / "issues-preview"
        out.mkdir(exist_ok=True)
        for job in selected:
            (out / f"{job['id']}.md").write_text(f"# {title(job, roadmaps)}\n\nLabels: {', '.join(labels_for(job, roadmaps))}\n\n" + body(job, jobs, roadmaps, stages))
        print(f"rendered {len(selected)} issue bodies into {out.relative_to(REPO)}")
        return
    if args.command == "publish":
        if not args.yes:
            raise SystemExit("publish creates public GitHub issues; pass --yes to confirm")
        existing = set(subprocess.run(["gh", "label", "list", "--limit", "500", "--json", "name", "--jq", ".[].name"],
                                      capture_output=True, text=True, cwd=REPO).stdout.split())
        for job in selected:
            if job["id"] in mapping:
                continue
            import re, time
            for label in labels_for(job, roadmaps) + ["state:claimed", "state:running", "state:submitted", "state:done"]:
                if label not in existing:
                    colour = LABEL_COLOURS.get(label, "c5def5" if label.startswith("area:") else "ededed")
                    subprocess.run(["gh", "label", "create", label, "--force", "--color", colour], cwd=REPO, capture_output=True)
                    existing.add(label)
                    time.sleep(1)
            text = body(job, jobs, roadmaps, stages)
            if re.search(r"/Users/|/private/|mcu22seu", text):
                print("skipped (private path)", job["id"]); continue
            for attempt in range(6):
                result = subprocess.run(["gh", "issue", "create", "--title", title(job, roadmaps), "--body", text,
                                         *sum((["--label", label] for label in labels_for(job, roadmaps)), [])],
                                        capture_output=True, text=True, cwd=REPO)
                if result.returncode == 0:
                    break
                print("retry", job["id"], result.stderr.strip()[:160], flush=True)
                time.sleep(60 * (attempt + 1))
            if result.returncode != 0:
                print("failed", job["id"], result.stderr.strip()[:200], flush=True); continue
            mapping[job["id"]] = int(result.stdout.strip().rsplit("/", 1)[-1])
            mapping_path.write_text(json.dumps(mapping, indent=1) + "\n")
            print("created", job["id"], mapping[job["id"]], flush=True)
            time.sleep(args.pace)
        return
    if args.command == "sync":
        sync(mapping)
    if args.command == "refresh":
        import time
        for job in jobs:
            number = mapping.get(job["id"])
            if not number:
                continue
            text = body(job, jobs, roadmaps, stages)
            if re.search(r"/Users/|/private/|mcu22seu", text):
                print("skipped (private path)", job["id"]); continue
            result = subprocess.run(["gh", "issue", "edit", str(number), "--body", text], capture_output=True, text=True, cwd=REPO)
            print("refreshed" if result.returncode == 0 else "failed", job["id"], number, result.stderr.strip()[:120], flush=True)
            time.sleep(args.pace)


STATE_LABELS = ("state:available", "state:claimed", "state:running", "state:submitted", "state:done")
CLOSE_WHEN_DONE = {"review", "classify", "naming", "status", "assembly", "plan"}


def deliverables_complete(job):
    """Every output exists and, for batch jobs, covers every item of the batch."""
    paths = [REPO / path for path in job.get("outputs", [])]
    if not paths or not all(path.exists() for path in paths):
        return False
    try:
        if job["kind"] == "classify":
            result = json.loads(paths[0].read_text())
            covered = {entry.get("roadmapId") for entry in result}
            return (set(job.get("roadmapIds") or []) <= covered
                    and not any(entry.get("assessmentStatus") == "partial" for entry in result))
        if job["kind"] == "naming":
            wanted = {entry["id"] for entry in json.loads((REPO / "research" / "expansion" / "naming" / f"{job['id']}.json").read_text())}
            return wanted <= {entry.get("id") for entry in json.loads(paths[0].read_text())}
        if job["kind"] == "status":
            wanted = {stage["id"] for roadmap in json.loads((REPO / "research" / "expansion" / "status" / f"{job['id']}.json").read_text())
                      for stage in roadmap["stages"]}
            return wanted <= {entry.get("stageId") for entry in json.loads(paths[0].read_text())}
    except (OSError, ValueError, KeyError, TypeError):
        return False
    return True


def set_state(number, wanted, current):
    remove = [label for label in current if label in STATE_LABELS and label != wanted]
    command = ["gh", "issue", "edit", str(number), "--add-label", wanted]
    for label in remove:
        command += ["--remove-label", label]
    return subprocess.run(command, capture_output=True, text=True, cwd=REPO).returncode == 0


def sync(mapping):
    """Claims flow from GitHub into the queue; local progress flows back as labels."""
    import fcntl
    listing = subprocess.run(["gh", "issue", "list", "--label", "swarm", "--state", "all", "--limit", "2000",
                              "--json", "number,labels,state"], capture_output=True, text=True, cwd=REPO)
    if listing.returncode != 0:
        raise SystemExit("gh issue list failed: " + listing.stderr[:200])
    issues = {item["number"]: item for item in json.loads(listing.stdout)}
    lock = open(BP / ".queue.lock", "a+")
    fcntl.flock(lock, fcntl.LOCK_EX)
    changed_queue, edits, closed = 0, 0, 0
    try:
        queue = json.loads((BP / "queue.json").read_text())
        for job in queue["jobs"]:
            number = mapping.get(job["id"])
            item = issues.get(number)
            if not item:
                continue
            labels = [label["name"] for label in item["labels"]]
            state = job.get("state")
            if "state:claimed" in labels and state == "pending":
                job["state"] = "external"; job["note"] = f"claimed on GitHub issue #{number}"; changed_queue += 1
                continue
            # An external worker's submission has landed on main when every
            # deliverable exists; the job then counts as done, so its review runs.
            if state == "external" and deliverables_complete(job):
                job["state"] = "done"; job["note"] = f"deliverables arrived from the external worker on issue #{number}"
                job["finishedAt"] = __import__("datetime").datetime.now(__import__("datetime").timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
                changed_queue += 1
                state = "done"
            if state == "external" and "state:available" in labels:
                job["state"] = "pending"; job["note"] = f"released on GitHub issue #{number}"; changed_queue += 1
                state = "pending"
            wanted = {"pending": "state:available", "running": "state:running", "external": "state:claimed"}.get(state)
            if state == "done":
                wanted = "state:done" if (job["kind"] in CLOSE_WHEN_DONE or job.get("integrated")) else "state:submitted"
            if state in ("failed", "superseded"):
                wanted = None
            if wanted and wanted not in labels:
                edits += set_state(number, wanted, labels)
            if wanted == "state:done" and item["state"] == "OPEN":
                note = "Finished by the local swarm." if job.get("account") else "Finished."
                subprocess.run(["gh", "issue", "close", str(number), "--comment", note], capture_output=True, cwd=REPO)
                closed += 1
        if changed_queue:
            tmp = BP / "queue.json.tmp"
            tmp.write_text(json.dumps(queue, indent=1, ensure_ascii=False) + "\n")
            tmp.replace(BP / "queue.json")
    finally:
        fcntl.flock(lock, fcntl.LOCK_UN)
    print(f"sync: {changed_queue} queue change(s), {edits} label edit(s), {closed} issue(s) closed")


if __name__ == "__main__":
    main()
