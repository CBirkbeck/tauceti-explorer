# Completed package review, round 2

Job `REV-PKG-HilbertModularVarietiesAndShimuraCurves~2`, issue #9219. Codex, session `codex-S48UfE`, 2026-10-13. This is a completed independent fixing review. Verdict: **needs_changes**. The reviewer wrote neither package round.

Read the [review report](../reviews/REV-PKG-HilbertModularVarietiesAndShimuraCurves~2.md) for the source audit, adversarial pass covering all 182 targets, ten signature checks and exact revision requirements. Resume any revision in the [package README](../packages/HilbertModularVarietiesAndShimuraCurves/README.md), at the five groups listed below. Accepted packets were not edited; all 181 accepted targets and the added general-field definite Ihara target remain.

## Applied fixes

- H0.5 now requires determinant a local integral unit for the lattice stabilizer; diag(2,1) is a negative control.
- H4.15 distinguishes existence of a tame-congruent lift from a chosen lift; the N=5, p=2 collision and p=3 contrast have computed Lean examples.
- Corrected the quadratic fundamental-unit example and required positive torsion level.
- Corrected Deligne–Pappas and Taylor page locators; replaced a retired adic supplier and source/Check process narrative.
- Replaced vacuous coefficient/support Checks by rank-one, zero-coefficient, proper-support and affine-line computations.
- Removed the irrelevant split-place comparison prerequisite from the division-prime uniformisation theorem. The local Needs graph is acyclic and follows the displayed order.
- Made the H6.5 local input and H3.8 descent obligations explicit.

## Remaining revision requirements

1. **H6.5:** write Taylor's complete ordinary-extension/CM-character, paired torsion and polarization input/output contract; the current unspecified qualification is insufficient.
2. **R18.3.29 / R18.4.27:** locate and normalize the early even-degree/no-finite-discrete-series Galois construction and weight-two semistable compatibility above p, or restrict the targets and consumers to the sourced cases.
3. **R18.2.14 / R18.2.17–18:** construct/source the saturated ramified relative filtration and determinant comparison, or restrict to unramified direct summands and adjust consumers.
4. **H3.8:** complete the ordered polarization, representative-change and unit-quotient Hecke descent, with level/coprimality hypotheses.
5. **R18.4.19:** verify Kisin's primary numbered quotient theorem and its framed/fixed-determinant dimension conventions. Manning–Shotton supplies a secondary statement; the primary author endpoint was inaccessible.

The formal quotient, basic PEL transfer, local-type, trace-formula and patching extensions remain explicit conditional supplier requests. The report distinguishes these requests from supplied library theorems. The published Khare field-degree assertion is excluded from effective neatness; do not silently reinstate it. Neither algebraic-space representability nor the restricted odd-prime sign statement needs to be undone.

## Ownership and validation

Current upstream main `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were read without building. No complete target was removed or moved as a duplicate. The boundaries now name the current twisted-cochain, trace-dual-family and rational GL₂ Hecke-degree suppliers; these do not duplicate the kept arithmetic variants. The AdicSpacesPartII supplier correction changes no target ownership.

The October 12 shape rule supersedes the previous review's exhaustive geometric Lean requirement. The representative file is 716 lines, with real-bodied light definitions and native-carrier theorem signatures; heavy geometric targets remain in the README. Final `lean-check` at Mathlib 082e2d3 / Tau Ceti f790474 exited 0 with exactly 40 existing `sorry` warnings, no other warnings or errors. Its three added negative controls are computed proofs. `scripts/check_sorry_data.py`, namespace/API inventory, prerequisite checks, `git diff --check` and `intake.py check-files` pass. Metadata remains `topic = "math.NT"`.

Public source versions and hashes are recorded in the report. PRR23 §1.4.2, pp.31–33 was read directly in the maintainer-cleared copy; no private file or passage was copied into the deliverables. Scratch retrieval files are not needed to resume: use the durable locators, defects and contracts in the report and README.
