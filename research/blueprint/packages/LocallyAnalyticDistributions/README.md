# Roadmap: locally analytic distributions, growth and character spaces

This roadmap builds the spaces of locally analytic functions and distributions on ℤ_p, on finite products of rings of integers of p-adic fields and on compact p-adic analytic manifolds, together with the three things that the constructions of non-ordinary p-adic L-functions, p-adic regulators and p-adic families need from them: the unbounded Amice transform and its operator toolbox, the theory of admissible (order-r and vector-order) distributions with the Amice–Vélu–Vishik extension and uniqueness theorem, and the Mellin transform identifying distributions on a compact abelian p-adic analytic group with analytic functions on its character space. The last layer supplies the operator theory of p-adic families: complete continuity over a Banach algebra, Fredholm determinants, Riesz projectors and finite-slope decompositions, the Coleman spectral transform, and finite-slope perfect complexes. Everything is stated over a complete nonarchimedean field K (a finite extension of ℚ_p in the arithmetic applications) and, for families, over a commutative Noetherian K-Banach algebra A; general locally convex or distribution spaces are never silently treated as Banach spaces.

The targets below are specifications for formalisation. Every definition comes with the API it needs and with checks that a plausible wrong definition fails; every theorem carries its hypotheses, its source and the earlier targets or library declarations it rests on. The companion [Suggested.lean](Suggested.lean) proposes signatures and `example` tests for the targets that can be stated against the pinned libraries; it is not the roadmap and not exhaustive, and this document is definitive.

## Scope and ownership

This roadmap owns the following material.

- Analytic functions on closed discs and polydiscs with their Gauss valuations, the Banach stages of functions analytic on every residue ball of a fixed radius, the compact-type space of locally analytic functions and its strong dual of distributions, in one variable, on finite products of local integer rings (distinguishing ℚ_p-analytic from F-analytic functions) and on compact p-adic analytic manifolds through charts.
- The strict-sequence and three-space results for nonarchimedean Banach, Fréchet and compact-type spaces that are used to pass between stages, limits and duals, including the nonarchimedean Hahn–Banach theorem over a spherically complete field, which is stated here as a target rather than taken from another roadmap.
- The unbounded Amice transform (distributions ↔ power series convergent on the open disc) with its Fréchet topology, and the operator dictionary: point masses, convolution, multiplication by the coordinate, character twists, clopen restriction, the transpose derivative and the logarithm, dilation, φ and ψ, division by the coordinate on the units, local primitives, and the non-splitting of differentiation and of the logarithm sequence.
- Functions of class C^r, distributions of order r, the identification of order zero with bounded measures, the Amice–Vélu–Vishik theorem with the strict degree bound, vector order on ℤ_p^g through completed tensors of one-variable spaces, rectangular growth bounds, the critical counterexample, and the ray-class growth adapters.
- Component Mellin series of bounded measures, arithmetic branches ω(x)^i⟨x⟩^s, clearing factors for pseudo-measures, the distribution Mellin transform as a Fréchet algebra isomorphism onto the functions on the open polydisc with its evaluation, multiplicativity, generator-change, weight-derivative, twist, functoriality and coefficient-extension laws, and the comparison with the rigid and adic character spaces.
- Complete continuity in the Banach-algebra convention, orthonormalizable and potentially orthonormalizable modules, property (Pr), the Fredholm determinant and its invariance, product and base-change laws, entire series and their division by monic polynomials, resultants of monic polynomials against entire series, Hasse derivatives, the Fredholm resolvent, Riesz projectors at a root, finite generation and projectivity of root kernels, the finite spectral transform, Coleman's truncation limits, Gauss convergence of entire series, affinoid-valued stages and their duals, the universal-character coefficient action, compactness of contracting operators, Banach cochain complexes with compact homotopy endomorphisms, numerical slope decompositions, finite-slope perfect complexes, Fréchet presentations, Stein exhaustions and the torus order on slopes.

It leaves the following to the roadmaps and libraries named, and does not restate them.

- **Bounded measures and their calculus** belong to PadicMeasuresIwasawaAlgebras: the carrier D(X, R) (Mathlib's `AbstractMeasure`), clopen restriction and extension, the weak and strong topologies (its L0); the bounded Mahler–Amice transform `AbstractMeasure.amiceTransform`, the Mahler derivation, translation, dilation, φ, ψ, residue restriction and the inversion of multiplication by x on the units for bounded measures (its L2); pseudo-measures, admissible evaluation and the independence of the clearing factor (its L3); the character space W of ℤ_pˣ with its odd-p and p = 2 decompositions, the identification of characters of the principal units with the open unit disc, measures as bounded functions on W, pseudo-measures as functions with a simple pole, and the universal character Γ → Λˣ (its L0a). Layers 1–3 here extend each of these from bounded measures to distributions; where a target of this roadmap specialises to a bounded measure it must agree with the PadicMeasuresIwasawaAlgebras statement, and that agreement is part of the target.
- **Rigid and adic carriers** belong to the Tau Ceti roadmap AdicSpaces (restricted power series and Tate algebras in its Layer 0, gluing of adic spaces in its Layer 5) and to AdicSpacesPartII (the complete-continuity predicate over affinoid algebras and its ideal and closure API, quasi-Stein spaces and Theorems A and B, in its R3). The comparison of the power-series character space with these geometric objects is a target of Layer 3; the geometric objects themselves are not built here, and diamonds are never required.
- **Already in the Tau Ceti library** (`a91d3aaf`) and used, not restated: Mathlib's restricted series `PowerSeries.IsRestricted` with Tau Ceti's `TauCeti.PowerSeries.isRestricted_of_abs_le`, `isRestricted_polynomial` (so "polynomials are entire" is a consequence, not a target of Layer 4), `polynomialToRestricted`, the Gauss norm `TauCeti.PowerSeries.gaussValuation` with its multiplicativity and `IsDistinguished` on restricted series, and the normed-ring structure `TauCeti.PowerSeries.norm_eq_gaussNorm` on the restricted subring at a radius (`TauCeti/RingTheory/PowerSeries/{Restricted,GaussNorm,TateAlgebra}.lean`); `TauCeti.Huber.restrictedMvPowerSeriesGaussEquiv` identifying the Huber restricted series with the Gauss-normed ones; `IsTopologicallyNilpotent.isUnit_one_sub` (`Topology/Algebra/Nonarchimedean/GeometricSeries.lean`); the integer-coefficient evaluation `TauCeti.evalIntSeries` (`Topology/Algebra/InfiniteSum/IntegralCoefficients.lean`), which Layer 1 uses for log(1 + T) at points of norm below one; the completed group algebra `TauCeti.completedGroupAlgebra` and its `powerSeriesCoordinate`, consumed through PadicMeasuresIwasawaAlgebras. Tau Ceti's `Analysis/Fredholm/*` (the index theory of `ContinuousLinearMap.IsFredholm`) and `Analysis/Normed/Operator/Compact/RieszTheory.lean` (Riesz theory for Mathlib's `IsCompactOperator`) concern archimedean-style compact operators between Banach spaces over a field; the Fredholm theory of Layer 4 is over a Banach algebra A with complete continuity defined by finitely generated A-images, and the only link asserted is the comparison theorem of §4.1 between complete continuity and `IsCompactOperator` over a field.
- **Reductive-group input** belongs to the Tau Ceti roadmap ReductiveGroupsPartII (its RG2.1 supplies the maximal ℚ_p-split torus, its valuation lattice and positive cone for the torus order of §4.15); no root datum is built here.
- **Not in this roadmap at all**: no p-adic L-function (no Bernoulli, Eisenstein, modular-symbol or Rankin–Selberg arithmetic), no Coleman map or Coleman integration, no eigenvariety or overconvergent cohomology, no (φ, Γ)-modules, no Galois cohomology, no diamonds, and no solid or condensed functional analysis: the finite-window statement of §4.15 is a classical statement about Fréchet presentations and makes no solid-localisation claim.

## Conventions

1. **Fields and algebras.** K is a field complete for a nontrivial nonarchimedean absolute value; in the arithmetic layers K is a finite extension of ℚ_p with v_p(p) = 1, and L ⊆ ℂ_p denotes a closed subfield containing the relevant coefficients. A is a nonzero commutative Noetherian K-Banach algebra with a submultiplicative ultrametric norm; A is not assumed to be a field, reduced or affinoid, and the zero algebra is treated as a separate degenerate case. Banach A-modules are complete Hausdorff ultrametric normed K-spaces with a bounded A-action; operator norms of continuous A-linear maps are computed after restriction of scalars to K.
2. **Charts and coefficients.** A normalised analytic chart on a residue ball has coordinate (x − a)/p^h. The coefficient space of a Banach stage is Mathlib's c₀, `ZeroAtInftyContinuousMap` on a discrete index type I (`C₀(I, A)`), with no countability assumption; in several variables the coefficients tend to zero along the cofinite filter on the multi-index set. For an operator u on c₀ write u(e_i) = Σ_j a_{ij} e_j, so that i is the input index and j the output index, and r_j(u) = sup_i ‖a_{ij}‖; finite coordinate projections π_S retain a finite set of output coordinates.
3. **Topologies.** The locally analytic functions carry the compact-type inductive-limit topology of the Banach stages, and distributions are its strong dual, equivalently the projective limit of the Banach duals with the limit topology. Equality of underlying functions is never equality of topologies: the locally analytic topology is strictly finer than the uniform one. These nonarchimedean locally convex objects are not instances of Mathlib's ordered-field `LocallyConvexSpace`. The dual of a Banach stage has bounded coefficient values and is not asserted to be a c₀ space.
4. **Series.** A series on the open disc satisfies ‖a_n‖R^n → 0 for every 0 < R < 1; an entire series satisfies it for every real R > 0. Both carry the Fréchet topology of all Gauss norms, which governs evaluation and limits; neither is given a single radius-one norm. Mathlib's `PowerSeries` and `MvPowerSeries` are the carriers; restricted series at one radius are Mathlib's `PowerSeries.IsRestricted`.
5. **Amice and Mellin normalisations.** The Amice transform of a distribution μ on ℤ_p is Σ_n μ(binom(x, n)) T^n, and Y = 1 + T, so δ_a ↦ Y^a. The transpose derivative is (dμ)(f) = μ(f′), with multiplier log(1 + T); multiplication by x is (1 + T)d/dT. Mellin branches use ω(x)^i⟨x⟩^s with no shift s ↦ 1 − s. At odd p the topological generator of the principal units is 1 + p; at p = 2 the units are {±1} × (1 + 4ℤ_2) with generator 5. Full ℚ_p-analytic Mellin transforms live on the full character space; F-analytic distributions satisfy the closed differential relations of §0.1 and use the F-analytic character subspace.
6. **Operators.** P_u(T) = det(1 − Tu) with c_0 = 1 and c_n = (−1)^n times the sum of the principal n × n minors. "Finite rank" means image contained in a finitely generated A-submodule (not finite K-dimension, not necessarily free), "completely continuous" means approximable in operator norm by such maps, and neither is identified with Mathlib's `IsCompactOperator` except through the comparison theorem of §4.1. Q*(X) = X^{deg Q} Q(1/X). Root multiplicity is read from Hasse derivatives, the first nonzero one being a unit. In the Riesz theory, v = 1 − au, z_s = Δ_s F_u(a), c = Δ_h P_u(a) is a unit, b = c⁻¹ z_h, p = (vb)^h and E = 1 − p; E projects onto N = ker(v^h) and p onto its regular complement; at h = 0, E = 0 and N = 0.
7. **Entire division.** The entire-division targets state weaker hypotheses than the standing ones: A complete, commutative, normed with ‖1‖ = 1, ultrametric only where stated; the parameter a is arbitrary; the native `PowerSeries`, `IsEntire`, `entire_eval` and `Polynomial.divByMonic` are reused; a total `tsum` outside the entire subring is never treated as a convergent evaluation. For monic Q, ρ_Q is entire division followed by `AdjoinRoot`, and Res(Q, F) is `Algebra.norm (ρ_Q F)`; the degree-zero quotient is the zero ring, so Res(1, F) = 1. No domain, reducedness or root-splitting hypothesis is used.
8. **Vector order.** Anisotropic C^{r_i} on ℤ_p^g means the completed projective tensor product of the one-variable C^{r_i} spaces; rectangular coset bounds are separate in each conductor exponent. The literal simultaneous first-difference condition is not used (see the source corrections in the references).
9. **Complexes and slopes.** Banach complexes are Mathlib `CochainComplex`es in `ModuleCat` with complete degree norms, continuous differentials and (Pr) terms, possibly of infinite rank; a compact homotopy class has a degreewise completely continuous representative; its auxiliary characteristic series is the non-alternating product of the degree Fredholm series and depends on the representative, while finite-slope cohomology is the invariant. Slope ≤ h includes equality, both in the finite-summand annihilation and in the complementary polynomial-invertibility test; in det(1 − TU) coordinates, eigenvalues of valuation ≤ h correspond to reciprocal roots of valuation ≥ −h.
10. **Families.** Analytic c₀ stages commute with completed projective coefficient tensors; their infinite Banach duals have only a canonical scalar-extension map, and no unqualified isomorphism or automatic (Pr) property is asserted for them. For an affinoid A with a chosen Banach model, the norm unit ball is the integral lattice; it is not identified with the power-bounded elements of a non-reduced affinoid without proof.
11. **Names.** All new declarations live under `TauCeti.`; the namespaces named in each layer are proposals. Names follow Mathlib's conventions (`foo_bar` for theorems, `fooBar` for data, `IsFoo` for predicates).

## Exact supplier contracts

**From Mathlib** (`082e2d37e8b0463410cdb532e111cd43d5a66174`). `AbstractMeasure` with `amiceTransform`, `coeff_amiceTransform`, `injective_amiceTransform` and `amiceTransformEquiv` (the bounded transform of integral measures); `PadicInt.mahlerEquiv` and `PadicInt.hasSum_mahler` (the Mahler basis as an isometry C(ℤ_p, E) ≃ c₀(ℕ, E)); `ZeroAtInftyContinuousMap` with its extensionality, completeness and single-coordinate API; `NonarchimedeanAddGroup.summable_iff_tendsto_cofinite_zero` and `HasSum.mul_of_nonarchimedean` (unconditional sums over arbitrary index sets); `PowerSeries` with `coeff`, `trunc`, `map`, `derivative`, `subst`, `IsRestricted` and `gaussNorm` (`HasGaussNorm`, `gaussNorm_eq`, `gaussNorm_add_le_max`); `Polynomial` with `hasseDeriv`, `divByMonic`, `modByMonic`, `reverse`, `reflect`, `ofFn`, `resultant` and `Matrix.charpolyRev`, `Matrix.adjugate`, `Matrix.mvPolynomialX`, `Matrix.IsUpperTriangular`; `AdjoinRoot` with `Algebra.norm`; `IsCompactOperator`; `ModuleCat`, `CochainComplex`, `Homotopy`; `LocallyConstant`; `ContinuousLinearMap` with `restrictScalars`. `LaurentSeries.hasseDeriv` exists on Hahn series; the power-series Hasse derivative of §4.5 must agree with it under the embedding of power series, and that agreement is part of the target.

**From Tau Ceti** (`a91d3aaf`). `TauCeti.PowerSeries.isRestricted_of_abs_le`, `isRestricted_polynomial`, `polynomialToRestricted`, `gaussValuation`, `IsDistinguished`, `norm_eq_gaussNorm`, `norm_le_iff` (restricted series, Gauss norm and Tate algebra); `TauCeti.Huber.restrictedMvPowerSeriesGaussEquiv`; `IsTopologicallyNilpotent.isUnit_one_sub`; `TauCeti.evalIntSeries` with `norm_evalIntSeries_le_one`; `AdjoinRoot.norm_mk_eq_resultant`, `Polynomial.Monic.resultant_of_le`, `Polynomial.Monic.discr_map` (`TauCeti/RingTheory/Polynomial/Resultant/`). What is assumed of each is exactly its statement at that commit.

**From PadicMeasuresIwasawaAlgebras.** L0: bounded measures D(X, L) = C⁰(X, L)′ on ℤ_p and ℤ_pˣ with their norm, the weak and strong topologies, clopen restriction and extension, and the injectivity of restriction to a dense subspace of test functions. L2: the bounded Amice transform with coefficient μ(binom(x, n)), its inverse on bounded coefficient sequences, the Dirac, convolution, φ, ψ, dilation, residue-restriction and unit-restriction laws, and the inversion of multiplication by x on the units. L0a: the character space W(A) = Hom_cts(ℤ_pˣ, Aˣ) with its torsion/principal decomposition at odd p and at p = 2, the identification of characters of the principal units with the open disc through a chosen generator, measures as bounded functions on W, pseudo-measures as functions with a simple pole, the universal character and its universal property for G = H × ℤ_p^d; in addition the locally analytic chart H : G ≅ Δ × ℤ_p^d and the component points κ_{ν,t}(g) = ν(H_Δ g)(1 + t)^{H_ℤ g}. L3: pseudo-measures λ with ([g] − 1)λ in the algebra, admissible evaluation after clearing a denominator whose character value is a unit, and independence of the clearing factor; Layer 3 here needs in addition the identification of the genuine clearing numerator for ([a] − [1])λ and the cross-compatibility of two clearings on their common non-vanishing domain, which that roadmap's pointwise numerator and ratio targets supply.

**From AdicSpacesPartII** (R3). The predicate "completely continuous" for continuous linear maps between Banach modules over an affinoid algebra, with its finite-rank, composition, ideal and closure API; Layer 4 states the same approximation predicate over a Noetherian K-Banach algebra (§4.1) and requires the two to agree on affinoids. Quasi-Stein spaces, dense restriction maps and Theorems A and B, used by §4.15 for Stein exhaustions.

**From the Tau Ceti roadmaps AdicSpaces and ReductiveGroupsPartII.** AdicSpaces Layer 0 (restricted series, Tate algebras, strong noetherianness) and Layer 5 (open subspaces and gluing) for the geometric comparison of §3.4; ReductiveGroupsPartII RG2.1 (maximal split torus, valuation lattice, positive and strictly positive root monoids, spanning of the positive cone, integral subgroup chart) for §4.15.

## How to read the build

Layer 0 builds the function spaces and the functional-analytic tools; Layer 1 the Amice transform and the operator toolbox on ℤ_p; Layer 2 admissibility and uniqueness in one and several variables; Layer 3 the Mellin transform and character spaces; Layer 4 the operator theory of families and the finite-slope complexes. Each layer is divided into numbered subsections; a subsection opens with the hypotheses that all its targets share, then states its targets in dependency order as bold-titled paragraphs. A paragraph gives the statement, any further hypotheses, the API of a definition or construction as a list of named lemmas, the source with its locator, and *Needs*, the earlier targets (by subsection number and title), library declarations and supplier layers it rests on. The checks of a definition or construction are the `**Checks.**` bullets under it, one per unit test; the same tests are `example`s in [Suggested.lean](Suggested.lean). Each layer ends with worked examples and its dependencies. Nothing is optional.

## Layer 0: analytic Banach stages, locally analytic functions and their strong duals

This layer builds the function spaces. Analytic functions on a closed disc with their Gauss valuation are the local building blocks; functions analytic on every residue ball of a fixed radius form the Banach stages `LA_h`, whose union is the space of locally analytic functions with its compact-type inductive-limit topology; the strong dual is the space of locally analytic distributions, with bounded measures inside it. The layer then records the strict-sequence and three-space results that are used to pass between Banach, Fréchet and compact-type spaces, and the chart-based construction on finite products of polydiscs and compact p-adic manifolds, with the completed tensor and strong-duality statements that the later layers use. Proposed home: `TauCeti/NumberTheory/Padics/LocallyAnalytic` (one variable) and `TauCeti/NumberTheory/Padics/AnalyticDistributions` (charts and polydiscs).

### 0.1 Discs, locally analytic functions and their distributions

Hypotheses shared by several targets of this subsection, cited by letter below: (a) L ⊆ ℂ_p is a closed subfield (a finite extension of ℚ_p in applications), v_p the valuation with v_p(p) = 1, and ℓ(n) the number of base-p digits of n (ℓ(0) = 0).

**Analytic functions on a closed disc** (definition). For a ∈ L and r ∈ ℝ, let B(a, r) = {x ∈ ℂ_p : v_p(x − a) ≥ r}. An(B(a, r), L) is the space of φ(x) = Σ_k a_k(x − a)^k with a_k ∈ L and v_p(a_k) + kr → +∞, with the Gauss valuation v_{B(a,r)}(φ) = inf_k(v_p(a_k) + kr). It is an L-Banach space; v_{B(a,r)} is multiplicative (v(φ₁φ₂) = v(φ₁) + v(φ₂)), equals inf_{x∈B(a,r)} v_p(φ(x)) (maximum principle), and the (x − a)^k/p^{[kr]} form a Banach basis (orthonormal if r ∈ ℤ), so An(B(a, r), L) = L ⊗̂_K An(B(a, r), K) for a closed subfield K ∋ a. Under (a). Its API consists of `discAnalytic` (An(B(a, r), L) with the Gauss valuation), `gaussVal_mul` (v(φ₁φ₂) = v(φ₁) + v(φ₂)) and `gaussVal_eq_inf` (v_{B(a,r)}(φ) = inf_{x∈B(a,r)} v_p(φ(x))). (Source: Colmez, §I.4.1, Propositions I.4.2 and I.4.3, pp. 13–14.)

**Checks.**

- `gaussVal_X`: v_{B(0,0)}(x) = 0.
- `gaussVal_restrict_le`: Restriction to B(a, r + 1) does not decrease the valuation.
- `geometric_not_closed_disc` (non-example): Σ x^k is not analytic on the closed unit disc.

**Locally analytic functions of fixed radius** (construction). For h ∈ ℕ, LA_h(ℤ_p, L) is the space of φ : ℤ_p → L whose restriction to each a + p^hℤ_p is the restriction of some φ_{a,h} ∈ An(B(a, h), L), with v_{LA_h}(φ) = inf_a v_{B(a,h)}(φ_{a,h}) (the infimum may be taken over any set of representatives of ℤ_p/p^h). It is an L-Banach space with orthonormal basis e_{h,n}(x) = 1_{n+p^hℤ_p}(x)·((x + i(n))/p^h)^{m(n)} (n = (m(n) + 1)p^h − i(n), 1 ≤ i(n) ≤ p^h), LA_h(ℤ_p, L) = L ⊗̂_{ℚ_p} LA_h(ℤ_p, ℚ_p), and the inclusions LA_h ⊂ LA_{h+1} are continuous of norm ≤ 1. Since ℤ_p is compact, every locally analytic function lies in some LA_h, and LA(ℤ_p, L) = lim→_h LA_h(ℤ_p, L) carries the locally convex inductive-limit topology. Under (a). In addition: Tensor products: completed tensor products of L-Banach spaces with orthonormal bases are Colmez §I.1.4 (Proposition I.1.8, Corollary I.1.9), taken as given with the basis description. Its API consists of `LAh` (LA_h(ℤ_p, L) with v_{LA_h}), `LAh_mono` (LA_h ⊂ LA_{h+1}, norm-decreasing), `locallyAnalytic_iff_exists_LAh` (φ is locally analytic iff φ ∈ LA_h for some h) and `LA` (LA(ℤ_p, L) = lim→ LA_h with the inductive-limit topology). (Source: Colmez, §I.4.2, Remark I.4.4, Lemma I.4.5, Corollary I.4.6, pp. 14–15; RJW, Definition 3.40 and the description of C^{n−an}, p. 24.)

*Needs:* §0.1 `discAnalytic`.

**Checks.**

- `indicator_mem_LAh`: 1_{a+p^hℤ_p} ∈ LA_h with valuation 0.
- `LAh_basis_orthonormal`: The e_{h,n} are an orthonormal basis.
- `indicator_not_mem_LAh_pred` (non-example): 1_{a+p^hℤ_p} ∉ LA_{h−1}.

**Amice's theorem on Mahler coefficients** (theorem). For every h ∈ ℕ, the functions [n/p^h]!·C(x, n) (n ∈ ℕ) form an orthonormal basis of LA_h(ℤ_p, L). Consequently a continuous φ with Mahler coefficients a_n(φ) is locally analytic if and only if lim inf_n v_p(a_n(φ))/n > 0; if φ ∈ LA_h then lim inf v_p(a_n(φ))/n ≥ 1/((p − 1)p^h). Under (a). In addition: Mahler's theorem (the C(x, n) are an orthonormal basis of C⁰(ℤ_p, L)) is Mathlib's PadicInt.mahlerEquiv. (Source: Colmez, Theorem I.4.7 and Corollary I.4.8, p. 15.)

*Needs:* §0.1 `LAh`; Mathlib `PadicInt.mahlerEquiv`.

**The locally analytic topology is finer** (lemma). The inclusion LA(ℤ_p, L) ⊂ C⁰(ℤ_p, L) is continuous with dense image (locally constant functions are dense in C⁰), but the inductive-limit topology on LA(ℤ_p, L) is strictly finer than the topology induced from C⁰. Equality of the underlying functions is not equality of their topologies: a sequence of locally analytic functions converging uniformly need not converge in LA(ℤ_p, L). Under (a). (Source: RJW, Remark 3.41, p. 24.)

