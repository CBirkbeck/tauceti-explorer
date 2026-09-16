#!/usr/bin/env python3
"""Pairwise judgements of distance from Mathlib: the design and the swarm jobs.

  python3 research/blueprint/make_compare_jobs.py design
      Writes research/blueprint/compare/COMPARE-NN.json: blocks of roadmaps and
      the pairs to judge in each (run where the atlas is edited; commit them).
  python3 research/blueprint/make_compare_jobs.py queue --baseline <dir> --workers <dir>
      Appends one job per block to queue.json and writes its prompt (run on the
      swarm host, which owns the queue).

The design has ROUNDS rounds. Each round is a seeded random partition of the
roadmaps into blocks of about BLOCK, so every block mixes subjects. Within a
block, the roadmaps are ordered by their current distance and each neighbour
pair is judged (the close comparisons that carry most information), plus
random pairs with similar distances. A judge reads a block once and answers all
its pairs. Collection roadmaps are left out: their distance is the mean of
their children's. The union of all pairs is checked to connect every roadmap.
"""
from __future__ import annotations

import argparse
import json
import random
import sys
from collections import defaultdict
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
BP = REPO / "research" / "blueprint"
OUT = BP / "compare"
ROUNDS = 3
BLOCK = 14
EXTRA_PER_BLOCK = 11
SEED = 20260916

TEMPLATE = """You are a mathematician judging distances for the Tau Ceti Atlas. You run unattended in a tmux session as job {JOB}. Work in {REPO}. Your scratch directory is {WORKERS}/{JOB} (create it). Save as you go.

QUESTION: for each pair of roadmaps listed in research/blueprint/compare/{JOB}.json, decide which roadmap is farther from the library. The farther roadmap is the one that needs more new theory to be built on top of the pinned Mathlib and Tau Ceti baseline before its main targets can be stated and proved.

What counts:
- the new definitions, constructions and theorems that must be built, including theory the roadmap takes from other roadmaps and that is not yet in the library;
- both how much of that theory there is and how many layers of it must be stacked on one another.
What does not count:
- how long or detailed the roadmap document is, or how its layers are divided;
- how hard the results were to discover (all targets are known results);
- theory the baseline already has.

INPUTS
- Each roadmap: research/blueprint/atlas/roadmaps/<id with ':' and '/' replaced by '_'>.json (summary, document path, every layer with its full description, and the layer links with other roadmaps), and the roadmap document it names under content/. Read the summary and every layer description; read the document where the layers are unclear.
- The baseline: {BASELINE}/declarations.tsv (an index of Mathlib and Tau Ceti declarations: search it with grep -i -P), {BASELINE}/mathlib/Mathlib/ and {BASELINE}/TauCeti/. Check the library's coverage of each roadmap's basic objects yourself, and open a Lean file before relying on a declaration. Tau Ceti is large: search it before calling something missing.
- Recorded progress: data/status.json and data/stage-status-reports.json list layers already built.
- The theory a roadmap imports: follow its layer links in research/blueprint/atlas/stage-edges.json back through other roadmaps; a single imported layer can bring in a whole theory (for example the Weil bounds, or the Fargues–Scholze machinery). Tau Ceti roadmaps (ids starting tauceti:) have few recorded links, so also read the prerequisites their documents name and their STATUS.md under content/tau-ceti/.
- What the libraries already contain, layer by layer: the reviewed library audits research/blueprint/audit/AUDIT-*.result.json whose "review" status is "accepted". Use them as leads and verify what your judgement rests on.
- Leads only, to verify: the mathlibEvidence lists in research/blueprint/classify/*.result.json. Do not read their distance or distanceRationale fields, and do not read any other COMPARE result, data/roadmap-distances.json or data/roadmap-classification.json: your judgements must be independent.

METHOD
1. Read every roadmap of the block first. For each, write short notes in your scratch directory and then in the output: its main targets; what the baseline already has towards them (name two to four declarations or files); and the missing theory as a short list of layers, including what it needs from other roadmaps.
2. Then judge each listed pair on its own. Answer "a" or "b" for the farther roadmap, or "tie" only if you cannot tell them apart after comparing the missing theory carefully. Mark "clear" when the difference is evident and "slight" when it is close. Give a reason in one or two sentences that names concrete missing theory on each side.

OUTPUT: {OUTPUT}, one JSON object:
{{"job": "{JOB}", "notes": {{"<roadmap id>": {{"targets": "...", "baselineHas": ["..."], "missing": ["..."]}}}}, "judgements": [{{"a": "<id>", "b": "<id>", "farther": "a" | "b" | "tie", "strength": "clear" | "slight", "reason": "..."}}]}}
Give one judgement per listed pair, in the listed order and with "a" and "b" exactly as listed. Rewrite the whole file after every five judgements and check it with python3 -c 'import json;json.load(open("{OUTPUT}"))'.
If {OUTPUT} already exists (a checkpoint from an earlier worker), keep its notes and judgements after checking them, and complete the rest.
RULES: edit only {OUTPUT} and your scratch files. Do not run git. No private paths in the repository. Do not save notes about particular roadmaps or your verdicts to memory, so that later judges stay independent; notes about method are fine.
Finish with the number of judgements, the number of ties, and any pair you found hard to judge."""


