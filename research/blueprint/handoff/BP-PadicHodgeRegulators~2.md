# BP-PadicHodgeRegulators~2 — blocked assembly checkpoint

Refs #11092. Codex / GPT-6, session **codex-HNxLJr**, 19 October 2026.
The bot confirmed claim comment **6276502649**. One issue was claimed.

**Unfinished: the permitted deliverables cannot repair the canonical assembly.**
The issue allows only the root packet, unified reader, suggested Lean file and
this handoff. The remaining review finding requires either integration-code
changes or a coordinated migration of the two part packets, all outside those
paths. This checkpoint records reproducible evidence and preserves the
mathematics; it does not claim to resolve that finding or accept the plan.

## Changes and checks in this run

- Read WORKERS.md, both protocols, UPSTREAM_GUIDE.md, the ten-stage reviewed
  library audit, accepted RS-26 and the existing review/handoffs. The issue's
  named `REV-PadicHodgeRegulators~1.md` does not exist at the tested commit.
  The queue records `REV-PadicHodgeRegulators` as the actual predecessor;
  [that report](../reviews/REV-PadicHodgeRegulators.md) was read in full.
- Inspected the actual merger, promotion path and checker at repository commit
  `c7f92e76f8bf67502db46fe35e646d40f45cf551`. No script implements the root's
  `imports`, `importedNodes`, `targetCorrections` or `assembly.sourceAliases`.
- Verified both import hashes and exact node-ID inventories. Constructed a
  temporary resolved view, applying aliases and all corrections in order.
  Compared every corrected field, source-reference identity list, coverage
  target and displayed planet against the raw merge.
- Tried materializing that view as a root with its normal filename, using the
  **unmodified checker and world context**. It fails with exactly **131
  duplicate-ID errors and no other errors**. This directly rules out copying
  the imported nodes into the root as a permitted repair.
- Added these receipts and the scope boundary to `assembly.revisionCheckpoint`
  and the existing assembly gap. Set the packet to `partial`; six stages with
  unapplied canonical corrections now have `partial` coverage and precise
  remaining actions. The independent review object is unchanged.
- Updated the reader's checkpoint notice. No target, hypothesis, proof route,
  API, test, planet, source issue, supplier request or Lean declaration changed.

The current upstream LocalFieldsRamification unit/Teichmüller interface,
NumberFieldArithmetic finite-place dictionary and LocalGaloisGroups Layer 7
completed multiplicative carrier were read as ownership checks. No general
field/unit/completion mathematics was added. Neither the read-only upstream
checkout nor its library was built or edited. This run makes no new exhaustive
source, baseline-declaration or numerical verification claim: those mathematical
receipts remain attributed to the original worker and independent reviewer.

## Reproduced failure

| Experiment | Result |
| --- | --- |
| Root alone through `merge_blueprints` | 1 declaration |
| Both unchanged parts plus root | 132 declarations; unapplied corrections |
| Intended resolved view | 132 declarations, all 132 coverage targets accounted for |
| Ordered correction records | 27 records on 26 distinct targets |
| Final differing corrected fields | 33 |
| Source-reference identity lists differing from the raw merge | 8 targets |
| Of those, targets requiring source aliases | 7 |
| Materialized root through the unchanged checker | 131 duplicate-ID errors; no other errors |
| Displayed planet whose mathematical fields differ | `L1/dual-exponential` |

The eighth source-list difference is the additional LZ2014 citation on
`L1/dual-exponential`; it is not another alias. The seven aliases affect
`L3/auxiliary-h-comparison`, `L3/big-exponential`,
`L3/big-exponential-obstruction`, `L3/explicit-reciprocity`,
`L3/singular-euler-specialization`, `L3/rubin-coleman-map` and
`L4/split-multiplicative-augmentation`.

The part identities remain:

| Part | Nodes | SHA-256 |
| --- | ---: | --- |
| `PadicHodgeRegulators--D.1.json` | 72 | `2f70c0c000179cbd10c77a243d003214ca1ad0b171ff2e7f977972e62405f22c` |
| `PadicHodgeRegulators--L3.json` | 59 | `cf912c4d5b5a2b2846764d9eed3c219b37da2d300c84995a8d8857674867c9d7` |

