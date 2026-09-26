#!/usr/bin/env python3
"""Source every layer of the roadmaps that source none, and credit whoever proved it.

  python3 research/blueprint/make_attribution_jobs.py design
      Writes research/blueprint/attribution/jobs/ATT-<Roadmap>.json for each roadmap
      where no layer names a source, or whose document has no sources section:
      the document, every layer with its heading line, and what the register
      already knows is free (run where the atlas is edited; commit them).
  python3 research/blueprint/make_attribution_jobs.py queue --baseline <dir> --workers <dir>
      Appends an attribution job and an independent review per roadmap to
      queue.json and writes their prompts (run on the swarm host).

A layer that asks for a theorem without saying whose is unreviewable and
uncredited at once: nobody can check the statement against its source, and the
mathematician who proved it goes unnamed. The audit (scripts/audit_roadmaps.py)
found 1,311 such layers across 70 roadmaps with none cited at all. These jobs
put a source on each -- a freely readable one wherever one exists -- and give
the document the sources section that credits every work it draws on. The
result is a set of proposed edits, applied by scripts/merge_source_results.py
once an independent review accepts them, exactly as the source jobs are.
"""
from __future__ import annotations

import argparse
import fcntl
import json
import os
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
BP = REPO / "research" / "blueprint"
OUT = BP / "attribution" / "jobs"
sys.path.insert(0, str(REPO / "scripts"))
from audit_roadmaps import citation_gaps, sourceless  # noqa: E402
from sources import register  # noqa: E402

HEADING = re.compile(r"^#{2,4}\s+(.+?)\s*$")

COMMON = """INPUTS
- Your batch: {BATCH} names the document, every layer with the line its heading is on, and whether the document has a sources section.
- The roadmap document itself, under content/, and its extract research/blueprint/atlas/roadmaps/<file>.json.
- The access register, research/blueprint/sources/ACCESS.json: every work the roadmaps cite, whether a reader can get it, and the free source that covers it where one is known. Its free works are the first place to look.
- PROTOCOL.md, and content/campaign-guide/AI_EXECUTION.md item 3 on sources.

WHAT A SOURCE IS
- A work that STATES AND PROVES what the layer asks: author, title, and the locator you read (theorem, section, page), with a url when the work is online. A survey or lecture notes count when they contain the proof; a catalogue entry, an abstract or a mention does not.
- Freely readable wherever one exists: arXiv, an author's own page, an institutional repository, the Stacks Project, NUMDAM, an open journal. A book behind a paywall may be cited only when nothing free proves the statement, and then it goes in your register entries as restricted with the reason.
- Never a site that posts copies without permission, and never a copyrighted book parked on an unrelated course page. `python3 scripts/sources.py --check` fails on both.
- Where a layer asks for something original to this roadmap -- a construction nobody has written up, an API contract, a glue lemma -- say so in the source line ("original to this roadmap; the nearest published treatment is ...") rather than inventing a citation. An honest "no source" is a finding; a decorative one is a lie.

RULES
- The mathematics does not change. You add a source line; you do not touch a statement, a hypothesis, a stage or the scope. If reading the source shows the layer asks for something the source does not give -- a stronger conclusion, fewer hypotheses -- record that under `gaps` and leave the layer as it is.
- Credit is by name. A source line names the authors as the work does.
- One line per layer, placed as the last line of the layer's section, in the form the corpus already uses: `*Source:* Author(s), *Title*, locator (url).`
"""

