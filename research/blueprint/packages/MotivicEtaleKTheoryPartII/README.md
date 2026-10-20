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
- **TauCetiRoadmap EllipticCurves** Layers 0, 1, 2, 6 and 7 supply the Abel–Jacobi description of Pic⁰, isogenies, the Weil pairing, Mordell–Weil with the canonical height, its pairing and regulator, and Selmer groups with Sha. **TauCetiRoadmap EtaleCohomologyFoundations** F.1, F.2.1–F.2.2, F.4.2 and F.4.5 supply derived étale sheaves, proper and smooth base change and ℓ-adic realizations as limits. **TauCetiRoadmap PadicMeasuresIwasawaAlgebras** §5.1 supplies the graded determinant of perfect complexes over commutative rings.
- From Tau Ceti at the pin: the pure Hodge structures `TauCeti.Hodge.HodgeStructureOn` with their opposedness, the Kummer map `TauCeti.kummerMap` and the elliptic regulator `WeierstrassCurve.Affine.regulator`. From Mathlib at the pin: the unit theorem, the regulator, the class number, the torsion order, the discriminant, the infinite places, the Dedekind zeta function with its residue at s = 1, determinants, `Submodule.span` and `PadicInt`.

The general Burns–Flach line, the Tamagawa obstruction, the equivariant (noncommutative) Tamagawa number conjecture and the Bloch–Kato Tamagawa measure belong to PeriodsAndSpecialValues; the regulators, Chern classes and Δ_p(T) to MotivicEtaleKTheory; none is constructed here. The Iwasawa-theoretic theorems that prove the Tamagawa condition for abelian fields are not stated here. Membership of the image of the p-adic realization in the larger Bloch–Kato subspace H¹_g for general varieties, through syntomic regulators, is not used and is not stated; where membership in H¹_f is not proved here it is the hypothesis `PadicRealizationFinite`. The Beilinson–Bloch height pairing in weight −1 beyond elliptic curves is not constructed: it is a datum of the regulator sequence. The independence of the integral part of the regular model, and its definition without a regular model, are not used.

## Conventions

**Motives.** K is a number field, X a smooth projective K-scheme of pure dimension d, 𝒳 a regular proper flat O_K-model of X recorded with X, π an idempotent Chow correspondence whose realizations are concentrated in degree i, j ∈ ℤ, and M = h^i(X)(j). The weight is w = i − 2j. The dual datum is M*(1) = h^{2d−i}(X)(d + 1 − j), of weight −2 − w. A motive over K is identified with its restriction of scalars to ℚ whenever a formula is written over ℚ; the factors, realizations and L-function do not change.

**Coefficients.** The coefficient algebra A is a finite-dimensional semisimple ℚ-algebra acting through correspondences. Layer 2 allows any such A; Layers 3 and 4 take A commutative, a finite product of number fields, the case in which the graded determinant of TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1 and the perfectness of ArithmeticGaloisDuality §D7.3 apply; the noncommutative statement is PeriodsAndSpecialValues PS.5's. When A ≠ ℚ, the predicate `RegulatorsCommuteWithCoefficients` of §2.2 is a hypothesis of the A-linear statements; it is proved for Artin motives and for elliptic curves with coefficients acting through endomorphisms.

**Realizations.** H_v(M) = π·H^i(σX(ℂ), (2πi)^j ℚ) at the archimedean place v = v(σ); G_v acts through the infinity involution, the geometric involution combined with complex conjugation of the coefficients (2πi)^j, never through the conjugation of the lattice alone. B⁺(M) = ⊕_{v|∞} H_v(M)^{G_v}. The de Rham realization has its Hodge filtration shifted by j, and t_M = H_dR(M)/F⁰. V_p = π·H^i_et(X_K̄, ℚ_p(j)).

**Lines.** Determinants are those of TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1: d C = ⊗_i d(C^i)^{(−1)^i} with the Koszul sign on graded lines, and for [A --a--> A] in degrees 0, 1 with a a non-zero-divisor the acyclic trivialization has image aA (in degrees −1, 0 it is a⁻¹A). The Burns–Flach line of PeriodsAndSpecialValues PS.3.1 is

```text
Ξ_A(M) = d H⁰_f(K,M) · d H¹_f(K,M)⁻¹ · d(H¹_f(K,M*(1))^*) · d(H⁰_f(K,M*(1))^*)⁻¹ · ∏_{v|∞} d(H_v(M)^{G_v})⁻¹ · d t_M,
```

and Kato's line is Δ = Ξ⁻¹. ϑ_∞ maps Ξ ⊗ ℝ to the unit object and ϑ_p maps Ξ ⊗ ℚ_p to d RΓ_c(O_{K,S_p}, V_p); Kato's comparisons are their inverses. A comparison coordinate is the value of ϑ on a chosen generator: if r_B(x) = R·y for bases x and y of a source and a target line, ϑ_∞(x⁻¹ ⊗ y) = R⁻¹.

**Places and compact support.** S is a finite set of places of K containing the archimedean places and the places of bad reduction of 𝒳; S_p adds the places above p. RΓ_c(O_{K,S_p}, –) is the complex with archimedean terms of §3.5 (`compactCochainsWithInfinity`), the mapping fibre of global cochains to the local cochains at all places of S_p including the archimedean ones; for p odd its archimedean terms are T^{G_v}[0]. Integral statements are made for p odd, or for K without real places, as in PeriodsAndSpecialValues PS.4.4.

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

Define `KTheoreticMotive` as the structure with fields: a number field K; a smooth projective K-scheme X of pure dimension d, not necessarily geometrically connected; a regular, proper and flat O_K-model 𝒳 of X, recorded as part of the data; an idempotent π ∈ CH^d(X ×_K X) ⊗ ℚ whose Betti, de Rham and ℓ-adic realizations (MotivesAndAlgebraicCycles §§2.6–2.7, `BettiRealization`, `DeRhamRealization`, `EtaleRealization`) are concentrated in the single cohomological degree i; an integer twist j; a finite-dimensional semisimple ℚ-algebra A; and a ring homomorphism φ : A → π·(CH^d(X × X) ⊗ ℚ)·π into the endomorphism ring of the Chow motive (X, π) (MotivesAndAlgebraicCycles §§1.1–1.3, `ChowMotive`, Tate twists, duality and rigidity). The datum is written M = h^i(X)(j). For X = Spec F with F/K finite, the model is Spec O_F; for an elliptic curve E/K the projector is π¹ = Δ − e × E − E × e, with e the origin, and i = 1.

Its API is:

- `KTheoreticMotive.weight` (w = i − 2j), computed by the integer function `motiveWeight i j = i − 2j`;
- `KTheoreticMotive.dualTwist`, the dual datum M*(1) = (X, πᵗ, 2d − i, d + 1 − j) with coefficient algebra A^op acting through transposed correspondences, computed on degrees and twists by `dualDegree d i = 2d − i` and `dualTwist d j = d + 1 − j`, with `motiveWeight_dual` (the dual datum has weight −2 − w) and `dualDegree_dualTwist_involutive` (dualizing twice returns the degree and the twist, so M*(1)*(1) = M);
- `KTheoreticMotive.restrictScalars`, the same variety regarded as a ℚ-scheme through Spec K → Spec ℚ, with the same model over ℤ, the realizations summed over the embeddings of K and the same L-function;
- `KTheoreticMotive.ofArtin F E e r`, for number fields F and E and an idempotent E-linear combination e of correspondences on h⁰(Spec F), the Artin datum (Spec F, e, 0, r) with coefficients E;
- `KTheoreticMotive.ofElliptic E ℰ j`, for an elliptic curve E/K with a regular proper model ℰ, the datum (E, π¹, 1, j);
- `KTheoreticMotive.extendCoefficients`, extension of coefficients along A → A ⊗_E E′ for a field extension E′/E inside the centre, compatible with every factor, comparison and condition of Layers 1–4.

The datum is the motivic structure of Burns–Flach §3.1, pp. 517–518, in the form h^n(X)(r) with coefficients acting by correspondences, and the motive of Kato 2003, §2.1, p. 167, a direct summand of H^m(X)(r) with an action of a number field. The model 𝒳 is data: no statement of this roadmap asserts independence of the model beyond the Artin case, where Spec O_F is canonical. *Needs:* MotivesAndAlgebraicCycles §§1.1–1.3 (Chow motives, Tate twists, transposition and duals) and §§2.6–2.7 (Betti, de Rham and étale realizations); MotivicEtaleKTheory §12.3 (the integral image is defined relative to a specified regular model).

**Checks.**