`scripts/blueprints.py:merge_blueprints` reads only `packet.nodes` and silently
uses the last definition of each ID. That last-write behavior is **not** a valid
repair: `scripts/check_blueprint.py:check` explicitly rejects a root node also
owned by another blueprint packet. Changing input order or suppressing the
checker's canonical context would conceal the defect.

### Standalone reproducer

Run the following Python from the repository root, passing an existing on-disk
scratch directory as its first argument. It reads repository files and writes
only a hypothetical packet in that scratch directory. No promotion, repository
copy, atlas-data mutation or checker-context adjustment is involved.

```python
import copy
import hashlib
import json
import sys
from pathlib import Path

sys.path.insert(0, "scripts")
from blueprints import drop_source_excerpts, merge_blueprints
from check_blueprint import check, world

rid = "PadicHodgeRegulators"
root_path = Path("research/blueprint/packets") / (rid + ".json")
root = json.loads(root_path.read_text())
parts, intended = [], {}
for item in root["imports"]:
    path = Path(item["packet"])
    assert hashlib.sha256(path.read_bytes()).hexdigest() == item["sha256"]
    part = json.loads(path.read_text())
    assert {n["id"] for n in part["nodes"]} == set(item["nodeIds"])
    parts.append((path.stem, part))
    aliases = root["assembly"]["sourceAliases"].get(path.name, {})
    for node in copy.deepcopy(part["nodes"]):
        assert node["id"] not in intended
        for ref in node["sources"]:
            ref["sourceId"] = aliases.get(ref["sourceId"], ref["sourceId"])
        intended[node["id"]] = node
for correction in root["targetCorrections"]:
    intended[correction["target"]].update(copy.deepcopy(correction["fields"]))
for node in root["nodes"]:
    assert node["id"] not in intended
    intended[node["id"]] = copy.deepcopy(node)

snapshot = {
    "roadmaps": [{"id": rid, "stages": root["scope"].copy()}],
    "stages": [{"id": sid, "owner": rid} for sid in root["scope"]],
    "stageEdges": [], "edges": []}
raw_packets = parts + [(rid, root)]
raw = merge_blueprints(snapshot, raw_packets, {})
solo = merge_blueprints(snapshot, [(rid, root)], {})
raw_nodes = {n["id"]: n for _, p in raw_packets for n in p["nodes"]}
fields = {(c["target"], key) for c in root["targetCorrections"]
          for key in c["fields"]}
deltas = [(nid, key) for nid, key in fields
          if raw_nodes[nid].get(key) != intended[nid].get(key)]
source_deltas = [nid for nid in intended
    if [s["sourceId"] for s in raw_nodes[nid]["sources"]] !=
       [s["sourceId"] for s in intended[nid]["sources"]]]
assert set(intended) == {nid for c in root["coverage"] for nid in c["targets"]}

trial = drop_source_excerpts(copy.deepcopy(root))
trial["nodes"] = list(intended.values())
for key in ("imports", "importedNodes", "targetCorrections"):
    trial.pop(key, None)
trial_path = Path(sys.argv[1]) / root_path.name
assert trial_path.resolve() != root_path.resolve()
trial_path.write_text(json.dumps(trial, indent=2, ensure_ascii=False) + "\n")
errors, warnings, _ = check(trial_path, None, world())
duplicate_errors = [e for e in errors if "also appears in" in e]
assert len(errors) == len(duplicate_errors) == 131
assert not warnings
assert len(deltas) == 33 and len(source_deltas) == 8
print(solo["roadmaps"][0]["blueprint"]["declarations"],
      raw["roadmaps"][0]["blueprint"]["declarations"], len(intended))
print(len(deltas), len(source_deltas), len(duplicate_errors))
# Expected: 1 132 132
# Expected: 33 8 131
```

The diagnostic checker call uses no declaration index because it tests duplicate
ownership. The separate normal root check below used the supplied pinned index.
The source hashes above and the checked-in correction payloads are sufficient
to reproduce this checkpoint after temporary files are removed.

## Required expanded repair and its acceptance criteria

The maintainer needs to authorize **one** coherent path:

1. Implement a supported assembly resolver and validate it through
   `scripts/blueprints.py`, `scripts/promote.py` and
   `scripts/check_blueprint.py`, with the corresponding integration tests.
   It must resolve the hash-identified imports, source identities, ordered
   corrections and root metadata into a single canonical view. The actual
   promotion/build/reader paths must consume that same view.
