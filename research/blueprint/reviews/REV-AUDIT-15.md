# Review of AUDIT-15

**Job** REV-AUDIT-15 · **Date** 2026-09-17 · **Verdict `accepted`** · **70 corrections**

Baseline: tauceti `f790474`, mathlib `082e2d3`.

## Scope

The five roadmaps of `research/blueprint/audit/AUDIT-15.json`:

- `HilbertModularVarietiesAndShimuraCurves`
- `MetaplecticAutomorphicForms`
- `OverconvergentAutomorphicForms`
- `PadicFamilies`
- `QSeriesPartitionsAndMockModularForms`

That is 46 layers, 206 targets, 146 declaration citations naming 110 distinct declarations, and 80
duplicate claims.

## Verdict and main finding

The audit's picture is right. Almost nothing of these five roadmaps is in either library, and no
target it called absent turned out to be present.

- **One verdict moves.** QM.1 goes from partly built to not built. Its theta target was marked
  `mathlib`, but Mathlib has only the S- and T²-laws of θ at the generators of the theta group.
  Neither library has the multiplier system, a half-integral-weight automorphy factor or a Jacobi
  form, and the audit's own note said so; the eta target, in the same state, was already `partial`.
- **The most important finding is a miss in the other direction.** Mathlib has **Euler's
  pentagonal number theorem**, both as an identity in `R⟦X⟧` over any commutative ring
  (`PowerSeries.WithPiTopology.tprod_one_sub_X_pow`) and for ‖x‖ < 1 in a complete normed ring
  (`eulerFunction_eq_tprod`). The audit's summary said there were no q-series identities. QM.0 must
  consume this theorem rather than plan it.

Most of the other corrections repair notes that misdescribed what exists, and fix duplicates.

## What was checked

### Mechanical

- All 46 batch layers are present, with no extras.
- Every citation resolves at its stated library, file and line. None is `private`, an axiom or a
  bare structure field, and `grep -n sorry` is clean in every cited file.
- Two names did not resolve:
  - `HarmonicAt` is `InnerProductSpace.HarmonicAt`.
  - `Algebra.IsCentralSimple` occurs only inside the module docstring of
    `Mathlib/Algebra/Central/Defs.lean`, which explains that Mathlib uses `Algebra.IsCentral` with
    `IsSimpleRing` instead.
- After the corrections: 179 citations naming 140 distinct declarations, all re-validated the same
  way. One Tau Ceti theorem sits on a split line and is missing from `declarations.tsv`
  (`TauCeti.hermiteAnnihilationCLM_comp_hermiteCreationCLM_sub_hermiteCreationCLM_comp_hermiteAnnihilationCLM`,
  `Hermite/Function/Operator.lean:125`); I confirmed it in the source.

### Presence claims

All 55 targets that claim something is present (5 `mathlib`, 50 `partial`) were re-derived from the
source, with `variable` lines and hypotheses. Checks that mattered:

- **Fitting decomposition (L0a).** Mathlib's version needs only `[IsArtinian R M] [IsNoetherian R M]`,
  so it covers finite modules. That U is invertible on the stable image is *not* an exported lemma;
  it is a short derivation. The note is corrected.
- **Partition generating function (QM.0).** The partition products are instances of Mathlib's
  general theorem `PowerSeries.WithPiTopology.multipliable_one_add_of_tendsto_order_atTop_nhds_top`,
  which is the coefficientwise finiteness QM.0 asks for; it is now cited as exact evidence. The
  product for Σ p(n)qⁿ itself is still a TODO in `GenFun.lean`.
- **Fredholm theory (L2, L2a).** Tau Ceti's Fredholm index theory needs `[IsRCLikeNormedField 𝕜]`, so
  it covers real and complex Banach spaces, not Hilbert spaces as a note said. Two results hold over
  any complete nontrivially normed field, p-adic fields included:
  - Mathlib's Fredholm alternative, `IsCompactOperator.hasEigenvalue_or_mem_resolventSet`.
  - Tau Ceti's `IsCompactOperator.finiteDimensional_genEigenspace_nat`.

  There is still no Fredholm determinant.
- **Monster (QM.6).** Tau Ceti's Monster file is a presentation of M itself, with Ivanov's central
  relator added, not of M × 2. It defines the presented group (`TauCeti.SporadicName.Group`) and
  proves nothing about it. The citation now names the presentation, not its auxiliary Coxeter
  matrix.

### Absence claims

- **Re-searched:** 116 of the 151 absent targets, by concept, by naming convention and by grep of
  both Lean trees and `declarations.tsv`. Four concept sweeps (q-series and moonshine, p-adic
  families, metaplectic theory, Shimura and Hilbert moduli) ran in parallel, and I verified every hit
  they reported in the source.
- **Checked against prerequisites:** the remaining 35 are exports, tests or constructions on objects
  shown absent.

Confirmed absent from both libraries:

