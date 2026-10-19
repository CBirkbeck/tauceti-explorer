# BP-PadicHodgeRegulators~2 — blocked canonical migration checkpoint

Refs #11092. Codex / GPT-6, session **codex-428pHh**, 19 October 2026.
Claim comment **6278706429** was confirmed by bot comment **6278708981**.
This run claimed one issue and stops after its pull request.

**Unfinished: the authorized files cannot change the declarations that need the
review corrections.** This continues the checkpoint from codex-HNxLJr in #11111.
The root packet, reader, suggested file and this handoff are the four allowed
deliverables. Both canonical part packets and all integration/queue code remain
outside that list. The packet remains `partial`; the independent `needs_changes`
review is unchanged. There is no new acceptance or promotion claim.

## Work added by this run

- Reproduced the assembly defect against repository commit
  `29eb466061f5c271366c91f619b59bbe7af290ed`, reading the merger, checker,
  promotion and intake code directly.
- Rechecked the two import hashes, all node-ID inventories, ordered correction
  payloads, coverage targets and displayed planets. The materialized root still
  fails the unchanged checker with exactly 131 duplicate-ID errors and no other
  errors or warnings. No validation context was altered.
- Prepared **scratch-only canonical part previews**, retaining every original
  ID and applying the root's aliases/corrections to its actual owner. Both
  previews pass the unchanged checker with normal `world()` context, zero
  errors and zero warnings. Merging those previews and the root's one node
  gives exactly the intended 132 nodes, with every node field equal and every
  displayed planet's statement, hypotheses and kind equal.
- Distinguished eight differing **source-ID lists** from nine differing **full
  citation lists**. The ninth difference is the LLZ Corollary 1.12 page
  correction on `L4/logarithmic-elementary-divisors`, rather than a source alias.
- Confirmed that intake also checks the job's output list. An expanded repair
  must be reflected there or handled by the maintainer; authorizing a chat edit
  alone does not change `intake.py:auto_refusals`.
- Re-read LLZ2011 Corollary 1.12 at published p.1107, AC20 Remark 3.2(1) at p.15,
  and LZ2014 §2.4 at p.5. All three PDFs match their recorded SHA-256 values.
  The first two source checks retain the reviewer's in-place corrections;
  the AC20 check confirms the printed label, without claiming another reading
  of the underlying Besser comparison.
- Recorded E121, the dual-representation typo in LZ2014's adjunction
  quantifier, scoped to arXiv v3 and awaiting independent review. The existing
  ordered root correction already uses the appropriate domains, so no target,
  API, test or proof route changes. No version-of-record or novelty claim is made.
- Recompiled the unchanged 192-line suggested file with `lean-check`: exit 0,
  only nine expected theorem-admission warnings. Available memory was 74 GiB;
  one check ran, with no build or language server.

The asynchronous request to expand the two-part edit scope did not supply
approval during this checkpoint work. It is not treated as approval. The
repository still changes only three of the four allowed deliverables; the
suggested file was checked without changing it.

## Reproduced defect and preview

| Measurement | Result |
| --- | ---: |
| Root alone through the actual merger | 1 declaration |
| Unchanged parts plus root | 132 declarations, corrections ignored |
| Intended node set / coverage targets | 132 / 132, exact equality |
| Ordered correction records / distinct targets | 27 / 26 |
| Differing corrected fields | 33 |
| Differing source-ID lists / full citation lists | 8 / 9 |
| Materialized-root duplicate errors / other errors | 131 / 0 |
| Scratch canonical previews: errors / warnings | 0 / 0 for each part |
| Preview nodes differing from intended nodes | 0 |
| Preview displayed planets differing from intended nodes | 0 |

The part identities remain unchanged:

| Part | Nodes | SHA-256 |
| --- | ---: | --- |
| `PadicHodgeRegulators--D.1.json` | 72 | `2f70c0c000179cbd10c77a243d003214ca1ad0b171ff2e7f977972e62405f22c` |
| `PadicHodgeRegulators--L3.json` | 59 | `cf912c4d5b5a2b2846764d9eed3c219b37da2d300c84995a8d8857674867c9d7` |

