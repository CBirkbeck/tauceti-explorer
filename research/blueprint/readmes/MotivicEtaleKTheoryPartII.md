# Roadmap: motivic and étale K-theory, part II — fundamental lines and special-value factors

**Summary.** MotivicEtaleKTheory constructs integral motivic cohomology, the Deligne and étale Chern regulators, the arithmetic determinant line Δ_p(T) = det⁻¹ RΓ_c(T) and the Selmer local determinant formula. PeriodsAndSpecialValues constructs the Burns–Flach fundamental line Ξ(M) of an abstract motive, its real and λ-adic trivializations under stated exactness and comparison hypotheses, the leading-term rationality predicate and the Tamagawa obstruction. This roadmap joins the two. For a motive M = h^i(X)(j) of a smooth projective variety over a number field it identifies every factor of Ξ(M) with K-theory or cycles, builds the real comparison ϑ_∞ from the Beilinson regulator and the p-adic comparison ϑ_p from the étale Chern character, proves both comparison hypotheses for every Tate twist of every Artin motive and for h¹(E)(1), and states Kato's rational zeta element condition. The condition is proved in the class number formula case, translated into the cohomological Lichtenbaum formula for h⁰(F)(1 − k), and connected with the Birch–Swinnerton-Dyer formula for h¹(E)(1).

## Scope and ownership

This roadmap owns:

