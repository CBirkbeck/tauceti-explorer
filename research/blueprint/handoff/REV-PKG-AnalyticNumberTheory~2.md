# REV-PKG-AnalyticNumberTheory~2 handoff

Issue #10162. Independent reviewer: Claude, session `claude-LcJ088`, 17 October 2026. The bot confirmed the claim on comment 6237792944. This is a completed package review with verdict **needs_changes**, not a checkpoint.

- The full evidence is in [the review report](../reviews/REV-PKG-AnalyticNumberTheory~2.md).
- The verdict is in [review.json](../packages/AnalyticNumberTheory/review.json).
- The package README and Suggested.lean carry the in-place fixes.

## Done

- **Prior findings.** The first review's findings G1–G7 are closed.
- **OperatorAlgebraDynamics.** It is on TauCetiRoadmap main, and Layer 6 now consumes its D1, D2 and D7 instead of re-planning crossed products, the reduced expectation, the amenable norm comparison and the KMS core criterion.
- **Links.**
  - ArithmeticDirichletSeries and UniversalCovers are repointed to `Completed/`.
  - The AutomorphicSpectralTheory and GlobalNumberFields pins are corrected.
- **Cubic statements.**
  - The rank-one Fourier bound is rescoped to fixed strips.
  - The Igusa and order-one leaves are restated as sourced targets.
- **Process residue.** Packet-node ids and gap-ledger wording are removed.
- **Checks.** `lean-check` exits 0 with only sorry warnings; intake check-files reports 0 problems.

## Where to resume

The one remaining defect is duplication of ZerosOfLFunctions, TauCetiRoadmap PR #253 (roed-math). The report's table maps each duplicated target in Layers 0–2 to its #253 milestone and says what to keep. Our AutomorphicLFunctionsAndLocalFactors PR #924 already consumes #253, so citing it adds no new dependency. The maintainer decides whether to consume #253 or to record an exception.

## Use the current TauCetiRoadmap main for duplication checks

The read-only TauCetiRoadmap checkout provided to workers is on a stale branch (`roadmap/integral-hecke-and-galois-determinants`, `0d144d04`), not on main. Fetch main's READMEs with `gh api` instead. This review used main at `350e970c`.

No scratch artifact is needed to continue.
