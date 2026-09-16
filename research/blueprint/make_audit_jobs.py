#!/usr/bin/env python3
"""The library audit: what the pinned Mathlib and Tau Ceti already contain.

  python3 research/blueprint/make_audit_jobs.py design
      Writes research/blueprint/audit/AUDIT-NN.json: batches of related
      roadmaps with their layers (run where the atlas is edited; commit them).
  python3 research/blueprint/make_audit_jobs.py queue --baseline <dir> --workers <dir>
      Appends an audit job and an independent review job per batch to
      queue.json and writes their prompts (run on the swarm host).

For every layer of every roadmap, an auditor lists the mathematical targets the
layer states and searches the pinned baseline for each, by name and by concept
and in full generality, recording the declarations that show a target is
already there. It also marks layers that are process rather than mathematics
and layers whose targets another roadmap already owns. A reviewer on a
different account re-checks every claim that something exists and re-searches
the claims that something is missing. scripts/merge_library_audit.py turns the
accepted results into data/library-coverage.json.
"""
from __future__ import annotations

import argparse
import json
import sys
from collections import defaultdict
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
BP = REPO / "research" / "blueprint"
OUT = BP / "audit"
MAX_ROADMAPS = 5
MAX_LAYERS = 50
sys.path.insert(0, str(REPO / "scripts"))
from retirements import apply_retirements  # noqa: E402

COMMON = """INPUTS
- The batch: research/blueprint/audit/{AUDIT}.json lists the roadmaps and every layer to audit, with the path of each roadmap's extract.
- Each roadmap: its extract research/blueprint/atlas/roadmaps/<file>.json (summary, document path, every layer with its full description) and its document under content/. Read every layer description in full, and the document wherever a layer is terse.
- The pinned baseline: {BASELINE}/BASELINE.json (commits), {BASELINE}/declarations.tsv (every Mathlib and Tau Ceti declaration: library, full name, kind, file, line, signature start), {BASELINE}/mathlib/Mathlib/ and {BASELINE}/TauCeti/.
- The whole atlas, to find other owners of a target: research/blueprint/atlas/index.json (every roadmap and layer title) and research/blueprint/atlas/areas/*.json (every layer description).
- Retired roadmaps: data/roadmap-retirements.json.

HOW TO SEARCH (this is the heart of the job; be thorough)
- The index is a search aid built from the source text, not a complete list: it can miss a declaration or give it the wrong namespace. Before calling a target absent, grep the Lean sources for its key words (grep -rn -i, and read the hits in context); before citing a name, confirm its namespace in the file. Case-insensitive searches are noisy, so never cut the output short with head before reading what is relevant.
- Search by concept as well as by name. For each target, try the Mathlib naming conventions (for example IsDedekindDomain, Ideal.IsPrime, NumberField.RingOfIntegers, IsLocalization, Module.Flat, MeasureTheory.Measure.haar), synonyms, and the key words of its statement, with grep -i -P on declarations.tsv, then grep -rn -i in the Lean sources for docstrings and notation.
- Open the Lean file at the line and read the statement before citing a declaration. Compare hypotheses and generality: a general Mathlib theorem covers a special case the layer asks for (for example, Mathlib's Dedekind domain theory covers the ring of integers of a number field).
- Tau Ceti is a large library (about 70,000 declarations) with its own conventions; search it as carefully as Mathlib before calling anything missing.
- A declaration whose proof uses sorry, or that is only a structure field or an axiom, does not show a result is proved: check with grep -n sorry in its file and record it.
"""

AUDIT_TEMPLATE = """You are a mathematician auditing roadmaps for the Tau Ceti Atlas against the Lean libraries. You run unattended in a tmux session as job {JOB}. Work in {REPO}. Your scratch directory is {WORKERS}/{JOB} (create it). Save as you go.

WHY: roadmaps in this atlas must not plan work that Mathlib or Tau Ceti has already done. Some layers ask for theory that the libraries contain in full generality; some duplicate other roadmaps; some are process rather than mathematics. Your audit decides, layer by layer, what is already built.

""" + COMMON + """
FOR EACH LAYER of each roadmap in the batch:
1. List the mathematical targets the layer states: each definition, construction and theorem, in a few words each.
2. For each target, search the baseline as described, and record:
   - "library": "mathlib", "tauceti", "both", "partial" (something close exists; say exactly what is missing) or "absent";
   - "declarations": up to five entries {{"name", "library", "file", "line", "fit": "exact" | "more general" | "special case" | "related"}};
   - "note": one or two sentences, including hypotheses that differ.
3. Give the layer a verdict: "built" (every target is in the libraries in at least the stated generality, proved without sorry), "partly built", "not built", or "process" (the layer is bookkeeping, auditing or integration rather than mathematics).
4. "duplicates": other roadmaps' layer ids that state the same targets (search the atlas files), with one sentence on the overlap.
Also give each roadmap a "summary" of two to four sentences: what the libraries already have towards it, and what is genuinely missing.

OUTPUT: {OUTPUT}, one JSON object:
{{"job": "{JOB}", "baseline": "<the commits from BASELINE.json>", "roadmaps": {{"<roadmap id>": {{"summary": "...", "layers": {{"<layer id>": {{"verdict": "...", "targets": [{{"target": "...", "library": "...", "declarations": [...], "note": "..."}}], "duplicates": [{{"layer": "...", "note": "..."}}]}}}}}}}}}}
Every layer listed in the batch file must appear. Rewrite the whole file after each roadmap, and check it with python3 -c 'import json;json.load(open("{OUTPUT}"))'.
If {OUTPUT} already exists (a checkpoint from an earlier worker), keep its entries after checking them and complete the rest.
RULES: edit only {OUTPUT} and your scratch files. Do not run git. No private paths in the repository.
Finish with the number of layers in each verdict, the targets you found in the libraries that the roadmap documents treat as missing, and the duplicates."""