*Needs:* §0.1 `LAh`; §0.1 (Amice's theorem on Mahler coefficients).

**Locally analytic distributions** (definition). D(ℤ_p, L) is the space of continuous linear forms on LA(ℤ_p, L), i.e. of linear forms whose restriction to every LA_h is continuous. With the valuations v_{LA_h}(μ) = inf_{φ≠0}(v_p(μ(φ)) − v_{LA_h}(φ)) it is a Fréchet space, equal as a topological vector space to the projective limit lim← D_h of the Banach duals D_h = LA_h(ℤ_p, L)′ (which is also its strong dual topology). Restricting a bounded measure to LA(ℤ_p, L) gives an injective continuous map M(ℤ_p, L) → D(ℤ_p, L), by density of LA in C⁰. Under (a). In addition: Bounded measures M(ℤ_p, L) = C⁰(ℤ_p, L)′ are PadicMeasuresIwasawaAlgebras' objects (its L0). That the projective-limit topology equals the strong dual topology uses the open mapping theorem for compact-type limits (Schneider–Teitelbaum, via [GKPS]); only the projective-limit description is used below. Its API consists of `Dist` (D(ℤ_p, L), the continuous dual of LA(ℤ_p, L)), `valLAh` (The Fréchet valuations v_{LA_h}), `measureToDist` (M(ℤ_p, L) → D(ℤ_p, L), restriction) and `measureToDist_injective` (The restriction map is injective). (Source: RJW, Definition 3.42 and Remark 3.44, pp. 24–25; Colmez, §II.2 opening, pp. 29–30.)

*Needs:* §0.1 `LAh`; §0.1 (The locally analytic topology is finer); PadicMeasuresIwasawaAlgebras L0.

**Checks.**

- `dirac_mem`: δ_a is a distribution.
- `measureToDist_injective`: Measures embed in distributions.
- `derivative_at_zero_not_measure` (non-example): φ ↦ φ′(0) is a distribution but not a measure.

**F-analytic against ℚ_p-analytic functions** (lemma). Let F/ℚ_p be finite, 𝒪 = 𝒪_F viewed both as a locally F-analytic group G and, by restriction of scalars, as a locally ℚ_p-analytic group G₀ of dimension [F : ℚ_p], and K ⊆ ℂ_p complete containing F. The inclusion C^an(G, K) ⊂ C^an(G₀, K) identifies the F-analytic functions with the closed subspace of ℚ_p-analytic f satisfying the Cauchy–Riemann equations (tx)f = t·(xf) for x in the Lie algebra and t ∈ F, and is a homeomorphism onto this image. Dually D(G₀, K) → D(G, K) is a surjective quotient map of Fréchet algebras. A locally ℚ_p-analytic character χ of G₀ is F-analytic exactly when dχ is F-linear. In addition: Schneider–Teitelbaum work with a commutative locally F-analytic group; only G = 𝒪_F is used here. (Source: Schneider–Teitelbaum, Introduction, p. 1, and Lemmas 1.1–1.3, pp. 3–5.)

*Needs:* §0.1 `LAh`.

### 0.2 Strict sequences and three-space properties

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Strict sequences and left-heart extensions** (comparison). For Hausdorff nonarchimedean locally convex K-spaces, a sequence 0→V₁→V→V₂→0 is strictly exact precisely when the first map identifies V₁ with the closed kernel of the second and the second induces the quotient topology. Such a sequence determines an exact sequence in the left heart. Conversely, an extension in the left heart whose middle object is a genuine space has this description. The left heart and its embedding are imported foundations, not a new category defined here. Under (a). (Source: Colmez–Nizioł, Appendix A, Lemmas A.1–A.4 and Remark A.6, printed pp. 58–59; derived from the cited passage, not printed there.)

*Needs:* Tau Ceti `TauCeti.HasZeroSequenceOfUnits.isQuotientMap`.

**Extensions of Banach spaces** (theorem). An exact extension in the left heart of Hausdorff locally convex K-spaces with Banach outer terms is represented by a Banach middle term. K is a complete nonarchimedean field. No splitting hypothesis is required. Under (a). (Source: Colmez–Nizioł, Appendix A, Lemma A.1, printed p. 58; derived from the cited passage, not printed there.)

*Needs:* §0.2 (Strict sequences and left-heart extensions).

**The nonarchimedean Hahn–Banach theorem** (theorem). Let K be spherically complete (every decreasing sequence of closed balls has nonempty intersection), V a normed K-vector space, U ⊆ V a subspace and ℓ : U → K a continuous linear functional. Then ℓ extends to a continuous linear functional on V of the same operator norm; consequently for every v ∉ closure(U) there is a continuous functional vanishing on U with ℓ(v) = 1, and the continuous dual separates points of V. Over a field that is not spherically complete the norm-preserving extension fails in general, and the separation statement is retained only for V with a countable orthogonal basis (the separable case), where it is proved by extending along the basis. In addition: K is a field complete for a nontrivial nonarchimedean absolute value; spherical completeness is a hypothesis of the first statement and is not implied by completeness (ℂ_p is not spherically complete). (Source: Ingleton, the theorem of the paper; Schneider, Chapter II §9, the Hahn–Banach theorem and its corollaries.)

*Needs:* Mathlib `ContinuousLinearMap`, `IsUltrametricDist`.

**Splitting under spherical completeness or separability** (theorem). In the preceding Banach extension a continuous K-linear section of V→V₂ exists if K is spherically complete or if both outer Banach spaces have a dense subspace of countable K-dimension. The disjunction is essential to the source statement. Under (a). (Source: Colmez–Nizioł, Appendix A, Lemma A.2, printed p. 58; derived from the cited passage, not printed there.)

*Needs:* §0.2 (Extensions of Banach spaces); §0.2 (the nonarchimedean Hahn–Banach theorem, stated there).

**Extensions of Fréchet spaces** (theorem). An exact left-heart extension with Fréchet outer terms is represented by a Fréchet middle term over a complete nonarchimedean K. This result makes no assertion of a continuous splitting. Under (a). (Source: Colmez–Nizioł, Appendix A, Lemma A.3, printed p. 58; derived from the cited passage, not printed there.)

*Needs:* §0.2 (Strict sequences and left-heart extensions); §0.2 (Extensions of Banach spaces).

**Extensions of spaces of compact type** (theorem). An exact left-heart extension with compact-type outer terms has compact-type middle term if K is spherically complete or both outer terms are separable. Compact type means a countable inductive limit of Banach spaces with injective compact transition maps, with its locally convex limit topology. Under (a). (Source: Colmez–Nizioł, Appendix A, Lemma A.4, printed pp. 58–59; derived from the cited passage, not printed there.)

*Needs:* §0.2 (Strict sequences and left-heart extensions); §0.2 (Extensions of Fréchet spaces); §0.2 (Splitting under spherical completeness or separability).

### 0.3 Polydiscs, charts and compact manifolds

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

Source for this subsection unless a target says otherwise: Schneider–Teitelbaum, §1, Lemmas 1.1–1.2 and Proposition 1.4, printed pp. 3–6; derived from the cited passage, not printed there.

**Analytic functions on finitely many polydiscs** (construction). For a finite clopen chart set S and coordinates z∈Z_p^d, the radius-h analytic stage is the finite product over S of restricted power series in normalized coordinates (z−a)/p^h. Coefficients tend to zero outside finite subsets of N^d; the norm is the maximum coefficient norm. Its coefficient model is native c₀(S×N^d,K). The chart realization, rather than a second power-series carrier, identifies this with actual functions. Under (a). Its API consists of `analyticStage` (The normalized coefficient Banach model c₀(S×N^d,K)), `analyticStage_ext` (Equality is coefficientwise equality) and `analyticStage_single` (A monomial on one chart has its specified single coefficient).

*Needs:* §0.1 `discAnalytic`; Mathlib `ZeroAtInftyContinuousMap`.

**Checks.**

- `AnalyticDistributionTests.analyticStage_point` (compatibility): For S and N^0 both singleton, evaluation at the unique index is a continuous linear isometry to K.
- `AnalyticDistributionTests.analyticStage_empty` (degenerate): The empty chart set gives the zero space.
- `AnalyticDistributionTests.analyticStage_geometric_excluded` (non-example): The coefficient family constantly 1 in positive dimension is not a radius-h analytic stage element.

**Compact restriction to a smaller radius** (lemma). For finite p-adic charts, restriction from analytic radius h to radius h+1 is a continuous injective K-linear map and is completely continuous. After splitting into the finitely many smaller residue charts, the omitted destination Taylor coefficients of total degree≥N contribute at most C|p|^N; C depends only on the fixed normalization. Under (a).

*Needs:* §0.3 `analyticStage`; §4.1 `finiteImage_isCompletelyContinuous`.

**A common analytic radius on a compact manifold** (lemma). Every locally Q_p-analytic function on a compact finite-dimensional p-adic analytic manifold belongs to a finite-chart analytic stage at one common radius. Every finite family of such functions belongs to a common stage. Under (a).

*Needs:* §0.3 `analyticStage`; §0.1 `LAh`.

**Continuity of analytic chart pullback** (lemma). An analytic map between finite-chart compact p-adic manifolds induces continuous pullback on locally analytic functions. On any fixed target Banach stage, it factors through a sufficiently small source Banach stage by bounded multivariate substitution. Radii may change. Under (a).

*Needs:* §0.3 `analyticStage`; §0.3 (A common analytic radius on a compact manifold).

**Independence of the analytic atlas** (lemma). Two finite analytic chart systems on the same compact p-adic manifold give canonically isomorphic locally analytic spaces with the same locally convex topology. The identity on functions gives a continuous K-linear equivalence. Under (a).

*Needs:* §0.3 (Continuity of analytic chart pullback); §0.3 (A common analytic radius on a compact manifold).

**Products and completed analytic tensors** (comparison). For compact p-adic analytic X,Y over a finite extension K/Q_p, the external product induces LA(X,K)⊗̂_ι LA(Y,K)≃LA(X×Y,K); at fixed finite-chart stages the corresponding Banach projective tensor identifies c₀(I,K)⊗̂_π c₀(J,K) with c₀(I×J,K). The inductive and projective completion symbols are distinct until their required compact-type comparison is proved. Under (a).

*Needs:* §0.3 `analyticStage`; §0.3 (Compact restriction to a smaller radius); §0.3 (Independence of the analytic atlas).

**Strong duality for analytic compact-type spaces** (comparison). Over finite K/Q_p, LA(X,K) for compact analytic X is of compact type; its strong continuous dual is a nuclear Fréchet space identified with the projective limit of the Banach-stage duals, and the canonical strong bidual map is an isomorphism. Under (a).

*Needs:* §0.3 (Compact restriction to a smaller radius); §0.3 (Independence of the analytic atlas); §0.1 `Dist`.

### Examples

The function x on the closed unit disc has Gauss valuation 0; Σ xᵏ converges on the open disc but is not analytic on the closed one; the indicator of a + pʰℤ_p lies in `LA_h` and not in `LA_{h−1}`; the sequence pⁿ·binom(x, p^{2n}) tends to zero uniformly but not in the locally analytic topology; the derivative at zero is a locally analytic distribution that is not a bounded measure.

### Dependencies

Mathlib (`PadicInt.mahlerEquiv`, `ZeroAtInftyContinuousMap`, `ContinuousLinearMap`, `LocallyConstant`, nonarchimedean infinite sums); PadicMeasuresIwasawaAlgebras L0 (bounded measures and their topologies) and L2 (the Mahler basis and bounded Amice transform). No earlier layer.

## Layer 1: the unbounded Amice transform and operations on distributions

This layer extends the bounded Amice transform of PadicMeasuresIwasawaAlgebras to all locally analytic distributions on ℤ_p and develops the toolbox that the p-adic L-function constructions use: evaluation of series on the open disc, pushforward, convolution and multiplication of distributions, the Amice dictionary for point masses, convolution, multiplication by x, character twists, clopen restriction, the transpose derivative, dilation and ψ, division by the coordinate on the units, local primitives, and the two non-splitting theorems that explain why a locally analytic primitive is only determined up to a locally constant function. Proposed home: `TauCeti/NumberTheory/Padics/LocallyAnalytic` and `TauCeti/NumberTheory/Padics/Mellin` (open-disc series).

### 1.1 The Amice transform of distributions and its toolbox

Hypotheses shared by several targets of this subsection, cited by letter below: (a) L ⊆ ℂ_p is a closed subfield (a finite extension of ℚ_p in applications), v_p the valuation with v_p(p) = 1, and ℓ(n) the number of base-p digits of n (ℓ(0) = 0).

**The Amice transform of distributions** (theorem). For μ ∈ D(ℤ_p, L) let A_μ(T) = ∫(1 + T)^x μ(x) = Σ_n T^n ∫C(x, n)μ ∈ L⟦T⟧. Then μ ↦ A_μ is an isomorphism of Fréchet spaces from D(ℤ_p, L) onto R⁺, the power series converging on the open unit disc v_p(T) > 0 with the valuations v_{B(0,u_h)}, u_h = 1/((p − 1)p^h). Precisely, v_{B(0,u_h)}(A_μ) ≥ v_{LA_h}(μ) ≥ v_{B(0,u_{h+1})}(A_μ) − 1. Moreover ∫(1 + z)^x μ = A_μ(z) for v_p(z) > 0, and on bounded measures A_μ is the bounded Amice (Mahler) transform, so D ⊃ M corresponds to R⁺ ⊃ 𝒪_L⟦T⟧ ⊗ L. Under (a). In addition: The bounded transform on measures is PadicMeasuresIwasawaAlgebras' (its L2 targets, e.g. bounded-inverse-amice). (Source: Colmez, Lemma II.2.1 and Theorem II.2.2, p. 30; RJW, Theorem 3.43 and (3.12), p. 25.)

*Needs:* §0.1 `Dist`; §0.1 (Amice's theorem on Mahler coefficients); PadicMeasuresIwasawaAlgebras L2/bounded-inverse-amice; PadicMeasuresIwasawaAlgebras L2/amice-dirac-natural.

**Operations on distributions** (theorem). The bounded toolbox extends continuously to D(ℤ_p, L), with the following Amice transforms (∂ = (1 + T)d/dT). Dirac masses: A_{δ_a} = (1 + T)^a, and the span of Dirac masses at natural numbers is dense. Multiplication by a locally analytic function; in particular A_{xμ} = ∂A_μ and A_{z^xμ}(T) = A_μ((1 + T)z − 1) for v_p(z − 1) > 0. Restriction to b + p^nℤ_p: A_{Res μ}(T) = p^{−n}Σ_{η∈μ_{p^n}} η^{−b}A_μ((1 + T)η − 1). Derivative (∫φ dμ = ∫φ′μ): A_{dμ} = log(1 + T)·A_μ. σ_a (a ∈ ℤ_p^×), φ and ψ: A_{σ_aμ} = A_μ((1 + T)^a − 1), A_{φμ} = A_μ((1 + T)^p − 1), A_{ψμ} = ψ(A_μ), with ψφ = id, σ_a commuting with φ and ψ, ψ(μ) = 0 iff μ is supported on ℤ_p^×, and Res_{ℤ_p^×} = 1 − φψ. Convolution: A_{λ∗μ} = A_λA_μ. Under (a). In addition: The bounded versions of these operations are PadicMeasuresIwasawaAlgebras L2 (restriction, φ, ψ, weights); here they are extended by continuity along the Amice isomorphism. (Source: Colmez, §II.4.1–II.4.6, pp. 34–37.)

*Needs:* §1.1 (The Amice transform of distributions); PadicMeasuresIwasawaAlgebras L2/phi-measure; PadicMeasuresIwasawaAlgebras L2/psi-measure; PadicMeasuresIwasawaAlgebras L2/amice-weight; PadicMeasuresIwasawaAlgebras L2/amice-phi.

**Division by x, primitives and logarithmic factors** (lemma). (1) Division by x on D(ℤ_p, L) is defined only up to adding a multiple of δ₀: A_{x^{−1}μ} is a primitive of (1 + T)^{−1}A_μ. For μ supported on ℤ_p^× there is a unique x^{−1}μ supported on ℤ_p^×, without using any global function x^{−1} on ℤ_p. (2) For n ∈ ℕ, b ∈ ℤ_p and k ∈ ℤ, ∫_{b+p^nℤ_p} x^k μ = p^{−n}Σ_{η∈μ_{p^n}} η^{−b}(∂^kA_μ)(η − 1) whenever k ≥ 0, or k ≤ −1 and b ∉ p^nℤ_p. For k ≤ −1, ∂^kA_μ = ∂^{−|k|}A_μ is determined only up to a polynomial of degree ≤ |k| − 1 in log(1 + T), and the right side does not depend on this choice because log η = 0 for η ∈ μ_{p^n} and Σ_η η^{−b} = 0 for b ∉ p^nℤ_p. (3) On a function side, d/dx : C^r(ℤ_p, L) → C^{r−1}(ℤ_p, L) is surjective for r ≥ 1 with kernel the closure of the locally constant functions: primitives exist and are unique only up to adding a function in that closure, not up to a single global constant. Under (a). In addition: C^r and its Banach basis are L2/c-r-functions; the integral (bounded) unit-support division is PadicMeasuresIwasawaAlgebras L2/inverse-mahler-unique. (Source: Colmez, §II.4.2 (division par x), Proposition II.4.1, and Proposition I.5.16, pp. 24 and 35.)

*Needs:* §1.1 (Operations on distributions); §2.1 `Cr`; PadicMeasuresIwasawaAlgebras L2/inverse-mahler-unique.

### 1.2 Series on the open disc

Hypotheses shared by several targets of this subsection, cited by letter below: (a) K is a finite extension of Q_p with its normalized nonarchimedean absolute value; the elementary series lemmas also hold over any complete nontrivially normed ultrametric field. (b) An open-disc series F means a native power series with ||a_n|| R^n tending to zero for every real 0<R<1. Write E(F,t) for the native FormalMultilinearSeries.ofScalarsSum of its coefficients; analytic uses require ||t||<1. No convergence claim is made at ||t||=1.

Source for this subsection unless a target says otherwise: Colmez, §II.2, Lemma II.2.1 and Theorem II.2.2 with proofs, author PDF p. 30; derived from the cited passage, not printed there.

Library inputs of this subsection, used by several of its targets: Mathlib `PowerSeries.isRestricted_iff'`.

**Open-disc series and the native analytic radius** (comparison). For an open-disc series F, the native scalar formal multilinear series ofScalars(K,coeff(F)) has radius at least 1. E(F,t) is therefore the sum of this native analytic series on ||t||<1. This is an adapter between two existing library encodings, not a second definition of summation or of analyticity. Under (a) and (b).

*Needs:* §1.1 (The Amice transform of distributions); Mathlib `FormalMultilinearSeries.ofScalars`, `FormalMultilinearSeries.ofScalars_norm`, `FormalMultilinearSeries.le_radius_of_bound`, `FormalMultilinearSeries.ofScalars_sum_eq`.

**Summability inside the open disc** (lemma). For every open-disc series F and t∈K with ||t||<1, the series Σ_n a_n t^n is summable in K. Under (a) and (b).

*Needs:* §1.1 (The Amice transform of distributions); Mathlib `NonarchimedeanGroup.multipliable_of_tendsto_cofinite_one`.

**Uniform geometric tails on a smaller disc** (lemma). Let 0<R<S<1, M≥0, and ||a_n||S^n≤M for every n. For ||t||≤R and N≥0, ||E(F,t)−Σ_{n<N}a_n t^n||≤M(R/S)^N. Thus truncations converge uniformly on the closed radius-R disc; this is a coefficient estimate, with no compactness assumption on that disc. Under (a) and (b).

*Needs:* §1.2 (Summability inside the open disc).

**Analytic evaluation of an open-disc series** (theorem). For every open-disc series F, the function E(F,−):K→K is analytic at every t with ||t||<1, using Mathlib’s AnalyticOnNhd. This does not identify an arbitrary function on C_p-valued points with a rigid analytic function. Under (a) and (b).

*Needs:* §1.2 (Open-disc series and the native analytic radius); Mathlib `FormalMultilinearSeries.analyticOnNhd`.

**Evaluation preserves products inside the disc** (lemma). For open-disc series F,H and ||t||<1, E(FH,t)=E(F,t)E(H,t). The corresponding additivity and scalar-linearity follow from summability. Under (a) and (b).

*Needs:* §1.2 (Summability inside the open disc); Mathlib `HasSum.mul_of_nonarchimedean`.

**Evaluation commutes with an isometric coefficient extension** (lemma). For an isometric field homomorphism φ:K→K′ into a complete ultrametric field, an open-disc series F and ||t||<1, E(map(φ,F),φ(t))=φ(E(F,t)). The coefficient map is the native PowerSeries.map; no arbitrary C_p-point function or completed distribution-family object is introduced. Under (a) and (b).

*Needs:* §1.2 (Summability inside the open disc); Mathlib `PowerSeries.map`, `PowerSeries.coeff_map`.

### 1.3 Pushforward, convolution and multiplication

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

Source for this subsection unless a target says otherwise: Colmez, §II.4, printed pp. 34–37; derived from the cited passage, not printed there.

**Pushforward of analytic distributions** (construction). For an analytic map f:X→Y of compact p-adic manifolds, define f_*μ by (f_*μ)(g)=μ(g∘f). This is a continuous K-linear map D(X,K)→D(Y,K) for the strong dual topologies. Under (a). Its API consists of `distributionPushforward` (Transpose a continuous analytic pullback), `distributionPushforward_apply` (Evaluation is μ applied to pullback) and `distributionPushforward_comp` ((g∘f)_*=g_*∘f_*).

*Needs:* §0.3 (Continuity of analytic chart pullback); §0.3 (Strong duality for analytic compact-type spaces).

**Checks.**

- `AnalyticDistributionTests.pushforward_identity` (compatibility): Transposing the identity returns μ.
- `AnalyticDistributionTests.pushforward_zero` (degenerate): The zero distribution pushes forward to zero.
- `AnalyticDistributionTests.pushforward_constant`: For constant f with value y, f_*μ=μ(1)δ_y.

**Convolution by iterated analytic evaluation** (construction). For a compact analytic group G, (λ*μ)(f)=μ(y↦λ(x↦f(xy))). This defines a distribution; it is associative with unit δ_1. For abelian G it is commutative. For additive Z_p write f(x+y). Under (a). Its API consists of `distributionConvolution` (Push forward the tensor distribution along group multiplication), `distributionConvolution_apply` (Its value is the specified iterated integral) and `distributionConvolution_assoc` (Convolution is associative).

*Needs:* §0.3 (Products and completed analytic tensors); §1.3 `distributionPushforward`.

**Checks.**

- `AnalyticDistributionTests.convolution_atoms`: δ_a*δ_b=δ_ab.
- `AnalyticDistributionTests.convolution_unit` (degenerate): δ_1*μ=μ.
- `AnalyticDistributionTests.convolution_bounded` (compatibility): On imported bounded measures it agrees with their convolution.

**Multiplication by an analytic function** (construction). For g∈LA(X,K), define gμ by (gμ)(f)=μ(gf). Multiplication is K-linear in μ, continuous for each fixed g, and satisfies (g₁g₂)μ=g₁(g₂μ). Under (a). Its API consists of `distributionMultiply` (Transpose multiplication on analytic test functions), `distributionMultiply_apply` ((gμ)(f)=μ(gf)) and `distributionMultiply_assoc` (Successive multiplications multiply their analytic factors).

*Needs:* §0.3 `analyticStage`; §0.3 (Strong duality for analytic compact-type spaces).

**Checks.**

- `AnalyticDistributionTests.multiply_one` (degenerate): 1μ=μ.
- `AnalyticDistributionTests.multiply_atom`: gδ_x=g(x)δ_x.
- `AnalyticDistributionTests.multiply_bounded` (compatibility): For bounded μ and continuous g this agrees with imported bounded-measure multiplication.

### 1.4 The Amice dictionary for the standard operators

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

Source for this subsection unless a target says otherwise: Colmez, §II.4, printed pp. 34–37; derived from the cited passage, not printed there.

**Amice transform of a point mass** (lemma). For a∈Z_p, A(δ_a)=(1+T)^a, with nth coefficient binom(a,n). The power is the native continuous p-adic binomial character. Under (a).

*Needs:* §1.1 (The Amice transform of distributions); PadicMeasuresIwasawaAlgebras L2/field-bounded-amice-isometry.

**Unbounded Amice convolution identity** (lemma). For λ,μ∈D(Z_p,K), A(λ*μ)=A(λ)A(μ). The identity is in the Fréchet algebra of functions on the open unit disc, without boundedness of coefficients. Under (a).

*Needs:* §1.3 `distributionConvolution`; §1.1 (The Amice transform of distributions); §1.2 (Evaluation preserves products inside the disc).

**Coordinate multiplication under Amice** (lemma). A(xμ)=(1+T)·dA(μ)/dT for any locally analytic distribution μ, with the native formal-series derivative interpreted analytically on the open disc. Under (a).

*Needs:* §1.3 `distributionMultiply`; §1.1 (The Amice transform of distributions).

**Additive character twist under Amice** (lemma). If |z−1|<1, then A(z^x μ)(T)=A(μ)(z(1+T)−1). The substitution maps the open unit disc to itself; z^x is locally analytic after a sufficiently small radius choice. Under (a).

*Needs:* §1.3 `distributionMultiply`; §1.1 (The Amice transform of distributions); §0.3 (A common analytic radius on a compact manifold).

**Fourier formula for clopen restriction** (lemma). After extending K to contain μ_(p^n), A(1_(b+p^nZ_p)μ)(T)=p^(−n)Σ_(η^(p^n)=1)η^(−b)A(μ)(η(1+T)−1). The finite character average descends to K and is independent of the integer representative b. Under (a). (Source: Colmez, §II.4.3 and Proposition II.4.1, printed p. 35; derived from the cited passage, not printed there.)

*Needs:* §1.3 `distributionMultiply`; §1.4 (Additive character twist under Amice).

**The transpose derivative and logarithm** (lemma). With the convention (dμ)(f)=μ(f′), A(dμ)=log(1+T)A(μ). No integration-by-parts minus sign is used. Under (a).

*Needs:* §1.1 (The Amice transform of distributions); §0.1 `LAh`.

**Dilation and the φ operator** (lemma). For a∈Z_p, pushforward along x↦ax sends A(μ)(T) to A(μ)((1+T)^a−1). For a=p this is φ; for a=0 it is the constant series μ(1). Under (a). (Source: Colmez, §II.4.5, printed pp. 35–36; derived from the cited passage, not printed there.)

*Needs:* §1.3 `distributionPushforward`; §1.1 (The Amice transform of distributions).

**The ψ operator and support on units** (lemma). Define ψμ by first restricting μ to pZ_p, then pushing forward under x↦x/p. Then ψφ=1, φψ is restriction to pZ_p, and μ−φψμ is restriction to Z_p^×. Thus ψμ=0 exactly when μ is supported on Z_p^×. Under (a). (Source: Colmez, §II.4.5, printed p. 36; derived from the cited passage, not printed there.)

*Needs:* §1.4 (Dilation and the φ operator); §1.3 `distributionMultiply`; §1.3 `distributionPushforward`.

**Canonical coordinate division away from zero** (lemma). If μ is supported on Z_p^×, multiplication by x is continuously invertible on that support, with inverse μ↦x^(−1)μ. In the full space D(Z_p,K), coordinate division has ambiguity Kδ_0, as already specified by the primitive construction. Under (a).

*Needs:* §1.3 `distributionMultiply`; §1.1 (Division by x, primitives and logarithmic factors); §1.4 (The ψ operator and support on units).

### 1.5 Primitives, non-splitting and logarithmic factors

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Local primitives with a radius loss** (lemma). Every analytic function on a closed p-adic disc admits a primitive on each strictly smaller closed disc; every locally analytic function on compact Z_p admits a locally analytic primitive. The kernel of d/dx on LA(Z_p,K) is the locally constant functions. Under (a). (Source: Colmez, §I.5, Proposition I.5.16, printed pp. 24–25; Kohlhaase Corollary 4.3, printed p. 21; derived from the cited passage, not printed there.)

*Needs:* §0.1 `discAnalytic`; §0.3 (A common analytic radius on a compact manifold).

**No continuous section of analytic differentiation** (theorem). For finite K/Q_p, the continuous surjection d/dx:LA(Z_p,K)→LA(Z_p,K), with kernel LC(Z_p,K), has no continuous K-linear right inverse. Under (a). (Source: Kohlhaase, §4, Proposition 4.2 and Corollary 4.3, printed pp. 20–21; derived from the cited passage, not printed there.)

*Needs:* §1.5 (Local primitives with a radius loss); §0.3 (Strong duality for analytic compact-type spaces).

**The nonsplit logarithm sequence** (theorem). Under unbounded Amice duality, the transpose of differentiation is multiplication by t=log(1+T). The sequence 0→tR⁺→R⁺→R⁺/tR⁺→0 is strict exact and has no continuous K-linear splitting, where R⁺=O(D(0,1)^−) has its Fréchet topology. Under (a). (Source: Colmez–Nizioł, Appendix A, Remark A.6, printed p. 59; derived from the cited passage, not printed there.)

*Needs:* §1.4 (The transpose derivative and logarithm); §1.5 (No continuous section of analytic differentiation); §0.3 (Strong duality for analytic compact-type spaces).

**Cancellation in logarithmic derivative quotients** (lemma). If ν=dμ, then A(ν)/log(1+T) extends analytically to A(μ), including every p-power torsion zero of the logarithm. General ν need not be divisible by log(1+T), so a distribution primitive is not automatic. Under (a). (Source: Colmez, §II.4, printed pp. 34–37; derived from the cited passage, not printed there.)

*Needs:* §1.4 (The transpose derivative and logarithm); §1.2 (Evaluation preserves products inside the disc).

### Examples

The Amice transform of δ_a is (1+T)^a; the derivative transposes to multiplication by log(1+T) and multiplication by x to (1+T)·d/dT; ψ ∘ φ is the identity while φ ∘ ψ restricts to pℤ_p; the series log(1+T) has every radius below one but is not restricted at radius one; the measure Σ_{n} p^{-n} δ_{p^n} is not a distribution on the units after division by x without the stated support hypothesis.

### Dependencies

Layer 0 (stages, distributions, charts); Mathlib `PowerSeries`, `AbstractMeasure.amiceTransform`; PadicMeasuresIwasawaAlgebras L2 (bounded Amice transform, φ, ψ, dilation, residue restriction) and L3 (pseudo-measures).

## Layer 2: admissible growth, vector order and uniqueness

This layer defines admissibility. Colmez's spaces of functions of class C^r and the distributions of order r are defined on ℤ_p by explicit norm estimates; order zero is identified with bounded measures; the Amice–Vélu–Vishik theorem extends a distribution from locally polynomial test functions of degree below the order and proves the strict degree bound is sharp. In several variables the vector order is defined by the completed tensor of one-variable C^{r_i} spaces, with rectangular growth bounds, extension and uniqueness theorems, the critical counterexample, and the adapters that turn conductor-indexed growth bounds into analytic ray-class distributions. Proposed home: `TauCeti/NumberTheory/Padics/LocallyAnalytic` and `TauCeti/NumberTheory/Padics/AnalyticDistributions`.

### 2.1 Functions of class C^r and distributions of order r

Hypotheses shared by several targets of this subsection, cited by letter below: (a) L ⊆ ℂ_p is a closed subfield (a finite extension of ℚ_p in applications), v_p the valuation with v_p(p) = 1, and ℓ(n) the number of base-p digits of n (ℓ(0) = 0).

**Functions of class C^r** (definition). For r ≥ 0, φ : ℤ_p → L is of class C^r if there are φ^{(j)} (0 ≤ j ≤ [r]) with ε(x, y) = φ(x + y) − Σ_{j≤[r]} φ^{(j)}(x)y^j/j! satisfying inf_{x∈ℤ_p, y∈p^hℤ_p}(v_p(ε(x, y))) − rh → +∞. C^r(ℤ_p, L) is an L-Banach space (valuation v′_{C^r}), equivalently normed by v_{C^r}(φ) = inf_n(v_p(a_n(φ)) − rℓ(n)) on Mahler coefficients, with Banach bases p^{[rℓ(n)]}C(x, n) and the wavelet basis e_{i,k,r} (i ∈ ℕ, 0 ≤ k ≤ [r]) of locally polynomial functions of degree ≤ [r]. In particular locally polynomial functions of degree ≤ [r] are dense in C^r, LA_h ⊂ C^r with v_{C^r}(φ) ≥ v_{LA_h}(φ) − rh − C₁(r), and C⁰ is the space of continuous functions. Under (a). Its API consists of `Cr` (C^r(ℤ_p, L) with v_{C^r}), `Cr_mahler` (φ ∈ C^r iff v_p(a_n(φ)) − rℓ(n) → +∞) and `locallyPolynomial_dense_Cr` (LP^{[0,[r]]} is dense in C^r). (Source: Colmez, §I.5.1, Theorem I.5.14, Propositions I.5.13 and I.5.19, Theorem I.5.17, pp. 18–25.)

*Needs:* §0.1 (Amice's theorem on Mahler coefficients); Mathlib `PadicInt.mahlerEquiv`.

**Checks.**

- `Cr_zero_eq_continuous`: C⁰ = continuous functions.
- `Cr_mahler_iff`: The Mahler criterion for C^r.
- `digit_doubling_not_C2` (non-example): The digit-doubling function is not of class C².

**Distributions of order r (admissible distributions)** (definition). For r ≥ 0, a distribution μ ∈ D(ℤ_p, L) has order r (is r-admissible, or h-admissible with h = r) if it extends continuously to C^r(ℤ_p, L); D_r(ℤ_p, L) = C^r(ℤ_p, L)′. The following are equivalent: (a) μ ∈ D_r; (b) the Amice transform A_μ = Σ b_nT^n has v_p(b_n) + rℓ(n) bounded below (A_μ ∈ R⁺_r); (c) inf_h(v_{B(0,u_h)}(A_μ) + rh) > −∞; (d) v_{D_r}(μ) = inf_n(v_{LA_n}(μ) + rn) > −∞, i.e. ‖μ‖_{LA_n} = O(p^{rn}) (on the ball of radius p^{−n}); (e) there is C with v_p(∫_{a+p^nℤ_p}((x − a)/p^n)^k μ) ≥ C − rn for all a ∈ ℤ_p, k, n. The valuations of (b)–(e) are equivalent to v′_{D_r}, and μ ↦ A_μ is an isometry (D_r, v′_{D_r}) ≅ (R⁺_r, v_r). Orders add under products of transforms and under convolution. Under (a). In addition: Pollack–Stevens' 'h-admissible' (‖μ‖_s = O(s^{−h}) as s → 0⁺, their Definition 6.1) is (d) with r = h, s = p^{−n}; ModularSymbolsPadicLFunctions L2 requests it in this form. log(1 + T) has order 1; its powers log(1 + T)^j have order j. Its API consists of `DistOrder` (D_r(ℤ_p, L) = C^r(ℤ_p, L)′ inside D(ℤ_p, L)), `mem_distOrder_iff_amice` (μ ∈ D_r iff v_p(b_n) + rℓ(n) is bounded below), `mem_distOrder_iff_growth` (μ ∈ D_r iff inf_n(v_{LA_n}(μ) + rn) > −∞ (Pollack–Stevens' h-admissibility)) and `mem_distOrder_iff_riemann` (μ ∈ D_r iff the Riemann-sum bound holds). (Source: Colmez, §II.1, Lemma II.1.1, §II.3.1, Proposition II.3.1, Theorem II.3.2(i), Proposition II.3.3, pp. 29–34.)

*Needs:* §2.1 `Cr`; §1.1 (The Amice transform of distributions); §0.1 `Dist`.

**Checks.**

- `dirac_order_zero`: δ_a has order 0.
- `log_order_one`: log(1 + T) has order exactly 1.
- `infinite_order_example` (non-example): b_{p^k} = p^{−k²} gives a distribution of no finite order.

**Order zero is bounded measures** (theorem). D₀(ℤ_p, L) = C⁰(ℤ_p, L)′ is the space of bounded measures, and its Amice transforms are exactly the bounded power series 𝒪_L⟦T⟧ ⊗ L. A measure is determined by the values μ(a + p^nℤ_p), and conversely any family μ(a + p^nℤ_p) that depends only on a mod p^n, is additive (μ(a + p^nℤ_p) = Σ_{j<p} μ(a + jp^n + p^{n+1}ℤ_p)) and bounded below in valuation defines a unique measure, with ∫φ μ = lim_n Σ_{a<p^n} φ(a)μ(a + p^nℤ_p). Under (a). In addition: Bounded measures and their integral/bounded Amice transform are PadicMeasuresIwasawaAlgebras'; this target identifies them with the order-0 part of D. (Source: Colmez, §II.3.2, pp. 31–32.)

*Needs:* §2.1 `DistOrder`; PadicMeasuresIwasawaAlgebras L2/bounded-inverse-amice; PadicMeasuresIwasawaAlgebras L0.

**The Amice–Vélu–Vishik extension and uniqueness theorem** (theorem). Let r ≥ 0 and N ∈ ℕ ∪ {∞} with N ≥ [r]. Let μ be a linear form on the locally polynomial functions of degree ≤ N (equivalently, compatible values ∫_{a+p^nℤ_p} x^i μ for i ≤ N) such that for some C, v_p(∫_{a+p^nℤ_p}((x − a)/p^n)^k μ) ≥ C − rn for all a ∈ ℤ_p, k ≤ N, n ∈ ℕ. Then μ extends uniquely to a distribution of order r. In particular two distributions of order r that agree on locally polynomial functions of degree ≤ N coincide when N ≥ [r], i.e. when r < N + 1. For r = N + 1 uniqueness fails: d^{N+1}δ₀ (φ ↦ ±φ^{(N+1)}(0)) is a nonzero distribution of order N + 1 vanishing on all locally polynomial functions of degree ≤ N. Under (a). In addition: The strict threshold r < N + 1 is the small-slope condition h < k + 1 of ModularSymbolsPadicLFunctions L2 (N = k, r = h); at critical slope h = k + 1 this theorem does not apply. One-variable only: the multivariable version with a vector of radii is still to be decomposed (coverage). (Source: Colmez, Theorem II.3.2 and its proof, pp. 32–33; RJW, Theorem B.1 and the remarks after it, pp. 79–80.)

*Needs:* §2.1 `DistOrder`; §2.1 `Cr`.

### 2.2 Vector order: tensor wavelets and rectangular growth

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

Source for this subsection unless a target says otherwise: Loeffler, §2.3, Definitions 2.11–2.14, Remark 2.13 and Theorem 2.15, printed pp. 4–5; derived from the cited passage, not printed there.

**Tensor wavelets and vector order** (construction). For G=Z_p^g and r_i≥0, the vector-order function space is ⊗̂_π,i C^{r_i}(Z_p,K), using the Colmez C^r spaces. Tensor products of Colmez wavelets form a Banach basis; for 0≤r_i<1 their indicator wavelets have scaling p^(Σ_i floor(r_iℓ(n_i))). The coefficient norm is the c₀ sup norm in this scaled basis. This contract uses the intended tensor construction, not Loeffler Definition 2.12’s literal cofinite oscillation formula. Under (a). Its API consists of `anisotropicFunctionSpace` (The completed projective tensor of the one-variable C^{r_i} spaces), `anisotropicFunctionSpace_pure` (Finite pure tensors map to products of their actual one-variable functions) and `anisotropicFunctionSpace_basis` (Its tensor-wavelet coefficient map is a Banach equivalence with native c₀).

*Needs:* §2.1 `Cr`; §0.3 (Products and completed analytic tensors).

**Checks.**

- `AnalyticDistributionTests.anisotropic_order_zero` (compatibility): For r=(0,0), the tensor function space is C⁰(Z_p²,K).
- `AnalyticDistributionTests.anisotropic_empty` (degenerate): The empty tensor product is K.
- `AnalyticDistributionTests.anisotropic_one_coordinate`: With r=(1/2,0), the function 1_(pZ_p)(x₂) belongs as 1⊗1_(pZ_p).

**Rectangular locally constant wavelets** (lemma). When every 0≤r_i<1, the tensor wavelets of the preceding comparison are scaled characteristic functions of rectangular p-power cosets and form a Banach basis. Locally constant functions are dense in the vector-order function space. Under (a).

*Needs:* §2.2 `anisotropicFunctionSpace`.

**Rectangular growth for a locally constant functional** (definition). For a K-linear functional μ on LC(Z_p^g,K), rectangular growth ≤r means there is C≥0 such that |μ(1_(a+∏_i p^{m_i}Z_p))|≤C·p^(Σ_i r_i m_i) for every a and every tuple m_i≥0. This is a bound on actual clopen indicators and includes finite additivity earlier from linearity. Under (a). Its API consists of `RectangularGrowth` (The displayed uniform bound on all rectangular cosets), `rectangularGrowth_mono` (Increasing each component r_i preserves the bound) and `rectangularGrowth_add` (A sum of two bounded-growth functionals has the same growth order with a larger constant).

*Needs:* §2.2 `anisotropicFunctionSpace`.

**Checks.**

- `AnalyticDistributionTests.rectangularGrowth_dirac`: A point mass has growth r for every r_i≥0, with C=1.
- `AnalyticDistributionTests.rectangularGrowth_zero` (degenerate): The zero functional has C=0.
- `AnalyticDistributionTests.rectangularGrowth_refinement` (compatibility): A box mass equals the sum of its p children in a chosen coordinate.

**Extension of rectangular distributions** (theorem). For 0≤r_i<1, every locally constant functional with rectangular growth ≤r extends uniquely to a continuous functional on the tensor vector-order function space. Its norm is bounded in terms of the growth constant and the fixed wavelet normalization. Under (a).

*Needs:* §2.2 `RectangularGrowth`; §2.2 (Rectangular locally constant wavelets).

**Growth forced by the tensor dual norm** (lemma). A continuous functional on the tensor C^{r_i} space with every r_i<1 restricts to a locally constant functional with rectangular growth ≤r. Together with the extension theorem this characterizes the tensor dual by its box values and refinement relations. Under (a).

*Needs:* §2.2 (Rectangular locally constant wavelets); §2.2 `RectangularGrowth`.

**Compatible quasi-factor chart invariance** (lemma). For a compact abelian p-adic Lie group whose Lie algebra has a chosen direct-sum decomposition, vector growth and tensor function spaces are independent of the compatible closed subgroups with open product and of compatible analytic coordinates, up to equivalent norms. Chart changes must preserve the chosen summands. Under (a).

*Needs:* §2.2 `anisotropicFunctionSpace`; §2.2 `RectangularGrowth`; §0.3 (Independence of the analytic atlas).

**Multidegree admissibility and uniqueness** (theorem). Let N_i≥0 and 0≤r_i<N_i+1. A functional on locally polynomial functions of separate degree ≤N_i extends uniquely to the tensor C^{r_i} dual if, for each box a+p^mZ_p^g and multi-index 0≤j_i≤N_i, its unnormalized local moment obeys |μ(1_box·∏(x_i−a_i)^{j_i})|≤C·p^(Σ_i(r_i−j_i)m_i). Extra degrees above floor(r_i) satisfy this bound but are not needed for density. Under (a). (Source: Loeffler, Remark 2.13 and Theorem 2.15, printed p. 5; tensor deduction from Colmez Theorem II.3.5, printed pp. 32–33; derived from the cited passage, not printed there.)

*Needs:* §2.1 (The Amice–Vélu–Vishik extension and uniqueness theorem); §2.2 `anisotropicFunctionSpace`.

### 2.3 Uniqueness, the critical case and ray-class adapters

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Determination by finite characters and polynomial moments** (lemma). A tensor distribution of order r with r_i<N_i+1 is determined by all moments χ(x)∏x_i^{j_i} with finite-order χ of Z_p^g and 0≤j_i≤N_i, after a finite splitting-field coefficient extension. These functions span the locally polynomial test spaces at each finite residue level. Under (a). (Source: Loeffler, §2.3, Definitions 2.11–2.14, Remark 2.13 and Theorem 2.15, printed pp. 4–5; derived from the cited passage, not printed there.)

*Needs:* §2.2 (Multidegree admissibility and uniqueness).

**Failure at a critical coordinate order** (lemma). If r_i=N_i+1 in one coordinate, the tensor functional d_i^{N_i+1}δ_0 is nonzero, continuous of that order, and annihilates all separately locally polynomial tests of degree ≤N_i in that coordinate. Thus uniqueness from that test class fails at the endpoint. Under (a). (Source: Loeffler, §2.2, Remark 2.10, printed p. 4; roadmap tensor counterexample using Colmez §II.4.4; derived from the cited passage, not printed there.)

*Needs:* §1.4 (The transpose derivative and logarithm); §2.1 `DistOrder`; §2.2 `anisotropicFunctionSpace`.

**Isotropic and vector growth bounds differ** (comparison). The isotropic order-r norm on Z_p^g weights a multivariate locally constant wavelet by p^(floor(r·max_iℓ(n_i))); tensor vector order weights by p^(Σ_i floor(r_iℓ(n_i))). Their extension criteria use, respectively, equal-radius cosets and all rectangular cosets. They must not be identified merely by r=Σ_i r_i. Under (a). (Source: Loeffler, §2.1, Definition 2.5 and Theorem 2.9, printed pp. 2–4; §2.3, p. 5; derived from the cited passage, not printed there.)

*Needs:* §2.2 `anisotropicFunctionSpace`; §2.2 `RectangularGrowth`.

**From conductor bounds to analytic ray-class distributions** (comparison). An imported ray-class distribution with conductor growth bound v(μ(class modulo ∏p^{m_p}))≥C−Σ_p e_p v(α_p)m_p gives the indicated rectangular growth on compatible p-adic Lie factors. If only the equal-radius bound r=Σ_p e_pv(α_p)<1 is established, the isotropic extension theorem applies. The arithmetic construction and finite-additivity relation remain with their existing measure/L-function owners. Under (a). (Source: Loeffler, §3.1, Definition 3.1 and Theorem 3.3, printed pp. 6–7; derived from the cited passage, not printed there.)

*Needs:* §2.2 (Extension of rectangular distributions); §2.3 (Isotropic and vector growth bounds differ); PadicMeasuresIwasawaAlgebras L0.

**A positive-order distribution that is not a measure** (lemma). dδ_0 on Z_p is an order-one locally analytic distribution and is not a bounded measure. In particular positive-order family tests cannot be satisfied by a construction containing bounded measures alone. Under (a). (Source: Colmez, §II.3, Proposition II.3.1, printed p. 31; §II.4.4, printed p. 35; derived from the cited passage, not printed there.)

*Needs:* §1.4 (The transpose derivative and logarithm); §2.1 `DistOrder`; §2.1 (Order zero is bounded measures).

### Examples

δ_0 has order 0; the distribution f ↦ f′(0) has order 1 and is not a measure; the digit-doubling function is C¹ but not C²; for r = (1/2, 0) on ℤ_p² the locally constant tensor 1 ⊗ 1_{pℤ_p} has finite rectangular growth although the naive joint first-difference condition fails; at a critical coordinate order the functional d_i^{N_i+1}δ_0 annihilates the prescribed polynomial class.

### Dependencies

Layers 0 and 1; Mathlib `LocallyConstant`, `PadicInt.mahlerEquiv`; PadicMeasuresIwasawaAlgebras L0 and L2.

## Layer 3: character spaces and Mellin transforms

This layer identifies distributions on a compact abelian p-adic analytic group with analytic functions on its character space. On each finite-character component the Mellin transform of a bounded measure is a power series bounded on the open disc; arithmetic branches ω^i⟨x⟩^s and clearing factors make the meromorphic functions of pseudo-measures explicit; the distribution Mellin transform is then a Fréchet algebra isomorphism onto the functions on the open polydisc, with evaluation, multiplicativity, generator change, weight analyticity and differentiation, twists, functoriality and coefficient extension, and the comparison with the rigid and adic character spaces of AdicSpaces. Proposed home: `TauCeti/NumberTheory/Padics/Mellin` and `TauCeti/NumberTheory/Padics/AnalyticDistributions`.

### 3.1 Component Mellin series of bounded measures

Hypotheses shared by several targets of this subsection, cited by letter below: (a) K is a finite extension of Q_p with its normalized nonarchimedean absolute value; the elementary series lemmas also hold over any complete nontrivially normed ultrametric field. (b) An open-disc series F means a native power series with ||a_n|| R^n tending to zero for every real 0<R<1. Write E(F,t) for the native FormalMultilinearSeries.ofScalarsSum of its coefficients; analytic uses require ||t||<1. No convergence claim is made at ||t||=1.

Source for this subsection unless a target says otherwise: RJW, Remark 3.47, pp. 25–26; §5.3, pp. 34–35 (formula immediately before Remark 5.22).

**Mellin series on a finite-character component** (construction). Let G be compact and let H:G≃Δ×Z_p be an imported character chart, Δ a finite discrete set. Let ν:Δ→K be the finite-character value function (the formula also makes sense for any ν). For a native bounded measure μ on G define F_{μ,ν,H}(T)=Σ_{n≥0} μ(g↦ν(H(g)_Δ) binom(H(g)_Z,n)) T^n. Multiplication uses K, with the native algebra map Z_p→K on binomial values. This is the Mellin series adapter on the imported component; it does not construct Δ, H, the character functor or its representing space. Under (a) and (b). Its API consists of `componentMellin` (Let G be compact and let H:G≃Δ×Z_p be an imported character chart, Δ a finite discrete set. Let ν:Δ→K be the finite-character value function (the formula also makes sense for any ν). For a native bounded measure μ on G define F_{μ,ν,H}(T)=Σ_{n≥0} μ(g↦ν(H(g)_Δ) binom(H(g)_Z,n)) T^n. Multiplication uses K, with the native algebra map Z_p→K on binomial values. This is the Mellin series adapter on the imported component; it does not construct Δ, H, the character functor or its representing space), `componentMellin_coeff` (The nth coefficient is μ(ν∘H_Δ times binom(H_Z,n))), `componentMellin_add` (F_{μ+η,ν,H}=F_{μ,ν,H}+F_{η,ν,H}), `componentMellin_smul` (F_{aμ,ν,H}=aF_{μ,ν,H}), `componentMellin_dirac` (F_{δ_g,ν,H}=ν(H_Δg)Σ_n binom(H_Zg,n)T^n) and `componentMellin_mass` (coeff_0 F=μ(ν∘H_Δ)).

*Needs:* PadicMeasuresIwasawaAlgebras L0a; Mathlib `AbstractMeasure`, `AbstractMeasure.dirac`, `mahler`, `AbstractMeasure.amiceTransform`, `AbstractMeasure.coeff_amiceTransform`.

**Checks.**

- `ComponentMellinTests.zero` (degenerate): F_{0,ν,H}=0.
- `ComponentMellinTests.finite_atom`: F_{δ_(δ,0),ν,H}=ν(δ) as a constant series.
- `ComponentMellinTests.generator_atom`: F_{δ_(δ,1),ν,H}=ν(δ)(1+T).
- `ComponentMellinTests.native_amice` (compatibility): For G=Z_p, Δ a singleton, its canonical product chart and ν=1, componentMellin μ equals the native AbstractMeasure.amiceTransform μ.

**Bounded component Mellin coefficients** (lemma). Under the component-Mellin hypotheses, if C≥0 and ||ν(δ)||≤C for every δ, then ||coeff_n F_{μ,ν,H}||≤||μ||C for every n, where ||μ|| is the native continuous-linear-functional operator norm. For finite characters in a splitting field one may take C=1. Under (a) and (b).

*Needs:* §3.1 `componentMellin`; Mathlib `PadicInt.norm_mahler_eq`.

**Bounded component series are analytic on the disc** (theorem). For every μ,ν,H as above, the component series is open-disc analytic and has uniformly bounded coefficients. It is therefore a bounded rigid function when transported to the imported component. This forward comparison does not by itself prove that every bounded rigid function comes from a measure. Under (a) and (b).

*Needs:* §3.1 (Bounded component Mellin coefficients); §1.2 (Analytic evaluation of an open-disc series); Mathlib `PowerSeries.isRestricted_iff'`.

**Character evaluation equals the component Mellin value** (theorem). For ||t||<1 let κ_t:Z_p→K be the native additive character with κ_t(1)=1+t. Then E(F_{μ,ν,H},t)=μ(g↦ν(H_Δg)κ_t(H_Zg)). If H is a group chart and ν a finite character, its right side is the scalar character integral on the imported component. The statement uses continuous maps and genuine coefficient-field points. Under (a) and (b). (Source: RJW, Remark 3.47, pp. 25–26; §5.3, pp. 34–35 (formula immediately before Remark 5.22); Colmez, §II.2, Lemma II.2.1 and Theorem II.2.2 with proofs, author PDF p. 30; derived from the cited passage, not printed there.)

*Needs:* §3.1 `componentMellin`; §3.1 (Bounded component series are analytic on the disc); §1.2 (Summability inside the open disc); Mathlib `PadicInt.addChar_of_value_at_one`, `PadicInt.coe_addChar_of_value_at_one`, `PadicInt.hasSum_mahlerSeries`, `ContinuousLinearMap.map_tsum`.

### 3.2 Arithmetic branches and clearing factors

Hypotheses shared by several targets of this subsection, cited by letter below: (a) K is a finite extension of Q_p with its normalized nonarchimedean absolute value; the elementary series lemmas also hold over any complete nontrivially normed ultrametric field. (b) An open-disc series F means a native power series with ||a_n|| R^n tending to zero for every real 0<R<1. Write E(F,t) for the native FormalMultilinearSeries.ofScalarsSum of its coefficients; analytic uses require ||t||<1. No convergence claim is made at ||t||=1.

Source for this subsection unless a target says otherwise: RJW, Remark 3.47, pp. 25–26; §5.3, pp. 34–35 (formula immediately before Remark 5.22).

Library inputs of this subsection, used by several of its targets: Mathlib `PadicInt.addChar_of_value_at_one`.

**Mellin branches in an arithmetic parameter** (construction). For an open-disc series F, q∈K with ||q||<1, and s∈Z_p, put B_{F,q}(s)=E(F,κ_q(s)−1), using the native κ_q(1)=1+q. In the standard odd-prime unit chart, γ=1+p, q=γ−1, and ν=ω^i, this is Mel_{μ,i}(s)=∫ω(x)^i〈x〉^s dμ. At p=2 the imported chart is {±1}×(1+4Z_2), with γ=5; the odd-prime chart is not used there. Under (a) and (b). Its API consists of `branchMellin` (For an open-disc series F, q∈K with ||q||<1, and s∈Z_p, put B_{F,q}(s)=E(F,κ_q(s)−1), using the native κ_q(1)=1+q. In the standard odd-prime unit chart, γ=1+p, q=γ−1, and ν=ω^i, this is Mel_{μ,i}(s)=∫ω(x)^i〈x〉^s dμ. At p=2 the imported chart is {±1}×(1+4Z_2), with γ=5; the odd-prime chart is not used there), `branchMellin_def` (B_{F,q}(s)=E(F,κ_q(s)−1)), `branchMellin_zero` (B_{F,q}(0)=coeff_0 F), `branchMellin_one` (B_{F,q}(1)=E(F,q)) and `branchMellin_add` (B_{F+H,q}(s)=B_{F,q}(s)+B_{H,q}(s) for two open-disc series).

*Needs:* §3.2 (Arithmetic branches stay inside the character disc); §3.1 (Character evaluation equals the component Mellin value); PadicMeasuresIwasawaAlgebras L0a.

**Checks.**

- `BranchMellinTests.zero` (degenerate): B_{0,q}(s)=0.
- `BranchMellinTests.constant`: B_{a,q}(s)=a for a constant series.
- `BranchMellinTests.linear_at_one`: B_{T,q}(1)=q.
- `BranchMellinTests.generator_at_zero`: B_{1+T,q}(0)=1.

**Arithmetic branches stay inside the character disc** (lemma). For q∈K with ||q||<1 and s∈Z_p, ||κ_q(s)−1||≤||q||<1. Under (a) and (b). (Source: Colmez, §II.2, Lemma II.2.1 and Theorem II.2.2 with proofs, author PDF p. 30; derived from the cited passage, not printed there.)

*Needs:* Mathlib `PadicInt.coe_addChar_of_value_at_one`, `PadicInt.hasSum_mahlerSeries`, `PadicInt.norm_mahler_eq`.

**Mellin evaluation at integral weights** (lemma). For n≥0, B_{F,q}(n)=E(F,(1+q)^n−1). This pins integral specialization of a branch independently of arithmetic L-value interpolation. In the canonical unit chart, recovering x^k additionally requires the finite character ν=ω^i with k≡i modulo p−1 for odd p, and the corresponding parity branch at p=2; those coordinate comparisons are a remaining supplier interface. Under (a) and (b).

*Needs:* §3.2 `branchMellin`; Mathlib `PadicInt.addChar_of_value_at_one_def`.

**Mellin evaluation on a clearing-factor domain** (construction). For open-disc numerator F and denominator D define Q_{F,D}(t)=E(F,t)/E(D,t) only as a meromorphic chart expression. All evaluation theorems require ||t||<1 and E(D,t)≠0. For a pseudomeasure λ imported from PMIA L3 and a genuine clearing numerator μ=([a]−[1])λ, F is the component Mellin series of μ and D represents κ_t(a)−1. A quotient’s total value at a zero denominator has no meromorphic meaning; no extension of the pseudomeasure’s value is asserted there. Under (a) and (b). Its API consists of `quotientMellin` (For open-disc numerator F and denominator D define Q_{F,D}(t)=E(F,t)/E(D,t) only as a meromorphic chart expression. All evaluation theorems require ||t||<1 and E(D,t)≠0. For a pseudomeasure λ imported from PMIA L3 and a genuine clearing numerator μ=([a]−[1])λ, F is the component Mellin series of μ and D represents κ_t(a)−1. A quotient’s total value at a zero denominator has no meromorphic meaning; no extension of the pseudomeasure’s value is asserted there), `quotientMellin_def` (Q_{F,D}(t)=E(F,t)/E(D,t); meaningful use is guarded by the nonvanishing condition), `quotientMellin_clear` (E(D,t)Q_{F,D}(t)=E(F,t) when E(D,t)≠0), `quotientMellin_one` (Q_{F,1}(t)=E(F,t)) and `quotientMellin_zero` (A zero numerator yields zero on every admissible domain).

*Needs:* §3.1 (Character evaluation equals the component Mellin value); §1.2 (Evaluation preserves products inside the disc); PadicMeasuresIwasawaAlgebras L3.

**Checks.**

- `QuotientMellinTests.no_denominator` (compatibility): Q_{F,1}(t)=E(F,t).
- `QuotientMellinTests.simple_pole`: Q_{1,T}(t)=t inverse for t≠0.
- `QuotientMellinTests.removable_on_punctured_disc`: Q_{T,T}(t)=1 for t≠0.
- `QuotientMellinTests.trivial_character_excluded` (non-example): E(T,0)=0, so the chart domain for denominator T excludes the trivial character.

**Agreement of Mellin clearing expressions** (lemma). If F,D,F′,D′ are open-disc series with FD′=F′D, then Q_{F,D}(t)=Q_{F′,D′}(t) at every ||t||<1 for which both denominator values are nonzero. Applied to the algebraic clearing compatibility imported from PMIA L3 this proves independence on chart overlaps; it does not construct a total-fraction-ring character homomorphism. Under (a) and (b).

*Needs:* §3.2 `quotientMellin`; §1.2 (Evaluation preserves products inside the disc); PadicMeasuresIwasawaAlgebras L3.

### 3.3 The Mellin transform of distributions

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

Source for this subsection unless a target says otherwise: RJW, Theorem 3.43 and Remark 3.47, printed pp. 24–26; §5.3, printed pp. 34–35; derived from the cited passage, not printed there.

**Distribution Mellin components** (construction). Let G≃Δ×Z_p^d be an imported analytic group chart, Δ finite abelian, and K contain the values of its finite characters. For ν∈Δ̂ set M_ν(μ)(T)=Σ_α μ(ν(δ)·∏_i binom(z_i,α_i))T^α. This is a native multivariate series convergent on every strictly smaller closed polydisc. It is the unbounded distribution construction; the bounded scalar component is its restriction to imported measures. Under (a). Its API consists of `distributionMellin` (The coefficient formula defines the Mellin map), `distributionMellin_coeff` (Its α coefficient is the indicated locally analytic moment) and `distributionMellin_ext` (Equality of all components and coefficients implies equality of distributions). (Source: Kohlhaase, Theorem 4.4 and its coefficient model, printed pp. 21–22; derived from the cited passage, not printed there.)

*Needs:* §1.1 (The Amice transform of distributions); §0.3 (Products and completed analytic tensors); PadicMeasuresIwasawaAlgebras L0a; Mathlib `MvPowerSeries.coeff`.

**Checks.**

- `AnalyticDistributionTests.distributionMellin_point`: At δ_(δ,0) the ν component is the constant ν(δ).
- `AnalyticDistributionTests.distributionMellin_trivial_group` (degenerate): For Δ trivial and d=0 the transform is the mass in K.
- `AnalyticDistributionTests.distributionMellin_bounded` (compatibility): For d=1 and a bounded measure this is the componentMellin series.

**Mellin as a Fréchet algebra isomorphism** (theorem). For compact abelian G with an open Z_p^d subgroup, the distribution Mellin transform gives D(G,K)≃O(W_G) as topological K-algebras, with the strong/projective-limit topology on D and the closed-polydisc Fréchet topology on O(W_G). Finite character components are taken after a finite splitting extension and descended if necessary. Under (a). (Source: Kohlhaase, Theorem 4.4 and its coefficient model, printed pp. 21–22; derived from the cited passage, not printed there.)

*Needs:* §3.3 `distributionMellin`; §0.3 (Strong duality for analytic compact-type spaces); §1.4 (Unbounded Amice convolution identity); PadicMeasuresIwasawaAlgebras L0a.

**Bounded Mellin functions and measures** (comparison). Inside the unbounded Mellin algebra, the imported bounded measures are exactly the components with uniformly bounded coefficients, equivalently uniformly bounded Gauss norms as the polyradii approach 1. Boundedness refers to all rigid points after finite coefficient extension, not just K-rational points. Under (a).

*Needs:* §3.3 (Mellin as a Fréchet algebra isomorphism); PadicMeasuresIwasawaAlgebras L2/field-bounded-amice-isometry; §3.1 (Bounded component Mellin coefficients).

**Evaluation of distributions at analytic characters** (lemma). For every locally analytic character κ:G→L^× over a finite extension L/K, evaluation of the coefficient-extended Mellin function at κ equals μ_L(κ). The character is an analytic test function on a common radius. Under (a).

*Needs:* §3.3 `distributionMellin`; §0.3 (A common analytic radius on a compact manifold).

**Multiplicativity of distribution Mellin** (lemma). For compact abelian G, M(λ*μ)(κ)=M(λ)(κ)M(μ)(κ), hence the Mellin transform sends convolution to analytic multiplication. Under (a). (Source: Schneider–Teitelbaum, §1, Lemmas 1.1–1.2 and Proposition 1.4, printed pp. 3–6; derived from the cited passage, not printed there.)

*Needs:* §1.3 `distributionConvolution`; §3.3 (Evaluation of distributions at analytic characters).

**Mellin compatibility with a different generator** (lemma). In a rank-one chart with γ′=γ^u for u∈Z_p^×, the coordinate relation is t′=(1+t)^u−1 and the new component function is F′(t′)=F((1+t′)^{u^(−1)}−1). This is an adapter for the coordinate transition imported from PMIA L0a. Under (a).

*Needs:* §3.3 (Evaluation of distributions at analytic characters); PadicMeasuresIwasawaAlgebras L0a.

**Local analyticity in an arithmetic weight parameter** (lemma). For a unit-character branch κ_(i,s)(x)=ω(x)^i〈x〉^s at odd p, or the imported {±1}×(1+4Z_2) branch at p=2, s↦μ(κ_(i,s)) is locally Q_p-analytic on Z_p for any locally analytic distribution μ. On sufficiently small s-discs it is the composition of its Mellin component with t(s)=γ^s−1. Under (a).

*Needs:* §3.3 (Evaluation of distributions at analytic characters); §3.3 (Mellin as a Fréchet algebra isomorphism); §3.2 `branchMellin`; PadicMeasuresIwasawaAlgebras L0a.

**Weight differentiation and logarithmic moments** (lemma). For the preceding branch, d/ds M_(μ,i)(s)=μ(log〈x〉·ω(x)^i〈x〉^s). If F is its component series, the same derivative is log(γ)(1+t(s))F′(t(s)). Repeated derivatives insert powers of log〈x〉. Under (a).

*Needs:* §3.3 (Local analyticity in an arithmetic weight parameter); §1.3 `distributionMultiply`.

**Twists of the distribution Mellin transform** (lemma). For a locally analytic character θ of compact abelian G, M(θμ)(κ)=M(μ)(θκ). A finite character twist permutes Δ components; an analytic principal-unit twist gives the imported translated coordinate substitution. Under (a).

*Needs:* §1.3 `distributionMultiply`; §3.3 (Evaluation of distributions at analytic characters).

**Mellin functoriality for group maps** (lemma). For an analytic homomorphism f:G→H of compact abelian p-adic groups, M(f_*μ)(κ)=M(μ)(κ∘f). The imported morphism W_H→W_G gives the corresponding pullback on analytic functions. Under (a).

*Needs:* §1.3 `distributionPushforward`; §3.3 (Evaluation of distributions at analytic characters); PadicMeasuresIwasawaAlgebras L0a.

**Finite coefficient extension of Mellin** (comparison). For finite L/K, D(G,K)⊗_K L with its finite-product topology identifies with D(G,L), and Mellin commutes with O(W_G)⊗_K L≃O(W_(G,L)). Finite-dimensionality is required; this statement makes no claim for an arbitrary completed tensor with an infinite-dimensional affinoid. Under (a). (Source: Schneider–Teitelbaum, §1, Lemmas 1.1–1.2 and Proposition 1.4, printed pp. 3–6; derived from the cited passage, not printed there.)

*Needs:* §3.3 (Mellin as a Fréchet algebra isomorphism); §0.3 `analyticStage`.

### 3.4 Geometric comparison and pseudo-measures

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

Source for this subsection unless a target says otherwise: RJW, Theorem 3.43 and Remark 3.47, printed pp. 24–26; §5.3, printed pp. 34–35; derived from the cited passage, not printed there.

**Rigid and adic Mellin comparison** (comparison). On the character space supplied by PMIA L0a, the rigid Mellin function corresponds under the imported rigid/adic equivalence to an adic analytic section. Its restrictions on affinoid character charts agree with the radius-wise Mellin seminorms and with character evaluation at rank-one points. Under (a). (Source: BCGP II, Definition 2.2.17, printed p. 21; §§4.6.46–4.6.49, printed pp. 93–95; derived from the cited passage, not printed there.)

*Needs:* §3.3 (Mellin as a Fréchet algebra isomorphism); PadicMeasuresIwasawaAlgebras L0a; Tau Ceti `TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`.

**Gluing genuine pseudomeasure Mellin numerators** (lemma). For an imported pseudomeasure λ and an actual clearing element c_g=[g]−[1], write n_g=c_gλ in the measure algebra. On the character open where κ(g)−1 is invertible, define M(λ)=M(n_g)/(κ(g)−1). The actual numerator cross-products make these local analytic quotients agree on overlaps; no evaluation homomorphism from the full total quotient ring is constructed. Under (a).

*Needs:* §3.3 (Evaluation of distributions at analytic characters); §3.2 (Agreement of Mellin clearing expressions); PadicMeasuresIwasawaAlgebras L3/cleared-numerator; PadicMeasuresIwasawaAlgebras L3/cross-multiplied-numerators; PadicMeasuresIwasawaAlgebras L3/independence-of-clearing-factor.

**Local pole order of a clearing presentation** (lemma). On a smooth rank-one character disc, if a genuine denominator κ(g)−1 has a zero of multiplicity m and is not identically zero, the corresponding pseudomeasure Mellin section has pole order at most m. Vanishing of the numerator can lower or remove that order. No universal simple-pole or trivial-character-only assertion is made. Under (a).

*Needs:* §3.4 (Gluing genuine pseudomeasure Mellin numerators).

### Examples

For the trivial finite character and μ = δ_u the component Mellin series is the power series of u^{s} in the disc coordinate; at the integral weight k the branch value is ∫ ω(x)^i x^k dμ; a pseudo-measure with clearing factor [a] − [1] has a pole of order at most one at the trivial character, and the pole is absent when the numerator vanishes there; the coordinate change between the generators 1 + p and (1 + p)^u is the substitution (1 + T) ↦ (1 + T)^u.

### Dependencies

Layers 1 and 2; PadicMeasuresIwasawaAlgebras L0a (character space, universal character, generators at odd p and p = 2) and L3 (pseudo-measures and clearing); the Tau Ceti roadmap AdicSpaces, Layer 5 (gluing of adic spaces) for the geometric comparison.

## Layer 4: analytic families, Fredholm theory and finite-slope complexes

This layer supplies the operator theory. It begins with complete continuity in the Banach-algebra convention and orthonormalizable modules, constructs the Fredholm determinant det(1 − Tu) of a completely continuous operator and proves its invariance, product and base-change properties, then develops the entire-series algebra that the Riesz theory needs: entire division by linear and monic factors, resultants of monic polynomials against entire series, Hasse derivatives, the Fredholm resolvent and the Riesz projectors at a root, finite generation and projectivity of root kernels, the finite spectral transform and Coleman's truncation limits, and Gauss convergence of entire series. The second half applies this to families: affinoid-valued analytic stages and their duals, the universal-character coefficient action, compactness of contracting operators, Banach cochain complexes with compact homotopy endomorphisms, numerical slope decompositions and finite-slope perfect complexes, Fréchet presentations and the torus order on slopes. Proposed home: `TauCeti/Analysis/NonarchimedeanFredholm/*` for the operator theory and `TauCeti/NumberTheory/Padics/AnalyticDistributions` for the families and complexes.

### 4.1 Banach modules, complete continuity and orthonormalizable modules

Hypotheses shared by several targets of this subsection, cited by letter below: (a) The hypotheses in the statement are explicit; the index set need not be countable.

Library inputs of this subsection, used by several of its targets: Mathlib `ZeroAtInftyContinuousMap`.

**Complete continuity in the Banach algebra convention** (comparison). Import the finite-range approximation predicate of AdicSpacesPartII R3 (`completely-continuous-map`). Over the stated Noetherian K-Banach algebra, compare it with Buzzard's operator-norm closure of maps whose range lies in a finitely generated A-submodule. The affine-geometric supplier states affinoid hypotheses; the precise extension of its contract to these Banach algebras is stated here as part of this target. Neither notion means finite K-rank or Mathlib IsCompactOperator. In addition: the standing Banach hypotheses of Convention 1; no orthonormal basis is required. Its API consists of `finiteImage_isCompletelyContinuous` (A continuous map whose image lies in a finitely generated A-submodule is completely continuous), `isCompletelyContinuous_comp` (Composition with a bounded A-linear map on either side preserves complete continuity), `isClosed_completelyContinuous` (Completely continuous maps form the operator-norm closure of the finite-A-image maps) and `isCompletelyContinuous_iff_containing_finite` (Over Noetherian A, the imported epsilon-approximation predicate is equivalent to the pointwise epsilon bound with range contained in a finite A-submodule). (Source: Buzzard, Section 2, pp. 9-10, finite-rank and compact definitions.)

*Needs:* AdicSpacesPartII R3; §4.1 (Finite ambient image versus finitely generated range).

**Checks.**

- `identity_on_A`: The identity of A is completely continuous as an A-linear map, including when A is infinite-dimensional over K.
- `identity_on_infinite_c0`: For nonzero A, the identity on c_A(N) is not completely continuous: every output column has norm one.
- `decaying_diagonal`: For rho in K with 0<norm(rho)<1, diag(rho^n) on c_A(N) is completely continuous, although it has infinite-dimensional K-image.

**Bounded-family extension from c0** (construction). A bounded family (m_i) in a Banach A-module M determines the unique continuous A-linear map c_A(I)->M sending e_i to m_i, by x |-> sum_i x_i m_i. Under the normalized module norm its operator norm is sup_i norm(m_i). In addition: the standing Banach hypotheses of Convention 1; I arbitrary discrete; the A-action has norm(a m)<=norm(a) norm(m). Its API consists of `c0Lift_apply` (The value on x is the unconditional sum of x_i m_i), `c0Lift_single` (c0Lift(m)(e_i)=m_i) and `c0Lift_unique` (Any continuous A-linear map with these basis values equals c0Lift(m)). (Source: Buzzard, Section 2, pp. 7-9.)

*Needs:* §4.6 `coordinateProjection_apply`; §4.6 `coordinateProjection_norm_le`; Mathlib `ZeroAtInftyContinuousMap.ext`, `ZeroAtInftyContinuousMap.instCompleteSpace`, `NonarchimedeanGroup.multipliable_iff_tendsto_cofinite_one`.

**Checks.**

- `zero_family`: The zero family extends to the zero map.
- `basis_family`: The family e_i in c_A(I) extends to the identity.
- `unbounded_family`: For 0<norm(rho)<1, the family rho^(-i) in K cannot be the basis images of a continuous map c_K(N)->K.

**Orthonormalizable and potentially orthonormalizable modules** (definition). A chosen orthonormalization is an A-linear isometry M≃c_A(I); its potential version is a continuous A-linear equivalence with continuous inverse. The latter is equivalent to choosing an equivalent ONable norm. Use the existing C0 carrier, not a new space of sequences. In addition: the standing Banach hypotheses of Convention 1; arbitrary discrete I. Its API consists of `orthonormalization_coordinates` (Coordinates identify M with existing c_A(I) and reconstruct elements by unconditional summation), `potentiallyON_iff_equivalentNorm` (Potential ONability is ONability after a two-sided bounded change of norm), `coordinateProjection_norm_le` (Finite coordinate projections have norm at most one in an ON chart) and `c0ContinuousSMul` (The existing pointwise action of the normed ring A on C0(I,A) is jointly continuous, using c0-scalar-bound). (Source: Buzzard, Section 2, pp. 7-9 and 15-16.)

*Needs:* §4.1 `c0Lift_apply`; §4.1 (Bounded coefficient action on c0); §4.6 `coordinateProjection_norm_le`.

**Checks.**

- `empty_basis`: The empty index set gives the zero module.
- `finite_basis`: For finite I this agrees with A^I with its max norm.
- `potential_not_isometric`: Let M be a normed K-line with an algebraic coordinate e:M to K and norm(x)=c norm(e(x)), where c>0 is outside the value group of K. Then M is potentially ONable, but there is no K-linear isometry M to K. This tests an actual normed module with the specified rescaling law; it does not assume non-isometry.

**Canonical topology on finite Banach modules** (lemma). For a finite A-module equipped with a Banach A-module topology, the topology is the canonical quotient topology from any finite presentation; submodules are closed and A-linear maps between finite Banach modules are continuous. In addition: the standing Banach hypotheses of Convention 1; finiteness over A and the precise Noetherian hypotheses are retained. (Source: Buzzard, Proposition 2.1 and proof; Lemma 2.3(b), pp. 6-11.)

*Needs:* Mathlib `ContinuousLinearMap.isOpenMap`.

**Finite coordinates detect a finite submodule** (lemma). For a finitely generated submodule Q of c_A(I), some finite coordinate projection pi_T is injective on Q and satisfies norm(q)<=C norm(pi_T q) for all q in Q and some C>0. In addition: the standing Banach hypotheses of Convention 1; Q finite over A, not assumed free. (Source: Buzzard, Lemma 2.3(a)-(b), pp. 10-11.)

*Needs:* §4.1 (Canonical topology on finite Banach modules); §4.1 `orthonormalization_coordinates`; §4.1 (Finite coordinates detect a finite submodule); Mathlib `Submodule.FG.map`.

**Uniform coordinate truncation on finite submodules** (lemma). For Q finite over A inside c_A(I) and epsilon>0, some finite T satisfies norm(q-pi_T q)<=epsilon norm(q) for every q in Q. In addition: the standing Banach hypotheses of Convention 1; Q need not be free. (Source: Buzzard, Lemma 2.3(c), pp. 10-11.)

*Needs:* §4.1 `orthonormalization_coordinates`; §4.1 (Finite coordinates detect a finite submodule); Mathlib `ContinuousLinearMap.exists_preimage_norm_le`.

**Completely continuous matrix criterion** (theorem). A continuous A-linear u:c_A(I)->c_A(J) is completely continuous exactly when r_j(u)=sup_i norm(a_ij) tends to zero outside finite subsets of J; then pi_T u converges to u in operator norm. In addition: the standing Banach hypotheses of Convention 1; i indexes inputs and j outputs. (Source: Buzzard, Proposition 2.4, pp. 11-12.)

*Needs:* §4.1 `finiteImage_isCompletelyContinuous`; §4.1 (Uniform coordinate truncation on finite submodules); §4.6 `coordinateProjection_apply`; §4.6 `coordinateProjection_norm_le`.

**Finite ambient image versus finitely generated range** (comparison). For a continuous A-linear map f:M to N over a Noetherian commutative ring A, its range is contained in a finitely generated A-submodule if and only if its range is itself finitely generated. This compares Buzzard's finite-rank convention with the range convention used by AdicSpacesPartII R3 (`completely-continuous-map`); it does not assert the equivalence over non-Noetherian A. Under (a). (Source: Buzzard, Section 2, p. 9, finite-rank definition.)

*Needs:* Mathlib `Submodule.FG.of_le`.

**Strict norm approximation by finite-image maps** (lemma). For Banach modules M,N over the stated Noetherian K-Banach algebra A and a continuous A-linear f, imported complete continuity is equivalent to: for every epsilon>0 there is a continuous A-linear g whose range is contained in a finite A-submodule and whose difference from f, restricted to K, has operator norm strictly less than epsilon. Under (a). (Source: Buzzard, Section 2, pp. 8-10, operator norm and closure definition.)

*Needs:* §4.1 `finiteImage_isCompletelyContinuous`; §4.1 (Finite ambient image versus finitely generated range); Mathlib `ContinuousLinearMap.opNorm_le_bound`, `ContinuousLinearMap.le_opNorm`, `Metric.mem_closure_iff`.

**Checks.**

- `approximation_zero_radius_boundary` (non-example): For any f there is no g with norm(f-g)<0.

**Bounded coefficient action on c0** (lemma). For a normed commutative ring A and any topological space I, the existing pointwise A-action on C0(I,A) satisfies norm(a x)<=norm(a) norm(x). Consequently it is jointly continuous for the existing sup-norm topology. On discrete I this supplies the coefficient action of c_A(I); no new sequence carrier is constructed. Under (a). (Source: Buzzard, Section 2, pp. 7-8, definition of c_A(I).)

*Needs:* Mathlib `BoundedContinuousFunction.norm_coe_le_norm`, `BoundedContinuousFunction.norm_le`, `IsBoundedSMul.of_norm_smul_le`, `IsBoundedSMul`.

**Checks.**

- `scalar_empty` (degenerate): On C0(empty,A), norm(a x)=0.
- `scalar_single`: Multiplication by a sends the coordinate vector with value b at i to the coordinate vector with value ab at i.

**Finite coordinates detect a finite submodule** (lemma). Let B be a commutative Noetherian ring, I any set and Q a finitely generated B-submodule of the full product B^I. There is a finite S contained in I such that two elements of Q agreeing on S agree everywhere. No Banach topology, field, domain or freeness of Q is required. Under (a). (Source: Buzzard, Lemma 2.3(a), p. 10, complete proof paragraph.)

*Needs:* Mathlib `Submodule.fg_iff_exists_fin_generating_family`, `isNoetherian_pi`, `IsNoetherian`, `Submodule.fg_span_iff_fg_span_finset_subset`.

**Checks.**

- `coordinate_empty_submodule` (degenerate): Two elements of the zero submodule of B^I are equal without inspecting any coordinates.
- `coordinate_product_ring` (compatibility): In the submodule of (K times K)^N generated by the constant vector (1,0), vanishing of coordinate zero forces the vector to vanish.
- `coordinate_single_omitted` (non-example): If j is outside finite S and A is nonzero, the coordinate vector e_j vanishes on S but is nonzero.

**Complete continuity of the identity detects finite generation** (theorem). For a Banach A-module M in the standing setting, the identity is completely continuous if and only if M is finitely generated over A. Neither potential ONability nor property (Pr), freeness, finite K-dimension or constant rank is required. In addition: the standing Banach hypotheses of Convention 1; no ONability or (Pr) is needed for this implication. (Source: Buzzard, Proposition 3.2, p. 23, finite-generation paragraph.)

*Needs:* §4.1 (Strict norm approximation by finite-image maps); Mathlib `ContinuousLinearMap.instCompleteSpace`, `ContinuousLinearMap.toNormedRing`, `isUnit_one_sub_of_norm_lt_one`, `ContinuousLinearMap.isUnit_iff_bijective`, `Module.finite_def`.

**Checks.**

- `finite_identity_zero` (degenerate): The identity on A^0 is completely continuous.
- `finite_identity_finite` (compatibility): Every continuous A-linear endomorphism of a finitely generated A-module is completely continuous.
- `finite_identity_infinite` (non-example): If M is not finitely generated over A, its identity is not completely continuous.

### 4.2 Fredholm determinants on orthonormalizable and (Pr) modules

Hypotheses shared by several targets of this subsection, cited by letter below: (a) the standing Banach hypotheses of Convention 1.

Source for this subsection unless a target says otherwise: Serre, Proposition 8 proof, printed p. 77 (PDF p. 10).

Library inputs of this subsection, used by several of its targets: Mathlib `NonarchimedeanGroup.multipliable_iff_tendsto_cofinite_one`, `IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm`, `IsUltrametricDist.norm_tprod_le_of_forall_le_of_nonneg`, `norm_units_zsmul`, `Finset.mem_powersetCard`, `Finset.norm_prod_le`, `IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg`, `Matrix.det_apply`.

**Fredholm determinant in an orthonormal chart** (construction). For completely continuous u on c_A(I), construct the formal power series P_u with c_0=1 and c_n=(-1)^n sum_{S subset I, card S=n} det(a_ij)_{i,j in S}. Entireness and chart independence are the separately named ensuing theorems. In addition: the standing Banach hypotheses of Convention 1 and complete continuity. Its API consists of `fredholmSeries_coeff` (The n-th coefficient is the signed principal-minor sum), `fredholmSeries_constant` (The constant coefficient is one) and `fredholmSeries_isEntire` (The minor-tail-estimate proves decay at every positive real radius). (Source: Buzzard, Definition following Proposition 2.4, p. 12.)

*Needs:* §4.1 (Completely continuous matrix criterion); §4.2 `fixed_degree_minors_null`.

**Checks.**

- `zero_operator`: P_0=1.
- `rank_one_scalar`: For multiplication by a on A, P_u=1-aT.
- `nonzero_nilpotent`: For the nonzero two-by-two nilpotent Jordan block, P_u=1; determinant one does not mean u=0.

**Entire power series over A** (definition). Define A{{T}} as the subring of A[[T]] consisting of c with norm(c_n) R^n->0 for every real R>0. Give its family of Gauss seminorms and evaluation at any a in A; evaluation is continuous for every radius R>=norm(a), R>0. In addition: A is a complete commutative ultrametric normed ring; its norm is submultiplicative. Its API consists of `mem_entireSeries` (Membership is coefficient decay at every positive radius), `entire_eval` (Evaluation at a is a ring homomorphism given by the convergent coefficient sum) and `entire_eval_bound` (norm(eval_a(c))<=sup_n norm(c_n) R^n for R>=norm(a), R>0). (Source: Buzzard, Section 3, p. 21.)

*Needs:* Mathlib `HasSum.mul_of_nonarchimedean`.

**Checks.**

- `polynomials_are_entire`: Every polynomial is entire, including constants.
- `superexponential_coefficients`: For 0<norm(rho)<1, coefficients rho^(n*n) define an entire series.
- `geometric_nonexample`: The series with every coefficient one is not entire, even though it converges on the open unit disc.

**Uniform entire tail bound from column majorants** (lemma). Suppose a family of completely continuous matrices has output-column norms bounded by one bounded cofinite-null family b_j>=0. Fix R>0 and 0<q<1, choose finite T with R b_j<=q outside T, m=card T and B=max(1,R sup_j b_j). Uniformly throughout the family, norm(c_n) R^n<=B^m q^max(n-m,0). In addition: the standing Banach hypotheses of Convention 1; coefficients c_n use the signed principal-minor construction. (Source: Serre, Proposition 7(b) and its column-product estimate, pp. 75-76; Proposition 8, p. 77.)

*Needs:* §4.2 `fredholmSeries_coeff`; §4.2 `mem_entireSeries`; §4.2 `ultrametric_determinant_bound`; §4.2 `distinct_column_product_tail`.

**Lipschitz bound in each determinant degree** (lemma). For completely continuous u,v in the same ON chart with norm(u),norm(v)<=C and C>=1, n>=1, norm(c_n(u)-c_n(v))<=norm(u-v) C^(n-1). Under (a). (Source: Serre, Proposition 8 proof, p. 77.)

*Needs:* §4.2 `fredholmSeries_coeff`; §4.2 `ultrametric_determinant_perturbation`; §4.2 `fixed_degree_minors_null`; §4.6 `c0_operator_norm_le_iff`.

**Gauss convergence under a common column majorant** (lemma). If u_s->u in operator norm and their matrices, including u, share a bounded cofinite-null column majorant, then for every R>0, sup_n norm(c_n(u_s)-c_n(u)) R^n->0. In particular P_{u_s}(1)->P_u(1). In addition: the standing Banach hypotheses of Convention 1; the common column bound is part of this sufficient criterion, not an automatic assumption on every bounded operator family. (Source: Serre, Proposition 8 and proof, p. 77.)

*Needs:* §4.2 (Lipschitz bound in each determinant degree); §4.2 (Uniform entire tail bound from column majorants).

**Determinant of a finite-coordinate operator** (comparison). If u(c_A(I)) is contained in the coordinate submodule A^S for a finite S, then P_u is the ordinary characteristic polynomial det(1-T u|A^S). In addition: the standing Banach hypotheses of Convention 1; S is finite. (Source: Buzzard, Lemma 2.5(b), pp. 12-13.)

*Needs:* §4.2 `fredholmSeries_coeff`; Mathlib `Matrix.det_eq_zero_of_column_eq_zero`, `Matrix.coeff_det_one_add_X_smul_eq_sum_minors`, `Matrix.det_neg`.

**Checks.**

- `native_finite_coefficient_formula` (compatibility): For a finite matrix D, the coefficient of degree k in det(1+T D) is exactly the native sum of principal k-minors; applying it to -D supplies the Fredholm sign.

**Independence of chart and equivalent norm** (comparison). For a potentially ONable module, the Fredholm series of a completely continuous operator does not depend on the ON chart or on the chosen equivalent ON norm. Under (a). (Source: Buzzard, Lemma 2.5(a)-(c) and Corollary 2.6, pp. 12-14.)

*Needs:* §4.2 `fredholmSeries_coeff`; §4.1 (Uniform coordinate truncation on finite submodules); §4.2 `finite_coordinate_determinant`; §4.2 (Lipschitz bound in each determinant degree).

**Cyclic Fredholm determinant identity** (theorem). For potentially ONable Banach A-modules M,N, completely continuous u:M->N and bounded v:N->M, P_{uv}=P_{vu}. In addition: the standing Banach hypotheses of Convention 1; only u need be completely continuous. (Source: Buzzard, Lemma 2.7 and its complete proof, pp. 14-15.)

*Needs:* §4.1 (Uniform coordinate truncation on finite submodules); §4.2 (Independence of chart and equivalent norm).

**Completed scalar extension of ON modules and determinants** (comparison). For a continuous homomorphism A->B of the stated Banach algebras, the completed scalar extension of c_A(I) is c_B(I), completely continuous maps extend, and the Fredholm coefficients map to the coefficients of the extended operator. In addition: K as in the standing conventions; A and B commutative Noetherian K-Banach algebras; homomorphism continuous, not necessarily contractive. (Source: Buzzard, Lemmas 2.8-2.9 and Corollary 2.10, pp. 16-18.)

*Needs:* §4.1 `orthonormalization_coordinates`; §4.1 (Completely continuous matrix criterion); §4.2 (Lipschitz bound in each determinant degree).

**Property (Pr)** (definition). A Banach A-module M has (Pr) when it is a continuous direct summand of a potentially ONable module; equivalently there are continuous A-linear i:M->c_A(I), r:c_A(I)->M with ri=1. The lifting characterization is a theorem, not a defining bundle of assumptions. Under (a). Its API consists of `hasPr_of_potentiallyON` (Potentially ONable modules have (Pr)), `hasPr_retract` (A continuous direct summand of a (Pr) module has (Pr)) and `hasPr_iff_split_c0` ((Pr) is equivalent to a continuous retraction from some c_A(I)). (Source: Buzzard, Section 2, pp. 18-20.)

*Needs:* §4.1 `orthonormalization_coordinates`.

**Checks.**

- `zero_hasPr`: The zero module has (Pr).
- `finite_free_hasPr`: A^n has (Pr), with the identity splitting.
- `projective_not_free`: For A=K times K and e=(1,0), eA has (Pr), but is not a free A-module because its two component ranks differ.

**Continuous lifting characterization of (Pr)** (theorem). A Banach A-module has (Pr) exactly when every continuous A-linear map from it lifts through every surjective continuous A-linear map of Banach A-modules. In addition: the standing Banach hypotheses of Convention 1; surjective, not merely an epimorphism in an unspecified category. (Source: Buzzard, Section 2, lifting discussion before Lemma 2.11, pp. 18-19.)

*Needs:* §4.2 `hasPr_of_potentiallyON`; §4.1 `c0Lift_apply`; Mathlib `ContinuousLinearMap.exists_preimage_norm_le`.

**Finite (Pr) modules are algebraically projective** (theorem). A finitely generated Banach A-module with (Pr) is a finitely generated projective A-module. In addition: the standing Banach hypotheses of Convention 1; no assertion of freeness or constant rank. (Source: Buzzard, Lemma 2.11, p. 19.)

*Needs:* §4.2 (Continuous lifting characterization of (Pr)); §4.1 (Canonical topology on finite Banach modules).

**Fredholm determinant on a (Pr) module** (construction). For a completely continuous u on a (Pr) module M, choose a complement M' with M plus M' potentially ONable and define P_u as the determinant of u plus 0. Prove independence of the complement and the agreement with the ON determinant. In addition: the standing Banach hypotheses of Convention 1 and property (Pr). Its API consists of `fredholmSeriesPr_split` (P_u=P_{iur} for every continuous splitting ri=1), `fredholmSeriesPr_agrees_ON` (For an ONable module the (Pr) determinant agrees with the principal-minor determinant) and `fredholmSeriesPr_baseChange` (Under the completed-base-change hypotheses, the scalar-extension determinant has mapped coefficients; the exercise-level proof remains in gaps). (Source: Buzzard, Section 2, pp. 19-21, including Lemmas 2.12-2.13.)

*Needs:* §4.2 `hasPr_of_potentiallyON`; §4.2 (Independence of chart and equivalent norm); §4.2 (Cyclic Fredholm determinant identity); §4.2 (Completed scalar extension of ON modules and determinants).

**Checks.**

- `pr_zero_operator`: The zero operator has determinant one on every (Pr) module.
- `add_zero_complement`: Adjoining a second zero complement does not change the series.
- `variable_rank_projective`: For A=K times K, e=(1,0), the identity on eA has determinant 1-eT. An invertible operator on a projective module need not give a polynomial with unit leading coefficient before constant rank is proved.

**Fredholm determinant of a direct sum** (theorem). For completely continuous u and v on (Pr) modules M and N, P_{u plus v}(T)=P_u(T) P_v(T). In addition: the standing Banach hypotheses of Convention 1 and continuous direct-sum topologies. (Source: Buzzard, Section 2, p. 20; used in Proposition 3.2, p. 23.)

*Needs:* §4.2 `fredholmSeriesPr_split`.

**Evaluated Fredholm product identity on c0** (theorem). For completely continuous u,v on the same potentially ONable module, P_{u+v-uv}(1)=P_u(1) P_v(1). No commutativity hypothesis on u,v is necessary. In addition: the standing Banach hypotheses of Convention 1; uv means u composed with v. (Source: Serre, Corollary 1 to Proposition 7, p. 76; Proposition 8, p. 77; Buzzard, Lemma 2.3(c), Proposition 2.4 and Lemma 2.5, pp. 10-14; Lemma 3.1, p. 22.)

*Needs:* §4.2 (Gauss convergence under a common column majorant); §4.2 `finite_coordinate_determinant`; §4.2 (Independence of chart and equivalent norm); §4.1 `finiteImage_isCompletelyContinuous`; Mathlib `Matrix.det_mul`.

**Checks.**

- `whole_series_product_nonexample` (non-example): For a nonzero ring A, (1-T) is not (1-T)^2; evaluated multiplicativity must not be promoted to whole-series multiplicativity.

**Evaluated Fredholm product identity for (Pr)** (theorem). For completely continuous u,v on the same (Pr) module, P_{u+v-uv}(1)=P_u(1)P_v(1), without requiring uv=vu. In addition: the standing Banach hypotheses of Convention 1 and (Pr). (Source: Buzzard, Zero-extension construction, pp. 19-20; Lemma 3.1, p. 22.)

*Needs:* §4.2 (Evaluated Fredholm product identity on c0); §4.2 `fredholmSeriesPr_split`.

**Ultrametric perturbation of a finite product** (lemma). Let S be a finite set, f,g:S→A, C≥1 and δ≥0. If norm(f_i),norm(g_i)≤C and norm(f_i−g_i)≤δ for every i, then norm(product f_i−product g_i)≤δ C^max(card S−1,0). In addition: A is any normed commutative ring with norm(1)=1 and an ultrametric norm; completeness, a coefficient field and Noetherianity are unnecessary.

**Checks.**

- `product_empty_difference` (degenerate): For empty S, the difference of the two empty products has norm zero, hence is at most every δ≥0.

**Determinant bound by distinct output columns** (lemma). For a square matrix D indexed by a finite type J, let b_j≥0 satisfy norm(D_ij)≤b_j for all i,j. Then norm(det D)≤product_{j in J} b_j, including J empty. In addition: A is a normed commutative ring with norm(1)=1 and an ultrametric norm. No multiplicativity of the norm, reducedness, field hypothesis or completeness is required. (Source: Serre, Proposition 7(a,b), printed pp. 75–76 (PDF pp. 8–9).)

**Checks.**

- `singleton_determinant_bound`: The determinant of the one-by-one matrix (a) is a, so its norm is at most any bound on norm(a).
- `determinant_empty_bound` (degenerate): The determinant of the identity matrix on an empty finite type has norm one.

**Uniform finite determinant perturbation** (lemma). Let D,E be square matrices on a finite type J, C≥1 and δ≥0. If every entry of D and E has norm at most C and every corresponding difference has norm at most δ, then norm(det D−det E)≤δ C^max(card J−1,0). In addition: A is a normed commutative ring with norm(1)=1 and an ultrametric norm. The empty-index case is allowed.

*Needs:* §4.2 `ultrametric_product_perturbation`.

**Cofinite decay of fixed-degree principal minors** (lemma). Let I be any index type and a:I×I→A. Suppose norm(a_ij)≤b_j, where b_j≥0 is bounded and tends to zero along the cofinite filter on I. For every n≥0 the family det(a_ij) indexed by the finite subsets S of I with card S=n tends to zero along the cofinite filter on that family of subsets. In addition: A is a normed commutative ring with norm(1)=1 and an ultrametric norm. I need not be countable. Completeness is needed only when the ensuing construction invokes unconditional summability. (Source: Buzzard, Definition following Proposition 2.4, manuscript p. 12.)

*Needs:* §4.2 `ultrametric_determinant_bound`.

**Finite exceptional-set product estimate** (lemma). Let S,T be finite subsets of an arbitrary set I. Let b:I→R satisfy 0≤b_j≤B with B≥1, and suppose b_j≤q outside T where 0≤q≤1. Then product_{j in S} b_j≤B^card(T) q^max(card(S)−card(T),0). In addition: The coefficient family in this lemma is real and nonnegative. It need not tend to zero; this is a finite product statement, valid also at q=0 and q=1. (Source: Serre, Proposition 7(b), printed p. 76 (PDF p. 9).)

*Needs:* Mathlib `Finset.card_sdiff_add_card_inter`.

### 4.3 Entire division by linear and monic factors

Hypotheses shared by several targets of this subsection, cited by letter below: (a) A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed. (b) A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient 1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed. (c) C is a real number with C≥1 and norm(coeff_i(Q.reverse))≤C^i for every i. Such a C exists because the reversal is a polynomial with constant coefficient 1: choose C≥1 bounding its finitely many nonconstant coefficient norms.

Source for this subsection unless a target says otherwise: Coleman, Appendix A3, printed p. 434: quotient-algebra interpretation and proof of Lemma A3.5; published p. 432–435; derived from the cited passage, not printed there.

Library inputs of this subsection, used by several of its targets: Mathlib `Summable.of_norm_bounded_eventually_nat`, `Filter.Tendsto.bddAbove_range`, `summable_geometric_of_lt_one`, `norm_pow_le`, `PowerSeries.coeff_mk`, `PowerSeries.mk`, `Multipliable.tprod_eq_zero_mul`, `Summable.tsum_mul_left`, `IsUltrametricDist.norm_tprod_le_of_forall_le_of_nonneg`, `tendsto_pow_atTop_nhds_zero_of_lt_one`, `PowerSeries.ext`, `PowerSeries.coeff_succ_X_mul`, `PowerSeries.coeff_C_mul`, `Polynomial.modByMonic_add_div`, `Polynomial.reverse`, `IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg`, `Polynomial.coeff_zero_reverse`, `PowerSeries.invOfUnit`, `PowerSeries.coeff_mul`, `Polynomial.coeff_coe`; Tau Ceti `TauCeti.PowerSeries.isRestricted_polynomial`.

**Summability of every evaluated coefficient tail** (lemma). If F=sum c_n T^n is entire and a is any element of A, then for every m>=0 the series sum_(k>=0) c_(m+k) a^k is summable. The case m=0 is evaluation at a. Under (a). (Source: Coleman, Section A3, printed p.434, proof of Lemma A3.5; linear-factor specialization; derived from the cited passage, not printed there.)

*Needs:* §4.2 `mem_entireSeries`.

**Tail quotient for division by a linear factor** (construction). For a in A and a native formal series F=sum c_n T^n, define Q_a(F) by coefficient q_n=sum_(k>=0) c_(n+1+k)a^k, using the total native infinite sum. Its analytic quotient interpretation and additive/scalar laws below are asserted for entire F, where every tail converges. No new carrier for entire series is introduced. Under (a). Its API consists of `entireLinearQuotient_coeff` (The coefficient q_n is the convergent tail sum_(k>=0)c_(n+1+k)a^k for entire F; the total coefficient equality holds for every F), `entireLinearQuotient_zero` (Q_a(0)=0), `entireLinearQuotient_add` (For entire F,G, Q_a(F+G)=Q_a(F)+Q_a(G)), `entireLinearQuotient_C_mul` (For entire F and any b in A, Q_a(bF)=b Q_a(F)), `entireLinearQuotient_C` (Q_a(b)=0 for any constant b), `entireLinearQuotient_at_zero` (Q_0(F) is the native shifted series with coefficient c_(n+1), for every formal F), `entireLinearQuotient_entire` (If F is entire and A is ultrametric, Q_a(F) is entire) and `entireLinearQuotient_polynomial` (For a polynomial P, Q_a(P) is the native monic polynomial quotient P divided by T-a, included in the native power-series ring). (Source: Coleman, Section A3, printed p.434, proof of Lemma A3.5; linear-factor specialization; derived from the cited passage, not printed there.)

*Needs:* §4.2 `mem_entireSeries`; §4.3 `entire_tail_summable`.

**Checks.**

- `linear_quotient_constant` (degenerate): For any a,b in A, Q_a(b)=0.
- `linear_quotient_quadratic`: For any a in A, Q_a(T^2)=T+a.
- `linear_quotient_zero_shift` (compatibility): For every formal F, Q_0(F)=PowerSeries.mk of the shifted coefficients c_(n+1).
- `linear_quotient_native_polynomial` (compatibility): For ultrametric A, any a and polynomial P, Q_a(P)=the native polynomial quotient P divByMonic (T-a) included in A[[T]].
- `linear_quotient_zero_divisor`: For e in A with e^2=0, Q_e(eT^2)=eT. Nonzero nilpotents need not be discarded.

**Coefficient formula for the tail quotient** (lemma). For every formal F, a and n, coeff_n(Q_a(F))=sum_(k>=0)c_(n+1+k)a^k as an equality of total native sums; for entire F the sum converges. Under (a). (Source: Coleman, Section A3, printed p.434, proof of Lemma A3.5; linear-factor specialization; derived from the cited passage, not printed there.)

*Needs:* §4.3 `entireLinearQuotient`.

**Recurrence for linear-quotient coefficients** (lemma). For entire F, q_n=c_(n+1)+a q_(n+1) for every n>=0. Under (a). (Source: Coleman, Section A3, printed p.434, proof of Lemma A3.5; linear-factor specialization; derived from the cited passage, not printed there.)

*Needs:* §4.3 `entireLinearQuotient_coeff`; §4.3 `entire_tail_summable`.

**Ultrametric bound for each quotient coefficient** (lemma). Suppose A is ultrametric, S>0, norm(a)<=S and M>=0 satisfies norm(c_m) S^m<=M for all m. Then norm(coeff_n(Q_a(F)))<=M/S^(n+1) for every n. This bound is valid for the total construction even without an entireness assumption; it does not by itself assert tail convergence. Under (a). (Source: Coleman, Section A3, printed p.434, proof of Lemma A3.5; linear-factor specialization; derived from the cited passage, not printed there.)

*Needs:* §4.3 `entireLinearQuotient_coeff`; Mathlib `IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm`.

**Entireness of the linear quotient** (lemma). Over ultrametric A, for every a and entire F the quotient Q_a(F) is entire. Under (a). (Source: Coleman, Section A3, printed p.434, proof of Lemma A3.5; linear-factor specialization; derived from the cited passage, not printed there.)

*Needs:* §4.3 `entireLinearQuotient_bound`; §4.2 `mem_entireSeries`.

**Division identity with evaluation as remainder** (theorem). For entire F and arbitrary a, F=(T-a)Q_a(F)+F(a) in native A[[T]], where F(a)=sum_(n>=0)c_n a^n and the remainder is a constant series. Under (a). (Source: Coleman, Section A3, printed p.434, proof of Lemma A3.5; linear-factor specialization; derived from the cited passage, not printed there.)

*Needs:* §4.3 `entireLinearQuotient_recurrence`; §4.3 `entire_tail_summable`.

**An entire linear product cannot be a nonzero constant** (lemma). If H is entire and (T-a)H=b is a constant series, then H=0 and b=0. This holds over a complete commutative normed ring without a domain assumption. Under (a). (Source: Coleman, Section A3, printed p.434, proof of Lemma A3.5; linear-factor specialization; Coleman, Lemma A3.1, printed p. 432; corrected linear entire case, finding LocallyAnalyticDistributions/E1; derived from the cited passage, not printed there.)

*Needs:* §4.2 `mem_entireSeries`; Mathlib `le_of_tendsto`.

**Checks.**

- `linear_entire_uniqueness_boundary` (non-example): For any a in A, the native formal geometric series H=sum a^n T^n satisfies (1-aT)H=1. At a=p in Q_p it is restricted but not entire, disproving the unrestricted replacement in Coleman A3.1.

**Uniqueness of the entire quotient and constant remainder** (theorem). If F=(T-a)G+b=(T-a)H+c with entire G,H and b,c in A, then G=H and b=c. Under (a). (Source: Coleman, Section A3, printed p.434, proof of Lemma A3.5; linear-factor specialization; derived from the cited passage, not printed there.)

*Needs:* §4.3 `entire_linear_product_constant`; §4.2 `mem_entireSeries`.

**Agreement with native monic polynomial division** (comparison). For ultrametric A, arbitrary a and polynomial P, Q_a(polynomialSeries(P)) equals polynomialSeries(P divByMonic (T-a)). Under (a). (Source: Coleman, Section A3, printed p.434, proof of Lemma A3.5; linear-factor specialization; derived from the cited passage, not printed there.)

*Needs:* §4.3 `entireLinearQuotient_entire`; §4.3 `entire_linear_division`; §4.3 `entire_linear_division_unique`; Mathlib `Polynomial.divByMonic`, `Polynomial.modByMonic_X_sub_C_eq_C_eval`.

**Roots and linear factors in the entire-series ring** (theorem). For ultrametric A, arbitrary a and entire F, F(a)=0 if and only if there exists an entire G with F=(T-a)G. Under (a). (Source: Coleman, Section A3, printed p.434, proof of Lemma A3.5; linear-factor specialization; derived from the cited passage, not printed there.)

*Needs:* §4.3 `entire_linear_division`; §4.3 `entireLinearQuotient_entire`; §4.3 `entire_linear_division_unique`.

**Exponential bound for the reciprocal reversal** (lemma). For every k≥0, norm(b_k)≤C^k. Under (b) and (c).

*Needs:* Mathlib `PowerSeries.coeff_invOfUnit`.

**Convergence of reciprocal-weighted entire tails** (lemma). For every entire F and every m≥0, the series Σ_(k≥0) coeff_(m+k)(F)b_k is summable. Under (b).

*Needs:* §4.3 `monic_reciprocal_coeff_bound`; §4.2 `mem_entireSeries`.

**Reciprocal-tail quotient by a monic polynomial** (construction). For native formal F, define S_Q(F) by coefficient s_n=Σ_(k≥0) coeff_(n+d+k)(F)b_k using the total native infinite sum. Analytic interpretation and linear laws are asserted for entire inputs. Under (b). Its API consists of `entireMonicQuotient_zero` (S_Q(0)=0), `entireMonicQuotient_add` (For entire F,G and monic Q, S_Q(F+G)=S_Q(F)+S_Q(G)) and `entireMonicQuotient_C_mul` (For entire F and monic Q, S_Q(cF)=cS_Q(F) for every c∈A).

*Needs:* §4.3 `monic_reciprocal_tail_summable`.

**Checks.**

- `monic_quotient_one` (degenerate): For every formal F, S_1(F)=F.
- `monic_quotient_power_shift` (compatibility): For d≥0 and every formal F, S_(T^d)(F) is the native series with nth coefficient coeff_(n+d)(F).
- `monic_quotient_quadratic`: For Q=T^2+aT+b and F=T^3, S_Q(F)=T-a.
- `monic_quotient_nilpotent`: If e^2=0, then S_(T^2-e)(T^4)=T^2+e and the remainder is zero, including nonzero nilpotent e.

**Coefficients of the monic tail quotient** (lemma). For every formal F, coeff_n(S_Q(F))=Σ_(k≥0)coeff_(n+d+k)(F)b_k. For entire F and monic Q this sum converges. Under (b).

*Needs:* §4.3 `entireMonicQuotient`.

**Weighted bound for the monic quotient** (lemma). If S≥C, M≥0 and norm(coeff_j(F))S^j≤M for every j, then norm(coeff_n(S_Q(F)))≤M/S^(n+d). Under (b) and (c).

*Needs:* §4.3 `entireMonicQuotient_coeff`; §4.3 `monic_reciprocal_coeff_bound`.

**Entireness of the monic quotient** (lemma). If F is entire and Q monic, then S_Q(F) is entire. Under (b).

*Needs:* §4.3 `entireMonicQuotient_bound`; §4.2 `mem_entireSeries`.

**The monic quotient coefficient recurrence** (lemma). For entire F and every n≥0, coeff_(n+d)(F)=s_n+Σ_(i<d)coeff_i(Q)s_(n+d-i). Under (b).

*Needs:* §4.3 `entireMonicQuotient_coeff`; §4.3 `monic_reciprocal_tail_summable`; Mathlib `PowerSeries.mul_invOfUnit`, `Polynomial.coeff_reverse`, `Polynomial.reverse_natDegree_le`, `Multipliable.tprod_finsetProd`.

**The native polynomial remainder** (theorem). For entire F, let R be the native degree-d truncation of F-Q S_Q(F). Then F=Q S_Q(F)+R in A[[T]] and degree(R)<d. Under (b).

*Needs:* §4.3 `entireMonicQuotient_recurrence`; Mathlib `PowerSeries.trunc`, `PowerSeries.coeff_trunc`, `PowerSeries.degree_trunc_lt`.

**A monic entire product cannot lower degree** (lemma). If H is entire, R is a polynomial of degree less than d and QH=R in A[[T]], then H=0 and R=0. Under (b).

*Needs:* §4.2 `mem_entireSeries`; Mathlib `Polynomial.coeff_eq_zero_of_degree_lt`, `le_csSup`, `csSup_le`, `Polynomial.coe_injective`.

**Uniqueness of monic entire division** (theorem). If F=QG+R=QH+S, G,H are entire and polynomial R,S have degree less than d, then G=H and R=S. Under (b).

*Needs:* §4.3 `entire_monic_product_low_degree`; §4.2 `mem_entireSeries`.

**Compatibility with native polynomial division** (comparison). For every polynomial P, S_Q(P)=P divByMonic Q under native polynomial inclusion, and the constructed native truncation remainder equals P modByMonic Q. Under (b).

*Needs:* §4.3 `entireMonicQuotient_division`; §4.3 `entireMonicQuotient_entire`; §4.3 `entire_monic_division_unique`; Mathlib `Polynomial.degree_modByMonic_lt`.

**Compatibility with the existing linear tail quotient** (comparison). For every a∈A and entire F, S_(T-a)(F) equals the existing entireLinearQuotient(a,F). Under (b).

*Needs:* §4.3 `entireMonicQuotient_division`; §4.3 `entireMonicQuotient_entire`; §4.3 `entire_monic_division_unique`; §4.3 `entire_linear_division`; §4.3 `entireLinearQuotient_entire`.

**Division of entire series by a monic polynomial** (theorem). For monic Q in A[T] of degree d and P in A{{T}}, there are unique S in A{{T}} and R in A[T] with degree R<d and P=QS+R; for Q=1, R=0. Under (b). (Source: Coleman, Appendix A3, division preceding Lemmas A3.5 and A3.7; Coleman, printed p. 434, norm interpretation and proof of Lemma A3.5.)

*Needs:* §4.3 `entireMonicQuotient_division`; §4.3 `entireMonicQuotient_entire`; §4.3 `entire_monic_division_unique`.

### 4.4 Resultants of monic polynomials and entire series

Hypotheses shared by several targets of this subsection, cited by letter below: (a) A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Q is a monic polynomial, including Q=1. F belongs to the existing entire-series subring, meaning weighted coefficients tend to zero at every positive real radius. No field, reducedness, Noetherianity or splitting assumption is imposed.

Source for this subsection unless a target says otherwise: Coleman, Appendix A3, printed p. 434–435: quotient-norm interpretation and Lemmas A3.5,A3.7; derived from the cited passage, not printed there.

**Polynomial inclusion in the entire-series ring** (construction). Bundle the existing polynomialSeries inclusion as the ring homomorphism i:A[T] to A{{T}}. Its underlying native formal series is the native polynomial coercion. This corestricts an existing map; it introduces no new entire or formal-series carrier. Under (a). Its API consists of `entirePolynomial_coe` (The underlying formal series of i(P) is polynomialSeries(P), equal to the native polynomial coercion), `entirePolynomial_injective` (The ring homomorphism i is injective) and `entirePolynomial_C` (The underlying formal series of i(C(a)) is PowerSeries.C(a)).

*Needs:* Mathlib `Polynomial.coeToPowerSeries.ringHom`, `Polynomial.coe_injective`, `Polynomial.eval₂_C_X_eq_coe`; Tau Ceti `TauCeti.PowerSeries.isRestricted_polynomial`.

**Checks.**

- `entire_polynomial_zero` (degenerate): i(0)=0.
- `entire_polynomial_square`: The underlying formal series of i(T^2) is T^2.
- `entire_polynomial_native_injective` (compatibility): For native polynomials P,S, i(P)=i(S) if and only if P=S.

**Polynomial divisibility detected inside entire series** (lemma). For monic Q and any native polynomial P, i(Q) divides i(P) in A{{T}} if and only if Q divides P in A[T]. Under (a).

*Needs:* §4.4 `entirePolynomial`; §4.3 `entire_monic_division_existsUnique`; Mathlib `Polynomial.modByMonic_add_div`, `Polynomial.degree_modByMonic_lt`, `Polynomial.modByMonic_eq_zero_iff_dvd`.

**Entire series in the native monic quotient** (construction). For monic Q, define the ring homomorphism rho_Q:A{{T}} to native AdjoinRoot Q=A[T]/(Q) by entire division F=i(Q)S+i(R) and rho_Q(F)=AdjoinRoot.mk Q R. The value is independent of every such polynomial representative, even if its degree is not normalized. Under (a). Its API consists of `entireAdjoinRoot_polynomial` (rho_Q(i(P))=AdjoinRoot.mk Q P for every native polynomial P), `entireAdjoinRoot_of_decomposition` (If F=i(Q)G+i(R) with G entire and R any polynomial, rho_Q(F)=AdjoinRoot.mk Q R; no degree bound on R is required), `entireAdjoinRoot_eq_zero_iff` (rho_Q(F)=0 if and only if i(Q) divides F in the entire ring; promoted to its own target), `entireAdjoinRoot_surjective` (rho_Q is surjective; promoted to its own target) and `entireAdjoinRoot_linear` (For Q=T-a, rho_Q(F)=AdjoinRoot.of Q (F(a)); promoted to its own target).

*Needs:* §4.3 `entire_monic_division_existsUnique`; §4.4 `entirePolynomial`; §4.4 `entirePolynomial_dvd_iff`; Mathlib `AdjoinRoot.mk_eq_mk`.

**Checks.**

- `quotient_constant_divisor` (degenerate): For Q=1, rho_1(F)=0 for every entire F; 0=1 in the target.
- `quotient_nilpotent_square`: rho_(T^2)(i(T^2))=0.
- `quotient_nilpotent_generator_nonzero` (nonexample): For nontrivial A, rho_(T^2)(i(T)) is nonzero, although its square is zero.
- `quotient_native_remainder` (compatibility): For every native polynomial P, rho_Q(i(P))=AdjoinRoot.mk Q (P modByMonic Q).

**Kernel of analytic reduction modulo a monic polynomial** (lemma). For F in A{{T}}, rho_Q(F)=0 if and only if i(Q) divides F in A{{T}}. Equivalently the kernel ideal is the principal ideal generated by i(Q). Under (a).

*Needs:* §4.4 `entireAdjoinRoot`; Mathlib `AdjoinRoot.mk_eq_zero`.

**Polynomial representatives lift every quotient class** (lemma). The map rho_Q:A{{T}} to native AdjoinRoot Q is surjective. Together with the kernel theorem, native RingHom.quotientKerEquivOfSurjective identifies A{{T}}/(i(Q)) with the native polynomial quotient. No second quotient-equivalence construction is planned. Under (a).

*Needs:* §4.4 `entireAdjoinRoot`; §4.4 `entireAdjoinRoot_eq_zero_iff`; Mathlib `AdjoinRoot.mk_surjective`, `RingHom.quotientKerEquivOfSurjective`.

**Linear analytic reduction is convergent evaluation** (comparison). For arbitrary a in A and entire F, rho_(T-a)(F)=AdjoinRoot.of (T-a) (F(a)), where F(a) is the existing convergent entire evaluation. Under (a).

*Needs:* §4.4 `entireAdjoinRoot`; §4.3 `entire_linear_division`; §4.3 `entireLinearQuotient_entire`.

**Resultant of a monic polynomial and an entire series** (construction). For monic Q of degree d and entire F, define the existing Res(Q,F) to be native Algebra.norm A (rho_Q(F)), equivalently the determinant of multiplication by rho_Q(F) in the native AdjoinRoot.powerBasis' basis indexed by Fin d. This refines the original finite-quotient determinant definition in place. It includes d=0, whose empty determinant is one. Under (a). Its API consists of `entireResultant_remainder` (The resultant depends only on P modulo Q), `entireResultant_mul` (Res(Q,P1 P2)=Res(Q,P1) Res(Q,P2)), `entireResultant_linear` (Res(T-a,P)=P(a)), `entireResultant_norm` (Res(Q,F)=Algebra.norm A (rho_Q(F)) in the native monic quotient) and `entireResultant_polynomial` (For native polynomial P the value is native Polynomial.resultant Q P Q.natDegree P.natDegree; promoted to its own comparison target). (Source: Coleman, Appendix A3, definition of resultant and Lemma A3.7; Coleman, printed p. 434–435, norm interpretation and Lemmas A3.5,A3.7.)

*Needs:* §4.4 `entireAdjoinRoot`; §4.4 `entireAdjoinRoot_surjective`; §4.4 `entireAdjoinRoot_linear`; Mathlib `AdjoinRoot.powerBasis'`, `Algebra.norm`, `Algebra.norm_eq_matrix_det`, `Algebra.norm_algebraMap_of_basis`.

**Checks.**

- `constant_divisor`: Res(1,P)=1, including P=0.
- `linear_evaluation`: Res(T-a,1-bT)=1-ba.
- `common_factor`: For positive-degree monic Q, Res(Q,Q)=0.
- `resultant_nilpotent_linear`: For Q=T^2 and P=a+bT, Res(Q,P)=a^2 over A, without reducedness or domain hypotheses.

**Entire resultant agrees with the native polynomial resultant** (comparison). For monic Q and every native polynomial P, the existing entire resultant of Q and i(P) equals native Polynomial.resultant Q P Q.natDegree P.natDegree, with exactly this argument order and degree bounds. Under (a).

*Needs:* §4.4 `entireResultant`; §4.4 `entireAdjoinRoot`; Tau Ceti `AdjoinRoot.norm_mk_eq_resultant`.

**Bounded polynomial coefficient in the resultant Bezout identity** (lemma). For monic Q of degree d and entire F, there exist entire G and polynomial H with degree H<d such that i(C(Res(Q,F)))=i(Q)G+i(H)F. At d=0, Q=1 and one may take G=1,H=0. Under (a).

*Needs:* §4.3 `entire_monic_division_existsUnique`; §4.4 `entirePolynomial`; §4.4 `entireResultant`; §4.4 `entireResultant_polynomial`; Mathlib `Polynomial.exists_mul_add_mul_eq_C_resultant`.

**Resultant detects analytic coprimality** (lemma). For monic Q and entire P, Res(Q,P) is a unit in A exactly when Q and P generate the unit ideal of A{{T}}. Under (a). (Source: Coleman, Lemma A3.7 and proof; Coleman, printed p. 434–435, norm interpretation and Lemmas A3.5,A3.7.)

*Needs:* §4.4 `entireResultant`; §4.4 `entireAdjoinRoot_eq_zero_iff`; §4.4 `entireAdjoinRoot_surjective`; §4.4 `entireResultant_bezout`; Mathlib `LinearMap.isUnit_iff_isUnit_det`, `Algebra.lmul_isUnit_iff`, `Polynomial.isUnit_resultant_iff_isCoprime`, `isUnit_iff_exists_inv`, `IsCoprime`.

### 4.5 Resolvents, Hasse derivatives and Riesz projectors

Hypotheses shared by several targets of this subsection, cited by letter below: (a) the standing Banach hypotheses of Convention 1; M has (Pr) and u is completely continuous. (b) Use the norm after restriction to K. The compatible A-action has an explicit bound norm(bx) <= C norm(b) norm(x) for some C>0; C is not assumed to be one. (c) the standing Banach hypotheses of Convention 1; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. (d) The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Source for this subsection unless a target says otherwise: Serre, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14); Buzzard, Proposition 3.2, manuscript p. 23, first proof paragraph.

