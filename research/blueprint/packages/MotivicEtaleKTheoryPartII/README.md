# Roadmap: motivic and étale K-theory, part II — fundamental lines and special-value factors

**Summary.** MotivicEtaleKTheory constructs integral motivic cohomology, the Deligne and étale regulators, the arithmetic determinant line Δ_p(T) = det⁻¹ RΓ_c(T) and the Selmer local determinant formula. PeriodsAndSpecialValues constructs the Burns–Flach fundamental line Ξ(M) of a motive with supplied factors, its real and λ-adic trivializations under stated exactness and comparison hypotheses, the leading-term rationality predicate and the Tamagawa obstruction. This roadmap joins the two. For a motive M = h^i(X)(j) of a smooth projective variety over a number field, given with a regular model, it identifies every factor of Ξ(M) with motivic cohomology or cycles, builds the real comparison ϑ_∞ from the Beilinson regulator and the p-adic comparison ϑ_p from the étale realization of motivic cohomology, proves real exactness and the p-adic realization isomorphism for every Tate twist of every Artin motive, proves real exactness for h¹(E)(1) and reduces its p-adic realization isomorphism to the finiteness of Sha(E/K)[p^∞], and states Kato's rational zeta element condition as the instance of the PeriodsAndSpecialValues predicates at these comparisons. The condition is proved in the class number formula case, shown equivalent to the cohomological Lichtenbaum formula for h⁰(F)(1 − k), and connected with the Birch–Swinnerton-Dyer formula for h¹(E)(1). Its end theorems are the real and p-adic comparisons of the fundamental line (§2.6, §3.6), real exactness and the p-adic realization isomorphism for Artin motives (§2.4, §3.3), the class number formula case (§4.4) and the Lichtenbaum form (§4.5).

`README.md` is normative. `Suggested.lean` records the definitions and theorem signatures that can be stated against the pinned libraries, with the `example` checks named below; it is not exhaustive, and its docstrings cite the subsections of this file as §k.n. Every definition comes with the API it needs and with checks that a plausible wrong definition fails; every theorem carries its exact hypotheses, its source and the statements it rests on.

## Scope and ownership

This roadmap owns:

