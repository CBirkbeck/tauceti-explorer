#!/usr/bin/env python3
"""Re-pin roadmap citations from books nobody can open onto sources anyone can read.

  python3 research/blueprint/make_source_jobs.py design
      Writes research/blueprint/sources/jobs/SRC-<Roadmap>.json: for each roadmap,
      every restricted book a stage pins a chapter or theorem to, with the file and
      line of each citation (run where the atlas is edited; commit them).
  python3 research/blueprint/make_source_jobs.py queue --baseline <dir> --workers <dir>
      Appends a source job and an independent review job per roadmap to queue.json
      and writes their prompts (run on the swarm host).

A roadmap that pins a statement to a book behind a paywall stalls whoever picks
it up, and cannot be reviewed by anyone who does not own the book. Nearly all of
these are standard results with a free source that proves exactly the same thing
-- Milne's notes, the Stacks Project, Kirillov, Etingof, an author's own copy --
so the fix is to find that source, check the statement is really there, and move
the pin. Where no free source has it, the book stays, with the search recorded:
that is what tells us which books are worth buying.

scripts/sources.py --check keeps the result honest, and the access decisions live
in research/blueprint/sources/ACCESS.json.
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
OUT = BP / "sources" / "jobs"
sys.path.insert(0, str(REPO / "scripts"))
from sources import blocked, dependencies, documents, register, works  # noqa: E402

COMMON = """INPUTS
- Your batch: {BATCH} lists each restricted book this roadmap pins, and every citation of it with file and line.
- The roadmap: its document(s) under content/ and its extract research/blueprint/atlas/roadmaps/<file>.json.
- The access register: research/blueprint/sources/ACCESS.json records, for every cited work, whether a reader can get it and what free source covers it. research/blueprint/sources/REPORT.md is the report built from it.
- The pinned baseline: {BASELINE}/declarations.tsv, for checking whether a cited result is already in Mathlib or Tau Ceti.

WHAT COUNTS AS A FREE SOURCE
- The author's own copy, a publisher's open-access page, an institutional repository, arXiv, NUMDAM, the Stacks Project, an open journal.
- NOT a site that posts copies without permission, and NOT a copyrighted book sitting on an unrelated course page. `python3 scripts/sources.py --check` fails on the first and the register's note explains the second. If you are unsure whether a copy is authorised, treat it as not.
- Lecture notes and surveys count, as long as they contain the statement with a proof. A blog post asserting the result does not.

RULES
- The mathematics does not change. You are moving a citation, not editing a statement, a stage, a layer or the scope. If the free source proves something weaker -- fewer hypotheses discharged, a special case, a different normalisation -- it is NOT a substitute: say so and leave the book.
- Open the free source and find the statement before you cite it. Record the locator you actually read (chapter, theorem, section, page) and the URL. A catalogue entry, a table of contents or a search hit is not a reading.
- Do not swap one paywalled book for another.
- Where the result is already in Mathlib or Tau Ceti, say so and cite the declaration: that is better than any reference.
- Leave every other roadmap alone. Your deliverables are this roadmap's documents, the register, and your output file.
"""

JOB_TEMPLATE = """You are a mathematician working on the Tau Ceti Atlas. You run unattended in a tmux session as job {JOB}. Work in {REPO}. Your scratch directory is {WORKERS}/{JOB} (create it). Save as you go.

WHY: this roadmap pins {COUNT} of its statements to books that a reader cannot legally obtain without buying them. A stage nobody can read the source of cannot be checked, and it blocks whoever claims it. Most of these are standard results that a freely available source proves just as well.

ROADMAP: {ROADMAP} ({TITLE})

""" + COMMON + """
WHAT TO DO, for each citation in your batch
1. Read the roadmap at that line and write down the mathematical statement the citation supports -- what the stage needs from that book.
2. Search for a free source that contains that statement with a proof. Start with what the register already knows is free (Milne's notes, the Stacks Project, NSW, Kirillov, Etingof, Knapp, Kedlaya, Vakil, Conrad, Poonen, Wedhorn, Fulton's Algebraic Curves), then the author's own page, arXiv and open archives.
3. Open it. Find the statement. Compare hypotheses and generality against what the roadmap needs, exactly as you would for a source route.
4. If it matches: write the replacement line in your result. You do NOT edit the roadmap document, ACCESS.json or REPORT.md -- swarm submissions may not touch content/, and fifty jobs writing one register would collide. Give the line exactly as it stands now and exactly as it should read, changing only the citation: the same sentence, the same claim, a different reference. scripts/merge_source_results.py applies it once your review accepts it, and refuses any line that has moved since.
5. If nothing free matches: leave the citation alone and record what you searched, what you found and why it fell short. This is a real result, not a failure -- it is what decides which books are worth buying.

