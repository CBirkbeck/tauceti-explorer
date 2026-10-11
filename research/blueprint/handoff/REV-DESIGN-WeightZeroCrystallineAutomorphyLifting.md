# Handoff: REV-DESIGN-WeightZeroCrystallineAutomorphyLifting

Completed independent review for issue
[#7107](https://github.com/CBirkbeck/tauceti-explorer/issues/7107), by Codex
session `codex-zAUWyT`, 11 October 2026. Branch:
`codex-zAUWyT-review-weight-zero`. The original design came from a different
session, `codex-DdIaCt` (#8851).

The packet review is **accepted** as a complete target-level planning pass.
All 21 nodes were checked: 12 verified, 9 corrected, none added or
unverifiable. All five pinned baseline citations stand. Six stages remain
planned, none closed; 20 supplier requests and 28 gaps remain explicit.
The report in `research/blueprint/reviews/REV-DESIGN-WeightZeroCrystallineAutomorphyLifting.md`
records source checks, every correction and orchestrator questions.

Corrections include the higher-rank prepared interface, a valid tower example,
explicit ordinary cyclotomic noncontainment, per-source locators and the
current-upstream audit. All six original source issues were confirmed. New
MT source issue E7 records a selected-block order discrepancy between the
local projector/diamond kernel and later global partitions. The packet and
reader consistently use selected block last, `(n−d,d)`. SR.2/SR.5/ALS.6 must
provide a joint comparison of projector, polynomial, level, diamond action,
local deformation condition and boundary Hecke map; `GAP-BLOCK-CONVENTION`
records the obligation. A new `n=3,d=1` test catches the mismatch.

Resume implementation through the existing supplier requests, especially:

- SR.2/SR.5/ALS.6 for the E7 comparison and adequate level-growth input.
- R08.3 for BCGNT Theorem 2.5.5's general weight-zero special-fibre reducedness;
  P9 for completed-tensor component/generalization geometry.
- G7 for the adequate tower and separately `GAP-CYCLOTOMIC` for the full
  prepared `ζ_p∈F` support boundary. The final global theorem only needs the
  noncontainment case.
- PA.5/PL.1/AG2.5 and the remaining precise contracts for ramified-p
  preparation, crystalline connects and all-place descent.

No supplier layer or link was moved or duplicated. Current upstream was
checked at roadmap commit `c251d2e42c66f14c279d1e5c2708c5a91d8c8aec` and Tau Ceti
commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the nine later
roadmaps. No duplicate arithmetic lifting API was found.

The packet checker with the pinned declaration index passed with zero errors
and warnings. `lean-check` elaborated the suggested file at the shared pinned
build with only twenty `sorry` warnings. Its arithmetic omissions are indexed
honestly; the typed generic core is not a formalization of the lifting
theorems. Reader synchronization and whitespace checks passed.

This is a completed review, not a checkpoint. Public source versions, hashes,
locators and remaining contracts are retained in the packet/reader; temporary
PDFs and notes are unnecessary for the next worker and are deleted at the end
of the run. No further job was claimed.