2. Authorize a coordinated canonical-owner migration that includes both
   `research/blueprint/packets/PadicHodgeRegulators--D.1.json` and
   `research/blueprint/packets/PadicHodgeRegulators--L3.json`, together with the
   root. Apply the corrections and source identities to their actual owners,
   reconcile baseline/sources/requests/coverage metadata and update the root
   hashes. Fresh independent review must cover every changed canonical file;
   old acceptance is not approval of the migration.

Neither alternative is authorized by #11092's deliverable list. This checkpoint
does not edit those files or recommend reusing an old accepted review to promote
changed part packets.

The repair is finished only when the unmodified normal check/promotion/build
path presents exactly the intended 132 nodes, with no duplicate canonical
owners; all 33 currently differing fields and all eight source-reference lists
match; the coverage targets are exactly the resolved node set; and every planet,
source, baseline and request is attached to the same corrected representation.
In particular, the actual merged dual-exponential planet must show the ordered
adjunction, and the canonical good-Wach-basis target must import PG.6 instead
of retaining its superseded generic-theorem ownership. Compare against the full
reader, not just declaration counts. Preserve the 21 mathematical/supplier gaps
unless independently solved. Then obtain a fresh independent verdict.

## Coverage, inventory and inherited mathematical work

All ten intended target specifications remain present. Canonical assembly is
unfinished for the following six stages, so their coverage is now `partial`:

| Stage | Remaining assembly action |
| --- | --- |
| D.3 | Apply the residue-spanning prerequisite correction. |
| D.4 | Apply the cubic-example proof-route correction. |
| L1 | Apply the ordered dual-exponential statement and its LZ citation. |
| L2 | Apply four comparison/dependency corrections. |
| L3 | Apply regulator, obstruction, growth, logarithmic-factor, lattice, reciprocity and determinant dependencies and source aliases. |
| L4 | Apply the Wach-ownership, image/descent, elementary-divisor, refinement and de Rham comparison corrections and source alias. |

D.1, D.2, D.5 and L0 retain `planned` coverage. No stage is `closed`. These
coverage changes identify unfinished canonical assembly, not missing new
mathematical targets. The prior handoff and reader retain the exact 21
mathematical/supplier gaps and 32 requests. Including assembly there are 22
gaps. No request is discharged or added by this run.

The intended inventory is unchanged: 16 definitions, 33 constructions,
23 comparisons, 42 theorems, 17 lemmas, one application; 280 API items and
196 tests across all kinds, of which definitions/constructions have 260 API
items and 183 tests; 34 planets; 31 baseline citations. The root checker
sees only its one definition, four API items and four tests. Those smaller
numbers are not the assembled inventory.

The four red-team handovers retain their prior disposition, rather than being
declared newly repaired here: keep Bloch–Kato input at Selmer L4; keep the
external early CS producer request with the divided/undivided ranges distinct;
retain D.1 and the Bloch-model input into D.2; and retain the single early
finite Soulé-class/product supplier without a late-M.8 cycle. The detailed
source and mathematical checks remain in the prior report and reader.

## Validation and resumption

- `python3 scripts/check_blueprint.py research/blueprint/packets/PadicHodgeRegulators.json`
  with the supplied pinned declaration index: **zero errors, zero warnings**.
- Reproducer above: expected counts, import hashes and coverage equality pass;
  materialized-root rejection is reproduced without bypassing validation.
- `lean-check research/blueprint/suggested/PadicHodgeRegulators.lean`:
  **exit 0, nine expected theorem-admission warnings only**. The unchanged file
  has 192 lines, four real-bodied definitions, six proved examples and nine
  admitted theorem milestones. Available memory was 77 GiB; one check ran.
- Intake path/content checks and `git diff --check`: passed.
- The independent `review` object, all source-issue verdicts, both part hashes,
  and every mathematical contract remain unchanged.

No suspicious instruction was followed or found in the inspected issue comments;
the claim bot's confirmation was used only to establish the claim. Prior review
text was treated as evidence and its integration claims checked against code.
No source downloads, credentials, messages to third parties, extra claims,
library builds or background processes were needed.

Resume by expanding the repair's deliverables to one of the two paths above.
Repeating a root-only revision cannot resolve this blocker. The scratch
directory is disposable: this handoff, the root receipt, existing correction
payloads and reader contain everything needed for continuation.