def load(path: Path):
    return json.loads(path.read_text(encoding="utf-8"))


def connected(ids, pairs):
    links = defaultdict(set)
    for a, b in pairs:
        links[a].add(b)
        links[b].add(a)
    start = next(iter(ids))
    seen, stack = {start}, [start]
    while stack:
        for other in links[stack.pop()]:
            if other not in seen:
                seen.add(other)
                stack.append(other)
    return seen


def design():
    atlas = load(REPO / "data" / "atlas.json")
    prior = {rid: r["distance"] for rid, r in load(REPO / "data" / "roadmap-classification.json")["roadmaps"].items()}
    parents = {r["parentRoadmapId"] for r in atlas["roadmaps"] if r.get("parentRoadmapId")}
    titles = {r["id"]: r["title"] for r in atlas["roadmaps"]}
    ids = sorted(rid for rid in titles if rid not in parents)
    rng = random.Random(SEED)
    blocks, every_pair = [], set()
    total = defaultdict(int)
    for round_number in range(1, ROUNDS + 1):
        order = ids[:]
        rng.shuffle(order)
        count = max(1, round(len(order) / BLOCK))
        for index in range(count):
            members = sorted(order[index::count], key=lambda rid: (prior[rid], rid))
            pairs = list(zip(members, members[1:]))
            chosen = {tuple(sorted(p)) for p in pairs}
            local = defaultdict(int)
            for a, b in pairs:
                local[a] += 1
                local[b] += 1
            tiebreak = {}
            candidates = []
            for i, a in enumerate(members):
                for b in members[i + 2:]:
                    if abs(prior[a] - prior[b]) <= 3 and tuple(sorted((a, b))) not in every_pair:
                        candidates.append((a, b))
                        tiebreak[(a, b)] = rng.random()
            # Extra pairs go to the roadmaps with the fewest judgements so far.
            for _ in range(EXTRA_PER_BLOCK):
                open_pairs = [pair for pair in candidates if tuple(sorted(pair)) not in chosen]
                if not open_pairs:
                    break
                a, b = min(open_pairs, key=lambda pair: (local[pair[0]] + local[pair[1]],
                                                         total[pair[0]] + total[pair[1]], tiebreak[pair]))
                pairs.append((a, b))
                chosen.add(tuple(sorted((a, b))))
                local[a] += 1
                local[b] += 1
            for a, b in pairs:
                total[a] += 1
                total[b] += 1
            ordered = []
            for a, b in pairs:
                ordered.append((a, b) if rng.random() < .5 else (b, a))
                every_pair.add(tuple(sorted((a, b))))
            blocks.append({"round": round_number, "members": members, "pairs": ordered})
    reached = connected(ids, every_pair)
    if reached != set(ids):
        sys.exit(f"the design leaves {len(set(ids) - reached)} roadmaps unconnected; change SEED")
    OUT.mkdir(exist_ok=True)
    degree = defaultdict(int)
    for number, block in enumerate(blocks, 1):
        job = f"COMPARE-{number:02d}"
        document = {"job": job, "round": block["round"],
                    "roadmaps": [{"roadmapId": rid, "title": titles[rid],
                                  "extract": "research/blueprint/atlas/roadmaps/" + rid.replace(":", "_").replace("/", "_") + ".json"}
                                 for rid in block["members"]],
                    "pairs": [{"a": a, "b": b} for a, b in block["pairs"]]}
        (OUT / f"{job}.json").write_text(json.dumps(document, indent=1, ensure_ascii=False) + "\n", encoding="utf-8")
        for a, b in block["pairs"]:
            degree[a] += 1
            degree[b] += 1
    values = sorted(degree[rid] for rid in ids)
    print(f"{len(blocks)} blocks, {sum(len(b['pairs']) for b in blocks)} pairs, {len(ids)} roadmaps; "
          f"judgements per roadmap: min {values[0]}, median {values[len(values) // 2]}, max {values[-1]}")


def queue(baseline: str, workers: str):
    import fcntl
    import os
    fill = dict(REPO=str(REPO), BASELINE=baseline, WORKERS=workers)
    jobs = []
    for path in sorted(OUT.glob("COMPARE-[0-9][0-9].json")):
        job_id = path.stem
        block = load(path)
        output = f"research/blueprint/compare/{job_id}.result.json"
        prompt = f"research/blueprint/prompts/{job_id}.md"
        (REPO / prompt).write_text(TEMPLATE.format(**fill, JOB=job_id, OUTPUT=output), encoding="utf-8")
        jobs.append({"id": job_id, "kind": "compare", "priority": 0, "order": 100 + int(job_id.split("-")[1]),
                     "roadmapIds": [item["roadmapId"] for item in block["roadmaps"]], "outputs": [output],
                     "after": [], "prompt": prompt, "timeout": 4 * 3600, "state": "pending"})
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
    print(f"{len(added)} compare jobs added; {len(jobs) - len(added)} were already queued")


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