Library inputs of this subsection, used by several of its targets: Mathlib `Summable.of_norm_bounded_eventually_nat`, `summable_geometric_of_lt_one`, `HasSum.mul_left`, `Commute.mul_pow`.

**Fredholm resolvent series** (construction). For completely continuous u with determinant coefficients c_n, define v_0=1 and v_n=c_n 1+u v_(n-1). The operator-valued series F_u(T)=sum_n v_n T^n is entire and (1-Tu)F_u=F_u(1-Tu)=P_u(T)1. In addition: the standing Banach hypotheses of Convention 1; M is potentially ONable or has (Pr), using zero extension in the second case. Its API consists of `resolventCoeff_zero` (The initial coefficient v₀ is the identity endomorphism on the actual module M), `resolventCoeff_succ` (v_(n+1)=c_(n+1) 1+u v_n, with v_0=1), `resolvent_entire` (For every R>0, norm(v_n) R^n tends to zero) and `resolvent_identity` (Both left and right multiplication by 1-Tu give P_u(T) times the identity). (Source: Serre, Section 6, Proposition 10 and Lemma 3 with its three-step proof, pp. 78-79.)

*Needs:* §4.2 `fredholmSeriesPr_split`; §4.6 `resolvent_recurrence_entire`.

**Checks.**

