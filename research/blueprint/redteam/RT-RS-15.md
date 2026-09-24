# RT-RS-15 — accepted ownership, incomplete atomic integration

Worker: Codex — `codex-a71f92`. Date: 2026-09-24. Refs #1621.

One medium finding. The mathematical split is supported, but its mandatory prerequisite reversal has not been applied by the actual integration path. This report does not relabel the proposal as mathematically cyclic: the cycle guard prevents that cycle by skipping an essential edge while retaining the dependent narrowing.

Input revision: `aac7b75b017eb9816b8d079e6b2e3eb1f04eee74`. The author was `astra-20260921-f6b2d8`; the reviewer was `cg-6b83f1`. Neither was this worker. The complete accepted proposal, original report, independent review, family evidence and both member documents were read. The comparison through `b25d93a8b113cc1f3649538533a440aee4c43596` changes no checked mathematical input or build code.

## Finding RT-RS-15/1 — the accepted replacement is not atomic in the build

Use A = `VectorBundlesAndIsocrystals:VB3:general-BC`, B = `VectorBundlesAndIsocrystals:VB4`, and P = `VectorBundlesAndIsocrystals:VB3:projectivized-properness`.

The accepted proposal requires **remove A → B, retain P → B, add B → A**. This is an explicit precondition of its sole narrowing, not an optional cleanup. Its promoted copy in `data/restructure/` is byte-identical.

| Observable | Accepted contract | Actual assembly |
| --- | --- | --- |
| A → B | Absent | Present |
| B → A | Present | Absent |
| A narrowed; B named in suppliedBy | Only with replacement | Already applied |
| RS-15 new links | Six | Five |
| RS-15 skipped links | None | B → A |
| Graph | Acyclic after replacement | Cycle avoided by skipping B → A |

The concrete mismatch follows from `scripts/restructure.py`: lines 71–85 apply narrow/drop annotations before the links loop; lines 94–96 skip cycle-closing links without rolling back those annotations. There is no removal operation. `scripts/build.py:60` invokes this path with the promoted proposals. Full `assemble(require_distances=False)`, including subsequent links and decompositions, preserves the mismatch in edges, requires, consumers and the narrowed-stage supplier annotation.

This is additional evidence beyond the existing review's warning. The review correctly rejected additive-only integration, but the accepted proposal has since been promoted into precisely a path that cannot execute its deletion. Merely repeating the prose condition does not prevent partial application.

Severity is **medium**: a real, bounded prerequisite/integration error affecting the narrowed layer. Neither roadmap nor the stronger target is deleted, and the guarded output is not cyclic.

### Source check

The early properness theorem is used for HN variation and the suitable local section cover; later family resolutions use that HN theorem. In the proof of II.3.1, printed p.76:

> By Theorem II.2.19, the same is true in an open neighborhood, finishing the proof.

II.3.5 then consumes the resolution results. Thus deleting B → A to satisfy the current guard would discard a genuine prerequisite; the required repair is the specified reversal. [Fargues–Scholze, Geometrization, II.2.16–20 and II.3.1–5](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), accessed 2026-09-24.

### Read-only reproduction

Run from the input revision. This produces no repository edits and does not invoke the HTML-writing build function.

```python
import json
import sys
from pathlib import Path
sys.path.insert(0, "scripts")
from restructure import apply_restructurings, load_accepted
from build import assemble

A = "VectorBundlesAndIsocrystals:VB3:general-BC"
B = "VectorBundlesAndIsocrystals:VB4"
raw = json.loads(Path("data/atlas.json").read_text())
proposal = json.loads(Path(
    "research/blueprint/restructure/RS-15.result.json").read_text())

for proposals in ([proposal], load_accepted(Path("."))):
    atlas, _ = apply_restructurings(raw, proposals)
    rec = next(r for r in atlas["restructurings"]
               if r["proposal"] == "RS-15")
    assert rec["links"] == 5
    assert rec["skippedLinks"] == [[B, A]]

atlas, _ = assemble(require_distances=False)
edges = {(e["source"], e["target"]) for e in atlas["stageEdges"]}
stages = {s["id"]: s for s in atlas["stages"]}
assert (A, B) in edges and (B, A) not in edges
assert A in stages[B]["requires"] and B not in stages[A]["requires"]
assert B in stages[A]["consumers"] and A not in stages[B]["consumers"]
assert stages[A]["restructured"]["action"] == "narrow"
assert B in stages[A]["restructured"]["suppliedBy"]
```

### Bounded correction and acceptance test

A maintainer-authorized fix must apply the original replacement to the actual build inputs, including both mirrored lists, or implement a supported transactional replacement operation with validation. Until available, defer/reject the dependent narrowing rather than mark it applied with a missing supplier. An invented JSON key that existing code ignores is not a fix.

