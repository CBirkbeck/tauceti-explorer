# Integral Hecke actions, determinants and interpolation

This roadmap builds the integral algebra that connects a Hecke action on cohomology to Galois data over its coefficient ring. The central object is a multiplicative polynomial law of specified degree. Its characteristic coefficients remain meaningful in torsion and over nonreduced rings, where trace data or characteristic-zero points can lose information. The development includes reconstruction, derived Hecke images, normalization of unramified polynomials, interpolation through finite quotients, quantified nilpotent errors, and integral Ribet extension modules.

These interfaces retain the coefficient ring: reconstruction has stated residual hypotheses, Hecke images retain the abstract action, and interpolation has a specified nilpotent error. Ribet theory relates a congruence ideal to the zeroth Fitting ideal of a finite module carrying an extension class, including coincident residual characters and residue characteristic two.

The mathematical assertions below are targets for formalisation; the existing library inputs are distinguished in the prerequisites. Each construction includes its usable API and examples. All new declaration names in API paragraphs have prefix `TauCeti.`. The companion [Suggested.lean](Suggested.lean) proposes signatures and examples; this document fixes the mathematical scope, including hypotheses whose carriers come from another roadmap.

## Scope and shared foundations

This roadmap owns determinant polynomial laws and their particular reconstruction and interpolation theory. It also owns the four Hecke images, their ghost comparison, the explicit GLₙ and GSp₄ polynomial conversions, and the algebraic Ribet construction. It consumes the following developments, without rebuilding their general theories.

| Input and owner | Interface used here |
| --- | --- |
| Mathlib polynomial laws, tensor products, matrices and group algebras | `PolynomialLaw`, `PolynomialLaw.ground`, `PolynomialLaw.id`, `PolynomialLaw.comp`, `Algebra.TensorProduct.instRing`, `Algebra.TensorProduct.rid`, `MonoidAlgebra`, `MonoidAlgebra.of`, `MonoidAlgebra.mapDomainAlgHom`, `Matrix.det`, `Matrix.charpoly`, `Matrix.trace`. Homogeneity, multiplicativity and determinant structure extend this existing law carrier. |
| Mathlib divided powers and exterior algebra | `DividedPowerAlgebra` and `DividedPowerAlgebra.dp` supply the entire divided-power algebra and its generators; define its homogeneous pieces and their internal algebra multiplication here. Use `exteriorPower.map`, existing tensor powers and `SymmetricAlgebra` for the subsequent constructions. |
| Mathlib module and derived categories | `ModuleCat`, `DerivedCategory`, `DerivedCategory.Q`, `DerivedCategory.Qh` and `ModuleCat.finite_ext`. Build finite derived morphism modules by truncation induction. Reuse `ModuleCat.restrictScalars`, `Module.compHom` and `CategoryTheory.Functor.mapExtLinearMap` for GMA extensions with their actual module actions. |
| Mathlib quotient, local and topological algebra | `TwoSidedIdeal`, `TwoSidedIdeal.span`, `Submodule.mkQ`, `IsIdempotentElem.Corner`, `HenselianLocalRing`, `IsDiscreteValuationRing`, `IsFractionRing`, `IsAdicComplete`, `IsAdic`, `Continuous.ext_on`, and `RingTheory.Sequence.IsWeaklyRegular`. A corner has identity e; it is not a unital subalgebra with identity 1. |
| Tau Ceti **SemisimpleAlgebras**, layers 0, 2, 3 and 4 | Jacobson radical unit criteria; Artin–Wedderburn at its artinian hypotheses; density and double centralizers after the appropriate dimension bound; finite-dimensional central-simple splitting over the center. The determinant-specific boundedness and inseparable norm factors are developed here. |
| **SemisimpleAlgebrasPartII:SA2, SA3** | Morita and characteristic-coefficient descent for Azumaya algebras. General faithfully flat or étale matrix splitting and reduced-norm descent extend that same owner, using its shared `SchemeAndStackFoundations:key/scheme-brauer` carrier. Reuse Mathlib `IsAzumaya`. |
| Tau Ceti **ReductiveGroups**, layer 9 | Integral reductive group schemes and the GLₙ/GSp₂ₙ point and coordinate dictionaries. Use the genuine group-scheme carrier, with an invertible alternating form for symplectic similitudes. |
| **LanglandsParameterStacks:LP3** | Invariant coordinate rings O[Hᵐ]^(H⁰), reindexing and multiplication pullbacks, closed-orbit separation, disconnected complete reducibility, finite generation, and free-orbit formal slices. Its integral rational comodule theory must supply derived scheme invariants, induction, good filtrations, tensor closure, universal coefficients and cohomological products. |
| **ReductiveGroupsPartII:RG2.2, RG2.3** | Bounded-action building fixed points and passage, after finite field extension and conjugation, to a hyperspecial integral model. |
| **SmoothRepresentationsOfLocalGroups:SR.4** | Integral spherical double-coset generators and normalized Satake with vol(K)=1, after adjoining an invertible square root of q. Apply its general construction to GLₙ and the two specified GSp₄ representations. |
| Tau Ceti **ClassFieldTheory**, layer 7 | Local Artin reciprocity with an explicit Frobenius normalization and its inverse conversion. |
| Tau Ceti **Chebotarev**, layer 10 | Density of conjugacy classes of unramified Frobenius in every finite quotient of G_{F,S}. |
| **PadicMeasuresIwasawaAlgebras:L1** | Completed group algebras over complete adic coefficients and their completed tensor-product comparison with finite coefficient/group quotients. |
| **VStackSheavesAndLisseCategories:VS2** | Analytic operator localization A[T]→A[T,T⁻¹], comparison with ordinary localization on discrete finite objects, and its needed limit and colimit compatibility. |
| **ArithmeticGaloisDuality:R02.1** | Continuous H¹, cocycles, coboundaries, twists, restrictions and equivariant maps for topological coefficient modules. A finite module means finitely generated over its coefficient ring, and can be infinite as a set. |
| **DerivedDeRhamCohomology:DD.1/koszul-complex** and **DD.1/ordinary-quotient-completion** | The single shared Koszul complex, its regular-sequence augmentation to the ordinary quotient, and bounded finite free tensor/K-flat comparison. The higher-rank Buchsbaum–Rim complexes and their specific regularity arguments are constructed here. |

The applications to locally symmetric spaces, higher coherent cohomology, automorphic congruences, Iwasawa theory and Galois deformation spaces supply their own geometric Hecke comparisons and classical congruence witnesses. This roadmap specifies the exact algebraic inputs those applications must provide. It does not infer them from the existence of characteristic-zero eigenforms.

The library vocabulary in this document is that of Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. A prerequisite to a Tau Ceti roadmap layer refers to that layer's stated development, rather than an assertion that its whole theory is already implemented. A Mathlib prerequisite refers only to the named declaration's scope. In particular, `ModuleCat.finite_ext` needs a noetherian base and two finite modules; it does not assert finite projective dimension. `Module.free_of_flat_of_isLocalRing` also requires finite generation. `IsAzumaya` bundles finite projectivity, faithfulness and the double-sided endomorphism isomorphism, and does not by itself provide a chosen matrix splitting.

## Conventions and construction order

