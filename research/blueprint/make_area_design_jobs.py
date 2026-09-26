#!/usr/bin/env python3
"""A design job for each area of mathematics the atlas records as having no roadmap.

  python3 research/blueprint/make_area_design_jobs.py queue --baseline <dir> --workers <dir> --library <dir>

data/opportunities.json lists the areas with no dedicated roadmap -- Riemannian
geometry, operator algebras, set theory and thirteen more -- each with a summary
of what a roadmap there would cover and which existing roadmaps border it. That
text is the brief; the design job writes the roadmap, exactly as the paper-driven
design jobs do (make_queue.py), and its review checks it. Nothing mathematical
is written here: an area becomes a job, the worker plans it.
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
sys.path.insert(0, str(BP))
from make_queue import DESIGN_TEMPLATE, REVIEW_TEMPLATE  # noqa: E402


def roadmap_id(title: str) -> str:
    """A roadmap id in the atlas's style: CamelCase from the area's title."""
    words = re.sub(r"[^A-Za-z0-9 ]+", " ", title.replace("ä", "a")).split()
    return "".join(w[:1].upper() + w[1:] for w in words if w.lower() not in ("and", "of", "the"))


def brief(area: dict) -> str:
    related = area.get("relatedRoadmaps") or []
    if isinstance(related, str):
        related = [r.strip(" '") for r in related.strip("[]").split(",") if r.strip()]
    return (f"Area: {area['title']}. {area.get('summary', '')}\n\n"
            f"Why this roadmap: {area.get('reason', '')}\n\n"
            "Neighbouring roadmaps, for interfaces and to avoid duplication (contextual connections, "
            f"not prerequisites): {', '.join(related) or 'none recorded'}.\n\n"
            "Plan the area from the pinned libraries upward: what Mathlib and Tau Ceti already give, then the "
            "standard theorems in dependency order, each with a freely readable source that states and proves it, "
            "authors named. Layers that reuse another roadmap's target say so rather than restating it.")


def queue(baseline: str, workers: str, library: str) -> None:
    areas = json.loads((REPO / "data" / "opportunities.json").read_text()).get("areas", [])
    fill = dict(REPO=str(REPO), BASELINE=baseline, LIBRARY=library, WORKERS=workers)
    jobs = []
    for position, area in enumerate(areas, 1):
        rid = roadmap_id(area["title"])
        job_id = f"DESIGN-AREA-{rid}"
        output = f"research/blueprint/packets/{rid}.json"
        suggested = f"research/blueprint/suggested/{rid}.lean"
        text = DESIGN_TEMPLATE.format(**fill, JOB=job_id, ROADMAP=rid, GROUP=area.get("group", ""), BRIEF=brief(area),
                                      OUTPUT=output, README=f"research/blueprint/readmes/{rid}.md", SUGGESTED=suggested,
                                      FILE=rid, EDITABLE=f"research/blueprint/roadmaps/{rid}.json and {output}")
        # Priority 3: these areas sit outside the arithmetic core the library is for, and the
        # atlas notes that neighbouring roadmaps already cover parts of them. Real gaps, but not
        # ahead of the mathematics already planned.
        jobs.append(({"id": job_id, "kind": "design", "priority": 3, "order": 500 + position, "roadmapIds": [rid],
                      "name": area["title"], "outputs": [f"research/blueprint/roadmaps/{rid}.json", output,
                                                          f"research/blueprint/readmes/{rid}.md", suggested],
                      "after": [], "state": "pending"}, text))
        review_id = f"REV-{job_id}"
        rtext = REVIEW_TEMPLATE.format(**fill, JOB=review_id,
                                       TARGETS=f"the roadmap definition research/blueprint/roadmaps/{rid}.json, its packet {output} "
                                               f"and its suggested Lean file {suggested} (new roadmap {rid}: {area['title']})")
        jobs.append(({"id": review_id, "kind": "review", "priority": 3, "order": 500 + position, "roadmapIds": [rid],
                      "name": area["title"], "outputs": [f"research/blueprint/reviews/{review_id}.md",
                                                          f"research/blueprint/roadmaps/{rid}.json", output, suggested],
                      "after": [job_id], "avoidAccountOf": job_id, "state": "pending"}, rtext))
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
    print(f"{len(added)} area design and review jobs added; {len(jobs) - len(added)} were already queued")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("command", choices=["queue"])
    parser.add_argument("--baseline", required=True)
    parser.add_argument("--workers", required=True)
    parser.add_argument("--library", required=True)
    args = parser.parse_args()
    queue(args.baseline, args.workers, args.library)
    return 0


if __name__ == "__main__":
    sys.exit(main())