- `weight_tate_two`: for (Spec ℚ, Δ, 0, 2) the weight is −4; the dual datum (Spec ℚ, Δ, 0, −1) has weight 2 = −2 − (−4).
- `dualTwist_dualTwist`: for any (d, i, j), 2d − (2d − i) = i and d + 1 − (d + 1 − j) = j, so dualizing twice is the identity. The untwisted dual (twist d − j) is also an involution but has weight −w: for ℚ(2) it gives weight 4 instead of 2, so `motiveWeight_dual` separates the two.
- `weight_elliptic_center`: h¹(E)(1) has weight 1 − 2·1 = −1 and its dual datum is (E, π¹ᵗ, 1, 1), the same degree and twist; the centre of the symmetry j ↦ 2 − j is j = 1.
- `impure_projector_rejected`: the diagonal of E has realizations in degrees 0, 1 and 2 and is not an admissible π; its h⁰ summand would contribute H⁰_f in weight 0 while its h¹ summand has weight 1, so no single weight governs the vanishing of §1.3.

### 1.2 The motivic factors

Let M = h^i(X)(j) be a K-theoretic motive datum. Define `motivicFactorZero M`, the space H⁰_f(K, M), as π_*((CH^j(X)/CH^j(X)_{hom∼0}) ⊗ ℚ) when i = 2j, homological equivalence being taken in Betti cohomology through the embeddings of K (MotivesAndAlgebraicCycles §2.3, `HomTrivial_H`), and as 0 when i ≠ 2j. Define `motivicFactorOne M`, the space H¹_f(K, M), by cases on the integer n = 2j − i − 1:

```text
n < 0 :  H¹_f(K, M) = 0,
n = 0 :  H¹_f(K, M) = π_*(CH^j(X)_{hom∼0} ⊗ ℚ),
n > 0 :  H¹_f(K, M) = π_* im[H^{i+1}_M(𝒳, ℚ(j)) → H^{i+1}_M(X, ℚ(j))],
```

the last being π_* of the rational integral part of MotivicEtaleKTheory §12.3 (`rationalIntegralPart`), with H^{i+1}_M(X, ℚ(j)) = CH^j(X, n) ⊗ ℚ the higher Chow group of MotivicEtaleKTheory §§4.1–4.2 (`higherChow`). By MotivicEtaleKTheory §9.3 (`coniveauEdge_eq_character`) the normalized character identifies H^{i+1}_M(X, ℚ(j)) with the weight-j Adams eigenspace (K_n(X) ⊗ ℚ)^{(j)}, so H¹_f(K, M) is the image of the integral motivic classes in Burns–Flach's K-theoretic space on the generic fibre. A correspondence γ ∈ CH^d(X × X′) ⊗ ℚ acts by γ_*(x) = pr_{2*}(pr_1^*(x) · γ), using flat pullback, products and proper pushforward of higher Chow groups (MotivicEtaleKTheory §§4.3–4.4, functoriality, moving, localization and products); idempotence of π makes π_* a projector, and A acts through φ. The factors of M*(1) are those of the dual datum. (Burns–Flach §3.1, p. 518, for the case distinction and the finite part through a regular proper model; Bloch–Kato Definition 5.1 and the following paragraph, p. 369, for the space built from gr^j K and its integral subspace; Fontaine §9.3, p. 231, for motivic cohomology as an Adams eigenspace with its integral subspace.)

Finite dimensionality of H¹_f is not asserted in general: it is a hypothesis of every statement that forms a determinant of H¹_f, and a theorem for Artin motives (§1.4) and for h¹(E)(1) (§1.5). The integral part depends on the recorded model; its independence of the model, and a definition without a regular model through alterations, are not used anywhere in this roadmap and are not stated.

Its API is:

- `motivicFactorOne_eq_zero_of_weight_nonneg`: if w ≥ 0 then H¹_f(K, M) = 0 (because n = −w − 1 < 0);
- `motivicFactorZero_eq_zero`: if i ≠ 2j, equivalently w ≠ 0, then H⁰_f(K, M) = 0;
- `motivicFactorOne_spec`: for X = Spec F with F/K finite and j ≥ 1, H¹_f(K, h⁰(F)(j)) = K_{2j−1}(O_F) ⊗ ℚ, which equals K_{2j−1}(F) ⊗ ℚ for j ≥ 2 and O_F^× ⊗ ℚ for j = 1;
- `motivicFactor_correspondence`: a correspondence γ : M → M′ of data induces γ_* on both factors, with (γ′ ∘ γ)_* = γ′_* ∘ γ_* and Δ_* = id;
- `motivicFactor_restrictScalars`: the factors of a datum over K and of its restriction of scalars to ℚ are equal;
- `motivicFactor_extendCoefficients`: extension of coefficients is the base change of both factors.

*Needs:* §1.1; MotivicEtaleKTheory §12.3 (integral image, its torsion-free quotient and its rational integral part, with change of model and localization), §§4.1–4.4 (higher Chow groups, their functoriality and products), §9.3 (the normalized character on Adams eigenspaces); MotivesAndAlgebraicCycles §2.3 (homological equivalence).

**Checks.**

- `motivicFactorOne_rat_one`: for (Spec ℚ, Δ, 0, 1), n = 1 and H¹_f = K₁(ℤ) ⊗ ℚ = ℤ^× ⊗ ℚ = 0, whereas K₁(ℚ) ⊗ ℚ = ℚ^× ⊗ ℚ is infinite-dimensional. A definition that forgets the image of the model fails this.
- `motivicFactorZero_point`: for (Spec F, Δ, 0, 0), H⁰_f = CH⁰(Spec F) ⊗ ℚ = ℚ, of dimension one, and H¹_f = 0 because n = −1.
- `motivicFactorOne_tate`: for (Spec F, Δ, 0, j) with j ≥ 2, dim H¹_f = r₂ for even j and r₁ + r₂ for odd j; for j = 1 it is r₁ + r₂ − 1. For F = ℚ these are 0, 1 and 0 at j = 2, 3 and 1.
- `motivicFactorOne_elliptic`: for h¹(E)(1), n = 0 and H¹_f = π¹_*(CH¹(E)_{hom∼0} ⊗ ℚ) = E(K) ⊗ ℚ, the Mordell–Weil group of TauCetiRoadmap EllipticCurves Layer 6 tensored with ℚ.
- `motivicFactorOne_weight_shift`: for h¹(E)(0), n = 2·0 − 1 − 1 = −2 and H¹_f = 0, although CH⁰ and the K-groups of E are nonzero; the case distinction is on 2j − i − 1, not on j.

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

