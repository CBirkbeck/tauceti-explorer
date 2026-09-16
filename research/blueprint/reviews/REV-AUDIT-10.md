# Review of AUDIT-10

**Job** REV-AUDIT-10 · **Date** 2026-09-16 · **Verdict `accepted`** · **103 corrections**

Baseline: tauceti `f790474`, mathlib `082e2d3`.

Scope: the five roadmaps of `research/blueprint/audit/AUDIT-10.json`: ModularCurvesPartII,
NeronModelsAndSemistableAbelianVarieties, PELModuli, ShimuraCompactifications and ShimuraData.
That is 48 layers, 213 targets, 349 declaration citations (268 distinct declarations in 213 files)
and 77 duplicate claims.

The audit's layer verdicts all hold: 43 not built, 4 partly built (R12.4, C0, C1, D1) and 1 process
(R13.4). Its weak point is the wording of its absence notes. Many "nothing exists" and "only over a
field" statements are false even where the status is right. Seven targets have partial library
support that the audit marked absent, and one private declaration was cited twice. Everything could
be fixed in place.

## What was checked

**Mechanical checks.**
- All 48 batch layers are present, and every verdict agrees with its targets' statuses.
- The 77 duplicate ids are live atlas stages. None is retired or self-referential.
- Every citation matches `declarations.tsv` at the stated library, file and line, except three
  declarations the index omits: the anonymous instances `WeierstrassCurve.Affine.Point.instAddCommGroup`
  and `UpperHalfPlane.instContractibleSpace`, and `«Proj»`.
- No cited file contains `sorry`, and nothing cited is an axiom.

**Lean.** I used a Tau Ceti build pinned to the same Mathlib. There, 196 of the 213 cited files are
byte-identical and built. Eight of those modules have sources newer than their `.olean`, which showed
up as shifted declaration ranges, so their names were checked at source instead.

Every other name resolves with axioms only among `propext`, `Classical.choice` and `Quot.sound`, with
one exception: `HeckeRing.GL2.commRingHeckeRingGamma0` is `private`.

After the corrections there are 454 citations of 351 distinct declarations. Of these, 303 were
re-checked in Lean and all are public, undeprecated, standard-axiom and at the stated line; the other
48 were checked at source. Anonymous instances are cited by their Lean-generated names.

