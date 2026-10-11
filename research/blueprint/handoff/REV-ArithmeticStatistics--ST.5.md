# Handoff: REV-ArithmeticStatistics--ST.5

Completed independent review of issue #6315 by Codex, session `codex-gLnCnp`, on branch `codex-gLnCnp-review-st5`, 2026-10-11. Input author: `codex-nILjKa`, #6357. The packet is accepted as a finished target-level pass, with honest remaining gaps. This is not a checkpoint and does not claim proof closure.

Deliverables: corrected `research/blueprint/packets/ArithmeticStatistics--ST.5.json`, synchronized `research/blueprint/suggested/ArithmeticStatistics--ST.5.lean`, and full `research/blueprint/reviews/REV-ArithmeticStatistics--ST.5.md`. The report and packet contain all durable evidence; the temporary source downloads and logs are removed after submission.

All 55 new nodes checked: 40 verified, 15 corrected, no added targets or unverifiable nodes. All 17 pinned baseline signatures confirmed. Twelve public source PDFs independently downloaded and matched their recorded SHA-256 checksums. All five source findings independently confirmed and version-scoped. The 194 accepted parent imports retain their IDs and titles unchanged; this review checks those import contracts rather than claiming to re-review all their mathematics. There are 38 APIs, 32 tests, 17 gaps, 18 requests, and no new planets beyond the parent's shared six.

Corrections to preserve in assembly:

- PR Conjectures 1.1/1.4 use fixed-global-field coefficient-height models, with long Weierstrass equations in characteristics 2/3. They are not automatically the parent's minimal invariant-height Q-family. Added `G-source-family` and expanded `R-family-adapters` for these models, odd/even-degree hyperelliptic families and BKLPR Conjecture 6.9. Matching the first numerical σ(n) does not identify denominators.
- The theta obstruction's polar form is the negative Weil-cup pairing; no division by 2 in the dyadic polar convention. The existing A3 theta group and Cartier kernel duality are imported; `R-theta-quadratic` is an A3 extension, not a re-planned A2 central extension.
- Mathlib already has infinite product measures, finite-marginal uniqueness and both Borel–Cantelli lemmas. Five actual declarations are now baseline citations, and `R-probability` is removed. The cofinal isotropic inverse-system construction and Borel comparison remain `G-lc-duality`.
- The square-order harmonic mass bound uses the telescoping integer product tending to 2, not ζ(2) alone. Fixed finite powers of N are well-ordered lexicographically; retain Wood's valid induction and the absolute-convergence justification.
- The general-abelian rank-bound node now asks L0 for BKLOS Lemma 9.1's exact sequence, instead of citing an elliptic-only parent node. Keep the explicit positive uniform rank-index hypothesis and `G-endomorphism`; [3] is a safe specialization.
- Added the maximal-isotropic q-vanishing projection, a concrete global-splitting diagnostic over Z/4, and corrected PR/BKLOS/BKLPR locators.
- Current Tau Ceti already implements scalar moment determinacy from completed OrthogonalL2Bases; StandardDistributions delegates to it. Its exponential-integrability hypothesis does not prove the Wood group/partition uniqueness statement.

The live issue lists three deliverables; the queue additionally lists `research/blueprint/readmes/ArithmeticStatistics--ST.5.md`. That reader was read but not edited because it is outside the live issue's authorized paths. The orchestrator/assembly must synchronize it with the corrected packet and suggested catalogue, especially the source family and supplier changes. This scope difference does not prevent completion of the live review deliverables.

Preserve the input's tier move: the exact special three-Selmer analytic-rank-zero criterion is owned by `ArithmeticStatistics:ST.5/refinement-analytic-rank-zero-criterion` in tier 14. `OrdinaryAutomorphicFormsAndModularityLifting` in tier 20 must import that criterion. It must not become an upward prerequisite here. The primary Skinner–Urban proof remains explicitly `G-analytic`.

Validation: `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticStatistics--ST.5.json` reports zero errors/warnings. `lean-check research/blueprint/suggested/ArithmeticStatistics--ST.5.lean` succeeds at Mathlib 082e2d3 / Tau Ceti f790474, with 47 warnings all for `sorry` and no other warnings. The file has seven native target forms, 23 native API forms, 17 planned tests and five numerical examples; all are suggestions, and the 48 omitted targets are expressly catalogued with missing-interface reasons. `git diff --check` passes. No Lean process remains running.

No second issue is to be claimed in this run. The pull request body records Refs #6315 and this session; once submitted, the next action belongs to intake/assembly and the maintainer.