FINISH
- Write {OUTPUT}: a JSON object with
  "roadmap": "{ROADMAP}",
  "edits": [{{"file": <path>, "line": <int>, "old": <the line exactly as it is now>, "new": <the line exactly as it should read>}}] for every citation you are replacing,
  "citations": [{{"book": <id>, "file": <path>, "line": <int>, "statement": <what the pin needs>, "outcome": "replaced" | "kept", "source": <work id you cited, or null>, "locator": <what you read>, "url": <string or null>, "evidence": <what you checked>, "reason": <why kept, if kept>}}] covering every citation in the batch exactly once,
  "register": [{{"id": <SHORT-ID>, "title": <author, title>, "kind": "notes" | "book" | "article", "access": "free", "urls": [...], "match": [<regex matching how you cited it>], "note": <where it is posted and by whom>}}] for every free source you cited that ACCESS.json does not already list.
- Run `python3 scripts/sources.py --check` and `python3 -m unittest discover -s tests -p 'test_*.py'`. Both must pass.
- Commit only {OUTPUT}. Nothing else: a submission that touches another path is refused.
- Print a summary under 200 words: citations replaced, citations kept with the reason, and any book that is now cited by nothing.
"""

REVIEW_TEMPLATE = """You are reviewing job {TARGET_JOB} for the Tau Ceti Atlas, on a different account from the worker. You run unattended in a tmux session as job {JOB}. Work in {REPO}. Your scratch directory is {WORKERS}/{JOB} (create it).

WHY: a citation moved to a source that does not contain the statement is worse than the paywalled one it replaced -- it looks checked and is not. Your job is to re-read the sources, not the worker's notes.

WHAT TO CHECK, for every citation the worker marked "replaced" in {TARGET}
1. Open the free source at the locator given and read the statement. Does it prove what the roadmap pins to it, with the same hypotheses and the same generality? A near-miss is a failure.
2. Apply nothing yourself. Check the proposed replacement line reads as the same mathematics with a different reference, and that its `old` still matches the document at that line.
3. Is the source legitimately free -- the author's page, a publisher's open-access page, an institutional repository, arXiv, an open archive? A scan site or a copyrighted book on an unrelated course page is a failure, and `python3 scripts/sources.py --check` must pass.
4. Did the mathematics change? Compare each edit's `old` and `new`: statements, stages, layers and scope must be untouched.
5. For every citation marked "kept", spend a few minutes searching yourself before accepting it. Record whether you agree the book is needed.