- `rank_one_resolvent`: On A with u=a, F_u(T)=1.
- `diagonal_two`: For diag(a,b), F_u(T)=diag(1-bT,1-aT).
- `nilpotent_two`: For the two-by-two nilpotent Jordan block N, F_N(T)=1+TN.

**Polynomial Fredholm invertibility criterion** (theorem). For a monic polynomial Q and completely continuous u on a (Pr) module, Q and P_u are coprime in A{{T}} exactly when Q*(u) is invertible in the algebra of continuous A-linear endomorphisms. In addition: the standing Banach hypotheses of Convention 1; Q* is the degree-correct reciprocal polynomial. (Source: Buzzard, Lemma 3.1, pp. 21-22; Coleman, Lemma A4.1 proof and Lemmas A3.7-A3.8, Theorem A3.9.)

*Needs:* §4.4 `entireResultant`; §4.2 `fredholmSeriesPr_split`; §4.4 `entireResultant_isUnit_iff`; §4.5 `resolventCoeff_zero`; §4.2 (Evaluated Fredholm product identity for (Pr)).

**Hasse derivatives of formal power series** (construction). For any possibly noncommutative semiring B and s in N, construct the additive B-linear operation Delta_s on the existing B[[T]] by coefficient_n(Delta_s f)=choose(n+s,s) times coefficient_(n+s)(f). Multiplication by the natural number means repeated addition, with no inverse factorial and no convergence assumption. In addition: B is a semiring; s and coefficient indices are natural numbers. The variable T is central. Its API consists of `hasseSeries_coeff` (Coefficient n is choose(n+s,s) times coefficient n+s), `hasseSeries_zero` (Delta_0 f=f), `hasseSeries_add` (Delta_s(f+g)=Delta_s f+Delta_s g) and `hasseSeries_smul` (Delta_s(b f)=b Delta_s f, including noncommutative B). (Source: Buzzard, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.)