JOB_TEMPLATE = """You are a mathematician working on the Tau Ceti Atlas. You run unattended in a tmux session as job {JOB}. Work in {REPO}. Your scratch directory is {WORKERS}/{JOB} (create it). Save as you go.

WHY: {COUNT} of this roadmap's {TOTAL} layers name no source for what they ask{SECTION_NOTE}. A layer without a source cannot be checked against anything and credits nobody. You are putting a source on each, freely readable wherever one exists, and giving the document a sources section that credits every work it draws on.

ROADMAP: {ROADMAP} — {TITLE}
DOCUMENT: {DOCUMENT}

""" + COMMON + """
WHAT TO DO
1. Read the whole document once, then each layer in your batch. For each, write down the statement it needs and the standard of proof it expects.
2. Find the source. Start with the register's free works, then the author's page, arXiv, the Stacks Project, NUMDAM and open journals. Open it and find the statement; compare hypotheses and generality against what the layer asks. Only then cite it.
3. Write the source line as an edit: the line as it stands now (the last line of the layer's section, or its heading when the section is empty) and the line as it should read with the source line added after it. Give exact text: scripts/merge_source_results.py applies edits by matching the current line and refuses any that has moved.
4. If the document has no sources section, propose one as an edit appended after the last line of the document: `## Sources` followed by one line per work, authors named, url where online, and which layers use it. If it has one, add any work you cited that it lacks.
5. While reading, note any standard result in this area that no layer covers, with the source that states it, under `gaps`. That is planning evidence for the roadmap's owner; do not add layers yourself.

FINISH
- Write {OUTPUT}: {{"roadmap": "{ROADMAP}",
   "sources": [{{"stage": <layer id>, "work": <register id or new id>, "title": <author(s), title>, "locator": <what you read>, "url": <string or null>, "free": true|false, "note": <"original to this roadmap" or why restricted, where it applies>}}] covering every layer in the batch exactly once,
   "edits": [{{"file": <document path>, "line": <int>, "old": <the line exactly as it is now>, "new": <the line as it should read>}}],
   "register": [{{"id": <SHORT-ID>, "kind": "book" | "article" | "notes", "access": "free" | "restricted", "title": <author, title>, "urls": [...], "match": [<regex matching how you cited it>], "note": <where it is posted and by whom, or why it is restricted>}}] for every work ACCESS.json does not already list,
   "gaps": [{{"statement": ..., "source": ..., "why": ...}}]}}
- Run `python3 scripts/sources.py --check` and `python3 -m unittest discover -s tests -p 'test_*.py'`; both must pass.
- Commit only {OUTPUT}. Nothing else: a submission that touches another path is refused.
- Print a summary under 200 words: layers sourced free, layers sourced restricted, layers original to the roadmap, and gaps found.
"""

REVIEW_TEMPLATE = """You are reviewing job {TARGET_JOB} for the Tau Ceti Atlas, on a different account from the worker. You run unattended in a tmux session as job {JOB}. Work in {REPO}. Your scratch directory is {WORKERS}/{JOB} (create it).

WHY: a source line that names a work which does not prove the statement is worse than none -- it looks checked and credits the wrong person. Your job is to open the sources, not to read the worker's notes.

ROADMAP: {ROADMAP} — {TITLE}
RESULT UNDER REVIEW: {TARGET}

""" + COMMON + """
WHAT TO CHECK
1. For every entry in `sources`, open the work at the locator and read the statement. Does it prove what the layer asks, with the same hypotheses and generality? A near-miss is a failure. Confirm the authors are named as the work names them.
2. Is each source legitimately free where it says so -- the author's page, a repository, arXiv, an open archive? A scan site or a copyrighted book on an unrelated course page is a failure.
3. For every entry marked original to the roadmap, spend a few minutes looking yourself before accepting that nothing published proves it.
4. Check each edit's `old` still matches the document at that line, and that `new` adds a source line and changes nothing else.
5. Check the proposed sources section credits every work the edits cite, and nothing the edits do not.

FINISH
- Write {OUTPUT}, whose FIRST line is exactly `Verdict: accepted` or `Verdict: rejected` -- the merge step reads that line and merges nothing without it. Then your verdict per source, what you opened to check it, and your view of the gaps recorded.
- Run `python3 scripts/sources.py --check` and the unit tests.
- Print a summary under 200 words. Reject if any source does not hold up; name it precisely.
"""


def batches() -> list:
    atlas = json.loads((REPO / "data" / "atlas.json").read_text())
    roadmaps = {r["id"]: r for r in atlas["roadmaps"]}
    stages = atlas["stages"]
    gaps = citation_gaps(stages)
    missing_section = set(sourceless(roadmaps))
    reg = register()
    free = [{"id": w["id"], "title": w["title"], "urls": w.get("urls", [])}
            for w in reg["works"] if w.get("access") == "free"]
    found = []
    for rid, roadmap in roadmaps.items():
        uncited, total = gaps.get(rid, (0, 0))
        if not total or not (uncited == total or rid in missing_section):
            continue
        path = REPO / roadmap["sourcePath"]
        if not path.exists():
            continue
        lines = path.read_text().splitlines()
        layers = []
        for stage in stages:
            if stage["owner"] != rid:
                continue
            line = stage.get("sourceLine")
            heading = lines[line - 1] if line and 1 <= line <= len(lines) else ""
            layers.append({"id": stage["id"], "key": stage.get("key"), "title": stage["title"],
                           "headingLine": line, "heading": heading, "cited": bool(re.search(r"\*Source", stage.get("description") or ""))})
        short = rid.split("/")[-1].replace("tauceti:TauCetiRoadmap/", "")
        found.append({"id": f"ATT-{short}", "roadmap": rid, "title": roadmap["title"],
                      "document": roadmap["sourcePath"], "documentLines": len(lines),
                      "sourcesSection": rid not in missing_section, "uncited": uncited, "layers": layers,
                      "knownFree": free})
    return sorted(found, key=lambda b: (-b["uncited"], b["roadmap"]))