where (−)^+ is the invariant part under the infinity involution of the conventions. For V = h⁰(F) and E = ℚ the dimension is r₁ + r₂ − 1 for r = 1, r₂ for even r ≥ 2 and r₁ + r₂ for odd r ≥ 3 (Huber–Kings §1.1, pp. 3–5, for Artin motives with coefficients and their motivic cohomology; Fontaine §8.3(a)–(b), pp. 228–229, for the unit motive and 𝔾_m; Bloch–Kato §5, p. 370, for Soulé's case X = Spec K, m = 0). *Proof route.* K_{2r−1}(F) ⊗ ℚ is pure of Adams weight r for r ≥ 1 (BorelRegulators §4.9, the Adams weights of the regulator, with the injectivity of §4.10; MotivicEtaleKTheory §9.3), so H¹_M(F, ℚ(r)) = K_{2r−1}(F) ⊗ ℚ; the localization sequence H¹_M(O_F, ℚ(r)) → H¹_M(F, ℚ(r)) → ⊕_v H⁰_M(k_v, ℚ(r − 1)) of MotivicEtaleKTheory §4.3, whose last term vanishes for r ≥ 2, gives the equality of the integral part with H¹_M(F, ℚ(r)) for r ≥ 2, and H¹_M(O_F, ℚ(1)) = O_F^× ⊗ ℚ; the ranks are Borel's (BorelRegulators §3.12, `borelRankTheorem_odd`) for r ≥ 2 and Dirichlet's (Mathlib `NumberField.Units.finrank_eq`, `NumberField.Units.rank`) for r = 1; finite generation is ArithmeticKTheory §§3.2–3.3; the idempotent e commutes with everything by functoriality in the automorphisms of F; the general dimension formula is the dimension count of the exact sequences of §2.4.

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
- `heightPairingReal` δ, defined in weight −1 only, is the map induced by a height pairing H¹_f(K,M) × H¹_f(K,M*(1)) → ℝ: for h¹(E)(1) it is the Néron–Tate pairing on E(K) ⊗ ℝ (TauCetiRoadmap EllipticCurves Layer 6), transported through §1.5(3) and the self-duality §1.5(5); for every other datum of weight −1 the pairing is part of the input data of the sequence.

Its API is:

- `RegulatorsCommuteWithCoefficients M`, the proposition that for every a ∈ A the maps ε, r_B (and c⁰_p, c¹_p of §3.1) commute with φ(a)_*; under it all maps of the sequence are A_ℝ-linear. For A = ℚ nothing is required, since r_B and ε are defined as π_* composed with the regulator and the cycle class of X. Prove `regulatorsCommute_artin` (for an Artin datum A acts through the graphs of automorphisms of F, and the regulators commute with pullback along isomorphisms, MotivicEtaleKTheory §12.2 `cubicalRegulator_flatPullback`, BorelRegulators §4.8) and `regulatorsCommute_elliptic` (for h¹(E)(j) with coefficients acting through endomorphisms of E: for j = 1 the maps are the Abel–Jacobi, Kummer and Néron–Tate maps, natural in endomorphisms by TauCetiRoadmap EllipticCurves Layers 1 and 6; for j ≥ 2, π¹ is the identity on H²_M(E, ℚ(j)) and on the targets, whose π⁰- and π²-components vanish, and an isogeny ψ acts through ψ^* and the transfer ψ_* = (deg ψ)·(ψ^*)⁻¹). Burns–Flach §3.1, p. 518, take the coefficients to act through correspondences in this way;
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
- `heightPairingReal_elliptic`: for h¹(E)(1), the determinant of δ on a ℤ-basis of E(K)/tors is the regulator Reg_E of Tau Ceti `WeierstrassCurve.Affine.regulator`; on the basis 3P of an index-3 sublattice in rank one it is 9 Reg_E.

### 2.3 The real exactness predicate

Define `RealExactness M` as the Burns–Flach real exactness hypothesis of PeriodsAndSpecialValues PS.3.2 for the maps of §2.2: the four motivic factors of M and of M*(1) are finite-dimensional, the sequence of §2.2 is exact, and its ℝ-dual is identified with the sequence for M*(1) by `realRegulatorSequence_dual` (Burns–Flach §3.2, Conjecture 1, p. 519; Fontaine §9.3, p. 231). The maps are part of the predicate: another map between the same spaces does not witness it. By `weight_vanishing` it says: for w ≤ −3, r_B is an isomorphism H¹_f(K,M)_ℝ ≅ coker α_M, which is Beilinson's conjecture; for w = −2, 0 → H¹_f(K,M)_ℝ → coker α_M → H⁰_f(K,M*(1))^*_ℝ → 0 is exact; for w = −1, δ is an isomorphism; for w ≥ 0, the dual statements for M*(1).

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

are exact (Huber–Kings Proposition 1.2.3, p. 7, and §1.1, p. 5; Fontaine §8.3(a)–(b), pp. 228–229). *Proof route.* For r ≥ 2: Borel's theorem that the Borel regulator is a real isomorphism (BorelRegulators §4.10), `beilinsonRegulatorReal_artin` with the factor two of BorelRegulators §8.4, the identification of its target with coker α by `delignePeriodMap_artin` (BorelRegulators §4.1 for the conjugation target V_r(F)), and Galois equivariance of the regulator under the automorphisms of F for the idempotent (BorelRegulators §4.8, `higherK_transfer_comp`). For r = 1: Dirichlet's unit theorem, that the logarithmic embedding of O_F^× ⊗ ℝ is an isomorphism onto the trace-zero hyperplane of ⊕_{v|∞} ℝ, whose quotient by the hyperplane is H⁰_f(h⁰(F))^∨_ℝ = ℝ through the sum (Mathlib `NumberField.Units.logEmbedding`, `NumberField.Units.finrank_eq`, `NumberField.Units.regulator_pos`). For r ≤ 0: `realExactness_dual` with 1 − r ≥ 1. *Needs:* §§1.4, 2.1–2.3; BorelRegulators §§4.1, 4.8, 4.10 and 8.4; Mathlib `NumberField.Units.logEmbedding`, `NumberField.Units.finrank_eq`, `NumberField.Units.regulator_pos`.

**Checks.**

- For F = ℚ and r = 3 the Beilinson regulator of a generator of K₅(ℤ) ⊗ ℚ is nonzero, and the sequence is an isomorphism of lines; the dimension count is `artinFactorRank_add_tatePlusDim` at r = 3: 1 + 0 = 1.
- For F real quadratic and r = 1 the sequence is 0 → ℝ·r_B(ε₀) → ℝ² → ℝ → 0, with the last map the sum of the coordinates.
- For F = ℚ and r = 0 the sequence is 0 → ℝ → ℝ → 0 → 0, the identity on H⁰_f(ℚ(0))_ℝ = B⁺_ℝ; for r = −1 it is 0 → 0 → 0 → 0 → 0, because B⁺(ℚ(−1)) = 0 and K₃(ℤ) ⊗ ℚ = 0.

### 2.5 Real exactness for elliptic motives

Let E be an elliptic curve over a number field K. First prove `neronTatePairing_posDef_real`: the Néron–Tate pairing of TauCetiRoadmap EllipticCurves Layer 6, extended ℝ-bilinearly, is positive definite on E(K) ⊗ ℝ. *Proof route.* E(K)/tors is a lattice in E(K) ⊗ ℝ (Mordell–Weil, Layer 6); the canonical height ĥ is a quadratic form, ĥ(P) = 0 exactly for torsion P, and the points of E(K) with ĥ(P) ≤ C are finite in number for every C (Northcott, through the bounded difference from the naïve height, Layer 6); a quadratic form on a lattice that is positive off zero and has finitely many lattice points below every bound is positive definite on the real span (Silverman, *The Arithmetic of Elliptic Curves*, 2nd ed., Chapter VIII, §9). The pairing is taken in the normalization pinned by TauCetiRoadmap EllipticCurves Layer 6, whose Gram determinant is Tau Ceti's `WeierstrassCurve.Affine.regulator`. *Needs:* TauCetiRoadmap EllipticCurves Layer 6 (the canonical height, its pairing and regulator, Northcott finiteness).

**Checks.** For a point P of infinite order, ĥ(P) > 0; for a torsion point, ĥ(P) = 0, so the pairing is only positive semidefinite on E(K) itself and the statement is about E(K)/tors ⊗ ℝ. In rank one with generator P, the form on ℝ is x ↦ x²ĥ(P).

Then prove `realExactness_elliptic`:

1. RealExactness(h¹(E)(1)) holds: α_M is an isomorphism (weight −1), the H⁰ factors vanish, H¹_f(K,M) = H¹_f(K,M*(1)) = E(K) ⊗ ℚ, and δ is the Néron–Tate pairing, which is positive definite on E(K) ⊗ ℝ by `neronTatePairing_posDef_real`;
2. for j ≥ 2, RealExactness(h¹(E)(j)) is equivalent to: H¹_f(K, h¹(E)(j)) is finite-dimensional and r_B ⊗ ℝ is an isomorphism onto H²_D(E_{/ℝ}, ℝ(j)), of real dimension [K:ℚ]; for K = ℚ and j = 2 this is the isomorphism clause of EllipticRegulators §6.2 (`BeilinsonConjecture.isIso`), and no case with j ≥ 2 is asserted here;
3. for j ≤ 0, RealExactness(h¹(E)(j)) ↔ RealExactness(h¹(E)(2 − j)).

(Fontaine §8.3(d), p. 230, and §9.6, p. 233; Burns–Flach §3.2, Conjecture 1, p. 519.) *Proof route.* Part 1: by `delignePeriodMap_injective` and `delignePeriodMap_surjective` in weight −1, α_M is an isomorphism; §1.5 gives the factors; the sequence reduces to δ, the Néron–Tate pairing, which is an isomorphism by `neronTatePairing_posDef_real`. Part 2: weight 1 − 2j ≤ −3, so §2.3 reduces the predicate to the bijectivity of r_B; since F^j H¹_dR(E) = 0 for j ≥ 2, t_M = H¹_dR(E/K) has ℚ-dimension 2[K:ℚ], while B⁺ has dimension r₁ + 2r₂ = [K:ℚ] (one eigenline of the involution at each real place, the full plane at each complex place), so dim coker α_M = [K:ℚ]. Part 3: `realExactness_dual` with §1.5(5). *Needs:* §§1.5, 2.1–2.3; TauCetiRoadmap EllipticCurves Layer 6; EllipticRegulators §6.2.

**Checks.**

- For E/ℚ of rank zero, part 1 is the exactness of 0 → 0, with α_M the real period isomorphism.
- For E/ℚ of rank one generated by P modulo torsion, δ is multiplication by the canonical height ĥ(P) > 0; for a degenerate pairing (a hypothetical zero height on P) the predicate would fail.
- For E/ℚ and j = 2, dim coker α_M = 1, the expected rank of the integral part of K₂(E) ⊗ ℚ; for E over an imaginary quadratic field it is 2.

### 2.6 The fundamental-line real comparison

For a K-theoretic motive datum M with RealExactness M, whose factors are projective over A (automatic for commutative semisimple A), define `fundamentalLineRealComparison` ϑ_∞(M) : Ξ_A(M) ⊗ ℝ ≅ 1 as PeriodsAndSpecialValues PS.3.2's `realTrivialization` applied to the exact-sequence witness of §2.2 together with 0 → ker α_M → B⁺_ℝ → t_{M,ℝ} → coker α_M → 0, in the fixed order of the factors of Ξ_A(M) of PS.3.1 and with the graded determinant of TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1 (Burns–Flach §3.4, p. 529; Kato 2003, §2.1(b), p. 168).

Its API is:

- `fundamentalLineRealComparison_coordinate`: in bases of the motivic factors, of B⁺ and of t_M, ϑ_∞ is the signed product of the inverse regulator, cycle-class and height determinants with the period determinant (`realTrivialization_matrix`; Mathlib `Matrix.det`, `Matrix.det_smul`); in particular, if r_B(x) = R·y for bases x of H¹_f(K,M) and y of coker α_M in rank one, ϑ_∞(x⁻¹ ⊗ y) = R⁻¹;
- `fundamentalLineRealComparison_artin`: for an Artin motive h⁰(F)(r), r ≥ 2, a full ℤ-lattice Ω ⊂ H¹_f(h⁰(F)(r)), the integral Betti lattice T_B and the de Rham lattice O_F ⊂ t_M, ϑ_∞ sends the generator of det⁻¹Ω ⊗ det⁻¹T_B(r)^+ ⊗ det O_F to ±c_F(r)·R_Ω⁻¹, where R_Ω is the covolume of r_B(Ω) in V_B(r − 1)^+_ℝ relative to the integral Betti lattice and c_F(r) the period factor comparing O_F with T_B(r)^+ ⊕ T_B(r − 1)^+ (BorelRegulators §4.13 for the covolume); for h⁰(F)(1 − k), k ≥ 2, where t_M = 0, it sends the generator of det(Ω^*) ⊗ det⁻¹T_B(1 − k)^+ = det⁻¹Ω ⊗ det⁻¹T_B(1 − k)^+, Ω ⊂ H¹_f(h⁰(F)(k)), to ±R_Ω⁻¹ (Huber–Kings, proof of Theorem 1.4.1, pp. 13–14);
- `fundamentalLineRealComparison_dual`: ϑ_∞(M) and ϑ_∞(M*(1)) are compatible with the local line Δ_loc(M) = det⁻¹ B⁺(M) ⊗ det t_M ⊗ det B⁺(M*(1)) of Huber–Kings §2.2, p. 17, whose real trivialization uses α_M alone (Huber–Kings Proposition 2.2.3 and its proof, p. 18);
- `fundamentalLineRealComparison_borel`: replacing the Beilinson by the Borel regulator for h⁰(F)(r), r ≥ 2, divides the coordinate by 2^{d_r}, d_r = dim coker α (BorelRegulators §8.4);
- `fundamentalLineRealComparison_restrictScalars` and `fundamentalLineRealComparison_extendCoefficients`: ϑ_∞ is unchanged by restriction of scalars to ℚ and is A-equivariant, commuting with extension of coefficients.

*Needs:* §§2.2–2.5; PeriodsAndSpecialValues PS.3.1–PS.3.2 and PS.0.1; BorelRegulators §§4.12–4.13 and 8.4; TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1; Mathlib `Matrix.det`, `Matrix.det_smul`, `NumberField.Units.regulator`.

**Checks.**

- `fundamentalLineRealComparison_rat_one`: for ℚ(1) over ℚ, Ξ = d(H⁰_f(ℚ(0))^*)⁻¹ ⊗ d(t), and ϑ_∞ sends (1^*)⁻¹ ⊗ 1 to 1 after the identification t ⊗ ℝ = coker α = ℝ.
- `fundamentalLineRealComparison_real_quadratic`: for h⁰(F)(1), F real quadratic with fundamental unit ε₀ and discriminant d_F, B⁺ = 0 and t_M = F; the generator ε₀⁻¹ ⊗ (1^*)⁻¹ ⊗ (1 ∧ ω), with (1, ω) a ℤ-basis of O_F, has coordinate ±√d_F/R_F, where R_F = log ε₀ is the regulator (Mathlib `NumberField.Units.regulator`): in the coordinates of the two real places, 1 ∧ ω has determinant ±√d_F, while r_B(ε₀) and a lift of 1 have determinant R_F.
- `fundamentalLineRealComparison_odd_swap`: swapping two odd-degree line factors in the fixed order multiplies ϑ_∞ by −1; a formula in ungraded lines cannot record the ordering used in the comparison.
- `fundamentalLineRealComparison_borel_factor`: for F imaginary quadratic and r = 2 (d_r = 1), R_Bo = 2R_Be, so the coordinate computed with the Borel regulator is half the Beilinson coordinate; the opposite direction (twice) is the error of reading the coordinate as R instead of R⁻¹.
- For h¹(E)(1) with E/ℚ of rank one generated by P, the coordinate of the generator built from P, its dual and the Betti and de Rham lattices is a rational multiple of (Ω_E·ĥ(P))⁻¹, Ω_E the real period: the height enters inversely, as the unit regulator does in `fundamentalLineRealComparison_real_quadratic`.

### Examples

For ℚ(3) over ℚ the comparison is the isomorphism d(K₅(ℤ) ⊗ ℚ)⁻¹ ⊗ d(t) ≅ ℝ given by the Beilinson regulator of a generator and the period (2πi)³ relating t to the Betti lattice. For h⁰(F)(1) it is the unit regulator together with the discriminant, from the lattice O_F in t_M. For h¹(E)(1) it is the Néron–Tate regulator together with the real period.

### Dependencies

Layer 1; MotivicEtaleKTheory §§12.2–12.3; PeriodsAndSpecialValues PS.0.1–PS.0.2 and PS.3.1–PS.3.2; BorelRegulators §§4.1, 4.7–4.8, 4.10, 4.12–4.13 and 8.2–8.4; EllipticRegulators §6.2; MotivesAndAlgebraicCycles §§2.4–2.5; TauCetiRoadmap EllipticCurves Layer 6; TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1; Tau Ceti Hodge structures and `WeierstrassCurve.Affine.regulator`; Mathlib's unit theorem and determinants.

## Layer 3: p-adic realizations and the fundamental-line p-adic comparison

This layer does p-adically what Layer 2 does at infinity. The motivic factors are mapped into Bloch–Kato Selmer complexes by the étale Chern character and the p-adic Abel–Jacobi map; the realization predicate asks that these maps be isomorphisms; it is proved for every Tate twist of every Artin motive at every prime (Soulé, Kummer) and reduced to the finiteness of Sha for h¹(E)(1); the Selmer complexes of Artin motives are computed; and the comparison ϑ_p of Ξ_A(M) ⊗ ℚ_p with the determinant of compactly supported cohomology is assembled, with its Euler-factor normalization at the places above p.

### 3.1 The p-adic realization maps

Let M = h^i(X)(j) be a K-theoretic motive datum, p a prime, S a finite set of places of K containing the archimedean places and the places of bad reduction of 𝒳, S_p = S ∪ {v | p}, 𝒳_{S_p} = 𝒳 ×_{O_K} O_{K,S_p}, which is smooth and proper over O_{K,S_p}, and V_p = π·H^i_et(X_K̄, ℚ_p(j)) (MotivesAndAlgebraicCycles §2.7, `EtaleRealization`), a continuous representation of G_{K,S_p} with coefficients A_p = A ⊗ ℚ_p. Define `padicRealizationZero` c⁰_p : H⁰_f(K, M) ⊗ ℚ_p → H⁰(K, V_p) as the p-adic cycle class when i = 2j (MotivesAndAlgebraicCycles §2.4), and `padicRealizationOne` c¹_p : H¹_f(K, M) ⊗ ℚ_p → H¹(G_{K,S_p}, V_p) as follows (Bloch–Kato (5.2) and Conjecture 5.3, p. 370; Fontaine §9.4, pp. 231–232; Burns–Flach §3.2, (27), p. 523):

- if n = 2j − i − 1 > 0, a class of the integral part is the image of a class of H^{i+1}_M(𝒳, ℚ(j)) = H^{i+1}_M(𝒳, ℤ(j)) ⊗ ℚ; restrict an integral representative to 𝒳_{S_p}, on which p is invertible, and apply the finite-coefficient comparison of motivic with étale cohomology over a smooth Dedekind base (MotivicEtaleKTheory §§10.1–10.2) with coefficients ℤ/p^r(j), compatible under the coefficient maps; then the Hochschild–Serre spectral sequence of 𝒳_{S_p} → Spec O_{K,S_p}, whose terms H^a(G_{K,S_p}, H^b(X_K̄, ℤ/p^r(j))) come from smooth and proper base change (TauCetiRoadmap EtaleCohomologyFoundations F.1, F.2.1–F.2.2), with edge H^{i+1}(𝒳_{S_p}, ℤ/p^r(j))_0 → H¹(G_{K,S_p}, H^i(X_K̄, ℤ/p^r(j))) on the kernel of the restriction to H^{i+1}(X_K̄, ℤ/p^r(j))^{G_K}; then the inverse limit over r, which is exact here because every finite-level group is finite, and ⊗ ℚ (TauCetiRoadmap EtaleCohomologyFoundations F.4.2 and F.4.5; ArithmeticGaloisDuality §D7.3 for the continuous cochains of G_{K,S_p}); then π. The restriction to H^{i+1}(X_K̄, ℚ_p(j))^{G_K} vanishes rationally because i + 1 ≠ 2j and the Frobenius weights of H^{i+1}(X_K̄, ℚ_p(j)) at the good places are i + 1 − 2j ≠ 0. On the generic fibre this is the étale realization of motivic cohomology, which corresponds to the normalized character ch_j on K_n(X)^{(j)} under MotivicEtaleKTheory §9.3 (`coniveauEdge_eq_character`) and §12.1; no factorial is divided at a finite level (MotivicEtaleKTheory §12.1, Checks);
- if n = 0, apply the p-adic Abel–Jacobi map on π_*(CH^j(X)_{hom∼0}), the same construction in degree n = 0 on the homologically trivial cycles, which for h¹(E)(1) is the Kummer map of E.

The normalization is the character ch_j, not the Chern class c_{j,2j−1} = (−1)^{j−1}(j − 1)!·ch_j (MotivicEtaleKTheory §12.8, `chernImageScaling`): the real regulator r_B of §2.2 is the Deligne character, and the comparisons of §2.6 and §3.6 must realize the same rational structure.

Its API is:

- `padicRealizationOne_mem_f`: the image of c¹_p lies in the Bloch–Kato group H¹_f(K, V_p) = H¹RΓ_f(K, V_p) (SelmerIwasawaCohomology §4.9, `blochKatoCondition`; §2.9 for the global Selmer group) for Artin motives of twist ≥ 1 (MotivicEtaleKTheory §12.6, `localTateRegulatorComparison`, and Kummer theory) and for h¹(E)(1) (SelmerIwasawaCohomology §4.26); for every other datum, membership in H¹_f at the places above p is a hypothesis, recorded as `PadicRealizationFinite M p`, of every statement that uses c¹_p. In weights ≤ −3 with good reduction above p the hypothesis only asks for de Rham classes, since there the local Bloch–Kato groups H¹_f and H¹_g coincide because D_cris(V_p^*(1))^{φ=1} = 0 by purity of the Frobenius weights (Bloch–Kato Proposition 3.8 and Corollary 3.8.4, pp. 354–355);
- `padicRealizationOne_units`: for h⁰(F)(1), c¹_p is the Kummer map O_F^× ⊗ ℚ_p → H¹_f(F, ℚ_p(1)), whose finite levels are Tau Ceti's `TauCeti.kummerMap` (`TauCeti/FieldTheory/GaloisCohomology/Kummer.lean`) for n = p^m;
- `padicRealizationOne_kummer_elliptic`: for h¹(E)(1), c¹_p is the Kummer map E(K) ⊗ ℚ_p → H¹_f(K, V_pE) of SelmerIwasawaCohomology §4.26 (the elliptic finite Kummer condition);
- `padicRealization_numberRing`: for X = Spec F, j ≥ 2 and p odd, c¹_p carries the p-adic completion of the integral motivic group H¹_M(O_F[1/p], ℤ(j)) isomorphically onto H¹(O_F[1/p], ℤ_p(j)), by the comparison in arithmetic degrees of MotivicEtaleKTheory §§10.4–10.5 (`quillenLichtenbaumSIntegers`, `arithmeticFiniteOdd`, `arithmeticAdicComparison`);
- `padicRealization_restrictScalars`: compatible with restriction of scalars and Shapiro's lemma;
- `padicRealization_coefficients`: under `RegulatorsCommuteWithCoefficients M` (§2.2), c⁰_p and c¹_p are A_p-linear; for A = ℚ nothing is required.

*Needs:* §1.2; MotivesAndAlgebraicCycles §§2.4 and 2.7; MotivicEtaleKTheory §§9.3, 10.1–10.2, 10.4–10.5, 12.1, 12.6 and 12.8; TauCetiRoadmap EtaleCohomologyFoundations F.1, F.2.1–F.2.2, F.4.2 and F.4.5; ArithmeticGaloisDuality §D7.3; SelmerIwasawaCohomology §§2.9, 4.9 and 4.26; Tau Ceti `TauCeti.kummerMap`.

**Checks.**

- `padicRealizationOne_rat_even`: for ℚ(j) over ℚ with even j ≥ 2 both sides vanish: K_{2j−1}(ℤ) ⊗ ℚ = 0, and H¹(ℤ[1/p], ℚ_p(j)) = 0 because its dimension is r₂ = 0 (Tate's Euler characteristic formula with H² = 0).
- `padicRealizationOne_units_degenerate`: for F = ℚ in twist one the source ℤ^× ⊗ ℚ_p and the target H¹_f(ℚ, ℚ_p(1)) = ℤ^× ⊗ ℚ_p are both zero.
- `padicRealizationOne_factorial`: with c_{j,2j−1} in place of ch_j, c¹_p is multiplied by (−1)^{j−1}(j − 1)!; rational bijectivity is unchanged, but the image of an integral lattice changes by that factor, which is a p-adic unit exactly when p ≥ j.
- `padicRealizationOne_uniformizer`: in H¹(ℚ_p, ℚ_p(1)) = ℚ_p^× ⊗̂ ℚ_p, the class of p lies outside H¹_f = ℤ_p^× ⊗ ℚ_p and the class of a unit lies inside; a definition landing in all of H¹ in twist one is wrong.

### 3.2 The p-adic realization predicate

First prove `blochKatoCondition_orthogonal`: for a de Rham representation V of G_{K_v}, v | p, the Bloch–Kato subspaces H¹_f(K_v, V) and H¹_f(K_v, V^*(1)) are exact annihilators of each other under the local Tate pairing (Bloch–Kato Proposition 3.8, p. 354); away from p and at the archimedean places this is SelmerIwasawaCohomology §2.16. *Needs:* SelmerIwasawaCohomology §§2.16 and 4.9; ArithmeticGaloisDuality §D7.4 (derived local duality); PadicHodgeTheory §8.1 (de Rham representations).

Define `PadicRealizationIso M p`: `PadicRealizationFinite M p` holds and c⁰_p and c¹_p are isomorphisms H⁰_f(K,M) ⊗ ℚ_p ≅ H⁰RΓ_f(K, V_p) and H¹_f(K,M) ⊗ ℚ_p ≅ H¹RΓ_f(K, V_p), and likewise for M*(1). Under the predicate, H²RΓ_f(K, V_p) and H³RΓ_f(K, V_p) are identified with the duals of H¹_f(K, M*(1)) ⊗ ℚ_p and H⁰_f(K, M*(1)) ⊗ ℚ_p by the duality RΓ_f(K, V_p) ≅ RHom(RΓ_f(K, V_p^*(1)), ℚ_p)[−3] (Burns–Flach §3.2, Conjecture 2, p. 523, and §3.3, p. 525; Bloch–Kato Conjecture 5.3, p. 370). Here RΓ_f(K, V_p) is the Selmer complex of SelmerIwasawaCohomology §2.21 (`selmerComplex`) with the Bloch–Kato local conditions of §4.9, and the duality is the derived Selmer duality of SelmerIwasawaCohomology §1.4 applied to conditions that are exact orthogonal complements by `blochKatoCondition_orthogonal`. The maps are those of §3.1: equal dimensions do not witness the predicate.

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

Define `compactCochainsWithInfinity` RΓ_c(O_{K,S_p}, T) for a G_{K,S_p}-lattice or representation T as the mapping fibre of the compactly supported cochains of ArithmeticGaloisDuality §D7.5 (`GaloisCohomology.compactCochains`, which use the finite places of S_p) to the archimedean cochains ⊕_{v|∞} C(G_v, T); for p odd C(G_v, T) is quasi-isomorphic to T^{G_v}[0], so the complex is bounded and perfect under the hypotheses of §D7.3, and d RΓ_c(O_{K,S_p}, T) = d C_c(G_{K,S_p}, T) ⊗ ⊗_{v|∞} d(T^{G_v})⁻¹. This is the complex of Fontaine, Burns–Flach and Huber–Kings, with RΓ_f(K_v, V) = RΓ(K_v, V) = C(G_v, V) at the archimedean places (Burns–Flach §3.2, p. 520, and (28), p. 523; Huber–Kings p. 7, for the triangle with the term V_p(r)^+); at p = 2 with real places the archimedean terms are the complete Tate cochains of PeriodsAndSpecialValues PS.4.4 and the complex is not perfect. *Needs:* ArithmeticGaloisDuality §§D7.3 and D7.5; PeriodsAndSpecialValues PS.4.4.

**Checks.**

- For K = ℚ, p odd and T = ℤ_p(0), T^{G_ℝ} = ℤ_p, so d RΓ_c(ℤ[1/p], ℤ_p) = d C_c ⊗ d(ℤ_p)⁻¹: the archimedean term is visible.
- For T = ℤ_p(1) and p odd, complex conjugation acts by −1, T^{G_ℝ} = 0, and the complex agrees with the compactly supported cochains over the finite places.
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

For a K-theoretic motive datum M with coefficients A, a prime p, a finite set S of places of K containing the archimedean places and the bad places, with PadicRealizationIso(M, p) and with the factors projective over A_p, define `fundamentalLinePadicComparison` ϑ_p(M, S) : Ξ_A(M) ⊗ ℚ_p ≅ d_{A_p} RΓ_c(O_{K,S_p}, V_p) by applying the graded determinant functor of TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1, in the fixed order of the factors of Ξ_A(M), to:

- the realization isomorphisms c^i_p(M), i = 0, 1, 2, 3, of §3.2;
- the Betti–étale comparison (H_v(M) ⊗ ℚ_p)^{G_v} ≅ H⁰(K_v, V_p) at the archimedean places, `bettiEtaleComparison_infinity`: Artin's comparison H_v(M) ⊗ ℚ_p ≅ V_p (MotivesAndAlgebraicCycles §2.7) intertwines the infinity involution of the conventions with complex conjugation c_v ∈ G_v, because it is natural for the antiholomorphic involution of σX(ℂ) induced by complex conjugation (Burns–Flach §3.2, (28), p. 523);
- the de Rham comparison t_M ⊗ ℚ_p ≅ ⊕_{v|p} t_v(V_p) with t_v(V) = D_dR(V)/F⁰ (PadicHodgeTheory §8.1, `LisseZpSheaf.IsDeRham`, after base change to K_v);
- the trivialization of d RΓ_f(K_v, V_p) at each finite v ∈ S_p by the identity of [V^{I_v} → V^{I_v}] for v ∤ p and of [D_cris → D_cris ⊕ t_v] at v | p, as in PeriodsAndSpecialValues PS.4.3 — not the acyclic trivialization;
- the distinguished triangle RΓ_c(O_{K,S_p}, V_p) → RΓ_f(K, V_p) → ⊕_{v∈S_p} RΓ_f(K_v, V_p) ⊕ ⊕_{v|∞} RΓ(K_v, V_p), with RΓ_c = `compactCochainsWithInfinity` (§3.5), built from ArithmeticGaloisDuality §§D7.3 and D7.5 and SelmerIwasawaCohomology §§2.21 and 2.23 (Selmer complexes and condition-change triangles).

(Burns–Flach §3.2, (19)–(26), pp. 520–523, and §3.4, p. 526; Kato 2003, §2.1(c), p. 168.) For an Artin motive V(r) over ℚ this is the isomorphism of Huber–Kings Definition 1.2.7, p. 9. At p = 2 with real places of K the compactly supported complex is the unbounded real dyadic complex of PeriodsAndSpecialValues PS.4.4, and no integral statement is made there.

Its API is:

- `fundamentalLinePadicComparison_enlargeS`: for S ⊂ S′, ϑ_p(M, S′) and ϑ_p(M, S) correspond under the localization triangle RΓ_c(O_{K,S′_p}) → RΓ_c(O_{K,S_p}) → ⊕_{w∈S′∖S} RΓ(k_w, V_p^{I_w}) and the identity trivializations of the local terms (Burns–Flach Lemma 5, pp. 526–528; Huber–Kings Proposition 1.2.9(b), p. 10);
- `fundamentalLinePadicComparison_eulerFactor`: at v | p, if 1 − φ is invertible on D_cris(V_p), the identity trivialization equals the acyclic trivialization multiplied by det(1 − φ | D_cris(V_p)), which is the Euler factor P_v(V, q_v^{−r}) up to sign for an Artin motive V(r) (Huber–Kings Proposition 1.2.5, p. 8);
- `fundamentalLinePadicComparison_dual`: compatibility of ϑ_p(M, S) and ϑ_p(M*(1), S) with global duality RΓ_c(V_p) ≅ RHom(RΓ(V_p^*(1)), ℚ_p)[−3] and the local line Δ_loc of §2.6 (Huber–Kings Proposition 2.2.3, p. 18);
- `fundamentalLinePadicComparison_artin`: for Artin motives it is Huber–Kings Definition 1.2.7;
- `fundamentalLinePadicComparison_restrictScalars` and `fundamentalLinePadicComparison_extendCoefficients`: compatibility with restriction of scalars from K to ℚ (Shapiro's lemma for RΓ_c) and with extension of coefficients.

*Needs:* §§3.1–3.5; ArithmeticGaloisDuality §§D7.3 and D7.5; SelmerIwasawaCohomology §§2.21 and 2.23; MotivesAndAlgebraicCycles §2.7; PadicHodgeTheory §8.1; PeriodsAndSpecialValues PS.4.3–PS.4.4; TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1 (`detLine`, `detLine_shortExact`, `detLine_cone`, `detLine_baseChange`, `detLine_shift`, `detLine_acyclic`).

**Checks.**

- `fundamentalLinePadicComparison_identity_trivialization`: for [V --(1 − Fr_v⁻¹)--> V] in degrees 0, 1 with 1 − Fr_v⁻¹ invertible, ϑ_p uses the identity [V → V] ≅ 1; the acyclic trivialization differs by det(1 − Fr_v⁻¹ | V), so a definition using it changes ϑ_p by the local Euler factor.
- `fundamentalLinePadicComparison_euler_unit`: for V = ℚ, r = 1 − k with k = 2, and p = 3, the Euler factor at p is 1 − 3^{k−1} = −2, a 3-adic unit; in general ∏_{v|p}(1 − N(v)^{k−1}) ≡ 1 mod p for k ≥ 2.
- `fundamentalLinePadicComparison_euler_zero`: for V = ℚ and r = 0 at p, φ = 1 on D_cris(ℚ_p), so 1 − φ is not invertible and the acyclic trivialization does not exist, while the identity trivialization does; this is why the identity trivialization is the definition.
- `fundamentalLinePadicComparison_zero_complex`: if every motivic and realization factor vanishes, both sides are the unit line and ϑ_p is the identity of ℚ_p.
- `fundamentalLinePadicComparison_not_any_iso`: an arbitrary isomorphism of the two one-dimensional spaces does not define the integral condition of Layer 4: multiplying it by p preserves rationality and changes the image lattice.

### Examples

For h⁰(F)(r), r ≥ 2, ϑ_p identifies d(K_{2r−1}(O_F) ⊗ ℚ_p)⁻¹ ⊗ d(B⁺ ⊗ ℚ_p)⁻¹ ⊗ d(t_M ⊗ ℚ_p) with d RΓ_c(O_{F,S_p}, ℚ_p(r)) through Soulé's isomorphism, the vanishing of H², the de Rham comparison t_M ⊗ ℚ_p = F ⊗ ℚ_p and the Euler factors at S_p. For h¹(E)(1) with Sha[p^∞] finite, ϑ_p is built from the Kummer isomorphism and the self-duality of V_pE.

### Dependencies

Layers 1–2; MotivicEtaleKTheory §§9.3, 10.1–10.2, 10.4–10.5, 11.3, 11.5, 12.1, 12.6 and 12.8; ArithmeticKTheory §§3.2–3.3; PadicHodgeTheory §8.1; SelmerIwasawaCohomology §§1.4, 2.9, 2.12, 2.16, 2.19, 2.21, 2.23, 4.9 and 4.26; ArithmeticGaloisDuality §§D7.3–D7.6; PeriodsAndSpecialValues PS.4.3–PS.4.4; MotivesAndAlgebraicCycles §§2.4 and 2.7; BorelRegulators §3.12; TauCetiRoadmap EllipticCurves Layer 7; TauCetiRoadmap EtaleCohomologyFoundations F.1, F.2.1–F.2.2, F.4.2 and F.4.5; TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1; Tau Ceti `TauCeti.kummerMap`.

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

Prove `tamagawaCondition_iff_etnc`: let M be a K-theoretic motive datum with commutative coefficients E, O = O_E, Σ a set of odd primes, and suppose RealExactness M and PadicRealizationIso M p for every p ∈ Σ, with the leading term supplied. Take θ_∞ = ϑ_∞(M) and θ_p = ϑ_p(M, S) in PeriodsAndSpecialValues PS.4.1 and PS.5.1. Then TamagawaCondition M T_p p holds for every p ∈ Σ if and only if the Tamagawa obstruction TΩ(M, O) of PS.5.1 is rational (PS.5.2(iii)) and its p-components vanish for every p ∈ Σ, that is, θ_∞ carries the λ-adic lattice I_p(M, T_p, S) onto (L*)⁻¹·O_p for each p ∈ Σ (`tamagawaObstruction_commutative`); for Σ the set of all odd primes this is the integrality PS.5.2(iv) over O[1/2], and it is equivalent to the Fukaya–Kato orientation of PS.5.3 (`zetaIso_iff_tamagawaObstruction`) with these comparisons (Burns–Flach §4.3, Conjecture 4 and the remarks following it, pp. 535–537; Huber–Kings Proposition 1.2.9(b), p. 10, and §1.5, Conjecture 1.5.2, pp. 14–15). *Proof route.* In the commutative case the relative class of PS.5.1 at p compares the lattices θ_∞⁻¹((L*)⁻¹)·O_p and I_p(M, T_p, S) = θ_p⁻¹(d_{O_p} RΓ_c(T_p)); generation of the lattice by θ_p(δ) is equality of these lattices. Under rationality, TΩ lies in Cl(O, ℚ) ≅ ⊕_p K₁(E_p)/K₁(O_p) (PS.5.1, `finiteBoundaryGluing`), so its vanishing away from 2 is the vanishing of its p-components for odd p. For the orientation apply PS.5.3 with Δ = Ξ⁻¹. *Needs:* §4.1; PeriodsAndSpecialValues PS.4.1 and PS.5.1–PS.5.3.

**Checks.**

- For E = ℚ the statement is an equality of ℤ_p-lattices in a ℚ_p-line, one odd prime at a time; for Σ = {3} it says nothing at 5.
- A nonzero rational relative class with nonzero 3-component satisfies rationality and fails the condition at 3.
- Changing θ_p by a factor p changes I_p by p⁻¹ and the obstruction's p-component by one; the comparisons of Layers 2–3 are part of the statement.

### 4.3 Lattice, place-set, duality and Selmer forms

Prove `tamagawaCondition_alternative_forms`, under the hypotheses of §4.1:

1. TamagawaCondition M T_p p does not depend on the Galois-stable lattice T_p, nor on the finite set S containing the bad places;
2. for p odd, the integral structures d RΓ_c(O_{K,S_p}, T_p) ⊗ d(T_p^+) and d RΓ(O_{K,S_p}, T_p^∨(1)) agree under derived global duality, so the condition can be stated with RΓ(O_{K,S_p}, T_p^∨(1)) in place of RΓ_c (Kato's formulation); at p = 2 one replaces RΓ by τ_{≤2}RΓ and T_p^+ by the zeroth Tate cohomology at the real places;
3. with the Selmer mapping fibre C_f(T_p) and local conditions U_v^+ (v ∈ S_p), MotivicEtaleKTheory's formula det⁻¹ C_f ≅ det⁻¹ C_c ⊗ ⊗_v det⁻¹ U_v^+ (§12.7, `selmerLocalDeterminant`) and the local Euler and Tamagawa identifications of PeriodsAndSpecialValues PS.4.3 turn the condition into: ϑ_p(δ), tensored with the generators of the lattices d U_v^+ given by their local identifications, generates d_{O_p} C_f(T_p). This is the local correction in the Tate and elliptic Tamagawa statements.

(Huber–Kings Propositions 1.2.9 and 1.2.10 with the following remarks, pp. 10–11; Burns–Flach §3.4, Lemma 5, pp. 526–528; Kato 2003, §1.2, p. 165, and §2.1, pp. 166–167.) *Proof route.* (1) For T′ ⊂ T the quotient Q is finite and the compactly supported Euler characteristic of Q is 1, by Tate's global and local Euler characteristic formulas (ArithmeticGaloisDuality §§R02.4.2 and R02.4.4), so the two determinant lattices agree (PeriodsAndSpecialValues PS.4.2, `detLattice_latticeChange`); for S ⊂ S′ use the localization triangle with RΓ(k_w, T^{I_w}) and `fundamentalLinePadicComparison_enlargeS`. (2) Derived Poitou–Tate duality RΓ_c(T) ≅ RHom(RΓ(T^∨(1)), O_p)[−3] up to the archimedean term (ArithmeticGaloisDuality §D7.5, derived global duality), and the identity d(A ⊗^L E_p/O_p)^* = d⁻¹(A) for a perfect complex A. (3) Apply `selmerLocalDeterminant` to the triangle C_c → C_f → ⊕_v U_v^+ and PS.4.3 to identify each det⁻¹ U_v^+. *Needs:* §§3.6 and 4.1; ArithmeticGaloisDuality §§R02.4.2, R02.4.4 and D7.5; PeriodsAndSpecialValues PS.4.2–PS.4.4; MotivicEtaleKTheory §12.7.

**Checks.**

- For T′ = pT the lattices d RΓ_c(T′) and d RΓ_c(T) coincide, although every cohomology group changes.
- With every U_v^+ = 0 the Selmer form is the compact-support form.
- For a finite ℤ_p-module Q of order p^a, d(Q[0]) = p^{−a}ℤ_p when Q sits in degree 0 and d(Q[−1]) = p^{a}ℤ_p when it sits in degree 1: the degree of the finite term fixes the sign of its contribution.

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

where ζ_F^*(1 − k)/R_Ω(F) ∈ ℚ^× by BorelRegulators §7.2 (`borelRegulator_zetaProportional`) with §8.4 and the rationality of the index of two lattices. *Proof route.* Ξ(h⁰(F)(1 − k)) = det⁻¹ H¹_f(h⁰(F)(k)) ⊗ det⁻¹ T_B(1 − k)^+ (§§1.3–1.4); by `fundamentalLineRealComparison_artin`, δ_ℤ = ±(R_Ω/ζ_F^*(1 − k)) times the generator det⁻¹Ω ⊗ det⁻¹T_B(1 − k)^+; RΓ_f(ℤ[1/p], V_p(1 − k)) ≅ H¹(ℤ[1/p], V_p^∨(k))^∨[−2] (§3.5(3)); the Euler factor ∏_{v|p}(1 − N(v)^{k−1}) is a p-adic unit (`fundamentalLinePadicComparison_euler_unit`); the duality form §4.3(2) turns the condition into (R_Ω/ζ^*)·ℤ_p = det c¹_p(Ω ⊗ ℤ_p) ⊗ det⁻¹ H¹(O_F[1/p], ℤ_p(k)) ⊗ det H²(O_F[1/p], ℤ_p(k)); and a finite ℤ_p-module of order h has determinant h⁻¹ℤ_p. Each step is an equality of lattices, so the equivalence holds in both directions (Huber–Kings Theorem 1.4.1 and its proof, pp. 13–14, which state the implication for the K-theory lattice). *Needs:* §§2.6, 3.3, 3.5, 3.6, 4.1 and 4.3; BorelRegulators §§7.2 and 8.4.

Prove the two lattice specializations:

- `tamagawaCondition_iff_lichtenbaum_motivic`: for Ω^M the torsion-free quotient of the integral motivic group H¹_M(O_F, ℤ(k)) (MotivicEtaleKTheory §12.3, `integralMotivicLatticeCandidate`, for the model Spec O_F), ι_p(Ω^M) = 1 at every odd p, by `padicRealization_numberRing` (H¹_M(O_F, ℤ(k)) = H¹_M(O_F[1/p], ℤ(k)) for k ≥ 2 by localization, MotivicEtaleKTheory §4.3), which is also the comparison through which SpecialValuesBirchTate §8.1 computes `rank_motivicH1` and `card_torsion_motivicH1`. Hence TamagawaCondition(h⁰(F)(1 − k), ℤ_p(1 − k), p) for every odd p is equivalent to the odd part of SpecialValuesBirchTate §8.2's `MotivicLichtenbaumFormula F k`, |ζ_F^*(1 − k)| = h_k(F)/#H¹_M(O_F, ℤ(k))_tors · R_k^M(F), with h_k(F) = SpecialValuesBirchTate §8.1's `hInvariant F k` (whose p-adic valuation is that of #H²(O_F[1/p], ℤ_p(k)) by `padicValNat_hInvariant`) and R_k^M(F) = `motivicRegulatorCovolume F k`;
- `tamagawaCondition_iff_lichtenbaum_K`: for Ω^K = K_{2k−1}(O_F)/tors and odd p ≥ k, ι_p(Ω^K) = 1, because the Chern class c_{k,2k−1} and the character differ by (−1)^{k−1}(k − 1)!, a p-adic unit for p ≥ k (MotivicEtaleKTheory §12.8, `chernImageScaling`), and Soulé's Chern class map K_{2k−1}(F) ⊗ ℤ_p → H¹(O_F[1/p], ℤ_p(k)) is surjective, with K_{2k−1}(F) = K_{2k−1}(O_F) for k ≥ 2 and ranks agreeing by Borel (Huber–Kings, proof of Theorem 1.4.1, p. 14); this is Huber–Kings's form with R_k(F) = R_{Ω^K}(F). For odd p < k the lattice Ω^K carries the index term of the general statement.

**Checks.**

- For F = ℚ and k = 2: ζ(−1) = −1/12, the rank is 0 so R = 1 and ι_p = 1, H²(ℤ[1/p], ℤ_p(2)) is the p-part of K₂(ℤ) = ℤ/2 (trivial at odd p) and H¹(ℤ[1/p], ℤ_p(2))_tors is the p-part of w₂(ℚ) = 24; at p = 3 both sides equal −1, at p ≥ 5 both are 0.
- For F totally real and k even the rank r₂ is zero, R_Ω = 1 and ι_p = 1, and the formula is v_p(ζ_F(1 − k)) = v_p(#H²) − v_p(#H¹_tors) at odd p, the valuation form of SpecialValuesBirchTate §8.3.
- `lichtenbaum_index_term`: replacing Ω by pΩ multiplies R_Ω by p^{r} (r the rank) and ι_p by p^{r}, and both sides of the identity change by −r; dropping the index term would make the statement depend on the lattice.
- `lichtenbaum_chern_normalization`: for F = ℚ, k = 5 (rank one) and p = 3, the lattice c_{5,9}(K₉(ℤ)/tors) = 4!·ch₅(K₉(ℤ)/tors) has index term v₃(24) = 1 relative to the character lattice; this is why the K-theory form is stated for p ≥ k.

### 4.6 The elliptic data

State `ellipticFundamentalLine_data`: for an elliptic curve E over ℚ and an odd prime p with Sha(E/ℚ)[p^∞] finite, the data of §§1.5, 2.5 and 3.4 are the regulator, Kummer and Tamagawa identifications assumed by PeriodsAndSpecialValues PS.6.3: H¹_f = E(ℚ) ⊗ ℚ with the Néron–Tate pairing as δ, α_M the real period isomorphism, and ϑ_p built from the Kummer isomorphism E(ℚ) ⊗ ℚ_p ≅ H¹_f(ℚ, V_pE). Hence TamagawaCondition(h¹(E)(1), T_pE, p) is equivalent to the p-part of the Birch–Swinnerton-Dyer formula, by PeriodsAndSpecialValues PS.6.3 (`ellipticFundamentalLine_iff_bsd`), and its prime-by-prime transport is PS.6.4 (Fontaine §8.3(d), p. 230; Bloch–Kato Proposition 5.4, pp. 370–371). The analytic leading term of L(E, s) at s = 1 is a hypothesis of PS.6.3 unless a separate theorem supplies it, and so it is here. *Needs:* §§1.5, 2.5, 3.4 and 4.1; PeriodsAndSpecialValues PS.6.3–PS.6.4.

**Checks.**

- For rank zero with L(E, 1) ≠ 0 the statement is the p-part of L(E, 1)/Ω_E = #Sha · ∏_ℓ c_ℓ/#E(ℚ)_tors².
- Replacing a generator P by 3P in rank one multiplies the height determinant by 9, and the index correction of PS.6.3 restores the formula; the condition itself, being independent of lattices, does not change.
- At p = 2 nothing is claimed: PeriodsAndSpecialValues PS.4.4 applies.

### Examples

The Riemann zeta function: for ℚ(0) and ℚ(1) over ℚ the condition is the identity ζ(0) = −1/2 at odd primes and the residue 1 of ζ at s = 1. For ℚ(−1), ζ(−1) = −1/12, and the cohomological form compares 1/12 with #H²/#H¹_tors = 2/24 away from 2. For F = ℚ(√5) and k = 2, ζ_F(−1) = 1/30, which SpecialValuesBirchTate's examples compare with h₂/w₂ = 4/120.

### Dependencies

Layers 1–3; PeriodsAndSpecialValues PS.3–PS.6; MotivicEtaleKTheory §§4.3, 10.4–10.5, 12.3, 12.7 and 12.8; SpecialValuesBirchTate §§8.1–8.3; BorelRegulators §§4.2, 5.1, 5.3, 7.2 and 8.4; ArithmeticGaloisDuality §§R02.4.2, R02.4.4, D7.5 and D7.6; Mathlib's class number formula.

## Downstream consumers

Roadmaps that prove further cases of the Tamagawa number conjecture for K-theoretic motives — the Iwasawa-theoretic proof for abelian Artin motives, through the main conjecture and the cyclotomic elements, and Euler-system arguments for elliptic curves — state their conclusions in the form of §4.1, with the comparisons ϑ_∞ and ϑ_p of Layers 2–3 and the reformulations of §4.3. Roadmaps on special values of Artin L-functions at negative integers use the Lichtenbaum form of §4.5 with its lattice-index term.

## References

Page numbers are the printed page numbers of the published sources; for Huber–Kings they are the page numbers of arXiv:math/0101071v2, and for Kato they are the printed proceedings pages carried by arXiv:math/0304233v1.

- D. Burns and M. Flach, [*Tamagawa numbers for motives with (non-commutative) coefficients*](https://ems.press/content/serial-article-files/25892?nt=1), Documenta Mathematica **6** (2001), 501–570. §3.1, pp. 517–518 (motivic structures and the motivic cohomology of h^n(X)(r)); §3.2, pp. 519–523 (the Deligne complex (16), Conjecture 1 and (17), the local complexes (18)–(24), the nine-term diagram (26), Conjecture 2 and (27), the archimedean identification (28)); §3.3, pp. 523–526; §3.4, pp. 526–529 (the line Ξ(M), (29), Lemma 5, the comparisons ϑ_∞ and ϑ_p); §4.3, pp. 535–537 (Conjecture 4 and the following remarks).
- K. Kato, [*Tamagawa number conjecture for zeta values*](https://arxiv.org/abs/math/0304233), Proceedings of the ICM 2002, Vol. II, 163–171; arXiv:math/0304233v1. §1.2, p. 165; §2.1, (2.1.1)–(2.1.5) and (a)–(d), pp. 166–168.
- A. Huber and G. Kings, [*Bloch–Kato conjecture and Main Conjecture of Iwasawa theory for Dirichlet characters*](https://arxiv.org/abs/math/0101071), Duke Mathematical Journal **119** (2003), 393–464; arXiv:math/0101071v2. §1.1, pp. 3–6; Definitions 1.2.1–1.2.2 and Proposition 1.2.3, p. 7; Definition 1.2.4 and Proposition 1.2.5, p. 8; Lemma 1.2.6 and Definition 1.2.7, p. 9; Conjecture 1.2.8 and Proposition 1.2.9, p. 10; Proposition 1.2.10, p. 11; Theorem 1.4.1 and its proof, pp. 13–14; §1.5, Conjecture 1.5.2, pp. 14–15; §2.2, pp. 17–18 (Δ_loc, Proposition 2.2.3); Propositions 2.3.1–2.3.2 with the proof, pp. 18–21.
- J.-M. Fontaine, [*Valeurs spéciales des fonctions L des motifs*](http://www.numdam.org/item/SB_1991-1992__34__205_0/), Séminaire Bourbaki exposé 751, Astérisque **206** (1992), 205–249: the formulation of Fontaine and Perrin-Riou. §6, pp. 218–224; §7, pp. 224–226; §8, pp. 226–230; §9, pp. 230–234.
- S. Bloch and K. Kato, [*L-functions and Tamagawa numbers of motives*](https://math.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf), The Grothendieck Festschrift I, Progress in Mathematics **86** (1990), 333–400. Proposition 3.8 and Corollary 3.8.4, pp. 354–355; Example 3.9, p. 359; Definition 5.1, p. 369; (5.2), Conjecture 5.3 and Proposition 5.4, pp. 370–371.
- J. H. Silverman, *The Arithmetic of Elliptic Curves*, 2nd edition, Graduate Texts in Mathematics **106**, Springer, 2009. Chapter VIII, §9 (the canonical height, its quadratic form on E(K) ⊗ ℝ and the lattice argument for positive definiteness).