*Needs:* Mathlib `PowerSeries.mk`, `PowerSeries.coeff_mk`.

**Checks.**

- `hasse_order_zero` (degenerate): Delta_0 fixes every series.
- `hasse_degree_boundary` (non-example): Delta_s(b T^d)=0 whenever d<s.
- `hasse_top_monomial`: Delta_s(b T^s)=b, not s factorial times b.
- `hasse_characteristic_two` (non-example): Over Z/2, Delta_2(T^2)=1 although the second ordinary polynomial derivative is zero.

**Polynomial and series Hasse derivatives agree** (comparison). The native inclusion of B[T] in B[[T]] carries Polynomial.hasseDeriv s p to Delta_s of the included polynomial, for every semiring B. In addition: No topology, characteristic restriction or commutativity of B. (Source: Buzzard, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.)

*Needs:* §4.5 `hasseSeries_coeff`; Mathlib `Polynomial.hasseDeriv`, `Polynomial.hasseDeriv_coeff`, `Polynomial.coeff_coe`.

**Hasse product formula for power series** (lemma). For f,g in B[[T]] and s in N, Delta_s(fg)=sum over i+j=s of (Delta_i f)(Delta_j g), with f before g in every product. In addition: B is any semiring; the sum over pairs of natural numbers with i+j=s is finite. (Source: Serre, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14); Buzzard, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.)

*Needs:* §4.5 (Polynomial and series Hasse derivatives agree); Mathlib `Polynomial.hasseDeriv_mul`, `PowerSeries.coeff_trunc`, `PowerSeries.coeff_mul_eq_coeff_trunc_mul_trunc`.

**Hasse coefficient radius bound** (lemma). For a normed ring B, f in B[[T]], s,n in N and real R>0, norm(coefficient_n(Delta_s f)) R^n is at most R^(-s) norm(coefficient_(n+s)(f)) (2R)^(n+s). In addition: B need not be commutative, complete, ultrametric or norm-one. R is strictly positive. (Source: Buzzard, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.)

*Needs:* §4.5 `hasseSeries_coeff`; Mathlib `norm_pow_le_mul_norm`, `Nat.choose_le_two_pow`.

**Hasse derivatives preserve entireness** (lemma). If for every real R>0 the sequence norm(f_n) R^n tends to zero, the same holds for the coefficients of Delta_s f, for each fixed s. This applies to a possibly noncommutative normed coefficient ring. In addition: B is a normed ring; no completeness is needed for this coefficient limit statement. (Source: Buzzard, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.)

*Needs:* §4.5 (Hasse coefficient radius bound); §4.2 `mem_entireSeries`.

**Evaluated Hasse derivatives of the resolvent** (construction). For a in A and s in N, construct z_s(a)=sum_n choose(n+s,s) a^n v_(n+s) as a continuous A-linear endomorphism of M, where v_n are the existing Fredholm resolvent coefficients. The sum converges in the native K-operator norm. Under (a) and (b). Its API consists of `resolventHasseAt_hasSum` (The binomially weighted resolvent coefficient sequence has this sum in the native K-operator norm, with the explicit bounded-action hypothesis), `resolventHasseAt_zero` (Hasse order zero agrees with the existing resolventAt) and `resolventHasseAt_at_zero` (At a=0 the value is exactly v_s). (Source: Serre, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14); Buzzard, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.)

*Needs:* §4.5 `resolventCoeff_zero`; §4.5 (Hasse derivatives preserve entireness); Mathlib `ContinuousLinearMap.instCompleteSpace`, `ContinuousLinearMap.opNorm_le_bound`, `ContinuousLinearMap.le_opNorm`.

**Checks.**

- `hasse_scalar_resolvent` (degenerate): On the line A with u=a, the resolvent numerator is constant one, so z_1(t)=0.
- `hasse_diagonal_resolvent`: For diag(a,b), z_1(t)=diag(-b,-a), independent of t.
- `hasse_nilpotent_resolvent` (non-example): For the nonzero nilpotent two-by-two Jordan block N, z_1(t)=N even though P_N=1.

**Evaluated Hasse resolvent recurrence** (lemma). For every s>=0 and a in A, (1-au) z_(s+1)(a) - u z_s(a) = Delta_(s+1) P_u(a) times 1, and z_(s+1)(a)(1-au) - z_s(a)u has the same value. The order-zero identity is the existing two-sided resolvent identity, using z_0(a)=F_u(a). Under (a) and (b). (Source: Serre, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14); Buzzard, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.)

*Needs:* §4.5 (Hasse product formula for power series); §4.5 `resolventHasseAt_hasSum`; §4.5 (Polynomial and series Hasse derivatives agree); §4.5 `resolventCoeff_zero`; §4.2 `mem_entireSeries`; Mathlib `HasSum.mul_right`.

**Hasse resolvent values lie in the polynomial closure** (lemma). For every a in A and s in N, the restricted K-linear map z_s(a) belongs to the closure, in the native K-operator norm, of the set of finite polynomial expressions sum_i b_i u^i with b_i in A. Under (a) and (b). (Source: Serre, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14); Buzzard, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.)

*Needs:* §4.5 `resolventHasseAt_hasSum`; §4.5 `resolventCoeff_zero`; Mathlib `hasSum_iff_tendsto_nat_of_summable_norm`.

**Hasse resolvent values commute** (lemma). Each z_s(a) commutes with u and with every z_t(b), for all a,b in A and s,t in N. Under (a) and (b). (Source: Serre, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14).)

*Needs:* §4.5 (Hasse resolvent values lie in the polynomial closure); Mathlib `ContinuousLinearMap.toNormedRing`.

**Roots of an entire series with unit constant are units** (lemma). If f in A{{T}} has constant coefficient one and f(a)=0, then a is a unit with inverse -sum_(n>=0) f_(n+1) a^n. In particular a positive-order Hasse root of a Fredholm determinant is a unit. In addition: A is a complete commutative normed ring; no field, reducedness, Noetherianity or characteristic hypothesis is needed. (Source: Buzzard, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.)

*Needs:* §4.2 `mem_entireSeries`.

**Checks.**

- `root_nonunit_constant` (non-example): The entire polynomial T vanishes at zero, which is not a unit in a nonzero coefficient algebra.

**Lower Hasse resolvent annihilation** (lemma). For every s<h, v^(s+1) z_s=0. Under (c) and (d).

*Needs:* §4.5 (Evaluated Hasse resolvent recurrence); §4.5 (Hasse resolvent values commute); §4.5 `resolventCoeff_zero`.

**Normalized Hasse resolvent identity** (lemma). The actual b=c^(-1)z_h commutes with v, and v^h(1-vb)=0, including h=0. Under (c) and (d).

*Needs:* §4.5 (Lower Hasse resolvent annihilation); §4.5 (Evaluated Hasse resolvent recurrence); §4.5 (Hasse resolvent values commute); §4.5 `resolventCoeff_zero`.

**Explicit Hasse Riesz projector** (construction). Define rieszRootProjector(u,Pr,cc,a,h,c)=E=1-((1-au)(c^(-1)z_h))^h as a native continuous A-linear endomorphism; its complement is p=1-E. The formula exists for every a,h and chosen unit c; its spectral properties require the exact Hasse-order hypotheses. Under (c) and (d). Its API consists of `rieszRootProjector_formula` (Equality with 1-((1-au)(c^(-1)z_h))^h on the existing continuous-linear-map carrier), `rieszRootProjector_zero_order` (For h=0 the projector is zero for every a and chosen unit c), `rieszRootProjector_fixed_iff` (Under the exact Hasse-order hypotheses, E x=x if and only if v^h x=0) and `rieszRootProjector_eq_projectionL` (Under the exact Hasse-order hypotheses, there is a native topological-complement proof for ker(v^h) and image(v^h), and E equals its existing Submodule.projectionL).

*Needs:* §4.5 `resolventHasseAt_hasSum`.

**Checks.**

- `riesz_order_zero` (degenerate): At order zero the formula gives E=0 on every M, even without the root hypotheses.
- `riesz_scalar_root`: For u=identity on A, a=1, h=1 and c=-1, E is the identity.
- `riesz_diagonal_root`: For u=diag(1,0) on the native two-coordinate c0 module, a=1, h=1, c=-1, E=diag(1,0), not its regular complement.
- `riesz_jordan_root` (non-example): For u=I+N with the nonzero two-by-two nilpotent Jordan block N, a=1, h=2, c=1, E=I although 1-u is nonzero. The full generalized eigenspace is required.

**Idempotence of the Hasse projector** (lemma). Under the exact Hasse-order hypotheses, E is idempotent; p=1-E is its complementary idempotent. Under (c) and (d).

*Needs:* §4.5 `rieszRootProjector_formula`; §4.5 (Normalized Hasse resolvent identity); Mathlib `one_sub_dvd_one_sub_pow`, `IsIdempotentElem.one_sub`.

**Canonical kernel and image summands** (lemma). The projector has image(E)=ker(v^h) and ker(E)=image(v^h); equivalently image(p)=image(v^h). These identify the summands of the root splitting canonically. Under (c) and (d).

*Needs:* §4.5 (Idempotence of the Hasse projector); §4.5 (Normalized Hasse resolvent identity); Mathlib `LinearMap.IsIdempotentElem.range_eq_ker_one_sub`, `LinearMap.IsIdempotentElem.ker_eq_range_one_sub`, `LinearMap.IsIdempotentElem.mem_range_iff`.

**Topological Riesz decomposition** (theorem). N=ker(v^h) and F=image(v^h) are closed native A-submodules and topological complements. The constructed E agrees with the native continuous projection onto N along F. Under (c) and (d).

*Needs:* §4.5 (Canonical kernel and image summands); §4.5 (Idempotence of the Hasse projector); Mathlib `ContinuousLinearMap.IsIdempotentElem.isTopCompl`, `ContinuousLinearMap.IsIdempotentElem.isClosed_range`, `ContinuousLinearMap.IsIdempotentElem.eq_projectionL`.

**Inverse on the regular Riesz summand** (theorem). Both v and b preserve F=image(v^h), and v(bx)=b(vx)=x for every x in F. Their restrictions are mutually inverse continuous A-linear maps of F. Under (c) and (d).

*Needs:* §4.5 (Canonical kernel and image summands); §4.5 (Normalized Hasse resolvent identity); §4.5 (Idempotence of the Hasse projector).

**Polynomial closure of Riesz projectors** (lemma). E and p belong to the K-operator-norm closure of the actual A-polynomials in u, represented by the existing finite polynomial evaluation formula. Under (c) and (d).

*Needs:* §4.5 `rieszRootProjector_formula`; §4.5 (Hasse resolvent values lie in the polynomial closure).

**Stability under commuting operators** (lemma). Every continuous A-linear endomorphism t commuting with u commutes with E and p, and preserves N=ker(v^h) and F=image(v^h). Under (c) and (d).

*Needs:* §4.5 (Polynomial closure of Riesz projectors); §4.5 (Canonical kernel and image summands); §4.5 (Idempotence of the Hasse projector); Mathlib `ContinuousLinearMap.IsIdempotentElem.commute_iff`.

**Riesz projectors at a Fredholm root** (theorem). If a in A is a root of P_u of Hasse order h, with the h-th Hasse derivative a unit, then M=N plus F as closed u-stable summands, (1-au)^h is zero on N, 1-au is invertible on F, and N is finite projective of constant rank h. For h>0, a is a unit and P_(u|N)=(1-a^(-1)T)^h. The projectors lie in the operator-norm closure of A[u]. In addition: the standing Banach hypotheses of Convention 1; M has (Pr); u completely continuous. For h=0 take N=0 and F=M. (Source: Buzzard, Proposition 3.2 and proof, pp. 23-24; Serre, Proposition 12 and proof, pp. 80-81.)

*Needs:* §4.5 (Polynomial Fredholm invertibility criterion); §4.2 `hasPr_of_potentiallyON`; §4.2 `fredholmSeriesPr_split`; §4.5 `resolventCoeff_zero`; §4.1 (Complete continuity of the identity detects finite generation); §4.2 (Finite (Pr) modules are algebraically projective); §4.2 (Fredholm determinant of a direct sum); §4.5 (Evaluated Hasse resolvent recurrence); §4.5 (Hasse resolvent values lie in the polynomial closure); §4.5 (Hasse resolvent values commute); §4.5 (Roots of an entire series with unit constant are units); §4.5 (Topological Riesz decomposition); §4.5 (Inverse on the regular Riesz summand); §4.5 (Stability under commuting operators); §4.7 `riesz_kernel_finite`; §4.7 `riesz_kernel_projective`; §4.7 `rieszKernelOperatorEquiv`.

**Finite projective slope summands** (theorem). Suppose P_u=Q S, Q polynomial with constant coefficient one and unit leading coefficient, S entire with S(0)=1, and Q,S analytically coprime. Then M=N plus F as closed u-stable summands, N finite projective of rank deg Q, Q*(u) kills N and is invertible on F, and P_(u|N)=Q. The associated projector lies in the closure of A[u]. In addition: the standing Banach hypotheses of Convention 1; M has (Pr); u completely continuous. The degree-zero factor gives N=0. (Source: Buzzard, Theorem 3.3 and proof, pp. 24-25.)

*Needs:* §4.5 (Riesz projectors at a Fredholm root); §4.5 (Polynomial Fredholm invertibility criterion); §4.4 `entireResultant`.

### 4.6 Finite coordinates, adjugate bounds and entireness of the resolvent

Hypotheses shared by several targets of this subsection, cited by letter below: (a) K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. (b) I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars. (c) V is any sequence of native continuous A-linear endomorphisms with V₀=I and V_(n+1)=c_(n+1)(u)I+uV_n, where c_n(u) are the actual Fredholm coefficients. These are algebraic recurrence hypotheses; no analytic estimate or entireness is assumed.

Source for this subsection unless a target says otherwise: Serre, §6, Proposition10 and Lemma3(a)–(c), printed p. 78–79 ; full fresh reading and printed p. 79 page image checked on27 September2026.

Library inputs of this subsection, used by several of its targets: Mathlib `BoundedContinuousFunction.norm_le`, `BoundedContinuousFunction.norm_coe_le_norm`, `ZeroAtInftyContinuousMap.norm_toBCF_eq_norm`, `ContinuousLinearMap.opNorm_le_bound`, `Polynomial.coeff_mul`, `tendsto_pow_atTop_nhds_zero_of_lt_one`.