REVIEW_TEMPLATE = """You are an independent reviewer of a library audit for the Tau Ceti Atlas. You run unattended in a tmux session as job {JOB}. Work in {REPO}. Your scratch directory is {WORKERS}/{JOB} (create it). Save as you go.

JOB: check the audit {OUTPUT} of the roadmaps in research/blueprint/audit/{AUDIT}.json, made by another worker.

""" + COMMON + """
CHECK
1. Every claim that a target is in the libraries: open each cited declaration, compare its statement, hypotheses and generality with the target, and check that it is proved without sorry. Correct the entry if it is wrong.
2. Every layer marked "built" or "process": confirm the verdict from the layer description.
3. Claims that a target is absent or partial: search again independently for at least half of them, and for every one whose concept has a standard Mathlib name. Correct any target you find.
4. The duplicates: confirm each, and add any you notice.
Edit {OUTPUT} in place to fix what is wrong, and add a top-level "review" object:
{{"status": "accepted" | "needs_changes", "reviewer": "{JOB}", "date": "<today>", "checked": <number of targets checked>, "corrections": [{{"layer": "...", "target": "...", "was": "...", "now": "...", "why": "..."}}], "notes": "..."}}
Use "accepted" when every claim you checked holds after your corrections. Use "needs_changes" if the audit is too incomplete or unreliable to fix in place.
Write a short report to research/blueprint/reviews/{JOB}.md.
RULES: edit only {OUTPUT}, the report and your scratch files. Do not run git. No private paths in the repository.
Finish with the verdict, the number of corrections, and the most important finding."""


def load(path: Path):
    return json.loads(path.read_text(encoding="utf-8"))


def design():
    atlas = apply_retirements(load(REPO / "data" / "atlas.json"))
    presentation = load(REPO / "data" / "stage-presentation.json")
    hidden = {sid for sid, item in presentation.items() if isinstance(item, dict) and item.get("hidden")}
    classification = load(REPO / "data" / "roadmap-classification.json")["roadmaps"]
    layers = defaultdict(list)
    for stage in atlas["stages"]:
        if stage["id"] not in hidden and not stage.get("expansion"):
            layers[stage["owner"]].append({"id": stage["id"], "title": stage["title"]})
    roadmaps = sorted((r for r in atlas["roadmaps"] if layers[r["id"]]),
                      key=lambda r: (classification[r["id"]]["galaxy"], r["id"]))
    batches, current, count = [], [], 0
    for roadmap in roadmaps:
        size = len(layers[roadmap["id"]])
        if current and (len(current) >= MAX_ROADMAPS or count + size > MAX_LAYERS):
            batches.append(current)
            current, count = [], 0
        current.append(roadmap)
        count += size
    if current:
        batches.append(current)
    OUT.mkdir(exist_ok=True)
    for number, batch in enumerate(batches, 1):
        job = f"AUDIT-{number:02d}"
        document = {"job": job, "roadmaps": [{"roadmapId": r["id"], "title": r["title"],
                                              "extract": "research/blueprint/atlas/roadmaps/" + r["id"].replace(":", "_").replace("/", "_") + ".json",
                                              "layers": layers[r["id"]]} for r in batch]}
        (OUT / f"{job}.json").write_text(json.dumps(document, indent=1, ensure_ascii=False) + "\n", encoding="utf-8")
    total = sum(len(layers[r["id"]]) for r in roadmaps)
    print(f"{len(batches)} audit batches covering {len(roadmaps)} roadmaps and {total} layers")


def queue(baseline: str, workers: str):
    import fcntl
    import os
    fill = dict(REPO=str(REPO), BASELINE=baseline, WORKERS=workers)
    jobs = []
    for path in sorted(OUT.glob("AUDIT-[0-9][0-9].json")):
        audit = path.stem
        batch = load(path)
        output = f"research/blueprint/audit/{audit}.result.json"
        rids = [item["roadmapId"] for item in batch["roadmaps"]]
        number = int(audit.split("-")[1])
        for job_id, template, kind, order, after, outputs in (
                (audit, AUDIT_TEMPLATE, "audit", 200 + number, [], [output]),
                (f"REV-{audit}", REVIEW_TEMPLATE, "review", 300 + number, [audit], [output, f"research/blueprint/reviews/REV-{audit}.md"])):
            prompt = f"research/blueprint/prompts/{job_id}.md"
            (REPO / prompt).write_text(template.format(**fill, JOB=job_id, AUDIT=audit, OUTPUT=output), encoding="utf-8")
            job = {"id": job_id, "kind": kind, "priority": 0, "order": order, "roadmapIds": rids, "outputs": outputs,
                   "after": after, "prompt": prompt, "timeout": 6 * 3600, "state": "pending"}
            if after:
                job["avoidAccountOf"] = audit
            jobs.append(job)
    lock = open(BP / ".queue.lock", "a+")
    fcntl.flock(lock, fcntl.LOCK_EX)
    try:
        path = BP / "queue.json"
        data = load(path)
        known = {job["id"] for job in data["jobs"]}
        added = [job for job in jobs if job["id"] not in known]
        data["jobs"] += added
        tmp = path.with_suffix(".json.tmp")
        tmp.write_text(json.dumps(data, indent=1, ensure_ascii=False) + "\n", encoding="utf-8")
        os.replace(tmp, path)
    finally:
        fcntl.flock(lock, fcntl.LOCK_UN)
    print(f"{len(added)} audit and review jobs added; {len(jobs) - len(added)} were already queued")


def main():
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


if __name__ == "__main__":
    main()
