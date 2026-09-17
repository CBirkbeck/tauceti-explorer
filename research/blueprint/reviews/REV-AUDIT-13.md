# Review of AUDIT-13

**Job** REV-AUDIT-13 · **Date** 2026-09-17 · **Verdict `accepted`** · **76 corrections**

Baseline: tauceti `f790474`, mathlib `082e2d3`.

Scope: the five roadmaps of `research/blueprint/audit/AUDIT-13.json` — `AdelicAlgebraicGroups`,
`AlgebraicModularFormsAndSerreWeights`, `ArithmeticLocallySymmetricSpaces`, `AutomorphicBundles` and
`AutomorphicFormsOnReductiveGroups`. That is 36 layers, 192 targets (158 absent, 29 partial,
5 mathlib), 189 declaration citations naming 151 distinct declarations, and 102 duplicate claims.

The audit's broad picture is right: almost nothing adelic, automorphic or Shimura-theoretic exists in
either library. Every positive claim it makes also holds, including those about Mathlib's restricted
products, analytic modular forms and continuous cohomology, and Tau Ceti's Hecke rings. It still
needed repair in four ways, all fixable in place:

1. **Verdicts.** 15 layers were marked "partly built" although none of their targets is present; they
   have only partial and absent targets. The audit prompt defines "partly built" as "at least one
   target is present and one is missing", and every other AUDIT batch (09–12, 14, 15) marks such
   layers "not built". After correction there are 3 partly built layers (AA.0, B4, AF.1a) and 33 not
   built.
2. **False or overstated absences.** Of the 38 corrected target entries, 29 had notes or library
   values that denied or understated what the libraries have (4 more overstated them, and 5 only
   fixed a citation). The consequential ones:
   - Tau Ceti's local coefficient systems, called absent in ALS.0, ALS.1, B2 and AF.4.
   - Mathlib's Weil integration formula for closed normal subgroups (AA.2).
   - Tau Ceti's functor of points of an affine group scheme, with products, closed subgroups and
     centres (AA.1).
   - Strong approximation for SL₂ over ℚ (AA.4).
   - Tau Ceti's central characters χ_λ of Lie algebras (AF.1, AF.4).
   - Continuous inflation–restriction (ALS.4).
   - Mathlib's ℓ-adic cohomology of schemes (B1).
3. **Citations.** Two cited declarations are `private` and one is a deprecated alias.
4. **Duplicates.** The audit missed the most important owner for ArithmeticLocallySymmetricSpaces:
   its own prerequisite, the Tau Ceti AlgebraicTopology roadmap. Its stages 4–6 own cellular
   homology, transfer for finite covers, singular cochains with local coefficients, cup products, the
   orientation local system and Poincaré–Lefschetz duality.

**Most important finding.** Taken together, items 2 and 4 mean ALS.0, ALS.1 and ALS.5, as audited,
would plan local systems, singular cochains and Poincaré–Lefschetz duality from scratch. In fact Tau
Ceti already has the local-coefficient carrier (`TauCeti.LocalCoefficientSystem`, with monodromy),
and a roadmap the ALS roadmap already depends on owns the rest.

## What was checked

**Mechanical.**
- All 36 batch layers appear in the result; there are no extras and no omissions.
- Every one of the 151 distinct citations resolves at its stated library, file and line in the pinned
  baseline. `grep -w sorry` finds nothing in any cited file.
- `Topology.RelCWComplex` is absent from `declarations.tsv`, because it is declared as
  `class RelCWComplex.{u}`, but it is present exactly as cited.
- Two citations are `private` and cannot stand; both are replaced by public statements:
  - `ModularForm.slash_mul` (`SlashActions.lean:99`), cited as the exact right-action law in B4 and
    as related in B0.
  - `TauCeti.GlobalNumberFields.exists_mixed_approximation` (`Approximation/Weak.lean:143`), cited
    in AA.4.
- `CategoryTheory.Sheaf.cohomologyFunctor` (ALS.1) is an alias of `functorH`, deprecated since
  2026-05-05, and is replaced by `functorH`.
