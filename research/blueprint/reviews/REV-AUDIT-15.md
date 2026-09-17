# Review of AUDIT-15

**Job** REV-AUDIT-15 · **Date** 2026-09-17 · **Verdict `accepted`** · **90 corrections**

Baseline: tauceti `f790474`, mathlib `082e2d3`.

Scope: the five roadmaps of `research/blueprint/audit/AUDIT-15.json`: `HilbertModularVarietiesAndShimuraCurves`,
`MetaplecticAutomorphicForms`, `OverconvergentAutomorphicForms`, `PadicFamilies` and
`QSeriesPartitionsAndMockModularForms`. As submitted, that is 46 layers, 206 targets, 146 citations
naming 110 distinct declarations, and 80 duplicate claims.

The review ran in two passes. The first applied 70 corrections and was cut off by a session limit
at the end. The second treated that work as a draft: it re-checked every first-pass correction and
every claim against the source, and made 22 further edits. Two of those revise first-pass entries
and are folded into them, which gives 90 corrections.

## Verdict and main findings

The audit's picture holds: almost nothing of these roadmaps is in either library, and no target it
called absent is present. Final verdicts: 43 not built, 2 partly built (QM.0, PadicFamilies L0a),
1 process (R18.6), each consistent with its targets.

- **The most important finding is a missed theorem.** Mathlib proves **Euler's pentagonal number
  theorem**, both in `R⟦X⟧` over any commutative ring (`PowerSeries.WithPiTopology.tprod_one_sub_X_pow`)
  and for ‖x‖ < 1 in a complete normed ring (`eulerFunction_eq_tprod`). It also proves the general
  theorem that products `∏ (1 + fᵢ)` of power series whose orders tend to infinity are multipliable.
  QM.0 must reuse these rather than plan them.
- **One verdict moves.** QM.1's theta target was marked `mathlib`, but Mathlib has only the S- and
  T²-laws of θ. Neither library has a theta multiplier system, a half-integral-weight automorphy
  factor or a Jacobi form. The target is now `partial`, and QM.1 is not built.
- **Several notes denied or omitted things that exist.** None of these makes an absent target
  present, but each changes what a planner should reuse:

| Layer | Audit note | In the libraries |
| --- | --- | --- |
| O6, PadicFamilies L0 | said no U_p exists (O6); omitted it (L0) | Tau Ceti's classical U_p on M_k(Γ₁(N)) for p ∣ N, `HeckeRing.GL2.heckeUNat`, with aₘ(U_p f) = a_{pm}(f); also the level-raising operator V_d (`TauCeti.CuspForm.levelRaise`) |
| L2, L2a, O6 | presented compact-operator and Fredholm theory as archimedean or Hilbert-space only | Mathlib's Fredholm alternative `IsCompactOperator.hasEigenvalue_or_mem_resolventSet` and Tau Ceti's `IsCompactOperator.finiteDimensional_genEigenspace_nat` hold over any complete nontrivially normed field; `Matrix.charpolyRev` is the finite-rank characteristic power series |
| H6 | said Mathlib has Galois descent for quasi-coherent sheaves | false; Mathlib has faithfully flat descent for modules (`comonadicExtendScalars`), fpqc descent of some morphism properties and abstract stacks, but no descent of schemes |
| MP.0 | said there are no Lagrangian polarizations | `TauCeti.SymplecticForm.IsLagrangian` and the coordinate Lagrangians of V × V, over ℝ only |
| MP.4, R18.3 | said there are no adelic points of an algebraic group | Sp₂ₘ(A) for any commutative algebra A (`TauCeti.Symplectic.pointsMulEquiv`) and G(A) through `TauCeti.HopfAlgebra.pointsFunctor`, as abstract groups with no topology |
| MP.1 | omitted | projective representations and their linearization over the central extension by k^× (`TauCeti.IsProjectiveRep.exists_factorSet_linearization`) |
| QM.1, QM.3, QM.4 | said there is no elliptic transformation law (QM.1); omitted the rest | `jacobiTheta₂_add_left'`, `EisensteinSeries.E2_slash_action`, `TauCeti.Real.erf` |
| O0 | omitted | `PadicInt.continuousAddCharEquiv` (continuous characters of ℤ_p ↔ topologically nilpotent elements) |
| H1, H2, R18.2 | said there is no representability theorem (H1); omitted the rest | Zariski-local representability (Stacks 01JJ), relative normalization of schemes (Stacks 035H), `IsRegularLocalRing`; still no normal- or regular-scheme predicate |

## What was checked

**Mechanical.**
- All 46 batch layers appear, with no extras.
- Every citation resolves at its library, file and line, with the namespace confirmed in the file.
  None is `private`, an axiom or a bare structure field, and no cited file contains `sorry` or
  `admit` once comments are stripped.
- Two submitted names did not resolve. `HarmonicAt` is `InnerProductSpace.HarmonicAt`, and
  `Algebra.IsCentralSimple` appears only in a docstring, since Mathlib uses `Algebra.IsCentral` with
  `IsSimpleRing`.