**Finite coordinate truncation** (construction). For a finite T⊆I, the existing helper π_T is the native continuous A-linear endomorphism of c_A(I) that retains coordinates in T and sets every other coordinate to zero. Its value is the finite sum Σ_{j∈T}x_j e_j; the carrier remains the native C0 space. Under (a) and (b). Its API consists of `coordinateProjection_apply` (At coordinate j, π_T(x)_j is x_j if j∈T and zero otherwise; promoted to finite-coordinate-projection-evaluation), `coordinateProjection_norm_le` (For every x, ‖π_T x‖≤‖x‖; the existing signature is promoted to finite-coordinate-projection-bound), `coordinateProjection_empty` (π_∅=0 as a native continuous A-linear map), `coordinateProjection_inter` (π_T composed with π_S is π_(T∩S); hence each finite projection is idempotent) and `coordinateProjection_single` (π_T(a e_j)=a e_j if j∈T, and zero if j∉T). (Source: Buzzard, §2, pp.7–12 for coordinates; §3, full manuscript p.22.)

*Needs:* Mathlib `ZeroAtInftyContinuousMap`, `ZeroAtInftyContinuousMap.ext`, `ZeroAtInftyContinuousMap.toBCF`.

**Checks.**

- `projection_empty_support`: For every x, π_∅x=0.
- `projection_selected_coordinate`: π_{j}(a e_j)=a e_j.
- `projection_rejected_coordinate` (non-example): If i≠j, π_{i}(a e_j)=0.

**Evaluation of a finite coordinate projection** (lemma). For T finite, x∈c_A(I) and j∈I, (π_T x)_j=x_j when j∈T, and (π_T x)_j=0 otherwise. Under (a) and (b).

*Needs:* §4.6 `coordinateProjection`.

**Contractivity of coordinate truncation** (lemma). For every finite T⊆I and every x∈c_A(I), ‖π_T x‖≤‖x‖. Under (a) and (b).

*Needs:* §4.6 `coordinateProjection_apply`.

**Operator bound from the coordinate vectors** (lemma). For a continuous A-linear f:c_A(I)→c_A(I) and C≥0, ‖f‖_K≤C if and only if ‖f(e_i)‖≤C for every i∈I. Under (a) and (b).

*Needs:* §4.1 `c0Lift_apply`; §4.1 (Bounded coefficient action on c0); Mathlib `ContinuousLinearMap.le_opNorm`.

**Coefficients of the finite adjugate** (lemma). For a d×d matrix D over A, put H(T)=I−TD, c_n=coeff_n det(H), and B_n=(coeff_n adj(H)_ij)_ij. Then B₀=I and B_(n+1)=c_(n+1)I+B_nD. This order is compatible with the input-first operator convention. Under (a) and (b).

*Needs:* Mathlib `Matrix.adjugate`, `Matrix.adjugate_mul`, `Matrix.adjugate_one`.

**Checks.**

- `adjugate_rank_one`: For the one-by-one matrix (a), adj(I−TD)=I.
- `adjugate_diagonal_two`: For diag(a,b), the adjugate is diag(1−bT,1−aT).
- `adjugate_nilpotent_two`: For the nonzero two-by-two nilpotent Jordan matrix N, adj(I−TN)=I+TN.

**Distinct-column bound for adjugate coefficients** (lemma). Let D be a d×d matrix, b_j≥0 with ‖D_ij‖≤b_j, n≥0 and C≥0. Assume ∏_{j∈S}b_j≤C for every n-element subset S of its column index set. Every coefficient of degree n of every entry of adj(I−TD) then has norm at most C. Under (a) and (b).

*Needs:* Mathlib `Matrix.adjugate_fin_succ_eq_det_submatrix`, `Matrix.det_apply`, `IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg`.

**Resolvent recurrence on finite coordinates** (comparison). Let u:c_A(I)→c_A(I) be completely continuous, with output support in a finite J. Let V₀=I and V_(n+1)=c_(n+1)(u)I+uV_n, where c_n(u) are the actual Fredholm coefficients. For every finite L⊇J, the entries of V_n between coordinates i,j∈L equal the degree-n coefficients of adj(I−T D_L), where D_L=(u_ij)_(i,j∈L). Under (a) and (b).

*Needs:* §4.2 `finite_coordinate_determinant`; §4.6 `finite_adjugate_recurrence`.

**Checks.**

- `finite_output_support_is_not_enough_for_input` (non-example): For diag(a,0), coefficient one of the (1,1) entry of adj(I−TD) is −a, whereas that of the (0,0) entry is zero, using indices0,1.

**Resolvent bound for finite output support** (lemma). Suppose u has output support in finite J. Let b_j≥0 bound its output-column norms, fix n≥0 and C≥0, and assume every product of n distinct b_j is at most C. Then ‖V_n‖_K≤C. Under (a), (b) and (c).

*Needs:* §4.6 `finite_coordinate_resolvent_comparison`; §4.6 `finite_adjugate_coeff_bound`; §4.6 `c0_operator_norm_le_iff`.

**Continuity of the finite recurrence** (lemma). Let α carry any filter l. Suppose u_α→u in K-operator norm on c_A(I), and c_(α,n)→c_n in A for each n. Define sequences V_(α,n) and V_n by initial identity and V_(α,n+1)=c_(α,n+1)I+u_αV_(α,n), respectively V_(n+1)=c_(n+1)I+uV_n. For every fixed n, V_(α,n)→V_n in K-operator norm. Under (a) and (b).

*Needs:* §4.1 (Bounded coefficient action on c0); Mathlib `ContinuousLinearMap.toNormedRing`.

**Adjugate bound for the Fredholm resolvent** (theorem). Let u be completely continuous on c_A(I), and let b_j≥0 bound its output-column norms. For n≥0 and C≥0, if every product of n distinct b_j is at most C, then ‖V_n‖_K≤C. Under (a), (b) and (c).

*Needs:* §4.6 `coordinateProjection_apply`; §4.6 `coordinateProjection_norm_le`; §4.1 (Completely continuous matrix criterion); §4.2 (Lipschitz bound in each determinant degree); §4.6 `finite_output_resolvent_bound`; §4.6 `recurrence_coefficient_tendsto`; Mathlib `le_of_tendsto`.

**Entire tail estimate for resolvent coefficients** (lemma). Let b_j≥0 bound the output-column norms of completely continuous u and satisfy b_j≤L. Fix R>0, 0<q<1 and finite T with Rb_j≤q off T. Put m=|T| and B=max(1,RL). Then ‖V_n‖_K Rⁿ≤B^m q^(max(n−m,0)) for every n≥0. Under (a), (b) and (c).

*Needs:* §4.6 `resolvent_recurrence_norm_bound`.

**Compression of the coefficient recurrence** (lemma). Let i:M→c_A(I) and r:c_A(I)→M be native continuous A-linear maps with ri=I. For u:M→M put U=iur. For any scalar sequence c_n, suppose V₀=I_M, W₀=I_c0, V_(n+1)=c_(n+1)I_M+uV_n and W_(n+1)=c_(n+1)I_c0+UW_n. Then rW_n i=V_n for every n. Under (a) and (b). In addition: M is a Banach A-module with compatible K-action. The stated continuous retraction is actual data; no claim that every finite module has such a retraction is made.

*Needs:* §4.2 `hasPr_of_potentiallyON`.

**Entireness of the recurrence on a projective Banach module** (theorem). Let M have (Pr), u:M→M be completely continuous, and c_n be its actual summand Fredholm coefficients. For any V₀=I and V_(n+1)=c_(n+1)I+uV_n, and every R>0, ‖V_n‖_K Rⁿ tends to zero. Under (a) and (b). In addition: M is a complete Banach A-module with compatible bounded coefficient action as in the standing roadmap hypotheses; property (Pr) supplies actual continuous inclusion and retraction data. (Source: Serre, §6, Proposition10 and Lemma3(a)–(c), printed p. 78–79 ; full fresh reading and printed p. 79 page image checked on27 September2026; Buzzard, §2, pp.7–12 for coordinates; §3, full manuscript p.22.)

*Needs:* §4.2 `hasPr_of_potentiallyON`; §4.2 `fredholmSeriesPr_split`; §4.1 `finiteImage_isCompletelyContinuous`; §4.1 (Completely continuous matrix criterion); §4.6 `c0_operator_norm_le_iff`; §4.6 `resolvent_recurrence_tail_bound`; §4.6 `recurrence_retraction`; Mathlib `ContinuousLinearMap.opNorm_comp_le`, `Submodule.FG.map`.

### 4.7 Finite generation and projectivity of root kernels

Hypotheses shared by several targets of this subsection, cited by letter below: (a) A is a commutative normed ring; M is a normed additive commutative group with an A-module structure and jointly continuous scalar multiplication. All maps are native continuous A-linear maps. (b) Write v=1−a u, N=ker(v^h), B=a Σ_{0≤j<h}v^j, and i:N→M for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed. (c) F is an A-submodule with the native topological-complement relation between N and F. Let π:M→N be Submodule.projectionOntoL along F, and put l=πB. (d) K is a complete nontrivially normed field; A is a nonzero complete Noetherian normed K-algebra with norm one for 1. M is a complete normed K-space and an A-module with compatible scalar tower and continuous A-action. Norms of A-linear maps mean the native K-operator norms after restriction of scalars.

Source for this subsection unless a target says otherwise: Buzzard, Proposition 3.2, complete proof on manuscript pp.23–24.

Library inputs of this subsection, used by several of its targets: Mathlib `Submodule.projectionOntoL`, `Submodule.projectionOntoL_apply_left`, `ContinuousLinearMap.completeSpace_ker`.

**Finite geometric factor for the root operator** (lemma). For every continuous A-linear u, a∈A and h≥0, the single finite sum B=a Σ_{0≤j<h}(1−au)^j satisfies uB=Bu=1−(1−au)^h. Under (a) and (b). (Source: Buzzard, Proposition 3.2, complete proof on manuscript pp.23–24; derived from the cited passage, not printed there.)

*Needs:* Mathlib `geom_sum_mul_neg`, `mul_geom_sum`.

**Continuous inverse on the root kernel** (construction). Define rieszKernelOperatorEquiv(u,a,h) to be the native continuous A-linear automorphism of N whose forward map is the restriction of u and whose inverse is the restriction of B=a Σ_{j<h}(1−au)^j. Under (a) and (b). Its API consists of `rieszKernelOperatorEquiv_apply` (For x∈N the image under the equivalence, viewed in M, is u(x)), `rieszKernelOperatorEquiv_symm_apply` (For x∈N the inverse image, viewed in M, is B(x)) and `rieszKernelOperatorEquiv_subtype` (Composing the equivalence with the native inclusion i equals u composed with i, as continuous A-linear maps N→M).

*Needs:* §4.7 `riesz_geometric_factor`; Mathlib `ContinuousLinearMap.restrict`, `ContinuousLinearEquiv.equivOfInverse`, `Commute.smul_right`.

**Checks.**

- `riesz_inverse_order_zero` (degenerate): At h=0 every x∈ker(v^0) is zero, and its image under the equivalence is zero.
- `riesz_inverse_zero_parameter` (degenerate): At a=0, for every h, every x∈N is zero and its inverse image is zero.
- `riesz_inverse_identity` (compatibility): For u=identity and a=1, both the equivalence and its inverse fix every element of N, for every h.
- `riesz_inverse_jordan`: If j²=0, u=1+j, a=1 and h=2, the inverse on N acts by 1−j, including in characteristic two.

**Property (Pr) under continuous retractions** (lemma). If P has (Pr) and continuous A-linear maps i:M→P and r:P→M satisfy ri=identity, then M has (Pr). This is the existing hasPr_retract API promoted before consumption. Under (a). In addition: P is another normed A-module in the same universe as M; no finite-generation hypothesis is needed. (Source: Buzzard, Definition of (Pr), full manuscript pp.18–19, and use of Lemma2.11 on p.23.)

*Needs:* §4.2 `hasPr_of_potentiallyON`.

**Property (Pr) of the complemented root kernel** (lemma). If M has (Pr) and N=ker((1−au)^h) has a native topological complement F, then N has (Pr). Under (a), (b) and (c).

*Needs:* §4.7 `hasPr_retract`.

**Finite-image approximation of the root identity** (lemma). For any α:M→M with finite A-image, define β=lαi:N→N using l=πB. Then β has finite A-image and ‖identity_N−β‖_K≤D‖u−α‖_K, where D=‖l‖_K‖i‖_K. The map α need not preserve N. Under (d), (b) and (c).

*Needs:* §4.7 `riesz_geometric_factor`; §4.1 (Finite ambient image versus finitely generated range); Mathlib `Submodule.FG.map`, `ContinuousLinearMap.opNorm_comp_le`.

**Complete continuity of the root identity** (lemma). If u is completely continuous and N=ker((1−au)^h) has a native topological complement F, then identity_N is completely continuous in the imported ordinary complete-continuity sense. Under (d), (b) and (c).

*Needs:* §4.7 `riesz_compressed_approximation`; §4.1 (Strict norm approximation by finite-image maps).

**Finite generation of the root kernel** (theorem). If u is completely continuous and N=ker((1−au)^h) has a native topological complement F, then N is a finite A-module. Under (d), (b) and (c).

*Needs:* §4.7 `riesz_kernel_identity_completelyContinuous`; §4.1 (Complete continuity of the identity detects finite generation).

**Projectivity of the finite root kernel** (theorem). If M has (Pr), u is completely continuous and N=ker((1−au)^h) has a native topological complement F, then N is an algebraically projective A-module; together with riesz-kernel-finite it is finite projective. Under (d), (b) and (c). (Source: Buzzard, Lemma2.11, manuscript p.19, and Proposition3.2 proof, pp.23–24.)

*Needs:* §4.7 `riesz_kernel_hasPr`; §4.7 `riesz_kernel_finite`; §4.2 (Finite (Pr) modules are algebraically projective); Mathlib `Module.Projective`.

### 4.8 The finite spectral transform

Hypotheses shared by several targets of this subsection, cited by letter below: (a) A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree.

Source for this subsection unless a target says otherwise: Coleman, Appendix A3, printed p. 434–436: finite definition of D(B,P), Lemma A3.8 and Theorem A3.9; complete printed p. 432–436 freshly read27 September2026; derived from the cited passage, not printed there.

Library inputs of this subsection, used by several of its targets: Mathlib `Polynomial.coeff_reflect`, `Polynomial.resultant_zero_left_deg`, `Polynomial.resultant_map_map`, `Polynomial.map_map`, `Polynomial.Monic.natDegree_map`, `Polynomial.Monic.map`.

**Monic reversal of a normalized polynomial** (lemma). If A is nontrivial, Q_n is monic of degree exactly n, even when degree(P)<n. Under (a). In addition: The degree equality requires A nontrivial; the other spectral laws below include the zero ring by its unique-element case.

*Needs:* Mathlib `Polynomial.natDegree_reflect_le`.

**The finite polynomial spectral transform** (construction). Define D_(n,m)(B,P) as the native resultant over A[T] of Q_n(Y), with its coefficients included as constants, and K_B(T,Y)=1−T B(Y), with degree bounds n,m. Its value is a native polynomial in T. The expression is total; its spectral interpretation uses the stated degree bounds and P(0)=1. Under (a). Its API consists of `polynomialSpectralResultant_def` (The value is the native bounded resultant over A[T] of the mapped reversal and1−T B(Y), with the two displayed bounds), `polynomialSpectralResultant_eval` (Evaluation at t is the bounded resultant Res(Q_n,1−tB); promoted), `polynomialSpectralResultant_constantCoeff` (For P(0)=1 the constant coefficient is1; promoted), `polynomialSpectralResultant_zero` (For B=0 and m=0 the value is1, with any P and n), `polynomialSpectralResultant_oneInput` (For P=1 and n=0 the value is1, for any B and m), `polynomialSpectralResultant_linear` (For P=1−aY,n=1 the value is1−B(a)T; promoted), `polynomialSpectralResultant_mul` (Multiplication in P adds its two degree bounds and multiplies D; promoted), `polynomialSpectralResultant_padding` (Increasing n by one multiplies D by1−B(0)T; promoted), `polynomialSpectralResultant_map` (Fixed-bound construction commutes with every coefficient ring map; promoted) and `polynomialSpectralResultant_norm` (The value is a native finite-quotient algebra norm; promoted).

*Needs:* §4.8 `spectralReversal_monic`; Mathlib `Polynomial.reflect`, `Polynomial.resultant`, `Polynomial.natDegree_sub_le`, `Polynomial.natDegree_C_mul_le`, `Polynomial.natDegree_map_le`, `Polynomial.resultant_zero_right_deg`.

**Checks.**

- `SpectralTests.rank_zero` (degenerate): D_(0,0)(1,1)=1 over the integers.
- `SpectralTests.nonzero_constant_padding` (non-example): D_(1,0)(1,1)=1−T over the integers, although D_(0,0)(1,1)=1. Thus B(0)=0 cannot be omitted from padding stability.
- `SpectralTests.nilpotent_linear`: Over ZMod4, D_(1,2)(Y^2,1−2Y)=1, because the squared nilpotent eigenvalue is zero.
- `SpectralTests.repeated_root`: Over ZMod8, D_(2,2)(Y+Y^2,(1−2Y)^2)=1+4T+4T^2. Repeated roots and nonreduced coefficients are retained.

**Specializing the spectral parameter** (lemma). For every t∈A, D_(n,m)(B,P)(t)=Res_A(Q_n,1−tB;n,m). This formula requires no degree or constant-coefficient hypotheses. Under (a).

*Needs:* §4.8 `polynomialSpectralResultant`.

**Normalization of the finite transform** (lemma). If P(0)=1, the constant coefficient of D_(n,m)(B,P) is1 for every B,n,m, without degree hypotheses. Under (a).

*Needs:* §4.8 `polynomialSpectralResultant_eval`; Mathlib `Polynomial.resultant_one_right`, `Polynomial.coeff_zero_eq_eval_zero`.

**Independence of the auxiliary degree bound** (lemma). For any m≥degree(B), D_(n,m)(B,P)=D_(n,degree(B))(B,P). Under (a).

*Needs:* §4.8 `polynomialSpectralResultant`; §4.8 `spectralReversal_monic`; Tau Ceti `Polynomial.Monic.resultant_of_le`.

**A single polynomial eigenvalue** (lemma). For a∈A and m≥degree(B), D_(1,m)(B,1−aY)=1−B(a)T, including a=0. Under (a).

*Needs:* §4.8 `polynomialSpectralResultant`; Mathlib `Polynomial.resultant_X_sub_C_left`, `Polynomial.eval_map_apply`.

**Multiplication of finite characteristic factors** (lemma). For normalized P,Q with degree(P)≤n,degree(Q)≤k and degree(B)≤m, D_(n+k,m)(B,PQ)=D_(n,m)(B,P)D_(k,m)(B,Q). Under (a).

*Needs:* §4.8 `polynomialSpectralResultant`; §4.8 `spectralReversal_monic`; Mathlib `Polynomial.reflect_mul`, `Polynomial.resultant_mul_left`.

**The exact zero-root padding factor** (lemma). D_(n+1,m)(B,P)=D_(n,m)(B,P)(1−B(0)T). Under (a).

*Needs:* §4.8 `polynomialSpectralResultant_mul`; §4.8 `polynomialSpectralResultant_linear`.

**Stability when the operator series vanishes at zero** (lemma). If B(0)=0, then D_(n+k,m)(B,P)=D_(n,m)(B,P) for every k≥0. Hence any two valid bounds on degree(P) give the same transform. Under (a). In addition: B(0)=0 for this assertion.

*Needs:* §4.8 `polynomialSpectralResultant_padding`; §4.8 `polynomialSpectralResultant_rightBound`.

**Coefficient maps preserve the finite transform** (lemma). For every homomorphism f:A→S of commutative rings, mapping the coefficients of D_(n,m)(B,P) by f gives D_(n,m)(f(B),f(P)). No degree or constant-coefficient hypotheses are needed for this fixed-bound identity. Under (a).

*Needs:* §4.8 `polynomialSpectralResultant`; Mathlib `Polynomial.reflect_map`.

**Finite spectral transform as a native algebra norm** (comparison). D_(n,m)(B,P) is Algebra.norm over A[T] of the class of1−T B(Y) in native AdjoinRoot(Q_n mapped into A[T][Y]). Under (a).

*Needs:* §4.8 `polynomialSpectralResultant`; §4.8 `spectralReversal_monic`; §4.8 `polynomialSpectralResultant_rightBound`; Tau Ceti `AdjoinRoot.norm_mk_eq_resultant`.

**The finite root-product formula** (lemma). For a finite index set I, arbitrary elements a_i∈A and m≥degree(B), D_(|I|,m)(B,∏_i(1−a_iY))=∏_i(1−B(a_i)T). Repetitions and zero a_i are allowed. Under (a).

*Needs:* §4.8 `polynomialSpectralResultant_mul`; §4.8 `polynomialSpectralResultant_linear`; §4.8 `polynomialSpectralResultant`; Mathlib `Polynomial.natDegree_prod_le`, `Polynomial.coeff_zero_prod`.

### 4.9 Characteristic series of matrices and the finite spectral mapping theorem

Hypotheses shared by several targets of this subsection, cited by letter below: (a) A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant. (b) I has a linear order, and M is upper triangular. (c) For natural numbers N,m put C_m=ℤ[b₀,…,b_m] and U_(N,m)=C_m[xᵢⱼ: i,j∈Fin N], both native multivariate polynomial rings. Write G for native Matrix.mvPolynomialX over C_m, so Gᵢⱼ=xᵢⱼ. Coefficient variables b_i and matrix-entry variables xᵢⱼ are distinct. P_M(T)=det(1−TM) is native Matrix.charpolyRev. D_(N,m) is the existing bounded spectral resultant, with matrix rank N retained even if the actual degree of P_M drops.

Source for this subsection unless a target says otherwise: Coleman, Appendix A3, printed 435–436, finite definition of D and finite-operator step in Theorem A3.9; derived from the cited passage, not printed there.

Library inputs of this subsection, used by several of its targets: Mathlib `Polynomial.reflect_reflect`, `Polynomial.reverse`, `Matrix.reverse_charpoly`, `Matrix.charpolyRev`, `Matrix.charpoly_natDegree_eq_dim`, `Matrix.charpoly_map`, `Matrix.IsUpperTriangular`, `Matrix.blockTriangular_algebraMap`, `Polynomial.induction_on`, `Matrix.BlockTriangular.pow`, `Matrix.algebraMap_matrix_apply`, `Polynomial.ofFn_coeff_eq_zero_of_ge`, `Polynomial.ofFn_coeff_eq_val_of_lt`, `Matrix.charpoly_monic`.

**Fixed-rank reflection of the characteristic series** (lemma). Reflecting P_M at N gives χ_M, even when the actual degree of P_M is smaller than N. Under (a). (Source: Coleman, Appendix A3, printed 435–436, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete; derived from the cited passage, not printed there.)

**Degree bound for the characteristic series** (lemma). The degree of P_M is at most N. Under (a). (Source: Coleman, Appendix A3, printed 435–436, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete; derived from the cited passage, not printed there.)

*Needs:* Mathlib `Polynomial.natDegree_reflect_le`.

**Scalar extension of the characteristic series** (lemma). For every ring homomorphism f:A→S, P_(f(M)) is the coefficient image f(P_M). No injectivity or nontriviality hypothesis is required. Under (a). (Source: Coleman, Appendix A3, printed 435–436, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete; derived from the cited passage, not printed there.)

*Needs:* §4.9 `reflect_charpolyRev`; Mathlib `Polynomial.reflect_map`.

**Similarity invariance of the characteristic series** (lemma). For a native matrix unit U, P_(UMU⁻¹)=P_M. Under (a). (Source: Coleman, Appendix A3, printed 435–436, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete; derived from the cited passage, not printed there.)

*Needs:* Mathlib `Matrix.charpoly_units_conj`.

**Diagonal entries of a triangular product** (lemma). If M and L are upper triangular, then (ML)_(i,i)=M_(i,i)L_(i,i) for every i. Under (a). In addition: I has a linear order, and both matrices are upper triangular for that order. (Source: Coleman, Appendix A3, printed 435–436, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete; derived from the cited passage, not printed there.)

*Needs:* Mathlib `Matrix.mul_apply`.

**Polynomial evaluation preserves upper triangularity** (lemma). If M is upper triangular, then B(M) is upper triangular for every polynomial B over A. Under (a) and (b). (Source: Coleman, Appendix A3, printed 435–436, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete; derived from the cited passage, not printed there.)

*Needs:* Mathlib `Matrix.BlockTriangular.mul`.

**The diagonal of a polynomial in a triangular matrix** (lemma). If M is upper triangular, then the i-th diagonal entry of B(M) is B(M_(i,i)). Under (a) and (b). (Source: Coleman, Appendix A3, printed 435–436, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete; derived from the cited passage, not printed there.)

*Needs:* §4.9 `IsUpperTriangular.mul_apply_diag`.

**Characteristic factors of a triangular matrix** (lemma). If M is upper triangular, P_M(T)=∏_(i∈I)(1−M_(i,i)T). Under (a) and (b). (Source: Coleman, Appendix A3, printed 435–436, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete; derived from the cited passage, not printed there.)

*Needs:* Mathlib `Matrix.det_of_isUpperTriangular`.

**Finite spectral mapping for triangular matrices** (comparison). If M is upper triangular and degree(B)≤m, then D_(N,m)(B,P_M)=P_(B(M)). Under (a). In addition: I has a linear order, M is upper triangular, and m bounds the degree of B. (Source: Coleman, Appendix A3, printed 435–436, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete; derived from the cited passage, not printed there.)

*Needs:* §4.9 `charpolyRev_of_isUpperTriangular`; §4.9 `IsUpperTriangular.aeval`; §4.9 `IsUpperTriangular.aeval_apply_diag`; §4.8 `polynomialSpectralResultant_split`.

**Checks.**

- `CharacteristicTests.empty_matrix` (degenerate): Over the integers, the empty matrix with B=1 gives D_(0,0)(1,P_M)=1.
- `CharacteristicTests.constant_operator` (non-example): Over the integers, for the zero matrix of size two and B=1, D_(2,0)(1,P_M)=(1−T)^2. Replacing the rank bound by degree(P_M)=0 would incorrectly give one.
- `CharacteristicTests.jordan_transform`: Over ZMod8, let J have rows (2,1) and (0,2), and let B(Y)=Y+Y^2. Then D_(2,2)(B,P_J)=1+4T+4T^2.
- `CharacteristicTests.jordan_aeval`: For the same J and B over ZMod8, B(J) has rows (6,5) and (0,6). Its nonzero off-diagonal entry is retained by the native polynomial calculus.

**Similarity commutes with polynomial calculus** (lemma). For a matrix unit U and every polynomial B, B(UMU⁻¹)=UB(M)U⁻¹. Under (a). (Source: Coleman, Appendix A3, printed 435–436, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete; derived from the cited passage, not printed there.)

*Needs:* Mathlib `Algebra.algebraMap_eq_smul_one`.

**Scalar extension of matrix polynomial calculus** (lemma). For every ring homomorphism f:A→S, entrywise mapping of B(M) gives f(B)(f(M)). Under (a). (Source: Coleman, Appendix A3, printed 435–436, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete; derived from the cited passage, not printed there.)

*Needs:* Mathlib `RingHom.mapMatrix`, `Polynomial.map_aeval_eq_aeval_map`.

**Spectral mapping from a triangularizing similarity** (comparison). Suppose U is a matrix unit and UMU⁻¹ is upper triangular. For degree(B)≤m, D_(N,m)(B,P_M)=P_(B(M)). Under (a). In addition: I has a linear order; a matrix unit U is given such that UMU⁻¹ is upper triangular; degree(B)≤m. (Source: Coleman, Appendix A3, printed 435–436, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete; derived from the cited passage, not printed there.)

*Needs:* §4.9 `polynomialSpectralResultant_charpolyRev_of_isUpperTriangular`; §4.9 `charpolyRev_units_conj`; §4.9 `aeval_units_conj`.

**Faithful descent of finite spectral mapping** (comparison). Let f:A→S be injective and U a matrix unit over S such that U f(M) U⁻¹ is upper triangular. If degree(B)≤m, then D_(N,m)(B,P_M)=P_(B(M)) over A. Under (a). In addition: I has a linear order; the coefficient map f is injective; a triangularizing matrix unit U over S is supplied; degree(B)≤m. (Source: Coleman, Appendix A3, printed 435–436, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete; derived from the cited passage, not printed there.)

*Needs:* §4.9 `polynomialSpectralResultant_charpolyRev_of_conj`; §4.8 `polynomialSpectralResultant_map`; §4.9 `charpolyRev_map`; §4.9 `aeval_map`; Mathlib `Polynomial.map_injective`, `Polynomial.natDegree_map_le`.

**Universal polynomial coefficients** (construction). Define B_(N,m)(Y)=Σ_(i=0)^m b_iY^i in U_(N,m)[Y], using coefficient inclusion from C_m and native Polynomial.ofFn of length m+1. Under (c). Its API consists of `spectralUniversalPolynomial_def` (The polynomial is native ofFn of length m+1 with coefficient vector i↦b_i included into U_(N,m)), `spectralUniversalPolynomial_coeff` (Its coefficient at i≤m is the included variable b_i) and `spectralUniversalPolynomial_natDegree_le` (Its natural degree is at most m; promoted as spectral-universal-degree).

*Needs:* Mathlib `Polynomial.ofFn`.

**Checks.**

- `UniversalTests.constant`: For N=2,m=0 the universal polynomial is the constant polynomial b₀.
- `UniversalTests.high_coefficient` (degenerate): For N=2,m=1 its coefficient at2 is zero.
- `UniversalTests.empty_matrix` (compatibility): For N=0,m=1 its coefficient at1 is still b₁, included into the empty-entry polynomial ring.

**Degree bound for the universal polynomial** (lemma). The natural degree of B_(N,m) is at most m, including m=0 and N=0. Under (c).

*Needs:* §4.9 `spectralUniversalPolynomial`; Mathlib `Polynomial.ofFn_natDegree_lt`.

**Simultaneous coefficient and matrix specialization** (construction). For a commutative ring R, a matrix M on Fin N and any B∈R[Y], define the ring homomorphism σ_(m,M,B):U_(N,m)→R by b_i↦coeff_i(B), xᵢⱼ↦Mᵢⱼ and the canonical integer map. This map is defined without a degree bound on B. Under (c). In addition: R and S are arbitrary commutative rings, with no nontriviality, characteristic or reducedness hypothesis. Its API consists of `spectralSpecialization_def` (The homomorphism is the nested native eval₂Hom with integer coefficients, the first m+1 coefficients of B, and the entries of M), `spectralSpecialization_entry` (The image of xᵢⱼ is Mᵢⱼ), `spectralSpecialization_coefficient` (The image of the included b_i is coeff_i(B) for i≤m), `spectralSpecialization_comp` (Composition with f:R→S equals specialization at the entrywise mapped matrix and coefficientwise mapped polynomial; identity and successive composition follow), `spectralSpecialization_matrix` (Entrywise specialization of native G is M; promoted) and `spectralSpecialization_polynomial` (If natural degree(B)≤m, specialization of B_(N,m) is B; promoted).

*Needs:* Mathlib `MvPolynomial.eval₂Hom`, `MvPolynomial.eval₂Hom_C`, `MvPolynomial.eval₂Hom_X'`, `MvPolynomial.comp_eval₂Hom`.

**Checks.**

- `SpecializationTests.entry`: Over ZMod8, with M=[[2,1],[2,2]], m=1 and B=3+5Y, σ(x₀₁)=1.
- `SpecializationTests.coefficient`: For the same inputs, σ(b₁)=5, distinguishing polynomial coefficients from matrix entries.
- `SpecializationTests.empty` (degenerate): For the empty integer matrix, m=1 and B=Y+1, specialization of B_(0,1) is Y+1.
- `SpecializationTests.noninjective` (non-example): For the zero 1×1 matrix over ZMod8, m=0 and B=0, σ(8)=0. Specialization is not assumed injective.

**Specialization of the native generic matrix** (lemma). Entrywise application of σ_(m,M,B) sends G to M for every commutative ring R, every matrix M and every polynomial B. Under (c).

*Needs:* §4.9 `spectralSpecialization`; Mathlib `Matrix.mvPolynomialX`, `Matrix.mvPolynomialX_map_eval₂`.

**Recovery of a bounded polynomial** (lemma). If B∈R[Y] has natural degree at most m, then coefficientwise application of σ_(m,M,B) to B_(N,m) is B. Under (c).

*Needs:* §4.9 `spectralUniversalPolynomial`; §4.9 `spectralSpecialization`.

**Nonzero discriminant of the generic matrix** (lemma). The discriminant of the characteristic polynomial of G over U_(N,m) is nonzero. Under (c).

*Needs:* §4.9 `spectralSpecialization_matrix`; Mathlib `Matrix.charpoly_diagonal`, `Polynomial.separable_prod_X_sub_C_iff`; Tau Ceti `Polynomial.Monic.discr_map`, `Polynomial.Monic.discr_ne_zero_iff`.