The actual merger reads `packet.nodes`; promotion copies the raw packet.
Neither applies `imports`, `importedNodes`, `targetCorrections` or
`assembly.sourceAliases`. The broken displayed planet is `L1/dual-exponential`.
The lost `L4/good-wach-basis` correction also leaves generic ownership in the
wrong place instead of importing PG.6. Copying nodes into the root creates
canonical duplication; changing input order or hiding part owners from the
checker is not a repair.

### Reconstructing the canonical preview

This diagnostic is self-contained Python to be used from the repository root,
with an existing scratch directory passed as its argument. It reads repository
files and writes only hypothetical part packets there. The checker uses the
normal world and the original part basenames. It does not certify migration
metadata or independently review mathematics.

```python
import copy
import hashlib
import json
import sys
from pathlib import Path

sys.path.insert(0, "scripts")
from blueprints import drop_source_excerpts, merge_blueprints
from check_blueprint import check, world

scratch = Path(sys.argv[1]).resolve()
folder = Path("research/blueprint/packets")
assert scratch != folder.resolve()
root = json.loads((folder / "PadicHodgeRegulators.json").read_text())
context = world()
intended, parts = {}, []
for entry in root["imports"]:
    path = Path(entry["packet"])
    assert hashlib.sha256(path.read_bytes()).hexdigest() == entry["sha256"]
    part = json.loads(path.read_text())
    assert {n["id"] for n in part["nodes"]} == set(entry["nodeIds"])
    parts.append((path.stem, part))
    aliases = root["assembly"]["sourceAliases"].get(path.name, {})
    for node in copy.deepcopy(part["nodes"]):
        for cite in node["sources"]:
            cite["sourceId"] = aliases.get(cite["sourceId"], cite["sourceId"])
        assert node["id"] not in intended
        intended[node["id"]] = node
for correction in root["targetCorrections"]:
    intended[correction["target"]].update(copy.deepcopy(correction["fields"]))
for node in root["nodes"]:
    assert node["id"] not in intended
    intended[node["id"]] = copy.deepcopy(node)
assert set(intended) == {n for c in root["coverage"] for n in c["targets"]}

previews = []
for stem, original in parts:
    part = drop_source_excerpts(copy.deepcopy(original))
    part["nodes"] = [copy.deepcopy(intended[n["id"]]) for n in original["nodes"]]
    ids = {n["id"] for n in part["nodes"]}
    aliases = root["assembly"]["sourceAliases"].get(stem + ".json", {})
    sources = {aliases.get(s["id"], s["id"]) for s in original["sources"]}
    sources |= {s["sourceId"] for n in part["nodes"] for s in n["sources"]}
    part["sources"] = [s for s in root["sources"] if s["id"] in sources]
    assert sources == {s["id"] for s in part["sources"]}
    part["baseline"] = copy.deepcopy(root["baseline"])
    part["requests"] = [dict(r, neededBy=[n for n in r["neededBy"] if n in ids])
                        for r in root["requests"] if ids.intersection(r["neededBy"])]
    # Existing reviews describe the original files, never acceptance of previews.
    path = scratch / (stem + ".json")
    path.write_text(json.dumps(part, indent=2, ensure_ascii=False) + "\n")
    errors, warnings, _ = check(path, None, context)
    assert not errors and not warnings, (errors, warnings)
    previews.append((stem, part))

previews.append(("PadicHodgeRegulators", root))
actual = {n["id"]: n for _, p in previews for n in p["nodes"]}
assert actual == intended and len(actual) == 132
snapshot = {"roadmaps": [{"id": root["roadmapId"], "stages": root["scope"].copy()}],
            "stages": [{"id": s, "owner": root["roadmapId"]} for s in root["scope"]],
            "stageEdges": [], "edges": []}
out = merge_blueprints(snapshot, previews, {})
assert out["roadmaps"][0]["blueprint"]["declarations"] == 132
for stage in out["stages"]:
    if stage.get("expansion"):
        node = intended[stage["id"]]
        for key in ("statement", "hypotheses", "kind"):
            assert stage["expansion"][key] == node[key]
print("Two scratch packets pass; all 132 nodes and displayed planets agree.")
```

