# Geometry of numbers, quadratic forms and homogeneous arithmetic — Layer GN.1, continued: bases, ellipsoids and polynomial lattices

This document continues Layer GN.1 (convex bodies, successive minima and Minkowski's theorems) of the roadmap *Geometry of numbers, quadratic forms and homogeneous arithmetic*. The first part of the layer, in the roadmap's main document, defines the successive minima `λ_i(L,K)` of a convex body `K` with `0` in its interior with respect to a discrete full lattice `L`, proves that they are attained by one independent family, and proves both sharp halves of Minkowski's second theorem, `(2^d/d!)·covol(L) ≤ λ_0⋯λ_{d−1}·vol(K) ≤ 2^d·covol(L)` for symmetric `K`, together with Minkowski's linear forms theorem. Everything here builds on those results and cites them by their identifiers; nothing there is restated.

What this part adds:

- **Conventions that consumers need** (§1.6): the partial products `a_k = λ_0⋯λ_{k−1}` used by the lattice-point counts of Eskin–Katznelson as quoted by Shankar–Shankar–Tang–Tayou and Maulik–Shankar–Tang; the exact translation between the real-valued, zero-based gauge minima of this roadmap and the natural-number-valued norm minima of Tau Ceti's integral lattices (IntegralLattices, milestone 2F); and the two-sided bound `covol(Λ) ≤ ∏μ_i ≤ (2^r/V_r)·covol(Λ)` for Euclidean minima.
- **Bases from minima** (§1.7): an integral basis with `b_i ∈ (λ_0+⋯+λ_i)K` (Evertse, Exercise 2.8) and Hermite's basis theorem `∏‖b_i‖ ≤ (4/3)^{n(n−1)/4} covol(L)` (Evertse, Theorem 2.11), with its corollaries for balls, ellipsoids and boxes.
- **Ellipsoids and John's theorem** (§1.8): central ellipsoids as convex bodies with their gauge, volume and quadratic description; the existence of a maximal inscribed ellipsoid; John's decomposition of the identity; John's theorem `E ⊆ K ⊆ √n·E`; and the weak form of Minkowski's second theorem it implies (Evertse, Theorem 2.14 and Corollary 2.15; Ball, Lecture 3).
- **Polynomial lattices** (§§1.9–1.10): Smith's evaluation polytopes, their Vandermonde volume and the product bound `D/(m+1)! ≤ λ_0⋯λ_m ≤ D` (Smith, Proposition 3.4), and the cofactors `Q/(z − α_i)` of a squarefree integer polynomial with their integrality, Galois and realification properties.
- **Smith's coefficient adjustment** (§4.4a, a Layer 4 target): every real polynomial of degree below `n = deg Q` is an integer polynomial plus `Σβ_iQ/(z − α_i)` with `Σ|β_i| ≤ 9n log(2n)` (Smith, Theorem 3.2), proved from Banaszczyk's Gaussian tail inequalities in the coordinate `ℓ¹` and sup-norms (as presented by Peikert, §§3 and 5), giving the ℓ¹ covering bound `μ_1(Λ)·λ_1^∞(Λ*) ≤ 3n√(log(8n)/π)`.

## Scope and boundaries

This part owns the targets listed above. It does not own: Tau Ceti's norm-valued successive minima of integral lattices, their attainment and the Minkowski and Hermite bounds for `min L` (IntegralLattices, milestones 2B, 2E, 2F, the last implemented on Tau Ceti's main branch as `IntegralLattice.successiveMinimum`), which §1.6 compares with this roadmap's minima; lattice-point counts in terms of the partial products `a_k` (Layer 4, §4.1); the Euclidean transference theorems and the Gaussian lattice sums with Poisson summation (Layer 4, §4.4), which §4.4a consumes; LLL reduction (Layer 5), which uses the first minimum only. The general flatness theorem for arbitrary convex bodies (Banaszczyk–Litvak–Pajor–Szarek) is not a target: the one use the atlas has for it, Smith's adjustment for a cross-polytope, follows from the coordinate Gaussian tails of §4.4a.

## Conventions

**Lattices and bodies.** As in the rest of Layer 1: a lattice is a discrete full `Submodule ℤ E` (`IsZLattice ℝ`), a body is a `ConvexBody E` with `0` in its interior, central symmetry is assumed only where stated, volumes are canonical Euclidean volumes and covolumes are `ZLattice.covolume`.

**Indices.** Successive minima are indexed by `i : Fin d`, `d = dim E`, from `0`: `λ_i` is the `(i+1)`-st minimum of the classical literature. Where a source writes `μ_1 ≤ ⋯ ≤ μ_d`, `μ_j = λ_{j−1}`. The partial product `a_k` has `k` factors, `a_0 = 1`.

**Euclidean and norm-valued minima.** For the closed unit ball `B̄`, `λ_i(Λ,B̄)` is a length. Tau Ceti's integral lattices measure minima by the integral norm `β(x,x)`, a squared length, also zero-based in the implementation (one-based in the IntegralLattices README). The comparison of §1.6 squares; it never takes square roots of norms.

**Quadratic forms.** For a quadratic `ℤ`-module `(M,Q)` the bilinear form is `b(x,y) = (Q(x+y) − Q(x) − Q(y))/2`, so `Q(x) = b(x,x)`; the polar form `B = 2b` has `det B = 2^r det b`.

**Polynomials.** A real polynomial of degree at most `m` is its coefficient vector `(a_0,…,a_m)` (constant term first) in `EuclideanSpace ℝ (Fin (m+1))`, through `Polynomial.degreeLTEquiv`; integer polynomials form the standard lattice of covolume `1`. Cofactors live in `ℂ[z]`; their realification is in `ℝ[z]`.

**Gaussians.** `ρ(x) = exp(−π‖x‖²)` and `ρ(A) = Σ_{x∈A} ρ(x)`, as in the lattice Gaussian sums of Layer 4. In §4.4a, `‖x‖_1 = Σ_i |⟨x,e_i⟩|` and `‖x‖_∞ = max_i |⟨x,e_i⟩|` for a fixed orthonormal basis `e`; the dual lattice is the inner dual `Λ* = {y : ⟨y,Λ⟩ ⊆ ℤ}`.

## Sources

- J.-H. Evertse, *Diophantine approximation*, Chapter 2, *Geometry of numbers* (lecture notes, `pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf`), §2.3, printed pp.23–31.
- K. Ball, *An elementary introduction to modern convex geometry*, in *Flavors of Geometry*, MSRI Publications 31 (1997), Lecture 3, pp.13–19.
- A. Smith, *Algebraic integers with conjugates in a prescribed distribution*, arXiv:2111.12660v2, §3, pp.12–17 (Annals of Mathematics 200 (2024)).
- C. Peikert, *Limits on the hardness of lattice problems in ℓp norms*, ECCC TR06-148 rev. 1 (2007), §§2.4, 3, 5 (Computational Complexity 17 (2008)); the tail inequalities there are Banaszczyk's (Discrete Comput. Geom. 13 (1995), Lemmas 2.9 and 2.10).
- W. Banaszczyk, A. Litvak, A. Pajor, S. Szarek, *The flatness theorem for nonsymmetric convex bodies via the local theory of Banach spaces*, Math. Oper. Res. 24 (1999), §§1–3 (author copy).
- A. N. Shankar, A. Shankar, Y. Tang, S. Tayou, *Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields*, arXiv:1909.07473v3, §7.1; D. Maulik, A. N. Shankar, Y. Tang, *Picard ranks of K3 surfaces over function fields and the Hecke orbit conjecture*, arXiv:2011.08887v1, §7.
- TauCetiRoadmap, *IntegralLattices*, README milestones 2A–2G (commit 0d144d0), and the documentation of `TauCeti.LinearAlgebra.IntegralLattice.PosDef.SuccessiveMinima` on Tau Ceti's main branch.

## How the targets fit together

§1.6 is bookkeeping on top of the base plan's minima and Minkowski's theorem and is consumed by Layer 4's counting results and by the integral-lattice roadmap. §1.7 uses the base plan's attained minima and the adapted bases of Layer 0; Hermite's basis theorem also uses the projected-lattice covolume of Layer 0. §1.8 uses §1.7 for its last result. §1.9 uses only Minkowski's second theorem and the Vandermonde determinant. §1.10 is algebra (division by `X − α`, integrality, Galois action). §4.4a combines §1.10 with the Gaussian sums of Layer 4.

## Targets

### 1.6 Conventions: partial products, integral norms and Euclidean minima

The base plan indexes successive minima from zero and takes them real-valued and gauge-based. The papers that consume them, and Tau Ceti's integral lattices, use other conventions; the three targets below fix the translations once.

<a id="successive-minimum-partial-product"></a>
#### Partial products of successive minima

`GN.1/successive-minimum-partial-product` · definition

Let E be a finite-dimensional real normed space of dimension d, L a discrete full Z-submodule of E and K a convex body in E with 0 in its interior, and write λ_i = λ_i(L,K) (i : Fin d, zero-based) for the successive minima of the inherited node successive-minimum. For every natural number k the k-th partial product is a_k(L,K) = ∏_{i : Fin d, i.val < k} λ_i. Thus a_0 = 1, a_{k+1} = a_k·λ_k for k < d, and a_k = λ_0⋯λ_{d−1} for every k ≥ d. In the one-based notation μ_1 ≤ … ≤ μ_d of Eskin–Katznelson and its users, μ_j = λ_{j−1} and a_k = μ_1⋯μ_k.

*Hypotheses.*

- E finite-dimensional real normed space, d = finrank_R E (d = 0 allowed).
- L a Z-submodule of E with the discrete topology and IsZLattice R L; K : ConvexBody E with 0 ∈ interior K.
- The index k is a natural number; no symmetry of K is assumed for the definition.

*Uses.*

- Shankar–Shankar–Tang–Tayou, Lemma 7.6 and Proposition 7.7, pp.36–38: a_i(n) ≫ a_1(n)^i and the lattice-point count Σ_i X^{i/2}/a_i are written with these partial products.
- Maulik–Shankar–Tang, Lemma 7.9 and Propositions 7.11, 7.13, pp.29–30: lower bounds a_i(n) ≫ n^{i/b} through a_i ≥ a_1^i, then uniform lattice-point counts in terms of a_i.
- GeometryOfNumbersAndQuadraticArithmetic:GN.4, lattice-point counting: uniform bounds of the form Σ_{k=0}^d X^k/a_k for #{x ∈ L : gauge_K(x) ≤ X}.
- definite-minima-discriminant (this packet): a_d is the quantity compared with the covolume.

*API.*