- After correction the file cites 185 distinct declarations (227 uses). All resolve and none is
  private or in a file containing `sorry`.
  - Besides `RelCWComplex`, two are missing from the index but present at source.
    `SlashAction.slash_mul` is a class law, proved for GL(2,ℝ) by the instance at
    `SlashActions.lean:130`. `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality` is
    listed in the index without its `TauCeti.` namespace.

**Presence claims (5 mathlib, 29 partial).** I re-read each at source, together with the file's
`variable` lines.
- AA.0's four Mathlib targets hold. `RestrictedProduct.isTopologicalGroup` and
  `locallyCompactSpace_of_group` live in the cofinite section under
  `[Fact (∀ i, IsOpen (B i))]`, with `B i` compact for cofinitely many `i`, which are exactly the
  layer's hypotheses. `isOpen_forall_mem`, `isOpenEmbedding_structureMap`, `continuous_dom` and
  `mapAlong_continuous` say what the notes claim.
- B4's cocycle target holds for GL(2,ℝ):
  - `denom_cocycle` covers `z` off the real line.
  - `denom_cocycle'` covers the action on ℍ, with conjugation when `det < 0`.
  - The right-action law is the `slash_mul` law of the weight-k `SlashAction` instance; the proof
    term of that instance is the private theorem the audit cited.
- AF.1a's continuous-cochain target is fully present, not partial. Mathlib's
  `TopRep.homogeneousCochains` and `continuousCohomology` are defined for any topological group, so
  they cover a real Lie group with finitely many components. The audit marked the target partial as
  "only the continuous half", but the differentiable half is the next target. I upgraded it to
  `mathlib` and recorded the Mathlib TODO: identifying the iterated-map cochains with maps on
  G^{q+1}.
- The modular-forms citations are accurate:
  - `ModularForm.qExpansion_injective` needs only a strict period `h > 0`.
  - `TauCeti.ModularForm.finiteDimensional_modularForm_finiteIndex` needs `[HasDetOne]`,
    `[IsFiniteRelIndex 𝒮ℒ]` and `[DiscreteTopology strictPeriods]`.
  - The Tau Ceti Hecke-ring instances (`HeckeCosetModule.instSemiringHeckeRing`,
    `instRingHeckeRing`) are named instances in the source.

**Absence claims.**
- **Method.** I re-searched well over half of the 158 absent targets myself, including every one
  whose concept has a standard name. I searched by concept and by Mathlib naming convention, with
  `grep -i -P` on `declarations.tsv` and `grep -rn -i` over both trees, and read the hits in context.
  Five Explore agents then swept each roadmap's absent and partial targets for breadth; I opened
  every declaration they proposed at source before using it.
