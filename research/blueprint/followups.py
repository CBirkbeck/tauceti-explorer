#!/usr/bin/env python3
"""Queue continuation rounds for blueprint work that is not finished.

A blueprint (or design) job whose review has finished is continued when:
- its packet is still "partial" with remaining work, or
- its review verdict is "needs_changes".
The continuation reuses the original prompt with a preface that points at the
review report, and is followed by a fresh independent review. At most
MAX_ROUNDS continuation rounds are queued per job. Run it periodically:

  python3 research/blueprint/followups.py [--dry-run]
"""
from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
BP = REPO / "research" / "blueprint"
MAX_ROUNDS = 3

PREFACE = """CONTINUATION ROUND {ROUND} of job {BASE}.
Earlier rounds wrote {OUTPUTS}, and an independent reviewer has checked them (report: research/blueprint/reviews/{REVIEW}.md; verdict and notes: the "review" object inside the packet).
Before anything else:
1. Read the review report and the packet's review object. Fix every problem they raise.
2. Then continue the blueprint: close the stages whose coverage is not yet "closed", following their `remaining` lists, and resolve gaps where the sources allow.
3. Keep the nodes the reviewer verified. Do not renumber ids. Leave the existing "review" object in place: the next reviewer replaces it.
4. Record in research/blueprint/handoff/{JOB}.md what this round changed.
The original instructions follow.

"""


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()
    import fcntl
    lock = open(BP / ".queue.lock", "a+")
    fcntl.flock(lock, fcntl.LOCK_EX)
    try:
        queue = json.loads((BP / "queue.json").read_text())
        jobs = {j["id"]: j for j in queue["jobs"]}
        added = []
        for job in list(queue["jobs"]):
            if job["kind"] != "review" or job.get("state") != "done":
                continue
            target_id = job["after"][0] if job.get("after") else None
            target = jobs.get(target_id)
            if not target or target["kind"] not in ("blueprint", "design"):
                continue
            base = re.sub(r"~\d+$", "", target_id)
            round_no = int(target_id.rsplit("~", 1)[1]) + 1 if "~" in target_id else 2
            if round_no > MAX_ROUNDS + 1:
                continue
            next_id = f"{base}~{round_no}"
            if next_id in jobs:
                continue
            packets = [REPO / p for p in target.get("outputs", []) if p.endswith(".json") and "/packets/" in p]
            unfinished, verdict = False, None
            for path in packets:
                if not path.exists():
                    unfinished = True
                    continue
                try:
                    packet = json.loads(path.read_text())
                except json.JSONDecodeError:
                    unfinished = True
                    continue
                verdict = (packet.get("review") or {}).get("status")
                open_stages = [c for c in packet.get("coverage", []) if c.get("status") != "closed"]
                if packet.get("status") != "closed" and (open_stages or packet.get("gaps")):
                    unfinished = True
                if verdict == "needs_changes":
                    unfinished = True
            if not unfinished:
                continue
            original = (REPO / jobs[base]["prompt"]).read_text()
            prompt_path = f"research/blueprint/prompts/{next_id}.md"
            text = PREFACE.format(ROUND=round_no, BASE=base, OUTPUTS=", ".join(target.get("outputs", [])),
                                  REVIEW=job["id"], JOB=next_id) + original
            review_id = f"REV-{next_id[3:] if next_id.startswith('BP-') else next_id}"
            review_prompt = (REPO / jobs[job["id"]]["prompt"]).read_text().replace(job["id"], review_id)
            added.append(({"id": next_id, "kind": target["kind"], "priority": target.get("priority", 3), "order": target.get("order", 0),
                           "roadmapIds": target.get("roadmapIds", []), "scope": target.get("scope"), "outputs": target.get("outputs", []),
                           "after": [job["id"]], "state": "pending", "prompt": prompt_path, "timeout": target.get("timeout")}, text,
                          {"id": review_id, "kind": "review", "priority": 2, "order": job.get("order", 0),
                           # A review writes its verdict into the files it reviews (PROTOCOL.md section 8).
                           "roadmapIds": job.get("roadmapIds", []),
                           "outputs": [f"research/blueprint/reviews/{review_id}.md"] + [p for p in target.get("outputs", []) if p.endswith((".json", ".lean"))],
                           "after": [next_id], "avoidAccountOf": next_id, "state": "pending",
                           "prompt": f"research/blueprint/prompts/{review_id}.md"}, review_prompt))
        for cont, text, review, review_text in added:
            print("queue", cont["id"], "and", review["id"])
            if args.dry_run:
                continue
            (REPO / cont["prompt"]).write_text(text)
            (REPO / review["prompt"]).write_text(review_text)
            queue["jobs"] += [{k: v for k, v in cont.items() if v is not None}, review]
        if added and not args.dry_run:
            tmp = BP / "queue.json.tmp"
            tmp.write_text(json.dumps(queue, indent=1, ensure_ascii=False) + "\n")
            tmp.replace(BP / "queue.json")
        print(f"{len(added)} continuation round(s) queued")
    finally:
        fcntl.flock(lock, fcntl.LOCK_UN)


if __name__ == "__main__":
    main()