**Presence claims.**
- R12.4 T1 holds. Lean finds `ConnectedSpace` for the orbit space of Γ(N) on ℍ by instance search.
- C0 T1 (toric cones and faces), C1 T4 (mixed Hodge structures, Deligne splitting, strictness) and
  D1 T3 (pure Hodge structures and Deligne's equivalence) hold as stated.
- The process verdict for R13.4 matches its text: the layer is defined as the combination of R13.4a and
  R13.4b.

**Absences.** Every absent or partial target (209) was searched again independently. The searches
went by concept and by Mathlib naming convention, over both trees and the index. Every reported hit
was read at source, with its namespace, `variable` lines and hypotheses, before it was used.

**Duplicates.** All 77 claims were checked against the target layers' own text, and all hold.

## Corrections

| Kind | Count |
|---|---|
| Status changes, absent → partial | 7 |
| Citation errors (private declaration, wrong line, fit labels) | 5 |
| False non-existence or over-general statements in notes (status unchanged) | 39 |
| Literal grep claims reworded | 8 |
| Citations completed | 40 |
| Duplicates added or corrected | 4 |

**Status changes.** In four of these (C1 T1, C5 T2, C6 T6, D2 T5) the audit had itself labelled its
citations "special case", while marking the same targets absent. Elsewhere, for example D5 T2 and
D5 T3, it marked GL₂-only special cases partial.

| Target | Now partial because |
|---|---|
| R12.1 T4, homothety invariance of G_k | Mathlib's `EisensteinSeries.eisSummand_SL2_apply` and `eisensteinSeries_slash_apply` are the homothety Λ_{γz} = (cz+d)⁻¹Λ_z for ℤz + ℤ, in coordinates |
| R13.3 T2, cusp widths near the boundary | Tau Ceti's `cuspTranslationOrbitWidth` gives a width at every cusp of a finite-index subgroup |
| C1 T1, rational boundary components | Mathlib's `isCusp_SL2Z_iff` and `Subgroup.IsArithmetic.isCusp_iff_isCusp_SL2Z`: the cusps of an arithmetic group are ℙ¹(ℚ) |
| C4 T1, tori over a base with characters | Tau Ceti's `SplitTorus.groupScheme` and `characterGroupSchemeMap` work over any commutative ring |
| C5 T2, finite generation of graded sections | The level-one ring ℂ[E₄, E₆]; Mathlib also proves Proj of a finitely generated graded algebra proper |
| C6 T6, cusp forms by the boundary ideal | Mathlib's `isCuspForm_iff_coeffZero_eq_zero` and `CuspForm.discriminantEquiv`: level-one cusp forms are the ideal (Δ) |
| D2 T5, Hermitian symmetric-domain structure | ℍ is a complex manifold, SL₂(ℝ) acts on it transitively, properly and isometrically, and Stab(i) is explicit (`gl_smul_I_eq_I_iff_of_pos`) |

**Citation errors.**
- R14.1 T3 and R14.2 T3 cited `HeckeRing.GL2.commRingHeckeRingGamma0`, which is `private`. It is
  replaced by the public `commSemiringHeckeRingGamma0` and the multiplication table
  `heckeTCompositeGamma0_mul_eq_sum_divisors_gcd`. R14.1 T3 also gains the Petersson adjoint
  `peterssonInner_slash_left_adjugateGL`.
- R12.4 T1: the contractibility instance is on line 68, not 67.
- Two fits change from "special case" to "related":
  - M0 T2, the rank-two multiplier lemma, which is a property of GSp₂ rather than a construction of the
    similitude group;
  - C2 T1, proper discontinuity, which is an ingredient of the gluing, not a special case of it.

**False non-existence statements.** The most frequent is "group schemes and isogenies exist only over
a field" (R11.1 T1, R11.1 T4, R11.2 T3, R11.5 T5, M1 T3). In fact:
- Mathlib's `hopfSpec` gives group schemes over any affine base.
- Tau Ceti has `ClosedSubgroupScheme` and `GroupScheme.IsIsogeny` over an arbitrary or affine base,
  with base change, and `CommHopfAlgCat.IsIsogeny` over any ring.

Two notes also overstated generality:
- R11.2 T1: the identity component needs an algebraically closed field.
- D2 T4: the cited `quotientStabilizerHomeomorph` needs a compact quotient. Mathlib's
  `isOpenMap_smul_of_sigmaCompact` is the applicable result.

The other false statements, each now worded accurately:
- **Picard and polarisations:** no Picard functor (Mathlib has `CommRing.Pic.functor`), and no
  polarisations (Hodge-structure polarisations exist; M1 T1, M5 T5).
- **Analysis:** no theta functions (`jacobiTheta₂`), and no Lie group structure on any closed subgroup
  (the circle is one).
- **Group actions and descent:** no group action on cones (the pointwise action applies), and no descent
  of varieties (Galois descent of tori exists; D3 T6, C2 T5).
- **Cusps and parabolics:** widths only at ∞ (R12.3 T1), and no stabiliser-of-filtration description of
  GL_N parabolics (`mem_parabolic_weightCocharacter_iff`).
- **Toric geometry:** no dual cone (`PointedCone.dual`) and no toric chart of any kind (C0 T6, C0 T7).
- **Connectedness:** "the reverse direction is not stated" (R12.4 T2). `connectedSpace_primeSpectrum_of_injective`
  supplies it, so both directions hold for affine curves.
- **Smaller corrections:**
  - no special fibres (`TauCeti.specialFiber`);
  - no universal families (the universal Weierstrass curve);
  - unramified primes only for number fields;
  - only absolute sheaf cohomology;
  - no compact open levels;
  - the representation side has no tensor structure;
  - the automorphy factor appears only in the slash action.

**Literal grep claims.** These were reworded; in each case the substance stands:
- "reflex" matches "reflexive";
- "similitude" appears in a metric-space docstring;
- "Siegel" appears in Thue–Siegel–Roth and in a TODO;
- "algebraiz" matches the `algebraize` tactic;
- `IsExcellent` appears in a docstring recording its absence;
- "restriction of scalars" matches other notions;
- "special point" appears in contour integration;
- "HeckeAlgebra" appears in a comment.

**Citations completed.** Forty entries gained relevant uncited declarations. Examples:
- Mathlib's Δ ≠ 0 with Δ = (E₄³ − E₆²)/1728 (R12.1 T3);
- Tau Ceti's local orbifold models at elliptic points (R12.2 T4);
- analytic traces and T_p ∘ V_d = V_d ∘ T_p (R12.5 T4, R13.4b T2);
- corestriction with cor ∘ res = index (R14.3 T3);
- `Representation.symmetricPower` for Sym^{k−2} (R14.3 T1, R14.5 T4);
- the de Rham period rings and Fontaine's θ (R11.5 T3);
- function-field higher ramification groups (R11.5 T4);
- fpqc subcanonicity (M1 T4);
- local equivalence of quadratic forms, the hypothesis side of Hasse–Minkowski (M3 T4);
- geometric connectedness of SO_n (M3 T5);
- purely inseparable normalisation-finiteness (M4 T4);
- non-isomorphic quadratic twists and `ofJ_j` (M6 T2);
- Galois-descended torus characters (D1 T2);
- rigid monoidal representation categories (D1 T5);
- the effective PSL₂(ℤ) action (D5 T3).

**Duplicates.**
- Added NeronModels R11.3 ↔ ShimuraCompactifications C4. Both construct extensions of abelian schemes
  by tori and the polarised lattice uniformisation (Raynaud extension, Mumford–Faltings–Chai data), and
  C4 does not depend on R11.3.
- Added R13.5 → AlgebraicModularFormsAndSerreWeights R15.3. Both construct the Igusa curves.
- The R12.4 → #81 §5C note no longer says the three statements are recorded "word for word".

The five roadmap summaries were brought in line with the corrected entries.

## Most important finding

**Most of the audit's absence claims were stated more strongly than the libraries warrant.** The
verdicts survive, but 39 notes said something does not exist that does. Seven targets marked absent
have genuine special cases in the libraries, four of them cited by the audit itself as special cases.

The costliest pattern is the belief that group schemes and isogenies exist only over a field. Mathlib's
`hopfSpec` and Tau Ceti's group-scheme API (`ClosedSubgroupScheme`, `GroupScheme.IsIsogeny`, split tori
over any ring) work over a base. A Néron-model or PEL formalisation should start from them rather than
from abelian varieties over a field.

Two tooling lessons:
- **Check Lean builds for staleness.** A build whose sources are byte-identical to the baseline can
  still hold stale `.olean` files. Compare modification times as well before trusting Lean's
  declaration ranges.
- **Resolve names in Lean.** Resolving each cited name there, rather than in the index, is what exposed
  the private Hecke-ring citation.
