# Handoff: REV-PKG-AutomorphicFormsOnReductiveGroups (#10164)

Codex, session `codex-WXRm5K`, 2026-10-17. Complete independent fixing review; accepted with corrections. I did none of the package jobs. This is not a checkpoint.

## Done

Read the accepted revision-5 packet, library audit, package, previous handoff and binding protocols. Checked every author-flagged source family, a reproducible fifteen-subsection locator sample (seed 10164), all 48 subsections mathematically, all thirteen Lean theorem signatures, pinned library contracts and current duplication. The full review report records exact locators, source-access limits, hypotheses and computations.

Applied the mathematical corrections in the package: discrete-ℤ smoothing example, full real split centre for local square-integrability, irreducibility in principal-series coherent vanishing, general versus current finite-order conductor API, exponent-zero unit group, exact-order cyclotomic-field example, rank-zero height/formula conventions and the explicit normalized GL₂ Hecke coset calculation. Added the U(2,1) Hodge example and Ichino–Prasanna dual-coefficient comparison, Arthur and Lapid citations and precise Kostant locators. The Lean closing comment now explicitly names the heavy README definitions. Added a proved n=0,1 numerical-boundary example.

## Existing work removed from the target list

The independent enveloping-product, abelian enveloping/symmetric and tensor-centre construction targets of §2.2 were deleted. Their supplied statements now occur only in the supplier boundary:

- `TauCeti.UniversalEnvelopingAlgebra.prodEquivTensor`;
- `TauCeti.UniversalEnvelopingAlgebra.symmetricAlgebraEquiv`;
- Mathlib `Subalgebra.centralizer_range_includeRight_eq_center_tensorProduct`, with first-factor freeness and commutativity specialized over ℂ.

All three already exist at the relevant pins. The retained new target is the reductive Harish-Chandra isomorphism assembled from these and LieHighestWeight's semisimple isomorphism. No other ownership move was made. The prior package handoff incorrectly describes the character Hecke endomorphism as current-only: both untwisted and character variants exist at Tau Ceti f790474. Current Hecke-character conductor takes finite order, while GlobalNumberFields Layer 9 already plans the general finite conductor; do not re-plan it here.

Current duplication was checked against the runner-provided upstream `origin/main` `779644b8ca438ce9874ef0f09745b0e1dcc3b268`, including all nine post-snapshot roadmaps and four named Completed roadmaps, and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The checked-out upstream branch was not assumed to be main. Compile pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Validation and next step

Suggested.lean: 484 lines; `lean-check` exit 0; twenty warnings, exclusively sorry warnings (thirteen theorems, seven examples). The added numerical example is proved. Intake check-files: zero problems. Git diff whitespace check passes. The report contains all source locators and the complete adversarial/signature tables; no scratch file is needed to continue.

No review defect remains. The maintainer can take this accepted package into the tier-11 upstream bundle with ArithmeticLocallySymmetricSpaces. Existing higher-tier consumer comparisons remain their owners' work. No second issue was claimed.
