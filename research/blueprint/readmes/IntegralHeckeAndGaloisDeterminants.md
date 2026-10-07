# Integral Hecke actions, determinants and interpolation

A complete lemma-level planning pass for all seven stages: polynomial laws and divided-power representability; Cayley–Hamilton and reductive pseudocharacter reconstruction; bounded finite-cohomology Hecke images and quantified ghosts; GL_n and GSp₄ normalization including the full similitude; uniform finite-quotient interpolation; input-parametrized nilpotent descent; and the independent integral Ribet theorem with local factors, invariant theory and Buchsbaum–Rim complexes. It preserves the original checkpoint identifiers, follows accepted RS-24 ownership, stops after all targets are planned, and records precise proof leaves and supplier requests. Every declaration is unchecked; complete describes this planning pass, not proof closure or formalisation.

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All declarations below are plans, with implementation status `unchecked`. A planned stage accounts for every target, including precise proof leaves and requested suppliers. None of the seven stages is closed.

## Conventions and ownership

Coefficient rings are commutative and unital. Representation algebras may be noncommutative. A polynomial law is natural in **every** commutative scalar algebra; equality on ground-ring points is insufficient over finite or nonreduced rings. Degree zero is retained in the polynomial-law API; its determinant is the constant law one and its trace is zero. Positive-degree and nonzero-ring hypotheses are stated where proper kernels or characteristic-polynomial degrees require them.

The raw `PolynomialLaw`, `DividedPowerAlgebra`, derived category, tensor products, exterior powers, `IsIdempotentElem.Corner` and `IsAzumaya` carriers are already in the pinned Mathlib. This plan supplies their missing homogeneous, multiplicative, determinant and representing interfaces. The internal multiplication on a fixed divided-power degree is different from the degree-adding multiplication of the full divided-power algebra.

Accepted restructuring RS-24 fixes these boundaries. SR.4 supplies spherical Hecke/Satake theory. IHG.3 supplies only the representation-specific integral coefficient conventions. LP3 supplies invariant coordinate algebras, closed-orbit and complete-reducibility theory, integral rational algebraic-group cohomology, good filtrations and the mixed-characteristic slice. IHG.1 owns reconstruction, including disconnected targets with conjugation by the identity component. LP2:semisimple-characters and GS.5 import that theorem. The general Koszul complex is imported by the exact node `DerivedDeRhamCohomology:DD.1/koszul-complex`; its regular-sequence exactness is requested from DD.1.

IHG.2 owns finite-level image algebras and their localization on complexes with bounded finite cohomology. CC.8 owns their completed inverse-limit Hecke algebra and localization, and R31.3 specializes that construction. IHG.4 owns input-parametrized interpolation; R19.6 and AG2.4 supply their geometric congruence witnesses. IHG.5 uses the TC.0–TC.4 geometric inputs and establishes their algebraic descent consequences; no TC.2-to-IHG.5 construction prerequisite is used. IHG.6 proves the independent integral Ribet theorem with local Fitting factors, including coincident characters and characteristic two.

Finite residue representations and maximal ideals of Galois type do not imply that every maximal ideal has Galois type. Nilpotent directions require integral, uniform congruence witnesses; agreement at field-valued points is insufficient.

## Target map

| Stage | Targets and source additions | Coverage |
| --- | --- | --- |
| `IHG.0` | Homogeneous/multiplicative laws; determinant, trace and characteristic coefficients; divided-power representability; projective and Azumaya norms; duality; continuity; generalized reductive pseudocharacters, kernels and base change. | planned |
| `IHG.1` | Cayley–Hamilton quotient; field classification, henselian reconstruction and GMAs; reducibility/extension modules and lattices; finite completed quotient and generic representation algebra; GL/GSp gluing; CN23 integral local lifting; all-characteristic disconnected reconstruction, continuity and deformation comparison. | planned |
| `IHG.2` | Chain, homotopy, derived and cohomology images; finite endomorphisms; quantified ghost nilpotence; idempotent splitting and semilocal localization; ordinary operator/truncation comparison; large-prime rank-one completion. | planned |
| `IHG.3` | GL_n polynomial and normalized Satake dictionary; arithmetic/geometric inverse-root conversion; GSp4 spin, reciprocal and dual-spin forms; operator indexing and the full multiplier; Galois-type and non-Eisenstein predicates. | planned |
| `IHG.4` | Closed-subring determinant gluing; uniform finite-quotient congruence data; compatible inverse limits; Frobenius uniqueness; completed group-algebra extension and nilpotent-quotient compatibility. | planned |
| `IHG.5` | TC-input algebraic descent; residual specialization, duality and twists; residual semisimplicity versus actual lifting; local lattice/cohomology conditions; completed-cohomology and boundary input contracts. | planned |
| `IHG.6` | Generic zeroth Fitting theory; difference modules, canonical and local cocycles; weighted relation minors; distinct and coincident-character branches; formal invariant rings, rational Borel acyclicity, and both Buchsbaum–Rim complexes; extended-ideal local Fitting bound and full theorem. | planned |

## Normalization dictionary

Write the GL_n polynomial as ∑ᵢ(−1)ⁱq^{i(i−1)/2}TᵢX^{n−i}, with T₀=1 and vol(K)=1. At rank two its cohomological constant term is qT₂. The comparison with a weight-k classical eigenform uses T₁=a_q and T₂=ω(q)q^{k−2}; the classical Galois construction supplies that input and is not an IHG prerequisite.

For GSp4 use CG20/BCGP25 T₀,T₁,T₂. Pilloni’s T_(ℓ,0),T_(ℓ,2),T_(ℓ,1) are respectively these T₀,T₁,T₂. Genestier–Tilouine’s minuscule T_(q,2) is T₁. The spin polynomial is monic; its reversed polynomial has constant one and gives det(1−Xr). The monic inverse-root polynomial divides by the original constant coefficient. The dual-spin polynomial instead has roots q³/βᵢ. These are three different conversions. The spin multiplier is q³T₀, and the dual-spin multiplier is q³/T₀. A polynomial alone gives the square of the multiplier; retain the full similitude, including in characteristic two and trace-zero fibers.

## Reading the declaration plan

Each declaration below lists its direct prerequisites, construction or proof steps, API, tests and acceptance conditions. Same-packet prerequisites use their full identifiers. A supplier stage is a request, not a claimed implementation. Explicit proof leaves are collected at the end. The suggested Lean file uses existing Mathlib carriers and states expressible signatures; missing supplier predicates are omitted with explicit comments as required by the protocol.

## IHG.0. Polynomial laws and determinants

**Coverage: planned.** 50 declaration nodes.

**Planets:** Determinants; Pseudocharacters; Determinants versus pseudocharacters; Homogeneous polynomial laws; Determinant coordinate ring.

### Homogeneous polynomial laws

`IntegralHeckeAndGaloisDeterminants:IHG.0/homogeneous-polynomial-law` · definition

For A-modules M and N, an A-polynomial law f : M → N (a family f_S : S ⊗_A M → S ⊗_A N natural in the commutative A-algebra S; Mathlib's PolynomialLaw) is homogeneous of degree n if f_S(s·x) = s^n·f_S(x) for every commutative A-algebra S, s ∈ S and x ∈ S ⊗_A M.

**Hypotheses:** A a commutative ring; S ranges over commutative A-algebras in the universe of A, as in Mathlib's PolynomialLaw, whose extension to all universes is Mathlib's toFun.

**Prerequisites:** `mathlib:PolynomialLaw`; `mathlib:PolynomialLaw.comp`; `mathlib:TensorProduct`.

**Construction or proof:**

1. Use the scalar homogeneity equation after every commutative coefficient extension. Closure under sums and composition follows by applying that equation twice.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`: a determinant is homogeneous of degree d.
- `IntegralHeckeAndGaloisDeterminants:IHG.4`: finite-quotient interpolation of polynomial laws (RS-12 owner).

**Planning API:**

- `TauCeti.PolynomialLaw.isHomogeneousOfDegree_zero` (example): The zero law is homogeneous of every degree.
- `TauCeti.PolynomialLaw.IsHomogeneousOfDegree.add` (relation): Closed under addition.
- `TauCeti.PolynomialLaw.IsHomogeneousOfDegree.comp` (compatibility): Composition multiplies degrees.
- `TauCeti.PolynomialLaw.isHomogeneousOfDegree_one_iff` (characterisation): Degree one iff base change of a linear map.

**Unit tests:**

- `homogeneous_id` (computation): The identity law is homogeneous of degree 1.
- `homogeneous_ground_zero` (computation): Over 𝔽_p some degree-(p+1) law vanishes on 𝔽_p-points without being zero.
- `homogeneous_zero` (computation): The zero law is homogeneous of degree n for all n.

**Acceptance:**

- Degree one: f is homogeneous of degree one iff f_S = S ⊗ ℓ for an A-linear ℓ : M → N (Chenevier Example 1.2(i)).
- Degree matters beyond the A-points: over 𝔽_p, XY^p − X^pY on 𝔽_p² is homogeneous of degree p + 1 and vanishes on 𝔽_p-points but not as a law (Example 1.2(iii)).
- A law of degree n is determined by its values on A[T_1, …, T_n]-points (Chenevier §1.1).

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), §1.1, p. 6.

### Multiplicative polynomial laws

`IntegralHeckeAndGaloisDeterminants:IHG.0/multiplicative-polynomial-law` · definition

For A-algebras R and B (associative, unital, not necessarily commutative), an A-polynomial law f : R → B is multiplicative if f_S(1) = 1 and f_S(xy) = f_S(x)f_S(y) for every commutative A-algebra S and x, y ∈ S ⊗_A R.

**Hypotheses:** The ring structure on S ⊗_A R is Mathlib's Algebra.TensorProduct ring structure.

**Prerequisites:** `mathlib:PolynomialLaw`; `mathlib:PolynomialLaw.id`; `mathlib:PolynomialLaw.comp`; `mathlib:Algebra.TensorProduct.instRing`.

**Construction or proof:**

1. Definition: IsMultiplicative f := ∀ S, f.toFun' S 1 = 1 ∧ ∀ x y, f.toFun' S (x * y) = f.toFun' S x * f.toFun' S y.
2. Identity and composition: unfold.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`: a determinant is multiplicative.

**Planning API:**

- `TauCeti.PolynomialLaw.isMultiplicative_id` (example): The identity is multiplicative.
- `TauCeti.PolynomialLaw.IsMultiplicative.comp` (compatibility): Multiplicative laws compose.
- `TauCeti.Determinant.dimOneEquiv` (equivalence): Multiplicative laws of degree one to A are A-algebra maps.

**Unit tests:**

- `multiplicative_id` (computation): The identity law is multiplicative.
- `multiplicative_det` (computation): The matrix determinant law M_d(A) → A is multiplicative.
- `multiplicative_two_smul` (non-example): 2 • id is not multiplicative over a ring of characteristic zero.

**Acceptance:**

- Multiplicative laws homogeneous of degree one are exactly A-algebra homomorphisms (Chenevier §1.1).
- Twice the identity is homogeneous of degree one but not multiplicative when 2 ≠ 1.
- Multiplicativity is required after every scalar extension, not only on R itself.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), §1.1, p. 7.

### Pseudocharacters

`IntegralHeckeAndGaloisDeterminants:IHG.0/pseudocharacter` · definition

A d-dimensional A-valued pseudocharacter on R is an A-linear T : R → A with T(1) = d, T(xy) = T(yx), and the pseudocharacter identity Σ_{σ ∈ S_{d+1}} sgn(σ)T^σ(x_1, …, x_{d+1}) = 0 for all x_i ∈ R, where T^σ(x) = ∏ over the cycles (j_1 … j_s) of σ of T(x_{j_1}⋯x_{j_s}), fixed points included.

**Hypotheses:** T central; A arbitrary commutative ring (the definition makes no hypothesis on d!).

**Prerequisites:** `mathlib:Equiv.Perm.sign`; `mathlib:Equiv.Perm.SameCycle`; `mathlib:Function.minimalPeriod`; `mathlib:LinearMap`.

**Construction or proof:**

1. cycleProduct σ x i := x_i x_{σ i} ⋯ x_{σ^{m−1} i}, m the orbit length (Function.minimalPeriod).
2. cycleTerm T σ x := ∏ over the least elements i of the cycles of σ (Equiv.Perm.SameCycle) of T(cycleProduct σ x i).
3. IsPseudocharacter d T := T 1 = d ∧ central ∧ Σ_σ sgn σ · cycleTerm T σ x = 0.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-trace-bijective-rational`: over ℚ-algebras determinants and pseudocharacters coincide.
- `AutomorphicCongruences:L0`: imports pseudorepresentations from this roadmap.

**Planning API:**

- `TauCeti.cycleProduct` (constructor): The product of x along a cycle.
- `TauCeti.cycleTerm` (constructor): T^σ(x).
- `TauCeti.Determinant.isPseudocharacter_trace` (relation): The trace of a determinant is a pseudocharacter.

**Unit tests:**

- `pseudo_matrix_trace` (computation): tr on M_d(A) is a d-dimensional pseudocharacter.
- `pseudo_wrong_dim` (non-example): tr on M_2(ℚ) is not 1-dimensional.
- `pseudo_id` (computation): id : ℚ → ℚ is a 1-dimensional pseudocharacter.

**Acceptance:**

- The trace of M_d(A) is a d-dimensional pseudocharacter (the identity is the Cayley–Hamilton polarisation).
- The trace of M_2(ℚ) is not a 1-dimensional pseudocharacter.
- In dimension one over ℚ-algebras pseudocharacters are algebra homomorphisms.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), §1.10, Lemma 1.12(iii) and §1.26, pp. 12, 20.

### The kernel of a polynomial law

`IntegralHeckeAndGaloisDeterminants:IHG.0/polynomial-law-kernel` · definition

For an A-polynomial law P : M → N, Ker(P) ⊆ M is the set of x such that P_S(b ⊗ x + m) = P_S(m) for every commutative A-algebra S, b ∈ S and m ∈ S ⊗_A M. It is an A-submodule; P is faithful if Ker(P) = 0.

**Hypotheses:** M, N arbitrary A-modules.

**Prerequisites:** `mathlib:PolynomialLaw`; `mathlib:Submodule`; `mathlib:TensorProduct`.

**Construction or proof:**

1. Define ker f as the Submodule with that carrier; closure under addition and scalars: apply the defining identity twice, and for a·x use b·a ∈ S.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-kernel-ideal`: the kernel of a determinant.
- `IntegralHeckeAndGaloisDeterminants:IHG.1`: faithful determinants and the Cayley–Hamilton comparison.

**Planning API:**

- `TauCeti.PolynomialLaw.ker` (constructor): The kernel as a submodule.
- `TauCeti.PolynomialLaw.IsFaithful` (other): Ker(P) = 0.
- `TauCeti.PolynomialLaw.exists_factor_iff_le_ker` (universal-property): P factors through M/K iff K ≤ Ker(P).

**Unit tests:**

- `ker_id` (computation): The identity law is faithful.
- `ker_zero` (computation): The zero law has kernel everything.
- `ker_upper_triangular` (computation): On upper-triangular 2 × 2 matrices the determinant is not faithful.

**Acceptance:**

- Equivalently x ∈ Ker(P) iff P(tx + t_1m_1 + ⋯ + t_nm_n) ∈ N[t, t_1, …, t_n] does not depend on t (Chenevier §1.17).
- The identity law is faithful; the zero law has kernel M.
- For the determinant on upper-triangular 2 × 2 matrices the kernel is the strictly upper-triangular part (Example 1.20(ii)).

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), §1.17, p. 16.

### Homogeneous divided-power piece

`IntegralHeckeAndGaloisDeterminants:IHG.0/divided-power-degree` · definition

For an A-module M and d≥0, Γ^d_A(M) is the A-submodule of Mathlib’s DividedPowerAlgebra A M spanned by products ∏_j γ_(n_j)(m_j) with ∑_j n_j=d. It is a graded piece of the full commutative algebra, not an algebra under its degree-adding multiplication.

**Prerequisites:** `mathlib:DividedPowerAlgebra`; `mathlib:DividedPowerAlgebra.dp`.

**Construction or proof:**

1. Use the homogeneous presentation to identify this span as the degree-d component. Define γ_d(m) as the existing dp symbol together with its membership proof.

**Uses:**

- `Chenevier Proposition 1.6`: The carrier representing determinant laws.
- `DerivedDeRhamCohomology:DD.0`: Reuses the same raw divided-power algebra; no second envelope construction.

**Planning API:**

- `TauCeti.DividedPower.degree` (constructor): The homogeneous submodule Γ^d_A(M).
- `TauCeti.DividedPower.gamma` (constructor): γ_d(m) belongs to Γ^d_A(M).
- `TauCeti.DividedPower.degree_map` (functoriality): An A-linear M→N induces Γ^d_A(M)→Γ^d_A(N), taking γ_d(m) to γ_d(f(m)).

**Unit tests:**

- `divided_power_degree_zero` (degenerate): Γ^0_A(M)≅A, with γ₀(m)=1.
- `divided_power_degree_one` (compatibility): Γ^1_A(M)≅M, and γ₁ corresponds to the identity.
- `divided_power_degree_two_integer` (non-example): In the full Γ_Z(Z), γ₁(1)²=2γ₂(1); γ₂(1) is a basis of Γ²_Z(Z), so the divided-power grading cannot be replaced by an ordinary polynomial grading.

**Acceptance:**

- For an A-module M and d≥0, Γ^d_A(M) is the A-submodule of Mathlib’s DividedPowerAlgebra A M spanned by products ∏_j γ_(n_j)(m_j) with ∑_j n_j=d. It is a graded piece of the full commutative algebra, not an algebra under its degree-adding multiplication.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), §1.2, p.8.

### Generalized reductive pseudocharacter

`IntegralHeckeAndGaloisDeterminants:IHG.0/reductive-pseudocharacter` · definition

Let O be noetherian and H a generalized reductive O-group scheme: affine smooth, H⁰ reductive, and H/H⁰ finite étale. An H-pseudocharacter of Γ with values in a commutative O-algebra A is a family of O-algebra maps Θ_m:O[H^m]^(H⁰)→Map(Γ^m,A), m≥1, compatible with every reindexing of coordinates and with multiplication of the final two coordinates. Conjugation is by H⁰, including when H is disconnected.

**Prerequisites:** `LanglandsParameterStacks:LP3`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof:**

1. Use the imported invariant coordinate algebras with their reindexing and product pullbacks; impose precisely the two displayed functorial equations.

**Uses:**

- `IHG.1 generalized reconstruction`: The common owner for connected and disconnected reductive targets.
- `LanglandsParameterStacks:LP2:semisimple-characters`: Imports only the reconstructed-character theorem, with its Weil conventions.
- `GlobalShtukasAndFunctionFieldLanglands:GS.5`: Uses the same theorem for global excursion parameters.

**Planning API:**

- `TauCeti.ReductivePseudocharacter` (constructor): The family Θ_m with reindexing and multiplication equations.
- `TauCeti.ReductivePseudocharacter.ofRepresentation` (constructor): A representation ρ gives Θ_m(f)(γ₁,…,γ_m)=f(ρ(γ₁),…,ρ(γ_m)).
- `TauCeti.ReductivePseudocharacter.ext` (extensionality): Equality is pointwise equality of every Θ_m on every invariant and tuple.
- `TauCeti.ReductivePseudocharacter.map` (functoriality): A coefficient map A→B postcomposes every Θ_m; a group map restricts it; a group-scheme map H→H′ pulls back invariants.

**Unit tests:**

- `h_pseudocharacter_torus` (compatibility): For H=G_m, it is a unit character Γ→Aˣ.
- `h_pseudocharacter_trivial_rep` (degenerate): The trivial representation evaluates every invariant at the identity tuple.
- `h_pseudocharacter_unipotent` (non-example): Over an algebraically closed field, the nontrivial upper-unipotent representation Z→GL₂ has the same pseudocharacter as the trivial rank-two representation; the pseudocharacter does not retain the nonsplit extension.

**Acceptance:**

- Let O be noetherian and H a generalized reductive O-group scheme: affine smooth, H⁰ reductive, and H/H⁰ finite étale. An H-pseudocharacter of Γ with values in a commutative O-algebra A is a family of O-algebra maps Θ_m:O[H^m]^(H⁰)→Map(Γ^m,A), m≥1, compatible with every reindexing of coordinates and with multiplication of the final two coordinates. Conjugation is by H⁰, including when H is disconnected.

**Source:** [Q23](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), Definition 3.1, pp.10–11.

### Determinants (Chenevier)

`IntegralHeckeAndGaloisDeterminants:IHG.0/determinant` · definition

A d-dimensional A-valued determinant on an A-algebra R is a multiplicative A-polynomial law D : R → A which is homogeneous of degree d (Chenevier §1.5). When R = A[G] for a group or monoid G, D is a determinant on G.

**Hypotheses:** R any associative unital A-algebra; A commutative. d ≥ 0; for d = 0 the only determinant is the constant 1.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/homogeneous-polynomial-law`; `IntegralHeckeAndGaloisDeterminants:IHG.0/multiplicative-polynomial-law`; `mathlib:PolynomialLaw.ground`.

**Construction or proof:**

1. Structure Determinant A R d with fields toLaw, isHomogeneous (degree d) and isMultiplicative. eval D x := D.toLaw.ground x.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.1`: Cayley–Hamilton quotient and reconstruction (RS-12 owner).
- `ArithmeticGaloisRepresentations:R01.5`: 'Consume the arbitrary-degree multiplicative polynomial laws … of IntegralHeckeAndGaloisDeterminants'.
- `AutomorphicCongruences:L0`: imports pseudorepresentations from this roadmap.

**Planning API:**

- `TauCeti.Determinant.eval_mul` (compatibility): D(xy) = D(x)D(y).
- `TauCeti.Determinant.eval_one` (simp): D(1) = 1.
- `TauCeti.Determinant.eval_smul` (relation): D(ax) = a^d D(x).
- `TauCeti.Determinant.isUnit_eval` (relation): Units go to units.

**Unit tests:**

- `det_matrix` (computation): eval (ofMatrix id) M = det M.
- `det_dim_zero` (computation): A determinant of dimension 0 is constant 1.
- `det_trace_not_injective` (non-example): Over (ℤ/p)[X] two different p-dimensional determinants have the same trace.

**Acceptance:**

- The matrix determinant on M_d(A), and det ∘ ρ for an algebra map ρ : R → M_d(A), are determinants of dimension d.
- Dimension one: determinants are A-algebra maps R → A.
- The trace does not determine a determinant in characteristic p ≤ d: over (ℤ/p)[X], Y ↦ I_p and Y ↦ X·I_p on A[Y] give different determinants with the same trace 0. This is why determinants, not pseudocharacters, are used.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), §1.5, Definition, p. 9.

### The polynomial law of a linear map

`IntegralHeckeAndGaloisDeterminants:IHG.0/law-of-linear-map` · construction

For an A-linear ℓ : M → N, the degree-one polynomial law with ℓ_S = S ⊗ ℓ (lTensor) for every commutative A-algebra S.

**Hypotheses:** None.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/homogeneous-polynomial-law`; `mathlib:PolynomialLaw`; `mathlib:LinearMap.lTensor`.

**Construction or proof:**

1. Define toFun' S := ℓ.lTensor S; compatibility is naturality of lTensor under base change (LinearMap.rTensor of an algebra map commutes with lTensor).

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.0/polynomial-law-factors-through-kernel`: the quotient map M → M/K as a law.

**Planning API:**

- `TauCeti.PolynomialLaw.ofLinearMap` (constructor): The law S ⊗ ℓ.
- `TauCeti.PolynomialLaw.isHomogeneousOfDegree_one_iff` (characterisation): Degree-one laws are exactly these.
- `TauCeti.PolynomialLaw.ofLinearMap_ground` (simp): (ofLinearMap ℓ).ground = ℓ.

**Unit tests:**

- `ofLinearMap_id` (computation): ofLinearMap id is PolynomialLaw.id.
- `ofLinearMap_ground` (computation): Its value map is ℓ.
- `ofLinearMap_zero` (computation): ofLinearMap 0 is the zero law.

**Acceptance:**

- It is homogeneous of degree one and its value map is ℓ.
- For ℓ an algebra map it is multiplicative.
- Composition with it is precomposition: P ∘ ℓ.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Example 1.2(i), p. 7.

### Kernels are compatible with base change

`IntegralHeckeAndGaloisDeterminants:IHG.0/kernel-base-change` · lemma

For a commutative A-algebra B, the image of Ker(P) ⊗ B in M ⊗ B lies in Ker(P ⊗ B).

**Hypotheses:** B commutative A-algebra.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/polynomial-law-kernel`; `mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange`.

**Construction or proof:**

1. Transitivity of tensor products: for S a B-algebra, b ∈ S and x ∈ Ker(P), b ⊗ x is tested by the defining identity of Ker(P) with the A-algebra S.

**Acceptance:**

- The inclusion can be strict (kernels are not compatible with base change in general, Chenevier §1.17 remark before Example 1.20).
- Used for continuity and for the faithful quotient over extensions.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 1.18(iii), p. 16.

### Direct-sum grading of divided powers

`IntegralHeckeAndGaloisDeterminants:IHG.0/divided-power-grading` · lemma

For any commutative ring A and module M, the sum map ⊕_(d≥0)Γ^d_A(M)→Γ_A(M) is an A-linear equivalence, multiplication maps degrees a,b to a+b, and γ_d(m) has degree d.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/divided-power-degree`.

**Construction or proof:**

1. Grade the polynomial presentation by weight n on the variable (n,m); all defining relations are homogeneous. Pass the grading through the homogeneous relation ideal.

**Acceptance:**

- For any commutative ring A and module M, the sum map ⊕_(d≥0)Γ^d_A(M)→Γ_A(M) is an A-linear equivalence, multiplication maps degrees a,b to a+b, and γ_d(m) has degree d.

**Source:** [ROBY63](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), III §1 and IV §1, pp.265–266.

### Continuous reductive pseudocharacter

`IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-reductive-pseudocharacter` · definition

For topological Γ and A, an H-pseudocharacter is continuous if for every m≥1 and every invariant f∈O[H^m]^(H⁰), the function Θ_m(f):Γ^m→A is continuous. Coefficient change at fixed O and base change of the group scheme O→O′ are distinct operations.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/reductive-pseudocharacter`.

**Construction or proof:**

1. Use continuity of the evaluated functions, with product topologies, rather than putting a discrete topology on the full coefficient ring.

**Uses:**

- `BHKT Proposition 4.7`: Continuity of the reconstructed representation.
- `IHG.4 gluing`: Density uniqueness after finite-quotient congruence has established existence.

**Planning API:**

- `TauCeti.ReductivePseudocharacter.IsContinuous` (characterisation): Every evaluation on invariant coordinates is continuous.
- `TauCeti.ReductivePseudocharacter.continuous_ofRepresentation` (compatibility): A continuous point-valued representation induces a continuous pseudocharacter.
- `TauCeti.ReductivePseudocharacter.continuous_dense_ext` (extensionality): For Hausdorff A, continuous pseudocharacters agreeing on a dense subgroup are equal.

**Unit tests:**

- `h_continuous_discrete_group` (degenerate): Every pseudocharacter on a discrete Γ is continuous.
- `h_continuous_rank_one` (compatibility): For H=G_m the condition is continuity of the associated unit character.
- `h_continuous_finite_quotient` (computation): A finite-quotient representation into a discrete finite coefficient ring gives a continuous pseudocharacter on a profinite group.

**Acceptance:**

- For topological Γ and A, an H-pseudocharacter is continuous if for every m≥1 and every invariant f∈O[H^m]^(H⁰), the function Θ_m(f):Γ^m→A is continuous. Coefficient change at fixed O and base change of the group scheme O→O′ are distinct operations.

**Source:** [Q23](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), Definition 3.1 and Lemma 3.2, pp.11–12.

### Kernel of a reductive pseudocharacter

`IntegralHeckeAndGaloisDeterminants:IHG.0/reductive-pseudocharacter-kernel` · definition

For an H-pseudocharacter Θ define ker Θ={δ∈Γ:Θ_m(f)(γ₁,…,γ_mδ)=Θ_m(f)(γ₁,…,γ_m) for all m,f and tuples}. This is a normal subgroup. In general ker ρ⊆ker Θ_ρ, with equality for H-completely reducible representations over an algebraically closed field.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/reductive-pseudocharacter`.

**Construction or proof:**

1. Use reindexing to move δ to any coordinate and the multiplication axiom to prove subgroup closure and conjugation stability.

**Uses:**

- `Quast §6.1`: Finite quotient systems in deformation spaces.
- `IHG.1 continuity`: Kernel and reconstructed finite image.

**Planning API:**

- `TauCeti.ReductivePseudocharacter.kernel` (constructor): The normal subgroup defined by all invariant evaluations.
- `TauCeti.ReductivePseudocharacter.kernel_mem` (characterisation): Membership is invariance under right multiplication in any coordinate.
- `TauCeti.ReductivePseudocharacter.quotient` (universal-property): For normal Δ⊆ker Θ there is a unique descended pseudocharacter on Γ/Δ.

**Unit tests:**

- `h_kernel_trivial_rep` (degenerate): The trivial representation has ker Θ=Γ.
- `h_kernel_rank_one` (compatibility): For H=G_m it is the kernel of the unit character.
- `h_kernel_unipotent_strict` (non-example): For the upper-unipotent representation of Z in GL₂ over C, ker ρ={0} but ker Θ_ρ=Z.

**Acceptance:**

- For an H-pseudocharacter Θ define ker Θ={δ∈Γ:Θ_m(f)(γ₁,…,γ_mδ)=Θ_m(f)(γ₁,…,γ_m) for all m,f and tuples}. This is a normal subgroup. In general ker ρ⊆ker Θ_ρ, with equality for H-completely reducible representations over an algebraically closed field.

**Source:** [Q23](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), Definition 3.10 and Lemmas 3.11–3.12, p.16.

### Base change of invariant coordinate algebras

`IntegralHeckeAndGaloisDeterminants:IHG.0/invariants-base-change-range` · comparison

For arbitrary noetherian base O and generalized reductive H, flat O→O′ commutes with invariant coordinate algebras. For connected geometrically reductive H over a Dedekind base, EM23 Proposition 2.6(i)(b) proves the stronger arbitrary-base-change statement for O[H^m]^H. Without the stated class of coordinate algebras, invariants need not commute with nonflat coefficient change.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/reductive-pseudocharacter`; `LanglandsParameterStacks:LP3`.

**Construction or proof:**

1. The flat case follows by tensoring the equalizer of the coaction. In the stronger Dedekind coordinate case import the good-filtration/vanishing theorem and the universal coefficient comparison. Do not infer this for an arbitrary module or disconnected conjugating group.

**Acceptance:**

- For the sign representation of the constant group C₂ on Z, invariants are 0, but after reduction modulo 2 all of F₂ is invariant. This tests the general warning and is not a counterexample to EM23’s connected coordinate theorem.

**Source:** [EM23](https://arxiv.org/pdf/2310.03869), Proposition 2.6 and Lemma 2.7, pp.7–8.

### Characteristic polynomial and trace of a determinant

`IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial` · construction

For D a d-dimensional determinant on R and x ∈ R, χ(x, t) := D_{A[t]}(t − x) ∈ A[t] = Σ_{i=0}^{d} (−1)^i Λ_i(x) t^{d−i}; it is monic of degree d, Λ_0 = 1, Λ_d = D, and Λ_1 =: Tr is an A-linear map with Tr(1) = d.

**Hypotheses:** A[t] is a commutative A-algebra in the universe of A, so D_{A[t]} is defined.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.0/homogeneous-polynomial-law`; `mathlib:Polynomial`; `mathlib:Algebra.TensorProduct.rid`; `mathlib:Polynomial.Monic`.

**Construction or proof:**

1. Definition: apply D.toLaw.toFun' at S = A[t] to t ⊗ 1 − 1 ⊗ x and identify A[t] ⊗_A A with A[t] (Algebra.TensorProduct.rid).
2. Monic of degree d and the constant term (−1)^d D(x): homogeneity with the substitution t ↦ 0 and the leading coefficient D(1) = 1, via naturality of the law along A[t] → A[t, u].
3. Linearity of Λ_1: Λ_1 is a homogeneous law of degree one (Chenevier §1.10), hence linear by homogeneous-polynomial-law's degree-one characterisation.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-trace-injective`: Tr and the Newton relations determine D when d! is invertible.

**Planning API:**

- `TauCeti.Determinant.charpoly_monic` (other): χ(x, t) is monic.
- `TauCeti.Determinant.charpoly_natDegree` (other): deg χ = d.
- `TauCeti.Determinant.charpoly_coeff_zero` (characterisation): χ(x, 0) = (−1)^d D(x).
- `TauCeti.Determinant.traceLinear` (constructor): Tr as an A-linear map.
- `TauCeti.Determinant.trace_one` (simp): Tr(1) = d.

**Unit tests:**

- `charpoly_one` (computation): χ(1, t) = (t − 1)^d.
- `charpoly_ofMatrix` (computation): For det ∘ ρ it is Matrix.charpoly (ρ x).
- `trace_ofMatrix` (computation): For det ∘ ρ, Tr = matrix trace.

**Acceptance:**

- χ(1, t) = (t − 1)^d and χ(0, t) = t^d.
- For det ∘ ρ, χ is the characteristic polynomial of ρ(x) and Tr the matrix trace.
- The Newton relations −t (d/dt)D(1 − tr)/D(1 − tr) = Σ_{n≥1} Tr(r^n)t^n hold (Chenevier (1.3)).

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), §1.10, p. 12; [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), §1.10, (1.3), p. 12.

### Restriction of determinants

`IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-restriction` · construction

For an A-algebra map φ : R′ → R and a d-dimensional determinant D on R, D ∘ φ (composition of polynomial laws with the degree-one law φ) is a d-dimensional determinant on R′. For a subgroup H ≤ G, restriction along A[H] → A[G] is restriction to H.

**Hypotheses:** φ an A-algebra homomorphism.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.0/homogeneous-polynomial-law`; `IntegralHeckeAndGaloisDeterminants:IHG.0/multiplicative-polynomial-law`; `mathlib:PolynomialLaw.comp`; `mathlib:MonoidAlgebra.mapDomainAlgHom`.

**Construction or proof:**

1. Law: D.toLaw.comp (the degree-one multiplicative law of φ). Homogeneity: degree d·1 (IsHomogeneousOfDegree.comp). Multiplicativity: IsMultiplicative.comp.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.4`: restricting Galois determinants to open subgroups and along finite quotients in the interpolation.
- `Chenevier §2 (restriction to a dense subgroup, Example in §2.30)`: determinants on G are determined on a dense subgroup when continuous.

**Planning API:**

- `TauCeti.Determinant.eval_comap` (simp): (D ∘ φ)(x) = D(φ x).
- `TauCeti.Determinant.comap_id` (simp): Restriction along the identity is D.
- `TauCeti.Determinant.comap_comp` (functoriality): Restriction along ψ ∘ φ is restriction along ψ then φ.

**Unit tests:**

- `comap_id` (computation): Restriction along the identity.
- `comap_ofMatrix` (computation): Restriction of det ∘ ρ is det ∘ (ρ ∘ φ).
- `comap_subgroup` (computation): Restriction to a subgroup H ≤ G.

**Acceptance:**

- Restriction along id is D.
- Restriction of det ∘ ρ is det ∘ (ρ ∘ φ).
- Restriction to a subgroup of a determinant on G.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), §1.5, p. 9 (determinants on A[G]).

### Scalar extension of determinants

`IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-base-change` · construction

For a commutative A-algebra S and a d-dimensional determinant D on R, D ⊗_A S is an S-valued d-dimensional determinant on S ⊗_A R, with (D ⊗ S)(1 ⊗ x) = D(x) ⊗ 1; this is the identification M^d_A(R, S) ≅ M^d_S(R ⊗_A S, S).

**Hypotheses:** S in the universe of A, as for Mathlib's polynomial laws.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`; `mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange`; `mathlib:Algebra.TensorProduct.instRing`.

**Construction or proof:**

1. For a commutative S-algebra T, (D ⊗ S)_T := D_T via (S ⊗_A R) ⊗_S T ≅ T ⊗_A R (TensorProduct.AlgebraTensorModule.cancelBaseChange). Homogeneity and multiplicativity are those of D_T.

**Uses:**

- `Chenevier §1.5 (the functor det_A(R, d))`: B-valued determinants of R are B-valued determinants of R ⊗_A B; this identification defines the determinant functor.
- `IntegralHeckeAndGaloisDeterminants:IHG.1`: reconstruction over algebraically closed fields and henselian local rings passes through scalar extension.

**Planning API:**

- `TauCeti.Determinant.eval_baseChange_tmul` (simp): (D ⊗ S)(1 ⊗ x) = image of D(x).
- `TauCeti.Determinant.charpoly_baseChange_tmul` (compatibility): χ commutes with base change.
- `TauCeti.Determinant.trace_baseChange_tmul` (simp): (D ⊗ S)'s trace on 1 ⊗ x is the image of Tr(x).

**Unit tests:**

- `baseChange_self` (computation): Base change to A is D.
- `baseChange_ofMatrix` (computation): Base change of det ∘ ρ.
- `baseChange_trans` (computation): Transitivity.

**Acceptance:**

- Base change along A → A is D.
- Base change of det ∘ ρ is det ∘ (ρ ⊗ S).
- Transitivity along A → S → T.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Remark 1.4, p. 8; [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), §1.5, p. 9.

### One-dimensional determinants are algebra homomorphisms

`IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-dimension-one` · comparison

The map D ↦ D_A is a bijection between 1-dimensional A-valued determinants on R and A-algebra homomorphisms R → A. For R = A[G], these are the characters G → A^×.

**Hypotheses:** No hypothesis on A.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.0/homogeneous-polynomial-law`; `IntegralHeckeAndGaloisDeterminants:IHG.0/multiplicative-polynomial-law`; `mathlib:AlgHom`.

**Construction or proof:**

1. A degree-one law is the base change of the linear map D_A (homogeneous-polynomial-law, degree-one characterisation); multiplicativity makes it an algebra homomorphism, and conversely an algebra homomorphism is a degree-one multiplicative law.

**Acceptance:**

- For R = A[G], a character χ gives D = χ extended linearly.
- Two different algebra homomorphisms give different determinants.
- In dimension ≥ 2 the value map alone is not injective on laws in general, but for determinants of dimension 1 it is.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), §1.5, p. 9.

### Two-dimensional determinants on a group

`IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-dimension-two` · comparison

For a group G, D ↦ (T, D|_G) is a bijection between 2-dimensional A-valued determinants on G and pairs (T, D) of functions G → A with D : G → A^× a homomorphism, T(1) = 2, T(gh) = T(hg) and D(g)T(g^{-1}h) − T(g)T(h) + T(gh) = 0 for all g, h.

**Hypotheses:** G a group (for monoids, Chenevier's form with f(g, h)).

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.0/homogeneous-polynomial-law`; `IntegralHeckeAndGaloisDeterminants:IHG.0/multiplicative-polynomial-law`; `mathlib:MonoidAlgebra`.

**Construction or proof:**

1. A degree-2 law on ℤ[G] is D(gU + hV) = D(g)U² + f(g, h)UV + D(h)V² with f symmetric and f(g, g) = 2D(g) (Chenevier Example 1.8).
2. Multiplicativity is equivalent to: D a homomorphism, f(hg, h′g) = f(h, h′)D(g), and f(hg, h′g′) + f(hg′, h′g) = f(h, h′)f(g, g′); with T(g) = f(g, 1) these become the stated identities, and f(g, h) = T(g)T(h) − T(gh) = D(h)T(gh^{-1}).

**Acceptance:**

- For det ∘ ρ with ρ : G → GL_2(A), T = tr ρ and D = det ρ.
- Applying the identity to (g_1, 1, g_2, g_3) gives the 2-dimensional pseudocharacter identity for T.
- The pair (T, D), not T alone, is needed when 2 is not invertible.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Example 1.8 and Lemma 1.9, pp. 10–11.

### Laws factor through their kernel

`IntegralHeckeAndGaloisDeterminants:IHG.0/polynomial-law-factors-through-kernel` · lemma

Ker(P) is the largest submodule K ⊆ M such that P = P̃ ∘ π for a polynomial law P̃ : M/K → N, π the quotient map: P factors through M/K iff K ≤ Ker(P).

**Hypotheses:** K an A-submodule of M.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/polynomial-law-kernel`; `IntegralHeckeAndGaloisDeterminants:IHG.0/law-of-linear-map`; `IntegralHeckeAndGaloisDeterminants:IHG.0/kernel-base-change`; `mathlib:Submodule.mkQ`; `mathlib:LinearMap.lTensor`.

**Construction or proof:**

1. If P = P̃ ∘ π then K ⊆ Ker(P) since π_S(b ⊗ k + m) = π_S(m).
2. Conversely, for K ⊆ Ker(P) and each S put K_S = Im(S ⊗ K → S ⊗ M); then (M/K) ⊗ S ≅ (S ⊗ M)/K_S (right exactness), K_S ⊆ Ker(P ⊗ S) (kernel-base-change), so P_S is constant on K_S-cosets and descends to P̃_S; naturality of P̃ follows from that of P.

**Acceptance:**

- Homogeneity and multiplicativity pass to P̃ (formula (1.6) of the proof).
- K = 0 gives P itself.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 1.18(i), p. 16.

### Universal homogeneous polynomial law

`IntegralHeckeAndGaloisDeterminants:IHG.0/universal-homogeneous-law` · construction

For every d≥0 and A-module M construct the homogeneous polynomial law γ^univ_d:M→Γ^d_A(M), whose value at ∑_j s_j⊗m_j after scalar extension is ∑_(∑n_j=d)(∏_j s_j^n_j)⊗∏_j γ_(n_j)(m_j).

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/divided-power-degree`; `IntegralHeckeAndGaloisDeterminants:IHG.0/divided-power-grading`; `IntegralHeckeAndGaloisDeterminants:IHG.0/homogeneous-polynomial-law`.

**Construction or proof:**

1. Use the finite multinomial expansion and verify independence of tensor representatives via Roby’s relations; check naturality in coefficient algebras.

**Uses:**

- `Roby Theorem IV.1`: The universal map in homogeneous-law representability.
- `Chenevier §1.2`: Defines the degree-d multiplicative law and the determinant coordinate ring.

**Planning API:**

- `TauCeti.DividedPower.universalLaw` (constructor): The homogeneous law with ground value m↦γ_d(m).
- `TauCeti.DividedPower.universalLaw_ground` (simp): The ground evaluation of γ^univ_d at m is γ_d(m).
- `TauCeti.DividedPower.universalLaw_mixed` (simp): The coefficient of ∏T_j^n_j in γ^univ_d(∑T_jm_j) is ∏γ_(n_j)(m_j).

**Unit tests:**

- `universal_law_degree_zero` (degenerate): The degree-zero law is constant 1 in Γ⁰≅A.
- `universal_law_degree_one` (compatibility): Under Γ¹≅M it is Mathlib’s identity polynomial law.
- `universal_law_mixed_degree_two` (computation): The coefficient of UV in γ²(Ux+Vy) is γ₁(x)γ₁(y), with no factor 2 inserted.

**Acceptance:**

- For every d≥0 and A-module M construct the homogeneous polynomial law γ^univ_d:M→Γ^d_A(M), whose value at ∑_j s_j⊗m_j after scalar extension is ∑_(∑n_j=d)(∏_j s_j^n_j)⊗∏_j γ_(n_j)(m_j).

**Source:** [ROBY63](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), Proposition IV.1 and Theorem IV.1, pp.265–267.

### Pseudocharacters of product targets

`IntegralHeckeAndGaloisDeterminants:IHG.0/product-reductive-pseudocharacters` · comparison

In the complete DVR/generalized reductive setup of PQ26 §8.3, projection induces PC_Γ^(H₁×H₂)(A)≅PC_Γ^H₁(A)×PC_Γ^H₂(A), also for continuous pseudocharacters. The inverse uses O[(H₁×H₂)^m]^((H₁×H₂)⁰)≅O[H₁^m]^(H₁⁰)⊗_OO[H₂^m]^(H₂⁰).

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/reductive-pseudocharacter`; `IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-reductive-pseudocharacter`; `LanglandsParameterStacks:LP3`.

**Construction or proof:**

1. Use flatness of the coordinate algebras over the DVR and the two invariant equalizers to identify the tensor invariant algebra; multiply the two evaluated families and check the axioms.

**Acceptance:**

- For H₁=H₂=G_m, this bijection sends a pair of unit characters to their ordered pair, not their product character.

**Source:** [PQ26](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2D7C5400C4BA7789C0E1CFF008D12E60/S2050508626100304a.pdf/div-class-title-on-local-galois-deformation-rings-generalised-reductive-groups-div.pdf), Lemma 8.8 and proof, pp.44–45.

### D(1 + rr′) = D(1 + r′r)

`IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-one-add-mul-comm` · lemma

For a d-dimensional determinant D on R and r, r′ ∈ R: D(1 + rr′) = D(1 + r′r).

**Hypotheses:** No hypothesis on A or R.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial`; `mathlib:Polynomial`.

**Construction or proof:**

1. If r is invertible: D(1 + rr′) = D(r)D(r^{-1} + r′) = D(r^{-1} + r′)D(r) = D(1 + r′r), by multiplicativity and commutativity of A.
2. In general put r′ = 1 + u and work in R[t]/(t^{d+1}), where 1 + tu is invertible; both sides of D(1 + (1 + tu)r) = D(1 + r(1 + tu)) are polynomials in t of degree ≤ d (homogeneity), so agreeing modulo t^{d+1} they agree; evaluate at t = 1.

**Acceptance:**

- For matrices this is det(1 + XY) = det(1 + YX).
- The truncation to R[t]/(t^{d+1}) needs homogeneity: an arbitrary multiplicative map need not be polynomial in t.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 1.12(i) and its proof, pp. 12–13.

### The determinant of a matrix representation

`IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-of-matrix-representation` · construction

For an A-algebra map ρ : R → M_d(A), D := det ∘ ρ (after each scalar extension, det_S ∘ (ρ ⊗ S)) is a d-dimensional determinant with D(x) = det ρ(x), χ(x, t) = charpoly ρ(x) and Tr = tr ∘ ρ; conjugate representations give the same determinant.

**Hypotheses:** ρ an A-algebra homomorphism to the full matrix algebra.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial`; `mathlib:Matrix.det`; `mathlib:Matrix.det_mul`; `mathlib:Matrix.det_smul`; `mathlib:Matrix.det_conj`; `mathlib:RingHom.map_det`; `mathlib:Matrix.charpoly`; `mathlib:Matrix.trace`.

**Construction or proof:**

1. Law: S ⊗_A R → M_d(S) by ρ ⊗ S (Algebra.TensorProduct.map and the matrix base change), then Matrix.det, identified with S ⊗_A A = S. Naturality is naturality of det under ring maps (RingHom.map_det).
2. Homogeneity: det(s·M) = s^d det M (Matrix.det_smul). Multiplicativity: Matrix.det_mul and det 1 = 1.
3. χ and Tr: evaluate at A[t] and compare with Matrix.charpoly (Matrix.charpoly and Matrix.trace).
4. Conjugation: det(P M P^{-1}) = det M (Matrix.det_conj).

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.1`: determinants of actual representations; reconstruction is the converse.

**Planning API:**

- `TauCeti.Determinant.eval_ofMatrix` (simp): D(x) = det ρ(x).
- `TauCeti.Determinant.trace_ofMatrix` (simp): Tr = tr ∘ ρ.
- `TauCeti.Determinant.charpoly_ofMatrix` (simp): χ(x) = charpoly ρ(x).
- `TauCeti.Determinant.ofMatrix_conj` (compatibility): Conjugate representations have the same determinant.

**Unit tests:**

- `ofMatrix_id` (computation): ofMatrix id on M_d(A) evaluates to det.
- `ofMatrix_trace` (computation): Its trace is the matrix trace.
- `ofMatrix_block` (computation): A block-diagonal representation gives the product determinant.

**Acceptance:**

- F = A, R = M_d(A), ρ = id: the usual determinant.
- Block-diagonal ρ_1 ⊕ ρ_2 gives the product of the two determinants (determinant-direct-sum).
- Agreement for finite projective rank-d modules (R → End_A(P)) needs localisation to free modules; it is recorded as remaining work.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), §1.5, p. 9.

### Direct sums of determinants

`IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-direct-sum` · construction

For determinants D_1, D_2 on R of dimensions d_1, d_2, the product D_1·D_2 (pointwise after each scalar extension) is a determinant of dimension d_1 + d_2, with Tr = Tr_1 + Tr_2 and χ = χ_1χ_2.

**Hypotheses:** A commutative, so products of multiplicative laws are multiplicative.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial`.

**Construction or proof:**

1. Law: pointwise product of the two laws into S ⊗_A A = S; naturality is that of each factor.
2. Homogeneity: s^{d_1}s^{d_2} = s^{d_1+d_2}. Multiplicativity: commutativity of S.
3. χ(x, t) = χ_1(x, t)χ_2(x, t) by definition, so Tr adds.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.6`: reducible determinants D = D_1 D_2 in Ribet-type arguments.

**Planning API:**

- `TauCeti.Determinant.eval_mul_det` (simp): (D_1 D_2)(x) = D_1(x) D_2(x).
- `TauCeti.Determinant.trace_mul_det` (simp): Tr(D_1 D_2) = Tr D_1 + Tr D_2.
- `TauCeti.Determinant.charpoly_mul_det` (simp): χ(D_1 D_2) = χ(D_1) χ(D_2).

**Unit tests:**

- `mul_block` (computation): ofMatrix of a block sum is the product.
- `mul_trace` (computation): Traces add.
- `mul_dim_zero` (computation): Multiplying by the dimension-0 determinant changes nothing.

**Acceptance:**

- det(ρ_1 ⊕ ρ_2) = det ρ_1 · det ρ_2.
- Dimension 0 is the unit: D·1 = D.
- Commutativity of the coefficient ring is needed; for B-valued laws with B noncommutative the product is not multiplicative.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Proof of Lemma 2.2, p. 24.

### Amitsur's formula for determinants

`IntegralHeckeAndGaloisDeterminants:IHG.0/amitsur-formula` · lemma

For a determinant D on R, r_1, …, r_n ∈ R and i ≥ 0: Λ_i(t_1r_1 + ⋯ + t_nr_n) = Σ_{ℓ(w)=i} ε(w)Λ(w) in A[t_1, …, t_n], the sum over the words w of length i in the letters t_jr_j, where for the Lyndon factorisation w = w_1^{l_1}⋯w_q^{l_q} (w_1 > ⋯ > w_q) one sets Λ(w) = Λ_{l_q}(w_q)⋯Λ_{l_1}(w_1) and ε(w) = (−1)^{(Σ l_k) − i} (Chenevier (1.5)).

**Hypotheses:** Words ordered lexicographically from t_1r_1 < ⋯ < t_nr_n.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial`; `mathlib:MvPolynomial`; `mathlib:MvPowerSeries`.

**Construction or proof:**

1. In R ⊗ A[t_1, …, t_n]/(t)^m, Lyndon's theorem gives (1 − Σ t_jr_j)^{-1} = ∏_w (1 − w)^{-1} over Lyndon words of length < m in decreasing order (gap: the Lyndon factorisation theorem, Lothaire Ch. 5, is not in the pinned libraries).
2. Apply D (multiplicative) and invert: D(1 − Σ t_jr_j) = ∏_{w Lyndon} Σ_i (−1)^i Λ_i(w) in A[[t]] (1.4); both sides are independent of m.
3. Take the homogeneous part of degree i.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.0/trace-pseudocharacter`: its multilinear part with i = n = d + 1 is the pseudocharacter identity.

**Acceptance:**

- For i = 1 the formula is linearity of Tr.
- For matrices it is the classical Amitsur formula.
- The ordering of the product matters for noncommutative coefficients (Remark 1.13).

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 1.12(ii) and (1.4)–(1.5), pp. 12–14.

### A determinant is determined by its trace when d! is invertible

`IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-trace-injective` · lemma

If d! is invertible in A, then D ↦ Tr is injective on d-dimensional A-valued determinants on R.

**Hypotheses:** d! ∈ A^×. Without it the statement fails (source issue E1).

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`.

**Construction or proof:**

1. For every commutative A-algebra B and r ∈ R ⊗_A B, the Newton relations express Λ_i(r), i ≤ d, as a polynomial with coefficients in ℤ[1/d!] in the Tr(r^j), j ≤ i (characteristic-polynomial).
2. Hence D_B(r) = Λ_d(r) is determined by Tr ⊗ B, which is determined by Tr.

**Acceptance:**

- The hypothesis is needed: over (ℤ/p)[X] with d = p, the determinants of Y ↦ I_p and Y ↦ X·I_p have the same trace 0 (Chenevier states injectivity without the hypothesis; E1).
- Over ℚ-algebras injectivity holds (and bijectivity: determinant-trace-bijective-rational).

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Proposition 1.27 and its proof, p. 20.

### The induced law on M/Ker(P) is faithful

`IntegralHeckeAndGaloisDeterminants:IHG.0/kernel-quotient-faithful` · lemma

If P = P̃ ∘ π with π : M → M/Ker(P), then P̃ is faithful.

**Hypotheses:** As in polynomial-law-factors-through-kernel.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/polynomial-law-factors-through-kernel`; `IntegralHeckeAndGaloisDeterminants:IHG.0/polynomial-law-kernel`.

**Construction or proof:**

1. From the descent formula, Ker(P̃) = Ker(P)/Ker(P) = 0.

**Acceptance:**

- Chenevier prints 'P̃ : R/ker(P) → S'; the lemma concerns modules M, N, so it is M/ker(P) → N (source issue E2).

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 1.18(ii), p. 16.

### The characteristic polynomial law χ : R → R

`IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial-law` · construction

For a determinant D, the degree-d polynomial law χ : R → R, r ↦ r^d − Λ_1(r) r^{d−1} + Λ_2(r) r^{d−2} − ⋯ + (−1)^d Λ_d(r), and its coefficients χ_α(r_1, …, r_n) ∈ R defined by χ(t_1r_1 + ⋯ + t_nr_n) = Σ_α χ_α(r_1, …, r_n) t^α.

**Hypotheses:** Coefficients are extracted through the monomial basis of A[t_1, …, t_n] and (ι →₀ A) ⊗ R ≅ ι →₀ R, since R may be noncommutative.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`; `mathlib:MvPolynomial.basisMonomials`; `mathlib:TensorProduct.finsuppScalarLeft`; `mathlib:LinearEquiv.rTensor`.

**Construction or proof:**

1. Define χ_S(r) using the Λ_i of D ⊗ S (characteristic-polynomial) and the powers of r in S ⊗ R; naturality is that of the Λ_i.
2. χ_α := coefficient at α of χ_{A[t]}(Σ t_i ⊗ r_i) via MvPolynomial.basisMonomials and TensorProduct.finsuppScalarLeft.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton-ideal`: CH(D) is generated by the χ_α.

**Planning API:**

- `TauCeti.Determinant.charpolyLaw` (constructor): The law χ.
- `TauCeti.Determinant.chiCoeff` (projection): The coefficients χ_α.
- `TauCeti.Determinant.isHomogeneousOfDegree_charpolyLaw` (relation): χ is homogeneous of degree d.

**Unit tests:**

- `chi_matrix` (computation): For det on M_d(A), χ is the zero law (Cayley–Hamilton).
- `chi_dim_one` (computation): In dimension one χ(r) = r − D(r).
- `chi_one` (computation): χ(1) = (1 − 1)^d = 0 for d ≥ 1.

**Acceptance:**

- For det ∘ ρ, ρ(χ(r)) = 0 is the Cayley–Hamilton theorem for ρ(r).
- χ is homogeneous of degree d.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), §1.10, p. 12.

### Roby representability

`IntegralHeckeAndGaloisDeterminants:IHG.0/homogeneous-law-representability` · theorem

For all A-modules M,N and d≥0, composition with γ^univ_d is a natural A-linear equivalence Hom_A(Γ^d_A(M),N)≅{homogeneous degree-d A-polynomial laws M→N}. No flatness or projectivity of M is assumed.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/universal-homogeneous-law`.

**Construction or proof:**

1. Associate to a law the coefficients of its value on the universal finite linear combination ∑T_jm_j. These coefficients respect the divided-power relations and define the unique linear map. Conversely the multinomial formula recovers the law.

**Acceptance:**

- For all A-modules M,N and d≥0, composition with γ^univ_d is a natural A-linear equivalence Hom_A(Γ^d_A(M),N)≅{homogeneous degree-d A-polynomial laws M→N}. No flatness or projectivity of M is assumed.

**Source:** [ROBY63](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), Theorem IV.1 and proof, pp.266–267.

### The trace of a determinant is a pseudocharacter

`IntegralHeckeAndGaloisDeterminants:IHG.0/trace-pseudocharacter` · lemma

For a d-dimensional determinant D on R, Tr = Λ_1 is a d-dimensional pseudocharacter.

**Hypotheses:** No hypothesis on A.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/amitsur-formula`; `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-one-add-mul-comm`; `IntegralHeckeAndGaloisDeterminants:IHG.0/pseudocharacter`.

**Construction or proof:**

1. Tr(1) = d and Tr(xy) = Tr(yx): characteristic-polynomial and determinant-one-add-mul-comm (compare the coefficients of t in D(1 + txy) = D(1 + tyx)).
2. The identity: in Amitsur's formula with i = n = d + 1, the left side vanishes since Λ_{d+1} = 0; its component of degree one in each t_j is Σ_σ sgn(σ)Tr^σ(r_1, …, r_{d+1}).

**Acceptance:**

- For det ∘ ρ this is the classical fact that the trace of a d-dimensional representation is a pseudocharacter.
- The map D ↦ Tr is well defined for every A, including characteristic ≤ d, where it is not injective (determinant, third acceptance item).

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 1.12(iii) and its proof, pp. 12–14.

### Over ℚ-algebras determinants are pseudocharacters

`IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-trace-bijective-rational` · theorem

If A is a ℚ-algebra, D ↦ Tr is a bijection between d-dimensional A-valued determinants on R and d-dimensional A-valued pseudocharacters on R.

**Hypotheses:** A a ℚ-algebra.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-trace-injective`; `IntegralHeckeAndGaloisDeterminants:IHG.0/pseudocharacter`; `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial`.

**Construction or proof:**

1. Injectivity: determinant-trace-injective.
2. Surjectivity: by the Newton relations there is a unique P ∈ ℤ[1/d!][S_1, …, S_d], homogeneous of degree d with S_i of degree i, such that P(tr(r), …, tr(r^d)) = det r for matrices r; put D := P(T(r), …, T(r^d)), a homogeneous law of degree d with D(1) = 1.
3. Multiplicativity: by Procesi's theorem there is a commutative A-algebra C ⊃ A and ρ : R → M_d(C) with tr ∘ ρ = T (gap: Procesi's theorem is not in the pinned libraries); then D = det ∘ ρ is multiplicative.

**Uses:**

- `Chenevier §3, p. 45`: continuous determinants and pseudocharacters coincide on affinoid algebras.

**Acceptance:**

- The hypothesis cannot be dropped: in characteristic p ≤ d traces lose information (E1).
- Chenevier Remark 1.28 records it as open whether d! ∈ A^× suffices in general.
- Used for affinoid ℚ_p-algebras in Chenevier §3.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Proposition 1.27 and its proof, p. 20.

### Determinants and pseudocharacters when (2d)! is invertible

`IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-trace-bijective-small` · theorem

If (2d)! is invertible in A, or d = 2 and 2 is invertible in A, then D ↦ Tr is a bijection between d-dimensional A-valued determinants and d-dimensional A-valued pseudocharacters on R.

**Hypotheses:** (2d)! ∈ A^×, or d = 2 and 2 ∈ A^×.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-trace-injective`; `IntegralHeckeAndGaloisDeterminants:IHG.0/pseudocharacter`; `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-dimension-two`.

**Construction or proof:**

1. d = 2: for a pseudocharacter T put f(x, y) = T(x)T(y) − T(xy), a bilinear form, and D(x) = f(x, x)/2, a quadratic law; the pseudocharacter identity of dimension 2 gives multiplicativity (Chenevier's proof of Proposition 1.29(i)).
2. (2d)! invertible: the (d, d)-partial polarisation of the product map (Chenevier Proposition 1.29, via Proposition 1.32), reducing multiplicativity to an identity between polynomials in the T(w) that holds for matrices.

**Acceptance:**

- For d = 2 and 2 invertible this recovers Lemma 1.9's correspondence with D(g) = (T(g)² − T(g²))/2.
- Injectivity alone needs only d! invertible (determinant-trace-injective).

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Proposition 1.29, p. 20.

### The kernel of a determinant

`IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-kernel-characterisation` · lemma

For a determinant D on R: r ∈ Ker(D) iff D_S(1 + r r′) = 1 for every commutative A-algebra S and r′ ∈ S ⊗ R, iff D_S(1 + r′ r) = 1 for all such S, r′.

**Hypotheses:** D a d-dimensional determinant.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/polynomial-law-kernel`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-one-add-mul-comm`; `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial`.

**Construction or proof:**

1. For r ∈ Ker(D) and r′ = 1 + h, work in (S ⊗ R)[t]/(t^{d+1}) where 1 + th is invertible: D(1 + r(1 + th)) = D((1 + th)^{-1} + r)D(1 + th) = D((1 + th)^{-1})D(1 + th) = 1; both sides are polynomials of degree ≤ d in t (determinant-one-add-mul-comm's truncation).
2. Conversely the same computation shows D(b ⊗ r + m) = D(m) whenever m is invertible, and the general case follows by the same truncation.

**Acceptance:**

- Equivalently r ∈ Ker(D) iff Λ_i(r r′) = 0 for all i ≥ 1 and all r′ after base change.
- When A is an infinite domain it suffices to test r′ ∈ R (Chenevier).

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 1.19(i), p. 17.

### A determinant descends to the subring of its coefficients

`IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-coefficient-subring` · lemma

For a determinant D on a monoid G, with values in A, and C ⊆ A the subring generated by the coefficients Λ_i(g) of χ(g, t), g ∈ G: D factors through a unique C-valued determinant on G; in particular every Λ_i(g) lies in C and every D(Σ t_j g_j) has coefficients in C.

**Hypotheses:** G a monoid.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/amitsur-formula`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial`; `mathlib:Subring.closure`; `mathlib:MonoidAlgebra.of`.

**Construction or proof:**

1. By Amitsur's formula, D(t_1g_1 + ⋯ + t_ng_n) is a signed sum of products of Λ_i(w) with w words in the g_j, hence in G; so its coefficients lie in C.

**Acceptance:**

- For det ∘ ρ with ρ : G → GL_d(C), the determinant is C-valued.
- Used for glueing determinants over compact coefficient rings (Chenevier Example 2.32).

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Corollary 1.14, p. 14.

### Continuous determinants

`IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-determinant` · definition

For a topological group G and a topological ring A, a determinant D on A[G] is continuous if every coefficient map g ↦ Λ_i(g), i ≤ d, is continuous; by Amitsur's formula this is equivalent to Chenevier's definition by continuity of the maps D^{[α]} : G^d → A.

**Hypotheses:** G a topological group, A a topological ring.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial`; `IntegralHeckeAndGaloisDeterminants:IHG.0/amitsur-formula`; `mathlib:Continuous`; `mathlib:MonoidAlgebra.of`.

**Construction or proof:**

1. Definition: ∀ i, Continuous (g ↦ coeff i (χ(g, t))).

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.4`: continuous Galois determinants interpolated through finite quotients.
- `ArithmeticGaloisRepresentations:R01.5`: 'supply the arithmetic continuity'.

**Planning API:**

- `TauCeti.Determinant.IsContinuous` (other): Continuity of every Λ_i.
- `TauCeti.Determinant.eq_of_eqOn_dense` (relation): Determined on a dense subgroup.
- `TauCeti.Determinant.isContinuous_iff_exists_openNormal` (characterisation): For profinite G and discrete A: the kernel is open.

**Unit tests:**

- `continuous_discrete` (computation): On a discrete group every determinant is continuous.
- `continuous_ofMatrix` (computation): det ∘ ρ is continuous for continuous ρ.
- `continuous_not` (non-example): A determinant of dimension one on ℤ_p with values in ℚ_p from a discontinuous character is not continuous.

**Acceptance:**

- For det ∘ ρ with ρ continuous into GL_d(A), D is continuous.
- Every determinant on a discrete group is continuous.
- A continuous determinant is determined on a dense subgroup (continuous-determinant-dense).

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), §2.30, p. 37.

### Arbitrary base change of divided powers

`IntegralHeckeAndGaloisDeterminants:IHG.0/divided-power-base-change` · comparison

For any commutative A-algebra B and A-module M, the canonical map B⊗_AΓ^d_A(M)→Γ^d_B(B⊗_A M) is a B-linear equivalence for every d, taking 1⊗γ_d(m) to γ_d(1⊗m). Flatness of B is unnecessary.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/divided-power-degree`; `IntegralHeckeAndGaloisDeterminants:IHG.0/homogeneous-law-representability`.

**Construction or proof:**

1. Construct both maps using the symbol relations and the coefficient expansion on sums of pure tensors. Their composites fix all homogeneous generators.

**Acceptance:**

- For Z→F₂ and M=Z the map identifies F₂⊗Γ²_Z(Z) and Γ²_F₂(F₂), both free rank one.

**Source:** [ROBY63](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), Theorem III.3 and proof, pp.261–262.

### Contragredient determinant

`IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-duality` · construction

For a group G and determinant D on A[G], define D∨ by precomposition with the A-linear anti-involution ι(g)=g⁻¹. Since coefficients commute, reversal of products still gives a multiplicative polynomial law of the same degree. It agrees with the determinant of the dual representation.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-of-matrix-representation`.

**Construction or proof:**

1. Extend inversion A-linearly on the group algebra; scalar-extend the anti-involution and compose the law. Multiplicativity uses commutativity of the target.

**Uses:**

- `IHG.3 geometric-Frobenius conversion`: Inverts roots with the monic normalization.
- `BCGP25 §1.8.8`: Dual spin plus Tate twist.

**Planning API:**

- `TauCeti.Determinant.dual` (constructor): D∨ is the determinant pulled back by group-algebra inversion.
- `TauCeti.Determinant.dual_involutive` (functoriality): (D∨)∨=D.
- `TauCeti.Determinant.dual_charpoly` (relation): For g∈G, P_D∨,g(X)=X^d P_D,g(X⁻¹)/P_D,g(0).
- `TauCeti.Determinant.dual_ofRepresentation` (compatibility): Dualizing a finite projective representation and then taking its determinant gives D∨.

**Unit tests:**

- `det_dual_rank_one` (computation): The dual of a unit character χ is χ⁻¹.
- `det_dual_trivial` (degenerate): The trivial d-dimensional representation is fixed by duality.
- `det_dual_rank_two` (computation): For a diagonal unit pair (a,b), dual characteristic polynomial is X²−(a⁻¹+b⁻¹)X+(ab)⁻¹.

**Acceptance:**

- For a group G and determinant D on A[G], define D∨ by precomposition with the A-linear anti-involution ι(g)=g⁻¹. Since coefficients commute, reversal of products still gives a multiplicative polynomial law of the same degree. It agrees with the determinant of the dual representation.

**Source:** [Q23](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), §3.4, p.17; Chenevier §1.5.

### Determinant of a finite projective representation

`IntegralHeckeAndGaloisDeterminants:IHG.0/finite-projective-determinant` · construction

Let V be a finite projective A-module of constant rank d≥1 and ρ:R→End_A(V) an A-algebra map. Since ∧^dV is an invertible A-module, ∧^dρ(r) is multiplication by a unique scalar. This after every scalar extension defines a degree-d multiplicative polynomial law D_ρ:R→A.

**Prerequisites:** `mathlib:exteriorPower.map`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-of-matrix-representation`.

**Construction or proof:**

1. On local trivializations take the matrix determinant. Basis-change invariance makes these local laws agree; faithfully flat descent glues them. The top exterior-power description identifies the glued scalar and proves independence of trivializations.

**Uses:**

- `Integral Hecke interpolation`: Determinants of actual locally free Galois representations.
- `Chenevier Theorem 2.22`: Comparison of reconstruction with its determinant.

**Planning API:**

- `TauCeti.Determinant.ofFiniteProjective` (constructor): The determinant law of ρ on a finite projective constant-rank module.
- `TauCeti.Determinant.ofFiniteProjective_exterior` (characterisation): The induced top exterior-power endomorphism is scalar multiplication by D_ρ(r).
- `TauCeti.Determinant.ofFiniteProjective_basis` (compatibility): For a finite basis, this law equals det of the corresponding matrix representation.
- `TauCeti.Determinant.ofFiniteProjective_baseChange` (functoriality): Scalar extension of V and ρ commutes with D_ρ.

**Unit tests:**

- `projective_determinant_line` (computation): On an invertible rank-one module, scalar a has determinant a.
- `projective_determinant_identity` (degenerate): The identity endomorphism has determinant 1.
- `projective_determinant_free` (compatibility): For V=A² and a specified basis, the determinant equals Mathlib’s Matrix.det, including the off-diagonal sign.

**Acceptance:**

- Let V be a finite projective A-module of constant rank d≥1 and ρ:R→End_A(V) an A-algebra map. Since ∧^dV is an invertible A-module, ∧^dρ(r) is multiplication by a unique scalar. This after every scalar extension defines a degree-d multiplicative polynomial law D_ρ:R→A.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), §1.5 matrix example and its local finite-projective extension, p.9.

### The kernel of a determinant is a two-sided ideal

`IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-kernel-ideal` · construction

Ker(D) is a two-sided ideal of R, proper if d > 0 and R ≠ 0; it is the largest two-sided ideal K such that D factors through a determinant of R/K.

**Hypotheses:** D a d-dimensional determinant.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-kernel-characterisation`; `IntegralHeckeAndGaloisDeterminants:IHG.0/polynomial-law-factors-through-kernel`; `mathlib:TwoSidedIdeal`.

**Construction or proof:**

1. Two-sidedness: by determinant-kernel-characterisation both r r′ and r′ r tests are available.
2. Properness: D(1 − t) = (1 − t)^d ≠ 1 for d > 0, so 1 ∉ Ker(D).
3. Maximality and factorisation: polynomial-law-factors-through-kernel with multiplicativity passing to the quotient law.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.1/kernel-contains-cayley-hamilton`: CH(D) ⊆ Ker(D).
- `IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-iff-open-kernel`: continuity is openness of the kernel.

**Planning API:**

- `TauCeti.Determinant.kerTwoSided` (constructor): Ker(D) as a two-sided ideal.
- `TauCeti.Determinant.mem_kerTwoSided` (simp): Membership agrees with the submodule kernel.
- `TauCeti.Determinant.kerTwoSided_ne_top` (relation): Proper for d > 0 and R nontrivial.

**Unit tests:**

- `ker_det_matrix` (computation): For d>0, det on M_d(A) is faithful; the d=0 matrix algebra is the zero ring.
- `ker_dim_zero` (computation): In dimension 0 the kernel is everything.
- `ker_upper_triangular_ideal` (computation): On upper-triangular matrices it is the strictly upper-triangular ideal.

**Acceptance:**

- For det on M_d(A) the kernel is 0 (faithful).
- For D of dimension 0 the kernel is R.
- The faithful quotient R/Ker(D) is Cayley–Hamilton (faithful-cayley-hamilton).

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 1.19(ii), p. 17.

### Continuous determinants are determined on a dense subgroup

`IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-determinant-dense` · lemma

If A is Hausdorff and H ≤ G is dense, two continuous determinants on G with the same characteristic polynomials on H are equal.

**Hypotheses:** A Hausdorff (T2).

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.0/amitsur-formula`; `mathlib:Continuous.ext_on`.

**Construction or proof:**

1. The coefficient maps g ↦ Λ_i(g) of the two determinants are continuous and agree on the dense H, hence on G; by Amitsur's formula the Λ_i on G determine all the D^{[α]}, hence the determinants.

**Acceptance:**

- Needs Hausdorff coefficients.
- Example: a continuous Galois determinant is determined by its values on Frobenius elements (Chebotarev density).

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Example 2.31, p. 38.

### Tensor map for homogeneous divided powers

`IntegralHeckeAndGaloisDeterminants:IHG.0/divided-power-tensor-map` · construction

For A-modules M,N construct the natural A-linear map Γ^d_A(M)⊗_AΓ^d_A(N)→Γ^d_A(M⊗_A N), characterized by the polynomial law (m,n)↦γ_d(m⊗n) separately homogeneous of degree d. Its mixed coefficient formula is required; no assertion that this map is an isomorphism is made.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/homogeneous-law-representability`; `IntegralHeckeAndGaloisDeterminants:IHG.0/divided-power-base-change`.

**Construction or proof:**

1. Apply homogeneous-law representability twice to the separately degree-d law; verify associativity and symmetry on the universal two-variable law, including mixed generators.

**Uses:**

- `Chenevier §1.2`: Internal multiplication on Γ^d(R).
- `Determinant products and change of coefficients`: Separately homogeneous coefficient expansions.

**Planning API:**

- `TauCeti.DividedPower.tensorMap` (constructor): The linear map Γ^d(M)⊗Γ^d(N)→Γ^d(M⊗N).
- `TauCeti.DividedPower.tensorMap_gamma` (simp): γ_d(m)⊗γ_d(n) maps to γ_d(m⊗n).
- `TauCeti.DividedPower.tensorMap_naturality` (functoriality): It commutes with Γ^d(f)⊗Γ^d(g) and Γ^d(f⊗g).

**Unit tests:**

- `dp_tensor_degree_one` (compatibility): For d=1 the map is the identity on M⊗N under Γ¹≅identity.
- `dp_tensor_degree_zero` (degenerate): For d=0 it is A⊗_A A≅A.
- `dp_tensor_integer_generator` (computation): For d=2, M=N=Z, the basis γ₂(1)⊗γ₂(1) maps to γ₂(1⊗1), with coefficient 1.

**Acceptance:**

- For A-modules M,N construct the natural A-linear map Γ^d_A(M)⊗_AΓ^d_A(N)→Γ^d_A(M⊗_A N), characterized by the polynomial law (m,n)↦γ_d(m⊗n) separately homogeneous of degree d. Its mixed coefficient formula is required; no assertion that this map is an isomorphism is made.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), §1.2 and the Roby algebra structure, p.8.

### Continuity is openness of the kernel

`IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-iff-open-kernel` · lemma

Let G be profinite and A discrete. A determinant D on A[G] is continuous iff its kernel contains J(H) = ker(A[G] → A[G/H]) for some open normal H ≤ G, i.e. g − gh ∈ Ker(D) for all g ∈ G, h ∈ H; then G → (A[G]/Ker(D))^× factors through the finite group G/H.

**Hypotheses:** G profinite, A (and all coefficient algebras) discrete.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-kernel-ideal`; `IntegralHeckeAndGaloisDeterminants:IHG.0/amitsur-formula`; `IntegralHeckeAndGaloisDeterminants:IHG.0/polynomial-law-factors-through-kernel`; `mathlib:Subgroup.Normal`; `mathlib:IsOpen`.

**Construction or proof:**

1. If Ker(D) ⊇ J(H), D factors through A[G/H] (polynomial-law-factors-through-kernel), so the Λ_i factor through the finite discrete G/H and are continuous.
2. Conversely, the finitely many continuous maps Λ_i : G → A (discrete) factor through some G/H; by Amitsur's formula D(t(g − gh) + Σ t_ig_i) = D(Σ t_ig_i), so g − gh ∈ Ker(D) and J(H) ⊆ Ker(D).

**Acceptance:**

- The final assertion follows: G acts on A[G]/Ker(D) through G/H.
- Discreteness of A is needed; for A = ℤ_p with its topology the kernel of a continuous determinant need not be open.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 2.33, p. 38.

### Roby algebra of multiplicative laws

`IntegralHeckeAndGaloisDeterminants:IHG.0/multiplicative-law-representability` · construction

For an associative unital A-algebra R, equip Γ^d_A(R) with internal multiplication Γ^d(R)⊗Γ^d(R)→Γ^d(R⊗R)→Γ^d(R), induced by R multiplication, and unit γ_d(1). Then algebra maps Γ^d_A(R)→S are naturally equivalent to multiplicative homogeneous degree-d polynomial laws R→S. This internal algebra can be noncommutative and is distinct from the graded multiplication on Γ_A(R).

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/divided-power-tensor-map`; `IntegralHeckeAndGaloisDeterminants:IHG.0/homogeneous-law-representability`; `IntegralHeckeAndGaloisDeterminants:IHG.0/multiplicative-polynomial-law`.

**Construction or proof:**

1. Use the tensor map and associativity of R for the algebra axioms. The two-variable universal law shows that a linear representing map is multiplicative exactly when it preserves this multiplication and unit.

**Uses:**

- `IHG.0/inverse-limit determinant gluing`: A determinant is a map from one fixed representing ring.
- `Chenevier Proposition 1.6`: Abelianization represents determinants.

**Planning API:**

- `TauCeti.DividedPower.internalAlgebra` (structure): The degree-d representing module has the internal associative A-algebra structure.
- `TauCeti.DividedPower.internal_mul_gamma` (simp): γ_d(x)⋆γ_d(y)=γ_d(xy), with unit γ_d(1).
- `TauCeti.DividedPower.multiplicativeLawEquiv` (universal-property): Algebra maps from this internal algebra are multiplicative degree-d laws.

**Unit tests:**

- `internal_degree_one` (compatibility): Γ¹_A(R) with its internal multiplication is R as an A-algebra.
- `internal_integer_degree_two` (non-example): For R=Z,d=2, γ₂(1)⋆γ₂(1)=γ₂(1); the full graded product γ₂(1)γ₂(1)=6γ₄(1) is a different operation.
- `internal_scalar_power` (computation): For R=A the universal multiplicative law is a↦a^d and its representing algebra is A.

**Acceptance:**

- For an associative unital A-algebra R, equip Γ^d_A(R) with internal multiplication Γ^d(R)⊗Γ^d(R)→Γ^d(R⊗R)→Γ^d(R), induced by R multiplication, and unit γ_d(1). Then algebra maps Γ^d_A(R)→S are naturally equivalent to multiplicative homogeneous degree-d polynomial laws R→S. This internal algebra can be noncommutative and is distinct from the graded multiplication on Γ_A(R).

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), §1.2 and footnote 13, p.8.

### Determinant coordinate ring

`IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-coordinate-ring` · construction

For d≥1 and any A-algebra R, let Z_A(R,d)=Γ^d_A(R)^ab, the quotient by the two-sided ideal generated by all commutators for the internal multiplication. Its universal law represents determinants with commutative coefficient algebras: Hom_A-alg(Z_A(R,d),B)≅Det_d(B⊗_A R,B).

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/multiplicative-law-representability`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`.

**Construction or proof:**

1. Apply the multiplicative-law equivalence and the universal property of abelianization. Base change commutes with the quotient by commutators.

**Uses:**

- `IHG.4 finite-quotient interpolation`: Constructs a compatible law from coefficient-ring homomorphisms.
- `IHG.1 universal Cayley–Hamilton algebra`: The universal determinant base ring.

**Planning API:**

- `TauCeti.Determinant.coordinateRing` (constructor): The abelianized internal degree-d divided-power algebra.
- `TauCeti.Determinant.universal` (universal-property): The universal determinant on Z_A(R,d)⊗_A R.
- `TauCeti.Determinant.coordinateRingEquiv` (equivalence): Its A-algebra maps to B correspond naturally to B-valued determinants.
- `TauCeti.Determinant.coordinateRing_baseChange` (compatibility): B⊗_AZ_A(R,d)≅Z_B(B⊗_AR,d).

**Unit tests:**

- `coordinate_ring_degree_one` (computation): Z_A(R,1)=R^ab.
- `coordinate_ring_base_algebra` (degenerate): Z_A(A,d)≅A with universal law a↦a^d.
- `coordinate_ring_one_variable` (characterisation): Z_A(A[t],d)≅A[e₁,…,e_d], and the universal characteristic polynomial of t is X^d−e₁X^(d−1)+…+(−1)^d e_d.

**Acceptance:**

- For d≥1 and any A-algebra R, let Z_A(R,d)=Γ^d_A(R)^ab, the quotient by the two-sided ideal generated by all commutators for the internal multiplication. Its universal law represents determinants with commutative coefficient algebras: Hom_A-alg(Z_A(R,d),B)≅Det_d(B⊗_A R,B).

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Proposition 1.6 and Example 1.7(iv), pp.9–10.

### Free divided powers and symmetric tensors

`IntegralHeckeAndGaloisDeterminants:IHG.0/free-divided-power-symmetric-tensors` · comparison

For any free A-module M, Γ^d_A(M)→(M^(⊗d))^(S_d), γ_d(m)↦m^(⊗d), is an A-linear equivalence; for a free underlying A-algebra R it respects the internal algebra multiplication.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/divided-power-degree`; `IntegralHeckeAndGaloisDeterminants:IHG.0/homogeneous-law-representability`; `IntegralHeckeAndGaloisDeterminants:IHG.0/multiplicative-law-representability`.

**Construction or proof:**

1. Choose a basis. The divided monomials ∏γ_(a_i)(e_i) and orbit sums of tensor words have the same multi-index basis and correspond with coefficient 1.

**Acceptance:**

- The orbit-sum basis avoids averaging by d!, so the comparison holds over F_p for p≤d.

**Source:** [ROBY63](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), Theorem IV.2 and Proposition IV.5, pp.277–278.

### Vaccarino universal determinant theorem

`IntegralHeckeAndGaloisDeterminants:IHG.0/vaccarino-universal-matrices` · theorem

For any set X, the determinant of the generic d×d matrices induces an isomorphism Γ^d_Z(Z{X})^ab≅E_X(d), where E_X(d) is the subring of Z[x_(a,i,j)] generated by all characteristic-polynomial coefficients of words in the generic matrices. In particular the determinant coordinate ring is torsion-free.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-coordinate-ring`; `IntegralHeckeAndGaloisDeterminants:IHG.0/free-divided-power-symmetric-tensors`.

**Construction or proof:**

1. Use the integral presentations of generic matrix invariants and their relations due to Donkin and Zubkov. Their identification with divided-power abelianization is the exact unresolved proof input, recorded below.

**Acceptance:**

- For any set X, the determinant of the generic d×d matrices induces an isomorphism Γ^d_Z(Z{X})^ab≅E_X(d), where E_X(d) is the subring of Z[x_(a,i,j)] generated by all characteristic-polynomial coefficients of words in the generic matrices. In particular the determinant coordinate ring is torsion-free.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Theorem 1.15, pp.14–15; EM23 Theorem 1.12.

### Integral Newton identities

`IntegralHeckeAndGaloisDeterminants:IHG.0/newton-identities` · lemma

For d≥1, a determinant D and r∈R, writing p_j=Tr_D(r^j) and Λ₀=1, one has kΛ_k(r)=∑_(j=1)^k(−1)^(j−1)Λ_(k−j)(r)p_j for 1≤k≤d. These identities are integral; recovering Λ_k by division requires k to be a unit.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-coordinate-ring`.

**Construction or proof:**

1. Restrict to the polynomial algebra A[t]→R and use its universal symmetric-function characteristic polynomial; compare coefficients in the logarithmic derivative identity without dividing by k.

**Acceptance:**

- For d=2, 2D(r)=Tr(r)²−Tr(r²); in characteristic two this equation alone does not recover D.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Example 1.11(ii), equation (1.3), p.12.

### Azumaya reduced-norm determinant

`IntegralHeckeAndGaloisDeterminants:IHG.0/azumaya-determinant` · construction

For an Azumaya A-algebra R of constant rank d², its reduced norm Nrd_R:R→A is the unique degree-d determinant law that becomes Matrix.det under every faithfully flat matrix splitting. Its representing coordinate ring Γ^d_A(R)^ab is canonically A.

**Prerequisites:** `mathlib:IsAzumaya`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-coordinate-ring`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-of-matrix-representation`.

**Construction or proof:**

1. Import matrix-splitting and faithfully flat descent in the Azumaya direction; descend the conjugation-invariant matrix determinant and prove uniqueness after splitting.

**Uses:**

- `Chenevier Lemmas 2.5 and 2.9`: Central-simple factors in field reconstruction.
- `IHG.0 representability`: Compatibility of the universal law with matrix descent.

**Planning API:**

- `TauCeti.Determinant.ofAzumaya` (constructor): The degree-d reduced-norm determinant.
- `TauCeti.Determinant.ofAzumaya_split` (compatibility): Under a matrix splitting it becomes Matrix.det.
- `TauCeti.Determinant.ofAzumaya_unique` (universal-property): Every degree-d determinant on R equals the reduced norm.

**Unit tests:**

- `azumaya_matrix_norm` (compatibility): For R=M₂(A), the norm is ad−bc.
- `azumaya_rank_one` (degenerate): For R=A,d=1, the norm is the identity.
- `azumaya_quaternion_norm` (computation): For the Hamilton quaternion algebra over R, Nrd(a+bi+cj+dk)=a²+b²+c²+d².

**Acceptance:**

- For an Azumaya A-algebra R of constant rank d², its reduced norm Nrd_R:R→A is the unique degree-d determinant law that becomes Matrix.det under every faithfully flat matrix splitting. Its representing coordinate ring Γ^d_A(R)^ab is canonically A.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Example 1.7(ii), p.10 and Example 2.5, p.24.

### The Cayley–Hamilton identity for determinants

`IntegralHeckeAndGaloisDeterminants:IHG.0/cayley-hamilton-identity` · lemma

For a determinant D on R, r, r_1, …, r_n ∈ R and α: D(1 + χ_α(r_1, …, r_n)·r) = 1.

**Hypotheses:** No hypothesis on A.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial-law`; `IntegralHeckeAndGaloisDeterminants:IHG.0/amitsur-formula`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.0/vaccarino-universal-matrices`.

**Construction or proof:**

1. Vaccarino's theorem: det ∘ ρ^univ induces Γ^d_ℤ(ℤ{X})^ab ≅ E_X(d), the subring of ℤ[x_{ij}] generated by characteristic-polynomial coefficients of generic matrices (gap).
2. Hence for X = R there is a ring map φ : E_X(d) → A with φ ∘ (det ∘ ρ^univ) = D ∘ π as polynomial laws, and the identity follows from the Cayley–Hamilton theorem for the generic matrices ρ^univ(r_i).

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.1/kernel-contains-cayley-hamilton`: places CH(D) inside Ker(D).

**Acceptance:**

- For i = 1 (the trace) Chenevier proves Λ_1(χ(r)r′) = 0 directly from Amitsur's formula.
- Equivalently χ_α(r_1, …, r_n) ∈ Ker(D).

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 1.12(iv) and the paragraph on Vaccarino's theorem, pp. 12–15.

### Determinants and GLn excursion pseudocharacters

`IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-gln-pseudocharacter` · comparison

For every commutative ring A, group Γ and d≥1, Chenevier determinants on A[Γ] are naturally in bijection with GL_d-valued Lafforgue pseudocharacters. This comparison needs no invertibility of d! and is distinct from comparison with the trace-only pseudocharacter.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-coordinate-ring`; `IntegralHeckeAndGaloisDeterminants:IHG.0/reductive-pseudocharacter`; `IntegralHeckeAndGaloisDeterminants:IHG.0/vaccarino-universal-matrices`; `LanglandsParameterStacks:LP3`.

**Construction or proof:**

1. Present Γ as the quotient of the free associative algebra on its elements. Use the generic-matrix invariant theorem to match the universal laws, then impose the group multiplication and inverse relations coefficientwise. The matched universal objects induce the natural bijection.

**Acceptance:**

- In characteristic p≤d the full GL_d pseudocharacter retains Λ_d even when its trace is zero.

**Source:** [EM23](https://arxiv.org/pdf/2310.03869), Theorem 4.1 and proof, pp.12–14.

## IHG.1. Cayley–Hamilton algebras and reconstruction

**Coverage: planned.** 61 declaration nodes.

**Planets:** Cayley–Hamilton algebras; Semisimple reconstruction; Henselian reconstruction; Generalized matrix algebra; Reducibility ideal; Reductive reconstruction.

### The Cayley–Hamilton ideal

`IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton-ideal` · construction

For a determinant D on R, CH(D) ⊆ R is the two-sided ideal generated by all χ_α(r_1, …, r_n) (n ≥ 1, r_i ∈ R), the coefficients of χ(t_1r_1 + ⋯ + t_nr_n) ∈ R[t_1, …, t_n].

**Hypotheses:** D a determinant.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial-law`; `mathlib:TwoSidedIdeal.span`.

**Construction or proof:**

1. Definition: TwoSidedIdeal.span of the set of all chiCoeff r α.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton`: Cayley–Hamilton means CH(D) = 0.
- `RS-12, IHG.1 owner`: 'Generic Cayley-Hamilton reconstruction with exact residual and coefficient-ring hypotheses'.

**Planning API:**

- `TauCeti.Determinant.chIdeal` (constructor): CH(D).
- `TauCeti.Determinant.chIdeal_le_kerTwoSided` (relation): CH(D) ⊆ Ker(D).
- `TauCeti.Determinant.chiCoeff_mem_chIdeal` (simp): Each χ_α(r_1, …, r_n) lies in CH(D).

**Unit tests:**

- `ch_matrix` (computation): CH(det) = 0 on M_d(A).
- `ch_upper_triangular` (computation): CH = 0 on upper-triangular matrices.
- `ch_dim_one` (computation): In dimension one CH(D) is generated by the r − D(r).

**Acceptance:**

- For det on M_d(A), CH = 0 (Cayley–Hamilton).
- CH(D) ⊆ Ker(D) (kernel-contains-cayley-hamilton).
- R/CH(D) with the induced determinant is the Cayley–Hamilton quotient used for reconstruction.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), §1.17, p. 17.

### Determinants on product algebras

`IntegralHeckeAndGaloisDeterminants:IHG.1/product-algebra-determinants` · lemma

For a nonzero commutative A with connected spectrum and A-algebras R₁,R₂, every dimension-d determinant on R₁×R₂ is uniquely a product D₁D₂, with dimensions d₁+d₂=d. Without connectedness, the dimensions are locally constant on Spec(A).

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/multiplicative-law-representability`; `IntegralHeckeAndGaloisDeterminants:IHG.0/divided-power-degree`.

**Construction or proof:**

1. Use the divided-power direct-sum decomposition Γᵈ(R₁⊕R₂)=⊕_{i+j=d}Γⁱ(R₁)⊗Γʲ(R₂), whose multiplicative product has mutually orthogonal components. A homomorphism into a connected nonzero ring selects one component.

**Acceptance:**

- For a nonzero commutative A with connected spectrum and A-algebras R₁,R₂, every dimension-d determinant on R₁×R₂ is uniquely a product D₁D₂, with dimensions d₁+d₂=d. Without connectedness, the dimensions are locally constant on Spec(A).

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 2.2(iii), pp.23–24.

### Nilpotent ideals vanish under field determinants

`IntegralHeckeAndGaloisDeterminants:IHG.1/nilpotent-ideal-kernel` · lemma

For a field k, any determinant D:R→k and two-sided J⊂R with J^s=0 satisfy J⊂ker(D); D need not be Cayley–Hamilton.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-kernel-ideal`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-kernel-characterisation`.

**Construction or proof:**

1. For x∈J and every polynomial coefficient extension, xy is nilpotent. D(1+txy) is a unit polynomial over a polynomial ring over k and has constant term one, hence equals one.

**Acceptance:**

- For a field k, any determinant D:R→k and two-sided J⊂R with J^s=0 satisfy J⊂ker(D); D need not be Cayley–Hamilton.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 2.7(v), p.27.

### Separable algebraic base change of the determinant kernel

`IntegralHeckeAndGaloisDeterminants:IHG.1/separable-kernel-base-change` · lemma

For a separable algebraic field extension K/k and D:R→k, ker(D_K)=K⊗ker(D). Purely inseparable extension is excluded.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-kernel-ideal`; `IntegralHeckeAndGaloisDeterminants:IHG.0/kernel-base-change`.

**Construction or proof:**

1. Enlarge to a normal separable extension and apply semilinear descent to the invariant subspace ker(D_K); pass through finite subextensions.

**Acceptance:**

- For a separable algebraic field extension K/k and D:R→k, ker(D_K)=K⊗ker(D). Purely inseparable extension is excluded.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 2.8(i) and Example 2.9, pp.27–28.

### Bounded algebraicity bounds simple-module dimension

`IntegralHeckeAndGaloisDeterminants:IHG.1/bounded-simple-modules` · lemma

Let R be a k-algebra whose elements have algebraic degree <n. For every simple R-module V with division endomorphism ring E, dim_E V is finite and <n; the action R→End_E(V) is surjective.

**Prerequisites:** `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-3-the-double-centralizer-density-theorem`.

**Construction or proof:**

1. Otherwise density realizes, in a subalgebra quotient, a cyclic r×r matrix of minimal-polynomial degree r for arbitrarily large r. This contradicts bounded algebraicity; finite-dimensional density then gives surjectivity.

**Acceptance:**

- Let R be a k-algebra whose elements have algebraic degree <n. For every simple R-module V with division endomorphism ring E, dim_E V is finite and <n; the action R→End_E(V) is surjective.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Proof of Lemma 2.14, pp.29–30.

### Generalized matrix algebra

`IntegralHeckeAndGaloisDeterminants:IHG.1/generalized-matrix-algebra` · definition

A GMA of block sizes (d_i) over A is an A-algebra R with orthogonal idempotents e_i summing to one, isomorphisms e_iRe_i≅M_{d_i}(A), and a cyclic A-linear trace equal to the usual matrix trace on each diagonal block. Primitive matrix units identify off-diagonal blocks with M_{d_i,d_j}(A_ij); multiplication comes from associative pairings A_ij⊗A_jk→A_ik.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/trace-pseudocharacter`.

**Construction or proof:**

1. Define the idempotent/corner data and extract A_ij from primitive matrix units. Associativity and unit axioms are inherited from R, not assumed only on the diagonal.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.1/reducibility-ideal`: Off-diagonal products generate the reducibility ideal.
- `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-extension-injection`: Off-diagonal modules control extensions.

**Planning API:**

- `TauCeti.GMA.Data` (constructor): Idempotents, corner matrix algebra isomorphisms and cyclic trace.
- `TauCeti.GMA.peirce` (equivalence): R≅⊕_(i,j)e_iRe_j as A-modules.
- `TauCeti.GMA.entryModule` (constructor): A_ij=E_i,11 R E_j,11.
- `TauCeti.GMA.pairing_assoc` (relation): The off-diagonal multiplication pairings are associative.

**Unit tests:**

- `gma_full_matrix` (compatibility): For R=M_d(A) partitioned into blocks, every A_ij=A.
- `gma_triangular` (computation): For upper triangular 2×2 matrices, A_12=A and A_21=0.
- `gma_not_free_offdiagonal` (non-example): For R=[[A,J],[A,A]] with a nonprincipal ideal J, A_12=J need not be free.

**Acceptance:**

- A GMA of block sizes (d_i) over A is an A-algebra R with orthogonal idempotents e_i summing to one, isomorphisms e_iRe_i≅M_{d_i}(A), and a cyclic A-linear trace equal to the usual matrix trace on each diagonal block. Primitive matrix units identify off-diagonal blocks with M_{d_i,d_j}(A_ij); multiplication comes from associative pairings A_ij⊗A_jk→A_ik.

**Source:** [BC09](https://arxiv.org/pdf/math/0602340), Definition 1.3.1 and Lemma 1.3.2.

### Closed-orbit representatives of invariant tuples

`IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-closed-orbit` · lemma

For a generalized reductive H over noetherian O and algebraically closed O-field k, each point of H^n//H⁰ has one closed H⁰(k)-orbit over it. The closed tuples generate H-completely reducible reduced subgroups.

**Prerequisites:** `LanglandsParameterStacks:LP3`; `IntegralHeckeAndGaloisDeterminants:IHG.0/reductive-pseudocharacter`.

**Construction or proof:**

1. Import quotient surjectivity, closed-orbit separation and the disconnected complete-reducibility criterion; apply them to the tuple prescribed by Θ_n.

**Acceptance:**

- For a generalized reductive H over noetherian O and algebraically closed O-field k, each point of H^n//H⁰ has one closed H⁰(k)-orbit over it. The closed tuples generate H-completely reducible reduced subgroups.

**Source:** [Q23](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), Lemmas 3.4–3.5, pp.12–13.

### Universal reductive pseudocharacter ring

`IntegralHeckeAndGaloisDeterminants:IHG.1/universal-reductive-pseudocharacter-ring` · construction

For Γ and generalized reductive H/O, let B_H^Γ be the colimit of O[H^m]^(H⁰) over free-group maps F_m→Γ. O-algebra maps B_H^Γ→A are exactly H-pseudocharacters with values in A. Complete at the ideal defined by a continuous finite-field Θ̄ to obtain its pseudodeformation ring R_Θ̄.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/reductive-pseudocharacter`; `LanglandsParameterStacks:LP3`.

**Construction or proof:**

1. Use the full word-substitution diagram, then its universal colimit. Complete at the residual evaluation ideal; the topology and continuous deformation universal property are separate assertions.

**Uses:**

- `GlobalShtukasAndFunctionFieldLanglands:GS.5`: Imports the universal pseudocharacter coefficient object.
- `LanglandsParameterStacks:LP2`: Imports reconstruction and the invariant-word presentation.

**Planning API:**

- `TauCeti.ReductivePseudocharacter.universalRing` (constructor): The invariant-word colimit B_H^Γ.
- `TauCeti.ReductivePseudocharacter.universalRing_equiv` (equivalence): Hom_O(B_H^Γ,A)≃PC_H^Γ(A).
- `TauCeti.ReductivePseudocharacter.deformationRing` (constructor): The residual-adic completion representing continuous pseudodeformations.

**Unit tests:**

- `reductive_universal_trivial` (degenerate): For the trivial target group H, B_H^Γ=O.
- `reductive_universal_rank_one` (compatibility): For H=GL₁ and Γ=Z, B_H^Γ=O[t,t⁻¹].
- `reductive_universal_gln` (compatibility): For H=GL_d, invariant-word evaluations give the universal determinant ring via the EM23 all-ring comparison.

**Acceptance:**

- For Γ and generalized reductive H/O, let B_H^Γ be the colimit of O[H^m]^(H⁰) over free-group maps F_m→Γ. O-algebra maps B_H^Γ→A are exactly H-pseudocharacters with values in A. Complete at the ideal defined by a continuous finite-field Θ̄ to obtain its pseudodeformation ring R_Θ̄.

**Source:** [Q23](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), Theorem 3.20 and Definition 5.4, pp.20,28.

### Cayley–Hamilton algebras

`IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton` · definition

A determinant D on R is Cayley–Hamilton if CH(D) = 0, equivalently if the law χ : R → R vanishes identically; (R, D) is then a Cayley–Hamilton A-algebra of degree d.

**Hypotheses:** D a determinant.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton-ideal`; `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial-law`.

**Construction or proof:**

1. Definition: chIdeal D = ⊥; the equivalence with χ = 0 is the definition of CH(D) as generated by the coefficients of χ.

**Uses:**

- `Chenevier §1.22–1.23`: Cayley–Hamilton representations and the universal Cayley–Hamilton algebra R(G, d).
- `AutomorphicCongruences:L0`: generalized matrix algebras are Cayley–Hamilton algebras.

**Planning API:**

- `TauCeti.Determinant.IsCayleyHamilton` (other): CH(D) = 0.
- `TauCeti.Determinant.isCayleyHamilton_iff` (characterisation): iff χ = 0 as a law.
- `TauCeti.Determinant.IsCayleyHamilton.baseChange` (compatibility): Stable under base change.

**Unit tests:**

- `ch_matrix_det` (computation): (M_d(A), det) is Cayley–Hamilton.
- `ch_upper_triangular_not_faithful` (computation): Upper-triangular matrices: Cayley–Hamilton, not faithful.
- `ch_faithful` (computation): A faithful determinant is Cayley–Hamilton.

**Acceptance:**

- (M_d(A), det) is Cayley–Hamilton and faithful; (T_d(A), det) is Cayley–Hamilton and not faithful (Example 1.20).
- Cayley–Hamilton is stable under base change and passage to subalgebras; faithfulness is not.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), §1.17, p. 17.

### The kernel contains the Cayley–Hamilton ideal

`IntegralHeckeAndGaloisDeterminants:IHG.1/kernel-contains-cayley-hamilton` · lemma

CH(D) ⊆ Ker(D) for every determinant D.

**Hypotheses:** No hypothesis on A.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-kernel-ideal`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-kernel-characterisation`; `IntegralHeckeAndGaloisDeterminants:IHG.0/cayley-hamilton-identity`; `IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton-ideal`.

**Construction or proof:**

1. Ker(D) is a two-sided ideal (determinant-kernel-ideal), so it suffices that each χ_α(r_1, …, r_n) lies in it; by the Cayley–Hamilton identity D(1 + χ_α(r_1, …, r_n) r′) = 1 after every base change, which is membership by determinant-kernel-characterisation.

**Acceptance:**

- For det on M_d(A) both are 0.
- The inclusion is strict for upper-triangular matrices (CH = 0, Ker ≠ 0).

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 1.21, p. 18.

### Corner determinant

`IntegralHeckeAndGaloisDeterminants:IHG.1/corner-determinant` · construction

For D:R→A with A nonzero and connected and e²=e in R, define D_e:eRe→A by D_e(x)=D(x+1−e), naturally after every scalar extension. Its degree r(e) is the degree of D(1−e+te); r(e)+r(1−e)=d.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/product-algebra-determinants`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`; `mathlib:IsIdempotentElem.Corner`; `mathlib:Subsemigroup.mem_corner_iff`.

**Construction or proof:**

1. Reuse Mathlib’s idempotent corner ring, whose identity is e, and give it the central A-algebra map a↦ae; do not reconstruct the carrier. Restrict D to eRe×(1−e)R(1−e) and apply product-algebra-determinants.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-irreducible`: Rank-one corners reconstruct matrix units.
- `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-multiplicity-free`: Each lifted diagonal block has its own determinant.

**Planning API:**

- `TauCeti.Determinant.corner` (constructor): D_e on the corner algebra with unit e.
- `TauCeti.Determinant.corner_rank` (characterisation): D(1−e+te)=t^{r(e)}.
- `TauCeti.Determinant.corner_complement` (compatibility): The restriction to the two diagonal corners is D_eD_(1−e).

**Unit tests:**

- `corner_matrix` (computation): For the usual determinant on M₃(A) and e=diag(1,1,0), D_e is the 2×2 determinant.
- `corner_zero` (degenerate): For e=0 the corner determinant has degree zero and constant value one.
- `corner_rank_not_trace` (non-example): Over F₂, a rank-two projection has trace zero but corner degree two.

**Acceptance:**

- For D:R→A with A nonzero and connected and e²=e in R, define D_e:eRe→A by D_e(x)=D(x+1−e), naturally after every scalar extension. Its degree r(e) is the degree of D(1−e+te); r(e)+r(1−e)=d.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 2.4(1–2), p.25.

### Adapted GMA representation ring

`IntegralHeckeAndGaloisDeterminants:IHG.1/gma-adapted-coordinate-ring` · construction

For a GMA with entry modules A_ij, the functor of representations that are the prescribed standard representations on diagonal blocks is represented by Sym_A(⊕_{i≠j}A_ij) modulo the relations xy−φ_ijk(x,y). The universal map R→M_d(B_ad) is universally injective as an A-module map.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/generalized-matrix-algebra`.

**Construction or proof:**

1. Write the multiplication relations for every composable pair; use the split injections of entry modules into the coordinate ring.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-determinant`: A genuine matrix determinant proves multiplicativity in all characteristics.

**Planning API:**

- `TauCeti.GMA.adaptedRing` (constructor): The symmetric-algebra quotient by pairing relations.
- `TauCeti.GMA.adaptedRing_equiv` (equivalence): A-algebra maps from B_ad to B correspond to adapted representations.
- `TauCeti.GMA.universalAdapted` (constructor): The universally injective adapted representation R→M_d(B_ad).

**Unit tests:**

- `adapted_one_block` (degenerate): For one block M_d(A), B_ad=A.
- `adapted_two_scalar` (computation): For the full 2×2 matrix algebra, B_ad=A[b,c]/(bc−1), with off-diagonal entries b,c.
- `adapted_triangular` (compatibility): For upper triangular 2×2 matrices, B_ad=A[b] and the universal upper entry is b.

**Acceptance:**

- For a GMA with entry modules A_ij, the functor of representations that are the prescribed standard representations on diagonal blocks is represented by Sym_A(⊕_{i≠j}A_ij) modulo the relations xy−φ_ijk(x,y). The universal map R→M_d(B_ad) is universally injective as an A-module map.

**Source:** [WE18](https://sites.pitt.edu/~caw203/pdfs/algfam.pdf), §2.3, pp.15–16; BC09 Propositions 1.3.9 and 1.3.13.

### Partition reducibility for trace pseudocharacters

`IntegralHeckeAndGaloisDeterminants:IHG.1/partition-reducibility` · lemma

For a henselian local A, a split residually multiplicity-free dimension-d trace pseudocharacter with d! invertible and a partition P of the residual constituents, I_P=∑_{i,j in different parts}tr(A_ijA_ji) is characterized by decomposition into uniquely determined trace pseudocharacters with the indicated residual sums. Quotient base change preserves I_P.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/generalized-matrix-algebra`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-trace-injective`.

**Construction or proof:**

1. Compress to the sums of block idempotents and kill return products. Conversely factor through the intersection of the constituent kernels; idempotent traces force the unwanted factors to vanish.

**Acceptance:**

- For a henselian local A, a split residually multiplicity-free dimension-d trace pseudocharacter with d! invertible and a partition P of the residual constituents, I_P=∑_{i,j in different parts}tr(A_ijA_ji) is characterized by decomposition into uniquely determined trace pseudocharacters with the indicated residual sums. Quotient base change preserves I_P.

**Source:** [BC09](https://arxiv.org/pdf/math/0602340), Proposition 1.5.1, pp.32–34.

### Extremal reconstruction tuple

`IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-stable-tuple` · lemma

For Θ an H-pseudocharacter over algebraically closed k, there is a finite tuple δ maximizing first the dimension and then the component count of its minimal parabolic, and minimizing first dimension and then component count of its centralizer among those maximizers.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-closed-orbit`; `LanglandsParameterStacks:LP3`.

**Construction or proof:**

1. Parabolic conjugacy classes are finite, so their dimensions and component counts are bounded. The nonempty maximizing class has centralizers with least dimension and then least finite component count.

**Acceptance:**

- For Θ an H-pseudocharacter over algebraically closed k, there is a finite tuple δ maximizing first the dimension and then the component count of its minimal parabolic, and minimizing first dimension and then component count of its centralizer among those maximizers.

**Source:** [Q23](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), Proof of Theorem 3.7, conditions (1–4), p.13.

### Noetherianity for finitely generated profinite groups

`IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-pseudodeformation-noetherian` · theorem

If O is complete noetherian local with finite residue field, H/O is generalized reductive, Γ is topologically finitely generated and Θ̄ is continuous over a finite field, then R_Θ̄ is noetherian.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/universal-reductive-pseudocharacter-ring`; `IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-reductive-pseudocharacter`; `LanglandsParameterStacks:LP3`.

**Construction or proof:**

1. A finite generating tuple and invariant finite generation give a finite tangent space after comparing to the completed finite-tuple quotient. Complete local Nakayama gives a quotient of a finite-variable formal power-series ring.

**Acceptance:**

- If O is complete noetherian local with finite residue field, H/O is generalized reductive, Γ is topologically finitely generated and Θ̄ is continuous over a finite field, then R_Θ̄ is noetherian.

**Source:** [Q23](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), Theorem 5.7 and proof, pp.28–29.

### Cayley–Hamilton is stable under base change

`IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton-base-change` · lemma

If D is Cayley–Hamilton, so is D ⊗_A S for every commutative A-algebra S.

**Hypotheses:** S commutative A-algebra.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-base-change`; `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial-law`.

**Construction or proof:**

1. χ(D ⊗ S) = χ(D) ⊗ S as polynomial laws (determinant-base-change), and χ(D) = 0.

**Acceptance:**

- Faithfulness is not stable under base change in general.
- Used to pass from A to its residue fields in reconstruction.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), §1.17, p. 17.

### Cayley–Hamilton restricts to subalgebras

`IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton-subalgebra` · lemma

If D is Cayley–Hamilton on R and φ : R′ → R is an injective A-algebra map, then D ∘ φ is Cayley–Hamilton on R′.

**Hypotheses:** φ injective.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-restriction`; `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial-law`.

**Construction or proof:**

1. χ(D ∘ φ) = φ ∘ χ(D) as laws R′ → R (restriction), so φ(χ_α(r)) = χ_α(φ r) = 0 and injectivity gives χ_α(r) = 0.

**Acceptance:**

- Faithfulness does not restrict: det on upper-triangular matrices (Example 1.20(ii)).
- Injectivity is needed: a quotient of a Cayley–Hamilton algebra need not be one for the pulled-back determinant.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Example 1.20(ii), p. 18.

### Faithful determinants are Cayley–Hamilton

`IntegralHeckeAndGaloisDeterminants:IHG.1/faithful-cayley-hamilton` · lemma

If D is faithful, then (R, D) is a Cayley–Hamilton algebra. In particular the faithful quotient R/Ker(D) of any determinant is Cayley–Hamilton.

**Hypotheses:** D faithful.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/kernel-contains-cayley-hamilton`; `IntegralHeckeAndGaloisDeterminants:IHG.0/kernel-quotient-faithful`; `IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton`.

**Construction or proof:**

1. CH(D) ⊆ Ker(D) = 0 (kernel-contains-cayley-hamilton); the quotient case uses kernel-quotient-faithful.

**Acceptance:**

- The converse fails (upper-triangular matrices).
- This is the starting point of reconstruction: the faithful quotient is a finite Cayley–Hamilton algebra carrying the determinant.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 1.21, p. 18.

### Cayley–Hamilton corner restriction

`IntegralHeckeAndGaloisDeterminants:IHG.1/corner-cayley-hamilton` · lemma

If D is Cayley–Hamilton, D_e is Cayley–Hamilton. If D is faithful, D_e is faithful. Corner formation commutes with arbitrary scalar extension because eRe is a direct summand of R.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/corner-determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-one-add-mul-comm`.

**Construction or proof:**

1. For faithfulness move factors using D(1+xy)=D(1+yx). For Cayley–Hamilton evaluate at x and x+1−e, obtaining P(x)x^s=P(x)(x−1)^s=0; Bezout for X^s and (X−1)^s gives P(x)=0. Repeat universally after scalar extension.

**Acceptance:**

- If D is Cayley–Hamilton, D_e is Cayley–Hamilton. If D is faithful, D_e is faithful. Corner formation commutes with arbitrary scalar extension because eRe is a direct summand of R.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 2.4(3), p.25.

### Cayley–Hamilton unit criterion

`IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton-unit-criterion` · lemma

For a Cayley–Hamilton determinant D:R→A and x∈R, x is a unit iff D(x) is a unit in A.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton`; `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial`.

**Construction or proof:**

1. One direction is multiplicativity. If the constant coefficient is a unit, the characteristic-polynomial identity expresses an inverse of x as a polynomial in x.

**Acceptance:**

- For a Cayley–Hamilton determinant D:R→A and x∈R, x is a unit iff D(x) is a unit in A.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Proof of Lemma 2.7(i), p.27.

### Rank-one Cayley–Hamilton algebras

`IntegralHeckeAndGaloisDeterminants:IHG.1/rank-one-cayley-hamilton` · lemma

A degree-one Cayley–Hamilton determinant D:R→A makes algebraMap A R an isomorphism with inverse D; every element x equals D(x)·1.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-dimension-one`.

**Construction or proof:**

1. The degree-one characteristic polynomial is X−D(x), so its Cayley–Hamilton identity gives the inverse algebra maps.

**Acceptance:**

- A degree-one Cayley–Hamilton determinant D:R→A makes algebraMap A R an isomorphism with inverse D; every element x equals D(x)·1.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 2.6, p.26.

### Canonical GMA determinant

`IntegralHeckeAndGaloisDeterminants:IHG.1/gma-determinant` · construction

A dimension-d GMA has a canonical Cayley–Hamilton determinant D_E:R→A, given by the signed cycle product of its scalar corner pairings. It has the prescribed cyclic trace and agrees after any scalar extension with the determinant of the universal adapted representation. No factorial is inverted.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/generalized-matrix-algebra`; `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-adapted-coordinate-ring`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-of-matrix-representation`.

**Construction or proof:**

1. Cyclic trace makes the cycle scalar independent of the starting index. The universal split embedding converts the formula to the usual matrix determinant, proving multiplicativity and the Cayley–Hamilton identity.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.1/reducibility-ideal`: Determinant form of reducibility without trace denominators.

**Planning API:**

- `TauCeti.GMA.determinant` (constructor): The signed cycle-product homogeneous law.
- `TauCeti.GMA.trace_determinant` (compatibility): The determinant trace is the given GMA trace.
- `TauCeti.GMA.determinant_adapted` (compatibility): Every adapted representation realizes D_E.

**Unit tests:**

- `gma_det_two` (computation): For [[a,b],[c,d]] with scalar blocks, D_E=ad−φ(b,c).
- `gma_det_triangular` (compatibility): For triangular matrices it is the product of diagonal determinants.
- `gma_det_characteristic_two` (non-example): Over F₂ the determinant still detects a repeated scalar character although its trace is zero.

**Acceptance:**

- A dimension-d GMA has a canonical Cayley–Hamilton determinant D_E:R→A, given by the signed cycle product of its scalar corner pairings. It has the prescribed cyclic trace and agrees after any scalar extension with the determinant of the universal adapted representation. No factorial is inverted.

**Source:** [WE18](https://sites.pitt.edu/~caw203/pdfs/algfam.pdf), Proposition 2.23 and proof, pp.16–17.

### GMA extension module

`IntegralHeckeAndGaloisDeterminants:IHG.1/gma-extension-module` · definition

For distinct residual blocks i,j of a GMA S and a quotient A/J with J containing the partition reducibility ideal and singleton parts i,j, let A′_ij=∑_{k≠i,j}A_ikA_kj and E_ij=A_ij/A′_ij. Linear functionals E_ij→A/J give the off-diagonal entries of extensions of ρ_j by ρ_i.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/generalized-matrix-algebra`; `IntegralHeckeAndGaloisDeterminants:IHG.1/partition-reducibility`.

**Construction or proof:**

1. Take the sum of intermediate-block multiplication images and its module quotient.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-extension-injection`: Its dual supplies actual extension classes.

**Planning API:**

- `TauCeti.GMA.extensionModule` (constructor): E_ij=A_ij/(∑_{k≠i,j}A_ikA_kj).
- `TauCeti.GMA.extension_offDiagonal` (relation): The multiplication defect of the ij block vanishes in E_ij.
- `TauCeti.GMA.extensionModule_twoBlocks` (compatibility): For two blocks E_12=A_12.

**Unit tests:**

- `extension_two_blocks` (degenerate): With two blocks the intermediate sum is zero.
- `extension_three_full` (computation): For three scalar blocks of M₃(A), A_13/A_12A_23=0.
- `extension_triangular` (characterisation): For [[A,B],[0,A]], the upper extension module is B.

**Acceptance:**

- For distinct residual blocks i,j of a GMA S and a quotient A/J with J containing the partition reducibility ideal and singleton parts i,j, let A′_ij=∑_{k≠i,j}A_ikA_kj and E_ij=A_ij/A′_ij. Linear functionals E_ij→A/J give the off-diagonal entries of extensions of ρ_j by ρ_i.

**Source:** [BC09](https://arxiv.org/pdf/math/0602340), §1.5.3, p.35.

### Universal Cayley–Hamilton algebra

`IntegralHeckeAndGaloisDeterminants:IHG.1/universal-cayley-hamilton-algebra` · construction

For a group G and d≥1, let Z(G,d) represent dimension-d determinants on Z[G]. Its universal Cayley–Hamilton algebra is R(G,d)=(Z(G,d)⊗Z Z[G])/CH(D_univ), with the descended determinant. Maps to a Cayley–Hamilton algebra carrying a G-representation and compatible determinant are uniquely induced by this quotient.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-coordinate-ring`; `IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton-ideal`; `IntegralHeckeAndGaloisDeterminants:IHG.1/kernel-contains-cayley-hamilton`.

**Construction or proof:**

1. Form the universal coefficient ring, base-change the group algebra and quotient by the universal characteristic-polynomial coefficients.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.1/completed-cayley-hamilton-finite`: Constructs the adically completed algebra.
- `IntegralHeckeAndGaloisDeterminants:IHG.1/azumaya-irreducible-locus`: Provides the universal algebra on the irreducible locus.

**Planning API:**

- `TauCeti.CayleyHamilton.universalAlgebra` (constructor): The characteristic-polynomial quotient over Z(G,d).
- `TauCeti.CayleyHamilton.universalAlgebra_lift` (equivalence): Compatible Cayley–Hamilton G-representations correspond to maps from R(G,d).
- `TauCeti.CayleyHamilton.universalAlgebra_baseChange` (compatibility): The universal quotient commutes with scalar extension.

**Unit tests:**

- `universal_rank_one` (compatibility): For d=1 the universal Cayley–Hamilton algebra equals the universal character ring.
- `universal_trivial_group` (degenerate): For G={1}, R(G,d)=Z for d≥1.
- `universal_matrix_specialization` (characterisation): Specializing to a residual split absolutely irreducible determinant over henselian A gives M_d(A).

**Acceptance:**

- For a group G and d≥1, let Z(G,d) represent dimension-d determinants on Z[G]. Its universal Cayley–Hamilton algebra is R(G,d)=(Z(G,d)⊗Z Z[G])/CH(D_univ), with the descended determinant. Maps to a Cayley–Hamilton algebra carrying a G-representation and compatible determinant are uniquely induced by this quotient.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), §1.22 and Proposition 1.23, pp.18–19.

### One-entry extension of a stable tuple

`IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-one-entry-extension` · lemma

For an extremal tuple δ with closed representative g, each γ∈Γ has a unique h∈H(k) such that (g,h) is the closed representative of (δ,γ), up to H⁰(k)-conjugacy fixing g.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-stable-tuple`; `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-closed-orbit`; `LanglandsParameterStacks:LP3`.

**Construction or proof:**

1. For existence use a minimal parabolic of the extended tuple and a Levi projection of its prefix. Extremal dimension and component count force that prefix already to have closed orbit. For uniqueness the centralizers have equal dimensions and component counts; use equality on reduced k-points, not equality of possibly nonreduced group schemes.

**Acceptance:**

- For an extremal tuple δ with closed representative g, each γ∈Γ has a unique h∈H(k) such that (g,h) is the closed representative of (δ,γ), up to H⁰(k)-conjugacy fixing g.

**Source:** [Q23](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), Theorem 3.7, Claim A, pp.14–15.

### Generic Cayley–Hamilton representation algebra

`IntegralHeckeAndGaloisDeterminants:IHG.1/generic-matrix-algebra-finite` · construction

For a commutative ring A and a Cayley–Hamilton A-algebra (E,D) finite as an A-module, construct a commutative A-algebra A_gen of finite type and a universal determinant-preserving A-algebra map j:E→M_d(A_gen). For every commutative A-algebra B, A-algebra maps A_gen→B are naturally bijective with A-algebra maps f:E→M_d(B) satisfying det∘f=D_B. Finite type does not assert that A_gen is finite as an A-module.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton`; `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial`; `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial-law`.

**Construction or proof:**

1. Choose finite A-module generators of E and generic matrices for them, impose all linear, multiplicative and unit relations, then impose every polynomial coefficient of the characteristic-coefficient equations on generic linear combinations of the generators. These polarized equations impose equality as polynomial laws over arbitrary coefficient algebras.
2. The resulting quotient of a polynomial ring in finitely many matrix entries has finite type. Polynomial-law coefficient detection verifies the full determinant-preserving universal property, rather than only equality at A-points.

**Uses:**

- `GaloisDeformationRingsAndLocalModels`: Input to the BIP23 generic representation space; all local-Galois-specific geometry stays with that owner.

**Planning API:**

- `TauCeti.CayleyHamilton.genericRepresentationRing` (constructor): The finite-type coordinate algebra A_gen.
- `TauCeti.CayleyHamilton.genericRepresentation` (constructor): The universal determinant-preserving algebra map E→M_d(A_gen).
- `TauCeti.CayleyHamilton.genericRepresentationRing_equiv` (universal-property): Maps A_gen→B correspond naturally to determinant-preserving representations E→M_d(B).

**Unit tests:**

- `generic_representation_degree_one` (computation): For E=A,d=1,D=id, A_gen≅A.
- `generic_representation_matrix` (characterisation): For E=M_d(A),D=det, the identity representation gives a specialization A_gen→A.
- `generic_representation_not_finite_module` (non-example): For d=2 and E=A×A with D(a,b)=ab, complementary rank-one idempotent matrices vary; over a field their coordinate ring has positive dimension and is not finite as a vector space.

**Acceptance:**

- For a commutative ring A and a Cayley–Hamilton A-algebra (E,D) finite as an A-module, construct a commutative A-algebra A_gen of finite type and a universal determinant-preserving A-algebra map j:E→M_d(A_gen). For every commutative A-algebra B, A-algebra maps A_gen→B are naturally bijective with A-algebra maps f:E→M_d(B) satisfying det∘f=D_B. Finite type does not assert that A_gen is finite as an A-module.

**Source:** [BIP23](https://arxiv.org/pdf/2110.01638), Lemma 3.1 and proof, pp.10–11.

### Bound on orthogonal nonzero corners

`IntegralHeckeAndGaloisDeterminants:IHG.1/orthogonal-corner-bound` · lemma

For a dimension-d Cayley–Hamilton determinant over nonzero connected A, every nonzero idempotent e has r(e)>0. A family of nonzero orthogonal idempotents has length at most d; its corner ranks sum to d iff its sum is one.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/corner-determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.1/corner-cayley-hamilton`.

**Construction or proof:**

1. A degree-zero Cayley–Hamilton corner is zero. Apply complement additivity repeatedly to the family and its complementary idempotent.

**Acceptance:**

- For a dimension-d Cayley–Hamilton determinant over nonzero connected A, every nonzero idempotent e has r(e)>0. A family of nonzero orthogonal idempotents has length at most d; its corner ranks sum to d iff its sum is one.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 2.4(4), pp.25–26.

### Field Cayley–Hamilton radical and kernel

`IntegralHeckeAndGaloisDeterminants:IHG.1/field-radical-kernel` · lemma

For a Cayley–Hamilton determinant D:R→k over a field, ker(D)=Rad(R), and every element of this ideal satisfies x^d=0. This gives a nil ideal, without a uniform ideal-power bound in small characteristic.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-kernel-ideal`; `IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton-unit-criterion`; `IntegralHeckeAndGaloisDeterminants:IHG.1/separable-kernel-base-change`; `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-0-the-jacobson-radical-and-the-semisimplicity-criterion-supporting-api-optional`.

**Construction or proof:**

1. The unit criterion gives ker(D)⊂Rad(R). After separable extension to an infinite field, the radical consists of nilpotent elements by integrality of k[x], and the universal kernel criterion gives the reverse inclusion.

**Acceptance:**

- For a Cayley–Hamilton determinant D:R→k over a field, ker(D)=Rad(R), and every element of this ideal satisfies x^d=0. This gives a nil ideal, without a uniform ideal-power bound in small characteristic.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 2.8(ii), pp.27–28.

### Off-diagonal extension injection

`IntegralHeckeAndGaloisDeterminants:IHG.1/gma-extension-injection` · theorem

Under the extension-module hypotheses, the upper-block formula defines an injective A/J-linear map Hom_A(E_ij,A/J)→Ext¹_{R/JR}(ρ_j,ρ_i). Its image consists of extensions factoring through the chosen Cayley–Hamilton quotient S.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-extension-module`.

**Construction or proof:**

1. The intermediate multiplication defect is killed by the functional, giving a block upper-triangular algebra representation. A splitting compatible with diagonal matrix units makes its off-diagonal functional zero, proving injectivity.

**Acceptance:**

- Under the extension-module hypotheses, the upper-block formula defines an injective A/J-linear map Hom_A(E_ij,A/J)→Ext¹_{R/JR}(ρ_j,ρ_i). Its image consists of extensions factoring through the chosen Cayley–Hamilton quotient S.

**Source:** [BC09](https://arxiv.org/pdf/math/0602340), Theorem 1.5.5 and proof, pp.35–36.

### Two-entry extension of a stable tuple

`IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-two-entry-extension` · lemma

The stable-tuple construction extends uniquely to (δ,γ,γ′); its one-entry projections and the tuple with final entry hh′ have closed H⁰-orbits.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-one-entry-extension`; `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-stable-tuple`; `LanglandsParameterStacks:LP3`.

**Construction or proof:**

1. Repeat the one-entry argument for two appended entries. A minimal parabolic of the extended tuple is also minimal for the prefix, so a Levi containing all entries proves the prefix and product subgroups completely reducible.

**Acceptance:**

- The stable-tuple construction extends uniquely to (δ,γ,γ′); its one-entry projections and the tuple with final entry hh′ have closed H⁰-orbits.

**Source:** [Q23](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), Theorem 3.7, Claims B–C, p.15.

### Finiteness of simple factors

`IntegralHeckeAndGaloisDeterminants:IHG.1/bounded-finite-simple-factors` · lemma

If R has zero radical, is algebraic with a uniform degree bound and has a uniform bound on orthogonal nonzero idempotents, it has finitely many simple-module isomorphism classes and is their finite product of full endomorphism algebras.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/bounded-simple-modules`; `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-0-the-jacobson-radical-and-the-semisimplicity-criterion-supporting-api-optional`; `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-2-artin-wedderburn-assembled-with-uniqueness`; `IntegralHeckeAndGaloisDeterminants:IHG.1/orthogonal-corner-bound`.

**Construction or proof:**

1. For finitely many inequivalent simple modules apply simultaneous density. Lift the factor idempotents in the algebraic ring; their bound bounds the number of factors. Radical zero supplies injectivity.

**Acceptance:**

- If R has zero radical, is algebraic with a uniform degree bound and has a uniform bound on orthogonal nonzero idempotents, it has finitely many simple-module isomorphism classes and is their finite product of full endomorphism algebras.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Proof of Lemma 2.14, p.30.

### Projective-cover description of GMA extensions

`IntegralHeckeAndGaloisDeterminants:IHG.1/gma-projective-cover-extensions` · theorem

For a GMA S, M_j=SE_j is a finitely generated projective left S-module. Its quotient gives ρ_j, and applying Hom to its kernel identifies the extensions that factor through S with the functionals on E_ij. This identifies the image of gma-extension-injection, without asserting it equals all extensions over a larger R.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-extension-module`; `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-extension-injection`.

**Construction or proof:**

1. Use the primitive idempotent projective summand and compute its kernel entries; quotient out the intermediate products and apply the Hom/Ext long exact sequence.

**Acceptance:**

- For a GMA S, M_j=SE_j is a finitely generated projective left S-module. Its quotient gives ρ_j, and applying Hom to its kernel identifies the extensions that factor through S with the functionals on E_ij. This identifies the image of gma-extension-injection, without asserting it equals all extensions over a larger R.

**Source:** [BC09](https://arxiv.org/pdf/math/0602340), Theorem 1.5.6, pp.36–37.

### Multiplicativity of reconstructed points

`IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-reconstructed-homomorphism` · lemma

The assignments γ↦h from one-entry-extension satisfy ρ(γγ′)=ρ(γ)ρ(γ′), ρ(1)=1 and Θ_ρ=Θ.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-one-entry-extension`; `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-two-entry-extension`; `IntegralHeckeAndGaloisDeterminants:IHG.0/reductive-pseudocharacter`.

**Construction or proof:**

1. The multiplication substitution axiom identifies the product tuple with the prescribed invariant point. Closedness and uniqueness identify its last entry. Arbitrary reindexing then identifies all invariant evaluations.

**Acceptance:**

- The assignments γ↦h from one-entry-extension satisfy ρ(γγ′)=ρ(γ)ρ(γ′), ρ(1)=1 and Θ_ρ=Θ.

**Source:** [Q23](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), End of proof of Theorem 3.7, p.15.

### Centers of bounded algebraic semisimple factors

`IntegralHeckeAndGaloisDeterminants:IHG.1/bounded-centers` · lemma

Under Lemma 2.14 hypotheses over k and k^sep, the division factors are finite over their centers. Their center extensions have finite separable part and purely inseparable exponent bounded by the largest p-power below n. Finite dimension over k follows if k is perfect, [k:k^p]<∞, or p>n.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/bounded-finite-simple-factors`; `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-4-central-simple-algebras-and-their-tensor-products`.

**Construction or proof:**

1. Decompose the commutative center by its bounded idempotents and algebraic-degree condition. Over k^sep the residual division algebras are bounded purely inseparable over the center; use the central-simple dimension argument in the source.

**Acceptance:**

- Under Lemma 2.14 hypotheses over k and k^sep, the division factors are finite over their centers. Their center extensions have finite separable part and purely inseparable exponent bounded by the largest p-power below n. Finite dimension over k follows if k is perfect, [k:k^p]<∞, or p>n.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 2.14, pp.29–30.

### Reductive pseudocharacter reconstruction

`IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-reconstruction` · theorem

For generalized reductive H over noetherian O, any H-pseudocharacter of Γ with values in an algebraically closed O-field k is realized by an H-completely reducible homomorphism Γ→H(k), unique up to H⁰(k)-conjugation. This uses full invariant tuples, not only the trace of a chosen linear representation.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-reconstructed-homomorphism`; `LanglandsParameterStacks:LP3`.

**Construction or proof:**

1. Construct the homomorphism from the stable tuple and take its H-semisimplification. For uniqueness choose a finite tuple detecting all parabolic/Levi containments and the centralizer of the whole image, then apply one-entry uniqueness.

**Acceptance:**

- For generalized reductive H over noetherian O, any H-pseudocharacter of Γ with values in an algebraically closed O-field k is realized by an H-completely reducible homomorphism Γ→H(k), unique up to H⁰(k)-conjugation. This uses full invariant tuples, not only the trace of a chosen linear representation.

**Source:** [Q23](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), Theorem 3.7, pp.13–15.

### Determinants on split simple factors

`IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-factor-determinants` · lemma

Over algebraically closed k, a faithful dimension-d determinant identifies its algebra with ∏_iM_{n_i}(k) and is ∏_idet_i^{m_i}, with positive m_i and ∑_in_im_i=d.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/kernel-quotient-faithful`; `IntegralHeckeAndGaloisDeterminants:IHG.1/field-radical-kernel`; `IntegralHeckeAndGaloisDeterminants:IHG.1/bounded-finite-simple-factors`; `IntegralHeckeAndGaloisDeterminants:IHG.1/bounded-centers`; `IntegralHeckeAndGaloisDeterminants:IHG.1/product-algebra-determinants`; `IntegralHeckeAndGaloisDeterminants:IHG.0/azumaya-determinant`.

**Construction or proof:**

1. Apply bounded algebraicity and orthogonal-corner bounds to the faithful quotient. Algebraic closedness splits the factors. Classify multiplicative homogeneous laws on each matrix algebra by conjugate diagonal corners, elementary matrices and Amitsur expansion.

**Acceptance:**

- Over algebraically closed k, a faithful dimension-d determinant identifies its algebra with ∏_iM_{n_i}(k) and is ∏_idet_i^{m_i}, with positive m_i and ∑_in_im_i=d.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Proof of Theorem 2.12, pp.30–31.

### Discrete continuity of reductive reconstruction

`IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-discrete-continuity` · theorem

For a split connected reductive H/Z, profinite Γ and algebraically closed discrete field k, a continuous H-pseudocharacter reconstructs a continuous H-completely reducible representation. It factors through a finite quotient of Γ.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-reconstruction`; `IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-reductive-pseudocharacter`; `LanglandsParameterStacks:LP3`.

**Construction or proof:**

1. Fix the uniqueness tuple. Finite generation of its invariant coordinate algebra makes finitely many continuous discrete evaluations constant near 1. Intersect their open normal neighborhoods; uniqueness makes the representation trivial there.

**Acceptance:**

- For a split connected reductive H/Z, profinite Γ and algebraically closed discrete field k, a continuous H-pseudocharacter reconstructs a continuous H-completely reducible representation. It factors through a finite quotient of Γ.

**Source:** [BHKT19](https://arxiv.org/pdf/1609.03491), Proposition 4.7(iii) and proof, p.16.

### Characteristic-zero valued continuity of reconstruction

`IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-valued-continuity` · theorem

For split connected reductive H/Z, profinite Γ and algebraically closed characteristic-zero field k carrying a rank-one valuation topology, continuity of the H-pseudocharacter implies continuity of its H-completely reducible realization.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-reconstruction`; `IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-reductive-pseudocharacter`.

**Construction or proof:**

1. Use the valuation continuity theorem cited to V. Lafforgue Proposition 5.7, with the full closed-orbit pseudocharacter.

**Acceptance:**

- For split connected reductive H/Z, profinite Γ and algebraically closed characteristic-zero field k carrying a rank-one valuation topology, continuity of the H-pseudocharacter implies continuity of its H-completely reducible realization.

**Source:** [BHKT19](https://arxiv.org/pdf/1609.03491), Proposition 4.7(ii), p.16.

### Schur-type reductive deformation comparison

`IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-slice-reconstruction` · theorem

Let H/O be split connected reductive, O a complete DVR, and ρ̄:Γ→H(k) absolutely H-completely reducible with trivial scheme-theoretic centralizer in H_ad. Under the smooth free-orbit slice hypotheses of BHKT19 Theorem 4.10, strict H_ad-deformations of ρ̄ and pseudodeformations of Θ_ρ̄ are naturally equivalent.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-reconstruction`; `IntegralHeckeAndGaloisDeterminants:IHG.1/universal-reductive-pseudocharacter-ring`; `LanglandsParameterStacks:LP3`.

**Construction or proof:**

1. The completed tuple-to-quotient map is an H_ad formal torsor. The forget-last-coordinate square between torsors is Cartesian; lift each extra group element uniquely and use substitutions to prove multiplication.

**Acceptance:**

- Let H/O be split connected reductive, O a complete DVR, and ρ̄:Γ→H(k) absolutely H-completely reducible with trivial scheme-theoretic centralizer in H_ad. Under the smooth free-orbit slice hypotheses of BHKT19 Theorem 4.10, strict H_ad-deformations of ρ̄ and pseudodeformations of Θ_ρ̄ are naturally equivalent.

**Source:** [BHKT19](https://arxiv.org/pdf/1609.03491), Theorem 4.10 and proof, pp.17–18.

### Semisimple reconstruction of field determinants

`IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction` · theorem

Let k be algebraically closed, R any k-algebra and d≥1. Every dimension-d determinant D:R→k is det∘ρ for a semisimple representation ρ:R→M_d(k), unique up to conjugacy, with kerρ=kerD. No factorial assumption is required.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-factor-determinants`.

**Construction or proof:**

1. Take m_i copies of each standard representation of the split factors. Characteristic polynomials determine the factor multiplicities by their restrictions to the central idempotents, so the semisimple representation is unique.

**Acceptance:**

- Let k be algebraically closed, R any k-algebra and d≥1. Every dimension-d determinant D:R→k is det∘ρ for a semisimple representation ρ:R→M_d(k), unique up to conjugacy, with kerρ=kerD. No factorial assumption is required.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Theorem 2.12, pp.28–31.

### Integral model and residual semisimplification

`IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-integral-model` · theorem

For split connected reductive H/Z and continuous ρ:Γ→H(Q̄_l) with Γ profinite, a finite coefficient extension and conjugation put ρ in H(O_E). Its residual H-completely reducible semisimplification is independent up to H(F̄_l)-conjugacy of the extension and integral model.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-valued-continuity`; `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-reconstruction`; `ReductiveGroupsPartII:RG2.2`; `ReductiveGroupsPartII:RG2.3`.

**Construction or proof:**

1. Baire category puts the compact image in one finite field extension. Bruhat–Tits boundedness supplies a building fixed point; after finite extension/conjugation use an integral hyperspecial model. Reduce invariant evaluations and apply reductive reconstruction uniqueness.

**Acceptance:**

- For split connected reductive H/Z and continuous ρ:Γ→H(Q̄_l) with Γ profinite, a finite coefficient extension and conjugation put ρ in H(O_E). Its residual H-completely reducible semisimplification is independent up to H(F̄_l)-conjugacy of the extension and integral model.

**Source:** [BHKT19](https://arxiv.org/pdf/1609.03491), Theorem 4.8 and proof, pp.16–17.

### Faithful quotients over arbitrary fields

`IntegralHeckeAndGaloisDeterminants:IHG.1/field-faithful-quotient` · theorem

For any field k and dimension-d determinant, R/kerD is a finite product of matrix algebras over division rings finite over their centers, with determinant a product of reduced norms and bounded inseparable norm laws. It is finite over k under the three conditions of bounded-centers, and can fail to be finite over an arbitrary imperfect k.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/bounded-centers`; `IntegralHeckeAndGaloisDeterminants:IHG.1/separable-kernel-base-change`; `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction`; `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-4-central-simple-algebras-and-their-tensor-products`.

**Construction or proof:**

1. Use separable scalar extension, classify the semisimple factors and descend the determinant using reduced and inseparable norms.

**Acceptance:**

- For any field k and dimension-d determinant, R/kerD is a finite product of matrix algebras over division rings finite over their centers, with determinant a product of reduced norms and bounded inseparable norm laws. It is finite over k under the three conditions of bounded-centers, and can fail to be finite over an arbitrary imperfect k.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Theorem 2.16, pp.31–32.

### Residual determinant properties

`IntegralHeckeAndGaloisDeterminants:IHG.1/residual-determinant-properties` · definition

For D:R→A with A local and residue field k, its residual determinant is D̄:R/mR→k. It is split if det∘ρ̄ for a k-representation; absolutely irreducible if its reconstructed representation over k̄ is irreducible; multiplicity-free if that representation has pairwise inequivalent irreducible constituents of multiplicity one. Splitness and absolute irreducibility are separate conditions.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-base-change`; `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction`.

**Construction or proof:**

1. Base change to k and apply field reconstruction after extension to k̄.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-irreducible`: States exactly the representability hypothesis.
- `IntegralHeckeAndGaloisDeterminants:IHG.6/global-ribet-theorem`: Explains why residual coincidence uses a separate proof branch.

**Planning API:**

- `TauCeti.Determinant.residual` (constructor): Scalar extension to A/m.
- `TauCeti.Determinant.IsSplit` (characterisation): Existence of a k-linear representation realizing the determinant.
- `TauCeti.Determinant.IsAbsolutelyIrreducible` (characterisation): Irreducibility after algebraic closure.
- `TauCeti.Determinant.IsMultiplicityFree` (characterisation): Every simple constituent occurs once after algebraic closure.

**Unit tests:**

- `residual_scalar` (computation): A one-dimensional character determinant is split and absolutely irreducible.
- `residual_repeated` (non-example): χ² is split but not multiplicity-free, including in characteristic two.
- `residual_distinct` (characterisation): χψ for two distinct k-valued characters is split multiplicity-free and reducible.

**Acceptance:**

- For D:R→A with A local and residue field k, its residual determinant is D̄:R/mR→k. It is split if det∘ρ̄ for a k-representation; absolutely irreducible if its reconstructed representation over k̄ is irreducible; multiplicity-free if that representation has pairwise inequivalent irreducible constituents of multiplicity one. Splitness and absolute irreducibility are separate conditions.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Definitions 2.17–2.19, pp.32–33.

### Radical of a local Cayley–Hamilton algebra

`IntegralHeckeAndGaloisDeterminants:IHG.1/local-cayley-hamilton-radical` · lemma

For D:R→A Cayley–Hamilton with A local, Rad(R) is the inverse image of kerD̄ under R→R/mR.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/field-radical-kernel`; `IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton-unit-criterion`; `IntegralHeckeAndGaloisDeterminants:IHG.1/residual-determinant-properties`; `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-0-the-jacobson-radical-and-the-semisimplicity-criterion-supporting-api-optional`.

**Construction or proof:**

1. The inverse image has determinants of 1+x in 1+m, hence consists of radical elements by the unit criterion. Modulo it the faithful field quotient has zero radical.

**Acceptance:**

- For D:R→A Cayley–Hamilton with A local, Rad(R) is the inverse image of kerD̄ under R→R/mR.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 2.10(i), p.28.

### Residual projector from a local subgroup

`IntegralHeckeAndGaloisDeterminants:IHG.1/local-residual-projector` · lemma

Suppose two absolutely irreducible global residual representations are inequivalent and their restrictions to a subgroup H have disjoint sets of simple constituents. In their product image algebra the central projector (1,0) belongs to the image of k[H].

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/residual-determinant-properties`; `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction`.

**Construction or proof:**

1. Separate the constituent blocks in the semisimple quotient of the finite-dimensional local image. Lift the projector through its nilpotent radical; an idempotent acting nilpotently is zero, and an invertible idempotent is one.

**Acceptance:**

- Suppose two absolutely irreducible global residual representations are inequivalent and their restrictions to a subgroup H have disjoint sets of simple constituents. In their product image algebra the central projector (1,0) belongs to the image of k[H].

**Source:** [CN23](https://arxiv.org/pdf/2301.10509v3), Lemma 3.2.2(1–2), pp.48–49.

### Henselian lifting of matrix units

`IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-idempotent-lifting` · lemma

Let A be henselian local and R integral over A, with R/Rad(R)≅∏_iM_{d_i}(k). A complete orthogonal family of diagonal idempotents and matrix units in each block lifts to R, with the corresponding multiplicative relations.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/local-cayley-hamilton-radical`.

**Construction or proof:**

1. Apply henselian lifting in integral algebras, as cited in the source, rather than assuming the radical is a nilpotent ideal.

**Acceptance:**

- Let A be henselian local and R integral over A, with R/Rad(R)≅∏_iM_{d_i}(k). A complete orthogonal family of diagonal idempotents and matrix units in each block lifts to R, with the corresponding multiplicative relations.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Proof of Theorem 2.22, p.34.

### Reconstruction from rank-one corners

`IntegralHeckeAndGaloisDeterminants:IHG.1/matrix-units-reconstruction` · lemma

If R has a complete d×d matrix-unit system E_ij and E_iiRE_ii=AE_ii with faithful scalar map, the map M_d(A)→R, (a_ij)↦∑a_ijE_ij is an A-algebra isomorphism.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-idempotent-lifting`; `IntegralHeckeAndGaloisDeterminants:IHG.1/rank-one-cayley-hamilton`.

**Construction or proof:**

1. For x∈E_iiRE_jj, E_ji x belongs to the scalar jth corner, so x is a unique scalar multiple of E_ij. Decompose R using the complete diagonal idempotents.

**Acceptance:**

- If R has a complete d×d matrix-unit system E_ij and E_iiRE_ii=AE_ii with faithful scalar map, the map M_d(A)→R, (a_ij)↦∑a_ijE_ij is an A-algebra isomorphism.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Proof of Theorem 2.22(i), p.34.

### Integral lift of the local projector

`IntegralHeckeAndGaloisDeterminants:IHG.1/local-integral-projector` · lemma

In the CN23 setup with Ã finite flat over a complete DVR, Ã[1/p] a product of fields and integral characteristic coefficients, the local residual projector lifts to an idempotent ẽ in the integral local image algebra. It projects on each specified local subrepresentation, provided its residual constituents are exactly the selected block.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/local-residual-projector`; `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-idempotent-lifting`.

**Construction or proof:**

1. Apply henselian lifting to the integral local algebra. A stable lattice makes the quotient projection an idempotent reducing to zero; Nakayama makes it zero. On the subrepresentation the idempotent reduces to one and equals one.

**Acceptance:**

- In the CN23 setup with Ã finite flat over a complete DVR, Ã[1/p] a product of fields and integral characteristic coefficients, the local residual projector lifts to an idempotent ẽ in the integral local image algebra. It projects on each specified local subrepresentation, provided its residual constituents are exactly the selected block.

**Source:** [CN23](https://arxiv.org/pdf/2301.10509v3), Lemma 3.2.2(3–4), pp.48–49.

### Henselian irreducible reconstruction

`IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-irreducible` · theorem

For a dimension-d Cayley–Hamilton D:R→A over henselian local A, if D̄ is split and absolutely irreducible then R≅M_d(A) and D is the matrix determinant. Applying this to R=A[G]/CH(D) reconstructs an actual G→GL_d(A). Without residual splitness a central-simple obstruction remains.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/residual-determinant-properties`; `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-idempotent-lifting`; `IntegralHeckeAndGaloisDeterminants:IHG.1/corner-cayley-hamilton`; `IntegralHeckeAndGaloisDeterminants:IHG.1/rank-one-cayley-hamilton`; `IntegralHeckeAndGaloisDeterminants:IHG.1/matrix-units-reconstruction`; `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-factor-determinants`.

**Construction or proof:**

1. Lift the residual matrix units; the corner degrees reduce to one and hence equal one. Rank-one Cayley–Hamilton identifies the corners with A. Reconstruct the full matrix algebra, then classify its determinant.

**Acceptance:**

- For a dimension-d Cayley–Hamilton D:R→A over henselian local A, if D̄ is split and absolutely irreducible then R≅M_d(A) and D is the matrix determinant. Applying this to R=A[G]/CH(D) reconstructs an actual G→GL_d(A). Without residual splitness a central-simple obstruction remains.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Theorem 2.22(i), p.34.

### Integral compression on a stable local summand

`IntegralHeckeAndGaloisDeterminants:IHG.1/local-compression` · lemma

In the CN23 setup, x↦ẽxẽ from Ã[H] to ẽR̃ẽ is an integral algebra homomorphism when im(ẽ) is H-stable in every generic field factor. After inverting p it is the chosen local subrepresentation.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/local-integral-projector`.

**Construction or proof:**

1. On the faithful generic representation (1−ẽ)xẽ=0 by stability; integrality then gives the same zero in the image algebra.

**Acceptance:**

- In the CN23 setup, x↦ẽxẽ from Ã[H] to ẽR̃ẽ is an integral algebra homomorphism when im(ẽ) is H-stable in every generic field factor. After inverting p it is the chosen local subrepresentation.

**Source:** [CN23](https://arxiv.org/pdf/2301.10509v3), Proposition 3.2.4(2), p.50.

### Multiplicity-free henselian GMA structure

`IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-multiplicity-free` · theorem

For a Cayley–Hamilton D over henselian local A with split multiplicity-free D̄, its algebra and trace admit a GMA decomposition with block sizes the residual constituent dimensions. This does not make off-diagonal modules free or yield a d-dimensional free representation over A.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/residual-determinant-properties`; `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-idempotent-lifting`; `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-irreducible`; `IntegralHeckeAndGaloisDeterminants:IHG.1/generalized-matrix-algebra`; `IntegralHeckeAndGaloisDeterminants:IHG.1/corner-cayley-hamilton`.

**Construction or proof:**

1. Lift the residual central idempotents. Their corner determinants are residually split absolutely irreducible, so each diagonal corner is a full matrix algebra by henselian-irreducible.

**Acceptance:**

- For a Cayley–Hamilton D over henselian local A with split multiplicity-free D̄, its algebra and trace admit a GMA decomposition with block sizes the residual constituent dimensions. This does not make off-diagonal modules free or yield a d-dimensional free representation over A.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Theorem 2.22(ii), p.34.

### Finiteness of completed universal Cayley–Hamilton algebras

`IntegralHeckeAndGaloisDeterminants:IHG.1/completed-cayley-hamilton-finite` · theorem

Let G be profinite, D̄ a continuous finite-field determinant, R_D its noetherian universal pseudodeformation ring, and dim_kH¹_c(G,adρ̄_ss)<∞. Then its completed Cayley–Hamilton algebra E_D is finite over R_D, and its profinite, quotient and maximal-ideal-adic topologies agree. Residual split absolute irreducibility gives E_D≅M_d(R_D).

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/universal-cayley-hamilton-algebra`; `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-irreducible`; `ArithmeticGaloisDuality:R02.1`.

**Construction or proof:**

1. The residual algebra has finite semisimple quotient and nilpotent radical under the source hypotheses; its radical cotangent space injects into finite-dimensional adjoint H¹. Apply topological Nakayama, then compare completion and quotient topologies.

**Acceptance:**

- Let G be profinite, D̄ a continuous finite-field determinant, R_D its noetherian universal pseudodeformation ring, and dim_kH¹_c(G,adρ̄_ss)<∞. Then its completed Cayley–Hamilton algebra E_D is finite over R_D, and its profinite, quotient and maximal-ideal-adic topologies agree. Residual split absolute irreducibility gives E_D≅M_d(R_D).

**Source:** [WE18](https://sites.pitt.edu/~caw203/pdfs/algfam.pdf), Proposition 3.6, pp.21–23.

### Absolutely irreducible coefficient descent

`IntegralHeckeAndGaloisDeterminants:IHG.1/coefficient-descent` · theorem

Let A⊂B be complete noetherian local rings with m_B∩A=m_A and common residue field. For a profinite G and continuous ρ:G→GL_d(B), assume residual absolute irreducibility and trρ(G)⊂A. Then ρ is conjugate by 1+M_d(m_B) to a representation into GL_d(A). More generally an already descended quotient modulo J allows the conjugator in 1+M_d(J).

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-irreducible`; `IntegralHeckeAndGaloisDeterminants:IHG.0/trace-pseudocharacter`.

**Construction or proof:**

1. Reduce square-zero descent to k[ε]. Nondegeneracy of the matrix trace pairing forces the residual kernel to act trivially in the ε-direction. The resulting derivation of M_d(k) is inner; iterate over artinian quotients and take a compatible inverse limit.
2. Induct on artinian length after reducing to a one-dimensional square-zero ideal; completeness gives compatible conjugators in the inverse limit, using scalar centralizers to adjust successive choices.

**Acceptance:**

- Let A⊂B be complete noetherian local rings with common residue field k. A representation ρ:G→GL_d(B) whose residual representation is absolutely irreducible and whose traces all lie in A is conjugate over B to an A-valued representation when A and B carry the complete local topologies and the source map preserves residue identifications.

**Source:** [CHT08](https://www.numdam.org/item/PMIHES_2008__108__1_0.pdf), Lemma 2.1.10, pp.14–15.

### Cayley–Hamilton recognition of isotypic modules

`IntegralHeckeAndGaloisDeterminants:IHG.1/brauer-nesbitt-module-recognition` · theorem

Let A be henselian local, ρ:G→GL_d(A) have split absolutely irreducible residual representation, and M be an A[G]-module annihilated by CH(detρ). Then M≅A^d⊗_AN as an A[G]-module for N=E_11M, with G acting through ρ on the first factor.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-irreducible`; `IntegralHeckeAndGaloisDeterminants:IHG.1/matrix-units-reconstruction`.

**Construction or proof:**

1. The Cayley–Hamilton quotient is M_d(A). Apply its explicit matrix-unit Morita equivalence to M; no freeness of N is asserted.

**Acceptance:**

- Let A be henselian local, ρ:G→GL_d(A) have split absolutely irreducible residual representation, and M be an A[G]-module annihilated by CH(detρ). Then M≅A^d⊗_AN as an A[G]-module for N=E_11M, with G acting through ρ on the first factor.

**Source:** [CG18](https://arxiv.org/pdf/1207.4224), Theorem 4.8 and proof.

### Two-block determinant reducibility ideal

`IntegralHeckeAndGaloisDeterminants:IHG.1/reducibility-ideal` · definition

For a split residually multiplicity-free two-block Cayley–Hamilton algebra over henselian local A, define I_red as the ideal generated by A_12A_21=A_21A_12. It is the smallest ideal J for which the determinant factors modulo J into the two determinants lifting the prescribed distinct residual factors. The factors are uniquely determined.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/generalized-matrix-algebra`; `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-multiplicity-free`.

**Construction or proof:**

1. Use the pairing product ideal; identify its universal determinant-factorization property using the all-characteristic determinant version of the reducibility theorem.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.1/global-compression`: The quotient kills exactly the off-diagonal return products.
- `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-extension-injection`: A quotient containing I_red supports extension modules.

**Planning API:**

- `TauCeti.GMA.reducibilityIdeal` (constructor): The ideal of products of opposite off-diagonal entry modules.
- `TauCeti.GMA.reducibilityIdeal_le_iff` (characterisation): I_red⊂J iff the determinant factors with the prescribed residual factors.
- `TauCeti.GMA.reducibilityIdeal_baseChange` (compatibility): Under a local quotient A→A/J, the ideal maps to I_red(A/J).

**Unit tests:**

- `reducibility_triangular` (degenerate): For an upper triangular algebra the ideal is zero.
- `reducibility_congruence` (computation): For [[A,A],[π^rA,A]] over a DVR, I_red=(π^r).
- `reducibility_full_matrix` (non-example): For M₂(A) the opposite pairing is the unit ideal; there is no two-block determinant factorization with two distinct residual characters.

**Acceptance:**

- For a split residually multiplicity-free two-block Cayley–Hamilton algebra over henselian local A, define I_red as the ideal generated by A_12A_21=A_21A_12. It is the smallest ideal J for which the determinant factors modulo J into the two determinants lifting the prescribed distinct residual factors. The factors are uniquely determined.

**Source:** [CN23](https://arxiv.org/pdf/2301.10509v3), Proposition 3.2.3, p.49, importing ANT20 Proposition 2.5.

### Continuity of reconstructed matrices

`IntegralHeckeAndGaloisDeterminants:IHG.1/continuous-matrix-reconstruction` · lemma

Let A be complete noetherian local with finite residue field, D a continuous determinant on A[G] and split absolutely irreducible residual determinant. The reconstructed ρ:G→GL_d(A) is continuous; its conjugacy class depends only on D.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-irreducible`; `IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.1/completed-cayley-hamilton-finite`.

**Construction or proof:**

1. Choose finitely many group elements whose residual trace-pairing matrix is invertible. Lift its inverse over A; every matrix coordinate of ρ(g) is an A-linear combination of continuous functions Tr(gg_i).

**Acceptance:**

- Let A be complete noetherian local with finite residue field, D a continuous determinant on A[G] and split absolutely irreducible residual determinant. The reconstructed ρ:G→GL_d(A) is continuous; its conjugacy class depends only on D.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Proof of Corollary 2.23(i), p.35; §3.11.

### Symplectic coefficient descent with prescribed multiplier

`IntegralHeckeAndGaloisDeterminants:IHG.1/symplectic-coefficient-descent` · theorem

Let A⊂B be complete noetherian local O-algebras, residue characteristic >2, and ρ:G→GSp₄(B) residually absolutely irreducible. If traces lie in A and the full multiplier character lies in Aˣ, then, under the local residue/topology hypotheses of GG12 Lemma 7.1.1, ρ is GSp₄(B)-conjugate to an A-valued symplectic representation.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/coefficient-descent`; `IntegralHeckeAndGaloisDeterminants:IHG.3/gsp4-full-similitude`.

**Construction or proof:**

1. First descend to GL₄(A). Uniqueness of the invariant alternating form up to a scalar and the invertibility of 2 give a symplectic basis with the prescribed multiplier.

**Acceptance:**

- Let A⊂B be complete noetherian local O-algebras, residue characteristic >2, and ρ:G→GSp₄(B) residually absolutely irreducible. If traces lie in A and the full multiplier character lies in Aˣ, then, under the local residue/topology hypotheses of GG12 Lemma 7.1.1, ρ is GSp₄(B)-conjugate to an A-valued symplectic representation.

**Source:** [GG12](https://arxiv.org/pdf/1001.2044), Lemma 7.1.1 and proof.

### Extension dimensions bound reducibility generators

`IntegralHeckeAndGaloisDeterminants:IHG.1/reducibility-generators-extension-bound` · lemma

For reduced noetherian henselian local A and a split residually two-block multiplicity-free trace pseudocharacter with d! invertible, the minimal number of generators of I_red is at most dim_kExt¹_S/mS(ρ̄₁,ρ̄₂)·dim_kExt¹_S/mS(ρ̄₂,ρ̄₁).

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/reducibility-ideal`; `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-extension-injection`; `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-projective-cover-extensions`.

**Construction or proof:**

1. Nakayama bounds each off-diagonal generating number by the dimension of the relevant Ext space; pairwise products of generators generate I_red.

**Acceptance:**

- For reduced noetherian henselian local A and a split residually two-block multiplicity-free trace pseudocharacter with d! invertible, the minimal number of generators of I_red is at most dim_kExt¹_S/mS(ρ̄₁,ρ̄₂)·dim_kExt¹_S/mS(ρ̄₂,ρ̄₁).

**Source:** [BC09](https://arxiv.org/pdf/math/0602340), Proposition 1.7.1, p.42.

### Classical Ribet lattice

`IntegralHeckeAndGaloisDeterminants:IHG.1/ribet-lattice` · theorem

Let A be a complete DVR with fraction field K and residue field k. If a continuous irreducible ρ:G→GL₂(K) has integral characteristic polynomials with residual determinant χ̄ψ̄ for distinct k-valued characters, there is a stable free A-lattice whose residual representation is a nonsplit extension of ψ̄ by χ̄. Reversing the choice gives the other orientation. Residual equality is excluded here.

**Hypotheses:** G is compact; K is a nonarchimedean local field with valuation ring A.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-multiplicity-free`; `IntegralHeckeAndGaloisDeterminants:IHG.1/reducibility-ideal`; `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-extension-injection`.

**Construction or proof:**

1. Use a stable lattice, then diagonalize a lifted element separating the residual characters. Its off-diagonal fractional ideals B,C are nonzero; scale a basis so B=A. Since BC⊂m, C⊂m. The upper residual cocycle is nonzero and cannot split without contradicting B=A and the diagonal idempotents.

**Acceptance:**

- Let A be a complete DVR with fraction field K and residue field k. If a continuous irreducible ρ:G→GL₂(K) has integral characteristic polynomials with residual determinant χ̄ψ̄ for distinct k-valued characters, there is a stable free A-lattice whose residual representation is a nonsplit extension of ψ̄ by χ̄. Reversing the choice gives the other orientation. Residual equality is excluded here.

**Source:** [BC09](https://arxiv.org/pdf/math/0602340), Proposition 1.7.4 and proof, pp.43–44.

### Global compression modulo reducibility

`IntegralHeckeAndGaloisDeterminants:IHG.1/global-compression` · lemma

For a two-block GMA and J⊃I_red, x↦exe modulo J is an algebra homomorphism into eRe⊗A/J and realizes the unique determinant factor lifting the selected residual constituent.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/reducibility-ideal`; `IntegralHeckeAndGaloisDeterminants:IHG.1/local-integral-projector`; `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-irreducible`.

**Construction or proof:**

1. The multiplication defect ex(1−e)ye is a matrix with entries in I_red, hence vanishes modulo J. Use uniqueness of the factor determinant.

**Acceptance:**

- For a two-block GMA and J⊃I_red, x↦exe modulo J is an algebra homomorphism into eRe⊗A/J and realizes the unique determinant factor lifting the selected residual constituent.

**Source:** [CN23](https://arxiv.org/pdf/2301.10509v3), Proposition 3.2.4(1), p.50.

### Local lifts compatible with global quotient reconstruction

`IntegralHeckeAndGaloisDeterminants:IHG.1/compatible-local-reconstruction` · theorem

With all CN23 §3.2 hypotheses, including the disjoint residual local constituents, the globally reconstructed representation over A has an Ã-valued local lift whose generic fiber is the selected local constituent. The corner basis can be chosen so its reduction agrees with the given global representation over A.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/global-compression`; `IntegralHeckeAndGaloisDeterminants:IHG.1/local-compression`; `IntegralHeckeAndGaloisDeterminants:IHG.1/coefficient-descent`.

**Construction or proof:**

1. The compressed global map is conjugate to the given ρ by the full-matrix inner-automorphism theorem. Lift the conjugating matrix through the local surjection Ã→A, conjugate the corner basis and use the local compressed map.

**Acceptance:**

- With all CN23 §3.2 hypotheses, including the disjoint residual local constituents, the globally reconstructed representation over A has an Ã-valued local lift whose generic fiber is the selected local constituent. The corner basis can be chosen so its reduction agrees with the given global representation over A.

**Source:** [CN23](https://arxiv.org/pdf/2301.10509v3), Proposition 3.2.4(3), p.50.

## IHG.2. Hecke algebras acting on complexes

**Coverage: planned.** 21 declaration nodes.

**Planets:** Idempotent splitting; Derived Hecke algebra; Cohomological ghost ideal; Nilpotence of cohomological ghosts; Local Hecke decomposition; Large-prime Hecke completion.

### Finite morphism modules for bounded finite cohomology

`IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hom-finite` · theorem

Let A be a commutative noetherian ring and M,N in D(A) have finitely generated cohomology, nonzero in only finitely many degrees. The A-module Hom_D(A)(M,N) is finitely generated. No finite-projective-dimension hypothesis is imposed.

**Prerequisites:** `mathlib:ModuleCat.finite_ext`; `mathlib:DerivedCategory`.

**Construction or proof:**

1. For shifted finite modules, identify morphisms with Ext groups and apply ModuleCat.finite_ext; negative Ext groups vanish.
2. Induct on the numbers of nonzero cohomology modules of M and N using their truncation triangles. The associated Hom exact sequences reduce each step to finite modules, submodules, quotients and extensions.

**Acceptance:**

- For A=Z/p² and M=N=Z/p in degree zero, Hom_D(A)(M,N)=Z/p, although M is not perfect.

**Source:** [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), Proof of Lemma 2.4.3, p.18.

### Idempotent completeness of the module derived category

`IntegralHeckeAndGaloisDeterminants:IHG.2/derived-idempotent-splitting` · theorem

For every ring A, any idempotent e:C→C in D(A) splits: there are C_e, i:C_e→C and p:C→C_e with p∘i=1 and i∘p=e. Consequently C≅C_e⊕C_(1−e).

**Prerequisites:** `mathlib:DerivedCategory`.

**Construction or proof:**

1. Construct the mapping telescope for the repeated idempotent and the complementary telescope. Their direct sum totalizes the identity telescope; recover the inclusion and projection from its structure maps.

**Acceptance:**

- The zero idempotent splits off the zero object; the identity splits off C.

**Source:** [BN93](https://www.numdam.org/item/CM_1993__86_2_209_0.pdf), Proposition 3.2, p.221.

### Derived Hecke image

`IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hecke-image` · construction

For a commutative A-algebra H and an A-algebra action α:H→End_D(A)(C), define T_der(C)=im(α), as an A-subalgebra of the derived endomorphism ring. The action factors through the surjection H→T_der(C).

**Prerequisites:** `mathlib:DerivedCategory`.

**Construction or proof:**

1. Use the algebra-homomorphism range; retain its faithful inclusion in End_D(A)(C), not merely a quotient-ring isomorphism.

**Uses:**

- `CompletedCohomologyPartII:CC.8`: Finite-level algebras whose inverse limit defines the completed Hecke algebra.
- `TorsionCohomologyInfrastructure:TC.2`: Algebra underlying the actual geometric action.

**Planning API:**

- `TauCeti.HeckeImage.derived` (constructor): The A-subalgebra im(α) of End_D(A)(C).
- `TauCeti.HeckeImage.mem_derived` (characterisation): t lies in T_der(C) iff t=α(h) for some h∈H.
- `TauCeti.HeckeImage.derived_action_faithful` (structure): The inclusion T_der(C)→End_D(A)(C) is injective.

**Unit tests:**

- `derived_image_zero_object` (degenerate): For C=0, the image is the zero ring.
- `derived_image_scalar` (compatibility): For C=A in degree zero and its scalar action, T_der(C)≅A.
- `derived_image_kernel` (characterisation): For H→A acting on A in degree zero, T_der(C)≅H/ker(H→A).

**Acceptance:**

- For a commutative A-algebra H and an A-algebra action α:H→End_D(A)(C), define T_der(C)=im(α), as an A-subalgebra of the derived endomorphism ring. The action factors through the surjection H→T_der(C).

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.3 immediately before Lemma 2.2.4, p.920.

### Chain Hecke image

`IntegralHeckeAndGaloisDeterminants:IHG.2/chain-hecke-image` · definition

For an A-linear chain complex C and a commutative A-algebra action α:H→End_Ch(A)(C), define T_ch(C)=im(α) as an A-subalgebra of the chain endomorphism ring.

**Prerequisites:** .

**Construction or proof:**

1. Use the algebra-homomorphism range in the explicitly chosen endomorphism ring. The carrier remembers the inclusion and quotient action.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.2/chain-derived-image-comparison`: Distinguishes the chain, homotopy, derived and cohomology images.
- `IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-ideal`: Identifies the derived-to-cohomology kernel.

**Planning API:**

- `TauCeti.HeckeImage.chain` (constructor): For an A-linear chain complex C and a commutative A-algebra action α:H→End_Ch(A)(C), define T_ch(C)=im(α) as an A-subalgebra of the chain endomorphism ring.
- `TauCeti.HeckeImage.mem_chain` (characterisation): Membership is existence of a preimage h∈H.
- `TauCeti.HeckeImage.chain_quotient` (equivalence): The image is H modulo the kernel of the specified action.

**Unit tests:**

- `chain_image_zero` (degenerate): For the zero complex the chain image is the zero ring.
- `chain_image_scalar` (computation): The scalar action on A in degree zero has image A.
- `chain_image_contractible` (non-example): For C=(A --1→ A), the identity chain map is nonzero if A≠0 although its homotopy and cohomology images are zero.

**Acceptance:**

- For an A-linear chain complex C and a commutative A-algebra action α:H→End_Ch(A)(C), define T_ch(C)=im(α) as an A-subalgebra of the chain endomorphism ring.

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §1.2 and §2.2.3–4.

### Homotopy Hecke image

`IntegralHeckeAndGaloisDeterminants:IHG.2/homotopy-hecke-image` · definition

For an A-linear chain action on C, define T_hom(C) as the image of H in End_K(A)(C), after passing to chain-homotopy classes.

**Prerequisites:** `mathlib:DerivedCategory`.

**Construction or proof:**

1. Use the algebra-homomorphism range in the explicitly chosen endomorphism ring. The carrier remembers the inclusion and quotient action.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.2/chain-derived-image-comparison`: Distinguishes the chain, homotopy, derived and cohomology images.
- `IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-ideal`: Identifies the derived-to-cohomology kernel.

**Planning API:**

- `TauCeti.HeckeImage.homotopy` (constructor): For an A-linear chain action on C, define T_hom(C) as the image of H in End_K(A)(C), after passing to chain-homotopy classes.
- `TauCeti.HeckeImage.mem_homotopy` (characterisation): Membership is existence of a preimage h∈H.
- `TauCeti.HeckeImage.homotopy_quotient` (equivalence): The image is H modulo the kernel of the specified action.

**Unit tests:**

- `homotopy_image_contractible` (degenerate): For a contractible complex the homotopy image is the zero ring.
- `homotopy_image_scalar` (computation): For A in degree zero, the scalar image is A.
- `homotopy_image_homotopy` (characterisation): Chain-homotopic actions of each h give the same homotopy-image action; equal cohomology alone does not imply this.

**Acceptance:**

- For an A-linear chain action on C, define T_hom(C) as the image of H in End_K(A)(C), after passing to chain-homotopy classes.

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §1.2 and §2.2.3–4.

### Cohomology Hecke image

`IntegralHeckeAndGaloisDeterminants:IHG.2/cohomology-hecke-image` · definition

For an A-linear action on C, define T_coh(C) as the image of H in the product ring ∏_iEnd_A(H^i(C)). For bounded cohomology only finitely many nonzero factors contribute.

**Prerequisites:** .

**Construction or proof:**

1. Use the algebra-homomorphism range in the explicitly chosen endomorphism ring. The carrier remembers the inclusion and quotient action.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.2/chain-derived-image-comparison`: Distinguishes the chain, homotopy, derived and cohomology images.
- `IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-ideal`: Identifies the derived-to-cohomology kernel.

**Planning API:**

- `TauCeti.HeckeImage.cohomology` (constructor): For an A-linear action on C, define T_coh(C) as the image of H in the product ring ∏_iEnd_A(H^i(C)). For bounded cohomology only finitely many nonzero factors contribute.
- `TauCeti.HeckeImage.mem_cohomology` (characterisation): Membership is existence of a preimage h∈H.
- `TauCeti.HeckeImage.cohomology_quotient` (equivalence): The image is H modulo the kernel of the specified action.

**Unit tests:**

- `cohomology_image_acyclic` (degenerate): Every acyclic complex has zero cohomology image.
- `cohomology_image_scalar` (computation): For A in degree zero the scalar image is A.
- `cohomology_image_ghost` (non-example): The nonzero off-diagonal Ext¹ ghost in the two-degree example maps to zero in the cohomology action.

**Acceptance:**

- For an A-linear action on C, define T_coh(C) as the image of H in the product ring ∏_iEnd_A(H^i(C)). For bounded cohomology only finitely many nonzero factors contribute.

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §1.2 and §2.2.3–4.

### Finite generation of the derived Hecke image

`IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hecke-image-finite` · lemma

If A is commutative noetherian and C has bounded finite cohomology, T_der(C) is a finite A-module for every commutative A-algebra action H→End_D(A)(C).

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hecke-image`; `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hom-finite`.

**Construction or proof:**

1. The image is an A-submodule of the finite module End_D(A)(C); noetherianity implies its finite generation.

**Acceptance:**

- If A is commutative noetherian and C has bounded finite cohomology, T_der(C) is a finite A-module for every commutative A-algebra action H→End_D(A)(C).

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §1.2, p.905.

### Chain and derived Hecke images

`IntegralHeckeAndGaloisDeterminants:IHG.2/chain-derived-image-comparison` · lemma

An action H→End_Ch(A)(C•) induces actions in K(A), D(A) and on ⊕_iH^i(C•), and surjections between their image algebras T_ch→T_hom→T_der→T_coh. A null-homotopic chain endomorphism maps to zero in every later image. If C• is K-projective, T_hom→T_der is an isomorphism.

**Prerequisites:** `mathlib:DerivedCategory.Q`; `mathlib:DerivedCategory.Qh`; `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hecke-image`; `IntegralHeckeAndGaloisDeterminants:IHG.2/chain-hecke-image`; `IntegralHeckeAndGaloisDeterminants:IHG.2/homotopy-hecke-image`; `IntegralHeckeAndGaloisDeterminants:IHG.2/cohomology-hecke-image`.

**Construction or proof:**

1. Apply the localization and cohomology functors to the action and factor their restrictions through the algebra-homomorphism ranges. K-projectivity supplies full faithfulness on morphisms from C•.

**Acceptance:**

- An acyclic complex has zero derived and cohomology images, but its chain image can contain the identity as a nonzero map.

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.3 and Lemma 2.2.4, pp.920–921.

### Cohomological ghost ideal

`IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-ideal` · definition

For C∈D(A), let G(C) be the two-sided ideal of End_D(A)(C) consisting of endomorphisms f such that H^i(f)=0 for every integer i. For a Hecke image T_der(C), let J(C)=T_der(C)∩G(C); then T_coh(C) is exactly T_der(C)/J(C).

**Prerequisites:** `mathlib:DerivedCategory`; `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hecke-image`.

**Construction or proof:**

1. Take the kernel of the algebra map induced by all homology functors; use the first isomorphism theorem for its image.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.5`: Quantified nilpotent error ideal.
- `ACC23 Lemma 2.2.4`: Kernel of the derived-to-cohomology action.

**Planning API:**

- `TauCeti.HeckeImage.ghostIdeal` (constructor): G(C)=⋂_i ker(H^i:End(C)→End(H^i(C))).
- `TauCeti.HeckeImage.mem_ghostIdeal` (characterisation): f∈G(C) iff H^i(f)=0 for every i.
- `TauCeti.HeckeImage.cohomologyImage_quotient` (equivalence): T_der(C)/J(C)≅T_coh(C), by the induced cohomology action.

**Unit tests:**

- `ghost_single_degree` (degenerate): If C has cohomology in one degree, G(C)=0.
- `ghost_ext_example` (non-example): For C=(Z/p)⊕(Z/p)[−1], an off-diagonal nonzero class in Ext¹_Z(Z/p,Z/p) defines a nonzero ghost f with f²=0.
- `ghost_kernel_image` (compatibility): For a scalar action on A in degree zero, J(C)=0 and T_coh(C)=T_der(C).

**Acceptance:**

- For C∈D(A), let G(C) be the two-sided ideal of End_D(A)(C) consisting of endomorphisms f such that H^i(f)=0 for every integer i. For a Hecke image T_der(C), let J(C)=T_der(C)∩G(C); then T_coh(C) is exactly T_der(C)/J(C).

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Lemma 2.2.4, p.920.

### Factorization through a truncation triangle

`IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-truncation-factor` · lemma

Let H^i(C)=0 outside [a,b], a<b, and let F be a product of b−a ghosts for which τ≤b−1(F)=0. Then F factors through C→H^b(C)[−b]. Any ghost g factors through τ≤b−1(C)→C. Their product F∘g is zero.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-ideal`; `mathlib:DerivedCategory`.

**Construction or proof:**

1. Use the two Hom exact sequences of the triangle τ≤b−1(C)→C→H^b(C)[−b]. For g the composite to the top cohomology object is zero by the t-structure orthogonality and H^b(g)=0. Compose the factorizations and use that consecutive triangle arrows compose to zero.

**Acceptance:**

- Let H^i(C)=0 outside [a,b], a<b, and let F be a product of b−a ghosts for which τ≤b−1(F)=0. Then F factors through C→H^b(C)[−b]. Any ghost g factors through τ≤b−1(C)→C. Their product F∘g is zero.

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Proof of Lemma 2.2.4, p.921.

### Local factors over a complete coefficient ring

`IntegralHeckeAndGaloisDeterminants:IHG.2/finite-hecke-local-factors` · theorem

Let A be a complete noetherian local ring and T a finite commutative A-algebra. T has finitely many maximal ideals, and T≅∏_mT_m. Each factor T_m is a complete noetherian local A-algebra; the projection is multiplication by a unique central idempotent e_m.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hecke-image-finite`.

**Construction or proof:**

1. Reduce the finite algebra modulo the maximal ideal of A to obtain an artinian algebra. Lift its finitely many central idempotents along the complete adic tower, then identify the resulting factors with localizations.

**Acceptance:**

- Let A be a complete noetherian local ring and T a finite commutative A-algebra. T has finitely many maximal ideals, and T≅∏_mT_m. Each factor T_m is a complete noetherian local A-algebra; the projection is multiplication by a unique central idempotent e_m.

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §1.2, p.905.

### Amplitude bound for ghost nilpotence

`IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-nilpotence` · theorem

For a ring A and C∈D(A) with H^i(C)=0 outside [a,b], a≤b, every composite of b−a+1 degree-zero ghosts is zero. Hence G(C)^(b−a+1)=0, and J(C)^(b−a+1)=0 for every Hecke image.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-ideal`; `IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-truncation-factor`.

**Construction or proof:**

1. Shift a to zero and induct on b−a. In amplitude zero, cohomology identifies C with a shifted module. For positive amplitude apply the induction hypothesis to the truncated product and the preceding factorization lemma.

**Acceptance:**

- Amplitude [0,1] gives square-zero ghosts; the Ext¹ example shows the ideal need not itself be zero.

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Lemma 2.2.4, pp.920–921.

### Localized summands of a derived Hecke action

`IntegralHeckeAndGaloisDeterminants:IHG.2/hecke-localized-complex` · construction

For a finite commutative derived Hecke image T over a complete noetherian local A, define C_m as the splitting of e_m acting on C. Then C≅⊕_mC_m in D(A), T_m acts on C_m, and H^i(C_m)≅H^i(C)_m.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hecke-image`; `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-idempotent-splitting`; `IntegralHeckeAndGaloisDeterminants:IHG.2/finite-hecke-local-factors`.

**Construction or proof:**

1. Split each orthogonal idempotent, sum the splitting maps, and use ∑e_m=1. Apply the additive cohomology functors to the resulting finite direct sum.

**Uses:**

- `CompletedCohomologyPartII:CC.8`: Finite-level input for completed localization; inverse limits belong to CC.8.
- `BP26 Lemma 2.4.3`: Ordinary/nonordinary factors of a finite derived operator algebra.

**Planning API:**

- `TauCeti.HeckeImage.localizedComplex` (constructor): C_m is the image of the idempotent e_m in D(A).
- `TauCeti.HeckeImage.localizedComplex_homology` (compatibility): H^i(C_m)=e_mH^i(C)≅H^i(C)_m.
- `TauCeti.HeckeImage.localizedComplex_decomposition` (equivalence): The sum of splitting inclusions gives ⊕_mC_m≅C.

**Unit tests:**

- `localized_zero` (degenerate): If H^*(C)_m=0 then C_m=0.
- `localized_product` (computation): For T=A×A acting diagonally on C=A⊕A in degree zero, the two summands are the two copies of A.
- `localized_homology` (compatibility): For C=M in degree zero, C_m is the usual module localization M_m in degree zero.

**Acceptance:**

- For a finite commutative derived Hecke image T over a complete noetherian local A, define C_m as the splitting of e_m acting on C. Then C≅⊕_mC_m in D(A), T_m acts on C_m, and H^i(C_m)≅H^i(C)_m.

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §1.2, p.905.

### Factorial powers of a finite operator

`IntegralHeckeAndGaloisDeterminants:IHG.2/factorial-localizing-idempotent` · lemma

Let A be a complete noetherian local ring with finite residue field, T a finite commutative A-algebra and t∈T. The powers t^{n!} converge adically to the idempotent e_t that is 1 on each local factor where t is a unit and 0 where t lies in the maximal ideal. This requires finiteness of the residue field; for an infinite field a unit need not have convergent factorial powers.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.2/finite-hecke-local-factors`.

**Construction or proof:**

1. On each finite quotient T/m_A^rT, separate the nilpotent factors from finite unit groups. Factorial powers eventually equal the unique idempotent with the prescribed components. Pass through the adic inverse limit.

**Acceptance:**

- For A=Z/p^r, t=p gives the zero idempotent; t a unit gives the identity idempotent. Over the infinite discrete field Q(t), the powers of t do not stabilize.

**Source:** [CG18](https://arxiv.org/pdf/1207.4224), §7.1, pp.72–73.

### Large-prime finite Hecke completion

`IntegralHeckeAndGaloisDeterminants:IHG.2/large-prime-hecke-completion` · theorem

Let H be a finite torsionfree Z[1/M]-module carrying a commuting Hecke algebra T⊂End(H). Assume T_Q is a finite product of number fields acting semisimply and the relevant eigenvalue systems are integral in a common splitting order. Outside finitely many rational primes, the order has no congruences between distinct eigencharacters and is étale. After an unramified splitting coefficient extension O, the completion of the finite image at one residual eigencharacter is O. The torsionfree, semisimple and no-congruence hypotheses are retained; this is not a claim for every prime or every derived Hecke image.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.2/finite-hecke-local-factors`.

**Construction or proof:**

1. Discard the torsion/discriminant/index primes of the finite order in its normalization, split its finite étale factors over O and use the absence of congruences to isolate the selected character.

**Acceptance:**

- Let H be a finite torsionfree Z[1/M]-module carrying a commuting Hecke algebra T⊂End(H). Assume T_Q is a finite product of number fields acting semisimply and the relevant eigenvalue systems are integral in a common splitting order. Outside finitely many rational primes, the order has no congruences between distinct eigencharacters and is étale. After an unramified splitting coefficient extension O, the completion of the finite image at one residual eigencharacter is O. The torsionfree, semisimple and no-congruence hypotheses are retained; this is not a claim for every prime or every derived Hecke image.

**Source:** [CGH20](https://arxiv.org/pdf/1907.08694), §3 opening and proof of Lemma 3.1, pp.4–5.

### Maximal ideals of derived and cohomology images

`IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-maximal-ideals` · lemma

For bounded C and a commutative Hecke action, T_der(C)→T_coh(C) induces a bijection on prime ideals and maximal ideals, preserving localizations of the action; it does not imply an isomorphism of the two rings.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-ideal`; `IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-nilpotence`.

**Construction or proof:**

1. Every prime contains the nilpotent kernel. Apply the quotient correspondence and retain the kernel on localized rings.

**Acceptance:**

- For bounded C and a commutative Hecke action, T_der(C)→T_coh(C) induces a bijection on prime ideals and maximal ideals, preserving localizations of the action; it does not imply an isomorphism of the two rings.

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), After Lemma 2.2.4, p.921.

### Support detected by localized cohomology

`IntegralHeckeAndGaloisDeterminants:IHG.2/hecke-support` · lemma

In the preceding situation, C_m=0 iff H^i(C)_m=0 for every i. Thus the support of the derived object over T is the union of the supports of its cohomology modules.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.2/hecke-localized-complex`.

**Construction or proof:**

1. Use homology compatibility and the detection of the zero object by all homology functors.

**Acceptance:**

- In the preceding situation, C_m=0 iff H^i(C)_m=0 for every i. Thus the support of the derived object over T is the union of the supports of its cohomology modules.

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §1.2, p.905.

### Annihilator power on a bounded complex

`IntegralHeckeAndGaloisDeterminants:IHG.2/hecke-annihilator-power` · lemma

If C has cohomology in [a,b] and an ideal I of a commutative acting algebra H annihilates every H^i(C), then I^(b−a+1) annihilates C in D(A).

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-nilpotence`; `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hecke-image`.

**Construction or proof:**

1. The image of I is contained in the ghost ideal; transport its amplitude bound back to H.

**Acceptance:**

- If C has cohomology in [a,b] and an ideal I of a commutative acting algebra H annihilates every H^i(C), then I^(b−a+1) annihilates C in D(A).

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Lemma 2.2.4, p.920.

### Operator localization as a derived summand

`IntegralHeckeAndGaloisDeterminants:IHG.2/localizing-operator-summand` · construction

For C with bounded finite cohomology over an artinian local A and t acting through a finite commutative algebra T, define C[t^{-1}] as the mapping telescope of repeated t. It is the idempotent summand e_tC supported at the maximal ideals where t is a unit; its cohomology is H^i(C)[t^{-1}]. If C is perfect, so is this summand.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.2/hecke-localized-complex`; `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-idempotent-splitting`.

**Construction or proof:**

1. Split by the artinian local factors of the finite operator-image algebra. The operator is a unit or nilpotent on each factor, so its telescope selects precisely the unit factors. Apply cohomology and preserve perfection under idempotent summands.

**Uses:**

- `CG18 §7.1`: Cuts out the chosen finite-level residual Hecke support.
- `HigherColemanTheory`: Finite-level ordinary comparison input.

**Planning API:**

- `TauCeti.HeckeImage.operatorLocalization` (constructor): The telescope of C under repeated t.
- `TauCeti.HeckeImage.operatorLocalization_homology` (compatibility): H^i(C[t^{-1}])≅H^i(C)[t^{-1}].
- `TauCeti.HeckeImage.operatorLocalization_idempotent` (equivalence): C[t^{-1}]≅e_tC.

**Unit tests:**

- `operator_nilpotent` (degenerate): If t^r=0 on C, its localization is zero.
- `operator_unit` (computation): If t is an automorphism, its localization is C.
- `operator_factors` (characterisation): For T=A×A and t=(1,0), localization selects the first summand.

**Acceptance:**

- The artinian hypothesis is essential: on C=Z_p in degree zero, inverting p gives Q_p, whereas lim p^(n!)=0 and the ordinary idempotent summand is zero.

**Source:** [CG18](https://arxiv.org/pdf/1207.4224), Lemma 7.3, p.72.

### Ordinary part of a bounded finite complex

`IntegralHeckeAndGaloisDeterminants:IHG.2/ordinary-localization-comparison` · comparison

For artinian local A and C with bounded finite cohomology, the ordinary localization C⊗_{A[T]}A[T,T^{-1}] is e_TC, with the complementary summand killed by a power of T. Its cohomology is the ordinary direct factor of H^i(C). The solid analytic localization of BP26 agrees on these discrete finite objects.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.2/localizing-operator-summand`.

**Construction or proof:**

1. Use the finite algebra A[T] image and its artinian local factors. Import the analytic scalar-extension comparison from the solid-category supplier.

**Acceptance:**

- For artinian local A and C with bounded finite cohomology, the ordinary localization C⊗_{A[T]}A[T,T^{-1}] is e_TC, with the complementary summand killed by a power of T. Its cohomology is the ordinary direct factor of H^i(C). The solid analytic localization of BP26 agrees on these discrete finite objects.

**Source:** [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), Definition 2.4.2 and Lemma 2.4.3, p.18.

### Ordinary finiteness with a bounded finite factor

`IntegralHeckeAndGaloisDeterminants:IHG.2/finite-factor-ordinary-repair` · lemma

Let A be artinian local and T=vu:M→M factor through u:M→C, v:C→M with C having bounded finite cohomology. Put U=uv on C. Then the induced maps on operator localizations identify M[T^{-1}]≅C[U^{-1}], so the ordinary cohomology of M is finite and bounded. The boundedness of C is required when invoking BP26 Lemma 2.4.3 in the proof of Lemma 2.4.6.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.2/ordinary-localization-comparison`.

**Construction or proof:**

1. The identities uT=Uu and vU=Tv induce localization maps; their composites are T and U, both invertible there. Use the bounded finite ordinary decomposition for C.

**Acceptance:**

- Let A be artinian local and T=vu:M→M factor through u:M→C, v:C→M with C having bounded finite cohomology. Put U=uv on C. Then the induced maps on operator localizations identify M[T^{-1}]≅C[U^{-1}], so the ordinary cohomology of M is finite and bounded. The boundedness of C is required when invoking BP26 Lemma 2.4.3 in the proof of Lemma 2.4.6.

**Source:** [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), Lemma 2.4.6 and proof, p.19.

## IHG.3. Integral spherical normalization

**Coverage: planned.** 17 declaration nodes.

**Planets:** Integral Hecke polynomial; Reciprocal characteristic polynomial; Spin Hecke polynomial; Dual-spin Hecke polynomial.

### Integral GLn Hecke polynomial

`IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial` · construction

For n≥1, q∈A and operators T_0,…,T_n in a commutative A-algebra with T_0=1, set P(X)=∑_{i=0}^n(−1)^i q^{i(i−1)/2}T_i X^{n−i}. For an unramified GL_n place the T_i are the characteristic functions of K diag(π repeated i times,1 repeated n−i times)K with vol(K)=1. The polynomial is monic, defined integrally, and its determinant coefficient is q^{n(n−1)/2}T_n.

**Prerequisites:** `SmoothRepresentationsOfLocalGroups:SR.4`; `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial`.

**Construction or proof:**

1. Form the finite sum in the spherical Hecke algebra; the constant and leading coefficients follow by indexing i=n and i=0.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.4`: Specified unramified Frobenius coefficients.
- `AutomorphicGaloisRepresentationsPartII:AG2.0`: Cohomological GLn normalization.

**Planning API:**

- `TauCeti.Spherical.glnPolynomial` (constructor): P(X)=∑_{i=0}^n(−1)^i q^{i(i−1)/2}T_i X^{n−i}.
- `TauCeti.Spherical.glnPolynomial_coeff` (simp): For 0≤i≤n, the coefficient of X^{n−i} is (−1)^i q^{i(i−1)/2}T_i.
- `TauCeti.Spherical.glnPolynomial_monic` (structure): If T_0=1, P is monic of degree n in a nonzero coefficient ring.

**Unit tests:**

- `gln_one` (computation): For n=1 the polynomial is X−T_1.
- `gln_two` (computation): For n=2 it is X²−T_1X+qT_2.
- `gln_coefficients` (compatibility): A homomorphism A→B transports P coefficient by coefficient, without choosing √q.

**Acceptance:**

- For n≥1, q∈A and operators T_0,…,T_n in a commutative A-algebra with T_0=1, set P(X)=∑_{i=0}^n(−1)^i q^{i(i−1)/2}T_i X^{n−i}. For an unramified GL_n place the T_i are the characteristic functions of K diag(π repeated i times,1 repeated n−i times)K with vol(K)=1. The polynomial is monic, defined integrally, and its determinant coefficient is q^{n(n−1)/2}T_n.

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.10, p.922.

### Characteristic polynomial under a character twist

`IntegralHeckeAndGaloisDeterminants:IHG.3/charpoly-scalar-twist` · lemma

For a rank-n determinant D of G, a character θ:G→A× and g∈G, twisting the group algebra by h↦θ(h)h gives χ_{D⊗θ,g}(X)=∑_{i=0}^n(−1)^i θ(g)^iΛ_i(g)X^{n−i}. Thus the determinant character changes by θ^n.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-restriction`.

**Construction or proof:**

1. Use homogeneity after extending scalars to A[X]; each degree-i coefficient scales by θ(g)^i.

**Acceptance:**

- For a rank-n determinant D of G, a character θ:G→A× and g∈G, twisting the group algebra by h↦θ(h)h gives χ_{D⊗θ,g}(X)=∑_{i=0}^n(−1)^i θ(g)^iΛ_i(g)X^{n−i}. Thus the determinant character changes by θ^n.

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.20–24, pp.932–934.

### Normalized reciprocal characteristic polynomial

`IntegralHeckeAndGaloisDeterminants:IHG.3/reciprocal-charpoly` · theorem

For a degree-n determinant and a unit g, write P_g(X)=∑a_iX^{n−i}, a_0=1 and a_n a unit. Then P_{g^{-1}}(X)=a_n^{-1}∑_{i=0}^n a_iX^i. Equivalently it is X^nP_g(X^{-1})/P_g(0). This is the monic polynomial with inverse roots.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial`.

**Construction or proof:**

1. Factor X−g^{-1}=−g^{-1}(1−Xg), apply multiplicativity and homogeneity, and compare coefficients.

**Acceptance:**

- For a degree-n determinant and a unit g, write P_g(X)=∑a_iX^{n−i}, a_0=1 and a_n a unit. Then P_{g^{-1}}(X)=a_n^{-1}∑_{i=0}^n a_iX^i. Equivalently it is X^nP_g(X^{-1})/P_g(0). This is the monic polynomial with inverse roots.

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.20, p.932.

### Normalized Satake coefficients for GLn

`IntegralHeckeAndGaloisDeterminants:IHG.3/gln-satake-coefficients` · comparison

Assume q is a unit and a square root s of q is chosen in a coefficient extension. Under S(T_i)=s^{i(n−i)}e_i(z_1,…,z_n), S(P(X))=∏_{j=1}^n(X−s^{n−1}z_j). The equality follows because i(i−1)+i(n−i)=i(n−1). The integral polynomial P is independent of the square-root extension.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial`; `SmoothRepresentationsOfLocalGroups:SR.4`.

**Construction or proof:**

1. Use the SR.4 coefficient identity, expand the product by elementary symmetric functions and compare all coefficients. Changing s changes the normalized parameters in the matching convention, rather than changing integral P.

**Acceptance:**

- Assume q is a unit and a square root s of q is chosen in a coefficient extension. Under S(T_i)=s^{i(n−i)}e_i(z_1,…,z_n), S(P(X))=∏_{j=1}^n(X−s^{n−1}z_j). The equality follows because i(i−1)+i(n−i)=i(n−1). The integral polynomial P is independent of the square-root extension.

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.10 and local-global compatibility before Theorem 2.3.1.

### Determinant coefficient of the GLn parameter

`IntegralHeckeAndGaloisDeterminants:IHG.3/gln-determinant-character` · lemma

If a degree-n determinant D has characteristic polynomial P at a specified Frobenius element F_v, then D(F_v)=q_v^{n(n−1)/2}T_{v,n}. With normalized Satake parameters z_j its value is s^{n(n−1)}∏z_j. A global determinant character follows from these values only with continuity and Frobenius-density hypotheses.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial`; `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial`.

**Construction or proof:**

1. Read the constant coefficient as (−1)^n D(F_v); uniqueness of a continuous global character is supplied by IHG.4.

**Acceptance:**

- If a degree-n determinant D has characteristic polynomial P at a specified Frobenius element F_v, then D(F_v)=q_v^{n(n−1)/2}T_{v,n}. With normalized Satake parameters z_j its value is s^{n(n−1)}∏z_j. A global determinant character follows from these values only with continuity and Frobenius-density hypotheses.

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.10, p.922.

### Arithmetic and geometric Frobenius conversion

`IntegralHeckeAndGaloisDeterminants:IHG.3/frobenius-conversion` · comparison

Fix F_v^ar with F_v^geom=(F_v^ar)^{-1}. If P is the characteristic polynomial at F_v^ar, the polynomial at F_v^geom is the normalized reciprocal of P. If a source instead specifies P at geometric Frobenius, its arithmetic polynomial is that reciprocal. ACC23 explicitly uses geometric Frobenius; importing its polynomial requires this convention conversion. Cyclotomic ε has ε(F_v^ar)=q_v and ε(F_v^geom)=q_v^{-1}.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.3/reciprocal-charpoly`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

**Construction or proof:**

1. Use the inverse relation in the unramified quotient and the reciprocal identity. Keep the choice in every local-global compatibility statement.

**Acceptance:**

- For n=1, X−u becomes X−u^{-1}, not X−u.

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Notation p.899 and §2.2.20.

### Inversion of spherical double cosets

`IntegralHeckeAndGaloisDeterminants:IHG.3/hecke-inversion` · lemma

Let ι([KgK])=[Kg^{-1}K]. For GL_n it is an involution of the commutative spherical algebra and ι(P(X))=q^{n(n−1)}P^rec(q^{1−n}X), where P^rec is its monic normalized reciprocal. Thus the corresponding determinant is D∨⊗ε^{1−n} when Frobenius is geometric as in ACC23.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial`; `IntegralHeckeAndGaloisDeterminants:IHG.3/reciprocal-charpoly`; `SmoothRepresentationsOfLocalGroups:SR.4`.

**Construction or proof:**

1. Invert the diagonal double coset: ι(T_i)=T_{n−i}T_n^{-1}. Substitute this in each coefficient and check the powers of q.

**Acceptance:**

- Let ι([KgK])=[Kg^{-1}K]. For GL_n it is an involution of the commutative spherical algebra and ι(P(X))=q^{n(n−1)}P^rec(q^{1−n}X), where P^rec is its monic normalized reciprocal. Thus the corresponding determinant is D∨⊗ε^{1−n} when Frobenius is geometric as in ACC23.

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.20, p.932.

### GSp4 spin Hecke polynomial

`IntegralHeckeAndGaloisDeterminants:IHG.3/gsp4-spin-polynomial` · construction

For q and commuting T_0,T_1,T_2, define Q(X)=X⁴−T_1X³+(qT_2+(q³+q)T_0)X²−q³T_0T_1X+q⁶T_0². At an unramified GSp4 place these are the double cosets of diag(q,q,q,q), diag(q,q,1,1), diag(q²,q,q,1), respectively, with q replaced in the matrices by the uniformizer.

**Prerequisites:** `SmoothRepresentationsOfLocalGroups:SR.4`; `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial`.

**Construction or proof:**

1. Form the displayed polynomial in the integral spherical algebra. The representation chosen on the dual group is spin, not the defining GL4 double-coset system.

**Uses:**

- `BCGP25 Lemma 1.8.28`: Conversion to the cohomological dual-spin polynomial.
- `BCGP25 Proposition 7.4.10`: Geometric-Frobenius characteristic polynomial of the GSp4-valued lift.

**Planning API:**

- `TauCeti.Spherical.gsp4SpinPolynomial` (constructor): The displayed degree-four Q.
- `TauCeti.Spherical.gsp4SpinPolynomial_constant` (simp): Q(0)=q⁶T_0².
- `TauCeti.Spherical.gsp4SpinPolynomial_map` (compatibility): Every coefficient map transports Q with q,T_0,T_1,T_2.

**Unit tests:**

- `spin_one_parameters` (computation): For q=T_0=1,T_1=4,T_2=4, Q=(X−1)⁴.
- `spin_constant` (characterisation): The constant term is the square of q³T_0.
- `spin_not_gln` (non-example): Its X² coefficient contains (q³+q)T_0, so it is not the GL4 polynomial with the same three symbols.

**Acceptance:**

- For q and commuting T_0,T_1,T_2, define Q(X)=X⁴−T_1X³+(qT_2+(q³+q)T_0)X²−q³T_0T_1X+q⁶T_0². At an unramified GSp4 place these are the double cosets of diag(q,q,q,q), diag(q,q,1,1), diag(q²,q,q,1), respectively, with q replaced in the matrices by the uniformizer.

**Source:** [BCGP25](https://arxiv.org/pdf/2502.20645v1), §1.8.27, pp.16–17; [GT05](https://numdam.org/item/AST_2005__302__177_0.pdf), §3, pp.193–196; [CG20](https://arxiv.org/pdf/1907.08691), Definition 6.7, p.838.

### Maximal ideals of Galois type

`IntegralHeckeAndGaloisDeterminants:IHG.3/galois-type-maximal-ideal` · definition

For a spherical Hecke algebra T away from a fixed finite ramification set S, a maximal ideal m of finite residue field is of Galois type if there exists a continuous semisimple ρ_m:G_{F,S}→GL_n(T/m) with the specified Frobenius polynomial at every v∉S. It is non-Eisenstein when this representation is absolutely irreducible. Existence is an input from the geometric owner; the definition does not declare every ideal to have Galois type.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial`; `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction`.

**Construction or proof:**

1. Use the existential predicate with fixed S and convention; uniqueness follows from the continuous determinant and semisimple reconstruction dictionary.

**Uses:**

- `ACC23 Theorem 2.3.7`: Hypothesis for the nilpotent-quotient lift.
- `AutomorphicGaloisRepresentations:R19.6`: Residual input to the owned generic reconstruction.

**Planning API:**

- `TauCeti.Spherical.IsGaloisType` (characterisation): The residue representation, finite residue field and Frobenius identities specified above.
- `TauCeti.Spherical.IsNonEisenstein` (characterisation): Galois type with absolutely irreducible residual representation.
- `TauCeti.Spherical.galoisType_unique` (universal-property): Two witnesses have isomorphic semisimple representations after a common algebraic closure.

**Unit tests:**

- `galois_type_rank_one` (computation): A rank-one unramified reciprocity character with T_1 values supplies a Galois-type system.
- `galois_type_reducible` (non-example): A sum of two characters gives Galois type but fails non-Eisenstein.
- `galois_type_twist` (compatibility): A character twist preserves absolute irreducibility and scales the i-th coefficient by θ(F_v)^i.

**Acceptance:**

- For a spherical Hecke algebra T away from a fixed finite ramification set S, a maximal ideal m of finite residue field is of Galois type if there exists a continuous semisimple ρ_m:G_{F,S}→GL_n(T/m) with the specified Frobenius polynomial at every v∉S. It is non-Eisenstein when this representation is absolutely irreducible. Existence is an input from the geometric owner; the definition does not declare every ideal to have Galois type.

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6, p.938.

### Rank-one normalization by reciprocity

`IntegralHeckeAndGaloisDeterminants:IHG.3/rank-one-normalization` · comparison

For GL_1, K=O_v× and T_1=[KπK], P=X−T_1. An unramified character with θ(F_v^ar)=u has arithmetic polynomial X−u and geometric polynomial X−u^{-1}. Reciprocity sends π to the explicitly chosen Frobenius, so a character evaluated under the opposite Artin convention is inverted.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial`; `IntegralHeckeAndGaloisDeterminants:IHG.3/frobenius-conversion`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

**Construction or proof:**

1. Apply the rank-one polynomial and the class-field-theory convention; compare scalar eigenvalues.

**Acceptance:**

- For GL_1, K=O_v× and T_1=[KπK], P=X−T_1. An unramified character with θ(F_v^ar)=u has arithmetic polynomial X−u and geometric polynomial X−u^{-1}. Reciprocity sends π to the explicitly chosen Frobenius, so a character evaluated under the opposite Artin convention is inverted.

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Notation and §2.2.10.

### Rank-two classical modular-form normalization

`IntegralHeckeAndGaloisDeterminants:IHG.3/rank-two-modular-normalization` · comparison

For the standard arithmetic Galois representation of a normalized eigenform f of weight k and nebentype ω at ℓ∤Np, the polynomial is X²−a_ℓX+ω(ℓ)ℓ^{k−1}. The GL_2 cohomological formula X²−T_1X+ℓT_2 agrees after T_1=a_ℓ and T_2=ω(ℓ)ℓ^{k−2}. Passing to geometric Frobenius takes its normalized reciprocal.

**Hypotheses:** The classical geometric owner supplies its eigenvalues and the stated arithmetic Frobenius characteristic polynomial; this comparison only identifies the two coefficient conventions.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial`; `IntegralHeckeAndGaloisDeterminants:IHG.3/frobenius-conversion`.

**Construction or proof:**

1. Specialize the formal GL_2 polynomial with T_1=a_ℓ and T_2=ω(ℓ)ℓ^(k−2); its constant coefficient becomes ω(ℓ)ℓ^(k−1).
2. Compare this equality with the characteristic polynomial supplied by the classical geometric construction. That construction is not a prerequisite to the general IHG.3 polynomial or to IHG.4 interpolation.
3. Apply the inverse-root polynomial conversion for geometric Frobenius. No R19.6→IHG.3→IHG.4→R19.6 dependency is introduced.

**Acceptance:**

- For the standard arithmetic Galois representation of a normalized eigenform f of weight k and nebentype ω at ℓ∤Np, the polynomial is X²−a_ℓX+ω(ℓ)ℓ^{k−1}. The GL_2 cohomological formula X²−T_1X+ℓT_2 agrees after T_1=a_ℓ and T_2=ω(ℓ)ℓ^{k−2}. Passing to geometric Frobenius takes its normalized reciprocal.

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.10, n=2 specialization.

### Satake interpretation of the spin polynomial

`IntegralHeckeAndGaloisDeterminants:IHG.3/gsp4-spin-satake` · comparison

With the spin identification of the dual GSp4 from BCGP25 §1.8.8, Q(X)=q⁶ det(Xq^{-3/2}−spin(t)), after applying the normalized Satake isomorphism and adjoining √q. Its four roots are q^{3/2} times the spin roots. Its similitude is q³T_0, including the central Hecke character.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.3/gsp4-spin-polynomial`; `SmoothRepresentationsOfLocalGroups:SR.4`.

**Construction or proof:**

1. Import SR.4 for the three double-coset transforms and expand the exterior-power characters of spin using the specified torus identification.

**Acceptance:**

- With the spin identification of the dual GSp4 from BCGP25 §1.8.8, Q(X)=q⁶ det(Xq^{-3/2}−spin(t)), after applying the normalized Satake isomorphism and adjoining √q. Its four roots are q^{3/2} times the spin roots. Its similitude is q³T_0, including the central Hecke character.

**Source:** [BCGP25](https://arxiv.org/pdf/2502.20645v1), §1.8.8 and §1.8.27; [GT05](https://numdam.org/item/AST_2005__302__177_0.pdf), §3, pp.193–196.

### GSp4 dual-spin Hecke polynomial

`IntegralHeckeAndGaloisDeterminants:IHG.3/gsp4-dual-spin-polynomial` · construction

Assume q,T_0 are units. Define P(X)=X⁴−T_0^{-1}T_1X³+T_0^{-2}(qT_2+(q³+q)T_0)X²−q³T_0^{-2}T_1X+q⁶T_0^{-2}. It satisfies P(X)=X⁴Q(q³/X)/Q(0). Its roots are q³ divided by the spin-Q roots.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.3/gsp4-spin-polynomial`; `IntegralHeckeAndGaloisDeterminants:IHG.3/reciprocal-charpoly`.

**Construction or proof:**

1. Apply normalized reciprocal followed by the scalar q³ twist and simplify the coefficients using Q(0)=q⁶T_0².

**Uses:**

- `BCGP25 Theorem 1.8.29`: Polynomial acting on the actual étale cohomology.
- `IntegralHeckeAndGaloisDeterminants:IHG.4`: Convert interpolated spin systems to cohomological systems.

**Planning API:**

- `TauCeti.Spherical.gsp4DualSpinPolynomial` (constructor): The displayed polynomial P with inverted central operator T_0.
- `TauCeti.Spherical.gsp4DualSpinPolynomial_reciprocal` (compatibility): P(X)=X⁴Q(q³/X)/Q(0).
- `TauCeti.Spherical.gsp4DualSpinPolynomial_constant` (simp): P(0)=q⁶T_0^{-2}.

**Unit tests:**

- `dual_spin_q_one` (computation): For q=T_0=1, P=Q.
- `dual_spin_roots` (compatibility): For roots β_j of Q, P has roots q³β_j^{-1}.
- `dual_spin_central` (non-example): If T_0 is not fixed to 1, P and Q have different X³ coefficients, −T_1/T_0 and −T_1.

**Acceptance:**

- Assume q,T_0 are units. Define P(X)=X⁴−T_0^{-1}T_1X³+T_0^{-2}(qT_2+(q³+q)T_0)X²−q³T_0^{-2}T_1X+q⁶T_0^{-2}. It is q¹²/Q(0) times Q(X/q³) after monic reciprocal conversion, equivalently P(X)=X⁴Q(q³/X)/Q(0). Its roots are q³ divided by the spin-Q roots.

**Source:** [BCGP25](https://arxiv.org/pdf/2502.20645v1), Equation (1.8.27) and Lemma 1.8.28, p.17.

### Dual and twist compatibility for Galois-type ideals

`IntegralHeckeAndGaloisDeterminants:IHG.3/galois-type-dual-twist` · lemma

In ACC23 geometric conventions, ι sends a Galois-type ideal m to m∨ with residual representation ρ_m∨⊗ε^{1−n}; the character automorphism f_ψ sends m to m(ψ) with residual representation ρ_m⊗ψ. Both preserve the non-Eisenstein property.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.3/galois-type-maximal-ideal`; `IntegralHeckeAndGaloisDeterminants:IHG.3/hecke-inversion`; `IntegralHeckeAndGaloisDeterminants:IHG.3/charpoly-scalar-twist`.

**Construction or proof:**

1. Apply the coefficient conversions and uniqueness of residual semisimple reconstruction.

**Acceptance:**

- In ACC23 geometric conventions, ι sends a Galois-type ideal m to m∨ with residual representation ρ_m∨⊗ε^{1−n}; the character automorphism f_ψ sends m to m(ψ) with residual representation ρ_m⊗ψ. Both preserve the non-Eisenstein property.

**Source:** [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), After Definition 2.3.6, p.938.

### Reversed spin Hecke polynomial

`IntegralHeckeAndGaloisDeterminants:IHG.3/gsp4-reversed-spin-polynomial` · construction

With Q the monic spin polynomial above, define Q_rev(X)=X⁴Q(X⁻¹)=1−T₁X+(qT₂+(q³+q)T₀)X²−q³T₀T₁X³+q⁶T₀²X⁴. Pilloni’s indexing is T_(ℓ,2)=T₁, T_(ℓ,1)=T₂, T_(ℓ,0)=T₀. This polynomial has constant term 1 and corresponds to det(1−Xr); it is distinct from the monic inverse-root polynomial.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.3/gsp4-spin-polynomial`; `IntegralHeckeAndGaloisDeterminants:IHG.3/reciprocal-charpoly`.

**Construction or proof:**

1. Reverse the four coefficient slots. For an actual rank-four matrix r, expand det(1−Xr) and compare with X⁴det(X⁻¹−r). Apply the explicitly stated Hecke-index dictionary.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.3/gsp4-geometric-dual-spin`: Compares geometric-Frobenius and contragredient conventions.
- `IntegralHeckeAndGaloisDeterminants:IHG.3/galois-type-maximal-ideal`: Residual systems must specify the full multiplier with the reversed convention.

**Planning API:**

- `TauCeti.Spherical.gsp4ReversedSpinPolynomial` (constructor): The constant-one polynomial displayed above.
- `TauCeti.Spherical.gsp4ReversedSpinPolynomial_constant` (simp): Its constant coefficient is 1.
- `TauCeti.Spherical.gsp4ReversedSpinPolynomial_det` (compatibility): For charpoly(r)=Q, det(1−Xr)=Q_rev.

**Unit tests:**

- `gsp4_reverse_constant` (computation): The coefficient of X⁰ is 1 and of X⁴ is q⁶T₀².
- `gsp4_reverse_indices` (compatibility): Pilloni’s T_(ℓ,2) is the coefficient paired with X¹, matching CG20’s T₁.
- `gsp4_reverse_not_monic_inverse` (non-example): For q=2,T₀=1, the leading coefficient is 64; Q_rev is not the monic characteristic polynomial of r⁻¹.

**Acceptance:**

- With Q the monic spin polynomial above, define Q_rev(X)=X⁴Q(X⁻¹)=1−T₁X+(qT₂+(q³+q)T₀)X²−q³T₀T₁X³+q⁶T₀²X⁴. Pilloni’s indexing is T_(ℓ,2)=T₁, T_(ℓ,1)=T₂, T_(ℓ,0)=T₀. This polynomial has constant term 1 and corresponds to det(1−Xr); it is distinct from the monic inverse-root polynomial.

**Source:** [PILLONI20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §5.1.3 pp.21–23; §15.2 p.107.

### Geometric-Frobenius dual-spin conversion

`IntegralHeckeAndGaloisDeterminants:IHG.3/gsp4-geometric-dual-spin` · comparison

For BCGP25 geometric Frobenius F_ℓ, if det(X−ρ(F_ℓ))=Q_ℓ(X), then det(X−(ρ∨⊗ε^{-3})(F_ℓ))=P_ℓ(X), because ε(F_ℓ)=ℓ^{-1}. Arithmetic Frobenius values require the normalized reciprocals of these polynomials. This conversion applies to a determinant whenever duality and the twist are defined.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.3/gsp4-spin-polynomial`; `IntegralHeckeAndGaloisDeterminants:IHG.3/gsp4-dual-spin-polynomial`; `IntegralHeckeAndGaloisDeterminants:IHG.3/charpoly-scalar-twist`; `IntegralHeckeAndGaloisDeterminants:IHG.3/frobenius-conversion`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-duality`.

**Construction or proof:**

1. Combine inverse roots with scaling by ℓ³ and use the explicit dual-spin formula.

**Acceptance:**

- For BCGP25 geometric Frobenius F_ℓ, if det(X−ρ(F_ℓ))=Q_ℓ(X), then det(X−(ρ∨⊗ε^{-3})(F_ℓ))=P_ℓ(X), because ε(F_ℓ)=ℓ^{-1}. Arithmetic Frobenius values require the normalized reciprocals of these polynomials. This conversion applies to a determinant whenever duality and the twist are defined.

**Source:** [BCGP25](https://arxiv.org/pdf/2502.20645v1), Lemma 1.8.28, p.17.

### Full similitude character under duality and twist

`IntegralHeckeAndGaloisDeterminants:IHG.3/gsp4-full-similitude` · lemma

If ρ:G→GSp4(A) has similitude μ:G→A×, then ρ∨⊗θ has similitude μ^{-1}θ². In particular the cohomological dual-spin representation ρ∨⊗ε^{-3} has μ^{-1}ε^{-6}. At BCGP25 geometric Frobenius these values are q³T_0 for ρ and q³T_0^{-1} for the converted representation. The determinant μ² does not determine μ, especially at residue characteristic two.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.3/gsp4-geometric-dual-spin`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof:**

1. Use ρᵗJρ=μJ and the contragredient identity; twisting multiplies the alternating form by θ². Retain μ as separate data.

**Acceptance:**

- Over a ring with a nontrivial square-one unit u, similitudes μ and uμ have the same square; characteristic-polynomial data alone cannot choose one.

**Source:** [BCGP25](https://arxiv.org/pdf/2502.20645v1), §1.8.7–8 and Lemma 1.8.28.

## IHG.4. Interpolation through finite quotients

**Coverage: planned.** 12 declaration nodes.

**Planets:** Frobenius uniqueness; Gluing determinants; Finite-quotient interpolation data; Integral interpolation.

### Uniqueness from Frobenius density

`IntegralHeckeAndGaloisDeterminants:IHG.4/frobenius-determinant-uniqueness` · theorem

Let A be Hausdorff and D_1,D_2 continuous degree-d determinants of G_{F,S}. If all characteristic-polynomial coefficients agree on Frobenius conjugacy classes outside S, they agree on G_{F,S}, hence D_1=D_2. Use Chebotarev on every finite quotient and conjugacy invariance; a set of chosen representatives need not itself be dense before taking conjugates.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.0/amitsur-formula`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Construction or proof:**

1. Chebotarev makes the union of Frobenius conjugacy classes dense. Each coefficient is a continuous class function into a Hausdorff ring; extend equality and recover the law by Amitsur.

**Acceptance:**

- Let A be Hausdorff and D_1,D_2 continuous degree-d determinants of G_{F,S}. If all characteristic-polynomial coefficients agree on Frobenius conjugacy classes outside S, they agree on G_{F,S}, hence D_1=D_2. Use Chebotarev on every finite quotient and conjugacy invariance; a set of chosen representatives need not itself be dense before taking conjugates.

**Source:** [SCH15](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), Corollary 5.1.10 and its use of Chenevier Example 2.32.

### Compact coefficient-ring gluing

`IntegralHeckeAndGaloisDeterminants:IHG.4/compact-determinant-gluing` · theorem

Let G be compact, A compact Hausdorff, all A_i Hausdorff, and ι:A→∏A_i a continuous injective ring map. Let D_i be continuous degree-d determinants. If for each g in a dense subset X⊂G the tuple of characteristic polynomials lies in ι(A)[X], there is a unique continuous determinant D over A with D⊗A_i=D_i. The compact closed embedding gives integrality on all G; an injective map without closed image does not suffice.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-coefficient-subring`.

**Construction or proof:**

1. The compact-to-Hausdorff injection is a closed embedding. The coefficient tuple maps G continuously into the product, so the closed-image condition extends from X to all G. Apply coefficient-subring descent to the product determinant.

**Acceptance:**

- Let G be compact, A compact Hausdorff, all A_i Hausdorff, and ι:A→∏A_i a continuous injective ring map. Let D_i be continuous degree-d determinants. If for each g in a dense subset X⊂G the tuple of characteristic polynomials lies in ι(A)[X], there is a unique continuous determinant D over A with D⊗A_i=D_i. The compact closed embedding gives integrality on all G; an injective map without closed image does not suffice.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Example 2.32, p.38.

### Compatible finite-quotient determinants

`IntegralHeckeAndGaloisDeterminants:IHG.4/finite-quotient-determinant-data` · definition

For a profinite group G and a separated complete ring A≅lim_rA/J_r with a descending cofinal system of open ideals and finite quotients, finite-quotient determinant data consist of continuous degree-d determinants D_r over A/J_r, compatible under coefficient reduction. Each D_r factors through some finite G/U_r; the U_r can be refined to be descending. No common U is required.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-iff-open-kernel`.

**Construction or proof:**

1. Define the compatible inverse-limit family and choose common refinements of finitely many normal open subgroups at each index.

**Uses:**

- `AutomorphicGaloisRepresentationsPartII:AG2.4`: Supplies the generic p-adic interpolation, independently of geometry.
- `IntegralHeckeAndGaloisDeterminants:IHG.5`: Uniform nilpotent-quotient families.

**Planning API:**

- `TauCeti.Interpolation.FiniteQuotientData` (structure): A family D_r and equality of their reductions for r≤s.
- `TauCeti.Interpolation.FiniteQuotientData.reduce` (compatibility): Reduction of D_s to A/J_r equals D_r.
- `TauCeti.Interpolation.FiniteQuotientData.refineGroup` (compatibility): Replace U_r by a smaller normal open subgroup without changing the induced determinant.

**Unit tests:**

- `quotient_constant_family` (degenerate): If A is finite and J_r=0, a fixed continuous determinant gives a constant compatible family.
- `quotient_matrix_family` (compatibility): A continuous matrix representation over A gives its determinants modulo every J_r.
- `quotient_incompatible` (non-example): Two rank-one characters differing after reduction at one level cannot form compatible data.

**Acceptance:**

- For a profinite group G and a separated complete ring A≅lim_rA/J_r with a descending cofinal system of open ideals and finite quotients, finite-quotient determinant data consist of continuous degree-d determinants D_r over A/J_r, compatible under coefficient reduction. Each D_r factors through some finite G/U_r; the U_r can be refined to be descending. No common U is required.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 3.2, p.41.

### Failure of field-point integrality on nilpotents

`IntegralHeckeAndGaloisDeterminants:IHG.4/characteristic-zero-density-obstruction` · lemma

In A=k[ε]/ε², every field-valued point kills ε. Thus field-valued characteristic-polynomial data cannot distinguish two laws differing in an ε coefficient. For G=Z and rank one, g↦1 and g↦1+ε are distinct determinants with identical reductions at every field point.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-dimension-one`.

**Construction or proof:**

1. Use the two characters of the free cyclic group and note their common reduction; field maps kill all nilpotents.

**Acceptance:**

- In A=k[ε]/ε², every field-valued point kills ε. Thus field-valued characteristic-polynomial data cannot distinguish two laws differing in an ε coefficient. For G=Z and rank one, g↦1 and g↦1+ε are distinct determinants with identical reductions at every field point.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), §2.24, determinants over dual numbers.

### Gluing over an intersection of quotient ideals

`IntegralHeckeAndGaloisDeterminants:IHG.4/finite-intersection-gluing` · lemma

Let A/(I∩J) embed into A/I×A/J and be compact Hausdorff. Continuous degree-d determinants over A/I and A/J glue over A/(I∩J) when their characteristic-polynomial tuples belong to the image on a dense subset. Agreement merely after killing the nilradical does not give this image condition.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.4/compact-determinant-gluing`.

**Construction or proof:**

1. Apply compact coefficient gluing to the diagonal quotient map; membership in the image is the fiber-product compatibility over A/(I+J).

**Acceptance:**

- Let A/(I∩J) embed into A/I×A/J and be compact Hausdorff. Continuous degree-d determinants over A/I and A/J glue over A/(I∩J) when their characteristic-polynomial tuples belong to the image on a dense subset. Agreement merely after killing the nilradical does not give this image condition.

**Source:** [SCH15](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), Proof of Corollary 5.1.11, p.1038.

### Determinant from a compatible inverse limit

`IntegralHeckeAndGaloisDeterminants:IHG.4/inverse-limit-determinant` · construction

For compatible finite-quotient data on A≅lim A/J_r, there is a unique continuous degree-d determinant on A[G] with reductions D_r. Use the multiplicative-law representing algebra over Z and the universal property of the inverse limit, so arbitrary scalar-algebra evaluations are obtained naturally, rather than assuming tensor products commute with inverse limits.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.4/finite-quotient-determinant-data`; `IntegralHeckeAndGaloisDeterminants:IHG.0/multiplicative-law-representability`.

**Construction or proof:**

1. Each D_r is a map from the same universal representing algebra to A/J_r. Compatibility gives a map to A; evaluate the universal law and use coordinatewise continuity of every coefficient.

**Uses:**

- `IgusaVarietiesAndTorsionConcentration:IG.6`: Integral limit supplied after congruence witnesses.
- `AutomorphicGaloisRepresentationsPartII:AG2.4`: Generic limit of Hecke determinants.

**Planning API:**

- `TauCeti.Interpolation.inverseLimitDeterminant` (constructor): The continuous determinant whose reductions are the given D_r.
- `TauCeti.Interpolation.inverseLimitDeterminant_reduce` (compatibility): Its reduction to A/J_r equals D_r.
- `TauCeti.Interpolation.inverseLimitDeterminant_unique` (universal-property): Every continuous determinant with these reductions equals it.

**Unit tests:**

- `limit_rank_one` (computation): Compatible characters G→(Z/p^r)× produce the character G→Z_p×.
- `limit_nonreduced` (characterisation): The construction retains nilpotent coefficients in a complete nonreduced A.
- `limit_constant` (compatibility): For a constant finite quotient system, the inverse-limit determinant is the original law.

**Acceptance:**

- For compatible finite-quotient data on A≅lim A/J_r, there is a unique continuous degree-d determinant on A[G] with reductions D_r. Use the multiplicative-law representing algebra over Z and the universal property of the inverse limit, so arbitrary scalar-algebra evaluations are obtained naturally, rather than assuming tensor products commute with inverse limits.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 3.2, p.41.

### Uniform congruence witnesses for classical systems

`IntegralHeckeAndGaloisDeterminants:IHG.4/uniform-congruence-witness` · definition

For each quotient A/J_r, a congruence witness is a finite family of classical continuous determinants over coefficient rings B_{r,i}, an injective closed ring map A/J_r→∏B_{r,i}, and the assertion that the tuple of every Frobenius characteristic-polynomial coefficient lies in its image. Witnesses include a uniform modulus and compatibility between quotient levels. Geometric density supplies a witness only if it proves these integral congruences.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.4/finite-quotient-determinant-data`; `IntegralHeckeAndGaloisDeterminants:IHG.4/compact-determinant-gluing`; `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial`.

**Construction or proof:**

1. Package the actual quotient embeddings and coefficient membership, which are the hypotheses of gluing. Their production remains with the geometric source.

**Uses:**

- `TorsionCohomologyInfrastructure:TC.3`: Actual geometric congruence input, rather than density alone.
- `AutomorphicGaloisRepresentations:R19.6`: Owns its Hecke-system congruence witnesses.

**Planning API:**

- `TauCeti.Interpolation.CongruenceWitness` (structure): Finite classical systems, their coefficient embeddings and Frobenius membership modulo J_r.
- `TauCeti.Interpolation.CongruenceWitness.determinant` (constructor): Apply gluing to obtain D_r over A/J_r.
- `TauCeti.Interpolation.CongruenceWitness.compatible` (compatibility): Under levelwise congruence compatibility, reductions of the D_r agree by Frobenius uniqueness.

**Unit tests:**

- `congruence_single` (degenerate): One classical determinant already over A/J_r gives the identity embedding witness.
- `congruence_intersection` (compatibility): Compatible systems over A/I and A/J give the intersection-quotient witness.
- `congruence_nilpotent_invisible` (non-example): All field points of k[ε]/ε² see ε as zero; they cannot certify a coefficient ε or a nilpotent perturbation integrally.

**Acceptance:**

- For each quotient A/J_r, a congruence witness is a finite family of classical continuous determinants over coefficient rings B_{r,i}, an injective closed ring map A/J_r→∏B_{r,i}, and the assertion that the tuple of every Frobenius characteristic-polynomial coefficient lies in its image. Witnesses include a uniform modulus and compatibility between quotient levels. Geometric density supplies a witness only if it proves these integral congruences.

**Source:** [SCH15](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), Corollary 5.1.11 and the topology of Tcl.

### Integral interpolation with uniform congruences

`IntegralHeckeAndGaloisDeterminants:IHG.4/classical-interpolation` · theorem

A compatible system of uniform congruence witnesses for A/J_r produces a continuous degree-d determinant over A with the prescribed Frobenius polynomials, unramified outside the fixed S. It is unique. Characteristic-zero density alone does not supply the witnesses when A is nonreduced.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.4/uniform-congruence-witness`; `IntegralHeckeAndGaloisDeterminants:IHG.4/inverse-limit-determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.4/frobenius-determinant-uniqueness`.

**Construction or proof:**

1. Glue at each finite level, use Frobenius uniqueness to prove compatibility, then take the determinant inverse limit.

**Acceptance:**

- A compatible system of uniform congruence witnesses for A/J_r produces a continuous degree-d determinant over A with the prescribed Frobenius polynomials, unramified outside the fixed S. It is unique. Characteristic-zero density alone does not supply the witnesses when A is nonreduced.

**Source:** [SCH15](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), Corollary 5.1.11 and Lemma 3.2 of Chenevier.

### Extension to the completed group algebra

`IntegralHeckeAndGaloisDeterminants:IHG.4/completed-group-algebra-extension` · comparison

For A profinite and G profinite, compatible continuous determinants on finite (A/J_r)[G/U] extend to the completed group algebra A[[G]]=lim_{r,U}(A/J_r)[G/U]. On a complete profinite coefficient algebra B, the evaluation uses the completed tensor product and equals the inverse limit of the finite-level polynomial laws. Its restriction to A[G] is the determinant constructed above.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.4/inverse-limit-determinant`; `PadicMeasuresIwasawaAlgebras:L1`.

**Construction or proof:**

1. Use open-kernel factorization at each discrete coefficient level and extend its evaluations continuously. Naturality is checked on the finite-level completed tensor system.

**Acceptance:**

- For A profinite and G profinite, compatible continuous determinants on finite (A/J_r)[G/U] extend to the completed group algebra A[[G]]=lim_{r,U}(A/J_r)[G/U]. On a complete profinite coefficient algebra B, the evaluation uses the completed tensor product and equals the inverse limit of the finite-level polynomial laws. Its restriction to A[G] is the determinant constructed above.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 2.33 and Lemma 3.2.

### Coefficient change in interpolation

`IntegralHeckeAndGaloisDeterminants:IHG.4/interpolation-coefficient-change` · lemma

For a continuous homomorphism of separated complete coefficient rings f:A→B compatible with their quotient systems, coefficient extension of the interpolated determinant equals interpolation of the pushed-forward quotient determinants, whenever the latter quotient data are supplied.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.4/inverse-limit-determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-base-change`.

**Construction or proof:**

1. Compare at every finite coefficient level and use separatedness to conclude equality.

**Acceptance:**

- For a continuous homomorphism of separated complete coefficient rings f:A→B compatible with their quotient systems, coefficient extension of the interpolated determinant equals interpolation of the pushed-forward quotient determinants, whenever the latter quotient data are supplied.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 3.2.

### Fixed ramification set in coefficient limits

`IntegralHeckeAndGaloisDeterminants:IHG.4/interpolation-ramification` · lemma

If every D_r factors through G_{F,S}, the inverse-limit determinant does so; no extra ramification is introduced by the coefficient limit. This does not prove that a classical source is uniformly unramified outside S.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.4/inverse-limit-determinant`.

**Construction or proof:**

1. Construct the limit on G_{F,S} itself; restriction to G_F is coefficientwise the given family.

**Acceptance:**

- If every D_r factors through G_{F,S}, the inverse-limit determinant does so; no extra ramification is introduced by the coefficient limit. This does not prove that a classical source is uniformly unramified outside S.

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 3.2.

### Hecke level change in interpolation

`IntegralHeckeAndGaloisDeterminants:IHG.4/interpolation-level-change` · lemma

If a continuous Hecke algebra homomorphism A_K→A_L transports every unramified T_{v,i}, and both systems satisfy the fixed-S interpolation hypotheses, it transports D_K to D_L. The actual level map and congruence witness are provided by the geometric owner.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.4/classical-interpolation`; `IntegralHeckeAndGaloisDeterminants:IHG.4/frobenius-determinant-uniqueness`.

**Construction or proof:**

1. Transport each Frobenius polynomial and invoke uniqueness.

**Acceptance:**

- If a continuous Hecke algebra homomorphism A_K→A_L transports every unramified T_{v,i}, and both systems satisfy the fixed-S interpolation hypotheses, it transports D_K to D_L. The actual level map and congruence witness are provided by the geometric owner.

**Source:** [SCH15](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), Corollary 5.1.11.

## IHG.5. Nilpotent descent and specialization

**Coverage: planned.** 11 declaration nodes.

**Planets:** Nilpotent Hecke descent; Residual semisimple specialization.

### Determinant from a quantified Hecke comparison

`IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-comparison-schema` · theorem

Let f:T→B be a continuous homomorphism with kernel J, J^N=0, and T/J compact Hausdorff embedded in Hausdorff B. Suppose an actual continuous degree-d determinant over B is supplied and its characteristic-polynomial coefficients belong to f(T) on the dense Frobenius classes. Then it descends uniquely to T/J. The theorem concludes a determinant only in T/J; it supplies neither the geometric comparison nor a lift to T.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.4/compact-determinant-gluing`; `IntegralHeckeAndGaloisDeterminants:IHG.4/frobenius-determinant-uniqueness`.

**Construction or proof:**

1. Apply coefficient-ring gluing to the quotient embedding and retain the given exponent N.

**Acceptance:**

- Let f:T→B be a continuous homomorphism with kernel J, J^N=0, and T/J compact Hausdorff embedded in Hausdorff B. Suppose an actual continuous degree-d determinant over B is supplied and its characteristic-polynomial coefficients belong to f(T) on the dense Frobenius classes. Then it descends uniquely to T/J. The theorem concludes a determinant only in T/J; it supplies neither the geometric comparison nor a lift to T.

**Source:** [SCH15](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), Proof of Theorem 5.4.1, pp.1058–1059.

### Nilpotence through a quotient extension

`IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-extension-bound` · lemma

For ideals K⊂J in a ring, if K^a=0 and (J/K)^b=0, with a,b≥1, then J^{ab}=0. Equivalently, J^b⊂K implies the displayed bound. This multiplicative bound differs from the additive module-filtration bound.

**Prerequisites:** .

**Construction or proof:**

1. Every product of ab elements of J can be grouped into a products of b elements, each lying in K.

**Acceptance:**

- For ideals K⊂J in a ring, if K^a=0 and (J/K)^b=0, with a,b≥1, then J^{ab}=0. Equivalently, J^b⊂K implies the displayed bound. This multiplicative bound differs from the additive module-filtration bound.

**Source:** [SCH15](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), Proof of Theorem 5.4.1, p.1059.

### Nilpotence in a product of coefficient rings

`IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-product-bound` · lemma

If I_i^{N_i}=0 in finitely many rings A_i, the product ideal ∏I_i in ∏A_i has power max_i N_i equal to zero. Its inverse image under an injection has the same bound.

**Prerequisites:** .

**Construction or proof:**

1. Compute products componentwise, then use injectivity.

**Acceptance:**

- If I_i^{N_i}=0 in finitely many rings A_i, the product ideal ∏I_i in ∏A_i has power max_i N_i equal to zero. Its inverse image under an injection has the same bound.

**Source:** [SCH15](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), Proof of Theorem 5.4.1, p.1059.

### Error ideal on a filtered module

`IntegralHeckeAndGaloisDeterminants:IHG.5/filtered-module-error-bound` · lemma

If J^a kills a submodule M′ and J^b kills M/M′, then J^{a+b}M=0. In particular, an endomorphism of M acting as zero on both factors maps M into M′ and kills M′, so the comparison kernel on the two factors is square-zero.

**Prerequisites:** .

**Construction or proof:**

1. Apply b factors to land in M′ and a more factors to kill it. For endomorphisms preserving the short exact sequence, compose the two zero-on-factors maps.

**Acceptance:**

- If J^a kills a submodule M′ and J^b kills M/M′, then J^{a+b}M=0. In particular, an endomorphism of M acting as zero on both factors maps M into M′ and kills M′, so the comparison kernel on the two factors is square-zero.

**Source:** [SCH15](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), Proof of Theorem 5.4.1, p.1059.

### Uniform nilpotence in an inverse limit

`IntegralHeckeAndGaloisDeterminants:IHG.5/uniform-nilpotent-limit` · lemma

If J_r⊂A/J_r′ are compatible error ideals with the same bound J_r^N=0, the inverse-limit error ideal J⊂A satisfies J^N=0 by separatedness. Bounds increasing with r do not imply a nilpotent limit.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.4/inverse-limit-determinant`.

**Construction or proof:**

1. Reduce a product of N elements at every quotient and use the injectivity of A into its coefficient limit.

**Acceptance:**

- In Z_p, the ideals (p) modulo p^r are nilpotent with unbounded exponent, while (p) itself is not nilpotent.

**Source:** [SCH15](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), Corollary 5.4.2, footnote 29, p.1060.

### Local conditions and change of lattice

`IntegralHeckeAndGaloisDeterminants:IHG.5/lattice-class-local-conditions` · comparison

For a supplied integral block lattice giving a cocycle c:G→M(χ/ψ), the restriction to H is a coboundary exactly when there is y∈M with c(h)=((χ/ψ)(h)−1)y for all h∈H. A lattice change inducing a G-equivariant module map transports the class and these restrictions; a diagonal rescaling multiplies the off-diagonal cocycle by the corresponding ratio. No invariance of Fitting ideals is asserted for nonisomorphic lattice modules.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/ribet-lattice`; `ArithmeticGaloisDuality:R02.1`.

**Construction or proof:**

1. Use the degree-one coboundary formula and the functorial continuous cochain map; compute diagonal conjugation on the upper-right entry.

**Acceptance:**

- For a supplied integral block lattice giving a cocycle c:G→M(χ/ψ), the restriction to H is a coboundary exactly when there is y∈M with c(h)=((χ/ψ)(h)−1)y for all h∈H. A lattice change inducing a G-equivariant module map transports the class and these restrictions; a diagonal rescaling multiplies the off-diagonal cocycle by the corresponding ratio. No invariance of Fitting ideals is asserted for nonisomorphic lattice modules.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Theorem 2.1, conditions (ii)–(iv).

### Functoriality of nilpotent descent

`IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-quotient-functoriality` · lemma

If f:T→T′ sends J into J′ and transports the specified Frobenius coefficients, then the determinant over T/J extends to the determinant over T′/J′. Keep both quotient maps in the conclusion.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-comparison-schema`; `IntegralHeckeAndGaloisDeterminants:IHG.4/frobenius-determinant-uniqueness`.

**Construction or proof:**

1. Descend f to the quotients and compare the characteristic polynomials.

**Acceptance:**

- If f:T→T′ sends J into J′ and transports the specified Frobenius coefficients, then the determinant over T/J extends to the determinant over T′/J′. Keep both quotient maps in the conclusion.

**Source:** [SCH15](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), Theorem 5.4.1 and Corollary 5.4.4.

### Nilpotence of sums of commutative ideals

`IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-sum-bound` · lemma

For ideals I,J of a commutative ring with I^a=0 and J^b=0, (I+J)^{a+b−1}=0. For a finite sum, the exponent is 1+∑(a_i−1).

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-extension-bound`.

**Construction or proof:**

1. Expand the ideal power and apply the pigeonhole inequality to each mixed product.

**Acceptance:**

- For ideals I,J of a commutative ring with I^a=0 and J^b=0, (I+J)^{a+b−1}=0. For a finite sum, the exponent is 1+∑(a_i−1).

**Source:** [SCH15](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), Proof of Theorem 5.4.1, combination of error ideals.

### Quantified composition of Hecke error ideals

`IntegralHeckeAndGaloisDeterminants:IHG.5/geometric-error-composition` · lemma

Suppose a Hecke comparison T→T_1×T_2 has kernel K with K^a=0 and supplied error ideals J_i^{b_i}=0. The kernel J of T→T_1/J_1×T_2/J_2 satisfies J^{a max(b_1,b_2)}=0. For a two-step cohomology filtration the source comparison kernel has a=2; for a derived-to-cohomology comparison, use its amplitude exponent.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-extension-bound`; `IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-product-bound`; `IntegralHeckeAndGaloisDeterminants:IHG.5/filtered-module-error-bound`; `IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-nilpotence`.

**Construction or proof:**

1. J/K is a subideal of the product errors, so its max-exponent power vanishes; apply the quotient-extension bound.

**Acceptance:**

- Suppose a Hecke comparison T→T_1×T_2 has kernel K with K^a=0 and supplied error ideals J_i^{b_i}=0. The kernel J of T→T_1/J_1×T_2/J_2 satisfies J^{a max(b_1,b_2)}=0. For a two-step cohomology filtration the source comparison kernel has a=2; for a derived-to-cohomology comparison, use its amplitude exponent.

**Source:** [SCH15](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), Proof of Theorem 5.4.1.

### Residual semisimple specialization

`IntegralHeckeAndGaloisDeterminants:IHG.5/residual-semismple-specialization` · theorem

For a determinant over T/J and a maximal ideal m⊂T with J nilpotent, base change gives a residual determinant over T/m. Over an algebraic closure it determines a unique semisimple degree-d representation up to isomorphism, continuous with finite image when the residue field is discrete and the determinant is continuous.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-comparison-schema`; `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction`; `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-discrete-continuity`.

**Construction or proof:**

1. Every maximal ideal contains J. Specialize the law and apply reconstruction and its discrete continuity statement.

**Acceptance:**

- For a determinant over T/J and a maximal ideal m⊂T with J nilpotent, base change gives a residual determinant over T/m. Over an algebraic closure it determines a unique semisimple degree-d representation up to isomorphism, continuous with finite image when the residue field is discrete and the determinant is continuous.

**Source:** [SCH15](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), Corollary 5.4.3, p.1060.

### Representation over the nilpotent quotient

`IntegralHeckeAndGaloisDeterminants:IHG.5/residual-irreducible-quotient-lift` · theorem

Let T/J be henselian local and its determinant be residually split absolutely irreducible of degree d. The Cayley–Hamilton algebra is M_d(T/J), giving a representation over T/J up to conjugation. A representation over T is not asserted, and residual reducibility does not satisfy the hypothesis.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-comparison-schema`; `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-irreducible`.

**Construction or proof:**

1. Apply the henselian reconstruction theorem over exactly the quotient coefficient ring.

**Acceptance:**

- Let T/J be henselian local and its determinant be residually split absolutely irreducible of degree d. The Cayley–Hamilton algebra is M_d(T/J), giving a representation over T/J up to conjugation. A representation over T is not asserted, and residual reducibility does not satisfy the hypothesis.

**Source:** [SCH15](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), Corollary 5.4.4, p.1060.

## IHG.6. Integral Ribet theory without residual distinctness

**Coverage: planned.** 76 declaration nodes.

**Planets:** Fitting ideal; Local Ribet module; Integral Ribet theorem; Ribet extension class; Formal Ribet matrix ring; Buchsbaum–Rim complexes.

### Zeroth Fitting ideal

`IntegralHeckeAndGaloisDeterminants:IHG.6/zeroth-fitting-ideal` · definition

For a commutative ring A and a finitely generated A-module M, Fitt₀_A(M) is the ideal generated by all n×n determinants of n relation vectors in the kernel of a chosen surjection A^n→M. The definition permits infinitely many relations and is independent of the chosen finite generating family.

**Prerequisites:** .

**Construction or proof:**

1. Take the ideal generated by maximal minors of all finite tuples of relations. Independence of the presentation is the separate presentation-invariance lemma.

**Uses:**

- `DKSW23 Theorems 1.1 and 2.1`: Measures the integral size of the extension module.
- `PadicMeasuresIwasawaAlgebras:L6`: Imports the generic finite-presentation Fitting ideal and its base-change API.

**Planning API:**

- `TauCeti.Fitting.zero` (constructor): The zeroth Fitting ideal of a finite module.
- `TauCeti.Fitting.mem_of_relations` (relation): For n generators of M and n relations, their determinant belongs to Fitt₀(M).
- `TauCeti.Fitting.baseChange` (compatibility): For any A→B, Fitt₀_B(B⊗_A M)=Fitt₀_A(M)B.

**Unit tests:**

- `fitting_cyclic_integer` (computation): Fitt₀_Z(Z/6Z)=(6).
- `fitting_zero_module` (degenerate): Fitt₀_A(0)=A, whereas Fitt₀_A(A)=0 for A≠0.
- `fitting_not_annihilator` (non-example): For M=(Z/6Z)², Fitt₀_Z(M)=(36), strictly smaller than Ann_Z(M)=(6).

**Acceptance:**

- For a commutative ring A and a finitely generated A-module M, Fitt₀_A(M) is the ideal generated by all n×n determinants of n relation vectors in the kernel of a chosen surjection A^n→M. The definition permits infinitely many relations and is independent of the chosen finite generating family.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.2, pp.10–11.

### Character congruence on the group algebra

`IntegralHeckeAndGaloisDeterminants:IHG.6/group-algebra-character-congruence` · lemma

Let A be commutative, J an ideal, ρ:G→GL₂(B) an A-linear representation and χ,ψ:G→Aˣ characters. If tr(ρ(g)) and det(ρ(g)) lie in A and reduce to χ(g)+ψ(g) and χ(g)ψ(g) modulo J for every g, then for every t∈A[G] the characteristic polynomial of ρ(t) lies in A[X] and reduces to (X−χ(t))(X−ψ(t)) modulo J.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.0/amitsur-formula`.

**Construction or proof:**

1. Expand trace linearly and use the rank-two polarized identity det(U+V)=det(U)+det(V)+tr(U)tr(V)−tr(UV); apply the group-element hypotheses to products. This integral identity uses no division by two.

**Acceptance:**

- Let A be commutative, J an ideal, ρ:G→GL₂(B) an A-linear representation and χ,ψ:G→Aˣ characters. If tr(ρ(g)) and det(ρ(g)) lie in A and reduce to χ(g)+ψ(g) and χ(g)ψ(g) modulo J for every g, then for every t∈A[G] the characteristic polynomial of ρ(t) lies in A[X] and reduces to (X−χ(t))(X−ψ(t)) modulo J.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.1, equation (13), p.8.

### Character difference modules

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-difference-modules` · construction

For an A-algebra representation ρ:A[G]→M₂(B) and a character ψ:A[G]→A, define Δψ as the range of the A-linear map t↦ρ(t)−ψ(t)I₂. For χ,ψ define ΔχΔψ as the A-span of all products of their elements.

**Prerequisites:** .

**Construction or proof:**

1. Take the linear difference-map range and the ambient span of products. The containment required for the quotient is proved by the next lemma.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.6/difference-product-containment`: Supplies the product containment.
- `IntegralHeckeAndGaloisDeterminants:IHG.6/initial-ribet-module`: Supplies the carrier for the first quotient.

**Planning API:**

- `TauCeti.IntegralRibet.differenceModule` (constructor): Δψ is the range of the A-linear difference map on A[G].
- `TauCeti.IntegralRibet.differenceModule_generators` (characterisation): Δψ is generated by ρ(g)−ψ(g)I₂ for g∈G.
- `TauCeti.IntegralRibet.differenceProduct` (constructor): The ambient product submodule is the span of x*y, x∈Δχ,y∈Δψ.

**Unit tests:**

- `difference_scalar_zero` (degenerate): If ρ(g)=ψ(g)I₂ and χ=ψ, then Δψ=0.
- `difference_trivial_group` (computation): For the trivial group and the trivial scalar representation, Δψ=0.
- `difference_upper_unipotent` (computation): For G=Z, A=B=Z and ρ(n)=[[1,n],[0,1]], χ=ψ=1, Δψ=Z E₁₂, ΔχΔψ=0.

**Acceptance:**

- The product span is formed in the ambient matrix module; containment in Δψ is a separate lemma.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.1, equation (14), pp.8–9.

### Every cocycle representative generates

`IntegralHeckeAndGaloisDeterminants:IHG.6/coincident-class-surjectivity` · lemma

Let (T,m) be local, M a finite T-module and α:G→Tˣ with α(g)≡1 modulo m. If a cocycle κ has T-span M, every cohomologous cocycle κ′(g)=κ(g)+(α(g)−1)y also has T-span M.

**Prerequisites:** `ArithmeticGaloisDuality:R02.1`.

**Construction or proof:**

1. The two cocycles have the same image in M/mM; apply Nakayama to the quotient of M by the span of κ′.

**Acceptance:**

- No assumption that 2 is invertible enters the argument; α=1 makes every coboundary zero.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Theorem 1.1 and §2.1, pp.3,9.

### Integral restriction to the lower Borel

`IntegralHeckeAndGaloisDeterminants:IHG.6/borel-restriction` · theorem

For G=GL₂/ℤ, its lower Borel B, every rational G-module V and every i≥0, restriction Hᶦ(G,V)→Hᶦ(B,V) is an isomorphism. Cohomology is derived scheme invariants, not cohomology of G(ℤ).

**Prerequisites:** `LanglandsParameterStacks:LP3`.

**Construction or proof:**

1. Use induction along G/B≅P¹ and its structure-sheaf cohomology to identify derived invariants, or combine the field statement with integral universal coefficients. The exact integral comparison is requested from LP3.

**Acceptance:**

- For G=GL₂/ℤ, its lower Borel B, every rational G-module V and every i≥0, restriction Hᶦ(G,V)→Hᶦ(B,V) is an isomorphism. Cohomology is derived scheme invariants, not cohomology of G(ℤ).

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Theorem 4.4, p.23.

### Adjoint weight and dual identities

`IntegralHeckeAndGaloisDeterminants:IHG.6/borel-adjoint-weights` · lemma

For the inverse-conjugation coordinate representation A of B, the submodule V=ℤA⊕ℤB has action A↦A+(y/x)B, B↦(z/x)B. Write ℤ(1)=ℤB. Then ∧²V≅ℤ(1), V*≅V(−1), V⊗V*≅A, and V⊗V≅A(1).

**Prerequisites:** `LanglandsParameterStacks:LP3`.

**Construction or proof:**

1. Compute the lower-triangular universal matrix action over ℤ[x,y,z,(xz)⁻¹]. The determinant pairing identifies the dual twist; the endomorphism identification checks the adjoint action.

**Acceptance:**

- For the inverse-conjugation coordinate representation A of B, the submodule V=ℤA⊕ℤB has action A↦A+(y/x)B, B↦(z/x)B. Write ℤ(1)=ℤB. Then ∧²V≅ℤ(1), V*≅V(−1), V⊗V*≅A, and V⊗V≅A(1).

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Example 4.2, p.22; Lemma 5.10, p.42.

### Composition of exterior contractions

`IntegralHeckeAndGaloisDeterminants:IHG.6/exterior-contraction-composition` · lemma

For a module U over a commutative ring, λ₁,…,λ_r homogeneous alternating forms on U and β∈∧U, determinant contraction satisfies ω(λ₁∧…∧λ_r)(β)=(−1)^(r+1)ω(λ₁)…ω(λ_r)(β), with the sign convention of Buchsbaum §1. The formula defines all signs in the bar differential.

**Prerequisites:** `DerivedDeRhamCohomology:DD.1/koszul-complex`.

**Construction or proof:**

1. Expand on decomposable β; reduce to two linear forms and induct on the exterior degree. Match the deletion signs and extend by multilinearity.

**Acceptance:**

- For a module U over a commutative ring, λ₁,…,λ_r homogeneous alternating forms on U and β∈∧U, determinant contraction satisfies ω(λ₁∧…∧λ_r)(β)=(−1)^(r+1)ω(λ₁)…ω(λ_r)(β), with the sign convention of Buchsbaum §1. The formula defines all signs in the bar differential.

**Source:** [BUCH64](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf), Lemma 1.1, pp.184–185.

### Localized chart for generic two-column minors

`IntegralHeckeAndGaloisDeterminants:IHG.6/generic-minor-localization` · lemma

For R=R₀[b_i,b′_i], J_k=(r_ij:i,j≤k) and V=b′₁, R[V⁻¹]/J_kR[V⁻¹]≅R₀[b′₁,…,b′_n,b₁,b_(k+1),…,b_n,V⁻¹]. In this quotient r₁(k+1) is a non-zero-divisor.

**Prerequisites:** .

**Construction or proof:**

1. Solve b_j=b₁b′_j/V for 2≤j≤k. The next minor is linear in the fresh b_(k+1) with unit leading coefficient V, so multiplication is injective over any R₀.

**Acceptance:**

- For R=R₀[b_i,b′_i], J_k=(r_ij:i,j≤k) and V=b′₁, R[V⁻¹]/J_kR[V⁻¹]≅R₀[b′₁,…,b′_n,b₁,b_(k+1),…,b_n,V⁻¹]. In this quotient r₁(k+1) is a non-zero-divisor.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Corollary 5.12, equation (70), p.43.

### A pivot chart for generic linear sequences

`IntegralHeckeAndGaloisDeterminants:IHG.6/generic-linear-pivot-chart` · lemma

For R=R₀[A_ij] and L_i=∑_(j=1)^n A_ij X_j−c_i with c_i∈R, m≤n, the ordered sequence L₁,…,L_m is weakly regular after inverting A₁₁.

**Prerequisites:** `mathlib:RingTheory.Sequence.IsWeaklyRegular`.

**Construction or proof:**

1. Set Y₁=L₁ and Y_j=X_j for j>1. The change is invertible on the pivot chart. Modulo L₁, translate A_ij to A_ij−A_i1 A₁₁⁻¹ A₁j for i,j>1; induction on n handles the remaining generic system, with constants allowed to depend on coefficients.

**Acceptance:**

- For R=R₀[A_ij] and L_i=∑_(j=1)^n A_ij X_j−c_i with c_i∈R, m≤n, the ordered sequence L₁,…,L_m is weakly regular after inverting A₁₁.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Proposition 5.13, Claim 1, pp.44–45.

### Generic linear prefixes at a zero pivot

`IntegralHeckeAndGaloisDeterminants:IHG.6/generic-linear-zero-pivot` · lemma

In the same ring, L₁,…,L_(m−1) is weakly regular modulo A₁₁.

**Prerequisites:** `mathlib:RingTheory.Sequence.IsWeaklyRegular`.

**Construction or proof:**

1. Put X₁ and the last coefficient row in the base ring. The first m−1 rows are then generic in X₂,…,X_n, with m−1≤n−1; induct on n.

**Acceptance:**

- In the same ring, L₁,…,L_(m−1) is weakly regular modulo A₁₁.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Proposition 5.13, Claim 2, p.45.

### Product containment of difference modules

`IntegralHeckeAndGaloisDeterminants:IHG.6/difference-product-containment` · lemma

For the preceding algebra maps, ΔχΔψ⊆Δψ.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-difference-modules`.

**Construction or proof:**

1. For t,u∈A[G], expand (ρ(t)−χ(t))(ρ(u)−ψ(u)) as (ρ(tu)−ψ(tu))−ψ(u)(ρ(t)−ψ(t))−χ(t)(ρ(u)−ψ(u)); extend by A-linear spans.

**Acceptance:**

- For the preceding algebra maps, ΔχΔψ⊆Δψ.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.1, p.9.

### Ribet theory for distinct residual characters

`IntegralHeckeAndGaloisDeterminants:IHG.6/distinct-character-ribet` · theorem

Under Theorem 1.1’s hypotheses with χ≢ψ modulo m, choose τ with χ(τ)−ψ(τ) a unit and diagonalize ρ(τ) using its two Henselian roots. Let B be the finite T-module generated by upper-right matrix entries b(g). Then κ(g)=ψ(g)⁻¹b(g) modulo IB is a continuous cocycle, every representative generates B/IB, B is faithful and Fitt₀_T(B/IB)⊆I.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/zeroth-fitting-ideal`; `IntegralHeckeAndGaloisDeterminants:IHG.6/group-algebra-character-congruence`; `ArithmeticGaloisDuality:R02.1`; `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-idempotent-lifting`.

**Construction or proof:**

1. Use the two spectral idempotents of ρ(τ) and the rank-two character congruences to show diagonal entries reduce to χ and ψ and b(g)c(h)∈I. Irreducibility in every field factor makes B faithful. Normalize every cocycle at τ by the unique coboundary and use its value there to recover the generation assertion. Apply Fitting base change and Fitt₀(B)⊆Ann(B)=0.

**Acceptance:**

- Under Theorem 1.1’s hypotheses with χ≢ψ modulo m, choose τ with χ(τ)−ψ(τ) a unit and diagonalize ρ(τ) using its two Henselian roots. Let B be the finite T-module generated by upper-right matrix entries b(g). Then κ(g)=ψ(g)⁻¹b(g) modulo IB is a continuous cocycle, every representative generates B/IB, B is faithful and Fitt₀_T(B/IB)⊆I.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Introduction, pp.4–5.

### Presentation independence of maximal-minor ideals

`IntegralHeckeAndGaloisDeterminants:IHG.6/fitting-presentation-invariance` · lemma

The ideal of maximal relation minors for a finite generating surjection A^n→M is unchanged by adding a redundant generator and its defining relation, changing the generating basis or changing the relation generators. It therefore depends only on M.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/zeroth-fitting-ideal`.

**Construction or proof:**

1. A redundant generator enlarges the relation matrix by a pivot 1 and elementary row/column operations recover the original minors. Compare two finite generating families through their union; multilinearity handles arbitrary relation families.

**Acceptance:**

- The ideal of maximal relation minors for a finite generating surjection A^n→M is unchanged by adding a redundant generator and its defining relation, changing the generating basis or changing the relation generators. It therefore depends only on M.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.2, pp.10–11.

### Trace congruences for difference words

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-trace-word-congruence` · lemma

For a noncommutative polynomial f(X₁,…,X_r) with zero constant term, tr f(ρ₁,…,ρ_r)≡f(−ν₁,…,−ν_r) modulo I. Also det(Δψ)⊂I. These are integral rank-two identities.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/group-algebra-character-congruence`.

**Construction or proof:**

1. Evaluate the characteristic polynomial at ψ(t) for the determinant. Expand each nonempty difference word by inclusion–exclusion; the χ and ψ trace terms cancel to ∏(χ−ψ), including the final trace of the identity equal to 2.

**Acceptance:**

- For a noncommutative polynomial f(X₁,…,X_r) with zero constant term, tr f(ρ₁,…,ρ_r)≡f(−ν₁,…,−ν_r) modulo I. Also det(Δψ)⊂I. These are integral rank-two identities.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemmas 2.5–2.6, pp.15–16.

### Polarized local character congruence

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-polarized-local-congruence` · lemma

For a local triangularization with characters η,ξ and χ,ψ congruence, (ξ(σ)−χ(σ))(ξ(τ)−ψ(τ))+(ξ(τ)−χ(τ))(ξ(σ)−ψ(σ))≡0 modulo Ĩ. Thus if τ∈I_v and ξ(τ)≡χ(τ), the first product vanishes even when σ is outside I_v.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/group-algebra-character-congruence`.

**Construction or proof:**

1. Use the rank-two determinant polarization on the commuting triangular local elements. Their trace sum and determinant product reduce to the two-character law. Set the second factor pair using the inertia hypothesis. No division by 2 is used.

**Acceptance:**

- For a local triangularization with characters η,ξ and χ,ψ congruence, (ξ(σ)−χ(σ))(ξ(τ)−ψ(τ))+(ξ(τ)−χ(τ))(ξ(σ)−ψ(σ))≡0 modulo Ĩ. Thus if τ∈I_v and ξ(τ)≡χ(τ), the first product vanishes even when σ is outside I_v.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 3.2, last local step, equation (47), p.20.

### Good filtrations on adjoint tensor powers

`IntegralHeckeAndGaloisDeterminants:IHG.6/good-adjoint-tensors` · lemma

The integral adjoint representation of GL₂ and each A^⊗k admit good filtrations. Both the standard representation and its dual are dual Weyl modules; the dual is not identified with the standard representation.

**Prerequisites:** `LanglandsParameterStacks:LP3`; `IntegralHeckeAndGaloisDeterminants:IHG.6/borel-adjoint-weights`.

**Construction or proof:**

1. Identify A=std⊗std* and apply integral tensor closure from LP3 repeatedly.

**Acceptance:**

- The integral adjoint representation of GL₂ and each A^⊗k admit good filtrations. Both the standard representation and its dual are dual Weyl modules; the dual is not identified with the standard representation.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Corollary 4.9, p.24.

### Vanishing above the Borel twist

`IntegralHeckeAndGaloisDeterminants:IHG.6/twisted-good-filtration-vanishing` · theorem

For an integral good G-module W and j≥0, Hᶦ(B,W(j))=0 when i>j.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/borel-restriction`; `LanglandsParameterStacks:LP3`.

**Construction or proof:**

1. For j=0 use acyclicity of good filtrations and restriction. For j>0 use G/B=P¹: the comparison is Hᶦ⁻¹(G,W⊗Sym^(2j−2)(std)*). Reduce using universal coefficients and the bound floor((2j−2)/p)≤j−1 for its good-filtration dimension.

**Acceptance:**

- For an integral good G-module W and j≥0, Hᶦ(B,W(j))=0 when i>j.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 4.11, p.24.

### Invariants of entirely triangular matrices

`IntegralHeckeAndGaloisDeterminants:IHG.6/triangular-torus-invariants` · lemma

For R=R₀[a_τ,c_τ,d_τ], obtained by setting every b_τ to zero, R^B=R₀[a_τ,d_τ].

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/borel-adjoint-weights`.

**Construction or proof:**

1. The split diagonal torus grading gives each c_τ the same nonzero weight and a_τ,d_τ weight zero. All monomials involving a c have nonzero weight; a_τ,d_τ are also unipotent invariant.

**Acceptance:**

- For R=R₀[a_τ,c_τ,d_τ], obtained by setting every b_τ to zero, R^B=R₀[a_τ,d_τ].

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Corollary 4.17, first part, p.27.

### Buchsbaum–Rim module complex

`IntegralHeckeAndGaloisDeterminants:IHG.6/buchsbaum-rim-complex` · construction

For R commutative and f:U=Rⁿ→W=Rᵐ, 1≤m≤n, define BR(f)=K(f;1,m) using the exterior-bar mapping cone of Buchsbaum §1. Its degrees 0,1 are W,U with d₁=f, and d₂:∧ᵐW*⊗∧^(m+1)U→U is the signed maximal-minor contraction. For m=2 it sends the basis triple to r_ij e_k+r_jk e_i+r_ki e_j.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/exterior-contraction-composition`; `mathlib:exteriorPower.map`.

**Construction or proof:**

1. Use the exterior-bar differential: contract the final form into the exterior U factor, and sum the signed products of adjacent exterior W* factors. Take the indicated graded mapping cone of its map to the contractible W-bar complex. The contraction composition identity proves d²=0.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.6/buchsbaum-rim-regular`: Defines the exact H₁ prefix condition.
- `IntegralHeckeAndGaloisDeterminants:IHG.6/determinantal-exactness-transfer`: Supplies the comparison complex in arbitrary commutative coefficients.

**Planning API:**

- `TauCeti.BuchsbaumRim.moduleComplex` (constructor): BR(f)=K(f;1,m), a nonnegative finite free chain complex.
- `TauCeti.BuchsbaumRim.moduleComplex_d_one` (simp): Its degree-one differential is f.
- `TauCeti.BuchsbaumRim.moduleComplex_rank_one` (compatibility): For m=1 this is the imported Koszul complex.

**Unit tests:**

- `br_identity` (computation): For f=id:R²→R², the complex is the exact two-term identity complex.
- `br_zero_map` (non-example): For f=0:R³→R², H₁(BR(f))=R³, so it is not exact unless R is zero.
- `br_two_column_syzygy` (computation): For columns (b_i,b′_i), d₂ on e₁∧e₂∧e₃ is r₁₂e₃+r₂₃e₁+r₃₁e₂, and f(d₂)=0.

**Acceptance:**

- For R commutative and f:U=Rⁿ→W=Rᵐ, 1≤m≤n, define BR(f)=K(f;1,m) using the exterior-bar mapping cone of Buchsbaum §1. Its degrees 0,1 are W,U with d₁=f, and d₂:∧ᵐW*⊗∧^(m+1)U→U is the signed maximal-minor contraction. For m=2 it sends the basis triple to r_ij e_k+r_jk e_i+r_ki e_j.

**Source:** [BUCH64](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf), §1 pp.185–187; DKSW §5.3.1 equation (60).

### Saturation of the generic minor ideal

`IntegralHeckeAndGaloisDeterminants:IHG.6/generic-minor-saturation` · lemma

For the same generic ring, R∩J_kR[(b′₁)⁻¹]=J_k.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/generic-minor-localization`.

**Construction or proof:**

1. Group monomials by the fixed totals deg_(b_i)+deg_(b′_i) for i≤k and the total b and b′ degrees. The minor relations identify all monomials in a group by swaps b_i b′_j=b_j b′_i. Vanishing in the localized chart forces each grouped coefficient sum to vanish, so the polynomial is in J_k.

**Acceptance:**

- For the same generic ring, R∩J_kR[(b′₁)⁻¹]=J_k.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Corollary 5.12, proof, p.43.

### Cancellation of pivot denominators

`IntegralHeckeAndGaloisDeterminants:IHG.6/generic-linear-denominator-cancellation` · lemma

If A₁₁^e P lies in (L₁,…,L_(m−1)) in the generic system, then P lies in that ideal.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/generic-linear-zero-pivot`; `mathlib:RingTheory.Sequence.IsWeaklyRegular`.

**Construction or proof:**

1. Reduce a chosen expression modulo A₁₁. The highest coefficient not divisible by A₁₁ belongs to the preceding L ideal by weak regularity; replace the coefficients by a Koszul relation to lower that highest index. Once all coefficients are divisible by A₁₁, cancel it in the ambient polynomial ring and induct on e.

**Acceptance:**

- If A₁₁^e P lies in (L₁,…,L_(m−1)) in the generic system, then P lies in that ideal.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Proposition 5.13, Claim 3, p.45.

### Irreducibility excludes an exact split determinant

`IntegralHeckeAndGaloisDeterminants:IHG.6/zero-congruence-ideal-obstruction` · lemma

Under the global Ribet hypotheses with T nonzero, the congruence ideal I cannot be zero: otherwise the determinant on every field-factor representation is the direct sum of the two T-valued characters, contradicting its irreducibility.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.1/field-faithful-quotient`; `IntegralHeckeAndGaloisDeterminants:IHG.6/group-algebra-character-congruence`.

**Construction or proof:**

1. Base change to a field factor. The all-group-element characteristic-polynomial congruence with I=0 extends to the group algebra; semisimple determinant reconstruction identifies the irreducible representation with the direct sum of the two field-valued characters.

**Acceptance:**

- Under the global Ribet hypotheses with T nonzero, the congruence ideal I cannot be zero: otherwise the determinant on every field-factor representation is the direct sum of the two T-valued characters, contradicting its irreducibility.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Theorem 1.1 and its reduction to Theorem 2.1.

### Fitting ideal annihilates a finite module

`IntegralHeckeAndGaloisDeterminants:IHG.6/fitting-annihilator` · lemma

For finite M over commutative A, Fitt₀_A(M)⊆Ann_A(M). Equality is not asserted.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/zeroth-fitting-ideal`; `IntegralHeckeAndGaloisDeterminants:IHG.6/fitting-presentation-invariance`.

**Construction or proof:**

1. The adjugate of every square relation matrix makes its determinant annihilate all generators. Take the generated ideal.

**Acceptance:**

- For finite M over commutative A, Fitt₀_A(M)⊆Ann_A(M). Equality is not asserted.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Introduction, p.5.

### Fitting ideals under scalar extension

`IntegralHeckeAndGaloisDeterminants:IHG.6/fitting-quotient-base-change` · lemma

For every A→B and finite A-module M, Fitt₀_B(B⊗_AM)=Fitt₀_A(M)B. In particular Fitt₀_(A/J)(M/JM) is the image of Fitt₀_A(M).

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/zeroth-fitting-ideal`; `IntegralHeckeAndGaloisDeterminants:IHG.6/fitting-presentation-invariance`.

**Construction or proof:**

1. Tensor a right-exact generating presentation and compare the maximal minors; newly written relations are B-linear combinations of the tensor relations.

**Acceptance:**

- For every A→B and finite A-module M, Fitt₀_B(B⊗_AM)=Fitt₀_A(M)B. In particular Fitt₀_(A/J)(M/JM) is the image of Fitt₀_A(M).

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Introduction, p.5; §2.2.

### Good filtrations on matrix polynomials

`IntegralHeckeAndGaloisDeterminants:IHG.6/good-matrix-polynomials` · theorem

For finitely many generic 2×2 matrices, ℤ[a_i,b_i,c_i,d_i] with simultaneous conjugation admits an exhaustive good filtration; every finite polynomial-degree piece has the required finite good filtration. The degree-zero center weight piece is infinite, so the full ring is not assigned a finite filtration.

**Prerequisites:** `LanglandsParameterStacks:LP3`; `IntegralHeckeAndGaloisDeterminants:IHG.6/good-adjoint-tensors`.

**Construction or proof:**

1. Import the integral matrix-coordinate good-filtration theorem from LP3. Use filtered colimits of polynomial-degree pieces for the full coordinate ring; do not use the false self-duality of the GL₂ standard module.

**Acceptance:**

- For finitely many generic 2×2 matrices, ℤ[a_i,b_i,c_i,d_i] with simultaneous conjugation admits an exhaustive good filtration; every finite polynomial-degree piece has the required finite good filtration. The degree-zero center weight piece is infinite, so the full ring is not assigned a finite filtration.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Theorem 4.10, p.24.

### Boundary cohomology at the twist

`IntegralHeckeAndGaloisDeterminants:IHG.6/borel-twist-boundary` · lemma

For integral good W, naturally H¹(B,W(1))≅H⁰(G,W). For i>1, Hᶦ(B,W(i))⊗Fp=0 if p>2, while Hᶦ(B,W(i))⊗F₂≅H⁰(G,W)⊗F₂. The identifications commute with cup products and coefficient maps.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/twisted-good-filtration-vanishing`; `LanglandsParameterStacks:LP3`.

**Construction or proof:**

1. Use the same projective-line comparison. Apply successive boundary maps in the Weyl-module filtration in characteristic two; higher good-filtration cohomology and the exact multiplication-by-2 sequence identify the final invariants.

**Acceptance:**

- For integral good W, naturally H¹(B,W(1))≅H⁰(G,W). For i>1, Hᶦ(B,W(i))⊗Fp=0 if p>2, while Hᶦ(B,W(i))⊗F₂≅H⁰(G,W)⊗F₂. The identifications commute with cup products and coefficient maps.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 4.12, pp.24–25.

### Acyclicity from a twisted good resolution

`IntegralHeckeAndGaloisDeterminants:IHG.6/twisted-resolution-acyclicity` · lemma

If a B-module M has a finite exact resolution W_n(n)→…→W₁(1)→W₀→M→0 with each W_j integral good, then Hᶦ(B,M)=0 for i>0.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/twisted-good-filtration-vanishing`; `LanglandsParameterStacks:LP3`.

**Construction or proof:**

1. Let K_j be the image at degree j. Descend through 0→K_(j+1)→W_j(j)→K_j→0; its long cohomology sequence and the twist bound give Hᶦ(B,K_j)=0 for i>j.

**Acceptance:**

- If a B-module M has a finite exact resolution W_n(n)→…→W₁(1)→W₀→M→0 with each W_j integral good, then Hᶦ(B,M)=0 for i>0.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 4.14, p.25.

### Buchsbaum–Rim determinant complex

`IntegralHeckeAndGaloisDeterminants:IHG.6/buchsbaum-rim-determinantal-complex` · construction

For the same f, define DetBR(f)=K(f;m,1). Degree zero is ∧ᵐW; degree k≥1 is the direct sum over s₁,…,s_(k−1)≥1 of (⊗_j∧^(s_j)W*)⊗∧^(m+∑s_j)U. Its first differential is ∧ᵐf, with the exterior-bar differential in higher degrees. After choosing det(W)≅R, H₀ is R/I_m(f).

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/buchsbaum-rim-complex`; `IntegralHeckeAndGaloisDeterminants:IHG.6/exterior-contraction-composition`; `mathlib:exteriorPower.map`.

**Construction or proof:**

1. Take the other graded mapping cone from the same exterior-bar construction. Terms above n−m+1 vanish. The degree-zero image is exactly the maximal-minor ideal after a determinant-line trivialization.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.6/ordered-determinantal-tensor-resolution`: General finite free tensor resolutions.
- `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-upper-relation-complex`: The local rank-two determinant factors in C.

**Planning API:**

- `TauCeti.BuchsbaumRim.determinantalComplex` (constructor): DetBR(f)=K(f;m,1) with its determinant-line degree zero.
- `TauCeti.BuchsbaumRim.determinantalComplex_d_one` (simp): d₁=∧ᵐf.
- `TauCeti.BuchsbaumRim.determinantalComplex_map` (functoriality): If f′∘g=f then ∧g gives DetBR(f)→DetBR(f′), retaining the same target W.
- `TauCeti.BuchsbaumRim.determinantalComplex_homology_zero` (characterisation): After det(W)≅R, H₀=R/I_m(f).

**Unit tests:**

- `detbr_rank_one` (compatibility): For m=1 it equals the usual Koszul complex, including its integral signs.
- `detbr_square` (computation): For f:R²→R², the complex is R --det(f)→ R in degrees 1,0.
- `detbr_generic_two_three` (computation): For a generic 2×3 matrix, d₁ has generators r₁₂,r₁₃,r₂₃ and d₂ has the two column syzygies; no division by 2 occurs.

**Acceptance:**

- For the same f, define DetBR(f)=K(f;m,1). Degree zero is ∧ᵐW; degree k≥1 is the direct sum over s₁,…,s_(k−1)≥1 of (⊗_j∧^(s_j)W*)⊗∧^(m+∑s_j)U. Its first differential is ∧ᵐf, with the exterior-bar differential in higher degrees. After choosing det(W)≅R, H₀ is R/I_m(f).

**Source:** [BUCH64](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf), §1 p.186; DKSW equation (62), p.37.

### Regularity of a finite free map

`IntegralHeckeAndGaloisDeterminants:IHG.6/buchsbaum-rim-regular` · definition

For an ordered finite free map f:Rⁿ→Rᵐ with 1≤m≤n, call f regular when H₁(BR(f|Rᵏ))=0 for every m≤k≤n. No noetherianity, domain hypothesis or nonzero-cokernel condition is imposed; properly regular adds coker(f)≠0.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/buchsbaum-rim-complex`.

**Construction or proof:**

1. Use the actual homology-zero predicate on every ordered prefix. Preserve the chosen ordering; invariance under arbitrary reorderings requires extra hypotheses and is not built into the definition.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.6/buchsbaum-rim-exactness`: The exactness condition in arbitrary commutative rings.
- `IntegralHeckeAndGaloisDeterminants:IHG.6/generic-two-column-regularity`: Validated criterion for the formal local relation factors.

**Planning API:**

- `TauCeti.BuchsbaumRim.IsRegular` (characterisation): All prefix first homology groups vanish.
- `TauCeti.BuchsbaumRim.IsRegular_prefix` (relation): A prefix of length at least m of a regular map is regular.
- `TauCeti.BuchsbaumRim.IsRegular_rank_one` (compatibility): For m=1 it is weak regularity of the ordered Koszul sequence; proper regularity also requires a nonzero quotient.

**Unit tests:**

- `br_regular_identity` (degenerate): Every ordered identity square matrix is regular even when its cokernel is zero.
- `br_regular_square` (characterisation): A square matrix is regular iff its underlying R-linear map is injective; no domain assumption is made.
- `br_regular_rank_one` (compatibility): Multiplication by 2 on Z is regular; multiplication by 2 on Z/4 is not.

**Acceptance:**

- For an ordered finite free map f:Rⁿ→Rᵐ with 1≤m≤n, call f regular when H₁(BR(f|Rᵏ))=0 for every m≤k≤n. No noetherianity, domain hypothesis or nonzero-cokernel condition is imposed; properly regular adds coker(f)≠0.

**Source:** [BUCH64](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf), §3 Definition, p.194; DKSW Definition 5.1, p.37.

### Weak regularity of generic linear equations

`IntegralHeckeAndGaloisDeterminants:IHG.6/generic-linear-regularity` · theorem

For arbitrary commutative R₀, generic m×n coefficients A_ij with m≤n, and c_i∈R₀[A_ij], the sequence ∑A_ijX_j−c_i is weakly regular in R₀[A_ij,X_j]. If the final quotient is nonzero it is regular in Mathlib’s stronger convention.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/generic-linear-pivot-chart`; `IntegralHeckeAndGaloisDeterminants:IHG.6/generic-linear-zero-pivot`; `IntegralHeckeAndGaloisDeterminants:IHG.6/generic-linear-denominator-cancellation`; `mathlib:RingTheory.Sequence.IsWeaklyRegular`.

**Construction or proof:**

1. Induct on m; the final non-zero-divisor assertion holds on the pivot chart and descends by denominator cancellation. Keep constants independent of the X variables; they may be arbitrary polynomials in the coefficients.

**Acceptance:**

- For arbitrary commutative R₀, generic m×n coefficients A_ij with m≤n, and c_i∈R₀[A_ij], the sequence ∑A_ijX_j−c_i is weakly regular in R₀[A_ij,X_j]. If the final quotient is nonzero it is regular in Mathlib’s stronger convention.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Proposition 5.13, pp.44–45.

### Initial Ribet quotient module

`IntegralHeckeAndGaloisDeterminants:IHG.6/initial-ribet-module` · construction

Define M₀=Δψ/(ΔχΔψ), interpreting the product submodule inside Δψ by the preceding containment. The classes of ρ(g)−ψ(g)I₂ generate M₀.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-difference-modules`; `IntegralHeckeAndGaloisDeterminants:IHG.6/difference-product-containment`.

**Construction or proof:**

1. Comap the ambient product submodule along the inclusion Δψ→M₂(B) and take its module quotient. The containment identifies that comap with the intended product module.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.6/canonical-ribet-cocycle`: Target of the canonical cocycle.
- `IntegralHeckeAndGaloisDeterminants:IHG.6/local-ribet-quotient`: Base summand before adjoining local coboundary vectors.

**Planning API:**

- `TauCeti.IntegralRibet.initialModule` (constructor): M₀ is the stated quotient module.
- `TauCeti.IntegralRibet.initialModule_mk` (projection): The quotient map from Δψ to M₀.
- `TauCeti.IntegralRibet.initialModule_generators` (characterisation): The group-element difference classes generate M₀.

**Unit tests:**

- `initial_scalar_zero` (degenerate): For ρ=ψI₂ and χ=ψ, M₀=0.
- `initial_upper_unipotent` (computation): For the integral upper-unipotent representation of Z and χ=ψ=1, M₀≅Z.
- `initial_universal_quotient` (characterisation): An A-linear map Δψ→L factors uniquely through M₀ iff it annihilates every product (ρ(t)−χ(t))(ρ(u)−ψ(u)).

**Acceptance:**

- Define M₀=Δψ/(ΔχΔψ), interpreting the product submodule inside Δψ by the preceding containment. The classes of ρ(g)−ψ(g)I₂ generate M₀.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.1, equation (14), p.9.

### Canonical Ribet cocycle

`IntegralHeckeAndGaloisDeterminants:IHG.6/canonical-ribet-cocycle` · construction

For the preceding modules define α=χψ⁻¹ and κ₀(g)=ψ(g)⁻¹[ρ(g)−ψ(g)I₂] in M₀. It is a one-cocycle for the scalar action α: κ₀(gh)=κ₀(g)+α(g)κ₀(h).

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-difference-modules`; `IntegralHeckeAndGaloisDeterminants:IHG.6/difference-product-containment`; `ArithmeticGaloisDuality:R02.1`; `IntegralHeckeAndGaloisDeterminants:IHG.6/initial-ribet-module`.

**Construction or proof:**

1. The cocycle defect equals ψ(gh)⁻¹(ρ(g)−χ(g))(ρ(h)−ψ(h)), whose class is zero. Continuity under the complete-ring hypotheses is provided by the separate bounded-image lemma.

**Uses:**

- `DKSW23 Theorem 1.1`: Global extension class.
- `DKSW23 Theorem 2.1`: Cocycle descending to the module N.

**Planning API:**

- `TauCeti.IntegralRibet.canonicalCocycle` (constructor): The cocycle κ₀ with scalar action χψ⁻¹.
- `TauCeti.IntegralRibet.canonicalCocycle_apply` (simp): κ₀(g)=ψ(g)⁻¹[ρ(g)−ψ(g)I₂].
- `TauCeti.IntegralRibet.canonicalCocycle_span` (characterisation): The A-span of κ₀(G) is all M₀.

**Unit tests:**

- `ribet_cocycle_identity` (degenerate): κ₀(1)=0.
- `ribet_cocycle_unipotent` (computation): For the integral upper-unipotent representation of Z with χ=ψ=1, κ₀(n)=n in M₀≅Z.
- `ribet_cocycle_twisted_product` (compatibility): The underlying function satisfies the continuous cochain API’s twisted cocycle equation, with α(g), rather than α(h), multiplying κ₀(h).

**Acceptance:**

- For the preceding modules define α=χψ⁻¹ and κ₀(g)=ψ(g)⁻¹[ρ(g)−ψ(g)I₂] in M₀. It is a one-cocycle for the scalar action α: κ₀(gh)=κ₀(g)+α(g)κ₀(h).

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 2.3 and proof, p.9.

### Products generating boundary cohomology

`IntegralHeckeAndGaloisDeterminants:IHG.6/twisted-cohomology-product-surjectivity` · lemma

For an inclusion S₁⊂S₂ of integral good commutative G-algebras, Hᶦ(B,S₁(i))⊗_(H⁰(B,S₁))H⁰(B,S₂)→Hᶦ(B,S₂(i)) is surjective for i≥0, in particular for the polynomial coordinate rings used below.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/borel-twist-boundary`; `IntegralHeckeAndGaloisDeterminants:IHG.6/borel-restriction`.

**Construction or proof:**

1. For i=0,1 reduce to invariants. For i>1 use the compatible boundary description: after reduction at any odd prime both groups vanish, at 2 the product is multiplication on invariants. Supply the integral cokernel argument, including the degreewise finiteness needed to pass from fiber surjectivity.

**Acceptance:**

- For an inclusion S₁⊂S₂ of integral good commutative G-algebras, Hᶦ(B,S₁(i))⊗_(H⁰(B,S₁))H⁰(B,S₂)→Hᶦ(B,S₂(i)) is surjective for i≥0, in particular for the polynomial coordinate rings used below.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Corollary 4.13, p.25.

### Acyclic triangular matrix coordinate modules

`IntegralHeckeAndGaloisDeterminants:IHG.6/triangular-quotient-acyclicity` · theorem

Let S=ℤ[a_i,b_i,c_i,d_i]/(b₁,…,b_k), with B conjugation, and W a ℤ-flat integral good G-module. Then W⊗ℤS is B-acyclic.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/twisted-resolution-acyclicity`; `IntegralHeckeAndGaloisDeterminants:IHG.6/good-matrix-polynomials`; `DerivedDeRhamCohomology:DD.1/koszul-complex`.

**Construction or proof:**

1. The coordinate variables b_i form a weakly regular sequence; its imported Koszul complex resolves S. Tensor with ℤ-flat W. Its degree j terms are direct sums of (W⊗S₀)(j); use good tensor closure and the preceding acyclicity lemma.

**Acceptance:**

- Let S=ℤ[a_i,b_i,c_i,d_i]/(b₁,…,b_k), with B conjugation, and W a ℤ-flat integral good G-module. Then W⊗ℤS is B-acyclic.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Theorem 4.15, p.26.

### Mapping cone for adjoining a column

`IntegralHeckeAndGaloisDeterminants:IHG.6/br-adjoining-column-cone` · lemma

If f:U→Rᵐ and ρ:R→Rᵐ, then BR(f⊕ρ) is the mapping cone of the contraction-induced map DetBR(f)→BR(f). This gives the homology long exact sequence used in prefix induction.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/buchsbaum-rim-complex`; `IntegralHeckeAndGaloisDeterminants:IHG.6/buchsbaum-rim-determinantal-complex`; `IntegralHeckeAndGaloisDeterminants:IHG.6/exterior-contraction-composition`.

**Construction or proof:**

1. Decompose ∧ᵏ(U⊕R)=∧ᵏU⊕∧^(k−1)U. The last-column determinant contraction gives the off-diagonal block of the differential; verify its mapping-cone signs.

**Acceptance:**

- If f:U→Rᵐ and ρ:R→Rᵐ, then BR(f⊕ρ) is the mapping cone of the contraction-induced map DetBR(f)→BR(f). This gives the homology long exact sequence used in prefix induction.

**Source:** [BUCH64](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf), Proposition 2.1 and Corollary 2.2, p.187.

### Transfer of acyclicity to determinant complexes

`IntegralHeckeAndGaloisDeterminants:IHG.6/determinantal-exactness-transfer` · theorem

For every f:Rⁿ→Rᵐ, every R-module E and j>0, if H_i(BR(f)⊗E)=0 for all i≥j, then H_i(DetBR(f)⊗E)=0 for all i≥j.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/buchsbaum-rim-complex`; `IntegralHeckeAndGaloisDeterminants:IHG.6/buchsbaum-rim-determinantal-complex`; `IntegralHeckeAndGaloisDeterminants:IHG.6/exterior-contraction-composition`.

**Construction or proof:**

1. Use exterior duality to identify the complexes with shifted exterior-bar complexes of the transpose f*. Reduce a determinant-complex cycle to a normal form with leading exterior degree two (Lemma 2.11); contracted cycles in that form are boundaries by Lemma 2.10. Degree one uses the separate adjustments in Lemmas 2.3–2.8.

**Acceptance:**

- For every f:Rⁿ→Rᵐ, every R-module E and j>0, if H_i(BR(f)⊗E)=0 for all i≥j, then H_i(DetBR(f)⊗E)=0 for all i≥j.

**Source:** [BUCH64](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf), Theorem 2.9, pp.191–193.

### A two-column regularity criterion

`IntegralHeckeAndGaloisDeterminants:IHG.6/two-column-regularity-criterion` · lemma

For f:Rⁿ→R² with columns (b_i,b′_i), let r_ij=b_i b′_j−b_j b′_i. Suppose for every k≥2 that r₁k x∈(r₁₂,…,r₁(k−1)) implies x∈(r_ij:i,j<k). Then f is regular.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/buchsbaum-rim-regular`; `IntegralHeckeAndGaloisDeterminants:IHG.6/buchsbaum-rim-complex`.

**Construction or proof:**

1. For every prefix, prove ker(f) is generated by the triple syzygies. Its final coordinate is in the ideal of previous minors by the hypothesis. Subtract a combination of triple syzygies with that final coordinate and apply induction to the remaining prefix.

**Acceptance:**

- For f:Rⁿ→R² with columns (b_i,b′_i), let r_ij=b_i b′_j−b_j b′_i. Suppose for every k≥2 that r₁k x∈(r₁₂,…,r₁(k−1)) implies x∈(r_ij:i,j<k). Then f is regular.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 5.11 and proof, p.43.

### Ribet module with local conditions

`IntegralHeckeAndGaloisDeterminants:IHG.6/local-ribet-quotient` · construction

Given a finite partition S=Σ⊔P of subgroups G_v⊆G, inertia subgroups I_v⊆G_v for v∈P, and v₀∈Σ when Σ is nonempty, form N₀=M₀⊕⊕_(v∈Σ\{v₀}) A y_v. Let Q be generated by κ₀(G_v₀), by κ₀(g)−(α(g)−1)y_v for g∈G_v and v∈Σ\{v₀}, and by κ₀(I_v), v∈P. Define N=N₀/Q and κ as the image of κ₀. When Σ is empty there is no v₀ relation and no y_v.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/canonical-ribet-cocycle`.

**Construction or proof:**

1. Take the quotient by the stated generated submodule. The cocycle descends because every submodule is stable for the scalar action α.

**Uses:**

- `DKSW23 Theorem 2.1`: Retains both prescribed vanishing and the extra generators.
- `IntegralIwasawaTheory:I.7`: Specializes the algebraic local conditions to its Hilbert/Eisenstein input.

**Planning API:**

- `TauCeti.IntegralRibet.localModule` (constructor): N is the quotient of M₀ with the adjoined coboundary vectors.
- `TauCeti.IntegralRibet.localCocycle` (constructor): The image κ of κ₀ in N.
- `TauCeti.IntegralRibet.localCocycle_restriction` (relation): κ|G_v₀=0, κ(g)=(α(g)−1)y_v on the other Σ subgroups, and κ|I_v=0 for v∈P.
- `TauCeti.IntegralRibet.localModule_span` (characterisation): N is generated by κ(G) together with the y_v.

**Unit tests:**

- `local_module_empty_conditions` (degenerate): For S=∅, N=M₀ and κ=κ₀.
- `local_module_whole_group_zero` (computation): For Σ={v₀}, G_v₀=G and P=∅, N=0.
- `local_module_extra_generator` (non-example): For scalar ρ=ψI₂, χ=ψ, Σ={v₀,v₁} and both subgroups trivial, M₀=0 but N≅A y_v₁; the cocycle alone does not generate N.

**Acceptance:**

- Given a finite partition S=Σ⊔P of subgroups G_v⊆G, inertia subgroups I_v⊆G_v for v∈P, and v₀∈Σ when Σ is nonempty, form N₀=M₀⊕⊕_(v∈Σ\{v₀}) A y_v. Let Q be generated by κ₀(G_v₀), by κ₀(g)−(α(g)−1)y_v for g∈G_v and v∈Σ\{v₀}, and by κ₀(I_v), v∈P. Define N=N₀/Q and κ as the image of κ₀. When Σ is empty there is no v₀ relation and no y_v.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.1, pp.9–10, with the sign corrected to Theorem 2.1.

### Exactness of regular Buchsbaum–Rim maps

`IntegralHeckeAndGaloisDeterminants:IHG.6/buchsbaum-rim-exactness` · theorem

If f is regular, then H_i(BR(f))=0 and H_i(DetBR(f))=0 for every i>0. Consequently, after a determinant-line trivialization, DetBR(f) is a finite free resolution of R/I_m(f).

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/buchsbaum-rim-regular`; `IntegralHeckeAndGaloisDeterminants:IHG.6/br-adjoining-column-cone`; `IntegralHeckeAndGaloisDeterminants:IHG.6/determinantal-exactness-transfer`.

**Construction or proof:**

1. Induct on n−m. The square-prefix case is injective by the regularity definition. For the induction step, the preceding prefix is regular, hence both of its complexes are acyclic by induction and transfer. The mapping-cone long exact sequence gives acyclicity of the enlarged module complex; apply transfer again.

**Acceptance:**

- If f is regular, then H_i(BR(f))=0 and H_i(DetBR(f))=0 for every i>0. Consequently, after a determinant-line trivialization, DetBR(f) is a finite free resolution of R/I_m(f).

**Source:** [BUCH64](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf), Proposition 3.1, pp.194–195; DKSW Theorem 5.2, p.37.

### Regularity of a generic two-column map

`IntegralHeckeAndGaloisDeterminants:IHG.6/generic-two-column-regularity` · theorem

For every commutative R₀ and n≥2, the generic map R₀[b_i,b′_i]ⁿ→R₀[b_i,b′_i]² with columns (b_i,b′_i) is regular.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/two-column-regularity-criterion`; `IntegralHeckeAndGaloisDeterminants:IHG.6/generic-minor-localization`; `IntegralHeckeAndGaloisDeterminants:IHG.6/generic-minor-saturation`.

**Construction or proof:**

1. Apply the criterion after localization and contract the previous minor ideal by saturation. Every calculation is over an arbitrary base ring.

**Acceptance:**

- For every commutative R₀ and n≥2, the generic map R₀[b_i,b′_i]ⁿ→R₀[b_i,b′_i]² with columns (b_i,b′_i) is regular.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Corollary 5.12, p.43.

### Finite and continuous Ribet modules

`IntegralHeckeAndGaloisDeterminants:IHG.6/compact-image-finite-module` · lemma

Under Theorem 2.1’s complete noetherian inclusion T⊆T̃ and total-fraction-ring hypotheses, a continuous compact representation ρ has Δψ and Δχ contained in a finitely generated T-submodule of M₂(K). Therefore Δψ, M₀ and N are finite T-modules, and the displayed cocycles are continuous for their quotient adic topologies.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-difference-modules`; `IntegralHeckeAndGaloisDeterminants:IHG.6/canonical-ribet-cocycle`; `IntegralHeckeAndGaloisDeterminants:IHG.6/local-ribet-quotient`; `IntegralHeckeAndGaloisDeterminants:IHG.6/initial-ribet-module`.

**Construction or proof:**

1. A proof is needed of a finite T-lattice containing the image and character differences: common denominators over T̃ do not suffice when T̃ is not finite over T. Use the T-valued trace/character algebra to construct this lattice, then noetherianity gives finite submodules; prove continuity of the resulting quotient maps. The missing argument is recorded as a gap.

**Acceptance:**

- Under Theorem 2.1’s complete noetherian inclusion T⊆T̃ and total-fraction-ring hypotheses, a continuous compact representation ρ has Δψ and Δχ contained in a finitely generated T-submodule of M₂(K). Therefore Δψ, M₀ and N are finite T-modules, and the displayed cocycles are continuous for their quotient adic topologies.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.1, p.9.

### Five types of Ribet module relations

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-five-relation-types` · lemma

Choose ρ_i=ρ(g_i)−ψ(g_i) spanning Δψ and adjoin y_v. A presentation of N has: (I) linear relations among ρ_i; (II) coefficients δ_ijk from (ρ_i+ν_i)ρ_j=∑δ_ijkρ_k; (III) coefficients of ρ(σ)−ψ(σ), σ∈G_v₀; (IV) those for σ∈I_v; (V) those for σ∈G_v together with ψ(σ)−χ(σ) in the y_v column. Here ν_i=ψ(g_i)−χ(g_i).

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/local-ribet-quotient`; `IntegralHeckeAndGaloisDeterminants:IHG.6/zeroth-fitting-ideal`.

**Construction or proof:**

1. Present Δψ by its selected generators, then add the product-quotient and local relations. Multiplying the cocycle relations by the units ψ(σ) gives the stated signed rows.

**Acceptance:**

- Choose ρ_i=ρ(g_i)−ψ(g_i) spanning Δψ and adjoin y_v. A presentation of N has: (I) linear relations among ρ_i; (II) coefficients δ_ijk from (ρ_i+ν_i)ρ_j=∑δ_ijkρ_k; (III) coefficients of ρ(σ)−ψ(σ), σ∈G_v₀; (IV) those for σ∈I_v; (V) those for σ∈G_v together with ψ(σ)−χ(σ) in the y_v column. Here ν_i=ψ(g_i)−χ(g_i).

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.2, equations (18)–(24), pp.10–11.

### Tensor resolutions of ordered determinantal ideals

`IntegralHeckeAndGaloisDeterminants:IHG.6/ordered-determinantal-tensor-resolution` · theorem

For maps f_i:R^(n_i)→R^(m_i) with 1≤m_i≤n_i, write J_i=I_(m_i)(f_i). If each f_i modulo J₁+…+J_(i−1) is regular, then the finite tensor product ⊗_i DetBR(f_i), with determinant lines trivialized, resolves R/(∑J_i).

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/buchsbaum-rim-exactness`; `DerivedDeRhamCohomology:DD.1/koszul-complex`.

**Construction or proof:**

1. Induct on the factors. Tensoring the preceding quasi-isomorphism with a bounded finite free complex preserves it. Over the preceding quotient, the next determinant complex is exact by regularity, so augment to the next quotient.

**Acceptance:**

- For maps f_i:R^(n_i)→R^(m_i) with 1≤m_i≤n_i, write J_i=I_(m_i)(f_i). If each f_i modulo J₁+…+J_(i−1) is regular, then the finite tensor product ⊗_i DetBR(f_i), with determinant lines trivialized, resolves R/(∑J_i).

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 5.4 and proof, pp.37–38.

### Stabilization of local relation rows

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-presentation-stabilization` · lemma

Adding each locally appearing ρ(σ)−ψ(σ) as a new generator, with a defining relation and a pivot row, changes the presentation but preserves its square relation determinant up to a chosen row/column ordering sign. Local rows then have one pivot and at most one y_v entry.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-five-relation-types`; `IntegralHeckeAndGaloisDeterminants:IHG.6/fitting-presentation-invariance`.

**Construction or proof:**

1. Use elementary determinant operations and expansion at the new defining pivot. Choose compatible orderings to obtain literal equality; for the Fitting ideal any sign is a unit.

**Acceptance:**

- Adding each locally appearing ρ(σ)−ψ(σ) as a new generator, with a defining relation and a pivot row, changes the presentation but preserves its square relation determinant up to a chosen row/column ordering sign. Local rows then have one pivot and at most one y_v entry.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.3, pp.11–12.

### Formal Ribet matrix ring

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-formal-matrix-ring` · construction

For a fixed finite relation minor, let R₀=Z[ν_i,ε_(row,i),δ_(row,ijk),x_σ] with distinct variables for each selected relation. Let R₁=R₀[a_i,b_i,c_i,d_i] and R=R₁/(b_σ:σ∈B_v₀). The matrices X_i=[[a_i,b_i],[c_i,d_i]] have a B=lower-GL₂/Z conjugation coaction, with R₀ trivial. Evaluation π:R→K sends all variables to the chosen relation coefficients, differences and local diagonal values.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-five-relation-types`.

**Construction or proof:**

1. Use a finite indexed multivariate polynomial ring and the ideal quotient. The selected lower-triangular v₀ basis makes π(b_σ)=0; the conjugation coaction preserves this quotient.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-relation-ideal`: The formal relation ideal is evaluated to zero.
- `IntegralHeckeAndGaloisDeterminants:IHG.6/formal-determinant-comparison`: The determinant difference lives in this ring.

**Planning API:**

- `TauCeti.IntegralRibet.formalRing` (constructor): R with distinct row-indexed coefficient variables.
- `TauCeti.IntegralRibet.formalRing_eval` (universal-property): The evaluation algebra map π determined by the relation data.
- `TauCeti.IntegralRibet.formalRing_borel` (structure): The integral lower-Borel conjugation coaction.

**Unit tests:**

- `formal_ring_no_generators` (degenerate): With no matrices or relation variables, R=Z.
- `formal_ring_one_free` (computation): With one matrix and no v₀ constraint, R=Z[a,b,c,d] apart from R₀ variables.
- `formal_ring_triangular` (compatibility): Imposing b=0 gives Z[a,c,d], whose lower-Borel torus fixes a,d and weights c.

**Acceptance:**

- For a fixed finite relation minor, let R₀=Z[ν_i,ε_(row,i),δ_(row,ijk),x_σ] with distinct variables for each selected relation. Let R₁=R₀[a_i,b_i,c_i,d_i] and R=R₁/(b_σ:σ∈B_v₀). The matrices X_i=[[a_i,b_i],[c_i,d_i]] have a B=lower-GL₂/Z conjugation coaction, with R₀ trivial. Evaluation π:R→K sends all variables to the chosen relation coefficients, differences and local diagonal values.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §3.1, equations (35)–(37), pp.17–18.

### Mixed minor and linear resolutions

`IntegralHeckeAndGaloisDeterminants:IHG.6/mixed-generic-resolution` · theorem

Let R=R₀[b′₁,…,b′_n,b₁,…,b_(n+r),V_ij], partition {1,…,n} into blocks S_a, let f_a have columns (b_j,b′_j) for j∈S_a, and add f_(k+1)(e_i)=∑_(j≤n+r)V_ij b_j for i≤r. Then ⊗_a DetBR(f_a) resolves the quotient by the sum of their image-minor ideals, with singleton blocks interpreted as zero local ideal and omitted.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/generic-two-column-regularity`; `IntegralHeckeAndGaloisDeterminants:IHG.6/generic-linear-regularity`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ordered-determinantal-tensor-resolution`.

**Construction or proof:**

1. Successive minor blocks use disjoint variables, so each map is regular over the preceding quotient. In that quotient the last r b variables remain free. The r linear equations have generic r×r coefficients in those variables and constants built from the first n variables; apply generic linear weak regularity. Then apply the ordered tensor-resolution theorem.

**Acceptance:**

- Let R=R₀[b′₁,…,b′_n,b₁,…,b_(n+r),V_ij], partition {1,…,n} into blocks S_a, let f_a have columns (b_j,b′_j) for j∈S_a, and add f_(k+1)(e_i)=∑_(j≤n+r)V_ij b_j for i≤r. Then ⊗_a DetBR(f_a) resolves the quotient by the sum of their image-minor ideals, with singleton blocks interpreted as zero local ideal and omitted.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Proposition 5.14, p.46.

### Weighted auxiliary matrix

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-weighted-auxiliary-matrix` · lemma

For a stabilized square relation matrix D and local choices σ_v, adjoin a block upper-triangular matrix E with diagonal z_v=ξ_v(σ_v)−χ(σ_v). Then detE=(∏_vz_v)detD.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-presentation-stabilization`.

**Construction or proof:**

1. Use the block triangular determinant formula; keep the entries in T̃ even when z_v is not T-valued.

**Acceptance:**

- For a stabilized square relation matrix D and local choices σ_v, adjoin a block upper-triangular matrix E with diagonal z_v=ξ_v(σ_v)−χ(σ_v). Then detE=(∏_vz_v)detD.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.4, equation (28), p.12.

### Formal Ribet relation ideals

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-relation-ideal` · definition

In the formal ring R let J be generated by the four entries of each linear relation matrix, each product relation (X_i+ν_i)X_j−∑δ_ijkX_k, and each local matrix [[A_στ,B_στ],[C_στ,D_στ]]. Here A_στ=b_σc_τ−(x_τ−d_τ)(x_σ−a_σ), B_στ=b_σ(x_τ−a_τ)−b_τ(x_σ−a_σ), C_στ=c_σ(x_τ−d_τ)−c_τ(x_σ−d_σ), D_στ=A_τσ. Let J′⊂J be generated only by their b entries.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-formal-matrix-ring`.

**Construction or proof:**

1. Take generated ideals of the explicitly indexed coefficient lists. Both carry the restricted Borel coaction.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-relation-evaluation`: Evaluation kills J.
- `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-obstruction-killing`: The inclusion J′→J kills the obstruction class.

**Planning API:**

- `TauCeti.IntegralRibet.relationIdeal` (constructor): The full four-entry ideal J.
- `TauCeti.IntegralRibet.upperRelationIdeal` (constructor): The b-entry subideal J′.
- `TauCeti.IntegralRibet.upperRelationIdeal_le` (relation): J′⊂J.
- `TauCeti.IntegralRibet.relationIdeal_stable` (structure): J and J′ are lower-Borel stable.

**Unit tests:**

- `relation_empty` (degenerate): With no selected relation rows or local pairs, J=J′=0.
- `relation_linear_row` (computation): For ε₁X₁+ε₂X₂, J has four scalar coefficients and J′ is (ε₁b₁+ε₂b₂).
- `relation_pair_sign` (characterisation): B_στ=−B_τσ and D_στ=A_τσ; in characteristic two the alternating relation still has B_σσ=0.

**Acceptance:**

- In the formal ring R let J be generated by the four entries of each linear relation matrix, each product relation (X_i+ν_i)X_j−∑δ_ijkX_k, and each local matrix [[A_στ,B_στ],[C_στ,D_στ]]. Here A_στ=b_σc_τ−(x_τ−d_τ)(x_σ−a_σ), B_στ=b_σ(x_τ−a_τ)−b_τ(x_σ−a_σ), C_στ=c_σ(x_τ−d_τ)−c_τ(x_σ−d_σ), D_στ=A_τσ. Let J′⊂J be generated only by their b entries.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §3.2 equations (39)–(42); §4.5, pp.18–19,29.

### Trace and determinant invariant subring

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-trace-determinant-subring` · definition

In R let A₀ be the image of the R₀-subalgebra of R₁ generated by tr f(X_i), det f(X_i) for all noncommutative polynomials f. Let A=A₀[d_τ:τ∈B_v₀]. This is the lower-Borel invariant subring after the specified upper-entry quotient.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-formal-matrix-ring`.

**Construction or proof:**

1. Define the subalgebra generated by the trace/determinant coordinate polynomials and the residual triangular diagonal entries; invariance and completeness are proved below.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-invariant-intersection`: Invariant expressions in the error ideal evaluate into Ĩ.

**Planning API:**

- `TauCeti.IntegralRibet.invariantSubring` (constructor): A=R₀[trace/determinant words,d_τ].
- `TauCeti.IntegralRibet.trace_mem_invariantSubring` (relation): Every word trace lies in A.
- `TauCeti.IntegralRibet.invariantSubring_eq_borel` (characterisation): A=H⁰(B,R), with rational scheme cohomology.

**Unit tests:**

- `invariant_one_matrix` (computation): Before triangular constraints, invariants of one 2×2 matrix are generated by a+d and ad−bc.
- `invariant_triangular_matrix` (computation): With b=0 the Borel invariants are Z[a,d].
- `invariant_trace_insufficient` (non-example): Over F₂, scalar matrices have trace zero but determinant a²; the determinant generator cannot be omitted.

**Acceptance:**

- In R let A₀ be the image of the R₀-subalgebra of R₁ generated by tr f(X_i), det f(X_i) for all noncommutative polynomials f. Let A=A₀[d_τ:τ∈B_v₀]. This is the lower-Borel invariant subring after the specified upper-entry quotient.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §3.3, p.19; Corollary 4.17, p.27.

### Equivariant extension of a local column map

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-local-equivariant-extension` · lemma

Extend f_v to f̃_v:⊕_σV_R→V_R by A e_σ↦A⊗(x_σ−d_σ)+B⊗c_σ and B e_σ↦A⊗b_σ+B⊗(x_σ−a_σ). This map is B-equivariant.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/borel-adjoint-weights`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-formal-matrix-ring`.

**Construction or proof:**

1. Substitute the universal lower-Borel action on a,b,c,d. The image of B scales by z/x and that of A adds y/x times the B image, exactly as in the source V module.

**Acceptance:**

- Extend f_v to f̃_v:⊕_σV_R→V_R by A e_σ↦A⊗(x_σ−d_σ)+B⊗c_σ and B e_σ↦A⊗b_σ+B⊗(x_σ−a_σ). This map is B-equivariant.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 5.8 and proof, p.41.

### Kernel vector for the altered matrix

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-altered-kernel-vector` · lemma

The altered matrix E′ of DKSW §2.4 has, on each principal artinian local factor K_i, a kernel vector with a unit coordinate. If all local D_v are units, its entries are −B_v/D_v, the b_i and −B_w/D_w. Otherwise multiply by a maximal power of the principal maximal-ideal generator and normalize the corresponding local D_v.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-weighted-auxiliary-matrix`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-five-relation-types`.

**Construction or proof:**

1. The local triangularization identity D_vb(σ)=B_v(ξ_v(σ)−ψ(σ)−a(σ)) verifies local rows. Product and linear relation identities verify the other rows. Irreducibility of the reduced representations makes the b_i generate K_i; for a nonunit D_v, invertibility of its basis matrix makes B_v a unit.

**Acceptance:**

- The altered matrix E′ of DKSW §2.4 has, on each principal artinian local factor K_i, a kernel vector with a unit coordinate. If all local D_v are units, its entries are −B_v/D_v, the b_i and −B_w/D_w. Otherwise multiply by a maximal power of the principal maximal-ideal generator and normalize the corresponding local D_v.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 2.4 and proof, pp.13–14.

### Evaluation annihilates the formal relation ideal

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-relation-evaluation` · lemma

For the chosen integral relation coefficients and local triangularizations, π(J)=0.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-relation-ideal`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-formal-matrix-ring`.

**Construction or proof:**

1. Linear/product rows are their defining equalities. Local B_στ vanishes after multiplication by each of B_v,D_v via the triangularization identity; these entries generate K. Repeat for the other three entries.

**Acceptance:**

- For the chosen integral relation coefficients and local triangularizations, π(J)=0.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 3.1, p.19.

### Integral trace and determinant invariants

`IntegralHeckeAndGaloisDeterminants:IHG.6/integral-matrix-invariants` · theorem

For a ℤ-flat commutative R₀ with trivial G action, GL₂ scheme invariants in R₀[a_i,b_i,c_i,d_i] are generated over R₀ by traces and determinants of all matrices in the algebra of the generic matrices.

**Prerequisites:** `LanglandsParameterStacks:LP3`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-trace-determinant-subring`.

**Construction or proof:**

1. Use the integral matrix invariant theorem over ℤ; the trace/determinant generators are scheme invariant. Flat scalar extension preserves the equalizer defining invariants. Read the integral generator proof separately; Q23’s asserted self-duality of std is not a substitute.

**Acceptance:**

- For a ℤ-flat commutative R₀ with trivial G action, GL₂ scheme invariants in R₀[a_i,b_i,c_i,d_i] are generated over R₀ by traces and determinants of all matrices in the algebra of the generic matrices.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Theorem 4.16, pp.26–27.

### Lower-Borel stability of relation ideals

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-relation-borel-stability` · lemma

Under g=[[x,0],[y,z]], each relation quadruple transforms by inverse conjugation: A↦A+(y/x)B, B↦(z/x)B, C↦(x/z)C−(y/z)A−(y²/xz)B+(y/z)D, D↦D−(y/x)B. Thus J and its b-entry ideal J′ are B-stable.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-relation-ideal`; `IntegralHeckeAndGaloisDeterminants:IHG.6/borel-adjoint-weights`.

**Construction or proof:**

1. Compute separately for the linear, product and local relation matrices over the universal lower-Borel coordinate ring. These polynomial identities hold over every coefficient ring, including characteristic two.

**Acceptance:**

- Under g=[[x,0],[y,z]], each relation quadruple transforms by inverse conjugation: A↦A+(y/x)B, B↦(z/x)B, C↦(x/z)C−(y/z)A−(y²/xz)B+(y/z)D, D↦D−(y/x)B. Thus J and its b-entry ideal J′ are B-stable.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 4.18, pp.29–30.

### Generic variable count for the Ribet relations

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-generic-row-count` · lemma

After the presentation stabilization, the formal b-entry ideal J′ consists of local 2×2 minors and r generic linear equations with exactly r b variables not assigned to a local block. Type III contributes one row for each assigned local generator; subtracting these from the square presentation leaves the required equality of counts.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-presentation-stabilization`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-relation-ideal`.

**Construction or proof:**

1. For type II put V_ij=(a_i+ν_i)δ_(j-index)+d_jδ_(i-index)−δ_ijk; solve for the distinct δ row variables to see they remain generic over the coefficient base. For type I use its independent ε variables. The square row count then gives the r fresh columns required by the mixed resolution.

**Acceptance:**

- After the presentation stabilization, the formal b-entry ideal J′ consists of local 2×2 minors and r generic linear equations with exactly r b variables not assigned to a local block. Type III contributes one row for each assigned local generator; subtracting these from the square presentation leaves the required equality of counts.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §5.9 final paragraph, p.46.

### Upper-entry relation complex

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-upper-relation-complex` · construction

For the formal Ribet ring and its b-entry relations, define C=Koszul(f)⊗_R⊗_v DetBR(f_v)(−1), where f(e_i)=L_i and f_v(e_σ)=A⊗b_σ+B⊗(x_σ−a_σ) in V_R. Degree zero is R and im(d₁)=J′. Each local determinant-line twist (−1) is retained.

**Prerequisites:** `DerivedDeRhamCohomology:DD.1/koszul-complex`; `IntegralHeckeAndGaloisDeterminants:IHG.6/buchsbaum-rim-determinantal-complex`; `IntegralHeckeAndGaloisDeterminants:IHG.6/borel-adjoint-weights`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-relation-ideal`.

**Construction or proof:**

1. Tensor the imported Koszul factor with the general determinant factors, using total degrees and the standard tensor differential. The determinant-line twist makes every factor’s degree zero R.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-upper-complex-exact`: The exact resolution in the obstruction comparison.
- `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-complex-comparison`: Maps to the full relation complex.

**Planning API:**

- `TauCeti.IntegralRibet.upperRelationComplex` (constructor): The specified tensor complex C.
- `TauCeti.IntegralRibet.upperRelationComplex_image` (characterisation): Its degree-one image is J′.
- `TauCeti.IntegralRibet.upperRelationComplex_augmentation` (structure): The natural augmentation C→R/J′.

**Unit tests:**

- `upper_complex_empty` (degenerate): With no selected relation generators or local pairs C=R in degree zero.
- `upper_complex_linear` (compatibility): With only one linear relation L it is the two-term Koszul complex R --L→ R.
- `upper_complex_two_local_rows` (computation): With two local rows and no linear relations it is R --(b₁b′₂−b₂b′₁)→ R after the determinant-line twist.

**Acceptance:**

- For the formal Ribet ring and its b-entry relations, define C=Koszul(f)⊗_R⊗_v DetBR(f_v)(−1), where f(e_i)=L_i and f_v(e_σ)=A⊗b_σ+B⊗(x_σ−a_σ) in V_R. Degree zero is R and im(d₁)=J′. Each local determinant-line twist (−1) is retained.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §5.4 equations (63)–(65), pp.38–39.

### Image and terms of the local distinct-block complex

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-local-distinct-block-image` · lemma

The subcomplex of DetBR(f̃_v)(−1) containing at most one wedge vector from each σ block has degree-one image J_v, the four local relation entries for distinct pairs. Its degree k terms are direct sums of A^⊗k⊗R.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-local-equivariant-extension`; `IntegralHeckeAndGaloisDeterminants:IHG.6/buchsbaum-rim-determinantal-complex`; `IntegralHeckeAndGaloisDeterminants:IHG.6/borel-adjoint-weights`; `IntegralHeckeAndGaloisDeterminants:IHG.6/good-adjoint-tensors`.

**Construction or proof:**

1. Evaluate the four wedges A_σ∧A_τ, A_σ∧B_τ, B_σ∧A_τ, B_σ∧B_τ to obtain the signed local entries. In the degree k formula, use ∧²V=ℤ(1), V*=V(−1), and V⊗V*=A to cancel the determinant-line twist and obtain A^⊗k.

**Acceptance:**

- The subcomplex of DetBR(f̃_v)(−1) containing at most one wedge vector from each σ block has degree-one image J_v, the four local relation entries for distinct pairs. Its degree k terms are direct sums of A^⊗k⊗R.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemmas 5.9–5.10, p.42.

### The determinant difference in the formal error ideal

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-determinant-error-ideal` · lemma

For the formal versions of E,E′, their determinant difference e=detE′−detE lies in I_R=(a_i+ν_i,b_i,c_i,d_i).

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-weighted-auxiliary-matrix`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-formal-matrix-ring`.

**Construction or proof:**

1. Every entry of E′−E is in I_R. Expand the determinant difference by replacing rows one at a time; each summand contains one entry of this ideal.

**Acceptance:**

- For the formal versions of E,E′, their determinant difference e=detE′−detE lies in I_R=(a_i+ν_i,b_i,c_i,d_i).

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §3.3, p.19.

### Pairing determinant terms along a local column

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-permutation-pairing` · lemma

Suppose a square matrix has a distinguished column whose nonlocal entries lie in J′. Each local row has entries b_σ and x_σ−a_σ in that column and its unique place column, and same-place 2×2 minors lie in J′. Then its determinant belongs to J′.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-relation-ideal`.

**Construction or proof:**

1. Terms choosing a nonlocal row in the distinguished column vanish modulo J′. For every remaining permutation, swap that local row with the row assigned to its place column. The swap is a fixed-point-free involution, and each paired sum is a multiple of the relevant local minor. The proof uses signs, with no division by 2.

**Acceptance:**

- Suppose a square matrix has a distinguished column whose nonlocal entries lie in J′. Each local row has entries b_σ and x_σ−a_σ in that column and its unique place column, and same-place 2×2 minors lie in J′. Then its determinant belongs to J′.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 4.20, equation (54), pp.31–32.

### Vanishing of the altered determinant

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-altered-determinant-zero` · lemma

With the source total-fraction-ring hypotheses, detE′=0 in K.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-altered-kernel-vector`.

**Construction or proof:**

1. For a unit coordinate of w, multiply E′w=0 by the adjugate: detE′ annihilates that coordinate and is zero. Apply on every factor.

**Acceptance:**

- With the source total-fraction-ring hypotheses, detE′=0 in K.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 2.4, pp.13–14.

### Invariant intersection with the character error ideal

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-invariant-intersection` · lemma

Let I_R=(a_i+ν_i,b_i,c_i,d_i)⊂R. Then π(A∩(I_R+J))⊂Ĩ.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-trace-determinant-subring`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-trace-word-congruence`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-relation-evaluation`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-polarized-local-congruence`.

**Construction or proof:**

1. The trace-minus-character, determinant and d_τ generators evaluate into Ĩ and vanish modulo I_R. Substitute X_i=diag(−ν_i,0) to compute R/(I_R+J)=R₀/I₀. The linear and product generators of I₀ vanish by the trace congruence. For local pairs use the polarized local identity with at least one inertia member, correcting the source’s missing σ restriction.

**Acceptance:**

- Let I_R=(a_i+ν_i,b_i,c_i,d_i)⊂R. Then π(A∩(I_R+J))⊂Ĩ.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 3.2, pp.20–21.

### Invariants of the formal Ribet ring

`IntegralHeckeAndGaloisDeterminants:IHG.6/triangular-borel-invariants` · theorem

For the formal ring R with the chosen b_τ=0 constraints, H⁰(B,R)=A₀[d_τ], the subring specified above.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/integral-matrix-invariants`; `IntegralHeckeAndGaloisDeterminants:IHG.6/triangular-torus-invariants`; `IntegralHeckeAndGaloisDeterminants:IHG.6/twisted-cohomology-product-surjectivity`; `IntegralHeckeAndGaloisDeterminants:IHG.6/twisted-good-filtration-vanishing`; `DerivedDeRhamCohomology:DD.1/koszul-complex`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-formal-matrix-ring`.

**Construction or proof:**

1. Resolve the triangular quotient by the imported Koszul complex. Its second-quadrant cohomology spectral sequence has Hʲ(B,C_i)=0 for j>i. Compare the complex containing only triangular variables to the full one; product surjectivity gives surjections on the boundary terms and then the finite filtration. The resulting invariant algebra is generated by matrix invariants and triangular diagonals.

**Acceptance:**

- For the formal ring R with the chosen b_τ=0 constraints, H⁰(B,R)=A₀[d_τ], the subring specified above.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Corollary 4.17, pp.27–28.

### Exactness of the upper-entry resolution

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-upper-complex-exact` · theorem

The augmented upper-entry complex C→R/J′ is a finite free resolution.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-upper-relation-complex`; `IntegralHeckeAndGaloisDeterminants:IHG.6/mixed-generic-resolution`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-generic-row-count`.

**Construction or proof:**

1. The row-count lemma and the change from relation variables to independent V coefficients identify the ring and maps with the mixed generic resolution. Apply that theorem.

**Acceptance:**

- The augmented upper-entry complex C→R/J′ is a finite free resolution.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Proposition 5.5(1) and §5.9, pp.39,46.

### Extension to adjoint multilinear terms

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-multilinear-extension` · lemma

Extend each b-entry linear/product relation f from ℤ(1) to the full adjoint A using its four coefficients. Koszul functoriality maps Koszul(f) into the subcomplex of Koszul(f̃) whose degree k terms choose at most one vector from each relation block; these terms are sums of A^⊗k⊗R.

**Prerequisites:** `DerivedDeRhamCohomology:DD.1/koszul-complex`; `IntegralHeckeAndGaloisDeterminants:IHG.6/good-adjoint-tensors`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-relation-borel-stability`.

**Construction or proof:**

1. Use the exterior decomposition of a direct sum; the rank-one source picks distinct relation blocks. Contraction removes one selected block and preserves that submodule.

**Acceptance:**

- Extend each b-entry linear/product relation f from ℤ(1) to the full adjoint A using its four coefficients. Koszul functoriality maps Koszul(f) into the subcomplex of Koszul(f̃) whose degree k terms choose at most one vector from each relation block; these terms are sums of A^⊗k⊗R.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemmas 5.6–5.7, pp.40–41.

### Unipotent invariance for product rows

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-unipotent-product-rows` · lemma

Replacing every product row of E′ by its image under the lower unipotent universal element τ_t leaves detE′ unchanged modulo J′.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-permutation-pairing`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-relation-borel-stability`.

**Construction or proof:**

1. Expand by multilinearity over nonempty subsets of changed rows. A changed row has t b_j in column i and −t b_i in column j. Verify the simultaneous column scaling and row replacement by the Leibniz formula without cancellation of b_i or b_j. The subsequent column additions put the matrix in the preceding pairing lemma’s form.

**Acceptance:**

- Replacing every product row of E′ by its image under the lower unipotent universal element τ_t leaves detE′ unchanged modulo J′.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 4.20, pp.31–32.

### Unipotent invariance for one local block

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-unipotent-local-rows` · lemma

Changing the local rows for one place from x_σ−a_σ to x_σ−a_σ−t b_σ leaves detE′ unchanged modulo J′, even when earlier local blocks have already changed.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-permutation-pairing`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-relation-borel-stability`.

**Construction or proof:**

1. Add t b_j times each generator column to the chosen place column. The difference entries on nonlocal rows lie in J′. Cross-place row terms pair to local minors; the added t b terms cancel inside those minors. Include the factor t in the cross-place minor calculation.

**Acceptance:**

- Changing the local rows for one place from x_σ−a_σ to x_σ−a_σ−t b_σ leaves detE′ unchanged modulo J′, even when earlier local blocks have already changed.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 4.21, pp.32–33.

### Full-entry relation complex

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-full-relation-complex` · construction

Define D as the tensor product of the adjoint multilinear Koszul subcomplex and the local distinct-block determinant subcomplexes, all determinant-line twists included. Then D₀=R, im(d₁)=J and each D_k is a sum of A^⊗k⊗R. Exactness in positive degrees is not part of this construction.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-multilinear-extension`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-local-distinct-block-image`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-relation-ideal`.

**Construction or proof:**

1. Take tensor products of the specified stable subcomplexes. In degree one the images add, giving precisely the full-entry ideal. Degreewise tensor closure gives the displayed adjoint tensor factors.

**Uses:**

- `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-full-complex-acyclic`: Supplies acyclic target terms.
- `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-complex-comparison`: Target of the upper-entry comparison.

**Planning API:**

- `TauCeti.IntegralRibet.fullRelationComplex` (constructor): The B-equivariant tensor complex D.
- `TauCeti.IntegralRibet.fullRelationComplex_image` (characterisation): Its degree-one image is J.
- `TauCeti.IntegralRibet.fullRelationComplex_terms` (structure): Its degree-k terms are direct sums of adjoint tensor powers with R.

**Unit tests:**

- `full_complex_empty` (degenerate): Without relation blocks, D=R in degree zero and J=0.
- `full_complex_one_linear` (computation): A single matrix relation has D₁=A⊗R→R with its four entries, and no repeated-block exterior terms.
- `full_complex_local_pair` (characterisation): For two distinct local blocks the four basis wedges give all four local relation entries; wedges from one block alone are excluded.

**Acceptance:**

- Define D as the tensor product of the adjoint multilinear Koszul subcomplex and the local distinct-block determinant subcomplexes, all determinant-line twists included. Then D₀=R, im(d₁)=J and each D_k is a sum of A^⊗k⊗R. Exactness in positive degrees is not part of this construction.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §5.4 equation (66), p.39.

### Borel invariance of the determinant difference

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-determinant-borel-invariance` · lemma

The image of e=detE′−detE in R/J′ is B-invariant.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-unipotent-product-rows`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-unipotent-local-rows`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-relation-borel-stability`.

**Construction or proof:**

1. The diagonal torus fixes the a,d entries in E′, and E is over the trivial coefficient ring. The two unipotent lemmas change all rows and preserve the determinant modulo J′. The torus and universal unipotent generate the lower Borel as a group scheme.

**Acceptance:**

- The image of e=detE′−detE in R/J′ is B-invariant.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 4.19, pp.30–33.

### Acyclicity of the full relation terms

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-full-complex-acyclic` · lemma

Every term D_k is B-acyclic for rational scheme cohomology over ℤ.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-full-relation-complex`; `IntegralHeckeAndGaloisDeterminants:IHG.6/good-adjoint-tensors`; `IntegralHeckeAndGaloisDeterminants:IHG.6/triangular-quotient-acyclicity`.

**Construction or proof:**

1. Use the adjoint tensor description and the triangular quotient acyclicity theorem. The polynomial coefficient base has trivial action and is ℤ-flat; filtered direct sums are treated through the requested rational-cohomology API.

**Acceptance:**

- Every term D_k is B-acyclic for rational scheme cohomology over ℤ.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Proposition 5.5(2), pp.39–40.

### Comparison of relation complexes

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-complex-comparison` · theorem

The natural inclusions of rank-one b-entry blocks induce a B-equivariant chain map C→D whose map in degree zero is id_R and whose map on degree-one images is J′↪J. After truncating at the images, it gives the exact-to-acyclic comparison of Theorem 4.23.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-upper-relation-complex`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-upper-complex-exact`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-full-relation-complex`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-full-complex-acyclic`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-multilinear-extension`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-local-distinct-block-image`.

**Construction or proof:**

1. Tensor the multilinear Koszul maps and the functorial local determinant maps. Their degree-zero maps respect the same determinant-line identifications. Truncate C₀=D₀=R to the respective degree-one images; exactness of the source and acyclicity of positive target terms remain.

**Acceptance:**

- The natural inclusions of rank-one b-entry blocks induce a B-equivariant chain map C→D whose map in degree zero is id_R and whose map on degree-one images is J′↪J. After truncating at the images, it gives the exact-to-acyclic comparison of Theorem 4.23.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Theorem 4.23 and §§5.4–5.6, pp.33,38–42.

### Vanishing of the relation-ideal cohomology map

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-obstruction-killing` · theorem

For every j≥1, inclusion induces the zero map Hʲ(B,J′)→Hʲ(B,J).

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-complex-comparison`; `LanglandsParameterStacks:LP3`.

**Construction or proof:**

1. Use the short exact kernel-image sequences of the exact source to lift a class successively to higher kernel cohomology. It becomes zero at the finite top degree. Map to the target and descend: each obstruction is zero by the next step and each lift is zero because the corresponding D term is acyclic.

**Acceptance:**

- For every j≥1, inclusion induces the zero map Hʲ(B,J′)→Hʲ(B,J).

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Theorem 4.22 and proof, pp.33–34.

### Lifting the invariant error across the full ideal

`IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-invariant-obstruction-lift` · lemma

The image of e in R/J lies in the image of H⁰(B,R)=A.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-determinant-borel-invariance`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-obstruction-killing`; `IntegralHeckeAndGaloisDeterminants:IHG.6/triangular-borel-invariants`.

**Construction or proof:**

1. The connecting class in H¹(B,J) is the image of the class in H¹(B,J′), by naturality of the two quotient exact sequences. That map is zero by the comparison theorem. Exactness therefore gives an invariant lift in R.

**Acceptance:**

- The image of e in R/J lies in the image of H⁰(B,R)=A.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §4.4 exact sequence (52), p.29.

### Formal determinant comparison

`IntegralHeckeAndGaloisDeterminants:IHG.6/formal-determinant-comparison` · theorem

For every stabilized relation minor under the full local Ribet input, detE′−detE evaluates into Ĩ. Since detE′=0 and detE=(∏_(v∈P)(ξ_v(σ_v)−χ(σ_v)))detD, this gives the weighted relation-minor containment in Ĩ.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-determinant-error-ideal`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-invariant-obstruction-lift`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-invariant-intersection`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-relation-evaluation`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-altered-determinant-zero`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-weighted-auxiliary-matrix`.

**Construction or proof:**

1. Write e=a+j with a invariant and j∈J. Since e∈I_R, a∈A∩(I_R+J); the intersection lemma puts π(a) in Ĩ and π(J)=0. Evaluation of the formal variables agrees with E,E′ modulo Ĩ. Use the altered determinant’s vanishing and the auxiliary block determinant.

**Acceptance:**

- For every stabilized relation minor under the full local Ribet input, detE′−detE evaluates into Ĩ. Since detE′=0 and detE=(∏_(v∈P)(ξ_v(σ_v)−χ(σ_v)))detD, this gives the weighted relation-minor containment in Ĩ.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Proposition 3.3, p.21; §§4.4–4.6.

### Weighted Fitting containment

`IntegralHeckeAndGaloisDeterminants:IHG.6/weighted-fitting-containment` · theorem

Under exactly Theorem 2.1’s hypotheses, including χ≡ψ modulo m, local triangularizations diag(η_v,ξ_v), ξ_v≡ψ on Σ, ξ_v≡χ on I_v for v∈P, and chosen σ_v∈G_v, the finite local quotient N satisfies (∏_(v∈P)(ξ_v(σ_v)−χ(σ_v)))·Fitt₀_T(N)·T̃⊆Ĩ. The containment is in T̃; local factors need not belong to T.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/zeroth-fitting-ideal`; `IntegralHeckeAndGaloisDeterminants:IHG.6/local-ribet-quotient`; `IntegralHeckeAndGaloisDeterminants:IHG.6/compact-image-finite-module`; `IntegralHeckeAndGaloisDeterminants:IHG.6/formal-determinant-comparison`.

**Construction or proof:**

1. Apply the formal determinant comparison to every square relation minor of the presentation of N. Evaluation kills the relation ideal; integral invariant theory puts the resulting invariant expression in Ĩ. Take the generated ideal, retaining the local multiplier.

**Acceptance:**

- For P=∅ the multiplier is 1; for a zero local factor the weighted containment is automatic and does not imply Fitt₀(N)⊆I.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Theorem 2.1, equation (12), pp.7–8.

### Ribet extension with all local conditions

`IntegralHeckeAndGaloisDeterminants:IHG.6/local-ribet-theorem` · theorem

For a noetherian inclusion T⊆T̃, T local and both complete for m_T, a proper nonzero Ĩ⊆T̃, I=Ĩ∩T, K=Frac(T̃) a finite product of local rings with principal maximal ideals and reduced quotient a product of fields, a compact G and continuous ρ:G→GL₂(K), assume characteristic polynomials lie in T[X] and reduce modulo I to (X−χ)(X−ψ), χ≡ψ modulo m_T, and every reduced field-factor representation is irreducible. With the finite triangular local input of the weighted-containment theorem, there exist finite N, continuous κ and vectors y_v having all its prescribed local values, generating N together, and satisfying its weighted Fitting containment.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/local-ribet-quotient`; `IntegralHeckeAndGaloisDeterminants:IHG.6/compact-image-finite-module`; `IntegralHeckeAndGaloisDeterminants:IHG.6/weighted-fitting-containment`.

**Construction or proof:**

1. Use the explicitly constructed quotient and the preceding continuity and weighted Fitting declarations. Retain every character and local subgroup as part of the input.

**Acceptance:**

- For a noetherian inclusion T⊆T̃, T local and both complete for m_T, a proper nonzero Ĩ⊆T̃, I=Ĩ∩T, K=Frac(T̃) a finite product of local rings with principal maximal ideals and reduced quotient a product of fields, a compact G and continuous ρ:G→GL₂(K), assume characteristic polynomials lie in T[X] and reduce modulo I to (X−χ)(X−ψ), χ≡ψ modulo m_T, and every reduced field-factor representation is irreducible. With the finite triangular local input of the weighted-containment theorem, there exist finite N, continuous κ and vectors y_v having all its prescribed local values, generating N together, and satisfying its weighted Fitting containment.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Theorem 2.1, pp.7–8.

### Ribet extension without residual distinctness

`IntegralHeckeAndGaloisDeterminants:IHG.6/global-ribet-theorem` · theorem

Let T be complete reduced noetherian local, I⊆T any ideal, G compact and ρ:G→GL₂(Frac(T)) continuous. Assume every characteristic polynomial lies in T[X], reduces modulo I to (X−χ(g))(X−ψ(g)) for continuous T-unit characters χ,ψ, and every field-factor representation is irreducible. Then there are a finite T-module M and a continuous class in H¹(G,M(χψ⁻¹)) for which every representative cocycle generates M, and Fitt₀_T(M)⊆I. Residual equality and residue characteristic two are allowed.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.6/local-ribet-theorem`; `IntegralHeckeAndGaloisDeterminants:IHG.6/coincident-class-surjectivity`; `IntegralHeckeAndGaloisDeterminants:IHG.6/distinct-character-ribet`; `IntegralHeckeAndGaloisDeterminants:IHG.6/zero-congruence-ideal-obstruction`.

**Construction or proof:**

1. If I=T use the zero module. The zero-ideal case contradicts irreducibility by the preceding lemma. For a proper nonzero I split into the coincident and distinct residual-character cases. In the first take T̃=T and S=∅ in the local theorem and use the every-representative lemma; in the second use the separate classical construction.

**Acceptance:**

- Let T be complete reduced noetherian local, I⊆T any ideal, G compact and ρ:G→GL₂(Frac(T)) continuous. Assume every characteristic polynomial lies in T[X], reduces modulo I to (X−χ(g))(X−ψ(g)) for continuous T-unit characters χ,ψ, and every field-factor representation is irreducible. Then there are a finite T-module M and a continuous class in H¹(G,M(χψ⁻¹)) for which every representative cocycle generates M, and Fitt₀_T(M)⊆I. Residual equality and residue characteristic two are allowed.

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Theorem 1.1, pp.2–3.

## Precise proof leaves

These are remaining proof or source-interface tasks. They are part of the dependency plan and prevent closure.

### Lyndon factorisation theorem

Every word over a totally ordered alphabet factors uniquely as a non-increasing product of Lyndon words (Lothaire, Combinatorics on Words, Ch. 5), and the resulting product formula (1 − Σ x_i)^{-1} = ∏_w (1 − w)^{-1} in noncommutative power series. Neither is in the pinned libraries or planned by a layer.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.0/amitsur-formula`.

### Procesi's theorem on pseudocharacters over ℚ-algebras

For a ℚ-algebra A and a d-dimensional pseudocharacter T on R there is a commutative A-algebra C ⊃ A and an A-algebra map ρ : R → M_d(C) with tr ∘ ρ = T (Procesi, 'A formal inverse to the Cayley–Hamilton theorem', J. Algebra 107 (1987)). Not in the pinned libraries; IHG.1's reconstruction theorems are the natural owner if they are stated over ℚ-algebras.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-trace-bijective-rational`.

### Bounded truncation induction for finite derived Hom

Transcribe the two-variable induction, the shifted-module Hom/Ext comparison and finite-module closure along the Hom exact sequences. ModuleCat.finite_ext supplies the base case; source BP26 invokes the bounded-complex conclusion without proving it.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hom-finite`.

### Countable coproduct and telescope comparison in D(A)

Verify the exact pinned coproduct interface and transcribe BN93 Proposition 3.1 as used by Proposition 3.2: totalization of the identity, e and 1−e sequences, with the maps proving the splitting identities. This is a missing proof leaf, not a replacement for idempotent completeness.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-idempotent-splitting`.

### K-projective comparison and chain-level cohomology maps

Audit the source declarations for K-projectivity and the full-faithfulness comparison K(A)→D(A) on bounded projective complexes, together with the explicit algebra homomorphism on degree-zero endomorphism rings.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.2/chain-derived-image-comparison`.

### Ghost factorization through truncation triangles

Confirm the standard t-structure and Hom exact sequence declarations at the pin, then prove the displayed factorization with the shifted top cohomology object. The factorization is stronger than merely vanishing after a cohomology functor.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-truncation-factor`.

### Finite algebra decomposition over a complete local ring

Read the exact pinned completeness, artinian product and henselian idempotent-lifting interfaces, and transcribe the proof that the factors of a finite A-algebra are the localizations T_m. The algebra need not be reduced.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.2/finite-hecke-local-factors`.

### Unbounded finite-cohomology ordinary finiteness

BP26 Definition 2.4.5 and Lemma 2.4.6 impose degreewise finite cohomology on the intermediate C, but the cited Lemma 2.4.3 assumes boundedness. The owned bounded-factor version is justified. For the degreewise-finite unbounded version, prove that localization is t-exact and each H^i(C)[T^{-1}] is an artinian-module direct factor, rather than applying the bounded lemma.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.2/finite-factor-ordinary-repair`.

### Order discriminant and large-prime completion proof

Read or supply exact baseline statements for normalization of finite semisimple number-field orders, discriminant localization and finite étale splitting. CGH20 asserts the smooth-completion conclusion in its opening paragraph but does not give this integral algebra argument there.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.2/large-prime-hecke-completion`.

### Completed polynomial-law evaluation interface

The determinant on the ordinary group algebra is planned via representability. Specify and audit the completed tensor-product functor on profinite coefficient algebras and its finite-quotient comparison before transcribing the extension as an actual natural transformation.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.4/completed-group-algebra-extension`.

### Distinct-character integral entry identities

Transcribe the Henselian-root and b(g)c(h) congruence argument from the cited Mazur–Wiles construction, including local-condition Remark 2.2. This is a separate proof branch; it is not an application of the coincident-character Nakayama lemma.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.6/distinct-character-ribet`.

### Weighted homogeneous quotient grading

Audit the pinned graded-algebra quotient interface and prove that the Roby relation ideal is homogeneous. Mathlib’s raw quotient and relations suffice but no graded decomposition was found.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.0/divided-power-grading`.

### Integral generic-matrix invariant presentation for Vaccarino

Read the integral Donkin–Zubkov generator-and-relation theorem in the version used by Vaccarino and verify the identification of its relations with divided-power abelianization. The theorem itself is a node; its untranscribed invariant-theory proof is a gap, not a baseline claim.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.0/vaccarino-universal-matrices`.

### Constant-rank projective exterior determinant descent

Read pinned rank-localization and invertible-module endomorphism declarations, prove ∧^dV is invertible for constant-rank-d finite projective V, and transcribe the local matrix-law descent. LinearMap.det’s finite-basis definition alone does not supply this generality.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.0/finite-projective-determinant`.

### Azumaya splitting and norm descent supplier

IsAzumaya already exists, but the upstream SemisimpleAlgebras roadmap treats central simple algebras over fields. An extension in that same direction must supply faithfully flat/étale matrix splittings over general rings and reduced-norm descent; record Semisimple algebras, Part II in the restructuring proposal.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.0/azumaya-determinant`.

### Multiplicative divided-power product decomposition

Transcribe Roby III.4 and verify compatibility of the direct-sum divided-power decomposition with the internal multiplication. This is not the ordinary graded multiplication.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/product-algebra-determinants`.

### Separable semilinear descent of determinant kernels

Import the exact Galois-descent vector-space equivalence and verify descent for the infinite separable algebraic union; the example of x↦x^p on a purely inseparable field extension prohibits arbitrary base-change equality.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/separable-kernel-base-change`.

### Idempotents in algebraic algebras

Transcribe the lifting of finite orthogonal idempotent families from semisimple quotients of algebraic algebras used in Chenevier Lemma 2.14. Generic Artin–Wedderburn alone does not establish this lifting.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/bounded-finite-simple-factors`.

### Bounded-center dimension argument

Transcribe the center decomposition and finite-over-center proof of Lemma 2.14, including the separable scalar-extension argument. Do not silently replace the conclusion by finite k-dimension over an arbitrary imperfect field.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/bounded-centers`.

### Matrix determinant-power classification

Transcribe Chenevier Exercise 2.5 with the diagonal-corner conjugacy and elementary-matrix calculation, including the arbitrary-characteristic Amitsur reconstruction.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-factor-determinants`.

### Field norm classification

Transcribe Theorem 2.16’s reduced-norm and inseparable-exponent classification and uniqueness. Import the generic norm and central-simple descent results from SemisimpleAlgebras Part II; the packet does not replan that direction.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/field-faithful-quotient`.

### Matrix-unit lifting over henselian integral algebras

The source cites Bourbaki III §4 Exercise 5. Supply a public proof and the exact library interface for lifting a full matrix-unit system in an integral, possibly nonfinite, noncommutative algebra over a henselian local ring.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-idempotent-lifting`.

### Split injection into the adapted representation ring

Transcribe BC09 Proposition 1.3.13, including the explicit A-linear splitting after every scalar extension; imposing multiplication relations alone does not prove universal injectivity.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-adapted-coordinate-ring`.

### All-characteristic determinant reducibility theorem

CN23 Proposition 3.2.3 imports Allen–Newton–Thorne 2020 Proposition 2.5; obtain and read that public proof. BC09 Proposition 1.5.1 is a trace-pseudocharacter result under its invertibility hypotheses and cannot replace the determinant theorem in characteristic two.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/reducibility-ideal`.

### Primitive-projective Ext comparison

Transcribe BC09 Theorem 1.5.6 and its change-of-rings image assertion, and audit the pinned projective module / Ext comparison. The quotient algebra S cannot be replaced by an arbitrary original R.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-projective-cover-extensions`.

### Stable lattice and fractional-ideal entry bounds

Supply the stable lattice proof for the stated continuous compact image over a local field and the integral entry bounds after the separating idempotents. For general compact topological G require compactness explicitly; record it in ribet-lattice hypotheses.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/ribet-lattice`.

### Topological Nakayama for completed Cayley–Hamilton algebras

Transcribe the radical-cotangent injection into H¹ used by WE18 Proposition 3.6, its residual nilpotence argument in the allowed characteristic range and the completion comparison; prove the finite module theorem with precisely the source H¹ hypothesis.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/completed-cayley-hamilton-finite`.

### Characteristic-two symplectic form descent

GG12 Lemma 7.1.1 excludes residue characteristic two. BCGP25 Proposition 5.7.9 supplies its particular automorphic p=2 setting; read and isolate its algebraic form descent if a general p=2 schema is wanted. Determinant data alone recover only the square of the multiplier.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/symplectic-coefficient-descent`.

### Disconnected centralizer comparison

Verify Q23 Claim A’s centralizer equality at the level of reduced algebraic groups/k-points, and supply the scheme-theoretic separation statements only where needed. Equal dimensions and component counts alone do not prove equality of arbitrary nonreduced subgroup schemes.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-one-entry-extension`.

### Valuation reconstruction continuity proof

Read V. Lafforgue Proposition 5.7’s proof and its topology assumptions. Q23 Theorem 3.8’s displayed proof presumes compactness of the reconstructed image while trying to prove continuity, so it cannot close the general disconnected local-field case without a separate bounded-image or embedding argument.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-valued-continuity`.

### Building supplier for integral reductive models

The actual building owner is ReductiveGroupsPartII RG2.2 (bounded-action fixed points), with RG2.3 for parahoric/hyperspecial models. Transcribe the finite-extension/conjugation passage from a building fixed point to the standard integral H model used by BHKT19 Theorem 4.8; its precise scope is requested rather than attributed to affine flags.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-integral-model`.

### Invariant finite generation and finite tangent space

Transcribe Q23 Theorem 5.7’s finite-tuple comparison and the completion argument, importing geometric reductivity and finite generation from LP3. Mazur’s Φ_p extension is not inferred solely from finite topological generation.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-pseudodeformation-noetherian`.

### Mixed-characteristic slice hypotheses

Read BHKT19 Proposition 3.13 and its smooth free-orbit hypotheses in full; translate its formal torsor statement. Absolute irreducibility for a general reductive group does not by itself replace the scheme-theoretic centralizer condition.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-slice-reconstruction`.

### Integral cokernel in boundary-product surjectivity

DKSW Corollary 4.13 checks prime fibers but does not spell out rational vanishing and finite-generation/bounded-torsion hypotheses excluding a nonzero divisible cokernel. Transcribe the degreewise-finite polynomial-ring case and then state any generalization only with its justified hypotheses.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.6/twisted-cohomology-product-surjectivity`.

### Integral two-by-two matrix invariant generator proof

DKSW Theorem 4.16 cites De Concini–Procesi, The invariant theory of matrices (2017), Theorem 1.10. Its proof has not been obtained from a public permitted source. LP3 supplies generic invariant-theory infrastructure; the specialized integral trace/determinant generator theorem remains an explicit IHG.6 proof leaf.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.6/integral-matrix-invariants`.

### Exterior-bar cycle normal forms

Transcribe Buchsbaum Lemmas 2.3–2.8 and 2.10–2.11 as individual algebraic contraction lemmas and spell out the transpose/exterior-duality identifications in Theorem 2.9. The scanned author copy and its complete proof were read; the exact signs and index sets are not hidden behind an asserted baseline theorem.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.6/determinantal-exactness-transfer`.

### Compact-image lattice and adic quotient topology

DKSW compresses finiteness and continuity into one sentence. In the general inclusion T⊂T̃, bounded denominators over T̃ alone do not give a finite T-lattice, since T̃ need not be finite over T. Supply a trace-pairing argument over the T-valued character algebra, control nonreduced field-factor kernels, and identify the quotient adic topology. Until then the claimed finiteness lemma is a proof leaf, not an inferred consequence of compactness.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.6/compact-image-finite-module`.

## Supplier requests


### SmoothRepresentationsOfLocalGroups:SR.4

Supply integral spherical double-coset generators with vol(K)=1 and normalized Satake coefficients S(T_i)=q^{i(n−i)/2}e_i(z_1,…,z_n), after adjoining an invertible square root of q; specialize these to the chosen GSp4 spin and dual-spin representations.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-satake-coefficients`; `IntegralHeckeAndGaloisDeterminants:IHG.3/gsp4-spin-satake`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors

Supply the reciprocity map with its stated Frobenius convention and the explicit inverse map for switching arithmetic and geometric Frobenius.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.3/frobenius-conversion`; `IntegralHeckeAndGaloisDeterminants:IHG.3/rank-one-normalization`.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ

Supply the symplectic similitude group and alternating-form basis conventions; IHG imports the carrier and proves only the normalization/descent comparisons used here.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.3/gsp4-full-similitude`.

### VStackSheavesAndLisseCategories:VS2

Supply the analytic localization A[T]→A[T,T^{-1}], its agreement with classical localization on discrete finite objects and its preservation of the limits/colimits used by BP26 Lemma 2.4.4.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.2/ordinary-localization-comparison`.

### tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev

Supply conjugacy-class density of unramified Frobenius in every finite quotient of G_{F,S}, with the explicit Frobenius convention.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.4/frobenius-determinant-uniqueness`.

### PadicMeasuresIwasawaAlgebras:L1

Supply the general complete adic coefficient/profinite-group completed group algebra and completed tensor-product comparison with its finite quotient system.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.4/completed-group-algebra-extension`.

### ArithmeticGaloisDuality:R02.1

Supply continuous degree-one cocycles/classes with topological coefficient modules, the character-twist action, restriction, coboundaries and equivariant functoriality. The finite T-modules in DKSW carry their adic topology and need not be finite sets.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.5/lattice-class-local-conditions`.

### LanglandsParameterStacks:LP3

Supply invariant coordinate algebras O[H^m]^(H⁰), reindexing/product pullbacks, closed-orbit separation and H-complete reducibility for possibly disconnected generalized reductive H over noetherian O; use the integral carrier, not only the current algebraically closed good-filtration t-structure.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.0/reductive-pseudocharacter`.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ

Supply integral reductive group-scheme carriers and their classical GL_n/GSp_2n point and coordinate dictionaries; general smooth disconnected extensions use the imported component-group carrier.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.0/reductive-pseudocharacter`; `IntegralHeckeAndGaloisDeterminants:IHG.3/gsp4-full-similitude`.

### tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-0-the-jacobson-radical-and-the-semisimplicity-criterion-supporting-api-optional

Supply the Jacobson radical unit criterion and the nilpotence of the radical of finite-dimensional commutative algebras.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/field-radical-kernel`.

### LanglandsParameterStacks:LP3

Supply the finite-conjugacy-class parabolic/Levi theory, minimal-parabolic common Levi result, closed-orbit quotient surjectivity and disconnected H-complete-reducibility criterion used in Q23 Lemmas 3.4–3.6.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-closed-orbit`.

### ReductiveGroupsPartII:RG2.2

Supply bounded-subgroup fixed points and the finite-extension hyperspecial integral model used in BHKT19 Theorem 4.8; verify the correct building owner before adding an atlas edge.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-integral-model`.

### LanglandsParameterStacks:LP3

Supply the mixed-characteristic free-orbit formal slice of BHKT19 Theorem 4.10 with scheme-theoretically trivial adjoint centralizer, and the Cartesian square of completed tuple torsors.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-slice-reconstruction`.

### LanglandsParameterStacks:LP3

Supply the integral rational comodule category, derived invariants, algebraic induction, exhaustive good filtrations, tensor closure, universal coefficients, products, and GL₂/Fp good-filtration dimensions used by DKSW §§4.1–4.3. The current field t-structure node does not supply this integral API.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.6/borel-restriction`; `IntegralHeckeAndGaloisDeterminants:IHG.6/twisted-good-filtration-vanishing`; `IntegralHeckeAndGaloisDeterminants:IHG.6/good-matrix-polynomials`.

### DerivedDeRhamCohomology:DD.1

Supply regular-sequence Koszul exactness and finite free tensor/K-flat comparison, beyond the existing arbitrary-module exterior-contraction complex.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.6/triangular-quotient-acyclicity`; `IntegralHeckeAndGaloisDeterminants:IHG.6/triangular-borel-invariants`; `IntegralHeckeAndGaloisDeterminants:IHG.6/ordered-determinantal-tensor-resolution`.

### ReductiveGroupsPartII:RG2.3

Supply the finite-extension/conjugation passage from the bounded building fixed point to an integral hyperspecial H model for BHKT19 Theorem 4.8.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-integral-model`.

### tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-2-artin-wedderburn-assembled-with-uniqueness

Reuse the existing supplier at its stated hypotheses for the marked nodes; no reconstruction of this upstream mathematics is planned here.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/bounded-finite-simple-factors`.

### tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-3-the-double-centralizer-density-theorem

Reuse the existing supplier at its stated hypotheses for the marked nodes; no reconstruction of this upstream mathematics is planned here.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/bounded-simple-modules`.

### tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-4-central-simple-algebras-and-their-tensor-products

Reuse the existing supplier at its stated hypotheses for the marked nodes; no reconstruction of this upstream mathematics is planned here.

**Needed by:** `IntegralHeckeAndGaloisDeterminants:IHG.1/bounded-centers`; `IntegralHeckeAndGaloisDeterminants:IHG.1/field-faithful-quotient`.

## Boundary proposals

These proposals retain the current stage structure and accepted RS-24 boundaries; applying cross-roadmap changes requires the programme’s restructuring workflow.

**IntegralHeckeAndGaloisDeterminants, tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras**

IHG.0 needs Azumaya matrix splitting and reduced-norm descent over general commutative rings. The existing SemisimpleAlgebras layers supply the central-simple field theory; they do not provide the general-ring statement. IHG.1 also needs its precise separable/inseparable field-norm classification interfaces.

Keep the upstream SemisimpleAlgebras roadmap intact. Add Semisimple algebras, Part II in that direction, beginning with the existing field results and supplying general-ring Azumaya faithfully flat/étale splitting and reduced-norm descent. IHG.0 imports those results to construct a determinant law; IHG.1 imports the field norm and semilinear descent interfaces. The exact unprovided inputs remain gaps here until that supplier has named nodes.

**IntegralHeckeAndGaloisDeterminants, CompletedCohomologyPartII, CompletedCohomologyAndLocalGlobalCompatibility**

Verified RT-AREA-langlands/18 distinguishes bounded finite-cohomology image algebras and ghost localization from completed inverse-limit Hecke algebras. CompletedCohomologyPartII:CC.8 and R31.3 use the former construction before completion.

Keep IHG.2 as the owner of finite-level chain/homotopy/derived/cohomology images, bounded finite derived Hom, ghosts, splitting and localization. Add IHG.2 → CompletedCohomologyPartII:CC.8; CC.8 owns completed inverse limits, completed localization and the classical-family congruence realization. R31.3 imports CC.8 and keeps its GL₂ specialization. No completed inverse-limit construction is duplicated in IHG.2.

**IntegralHeckeAndGaloisDeterminants, AutomorphicGaloisRepresentations, AutomorphicGaloisRepresentationsPartII, TorsionCohomologyInfrastructure**

Verified RT-AREA-langlands/25 and /26 identify the same finite-quotient interpolation in R19.6 and AG2.4 and the algebraic factor-separation input in TC.3. A construction dependency from TC.2 to IHG.5 would be circular.

R19.6 imports IHG.1 and IHG.4 and retains its ordinary geometric realization. AG2.4 imports IHG.4 and retains the HLTT geometric realization and auxiliary-CM descent. Separate TC.3’s input-parametrized factor-separation lemma as an algebra substage with inputs only IHG.0/1/4/5 and no TC.2 requirement; AG2.4 and TC.3 both import it. IHG.5 keeps input-parametrized algebraic error/descent statements without a TC.2 construction prerequisite. A classical rank-two Frobenius polynomial is an input to IHG.3, so IHG.3 does not depend back on R19.6.

**IntegralHeckeAndGaloisDeterminants, LanglandsParameterStacks**

IHG’s disconnected reconstruction and DKSW integral rational Borel cohomology need LP3 interfaces beyond the current field good-filtration t-structure. The requested invariant-coordinate, complete-reducibility and integral good-filtration theories belong in the existing LP3 direction.

Keep IHG.1 as the owner of generalized reductive pseudocharacter reconstruction; LP2:semisimple-characters and GS.5 import it. LP3 supplies invariant coordinate algebras for H⁰-conjugation, disconnected closed-orbit/complete-reducibility theory and smooth free-orbit slices, plus the integral rational comodule and derived-invariant API with exhaustive finite-degree good filtrations. IHG.6 proves the specialized GL₂ acyclicity, invariant-ring and obstruction consequences using that API. Requests remain open until the supplier exports the precise nodes.

## Source corrections and edition checks

The packet retains literal excerpts and distinguishes author/preprint passages from the published version. DKSW’s 21 September 2023 manuscript was collated against arXiv v2. Quast’s October 2023 author copy was collated against the March 2026 revision and January 2026 publisher HTML; the affected proof passages persist. Claims below are scoped to the versions actually inspected.

### IntegralHeckeAndGaloisDeterminants/E1: error

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Proposition 1.27, p. 20 (arXiv:0809.0415v2; same in the Durham preprint).

**Correction:** Assume that d! is invertible in A. Then D ↦ Tr is injective; when A is a ℚ-algebra it is a bijection.

**Reason:** The proof uses that Λ_i(r) lies in the ℤ[1/d!]-algebra generated by the Tr(r^j), which needs d! invertible, and injectivity is false without it. Let p be prime, A = 𝔽_p[X], R = A[Y] and d = p; let D_1 and D_2 be the determinants of the representations Y ↦ I_p and Y ↦ X·I_p. Both traces are p·(evaluation) = 0, but D_1(Y) = 1 and D_2(Y) = X^p. The introduction and Remark 1.28 discuss only the bijectivity hypothesis; the only later use of the proposition (§3, p. 45) is over affinoid ℚ_p-algebras, where the corrected statement applies.

**Effect:** a stated result. **Prior record:** new.

### IntegralHeckeAndGaloisDeterminants/E2: misprint

**Source:** [CHENEVIER-DET](https://arxiv.org/abs/0809.0415), Lemma 1.18(ii), p. 16 (arXiv:0809.0415v2; same in the Durham preprint).

**Correction:** (ii) P̃ : M/ker(P) −→ N is faithful.

**Reason:** Lemma 1.18 concerns a polynomial law P : M → N between A-modules; R and S are the algebras of the next lemma. The proof ('Ker(P̃) = Ker(P)/K') is written for M/K → N.

**Effect:** nothing. **Prior record:** new.

### IntegralHeckeAndGaloisDeterminants/E3: misprint

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.1, p.9, second relation for Q; 21 September 2023 manuscript; unchanged arXiv v2.

**Correction:** Use κ(σ)−(χψ⁻¹(σ)−1)y_v, with the y_v convention of Theorem 2.1.

**Reason:** The displayed relation has the opposite sign to the conclusion κ(σ)=(χψ⁻¹(σ)−1)y_v. Replacing the named vectors by their negatives reconciles the two conventions, but the quotient and theorem must choose the same one.

**Effect:** nothing. **Prior record:** new.

### IntegralHeckeAndGaloisDeterminants/E4: misprint

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 3.2, p.21, equation (47); same arXiv v2.

**Correction:** The second factor is ξ_v(τ)−ψ(τ).

**Reason:** The left side uses x_τ, and ξ_v is evaluated at group elements; ψ is a character, not the group argument.

**Effect:** nothing. **Prior record:** new.

### IntegralHeckeAndGaloisDeterminants/E5: gap

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 3.2 proof after (47), p.21; same arXiv v2.

**Correction:** When the pair contains the distinguished element σ_v outside inertia, use the polarized character-polynomial congruence to exchange σ and τ. Every distinct pair in the chosen local generating set has at least one inertia element.

**Reason:** Condition (11) only gives this congruence on inertia. The polarized identity P(σ,τ)+P(τ,σ)∈Ĩ makes the remaining product vanish because its reversed first factor lies in Ĩ. This repair uses no division by 2.

**Effect:** the proof. **Prior record:** new.

### IntegralHeckeAndGaloisDeterminants/E6: error

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 4.18, p.30; same arXiv v2.

**Correction:** The four entries are the image of an equivariant map from an adjoint module; use an equivariant quotient and stability of the generated ideal.

**Reason:** In the distinguished triangular block b_τ=0, a four-entry relation can have identically zero upper entry, and zero relations are possible. Its span need not have rank four. Equivariance, rather than injectivity, proves exactly the stability used.

**Effect:** a stated result. **Prior record:** new.

### IntegralHeckeAndGaloisDeterminants/E7: error

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Definition 4.6, p.23, used by Theorem 4.10, p.24; same arXiv v2.

**Correction:** Use an exhaustive good filtration, or state the result on each finite polynomial-degree part and take their filtered union.

**Reason:** Simultaneous conjugation gives the entire polynomial matrix ring central weight zero, hence a single homogeneous central-weight piece of infinite rank. A finite succession of finite-rank induced modules cannot exhaust it. The degreewise good-filtration statement is the one used here.

**Effect:** a stated result. **Prior record:** new.

### IntegralHeckeAndGaloisDeterminants/E8: misprint

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Corollary 4.13 proof, p.25; same arXiv v2.

**Correction:** For i > 1.

**Reason:** The argument handles the i=2 boundary case via the same mod-2 formula; the literal text skips it. An additional integral lifting issue is separately recorded as a proof gap in this packet.

**Effect:** nothing. **Prior record:** new.

### IntegralHeckeAndGaloisDeterminants/E9: misprint

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 4.21 proof, p.33, equation (55); same arXiv v2.

**Correction:** The displayed 2×2 determinant is x times this expression, with the sign set by the column order.

**Reason:** Each entry in the v_i column is b_σ x; direct expansion supplies the omitted common unipotent parameter. Ideal membership is unchanged.

**Effect:** nothing. **Prior record:** new.

### IntegralHeckeAndGaloisDeterminants/E10: misprint

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §5.3.1 functoriality, p.37; same arXiv v2.

**Correction:** Require f′∘g=f.

**Reason:** The printed composition has incompatible domains; the stated map on exterior powers runs V→V′.

**Effect:** nothing. **Prior record:** new.

### IntegralHeckeAndGaloisDeterminants/E11: misprint

**Source:** [DKSW23](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Proposition 5.13 proof, p.44; same arXiv v2.

**Correction:** Y_j=X_j for j>1.

**Reason:** At j=1 the printed assignments conflict. The following inverse change of variables keeps only j>1.

**Effect:** nothing. **Prior record:** new.

### IntegralHeckeAndGaloisDeterminants/E12: error

**Source:** [Q23](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), Lemma 4.3 and Theorem 4.4 proofs; author v1 pp.20–21, arXiv v2 pp.23–24; same publisher HTML.

**Correction:** Use the standard module V and its dual separately; the matrix sum is (V⊗V*)⊕m. Import the integral good-filtration theorem for the conjugation coordinate ring.

**Reason:** Already for GL₁ the central scalar a acts on V by a and on V* by a⁻¹, so V is not self-dual. Also a sum of m matrix modules has rank mn², whereas V⊗2m has rank n^(2m). The proposed proof shortcut cannot establish good filtration.

**Effect:** the proof. **Prior record:** new.

### IntegralHeckeAndGaloisDeterminants/E13: gap

**Source:** [Q23](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), Theorem 3.8 proof; author v1 pp.13–14, arXiv v2 pp.16–17; same publisher HTML.

**Correction:** Prove continuity/topological embedding without assuming compactness of the image, or first prove the required boundedness independently.

**Reason:** The source is proving continuity of an abstract reconstructed ρ. A homomorphic image of a compact topological group need not be compact before continuity is proved. The connected-group BHKT/Lafforgue continuity result and this proof leaf are distinguished in the packet.

**Effect:** the proof. **Prior record:** new.

### IntegralHeckeAndGaloisDeterminants/E14: gap

**Source:** [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), Lemma 2.4.6 proof, p.19 of the 5 November 2025 author PDF; publisher proof inaccessible.

**Correction:** Apply the splitting argument to bounded truncations and establish compatibility of localization with cohomology; the bounded-factor repair in this packet is proved separately.

**Reason:** Definition 2.4.5 only makes each cohomology module finite and does not bound the complex, while Lemma 2.4.3 requires boundedness. The cited lemma does not directly apply.

**Effect:** the proof. **Prior record:** PAPER-BOXER-PILLONI-26/E29.

### IntegralHeckeAndGaloisDeterminants/E15: misprint

**Source:** [PILLONI20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §15.2, p.107 of public author manuscript.

**Correction:** Frob_ℓ.

**Reason:** The displayed determinant is evaluated at a Frobenius element.

**Effect:** nothing. **Prior record:** PAPER-PILLONI-20/E149.

### IntegralHeckeAndGaloisDeterminants/E16: error

**Source:** [PILLONI20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §15.2, p.107 of public author manuscript, definition of Θ_m.

**Correction:** Specify the full similitude character ℓ³Θ_m(T_(ℓ,0))=ν(ρ̄(Frob_ℓ)), or allow any maximal ideal satisfying the polynomial rule rather than claiming that this rule alone specifies the character.

**Reason:** The constant/highest coefficient only gives the square of the multiplier. When the trace coefficient is zero the odd coefficient cannot select its sign; in characteristic 2 the ambiguity also has scheme-theoretic content. The packet retains the full multiplier as data.

**Effect:** a stated result. **Prior record:** PAPER-PILLONI-20/E150.

## Baseline declarations

Only the scope of each inspected declaration is used. Whole modules are not treated as proved mathematical targets.

| Reference | Provided statement at the pin |
| --- | --- |
| `mathlib:AlgHom` | Algebra homomorphisms. |
| `mathlib:Algebra.TensorProduct.instRing` | The ring structure on a tensor product of algebras. |
| `mathlib:Algebra.TensorProduct.rid` | B ⊗[R] R ≃ B. |
| `mathlib:Equiv.Perm.SameCycle` | Two points lie in the same cycle of a permutation. |
| `mathlib:Equiv.Perm.sign` | The sign of a permutation. |
| `mathlib:Function.minimalPeriod` | The least period of a point under iteration. |
| `mathlib:LinearMap` | Linear maps. |
| `mathlib:Matrix.charpoly` | The characteristic polynomial of a square matrix. |
| `mathlib:Matrix.det` | The determinant of a square matrix. |
| `mathlib:Matrix.det_conj` | For a square matrix P with IsUnit P, det(P M P⁻¹)=det M; applying it to a unit matrix meets the invertibility hypothesis. |
| `mathlib:Matrix.det_mul` | det (M N) = det M · det N. |
| `mathlib:Matrix.det_smul` | det (c • M) = c ^ n · det M. |
| `mathlib:Matrix.trace` | The trace of a square matrix. |
| `mathlib:MonoidAlgebra` | The monoid algebra A[G]. |
| `mathlib:MonoidAlgebra.mapDomainAlgHom` | The algebra map A[H] → A[G] induced by a monoid hom H → G. |
| `mathlib:MvPolynomial` | Multivariate polynomials. |
| `mathlib:MvPowerSeries` | Multivariate power series. |
| `mathlib:Polynomial` | Polynomials in one variable. |
| `mathlib:Polynomial.Monic` | Monic polynomials. |
| `mathlib:PolynomialLaw` | Polynomial laws between modules (Roby), natural in commutative coefficient algebras in the universe of the base. |
| `mathlib:PolynomialLaw.comp` | Composition of polynomial laws. |
| `mathlib:PolynomialLaw.ground` | The underlying map M → N of a polynomial law. |
| `mathlib:PolynomialLaw.id` | The identity polynomial law. |
| `mathlib:RingHom.map_det` | Ring homomorphisms commute with determinants. |
| `mathlib:TensorProduct` | Tensor products of modules. |
| `mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange` | With R→A→B and the module/scalar towers in TensorProduct.Tower, the B-linear equivalence M⊗[A](A⊗[R]N)≃ₗ[B]M⊗[R]N; the polynomial-law specialization uses B=A. |
| `mathlib:Continuous` | Continuous maps. |
| `mathlib:Continuous.ext_on` | Continuous maps into a Hausdorff space agreeing on a dense set are equal. |
| `mathlib:IsOpen` | Open sets. |
| `mathlib:LinearEquiv.rTensor` | For f:N≃ₗ[R]P, the induced equivalence N⊗[R]M≃ₗ[R]P⊗[R]M, with R a commutative semiring and the stated module structures. |
| `mathlib:LinearMap.lTensor` | id ⊗ f. |
| `mathlib:MonoidAlgebra.of` | The monoid hom G → A[G]. |
| `mathlib:MvPolynomial.basisMonomials` | The monomial basis of MvPolynomial σ R. |
| `mathlib:Subgroup.Normal` | Normal subgroups. |
| `mathlib:Submodule` | Submodules. |
| `mathlib:Submodule.mkQ` | The quotient map M → M/K. |
| `mathlib:Subring.closure` | The subring generated by a set. |
| `mathlib:TensorProduct.finsuppScalarLeft` | (ι →₀ R) ⊗[R] N ≃ ι →₀ N. |
| `mathlib:TwoSidedIdeal` | Two-sided ideals of a (possibly noncommutative) ring. |
| `mathlib:TwoSidedIdeal.span` | The two-sided ideal generated by a set. |
| `mathlib:ModuleCat.finite_ext` | For a commutative noetherian R and finite R-modules N,M, Ext^i_R(N,M) is finite for every natural i; the Small hypothesis handles universes. |
| `mathlib:DerivedCategory` | The derived category of an abelian category, formed by localization at quasi-isomorphisms; it has its triangulated structure. |
| `mathlib:DerivedCategory.Q` | The localization functor from integer-indexed cochain complexes to the derived category, sending quasi-isomorphisms to isomorphisms. |
| `mathlib:DerivedCategory.Qh` | The localization functor from the homotopy category, factoring the chain localization through homotopy classes. |
| `mathlib:DividedPowerAlgebra` | The existing quotient algebra by Roby’s divided-power relations for any commutative semiring and module; the homogeneous grading and Roby polynomial-law universal property are not yet provided. |
| `mathlib:DividedPowerAlgebra.dp` | The existing universal divided-power symbols dp R n m, satisfying scalar, binomial product and addition relations. |
| `mathlib:exteriorPower.map` | Functorial linear map ∧ⁿM→∧ⁿN induced by f:M→ₗ[R]N, with compatibility against the canonical alternating map; actual namespace exteriorPower, not ExteriorPower. |
| `mathlib:IsAzumaya` | The pinned class already bundles finite projectivity, faithfulness and bijectivity of AlgHom.mulLeftRight; the reduced norm and étale matrix-splitting theorem are missing. |
| `mathlib:RingTheory.Sequence.IsWeaklyRegular` | For a list rs and module M, each rs[i] acts injectively on M modulo the preceding elements; IsRegular additionally requires the final quotient to be nontrivial. Definition read at pin, lines 135–148. |
| `mathlib:IsIdempotentElem.Corner` | For an idempotent e in a nonunital ring R, the existing carrier of eRe with its inherited ring structure and identity e; it does not yet supply the central A-algebra structure or corner determinant. |
| `mathlib:Subsemigroup.mem_corner_iff` | For an idempotent e in a semigroup, r lies in its corner exactly when e*r=r and r*e=r. |

## Sources read


- [CHENEVIER-DET: The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings](https://arxiv.org/abs/0809.0415); arXiv:0809.0415v2 (July 2013), the final version, published in Automorphic Forms and Galois Representations, Vol. 1, LMS Lecture Note Series 414 (2014), 221–285; page numbers are those of the 56-page preprint distributed for the 2011 Durham symposium, which has the same statement numbering and text. Read 2026-09-28 (checkpoint source); passages reread 2026-10-07. Sections: §1.1–1.10 and Lemma 1.12 with its proof (Amitsur's formula (1.4)–(1.5), Newton relations (1.3)), Corollary 1.14 and Theorem 1.15, pp. 6–15; §1.26: Proposition 1.27, Remark 1.28 and Proposition 1.29, p. 20; Lemma 2.2 and its proof, p. 24; The citation of Proposition 1.27 in §3, p. 45. SHA-256: `b13873b906e2011600101b8a627b5dcb92ecf12f3378e56db9f68fe0af3f0a05`.

- [ACC23: Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf); Annals 197 (2023); public author PDF with journal pagination. Read 2026-10-07. Sections: §1.2; §2.2.4, Lemma 2.2.4 and proof. SHA-256: `c5429e4f384384045dbb48502d71547bb21699783c0f77cce27b24e742467f02`.

- [BP26: Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf); Author PDF built 5 November 2025; Inventiones 244 (2026), 45–141. Read 2026-10-07. Sections: §2.4, pp.18–19. SHA-256: `af70d084612b1b75761694923ef2395752d23b41e0b8b458910d096df4c8c3c6`.

- [BN93: Homotopy limits in triangulated categories](https://www.numdam.org/item/CM_1993__86_2_209_0.pdf); Compositio 86 (1993), 209–234; Numdam version of record. Read 2026-10-07. Sections: Proposition 3.2 and its totalization argument, p.221. SHA-256: `e6f876a959a0500a7cbf8b0eb035944c181851bb303ca151d40faa45d48cd759`.

- [BCGP25: Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645v1); arXiv:2502.20645v1. Read 2026-10-07. Sections: §1.8.8; §1.8.27–29; Proposition 5.7.9; Lemma 7.4.8 and Proposition 7.4.10. SHA-256: `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c`.

- [CG18: Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/pdf/1207.4224); arXiv:1207.4224 public version. Read 2026-10-07. Sections: §7.1, Lemmas 7.3–7.4 and pp.72–73. SHA-256: `67896c853258801967270f8927e5bb33c0315989d3a4188d53435a9305993ebb`.

- [CGH20: Bloch–Kato conjectures for automorphic motives](https://arxiv.org/pdf/1907.08694); arXiv:1907.08694. Read 2026-10-07. Sections: §3 opening and Lemma 3.1, pp.4–5. SHA-256: `8389edfec6576b92aea1fd4dbf6c96ccb86b2186a6f244ab46c4abf1c02e2bed`.

- [SCH15: On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf); Annals 182 (2015), public version of record. Read 2026-10-07. Sections: §5.1.8–11; Theorem 5.4.1 and proof; Corollaries 5.4.3–4. SHA-256: `ebac854f47381c19a987b43b59d2c05cad55c3186c4d8cde067a7be0d06cbd16`.

- [DKSW23: The residually indistinguishable case of Ribet’s method for GL₂](https://math.iisc.ac.in/~maheshkakde/rl.pdf); Author manuscript, 21 September 2023. Read 2026-10-07. Sections: Theorems 1.1 and 2.1; entire abstract algebra argument §§2–5, pp.7–47. SHA-256: `5bff54fc876fae984c89bc531353d9ad4ab12911e677f243b10d7dcc44381128`.

- [ROBY63: Lois polynômes et lois formelles en théorie des modules](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf); Ann. Sci. ENS (3) 80 (1963), 213–348; Numdam version of record. Read 2026-10-07. Sections: III §§7–9, Theorem III.3; IV §§1–2, Theorem IV.1 and §5, Proposition IV.5. SHA-256: `1679797ecbd2a655d8d0dfe38ffe28bc8c49b881bf84bb965d018190c331e330`.

- [EM23: Comparison of different definitions of pseudocharacters](https://arxiv.org/pdf/2310.03869); arXiv:2310.03869v2, 17 October 2023. Read 2026-10-07. Sections: §§1–2; Lemmas 2.6–2.7; §3.1; Theorem 4.1 and entire proof. SHA-256: `913a43abfa9b7def92208c32a09942b7b16d54f2076acb092fb635f7f1733c35`.

- [Q23: Deformations of G-valued pseudocharacters](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf); Author PDF retaining arXiv:2310.14886v1 and date 23 October 2023; not a 2026 revision. Read 2026-10-07. Sections: §§2.5–2.6, 3.1–3.4; §3.7; §4.1; §§5.1–5.5. SHA-256: `67eb82118e49df3f7da6c1e211ad9961fc7323fc4d09d0559bcbc2434eead827`.

- [PQ26: On local Galois deformation rings: generalised reductive groups](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2D7C5400C4BA7789C0E1CFF008D12E60/S2050508626100304a.pdf/div-class-title-on-local-galois-deformation-rings-generalised-reductive-groups-div.pdf); Forum of Mathematics, Pi 14 (2026), e15; public publisher PDF. Read 2026-10-07. Sections: §6.1; §7.3–7.4; §8.3, Lemmas 8.8–8.9. SHA-256: `b18abe909131d28524f7a326834e5656d10063039a92f54e627d7cb899350d93`.

- [BC09: Families of Galois representations and Selmer groups](https://arxiv.org/pdf/math/0602340); Astérisque 324 (2009); public arXiv math/0602340 author text. Read 2026-10-07. Sections: §§1.3–1.7, GMA multiplication, reducibility, extension modules and projective covers. SHA-256: `f593756809df6c39ee5cf83b7cce82965cebec55a075bd4c84430203394e1c34`.

- [CN23: On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3); arXiv:2301.10509v3. Read 2026-10-07. Sections: §3.2, including proofs of Lemma 3.2.2 and Proposition 3.2.4. SHA-256: `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3`.

- [WE18: Algebraic families of Galois representations and potentially semi-stable pseudodeformation rings](https://sites.pitt.edu/~caw203/pdfs/algfam.pdf); Pacific Journal of Mathematics 298 (2019), 471–545; public author manuscript. Read 2026-10-07. Sections: §§2.2–2.3; Proposition 3.6 and Theorem 3.7, including proofs. SHA-256: `d005a7591b068835eb6512e3bb7dd27d69adf90580ec7b650f9bed2ff3a0a5ab`.

- [CHT08: Automorphy for some l-adic lifts of automorphic mod l Galois representations](https://www.numdam.org/item/PMIHES_2008__108__1_0.pdf); Publications mathématiques IHÉS 108 (2008), 1–181; Numdam version of record. Read 2026-10-07. Sections: §2.1, Lemmas 2.1.8–2.1.12; proof of Proposition 3.4.4. SHA-256: `9d3b7079440d8cd3167812bb11c25ae4b51ada973b2e98f0928624254a60156c`.

- [GG12: Companion forms for unitary and symplectic groups](https://arxiv.org/pdf/1001.2044); Duke Mathematical Journal 161 (2012), 247–303; arXiv:1001.2044. Read 2026-10-07. Sections: Lemma 7.1.1 and proof. SHA-256: `558d81e45f4828b1df946e93e6c76dcd1147097f2008007c08b1818e3f2426db`.

- [BHKT19: G-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491); Acta Mathematica 223 (2019), 1–111; arXiv:1609.03491. Read 2026-10-07. Sections: §4, including proofs of Theorems 4.5, 4.8 and 4.10. SHA-256: `ec54cf92ce04146c73b48945be2765f675359255d46cc94a0aa35a39229743b9`.

- [BIP23: On local Galois deformation rings](https://arxiv.org/pdf/2110.01638); Forum of Mathematics, Pi 11 (2023), e30; arXiv:2110.01638. Read 2026-10-07. Sections: Lemma 3.1 and its generic-matrix construction. SHA-256: `b48dad0a42d8cacea0a4ae80d5f3a5e89c3a13bf2e03beb8527081422b5853c4`.

- [BUCH64: A generalized Koszul complex. I](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf); Transactions AMS 111 (1964), 183–196; scanned author-linked journal copy. Read 2026-10-07. Sections: §§1–3, pp.184–195, including Theorem 2.9 and Proposition 3.1 proofs; §4 pp.195–196 read for scope only. SHA-256: `f6bb40712c53513f78e14d8091b3aece81eb61dc71e22c0e7624c93beabc7249`.

- [PILLONI20: Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf); Duke Mathematical Journal 169 (2020), 1647–1807; public author manuscript. Read 2026-10-07. Sections: §5.1.3, pp.21–23; §15.2, p.107. SHA-256: `4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58`.

- [GT05: Systèmes de Taylor–Wiles pour GSp₄](https://numdam.org/item/AST_2005__302__177_0.pdf); Astérisque 302 (2005), 177–290; public Numdam journal copy. Read 2026-10-07. Sections: §3 Satake convention and Hecke polynomial computation, pp.193–196. SHA-256: `4ff0f8c76c3c7ba4cc48ad6d536669ef455c04d432c53bade804fd80c0b1f3f7`.

- [CG20: Modularity lifting for non-regular symplectic representations](https://arxiv.org/pdf/1907.08691); Duke Mathematical Journal 169 (2020), 801–896; public author manuscript. Read 2026-10-07. Sections: Definition 6.7 and Theorem 6.13; Appendix A, large-prime completion argument. SHA-256: `39aa93a83c77ce93884db6352e4c63f80e881197f4213dd699cdf7d77cfbb059`.