def design() -> None:
    OUT.mkdir(parents=True, exist_ok=True)
    for old in OUT.glob("ATT-*.json"):
        old.unlink()
    found = batches()
    for batch in found:
        (OUT / f"{batch['id']}.json").write_text(json.dumps(batch, indent=1, ensure_ascii=False) + "\n")
    print(f"{len(found)} roadmaps, {sum(b['uncited'] for b in found)} layers without a source, "
          f"{sum(1 for b in found if not b['sourcesSection'])} documents without a sources section")
    for batch in found[:8]:
        print(f"  {batch['uncited']:3d} of {len(batch['layers']):3d}  {batch['id']}")


def queue(baseline: str, workers: str) -> None:
    jobs = []
    fill = dict(REPO=str(REPO), BASELINE=baseline, WORKERS=workers)
    (BP / "attribution").mkdir(exist_ok=True)
    for path in sorted(OUT.glob("ATT-*.json")):
        batch = json.loads(path.read_text())
        job_id = batch["id"]
        output = f"research/blueprint/attribution/{job_id}.result.json"
        note = "" if batch["sourcesSection"] else ", and the document has no sources section"
        text = JOB_TEMPLATE.format(**fill, JOB=job_id, ROADMAP=batch["roadmap"], TITLE=batch["title"],
                                   DOCUMENT=batch["document"], COUNT=batch["uncited"], TOTAL=len(batch["layers"]),
                                   SECTION_NOTE=note, BATCH=str(path.relative_to(REPO)), OUTPUT=output)
        jobs.append(({"id": job_id, "kind": "attribution", "priority": 2, "order": 900 - batch["uncited"],
                      "name": batch["roadmap"].split("/")[-1], "roadmapIds": [batch["roadmap"]],
                      "outputs": [output], "after": [], "state": "pending", "timeout": 6 * 3600}, text))
        review_id = f"REV-{job_id}"
        review_output = f"research/blueprint/reviews/{review_id}.md"
        rtext = REVIEW_TEMPLATE.format(**fill, JOB=review_id, TARGET_JOB=job_id, ROADMAP=batch["roadmap"],
                                       TITLE=batch["title"], TARGET=output, BATCH=str(path.relative_to(REPO)),
                                       OUTPUT=review_output)
        jobs.append(({"id": review_id, "kind": "review", "priority": 3, "order": 900 - batch["uncited"],
                      "name": batch["roadmap"].split("/")[-1], "roadmapIds": [batch["roadmap"]],
                      "outputs": [review_output], "after": [job_id], "avoidAccountOf": job_id,
                      "state": "pending", "timeout": 4 * 3600}, rtext))
    path = BP / "queue.json"
    lock = open(BP / ".queue.lock", "w")
    fcntl.flock(lock, fcntl.LOCK_EX)
    try:
        data = json.loads(path.read_text())
        known = {job["id"] for job in data["jobs"]}
        added = []
        for job, text in jobs:
            if job["id"] in known:
                continue
            prompt = f"research/blueprint/prompts/{job['id']}.md"
            (REPO / prompt).write_text(text)
            job["prompt"] = prompt
            added.append(job)
        data["jobs"] += added
        tmp = path.with_suffix(".json.tmp")
        tmp.write_text(json.dumps(data, indent=1, ensure_ascii=False) + "\n", encoding="utf-8")
        os.replace(tmp, path)
    finally:
        fcntl.flock(lock, fcntl.LOCK_UN)
    print(f"{len(added)} attribution and review jobs added; {len(jobs) - len(added)} were already queued")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("command", choices=["design", "queue"])
    parser.add_argument("--baseline")
    parser.add_argument("--workers")
    args = parser.parse_args()
    if args.command == "design":
        design()
    else:
        if not args.baseline or not args.workers:
            parser.error("queue needs --baseline and --workers")
        queue(args.baseline, args.workers)
    return 0


if __name__ == "__main__":
    sys.exit(main())
