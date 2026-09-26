#!/usr/bin/env python3
"""Check the findings that quote a statement against the version of record.

  python3 research/blueprint/make_collation_jobs.py design
      Writes research/blueprint/collation/jobs/COL-<paper>.json: for each exposed
      paper that has an open copy a worker can fetch, the copy's url, the record
      files holding its findings, and every finding that quotes a stated result
      (run where the atlas is edited; commit them).
  python3 research/blueprint/make_collation_jobs.py queue --baseline <dir> --workers <dir>
      Appends a collation job and an independent review per paper to queue.json
      and writes their prompts (run on the swarm host).

A published paper and its preprint are different documents. BSTTTZ's Theorem
1.3(a) gained a factor between arXiv v1 and the Journal of the AMS, and a finding
written against the preprint accused the published theorem of needing to be
withdrawn. scripts/collation.py lists the papers where that could still be true:
these jobs settle the ones whose version of record can actually be fetched. The
rest are in research/blueprint/collation/REQUESTS.md, for a person with a browser.
"""
from __future__ import annotations

import argparse
import fcntl
import json
import os
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
BP = REPO / "research" / "blueprint"
OUT = BP / "collation" / "jobs"
sys.path.insert(0, str(REPO / "scripts"))
from collation import exposure, provenance, records, stated  # noqa: E402

COMMON = """INPUTS
- Your batch: {BATCH} names the paper, the copy to read, the files that hold its findings, and every finding that quotes a stated result.
- The findings themselves, in the files the batch names.
- PROTOCOL.md section 18 for the record's shape, including `sourceVersions`.

WHAT COUNTS AS THE VERSION OF RECORD
- The published article: right journal, volume, year and pagination. Check the copy you fetch really is that, and not the accepted manuscript or a preprint with a journal cover sheet. Say which it is.
- If the copy turns out not to be the published text, stop and record that: a wrong collation is worse than none, because it claims a check nobody made.
"""

JOB_TEMPLATE = """You are a mathematician working on the Tau Ceti Atlas. You run unattended in a tmux session as job {JOB}. Work in {REPO}. Your scratch directory is {WORKERS}/{JOB} (create it). Save as you go.

WHY: this paper's findings were read from a preprint, and {COUNT} of them quote a stated result. A published paper and its preprint differ, so each of those claims may be about a sentence the published paper no longer contains. You are checking them against the published text, which is fetchable here.

PAPER: {PAPER} — {CITATION}
COPY TO READ: {COPY}

""" + COMMON + """
WHAT TO DO
1. Fetch the copy and confirm what it is. You do NOT edit the record files the batch names -- they are your inputs, and the orchestrator merges your result into them. Everything you find goes in {RESULT}.
2. For every finding in the batch, find its locator in the published text and compare the finding's `printed` field with the printed sentence, word by word.
   - Identical: record it as `"outcome": "identical"`.
   - Different: the finding belongs to the preprint. Record `"outcome": "preprint-only"`, the published sentence, and whether the published statement is correct. If the published version fixes what the finding reports, that is "corrected in print" -- a real result, and the finding stays as a record of the preprint's defect.
   - Absent: `"outcome": "absent"`. A statement the published paper does not contain cannot be a mistake in it.
3. Change no mathematics of your own. You are comparing sentences, not re-deriving the finding. Where the published text differs in a way that makes the finding's reasoning moot, say that and stop there.

FINISH
- Write {RESULT}: {{"paper": "{PAPER}", "sourceVersions": [{{"kind": "published" | "preprint" | "author copy", "url": ..., "read": "<today>", "sha256": ...}}], "findings": [{{"id": <finding id>, "outcome": "identical" | "preprint-only" | "absent", "published": <the printed sentence where it differs>, "verdict": <what the finding is now against, and whether the published statement is correct>, "evidence": <what you read>}}]}}, covering every finding in the batch exactly once.
- Run `python3 -m unittest discover -s tests -p 'test_*.py'`.
- Commit only {RESULT}. Nothing else: a submission that touches another path is refused.
- Print a summary under 200 words: how many findings were identical, how many belonged to the preprint, and any statement the published paper does not contain.
"""