A is a commutative ring; R is an associative unital A-algebra, possibly noncommutative. Modules are unital. A polynomial law is a natural family over **all** commutative coefficient A-algebras S, on S⊗ₐM. Mathlib's `toFun'` takes S in the universe of A and its `toFun` extends the evaluation to larger universes. Equality of determinants, residual factor identities and descent equations always mean equality of these laws, not merely equality on elements of R.

For a degree-d determinant D, use χ_D(x,X)=D_{A[X]}(X−x), and χ_D=∑ᵢ(−1)ⁱΛᵢX^(d−i). The monic convention is X−x. Degree zero is allowed and gives the constant-one law. Separate multiplicativity from the A-linearity of the first coefficient. Trace determines D when d! is a unit; determinant reconstruction over fields works in all characteristics without that assumption. Divided-power multiplication inside a fixed degree is induced by multiplication on R through the tensor law and differs from multiplication in the graded divided-power algebra.

For group determinants, A[G] is Mathlib's `MonoidAlgebra A G`. The dual pulls back along the anti-involution g↦g⁻¹. A twist by a unit character θ multiplies the i-th characteristic coefficient by θ(g)ⁱ. For a monic polynomial P with unit constant term, the monic inverse-root polynomial is X^dP(X⁻¹)/P(0); the coefficient reversal X^dP(X⁻¹) has constant term 1 and need not be monic.

Write ε for the p-adic cyclotomic character. At an unramified place with residue cardinality q, arithmetic Frobenius has ε=q and geometric Frobenius has ε=q⁻¹. They are inverse conjugacy classes. A chosen Artin map must name its convention. Normalize spherical Haar measure by vol(K)=1, write T₀=1 for GLₙ, and take s²=q with s a unit in the Satake coefficient ring. For GSp₄, T₀ denotes the central double coset and is invertible; the full multiplier μ is retained separately from detρ=μ². Tensoring a contragredient with θ gives multiplier μ⁻¹θ².

Complete local rings carry their maximal-ideal-adic topology, unless another specified ideal supplies it. Continuous determinant means continuity of each group characteristic coefficient. Galois interpolation fixes the same finite ramification set S throughout a limit. Fitting ideals are zeroth Fitting ideals; for a finite module a finite list of generators is enough, while its relation module can be infinitely generated. All maximal minors of finite relation selections are then used.

For Ribet modules let α=χψ⁻¹ and use the left action g·m=α(g)m. The cocycle equation is κ(gh)=κ(g)+α(g)κ(h), and the coboundary attached to y is (α(g)−1)y. Local quotient relations use κ(g)−(α(g)−1)y. Keep the quotient constituent's actual vector module and its S_J-action in every Ext statement; the image in ambient Ext consists exactly of extensions restricting from that same quotient.

The order below follows the mathematical dependencies: IHG.0; the polynomial and multiplier part of IHG.3; IHG.1; IHG.2; the residual Galois-type part of IHG.3; IHG.4; IHG.5; IHG.6. Splitting IHG.3 in this way places its full multiplier identity before symplectic descent and field reconstruction before the definition of Galois-type maximal ideals. Targets within each section are ordered by their dependencies. The Uses paragraphs list prerequisites, with transitive inputs supplied through their cited constructions. Links there refer to those earlier constructions or to a named external owner.

## IHG.0 — Polynomial laws, determinants and invariant evaluations

Define the full scalar-extension objects first, then their coefficient, kernel and representability APIs. The determinant language is retained in small characteristic; trace comparisons explicitly carry their invertibility assumptions.

<a id="target1"></a>

**Homogeneous polynomial laws.** For A-modules M and N, an A-polynomial law f : M → N (a family f_S : S ⊗_A M → S ⊗_A N natural in the commutative A-algebra S; Mathlib's PolynomialLaw) is homogeneous of degree n if f_S(s·x) = s^n·f_S(x) for every commutative A-algebra S, s ∈ S and x ∈ S ⊗_A M.

Assumptions: A a commutative ring; S ranges over commutative A-algebras in the universe of A, as in Mathlib's PolynomialLaw, whose extension to all universes is Mathlib's toFun.

API: `PolynomialLaw.isHomogeneousOfDegree_zero`: The zero law is homogeneous of every degree; `PolynomialLaw.IsHomogeneousOfDegree.add`: Closed under addition; `PolynomialLaw.IsHomogeneousOfDegree.comp`: Composition multiplies degrees; `PolynomialLaw.isHomogeneousOfDegree_one_iff`: Degree one iff base change of a linear map.

Tests: The identity law is homogeneous of degree 1. Over 𝔽_p some degree-(p+1) law vanishes on 𝔽_p-points without being zero. The zero law is homogeneous of degree n for all n.

Uses: `PolynomialLaw`, `PolynomialLaw.comp`, `TensorProduct`. Sources: [Chenevier](#ref-chenevier-det), §1.1, pp.6–7.

<a id="target2"></a>

**Multiplicative polynomial laws.** For A-algebras R and B (associative, unital, not necessarily commutative), an A-polynomial law f : R → B is multiplicative if f_S(1) = 1 and f_S(xy) = f_S(x)f_S(y) for every commutative A-algebra S and x, y ∈ S ⊗_A R.

Assumptions: The ring structure on S ⊗_A R is Mathlib's Algebra.TensorProduct ring structure.

API: `PolynomialLaw.isMultiplicative_id`: The identity is multiplicative; `PolynomialLaw.IsMultiplicative.comp`: Multiplicative laws compose; `Determinant.dimOneEquiv`: Multiplicative laws of degree one to A are A-algebra maps.

Tests: The identity law is multiplicative. The matrix determinant law M_d(A) → A is multiplicative. 2 • id is not multiplicative over a ring of characteristic zero.

Uses: `PolynomialLaw`, `PolynomialLaw.id`, `PolynomialLaw.comp`, `Algebra.TensorProduct.instRing`. Sources: [Chenevier](#ref-chenevier-det), §1.1, p. 7.

### Scalar-extension laws and degree one

<a id="target18"></a>

**The polynomial law of a linear map.** For an A-linear ℓ : M → N, the degree-one polynomial law with ℓ_S = S ⊗ ℓ (lTensor) for every commutative A-algebra S.

API: `PolynomialLaw.ofLinearMap`: The law S ⊗ ℓ; `PolynomialLaw.isHomogeneousOfDegree_one_iff`: Degree-one laws are exactly these; `PolynomialLaw.ofLinearMap_ground`: (ofLinearMap ℓ).ground = ℓ.

Tests: ofLinearMap id is PolynomialLaw.id. Its value map is ℓ. ofLinearMap 0 is the zero law.

Uses: [Homogeneous polynomial laws](#target1), `LinearMap.lTensor`. Sources: [Chenevier](#ref-chenevier-det), Example 1.2(i), p. 7.

<a id="target253"></a>

**Degree-one polynomial laws are linear.** For arbitrary A-modules M,N, a polynomial law P:M→N is homogeneous of degree one if and only if it is the scalar-extension law of a unique A-linear map ℓ:M→N. No flatness or finite-generation hypothesis is needed.

Use P(uX+vY) and compare total degree after (X,Y)↦(XT,YT). Its two coefficients give additivity; homogeneity gives scalar linearity. Naturality then identifies every scalar-extension value with the induced linear map, including for torsion modules.

Uses: [The polynomial law of a linear map](#target18). Sources: [Chenevier](#ref-chenevier-det), Example 1.2(i) and footnote 11, p.7.

<a id="target3"></a>

**Determinants (Chenevier).** A d-dimensional A-valued determinant on an A-algebra R is a multiplicative A-polynomial law D : R → A which is homogeneous of degree d (Chenevier §1.5, p.9). When R = A[G] for a group or monoid G, D is a determinant on G.

Assumptions: R any associative unital A-algebra; A commutative. d ≥ 0; for d = 0 the only determinant is the constant 1.

API: `Determinant.eval_mul`: D(xy) = D(x)D(y); `Determinant.eval_one`: D(1) = 1; `Determinant.eval_smul`: D(ax) = a^d D(x); `Determinant.isUnit_eval`: Units go to units.

Tests: eval (ofMatrix id) M = det M. A determinant of dimension 0 is constant 1. Over (ℤ/p)[X] two different p-dimensional determinants have the same trace.

Uses: [Homogeneous polynomial laws](#target1), [Multiplicative polynomial laws](#target2), `PolynomialLaw.ground`. Sources: [Chenevier](#ref-chenevier-det), §1.5, Definition, p. 9.

<a id="target4"></a>

**Characteristic polynomial and trace of a determinant.** For D a d-dimensional determinant on R and x ∈ R, χ(x, t) := D_{A[t]}(t − x) ∈ A[t] = Σ_{i=0}^{d} (−1)^i Λ_i(x) t^{d−i}; it is monic of degree d, Λ_0 = 1, Λ_d = D, and Λ_1 =: Tr is an A-linear map with Tr(1) = d.

Assumptions: A[t] is a commutative A-algebra in the universe of A, so D_{A[t]} is defined.

API: `Determinant.charpoly_monic`: χ(x, t) is monic; `Determinant.charpoly_natDegree`: deg χ = d; `Determinant.charpoly_coeff_zero`: χ(x, 0) = (−1)^d D(x); `Determinant.traceLinear`: Tr as an A-linear map; `Determinant.trace_one`: Tr(1) = d.

Tests: χ(1, t) = (t − 1)^d. For det ∘ ρ it is Matrix.charpoly (ρ x). For det ∘ ρ, Tr = matrix trace.

Uses: [Determinants (Chenevier)](#target3), `Polynomial`, `Algebra.TensorProduct.rid`, `Polynomial.Monic`, [Degree-one polynomial laws are linear](#target253). Sources: [Chenevier](#ref-chenevier-det), §1.10, p. 12; [Chenevier](#ref-chenevier-det), §1.10, (1.3), p. 12.

<a id="target6"></a>

**The determinant of a matrix representation.** For an A-algebra map ρ : R → M_d(A), D := det ∘ ρ (after each scalar extension, det_S ∘ (ρ ⊗ S)) is a d-dimensional determinant with D(x) = det ρ(x), χ(x, t) = charpoly ρ(x) and Tr = tr ∘ ρ; conjugate representations give the same determinant.

Assumptions: ρ an A-algebra homomorphism to the full matrix algebra.

API: `Determinant.eval_ofMatrix`: D(x) = det ρ(x); `Determinant.trace_ofMatrix`: Tr = tr ∘ ρ; `Determinant.charpoly_ofMatrix`: χ(x) = charpoly ρ(x); `Determinant.ofMatrix_conj`: Conjugate representations have the same determinant.

Tests: ofMatrix id on M_d(A) evaluates to det. Its trace is the matrix trace. A block-diagonal representation gives the product determinant.

Uses: [Characteristic polynomial and trace of a determinant](#target4), `Matrix.det`, `Matrix.det_mul`, `Matrix.det_smul`, `Matrix.det_conj`, `RingHom.map_det`, `Matrix.charpoly`, `Matrix.trace`. Sources: [Chenevier](#ref-chenevier-det), §1.5, p. 9.

<a id="target7"></a>

**Direct sums of determinants.** For determinants D_1, D_2 on R of dimensions d_1, d_2, the product D_1·D_2 (pointwise after each scalar extension) is a determinant of dimension d_1 + d_2, with Tr = Tr_1 + Tr_2 and χ = χ_1χ_2.

Assumptions: A commutative, so products of multiplicative laws are multiplicative.

API: `Determinant.eval_mul_det`: (D_1 D_2)(x) = D_1(x) D_2(x); `Determinant.trace_mul_det`: Tr(D_1 D_2) = Tr D_1 + Tr D_2; `Determinant.charpoly_mul_det`: χ(D_1 D_2) = χ(D_1) χ(D_2).

Tests: ofMatrix of a block sum is the product. Traces add. Multiplying by the dimension-0 determinant changes nothing.

Uses: [Characteristic polynomial and trace of a determinant](#target4). Sources: [Chenevier](#ref-chenevier-det), Proof of Lemma 2.2, p. 24.

<a id="target8"></a>

**Restriction of determinants.** For an A-algebra map φ : R′ → R and a d-dimensional determinant D on R, D ∘ φ (composition of polynomial laws with the degree-one law φ) is a d-dimensional determinant on R′. For a subgroup H ≤ G, restriction along A[H] → A[G] is restriction to H.

Assumptions: φ an A-algebra homomorphism.

API: `Determinant.eval_comap`: (D ∘ φ)(x) = D(φ x); `Determinant.comap_id`: Restriction along the identity is D; `Determinant.comap_comp`: Restriction along ψ ∘ φ is restriction along ψ then φ.

Tests: Restriction along the identity. Restriction of det ∘ ρ is det ∘ (ρ ∘ φ). Restriction to a subgroup H ≤ G.

Uses: [Determinants (Chenevier)](#target3), `MonoidAlgebra.mapDomainAlgHom`. Sources: [Chenevier](#ref-chenevier-det), §1.5, p. 9 (determinants on A[G]).

<a id="target9"></a>

**Scalar extension of determinants.** For a commutative A-algebra S and a d-dimensional determinant D on R, D ⊗_A S is an S-valued d-dimensional determinant on S ⊗_A R, with (D ⊗ S)(1 ⊗ x) = D(x) ⊗ 1; this is the identification M^d_A(R, S) ≅ M^d_S(R ⊗_A S, S).

Assumptions: S in the universe of A, as for Mathlib's polynomial laws.

API: `Determinant.eval_baseChange_tmul`: (D ⊗ S)(1 ⊗ x) = image of D(x); `Determinant.charpoly_baseChange_tmul`: χ commutes with base change; `Determinant.trace_baseChange_tmul`: (D ⊗ S)'s trace on 1 ⊗ x is the image of Tr(x).

Tests: Base change to A is D. Base change of det ∘ ρ. Transitivity.

Uses: [Determinants (Chenevier)](#target3), `TensorProduct.AlgebraTensorModule.cancelBaseChange`. Sources: [Chenevier](#ref-chenevier-det), Remark 1.4, p.9; [Chenevier](#ref-chenevier-det), §1.5, p. 9.

<a id="target10"></a>

**One-dimensional determinants are algebra homomorphisms.** The map D ↦ D_A is a bijection between 1-dimensional A-valued determinants on R and A-algebra homomorphisms R → A. For R = A[G], these are the characters G → A^×.

Assumptions: No hypothesis on A.

Uses: [Determinants (Chenevier)](#target3), `AlgHom`, [Degree-one polynomial laws are linear](#target253). Sources: [Chenevier](#ref-chenevier-det), §1.5, p. 9.

<a id="target17"></a>

**Two-dimensional determinants on a group.** For a group G, D ↦ (T, D|_G) is a bijection between 2-dimensional A-valued determinants on G and pairs (T, D) of functions G → A with D : G → A^× a homomorphism, T(1) = 2, T(gh) = T(hg) and D(g)T(g^{-1}h) − T(g)T(h) + T(gh) = 0 for all g, h.

Assumptions: G a group (for monoids, Chenevier's form with f(g, h)).

Uses: [Determinants (Chenevier)](#target3), `MonoidAlgebra`. Sources: [Chenevier](#ref-chenevier-det), Example 1.8 and Lemma 1.9, pp. 10–11.

<a id="target5"></a>

**D(1 + rr′) = D(1 + r′r).** For a d-dimensional determinant D on R and r, r′ ∈ R: D(1 + rr′) = D(1 + r′r).

Uses: [Characteristic polynomial and trace of a determinant](#target4). Sources: [Chenevier](#ref-chenevier-det), Lemma 1.12(i) and its proof, pp. 12–13.

<a id="target11"></a>

**Pseudocharacters.** A d-dimensional A-valued pseudocharacter on R is an A-linear T : R → A with T(1) = d, T(xy) = T(yx), and the pseudocharacter identity Σ_{σ ∈ S_{d+1}} sgn(σ)T^σ(x_1, …, x_{d+1}) = 0 for all x_i ∈ R, where T^σ(x) = ∏ over the cycles (j_1 … j_s) of σ of T(x_{j_1}⋯x_{j_s}), fixed points included.

Assumptions: T central; A arbitrary commutative ring (the definition makes no hypothesis on d!).

API: `cycleProduct`: The product of x along a cycle; `cycleTerm`: T^σ(x); `Determinant.isPseudocharacter_trace`: The trace of a determinant is a pseudocharacter.

Tests: tr on M_d(A) is a d-dimensional pseudocharacter. tr on M_2(ℚ) is not 1-dimensional. id : ℚ → ℚ is a 1-dimensional pseudocharacter.

Uses: `Equiv.Perm.sign`, `Equiv.Perm.SameCycle`, `Function.minimalPeriod`, `LinearMap`. Sources: [Chenevier](#ref-chenevier-det), §1.10, Lemma 1.12(iii) and §1.26, pp. 12, 20.

### Kernels and quotient laws

<a id="target19"></a>

**The kernel of a polynomial law.** For an A-polynomial law P : M → N, Ker(P) ⊆ M is the set of x such that P_S(b ⊗ x + m) = P_S(m) for every commutative A-algebra S, b ∈ S and m ∈ S ⊗_A M. It is an A-submodule; P is faithful if Ker(P) = 0.

Assumptions: M, N arbitrary A-modules.

API: `PolynomialLaw.ker`: The kernel as a submodule; `PolynomialLaw.IsFaithful`: Ker(P) = 0; `PolynomialLaw.exists_factor_iff_le_ker`: P factors through M/K iff K ≤ Ker(P).

Tests: The identity law is faithful. The zero law has kernel everything. On upper-triangular 2 × 2 matrices the determinant is not faithful.

Uses: `PolynomialLaw`, `Submodule`, `TensorProduct`. Sources: [Chenevier](#ref-chenevier-det), §1.17, p. 16.

<a id="target22"></a>

**Kernels are compatible with base change.** For a commutative A-algebra B, the image of Ker(P) ⊗ B in M ⊗ B lies in Ker(P ⊗ B).

Assumptions: B commutative A-algebra.

Uses: [The kernel of a polynomial law](#target19), `TensorProduct.AlgebraTensorModule.cancelBaseChange`. Sources: [Chenevier](#ref-chenevier-det), Lemma 1.18(iii), p. 16.

<a id="target20"></a>

**Laws factor through their kernel.** Ker(P) is the largest submodule K ⊆ M such that P = P̃ ∘ π for a polynomial law P̃ : M/K → N, π the quotient map: P factors through M/K iff K ≤ Ker(P).

Assumptions: K an A-submodule of M.

Uses: [The polynomial law of a linear map](#target18), [Kernels are compatible with base change](#target22), `Submodule.mkQ`. Sources: [Chenevier](#ref-chenevier-det), Lemma 1.18(i), p. 16.

<a id="target21"></a>

**The induced law on M/Ker(P) is faithful.** If P = P̃ ∘ π with π : M → M/Ker(P), then P̃ is faithful.

Uses: [Laws factor through their kernel](#target20). Sources: [Chenevier](#ref-chenevier-det), Lemma 1.18(ii), p. 16.

### Roby algebras and representability

<a id="target106"></a>

**Homogeneous divided-power piece.** For an A-module M and d≥0, Γ^d_A(M) is the A-submodule of Mathlib’s DividedPowerAlgebra A M spanned by products ∏_j γ_(n_j)(m_j) with ∑_j n_j=d. It is a graded piece of the full commutative algebra, not an algebra under its degree-adding multiplication.

API: `DividedPower.degree`: The homogeneous submodule Γ^d_A(M); `DividedPower.gamma`: γ_d(m) belongs to Γ^d_A(M); `DividedPower.degree_map`: An A-linear M→N induces Γ^d_A(M)→Γ^d_A(N), taking γ_d(m) to γ_d(f(m)).

Tests: Γ^0_A(M)≅A, with γ₀(m)=1. Γ^1_A(M)≅M, and γ₁ corresponds to the identity. In the full Γ_Z(Z), γ₁(1)²=2γ₂(1); γ₂(1) is a basis of Γ²_Z(Z), so the divided-power grading cannot be replaced by an ordinary polynomial grading.

Uses: `DividedPowerAlgebra`, `DividedPowerAlgebra.dp`. Sources: [Chenevier](#ref-chenevier-det), §1.2, p.8.

<a id="target107"></a>

**Direct-sum grading of divided powers.** For any commutative ring A and module M, the sum map ⊕_(d≥0)Γ^d_A(M)→Γ_A(M) is an A-linear equivalence, multiplication maps degrees a,b to a+b, and γ_d(m) has degree d.

Give the polynomial generators their weight n and prove each Roby relation is homogeneous. The quotient decomposition must establish directness as well as generation.

Uses: [Homogeneous divided-power piece](#target106). Sources: [Roby](#ref-roby63), III §§1–2, pp.248–250.

<a id="target108"></a>

**Universal homogeneous polynomial law.** For every d≥0 and A-module M construct the homogeneous polynomial law γ^univ_d:M→Γ^d_A(M), whose value at ∑_j s_j⊗m_j after scalar extension is ∑_(∑n_j=d)(∏_j s_j^n_j)⊗∏_j γ_(n_j)(m_j).

API: `DividedPower.universalLaw`: The homogeneous law with ground value m↦γ_d(m); `DividedPower.universalLaw_ground`: The ground evaluation of γ^univ_d at m is γ_d(m); `DividedPower.universalLaw_mixed`: The coefficient of ∏T_j^n_j in γ^univ_d(∑T_jm_j) is ∏γ_(n_j)(m_j).

Tests: The degree-zero law is constant 1 in Γ⁰≅A. Under Γ¹≅M it is Mathlib’s identity polynomial law. The coefficient of UV in γ²(Ux+Vy) is γ₁(x)γ₁(y), with no factor 2 inserted.

Uses: [Direct-sum grading of divided powers](#target107), [Homogeneous polynomial laws](#target1). Sources: [Roby](#ref-roby63), Proposition IV.1 and Theorem IV.1, pp.265–267.

<a id="target109"></a>

**Roby representability.** For all A-modules M,N and d≥0, composition with γ^univ_d is a natural A-linear equivalence Hom_A(Γ^d_A(M),N)≅{homogeneous degree-d A-polynomial laws M→N}. No flatness or projectivity of M is assumed.

Uses: [Universal homogeneous polynomial law](#target108). Sources: [Roby](#ref-roby63), Theorem IV.1 and proof, pp.266–267.

<a id="target110"></a>

**Arbitrary base change of divided powers.** For any commutative A-algebra B and A-module M, the canonical map B⊗_AΓ^d_A(M)→Γ^d_B(B⊗_A M) is a B-linear equivalence for every d, taking 1⊗γ_d(m) to γ_d(1⊗m). Flatness of B is unnecessary.

Uses: [Roby representability](#target109). Sources: [Roby](#ref-roby63), Theorem III.3 and proof, pp.261–262.

<a id="target111"></a>

**Tensor map for homogeneous divided powers.** For A-modules M,N construct the natural A-linear map Γ^d_A(M)⊗_AΓ^d_A(N)→Γ^d_A(M⊗_A N), characterized by the polynomial law (m,n)↦γ_d(m⊗n) separately homogeneous of degree d. Its mixed coefficient formula is required; no assertion that this map is an isomorphism is made.

API: `DividedPower.tensorMap`: The linear map Γ^d(M)⊗Γ^d(N)→Γ^d(M⊗N); `DividedPower.tensorMap_gamma`: γ_d(m)⊗γ_d(n) maps to γ_d(m⊗n); `DividedPower.tensorMap_naturality`: It commutes with Γ^d(f)⊗Γ^d(g) and Γ^d(f⊗g).

Tests: For d=1 the map is the identity on M⊗N under Γ¹≅identity. For d=0 it is A⊗_A A≅A. For d=2, M=N=Z, the basis γ₂(1)⊗γ₂(1) maps to γ₂(1⊗1), with coefficient 1.

Uses: [Arbitrary base change of divided powers](#target110). Sources: [Chenevier](#ref-chenevier-det), §1.2 and the Roby algebra structure, p.8; [Roby](#ref-roby63), IV §11, Proposition IV.9 and proof, pp.284–286.

<a id="target112"></a>

**Roby algebra of multiplicative laws.** For an associative unital A-algebra R, equip Γ^d_A(R) with internal multiplication Γ^d(R)⊗Γ^d(R)→Γ^d(R⊗R)→Γ^d(R), induced by R multiplication, and unit γ_d(1). Then algebra maps Γ^d_A(R)→S are naturally equivalent to multiplicative homogeneous degree-d polynomial laws R→S. This internal algebra can be noncommutative and is distinct from the graded multiplication on Γ_A(R).

API: `DividedPower.internalAlgebra`: The degree-d representing module has the internal associative A-algebra structure; `DividedPower.internal_mul_gamma`: γ_d(x)⋆γ_d(y)=γ_d(xy), with unit γ_d(1); `DividedPower.multiplicativeLawEquiv`: Algebra maps from this internal algebra are multiplicative degree-d laws.

Tests: Γ¹_A(R) with its internal multiplication is R as an A-algebra. For R=Z,d=2, γ₂(1)⋆γ₂(1)=γ₂(1); the full graded product γ₂(1)γ₂(1)=6γ₄(1) is a different operation. For R=A the universal multiplicative law is a↦a^d and its representing algebra is A.

Uses: [Tensor map for homogeneous divided powers](#target111), [Multiplicative polynomial laws](#target2). Sources: [Chenevier](#ref-chenevier-det), §1.2 and footnote 13, p.8.

<a id="target113"></a>

**Determinant coordinate ring.** For d≥1 and any A-algebra R, let Z_A(R,d)=Γ^d_A(R)^ab, the quotient by the two-sided ideal generated by all commutators for the internal multiplication. Its universal law represents determinants with commutative coefficient algebras: Hom_A-alg(Z_A(R,d),B)≅Det_d(B⊗_A R,B).

API: `Determinant.coordinateRing`: The abelianized internal degree-d divided-power algebra; `Determinant.universal`: The universal determinant on Z_A(R,d)⊗_A R; `Determinant.coordinateRingEquiv`: Its A-algebra maps to B correspond naturally to B-valued determinants; `Determinant.coordinateRing_baseChange`: B⊗_AZ_A(R,d)≅Z_B(B⊗_AR,d).

Tests: Z_A(R,1)=R^ab. Z_A(A,d)≅A with universal law a↦a^d. Z_A(A[t],d)≅A[e₁,…,e_d], and the universal characteristic polynomial of t is X^d−e₁X^(d−1)+…+(−1)^d e_d.

Uses: [Roby algebra of multiplicative laws](#target112), [Determinants (Chenevier)](#target3). Sources: [Chenevier](#ref-chenevier-det), Proposition 1.6 and Example 1.7(iv), pp.9–10.

<a id="target114"></a>

**Free divided powers and symmetric tensors.** For any free A-module M, Γ^d_A(M)→(M^(⊗d))^(S_d), γ_d(m)↦m^(⊗d), is an A-linear equivalence; for a free underlying A-algebra R it respects the internal algebra multiplication.

Uses: [Roby algebra of multiplicative laws](#target112). Sources: [Roby](#ref-roby63), Theorem IV.2 and Proposition IV.5, pp.277–278.

<a id="target115"></a>

**Vaccarino universal determinant theorem.** For any set X, the determinant of the generic d×d matrices induces an isomorphism Γ^d_Z(Z{X})^ab≅E_X(d), where E_X(d) is the subring of Z[x_(a,i,j)] generated by all characteristic-polynomial coefficients of words in the generic matrices. In particular the determinant coordinate ring is torsion-free.

Establish the integral generic-matrix invariant presentation, including its generator and relation theorem and the identification with divided-power abelianization. Characteristic-zero invariant generation does not supply the integral relations.

Uses: [Determinant coordinate ring](#target113), [Free divided powers and symmetric tensors](#target114). Sources: [Chenevier](#ref-chenevier-det), Theorem 1.15, pp.14–15; EM23 Theorem 1.12.

### Characteristic coefficients and trace comparisons

<a id="target12"></a>

**Amitsur's formula for determinants.** For a determinant D on R, r_1, …, r_n ∈ R and i ≥ 0: Λ_i(t_1r_1 + ⋯ + t_nr_n) = Σ_{ℓ(w)=i} ε(w)Λ(w) in A[t_1, …, t_n], the sum over the words w of length i in the letters t_jr_j, where for the Lyndon factorisation w = w_1^{l_1}⋯w_q^{l_q} (w_1 > ⋯ > w_q) one sets Λ(w) = Λ_{l_q}(w_q)⋯Λ_{l_1}(w_1) and ε(w) = (−1)^{(Σ l_k) − i} (Chenevier (1.5)).

Assumptions: Words ordered lexicographically from t_1r_1 < ⋯ < t_nr_n.

Construct the noncommutative product expansion using the unique non-increasing Lyndon factorization of words. This word-factorization theorem and its formal-series product identity are part of the proof: they are not supplied by the permutation-cycle API.

Uses: [Characteristic polynomial and trace of a determinant](#target4), `MvPolynomial`, `MvPowerSeries`. Sources: [Chenevier](#ref-chenevier-det), Lemma 1.12(ii) and (1.4)–(1.5), pp. 12–14.

<a id="target116"></a>

**Integral Newton identities.** For d≥1, a determinant D and r∈R, writing p_j=Tr_D(r^j) and Λ₀=1, one has kΛ_k(r)=∑_(j=1)^k(−1)^(j−1)Λ_(k−j)(r)p_j for 1≤k≤d. These identities are integral; recovering Λ_k by division requires k to be a unit.

Uses: [Characteristic polynomial and trace of a determinant](#target4), [Determinant coordinate ring](#target113). Sources: [Chenevier](#ref-chenevier-det), Example 1.11(ii), equation (1.3), p.12.

<a id="target13"></a>

**The trace of a determinant is a pseudocharacter.** For a d-dimensional determinant D on R, Tr = Λ_1 is a d-dimensional pseudocharacter.

Assumptions: No hypothesis on A.

Uses: [Amitsur's formula for determinants](#target12), [D(1 + rr′) = D(1 + r′r)](#target5), [Pseudocharacters](#target11). Sources: [Chenevier](#ref-chenevier-det), Lemma 1.12(iii) and its proof, pp. 12–14.

<a id="target14"></a>

**A determinant is determined by its trace when d! is invertible.** If d! is invertible in A, then D ↦ Tr is injective on d-dimensional A-valued determinants on R.

Assumptions: d! ∈ A^×. Without it the statement fails.

Uses: [Integral Newton identities](#target116). Sources: [Chenevier](#ref-chenevier-det), Proposition 1.27 and its proof, p. 20.

<a id="target15"></a>

**Over ℚ-algebras determinants are pseudocharacters.** If A is a ℚ-algebra, D ↦ Tr is a bijection between d-dimensional A-valued determinants on R and d-dimensional A-valued pseudocharacters on R.

Assumptions: A a ℚ-algebra.

The inverse is the Newton polynomial in the traces of powers. To prove multiplicativity, construct a faithful coefficient extension on which a rational pseudocharacter is a matrix trace (Procesi representation theorem), then descend the matrix determinant identity. Newton coefficients alone give homogeneity but do not prove multiplicativity.

Uses: [A determinant is determined by its trace when d! is invertible](#target14), [Pseudocharacters](#target11). Sources: [Chenevier](#ref-chenevier-det), Proposition 1.27 and its proof, p. 20.

<a id="target16"></a>

**Determinants and pseudocharacters when (2d)! is invertible.** If (2d)! is invertible in A, or d = 2 and 2 is invertible in A, then D ↦ Tr is a bijection between d-dimensional A-valued determinants and d-dimensional A-valued pseudocharacters on R.

Assumptions: (2d)! ∈ A^×, or d = 2 and 2 ∈ A^×.

Establish the integral antisymmetrizer argument in the symmetric-group algebra over ℤ[1/(2d)!], with its splitness and torsion-free quotient, to transfer the rational identity. For degree two use the corresponding S₄ idempotent calculation over ℤ[1/2].

Uses: [A determinant is determined by its trace when d! is invertible](#target14), [Pseudocharacters](#target11), [Two-dimensional determinants on a group](#target17). Sources: [Chenevier](#ref-chenevier-det), Proposition 1.29 and proof, pp.20–22.

<a id="target23"></a>

**The kernel of a determinant.** For a determinant D on R: r ∈ Ker(D) iff D_S(1 + r r′) = 1 for every commutative A-algebra S and r′ ∈ S ⊗ R, iff D_S(1 + r′ r) = 1 for all such S, r′.

Assumptions: D a d-dimensional determinant.

Uses: [The kernel of a polynomial law](#target19), [D(1 + rr′) = D(1 + r′r)](#target5). Sources: [Chenevier](#ref-chenevier-det), Lemma 1.19(i), p. 17.

<a id="target24"></a>

**The kernel of a determinant is a two-sided ideal.** Ker(D) is a two-sided ideal of R, proper if d > 0 and R ≠ 0; it is the largest two-sided ideal K such that D factors through a determinant of R/K.

Assumptions: D a d-dimensional determinant.

API: `Determinant.kerTwoSided`: Ker(D) as a two-sided ideal; `Determinant.mem_kerTwoSided`: Membership agrees with the submodule kernel; `Determinant.kerTwoSided_ne_top`: Proper for d > 0 and R nontrivial.

Tests: For d>0, det on M_d(A) is faithful; the d=0 matrix algebra is the zero ring. In dimension 0 the kernel is everything. On upper-triangular matrices it is the strictly upper-triangular ideal.

Uses: [The kernel of a determinant](#target23), [Laws factor through their kernel](#target20), `TwoSidedIdeal`. Sources: [Chenevier](#ref-chenevier-det), Lemma 1.19(ii), p. 17.

<a id="target25"></a>

**The characteristic polynomial law χ : R → R.** For a determinant D, the degree-d polynomial law χ : R → R, r ↦ r^d − Λ_1(r) r^{d−1} + Λ_2(r) r^{d−2} − ⋯ + (−1)^d Λ_d(r), and its coefficients χ_α(r_1, …, r_n) ∈ R defined by χ(t_1r_1 + ⋯ + t_nr_n) = Σ_α χ_α(r_1, …, r_n) t^α.

Assumptions: Coefficients are extracted through the monomial basis of A[t_1, …, t_n] and (ι →₀ A) ⊗ R ≅ ι →₀ R, since R may be noncommutative.

API: `Determinant.charpolyLaw`: The law χ; `Determinant.chiCoeff`: The coefficients χ_α; `Determinant.isHomogeneousOfDegree_charpolyLaw`: χ is homogeneous of degree d.

Tests: For det on M_d(A), χ is the zero law (Cayley–Hamilton). In dimension one χ(r) = r − D(r). χ(1) = (1 − 1)^d = 0 for d ≥ 1.

Uses: [Characteristic polynomial and trace of a determinant](#target4), `MvPolynomial.basisMonomials`, `TensorProduct.finsuppScalarLeft`, `LinearEquiv.rTensor`. Sources: [Chenevier](#ref-chenevier-det), §1.10, p. 12.

<a id="target26"></a>

**The Cayley–Hamilton identity for determinants.** For a determinant D on R, r, r_1, …, r_n ∈ R and α: D(1 + χ_α(r_1, …, r_n)·r) = 1.

Assumptions: No hypothesis on A.

Uses: [The characteristic polynomial law χ : R → R](#target25), [Amitsur's formula for determinants](#target12), [Vaccarino universal determinant theorem](#target115). Sources: [Chenevier](#ref-chenevier-det), Lemma 1.12(iv) and the paragraph on Vaccarino's theorem, pp. 12–15.

<a id="target27"></a>

**A determinant descends to the subring of its coefficients.** For a determinant D on a monoid G, with values in A, and C ⊆ A the subring generated by the coefficients Λ_i(g) of χ(g, t), g ∈ G: D factors through a unique C-valued determinant on G; in particular every Λ_i(g) lies in C and every D(Σ t_j g_j) has coefficients in C.

Assumptions: G a monoid.

Uses: [Amitsur's formula for determinants](#target12), `Subring.closure`, `MonoidAlgebra.of`. Sources: [Chenevier](#ref-chenevier-det), Corollary 1.14, p. 14.

<a id="target28"></a>

**Continuous determinants.** For a topological group G and a topological ring A, a determinant D on A[G] is continuous if every coefficient map g ↦ Λ_i(g), i ≤ d, is continuous; by Amitsur's formula this is equivalent to Chenevier's definition by continuity of the maps D^{[α]} : G^d → A.

Assumptions: G a topological group, A a topological ring.

API: `Determinant.IsContinuous`: Continuity of every Λ_i; `Determinant.eq_of_eqOn_dense`: Determined on a dense subgroup; `Determinant.isContinuous_iff_exists_openNormal`: For profinite G and discrete A: the kernel is open.

Tests: On a discrete group every determinant is continuous. det ∘ ρ is continuous for continuous ρ. A determinant of dimension one on ℤ_p with values in ℚ_p from a discontinuous character is not continuous.

Uses: [Amitsur's formula for determinants](#target12), `Continuous`, `MonoidAlgebra.of`. Sources: [Chenevier](#ref-chenevier-det), §2.30, p. 37.

<a id="target29"></a>

**Continuous determinants are determined on a dense subgroup.** If A is Hausdorff and H ≤ G is dense, two continuous determinants on G with the same characteristic polynomials on H are equal.

Assumptions: A Hausdorff (T2).

Uses: [Continuous determinants](#target28), `Continuous.ext_on`. Sources: [Chenevier](#ref-chenevier-det), Example 2.31, p. 38.

<a id="target30"></a>

**Continuity is openness of the kernel.** Let G be profinite and A discrete. A determinant D on A[G] is continuous iff its kernel contains J(H) = ker(A[G] → A[G/H]) for some open normal H ≤ G, i.e. g − gh ∈ Ker(D) for all g ∈ G, h ∈ H; then G → (A[G]/Ker(D))^× factors through the finite group G/H.

Assumptions: G profinite, A (and all coefficient algebras) discrete.

Uses: [Continuous determinants](#target28), [The kernel of a determinant is a two-sided ideal](#target24), `Subgroup.Normal`, `IsOpen`. Sources: [Chenevier](#ref-chenevier-det), Lemma 2.33, p. 38.

### Duals, projective modules and reduced norms

<a id="target117"></a>

**Contragredient determinant.** For a group G and determinant D on A[G], define D∨ by precomposition with the A-linear anti-involution ι(g)=g⁻¹. Since coefficients commute, reversal of products still gives a multiplicative polynomial law of the same degree. It agrees with the determinant of the dual representation.

API: `Determinant.dual`: D∨ is the determinant pulled back by group-algebra inversion; `Determinant.dual_involutive`: (D∨)∨=D; `Determinant.dual_charpoly`: For g∈G, P_D∨,g(X)=X^d P_D,g(X⁻¹)/P_D,g(0); `Determinant.dual_ofRepresentation`: Dualizing a finite projective representation and then taking its determinant gives D∨.

Tests: The dual of a unit character χ is χ⁻¹. The trivial d-dimensional representation is fixed by duality. For a diagonal unit pair (a,b), dual characteristic polynomial is X²−(a⁻¹+b⁻¹)X+(ab)⁻¹.

Uses: [The determinant of a matrix representation](#target6). Sources: [Quast](#ref-q23), §3.4, p.17; Chenevier §1.5, p.9.

<a id="target118"></a>

**Determinant of a finite projective representation.** Let V be a finite projective A-module of constant rank d≥1 and ρ:R→End_A(V) an A-algebra map. Since ∧^dV is an invertible A-module, ∧^dρ(r) is multiplication by a unique scalar. This after every scalar extension defines a degree-d multiplicative polynomial law D_ρ:R→A.

Prove the top exterior power is invertible at constant rank, identify its scalar endomorphisms, and glue matrix laws over local trivializations. These localization and descent steps are required even though the free-module determinant is available.

API: `Determinant.ofFiniteProjective`: The determinant law of ρ on a finite projective constant-rank module; `Determinant.ofFiniteProjective_exterior`: The induced top exterior-power endomorphism is scalar multiplication by D_ρ(r); `Determinant.ofFiniteProjective_basis`: For a finite basis, this law equals det of the corresponding matrix representation; `Determinant.ofFiniteProjective_baseChange`: Scalar extension of V and ρ commutes with D_ρ.

Tests: On an invertible rank-one module, scalar a has determinant a. The identity endomorphism has determinant 1. For V=A² and a specified basis, the determinant equals Mathlib’s Matrix.det, including the off-diagonal sign.

Uses: `exteriorPower.map`, [The determinant of a matrix representation](#target6). Sources: [Chenevier](#ref-chenevier-det), §1.5 matrix example and its local finite-projective extension, p.9.

<a id="target119"></a>

**Azumaya reduced-norm determinant.** For an Azumaya A-algebra R of constant rank d², its reduced norm Nrd_R:R→A is the unique degree-d determinant law that becomes Matrix.det under every faithfully flat matrix splitting. Its representing coordinate ring Γ^d_A(R)^ab is canonically A.

Use the matrix-splitting and reduced-norm descent interface of SemisimpleAlgebrasPartII:SA2/SA3. Its general splitting-existence theorem must be provided for this use, rather than assumed from the IsAzumaya predicate.

API: `Determinant.ofAzumaya`: The degree-d reduced-norm determinant; `Determinant.ofAzumaya_split`: Under a matrix splitting it becomes Matrix.det; `Determinant.ofAzumaya_unique`: Every degree-d determinant on R equals the reduced norm.

Tests: For R=M₂(A), the norm is ad−bc. For R=A,d=1, the norm is the identity. For the Hamilton quaternion algebra over R, Nrd(a+bi+cj+dk)=a²+b²+c²+d².

Uses: `IsAzumaya`, [Determinant coordinate ring](#target113), [The determinant of a matrix representation](#target6). Sources: [Chenevier](#ref-chenevier-det), Example 1.7(ii), p.10 and Example 2.5, p.24.

### Generalized reductive invariant evaluations

<a id="target120"></a>

**Compatible invariant-coordinate evaluation.** For the H⁰-invariant coordinate algebras Cₙ=O[Hⁿ]^(H⁰), the group H(A), and a commutative O-algebra A, compatible evaluation is a family Eₙ:Cₙ→Map(H(A)ⁿ,A) of O-algebra maps satisfying Eₘ(C(ζ)f)(h)=Eₙ(f)(h∘ζ) for every coordinate reindexing ζ, and Eₙ₊₂(C(mul)f)(h)=Eₙ₊₁(f)(mergeLast(h)). Evaluation at the actual scheme points has these equations. The supplied coordinate carrier and evaluation must be those of H; the equations are expressible before LP3 supplies the scheme interface.

API: `InvariantEvaluation`: Bundle the evaluation algebra maps with their explicit reindexing and multiplication equations; `InvariantEvaluation.reindex_eq`: Evaluation of a coordinate pullback is evaluation on the reindexed tuple; `InvariantEvaluation.multiply_eq`: Evaluation of the final-product pullback is evaluation on the tuple with its last two entries multiplied; `InvariantEvaluation.IsRegularMatrixInvariant`: Over an algebraically closed field k, each evaluated GL_d invariant is a polynomial in entries and inverse determinants, invariant under simultaneous conjugation. This condition suffices for the GL₂ unipotent orbit-degeneration examples.

Tests: Swapping the two coordinates before evaluating gives the same value as evaluating on the swapped point tuple. For f in the one-coordinate invariant algebra, its multiplication pullback evaluates at (h₁,h₂) as f evaluates at h₁h₂. An algebra-map family with a witnessed failure of a reindexing equation cannot be the evaluation family of any compatible evaluation datum.

Uses: `LanglandsParameterStacks:LP3`, `MvPolynomial`. Sources: [Quast](#ref-q23), Definition 3.1 and the representation evaluation immediately following it, pp.11–12; [BHKT](#ref-bhkt19), Definition 4.1 and Lemma 4.3, pp.13–14.

<a id="target121"></a>

**Generalized reductive pseudocharacter.** Let O be noetherian and H a generalized reductive O-group scheme: affine smooth, H⁰ reductive, and H/H⁰ finite étale. An H-pseudocharacter of Γ with values in a commutative O-algebra A is a family of O-algebra maps Θ_m:O[H^m]^(H⁰)→Map(Γ^m,A), m≥1, compatible with every reindexing of coordinates and with multiplication of the final two coordinates. Conjugation is by H⁰, including when H is disconnected.

Assumptions: For construction from ρ:Γ→H(A), supply compatible invariant-coordinate evaluation E; an arbitrary family of algebra homomorphisms is insufficient.

API: `ReductivePseudocharacter`: The family Θ_m with reindexing and multiplication equations; `ReductivePseudocharacter.ofRepresentation`: For ρ:Γ→H(A) and compatible evaluation E, Θρ,ₙ(f)(γ)=Eₙ(f)(ρ∘γ). The bundled equations and the homomorphism law prove the pseudocharacter axioms; `ReductivePseudocharacter.ext`: Equality is pointwise equality of every Θ_m on every invariant and tuple; `ReductivePseudocharacter.map`: A coefficient map A→B postcomposes every Θ_m; a group map restricts it; a group-scheme map H→H′ pulls back invariants; `ReductivePseudocharacter.ofRepresentation_theta`: For compatible E, the constructor evaluates as Θρ,ₙ(f)(γ)=Eₙ(f)(ρ∘γ).

Tests: For H=G_m, it is a unit character Γ→Aˣ. With compatible E, the trivial representation evaluates f at the identity tuple. Over algebraically closed k with regular simultaneous-conjugation-invariant GL₂ evaluation E, the nontrivial upper-unipotent representation of Z and the trivial rank-two representation have equal pseudocharacters.

Uses: [ReductiveGroups, layer 9][reductivegroups9], [Compatible invariant-coordinate evaluation](#target120). Sources: [Quast](#ref-q23), Definition 3.1, pp.10–11.

<a id="target122"></a>

**Continuous reductive pseudocharacter.** For topological Γ and A, an H-pseudocharacter is continuous if for every m≥1 and every invariant f∈O[H^m]^(H⁰), the function Θ_m(f):Γ^m→A is continuous. Coefficient change at fixed O and base change of the group scheme O→O′ are distinct operations.

Assumptions: The representation constructor uses compatible evaluation E; every map Eₙ(f):H(A)ⁿ→A is continuous for the actual point topology.

API: `ReductivePseudocharacter.IsContinuous`: Every evaluation on invariant coordinates is continuous; `ReductivePseudocharacter.continuous_ofRepresentation`: A continuous ρ induces a continuous pseudocharacter when E is compatible and every invariant evaluation Eₙ(f) is continuous; `ReductivePseudocharacter.continuous_dense_ext`: For Hausdorff A, continuous pseudocharacters agreeing on a dense subgroup are equal.

Tests: Every pseudocharacter on a discrete Γ is continuous. For H=G_m the condition is continuity of the associated unit character. A finite-quotient representation into a discrete finite coefficient ring gives a continuous pseudocharacter on a profinite group.

Uses: [Generalized reductive pseudocharacter](#target121). Sources: [Quast](#ref-q23), Definition 3.1 and Lemma 3.2, pp.11–12.

<a id="target123"></a>

**Kernel of a reductive pseudocharacter.** For an H-pseudocharacter Θ define ker Θ={δ∈Γ:Θ_m(f)(γ₁,…,γ_mδ)=Θ_m(f)(γ₁,…,γ_m) for all m,f and tuples}. This is a normal subgroup. In general ker ρ⊆ker Θ_ρ, with equality for H-completely reducible representations over an algebraically closed field.

Assumptions: Statements involving Θρ use the same compatible evaluation E; equality of kernels uses the actual H⁰-invariants and H-complete reducibility.

API: `ReductivePseudocharacter.kernel`: The normal subgroup defined by all invariant evaluations; `ReductivePseudocharacter.kernel_mem`: Membership is invariance under right multiplication in any coordinate; `ReductivePseudocharacter.quotient`: For normal Δ⊆ker Θ there is a unique descended pseudocharacter on Γ/Δ.

Tests: For the trivial representation and compatible E, ker Θρ=Γ. For H=G_m it is the kernel of the unit character. Over an algebraically closed characteristic-zero field with regular GL₂ invariant evaluation, the upper-unipotent representation of Z is faithful but its pseudocharacter kernel is all of Z.

Uses: [Generalized reductive pseudocharacter](#target121). Sources: [Quast](#ref-q23), Definition 3.10 and Lemmas 3.11–3.12, p.16.

<a id="target124"></a>

**Determinants and GLn excursion pseudocharacters.** For every commutative ring A, group Γ and d≥1, Chenevier determinants on A[Γ] are naturally in bijection with GL_d-valued Lafforgue pseudocharacters. This comparison needs no invertibility of d! and is distinct from comparison with the trace-only pseudocharacter.

Uses: [Generalized reductive pseudocharacter](#target121), [Vaccarino universal determinant theorem](#target115). Sources: [Emerson–Morel](#ref-em23), Theorem 4.1 and proof, pp.13–14.

<a id="target125"></a>

**Base change of invariant coordinate algebras.** For arbitrary noetherian base O and generalized reductive H, flat O→O′ commutes with invariant coordinate algebras. For connected geometrically reductive H over a Dedekind base, EM23 Proposition 2.6(i)(b) proves the stronger arbitrary-base-change statement for O[H^m]^H. Without the stated class of coordinate algebras, invariants need not commute with nonflat coefficient change.

Uses: [Generalized reductive pseudocharacter](#target121). Sources: [Emerson–Morel](#ref-em23), Proposition 2.6 and Lemma 2.7 with proof, pp.9–10.

<a id="target126"></a>

**Pseudocharacters of product targets.** In the complete DVR/generalized reductive setup of PQ26 §8.3, projection induces PC_Γ^(H₁×H₂)(A)≅PC_Γ^H₁(A)×PC_Γ^H₂(A), also for continuous pseudocharacters. The inverse uses O[(H₁×H₂)^m]^((H₁×H₂)⁰)≅O[H₁^m]^(H₁⁰)⊗_OO[H₂^m]^(H₂⁰).

Uses: [Continuous reductive pseudocharacter](#target122). Sources: [Paškūnas–Quast](#ref-pq26), Lemma 8.8 and proof, pp.44–45.

## IHG.3a — Hecke polynomial and multiplier conventions

This algebraic part of IHG.3 precedes reconstruction so its full multiplier identity can be used in symplectic coefficient descent. Satake and reciprocity are imported with the stated normalization; the explicit coefficient comparisons are proved here.

<a id="target50"></a>

**Integral GLn Hecke polynomial.** For n≥1, q∈A and operators T_0,…,T_n in a commutative A-algebra with T_0=1, set P(X)=∑_{i=0}^n(−1)^i q^{i(i−1)/2}T_i X^{n−i}. For an unramified GL_n place the T_i are the characteristic functions of K diag(π repeated i times,1 repeated n−i times)K with vol(K)=1. The polynomial is monic, defined integrally, and its determinant coefficient is q^{n(n−1)/2}T_n.

API: `Spherical.glnPolynomial`: P(X)=∑_{i=0}^n(−1)^i q^{i(i−1)/2}T_i X^{n−i}; `Spherical.glnPolynomial_coeff`: For 0≤i≤n, the coefficient of X^{n−i} is (−1)^i q^{i(i−1)/2}T_i; `Spherical.glnPolynomial_monic`: If T_0=1, P is monic of degree n in a nonzero coefficient ring.

Tests: For n=1 the polynomial is X−T_1. For n=2 it is X²−T_1X+qT_2. A homomorphism A→B transports P coefficient by coefficient, without choosing √q.

Uses: `SmoothRepresentationsOfLocalGroups:SR.4`, [Characteristic polynomial and trace of a determinant](#target4). Sources: [ACC](#ref-acc23), §2.2.5, equation (2.2.6), p.922.

<a id="target51"></a>

**Normalized Satake coefficients for GLn.** Assume q is a unit and a square root s of q is chosen in a coefficient extension. Under S(T_i)=s^{i(n−i)}e_i(z_1,…,z_n), S(P(X))=∏_{j=1}^n(X−s^{n−1}z_j). The equality follows because i(i−1)+i(n−i)=i(n−1). The integral polynomial P is independent of the square-root extension.

Uses: [Integral GLn Hecke polynomial](#target50). Sources: [ACC](#ref-acc23), §2.2.5, equation (2.2.6) and Theorem 2.3.2, pp.921–922, 935.

<a id="target52"></a>

**Determinant coefficient of the GLn parameter.** If a degree-n determinant D has characteristic polynomial P at a specified Frobenius element F_v, then D(F_v)=q_v^{n(n−1)/2}T_{v,n}. With normalized Satake parameters z_j its value is s^{n(n−1)}∏z_j. A global determinant character follows from these values only with continuity and Frobenius-density hypotheses.

Uses: [Integral GLn Hecke polynomial](#target50). Sources: [ACC](#ref-acc23), §2.2.5, equation (2.2.6), p.922.

<a id="target53"></a>

**Characteristic polynomial under a character twist.** For a rank-n determinant D of G, a character θ:G→A× and g∈G, twisting the group algebra by h↦θ(h)h gives χ_{D⊗θ,g}(X)=∑_{i=0}^n(−1)^i θ(g)^iΛ_i(g)X^{n−i}. Thus the determinant character changes by θ^n.

Uses: [Restriction of determinants](#target8). Sources: [ACC](#ref-acc23), §2.2.20–24, pp.932–934.

<a id="target54"></a>

**Normalized reciprocal characteristic polynomial.** For a degree-n determinant and a unit g, write P_g(X)=∑a_iX^{n−i}, a_0=1 and a_n a unit. Then P_{g^{-1}}(X)=a_n^{-1}∑_{i=0}^n a_iX^i. Equivalently it is X^nP_g(X^{-1})/P_g(0). This is the monic polynomial with inverse roots.

Uses: [Characteristic polynomial and trace of a determinant](#target4). Sources: [ACC](#ref-acc23), §2.2.20, p.932.

<a id="target55"></a>

**Arithmetic and geometric Frobenius conversion.** Fix F_v^ar with F_v^geom=(F_v^ar)^{-1}. If P is the characteristic polynomial at F_v^ar, the polynomial at F_v^geom is the normalized reciprocal of P. If a source instead specifies P at geometric Frobenius, its arithmetic polynomial is that reciprocal. ACC23 explicitly uses geometric Frobenius; importing its polynomial requires this convention conversion. Cyclotomic ε has ε(F_v^ar)=q_v and ε(F_v^geom)=q_v^{-1}.

Uses: [Normalized reciprocal characteristic polynomial](#target54), [ClassFieldTheory, layer 7][classfieldtheory7]. Sources: [ACC](#ref-acc23), Notation §1.2, pp.905–906 and §2.2.20.

<a id="target56"></a>

**Inversion of spherical double cosets.** Let ι([KgK])=[Kg^{-1}K]. For GL_n it is an involution of the commutative spherical algebra and ι(P(X))=q^{n(n−1)}P^rec(q^{1−n}X), where P^rec is its monic normalized reciprocal. Thus the corresponding determinant is D∨⊗ε^{1−n} when Frobenius is geometric as in ACC23.

Uses: [Integral GLn Hecke polynomial](#target50), [Normalized reciprocal characteristic polynomial](#target54). Sources: [ACC](#ref-acc23), §2.2.20, p.932.

<a id="target57"></a>

**Rank-one normalization by reciprocity.** For GL_1, K=O_v× and T_1=[KπK], P=X−T_1. An unramified character with θ(F_v^ar)=u has arithmetic polynomial X−u and geometric polynomial X−u^{-1}. Reciprocity sends π to the explicitly chosen Frobenius, so a character evaluated under the opposite Artin convention is inverted.

Uses: [Integral GLn Hecke polynomial](#target50), [Arithmetic and geometric Frobenius conversion](#target55). Sources: [ACC](#ref-acc23), Notation and §2.2.5, equation (2.2.6), pp.905–906, 921–922.

<a id="target58"></a>

**Rank-two classical modular-form normalization.** For the standard arithmetic Galois representation of a normalized eigenform f of weight k and nebentype ω at ℓ∤Np, the polynomial is X²−a_ℓX+ω(ℓ)ℓ^{k−1}. The GL_2 cohomological formula X²−T_1X+ℓT_2 agrees after T_1=a_ℓ and T_2=ω(ℓ)ℓ^{k−2}. Passing to geometric Frobenius takes its normalized reciprocal.

Assumptions: The classical geometric owner supplies its eigenvalues and the stated arithmetic Frobenius characteristic polynomial; this comparison only identifies the two coefficient conventions.

Uses: [Integral GLn Hecke polynomial](#target50), [Arithmetic and geometric Frobenius conversion](#target55). Sources: [ACC](#ref-acc23), §2.2.5, equation (2.2.6), n=2 specialization, pp.921–922.

### Spin, dual-spin and full multiplier

<a id="target59"></a>

**GSp4 spin Hecke polynomial.** For q and commuting T_0,T_1,T_2, define Q(X)=X⁴−T_1X³+(qT_2+(q³+q)T_0)X²−q³T_0T_1X+q⁶T_0². At an unramified GSp4 place these are the double cosets of diag(q,q,q,q), diag(q,q,1,1), diag(q²,q,q,1), respectively, with q replaced in the matrices by the uniformizer.

API: `Spherical.gsp4SpinPolynomial`: The displayed degree-four Q; `Spherical.gsp4SpinPolynomial_constant`: Q(0)=q⁶T_0²; `Spherical.gsp4SpinPolynomial_map`: Every coefficient map transports Q with q,T_0,T_1,T_2.

Tests: For q=T_0=1,T_1=4,T_2=4, Q=(X−1)⁴. The constant term is the square of q³T_0. Its X² coefficient contains (q³+q)T_0, so it is not the GL4 polynomial with the same three symbols.

Uses: [Integral GLn Hecke polynomial](#target50). Sources: [BCGP](#ref-bcgp25), §1.8.27, pp.16–17; [Genestier–Tilouine](#ref-gt05), §3, pp.193–196; [Calegari–Geraghty 2020](#ref-cg20), Definition 6.7, p.838.

<a id="target60"></a>

**Satake interpretation of the spin polynomial.** With the spin identification of the dual GSp4 from BCGP25 §1.8.8, Q(X)=q⁶ det(Xq^{-3/2}−spin(t)), after applying the normalized Satake isomorphism and adjoining √q. Its four roots are q^{3/2} times the spin roots. Its similitude is q³T_0, including the central Hecke character.

Uses: [GSp4 spin Hecke polynomial](#target59). Sources: [BCGP](#ref-bcgp25), §1.8.8 and §1.8.27, pp.9–10, 16–17; [Genestier–Tilouine](#ref-gt05), §3, pp.193–196.

<a id="target61"></a>

**GSp4 dual-spin Hecke polynomial.** Assume q,T_0 are units. Define P(X)=X⁴−T_0^{-1}T_1X³+T_0^{-2}(qT_2+(q³+q)T_0)X²−q³T_0^{-2}T_1X+q⁶T_0^{-2}. It satisfies P(X)=X⁴Q(q³/X)/Q(0). Its roots are q³ divided by the spin-Q roots.

API: `Spherical.gsp4DualSpinPolynomial`: The displayed polynomial P with inverted central operator T_0; `Spherical.gsp4DualSpinPolynomial_reciprocal`: P(X)=X⁴Q(q³/X)/Q(0); `Spherical.gsp4DualSpinPolynomial_constant`: P(0)=q⁶T_0^{-2}.

Tests: For q=T_0=1, P=Q. For roots β_j of Q, P has roots q³β_j^{-1}. If T_0 is not fixed to 1, P and Q have different X³ coefficients, −T_1/T_0 and −T_1.

Uses: [GSp4 spin Hecke polynomial](#target59), [Normalized reciprocal characteristic polynomial](#target54). Sources: [BCGP](#ref-bcgp25), Equation (1.8.27) and Lemma 1.8.28, p.17.

<a id="target62"></a>

**Geometric-Frobenius dual-spin conversion.** For BCGP25 geometric Frobenius F_ℓ, if det(X−ρ(F_ℓ))=Q_ℓ(X), then det(X−(ρ∨⊗ε^{-3})(F_ℓ))=P_ℓ(X), because ε(F_ℓ)=ℓ^{-1}. Arithmetic Frobenius values require the normalized reciprocals of these polynomials. This conversion applies to a determinant whenever duality and the twist are defined.

Uses: [GSp4 dual-spin Hecke polynomial](#target61), [Characteristic polynomial under a character twist](#target53), [Arithmetic and geometric Frobenius conversion](#target55), [Contragredient determinant](#target117). Sources: [BCGP](#ref-bcgp25), Lemma 1.8.28, p.17.

<a id="target63"></a>

**Full similitude character under duality and twist.** If ρ:G→GSp4(A) has similitude μ:G→A×, then ρ∨⊗θ has similitude μ^{-1}θ². In particular the cohomological dual-spin representation ρ∨⊗ε^{-3} has μ^{-1}ε^{-6}. At BCGP25 geometric Frobenius these values are q³T_0 for ρ and q³T_0^{-1} for the converted representation. The determinant μ² does not determine μ, especially at residue characteristic two.

Uses: [Geometric-Frobenius dual-spin conversion](#target62), [ReductiveGroups, layer 9][reductivegroups9]. Sources: [BCGP](#ref-bcgp25), §1.8.7–8 and Lemma 1.8.28, pp.9–10, 16–17.

<a id="target250"></a>

**Reversed spin Hecke polynomial.** With Q the monic spin polynomial above, define Q_rev(X)=X⁴Q(X⁻¹)=1−T₁X+(qT₂+(q³+q)T₀)X²−q³T₀T₁X³+q⁶T₀²X⁴. Pilloni’s indexing is T_(ℓ,2)=T₁, T_(ℓ,1)=T₂, T_(ℓ,0)=T₀. This polynomial has constant term 1 and corresponds to det(1−Xr); it is distinct from the monic inverse-root polynomial.

API: `Spherical.gsp4ReversedSpinPolynomial`: The constant-one polynomial displayed above; `Spherical.gsp4ReversedSpinPolynomial_constant`: Its constant coefficient is 1; `Spherical.gsp4ReversedSpinPolynomial_det`: For charpoly(r)=Q, det(1−Xr)=Q_rev.

Tests: The coefficient of X⁰ is 1 and of X⁴ is q⁶T₀². Pilloni’s T_(ℓ,2) is the coefficient paired with X¹, matching CG20’s T₁. For q=2,T₀=1, the leading coefficient is 64; Q_rev is not the monic characteristic polynomial of r⁻¹.

Uses: [GSp4 spin Hecke polynomial](#target59), [Normalized reciprocal characteristic polynomial](#target54). Sources: [Pilloni](#ref-pilloni20), §5.1.3 pp.21–23; §15.2 p.107.

## IHG.1 — Cayley–Hamilton algebras and reconstruction

Construct the characteristic-coefficient quotient, establish its field structure, and lift its split residual constituents henselianly. Then build generalized matrix algebras with labelled constituents, their reducibility and Ext interfaces, and continuity and coefficient descent. The final branch reconstructs generalized reductive pseudocharacters.

<a id="target31"></a>

**The Cayley–Hamilton ideal.** For a determinant D on R, CH(D) ⊆ R is the two-sided ideal generated by all χ_α(r_1, …, r_n) (n ≥ 1, r_i ∈ R), the coefficients of χ(t_1r_1 + ⋯ + t_nr_n) ∈ R[t_1, …, t_n].

Assumptions: D a determinant.

API: `Determinant.chIdeal`: CH(D); `Determinant.chIdeal_le_kerTwoSided`: CH(D) ⊆ Ker(D); `Determinant.chiCoeff_mem_chIdeal`: Each χ_α(r_1, …, r_n) lies in CH(D).

Tests: CH(det) = 0 on M_d(A). CH = 0 on upper-triangular matrices. In dimension one CH(D) is generated by the r − D(r).

Uses: [The characteristic polynomial law χ : R → R](#target25), `TwoSidedIdeal.span`. Sources: [Chenevier](#ref-chenevier-det), §1.17, p. 17.

<a id="target32"></a>

**Cayley–Hamilton algebras.** A determinant D on R is Cayley–Hamilton if CH(D) = 0, equivalently if the law χ : R → R vanishes identically; (R, D) is then a Cayley–Hamilton A-algebra of degree d.

Assumptions: D a determinant.

API: `Determinant.IsCayleyHamilton`: CH(D) = 0; `Determinant.isCayleyHamilton_iff`: iff χ = 0 as a law; `Determinant.IsCayleyHamilton.baseChange`: Stable under base change.

Tests: (M_d(A), det) is Cayley–Hamilton. Upper-triangular matrices: Cayley–Hamilton, not faithful. A faithful determinant is Cayley–Hamilton.

Uses: [The Cayley–Hamilton ideal](#target31). Sources: [Chenevier](#ref-chenevier-det), §1.17, p. 17.

<a id="target33"></a>

**Cayley–Hamilton is stable under base change.** If D is Cayley–Hamilton, so is D ⊗_A S for every commutative A-algebra S.

Assumptions: S commutative A-algebra.

Uses: [Cayley–Hamilton algebras](#target32), [Scalar extension of determinants](#target9). Sources: [Chenevier](#ref-chenevier-det), §1.17, p. 17.

<a id="target34"></a>

**Cayley–Hamilton restricts to subalgebras.** If D is Cayley–Hamilton on R and φ : R′ → R is an injective A-algebra map, then D ∘ φ is Cayley–Hamilton on R′.

Assumptions: φ injective.

Uses: [Cayley–Hamilton algebras](#target32), [Restriction of determinants](#target8). Sources: [Chenevier](#ref-chenevier-det), Example 1.20(ii), p. 18.

<a id="target35"></a>

**The kernel contains the Cayley–Hamilton ideal.** CH(D) ⊆ Ker(D) for every determinant D.

Assumptions: No hypothesis on A.

Uses: [The kernel of a determinant is a two-sided ideal](#target24), [The Cayley–Hamilton identity for determinants](#target26), [The Cayley–Hamilton ideal](#target31). Sources: [Chenevier](#ref-chenevier-det), Lemma 1.21, p. 18.

<a id="target36"></a>

**Faithful determinants are Cayley–Hamilton.** If D is faithful, then (R, D) is a Cayley–Hamilton algebra. In particular the faithful quotient R/Ker(D) of any determinant is Cayley–Hamilton.

Assumptions: D faithful.

Uses: [The kernel contains the Cayley–Hamilton ideal](#target35), [The induced law on M/Ker(P) is faithful](#target21), [Cayley–Hamilton algebras](#target32). Sources: [Chenevier](#ref-chenevier-det), Lemma 1.21, p. 18.

### Field structure and semisimple reconstruction

<a id="target127"></a>

**Determinants on product algebras.** For a nonzero commutative A with connected spectrum and A-algebras R₁,R₂, every dimension-d determinant on R₁×R₂ is uniquely a product D₁D₂, with dimensions d₁+d₂=d. Without connectedness, the dimensions are locally constant on Spec(A).

Uses: [Roby algebra of multiplicative laws](#target112). Sources: [Chenevier](#ref-chenevier-det), Lemma 2.2(iii), pp.23–24.

<a id="target128"></a>

**Corner determinant.** For D:R→A with A nonzero and connected and e²=e in R, define D_e:eRe→A by D_e(x)=D(x+1−e), naturally after every scalar extension. Its degree r(e) is the degree of D(1−e+te); r(e)+r(1−e)=d.

API: `Determinant.corner`: D_e on the corner algebra with unit e; `Determinant.corner_rank`: D(1−e+te)=t^{r(e)}; `Determinant.corner_complement`: The restriction to the two diagonal corners is D_eD_(1−e).

Tests: For the usual determinant on M₃(A) and e=diag(1,1,0), D_e is the 2×2 determinant. For e=0 the corner determinant has degree zero and constant value one. Over F₂, a rank-two projection has trace zero but corner degree two.

Uses: [Determinants on product algebras](#target127), [Determinants (Chenevier)](#target3), `IsIdempotentElem.Corner`, `Subsemigroup.mem_corner_iff`. Sources: [Chenevier](#ref-chenevier-det), Lemma 2.4(1–2), p.25.

<a id="target129"></a>

**Cayley–Hamilton corner restriction.** If D is Cayley–Hamilton, D_e is Cayley–Hamilton. If D is faithful, D_e is faithful. Corner formation commutes with arbitrary scalar extension because eRe is a direct summand of R.

Uses: [Corner determinant](#target128), [Cayley–Hamilton algebras](#target32), [D(1 + rr′) = D(1 + r′r)](#target5). Sources: [Chenevier](#ref-chenevier-det), Lemma 2.4(3), p.25.

<a id="target130"></a>

**Bound on orthogonal nonzero corners.** For a dimension-d Cayley–Hamilton determinant over nonzero connected A, every nonzero idempotent e has r(e)>0. A family of nonzero orthogonal idempotents has length at most d; its corner ranks sum to d iff its sum is one.

Uses: [Cayley–Hamilton corner restriction](#target129). Sources: [Chenevier](#ref-chenevier-det), Lemma 2.4(4), pp.25–26.

<a id="target131"></a>

**Cayley–Hamilton unit criterion.** For a Cayley–Hamilton determinant D:R→A and x∈R, x is a unit iff D(x) is a unit in A.

Uses: [Cayley–Hamilton algebras](#target32). Sources: [Chenevier](#ref-chenevier-det), Proof of Lemma 2.7(i), p.27.

<a id="target132"></a>

**Nilpotent ideals vanish under field determinants.** For a field k, any determinant D:R→k and two-sided J⊂R with J^s=0 satisfy J⊂ker(D); D need not be Cayley–Hamilton.

Uses: [The kernel of a determinant is a two-sided ideal](#target24). Sources: [Chenevier](#ref-chenevier-det), Lemma 2.7(v), p.27.

<a id="target133"></a>

**Separable algebraic base change of the determinant kernel.** For a separable algebraic field extension K/k and D:R→k, ker(D_K)=K⊗ker(D). Purely inseparable extension is excluded.

Descend the invariant kernel subspace through finite Galois extensions and then through the directed union of finite separable extensions. Purely inseparable coefficient changes have a separate norm-power behavior and do not give this equality.

Uses: [The kernel of a determinant is a two-sided ideal](#target24). Sources: [Chenevier](#ref-chenevier-det), Lemma 2.8(i) and Example 2.9, pp.27–28.

<a id="target134"></a>

**Field Cayley–Hamilton radical and kernel.** For a Cayley–Hamilton determinant D:R→k over a field, ker(D)=Rad(R), and every element of this ideal satisfies x^d=0. This gives a nil ideal, without a uniform ideal-power bound in small characteristic.

Uses: [Cayley–Hamilton unit criterion](#target131), [Separable algebraic base change of the determinant kernel](#target133), [SemisimpleAlgebras, layer 0][semisimplealgebras0]. Sources: [Chenevier](#ref-chenevier-det), Lemma 2.8(ii), pp.27–28.

<a id="target135"></a>

**Bounded algebraicity bounds simple-module dimension.** Let R be a k-algebra whose elements have algebraic degree <n. For every simple R-module V with division endomorphism ring E, dim_E V is finite and <n; the action R→End_E(V) is surjective.

Uses: [SemisimpleAlgebras, layer 3][semisimplealgebras3]. Sources: [Chenevier](#ref-chenevier-det), Proof of Lemma 2.14, pp.29–30.

<a id="target136"></a>

**Finiteness of simple factors.** If R has zero radical, is algebraic with a uniform degree bound and has a uniform bound on orthogonal nonzero idempotents, it has finitely many simple-module isomorphism classes and is their finite product of full endomorphism algebras.

Uses: [Bounded algebraicity bounds simple-module dimension](#target135), [SemisimpleAlgebras, layer 0][semisimplealgebras0], [SemisimpleAlgebras, layer 2][semisimplealgebras2], [Bound on orthogonal nonzero corners](#target130). Sources: [Chenevier](#ref-chenevier-det), Proof of Lemma 2.14, p.30.

<a id="target137"></a>

**Centers of bounded algebraic semisimple factors.** Under Lemma 2.14 hypotheses over k and k^sep, the division factors are finite over their centers. Their center extensions have finite separable part and purely inseparable exponent bounded by the largest p-power below n. Finite dimension over k follows if k is perfect, [k:k^p]<∞, or p>n.

Keep finite dimension over a factor center separate from finite dimension over the original field. Establish the separable-center alternatives and the inseparable exponent in the norm classification.

Uses: [Finiteness of simple factors](#target136), [SemisimpleAlgebras, layer 4][semisimplealgebras4]. Sources: [Chenevier](#ref-chenevier-det), Lemma 2.14, pp.29–30.

<a id="target138"></a>

**Determinants on split simple factors.** Over algebraically closed k, a faithful dimension-d determinant identifies its algebra with ∏_iM_{n_i}(k) and is ∏_idet_i^{m_i}, with positive m_i and ∑_in_im_i=d.

Uses: [The induced law on M/Ker(P) is faithful](#target21), [Field Cayley–Hamilton radical and kernel](#target134), [Centers of bounded algebraic semisimple factors](#target137), [Azumaya reduced-norm determinant](#target119). Sources: [Chenevier](#ref-chenevier-det), Proof of Theorem 2.12, pp.30–31.

<a id="target139"></a>

**Semisimple reconstruction of field determinants.** Let k be algebraically closed, R any k-algebra and d≥1. Every dimension-d determinant D:R→k is det∘ρ for a semisimple representation ρ:R→M_d(k), unique up to conjugacy, with kerρ=kerD. No factorial assumption is required.

Uses: [Determinants on split simple factors](#target138). Sources: [Chenevier](#ref-chenevier-det), Theorem 2.12, pp.28–31.

<a id="target140"></a>

**Faithful quotients over arbitrary fields.** For any field k and dimension-d determinant, R/kerD is a finite product of matrix algebras over division rings finite over their centers, with determinant a product of reduced norms and bounded inseparable norm laws. It is finite over k under the three conditions of bounded-centers, and can fail to be finite over an arbitrary imperfect k.

Uses: [Semisimple reconstruction of field determinants](#target139). Sources: [Chenevier](#ref-chenevier-det), Theorem 2.16, pp.31–32.

<a id="target141"></a>

**Residual determinant properties.** For D:R→A with A local and residue field k, its residual determinant is D̄:R/mR→k. It is split when its faithful quotient (R/mR)/ker(D̄) is a finite product of full matrix algebras over k; absolutely irreducible if its reconstructed representation over k̄ is irreducible; multiplicity-free if that representation has pairwise inequivalent irreducible constituents of multiplicity one. Splitness and absolute irreducibility are separate conditions. Existence of any k-representation realizing D̄ is weaker than splitness.

API: `Determinant.residual`: Scalar extension to A/m; `Determinant.IsSplit`: The faithful quotient is a finite product of full matrix algebras over k, expressed by a surjective map with kernel ker D; mere k-linear realizability is insufficient; `Determinant.IsAbsolutelyIrreducible`: Positive-dimensional irreducibility after algebraically closed coefficient extensions, independently of splitness over the base field; `Determinant.IsMultiplicityFree`: Every simple constituent occurs once after algebraic closure.

Tests: A one-dimensional character determinant is split and absolutely irreducible. χ² is split but not multiplicity-free, including in characteristic two. χψ for two distinct k-valued characters is split multiplicity-free and reducible. The degree-two Hamilton quaternion reduced norm over ℝ is absolutely irreducible after algebraic closure and is not split over ℝ. The norm ℂ→ℝ is realized by the real regular two-dimensional representation and is geometrically multiplicity-free, but its faithful quotient ℂ is not a product of full matrix algebras over ℝ, so it is not split.

Uses: [Scalar extension of determinants](#target9), [Semisimple reconstruction of field determinants](#target139). Sources: [Chenevier](#ref-chenevier-det), Definition-Proposition 2.18 and Definition 2.19, pp.32–33; corrected splitness equivalence (E17).

### Henselian lifting and generalized matrix algebras

<a id="target142"></a>

**Radical of a local Cayley–Hamilton algebra.** For D:R→A Cayley–Hamilton with A local, Rad(R) is the inverse image of kerD̄ under R→R/mR.

Uses: [Residual determinant properties](#target141). Sources: [Chenevier](#ref-chenevier-det), Lemma 2.10(i), p.28.

<a id="target143"></a>

**Henselian lifting of matrix units.** Let A be henselian local and R integral over A, with R/Rad(R)≅∏_iM_{d_i}(k). A complete orthogonal family of diagonal idempotents and matrix units in each block lifts to R, with the corresponding multiplicative relations.

Prove simultaneous orthogonal idempotent and matrix-unit lifting in an integral algebra over a henselian local ring. The algebra need not be finite as an A-module, so a finite-algebra lifting theorem alone is insufficient.

Uses: [Radical of a local Cayley–Hamilton algebra](#target142). Sources: [Chenevier](#ref-chenevier-det), Proof of Theorem 2.22, p.34.

<a id="target144"></a>

**Rank-one Cayley–Hamilton algebras.** A degree-one Cayley–Hamilton determinant D:R→A makes algebraMap A R an isomorphism with inverse D; every element x equals D(x)·1.

Uses: [Cayley–Hamilton algebras](#target32), [One-dimensional determinants are algebra homomorphisms](#target10). Sources: [Chenevier](#ref-chenevier-det), Lemma 2.6, p.26.

<a id="target145"></a>

**Reconstruction from rank-one corners.** If R has a complete d×d matrix-unit system E_ij and E_iiRE_ii=AE_ii with faithful scalar map, the map M_d(A)→R, (a_ij)↦∑a_ijE_ij is an A-algebra isomorphism.

Uses: [Henselian lifting of matrix units](#target143), [Rank-one Cayley–Hamilton algebras](#target144). Sources: [Chenevier](#ref-chenevier-det), Proof of Theorem 2.22(i), p.34.

<a id="target146"></a>

**Henselian irreducible reconstruction.** For a dimension-d Cayley–Hamilton D:R→A over henselian local A, if D̄ is split and absolutely irreducible then R≅M_d(A) and D is the matrix determinant. Applying this to R=A[G]/CH(D) reconstructs an actual G→GL_d(A). Without residual splitness a central-simple obstruction remains.

Uses: [Reconstruction from rank-one corners](#target145). Sources: [Chenevier](#ref-chenevier-det), Theorem 2.22(i), p.34.

<a id="target147"></a>

**Generalized matrix algebra.** A GMA of block sizes (d_i) over A is an A-algebra R with orthogonal idempotents e_i summing to one, isomorphisms e_iRe_i≅M_{d_i}(A), and a cyclic A-linear trace equal to the usual matrix trace on each diagonal block. Primitive matrix units identify off-diagonal blocks with M_{d_i,d_j}(A_ij); multiplication comes from associative pairings A_ij⊗A_jk→A_ik.

API: `GMA.Data`: Idempotents, corner matrix algebra isomorphisms and cyclic trace; `GMA.peirce`: R≅⊕_(i,j)e_iRe_j as A-modules; `GMA.entryModule`: A_ij=E_i,11 R E_j,11; `GMA.pairing_assoc`: The off-diagonal multiplication pairings are associative.

Tests: For R=M_d(A) partitioned into blocks, every A_ij=A. For upper triangular 2×2 matrices, A_12=A and A_21=0. For R=[[A,J],[A,A]] with a nonprincipal ideal J, A_12=J need not be free.

Uses: [The trace of a determinant is a pseudocharacter](#target13). Sources: [Bellaïche–Chenevier](#ref-bc09), Definition 1.3.1 and Lemma 1.3.2, pp.20–21.

<a id="target149"></a>

**Adapted GMA representation ring.** For a GMA with entry modules A_ij, the functor of representations that are the prescribed standard representations on diagonal blocks is represented by Sym_A(⊕_{i≠j}A_ij) modulo the relations xy−φ_ijk(x,y). The universal map R→M_d(B_ad) is universally injective as an A-module map.

Construct an A-linear splitting of the universal adapted representation, compatible with coefficient extension. Merely imposing the pairing relations in a symmetric-algebra quotient does not prove injectivity.

API: `GMA.adaptedRing`: The symmetric-algebra quotient by pairing relations; `GMA.adaptedRing_equiv`: A-algebra maps from B_ad to B correspond to adapted representations; `GMA.universalAdapted`: The universally injective adapted representation R→M_d(B_ad).

Tests: For one block M_d(A), B_ad=A. For the full 2×2 matrix algebra, B_ad=A[b,c]/(bc−1), with off-diagonal entries b,c. For upper triangular 2×2 matrices, B_ad=A[b] and the universal upper entry is b.

Uses: [Generalized matrix algebra](#target147). Sources: [Wang–Erickson](#ref-we18), §2.3, pp.15–16; BC09 Propositions 1.3.9 and 1.3.13.

<a id="target150"></a>

**Canonical GMA determinant.** A dimension-d GMA has a canonical Cayley–Hamilton determinant D_E:R→A, given by the signed cycle product of its scalar corner pairings. It has the prescribed cyclic trace and agrees after any scalar extension with the determinant of the universal adapted representation. No factorial is inverted.

API: `GMA.determinant`: The signed cycle-product homogeneous law; `GMA.trace_determinant`: The determinant trace is the given GMA trace; `GMA.determinant_adapted`: Every adapted representation realizes D_E.

Tests: For [[a,b],[c,d]] with scalar blocks, D_E=ad−φ(b,c). For triangular matrices it is the product of diagonal determinants. Over F₂ the determinant still detects a repeated scalar character although its trace is zero.

Uses: [Adapted GMA representation ring](#target149), [The determinant of a matrix representation](#target6). Sources: [Wang–Erickson](#ref-we18), Proposition 2.23 and proof, pp.16–17.

<a id="target151"></a>

**Ordered residual GMA constituents.** For henselian local A with residue field k and chosen GMA data E on S with block sizes nᵢ, the residual dictionary consists of the actual algebra representations ρ̄ᵢ:k⊗ₐS→M_nᵢ(k). Their determinants are absolutely irreducible, the vector modules are pairwise nonisomorphic, ρ̄ᵢ(eⱼ)=δᵢⱼ, the diagonal matrix identifications reduce to ρ̄ᵢ on eᵢSeᵢ, and the residual GMA determinant equals the product of these determinants as a law after every commutative k-algebra extension. For J⊆mₐ, reduce a factor over A/J through the canonical coefficient map A/J→k and the canonical tensor reassociation k⊗_(A/J)((A/J)⊗ₐS)≅k⊗ₐS.

API: `GMA.ResidualData`: The ordered residual representations, absolute irreducibility, nonisomorphism, projector equations, diagonal compatibility and full-law product; `GMA.quotientResidue`: For J⊆mₐ, the coefficient algebra map A/J→k induced by A→k; `GMA.quotientResidualTransport`: The k-algebra tensor reassociation k⊗_(A/J)((A/J)⊗ₐS)≅k⊗ₐS, for associative S; `GMA.residualFactor`: Reduce an entire determinant over A/J to k⊗ₐS using the canonical reassociation.

Tests: On the i-th residual constituent, eᵢ has characteristic polynomial (X−1)^nᵢ and eⱼ, j≠i, has characteristic polynomial X^nᵢ. For S the upper triangular algebra over a field and x=[[a,b],[0,c]], the ordered residual characters evaluate at a and c and their determinant product evaluates at ac. Two labelled isomorphic residual modules cannot be residual dictionary data, even if the determinant product has the requested total degree.

Uses: [Canonical GMA determinant](#target150), [Residual determinant properties](#target141). Sources: [Allen–Newton–Thorne](#ref-ant20), Theorem 2.4, Proposition 2.5 and proof, pp.5–6; [Bellaïche–Chenevier](#ref-bc09), §1.4.1 and Lemma 1.4.3, pp.24–27.

<a id="target148"></a>

**Multiplicity-free henselian GMA structure.** For a Cayley–Hamilton D over henselian local A with split multiplicity-free D̄, its algebra and trace admit a GMA decomposition with block sizes the residual constituent dimensions. This does not make off-diagonal modules free or yield a d-dimensional free representation over A.

Uses: [Henselian irreducible reconstruction](#target146), [Ordered residual GMA constituents](#target151). Sources: [Chenevier](#ref-chenevier-det), Theorem 2.22(ii), p.34.

### Reducibility ideals and quotient extensions

<a id="target153"></a>

**Partition reducibility for determinants.** For henselian local A, a determinant D with split multiplicity-free residual law ∏det ρ̄ᵢ and a partition P of these labelled constituents into nonempty parts, there is a canonical ideal I_P. For each J⊆mₐ, I_P⊆J iff a unique family of full determinant factors F_m of degrees ∑_(i∈P_m)nᵢ satisfies D mod J=∏F_m and F_m mod mₐ=∏_(i∈P_m)det ρ̄ᵢ. The kernel of D mod J lies in every factor kernel. For any quotient R→S with CH(D)⊆ker(R→S)⊆ker D and adapted residual GMA data E, I_P is the sum of opposite primitive-entry pairing ideals between different parts; it is independent of the quotient and adapted data. If d! is invertible, taking traces recovers BC09 Proposition 1.5.1.

Assumptions: A henselian local; D̄ split multiplicity-free; partition parts nonempty and labelled; J⊆mₐ. The trace corollary alone requires d! invertible.

Compare adapted data by inner conjugacy, reduce to the zero pairing ideal, and use the determinant kernel criterion to kill cross-part entries. The faithful quotient then decomposes into part corners. Conversely residual degree zero puts each other-part idempotent in the factor kernel. This proves uniqueness and factor-kernel containment without replacing full laws by traces.

API: `GMA.partitionReducibilityIdeal`: The sum of opposite primitive-entry pairing ideals over pairs in different partition parts; `GMA.partition_reducibility`: For chosen Cayley–Hamilton GMA data with its residual dictionary, I_P⊆J iff a unique family of factors has the specified degrees, full product law and residual products.

Uses: [Ordered residual GMA constituents](#target151), [The kernel contains the Cayley–Hamilton ideal](#target35), [A determinant is determined by its trace when d! is invertible](#target14). Sources: [Bellaïche–Chenevier](#ref-bc09), Proposition 1.5.1, pp.32–34; [Allen–Newton–Thorne](#ref-ant20), Proposition 2.5 and its entire proof, pp.5–6.

<a id="target152"></a>

**Two-block determinant reducibility ideal.** For a henselian local A and a two-block Cayley–Hamilton GMA (S,D_E) with ordered residual dictionary (ρ̄ᵢ,ρ̄ⱼ), i≠j, define I_red by the opposite primitive-entry pairing AᵢⱼAⱼᵢ. For every J⊆mₐ, I_red⊆J iff there exists a unique ordered pair of determinants Fᵢ,Fⱼ on (A/J)⊗ₐS of degrees nᵢ,nⱼ with D_E mod J=FᵢFⱼ as full laws, and with Fᵢ mod mₐ=det ρ̄ᵢ and Fⱼ mod mₐ=det ρ̄ⱼ under the canonical residual tensor identification. No factorial invertibility is assumed.

Assumptions: The coefficient ring is henselian local; the GMA determinant is Cayley–Hamilton; the residual factors are specified, split, absolutely irreducible and distinct; J is contained in the maximal ideal.

API: `GMA.reducibilityIdeal`: The ideal of products of opposite off-diagonal entry modules; `GMA.reducibilityIdeal_le_iff`: For the same two-block residual dictionary, D_E Cayley–Hamilton and J⊆mₐ: I_red⊆J iff a unique ordered pair of full-law factors of degrees nᵢ,nⱼ has exactly the prescribed residual determinants; `GMA.reducibilityIdeal_baseChange`: Under a local quotient A→A/J, the ideal maps to I_red(A/J).

Tests: For an upper triangular algebra the ideal is zero. For [[A,A],[π^rA,A]] over a DVR, I_red=(π^r). For M₂(A) the opposite pairing is the unit ideal; there is no two-block determinant factorization with two distinct residual characters. Over the triangular algebra over any field, including characteristic two, the unique degree-one determinant factors are fixed by their ordered residual diagonal characters.

Uses: [Multiplicity-free henselian GMA structure](#target148), [Partition reducibility for determinants](#target153). Sources: [Caraiani–Newton](#ref-cn23), Proposition 3.2.3, p.49, importing ANT20 Proposition 2.5; [Allen–Newton–Thorne](#ref-ant20), Proposition 2.5 and its entire proof, pp.5–6.

<a id="target154"></a>

**GMA quotient constituent module.** For GMA E on S, a labelled partition P, a singleton part {i}, and I_P⊆J, diagonal compression eᵢxeᵢ followed by the chosen matrix identification and A→A/J is an (A/J)-algebra representation of S_J=(A/J)⊗ₐS in M_nᵢ(A/J). Its quotient constituent Mᵢ is the actual vector module (A/J)^nᵢ with this action. If S is a chosen quotient of R, restrict this same module along R_J→S_J to form the ambient Ext endpoint.

API: `GMA.quotientRepresentation`: For a singleton part, the diagonal compression representation S_J→M_nᵢ(A/J); `GMA.quotientRepresentation_apply`: On 1⊗x it is the selected diagonal block eᵢxeᵢ, reduced entrywise modulo J; `GMA.quotientConstituent`: The vector module (A/J)^nᵢ with the actual compressed S_J-action.

Tests: For the upper triangular two-block algebra, the i-th rank-one quotient action is the i-th diagonal entry reduced modulo the same coefficient ideal. For the triangular algebra over a field, each prescribed rank-one quotient constituent is nonzero, excluding arbitrary zero Ext endpoints. For the upper triangular algebra over a field, Ext¹ of the second diagonal constituent by the first is one-dimensional; the endpoints have their actual quotient actions.

Uses: [Partition reducibility for determinants](#target153), `Matrix.toLinAlgEquiv'`, `Module.compHom`, `ModuleCat.restrictScalars`. Sources: [Bellaïche–Chenevier](#ref-bc09), §1.5.4 and Theorems 1.5.5–1.5.6, pp.34–37; [Allen–Newton–Thorne](#ref-ant20), Proposition 2.5 and proof, pp.5–6.