- **q-series:**
  - q-Pochhammer symbols and q-binomials (a Mathlib TODO in `Pochhammer.lean`), partition
    congruences.
  - Kloosterman sums, Bessel functions (only implicit as the ₀F₁ case of
    `Complex.regularizedHGFun`), Hardy–Ramanujan and Rademacher.
  - Maass forms and the ξ operator; mock modular forms, Appell–Lerch sums and Zwegers completions;
    quantum modular forms.
  - The modular j-function (only `WeierstrassCurve.j` exists), vertex algebras, the Monster Lie
    algebra, moonshine.
- **Metaplectic:**
  - The Heisenberg group, Stone–von Neumann, metaplectic covers, the Weil index and the Weil
    representation.
  - The Hilbert symbol, Schwartz–Bruhat spaces, dual pairs and the theta correspondence, see-saw and
    Siegel–Weil.
  - Half-integral-weight and Jacobi forms, Whittaker functions, GSp.
- **p-adic:**
  - Hida theory and ordinary projectors, p-adic and overconvergent modular forms, modular symbols
    and Eichler integrals. Tau Ceti's ModularForms layer 8 plan is not built.
  - Eigenvarieties, Fredholm series and Newton polygons; p-adic L-functions.
  - Pseudorepresentations and Galois representations of modular forms, Selmer complexes, Euler
    systems, (φ,Γ)-modules.
  - Locally analytic and rigid-analytic theory, Hodge–Tate maps, Igusa towers, the Koecher
    principle.
- **Shimura:**
  - Weil restriction, the Deligne torus, Shimura data.
  - Abelian schemes, dual abelian varieties and their polarizations, Weil pairings, Tate modules,
    p-divisible groups.
  - Moduli problems and level structures, normal and regular schemes, formal schemes and blow-ups,
    Hasse invariants, compactifications, Hilbert modular forms.
  - Quaternion orders and Brandt matrices, Jacquet–Langlands, étale cohomology beyond Mathlib's
    pro-étale definition, Hecke correspondences.
  - Drinfeld uniformization, Taylor–Wiles patching, modular curves.

The sweeps did find material that the notes denied or omitted. None of it makes an absent target
present, but each item changes what a planner should reuse:

| Layer | Note said | In the libraries |
| --- | --- | --- |
| O6 | no U_p operator exists | Tau Ceti's classical U_p on M_k(Γ₁(N)) for p ∣ N, with aₘ ↦ a_{pm} (`HeckeRing.GL2.heckeSlashUpperTriModularFormEnd`) |
| MP.0 | no Lagrangian polarizations | Lagrangian subspaces of a real symplectic space and the coordinate polarization of V × V (`TauCeti.SymplecticForm.IsLagrangian`); `TauCeti.SymplecticForm` is over ℝ only |
| MP.4 | no adelic points of an algebraic group | Sp₂ₘ(A) for every commutative algebra A, the adeles included, as an abstract group (`TauCeti.Symplectic.pointsMulEquiv`); no topology |
| MP.1 | only abstract extensions | projective representations of abstract groups and their linearization over the central extension by k^× (`TauCeti.IsProjectiveRep.exists_factorSet_linearization`) |
| MP.3 | no smooth representation class | `TauCeti.IsSmoothDiscrete` and Mathlib's `Representation.Coinvariants`; still no admissibility or Jacquet functor |
| H6 | Mathlib has Galois descent for quasi-coherent sheaves | false: only abstract descent data and stacks, and descent of morphism properties |
| MP.0 | Fourier inversion for general characters | inversion only over finite-dimensional real inner-product spaces and for the discrete transform on ZMod N |
| QM.1 | no elliptic transformation law | θ₂(z+τ, τ) = e^{−πi(τ+2z)} θ₂(z, τ) (`jacobiTheta₂_add_left'`) |
| QM.3 | nothing non-holomorphic or quasimodular | the quasimodular law of E₂ for all of SL₂(ℤ) (`EisensteinSeries.E2_slash_action`) |
| QM.4 | no error function | Tau Ceti's real `TauCeti.Real.erf`, from which Zwegers' correction is built |
| O0 | no character theory | continuous characters of ℤ_p ↔ topologically nilpotent elements (`PadicInt.continuousAddCharEquiv`) |
| H1, H2, R18.2 | no representability theorem; no normality or regularity notion | Mathlib's Zariski-local representability criterion (Stacks 01JJ), relative normalization of schemes (Stacks 035H), `IsRegularLocalRing` |
| H3 | only totally positive elements | the group of totally positive units of 𝒪_F (`NumberField.totallyPositiveIntegerUnits`) |
| R18.4 | no local systems | `TauCeti.LocalCoefficientSystem` (fundamental groupoid ⥤ modules, with monodromy) |
| QM.6 | Kac–Moody theory "through root systems" | only Serre-relation Lie algebras (`Matrix.ToLieAlgebra`) and Tau Ceti's finite Weyl denominator identity |

## Corrections

70 in all, as follows.