REVIEW_TEMPLATE = """You are reviewing job {TARGET_JOB} for the Tau Ceti Atlas, on a different account from the worker. You run unattended in a tmux session as job {JOB}. Work in {REPO}. Your scratch directory is {WORKERS}/{JOB} (create it).

WHY: a collation that says "identical" without opening the published text is worse than no collation, because the register then claims a check nobody made.

PAPER: {PAPER} — {CITATION}
COPY TO READ: {COPY}

""" + COMMON + """
WHAT TO CHECK
1. Fetch the same copy yourself and confirm it is the published text.
2. Take every finding the worker marked identical and read the printed sentence at its locator. A paraphrase is not identical.
3. For each finding the worker re-scoped to the preprint, check the published sentence they quote really is what the paper prints, and that the verdict now says which text it is against.
4. Confirm `sourceVersions` records what was actually read, with a hash where the file allows one.

FINISH
- Write {OUTPUT}, whose FIRST line is exactly `Verdict: accepted` or `Verdict: rejected`, then your verdict per finding and what you opened to check it.
- Run `python3 scripts/collation.py` and the unit tests.
- Print a summary under 200 words. Reject if any "identical" verdict does not hold; name it precisely.
"""


def batches() -> list:
    """One batch per exposed paper whose published text can be fetched."""
    papers = {entry["id"]: entry for entry in json.loads((BP / "papers" / "papers.json").read_text())["papers"]}
    found = records()
    resolved = {row["paper"]: row for row in json.loads((REPO / "data" / "collation.json").read_text())["exposed"]}
    batches = []
    for row in exposure(found, papers):
        known = resolved.get(row["paper"]) or {}
        copy = (known.get("openAlex") or {}).get("copy")
        if not copy or not known.get("readable"):
            # Either no copy of the published version, or the publisher answers a script
            # with a challenge page. Both belong in REQUESTS.md, for a person with a browser.
            continue
        # The records that hold the findings are INPUTS. Naming them as deliverables made each
        # job finished before it began -- they already exist, so the sync marked five jobs done
        # with nothing done. The deliverable is the result, which the orchestrator then merges.
        files = sorted({str(path.relative_to(REPO)) for path in
                        (BP / "papers").glob(f"{row['paper']}.result.json")}
                       | {str(path.relative_to(REPO)) for path in (BP / "errata").glob(f"{row['paper']}.json")})
        quoted = [{"id": item.get("id"), "locator": item.get("locator"), "printed": item.get("printed"),
                   "kind": item.get("kind"), "known": item.get("known")}
                  for item in stated(found[row["paper"]])]
        batches.append({"id": f"COL-{row['paper'].replace('PAPER-', '')}", "paper": row["paper"],
                        "citation": row["citation"], "copy": copy, "readFrom": provenance(found[row["paper"]]),
                        "files": files, "result": f"research/blueprint/collation/{f'COL-{row["paper"].replace("PAPER-", "")}'}.result.json",
                        "findings": quoted})
    return sorted(batches, key=lambda batch: (-len(batch["findings"]), batch["paper"]))


def design() -> None:
    OUT.mkdir(parents=True, exist_ok=True)
    for old in OUT.glob("COL-*.json"):
        old.unlink()
    found = batches()
    for batch in found:
        (OUT / f"{batch['id']}.json").write_text(json.dumps(batch, indent=1, ensure_ascii=False) + "\n")
    print(f"{len(found)} papers, {sum(len(b['findings']) for b in found)} quoted statements to collate")
    for batch in found[:10]:
        print(f"  {len(batch['findings']):3d}  {batch['paper']}")


def queue(baseline: str, workers: str) -> None:
    jobs = []
    fill = dict(REPO=str(REPO), BASELINE=baseline, WORKERS=workers)
    for path in sorted(OUT.glob("COL-*.json")):
        batch = json.loads(path.read_text())
        job_id = batch["id"]
        text = JOB_TEMPLATE.format(**fill, JOB=job_id, PAPER=batch["paper"], CITATION=batch["citation"],
                                   COPY=batch["copy"], COUNT=len(batch["findings"]),
                                   BATCH=str(path.relative_to(REPO)), RESULT=batch["result"])
        jobs.append(({"id": job_id, "kind": "collation", "priority": 2, "order": 900 - len(batch["findings"]),
                      "name": batch["paper"], "roadmapIds": [], "outputs": [batch["result"]], "after": [],
                      "state": "pending", "timeout": 5 * 3600}, text))
        review_id = f"REV-{job_id}"
        review_output = f"research/blueprint/reviews/{review_id}.md"
        rtext = REVIEW_TEMPLATE.format(**fill, JOB=review_id, TARGET_JOB=job_id, PAPER=batch["paper"],
                                       CITATION=batch["citation"], COPY=batch["copy"],
                                       BATCH=str(path.relative_to(REPO)), OUTPUT=review_output)
        jobs.append(({"id": review_id, "kind": "review", "priority": 3, "order": 900 - len(batch["findings"]),
                      "name": batch["paper"], "roadmapIds": [], "outputs": [review_output], "after": [job_id],
                      "avoidAccountOf": job_id, "state": "pending", "timeout": 4 * 3600}, rtext))

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
    print(f"{len(added)} collation and review jobs added; {len(jobs) - len(added)} were already queued")


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