""" + COMMON + """
FINISH
- Write {OUTPUT}, whose FIRST line is exactly `Verdict: accepted` or `Verdict: rejected` -- the merge step reads that line and merges nothing without it. Then your verdict per citation (`accepted` or `rejected` with the reason), what you opened to check each one, and whether the register additions in the result match what the roadmap now cites.
- Run `python3 scripts/sources.py --check` and the unit tests.
- Print a summary under 200 words. Reject the job if any replaced citation does not hold up; name it precisely so it can be fixed.
"""


def sites(name: str, work: dict, roots=(REPO / "content",)) -> list:
    """Every line that cites this work, as (path, line number, text)."""
    patterns = work.get("match", []) + [re.escape(url) for url in work.get("urls", [])]
    found = []
    for root in roots:
        for path in sorted(Path(root).rglob("*.md")):
            parts = path.relative_to(REPO / "content").parts
            owner = path.parent.name if len(parts) > 2 else path.stem
            if owner != name:
                continue
            for number, line in enumerate(path.read_text().splitlines(), 1):
                if any(re.search(pattern, line) for pattern in patterns):
                    found.append({"file": str(path.relative_to(REPO)), "line": number, "text": " ".join(line.split())[:400]})
    return found


def batches() -> list:
    """One batch per roadmap that pins a restricted book, worst first."""
    reg = register()
    docs = documents()
    index = works(reg)
    deps = dependencies(docs, reg, role="source")
    wanted = {work["id"] for work in blocked(deps, reg, "book")}
    atlas = json.loads((REPO / "data" / "atlas.json").read_text())
    ids = [roadmap["id"] for roadmap in atlas["roadmaps"]]
    titles = {roadmap["id"]: roadmap["title"] for roadmap in atlas["roadmaps"]}

    grouped: dict = {}
    for wid in wanted:
        for name in deps[wid]:
            grouped.setdefault(name, []).append(wid)

    found = []
    for name, wids in grouped.items():
        roadmap_ids = [i for i in ids if i == name or i.endswith("/" + name)]
        books = []
        for wid in sorted(wids):
            citations = sites(name, index[wid])
            if citations:
                books.append({"id": wid, "title": index[wid]["title"], "note": index[wid].get("note", ""),
                              "citations": citations})
        if books:
            found.append({"id": f"SRC-{name}", "roadmap": name, "roadmapIds": roadmap_ids,
                          "title": titles.get(roadmap_ids[0], name) if roadmap_ids else name,
                          "books": books, "citationCount": sum(len(b["citations"]) for b in books)})
    return sorted(found, key=lambda batch: (-batch["citationCount"], batch["roadmap"]))


def design() -> None:
    OUT.mkdir(parents=True, exist_ok=True)
    for old in OUT.glob("SRC-*.json"):
        old.unlink()
    found = batches()
    for batch in found:
        (OUT / f"{batch['id']}.json").write_text(json.dumps(batch, indent=1, ensure_ascii=False) + "\n")
    print(f"{len(found)} roadmaps, {sum(b['citationCount'] for b in found)} citations, "
          f"{sum(len(b['books']) for b in found)} books to re-pin")
    for batch in found[:10]:
        print(f"  {batch['citationCount']:3d} citations  {batch['roadmap']} ({len(batch['books'])} books)")


def queue(baseline: str, workers: str) -> None:
    jobs, prompts = [], {}
    fill = dict(REPO=str(REPO), BASELINE=baseline, WORKERS=workers)
    for order, path in enumerate(sorted(OUT.glob("SRC-*.json"))):
        batch = json.loads(path.read_text())
        job_id = batch["id"]
        # The one file the worker may submit. Swarm submissions are confined to
        # research/blueprint/<dir>/<file>, so the roadmap documents are edited here, from
        # the edits the result proposes, once the review accepts them.
        output = f"research/blueprint/sources/{job_id}.result.json"
        text = JOB_TEMPLATE.format(**fill, JOB=job_id, ROADMAP=batch["roadmap"], TITLE=batch["title"],
                                   COUNT=batch["citationCount"], BATCH=str(path.relative_to(REPO)), OUTPUT=output)
        jobs.append(({"id": job_id, "kind": "sources", "priority": 2, "order": 900 - batch["citationCount"],
                      "name": batch["roadmap"], "roadmapIds": batch["roadmapIds"], "outputs": [output],
                      "after": [], "state": "pending", "timeout": 6 * 3600}, text))
        review_id = f"REV-{job_id}"
        review_output = f"research/blueprint/reviews/{review_id}.md"
        rtext = REVIEW_TEMPLATE.format(**fill, JOB=review_id, TARGET_JOB=job_id, TARGET=output,
                                       BATCH=str(path.relative_to(REPO)), OUTPUT=review_output)
        jobs.append(({"id": review_id, "kind": "review", "priority": 3, "order": 900 - batch["citationCount"],
                      "name": batch["roadmap"], "roadmapIds": batch["roadmapIds"],
                      "outputs": [review_output], "after": [job_id], "avoidAccountOf": job_id,
                      "state": "pending", "timeout": 4 * 3600}, rtext))

    (BP / "prompts").mkdir(exist_ok=True)
    (REPO / "research" / "blueprint" / "sources" / "results").mkdir(parents=True, exist_ok=True)
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
    print(f"{len(added)} source and review jobs added; {len(jobs) - len(added)} were already queued")


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