- **Confirmed absent in both libraries:**
  - *Adelic groups and measures:* any measure on a restricted product or the adeles; Tamagawa
    measures; unimodularity; compactness of 𝔸_K/K and of the norm-one idele class group (only a
    docstring in Tau Ceti's `Discrete.lean`); density of K in the finite adeles; Weil restriction of
    group schemes; minimal rational parabolics; Siegel sets; neat subgroups (the word occurs only in
    three informal comments); Hecke characters (docstrings only).
  - *Modular forms and Serre weights:* modular curves as schemes; Hodge bundles; GAGA; modular forms
    over rings or in characteristic p; Hasse invariants; Igusa curves; Serre weights; fundamental
    characters; semisimplification; the Deligne–Serre lemma.
  - *Topology and cohomology:* Cartan involutions, maximal compact subgroups and symmetric spaces;
    Borel–Serre; singular cohomology and cup products on spaces; perfect complexes; the
    universal-coefficient and Hochschild–Serre spectral sequences; Poincaré–Lefschetz duality; lim¹.
  - *Shimura varieties and bundles:* Shimura data and canonical models; flag varieties; toroidal
    compactifications; Hilbert and Siegel modular forms; Fourier–Jacobi expansions.
  - *Automorphic forms on reductive groups:* (g,K)-modules and Harish-Chandra modules; relative Lie
    algebra cohomology and van Est; automorphic forms and constant terms on G(F)\G(𝔸); Flath's
    theorem; spherical vectors; C- versus L-algebraic normalizations.
- **Checked but left unchanged:**
  - **Tau Ceti's `IsSmoothDiscrete` is not smooth representation theory.** It is the
    open-stabilizer condition on a discrete module, built for profinite cohomology. It has no
    admissibility and no restricted tensor products, so AF.2's Flath target stays absent; only its
    note changed.
  - **Mathlib's `Subgroup.IsArithmetic.properlyDiscontinuous`** covers every arithmetic subgroup
    of GL(2,ℝ) acting on ℍ, and I added it to ALS.0. Nothing covers a general symmetric space, so
    the target stays partial.

**Duplicates.**
- All 102 original claims resolve to live atlas stages. None belongs to the retired
  `FoundationsAndLibraryIntegration`, and none is self-referential. I read every referenced
  description, and each is a genuine overlap.
- One claim points at a hidden stage. AA.3 cited `BorelRegulators:KU-arithmeticgroups`, which
  `data/stage-presentation.json` hides and which describes itself as an aggregation of
  `BorelRegulators:R.1`, "not a new proof construction". I replaced it with R.1.
- I then searched every atlas description for each layer's key concepts and added 17 owners the
  audit had missed.

## Corrections

**Verdicts (15).** AA.1, AA.2, AA.4, AA.5, R15.2, ALS.0, ALS.1, ALS.3, ALS.4, B0, B5, AF.0, AF.1, AF.4
and AF.5 change from partly built to not built. None has a present target.

**Library values (5).**

| Layer | Target | Was → now | Evidence |
| --- | --- | --- | --- |
| AA.1 | Compatibility of adelic points with closed subgroups, centres, products | absent → partial | For every value algebra: `TauCeti.AffineGroup.Product.pointsMulEquiv` (products), `CommHopfAlgCat.quotientPointsSubgroup` (closed subgroups), `centerPointsSubgroup_eq_center` (centres). No topology. |
| AA.4 | Strong approximation for simply connected G | absent → partial | `Matrix.SpecialLinearGroup.map_intCast_zmod_surjective` (Tau Ceti): SL₂(ℤ) → SL₂(ℤ/dℤ) is onto for every d, i.e. SL₂ over ℚ with S = {∞} in congruence form. |
| ALS.1 | Local systems from coefficient modules and lattices | absent → partial | `TauCeti.LocalCoefficientSystem` (fundamental groupoid ⥤ `ModuleCat R`), `monodromyFunctor`, and `CoveringSpace.monodromyEquivalence`. |
| AF.1a | Continuous group-cochain complexes | partial → mathlib | Mathlib's continuous cochain complex for any topological group; the differentiable complex is a separate target. |
| AF.4 | Infinitesimal characters and cohomological representations | absent → partial | `TauCeti.vermaCentralCharacter : Z(U(L)) →ₐ K`, with `vermaCentralCharacter_casimirElement`. Cohomological representations are still absent. |

**Citations.** The citation fixes:
- `ModularForm.slash_mul` (private), in B4 and B0, becomes `SlashAction.slash_mul`.
- `exists_mixed_approximation` (private), in AA.4, becomes
  `exists_fieldUnit_valuation_sub_lt_and_signHom_eq`.
- `Sheaf.cohomologyFunctor` (deprecated), in ALS.1, becomes `Sheaf.functorH`.
- AF.0 cited `SchwartzMap` for the C_c^∞ factor; it now cites Mathlib's `TestFunction`
  (𝓓(Ω, F), with its LF topology), since Schwartz functions are not compactly supported.

**Notes corrected (library value unchanged; most add a citation).**
- *AdelicAlgebraicGroups*
  - AA.1, adelic points functor: `TauCeti.HopfAlgebra.pointsFunctor` evaluates on the adele ring; only
    topology and packaged local projections are missing.
  - AA.1, discreteness: density of K in the finite adeles is a docstring remark, not a theorem, and
    the cited `InfiniteAdeleRing.denseRange_algebraMap` is density in K∞.
  - AA.1, base change: the algebraic base-change identity on points
    (`AlgHom.baseChangePointsMulEquiv`) exists; there is no 𝔸_E ≅ E ⊗ 𝔸_F.
  - AA.2, Weil formula: Mathlib/MeasureTheory/Measure/Haar/Extension.lean proves
    ∫_B f = ∫_C ∫_A f(b·a) for a short exact sequence of topological groups
    (`IsSES.integral_inducedMeasure`, with `IsSES.ofClosedSubgroup`). The audit's "only for a
    discrete subgroup" was wrong; what is missing is the non-normal, non-discrete case.
  - AA.4, covering maps at neat level: `IsQuotientCoveringMap.isCoveringMap_of_comp` and
    `HeckeCoset.degree_eq_relIndex` supply the abstract covering and index statements.
  - AA.5, volumes: `MeasureTheory.Subgroup.index_mul_measure` gives [G:H]·μ(H) = μ(G).
- *AlgebraicModularFormsAndSerreWeights*
  - R15.2, finite generation: Tau Ceti proves E₄ and E₆ freely generate the level-one graded ring
    (`TauCeti.ModularForm.mvPolynomialEquivModularForms`).
  - R15.3, Hasse invariant: the note said Tau Ceti has a quadratic-form Hasse invariant; no Hasse
    invariant exists in either tree.
  - R15.3, theta operator: Mathlib's `Derivative.serreDerivativeMF`, a map M_k → M_{k+2}.
  - R15.4, reducible local representations: the note denied any continuous Galois cohomology of a
    local field. Tau Ceti has the Kummer map into H¹(G_K, μₙ) for any field
    (`kummerClassMap_injective`).
  - R15.4, p = 2: Tau Ceti has finite locally free commutative group schemes with Cartier duality
    (`FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`).
- *ArithmeticLocallySymmetricSpaces*
  - ALS.0, orientation local system: local systems do exist (above); only the orientation local
    system is absent.
  - ALS.0, proper discontinuity: added `Subgroup.IsArithmetic.properlyDiscontinuous`.
  - ALS.3, change of level with stabilizer factors: Tau Ceti's
    `card_fiber_orbitOfCosetTranslate_mul_cardStabilizerOnOrbit` is the stabilizer-weighted count
    the note said was missing (not yet on cohomology).
  - ALS.4, Hochschild–Serre: the note said there is no continuous version. Tau Ceti proves degree-one
    continuous inflation–restriction exactness (`TauCeti.ContCohomology.explicitInfRes_exact`), and
    inflation and restriction are natural transformations in every degree.
- *AutomorphicBundles*
  - B0, associated bundles: `TauCeti.BalancedProduct` is a contracted product for covering spaces
    with discrete fibre.
  - B0, descent criterion: GL₂ shadow via `ModularForm.eq_zero_of_neg_one_mem` and Tau Ceti's
    `ModularForm.mem_range_ofLeₗ_iff`.
  - B1, Hodge tensors: Mathlib has ℓ-adic cohomology of schemes (`Scheme.EllAdicCohomology`), and
    Tau Ceti has pure and mixed Hodge structures; there are still no Hodge tensors.
  - B2, local system with connection: `LocalCoefficientSystem` exists.
  - B3, refinements of fans: Tau Ceti has toric fans and `Fan.IsSubdivision`.
  - B5, Hecke composition: Tau Ceti's `HeckeRing.GL2.heckeRingHomCharSpace` is a ring homomorphism
    from the Γ₀(N) Hecke ring to End(M_k(N, χ)).
  - B5, cuspidality: cuspidality is equivalent to a vanishing constant term only at level one
    (`ModularForm.isCuspForm_iff_coeffZero_eq_zero`).
- *AutomorphicFormsOnReductiveGroups*
  - AF.1, the centre of U(g): central characters and the central Casimir element cited in place of the
    Kostant form.
  - AF.1a, invariant forms: Tau Ceti has smooth two-forms on manifolds (`SmoothTwoForm`), without an
    exterior derivative.
  - AF.1a, naturality and cup products: Tau Ceti's continuous cup products exist only in total
    degree ≤ 2.
  - AF.2, Flath: see above.
  - AF.3, anisotropic groups: Tau Ceti's dynamic parabolics `Cocharacter.parabolic` exist; F-anisotropy
    does not.
  - AF.4, coefficient systems: local coefficient systems exist.

**Duplicates (17 added, 1 replaced).**

| Layer | Added | Why |
| --- | --- | --- |
| ALS.1 | `tauceti:…/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `#stage-4-cw-pairs-cellular-homology-and-cofibrations` | Singular cochains with local coefficients, the universal-coefficient spectral sequence, cup products; cellular homology and its comparison with singular. |
| ALS.5, ALS.5:finite-level-duality, ALS.0 | `…/AlgebraicTopology#stage-6-…` | Orientation local system and Poincaré–Lefschetz duality for compact manifolds with boundary. |
| ALS.3, ALS.6 | `…/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent` | Transfer for finite covers; finite-cover descent and the Cartan–Leray spectral sequence. |
| ALS.6 | `ArithmeticGaloisDuality:R02.1` | Mittag–Leffler and lim¹; ALS.6's own text imports its derived-limit interface from R02.1–R02.2. |
| ALS.0 | `tauceti:…/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`, `ShimuraData:D2` | Cartan involution, maximal compact, the Cartan decomposition G/K ≅ 𝔭; Hermitian symmetric domains. |
| AA.5, AA.3 | `tauceti:…/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles` | Compactness of the norm-one idele class group and class-group finiteness: the GL₁ normalization (AA.5) and GL₁ finite volume and class number (AA.3). |
| AF.3 | `tauceti:…/GlobalNumberFields#layer-5-full-adeles-and-the-additive-quotient` | Compactness of 𝔸_K/K, the G_a case of compactness of N(F)\N(𝔸). |
| AF.5 | `tauceti:…/GlobalNumberFields#layer-9-hecke-and-ray-class-characters` | The Hecke-character carrier with conductor and unitary part (the audit cited only layer 10). |
| R15.1 | `ComplexComparisonPartII:C2` | Projective GAGA, the step R15.1 names. |
| R15.4 | `ArithmeticGaloisRepresentations:R01.2` | Tame and fundamental characters of levels one and two. |
| R15.6 | `ArithmeticGaloisRepresentations:R01.1` | Reduction, semisimplification and Brauer–Nesbitt. |
| AA.3 | `BorelRegulators:R.1` replaces `BorelRegulators:KU-arithmeticgroups` | The latter is a hidden aggregation checkpoint of R.1. |

**Summaries (5).** All five summaries were rewritten to match the corrected targets.

## What I did not change

- **Generous "partial" labels.** Several partial targets cite only "related" declarations: AA.0's
  Fubini target, AA.2's modulus character, AF.0's test functions, and AF.1a's naturality and
  acceptance cases. Each note says exactly what is missing, and the spec's "something close exists"
  reads correctly for them. With the verdict correction these labels no longer inflate any layer
  verdict.
- **B4's cocycle target stays `mathlib` although it covers GL₂ only.** The layer writes the cocycle
  for the classical automorphy factor j(γ, z) on ℍ. Siegel and Hilbert cocycles belong to its example
  targets, which are absent.
- **Target decomposition is faithful.** I compared AA.0, AA.3, ALS.4, B5 and AF.1a bullet by bullet
  with the extracts, and every stated construction has a target.

## Findings worth repeating

- **ArithmeticLocallySymmetricSpaces should consume, not rebuild, its topology.** Tau Ceti already
  has local coefficient systems with monodromy, the classification of covers by
  fundamental-groupoid actions, and continuous low-degree group cohomology. The prerequisite
  AlgebraicTopology roadmap owns singular cochains, cup products, the orientation local system and
  Poincaré–Lefschetz duality.
- **Weil's formula is half there.** For a closed normal subgroup, Mathlib already integrates over G
  as an integral over the subgroup followed by the quotient (Haar/Extension.lean). AA.2 needs the
  non-normal case with modular characters; it should not re-prove the normal case.
- **G(𝔸) exists as an abstract group.** Tau Ceti's functor of points evaluates on the adele ring,
  compatibly with products, closed subgroups and centres. What AA.1 must add is the topology and the
  identification with the restricted product ∏′ G(F_v).
- **Infinitesimal characters exist on the Lie-algebra side.** Tau Ceti's `vermaCentralCharacter`
  is χ_λ on Z(U(L)), with its Casimir value. AF.1 and AF.4 need the Harish-Chandra isomorphism and
  the (g,K)-module setting, not the central character itself.
