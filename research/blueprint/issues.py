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
import json
import subprocess
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
BP = REPO / "research" / "blueprint"
GITHUB = "https://github.com/CBirkbeck/tauceti-explorer"
BLOB = GITHUB + "/blob/main/"
KIND_TITLE = {"blueprint": "Blueprint", "design": "New roadmap", "link": "Links", "review": "Review", "assembly": "Assembly",
              "plan": "Plan", "classify": "Classification", "naming": "Planet names", "status": "Status mapping"}


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
    lines += ["", "### How to work on this",
              f"- Rules: [PROTOCOL.md]({BLOB}research/blueprint/PROTOCOL.md) and [UPSTREAM_GUIDE.md]({BLOB}research/blueprint/UPSTREAM_GUIDE.md).",
              f"- From a browser: [BROWSER_AGENTS.md]({BLOB}research/blueprint/BROWSER_AGENTS.md) (resources, method, submission).",
              "- Comment `/claim` before starting; submit a pull request or attach the files to a comment on this issue.",
              "", "<sub>Generated from the blueprint queue; local swarm workers claim the same jobs through the `state:` labels.</sub>"]
    return "\n".join(lines)


def title(job, roadmaps):
    rid = (job.get("roadmapIds") or [None])[0]
    name = roadmaps[rid]["title"] if rid in roadmaps else (rid or job["id"])
    part = f" — {job['scope'][0].split(':', 1)[-1].split('#')[-1][:40]}…" if job.get("scope") and job["id"].count("--") else ""
    return f"[{KIND_TITLE.get(job['kind'], job['kind'])}] {name}{part}"[:240]


def labels_for(job, roadmaps):
    rid = (job.get("roadmapIds") or [None])[0]
    group = roadmaps[rid].get("group") if rid in roadmaps else None
    out = ["swarm", f"kind:{job['kind']}", f"priority:{job.get('priority', 9)}",
           "state:available" if job.get("state") == "pending" else f"state:{job.get('state')}"]
    if group:
        out.append(f"area:{group}")
    return out


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("command", choices=["render", "publish", "sync"])
    ap.add_argument("--kinds", default="blueprint,design,link,plan,review,assembly")
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
            for label in labels_for(job, roadmaps):
                if label not in existing:
                    subprocess.run(["gh", "label", "create", label, "--force"], cwd=REPO, capture_output=True)
                    existing.add(label)
            result = subprocess.run(["gh", "issue", "create", "--title", title(job, roadmaps), "--body", body(job, jobs, roadmaps, stages),
                                     *sum((["--label", label] for label in labels_for(job, roadmaps)), [])],
                                    capture_output=True, text=True, cwd=REPO)
            if result.returncode != 0:
                print("failed", job["id"], result.stderr.strip()[:200]); continue
            mapping[job["id"]] = int(result.stdout.strip().rsplit("/", 1)[-1])
            mapping_path.write_text(json.dumps(mapping, indent=1) + "\n")
            print("created", job["id"], mapping[job["id"]])
        return
    if args.command == "sync":
        print("sync: not yet enabled; issues are mirrored only after the maintainer confirms the setup")


if __name__ == "__main__":
    main()