**Citations, library and verdict (5).**
- Two citations renamed: `HarmonicAt`, and `Algebra.IsCentralSimple` → `Algebra.IsCentral`.
- The Monster citation replaced by the presentation.
- QM.1's theta target changed from `mathlib` to `partial`.
- QM.1 changed from partly built to not built.

**Evidence and notes (32).** 25 targets gained verified citations with repaired notes, and 7 notes
were fixed without new citations, as described above.

**Duplicates (30).**
- **Removed (6).** Each named layer states none of the layer's targets:

  | Layer | Removed | Reason |
  | --- | --- | --- |
  | PadicFamilies L5 | PadicFamilies L0a | same roadmap, and L5's own dependency |
  | H6 | R23.1 | Moret–Bailly's theorem, which H6 says does not prove its inputs |
  | O0 | PadicFamilies L2a | a co-consumer of the weight space |
  | R18.1 | ShimuraData D5 | has no quaternionic datum |
  | QM.6 | ModularCurvesPartII R12.3 | a cusp-compactification layer |
  | PadicFamilies L4 | GlobalGaloisDeformations R04.1 | constructs no Galois representation |

- **Replaced (1).** O7's `IgusaVarietiesAndTorsionConcentration:IG.2`, which covers partial
  compactifications of Caraiani–Scholze Igusa varieties, becomes `HodgeTateAndCanonicalSubgroups:T5`,
  which builds the ordinary Igusa tower O7 works on.
- **Note corrected (1).** PadicFamilies L1 → `ModularSymbolsPadicLFunctions:L2`: that layer takes
  its integral period theorem from its own L1, which is now listed too.
- **Added (22).** The most consequential:

  | Layer | Added | Overlap |
  | --- | --- | --- |
  | H0 | `ShimuraData:D0`, `ReductiveGroupsPartII:RG2.0a` | Weil restriction applied to the Hilbert groups |
  | H1, H4 | `AbelianSchemesAndArithmeticModuli:A2`, `A3` | dual abelian scheme, polarizations, Weil and Tate-module pairings |
  | H2 | `AdicSpacesPartII:R2` | the Hasse ideal and its formal blow-ups |
  | R18.3, R18.4 | `AutomorphicFormsOnReductiveGroups:AF.5`, `GL2AutomorphicRepresentationsAndTransfer:R17.3` | algebraic modular forms on double cosets; Jacquet–Langlands, definite and indefinite |
  | PadicFamilies L4 | `AutomorphicGaloisRepresentations:R19.6`, `PhiGammaModulesAndIwasawaCohomology:PG.7`, `AutomorphicCongruences:L3` | Hecke-algebra Galois representations; triangulation inputs; universal Kato classes |
  | PadicFamilies L1 | `ModularSymbolsPadicLFunctions:L1`, `tauceti:…/ModularForms#layer-8-…` | integral periods; the integral modular-symbol module |
  | PadicFamilies L5 | `AutomorphicCongruences:L5w` | the Hilbert Hida family |
  | MP.2 | `tauceti:…/QuadraticFormInvariants#6c-…` | Hilbert symbol and local Hasse invariant |
  | MP.1 | `tauceti:…/InductionRestriction#layer-7-…` | projective representations and central extensions, built |
  | MP.4, MP.6 | `AutomorphicLFunctionsAndLocalFactors:AL.0` | adelic Schwartz–Bruhat space; self-dual measures |
  | MP.5 | `GeometryOfNumbersAndQuadraticArithmetic:GN.3` | theta series of quadratic forms |
  | QM.0 | `HabiroNahmSeries:HB.4` | q-Pochhammer products |
  | QM.6 | `tauceti:…/CFSGStatement#s1-…` | the Monster presentation, built |

- **Unchanged (73).** The other 73 original claims were read against the referenced descriptions;
  72 stand as written, and the one listed above stands with its corrected note. All 80 original
  claims resolve to live, visible stages; none is retired, hidden or self-referential.

**Summaries (3).** QSeries and Metaplectic were rewritten; Overconvergent was updated.

**Final verdicts:** 43 not built, 2 partly built (QM.0, PadicFamilies L0a) and 1 process (R18.6),
each consistent with its targets.

## Findings worth repeating

- **Formal q-series already have their first classical theorem.** QM.0 and QM.1 should build on
  Mathlib's pentagonal number theorem, `eulerFunction` and the general multipliability theorem for
  power-series products. They should not re-prove them. The p(n) product formula is a one-line
  corollary that Mathlib lists as a TODO.
- **Compact-operator theory is not archimedean-only.** Two results already hold over p-adic fields:
  the Fredholm alternative (Mathlib) and finite-dimensionality of each finite stage ker (K − μ)ⁿ at
  μ ≠ 0 (Tau Ceti).
  LocallyAnalyticDistributions L4 and PadicFamilies L2a should start from them.
- **Adelic groups exist as abstract groups.** Tau Ceti's functor of points gives Sp₂ₘ(𝔸) and G(𝔸)
  for affine group schemes; what MP.4 and AdelicAlgebraicGroups must add is the topology and the
  restricted-product structure.