Test the actual integration and full assembly, not only a hand-constructed intended graph: A → B absent; B → A and P → B present; requires and consumers agree; no skipped RS-15 links; graph acyclic; all seventeen stage IDs, twenty-three inherited target IDs and twelve external exports retained. The tests should also reject a missing/failed replacement before applying the narrowing. No integration file is edited by this red-team job.

## Conservation, ownership and rejected attacks

The twenty family leads reduce to eight pairs. BG0/VB0, BG1/VB0 and BG2/VB1 are linear foundations used in genuinely reductive constructions. BG0/VB2:classification is a misplaced lead: geometric bundle classification feeds BG2:uniformization, not the early torsor recognition. BG2/VB4 is a family input. BG3/VB3, BG3/general-BC and BG3/VB4 are additive/HN inputs to the full automorphism-group and stratum constructions, not replacements for them.

Both roadmaps remain. Ten stages have explicit decisions, only A is narrowed, and seven omitted stages remain by §15: BG2, BG2:smooth-Artin, BG4, VB2, VB2:ampleness, VB3 and VB3:positive-basic-examples. Both owner contracts have the claimed scope. The two-term family theorem, its comparisons and cover qualifications are explicitly retained.

All 23 inherited node statements were read and matched to surviving assembled nodes. The inventory retains three isocrystal nodes; three descent/slope/cohomology nodes; three ampleness/GAGA/curve nodes; four classification/extension/base-change nodes; two positive basic examples; two properness/topology nodes; three stronger general-BC nodes; and three HN/local-system nodes. Conservation does **not** certify the old statements: the inherited ring-versus-field, degree-versus-slope and local-system wording already singled out by the accepted review still need its stated reconciliation. They are not presented as newly discovered findings.

The seven external recipient contracts were read, not inferred from their names:

| Recipient | Preserved family inputs |
| --- | --- |
| ES7:parabolic | BG3, BG4 |
| GS0:loop-geometry | BG0 |
| HS0 | BG2:uniformization |
| HS2 | BG3 |
| RF4:G-torsors | BG0 |
| VS1 | VB1, general-BC, VB4 |
| VS4 | BG2:smooth-Artin, BG3, BG4 |

All twelve native exports and seven non-self owner-forwarding obligations hold in the intended graph. The nonbasic connected kernel is not reduced to the locally profinite quotient, the VS4 coefficient comparison stays separate, and early GS0 geometry is not completed Satake. The RF4 patching return does not feed BG0. Tau Ceti stage records are unchanged by the single-proposal application.

## Sources, baseline and limits

Fresh source work covered the affected properness/HN proof sequence, the two-term family theorem, the coefficient/sign convention, and the nonbasic automorphism/stratum interfaces. Printed p.75 was also inspected as an image; its degree/slope typo is already a known review correction. The downloaded author PDF has 356 pages and SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.

The entire pinned [Mathlib Isocrystal file](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Isocrystal.lean) was read, including variable hypotheses. Its Git blob independently matches `cfe4966b0359b5af9d4fa01b62a89185e7bf8fe6`. The carrier does not impose finite dimensionality; the cited classification is rank-one existence, not the full general-coefficient theorem. Tau Ceti remains pinned at `f790474821cf4256814db967cb154e7af3d0c369`.

All seven BG aggregate coverage records and the relevant AUDIT-20 review were checked. The aggregate still lacks VB entries and lists AUDIT-39 pending, but the separately stored review is accepted on 2026-09-23. This report does not repeat the older restructuring review's description of AUDIT-39 as a current unreviewed audit. No fresh exhaustive library-absence claim is made.

The four accepted corrections were rechecked as interface controls, not counted as new findings. Full Dieudonné–Manin/Brauer proofs, the Lubin–Tate bridge and unrelated inherited gaps were not closed. Neither a Lean proof nor completion of the inherited decomposition is claimed.

## Validation

The independent scratch check reconstructed the graph from both edge records and requires. It obtained 1,968 stages plus 51 external vertices, 3,508 original edges and 3,513 intended corrected edges. The corrected graph is acyclic; additive insertion is a failing negative control. It tested preservation, owner forwarding, prohibited reverse paths, both actual restructuring runs and full assembly. Detailed counts and input SHA-256 hashes are in the result JSON.

Commands passed:

- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-15.result.json`
- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-RS-15.result.json`
- `python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-RS-15.result.json research/blueprint/redteam/RT-RS-15.md`
- `python3 -m unittest tests.test_restructure tests.test_check_restructure tests.test_check_redteam tests.test_intake tests.test_redteam_queue`: 58 tests.

Lean was not run: no Lean file is a deliverable. Only the two red-team files are submitted; the reproducer and PDF remain scratch. No manual merge, label change, issue closure or atlas mutation was performed.