**Generic separability in a faithful field extension** (lemma). For a field K and an injective ring homomorphism f:U_(N,m)→K, the characteristic polynomial of f(G) is separable over K. Under (c). In addition: K is a field and the displayed ring homomorphism f from the universal ring is injective.

*Needs:* §4.9 `spectralGeneric_discr_ne_zero`; Tau Ceti `Polynomial.Monic.separable_map_iff_map_discr_ne_zero`.

**Numbering distinct characteristic roots** (lemma). Let M be an N×N matrix over a field K. If its characteristic polynomial is separable and splits over K, there is an injective function r:Fin N→K whose values are roots of that polynomial. In addition: K is a field; M is a square matrix indexed by Fin N; its native characteristic polynomial is separable and splits in K.

*Needs:* Mathlib `Polynomial.card_rootSet_eq_natDegree`, `Polynomial.mem_rootSet`.

**An eigenbasis from distinct characteristic roots** (lemma). For an N×N matrix M over a field K and an injective function r:Fin N→K whose values are characteristic roots, there exists a native basis b of K^N indexed by Fin N satisfying M b_i=r_i b_i for every i. In addition: K is a field; r is injective and all its N values are characteristic roots of M.

*Needs:* Mathlib `Matrix.charpoly_mulVecLin`, `Module.End.hasEigenvalue_iff_isRoot_charpoly`, `Module.End.HasEigenvalue.exists_hasEigenvector`, `Module.End.eigenvectors_linearIndependent'`, `basisOfLinearIndependentOfCardEqFinrank'`, `Module.finrank_fintype_fun_eq_card`, `Module.End.HasEigenvector.apply_eq_smul`.

**Diagonal similarity from an eigenbasis** (lemma). Given a native basis b of K^N and scalars r_i with M b_i=r_i b_i, there is a matrix unit U such that UMU⁻¹ is the diagonal matrix with entries r_i. In addition: K is a field; b is a native basis of K^N indexed by Fin N; the displayed eigenvector equations are given. Distinctness is not required for this basis-change lemma.

*Needs:* Mathlib `Module.Basis.toMatrix_mul_toMatrix_flip`, `basis_toMatrix_mul_linearMap_toMatrix_mul_basis_toMatrix`.

**The universal finite spectral identity** (lemma). Over U_(N,m), D_(N,m)(B_(N,m),P_G)=P_(B_(N,m)(G)). Under (c).

*Needs:* §4.9 `spectralUniversalPolynomial_natDegree_le`; §4.9 `spectralGeneric_separable`; §4.9 `exists_injective_roots_charpoly`; §4.9 `exists_eigenbasis_of_injective_roots`; §4.9 `exists_units_conj_diagonal_of_eigenbasis`; §4.9 `polynomialSpectralResultant_charpolyRev_of_faithful`; Mathlib `FractionRing`, `IsFractionRing.injective`, `AlgebraicClosure`, `RingHom.injective`, `IsAlgClosed`.

**Finite spectral mapping over any coefficient ring** (lemma). For every commutative ring R, every N×N matrix M, and every B∈R[Y] with natural degree at most m, D_(N,m)(B,P_M)=P_(B(M)). In addition: R is any commutative ring; M is indexed by Fin N; B has natural degree at most m. No condition B(0)=0 is imposed at fixed finite rank.

*Needs:* §4.9 `polynomialSpectralResultant_generic`; §4.9 `spectralSpecialization_matrix`; §4.9 `spectralSpecialization_polynomial`; §4.8 `polynomialSpectralResultant_map`; §4.9 `charpolyRev_map`; §4.9 `aeval_map`.

**Reindexing a characteristic series** (lemma). For a bijection e:I→J between finite index types, P_(reindex_e M)=P_M. In addition: R is a commutative ring; I and J are finite types with decidable equality; e is a bijection.

*Needs:* Mathlib `Matrix.charpoly_reindex`.

**Reindexing polynomial matrix calculus** (lemma). Reindexing B(M) along e:I→J equals B(reindex_e M). In addition: R is a commutative ring; I and J are finite types with decidable equality; e is a bijection; B is any polynomial.

*Needs:* Mathlib `Matrix.reindexAlgEquiv`, `Polynomial.aeval_algHom_apply`.

**Finite characteristic spectral mapping** (theorem). For a finite square matrix M over any commutative ring R and B∈R[Y] of natural degree at most m, D_(|I|,m)(B,P_M)=P_(B(M)). The index set need not have an order, and B(0) may be nonzero. In addition: R is any commutative ring, including the zero ring; I is a finite type with decidable equality; natural degree(B)≤m. N is |I|, not the degree of P_M.

*Needs:* §4.9 `polynomialSpectralResultant_charpolyRev_fin`; §4.9 `charpolyRev_reindex`; §4.9 `aeval_reindex`.

**Checks.**

- `UniversalComparisonTests.dense_nilpotent`: Over ZMod8, M=[[2,1],[2,2]] and B=Y+Y² give D_(2,2)(B,P_M)=1+6T². Here B(M)=[[0,5],[2,0]], P_M=1+4T+2T² and its discriminant is zero.
- `UniversalComparisonTests.constant`: For the zero 2×2 matrix over ZMod8 and B=2, D_(2,0)(2,1)=1+4T+4T²; the rank remains2 although P_M has degree0.
- `UniversalComparisonTests.empty` (degenerate): For the empty integer matrix and B=1, D_(0,0)(1,P_M)=1.
- `UniversalComparisonTests.zero_ring` (degenerate): For any 2×2 matrix over ZMod1 and B=Y, D_(2,1)(Y,P_M)=P_M.

### 4.10 Reciprocal resultants and truncation limits

Hypotheses shared by several targets of this subsection, cited by letter below: (a) R is any commutative ring. The natural numbers m,n are explicit bounds for native Sylvester matrices and resultants; they are not silently replaced by actual degrees. A reflection is the native reflect at its specified exponent. Unless explicitly required, no degree, normalization, domain or nontriviality assumption is imposed. (b) A is a nontrivial complete normed commutative ring, with norm(1)=1 and ‖a+b‖≤max(‖a‖,‖b‖). Q is a monic native polynomial, d=Q.natDegree (including Q=1,d=0), and F is an existing entire power series: its weighted coefficients tend to zero at every positive radius. No field, splitting, reducedness or Noetherian hypothesis is used. (c) Write F_n=PowerSeries.trunc(n+1,F), so coefficients through degree n are retained. S_Q(F) is the preceding entireMonicQuotient, and R_Q(F)=trunc_d(F−Q S_Q(F)) is its existing native polynomial remainder. Write Res(Q,F) for the preceding entireResultant, defined by the native finite-algebra norm.

Source for this subsection unless a target says otherwise: Coleman, Appendix A3, printed p. 434–435: resultant norm interpretation, reciprocity(9), and the full proof of Lemma A3.8(11). Complete; derived from the cited passage, not printed there.

Library inputs of this subsection, used by several of its targets: Mathlib `Polynomial.sylvester`, `Polynomial.resultant`, `Polynomial.reverse`, `Polynomial.ofFn_coeff_eq_zero_of_ge`, `Polynomial.ofFn_coeff_eq_val_of_lt`, `PowerSeries.coeff_trunc`, `PowerSeries.natDegree_trunc_lt`; Tau Ceti `Polynomial.Monic.resultant_of_le`, `AdjoinRoot.norm_mk_eq_resultant`.

**Simultaneous reflection of the Sylvester matrix** (lemma). Reindex both axes of Sylvester(f,g;m,n) by the global reversal of Fin(m+n), followed by the canonical cast to Fin(n+m). The result is Sylvester(reflect_n(g),reflect_m(f);n,m). Under (a).

*Needs:* Mathlib `Polynomial.coeff_reflect`, `Fin.revPerm`.

**Reciprocal resultant with swapped factors** (lemma). Res(reflect_m(f),reflect_n(g);m,n)=Res(g,f;n,m). Under (a).

*Needs:* §4.10 `sylvester_reflect_swap`; Mathlib `Matrix.det_reindex_self`, `Polynomial.reflect_reflect`.

**Finite reciprocal spectral evaluation** (comparison). For monic Q of degree d and P.natDegree≤n, D_(n,d)(1−Q.reverse,P)(1)=Res(Q,P;d,P.natDegree). Under (a). In addition: Q is monic; d=Q.natDegree; P.natDegree≤n. The finite statement itself does not require P(0)=1.

*Needs:* §4.8 `polynomialSpectralResultant_eval`; §4.10 `resultant_reflect_swap`.

**Checks.**

- `ReciprocalLimitTests.unit_divisor` (degenerate): For every n and P over ℤ, D_(n,0)(0,P)(1)=1, agreeing with the empty resultant for Q=1.
- `ReciprocalLimitTests.linear_sign`: Over ℤ, D_(1,1)(3T,1−2T)(1)=−5, the value of1−2T at3.
- `ReciprocalLimitTests.padding` (compatibility): Over ZMod8, D_(5,1)(2T,1+T²)(1)=5; the supplied rank5 may exceed the actual degree2.
- `ReciprocalLimitTests.unnormalized` (nonexample): Over ℤ, D_(0,2)(0,2)(1)=4 but D_(0,0)(0,2)(1)=1. The absence of P(0)=1 prevents auxiliary-bound independence.

**A fixed-size resultant of the monic remainder** (lemma). For monic Q of degree d and every polynomial P, Res(Q,P;d,P.natDegree)=Res(Q,P modByMonic Q;d,d). Under (a). In addition: Q is monic of degree d.

*Needs:* Mathlib `Polynomial.modByMonic_add_div`, `Polynomial.degree_modByMonic_lt`.

**Checks.**

- `ReciprocalLimitTests.zero_polynomial` (degenerate): Over ℤ, Res(T,0;1,0)=0; only the degree-zero divisor has resultant1 against zero.

**Continuity of a fixed coefficient resultant** (lemma). For fixed Q and m,n, the function v↦Res(Q,Polynomial.ofFn(n+1,v);m,n) from the native finite product R^(n+1) to R is continuous. In addition: R is any topological commutative ring with continuous addition and multiplication. Q is a fixed native polynomial and m,n are fixed natural numbers. The domain has the native finite product topology.

*Needs:* Mathlib `Continuous.matrix_det`.

**Truncation limit of each monic quotient coefficient** (lemma). For every k≥0, coeff_k(S_Q(F_n)) converges to coeff_k(S_Q(F)) as n tends to infinity. Under (b) and (c).

*Needs:* §4.3 `entireMonicQuotient_coeff`; §4.3 `monic_reciprocal_tail_summable`; Mathlib `HasProd.tendsto_prod_nat`.

**Checks.**

- `ReciprocalLimitTests.quotient_one` (compatibility): For Q=1, coeff_k(S_1(F_n)) converges to coeff_k(F), for every entire F and k.

**Truncation limit of each monic remainder coefficient** (lemma). For every k≥0, coeff_k(F_n modByMonic Q) converges to coeff_k(R_Q(F)). Under (b) and (c).

*Needs:* §4.3 `entireMonicQuotient_polynomial`; §4.10 `tendsto_entireMonicQuotient_trunc_coeff`; §4.3 `entireMonicQuotient_division`; Mathlib `PowerSeries.coeff_mul`.

**Entire resultant as a limit of polynomial resultants** (theorem). Res(Q,F_n;d,F_n.natDegree) converges to the existing entire resultant Res(Q,F). Under (b) and (c).

*Needs:* §4.10 `resultant_modByMonic_fixedBound`; §4.10 `tendsto_modByMonic_trunc_coeff`; §4.10 `continuous_resultant_ofFn`; §4.3 `entireMonicQuotient_division`; §4.3 `entireMonicQuotient_entire`; §4.4 `entireAdjoinRoot`; §4.4 `entireResultant`; Mathlib `tendsto_pi_nhds`.

**Scalar spectral limit with a fixed reciprocal polynomial** (lemma). D_(n,d)(1−Q.reverse,F_n)(1) converges to Res(Q,F). Under (b) and (c).

*Needs:* §4.10 `polynomialSpectralResultant_one_sub_reverse_eval`; §4.10 `tendsto_resultant_trunc`.

**Checks.**

- `ReciprocalLimitTests.linear_limit` (compatibility): For Q=T−a, D_(n,1)(aT,F_n)(1) converges to the existing convergent evaluation F(a).

**The normalized scalar limit in Coleman A3.8** (theorem). Assume F(0)=1 and let B=1−Q.reverse and B_n=trunc(n+1,B). Then D_(n,n)(B_n,F_n)(1) converges to Res(Q,F). Under (b) and (c). In addition: F.coeff0=1. B is the fixed native polynomial1−Q.reverse; its source truncations use coefficients through degree n.

*Needs:* §4.10 `tendsto_spectral_one_sub_reverse_eval`; §4.8 `polynomialSpectralResultant_rightBound`; §4.8 `spectralReversal_monic`; Mathlib `Polynomial.natDegree_reflect_le`, `PowerSeries.trunc_coe_eq_self`.

**Checks.**

- `ReciprocalLimitTests.constant_entire` (degenerate): For F=1, the simultaneous scalar sequence converges to1 for every monic Q, including Q=1.

### 4.11 Gauss convergence of entire series

Hypotheses shared by several targets of this subsection, cited by letter below: (a) A is a normed commutative ring. Write G_R(F) for the existing native PowerSeries.gaussNorm applied to the coefficient norm and real radius R. IsEntire and gaussSize are the preceding roadmap interfaces; the comparisons below identify them with native restrictedness at every positive radius and the native Gauss norm. PowerSeries.trunc N retains precisely the coefficients of degrees less than N. Additional completeness, ultrametricity and norm-one assumptions are stated individually; no field, reducedness or Noetherian assumption is implicit. (b) The norm is ultrametric: ‖x+y‖≤max(‖x‖,‖y‖). (c) A is complete.

Source for this subsection unless a target says otherwise: Coleman, Appendix A3, complete published; entire coefficient decay on 432, division on 434, spectral truncation limit and Lemma A3.8 on 435; derived from the cited passage, not printed there.

Library inputs of this subsection, used by several of its targets: Mathlib `PowerSeries.gaussNorm_eq`, `PowerSeries.gaussNorm_nonneg`, `PowerSeries.coeff_trunc`, `csSup_le`, `PowerSeries.le_gaussNorm`, `squeeze_zero`, `tendsto_pow_atTop_nhds_zero_of_lt_one`, `le_of_tendsto`, `PowerSeries.gaussNorm_add_le_max`; Tau Ceti `TauCeti.PowerSeries.hasGaussNorm_of_isRestricted`.

**Entire series and native restrictedness** (comparison). F is entire if and only if it is native IsRestricted at every positive real radius. Under (a).

*Needs:* §4.2 `mem_entireSeries`; Mathlib `PowerSeries.isRestricted_iff'`.

**The native Gauss norm comparison** (comparison). For every real R and every power series F, the preceding gaussSize R F equals the native G_R(F). Under (a).

*Needs:* §4.2 `mem_entireSeries`.

**Checks.**

- `EntireGaussTests.native_polynomial` (compatibility): For every polynomial P and real R, the preceding gaussSize of polynomialSeries(P) equals the native power-series Gauss norm of the actual polynomial coercion.

**Two-radius truncation estimate** (lemma). If 0<R≤S and F has native HasGaussNorm at S, then G_R(F−trunc_N(F))≤G_S(F)(R/S)^N for every N≥0. Under (a).

**Checks.**

- `EntireGaussTests.tail_boundary`: For F=aT^N and R>0 the truncation at N is zero and G_R(F−trunc_N(F))=‖a‖R^N.
- `EntireGaussTests.zero_truncation` (degenerate): The truncation at zero is zero, so its tail has the same Gauss norm as F.

**Entire truncations converge at every radius** (lemma). If F is entire and R>0, then G_R(F−trunc_N(F)) tends to zero as N tends to infinity. Under (a).

*Needs:* §4.11 `isEntire_iff_forall_isRestricted`; §4.11 `gaussNorm_sub_trunc_le`.

**Entire coefficient limits under radius bounds** (lemma). Let F_i be a sequence of entire series and f a formal power series. Assume every coefficient of F_i converges to that of f, and for every S>0 there is C_S≥0 with G_S(F_i)≤C_S for all i. Then f is entire. Under (a).

*Needs:* §4.11 `isEntire_iff_forall_isRestricted`.

**Checks.**

- `EntireGaussTests.radius_loss`: For the moving monomial T^N in a norm-one ring, its Gauss norms at radii 1/2 and 2 are exactly (1/2)^N and 2^N. Small-radius decay supplies no large-radius bound.

**Bounded coefficient limits converge in Gauss norms** (theorem). Under the preceding coefficient-limit and every-radius uniform-bound hypotheses, if A is ultrametric, then G_R(F_i−f) tends to zero for each R>0. Under (a) and (b).

*Needs:* §4.11 `isEntire_of_coeff_tendsto_of_gauss_bounded`; §4.11 `gaussNorm_sub_trunc_le`; Mathlib `MvPowerSeries.gaussNorm_neg`.

**Checks.**

- `EntireGaussTests.moving_monomials` (non-example): In a norm-one ring the coefficients of T^N converge individually to zero, but G_1(T^N)=1 and its evaluation at 1 is 1 for every N.

**Radius bounds for a Gauss-Cauchy sequence** (lemma). Let F_i be entire and R>0. If for every epsilon>0 there is N with G_R(F_i−F_j)<epsilon for all i,j≥N, then G_R(F_i) has a common nonnegative upper bound. Under (a) and (b).

*Needs:* §4.11 `isEntire_iff_forall_isRestricted`.

**Unique entire limit of Gauss-Cauchy sequences** (theorem). Assume A is complete and ultrametric. A sequence F_i of entire series that is Cauchy in every native Gauss norm has a unique formal series f which is entire and satisfies G_R(F_i−f)→0 for every R>0. Under (a), (b) and (c).

*Needs:* §4.11 `gauss_bounded_of_cauchy`; §4.11 `isEntire_of_coeff_tendsto_of_gauss_bounded`; §4.11 `tendsto_gaussNorm_of_coeff_tendsto_of_gauss_bounded`; Mathlib `Metric.cauchySeq_iff`, `cauchySeq_tendsto_of_complete`, `PowerSeries.mk`, `tendsto_nhds_unique`.

**Uniform evaluation of a Gauss limit** (theorem). Assume A is complete and ultrametric. For any filter l and family F_i of entire series, any entire f and R>0, G_R(F_i−f)→0 along l implies uniform convergence of entire_eval(F_i,a) to entire_eval(f,a) on the native closed ball ‖a‖≤R. Under (a), (b) and (c).

*Needs:* §4.2 `mem_entireSeries`; §4.11 `gaussSize_eq_gaussNorm`; Mathlib `Metric.tendstoUniformlyOn_iff`.

**Checks.**

- `EntireGaussTests.uniform_truncation_evaluation` (compatibility): For entire F, its native truncations evaluate uniformly to F on every closed ball of positive radius.

**Multiplication of Gauss limits** (lemma). In an ultrametric A, if entire F_i→f and H_i→h in the native Gauss norm at a fixed R>0, then F_iH_i→fh in that same Gauss norm. Under (a) and (b).

*Needs:* §4.11 `isEntire_iff_forall_isRestricted`; Mathlib `PowerSeries.HasGaussNorm.hasMvGaussNorm`, `MvPowerSeries.gaussNorm_mul_le`.

**Checks.**

- `EntireGaussTests.nilpotent_product` (non-example): For e≠0 with e²=0 and R>0, f=eT has G_R(f²)=0 but G_R(f)²>0. A multiplicative Gauss-norm claim would fail.

**A radius bound for entire monic division** (lemma). Let Q be monic of degree d. If 1≤C≤S, 0<R≤S and ‖coeff_i(Q.reverse)‖≤C^i for every i, then every entire F satisfies G_R(S_Q(F))≤G_S(F)/S^d, where S_Q is the existing entireMonicQuotient. Under (a) and (b). In addition: A is nontrivial, complete and norm-one, as required by the preceding monic-division construction.

*Needs:* §4.11 `isEntire_iff_forall_isRestricted`; §4.3 `entireMonicQuotient_bound`.

**Checks.**

- `EntireGaussTests.quotient_identity` (degenerate): Division by the monic polynomial 1 gives S_1(F)=F for every entire F.

**Continuity of entire monic division in Gauss radii** (lemma). For fixed monic Q, if entire F_i→f in every Gauss radius, then S_Q(F_i)→S_Q(f) in every Gauss radius. Under (a) and (b). In addition: A is nontrivial, complete and norm-one.

*Needs:* §4.11 `gaussNorm_entireMonicQuotient_le`; §4.3 `entireMonicQuotient`; §4.3 `entireMonicQuotient_entire`.

### 4.12 The spectral transform with entire functional input

Hypotheses shared by several targets of this subsection, cited by letter below: (a) R is an arbitrary commutative ring. D_(n,m)(B,P) is the existing polynomialSpectralResultant with its explicit two natural bounds, and reflect_n is native bounded reflection. Additional normalization and bounds are stated explicitly. (b) A is a nontrivial complete normed commutative ring with norm(1)=1 and ultrametric norm. B is an entire native power series. P is a native polynomial with constant coefficient 1 and natDegree(P)≤n. The chosen rank n is explicit. Set Q_n=reflect_n(P), monic of degree n, and R_Q(B)=trunc_n(B−Q_n S_Q(B)), using the preceding entireMonicQuotient S_Q. No reducedness, field, Noetherianity, splitting, quotient topology or B(0)=0 hypothesis is imposed unless stated.

Source for this subsection unless a target says otherwise: Coleman, Appendix A3, published p. 435: definition of D and Lemma A3.8; full published p. 435–436 freshly read28 September2026, with preceding full432–436 reading retained; derived from the cited passage, not printed there.

Library inputs of this subsection, used by several of its targets: Mathlib `Polynomial.resultant`, `Matrix.det_apply`, `Polynomial.sylvester`, `Polynomial.ofFn_coeff_eq_zero_of_ge`, `Polynomial.ofFn_coeff_eq_val_of_lt`, `PowerSeries.coeff_trunc`.

**Reduction of the functional polynomial at fixed characteristic rank** (lemma). If P(0)=1, natDegree(P)≤n and natDegree(B)≤m, then D_(n,m)(B,P)=D_(n,n)(B modByMonic reflect_n(P),P). Under (a).

*Needs:* §4.8 `spectralReversal_monic`; §4.8 `polynomialSpectralResultant_norm`; Mathlib `Polynomial.modByMonic_add_div`, `Polynomial.degree_modByMonic_lt`.

**The finite spectral output has degree at most its rank** (lemma). For any B,P and any n,m, natDegree(D_(n,m)(B,P))≤n. Under (a).

*Needs:* §4.8 `polynomialSpectralResultant`.

**Continuity of finite spectral coefficients** (lemma). Over a topological commutative ring R, fix n,m,k and P. The kth coefficient of D_(n,m)(ofFn_(m+1)(b),P) is continuous as a function of b∈R^(m+1). In addition: R is an arbitrary commutative ring. D_(n,m)(B,P) is the existing polynomialSpectralResultant with its explicit two natural bounds, and reflect_n is native bounded reflection. Additional normalization and bounds are stated explicitly. R additionally has its given topological-ring structure; no norm or completeness is required.

*Needs:* §4.8 `polynomialSpectralResultant`; Mathlib `Polynomial.ofFn`.

**Gauss convergence of bounded-degree coefficient limits** (lemma). For any filter l, polynomials F_i and f over a normed commutative ring with all natural degrees≤d, and coefficientwise F_i→f along l, one has G_R(F_i−f)→0 for every R>0. In addition: A is a normed commutative ring. F is a polynomial-valued family on an arbitrary filter; f and every F_i have a common natural-degree bound d. G_R is the existing native power-series Gauss norm after the native polynomial inclusion.

*Needs:* Mathlib `PowerSeries.gaussNorm_eq`, `PowerSeries.gaussNorm_nonneg`, `Polynomial.coeff_coe`.

**Spectral transform with entire functional input and fixed polynomial input** (construction). Define E_n(B,P)=D_(n,n)(R_(Q_n)(B),P), a native polynomial, using the existing entire monic remainder and Q_n=reflect_n(P). Under (b). Its API consists of `entirePolynomialSpectral_def` (The value is D_(n,n) of trunc_n(B−Q_n S_(Q_n)(B)) and P), `entirePolynomialSpectral_constantCoeff` (For P(0)=1, the output constant coefficient is1) and `entirePolynomialSpectral_zero` (For normalized P of degree at most n, E_n(0,P)=1).

*Needs:* §4.3 `entireMonicQuotient`; §4.3 `entireMonicQuotient_division`; §4.8 `polynomialSpectralResultant`; §4.12 `polynomialSpectralResultant_natDegree_le`; §4.8 `polynomialSpectralResultant_constantCoeff`; §4.8 `polynomialSpectralResultant_rightBound`; Mathlib `PowerSeries.trunc`.

**Checks.**

- `FixedSpectralTests.empty_rank` (degenerate): E_0(B,1)=1 for every B.
- `FixedSpectralTests.zero_function` (degenerate): The zero functional input gives1.
- `FixedSpectralTests.constant_padding` (non-example): For B=c constant and P=1, E_2(B,1)=(1−cT)^2, retaining both padded zero roots.
- `FixedSpectralTests.linear_value` (compatibility): E_1(B,1−aT)=1−B(a)T for entire B.
- `FixedSpectralTests.nilpotent_coefficients`: If e²=0, E_2(T,1−eT²)=1−eT²; nilpotent coefficients remain visible.
- `FixedSpectralTests.unit_input_zero_constant` (compatibility): For entire B with B(0)=0, E_n(B,1)=1 at every rank.

**Agreement with the polynomial spectral construction** (comparison). For polynomial B with natDegree(B)≤m, E_n(B,P)=D_(n,m)(B,P). Under (b).

*Needs:* §4.12 `entirePolynomialSpectral`; §4.3 `entireMonicQuotient_polynomial`; §4.3 `entireMonicQuotient_division`; §4.12 `polynomialSpectralResultant_modByMonic`.

**Coefficient limits at fixed characteristic rank** (lemma). For every k, coeff_k D_(n,N)(trunc_(N+1)(B),P) tends to coeff_k E_n(B,P) as N→∞. Under (b).

*Needs:* §4.12 `polynomialSpectralResultant_modByMonic`; §4.8 `spectralReversal_monic`; §4.10 `tendsto_modByMonic_trunc_coeff`; §4.12 `entirePolynomialSpectral`; §4.12 `continuous_polynomialSpectralResultant_coeff`.

**All-radius Gauss convergence at fixed characteristic rank** (theorem). For every R>0, G_R(D_(n,N)(trunc_(N+1)(B),P)−E_n(B,P)) tends to0. Under (b).

*Needs:* §4.12 `tendsto_spectral_fixed_polynomial_coeff`; §4.12 `polynomialSpectralResultant_natDegree_le`; §4.12 `tendsto_gaussNorm_of_bounded_degree`.

**Simultaneous truncation convergence for polynomial characteristic input** (theorem). If also B(0)=0, the simultaneous D_(N,N)(trunc_(N+1)(B),trunc_(N+1)(P)) converges in every G_R to E_(natDegree(P))(B,P). In addition: A is a nontrivial complete normed commutative ring with norm(1)=1 and ultrametric norm. B is an entire native power series. P is a native polynomial with constant coefficient 1 and natDegree(P)≤n. The chosen rank n is explicit. Set Q_n=reflect_n(P), monic of degree n, and R_Q(B)=trunc_n(B−Q_n S_Q(B)), using the preceding entireMonicQuotient S_Q. No reducedness, field, Noetherianity, splitting, quotient topology or B(0)=0 hypothesis is imposed unless stated. Here n is chosen as natDegree(P), and B(0)=0.

*Needs:* §4.12 `tendsto_spectral_fixed_polynomial_gauss`; §4.8 `polynomialSpectralResultant_stable`.

**The exact zero-root padding law for entire functional input** (lemma). E_(n+1)(B,P)=E_n(B,P)(1−B(0)T). Under (b).

*Needs:* §4.12 `tendsto_spectral_fixed_polynomial_coeff`; §4.8 `polynomialSpectralResultant_padding`.

**Factor products for polynomial characteristic inputs** (theorem). If Q is also normalized with natDegree(Q)≤k, then E_(n+k)(B,PQ)=E_n(B,P)E_k(B,Q). In addition: A is a nontrivial complete normed commutative ring with norm(1)=1 and ultrametric norm. B is an entire native power series. P is a native polynomial with constant coefficient 1 and natDegree(P)≤n. The chosen rank n is explicit. Set Q_n=reflect_n(P), monic of degree n, and R_Q(B)=trunc_n(B−Q_n S_Q(B)), using the preceding entireMonicQuotient S_Q. No reducedness, field, Noetherianity, splitting, quotient topology or B(0)=0 hypothesis is imposed unless stated. Q is a normalized polynomial of natural degree at most k.

*Needs:* §4.12 `tendsto_spectral_fixed_polynomial_coeff`; §4.8 `polynomialSpectralResultant_mul`.

**Linear characteristic input evaluates the entire function** (theorem). For a∈A, E_1(B,1−aT)=1−B(a)T, with the preceding actual entire evaluation. In addition: A is a nontrivial complete normed commutative ring with norm(1)=1 and ultrametric norm. B is an entire native power series. P is a native polynomial with constant coefficient 1 and natDegree(P)≤n. The chosen rank n is explicit. Set Q_n=reflect_n(P), monic of degree n, and R_Q(B)=trunc_n(B−Q_n S_Q(B)), using the preceding entireMonicQuotient S_Q. No reducedness, field, Noetherianity, splitting, quotient topology or B(0)=0 hypothesis is imposed unless stated. Here n=1 and P=1−aT, including a=0.

*Needs:* §4.12 `tendsto_spectral_fixed_polynomial_coeff`; §4.8 `polynomialSpectralResultant_linear`; §4.11 `tendsto_gaussNorm_sub_trunc`; §4.11 `tendstoUniformlyOn_entire_eval_of_gauss`.

### 4.13 Affinoid families, coefficient actions and compactness

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

Source for this subsection unless a target says otherwise: Urban, Lemmas 3.4.6–3.4.7 and Definition 3.4.10, author pp. 43–45; derived from the cited passage, not printed there.

**Affinoid-valued analytic stages** (construction). For a complete affinoid K-algebra A with a chosen submultiplicative Banach norm, define the normalized finite-chart analytic stage A_h(X,A) by c₀(S×N^d,A), realized as restricted analytic functions in the chart coordinates. This is an orthonormalizable Banach A-module; its natural integral lattice consists of coefficient families in the norm unit ball A₀. Under (a). Its API consists of `affinoidAnalyticStage` (The native c₀ coefficient module over A), `affinoidAnalyticStage_ext` (Coefficient equality determines a section) and `affinoidAnalyticStage_integral` (The chosen lattice is exactly the norm≤1 coefficient families).

*Needs:* §0.3 `analyticStage`; §4.1 `orthonormalization_coordinates`.

**Checks.**

- `AnalyticDistributionTests.affinoidStage_scalar` (compatibility): A=K recovers the scalar coefficient stage.
- `AnalyticDistributionTests.affinoidStage_point`: The singleton coefficient index gives A.
- `AnalyticDistributionTests.affinoidStage_empty` (degenerate): An empty chart set gives zero.

**Affinoid-valued Banach-stage distributions** (definition). Define D_h(X,A)=Hom_(A,cts)(A_h(X,A),A) with its operator norm. Restriction of function stages induces maps D_(h+1)→D_h; their projective limit is the A-valued locally analytic distribution space. For the c₀ basis a stage dual is a bounded coefficient family, not a c₀ family. Under (a). Its API consists of `affinoidDistributionStage` (The continuous A-linear dual of the analytic coefficient stage), `affinoidDistributionStage_apply` (A stage distribution evaluates an analytic function in A) and `affinoidDistributionStage_ext` (Equality on every basis coefficient determines the functional).

*Needs:* §4.13 `affinoidAnalyticStage`; §0.3 (Strong duality for analytic compact-type spaces).

**Checks.**

- `AnalyticDistributionTests.distributionStage_point` (compatibility): For a point, evaluation at 1 identifies the dual with A.
- `AnalyticDistributionTests.distributionStage_zero` (degenerate): The zero functional has norm zero.
- `AnalyticDistributionTests.distributionStage_bounded_not_c0` (non-example): The functional summing all coefficients has basis values constantly 1, so lies in the dual while its basis family is not c₀ on an infinite index set.