- `successiveMinProd` (data): a_k(L,K) = ∏_{i : Fin d, i.val < k} λ_i(L,K).
- `successiveMinProd_zero` (simp): a_0(L,K) = 1.
- `successiveMinProd_succ` (simp): For k < d, a_{k+1}(L,K) = a_k(L,K)·λ_⟨k⟩(L,K).
- `successiveMinProd_of_le` (simp): For d ≤ k, a_k(L,K) = ∏_{i : Fin d} λ_i(L,K).
- `successiveMinProd_pos` (other): 0 < a_k(L,K) for every k.
- `successiveMinProd_pow_le` (relation): For 1 ≤ k ≤ d: λ_0^k ≤ a_k ≤ λ_{k−1}^k (each factor lies between the first and the last one used).
- `successiveMinProd_mul_pow_le` (relation): For k < j ≤ d: a_k·λ_k^{j−k} ≤ a_j.
- `successiveMinProd_smul_body` (relation): For c > 0: a_k(L, c•K) = a_k(L,K)/c^{min(k,d)}.
- `successiveMinProd_linearEquiv` (compatibility): For a linear equivalence e : E ≃ F, a_k(e(L), e(K)) = a_k(L,K).
- `successiveMinProd_top_bounds` (compatibility): If E is an inner-product space with canonical volume and K is centrally symmetric: (2^d/d!)·covol(L) ≤ a_d·vol(K) ≤ 2^d·covol(L) (Minkowski's second theorem restated with a_d).

*Unit tests.*

- `successiveMinProd_box_example` (computation): For L = Z² and K = {|x_0| ≤ 1/2, |x_1| ≤ 1/3}: a_0 = 1, a_1 = 2, a_2 = 6.
- `successiveMinProd_dim_zero` (degenerate): If finrank_R E = 0 then a_k(L,K) = 1 for every k.
- `successiveMinProd_cube` (compatibility): For L = Z^d and K = [−1,1]^d, a_k = 1 for every k.
- `successiveMinProd_not_shifted` (non-example): For the box with minima (2,3), a_1 = 2 ≠ 6 = λ_0·λ_1: the k-th partial product has k factors.

*Proof sketch.*

1. Define a_k as the finite product of successiveMin L K i over the i : Fin d with i.val < k.
2. a_0 = 1 is the empty product; the successor law splits off the factor with i.val = k.
3. Positivity follows from successive-minimum-pos; the comparison inequalities from successive-minimum-monotone.
4. Scaling and linear invariance follow factorwise from successive-minimum-smul-body and successive-minimum-linear-equiv.

*Checks.*

- For L = Z² and K = {|x_0| ≤ 1/2, |x_1| ≤ 1/3}, (a_0,a_1,a_2) = (1,2,6).
- For d = 0 every a_k equals 1.
- a_k is the product of the first k minima, not the first k+1: for the box above a_1 = 2, not 6.

*Needs:* `GN.1/successive-minimum` (base plan); `GN.1/successive-minimum-pos` (base plan); `GN.1/successive-minimum-monotone` (base plan); `GN.1/successive-minimum-smul-body` (base plan); `GN.1/successive-minimum-linear-equiv` (base plan).

*Source:* Ananth N. Shankar (SSTT2022), Definition 7.4, p.36 (arXiv:1909.07473v3): Defines one-based successive minima μ_i of a positive definite quadratic lattice through independent vectors with Q(v) ≤ y², and the partial products a_i = μ_1⋯μ_i with a_0 = 1; the definition here is the convex-body version in zero-based indexing. Davesh Maulik (MST2020), Definition 7.8, p.28 (arXiv:2011.08887v1): The same partial products a_i(n), a_0(n) = 1, for the nested lattices L_n; Lemma 7.9 there uses a_i ≥ a_1^i, which is the lower comparison in the API.

<a id="integral-norm-minima-comparison"></a>
#### Euclidean minima of an integral lattice and its norm-valued minima

`GN.1/integral-norm-minima-comparison` · comparison · Lean: `successiveMin_closedBall_sq_le_iff`

Let L be a positive definite Tau Ceti integral lattice (TauCeti.IntegralLattice V over Q, with IsPosDef) whose carrier has Z-rank n, and let ι : L → E be an additive map into an n-dimensional real inner-product space with ‖ι x‖² = integralNorm_L(x) for every x ∈ L (integralNorm is the integral self-pairing β(x,x)), whose image Λ = ι(L) is a discrete full lattice. Then ι is injective, and for every zero-based index i (i : Fin n, transported to Fin (finrank_R E) along the rank equality) and every natural number c: λ_i(Λ, B̄)² ≤ c if and only if there are Z-linearly independent x_0,…,x_i ∈ L with integralNorm_L(x_j) ≤ c for all j ≤ i. Here B̄ is the closed unit ball of E. Consequently each λ_i(Λ,B̄)² is a natural number, and it equals the i-th norm-valued successive minimum of L in the sense of IntegralLattices milestone 2F (one-based there: the (i+1)-st minimum), which Tau Ceti's current main branch implements as IntegralLattice.successiveMinimum L i with a zero-based Fin index and natural-number values.

*Hypotheses.*

- L positive definite: β(x,x) > 0 for x ≠ 0 in V.
- ι additive with ‖ι x‖² = integralNorm_L(x) for x ∈ L; the image of ι is discrete and spans E (IsZLattice).
- finrank_R E = finrank_Z L; i is zero-based; c is a natural number.
- No basis and no orthonormal coordinates are chosen; the comparison is stated through the defining rank condition only.

*Proof sketch.*

1. Injectivity: ι x = 0 forces integralNorm_L(x) = 0, hence x = 0 by positive definiteness.
2. By gauge_closedBall the gauge of B̄ is the norm, so successive-minimum-le-iff at r = √c says λ_i ≤ √c iff the lattice vectors of norm at most √c span a real subspace of dimension at least i+1.
3. Vectors of the discrete full lattice Λ are real-linearly independent iff they are Z-linearly independent (a Z-basis of Λ is a real basis, Module.Basis.ofZLatticeBasis), and ι transports Z-independence because it is injective.
4. ‖ι x‖ ≤ √c iff integralNorm_L(x) ≤ c; combine the three equivalences.
5. Integrality of λ_i²: successive-minimum-witnesses gives a lattice vector ι(x) with ‖ι x‖ = λ_i, so λ_i² = integralNorm_L(x) ∈ N; equality with the 2F minimum follows because both are the least c satisfying the same condition.

*Checks.*

- Z² with the standard form, ι the identity into R²: λ_0² = λ_1² = 1, the norm-valued minima (1,1).
- The hexagonal lattice A_2 scaled to norm 2 (Gram matrix [[2,−1],[−1,2]]): both norm-valued minima equal 2 and both Euclidean minima equal √2.
- The scaled lattice √2·Z in R with integralNorm(x) = 2x² has Euclidean minimum √2 and norm-valued minimum 2: the comparison squares, it does not take square roots of the index.

*Needs:* `GN.1/successive-minimum-le-iff` (base plan); `GN.1/successive-minimum-witnesses` (base plan); Mathlib `gauge_closedBall`; Mathlib `Module.Basis.ofZLatticeBasis`; Mathlib `LinearIndependent.restrict_scalars`; Tau Ceti `TauCeti.IntegralLattice`; Tau Ceti `TauCeti.IntegralLattice.integralNorm`; Tau Ceti `TauCeti.IntegralLattice.IsPosDef`.

*Source:* Jan-Hendrik Evertse (EvertseGeometry), §2.3, Example 1 after Theorem 2.9, p.25: For the Euclidean ball the successive minima are the lengths of successively shortest independent lattice vectors; this is the real-valued side of the comparison. Tau Ceti contributors (TauCetiRoadmapIntegralLattices), IntegralLattices README, milestone 2F (lines 801–811 at commit 0d144d0): Defines the norm-valued successive minima of a positive definite integral lattice, one-based, as least norms c such that the vectors of norm at most c span a subgroup of rank at least i; the comparison identifies them with squared Euclidean minima. Tau Ceti contributors (TauCetiSuccessiveMinimaDocs), Module TauCeti.LinearAlgebra.IntegralLattice.PosDef.SuccessiveMinima (current main documentation): Implements successiveMinimum L i with i : Fin (finrank Z L), natural-number values and the characterisation successiveMinimum_le_iff by Z-independent families of bounded integral norm, which is the right-hand side of the comparison.

<a id="definite-minima-discriminant"></a>
#### Product of Euclidean minima against the covolume

`GN.1/definite-minima-discriminant` · theorem · Lean: `covolume_le_prod_successiveMin_closedBall_le`

Let Λ be a discrete full lattice in a real inner-product space E of dimension r with its canonical volume, B̄ the closed unit ball and μ_i = λ_i(Λ, B̄) (i : Fin r). Then covol(Λ) ≤ ∏_i μ_i ≤ (2^r/V_r)·covol(Λ), where V_r = π^{r/2}/Γ(r/2+1) is the volume of B̄. In Gram form: for a positive definite quadratic Z-module (M,Q) of rank r with associated symmetric bilinear form b(x,y) = (Q(x+y) − Q(x) − Q(y))/2, so that Q(x) = b(x,x), and μ_i the successive minima of {Q(v) ≤ y²}, one has det(b)^{1/2} ≤ μ_1⋯μ_r ≤ (2^r/V_r)·det(b)^{1/2}; with the polar form B = 2b instead, det(B) = 2^r det(b). In the notation of the partial products a_r = μ_1⋯μ_r ≍_r Disc^{1/2}. For r = 0 all three quantities are 1.

*Hypotheses.*

- Λ is discrete and full (IsZLattice) in the finite-dimensional real inner-product space E; volume is the canonical intrinsic volume.
- In the Gram form, b is positive definite and det(b) is the determinant of its Gram matrix in any Z-basis of M; the convention Q(x) = b(x,x) is pinned and the factor 2^r for the polar form is explicit.

*Proof sketch.*

1. Lower bound: successive-minimum-witnesses gives a real basis v of lattice vectors with ‖v_i‖ = μ_i; lattice-determinant-lower-bound gives covol(Λ) ≤ |det_o(v)| for an orthonormal basis o, and orthonormal-coordinate-hadamard gives |det_o(v)| ≤ ∏‖v_i‖ = ∏μ_i.
2. Upper bound: minkowski-second-upper for the symmetric convex body B̄ gives (∏μ_i)·vol(B̄) ≤ 2^r covol(Λ), and InnerProductSpace.volume_closedBall gives vol(B̄) = V_r.
3. Gram form: realise (M,Q) as a lattice in R^r with ‖v‖² = Q(v) (Cholesky factorisation of the Gram matrix of b); covolume-square-gram gives covol² = det(b).
4. For integral lattices the upper bound is the Minkowski bound of IntegralLattices milestone 2F read through integral-norm-minima-comparison; the statement here is for arbitrary real lattices and adds the Hadamard lower bound.

*Checks.*

- Z^r: covol = 1 = ∏μ_i ≤ 2^r/V_r.
- A_2 with minimal vectors of length 1: covol = √3/2 ≤ 1 ≤ (4/π)(√3/2) ≈ 1.1027.
- r = 1: Λ = aZ gives μ_0 = a = covol, so both bounds are equalities (V_1 = 2).
- The lower bound is an equality for every orthogonal lattice ⊕ a_i Z, showing the constant 1 cannot be raised.

*Needs:* `GN.1/successive-minimum-witnesses` (base plan); `GN.1/lattice-determinant-lower-bound` (base plan); `GN.0/orthonormal-coordinate-hadamard` (base plan); `GN.1/minkowski-second-upper` (base plan); Mathlib `InnerProductSpace.volume_closedBall`; `GN.0/covolume-square-gram` (base plan).

*Source:* Ananth N. Shankar (SSTT2022), Corollary 7.5 and its proof, p.36 (arXiv:1909.07473v3): Uses that the product a_r of the successive minima of a positive definite lattice is bounded below by a constant multiple of Disc^{1/2}, quoting Eskin–Katznelson (5),(6); the lower bound here makes the constant 1. Jan-Hendrik Evertse (EvertseGeometry), §2.3, Example 1 after Theorem 2.9, p.25; Exercise 2.11 (Hadamard), p.31: Example 1 derives ∏‖v_i‖ ≤ 2^n V(n)^{-1} d(L) for vectors attaining the Euclidean minima from Minkowski's second theorem; Exercise 2.11 is Hadamard's inequality d(L) ≤ ∏‖v_i‖ for a basis, which with the index argument of the lower-bound proof gives the left inequality.

### 1.7 Bases from successive minima and Hermite's theorem

Vectors attaining the successive minima need not form a basis. The two results below produce bases whose vectors are controlled by the minima, the first for any symmetric body, the second, with Hermite's constant, for the Euclidean ball.

<a id="basis-from-minima"></a>
#### An integral basis bounded by sums of successive minima

`GN.1/basis-from-minima` · theorem · Lean: `exists_basis_gauge_le_sum_successiveMin` · planet: *Basis from successive minima*

Let E be a finite-dimensional real normed space of dimension d, L a discrete full Z-lattice in E, and K a centrally symmetric convex body with 0 in its interior, with successive minima λ_0 ≤ … ≤ λ_{d−1} (zero-based). Then L has a Z-basis b_0,…,b_{d−1} with gauge_K(b_i) ≤ λ_0 + λ_1 + ⋯ + λ_i for every i, that is b_i ∈ (λ_0+⋯+λ_i)·K; in particular gauge_K(b_i) ≤ (i+1)·λ_i. The basis can be chosen so that span_R(b_0,…,b_i) = span_R(v_0,…,v_i) for a family v attaining the minima.

*Hypotheses.*

- K : ConvexBody E, 0 ∈ interior K, and x ∈ K ⇒ −x ∈ K (symmetry is used for gauge(−x) = gauge(x)).
- L discrete and full; d = 0 is allowed (empty basis).

*Proof sketch.*

1. Take witnesses v_0,…,v_{d−1} ∈ L with gauge_K(v_i) = λ_i (successive-minimum-witnesses).
2. Take a Z-basis b of L with the same real flags as v (integral-rational-flag): span_R(b_0..b_i) = span_R(v_0..v_i) for every i.
3. Write b_i = Σ_{j≤i} t_j v_j with real t_j. Since v_i ∈ L ∩ span(v_0..v_i) = span_Z(b_0..b_i) has a nonzero integer coefficient m on b_i, t_i = 1/m and |t_i| ≤ 1.
4. For j < i, v_j ∈ span_Z(b_0..b_{i−1}); replacing b_i by b_i − Σ_{j<i} k_j v_j with k_j the nearest integer to t_j keeps a Z-basis with the same flags and makes |t_j| ≤ 1/2.
5. By gauge_add_le, gauge_smul and gauge_neg, gauge_K(b_i) ≤ Σ_{j<i} |t_j|λ_j + |t_i|λ_i ≤ λ_0+⋯+λ_i; monotonicity of the minima gives (i+1)λ_i.

*Checks.*

- Z^d with the cube [−1,1]^d: the standard basis has all gauges 1 ≤ i+1.
- Z² with the unit square: the vectors (1,1),(1,−1) attain both minima but do not form a basis; the theorem returns a basis such as (1,0),(0,1) with gauges 1 ≤ 1, 1 ≤ 2.
- In dimension 5, the lattice Z^5 + Z(1/2,…,1/2) with the Euclidean ball has all minima 1 attained by e_1,…,e_5, which span a sublattice of index 2; a basis must contain a vector of norm at least √5/2 > 1, and the bound i+1 accommodates it.

*Needs:* `GN.1/successive-minimum-witnesses` (base plan); `GN.0/integral-rational-flag` (base plan); `GN.1/successive-minimum-monotone` (base plan); Mathlib `gauge_add_le`; Mathlib `gauge_smul`; Mathlib `gauge_neg`.

*Source:* Jan-Hendrik Evertse (EvertseGeometry), §2.3, Exercise 2.8 and the remark before it, p.24: States that the lattice has a basis whose i-th vector lies in (λ_1+⋯+λ_i)C, after remarking that vectors attaining the minima need not form a basis; the hint is Lemma 2.1 (bases adapted to a rational flag), as used in the proof steps.

<a id="hermite-basis"></a>
#### Hermite's basis theorem

`GN.1/hermite-basis` · theorem · Lean: `exists_basis_prod_norm_le_hermite` · planet: *Hermite's basis theorem*

Every discrete full lattice L in a real inner-product space E of dimension n has a Z-basis b_0,…,b_{n−1} with ‖b_0‖·‖b_1‖⋯‖b_{n−1}‖ ≤ (4/3)^{n(n−1)/4}·covol(L). (Every basis satisfies the reverse Hadamard inequality covol(L) ≤ ∏‖b_i‖.)

*Hypotheses.*

- E finite-dimensional real inner-product space with canonical volume; L discrete and full; n = 0 allowed (empty product 1 = covol).

*Proof sketch.*

1. Induction on n; n ≤ 1 is immediate.
2. Let v be a shortest nonzero vector of L (successive-minimum-first with the Euclidean ball); v is primitive, since v = m·w with w ∈ L and |m| ≥ 2 would give a shorter vector.
3. Let W = Rv and π the orthogonal projection onto W⊥. Then P = π(L) is a discrete full lattice in W⊥ (projected-adapted-basis) with covol(P) = covol(L)/‖v‖ (covolume-projection, since L ∩ W = Zv).
4. By induction P has a basis p_1,…,p_{n−1} with ∏‖p_j‖ ≤ (4/3)^{(n−1)(n−2)/4} covol(P).
5. Lift each p_j to w_j ∈ L with π(w_j) = p_j and |⟨w_j, v⟩| ≤ ‖v‖²/2, subtracting an integer multiple of v. Then ‖w_j‖² ≤ ‖p_j‖² + ‖v‖²/4 ≤ ‖p_j‖² + ‖w_j‖²/4 because w_j ≠ 0 is at least as long as v, so ‖w_j‖² ≤ (4/3)‖p_j‖².
6. v, w_1,…,w_{n−1} is a Z-basis of L (prescribed-primitive-basis with projected-adapted-basis), and ∏ ≤ ‖v‖·(4/3)^{(n−1)/2}·(4/3)^{(n−1)(n−2)/4}·covol(L)/‖v‖ = (4/3)^{n(n−1)/4} covol(L).

*Checks.*

- n = 1: the generator has length covol(L), constant 1.
- A_2 with minimal length 1 and basis (1,0),(1/2,√3/2): product 1 = (4/3)^{1/2}·(√3/2), so the bound is attained in dimension 2.
- Z^n with its standard basis: product 1 = covol.

*Needs:* `GN.1/successive-minimum-first` (base plan); `GN.1/successive-minimum-witnesses` (base plan); `GN.0/covolume-projection` (base plan); `GN.0/projected-adapted-basis` (base plan); `GN.0/prescribed-primitive-basis` (base plan); `GN.0/orthonormal-coordinate-hadamard` (base plan); Mathlib `ZLattice.covolume`.

*Source:* Jan-Hendrik Evertse (EvertseGeometry), §2.3, Theorem 2.11, p.28; proof with Lemmas 2.16–2.19, pp.29–30: States the basis product bound with constant (4/3)^{n(n−1)/4} and proves it by induction on the dimension, projecting along a shortest vector, lifting with the 4/3 length loss (Lemma 2.19) and computing d(L) = λ_1·d(L') (Lemma 2.18). Jan-Hendrik Evertse (EvertseGeometry), §2.3, Exercise 2.11, p.31: Hadamard's inequality d(L) ≤ ∏‖v_i‖ for every basis, recorded in the statement as the reverse bound.

<a id="hermite-minima-product"></a>
#### Hermite's bound for the minima of balls, ellipsoids and boxes

`GN.1/hermite-minima-product` · theorem · Lean: `prod_successiveMin_closedBall_le_hermite`

Let L be a discrete full lattice in an n-dimensional real inner-product space E. (a) For the closed unit ball B̄: ∏_i λ_i(L, B̄) ≤ (4/3)^{n(n−1)/4}·covol(L). (b) For a central ellipsoid E(T) = T(B̄) with T invertible: (∏_i λ_i(L, E(T)))·vol(E(T)) ≤ (4/3)^{n(n−1)/4}·V_n·covol(L), V_n = vol(B̄). (c) For E = R^n with the standard lattice Z^n, an invertible real matrix A and positive A_1,…,A_n, the box C = {x : |(Ax)_i| ≤ A_i for all i} satisfies ∏_i λ_i(Z^n, C) ≤ (4/3)^{n(n−1)/4}·|det A|/(A_1⋯A_n).

*Hypotheses.*

- L discrete and full; T : E ≃L[R] E; in (c) det A ≠ 0 and every A_i > 0.

*Proof sketch.*

1. (a) Order the basis of hermite-basis by length: b_(0) ≤ … ≤ b_(n−1). The first i+1 of them are independent with norm at most ‖b_(i)‖, so λ_i ≤ ‖b_(i)‖ by successive-minimum-le-iff; multiply.
2. (b) By successive-minimum-linear-equiv, λ_i(L, E(T)) = λ_i(T^{-1}L, B̄); covol(T^{-1}L) = covol(L)/|det T| and vol(E(T)) = |det T|·V_n (central-ellipsoid); apply (a).
3. (c) The linear change y_i = (Ax)_i/A_i maps C to the cube [−1,1]^n, which contains the Euclidean unit ball, and Z^n to a lattice of covolume |det A|/∏A_i; use successive-minimum-antitone-body and (a).

*Checks.*

- n = 1 in (a): λ_0 = covol(L), constant 1.
- (a) for A_2 with minimal length 1: ∏λ_i = 1 = (4/3)^{1/2}·√3/2, equality.
- Comparison of constants in (b) with the ellipsoid case of minkowski-second-upper: (4/3)^{n(n−1)/4}V_n < 2^n for 2 ≤ n ≤ 8 (n = 3: ≈ 6.45 < 8; n = 8: ≈ 227.7 < 256), equality 2 = 2 for n = 1, and the reverse from n = 9 on ((4/3)^{18}V_9 ≈ 585 > 512).

*Needs:* [Hermite's basis theorem](#hermite-basis) (`GN.1/hermite-basis`); [Central ellipsoids](#central-ellipsoid) (`GN.1/central-ellipsoid`); `GN.1/successive-minimum-le-iff` (base plan); `GN.1/successive-minimum-linear-equiv` (base plan); `GN.1/successive-minimum-antitone-body` (base plan); Mathlib `MeasureTheory.Measure.addHaar_image_continuousLinearEquiv`.

*Source:* Jan-Hendrik Evertse (EvertseGeometry), §2.3, Corollaries 2.12 and 2.13, p.28; Exercise 2.12, p.31: Corollary 2.12 bounds the product of the Euclidean minima by (4/3)^{n(n−1)/4} d(L) from Theorem 2.11; Corollary 2.13 transfers it to central ellipsoids by a linear change of variables; Exercise 2.12 is the version for a box cut out by n linear forms.

### 1.8 Central ellipsoids and John's theorem

Ellipsoids are the bodies on which the Euclidean results above transfer by linear changes of variable; John's theorem compares an arbitrary symmetric body with one of them, losing a factor √n.

<a id="central-ellipsoid"></a>
#### Central ellipsoids

`GN.1/central-ellipsoid` · definition

Let E be a finite-dimensional real inner-product space of dimension n and T : E ≃L[R] E a continuous linear equivalence. The central ellipsoid of T is E(T) = T(B̄), the image of the closed unit ball, regarded as a convex body; equivalently E(T) = {x : ‖T^{-1}x‖ ≤ 1} = {x : ⟨x, Px⟩ ≤ 1} with P = (T T*)^{-1} positive definite. Every positive definite self-adjoint P arises, from T = P^{-1/2}.

*Hypotheses.*

- E finite-dimensional real inner-product space, n = finrank_R E ≥ 0; T invertible (a singular T gives a degenerate set that is not a convex body with nonempty interior).

*Uses.*

- Evertse §2.3, Corollary 2.13, p.28: minima of an ellipsoid are the Euclidean minima of a transformed lattice.
- Evertse §2.3, Theorem 2.14 and Corollary 2.15, p.28: a symmetric convex body is sandwiched between E and √n·E.
- Ball, Lecture 3, Theorem 3.1, pp.13–19: the maximal-volume ellipsoid and John's decomposition are stated for ellipsoids E(T).
- hermite-minima-product, john-ellipsoid (this packet): volume and gauge formulas.

*API.*

- `ellipsoid` (constructor): ellipsoid T : ConvexBody E with carrier T '' closedBall 0 1.
- `mem_ellipsoid_iff` (characterisation): x ∈ ellipsoid T ↔ ‖T.symm x‖ ≤ 1.
- `gauge_ellipsoid` (simp): gauge (ellipsoid T) x = ‖T.symm x‖.
- `ellipsoid_neg_mem` (structure): x ∈ ellipsoid T → −x ∈ ellipsoid T.
- `zero_mem_interior_ellipsoid` (structure): 0 ∈ interior (ellipsoid T).
- `volume_ellipsoid` (characterisation): volume (ellipsoid T) = ENNReal.ofReal |det T| · volume (closedBall 0 1).
- `ellipsoid_refl` (simp): ellipsoid (ContinuousLinearEquiv.refl R E) has carrier closedBall 0 1.
- `image_ellipsoid` (functoriality): S '' ellipsoid T = ellipsoid (T.trans S) for S : E ≃L[R] E.
- `ellipsoid_smul` (relation): For c > 0, c • ellipsoid T = ellipsoid (c • T).
- `ellipsoid_eq_iff` (extensionality): ellipsoid T = ellipsoid T' ↔ T.symm ∘ T' preserves the norm.
- `ellipsoid_eq_quadratic` (equivalence): ellipsoid T has carrier {x | ⟪x, P x⟫ ≤ 1} for P = (T ∘ T†)^{-1}, a positive definite self-adjoint operator; conversely every positive definite self-adjoint P is of this form.

*Unit tests.*

- `ellipsoid_refl_eq_ball` (compatibility): The carrier of ellipsoid (refl) is Metric.closedBall 0 1.
- `ellipsoid_diag_volume` (computation): For T = diag(2,3) on EuclideanSpace R (Fin 2), volume (ellipsoid T) = ofReal (6π).
- `ellipsoid_diag_gauge` (computation): For T = diag(2,3), gauge (ellipsoid T) (2,0) = 1 and gauge (ellipsoid T) (0,1) = 1/3.
- `ellipsoid_dim_zero` (degenerate): If finrank E = 0, ellipsoid T has carrier {0} and volume 1.
- `square_not_ellipsoid` (non-example): The unit square [−1,1]² is not ellipsoid T for any T: its gauge (the sup-norm) violates the parallelogram law at (1,0),(0,1).

*Proof sketch.*

1. E(T) is compact and convex as the continuous linear image of B̄, and nonempty.
2. Membership: x ∈ T(B̄) iff ‖T^{-1}x‖ ≤ 1; hence gauge_{E(T)}(x) = ‖T^{-1}x‖ by gauge_closedBall composed with T^{-1}.
3. Volume: addHaar_image_continuousLinearEquiv gives vol(E(T)) = |det T|·vol(B̄), and InnerProductSpace.volume_closedBall gives vol(B̄) = π^{n/2}/Γ(n/2+1).
4. E(T) = E(T') iff T^{-1}T' maps B̄ onto itself, i.e. is a linear isometry.

*Checks.*

- E(id) = B̄.
- For T = diag(2,3) on R², vol(E(T)) = 6π and gauge_{E(T)}(2,0) = 1.
- n = 0: E(T) = {0} with volume 1.

*Needs:* Mathlib `ConvexBody`; Mathlib `ContinuousLinearEquiv`; Mathlib `gauge_closedBall`; Mathlib `MeasureTheory.Measure.addHaar_image_continuousLinearEquiv`; Mathlib `InnerProductSpace.volume_closedBall`.

*Source:* Jan-Hendrik Evertse (EvertseGeometry), §2.3, Corollary 2.13 and Theorem 2.14, p.28: Uses central ellipsoids as linear images of the Euclidean ball and the invariance of the minima under linear maps. Keith Ball (Ball1997), Lecture 3, opening paragraphs, p.13: Describes an ellipsoid through an orthonormal basis and semi-axes α_j with volume v_n∏α_j, the coordinate form of E(T) for T diagonal in that basis.

<a id="maximal-inscribed-ellipsoid"></a>
#### Existence of a maximal-volume inscribed ellipsoid

`GN.1/maximal-inscribed-ellipsoid` · lemma · Lean: `exists_isMaxOn_volume_ellipsoid_subset`

Let K be a centrally symmetric convex body with 0 in its interior in a real inner-product space E of dimension n. There is an invertible T with E(T) ⊆ K such that vol(E(T')) ≤ vol(E(T)) for every invertible T' with E(T') ⊆ K.

*Hypotheses.*

- K : ConvexBody E, 0 ∈ interior K, symmetric; n ≥ 0.

*Proof sketch.*

1. The set S = {T ∈ End(E) : T(B̄) ⊆ K} is closed (K closed) and bounded (K ⊆ R·B̄ forces ‖T‖ ≤ R), hence compact.
2. S contains εI for some ε > 0 since 0 ∈ interior K, so max_S |det| ≥ ε^n > 0.
3. |det| is continuous; IsCompact.exists_isMaxOn gives a maximiser T, invertible because |det T| > 0.
4. vol(E(T)) = |det T|·V_n (central-ellipsoid), so T maximises volume among inscribed central ellipsoids.

*Checks.*

- K = B̄: the maximiser is an isometry and E(T) = B̄.
- K = [−1,1]^n: the maximal central ellipsoid is B̄ (contact points ±e_i).

*Needs:* [Central ellipsoids](#central-ellipsoid) (`GN.1/central-ellipsoid`); Mathlib `IsCompact.exists_isMaxOn`; Mathlib `LinearMap.det`; Mathlib `ConvexBody.isCompact`.

*Source:* Keith Ball (Ball1997), Lecture 3, Theorem 3.1 (statement), p.13: Asserts that every convex body contains a unique ellipsoid of maximal volume; the existence part is the compactness argument recorded in the proof steps. Jan-Hendrik Evertse (EvertseGeometry), §2.3, Theorem 2.14, p.28: Uses the existence of a central ellipsoid E ⊆ C ⊆ √n E, which is obtained from a maximal one.

<a id="john-decomposition"></a>
#### John's decomposition of the identity

`GN.1/john-decomposition` · theorem · Lean: `exists_john_decomposition`

Let K be a centrally symmetric convex body in a real inner-product space E of dimension n ≥ 1 such that the closed unit ball B̄ is a central ellipsoid of maximal volume in K (B̄ ⊆ K and no inscribed central ellipsoid has larger volume). Then there are finitely many contact points u_1,…,u_m with ‖u_i‖ = 1 and u_i in the frontier of K, and weights c_i > 0, such that x = Σ_i c_i⟨x,u_i⟩u_i for every x ∈ E (Σ c_i u_i⊗u_i = id); taking traces, Σ_i c_i = n.

*Hypotheses.*

- K symmetric convex body; B̄ ⊆ K maximal among inscribed central ellipsoids; n ≥ 1 so that contact points exist.

*Proof sketch.*

1. The contact set U = {u : ‖u‖ = 1, u ∈ frontier K} is compact, hence so is {u⊗u : u ∈ U}; by Carathéodory (convexHull_eq_union) its convex hull is the continuous image of a compact set of simplex weights and tuples of contact points, so it is compact (IsCompact.image).
2. Suppose id/n is not in that convex hull. Separation (geometric_hahn_banach_point_closed) in the space of symmetric operators gives a symmetric H, normalised to trace 0, with ⟨Hu,u⟩ > 0 for every contact point u.
3. For small δ > 0 the ellipsoid {x : ⟨(I+δH)x, x⟩ ≤ 1} misses the contact points, stays inside K by compactness of the frontier, and a slight dilate still lies in K.
4. Its volume is V_n/∏√μ_j with μ_j the eigenvalues of I+δH; Σμ_j = n, so the AM–GM inequality (Real.geom_mean_le_arith_mean_weighted) gives ∏μ_j ≤ 1 and the dilate has volume larger than V_n, contradicting maximality.
5. Hence id/n is a convex combination of maps u⊗u, which is the decomposition with Σc_i = n.

*Checks.*

- K = [−1,1]^n: u_i = e_i, c_i = 1 (m = n), or ±e_i with weights 1/2.
- Trace check: Σc_i = n in every instance.

*Needs:* [Existence of a maximal-volume inscribed ellipsoid](#maximal-inscribed-ellipsoid) (`GN.1/maximal-inscribed-ellipsoid`); [Central ellipsoids](#central-ellipsoid) (`GN.1/central-ellipsoid`); Mathlib `geometric_hahn_banach_point_closed`; Mathlib `convexHull_eq_union`; Mathlib `IsCompact.image`; Mathlib `Real.geom_mean_le_arith_mean_weighted`.

*Source:* Keith Ball (Ball1997), Lecture 3, Theorem 3.1, pp.13–14; proof of the harder direction in the symmetric case, pp.17–19: States that B̄ is the maximal ellipsoid iff there are contact points with weights decomposing the identity (and summing to zero in the nonsymmetric case), and proves the needed direction by separation and the AM–GM inequality, as in the proof steps.

<a id="john-ellipsoid"></a>
#### John's ellipsoid theorem

`GN.1/john-ellipsoid` · theorem · Lean: `exists_ellipsoid_subset_subset_sqrt_smul` · planet: *John's ellipsoid theorem*

Let K be a centrally symmetric convex body with 0 in its interior in a real inner-product space E of dimension n. There is an invertible linear T such that E(T) ⊆ K ⊆ √n·E(T); any central ellipsoid of maximal volume in K has this property.

*Hypotheses.*

- K : ConvexBody E, symmetric, 0 ∈ interior K; n ≥ 0 (for n = 0 both sides are {0}).

*Proof sketch.*

1. Take T maximal (maximal-inscribed-ellipsoid) and replace K by K' = T^{-1}(K), whose maximal central ellipsoid is B̄.
2. For each contact point u_i of john-decomposition the tangent hyperplane {⟨x,u_i⟩ = 1} supports K': if x ∈ K' had ⟨x,u_i⟩ > 1, the convex hull of B̄ and x would contain u_i in its interior, contradicting u_i ∈ frontier K'. By symmetry |⟨x,u_i⟩| ≤ 1 on K'.
3. For x ∈ K', ‖x‖² = Σ c_i⟨x,u_i⟩² ≤ Σ c_i = n, so K' ⊆ √n·B̄, i.e. K ⊆ √n·E(T).

*Checks.*

- K = [−1,1]^n: E = B̄ and the corner (1,…,1) has norm √n, so √n is sharp.
- K the cross-polytope {Σ|x_i| ≤ 1}: E = n^{−1/2}B̄ and K ⊆ B̄ = √n·E, sharp at the vertices.
- n = 1: K = [−a,a] = E(a), factor 1 ≤ √1.

*Needs:* [Existence of a maximal-volume inscribed ellipsoid](#maximal-inscribed-ellipsoid) (`GN.1/maximal-inscribed-ellipsoid`); [John's decomposition of the identity](#john-decomposition) (`GN.1/john-decomposition`); [Central ellipsoids](#central-ellipsoid) (`GN.1/central-ellipsoid`).

*Source:* Jan-Hendrik Evertse (EvertseGeometry), §2.3, Theorem 2.14, p.28: States that every central symmetric convex body C has a central ellipsoid E with E ⊆ C ⊆ √n E, referring to Schmidt's notes for the proof. Keith Ball (Ball1997), Lecture 3, p.16: Deduces K ⊆ √n E for symmetric K from John's decomposition by the supporting-hyperplane argument used in the proof steps.

<a id="john-weak-minkowski-second"></a>
#### Minkowski's second theorem with John's constant

`GN.1/john-weak-minkowski-second` · theorem · Lean: `prod_successiveMin_mul_volume_le_john`

Let L be a discrete full lattice and K a centrally symmetric convex body with 0 in its interior in an n-dimensional real inner-product space with canonical volume. Then (∏_i λ_i(L,K))·vol(K) ≤ c(n)·covol(L) with c(n) = n^{n/2}·(4/3)^{n(n−1)/4}·V_n, V_n = π^{n/2}/Γ(n/2+1).

*Hypotheses.*

- L discrete and full; K symmetric with 0 in its interior.

*Proof sketch.*

1. Take E = E(T) ⊆ K ⊆ √n·E from john-ellipsoid.
2. E ⊆ K gives λ_i(L,K) ≤ λ_i(L,E) (successive-minimum-antitone-body).
3. hermite-minima-product (b) bounds ∏λ_i(L,E)·vol(E) by (4/3)^{n(n−1)/4} V_n covol(L).
4. vol(K) ≤ vol(√n E) = n^{n/2} vol(E) (MeasureTheory.Measure.addHaar_smul); combine.

*Checks.*

- n = 1: c(1) = 2, the sharp constant of minkowski-second-upper.
- n = 2: c(2) = 2·(4/3)^{1/2}·π ≈ 7.26 > 4 = 2²: the statement is weaker than the sharp theorem, which it does not replace.

*Needs:* [John's ellipsoid theorem](#john-ellipsoid) (`GN.1/john-ellipsoid`); [Hermite's bound for the minima of balls, ellipsoids and boxes](#hermite-minima-product) (`GN.1/hermite-minima-product`); `GN.1/successive-minimum-antitone-body` (base plan); Mathlib `MeasureTheory.Measure.addHaar_smul`.

*Source:* Jan-Hendrik Evertse (EvertseGeometry), §2.3, Corollary 2.15, p.28: States the weak form λ_1⋯λ_n ≤ c(n) d(L)/vol(C) of Minkowski's second theorem as a consequence of Theorem 2.14 and Corollary 2.13; the constant here is the one that argument produces.

### 1.9 Smith's evaluation polytopes

Real polynomials of degree at most m are identified with their coefficient vectors; the integer polynomials are the standard lattice. Bounding the values of a polynomial at m+1 nodes cuts out a symmetric convex body whose volume is a Vandermonde determinant.

<a id="evaluation-polytope"></a>
#### Evaluation polytopes of polynomials

`GN.1/evaluation-polytope` · definition

Fix m ≥ 0, pairwise distinct reals α_0,…,α_m and positive reals v_0,…,v_m. Identify a real polynomial P(z) = a_0 + a_1 z + ⋯ + a_m z^m of degree at most m with its coefficient vector a ∈ R^{m+1}, carried as EuclideanSpace R (Fin (m+1)) so that the standard basis is orthonormal and the volume is Lebesgue measure. The evaluation polytope is K_{α,v} = {a : v_k·|P_a(α_k)| ≤ 1 for k = 0,…,m}, a centrally symmetric convex body with 0 in its interior; it is the preimage under the Vandermonde matrix V = (α_k^j)_{k,j} of the box ∏_k [−1/v_k, 1/v_k]. The integer polynomials of degree at most m form the standard lattice Z^{m+1} of covolume 1, and the successive minima of K_{α,v} with respect to it are the minima of the inherited node successive-minimum.

*Hypotheses.*

- m ≥ 0; α : Fin (m+1) → R injective (pairwise distinct nodes); v : Fin (m+1) → R with every v_k > 0.
- Coefficients are indexed from the constant term; the identification with polynomials is Polynomial.degreeLTEquiv.

*Uses.*

- Smith, Proposition 3.4, pp.14–15: the minima of K with respect to the integer polynomials are bounded through Minkowski's second theorem and the Vandermonde volume.
- Smith, Proposition 3.5, pp.15–16: applied with v_i = |R(α_i)| w(α_i)^n at nodes maximising an energy integrand, giving lower bounds for products of weighted sup-norms of independent integer polynomials.
- Smith, Proposition 3.6, pp.16–17: applied at the roots of the approximating polynomial to produce independent integer polynomials of small weighted norm.
- LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.5 (norm-product-lower, norm-product-upper, gcd-norm-bound): imports the volume formula and the two product bounds (request R1 of that packet).

*API.*

- `evaluationPolytope` (constructor): evaluationPolytope α v hα hv : ConvexBody (EuclideanSpace R (Fin (m+1))).
- `mem_evaluationPolytope_iff` (characterisation): a ∈ evaluationPolytope α v ↔ ∀ k, v k * |∑ j, a j * α k ^ (j : ℕ)| ≤ 1.
- `mem_evaluationPolytope_iff_eval` (equivalence): a ∈ evaluationPolytope α v ↔ ∀ k, v k * |(degreeLTEquiv.symm a).eval (α k)| ≤ 1, for the polynomial with coefficient vector a.
- `evaluationPolytope_eq_preimage` (characterisation): The carrier is the preimage of the box ∏_k [−1/v_k, 1/v_k] under the Vandermonde matrix of α acting on coefficient vectors.
- `gauge_evaluationPolytope` (simp): gauge (evaluationPolytope α v) a = max_k v_k·|P_a(α_k)|.
- `evaluationPolytope_neg_mem` (structure): a ∈ K → −a ∈ K.
- `zero_mem_interior_evaluationPolytope` (structure): 0 ∈ interior K.
- `evaluationPolytope_smul` (relation): For c > 0, c • evaluationPolytope α v = evaluationPolytope α (v/c).
- `evaluationPolytope_antitone` (relation): If v ≤ v' pointwise then evaluationPolytope α v' ⊆ evaluationPolytope α v.
- `intCoeffLattice` (data): The Z-span of the standard basis of EuclideanSpace R (Fin (m+1)): the integer polynomials of degree ≤ m; discrete, full, covolume 1.
- `volume_evaluationPolytope` (characterisation): volume K = 2^{m+1}/(∏_k v_k·∏_{i<j}|α_i − α_j|); see evaluation-polytope-volume.

*Unit tests.*

- `evaluationPolytope_m_zero` (degenerate): For m = 0 the carrier is the interval [−1/v_0, 1/v_0] and the only minimum with respect to Z is v_0.
- `evaluationPolytope_area_example` (computation): For m = 1, α = (0,1), v = (1,1): volume K = 4 and gauge K (1,0) = gauge K (0,1) = 1.
- `evaluationPolytope_gauge_one` (computation): The constant polynomial 1 has gauge max_k v_k.
- `evaluationPolytope_vandermonde_compat` (compatibility): The carrier equals (Matrix.vandermonde α).mulVec ⁻¹' {y | ∀ k, |y k| ≤ 1/v k}.
- `evaluationPolytope_repeated_node` (non-example): For m = 1 and α = (0,0) the defining set {|a_0| ≤ 1/v_0, |a_0| ≤ 1/v_1} is unbounded in a_1, so no convex body exists without injectivity of α.

*Proof sketch.*

1. Write K as the preimage of the compact convex box under the linear map V; V is invertible because det V = ∏_{i<j}(α_j − α_i) ≠ 0 (Matrix.det_vandermonde, Matrix.det_vandermonde_ne_zero_iff), so K is compact, convex, symmetric and contains a neighbourhood of 0.
2. The gauge of K at a is max_k v_k|P_a(α_k)|, because the box's gauge is the weighted sup-norm and gauges pull back along linear isomorphisms (gauge-linear-equiv).
3. The integer lattice is the Z-span of the standard basis; its covolume is 1 (ZLattice.covolume_eq_det).

*Checks.*

- m = 0: K = [−1/v_0, 1/v_0] and λ_0 = v_0.
- m = 1, α = (0,1), v = (1,1): K = {|a_0| ≤ 1, |a_0 + a_1| ≤ 1}, of area 4.
- With repeated nodes the set is unbounded, so injectivity of α is required.

*Needs:* Mathlib `Matrix.vandermonde`; Mathlib `Matrix.det_vandermonde`; Mathlib `Matrix.det_vandermonde_ne_zero_iff`; Mathlib `Polynomial.degreeLTEquiv`; Mathlib `ConvexBody`; Mathlib `ZLattice.covolume_eq_det`; `GN.1/successive-minimum` (base plan); `GN.1/gauge-linear-equiv` (base plan).

*Source:* Alexander Smith (Smith2024), Proposition 3.4 (statement), p.14, and its proof, pp.14–15 (arXiv:2111.12660v2): Defines the set K of real polynomials of degree at most m with v_i|P(α_i)| ≤ 1, regards it as a centrally symmetric convex body in coefficient space, and writes it as the preimage of a box under the Vandermonde matrix.

<a id="evaluation-polytope-volume"></a>
#### Vandermonde volume of an evaluation polytope

`GN.1/evaluation-polytope-volume` · lemma · Lean: `volume_evaluationPolytope`

With m, α, v as in evaluation-polytope, vol(K_{α,v}) = 2^{m+1}/(∏_{k=0}^m v_k · ∏_{0≤i<j≤m} |α_i − α_j|).

*Hypotheses.*

- α injective; every v_k > 0; volume is Lebesgue measure on EuclideanSpace R (Fin (m+1)).

*Proof sketch.*

1. K is the preimage of the box B = ∏_k [−1/v_k, 1/v_k] under the Vandermonde matrix V.
2. MeasureTheory.Measure.addHaar_preimage_linearMap gives vol(K) = |det V|^{-1}·vol(B), transported from Fin (m+1) → R by PiLp.volume_preserving_ofLp.
3. vol(B) = ∏_k 2/v_k (Real.volume_Icc_pi) and |det V| = ∏_{i<j}|α_j − α_i| (Matrix.det_vandermonde).

*Checks.*

- m = 0: vol = 2/v_0.
- m = 1, α = (0,1), v = (1,1): vol = 4/(1·1·1) = 4.
- m = 2, α = (−1,0,1), v = (1,1,1): vol = 8/(1·1·2) = 4.

*Needs:* [Evaluation polytopes of polynomials](#evaluation-polytope) (`GN.1/evaluation-polytope`); Mathlib `MeasureTheory.Measure.addHaar_preimage_linearMap`; Mathlib `Real.volume_Icc_pi`; Mathlib `Matrix.det_vandermonde`; Mathlib `PiLp.volume_preserving_ofLp`.

*Source:* Alexander Smith (Smith2024), Proof of Proposition 3.4, pp.14–15: Computes the volume of K as |det V|^{-1} times the volume 2^{m+1}∏v_i^{-1} of the box, with the Vandermonde determinant ∏_{i<j}(α_j − α_i).

<a id="evaluation-polytope-minima"></a>
#### Smith's bound for the minima of an evaluation polytope

`GN.1/evaluation-polytope-minima` · theorem · Lean: `evaluationPolytope_successiveMin_prod_bounds` · planet: *Smith's evaluation-polytope bound*

With m, α, v as in evaluation-polytope, let λ_0 ≤ … ≤ λ_m be the successive minima of K_{α,v} with respect to the integer polynomials of degree at most m: λ_i is the least nonnegative real such that λ_i·K contains i+1 linearly independent integer polynomials. Put D = ∏_{k=0}^m v_k·∏_{0≤i<j≤m}|α_i − α_j|. Then D/(m+1)! ≤ λ_0·λ_1⋯λ_m ≤ D.

*Hypotheses.*

- α injective, every v_k > 0; the minima are nonnegative (Smith's 'least real number' is read as least nonnegative real, sourceIssue E1 of this packet).

*Proof sketch.*

1. K is a symmetric convex body with 0 in its interior and the integer lattice has covolume 1 (evaluation-polytope).
2. minkowski-second-lower and minkowski-second-upper in dimension m+1 give (2^{m+1}/(m+1)!) ≤ (∏λ_i)·vol(K) ≤ 2^{m+1}.
3. Substitute vol(K) = 2^{m+1}/D (evaluation-polytope-volume) and divide.

*Checks.*

- m = 0: λ_0 = v_0 = D, both bounds equalities.
- α = (0,1), v = (1,1): D = 1 and the integer polynomials 1 and z both have gauge 1, so λ_0 = λ_1 = 1 and the upper bound is attained.
- α = (−1,1), v = (1,1): D = 2, K = {|a_0 − a_1| ≤ 1, |a_0 + a_1| ≤ 1}; again λ_0 = λ_1 = 1, so the lower bound D/2! = 1 is attained.

*Needs:* [Evaluation polytopes of polynomials](#evaluation-polytope) (`GN.1/evaluation-polytope`); [Vandermonde volume of an evaluation polytope](#evaluation-polytope-volume) (`GN.1/evaluation-polytope-volume`); `GN.1/minkowski-second-lower` (base plan); `GN.1/minkowski-second-upper` (base plan).

*Source:* Alexander Smith (Smith2024), Proposition 3.4, p.14, with proof pp.14–15 (arXiv:2111.12660v2): States D/(m+1)! ≤ λ_0⋯λ_m ≤ D for the evaluation polytope and proves it from Minkowski's second theorem and the Vandermonde volume.

### 1.10 Cofactors of a squarefree integer polynomial

For a squarefree integer polynomial Q with roots α_i, the cofactors Q/(z − α_i) form a basis of the polynomials of degree below deg Q in which every nonzero integer coefficient functional is detected with size at least one. This is the arithmetic input of Smith's coefficient adjustment.

<a id="cofactor-polynomials"></a>
#### Cofactors of a squarefree integer polynomial

`GN.1/cofactor-polynomials` · construction

Let Q = a_n z^n + ⋯ + a_0 ∈ Z[z] be squarefree of degree n ≥ 1 with leading coefficient c = a_n ≠ 0, and let α_1,…,α_n be its pairwise distinct complex roots, indexed by Fin n. The i-th cofactor is Q_i = Q/(z − α_i) = c·∏_{k≠i}(z − α_k) ∈ C[z], computed as the exact division of Q (mapped to C[z]) by the monic X − α_i. Then deg Q_i = n − 1, (z − α_i)Q_i = Q, Q_i(α_k) = 0 for k ≠ i and Q_i(α_i) = Q'(α_i) ≠ 0; the coefficients are coeff_j(Q_i) = Σ_{k=j+1}^n a_k α_i^{k−j−1}; the family (Q_i) is a C-basis of the polynomials of degree < n, with P = Σ_i P(α_i)/Q'(α_i)·Q_i; every coefficient of every Q_i is an algebraic integer; and a field automorphism σ of C with σ(α_i) = α_{π(i)} maps Q_i to Q_{π(i)} coefficientwise.

*Hypotheses.*

- Q ∈ Z[z], squarefree (so its complex roots are simple), natDegree Q = n ≥ 1, leading coefficient c ≠ 0 of either sign.
- The roots are enumerated by Fin n; nothing depends on the enumeration.

*Uses.*

- Smith, Theorem 3.2 and its proof, pp.12–13: the cofactors span the polynomials of degree < n and integer functionals detect them (cofactor-integer-functional).
- Smith, Corollary 3.3, pp.13–14, and Lemma 3.8, pp.17–18: approximation of a real polynomial by an integer one with error Σβ_iQ_i, whose weighted norm is controlled by that of Q.
- smith-cofactor-adjustment and real-cofactor-basis (this packet): the realified family and the covering argument.
- LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.5/integer-approximation: imports the cofactor adjustment (request R2 of that packet).

*API.*

- `cofactor` (constructor): cofactor Q α i = (Q.map (Int.castRingHom C)) /ₘ (X − C (α i)).
- `X_sub_C_mul_cofactor` (characterisation): (X − C (α i)) * cofactor Q α i = Q.map (Int.castRingHom C).
- `natDegree_cofactor` (simp): natDegree (cofactor Q α i) = n − 1 and its leading coefficient is c.
- `coeff_cofactor` (characterisation): (cofactor Q α i).coeff j = Σ_{k ∈ Icc (j+1) n} α_i^{k−(j+1)}·a_k.
- `cofactor_eval_self` (simp): (cofactor Q α i).eval (α i) = (derivative Q).eval (α i), which is nonzero.
- `cofactor_eval_of_ne` (simp): For k ≠ i, (cofactor Q α i).eval (α k) = 0.
- `cofactorBasis` (structure): The cofactors form a basis of degreeLT C n, and P = Σ_i P(α_i)/Q'(α_i) · cofactor Q α i for every P of degree < n.
- `isIntegral_coeff_cofactor` (other): For all i and j, IsIntegral Z ((cofactor Q α i).coeff j).
- `cofactor_map_ringEquiv` (functoriality): If σ is a ring automorphism of C sending α_i to α_{π i} for every i, then (cofactor Q α i).map σ = cofactor Q α (π i); the same holds for automorphisms of the splitting field.
- `cofactor_conj` (compatibility): If conj (α i) = α k then (cofactor Q α i).map conj = cofactor Q α k; for a real root the cofactor has real coefficients.

*Unit tests.*

- `cofactor_sq_sub_two` (computation): For Q = X² − 2 with roots ±√2, the cofactors are X + √2 and X − √2.
- `cofactor_two_sq_sub_one_integral` (computation): For Q = 2X² − 1 the cofactor at 1/√2 is 2X + √2: its coefficients 2 and √2 are integral over Z although the root 1/√2 is not.
- `cofactor_degree_one` (degenerate): For Q = cX − a (c ≠ 0) the only cofactor is the constant c.
- `cofactor_not_squarefree` (non-example): For Q = X², dividing by X at the double root 0 gives X twice; the two 'cofactors' are not a basis of the polynomials of degree < 2, which is why squarefreeness is assumed.

*Proof sketch.*

1. Exactness of the division: α_i is a root, so (X − α_i)·(Q /ₘ (X − α_i)) = Q (Polynomial.mul_divByMonic_eq_iff_isRoot); the coefficient formula is Polynomial.coeff_divByMonic_X_sub_C.
2. Evaluation: Q_i = c∏_{k≠i}(z−α_k) vanishes at the other roots, and differentiating (z − α_i)Q_i = Q at α_i gives Q_i(α_i) = Q'(α_i), nonzero since the root is simple (Polynomial.derivative).
3. Basis: the evaluation matrix (Q_i(α_k)) is diagonal with nonzero entries, so the n polynomials of degree < n are independent; Lagrange interpolation gives the expansion (Lagrange.basis, Lagrange.interpolate).
4. Integrality (Smith, Gauss's lemma): in the ring of integers of the splitting field, at every prime the content of Q is the content of z − α_i times that of Q_i; the content of z − α_i is generated by 1 and α_i and so contains 1, while that of Q is integral; hence every coefficient of Q_i has nonnegative valuation everywhere and is an algebraic integer.
5. Galois action: σ fixes the coefficients of Q and permutes its roots, and the division is compatible with σ (Polynomial.map_divByMonic).

*Checks.*

- Q = z² − 2: cofactors z + √2 and z − √2.
- Q = 2z² − 1: cofactors 2z + √2 and 2z − √2, whose coefficients are algebraic integers although the roots ±1/√2 are not.
- n = 1, Q = cz − a: the single cofactor is the constant c.

*Needs:* Mathlib `Polynomial.divByMonic`; Mathlib `Polynomial.mul_divByMonic_eq_iff_isRoot`; Mathlib `Polynomial.coeff_divByMonic_X_sub_C`; Mathlib `Polynomial.map_divByMonic`; Mathlib `Polynomial.derivative`; Mathlib `Squarefree`; Mathlib `Lagrange.basis`; Mathlib `Lagrange.interpolate`; Mathlib `IsIntegral`; Mathlib `Polynomial.degreeLTEquiv`.

*Source:* Alexander Smith (Smith2024), Theorem 3.2 (statement) pp.12–13 and its proof p.13 (arXiv:2111.12660v2): Defines Q_i = Q/(z − α_i) for a squarefree integer polynomial with distinct roots, proves that their coefficients are algebraic integers by Gauss's lemma over the discrete valuation rings of the ring of integers of Q(α_1,…,α_n), and notes that an automorphism taking α_i to α_k takes Q_i to Q_k; the cofactors are linearly independent.

<a id="cofactor-integer-functional"></a>
#### Integer functionals detect a cofactor

`GN.1/cofactor-integer-functional` · theorem · Lean: `exists_one_le_norm_cofactor_functional`

With Q, α, Q_i as in cofactor-polynomials, let d = (d_0,…,d_{n−1}) ∈ Z^n be nonzero and s_i = Σ_{j<n} d_j·coeff_j(Q_i). Then the product of the nonzero s_i is a nonzero rational integer; in particular max_i |s_i| ≥ 1. Equivalently, in coefficient coordinates the cross-polytope spanned by ±Q_1,…,±Q_n has polar body containing no nonzero integer functional in its interior.

*Hypotheses.*

- Q squarefree in Z[z] of degree n ≥ 1; d ∈ Z^n, d ≠ 0.

*Proof sketch.*

1. Each s_i is an algebraic integer (isIntegral_coeff_cofactor and closure of integral elements under sums and products).
2. An automorphism of the splitting field permutes the cofactors (cofactor_map_ringEquiv), hence permutes the s_i; so F(x) = ∏_i (x − s_i) has coefficients fixed by every automorphism, which are rational, and integral, hence in Z.
3. Not all s_i vanish: P ↦ Σ_j d_j coeff_j(P) is a nonzero functional on polynomials of degree < n and the Q_i form a basis (cofactorBasis).
4. Write F = x^k G with G(0) ≠ 0; G(0) = ±∏_{s_i≠0} s_i is a nonzero integer, so |∏_{s_i≠0} s_i| ≥ 1 and some |s_i| ≥ 1.

*Checks.*

- Q = z² − 2, d = (0,1): s = (1,1).
- Q = z² − 2, d = (1,0): s = (√2, −√2), product −2.
- Q = 2z² − 1, d = (1,0): s = (√2, −√2) again; the conclusion uses integrality of the cofactor coefficients, not of the roots.

*Needs:* [Cofactors of a squarefree integer polynomial](#cofactor-polynomials) (`GN.1/cofactor-polynomials`); Mathlib `IsIntegral.add`; Mathlib `IsIntegral.mul`; Mathlib `IsIntegral.sum`; Mathlib `IsIntegrallyClosed`; Mathlib `Polynomial.Gal`.

*Source:* Alexander Smith (Smith2024), Proof of Theorem 3.2, p.13: Shows that for rational integers d_j the numbers Σ_j d_j b_ij, i = 1,…,n, are the roots of a monic integer polynomial, so if one is nonzero some has absolute value at least one, and that they cannot all vanish because the Q_i are linearly independent.

<a id="real-cofactor-basis"></a>
#### The realified cofactor basis

`GN.1/real-cofactor-basis` · construction

With Q, α, Q_i as in cofactor-polynomials, let τ be the involution of Fin n with α_{τ(i)} = conj(α_i). Define real polynomials Q°_i of degree < n by Q°_i = Q_i if α_i is real, Q°_i = √2·Re(Q_i) if i < τ(i), and Q°_i = −√2·Im(Q_{τ(i)}) if i > τ(i) (real and imaginary parts taken coefficientwise; equivalently (Q_i + Q_{τ i})/√2 and √−1(Q_{τ i} − Q_i)/√2 up to the labelling). Then (a) (Q°_i) is an R-basis of the real polynomials of degree < n; (b) every nonzero d ∈ Z^n satisfies max_i |Σ_j d_j coeff_j(Q°_i)| ≥ 1; (c) for real γ_1,…,γ_n, Σ_i γ_iQ°_i = Σ_i β_iQ_i for complex β with Σ|β_i| ≤ √2·Σ|γ_i|.

*Hypotheses.*

- Q squarefree in Z[z] of degree n ≥ 1; real coefficients make τ well defined (cofactor_conj).

*Uses.*

- Smith, proof of Theorem 3.2, p.13: the real cross-polytope spanned by ±Q°_i is the body whose translates must meet the integer polynomials.
- smith-cofactor-adjustment (this packet): coordinates for the ℓ¹ covering argument and conversion back to complex β.

*API.*

- `realCofactor` (constructor): realCofactor Q α τ i : R[X] of degree < n, defined casewise as above.
- `realCofactor_of_isReal` (simp): If α i is real then realCofactor Q α τ i maps to cofactor Q α i in C[X].
- `realCofactorBasis` (structure): The family realCofactor Q α τ is a basis of degreeLT R n.
- `realCofactor_functional` (characterisation): For d : Fin n → Z, d ≠ 0, there is i with 1 ≤ |Σ_j d_j (realCofactor Q α τ i).coeff j|.
- `realCofactor_coord_transfer` (relation): For γ : Fin n → R there is β : Fin n → C with Σ_i γ_i·realCofactor_i = Σ_i β_i·cofactor_i in C[X] and Σ|β_i| ≤ √2·Σ|γ_i|.
- `realCofactor_totallyReal` (compatibility): If every root is real, realCofactor Q α τ = cofactor Q α (after mapping to C[X]).

*Unit tests.*

- `realCofactor_X_sq_add_one` (computation): For Q = X² + 1 with roots i, −i, the realified family is (√2·X, −√2) up to order.
- `realCofactor_totally_real_example` (degenerate): For Q = X² − 2 the realified family equals the cofactor family X + √2, X − √2.
- `realCofactor_functional_example` (characterisation): For Q = X² + 1 and d = (1,1), the values are ±√2, of absolute value ≥ 1.
- `realCofactor_needs_sqrt_two` (non-example): For Q = X² − X + 1 and d = (1,0) the unnormalised Re and Im of d(Q_i) are 1/2 and ±√3/2, both < 1; only with the factor √2 does some value reach absolute value ≥ 1.

*Proof sketch.*

1. Reality: for a real root Q_i has real coefficients; for a conjugate pair Q_{τ i} = conj Q_i, so √2 Re and √2 Im are real combinations of Q_i, Q_{τ i}.
2. (a) The change from (Q_i) to (Q°_i) is invertible over C, block diagonal with 2×2 blocks of determinant ±i, so (Q°_i) is a C-basis of complex polynomials of degree < n consisting of real polynomials, hence an R-basis of the real ones.
3. (b) For a real root d(Q°_i) = s_i. For a pair, d(Q°_i) = √2 Re s_i and d(Q°_{τ i}) = −√2 Im s_i, and max(√2|Re z|, √2|Im z|) ≥ |z|; apply cofactor-integer-functional.
4. (c) γ_a√2 Re Q_i − γ_b√2 Im Q_i = ((γ_a + √−1γ_b)/√2)Q_i + ((γ_a − √−1γ_b)/√2)Q_{τ i}, and the two coefficients have total modulus √2·|γ_a + √−1γ_b| ≤ √2(|γ_a| + |γ_b|).

*Checks.*

- Totally real Q: Q°_i = Q_i.
- Q = z² + 1: Q° = (√2·z, −√2) in some order, and every nonzero (d_0,d_1) gives max(√2|d_1|, √2|d_0|) ≥ √2.
- Q = z² − z + 1, d = (1,0): Re and Im of d(Q_i) are 1/2 and ±√3/2, both below 1; the √2 normalisation is needed for (b).

*Needs:* [Cofactors of a squarefree integer polynomial](#cofactor-polynomials) (`GN.1/cofactor-polynomials`); [Integer functionals detect a cofactor](#cofactor-integer-functional) (`GN.1/cofactor-integer-functional`); Mathlib `Polynomial.degreeLTEquiv`.

*Source:* Alexander Smith (Smith2024), Proof of Theorem 3.2, p.13: Introduces the list Q°_1,…,Q°_n consisting of Q_i for real roots and (Q_i + conj Q_i)/√2, √−1(Q_i − conj Q_i)/√2 for conjugate pairs, and observes that for every nonzero integer vector some Q°_i has functional value at least one in absolute value.

### 4.4a Gaussian tails and the ℓ¹ covering bound (Layer 4)

These four targets belong to Layer 4, §4.4 (covering and transference): they rest on the lattice Gaussian sums, Poisson summation and shift bound planned there, and Layer 4 already depends on Layer 1. They are planned here because Smith's coefficient adjustment, which they prove, was routed to this layer; Layer 4 cites them and does not plan them again.

<a id="gaussian-directional-tail"></a>
#### Directional tail of a shifted lattice Gaussian

`GN.4/gaussian-directional-tail` · lemma · Lean: `gaussian_directional_tail`

Let Λ be a discrete full lattice in a finite-dimensional real inner-product space E, c ∈ E, u a unit vector and r ≥ 0. With ρ(x) = exp(−π‖x‖²) (the lattice Gaussian sum of GN.4/lattice-gaussian-sum at parameter 1), Σ_{x ∈ Λ+c, |⟨x,u⟩| ≥ r} ρ(x) ≤ 2·e^{−πr²}·Σ_{x∈Λ} ρ(x).

*Hypotheses.*

- Λ discrete and full; ‖u‖ = 1; r ≥ 0; all sums are the absolutely convergent lattice Gaussian sums of GN.4.

*Proof sketch.*

1. For real t, ρ(x)·e^{2πt⟨x,u⟩} = e^{πt²}·ρ(x − tu) (completing the square).
2. Summing over Λ + c and using gaussian-shift-maximum: Σ_{x∈Λ+c} ρ(x)e^{2πt⟨x,u⟩} = e^{πt²}ρ(Λ + c − tu) ≤ e^{πt²}ρ(Λ).
3. With t = r, the terms with ⟨x,u⟩ ≥ r have weight at least e^{2πr²}, so their ρ-mass is at most e^{−πr²}ρ(Λ); with t = −r the same for ⟨x,u⟩ ≤ −r; add.

*Checks.*

- E = R, Λ = Z, c = 0, u = 1, r = 0: the bound reads ρ(Z) ≤ 2ρ(Z).
- For large r the right side decays like e^{−πr²}, matching a single Gaussian coordinate.

*Needs:* `GN.4/lattice-gaussian-sum` (base plan); `GN.4/gaussian-lattice-summable` (base plan); `GN.4/gaussian-shift-maximum` (base plan).

*Source:* Chris Peikert (Peikert2007), Lemma 5.3 (tail inequality) with d = 1, and Claims 5.4–5.5, pp.15–16 (ECCC TR06-148 rev. 1): Bounds the Gaussian mass of a shifted lattice outside a slab of width r around the centre by 2^d e^{−πr²/d} times the mass of the lattice, by a cosh tilt, completing the square and the shift bound ρ_c(Λ) ≤ ρ(Λ) of its Lemma 2.7; d = 1 is the statement here.

<a id="gaussian-coordinate-tails"></a>
#### Sup-norm and ℓ¹ tails of a shifted lattice Gaussian

`GN.4/gaussian-coordinate-tails` · lemma · Lean: `gaussian_coordinate_tails`

Let Λ be a discrete full lattice in a real inner-product space E of dimension n with orthonormal basis e, c ∈ E, and write ‖x‖_{∞} = max_i |⟨x,e_i⟩| and ‖x‖_{1} = Σ_i |⟨x,e_i⟩|. With ρ as in gaussian-directional-tail: (a) for r ≥ 0, Σ_{x∈Λ+c, ‖x‖_∞ ≥ r} ρ(x) ≤ 2n·e^{−πr²}·ρ(Λ); (b) Σ_{x∈Λ+c} ρ(x)·‖x‖_1 ≤ n·ρ(Λ), hence for r > 0, Σ_{x∈Λ+c, ‖x‖_1 ≥ r} ρ(x) ≤ (n/r)·ρ(Λ).

*Hypotheses.*

- Λ discrete and full; e orthonormal; n = dim E ≥ 0.

*Proof sketch.*

1. (a) {‖x‖_∞ ≥ r} is the union over i of {|⟨x,e_i⟩| ≥ r}; apply gaussian-directional-tail with u = e_i and sum over i.
2. (b) For each i, Σ_x ρ(x)|⟨x,e_i⟩| = ∫_0^∞ Σ_x ρ(x)·1[|⟨x,e_i⟩| ≥ t] dt (Tonelli) ≤ ∫_0^∞ 2e^{−πt²}dt·ρ(Λ) = ρ(Λ) by gaussian-directional-tail and integral_gaussian; sum over i.
3. The tail bound in (b) is Markov's inequality applied to the weights ρ(x).

*Checks.*

- n = 1, Λ = Z: (a) and (b) reduce to gaussian-directional-tail and to Σ_k |k|e^{−πk²} ≤ Σ_k e^{−πk²}.
- (b) at r = 3n gives mass at most ρ(Λ)/3, the input of l1-covering-transference.

*Needs:* [Directional tail of a shifted lattice Gaussian](#gaussian-directional-tail) (`GN.4/gaussian-directional-tail`); `GN.4/lattice-gaussian-sum` (base plan); Mathlib `integral_gaussian`.

*Source:* Chris Peikert (Peikert2007), Lemmas 3.1 (case p = 1) and 3.3, p.8, with the moment computation in the proof of Theorem 5.1, pp.14–15 (ECCC TR06-148 rev. 1): Lemma 3.3 bounds the mass of Λ + v outside r·B_∞ by 2n e^{−πr²}ρ(Λ) and Lemma 3.1 the mass outside r·B_1 by n/r times ρ(Λ), both quoted from Banaszczyk 1995 (Lemmas 2.10, 2.9); the integral formula for moments in the proof of Theorem 5.1 is the layer-cake step used here.

<a id="l1-covering-transference"></a>
#### ℓ¹ covering against the dual sup-norm minimum

`GN.4/l1-covering-transference` · theorem · Lean: `exists_mem_sum_abs_inner_lt_of_dual`

Let n ≥ 1, E a real inner-product space of dimension n with orthonormal basis e, ‖·‖_1 and ‖·‖_∞ the coordinate norms of gaussian-coordinate-tails, Λ a discrete full lattice and Λ* = {y : ⟨y,x⟩ ∈ Z for all x ∈ Λ} its inner dual. If m > 0 and every nonzero y ∈ Λ* satisfies ‖y‖_∞ ≥ m, then every t ∈ E has some v ∈ Λ with ‖t − v‖_1 < (3n/m)·√(log(8n)/π). In particular the ℓ¹ covering radius μ_1(Λ) and the dual sup-norm minimum λ_1^∞(Λ*) satisfy μ_1(Λ)·λ_1^∞(Λ*) ≤ 3n√(log(8n)/π) ≤ 6n·log(2n).

*Hypotheses.*

- n ≥ 1; Λ discrete and full; Λ* is LinearMap.BilinForm.dualSubmodule for the inner product, a discrete full lattice by GN.0/covolume-dual; m > 0.

*Proof sketch.*

1. Rescale Λ by m to reduce to m = 1.
2. Put s = √(log(8n)/π) and M = s^{-1}Λ, whose dual is sΛ*; every nonzero vector of sΛ* has ‖·‖_∞ ≥ s.
3. gaussian-coordinate-tails (a) for the lattice sΛ* with c = 0 and every r < s, letting r → s: R := ρ(sΛ* ∖ {0}) ≤ 2n e^{−πs²}(1 + R) = (1 + R)/4, so R ≤ 1/3.
4. gaussian-poisson-error applied to sΛ*, whose dual is M (dual of the dual, LinearMap.BilinForm.dualSubmodule_dualSubmodule_flip_of_basis): for every u, ρ(M + u) ≥ (2/3)covol(sΛ*) and ρ(M) ≤ (4/3)covol(sΛ*), so ρ(M + u) ≥ ρ(M)/2.
5. gaussian-coordinate-tails (b) for M with shift u and r = 3n: the mass of M + u with ‖x‖_1 ≥ 3n is at most ρ(M)/3 < ρ(M + u), so some x ∈ M + u has ‖x‖_1 < 3n.
6. With u = −t/s and x = (v − t)/s this is v ∈ Λ with ‖t − v‖_1 < 3ns. Finally √(log(8n)/π) ≤ 2 log(2n) for n ≥ 1.

*Checks.*

- Λ = Z^n: Λ* = Z^n has sup-norm minimum 1; the true ℓ¹ covering radius is n/2, below the bound 3n√(log(8n)/π).
- n = 1, Λ = aZ: Λ* = a^{-1}Z, product of a/2 and 1/a is 1/2 ≤ 3√(log 8/π) ≈ 2.44.
- The hypothesis is on the dual lattice in the sup-norm and the conclusion on the lattice in the ℓ¹ norm; the two norms are dual to each other.

*Needs:* [Sup-norm and ℓ¹ tails of a shifted lattice Gaussian](#gaussian-coordinate-tails) (`GN.4/gaussian-coordinate-tails`); `GN.4/gaussian-poisson-error` (base plan); `GN.4/lattice-gaussian-sum` (base plan); `GN.0/covolume-dual` (base plan); Mathlib `LinearMap.BilinForm.dualSubmodule`; Mathlib `LinearMap.BilinForm.dualSubmodule_dualSubmodule_flip_of_basis`.

*Source:* Chris Peikert (Peikert2007), Definition 2.5 and Lemma 2.7, p.7; Lemmas 3.1, 3.3, p.8; Lemma 3.5, p.9 (ECCC TR06-148 rev. 1): Lemma 3.5 bounds the smoothing parameter by n^{1/p}√(log(2n/ε)/π)/λ_1^p(Λ*), for p = ∞ through the sup-norm tail of Lemma 3.3; Lemma 2.7 says that above the smoothing parameter every shifted lattice carries Gaussian mass comparable to the lattice itself; with the ℓ¹ tail of Lemma 3.1 these give the covering bound, assembled in the proof steps. Wojciech Banaszczyk (BLPS1999), §1 and §2: Lemma 2.1, Proposition 2.3, Theorem 2.4, Corollary 2.5, pp.2–10 (author copy): The general flatness and covering inequality μ(K,L)λ_1(H,L*) ≤ C ℓ(K)ℓ(H) and the bound Cn(1+log n) for polytopes with few vertices; the statement here is the case of the cross-polytope against the cube, proved without the majorizing-measure theorem that the general case uses.

<a id="smith-cofactor-adjustment"></a>
#### Smith's cofactor adjustment theorem

`GN.4/smith-cofactor-adjustment` · theorem · Lean: `smith_cofactor_adjustment`

Let Q ∈ Z[z] be squarefree of degree n ≥ 1 with leading coefficient c ≠ 0, α_1,…,α_n its complex roots and Q_i = Q/(z − α_i). For every real polynomial P of degree at most n − 1 there are complex numbers β_1,…,β_n with Σ_i |β_i| < 3√2·n·√(log(8n)/π) ≤ 9·n·log(2n) such that P − Σ_i β_iQ_i has integer coefficients (and degree at most n − 1).

*Hypotheses.*

- Q squarefree in Z[z], natDegree n ≥ 1, c ≠ 0 of either sign (Smith states c ≥ 1; negating Q negates every Q_i and changes nothing).
- P ∈ R[z] with natDegree P ≤ n − 1.

*Proof sketch.*

1. Identify real polynomials of degree < n with EuclideanSpace R (Fin n) by coefficients; let T be the linear isomorphism sending the standard basis to the realified cofactors Q°_i (real-cofactor-basis (a)), and Λ = T^{-1}(Z^n), the integer polynomials in Q°-coordinates.
2. The inner dual of Λ is T^*(Z^n): a dual vector is d ∘ T for an integer coefficient functional d, with coordinates d(Q°_i). By real-cofactor-basis (b) every nonzero dual vector has sup-norm at least 1.
3. l1-covering-transference with m = 1 and t = T^{-1}(P) gives v ∈ Λ with ‖t − v‖_1 < 3n√(log(8n)/π): P − T(v) = Σ γ_iQ°_i with Σ|γ_i| < 3n√(log(8n)/π) and T(v) an integer polynomial of degree < n.
4. real-cofactor-basis (c) rewrites Σγ_iQ°_i = Σβ_iQ_i with Σ|β_i| ≤ √2Σ|γ_i|; 3√2·√(log(8n)/π) ≤ 9 log(2n) for n ≥ 1.

*Checks.*

- n = 1, Q = cz − a: Q_1 = c and P is a real constant p; β_1 = (p − k)/c with k the nearest integer to p has |β_1| ≤ 1/(2|c|) ≤ 1/2.
- Q = z² − 2, P = z/2: P = (Q_1 + Q_2)/4 with Q_{1,2} = z ± √2, so β = (1/4, 1/4), Σ|β_i| = 1/2 and the integer polynomial is 0.
- The constant 9n log(2n) is uniform in Q: it depends neither on the height nor on the discriminant of Q.

*Needs:* [ℓ¹ covering against the dual sup-norm minimum](#l1-covering-transference) (`GN.4/l1-covering-transference`); [The realified cofactor basis](#real-cofactor-basis) (`GN.1/real-cofactor-basis`); [Integer functionals detect a cofactor](#cofactor-integer-functional) (`GN.1/cofactor-integer-functional`); [Cofactors of a squarefree integer polynomial](#cofactor-polynomials) (`GN.1/cofactor-polynomials`); Mathlib `Polynomial.degreeLTEquiv`.

*Source:* Alexander Smith (Smith2024), Theorem 3.2, pp.12–13, and its proof p.13 (arXiv:2111.12660v2): States the existence of β with Σ|β_i| ≤ Cn log 2n making P − Σβ_iQ_i integral, and proves it from the integrality and Galois argument and a flatness bound for the cross-polytope spanned by the realified cofactors; the citation of the simplex case of the flatness theorem needs the step recorded in sourceIssue E2 of this packet, and the covering bound used here replaces it. Wojciech Banaszczyk (BLPS1999), Corollary 2.5, p.10 (author copy): Flatness bound Cn(1 + log n) for simplices, the result Smith cites; its consequence for Smith's body is explained in sourceIssue E2.

## Dependencies

**Inside this roadmap.** Layer 0: `orthonormal-coordinate-hadamard`, `covolume-square-gram`, `covolume-projection`, `projected-adapted-basis`, `prescribed-primitive-basis`, `integral-rational-flag`, `covolume-dual`. Layer 1 (base plan): `successive-minimum` and its laws (`-pos`, `-monotone`, `-le-iff`, `-witnesses`, `-first`, `-smul-body`, `-antitone-body`, `-linear-equiv`), `lattice-determinant-lower-bound`, `gauge-linear-equiv`, `minkowski-second-lower`, `minkowski-second-upper`. Layer 4: `lattice-gaussian-sum`, `gaussian-lattice-summable`, `gaussian-shift-maximum`, `gaussian-poisson-error` (used only by the §4.4a targets).

**Other roadmaps.** TauCetiRoadmap IntegralLattices, Layer 2 (milestones 2B, 2E, 2F): the norm-valued minima that §1.6 compares with Euclidean minima. No other roadmap is imported.

**Consumers.** LogarithmicPotentialTheoryAndAlgebraicIntegers, Layer LP.5 (`norm-product-lower`, `norm-product-upper`, `gcd-norm-bound`, `integer-approximation`) imports `evaluation-polytope-minima`, `evaluation-polytope-volume` and `smith-cofactor-adjustment`; Layer 4 of this roadmap imports `successive-minimum-partial-product` for its counts `Σ_k X^k/a_k`; EffectiveBoundsCompactModels, AbelianVarietiesIsogenousToNoJacobian and DiophantineApproximationAndTranscendence import the base plan's minima and are unaffected.

## Acceptance tests

Every definition above lists its unit tests and every theorem its checks. The decisive ones: the box `{|x_0| ≤ 1/2, |x_1| ≤ 1/3}` has partial products `1, 2, 6`; the hexagonal lattice with minimal length `1` attains Hermite's bound in dimension two; the cube and the cross-polytope show that `√n` in John's theorem is sharp; the evaluation polytopes at nodes `(0,1)` and `(−1,1)` with unit weights attain the upper and lower bounds of Smith's Proposition 3.4; `Q = 2z² − 1` shows that cofactor coefficients are algebraic integers when the roots are not; `Q = z² − z + 1` shows that the `√2` normalisation of the realified cofactors is needed.

## Notes on the sources

- In Smith's Proposition 3.4 the minimum `λ_i` is to be read as the least *nonnegative* real with the stated property; the body is symmetric, so the least real one does not exist.
- The proof of Smith's Theorem 3.2 cites the flatness theorem for simplices for a body that is a cross-polytope. The missing step is a simplex inside the cross-polytope of lattice width at least one: `conv(Q°_1,…,Q°_n, −(1/n)ΣQ°_i)` has it, because some `|d(Q°_i)| ≥ 1` and the last vertex takes a value on the other side. The plan here does not use the flatness theorem: the coordinate Gaussian tails of §4.4a give the covering bound for the cross-polytope directly, with constant `3n√(log(8n)/π)`.
- Evertse states Theorem 2.14 and Corollary 2.15 without proof, referring to Schmidt's lecture notes; the proof planned here is Ball's (Lecture 3), in the symmetric case.