<a id="target155"></a>

**GMA extension module.** For distinct residual blocks i,j of a GMA S and a quotient A/J with J containing the partition reducibility ideal and singleton parts i,j, let A′_ij=∑_{k≠i,j}A_ikA_kj and E_ij=A_ij/A′_ij. Linear functionals E_ij→A/J give the off-diagonal entries of extensions of ρ_j by ρ_i.

API: `GMA.extensionModule`: E_ij=A_ij/(∑_{k≠i,j}A_ikA_kj); `GMA.extension_offDiagonal`: The multiplication defect of the ij block vanishes in E_ij; `GMA.extensionModule_twoBlocks`: For two blocks E_12=A_12.

Tests: With two blocks the intermediate sum is zero. For three scalar blocks of M₃(A), A_13/A_12A_23=0. For [[A,B],[0,A]], the upper extension module is B.

Uses: [Partition reducibility for determinants](#target153). Sources: [Bellaïche–Chenevier](#ref-bc09), §1.5.3, p.35.

<a id="target157"></a>

**Projective-cover description of GMA extensions.** For the same chosen GMA S, singleton part {j} and quotient coefficient ring A/J, the primitive left ideal Pⱼ=S_J Eⱼ is finitely generated projective and has the specified quotient vector module Mⱼ. Applying Hom to the kernel of Pⱼ→Mⱼ identifies Ext¹_(S_J)(Mⱼ,Mᵢ) with Hom_A(Eᵢⱼ,A/J). The calculation supplies the restriction-of-scalars image in gma-extension-injection; its proof does not assume that theorem.

Compute the primitive projective cover kernel using the same quotient constituent, then quotient its intermediate-block paths. The Hom/Ext sequence identifies the dual of Eᵢⱼ. Restriction of scalars preserves the needed finite limits and colimits, which must be instantiated for these noncommutative module categories.

Uses: [GMA extension module](#target155), [GMA quotient constituent module](#target154), `Module.Projective`. Sources: [Bellaïche–Chenevier](#ref-bc09), Theorem 1.5.6, pp.36–37.

<a id="target156"></a>

**Off-diagonal extension injection.** Let A be henselian local, D a split residually multiplicity-free determinant on R, and q:R→S a surjective chosen quotient with CH(D)⊆ker q⊆ker D, GMA data E and its ordered residual dictionary, and D_E∘q=D as full laws. Let P have distinct singleton parts {i},{j}, and let I_P⊆J⊆mₐ. With Eᵢⱼ=Aᵢⱼ/∑_(k≠i,j)AᵢkA_kⱼ and the actual quotient vector modules Mᵢ,Mⱼ over S_J, there is an injective (A/J)-linear map Hom_A(Eᵢⱼ,A/J)→Ext¹_(R_J)(q_J* Mⱼ,q_J* Mᵢ). Its image equals the range of the restriction-of-scalars map Ext¹_(S_J)(Mⱼ,Mᵢ)→Ext¹_(R_J)(q_J* Mⱼ,q_J* Mᵢ).

Assumptions: Use the same chosen Cayley–Hamilton quotient, labelled residual dictionary, singleton parts and quotient constituent modules throughout. Neither Ext endpoint is an arbitrary module.

Uses: [Projective-cover description of GMA extensions](#target157), `CategoryTheory.Functor.mapExtLinearMap`, `ModuleCat.preservesLimit_restrictScalars`, `ModuleCat.preservesColimit_restrictScalars`. Sources: [Bellaïche–Chenevier](#ref-bc09), Theorem 1.5.5 and proof, pp.35–36.

<a id="target158"></a>

**Extension dimensions bound reducibility generators.** For reduced noetherian henselian local A and a split residually two-block multiplicity-free trace pseudocharacter with d! invertible, the minimal number of generators of I_red is at most dim_kExt¹_S/mS(ρ̄₁,ρ̄₂)·dim_kExt¹_S/mS(ρ̄₂,ρ̄₁).

Uses: [Two-block determinant reducibility ideal](#target152), [Off-diagonal extension injection](#target156). Sources: [Bellaïche–Chenevier](#ref-bc09), Proposition 1.7.1, p.42.

<a id="target159"></a>

**Classical Ribet lattice.** Under these hypotheses there is an actual G-stable finite free full A-submodule L of K², with an A-basis and an integral representation intertwining the original K-representation. In that basis its residual matrices have diagonal (χ̄,ψ̄), lower entry zero, and upper entry b(g) for which no v∈k satisfies b(g)=(ψ̄(g)−χ̄(g))v for all g. Thus the residual representation is a nonsplit extension of ψ̄ by χ̄; interchanging the prescribed characters gives the opposite orientation.

Assumptions: A is a complete DVR with residue field k and fraction field K; K is complete, locally compact and nonarchimedean and A is exactly its norm unit ball. G is a compact Hausdorff topological group, ρ:G→GL₂(K) is continuous and irreducible, and its characteristic polynomials have coefficients in A. Their residual characteristic polynomials are (X−χ̄(g))(X−ψ̄(g)) for prescribed distinct characters χ̄,ψ̄:G→kˣ.

Construct a stable full lattice from compactness in the specified locally compact nonarchimedean fraction field. Bound its entry fractional ideals and rescale to retain a nonzero upper residual extension in the stated orientation.

Uses: [Two-block determinant reducibility ideal](#target152), [Off-diagonal extension injection](#target156), `IsDiscreteValuationRing`, `IsFractionRing`, `NormedField`, `IsUltrametricDist`, `IsAdicComplete`. Sources: [Bellaïche–Chenevier](#ref-bc09), Proposition 1.7.4 and proof, pp.43–44.

### Universal algebras, topology and coefficient descent

<a id="target160"></a>

**Universal Cayley–Hamilton algebra.** For a group G and d≥1, let Z(G,d) represent dimension-d determinants on Z[G]. Its universal Cayley–Hamilton algebra is R(G,d)=(Z(G,d)⊗Z Z[G])/CH(D_univ), with the descended determinant. Maps to a Cayley–Hamilton algebra carrying a G-representation and compatible determinant are uniquely induced by this quotient.

Assumptions: Specialization is along an explicit coefficient algebra map φ:Z(G,d)→B, and Dφ is the determinant represented by that same map. Matrix specialization assumes B henselian local, d>0, and Dφ residual split absolutely irreducible.

API: `CayleyHamilton.universalAlgebra`: The actual CH quotient R(G,d) over Z(G,d); `CayleyHamilton.universalAlgebra_quotientMap`: The canonical quotient map Z(G,d)[G]→R(G,d); `CayleyHamilton.universalSpecialization`: For the explicit coefficient map φ:Z(G,d)→B, the determinant Dφ represented by φ; `CayleyHamilton.universalAlgebra_lift`: With D_S Cayley–Hamilton and full-law compatibility D_S∘r=Dφ, induce the coefficient-compatible map R(G,d)→S; `CayleyHamilton.universalAlgebra_lift_single`: The lift sends each coefficient c times group element g to r(φ(c)⊗g); `CayleyHamilton.universalAlgebra_lift_unique`: A coefficient-compatible map with these values on every group-algebra coefficient equals the induced lift; `CayleyHamilton.universalAlgebra_baseChange`: Scalar extension B⊗_(Z(G,d))R(G,d) along the specified φ; `CayleyHamilton.universalAlgebra_specializationEquiv`: Identify this scalar extension with B[G]/CH(Dφ).

Tests: For d=1 the universal Cayley–Hamilton algebra equals the universal character ring. For G={1}, R(G,d)=Z for d≥1. For henselian local B and d>0, if the specialized universal determinant Dφ has split absolutely irreducible residue, B⊗_(Z(G,d))R(G,d)≅M_d(B). The coefficient map φ and residual properties belong to Dφ itself.

Uses: [The kernel contains the Cayley–Hamilton ideal](#target35), [Henselian irreducible reconstruction](#target146), `HenselianLocalRing`. Sources: [Chenevier](#ref-chenevier-det), §1.22 and Proposition 1.23, pp.18–19.

<a id="target161"></a>

**Finiteness of completed universal Cayley–Hamilton algebras.** Let G be profinite, D̄ a continuous finite-field determinant, R_D its noetherian universal pseudodeformation ring, and dim_kH¹_c(G,adρ̄_ss)<∞. Then its completed Cayley–Hamilton algebra E_D is finite over R_D, and its profinite, quotient and maximal-ideal-adic topologies agree. Residual split absolute irreducibility gives E_D≅M_d(R_D).

Prove the finite-H¹ radical-cotangent bound, finite residual dimension in the profinite Cayley–Hamilton algebra, and topological Nakayama. The argument in small characteristic requires its own proof. Also prove the generated Cayley–Hamilton ideal is closed and the three topologies agree; a bounded-sum image assertion does not establish closedness.

Uses: [Universal Cayley–Hamilton algebra](#target160), `ArithmeticGaloisDuality:R02.1`. Sources: [Wang–Erickson](#ref-we18), Proposition 3.6 and proof, pp.21–23.

<a id="target162"></a>

**Continuity of reconstructed matrices.** Let A be complete noetherian local with finite residue field, D a continuous determinant on A[G] and split absolutely irreducible residual determinant. The reconstructed ρ:G→GL_d(A) is continuous; its conjugacy class depends only on D.

Uses: [Continuous determinants](#target28), [Finiteness of completed universal Cayley–Hamilton algebras](#target161). Sources: [Chenevier](#ref-chenevier-det), Proof of Corollary 2.23(i), p.35; §3.11.

<a id="target163"></a>

**Absolutely irreducible coefficient descent.** Let A⊂B be complete noetherian local rings with m_B∩A=m_A and common residue field. For a profinite G and continuous ρ:G→GL_d(B), assume residual absolute irreducibility and trρ(G)⊂A. Then ρ is conjugate by 1+M_d(m_B) to a representation into GL_d(A). More generally an already descended quotient modulo J allows the conjugator in 1+M_d(J).

Uses: [Henselian irreducible reconstruction](#target146), [The trace of a determinant is a pseudocharacter](#target13). Sources: [CHT](#ref-cht08), Lemma 2.1.10 and proof, pp.13–14.

<a id="target164"></a>

**Symplectic coefficient descent with prescribed multiplier.** Let A⊂B be complete noetherian local rings with their maximal-ideal adic topologies and the same residue field of characteristic p>2, with the inclusion inducing that residue identification. Let G be profinite and ρ:G→GL₄(B) continuous and residually absolutely irreducible, with all traces in A. Fix a nondegenerate alternating form J over A and a continuous full multiplier ν:G→Aˣ such that ρ(g)ᵗJρ(g)=ν(g)J over B. There are a continuous A-valued representation ρ_A with this same form and full multiplier and a conjugating P∈GSp(J,B), P≡1 mod m_B, with ρ_A(g)=Pρ(g)P⁻¹.

Assumptions: The inclusion is injective, local and residue-compatible; both coefficient rings are complete noetherian local and carry their adic topologies. G is compact Hausdorff and totally disconnected; the matrix representation and full multiplier are continuous. J is alternating and invertible. The multiplier is the specified A-valued unit character, including its sign. Residual absolute irreducibility is the actual residual determinant predicate; residue characteristic is strictly greater than two.

First descend in GL₄. Then construct the descended invertible alternating form with the prescribed multiplier and select a symplectic basis, controlling the near-identity conjugator. The p>2 hypothesis in this general result is essential to the cited argument.

Uses: [Absolutely irreducible coefficient descent](#target163), [Full similitude character under duality and twist](#target63), `IsAdicComplete`, `IsAdic`. Sources: [Gee–Geraghty](#ref-gg12), Lemma 7.1.1 and proof, p.25.

### Compatible local compression

<a id="target165"></a>

**Cayley–Hamilton recognition of isotypic modules.** Let A be henselian local, ρ:G→GL_d(A) have split absolutely irreducible residual representation, and M be an A[G]-module annihilated by CH(detρ). Then M≅A^d⊗_AN as an A[G]-module for N=E_11M, with G acting through ρ on the first factor.

Uses: [Henselian irreducible reconstruction](#target146). Sources: [Chenevier](#ref-chenevier-det), Theorem 2.22(i) and proof, pp.34–35; matrix-unit module consequence.

<a id="target166"></a>

**Residual projector from a local subgroup.** Suppose two absolutely irreducible global residual representations are inequivalent and their restrictions to a subgroup H have disjoint sets of simple constituents. In their product image algebra the central projector (1,0) belongs to the image of k[H].

Uses: [Residual determinant properties](#target141). Sources: [Caraiani–Newton](#ref-cn23), Lemma 3.2.2(1–2), pp.48–49.

<a id="target167"></a>

**Integral lift of the local projector.** In the CN23 setup with Ã finite flat over a complete DVR, Ã[1/p] a product of fields and integral characteristic coefficients, the local residual projector lifts to an idempotent ẽ in the integral local image algebra. It projects on each specified local subrepresentation, provided its residual constituents are exactly the selected block.

Uses: [Residual projector from a local subgroup](#target166), [Henselian lifting of matrix units](#target143). Sources: [Caraiani–Newton](#ref-cn23), Lemma 3.2.2(3–4), pp.48–49.

<a id="target168"></a>

**Global compression modulo reducibility.** For a two-block GMA and J⊃I_red, x↦exe modulo J is an algebra homomorphism into eRe⊗A/J and realizes the unique determinant factor lifting the selected residual constituent.

Uses: [Two-block determinant reducibility ideal](#target152), [Integral lift of the local projector](#target167). Sources: [Caraiani–Newton](#ref-cn23), Proposition 3.2.4(1), p.50.

<a id="target169"></a>

**Integral compression on a stable local summand.** In the CN23 setup, x↦ẽxẽ from Ã[H] to ẽR̃ẽ is an integral algebra homomorphism when im(ẽ) is H-stable in every generic field factor. After inverting p it is the chosen local subrepresentation.

Uses: [Integral lift of the local projector](#target167). Sources: [Caraiani–Newton](#ref-cn23), Proposition 3.2.4(2), p.50.

<a id="target170"></a>

**Inner conjugacy of local matrix algebras.** For a commutative local ring A and d>0, every A-algebra automorphism f of M_d(A) is conjugation by an invertible matrix P. Applied to the two full-matrix identifications of the same residually absolutely irreducible Cayley–Hamilton quotient, it conjugates their group representations.

Assumptions: The coefficient ring is commutative local; the matrix size is positive; f is an algebra equivalence.

Uses: `Matrix.toLinAlgEquiv'`, `Module.Projective`, `Module.free_of_flat_of_isLocalRing`, `Module.Flat.of_projective`. Sources: [Allen–Newton–Thorne](#ref-ant20), Proof of Theorem 2.4, p.5; [Caraiani–Newton](#ref-cn23), Proof of Proposition 3.2.4(3), p.50.

<a id="target171"></a>

**Local lifts compatible with global quotient reconstruction.** In CN23 §3.2, let Ã→A be the local surjection between finite flat coefficient O-algebras, with Ã[1/p]=∏Kᵢ, global A-representation ρ with absolutely irreducible residue, and integral generic 2n-dimensional determinant D̃ whose reduction factors as detρ times the other prescribed determinant. Let H⊂G have disjoint residual constituents for the two selected factors and a selected H-stable n-dimensional generic subrepresentation in each Kᵢ. The common GMA corner construction gives an integral H-representation λ over Ã and a global compressed A-representation σ with full determinant detρ. There is an Ã-valued local representation reducing exactly to ρ|H, conjugate over Ã to λ, whose each generic fiber is conjugate to the selected subrepresentation.

Assumptions: The direction is a surjective local coefficient map Ã→A; Ã and A are complete noetherian local with adic topologies. The local integral projectors and compression constructions supply one chosen labelled residual GMA dictionary and corner basis; return products vanish in ker(Ã→A). A residual separator in the H-group algebra acts as identity on the selected constituent and zero on the other; the local residual constituents are disjoint. The global compressed σ and local integral λ use that same corner. Their reduction relation is exact and detσ=detρ as full laws, with ρ residually absolutely irreducible. Each generic fiber of λ is identified by a chosen corner basis with its selected local constituent. All representations, residual labels and corner identifications are part of the input.

Uses: [Global compression modulo reducibility](#target168), [Integral compression on a stable local summand](#target169), [Absolutely irreducible coefficient descent](#target163), [GMA quotient constituent module](#target154), [Inner conjugacy of local matrix algebras](#target170). Sources: [Caraiani–Newton](#ref-cn23), Proposition 3.2.4(3), p.50.

### Generalized reductive reconstruction

<a id="target172"></a>

**Closed-orbit representatives of invariant tuples.** For a generalized reductive H over noetherian O and algebraically closed O-field k, each point of H^n//H⁰ has one closed H⁰(k)-orbit over it. The closed tuples generate H-completely reducible reduced subgroups.

Uses: [Generalized reductive pseudocharacter](#target121). Sources: [Quast](#ref-q23), Lemmas 3.4–3.5, pp.12–13.

<a id="target173"></a>

**Extremal reconstruction tuple.** For Θ an H-pseudocharacter over algebraically closed k, there is a finite tuple δ maximizing first the dimension and then the component count of its minimal parabolic, and minimizing first dimension and then component count of its centralizer among those maximizers.

The dimension and component-count comparison gives the centralizer equality for reduced algebraic groups or their algebraically closed points. A scheme-theoretic equality in a possibly nonreduced centralizer needs the stronger slice hypotheses below.

Uses: [Closed-orbit representatives of invariant tuples](#target172). Sources: [Quast](#ref-q23), Proof of Theorem 3.7, conditions (1–4), p.13.

<a id="target174"></a>

**One-entry extension of a stable tuple.** For an extremal tuple δ with closed representative g, each γ∈Γ has a unique h∈H(k) such that (g,h) is the closed representative of (δ,γ), up to H⁰(k)-conjugacy fixing g.

Uses: [Extremal reconstruction tuple](#target173). Sources: [Quast](#ref-q23), Theorem 3.7, Claim A, pp.14–15.

<a id="target175"></a>

**Two-entry extension of a stable tuple.** The stable-tuple construction extends uniquely to (δ,γ,γ′); its one-entry projections and the tuple with final entry hh′ have closed H⁰-orbits.

Uses: [One-entry extension of a stable tuple](#target174). Sources: [Quast](#ref-q23), Theorem 3.7, Claims B–C, p.15.

<a id="target176"></a>

**Multiplicativity of reconstructed points.** The assignments γ↦h from one-entry-extension satisfy ρ(γγ′)=ρ(γ)ρ(γ′), ρ(1)=1 and Θ_ρ=Θ.

Assumptions: Representation evaluation is the compatible point-evaluation datum of the actual invariant coordinate algebras, as in IHG.0/invariant-evaluation. The prototype still omits unavailable LP3 group-scheme and orbit hypotheses explicitly.

Uses: [Two-entry extension of a stable tuple](#target175). Sources: [Quast](#ref-q23), End of proof of Theorem 3.7, p.15.

<a id="target177"></a>

**Reductive pseudocharacter reconstruction.** For generalized reductive H over noetherian O, any H-pseudocharacter of Γ with values in an algebraically closed O-field k is realized by an H-completely reducible homomorphism Γ→H(k), unique up to H⁰(k)-conjugation. This uses full invariant tuples, not only the trace of a chosen linear representation.

Assumptions: Representation evaluation is the compatible point-evaluation datum of the actual invariant coordinate algebras, as in IHG.0/invariant-evaluation. The prototype still omits unavailable LP3 group-scheme and orbit hypotheses explicitly.

Uses: [Multiplicativity of reconstructed points](#target176). Sources: [Quast](#ref-q23), Theorem 3.7, pp.13–15.

<a id="target178"></a>

**Discrete continuity of reductive reconstruction.** For a split connected reductive H/Z, profinite Γ and algebraically closed discrete field k, a continuous H-pseudocharacter reconstructs a continuous H-completely reducible representation. It factors through a finite quotient of Γ.

Assumptions: Representation evaluation is the compatible point-evaluation datum of the actual invariant coordinate algebras, as in IHG.0/invariant-evaluation. The prototype still omits unavailable LP3 group-scheme and orbit hypotheses explicitly.

Uses: [Reductive pseudocharacter reconstruction](#target177), [Continuous reductive pseudocharacter](#target122). Sources: [BHKT](#ref-bhkt19), Proposition 4.7(iii) and proof, p.16.

<a id="target179"></a>

**Characteristic-zero valued continuity of reconstruction.** For split connected reductive H/Z, profinite Γ and algebraically closed characteristic-zero field k carrying a rank-one valuation topology, continuity of the H-pseudocharacter implies continuity of its H-completely reducible realization.

Assumptions: Representation evaluation is the compatible point-evaluation datum of the actual invariant coordinate algebras, as in IHG.0/invariant-evaluation. The prototype still omits unavailable LP3 group-scheme and orbit hypotheses explicitly.

Prove continuity from the invariant evaluation functions using the valued reconstruction argument. Compactness or boundedness of the reconstructed image must be derived rather than assumed during that proof.

Uses: [Reductive pseudocharacter reconstruction](#target177), [Continuous reductive pseudocharacter](#target122). Sources: [BHKT](#ref-bhkt19), Proposition 4.7(ii), p.16.

<a id="target180"></a>

**Integral model and residual semisimplification.** For split connected reductive H/Z and continuous ρ:Γ→H(Q̄_l) with Γ profinite, a finite coefficient extension and conjugation put ρ in H(O_E). Its residual H-completely reducible semisimplification is independent up to H(F̄_l)-conjugacy of the extension and integral model.

Uses: [Characteristic-zero valued continuity of reconstruction](#target179), `ReductiveGroupsPartII:RG2.2`, `ReductiveGroupsPartII:RG2.3`. Sources: [BHKT](#ref-bhkt19), Theorem 4.8 and proof, pp.16–17.

<a id="target181"></a>

**Universal reductive pseudocharacter ring.** For Γ and generalized reductive H/O, let B_H^Γ be the colimit of O[H^m]^(H⁰) over free-group maps F_m→Γ. O-algebra maps B_H^Γ→A are exactly H-pseudocharacters with values in A. Complete at the ideal defined by a continuous finite-field Θ̄ to obtain its pseudodeformation ring R_Θ̄.

API: `ReductivePseudocharacter.universalRing`: The invariant-word colimit B_H^Γ; `ReductivePseudocharacter.universalRing_equiv`: Hom_O(B_H^Γ,A)≃PC_H^Γ(A); `ReductivePseudocharacter.deformationRing`: The residual-adic completion representing continuous pseudodeformations.

Tests: For the trivial target group H, B_H^Γ=O. For H=GL₁ and Γ=Z, B_H^Γ=O[t,t⁻¹]. For H=GL_d, invariant-word evaluations give the universal determinant ring via the EM23 all-ring comparison.

Uses: [Generalized reductive pseudocharacter](#target121). Sources: [Quast](#ref-q23), Theorem 3.20, p.20, and Theorem 5.4, pp.27–28.

<a id="target182"></a>

**Noetherianity for finitely generated profinite groups.** If O is complete noetherian local with finite residue field, H/O is generalized reductive, Γ is topologically finitely generated and Θ̄ is continuous over a finite field, then R_Θ̄ is noetherian.

Use finite tuple invariant rings, their finite generation, the tangent bound and completion to prove noetherianity. Finite generation of the profinite source is the hypothesis on the group, not finite generation of its abstract underlying group.

Uses: [Universal reductive pseudocharacter ring](#target181), [Continuous reductive pseudocharacter](#target122). Sources: [Quast](#ref-q23), Theorem 5.7 and proof, p.29.

<a id="target183"></a>

**Schur-type reductive deformation comparison.** Let H/O be split connected reductive, O a complete DVR, and ρ̄:Γ→H(k) absolutely H-completely reducible with trivial scheme-theoretic centralizer in H_ad. Under the smooth free-orbit slice hypotheses of BHKT19 Theorem 4.10, strict H_ad-deformations of ρ̄ and pseudodeformations of Θ_ρ̄ are naturally equivalent.

Assumptions: Representation evaluation is the compatible point-evaluation datum of the actual invariant coordinate algebras, as in IHG.0/invariant-evaluation. The prototype still omits unavailable LP3 group-scheme and orbit hypotheses explicitly.

Uses: [Reductive pseudocharacter reconstruction](#target177), [Universal reductive pseudocharacter ring](#target181). Sources: [BHKT](#ref-bhkt19), Theorem 4.10 and proof, pp.17–18.

<a id="target252"></a>

**Generic Cayley–Hamilton representation algebra.** For a commutative ring A and a Cayley–Hamilton A-algebra (E,D) finite as an A-module, construct a commutative A-algebra A_gen of finite type and a universal determinant-preserving A-algebra map j:E→M_d(A_gen). For every commutative A-algebra B, A-algebra maps A_gen→B are naturally bijective with A-algebra maps f:E→M_d(B) satisfying det∘f=D_B. Finite type does not assert that A_gen is finite as an A-module.

API: `CayleyHamilton.genericRepresentationRing`: The finite-type coordinate algebra A_gen; `CayleyHamilton.genericRepresentation`: The universal determinant-preserving algebra map E→M_d(A_gen); `CayleyHamilton.genericRepresentationRing_equiv`: Maps A_gen→B correspond naturally to determinant-preserving representations E→M_d(B).

Tests: For E=A,d=1,D=id, A_gen≅A. For E=M_d(A),D=det, the identity representation gives a specialization A_gen→A. For d=2 and E=A×A with D(a,b)=ab, complementary rank-one idempotent matrices vary; over a field their coordinate ring has positive dimension and is not finite as a vector space.

Uses: [Cayley–Hamilton algebras](#target32). Sources: [BIP](#ref-bip23), Lemma 3.1 and proof, pp.10–11.

## IHG.2 — Integral and derived Hecke actions

Retain the map from the abstract commutative Hecke algebra in each image. The passage to cohomology is controlled by ghosts, and the resulting local idempotents split the derived object. Operator localization requires the exact finite or artinian assumptions stated below.

<a id="target37"></a>

**Finite morphism modules for bounded finite cohomology.** Let A be a commutative noetherian ring and M,N in D(A) have finitely generated cohomology, nonzero in only finitely many degrees. The A-module Hom_D(A)(M,N) is finitely generated. No finite-projective-dimension hypothesis is imposed.

Induct on both cohomological amplitudes using truncation triangles, the shifted-module Hom/Ext comparison and finite-module closure under kernels, quotients and extensions. No perfectness or finite projective dimension is required.

Uses: `ModuleCat.finite_ext`, `DerivedCategory`. Sources: [Boxer–Pilloni](#ref-bp26), Proof of Lemma 2.4.3, p.18.

<a id="target38"></a>

**Idempotent completeness of the module derived category.** For every ring A, any idempotent e:C→C in D(A) splits: there are C_e, i:C_e→C and p:C→C_e with p∘i=1 and i∘p=e. Consequently C≅C_e⊕C_(1−e).

Build the countable mapping telescope and identify its cohomology, then obtain the complementary image for 1−e. The coproduct and totalization comparison is part of the proof.

Uses: `DerivedCategory`. Sources: [Bökstedt–Neeman](#ref-bn93), Proposition 3.2, p.221.

<a id="target247"></a>

**Chain Hecke image.** For an A-linear chain complex C and a commutative A-algebra action α:H→End_Ch(A)(C), define T_ch(C)=im(α) as an A-subalgebra of the chain endomorphism ring.

API: `HeckeImage.chain`: For an A-linear chain complex C and a commutative A-algebra action α:H→End_Ch(A)(C), define T_ch(C)=im(α) as an A-subalgebra of the chain endomorphism ring; `HeckeImage.mem_chain`: Membership is existence of a preimage h∈H; `HeckeImage.chain_quotient`: The image is H modulo the kernel of the specified action.

Tests: For the zero complex the chain image is the zero ring. The scalar action on A in degree zero has image A. For C=(A --1→ A), the identity chain map is nonzero if A≠0 although its homotopy and cohomology images are zero.

Uses: `CochainComplex`, `AlgHom.range`. Sources: [ACC](#ref-acc23), §2.1.2, pp.910–911; §2.2, pp.919–920; Lemma 2.2.4, pp.920–921.

<a id="target248"></a>

**Homotopy Hecke image.** For an A-linear chain action on C, define T_hom(C) as the image of H in End_K(A)(C), after passing to chain-homotopy classes.

API: `HeckeImage.homotopy`: For an A-linear chain action on C, define T_hom(C) as the image of H in End_K(A)(C), after passing to chain-homotopy classes; `HeckeImage.mem_homotopy`: Membership is existence of a preimage h∈H; `HeckeImage.homotopy_quotient`: The image is H modulo the kernel of the specified action.

Tests: For a contractible complex the homotopy image is the zero ring. For A in degree zero, the scalar image is A. Chain-homotopic actions of each h give the same homotopy-image action; equal cohomology alone does not imply this.

Uses: `DerivedCategory`. Sources: [ACC](#ref-acc23), §2.1.2, pp.910–911; §2.2, pp.919–920; Lemma 2.2.4, pp.920–921.

<a id="target39"></a>

**Derived Hecke image.** For a commutative A-algebra H and an A-algebra action α:H→End_D(A)(C), define T_der(C)=im(α), as an A-subalgebra of the derived endomorphism ring. The action factors through the surjection H→T_der(C).

API: `HeckeImage.derived`: The A-subalgebra im(α) of End_D(A)(C); `HeckeImage.mem_derived`: t lies in T_der(C) iff t=α(h) for some h∈H; `HeckeImage.derived_action_faithful`: The inclusion T_der(C)→End_D(A)(C) is injective.

Tests: For C=0, the image is the zero ring. For C=A in degree zero and its scalar action, T_der(C)≅A. For H→A acting on A in degree zero, T_der(C)≅H/ker(H→A).

Uses: `DerivedCategory`. Sources: [ACC](#ref-acc23), §2.2.3 immediately before Lemma 2.2.4, p.920.

<a id="target249"></a>

**Cohomology Hecke image.** For an A-linear action on C, define T_coh(C) as the image of H in the product ring ∏_iEnd_A(H^i(C)). For bounded cohomology only finitely many nonzero factors contribute.

API: `HeckeImage.cohomology`: For an A-linear action on C, define T_coh(C) as the image of H in the product ring ∏_iEnd_A(H^i(C)). For bounded cohomology only finitely many nonzero factors contribute; `HeckeImage.mem_cohomology`: Membership is existence of a preimage h∈H; `HeckeImage.cohomology_quotient`: The image is H modulo the kernel of the specified action.

Tests: Every acyclic complex has zero cohomology image. For A in degree zero the scalar image is A. The nonzero off-diagonal Ext¹ ghost in the two-degree example maps to zero in the cohomology action.

Uses: `DerivedCategory.homologyFunctor`, `AlgHom.range`. Sources: [ACC](#ref-acc23), §2.1.2, pp.910–911; §2.2, pp.919–920; Lemma 2.2.4, pp.920–921.

<a id="target40"></a>

**Finite generation of the derived Hecke image.** If A is commutative noetherian and C has bounded finite cohomology, T_der(C) is a finite A-module for every commutative A-algebra action H→End_D(A)(C).

Uses: [Derived Hecke image](#target39), [Finite morphism modules for bounded finite cohomology](#target37). Sources: [ACC](#ref-acc23), §1.2, p.905.

<a id="target41"></a>

**Chain and derived Hecke images.** An action H→End_Ch(A)(C•) induces actions in K(A), D(A) and on ⊕_iH^i(C•), and surjections between their image algebras T_ch→T_hom→T_der→T_coh. A null-homotopic chain endomorphism maps to zero in every later image. If C• is K-projective, T_hom→T_der is an isomorphism.

Use the K-projective full-faithfulness comparison for the middle map. A chain action descends to homotopy and cohomology without requiring that comparison to be an isomorphism on every derived endomorphism.

Uses: `DerivedCategory.Q`, `DerivedCategory.Qh`, [Derived Hecke image](#target39), [Chain Hecke image](#target247), [Homotopy Hecke image](#target248), [Cohomology Hecke image](#target249). Sources: [ACC](#ref-acc23), §2.2.3 and Lemma 2.2.4, pp.920–921.

### Ghosts and local factors

<a id="target42"></a>

**Cohomological ghost ideal.** For C∈D(A), let G(C) be the two-sided ideal of End_D(A)(C) consisting of endomorphisms f such that H^i(f)=0 for every integer i. For a Hecke image T_der(C), let J(C)=T_der(C)∩G(C); then T_coh(C) is exactly T_der(C)/J(C).

API: `HeckeImage.ghostIdeal`: G(C)=⋂_i ker(H^i:End(C)→End(H^i(C))); `HeckeImage.mem_ghostIdeal`: f∈G(C) iff H^i(f)=0 for every i; `HeckeImage.cohomologyImage_quotient`: T_der(C)/J(C)≅T_coh(C), by the induced cohomology action.

Tests: If C has cohomology in one degree, G(C)=0. For C=(Z/p)⊕(Z/p)[−1], an off-diagonal nonzero class in Ext¹_Z(Z/p,Z/p) defines a nonzero ghost f with f²=0. For a scalar action on A in degree zero, J(C)=0 and T_coh(C)=T_der(C).

Uses: [Derived Hecke image](#target39). Sources: [ACC](#ref-acc23), Lemma 2.2.4, p.920.

<a id="target43"></a>

**Factorization through a truncation triangle.** Let H^i(C)=0 outside [a,b], a<b, and let F be a product of b−a ghosts for which τ≤b−1(F)=0. Then F factors through C→H^b(C)[−b]. Any ghost g factors through τ≤b−1(C)→C. Their product F∘g is zero.

Uses: [Cohomological ghost ideal](#target42). Sources: [ACC](#ref-acc23), Proof of Lemma 2.2.4, p.921.

<a id="target44"></a>

**Amplitude bound for ghost nilpotence.** For a ring A and C∈D(A) with H^i(C)=0 outside [a,b], a≤b, every composite of b−a+1 degree-zero ghosts is zero. Hence G(C)^(b−a+1)=0, and J(C)^(b−a+1)=0 for every Hecke image.

For amplitude [a,b], use truncation induction and the two factorizations through the top cohomology triangle. Products of b−a+1 cohomologically zero endomorphisms vanish as derived morphisms.

Uses: [Factorization through a truncation triangle](#target43). Sources: [ACC](#ref-acc23), Lemma 2.2.4, pp.920–921.

<a id="target45"></a>

**Maximal ideals of derived and cohomology images.** For bounded C and a commutative Hecke action, T_der(C)→T_coh(C) induces a bijection on prime ideals and maximal ideals, preserving localizations of the action; it does not imply an isomorphism of the two rings.

Uses: [Amplitude bound for ghost nilpotence](#target44). Sources: [ACC](#ref-acc23), After Lemma 2.2.4, p.921.

<a id="target46"></a>

**Local factors over a complete coefficient ring.** Let A be a complete noetherian local ring and T a finite commutative A-algebra. T has finitely many maximal ideals, and T≅∏_mT_m. Each factor T_m is a complete noetherian local A-algebra; the projection is multiplication by a unique central idempotent e_m.

Prove finite-algebra completeness, lift the orthogonal idempotents of the artinian residue quotient, and show each factor is complete local. Specify the corresponding central projectors before splitting the complex.

Uses: [Finite generation of the derived Hecke image](#target40). Sources: [ACC](#ref-acc23), §1.2, p.905.

<a id="target47"></a>

**Localized summands of a derived Hecke action.** For a finite commutative derived Hecke image T over a complete noetherian local A, define C_m as the splitting of e_m acting on C. Then C≅⊕_mC_m in D(A), T_m acts on C_m, and H^i(C_m)≅H^i(C)_m.

API: `HeckeImage.localizedComplex`: C_m is the image of the idempotent e_m in D(A); `HeckeImage.localizedComplex_homology`: H^i(C_m)=e_mH^i(C)≅H^i(C)_m; `HeckeImage.localizedComplex_decomposition`: The sum of splitting inclusions gives ⊕_mC_m≅C.

Tests: If H^*(C)_m=0 then C_m=0. For T=A×A acting diagonally on C=A⊕A in degree zero, the two summands are the two copies of A. For C=M in degree zero, C_m is the usual module localization M_m in degree zero.

Uses: [Idempotent completeness of the module derived category](#target38), [Local factors over a complete coefficient ring](#target46). Sources: [ACC](#ref-acc23), §1.2, p.905.

<a id="target48"></a>

**Support detected by localized cohomology.** In the preceding situation, C_m=0 iff H^i(C)_m=0 for every i. Thus the support of the derived object over T is the union of the supports of its cohomology modules.

Uses: [Localized summands of a derived Hecke action](#target47). Sources: [ACC](#ref-acc23), §1.2, p.905.

<a id="target49"></a>

**Annihilator power on a bounded complex.** If C has cohomology in [a,b] and an ideal I of a commutative acting algebra H annihilates every H^i(C), then I^(b−a+1) annihilates C in D(A).

Uses: [Amplitude bound for ghost nilpotence](#target44). Sources: [ACC](#ref-acc23), Lemma 2.2.4, p.920.

### Operator localization and ordinary parts

<a id="target66"></a>

**Factorial powers of a finite operator.** Let A be a complete noetherian local ring with finite residue field, T a finite commutative A-algebra and t∈T. The powers t^{n!} converge adically to the idempotent e_t that is 1 on each local factor where t is a unit and 0 where t lies in the maximal ideal. This requires finiteness of the residue field; for an infinite field a unit need not have convergent factorial powers.

Uses: [Local factors over a complete coefficient ring](#target46). Sources: [Calegari–Geraghty 2018](#ref-cg18), §7.1, pp.72–73.

<a id="target67"></a>

**Operator localization as a derived summand.** For C with bounded finite cohomology over an artinian local A and t acting through a finite commutative algebra T, define C[t^{-1}] as the mapping telescope of repeated t. It is the idempotent summand e_tC supported at the maximal ideals where t is a unit; its cohomology is H^i(C)[t^{-1}]. If C is perfect, so is this summand.

API: `HeckeImage.operatorLocalization`: The telescope of C under repeated t; `HeckeImage.operatorLocalization_homology`: H^i(C[t^{-1}])≅H^i(C)[t^{-1}]; `HeckeImage.operatorLocalization_idempotent`: If e commutes with t, t is invertible on the e-summand and t is nilpotent on the complementary summand, then C[t^{-1}]≅eC.

Tests: If t^r=0 on C, its localization is zero. If t is an automorphism, its localization is C. For T=A×A and t=(1,0), localization selects the first summand.

Uses: [Localized summands of a derived Hecke action](#target47). Sources: [Calegari–Geraghty 2018](#ref-cg18), Lemma 7.3, p.72.

<a id="target68"></a>

**Ordinary part of a bounded finite complex.** For artinian local A and C with bounded finite cohomology, the ordinary localization C⊗_{A[T]}A[T,T^{-1}] is e_TC, with the complementary summand killed by a power of T. Its cohomology is the ordinary direct factor of H^i(C). The solid analytic localization of BP26 agrees on these discrete finite objects.

For a finite module over an artinian coefficient ring, the complementary factor is genuinely nilpotent and its telescope vanishes. Over a complete local ring topological nilpotence alone is insufficient: the telescope of multiplication by p on ℤₚ is ℚₚ.

Uses: [Operator localization as a derived summand](#target67). Sources: [Boxer–Pilloni](#ref-bp26), Definition 2.4.2 and Lemma 2.4.3, p.18.

<a id="target69"></a>

**Ordinary finiteness with a bounded finite factor.** Let A be artinian local and T=vu:M→M factor through u:M→C, v:C→M with C having bounded finite cohomology. Put U=uv on C. Then the induced maps on operator localizations identify M[T^{-1}]≅C[U^{-1}], so the ordinary cohomology of M is finite and bounded. The boundedness of C is required when invoking BP26 Lemma 2.4.3 in the proof of Lemma 2.4.6.

Uses: [Ordinary part of a bounded finite complex](#target68). Sources: [Boxer–Pilloni](#ref-bp26), Lemma 2.4.6 and proof, p.19.

<a id="target70"></a>

**Large-prime finite Hecke completion.** Let H be a finite torsionfree Z[1/M]-module carrying a commuting Hecke algebra T⊂End(H). Assume T_Q is a finite product of number fields acting semisimply and the relevant eigenvalue systems are integral in a common splitting order. Outside finitely many rational primes, the order has no congruences between distinct eigencharacters and is étale. After an unramified splitting coefficient extension O, the completion of the finite image at one residual eigencharacter is O. The torsionfree, semisimple and no-congruence hypotheses are retained; this is not a claim for every prime or every derived Hecke image.

Pass from a finite Hecke order to its normalization after inverting its discriminant and denominator primes. Separate distinct eigensystems outside this finite set and choose an unramified splitting coefficient ring before computing the local completion.

Uses: [Local factors over a complete coefficient ring](#target46). Sources: [Calegari–Geraghty–Harris](#ref-cgh20), §3 opening and proof of Lemma 3.1, pp.4–5.

## IHG.3b — Residual maximal ideals of Galois type

Return to the residual part of IHG.3 after field reconstruction. Its predicates refer to an actual continuous semisimple representation with the displayed Frobenius polynomials, and duality transports that same representation.

<a id="target64"></a>

**Maximal ideals of Galois type.** For a spherical Hecke algebra T away from a fixed finite ramification set S, a maximal ideal m of finite residue field is of Galois type if there exists a continuous semisimple ρ_m:G_{F,S}→GL_n(T/m) with the specified Frobenius polynomial at every v∉S. It is non-Eisenstein when this representation is absolutely irreducible. Existence is an input from the geometric owner; the definition does not declare every ideal to have Galois type.

API: `Spherical.IsGaloisType`: The residue representation, finite residue field and Frobenius identities specified above; `Spherical.IsNonEisenstein`: The same continuous semisimple residue representation realizing the given Frobenius polynomials is absolutely irreducible; `Spherical.galoisType_unique`: Continuous determinants agreeing on a conjugacy-dense Frobenius family over Hausdorff coefficients are equal; semisimple reconstruction then identifies the residue representations after a common algebraic closure.

Tests: A rank-one unramified reciprocity character with T_1 values supplies a Galois-type system. A sum of two characters gives Galois type but fails non-Eisenstein. A character twist preserves absolute irreducibility and scales the i-th coefficient by θ(F_v)^i.

Uses: [Integral GLn Hecke polynomial](#target50), [Semisimple reconstruction of field determinants](#target139). Sources: [ACC](#ref-acc23), Definition 2.3.6, p.938.

<a id="target65"></a>

**Dual and twist compatibility for Galois-type ideals.** In ACC23 geometric conventions, ι sends a Galois-type ideal m to m∨ with residual representation ρ_m∨⊗ε^{1−n}; the character automorphism f_ψ sends m to m(ψ) with residual representation ρ_m⊗ψ. Both preserve the non-Eisenstein property.

Uses: [Maximal ideals of Galois type](#target64), [Inversion of spherical double cosets](#target56), [Characteristic polynomial under a character twist](#target53). Sources: [ACC](#ref-acc23), After Definition 2.3.6, p.938.

## IHG.4 — Interpolation over integral coefficient rings

A dense Frobenius identity determines a continuous determinant. Existence over an integral or nonreduced coefficient ring additionally needs integral gluing or uniform finite-quotient witnesses. The limits keep one fixed ramification set.

<a id="target71"></a>

**Uniqueness from Frobenius density.** Let A be Hausdorff and D_1,D_2 continuous degree-d determinants of G_{F,S}. If all characteristic-polynomial coefficients agree on Frobenius conjugacy classes outside S, they agree on G_{F,S}, hence D_1=D_2. Use Chebotarev on every finite quotient and conjugacy invariance; a set of chosen representatives need not itself be dense before taking conjugates.

Uses: [Continuous determinants](#target28), [Chebotarev, layer 10][chebotarev10]. Sources: [Scholze](#ref-sch15), Corollary 5.1.10 and its use of Chenevier Example 2.32, p.1037.

<a id="target72"></a>

**Compact coefficient-ring gluing.** Let G be compact, A compact Hausdorff, all A_i Hausdorff, and ι:A→∏A_i a continuous injective ring map. Let D_i be continuous degree-d determinants. If for each g in a dense subset X⊂G the tuple of characteristic polynomials lies in ι(A)[X], there is a unique continuous determinant D over A with D⊗A_i=D_i. The compact closed embedding gives integrality on all G; an injective map without closed image does not suffice.

Extend membership of characteristic coefficients in the closed coefficient subring from the conjugacy-dense subset to every group element. The integral Amitsur coefficient formula then descends the full law.

Uses: [Continuous determinants](#target28), [A determinant descends to the subring of its coefficients](#target27). Sources: [Chenevier](#ref-chenevier-det), Example 2.32, p.38.

<a id="target73"></a>

**Gluing over an intersection of quotient ideals.** Let A/(I∩J), A/I and A/J be Hausdorff topological rings, with A/(I∩J) compact and its canonical maps to A/I and A/J continuous. Continuous degree-d determinants over A/I and A/J glue uniquely and continuously over A/(I∩J) when their characteristic-polynomial tuples belong to the image on a dense subset of a compact group G. Agreement merely after killing the nilradical does not give this image condition.

Assumptions: The product A/I×A/J is Hausdorff and the injective diagonal quotient map is continuous.

Uses: [Compact coefficient-ring gluing](#target72). Sources: [Scholze](#ref-sch15), Proof of Corollary 5.1.11, p.1038.

### Finite-quotient witnesses and interpolation

<a id="target74"></a>

**Compatible finite-quotient determinants.** For a profinite group G and a separated complete ring A≅lim_rA/J_r with a descending cofinal system of open ideals and finite quotients, finite-quotient determinant data consist of continuous degree-d determinants D_r over A/J_r, compatible under coefficient reduction. Each D_r factors through some finite G/U_r; the U_r can be refined to be descending. No common U is required.

API: `Interpolation.FiniteQuotientData`: A family D_r and equality of their reductions for r≤s; `Interpolation.FiniteQuotientData.reduce`: Reduction of D_s to A/J_r equals D_r; `Interpolation.FiniteQuotientData.refineGroup`: Replace U_r by a smaller normal open subgroup without changing the induced determinant.

Tests: If A is finite and J_r=0, a fixed continuous determinant gives a constant compatible family. A continuous matrix representation over A gives its determinants modulo every J_r. Two rank-one characters differing after reduction at one level cannot form compatible data.

Uses: [Continuity is openness of the kernel](#target30). Sources: [Chenevier](#ref-chenevier-det), Lemma 3.2, p.41.

<a id="target75"></a>

**Determinant from a compatible inverse limit.** For compatible finite-quotient data on A≅lim A/J_r, there is a unique continuous degree-d determinant on A[G] with reductions D_r. Use the multiplicative-law representing algebra over Z and the universal property of the inverse limit, so arbitrary scalar-algebra evaluations are obtained naturally, rather than assuming tensor products commute with inverse limits.

Use representability of determinant laws to take the limit of coefficient algebra maps. Do not identify a tensor product with an inverse limit of tensor products without a separate comparison theorem.

API: `Interpolation.inverseLimitDeterminant`: The continuous determinant whose reductions are the given D_r; `Interpolation.inverseLimitDeterminant_reduce`: Its reduction to A/J_r equals D_r; `Interpolation.inverseLimitDeterminant_unique`: Every continuous determinant with these reductions equals it.

Tests: Compatible characters G→(Z/p^r)× produce the character G→Z_p×. The construction retains nilpotent coefficients in a complete nonreduced A. For a constant finite quotient system, the inverse-limit determinant is the original law.

Uses: [Compatible finite-quotient determinants](#target74), [Roby algebra of multiplicative laws](#target112). Sources: [Chenevier](#ref-chenevier-det), Lemma 3.2, p.41.

<a id="target76"></a>

**Uniform congruence witnesses for classical systems.** For each quotient A/J_r, a congruence witness is a finite family of classical continuous determinants over coefficient rings B_{r,i}, an injective closed ring map A/J_r→∏B_{r,i}, and the assertion that the tuple of every Frobenius characteristic-polynomial coefficient lies in its image. Witnesses include a uniform modulus and compatibility between quotient levels. Geometric density supplies a witness only if it proves these integral congruences.

API: `Interpolation.CongruenceWitness`: A single quotient-level witness carries compact Hausdorff coefficients, Hausdorff classical coefficient rings, continuous coefficient embeddings and classical determinants, conjugacy-dense Frobenius, injectivity and coefficient membership. The cross-level uniform modulus remains geometric input; `Interpolation.CongruenceWitness.determinant`: Apply gluing to obtain D_r over A/J_r; `Interpolation.CongruenceWitness.compatible`: Under levelwise congruence compatibility, reductions of the D_r agree by Frobenius uniqueness; `Interpolation.CongruenceWitness.determinant_continuous`: The glued determinant is continuous; `Interpolation.CongruenceWitness.determinant_classical`: Every coefficient extension of the glued determinant equals the prescribed classical determinant as a whole law.

Tests: One classical determinant already over A/J_r gives the identity embedding witness. Compatible systems over A/I and A/J give the intersection-quotient witness. All field points of k[ε]/ε² see ε as zero; they cannot certify a coefficient ε or a nilpotent perturbation integrally.

Uses: [Compatible finite-quotient determinants](#target74), [Compact coefficient-ring gluing](#target72), [Integral GLn Hecke polynomial](#target50). Sources: [Scholze](#ref-sch15), Corollary 5.1.11 and the topology of Tcl, p.1038.

<a id="target77"></a>

**Integral interpolation with uniform congruences.** A compatible system of uniform congruence witnesses for A/J_r produces a continuous degree-d determinant over A with the prescribed Frobenius polynomials, unramified outside the fixed S. It is unique. Characteristic-zero density alone does not supply the witnesses when A is nonreduced.

Uses: [Uniform congruence witnesses for classical systems](#target76), [Determinant from a compatible inverse limit](#target75), [Uniqueness from Frobenius density](#target71). Sources: [Scholze](#ref-sch15), Corollary 5.1.11 and Lemma 3.2 of Chenevier, p.1038.

<a id="target78"></a>

**Extension to the completed group algebra.** For A profinite and G profinite, compatible continuous determinants on finite (A/J_r)[G/U] extend to the completed group algebra A[[G]]=lim_{r,U}(A/J_r)[G/U]. On a complete profinite coefficient algebra B, the evaluation uses the completed tensor product and equals the inverse limit of the finite-level polynomial laws. Its restriction to A[G] is the determinant constructed above.

Use the finite-quotient comparison from PadicMeasuresIwasawaAlgebras:L1 to specify the completed coefficient tensor functor and its naturality. The ordinary group-algebra law alone does not determine a completed evaluation without that interface.

Uses: [Determinant from a compatible inverse limit](#target75), `PadicMeasuresIwasawaAlgebras:L1`. Sources: [Chenevier](#ref-chenevier-det), Lemma 2.33 and Lemma 3.2, pp.38, 41.

<a id="target79"></a>

**Coefficient change in interpolation.** For a continuous homomorphism of separated complete coefficient rings f:A→B compatible with their quotient systems, coefficient extension of the interpolated determinant equals interpolation of the pushed-forward quotient determinants, whenever the latter quotient data are supplied.

Uses: [Determinant from a compatible inverse limit](#target75), [Scalar extension of determinants](#target9). Sources: [Chenevier](#ref-chenevier-det), Lemma 3.2, p.41.

<a id="target80"></a>

**Hecke level change in interpolation.** If a continuous Hecke algebra homomorphism A_K→A_L transports every unramified T_{v,i}, and both systems satisfy the fixed-S interpolation hypotheses, it transports D_K to D_L. The actual level map and congruence witness are provided by the geometric owner.

Uses: [Integral interpolation with uniform congruences](#target77). Sources: [Scholze](#ref-sch15), Corollary 5.1.11, p.1038.

<a id="target81"></a>

**Fixed ramification set in coefficient limits.** If every D_r factors through G_{F,S}, the inverse-limit determinant does so; no extra ramification is introduced by the coefficient limit. This does not prove that a classical source is uniformly unramified outside S.

Uses: [Determinant from a compatible inverse limit](#target75). Sources: [Chenevier](#ref-chenevier-det), Lemma 3.2, p.41.

<a id="target82"></a>

**Failure of field-point integrality on nilpotents.** In A=k[ε]/ε², every field-valued point kills ε. Thus field-valued characteristic-polynomial data cannot distinguish two laws differing in an ε coefficient. For G=Z and rank one, g↦1 and g↦1+ε are distinct determinants with identical reductions at every field point.

Uses: [One-dimensional determinants are algebra homomorphisms](#target10). Sources: [Chenevier](#ref-chenevier-det), §2.24, determinants over dual numbers, p.35.

## IHG.5 — Quantified nilpotent comparison

A Hecke comparison supplies a specific error ideal and a uniform exponent. The resulting determinant lives over the quotient by that ideal; reconstruction does not remove its nilpotent error. Track exponents through extensions, sums, products, filtrations and limits.

<a id="target83"></a>

**Determinant from a quantified Hecke comparison.** Let f:T→B be a continuous homomorphism with kernel J, J^N=0, and T/J compact Hausdorff embedded in Hausdorff B. Suppose an actual continuous degree-d determinant over B is supplied and its characteristic-polynomial coefficients belong to f(T) on the dense Frobenius classes. Then it descends uniquely to T/J. The theorem concludes a determinant only in T/J; it supplies neither the geometric comparison nor a lift to T.

Uses: [Compact coefficient-ring gluing](#target72), [Uniqueness from Frobenius density](#target71). Sources: [Scholze](#ref-sch15), Proof of Theorem 5.4.1, pp.1058–1059.

<a id="target84"></a>

**Functoriality of nilpotent descent.** If f:T→T′ sends J into J′ and transports the specified Frobenius coefficients, then the determinant over T/J extends to the determinant over T′/J′. Keep both quotient maps in the conclusion.

Uses: [Determinant from a quantified Hecke comparison](#target83). Sources: [Scholze](#ref-sch15), Theorem 5.4.1 and Corollary 5.4.4, pp.1058–1060.

<a id="target85"></a>

**Nilpotence through a quotient extension.** For ideals K⊂J in a ring, if K^a=0 and (J/K)^b=0, with a,b≥1, then J^{ab}=0. Equivalently, J^b⊂K implies the displayed bound. This multiplicative bound differs from the additive module-filtration bound.

Uses: `Ideal`. Sources: [Scholze](#ref-sch15), Proof of Theorem 5.4.1, p.1059.

<a id="target86"></a>

**Nilpotence of sums of commutative ideals.** For ideals I,J of a commutative ring with I^a=0 and J^b=0, (I+J)^{a+b−1}=0. For a finite sum, the exponent is 1+∑(a_i−1).

Uses: [Nilpotence through a quotient extension](#target85). Sources: [Scholze](#ref-sch15), Proof of Theorem 5.4.1, combination of error ideals, pp.1058–1060.

<a id="target87"></a>

**Nilpotence in a product of coefficient rings.** If I_i^{N_i}=0 in finitely many rings A_i, the product ideal ∏I_i in ∏A_i has power max_i N_i equal to zero. Its inverse image under an injection has the same bound.

Uses: `Ideal`. Sources: [Scholze](#ref-sch15), Proof of Theorem 5.4.1, p.1059.

<a id="target88"></a>

**Error ideal on a filtered module.** If J^a kills a submodule M′ and J^b kills M/M′, then J^{a+b}M=0. In particular, an endomorphism of M acting as zero on both factors maps M into M′ and kills M′, so the comparison kernel on the two factors is square-zero.

Uses: `Submodule`. Sources: [Scholze](#ref-sch15), Proof of Theorem 5.4.1, p.1059.

<a id="target89"></a>

**Quantified composition of Hecke error ideals.** Suppose a Hecke comparison T→T_1×T_2 has kernel K with K^a=0 and supplied error ideals J_i^{b_i}=0. The kernel J of T→T_1/J_1×T_2/J_2 satisfies J^{a max(b_1,b_2)}=0. For a two-step cohomology filtration the source comparison kernel has a=2; for a derived-to-cohomology comparison, use its amplitude exponent.

Uses: [Nilpotence through a quotient extension](#target85), [Nilpotence in a product of coefficient rings](#target87), [Error ideal on a filtered module](#target88), [Amplitude bound for ghost nilpotence](#target44). Sources: [Scholze](#ref-sch15), Proof of Theorem 5.4.1, pp.1058–1060.

<a id="target90"></a>

**Uniform nilpotence in an inverse limit.** If J_r⊂A/J_r′ are compatible error ideals with the same bound J_r^N=0, the inverse-limit error ideal J⊂A satisfies J^N=0 by separatedness. Bounds increasing with r do not imply a nilpotent limit.

Uses: [Determinant from a compatible inverse limit](#target75). Sources: [Scholze](#ref-sch15), Corollary 5.4.2, footnote 29, p.1060.

<a id="target91"></a>

**Residual semisimple specialization.** For a determinant over T/J and a maximal ideal m⊂T with J nilpotent, base change gives a residual determinant over T/m. Over an algebraic closure it determines a unique semisimple degree-d representation up to isomorphism, continuous with finite image when the residue field is discrete and the determinant is continuous.

Uses: [Determinant from a quantified Hecke comparison](#target83), [Semisimple reconstruction of field determinants](#target139), [Discrete continuity of reductive reconstruction](#target178). Sources: [Scholze](#ref-sch15), Corollary 5.4.3, p.1060.

<a id="target92"></a>

**Representation over the nilpotent quotient.** Let T/J be henselian local and its determinant be residually split absolutely irreducible of degree d. The Cayley–Hamilton algebra is M_d(T/J), giving a representation over T/J up to conjugation. A representation over T is not asserted, and residual reducibility does not satisfy the hypothesis.

Uses: [Determinant from a quantified Hecke comparison](#target83), [Henselian irreducible reconstruction](#target146). Sources: [Scholze](#ref-sch15), Corollary 5.4.4, p.1060.

<a id="target93"></a>

**Local conditions and change of lattice.** For a supplied integral block lattice giving a cocycle c:G→M(χ/ψ), the restriction to H is a coboundary exactly when there is y∈M with c(h)=((χ/ψ)(h)−1)y for all h∈H. A lattice change inducing a G-equivariant module map transports the class and these restrictions; a diagonal rescaling multiplies the off-diagonal cocycle by the corresponding ratio. No invariance of Fitting ideals is asserted for nonisomorphic lattice modules.

Uses: [Classical Ribet lattice](#target159), `ArithmeticGaloisDuality:R02.1`. Sources: [DKSW](#ref-dksw23), Theorem 2.1, conditions (ii)–(iv), pp.2–3, 7–8.

## IHG.6 — Integral Ribet modules and Fitting ideals

Construct the cocycle module and its local quotient, then prove the weighted Fitting containment through stabilized relation minors. The proof uses integral scheme invariants and two explicit relation complexes, with generic regularity providing exactness only for the upper-entry complex. Assemble the local and global extension theorems last.

<a id="target94"></a>

**Zeroth Fitting ideal.** For a commutative ring A and a finitely generated A-module M, Fitt₀_A(M) is the ideal generated by all n×n determinants of n relation vectors in the kernel of a chosen surjection A^n→M. The definition permits infinitely many relations and is independent of the chosen finite generating family.

API: `Fitting.zero`: The zeroth Fitting ideal of a finite module; `Fitting.mem_of_relations`: For n generators of M and n relations, their determinant belongs to Fitt₀(M); `Fitting.baseChange`: For any A→B, Fitt₀_B(B⊗_A M)=Fitt₀_A(M)B.

Tests: Fitt₀_Z(Z/6Z)=(6). Fitt₀_A(0)=A, whereas Fitt₀_A(A)=0 for A≠0. For M=(Z/6Z)², Fitt₀_Z(M)=(36), strictly smaller than Ann_Z(M)=(6).

Uses: `Submodule.mkQ`, `Matrix.det`. Sources: [DKSW](#ref-dksw23), §2.2, pp.10–11.

<a id="target184"></a>

**Presentation independence of maximal-minor ideals.** The ideal of maximal relation minors for a finite generating surjection A^n→M is unchanged by adding a redundant generator and its defining relation, changing the generating basis or changing the relation generators. It therefore depends only on M.

Uses: [Zeroth Fitting ideal](#target94). Sources: [DKSW](#ref-dksw23), §2.2, pp.10–11.

<a id="target185"></a>

**Fitting ideal annihilates a finite module.** For finite M over commutative A, Fitt₀_A(M)⊆Ann_A(M). Equality is not asserted.

Uses: [Presentation independence of maximal-minor ideals](#target184). Sources: [DKSW](#ref-dksw23), Introduction, p.5.

<a id="target186"></a>

**Fitting ideals under scalar extension.** For every A→B and finite A-module M, Fitt₀_B(B⊗_AM)=Fitt₀_A(M)B. In particular Fitt₀_(A/J)(M/JM) is the image of Fitt₀_A(M).

Uses: [Presentation independence of maximal-minor ideals](#target184). Sources: [DKSW](#ref-dksw23), Introduction, p.5; §2.2.

### Character differences and the Ribet cocycle

<a id="target95"></a>

**Character congruence on the group algebra.** Let A be commutative, J an ideal, ρ:G→GL₂(B) an A-linear representation and χ,ψ:G→Aˣ characters. If tr(ρ(g)) and det(ρ(g)) lie in A and reduce to χ(g)+ψ(g) and χ(g)ψ(g) modulo J for every g, then for every t∈A[G] the characteristic polynomial of ρ(t) lies in A[X] and reduces to (X−χ(t))(X−ψ(t)) modulo J.

Uses: [Amitsur's formula for determinants](#target12). Sources: [DKSW](#ref-dksw23), §2.1, equation (13), p.8.

<a id="target96"></a>

**Character difference modules.** For an A-algebra representation ρ:A[G]→M₂(B) and a character ψ:A[G]→A, define Δψ as the range of the A-linear map t↦ρ(t)−ψ(t)I₂. For χ,ψ define ΔχΔψ as the A-span of all products of their elements.

API: `IntegralRibet.differenceModule`: Δψ is the range of the A-linear difference map on A[G]; `IntegralRibet.differenceModule_generators`: Δψ is generated by ρ(g)−ψ(g)I₂ for g∈G; `IntegralRibet.differenceProduct`: The ambient product submodule is the span of x*y, x∈Δχ,y∈Δψ.

Tests: If ρ(g)=ψ(g)I₂ and χ=ψ, then Δψ=0. For the trivial group and the trivial scalar representation, Δψ=0. For G=Z, A=B=Z and ρ(n)=[[1,n],[0,1]], χ=ψ=1, Δψ=Z E₁₂, ΔχΔψ=0.

Uses: `MonoidAlgebra`, `Matrix`, `Submodule`. Sources: [DKSW](#ref-dksw23), §2.1, equation (14), pp.8–9.

<a id="target97"></a>

**Product containment of difference modules.** For the preceding algebra maps, ΔχΔψ⊆Δψ.

Uses: [Character difference modules](#target96). Sources: [DKSW](#ref-dksw23), §2.1, p.9.

<a id="target246"></a>

**Initial Ribet quotient module.** Define M₀=Δψ/(ΔχΔψ), interpreting the product submodule inside Δψ by the preceding containment. The classes of ρ(g)−ψ(g)I₂ generate M₀.

API: `IntegralRibet.initialModule`: M₀ is the stated quotient module; `IntegralRibet.initialModule_mk`: The quotient map from Δψ to M₀; `IntegralRibet.initialModule_generators`: The group-element difference classes generate M₀.

Tests: For ρ=ψI₂ and χ=ψ, M₀=0. For the integral upper-unipotent representation of Z and χ=ψ=1, M₀≅Z. An A-linear map Δψ→L factors uniquely through M₀ iff it annihilates every product (ρ(t)−χ(t))(ρ(u)−ψ(u)).

Uses: [Product containment of difference modules](#target97). Sources: [DKSW](#ref-dksw23), §2.1, equation (14), p.9.

<a id="target98"></a>

**Canonical Ribet cocycle.** For the preceding modules define α=χψ⁻¹ and κ₀(g)=ψ(g)⁻¹[ρ(g)−ψ(g)I₂] in M₀. It is a one-cocycle for the scalar action α: κ₀(gh)=κ₀(g)+α(g)κ₀(h).

API: `IntegralRibet.canonicalCocycle`: The cocycle κ₀ with scalar action χψ⁻¹; `IntegralRibet.canonicalCocycle_apply`: κ₀(g)=ψ(g)⁻¹[ρ(g)−ψ(g)I₂]; `IntegralRibet.canonicalCocycle_span`: The A-span of κ₀(G) is all M₀.

Tests: κ₀(1)=0. For the integral upper-unipotent representation of Z with χ=ψ=1, κ₀(n)=n in M₀≅Z. The underlying function satisfies the continuous cochain API’s twisted cocycle equation, with α(g), rather than α(h), multiplying κ₀(h).

Uses: `ArithmeticGaloisDuality:R02.1`, [Initial Ribet quotient module](#target246). Sources: [DKSW](#ref-dksw23), Lemma 2.3 and proof, p.9.

<a id="target99"></a>

**Ribet module with local conditions.** Given a finite partition S=Σ⊔P of subgroups G_v⊆G, inertia subgroups I_v⊆G_v for v∈P, and v₀∈Σ when Σ is nonempty, form N₀=M₀⊕⊕_(v∈Σ\{v₀}) A y_v. Let Q be generated by κ₀(G_v₀), by κ₀(g)−(α(g)−1)y_v for g∈G_v and v∈Σ\{v₀}, and by κ₀(I_v), v∈P. Define N=N₀/Q and κ as the image of κ₀. When Σ is empty there is no v₀ relation and no y_v.

API: `IntegralRibet.localModule`: N is the quotient of M₀ with the adjoined coboundary vectors; `IntegralRibet.localCocycle`: The image κ of κ₀ in N; `IntegralRibet.localCocycle_restriction`: κ|G_v₀=0, κ(g)=(α(g)−1)y_v on the other Σ subgroups, and κ|I_v=0 for v∈P; `IntegralRibet.localModule_span`: N is generated by κ(G) together with the y_v.

Tests: For S=∅, N=M₀ and κ=κ₀. For Σ={v₀}, G_v₀=G and P=∅, N=0. For scalar ρ=ψI₂, χ=ψ, Σ={v₀,v₁} and both subgroups trivial, M₀=0 but N≅A y_v₁; the cocycle alone does not generate N.

Uses: [Canonical Ribet cocycle](#target98). Sources: [DKSW](#ref-dksw23), §2.1, pp.9–10, with the sign corrected to Theorem 2.1.

<a id="target100"></a>

**Finite and continuous Ribet modules.** Under Theorem 2.1’s complete noetherian inclusion T⊆T̃ and total-fraction-ring hypotheses, a continuous compact representation ρ has Δψ and Δχ contained in a finitely generated T-submodule of M₂(K). Therefore Δψ, M₀ and N are finite T-modules, and the displayed cocycles are continuous for their quotient adic topologies.

Establish a finite T-lattice by the T-valued trace pairing on the character algebra and identify the quotient adic topology. Bounded denominators over T̃ do not prove finite generation over T when T̃ is not finite over T.

Uses: [Ribet module with local conditions](#target99). Sources: [DKSW](#ref-dksw23), §2.1, p.9.

<a id="target101"></a>

**Every cocycle representative generates.** Let (T,m) be local, M a finite T-module and α:G→Tˣ with α(g)≡1 modulo m. If a cocycle κ has T-span M, every cohomologous cocycle κ′(g)=κ(g)+(α(g)−1)y also has T-span M.

Uses: `ArithmeticGaloisDuality:R02.1`. Sources: [DKSW](#ref-dksw23), Theorem 1.1 and §2.1, pp.3,9.

<a id="target102"></a>

**Ribet theory for distinct residual characters.** Under Theorem 1.1’s hypotheses with χ≢ψ modulo m, choose τ with χ(τ)−ψ(τ) a unit and diagonalize ρ(τ) using its two Henselian roots. Let B be the finite T-module generated by upper-right matrix entries b(g). Then κ(g)=ψ(g)⁻¹b(g) modulo IB is a continuous cocycle, every representative generates B/IB, B is faithful and Fitt₀_T(B/IB)⊆I.

Choose a residual character separator, lift its two spectral roots henselianly, and control the products of opposite off-diagonal entries. Use the upper-entry lattice in that basis and its separate local-condition calculation.

Uses: [Zeroth Fitting ideal](#target94), [Character congruence on the group algebra](#target95), `ArithmeticGaloisDuality:R02.1`, [Henselian lifting of matrix units](#target143). Sources: [DKSW](#ref-dksw23), Introduction, pp.4–5.

### Relation minors and the auxiliary matrices

<a id="target187"></a>

**Five types of Ribet module relations.** Choose ρ_i=ρ(g_i)−ψ(g_i) spanning Δψ and adjoin y_v. A presentation of N has: (I) linear relations among ρ_i; (II) coefficients δ_ijk from (ρ_i+ν_i)ρ_j=∑δ_ijkρ_k; (III) coefficients of ρ(σ)−ψ(σ), σ∈G_v₀; (IV) those for σ∈I_v; (V) those for σ∈G_v together with ψ(σ)−χ(σ) in the y_v column. Here ν_i=ψ(g_i)−χ(g_i).

Uses: [Ribet module with local conditions](#target99), [Zeroth Fitting ideal](#target94). Sources: [DKSW](#ref-dksw23), §2.2, equations (18)–(24), pp.10–11.

<a id="target188"></a>

**Stabilization of local relation rows.** Adding each locally appearing ρ(σ)−ψ(σ) as a new generator, with a defining relation and a pivot row, changes the presentation but preserves its square relation determinant up to a chosen row/column ordering sign. Local rows then have one pivot and at most one y_v entry.

Uses: [Five types of Ribet module relations](#target187), [Presentation independence of maximal-minor ideals](#target184). Sources: [DKSW](#ref-dksw23), §2.3, pp.11–12.

<a id="target189"></a>

**Weighted auxiliary matrix.** For a stabilized square relation matrix D and local choices σ_v, adjoin a block upper-triangular matrix E with diagonal z_v=ξ_v(σ_v)−χ(σ_v). Then detE=(∏_vz_v)detD.

Uses: [Stabilization of local relation rows](#target188). Sources: [DKSW](#ref-dksw23), §2.4, equation (28), p.12.

<a id="target190"></a>

**Kernel vector for the altered matrix.** The altered matrix E′ of DKSW23 §2.4 has, on each principal artinian local factor K_i, a kernel vector with a unit coordinate. If all local D_v are units, its entries are −B_v/D_v, the b_i and −B_w/D_w. Otherwise multiply by a maximal power of the principal maximal-ideal generator and normalize the corresponding local D_v.

Uses: [Weighted auxiliary matrix](#target189). Sources: [DKSW](#ref-dksw23), Lemma 2.4 and proof, pp.13–14.

<a id="target191"></a>

**Vanishing of the altered determinant.** With the source total-fraction-ring hypotheses, detE′=0 in K.

Uses: [Kernel vector for the altered matrix](#target190). Sources: [DKSW](#ref-dksw23), Lemma 2.4, pp.13–14.

<a id="target192"></a>

**Trace congruences for difference words.** For a noncommutative polynomial f(X₁,…,X_r) with zero constant term, tr f(ρ₁,…,ρ_r)≡f(−ν₁,…,−ν_r) modulo I. Also det(Δψ)⊂I. These are integral rank-two identities.

Uses: [Character congruence on the group algebra](#target95). Sources: [DKSW](#ref-dksw23), Lemmas 2.5–2.6, pp.15–16.

### Formal matrix algebra and invariant error

<a id="target193"></a>

**Formal Ribet matrix ring.** For a fixed finite relation minor, let R₀=Z[ν_i,ε_(row,i),δ_(row,ijk),x_σ] with distinct variables for each selected relation. Let R₁=R₀[a_i,b_i,c_i,d_i] and R=R₁/(b_σ:σ∈B_v₀). The matrices X_i=[[a_i,b_i],[c_i,d_i]] have a B=lower-GL₂/Z conjugation coaction, with R₀ trivial. Evaluation π:R→K sends all variables to the chosen relation coefficients, differences and local diagonal values.

API: `IntegralRibet.formalRing`: R with distinct row-indexed coefficient variables; `IntegralRibet.formalRing_eval`: The evaluation algebra map π determined by the relation data; `IntegralRibet.formalRing_borel`: The integral lower-Borel conjugation coaction.

Tests: With no matrices or relation variables, R=Z. With one matrix and no v₀ constraint, R=Z[a,b,c,d] apart from R₀ variables. Imposing b=0 gives Z[a,c,d], whose lower-Borel torus fixes a,d and weights c.

Uses: [Five types of Ribet module relations](#target187). Sources: [DKSW](#ref-dksw23), §3.1, equations (35)–(37), pp.17–18.

<a id="target194"></a>

**Formal Ribet relation ideals.** In the formal ring R let J be generated by the four entries of each linear relation matrix, each product relation (X_i+ν_i)X_j−∑δ_ijkX_k, and each local matrix [[A_στ,B_στ],[C_στ,D_στ]]. Here A_στ=b_σc_τ−(x_τ−d_τ)(x_σ−a_σ), B_στ=b_σ(x_τ−a_τ)−b_τ(x_σ−a_σ), C_στ=c_σ(x_τ−d_τ)−c_τ(x_σ−d_σ), D_στ=A_τσ. Let J′⊂J be generated only by their b entries.

API: `IntegralRibet.relationIdeal`: The full four-entry ideal J; `IntegralRibet.upperRelationIdeal`: The b-entry subideal J′; `IntegralRibet.upperRelationIdeal_le`: J′⊂J; `IntegralRibet.relationIdeal_stable`: J and J′ are lower-Borel stable.

Tests: With no selected relation rows or local pairs, J=J′=0. For ε₁X₁+ε₂X₂, J has four scalar coefficients and J′ is (ε₁b₁+ε₂b₂). B_στ=−B_τσ and D_στ=A_τσ; in characteristic two the alternating relation still has B_σσ=0.

Uses: [Formal Ribet matrix ring](#target193). Sources: [DKSW](#ref-dksw23), §3.2 equations (39)–(42); §4.5, pp.18–19,29.

<a id="target195"></a>

**Evaluation annihilates the formal relation ideal.** For the chosen integral relation coefficients and local triangularizations, π(J)=0.

Uses: [Formal Ribet relation ideals](#target194). Sources: [DKSW](#ref-dksw23), Lemma 3.1, p.19.

<a id="target196"></a>

**Trace and determinant invariant subring.** In R let A₀ be the image of the R₀-subalgebra of R₁ generated by tr f(X_i), det f(X_i) for all noncommutative polynomials f. Let A=A₀[d_τ:τ∈B_v₀]. This is the lower-Borel invariant subring after the specified upper-entry quotient.

API: `IntegralRibet.invariantSubring`: A=R₀[trace/determinant words,d_τ]; `IntegralRibet.trace_mem_invariantSubring`: Every word trace lies in A; `IntegralRibet.invariantSubring_eq_borel`: A=H⁰(B,R), with rational scheme cohomology.

Tests: Before triangular constraints, invariants of one 2×2 matrix are generated by a+d and ad−bc. With b=0 the Borel invariants are Z[a,d]. Over F₂, scalar matrices have trace zero but determinant a²; the determinant generator cannot be omitted.

Uses: [Formal Ribet matrix ring](#target193). Sources: [DKSW](#ref-dksw23), §3.3, p.19; Corollary 4.17, p.27.

<a id="target197"></a>

**Polarized local character congruence.** For a local triangularization with characters η,ξ and χ,ψ congruence, (ξ(σ)−χ(σ))(ξ(τ)−ψ(τ))+(ξ(τ)−χ(τ))(ξ(σ)−ψ(σ))≡0 modulo Ĩ. Thus if τ∈I_v and ξ(τ)≡χ(τ), the first product vanishes even when σ is outside I_v.

Uses: [Character congruence on the group algebra](#target95). Sources: [DKSW](#ref-dksw23), Lemma 3.2, last local step, equation (47), p.20.

<a id="target198"></a>

**Invariant intersection with the character error ideal.** Let I_R=(a_i+ν_i,b_i,c_i,d_i)⊂R. Then π(A∩(I_R+J))⊂Ĩ.

Uses: [Trace and determinant invariant subring](#target196), [Trace congruences for difference words](#target192), [Evaluation annihilates the formal relation ideal](#target195), [Polarized local character congruence](#target197). Sources: [DKSW](#ref-dksw23), Lemma 3.2, pp.20–21.

### Integral Borel cohomology

<a id="target199"></a>

**Integral restriction to the lower Borel.** For G=GL₂/ℤ, its lower Borel B, every rational G-module V and every i≥0, restriction Hᶦ(G,V)→Hᶦ(B,V) is an isomorphism. Cohomology is derived scheme invariants, not cohomology of G(ℤ).

Uses: `LanglandsParameterStacks:LP3`. Sources: [DKSW](#ref-dksw23), Theorem 4.4, p.23.

<a id="target200"></a>

**Adjoint weight and dual identities.** For the inverse-conjugation coordinate representation A of B, the submodule V=ℤA⊕ℤB has action A↦A+(y/x)B, B↦(z/x)B. Write ℤ(1)=ℤB. Then ∧²V≅ℤ(1), V*≅V(−1), V⊗V*≅A, and V⊗V≅A(1).

Uses: `LanglandsParameterStacks:LP3`. Sources: [DKSW](#ref-dksw23), Example 4.2, p.22; Lemma 5.10, p.42.

<a id="target201"></a>

**Good filtrations on adjoint tensor powers.** The integral adjoint representation of GL₂ and each A^⊗k admit good filtrations. Both the standard representation and its dual are dual Weyl modules; the dual is not identified with the standard representation.

Uses: [Adjoint weight and dual identities](#target200). Sources: [DKSW](#ref-dksw23), Corollary 4.9, p.24.

<a id="target202"></a>

**Good filtrations on matrix polynomials.** For finitely many generic 2×2 matrices, ℤ[a_i,b_i,c_i,d_i] with simultaneous conjugation admits an exhaustive good filtration; every finite polynomial-degree piece has the required finite good filtration. The degree-zero center weight piece is infinite, so the full ring is not assigned a finite filtration.

Use exhaustive polynomial-degree pieces. Each finite degree piece has a finite good filtration; the central weight-zero piece of the full coordinate ring is infinite and cannot be treated as one finite filtration.

Uses: [Good filtrations on adjoint tensor powers](#target201). Sources: [DKSW](#ref-dksw23), Theorem 4.10, p.24.

<a id="target203"></a>

**Vanishing above the Borel twist.** For an integral good G-module W and j≥0, Hᶦ(B,W(j))=0 when i>j.

Uses: [Integral restriction to the lower Borel](#target199). Sources: [DKSW](#ref-dksw23), Lemma 4.11, p.24.

<a id="target204"></a>

**Boundary cohomology at the twist.** For integral good W, naturally H¹(B,W(1))≅H⁰(G,W). For i>1, Hᶦ(B,W(i))⊗Fp=0 if p>2, while Hᶦ(B,W(i))⊗F₂≅H⁰(G,W)⊗F₂. The identifications commute with cup products and coefficient maps.

Uses: [Vanishing above the Borel twist](#target203). Sources: [DKSW](#ref-dksw23), Lemma 4.12, pp.24–25.

<a id="target205"></a>

**Products generating boundary cohomology.** For an inclusion S₁⊂S₂ of integral good commutative G-algebras, Hᶦ(B,S₁(i))⊗_(H⁰(B,S₁))H⁰(B,S₂)→Hᶦ(B,S₂(i)) is surjective for i≥0, in particular for the polynomial coordinate rings used below.

For the polynomial-ring application, prove the integral cokernel vanishes degree by degree, including rational vanishing and the finiteness or bounded-torsion control. Surjectivity after reduction at every prime does not alone exclude a divisible cokernel in the unrestricted good-algebra formulation.

Uses: [Boundary cohomology at the twist](#target204). Sources: [DKSW](#ref-dksw23), Corollary 4.13, p.25.

<a id="target206"></a>

**Acyclicity from a twisted good resolution.** If a B-module M has a finite exact resolution W_n(n)→…→W₁(1)→W₀→M→0 with each W_j integral good, then Hᶦ(B,M)=0 for i>0.

Uses: [Vanishing above the Borel twist](#target203). Sources: [DKSW](#ref-dksw23), Lemma 4.14, p.25.

<a id="target207"></a>

**Acyclic triangular matrix coordinate modules.** Let S=ℤ[a_i,b_i,c_i,d_i]/(b₁,…,b_k), with B conjugation, and W a ℤ-flat integral good G-module. Then W⊗ℤS is B-acyclic.

Uses: [Acyclicity from a twisted good resolution](#target206), [Good filtrations on matrix polynomials](#target202), `DerivedDeRhamCohomology:DD.1/koszul-complex`. Sources: [DKSW](#ref-dksw23), Theorem 4.15, p.26.

<a id="target208"></a>

**Integral trace and determinant invariants.** For a ℤ-flat commutative R₀ with trivial G action, GL₂ scheme invariants in R₀[a_i,b_i,c_i,d_i] are generated over R₀ by traces and determinants of all matrices in the algebra of the generic matrices.

Prove the integral trace/determinant generator theorem with its relations, then commute flat extension with the invariant equalizer. The standard GL₂ representation and its dual are distinct integral representations.

Uses: `LanglandsParameterStacks:LP3`, [Trace and determinant invariant subring](#target196). Sources: [DKSW](#ref-dksw23), Theorem 4.16, pp.26–27.

<a id="target209"></a>

**Invariants of entirely triangular matrices.** For R=R₀[a_τ,c_τ,d_τ], obtained by setting every b_τ to zero, R^B=R₀[a_τ,d_τ].

Uses: [Adjoint weight and dual identities](#target200). Sources: [DKSW](#ref-dksw23), Corollary 4.17, first part, p.27.

<a id="target210"></a>

**Invariants of the formal Ribet ring.** For the formal ring R with the chosen b_τ=0 constraints, H⁰(B,R)=A₀[d_τ], the subring specified above.

Uses: [Integral trace and determinant invariants](#target208), [Invariants of entirely triangular matrices](#target209), [Products generating boundary cohomology](#target205), `DerivedDeRhamCohomology:DD.1/koszul-complex`. Sources: [DKSW](#ref-dksw23), Corollary 4.17, pp.27–28.

<a id="target211"></a>

**Lower-Borel stability of relation ideals.** Under g=[[x,0],[y,z]], each relation quadruple transforms by inverse conjugation: A↦A+(y/x)B, B↦(z/x)B, C↦(x/z)C−(y/z)A−(y²/xz)B+(y/z)D, D↦D−(y/x)B. Thus J and its b-entry ideal J′ are B-stable.

Uses: [Formal Ribet relation ideals](#target194), [Adjoint weight and dual identities](#target200). Sources: [DKSW](#ref-dksw23), Lemma 4.18, pp.29–30.

### Buchsbaum–Rim complexes and generic regularity

<a id="target212"></a>

**Composition of exterior contractions.** For a module U over a commutative ring, λ₁,…,λ_r homogeneous alternating forms on U and β∈∧U, determinant contraction satisfies ω(λ₁∧…∧λ_r)(β)=(−1)^(r+1)ω(λ₁)…ω(λ_r)(β), with the sign convention of Buchsbaum §1. The formula defines all signs in the bar differential.

Uses: `DerivedDeRhamCohomology:DD.1/koszul-complex`. Sources: [Buchsbaum](#ref-buch64), Lemma 1.1, pp.184–185.

<a id="target213"></a>

**Buchsbaum–Rim module complex.** For R commutative and f:U=Rⁿ→W=Rᵐ, 1≤m≤n, define BR(f)=K(f;1,m) using the exterior-bar mapping cone of Buchsbaum §1. Its degrees 0,1 are W,U with d₁=f, and d₂:∧ᵐW*⊗∧^(m+1)U→U is the signed maximal-minor contraction. For m=2 it sends the basis triple to r_ij e_k+r_jk e_i+r_ki e_j.

API: `BuchsbaumRim.moduleComplex`: BR(f)=K(f;1,m), a nonnegative finite free chain complex; `BuchsbaumRim.moduleComplex_d_one`: Its degree-one differential is f; `BuchsbaumRim.moduleComplex_rank_one`: For m=1 this is the imported Koszul complex.

Tests: For f=id:R²→R², the complex is the exact two-term identity complex. For f=0:R³→R², H₁(BR(f))=R³, so it is not exact unless R is zero. For columns (b_i,b′_i), d₂ on e₁∧e₂∧e₃ is r₁₂e₃+r₂₃e₁+r₃₁e₂, and f(d₂)=0.

Uses: [Composition of exterior contractions](#target212), `exteriorPower.map`. Sources: [Buchsbaum](#ref-buch64), §1 pp.185–187; DKSW23 §5.3.1 equation (60).

<a id="target214"></a>

**Buchsbaum–Rim determinant complex.** For the same f, define DetBR(f)=K(f;m,1). Degree zero is ∧ᵐW; degree k≥1 is the direct sum over s₁,…,s_(k−1)≥1 of (⊗_j∧^(s_j)W*)⊗∧^(m+∑s_j)U. Its first differential is ∧ᵐf, with the exterior-bar differential in higher degrees. After choosing det(W)≅R, H₀ is R/I_m(f).

API: `BuchsbaumRim.determinantalComplex`: DetBR(f)=K(f;m,1) with its determinant-line degree zero; `BuchsbaumRim.determinantalComplex_d_one`: d₁=∧ᵐf; `BuchsbaumRim.determinantalComplex_map`: If f′∘g=f then ∧g gives DetBR(f)→DetBR(f′), retaining the same target W; `BuchsbaumRim.determinantalComplex_homology_zero`: After det(W)≅R, H₀=R/I_m(f).

Tests: For m=1 it equals the usual Koszul complex, including its integral signs. For f:R²→R², the complex is R --det(f)→ R in degrees 1,0. For a generic 2×3 matrix, d₁ has generators r₁₂,r₁₃,r₂₃ and d₂ has the two column syzygies; no division by 2 occurs.

Uses: [Buchsbaum–Rim module complex](#target213). Sources: [Buchsbaum](#ref-buch64), §1 p.186; DKSW equation (62), p.37.

<a id="target215"></a>

**Regularity of a finite free map.** For an ordered finite free map f:Rⁿ→Rᵐ with 1≤m≤n, call f regular when H₁(BR(f|Rᵏ))=0 for every m≤k≤n. No noetherianity, domain hypothesis or nonzero-cokernel condition is imposed; properly regular adds coker(f)≠0.

API: `BuchsbaumRim.IsRegular`: All prefix first homology groups vanish; `BuchsbaumRim.IsRegular_prefix`: A prefix of length at least m of a regular map is regular; `BuchsbaumRim.IsRegular_rank_one`: For m=1 it is weak regularity of the ordered Koszul sequence; proper regularity also requires a nonzero quotient.

Tests: Every ordered identity square matrix is regular even when its cokernel is zero. A square matrix is regular iff its underlying R-linear map is injective; no domain assumption is made. Multiplication by 2 on Z is regular; multiplication by 2 on Z/4 is not.

Uses: [Buchsbaum–Rim module complex](#target213). Sources: [Buchsbaum](#ref-buch64), §3 Definition, p.194; DKSW Definition 5.1, p.37.

<a id="target216"></a>

**Mapping cone for adjoining a column.** If f:U→Rᵐ and ρ:R→Rᵐ, then BR(f⊕ρ) is the mapping cone of the contraction-induced map DetBR(f)→BR(f). This gives the homology long exact sequence used in prefix induction.

Uses: [Buchsbaum–Rim determinant complex](#target214). Sources: [Buchsbaum](#ref-buch64), Proposition 2.1 and Corollary 2.2, p.187.

<a id="target217"></a>

**Transfer of acyclicity to determinant complexes.** For every f:Rⁿ→Rᵐ, every R-module E and j>0, if H_i(BR(f)⊗E)=0 for all i≥j, then H_i(DetBR(f)⊗E)=0 for all i≥j.

Construct the transpose/exterior-duality identifications and the contraction-cycle normal forms of Buchsbaum Lemmas 2.3–2.8 and 2.10–2.11 (pp.188–193). These provide boundaries in each degree, including the separate degree-one adjustments.

Uses: [Buchsbaum–Rim determinant complex](#target214). Sources: [Buchsbaum](#ref-buch64), Theorem 2.9, pp.191–193.

<a id="target218"></a>

**Exactness of regular Buchsbaum–Rim maps.** If f is regular, then H_i(BR(f))=0 and H_i(DetBR(f))=0 for every i>0. Consequently, after a determinant-line trivialization, DetBR(f) is a finite free resolution of R/I_m(f).

Induct on the number of columns beyond the square prefix. Prefix H₁-vanishing is the input. The adjoining-column cone and transfer theorem then give all positive homology vanishing for both complexes.

Uses: [Regularity of a finite free map](#target215), [Mapping cone for adjoining a column](#target216), [Transfer of acyclicity to determinant complexes](#target217). Sources: [Buchsbaum](#ref-buch64), Proposition 3.1, pp.194–195; DKSW Theorem 5.2, p.37.

<a id="target219"></a>

**Tensor resolutions of ordered determinantal ideals.** For maps f_i:R^(n_i)→R^(m_i) with 1≤m_i≤n_i, write J_i=I_(m_i)(f_i). If each f_i modulo J₁+…+J_(i−1) is regular, then the finite tensor product ⊗_i DetBR(f_i), with determinant lines trivialized, resolves R/(∑J_i).

Uses: [Exactness of regular Buchsbaum–Rim maps](#target218). Sources: [DKSW](#ref-dksw23), Lemma 5.4 and proof, pp.37–38.

<a id="target220"></a>

**A two-column regularity criterion.** For f:Rⁿ→R² with columns (b_i,b′_i), let r_ij=b_i b′_j−b_j b′_i. Suppose for every k≥2 that r₁k x∈(r₁₂,…,r₁(k−1)) implies x∈(r_ij:i,j<k). Then f is regular.

Uses: [Regularity of a finite free map](#target215). Sources: [DKSW](#ref-dksw23), Lemma 5.11 and proof, p.43.

<a id="target221"></a>

**Localized chart for generic two-column minors.** For R=R₀[b_i,b′_i], J_k=(r_ij:i,j≤k) and V=b′₁, R[V⁻¹]/J_kR[V⁻¹]≅R₀[b′₁,…,b′_n,b₁,b_(k+1),…,b_n,V⁻¹]. In this quotient r₁(k+1) is a non-zero-divisor.

Uses: `MvPolynomial`, `IsLocalization.Away`. Sources: [DKSW](#ref-dksw23), Corollary 5.12, equation (70), p.43.

<a id="target222"></a>

**Saturation of the generic minor ideal.** For the same generic ring, R∩J_kR[(b′₁)⁻¹]=J_k.

Uses: [Localized chart for generic two-column minors](#target221). Sources: [DKSW](#ref-dksw23), Corollary 5.12, proof, p.43.

<a id="target223"></a>

**Regularity of a generic two-column map.** For every commutative R₀ and n≥2, the generic map R₀[b_i,b′_i]ⁿ→R₀[b_i,b′_i]² with columns (b_i,b′_i) is regular.

Uses: [A two-column regularity criterion](#target220), [Saturation of the generic minor ideal](#target222). Sources: [DKSW](#ref-dksw23), Corollary 5.12, p.43.

<a id="target224"></a>

**A pivot chart for generic linear sequences.** For R=R₀[A_ij] and L_i=∑_(j=1)^n A_ij X_j−c_i with c_i∈R, m≤n, the ordered sequence L₁,…,L_m is weakly regular after inverting A₁₁.

Uses: `RingTheory.Sequence.IsWeaklyRegular`. Sources: [DKSW](#ref-dksw23), Proposition 5.13, Claim 1, pp.44–45.

<a id="target225"></a>

**Generic linear prefixes at a zero pivot.** In the same ring, L₁,…,L_(m−1) is weakly regular modulo A₁₁.

Uses: `RingTheory.Sequence.IsWeaklyRegular`. Sources: [DKSW](#ref-dksw23), Proposition 5.13, Claim 2, p.45.

<a id="target226"></a>

**Cancellation of pivot denominators.** If A₁₁^e P lies in (L₁,…,L_(m−1)) in the generic system, then P lies in that ideal.

Uses: [Generic linear prefixes at a zero pivot](#target225). Sources: [DKSW](#ref-dksw23), Proposition 5.13, Claim 3, p.45.

<a id="target227"></a>

**Weak regularity of generic linear equations.** For arbitrary commutative R₀, generic m×n coefficients A_ij with m≤n, and c_i∈R₀[A_ij], the sequence ∑A_ijX_j−c_i is weakly regular in R₀[A_ij,X_j]. If the final quotient is nonzero it is regular in Mathlib’s stronger convention.

Uses: [A pivot chart for generic linear sequences](#target224), [Cancellation of pivot denominators](#target226). Sources: [DKSW](#ref-dksw23), Proposition 5.13, pp.44–45.

<a id="target228"></a>

**Mixed minor and linear resolutions.** Let R=R₀[b′₁,…,b′_n,b₁,…,b_(n+r),V_ij], partition {1,…,n} into blocks S_a, let f_a have columns (b_j,b′_j) for j∈S_a, and add f_(k+1)(e_i)=∑_(j≤n+r)V_ij b_j for i≤r. Then ⊗_a DetBR(f_a) resolves the quotient by the sum of their image-minor ideals, with singleton blocks interpreted as zero local ideal and omitted.

Uses: [Regularity of a generic two-column map](#target223), [Weak regularity of generic linear equations](#target227), [Tensor resolutions of ordered determinantal ideals](#target219). Sources: [DKSW](#ref-dksw23), Proposition 5.14, p.46.

<a id="target229"></a>

**Generic variable count for the Ribet relations.** After the presentation stabilization, the formal b-entry ideal J′ consists of local 2×2 minors and r generic linear equations with exactly r b variables not assigned to a local block. Type III contributes one row for each assigned local generator; subtracting these from the square presentation leaves the required equality of counts.

Uses: [Stabilization of local relation rows](#target188), [Formal Ribet relation ideals](#target194). Sources: [DKSW](#ref-dksw23), §5.9 final paragraph, p.46.

### The two relation complexes

<a id="target230"></a>

**Upper-entry relation complex.** For the formal Ribet ring and its b-entry relations, define C=Koszul(f)⊗_R⊗_v DetBR(f_v)(−1), where f(e_i)=L_i and f_v(e_σ)=A⊗b_σ+B⊗(x_σ−a_σ) in V_R. Degree zero is R and im(d₁)=J′. Each local determinant-line twist (−1) is retained.

API: `IntegralRibet.upperRelationComplex`: The specified tensor complex C; `IntegralRibet.upperRelationComplex_image`: Its degree-one image is J′; `IntegralRibet.upperRelationComplex_augmentation`: The natural augmentation C→R/J′.

Tests: With no selected relation generators or local pairs C=R in degree zero. With only one linear relation L it is the two-term Koszul complex R --L→ R. With two local rows and no linear relations it is R --(b₁b′₂−b₂b′₁)→ R after the determinant-line twist.

Uses: [Buchsbaum–Rim determinant complex](#target214), [Adjoint weight and dual identities](#target200), [Formal Ribet relation ideals](#target194). Sources: [DKSW](#ref-dksw23), §5.4 equations (63)–(65), pp.38–39.

<a id="target231"></a>

**Exactness of the upper-entry resolution.** The augmented upper-entry complex C→R/J′ is a finite free resolution.

Uses: [Upper-entry relation complex](#target230), [Mixed minor and linear resolutions](#target228), [Generic variable count for the Ribet relations](#target229). Sources: [DKSW](#ref-dksw23), Proposition 5.5(1) and §5.9, pp.39,46.

<a id="target232"></a>

**Extension to adjoint multilinear terms.** Extend each b-entry linear/product relation f from ℤ(1) to the full adjoint A using its four coefficients. Koszul functoriality maps Koszul(f) into the subcomplex of Koszul(f̃) whose degree k terms choose at most one vector from each relation block; these terms are sums of A^⊗k⊗R.

Uses: `DerivedDeRhamCohomology:DD.1/koszul-complex`, [Good filtrations on adjoint tensor powers](#target201), [Lower-Borel stability of relation ideals](#target211). Sources: [DKSW](#ref-dksw23), Lemmas 5.6–5.7, pp.40–41.

<a id="target233"></a>

**Equivariant extension of a local column map.** Extend f_v to f̃_v:⊕_σV_R→V_R by A e_σ↦A⊗(x_σ−d_σ)+B⊗c_σ and B e_σ↦A⊗b_σ+B⊗(x_σ−a_σ). This map is B-equivariant.

Uses: [Adjoint weight and dual identities](#target200), [Formal Ribet matrix ring](#target193). Sources: [DKSW](#ref-dksw23), Lemma 5.8 and proof, p.41.

<a id="target234"></a>

**Image and terms of the local distinct-block complex.** The subcomplex of DetBR(f̃_v)(−1) containing at most one wedge vector from each σ block has degree-one image J_v, the four local relation entries for distinct pairs. Its degree k terms are direct sums of A^⊗k⊗R.

Uses: [Equivariant extension of a local column map](#target233), [Buchsbaum–Rim determinant complex](#target214), [Good filtrations on adjoint tensor powers](#target201). Sources: [DKSW](#ref-dksw23), Lemmas 5.9–5.10, p.42.

<a id="target235"></a>

**Full-entry relation complex.** Define D as the tensor product of the adjoint multilinear Koszul subcomplex and the local distinct-block determinant subcomplexes, all determinant-line twists included. Then D₀=R, im(d₁)=J and each D_k is a sum of A^⊗k⊗R. Exactness in positive degrees is not part of this construction.

API: `IntegralRibet.fullRelationComplex`: The B-equivariant tensor complex D; `IntegralRibet.fullRelationComplex_image`: Its degree-one image is J; `IntegralRibet.fullRelationComplex_terms`: Its degree-k terms are direct sums of adjoint tensor powers with R.

Tests: Without relation blocks, D=R in degree zero and J=0. A single matrix relation has D₁=A⊗R→R with its four entries, and no repeated-block exterior terms. For two distinct local blocks the four basis wedges give all four local relation entries; wedges from one block alone are excluded.

Uses: [Extension to adjoint multilinear terms](#target232), [Image and terms of the local distinct-block complex](#target234). Sources: [DKSW](#ref-dksw23), §5.4 equation (66), p.39.

<a id="target236"></a>

**Acyclicity of the full relation terms.** Every term D_k is B-acyclic for rational scheme cohomology over ℤ.

Uses: [Full-entry relation complex](#target235), [Acyclic triangular matrix coordinate modules](#target207). Sources: [DKSW](#ref-dksw23), Proposition 5.5(2), pp.39–40.

<a id="target237"></a>

**Comparison of relation complexes.** The natural inclusions of rank-one b-entry blocks induce a B-equivariant chain map C→D whose map in degree zero is id_R and whose map on degree-one images is J′↪J. After truncating at the images, it gives the exact-to-acyclic comparison of Theorem 4.23.

The source is an exact finite resolution; the target has acyclic terms. The target is not assumed to be a resolution. Truncate both at their degree-one images and retain the identity on R in degree zero.

Uses: [Exactness of the upper-entry resolution](#target231), [Acyclicity of the full relation terms](#target236). Sources: [DKSW](#ref-dksw23), Theorem 4.23 and §§5.4–5.6, pp.33,38–42.

<a id="target238"></a>

**Vanishing of the relation-ideal cohomology map.** For every j≥1, inclusion induces the zero map Hʲ(B,J′)→Hʲ(B,J).

Lift a cohomology class through the successive source kernels up to its finite top degree, then descend through the target. Target term acyclicity removes each obstruction, proving the inclusion map is zero.

Uses: [Comparison of relation complexes](#target237). Sources: [DKSW](#ref-dksw23), Theorem 4.22 and proof, pp.33–34.

### Invariant determinant comparison and extension theorems

<a id="target239"></a>

**The determinant difference in the formal error ideal.** For the formal versions of E,E′, their determinant difference e=detE′−detE lies in I_R=(a_i+ν_i,b_i,c_i,d_i).

Uses: [Weighted auxiliary matrix](#target189), [Formal Ribet matrix ring](#target193). Sources: [DKSW](#ref-dksw23), §3.3, p.19.

<a id="target240"></a>

**Pairing determinant terms along a local column.** Suppose a square matrix has a distinguished column whose nonlocal entries lie in J′. Each local row has entries b_σ and x_σ−a_σ in that column and its unique place column, and same-place 2×2 minors lie in J′. Then its determinant belongs to J′.

Uses: [Formal Ribet relation ideals](#target194). Sources: [DKSW](#ref-dksw23), Lemma 4.20, equation (54), pp.31–32.

<a id="target241"></a>

**Unipotent invariance for product rows.** Replacing every product row of E′ by its image under the lower unipotent universal element τ_t leaves detE′ unchanged modulo J′.

Uses: [Pairing determinant terms along a local column](#target240), [Lower-Borel stability of relation ideals](#target211). Sources: [DKSW](#ref-dksw23), Lemma 4.20, pp.31–32.

<a id="target242"></a>

**Unipotent invariance for one local block.** Changing the local rows for one place from x_σ−a_σ to x_σ−a_σ−t b_σ leaves detE′ unchanged modulo J′, even when earlier local blocks have already changed.

Uses: [Pairing determinant terms along a local column](#target240), [Lower-Borel stability of relation ideals](#target211). Sources: [DKSW](#ref-dksw23), Lemma 4.21, pp.32–33.

<a id="target243"></a>

**Borel invariance of the determinant difference.** The image of e=detE′−detE in R/J′ is B-invariant.

Uses: [Unipotent invariance for product rows](#target241), [Unipotent invariance for one local block](#target242). Sources: [DKSW](#ref-dksw23), Lemma 4.19, pp.30–33.

<a id="target244"></a>

**Lifting the invariant error across the full ideal.** The image of e in R/J lies in the image of H⁰(B,R)=A.

Uses: [Borel invariance of the determinant difference](#target243), [Vanishing of the relation-ideal cohomology map](#target238), [Invariants of the formal Ribet ring](#target210). Sources: [DKSW](#ref-dksw23), §4.4 exact sequence (52), p.29.

<a id="target245"></a>

**Formal determinant comparison.** For every stabilized relation minor under the full local Ribet input, detE′−detE evaluates into Ĩ. Since detE′=0 and detE=(∏_(v∈P)(ξ_v(σ_v)−χ(σ_v)))detD, this gives the weighted relation-minor containment in Ĩ.

Write the determinant difference as an invariant lift plus a full relation. Its invariant lift belongs to the character-error intersection, and evaluation kills the full relation ideal. Combine this with the altered determinant zero and the weighted auxiliary determinant identity.

Uses: [The determinant difference in the formal error ideal](#target239), [Lifting the invariant error across the full ideal](#target244), [Invariant intersection with the character error ideal](#target198), [Vanishing of the altered determinant](#target191). Sources: [DKSW](#ref-dksw23), Proposition 3.3, p.21; §§4.4–4.6.

<a id="target103"></a>

**Weighted Fitting containment.** Under exactly Theorem 2.1’s hypotheses, including χ≡ψ modulo m, local triangularizations diag(η_v,ξ_v), ξ_v≡ψ on Σ, ξ_v≡χ on I_v for v∈P, and chosen σ_v∈G_v, the finite local quotient N satisfies (∏_(v∈P)(ξ_v(σ_v)−χ(σ_v)))·Fitt₀_T(N)·T̃⊆Ĩ. The containment is in T̃; local factors need not belong to T.

Uses: [Finite and continuous Ribet modules](#target100), [Formal determinant comparison](#target245). Sources: [DKSW](#ref-dksw23), Theorem 2.1, equation (12), pp.7–8.

<a id="target104"></a>

**Ribet extension with all local conditions.** For a noetherian inclusion T⊆T̃, T local and both complete for m_T, a proper nonzero Ĩ⊆T̃, I=Ĩ∩T, K=Frac(T̃) a finite product of local rings with principal maximal ideals and reduced quotient a product of fields, a compact G and continuous ρ:G→GL₂(K), assume characteristic polynomials lie in T[X] and reduce modulo I to (X−χ)(X−ψ), χ≡ψ modulo m_T, and every reduced field-factor representation is irreducible. With the finite triangular local input of the weighted-containment theorem, there exist finite N, continuous κ and vectors y_v having all its prescribed local values, generating N together, and satisfying its weighted Fitting containment.

Uses: [Weighted Fitting containment](#target103). Sources: [DKSW](#ref-dksw23), Theorem 2.1, pp.7–8.

<a id="target251"></a>

**Irreducibility excludes an exact split determinant.** Under the global Ribet hypotheses with T nonzero, the congruence ideal I cannot be zero: otherwise the determinant on every field-factor representation is the direct sum of the two T-valued characters, contradicting its irreducibility.

When I=0, extend the character-polynomial identity from group elements to the full group algebra and apply semisimple determinant reconstruction in a field factor. An irreducible two-dimensional factor cannot have the split character determinant.

Uses: [Faithful quotients over arbitrary fields](#target140), [Character congruence on the group algebra](#target95). Sources: [DKSW](#ref-dksw23), Theorem 1.1 and its reduction to Theorem 2.1, pp.2–3, 7–8.

<a id="target105"></a>

**Ribet extension without residual distinctness.** Let T be complete reduced noetherian local, I⊆T any ideal, G compact and ρ:G→GL₂(Frac(T)) continuous. Assume every characteristic polynomial lies in T[X], reduces modulo I to (X−χ(g))(X−ψ(g)) for continuous T-unit characters χ,ψ, and every field-factor representation is irreducible. Then there are a finite T-module M and a continuous class in H¹(G,M(χψ⁻¹)) for which every representative cocycle generates M, and Fitt₀_T(M)⊆I. Residual equality and residue characteristic two are allowed.

For I=T take the zero module. Exclude I=0 by irreducibility. For a proper nonzero ideal, separate the coincident-character construction from the distinct-character lattice argument; only the coincident case uses the Nakayama every-representative lemma.

Uses: [Ribet extension with all local conditions](#target104), [Every cocycle representative generates](#target101), [Ribet theory for distinct residual characters](#target102), [Irreducibility excludes an exact split determinant](#target251). Sources: [DKSW](#ref-dksw23), Theorem 1.1, pp.2–3.

## References

Page numbers below refer to the stated public text. Preprint pagination is used unless journal pagination is specified. Each target above supplies its own precise locator.

<a id="ref-chenevier-det"></a>

**Chenevier** — Gaëtan Chenevier. [The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings](https://arxiv.org/pdf/0809.0415v2). arXiv:0809.0415v2 (2013), 56-page preprint; published in LMS Lecture Note Series 414 (2014), pp.221–285. Locators above use the preprint pages.

<a id="ref-acc23"></a>

**ACC** — Allen, Calegari, Caraiani, Gee, Helm, Le Hung, Newton, Scholze, Taylor and Thorne. [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf). Annals 197 (2023); public author PDF with journal pagination

<a id="ref-bp26"></a>

**Boxer–Pilloni** — George Boxer and Vincent Pilloni. [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf). Author PDF built 5 November 2025; Inventiones 244 (2026), 45–141

<a id="ref-bn93"></a>

**Bökstedt–Neeman** — Marcel Bökstedt and Amnon Neeman. [Homotopy limits in triangulated categories](https://www.numdam.org/item/CM_1993__86_2_209_0.pdf). Compositio 86 (1993), 209–234; Numdam version of record

<a id="ref-bcgp25"></a>

**BCGP** — Boxer, Calegari, Gee and Pilloni. [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645v1). arXiv:2502.20645v1

<a id="ref-cg18"></a>

**Calegari–Geraghty 2018** — Frank Calegari and David Geraghty. [Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/pdf/1207.4224). arXiv:1207.4224 public version

<a id="ref-cgh20"></a>

**Calegari–Geraghty–Harris** — Calegari, Geraghty and Harris. [Bloch–Kato conjectures for automorphic motives](https://arxiv.org/pdf/1907.08694). arXiv:1907.08694

<a id="ref-sch15"></a>

**Scholze** — Peter Scholze. [On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf). Annals 182 (2015), public version of record

<a id="ref-dksw23"></a>

**DKSW** — Samit Dasgupta, Mahesh Kakde, Jesse Silliman and Jiuya Wang. [The residually indistinguishable case of Ribet’s method for GL₂](https://math.iisc.ac.in/~maheshkakde/rl.pdf). Author manuscript, 21 September 2023

<a id="ref-roby63"></a>

**Roby** — Norbert Roby. [Lois polynômes et lois formelles en théorie des modules](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf). Ann. Sci. ENS (3) 80 (1963), 213–348; Numdam version of record

<a id="ref-em23"></a>

**Emerson–Morel** — A. J. Emerson and Sophie Morel. [Comparison of different definitions of pseudocharacters](https://arxiv.org/pdf/2310.03869v2). arXiv:2310.03869v2, 17 October 2023

<a id="ref-q23"></a>

**Quast** — Julian Quast. [Deformations of G-valued pseudocharacters](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf). Author PDF retaining arXiv:2310.14886v1 and date 23 October 2023

<a id="ref-pq26"></a>

**Paškūnas–Quast** — Vytautas Paškūnas and Julian Quast. [On local Galois deformation rings: generalised reductive groups](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2D7C5400C4BA7789C0E1CFF008D12E60/S2050508626100304a.pdf/div-class-title-on-local-galois-deformation-rings-generalised-reductive-groups-div.pdf). Forum of Mathematics, Pi 14 (2026), e15; public publisher PDF

<a id="ref-bc09"></a>

**Bellaïche–Chenevier** — Joël Bellaïche and Gaëtan Chenevier. [Families of Galois representations and Selmer groups](https://arxiv.org/pdf/math/0602340v2). arXiv:math/0602340v2 (2007), preprint pagination; published as Astérisque 324 (2009).

<a id="ref-cn23"></a>

**Caraiani–Newton** — Ana Caraiani and James Newton. [On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3). arXiv:2301.10509v3

<a id="ref-we18"></a>

**Wang–Erickson** — Carl Wang-Erickson. [Algebraic families of Galois representations and potentially semi-stable pseudodeformation rings](https://sites.pitt.edu/~caw203/pdfs/algfam.pdf). Mathematische Annalen 371 (2018), 1615–1681; public author manuscript

<a id="ref-cht08"></a>

**CHT** — Laurent Clozel, Michael Harris and Richard Taylor. [Automorphy for some l-adic lifts of automorphic mod l Galois representations](https://www.numdam.org/item/PMIHES_2008__108__1_0.pdf). Publications mathématiques IHÉS 108 (2008), 1–181; Numdam version of record

<a id="ref-gg12"></a>

**Gee–Geraghty** — Toby Gee and David Geraghty. [Companion forms for unitary and symplectic groups](https://arxiv.org/pdf/1001.2044). Duke Mathematical Journal 161 (2012), 247–303; arXiv:1001.2044

<a id="ref-bhkt19"></a>

**BHKT** — Gebhard Böckle, Michael Harris, Chandrashekhar Khare and Jack A. Thorne. [G-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491). Acta Mathematica 223 (2019), 1–111; arXiv:1609.03491

<a id="ref-bip23"></a>

**BIP** — Gebhard Böckle, Ashwin Iyengar and Vytautas Paškūnas. [On local Galois deformation rings](https://arxiv.org/pdf/2110.01638). Forum of Mathematics, Pi 11 (2023), e30; arXiv:2110.01638

<a id="ref-buch64"></a>

**Buchsbaum** — David A. Buchsbaum. [A generalized Koszul complex. I](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf). Transactions AMS 111 (1964), 183–196; scanned author-linked journal copy

<a id="ref-pilloni20"></a>

**Pilloni** — Vincent Pilloni. [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf). Duke Mathematical Journal 169 (2020), 1647–1807; public author manuscript

<a id="ref-gt05"></a>

**Genestier–Tilouine** — Alain Genestier and Jacques Tilouine. [Systèmes de Taylor–Wiles pour GSp₄](https://numdam.org/item/AST_2005__302__177_0.pdf). Astérisque 302 (2005), 177–290; public Numdam journal copy

<a id="ref-cg20"></a>

**Calegari–Geraghty 2020** — Frank Calegari and David Geraghty. [Modularity lifting for non-regular symplectic representations](https://arxiv.org/pdf/1907.08691). Duke Mathematical Journal 169 (2020), 801–896; public author manuscript

<a id="ref-ant20"></a>

**Allen–Newton–Thorne** — Patrick B. Allen, James Newton and Jack A. Thorne. [Automorphy lifting for residually reducible l-adic Galois representations, II](https://arxiv.org/pdf/1912.11269v2). Accepted version, arXiv:1912.11269v2, 13 August 2020

[reductivegroups9]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/fa4d030/ReductiveGroups/README.md#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ
[classfieldtheory7]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/fa4d030/ClassFieldTheory/README.md#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors
[semisimplealgebras0]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/fa4d030/RepresentationTheory/SemisimpleAlgebras/README.md#layer-0-the-jacobson-radical-and-the-semisimplicity-criterion-supporting-api-optional
[semisimplealgebras3]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/fa4d030/RepresentationTheory/SemisimpleAlgebras/README.md#layer-3-the-double-centralizer-density-theorem
[semisimplealgebras2]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/fa4d030/RepresentationTheory/SemisimpleAlgebras/README.md#layer-2-artin-wedderburn-assembled-with-uniqueness
[semisimplealgebras4]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/fa4d030/RepresentationTheory/SemisimpleAlgebras/README.md#layer-4-central-simple-algebras-and-their-tensor-products
[chebotarev10]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/fa4d030/Chebotarev/README.md#layer-10-dirichlet-density-chebotarev