- After correction there are 185 citations naming 145 distinct declarations, all re-validated. One
  theorem is missing from `declarations.tsv` because its name sits on the line after `theorem`; I
  confirmed it in the source:
  `TauCeti.hermiteAnnihilationCLM_comp_hermiteCreationCLM_sub_hermiteCreationCLM_comp_hermiteAnnihilationCLM`.

**Presence (55 targets: 5 `mathlib`, 50 `partial` as submitted).** Every one was re-derived from the
source, reading `variable` lines and hypotheses. Checks that mattered:
- **Fitting decomposition (L0a).** It needs `[Ring R] [IsArtinian R M] [IsNoetherian R M]`, so it
  covers finite modules. That U is invertible on the stable image is a short derivation, not an
  exported lemma. There is no x^(n!) idempotent lemma and no lim¹ or exactness theorem for inverse
  limits of modules.
- **Fredholm index theory.** Tau Ceti's needs `[IsRCLikeNormedField 𝕜]`, while its kernel
  finiteness and Mathlib's Fredholm alternative do not.
- **Tau Ceti's symplectic forms and Lagrangians** are over ℝ only.
- **`Matrix.SL2.commutator_eq_top`** is over a field with some a ≠ 0, a² ≠ 1, not over rings.
- **Monster (QM.6).** The Monster file transcribes a presentation of M (not of M × 2) and proves
  nothing about the presented group.
- **Theta and eta (QM.1).** The eta S-law is proved; the T-law of eta, Dedekind sums and the theta
  multiplier are absent.

**Absence (151 targets).** 116 were re-searched from scratch by concept, by Mathlib naming convention
and by grep of both trees and `declarations.tsv`. The other 35 are exports or constructions on
missing objects, and were checked against those prerequisites. Confirmed absent from both libraries:
- **q-series and moonshine:** q-Pochhammer symbols and q-binomials (a Mathlib TODO), partition
  congruences, Kloosterman sums, Bessel functions, Hardy–Ramanujan and Rademacher, Maass forms and
  the ξ operator, mock modular forms, quantum modular forms and Eichler integrals, the modular
  j-function, vertex algebras and moonshine.
- **Metaplectic:** the Heisenberg and metaplectic groups, Stone–von Neumann, the Weil index, the
  Hilbert symbol, Schwartz–Bruhat spaces, dual pairs and theta lifts, Jacquet functors,
  half-integral-weight and Jacobi forms, Whittaker functions, GSp, a symplectic basis theorem.
- **p-adic:** p-adic and overconvergent modular forms, Hida theory, modular symbols (Tau Ceti's
  ModularForms layer 8 is unbuilt), eigenvarieties, Fredholm determinants and Newton polygons,
  p-adic L-functions, pseudorepresentations, Selmer complexes, Kato classes, (φ,Γ)-modules,
  locally analytic and rigid-analytic theory, Igusa towers, Hodge–Tate maps, the Koecher principle.
- **Shimura and Hilbert:** Weil restriction, Shimura data and reflex fields, abelian schemes and their
  duals and polarizations, Weil pairings, Tate modules and p-divisible groups, level structures and
  moduli problems, Deligne–Pappas and Rapoport models, Hasse invariants, formal schemes, modular
  curves, quaternion orders and class sets, Jacquet–Langlands, Taylor–Wiles patching, Drinfeld's
  upper half-plane.

**Duplicates.** Rule applied: a claim stands when the named layer itself states one of the layer's
targets, or a special case or generalization of one. A layer that only supplies an input or consumes
an output is not a duplicate, which is the reading of "state the same targets" in the audit brief.
All claims resolve to live, visible atlas stages, and none belongs to the retired
`FoundationsAndLibraryIntegration`.

## Corrections (90)

| Kind | Count | Items |
| --- | --- | --- |
| Library and verdict | 2 | QM.1 theta `mathlib` → `partial`; QM.1 partly built → not built |
| Citations renamed or replaced | 3 | `InnerProductSpace.HarmonicAt`; `Algebra.IsCentral`; Monster presentation instead of its Coxeter matrix |
| Evidence added | 30 | verified citations added to 28 targets (L2a and O6 each gained citations in both passes); the main ones are in the table above |
| Notes fixed | 10 | Descent (H6, which also gained a citation), polarizations (H1), SL₂ hypotheses (H0), Fitting invertibility (L0a), p-adic compact operators (O6), Fourier inversion and ℝ-only symplectic forms (MP.0), Poincaré series of index 0 (QM.3), q-binomial search (QM.0), numerical types (R18.5) |
| Duplicates removed | 14 | see below |
| Duplicates added | 25 | see below |
| Duplicate replaced | 1 | O7: `IgusaVarietiesAndTorsionConcentration:IG.2` → `HodgeTateAndCanonicalSubgroups:T5` (the ordinary Igusa tower O7 uses) |
| Duplicate note corrected | 1 | PadicFamilies L1 → `ModularSymbolsPadicLFunctions:L2`: its integral period theorem comes from that roadmap's L1 |
| Summaries | 4 | QSeries, Metaplectic, Overconvergent rewritten; PadicFamilies updated for U_p and the p-adic Fredholm alternative |