**Integral distribution lattices** (construction). In a chosen normalized analytic stage, the integral distribution lattice is {μ∈D_h(X,A):‖μ‖≤1}; equivalently μ takes the analytic coefficient unit ball to A₀={a:‖a‖≤1}. This lattice is tied to the chosen Banach model. It is not asserted to equal all power-bounded elements of a nonreduced affinoid. Under (a). Its API consists of `familyIntegralLattice` (The stage-dual norm unit ball), `familyIntegralLattice_mem` (Membership is the norm bound ≤1) and `familyIntegralLattice_smul` (A₀ scalar multiplication preserves the lattice).

*Needs:* §4.13 `affinoidDistributionStage`.

**Checks.**

- `AnalyticDistributionTests.integralLattice_zero` (degenerate): Zero belongs to the lattice.
- `AnalyticDistributionTests.integralLattice_point`: At a point, multiplication by a lies in the lattice iff ‖a‖≤1.
- `AnalyticDistributionTests.integralLattice_boundary` (non-example): Multiplication by p^(−1) is outside the lattice for the normalized p-adic norm.

**Scalar tensors of analytic stages** (comparison). For affinoid A/K and scalar c₀ stage E, the canonical map E⊗̂_(K,π)A→A_h(X,A) is an isomorphism of Banach A-modules, under the standard completed projective nonarchimedean tensor norm. This compares existing algebraic TensorProduct plus its separated completion; it does not replace that carrier. Under (a).

*Needs:* §0.3 `analyticStage`; §4.13 `affinoidAnalyticStage`; §4.2 (Completed scalar extension of ON modules and determinants).

**The canonical distribution scalar-extension map** (construction). The bilinear map D_h(X,K)×A→D_h(X,A) sends (μ,a) to the A-linear extension of μ on the scalar analytic stage, multiplied by a. It induces a continuous map D_h(X,K)⊗̂_K A→D_h(X,A). Isomorphism for infinite-dimensional A is not asserted. Under (a). Its API consists of `distributionScalarExtension` (The continuous map from the completed scalar tensor induced by the specified bilinear coefficient extension), `distributionScalarExtension_pure` (On μ⊗a its coefficient at e_α is μ(e_α)a) and `distributionScalarExtension_finite` (For finite-dimensional A/K this is an isomorphism; for arbitrary affinoids it is only a map).

*Needs:* §4.13 (Scalar tensors of analytic stages); §4.13 `affinoidDistributionStage`.

**Checks.**

- `AnalyticDistributionTests.dualExtension_scalar` (degenerate): For A=K it is the identity.
- `AnalyticDistributionTests.dualExtension_point` (compatibility): At a point K⊗̂_K A→Hom_A(A,A) is multiplication.
- `AnalyticDistributionTests.dualExtension_derivative`: dδ_0⊗a has Amice coefficients a times those of log(1+T).

**Specialization of distribution families** (construction). For a bounded affinoid map A→B, the bilinear specialization of stage distributions is D_h(X,A)×B→D_h(X,B). On coefficients it sends μ(e_α)⊗b to image(μ(e_α))b. It is compatible with radius transitions. For a finite residue-field specialization it gives the character-fibre distribution; an isomorphism after completed tensor is a separate hypothesis. Under (a). Its API consists of `familySpecialization` (Specialize bounded distribution coefficient families along a bounded A→B map), `familySpecialization_coeff` (Basis coefficient values map by the specified algebra homomorphism) and `familySpecialization_comp` (Successive bounded coefficient maps compose on every coefficient).

*Needs:* §4.13 `affinoidDistributionStage`; §4.13 `distributionScalarExtension`.

**Checks.**

- `AnalyticDistributionTests.specialization_identity` (degenerate): Specialization along A→A is the identity.
- `AnalyticDistributionTests.specialization_atom`: A-valued aδ_x specializes to image(a)δ_x.
- `AnalyticDistributionTests.specialization_logarithm` (compatibility): For finite field specialization the unbounded Amice series specializes coefficientwise, including log(1+T).

**Universal-character coefficient action** (construction). Let a semigroup Σ act by analytic maps φ_σ on charts and analytic A-valued multipliers j_σ obtained by evaluating the imported universal character. Suppose φ_(στ)=φ_σ∘φ_τ and j_(στ)=j_τ·(j_σ∘φ_τ), with unit identities. The right function action is R_σf=j_σ(f∘φ_σ); the left distribution action is U_σμ=μ∘R_σ. The actual universal character and the automorphic semigroup are supplier inputs. Under (a). Its API consists of `coefficientAction` (Compose a bounded analytic pullback with a bounded analytic multiplier), `coefficientAction_apply` ((U_σμ)(f)=μ(j_σ(f∘φ_σ))) and `coefficientAction_comp` (U_σU_τ=U_(στ) from R_τR_σ=R_(στ)).

*Needs:* §4.13 `affinoidAnalyticStage`; §4.13 `affinoidDistributionStage`; §1.3 `distributionMultiply`; §1.3 `distributionPushforward`; PadicMeasuresIwasawaAlgebras L0a.

**Checks.**

- `AnalyticDistributionTests.coefficientAction_identity` (degenerate): Identity pullback and multiplier return μ.
- `AnalyticDistributionTests.coefficientAction_dirac`: U_σδ_x=j_σ(x)δ_(φ_σ(x)).
- `AnalyticDistributionTests.coefficientAction_specialization` (compatibility): Specializing the multiplier and coefficient values gives the specialized action.

**Cocycle law and handedness** (lemma). Under the preceding cocycle identities, R_τ∘R_σ=R_(στ) and U_σ∘U_τ=U_(στ). Thus the function action is right and the dual action is left; reversing the composition of pullbacks reverses the semigroup law. Under (a).

*Needs:* §4.13 `coefficientAction`.

**A common radius for universal weights** (lemma). On each affinoid U of imported character space, its universal character is analytic jointly in weight and in a sufficiently small subgroup p^{n(U)}Z_p^d. Consequently all its analytic multipliers use one common function stage over A=O(U). The radius depends on U, not on an individual weight. Under (a). (Source: Urban, Lemmas 3.4.6–3.4.7, author pp. 43–44; derived from the cited passage, not printed there.)

*Needs:* §4.13 `affinoidAnalyticStage`; PadicMeasuresIwasawaAlgebras L0a.

**Complete continuity from analytic contraction** (lemma). If the coordinate pullback of a semigroup element maps a finite-chart analytic stage strictly inside its analytic polydiscs and its multiplier is bounded at the destination radius, the resulting operator on functions is A-completely continuous. Its transposed action between the dual stages has finite A-image approximants with the same tail estimate. Applying Fredholm theory to a same-stage dual module additionally requires its (Pr) property, which is not implied by taking a continuous dual. Under (a).

*Needs:* §4.13 `coefficientAction`; §4.13 (A common radius for universal weights); §0.3 (Compact restriction to a smaller radius); §4.1 `finiteImage_isCompletelyContinuous`.

**Compact algebra maps with nilpotent coordinate images** (theorem). Let K be Q_p or a finite extension, B a K-Banach algebra, and f:K〈T₁,…,T_d〉→B a continuous K-algebra homomorphism. If every f(T_i) is topologically nilpotent then f is compact as a K-linear map. In particular K〈T〉→K〈T/p〉 is compact. Under (a). (Source: Pan, §2.2.1 and Example 2.2.2, arXiv p. 13; derived from the cited passage, not printed there.)

*Needs:* §0.3 (Compact restriction to a smaller radius).

**Compactness for bounded formal-series inputs** (theorem). Let A=Z_p〈T₁,…,T_d〉[[x]][1/p] with the coefficient-sup Banach norm on bounded formal x-series. A continuous Q_p-algebra homomorphism f:A→B is compact when f(T_i) and f(x) are all topologically nilpotent. This A is larger than the restricted Tate algebra in x. Under (a). (Source: Pan, §2.2.1 and Example 2.2.2, arXiv p. 13; derived from the cited passage, not printed there.)

*Needs:* §4.13 (Compact algebra maps with nilpotent coordinate images).

### 4.14 Banach complexes and finite-slope decompositions

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

Source for this subsection unless a target says otherwise: Pilloni, §§13.1.1–13.1.3, author pp. 84–85; derived from the cited passage, not printed there.

**Bounded complexes of projective Banach modules** (definition). A Banach complex over affinoid A is a native cochain complex of A-modules with degreewise compatible complete Banach norms, continuous differentials, and only finitely many nonzero degrees. In the projective Banach complex category every degree has the property (Pr); this does not mean it is a finite-projective A-module. Morphisms and homotopies have continuous degreewise components. Each chosen norm is K-homogeneous and the A-action satisfies a uniform bound ‖ax‖≤c‖a‖‖x‖ for some c≥0 on each term. Normed models are explicitly identified with the native ModuleCat terms; no replacement cochain category is introduced. Under (a). Its API consists of `IsProjectiveBanachComplex` (Degreewise Banach/(Pr), continuous differentials and finite support), `projectiveBanachComplex_zero` (The zero complex satisfies these conditions) and `projectiveBanachComplex_shift` (Degree shifts transport the norms, differentials and finite support).

*Needs:* §4.2 `hasPr_of_potentiallyON`; Mathlib `CochainComplex`, `ModuleCat`.

**Checks.**

- `AnalyticDistributionTests.banachComplex_one_degree` (compatibility): A Banach (Pr) module in degree zero is a projective Banach complex.
- `AnalyticDistributionTests.banachComplex_infinite_rank` (non-example): c_A(N) in degree zero is allowed although it is not a finite-projective algebraic A-module.
- `AnalyticDistributionTests.banachComplex_differential`: A→A with identity differential in consecutive degrees is an acyclic projective Banach complex.

**Degreewise completely continuous representatives** (definition). A continuous cochain endomorphism U of a bounded projective Banach complex is degreewise completely continuous if each U^i satisfies the single earlier A-complete-continuity predicate. The chain condition dU=Ud is required; independent operators in the degrees do not define a complex endomorphism. Under (a). Its API consists of `DegreewiseCompletelyContinuous` (Every continuous degree map has finite A-image approximants), `degreewiseCompletelyContinuous_zero` (The zero cochain endomorphism is compact in every degree) and `degreewiseCompletelyContinuous_add` (Sums of two such representatives have the same property).

*Needs:* §4.14 `IsProjectiveBanachComplex`; §4.1 `finiteImage_isCompletelyContinuous`.

**Checks.**

- `AnalyticDistributionTests.complexCompact_one_degree` (compatibility): A concentrated complex gives module-level complete continuity.
- `AnalyticDistributionTests.complexCompact_finite_free`: Every bounded endomorphism of a finite free complex is degreewise compact.
- `AnalyticDistributionTests.complexCompact_missing_degree` (non-example): Identity on c_K(N) in one nonzero degree is not degreewise compact.

**Compactness of a homotopy endomorphism** (definition). An endomorphism class in the continuous homotopy category of bounded projective Banach complexes is compact if it has a degreewise completely continuous representative. This is an existential property of the class, not a claim that every representative is compact. Under (a). Its API consists of `CompactHomotopyEndomorphism` (There exists a continuous homotopic degreewise compact representative), `compactHomotopyEndomorphism_of_rep` (A degreewise compact representative determines a compact class) and `compactHomotopyEndomorphism_homotopy` (Continuous homotopic endomorphisms have the same compactness property).

*Needs:* §4.14 `DegreewiseCompletelyContinuous`; Mathlib `Homotopy`.

**Checks.**

- `AnalyticDistributionTests.homotopyCompact_zero` (degenerate): The zero class is compact.
- `AnalyticDistributionTests.homotopyCompact_one_degree` (compatibility): A one-degree complex has no nontrivial homotopies, so this agrees with module compactness.
- `AnalyticDistributionTests.homotopyCompact_contractible`: The identity of A→A with identity differential is homotopic to zero and hence compact.

**Characteristic series of a compact complex representative** (construction). For a chosen degreewise compact representative Ũ on a bounded projective Banach complex C, put P_(C,Ũ)(T)=∏_(i:C^i≠0)det(1−TŨ^i). This is a finite nonalternating product. It is an auxiliary entire series attached to the representative and is not an invariant of the homotopy class. Under (a). Its API consists of `complexFredholmProduct` (Finite product of the chosen degree determinants), `complexFredholmProduct_coeff_zero` (Its constant coefficient is 1) and `complexFredholmProduct_enlarge` (Adding zero degrees leaves the product unchanged).

*Needs:* §4.14 `DegreewiseCompletelyContinuous`; §4.2 `fredholmSeriesPr_split`.

**Checks.**

- `AnalyticDistributionTests.complexProduct_empty` (degenerate): The empty product is 1.
- `AnalyticDistributionTests.complexProduct_single` (compatibility): One degree gives det(1−TU).
- `AnalyticDistributionTests.complexProduct_acyclic` (non-example): For A→A with differential 1 and Ũ=a in both degrees, the product is (1−aT)^2, whereas the zero complex has product 1.

**Entirety of the representative product** (lemma). The chosen representative product is entire over A and has constant coefficient 1. Finite multiplication of its degree Fredholm series is legitimate in the entire Gauss topology. Under (a). (Source: BCGP I, §6.1.1, arXiv p. 139; Theorem 6.3.16 and proof, arXiv pp. 152–153; derived from the cited passage, not printed there.)

*Needs:* §4.14 `complexFredholmProduct`; §4.11 `tendsto_gaussNorm_mul`.

**A contractible-complex test for characteristic products** (lemma). The acyclic complex A→A with differential 1 and scalar endomorphism a has raw characteristic product (1−aT)^2; its zero homotopy model has product 1. Consequently this raw product cannot define an invariant spectral support of derived cohomology. Under (a).

*Needs:* §4.14 `complexFredholmProduct`; §4.14 `CompactHomotopyEndomorphism`.

**Numerical h-slope decomposition** (definition). For a continuous operator U on a Banach A-module, an h-slope decomposition is M=M^{≤h}⊕M^{>h}, continuously split and U-stable, with M^{≤h} finite projective, annihilated by a monic polynomial with unit constant term whose roots on every geometric rank-one fibre have valuation ≤h, and every monic polynomial with unit constant term and roots of valuation ≤h on every such fibre acting invertibly on M^{>h}. In reciprocal Fredholm coordinates Q(0)=1, the corresponding roots of Q have valuation ≥−h. The complement uses ≤h, including the endpoint. The annihilator excludes zero eigenvalues; zero has valuation +∞ and belongs to the >h part for finite h. Under (a). Its API consists of `NumericalSlopeDecomposition` (The continuous split, finite-projective ≤h summand and inclusive complement invertibility conditions), `numericalSlope_projector` (The projector has image M^{≤h} and kernel M^{>h}) and `numericalSlope_module_comparison` (A slope-adapted Fredholm factorization supplies this numerical decomposition on its fibres). (Source: Urban, §2.3, Definitions 2.3.1 and 2.3.6, Lemma 2.3.2 and Corollaries 2.3.3–2.3.4, author pp. 23–25; derived from the cited passage, not printed there.)

*Needs:* §4.5 (Finite projective slope summands).

**Checks.**

- `AnalyticDistributionTests.slope_endpoint`: For U=p^h on K with integral h, M^{≤h}=K and M^{>h}=0.
- `AnalyticDistributionTests.slope_zero_operator` (degenerate): For U=0 and finite h, M^{≤h}=0 and M^{>h}=K.
- `AnalyticDistributionTests.slope_reciprocal_sign` (compatibility): For U=p on K, the eigenvalue has valuation 1 and the Fredholm root p^(−1) has valuation −1.

**Functoriality of slope projectors** (lemma). A continuous A-linear map intertwining two operators with h-slope decompositions preserves their ≤h and >h summands, and commutes with the projectors. Under (a). (Source: Urban, Lemma 2.3.2, author pp. 23–24; derived from the cited passage, not printed there.)

*Needs:* §4.14 `NumericalSlopeDecomposition`; §4.5 (Polynomial closure of Riesz projectors).

**Uniqueness of the h-slope decomposition** (lemma). An h-slope decomposition with the inclusive complement condition is unique as a continuous pair of summands. The projectors agree for any two such decompositions. Under (a). (Source: Urban, Corollary 2.3.3, author p. 24; derived from the cited passage, not printed there.)

*Needs:* §4.14 (Functoriality of slope projectors).

**The finite-slope subcomplex** (lemma). If a degreewise compact cochain representative admits a common h-slope decomposition in every degree, the ≤h summands form a bounded subcomplex, the >h summands form its complementary subcomplex, and the cochain projections are continuous. Under (a).

*Needs:* §4.14 `DegreewiseCompletelyContinuous`; §4.14 (Functoriality of slope projectors).

**A finite perfect model on a slope window** (theorem). On an affinoid where the chosen representative product has a slope-adapted coprime factorization selecting the same finite h-window in each degree, the preceding ≤h subcomplex is a bounded complex of finite-projective A-modules, hence a perfect complex. Only the selected finite window has this algebraic finiteness assertion. Under (a). (Source: BCGP I, §6.1.1, arXiv p. 139; Theorem 6.3.16 and proof, arXiv pp. 152–153; derived from the cited passage, not printed there.)

*Needs:* §4.14 (Entirety of the representative product); §4.14 (The finite-slope subcomplex); §4.5 (Finite projective slope summands).

**Cohomology and finite slopes** (comparison). For such a split cochain representative, H^j(C^{≤h}) identifies algebraically with the h-slope part of H^j(C). Cohomology is formed as ker d/im d even when im d is not closed; no Hausdorff Banach norm on arbitrary H^j(C) is assumed. Under (a). (Source: Urban, Propositions 2.3.9–2.3.10, author pp. 26–27; derived from the cited passage, not printed there.)

*Needs:* §4.14 (The finite-slope subcomplex); §4.14 (A finite perfect model on a slope window).

**Homotopy invariance on a finite slope window** (lemma). Continuous U-equivariant cochain homotopy equivalences induce homotopy equivalences between their finite h-slope complexes on common slope-adapted affinoids. Their finite-slope cohomology and coherent support agree, even though their raw representative products may differ. Under (a).

*Needs:* §4.14 (Functoriality of slope projectors); §4.14 (A finite perfect model on a slope window); §4.14 (Cohomology and finite slopes).

**Derived base change of a finite slope complex** (comparison). On compatible slope-adapted affinoids A→B, the finite perfect slope complex base changes to C^{≤h}⊗_A B and represents its derived tensor product. It agrees with the finite slope complex over B once the imported operator/factorization base-change hypotheses hold. Cohomology commutes with underived base change only under additional flatness or vanishing-Tor hypotheses. Under (a). (Source: BCGP I, §6.1.1, arXiv p. 139; Theorem 6.3.16 and proof, arXiv pp. 152–153; derived from the cited passage, not printed there.)

*Needs:* §4.14 (A finite perfect model on a slope window); §4.2 (Completed scalar extension of ON modules and determinants).

**Local constancy of exact-slope module rank** (lemma). For a compact operator on a projective Banach affinoid module and fixed finite h, the dimension of its exact-h fibre summand is locally constant near each rank-one point in the rank-one locus. Use slope-adapted finite-projective windows and neighborhoods on which the relevant eigenvalue norms remain in the selected bands. This assertion is not a cover of all higher-rank points of Spa(A). Under (a). (Source: Pilloni, Proposition 13.1.3.1 and proof, author p. 85; Coleman Proposition A5.5 and Corollary A5.5.1, printed pp. 441–442; derived from the cited passage, not printed there.)

*Needs:* §4.14 `NumericalSlopeDecomposition`; §4.5 (Finite projective slope summands).

**Local constancy of the finite-slope Euler characteristic** (theorem). For a bounded finite-projective slope complex in a rank-one weight neighborhood, the alternating sum of exact-h fibre cohomology dimensions is locally constant, equal to the alternating sum of the locally constant ranks of its exact-h terms. Individual cohomology dimensions may jump. Under (a). (Source: BCGP I, §6.1.1, arXiv p. 139; Theorem 6.3.16 and proof, arXiv pp. 152–153; derived from the cited passage, not printed there.)

*Needs:* §4.14 (A finite perfect model on a slope window); §4.14 (Local constancy of exact-slope module rank).

**Extension through a factorized operator** (lemma). Suppose r:D→C and a:C→D are continuous intertwining maps with U_C=r a and U_D=a r. If a cohomology class f in C satisfies f=P(U_C)f with P(0)=0, write P=XQ and define its extension to D by a(Q(U_C)f). Then restricting it by r gives f. This is the type-correct finite-slope extension formula. Under (a). (Source: Pilloni, Corollary 13.2.4.2 and proof, author pp. 87–88; derived from the cited passage, not printed there.)

*Needs:* §4.14 (Cohomology and finite slopes).

**Independence of the finite-slope extension polynomial** (lemma). Under the factorized-map hypotheses and finite h-slope decompositions, restriction r:D^{≤h}→C^{≤h} is an isomorphism with inverse a·U_C^(−1). Therefore the finite-slope extension does not depend on the choice of P=XQ satisfying f=P(U_C)f. Under (a). (Source: Urban, Corollary 2.3.4, author p. 24; Pilloni Corollary 13.2.4.2, author pp. 87–88; derived from the cited passage, not printed there.)

*Needs:* §4.14 (Extension through a factorized operator); §4.14 (Functoriality of slope projectors); §4.14 `NumericalSlopeDecomposition`.

### 4.15 Fréchet presentations, Stein exhaustions and the torus order

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Compact factorization on Fréchet presentations** (definition). Let V=lim_n V_n be a projective system of Banach modules with compact transition t_n:V_(n+1)→V_n. A compatible operator has compact-stage factorization when there are bounded a_n:V_n→V_(n+1) with U_n=t_n a_n and U_(n+1)=a_n t_n. This is additional data, not a consequence of Fréchet completeness. Under (a). Its API consists of `CompactStageFactorization` (Compact transitions t_n and bounded a_n with U_n=t_na_n and U_{n+1}=a_nt_n), `compactStageFactorization_zero` (Compact transitions with zero stage operators admit a_n=0) and `compactStageFactorization_compatible` (The factorization implies U_n t_n=t_n U_{n+1}). (Source: Urban, §2.3.12 and Lemma 2.3.13, author pp. 27–28; derived from the cited passage, not printed there.)

*Needs:* §4.1 `finiteImage_isCompletelyContinuous`; §4.14 `IsProjectiveBanachComplex`.

**Checks.**

- `AnalyticDistributionTests.frechetFactor_zero` (degenerate): Zero stage operators factor through any compact transition system.
- `AnalyticDistributionTests.frechetFactor_finite`: The constant system A with identity transitions and scalar U=a factors with a_n=a.
- `AnalyticDistributionTests.frechetFactor_noncompact` (non-example): The constant system c_K(N) with identity transitions fails the compact-transition condition, even if U=0.

**Finite slopes of a compact Fréchet factorization** (theorem). If the stage operators in the preceding factorization have h-slope decompositions with finite-projective ≤h summands, the transitions identify all stage ≤h summands; the induced Fréchet operator has this common finite-slope module. Its characteristic finite-window factor is independent of the chosen stage. Under (a). (Source: Urban, Lemma 2.3.13, author pp. 27–28; derived from the cited passage, not printed there.)

*Needs:* §4.15 `CompactStageFactorization`; §4.14 (Independence of the finite-slope extension polynomial); §4.14 (Uniqueness of the h-slope decomposition).

**Stein exhaustions for finite-slope operators** (comparison). Import quasi-Stein/Stein spaces, their nested affinoid exhaustions, dense restriction maps and coherent Theorem B from AdicSpacesPartII R3. For a chosen coherent analytic coefficient sheaf, its section module is the Fréchet limit of affinoid section Banach modules. To use compact-stage factorization, the Stein exhaustion must give inner/compact restrictions in the actual coefficient norms; BCGP25’s relatively compact closure-proper criterion must be compared with the supplier’s Kiehl criterion. Under (a). (Source: BCGP II, Definition 2.2.17, printed p. 21; §§4.6.46–4.6.49, printed pp. 93–95; derived from the cited passage, not printed there.)

*Needs:* AdicSpacesPartII R3/quasi-stein-space; AdicSpacesPartII R3/quasi-stein-dense-restriction; AdicSpacesPartII R3/quasi-stein-theorems-a-b; §4.15 `CompactStageFactorization`.

**The torus partial order on slopes** (comparison). For the imported maximal split torus T, valuation lattice Λ=T(Q_p)/T(Z_p), and positive monoid T⁺ defined by nonnegative root valuations, put λ≥λ′ if 〈v(t),λ−λ′〉≥0 for every t∈T⁺. It is a partial order once the imported positive cone spans the valuation lattice. A character has slope λ exactly when v_pχ(t)=〈v(t),λ〉. The torus and root monoids are imported from ReductiveGroupsPartII. Under (a). (Source: BCGP II, §1.8.5, printed p. 9; §§4.6.47–4.6.48, printed pp. 93–94; derived from the cited passage, not printed there.)

*Needs:* ReductiveGroupsPartII RG2.1; PadicMeasuresIwasawaAlgebras L0a.

**Classical finite windows and solid localization** (comparison). For a compact single operator on a Banach space, the finite λ-slope windows give the classical finite-dimensional Riesz summands and their coherent character-space sheaf. BCGP25’s analytic solid finite-slope localization is f_*f^*, computed over affinoid exhaustions; its λ-bounded reconstruction is an inverse limit in the solid category. This layer supplies only the compact-operator finite-window comparison. The full solid localization and topological/solid tensor comparison are requested from the shared quasi-abelian functional-analysis Part II. Under (a). (Source: BCGP II, §4.6.46 and Remark 4.6.49, printed pp. 93–95; derived from the cited passage, not printed there.)

*Needs:* §4.14 (A finite perfect model on a slope window); §4.15 (Stein exhaustions for finite-slope operators); §4.15 (The torus partial order on slopes).

### Examples

The identity on c₀(ℕ, A) is not completely continuous, while the identity on A is; a rank-one operator has Fredholm determinant 1 − T·tr; the determinant of a diagonal operator with entries a_i tending to zero is the product ∏(1 − a_i T); over A = K × K and over the dual numbers the finite spectral transform retains the chosen rank; the characteristic series of a nilpotent 2 × 2 matrix is 1 although the operator is not the identity; a contractible complex has trivial finite-slope cohomology for every slope bound; a one-dimensional eigenvalue of valuation h belongs to the ≤ h summand.

### Dependencies

Layers 0–3 for the families and complexes; Mathlib `ZeroAtInftyContinuousMap`, `PowerSeries` with `IsRestricted` and `gaussNorm`, `Polynomial` with `resultant`, `hasseDeriv`, `charpolyRev`, `AdjoinRoot`, `ModuleCat`, `CochainComplex`, `Homotopy`; Tau Ceti `AdjoinRoot.norm_mk_eq_resultant`, `Polynomial.Monic.resultant_of_le`, `TauCeti.PowerSeries` (restricted series, Gauss norm); AdicSpacesPartII R3 (complete continuity over affinoids, quasi-Stein spaces); the Tau Ceti roadmap ReductiveGroupsPartII RG2.1 (the maximal split torus and its positive cone).

## Downstream consumers

The atlas roadmaps AutomorphicPadicLFunctions (ray-class character spaces and evaluation; overconvergent cohomology), ModularSymbolsPadicLFunctions (the strict slope threshold and the operator theorems for modular symbols), PadicFamilies (slope decompositions compatible with specialisation on slope-adapted affinoids), OverconvergentAutomorphicForms (the Banach stages of Layer 0), ColemanIntegration (local primitives and the open-disc series of Layer 1), DirichletPadicLFunctions (branches, logarithms and poles from Layers 1 and 3), PadicHodgeRegulators (the Amice toolbox), PhiGammaModulesAndIwasawaCohomology (finite-slope complexes) and AutomorphicGaloisRepresentationsPartII (removal of auxiliary geometric hypotheses by finite-slope base change) consume this roadmap through the targets named in each layer. They are not prerequisites of anything here.

## Source corrections

The following readings differ from the printed sources and are used in the statements above.

- Coleman, Lemma A3.1 (p. 432): the hypothesis on H must be that H is entire, not merely a restricted series on the closed unit disc; with the printed hypothesis the conclusion that G is constant fails. §4.3 states the entire form.
- Coleman, proof of Lemma A3.4 (p. 433): the polynomial K(T) is missing its leading term; it is T^n + Σ_{i=1}^n (−1)^i c_i T^{n−i}, as the monic Q of the construction requires. §4.9 uses the corrected form.
- Loeffler, Definition 2.12 and Remark 2.13 (pp. 4–5): the simultaneous first-difference condition with the cofinite filter on ℕ^g does not describe the completed tensor of the one-variable C^{r_i} spaces. For G = ℤ_p², r = (1/2, 0) and f = 1 ⊗ 1_{pℤ_p}, the first-difference valuation at (m_1, 0) is 0 while the condition requires it to exceed m_1/2 along infinitely many tuples, although f is a locally constant tensor. §2.2 uses the completed tensor and its wavelet norm instead.
- Pilloni, §13.1.1 (p. 84) and the proof of Corollary 13.2.4.2 (p. 87); BCGP I, §6.1.1 (p. 139): in an h-slope decomposition the complementary summand must invert every monic polynomial whose roots have valuation at most h, including equality, since a one-dimensional eigenvalue of valuation exactly h must lie in the ≤ h summand; and for P = XQ with U_C = r a the extension is f ↦ a(Q(U_C) f) followed by restriction by r, the raising map not being an endomorphism of the source. §4.14 states the endpoint convention and the factorised extension accordingly.

## References

- Buzzard: K. Buzzard, *Eigenvarieties*, author manuscript (2006), §2, Propositions and Lemmas 2.1–2.13, pp. 6–21. (https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf)
- Serre: J.-P. Serre, *Endomorphismes complètement continus des espaces de Banach p-adiques*, Publ. Math. IHÉS 12 (1962), 69–85. (https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf)
- Coleman: R. F. Coleman, *p-adic Banach spaces and families of modular forms*, Invent. Math. 127 (1997), 417–479; page numbers are those of the published version, Appendix A (pp. 432–436) unless an author-manuscript locator is given. (https://math.uchicago.edu/~fcale/Files/Cole2.pdf)
- Colmez: P. Colmez, *Fonctions d'une variable p-adique*, Astérisque 330 (2010); page numbers are those of the author's PDF (47 pages). (https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf)
- RJW: J. Rodrigues Jacinto and C. Williams, *An introduction to p-adic L-functions*, arXiv:2309.15692v2. (https://arxiv.org/pdf/2309.15692v2)
- Schneider–Teitelbaum: P. Schneider and J. Teitelbaum, *p-adic Fourier theory*, Doc. Math. 6 (2001), arXiv:math/0102012v1. (https://arxiv.org/pdf/math/0102012v1)
- Colmez–Nizioł: P. Colmez and W. Nizioł, *On the cohomology of p-adic analytic spaces, II: the C_st-conjecture*, Duke Math. J. (2025), Appendix A. (https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf)
- Loeffler: D. Loeffler, *p-adic integration on ray class groups and non-ordinary p-adic L-functions*, arXiv:1304.4042v3. (https://arxiv.org/pdf/1304.4042)
- Kohlhaase: J. Kohlhaase, *The cohomology of locally analytic representations*, J. reine angew. Math. 651 (2011). (https://esaga.net/f/jan.kohlhaase/Kohlhaase_Locally_Analytic_Cohomology.pdf)
- Pilloni: V. Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weights*, author manuscript. (https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf)
- Urban: E. Urban, *Eigenvarieties for reductive groups*, Ann. of Math. 174 (2011). (https://www.math.columbia.edu/~urban/eurp/eigen.pdf)
- BCGP I: G. Boxer, F. Calegari, T. Gee and V. Pilloni, *Abelian surfaces over totally real fields are potentially modular*, arXiv:1812.09269v3. (https://arxiv.org/pdf/1812.09269)
- BCGP II: G. Boxer, F. Calegari, T. Gee and V. Pilloni, *Modularity theorems for abelian surfaces*, arXiv:2502.20645v1. (https://arxiv.org/pdf/2502.20645)
- Pan: L. Pan, *On locally analytic vectors of the completed cohomology of modular curves II*, arXiv:2209.06366v1. (https://arxiv.org/pdf/2209.06366v1)
- Ingleton: A. W. Ingleton, *The Hahn–Banach theorem for non-Archimedean valued fields*, Proc. Cambridge Philos. Soc. 48 (1952), 41–45.
- Schneider: P. Schneider, *Nonarchimedean Functional Analysis*, Springer Monographs in Mathematics (2002), Chapter I §§1–4 (locally convex spaces) and Chapter II §9 (Hahn–Banach).
- BGR: S. Bosch, U. Güntzer and R. Remmert, *Non-Archimedean Analysis*, Grundlehren 261 (1984), §§2.7, 3.7 (finite modules over Banach algebras) and 5.1–5.2 (Tate algebras).