- the K-theoretic motive datum (X, 𝒳, π, i, j, A) and its motivic factors H⁰_f, H¹_f with their weight vanishing, and the computation of these factors for Artin motives and elliptic motives (Layer 1);
- the real Deligne complex of a motive with its kernel–cokernel duality and its identification with Deligne cohomology, the Beilinson regulator sequence, the real exactness predicate, its proof for Artin motives and for h¹(E)(1), and the fundamental-line real comparison (Layer 2);
- the p-adic realization maps of the motivic factors into Bloch–Kato Selmer complexes, the p-adic realization predicate, its proof for Artin motives and its Sha criterion for h¹(E)(1), the Selmer complexes of Artin motives, and the fundamental-line p-adic comparison with its Euler-factor normalization (Layer 3);
- the Tamagawa condition (Kato's rational zeta element condition) for K-theoretic motives, its equivalence with the commutative Tamagawa obstruction, its lattice, place-set, duality and Selmer forms, the class number formula case, the cohomological Lichtenbaum form, and the elliptic data for the Birch–Swinnerton-Dyer formula (Layer 4).

### Prerequisites and boundaries

- **MotivicEtaleKTheory** supplies the higher Chow and cycle complexes (Layer 4), the rational weight decomposition (Layers 8–9), the étale comparison in arithmetic degrees (Layer 10, §10.5) and its dyadic extensions (Layer 11), the finite étale Chern classes and the normalized character (§12.1), the Deligne regulator and its number-field normalization (§§12.2–12.3), the integral motivic image (§12.3), the Selmer regulator factorization (§12.6), the arithmetic determinant line Δ_p(T) and the Selmer local determinant formula (§12.7) and the Chern lattice index (§12.8). Nothing here constructs a regulator, a Chern class or a determinant line of a complex again.
- **PeriodsAndSpecialValues** supplies the comparison determinant line and the infinity involution (PS.0), the Burns–Flach and Fukaya–Kato lines Ξ and Δ = Ξ⁻¹ with the real trivialization built from an exact-sequence witness (PS.3.1–PS.3.2), the leading coefficient and the rationality predicate (PS.3.3), the λ-adic lattice built from a supplied comparison, the finite lattice correction, the local Euler and Tamagawa identifications and the real dyadic restriction (PS.4), the commutative and equivariant Tamagawa obstruction with the zeta-isomorphism orientation (PS.5), and the elliptic Birch–Swinnerton-Dyer adapter (PS.6.3). This roadmap supplies, for K-theoretic motives, the motivic factors, the exact-sequence witnesses and the comparisons that those layers take as hypotheses.
- **BorelRegulators** supplies Borel's rank theorem (Layer 3), the real regulator isomorphism, its lattice, determinant and covolume (Layer 4), the leading coefficients of Dedekind zeta functions at negative integers with the functional-equation interface (Layer 5), Borel's regulator–zeta theorem (Layer 7) and the factor two between the Borel and Beilinson regulators (Layer 8).
- **ArithmeticKTheory** N.3 supplies finite generation of the K-groups of rings of S-integers.
- **MotivesAndAlgebraicCycles** MC.1–MC.2 supply Chow motives, Tate twists, duals and the Betti, de Rham and étale realizations with their comparisons and cycle classes.
- **SelmerIwasawaCohomology** L1–L2 and L4 supply Selmer complexes as mapping fibres, their duality and condition-change triangles, and the Bloch–Kato local conditions; **ArithmeticGaloisDuality** D7 and R02.4 supply compactly supported cochains with their perfectness, derived Poitou–Tate duality, the nine-term sequence and Tate's Euler characteristic formula.
- **PadicHodgeTheory** R06.5 supplies the de Rham comparison for proper smooth varieties; **PadicHodgeRegulators** D.2 supplies Soulé's étale regulator and the syntomic factorization.
- **EllipticRegulators** ER.6 owns the Beilinson statement for K₂ of an elliptic curve and the regulator on the integral part; it is the j = 2 instance of the real exactness predicate for h¹(E)(j).
- **TauCetiRoadmap EllipticCurves** Layers 0, 2, 6 and 7 supply the Abel–Jacobi isomorphism, the Weil pairing, Mordell–Weil with the canonical height, and Selmer groups with Sha. **TauCetiRoadmap HodgeStructures** L2 supplies Hodge symmetry and strictness. **TauCetiRoadmap PadicMeasuresIwasawaAlgebras** §5.1 supplies the graded determinant functor.
- From Mathlib at the pin: `NumberField.Units.rank`, `NumberField.Units.finrank_eq`, `NumberField.Units.logEmbedding`, `NumberField.Units.regulator`, `NumberField.Units.regulator_pos`, `NumberField.Units.torsionOrder`, `NumberField.classNumber`, `NumberField.discr`, `NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`, `NumberField.dedekindZeta_residue`, `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`, `Matrix.det`, `Matrix.det_smul`, `PadicInt`.

The general Burns–Flach line, the Tamagawa obstruction and the Bloch–Kato Tamagawa measure are PeriodsAndSpecialValues'; the regulators, Chern classes and Δ_p(T) are MotivicEtaleKTheory's; the theorems of Iwasawa theory that prove the Tamagawa condition for abelian fields belong to the Iwasawa roadmaps and to PeriodsAndSpecialValues PS.5.4. None is planned here.

## Conventions

**Motives.** K is a number field, X a smooth projective K-scheme of pure dimension d, 𝒳 a regular proper flat O_K-model recorded with X, π an idempotent Chow correspondence whose realizations are concentrated in degree i, j ∈ ℤ, and M = h^i(X)(j). The weight is w = i − 2j. The dual datum is M*(1) = h^{2d−i}(X)(d + 1 − j), of weight −2 − w. A motive over K is identified with its restriction of scalars to ℚ whenever a formula is written over ℚ; the factors, realizations and L-function do not change.

**Realizations.** H_v(M) = π H^i(σX(ℂ), (2πi)^j ℚ) at the archimedean place v = v(σ); G_v acts through the geometric infinity involution and complex conjugation of coefficients, never through the lattice conjugation of a Hodge structure. B⁺(M) = ⊕_{v|∞} H_v(M)^{G_v}. The de Rham realization has its Hodge filtration shifted by j, and t_M = H_dR(M)/F⁰. V_p = π H^i_et(X_K̄, ℚ_p(j)).

**Lines.** Determinants are those of TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1: d C = ⊗_i d(C^i)^{(−1)^i} with Koszul signs, and for [A --a--> A] in degrees 0, 1 the acyclic trivialization has image aA. The Burns–Flach line is

```text
Ξ_A(M) = d H⁰_f(K,M) · d H¹_f(K,M)⁻¹ · d (H¹_f(K,M*(1))^*) · d (H⁰_f(K,M*(1))^*)⁻¹ · ∏_{v|∞} d(H_v(M)^{G_v})⁻¹ · d t_M,
```

and Kato's line is Δ = Ξ⁻¹. ϑ_∞ maps Ξ ⊗ ℝ to the unit object and ϑ_p maps Ξ ⊗ ℚ_p to d RΓ_c(O_{K,S_p}, V_p); Kato's comparisons are their inverses.

**Places and coefficients.** S is a finite set of places of K containing the archimedean places and the places of bad reduction; S_p adds the places above p; RΓ_c(O_{K,S_p}, –) is the cone of global cochains over local cochains at S_p, shifted by −1. Integral statements are made for p odd, or for K without real places, as in PeriodsAndSpecialValues PS.4.4.

**Regulators.** The Beilinson regulator is MotivicEtaleKTheory's Deligne regulator in the Tate coordinate of BorelRegulators §8.4; the Borel regulator is twice it in each coordinate. The p-adic realization uses the normalized Chern character ch_j, not the Chern class c_{j,2j−1} = (−1)^{j−1}(j − 1)! ch_j.

## Exact supplier contracts

### From MotivicEtaleKTheory

`M.8/integral-motivic-structures`: the integral image I = im[H^a_M(𝒳, ℤ(j)) → H^a_M(X, ℤ(j))], its torsion-free quotient and its rational integral part, for a recorded regular model. `M.6/rational-weight-comparison` and `M.8/motivic-chern-character`: the Adams decomposition of K_n(X) ⊗ ℚ and the rational character. `M.4/cycle-complex`: higher Chow groups and their functoriality and products. `M.8/deligne-regulator`, `M.8/number-field-deligne-normalization`: the Deligne regulator and, for number fields, its target (∏_σ ℝ(j − 1))^{conj}. `M.8/finite-etale-chern`, `M.8/chern-functoriality`: étale Chern classes and their compatibility with the character. `M.8/selmer-regulator-factorization`: the factorization of the étale regulator through the syntomic regulator and the local finite conditions, with H¹_g as target in general. `M.7/arithmetic-adic-degrees`, `M.7/s-integer-comparison-range`, `M.7/dyadic-s-integer-extensions`: π_{2j−1} and π_{2j−2} of the p-completed K-theory of O_{F,S} are H¹ and H² of ℤ_p(j) for p odd or F totally imaginary, with the dyadic corrections otherwise. `M.8/arithmetic-fundamental-line` (its Δ_p(T) part only) and `M.8/selmer-local-determinant-comparison`: Δ_p(T) = det⁻¹ RΓ_c(T) with base change and triangle isomorphisms, and det⁻¹ C_f ≅ det⁻¹ C_c ⊗ ⊗_v det⁻¹ U_v^+ in the fixed order. These two are used without any PeriodsAndSpecialValues input.

### From PeriodsAndSpecialValues

`PS.0/comparison-period-line`, `PS.0/real-infinity`: Deligne's comparison I = β⁻¹ and the infinity involution. `PS.3/rational-fundamental-line`, `PS.3/real-regulator-trivialization`, `PS.3/leading-term-line`: Ξ_A(M) from supplied factors; θ_∞ from a supplied exact-sequence witness; the leading coefficient and LeadingTermRational. `PS.4/integral-fundamental-line`, `PS.4/finite-lattice-correction`, `PS.4/local-correction-adapter`, `PS.4/real-dyadic-gate`: I_λ(M, T, S) from a supplied θ_λ; independence of the lattice; the local identifications at v ∤ p and v | p with their Euler factors; the dyadic restriction. `PS.5/etnc-predicate`, `PS.5/equivariant-obstruction`, `PS.5/zeta-orientation-adapter`: the obstruction TΩ and its Fukaya–Kato orientation. `PS.6/elliptic-fundamental-adapter`, `PS.6/bsd-prime-assembly`: the equivalence of the weight −1 elliptic condition with BSD under the regulator, Kummer and Tamagawa identifications.

### From BorelRegulators

`R.3/borel-rank-theorem`; `R.4/regulator-real-isomorphism`, `R.4/regulator-transfer`, `R.4/regulator-adams-products`, `R.4/regulator-covolume`; `R.5/zeta-leading-coefficient`, `R.5/completed-zeta-conventions`, `R.5/leading-term-functional-equation`, `R.5/borel-zeta-proportionality`; `R.7/regulator-factor-two`.

### Other roadmaps

ArithmeticKTheory `N.3:finite-generation/finite-generation-of-K-of-S-integers`. MotivesAndAlgebraicCycles `MC.1/chow-motive`, `MC.1/tate-twist`, `MC.1/motives-rigid`, `MC.2/betti-realization`, `MC.2/de-rham-realization`, `MC.2/etale-realization`, `MC.2/homological-equivalence`, `MC.2/chern-character-cycle-map`, `MC.2/de-rham-betti-motivic-comparison`, `MC.2/etale-betti-motivic-comparison`. SelmerIwasawaCohomology `L1/derived-selmer-duality`, `L2/selmer-complex`, `L2/condition-change-triangle`, `L2/galois-selmer-group`, `L2/finite-condition-rational-duality`, `L2/selmer-structure-poitou-tate`, `L2/elliptic-selmer-instance`, `L4/bloch-kato-condition`, `L4/elliptic-finite-kummer`. ArithmeticGaloisDuality `D7/compact-support-cochains`, `D7/cochain-finiteness-perfectness`, `D7/derived-global-duality`, `R02.4/poitou-tate`, `R02.4/global-euler-characteristic`. PadicHodgeTheory `R06.5/proper-smooth-de-rham-comparison`. PadicHodgeRegulators `D.2/syntomic-etale-regulator-comparison`. EllipticRegulators `ER.6/the-beilinson-statement`, `ER.6/the-regulator-on-the-integral-part`.

## How to read the build

Layer 1 turns a variety, a model, a projector and a twist into the four motivic vector spaces of the fundamental line, and says which of them vanish in each weight. Layer 2 builds the archimedean side: the period map α_M, the regulator sequence and its exactness, which is a theorem for Artin motives and for h¹(E)(1) and an explicit predicate otherwise; the real comparison ϑ_∞ follows. Layer 3 does the same p-adically with the realization maps, whose bijectivity is Soulé's theorem for Artin motives and finiteness of Sha for h¹(E)(1); the p-adic comparison ϑ_p follows. Layer 4 combines ϑ_∞ and ϑ_p into the Tamagawa condition and proves or translates it in the cases where all inputs are theorems.

## Layer 1: motivic factors of K-theoretic motives

### 1.1 The K-theoretic motive datum

Define `KTheoreticMotive` as the tuple (K, X, 𝒳, π, i, j, A, φ) of the conventions, with φ : A → π(CH^d(X × X) ⊗ ℚ)π a ring homomorphism (MotivesAndAlgebraicCycles MC.1/chow-motive, MC.1/tate-twist, MC.1/motives-rigid). For X = Spec F with F/K finite the model is Spec O_F; for an elliptic curve E the projector is π¹ = Δ − e × E − E × e. Provide `KTheoreticMotive.weight` (w = i − 2j), `KTheoreticMotive.dualTwist` (M*(1) = (X, πᵗ, 2d − i, d + 1 − j) with coefficients A^op), `KTheoreticMotive.restrictScalars` (the same datum over ℚ), the constructors `KTheoreticMotive.ofArtin` (Spec F with an idempotent e of E-valued correspondences on h⁰(Spec F)) and `KTheoreticMotive.ofElliptic`, and `KTheoreticMotive.extendCoefficients` (extension along A → A ⊗_E E′, compatible with every construction below). The integer bookkeeping is `motiveWeight i j = i − 2j`, `dualDegree d i = 2d − i` and `dualTwist d j = d + 1 − j`, with `motiveWeight_dual` (the dual datum has weight −2 − w) and `dualDegree_dualTwist_involutive`. The realizations are those of MotivesAndAlgebraicCycles MC.2 (`betti-realization`, `de-rham-realization`, `etale-realization`) cut out by π (Burns–Flach §3.1, pp. 517–518; Kato 2003, §2.1, p. 167).

**Checks.**

- `weight_tate_two`: (Spec ℚ, Δ, 0, 2) has weight −4 and its dual datum has twist −1 and weight 2.
- `dualTwist_dualTwist`: the dual of the dual is the datum itself, because 2d − (2d − i) = i and d + 1 − (d + 1 − j) = j.
- `weight_elliptic_center`: h¹(E)(1) has weight −1 and is its own dual datum.
- `impure_projector_rejected`: the diagonal of E, with realizations in degrees 0, 1 and 2, is not an admissible π; its h⁰ summand would violate the weight vanishing of §1.3.

### 1.2 The motivic factors

Define `motivicFactorZero` H⁰_f(K, M) as π_* of codimension-j cycles modulo homological equivalence (Betti cohomology for the embeddings of K) when i = 2j, and 0 otherwise. Define `motivicFactorOne` H¹_f(K, M) by cases on 2j − i − 1: it is 0 when 2j − i − 1 < 0; π_*(CH^j(X)_{hom∼0} ⊗ ℚ) when 2j − i − 1 = 0; and when 2j − i − 1 > 0 it is π_* of the image of the Adams eigenspace (K_{2j−i−1}(𝒳) ⊗ ℚ)^{(j)} in (K_{2j−i−1}(X) ⊗ ℚ)^{(j)}, that is, of the rational integral part of MotivicEtaleKTheory §12.3 in motivic indexing H^{i+1}_M(X, ℚ(j)) (Burns–Flach §3.1, p. 518; Bloch–Kato §5, p. 369; Fontaine, §9.3, p. 231). A correspondence γ acts by pr_{2*}(pr_1^*(−) · γ) through the products, flat pullback and proper pushforward of higher Chow groups (MotivicEtaleKTheory M.4), so A acts. The factors of M*(1) are those of the dual datum.

Prove `motivicFactorOne_eq_zero_of_weight_nonneg` and `motivicFactorZero_eq_zero` (the two vanishing statements), `motivicFactorOne_spec` (for X = Spec F and j ≥ 1, H¹_f = K_{2j−1}(O_F) ⊗ ℚ, equal to K_{2j−1}(F) ⊗ ℚ for j ≥ 2), `motivicFactor_correspondence` ((γ′γ)_* = γ′_*γ_*, Δ_* = id) and `motivicFactor_restrictScalars`. Finite dimensionality of H¹_f is a hypothesis wherever a determinant is formed; it is a theorem for Artin motives and for h¹(E)(1). The integral part depends on the recorded model; its independence of the model, and its definition without a regular model through alterations, are not used.

**Checks.**

- `motivicFactorOne_rat_one`: for (Spec ℚ, 0, 1), H¹_f = ℤ^× ⊗ ℚ = 0, while K_1(ℚ) ⊗ ℚ = ℚ^× ⊗ ℚ is infinite-dimensional. A definition without the model image fails.
- `motivicFactorZero_point`: for (Spec F, 0, 0), H⁰_f = CH⁰(Spec F) ⊗ ℚ = ℚ.
- `motivicFactorOne_tate`: for (Spec F, 0, j), dim H¹_f is r₂ for even j ≥ 2, r₁ + r₂ for odd j ≥ 3 and r₁ + r₂ − 1 for j = 1.
- `motivicFactorOne_elliptic`: for h¹(E)(1), H¹_f = CH¹(E)_{hom∼0} ⊗ ℚ = E(K) ⊗ ℚ.

### 1.3 Weight vanishing and the shape of the line

Prove `weight_vanishing`: H¹_f(K, M) = 0 for w ≥ 0 and H⁰_f(K, M) = 0 for w ≠ 0. Applying this to M*(1) of weight −2 − w: for w ≤ −3 only H¹_f(K, M) survives among the motivic factors, so

```text
Ξ(M) = d H¹_f(K,M)⁻¹ · ∏_{v|∞} d(H_v(M)^{G_v})⁻¹ · d t_M;
```

for w = −2 only H¹_f(K, M) and H⁰_f(K, M*(1)); for w = −1 only H¹_f(K, M) and H¹_f(K, M*(1)); weights ≥ 0 are the duals (Fontaine §7.1, pp. 224–225; Burns–Flach (29), p. 526). For ℚ(2) over ℚ the line is d(K₃(ℤ) ⊗ ℚ)⁻¹ · d(B⁺)⁻¹ · d(t) with K₃(ℤ) ⊗ ℚ = 0; for ℚ(1) over ℚ the surviving motivic factor is H⁰_f(ℚ(0)) = ℚ.

### 1.4 Artin motives

Let V = e · h⁰(Spec F) ⊗ E be an Artin motive over ℚ with coefficients in a number field E, and r ∈ ℤ. Prove `artinMotiveFactors`: H⁰_f(V(r)) = 0 for r ≠ 0 and H⁰_f(V) = e(ℚ ⊗ E); H¹_f(V(r)) = 0 for r ≤ 0; for r ≥ 1, H¹_f(V(r)) = e(K_{2r−1}(O_F) ⊗ E), equal to e(K_{2r−1}(F) ⊗ E) for r ≥ 2 and to e(O_F^× ⊗ E) for r = 1. For V = h⁰(F) the dimensions are r₁ + r₂ − 1 at r = 1, r₂ at even r ≥ 2 and r₁ + r₂ at odd r ≥ 3; in general dim_E H¹_f(V(r)) = dim_E V_B(r − 1)^+ − dim_E H⁰_f(V^∨(1 − r)) for r ≥ 1.

The proof uses that K_{2r−1}(F) ⊗ ℚ is pure of Adams weight r (MotivicEtaleKTheory M.6/rational-weight-comparison; BorelRegulators R.4/regulator-adams-products), localization with the finite K-groups of finite fields to pass from O_F to F for r ≥ 2 (MotivicEtaleKTheory M.8/integral-motivic-structures), Borel's rank theorem (BorelRegulators R.3/borel-rank-theorem) and Dirichlet's unit theorem (Mathlib `NumberField.Units.finrank_eq`, `NumberField.Units.rank`), finite generation (ArithmeticKTheory N.3), and Galois equivariance for the idempotent (Huber–Kings §1.1, pp. 4–5; Fontaine §8.3(a)–(b), pp. 228–229).

Record the dimensions as `artinFactorRank K r` (Dirichlet's rank `NumberField.Units.rank K` in twist one, r₂ or r₁ + r₂ by parity in twists ≥ 2, zero otherwise) and the Betti plus dimension as `tatePlusDim K r` (r₁ + r₂ for even r, r₂ for odd r). Prove `artinFactorRank_add_tatePlusDim` (for r ≥ 2 the sum is [K:ℚ], the dimension of t_M) and `artinFactorRank_one_add` (in twist one, artinFactorRank + 1 + tatePlusDim = [K:ℚ]); these are the dimension counts of §2.4.

**Checks.** For F = ℚ, H¹_f(ℚ(r)) is one-dimensional for odd r ≥ 3 and zero for even r ≥ 2 and for r = 1 (`artinFactorRank_rat`). For F imaginary quadratic it is one-dimensional for every r ≥ 2 and zero for r = 1. The rank formula agrees with `r₁ + 2r₂ = [F:ℚ]` (Mathlib `NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`): for odd r ≥ 3, [F:ℚ] − r₂ = r₁ + r₂.

### 1.5 Elliptic motives

Let E be an elliptic curve over K with a regular proper model ℰ. Prove `ellipticMotiveFactors`: H⁰_f(h¹(E)(j)) = 0 for all j; H¹_f(h¹(E)(j)) = 0 for j ≤ 0; H¹_f(h¹(E)(1)) = π¹_*(CH¹(E)_{hom∼0} ⊗ ℚ) = E(K) ⊗ ℚ through P ↦ [P] − [O] (TauCetiRoadmap EllipticCurves Layer 0), finite-dimensional by Mordell–Weil (Layer 6); for j ≥ 2, H¹_f(h¹(E)(j)) is the π¹-part of the image of (K_{2j−2}(ℰ) ⊗ ℚ)^{(j)}, which for j = 2 is the integral part of K₂(E) ⊗ ℚ on which EllipticRegulators ER.6 restricts the regulator; and the Weil pairing (Layer 2) with the duality of Chow motives identifies h¹(E)(j)*(1) with h¹(E)(2 − j) (Fontaine §8.3(d), p. 230; Bloch–Kato Proposition 5.4, pp. 370–371). For rank zero the weight −1 line has no motivic factor; the symmetry j ↦ 2 − j has centre j = 1, matching L(h¹(E)(j), s) = L(E, s + j).

### Examples

h⁰(ℚ)(r): H¹_f is K_{2r−1}(ℤ) ⊗ ℚ, one-dimensional exactly for odd r ≥ 3; H⁰_f is ℚ in twist 0. For F real quadratic and r = 1, H¹_f is the line spanned by a fundamental unit. For h¹(E)(1) the factor is the Mordell–Weil group tensored with ℚ.

### Dependencies

MotivicEtaleKTheory Layers 4, 8–9 and §12.3; MotivesAndAlgebraicCycles MC.1–MC.2; BorelRegulators Layers 3–4; ArithmeticKTheory N.3; TauCetiRoadmap EllipticCurves Layers 0, 2 and 6; PeriodsAndSpecialValues PS.3.1; Mathlib's unit theorem.

## Layer 2: real regulators and the fundamental-line real comparison

### 2.1 The real Deligne complex

Define `delignePeriodMap` α_M : B⁺(M) ⊗ ℝ → t_M ⊗ ℝ, induced by the comparison H_v(M) ⊗ ℂ ≅ H_dR(M) ⊗_{K,σ} ℂ (PeriodsAndSpecialValues PS.0/comparison-period-line and PS.0/real-infinity; MotivesAndAlgebraicCycles MC.2/de-rham-betti-motivic-comparison), and the two-term complex RΓ_D(K, M) = [B⁺(M)_ℝ → t_{M,ℝ}] in degrees 0, 1 (Burns–Flach (16), p. 519). Prove `delignePeriodMap_injective` (w ≤ −1), `delignePeriodMap_surjective` (w ≥ −1), `delignePeriodMap_ker_dual` (ker(α_M)^* ≅ coker(α_{M*(1)}) and coker(α_M)^* ≅ ker(α_{M*(1)})), `delignePeriodMap_coker_eq_deligne` (for w ≤ −2, coker α_M is the G_ℝ-invariant real Deligne cohomology H^{i+1}_D(X_{/ℝ}, ℝ(j))_π, the target of MotivicEtaleKTheory's Deligne regulator), `delignePeriodMap_finrank_coker` (dim coker α_M = dim t_M − dim B⁺(M) for w ≤ −2) and `delignePeriodMap_artin` (for V(r), r ≥ 1, coker α = V_dR(r)_ℝ/V_B(r)^+_ℝ ≅ V_B(r − 1)^+_ℝ through ℂ = ℝ ⊕ ℝ(−1)) (Fontaine §9.2, p. 231; Huber–Kings §1.1, p. 5).

Injectivity in negative weight is Hodge symmetry: a real class in F⁰ lies in F⁰ ∩ conj(F⁰) = ⊕_{p,q≥0} H^{p,q}, which is zero when p + q < 0 (TauCetiRoadmap HodgeStructures L2). The Deligne identification uses the long exact sequence of the Deligne complex ℤ(j)_D, in which H^{i+1}(X, ℝ(j)) ∩ F^j vanishes for weight reasons when i + 1 < 2j.

**Checks.**

- `delignePeriodMap_rat_one`: for ℚ(1) over ℚ the infinity involution acts by −1, so B⁺ = 0, t = ℚ and coker α = ℝ, matching H⁰_f(ℚ(0))^* ⊗ ℝ.
- `delignePeriodMap_rat_zero`: for ℚ(0) over ℚ, t = 0 and B⁺ = ℚ, so ker α = ℝ and coker α = 0.
- `delignePeriodMap_rat_three`: for ℚ(3) over ℚ, dim coker α = 1 = dim K₅(ℤ) ⊗ ℚ.
- `delignePeriodMap_wrong_involution`: with the lattice conjugation in place of the infinity involution, B⁺(ℚ(3)) = ℚ and coker α = 0, contradicting dim K₅(ℤ) ⊗ ℚ = 1.

### 2.2 The Beilinson regulator sequence

Define the sequence

```text
0 → H⁰_f(K,M)_ℝ --ε--> ker α_M --r_B*--> H¹_f(K,M*(1))^*_ℝ --δ--> H¹_f(K,M)_ℝ --r_B--> coker α_M --ε*--> H⁰_f(K,M*(1))^*_ℝ → 0
```

with `cycleClassReal` ε the Betti cycle class (MotivesAndAlgebraicCycles MC.2/chern-character-cycle-map), `beilinsonRegulatorReal` r_B the Deligne regulator of MotivicEtaleKTheory (M.8/deligne-regulator with M.8/number-field-deligne-normalization) on the integral part followed by `delignePeriodMap_coker_eq_deligne`, the transposed maps for M*(1), and `heightPairingReal` δ in weight −1: the Néron–Tate pairing for h¹(E)(1) (TauCetiRoadmap EllipticCurves Layer 6), a supplied pairing for other weight −1 data (Burns–Flach Conjecture 1 and (17), p. 519; Fontaine §8.3(a), pp. 228–229, and §9.6, p. 233). Prove `beilinsonRegulatorReal_artin` (for h⁰(F)(r), r ≥ 2, r_B is the Beilinson regulator of BorelRegulators §8.4, one half of the Borel regulator), `beilinsonRegulatorReal_units` (for h⁰(F)(1), r_B is the logarithmic embedding of units, Mathlib `NumberField.Units.logEmbedding`, with the normalized absolute values) and `realRegulatorSequence_dual` (the ℝ-dual of the sequence is the sequence of M*(1)).

The Beilinson–Bloch height pairing on CH^j(X)_{hom∼0} for general weight −1 motives is not constructed by any roadmap; in this roadmap it is a datum except for h¹ of elliptic curves.

**Checks.**

- `beilinsonRegulatorReal_units_product_formula`: for F real quadratic with fundamental unit ε₀, r_B(ε₀) = (log|ε₀|, −log|ε₀|) and its sum is 0, by the product formula for units.
- `realRegulatorSequence_rat_one`: for ℚ(1) over ℚ the sequence is the identity of ℝ = coker α_M.
- `beilinsonRegulatorReal_not_borel`: the Borel regulator is twice r_B in each Tate coordinate; exactness is unchanged but the determinant changes by 2^{d_r}.
- `heightPairingReal_elliptic`: for h¹(E)(1), the determinant of δ on a ℤ-basis of E(K)/tors is the regulator Reg_E.

### 2.3 The real exactness predicate

Define `RealExactness M`: the factors of M and of M*(1) are finite-dimensional, the sequence of §2.2 is exact, and its ℝ-dual is the sequence of M*(1) (Burns–Flach Conjecture 1, p. 519; Fontaine §9.3, p. 231). By §1.3 it says: for w ≤ −3, r_B is an isomorphism H¹_f(K, M)_ℝ ≅ coker α_M (Beilinson's conjecture); for w = −2, 0 → H¹_f(K,M)_ℝ → coker α_M → H⁰_f(K,M*(1))^*_ℝ → 0 is exact; for w = −1, δ is an isomorphism; for w ≥ 0, the dual statements. Prove `realExactness_dual`, `realExactness_iff_regulator_iso` (w ≤ −3), `realExactness_finrank` (dim H¹_f = dim coker α_M − dim H⁰_f(M*(1)) when w ≤ −2), `realExactness_directSum` and `realExactness_restrictScalars`.

**Checks.**

- `realExactness_rat_one`: holds for ℚ(1) over ℚ.
- `realExactness_tate_two_rational`: for ℚ(2) over ℚ, K₃(ℤ) ⊗ ℚ = 0 and α_M is multiplication by (2πi)² = −4π², an isomorphism of ℝ; the predicate holds with both sides zero.
- `realExactness_wrong_map`: for h⁰(F)(3), F real quadratic, the zero map between the two-dimensional spaces H¹_f ⊗ ℝ and coker α is not exact; the predicate concerns r_B, not an arbitrary map.
- `realExactness_elliptic_height`: for h¹(E)(1) the predicate is nondegeneracy of the Néron–Tate pairing on E(K) ⊗ ℝ.

### 2.4 Real exactness for Artin motives

Prove `realExactness_artin`: for every Artin motive V and every r ∈ ℤ, RealExactness(V(r)). For r ≥ 1 the sequence is 0 → H¹_f(V(r))_ℝ → V_B(r − 1)^+_ℝ → H⁰_f(V^∨(1 − r))^∨_ℝ → 0, whose last term vanishes unless r = 1; for r ≤ 0 it is 0 → H⁰_f(V(r))_ℝ → V_B(r)^+_ℝ → H¹_f(V^∨(1 − r))^∨_ℝ → 0 (Huber–Kings Proposition 1.2.3, p. 7, and §1.1, p. 5; Fontaine §8.3(a)–(b), pp. 228–229). For r ≥ 2 use Borel's theorem that the Borel regulator is a real isomorphism (BorelRegulators R.4/regulator-real-isomorphism), the factor two (R.7/regulator-factor-two), §2.1 for the target and Galois equivariance for the idempotent (R.4/regulator-transfer). For r = 1 use Dirichlet's unit theorem: the logarithmic embedding of O_F^× ⊗ ℝ is an isomorphism onto the trace-zero hyperplane (Mathlib `NumberField.Units.logEmbedding`, `NumberField.Units.finrank_eq`, `NumberField.Units.regulator_pos`). For r ≤ 0 dualize.

**Checks.** For F = ℚ and r = 3 the regulator of a generator of K₅(ℤ) ⊗ ℚ is nonzero and the sequence is an isomorphism of lines. For F real quadratic and r = 1 the sequence is 0 → ℝ log ε₀ → ℝ² → ℝ → 0.

### 2.5 Real exactness for elliptic motives

Prove `realExactness_elliptic`: for E over a number field K, RealExactness(h¹(E)(1)) holds, because α_M is an isomorphism in weight −1, the H⁰ factors vanish, H¹_f(M) = H¹_f(M*(1)) = E(K) ⊗ ℚ and δ is the positive definite Néron–Tate pairing (TauCetiRoadmap EllipticCurves Layer 6; Fontaine §8.3(d), p. 230). For j ≥ 2, RealExactness(h¹(E)(j)) is equivalent to finite dimensionality of H¹_f(h¹(E)(j)) together with bijectivity of r_B ⊗ ℝ onto H²_D(E_{/ℝ}, ℝ(j)), of dimension [K:ℚ]: t_M = H¹_dR(E/K) has ℚ-dimension 2[K:ℚ] because F^j H¹_dR(E) = 0, and B⁺ has dimension r₁ + 2r₂ = [K:ℚ]. For K = ℚ and j = 2 this is the rational form of EllipticRegulators ER.6/the-beilinson-statement; no case with j ≥ 2 is asserted. For j ≤ 0, RealExactness(h¹(E)(j)) ↔ RealExactness(h¹(E)(2 − j)).

**Checks.** For E/ℚ of rank zero, the statement is the exactness of 0 → 0 with α_M the real period. For rank one with generator P, δ is multiplication by ĥ(P) > 0.

### 2.6 The fundamental-line real comparison

Define `fundamentalLineRealComparison` ϑ_∞(M) : Ξ_A(M) ⊗ ℝ ≅ 1 for M with RealExactness(M): the realTrivialization of PeriodsAndSpecialValues PS.3.2 applied to the sequence of §2.2 and to 0 → ker α_M → B⁺_ℝ → t_{M,ℝ} → coker α_M → 0, in the fixed order of the factors of Ξ (Burns–Flach §3.4, p. 529; Kato 2003, §2.1(b), p. 168). Prove `fundamentalLineRealComparison_coordinate` (in bases, the signed product of the regulator, cycle-class and height determinants with the period determinant; Mathlib `Matrix.det`, `Matrix.det_smul`), `fundamentalLineRealComparison_artin` (for h⁰(F)(1 − k), k ≥ 2, ϑ_∞ sends a generator of det⁻¹ Ω ⊗ det⁻¹ T_B(1 − k)^+ to ±R_k(F)⁻¹, where Ω = K_{2k−1}(O_F)/tors and R_k(F) is the Beilinson regulator covolume; Huber–Kings, proof of Theorem 1.4.1, pp. 13–14), `fundamentalLineRealComparison_dual` (compatibility of ϑ_∞(M) and ϑ_∞(M*(1)) with the local line of Huber–Kings §2.2), `fundamentalLineRealComparison_borel` (the Borel normalization multiplies the coordinate by 2^{d_r}) and `fundamentalLineRealComparison_restrictScalars`.

**Checks.**

- `fundamentalLineRealComparison_rat_one`: for ℚ(1) over ℚ, Ξ = d(H⁰_f(ℚ(0))^*)⁻¹ ⊗ d(t) and ϑ_∞ sends 1^* ⊗ 1 to 1.
- `fundamentalLineRealComparison_real_quadratic`: for h⁰(F)(1), F real quadratic, B⁺ = 0 and t_M = F; the generator ε₀⁻¹ ⊗ (1^*)⁻¹ ⊗ (1 ∧ ω), with (1, ω) a ℤ-basis of O_F, has coordinate ±√d_F/R_F, R_F = log ε₀ the regulator (Mathlib `NumberField.Units.regulator`). With ζ_F^*(1) = 2h_F R_F/√d_F, the element δ of §4.1 is ±(2h_F)⁻¹ times this generator.
- `fundamentalLineRealComparison_odd_swap`: swapping two odd-degree line factors multiplies ϑ_∞ by −1; a formula in ungraded lines cannot record the ordering used in the comparison.
- `fundamentalLineRealComparison_borel_factor`: for F imaginary quadratic and r = 2 (d_r = 1) the Borel coordinate is twice the Beilinson coordinate.

### Examples

For ℚ(3) over ℚ the comparison is the isomorphism d(K₅(ℤ) ⊗ ℚ)⁻¹ ⊗ d(ℚ) ≅ ℝ given by the Beilinson regulator of a generator. For h⁰(F)(1) it is the unit regulator together with the discriminant from the lattice O_F in t_M. For h¹(E)(1) it is the Néron–Tate regulator together with the real period.

### Dependencies

Layer 1; MotivicEtaleKTheory §§12.2–12.3; PeriodsAndSpecialValues PS.0, PS.3.1–PS.3.2; BorelRegulators Layers 4 and 8; EllipticRegulators ER.6; MotivesAndAlgebraicCycles MC.2; TauCetiRoadmap HodgeStructures L2 and EllipticCurves Layer 6; TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1.

## Layer 3: p-adic realizations and the fundamental-line p-adic comparison

### 3.1 The p-adic realization maps

Define `padicRealizationZero` c⁰_p : H⁰_f(K,M) ⊗ ℚ_p → H⁰(K, V_p) by the p-adic cycle class, and `padicRealizationOne` c¹_p : H¹_f(K,M) ⊗ ℚ_p → H¹(K, V_p) as follows. If 2j − i − 1 > 0, apply the normalized étale Chern character of K_{2j−i−1}(X)^{(j)} into H^{i+1}_et(X, ℚ_p(j)) (MotivicEtaleKTheory M.8/finite-etale-chern, M.8/motivic-chern-character, M.8/chern-functoriality, with continuous coefficients from M.7/arithmetic-adic-degrees) and the Hochschild–Serre edge; the obstruction H^{i+1}(X_K̄, ℚ_p(j))^{G_K} vanishes for i + 1 ≠ 2j by the Weil conjectures. If 2j − i − 1 = 0, use the p-adic Abel–Jacobi map, which is the Kummer map for h¹(E)(1) (Bloch–Kato (5.2), p. 370; Fontaine §9.4, pp. 231–232; Burns–Flach (27), p. 523).

Prove `padicRealizationOne_mem_g` (the image of the integral part lies in H¹_g, by the syntomic factorization of PadicHodgeRegulators D.2/syntomic-etale-regulator-comparison and MotivicEtaleKTheory M.8/selmer-regulator-factorization), `padicRealizationOne_mem_f` (the image lies in H¹_f when H¹_f = H¹_g at every v | p; this holds for Artin motives of positive twist, for h¹(E)(1), and in weights ≤ −3 at good reduction because D_cris(V_p^*(1))^{φ=1} = 0 by purity of Frobenius weights; Bloch–Kato Proposition 3.8 and Corollary 3.8.4, pp. 354–355), `padicRealizationOne_units` (the Kummer map on O_F^× for h⁰(F)(1), compatible with Tau Ceti's finite-level Kummer map), `padicRealizationOne_kummer_elliptic` and `padicRealization_restrictScalars`. Outside the listed cases, the inclusion in H¹_f is a hypothesis of the statements that use c¹_p.

**Checks.**

- `padicRealizationOne_rat_even`: for ℚ(j) over ℚ with even j ≥ 2 both sides vanish: K_{2j−1}(ℤ) ⊗ ℚ = 0 and H¹(ℤ[1/p], ℚ_p(j)) has dimension r₂ = 0.
- `padicRealizationOne_units_degenerate`: for F = ℚ in twist one, source and target are zero.
- `padicRealizationOne_factorial`: with c_{j,2j−1} in place of the character, c¹_p is multiplied by (−1)^{j−1}(j − 1)!; rational bijectivity is unchanged, integral images change by that factor (MotivicEtaleKTheory §12.8, `chernImageScaling`).
- `padicRealizationOne_uniformizer`: for ℚ_p(1) a uniformizer class lies outside the local H¹_f and a unit class inside, so a definition landing in full H¹ in twist one is wrong.

### 3.2 The p-adic realization predicate

Define `PadicRealizationIso M p`: c⁰_p and c¹_p are isomorphisms H⁰_f(K,M) ⊗ ℚ_p ≅ H⁰ RΓ_f(K, V_p) and H¹_f(K,M) ⊗ ℚ_p ≅ H¹ RΓ_f(K, V_p), and likewise for M*(1); then H² RΓ_f and H³ RΓ_f are identified with the duals of the M*(1) factors through RΓ_f(K, V_p) ≅ RΓ_f(K, V_p^*(1))^*[−3] (Burns–Flach Conjecture 2, p. 523, and p. 525; Bloch–Kato Conjecture 5.3, p. 370). Here RΓ_f is the Selmer complex of SelmerIwasawaCohomology L2/selmer-complex with the Bloch–Kato conditions L4/bloch-kato-condition, and the duality is L1/derived-selmer-duality with L2/finite-condition-rational-duality. Prove `padicRealizationIso_dual`, `padicRealizationIso_finrank` and `padicRealizationIso_directSum`.

**Checks.**

- `padicRealizationIso_unit_motive`: for ℚ(0) over ℚ, c⁰_p is the identity of ℚ_p and H¹_f vanishes on both sides.
- `padicRealizationIso_elliptic_sha`: for h¹(E)(1) the predicate at p holds exactly when Sha(E/K)[p^∞] is finite (§3.4).
- `padicRealizationIso_dimension_only`: equal dimensions do not witness the predicate; the zero map between spaces of equal positive dimension is not an isomorphism.

### 3.3 Artin motives

Prove `padicRealization_artin`: for every Artin motive V, every r ∈ ℤ and every prime p, PadicRealizationIso(V(r), p) (Huber–Kings §1.1, pp. 5–6; Bloch–Kato §5, p. 370, and Example 3.9, p. 359). For r ≥ 2 and p odd, MotivicEtaleKTheory §10.5 identifies π_{2r−1} and π_{2r−2} of the p-completed K-theory of O_F[1/p] with H¹ and H² of ℤ_p(r); finite generation (ArithmeticKTheory N.3) identifies them with K_n(O_F[1/p]) ⊗ ℤ_p; Borel's ranks give K_{2r−2}(O_F) ⊗ ℚ = 0 and hence H²(O_F[1/p], ℚ_p(r)) = 0; and localization identifies O_F[1/p] with O_F rationally. At p = 2 the same rational statements follow from MotivicEtaleKTheory Layer 11, whose real-place corrections are 2-torsion. The local conditions are automatic: for r ≥ 2 the local H¹_f is all of H¹ at v | p, and the unramified condition at v ∤ p holds rationally, so H¹_f(F, ℚ_p(r)) = H¹(O_F[1/p], ℚ_p(r)). For r = 1 use Kummer theory with the finiteness of the class group. For r ≤ 0 use the self-duality of the predicate.

**Checks.** For F = ℚ and r = 3 both sides are one-dimensional over ℚ_p. For r = 0 and V = h⁰(F), c⁰_p is ℚ ⊗ ℚ_p ≅ H⁰(F, ℚ_p).

### 3.4 Elliptic motives

Prove `padicRealization_elliptic`: for E over K and any p, c¹_p for h¹(E)(1) is the Kummer map E(K) ⊗ ℚ_p → H¹_f(K, V_pE); it is injective, and surjective exactly when Sha(E/K)[p^∞] is finite, so PadicRealizationIso(h¹(E)(1), p) holds if and only if Sha(E/K)[p^∞] is finite (Bloch–Kato Proposition 5.4, pp. 370–371; Fontaine §8.2, pp. 227–228; SelmerIwasawaCohomology L4/elliptic-finite-kummer and L2/elliptic-selmer-instance; TauCetiRoadmap EllipticCurves Layer 7). For j ≥ 2 the predicate is Bloch–Kato Conjecture 5.3 for h¹(E)(j) and is not asserted. For E/ℚ with Sha(E/ℚ)[p^∞] finite and rank r, dim H¹_f(ℚ, V_pE) = r.

### 3.5 Selmer complexes of Artin motives

Prove `selmerComplex_artin`: for V Artin, S finite and p prime, RΓ_f(ℤ[1/Sp], V_p(r)) is concentrated in degree 1 with H¹ = H¹(ℤ[1/Sp], V_p(r)) for r > 1; in degrees 1 and 3 for r = 1, with a triangle H¹_f[−1] → RΓ_f → H⁰(ℤ[1/Sp], V_p^∨)^∨[−3]; in degree 2 for r < 0, with H² ≅ H¹(ℤ[1/Sp], V_p^∨(1 − r))^∨; and in degrees 0 and 2 for r = 0, with a triangle H⁰(ℤ[1/Sp], V_p) → RΓ_f → H¹_f(ℤ[1/Sp], V_p^∨(1))^∨[−2]. There is a triangle RΓ_c(ℤ[1/Sp], V_p(r)) → RΓ_f(ℤ[1/Sp], V_p(r)) → V_p(r)^+ ⊕ ⊕_{v∈Sp} RΓ_f(ℚ_v, V_p(r)) (Huber–Kings Lemma 1.2.6, p. 9; Burns–Flach (26), p. 522). The proof is Poitou–Tate for the Selmer complex (ArithmeticGaloisDuality R02.4/poitou-tate; SelmerIwasawaCohomology L2/selmer-structure-poitou-tate) with the local dimensions of Bloch–Kato Example 3.9 and the vanishing of H² in twists > 1 from §3.3. For V = ℚ and r = 2 the complex is acyclic; for V = ℚ and r = 0, H⁰ = ℚ_p and H² = H¹_f(ℚ, ℚ_p(1))^∨ = 0.

### 3.6 The fundamental-line p-adic comparison

Define `fundamentalLinePadicComparison` ϑ_p(M, S) : Ξ_A(M) ⊗ ℚ_p ≅ d_{A_p} RΓ_c(O_{K,S_p}, V_p) for M with PadicRealizationIso(M, p), by applying the determinant functor to: the isomorphisms c^i_p, i = 0, 1, 2, 3; the Betti–étale comparison (H_v(M) ⊗ ℚ_p)^{G_v} ≅ H⁰(K_v, V_p) at v | ∞ (MotivesAndAlgebraicCycles MC.2/etale-betti-motivic-comparison); the de Rham comparison t_M ⊗ ℚ_p ≅ ⊕_{v|p} t_v(V_p) (PadicHodgeTheory R06.5/proper-smooth-de-rham-comparison); the local trivializations of RΓ_f(K_v, V_p) at v ∈ S_{p,f} by the identity isomorphism of [V → V], not by acyclicity (PeriodsAndSpecialValues PS.4/local-correction-adapter); and the triangle RΓ_c → RΓ_f(K, V_p) → ⊕_{v∈S_p} RΓ_f(K_v, V_p) built from ArithmeticGaloisDuality D7/compact-support-cochains and SelmerIwasawaCohomology L2/selmer-complex, L2/condition-change-triangle (Burns–Flach (19)–(26), pp. 520–523, and §3.4, p. 526; Kato 2003, §2.1(c), p. 168). For an Artin motive V(r) this is the isomorphism of Huber–Kings Definition 1.2.7, p. 9; at p the identity trivialization equals the acyclic one times the Euler factor P_p(V, p^{−r}) when 1 − φ is invertible on D_cris (Huber–Kings Proposition 1.2.5, p. 8). At p = 2 with real places of K, the modified compact-support complex of PeriodsAndSpecialValues PS.4.4 is used and no integral statement is made.

Prove `fundamentalLinePadicComparison_enlargeS` (compatibility with S ⊂ S′ through the local Euler trivializations; Burns–Flach Lemma 5, pp. 526–528), `fundamentalLinePadicComparison_eulerFactor`, `fundamentalLinePadicComparison_dual` (compatibility with Ξ(M*(1)) and global duality), `fundamentalLinePadicComparison_artin` and `fundamentalLinePadicComparison_restrictScalars`.

**Checks.**

- `fundamentalLinePadicComparison_identity_trivialization`: for [V --(1 − Fr_v⁻¹)--> V] with 1 − Fr_v⁻¹ invertible, ϑ_p uses the identity isomorphism [V → V] ≅ 1; the acyclic trivialization differs by det(1 − Fr_v⁻¹ | V), so using it changes ϑ_p by the local Euler factor.
- `fundamentalLinePadicComparison_euler_unit`: for V = ℚ, k = 2, p = 3, the Euler factor 1 − 3 = −2 is a 3-adic unit.
- `fundamentalLinePadicComparison_zero_complex`: when every factor vanishes, both sides are the unit line and ϑ_p is the identity.
- `fundamentalLinePadicComparison_not_any_iso`: an arbitrary isomorphism of the two one-dimensional spaces does not define the integral condition; multiplying by p preserves rationality and changes the image lattice.

### Examples

For h⁰(F)(r), r ≥ 2, ϑ_p identifies d(K_{2r−1}(O_F) ⊗ ℚ_p)⁻¹ ⊗ d(B⁺ ⊗ ℚ_p)⁻¹ ⊗ d(t_M ⊗ ℚ_p) with d RΓ_c(O_{F,S_p}, ℚ_p(r)), through Soulé's Chern class isomorphism, the vanishing of H², the de Rham comparison t_M ⊗ ℚ_p = F ⊗ ℚ_p and the Euler factors at S_p. For h¹(E)(1) with Sha[p^∞] finite, ϑ_p is built from the Kummer isomorphism and the self-duality of V_pE.

### Dependencies

Layer 1; MotivicEtaleKTheory §§10.5, 11 and 12.1, 12.6–12.7; ArithmeticKTheory N.3; PadicHodgeRegulators D.2; PadicHodgeTheory R06.5; SelmerIwasawaCohomology L1–L2, L4; ArithmeticGaloisDuality D7, R02.4; PeriodsAndSpecialValues PS.4.3–PS.4.4; MotivesAndAlgebraicCycles MC.2; BorelRegulators Layer 3; TauCetiRoadmap EllipticCurves Layer 7; TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1.

## Layer 4: zeta elements, the Tamagawa condition and its proved cases

### 4.1 The Tamagawa condition

Let M be a K-theoretic motive datum over ℚ with coefficients in a number field E, with RealExactness(M) and PadicRealizationIso(M, p), and let L*(M, 0) ∈ (E ⊗ ℝ)^× be the leading coefficient of its finite L-function at s = 0 (PeriodsAndSpecialValues PS.3.3), supplied by the owner of its continuation. Define `tamagawaElement` δ(M) ∈ Ξ_E(M) ⊗ ℝ by ϑ_∞(L*(M,0) · δ(M)) = 1, and `TamagawaCondition M T_p p`: δ(M) lies in Ξ_E(M), and ϑ_p(M, S)(δ(M)) generates the O_p-lattice d_{O_p} RΓ_c(O_{K,S_p}, T_p) for a Galois-stable lattice T_p ⊂ V_p (Kato 2003, §2.1, (2.1.1)–(2.1.5) and (a)–(d), pp. 166–168; Huber–Kings Definition 1.2.1 and Conjecture 1.2.8, pp. 7 and 10; Fontaine §6, pp. 218–223, and §7, pp. 224–226). Integral statements are for p odd or K without real places.

The integral clause is lattice generation, `IsLatticeGenerator L x : Submodule.span R {x} = L`. Prove `tamagawaCondition_iff_kato` (equivalence with Kato's condition: an E-basis ζ(M) = δ(M)^{⊗(−1)} of Δ_E(M) with real image L* and p-adic image an O_p-basis of d⁻¹_{O_p} RΓ_c(T_p) = Δ_p(T), using MotivicEtaleKTheory's Δ_p(T)), `tamagawaCondition_rational` (it implies LeadingTermRational), `tamagawaCondition_unit_invariant`, `tamagawaCondition_extendCoefficients` and `tamagawaCondition_directSum`.

**Checks.**

- `tamagawaCondition_rational_not_integral`: in the line ℚ_p with lattice ℤ_p, the element p is a rational basis and not an integral basis (`¬ IsLatticeGenerator (span ℤ_p {1}) p`, while 1 generates); δ and pδ are both rational and at most one satisfies the integral clause.
- `tamagawaCondition_two_term`: for [ℤ_p --p^s--> ℤ_p] in degrees 0, 1 the acyclic trivialization sends the determinant lattice to p^sℤ_p and the inverse lattice to p^{−s}ℤ_p, of valuation −s = −length H¹; this fixes the inversion convention of the integral clause.
- `tamagawaCondition_zero_complex`: if RΓ_c(T_p) has zero cohomology its lattice is O_p, and the condition asks that ϑ_p(δ) be a unit.
- `tamagawaCondition_riemann_zero`: for ℚ(0) over ℚ and odd p the condition reduces to v_p(ζ(0)) = 0, true since ζ(0) = −1/2.

### 4.2 Comparison with the Tamagawa obstruction

Prove `tamagawaCondition_iff_etnc`: with commutative coefficients E and O = O_E, and with θ_∞ = ϑ_∞(M), θ_p = ϑ_p(M, S) in PeriodsAndSpecialValues PS.4.1 and PS.5.1, TamagawaCondition(M, T_p, p) holds for every p in a set Σ of odd primes if and only if the p-parts of the commutative Tamagawa obstruction TΩ(M, O) of PS.5.2 vanish for p ∈ Σ, that is, θ_∞ carries the λ-adic lattice I_p(M, T, S) onto (L*)⁻¹ O_p; for Σ the set of all odd primes it is equivalent to the Fukaya–Kato orientation of PS.5.3 with these comparisons (Burns–Flach §4, Conjecture 4 and the following remarks, pp. 535–537; Huber–Kings Proposition 1.2.9(b), p. 10, and §1.5, pp. 14–15). For E = ℚ it is an equality of ℤ_p-lattices in a ℚ_p-line, one prime at a time.

### 4.3 Lattice, place-set, duality and Selmer forms

Prove `tamagawaCondition_alternative_forms`: (a) the condition is independent of T_p and of S, by Tate's Euler characteristic formula for the finite quotient of two lattices (ArithmeticGaloisDuality R02.4/global-euler-characteristic; PeriodsAndSpecialValues PS.4/finite-lattice-correction) and by the localization triangle for S ⊂ S′; (b) for p odd, the integral structures d RΓ_c(O_{K,S_p}, T_p) ⊗ d(T_p^+) and d RΓ(O_{K,S_p}, T_p^∨(1)) agree under derived Poitou–Tate duality (ArithmeticGaloisDuality D7/derived-global-duality), so the condition can be stated with RΓ(O_{K,S_p}, T_p^∨(1)), which is Kato's formulation; at p = 2 one uses τ_{≤2}RΓ and Tate cohomology at the real places; (c) with the Selmer mapping fibre C_f(T_p), its local conditions U_v^+, MotivicEtaleKTheory's formula det⁻¹ C_f ≅ det⁻¹ C_c ⊗ ⊗_v det⁻¹ U_v^+ and the local identifications of PeriodsAndSpecialValues PS.4.3, the condition says that ϑ_p(δ), tensored with the generators of the lattices d U_v^+ given by their local identifications, generates d_{O_p} C_f(T_p). This last form is the local correction in the Tate and elliptic Tamagawa statements (Huber–Kings Propositions 1.2.9–1.2.10, pp. 10–11; Burns–Flach Lemma 5, pp. 526–528; Kato 2003, §1.2, p. 165). For T′ = pT the lattices d RΓ_c(T′) and d RΓ_c(T) coincide although every cohomology group changes; with all U_v^+ = 0 the Selmer form is the compact-support form.

### 4.4 The class number formula case

Prove `tamagawaCondition_classNumber`: for every number field F and every odd prime p, TamagawaCondition(h⁰(F), ℤ_p, p) and TamagawaCondition(h⁰(F)(1), ℤ_p(1), p) hold (Huber–Kings Proposition 2.3.1 with its proof and Proposition 2.3.2, pp. 18–21; Fontaine §8.3(a)–(b), pp. 228–229).

In twist 0 the line is d(ℚ) ⊗ d(O_F^× ⊗ ℚ)⁻¹ ⊗ d(T_B^+ ⊗ ℚ)⁻¹; the real comparison of §2.4 with the unit regulator R_∞(F) and a section of the sum map gives δ = (R_∞(F)/ζ_F^*(0)) times the integral generator, and ζ_F^*(0) = −h_F R_F/w_F. The integral clause follows from the Poitou–Tate sequence

```text
0 → O_F^× ⊗ ℤ_p → H¹(O_F[1/p], ℤ_p(1)) → H¹_{/f}(F ⊗ ℚ_p, ℤ_p(1)) → Cl(O_F) ⊗ ℤ_p
  → H²(O_F[1/p], ℤ_p(1)) → H²(F ⊗ ℚ_p, ℤ_p(1)) → H⁰(O_F[1/p], ℚ_p/ℤ_p)^* → 0
```

(ArithmeticGaloisDuality R02.4/poitou-tate) with the duality form of §4.3(b) and the identification of det⁻¹ RΓ_{/f}(F ⊗ ℚ_p, ℤ_p(1)) with ℤ_p. In twist 1, L*(h⁰(F)(1), 0) is the residue 2^{r₁}(2π)^{r₂} h_F R_F/(w_F √|d_F|) of ζ_F at s = 1 (Mathlib `NumberField.dedekindZeta_residue`, `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`; in the variable of the twisted motive this is `tendsto_mul_dedekindZeta_one_add`: s · ζ_K(1 + s) tends to the residue as s → 0⁺); the functional equation gives ζ_F^*(0)/ζ_F^*(1) = ±√|d_F|/(2^{r₁}(2π)^{r₂}), which is the discrepancy between the de Rham lattice O_F and the Betti lattices, and the Bloch–Kato exponential carries O_{F_v} onto a subgroup of index (q_v − 1)/q_v in O_{F_v}^× ⊗ ℤ_p, which is the Euler factor of §3.6. The functional-equation input at s = 0 is the trivial-character interface of BorelRegulators Layer 5 (R.5/completed-zeta-conventions, R.5/leading-term-functional-equation).

**Checks.** For F = ℚ in twist 0, ζ(0) = −1/2, h = R = 1 and w = 2: the condition at odd p is v_p(1/2) = 0. For F real quadratic in twist 1, L* = 2h_F R_F/√d_F and δ = ±(2h_F)⁻¹ times the integral generator of §2.6, so the integral clause at odd p is v_p(h_F) = v_p(#(Cl(O_F) ⊗ ℤ_p)). The prime 2 is excluded: w_F and the archimedean Tate cohomology contribute powers of 2.

### 4.5 The cohomological Lichtenbaum form

Prove `tamagawaCondition_iff_lichtenbaum`: for a number field F, k ≥ 2 and p odd, with R_k(F) the Beilinson regulator covolume of K_{2k−1}(O_F)/tors in V_B(k − 1)^+_ℝ relative to the integral Betti lattice, TamagawaCondition(h⁰(F)(1 − k), ℤ_p(1 − k), p) holds if and only if

```text
v_p(ζ_F^*(1 − k) / R_k(F)) = v_p(#H²(O_F[1/p], ℤ_p(k))) − v_p(#H¹(O_F[1/p], ℤ_p(k))_tors),
```

where ζ_F^*(1 − k)/R_k(F) ∈ ℚ^× by BorelRegulators R.5/borel-zeta-proportionality and R.7/regulator-factor-two. Consequently the condition at all odd p is the odd part of the cohomological Lichtenbaum formula |ζ_F^*(1 − k)| = R_k(F) ∏_p #H²(O_F[1/p], ℤ_p(k))/#H¹(O_F[1/p], ℤ_p(k))_tors (Huber–Kings Theorem 1.4.1 and its proof, pp. 13–14).

The proof: Ξ(h⁰(F)(1 − k)) = d⁻¹ H¹_f(h⁰(F)(k)) ⊗ d⁻¹ T_B(1 − k)^+ (§§1.3–1.4); ϑ_∞ gives δ_ℤ = ±(R_k/ζ^*) times the integral generator (§2.6); RΓ_f(ℤ[1/p], V_p(1 − k)) ≅ H¹(ℤ[1/p], V_p^∨(k))^∨[−2] (§3.5); the Euler factor ∏_{v|p}(1 − N(v)^{k−1}) is a p-adic unit (§3.6); the duality form of §4.3 turns the condition into (R_k/ζ^*)ℤ_p = det r_p(Ω ⊗ ℤ_p) ⊗ det RΓ(ℤ[1/p], T^∨(k)); Soulé's surjectivity with Borel's ranks (§3.3) identifies r_p(Ω ⊗ ℤ_p) with the free part of H¹(O_F[1/p], ℤ_p(k)); and a finite ℤ_p-module of order h has determinant h⁻¹ℤ_p. Each step is reversible.

**Checks.** For F = ℚ and k = 2: ζ(−1) = −1/12, R₂(ℚ) = 1, H²(ℤ[1/p], ℤ_p(2)) is the p-part of K₂(ℤ) = ℤ/2 (trivial at odd p) and H¹(ℤ[1/p], ℤ_p(2))_tors is the p-part of w₂(ℚ) = 24; at p = 3 both sides equal −1, at p ≥ 5 both are 0. For F totally real and k even the rank is zero, R_k = 1 and the formula is |ζ_F(1 − k)| = ∏_p #H²/#H¹_tors at odd p.

### 4.6 The elliptic data

State `ellipticFundamentalLine_data`: for E/ℚ and an odd prime p with Sha(E/ℚ)[p^∞] finite, the data of §§1.5, 2.5 and 3.4 are the regulator, Kummer and Tamagawa identifications assumed by PeriodsAndSpecialValues PS.6.3: H¹_f = E(ℚ) ⊗ ℚ with the Néron–Tate pairing as δ, α_M the real period isomorphism and ϑ_p built from the Kummer isomorphism. Hence TamagawaCondition(h¹(E)(1), T_pE, p) is equivalent to the p-part of the Birch–Swinnerton-Dyer formula (PeriodsAndSpecialValues PS.6/elliptic-fundamental-adapter and PS.6/bsd-prime-assembly; Fontaine §8.3(d), p. 230; Bloch–Kato Proposition 5.4, pp. 370–371). The analytic leading term of L(E, s) at s = 1 is supplied through PeriodsAndSpecialValues. For rank zero with L(E, 1) ≠ 0 the statement is the p-part of L(E, 1)/Ω_E = #Sha · ∏_ℓ c_ℓ/#E(ℚ)_tors²; replacing a generator P by 3P in rank one multiplies the height determinant by 9.

### Examples

The Riemann zeta function: for ℚ(0) and ℚ(1) over ℚ the condition is the identity ζ(0) = −1/2 at odd primes and the residue 1 of ζ at s = 1. For ℚ(−1): ζ(−1) = −1/12, the cohomological form compares 1/12 with #H²/#H¹_tors = 2/24 away from 2.

### Dependencies

Layers 1–3; PeriodsAndSpecialValues PS.3–PS.6; MotivicEtaleKTheory §12.7 (Δ_p(T) and the Selmer local determinant formula); BorelRegulators Layers 5, 7 and 8; ArithmeticGaloisDuality D7 and R02.4; Mathlib's class number formula.

## Downstream consumers

SpecialValuesBirchTate uses the Tamagawa condition for h⁰(F)(1 − k) in its cohomological Lichtenbaum form, and the real comparison of the motivic regulator lattice, as the frame for its Lichtenbaum and Birch–Tate statements. PeriodsAndSpecialValues uses the comparisons of Layers 2–3 as the θ_∞, θ_λ of its Tate and elliptic instances, through statements that take those comparisons as hypotheses. The Iwasawa-theoretic proofs of the condition for abelian fields use Layer 4's formulation.

## References

- D. Burns and M. Flach, [*Tamagawa numbers for motives with (non-commutative) coefficients*](https://ems.press/content/serial-article-files/25892?nt=1), Documenta Mathematica **6** (2001), 501–570. §3.1–3.4, pp. 517–529: motivic structures, the basic exact sequences, projective structures and the virtual objects Ξ(M), ϑ_∞, ϑ_p; §4, pp. 535–537.
- K. Kato, [*Tamagawa number conjecture for zeta values*](https://arxiv.org/abs/math/0304233), arXiv:math/0304233v1, with the printed pages 163–171 of the ICM 2002 proceedings. §1.2, p. 165, and §2.1, pp. 166–168.
- A. Huber and G. Kings, [*Bloch–Kato conjecture and Main Conjecture of Iwasawa theory for Dirichlet characters*](https://arxiv.org/abs/math/0101071), Duke Mathematical Journal **119** (2003), 393–464; arXiv:math/0101071v2, whose pagination and section numbering the locators use. §§1.1–1.5, pp. 3–15; §§2.2–2.3, pp. 16–21.
- J.-M. Fontaine, [*Valeurs spéciales des fonctions L des motifs*](http://www.numdam.org/item/SB_1991-1992__34__205_0/), Séminaire Bourbaki exposé 751, Astérisque **206** (1992), 205–249: the formulation of Fontaine and Perrin-Riou. §§6–7, pp. 218–226; §8, pp. 226–230; §9, pp. 230–234.
- S. Bloch and K. Kato, [*L-functions and Tamagawa numbers of motives*](https://math.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf), The Grothendieck Festschrift I, Progress in Mathematics **86** (1990), 333–400. §3.7–3.10, pp. 353–360; §5.1–5.4, pp. 369–371.
