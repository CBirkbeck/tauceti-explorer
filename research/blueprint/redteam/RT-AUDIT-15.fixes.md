# RT-AUDIT-15: fixes

Fixer: Claude Code, session `cc-f805bf`, 29 September 2026 (issue #4010, job FIX-RT-AUDIT-15).
- **Findings and verdicts.** `RT-AUDIT-15.result.json` and `RT-AUDIT-15.review.json`. The red team made six findings, all of medium severity, and the review confirmed all six.
- **What was changed.** Everything is in `research/blueprint/audit/AUDIT-15.result.json`; no other file changes. The audit's `review` object, every layer verdict and every target's `library` value are unchanged, as the review requires for all six findings.
- **What was checked.** I read every added declaration at Mathlib 082e2d3 / Tau Ceti f790474 at its file and line, and each one resolves in the pinned `declarations.tsv` under the stated full name.

## RT-AUDIT-15/1 (medium, library-claim): smooth-discrete representations exist (O0, MP.3)

**OverconvergentAutomorphicForms:O0**, target "Finite-rank analytic coefficient modules and locally analytic induced modules…":
- **Citations.** The target had none. It now cites `TauCeti.IsSmoothDiscrete` (TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean:254), `TauCeti.IsSmoothDiscrete.res` (:268) and `TauCeti.isSmoothDiscrete_iff_continuousSMul` (:324), all related.
- **Old note.** "No smooth or locally analytic representation theory of p-adic groups exists…" is replaced.
- **What is absent.** The new note first lists what the target lacks: locally analytic coefficient and induced modules, tensor/dual compatibility, and specialization to algebraic representations.
- **What exists.** It then credits the smooth-discrete API. That API works for arbitrary topological monoids or groups, with no finiteness or compactness assumption. It covers restriction along continuous homomorphisms, the continuity equivalence, and the constructors `ofDiscreteModule` and `ofDiscreteModuleMap` (:226, :376).
- **Limits.** It keeps the review's caveats: discrete coefficients only, not Banach or locally analytic modules, and no admissibility.

**MetaplecticAutomorphicForms:MP.3**, target "Equivariance, admissibility/finite-length…":
- **Old note.** It said "the only representation theory in the libraries is of finite groups, Lie algebras and algebraic groups", which contradicted the preceding target, whose note already cites `TauCeti.IsSmoothDiscrete`.
- **New note.** It lists the missing notions (admissibility and finite length, see-saw identities, Jacquet functors and filtrations, first-occurrence comparisons). It credits the smooth-discrete API with restriction, as equivariance vocabulary only.
- **Citations.** No declaration was added here. `TauCeti.IsSmoothDiscrete` is already cited under the preceding target, and the note names `IsSmoothDiscrete.res` with its location.

## RT-AUDIT-15/2 (medium, library-claim): analytic function theory over p-adic fields (O0)

In O0's target "Radius of analyticity locally uniformly in the weight family":
- **Citations.** The target had none. It now cites `HasFPowerSeriesOnBall` (Mathlib/Analysis/Analytic/Basic.lean:74), `AnalyticAt` (:110) and `AnalyticOnNhd` (:120), all related.
- **Old note.** "There is no locally analytic function or distribution theory in either library" is replaced.
- **New note.** Mathlib's analytic function theory is stated over any nontrivially normed field, and ℚ_p is one (PadicNumbers.lean:872). It includes `AnalyticAt.comp` (Composition.lean:859).
- **What is not supplied.** The note keeps the gaps the review names: the radius locally uniform in the bounded Hilbert weight family, locally analytic distribution spaces, and the rigid/affinoid comparison. `AnalyticAt` alone gives no uniform estimate over an affinoid weight parameter.

## RT-AUDIT-15/3 (medium, error): four supplier/consumer entries removed (HilbertModularVarietiesAndShimuraCurves)

Removed from `duplicates`:
- R18.2 → ShimuraCompactifications:C6.
- R18.3 → GL2AutomorphicRepresentationsAndTransfer:R16.2.
- R18.5 → NeronModelsAndSemistableAbelianVarieties:R11.3.
- R18.6 → PotentialModularityAndCompatibleSystems:R23.2.

Kept, as the review asks: R18.3 → GL2AutomorphicRepresentationsAndTransfer:R17.3, H6 → R23.2, and every other entry. R18.5's and R18.6's `duplicates` are now empty.

## RT-AUDIT-15/4 (medium, error): six supplier/consumer entries removed (MetaplecticAutomorphicForms)

Removed from `duplicates`:
- MP.0 → AutomorphicLFunctionsAndLocalFactors:AL.0.
- MP.2 → tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant.
- MP.4 → AdelicAlgebraicGroups:AA.1.
- MP.4 → AutomorphicLFunctionsAndLocalFactors:AL.0.
- MP.5 → AutomorphicLFunctionsAndLocalFactors:AL.0.
- MP.6 → GrossZagierAndArithmeticHeights:GZ.6.

Every other entry is kept. The `duplicates` of MP.0, MP.2 and MP.4 are now empty. MP.3's was already empty.

## RT-AUDIT-15/5 (medium, error): eight supplier/consumer entries removed (OverconvergentAutomorphicForms)

Removed from `duplicates`:
- O2 → HodgeTateAndCanonicalSubgroups:T4.
- O3 → HodgeTateAndCanonicalSubgroups:T5.
- O4 → PerfectoidShimuraVarieties:S5.
- O4 → HilbertModularVarietiesAndShimuraCurves:H4.
- O5 → HodgeTateAndCanonicalSubgroups:T5.
- O6 → ShimuraCompactifications:C6.
- O7 → HodgeTateAndCanonicalSubgroups:T5.
- O8 → PerfectoidShimuraVarieties:S6.

Every other entry is kept. The `duplicates` of O3, O4 and O5 are now empty.

## RT-AUDIT-15/6 (medium, error): three supplier/consumer entries removed (PadicFamilies)

Removed from `duplicates`:
- L0a → PotentialAutomorphyInfrastructure:PA.2.
- L0a → OrdinaryAutomorphicFormsAndModularityLifting:R21.1.
- L2a → PadicMeasuresIwasawaAlgebras:L0a.

L0a's `duplicates` is now empty. Ownership of the generic projector does not move.

## Why the 21 removed layers are not duplicates

The audit schema has no field for supplier or consumer links, so they are recorded here. Each removed layer imports from the audited layer, or supplies it, as the review documents stage by stage. These links are dependencies, and they stay in the roadmaps' `requires` and stage text. No mathematics is deleted or transferred.

## Checks

- `python3 research/blueprint/intake.py check-files research/blueprint/audit/AUDIT-15.result.json`: 0 problems. The file parses, and every target has at most five declarations.
- The script that applied the edits asserted three things: each removal hit exactly the named entry, 21 in all; each note replaced was the one named; and no citation was duplicated.
- No Lean file is involved, so nothing was compiled.
