#!/usr/bin/env python3
"""Write browser-sized extracts of data/atlas.json into research/blueprint/atlas/.

data/atlas.json is about 14 MB, more than GitHub's contents API returns
(1 MB), so browser agents read these extracts instead. Every file stays below
900 KB. Rerun after data/atlas.json changes:

  python3 research/blueprint/make_atlas_extracts.py
"""
from __future__ import annotations

import json
import shutil
from collections import defaultdict
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
OUT = REPO / "research" / "blueprint" / "atlas"
LIMIT = 900_000
STAGE_FIELDS = ("id", "owner", "key", "title", "description", "requires", "consumers", "parentStageId", "status")


def file_id(rid):
    return rid.replace(":", "_").replace("/", "_")


def dump(path, data):
    text = json.dumps(data, ensure_ascii=False, separators=(",", ":"))
    if len(text.encode()) > LIMIT:
        raise SystemExit(f"{path} would be {len(text.encode())} bytes")
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text + "\n", encoding="utf-8")
    return len(text.encode())


def main():
    atlas = json.loads((REPO / "data" / "atlas.json").read_text())
    roadmaps = atlas["roadmaps"]
    stages = atlas["stages"]
    titles = {s["id"]: s["title"] for s in stages}
    owners = {s["id"]: s["owner"] for s in stages}
    group_of = {r["id"]: r.get("group") for r in roadmaps}
    if OUT.exists():
        shutil.rmtree(OUT)
    sizes = {}
    edges_by_roadmap = defaultdict(list)
    for edge in atlas["stageEdges"]:
        record = {"source": edge["source"], "target": edge["target"],
                  "sourceTitle": titles.get(edge["source"]), "targetTitle": titles.get(edge["target"]),
                  "sourceRoadmap": owners.get(edge["source"]), "targetRoadmap": owners.get(edge["target"])}
        for rid in {owners.get(edge["source"]), owners.get(edge["target"])} - {None}:
            edges_by_roadmap[rid].append(record)
    stages_by_roadmap = defaultdict(list)
    for s in stages:
        stages_by_roadmap[s["owner"]].append({k: s.get(k) for k in STAGE_FIELDS})
    decompositions = {p.stem for p in (REPO / "data" / "decompositions").glob("*.json")}
    index = {"source": "data/atlas.json", "edition": atlas["meta"].get("edition"),
             "note": "Browser-sized extract; see research/blueprint/atlas/README.md.",
             "groups": [{"id": g["id"], "label": g["label"]} for g in atlas["groups"]],
             "roadmaps": [], "stages": []}
    for r in roadmaps:
        fid = file_id(r["id"])
        record = {"id": r["id"], "title": r["title"], "group": r.get("group"), "summary": r.get("summary"),
                  "document": r.get("sourcePath"), "origin": r.get("origin"), "lifecycle": r.get("lifecycle"),
                  "parentRoadmapId": r.get("parentRoadmapId"),
                  "prerequisites": r.get("prerequisites", []), "consumers": r.get("consumers", []),
                  "integratedDecomposition": f"data/decompositions/{fid}.json" if fid in decompositions else None,
                  "extract": f"research/blueprint/atlas/roadmaps/{fid}.json"}
        index["roadmaps"].append({k: record[k] for k in ("id", "title", "group", "document", "extract", "integratedDecomposition")}
                                 | {"stages": len(stages_by_roadmap[r["id"]])})
        sizes[f"roadmaps/{fid}.json"] = dump(OUT / "roadmaps" / f"{fid}.json",
                                             record | {"stages": stages_by_roadmap[r["id"]], "stageEdges": edges_by_roadmap[r["id"]]})
    for s in stages:
        index["stages"].append({"id": s["id"], "owner": s["owner"], "key": s.get("key"), "title": s["title"],
                                "parentStageId": s.get("parentStageId")})
    sizes["index.json"] = dump(OUT / "index.json", index)
    sizes["stage-edges.json"] = dump(OUT / "stage-edges.json",
                                     [{"source": e["source"], "target": e["target"]} for e in atlas["stageEdges"]])
    by_group = defaultdict(list)
    for r in roadmaps:
        by_group[r.get("group")].append(r["id"])
    for group, ids in sorted(by_group.items()):
        shard, shard_size, part = [], 0, 1
        def flush():
            nonlocal shard, shard_size, part
            if shard:
                name = f"areas/{group}-{part}.json"
                sizes[name] = dump(OUT / name, {"group": group, "part": part, "stages": shard})
                shard, shard_size, part = [], 0, part + 1
        for rid in sorted(ids):
            payload = [{k: s.get(k) for k in ("id", "owner", "title", "description")} for s in stages_by_roadmap[rid]]
            size = len(json.dumps(payload, ensure_ascii=False).encode())
            if shard and shard_size + size > 600_000:
                flush()
            shard += payload
            shard_size += size
        flush()
    (OUT / "README.md").write_text(
        "# Browser-sized atlas extracts\n\n"
        "`data/atlas.json` is too large for GitHub's file readers (about 14 MB; the contents API returns files up to 1 MB).\n"
        "These files hold the same records, split so that each is below 900 KB. They are generated by\n"
        "`research/blueprint/make_atlas_extracts.py` from `data/atlas.json`; do not edit them by hand.\n\n"
        "| File | Contents |\n| --- | --- |\n"
        "| `index.json` | every roadmap (id, title, area, document path, extract path, integrated decomposition) and every stage (id, owner, key, title, parent) |\n"
        "| `roadmaps/<id>.json` | one roadmap: summary, document path, prerequisites and consumers, all its stages with full descriptions, and every stage edge touching it, with the other endpoint's title and roadmap |\n"
        "| `areas/<area>-<n>.json` | every stage of one area with its full description, for catalogue-wide text search |\n"
        "| `stage-edges.json` | all recorded stage dependencies (prerequisite → consumer) |\n\n"
        "Roadmap ids map to file names by replacing `:` and `/` with `_`. The roadmap documents themselves are the\n"
        "Markdown files named in `document` (under `content/`). Reviewed refinements that are already integrated\n"
        "live in `data/decompositions/<id>.json`.\n")
    print(f"{len(sizes)} files; largest {max(sizes.values())} bytes; total {sum(sizes.values())} bytes")


if __name__ == "__main__":
    main()
