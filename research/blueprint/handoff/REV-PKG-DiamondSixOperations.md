# REV-PKG-DiamondSixOperations — handoff

Issue #9209, completed by Codex, session `codex-6oopjk`, on 2026-10-13. The independently authored package is **accepted with fixes** and ready for the maintainer's draft TauCetiRoadmap PR. This is a completed package review, not a checkpoint.

## Deliverables and fixes

- Updated `research/blueprint/packages/DiamondSixOperations/README.md` in place: distinguish constant locally spatial hypercovers from strict-disconnected ones; distinguish the complement of the closed point from the generic-point open at higher rank; justify skyscraper internal-Hom vanishing on every open; qualify finite rank and dualizing degree over nonzero rings; retain local splitting without asserting the unknown smoothness implication; remove the remaining imported Haar definition/API restatement from the layer; add empty/one/two-point finite trace checks; verify printed Huber pages and state the input-amplitude bound correctly.
- Updated `Suggested.lean`: six additional examples pin empty trace, singleton unit, impossibility of normalising an empty fibre over a nonzero ring, the value 3 of two-point F_5 averaging, degree-zero cohomology of the unit complex, and the zero-ring locally constant module. The empty, singleton, empty-unit and zero-ring examples have real proofs. No geometric carrier or sorry-backed definition was added.
- Added `review.json` with reviewer `independent-review-REV-PKG-DiamondSixOperations` and status `accepted`.
- Added `research/blueprint/reviews/REV-PKG-DiamondSixOperations.md`: sources, coverage, supplier contracts, current-library duplication, all 14 signature comparisons, and a 97-row adversarial table covering the 109 principal declaration names and their local API clauses.
- `metadata.toml` remains `topic = "math.AG"`. No packet, supplier package or upstream checkout changed.

## Validation

- Final `lean-check` exited 0 at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: 22 warnings, all `declaration uses sorry`, no errors. Suggested.lean has 370 lines, five real-bodied definitions, nine theorems and 18 examples. These are representative signatures; `sorry` theorems are not claimed formalised.
- `python3 scripts/check_blueprint.py research/blueprint/packets/DiamondSixOperations.json`: zero errors and zero warnings; packet unchanged.
- `python3 research/blueprint/intake.py check-files` on the six reviewed deliverables, including the unchanged metadata and this handoff: zero problems.
- `git diff --check`: clean. All retained declarations and APIs of the 90-node packet are covered; every one of the 109 principal names is a Lean declaration or in the closing comment. All 25 Checks blocks have at least three bullets.
- Directly checked all six previously unverified Huber references in the maintainer-cleared book: 1.6.10 p. 80, 5.5.8 p. 304, 6.2.2 p. 329, 7.2.2 p. 368, 7.5.3 p. 390, 7.5.4 pp. 391–396. Checked 15 randomly selected ECD targets against v4, 14 April 2026; the report preserves the target/locator table. No cleared-book file or passage was copied.

## Duplication and ownership for the next stage

Current TauCetiRoadmap main/Completed was checked at `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine newer roadmaps and four newer Completed roadmaps were included in object-based searches. Both checkouts were read only.

The author had already removed `normalizedHaar` and seven APIs, owned by SmoothRepresentationsOfLocalGroups SR.0.3 and SR.1.1 (`HasUnitProOrder`, `HaarMeasureWithValues`, normalised uniqueness and integration). This review also removes the remaining layer-level measure-construction/API restatement and replaces its checks with checks of `isUnit_card_quotient_of_profiniteOrder`. Keep the imports in the boundary. The bridge is retained because it derives unit quotient orders from zero primewise pro-order exponent plus coefficient nilpotence; it does not define the imported condition. General-Λ locally constant freeness is retained as an explicit extension of Mathlib's integer-coefficient theorem. No other true duplicate was found.

The package already owns three requested interfaces not supplied lower down: S1.1 `fibreDimension_le_dimTrg` and `dimTrg_canonicalCompactification`; S2.1 `exists_hypercover_strictlyTotallyDisconnected` and `hypercover_commonRefinement`; S5.3 `quotientByProfiniteAction` for the image relation of a nonfree profinite action. Keep the higher consumer links pointed to these names until a maintainer explicitly transfers ownership. E3's compact-generation criterion is already an exact lower supplier.

ClassicalAdicEtaleCohomology §8.2 owns local compactification over nondiscretely valued algebraically closed fields, and §9.6 owns higher-rank curve duality with an open bounded coefficient and arbitrary unbounded first argument. Their proof obligations remain with the accepted lower package. This review does not claim the DVR-only compactification citation proves the general-field statement or that those targets have Lean proofs.

## What remains

No further work remains on #9209. The maintainer may use the corrected accepted package for upstream submission. Geometric/enhanced carriers and all theorem proofs remain the roadmap's future formalisation work. Source-locator, duplication and mathematical decisions needed by that stage are preserved in the report; scratch files are disposable.