- the K-theoretic motive datum (K, X, 𝒳, π, i, j, A, φ), its motivic factors H⁰_f and H¹_f, their weight vanishing and the shape of the fundamental line by weight, and the computation of the factors for all Tate twists of Artin motives and for elliptic curves (Layer 1);
- the real Deligne complex of a motive with its kernel–cokernel duality and its identification with Deligne cohomology, the Beilinson regulator sequence and the coefficient compatibility of its maps, the real exactness predicate for these maps, its proof for Artin motives and for h¹(E)(1) (with the positive definiteness of the Néron–Tate pairing on E(K) ⊗ ℝ), and the fundamental-line real comparison (Layer 2);
- the p-adic realization maps of the motivic factors into Bloch–Kato Selmer complexes, the orthogonality of the Bloch–Kato conditions at p, the p-adic realization predicate, its proof for Artin motives and its Sha criterion for h¹(E)(1), compactly supported cochains with their archimedean terms, the Selmer complexes of Artin motives, and the fundamental-line p-adic comparison with its Euler-factor normalization (Layer 3);
- the Tamagawa condition (Kato's rational zeta element condition) for K-theoretic motives, its equivalence with the commutative Tamagawa obstruction, its lattice, place-set, duality and Selmer forms, the order and leading coefficient of ζ_F at s = 0, the class number formula case, the cohomological Lichtenbaum form with its lattice-index term, and the elliptic data for the Birch–Swinnerton-Dyer formula (Layer 4).

### Prerequisites and boundaries

- **MotivicEtaleKTheory** supplies higher Chow groups and motivic complexes with their functoriality and products (§§4.1–4.4), the normalized character on Adams eigenspaces (§9.3), the motivic–étale comparisons over Dedekind bases and in arithmetic degrees with their dyadic versions (§§10.1–10.5, 11.3, 11.5), the finite étale Chern classes (§12.1), the Deligne complex and the regulator roof (§12.2), the number-field Deligne regulator and the integral motivic image of a specified regular model (§12.3), the local Tate regulator comparison and the elliptic Selmer adapters (§12.6), the arithmetic determinant line Δ_p(T) and the Selmer local determinant formula (§12.7, `arithmeticDeterminantLine`, `selmerLocalDeterminant`) and the Chern lattice scaling (§12.8). Nothing here constructs a regulator, a Chern class or the determinant line of a complex again.
- **PeriodsAndSpecialValues** supplies the comparison line and the infinity involution (PS.0.1–PS.0.2), the Burns–Flach and Fukaya–Kato lines Ξ and Δ = Ξ⁻¹, the real trivialization built from an exact-sequence witness, the leading coefficient and the rationality predicate (PS.3.1–PS.3.3), the λ-adic lattice built from a supplied comparison, the finite lattice correction, the local Euler and Tamagawa identifications and the real dyadic restriction (PS.4.1–PS.4.4), the Tamagawa obstruction, the ETNC predicate and the zeta-isomorphism orientation (PS.5.1–PS.5.3), and the elliptic Birch–Swinnerton-Dyer adapter with its prime-by-prime transport (PS.6.3–PS.6.4). The comparisons ϑ_∞ and ϑ_p of this roadmap satisfy the hypotheses under which those layers are stated; the abstract line, the abstract trivialization and the predicates are not restated.
- **SpecialValuesBirchTate** §§8.1–8.3 supplies the cohomological order h_n(F), the motivic regulator covolume and the Lichtenbaum predicates; §4.5 proves their equivalence with the Tamagawa condition and does not restate them.
- **BorelRegulators** supplies Borel's rank theorem (§3.12), the conjugation target V_j(F), the Borel regulator with its transfer, Adams weights, real isomorphism, determinant line and covolume (§§4.1, 4.7–4.10, 4.12–4.13), the completed-zeta conventions and normalized leading coefficients (§§5.1, 5.3), Borel's regulator–zeta theorem (§7.2) and the Beilinson regulator with the factor two (§§8.2–8.4).
- **ArithmeticKTheory** §§3.2–3.3 supply the finite generation of the K-groups of rings of integers and of S-integers.
- **MotivesAndAlgebraicCycles** §§1.1–1.3 and 2.3–2.7 supply Chow motives, Tate twists, duality, homological equivalence, cycle maps from Chern classes, and the Betti, de Rham and étale realizations with their comparisons.
- **SelmerIwasawaCohomology** §§1.4, 2.9, 2.12, 2.16, 2.19, 2.21, 2.23, 4.9 and 4.26 supply Selmer complexes as mapping fibres with their duality and condition-change triangles, Galois Selmer groups, the Bloch–Kato local condition and the elliptic Kummer conditions; **ArithmeticGaloisDuality** §§R02.4.2, R02.4.4 and D7.3–D7.6 supply continuous cochains, compact support, derived local and global duality, Poitou–Tate for lattice coefficients and Tate's Euler characteristic formulas.
- **PadicHodgeTheory** §8.1 supplies the de Rham comparison for proper smooth varieties; **EllipticRegulators** §§6.1–6.2 supply the regulator on the integral part of K₂ of an elliptic curve and the Beilinson statement for it, the j = 2 instance of §2.5(2).
- **TauCetiRoadmap EllipticCurves** Layers 0, 1, 2, 6 and 7 supply the Abel–Jacobi description of Pic⁰, isogenies, the Weil pairing, Mordell–Weil with the canonical height, its pairing and regulator, and Selmer groups with Sha. **TauCetiRoadmap EtaleCohomologyFoundations** F.1, F.2.1–F.2.2, F.4.2 and F.4.5 supply derived étale sheaves, proper and smooth base change and ℓ-adic realizations as limits. **TauCetiRoadmap PadicMeasuresIwasawaAlgebras** §5.1 supplies the graded determinant of perfect complexes over commutative rings; **TauCetiRoadmap AlgebraicVectorBundles** L0C supplies exterior powers and the ordinary fixed-rank determinant of vector bundles.
- From Tau Ceti at the pin: the pure Hodge structures `TauCeti.Hodge.HodgeStructureOn` with their opposedness, the Kummer map `TauCeti.kummerMap` and the elliptic regulator `WeierstrassCurve.Affine.regulator`. From Mathlib at the pin: the unit theorem, the regulator, the class number, the torsion order, the discriminant, the infinite places, the Dedekind zeta function with its residue at s = 1, determinants, `Submodule.span` and `PadicInt`.

The general Burns–Flach line, the Tamagawa obstruction, the equivariant (noncommutative) Tamagawa number conjecture and the Bloch–Kato Tamagawa measure belong to PeriodsAndSpecialValues; the regulators, Chern classes and Δ_p(T) to MotivicEtaleKTheory; none is constructed here. The Iwasawa-theoretic theorems that prove the Tamagawa condition for abelian fields are not stated here. Section 3.1 constructs the geometric factorization through H¹_g and proves its H¹_f consequence at good reduction in weight ≤ −3. In the exceptional weights and at bad places, unproved H¹_f membership remains the hypothesis `PadicRealizationFinite`. The Beilinson–Bloch height pairing in weight −1 beyond elliptic curves is a datum of the regulator sequence. Section 1.2 proves independence of the **rational image** of a regular proper flat model; it asserts no independence of integral lattices or integral cycle groups.

## Conventions

**Motives.** K is a number field, X a smooth projective K-scheme of pure dimension d, 𝒳 a regular proper flat O_K-model of X recorded with X, π an idempotent Chow correspondence whose realizations are concentrated in degree i, j ∈ ℤ, and M = h^i(X)(j). The weight is w = i − 2j. The dual datum is M*(1) = h^{2d−i}(X)(d + 1 − j), of weight −2 − w. A motive over K is identified with its restriction of scalars to ℚ whenever a formula is written over ℚ; the factors, realizations and L-function do not change.

**Coefficients.** The coefficient algebra A is a finite-dimensional semisimple ℚ-algebra acting through correspondences. Both comparisons in Layers 2–3 are stated for every such A, with dual factors over A^op. Finite-dimensional A-, A_ℝ- and A_p-modules are projective; the bounded rational cochain complexes used below are therefore perfect once their cohomology is finite-dimensional. Layer 4's element and fractional-lattice formulas specialize to commutative coefficients, a number field E or a finite product of them; PeriodsAndSpecialValues owns the general relative-K-group formulation. When A ≠ ℚ, `RegulatorsCommuteWithCoefficients` of §2.2 is a hypothesis of the comparisons; it includes height balancing and is proved for Artin motives and elliptic endomorphism actions.

**Realizations.** H_v(M) = π·H^i(σX(ℂ), (2πi)^j ℚ) at the archimedean place v = v(σ); G_v acts through the infinity involution, the geometric involution combined with complex conjugation of the coefficients (2πi)^j, never through the conjugation of the lattice alone. B⁺(M) = ⊕_{v|∞} H_v(M)^{G_v}. The de Rham realization has its Hodge filtration shifted by j, and t_M = H_dR(M)/F⁰. V_p = π·H^i_et(X_K̄, ℚ_p(j)).

**Lines.** For a possibly noncommutative ring R, d_R takes values in Deligne's symmetric Picard category V(R), with tensor product written multiplicatively and unit 1_R. The supplier contract is specified below. For commutative R its graded-line realization is TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1: d C = ⊗_i d(C^i)^{(−1)^i}, with Koszul commutativity. For [R --a--> R] in degrees 0, 1, with a a non-zero-divisor and after inverting a, the acyclic trivialization sends the standard determinant lattice to aR; shifting to degrees −1, 0 gives a⁻¹R. The Burns–Flach object of PeriodsAndSpecialValues PS.3.1 is

```text
Ξ_A(M) = d H⁰_f(K,M) · d H¹_f(K,M)⁻¹ · d(H¹_f(K,M*(1))^*) · d(H⁰_f(K,M*(1))^*)⁻¹ · ∏_{v|∞} d(H_v(M)^{G_v})⁻¹ · d t_M,
```

and Kato's line is Δ = Ξ⁻¹. ϑ_∞ maps Ξ ⊗ ℝ to the unit object and ϑ_p maps Ξ ⊗ ℚ_p to d RΓ_c(O_{K,S_p}, V_p); Kato's comparisons are their inverses. A comparison coordinate is the value of ϑ on a chosen generator: if r_B(x) = R·y for bases x and y of a source and a target line, ϑ_∞(x⁻¹ ⊗ y) = R⁻¹.

For each semisimple A fix a symmetrizing trace-form identification Hom_ℚ(A,ℚ) ≅ A, and transport that choice under the scalar-change and Morita comparisons used below. It identifies the motivic linear dual Hom_ℚ(W,ℚ) with the module dual Hom_A(W,A), as in Burns–Flach (52), p. 544. Dualization on virtual objects is induced by the exact module dual P ↦ Hom_{A^op}(P,A^op) from finite projective A^op-modules to right A^op-modules, regarded as left A-modules; on an isomorphism its covariant use reverses that isomorphism (Burns–Flach §5.3, p. 556). A superscript * below denotes this duality, not inversion of a virtual object. All comparison maps are assembled from actual short exact sequences of complexes and specified mapping cones. Coherence for arbitrary choices of distinguished triangles is not asserted (Burns–Flach Proposition 2.1 and Remark 1, pp. 507–508).

**Places and compact support.** S is a finite set of places of K containing the archimedean places and the places of bad reduction of 𝒳; S_p adds the places above p, and S_{p,f} denotes its finite places. RΓ_c(O_{K,S_p}, –) is the complex with archimedean terms of §3.5 (`compactCochainsWithInfinity`), the mapping fibre of global cochains to the local cochains at all places of S_p including the archimedean ones. For rational coefficients its archimedean terms are V^{G_v}[0] at every p; for integral coefficients this description holds at real places when p is odd. Integral statements are made for p odd, or for K without real places, as in PeriodsAndSpecialValues PS.4.4.

**Regulators.** The Beilinson regulator r_B is π_* composed with MotivicEtaleKTheory's Deligne regulator (§12.2) and, for number fields, is the regulator r_Be of BorelRegulators §8.4 in the Tate coordinate of BorelRegulators §4.1; the Borel regulator is twice it in each coordinate. The p-adic realization is the étale realization of motivic cohomology, which on K-theory is the normalized character ch_j; the Chern class c_{j,2j−1} = (−1)^{j−1}(j − 1)!·ch_j is not used for the realization (MotivicEtaleKTheory §12.8).

**Integral clauses.** An element x of a module generates a lattice L when `Submodule.span R {x} = L`; this is Mathlib's vocabulary and no separate predicate is introduced. A rational basis need not generate.

## Exact supplier contracts

### From Mathlib (pinned)

`NumberField.Units.rank`, `NumberField.Units.finrank_eq` (Dirichlet's unit theorem), `NumberField.Units.logEmbedding`, `NumberField.Units.regulator`, `NumberField.Units.regulator_pos`, `NumberField.Units.torsionOrder`, `NumberField.classNumber`, `NumberField.discr`, `NumberField.InfinitePlace.nrRealPlaces`, `NumberField.InfinitePlace.nrComplexPlaces`, `NumberField.InfinitePlace.card_add_two_mul_card_eq_rank` (r₁ + 2r₂ = [K:ℚ]), `NumberField.InfinitePlace.card_eq_nrRealPlaces_add_nrComplexPlaces`, `NumberField.InfinitePlace.nrRealPlaces_eq_one_of_finrank_eq_one`, `NumberField.InfinitePlace.nrComplexPlaces_eq_zero_of_finrank_eq_one`, `NumberField.dedekindZeta` (the ideal L-series, used only for real s > 1), `NumberField.dedekindZeta_residue`, `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` (the class number formula at s = 1), `Matrix.det`, `Matrix.det_smul`, `Submodule.span`, `PadicInt`, `Complex.Gamma`. These are used as stated; the continued ζ_F at s ≤ 0 is BorelRegulators §5.1's.

### From Tau Ceti (pinned)

`TauCeti.Hodge.HodgeStructureOn` with `TauCeti.Hodge.HodgeStructureOn.isCompl_F_conjF` and `TauCeti.Hodge.HodgeStructureOn.conjF_antitone` (`TauCeti/Geometry/Hodge/Structure.lean`), for the weight argument of §2.1; `TauCeti.kummerMap` (`TauCeti/FieldTheory/GaloisCohomology/Kummer.lean`), the finite-level Kummer map of a field, for §3.1; `WeierstrassCurve.Affine.regulator` with `regulator_eq_abs_det_neronTateGramMatrix` and `regulator_eq_one_of_finrank_eq_zero` (`TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/Regulator.lean`), the Néron–Tate Gram determinant, for §§2.2 and 2.5.

### From TauCetiRoadmap EllipticCurves, EtaleCohomologyFoundations and PadicMeasuresIwasawaAlgebras

EllipticCurves: Layer 0 (the divisor class of a point and Pic⁰ ≅ E(K)), Layer 1 (isogenies), Layer 2 (the Weil pairing and Tate modules), Layer 6 (Mordell–Weil, the canonical height ĥ in its pinned normalization, ĥ(P) = 0 exactly for torsion P, Northcott finiteness, the Néron–Tate pairing and the regulator with basis independence), Layer 7 (Selmer groups, Sha and the Kummer sequence). Positive definiteness of the pairing on E(K) ⊗ ℝ is proved in §2.5 from these. EtaleCohomologyFoundations: F.1 (derived étale sheaves), F.2.1–F.2.2 (proper and smooth base change), F.4.2 and F.4.5 (ℓ-adic cohomology as limits of finite levels, and its rational realization), for the construction of §3.1. PadicMeasuresIwasawaAlgebras §5.1: `detLine`, `detLine_shortExact`, `detLine_cone`, `detLine_baseChange`, `detLine_shift`, `detLine_acyclic` and the Koszul sign on graded lines, over commutative rings; triangles are used only through their cone presentations.

### From MotivicEtaleKTheory

§§4.1–4.4: `higherChow`, `cycleComplex`, `motivicComplex`, with flat pullback, proper pushforward, localization and products. §9.3: `coniveauEdge_eq_character`, the normalized character K_m(X)^{(j)}_ℚ ≅ H^{2j−m}_M(X, ℚ(j)) for X smooth over a field. §§10.1–10.2: the finite-coefficient comparison of motivic and étale cohomology over smooth Dedekind bases with ℓ invertible. §§10.4–10.5: `quillenLichtenbaumSIntegers`, `arithmeticFiniteOdd`, `arithmeticAdicComparison` for rings of S-integers, ℓ odd or F totally imaginary. §§11.3 and 11.5: the dyadic divisible and integral comparisons. §12.1: `finiteEtaleChern` and the agreement of the étale realization of the motivic Chern classes with it. §12.2: `cubicalDeligneRegulator`, `cubicalRegulator_flatPullback`, `beilinsonRegulatorComparison`. §12.3: `numberFieldDeligneRegulator`, `integralMotivicImage`, `integralMotivicLatticeCandidate`, `rationalIntegralPart`, for a specified regular model. §12.6: `localTateRegulatorComparison`, `selmerRegulator`, in the Tate (j ≥ 2) and elliptic (j = 1) cases. §12.7: `arithmeticDeterminantLine` Δ_p(T) = det⁻¹ C_c(T) with base change and triangle isomorphisms, and `selmerLocalDeterminant` det⁻¹ C_f ≅ det⁻¹ C_c ⊗ ⊗_v det⁻¹ U_v^+ in the fixed order; only the first paragraph of §12.7 is used, without any input from PeriodsAndSpecialValues. §12.8: `chernImageScaling`.

### From PeriodsAndSpecialValues

PS.0.1–PS.0.2: the comparison line I = β⁻¹ and the infinity involution. PS.3.1: `fundamentalLineXi`, `fundamentalLineDelta`, `fundamentalLine_coordinates`, for supplied finite-dimensional projective factors. PS.3.2: `realTrivialization`, `realTrivialization_matrix`, built from a supplied exact-sequence witness. PS.3.3: `leadingCoeff`, `LeadingTermRational`. PS.4.1: `integralLattice` I_λ(M, T, S) = θ_λ⁻¹(d_{O_λ} RΓ_c(T)) for a supplied θ_λ. PS.4.2: `detLattice_eq`, `detLattice_latticeChange`. PS.4.3: `localEulerFactor_det`, `localEulerFactor_crystalline`, `localTamagawa_elliptic`. PS.4.4: the real dyadic restriction. PS.5.1: `cohomologicalObstruction`, `tamagawaObstruction`, `tamagawaObstruction_commutative`, `finiteBoundaryGluing`. PS.5.2: `ETNC` with its parts. PS.5.3: `zetaIso_iff_tamagawaObstruction`. PS.6.3: `ellipticFundamentalLine_iff_bsd`. PS.6.4: the prime-by-prime transport.

### Virtual determinants: GeneralAlgebraicKTheory's supplier contract

The single owner of the following foundation is **GeneralAlgebraicKTheory, Layer 4**. PeriodsAndSpecialValues PS.3–PS.5 and both comparisons here consume that same foundation. Its relative triples (§4.15), automorphism boundary (§4.16) and five-term sequence (§4.17) do not substitute for these targets. The perfect-complex comparison (§6.19) provides a later compatibility theorem; it is not a prerequisite of the Layer 4 construction. The required extension of that supplier consists of the following four constructions and theorems (Burns–Flach §§2.1–2.5, pp. 504–509).

1. `virtualObjects` and `virtualObjects_universal`: for a small exact category E, construct the fundamental groupoid Π₁(KSpace(E)) of GeneralAlgebraicKTheory §2.5's loop space, with the symmetric Picard structure induced by direct sums and exact-category additivity (§§4.2–4.3). Group completion supplies inverse objects and their evaluation paths; a negative K₀-class need not have a projective representative. Construct d_E on the isomorphism groupoid of E, its normalized zero map, and d(E) ≅ d(E′)·d(E″) for every conflation E′ ↣ E ↠ E″. Prove compatibility with isomorphisms, nested admissible filtrations, and the symmetry obtained from the two split conflations for E′ ⊕ E″. Prove the universal property: precomposition with d_E is an equivalence between symmetric monoidal functors V(E) → P and determinant functors E → P, for every symmetric Picard category P. Use the edge paths, 2-simplices and 3-simplex relations of the Q/S-construction to present these maps and coherences; the groupoid truncation identifies homotopies relative endpoints. This is stronger than an identification of K₀ and K₁. Its API includes `virtualObjects.pi0`, `virtualObjects.aut_unit`, `virtualObjects.mapExact`, `virtualObjects.mapExact_id`, `virtualObjects.mapExact_comp`, `virtualObjects.naturalIso`, and `virtualObjects.additivity`.
2. `virtualPerfectDeterminant`: put V(R) = V(PMod(R)) for every unital ring R, without commutativity. Extend d_R to bounded perfect complexes and quasi-isomorphisms by the ordered alternating product of term determinants. Use bounded complexes of finite projectives and their truncation filtrations, GeneralAlgebraicKTheory's additivity, and the universal property in item 1. A bounded acyclic complex of projectives is split exact: induction from an endpoint makes its cycles projective. Its splitting-independent determinant trivialization defines the map for a quasi-isomorphism through its actual acyclic cone. This descends to perfect complexes; different projective models are compared by homotopy equivalences and their cone maps. The agreement with the later Gillet–Waldhausen comparison is proved after §6.19, without making the construction depend on that later layer. Its API is `virtualPerfectDeterminant.quasiIso`, `.shortExact`, `.filtration`, `.trueNineTerm`, `.shift`, `.acyclic`, `.cohomology` when the cohomology modules are perfect, and `.baseChange` for derived extension of scalars. The acyclic map is canonical and natural, with the zero complex normalized to 1_R. Item `.trueNineTerm` concerns a specified diagram of actual complexes and short exact sequences; it makes no assertion for an arbitrary diagram in a triangulated category. Source: Burns–Flach Proposition 2.1, pp. 507–508.
3. `virtualDeterminant_commutative`: using TauCetiRoadmap AlgebraicVectorBundles L0C, for commutative R the exterior-power determinant induces a symmetric monoidal functor V(R) → graded invertible R-modules (with a locally constant integer degree on Spec R) and agrees, for complexes and all maps in item 2, with PadicMeasuresIwasawaAlgebras §5.1. Prove it is an equivalence exactly when the natural K₀ and K₁ maps to graded-line classes and R^× are isomorphisms; apply this to fields, semisimple commutative rings, local rings and number rings. It is not an equivalence for an arbitrary commutative ring. Source: Burns–Flach §2.5, pp. 508–509.
4. `virtualDeterminant_dualMorita`: exact equivalences, opposite-ring duality on finite projectives, and base change transport the determinant functor, additivity and the maps in item 2. For duality, compare with dual complexes with their cohomological degrees reversed; inversion of an object is reserved for a shift. For Morita equivalence use the exact equivalence of module categories, rather than the determinant of the underlying vector space. Source: Burns–Flach §§2.3–2.6, pp. 505–510.

**Checks.**

- `virtualObjects_negative_component`: over a field F, π₀V(F) = ℤ contains −1, so a category whose objects are only honest finite-dimensional spaces cannot be the answer.
- `virtualObjects_K1`: multiplication by a ∈ F^× on a line represents a, not its rank, in Aut(1) = K₁(F).
- `virtualObjects_additivity`: on the zero object the identity is the unit, and direct sums multiply automorphism classes. For the exact category of finite abelian p-groups, the nonsplit sequence 0 → ℤ/p → ℤ/p² → ℤ/p → 0 also supplies its determinant map; refining the standard filtration of ℤ/p³ gives the same map to the ordered product of three copies of d(ℤ/p). An API restricted to split sequences fails this test.
- `perfectDeterminant_twoTerm`: [ℤ₃ --3--> ℤ₃] in degrees 0,1 has acyclic image 3ℤ₃ and its shift has image 3⁻¹ℤ₃.
- `perfectDeterminant_zero`: the zero complex and the identity cone have the specified unit trivialization.
- `perfectDeterminant_swap`: two odd rank-one factors contribute −1, witnessed by the determinant of the transposition matrix. Over 𝔽₂ this sign becomes +1; over ℚ or ℤ₃ it remains −1.
- `virtualDeterminant_commutative_field`: over a field the graded line records the virtual dimension, including −1, and the unit automorphism a. Forgetting either the grading or the automorphism loses one of K₀ and K₁.
- `virtualDeterminant_commutative_product`: over F × F′ the two component ranks are independent; a single total integer rank cannot replace the locally constant grading. Over a number ring a nonprincipal invertible ideal retains its Picard class, even though its rank is one.
- `virtualDeterminant_commutative_control`: the equivalence criterion requires both K-maps to be isomorphisms. For a commutative ring with nonzero SK₁, an automorphism in that kernel maps to determinant 1, so the graded-line functor cannot be faithful.
- `virtualDeterminant_Morita`: for R = M₂(F), a simple column module becomes an F-line; its scalar a has determinant a, whereas its underlying two-dimensional F-space has determinant a².
- `virtualDeterminant_dual`: dualizing a degree-zero line preserves its virtual dimension one, while shifting it changes that dimension to −1. On the two-term complex the dual reverses the degrees; applying the dual twice returns the original differential and trivialization.
- `virtualDeterminant_baseChange`: the preceding maps agree after F → F′; for a quotient map of rings use derived tensor product. For [ℤ --3--> ℤ] tensored with 𝔽₃ the differential is zero and both terms survive; replacing the complex by the underived tensor of its cohomology loses a Tor term.

These are checks of the supplier's construction; this roadmap introduces no second V(R).

### Arithmetic geometry used in §§1.2 and 3.1

SchemeAndStackFoundations SF.4e supplies alterations (T404), de Jong's alteration theorem (T415) and semistable alterations over a trait (T420); use their current TauCetiRoadmap forms. SchemeKTheoryOperations supplies the Cartan K ≅ G comparison for regular schemes (§2.6), pullback and proper pushforward, Adams and γ operations (§§6.2–6.5), and homological Adams Riemann–Roch (§7.5). MotivicEtaleKTheory §§4 and 9 supplies cycle complexes, the coniveau construction and its normalized character; §1.2 here proves the additional arithmetic-model compatibility. CrystallineCohomology CR.5–CR.6 supplies log-crystalline and Hyodo–Kato complexes with Nφ = pφN and the change-of-uniformizer comparison. PadicHodgeTheory §§3.1, 3.4–3.5, 5.3 and 8.1 supplies admissible filtered (φ,N,G_K)-modules, their period realizations, and the potentially semistable and de Rham comparisons. Section 3.1 here constructs the rational syntomic descent and regulator adapter from these inputs.

### From SpecialValuesBirchTate

§8.1: `hInvariant`, `padicValNat_hInvariant`, `rank_motivicH1`, `card_torsion_motivicH1`. §8.2: `motivicRegulatorCovolume`, `MotivicLichtenbaumFormula`, `LichtenbaumFormulaOddPart`. §8.3: the odd part for totally real fields and even weight.

### From BorelRegulators

§3.12 `borelRankTheorem_odd`; §4.1 the conjugation target V_j(F); §4.2 the integral reference lattice c_j⁻¹(ℤ^{I_j}) (the integral Betti lattice); §4.7 the normalized Borel regulator; §4.8 `higherK_transfer_comp`, `higherK_transfer_baseChange` (transfer and embedding naturality); §4.9 `higherAdams_chernCharacter` and the Adams weights; §4.10 the real regulator isomorphism; §§4.12–4.13 the determinant line, matrix and covolume; §5.1 `completedZeta_convention` with the supplied functional equation; §5.3 `normalizedLeadingCoefficient_factor`; §7.2 `borelRegulator_zetaProportional`; §§8.2–8.4 the Beilinson regulator r_Be and r_Bo = 2·r_Be with R_Bo = 2^{d_j}·R_Be.

### From the other roadmaps

ArithmeticKTheory §§3.2–3.3 (finite generation of K_n(O_F) and K_n(O_{F,S})). MotivesAndAlgebraicCycles §1.1 (`ChowMotive`), §1.2 (Tate twists), §1.3 (duality and rigidity), §2.3 (`HomTrivial_H`), §2.4 (`cycleClassFromChern`), §2.5 (`NormalizedComparison`), §2.6 (`BettiRealization`, `DeRhamRealization`), §2.7 (`EtaleRealization` and the comparison with Betti cohomology after forgetting the Galois action). SelmerIwasawaCohomology §1.4 (duality for a global mapping fibre with local conditions), §2.9 (Galois Selmer groups), §2.12 (`ellipticSelmerInfinity`), §2.16 (local duality of the finite condition away from p), §2.19 (Poitou–Tate for Selmer groups), §2.21 (`selmerComplex`, `selmerComplex_compactTriangle`), §2.23 (condition-change triangles), §4.9 (`blochKatoCondition`), §4.26 (the elliptic Bloch–Kato condition). ArithmeticGaloisDuality §R02.4.2 (local terms and the local Euler characteristic), §R02.4.4 (Tate's global Euler characteristic formula), §D7.3 (continuous cochains and perfect amplitude under (P)), §D7.4 (derived local duality), §D7.5 (`GaloisCohomology.compactCochains`, `compactTriangle`, derived Poitou–Tate duality), §D7.6 (Poitou–Tate for lattice and rational coefficients). PadicHodgeTheory §8.1 (`LisseZpSheaf.IsDeRham`, the de Rham comparison for proper smooth varieties). EllipticRegulators §6.1 (`regulatorOnIntegralPart`) and §6.2 (`BeilinsonConjecture.isIso`).

## How to read the build

Layer 1 turns a variety, a model, a projector and a twist into the four motivic vector spaces of the fundamental line, and says which of them vanish in each weight. Layer 2 builds the archimedean side: the period map α_M, the regulator sequence and its exactness, which is a theorem for Artin motives and for h¹(E)(1) and an explicit predicate otherwise; the real comparison ϑ_∞ follows. Layer 3 does the same p-adically with the realization maps, whose bijectivity is Soulé's theorem for Artin motives and the finiteness of Sha for h¹(E)(1); the p-adic comparison ϑ_p follows. Layer 4 combines ϑ_∞ and ϑ_p into the Tamagawa condition and proves or translates it in the cases where every input is a theorem.

## Layer 1: motivic factors of K-theoretic motives

This layer fixes the input of every statement of the roadmap: a smooth projective variety over a number field together with a regular model, an idempotent correspondence cutting out one cohomological degree, a Tate twist and a coefficient algebra. From these data it defines the two motivic vector spaces H⁰_f and H¹_f that enter the Burns–Flach fundamental line, proves that they vanish outside a narrow range of weights, and computes them for all Tate twists of Artin motives and for elliptic curves.

### 1.1 The K-theoretic motive datum

Define `KTheoreticMotive` as the structure with fields: a number field K; a smooth projective K-scheme X of pure dimension d, not necessarily geometrically connected; a regular, proper and flat O_K-model 𝒳 of X, recorded as part of the data; an idempotent π ∈ CH^d(X ×_K X) ⊗ ℚ whose Betti, de Rham and ℓ-adic realizations (MotivesAndAlgebraicCycles §§2.6–2.7, `BettiRealization`, `DeRhamRealization`, `EtaleRealization`) are concentrated in the single cohomological degree i, with 0 ≤ i ≤ 2d; an integer twist j; a finite-dimensional semisimple ℚ-algebra A; and a ring homomorphism φ : A → π·(CH^d(X × X) ⊗ ℚ)·π into the endomorphism ring of the Chow motive (X, π) (MotivesAndAlgebraicCycles §§1.1–1.3, `ChowMotive`, Tate twists, duality and rigidity). The datum is written M = h^i(X)(j). For X = Spec F with F/K finite, the model is Spec O_F; for an elliptic curve E/K the projector is π¹ = Δ − e × E − E × e, with e the origin, and i = 1.

Its API is:

- `KTheoreticMotive.weight` (w = i − 2j), computed by the integer function `motiveWeight i j = i − 2j`;
- `KTheoreticMotive.dualTwist`, the dual datum M*(1) = (X, πᵗ, 2d − i, d + 1 − j) with coefficient algebra A^op acting through transposed correspondences, computed on degrees and twists by `dualDegree d i = 2d − i` and `dualTwist d j = d + 1 − j`, with `motiveWeight_dual` (the dual datum has weight −2 − w) and `dualDegree_dualTwist_involutive` (dualizing twice returns the degree and the twist, so M*(1)*(1) = M);
- `KTheoreticMotive.restrictScalars`, the same variety regarded as a ℚ-scheme through Spec K → Spec ℚ, with the same model over ℤ, the realizations summed over the embeddings of K and the same L-function;
- `KTheoreticMotive.ofArtin F E e r`, for number fields F and E and an idempotent E-linear combination e of correspondences on h⁰(Spec F), represented over ℚ by the finite-copower construction below, with degree 0, twist r and coefficient action E;
- `KTheoreticMotive.ofElliptic E ℰ j`, for an elliptic curve E/K with a regular proper model ℰ, the datum (E, π¹, 1, j);
- `KTheoreticMotive.extendCoefficients`, extension of coefficients along A → A ⊗_E E′ for a field extension E′/E inside the centre, compatible with every factor, comparison and condition of Layers 1–4.

Here coefficient extensions are finite. Direct-sum APIs below concern pure Chow motives of a common weight with a chosen datum presentation; disjoint unions and Tate/projective-space presentations supply such sums. For a product coefficient algebra they are interpreted componentwise. An E-linear projector is not itself a rational correspondence on X. To represent h(X) ⊗_ℚ E, choose a ℚ-basis of E and take the disjoint union of [E:ℚ] copies of X, with the corresponding disjoint union of regular models. Its rational correspondence ring contains the matrix ring of correspondences on X. The regular representation E → End_ℚ(E) converts the entries of an E-linear projector into a rational matrix projector on this union. Define `coefficientCopower` by this presentation and prove `coefficientCopower_basisChange`, `coefficientCopower_realization` and `coefficientCopower_modelImage`: changes of basis conjugate the presentation, every realization is tensor product with E, and the model image is the direct sum of the original model images before applying the projector. For a finite extension E′/E use the E-balanced tensor product and its matrix presentation. Thus `ofArtin` and `extendCoefficients` return data of the stated rational-projector type, rather than silently changing the coefficient ring of CH. *Needs:* finite direct sums and idempotent splitting in MotivesAndAlgebraicCycles §1.1, higher Chow groups of a finite disjoint union in MotivicEtaleKTheory §§4.1–4.3, and finite-dimensional linear algebra.

The datum is the motivic structure of Burns–Flach §3.1, pp. 517–518, in the form h^n(X)(r) with coefficients acting by correspondences, and the motive of Kato 2003, §2.1, p. 167, a direct summand of H^m(X)(r) with an action of a number field. The model remains recorded data. Section 1.2 identifies its rational image with Scholl's functorial integral part, and hence proves the stability needed for every coefficient action, projector and transpose above. *Needs:* MotivesAndAlgebraicCycles §§1.1–1.3 (Chow motives, Tate twists, transposition and duals) and §§2.6–2.7 (Betti, de Rham and étale realizations); MotivicEtaleKTheory §12.3 (the specified-model image); §1.2's correspondence theorem for the factor API.

**Checks.**

- `weight_tate_two`: for (Spec ℚ, Δ, 0, 2) the weight is −4; the dual datum (Spec ℚ, Δ, 0, −1) has weight 2 = −2 − (−4).
- `dualTwist_dualTwist`: for any (d, i, j), 2d − (2d − i) = i and d + 1 − (d + 1 − j) = j, so dualizing twice is the identity. The untwisted dual (twist d − j) is also an involution but has weight −w: for ℚ(2) it gives weight 4 instead of 2, so `motiveWeight_dual` separates the two.
- `weight_elliptic_center`: h¹(E)(1) has weight 1 − 2·1 = −1 and its dual datum is (E, π¹ᵗ, 1, 1), the same degree and twist; the centre of the symmetry j ↦ 2 − j is j = 1.
- `impure_projector_rejected`: the diagonal of E has realizations in degrees 0, 1 and 2 and is not an admissible π; its h⁰ summand would contribute H⁰_f in weight 0 while its h¹ summand has weight 1, so no single weight governs the vanishing of §1.3.
- `coefficientCopower_quadratic`: for E = ℚ(√2), multiplication by √2 on the basis (1, √2) is the rational matrix with columns (0, 1) and (2, 0); its square is 2 times the identity. One copy of Spec ℚ cannot carry this E-action on its one-dimensional rational realization; two copies can.
- `coefficientCopower_projector`: for E² and e = diag(1, 0), the matrix presentation has rational image dimension [E:ℚ], not 1 and not 2[E:ℚ].
- `coefficientCopower_identity`: E = ℚ and its basis (1) recover X and its recorded model; changing a basis of a larger E conjugates the matrices and leaves the realized summand unchanged.

### 1.2 The motivic factors

Let M = h^i(X)(j) be a K-theoretic motive datum. Define `motivicFactorZero M`, the space H⁰_f(K, M), as π_*((CH^j(X)/CH^j(X)_{hom∼0}) ⊗ ℚ) when i = 2j, homological equivalence being taken in Betti cohomology through the embeddings of K (MotivesAndAlgebraicCycles §2.3, `HomTrivial_H`), and as 0 when i ≠ 2j. Define `motivicFactorOne M`, the space H¹_f(K, M), by cases on the integer n = 2j − i − 1:

```text
n < 0 :  H¹_f(K, M) = 0,
n = 0 :  H¹_f(K, M) = π_*(CH^j(X)_{hom∼0} ⊗ ℚ),
n > 0 :  H¹_f(K, M) = π_* im[H^{i+1}_M(𝒳, ℚ(j)) → H^{i+1}_M(X, ℚ(j))],
```

the last being π_* of `rationalIntegralPart` of MotivicEtaleKTheory §12.3. The motivic cohomology of the arithmetic model means Zariski hypercohomology of its cycle complex; on the smooth generic fibre it is CH^j(X, n) ⊗ ℚ (MotivicEtaleKTheory §§4.1–4.2). The normalized character of §9.3 identifies this generic group with (K_n(X) ⊗ ℚ)^{(j)}. The following two targets identify the **image** with the K-theoretic integral part and prove the generic-correspondence action on it; a generic-fibre action alone would not suffice. The factors of M*(1) use the dual datum. Sources for the factor convention are Burns–Flach §3.1, p. 518; Bloch–Kato Definition 5.1 and its motivic discussion, pp. 369–370; Fontaine §9.3, p. 231.

Construct `regularModelCharacter`: for a regular finite-type scheme Y over a regular noetherian base of dimension at most one, and m > 0, the rational coniveau comparison identifies H^{2j−m}_M(Y, ℚ(j)) with (K_m(Y) ⊗ ℚ)^{(j)}, naturally for restriction to an open subscheme. Its generic-fibre map is MotivicEtaleKTheory §9.3's normalized character. *Proof route.* Use the cycle-sheaf homotopy niveau tower, Cartan K ≅ G for regular Y, and the Adams operations on the tower. The filtration in degree m is finite, and its weight-j graded piece has Adams eigenvalue a^j. Over ℚ, different weights separate, all differentials vanish, and polynomial Adams projectors split the filtration. Identify the resulting edge with the normalized character by the same supported Chern construction as §9.3; flat restriction commutes with the tower and the projectors. This gives a commuting square on Y = 𝒳 and its generic fibre, not an inference from the field comparison alone. Source: Levine, *K-theory and motivic cohomology of schemes, I*, §1.5 and Theorem 1.6, pp. 6–7 (cycle-sheaf convention), §§2.2–2.3 (tower), Theorem 12.12 (Adams action), Theorem 14.7(1)–(3),(5), pp. 73–74 (degeneration, splitting and comparison). Only rational coefficients are used; its bounds for an integral comparison are not needed.

Prove `modelImage_eq_KIntegralPart`: under the generic normalized character, I_𝒳^{a,j} = im[H^a_M(𝒳, ℚ(j)) → H^a_M(X, ℚ(j))], for m = 2j − a > 0, is the image of (K_m(𝒳) ⊗ ℚ)^{(j)} in (K_m(X) ⊗ ℚ)^{(j)}. This follows by taking images in the preceding commuting square. Prove `modelImage_genericCorrespondence`: every Chow correspondence between smooth projective generic fibres takes these rational images into one another, with the usual degree and twist shifts; in particular a degree-zero correspondence γ : h(X) → h(X′) acts by pr₂*(pr₁*(x)·γ) on the integral part. *Proof route.* Scholl's Theorem 1.1.6 and Lemma 1.2.5, preprint pp. 4–5, express generic correspondences, rationally, as sums of pullback–proper-pushforward spans between regular projective semistable models after alterations. Divide the push-pull composite by the nonzero generic degree to split an alteration. The γ-filtration and proper-pushforward Riemann–Roch compare the image along these spans; Scholl §1.3.3, p. 8 proves its stability. For the specified model, which is only **proper**, use Corollary 1.3.4, p. 8, with generic-fibre alteration φ = id_X: its formula identifies this very K-image with the intrinsic integral part. Thus no extension of γ to the specified model and no projectivity of that model is assumed. Functoriality and additivity give composition, identity, transposes, finite copowers and coefficient extension. This proves that πI is stable under every γ = πγπ, and hence has the asserted A-module structure. It also proves `modelImage_changeModel`: any two regular proper flat models give the same rational subspace. Scholl's warning 1.1.7, p. 4 excludes the analogous claim for arbitrary singular models using G-theory.

Finite dimensionality of H¹_f is a hypothesis whenever a determinant of it is formed, and a theorem for Artin motives (§1.4) and h¹(E)(1) (§1.5). The preceding rational-image theorem supplies no finite generation, integral descent or equality of integral lattices.

Its API is:

- `motivicFactorOne_eq_zero_of_weight_nonneg`: if w ≥ 0 then H¹_f(K, M) = 0 (because n = −w − 1 < 0);
- `motivicFactorZero_eq_zero`: if i ≠ 2j, equivalently w ≠ 0, then H⁰_f(K, M) = 0;
- `motivicFactorOne_spec`: for X = Spec F with F/K finite and j ≥ 1, H¹_f(K, h⁰(F)(j)) = K_{2j−1}(O_F) ⊗ ℚ, which equals K_{2j−1}(F) ⊗ ℚ for j ≥ 2 and O_F^× ⊗ ℚ for j = 1;
- `motivicFactor_correspondence`: a correspondence γ : M → M′ of data induces γ_* on both factors, with (γ′ ∘ γ)_* = γ′_* ∘ γ_* and Δ_* = id;
- `motivicFactor_restrictScalars`: the factors of a datum over K and of its restriction of scalars to ℚ are equal;
- `motivicFactor_extendCoefficients`: extension of coefficients is the base change of both factors.

*Needs:* the fields of §1.1 (the datum itself does not depend on its factor API); MotivicEtaleKTheory §§4.1–4.4, 9.3 and 12.3; SchemeKTheoryOperations §§2.6, 6.2–6.5 and 7.5; SchemeAndStackFoundations SF.4e T404, T415, T420; MotivesAndAlgebraicCycles §§1.1 and 2.3. The arithmetic character and the correspondence-image compatibility are the two additional targets of this subsection, not unstated supplier assertions.

**Checks.**

- `motivicFactorOne_rat_one`: for (Spec ℚ, Δ, 0, 1), n = 1 and H¹_f = K₁(ℤ) ⊗ ℚ = ℤ^× ⊗ ℚ = 0, whereas K₁(ℚ) ⊗ ℚ = ℚ^× ⊗ ℚ is infinite-dimensional. A definition that forgets the image of the model fails this.
- `motivicFactorZero_point`: for (Spec F, Δ, 0, 0), H⁰_f = CH⁰(Spec F) ⊗ ℚ = ℚ, of dimension one, and H¹_f = 0 because n = −1.
- `motivicFactorOne_tate`: for (Spec F, Δ, 0, j) with j ≥ 2, dim H¹_f = r₂ for even j and r₁ + r₂ for odd j; for j = 1 it is r₁ + r₂ − 1. For F = ℚ these are 0, 1 and 0 at j = 2, 3 and 1.
- `motivicFactorOne_elliptic`: for h¹(E)(1), n = 0 and H¹_f = π¹_*(CH¹(E)_{hom∼0} ⊗ ℚ) = E(K) ⊗ ℚ, the Mordell–Weil group of TauCetiRoadmap EllipticCurves Layer 6 tensored with ℚ.
- `motivicFactorOne_weight_shift`: for h¹(E)(0), n = 2·0 − 1 − 1 = −2 and H¹_f = 0, although CH⁰ and the K-groups of E are nonzero; the case distinction is on 2j − i − 1, not on j.
- `regularModelCharacter_units`: on Spec O_F at m = j = 1 the comparison is O_F^× ⊗ ℚ, and restriction is the usual inclusion into F^× ⊗ ℚ. On Spec ℤ, the image is zero, excluding the full generic group.
- `regularModelCharacter_zero`: at j = 0 and m > 0 the weight-zero summand is zero on a connected regular scheme; disjoint unions give the direct sum of the comparisons, rather than additional classes supported on a chosen component.
- `regularModelCharacter_normalization`: for m > 0 the ordinary j-th Chern class is (−1)^{j−1}(j−1)! times the character. At j = 3 this factor is 2; substituting that map for the character fails compatibility with the normalized generic-fibre map even though it is a rational isomorphism.
- `modelImage_alteration_degree`: if an alteration has degree 3, its rational push-pull composite is 3·id; multiplication by 1/3 recovers id even at the rational 3-adic realization. This makes no integral splitting assertion at 3.
- `modelImage_matrixProjector`: for I ⊕ I and e = diag(1,0), e(I ⊕ I) = I ⊕ 0. A matrix correspondence with entries preserving I preserves this image when sandwiched by e, including after transposition.
- `modelImage_modelControl`: changing between regular proper flat models leaves I unchanged; forgetting regularity, replacing K by G, or asking that integral lattices agree is outside the theorem's hypotheses.

### 1.3 Weight vanishing and the shape of the line

Prove `weight_vanishing`: for every K-theoretic motive datum M of weight w,

1. H¹_f(K, M) = 0 if w ≥ 0, and H⁰_f(K, M) = 0 unless w = 0;
2. if w ≤ −3, then H⁰_f(K, M), H⁰_f(K, M*(1)) and H¹_f(K, M*(1)) vanish;
3. if w = −2, only H¹_f(K, M) and H⁰_f(K, M*(1)) can be nonzero;
4. if w = −1, only H¹_f(K, M) and H¹_f(K, M*(1)) can be nonzero;
5. the cases w ≥ 0 are those of M*(1), whose weight is −2 − w.

No finiteness is used. Substituting into the Burns–Flach line of PeriodsAndSpecialValues PS.3.1 (`fundamentalLineXi`), for w ≤ −3

```text
Ξ_A(M) = d(H¹_f(K,M))⁻¹ · ∏_{v|∞} d(H_v(M)^{G_v})⁻¹ · d(t_M),
```

for w = −2 the motivic factors are d(H¹_f(K,M))⁻¹ and d(H⁰_f(K,M*(1))^*)⁻¹, and for w = −1 they are d(H¹_f(K,M))⁻¹ and d(H¹_f(K,M*(1))^*) (Fontaine §7.1, pp. 224–225, for the simplification by weight; Burns–Flach §3.4, (29), p. 526, for the line). *Proof route.* Part 1 is the case distinction of §1.2: n = 2j − i − 1 < 0 exactly when w ≥ 0, and i = 2j exactly when w = 0. Parts 2–4 apply part 1 to M and to M*(1) (`motiveWeight_dual`). *Needs:* §§1.1–1.2; PeriodsAndSpecialValues PS.3.1.

**Checks.**

- For ℚ(2) over ℚ (w = −4), Ξ = d(K₃(ℤ) ⊗ ℚ)⁻¹ · d(B⁺)⁻¹ · d(t) with K₃(ℤ) ⊗ ℚ = 0, so only the archimedean and tangent factors are nontrivial.
- For ℚ(1) over ℚ (w = −2), H¹_f(ℚ(1)) = 0 and the surviving motivic factor is H⁰_f(ℚ(0))^* = ℚ, entering with exponent −1.
- For h¹(E)(1) (w = −1) with E(K) of rank zero, every motivic factor is zero and Ξ = d(B⁺)⁻¹ · d(t).

### 1.4 Artin motives

Let F and E be number fields, e an idempotent E-linear combination of correspondences on h⁰(Spec F), V = e·(h⁰(Spec F) ⊗ E) the Artin motive over ℚ with coefficients in E (after restriction of scalars from F to ℚ), and r ∈ ℤ. Prove `artinMotiveFactors`:

```text
H⁰_f(V(r)) = 0 for r ≠ 0,            H⁰_f(V) = e·(CH⁰(Spec F) ⊗ E),
H¹_f(V(r)) = 0 for r ≤ 0,            H¹_f(V(r)) = e·(K_{2r−1}(O_F) ⊗ E) for r ≥ 1,
```

with e·(K_{2r−1}(O_F) ⊗ E) = e·(K_{2r−1}(F) ⊗ E) for r ≥ 2 and = e·(O_F^× ⊗ E) for r = 1; and, for every r ≥ 1,

```text
dim_E H¹_f(V(r)) = dim_E V_B(r − 1)^+ − dim_E H⁰_f(V^∨(1 − r)),
```

where (−)^+ is the invariant part under the infinity involution of the conventions. For V = h⁰(F) and E = ℚ the dimension is r₁ + r₂ − 1 for r = 1, r₂ for even r ≥ 2 and r₁ + r₂ for odd r ≥ 3 (Huber–Kings §1.1, pp. 3–5, for Artin motives with coefficients and their motivic cohomology; Fontaine §8.3(a)–(b), pp. 228–229, for the unit motive and 𝔾_m; Bloch–Kato §5, p. 370, for Soulé's case X = Spec K, m = 0). *Proof route.* For r = 1 the Adams operation ψ^a on F^× is u ↦ u^a, so K₁(F) ⊗ ℚ has weight one. For r ≥ 2, K_{2r−1}(F) ⊗ ℚ is pure of Adams weight r (localization identifies it with the rational number-ring group; BorelRegulators §4.9 gives the Adams weights of the regulator and §4.10 its injectivity; MotivicEtaleKTheory §9.3), so H¹_M(F, ℚ(r)) = K_{2r−1}(F) ⊗ ℚ; the localization sequence H¹_M(O_F, ℚ(r)) → H¹_M(F, ℚ(r)) → ⊕_v H⁰_M(k_v, ℚ(r − 1)) of MotivicEtaleKTheory §4.3, whose last term vanishes for r ≥ 2, gives the equality of the integral part with H¹_M(F, ℚ(r)) for r ≥ 2, and H¹_M(O_F, ℚ(1)) = O_F^× ⊗ ℚ; the ranks are Borel's (BorelRegulators §3.12, `borelRankTheorem_odd`) for r ≥ 2 and Dirichlet's (Mathlib `NumberField.Units.finrank_eq`, `NumberField.Units.rank`) for r = 1; finite generation is ArithmeticKTheory §§3.2–3.3; the correspondences defining e act by restriction, transfer and their matrix combinations on a finite splitting field, and preserve the model image by `modelImage_genericCorrespondence` (§1.2); this includes correspondences not induced by automorphisms of F; the general dimension formula is the dimension count of the exact sequences of §2.4.

Record the dimensions for V = h⁰(K) as `artinFactorRank K r` (Dirichlet's rank `NumberField.Units.rank K` in twist one, r₂ or r₁ + r₂ by the parity of r in twists ≥ 2, zero in twists ≤ 0) and the dimension of the Betti plus part B⁺(h⁰(K)(r)) as `tatePlusDim K r` (r₁ + r₂ for even r, r₂ for odd r, since the infinity involution acts on ℚ(r) by (−1)^r). Prove `artinFactorRank_add_tatePlusDim` (for r ≥ 2, artinFactorRank K r + tatePlusDim K r = [K:ℚ], the dimension of t_M) and `artinFactorRank_one_add` (artinFactorRank K 1 + 1 + tatePlusDim K 1 = [K:ℚ]); these are the dimension counts of the exact sequences of §2.4, read through `NumberField.InfinitePlace.card_add_two_mul_card_eq_rank` (r₁ + 2r₂ = [K:ℚ]). *Needs:* §§1.2–1.3; MotivicEtaleKTheory §§4.3, 9.3 and 12.3; BorelRegulators §§3.12, 4.9 and 4.10; ArithmeticKTheory §§3.2–3.3; Mathlib `NumberField.Units.finrank_eq`, `NumberField.Units.rank`, `NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`, `NumberField.InfinitePlace.nrRealPlaces`, `NumberField.InfinitePlace.nrComplexPlaces`.

**Checks.**

- `artinFactorRank_rat`: for K = ℚ (r₁ = 1, r₂ = 0), artinFactorRank ℚ 3 = 1 and artinFactorRank ℚ 2 = 0 = artinFactorRank ℚ 1: K₅(ℤ) ⊗ ℚ is a line while K₃(ℤ) ⊗ ℚ and ℤ^× ⊗ ℚ vanish.
- For F imaginary quadratic (r₁ = 0, r₂ = 1), the factor is one-dimensional for every r ≥ 2 and zero for r = 1.
- `tatePlusDim_rat`: tatePlusDim ℚ 1 = 0 and tatePlusDim ℚ 2 = 1; a definition with the parities exchanged would give B⁺(ℚ(1)) = ℚ and break the count artinFactorRank ℚ 1 + 1 + tatePlusDim ℚ 1 = 1.
- For odd r ≥ 3 the rank formula agrees with r₁ + 2r₂ = [F:ℚ]: [F:ℚ] − tatePlusDim F r = r₁ + 2r₂ − r₂ = r₁ + r₂.
- For V = h⁰(F) and r = 1 the general formula reads dim V_B(0)^+ − dim H⁰_f(h⁰(F)) = (r₁ + r₂) − 1, the unit rank; omitting the H⁰ term gives r₁ + r₂ and fails for F = ℚ.

### 1.5 Elliptic motives

Let E be an elliptic curve over a number field K with a regular proper flat model ℰ over O_K and Künneth projector π¹, and j ∈ ℤ. Prove `ellipticMotiveFactors`:

1. H⁰_f(K, h¹(E)(j)) = 0 for all j;
2. H¹_f(K, h¹(E)(j)) = 0 for j ≤ 0;
3. H¹_f(K, h¹(E)(1)) = π¹_*(CH¹(E)_{hom∼0} ⊗ ℚ) = E(K) ⊗ ℚ through the Abel–Jacobi map P ↦ [P] − [O], a ℚ-space of dimension rank E(K);
4. for j ≥ 2, H¹_f(K, h¹(E)(j)) is the π¹-part of the image of H²_M(ℰ, ℚ(j)) in H²_M(E, ℚ(j)) = (K_{2j−2}(E) ⊗ ℚ)^{(j)}; for j = 2 it is the integral part of K₂(E) ⊗ ℚ on which EllipticRegulators §6.1 (`regulatorOnIntegralPart`) restricts the regulator, the π⁰- and π²-components of H²_M(E, ℚ(2)) being H²_M(K, ℚ(2)) = 0 and H⁰_M(K, ℚ(1)) = 0;
5. the Weil pairing identifies h¹(E)^∨ with h¹(E)(1) on realizations, hence the dual datum h¹(E)(j)*(1) with h¹(E)(2 − j), compatibly with the factors.

(Fontaine §8.3(d), p. 230, for the self-duality after the twist and H¹_f = A(ℚ) ⊗ ℚ of an abelian variety; Bloch–Kato Proposition 5.4, pp. 370–371, for the Kummer realization of the weight −1 factor; Burns–Flach §3.1, p. 518, for the case 2r − n − 1 = 0.) For j ≥ 2 finite dimensionality of the factor in part 4 is not known and remains a hypothesis of every determinant formed from it. *Proof route.* Parts 1–2 are `weight_vanishing` with i = 1 and w = 1 − 2j. Part 3: for n = 0 the factor is the group of homologically trivial divisor classes, which on a curve is Pic⁰(E) ⊗ ℚ; Pic⁰(E) ≅ E(K) by the Abel–Jacobi map (TauCetiRoadmap EllipticCurves Layer 0), finitely generated by Mordell–Weil (Layer 6). Part 4 is §1.2 with n = 2j − 2 and the model ℰ. Part 5: the Weil pairing (TauCetiRoadmap EllipticCurves Layer 2) and the duality of Chow motives (MotivesAndAlgebraicCycles §1.3) give h¹(E)^∨ ≅ h¹(E)(1); twist. *Needs:* §§1.2–1.3; TauCetiRoadmap EllipticCurves Layers 0, 2 and 6; MotivesAndAlgebraicCycles §1.3; EllipticRegulators §6.1 (the regulator on the integral part).

**Checks.**

- For E of rank zero, H¹_f(h¹(E)(1)) = 0 and the weight −1 line has no motivic factor.
- The symmetry j ↦ 2 − j has centre j = 1, matching L(h¹(E)(j), s) = L(E, s + j) and the functional equation s ↦ 2 − s of L(E, s): the dual datum h¹(E)(2 − j) has L(E, −s + 2 − j) = L(E, 2 − (s + j)).
- For E/ℚ of rank one generated by P modulo torsion, H¹_f(h¹(E)(1)) = ℚ·([P] − [O]); the class of [3P] − [O] spans the same line, so H¹_f does not see the index of a subgroup — that index appears only in the integral statements of Layer 4.

### Examples

For h⁰(ℚ)(r), H¹_f is K_{2r−1}(ℤ) ⊗ ℚ, a line exactly for odd r ≥ 3, and H⁰_f is ℚ in twist 0. For F real quadratic and r = 1, H¹_f is the line spanned by a fundamental unit. For h¹(E)(1) the factor is the Mordell–Weil group tensored with ℚ, and for h¹(E)(2) over ℚ it is the integral part of K₂(E) ⊗ ℚ, whose expected dimension [K:ℚ] = 1 is the content of §2.5(2).

### Dependencies

MotivicEtaleKTheory §§4.1–4.4, 9.3 and 12.3; MotivesAndAlgebraicCycles §§1.1–1.3 and 2.3–2.7; BorelRegulators §§3.12, 4.9 and 4.10; ArithmeticKTheory §§3.2–3.3; EllipticRegulators §6.1; TauCetiRoadmap EllipticCurves Layers 0, 2 and 6; PeriodsAndSpecialValues PS.3.1; Mathlib's unit theorem and infinite places.

## Layer 2: real regulators and the fundamental-line real comparison

This layer builds the archimedean side of the fundamental line for a K-theoretic motive: the period map α_M and its kernel and cokernel, the Beilinson regulator sequence whose maps are the cycle class, the regulator and the height pairing, the exactness predicate, its proof for every Tate twist of every Artin motive and for h¹(E)(1), and the resulting trivialization ϑ_∞ of Ξ_A(M) ⊗ ℝ. The abstract line, the abstract trivialization along an exact-sequence witness and the leading-term rationality predicate are PeriodsAndSpecialValues PS.3; what is built here is the witness.

### 2.1 The real Deligne complex

For a K-theoretic motive datum M put, for each archimedean place v = v(σ) of K, H_v(M) = π·H^i(σX(ℂ), (2πi)^j ℚ), with G_v = Gal(ℂ/K_v) acting through the infinity involution of the conventions (the geometric involution together with complex conjugation of the coefficients (2πi)^j); B⁺(M) = ⊕_{v|∞} H_v(M)^{G_v}; and t_M = H_dR(M)/F⁰, with the Hodge filtration shifted by j. Define `delignePeriodMap` α_M : B⁺(M) ⊗ ℝ → t_M ⊗_ℚ ℝ as the composite of B⁺(M) ⊗ ℝ → H_dR(M) ⊗_ℚ ℝ, induced by the comparison H_v(M) ⊗ ℂ ≅ H_dR(M) ⊗_{K,σ} ℂ, with the projection to t_M ⊗ ℝ, and `realDeligneComplex` RΓ_D(K, M) = [B⁺(M) ⊗ ℝ --α_M--> t_M ⊗ ℝ] in degrees 0 and 1. The comparison and the involution are PeriodsAndSpecialValues PS.0.1–PS.0.2 (the comparison determinant line, the real comparison and the infinity involution) and MotivesAndAlgebraicCycles §2.5 (`NormalizedComparison`, the de Rham–Betti comparison of a motive), which is G_v-equivariant for the diagonal action (Burns–Flach §3.2, p. 519). (Burns–Flach §3.2, (16), p. 519; Fontaine §9.2, pp. 230–231.)

Its API is:

- `delignePeriodMap_injective`: α_M is injective when w ≤ −1;
- `delignePeriodMap_surjective`: α_M is surjective when w ≥ −1, hence bijective when w = −1;
- `delignePeriodMap_ker_dual`: there are canonical isomorphisms ker(α_M)^* ≅ coker(α_{M*(1)}) and coker(α_M)^* ≅ ker(α_{M*(1)}), natural in M and A-linear for A^op on the dual;
- `delignePeriodMap_coker_eq_deligne`: for w ≤ −2, coker α_M is the invariant real Deligne cohomology H^{i+1}_D(X_{/ℝ}, ℝ(j))_π under simultaneous conjugation, the target of the Deligne regulator of MotivicEtaleKTheory §§12.2–12.3;
- `delignePeriodMap_finrank_coker`: for w ≤ −1, dim_ℝ coker α_M = dim_ℚ t_M − dim_ℚ B⁺(M);
- `delignePeriodMap_artin`: for an Artin motive V(r) with r ≥ 1, coker α = V_dR(r)_ℝ/V_B(r)^+_ℝ ≅ V_B(r − 1)^+_ℝ through ℂ = ℝ ⊕ ℝ(−1) (Huber–Kings §1.1, p. 5);
- `hodge_F_zero_inf_conjF_zero_eq_bot` and `hodge_F_zero_sup_conjF_zero_eq_top`: for a Tau Ceti pure Hodge structure `TauCeti.Hodge.HodgeStructureOn W ω n`, F⁰ ⊓ conj(F⁰) = 0 when n < 0, and F⁰ ⊔ conj(F⁰) = W when n ≥ −1; both follow from the opposedness `isCompl_F_conjF` at p = 0 and the antitonicity `conjF_antitone`, and they are the Hodge-theoretic content of the two previous items, in weight n = w.

*Proof route.* Injectivity in negative weight is Hodge symmetry: an element of the kernel is a class fixed by the real structure and lying in F⁰, hence in F⁰ ∩ conj(F⁰) = ⊕_{p,q ≥ 0} H^{p,q}, which is zero in weight p + q = w < 0 (`hodge_F_zero_inf_conjF_zero_eq_bot`, on Tau Ceti's `TauCeti.Hodge.HodgeStructureOn` with its opposedness `isCompl_F_conjF`). Surjectivity for w ≥ −1 is injectivity for M*(1), of weight −2 − w ≤ −1, through the duality, which is Poincaré duality pairing B⁺(M) with B⁺(M*(1)) and F⁰ with F¹ of the dual (Burns–Flach, Lemma 18, p. 559, announced in §3.2, p. 519). The Deligne identification uses the long exact sequence of the Deligne complex ℤ(j)_D (MotivicEtaleKTheory §12.2), in which H^{i+1}(X, ℝ(j)) ∩ F^j vanishes for weight reasons when i + 1 < 2j, leaving H^i_dR/(F^j + H^i(X, ℝ(j))), and then takes invariants under simultaneous conjugation; the dimension formula is injectivity. For an Artin motive the Hodge filtration is trivial and V_B is the space of ℚ-valued functions on the embeddings. *Needs:* §1.1; PeriodsAndSpecialValues PS.0.1–PS.0.2; MotivesAndAlgebraicCycles §2.5; MotivicEtaleKTheory §§12.2–12.3; Tau Ceti `TauCeti.Hodge.HodgeStructureOn`, `TauCeti.Hodge.HodgeStructureOn.isCompl_F_conjF`, `TauCeti.Hodge.HodgeStructureOn.conjF_antitone`.

**Checks.**

- `delignePeriodMap_rat_one`: for ℚ(1) over ℚ the infinity involution acts on 2πi·ℚ by −1, so B⁺ = 0, while t = ℚ (F⁰ = 0 in Hodge type (−1, −1)); hence coker α = ℝ, matching H⁰_f(ℚ(0))^* ⊗ ℝ = ℝ in the sequence of §2.2.
- `delignePeriodMap_rat_zero`: for ℚ(0) over ℚ, t = 0 and B⁺ = ℚ, so ker α = ℝ and coker α = 0.
- `delignePeriodMap_rat_three`: for ℚ(3) over ℚ, B⁺ = 0 and t = ℚ, so dim coker α = 1 = dim K₅(ℤ) ⊗ ℚ.
- `delignePeriodMap_rat_two`: for ℚ(2) over ℚ the involution acts by +1, B⁺ = (2πi)²·ℚ, t = ℚ and α is multiplication by (2πi)² = −4π², an isomorphism ℝ → ℝ; coker α = 0 = K₃(ℤ) ⊗ ℝ.
- `delignePeriodMap_wrong_involution`: using only the geometric involution, without conjugating the coefficients, makes B⁺(ℚ(3)) = ℚ, so dim coker α = dim t − dim B⁺ = 0, contradicting dim K₅(ℤ) ⊗ ℚ = 1.

### 2.2 The Beilinson regulator sequence

For a K-theoretic motive datum M whose four motivic factors are finite-dimensional, define the sequence of real A_ℝ-modules

```text
0 → H⁰_f(K,M)_ℝ --ε--> ker α_M --r_B^*--> H¹_f(K,M*(1))^*_ℝ --δ--> H¹_f(K,M)_ℝ --r_B--> coker α_M --ε^*--> H⁰_f(K,M*(1))^*_ℝ → 0
```

as follows (Burns–Flach §3.2, Conjecture 1 and (17), p. 519; Fontaine §8.3(a), pp. 228–229, and §9.6, p. 233):

- `cycleClassReal` ε : H⁰_f(K,M)_ℝ → ker α_M is the Betti cycle class of MotivesAndAlgebraicCycles §2.4 (`cycleClassFromChern`), which lands in ker α_M because an algebraic class of codimension j lies in F⁰ after the twist by j;
- `beilinsonRegulatorReal` r_B : H¹_f(K,M)_ℝ → coker α_M is π_* composed with the Deligne regulator of MotivicEtaleKTheory §12.2 (`cubicalDeligneRegulator` on CH^j(X, n), n = 2j − i − 1) restricted to the integral part of §1.2, followed by `delignePeriodMap_coker_eq_deligne`; for X = Spec F it is `numberFieldDeligneRegulator` of MotivicEtaleKTheory §12.3; it is zero in weight −1, where coker α_M = 0;
- r_B^* and ε^* are the transposes of the corresponding maps for M*(1) under `delignePeriodMap_ker_dual`;
- `heightPairingReal` h, in weight −1, is a pairing H¹_f(K,M)_ℝ × H¹_f(K,M*(1))_ℝ → ℝ: for h¹(E)(1) it is the Néron–Tate pairing (TauCetiRoadmap EllipticCurves Layer 6), transported through §1.5(3) and the self-duality §1.5(5); for every other datum of weight −1 it is input data. Its adjoint h♯ has direction H¹_f(K,M)_ℝ → H¹_f(K,M*(1))^*_ℝ. Under nondegeneracy define the arrow δ in the displayed sequence as (h♯)⁻¹, not h♯. Without nondegeneracy the weight −1 input is the forward map h♯, and the displayed sequence is asserted only after `RealExactness` supplies its inverse. In every other weight δ is zero, since its source or target vanishes (§1.3). This distinguishes the pairing from the inverse map in Fontaine §8.3(d), p. 230, and Burns–Flach (17), p. 519.

Its API is:

- `RegulatorsCommuteWithCoefficients M`, the proposition that for every a ∈ A the maps ε, r_B (and c⁰_p, c¹_p of §3.1) commute with φ(a)_*, and that the weight −1 pairing is balanced: h(φ(a)x, y) = h(x, φ(a)ᵗy), with the transposed A^op-action on the dual datum. Under it h♯, its inverse when defined, and all maps of the sequence are A_ℝ-linear, using the contragredient action on the dual vector space. For A = ℚ this balancing follows from bilinearity. Prove `regulatorsCommute_artin` by the matrix action on the finite permutation realization and transfer naturality (MotivicEtaleKTheory §12.2 `cubicalRegulator_flatPullback`, BorelRegulators §4.8), followed by coefficient extension and the idempotent summand; graphs of automorphisms of F alone do not describe all Artin projectors. Prove `regulatorsCommute_elliptic` for coefficients acting through endomorphisms, using naturality of Abel–Jacobi and Kummer, and adjointness of an isogeny and its dual for the Néron–Tate pairing (TauCetiRoadmap EllipticCurves Layers 1, 2 and 6); for j ≥ 2 use pullback and transfer on the integral motivic image, with stability supplied by `modelImage_genericCorrespondence` (§1.2). Burns–Flach §3.1, p. 518, takes coefficients acting by correspondences;
- `beilinsonRegulatorReal_artin`: for h⁰(F)(r), r ≥ 2, r_B is the Beilinson regulator r_Be of BorelRegulators §8.4 in the Tate coordinate of BorelRegulators §4.1, equal to one half of the Borel regulator r_Bo of BorelRegulators §4.7; the proof compares the universal classes: MotivicEtaleKTheory §12.3 defines `numberFieldDeligneRegulator` by the universal class (2πi)^j pr_j/j! and §12.2 identifies it with the regulator of the motivic roof (`beilinsonRegulatorComparison`), while BorelRegulators §§8.2–8.3 define r_Be by the infinitesimal Beilinson representative and compare it with the universal Borel class;
- `beilinsonRegulatorReal_units`: for h⁰(F)(1), r_B(u) = (log |u|_v)_{v|∞} with the normalized absolute values (squared at complex places), whose restriction to the places other than a fixed w₀ is Mathlib's `NumberField.Units.logEmbedding`;
- `realRegulatorSequence_dual`: the ℝ-dual of the sequence of M is, term by term, the sequence of M*(1);
- `realRegulatorSequence_restrictScalars`: the sequence of a datum over K is that of its restriction of scalars to ℚ.

The Beilinson–Bloch height pairing on CH^j(X)_{hom∼0} for a general datum of weight −1 is not constructed by any roadmap: MotivesAndAlgebraicCycles takes it as a datum, and so does this roadmap, except for h¹ of an elliptic curve, where it is the Néron–Tate pairing. *Needs:* §§1.2, 1.5 and 2.1; MotivesAndAlgebraicCycles §2.4; MotivicEtaleKTheory §§12.2–12.3; BorelRegulators §§4.1, 4.7 and 8.2–8.4; TauCetiRoadmap EllipticCurves Layer 6; Mathlib `NumberField.Units.logEmbedding`.

**Checks.**

- `beilinsonRegulatorReal_units_product_formula`: for F real quadratic with fundamental unit ε₀, r_B(ε₀) = (log|ε₀|, −log|ε₀|), and ε^* (the sum over the places) sends it to 0, by the product formula for units.
- `beilinsonRegulatorReal_units_complex_place`: in F = ℚ(2^{1/3}) (r₁ = r₂ = 1) the element u = 2^{1/3} − 1 is a unit of norm 1, so |σ_ℂ(u)|² = u⁻¹ at the complex place; r_B(u) = (log u, 2 log|σ_ℂ(u)|) = (log u, −log u) has coordinate sum 0, whereas the coordinates (log u, log|σ_ℂ(u)|) without the square at the complex place sum to ½ log u ≠ 0.
- `realRegulatorSequence_rat_one`: for ℚ(1) over ℚ every motivic term other than H⁰_f(ℚ(0))^* vanishes, ker α = 0, and the sequence is the isomorphism ε^* : coker α_M = ℝ → ℝ.
- `beilinsonRegulatorReal_not_borel`: replacing r_B by the Borel regulator multiplies it by 2 in each Tate coordinate, hence its determinant by 2^{d_r}, d_r = dim coker α; exactness is unchanged, but the coordinate of ϑ_∞ in §2.6 is divided by 2^{d_r}.
- `heightPairingReal_scalar`: multiplication by n on both elliptic factors satisfies h(nx, y) = h(x, ny); on the diagonal h(nx, nx) = n²h(x, x), in the pinned halved-polarization normalization.
- `regulatorsCommute_transpose`: for the dot pairing on ℝ², a = [[0, 1], [0, 0]], x = e₂ and y = e₁, h(ax, y) = h(x, aᵗy) = 1, whereas h(x, ay) = 0. Using the same left action on the second factor fails the coefficient condition.
- `regulatorsCommute_not_nondegenerate`: the zero pairing on a nonzero vector space is balanced for scalar coefficients but has no inverse adjoint; coefficient compatibility does not imply `RealExactness`.
- `heightPairingReal_elliptic`: for h¹(E)(1), the Gram determinant of h on a ℤ-basis of E(K)/tors is Reg_E, whereas δ, in the induced dual source basis and the original target basis, has determinant Reg_E⁻¹. In rank one with basis 3P the Gram determinant is 9 Reg_E and the determinant of δ is (9 Reg_E)⁻¹. A formula assigning Reg_E to the reverse arrow fails this test.

### 2.3 The real exactness predicate

Define `RealExactness M` as the Burns–Flach real exactness hypothesis of PeriodsAndSpecialValues PS.3.2 for the maps of §2.2: the four motivic factors of M and of M*(1) are finite-dimensional; in weight −1 the supplied height adjoint h♯ is bijective and δ is its inverse; in the other weights the sequence of §2.2, with δ = 0, is exact; and its ℝ-dual is identified with the sequence for M*(1) by `realRegulatorSequence_dual` (Burns–Flach §3.2, Conjecture 1, p. 519; Fontaine §9.3, p. 231). This yields the exact-sequence witness consumed by PS.3.2. The maps are part of the predicate: another map between the same spaces does not witness it. By `weight_vanishing` it says: for w ≤ −3, r_B is an isomorphism H¹_f(K,M)_ℝ ≅ coker α_M, which is Beilinson's conjecture; for w = −2, 0 → H¹_f(K,M)_ℝ → coker α_M → H⁰_f(K,M*(1))^*_ℝ → 0 is exact; for w = −1, h♯ is an isomorphism; for w ≥ 0, the dual statements for M*(1).

Its API is:

- `realExactness_dual`: RealExactness M ↔ RealExactness M*(1);
- `realExactness_iff_regulator_iso`: for w ≤ −3, RealExactness M ↔ (H¹_f(K,M) is finite-dimensional and r_B is bijective);
- `realExactness_finrank`: RealExactness M with w ≤ −2 implies dim H¹_f(K,M) = dim coker α_M − dim H⁰_f(K,M*(1));
- `realExactness_directSum`: RealExactness (M ⊕ M′) ↔ RealExactness M ∧ RealExactness M′, since a direct sum of sequences is exact exactly when each summand is;
- `realExactness_restrictScalars`: RealExactness is unchanged by restriction of scalars to ℚ;
- `realExactness_extendCoefficients`: RealExactness is unchanged by extension of coefficients.

*Needs:* §§1.3 and 2.2; PeriodsAndSpecialValues PS.3.2.

**Checks.**

- `realExactness_rat_one`: for ℚ(1) over ℚ the predicate holds: the sequence is the identity of ℝ.
- `realExactness_tate_two_rational`: for ℚ(2) over ℚ (w = −4), K₃(ℤ) ⊗ ℚ = 0 and α_M is the isomorphism of `delignePeriodMap_rat_two`, so coker α_M = 0 and the predicate holds with both sides of r_B zero.
- `realExactness_wrong_map`: for h⁰(F)(3) with F real quadratic, H¹_f ⊗ ℝ and coker α are both of dimension 2; the zero map between them is not exact although the dimensions agree. The predicate concerns r_B.
- `realExactness_elliptic_height`: for h¹(E)(1) the predicate is the nondegeneracy of the Néron–Tate pairing on E(K) ⊗ ℝ; a pairing identically zero on a curve of positive rank fails it.

### 2.4 Real exactness for Artin motives

Prove `realExactness_artin`: for every Artin motive V over ℚ with coefficients in a number field E and every r ∈ ℤ, RealExactness(V(r)) holds. Explicitly, for r ≥ 1

```text
0 → H¹_f(V(r))_ℝ --r_B--> V_B(r − 1)^+_ℝ --ε^*--> H⁰_f(V^∨(1 − r))^∨_ℝ → 0,
```

whose last term vanishes unless r = 1, and for r ≤ 0

```text
0 → H⁰_f(V(r))_ℝ --ε--> V_B(r)^+_ℝ --r_B^*--> H¹_f(V^∨(1 − r))^∨_ℝ → 0,
```

are exact (Huber–Kings Proposition 1.2.3, p. 7, and §1.1, p. 5; Fontaine §8.3(a)–(b), pp. 228–229). *Proof route.* For r ≥ 2: Borel's theorem that the Borel regulator is a real isomorphism (BorelRegulators §4.10), `beilinsonRegulatorReal_artin` with the factor two of BorelRegulators §8.4, the identification of its target with coker α by `delignePeriodMap_artin` (BorelRegulators §4.1 for the conjugation target V_r(F)), and compatibility of the regulator with restriction, transfer and their matrix combinations on a splitting field for the idempotent (BorelRegulators §4.8, `higherK_transfer_comp`, and §§1.2, 2.2 here). For r = 1: Dirichlet's unit theorem, that the logarithmic embedding of O_F^× ⊗ ℝ is an isomorphism onto the trace-zero hyperplane of ⊕_{v|∞} ℝ, whose quotient by the hyperplane is H⁰_f(h⁰(F))^∨_ℝ = ℝ through the sum (Mathlib `NumberField.Units.logEmbedding`, `NumberField.Units.finrank_eq`, `NumberField.Units.regulator_pos`). For r ≤ 0: `realExactness_dual` with 1 − r ≥ 1. *Needs:* §§1.4, 2.1–2.3; BorelRegulators §§4.1, 4.8, 4.10 and 8.4; Mathlib `NumberField.Units.logEmbedding`, `NumberField.Units.finrank_eq`, `NumberField.Units.regulator_pos`.

**Checks.**

- For F = ℚ and r = 3 the Beilinson regulator of a generator of K₅(ℤ) ⊗ ℚ is nonzero, and the sequence is an isomorphism of lines; the dimension count is `artinFactorRank_add_tatePlusDim` at r = 3: 1 + 0 = 1.
- For F real quadratic and r = 1 the sequence is 0 → ℝ·r_B(ε₀) → ℝ² → ℝ → 0, with the last map the sum of the coordinates.
- For F = ℚ and r = 0 the sequence is 0 → ℝ → ℝ → 0 → 0, the identity on H⁰_f(ℚ(0))_ℝ = B⁺_ℝ; for r = −1 it is 0 → 0 → 0 → 0 → 0, because B⁺(ℚ(−1)) = 0 and K₃(ℤ) ⊗ ℚ = 0.

### 2.5 Real exactness for elliptic motives

Let E be an elliptic curve over a number field K. First prove `neronTatePairing_posDef_real`: the Néron–Tate pairing of TauCetiRoadmap EllipticCurves Layer 6, extended ℝ-bilinearly, is positive definite on E(K) ⊗ ℝ. *Proof route.* E(K)/tors is a lattice in E(K) ⊗ ℝ (Mordell–Weil, Layer 6); the canonical height ĥ is a quadratic form, ĥ(P) = 0 exactly for torsion P, and the points of E(K) with ĥ(P) ≤ C are finite in number for every C (Northcott, through the bounded difference from the naïve height, Layer 6); the following elementary argument then proves positivity on the real span. Nonnegativity on the lattice gives nonnegativity on rational vectors by scaling, and then on real vectors by continuity. If a nonzero real vector v lies in the radical, choose lattice vectors z_n by rounding the coordinates of nv in a lattice basis. The differences z_n − nv stay in a fixed compact box, so q(z_n) = q(z_n − nv) is uniformly bounded, while the z_n form an infinite set. This contradicts the height finiteness just stated. Thus the real quadratic form has zero radical and is positive definite. This argument uses only the cited Mordell–Weil, quadratic-height and Northcott inputs; it does not require a further height theorem. The pairing is taken in the normalization pinned by TauCetiRoadmap EllipticCurves Layer 6, whose Gram determinant is Tau Ceti's `WeierstrassCurve.Affine.regulator`. *Needs:* TauCetiRoadmap EllipticCurves Layer 6 (the canonical height, its pairing and regulator, Northcott finiteness).

**Checks.** For a point P of infinite order, ĥ(P) > 0; for a torsion point, ĥ(P) = 0, so the pairing is only positive semidefinite on E(K) itself and the statement is about E(K)/tors ⊗ ℝ. In rank one with generator P, the form on ℝ is x ↦ x²ĥ(P).

Then prove `realExactness_elliptic`:

1. RealExactness(h¹(E)(1)) holds: α_M is an isomorphism (weight −1), the H⁰ factors vanish, H¹_f(K,M) = H¹_f(K,M*(1)) = E(K) ⊗ ℚ, and δ is the inverse of the adjoint of the Néron–Tate pairing, which is positive definite on E(K) ⊗ ℝ by `neronTatePairing_posDef_real`;
2. for j ≥ 2, RealExactness(h¹(E)(j)) is equivalent to: H¹_f(K, h¹(E)(j)) is finite-dimensional and r_B ⊗ ℝ is an isomorphism onto H²_D(E_{/ℝ}, ℝ(j)), of real dimension [K:ℚ]; for K = ℚ and j = 2 this is the isomorphism clause of EllipticRegulators §6.2 (`BeilinsonConjecture.isIso`), and no case with j ≥ 2 is asserted here;
3. for j ≤ 0, RealExactness(h¹(E)(j)) ↔ RealExactness(h¹(E)(2 − j)).

(Fontaine §8.3(d), p. 230, and §9.6, p. 233; Burns–Flach §3.2, Conjecture 1, p. 519.) *Proof route.* Part 1: by `delignePeriodMap_injective` and `delignePeriodMap_surjective` in weight −1, α_M is an isomorphism; §1.5 gives the factors; the sequence reduces to δ, the inverse of the Néron–Tate adjoint, which exists by `neronTatePairing_posDef_real`. Part 2: weight 1 − 2j ≤ −3, so §2.3 reduces the predicate to the bijectivity of r_B; since F^j H¹_dR(E) = 0 for j ≥ 2, t_M = H¹_dR(E/K) has ℚ-dimension 2[K:ℚ], while B⁺ has dimension r₁ + 2r₂ = [K:ℚ] (one eigenline of the involution at each real place, the full plane at each complex place), so dim coker α_M = [K:ℚ]. Part 3: `realExactness_dual` with §1.5(5). *Needs:* §§1.5, 2.1–2.3; TauCetiRoadmap EllipticCurves Layer 6; EllipticRegulators §6.2.

**Checks.**

- For E/ℚ of rank zero, part 1 is the exactness of 0 → 0, with α_M the real period isomorphism.
- For E/ℚ of rank one generated by P modulo torsion, h♯ is multiplication by the canonical height ĥ(P) > 0 and δ is multiplication by ĥ(P)⁻¹; for a degenerate pairing (a hypothetical zero height on P) the predicate would fail.
- For E/ℚ and j = 2, dim coker α_M = 1, the expected rank of the integral part of K₂(E) ⊗ ℚ; for E over an imaginary quadratic field it is 2.

### 2.6 The fundamental-line real comparison

For a K-theoretic motive datum M with RealExactness M and `RegulatorsCommuteWithCoefficients M`, define `fundamentalLineRealComparison` ϑ_∞(M) : Ξ_A(M) ⊗ ℝ ≅ 1 as PeriodsAndSpecialValues PS.3.2's `realTrivialization` applied to the exact-sequence witness of §2.2 together with 0 → ker α_M → B⁺_ℝ → t_{M,ℝ} → coker α_M → 0, in the fixed order of the factors of Ξ_A(M) of PS.3.1. Use GeneralAlgebraicKTheory's virtual determinant supplier contract above, over every finite-dimensional semisimple A; projectivity follows from semisimplicity. Its commutative graded-line realization is TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1 (Burns–Flach §§2.1–2.5 and §3.4, p. 529; Kato 2003, §2.1(b), p. 168).

Its API is:

- `fundamentalLineRealComparison_coordinate`: in bases of the motivic factors, of B⁺ and of t_M, ϑ_∞ is the signed product of the inverse regulator, cycle-class and height determinants with the period determinant (`realTrivialization_matrix`; Mathlib `Matrix.det`, `Matrix.det_smul`); in particular, if r_B(x) = R·y for bases x of H¹_f(K,M) and y of coker α_M in rank one, ϑ_∞(x⁻¹ ⊗ y) = R⁻¹;
- `fundamentalLineRealComparison_artin`: for an Artin motive h⁰(F)(r), r ≥ 2, a full ℤ-lattice Ω ⊂ H¹_f(h⁰(F)(r)), the integral Betti lattice T_B and the de Rham lattice O_F ⊂ t_M, ϑ_∞ sends the generator of det⁻¹Ω ⊗ det⁻¹T_B(r)^+ ⊗ det O_F to ±c_F(r)·R_Ω⁻¹, where R_Ω is the covolume of r_B(Ω) in V_B(r − 1)^+_ℝ relative to the integral Betti lattice and c_F(r) the period factor comparing O_F with T_B(r)^+ ⊕ T_B(r − 1)^+ (BorelRegulators §4.13 for the covolume); for h⁰(F)(1 − k), k ≥ 2, where t_M = 0, it sends the generator of det(Ω^*) ⊗ det⁻¹T_B(1 − k)^+ = det⁻¹Ω ⊗ det⁻¹T_B(1 − k)^+, Ω ⊂ H¹_f(h⁰(F)(k)), to ±R_Ω⁻¹ (Huber–Kings, proof of Theorem 1.4.1, pp. 13–14);
- `fundamentalLineRealComparison_dual`: when RealExactness and the coefficient compatibility hold for M and M*(1), construct `fundamentalLinePoincareDuality` PD : Ξ_A(M) · Ξ_{A^op}(M*(1))^* ≅ Ξ_A^loc(M), where Ξ_A^loc(M) = d_A H_dR(M) · d_A H_B(M)⁻¹ and H_B is the sum over **all embeddings** K → ℂ. Construct `localRealComparison` ϑ_∞^loc on this object from the period isomorphism (H_B ⊗ ℂ)^+ ≅ H_dR ⊗ ℝ, the decomposition H_B^+ ⊕ H_B^−·(2πi)⁻¹, and the coordinate (2πi)⁻¹ ↦ 1, multiplied by ε_B ε_dR. Here ε_B and ε_dR are the K₁-classes of −id on H_B^+ and F⁰H_dR respectively. Then ϑ_∞^loc ∘ PD = ϑ_∞(M) · ϑ_∞(M*(1))^*. These are Burns–Flach (53)–(57), pp. 544–545, and Lemma 17(a), pp. 558–559, at general semisimple coefficients. The narrower local line of Huber–Kings §2.2 is an Artin specialization, not the general definition;
- `fundamentalLineRealComparison_borel`: replacing the Beilinson by the Borel regulator for h⁰(F)(r), r ≥ 2, divides the coordinate by 2^{d_r}, d_r = dim coker α (BorelRegulators §8.4);
- `fundamentalLineRealComparison_restrictScalars` and `fundamentalLineRealComparison_extendCoefficients`: ϑ_∞ is unchanged by restriction of scalars to ℚ and is A-equivariant, commuting with extension of coefficients.

*Proof route for duality.* Apply the supplier's duality functor to the real Deligne complex of §2.1. The Poincaré pairing identifies D(M) with D(M*(1))^*[−1]; its construction uses the exact sequence 0 → t_{M*(1)}^* → H_dR(M) → t_M → 0 and the perfect Betti pairing with Tate coordinate (2πi)⁻¹. Combine this with the dual regulator sequences, the balanced height pairing of §2.2 and the cycle-class adjunction. Cancel the motivic factors using evaluation in V(A), retaining the ordered Betti and de Rham factors. Burns–Flach Lemma 18 and diagram (95), pp. 559–561, identify the remaining map with (57), including ε_B ε_dR. Thus the result is an equality of specified virtual-object isomorphisms, before taking scalar coordinates.

*Needs:* §§2.1–2.5; GeneralAlgebraicKTheory's virtual determinant contract above (including its duality and Morita API); PeriodsAndSpecialValues PS.3.1–PS.3.2 and PS.0.1; BorelRegulators §§4.12–4.13 and 8.4; MotivesAndAlgebraicCycles §2.5; TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1 for commutative coordinates; Mathlib `Matrix.det`, `Matrix.det_smul`, `NumberField.Units.regulator`.

**Checks.**

- `fundamentalLineRealComparison_rat_one`: for ℚ(1) over ℚ, Ξ = d(H⁰_f(ℚ(0))^*)⁻¹ ⊗ d(t), and ϑ_∞ sends (1^*)⁻¹ ⊗ 1 to 1 after the identification t ⊗ ℝ = coker α = ℝ.
- `fundamentalLineRealComparison_real_quadratic`: for h⁰(F)(1), F real quadratic with fundamental unit ε₀ and discriminant d_F, B⁺ = 0 and t_M = F; the generator ε₀⁻¹ ⊗ (1^*)⁻¹ ⊗ (1 ∧ ω), with (1, ω) a ℤ-basis of O_F, has coordinate ±√d_F/R_F, where R_F = log ε₀ is the regulator (Mathlib `NumberField.Units.regulator`): in the coordinates of the two real places, 1 ∧ ω has determinant ±√d_F, while r_B(ε₀) and a lift of 1 have determinant R_F.
- `fundamentalLineRealComparison_odd_swap`: swapping two odd-degree line factors in the fixed order multiplies ϑ_∞ by −1; a formula in ungraded lines cannot record the ordering used in the comparison.
- `localRealComparison_signs`: for ℚ(0), H_B^+ = F⁰H_dR = ℚ and ε_B ε_dR = (+1); for ℚ(1) both spaces vanish and the correction is again +1. For a direct sum the signs multiply. Dropping either factor alone already changes the ℚ(0) comparison by −1.
- `localRealComparison_complexPlace`: for Spec F with F imaginary quadratic, dim_ℚ H_B = dim_ℚ H_dR = 2, while dim B⁺ = 1. Replacing H_B by B⁺ in Ξ^loc gives the wrong virtual rank. Applying Morita equivalence to A = M₂(ℚ) carries the entire comparison diagram to the scalar diagram, rather than squaring its coordinates.
- `fundamentalLineRealComparison_borel_factor`: for F imaginary quadratic and r = 2 (d_r = 1), R_Bo = 2R_Be, so the coordinate computed with the Borel regulator is half the Beilinson coordinate; the opposite direction (twice) is the error of reading the coordinate as R instead of R⁻¹.
- For h¹(E)(1) with E/ℚ of rank one generated by P, the coordinate of the generator built from P, its dual and the Betti and de Rham lattices is a rational multiple of (Ω_E·ĥ(P))⁻¹, Ω_E the real period: the height enters inversely, as the unit regulator does in `fundamentalLineRealComparison_real_quadratic`.

### Examples

For ℚ(3) over ℚ the comparison is the isomorphism d(K₅(ℤ) ⊗ ℚ)⁻¹ ⊗ d(t) ≅ ℝ given by the Beilinson regulator of a generator and the period (2πi)³ relating t to the Betti lattice. For h⁰(F)(1) it is the unit regulator together with the discriminant, from the lattice O_F in t_M. For h¹(E)(1) it is the Néron–Tate regulator together with the real period.

### Dependencies

Layer 1; GeneralAlgebraicKTheory’s virtual determinant supplier contract; MotivicEtaleKTheory §§12.2–12.3; PeriodsAndSpecialValues PS.0.1–PS.0.2 and PS.3.1–PS.3.2; BorelRegulators §§4.1, 4.7–4.8, 4.10, 4.12–4.13 and 8.2–8.4; EllipticRegulators §6.2; MotivesAndAlgebraicCycles §§2.4–2.5; TauCetiRoadmap EllipticCurves Layer 6; TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1; Tau Ceti Hodge structures and `WeierstrassCurve.Affine.regulator`; Mathlib's unit theorem and determinants.

## Layer 3: p-adic realizations and the fundamental-line p-adic comparison

This layer does p-adically what Layer 2 does at infinity. The motivic factors are mapped into Bloch–Kato Selmer complexes by the étale Chern character and the p-adic Abel–Jacobi map; the realization predicate asks that these maps be isomorphisms; it is proved for every Tate twist of every Artin motive at every prime (Soulé, Kummer) and reduced to the finiteness of Sha for h¹(E)(1); the Selmer complexes of Artin motives are computed; and the comparison ϑ_p of Ξ_A(M) ⊗ ℚ_p with the determinant of compactly supported cohomology is assembled, with its Euler-factor normalization at the places above p.

### 3.1 The p-adic realization maps

Let M = h^i(X)(j) be a K-theoretic motive datum, p a prime, S a finite set of places of K containing the archimedean places and the places of bad reduction of 𝒳, S_p = S ∪ {v | p}, 𝒳_{S_p} = 𝒳 ×_{O_K} O_{K,S_p}, which is smooth and proper over O_{K,S_p}, and V_p = π·H^i_et(X_K̄, ℚ_p(j)) (MotivesAndAlgebraicCycles §2.7, `EtaleRealization`), a continuous representation of G_{K,S_p} with coefficients A_p = A ⊗ ℚ_p. Define `padicRealizationZero` c⁰_p : H⁰_f(K, M) ⊗ ℚ_p → H⁰(K, V_p) as the p-adic cycle class when i = 2j (MotivesAndAlgebraicCycles §2.4), and `padicRealizationOne` c¹_p : H¹_f(K, M) ⊗ ℚ_p → H¹(G_{K,S_p}, V_p) as follows (Bloch–Kato (5.2) and Conjecture 5.3, p. 370; Fontaine §9.4, pp. 231–232; Burns–Flach §3.2, (27), p. 523):

- if n = 2j − i − 1 > 0, a class of the integral part is the image of a class of H^{i+1}_M(𝒳, ℚ(j)) = H^{i+1}_M(𝒳, ℤ(j)) ⊗ ℚ; restrict an integral representative to 𝒳_{S_p}, on which p is invertible, and apply the finite-coefficient comparison of motivic with étale cohomology over a smooth Dedekind base (MotivicEtaleKTheory §§10.1–10.2) with coefficients ℤ/p^r(j), compatible under the coefficient maps; then the Hochschild–Serre spectral sequence of 𝒳_{S_p} → Spec O_{K,S_p}, whose terms H^a(G_{K,S_p}, H^b(X_K̄, ℤ/p^r(j))) come from smooth and proper base change (TauCetiRoadmap EtaleCohomologyFoundations F.1, F.2.1–F.2.2), with edge H^{i+1}(𝒳_{S_p}, ℤ/p^r(j))_0 → H¹(G_{K,S_p}, H^i(X_K̄, ℤ/p^r(j))) on the kernel of the restriction to H^{i+1}(X_K̄, ℤ/p^r(j))^{G_K}; then the inverse limit over r, which is exact here because every finite-level group is finite, and ⊗ ℚ (TauCetiRoadmap EtaleCohomologyFoundations F.4.2 and F.4.5; ArithmeticGaloisDuality §D7.3 for the continuous cochains of G_{K,S_p}); then π. The restriction to H^{i+1}(X_K̄, ℚ_p(j))^{G_K} vanishes rationally because i + 1 ≠ 2j and the Frobenius weights of H^{i+1}(X_K̄, ℚ_p(j)) at the good places are i + 1 − 2j ≠ 0. On the generic fibre this is the étale realization of motivic cohomology, which corresponds to the normalized character ch_j on K_n(X)^{(j)} under MotivicEtaleKTheory §9.3 (`coniveauEdge_eq_character`) and §12.1; no factorial is divided at a finite level (MotivicEtaleKTheory §12.1, Checks);
- if n = 0, apply the p-adic Abel–Jacobi map on π_*(CH^j(X)_{hom∼0}), the same construction in degree n = 0 on the homologically trivial cycles, which for h¹(E)(1) is the Kummer map of E.

The normalization is the character ch_j, not the Chern class c_{j,2j−1} = (−1)^{j−1}(j − 1)!·ch_j (MotivicEtaleKTheory §12.8, `chernImageScaling`): the real regulator r_B of §2.2 is the Deligne character, and the comparisons of §2.6 and §3.6 must realize the same rational structure.

The finite-level edge in this construction means the map F¹H^{i+1} → F¹/F² = E_∞^{1,i} ↪ E₂^{1,i}, not an assertion that the whole restriction kernel is isomorphic to E₂^{1,i}. The injection exists because no differential enters column 1 in this first-quadrant spectral sequence. The weight argument is rational and does not assert that finite-coefficient geometric invariants vanish. Prove `padicRealizationOne_projectedEdge`: after taking continuous ℚ_p-cohomology and applying π, only geometric degree i survives, so the projected degree i + 1 abutment identifies with H¹(G_{K,S_p}, V_p). Prove `padicRealizationOne_liftIndependent` by compatibility with the generic-fibre realization and injectivity of inflation H¹(G_{K,S_p}, V_p) → H¹(G_K, V_p); thus a model class restricting to zero generically has zero projected image. These are necessary construction lemmas, including compatibility of the finite cycle maps, limits and rational projectors; they are not consequences of equality of dimensions.

**The geometric local construction.** The following rational syntomic adapter is owned here and uses the earlier arithmetic-geometry contracts listed above. Let L/K_v be a finite extension of p-adic fields and Y any L-variety. The construction also applies to essentially finite diagrams of varieties, as needed for the finite skeleta of BGL; the smooth proper X used for M is a specialization. For j ≥ 0 construct `geometricSyntomicComplex` RΓ_syn(Y_h,j) as follows. Use the h-site generated by étale covers and proper surjections. The alterations of SchemeAndStackFoundations SF.4e give h-hypercovers by semistable pairs after finite extensions; apply the log-crystalline and Hyodo–Kato complexes of CrystallineCohomology §§5–6 and the filtered de Rham complex termwise, invert p, and take derived h-descent. Its model-independent description is the total complex

```text
RΓ_HK(Y_h) --(N,1−φ/p^j,ι_dR)--> RΓ_HK(Y_h) ⊕ RΓ_HK(Y_h) ⊕ RΓ_dR(Y)/F^j
             --(1−φ/p^(j−1)) − N--> RΓ_HK(Y_h),
```

with the three displayed columns in degrees 0, 1, 2 and the derived cohomological degrees retained. Here the de Rham complex for an arbitrary variety is the filtered h-descent complex, agreeing with algebraic de Rham cohomology for smooth Y; it is not the naïve Kähler complex of a singular Y. Frobenius is semilinear, and ι_dR includes scalar extension to L. The identity Nφ = pφN makes the composite zero. Prove h-descent, independence of the semistable hypercover, of its finite extension and of the Hyodo–Kato uniformizer, and compatibility with finite base change; these follow by the log-crystalline comparison on each pair, the change-of-uniformizer map and finite Galois descent, not by choosing a semistable model of Y over L. This is Nekovář–Nizioł Proposition 3.20 and its construction, pp. 1744–1746, with Proposition 3.22, pp. 1749–1750. Its API names these maps `geometricSyntomicComplex.pullback`, `.hDescent`, `.changeHypercover`, `.changeExtension`, `.changeUniformizer` and `.baseChange`, with identity, composition and compatibility identities.

Construct `geometricSyntomicPeriod` ρ_syn : RΓ_syn(Y_h,j) → RΓ_et(Y,ℚ_p(j)) from the period-ring fundamental sequences and the semistable/de Rham comparisons of PadicHodgeTheory §§3.1, 3.4–3.5, 5.3 and 8.1. Applying the Postnikov filtration to geometric Hyodo–Kato cohomology, and continuous Galois cochains via finite extensions followed by the homotopy limit, gives `geometricSyntomicDescent`, a map of spectral sequences

```text
H^a_st(L,H^b_et(Y_Lbar,ℚ_p(j))) ⇒ H^(a+b)_syn(Y_h,j)
                 ↓                              ↓ ρ_syn
H^a(L,H^b_et(Y_Lbar,ℚ_p(j)))    ⇒ H^(a+b)_et(Y,ℚ_p(j)).
```

Here H_st is computed by C_st(V) = [D_st(V) → D_st(V) ⊕ D_st(V) ⊕ t_V → D_st(V)] with the same differentials (φ on the already twisted V), not by the different complex named `classicalStComplex` in PadicHodgeTheory §3.7. In degree one its canonical injection into H¹(L,V) classifies potentially semistable extensions when V is potentially semistable, hence has image in H¹_g(L,V). These are Nekovář–Nizioł Remark 2.6, p. 1711, and Theorem 4.8 and proof, pp. 1764–1769. The construction uses actual filtered complexes and their period maps; agreement of dimensions is insufficient. Name the naturality and product maps `geometricSyntomicPeriod.pullback`, `.baseChange`, `.product`, `.unit`, and the maps of filtered complexes and their induced edges `geometricSyntomicDescent.filteredPeriod`, `.edge`, `.pullback` and `.projector`. Their identities and compositions are inherited from those specified complex maps, not chosen on cohomology.

Construct `geometricSyntomicCharacter` on K_n(Y)^{(j)}_ℚ by the universal syntomic Chern classes on BGL and the projective-bundle formula. Normalize the positive K-degree class by (−1)^{j−1}/(j−1)!; on K₀ take the j-th component of the Newton Chern character. Its API is `geometricSyntomicCharacter.pullback`, `.product`, `.finiteTransfer`, `.correspondence`, `.zero`, `.add`, `.projector` and `.period`, expressing pullback, product, finite-transfer and smooth-proper-correspondence compatibility, zero and direct-sum additivity, coefficient projectors, and the period square below. Pullback and products come from the universal classes; use log-crystalline/de Rham traces and Riemann–Roch for smooth proper pushforward, so correspondences act by pullback, product and pushforward with the prescribed twists. Prove the commuting square ρ_syn ∘ ch_j^syn = ch_j^et by the universal first Chern class, splitting principle and the finite étale Chern maps of MotivicEtaleKTheory §12.1 (Nekovář–Nizioł Proposition 5.6, pp. 1776–1777, for the universal classes, and Proposition 5.7, pp. 1777–1778, for compatibility). This rational normalization takes place after inverting p; it asserts no division by a factorial in ℤ/p^r. Via MotivicEtaleKTheory §9.3 it is the regulator of a motivic class, including the homologically trivial cycle classes from the Adams-j summand of K₀.

Prove `padicRealizationOne_mem_g`: for every datum M and every v | p, loc_v(c¹_p(x)) belongs to H¹_g(K_v,V_p). For a nonzero source i ≥ 0 and 2j−i−1 ≥ 0 force j ≥ 1, so the preceding construction covers all required twists. For n > 0, apply it to the generic class in K_n(X)^{(j)}_ℚ; for n = 0 use its homologically trivial K₀ character class. The normalized syntomic class has zero geometric étale restriction. The two compatible descent filtrations give its degree-one edge in H¹_st(K_v,H^i_et(X_Kbar,ℚ_p(j))), mapping to the étale Abel–Jacobi class. Project by π, and then by coefficient idempotents. This is precisely the construction of the **proof diagram** of Nekovář–Nizioł Theorem 5.9, p. 1779. It agrees with §3.1's global map by naturality of restriction and of the Hochschild–Serre edge. The injection H¹_st → H¹_g proves the assertion without identifying the whole syntomic abutment with H¹_st. For n < 0 the source is zero.

Prove `padicRealizationOne_mem_f_goodReduction`: if V_p is crystalline at v | p, with Frobenius pure of weight w ≤ −3, then loc_v(c¹_p(x)) lies in H¹_f(K_v,V_p). These hypotheses hold when X has a smooth proper model at v: crystallinity is the proper smooth comparison, and purity is that of the smooth proper special fibre. Thus they give the claimed good-reduction case for M. The dual twist has weight −2−w ≥ 1, so purity excludes the eigenvalue 1 for the appropriate linear Frobenius power on D_cris(V_p^*(1)); in particular D_cris(V_p^*(1))^{φ=1} = 0. Bloch–Kato Proposition 3.8 and Corollary 3.8.4, pp. 354–355, give H¹_g = H¹_f. Both results hold rationally at p = 2. No equality H¹_g = H¹_f is asserted in the exceptional weights or at bad reduction.

For n > 0, also prove `padicRealizationOne_unramified_away_p`: at v ∤ p the image of the regular-model group is unramified. The étale character on the proper local model, proper base change and special-fibre weights give a Hochschild–Serre edge over the trait through H¹(k_v,V_p^{I_v}); its restriction is the generic Abel–Jacobi edge (Scholl, *Integral elements II*, §2, diagram (3), pp. 5–6). This is inclusion of the model image, not an equality with all unramified classes. For homologically trivial cycles at bad places this argument is not asserted without further input.

Define `PadicRealizationFinite M p` by the precise condition that for every finite place v and every x in H¹_f(K,M) ⊗ ℚ_p, loc_v(c¹_p(x)) belongs to H¹_f(K_v,V_p). In using this predicate only its remaining cases need be assumed: automatic cases are good places away from p, all places away from p for n > 0 by the preceding theorem, good-reduction places above p in weight ≤ −3, and the Tate and elliptic instances below. Thus good reduction above p removes the above-p hypothesis in that weight range. At exceptional above-p places and for general homologically trivial cycles at bad away-p places, retain the remaining finite-condition hypotheses explicitly. This predicate is a conjunction of statements about the **constructed map**, rather than a choice of a replacement map into H¹_f.

Its API is:

- `padicRealizationOne_mem_f`: under `PadicRealizationFinite M p`, c¹_p factors through H¹_f(K,V_p) = H¹RΓ_f(K,V_p) (SelmerIwasawaCohomology §§2.9 and 4.9). The predicate is proved for all Artin motives of twist ≥ 1 by MotivicEtaleKTheory §12.6 and Kummer theory, and for h¹(E)(1) by SelmerIwasawaCohomology §4.26. The preceding geometric construction supplies its general good-reduction weight ≤ −3 instance;
- `padicRealizationOne_units`: for h⁰(F)(1), c¹_p is the Kummer map O_F^× ⊗ ℚ_p → H¹_f(F, ℚ_p(1)), whose finite levels are Tau Ceti's `TauCeti.kummerMap` (`TauCeti/FieldTheory/GaloisCohomology/Kummer.lean`) for n = p^m;
- `padicRealizationOne_kummer_elliptic`: for h¹(E)(1), c¹_p is the Kummer map E(K) ⊗ ℚ_p → H¹_f(K, V_pE) of SelmerIwasawaCohomology §4.26 (the elliptic finite Kummer condition);
- `padicRealization_numberRing`: for X = Spec F, j ≥ 2 and every odd p, identify the integral motivic realization H¹_M(O_F[1/p],ℤ(j)) completed at p with H¹(O_F[1/p],ℤ_p(j)), using MotivicEtaleKTheory §§10.4–10.5. Also construct `numberRingStableEdge` e_(j,p) : K_{2j−1}(O_F[1/p]) completed at p ≅ H¹(O_F[1/p],ℤ_p(j)): Quillen–Lichtenbaum identifies completed algebraic and étale K-theory, and the étale K-descent spectral sequence has only the (a,b) = (1,2j) term in total degree 2j−1, since its coefficient sheaves are ℤ_p(b/2) for even b and the base has p-cohomological dimension 2. Thus no filtration extension or factorial denominator occurs. Its API `numberRingStableEdge_rationalization` identifies e_(j,p) ⊗ ℚ_p with c¹_p under the normalized motivic character, and `numberRingStableEdge_free` identifies the image of the torsion-free K-lattice with the free cohomological lattice. The proof and normalization are specified in §4.5;
- `padicRealization_restrictScalars`: compatible with restriction of scalars and Shapiro's lemma;
- `padicRealization_coefficients`: under `RegulatorsCommuteWithCoefficients M` (§2.2), c⁰_p and c¹_p are A_p-linear; for A = ℚ nothing is required.

*Needs:* §1.2; MotivesAndAlgebraicCycles §§2.4 and 2.7; MotivicEtaleKTheory §§4.1–4.4, 9.3, 10.1–10.2, 10.4–10.5, 12.1, 12.6 and 12.8; SchemeAndStackFoundations SF.4e T404, T415, T420; CrystallineCohomology §§5–6; PadicHodgeTheory §§3.1, 3.4–3.5, 5.3 and 8.1; TauCetiRoadmap EtaleCohomologyFoundations F.1, F.2.1–F.2.2, F.4.2 and F.4.5; ArithmeticGaloisDuality §D7.3; SelmerIwasawaCohomology §§2.9, 4.9 and 4.26; Tau Ceti `TauCeti.kummerMap`. The h-descent, period-map and normalized-character adapter just specified is new work here; a higher regulator roadmap consumes it.

**Checks.**

- `padicRealizationOne_rat_even`: for ℚ(j) over ℚ with even j ≥ 2 both sides vanish: K_{2j−1}(ℤ) ⊗ ℚ = 0, and H¹(ℤ[1/p], ℚ_p(j)) = 0 because its dimension is r₂ = 0 (Tate's Euler characteristic formula with H² = 0).
- `padicRealizationOne_units_degenerate`: for F = ℚ in twist one the source ℤ^× ⊗ ℚ_p and the target H¹_f(ℚ, ℚ_p(1)) = ℤ^× ⊗ ℚ_p are both zero.
- `padicRealizationOne_factorial`: with c_{j,2j−1} in place of ch_j, c¹_p is multiplied by (−1)^{j−1}(j − 1)!; rational bijectivity is unchanged, but the image of an integral lattice changes by that factor, which is a p-adic unit exactly when p ≥ j.
- `geometricSyntomicComplex_zero_point_sum`: the zero cohomological input gives the zero total complex; for Y = Spec L its untwisted input has N = 0, φ = 1 and the usual filtration on L; a disjoint union of two points gives the direct sum of these complexes. These distinguish derived descent from imposing good reduction or using only one component.
- `geometricSyntomicComplex_monodromy`: with p = 3, N = [[0,1],[0,0]] and φ = diag(1,3), Nφ = 3φN. Consequently (1−3φ/p^j)N − N(1−φ/p^j) = 0. Replacing the second differential by (1−φ/p^j)−N fails this check.
- `geometricSyntomicPeriod_units`: for L^× in twist one, the period map and the descent edge give the Kummer class; on O_L^× this is the Bloch–Kato exponential/logarithm comparison (Nekovář–Nizioł Proposition 4.13, pp. 1770–1771). At the identity unit the class is zero, multiplication of units adds their classes, and restriction followed by trace for L′/L multiplies by [L′:L]. These check the period map's zero, product and finite-base-change normalizations.
- `geometricSyntomicCharacter_normalization`: ch₁ of a line bundle is c₁, ch₂ on a positive K-degree class is −c₂, and ch₃ is c₃/2. The same identities hold after the period map. At p = 2 the last equality is rational, with no integral division assertion. The zero K-class maps to zero and the character of a direct sum is additive; using an uncorrected higher Chern class on K₀ fails the latter test.
- `geometricSyntomicDescent_edges`: at the point the b = 0 row recovers H¹_st(L,ℚ_p(j)) → H¹(L,ℚ_p(j)); for zero V both edges are zero; for a sum of two realizations the filtered map is the sum of their edges. A geometric invariant in column 0 is never itself sent to column 1 without the stated restriction-kernel condition.
- `padicRealizationOne_goodWeight_boundary`: for ℚ_p(2), w = −4 and D_cris(ℚ_p(−1)) has no fixed vector, so H¹_g = H¹_f. At weight −2 this weight argument no longer excludes the dual fixed vector. The Kummer class of a Tate parameter q with v(q) > 0 in H¹(L,ℚ_p(1)) is de Rham and has nonzero valuation, so it is outside H¹_f. This illustrates the need for the weight and good-reduction hypotheses.
- `padicRealizationOne_uniformizer`: in H¹(ℚ_p, ℚ_p(1)) = ℚ_p^× ⊗̂ ℚ_p, the class of p lies outside H¹_f = ℤ_p^× ⊗ ℚ_p and the class of a unit lies inside; a definition landing in all of H¹ in twist one is wrong.

### 3.2 The p-adic realization predicate

First prove `blochKatoCondition_orthogonal`: for a de Rham representation V of G_{K_v}, v | p, the Bloch–Kato subspaces H¹_f(K_v,V) and H¹_f(K_v,V^*(1)) are exact annihilators under the local Tate pairing (Bloch–Kato Proposition 3.8, p. 354). Retain its complex-level refinement `blochKatoLocalComplex_duality`: with RΓ_/f the specified cone of RΓ_f → RΓ, the cup product and local trace induce RΓ_f(K_v,V) ≅ RHom(RΓ_/f(K_v,V^*(1)),ℚ_p)[−2]. Construct the null homotopy of the finite–finite pairing using the two-term period-ring resolution with degree-zero terms B_cris × B_dR^+ and degree-one term B_cris × B_dR, the difference differential, and its multiplication; take continuous Galois invariants, identify the finite complex with [D_cris → D_cris ⊕ t_V], and use local duality to prove the induced map is a quasi-isomorphism. Burns–Flach Lemma 12 and (62)–(64), pp. 546–549, give these compatible chain maps and homotopies. This provides the input to derived Selmer duality; annihilation of H¹ alone would not specify it. Away from p use the unramified complex and local trace, and at infinity use the ordinary/modified comparison of §3.5 (SelmerIwasawaCohomology §2.16). *Needs:* SelmerIwasawaCohomology §§2.16 and 4.9; ArithmeticGaloisDuality §D7.4; PadicHodgeTheory §§3.1 and 8.1.

Define `PadicRealizationIso M p`: `PadicRealizationFinite` holds for both M and M*(1), and c⁰_p and c¹_p are isomorphisms H⁰_f(K,M) ⊗ ℚ_p ≅ H⁰RΓ_f(K, V_p) and H¹_f(K,M) ⊗ ℚ_p ≅ H¹RΓ_f(K, V_p), and likewise for M*(1). Under the predicate, H²RΓ_f(K, V_p) and H³RΓ_f(K, V_p) are identified with the duals of H¹_f(K, M*(1)) ⊗ ℚ_p and H⁰_f(K, M*(1)) ⊗ ℚ_p by the duality RΓ_f(K, V_p) ≅ RHom(RΓ_f(K, V_p^*(1)), ℚ_p)[−3] (Burns–Flach §3.2, Conjecture 2, p. 523, and §3.3, p. 525; Bloch–Kato Conjecture 5.3, p. 370). Here RΓ_f(K, V_p) is the Selmer complex of SelmerIwasawaCohomology §2.21 (`selmerComplex`) with the Bloch–Kato local conditions of §4.9, and the duality is the derived Selmer duality of SelmerIwasawaCohomology §1.4 applied to conditions that are exact orthogonal complements by `blochKatoCondition_orthogonal`. The maps are those of §3.1: equal dimensions do not witness the predicate.

Its API is:

- `padicRealizationIso_dual`: PadicRealizationIso M p ↔ PadicRealizationIso M*(1) p;
- `padicRealizationIso_finrank`: under the predicate, dim H^i RΓ_f(K, V_p) is the dimension of the corresponding motivic factor for i = 0, 1, 2, 3;
- `padicRealizationIso_directSum`: PadicRealizationIso (M ⊕ M′) p ↔ PadicRealizationIso M p ∧ PadicRealizationIso M′ p;
- `padicRealizationIso_extendCoefficients` and `padicRealizationIso_restrictScalars`.

*Needs:* §3.1; SelmerIwasawaCohomology §§1.4, 2.16, 2.21 and 4.9; ArithmeticGaloisDuality §D7.4; PadicHodgeTheory §8.1.

**Checks.**

- `padicRealizationIso_unit_motive`: for ℚ(0) over ℚ, c⁰_p is the identity ℚ_p ≅ H⁰(ℚ, ℚ_p), and H¹_f vanishes on both sides; for the dual ℚ(1), H⁰_f vanishes on both sides and H¹_f(ℚ, ℚ_p(1)) = 0 = ℤ^× ⊗ ℚ_p.
- `padicRealizationIso_elliptic_sha`: for h¹(E)(1) the predicate at p holds exactly when Sha(E/K)[p^∞] is finite (§3.4).
- `padicRealizationIso_dimension_only`: the zero map between two spaces of the same positive dimension is not an isomorphism; a predicate asking only dim H¹_f(K,M) = dim H¹_f(K, V_p) is strictly weaker.

### 3.3 Artin motives

Prove `padicRealization_artin`: for every Artin motive V over ℚ with coefficients in E, every r ∈ ℤ and every prime p, PadicRealizationIso(V(r), p) holds (Huber–Kings §1.1, pp. 5–6; Bloch–Kato §5, p. 370, and Example 3.9, p. 359). In twist r ≥ 2 this is Soulé's theorem K_{2r−1}(O_F) ⊗ ℚ_p ≅ H¹(O_F[1/p], ℚ_p(r)) = H¹_f(F, ℚ_p(r)) together with H²(O_F[1/p], ℚ_p(r)) = 0; in twist one it is Kummer theory O_F^× ⊗ ℚ_p ≅ H¹_f(F, ℚ_p(1)); in twists r ≤ 0 it follows by duality. At p = 2 only the rational statements are claimed.

*Proof route.* For r ≥ 2 and p odd, MotivicEtaleKTheory §10.5 (`arithmeticAdicComparison`, in the range of §10.4, `quillenLichtenbaumSIntegers`) identifies π_{2r−1} and π_{2r−2} of the p-completed K-theory of O_F[1/p] with H¹ and H² of ℤ_p(r), and finite generation (ArithmeticKTheory §§3.2–3.3) identifies these homotopy groups with K_n(O_F[1/p]) ⊗ ℤ_p, and `padicRealization_numberRing` identifies the comparison with c¹_p; Borel's ranks (BorelRegulators §3.12) give K_{2r−2}(O_F) ⊗ ℚ = 0, hence H²(O_F[1/p], ℚ_p(r)) = 0; localization identifies O_F[1/p] with O_F rationally for r ≥ 2. At p = 2 the same rational statements follow from the dyadic comparisons of MotivicEtaleKTheory §§11.3 and 11.5, whose corrections are 2-primary torsion and vanish after ⊗ ℚ. The local conditions are automatic: for r ≥ 2 the local H¹_f is all of H¹ at v | p and the unramified condition at v ∤ p holds rationally (Bloch–Kato Example 3.9, p. 359; MotivicEtaleKTheory §12.6), so H¹_f(F, ℚ_p(r)) = H¹(O_F[1/p], ℚ_p(r)). For r = 1 use Kummer theory: locally H¹(F_v, ℚ_p(1)) is the completed multiplicative group tensored with ℚ_p (Bloch–Kato p. 358) and H¹_f(F_v, ℚ_p(1)) is the image of the units (Example 3.9, p. 359), and globally H¹_f(F, ℚ_p(1)) = O_F^× ⊗ ℚ_p because the class group is finite (Huber–Kings p. 6, through the explicit exponential in twist one). For r ≤ 0 use `padicRealizationIso_dual`. The idempotent is applied by Galois equivariance. *Needs:* §§1.4, 3.1–3.2; MotivicEtaleKTheory §§10.4–10.5, 11.3, 11.5 and 12.6; ArithmeticKTheory §§3.2–3.3; BorelRegulators §3.12; SelmerIwasawaCohomology §4.9.

**Checks.**

- For F = ℚ and r = 3 both sides are one-dimensional over ℚ_p, spanned by the realization of a generator of K₅(ℤ) ⊗ ℚ.
- For r = 0 and V = h⁰(F), c⁰_p is ℚ ⊗ ℚ_p ≅ H⁰(F, ℚ_p) = ℚ_p.
- For F imaginary quadratic and r = 2, both sides are lines: K₃(O_F) ⊗ ℚ has rank r₂ = 1, and H¹(O_F[1/p], ℚ_p(2)) has dimension 1 by Tate's Euler characteristic formula once H² = 0.

### 3.4 Elliptic motives

Prove `padicRealization_elliptic`: for an elliptic curve E over a number field K and any prime p, c¹_p for h¹(E)(1) is the Kummer map E(K) ⊗ ℚ_p → H¹_f(K, V_pE); it is injective, and it is surjective exactly when Sha(E/K)[p^∞] is finite. Hence PadicRealizationIso(h¹(E)(1), p) holds if and only if Sha(E/K)[p^∞] is finite. For j ≥ 2, PadicRealizationIso(h¹(E)(j), p) is Bloch–Kato's Conjecture 5.3 for h¹(E)(j) and is not asserted (Bloch–Kato Proposition 5.4, pp. 370–371; Fontaine §8.2, p. 228). *Proof route.* Identify c¹_p with the Kummer map by §1.5(3) and §3.1; its image is H¹_f(K, V_pE) exactly when the divisible part of Sha(E/K)[p^∞] vanishes (Bloch–Kato Proposition 5.4; SelmerIwasawaCohomology §4.26, the elliptic finite Kummer condition, and §2.12, the elliptic Selmer instance; TauCetiRoadmap EllipticCurves Layer 7 for Selmer groups, Sha and the Kummer sequence); Sha[p^∞] is cofinitely generated, so this is finiteness. The M*(1) half is the same statement through the self-duality of §1.5(5). *Needs:* §§1.5, 3.1–3.2; SelmerIwasawaCohomology §§2.12 and 4.26; TauCetiRoadmap EllipticCurves Layer 7.

**Checks.**

- For E/ℚ with Sha(E/ℚ)[p^∞] finite and rank r, dim_{ℚ_p} H¹_f(ℚ, V_pE) = r.
- Over a finite extension K′/K, the predicate for E_{K′} implies it for E, since the kernel of Sha(E/K)[p^∞] → Sha(E/K′)[p^∞] is finite; the converse is not claimed.
- For rank zero, the predicate says H¹_f(K, V_pE) = 0, i.e. the p^∞-Selmer group is finite.

### 3.5 Selmer complexes of Artin motives

Define `compactCochainsWithInfinity` RΓ_c(O_{K,S_p}, T) for a G_{K,S_p}-lattice or representation T as the mapping fibre of the compactly supported cochains of ArithmeticGaloisDuality §D7.5 (`GaloisCohomology.compactCochains`, which use the finite places of S_p) to the archimedean cochains ⊕_{v|∞} C(G_v, T); for p odd C(G_v, T) is quasi-isomorphic to T^{G_v}[0], so the complex is bounded and perfect under the hypotheses of §D7.3, and d RΓ_c(O_{K,S_p}, T) = d C_c(G_{K,S_p}, T) ⊗ ⊗_{v|∞} d(T^{G_v})⁻¹. This is the complex of Fontaine, Burns–Flach and Huber–Kings, with RΓ_f(K_v, V) = RΓ(K_v, V) = C(G_v, V) at the archimedean places (Burns–Flach §3.2, p. 520, and (28), p. 523; Huber–Kings p. 7, for the triangle with the term V_p(r)^+); for a ℤ₂-lattice with real places, ordinary real cochains can be unbounded and nonperfect. The modified complex using complete Tate cochains in PeriodsAndSpecialValues PS.4.4 is a different integral construction. After rationalization complete Tate cochains are acyclic, whereas ordinary real cochains retain V^{G_v}[0]; replacing one by the other changes the rational compact-support complex. The rational comparisons here always use ordinary cochains, including at p = 2. *Needs:* ArithmeticGaloisDuality §§D7.3 and D7.5; PeriodsAndSpecialValues PS.4.4.

**Checks.**

- For K = ℚ, p odd and T = ℤ_p(0), T^{G_ℝ} = ℤ_p, so d RΓ_c(ℤ[1/p], ℤ_p) = d C_c ⊗ d(ℤ_p)⁻¹: the archimedean term is visible.
- For T = ℤ_p(1) and p odd, complex conjugation acts by −1, T^{G_ℝ} = 0, and the complex agrees with the compactly supported cochains over the finite places.
- For V = ℚ₂ with trivial real action, ordinary archimedean cohomology is ℚ₂[0], whereas complete Tate cohomology is zero. Thus their compact-support determinants differ by d(ℚ₂)⁻¹; rationalization does not identify these two conventions.
- For p = 2 and T = ℤ₂ with trivial action, the archimedean cochains of C₂ have cohomology ℤ/2 in every even positive degree, so the complex is not perfect and no integral statement at 2 is made.

Prove `selmerComplex_artin`: let V be an Artin motive over ℚ with coefficients in E, S a finite set of primes and p a prime; write RΓ_f(ℤ[1/Sp], V_p(r)) for the Selmer complex with the Bloch–Kato conditions at the primes of Sp. Then:

1. for r > 1 it is concentrated in degree 1, with H¹ = H¹(ℤ[1/Sp], V_p(r));
2. for r = 1 it is concentrated in degrees 1 and 3, with a distinguished triangle H¹_f(ℤ[1/Sp], V_p(1))[−1] → RΓ_f → H⁰(ℤ[1/Sp], V_p^∨)^∨[−3];
3. for r < 0 it is concentrated in degree 2, with H² ≅ H¹(ℤ[1/Sp], V_p^∨(1 − r))^∨;
4. for r = 0 it is concentrated in degrees 0 and 2, with a distinguished triangle H⁰(ℤ[1/Sp], V_p) → RΓ_f → H¹_f(ℤ[1/Sp], V_p^∨(1))^∨[−2];
5. there is a canonical distinguished triangle RΓ_c(ℤ[1/Sp], V_p(r)) → RΓ_f(ℤ[1/Sp], V_p(r)) → V_p(r)^+ ⊕ ⊕_{v∈Sp} RΓ_f(ℚ_v, V_p(r)), with RΓ_c = `compactCochainsWithInfinity`.

(Huber–Kings Lemma 1.2.6 and the following triangle, p. 9; Burns–Flach §3.2, (26), p. 522.) *Proof route.* Poitou–Tate with lattice and rational coefficients (ArithmeticGaloisDuality §D7.6) for the Selmer complex, whose conditions are orthogonal by `blochKatoCondition_orthogonal` and SelmerIwasawaCohomology §2.19; the local dimensions of Bloch–Kato Example 3.9, p. 359; the global vanishing of H² in twists > 1 from §3.3; and, for part 5, the compact triangle of the Selmer complex (SelmerIwasawaCohomology §2.21, `selmerComplex_compactTriangle`) together with the archimedean terms of `compactCochainsWithInfinity`. *Needs:* §§3.2–3.3; ArithmeticGaloisDuality §§D7.5–D7.6; SelmerIwasawaCohomology §§2.19 and 2.21.

**Checks.**

- For V = ℚ and r = 2 the complex is acyclic: H¹(ℤ[1/Sp], ℚ_p(2)) = 0 by `padicRealizationOne_rat_even`.
- For V = ℚ and r = 0, H⁰ = ℚ_p and H² = H¹_f(ℚ, ℚ_p(1))^∨ = 0, so RΓ_f ≅ ℚ_p[0].
- For V = ℚ and r = 1, H¹ = H¹_f(ℚ, ℚ_p(1)) = 0 and H³ = H⁰(ℚ, ℚ_p)^∨ = ℚ_p, so RΓ_f ≅ ℚ_p[−3], dual to the case r = 0.

### 3.6 The fundamental-line p-adic comparison

For a K-theoretic motive datum M with coefficients A, a prime p, a finite set S of places of K containing the archimedean places and the bad places, with PadicRealizationIso(M, p) and `RegulatorsCommuteWithCoefficients M`, define `fundamentalLinePadicComparison` ϑ_p(M, S) : Ξ_A(M) ⊗ ℚ_p ≅ d_{A_p} RΓ_c(O_{K,S_p}, V_p) by applying the virtual determinant functor of GeneralAlgebraicKTheory specified above (its commutative graded-line realization is TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1), in the fixed order of the factors of Ξ_A(M), to:

- the realization isomorphisms c^i_p(M), i = 0, 1, 2, 3, of §3.2;
- the Betti–étale comparison (H_v(M) ⊗ ℚ_p)^{G_v} ≅ H⁰(K_v, V_p) at the archimedean places, `bettiEtaleComparison_infinity`: Artin's comparison H_v(M) ⊗ ℚ_p ≅ V_p (MotivesAndAlgebraicCycles §2.7) intertwines the infinity involution of the conventions with complex conjugation c_v ∈ G_v, because it is natural for the antiholomorphic involution of σX(ℂ) induced by complex conjugation (Burns–Flach §3.2, (28), p. 523);
- the de Rham comparison t_M ⊗ ℚ_p ≅ ⊕_{v|p} t_v(V_p) with t_v(V) = D_dR(V)/F⁰ (PadicHodgeTheory §8.1, `LisseZpSheaf.IsDeRham`, after base change to K_v);
- the trivialization of d RΓ_f(K_v, V_p) at each finite v ∈ S_p by the identity of [V^{I_v} → V^{I_v}] for v ∤ p and of [D_cris → D_cris ⊕ t_v] at v | p, as in PeriodsAndSpecialValues PS.4.3 — not the acyclic trivialization;
- the distinguished triangle RΓ_c(O_{K,S_p}, V_p) → RΓ_f(K, V_p) → ⊕_{v∈S_{p,f}} RΓ_f(K_v, V_p) ⊕ ⊕_{v|∞} RΓ(K_v, V_p), with RΓ_c = `compactCochainsWithInfinity` (§3.5), built from ArithmeticGaloisDuality §§D7.3 and D7.5 and SelmerIwasawaCohomology §§2.21 and 2.23 (Selmer complexes and condition-change triangles).

(Burns–Flach §3.2, (19)–(26), pp. 520–523, and §3.4, p. 526; Kato 2003, §2.1(c), p. 168.) For an Artin motive V(r) over ℚ this is the isomorphism of Huber–Kings Definition 1.2.7, p. 9. At p = 2 this rational complex remains bounded and its ordinary real cochains retain V_p^{G_v}[0]; no integral determinant of an unbounded ℤ₂-cochain complex is asserted. The modified Tate construction of PeriodsAndSpecialValues PS.4.4 requires a separate integral comparison (§3.5).

Its API is:

- `fundamentalLinePadicComparison_enlargeS`: for S ⊂ S′, ϑ_p(M, S′) and ϑ_p(M, S) correspond under the localization triangle RΓ_c(O_{K,S′_p}) → RΓ_c(O_{K,S_p}) → ⊕_{w∈S′∖S} RΓ(k_w, V_p^{I_w}) and the identity trivializations of the local terms (Burns–Flach Lemma 5, pp. 526–528; Huber–Kings Proposition 1.2.9(b), p. 10);
- `fundamentalLinePadicComparison_eulerFactor`: at v | p, if 1 − φ is invertible on D_cris(V_p), the identity trivialization equals the acyclic trivialization multiplied by det(1 − φ | D_cris(V_p)), which is the Euler factor P_v(V, q_v^{−r}) up to sign for an Artin motive V(r) (Huber–Kings Proposition 1.2.5, p. 8);
- `fundamentalLinePadicComparison_dual`: under the realization and coefficient hypotheses for M and M*(1), the square with top PD : Ξ(M) · Ξ(M*(1))^* → Ξ^loc(M), vertical maps ϑ_p(M) · ϑ_p(M*(1))^* and ϑ_p^loc, and bottom AV_p : d RΓ_c(V_p) · d RΓ_c(V_p^*(1))^* → Λ_p^AV(S,V_p) commutes. Here Λ_p^AV(S,V_p) = d C_AV(V_p) for the cone below, and the auxiliary local object is Λ_p(S,V_p) = ∏_{v∈S_{p,f}} d RΓ(K_v,V_p)⁻¹ · d(Ind_K^ℚ V_p)⁻¹. Construct `localPadicComparison` ϑ_p^loc = ε(S,p) ∘ θ′_p ∘ θ_p: θ_p is induced by the full Betti–étale comparison, 0 → t_{M*(1)}^* → H_dR(M) → t_M → 0, and the local finite-complex duality of §3.2; θ′_p comes from the ordinary-to-modified archimedean cone described next. The correction ε(S,p) is the K₁-class of −id on ⊕_{v∈S_{p,f}} RΓ_/f(K_v,V_p). This is Burns–Flach (66)–(82), pp. 549–553, and Lemma 17(b), pp. 558–559. It holds in V(A_p) for every semisimple A and every p at rational coefficients;
- `fundamentalLinePadicComparison_artin`: for Artin motives it is Huber–Kings Definition 1.2.7;
- `fundamentalLinePadicComparison_restrictScalars` and `fundamentalLinePadicComparison_extendCoefficients`: compatibility with restriction of scalars from K to ℚ (Shapiro's lemma for RΓ_c) and with extension of coefficients.

*Construction of the corrected duality square.* Write C_c for ordinary compact support and C̃_c for support using complete Tate cochains at real places. Derived global duality gives RΓ(T_p) → C̃_c(T_p^*(1))^*[−3]. Use actual cochain models to form

```text
C_AV(T_p) = Cone(C_c(T_p)[−1] → RΓ(T_p)[−1]
                      → C̃_c(T_p^*(1))^*[−4] → C_c(T_p^*(1))^*[−4]).
```

The determinant of this cone is d C_c(T_p) · d C_c(T_p^*(1))^*. The local/global cup-product square of §3.2, its finite-condition null homotopy, and the cone of ordinary → complete real cochains form the true nine-term diagrams of Burns–Flach (73), (80)–(81). After rationalizing they give θ′_p : Λ_p(S,V_p) ≅ Λ_p^AV(S,V_p); AV_p is the canonical determinant isomorphism from the defining cone triangle, with this latter object as its target. The Tate real complexes become acyclic, whereas ordinary real complexes retain V_p^+; their difference supplies the **full** Ind_K^ℚ V_p in Λ, not just its plus part. The determinant reordering of these diagrams gives precisely ε(S,p), not an unspecified sign. Finally compare this cone diagram with the dual regulator diagram using §3.2, Poincaré adjunction and (69). The true nine-term diagram (99) and Lemma 19 in Burns–Flach's proof of Lemma 17(b), pp. 561–566, give the asserted commuting square. Integral use of C_AV requires an order and a projective lattice with the perfectness/duality hypotheses of that source; this paragraph asserts the comparison rationally, so does not claim perfect ordinary ℤ₂ real cochains. The functional equation or equivalence of the two ETNCs requires the additional local obstruction statement of Burns–Flach Theorem 5.3, p. 556; it does not follow merely from this square.

*Needs:* §§2.6, 3.1–3.5; GeneralAlgebraicKTheory’s virtual determinant contract above; ArithmeticGaloisDuality §§D7.3 and D7.5; SelmerIwasawaCohomology §§2.21 and 2.23; MotivesAndAlgebraicCycles §2.7; PadicHodgeTheory §8.1; PeriodsAndSpecialValues PS.4.3–PS.4.4; TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1 (`detLine`, `detLine_shortExact`, `detLine_cone`, `detLine_baseChange`, `detLine_shift`, `detLine_acyclic`).

**Checks.**

- `fundamentalLinePadicComparison_identity_trivialization`: for [V --(1 − Fr_v⁻¹)--> V] in degrees 0, 1 with 1 − Fr_v⁻¹ invertible, ϑ_p uses the identity [V → V] ≅ 1; the acyclic trivialization differs by det(1 − Fr_v⁻¹ | V), so a definition using it changes ϑ_p by the local Euler factor.
- `fundamentalLinePadicComparison_euler_unit`: for V = ℚ, r = 1 − k with k = 2, and p = 3, the Euler factor at p is 1 − 3^{k−1} = −2, a 3-adic unit; in general ∏_{v|p}(1 − N(v)^{k−1}) ≡ 1 mod p for k ≥ 2.
- `fundamentalLinePadicComparison_euler_zero`: for V = ℚ and r = 0 at p, φ = 1 on D_cris(ℚ_p), so 1 − φ is not invertible and the acyclic trivialization does not exist, while the identity trivialization does; this is why the identity trivialization is the definition.
- `fundamentalLinePadicComparison_infinity_once`: for K = ℚ and V_p = ℚ_p(0), the third term of the compact-to-Selmer triangle contains exactly one ℚ_p[0] from infinity. Including infinity in the finite-place sum would add a second copy, changing its Euler characteristic by one.
- `fundamentalLinePadicComparison_zero_complex`: if every motivic and realization factor vanishes, both sides are the unit line and ϑ_p is the identity of ℚ_p.
- `fundamentalLinePadicComparison_not_any_iso`: an arbitrary isomorphism of the two one-dimensional spaces does not define the integral condition of Layer 4: multiplying it by p preserves rationality and changes the image lattice.
- `localPadicComparison_archimedean`: for the trivial ℚ_p-representation over ℚ, C_c → C̃_c has cone ℚ_p[0], whereas for ℚ_p(1) its cone is zero. Pairing the two dual twists supplies both the plus and minus summands of Ind_ℚ^ℚ V_p in the corrected cone construction. These computations hold at p = 2 after rationalization; they do not make ordinary integral real cochains perfect.
- `localPadicComparison_sign`: a single degree-one line in RΓ_/f contributes [−id] = −1 to ε(S,p), while a zero complex contributes 1 and two such lines contribute +1. Its sign is pinned by parity, not discarded after taking a determinant. Under A = M₂(ℚ), Morita equivalence sends the whole square to its scalar counterpart.

### Examples

For h⁰(F)(r), r ≥ 2, ϑ_p identifies d(K_{2r−1}(O_F) ⊗ ℚ_p)⁻¹ ⊗ d(B⁺ ⊗ ℚ_p)⁻¹ ⊗ d(t_M ⊗ ℚ_p) with d RΓ_c(O_{F,S_p}, ℚ_p(r)) through Soulé's isomorphism, the vanishing of H², the de Rham comparison t_M ⊗ ℚ_p = F ⊗ ℚ_p and the Euler factors at S_p. For h¹(E)(1) with Sha[p^∞] finite, ϑ_p is built from the Kummer isomorphism and the self-duality of V_pE.

### Dependencies

Layers 1–2; GeneralAlgebraicKTheory’s virtual determinant supplier contract; CrystallineCohomology §§5–6; SchemeAndStackFoundations SF.4e; PadicHodgeTheory §§3.1, 3.4–3.5, 5.3 and 8.1; MotivicEtaleKTheory §§9.3, 10.1–10.2, 10.4–10.5, 11.3, 11.5, 12.1, 12.6 and 12.8; ArithmeticKTheory §§3.2–3.3; PadicHodgeTheory §8.1; SelmerIwasawaCohomology §§1.4, 2.9, 2.12, 2.16, 2.19, 2.21, 2.23, 4.9 and 4.26; ArithmeticGaloisDuality §§D7.3–D7.6; PeriodsAndSpecialValues PS.4.3–PS.4.4; MotivesAndAlgebraicCycles §§2.4 and 2.7; BorelRegulators §3.12; TauCetiRoadmap EllipticCurves Layer 7; TauCetiRoadmap EtaleCohomologyFoundations F.1, F.2.1–F.2.2, F.4.2 and F.4.5; TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1; Tau Ceti `TauCeti.kummerMap`.

## Layer 4: zeta elements, the Tamagawa condition and its proved cases

This layer joins ϑ_∞ and ϑ_p. For a K-theoretic motive whose comparison hypotheses hold, the leading coefficient of its L-function determines an element δ(M) of Ξ ⊗ ℝ; the Tamagawa condition asks that δ(M) be rational and that its p-adic image generate the integral determinant of compactly supported cohomology. The condition is the instance, at the comparisons of Layers 2–3, of the rationality and integrality predicates of PeriodsAndSpecialValues PS.3–PS.5; this layer proves its standard reformulations, the class number formula case and its equivalence with the cohomological Lichtenbaum formula, and assembles the elliptic data used for the Birch–Swinnerton-Dyer formula.

### 4.1 The Tamagawa condition

Let M be a K-theoretic motive datum over ℚ (restricting scalars from K if necessary) with coefficients in a number field E, O = O_E, O_p = O ⊗ ℤ_p and E_p = E ⊗ ℚ_p, with RealExactness M and PadicRealizationIso M p, and let L*(M, 0) ∈ (E ⊗ ℝ)^× be the leading coefficient at s = 0 of its finite L-function, defined by PeriodsAndSpecialValues PS.3.3 (`leadingCoeff`) from a nonzero meromorphic germ of L(M, s) at s = 0, supplied as a hypothesis unless a theorem provides the meromorphic extension (for h⁰(F)(r), the completed Dedekind zeta function of BorelRegulators §5.1; for h¹(E)(1), as in PeriodsAndSpecialValues PS.6.3). Define:

- `tamagawaElement` δ(M) ∈ Ξ_E(M) ⊗ ℝ, the unique element with ϑ_∞(M)(L*(M, 0)·δ(M)) = 1, that is, the element θ_∞⁻¹((L*)⁻¹) of PeriodsAndSpecialValues PS.3.3 for θ_∞ = ϑ_∞(M);
- `TamagawaCondition M T_p p`, for a G_ℚ-stable O_p-lattice T_p ⊂ V_p, as the conjunction of PeriodsAndSpecialValues PS.3.3's `LeadingTermRational M` for θ_∞ = ϑ_∞(M), and the equality

```text
I_p(M, T_p, S) = O_p · δ(M)       inside Ξ_E(M) ⊗ E_p,
```

where I_p(M, T_p, S) = ϑ_p(M, S)⁻¹(d_{O_p} RΓ_c(O_{K,S_p}, T_p)) is PeriodsAndSpecialValues PS.4.1's `integralLattice` formed with θ_p = ϑ_p(M, S) of §3.6. Equivalently, δ(M) lies in Ξ_E(M) and `Submodule.span O_p {ϑ_p(M, S)(δ(M))} = d_{O_p} RΓ_c(O_{K,S_p}, T_p)`.

(Kato 2003, §2.1, (2.1.1)–(2.1.5) and (a)–(d), pp. 166–168; Huber–Kings Definition 1.2.1 and Conjecture 1.2.8, pp. 7 and 10; Fontaine §6, pp. 218–224, and §7, pp. 224–226.) Integral statements are made for p odd, or for K without real places, as in PeriodsAndSpecialValues PS.4.4. The integral clause is generation of a lattice, stated with Mathlib's `Submodule.span`; a rational basis need not generate it.

Its API is:

- `tamagawaElement_unique`: δ(M) is well defined, because Ξ_E(M) ⊗ ℝ is free of rank one over E ⊗ ℝ and ϑ_∞ is an isomorphism (§2.6);
- `tamagawaCondition_iff_kato`: TamagawaCondition M T_p p ↔ there is an E-basis ζ(M) of Kato's line Δ_E(M) = Ξ_E(M)⁻¹ whose real image is L*(M, 0) and whose p-adic image is an O_p-basis of d⁻¹_{O_p} RΓ_c(O_{K,S_p}, T_p) = Δ_p(T_p), the integral inverse determinant of MotivicEtaleKTheory §12.7 (`arithmeticDeterminantLine`); then ζ(M) = δ(M)^{⊗(−1)};
- `tamagawaCondition_rational`: TamagawaCondition M T_p p → LeadingTermRational M;
- `tamagawaCondition_unit_invariant`: replacing L*(M, 0) by u·L*(M, 0) with u ∈ E^× ∩ O_p^× gives an equivalent integral clause at p;
- `tamagawaCondition_extendCoefficients`: for a finite extension E′/E, the condition for M ⊗_E E′ is equivalent to the condition for M, because O′_p is faithfully flat over O_p and span{x} ⊗ O′_p = span{x ⊗ 1};
- `tamagawaCondition_directSum`: with coefficients E × E′ for M ⊕ M′ (each summand keeping its own coefficient field), the condition is the conjunction of the conditions for M and M′; with a common coefficient field E acting diagonally, the conjunction implies the condition for M ⊕ M′, and the converse fails.

*Needs:* §§2.6 and 3.6; PeriodsAndSpecialValues PS.3.1, PS.3.3, PS.4.1 and PS.4.4; MotivicEtaleKTheory §12.7; Mathlib `Submodule.span`, `PadicInt`.

**Checks.**

- `tamagawaCondition_rational_not_integral`: in the line ℚ_p with lattice ℤ_p, the element p is a rational basis but `Submodule.span ℤ_p {p} ≠ Submodule.span ℤ_p {1}`; of δ and pδ, both rational, at most one satisfies the integral clause.
- `tamagawaCondition_two_term`: for C = [ℤ_p --p^s--> ℤ_p] in degrees 0 and 1, the acyclic trivialization of TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1 sends d C to p^s ℤ_p and the inverse line d⁻¹ C to p^{−s} ℤ_p, of valuation −s = −length H¹(C); this fixes the inversion convention of `tamagawaCondition_iff_kato`.
- `tamagawaCondition_zero_complex`: if RΓ_c(O_{K,S_p}, T_p) is acyclic with zero cohomology, its determinant lattice is O_p and the integral clause asks that ϑ_p(δ) be a unit of O_p.
- `tamagawaCondition_riemann_zero`: for ℚ(0) over ℚ, Ξ = d(ℚ) ⊗ d(ℚ)⁻¹ (H⁰_f and B⁺), ϑ_∞ is the identity on the generator 1 ⊗ 1⁻¹, and L* = ζ(0) = −1/2, so δ = −2·(1 ⊗ 1⁻¹); at odd p the factor −2 is a unit and the integral clause concerns ϑ_p(1 ⊗ 1⁻¹) alone (proved in §4.4), while at p = 2 the factor is visible.
- `tamagawaCondition_directSum_diagonal`: with E = ℚ acting diagonally on M ⊕ M′ and both lines equal to ℚ_p with lattice ℤ_p, the elements δ = p and δ′ = p⁻¹ fail their separate integral clauses although δ ⊗ δ′ = 1 generates ℤ_p.

### 4.2 Comparison with the Tamagawa obstruction

Prove `tamagawaCondition_iff_etnc`: let M be a K-theoretic motive datum with commutative coefficients E, O = O_E, Σ a nonempty set of odd primes, and suppose RealExactness M and PadicRealizationIso M p for every p ∈ Σ, with the leading term supplied. Take θ_∞ = ϑ_∞(M) and θ_p = ϑ_p(M, S) in PeriodsAndSpecialValues PS.4.1 and PS.5.1. Then TamagawaCondition M T_p p holds for every p ∈ Σ if and only if the Tamagawa obstruction TΩ(M, O) of PS.5.1 is rational (PS.5.2(iii)) and its p-components vanish for every p ∈ Σ, that is, θ_∞ carries the λ-adic lattice I_p(M, T_p, S) onto (L*)⁻¹·O_p for each p ∈ Σ (`tamagawaObstruction_commutative`); for Σ the set of all odd primes this is the integrality PS.5.2(iv) over O[1/2], and it is equivalent to the Fukaya–Kato orientation of PS.5.3 (`zetaIso_iff_tamagawaObstruction`) with these comparisons (Burns–Flach §4.3, Conjecture 4 and the remarks following it, pp. 535–537; Huber–Kings Proposition 1.2.9(b), p. 10, and §1.5, Conjecture 1.5.2, pp. 14–15). *Proof route.* In the commutative case the relative class of PS.5.1 at p compares the lattices θ_∞⁻¹((L*)⁻¹)·O_p and I_p(M, T_p, S) = θ_p⁻¹(d_{O_p} RΓ_c(T_p)); generation of the lattice by θ_p(δ) is equality of these lattices. Under rationality, TΩ lies in Cl(O, ℚ) ≅ ⊕_p K₁(E_p)/K₁(O_p) (PS.5.1, `finiteBoundaryGluing`), so its vanishing away from 2 is the vanishing of its p-components for odd p. For the orientation apply PS.5.3 with Δ = Ξ⁻¹. *Needs:* §4.1; PeriodsAndSpecialValues PS.4.1 and PS.5.1–PS.5.3.

**Checks.**

- The nonempty hypothesis is necessary: for Σ = ∅ the prime-by-prime condition is vacuous and cannot imply leading-term rationality. With empty Σ the equivalence instead retains rationality explicitly on both sides.
- For E = ℚ the statement is an equality of ℤ_p-lattices in a ℚ_p-line, one odd prime at a time; for Σ = {3} it says nothing at 5.
- A nonzero rational relative class with nonzero 3-component satisfies rationality and fails the condition at 3.
- Changing θ_p by a factor p changes I_p by p⁻¹ and the obstruction's p-component by one; the comparisons of Layers 2–3 are part of the statement.

### 4.3 Lattice, place-set, duality and Selmer forms

Prove `tamagawaCondition_alternative_forms`, under the hypotheses of §4.1:

1. TamagawaCondition M T_p p does not depend on the Galois-stable lattice T_p, nor on the finite set S containing the bad places;
2. for p odd, the integral structures d RΓ_c(O_{K,S_p},T_p) · d(T_p^+) and d RΓ(O_{K,S_p},T_p^∨(1)) agree under the corrected duality below, where T_p^+ = ⊕_{v|∞} T_p^{G_v}; hence the condition has Kato’s formulation using the global dual complex and this specified archimedean correction. At p = 2 with real places the integral replacement is the separate modified construction and comparison of PeriodsAndSpecialValues PS.4.4; no formula replacing only T_p^+ by its zeroth Tate group is asserted;
3. with the Selmer mapping fibre C_f(T_p) and local conditions U_v^+ (v ∈ S_p), MotivicEtaleKTheory's formula det⁻¹ C_f ≅ det⁻¹ C_c ⊗ ⊗_v det⁻¹ U_v^+ (§12.7, `selmerLocalDeterminant`) and the local Euler and Tamagawa identifications of PeriodsAndSpecialValues PS.4.3 turn the condition into: ϑ_p(δ), tensored with the generators of the lattices d U_v^+ given by their local identifications, generates d_{O_p} C_f(T_p). This is the local correction in the Tate and elliptic Tamagawa statements.

(Huber–Kings Propositions 1.2.9 and 1.2.10 with the following remarks, pp. 10–11; Burns–Flach §3.4, Lemma 5, pp. 526–528; Kato 2003, §1.2, p. 165, and §2.1, pp. 166–167.) *Proof route.* (1) For T′ ⊂ T the quotient Q is finite and the compactly supported Euler characteristic of Q is 1, by Tate's global and local Euler characteristic formulas (ArithmeticGaloisDuality §§R02.4.2 and R02.4.4), so the two determinant lattices agree (PeriodsAndSpecialValues PS.4.2, `detLattice_latticeChange`); for S ⊂ S′ use the localization triangle with RΓ(k_w, T^{I_w}) and `fundamentalLinePadicComparison_enlargeS`. (2) At odd p the complete Tate real complexes are acyclic integrally. The ordinary-to-modified comparison is the specified triangle C_c(T_p) → C̃_c(T_p) → T_p^+[0], so d C_c(T_p) · d T_p^+ = d C̃_c(T_p). Derived Poitou–Tate gives C̃_c(T_p) ≅ RHom(RΓ(T_p^∨(1)),O_p)[−3]; dualization and the odd shift cancel the determinant inversion over these commutative coefficients, yielding the displayed equality. This uses actual cones and perfect complexes (ArithmeticGaloisDuality §D7.5), rather than an unspecified isomorphism up to an archimedean term. (3) Apply `selmerLocalDeterminant` to the triangle C_c → C_f → ⊕_v U_v^+ and PS.4.3 to identify each det⁻¹ U_v^+. *Needs:* §§3.6 and 4.1; ArithmeticGaloisDuality §§R02.4.2, R02.4.4 and D7.5; PeriodsAndSpecialValues PS.4.2–PS.4.4; MotivicEtaleKTheory §12.7.

**Checks.**

- For T′ = pT the lattices d RΓ_c(T′) and d RΓ_c(T) coincide, although every cohomology group changes.
- With every U_v^+ = 0 the Selmer form is the compact-support form.
- For a finite ℤ_p-module Q of order p^a, d(Q[0]) = p^{−a}ℤ_p when Q sits in degree 0 and d(Q[−1]) = p^{a}ℤ_p when it sits in degree 1: the degree of the finite term fixes the sign of its contribution.
- For T_p = ℤ_p over ℚ and odd p, C_c and C̃_c differ by exactly one ℤ_p[0] in the displayed triangle; for T_p = ℤ_p(1) the correction is zero. At p = 2 and trivial real action the positive even real cohomology groups persist, so the odd-prime integral argument does not apply.

### 4.4 The class number formula case

Prove `dedekindZeta_leadingCoeff_zero`: for every number field F, ζ_F has a zero of order r₁ + r₂ − 1 at s = 0, with leading coefficient ζ_F^*(0) = −h_F R_F/w_F, where h_F = `NumberField.classNumber F`, R_F = `NumberField.Units.regulator F` and w_F = `NumberField.Units.torsionOrder F`. *Proof route.* The completed function Λ_F(s) = |d_F|^{s/2} Γ_ℝ(s)^{r₁} Γ_ℂ(s)^{r₂} ζ_F(s) satisfies Λ_F(s) = Λ_F(1 − s) (BorelRegulators §5.1, `completedZeta_convention`, for the functional equation supplied by the trivial-character interface); at s = 1, Γ_ℝ(1) = 1 and Γ_ℂ(1) = π⁻¹, so the residue 2^{r₁}(2π)^{r₂}h_F R_F/(w_F √|d_F|) of ζ_F (Mathlib `NumberField.dedekindZeta_residue`, `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`) gives Λ_F(s) ∼ 2^{r₁+r₂}h_F R_F/(w_F(s − 1)); at s = 0, Γ_ℝ(s) and Γ_ℂ(s) are both ∼ 2/s, so Λ_F(s) ∼ 2^{r₁+r₂}s^{−r₁−r₂}ζ_F(s); compare through the functional equation, with the normalized leading coefficient of BorelRegulators §5.3 (`normalizedLeadingCoefficient_factor`). *Needs:* BorelRegulators §§5.1 and 5.3; Mathlib `NumberField.dedekindZeta_residue`, `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`, `NumberField.classNumber`, `NumberField.Units.regulator`, `NumberField.Units.torsionOrder`, `Complex.Gamma`.

In the variable of the twisted motive h⁰(F)(1), whose L-function is ζ_F(s + 1), the leading coefficient at s = 0 is the residue of ζ_F at s = 1; record this as `tendsto_mul_dedekindZeta_one_add` (s · ζ_F(1 + s) tends to `NumberField.dedekindZeta_residue F` as s → 0⁺ along the reals), the reindexing of Mathlib's `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`.

Prove `tamagawaCondition_classNumber`: for every number field F and every odd prime p, TamagawaCondition(h⁰(F), ℤ_p, p) and TamagawaCondition(h⁰(F)(1), ℤ_p(1), p) hold (Huber–Kings Proposition 2.3.1 with its proof and Proposition 2.3.2, pp. 18–21; Fontaine §8.3(a)–(b), pp. 228–229). *Proof route.* In twist 0 the line is d(ℚ) ⊗ d(O_F^× ⊗ ℚ)⁻¹ ⊗ d(T_B^+ ⊗ ℚ)⁻¹ (§§1.3–1.4); with R_∞(F) the covolume of the unit lattice together with a section of the sum map (Mathlib's R_F), §2.4 gives δ = (R_∞(F)/ζ_F^*(0)) times the integral generator det ℤ ⊗ det⁻¹ O_F^{×,free} ⊗ det⁻¹ T_B^+, and `dedekindZeta_leadingCoeff_zero` turns this into det Cl(O_F) ⊗ det ℤ ⊗ det⁻¹ O_F^× ⊗ det⁻¹ T_B^+. The integral clause follows from the Poitou–Tate sequence

```text
0 → O_F^× ⊗ ℤ_p → H¹(O_F[1/p], ℤ_p(1)) → H¹_{/f}(F ⊗ ℚ_p, ℤ_p(1)) → Cl(O_F) ⊗ ℤ_p
  → H²(O_F[1/p], ℤ_p(1)) → H²(F ⊗ ℚ_p, ℤ_p(1)) → H⁰(O_F[1/p], ℚ_p/ℤ_p)^* → 0
```

(ArithmeticGaloisDuality §D7.6, Poitou–Tate for lattice coefficients), the duality form of §4.3(2), and the identification of det⁻¹ RΓ_{/f}(F ⊗ ℚ_p, ℤ_p(1)) with ℤ_p under local duality and the identity trivialization (Huber–Kings Proposition 2.3.2(b)). In twist 1 the condition follows from twist 0 through the compatibility of §2.6 and §3.6 with duality (`fundamentalLineRealComparison_dual`, `fundamentalLinePadicComparison_dual`): the functional equation gives ζ_F^*(0)/ζ_F^*(1) = ±√|d_F|/(2^{r₁}(2π)^{r₂}), which is the discrepancy between the de Rham lattice O_F and the Betti lattices; and at each v | p the lattices det O_{F_v} ⊗ ℤ_p and det⁻¹ RΓ_f(F_v, ℤ_p(1)) differ by the factor 1 − q_v⁻¹, whose p-adic valuation −v_p(q_v) is that of the generalized index of exp_p(O_{F_v}) in O_{F_v}^× ⊗ ℤ_p (q_v − 1 being prime to p), which is the Euler factor of `fundamentalLinePadicComparison_eulerFactor`. *Needs:* §§2.4, 2.6, 3.3, 3.6, 4.1 and 4.3; ArithmeticGaloisDuality §D7.6; BorelRegulators §§5.1 and 5.3; Mathlib's analytic class number formula and the invariants above.

**Checks.**

- For F = ℚ in twist 0, ζ(0) = −1/2 with h = R = 1 and w = 2, so ζ_ℚ^*(0) = −hR/w; the order r₁ + r₂ − 1 is 0, and the condition at odd p is v_p(1/2) = 0.
- For F real quadratic, the order of ζ_F at 0 is 1 and ζ_F^*(0) = −h_F R_F/2; the value ζ_F(0) is 0, so a formula with the value in place of the leading coefficient fails.
- For F real quadratic in twist 1, L* = 2h_F R_F/√d_F and δ = ±(2h_F)⁻¹ times the integral generator of `fundamentalLineRealComparison_real_quadratic`; the integral clause at odd p reduces to v_p(h_F) = v_p(#(Cl(O_F) ⊗ ℤ_p)).
- The prime 2 is excluded: w_F and the archimedean Tate cohomology contribute powers of 2 (for F = ℚ, the factor 2 of ζ(0) = −1/2).

### 4.5 The cohomological Lichtenbaum form

Let F be a number field, k ≥ 2 and p an odd prime. For a full ℤ-lattice Ω ⊂ H¹_f(h⁰(F)(k)) = K_{2k−1}(O_F) ⊗ ℚ, let R_Ω(F) be the covolume of r_B(Ω) in V_B(k − 1)^+_ℝ relative to the integral Betti lattice T_B(k − 1)^+, which is the reference lattice c_k⁻¹(ℤ^{I_k}) of BorelRegulators §4.2 (R_Ω = 1 when the rank is 0), and let

```text
ι_p(Ω) = [H¹(O_F[1/p], ℤ_p(k))_free : c¹_p(Ω ⊗ ℤ_p)]
```

be the generalized index in H¹(O_F[1/p], ℚ_p(k)) of the image of Ω under the p-adic realization of §3.1 (a power of p, defined because c¹_p ⊗ ℚ_p is an isomorphism by §3.3). Prove `tamagawaCondition_iff_lichtenbaum`: TamagawaCondition(h⁰(F)(1 − k), ℤ_p(1 − k), p) holds if and only if

```text
v_p(ζ_F^*(1 − k)/R_Ω(F)) = v_p(#H²(O_F[1/p], ℤ_p(k))) − v_p(#H¹(O_F[1/p], ℤ_p(k))_tors) − v_p(ι_p(Ω)),
```

where ζ_F^*(1 − k)/R_Ω(F) ∈ ℚ^× by BorelRegulators §7.2 (`borelRegulator_zetaProportional`) with §8.4 and the rationality of the index of two lattices. *Proof route.* Ξ(h⁰(F)(1 − k)) = det⁻¹ H¹_f(h⁰(F)(k)) ⊗ det⁻¹ T_B(1 − k)^+ (§§1.3–1.4); by `fundamentalLineRealComparison_artin`, δ_ℤ = ±(R_Ω/ζ_F^*(1 − k)) times the generator det⁻¹Ω ⊗ det⁻¹T_B(1 − k)^+; RΓ_f(ℤ[1/p], V_p(1 − k)) ≅ H¹(ℤ[1/p], V_p^∨(k))^∨[−2] (§3.5(3)); the Euler factor ∏_{v|p}(1 − N(v)^{k−1}) is a p-adic unit (`fundamentalLinePadicComparison_euler_unit`); the duality form §4.3(2) turns the condition into (R_Ω/ζ^*)·ℤ_p = det c¹_p(Ω ⊗ ℤ_p) ⊗ det⁻¹ H¹(O_F[1/p], ℤ_p(k)) ⊗ det H²(O_F[1/p], ℤ_p(k)); and a finite ℤ_p-module of order h in degree zero has determinant h⁻¹ℤ_p. Each step is an equality of lattices, so the equivalence holds in both directions (Huber–Kings Theorem 1.4.1 and its proof, pp. 13–14, which state the implication for the K-theory lattice). *Needs:* §§2.6, 3.3, 3.5, 3.6, 4.1 and 4.3; BorelRegulators §§7.2 and 8.4.

Prove the two lattice specializations:

- `tamagawaCondition_iff_lichtenbaum_motivic`: for Ω^M the torsion-free quotient of the integral motivic group H¹_M(O_F, ℤ(k)) (MotivicEtaleKTheory §12.3, `integralMotivicLatticeCandidate`, for the model Spec O_F), ι_p(Ω^M) = 1 at every odd p, by `padicRealization_numberRing` (H¹_M(O_F, ℤ(k)) = H¹_M(O_F[1/p], ℤ(k)) for k ≥ 2 by localization, MotivicEtaleKTheory §4.3), which is also the comparison through which SpecialValuesBirchTate §8.1 computes `rank_motivicH1` and `card_torsion_motivicH1`. Hence TamagawaCondition(h⁰(F)(1 − k), ℤ_p(1 − k), p) for every odd p is equivalent to the odd part of SpecialValuesBirchTate §8.2's `MotivicLichtenbaumFormula F k`, |ζ_F^*(1 − k)| = h_k(F)/#H¹_M(O_F, ℤ(k))_tors · R_k^M(F), with h_k(F) = SpecialValuesBirchTate §8.1's `hInvariant F k` (whose p-adic valuation is that of #H²(O_F[1/p], ℤ_p(k)) by `padicValNat_hInvariant`) and R_k^M(F) = `motivicRegulatorCovolume F k`;
- `tamagawaCondition_iff_lichtenbaum_K`: for Ω^K = K_{2k−1}(O_F)/tors and **every odd prime p**, ι_p(Ω^K) = 1. Consequently the K-theory regulator R_k(F) = R_{Ω^K}(F) satisfies exactly Huber–Kings Theorem 1.4.1’s cohomological formula, with no prime bound and no index term for this lattice. An index term remains necessary for an arbitrary Ω.

*Integral normalization proof.* Use the supplier's Quillen–Lichtenbaum map to étale K-theory, and its finite coefficient versions compatible in r. The étale K-theory sheaves are ℤ/p^r(k) in degree 2k, zero in odd degrees. The Bott element associated to ζ ∈ μ_(p^r) is normalized by its Kummer Bockstein ζ, so its coefficient is +1; finite-level first Chern classes and Bott products fix the twist identification. At p = 3 one may use r ≥ 2 as a cofinal subsystem for multiplicative Bott representatives; the compatible additive comparison is defined at every r. For k ≥ 2, the column-one edge is the entire odd-degree abutment because the other columns have cohomological degree outside 0,1,2. Derived inverse limits and finite generation give the isomorphism e_(k,p) of §3.1; no division by (k−1)! has been made. Use MotivicEtaleKTheory §10.4 for arbitrary number fields. Feng–Galatius–Venkatesh §§2.5–2.7, Proposition 2.9 and Lemmas 2.10–2.11, pp. 10–14, especially (2.7), give the Bott normalization and this spectral-sequence argument for the rational and cyclotomic number rings; the same argument applies over O_F[1/p] using its cohomological dimension 2 and the supplied general Quillen–Lichtenbaum theorem.

To identify its rationalization, use the first Chern class on line bundles, Bott compatibility, and the projective-bundle splitting principle to identify the rational étale K-spectrum decomposition with the Newton Chern character, term by term in twist k. MotivicEtaleKTheory §§9.3 and 12.1 identify this character with the motivic realization used in c¹_p. Equivalently, the ordinary positive-degree Chern class satisfies c_{k,2k−1} = (−1)^{k−1}(k−1)! · (e_(k,p) ⊗ ℚ_p), not e_(k,p) = c_{k,2k−1}. This is the stable étale edge normalization used for the integral regulator in the proof of Huber–Kings Theorem 1.4.1, p. 14. The proof of Feng–Galatius–Venkatesh Corollary 2.12, p. 14, identifies the edge on line bundles with c₁, compatibly with Bott products. Their Remark 2.13, p. 15, explicitly distinguishes this identification from merely proving that an unspecified map is an isomorphism. The rational identity is proved from the spectrum map with that normalization, rather than inferred from surjectivity of a differently normalized Chern class.

Localization identifies K_{2k−1}(O_F) and K_{2k−1}(O_F[1/p]) after p-completion for k ≥ 2: the positive K-groups of residue fields of characteristic p have orders prime to p and their even groups vanish. The map K_{2k−1}(O_F) → K_{2k−1}(F) is surjective with torsion kernel, so it also identifies their **free quotients**; equality of the whole integral groups is unnecessary and is not asserted. It follows that c¹_p(Ω^K ⊗ ℤ_p) is exactly H¹(O_F[1/p],ℤ_p(k))_free inside H¹(O_F[1/p],ℚ_p(k)), for every odd p. This proves ι_p(Ω^K) = 1 without replacing the regulator lattice by a rescaled one. It does not choose a splitting of the torsion subgroup of H¹.

**Checks.**

- For F = ℚ and k = 2: ζ(−1) = −1/12, the rank is 0 so R = 1 and ι_p = 1, H²(ℤ[1/p], ℤ_p(2)) is the p-part of K₂(ℤ) = ℤ/2 (trivial at odd p) and H¹(ℤ[1/p], ℤ_p(2))_tors is the p-part of w₂(ℚ) = 24; at p = 3 both sides equal −1, at p ≥ 5 both are 0.
- For F totally real and k even the rank r₂ is zero, R_Ω = 1 and ι_p = 1, and the formula is v_p(ζ_F(1 − k)) = v_p(#H²) − v_p(#H¹_tors) at odd p, the valuation form of SpecialValuesBirchTate §8.3.
- `lichtenbaum_index_term`: replacing Ω by pΩ multiplies R_Ω by p^{r} (r the rank) and ι_p by p^{r}, and both sides of the identity change by −r; dropping the index term would make the statement depend on the lattice.
- `lichtenbaum_chern_normalization`: for F = ℚ, k = 5 (rank one) and p = 3, ch₅(Ω^K ⊗ ℤ₃) is the full free H¹ lattice, while c_{5,9}(Ω^K ⊗ ℤ₃) = 24·ch₅(Ω^K ⊗ ℤ₃) has relative index 3 and v₃(24) = 1. The normalized K-theory lattice still has ι₃ = 1. Confusing the ordinary Chern class with the stable edge would incorrectly insert a 3 in Huber–Kings’s formula.

### 4.6 The elliptic data

State `ellipticFundamentalLine_data`: for an elliptic curve E over ℚ and an odd prime p with Sha(E/ℚ)[p^∞] finite, the data of §§1.5, 2.5 and 3.4 are the regulator, Kummer and Tamagawa identifications assumed by PeriodsAndSpecialValues PS.6.3: H¹_f = E(ℚ) ⊗ ℚ with δ the inverse of the Néron–Tate adjoint, α_M the real period isomorphism, and ϑ_p built from the Kummer isomorphism E(ℚ) ⊗ ℚ_p ≅ H¹_f(ℚ, V_pE). Hence TamagawaCondition(h¹(E)(1), T_pE, p) is equivalent to the p-part of the Birch–Swinnerton-Dyer formula, by PeriodsAndSpecialValues PS.6.3 (`ellipticFundamentalLine_iff_bsd`), and its prime-by-prime transport is PS.6.4 (Fontaine §8.3(d), p. 230; Bloch–Kato Proposition 5.4, pp. 370–371). The analytic leading term of L(E, s) at s = 1 is a hypothesis of PS.6.3 unless a separate theorem supplies it, and so it is here. *Needs:* §§1.5, 2.5, 3.4 and 4.1; PeriodsAndSpecialValues PS.6.3–PS.6.4.

**Checks.**

- For rank zero with L(E, 1) ≠ 0 the statement is the p-part of L(E, 1)/Ω_E = #Sha · ∏_ℓ c_ℓ/#E(ℚ)_tors².
- Replacing a generator P by 3P in rank one multiplies the height determinant by 9, and the index correction of PS.6.3 restores the formula; the condition itself, being independent of lattices, does not change.
- At p = 2 nothing is claimed: PeriodsAndSpecialValues PS.4.4 applies.

### Examples

The Riemann zeta function: for ℚ(0) and ℚ(1) over ℚ the condition is the identity ζ(0) = −1/2 at odd primes and the residue 1 of ζ at s = 1. For ℚ(−1), ζ(−1) = −1/12, and the cohomological form compares 1/12 with #H²/#H¹_tors = 2/24 away from 2. For F = ℚ(√5) and k = 2, ζ_F(−1) = 1/30, which SpecialValuesBirchTate's examples compare with h₂/w₂ = 4/120.

### Dependencies

Layers 1–3; GeneralAlgebraicKTheory’s virtual determinant supplier contract; PeriodsAndSpecialValues PS.3–PS.6; MotivicEtaleKTheory §§4.3, 10.4–10.5, 12.3, 12.7 and 12.8; SpecialValuesBirchTate §§8.1–8.3; BorelRegulators §§4.2, 5.1, 5.3, 7.2 and 8.4; ArithmeticGaloisDuality §§R02.4.2, R02.4.4, D7.5 and D7.6; Mathlib's class number formula.

## Downstream consumers

Roadmaps that prove further cases of the Tamagawa number conjecture for K-theoretic motives — the Iwasawa-theoretic proof for abelian Artin motives, through the main conjecture and the cyclotomic elements, and Euler-system arguments for elliptic curves — state their conclusions in the form of §4.1, with the comparisons ϑ_∞ and ϑ_p of Layers 2–3 and the reformulations of §4.3. Roadmaps on special values of Artin L-functions at negative integers use the Lichtenbaum form of §4.5 with its lattice-index term.

## References

Page numbers are the printed page numbers of the published sources; Huber–Kings, Levine, Scholl and Feng–Galatius–Venkatesh use the page numbers of the linked preprints, and Kato uses the printed proceedings pages carried by arXiv:math/0304233v1.

- D. Burns and M. Flach, [*Tamagawa numbers for motives with (non-commutative) coefficients*](https://ems.press/content/serial-article-files/25892?nt=1), Documenta Mathematica **6** (2001), 501–570. §3.1, pp. 517–518 (motivic structures and the motivic cohomology of h^n(X)(r)); §3.2, pp. 519–523 (the Deligne complex (16), Conjecture 1 and (17), the local complexes (18)–(24), the nine-term diagram (26), Conjecture 2 and (27), the archimedean identification (28)); §3.3, pp. 523–526; §3.4, pp. 526–529 (the line Ξ(M), (29), Lemma 5, the comparisons ϑ_∞ and ϑ_p); §4.3, pp. 535–537 (Conjecture 4 and the following remarks); §§2.1–2.5, pp. 504–509 (virtual objects, determinant functors and true nine-term coherence); §5.1, (53)–(82), pp. 544–553 (local virtual object and its corrected comparisons); Theorem 5.3, p. 556; Lemmas 17–19 and (95), (99), pp. 558–566 (general duality comparison).
- K. Kato, [*Tamagawa number conjecture for zeta values*](https://arxiv.org/abs/math/0304233), Proceedings of the ICM 2002, Vol. II, 163–171; arXiv:math/0304233v1. §1.2, p. 165; §2.1, (2.1.1)–(2.1.5) and (a)–(d), pp. 166–168.
- A. Huber and G. Kings, [*Bloch–Kato conjecture and Main Conjecture of Iwasawa theory for Dirichlet characters*](https://arxiv.org/abs/math/0101071), Duke Mathematical Journal **119** (2003), 393–464; arXiv:math/0101071v2. §1.1, pp. 3–6; Definitions 1.2.1–1.2.2 and Proposition 1.2.3, p. 7; Definition 1.2.4 and Proposition 1.2.5, p. 8; Lemma 1.2.6 and Definition 1.2.7, p. 9; Conjecture 1.2.8 and Proposition 1.2.9, p. 10; Proposition 1.2.10, p. 11; Theorem 1.4.1 and its proof, pp. 13–14; §1.5, Conjecture 1.5.2, pp. 14–15; §2.2, pp. 17–18 (Δ_loc, Proposition 2.2.3); Propositions 2.3.1–2.3.2 with the proof, pp. 18–21.
- J.-M. Fontaine, [*Valeurs spéciales des fonctions L des motifs*](http://www.numdam.org/item/SB_1991-1992__34__205_0/), Séminaire Bourbaki exposé 751, Astérisque **206** (1992), 205–249: the formulation of Fontaine and Perrin-Riou. §6, pp. 218–224; §7, pp. 224–226; §8, pp. 226–230; §9, pp. 230–234.
- S. Bloch and K. Kato, [*L-functions and Tamagawa numbers of motives*](https://math.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf), The Grothendieck Festschrift I, Progress in Mathematics **86** (1990), 333–400. Proposition 3.8 and Corollary 3.8.4, pp. 354–355; Example 3.9, p. 359; Definition 5.1, p. 369; (5.2), Conjecture 5.3 and Proposition 5.4, pp. 370–371.
- M. Levine, [*K-theory and motivic cohomology of schemes, I*](https://www.esaga.uni-due.de/f/marc.levine/publ/KthyMotI12.01.pdf), author preprint. §1.5 and Theorem 1.6, pp. 6–7; §§2.2–2.3; Theorem 12.12; Theorem 14.7, pp. 73–74: the cycle-sheaf convention, arithmetic coniveau construction, Adams operations and rational comparison for regular schemes over a regular base of dimension at most one.
- A. J. Scholl, [*Integral elements in K-theory and products of modular curves*](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/k1.pdf), author preprint of the contribution to *The Arithmetic and Geometry of Algebraic Cycles*. Theorem 1.1.6 and Warning 1.1.7, p. 4; Lemma 1.2.5, p. 5; §1.3.3 and Corollary 1.3.4, p. 8: functorial rational integral parts and the regular proper flat model image.
- A. J. Scholl, [*Integral elements in K-theory and products of modular curves II*](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/int.pdf), author preprint. §2, diagram (3), pp. 5–6: the inclusion of higher-K model images in the unramified local condition away from p; the reverse equality is not used.
- J. Nekovář and W. Nizioł, [*Syntomic cohomology and p-adic regulators for varieties over p-adic fields*](https://msp.org/ant/2016/10-8/ant-v10-n8-p04-s.pdf), Algebra & Number Theory **10** (2016), 1695–1790. Remark 2.6, p. 1711; Proposition 3.20, pp. 1744–1746; Proposition 3.22, pp. 1749–1750; Theorem 4.8, pp. 1764–1769; Proposition 4.13, pp. 1770–1771; Proposition 5.6, pp. 1776–1777; Proposition 5.7, pp. 1777–1778; proof diagram of Theorem 5.9, p. 1779. These supply the rational syntomic adapter and its normalized étale edge compatibility.
- T. Feng, S. Galatius and A. Venkatesh, [*The Galois action on symplectic K-theory*](https://math.berkeley.edu/~fengt/Galois_action_on_KSp.pdf), author preprint. §§2.5–2.7, Proposition 2.9, Lemmas 2.10–2.11 and (2.7), pp. 10–14; Corollary 2.12 and Remark 2.13, pp. 14–15. Bott and first-Chern normalizations, étale K-descent and the single odd-degree edge; the general-number-field input here is MotivicEtaleKTheory §10.4.