**Removed (14).** None of these layers states any of the listing layer's targets:
- **Same roadmap:** PadicFamilies L5 → L0a.
- **An input only:**
  - QM.6 → `ModularCurvesPartII:R12.3`.
  - PadicFamilies L4 → `GlobalGaloisDeformations:R04.1`.
  - R18.4 → `WeightsInEtaleCohomology:R34.5`, since R18.4 defers purity to it.
- **A consumer or co-consumer only:**
  - H6 → `PotentialModularityAndCompatibleSystems:R23.1` (Moret–Bailly).
  - O0 → PadicFamilies L2a.
  - R18.6 → `PerfectoidShimuraVarieties:S5`.
  - L2a → `AutomorphicGaloisRepresentationsPartII:AG2.3`, which calls itself "not a duplicate analytic
    eigenvariety engine".
  - MP.7 and MP.8 → `RankZeroOneBSD:BSD.2`, where the split of work is explicit on both sides.
- **The overlap the note claims is not in the named layer:**
  - R18.1 → `ShimuraData:D5`, which has no quaternionic datum.
  - QM.2 → `ExponentialSumsAndCircleMethod:ES.3`. Its singular integrals and local densities play no
    part in the Hardy–Ramanujan–Rademacher route.
  - QM.5 → `HabiroNahmSeries:HB.10`.
  - R18.4 → `AlgebraicModularFormsAndSerreWeights:R15.1`, which has no cohomology or local systems.

**Added (25).** All of them:

| Layer | Added | Overlap |
| --- | --- | --- |
| H0 | `ShimuraData:D0`, `ReductiveGroupsPartII:RG2.0a` | Weil restriction and the Hilbert groups |
| H1 | `AbelianSchemesAndArithmeticModuli:A2`, `A3` | dual abelian scheme, polarizations, Weil and Tate-module pairings |
| H4 | `AbelianSchemesAndArithmeticModuli:A3` | Weil and Tate-module pairings for the linearized Weil pairing |
| H2 | `AdicSpacesPartII:R2` | Hasse ideal and its formal blow-ups |
| R18.3 | `AutomorphicFormsOnReductiveGroups:AF.5`, `GL2AutomorphicRepresentationsAndTransfer:R17.3` | algebraic modular forms on double cosets; definite and indefinite Jacquet–Langlands |
| R18.4 | `GL2AutomorphicRepresentationsAndTransfer:R17.3` | Jacquet–Langlands relating the definite and indefinite realisations |
| PadicFamilies L0 | `ModularSymbolsPadicLFunctions:L2` | p-stabilizations and their U_p-eigenvalue |
| PadicFamilies L1 | `ModularSymbolsPadicLFunctions:L1`, Tau Ceti `ModularForms#layer-8-…` | integral periods; the integral modular-symbol module |
| PadicFamilies L4 | `AutomorphicGaloisRepresentations:R19.6`, `PhiGammaModulesAndIwasawaCohomology:PG.7`, `AutomorphicCongruences:L3` | Hecke-algebra Galois representations; triangulations; universal zeta elements |
| PadicFamilies L5 | `AutomorphicCongruences:L5w` | the Hilbert Hida family |
| O1 | `PerfectoidSpaces:P9` | descent of coefficient sheaves along a profinite torsor |
| MP.1 | Tau Ceti `InductionRestriction#layer-7-…` | projective representations and central extensions; largely built, though the representation group and Clifford obstruction are not |
| MP.2 | Tau Ceti `QuadraticFormInvariants#6c-…` | the Hilbert symbol, dyadic case included |
| MP.4, MP.6 | `AutomorphicLFunctionsAndLocalFactors:AL.0` | the adelic Schwartz–Bruhat space; self-dual measures |
| MP.5 | `GeometryOfNumbersAndQuadraticArithmetic:GN.3` | theta series of quadratic forms |
| QM.0 | `HabiroNahmSeries:HB.4` | q-Pochhammer products |
| QM.5 | Tau Ceti `ModularForms#layer-8-…` | Eichler integrals and period polynomials (unbuilt) |
| QM.6 | Tau Ceti `CFSGStatement#s1-…` | the Monster presentation, built |

After correction, 91 duplicate claims remain.

## Findings worth repeating

- **Formal q-series already have their first classical theorem.** QM.0 should start from Mathlib's
  pentagonal number theorem and its multipliability theorem for power-series products. The product
  formula for Σ p(n)qⁿ is a one-line corollary that Mathlib lists as a TODO.
- **Compact-operator theory is not archimedean-only.** The Fredholm alternative and the
  finite-dimensionality of each ker (K − μ)ⁿ with μ ≠ 0 already hold over p-adic fields. What
  PadicFamilies L2a and O6 lack is the Fredholm determinant and Banach modules over affinoid algebras.
- **The classical U_p and V_p exist in Tau Ceti.** The ordinary projector and p-stabilization layers
  should be built on `HeckeRing.GL2.heckeUNat` and `TauCeti.CuspForm.levelRaise`.
- **Adelic groups exist as abstract groups** through Tau Ceti's functor of points. MP.4 and R18.3
  must add the topology, the restricted-product structure and double-coset finiteness.
