# REV-PKG-EllipticCurveModularityWild3Adic

Issue #9211. Codex, session `codex-qWXJnv`, 2026-10-14. Branch `codex-qWXJnv-review-9211`. Independent of the package author (Claude, session `claude-6Z0HDV`, #9167). Verdict: **accepted with corrections applied**.

## Completed

The independent report contains the adversarial pass for every one of the 76 numbered targets, the primary-source audit of all 21 author-flagged additions and a random sample of 15 other targets, ten Lean signature comparisons, current ownership checks and source receipts. All 55 packet target names, 82 API names and 68 distinct named checks remain in the README. All 25 definition/construction subsections have at least three discriminating Checks. No packet or foreign roadmap was edited.

The fixes cover the finite-Galois hypothesis for Kummer restriction; scalar induction before descent to the prime field; canonical uniformizer data, coefficient Frobenius, relation-word and wild-inertia formulas; generator-wise monodromy rather than a zero operator; the residue-field square-class and coefficient-filtration arguments; Dieudonné algebra and filtration checks; the conductor-five classification table; the contravariant filtration and pullback/pushout directions; the elliptic Frobenius degree argument; cyclotomic reference level structure and transported pairing; the determinant finiteness argument; and the exceptional modularity branches. The two exceptional curves have actual equations and discriminant/j checks in Lean, with named nonconstant modular-map targets in the README. The mixed level-75 branch retains its CM point, and all sextic twists of j=0 use CM induction.

## Ownership and supplier changes

Current upstream was checked at TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the newer and Completed roadmaps. General local H1 dimensions are consumed from LocalGaloisGroups Layer 1; 1.1 retains only the explicit cube basis, ramification lines and restriction specialization. Global reciprocity is supplied by current ClassFieldTheory Layers 11–12. No complete upstream target was retained as new work.

ComputationalNumberTheory CN.5 provides metadata, not the mathematical binding for a modular-map certificate. That supplier edge was removed: the two finite polynomial certificates, their rational functions, extension over poles, nonconstancy and cusp normalization are now explicit subtargets of 6.11. No foreign packet was changed; a later reconciliation of the original packet's dependency edge should follow the accepted README.

This roadmap is outside the 94-roadmap Caraiani–Newton order. Its upstream draft must follow all suppliers, including GL2ModularityLifting tier 22 and the outside-order conditional EllipticCurveModularity and CM packages. The original author's possible redistribution of generic compact-type and wild-descent targets remains a maintainer ownership decision; it is not an unfulfilled mathematical supplier contract in this package.

## Validation

- `lean-check` on the final Suggested.lean: exit 0, only declaration-uses-sorry warnings, at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The file has 561 lines; auxiliary heavy definition names are in its closing comment.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: no offenders.
- `python3 scripts/check_blueprint.py` on the unchanged accepted packet: zero errors and warnings. Direct enumeration gives 68 distinct named checks (the validator's aggregate reports 67).
- `python3 research/blueprint/intake.py check-files` on the five changed deliverables and this handoff: zero problems.
- `git diff --check`: clean.
- `metadata.toml` remains the single fitting line `topic = "math.NT"`.

## What remains

No unresolved review defect or checkpoint. The maintainer can proceed to the supplier-ordered upstream draft using the corrected package and accepted review.json. Formalization of the heavy objects, proofs and two finite modular maps is the roadmap's proposed work; this review does not claim those implementations exist. Public source files and temporary logs are deleted with scratch after the PR opens; the report retains source links, hashes and locators.