## Required scope change and completion work

The minimal viable path adds these canonical files to this revision's allowed
outputs, including intake's job scope:

- `research/blueprint/packets/PadicHodgeRegulators--D.1.json`
- `research/blueprint/packets/PadicHodgeRegulators--L3.json`

Apply the preview's node/source/request changes to their existing owners.
Then reconcile source-issue records with the root's corrected register, preserve
historical verdicts as history rather than acceptance of changed files, and
reconcile gap, convention and coverage metadata. The preview does not finish
that metadata work. Keep the root's independent review object; fresh independent
review must cover both changed canonical files as well as the root. Refresh the
root's hashes and assembly receipt, remove reliance on unapplied overlays and
check the actual promotion/build/reader path. Every corrected node field,
source identity, coverage target and planet must agree with the reader. Only
then resolve the assembly gap and restore the six affected stages to planned.
Keep the 21 explicit mathematical/supplier gaps unless independently solved.

The alternative is a separately scoped, tested assembly implementation in the
merger, checker and promotion path. It also requires integration-test outputs
beyond this issue. Neither alternative is implemented by this checkpoint.

## Inherited scope and inventory

The intended inventory is unchanged: **16 definitions, 33 constructions,
23 comparisons, 42 theorems, 17 lemmas, one application; 280 API items,
196 tests and 34 planets; 31 pinned baseline citations, 32 requests and
22 gaps including assembly**. Definitions/constructions have 260 API items
and 183 tests. The raw root contains only one definition with four API items
and four tests; its successful checker output is not a 132-node assembly check.

Coverage remains:

| Stages | Status | Remaining canonical repair |
| --- | --- | --- |
| D.1, D.2, D.5, L0 | planned | Existing supplier/mathematical gaps remain explicit. |
| D.3 | partial | Residue-spanning prerequisite correction. |
| D.4 | partial | Cubic-example proof-route correction. |
| L1 | partial | Ordered dual-exponential statement and source. |
| L2 | partial | Four Iwasawa comparison/dependency corrections. |
| L3 | partial | Regulator, growth, lattice, reciprocity and determinant dependencies and source identities. |
| L4 | partial | PG.6 ownership, image/descent, elementary-divisor, refinement and de Rham corrections. |

No stage is closed. The register has 26 source issues: the prior 24 confirmed
and one rejected issue, plus unreviewed E121. No source-issue verdict was changed.
The four red-team handovers retain their existing dispositions: Bloch–Kato
input stays at Selmer L4; the early classical syntomic supplier is external;
D.1 and the Bloch model supply D.2; and finite Soulé classes/products have a
single early supplier instead of a late-M.8 cycle.

This run checked the reviewed library audit, accepted RS-26 and current
LocalFieldsRamification, NumberFieldArithmetic and LocalGaloisGroups interfaces.
No new mathematics or carrier was planned. Baseline and full-source receipts
from earlier workers remain attributed to them; this run makes no exhaustive
31-declaration, 35-source or cubic-numerical re-verification claim.

## Validation and security

- Normal root `check_blueprint.py`: zero errors and warnings with supplied index.
- Unchanged-world materialized-root failure and both canonical-preview checks:
  reproduced; preview checks use no declaration index because they test
  representation/ownership, not a fresh baseline source audit.
- `lean-check`: exit 0, nine expected warnings only.
- File-scope/content checks, retained-review/hash comparison and `git diff --check`:
  passed before submission.
- PDFs and extracted pages stayed in disposable scratch; no passage enters the
  repository. Warwick source retrieval failed; no publisher-copy claim is made.
- No suspicious operational instructions were encountered in the inspected data.
  Prior review/checkpoint text was treated as evidence and checked against code.
  No second claim, source execution, shared build, background process, manual
  label change or merge was performed.

The scratch directory can be deleted: the hashes, correction records and preview
procedure above preserve everything needed for the authorized continuation.
Repeated root-only revisions cannot close this review finding.
