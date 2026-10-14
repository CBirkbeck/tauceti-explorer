# Handoff: REV-PKG-ArithmeticQuantumTopology

Issue [#7916](https://github.com/CBirkbeck/tauceti-explorer/issues/7916); reviewer Codex,
session `codex-GWNbaZ`; 2026-10-14. **Completed independent review; verdict needs_changes.**
The input was Claude session `claude-gWFnvH`'s package in
[PR #9529](https://github.com/CBirkbeck/tauceti-explorer/pull/9529). This is not a checkpoint.

The corrected [README](../packages/ArithmeticQuantumTopology/README.md),
[Suggested.lean](../packages/ArithmeticQuantumTopology/Suggested.lean),
[review record](../packages/ArithmeticQuantumTopology/review.json) and
[review report](../reviews/REV-PKG-ArithmeticQuantumTopology.md) contain the work needed by
the next worker. No source downloads or scratch notes are needed to resume. No packet, tier,
other package or current upstream file was changed.

## Finished

Traced all 106 packet targets into the README; audited every numbered mathematical subsection,
including domains, degenerate cases, divisions, orientations and actual negative controls.
Personally read all eight source families marked unverified by the author and a random sample
of 15 other source records. The report records theorem/section/page locators, the full
adversarial table, supplier closure and current-library overlap. It distinguishes verified
statements from conjectural topology and does not certify the suppliers' open proofs.

Applied the local corrections in the package:

- Exterior meridians, Seifert longitudes, duality and universal coefficients in the surgery
  proof; opposite versus equal handle slides; the sign of E₈ stabilization.
- The inverse Jones variable, with the right-handed trefoil values 9/16 and −6 at q=2;
  e-power image completion rather than an h-adic identification; discriminating convergence,
  quantum-integer and root-category checks.
- Orientation-qualified cusped rigidity, regular refinements with height witnesses, independent
  gluing rows and square gluing-Jacobian nondegeneracy.
- Real-strip Faddeev integrability/comparison separated from continuation, reciprocal domains,
  positive-real and unit-circle unitarity, Schrödinger conjugation and the ℏ>1/4 parameter branch.
- Local D′ products separated from tempered lifts. The empty-wavefront smooth tempered
  counterexample corrects [AK] Appendix B, Theorem 8. [BDH] supplies the qualified local
  product/topology contract. Corrected contraction-test multi-indices and added divergent,
  constant and identity kernel controls.
- Finite root weights and branch choices, positive gauges, phase and noncommuting matrix
  controls, canonical fifth-root values, GZ/GSW normalization and the 5₂ field conversion.

Removed these duplicate or unsupported targets, with exact destinations:

1. `IsCompleteHyperbolic`: reuse current Tau Ceti's `HyperbolicMetric.HasFiniteVolume` /
   `IsFiniteVolumeHyperbolic` and GeometricTopology's existing metric contracts. Current
   `UpperHalfSpace.riemannianMetric` and similarities are imports; ideal-boundary geometry
   remains missing. The new cusped rigidity theorem is separate from the existing closed
   rigidity predicates.
2. General `boundedFunctionalCalculus`: reuse OperatorTheory/SelfAdjointSpectralTheory
   SA-B04–09 and SA-E01–03, including SA-E02's singular-point exclusion. Only the new
   Schrödinger pair, conjugated sum and three Φ-specific unitary operators stay here.
3. The ancillary first-Ohtsuki-coefficient/Casson assertion: no Casson construction or comparison
   was supplied. The full Ohtsuki comparison and its divisibility control remain in scope.

Existing Jones/Temperley–Lieb and Jimbo calculations, the abstract `BipartiteRibbonGraph`,
classical highest-weight/root-system inputs, integral lattice classification, Riemannian measure,
Fourier transform and temperate smooth multipliers are imports, not replacement developments.
The report gives the exact existing modules and roadmap layers. No removed stub remains.

## Remaining and where to resume

**R1 — geometric supplier and volume proof.** Resume at the report's R1, the README's supplier
contracts and §§5.1–5.3, 5.9–5.12, and Polylogarithms P.2. Supply ℂP¹ ideal boundary, PSL₂(ℂ),
oriented geodesic ideal regions with finite Riemannian volume, vertex-permutation and subdivision
rules. The proposed owner is an early prefix of GeometricTopology, Part II
(RT-AREA-topology/8), ordered before P.2 and this package's manifold comparisons. Do not make
P.2 depend on all of AQ Layer 5: that creates a cycle. P.2 remains the sole owner of the
Milnor/Lobachevsky comparison with D and its still-open source/proof gap. Close that proof and
export its exact comparison API. No formula was duplicated here.

**R2 — full finite étale descent.** Resume at the report's R2, README §§6.8, 7.2, 7.17 and
HabiroNumberFields HB.7, `followup-effective-global-descent`. Close `G-global-descent` and E23:
additive closure, effective finite-projective descent, actual chart base changes and
conservativity. Extend the result to the complete algebra B=R[T]/(δT²−1), including split
components, rather than one selected field component. Local rank-one freeness is insufficient.
Retain HabiroNahmSeries HB.8/HB.9's global-prefactor/regularity, all-order identification,
coefficient-transfer, signed Kummer-orientation and integral-gluing hypotheses until their
suppliers discharge them. The k=1 geometric GSW theorem does not discharge them.

**R3 — supplier packages and ordering.** Resume at the report's R3. HabiroCyclotomicCompletions,
HabiroNahmSeries, HabiroNumberFields, K3BlochGroups, Polylogarithms and
QSeriesPartitionsAndMockModularForms have neither checked package directories in this input
nor entries in current TauCetiRoadmap under those names. This family has no assigned
unit/bundle in CaraianiNewton's 94-roadmap ordering. The maintainer must assign an admissible
supplier-first order or explicit permitted bundle; supplier workers must complete and review
the required exports and bring them upstream before this package's draft upstream PR.
Q-series currently has `needs_changes`: its QM.5 reader's Kontsevich inverse-eta multiplier
gives −1 at −I instead of 1. This does not assert that all scalar cocycles are false. Other
accepted/scoped packet verdicts do not close R1/R2 or create upstream packages.

These actions touch files outside #7916's authorized deliverables. This review completed the
available local fixes and leaves exact cross-package actions, rather than marking the open
contracts as proved or inventing an upward citation. Once R1–R3 are resolved, the next independent
package review should verify the actual supplier exports and recheck affected comparisons.

## Validation

The packet validator reports 0 errors and 0 warnings, 106 nodes, 206 API items, 159 packet
unit tests and 36 planets. Its eight retained gaps and zero certified closed stages remain.
Suggested.lean elaborates at the pinned build: exit 0, exactly 19 warnings, all admitted-proof
warnings. Its Jones, cyclic-product, positive-charge and matrix-order controls are proved
examples. Every admitted signature was mathematically audited. The file is 636 lines and
heavy README definitions are explicitly covered in its closing comment.

The package/review/handoff intake check has 0 problems, and `git diff --check` passes.
The report records current upstream/library commits and elaboration pins. No library build,
language server, source excerpt, private source file or local filesystem path is submitted.
