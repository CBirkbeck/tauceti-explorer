# Locally analytic distributions, growth and character spaces

The library starts with analytic Banach stages on compact p-adic manifolds and ends with unbounded Mellin transforms and compact operators in analytic families. The finite-slope theory includes bounded complexes of projective Banach modules. Bounded measures, their bounded Amice transform, character representability and the universal character are imported from PadicMeasuresIwasawaAlgebras. Generic Stein geometry is imported from AdicSpacesPartII; solid coefficient foundations belong to the shared functional-analysis Part II proposal.

This is a **budget-complete planning pass**, with 303 unchecked declarations. Every layer remains partial: the targets below are specified, while the proof, topology and typing inputs in the final closure table remain unresolved. A complete pass is not a closed roadmap or a formalization. The packet preserves all 214 predecessor node ids and adds 89 source-read declarations. The existing one-variable analytic, entire-division, resultant, matrix and Riesz development remains part of the library plan.

## Conventions and library boundary

K is a finite extension of Q_p unless a statement explicitly permits a broader complete nonarchimedean field. Normalize v_p(p)=1. General Banach operator results use the inherited nonzero Noetherian K-Banach algebra A, with complete ultrametric submultiplicative norm and compatible bounded module action. Family stages specialize to an affinoid A with a chosen Banach model; its norm unit ball is the integral lattice. It is not identified without proof with every power-bounded element of a nonreduced affinoid.

A normalized analytic chart has coordinates (x−a)/p^h. Its coefficient space is native c₀, represented by ZeroAtInftyContinuousMap. In multiple variables, the coefficients tend to zero outside finite subsets of the multi-index set. Unbounded distributions use the strong dual of the compact-type locally analytic limit, equivalently the appropriate projective limit of stage duals. These nonarchimedean locally convex objects are not obtained by instantiating the ordered-field LocallyConvexSpace class. The Banach-stage dual has bounded coefficient values; it need not be a c₀ space.

An open-disc series satisfies ‖a_n‖R^n→0 for every 0<R<1. An entire series satisfies the same condition for every real R>0. Their Fréchet Gauss topologies, rather than coefficientwise convergence alone, control evaluation and limits. The native PowerSeries and MvPowerSeries carriers, native scalar analytic series, and native polynomial/resultant algebra are reused. The two spaces must not be conflated with restricted radius-one series.

For the transpose derivative use (dμ)(f)=μ(f′), so its Amice multiplier is +log(1+T). Multiplication by x instead gives (1+T)d/dT. Mellin branches use ω(x)^i〈x〉^s with no arithmetic 1−s shift. At odd p the usual generator is 1+p; at p=2 use the imported {±1}×(1+4Z_2) chart and generator 5. Full Q_p-analytic Mellin uses the full character space. F-analytic distributions satisfy the inherited differential relations and use the corresponding F-analytic character subspace.

Complete continuity is the single imported predicate of approximation by maps with finitely generated **A-image**. It is not a finite-K-rank condition when A is infinite-dimensional over K. Operator estimates are measured after restriction of scalars to K. The native Henkel openness and quotient-topology theorems at the Tau Ceti pin are imported; their completeness, first-countability, nonarchimedean and Baire hypotheses are retained.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Native ModuleCat, CochainComplex and Homotopy provide the complex infrastructure. Analytic complexes add norms and continuous degree maps to that infrastructure; they do not define another cochain category. A bounded complex of (Pr) Banach modules can have infinite-rank terms. Its selected finite-slope window is the finite-perfect object.

## Three interfaces that govern the constructions

First, compatible analytic charts give cofinal Banach stages. Compactness supplies a common radius for a finite family of functions. Chart transition maps are bounded only after a permitted radius change. Restriction to smaller discs is approximated by truncating the **destination Taylor expansion** after splitting into residue charts. Truncating source monomials does not yield a uniform tail estimate near a nonzero residue centre. The compact-type duality and completed tensor comparison needed to pass from these stages to global function/distribution spaces are explicit foundational inputs.

Second, vector order is built from the completed projective tensor of Colmez's one-variable C^{r_i} spaces. Rectangular coset masses are bounded separately in every conductor exponent. For r_i<1 the scaled tensor indicator wavelets give both extension and uniqueness, even if Σr_i≥1. Higher separate polynomial degree N_i permits r_i<N_i+1. At equality, d_i^{N_i+1}δ_0 is a nonzero functional annihilating the prescribed polynomial test class, so the strict threshold cannot be removed.

The literal simultaneous first-difference condition in Loeffler arXiv:1304.4042v3, Definition 2.12, pp. 4–5, does not realize its claimed tensor space. For G=Z_p², r=(1/2,0), and f(x₁,x₂)=1_(pZ_p)(x₂), the infimum first-difference valuation at (m₁,0) is zero. The required expression is therefore −m₁/2 along infinitely many tuples, although f is the locally constant tensor 1⊗1_(pZ_p). The packet records this as E3 and proves the intended tensor extension by its wavelet norm. A published correction has not been read; the finding is limited to the hashed arXiv v3.

Third, a compact homotopy endomorphism has a chosen degreewise compact representative. Its auxiliary characteristic series is the finite **nonalternating** product ∏_i det(1−TŨ^i). It depends on that representative. The contractible complex A→A with differential 1 and scalar a in both degrees gives (1−aT)^2, whereas the zero complex gives 1. Finite-slope cohomology, its finite-perfect model and its coherent support are the invariant targets; they cannot be identified with every raw product zero.

For numerical h-slopes, equality is included: the complementary >h summand inverts every eligible polynomial whose eigenvalue roots have valuation **at most h**. In reciprocal Fredholm coordinates these roots have valuation at least −h. A scalar at the endpoint must lie in ≤h. The corrected raising-map formula is: if U_C=r a and f=P(U_C)f with P=XQ, extend by a(Q(U_C)f), whose restriction is U_CQ(U_C)f=f. The raising map is not an endomorphism of C inside the polynomial P.

BCGP25's solid analytic localization is f_*f^*, with affinoid analytic-ring coefficients and an inverse-limit reconstruction of slope bounds. It is stronger than algebraic inversion of the positive monoid. The example Q_p((X)) has X inverted but zero analytic finite-slope localization. This roadmap supplies the compact Banach/complex finite windows and requests the full comparison from the shared Part II foundation. Generic quasi-Stein and Stein predicates and coherent acyclicity are supplied by AdicSpacesPartII R3; density of restrictions alone does not imply their compactness.

## How to read the declaration plan

Each declaration below has its stable packet id, exact mathematical statement, direct prerequisites, proof outline and source locator. Definition and construction entries also give the API derived from the recorded uses and their discriminating unit tests. All entries are unchecked plans. The suggested file gives typed native coefficient, stage-transpose, rectangular-growth and cochain forms where the carriers exist. Global locally analytic strong-dual, completed tensor, analytic sheaf and numerical-root signatures that cannot yet be stated are explicitly listed as omissions, rather than encoded as assumed propositions.

## L0. Analytic Banach stages and strong duals

### Analytic functions on a closed disc

`L0/disc-analytic-functions` · definition.

For a ∈ L and r ∈ ℝ, let B(a, r) = {x ∈ ℂ_p : v_p(x − a) ≥ r}. An(B(a, r), L) is the space of φ(x) = Σ_k a_k(x − a)^k with a_k ∈ L and v_p(a_k) + kr → +∞, with the Gauss valuation v_{B(a,r)}(φ) = inf_k(v_p(a_k) + kr). It is an L-Banach space; v_{B(a,r)} is multiplicative (v(φ₁φ₂) = v(φ₁) + v(φ₂)), equals inf_{x∈B(a,r)} v_p(φ(x)) (maximum principle), and the (x − a)^k/p^{[kr]} form a Banach basis (orthonormal if r ∈ ℤ), so An(B(a, r), L) = L ⊗̂_K An(B(a, r), K) for a closed subfield K ∋ a.

**Hypotheses.** L ⊆ ℂ_p is a closed subfield (a finite extension of ℚ_p in applications), v_p the valuation with v_p(p) = 1, and ℓ(n) the number of base-p digits of n (ℓ(0) = 0).

**Proof outline.** Banach: the coefficient map identifies An(B(a, r), L) with a weighted c₀ space. Multiplicativity (Colmez I.4.2): the Cauchy product gives ≥, and the product of the first coefficients where each valuation is attained gives equality. Maximum principle (I.4.3): after rescaling to the unit disc, a unit-normalised power series has nonzero reduction, which is nonzero at some residue class.

**Uses.** LocallyAnalyticDistributions:L0/locally-analytic-radius: the local pieces of LA_h.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.LocallyAnalytic.discAnalytic` | An(B(a, r), L) with the Gauss valuation. |
| `TauCeti.LocallyAnalytic.gaussVal_mul` | v(φ₁φ₂) = v(φ₁) + v(φ₂). |
| `TauCeti.LocallyAnalytic.gaussVal_eq_inf` | v_{B(a,r)}(φ) = inf_{x∈B(a,r)} v_p(φ(x)). |

**Unit tests.**

- `gaussVal_X` (example): v_{B(0,0)}(x) = 0.
- `gaussVal_restrict_le` (characterisation): Restriction to B(a, r + 1) does not decrease the valuation.
- `geometric_not_closed_disc` (non-example): Σ x^k is not analytic on the closed unit disc.

**Acceptance checks.** φ(x) = x on B(0, 0): v_{B(0,0)}(φ) = 0, attained at the units. Rescaling: v_{B(a, r+1)}(φ) ≥ v_{B(a,r)}(φ), so restriction to a smaller disc is norm-decreasing. Σ x^k (k ≥ 0) is not in An(B(0, 0), ℚ_p): v_p(a_k) + 0·k = 0 does not tend to +∞, although it converges on the open disc.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §I.4.1, Propositions I.4.2 and I.4.3, pp. 13–14. The definition; multiplicativity and the maximum principle follow.

### Locally analytic functions of fixed radius

`L0/locally-analytic-radius` · construction.

For h ∈ ℕ, LA_h(ℤ_p, L) is the space of φ : ℤ_p → L whose restriction to each a + p^hℤ_p is the restriction of some φ_{a,h} ∈ An(B(a, h), L), with v_{LA_h}(φ) = inf_a v_{B(a,h)}(φ_{a,h}) (the infimum may be taken over any set of representatives of ℤ_p/p^h). It is an L-Banach space with orthonormal basis e_{h,n}(x) = 1_{n+p^hℤ_p}(x)·((x + i(n))/p^h)^{m(n)} (n = (m(n) + 1)p^h − i(n), 1 ≤ i(n) ≤ p^h), LA_h(ℤ_p, L) = L ⊗̂_{ℚ_p} LA_h(ℤ_p, ℚ_p), and the inclusions LA_h ⊂ LA_{h+1} are continuous of norm ≤ 1. Since ℤ_p is compact, every locally analytic function lies in some LA_h, and LA(ℤ_p, L) = lim→_h LA_h(ℤ_p, L) carries the locally convex inductive-limit topology.

**Hypotheses.** L ⊆ ℂ_p is a closed subfield (a finite extension of ℚ_p in applications), v_p the valuation with v_p(p) = 1, and ℓ(n) the number of base-p digits of n (ℓ(0) = 0). Tensor products: completed tensor products of L-Banach spaces with orthonormal bases are Colmez §I.1.4 (Proposition I.1.8, Corollary I.1.9), taken as given with the basis description.

**Inputs.** `LocallyAnalyticDistributions:L0/disc-analytic-functions`.

**Proof outline.** Lemma I.4.5: φ_i(x) = φ(−i + p^hx) is analytic on ℤ_p for 1 ≤ i ≤ p^h, and expanding each in powers of x gives the basis e_{h,n} with v_{LA_h}(φ) = inf of the coefficient valuations. Corollary I.4.6 from the basis being defined over ℚ_p. Uniform radius: a locally analytic function is analytic on a neighbourhood of each point; finitely many cosets a + p^{h_a}ℤ_p cover ℤ_p, and h = max h_a works. Continuity of LA_h ⊂ LA_{h+1}: restriction from B(a, h) to B(b, h + 1) with b ≡ a mod p^h does not decrease the Gauss valuation.

**Uses.** LocallyAnalyticDistributions:L0/amice-mahler-basis: Amice's basis of LA_h. LocallyAnalyticDistributions:L0/locally-analytic-distributions: the duals D_h. ModularSymbolsPadicLFunctions:L2/weight-k-distributions: A[p^{−h}] is LA_h.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.LocallyAnalytic.LAh` | LA_h(ℤ_p, L) with v_{LA_h}. |
| `TauCeti.LocallyAnalytic.LAh_mono` | LA_h ⊂ LA_{h+1}, norm-decreasing. |
| `TauCeti.LocallyAnalytic.locallyAnalytic_iff_exists_LAh` | φ is locally analytic iff φ ∈ LA_h for some h. |
| `TauCeti.LocallyAnalytic.LA` | LA(ℤ_p, L) = lim→ LA_h with the inductive-limit topology. |

**Unit tests.**

- `indicator_mem_LAh` (example): 1_{a+p^hℤ_p} ∈ LA_h with valuation 0.
- `LAh_basis_orthonormal` (characterisation): The e_{h,n} are an orthonormal basis.
- `indicator_not_mem_LAh_pred` (non-example): 1_{a+p^hℤ_p} ∉ LA_{h−1}.

**Acceptance checks.** Polynomials lie in LA₀ with v_{LA₀}(P) = inf of the valuations of their coefficients. 1_{a+p^hℤ_p} ∈ LA_h with valuation 0, but it is not in LA_{h−1}. f = Σ_{n≥1} 1_{p^n+p^{2n}ℤ_p} is locally constant on ℤ_p ∖ {0} but not continuous at 0 (f(p^n) = 1, f(0) = 0), so it is not locally analytic: local analyticity needs a positive radius at every point, including 0.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §I.4.2, Remark I.4.4, Lemma I.4.5, Corollary I.4.6, pp. 14–15. LA_h and the inductive limit. [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Definition 3.40 and the description of C^{n−an}, p. 24. The same spaces in RJW's notation.

### Amice's theorem on Mahler coefficients

`L0/amice-mahler-basis` · theorem.

For every h ∈ ℕ, the functions [n/p^h]!·C(x, n) (n ∈ ℕ) form an orthonormal basis of LA_h(ℤ_p, L). Consequently a continuous φ with Mahler coefficients a_n(φ) is locally analytic if and only if lim inf_n v_p(a_n(φ))/n > 0; if φ ∈ LA_h then lim inf v_p(a_n(φ))/n ≥ 1/((p − 1)p^h).

**Hypotheses.** L ⊆ ℂ_p is a closed subfield (a finite extension of ℚ_p in applications), v_p the valuation with v_p(p) = 1, and ℓ(n) the number of base-p digits of n (ℓ(0) = 0). Mahler's theorem (the C(x, n) are an orthonormal basis of C⁰(ℤ_p, L)) is Mathlib's PadicInt.mahlerEquiv.

**Inputs.** `LocallyAnalyticDistributions:L0/locally-analytic-radius`, `mathlib:PadicInt.mahlerEquiv`.

**Proof outline.** Amice's theorem is proved in Colmez §I.4.3 through the polynomials g_{n,j} of Lemma I.4.9 (reduction mod p comparison of the two bases). Corollary I.4.8: v_p([n/p^h]!) = n/((p − 1)p^h) + O(log n), so the coefficients of φ ∈ LA_h in the Mahler basis decay at that rate; conversely a positive lim inf gives some h with ([n/p^h]!)^{−1}a_n(φ) → 0.

**Acceptance checks.** h = 0: [n]! C(x, n) = x(x − 1)⋯(x − n + 1) is the falling factorial, of valuation 0 in LA₀ (a polynomial with unit leading coefficient). C(x, p^k) has v_{LA_h} = −v_p((p^{k−h})!) = −(p^{k−h} − 1)/(p − 1) for k ≥ h: large Mahler basis vectors are large in LA_h. The continuous function with Mahler coefficients a_n = p^{ℓ(n)} (so v_p(a_n)/n → 0) is not locally analytic.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), Theorem I.4.7 and Corollary I.4.8, p. 15. Theorem I.4.7 follows.

### The locally analytic topology is finer

`L0/locally-analytic-topology` · lemma.

The inclusion LA(ℤ_p, L) ⊂ C⁰(ℤ_p, L) is continuous with dense image (locally constant functions are dense in C⁰), but the inductive-limit topology on LA(ℤ_p, L) is strictly finer than the topology induced from C⁰. Equality of the underlying functions is not equality of their topologies: a sequence of locally analytic functions converging uniformly need not converge in LA(ℤ_p, L).

**Hypotheses.** L ⊆ ℂ_p is a closed subfield (a finite extension of ℚ_p in applications), v_p the valuation with v_p(p) = 1, and ℓ(n) the number of base-p digits of n (ℓ(0) = 0).

**Inputs.** `LocallyAnalyticDistributions:L0/locally-analytic-radius`, `LocallyAnalyticDistributions:L0/amice-mahler-basis`.

**Proof outline.** Continuity: v_{C⁰}(φ) ≥ v_{LA_h}(φ) on each LA_h (maximum principle). Density: locally constant functions are locally analytic and dense in C⁰ (Colmez Lemma I.3.1). Strictness: f_n = p^n C(x, p^{2n}) → 0 in C⁰ (v_{C⁰}(f_n) = n), but by Amice's basis v_{LA_h}(f_n) = n − (p^{2n−h} − 1)/(p − 1) → −∞ for every h, while a convergent sequence in the compact-type inductive limit lies in, and converges in, a single LA_h.

**Acceptance checks.** The locally constant function 1_{a+p^nℤ_p} has C⁰-valuation and LA_n-valuation both 0. f_n = p^n C(x, p^{2n}) is the separating sequence above. The C⁰-closure of LA(ℤ_p, L) is all of C⁰, so LA(ℤ_p, L) is not closed in C⁰.

**Sources.** [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Remark 3.41, p. 24. Remark 3.41; density is stated there as well.

### Locally analytic distributions

`L0/locally-analytic-distributions` · definition.

D(ℤ_p, L) is the space of continuous linear forms on LA(ℤ_p, L), i.e. of linear forms whose restriction to every LA_h is continuous. With the valuations v_{LA_h}(μ) = inf_{φ≠0}(v_p(μ(φ)) − v_{LA_h}(φ)) it is a Fréchet space, equal as a topological vector space to the projective limit lim← D_h of the Banach duals D_h = LA_h(ℤ_p, L)′ (which is also its strong dual topology). Restricting a bounded measure to LA(ℤ_p, L) gives an injective continuous map M(ℤ_p, L) → D(ℤ_p, L), by density of LA in C⁰.

**Hypotheses.** L ⊆ ℂ_p is a closed subfield (a finite extension of ℚ_p in applications), v_p the valuation with v_p(p) = 1, and ℓ(n) the number of base-p digits of n (ℓ(0) = 0). Bounded measures M(ℤ_p, L) = C⁰(ℤ_p, L)′ are PadicMeasuresIwasawaAlgebras' objects (its L0). That the projective-limit topology equals the strong dual topology uses the open mapping theorem for compact-type limits (Schneider–Teitelbaum, via [GKPS]); only the projective-limit description is used below.

**Inputs.** `LocallyAnalyticDistributions:L0/locally-analytic-radius`, `LocallyAnalyticDistributions:L0/locally-analytic-topology`, `PadicMeasuresIwasawaAlgebras:L0`.

**Proof outline.** The dual of an inductive limit of Banach spaces is the projective limit of the duals as vector spaces; the valuations v_{LA_h} are the dual norms. Injectivity of M → D: a measure vanishing on the dense subspace LA(ℤ_p, L) vanishes.

**Uses.** LocallyAnalyticDistributions:L1/amice-transform: the domain of the Amice transform. LocallyAnalyticDistributions:L2/order-r-distributions: the ambient space of distributions of order r. ModularSymbolsPadicLFunctions:L2/weight-k-distributions: the spaces D(ℤ_p), D[r] requested there.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.LocallyAnalytic.Dist` | D(ℤ_p, L), the continuous dual of LA(ℤ_p, L). |
| `TauCeti.LocallyAnalytic.Dist.valLAh` | The Fréchet valuations v_{LA_h}. |
| `TauCeti.LocallyAnalytic.measureToDist` | M(ℤ_p, L) → D(ℤ_p, L), restriction. |
| `TauCeti.LocallyAnalytic.measureToDist_injective` | The restriction map is injective. |

**Unit tests.**

- `dirac_mem` (example): δ_a is a distribution.
- `measureToDist_injective` (characterisation): Measures embed in distributions.
- `derivative_at_zero_not_measure` (non-example): φ ↦ φ′(0) is a distribution but not a measure.

**Acceptance checks.** The Dirac mass δ_a (φ ↦ φ(a)) is a measure, hence a distribution. φ ↦ φ′(0) is a distribution (continuous on each LA_h by Colmez Lemma II.4.2) that is not a measure: it is unbounded on the unit ball of C⁰. A linear form on LA(ℤ_p, L) that is continuous for the C⁰ topology is a measure; a linear form continuous on each LA_h need not be.

**Sources.** [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Definition 3.42 and Remark 3.44, pp. 24–25. Definition 3.42. [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.2 opening, pp. 29–30. The same definition with the Fréchet valuations.

### F-analytic against ℚ_p-analytic functions

`L0/field-analytic-functions` · lemma.

Let F/ℚ_p be finite, 𝒪 = 𝒪_F viewed both as a locally F-analytic group G and, by restriction of scalars, as a locally ℚ_p-analytic group G₀ of dimension [F : ℚ_p], and K ⊆ ℂ_p complete containing F. The inclusion C^an(G, K) ⊂ C^an(G₀, K) identifies the F-analytic functions with the closed subspace of ℚ_p-analytic f satisfying the Cauchy–Riemann equations (tx)f = t·(xf) for x in the Lie algebra and t ∈ F, and is a homeomorphism onto this image. Dually D(G₀, K) → D(G, K) is a surjective quotient map of Fréchet algebras. A locally ℚ_p-analytic character χ of G₀ is F-analytic exactly when dχ is F-linear.

**Hypotheses.** Schneider–Teitelbaum work with a commutative locally F-analytic group; only G = 𝒪_F is used here.

**Inputs.** `LocallyAnalyticDistributions:L0/locally-analytic-radius`.

**Proof outline.** Lemma 1.1: comparing the expansions of f in canonical coordinates, the Cauchy–Riemann equations force the coefficients to come from a single power series in F-coordinates. Lemma 1.2: reduce to compact G, where the map is a compact inductive limit of isometries of Banach spaces. The dual map is surjective by Hahn–Banach for spaces of countable type and a quotient map by the open mapping theorem; Lemma 1.3 is the character case.

**Acceptance checks.** F = ℚ_p: the two notions coincide. F/ℚ_p quadratic Galois with nontrivial σ: x ↦ σ(x) is ℚ_p-linear, hence ℚ_p-analytic, but dσ is not F-linear, so it is not F-analytic. The F-analytic characters of 𝒪_F form a one-dimensional family (Schneider–Teitelbaum's character variety), while the ℚ_p-analytic ones form a [F : ℚ_p]-dimensional family.

**Sources.** [p-adic Fourier theory](https://arxiv.org/pdf/math/0102012v1), Introduction, p. 1, and Lemmas 1.1–1.3, pp. 3–5. Their L is our F; Lemmas 1.1–1.3 give the details.

### Strict sequences and left-heart extensions

`L0/strict-sequence-comparison` · comparison.

For Hausdorff nonarchimedean locally convex K-spaces, a sequence 0→V₁→V→V₂→0 is strictly exact precisely when the first map identifies V₁ with the closed kernel of the second and the second induces the quotient topology. Such a sequence determines an exact sequence in the left heart. Conversely, an extension in the left heart whose middle object is a genuine space has this description. The left heart and its embedding are imported foundations, not a new category defined here.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `tauceti:TauCeti.HasZeroSequenceOfUnits.isQuotientMap`.

**Proof outline.** Use the kernel with its induced topology and the Hausdorff cokernel with its quotient topology. Apply the shared quasi-abelian strict-morphism/left-heart comparison; that exact-category infrastructure is an explicit gap until the Part II proposal is implemented.

**Acceptance checks.** The split sequence K→K²→K has its ordinary product and quotient topologies. Algebraic exactness alone does not assert quotient topology.

**Sources.** [On the cohomology of p-adic analytic spaces, II: The C_st-conjecture](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Appendix A, Lemmas A.1–A.4 and Remark A.6, printed pp. 58–59. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Extensions of Banach spaces

`L0/banach-three-space` · theorem.

An exact extension in the left heart of Hausdorff locally convex K-spaces with Banach outer terms is represented by a Banach middle term. K is a complete nonarchimedean field. No splitting hypothesis is required.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L0/strict-sequence-comparison`.

**Proof outline.** Apply CN Lemma A.1: bounded lattices in the two outer terms give a bounded neighborhood lattice in the middle. Use the strict extension to show this lattice absorbs and separates points, then completeness of the ends to establish completeness of the resulting equivalent norm. Record the left-heart representation step as a foundational input.

**Acceptance checks.** A non-split extension is still Banach.

**Sources.** [On the cohomology of p-adic analytic spaces, II: The C_st-conjecture](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Appendix A, Lemma A.1, printed p. 58. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Splitting under spherical completeness or separability

`L0/banach-splitting` · theorem.

In the preceding Banach extension a continuous K-linear section of V→V₂ exists if K is spherically complete or if both outer Banach spaces have a dense subspace of countable K-dimension. The disjunction is essential to the source statement.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L0/banach-three-space`, `PadicDifferentialEquationsAndRigidCohomology:RD.5/nonarchimedean-hahn-banach`.

**Proof outline.** In the spherically complete case use the imported nonarchimedean Hahn–Banach splitting argument. In the separable case identify the quotient with a countable orthonormal model up to equivalent norm and lift its basis with bounded norms; sum the lifted coefficients. The orthonormal-basis existence and bounded-lift estimate in this generality remain named proof inputs.

**Acceptance checks.** The hypothesis is not replaced by spherical completeness of C_p. Finite-dimensional outer terms satisfy the separability alternative.

**Sources.** [On the cohomology of p-adic analytic spaces, II: The C_st-conjecture](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Appendix A, Lemma A.2, printed p. 58. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Extensions of Fréchet spaces

`L0/frechet-three-space` · theorem.

An exact left-heart extension with Fréchet outer terms is represented by a Fréchet middle term over a complete nonarchimedean K. This result makes no assertion of a continuous splitting.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L0/strict-sequence-comparison`, `LocallyAnalyticDistributions:L0/banach-three-space`.

**Proof outline.** Choose countable defining systems of seminorms on the outer terms and the compatible quotient neighborhoods used in CN Lemma A.3. The induced countable family on the middle term makes it metrizable; completeness follows by lifting a Cauchy sequence and correcting its errors inside the complete kernel. The foundational left-heart comparison is retained as an input.

**Acceptance checks.** A Fréchet conclusion is weaker than a section of the quotient map.

**Sources.** [On the cohomology of p-adic analytic spaces, II: The C_st-conjecture](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Appendix A, Lemma A.3, printed p. 58. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Extensions of spaces of compact type

`L0/compact-type-three-space` · theorem.

An exact left-heart extension with compact-type outer terms has compact-type middle term if K is spherically complete or both outer terms are separable. Compact type means a countable inductive limit of Banach spaces with injective compact transition maps, with its locally convex limit topology.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L0/strict-sequence-comparison`, `LocallyAnalyticDistributions:L0/frechet-three-space`, `LocallyAnalyticDistributions:L0/banach-splitting`.

**Proof outline.** Follow CN Lemma A.4 by dualizing to nuclear Fréchet spaces, applying the cited extension theorem there, and dualizing back. The vanishing of Ext¹ for the separated compact-type terms and reflexivity are required, not consequences of an arbitrary algebraic extension. Record CN’s cited Lemma 2.5 of Colmez–Gilles–Nizioł and Dierolf–Roelcke Proposition 3.8 as unread proof-closure inputs.

**Acceptance checks.** The field/separability alternative is retained. The derivative example below prohibits deducing a section from compact type.

**Sources.** [On the cohomology of p-adic analytic spaces, II: The C_st-conjecture](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Appendix A, Lemma A.4, printed pp. 58–59. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Analytic functions on finitely many polydiscs

`L0/multivariable-fixed-radius` · construction.

For a finite clopen chart set S and coordinates z∈Z_p^d, the radius-h analytic stage is the finite product over S of restricted power series in normalized coordinates (z−a)/p^h. Coefficients tend to zero outside finite subsets of N^d; the norm is the maximum coefficient norm. Its coefficient model is native c₀(S×N^d,K). The chart realization, rather than a second power-series carrier, identifies this with actual functions.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L0/disc-analytic-functions`, `mathlib:ZeroAtInftyContinuousMap`.

**Proof outline.** Apply the one-variable Gauss construction in each coordinate; finite products preserve completeness. Unconditional nonarchimedean summation gives evaluation and uniqueness of coefficients. Use native multivariate formal series when manipulating coefficients.

**Uses.** Chart independence and compact restriction: Coefficient bounds reduce to native c₀ norms. Urban Definition 3.4.10: The same coefficient model works with affinoid coefficients.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.AnalyticDistributions.analyticStage` | The normalized coefficient Banach model c₀(S×N^d,K). |
| `TauCeti.AnalyticDistributions.analyticStage_ext` | Equality is coefficientwise equality. |
| `TauCeti.AnalyticDistributions.analyticStage_single` | A monomial on one chart has its specified single coefficient. |

**Unit tests.**

- `AnalyticDistributionTests.analyticStage_point` (compatibility): For S and N^0 both singleton, evaluation at the unique index is a continuous linear isometry to K.
- `AnalyticDistributionTests.analyticStage_empty` (degenerate): The empty chart set gives the zero space.
- `AnalyticDistributionTests.analyticStage_geometric_excluded` (non-example): The coefficient family constantly 1 in positive dimension is not a radius-h analytic stage element.

**Acceptance checks.** Dimension zero on one chart gives K.

**Sources.** [p-adic Fourier theory](https://arxiv.org/pdf/math/0102012v1), §1, Lemmas 1.1–1.2 and Proposition 1.4, printed pp. 3–6. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Compact restriction to a smaller radius

`L0/radius-restriction-compact` · lemma.

For finite p-adic charts, restriction from analytic radius h to radius h+1 is a continuous injective K-linear map and is completely continuous. After splitting into the finitely many smaller residue charts, the omitted destination Taylor coefficients of total degree≥N contribute at most C|p|^N; C depends only on the fixed normalization.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L0/multivariable-fixed-radius`, `LocallyAnalyticDistributions:L4/completely-continuous`.

**Proof outline.** Expand (b+pz)^α by integral binomial coefficients in each coordinate. Truncate the destination Taylor coefficients at total degree N. Expanding around the finitely many residue centers gives bounded coefficient functionals on the source and finite-rank output approximants. The destination Taylor tail acquires a factor |p|^N even at nonzero residue centers. Injectivity follows from coefficient uniqueness on any sufficiently small open subdisc.

**Acceptance checks.** For K〈T〉→K〈T/p〉, T^n maps to p^n(T/p)^n.

**Sources.** [p-adic Fourier theory](https://arxiv.org/pdf/math/0102012v1), §1, Lemmas 1.1–1.2 and Proposition 1.4, printed pp. 3–6. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### A common analytic radius on a compact manifold

`L0/compact-uniform-radius` · lemma.

Every locally Q_p-analytic function on a compact finite-dimensional p-adic analytic manifold belongs to a finite-chart analytic stage at one common radius. Every finite family of such functions belongs to a common stage.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L0/multivariable-fixed-radius`, `LocallyAnalyticDistributions:L0/locally-analytic-radius`.

**Proof outline.** Take the finitely many chart neighborhoods from compactness. Refine them to disjoint clopen polydiscs and shrink all radii to a common integer h. For a finite family use the largest of its finitely many required radii.

**Acceptance checks.** Compactness is used; on a noncompact union of discs the required radii may be unbounded.

**Sources.** [p-adic Fourier theory](https://arxiv.org/pdf/math/0102012v1), §1, Lemmas 1.1–1.2 and Proposition 1.4, printed pp. 3–6. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Continuity of analytic chart pullback

`L0/analytic-chart-pullback` · lemma.

An analytic map between finite-chart compact p-adic manifolds induces continuous pullback on locally analytic functions. On any fixed target Banach stage, it factors through a sufficiently small source Banach stage by bounded multivariate substitution. Radii may change.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L0/multivariable-fixed-radius`, `LocallyAnalyticDistributions:L0/compact-uniform-radius`.

**Proof outline.** Use the coordinate power series of the map, shrinking source discs so its images lie in the target discs and its normalized coordinate norms are ≤1. Bound substitutions by the target Gauss norm and combine the finitely many chart bounds. Pass to the locally convex inductive limit. The native locally analytic manifold/cofinal-stage interface is recorded as a gap.

**Acceptance checks.** A constant map pulls back a function to its value. A map need not preserve the originally chosen radius.

**Sources.** [p-adic Fourier theory](https://arxiv.org/pdf/math/0102012v1), §1, Lemmas 1.1–1.2 and Proposition 1.4, printed pp. 3–6. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Independence of the analytic atlas

`L0/chart-independence` · lemma.

Two finite analytic chart systems on the same compact p-adic manifold give canonically isomorphic locally analytic spaces with the same locally convex topology. The identity on functions gives a continuous K-linear equivalence.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L0/analytic-chart-pullback`, `LocallyAnalyticDistributions:L0/compact-uniform-radius`.

**Proof outline.** Apply chart pullback to the analytic transition maps on a finite common clopen refinement. Each Banach stage in either system maps continuously into a sufficiently small stage in the other. The two continuous limit maps are inverse because they are the identity on actual functions.

**Acceptance checks.** Reindexing or translating a chart does not change the limit topology.

**Sources.** [p-adic Fourier theory](https://arxiv.org/pdf/math/0102012v1), §1, Lemmas 1.1–1.2 and Proposition 1.4, printed pp. 3–6. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Products and completed analytic tensors

`L0/product-analytic-tensor` · comparison.

For compact p-adic analytic X,Y over a finite extension K/Q_p, the external product induces LA(X,K)⊗̂_ι LA(Y,K)≃LA(X×Y,K); at fixed finite-chart stages the corresponding Banach projective tensor identifies c₀(I,K)⊗̂_π c₀(J,K) with c₀(I×J,K). The inductive and projective completion symbols are distinct until their required compact-type comparison is proved.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L0/multivariable-fixed-radius`, `LocallyAnalyticDistributions:L0/radius-restriction-compact`, `LocallyAnalyticDistributions:L0/chart-independence`.

**Proof outline.** At fixed stages send basis tensors e_i⊗e_j to e_(i,j); finite rectangles are dense in the product-index c₀ space. Pass through cofinal product radius systems using the compact-type completed inductive tensor theorem. Do not apply Kohlhaase Proposition 1.2 for strict LF spaces to an arbitrary compact-type system; that limit/tensor comparison is an explicit proof gap.

**Acceptance checks.** For a point Y the tensor is LA(X,K). The polynomial x·y is the external product of the two coordinate functions.

**Sources.** [p-adic Fourier theory](https://arxiv.org/pdf/math/0102012v1), §1, Lemmas 1.1–1.2 and Proposition 1.4, printed pp. 3–6. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Strong duality for analytic compact-type spaces

`L0/compact-type-dual-reflexivity` · comparison.

Over finite K/Q_p, LA(X,K) for compact analytic X is of compact type; its strong continuous dual is a nuclear Fréchet space identified with the projective limit of the Banach-stage duals, and the canonical strong bidual map is an isomorphism.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L0/radius-restriction-compact`, `LocallyAnalyticDistributions:L0/chart-independence`, `LocallyAnalyticDistributions:L0/locally-analytic-distributions`.

**Proof outline.** Use compactness and injectivity of the stage restrictions. Apply the compact-type/strong-dual anti-equivalence with nuclear Fréchet spaces and its reflexivity theorem. Import that general functional analysis from the shared Part II proposal; no ordered-field LocallyConvexSpace instance is used for K.

**Acceptance checks.** Point distributions separate analytic functions. This is a strong-dual statement, not a weak-star completion.

**Sources.** [p-adic Fourier theory](https://arxiv.org/pdf/math/0102012v1), §1, Lemmas 1.1–1.2 and Proposition 1.4, printed pp. 3–6. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

## L1. Unbounded Amice and distribution operations

### The Amice transform of distributions

`L1/amice-transform` · theorem.

For μ ∈ D(ℤ_p, L) let A_μ(T) = ∫(1 + T)^x μ(x) = Σ_n T^n ∫C(x, n)μ ∈ L⟦T⟧. Then μ ↦ A_μ is an isomorphism of Fréchet spaces from D(ℤ_p, L) onto R⁺, the power series converging on the open unit disc v_p(T) > 0 with the valuations v_{B(0,u_h)}, u_h = 1/((p − 1)p^h). Precisely, v_{B(0,u_h)}(A_μ) ≥ v_{LA_h}(μ) ≥ v_{B(0,u_{h+1})}(A_μ) − 1. Moreover ∫(1 + z)^x μ = A_μ(z) for v_p(z) > 0, and on bounded measures A_μ is the bounded Amice (Mahler) transform, so D ⊃ M corresponds to R⁺ ⊃ 𝒪_L⟦T⟧ ⊗ L.

**Hypotheses.** L ⊆ ℂ_p is a closed subfield (a finite extension of ℚ_p in applications), v_p the valuation with v_p(p) = 1, and ℓ(n) the number of base-p digits of n (ℓ(0) = 0). The bounded transform on measures is PadicMeasuresIwasawaAlgebras' (its L2 nodes, e.g. bounded-inverse-amice).

**Inputs.** `LocallyAnalyticDistributions:L0/locally-analytic-distributions`, `LocallyAnalyticDistributions:L0/amice-mahler-basis`, `PadicMeasuresIwasawaAlgebras:L2/bounded-inverse-amice`, `PadicMeasuresIwasawaAlgebras:L2/amice-dirac-natural`.

**Proof outline.** Lemma II.2.1: for v_p(z) > u_h, Σ C(x, n)z^n converges to (1 + z)^x in LA_h, since z^n/[n/p^h]! → 0. Bounds: v_p(b_n) ≥ v_{LA_h}(μ) + v_{LA_h}(C(x, n)) = v_{LA_h}(μ) − v_p([n/p^h]!) ≥ v_{LA_h}(μ) − nu_h (Amice's basis), so A_μ converges on B(0, u_h⁺); conversely, for f = Σb_nT^n ∈ R⁺, v_p([n/p^h]! b_n) ≥ v_{B(0,u_{h+1})}(f) − 1 → +∞ defines μ by ∫φ μ = Σ b_n a_n(φ). Compatibility with measures: both transforms are Σ T^n ∫C(x, n)μ.

**Acceptance checks.** A_{δ_a} = (1 + T)^a. log(1 + T) ∈ R⁺ is the transform of the derivative of δ₀ (φ ↦ φ′(0)), a distribution that is not a measure (log(1 + T) has unbounded coefficients). Σ_n p^{−n}T^n converges only for v_p(T) > 1, not on the whole open unit disc, so it is the transform of no distribution.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), Lemma II.2.1 and Theorem II.2.2, p. 30. Theorem II.2.2. [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Theorem 3.43 and (3.12), p. 25. RJW Theorem 3.43, the stage's reference; RJW's proof cites Colmez.

### Operations on distributions

`L1/distribution-operations` · theorem.

The bounded toolbox extends continuously to D(ℤ_p, L), with the following Amice transforms (∂ = (1 + T)d/dT). Dirac masses: A_{δ_a} = (1 + T)^a, and the span of Dirac masses at natural numbers is dense. Multiplication by a locally analytic function; in particular A_{xμ} = ∂A_μ and A_{z^xμ}(T) = A_μ((1 + T)z − 1) for v_p(z − 1) > 0. Restriction to b + p^nℤ_p: A_{Res μ}(T) = p^{−n}Σ_{η∈μ_{p^n}} η^{−b}A_μ((1 + T)η − 1). Derivative (∫φ dμ = ∫φ′μ): A_{dμ} = log(1 + T)·A_μ. σ_a (a ∈ ℤ_p^×), φ and ψ: A_{σ_aμ} = A_μ((1 + T)^a − 1), A_{φμ} = A_μ((1 + T)^p − 1), A_{ψμ} = ψ(A_μ), with ψφ = id, σ_a commuting with φ and ψ, ψ(μ) = 0 iff μ is supported on ℤ_p^×, and Res_{ℤ_p^×} = 1 − φψ. Convolution: A_{λ∗μ} = A_λA_μ.

**Hypotheses.** L ⊆ ℂ_p is a closed subfield (a finite extension of ℚ_p in applications), v_p the valuation with v_p(p) = 1, and ℓ(n) the number of base-p digits of n (ℓ(0) = 0). The bounded versions of these operations are PadicMeasuresIwasawaAlgebras L2 (restriction, φ, ψ, weights); here they are extended by continuity along the Amice isomorphism.

**Inputs.** `LocallyAnalyticDistributions:L1/amice-transform`, `PadicMeasuresIwasawaAlgebras:L2/phi-measure`, `PadicMeasuresIwasawaAlgebras:L2/psi-measure`, `PadicMeasuresIwasawaAlgebras:L2/amice-weight`, `PadicMeasuresIwasawaAlgebras:L2/amice-phi`.

**Proof outline.** Each identity is checked on (1 + T)^x, i.e. on Dirac masses at natural numbers, and extended by density and continuity (the maps are continuous on each LA_h, e.g. by Colmez Lemma II.4.2 for derivatives). Restriction uses 1_{b+p^nℤ_p}(x) = p^{−n}Σ_η η^{x−b}. Convolution: ∫(∫φ(x + y)λ(x))μ(y) converges by expanding φ(x + y) around x₀ with the bounds of Lemma II.4.2; on z^x it gives A_λ(z)A_μ(z).

**Acceptance checks.** μ = δ₀: xδ₀ = 0 and ∂1 = 0. ψ(δ₁) = 0 (δ₁ is supported on units) and φ(δ₁) = δ_p. There is no primitive of distributions in general: it would divide A_μ by log(1 + T), which has infinitely many zeros ζ − 1 (ζ ∈ μ_{p^∞}) in the open disc.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.4.1–II.4.6, pp. 34–37. Multiplication by x; the other operations follow in §II.4.

### Division by x, primitives and logarithmic factors

`L1/division-by-x-and-primitives` · lemma.

(1) Division by x on D(ℤ_p, L) is defined only up to adding a multiple of δ₀: A_{x^{−1}μ} is a primitive of (1 + T)^{−1}A_μ. For μ supported on ℤ_p^× there is a unique x^{−1}μ supported on ℤ_p^×, without using any global function x^{−1} on ℤ_p. (2) For n ∈ ℕ, b ∈ ℤ_p and k ∈ ℤ, ∫_{b+p^nℤ_p} x^k μ = p^{−n}Σ_{η∈μ_{p^n}} η^{−b}(∂^kA_μ)(η − 1) whenever k ≥ 0, or k ≤ −1 and b ∉ p^nℤ_p. For k ≤ −1, ∂^kA_μ = ∂^{−|k|}A_μ is determined only up to a polynomial of degree ≤ |k| − 1 in log(1 + T), and the right side does not depend on this choice because log η = 0 for η ∈ μ_{p^n} and Σ_η η^{−b} = 0 for b ∉ p^nℤ_p. (3) On a function side, d/dx : C^r(ℤ_p, L) → C^{r−1}(ℤ_p, L) is surjective for r ≥ 1 with kernel the closure of the locally constant functions: primitives exist and are unique only up to adding a function in that closure, not up to a single global constant.

**Hypotheses.** L ⊆ ℂ_p is a closed subfield (a finite extension of ℚ_p in applications), v_p the valuation with v_p(p) = 1, and ℓ(n) the number of base-p digits of n (ℓ(0) = 0). C^r and its Banach basis are L2/c-r-functions; the integral (bounded) unit-support division is PadicMeasuresIwasawaAlgebras L2/inverse-mahler-unique.

**Inputs.** `LocallyAnalyticDistributions:L1/distribution-operations`, `LocallyAnalyticDistributions:L2/c-r-functions`, `PadicMeasuresIwasawaAlgebras:L2/inverse-mahler-unique`.

**Proof outline.** (1) Division by x inverts multiplication by x, i.e. ∂; the constant of integration is the ambiguity δ₀. If ψ(μ) = 0, the primitive G with ψ(G) = 0 is unique (as in the bounded case). (2) From the restriction formula and A_{x^kμ} = ∂^kA_μ; the independence is the stated vanishing of log η and of the character sum. (3) d/dx maps the wavelet basis e_{i,k,r} to k·e_{i,k−1,r−1} (Colmez Proposition I.5.16).

**Acceptance checks.** μ = δ₁: x^{−1}δ₁ = δ₁, and ∫_{1+pℤ_p} x^{−1}δ₁ = 1. For k = −1 and b ∈ pℤ_p the formula is not asserted: x^{−1} has a pole on b + p^nℤ_p ∋ 0. x ↦ 1_{pℤ_p}(x) has derivative 0 but is not constant: the kernel of d/dx is the closure of the locally constant functions, so 'the' primitive is not unique up to a constant.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.4.2 (division par x), Proposition II.4.1, and Proposition I.5.16, pp. 24 and 35. The cancellation of logarithmic ambiguities at p-power roots of unity.

### Open-disc series and the native analytic radius

`L1/open-disc-native-radius` · comparison.

For an open-disc series F, the native scalar formal multilinear series ofScalars(K,coeff(F)) has radius at least 1. E(F,t) is therefore the sum of this native analytic series on ||t||<1. This is an adapter between two existing library encodings, not a second definition of summation or of analyticity.

**Hypotheses.** K is a finite extension of Q_p with its normalized nonarchimedean absolute value; the elementary series lemmas also hold over any complete nontrivially normed ultrametric field. An open-disc series F means a native power series with ||a_n|| R^n tending to zero for every real 0<R<1. Write E(F,t) for the native FormalMultilinearSeries.ofScalarsSum of its coefficients; analytic uses require ||t||<1. No convergence claim is made at ||t||=1.

**Inputs.** `LocallyAnalyticDistributions:L1/amice-transform`, `mathlib:PowerSeries.isRestricted_iff'`, `mathlib:FormalMultilinearSeries.ofScalars`, `mathlib:FormalMultilinearSeries.ofScalars_norm`, `mathlib:FormalMultilinearSeries.le_radius_of_bound`, `mathlib:FormalMultilinearSeries.ofScalars_sum_eq`.

**Proof outline.** For each 0<S<1, the native restrictedness criterion makes ||a_n||S^n bounded. The native ofScalars_norm identifies the multilinear coefficient norm with ||a_n||. Apply le_radius_of_bound at S. Take the supremum over S<1 to obtain radius at least 1. The native ofScalars_sum_eq identifies the scalar sums.

**Acceptance checks.** For F=1/(1−T) in the formal sense, the radius is 1, not infinity. Polynomial series have the same evaluation as their native polynomial evaluation.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.2, Lemma II.2.1 and Theorem II.2.2 with proofs, author PDF p. 30. Worker decomposition of the evaluation and radius estimates used here; the source does not assign separate numbers to these elementary adapters.

### Summability inside the open disc

`L1/open-disc-summability` · lemma.

For every open-disc series F and t∈K with ||t||<1, the series Σ_n a_n t^n is summable in K.

**Hypotheses.** K is a finite extension of Q_p with its normalized nonarchimedean absolute value; the elementary series lemmas also hold over any complete nontrivially normed ultrametric field. An open-disc series F means a native power series with ||a_n|| R^n tending to zero for every real 0<R<1. Write E(F,t) for the native FormalMultilinearSeries.ofScalarsSum of its coefficients; analytic uses require ||t||<1. No convergence claim is made at ||t||=1.

**Inputs.** `LocallyAnalyticDistributions:L1/amice-transform`, `mathlib:PowerSeries.isRestricted_iff'`, `mathlib:NonarchimedeanGroup.multipliable_of_tendsto_cofinite_one`.

**Proof outline.** Choose real S with ||t||<S<1. The term norms are bounded by ||a_n||S^n (||t||/S)^n and tend to zero. Apply the native complete nonarchimedean summability criterion, with the natural cofinite filter equal to the at-top filter.

**Acceptance checks.** The geometric series sums at every ||t||<1. At t=1 its terms do not tend to zero, so the open-disc hypothesis on t is essential.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.2, Lemma II.2.1 and Theorem II.2.2 with proofs, author PDF p. 30. Worker decomposition of the evaluation and radius estimates used here; the source does not assign separate numbers to these elementary adapters.

### Uniform geometric tails on a smaller disc

`L1/open-disc-uniform-tail` · lemma.

Let 0<R<S<1, M≥0, and ||a_n||S^n≤M for every n. For ||t||≤R and N≥0, ||E(F,t)−Σ_{n<N}a_n t^n||≤M(R/S)^N. Thus truncations converge uniformly on the closed radius-R disc; this is a coefficient estimate, with no compactness assumption on that disc.

**Hypotheses.** K is a finite extension of Q_p with its normalized nonarchimedean absolute value; the elementary series lemmas also hold over any complete nontrivially normed ultrametric field. An open-disc series F means a native power series with ||a_n|| R^n tending to zero for every real 0<R<1. Write E(F,t) for the native FormalMultilinearSeries.ofScalarsSum of its coefficients; analytic uses require ||t||<1. No convergence claim is made at ||t||=1.

**Inputs.** `LocallyAnalyticDistributions:L1/open-disc-summability`.

**Proof outline.** Use open-disc-summability to identify the remainder with the tail starting at N. Every tail term has norm at most M(R/S)^n≤M(R/S)^N. The ultrametric inequality passes the bound from finite tail sums to their limit.

**Acceptance checks.** N=0 bounds the whole value by M. For F=T^N the coefficient tail starts exactly at N.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.2, Lemma II.2.1 and Theorem II.2.2 with proofs, author PDF p. 30. Worker decomposition of the evaluation and radius estimates used here; the source does not assign separate numbers to these elementary adapters.

### Analytic evaluation of an open-disc series

`L1/open-disc-evaluation-analytic` · theorem.

For every open-disc series F, the function E(F,−):K→K is analytic at every t with ||t||<1, using Mathlib’s AnalyticOnNhd. This does not identify an arbitrary function on C_p-valued points with a rigid analytic function.

**Hypotheses.** K is a finite extension of Q_p with its normalized nonarchimedean absolute value; the elementary series lemmas also hold over any complete nontrivially normed ultrametric field. An open-disc series F means a native power series with ||a_n|| R^n tending to zero for every real 0<R<1. Write E(F,t) for the native FormalMultilinearSeries.ofScalarsSum of its coefficients; analytic uses require ||t||<1. No convergence claim is made at ||t||=1.

**Inputs.** `LocallyAnalyticDistributions:L1/open-disc-native-radius`, `mathlib:FormalMultilinearSeries.analyticOnNhd`.

**Proof outline.** Use open-disc-native-radius and the native FormalMultilinearSeries.analyticOnNhd theorem. The open unit disc lies in the extended-metric ball of the native radius. Restrict the native theorem to it.

**Acceptance checks.** The geometric series gives the analytic function (1−t) inverse on ||t||<1.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.2, Lemma II.2.1 and Theorem II.2.2 with proofs, author PDF p. 30. Worker decomposition of the evaluation and radius estimates used here; the source does not assign separate numbers to these elementary adapters.

### Evaluation preserves products inside the disc

`L1/open-disc-evaluation-mul` · lemma.

For open-disc series F,H and ||t||<1, E(FH,t)=E(F,t)E(H,t). The corresponding additivity and scalar-linearity follow from summability.

**Hypotheses.** K is a finite extension of Q_p with its normalized nonarchimedean absolute value; the elementary series lemmas also hold over any complete nontrivially normed ultrametric field. An open-disc series F means a native power series with ||a_n|| R^n tending to zero for every real 0<R<1. Write E(F,t) for the native FormalMultilinearSeries.ofScalarsSum of its coefficients; analytic uses require ||t||<1. No convergence claim is made at ||t||=1.

**Inputs.** `LocallyAnalyticDistributions:L1/open-disc-summability`, `mathlib:HasSum.mul_of_nonarchimedean`.

**Proof outline.** Apply the native nonarchimedean product-of-sums theorem to the summable sequences a_i t^i and b_j t^j. Partition the double index set by i+j=n; each fibre is finite, and its sum is the native Cauchy-product coefficient.

**Acceptance checks.** E(1,t)=1. E((1−T)(Σ_n T^n),t)=1 for ||t||<1.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.2, Lemma II.2.1 and Theorem II.2.2 with proofs, author PDF p. 30. Worker decomposition of the evaluation and radius estimates used here; the source does not assign separate numbers to these elementary adapters.

### Evaluation commutes with an isometric coefficient extension

`L1/open-disc-evaluation-map` · lemma.

For an isometric field homomorphism φ:K→K′ into a complete ultrametric field, an open-disc series F and ||t||<1, E(map(φ,F),φ(t))=φ(E(F,t)). The coefficient map is the native PowerSeries.map; no arbitrary C_p-point function or completed distribution-family object is introduced.

**Hypotheses.** K is a finite extension of Q_p with its normalized nonarchimedean absolute value; the elementary series lemmas also hold over any complete nontrivially normed ultrametric field. An open-disc series F means a native power series with ||a_n|| R^n tending to zero for every real 0<R<1. Write E(F,t) for the native FormalMultilinearSeries.ofScalarsSum of its coefficients; analytic uses require ||t||<1. No convergence claim is made at ||t||=1.

**Inputs.** `LocallyAnalyticDistributions:L1/open-disc-summability`, `mathlib:PowerSeries.map`, `mathlib:PowerSeries.coeff_map`.

**Proof outline.** The isometry preserves all coefficient-radius estimates. It preserves the term a_n t^n. By continuity, apply φ to the limits of the finite partial sums from open-disc-summability.

**Acceptance checks.** φ=id recovers identical values. Successive isometric field extensions compose because the native coefficient maps compose.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.2, Lemma II.2.1 and Theorem II.2.2 with proofs, author PDF p. 30. Worker decomposition of the evaluation and radius estimates used here; the source does not assign separate numbers to these elementary adapters.

### Pushforward of analytic distributions

`L1/distribution-pushforward` · construction.

For an analytic map f:X→Y of compact p-adic manifolds, define f_*μ by (f_*μ)(g)=μ(g∘f). This is a continuous K-linear map D(X,K)→D(Y,K) for the strong dual topologies.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L0/analytic-chart-pullback`, `LocallyAnalyticDistributions:L0/compact-type-dual-reflexivity`.

**Proof outline.** Transpose the continuous stage-wise pullback and its bounded-set control. Check identity and composition directly on test functions.

**Uses.** Colmez §II.4, dilation and φ: Analytic maps provide all pushforwards without new group actions. Mellin functoriality: A character pulls back along f.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.AnalyticDistributions.distributionPushforward` | Transpose a continuous analytic pullback. |
| `TauCeti.AnalyticDistributions.distributionPushforward_apply` | Evaluation is μ applied to pullback. |
| `TauCeti.AnalyticDistributions.distributionPushforward_comp` | (g∘f)_*=g_*∘f_*. |

**Unit tests.**

- `AnalyticDistributionTests.pushforward_identity` (compatibility): Transposing the identity returns μ.
- `AnalyticDistributionTests.pushforward_zero` (degenerate): The zero distribution pushes forward to zero.
- `AnalyticDistributionTests.pushforward_constant` (computation): For constant f with value y, f_*μ=μ(1)δ_y.

**Acceptance checks.** The pushforward of δ_x is δ_f(x).

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.4, printed pp. 34–37. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Convolution by iterated analytic evaluation

`L1/distribution-convolution` · construction.

For a compact analytic group G, (λ*μ)(f)=μ(y↦λ(x↦f(xy))). This defines a distribution; it is associative with unit δ_1. For abelian G it is commutative. For additive Z_p write f(x+y).

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L0/product-analytic-tensor`, `LocallyAnalyticDistributions:L1/distribution-pushforward`.

**Proof outline.** Use the product analytic tensor comparison to construct λ⊗μ and verify that the intermediate evaluation is analytic. Push forward by multiplication; associativity follows by evaluation on three factors.

**Uses.** Colmez Proposition II.4.3: The transform sends convolution to multiplication. Mellin convolution: Characters diagonalize the product.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.AnalyticDistributions.distributionConvolution` | Push forward the tensor distribution along group multiplication. |
| `TauCeti.AnalyticDistributions.distributionConvolution_apply` | Its value is the specified iterated integral. |
| `TauCeti.AnalyticDistributions.distributionConvolution_assoc` | Convolution is associative. |

**Unit tests.**

- `AnalyticDistributionTests.convolution_atoms` (computation): δ_a*δ_b=δ_ab.
- `AnalyticDistributionTests.convolution_unit` (degenerate): δ_1*μ=μ.
- `AnalyticDistributionTests.convolution_bounded` (compatibility): On imported bounded measures it agrees with their convolution.

**Acceptance checks.** For a nonabelian G commutativity is not asserted.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.4, printed pp. 34–37. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Multiplication by an analytic function

`L1/distribution-multiply` · construction.

For g∈LA(X,K), define gμ by (gμ)(f)=μ(gf). Multiplication is K-linear in μ, continuous for each fixed g, and satisfies (g₁g₂)μ=g₁(g₂μ).

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L0/multivariable-fixed-radius`, `LocallyAnalyticDistributions:L0/compact-type-dual-reflexivity`.

**Proof outline.** Multiply functions at a common radius and use the Gauss norm inequality. Transpose multiplication and pass to the strong dual.

**Uses.** Colmez §II.4.2–3: Coordinate multiplication, character twists and restrictions are instances. Family automorphy action: The analytic multiplier is transposed together with pullback.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.AnalyticDistributions.distributionMultiply` | Transpose multiplication on analytic test functions. |
| `TauCeti.AnalyticDistributions.distributionMultiply_apply` | (gμ)(f)=μ(gf). |
| `TauCeti.AnalyticDistributions.distributionMultiply_assoc` | Successive multiplications multiply their analytic factors. |

**Unit tests.**

- `AnalyticDistributionTests.multiply_one` (degenerate): 1μ=μ.
- `AnalyticDistributionTests.multiply_atom` (computation): gδ_x=g(x)δ_x.
- `AnalyticDistributionTests.multiply_bounded` (compatibility): For bounded μ and continuous g this agrees with imported bounded-measure multiplication.

**Acceptance checks.** Multiplication by a clopen indicator is restriction.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.4, printed pp. 34–37. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Amice transform of a point mass

`L1/amice-dirac` · lemma.

For a∈Z_p, A(δ_a)=(1+T)^a, with nth coefficient binom(a,n). The power is the native continuous p-adic binomial character.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L1/amice-transform`, `PadicMeasuresIwasawaAlgebras:L2/field-bounded-amice-isometry`.

**Proof outline.** Evaluate each Mahler function at a. Use the imported bounded transform on the point mass to identify the two series.

**Acceptance checks.** a=0 gives 1; a=1 gives 1+T.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.4, printed pp. 34–37. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Unbounded Amice convolution identity

`L1/amice-convolution` · lemma.

For λ,μ∈D(Z_p,K), A(λ*μ)=A(λ)A(μ). The identity is in the Fréchet algebra of functions on the open unit disc, without boundedness of coefficients.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L1/distribution-convolution`, `LocallyAnalyticDistributions:L1/amice-transform`, `LocallyAnalyticDistributions:L1/open-disc-evaluation-mul`.

**Proof outline.** Evaluate against (1+t)^x for every |t|<1. Use its multiplicativity in x and uniqueness of analytic series coefficients.

**Acceptance checks.** Derivative point masses give products of logarithms, which need not be bounded series.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.4, printed pp. 34–37. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Coordinate multiplication under Amice

`L1/amice-multiply-x` · lemma.

A(xμ)=(1+T)·dA(μ)/dT for any locally analytic distribution μ, with the native formal-series derivative interpreted analytically on the open disc.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L1/distribution-multiply`, `LocallyAnalyticDistributions:L1/amice-transform`.

**Proof outline.** Use x·binom(x,n)=n·binom(x,n)+(n+1)·binom(x,n+1). Identify coefficients and use the radius-shift derivative estimate.

**Acceptance checks.** For δ_a the result is a(1+T)^a.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.4, printed pp. 34–37. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Additive character twist under Amice

`L1/amice-character-twist` · lemma.

If |z−1|<1, then A(z^x μ)(T)=A(μ)(z(1+T)−1). The substitution maps the open unit disc to itself; z^x is locally analytic after a sufficiently small radius choice.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L1/distribution-multiply`, `LocallyAnalyticDistributions:L1/amice-transform`, `LocallyAnalyticDistributions:L0/compact-uniform-radius`.

**Proof outline.** Multiply the two analytic binomial characters inside μ. Check |z(1+T)−1|<1 and conclude by coefficient uniqueness.

**Acceptance checks.** At μ=δ_1 the result is z(1+T).

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.4, printed pp. 34–37. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Fourier formula for clopen restriction

`L1/amice-ball-restriction` · lemma.

After extending K to contain μ_(p^n), A(1_(b+p^nZ_p)μ)(T)=p^(−n)Σ_(η^(p^n)=1)η^(−b)A(μ)(η(1+T)−1). The finite character average descends to K and is independent of the integer representative b.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L1/distribution-multiply`, `LocallyAnalyticDistributions:L1/amice-character-twist`.

**Proof outline.** Use the finite Fourier indicator identity on Z_p/p^nZ_p. Apply character-twist compatibility term by term and use coefficient extension/descent.

**Acceptance checks.** At n=0 the single term returns A(μ). For δ_a the result is either (1+T)^a or zero.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.4.3 and Proposition II.4.1, printed p. 35. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### The transpose derivative and logarithm

`L1/amice-derivative` · lemma.

With the convention (dμ)(f)=μ(f′), A(dμ)=log(1+T)A(μ). No integration-by-parts minus sign is used.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L1/amice-transform`, `LocallyAnalyticDistributions:L0/locally-analytic-radius`.

**Proof outline.** Differentiate x↦(1+t)^x on a sufficiently small analytic chart. Transpose the continuous derivative and identify analytic evaluations.

**Acceptance checks.** A(dδ_0)=log(1+T); its linear coefficient is +1.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.4, printed pp. 34–37. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Dilation and the φ operator

`L1/amice-dilation` · lemma.

For a∈Z_p, pushforward along x↦ax sends A(μ)(T) to A(μ)((1+T)^a−1). For a=p this is φ; for a=0 it is the constant series μ(1).

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L1/distribution-pushforward`, `LocallyAnalyticDistributions:L1/amice-transform`.

**Proof outline.** Evaluate a pulled-back binomial character. Check the substitution stays in the open disc, including the constant map case.

**Acceptance checks.** φ(δ_1)=δ_p.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.4.5, printed pp. 35–36. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### The ψ operator and support on units

`L1/psi-unit-projector` · lemma.

Define ψμ by first restricting μ to pZ_p, then pushing forward under x↦x/p. Then ψφ=1, φψ is restriction to pZ_p, and μ−φψμ is restriction to Z_p^×. Thus ψμ=0 exactly when μ is supported on Z_p^×.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L1/amice-dilation`, `LocallyAnalyticDistributions:L1/distribution-multiply`, `LocallyAnalyticDistributions:L1/distribution-pushforward`.

**Proof outline.** The inverse dilation is analytic on the clopen subset pZ_p. Evaluate compositions on functions; disjoint clopen decomposition gives the support characterization.

**Acceptance checks.** ψδ_1=0 and ψδ_p=δ_1.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.4.5, printed p. 36. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Canonical coordinate division away from zero

`L1/division-on-units` · lemma.

If μ is supported on Z_p^×, multiplication by x is continuously invertible on that support, with inverse μ↦x^(−1)μ. In the full space D(Z_p,K), coordinate division has ambiguity Kδ_0, as already specified by the inherited primitive construction.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L1/distribution-multiply`, `LocallyAnalyticDistributions:L1/division-by-x-and-primitives`, `LocallyAnalyticDistributions:L1/psi-unit-projector`.

**Proof outline.** The reciprocal coordinate is analytic on the clopen unit domain. Multiplication by x and 1/x are mutually inverse on that supported summand.

**Acceptance checks.** x^(−1)δ_a=a^(−1)δ_a for a∈Z_p^×. The unit inverse is not defined at δ_0.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.4, printed pp. 34–37. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Local primitives with a radius loss

`L1/analytic-local-primitives` · lemma.

Every analytic function on a closed p-adic disc admits a primitive on each strictly smaller closed disc; every locally analytic function on compact Z_p admits a locally analytic primitive. The kernel of d/dx on LA(Z_p,K) is the locally constant functions.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L0/disc-analytic-functions`, `LocallyAnalyticDistributions:L0/compact-uniform-radius`.

**Proof outline.** Integrate the power series coefficient a_n to a_n/(n+1). A strictly smaller radius absorbs the subexponential p-adic growth of 1/(n+1). Choose primitives separately on a finite clopen refinement; zero derivative makes each local expansion constant.

**Acceptance checks.** A primitive of 1 is x. A primitive need not exist in the same fixed Banach stage.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §I.5, Proposition I.5.16, printed pp. 24–25; Kohlhaase Corollary 4.3, printed p. 21. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### No continuous section of analytic differentiation

`L1/derivative-nonsplitting` · theorem.

For finite K/Q_p, the continuous surjection d/dx:LA(Z_p,K)→LA(Z_p,K), with kernel LC(Z_p,K), has no continuous K-linear right inverse.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L1/analytic-local-primitives`, `LocallyAnalyticDistributions:L0/compact-type-dual-reflexivity`.

**Proof outline.** Use Kohlhaase Proposition 4.2: a split smooth-distribution quotient for a nondiscrete group would make all locally analytic functions bounded on one fixed neighborhood lattice and hence locally constant. Apply Corollary 4.3 to Z_p and transpose a hypothetical section. The cohomological resolution/strict smooth quotient needed for Proposition 4.2 is an explicit proof input, not a one-line consequence of local integration.

**Acceptance checks.** Choosing algebraic primitives does not give a continuous section of the LF topology.

**Sources.** [The cohomology of locally analytic representations](https://esaga.net/f/jan.kohlhaase/Kohlhaase_Locally_Analytic_Cohomology.pdf), §4, Proposition 4.2 and Corollary 4.3, printed pp. 20–21. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### The nonsplit logarithm sequence

`L1/logarithm-extension-nonsplitting` · theorem.

Under unbounded Amice duality, the transpose of differentiation is multiplication by t=log(1+T). The sequence 0→tR⁺→R⁺→R⁺/tR⁺→0 is strict exact and has no continuous K-linear splitting, where R⁺=O(D(0,1)^−) has its Fréchet topology.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L1/amice-derivative`, `LocallyAnalyticDistributions:L1/derivative-nonsplitting`, `LocallyAnalyticDistributions:L0/compact-type-dual-reflexivity`.

**Proof outline.** Identify the strict transpose sequence using compact-type strong duality and the annihilator of LC. A section of the quotient would, by reflexive duality, split differentiation, contradicting the preceding theorem. Closedness and the quotient identification are required inputs.

**Acceptance checks.** The denominator is log(1+T), not the coordinate T. The sequence has infinitely many logarithm zeros in the open disc.

**Sources.** [On the cohomology of p-adic analytic spaces, II: The C_st-conjecture](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Appendix A, Remark A.6, printed p. 59. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Cancellation in logarithmic derivative quotients

`L1/logarithm-apparent-poles` · lemma.

If ν=dμ, then A(ν)/log(1+T) extends analytically to A(μ), including every p-power torsion zero of the logarithm. General ν need not be divisible by log(1+T), so a distribution primitive is not automatic.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L1/amice-derivative`, `LocallyAnalyticDistributions:L1/open-disc-evaluation-mul`.

**Proof outline.** Use the exact identity A(ν)=log(1+T)A(μ). On each zero, divisibility in the local analytic ring gives removal of the apparent pole.

**Acceptance checks.** ν=dδ_0 gives the quotient 1. ν=δ_0 gives 1/log(1+T), which has a pole at T=0.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.4, printed pp. 34–37. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

## L2. Admissible growth and uniqueness

### Functions of class C^r

`L2/c-r-functions` · definition.

For r ≥ 0, φ : ℤ_p → L is of class C^r if there are φ^{(j)} (0 ≤ j ≤ [r]) with ε(x, y) = φ(x + y) − Σ_{j≤[r]} φ^{(j)}(x)y^j/j! satisfying inf_{x∈ℤ_p, y∈p^hℤ_p}(v_p(ε(x, y))) − rh → +∞. C^r(ℤ_p, L) is an L-Banach space (valuation v′_{C^r}), equivalently normed by v_{C^r}(φ) = inf_n(v_p(a_n(φ)) − rℓ(n)) on Mahler coefficients, with Banach bases p^{[rℓ(n)]}C(x, n) and the wavelet basis e_{i,k,r} (i ∈ ℕ, 0 ≤ k ≤ [r]) of locally polynomial functions of degree ≤ [r]. In particular locally polynomial functions of degree ≤ [r] are dense in C^r, LA_h ⊂ C^r with v_{C^r}(φ) ≥ v_{LA_h}(φ) − rh − C₁(r), and C⁰ is the space of continuous functions.

**Hypotheses.** L ⊆ ℂ_p is a closed subfield (a finite extension of ℚ_p in applications), v_p the valuation with v_p(p) = 1, and ℓ(n) the number of base-p digits of n (ℓ(0) = 0).

**Inputs.** `LocallyAnalyticDistributions:L0/amice-mahler-basis`, `mathlib:PadicInt.mahlerEquiv`.

**Proof outline.** Theorem I.5.14 (wavelet basis) through Lemma I.5.10 and Proposition I.5.12; density of LP^{[0,r]} is Proposition I.5.13 (Taylor truncations φ_h → φ). Theorem I.5.17 and Corollary I.5.18 (Mahler coefficients); Proposition I.5.19 (LA_h ⊂ C^r).

**Uses.** LocallyAnalyticDistributions:L2/order-r-distributions: D_r is the dual of C^r. LocallyAnalyticDistributions:L2/amice-velu-vishik: uniqueness from density of locally polynomial functions.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.LocallyAnalytic.Cr` | C^r(ℤ_p, L) with v_{C^r}. |
| `TauCeti.LocallyAnalytic.Cr_mahler` | φ ∈ C^r iff v_p(a_n(φ)) − rℓ(n) → +∞. |
| `TauCeti.LocallyAnalytic.locallyPolynomial_dense_Cr` | LP^{[0,[r]]} is dense in C^r. |

**Unit tests.**

- `Cr_zero_eq_continuous` (example): C⁰ = continuous functions.
- `Cr_mahler_iff` (characterisation): The Mahler criterion for C^r.
- `digit_doubling_not_C2` (non-example): The digit-doubling function is not of class C².

**Acceptance checks.** r = 0: C⁰ is all continuous functions (Colmez Remark I.5.1). Polynomials of degree ≤ [r] are of class C^r; LA_h ⊂ C^r for every r. The function Σ a_n(x)p^n ↦ Σ a_n(x)p^{2n} (digit doubling) is differentiable everywhere with derivative 0 but is not locally constant near any point and has no Taylor expansion of order 2 (Colmez Remark I.5.2): pointwise differentiability does not give class C^r.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §I.5.1, Theorem I.5.14, Propositions I.5.13 and I.5.19, Theorem I.5.17, pp. 18–25. Theorem I.5.14; the definition of C^r is §I.5.1.

### Distributions of order r (admissible distributions)

`L2/order-r-distributions` · definition.

For r ≥ 0, a distribution μ ∈ D(ℤ_p, L) has order r (is r-admissible, or h-admissible with h = r) if it extends continuously to C^r(ℤ_p, L); D_r(ℤ_p, L) = C^r(ℤ_p, L)′. The following are equivalent: (a) μ ∈ D_r; (b) the Amice transform A_μ = Σ b_nT^n has v_p(b_n) + rℓ(n) bounded below (A_μ ∈ R⁺_r); (c) inf_h(v_{B(0,u_h)}(A_μ) + rh) > −∞; (d) v_{D_r}(μ) = inf_n(v_{LA_n}(μ) + rn) > −∞, i.e. ‖μ‖_{LA_n} = O(p^{rn}) (on the ball of radius p^{−n}); (e) there is C with v_p(∫_{a+p^nℤ_p}((x − a)/p^n)^k μ) ≥ C − rn for all a ∈ ℤ_p, k, n. The valuations of (b)–(e) are equivalent to v′_{D_r}, and μ ↦ A_μ is an isometry (D_r, v′_{D_r}) ≅ (R⁺_r, v_r). Orders add under products of transforms and under convolution.

**Hypotheses.** L ⊆ ℂ_p is a closed subfield (a finite extension of ℚ_p in applications), v_p the valuation with v_p(p) = 1, and ℓ(n) the number of base-p digits of n (ℓ(0) = 0). Pollack–Stevens' 'h-admissible' (‖μ‖_s = O(s^{−h}) as s → 0⁺, their Definition 6.1) is (d) with r = h, s = p^{−n}; ModularSymbolsPadicLFunctions L2 requests it in this form. log(1 + T) has order 1; its powers log(1 + T)^j have order j.

**Inputs.** `LocallyAnalyticDistributions:L2/c-r-functions`, `LocallyAnalyticDistributions:L1/amice-transform`, `LocallyAnalyticDistributions:L0/locally-analytic-distributions`.

**Proof outline.** (a) ⇔ (b): Proposition II.3.1, a translation of the Mahler criterion for C^r (Theorem I.5.17) through the Amice isomorphism. (b) ⇔ (c): Lemma II.1.1, optimising n/((p − 1)p^h) + rh over h. (a) ⇒ (e): φ_{a,n,k} = 1_{a+p^nℤ_p}((x − a)/p^n)^k ∈ LA_n with valuation 0, and v_{C^r}(φ_{a,n,k}) ≥ −rn − C₁(r) (Theorem II.3.2(i)); (e) ⇒ (a) is amice-velu-vishik with N = ∞. (d) and the equivalence of valuations: Proposition II.3.3 (open mapping).

**Uses.** LocallyAnalyticDistributions:L2/amice-velu-vishik: the target of the extension theorem. ModularSymbolsPadicLFunctions:L2/eigensymbol-admissibility: values of slope-h eigensymbols are of order h.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.LocallyAnalytic.DistOrder` | D_r(ℤ_p, L) = C^r(ℤ_p, L)′ inside D(ℤ_p, L). |
| `TauCeti.LocallyAnalytic.mem_distOrder_iff_amice` | μ ∈ D_r iff v_p(b_n) + rℓ(n) is bounded below. |
| `TauCeti.LocallyAnalytic.mem_distOrder_iff_growth` | μ ∈ D_r iff inf_n(v_{LA_n}(μ) + rn) > −∞ (Pollack–Stevens' h-admissibility). |
| `TauCeti.LocallyAnalytic.mem_distOrder_iff_riemann` | μ ∈ D_r iff the Riemann-sum bound holds. |

**Unit tests.**

- `dirac_order_zero` (example): δ_a has order 0.
- `log_order_one` (characterisation): log(1 + T) has order exactly 1.
- `infinite_order_example` (non-example): b_{p^k} = p^{−k²} gives a distribution of no finite order.

**Acceptance checks.** δ_a and every measure have order 0. The derivative dδ₀ (φ ↦ φ′(0)) has transform log(1 + T), of order 1 and not of order r < 1. A distribution whose transform has coefficients b_{p^k} = p^{−k²} is in D(ℤ_p, L) (it converges on the open disc) but of no finite order.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.1, Lemma II.1.1, §II.3.1, Proposition II.3.1, Theorem II.3.2(i), Proposition II.3.3, pp. 29–34. The definition; the equivalences follow in §§II.1 and II.3.

### Order zero is bounded measures

`L2/order-zero-measures` · theorem.

D₀(ℤ_p, L) = C⁰(ℤ_p, L)′ is the space of bounded measures, and its Amice transforms are exactly the bounded power series 𝒪_L⟦T⟧ ⊗ L. A measure is determined by the values μ(a + p^nℤ_p), and conversely any family μ(a + p^nℤ_p) that depends only on a mod p^n, is additive (μ(a + p^nℤ_p) = Σ_{j<p} μ(a + jp^n + p^{n+1}ℤ_p)) and bounded below in valuation defines a unique measure, with ∫φ μ = lim_n Σ_{a<p^n} φ(a)μ(a + p^nℤ_p).

**Hypotheses.** L ⊆ ℂ_p is a closed subfield (a finite extension of ℚ_p in applications), v_p the valuation with v_p(p) = 1, and ℓ(n) the number of base-p digits of n (ℓ(0) = 0). Bounded measures and their integral/bounded Amice transform are PadicMeasuresIwasawaAlgebras'; this node identifies them with the order-0 part of D.

**Inputs.** `LocallyAnalyticDistributions:L2/order-r-distributions`, `PadicMeasuresIwasawaAlgebras:L2/bounded-inverse-amice`, `PadicMeasuresIwasawaAlgebras:L0`.

**Proof outline.** C⁰ has Mahler valuation v_{C⁰} = inf v_p(a_n), so D₀ ↔ bounded coefficients by order-r-distributions with r = 0. Riemann sums: Σ_{a<p^n} φ(a)1_{a+p^nℤ_p} → φ in C⁰, and locally constant functions are dense.

**Acceptance checks.** Haar distribution on ℤ_p (μ(a + p^nℤ_p) = p^{−n}) is unbounded, hence not a measure, but has order 1 (Riemann-sum bound with r = 1). The Dirac mass δ_a: μ(a + p^nℤ_p) ∈ {0, 1}. Boundedness is essential: bounded measures with values in L are 𝒪_L⟦T⟧[1/p], not 𝒪_L⟦T⟧; integrality is a further condition.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.3.2, pp. 31–32. Measures as order-zero distributions, with the Riemann-sum construction.

### The Amice–Vélu–Vishik extension and uniqueness theorem

`L2/amice-velu-vishik` · theorem.

Let r ≥ 0 and N ∈ ℕ ∪ {∞} with N ≥ [r]. Let μ be a linear form on the locally polynomial functions of degree ≤ N (equivalently, compatible values ∫_{a+p^nℤ_p} x^i μ for i ≤ N) such that for some C, v_p(∫_{a+p^nℤ_p}((x − a)/p^n)^k μ) ≥ C − rn for all a ∈ ℤ_p, k ≤ N, n ∈ ℕ. Then μ extends uniquely to a distribution of order r. In particular two distributions of order r that agree on locally polynomial functions of degree ≤ N coincide when N ≥ [r], i.e. when r < N + 1. For r = N + 1 uniqueness fails: d^{N+1}δ₀ (φ ↦ ±φ^{(N+1)}(0)) is a nonzero distribution of order N + 1 vanishing on all locally polynomial functions of degree ≤ N.

**Hypotheses.** L ⊆ ℂ_p is a closed subfield (a finite extension of ℚ_p in applications), v_p the valuation with v_p(p) = 1, and ℓ(n) the number of base-p digits of n (ℓ(0) = 0). The strict threshold r < N + 1 is the small-slope condition h < k + 1 of ModularSymbolsPadicLFunctions L2 (N = k, r = h); at critical slope h = k + 1 this theorem does not apply. One-variable only: the multivariable version with a vector of radii is still to be decomposed (coverage).

**Inputs.** `LocallyAnalyticDistributions:L2/order-r-distributions`, `LocallyAnalyticDistributions:L2/c-r-functions`.

**Proof outline.** Uniqueness: locally polynomial functions of degree ≤ N ⊇ LP^{[0,[r]]} are dense in C^r (Proposition I.5.13). Existence (Theorem II.3.2(ii)): set b_{i,k} = ∫e_{i,k,r} μ for the wavelet basis (k ≤ [r]); the bound gives v_p(b_{i,k}) ≥ v_{D_r,N}(μ) − 1, so Theorem I.5.14 gives μ̃ ∈ D_r with these values. λ = μ − μ̃ vanishes on LP^{[0,r]}; expanding x^k on a + p^nℤ_p over the p^m sub-balls, the terms with j ≤ r vanish and those with j > r have valuation ≥ (j − r)(n + m) + v_{D_r,N}(λ) → ∞, so λ = 0 on LP^{[0,N]}.

**Acceptance checks.** r = 0, N = 0: a bounded additive function on balls is a measure (order-zero-measures). Pollack–Stevens' μ_f for slope h < k + 1: determined by its values on z^j·1_{a+p^nℤ_p}, j ≤ k. d^{N+1}δ₀ is the counterexample at r = N + 1.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), Theorem II.3.2 and its proof, pp. 32–33. Theorem II.3.2(ii). [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Theorem B.1 and the remarks after it, pp. 79–80. RJW's attribution to Manin, Mazur–Swinnerton-Dyer, Amice–Vélu and Višik.

### Tensor wavelets and vector order

`L2/anisotropic-tensor-wavelets` · construction.

For G=Z_p^g and r_i≥0, the vector-order function space is ⊗̂_π,i C^{r_i}(Z_p,K), using the inherited Colmez C^r spaces. Tensor products of Colmez wavelets form a Banach basis; for 0≤r_i<1 their indicator wavelets have scaling p^(Σ_i floor(r_iℓ(n_i))). The coefficient norm is the c₀ sup norm in this scaled basis. This contract uses the intended tensor construction, not Loeffler Definition 2.12’s literal cofinite oscillation formula.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L2/c-r-functions`, `LocallyAnalyticDistributions:L0/product-analytic-tensor`.

**Proof outline.** Use the one-variable wavelet basis separately in every factor. Identify its completed projective tensor with c₀ of the product index set via finite rectangles. The weighted tensor norm and the original function realization are compared through this basis, not through simultaneous first differences.

**Uses.** Loeffler Theorem 2.15, intended tensor statement: Makes the corrected rectangular extension precise. Vector admissibility: The scaled basis turns moment growth into bounded dual coefficients.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.AnalyticDistributions.anisotropicFunctionSpace` | The completed projective tensor of the inherited one-variable C^{r_i} spaces. |
| `TauCeti.AnalyticDistributions.anisotropicFunctionSpace_pure` | Finite pure tensors map to products of their actual one-variable functions. |
| `TauCeti.AnalyticDistributions.anisotropicFunctionSpace_basis` | Its tensor-wavelet coefficient map is a Banach equivalence with native c₀. |

**Unit tests.**

- `AnalyticDistributionTests.anisotropic_order_zero` (compatibility): For r=(0,0), the tensor function space is C⁰(Z_p²,K).
- `AnalyticDistributionTests.anisotropic_empty` (degenerate): The empty tensor product is K.
- `AnalyticDistributionTests.anisotropic_one_coordinate` (computation): With r=(1/2,0), the function 1_(pZ_p)(x₂) belongs as 1⊗1_(pZ_p).

**Acceptance checks.** A locally constant function of only the second variable is included when r_1>0,r_2=0. When all r_i=0 the result is C⁰(G,K).

**Sources.** [P-adic integration on ray class groups and non-ordinary p-adic L-functions](https://arxiv.org/pdf/1304.4042), §2.3, Definitions 2.11–2.14, Remark 2.13 and Theorem 2.15, printed pp. 4–5. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Rectangular locally constant wavelets

`L2/rectangular-wavelet-basis` · lemma.

When every 0≤r_i<1, the tensor wavelets of the preceding comparison are scaled characteristic functions of rectangular p-power cosets and form a Banach basis. Locally constant functions are dense in the vector-order function space.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L2/anisotropic-tensor-wavelets`.

**Proof outline.** The one-variable wavelet has polynomial degree zero in this range. Tensor the bases and approximate every c₀ family by its finite support.

**Acceptance checks.** For r=(0,0), finite rectangular step functions uniformly approximate continuous functions.

**Sources.** [P-adic integration on ray class groups and non-ordinary p-adic L-functions](https://arxiv.org/pdf/1304.4042), §2.3, Definitions 2.11–2.14, Remark 2.13 and Theorem 2.15, printed pp. 4–5. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Rectangular growth for a locally constant functional

`L2/rectangular-growth` · definition.

For a K-linear functional μ on LC(Z_p^g,K), rectangular growth ≤r means there is C≥0 such that |μ(1_(a+∏_i p^{m_i}Z_p))|≤C·p^(Σ_i r_i m_i) for every a and every tuple m_i≥0. This is a bound on actual clopen indicators and includes finite additivity inherited from linearity.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L2/anisotropic-tensor-wavelets`.

**Proof outline.** Use the imported native locally constant function carrier; construct the box indicator from clopen p-adic residue conditions. This bound is intrinsic under finite refinements of compatible product charts up to a constant.

**Uses.** Loeffler Theorem 2.15: Bounds the dual coefficients of the tensor wavelets. Ray-class distribution adapter: Conductor exponents produce the tuple m.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.AnalyticDistributions.RectangularGrowth` | The displayed uniform bound on all rectangular cosets. |
| `TauCeti.AnalyticDistributions.rectangularGrowth_mono` | Increasing each component r_i preserves the bound. |
| `TauCeti.AnalyticDistributions.rectangularGrowth_add` | A sum of two bounded-growth functionals has the same growth order with a larger constant. |

**Unit tests.**

- `AnalyticDistributionTests.rectangularGrowth_dirac` (computation): A point mass has growth r for every r_i≥0, with C=1.
- `AnalyticDistributionTests.rectangularGrowth_zero` (degenerate): The zero functional has C=0.
- `AnalyticDistributionTests.rectangularGrowth_refinement` (compatibility): A box mass equals the sum of its p children in a chosen coordinate.

**Acceptance checks.** At g=1,r=0 this is the usual uniform clopen-mass bound.

**Sources.** [P-adic integration on ray class groups and non-ordinary p-adic L-functions](https://arxiv.org/pdf/1304.4042), §2.3, Definitions 2.11–2.14, Remark 2.13 and Theorem 2.15, printed pp. 4–5. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Extension of rectangular distributions

`L2/rectangular-extension` · theorem.

For 0≤r_i<1, every locally constant functional with rectangular growth ≤r extends uniquely to a continuous functional on the tensor vector-order function space. Its norm is bounded in terms of the growth constant and the fixed wavelet normalization.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L2/rectangular-growth`, `LocallyAnalyticDistributions:L2/rectangular-wavelet-basis`.

**Proof outline.** Evaluate μ on the scaled rectangular basis; the growth bound makes these evaluations uniformly bounded because floor(r_iℓ) differs from r_iℓ by a bounded amount. Extend a bounded coefficient family to c₀ by unconditional summation. Density of finite wavelet sums gives uniqueness. This proves the intended tensor version of Loeffler Theorem 2.15.

**Acceptance checks.** The proof allows Σ_i r_i≥1 as long as each r_i<1.

**Sources.** [P-adic integration on ray class groups and non-ordinary p-adic L-functions](https://arxiv.org/pdf/1304.4042), §2.3, Definitions 2.11–2.14, Remark 2.13 and Theorem 2.15, printed pp. 4–5. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Growth forced by the tensor dual norm

`L2/rectangular-growth-necessity` · lemma.

A continuous functional on the tensor C^{r_i} space with every r_i<1 restricts to a locally constant functional with rectangular growth ≤r. Together with the extension theorem this characterizes the tensor dual by its box values and refinement relations.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L2/rectangular-wavelet-basis`, `LocallyAnalyticDistributions:L2/rectangular-growth`.

**Proof outline.** Estimate the norm of each one-variable coset indicator by a constant times p^{r_i m_i}. Multiply the bounds under the projective tensor norm and apply the functional norm.

**Acceptance checks.** Order zero recovers bounded measures through their existing owner.

**Sources.** [P-adic integration on ray class groups and non-ordinary p-adic L-functions](https://arxiv.org/pdf/1304.4042), §2.3, Definitions 2.11–2.14, Remark 2.13 and Theorem 2.15, printed pp. 4–5. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Compatible quasi-factor chart invariance

`L2/quasifactor-chart-invariance` · lemma.

For a compact abelian p-adic Lie group whose Lie algebra has a chosen direct-sum decomposition, vector growth and tensor function spaces are independent of the compatible closed subgroups with open product and of compatible analytic coordinates, up to equivalent norms. Chart changes must preserve the chosen summands.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L2/anisotropic-tensor-wavelets`, `LocallyAnalyticDistributions:L2/rectangular-growth`, `LocallyAnalyticDistributions:L0/chart-independence`.

**Proof outline.** Compare commensurable lattices in each Lie summand; every exponent changes by a bounded additive amount. Use a finite coset decomposition of the open product subgroup. For analytic chart changes invoke the C^{r_i} bounded pullback theorem in each summand, retained as a proof input for higher orders.

**Acceptance checks.** Swapping factors with unequal r_i changes the order tuple; it is not an invariant chart change unless the tuple is swapped too.

**Sources.** [P-adic integration on ray class groups and non-ordinary p-adic L-functions](https://arxiv.org/pdf/1304.4042), §2.3, Definitions 2.11–2.14, Remark 2.13 and Theorem 2.15, printed pp. 4–5. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Multidegree admissibility and uniqueness

`L2/tensor-multidegree-extension` · theorem.

Let N_i≥0 and 0≤r_i<N_i+1. A functional on locally polynomial functions of separate degree ≤N_i extends uniquely to the tensor C^{r_i} dual if, for each box a+p^mZ_p^g and multi-index 0≤j_i≤N_i, its unnormalized local moment obeys |μ(1_box·∏(x_i−a_i)^{j_i})|≤C·p^(Σ_i(r_i−j_i)m_i). Extra degrees above floor(r_i) satisfy this bound but are not needed for density.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L2/amice-velu-vishik`, `LocallyAnalyticDistributions:L2/anisotropic-tensor-wavelets`.

**Proof outline.** Tensor the Colmez finite-degree wavelet bases; evaluation of the normalized monomials yields uniformly bounded basis values. Use the one-variable admissibility theorem in each factor, finite coset refinements and c₀ extension. A detailed uniform tensor bound for degree changes remains a refinement; this is a worker tensor deduction, not a claim that Loeffler proves arbitrary orders.

**Acceptance checks.** The strict inequality is separate in every coordinate. For N_i=0 and r_i<1 this gives rectangular extension.

**Sources.** [P-adic integration on ray class groups and non-ordinary p-adic L-functions](https://arxiv.org/pdf/1304.4042), Remark 2.13 and Theorem 2.15, printed p. 5; tensor deduction from Colmez Theorem II.3.5, printed pp. 32–33. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Determination by finite characters and polynomial moments

`L2/locally-algebraic-determination` · lemma.

A tensor distribution of order r with r_i<N_i+1 is determined by all moments χ(x)∏x_i^{j_i} with finite-order χ of Z_p^g and 0≤j_i≤N_i, after a finite splitting-field coefficient extension. These functions span the locally polynomial test spaces at each finite residue level.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L2/tensor-multidegree-extension`.

**Proof outline.** Use finite Fourier inversion on each quotient (Z/p^mZ)^g. Expand centered monomials in ordinary monomials. The moment equalities imply equality on the dense locally polynomial subspace and hence equality of continuous functionals.

**Acceptance checks.** Testing χ=1 alone need not recover local coset information.

**Sources.** [P-adic integration on ray class groups and non-ordinary p-adic L-functions](https://arxiv.org/pdf/1304.4042), §2.3, Definitions 2.11–2.14, Remark 2.13 and Theorem 2.15, printed pp. 4–5. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Failure at a critical coordinate order

`L2/critical-vector-counterexample` · lemma.

If r_i=N_i+1 in one coordinate, the tensor functional d_i^{N_i+1}δ_0 is nonzero, continuous of that order, and annihilates all separately locally polynomial tests of degree ≤N_i in that coordinate. Thus uniqueness from that test class fails at the endpoint.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L1/amice-derivative`, `LocallyAnalyticDistributions:L2/order-r-distributions`, `LocallyAnalyticDistributions:L2/anisotropic-tensor-wavelets`.

**Proof outline.** The derivative of each local polynomial of degree ≤N_i vanishes at order N_i+1. Evaluate on x_i^{N_i+1} near zero to obtain (N_i+1)!≠0. Use the C^{N_i+1} derivative evaluation bound.

**Acceptance checks.** For N_i=0, d_iδ_0 kills every locally constant function.

**Sources.** [P-adic integration on ray class groups and non-ordinary p-adic L-functions](https://arxiv.org/pdf/1304.4042), §2.2, Remark 2.10, printed p. 4; worker tensor counterexample using Colmez §II.4.4. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Isotropic and vector growth bounds differ

`L2/isotropic-anisotropic-distinction` · comparison.

The isotropic order-r norm on Z_p^g weights a multivariate locally constant wavelet by p^(floor(r·max_iℓ(n_i))); tensor vector order weights by p^(Σ_i floor(r_iℓ(n_i))). Their extension criteria use, respectively, equal-radius cosets and all rectangular cosets. They must not be identified merely by r=Σ_i r_i.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L2/anisotropic-tensor-wavelets`, `LocallyAnalyticDistributions:L2/rectangular-growth`.

**Proof outline.** Compare the two explicit wavelet scalings at diagonal and single-coordinate indices. Equal-radius bounds constrain only one ray of the conductor lattice; rectangular growth supplies independent coordinate control.

**Acceptance checks.** With g=2 and r_1=r_2>0, indices (p^m,1) and (p^m,p^m) distinguish the sum and maximum weights.

**Sources.** [P-adic integration on ray class groups and non-ordinary p-adic L-functions](https://arxiv.org/pdf/1304.4042), §2.1, Definition 2.5 and Theorem 2.9, printed pp. 2–4; §2.3, p. 5. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### From conductor bounds to analytic ray-class distributions

`L2/rayclass-growth-adapter` · comparison.

An imported ray-class distribution with conductor growth bound v(μ(class modulo ∏p^{m_p}))≥C−Σ_p e_p v(α_p)m_p gives the indicated rectangular growth on compatible p-adic Lie factors. If only the equal-radius bound r=Σ_p e_pv(α_p)<1 is established, the isotropic extension theorem applies. The arithmetic construction and finite-additivity relation remain with their existing measure/L-function owners.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L2/rectangular-extension`, `LocallyAnalyticDistributions:L2/isotropic-anisotropic-distinction`, `PadicMeasuresIwasawaAlgebras:L0`.

**Proof outline.** Translate the conductor exponents through the imported local reciprocity/chart map and its ramification indices. Check finite additivity and a uniform bound on the finitely many charts. Apply the appropriate isotropic or vector-order extension; individual rectangular bounds are not inferred from their diagonal sum.

**Acceptance checks.** A bound on total conductor alone does not imply every anisotropic order tuple.

**Sources.** [P-adic integration on ray class groups and non-ordinary p-adic L-functions](https://arxiv.org/pdf/1304.4042), §3.1, Definition 3.1 and Theorem 3.3, printed pp. 6–7. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### A positive-order distribution that is not a measure

`L2/positive-order-nonmeasure` · lemma.

dδ_0 on Z_p is an order-one locally analytic distribution and is not a bounded measure. In particular positive-order family tests cannot be satisfied by a construction containing bounded measures alone.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L1/amice-derivative`, `LocallyAnalyticDistributions:L2/order-r-distributions`, `LocallyAnalyticDistributions:L2/order-zero-measures`.

**Proof outline.** Its transform log(1+T) has coefficients (−1)^{n+1}/n with unbounded p-adic norms along n=p^m. The imported bounded Amice theorem would require bounded coefficients for a measure.

**Acceptance checks.** The coefficient at p^m has norm p^m.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.3, Proposition II.3.1, printed p. 31; §II.4.4, printed p. 35. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

## L3. Distribution Mellin and character-space sections

### Mellin series on a finite-character component

`L3/finite-character-component-mellin` · construction.

Let G be compact and let H:G≃Δ×Z_p be an imported character chart, Δ a finite discrete set. Let ν:Δ→K be the finite-character value function (the formula also makes sense for any ν). For a native bounded measure μ on G define F_{μ,ν,H}(T)=Σ_{n≥0} μ(g↦ν(H(g)_Δ) binom(H(g)_Z,n)) T^n. Multiplication uses K, with the native algebra map Z_p→K on binomial values. This is the Mellin series adapter on the imported component; it does not construct Δ, H, the character functor or its representing space.

**Hypotheses.** K is a finite extension of Q_p with its normalized nonarchimedean absolute value; the elementary series lemmas also hold over any complete nontrivially normed ultrametric field. An open-disc series F means a native power series with ||a_n|| R^n tending to zero for every real 0<R<1. Write E(F,t) for the native FormalMultilinearSeries.ofScalarsSum of its coefficients; analytic uses require ||t||<1. No convergence claim is made at ||t||=1.

**Inputs.** `PadicMeasuresIwasawaAlgebras:L0a`, `mathlib:AbstractMeasure`, `mathlib:AbstractMeasure.dirac`, `mathlib:mahler`, `mathlib:AbstractMeasure.amiceTransform`, `mathlib:AbstractMeasure.coeff_amiceTransform`.

**Proof outline.** Each test function is a native continuous map: Δ is finite discrete and the native Mahler polynomial is continuous. Apply μ and use the native power-series coefficient constructor. Linearity, Dirac values and mass follow directly from the native measure API.

**Uses.** RJW Remark 3.47: Realizes bounded-measure evaluation on a prescribed finite-character component. DirichletPadicLFunctions:L3; AutomorphicPadicLFunctions:L0: Supplies the scalar Mellin output on imported one-variable character charts.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.Mellin.componentMellin` | Let G be compact and let H:G≃Δ×Z_p be an imported character chart, Δ a finite discrete set. Let ν:Δ→K be the finite-character value function (the formula also makes sense for any ν). For a native bounded measure μ on G define F_{μ,ν,H}(T)=Σ_{n≥0} μ(g↦ν(H(g)_Δ) binom(H(g)_Z,n)) T^n. Multiplication uses K, with the native algebra map Z_p→K on binomial values. This is the Mellin series adapter on the imported component; it does not construct Δ, H, the character functor or its representing space. |
| `TauCeti.Mellin.componentMellin_coeff` | The nth coefficient is μ(ν∘H_Δ times binom(H_Z,n)). |
| `TauCeti.Mellin.componentMellin_add` | F_{μ+η,ν,H}=F_{μ,ν,H}+F_{η,ν,H}. |
| `TauCeti.Mellin.componentMellin_smul` | F_{aμ,ν,H}=aF_{μ,ν,H}. |
| `TauCeti.Mellin.componentMellin_dirac` | F_{δ_g,ν,H}=ν(H_Δg)Σ_n binom(H_Zg,n)T^n. |
| `TauCeti.Mellin.componentMellin_mass` | coeff_0 F=μ(ν∘H_Δ). |

**Unit tests.**

- `ComponentMellinTests.zero` (degenerate): F_{0,ν,H}=0.
- `ComponentMellinTests.finite_atom` (computation): F_{δ_(δ,0),ν,H}=ν(δ) as a constant series.
- `ComponentMellinTests.generator_atom` (computation): F_{δ_(δ,1),ν,H}=ν(δ)(1+T).
- `ComponentMellinTests.native_amice` (compatibility): For G=Z_p, Δ a singleton, its canonical product chart and ν=1, componentMellin μ equals the native AbstractMeasure.amiceTransform μ.

**Acceptance checks.** A Dirac mass at H inverse(δ,0) gives the constant ν(δ). A Dirac mass at H inverse(δ,1) gives ν(δ)(1+T). The trivial finite factor gives the existing native bounded Amice transform.

**Sources.** [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Remark 3.47, pp. 25–26; §5.3, pp. 34–35 (formula immediately before Remark 5.22). Component evaluation and the branch parameterization; this adapter uses imported character charts and retains the source’s odd-prime convention where that specialization is discussed.

### Bounded component Mellin coefficients

`L3/component-mellin-coefficient-bound` · lemma.

Under the component-Mellin hypotheses, if C≥0 and ||ν(δ)||≤C for every δ, then ||coeff_n F_{μ,ν,H}||≤||μ||C for every n, where ||μ|| is the native continuous-linear-functional operator norm. For finite characters in a splitting field one may take C=1.

**Hypotheses.** K is a finite extension of Q_p with its normalized nonarchimedean absolute value; the elementary series lemmas also hold over any complete nontrivially normed ultrametric field. An open-disc series F means a native power series with ||a_n|| R^n tending to zero for every real 0<R<1. Write E(F,t) for the native FormalMultilinearSeries.ofScalarsSum of its coefficients; analytic uses require ||t||<1. No convergence claim is made at ||t||=1.

**Inputs.** `LocallyAnalyticDistributions:L3/finite-character-component-mellin`, `mathlib:PadicInt.norm_mahler_eq`.

**Proof outline.** The native Mahler function has norm one. The bounded Z_p-action implies its K-valued realization has norm at most one. The test function is therefore bounded by C uniformly on G. Apply the operator-norm inequality to μ.

**Acceptance checks.** A finite-character weighted atom has coefficient bound ||ν(δ)||. Changing ν to a scalar multiple scales the bound.

**Sources.** [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Remark 3.47, pp. 25–26; §5.3, pp. 34–35 (formula immediately before Remark 5.22). Component evaluation and the branch parameterization; this adapter uses imported character charts and retains the source’s odd-prime convention where that specialization is discussed.

### Bounded component series are analytic on the disc

`L3/component-mellin-open-disc` · theorem.

For every μ,ν,H as above, the component series is open-disc analytic and has uniformly bounded coefficients. It is therefore a bounded rigid function when transported to the imported component. This forward comparison does not by itself prove that every bounded rigid function comes from a measure.

**Hypotheses.** K is a finite extension of Q_p with its normalized nonarchimedean absolute value; the elementary series lemmas also hold over any complete nontrivially normed ultrametric field. An open-disc series F means a native power series with ||a_n|| R^n tending to zero for every real 0<R<1. Write E(F,t) for the native FormalMultilinearSeries.ofScalarsSum of its coefficients; analytic uses require ||t||<1. No convergence claim is made at ||t||=1.

**Inputs.** `LocallyAnalyticDistributions:L3/component-mellin-coefficient-bound`, `LocallyAnalyticDistributions:L1/open-disc-evaluation-analytic`, `mathlib:PowerSeries.isRestricted_iff'`.

**Proof outline.** Finiteness of Δ gives C bounding ν. Apply component-mellin-coefficient-bound. For every R<1, multiply the coefficient bound by R^n tending to zero. Apply the native restrictedness criterion and open-disc-evaluation-analytic.

**Acceptance checks.** The generator atom gives the bounded polynomial ν(δ)(1+T).

**Sources.** [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Remark 3.47, pp. 25–26; §5.3, pp. 34–35 (formula immediately before Remark 5.22). Component evaluation and the branch parameterization; this adapter uses imported character charts and retains the source’s odd-prime convention where that specialization is discussed.

### Character evaluation equals the component Mellin value

`L3/component-mellin-evaluation` · theorem.

For ||t||<1 let κ_t:Z_p→K be the native additive character with κ_t(1)=1+t. Then E(F_{μ,ν,H},t)=μ(g↦ν(H_Δg)κ_t(H_Zg)). If H is a group chart and ν a finite character, its right side is the scalar character integral on the imported component. The statement uses continuous maps and genuine coefficient-field points.

**Hypotheses.** K is a finite extension of Q_p with its normalized nonarchimedean absolute value; the elementary series lemmas also hold over any complete nontrivially normed ultrametric field. An open-disc series F means a native power series with ||a_n|| R^n tending to zero for every real 0<R<1. Write E(F,t) for the native FormalMultilinearSeries.ofScalarsSum of its coefficients; analytic uses require ||t||<1. No convergence claim is made at ||t||=1.

**Inputs.** `LocallyAnalyticDistributions:L3/finite-character-component-mellin`, `LocallyAnalyticDistributions:L3/component-mellin-open-disc`, `LocallyAnalyticDistributions:L1/open-disc-summability`, `mathlib:PadicInt.addChar_of_value_at_one`, `mathlib:PadicInt.coe_addChar_of_value_at_one`, `mathlib:PadicInt.hasSum_mahlerSeries`, `mathlib:ContinuousLinearMap.map_tsum`.

**Proof outline.** The native additive character is the Mahler series with coefficients t^n. Its weighted pullback through H is the uniform sum of the component’s continuous test functions multiplied by t^n. Uniform convergence follows from the sup-norm bound C||t||^n. Use the native ContinuousLinearMap.map_tsum on μ, then componentMellin_coeff and native scalar-series evaluation.

**Acceptance checks.** t=0 gives the finite-character mass μ(ν∘H_Δ). For a generator atom the value is ν(δ)(1+t).

**Sources.** [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Remark 3.47, pp. 25–26; §5.3, pp. 34–35 (formula immediately before Remark 5.22). Component evaluation and the branch parameterization; this adapter uses imported character charts and retains the source’s odd-prime convention where that specialization is discussed. [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.2, Lemma II.2.1 and Theorem II.2.2 with proofs, author PDF p. 30. Worker decomposition of the evaluation and radius estimates used here; the source does not assign separate numbers to these elementary adapters.

### Mellin branches in an arithmetic parameter

`L3/branch-mellin` · construction.

For an open-disc series F, q∈K with ||q||<1, and s∈Z_p, put B_{F,q}(s)=E(F,κ_q(s)−1), using the native κ_q(1)=1+q. In the standard odd-prime unit chart, γ=1+p, q=γ−1, and ν=ω^i, this is Mel_{μ,i}(s)=∫ω(x)^i〈x〉^s dμ. At p=2 the imported chart is {±1}×(1+4Z_2), with γ=5; the odd-prime chart is not used there.

**Hypotheses.** K is a finite extension of Q_p with its normalized nonarchimedean absolute value; the elementary series lemmas also hold over any complete nontrivially normed ultrametric field. An open-disc series F means a native power series with ||a_n|| R^n tending to zero for every real 0<R<1. Write E(F,t) for the native FormalMultilinearSeries.ofScalarsSum of its coefficients; analytic uses require ||t||<1. No convergence claim is made at ||t||=1.

**Inputs.** `LocallyAnalyticDistributions:L3/branch-coordinate-domain`, `LocallyAnalyticDistributions:L3/component-mellin-evaluation`, `mathlib:PadicInt.addChar_of_value_at_one`, `PadicMeasuresIwasawaAlgebras:L0a`.

**Proof outline.** Use the already constructed native κ_q; no new exponentiation is defined. Apply branch-coordinate-domain to ensure the argument is inside the disc. Evaluate the component series; component-mellin-evaluation gives its character-integral interpretation when the imported chart is the standard unit chart.

**Uses.** RJW §5.3, formula before Remark 5.22: Pins the unshifted scalar Mellin parameter s; arithmetic zeta-function normalization s↦1−s belongs to DirichletPadicLFunctions:L3.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.Mellin.branchMellin` | For an open-disc series F, q∈K with ∣∣q∣∣<1, and s∈Z_p, put B_{F,q}(s)=E(F,κ_q(s)−1), using the native κ_q(1)=1+q. In the standard odd-prime unit chart, γ=1+p, q=γ−1, and ν=ω^i, this is Mel_{μ,i}(s)=∫ω(x)^i〈x〉^s dμ. At p=2 the imported chart is {±1}×(1+4Z_2), with γ=5; the odd-prime chart is not used there. |
| `TauCeti.Mellin.branchMellin_def` | B_{F,q}(s)=E(F,κ_q(s)−1). |
| `TauCeti.Mellin.branchMellin_zero` | B_{F,q}(0)=coeff_0 F. |
| `TauCeti.Mellin.branchMellin_one` | B_{F,q}(1)=E(F,q). |
| `TauCeti.Mellin.branchMellin_add` | B_{F+H,q}(s)=B_{F,q}(s)+B_{H,q}(s) for two open-disc series. |

**Unit tests.**

- `BranchMellinTests.zero` (degenerate): B_{0,q}(s)=0.
- `BranchMellinTests.constant` (computation): B_{a,q}(s)=a for a constant series.
- `BranchMellinTests.linear_at_one` (computation): B_{T,q}(1)=q.
- `BranchMellinTests.generator_at_zero` (computation): B_{1+T,q}(0)=1.

**Acceptance checks.** s=0 gives coeff_0(F). s=1 evaluates F at q. For F=1+T, the branch is κ_q(s), rather than its inverse or a shifted branch.

**Sources.** [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Remark 3.47, pp. 25–26; §5.3, pp. 34–35 (formula immediately before Remark 5.22). Component evaluation and the branch parameterization; this adapter uses imported character charts and retains the source’s odd-prime convention where that specialization is discussed.

### Arithmetic branches stay inside the character disc

`L3/branch-coordinate-domain` · lemma.

For q∈K with ||q||<1 and s∈Z_p, ||κ_q(s)−1||≤||q||<1.

**Hypotheses.** K is a finite extension of Q_p with its normalized nonarchimedean absolute value; the elementary series lemmas also hold over any complete nontrivially normed ultrametric field. An open-disc series F means a native power series with ||a_n|| R^n tending to zero for every real 0<R<1. Write E(F,t) for the native FormalMultilinearSeries.ofScalarsSum of its coefficients; analytic uses require ||t||<1. No convergence claim is made at ||t||=1.

**Inputs.** `mathlib:PadicInt.addChar_of_value_at_one`, `mathlib:PadicInt.coe_addChar_of_value_at_one`, `mathlib:PadicInt.hasSum_mahlerSeries`, `mathlib:PadicInt.norm_mahler_eq`.

**Proof outline.** Expand κ_q by its native Mahler series; its constant term is one. For n≥1, ||binom(s,n)q^n||≤||q||^n≤||q||, using native Mahler norm one and bounded scalar action. Pass the ultrametric bound to the convergent sum.

**Acceptance checks.** s=0 gives zero. s=1 gives equality with ||q||.

**Sources.** [Fonctions d'une variable p-adique](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.2, Lemma II.2.1 and Theorem II.2.2 with proofs, author PDF p. 30. Worker decomposition of the evaluation and radius estimates used here; the source does not assign separate numbers to these elementary adapters.

### Mellin evaluation at integral weights

`L3/branch-integer-evaluation` · lemma.

For n≥0, B_{F,q}(n)=E(F,(1+q)^n−1). This pins integral specialization of a branch independently of arithmetic L-value interpolation. In the canonical unit chart, recovering x^k additionally requires the finite character ν=ω^i with k≡i modulo p−1 for odd p, and the corresponding parity branch at p=2; those coordinate comparisons are a remaining supplier interface.

**Hypotheses.** K is a finite extension of Q_p with its normalized nonarchimedean absolute value; the elementary series lemmas also hold over any complete nontrivially normed ultrametric field. An open-disc series F means a native power series with ||a_n|| R^n tending to zero for every real 0<R<1. Write E(F,t) for the native FormalMultilinearSeries.ofScalarsSum of its coefficients; analytic uses require ||t||<1. No convergence claim is made at ||t||=1.

**Inputs.** `LocallyAnalyticDistributions:L3/branch-mellin`, `mathlib:PadicInt.addChar_of_value_at_one_def`.

**Proof outline.** The native additive-character law gives κ_q(n)=κ_q(1)^n=(1+q)^n. Substitute into branchMellin_def.

**Acceptance checks.** n=0 gives F(0). n=1 gives F(q); no 1−n shift is inserted.

**Sources.** [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Remark 3.47, pp. 25–26; §5.3, pp. 34–35 (formula immediately before Remark 5.22). Component evaluation and the branch parameterization; this adapter uses imported character charts and retains the source’s odd-prime convention where that specialization is discussed.

### Mellin evaluation on a clearing-factor domain

`L3/meromorphic-mellin-clearing` · construction.

For open-disc numerator F and denominator D define Q_{F,D}(t)=E(F,t)/E(D,t) only as a meromorphic chart expression. All evaluation theorems require ||t||<1 and E(D,t)≠0. For a pseudomeasure λ imported from PMIA L3 and a genuine clearing numerator μ=([a]−[1])λ, F is the component Mellin series of μ and D represents κ_t(a)−1. A quotient’s total value at a zero denominator has no meromorphic meaning; no extension of the pseudomeasure’s value is asserted there.

**Hypotheses.** K is a finite extension of Q_p with its normalized nonarchimedean absolute value; the elementary series lemmas also hold over any complete nontrivially normed ultrametric field. An open-disc series F means a native power series with ||a_n|| R^n tending to zero for every real 0<R<1. Write E(F,t) for the native FormalMultilinearSeries.ofScalarsSum of its coefficients; analytic uses require ||t||<1. No convergence claim is made at ||t||=1.

**Inputs.** `LocallyAnalyticDistributions:L3/component-mellin-evaluation`, `LocallyAnalyticDistributions:L1/open-disc-evaluation-mul`, `PadicMeasuresIwasawaAlgebras:L3`.

**Proof outline.** Use component-mellin-evaluation for the numerator and native scalar evaluation for the denominator. Divide on the nonvanishing locus. The source’s generator case gives a possible simple pole at the trivial character; a general clearing element may vanish at more characters, so its entire nonvanishing locus is kept explicit.

**Uses.** RJW Remark 3.47, last paragraph: Realizes pseudomeasures as analytic quotients on legitimate clearing domains; avoids silently evaluating a pole. DirichletPadicLFunctions:L3: Supplies analytic quotient evaluation, while that consumer owns zeta-specific pole and residue formulas.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.Mellin.quotientMellin` | For open-disc numerator F and denominator D define Q_{F,D}(t)=E(F,t)/E(D,t) only as a meromorphic chart expression. All evaluation theorems require ∣∣t∣∣<1 and E(D,t)≠0. For a pseudomeasure λ imported from PMIA L3 and a genuine clearing numerator μ=([a]−[1])λ, F is the component Mellin series of μ and D represents κ_t(a)−1. A quotient’s total value at a zero denominator has no meromorphic meaning; no extension of the pseudomeasure’s value is asserted there. |
| `TauCeti.Mellin.quotientMellin_def` | Q_{F,D}(t)=E(F,t)/E(D,t); meaningful use is guarded by the nonvanishing condition. |
| `TauCeti.Mellin.quotientMellin_clear` | E(D,t)Q_{F,D}(t)=E(F,t) when E(D,t)≠0. |
| `TauCeti.Mellin.quotientMellin_one` | Q_{F,1}(t)=E(F,t). |
| `TauCeti.Mellin.quotientMellin_zero` | A zero numerator yields zero on every admissible domain. |

**Unit tests.**

- `QuotientMellinTests.no_denominator` (compatibility): Q_{F,1}(t)=E(F,t).
- `QuotientMellinTests.simple_pole` (computation): Q_{1,T}(t)=t inverse for t≠0.
- `QuotientMellinTests.removable_on_punctured_disc` (computation): Q_{T,T}(t)=1 for t≠0.
- `QuotientMellinTests.trivial_character_excluded` (non-example): E(T,0)=0, so the chart domain for denominator T excludes the trivial character.

**Acceptance checks.** The denominator 1 recovers ordinary analytic evaluation. F=1,D=T gives 1/t for t≠0. F=D=T gives 1 on the punctured disc; this is a removable expression, not a value assigned to λ at the trivial character.

**Sources.** [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Remark 3.47, pp. 25–26; §5.3, pp. 34–35 (formula immediately before Remark 5.22). Component evaluation and the branch parameterization; this adapter uses imported character charts and retains the source’s odd-prime convention where that specialization is discussed.

### Agreement of Mellin clearing expressions

`L3/meromorphic-clearing-independence` · lemma.

If F,D,F′,D′ are open-disc series with FD′=F′D, then Q_{F,D}(t)=Q_{F′,D′}(t) at every ||t||<1 for which both denominator values are nonzero. Applied to the algebraic clearing compatibility imported from PMIA L3 this proves independence on chart overlaps; it does not construct a total-fraction-ring character homomorphism.

**Hypotheses.** K is a finite extension of Q_p with its normalized nonarchimedean absolute value; the elementary series lemmas also hold over any complete nontrivially normed ultrametric field. An open-disc series F means a native power series with ||a_n|| R^n tending to zero for every real 0<R<1. Write E(F,t) for the native FormalMultilinearSeries.ofScalarsSum of its coefficients; analytic uses require ||t||<1. No convergence claim is made at ||t||=1.

**Inputs.** `LocallyAnalyticDistributions:L3/meromorphic-mellin-clearing`, `LocallyAnalyticDistributions:L1/open-disc-evaluation-mul`, `PadicMeasuresIwasawaAlgebras:L3`.

**Proof outline.** Apply open-disc-evaluation-mul to the cross-product identity. Cancel the two nonzero denominator values in K. The algebraic pseudomeasure compatibility is supplied by its existing owner, not assumed to hold at arbitrary denominator zeros.

**Acceptance checks.** The presentations (T,T) and (1,1) agree for t≠0. No assertion is made at a zero of either chosen denominator.

**Sources.** [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Remark 3.47, pp. 25–26; §5.3, pp. 34–35 (formula immediately before Remark 5.22). Component evaluation and the branch parameterization; this adapter uses imported character charts and retains the source’s odd-prime convention where that specialization is discussed.

### Distribution Mellin components

`L3/unbounded-component-mellin` · construction.

Let G≃Δ×Z_p^d be an imported analytic group chart, Δ finite abelian, and K contain the values of its finite characters. For ν∈Δ̂ set M_ν(μ)(T)=Σ_α μ(ν(δ)·∏_i binom(z_i,α_i))T^α. This is a native multivariate series convergent on every strictly smaller closed polydisc. It is the unbounded distribution construction; the inherited bounded scalar component is its restriction to imported measures.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L1/amice-transform`, `LocallyAnalyticDistributions:L0/product-analytic-tensor`, `PadicMeasuresIwasawaAlgebras:L0a`, `mathlib:MvPowerSeries.coeff`.

**Proof outline.** Decompose by the finite Fourier idempotents of Δ. Apply multivariate unbounded Amice duality to each analytic Z_p^d component. Use the character-space chart supplied by PMIA L0a; no representability or universal character is reconstructed.

**Uses.** RJW Theorem 3.43 and Remark 3.47: Character integration is analytic in the open-disc parameter. Families and weight derivatives: Coefficients encode unbounded locally analytic distributions.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.AnalyticDistributions.distributionMellin` | The coefficient formula defines the Mellin map. |
| `TauCeti.AnalyticDistributions.distributionMellin_coeff` | Its α coefficient is the indicated locally analytic moment. |
| `TauCeti.AnalyticDistributions.distributionMellin_ext` | Equality of all components and coefficients implies equality of distributions. |

**Unit tests.**

- `AnalyticDistributionTests.distributionMellin_point` (computation): At δ_(δ,0) the ν component is the constant ν(δ).
- `AnalyticDistributionTests.distributionMellin_trivial_group` (degenerate): For Δ trivial and d=0 the transform is the mass in K.
- `AnalyticDistributionTests.distributionMellin_bounded` (compatibility): For d=1 and a bounded measure this is the inherited componentMellin series.

**Acceptance checks.** For δ_(δ,z), the component is ν(δ)∏(1+T_i)^{z_i}.

**Sources.** [The cohomology of locally analytic representations](https://esaga.net/f/jan.kohlhaase/Kohlhaase_Locally_Analytic_Cohomology.pdf), Theorem 4.4 and its coefficient model, printed pp. 21–22. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Mellin as a Fréchet algebra isomorphism

`L3/mellin-frechet-isomorphism` · theorem.

For compact abelian G with an open Z_p^d subgroup, the distribution Mellin transform gives D(G,K)≃O(W_G) as topological K-algebras, with the strong/projective-limit topology on D and the closed-polydisc Fréchet topology on O(W_G). Finite character components are taken after a finite splitting extension and descended if necessary.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L3/unbounded-component-mellin`, `LocallyAnalyticDistributions:L0/compact-type-dual-reflexivity`, `LocallyAnalyticDistributions:L1/amice-convolution`, `PadicMeasuresIwasawaAlgebras:L0a`.

**Proof outline.** Use multivariate Amice’s coefficient-growth characterization and its inverse on each Δ component. Compare the cofinal Banach seminorm systems on the two sides; coefficientwise bijectivity alone does not prove topological equivalence. Descend the finite Fourier decomposition through the imported character-space coefficient-extension compatibility.

**Acceptance checks.** For Z_p^d the target is the open unit polydisc. For F-analytic distributions with [F:Q_p]>1, the target is the F-analytic character subspace, not the whole Q_p character space.

**Sources.** [The cohomology of locally analytic representations](https://esaga.net/f/jan.kohlhaase/Kohlhaase_Locally_Analytic_Cohomology.pdf), Theorem 4.4 and its coefficient model, printed pp. 21–22. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Bounded Mellin functions and measures

`L3/bounded-mellin-characterisation` · comparison.

Inside the unbounded Mellin algebra, the imported bounded measures are exactly the components with uniformly bounded coefficients, equivalently uniformly bounded Gauss norms as the polyradii approach 1. Boundedness refers to all rigid points after finite coefficient extension, not just K-rational points.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism`, `PadicMeasuresIwasawaAlgebras:L2/field-bounded-amice-isometry`, `LocallyAnalyticDistributions:L3/component-mellin-coefficient-bound`.

**Proof outline.** Apply the imported bounded Amice isometry in each factor and finite character component. Let the polyradii tend to 1 in each coefficient estimate to recover the uniform coefficient bound.

**Acceptance checks.** log(1+T) fails boundedness along coefficients n=p^m. The zero-order dual is imported from the measure owner.

**Sources.** [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Theorem 3.43 and Remark 3.47, printed pp. 24–26; §5.3, printed pp. 34–35. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Evaluation of distributions at analytic characters

`L3/mellin-character-evaluation` · lemma.

For every locally analytic character κ:G→L^× over a finite extension L/K, evaluation of the coefficient-extended Mellin function at κ equals μ_L(κ). The character is an analytic test function on a common radius.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L3/unbounded-component-mellin`, `LocallyAnalyticDistributions:L0/compact-uniform-radius`.

**Proof outline.** At a character chart κ(δ,z)=ν(δ)∏(1+t_i)^{z_i}, substitute the binomial expansion. Use convergence in an analytic Banach stage before applying μ; continuity on C⁰ is not available for an unbounded distribution.

**Acceptance checks.** At the trivial character the value is μ(1).

**Sources.** [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Theorem 3.43 and Remark 3.47, printed pp. 24–26; §5.3, printed pp. 34–35. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Multiplicativity of distribution Mellin

`L3/mellin-convolution` · lemma.

For compact abelian G, M(λ*μ)(κ)=M(λ)(κ)M(μ)(κ), hence the Mellin transform sends convolution to analytic multiplication.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L1/distribution-convolution`, `LocallyAnalyticDistributions:L3/mellin-character-evaluation`.

**Proof outline.** Evaluate the iterated distribution on κ(xy)=κ(x)κ(y). Apply component coefficient uniqueness to pass from all analytic character evaluations to the function identity.

**Acceptance checks.** For atoms the value is κ(ab)=κ(a)κ(b).

**Sources.** [p-adic Fourier theory](https://arxiv.org/pdf/math/0102012v1), §1, Lemmas 1.1–1.2 and Proposition 1.4, printed pp. 3–6. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Mellin compatibility with a different generator

`L3/mellin-generator-change` · lemma.

In a rank-one chart with γ′=γ^u for u∈Z_p^×, the coordinate relation is t′=(1+t)^u−1 and the new component function is F′(t′)=F((1+t′)^{u^(−1)}−1). This is an adapter for the coordinate transition imported from PMIA L0a.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L3/mellin-character-evaluation`, `PadicMeasuresIwasawaAlgebras:L0a`.

**Proof outline.** Evaluate the same character on the two generators. Apply the imported chart substitution and identify the coefficient functions by their character values.

**Acceptance checks.** For u=−1 the inverse substitution is (1+t′)^(−1)−1. Substituting u rather than u^(−1) into F generally gives the wrong transition.

**Sources.** [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Theorem 3.43 and Remark 3.47, printed pp. 24–26; §5.3, printed pp. 34–35. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Local analyticity in an arithmetic weight parameter

`L3/mellin-weight-analyticity` · lemma.

For a unit-character branch κ_(i,s)(x)=ω(x)^i〈x〉^s at odd p, or the imported {±1}×(1+4Z_2) branch at p=2, s↦μ(κ_(i,s)) is locally Q_p-analytic on Z_p for any locally analytic distribution μ. On sufficiently small s-discs it is the composition of its Mellin component with t(s)=γ^s−1.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L3/mellin-character-evaluation`, `LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism`, `LocallyAnalyticDistributions:L3/branch-mellin`, `PadicMeasuresIwasawaAlgebras:L0a`.

**Proof outline.** Shrink the parameter disc so log/exp converge uniformly in the relevant analytic function stage. Apply the continuous distribution to the resulting analytic Banach-valued character family.

**Acceptance checks.** The formula is unshifted in s; the arithmetic zeta normalization s↦1−s belongs to its L-function owner.

**Sources.** [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Theorem 3.43 and Remark 3.47, printed pp. 24–26; §5.3, printed pp. 34–35. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Weight differentiation and logarithmic moments

`L3/mellin-weight-derivative` · lemma.

For the preceding branch, d/ds M_(μ,i)(s)=μ(log〈x〉·ω(x)^i〈x〉^s). If F is its component series, the same derivative is log(γ)(1+t(s))F′(t(s)). Repeated derivatives insert powers of log〈x〉.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L3/mellin-weight-analyticity`, `LocallyAnalyticDistributions:L1/distribution-multiply`.

**Proof outline.** Differentiate the Banach-valued character expansion on a sufficiently small parameter disc. Apply the continuous functional and the chain rule to t(s)=exp(s logγ)−1.

**Acceptance checks.** For the atom at γ the branch is γ^s and its derivative at s=0 is logγ. Omitting logγ would give 1 instead.

**Sources.** [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Theorem 3.43 and Remark 3.47, printed pp. 24–26; §5.3, printed pp. 34–35. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Twists of the distribution Mellin transform

`L3/mellin-twist` · lemma.

For a locally analytic character θ of compact abelian G, M(θμ)(κ)=M(μ)(θκ). A finite character twist permutes Δ components; an analytic principal-unit twist gives the imported translated coordinate substitution.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L1/distribution-multiply`, `LocallyAnalyticDistributions:L3/mellin-character-evaluation`.

**Proof outline.** Evaluate the definition against κ and multiply its analytic test functions. Use the imported group law on character space rather than define a second weight-space action.

**Acceptance checks.** For θ=1 the component is unchanged.

**Sources.** [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Theorem 3.43 and Remark 3.47, printed pp. 24–26; §5.3, printed pp. 34–35. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Mellin functoriality for group maps

`L3/mellin-pushforward` · lemma.

For an analytic homomorphism f:G→H of compact abelian p-adic groups, M(f_*μ)(κ)=M(μ)(κ∘f). The imported morphism W_H→W_G gives the corresponding pullback on analytic functions.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L1/distribution-pushforward`, `LocallyAnalyticDistributions:L3/mellin-character-evaluation`, `PadicMeasuresIwasawaAlgebras:L0a`.

**Proof outline.** Transpose pullback on analytic functions. Evaluate on κ and identify the character-space morphism by its universal property.

**Acceptance checks.** For multiplication by p on Z_p the coordinate pullback is T↦(1+T)^p−1.

**Sources.** [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Theorem 3.43 and Remark 3.47, printed pp. 24–26; §5.3, printed pp. 34–35. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Finite coefficient extension of Mellin

`L3/mellin-coefficient-extension` · comparison.

For finite L/K, D(G,K)⊗_K L with its finite-product topology identifies with D(G,L), and Mellin commutes with O(W_G)⊗_K L≃O(W_(G,L)). Finite-dimensionality is required; this statement makes no claim for an arbitrary completed tensor with an infinite-dimensional affinoid.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism`, `LocallyAnalyticDistributions:L0/multivariable-fixed-radius`.

**Proof outline.** Choose a finite K-basis of L to decompose analytic test functions and continuous duals coordinatewise. Finite products commute with the defining inductive and projective limits. Identify the transform coefficientwise and use the imported geometric finite base change.

**Acceptance checks.** L=K gives the identity.

**Sources.** [p-adic Fourier theory](https://arxiv.org/pdf/math/0102012v1), §1, Lemmas 1.1–1.2 and Proposition 1.4, printed pp. 3–6. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Rigid and adic Mellin comparison

`L3/mellin-adic-comparison` · comparison.

On the character space supplied by PMIA L0a, the rigid Mellin function corresponds under the imported rigid/adic equivalence to an adic analytic section. Its restrictions on affinoid character charts agree with the radius-wise Mellin seminorms and with character evaluation at rank-one points.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`, `PadicMeasuresIwasawaAlgebras:L0a`.

**Proof outline.** Import the rigid/adic equivalence and the geometric character space; do not define a new representability functor. Identify sections on the same rational affinoid charts and glue using the sheaf equalities.

**Acceptance checks.** Rank-one evaluation agrees with the scalar transform. Point characters alone are not a proof of representability.

**Sources.** [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645), Definition 2.2.17, printed p. 21; §§4.6.46–4.6.49, printed pp. 93–95. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Gluing genuine pseudomeasure Mellin numerators

`L3/meromorphic-mellin-gluing` · lemma.

For an imported pseudomeasure λ and an actual clearing element c_g=[g]−[1], write n_g=c_gλ in the measure algebra. On the character open where κ(g)−1 is invertible, define M(λ)=M(n_g)/(κ(g)−1). The actual numerator cross-products make these local analytic quotients agree on overlaps; no evaluation homomorphism from the full total quotient ring is constructed.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L3/mellin-character-evaluation`, `LocallyAnalyticDistributions:L3/meromorphic-clearing-independence`, `PadicMeasuresIwasawaAlgebras:L3/cleared-numerator`, `PadicMeasuresIwasawaAlgebras:L3/cross-multiplied-numerators`, `PadicMeasuresIwasawaAlgebras:L3/independence-of-clearing-factor`.

**Proof outline.** Apply bounded Mellin to c_h n_g=c_g n_h. On overlap affinoids invert the two analytic denominator sections and cancel; then invoke the imported analytic sheaf property. A denominator nonzero as a global section is not necessarily invertible at every point.

**Acceptance checks.** On an integral measure the glued function is the ordinary Mellin transform. The trivial character kills every c_g and is outside these evaluation opens.

**Sources.** [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Theorem 3.43 and Remark 3.47, printed pp. 24–26; §5.3, printed pp. 34–35. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Local pole order of a clearing presentation

`L3/clearing-pole-order` · lemma.

On a smooth rank-one character disc, if a genuine denominator κ(g)−1 has a zero of multiplicity m and is not identically zero, the corresponding pseudomeasure Mellin section has pole order at most m. Vanishing of the numerator can lower or remove that order. No universal simple-pole or trivial-character-only assertion is made.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L3/meromorphic-mellin-gluing`.

**Proof outline.** Factor the denominator in the local analytic ring as a unit times the local parameter to the power m. Divide the analytic numerator and compare its vanishing order.

**Acceptance checks.** The presentations T/T and 1/T have respectively a removable singularity and a simple pole. For finite-order g the denominator can vanish identically on an entire component.

**Sources.** [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Theorem 3.43 and Remark 3.47, printed pp. 24–26; §5.3, printed pp. 34–35. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

## L4. Analytic families, Fredholm theory and finite-slope complexes

### Complete continuity in the Banach algebra convention

`L4/completely-continuous` · comparison.

Import the finite-range approximation predicate of AdicSpacesPartII:R3/completely-continuous-map. Over the stated Noetherian K-Banach algebra, compare it with Buzzard's operator-norm closure of maps whose range lies in a finitely generated A-submodule. The affine-geometric supplier currently states affinoid hypotheses; the precise extension of its contract to these Banach algebras is requested, and is not assumed complete. Neither notion means finite K-rank or Mathlib IsCompactOperator.

**Hypotheses.** Standing Banach hypotheses; no orthonormal basis is required.

**Inputs.** `AdicSpacesPartII:R3`, `LocallyAnalyticDistributions:L4/finite-image-range-comparison`.

**Proof outline.** Use the supplier predicate and its finite-rank, composition and closure API; request their Noetherian Banach coefficient generality at their existing owner. Apply finite-image-range-comparison to each approximation witness. Restrict scalars to K to use the native operator norm; completely-continuous-norm-approximation records the metric comparison separately.

**Uses.** Buzzard Section 2 and every Fredholm node: The compactness hypothesis that admits principal-minor determinants and finite-rank approximation.

**API.**

| Declaration | Contract |
|---|---|
| `finiteImage_isCompletelyContinuous` | A continuous map whose image lies in a finitely generated A-submodule is completely continuous. |
| `isCompletelyContinuous_comp` | Composition with a bounded A-linear map on either side preserves complete continuity. |
| `isClosed_completelyContinuous` | Completely continuous maps form the operator-norm closure of the finite-A-image maps. |
| `isCompletelyContinuous_iff_containing_finite` | Over Noetherian A, the imported epsilon-approximation predicate is equivalent to the pointwise epsilon bound with range contained in a finite A-submodule. |

**Unit tests.**

- `identity_on_A` (characterisation): The identity of A is completely continuous as an A-linear map, including when A is infinite-dimensional over K.
- `identity_on_infinite_c0` (characterisation): For nonzero A, the identity on c_A(N) is not completely continuous: every output column has norm one.
- `decaying_diagonal` (characterisation): For rho in K with 0<norm(rho)<1, diag(rho^n) on c_A(N) is completely continuous, although it has infinite-dimensional K-image.

**Acceptance checks.** Never impose finite K-rank or finite freeness on the approximants. The suggested file contains a labelled supplier signature stub and a local abbreviation, not a second owned predicate or an implementation of the supplier.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Section 2, pp. 9-10, finite-rank and compact definitions. Compare the source convention with the supplier. The supplier generality request remains an explicit closure boundary.

### Bounded-family extension from c0

`L4/c0-lift` · construction.

A bounded family (m_i) in a Banach A-module M determines the unique continuous A-linear map c_A(I)->M sending e_i to m_i, by x |-> sum_i x_i m_i. Under the normalized module norm its operator norm is sup_i norm(m_i).

**Hypotheses.** Standing Banach hypotheses; I arbitrary discrete; the A-action has norm(a m)<=norm(a) norm(m).

**Inputs.** `mathlib:ZeroAtInftyContinuousMap`, `mathlib:ZeroAtInftyContinuousMap.ext`, `mathlib:ZeroAtInftyContinuousMap.instCompleteSpace`, `mathlib:NonarchimedeanGroup.multipliable_iff_tendsto_cofinite_one`, `LocallyAnalyticDistributions:L4/finite-coordinate-projection-evaluation`, `LocallyAnalyticDistributions:L4/finite-coordinate-projection-bound`.

**Proof outline.** Bounded m_i and x_i tending to zero imply x_i m_i tends to zero on the cofinite filter. Use the additive counterpart of the cited indexed theorem, as explained in baseline.declarations. The ultrametric estimate gives continuity. Finite-support truncations of x converge in the sup norm, giving uniqueness and the norm formula by evaluation on e_i.

**Uses.** orthonormalizable-modules and projective-lifting: Construct maps from their bounded basis images and lift such images through norm-controlled surjections.

**API.**

| Declaration | Contract |
|---|---|
| `c0Lift_apply` | The value on x is the unconditional sum of x_i m_i. |
| `c0Lift_single` | c0Lift(m)(e_i)=m_i. |
| `c0Lift_unique` | Any continuous A-linear map with these basis values equals c0Lift(m). |

**Unit tests.**

- `zero_family` (characterisation): The zero family extends to the zero map.
- `basis_family` (characterisation): The family e_i in c_A(I) extends to the identity.
- `unbounded_family` (characterisation): For 0<norm(rho)<1, the family rho^(-i) in K cannot be the basis images of a continuous map c_K(N)->K.

**Acceptance checks.** No countability or choice of an enumeration of I is used.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Section 2, pp. 7-9. The universal property of the source's c_A(I), realised using the existing C0 carrier.

### Orthonormalizable and potentially orthonormalizable modules

`L4/orthonormalizable-modules` · definition.

A chosen orthonormalization is an A-linear isometry M≃c_A(I); its potential version is a continuous A-linear equivalence with continuous inverse. The latter is equivalent to choosing an equivalent ONable norm. Use the existing C0 carrier, not a new space of sequences.

**Hypotheses.** Standing Banach hypotheses; arbitrary discrete I.

**Inputs.** `LocallyAnalyticDistributions:L4/c0-lift`, `LocallyAnalyticDistributions:L4/c0-scalar-bound`, `LocallyAnalyticDistributions:L4/finite-coordinate-projection-bound`.

**Proof outline.** Package a chart into the existing continuous linear equivalence or linear isometry equivalence types. Transport the sup norm along a continuous chart; two-sided bounds follow by restriction to K. The chart supplies coordinate projections and the matrix interpretation.

**Uses.** Buzzard Section 2 matrix criterion and determinant construction: Supply a coordinate chart, not a Hilbert basis or an algebraic basis of the infinite module.

**API.**

| Declaration | Contract |
|---|---|
| `orthonormalization_coordinates` | Coordinates identify M with existing c_A(I) and reconstruct elements by unconditional summation. |
| `potentiallyON_iff_equivalentNorm` | Potential ONability is ONability after a two-sided bounded change of norm. |
| `coordinateProjection_norm_le` | Finite coordinate projections have norm at most one in an ON chart. |
| `c0ContinuousSMul` | The existing pointwise action of the normed ring A on C0(I,A) is jointly continuous, using c0-scalar-bound. |

**Unit tests.**

- `empty_basis` (characterisation): The empty index set gives the zero module.
- `finite_basis` (characterisation): For finite I this agrees with A^I with its max norm.
- `potential_not_isometric` (characterisation): Let M be a normed K-line with an algebraic coordinate e:M to K and norm(x)=c norm(e(x)), where c>0 is outside the value group of K. Then M is potentially ONable, but there is no K-linear isometry M to K. This tests an actual normed module with the specified rescaling law; it does not assume non-isometry.

**Acceptance checks.** Keep the distinction between equality of norms and equivalence of norms.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Section 2, pp. 7-9 and 15-16. Preserves the integrated node and the source's norm-sensitive distinction; its carrier is now pinned to Mathlib.

### Canonical topology on finite Banach modules

`L4/finite-module-topology` · lemma.

For a finite A-module equipped with a Banach A-module topology, the topology is the canonical quotient topology from any finite presentation; submodules are closed and A-linear maps between finite Banach modules are continuous.

**Hypotheses.** Standing Banach hypotheses; finiteness over A and the precise Noetherian hypotheses are retained.

**Inputs.** `mathlib:ContinuousLinearMap.isOpenMap`.

**Proof outline.** Use the pinned open-mapping theorem for a continuous finite-generator surjection A^n->M. The closed-submodule and canonical-topology inputs are BGR 3.7.2/2 and 3.7.3/1-3 as invoked in Buzzard Proposition 2.1 and Lemma 2.3. Their source proofs are an explicit remaining gap, not consequences of open mapping alone.

**Acceptance checks.** Do not mark this node closed merely because the open-mapping theorem exists.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Proposition 2.1 and proof; Lemma 2.3(b), pp. 6-11. Records exactly the finite-module topological input that the inspected proof imports from BGR.

### Finite coordinates detect a finite submodule

`L4/finite-coordinate-injection` · lemma.

For a finitely generated submodule Q of c_A(I), some finite coordinate projection pi_T is injective on Q and satisfies norm(q)<=C norm(pi_T q) for all q in Q and some C>0.

**Hypotheses.** Standing Banach hypotheses; Q finite over A, not assumed free.

**Inputs.** `LocallyAnalyticDistributions:L4/finite-module-topology`, `LocallyAnalyticDistributions:L4/orthonormalizable-modules`, `LocallyAnalyticDistributions:L4/finite-coordinate-detection`, `mathlib:Submodule.FG.map`.

**Proof outline.** Apply finite-coordinate-detection to the image of Q under the existing coordinate embedding into A^I. Its image is finitely generated by Submodule.FG.map. The resulting finite restriction is injective, with no freeness assumption on Q. The injection into A^T and its finite-module image have their canonical Banach topologies; apply open mapping to obtain the inverse bound.

**Acceptance checks.** The algebraic detection is now a separate node. Canonical finite-module topology, closedness and the inverse norm bound still depend on the recorded BGR gap.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Lemma 2.3(a)-(b), pp. 10-11. Separates detection and its topological bound from the subsequent approximation estimate.

### Uniform coordinate truncation on finite submodules

`L4/finite-submodule-approximation` · lemma.

For Q finite over A inside c_A(I) and epsilon>0, some finite T satisfies norm(q-pi_T q)<=epsilon norm(q) for every q in Q.

**Hypotheses.** Standing Banach hypotheses; Q need not be free.

**Inputs.** `LocallyAnalyticDistributions:L4/orthonormalizable-modules`, `LocallyAnalyticDistributions:L4/finite-coordinate-injection`, `mathlib:ContinuousLinearMap.exists_preimage_norm_le`.

**Proof outline.** Choose finite generators q_1,...,q_d and use the canonical finite-module topology to obtain coefficients a_k representing each q with max norm(a_k)<=C norm(q). Enlarge T so all finitely many generator tails have norm at most epsilon/C. The ultrametric inequality gives the estimate uniformly for q.

**Acceptance checks.** The estimate is uniform on the whole module, not just on the chosen generators.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Lemma 2.3(c), pp. 10-11. Retains the accepted approximation node and exposes its norm-controlled lifting input.

### Completely continuous matrix criterion

`L4/compact-matrix-criterion` · theorem.

A continuous A-linear u:c_A(I)->c_A(J) is completely continuous exactly when r_j(u)=sup_i norm(a_ij) tends to zero outside finite subsets of J; then pi_T u converges to u in operator norm.

**Hypotheses.** Standing Banach hypotheses; i indexes inputs and j outputs.

**Inputs.** `LocallyAnalyticDistributions:L4/completely-continuous`, `LocallyAnalyticDistributions:L4/finite-submodule-approximation`, `LocallyAnalyticDistributions:L4/finite-coordinate-projection-evaluation`, `LocallyAnalyticDistributions:L4/finite-coordinate-projection-bound`.

**Proof outline.** If column norms tend to zero, finite output projections have finite free image and approximate u uniformly. For the converse approximate u by finite-A-image maps, then apply uniform coordinate truncation on their containing finite submodules. Bound the remaining tail by the approximation error.

**Acceptance checks.** The identity on c_A(N) fails this criterion; a decaying diagonal satisfies it.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Proposition 2.4, pp. 11-12. Both directions and the stated Noetherian restriction are preserved.

### Fredholm determinant in an orthonormal chart

`L4/fredholm-determinant` · construction.

For completely continuous u on c_A(I), construct the formal power series P_u with c_0=1 and c_n=(-1)^n sum_{S subset I, card S=n} det(a_ij)_{i,j in S}. Entireness and chart independence are the separately named ensuing theorems.

**Hypotheses.** Standing Banach hypotheses and complete continuity.

**Inputs.** `LocallyAnalyticDistributions:L4/compact-matrix-criterion`, `mathlib:NonarchimedeanGroup.multipliable_iff_tendsto_cofinite_one`, `LocallyAnalyticDistributions:L4/fixed-degree-minors-null`, `mathlib:IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm`.

**Proof outline.** Apply compact-matrix-criterion to obtain bounded cofinite-null output-column sizes. The fixed-degree-minors-null lemma supplies cofinite decay of the minor family at every n, including the singleton degree-zero family. Install the native ultrametric-distance instance from the stated norm inequality and apply the generated additive form of NonarchimedeanGroup.multipliable_iff_tendsto_cofinite_one. Completeness gives the unconditional sum over the actual fixed-cardinality subset type. Assemble the signed coefficients in the existing power-series carrier. The empty minor gives c_0=1. Entireness, basis independence and spectral properties remain ensuing theorems.

**Uses.** determinant-invariance, gauss-convergence and summand-fredholm-theory: The primary determinant, with analytic properties proved rather than assumed.

**API.**

| Declaration | Contract |
|---|---|
| `fredholmSeries_coeff` | The n-th coefficient is the signed principal-minor sum. |
| `fredholmSeries_constant` | The constant coefficient is one. |
| `fredholmSeries_isEntire` | The minor-tail-estimate proves decay at every positive real radius. |

**Unit tests.**

- `zero_operator` (characterisation): P_0=1.
- `rank_one_scalar` (characterisation): For multiplication by a on A, P_u=1-aT.
- `nonzero_nilpotent` (characterisation): For the nonzero two-by-two nilpotent Jordan block, P_u=1; determinant one does not mean u=0.

**Acceptance checks.** The sign is (-1)^n and the constant coefficient is one, including the zero module.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Definition following Proposition 2.4, p. 12. The signed principal-minor construction, separated from its later invariance and growth statements.

### Entire power series over A

`L4/entire-series` · definition.

Define A{{T}} as the subring of A[[T]] consisting of c with norm(c_n) R^n->0 for every real R>0. Give its family of Gauss seminorms and evaluation at any a in A; evaluation is continuous for every radius R>=norm(a), R>0.

**Hypotheses.** A is a complete commutative ultrametric normed ring; its norm is submultiplicative.

**Inputs.** `mathlib:NonarchimedeanGroup.multipliable_iff_tendsto_cofinite_one`, `mathlib:HasSum.mul_of_nonarchimedean`.

**Proof outline.** Closure under addition follows from the ultrametric inequality. For multiplication use a larger radius to bound the convolution tails. For evaluation choose a radius containing norm(a), establish summability of c_n a^n using the generated additive counterpart documented in baseline.declarations, and use multiplication of unconditional sums to prove the homomorphism law.

**Uses.** entire-resultants, resolvent-series and evaluated-product-on: The analytic algebra and the topology in which evaluation commutes with limits.

**API.**

| Declaration | Contract |
|---|---|
| `mem_entireSeries` | Membership is coefficient decay at every positive radius. |
| `entire_eval` | Evaluation at a is a ring homomorphism given by the convergent coefficient sum. |
| `entire_eval_bound` | norm(eval_a(c))<=sup_n norm(c_n) R^n for R>=norm(a), R>0. |

**Unit tests.**

- `polynomials_are_entire` (characterisation): Every polynomial is entire, including constants.
- `superexponential_coefficients` (characterisation): For 0<norm(rho)<1, coefficients rho^(n*n) define an entire series.
- `geometric_nonexample` (characterisation): The series with every coefficient one is not entire, even though it converges on the open unit disc.

**Acceptance checks.** The quantifier is all R>0. Completeness is not asserted for the single R=1 norm.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Section 3, p. 21. Uses the source's entire-series algebra, not the open-unit-disc algebra in L1.

### Uniform entire tail bound from column majorants

`L4/minor-tail-estimate` · lemma.

Suppose a family of completely continuous matrices has output-column norms bounded by one bounded cofinite-null family b_j>=0. Fix R>0 and 0<q<1, choose finite T with R b_j<=q outside T, m=card T and B=max(1,R sup_j b_j). Uniformly throughout the family, norm(c_n) R^n<=B^m q^max(n-m,0).

**Hypotheses.** Standing Banach hypotheses; coefficients c_n use the signed principal-minor construction.

**Inputs.** `LocallyAnalyticDistributions:L4/fredholm-determinant`, `LocallyAnalyticDistributions:L4/entire-series`, `LocallyAnalyticDistributions:L4/ultrametric-determinant-bound`, `LocallyAnalyticDistributions:L4/distinct-column-product-tail`, `mathlib:IsUltrametricDist.norm_tprod_le_of_forall_le_of_nonneg`, `mathlib:norm_units_zsmul`.

**Proof outline.** Apply ultrametric-determinant-bound to each principal minor, then multiply by R^n and rewrite as the product of the n distinct scaled column majorants R b_j. Apply distinct-column-product-tail to these scaled majorants, B=max(1,R L) for any common upper bound L. It yields B^card T q^max(n−card T,0), independent of the matrix in the family. Divide by the positive factor R^n, apply the native additive unconditional-sum bound to the minor family, and restore R^n. The sign (-1)^n preserves the norm. For 0<q<1 the bound tends to zero as n increases; this gives the required entire tail, uniformly for a family with the same majorant.

**Acceptance checks.** The bound applies to a family, not merely to one limit matrix; this distinction is needed to interchange evaluation and approximation.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Proposition 7(b) and its column-product estimate, pp. 75-76; Proposition 8, p. 77. Explicit finite-exception formulation of the minor-product estimate; the argument uses only ultrametricity and submultiplicativity and therefore applies to A. The uniform-family formulation is proved here rather than attributed verbatim.

### Lipschitz bound in each determinant degree

`L4/coefficient-continuity` · lemma.

For completely continuous u,v in the same ON chart with norm(u),norm(v)<=C and C>=1, n>=1, norm(c_n(u)-c_n(v))<=norm(u-v) C^(n-1).

**Hypotheses.** Standing Banach hypotheses.

**Inputs.** `LocallyAnalyticDistributions:L4/fredholm-determinant`, `LocallyAnalyticDistributions:L4/ultrametric-determinant-perturbation`, `LocallyAnalyticDistributions:L4/fixed-degree-minors-null`, `LocallyAnalyticDistributions:L4/c0-operator-norm-criterion`, `mathlib:IsUltrametricDist.norm_tprod_le_of_forall_le_of_nonneg`, `mathlib:norm_units_zsmul`.

**Proof outline.** In the common ON chart, bound every entry of u,v by C and their difference by the K-operator norm of u−v, using the basis vector of norm one and coordinate evaluation of norm at most one. Apply ultrametric-determinant-perturbation to every n-element principal minor. The same bound holds for each difference. Both minor families are summable by fixed-degree-minors-null and the native complete nonarchimedean criterion. Subtract their unconditional sums, then use the native additive unconditional-sum bound. The common sign preserves norm; degree zero is the separate constant-one case.

**Acceptance checks.** Handle the constant coefficient separately; it is identically one.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Proposition 8 proof, p. 77. Isolates the telescoping estimate used before uniform control of all degrees.

### Gauss convergence under a common column majorant

`L4/gauss-convergence` · lemma.

If u_s->u in operator norm and their matrices, including u, share a bounded cofinite-null column majorant, then for every R>0, sup_n norm(c_n(u_s)-c_n(u)) R^n->0. In particular P_{u_s}(1)->P_u(1).

**Hypotheses.** Standing Banach hypotheses; the common column bound is part of this sufficient criterion, not an automatic assumption on every bounded operator family.

**Inputs.** `LocallyAnalyticDistributions:L4/coefficient-continuity`, `LocallyAnalyticDistributions:L4/minor-tail-estimate`.

**Proof outline.** Choose a uniformly small tail in degree using minor-tail-estimate for both u_s and u. For the remaining finitely many coefficients use coefficient-continuity. Combine by the ultrametric inequality. Take R>=1 and use entire_eval_bound to pass to evaluation at one.

**Acceptance checks.** Coefficientwise convergence alone is explicitly insufficient for the final conclusion.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Proposition 8 and proof, p. 77. A sufficient common-majorant variant with a complete head/tail proof over A, used in the product argument.

### Determinant of a finite-coordinate operator

`L4/finite-coordinate-determinant` · comparison.

If u(c_A(I)) is contained in the coordinate submodule A^S for a finite S, then P_u is the ordinary characteristic polynomial det(1-T u|A^S).

**Hypotheses.** Standing Banach hypotheses; S is finite.

**Inputs.** `LocallyAnalyticDistributions:L4/fredholm-determinant`, `mathlib:Matrix.det_eq_zero_of_column_eq_zero`, `mathlib:Matrix.coeff_det_one_add_X_smul_eq_sum_minors`, `mathlib:Matrix.det_neg`, `mathlib:Finset.mem_powersetCard`.

**Proof outline.** If a principal subset meets the complement of S, choose an output index in that complement. Its column is identically zero by the image-support hypothesis, and Matrix.det_eq_zero_of_column_eq_zero makes the minor vanish. The remaining unconditional sum is the finite sum over subsets of S of the specified cardinality. Reindex through their inclusion in I. Apply the already implemented Matrix.coeff_det_one_add_X_smul_eq_sum_minors to the negative of the finite restricted matrix; Matrix.det_neg supplies (-1)^n. Compare coefficients of power series. No new finite determinant coefficient theorem is planned.

**Unit tests.**

- `native_finite_coefficient_formula` (compatibility): For a finite matrix D, the coefficient of degree k in det(1+T D) is exactly the native sum of principal k-minors; applying it to -D supplies the Fredholm sign.

**Acceptance checks.** Apply only to the named finite coordinate module; do not silently identify a general finite image with a free module.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Lemma 2.5(b), pp. 12-13. The finite-coordinate comparison needed for the product-limit argument.

### Independence of chart and equivalent norm

`L4/determinant-invariance` · comparison.

For a potentially ONable module, the Fredholm series of a completely continuous operator does not depend on the ON chart or on the chosen equivalent ON norm.

**Hypotheses.** Standing Banach hypotheses.

**Inputs.** `LocallyAnalyticDistributions:L4/fredholm-determinant`, `LocallyAnalyticDistributions:L4/finite-submodule-approximation`, `LocallyAnalyticDistributions:L4/finite-coordinate-determinant`, `LocallyAnalyticDistributions:L4/coefficient-continuity`.

**Proof outline.** Approximate the operator by maps whose image lies in finite free coordinate modules; the approximations converge for both equivalent norms. Use Lemma 2.5(c)'s comparison with an algebraic determinant whenever the image lies in a finite free submodule, then pass to each coefficient. The finite-free comparison and coordinate-change sublemmas still require signature-level expansion.

**Acceptance checks.** This preserves the stronger integrated claim including equivalent norms; no reduction-to-points argument is used over nonreduced A.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Lemma 2.5(a)-(c) and Corollary 2.6, pp. 12-14. Retains the accepted invariant, with its finite-free comparison boundary explicitly recorded.

### Cyclic Fredholm determinant identity

`L4/cyclic-determinant-identity` · theorem.

For potentially ONable Banach A-modules M,N, completely continuous u:M->N and bounded v:N->M, P_{uv}=P_{vu}.

**Hypotheses.** Standing Banach hypotheses; only u need be completely continuous.

**Inputs.** `LocallyAnalyticDistributions:L4/finite-submodule-approximation`, `LocallyAnalyticDistributions:L4/determinant-invariance`.

**Proof outline.** First truncate u to have finite free coordinate image G. Then truncate v only on v(G), using the uniform finite-submodule estimate. Reduce both determinants to finite free modules and use the rectangular finite determinant identity, then pass to coefficients in the two approximation steps. Do not assert pi_S v->v globally: the source explicitly avoids that false step. The exact pinned rectangular-identity declaration is not yet audited and is listed as a gap.

**Acceptance checks.** The formula is a power-series identity, unlike evaluated-product-on.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Lemma 2.7 and its complete proof, pp. 14-15. Preserves the two distinct finite-module truncations and the one-compact-factor hypothesis.

### Completed scalar extension of ON modules and determinants

`L4/completed-base-change` · comparison.

For a continuous homomorphism A->B of the stated Banach algebras, the completed scalar extension of c_A(I) is c_B(I), completely continuous maps extend, and the Fredholm coefficients map to the coefficients of the extended operator.

**Hypotheses.** K as in the standing conventions; A and B commutative Noetherian K-Banach algebras; homomorphism continuous, not necessarily contractive.

**Inputs.** `LocallyAnalyticDistributions:L4/orthonormalizable-modules`, `LocallyAnalyticDistributions:L4/compact-matrix-criterion`, `LocallyAnalyticDistributions:L4/coefficient-continuity`.

**Proof outline.** Use the completed-tensor universal property of BGR 2.1.7 and finite-support density to identify the scalar extension with c_B(I). Bound the scalar homomorphism, transfer column decay and map the convergent minor sums. The completed-tensor source and its exact library carrier remain unresolved.

**Acceptance checks.** Do not replace a continuous scalar homomorphism by an unmentioned norm-one hypothesis.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Lemmas 2.8-2.9 and Corollary 2.10, pp. 16-18. Preserves the accepted scalar-extension target and names the undecomposed tensor input.

### Property (Pr)

`L4/projective-banach-modules` · definition.

A Banach A-module M has (Pr) when it is a continuous direct summand of a potentially ONable module; equivalently there are continuous A-linear i:M->c_A(I), r:c_A(I)->M with ri=1. The lifting characterization is a theorem, not a defining bundle of assumptions.

**Hypotheses.** Standing Banach hypotheses.

**Inputs.** `LocallyAnalyticDistributions:L4/orthonormalizable-modules`.

**Proof outline.** Use a continuous split embedding into an existing c0 module. Its complementary closed kernel gives the source's direct-sum formulation. Transport the splitting across continuous equivalences; obtain stability under taking further split summands.

**Uses.** summand-fredholm-theory, projective-lifting and finite-pr-projective: Enlarge a module by a complement without assuming that it is itself free.

**API.**

| Declaration | Contract |
|---|---|
| `hasPr_of_potentiallyON` | Potentially ONable modules have (Pr). |
| `hasPr_retract` | A continuous direct summand of a (Pr) module has (Pr). |
| `hasPr_iff_split_c0` | (Pr) is equivalent to a continuous retraction from some c_A(I). |

**Unit tests.**

- `zero_hasPr` (characterisation): The zero module has (Pr).
- `finite_free_hasPr` (characterisation): A^n has (Pr), with the identity splitting.
- `projective_not_free` (characterisation): For A=K times K and e=(1,0), eA has (Pr), but is not a free A-module because its two component ranks differ.

**Acceptance checks.** Neither finite generation nor constant rank is part of (Pr).

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Section 2, pp. 18-20. Retains the accepted property and separates its lifting and finite-generation consequences.

### Continuous lifting characterization of (Pr)

`L4/projective-lifting` · theorem.

A Banach A-module has (Pr) exactly when every continuous A-linear map from it lifts through every surjective continuous A-linear map of Banach A-modules.

**Hypotheses.** Standing Banach hypotheses; surjective, not merely an epimorphism in an unspecified category.

**Inputs.** `LocallyAnalyticDistributions:L4/projective-banach-modules`, `LocallyAnalyticDistributions:L4/c0-lift`, `mathlib:ContinuousLinearMap.exists_preimage_norm_le`.

**Proof outline.** For c0 choose uniformly bounded preimages of the bounded basis images using the pinned norm-controlled preimage theorem, and extend by c0-lift. Restrict the lift along a continuous retraction for the forward implication. For the converse choose a bounded generating family indexed by suitably rescaled elements of M. The c0 extension surjects onto M; lifting the identity gives the splitting. The rescaled generating-family construction is still a signature-level gap.

**Acceptance checks.** A choice of preimages without a uniform norm bound does not establish continuity.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Section 2, lifting discussion before Lemma 2.11, pp. 18-19. Separates both directions of the source's characterization and identifies the baseline open-mapping input.

### Finite (Pr) modules are algebraically projective

`L4/finite-pr-projective` · theorem.

A finitely generated Banach A-module with (Pr) is a finitely generated projective A-module.

**Hypotheses.** Standing Banach hypotheses; no assertion of freeness or constant rank.

**Inputs.** `LocallyAnalyticDistributions:L4/projective-lifting`, `LocallyAnalyticDistributions:L4/finite-module-topology`.

**Proof outline.** Take a surjection from a finite free module with its canonical Banach topology. Lift the identity through it using projective-lifting. Forget topology to obtain an algebraic splitting.

**Acceptance checks.** The eA example over K times K prevents replacing projective by free.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Lemma 2.11, p. 19. The exact algebraic consequence used by the Riesz decomposition.

### Fredholm determinant on a (Pr) module

`L4/summand-fredholm-theory` · construction.

For a completely continuous u on a (Pr) module M, choose a complement M' with M plus M' potentially ONable and define P_u as the determinant of u plus 0. Prove independence of the complement and the agreement with the ON determinant.

**Hypotheses.** Standing Banach hypotheses and property (Pr).

**Inputs.** `LocallyAnalyticDistributions:L4/projective-banach-modules`, `LocallyAnalyticDistributions:L4/determinant-invariance`, `LocallyAnalyticDistributions:L4/cyclic-determinant-identity`, `LocallyAnalyticDistributions:L4/completed-base-change`.

**Proof outline.** For a splitting i,r, form iur on c0; it is completely continuous by the ideal API. Compare two splittings by the cyclic determinant identity using ri=1. Compare a potential ON chart by determinant-invariance. The inherited completed-base-change dependency records the scalar-extension API; extending the splitting and Lemmas 2.12-2.13 is still an explicit gap.

**Uses.** Fredholm resolvent and Riesz/slope decomposition: Make the determinant available on closed split summands without assuming their freeness.

**API.**

| Declaration | Contract |
|---|---|
| `fredholmSeriesPr_split` | P_u=P_{iur} for every continuous splitting ri=1. |
| `fredholmSeriesPr_agrees_ON` | For an ONable module the (Pr) determinant agrees with the principal-minor determinant. |
| `fredholmSeriesPr_baseChange` | Under the completed-base-change hypotheses, the scalar-extension determinant has mapped coefficients; the exercise-level proof remains in gaps. |

**Unit tests.**

- `pr_zero_operator` (characterisation): The zero operator has determinant one on every (Pr) module.
- `add_zero_complement` (characterisation): Adjoining a second zero complement does not change the series.
- `variable_rank_projective` (characterisation): For A=K times K, e=(1,0), the identity on eA has determinant 1-eT. An invertible operator on a projective module need not give a polynomial with unit leading coefficient before constant rank is proved.

**Acceptance checks.** Use the same complement for simultaneous operator identities.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Section 2, pp. 19-21, including Lemmas 2.12-2.13. Retains the accepted zero-extension construction with complement independence and the uncompleted exercise boundary.

### Fredholm determinant of a direct sum

`L4/fredholm-direct-sum` · theorem.

For completely continuous u and v on (Pr) modules M and N, P_{u plus v}(T)=P_u(T) P_v(T).

**Hypotheses.** Standing Banach hypotheses and continuous direct-sum topologies.

**Inputs.** `LocallyAnalyticDistributions:L4/summand-fredholm-theory`.

**Proof outline.** On c0 use the disjoint union of the two index sets; a block-diagonal principal minor is a product of the two minors. Regroup the unconditionally convergent minor sums by cardinality and extend to (Pr) using zero complements.

**Acceptance checks.** This is a genuine whole-series multiplicativity statement because the operation is direct sum, not u+v-uv on the same module.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Section 2, p. 20; used in Proposition 3.2, p. 23. The determinant factorization used in the finite-projective rank argument is made a separate dependency.

### Evaluated Fredholm product identity on c0

`L4/evaluated-product-on` · theorem.

For completely continuous u,v on the same potentially ONable module, P_{u+v-uv}(1)=P_u(1) P_v(1). No commutativity hypothesis on u,v is necessary.

**Hypotheses.** Standing Banach hypotheses; uv means u composed with v.

**Inputs.** `LocallyAnalyticDistributions:L4/gauss-convergence`, `LocallyAnalyticDistributions:L4/finite-coordinate-determinant`, `LocallyAnalyticDistributions:L4/determinant-invariance`, `LocallyAnalyticDistributions:L4/completely-continuous`, `mathlib:Matrix.det_mul`.

**Proof outline.** Choose increasing finite output sets S capturing the column tails of both operators. Put u_S=pi_S u, v_S=pi_S v and w_S=u_S+v_S-u_S v_S. These converge to u,v,w=u+v-uv in operator norm and all three approximants have image in the common finite free module A^S. The family b_j=max(r_j(u),r_j(v),norm(v) r_j(u)) tends to zero outside finite sets and bounds all columns of u_S,v_S,w_S,u,v,w. In the composition bound use the output column of u and the norm of v; reversing this convention would be an error. On A^S the ordinary determinant product rule gives P_{w_S}(1)=P_{u_S}(1)P_{v_S}(1). Use gauss-convergence at radius one for all three families and continuity of multiplication to pass to the limit. Equivalent norms and charts are handled by determinant-invariance. The finite-coordinate identity does not require u_S and v_S to commute.

**Unit tests.**

- `whole_series_product_nonexample` (non-example): For a nonzero ring A, (1-T) is not (1-T)^2; evaluated multiplicativity must not be promoted to whole-series multiplicativity.

**Acceptance checks.** Rank-one regression: u=v=1 gives P_{u+v-uv}(T)=1-T, not (1-T)^2. The asserted identity is evaluated at one, not a false whole-series identity. No appeal to coefficientwise convergence alone is permitted.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Corollary 1 to Proposition 7, p. 76; Proposition 8, p. 77. The field-case product identity; this node writes out its extension to Noetherian Banach A using a common column majorant and finite free determinants rather than reduction modulo valuation ideals. [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Lemma 2.3(c), Proposition 2.4 and Lemma 2.5, pp. 10-14; Lemma 3.1, p. 22. The source's finite approximation machinery proves the previously undecomposed multiplicativity import needed in the converse of Lemma 3.1.

### Evaluated Fredholm product identity for (Pr)

`L4/evaluated-product-pr` · theorem.

For completely continuous u,v on the same (Pr) module, P_{u+v-uv}(1)=P_u(1)P_v(1), without requiring uv=vu.

**Hypotheses.** Standing Banach hypotheses and (Pr).

**Inputs.** `LocallyAnalyticDistributions:L4/evaluated-product-on`, `LocallyAnalyticDistributions:L4/summand-fredholm-theory`.

**Proof outline.** Choose one splitting i,r with ri=1, and lift both operators to iur and ivr on the same c0 module. The lift preserves sums and products because ri=1; apply evaluated-product-on and then the complement-independent defining comparison.

**Acceptance checks.** Choosing unrelated complements for u,v and u+v-uv does not itself prove the identity; use one common splitting.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Zero-extension construction, pp. 19-20; Lemma 3.1, p. 22. Explicit transport of the preceding product theorem through the source's zero-extension construction.

### Division of entire series by a monic polynomial

`L4/entire-division` · theorem.

For monic Q in A[T] of degree d and P in A{{T}}, there are unique S in A{{T}} and R in A[T] with degree R<d and P=QS+R; for Q=1, R=0.

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-monic-division-remainder`, `LocallyAnalyticDistributions:L4/entire-monic-quotient-entire`, `LocallyAnalyticDistributions:L4/entire-monic-division-unique`.

**Proof outline.** Take S=S_Q(P) and the native truncation remainder provided by entire-monic-division-remainder. The quotient is entire by entire-monic-quotient-entire and the remainder has degree below d. Apply entire-monic-division-unique to any competing pair. When Q=1 the native truncation at zero is zero and the quotient is P.

**Acceptance checks.** The quotient is entire, not merely a formal Laurent series.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://math.uchicago.edu/~fcale/Files/Cole2.pdf), Appendix A3, division preceding Lemmas A3.5 and A3.7. Exposes the polynomial-division input to the resultants, with the transport and convergence boundary retained. [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), printed434/PDF18, norm interpretation and proof of LemmaA3.5. The retained composite theorem now has explicit reciprocal-tail convergence, coefficient recurrence and entire uniqueness prerequisites. This completes its monic one-variable division proof plan, without claiming the resultant comparisons or spectral resultant.

### Resultant of a monic polynomial and an entire series

`L4/entire-resultants` · construction.

For monic Q of degree d and entire F, define the existing Res(Q,F) to be native Algebra.norm A (rho_Q(F)), equivalently the determinant of multiplication by rho_Q(F) in the native AdjoinRoot.powerBasis' basis indexed by Fin d. This refines the original finite-quotient determinant definition in place. It includes d=0, whose empty determinant is one.

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Q is a monic polynomial, including Q=1. F belongs to the existing entire-series subring, meaning weighted coefficients tend to zero at every positive real radius. No field, reducedness, Noetherianity or splitting assumption is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-quotient-class`, `LocallyAnalyticDistributions:L4/entire-quotient-class-surjective`, `LocallyAnalyticDistributions:L4/entire-quotient-class-linear`, `mathlib:AdjoinRoot.powerBasis'`, `mathlib:Algebra.norm`, `mathlib:Algebra.norm_eq_matrix_det`, `mathlib:Algebra.norm_algebraMap_of_basis`.

**Proof outline.** Use entire-quotient-class and its kernel/surjectivity identification to realize the analytic quotient as native AdjoinRoot Q. Select the existing native powerBasis' for monic Q; no basis construction is planned. Compose rho_Q with native Algebra.norm. Native norm_eq_matrix_det identifies this value with the existing determinant definition. The norm monoid homomorphism and rho ring homomorphism give multiplicativity; rho(Q)=0 gives invariance under adding Q times an entire series. For Q=T-a use entire-quotient-class-linear. Native norm_algebraMap_of_basis on the rank-one basis gives F(a). For Q=1 the basis is empty and the value is one. For positive-degree Q, rho(Q)=0 makes the multiplication matrix zero in positive dimension, so Res(Q,Q)=0. The spectral resultant D(B,P), the multivariable symmetric-function construction and their Fredholm transport remain separate gaps. No generic resultant or determinant is reconstructed.

**Uses.** resultant-unit, fredholm-resolvent and finite-slope-summands: Turn analytic coprimality into a unit statement in A and connect polynomial functional calculus to the Fredholm series.

**API.**

| Declaration | Contract |
|---|---|
| `entireResultant_remainder` | The resultant depends only on P modulo Q. |
| `entireResultant_mul` | Res(Q,P1 P2)=Res(Q,P1) Res(Q,P2). |
| `entireResultant_linear` | Res(T-a,P)=P(a). |
| `entireResultant_norm` | Res(Q,F)=Algebra.norm A (rho_Q(F)) in the native monic quotient. |
| `entireResultant_polynomial` | For native polynomial P the value is native Polynomial.resultant Q P Q.natDegree P.natDegree; promoted to its own comparison node. |

**Unit tests.**

- `constant_divisor` (characterisation): Res(1,P)=1, including P=0.
- `linear_evaluation` (characterisation): Res(T-a,1-bT)=1-ba.
- `common_factor` (characterisation): For positive-degree monic Q, Res(Q,Q)=0.
- `resultant_nilpotent_linear` (computation): For Q=T^2 and P=a+bT, Res(Q,P)=a^2 over A, without reducedness or domain hypotheses.

**Acceptance checks.** Preserve the integrated resultant node, but do not hide the substantially harder D(B,P) construction in its hypotheses.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://math.uchicago.edu/~fcale/Files/Cole2.pdf), Appendix A3, definition of resultant and Lemma A3.7. The finite quotient-algebra determinant; the separate spectral resultant is honestly kept unresolved. [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), printed434–435/PDF18–19, norm interpretation and Lemmas A3.5,A3.7. The retained node is decomposed through the analytic reduction map and exact native finite-algebra interfaces. No new source error or independent-review verdict is asserted.

### Resultant detects analytic coprimality

`L4/resultant-unit` · lemma.

For monic Q and entire P, Res(Q,P) is a unit in A exactly when Q and P generate the unit ideal of A{{T}}.

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Q is a monic polynomial, including Q=1. F belongs to the existing entire-series subring, meaning weighted coefficients tend to zero at every positive real radius. No field, reducedness, Noetherianity or splitting assumption is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-resultants`, `LocallyAnalyticDistributions:L4/entire-quotient-class-kernel`, `LocallyAnalyticDistributions:L4/entire-quotient-class-surjective`, `LocallyAnalyticDistributions:L4/entire-resultant-bezout`, `mathlib:LinearMap.isUnit_iff_isUnit_det`, `mathlib:Algebra.lmul_isUnit_iff`, `mathlib:Polynomial.isUnit_resultant_iff_isCoprime`, `mathlib:isUnit_iff_exists_inv`, `mathlib:IsCoprime`.

**Proof outline.** The native finite power basis supplies Module.Free and Module.Finite. Unfold native Algebra.norm as the determinant of left multiplication; combine native LinearMap.isUnit_iff_isUnit_det and Algebra.lmul_isUnit_iff to get IsUnit(Res(Q,F)) exactly when rho_Q(F) is a unit. This is a composition of existing algebra lemmas, not a new generic norm theorem. Lift the inverse of rho_Q(F) through the surjective rho_Q to an entire B. Then rho_Q(1-FB)=0, so the kernel theorem gives 1-FB=QG. Rearranging produces the actual entire Bezout equation GQ+BF=1. Conversely reduce any such equation to get an inverse of rho_Q(F). For polynomial inputs, native Polynomial.isUnit_resultant_iff_isCoprime supplies the identical criterion through the polynomial comparison. The preceding resultant-Bezout certificate gives a second explicit forward construction: multiply its two coefficients by the scalar inverse of the unit Res. The coefficient of F remains a polynomial of degree below d. At Q=1 use G=1,B=0.

**Acceptance checks.** Nonzero resultant is not enough over A; it must be a unit.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://math.uchicago.edu/~fcale/Files/Cole2.pdf), Lemma A3.7 and proof. The unit criterion, isolated from the spectral-mapping theorem. [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), printed434–435/PDF18–19, norm interpretation and Lemmas A3.5,A3.7. The retained node is decomposed through the analytic reduction map and exact native finite-algebra interfaces. No new source error or independent-review verdict is asserted.

### Fredholm resolvent series

`L4/resolvent-series` · construction.

For completely continuous u with determinant coefficients c_n, define v_0=1 and v_n=c_n 1+u v_(n-1). The operator-valued series F_u(T)=sum_n v_n T^n is entire and (1-Tu)F_u=F_u(1-Tu)=P_u(T)1.

**Hypotheses.** Standing Banach hypotheses; M is potentially ONable or has (Pr), using zero extension in the second case.

**Inputs.** `LocallyAnalyticDistributions:L4/summand-fredholm-theory`, `LocallyAnalyticDistributions:L4/resolvent-recurrence-entire`.

**Proof outline.** Define the native continuous-linear coefficients recursively from v₀=I and v_(n+1)=c_(n+1)I+uv_n. Induction gives polynomial dependence and the two-sided formal identities. Apply resolvent-recurrence-entire to this actual recurrence. Its separate chain proves the finite adjugate bound, finite-support comparison, finite-coordinate norm limit and fixed retraction estimate; it does not assume the entireness of this node. Evaluate the resulting operator-valued entire series and its formal identities. The Hasse and Riesz consumers import this construction only after the analytic estimate has been supplied.

**Uses.** fredholm-resolvent and riesz-root-projectors: Provides a convergent inverse numerator and its Hasse derivatives in the operator algebra.

**API.**

| Declaration | Contract |
|---|---|
| `resolventCoeff_zero` | The initial coefficient v₀ is the identity endomorphism on the actual module M. |
| `resolventCoeff_succ` | v_(n+1)=c_(n+1) 1+u v_n, with v_0=1. |
| `resolvent_entire` | For every R>0, norm(v_n) R^n tends to zero. |
| `resolvent_identity` | Both left and right multiplication by 1-Tu give P_u(T) times the identity. |

**Unit tests.**

- `rank_one_resolvent` (characterisation): On A with u=a, F_u(T)=1.
- `diagonal_two` (characterisation): For diag(a,b), F_u(T)=diag(1-bT,1-aT).
- `nilpotent_two` (characterisation): For the two-by-two nilpotent Jordan block N, F_N(T)=1+TN.

**Acceptance checks.** The recurrence alone is insufficient. Its analytic estimate now has the exact resolvent-recurrence-entire dependency; finite-projective rank and determinant identities remain separate gaps.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Section 6, Proposition 10 and Lemma 3 with its three-step proof, pp. 78-79. Separates the operator-valued resolvent construction from the polynomial invertibility criterion.

### Polynomial Fredholm invertibility criterion

`L4/fredholm-resolvent` · theorem.

For a monic polynomial Q and completely continuous u on a (Pr) module, Q and P_u are coprime in A{{T}} exactly when Q*(u) is invertible in the algebra of continuous A-linear endomorphisms.

**Hypotheses.** Standing Banach hypotheses; Q* is the degree-correct reciprocal polynomial.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-resultants`, `LocallyAnalyticDistributions:L4/summand-fredholm-theory`, `LocallyAnalyticDistributions:L4/resultant-unit`, `LocallyAnalyticDistributions:L4/resolvent-series`, `LocallyAnalyticDistributions:L4/evaluated-product-pr`.

**Proof outline.** The resolvent and resultant functional calculus prove invertibility in the coprime direction, as in Coleman A4.1; the D(B,P) spectral-mapping transport is explicitly not yet decomposed. For the reverse set v=1-Q*(u). Its constant polynomial term is zero, so v is completely continuous. If L=Q*(u) is invertible, w=1-L^(-1)=-v L^(-1) is completely continuous and (1-v)(1-w)=1. The newly explicit evaluated-product-pr gives P_v(1) P_w(1)=1. Identifying P_v(1) with the normalized resultant still requires Coleman A3.8-A3.9 in the correct generality; this remains a gap, not an assumed structure field.

**Acceptance checks.** Product multiplicativity is now a named dependency; spectral mapping is still an unresolved source boundary.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Lemma 3.1, pp. 21-22. Preserves the accepted criterion and its Noetherian Banach algebra hypotheses. [P-adic Banach Spaces and Families of Modular Forms](https://math.uchicago.edu/~fcale/Files/Cole2.pdf), Lemma A4.1 proof and Lemmas A3.7-A3.8, Theorem A3.9. Identifies exactly where the product identity and the spectral resultant are used in the converse.

### Complete continuity of the identity detects finite generation

`L4/compact-identity-finite` · theorem.

For a Banach A-module M in the standing setting, the identity is completely continuous if and only if M is finitely generated over A. Neither potential ONability nor property (Pr), freeness, finite K-dimension or constant rank is required.

**Hypotheses.** Standing Banach hypotheses; no ONability or (Pr) is needed for this implication.

**Inputs.** `LocallyAnalyticDistributions:L4/completely-continuous-norm-approximation`, `mathlib:ContinuousLinearMap.instCompleteSpace`, `mathlib:ContinuousLinearMap.toNormedRing`, `mathlib:isUnit_one_sub_of_norm_lt_one`, `mathlib:ContinuousLinearMap.isUnit_iff_bijective`, `mathlib:Module.finite_def`.

**Proof outline.** Choose a finite-A-image alpha with norm(id-alpha)<1 by completely-continuous-norm-approximation. Restrict alpha to K. The existing complete normed ring of continuous K-linear endomorphisms admits Neumann series. Apply isUnit_one_sub_of_norm_lt_one to beta=id-alpha, obtaining invertibility of alpha as a K-linear operator; isUnit_iff_bijective gives surjectivity of the same underlying function. No new A-endomorphism norm or A-linear inverse is needed for this conclusion. The image of alpha lies in a finitely generated A-submodule Q. Surjectivity forces Q=M, and Module.finite_def gives finite A-generation. Conversely, if M is finite over A then the identity already has finitely generated range and is a constant finite-rank approximating family.

**Unit tests.**

- `finite_identity_zero` (degenerate): The identity on A^0 is completely continuous.
- `finite_identity_finite` (compatibility): Every continuous A-linear endomorphism of a finitely generated A-module is completely continuous.
- `finite_identity_infinite` (non-example): If M is not finitely generated over A, its identity is not completely continuous.

**Acceptance checks.** Includes the zero module. The identity of A is finite A-rank even if A has infinite K-dimension. A finite projective module of varying rank is admitted; an infinite A-module has a non-completely-continuous identity.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Proposition 3.2, p. 23, finite-generation paragraph. The full source argument is made explicit using existing Neumann-series and operator-completeness declarations. The converse is the finite-rank definition on pp. 9-10.

### Riesz projectors at a Fredholm root

`L4/riesz-root-projectors` · theorem.

If a in A is a root of P_u of Hasse order h, with the h-th Hasse derivative a unit, then M=N plus F as closed u-stable summands, (1-au)^h is zero on N, 1-au is invertible on F, and N is finite projective of constant rank h. For h>0, a is a unit and P_(u|N)=(1-a^(-1)T)^h. The projectors lie in the operator-norm closure of A[u].

**Hypotheses.** Standing Banach hypotheses; M has (Pr); u completely continuous. For h=0 take N=0 and F=M.

**Inputs.** `LocallyAnalyticDistributions:L4/fredholm-resolvent`, `LocallyAnalyticDistributions:L4/projective-banach-modules`, `LocallyAnalyticDistributions:L4/summand-fredholm-theory`, `LocallyAnalyticDistributions:L4/resolvent-series`, `LocallyAnalyticDistributions:L4/compact-identity-finite`, `LocallyAnalyticDistributions:L4/finite-pr-projective`, `LocallyAnalyticDistributions:L4/fredholm-direct-sum`, `LocallyAnalyticDistributions:L4/evaluated-hasse-resolvent`, `LocallyAnalyticDistributions:L4/hasse-polynomial-closure`, `LocallyAnalyticDistributions:L4/hasse-resolvent-commutation`, `LocallyAnalyticDistributions:L4/entire-root-unit`, `LocallyAnalyticDistributions:L4/riesz-topological-splitting`, `LocallyAnalyticDistributions:L4/riesz-regular-inverse`, `LocallyAnalyticDistributions:L4/riesz-commuting-stability`, `LocallyAnalyticDistributions:L4/riesz-kernel-finite`, `LocallyAnalyticDistributions:L4/riesz-kernel-projective`, `LocallyAnalyticDistributions:L4/riesz-kernel-operator-equiv`.

**Proof outline.** For h>0 apply entire-root-unit to P_u, whose constant coefficient is one. The explicit lower and normalized Hasse-annihilation nodes give v^h(1-vb)=0 with b=c^(-1)z_h. The named formula E=1-(vb)^h and its idempotence and kernel/image lemmas supply N=ker(v^h)=image(E) and F=image(v^h)=ker(E). Order zero gives E=0 and F=M directly from the original resolvent identity. Use riesz-topological-splitting for closed topological complements and the native projectionL comparison, riesz-regular-inverse for the actual continuous inverse on F, and riesz-projector-closure plus riesz-commuting-stability for the polynomial-closure and invariance assertions. These algebraic/analytic splitting steps do not supply finite generation or rank. Use riesz-kernel-compact-identity for N=ker(v^h), compressing arbitrary finite-A-image approximants through the actual continuous projection. Then riesz-kernel-finite supplies finite generation, riesz-kernel-pr transfers (Pr), and riesz-kernel-projective invokes the existing finite-pr-projective theorem. Its finite-module-topology gap remains; no rank or determinant equality follows from these three properties alone. Use direct-sum determinant factorization and fredholm-resolvent on F. Establish rank h at each maximal-ideal fibre before claiming a unit leading coefficient: finite projective modules can have varying rank. On each fibre nilpotence and the exact order h give rank h. With constant rank established, analytic division and polynomial degree then identify P_(u|N) exactly. Equality after residue-field reduction alone is not a valid argument over nonreduced A. The finite-projective determinant and local-rank API is an explicit remaining gap.

**Acceptance checks.** Use Hasse derivatives, not division by factorials in positive characteristic. Test A=K times K and eA: invertibility on a projective module alone does not make the leading determinant coefficient a unit. Test A=K[epsilon]/(epsilon^2): equality on all residue fields cannot by itself prove equality of polynomials over A.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Proposition 3.2 and proof, pp. 23-24. Retains the accepted projectors, finite projectivity and exact rank, while making the rank-stratification bookkeeping explicit. [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Proposition 12 and proof, pp. 80-81. The Hasse-derivative projector construction transfers; the field-specific dimension argument is replaced, not imported.

### Finite projective slope summands

`L4/finite-slope-summands` · theorem.

Suppose P_u=Q S, Q polynomial with constant coefficient one and unit leading coefficient, S entire with S(0)=1, and Q,S analytically coprime. Then M=N plus F as closed u-stable summands, N finite projective of rank deg Q, Q*(u) kills N and is invertible on F, and P_(u|N)=Q. The associated projector lies in the closure of A[u].

**Hypotheses.** Standing Banach hypotheses; M has (Pr); u completely continuous. The degree-zero factor gives N=0.

**Inputs.** `LocallyAnalyticDistributions:L4/riesz-root-projectors`, `LocallyAnalyticDistributions:L4/fredholm-resolvent`, `LocallyAnalyticDistributions:L4/entire-resultants`.

**Proof outline.** Apply the root theorem at one to the polynomial transform 1-Q*(u)/Q*(0). The resultant spectral-mapping formula identifies the root order as deg Q; its undecomposed transport remains a prerequisite gap. This initially gives nilpotence of a power of Q*(u) on N, not the claimed first-power annihilation. Use the complement invertibility criterion to separate Q from P_F, identify P_N=Q by determinant and degree comparison, and then use finite-projective Cayley-Hamilton to obtain Q*(u)=0 on N. Compatibility with completed scalar extension is routed through completed-base-change and the same factorization on slope-adapted affinoids; it is not claimed for arbitrary pointwise numerical slope cutoffs.

**Acceptance checks.** Keep the exact polynomial factor, generalized eigenspaces and first-power annihilation; do not replace this by a pointwise eigenspace statement.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Theorem 3.3 and proof, pp. 24-25. Preserves the accepted slope theorem, including the final characteristic-polynomial step needed to strengthen power-annihilation.

### Finite ambient image versus finitely generated range

`L4/finite-image-range-comparison` · comparison.

For a continuous A-linear map f:M to N over a Noetherian commutative ring A, its range is contained in a finitely generated A-submodule if and only if its range is itself finitely generated. This compares Buzzard's finite-rank convention with the range convention used by AdicSpacesPartII:R3/completely-continuous-map; it does not assert the equivalence over non-Noetherian A.

**Hypotheses.** The hypotheses in the statement are explicit; the index set need not be countable.

**Inputs.** `mathlib:Submodule.FG.of_le`.

**Proof outline.** For the forward direction apply Submodule.FG.of_le to range(f) contained in the chosen finite submodule Q. This is exactly where Noetherianity enters. For the converse choose Q=range(f). No topology, norm, freeness or finite K-dimension is used.

**Acceptance checks.** An A-submodule of a finite A-module need not be finite without the Noetherian hypothesis.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Section 2, p. 9, finite-rank definition. The containing-submodule definition is compared with the existing atlas supplier, using the pinned Noetherian submodule theorem.

### Strict norm approximation by finite-image maps

`L4/completely-continuous-norm-approximation` · lemma.

For Banach modules M,N over the stated Noetherian K-Banach algebra A and a continuous A-linear f, imported complete continuity is equivalent to: for every epsilon>0 there is a continuous A-linear g whose range is contained in a finite A-submodule and whose difference from f, restricted to K, has operator norm strictly less than epsilon.

**Hypotheses.** The hypotheses in the statement are explicit; the index set need not be countable.

**Inputs.** `LocallyAnalyticDistributions:L4/completely-continuous`, `LocallyAnalyticDistributions:L4/finite-image-range-comparison`, `mathlib:ContinuousLinearMap.opNorm_le_bound`, `mathlib:ContinuousLinearMap.le_opNorm`, `mathlib:Metric.mem_closure_iff`.

**Proof outline.** Use the finite-image-range comparison to put the supplier approximation witnesses into Buzzard's convention. A pointwise bound with epsilon/2 gives operator norm at most epsilon/2 by opNorm_le_bound, hence strictly below epsilon. Conversely le_opNorm turns a norm bound strictly below epsilon into the required pointwise bound by epsilon times the input norm. Metric.mem_closure_iff identifies this strict approximation statement with closure in the K-operator metric. No unit-ball normalization or spherical completeness is assumed.

**Unit tests.**

- `approximation_zero_radius_boundary` (non-example): For any f there is no g with norm(f-g)<0.

**Acceptance checks.** The positive epsilon condition is essential; no strict approximation of norm less than zero exists.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Section 2, pp. 8-10, operator norm and closure definition. The pinned norm inequalities supply the exact strict/non-strict conversion used in Proposition 3.2.

### Bounded coefficient action on c0

`L4/c0-scalar-bound` · lemma.

For a normed commutative ring A and any topological space I, the existing pointwise A-action on C0(I,A) satisfies norm(a x)<=norm(a) norm(x). Consequently it is jointly continuous for the existing sup-norm topology. On discrete I this supplies the coefficient action of c_A(I); no new sequence carrier is constructed.

**Hypotheses.** The hypotheses in the statement are explicit; the index set need not be countable.

**Inputs.** `mathlib:ZeroAtInftyContinuousMap`, `mathlib:BoundedContinuousFunction.norm_coe_le_norm`, `mathlib:BoundedContinuousFunction.norm_le`, `mathlib:IsBoundedSMul.of_norm_smul_le`, `mathlib:IsBoundedSMul`.

**Proof outline.** The norm of C0 is induced by its existing inclusion into bounded continuous functions. Pointwise multiplication has norm at most norm(a) norm(x(i)). Bound each norm(x(i)) by the sup norm, then apply BoundedContinuousFunction.norm_le with the nonnegative bound norm(a) norm(x). This includes an empty index type. Use IsBoundedSMul.of_norm_smul_le and its continuity instance. The pinned C0 file provides the field-valued NormedSpace instance but does not provide this ring-valued continuous scalar-action instance.

**Unit tests.**

- `scalar_empty` (degenerate): On C0(empty,A), norm(a x)=0.
- `scalar_single` (computation): Multiplication by a sends the coordinate vector with value b at i to the coordinate vector with value ab at i.

**Acceptance checks.** The scalar ring need not be a field; the formula remains valid for A=K times K.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Section 2, pp. 7-8, definition of c_A(I). The pointwise action and sup norm are the source construction; the carrier and norm already exist in Mathlib.

### Finite coordinates detect a finite submodule

`L4/finite-coordinate-detection` · lemma.

Let B be a commutative Noetherian ring, I any set and Q a finitely generated B-submodule of the full product B^I. There is a finite S contained in I such that two elements of Q agreeing on S agree everywhere. No Banach topology, field, domain or freeness of Q is required.

**Hypotheses.** The hypotheses in the statement are explicit; the index set need not be countable.

**Inputs.** `mathlib:Submodule.fg_iff_exists_fin_generating_family`, `mathlib:isNoetherian_pi`, `mathlib:IsNoetherian`, `mathlib:Submodule.fg_span_iff_fg_span_finset_subset`.

**Proof outline.** Choose generators q_1,...,q_r for Q. For each i in I form the column v_i=(q_1(i),...,q_r(i)) in B^r. The span of all v_i is finitely generated because the finite product B^r is Noetherian. The finite-subset-of-generators theorem gives a finite collection of the actual v_i spanning it; choose their indices to obtain S. Write x-y as sum_alpha b_alpha q_alpha. Vanishing on S says that the linear functional v maps to sum_alpha b_alpha v_alpha vanishes on the spanning columns. It therefore vanishes on all v_i, so every coordinate of x-y is zero.

**Unit tests.**

- `coordinate_empty_submodule` (degenerate): Two elements of the zero submodule of B^I are equal without inspecting any coordinates.
- `coordinate_product_ring` (compatibility): In the submodule of (K times K)^N generated by the constant vector (1,0), vanishing of coordinate zero forces the vector to vanish.
- `coordinate_single_omitted` (non-example): If j is outside finite S and A is nonzero, the coordinate vector e_j vanishes on S but is nonzero.

**Acceptance checks.** The finite spanning argument takes place in B^r, not in the generally non-Noetherian product B^I. For Q=0 take S empty. The case B=K times K includes nonfree finite submodules.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Lemma 2.3(a), p. 10, complete proof paragraph. The algebraic coordinate argument is extracted at its natural generality; topology and the inverse norm bound remain separate.

### Hasse derivatives of formal power series

`L4/hasse-series` · construction.

For any possibly noncommutative semiring B and s in N, construct the additive B-linear operation Delta_s on the existing B[[T]] by coefficient_n(Delta_s f)=choose(n+s,s) times coefficient_(n+s)(f). Multiplication by the natural number means repeated addition, with no inverse factorial and no convergence assumption.

**Hypotheses.** B is a semiring; s and coefficient indices are natural numbers. The variable T is central.

**Inputs.** `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.coeff_mk`.

**Proof outline.** Apply the native power-series constructor to the displayed coefficient sequence. Coefficient extensionality and distributivity prove additivity and left B-linearity; natural-number multiplication commutes with left scalar multiplication. Order zero uses choose(n,0)=1. A monomial of degree d<s has every coefficient zero; at d=s its Hasse derivative is the constant coefficient. These finite computations do not shift a formal series by a nonzero constant.

**Uses.** LocallyAnalyticDistributions:L4/hasse-product: Differentiates the formal two-sided resolvent identity. LocallyAnalyticDistributions:L4/resolvent-hasse-evaluation: Supplies the coefficient sequence to be summed after convergence is proved.

**API.**

| Declaration | Contract |
|---|---|
| `hasseSeries_coeff` | Coefficient n is choose(n+s,s) times coefficient n+s. |
| `hasseSeries_zero` | Delta_0 f=f. |
| `hasseSeries_add` | Delta_s(f+g)=Delta_s f+Delta_s g. |
| `hasseSeries_smul` | Delta_s(b f)=b Delta_s f, including noncommutative B. |

**Unit tests.**

- `hasse_order_zero` (degenerate): Delta_0 fixes every series.
- `hasse_degree_boundary` (non-example): Delta_s(b T^d)=0 whenever d<s.
- `hasse_top_monomial` (characterisation): Delta_s(b T^s)=b, not s factorial times b.
- `hasse_characteristic_two` (non-example): Over Z/2, Delta_2(T^2)=1 although the second ordinary polynomial derivative is zero.

**Acceptance checks.** Do not define this by dividing an iterated derivative by s factorial. Formal substitution T+a is not performed on arbitrary formal power series.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24. Source formula and its use over a Noetherian Banach algebra; the explicit coefficient and convergence arguments are expanded here.

### Polynomial and series Hasse derivatives agree

`L4/hasse-polynomial-comparison` · comparison.

The native inclusion of B[T] in B[[T]] carries Polynomial.hasseDeriv s p to Delta_s of the included polynomial, for every semiring B.

**Hypotheses.** No topology, characteristic restriction or commutativity of B.

**Inputs.** `LocallyAnalyticDistributions:L4/hasse-series`, `mathlib:Polynomial.hasseDeriv`, `mathlib:Polynomial.hasseDeriv_coeff`, `mathlib:Polynomial.coeff_coe`.

**Proof outline.** Compare coefficient n on both sides. The pinned polynomial formula is choose(n+s,s) times coefficient n+s. Natural-number scalar multiplication is its natural cast multiplied on the left. This is an adapter to the existing polynomial operation, not a new polynomial differentiation theory.

**Acceptance checks.** Preserve the order of coefficient multiplication over noncommutative semirings.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24. Source formula and its use over a Noetherian Banach algebra; the explicit coefficient and convergence arguments are expanded here.

### Hasse product formula for power series

`L4/hasse-product` · lemma.

For f,g in B[[T]] and s in N, Delta_s(fg)=sum over i+j=s of (Delta_i f)(Delta_j g), with f before g in every product.

**Hypotheses.** B is any semiring; the sum over pairs of natural numbers with i+j=s is finite.

**Inputs.** `LocallyAnalyticDistributions:L4/hasse-polynomial-comparison`, `mathlib:Polynomial.hasseDeriv_mul`, `mathlib:PowerSeries.coeff_trunc`, `mathlib:PowerSeries.coeff_mul_eq_coeff_trunc_mul_trunc`.

**Proof outline.** Fix the coefficient n to be compared and truncate both f and g at N=n+s+1. All coefficients used on the left have degree at most n+s. On the right a contributing convolution pair r+t=n and Hasse pair i+j=s uses coefficients r+i and t+j, both less than N. Replace each by its polynomial truncation coefficient. Apply the existing polynomial Hasse product theorem and the polynomial comparison. Coefficient extensionality concludes the formal identity without any infinite rearrangement.

**Acceptance checks.** A noncommutative coefficient test must distinguish fg from gf.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14). The formal product identity and evaluated recurrence are read directly. The commutative Banach-algebra extension uses bounded scalar action; the field dimension argument is not imported. [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24. Source formula and its use over a Noetherian Banach algebra; the explicit coefficient and convergence arguments are expanded here.

### Hasse coefficient radius bound

`L4/hasse-coefficient-bound` · lemma.

For a normed ring B, f in B[[T]], s,n in N and real R>0, norm(coefficient_n(Delta_s f)) R^n is at most R^(-s) norm(coefficient_(n+s)(f)) (2R)^(n+s).

**Hypotheses.** B need not be commutative, complete, ultrametric or norm-one. R is strictly positive.

**Inputs.** `LocallyAnalyticDistributions:L4/hasse-series`, `mathlib:norm_pow_le_mul_norm`, `mathlib:Nat.choose_le_two_pow`.

**Proof outline.** The additive counterpart norm_nsmul_le of the indexed multiplicative declaration bounds repeated addition by choose(n+s,s) times the coefficient norm. Bound the binomial coefficient by 2^(n+s). Multiply by the nonnegative R^n and rewrite 2^(n+s) R^n as R^(-s)(2R)^(n+s). Positivity of R justifies cancellation.

**Acceptance checks.** The right radius is 2R; a fixed radius argument alone does not prove entireness. The zero operator ring is admitted; no norm-one identity is used.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24. Source formula and its use over a Noetherian Banach algebra; the explicit coefficient and convergence arguments are expanded here.

### Hasse derivatives preserve entireness

`L4/hasse-entire` · lemma.

If for every real R>0 the sequence norm(f_n) R^n tends to zero, the same holds for the coefficients of Delta_s f, for each fixed s. This applies to a possibly noncommutative normed coefficient ring.

**Hypotheses.** B is a normed ring; no completeness is needed for this coefficient limit statement.

**Inputs.** `LocallyAnalyticDistributions:L4/hasse-coefficient-bound`, `LocallyAnalyticDistributions:L4/entire-series`.

**Proof outline.** Apply the original decay at 2R to the shifted index n+s, which tends to infinity. Multiply by the fixed factor R^(-s). The Hasse coefficient norm is nonnegative and bounded by this sequence. Squeeze to zero, for each R>0. On commutative A this is exactly membership in the existing entire-series carrier.

**Acceptance checks.** Entireness means all positive radii, not merely radii less than one.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24. Source formula and its use over a Noetherian Banach algebra; the explicit coefficient and convergence arguments are expanded here.

### Evaluated Hasse derivatives of the resolvent

`L4/resolvent-hasse-evaluation` · construction.

For a in A and s in N, construct z_s(a)=sum_n choose(n+s,s) a^n v_(n+s) as a continuous A-linear endomorphism of M, where v_n are the existing Fredholm resolvent coefficients. The sum converges in the native K-operator norm.

**Hypotheses.** Standing Banach hypotheses; M has (Pr) and u is completely continuous. Use the norm after restriction to K. The compatible A-action has an explicit bound norm(bx) <= C norm(b) norm(x) for some C>0; C is not assumed to be one.

**Inputs.** `LocallyAnalyticDistributions:L4/resolvent-series`, `LocallyAnalyticDistributions:L4/hasse-entire`, `mathlib:ContinuousLinearMap.instCompleteSpace`, `mathlib:ContinuousLinearMap.opNorm_le_bound`, `mathlib:ContinuousLinearMap.le_opNorm`, `mathlib:Summable.of_norm_bounded_eventually_nat`, `mathlib:summable_geometric_of_lt_one`.

**Proof outline.** Form the Hasse coefficient series in the existing complete normed ring of continuous K-linear endomorphisms. The previous entireness lemma applies to the norm after scalar restriction. Choose rho>max(norm(a),0). Hasse entireness makes norm(w_n) rho^n eventually at most one. The scalar-action bound and operator-norm inequality give norm(a^n w_n) <= C (norm(a)/rho)^n eventually. Thus the norms and the operators are summable by the real geometric series and completeness. Every partial sum is A-linear. Operator-norm convergence implies pointwise convergence, and continuity of scalar multiplication lets the A-linearity equality pass to the limit. Package the limit as the native continuous A-linear map; uniqueness of limits makes it independent of the chosen bound and radius. At s=0 compare term by term with the existing resolvent evaluation. At a=0 the only surviving term is v_s. This uses no change of module norm and creates no competing operator carrier.

**Uses.** LocallyAnalyticDistributions:L4/evaluated-hasse-resolvent: Evaluates the formal differentiated identity. LocallyAnalyticDistributions:L4/riesz-root-projectors: Constructs the operators z_h and z_(h-1) entering the projectors.

**API.**

| Declaration | Contract |
|---|---|
| `resolventHasseAt_hasSum` | The binomially weighted resolvent coefficient sequence has this sum in the native K-operator norm, with the explicit bounded-action hypothesis. |
| `resolventHasseAt_zero` | Hasse order zero agrees with the existing resolventAt. |
| `resolventHasseAt_at_zero` | At a=0 the value is exactly v_s. |

**Unit tests.**

- `hasse_scalar_resolvent` (degenerate): On the line A with u=a, the resolvent numerator is constant one, so z_1(t)=0.
- `hasse_diagonal_resolvent` (characterisation): For diag(a,b), z_1(t)=diag(-b,-a), independent of t.
- `hasse_nilpotent_resolvent` (non-example): For the nonzero nilpotent two-by-two Jordan block N, z_1(t)=N even though P_N=1.

**Acceptance checks.** This construction consumes resolvent-series entireness, now supported by resolvent-recurrence-entire and its separate adjugate/truncation/retraction chain. The recurrence alone cannot supply convergence.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14). The formal product identity and evaluated recurrence are read directly. The commutative Banach-algebra extension uses bounded scalar action; the field dimension argument is not imported. [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24. Source formula and its use over a Noetherian Banach algebra; the explicit coefficient and convergence arguments are expanded here.

### Evaluated Hasse resolvent recurrence

`L4/evaluated-hasse-resolvent` · lemma.

For every s>=0 and a in A, (1-au) z_(s+1)(a) - u z_s(a) = Delta_(s+1) P_u(a) times 1, and z_(s+1)(a)(1-au) - z_s(a)u has the same value. The order-zero identity is the existing two-sided resolvent identity, using z_0(a)=F_u(a).

**Hypotheses.** Standing Banach hypotheses; M has (Pr) and u is completely continuous. Use the norm after restriction to K. The compatible A-action has an explicit bound norm(bx) <= C norm(b) norm(x) for some C>0; C is not assumed to be one.

**Inputs.** `LocallyAnalyticDistributions:L4/hasse-product`, `LocallyAnalyticDistributions:L4/resolvent-hasse-evaluation`, `LocallyAnalyticDistributions:L4/hasse-polynomial-comparison`, `LocallyAnalyticDistributions:L4/resolvent-series`, `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:HasSum.mul_left`, `mathlib:HasSum.mul_right`.

**Proof outline.** Apply the formal product formula to (1-Tu)F_u=P_u times 1. Its only nonzero derivatives on the first factor have orders zero and one, with Delta_1(1-Tu)=-u. This gives the left formal recurrence; start with F_u(1-Tu) for the right recurrence. The Hasse evaluation construction gives absolute norm summability at a. Continuous left/right multiplication may therefore pass through the sum. The extra T shifts the index with an explicit zero constant term, and multiplication by a is the bounded scalar operator. Coefficient-wise scalar identities evaluate to Delta_(s+1) P_u(a) times the identity: the map b to scalar multiplication by b is bounded by C. Preserve both product orders until commutation is established separately.

**Acceptance checks.** At a Hasse root of order h the right side vanishes for s+1<h and equals the specified unit c at s+1=h. The s=0 identity is not obtained by using a negative derivative order.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14). The formal product identity and evaluated recurrence are read directly. The commutative Banach-algebra extension uses bounded scalar action; the field dimension argument is not imported. [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24. Source formula and its use over a Noetherian Banach algebra; the explicit coefficient and convergence arguments are expanded here.

### Hasse resolvent values lie in the polynomial closure

`L4/hasse-polynomial-closure` · lemma.

For every a in A and s in N, the restricted K-linear map z_s(a) belongs to the closure, in the native K-operator norm, of the set of finite polynomial expressions sum_i b_i u^i with b_i in A.

**Hypotheses.** Standing Banach hypotheses; M has (Pr) and u is completely continuous. Use the norm after restriction to K. The compatible A-action has an explicit bound norm(bx) <= C norm(b) norm(x) for some C>0; C is not assumed to be one.

**Inputs.** `LocallyAnalyticDistributions:L4/resolvent-hasse-evaluation`, `LocallyAnalyticDistributions:L4/resolvent-series`, `mathlib:hasSum_iff_tendsto_nat_of_summable_norm`.

**Proof outline.** Induct on n in v_0=1 and v_(n+1)=c_(n+1) times 1+u v_n to express v_n as a polynomial in u with scalar A-coefficients. Each finite partial sum defining z_s(a) remains a polynomial in u; the binomial and a powers are scalar coefficients. The construction proves norm summability, hence convergence of initial partial sums to z_s(a). A limit of elements of the polynomial set lies in its closure. There is no use of a norm on A-linear endomorphisms independent of scalar restriction.

**Acceptance checks.** The topology is operator norm, not pointwise convergence. The zero module is included.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14). The formal product identity and evaluated recurrence are read directly. The commutative Banach-algebra extension uses bounded scalar action; the field dimension argument is not imported. [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24. Source formula and its use over a Noetherian Banach algebra; the explicit coefficient and convergence arguments are expanded here.

### Hasse resolvent values commute

`L4/hasse-resolvent-commutation` · lemma.

Each z_s(a) commutes with u and with every z_t(b), for all a,b in A and s,t in N.

**Hypotheses.** Standing Banach hypotheses; M has (Pr) and u is completely continuous. Use the norm after restriction to K. The compatible A-action has an explicit bound norm(bx) <= C norm(b) norm(x) for some C>0; C is not assumed to be one.

**Inputs.** `LocallyAnalyticDistributions:L4/hasse-polynomial-closure`, `mathlib:ContinuousLinearMap.toNormedRing`.

**Proof outline.** A-linearity of u makes every scalar multiplication by A commute with u; commutativity of A then makes all finite polynomials in u commute with one another. For a fixed polynomial operator q, the equation xq=qx defines a closed set because multiplication in the native K-operator ring is continuous. Taking the first limit shows z_s(a) commutes with each polynomial. Fix z_s(a) and take a second limit through the same closed commutation equation. This proves commutation with z_t(b); choosing q=u proves the first assertion. Faithfulness of scalar restriction returns the A-linear equalities.

**Acceptance checks.** Use two successive limits, not an unproved assertion that arbitrary limits preserve products uniformly.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14). The formal product identity and evaluated recurrence are read directly. The commutative Banach-algebra extension uses bounded scalar action; the field dimension argument is not imported.

### Roots of an entire series with unit constant are units

`L4/entire-root-unit` · lemma.

If f in A{{T}} has constant coefficient one and f(a)=0, then a is a unit with inverse -sum_(n>=0) f_(n+1) a^n. In particular a positive-order Hasse root of a Fredholm determinant is a unit.

**Hypotheses.** A is a complete commutative normed ring; no field, reducedness, Noetherianity or characteristic hypothesis is needed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:Summable.of_norm_bounded_eventually_nat`, `mathlib:summable_geometric_of_lt_one`, `mathlib:HasSum.mul_left`.

**Proof outline.** Choose rho>max(norm(a),0). Decay of norm(f_(n+1)) rho^(n+1) bounds the shifted coefficient norm by a constant times rho^(-n). Thus the shifted tail evaluated at a is absolutely summable by a geometric comparison. Separate the constant term in the convergent evaluation and shift the tail: 0=f(a)=1+a sum_n f_(n+1) a^n. Moving terms gives a times the displayed negative tail equal to one. Commutativity supplies the reverse product identity and therefore a unit with this inverse. The argument does not infer equality from residue fields.

**Unit tests.**

- `root_nonunit_constant` (non-example): The entire polynomial T vanishes at zero, which is not a unit in a nonzero coefficient algebra.

**Acceptance checks.** The constant-coefficient assumption is essential: f=T has the nonunit root zero. For Hasse order zero no root vanishing is assumed, and this lemma is not applied.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24. Source formula and its use over a Noetherian Banach algebra; the explicit coefficient and convergence arguments are expanded here.

### Lower Hasse resolvent annihilation

`L4/hasse-lower-annihilation` · lemma.

For every s<h, v^(s+1) z_s=0.

**Hypotheses.** Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

**Inputs.** `LocallyAnalyticDistributions:L4/evaluated-hasse-resolvent`, `LocallyAnalyticDistributions:L4/hasse-resolvent-commutation`, `LocallyAnalyticDistributions:L4/resolvent-series`.

**Proof outline.** For h>0 the order-zero identity v z_0=P_u(a) I is zero. For s+1<h the Hasse recurrence gives v z_(s+1)=u z_s. Induct: v^(s+2)z_(s+1)=v^(s+1)u z_s=u v^(s+1)z_s=0. Commutation follows since v=1-au. For h=0 the conclusion has no instances.

**Acceptance checks.** Use the exact s+1 exponent, including the s=0 boundary; no factorials.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14). The recurrence, commuting operators and explicit complementary projectors are expanded on the existing continuous-linear-map carrier; the field dimension argument is not imported. [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Proposition 3.2, manuscript p. 23, first proof paragraph. Identifies the unique summands with the kernel and image of the h-th power before the separate finite-projectivity argument.

### Normalized Hasse resolvent identity

`L4/hasse-normalized-annihilation` · lemma.

The actual b=c^(-1)z_h commutes with v, and v^h(1-vb)=0, including h=0.

**Hypotheses.** Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

**Inputs.** `LocallyAnalyticDistributions:L4/hasse-lower-annihilation`, `LocallyAnalyticDistributions:L4/evaluated-hasse-resolvent`, `LocallyAnalyticDistributions:L4/hasse-resolvent-commutation`, `LocallyAnalyticDistributions:L4/resolvent-series`.

**Proof outline.** For h>0 the top recurrence is v z_h-u z_(h-1)=c I. Multiply by the inverse scalar to get 1-vb=-c^(-1)u z_(h-1). The lower-annihilation lemma at h-1 kills this after multiplication by v^h; scalar multiplication is central in the ring of A-linear endomorphisms. Commutation of v with b follows from commutation of u with z_h. For h=0 use v z_0=P_u(a)I=cI directly, giving vb=1. This avoids a fictitious z_(-1) and supplies invertibility even though there is no root.

**Acceptance checks.** The nonzero coefficient must be a unit, not merely nonzero. For diag(1,3) over Z/4 at a=1, the first Hasse value is 2 and cannot be inverted. This finite-ring control tests the algebra, not the standing Banach hypotheses.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14). The recurrence, commuting operators and explicit complementary projectors are expanded on the existing continuous-linear-map carrier; the field dimension argument is not imported. [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Proposition 3.2, manuscript p. 23, first proof paragraph. Identifies the unique summands with the kernel and image of the h-th power before the separate finite-projectivity argument.

### Explicit Hasse Riesz projector

`L4/riesz-projector-formula` · construction.

Define rieszRootProjector(u,Pr,cc,a,h,c)=E=1-((1-au)(c^(-1)z_h))^h as a native continuous A-linear endomorphism; its complement is p=1-E. The formula exists for every a,h and chosen unit c; its spectral properties require the exact Hasse-order hypotheses.

**Hypotheses.** Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

**Inputs.** `LocallyAnalyticDistributions:L4/resolvent-hasse-evaluation`.

**Proof outline.** Use composition, powers, scalar multiplication and subtraction on the existing ring of continuous A-linear endomorphisms. There is no new operator carrier. At h=0 the formula gives E=0 and p=1. Under the root hypotheses, the following lemmas identify it with the source projector onto N, while Serre calls its complement p.

**Uses.** LocallyAnalyticDistributions:L4/riesz-root-projectors: Supplies explicit continuous projectors for the analytic split before finite generation and projectivity. LocallyAnalyticDistributions:L4/finite-slope-summands: The root splitting applied to a polynomial in u is the intermediate step; exact Q-star annihilation and rank remain separate. PadicFamilies:L2a: The existing consumer ultimately needs canonical finite-slope summands; this checkpoint supplies only the algebraic projector component of that chain.

**API.**

| Declaration | Contract |
|---|---|
| `rieszRootProjector_formula` | Equality with 1-((1-au)(c^(-1)z_h))^h on the existing continuous-linear-map carrier. |
| `rieszRootProjector_zero_order` | For h=0 the projector is zero for every a and chosen unit c. |
| `rieszRootProjector_fixed_iff` | Under the exact Hasse-order hypotheses, E x=x if and only if v^h x=0. |
| `rieszRootProjector_eq_projectionL` | Under the exact Hasse-order hypotheses, there is a native topological-complement proof for ker(v^h) and image(v^h), and E equals its existing Submodule.projectionL. |

**Unit tests.**

- `riesz_order_zero` (degenerate): At order zero the formula gives E=0 on every M, even without the root hypotheses.
- `riesz_scalar_root` (computation): For u=identity on A, a=1, h=1 and c=-1, E is the identity.
- `riesz_diagonal_root` (characterisation): For u=diag(1,0) on the native two-coordinate c0 module, a=1, h=1, c=-1, E=diag(1,0), not its regular complement.
- `riesz_jordan_root` (non-example): For u=I+N with the nonzero two-by-two nilpotent Jordan block N, a=1, h=2, c=1, E=I although 1-u is nonzero. The full generalized eigenspace is required.

**Acceptance checks.** The sign and choice of summand are fixed by the diagonal test. Retain generalized eigenspaces.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14). The recurrence, commuting operators and explicit complementary projectors are expanded on the existing continuous-linear-map carrier; the field dimension argument is not imported. [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Proposition 3.2, manuscript p. 23, first proof paragraph. Identifies the unique summands with the kernel and image of the h-th power before the separate finite-projectivity argument.

### Idempotence of the Hasse projector

`L4/riesz-projector-idempotence` · lemma.

Under the exact Hasse-order hypotheses, E is idempotent; p=1-E is its complementary idempotent.

**Hypotheses.** Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

**Inputs.** `LocallyAnalyticDistributions:L4/riesz-projector-formula`, `LocallyAnalyticDistributions:L4/hasse-normalized-annihilation`, `mathlib:Commute.mul_pow`, `mathlib:one_sub_dvd_one_sub_pow`, `mathlib:IsIdempotentElem.one_sub`.

**Proof outline.** Use vb=bv to write e^h=v^h b^h. The normalized identity and commutation give (1-e)e^h=0, equivalently e^h(1-e)=0. The pinned geometric-sum divisibility gives 1-e^h=(1-e)d. Multiplying by e^h gives e^h(1-e^h)=0, so p^2=p; apply the existing one_sub idempotent lemma to E. The same factorization and v^h(1-e)=0 give v^h E=0. Products Ep=pE=0 and E+p=1 use the baseline idempotent API.

**Acceptance checks.** Do not assume e itself idempotent. For the source root of u=J_2(1) plus scalar 2 over Z/3, e is nonzero nilpotent on the first block; 1-e is not idempotent while 1-e^2 is.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14). The recurrence, commuting operators and explicit complementary projectors are expanded on the existing continuous-linear-map carrier; the field dimension argument is not imported. [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Proposition 3.2, manuscript p. 23, first proof paragraph. Identifies the unique summands with the kernel and image of the h-th power before the separate finite-projectivity argument.

### Canonical kernel and image summands

`L4/riesz-kernel-image` · lemma.

The projector has image(E)=ker(v^h) and ker(E)=image(v^h); equivalently image(p)=image(v^h). These identify the summands of the root splitting canonically.

**Hypotheses.** Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

**Inputs.** `LocallyAnalyticDistributions:L4/riesz-projector-idempotence`, `LocallyAnalyticDistributions:L4/hasse-normalized-annihilation`, `mathlib:Commute.mul_pow`, `mathlib:LinearMap.IsIdempotentElem.range_eq_ker_one_sub`, `mathlib:LinearMap.IsIdempotentElem.ker_eq_range_one_sub`, `mathlib:LinearMap.IsIdempotentElem.mem_range_iff`.

**Proof outline.** v^h E=0 gives image(E) contained in ker(v^h). If v^h x=0 then p x=v^h b^h x=b^h v^h x=0, so E x=x and the reverse inclusion follows. Since p=v^h b^h, image(p) is contained in image(v^h). Conversely v^h E=0 implies v^h=v^h p=p v^h, so p is the identity on image(v^h). Use the baseline image/kernel identities of complementary idempotents to identify ker(E)=image(p). The fixed-vector API follows from the baseline characterization of an idempotent image.

**Acceptance checks.** At h=0, ker(v^0)=0 and image(v^0)=M. Uniqueness uses these actual submodules, without choosing a basis or a finite-rank approximation.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14). The recurrence, commuting operators and explicit complementary projectors are expanded on the existing continuous-linear-map carrier; the field dimension argument is not imported. [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Proposition 3.2, manuscript p. 23, first proof paragraph. Identifies the unique summands with the kernel and image of the h-th power before the separate finite-projectivity argument.

### Topological Riesz decomposition

`L4/riesz-topological-splitting` · theorem.

N=ker(v^h) and F=image(v^h) are closed native A-submodules and topological complements. The constructed E agrees with the native continuous projection onto N along F.

**Hypotheses.** Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

**Inputs.** `LocallyAnalyticDistributions:L4/riesz-kernel-image`, `LocallyAnalyticDistributions:L4/riesz-projector-idempotence`, `mathlib:ContinuousLinearMap.IsIdempotentElem.isTopCompl`, `mathlib:ContinuousLinearMap.IsIdempotentElem.isClosed_range`, `mathlib:ContinuousLinearMap.IsIdempotentElem.eq_projectionL`.

**Proof outline.** The baseline isTopCompl theorem for a continuous idempotent supplies the topological direct sum, not merely an algebraic complement. Transport it along the kernel/image identifications. The two continuous idempotents have closed images in the Hausdorff module. The baseline projectionL identity gives the native comparison with no new splitting structure.

**Acceptance checks.** Closedness of image(v^h) is proved through its idempotent presentation. Do not import real/complex Riesz closed-range theorems, or infer closed range for arbitrary continuous maps. This statement contains no claim of finite generation, projectivity or rank.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14). The recurrence, commuting operators and explicit complementary projectors are expanded on the existing continuous-linear-map carrier; the field dimension argument is not imported. [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Proposition 3.2, manuscript p. 23, first proof paragraph. Identifies the unique summands with the kernel and image of the h-th power before the separate finite-projectivity argument.

### Inverse on the regular Riesz summand

`L4/riesz-regular-inverse` · theorem.

Both v and b preserve F=image(v^h), and v(bx)=b(vx)=x for every x in F. Their restrictions are mutually inverse continuous A-linear maps of F.

**Hypotheses.** Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

**Inputs.** `LocallyAnalyticDistributions:L4/riesz-kernel-image`, `LocallyAnalyticDistributions:L4/hasse-normalized-annihilation`, `LocallyAnalyticDistributions:L4/riesz-projector-idempotence`.

**Proof outline.** Commutation with v^h proves that v and b map its image into itself. From (1-e)p=0 obtain vb p=p; commutation gives bv p=p as well. Write x=p y on F and evaluate those identities. Restrict the existing continuous A-linear maps to the invariant submodule. This exhibits a continuous inverse, without invoking an open mapping theorem. Serre displays c^(-h)v^(h-1)z_h^h on F when h>0. It equals b on F: b^h v^(h-1)=b(vb)^(h-1), and vb is the identity there. Treat h=0 by vb=bv=1 on M.

**Acceptance checks.** The inverse is asserted only on F. In the Jordan test v is nilpotent on N and has no inverse there.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14). The recurrence, commuting operators and explicit complementary projectors are expanded on the existing continuous-linear-map carrier; the field dimension argument is not imported. [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Proposition 3.2, manuscript p. 23, first proof paragraph. Identifies the unique summands with the kernel and image of the h-th power before the separate finite-projectivity argument.

### Polynomial closure of Riesz projectors

`L4/riesz-projector-closure` · lemma.

E and p belong to the K-operator-norm closure of the actual A-polynomials in u, represented by the existing finite polynomial evaluation formula.

**Hypotheses.** Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

**Inputs.** `LocallyAnalyticDistributions:L4/riesz-projector-formula`, `LocallyAnalyticDistributions:L4/hasse-polynomial-closure`.

**Proof outline.** Each z_h is in that closure by the prior analytic lemma. The identity, scalar endomorphisms and u belong to the polynomial set. In the complete normed ring of K-linear endomorphisms, continuous addition, multiplication and the bounded scalar action show that this closure is closed under subtraction, multiplication and scalar multiplication. Apply these operations to the displayed finite formula for E; p=1-E follows. This uses the already constructed A-linear Hasse value, not a formal infinite Taylor substitution. No convergence or adjugate estimate is inferred from the algebraic formula.

**Acceptance checks.** Keep the topology on the actual K-operator norm, as in the Hasse predecessor. No abstract substitute for A[u] is introduced.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14). The recurrence, commuting operators and explicit complementary projectors are expanded on the existing continuous-linear-map carrier; the field dimension argument is not imported. [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Proposition 3.2, manuscript p. 23, first proof paragraph. Identifies the unique summands with the kernel and image of the h-th power before the separate finite-projectivity argument.

### Stability under commuting operators

`L4/riesz-commuting-stability` · lemma.

Every continuous A-linear endomorphism t commuting with u commutes with E and p, and preserves N=ker(v^h) and F=image(v^h).

**Hypotheses.** Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

**Inputs.** `LocallyAnalyticDistributions:L4/riesz-projector-closure`, `LocallyAnalyticDistributions:L4/riesz-kernel-image`, `LocallyAnalyticDistributions:L4/riesz-projector-idempotence`, `mathlib:ContinuousLinearMap.IsIdempotentElem.commute_iff`.

**Proof outline.** A-linear t commutes with each A-polynomial in u. The commutant is closed in the K-operator norm because left and right multiplication by its scalar restriction are continuous. Pass the polynomial commutation equality to E in the closure and then to p=1-E. Apply the existing idempotent commute_iff theorem and the kernel/image identifications for invariance.

**Acceptance checks.** No complete-continuity hypothesis on t and no extra source of finite projectivity. This is the stability needed by commuting Hecke operators in the existing slope consumer.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14). The recurrence, commuting operators and explicit complementary projectors are expanded on the existing continuous-linear-map carrier; the field dimension argument is not imported. [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Proposition 3.2, manuscript p. 23, first proof paragraph. Identifies the unique summands with the kernel and image of the h-th power before the separate finite-projectivity argument.

### Finite coordinate truncation

`L4/finite-coordinate-projection` · construction.

For a finite T⊆I, the existing helper π_T is the native continuous A-linear endomorphism of c_A(I) that retains coordinates in T and sets every other coordinate to zero. Its value is the finite sum Σ_{j∈T}x_j e_j; the carrier remains the native C0 space.

**Hypotheses.** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Inputs.** `mathlib:ZeroAtInftyContinuousMap`, `mathlib:ZeroAtInftyContinuousMap.ext`, `mathlib:ZeroAtInftyContinuousMap.toBCF`, `mathlib:ZeroAtInftyContinuousMap.norm_toBCF_eq_norm`, `mathlib:BoundedContinuousFunction.norm_le`, `mathlib:BoundedContinuousFunction.norm_coe_le_norm`.

**Proof outline.** The finite-support function is continuous because I is discrete, and vanishes at infinity because its support lies in finite T. This constructs an element of the native ZeroAtInftyContinuousMap carrier. Linearity is pointwise. Transfer the native supremum norm through toBCF and bound the difference pointwise by the norm of the original difference, giving continuity without choosing a basis enumeration. The empty projection, intersection composition and basis-vector formulas follow coordinatewise. The evaluation and norm API items are promoted below before use in the analytic estimates.

**Uses.** compact-matrix-criterion and resolvent-coefficient-bound: The actual finite-coordinate approximation is π_T composed with u; its image has finite A-support and its output columns retain the common majorant. c0-lift and orthonormalizable-modules: Finite-support truncations approximate each native c0 vector and give the coordinate norm and basis tests.

**API.**

| Declaration | Contract |
|---|---|
| `coordinateProjection_apply` | At coordinate j, π_T(x)_j is x_j if j∈T and zero otherwise; promoted to finite-coordinate-projection-evaluation. |
| `coordinateProjection_norm_le` | For every x, ‖π_T x‖≤‖x‖; the existing signature is promoted to finite-coordinate-projection-bound. |
| `coordinateProjection_empty` | π_∅=0 as a native continuous A-linear map. |
| `coordinateProjection_inter` | π_T composed with π_S is π_(T∩S); hence each finite projection is idempotent. |
| `coordinateProjection_single` | π_T(a e_j)=a e_j if j∈T, and zero if j∉T. |

**Unit tests.**

- `projection_empty_support` (computation): For every x, π_∅x=0.
- `projection_selected_coordinate` (computation): π_{j}(a e_j)=a e_j.
- `projection_rejected_coordinate` (non-example): If i≠j, π_{i}(a e_j)=0.

**Acceptance checks.** This promotes the existing suggested helper; it does not define a second c0 carrier. Empty T gives zero, and the identity on an infinite c0 space is not a finite projection.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), §2, pp.7–12 for coordinates; §3, full manuscript p.22 freshly reread on27 September2026 for the Fredholm resolvent over (Pr) modules.. The coordinate maps use the existing C0 carrier. The source invokes Serre Proposition10 for a Noetherian Banach algebra and a (Pr) module; the explicit finite-coordinate and retraction steps are decomposed here rather than assumed from the recurrence.

### Evaluation of a finite coordinate projection

`L4/finite-coordinate-projection-evaluation` · lemma.

For T finite, x∈c_A(I) and j∈I, (π_T x)_j=x_j when j∈T, and (π_T x)_j=0 otherwise.

**Hypotheses.** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Inputs.** `LocallyAnalyticDistributions:L4/finite-coordinate-projection`.

**Proof outline.** Evaluate the defining finite-support function. This is the promoted projection formula, so subsequent coordinate arguments use an exact node.

**Acceptance checks.** The formula treats selected and unselected coordinates and implies that π_Tu has output support in T.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026.. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Contractivity of coordinate truncation

`L4/finite-coordinate-projection-bound` · lemma.

For every finite T⊆I and every x∈c_A(I), ‖π_T x‖≤‖x‖.

**Hypotheses.** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Inputs.** `LocallyAnalyticDistributions:L4/finite-coordinate-projection-evaluation`, `mathlib:BoundedContinuousFunction.norm_le`, `mathlib:BoundedContinuousFunction.norm_coe_le_norm`, `mathlib:ZeroAtInftyContinuousMap.norm_toBCF_eq_norm`.

**Proof outline.** Use finite-coordinate-projection-evaluation to bound each coordinate by ‖x‖, using zero outside T. Apply the native bounded-function norm characterization and the C0-to-bounded-function norm equality.

**Acceptance checks.** This proves operator norm at most one after restricting scalars to K; it does not assert that every projection has norm one, since T can be empty.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026.. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Operator bound from the coordinate vectors

`L4/c0-operator-norm-criterion` · lemma.

For a continuous A-linear f:c_A(I)→c_A(I) and C≥0, ‖f‖_K≤C if and only if ‖f(e_i)‖≤C for every i∈I.

**Hypotheses.** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Inputs.** `LocallyAnalyticDistributions:L4/c0-lift`, `LocallyAnalyticDistributions:L4/c0-scalar-bound`, `mathlib:ContinuousLinearMap.le_opNorm`, `mathlib:ContinuousLinearMap.opNorm_le_bound`.

**Proof outline.** A coordinate vector has norm one when it exists. The forward implication follows from the native le_opNorm bound and the native C0 supremum norm. For the reverse implication, use c0-lift on the bounded family f(e_i). Its norm formula, normalized A-action and uniqueness identify the resulting map with f and bound it by C. This includes empty I, where both the module and the operator norm are zero.

**Acceptance checks.** No countability or algebraic spanning assertion for the infinite c0 module is assumed. Finite-support density is used through the already planned bounded-family extension.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026.. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Coefficients of the finite adjugate

`L4/finite-adjugate-recurrence` · lemma.

For a d×d matrix D over A, put H(T)=I−TD, c_n=coeff_n det(H), and B_n=(coeff_n adj(H)_ij)_ij. Then B₀=I and B_(n+1)=c_(n+1)I+B_nD. This order is compatible with the input-first operator convention.

**Hypotheses.** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Inputs.** `mathlib:Matrix.adjugate`, `mathlib:Matrix.adjugate_mul`, `mathlib:Matrix.adjugate_one`, `mathlib:Polynomial.coeff_mul`.

**Proof outline.** Apply the native identity adj(H)H=det(H)I over the existing polynomial ring. Taking degree n+1 gives B_(n+1)−B_nD=c_(n+1)I by the polynomial product coefficient formula. The constant coefficient is adj(I)=I; extract it by evaluation at zero, or directly from the cofactor formula. Include d=0, where the matrix carrier is a subsingleton and the determinant is one.

**Unit tests.**

- `adjugate_rank_one` (computation): For the one-by-one matrix (a), adj(I−TD)=I.
- `adjugate_diagonal_two` (computation): For diag(a,b), the adjugate is diag(1−bT,1−aT).
- `adjugate_nilpotent_two` (computation): For the nonzero two-by-two nilpotent Jordan matrix N, adj(I−TN)=I+TN.

**Acceptance checks.** The adjugate is a numerator, not an inverse obtained by dividing by a determinant. In the input-first convention, f composed with V corresponds to the matrix of V multiplied on the right by D.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026.. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Distinct-column bound for adjugate coefficients

`L4/finite-adjugate-coefficient-bound` · lemma.

Let D be a d×d matrix, b_j≥0 with ‖D_ij‖≤b_j, n≥0 and C≥0. Assume ∏_{j∈S}b_j≤C for every n-element subset S of its column index set. Every coefficient of degree n of every entry of adj(I−TD) then has norm at most C.

**Hypotheses.** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Inputs.** `mathlib:Matrix.adjugate_fin_succ_eq_det_submatrix`, `mathlib:Matrix.det_apply`, `mathlib:Polynomial.coeff_mul`, `mathlib:IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg`.

**Proof outline.** For d=0 the entry assertion is empty. For d>0 use the native cofactor formula adjugate_fin_succ_eq_det_submatrix, after the usual finite-index identification. Expand the cofactor determinant by permutations and each product by Polynomial.coeff_mul. Every nonzero degree-n contribution selects n distinct columns of D, with coefficient a sign and the remaining factors from identity entries. Thus each contribution has norm at most a product of n distinct b_j. Use submultiplicativity, norm one for signs and the ultrametric finite-sum inequality. There is no factorial multiplier. For n above the cofactor degree all contributions vanish. For n=0 the empty product is one.

**Acceptance checks.** Repeated columns are not allowed in the product majorant. The estimate holds over nonreduced Banach algebras and uses no eigenvalues or division by n!.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026.. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Resolvent recurrence on finite coordinates

`L4/finite-coordinate-resolvent-comparison` · comparison.

Let u:c_A(I)→c_A(I) be completely continuous, with output support in a finite J. Let V₀=I and V_(n+1)=c_(n+1)(u)I+uV_n, where c_n(u) are the actual Fredholm coefficients. For every finite L⊇J, the entries of V_n between coordinates i,j∈L equal the degree-n coefficients of adj(I−T D_L), where D_L=(u_ij)_(i,j∈L).

**Hypotheses.** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Inputs.** `LocallyAnalyticDistributions:L4/finite-coordinate-determinant`, `LocallyAnalyticDistributions:L4/finite-adjugate-recurrence`.

**Proof outline.** The operator u preserves the coordinate submodule A^L because its entire output lies in A^J⊆A^L. The finite-coordinate-determinant comparison identifies the actual Fredholm series with det(I−TD_L), including the additional zero directions in L. Restriction of V₀ is identity. Inductively restrict the recurrence to A^L. In the input-first convention uV_n has matrix B_nD_L. Apply finite-adjugate-recurrence and uniqueness of the algebraic recurrence. This statement does not bound the whole operator by restricting only to J. In the following norm proof L is chosen to contain the tested input coordinate as well as J.

**Unit tests.**

- `finite_output_support_is_not_enough_for_input` (non-example): For diag(a,0), coefficient one of the (1,1) entry of adj(I−TD) is −a, whereas that of the (0,0) entry is zero, using indices0,1.

**Acceptance checks.** For diag(a,0), the degree-one adjugate coefficient on the second coordinate is −a, even though it is zero on the image coordinate.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026.. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Resolvent bound for finite output support

`L4/finite-output-resolvent-bound` · lemma.

Suppose u has output support in finite J. Let b_j≥0 bound its output-column norms, fix n≥0 and C≥0, and assume every product of n distinct b_j is at most C. Then ‖V_n‖_K≤C.

**Hypotheses.** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars. V is any sequence of native continuous A-linear endomorphisms with V₀=I and V_(n+1)=c_(n+1)(u)I+uV_n, where c_n(u) are the actual Fredholm coefficients. These are algebraic recurrence hypotheses; no analytic estimate or entireness is assumed.

**Inputs.** `LocallyAnalyticDistributions:L4/finite-coordinate-resolvent-comparison`, `LocallyAnalyticDistributions:L4/finite-adjugate-coefficient-bound`, `LocallyAnalyticDistributions:L4/c0-operator-norm-criterion`.

**Proof outline.** For each input coordinate i choose L=J∪{i}. The recurrence preserves A^L and finite-coordinate-resolvent-comparison gives the exact adjugate entries of V_n(e_i). Apply finite-adjugate-coefficient-bound to D_L with the restricted b. Its n-element subsets give n-element subsets of I, so the same C applies. The finite supremum norm gives ‖V_n(e_i)‖≤C. Apply c0-operator-norm-criterion. This treats every input coordinate, including those outside J, and avoids the incorrect inference from a bound on V_n restricted only to the image support.

**Acceptance checks.** The uniform C is independent of L and of the input i. Arbitrary index sets and empty support are included.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026.. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Continuity of the finite recurrence

`L4/resolvent-coefficient-continuity` · lemma.

Let α carry any filter l. Suppose u_α→u in K-operator norm on c_A(I), and c_(α,n)→c_n in A for each n. Define sequences V_(α,n) and V_n by initial identity and V_(α,n+1)=c_(α,n+1)I+u_αV_(α,n), respectively V_(n+1)=c_(n+1)I+uV_n. For every fixed n, V_(α,n)→V_n in K-operator norm.

**Hypotheses.** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Inputs.** `LocallyAnalyticDistributions:L4/c0-scalar-bound`, `mathlib:ContinuousLinearMap.toNormedRing`, `mathlib:ContinuousLinearMap.opNorm_le_bound`.

**Proof outline.** Induct on n. The initial identity is constant. Addition and multiplication are continuous in the native K-operator ring. The coefficient action a↦aI on c_A(I) is bounded by ‖a‖, using c0-scalar-bound and the native operator norm criterion. Its continuity carries the scalar coefficient limits into operator limits. Apply the recurrence and the induction hypothesis. The filter is arbitrary, so the result applies to finite subsets of an uncountable I ordered by inclusion.

**Acceptance checks.** Only finitely many coefficient limits are used for a fixed n; no interchange with an infinite sum or evaluation is made.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026.. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Adjugate bound for the Fredholm resolvent

`L4/resolvent-coefficient-bound` · theorem.

Let u be completely continuous on c_A(I), and let b_j≥0 bound its output-column norms. For n≥0 and C≥0, if every product of n distinct b_j is at most C, then ‖V_n‖_K≤C.

**Hypotheses.** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars. V is any sequence of native continuous A-linear endomorphisms with V₀=I and V_(n+1)=c_(n+1)(u)I+uV_n, where c_n(u) are the actual Fredholm coefficients. These are algebraic recurrence hypotheses; no analytic estimate or entireness is assumed.

**Inputs.** `LocallyAnalyticDistributions:L4/finite-coordinate-projection-evaluation`, `LocallyAnalyticDistributions:L4/finite-coordinate-projection-bound`, `LocallyAnalyticDistributions:L4/compact-matrix-criterion`, `LocallyAnalyticDistributions:L4/coefficient-continuity`, `LocallyAnalyticDistributions:L4/finite-output-resolvent-bound`, `LocallyAnalyticDistributions:L4/resolvent-coefficient-continuity`, `mathlib:le_of_tendsto`.

**Proof outline.** Take u_T=π_Tu over the directed set of finite T⊆I. The promoted projection formula gives finite output support and the same majorant b. Its image is contained in the span of finitely many coordinate vectors, so it is completely continuous by the defining finite-image approximation criterion. The existing compact-matrix-criterion gives u_T→u in operator norm. The projection bound gives a common operator-norm bound; apply coefficient-continuity to each fixed Fredholm coefficient. Define V_(T,n) by the finite algebraic recurrence. Apply resolvent-coefficient-continuity to obtain V_(T,n)→V_n for each fixed n. Each V_(T,n) has norm at most C by finite-output-resolvent-bound. Pass this closed norm inequality to the limit using le_of_tendsto. The finite-subset filter is nonempty and directed. No decreasing enumeration of column sizes is needed.

**Acceptance checks.** This supplies the analytic estimate missing from the old resolvent node. The recurrence alone would give a geometric bound and does not establish this distinct-column bound.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026.. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Entire tail estimate for resolvent coefficients

`L4/resolvent-tail-bound` · lemma.

Let b_j≥0 bound the output-column norms of completely continuous u and satisfy b_j≤L. Fix R>0, 0<q<1 and finite T with Rb_j≤q off T. Put m=|T| and B=max(1,RL). Then ‖V_n‖_K Rⁿ≤B^m q^(max(n−m,0)) for every n≥0.

**Hypotheses.** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars. V is any sequence of native continuous A-linear endomorphisms with V₀=I and V_(n+1)=c_(n+1)(u)I+uV_n, where c_n(u) are the actual Fredholm coefficients. These are algebraic recurrence hypotheses; no analytic estimate or entireness is assumed.

**Inputs.** `LocallyAnalyticDistributions:L4/resolvent-coefficient-bound`, `mathlib:tendsto_pow_atTop_nhds_zero_of_lt_one`.

**Proof outline.** For any n-element subset S, split it into its intersection with T and its complement. At most m factors Rb_j are bounded by B; all others are bounded by q. Since B≥1 and 0<q<1, the product is at most B^m q^(max(n−m,0)). Apply resolvent-coefficient-bound with C=B^m q^(max(n−m,0))/Rⁿ, which is nonnegative; Rⁿ is strictly positive. Multiply through by Rⁿ. The constant B^m is independent of n. If b is cofinite-null, such T exists for every R and q, and the geometric right side tends to zero. The bound is also uniform for any family with the same b,L,T.

**Acceptance checks.** The exponent is truncated at zero for n≤m. There is no factorial factor, summation over input coordinates, or normed-field hypothesis on A itself.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026.. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Compression of the coefficient recurrence

`L4/resolvent-retraction-comparison` · lemma.

Let i:M→c_A(I) and r:c_A(I)→M be native continuous A-linear maps with ri=I. For u:M→M put U=iur. For any scalar sequence c_n, suppose V₀=I_M, W₀=I_c0, V_(n+1)=c_(n+1)I_M+uV_n and W_(n+1)=c_(n+1)I_c0+UW_n. Then rW_n i=V_n for every n.

**Hypotheses.** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars. M is a Banach A-module with compatible K-action. The stated continuous retraction is actual data; no claim that every finite module has such a retraction is made.

**Inputs.** `LocallyAnalyticDistributions:L4/projective-banach-modules`.

**Proof outline.** At n=0 this is exactly ri=I. Apply r on the left and i on the right to the next recurrence. Use A-linearity to move c_(n+1) through r and i; use ri=I in the product term, and then the induction hypothesis. This is purely algebraic and works for any scalar sequence.

**Acceptance checks.** The zero extension has identity on the whole ambient module at degree zero. It is the compression rW₀i that equals identity on M; do not replace W₀ by ir.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026.. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Entireness of the recurrence on a projective Banach module

`L4/resolvent-recurrence-entire` · theorem.

Let M have (Pr), u:M→M be completely continuous, and c_n be its actual summand Fredholm coefficients. For any V₀=I and V_(n+1)=c_(n+1)I+uV_n, and every R>0, ‖V_n‖_K Rⁿ tends to zero.

**Hypotheses.** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars. M is a complete Banach A-module with compatible bounded coefficient action as in the standing roadmap hypotheses; property (Pr) supplies actual continuous inclusion and retraction data.

**Inputs.** `LocallyAnalyticDistributions:L4/projective-banach-modules`, `LocallyAnalyticDistributions:L4/summand-fredholm-theory`, `LocallyAnalyticDistributions:L4/completely-continuous`, `LocallyAnalyticDistributions:L4/compact-matrix-criterion`, `LocallyAnalyticDistributions:L4/c0-operator-norm-criterion`, `LocallyAnalyticDistributions:L4/resolvent-tail-bound`, `LocallyAnalyticDistributions:L4/resolvent-retraction-comparison`, `mathlib:ContinuousLinearMap.opNorm_comp_le`, `mathlib:Submodule.FG.map`, `mathlib:tendsto_pow_atTop_nhds_zero_of_lt_one`.

**Proof outline.** Choose the actual retraction i:M→c_A(I), r:c_A(I)→M from property (Pr). Approximate u by finite-A-image maps g at error ε/(1+‖i‖‖r‖); the maps igr still have finite A-image, and the composition norm bound gives approximation of U=iur. Thus U is completely continuous directly from the imported definition. The summand-fredholm-theory comparison identifies its Fredholm coefficients with the given c_n. For U use its column-norm family b_j. It is bounded by ‖U‖ and cofinite-null by compact-matrix-criterion; normalized basis/evaluation bounds justify the column bound. Take q=1/2 and apply resolvent-tail-bound for every R to the recurrence W_n on c_A(I). The geometric estimate gives ‖W_n‖Rⁿ→0. Apply resolvent-retraction-comparison and the native composition norm bound twice: ‖V_n‖Rⁿ≤‖r‖‖i‖‖W_n‖Rⁿ. The fixed nonnegative factor preserves convergence to zero. Instantiate this theorem with the existing resolvent coefficient construction and its initial/successor equations. This proof does not use resolvent-series, its entireness API or any Hasse/Riesz theorem as a prerequisite.

**Acceptance checks.** No isometric retraction is assumed: the factors ‖r‖ and ‖i‖ remain in the transfer. This analytic coefficient estimate does not establish finite-projectivity, constant rank or determinant equality of a root summand.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026.. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions. [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), §2, pp.7–12 for coordinates; §3, full manuscript p.22 freshly reread on27 September2026 for the Fredholm resolvent over (Pr) modules.. The coordinate maps use the existing C0 carrier. The source invokes Serre Proposition10 for a Noetherian Banach algebra and a (Pr) module; the explicit finite-coordinate and retraction steps are decomposed here rather than assumed from the recurrence.

### Finite geometric factor for the root operator

`L4/riesz-geometric-factor` · lemma.

For every continuous A-linear u, a∈A and h≥0, the single finite sum B=a Σ_{0≤j<h}(1−au)^j satisfies uB=Bu=1−(1−au)^h.

**Hypotheses.** A is a commutative normed ring; M is a normed additive commutative group with an A-module structure and jointly continuous scalar multiplication. All maps are native continuous A-linear maps. Write v=1−a u, N=ker(v^h), B=a Σ_{0≤j<h}v^j, and i:N→M for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed.

**Inputs.** `mathlib:geom_sum_mul_neg`, `mathlib:mul_geom_sum`.

**Proof outline.** The finite geometric identities give (1−v)Σv^j=Σv^j(1−v)=1−v^h in the endomorphism ring. The right identity is the native geom_sum_mul_neg; the left follows from mul_geom_sum by changing the sign, or directly by induction. Use 1−v=au and centrality of the A-scalar action to move the scalar a across composition. Both factor identities hold without division by a.

**Acceptance checks.** For h=0 both products and 1−v^0 are zero. For a=1 and u=1+j with j²=0, h=2 gives B=1−j.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Proposition 3.2, complete proof on manuscript pp.23–24. The source makes the identity on N a polynomial in u with no constant term. This explicit geometric factor and its generality without a unit parameter are worker deductions of that step.

### Continuous inverse on the root kernel

`L4/riesz-kernel-operator-equiv` · construction.

Define rieszKernelOperatorEquiv(u,a,h) to be the native continuous A-linear automorphism of N whose forward map is the restriction of u and whose inverse is the restriction of B=a Σ_{j<h}(1−au)^j.

**Hypotheses.** A is a commutative normed ring; M is a normed additive commutative group with an A-module structure and jointly continuous scalar multiplication. All maps are native continuous A-linear maps. Write v=1−a u, N=ker(v^h), B=a Σ_{0≤j<h}v^j, and i:N→M for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/riesz-geometric-factor`, `mathlib:ContinuousLinearMap.restrict`, `mathlib:ContinuousLinearEquiv.equivOfInverse`, `mathlib:Commute.smul_right`.

**Proof outline.** The endomorphisms u and B commute with v and hence v^h; applying the commutation relation to a vector killed by v^h shows that both preserve N. Use the native ContinuousLinearMap.restrict for these two maps. On N, the two products from riesz-geometric-factor are identity because v^h vanishes. Apply ContinuousLinearEquiv.equivOfInverse to the actual continuous restrictions. The inverse uses a finite sum, so it has no convergence hypothesis.

**Uses.** Buzzard Proposition3.2, manuscript p.24: Identify the actual continuous inverse of u on the nilpotent root summand before considering its finite-projective determinant. riesz-compressed-approximation and finite-slope-summands: The underlying geometric factor gives the left inverse on the included root kernel; the native equivalence records that no inverse of the root parameter is needed.

**API.**

| Declaration | Contract |
|---|---|
| `rieszKernelOperatorEquiv_apply` | For x∈N the image under the equivalence, viewed in M, is u(x). |
| `rieszKernelOperatorEquiv_symm_apply` | For x∈N the inverse image, viewed in M, is B(x). |
| `rieszKernelOperatorEquiv_subtype` | Composing the equivalence with the native inclusion i equals u composed with i, as continuous A-linear maps N→M. |

**Unit tests.**

- `riesz_inverse_order_zero` (degenerate): At h=0 every x∈ker(v^0) is zero, and its image under the equivalence is zero.
- `riesz_inverse_zero_parameter` (degenerate): At a=0, for every h, every x∈N is zero and its inverse image is zero.
- `riesz_inverse_identity` (compatibility): For u=identity and a=1, both the equivalence and its inverse fix every element of N, for every h.
- `riesz_inverse_jordan` (computation): If j²=0, u=1+j, a=1 and h=2, the inverse on N acts by 1−j, including in characteristic two.

**Acceptance checks.** The construction does not replace N by a chosen finite free model and does not assume finite generation, a unit root parameter, a Fredholm series or complete continuity.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Proposition 3.2, complete proof on manuscript pp.23–24. The source uses invertibility on N on p.24. The finite geometric inverse is made explicit here and is valid before any rank or determinant argument.

### Property (Pr) under continuous retractions

`L4/pr-continuous-retract` · lemma.

If P has (Pr) and continuous A-linear maps i:M→P and r:P→M satisfy ri=identity, then M has (Pr). This is the existing hasPr_retract API promoted before consumption.

**Hypotheses.** A is a commutative normed ring; M is a normed additive commutative group with an A-module structure and jointly continuous scalar multiplication. All maps are native continuous A-linear maps. P is another normed A-module in the same universe as M; no finite-generation hypothesis is needed.

**Inputs.** `LocallyAnalyticDistributions:L4/projective-banach-modules`.

**Proof outline.** Choose the defining continuous split inclusion s:P→c_A(I) and retraction t:c_A(I)→P. The composite maps si and rt are continuous and their product is rtsi=ri=identity. Reuse the existing HasPr definition and existing hasPr_retract declaration; no second notion of a projective Banach module is introduced.

**Acceptance checks.** Taking i=r=identity retains the original property. No conclusion of algebraic projectivity is made without the finite-generation hypothesis.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Definition of (Pr), full manuscript pp.18–19, and use of Lemma2.11 on p.23. The source defines (Pr) by a continuous direct summand of a potentially ONable module. Transitivity of its split inclusion is the existing API proof, now given its own dependency node.

### Property (Pr) of the complemented root kernel

`L4/riesz-kernel-pr` · lemma.

If M has (Pr) and N=ker((1−au)^h) has a native topological complement F, then N has (Pr).

**Hypotheses.** A is a commutative normed ring; M is a normed additive commutative group with an A-module structure and jointly continuous scalar multiplication. All maps are native continuous A-linear maps. Write v=1−a u, N=ker(v^h), B=a Σ_{0≤j<h}v^j, and i:N→M for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed. F is an A-submodule with the native topological-complement relation between N and F. Let π:M→N be Submodule.projectionOntoL along F, and put l=πB.

**Inputs.** `LocallyAnalyticDistributions:L4/pr-continuous-retract`, `mathlib:Submodule.projectionOntoL`, `mathlib:Submodule.projectionOntoL_apply_left`.

**Proof outline.** Use the native inclusion i and projection π onto N along F. The library projectionOntoL_apply_left gives πi=identity on N. Apply pr-continuous-retract to this actual continuous retraction. In the Hasse Riesz setting riesz-topological-splitting supplies F=image(v^h) and the required topological complement.

**Acceptance checks.** This does not require u to be completely continuous. At h=0 the kernel is zero and the statement still applies.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Proposition 3.2, complete proof on manuscript pp.23–24. Expands the finite-generation and projectivity paragraph using the existing native closed root kernel and continuous splitting; no constant-rank or determinant conclusion is imported.

### Finite-image approximation of the root identity

`L4/riesz-compressed-approximation` · lemma.

For any α:M→M with finite A-image, define β=lαi:N→N using l=πB. Then β has finite A-image and ‖identity_N−β‖_K≤D‖u−α‖_K, where D=‖l‖_K‖i‖_K. The map α need not preserve N.

**Hypotheses.** K is a complete nontrivially normed field; A is a nonzero complete Noetherian normed K-algebra with norm one for 1. M is a complete normed K-space and an A-module with compatible scalar tower and continuous A-action. Norms of A-linear maps mean the native K-operator norms after restriction of scalars. Write v=1−a u, N=ker(v^h), B=a Σ_{0≤j<h}v^j, and i:N→M for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed. F is an A-submodule with the native topological-complement relation between N and F. Let π:M→N be Submodule.projectionOntoL along F, and put l=πB.

**Inputs.** `LocallyAnalyticDistributions:L4/riesz-geometric-factor`, `LocallyAnalyticDistributions:L4/finite-image-range-comparison`, `mathlib:Submodule.projectionOntoL`, `mathlib:Submodule.projectionOntoL_apply_left`, `mathlib:Submodule.FG.map`, `mathlib:ContinuousLinearMap.opNorm_comp_le`.

**Proof outline.** The geometric factor gives Bui=i, because v^h i=0. Apply πi=identity to obtain lui=identity_N. This is a kernel-specific adapter, not a new generic complete-continuity composition theorem. If range(α) lies in a finitely generated A-submodule Q of M, range(β) lies in l(Q). The native Submodule.FG.map makes l(Q) finitely generated. Thus α is composed with πB rather than restricted to a submodule it may not preserve. Subtract composites to obtain identity_N−β=l(u−α)i. Restrict scalars to K and apply ContinuousLinearMap.opNorm_comp_le twice. Retain both norm factors; the projection need not be contractive.

**Acceptance checks.** On K² with u=diag(1,0), a=1, h=1 and the coordinate complement, an approximant sending e₁ to e₁+εe₂ does not preserve N. Its compression β nevertheless equals identity_N. The finite-image condition is over A, not finite K-rank. D may be zero on the zero module; the following tolerance choice includes that case.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Proposition 3.2, complete proof on manuscript pp.23–24. Expands the finite-generation and projectivity paragraph using the existing native closed root kernel and continuous splitting; no constant-rank or determinant conclusion is imported.

### Complete continuity of the root identity

`L4/riesz-kernel-compact-identity` · lemma.

If u is completely continuous and N=ker((1−au)^h) has a native topological complement F, then identity_N is completely continuous in the imported ordinary complete-continuity sense.

**Hypotheses.** K is a complete nontrivially normed field; A is a nonzero complete Noetherian normed K-algebra with norm one for 1. M is a complete normed K-space and an A-module with compatible scalar tower and continuous A-action. Norms of A-linear maps mean the native K-operator norms after restriction of scalars. Write v=1−a u, N=ker(v^h), B=a Σ_{0≤j<h}v^j, and i:N→M for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed. F is an A-submodule with the native topological-complement relation between N and F. Let π:M→N be Submodule.projectionOntoL along F, and put l=πB.

**Inputs.** `LocallyAnalyticDistributions:L4/riesz-compressed-approximation`, `LocallyAnalyticDistributions:L4/completely-continuous-norm-approximation`, `mathlib:ContinuousLinearMap.completeSpace_ker`.

**Proof outline.** Fix ε>0 and put D=‖πB‖_K‖i‖_K≥0. The existing norm-approximation comparison supplies finite-A-image α with ‖u−α‖_K<ε/(D+1). Compress α by riesz-compressed-approximation. Its error is at most D‖u−α‖_K, which is strictly less than ε: bound it by (D+1)‖u−α‖_K and multiply the strict approximation inequality by the positive D+1. This proof also handles D=0. Apply completely-continuous-norm-approximation to identity_N. N is complete by the native completeSpace_ker instance. The predicate and its generality remain owned by AdicSpacesPartII:R3; this result is only its Riesz-kernel application.

**Acceptance checks.** No countable approximating sequence or invariant approximant is assumed. The h=0 and a=0 kernels are zero.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Proposition 3.2, complete proof on manuscript pp.23–24. Expands the finite-generation and projectivity paragraph using the existing native closed root kernel and continuous splitting; no constant-rank or determinant conclusion is imported.

### Finite generation of the root kernel

`L4/riesz-kernel-finite` · theorem.

If u is completely continuous and N=ker((1−au)^h) has a native topological complement F, then N is a finite A-module.

**Hypotheses.** K is a complete nontrivially normed field; A is a nonzero complete Noetherian normed K-algebra with norm one for 1. M is a complete normed K-space and an A-module with compatible scalar tower and continuous A-action. Norms of A-linear maps mean the native K-operator norms after restriction of scalars. Write v=1−a u, N=ker(v^h), B=a Σ_{0≤j<h}v^j, and i:N→M for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed. F is an A-submodule with the native topological-complement relation between N and F. Let π:M→N be Submodule.projectionOntoL along F, and put l=πB.

**Inputs.** `LocallyAnalyticDistributions:L4/riesz-kernel-compact-identity`, `LocallyAnalyticDistributions:L4/compact-identity-finite`, `mathlib:ContinuousLinearMap.completeSpace_ker`.

**Proof outline.** Use riesz-kernel-compact-identity and the native completeness of the closed kernel. Apply the already planned compact-identity-finite equivalence. This invokes the existing Neumann approximation proof once; do not re-plan it or substitute a real/complex compact-operator theorem. Neither (Pr) nor finite K-dimension is required for this conclusion.

**Acceptance checks.** The conclusion is Module.Finite over the coefficient ring A; for infinite-dimensional A over K, this does not imply finite-dimensionality over K.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Proposition 3.2, complete proof on manuscript pp.23–24. Expands the finite-generation and projectivity paragraph using the existing native closed root kernel and continuous splitting; no constant-rank or determinant conclusion is imported.

### Projectivity of the finite root kernel

`L4/riesz-kernel-projective` · theorem.

If M has (Pr), u is completely continuous and N=ker((1−au)^h) has a native topological complement F, then N is an algebraically projective A-module; together with riesz-kernel-finite it is finite projective.

**Hypotheses.** K is a complete nontrivially normed field; A is a nonzero complete Noetherian normed K-algebra with norm one for 1. M is a complete normed K-space and an A-module with compatible scalar tower and continuous A-action. Norms of A-linear maps mean the native K-operator norms after restriction of scalars. Write v=1−a u, N=ker(v^h), B=a Σ_{0≤j<h}v^j, and i:N→M for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed. F is an A-submodule with the native topological-complement relation between N and F. Let π:M→N be Submodule.projectionOntoL along F, and put l=πB.

**Inputs.** `LocallyAnalyticDistributions:L4/riesz-kernel-pr`, `LocallyAnalyticDistributions:L4/riesz-kernel-finite`, `LocallyAnalyticDistributions:L4/finite-pr-projective`, `mathlib:ContinuousLinearMap.completeSpace_ker`, `mathlib:Module.Projective`.

**Proof outline.** Apply riesz-kernel-pr and riesz-kernel-finite to N with the given continuous projection. The native closed-kernel instance supplies its completeness. Invoke the existing finite-pr-projective theorem, whose proof lifts identity through a continuous finite-free surjection and forgets topology. Its finite-module-topology dependency remains an explicit gap; this checkpoint does not establish that supplier. In riesz-root-projectors specialize F to image(v^h) using riesz-topological-splitting. The root order and Hasse conditions are needed to construct that complement, not in the present finite-projectivity adapter.

**Acceptance checks.** For A=K×K, u=identity and a=(1,0), h=1 gives N=(1,0)A, a finite projective module with varying component rank. The parameter a is not a unit; no freeness or constant rank follows from this theorem. The constant-rank h and exact determinant assertions of the full Fredholm-root theorem require its remaining nonreduced determinant argument.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Lemma2.11, manuscript p.19, and Proposition3.2 proof, pp.23–24. Separates the finite-generation and (Pr) inputs from the remaining rank/determinant proof. The native algebraic projectivity carrier is reused.

### Ultrametric perturbation of a finite product

`L4/ultrametric-product-perturbation` · lemma.

Let S be a finite set, f,g:S→A, C≥1 and δ≥0. If norm(f_i),norm(g_i)≤C and norm(f_i−g_i)≤δ for every i, then norm(product f_i−product g_i)≤δ C^max(card S−1,0).

**Hypotheses.** A is any normed commutative ring with norm(1)=1 and an ultrametric norm; completeness, a coefficient field and Noetherianity are unnecessary.

**Inputs.** `mathlib:Finset.norm_prod_le`, `mathlib:IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm`.

**Proof outline.** Induct on S. The empty product difference is zero; handle the singleton before the positive-cardinality induction step. For an inserted index a, expand the difference as (f_a−g_a) product f + g_a(product f−product g). The native finite-product norm inequality bounds the first product by C^card S; the induction hypothesis bounds the difference in the second. Apply the ultrametric two-term bound. Each term is at most δ C^card S, so no factor card S appears.

**Unit tests.**

- `product_empty_difference` (degenerate): For empty S, the difference of the two empty products has norm zero, hence is at most every δ≥0.

**Acceptance checks.** For one factor this is precisely the assumed difference bound. For no factors it is 0≤δ. The two terms must be combined with a maximum, not an ordinary sum.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Proposition 8 proof, printed p. 77 (PDF p. 10). Extracts the product-difference step and gives its explicit uniform C-bound over a normed ring; it uses only the displayed telescoping identity, submultiplicativity and ultrametricity.

### Determinant bound by distinct output columns

`L4/ultrametric-determinant-bound` · lemma.

For a square matrix D indexed by a finite type J, let b_j≥0 satisfy norm(D_ij)≤b_j for all i,j. Then norm(det D)≤product_{j in J} b_j, including J empty.

**Hypotheses.** A is a normed commutative ring with norm(1)=1 and an ultrametric norm. No multiplicativity of the norm, reducedness, field hypothesis or completeness is required.

**Inputs.** `mathlib:Matrix.det_apply`, `mathlib:Finset.norm_prod_le`, `mathlib:norm_units_zsmul`, `mathlib:IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm`, `mathlib:IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg`.

**Proof outline.** Expand the native determinant as the permutation sum of signs times products D_(σ(j),j). Each product uses each output column exactly once. Use the native product norm bound termwise and norm preservation under integer-unit signs. The common bound is nonnegative. Apply the generated additive ultrametric finite-sum bound. For an empty matrix the unique empty permutation contributes one and the product bound is one.

**Unit tests.**

- `singleton_determinant_bound` (computation): The determinant of the one-by-one matrix (a) is a, so its norm is at most any bound on norm(a).
- `determinant_empty_bound` (degenerate): The determinant of the identity matrix on an empty finite type has norm one.

**Acceptance checks.** A diagonal matrix can attain the bound. A zero column gives zero. Nilpotent nonreduced coefficients remain in the determinant; no residue-field reduction is used.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Proposition 7(a,b), printed pp. 75–76 (PDF pp. 8–9). Spells out the distinct-column estimate over the coefficient-ring generality used by Buzzard; the source proves the field case.

### Uniform finite determinant perturbation

`L4/ultrametric-determinant-perturbation` · lemma.

Let D,E be square matrices on a finite type J, C≥1 and δ≥0. If every entry of D and E has norm at most C and every corresponding difference has norm at most δ, then norm(det D−det E)≤δ C^max(card J−1,0).

**Hypotheses.** A is a normed commutative ring with norm(1)=1 and an ultrametric norm. The empty-index case is allowed.

**Inputs.** `LocallyAnalyticDistributions:L4/ultrametric-product-perturbation`, `mathlib:Matrix.det_apply`, `mathlib:norm_units_zsmul`, `mathlib:IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm`, `mathlib:IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg`.

**Proof outline.** Subtract the two native permutation expansions using the same permutations and signs. Apply ultrametric-product-perturbation to each permutation product. Integer-unit signs preserve norms. The native ultrametric finite-sum inequality preserves the same bound. For an empty type both determinants are one and their difference is zero.

**Acceptance checks.** For degree one the estimate has constant one. The general estimate contains neither card J nor its factorial.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Proposition 8 proof, printed p. 77 (PDF p. 10). Isolates the finite determinant estimate needed before taking the summable principal-minor difference.

### Cofinite decay of fixed-degree principal minors

`L4/fixed-degree-minors-null` · lemma.

Let I be any index type and a:I×I→A. Suppose norm(a_ij)≤b_j, where b_j≥0 is bounded and tends to zero along the cofinite filter on I. For every n≥0 the family det(a_ij) indexed by the finite subsets S of I with card S=n tends to zero along the cofinite filter on that family of subsets.

**Hypotheses.** A is a normed commutative ring with norm(1)=1 and an ultrametric norm. I need not be countable. Completeness is needed only when the ensuing construction invokes unconditional summability.

**Inputs.** `LocallyAnalyticDistributions:L4/ultrametric-determinant-bound`, `mathlib:Finset.mem_powersetCard`.

**Proof outline.** For n=0 the index type has the single element empty; its cofinite filter is bottom, so convergence imposes no vanishing condition on that one determinant. For n>0 choose C≥1 bounding every b_j. Given ε>0, the cofinite decay provides a finite T outside which b_j<ε/C^(n−1). Except for the finite family T.powersetCard n, each S contains some j outside T. The determinant column bound gives norm(det a_S)≤b_j C^(n−1)<ε, using the other n−1 columns and their uniform C-bound. Translate this finite-exception estimate into cofinite convergence. When A is complete, the native additive nonarchimedean summability criterion supplies the unconditional sum, with no chosen enumeration.

**Acceptance checks.** The constant coefficient comes from the sole empty minor equal to one; it is not forced to vanish. A single nonzero column can occur at an arbitrary index and must not require a countable enumeration.

**Sources.** [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Definition following Proposition 2.4, manuscript p. 12. Decomposes the asserted convergence of the principal-minor sum, retaining the arbitrary index set and explicitly separating the degree-zero boundary.

### Finite exceptional-set product estimate

`L4/distinct-column-product-tail` · lemma.

Let S,T be finite subsets of an arbitrary set I. Let b:I→R satisfy 0≤b_j≤B with B≥1, and suppose b_j≤q outside T where 0≤q≤1. Then product_{j in S} b_j≤B^card(T) q^max(card(S)−card(T),0).

**Hypotheses.** The coefficient family in this lemma is real and nonnegative. It need not tend to zero; this is a finite product statement, valid also at q=0 and q=1.

**Inputs.** `mathlib:Finset.card_sdiff_add_card_inter`.

**Proof outline.** Split S into S intersect T and S minus T. Bound the product on the intersection by B^r and the remaining product by q^s. The native cardinality identity gives r+s=card S and r≤card T, hence s≥max(card S−card T,0). Since B≥1, increase r to card T; since q lies in [0,1], decrease s to max(card S−card T,0). Retain the empty-product convention, including 0^0=1.

**Acceptance checks.** For T empty the bound is q^card S. If q=0 and card S>card T, a zero factor forces the product to vanish. Repeated column indices would invalidate the argument.

**Sources.** [Endomorphismes complètement continus des espaces de Banach p-adiques](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), Proposition 7(b), printed p. 76 (PDF p. 9). A finite-exception form of the distinct-column product bound; this avoids selecting a decreasing enumeration and works for arbitrary index types.

### Summability of every evaluated coefficient tail

`L4/entire-tail-summable` · lemma.

If F=sum c_n T^n is entire and a is any element of A, then for every m>=0 the series sum_(k>=0) c_(m+k) a^k is summable. The case m=0 is evaluation at a.

**Hypotheses.** A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:Filter.Tendsto.bddAbove_range`, `mathlib:norm_pow_le`, `mathlib:summable_geometric_of_lt_one`, `mathlib:Summable.of_norm_bounded_eventually_nat`.

**Proof outline.** Choose S>max(1,norm(a)). Entireness at S makes norm(c_j)S^j converge to zero; the native bounded-range theorem supplies M>=0 bounding every term. Submultiplicativity and norm_pow_le bound norm(c_(m+k)a^k) by (M/S^m)(norm(a)/S)^k. The ratio lies in [0,1). Use the native summable geometric series, scalar multiplication and norm-dominated summability in the complete normed additive group. This argument does not require the ultrametric inequality.

**Acceptance checks.** At a=0 only k=0 survives. For m=0 this supplies the actual convergence needed to split entire_eval, not merely a total tsum value.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Tail quotient for division by a linear factor

`L4/entire-linear-quotient` · construction.

For a in A and a native formal series F=sum c_n T^n, define Q_a(F) by coefficient q_n=sum_(k>=0) c_(n+1+k)a^k, using the total native infinite sum. Its analytic quotient interpretation and additive/scalar laws below are asserted for entire F, where every tail converges. No new carrier for entire series is introduced.

**Hypotheses.** A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-series`, `LocallyAnalyticDistributions:L4/entire-tail-summable`, `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.coeff_mk`.

**Proof outline.** Apply native PowerSeries.mk to the displayed total coefficient function. The preceding tail-summability node justifies its convergent interpretation on the existing entire-series subring. Derive zero, constants and the zero-parameter shift coefficientwise. For entire inputs, summability permits additivity and multiplication by a scalar. The promoted coefficient, recurrence, norm, entireness and polynomial comparison nodes expose the interface used by later declarations.

**Uses.** Coleman A3, proof of Lemma A3.5 and the quotient-algebra interpretation on printed434: Provide the linear-factor analytic quotient and its polynomial remainder. L4/entire-linear-root-factor and existing entireResultant_linear API: Identify the entire ideal generated by T-a and the remainder F(a), without assuming evaluation on an arbitrary formal series converges.

**API.**

| Declaration | Contract |
|---|---|
| `entireLinearQuotient_coeff` | The coefficient q_n is the convergent tail sum_(k>=0)c_(n+1+k)a^k for entire F; the total coefficient equality holds for every F. Promoted to its own node. |
| `entireLinearQuotient_zero` | Q_a(0)=0. |
| `entireLinearQuotient_add` | For entire F,G, Q_a(F+G)=Q_a(F)+Q_a(G). |
| `entireLinearQuotient_C_mul` | For entire F and any b in A, Q_a(bF)=b Q_a(F). |
| `entireLinearQuotient_C` | Q_a(b)=0 for any constant b. |
| `entireLinearQuotient_at_zero` | Q_0(F) is the native shifted series with coefficient c_(n+1), for every formal F. |
| `entireLinearQuotient_entire` | If F is entire and A is ultrametric, Q_a(F) is entire. Promoted to its own node. |
| `entireLinearQuotient_polynomial` | For a polynomial P, Q_a(P) is the native monic polynomial quotient P divided by T-a, included in the native power-series ring. Promoted to its own comparison node. |

**Unit tests.**

- `linear_quotient_constant` (degenerate): For any a,b in A, Q_a(b)=0.
- `linear_quotient_quadratic` (computation): For any a in A, Q_a(T^2)=T+a.
- `linear_quotient_zero_shift` (compatibility): For every formal F, Q_0(F)=PowerSeries.mk of the shifted coefficients c_(n+1).
- `linear_quotient_native_polynomial` (compatibility): For ultrametric A, any a and polynomial P, Q_a(P)=the native polynomial quotient P divByMonic (T-a) included in A[[T]].
- `linear_quotient_zero_divisor` (computation): For e in A with e^2=0, Q_e(eT^2)=eT. Nonzero nilpotents need not be discarded.

**Acceptance checks.** Q_a(T^2)=T+a; replacing n+1+k by n+k or changing a to -a fails this test. Neither a topologically nilpotent parameter nor a domain hypothesis is introduced.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Coefficient formula for the tail quotient

`L4/entire-linear-quotient-coeff` · lemma.

For every formal F, a and n, coeff_n(Q_a(F))=sum_(k>=0)c_(n+1+k)a^k as an equality of total native sums; for entire F the sum converges.

**Hypotheses.** A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-linear-quotient`, `mathlib:PowerSeries.coeff_mk`.

**Proof outline.** Unfold only the constructor and apply the native coefficient-of-mk equation. Summability on entire inputs is provided by the construction prerequisite.

**Acceptance checks.** The first quotient coefficient starts at c_1, not c_0.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Recurrence for linear-quotient coefficients

`L4/entire-linear-quotient-recurrence` · lemma.

For entire F, q_n=c_(n+1)+a q_(n+1) for every n>=0.

**Hypotheses.** A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-linear-quotient-coeff`, `LocallyAnalyticDistributions:L4/entire-tail-summable`, `mathlib:Multipliable.tprod_eq_zero_mul`, `mathlib:Summable.tsum_mul_left`.

**Proof outline.** Use the generated additive Summable.tsum_eq_zero_add from the indexed native multiplicative declaration to split k=0 from the convergent tail. Reindex the remaining k+1 terms, use a^(k+1)=a a^k and commute the scalar a with the sum.

**Acceptance checks.** For F=T^2 the recurrence gives q_1=1 and q_0=a, fixing both sign and indexing.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Ultrametric bound for each quotient coefficient

`L4/entire-linear-quotient-bound` · lemma.

Suppose A is ultrametric, S>0, norm(a)<=S and M>=0 satisfies norm(c_m) S^m<=M for all m. Then norm(coeff_n(Q_a(F)))<=M/S^(n+1) for every n. This bound is valid for the total construction even without an entireness assumption; it does not by itself assert tail convergence.

**Hypotheses.** A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-linear-quotient-coeff`, `mathlib:norm_pow_le`, `mathlib:IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm`, `mathlib:IsUltrametricDist.norm_tprod_le_of_forall_le_of_nonneg`.

**Proof outline.** Multiply the norm of the kth summand by S^(n+1). Submultiplicativity and norm(a)^k<=S^k give norm(c_(n+1+k))S^(n+1+k)<=M. Divide by the positive S^(n+1). Install the native ultrametric instance and apply the generated additive norm_tsum_le_of_forall_le_of_nonneg. Its total-sum convention makes the bound valid even for a nonsummable input; analytic use separately invokes entire-tail-summable.

**Acceptance checks.** At n=0 the loss is M/S, not M. The boundary norm(a)=S is allowed in the bound.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Entireness of the linear quotient

`L4/entire-linear-quotient-entire` · lemma.

Over ultrametric A, for every a and entire F the quotient Q_a(F) is entire.

**Hypotheses.** A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-linear-quotient-bound`, `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:Filter.Tendsto.bddAbove_range`, `mathlib:tendsto_pow_atTop_nhds_zero_of_lt_one`.

**Proof outline.** Fix R>0 and choose S>max(R,norm(a),1). Boundedness of the coefficient sequence at S supplies M>=0. The quotient bound gives norm(q_n)R^n <= (M/S)(R/S)^n. Since 0<R/S<1, the native geometric limit and squeezing give convergence to zero. Repeat for every positive R.

**Acceptance checks.** There is no restriction norm(a)<1. A larger radius than the tested radius is essential; boundedness at R alone is insufficient.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Division identity with evaluation as remainder

`L4/entire-linear-division` · theorem.

For entire F and arbitrary a, F=(T-a)Q_a(F)+F(a) in native A[[T]], where F(a)=sum_(n>=0)c_n a^n and the remainder is a constant series.

**Hypotheses.** A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-linear-quotient-recurrence`, `LocallyAnalyticDistributions:L4/entire-tail-summable`, `mathlib:PowerSeries.ext`, `mathlib:PowerSeries.coeff_succ_X_mul`, `mathlib:PowerSeries.coeff_C_mul`, `mathlib:Multipliable.tprod_eq_zero_mul`, `mathlib:Summable.tsum_mul_left`.

**Proof outline.** For coefficient n+1 the displayed identity is exactly q_n-a q_(n+1)=c_(n+1), the preceding recurrence. For coefficient zero, split the convergent evaluation sum to obtain F(a)=c_0+a q_0. The scalar term then cancels -a q_0. Apply native coefficient extensionality. The identity itself uses normed-ring summability; the separate entireness node supplies the analytic quotient over an ultrametric ring.

**Acceptance checks.** At a=0 this is the existing native shift identity F=T shift(F)+c_0. A formal substitution with nonzero constant is never applied to a general series.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### An entire linear product cannot be a nonzero constant

`L4/entire-linear-product-constant` · lemma.

If H is entire and (T-a)H=b is a constant series, then H=0 and b=0. This holds over a complete commutative normed ring without a domain assumption.

**Hypotheses.** A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:PowerSeries.coeff_succ_X_mul`, `mathlib:PowerSeries.coeff_C_mul`, `mathlib:PowerSeries.ext`, `mathlib:norm_pow_le`, `mathlib:le_of_tendsto`.

**Proof outline.** Positive-degree coefficients give h_n=a h_(n+1), hence induction gives h_n=a^k h_(n+k) for every k. Choose R>=max(1,norm(a)). For fixed n, norm(h_n)<=R^(-n) norm(h_(n+k))R^(n+k), whose right side tends to zero by entireness at R and a shifted natural-index limit. The native closed-order limit lemma forces norm(h_n)=0. All coefficients vanish; coefficient zero in the product identity now gives b=0. This is the linear-factor corrected entire case of the issue in Coleman A3.1; no claim is made for all restricted series.

**Unit tests.**

- `linear_entire_uniqueness_boundary` (non-example): For any a in A, the native formal geometric series H=sum a^n T^n satisfies (1-aT)H=1. At a=p in Q_p it is restricted but not entire, disproving the unrestricted replacement in Coleman A3.1.

**Acceptance checks.** For A=Q_p, H=sum p^n T^n is restricted and (1-pT)H=1. It is not entire: at radius p its weighted coefficients are all one. Thus restricted convergence cannot replace entireness.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality. [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Lemma A3.1, printed432/PDF16; corrected linear entire case, finding LocallyAnalyticDistributions/E1. Mathematical transcription of the displayed notation in the scanned page. The stated restricted-series assertion is false; the node assumes entire H and proves its own linear case.

### Uniqueness of the entire quotient and constant remainder

`L4/entire-linear-division-unique` · theorem.

If F=(T-a)G+b=(T-a)H+c with entire G,H and b,c in A, then G=H and b=c.

**Hypotheses.** A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-linear-product-constant`, `LocallyAnalyticDistributions:L4/entire-series`.

**Proof outline.** Subtract the two identities. The existing entire-series subring is closed under subtraction, so G-H is entire. Apply the preceding product-constant lemma to (T-a)(G-H)=c-b; conclude both differences vanish.

**Acceptance checks.** The statement permits zero divisors and arbitrary a. It never cancels T-a inside all formal series.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Native polynomials are entire

`L4/polynomial-series-entire` · lemma.

The existing polynomialSeries inclusion sends every polynomial P in A[T] to an entire series. This promotes the existing polynomials_are_entire test to a named prerequisite.

**Hypotheses.** A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:Polynomial.coeff_coe`.

**Proof outline.** Identify the existing eval-based polynomialSeries map with the native polynomial-to-power-series inclusion by polynomial induction. Its nth coefficient is P.coeff n by the baseline coefficient comparison. Above the finite polynomial degree all coefficients are zero, so at each positive radius the weighted coefficient sequence is eventually zero.

**Acceptance checks.** Constants and the zero polynomial are included. No analytic convergence estimate is required.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Agreement with native monic polynomial division

`L4/entire-linear-quotient-polynomial` · comparison.

For ultrametric A, arbitrary a and polynomial P, Q_a(polynomialSeries(P)) equals polynomialSeries(P divByMonic (T-a)).

**Hypotheses.** A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

**Inputs.** `LocallyAnalyticDistributions:L4/polynomial-series-entire`, `LocallyAnalyticDistributions:L4/entire-linear-quotient-entire`, `LocallyAnalyticDistributions:L4/entire-linear-division`, `LocallyAnalyticDistributions:L4/entire-linear-division-unique`, `mathlib:Polynomial.divByMonic`, `mathlib:Polynomial.modByMonic_add_div`, `mathlib:Polynomial.modByMonic_X_sub_C_eq_C_eval`.

**Proof outline.** The native monic-division identity writes P=(T-a)(P divByMonic (T-a))+P(a). Map it into native power series; both polynomial terms are entire by the preceding lemma. The entire division identity gives a second decomposition, with an entire tail quotient. Uniqueness equates the quotients and also the remainders. No separate evaluation comparison for a polynomial is needed to apply uniqueness with these two constants.

**Acceptance checks.** For P=T^2, native division gives T+a; for P constant it gives zero. The polynomial operation is imported rather than recreated.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Roots and linear factors in the entire-series ring

`L4/entire-linear-root-factor` · theorem.

For ultrametric A, arbitrary a and entire F, F(a)=0 if and only if there exists an entire G with F=(T-a)G.

**Hypotheses.** A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-linear-division`, `LocallyAnalyticDistributions:L4/entire-linear-quotient-entire`, `LocallyAnalyticDistributions:L4/entire-linear-division-unique`.

**Proof outline.** If F(a)=0, take G=Q_a(F); entireness and the division identity supply the factorization. Conversely compare the asserted decomposition with constant remainder zero to the constructed entire decomposition with constant remainder F(a). Uniqueness forces F(a)=0.

**Acceptance checks.** The factor must be entire; a merely formal factor can exist when evaluation is nonzero. Over Q_p, T-p^(-1) is a unit in Q_p[[T]], but it does not divide 1 in Q_p{{T}}.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Exponential bound for the reciprocal reversal

`L4/monic-reciprocal-bound` · lemma.

For every k≥0, norm(b_k)≤C^k.

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed. C is a real number with C≥1 and norm(coeff_i(Q.reverse))≤C^i for every i. Such a C exists because the reversal is a polynomial with constant coefficient1: choose C≥1 bounding its finitely many nonconstant coefficient norms.

**Inputs.** `mathlib:Polynomial.reverse`, `mathlib:Polynomial.coeff_zero_reverse`, `mathlib:PowerSeries.invOfUnit`, `mathlib:PowerSeries.coeff_invOfUnit`, `mathlib:IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg`.

**Proof outline.** Use the existing invOfUnit with the unit1; its constant coefficient is1. For k>0, native coeff_invOfUnit writes b_k as minus the finite sum of coeff_i(Q.reverse)b_j over i+j=k,j<k. Strong induction bounds each term by C^i C^j=C^k. Apply the native ultrametric finite-sum bound; no factor equal to the number of summands appears.

**Acceptance checks.** The bound concerns the formal reciprocal of Q.reverse, not a formal inverse of Q. Q may have zero constant coefficient.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full.. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### Convergence of reciprocal-weighted entire tails

`L4/monic-reciprocal-tail-summable` · lemma.

For every entire F and every m≥0, the series Σ_(k≥0) coeff_(m+k)(F)b_k is summable.

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/monic-reciprocal-bound`, `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:Filter.Tendsto.bddAbove_range`, `mathlib:summable_geometric_of_lt_one`, `mathlib:Summable.of_norm_bounded_eventually_nat`.

**Proof outline.** Choose a coefficient bound C as in monic-reciprocal-bound and a real radius S>C. Entireness at S gives M≥0 bounding norm(coeff_j(F))S^j for every j. The kth summand has norm at most (M/S^m)(C/S)^k by the reciprocal coefficient bound and submultiplicativity. The ratio lies in [0,1). Apply native geometric summability and norm-dominated summability in the complete normed additive group. This supplies every shifted tail used in the recurrence, including m=0.

**Acceptance checks.** No root of Q or inverse of its constant coefficient is chosen.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full.. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### Reciprocal-tail quotient by a monic polynomial

`L4/entire-monic-quotient` · construction.

For native formal F, define S_Q(F) by coefficient s_n=Σ_(k≥0) coeff_(n+d+k)(F)b_k using the total native infinite sum. Analytic interpretation and linear laws are asserted for entire inputs.

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/monic-reciprocal-tail-summable`, `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.coeff_mk`, `mathlib:PowerSeries.invOfUnit`, `mathlib:Polynomial.reverse`.

**Proof outline.** Use native PowerSeries.mk on the displayed coefficient function. The definition accepts any Q; all analytic assertions here require Q monic. The preceding summability theorem justifies it for entire F. Zero follows coefficientwise. On entire inputs, native summability allows addition and multiplication by a scalar through each sum. Subsequent nodes promote coefficient evaluation, bounds, entireness, division and comparisons.

**Uses.** L4/entire-division and entire-resultants: Provides the actual entire quotient by the monic polynomial used to represent classes in the finite polynomial quotient. Coleman LemmaA3.5 and the norm interpretation immediately before it: Supplies the justified analytic division and native polynomial remainder needed for the resultant comparison. Existing linear-division nodes: Specializes compatibly to the existing tail quotient for T-a; does not introduce a second entire-series carrier.

**API.**

| Declaration | Contract |
|---|---|
| `entireMonicQuotient_zero` | S_Q(0)=0. |
| `entireMonicQuotient_add` | For entire F,G and monic Q, S_Q(F+G)=S_Q(F)+S_Q(G). |
| `entireMonicQuotient_C_mul` | For entire F and monic Q, S_Q(cF)=cS_Q(F) for every c∈A. |

**Unit tests.**

- `monic_quotient_one` (degenerate): For every formal F, S_1(F)=F.
- `monic_quotient_power_shift` (compatibility): For d≥0 and every formal F, S_(T^d)(F) is the native series with nth coefficient coeff_(n+d)(F).
- `monic_quotient_quadratic` (computation): For Q=T^2+aT+b and F=T^3, S_Q(F)=T-a.
- `monic_quotient_nilpotent` (computation): If e^2=0, then S_(T^2-e)(T^4)=T^2+e and the remainder is zero, including nonzero nilpotent e.

**Acceptance checks.** The shift is n+d+k and the coefficients come from the inverse of the reversal. Inverting Q itself would fail for zero constant coefficient and would not compute this analytic quotient.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full.. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### Coefficients of the monic tail quotient

`L4/entire-monic-quotient-coeff` · lemma.

For every formal F, coeff_n(S_Q(F))=Σ_(k≥0)coeff_(n+d+k)(F)b_k. For entire F and monic Q this sum converges.

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-monic-quotient`, `mathlib:PowerSeries.coeff_mk`.

**Proof outline.** Apply the native coefficient-of-mk formula. Convergence on the asserted analytic domain comes from the construction prerequisite.

**Acceptance checks.** The equality of total sums alone is not a summability statement outside the analytic domain.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full.. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### Weighted bound for the monic quotient

`L4/entire-monic-quotient-bound` · lemma.

If S≥C, M≥0 and norm(coeff_j(F))S^j≤M for every j, then norm(coeff_n(S_Q(F)))≤M/S^(n+d).

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed. C is a real number with C≥1 and norm(coeff_i(Q.reverse))≤C^i for every i. Such a C exists because the reversal is a polynomial with constant coefficient1: choose C≥1 bounding its finitely many nonconstant coefficient norms.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-monic-quotient-coeff`, `LocallyAnalyticDistributions:L4/monic-reciprocal-bound`, `mathlib:IsUltrametricDist.norm_tprod_le_of_forall_le_of_nonneg`.

**Proof outline.** S≥C≥1 makes S positive. Each kth summand is bounded by M C^k/S^(n+d+k)≤M/S^(n+d). Apply the native ultrametric infinite-sum bound. Its total-sum convention permits this inequality even when F is not entire; convergence is invoked separately when using the division identity.

**Acceptance checks.** The loss is exactly d powers of S. The boundary S=C is permitted in the inequality, but the separate summability proof chooses S>C.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full.. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### Entireness of the monic quotient

`L4/entire-monic-quotient-entire` · lemma.

If F is entire and Q monic, then S_Q(F) is entire.

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-monic-quotient-bound`, `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:Filter.Tendsto.bddAbove_range`, `mathlib:tendsto_pow_atTop_nhds_zero_of_lt_one`.

**Proof outline.** Choose C controlling the reciprocal as above. For an arbitrary tested radius R>0 choose S>max(R,C). Entireness of F at S supplies M. The coefficient estimate gives norm(s_n)R^n≤(M/S^d)(R/S)^n. Native geometric convergence and squeezing show the left side tends to zero. This holds at every R>0, which is the existing entire predicate. No single-radius completion replaces it.

**Acceptance checks.** Arbitrarily large coefficient norms of Q are allowed by increasing S.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full.. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### The monic quotient coefficient recurrence

`L4/entire-monic-quotient-recurrence` · lemma.

For entire F and every n≥0, coeff_(n+d)(F)=s_n+Σ_(i<d)coeff_i(Q)s_(n+d-i).

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-monic-quotient-coeff`, `LocallyAnalyticDistributions:L4/monic-reciprocal-tail-summable`, `mathlib:PowerSeries.mul_invOfUnit`, `mathlib:PowerSeries.coeff_mul`, `mathlib:Polynomial.coeff_reverse`, `mathlib:Polynomial.coeff_zero_reverse`, `mathlib:Polynomial.reverse_natDegree_le`, `mathlib:Multipliable.tprod_finsetProd`, `mathlib:Summable.tsum_mul_left`.

**Proof outline.** Monicity identifies the constant coefficient of Q.reverse with1, so native mul_invOfUnit gives Q.reverse times B_Q=1. Comparing coefficient ell gives b_ell+Σ_(1≤j≤min(d,ell))coeff_(d-j)(Q)b_(ell-j)=1 for ell=0 and0 otherwise. Expand the asserted right side using the convergent tail formulas. Set j=d-i in the finite lower-degree sum and ell=j+k in each shifted tail. Every shifted series is summable by monic-reciprocal-tail-summable. Native finite-sum interchange and scalar multiplication justify gathering the coefficient of coeff_(n+d+ell)(F). It is the displayed reciprocal convolution, so only ell=0 survives. The case d=0 has an empty finite sum and Q=1; it gives coeff_n(F)=s_n.

**Acceptance checks.** The indices n+d-i always exceed n for i<d. This direction is essential to both the tail formula and uniqueness.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full.. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### The native polynomial remainder

`L4/entire-monic-division-remainder` · theorem.

For entire F, let R be the native degree-d truncation of F-Q S_Q(F). Then F=Q S_Q(F)+R in A[[T]] and degree(R)<d.

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-monic-quotient-recurrence`, `mathlib:PowerSeries.coeff_mul`, `mathlib:PowerSeries.trunc`, `mathlib:PowerSeries.coeff_trunc`, `mathlib:PowerSeries.degree_trunc_lt`, `mathlib:Polynomial.coeff_coe`.

**Proof outline.** The recurrence says all coefficients of F-Q S_Q(F) in degrees n+d vanish. Thus the difference agrees coefficientwise with its native truncation at d. Below d, coeff_trunc gives precisely the original difference; at and above d, both coefficients are zero. Apply native power-series extensionality and rearrange. Native degree_trunc_lt proves the polynomial degree bound, also for d=0 where the remainder is zero and its degree is minus infinity.

**Acceptance checks.** Use polynomial degree, not natDegree, for the zero remainder. No new remainder carrier or arbitrary choice is introduced.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full.. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### A monic entire product cannot lower degree

`L4/entire-monic-product-low-degree` · lemma.

If H is entire, R is a polynomial of degree less than d and QH=R in A[[T]], then H=0 and R=0.

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:PowerSeries.coeff_mul`, `mathlib:Polynomial.coeff_coe`, `mathlib:Polynomial.coeff_eq_zero_of_degree_lt`, `mathlib:IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg`, `mathlib:Filter.Tendsto.bddAbove_range`, `mathlib:le_csSup`, `mathlib:csSup_le`, `mathlib:Polynomial.coe_injective`.

**Proof outline.** If d=0, monicity gives Q=1 and the degree bound gives R=0, so H=0. For d>0 compare coefficients at n+d: h_n=−Σ_(i<d)coeff_i(Q)h_(n+d-i). This uses only the leading coefficient1 and the remainder degree bound. Choose C≥1 so norm(coeff_(d-j)(Q))≤C^j for j=1,...,d, and S>C. The nonnegative sequence x_n=norm(h_n)S^n tends to zero by entireness and hence has a bounded range. Let M be its real supremum, finite and nonnegative. Put theta=C/S<1. Submultiplicativity and the ultrametric finite-sum estimate give x_n≤max_(1≤j≤d)theta^j x_(n+j)≤theta M. Taking the supremum yields M≤theta M, so M=0. All coefficients h_n vanish. Native power-series extensionality gives H=0; the product identity and injectivity of the native polynomial inclusion then give R=0.

**Acceptance checks.** This proves the monic corrected entire case behind source findingE1 without rescaling by a unit of A. It remains valid with zero divisors. Restricted convergence at radius1 is insufficient.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full.. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### Uniqueness of monic entire division

`L4/entire-monic-division-unique` · theorem.

If F=QG+R=QH+S, G,H are entire and polynomial R,S have degree less than d, then G=H and R=S.

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-monic-product-low-degree`, `LocallyAnalyticDistributions:L4/entire-series`.

**Proof outline.** Subtract the two decompositions. The existing entire subring makes G-H entire. The polynomial S-R has degree below d, including zero remainders. Apply entire-monic-product-low-degree to Q(G-H)=S-R, then conclude both equalities.

**Acceptance checks.** The proof never cancels a nonunit polynomial inside the full formal-series ring.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full.. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### Compatibility with native polynomial division

`L4/entire-monic-quotient-polynomial` · comparison.

For every polynomial P, S_Q(P)=P divByMonic Q under native polynomial inclusion, and the constructed native truncation remainder equals P modByMonic Q.

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-monic-division-remainder`, `LocallyAnalyticDistributions:L4/entire-monic-quotient-entire`, `LocallyAnalyticDistributions:L4/entire-monic-division-unique`, `LocallyAnalyticDistributions:L4/polynomial-series-entire`, `mathlib:Polynomial.modByMonic_add_div`, `mathlib:Polynomial.degree_modByMonic_lt`.

**Proof outline.** The native monic polynomial division identity provides a polynomial quotient and remainder, with the remainder degree below d. Include the equality in native power series; polynomials are entire by the existing lemma. Compare it with the constructed entire division. Uniqueness identifies both quotients and both remainders.

**Acceptance checks.** This is compatibility with the already-existing divByMonic and modByMonic, not a new polynomial division algorithm.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full.. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### Compatibility with the existing linear tail quotient

`L4/entire-monic-quotient-linear` · comparison.

For every a∈A and entire F, S_(T-a)(F) equals the existing entireLinearQuotient(a,F).

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-monic-division-remainder`, `LocallyAnalyticDistributions:L4/entire-monic-quotient-entire`, `LocallyAnalyticDistributions:L4/entire-monic-division-unique`, `LocallyAnalyticDistributions:L4/entire-linear-division`, `LocallyAnalyticDistributions:L4/entire-linear-quotient-entire`.

**Proof outline.** Both quotient constructions are entire and give division of F by the same native monic linear polynomial. The linear construction has constant remainder F(a); the native degree-one truncation is also constant. Apply the general uniqueness theorem. It identifies the quotients and, as a consequence, the native remainder with the existing evaluation constant.

**Acceptance checks.** No new evaluation functional or competing linear quotient is defined.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full.. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### Polynomial inclusion in the entire-series ring

`L4/entire-polynomial-inclusion` · construction.

Bundle the existing polynomialSeries inclusion as the ring homomorphism i:A[T] to A{{T}}. Its underlying native formal series is the native polynomial coercion. This corestricts an existing map; it introduces no new entire or formal-series carrier.

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Q is a monic polynomial, including Q=1. F belongs to the existing entire-series subring, meaning weighted coefficients tend to zero at every positive real radius. No field, reducedness, Noetherianity or splitting assumption is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/polynomial-series-entire`, `mathlib:Polynomial.coeToPowerSeries.ringHom`, `mathlib:Polynomial.coe_injective`, `mathlib:Polynomial.eval₂_C_X_eq_coe`.

**Proof outline.** Use the existing polynomial-entireness theorem to corestrict the native polynomial-to-power-series ring homomorphism to the existing entireSeries subring. The native eval₂_C_X_eq_coe theorem identifies polynomialSeries with that coercion. Ring laws come from the native map and injectivity from native Polynomial.coe_injective.

**Uses.** Coleman A3 quotient interpretation and the entire quotient class below: Identify polynomial representatives and the actual generator Q of the analytic principal ideal. resultant-unit and entire-resultant-bezout: State the analytic Bezout equation in the existing entire-series ring.

**API.**

| Declaration | Contract |
|---|---|
| `entirePolynomial_coe` | The underlying formal series of i(P) is polynomialSeries(P), equal to the native polynomial coercion. |
| `entirePolynomial_injective` | The ring homomorphism i is injective. |
| `entirePolynomial_C` | The underlying formal series of i(C(a)) is PowerSeries.C(a). |

**Unit tests.**

- `entire_polynomial_zero` (degenerate): i(0)=0.
- `entire_polynomial_square` (computation): The underlying formal series of i(T^2) is T^2.
- `entire_polynomial_native_injective` (compatibility): For native polynomials P,S, i(P)=i(S) if and only if P=S.

**Acceptance checks.** The polynomial inclusion is multiplicative and injective even with zero divisors. It is not the constant-term map.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–435/PDF18–19: quotient-norm interpretation and Lemmas A3.5,A3.7. Worker decomposition of the stated quotient interpretation and proof, using the native monic quotient and resultant APIs. The source does not separately state this declaration or its weakened complete ultrametric ring hypotheses.

### Polynomial divisibility detected inside entire series

`L4/entire-polynomial-divisibility` · lemma.

For monic Q and any native polynomial P, i(Q) divides i(P) in A{{T}} if and only if Q divides P in A[T].

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Q is a monic polynomial, including Q=1. F belongs to the existing entire-series subring, meaning weighted coefficients tend to zero at every positive real radius. No field, reducedness, Noetherianity or splitting assumption is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-polynomial-inclusion`, `LocallyAnalyticDistributions:L4/entire-division`, `mathlib:Polynomial.modByMonic_add_div`, `mathlib:Polynomial.degree_modByMonic_lt`, `mathlib:Polynomial.modByMonic_eq_zero_iff_dvd`.

**Proof outline.** Native polynomial division gives P=Q(P divByMonic Q)+(P modByMonic Q), with remainder degree below d. Include this identity into the entire ring. Given i(P)=i(Q)G with G entire, compare that decomposition with remainder zero to the native polynomial decomposition using the uniqueness clause of entire-division. The native remainder must be zero, hence native divisibility. Conversely include a polynomial factorization. The proof never cancels Q in an arbitrary formal-series ring and remains valid for d=0.

**Acceptance checks.** The entire hypothesis is indispensable: over Q_p a polynomial T-a with nonzero a can be a formal power-series unit, while it cannot divide 1 in the entire ring.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–435/PDF18–19: quotient-norm interpretation and Lemmas A3.5,A3.7. Worker decomposition of the stated quotient interpretation and proof, using the native monic quotient and resultant APIs. The source does not separately state this declaration or its weakened complete ultrametric ring hypotheses.

### Entire series in the native monic quotient

`L4/entire-quotient-class` · construction.

For monic Q, define the ring homomorphism rho_Q:A{{T}} to native AdjoinRoot Q=A[T]/(Q) by entire division F=i(Q)S+i(R) and rho_Q(F)=AdjoinRoot.mk Q R. The value is independent of every such polynomial representative, even if its degree is not normalized.

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Q is a monic polynomial, including Q=1. F belongs to the existing entire-series subring, meaning weighted coefficients tend to zero at every positive real radius. No field, reducedness, Noetherianity or splitting assumption is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-division`, `LocallyAnalyticDistributions:L4/entire-polynomial-inclusion`, `LocallyAnalyticDistributions:L4/entire-polynomial-divisibility`, `mathlib:AdjoinRoot.mk_eq_mk`.

**Proof outline.** Choose the unique quotient and normalized remainder from entire-division, and send the remainder through native AdjoinRoot.mk. If F=i(Q)S+i(R)=i(Q)Sprime+i(Rprime), then i(R-Rprime) is divisible by i(Q) with an entire quotient. Apply entire-polynomial-divisibility and native mk_eq_mk to identify the two quotient classes. Addition of representatives gives the additive law. For products, (QS+R)(QT+U)=Q(QST+SU+TR)+RU; the correction factor is entire by subring closure. Representative independence and native mk multiplication give the multiplicative law. The representatives 0,1 and arbitrary polynomials give the zero,one and polynomial equations.

**Uses.** Coleman A3 printed434 quotient-norm interpretation: Construct the analytic reduction map and obtain the actual quotient identification from native first isomorphism once kernel and surjectivity are supplied. entire-resultants, entire-resultant-polynomial and resultant-unit: Reduce entire arguments into the finite native algebra before taking norm or lifting units.

**API.**

| Declaration | Contract |
|---|---|
| `entireAdjoinRoot_polynomial` | rho_Q(i(P))=AdjoinRoot.mk Q P for every native polynomial P. |
| `entireAdjoinRoot_of_decomposition` | If F=i(Q)G+i(R) with G entire and R any polynomial, rho_Q(F)=AdjoinRoot.mk Q R; no degree bound on R is required. |
| `entireAdjoinRoot_eq_zero_iff` | rho_Q(F)=0 if and only if i(Q) divides F in the entire ring; promoted to its own node. |
| `entireAdjoinRoot_surjective` | rho_Q is surjective; promoted to its own node. |
| `entireAdjoinRoot_linear` | For Q=T-a, rho_Q(F)=AdjoinRoot.of Q (F(a)); promoted to its own node. |

**Unit tests.**

- `quotient_constant_divisor` (degenerate): For Q=1, rho_1(F)=0 for every entire F; 0=1 in the target.
- `quotient_nilpotent_square` (computation): rho_(T^2)(i(T^2))=0.
- `quotient_nilpotent_generator_nonzero` (nonexample): For nontrivial A, rho_(T^2)(i(T)) is nonzero, although its square is zero.
- `quotient_native_remainder` (compatibility): For every native polynomial P, rho_Q(i(P))=AdjoinRoot.mk Q (P modByMonic Q).

**Acceptance checks.** There is no evaluation of an arbitrary formal series at AdjoinRoot.root. The finite algebra need not be a domain or reduced. At Q=1 the target is the zero ring.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–435/PDF18–19: quotient-norm interpretation and Lemmas A3.5,A3.7. Worker decomposition of the stated quotient interpretation and proof, using the native monic quotient and resultant APIs. The source does not separately state this declaration or its weakened complete ultrametric ring hypotheses.

### Kernel of analytic reduction modulo a monic polynomial

`L4/entire-quotient-class-kernel` · lemma.

For F in A{{T}}, rho_Q(F)=0 if and only if i(Q) divides F in A{{T}}. Equivalently the kernel ideal is the principal ideal generated by i(Q).

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Q is a monic polynomial, including Q=1. F belongs to the existing entire-series subring, meaning weighted coefficients tend to zero at every positive real radius. No field, reducedness, Noetherianity or splitting assumption is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-quotient-class`, `mathlib:AdjoinRoot.mk_eq_zero`.

**Proof outline.** Write F=i(Q)S+i(R). If rho_Q(F)=0, native mk_eq_zero supplies a polynomial H with R=QH; then F=i(Q)(S+i(H)). Conversely rho_Q(i(Q)) is native mk(Q)=0. Apply the ring homomorphism to an entire factorization. The equivalence is the principal-ideal membership equation; there is no cancellation or inverse-of-Q step.

**Acceptance checks.** For Q=1 the kernel is the whole entire ring. For Q=T-a it recovers the existing entire root-factor criterion.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–435/PDF18–19: quotient-norm interpretation and Lemmas A3.5,A3.7. Worker decomposition of the stated quotient interpretation and proof, using the native monic quotient and resultant APIs. The source does not separately state this declaration or its weakened complete ultrametric ring hypotheses.

### Polynomial representatives lift every quotient class

`L4/entire-quotient-class-surjective` · lemma.

The map rho_Q:A{{T}} to native AdjoinRoot Q is surjective. Together with the kernel theorem, native RingHom.quotientKerEquivOfSurjective identifies A{{T}}/(i(Q)) with the native polynomial quotient. No second quotient-equivalence construction is planned.

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Q is a monic polynomial, including Q=1. F belongs to the existing entire-series subring, meaning weighted coefficients tend to zero at every positive real radius. No field, reducedness, Noetherianity or splitting assumption is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-quotient-class`, `LocallyAnalyticDistributions:L4/entire-quotient-class-kernel`, `mathlib:AdjoinRoot.mk_surjective`, `mathlib:RingHom.quotientKerEquivOfSurjective`.

**Proof outline.** For x in AdjoinRoot Q, use native mk_surjective to choose P with mk(P)=x. The existing inclusion i(P) maps to x by the polynomial equation of rho_Q. Apply the native first-isomorphism equivalence and rewrite the kernel with the preceding theorem whenever the quotient interpretation is needed. Scalar compatibility follows from the polynomial equation on constants.

**Acceptance checks.** The native finite power basis is reused after this identification. Surjectivity does not require Q to split or its roots to be simple.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–435/PDF18–19: quotient-norm interpretation and Lemmas A3.5,A3.7. Worker decomposition of the stated quotient interpretation and proof, using the native monic quotient and resultant APIs. The source does not separately state this declaration or its weakened complete ultrametric ring hypotheses.

### Linear analytic reduction is convergent evaluation

`L4/entire-quotient-class-linear` · comparison.

For arbitrary a in A and entire F, rho_(T-a)(F)=AdjoinRoot.of (T-a) (F(a)), where F(a) is the existing convergent entire evaluation.

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Q is a monic polynomial, including Q=1. F belongs to the existing entire-series subring, meaning weighted coefficients tend to zero at every positive real radius. No field, reducedness, Noetherianity or splitting assumption is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-quotient-class`, `LocallyAnalyticDistributions:L4/entire-linear-division`, `LocallyAnalyticDistributions:L4/entire-linear-quotient-entire`.

**Proof outline.** The existing evaluated-tail division gives F=(T-a)Q_a(F)+F(a), and the existing quotient-entireness theorem puts Q_a(F) inside the entire ring. Apply the representative equation for rho to the constant polynomial C(F(a)). Native mk_C is the scalar map, giving the displayed equality.

**Acceptance checks.** No small-norm restriction on a is imposed; evaluation on merely formal series is not used.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–435/PDF18–19: quotient-norm interpretation and Lemmas A3.5,A3.7. Worker decomposition of the stated quotient interpretation and proof, using the native monic quotient and resultant APIs. The source does not separately state this declaration or its weakened complete ultrametric ring hypotheses.

### Entire resultant agrees with the native polynomial resultant

`L4/entire-resultant-polynomial` · comparison.

For monic Q and every native polynomial P, the existing entire resultant of Q and i(P) equals native Polynomial.resultant Q P Q.natDegree P.natDegree, with exactly this argument order and degree bounds.

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Q is a monic polynomial, including Q=1. F belongs to the existing entire-series subring, meaning weighted coefficients tend to zero at every positive real radius. No field, reducedness, Noetherianity or splitting assumption is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-resultants`, `LocallyAnalyticDistributions:L4/entire-quotient-class`, `tauceti:AdjoinRoot.norm_mk_eq_resultant`.

**Proof outline.** The norm characterization of the existing entire resultant and rho_Q(i(P))=mk_Q(P) reduce the comparison to a native finite-algebra norm. Apply pinned Tau Ceti AdjoinRoot.norm_mk_eq_resultant. Its commutative-ring monic theorem already proves the Sylvester sign and degree bookkeeping, including d=0; do not reproduce it as proposed mathematics.

**Acceptance checks.** For Q=T-a the value is P(a). For Q=T^2 and P=a+bT it is a^2, even with nilpotent b or a.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–435/PDF18–19: quotient-norm interpretation and Lemmas A3.5,A3.7. Worker decomposition of the stated quotient interpretation and proof, using the native monic quotient and resultant APIs. The source does not separately state this declaration or its weakened complete ultrametric ring hypotheses.

### Bounded polynomial coefficient in the resultant Bezout identity

`L4/entire-resultant-bezout` · lemma.

For monic Q of degree d and entire F, there exist entire G and polynomial H with degree H<d such that i(C(Res(Q,F)))=i(Q)G+i(H)F. At d=0, Q=1 and one may take G=1,H=0.

**Hypotheses.** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Q is a monic polynomial, including Q=1. F belongs to the existing entire-series subring, meaning weighted coefficients tend to zero at every positive real radius. No field, reducedness, Noetherianity or splitting assumption is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-division`, `LocallyAnalyticDistributions:L4/entire-polynomial-inclusion`, `LocallyAnalyticDistributions:L4/entire-resultants`, `LocallyAnalyticDistributions:L4/entire-resultant-polynomial`, `mathlib:Polynomial.exists_mul_add_mul_eq_C_resultant`.

**Proof outline.** Divide F=i(Q)S+i(R). The quotient-class definition makes Res(Q,F)=Res(Q,i(R)); the polynomial comparison identifies it with the native polynomial resultant of Q,R. For d>0 invoke native exists_mul_add_mul_eq_C_resultant with m=d and n=R.natDegree. It supplies polynomial U,H with Q U+R H=C(Res), and degree H<d. The native nonzero-degree side condition holds because d>0. Substitute R=F-QS to obtain Res=Q(U-HS)+HF. Take G=i(U)-i(H)S, which is entire by subring closure. This fixes the minus sign in the analytic coefficient. For d=0, monic Q=1 and the quotient has empty basis, so Res=1. Choose G=1,H=0; degree(0) is bottom and is below the natural degree zero viewed in WithBot.

**Acceptance checks.** The degenerate case cannot be obtained by calling the native Bezout-resultant theorem with both degree bounds zero; its explicit disjunction would fail.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–435/PDF18–19: quotient-norm interpretation and Lemmas A3.5,A3.7. Worker decomposition of the stated quotient interpretation and proof, using the native monic quotient and resultant APIs. The source does not separately state this declaration or its weakened complete ultrametric ring hypotheses.

### Monic reversal of a normalized polynomial

`L4/spectral-reversed-degree` · lemma.

If A is nontrivial, Q_n is monic of degree exactly n, even when degree(P)<n.

**Hypotheses.** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree. The degree equality requires A nontrivial; the other spectral laws below include the zero ring by its unique-element case.

**Inputs.** `mathlib:Polynomial.coeff_reflect`, `mathlib:Polynomial.natDegree_reflect_le`.

**Proof outline.** Native coeff_reflect makes coefficient n equal P(0)=1. Native natDegree_reflect_le bounds its degree by n. A nonzero coefficient in degree n forces equality of degrees; that same coefficient proves monicity. The coefficient proof establishes both conclusions together.

**Acceptance checks.** P=1 gives Q_n=Y^n. Using only the actual-degree reversal would lose the padded zero roots.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026.. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### The finite polynomial spectral transform

`L4/polynomial-spectral-resultant` · construction.

Define D_(n,m)(B,P) as the native resultant over A[T] of Q_n(Y), with its coefficients included as constants, and K_B(T,Y)=1−T B(Y), with degree bounds n,m. Its value is a native polynomial in T. The expression is total; its spectral interpretation uses the stated degree bounds and P(0)=1.

**Hypotheses.** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-reversed-degree`, `mathlib:Polynomial.reflect`, `mathlib:Polynomial.resultant`, `mathlib:Polynomial.natDegree_sub_le`, `mathlib:Polynomial.natDegree_C_mul_le`, `mathlib:Polynomial.natDegree_map_le`, `mathlib:Polynomial.resultant_zero_right_deg`, `mathlib:Polynomial.resultant_zero_left_deg`.

**Proof outline.** Use native Polynomial.reflect, coefficient inclusion into A[T], and the native bounded Sylvester resultant. No new polynomial, root-algebra or determinant carrier is introduced. The resultant-variable degree of K_B is at most degree(B): subtraction, constant multiplication and coefficient mapping do not increase the relevant degree. The reversal lemma makes the left argument monic of exact degree n in the nontrivial case. Retain both bounds in the definition so specialization to a ring where coefficients vanish preserves the actual expression. The separate bound-independence and padding theorems identify valid presentations.

**Uses.** Coleman A3 finite definition and A3.8: Supplies the finite polynomial transform and its product law before the analytic limiting argument. Coleman A3.9, A4.1 and LAD fredholm-resolvent: Provides the finite quotient-norm expression required before comparing a functional-calculus operator with its characteristic series.

**API.**

| Declaration | Contract |
|---|---|
| `polynomialSpectralResultant_def` | The value is the native bounded resultant over A[T] of the mapped reversal and1−T B(Y), with the two displayed bounds. |
| `polynomialSpectralResultant_eval` | Evaluation at t is the bounded resultant Res(Q_n,1−tB); promoted. |
| `polynomialSpectralResultant_constantCoeff` | For P(0)=1 the constant coefficient is1; promoted. |
| `polynomialSpectralResultant_zero` | For B=0 and m=0 the value is1, with any P and n. |
| `polynomialSpectralResultant_oneInput` | For P=1 and n=0 the value is1, for any B and m. |
| `polynomialSpectralResultant_linear` | For P=1−aY,n=1 the value is1−B(a)T; promoted. |
| `polynomialSpectralResultant_mul` | Multiplication in P adds its two degree bounds and multiplies D; promoted. |
| `polynomialSpectralResultant_padding` | Increasing n by one multiplies D by1−B(0)T; promoted. |
| `polynomialSpectralResultant_map` | Fixed-bound construction commutes with every coefficient ring map; promoted. |
| `polynomialSpectralResultant_norm` | The value is a native finite-quotient algebra norm; promoted. |

**Unit tests.**

- `SpectralTests.rank_zero` (degenerate): D_(0,0)(1,1)=1 over the integers.
- `SpectralTests.nonzero_constant_padding` (non-example): D_(1,0)(1,1)=1−T over the integers, although D_(0,0)(1,1)=1. Thus B(0)=0 cannot be omitted from padding stability.
- `SpectralTests.nilpotent_linear` (computation): Over ZMod4, D_(1,2)(Y^2,1−2Y)=1, because the squared nilpotent eigenvalue is zero.
- `SpectralTests.repeated_root` (computation): Over ZMod8, D_(2,2)(Y+Y^2,(1−2Y)^2)=1+4T+4T^2. Repeated roots and nonreduced coefficients are retained.

**Acceptance checks.** These are finite polynomial data. Existence, entireness and coefficientwise convergence of D on arbitrary entire inputs remain explicit gaps.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026.. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### Specializing the spectral parameter

`L4/spectral-polynomial-evaluation` · lemma.

For every t∈A, D_(n,m)(B,P)(t)=Res_A(Q_n,1−tB;n,m). This formula requires no degree or constant-coefficient hypotheses.

**Hypotheses.** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree.

**Inputs.** `LocallyAnalyticDistributions:L4/polynomial-spectral-resultant`, `mathlib:Polynomial.resultant_map_map`, `mathlib:Polynomial.map_map`.

**Proof outline.** Apply native resultant_map_map to the evaluation ring homomorphism A[T]→A. The two composed constant-inclusion/evaluation maps are the identity on A. The kernel specializes to1−tB, with the same explicit degree bounds.

**Acceptance checks.** The specialization preserves the bounds even when actual degrees fall.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026.. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### Normalization of the finite transform

`L4/spectral-polynomial-constant` · lemma.

If P(0)=1, the constant coefficient of D_(n,m)(B,P) is1 for every B,n,m, without degree hypotheses.

**Hypotheses.** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-polynomial-evaluation`, `mathlib:Polynomial.resultant_one_right`, `mathlib:Polynomial.coeff_reflect`, `mathlib:Polynomial.coeff_zero_eq_eval_zero`.

**Proof outline.** Evaluate the preceding formula at0. The right polynomial becomes1. Native resultant_one_right gives coefficient n of Q_n raised to m. Native reversal identifies that coefficient with P(0)=1.

**Acceptance checks.** The case n=m=0 is included; the empty determinant gives1.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026.. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### Independence of the auxiliary degree bound

`L4/spectral-right-bound` · lemma.

For any m≥degree(B), D_(n,m)(B,P)=D_(n,degree(B))(B,P).

**Hypotheses.** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree.

**Inputs.** `LocallyAnalyticDistributions:L4/polynomial-spectral-resultant`, `LocallyAnalyticDistributions:L4/spectral-reversed-degree`, `mathlib:Polynomial.Monic.map`, `mathlib:Polynomial.Monic.natDegree_map`, `tauceti:Polynomial.Monic.resultant_of_le`.

**Proof outline.** In the nontrivial case, the reversed left polynomial is monic of degree n, and its constant-coefficient inclusion preserves that degree. Apply the existing pinned TauCeti Monic.resultant_of_le separately to the bounds m and degree(B); both reduce to the same native resultant. The zero-ring case has a unique result.

**Acceptance checks.** No second proof of the generic monic resultant degree-bound theorem is planned.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026.. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### A single polynomial eigenvalue

`L4/spectral-linear-factor` · lemma.

For a∈A and m≥degree(B), D_(1,m)(B,1−aY)=1−B(a)T, including a=0.

**Hypotheses.** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree.

**Inputs.** `LocallyAnalyticDistributions:L4/polynomial-spectral-resultant`, `mathlib:Polynomial.coeff_reflect`, `mathlib:Polynomial.resultant_X_sub_C_left`, `mathlib:Polynomial.eval_map_apply`.

**Proof outline.** Native bounded reversal sends1−aY toY−a, including when a=0 and the actual degree of the input is zero. Native resultant_X_sub_C_left evaluates K_B at the constant image of a. Native evaluation under the coefficient map gives B(a), with the displayed orientation.

**Acceptance checks.** This is multiplication by the eigenvalue B(a), not substitution T↦B(T) in the original polynomial.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026.. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### Multiplication of finite characteristic factors

`L4/spectral-factor-product` · lemma.

For normalized P,Q with degree(P)≤n,degree(Q)≤k and degree(B)≤m, D_(n+k,m)(B,PQ)=D_(n,m)(B,P)D_(k,m)(B,Q).

**Hypotheses.** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree.

**Inputs.** `LocallyAnalyticDistributions:L4/polynomial-spectral-resultant`, `LocallyAnalyticDistributions:L4/spectral-reversed-degree`, `mathlib:Polynomial.reflect_mul`, `mathlib:Polynomial.Monic.natDegree_map`, `mathlib:Polynomial.resultant_mul_left`.

**Proof outline.** Native reflect_mul identifies the reversed product at bound n+k with the product of the two reversals at bounds n,k. The reversal lemma and native monic coefficient-map degree law identify the two actual degrees as n,k. Apply native resultant_mul_left with the kernel degree bound. If A is the zero ring the equality is automatic. No roots, distinctness, domain or coprimality assumption is used.

**Acceptance checks.** This proves the finite polynomial form of A3.8(10). Passing to entire inputs remains separate.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026.. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### The exact zero-root padding factor

`L4/spectral-zero-padding` · lemma.

D_(n+1,m)(B,P)=D_(n,m)(B,P)(1−B(0)T).

**Hypotheses.** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-factor-product`, `LocallyAnalyticDistributions:L4/spectral-linear-factor`.

**Proof outline.** Apply the factor-product theorem to P and the polynomial1, using degree bounds n and1. Regard1 as1−0Y and apply the linear-factor theorem to obtain the extra factor1−B(0)T.

**Acceptance checks.** For B=1,P=1, padding once changes the value from1 to1−T. The constant-term hypothesis is mathematically necessary.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026.. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### Stability when the operator series vanishes at zero

`L4/spectral-padding-stability` · lemma.

If B(0)=0, then D_(n+k,m)(B,P)=D_(n,m)(B,P) for every k≥0. Hence any two valid bounds on degree(P) give the same transform.

**Hypotheses.** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree. B(0)=0 for this assertion.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-zero-padding`, `LocallyAnalyticDistributions:L4/spectral-right-bound`.

**Proof outline.** Induct on k using the exact padding law. The factor1−B(0)T is1. For two unrelated valid bounds compare each with their maximum. Together with right-bound independence this yields the canonical finite transform without choosing a splitting algebra.

**Acceptance checks.** The hypothesis B(0)=0 matches the entire functional-calculus setting; it is not required for the finite fixed-bound construction itself.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026.. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### Coefficient maps preserve the finite transform

`L4/spectral-scalar-extension` · lemma.

For every homomorphism f:A→S of commutative rings, mapping the coefficients of D_(n,m)(B,P) by f gives D_(n,m)(f(B),f(P)). No degree or constant-coefficient hypotheses are needed for this fixed-bound identity.

**Hypotheses.** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree.

**Inputs.** `LocallyAnalyticDistributions:L4/polynomial-spectral-resultant`, `mathlib:Polynomial.reflect_map`, `mathlib:Polynomial.resultant_map_map`, `mathlib:Polynomial.map_map`.

**Proof outline.** Use native reflect_map and the commuting square between coefficient mapping and constant inclusion to identify the first resultant argument after mapping. The same square identifies the mapped kernel with1−T f(B). Apply native resultant_map_map with the induced map A[T]→S[T].

**Acceptance checks.** The equality includes noninjective maps and specialization to nonreduced rings. Fixed degree bounds prevent accidental degree loss.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026.. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### Finite spectral transform as a native algebra norm

`L4/spectral-quotient-norm` · comparison.

D_(n,m)(B,P) is Algebra.norm over A[T] of the class of1−T B(Y) in native AdjoinRoot(Q_n mapped into A[T][Y]).

**Hypotheses.** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree.

**Inputs.** `LocallyAnalyticDistributions:L4/polynomial-spectral-resultant`, `LocallyAnalyticDistributions:L4/spectral-reversed-degree`, `LocallyAnalyticDistributions:L4/spectral-right-bound`, `mathlib:Polynomial.Monic.map`, `mathlib:Polynomial.Monic.natDegree_map`, `tauceti:AdjoinRoot.norm_mk_eq_resultant`.

**Proof outline.** The reversal and native monic map facts make the quotient polynomial monic of degree n. Native Monic.resultant_of_le removes the valid auxiliary bound m. Apply pinned AdjoinRoot.norm_mk_eq_resultant in the coefficient ring A[T]. The native monic quotient power basis supplies the finite free algebra and determinant interpretation. The zero ring is handled by uniqueness, not by a nontriviality assumption hidden in a basis argument.

**Acceptance checks.** This is a finite polynomial quotient. No normed topology or entire evaluation in that quotient is asserted by this algebraic statement.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026.. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### The finite root-product formula

`L4/spectral-split-factors` · lemma.

For a finite index set I, arbitrary elements a_i∈A and m≥degree(B), D_(|I|,m)(B,∏_i(1−a_iY))=∏_i(1−B(a_i)T). Repetitions and zero a_i are allowed.

**Hypotheses.** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-factor-product`, `LocallyAnalyticDistributions:L4/spectral-linear-factor`, `LocallyAnalyticDistributions:L4/polynomial-spectral-resultant`, `mathlib:Polynomial.natDegree_prod_le`, `mathlib:Polynomial.coeff_zero_prod`, `mathlib:Polynomial.resultant_zero_left_deg`.

**Proof outline.** Native degree-of-product and constant-coefficient-of-product facts give the hypotheses for each partial product. Each linear factor has degree at most1 and constant coefficient1. Induct on the finite set, applying factor-product and the linear-factor formula. The empty product uses the n=0 resultant formula. This agrees with the source finite symmetric-polynomial formula whenever factors are supplied. It does not assume every polynomial splits in A or construct an analytic splitting extension.

**Acceptance checks.** The root multiset is retained. A distinct-root set would lose multiplicities and fail the repeated-root test over ZMod8.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026.. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### Fixed-rank reflection of the characteristic series

`L4/spectral-matrix-reflection` · lemma.

Reflecting P_M at N gives χ_M, even when the actual degree of P_M is smaller than N.

**Hypotheses.** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant.

**Inputs.** `mathlib:Matrix.charpolyRev`, `mathlib:Matrix.reverse_charpoly`, `mathlib:Matrix.charpoly_natDegree_eq_dim`, `mathlib:Polynomial.reverse`, `mathlib:Polynomial.reflect_reflect`.

**Proof outline.** For a nontrivial coefficient ring, native reverse_charpoly and charpoly_natDegree_eq_dim identify P_M with reflection of χ_M at N. Apply native reflect_reflect. In the zero ring both polynomials are equal by uniqueness. The rank bound is kept fixed rather than replaced by the degree of P_M.

**Acceptance checks.** The zero matrix of size N has P_M=1 and reflection at N equal to Y^N.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread.. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Degree bound for the characteristic series

`L4/spectral-matrix-degree` · lemma.

The degree of P_M is at most N.

**Hypotheses.** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant.

**Inputs.** `mathlib:Matrix.reverse_charpoly`, `mathlib:Matrix.charpoly_natDegree_eq_dim`, `mathlib:Polynomial.reverse`, `mathlib:Polynomial.natDegree_reflect_le`.

**Proof outline.** In the nontrivial case express P_M as the reflection of χ_M at N by the native reverse-characteristic identity. Use native natDegree_reflect_le and the exact degree of χ_M. The zero-ring case has degree zero and satisfies the same bound.

**Acceptance checks.** Equality need not hold: zero eigenvalues lower the degree of P_M.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread.. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Scalar extension of the characteristic series

`L4/spectral-matrix-coefficients` · lemma.

For every ring homomorphism f:A→S, P_(f(M)) is the coefficient image f(P_M). No injectivity or nontriviality hypothesis is required.

**Hypotheses.** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-matrix-reflection`, `mathlib:Polynomial.reflect_map`, `mathlib:Polynomial.reflect_reflect`, `mathlib:Matrix.charpoly_map`.

**Proof outline.** Reflect both sides at the fixed rank N. Use the matrix reflection lemma, native reflect_map and native charpoly_map. Reflect once more and use involutivity. This avoids an invalid assumption that coefficient maps preserve actual polynomial degree.

**Acceptance checks.** Reduction of nilpotent coefficients and specialization to the zero ring are admitted.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread.. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Similarity invariance of the characteristic series

`L4/spectral-matrix-conjugation` · lemma.

For a native matrix unit U, P_(UMU⁻¹)=P_M.

**Hypotheses.** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant.

**Inputs.** `mathlib:Matrix.reverse_charpoly`, `mathlib:Matrix.charpoly_units_conj`.

**Proof outline.** Use native reverse_charpoly to reduce to the usual characteristic polynomial. Apply native charpoly_units_conj, then return to the reverse characteristic polynomial.

**Acceptance checks.** Only U must be invertible; M may be singular or nilpotent.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread.. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Diagonal entries of a triangular product

`L4/spectral-triangular-diagonal-product` · lemma.

If M and L are upper triangular, then (ML)_(i,i)=M_(i,i)L_(i,i) for every i.

**Hypotheses.** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant. I has a linear order, and both matrices are upper triangular for that order.

**Inputs.** `mathlib:Matrix.IsUpperTriangular`, `mathlib:Matrix.mul_apply`.

**Proof outline.** Expand the product entry with native mul_apply. Every summand indexed by j≠i vanishes: for j<i the M entry vanishes, and for i<j the L entry vanishes. The remaining summand is the stated product.

**Acceptance checks.** Both triangular hypotheses are required; arbitrary matrix products have off-diagonal contributions.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread.. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Polynomial evaluation preserves upper triangularity

`L4/spectral-triangular-evaluation` · lemma.

If M is upper triangular, then B(M) is upper triangular for every polynomial B over A.

**Hypotheses.** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant. I has a linear order, and M is upper triangular.

**Inputs.** `mathlib:Matrix.IsUpperTriangular`, `mathlib:Polynomial.induction_on`, `mathlib:Matrix.blockTriangular_algebraMap`, `mathlib:Matrix.BlockTriangular.pow`, `mathlib:Matrix.BlockTriangular.mul`.

**Proof outline.** Use native polynomial induction. Constant scalar matrices are triangular by blockTriangular_algebraMap. Sums preserve the vanishing entries. Each monomial is the product of a scalar matrix with a power of M; apply native BlockTriangular.pow and BlockTriangular.mul.

**Acceptance checks.** Constant and zero polynomials are included; no condition on B(0) is imposed.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread.. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### The diagonal of a polynomial in a triangular matrix

`L4/spectral-triangular-evaluation-diagonal` · lemma.

If M is upper triangular, then the i-th diagonal entry of B(M) is B(M_(i,i)).

**Hypotheses.** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant. I has a linear order, and M is upper triangular.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-triangular-diagonal-product`, `mathlib:Matrix.BlockTriangular.pow`, `mathlib:Matrix.blockTriangular_algebraMap`, `mathlib:Matrix.algebraMap_matrix_apply`, `mathlib:Polynomial.induction_on`.

**Proof outline.** Induct on the exponent using triangular product diagonals and native triangular powers to prove that the diagonal of M^k is the k-th power of the diagonal. Apply native polynomial induction. The scalar algebra-map entry formula treats constants; sums are entrywise; monomials use the product-diagonal lemma and the power calculation.

**Acceptance checks.** Off-diagonal entries of B(M) need not vanish; only its diagonal is specified.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread.. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Characteristic factors of a triangular matrix

`L4/spectral-triangular-characteristic` · lemma.

If M is upper triangular, P_M(T)=∏_(i∈I)(1−M_(i,i)T).

**Hypotheses.** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant. I has a linear order, and M is upper triangular.

**Inputs.** `mathlib:Matrix.charpolyRev`, `mathlib:Matrix.IsUpperTriangular`, `mathlib:Matrix.det_of_isUpperTriangular`.

**Proof outline.** Unfold the native reverse characteristic polynomial once. The matrix 1−TM remains upper triangular over A[T], since its entries below the diagonal are zero. Apply native det_of_isUpperTriangular and compute its diagonal entries. This direct determinant proof does not need roots or a domain hypothesis.

**Acceptance checks.** The empty product is one; repeated and zero diagonal entries keep their full multiplicities.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread.. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Finite spectral mapping for triangular matrices

`L4/spectral-triangular-comparison` · comparison.

If M is upper triangular and degree(B)≤m, then D_(N,m)(B,P_M)=P_(B(M)).

**Hypotheses.** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant. I has a linear order, M is upper triangular, and m bounds the degree of B.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-triangular-characteristic`, `LocallyAnalyticDistributions:L4/spectral-triangular-evaluation`, `LocallyAnalyticDistributions:L4/spectral-triangular-evaluation-diagonal`, `LocallyAnalyticDistributions:L4/spectral-split-factors`.

**Proof outline.** Write P_M as its product of N diagonal linear factors. Apply the existing finite spectral split-product law, allowing repetitions and zero diagonal entries. Polynomial evaluation remains triangular and evaluates each diagonal entry by B. Apply the triangular characteristic-factor lemma to B(M) and identify the products. The rank is N throughout; B(0) need not vanish because the finite matrix rank is specified.

**Unit tests.**

- `CharacteristicTests.empty_matrix` (degenerate): Over the integers, the empty matrix with B=1 gives D_(0,0)(1,P_M)=1.
- `CharacteristicTests.constant_operator` (non-example): Over the integers, for the zero matrix of size two and B=1, D_(2,0)(1,P_M)=(1−T)^2. Replacing the rank bound by degree(P_M)=0 would incorrectly give one.
- `CharacteristicTests.jordan_transform` (computation): Over ZMod8, let J have rows (2,1) and (0,2), and let B(Y)=Y+Y^2. Then D_(2,2)(B,P_J)=1+4T+4T^2.
- `CharacteristicTests.jordan_aeval` (computation): For the same J and B over ZMod8, B(J) has rows (6,5) and (0,6). Its nonzero off-diagonal entry is retained by the native polynomial calculus.

**Acceptance checks.** This is a finite polynomial instance of the operator step in A3.9. It does not prove existence of a triangularizing basis for an arbitrary matrix.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread.. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Similarity commutes with polynomial calculus

`L4/spectral-evaluation-conjugation` · lemma.

For a matrix unit U and every polynomial B, B(UMU⁻¹)=UB(M)U⁻¹.

**Hypotheses.** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant.

**Inputs.** `mathlib:Polynomial.induction_on`, `mathlib:Algebra.algebraMap_eq_smul_one`.

**Proof outline.** Prove the power identity by induction, cancelling adjacent U⁻¹U. The exponent-zero case uses UU⁻¹=1. Apply native polynomial induction. Scalar matrices are central, expressed through the scalar action on the identity; distribute conjugation over sums and use the power identity on monomials.

**Acceptance checks.** No characteristic, invertibility of M, degree or constant-term restriction is imposed.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread.. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Scalar extension of matrix polynomial calculus

`L4/spectral-evaluation-coefficients` · lemma.

For every ring homomorphism f:A→S, entrywise mapping of B(M) gives f(B)(f(M)).

**Hypotheses.** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant.

**Inputs.** `mathlib:RingHom.mapMatrix`, `mathlib:Matrix.algebraMap_matrix_apply`, `mathlib:Polynomial.map_aeval_eq_aeval_map`.

**Proof outline.** Use the native ring homomorphism mapMatrix. The scalar-entry formula proves that the two coefficient algebra maps commute with f. Apply native map_aeval_eq_aeval_map to that commuting square. No new evaluation or matrix-map carrier is defined.

**Acceptance checks.** Noninjective coefficient maps are allowed; both the matrix and polynomial coefficients must be mapped.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread.. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Spectral mapping from a triangularizing similarity

`L4/spectral-similarity-comparison` · comparison.

Suppose U is a matrix unit and UMU⁻¹ is upper triangular. For degree(B)≤m, D_(N,m)(B,P_M)=P_(B(M)).

**Hypotheses.** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant. I has a linear order; a matrix unit U is given such that UMU⁻¹ is upper triangular; degree(B)≤m.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-triangular-comparison`, `LocallyAnalyticDistributions:L4/spectral-matrix-conjugation`, `LocallyAnalyticDistributions:L4/spectral-evaluation-conjugation`.

**Proof outline.** Apply the triangular comparison to UMU⁻¹. Use similarity invariance of the characteristic series on the input, conjugation compatibility of polynomial calculus on the output, and characteristic-series similarity invariance again.

**Acceptance checks.** A triangularizing unit is an explicit hypothesis, not hidden in a proof step.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread.. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Faithful descent of finite spectral mapping

`L4/spectral-faithful-comparison` · comparison.

Let f:A→S be injective and U a matrix unit over S such that U f(M) U⁻¹ is upper triangular. If degree(B)≤m, then D_(N,m)(B,P_M)=P_(B(M)) over A.

**Hypotheses.** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant. I has a linear order; the coefficient map f is injective; a triangularizing matrix unit U over S is supplied; degree(B)≤m.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-similarity-comparison`, `LocallyAnalyticDistributions:L4/spectral-scalar-extension`, `LocallyAnalyticDistributions:L4/spectral-matrix-coefficients`, `LocallyAnalyticDistributions:L4/spectral-evaluation-coefficients`, `mathlib:Polynomial.map_injective`, `mathlib:Polynomial.natDegree_map_le`.

**Proof outline.** Apply the injectivity of the induced polynomial coefficient map. The existing spectral scalar-extension law, the characteristic-series coefficient law and the matrix-calculus coefficient law identify the two images with the corresponding expressions for f(M) and f(B). The mapped polynomial still has degree at most m by native natDegree_map_le. Apply the similarity comparison over S. No existence of f or U is asserted.

**Acceptance checks.** Injectivity is essential for this descent argument. Specializing only to residue fields cannot detect nilpotent coefficient errors.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread.. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Universal polynomial coefficients

`L4/spectral-universal-polynomial` · construction.

Define B_(N,m)(Y)=Σ_(i=0)^m b_iY^i in U_(N,m)[Y], using coefficient inclusion from C_m and native Polynomial.ofFn of length m+1.

**Hypotheses.** For natural numbers N,m put C_m=ℤ[b₀,…,b_m] and U_(N,m)=C_m[xᵢⱼ: i,j∈Fin N], both native multivariate polynomial rings. Write G for native Matrix.mvPolynomialX over C_m, so Gᵢⱼ=xᵢⱼ. Coefficient variables b_i and matrix-entry variables xᵢⱼ are distinct. P_M(T)=det(1−TM) is native Matrix.charpolyRev. D_(N,m) is the existing bounded spectral resultant, with matrix rank N retained even if the actual degree of P_M drops.

**Inputs.** `mathlib:Polynomial.ofFn`, `mathlib:Polynomial.ofFn_coeff_eq_val_of_lt`, `mathlib:Polynomial.ofFn_coeff_eq_zero_of_ge`.

**Proof outline.** Use the native coefficient-vector constructor on the vector whose ith value is the constant-in-matrix-variables copy of b_i. This is a polynomial in Y over U_(N,m), not a new polynomial type. The low and high coefficient formulas are precisely the two native ofFn coefficient lemmas. These formulas pin the constant coefficient, zero-dimensional matrix case and the separation of the two families of variables.

**Uses.** Coleman A3.9 finite step: Makes every coefficient of the functional-calculus polynomial independent of the matrix entries before universal descent. spectral-specialization-polynomial: The coefficient formula recovers every bounded-degree target polynomial under specialization.

**API.**

| Declaration | Contract |
|---|---|
| `spectralUniversalPolynomial_def` | The polynomial is native ofFn of length m+1 with coefficient vector i↦b_i included into U_(N,m). |
| `spectralUniversalPolynomial_coeff` | Its coefficient at i≤m is the included variable b_i. |
| `spectralUniversalPolynomial_natDegree_le` | Its natural degree is at most m; promoted as spectral-universal-degree. |

**Unit tests.**

- `UniversalTests.constant` (computation): For N=2,m=0 the universal polynomial is the constant polynomial b₀.
- `UniversalTests.high_coefficient` (degenerate): For N=2,m=1 its coefficient at2 is zero.
- `UniversalTests.empty_matrix` (compatibility): For N=0,m=1 its coefficient at1 is still b₁, included into the empty-entry polynomial ring.

**Acceptance checks.** All mathematical statuses remain unchecked; specialization retains nilpotent coefficients and the explicit rank.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026.. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Degree bound for the universal polynomial

`L4/spectral-universal-degree` · lemma.

The natural degree of B_(N,m) is at most m, including m=0 and N=0.

**Hypotheses.** For natural numbers N,m put C_m=ℤ[b₀,…,b_m] and U_(N,m)=C_m[xᵢⱼ: i,j∈Fin N], both native multivariate polynomial rings. Write G for native Matrix.mvPolynomialX over C_m, so Gᵢⱼ=xᵢⱼ. Coefficient variables b_i and matrix-entry variables xᵢⱼ are distinct. P_M(T)=det(1−TM) is native Matrix.charpolyRev. D_(N,m) is the existing bounded spectral resultant, with matrix rank N retained even if the actual degree of P_M drops.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-universal-polynomial`, `mathlib:Polynomial.ofFn_natDegree_lt`.

**Proof outline.** Apply the native ofFn natural-degree bound at the positive length m+1 to the coefficient vector defining B_(N,m). Convert natural degree less than m+1 to natural degree at most m. No degree equality or nonvanishing of the top specialized coefficient is needed.

**Acceptance checks.** All mathematical statuses remain unchecked; specialization retains nilpotent coefficients and the explicit rank.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026.. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Simultaneous coefficient and matrix specialization

`L4/spectral-specialization` · construction.

For a commutative ring R, a matrix M on Fin N and any B∈R[Y], define the ring homomorphism σ_(m,M,B):U_(N,m)→R by b_i↦coeff_i(B), xᵢⱼ↦Mᵢⱼ and the canonical integer map. This map is defined without a degree bound on B.

**Hypotheses.** For natural numbers N,m put C_m=ℤ[b₀,…,b_m] and U_(N,m)=C_m[xᵢⱼ: i,j∈Fin N], both native multivariate polynomial rings. Write G for native Matrix.mvPolynomialX over C_m, so Gᵢⱼ=xᵢⱼ. Coefficient variables b_i and matrix-entry variables xᵢⱼ are distinct. P_M(T)=det(1−TM) is native Matrix.charpolyRev. D_(N,m) is the existing bounded spectral resultant, with matrix rank N retained even if the actual degree of P_M drops. R and S are arbitrary commutative rings, with no nontriviality, characteristic or reducedness hypothesis.

**Inputs.** `mathlib:MvPolynomial.eval₂Hom`, `mathlib:MvPolynomial.eval₂Hom_C`, `mathlib:MvPolynomial.eval₂Hom_X'`, `mathlib:MvPolynomial.comp_eval₂Hom`.

**Proof outline.** First use native eval₂Hom to send C_m to R by the integer map and the first m+1 coefficients of B. Use eval₂Hom again, with that homomorphism on constants and the matrix entries as the outer variables. The native C and X formulas give both generator equations. For a ring map f:R→S, apply native comp_eval₂Hom twice. Integer maps agree and polynomial coefficients map entrywise, so f composed with σ_(m,M,B) is σ_(m,f(M),f(B)). This statement permits noninjective maps.

**Uses.** Coleman A3.9 finite step: Specializes the universal identity to all matrices and all bounded-degree polynomials over the target ring, preserving nilpotents. spectral-generic-discriminant: Supplies the rational diagonal specialization that detects a nonzero universal discriminant.

**API.**

| Declaration | Contract |
|---|---|
| `spectralSpecialization_def` | The homomorphism is the nested native eval₂Hom with integer coefficients, the first m+1 coefficients of B, and the entries of M. |
| `spectralSpecialization_entry` | The image of xᵢⱼ is Mᵢⱼ. |
| `spectralSpecialization_coefficient` | The image of the included b_i is coeff_i(B) for i≤m. |
| `spectralSpecialization_comp` | Composition with f:R→S equals specialization at the entrywise mapped matrix and coefficientwise mapped polynomial; identity and successive composition follow. |
| `spectralSpecialization_matrix` | Entrywise specialization of native G is M; promoted. |
| `spectralSpecialization_polynomial` | If natural degree(B)≤m, specialization of B_(N,m) is B; promoted. |

**Unit tests.**

- `SpecializationTests.entry` (computation): Over ZMod8, with M=[[2,1],[2,2]], m=1 and B=3+5Y, σ(x₀₁)=1.
- `SpecializationTests.coefficient` (computation): For the same inputs, σ(b₁)=5, distinguishing polynomial coefficients from matrix entries.
- `SpecializationTests.empty` (degenerate): For the empty integer matrix, m=1 and B=Y+1, specialization of B_(0,1) is Y+1.
- `SpecializationTests.noninjective` (non-example): For the zero 1×1 matrix over ZMod8, m=0 and B=0, σ(8)=0. Specialization is not assumed injective.

**Acceptance checks.** All mathematical statuses remain unchecked; specialization retains nilpotent coefficients and the explicit rank.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026.. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Specialization of the native generic matrix

`L4/spectral-specialization-matrix` · lemma.

Entrywise application of σ_(m,M,B) sends G to M for every commutative ring R, every matrix M and every polynomial B.

**Hypotheses.** For natural numbers N,m put C_m=ℤ[b₀,…,b_m] and U_(N,m)=C_m[xᵢⱼ: i,j∈Fin N], both native multivariate polynomial rings. Write G for native Matrix.mvPolynomialX over C_m, so Gᵢⱼ=xᵢⱼ. Coefficient variables b_i and matrix-entry variables xᵢⱼ are distinct. P_M(T)=det(1−TM) is native Matrix.charpolyRev. D_(N,m) is the existing bounded spectral resultant, with matrix rank N retained even if the actual degree of P_M drops.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-specialization`, `mathlib:Matrix.mvPolynomialX`, `mathlib:Matrix.mvPolynomialX_map_eval₂`.

**Proof outline.** Unfold only the displayed specialization homomorphism. Apply native Matrix.mvPolynomialX_map_eval₂ with the inner coefficient homomorphism. The result is entrywise equality, with no degree hypothesis on B and no injectivity condition.

**Acceptance checks.** All mathematical statuses remain unchecked; specialization retains nilpotent coefficients and the explicit rank.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026.. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Recovery of a bounded polynomial

`L4/spectral-specialization-polynomial` · lemma.

If B∈R[Y] has natural degree at most m, then coefficientwise application of σ_(m,M,B) to B_(N,m) is B.

**Hypotheses.** For natural numbers N,m put C_m=ℤ[b₀,…,b_m] and U_(N,m)=C_m[xᵢⱼ: i,j∈Fin N], both native multivariate polynomial rings. Write G for native Matrix.mvPolynomialX over C_m, so Gᵢⱼ=xᵢⱼ. Coefficient variables b_i and matrix-entry variables xᵢⱼ are distinct. P_M(T)=det(1−TM) is native Matrix.charpolyRev. D_(N,m) is the existing bounded spectral resultant, with matrix rank N retained even if the actual degree of P_M drops.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-universal-polynomial`, `LocallyAnalyticDistributions:L4/spectral-specialization`, `mathlib:Polynomial.ofFn_coeff_eq_val_of_lt`, `mathlib:Polynomial.ofFn_coeff_eq_zero_of_ge`.

**Proof outline.** Compare coefficients. For i<m+1, the native ofFn formula and the specialization equation for b_i give coeff_i(B). For i≥m+1, the native high coefficient formula gives zero; the degree bound on B makes its coefficient zero too. This proves equality even when coefficients vanish under a further ring map. The condition controls only polynomial recovery. The specialization homomorphism itself is defined for all B.

**Acceptance checks.** All mathematical statuses remain unchecked; specialization retains nilpotent coefficients and the explicit rank.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026.. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Nonzero discriminant of the generic matrix

`L4/spectral-generic-discriminant` · lemma.

The discriminant of the characteristic polynomial of G over U_(N,m) is nonzero.

**Hypotheses.** For natural numbers N,m put C_m=ℤ[b₀,…,b_m] and U_(N,m)=C_m[xᵢⱼ: i,j∈Fin N], both native multivariate polynomial rings. Write G for native Matrix.mvPolynomialX over C_m, so Gᵢⱼ=xᵢⱼ. Coefficient variables b_i and matrix-entry variables xᵢⱼ are distinct. P_M(T)=det(1−TM) is native Matrix.charpolyRev. D_(N,m) is the existing bounded spectral resultant, with matrix rank N retained even if the actual degree of P_M drops.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-specialization-matrix`, `mathlib:Matrix.charpoly_map`, `mathlib:Matrix.charpoly_monic`, `mathlib:Matrix.charpoly_diagonal`, `mathlib:Polynomial.separable_prod_X_sub_C_iff`, `tauceti:Polynomial.Monic.discr_map`, `tauceti:Polynomial.Monic.discr_ne_zero_iff`.

**Proof outline.** Specialize into ℚ by taking B=0 and the diagonal matrix with ith entry the integer i. Native matrix specialization, charpoly_map and monic discriminant base change identify the image of the generic discriminant with that diagonal matrix’s characteristic discriminant. The diagonal characteristic polynomial is the product of Y−i for i∈Fin N. The map i↦(i:ℚ) is injective. Native separable_prod_X_sub_C_iff makes this product separable, and the pinned field discriminant criterion makes its discriminant nonzero. If the original discriminant were zero, every ring homomorphism would send it to zero, contradicting this rational specialization. At N=0 the product is1, separable with discriminant1, so the same argument covers the empty matrix.

**Acceptance checks.** The statement is nonvanishing in the universal integral domain. It does not assert ring-level separability over U_(N,m): nonzero discriminant need not be a unit.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026.. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Generic separability in a faithful field extension

`L4/spectral-generic-separability` · lemma.

For a field K and an injective ring homomorphism f:U_(N,m)→K, the characteristic polynomial of f(G) is separable over K.

**Hypotheses.** For natural numbers N,m put C_m=ℤ[b₀,…,b_m] and U_(N,m)=C_m[xᵢⱼ: i,j∈Fin N], both native multivariate polynomial rings. Write G for native Matrix.mvPolynomialX over C_m, so Gᵢⱼ=xᵢⱼ. Coefficient variables b_i and matrix-entry variables xᵢⱼ are distinct. P_M(T)=det(1−TM) is native Matrix.charpolyRev. D_(N,m) is the existing bounded spectral resultant, with matrix rank N retained even if the actual degree of P_M drops. K is a field and the displayed ring homomorphism f from the universal ring is injective.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-generic-discriminant`, `mathlib:Matrix.charpoly_monic`, `mathlib:Matrix.charpoly_map`, `tauceti:Polynomial.Monic.separable_map_iff_map_discr_ne_zero`.

**Proof outline.** The previous node gives a nonzero discriminant in U_(N,m), hence a nonzero image under the specified injective map f. Apply the pinned monic separable_map_iff_map_discr_ne_zero to the monic characteristic polynomial of G, then use native charpoly_map to identify its mapped polynomial with the characteristic polynomial of f(G).

**Acceptance checks.** There is no conclusion about separability after arbitrary specialization; repeated characteristic roots in target rings are allowed.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026.. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Numbering distinct characteristic roots

`L4/spectral-distinct-root-enumeration` · lemma.

Let M be an N×N matrix over a field K. If its characteristic polynomial is separable and splits over K, there is an injective function r:Fin N→K whose values are roots of that polynomial.

**Hypotheses.** K is a field; M is a square matrix indexed by Fin N; its native characteristic polynomial is separable and splits in K.

**Inputs.** `mathlib:Polynomial.card_rootSet_eq_natDegree`, `mathlib:Polynomial.mem_rootSet`, `mathlib:Matrix.charpoly_natDegree_eq_dim`, `mathlib:Matrix.charpoly_monic`.

**Proof outline.** Apply the native cardinality theorem for the root set to the separable characteristic polynomial and its splitting over K. Native charpoly_natDegree_eq_dim identifies its degree with N. Choose a finite-set equivalence from Fin N to the native root set; composing with subtype inclusion gives the injective function. Native mem_rootSet identifies each selected value as a root, using the nonzero monic characteristic polynomial. For N=0 the root set is empty and the unique empty function works; no nonempty-index assumption is introduced.

**Acceptance checks.** Both splitting and separability are explicit. No claim is made for a nonsplit polynomial or a repeated root.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026.. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### An eigenbasis from distinct characteristic roots

`L4/spectral-eigenbasis` · lemma.

For an N×N matrix M over a field K and an injective function r:Fin N→K whose values are characteristic roots, there exists a native basis b of K^N indexed by Fin N satisfying M b_i=r_i b_i for every i.

**Hypotheses.** K is a field; r is injective and all its N values are characteristic roots of M.

**Inputs.** `mathlib:Matrix.charpoly_mulVecLin`, `mathlib:Module.End.hasEigenvalue_iff_isRoot_charpoly`, `mathlib:Module.End.HasEigenvalue.exists_hasEigenvector`, `mathlib:Module.End.eigenvectors_linearIndependent'`, `mathlib:basisOfLinearIndependentOfCardEqFinrank'`, `mathlib:Module.finrank_fintype_fun_eq_card`, `mathlib:Module.End.HasEigenvector.apply_eq_smul`.

**Proof outline.** Regard M as the native endomorphism mulVecLin. Native charpoly_mulVecLin and hasEigenvalue_iff_isRoot_charpoly turn every specified root into an eigenvalue. Choose a nonzero eigenvector for each eigenvalue using HasEigenvalue.exists_hasEigenvector. Native eigenvectors_linearIndependent′ proves independence because r is injective. The native finrank of K^N is N. Apply basisOfLinearIndependentOfCardEqFinrank′, whose primed version covers the empty-index case; its vectors are exactly the chosen ones. Native HasEigenvector.apply_eq_smul gives the displayed equations.

**Acceptance checks.** The conclusion uses the native basis type and is existential. No new eigenbasis carrier or generic diagonalizability predicate is defined.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026.. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Diagonal similarity from an eigenbasis

`L4/spectral-eigenbasis-conjugation` · lemma.

Given a native basis b of K^N and scalars r_i with M b_i=r_i b_i, there is a matrix unit U such that UMU⁻¹ is the diagonal matrix with entries r_i.

**Hypotheses.** K is a field; b is a native basis of K^N indexed by Fin N; the displayed eigenvector equations are given. Distinctness is not required for this basis-change lemma.

**Inputs.** `mathlib:Module.Basis.toMatrix_mul_toMatrix_flip`, `mathlib:basis_toMatrix_mul_linearMap_toMatrix_mul_basis_toMatrix`.

**Proof outline.** Let E be the standard basis and set U=b.toMatrix(E), with inverse E.toMatrix(b). The two native basis change products equal1, giving a unit rather than merely a nonzero determinant. The native basis-change formula identifies UMU⁻¹ with the matrix of mulVecLin M in b. Evaluate that matrix on basis vectors; the supplied eigenvector equations make column i equal r_i times the ith standard vector, so the matrix is diagonal. The direction of conjugation is fixed by choosing coordinates from E into b for U. The empty basis gives the empty matrix unit.

**Acceptance checks.** The unit is U=b.toMatrix(E), not the matrix with b as columns; interchanging them reverses the conjugation formula.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026.. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### The universal finite spectral identity

`L4/spectral-universal-comparison` · lemma.

Over U_(N,m), D_(N,m)(B_(N,m),P_G)=P_(B_(N,m)(G)).

**Hypotheses.** For natural numbers N,m put C_m=ℤ[b₀,…,b_m] and U_(N,m)=C_m[xᵢⱼ: i,j∈Fin N], both native multivariate polynomial rings. Write G for native Matrix.mvPolynomialX over C_m, so Gᵢⱼ=xᵢⱼ. Coefficient variables b_i and matrix-entry variables xᵢⱼ are distinct. P_M(T)=det(1−TM) is native Matrix.charpolyRev. D_(N,m) is the existing bounded spectral resultant, with matrix rank N retained even if the actual degree of P_M drops.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-universal-degree`, `LocallyAnalyticDistributions:L4/spectral-generic-separability`, `LocallyAnalyticDistributions:L4/spectral-distinct-root-enumeration`, `LocallyAnalyticDistributions:L4/spectral-eigenbasis`, `LocallyAnalyticDistributions:L4/spectral-eigenbasis-conjugation`, `LocallyAnalyticDistributions:L4/spectral-faithful-comparison`, `mathlib:FractionRing`, `mathlib:IsFractionRing.injective`, `mathlib:AlgebraicClosure`, `mathlib:RingHom.injective`, `mathlib:IsAlgClosed`.

**Proof outline.** U_(N,m) is an integral domain by the native integer and multivariate-polynomial instances. Use the native fraction field and its algebraic closure K. Compose the injective localization map with the field embedding into K to obtain an injective ring map f:U_(N,m)→K. The generic separability lemma and the native algebraic-closure splitting property provide the hypotheses of the distinct-root numbering lemma for f(G). The eigenbasis lemma and its conjugation lemma then provide a unit diagonalizing f(G). A diagonal matrix is upper triangular by its entry formula. Apply the retained spectral-faithful-comparison node to G, B_(N,m), f and this diagonalizing unit, using the universal degree bound. This descends the equality to the universal domain, with the explicit rank N. Only the universal domain is embedded into a field. The final target ring does not occur in this step; no equality is inferred merely by testing its residue fields.

**Acceptance checks.** All mathematical statuses remain unchecked; specialization retains nilpotent coefficients and the explicit rank.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026.. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Finite spectral mapping over any coefficient ring

`L4/spectral-finite-specialization` · lemma.

For every commutative ring R, every N×N matrix M, and every B∈R[Y] with natural degree at most m, D_(N,m)(B,P_M)=P_(B(M)).

**Hypotheses.** R is any commutative ring; M is indexed by Fin N; B has natural degree at most m. No condition B(0)=0 is imposed at fixed finite rank.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-universal-comparison`, `LocallyAnalyticDistributions:L4/spectral-specialization-matrix`, `LocallyAnalyticDistributions:L4/spectral-specialization-polynomial`, `LocallyAnalyticDistributions:L4/spectral-scalar-extension`, `LocallyAnalyticDistributions:L4/spectral-matrix-coefficients`, `LocallyAnalyticDistributions:L4/spectral-evaluation-coefficients`.

**Proof outline.** Apply coefficient mapping by σ_(m,M,B) to the universal comparison equality. On the left, the retained fixed-bound scalar-extension law for D commutes with this map; native-matrix specialization, universal-polynomial recovery and the retained characteristic-series scalar-extension lemma identify the input as B and P_M. On the right, retained polynomial-calculus scalar extension and characteristic-series scalar extension identify the image with P_(B(M)). The specialization homomorphism is permitted to have a kernel, so the argument applies to zero divisors, nilpotents and the zero ring.

**Acceptance checks.** All mathematical statuses remain unchecked; specialization retains nilpotent coefficients and the explicit rank.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026.. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Reindexing a characteristic series

`L4/spectral-characteristic-reindex` · lemma.

For a bijection e:I→J between finite index types, P_(reindex_e M)=P_M.

**Hypotheses.** R is a commutative ring; I and J are finite types with decidable equality; e is a bijection.

**Inputs.** `mathlib:Matrix.reverse_charpoly`, `mathlib:Matrix.charpoly_reindex`.

**Proof outline.** Use the native reverse_charpoly identity on each matrix and the native charpoly_reindex theorem. Apply polynomial reversal to that equality. Reindexing does not change matrix rank. The argument is algebraic and includes empty indices and the zero ring.

**Acceptance checks.** All mathematical statuses remain unchecked; specialization retains nilpotent coefficients and the explicit rank.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026.. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Reindexing polynomial matrix calculus

`L4/spectral-evaluation-reindex` · lemma.

Reindexing B(M) along e:I→J equals B(reindex_e M).

**Hypotheses.** R is a commutative ring; I and J are finite types with decidable equality; e is a bijection; B is any polynomial.

**Inputs.** `mathlib:Matrix.reindexAlgEquiv`, `mathlib:Polynomial.aeval_algHom_apply`.

**Proof outline.** Use the native reindexAlgEquiv as an algebra homomorphism over R. Native aeval_algHom_apply states exactly that algebra evaluation commutes with this map; identify its underlying map with reindex.

**Acceptance checks.** All mathematical statuses remain unchecked; specialization retains nilpotent coefficients and the explicit rank.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026.. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Finite characteristic spectral mapping

`L4/spectral-matrix-comparison` · theorem.

For a finite square matrix M over any commutative ring R and B∈R[Y] of natural degree at most m, D_(|I|,m)(B,P_M)=P_(B(M)). The index set need not have an order, and B(0) may be nonzero.

**Hypotheses.** R is any commutative ring, including the zero ring; I is a finite type with decidable equality; natural degree(B)≤m. N is |I|, not the degree of P_M.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-finite-specialization`, `LocallyAnalyticDistributions:L4/spectral-characteristic-reindex`, `LocallyAnalyticDistributions:L4/spectral-evaluation-reindex`.

**Proof outline.** Choose the native equivalence I≃Fin |I| and apply the finite-specialization theorem to the reindexed matrix. Use characteristic-series reindexing on both sides and polynomial-calculus reindexing on the output. This removes the chosen enumeration from the equality. This is the unrestricted finite matrix comparison required by the finite step in Coleman A3.9. It does not by itself prove continuity or entireness of the infinite transform or transport the identity to compact operators.

**Unit tests.**

- `UniversalComparisonTests.dense_nilpotent` (computation): Over ZMod8, M=[[2,1],[2,2]] and B=Y+Y² give D_(2,2)(B,P_M)=1+6T². Here B(M)=[[0,5],[2,0]], P_M=1+4T+2T² and its discriminant is zero.
- `UniversalComparisonTests.constant` (computation): For the zero 2×2 matrix over ZMod8 and B=2, D_(2,0)(2,1)=1+4T+4T²; the rank remains2 although P_M has degree0.
- `UniversalComparisonTests.empty` (degenerate): For the empty integer matrix and B=1, D_(0,0)(1,P_M)=1.
- `UniversalComparisonTests.zero_ring` (degenerate): For any 2×2 matrix over ZMod1 and B=Y, D_(2,1)(Y,P_M)=P_M.

**Acceptance checks.** No diagonalization or embedding hypothesis is imposed on the final target matrix or ring. Nonzero B(0) is allowed in this finite theorem; the earlier B(0)=0 requirement for padding and the infinite problem remains.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026.. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Simultaneous reflection of the Sylvester matrix

`L4/spectral-sylvester-reflection` · lemma.

Reindex both axes of Sylvester(f,g;m,n) by the global reversal of Fin(m+n), followed by the canonical cast to Fin(n+m). The result is Sylvester(reflect_n(g),reflect_m(f);n,m).

**Hypotheses.** R is any commutative ring. The natural numbers m,n are explicit bounds for native Sylvester matrices and resultants; they are not silently replaced by actual degrees. A reflection is the native reflect at its specified exponent. Unless explicitly required, no degree, normalization, domain or nontriviality assumption is imposed.

**Inputs.** `mathlib:Polynomial.sylvester`, `mathlib:Polynomial.coeff_reflect`, `mathlib:Fin.revPerm`.

**Proof outline.** Read the native convention: the first m columns consist of shifted coefficients of g and the last n columns of shifted coefficients of f. Reversing the column order swaps these blocks and reverses each block. At each row and column, the global row reversal sends the allowed coefficient window to the reflected window. Use coeff_reflect and the explicit Sylvester entry formula, splitting on the two column blocks and the finite window inequalities. Both reindexings use the same equivalence. No separate permutation-sign formula is needed; empty blocks are covered by the same finite-index statement.

**Acceptance checks.** The reflection is at the supplied bounds. No actual-degree hypothesis is needed because the bounded matrix reads only its coefficient windows.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–435/PDF18–19: resultant norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete printed433–435 freshly read from the published copy.. Worker decomposition of the scalar limiting step in A3.8(11). Native simultaneous reversal/swap and finite remainder-coordinate continuity justify the exact comparison and its limit. This does not construct the general entire spectral transform or infer continuity of evaluation from the coefficientwise topology.

### Reciprocal resultant with swapped factors

`L4/spectral-resultant-reflection` · lemma.

Res(reflect_m(f),reflect_n(g);m,n)=Res(g,f;n,m).

**Hypotheses.** R is any commutative ring. The natural numbers m,n are explicit bounds for native Sylvester matrices and resultants; they are not silently replaced by actual degrees. A reflection is the native reflect at its specified exponent. Unless explicitly required, no degree, normalization, domain or nontriviality assumption is imposed.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-sylvester-reflection`, `mathlib:Matrix.det_reindex_self`, `mathlib:Polynomial.reflect_reflect`, `mathlib:Polynomial.resultant`.

**Proof outline.** Apply the preceding matrix identity to the reflected inputs and take determinants. Native det_reindex_self removes the simultaneous permutation. Native reflect_reflect restores the original polynomials, and the native resultant definition identifies the determinants. The reflected factors are swapped in the conclusion. This is exactly the cancellation of the two customary resultant signs, valid over rings with nilpotents and in characteristic2.

**Acceptance checks.** A formula with the reflected factors in the original order would generally retain a sign; this swapped formula has none.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–435/PDF18–19: resultant norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete printed433–435 freshly read from the published copy.. Worker decomposition of the scalar limiting step in A3.8(11). Native simultaneous reversal/swap and finite remainder-coordinate continuity justify the exact comparison and its limit. This does not construct the general entire spectral transform or infer continuity of evaluation from the coefficientwise topology.

### Finite reciprocal spectral evaluation

`L4/spectral-reciprocal-evaluation` · comparison.

For monic Q of degree d and P.natDegree≤n, D_(n,d)(1−Q.reverse,P)(1)=Res(Q,P;d,P.natDegree).

**Hypotheses.** R is any commutative ring. The natural numbers m,n are explicit bounds for native Sylvester matrices and resultants; they are not silently replaced by actual degrees. A reflection is the native reflect at its specified exponent. Unless explicitly required, no degree, normalization, domain or nontriviality assumption is imposed. Q is monic; d=Q.natDegree; P.natDegree≤n. The finite statement itself does not require P(0)=1.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-polynomial-evaluation`, `LocallyAnalyticDistributions:L4/spectral-resultant-reflection`, `mathlib:Polynomial.reverse`, `tauceti:Polynomial.Monic.resultant_of_le`.

**Proof outline.** Use spectral-polynomial-evaluation at t=1. The second resultant argument becomes Q.reverse and the first remains reflect_n(P), with bounds n,d. Native reverse is reflection at actual degree d. Apply spectral-resultant-reflection with f=P and g=Q to obtain Res(Q,P;d,n). Use native Monic.resultant_of_le with the valid bound P.natDegree≤n to replace its right degree bound by P.natDegree. No normalization of P is needed for this fixed-bound identity.

**Unit tests.**

- `ReciprocalLimitTests.unit_divisor` (degenerate): For every n and P over ℤ, D_(n,0)(0,P)(1)=1, agreeing with the empty resultant for Q=1.
- `ReciprocalLimitTests.linear_sign` (computation): Over ℤ, D_(1,1)(3T,1−2T)(1)=−5, the value of1−2T at3.
- `ReciprocalLimitTests.padding` (compatibility): Over ZMod8, D_(5,1)(2T,1+T²)(1)=5; the supplied rank5 may exceed the actual degree2.
- `ReciprocalLimitTests.unnormalized` (nonexample): Over ℤ, D_(0,2)(0,2)(1)=4 but D_(0,0)(0,2)(1)=1. The absence of P(0)=1 prevents auxiliary-bound independence.

**Acceptance checks.** The right bound is d even when 1−Q.reverse has smaller degree. Without P(0)=1 that bound cannot generally be lowered.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–435/PDF18–19: resultant norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete printed433–435 freshly read from the published copy.. Worker decomposition of the scalar limiting step in A3.8(11). Native simultaneous reversal/swap and finite remainder-coordinate continuity justify the exact comparison and its limit. This does not construct the general entire spectral transform or infer continuity of evaluation from the coefficientwise topology.

### A fixed-size resultant of the monic remainder

`L4/resultant-remainder-fixed-bound` · lemma.

For monic Q of degree d and every polynomial P, Res(Q,P;d,P.natDegree)=Res(Q,P modByMonic Q;d,d).

**Hypotheses.** R is any commutative ring. The natural numbers m,n are explicit bounds for native Sylvester matrices and resultants; they are not silently replaced by actual degrees. A reflection is the native reflect at its specified exponent. Unless explicitly required, no degree, normalization, domain or nontriviality assumption is imposed. Q is monic of degree d.

**Inputs.** `tauceti:AdjoinRoot.norm_mk_eq_resultant`, `mathlib:Polynomial.modByMonic_add_div`, `mathlib:Polynomial.degree_modByMonic_lt`, `tauceti:Polynomial.Monic.resultant_of_le`.

**Proof outline.** The native monic division identity shows that P and P modByMonic Q have the same class in AdjoinRoot Q. Apply the existing native norm_mk_eq_resultant to both representatives. Their algebra norms agree because their quotient classes agree; no topology on that quotient is invoked. The native degree bound for the remainder implies its natural degree is at most d (also when d=0 and the remainder is0). Apply Monic.resultant_of_le to replace the right degree bound by d.

**Unit tests.**

- `ReciprocalLimitTests.zero_polynomial` (degenerate): Over ℤ, Res(T,0;1,0)=0; only the degree-zero divisor has resultant1 against zero.

**Acceptance checks.** The matrix size in the final expression depends only on Q, even as the degree of P grows.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–435/PDF18–19: resultant norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete printed433–435 freshly read from the published copy.. Worker decomposition of the scalar limiting step in A3.8(11). Native simultaneous reversal/swap and finite remainder-coordinate continuity justify the exact comparison and its limit. This does not construct the general entire spectral transform or infer continuity of evaluation from the coefficientwise topology.

### Continuity of a fixed coefficient resultant

`L4/resultant-coordinate-continuity` · lemma.

For fixed Q and m,n, the function v↦Res(Q,Polynomial.ofFn(n+1,v);m,n) from the native finite product R^(n+1) to R is continuous.

**Hypotheses.** R is any topological commutative ring with continuous addition and multiplication. Q is a fixed native polynomial and m,n are fixed natural numbers. The domain has the native finite product topology.

**Inputs.** `mathlib:Polynomial.ofFn_coeff_eq_val_of_lt`, `mathlib:Polynomial.ofFn_coeff_eq_zero_of_ge`, `mathlib:Polynomial.sylvester`, `mathlib:Polynomial.resultant`, `mathlib:Continuous.matrix_det`.

**Proof outline.** The existing ofFn coefficient formulas say that each coefficient of the encoded polynomial is a coordinate projection or0. Classical decidable coefficient equality is used only to express that native constructor. In the native Sylvester matrix, each entry is therefore a constant depending on Q, a coordinate projection, or0, selected by a fixed finite-index inequality. Thus the matrix-valued function is continuous. Apply native Continuous.matrix_det and the native definition of the bounded resultant. This avoids imposing any topology on Polynomial R, AdjoinRoot Q or the algebra norm.

**Acceptance checks.** The dimensions m,n are fixed. This lemma does not assert convergence of resultants with unbounded matrix size.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–435/PDF18–19: resultant norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete printed433–435 freshly read from the published copy.. Worker decomposition of the scalar limiting step in A3.8(11). Native simultaneous reversal/swap and finite remainder-coordinate continuity justify the exact comparison and its limit. This does not construct the general entire spectral transform or infer continuity of evaluation from the coefficientwise topology.

### Truncation limit of each monic quotient coefficient

`L4/entire-quotient-truncation-limit` · lemma.

For every k≥0, coeff_k(S_Q(F_n)) converges to coeff_k(S_Q(F)) as n tends to infinity.

**Hypotheses.** A is a nontrivial complete normed commutative ring, with norm(1)=1 and ‖a+b‖≤max(‖a‖,‖b‖). Q is a monic native polynomial, d=Q.natDegree (including Q=1,d=0), and F is an existing entire power series: its weighted coefficients tend to zero at every positive radius. No field, splitting, reducedness or Noetherian hypothesis is used. Write F_n=PowerSeries.trunc(n+1,F), so coefficients through degree n are retained. S_Q(F) is the preceding entireMonicQuotient, and R_Q(F)=trunc_d(F−Q S_Q(F)) is its existing native polynomial remainder. Write Res(Q,F) for the preceding entireResultant, defined by the native finite-algebra norm.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-monic-quotient-coeff`, `LocallyAnalyticDistributions:L4/monic-reciprocal-tail-summable`, `mathlib:PowerSeries.coeff_trunc`, `mathlib:HasProd.tendsto_prod_nat`.

**Proof outline.** Let b_j be the coefficients of the native inverse of Q.reverse. The preceding quotient formula expresses the kth coefficient as the convergent sum of a_(k+d+j)b_j. For F_n, the native truncation formula retains precisely the terms with k+d+j≤n. Its quotient coefficient is the finite initial sum over j<n+1−(k+d); outside that range every summand is zero. The preceding monic-reciprocal-tail-summable theorem proves summability of the untruncated sequence. Native partial-sum convergence, composed with the cofinal cutoff n+1−(k+d), gives the limit. This step uses actual summability rather than exchanging an infinite sum with a pointwise limit.

**Unit tests.**

- `ReciprocalLimitTests.quotient_one` (compatibility): For Q=1, coeff_k(S_1(F_n)) converges to coeff_k(F), for every entire F and k.

**Acceptance checks.** Only individual quotient coefficients are asserted to converge; the bound and entireness nodes remain separate. Includes d=0 and k=0.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–435/PDF18–19: resultant norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete printed433–435 freshly read from the published copy.. Worker decomposition of the scalar limiting step in A3.8(11). Native simultaneous reversal/swap and finite remainder-coordinate continuity justify the exact comparison and its limit. This does not construct the general entire spectral transform or infer continuity of evaluation from the coefficientwise topology.

### Truncation limit of each monic remainder coefficient

`L4/entire-remainder-truncation-limit` · lemma.

For every k≥0, coeff_k(F_n modByMonic Q) converges to coeff_k(R_Q(F)).

**Hypotheses.** A is a nontrivial complete normed commutative ring, with norm(1)=1 and ‖a+b‖≤max(‖a‖,‖b‖). Q is a monic native polynomial, d=Q.natDegree (including Q=1,d=0), and F is an existing entire power series: its weighted coefficients tend to zero at every positive radius. No field, splitting, reducedness or Noetherian hypothesis is used. Write F_n=PowerSeries.trunc(n+1,F), so coefficients through degree n are retained. S_Q(F) is the preceding entireMonicQuotient, and R_Q(F)=trunc_d(F−Q S_Q(F)) is its existing native polynomial remainder. Write Res(Q,F) for the preceding entireResultant, defined by the native finite-algebra norm.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-monic-quotient-polynomial`, `LocallyAnalyticDistributions:L4/entire-quotient-truncation-limit`, `LocallyAnalyticDistributions:L4/entire-monic-division-remainder`, `mathlib:PowerSeries.coeff_trunc`, `mathlib:PowerSeries.coeff_mul`.

**Proof outline.** The existing entire-monic-quotient-polynomial comparison identifies the polynomial remainder of F_n with trunc_d(F_n−Q S_Q(F_n)). At k<d the coefficient of this difference is a_(n,k) minus a finite sum of fixed coefficients of Q times coefficients of S_Q(F_n). The native truncation coefficient is eventually a_k, and the preceding quotient-coefficient limits handle the finite sum. Continuity of finite sums, multiplication and subtraction gives the limit. At k≥d both truncated coefficients vanish by the existing degree bounds. This includes d=0, where the entire remainder is0.

**Acceptance checks.** This is convergence of the native remainder coefficients, not a topology claim for the entire quotient algebra.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–435/PDF18–19: resultant norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete printed433–435 freshly read from the published copy.. Worker decomposition of the scalar limiting step in A3.8(11). Native simultaneous reversal/swap and finite remainder-coordinate continuity justify the exact comparison and its limit. This does not construct the general entire spectral transform or infer continuity of evaluation from the coefficientwise topology.

### Entire resultant as a limit of polynomial resultants

`L4/entire-resultant-truncation-limit` · theorem.

Res(Q,F_n;d,F_n.natDegree) converges to the existing entire resultant Res(Q,F).

**Hypotheses.** A is a nontrivial complete normed commutative ring, with norm(1)=1 and ‖a+b‖≤max(‖a‖,‖b‖). Q is a monic native polynomial, d=Q.natDegree (including Q=1,d=0), and F is an existing entire power series: its weighted coefficients tend to zero at every positive radius. No field, splitting, reducedness or Noetherian hypothesis is used. Write F_n=PowerSeries.trunc(n+1,F), so coefficients through degree n are retained. S_Q(F) is the preceding entireMonicQuotient, and R_Q(F)=trunc_d(F−Q S_Q(F)) is its existing native polynomial remainder. Write Res(Q,F) for the preceding entireResultant, defined by the native finite-algebra norm.

**Inputs.** `LocallyAnalyticDistributions:L4/resultant-remainder-fixed-bound`, `LocallyAnalyticDistributions:L4/entire-remainder-truncation-limit`, `LocallyAnalyticDistributions:L4/resultant-coordinate-continuity`, `LocallyAnalyticDistributions:L4/entire-monic-division-remainder`, `LocallyAnalyticDistributions:L4/entire-monic-quotient-entire`, `LocallyAnalyticDistributions:L4/entire-quotient-class`, `LocallyAnalyticDistributions:L4/entire-resultants`, `tauceti:AdjoinRoot.norm_mk_eq_resultant`, `tauceti:Polynomial.Monic.resultant_of_le`, `mathlib:tendsto_pi_nhds`, `mathlib:Polynomial.ofFn_coeff_eq_val_of_lt`, `mathlib:Polynomial.ofFn_coeff_eq_zero_of_ge`.

**Proof outline.** Replace each polynomial resultant by the fixed-bound resultant of F_n modByMonic Q using resultant-remainder-fixed-bound. Its matrix dimensions are now d,d independently of n. Take the vector of coefficients0,…,d of each remainder. By entire-remainder-truncation-limit and native tendsto_pi_nhds, these vectors converge to the corresponding vector for R_Q(F). Native ofFn coefficient formulas reconstruct these polynomials because all coefficients above d vanish. Apply resultant-coordinate-continuity with dimensions d,d. Native monic bound-independence identifies the limiting fixed-bound resultant with the ordinary resultant of Q and R_Q(F). The existing entire division decomposition and entireAdjoinRoot_of_decomposition identify rho_Q(F) with the class of R_Q(F). Native norm_mk_eq_resultant and the existing entireResultant_norm identify this ordinary resultant with Res(Q,F). No continuity of the native algebra norm on an untopologized quotient is assumed.

**Acceptance checks.** Includes Q=1 with limit1, zero F with a positive-degree divisor and nonreduced coefficients. F need not have constant coefficient1.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–435/PDF18–19: resultant norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete printed433–435 freshly read from the published copy.. Worker decomposition of the scalar limiting step in A3.8(11). Native simultaneous reversal/swap and finite remainder-coordinate continuity justify the exact comparison and its limit. This does not construct the general entire spectral transform or infer continuity of evaluation from the coefficientwise topology.

### Scalar spectral limit with a fixed reciprocal polynomial

`L4/spectral-reciprocal-limit` · lemma.

D_(n,d)(1−Q.reverse,F_n)(1) converges to Res(Q,F).

**Hypotheses.** A is a nontrivial complete normed commutative ring, with norm(1)=1 and ‖a+b‖≤max(‖a‖,‖b‖). Q is a monic native polynomial, d=Q.natDegree (including Q=1,d=0), and F is an existing entire power series: its weighted coefficients tend to zero at every positive radius. No field, splitting, reducedness or Noetherian hypothesis is used. Write F_n=PowerSeries.trunc(n+1,F), so coefficients through degree n are retained. S_Q(F) is the preceding entireMonicQuotient, and R_Q(F)=trunc_d(F−Q S_Q(F)) is its existing native polynomial remainder. Write Res(Q,F) for the preceding entireResultant, defined by the native finite-algebra norm.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-reciprocal-evaluation`, `LocallyAnalyticDistributions:L4/entire-resultant-truncation-limit`, `mathlib:PowerSeries.natDegree_trunc_lt`.

**Proof outline.** The native degree bound for trunc(n+1,F) gives F_n.natDegree≤n. Apply spectral-reciprocal-evaluation at every n to replace the displayed value by the ordinary polynomial resultant of Q and F_n. Apply entire-resultant-truncation-limit.

**Unit tests.**

- `ReciprocalLimitTests.linear_limit` (compatibility): For Q=T−a, D_(n,1)(aT,F_n)(1) converges to the existing convergent evaluation F(a).

**Acceptance checks.** This proves the actual scalar sequence limit, including unnormalized F; it does not define D on general entire pairs.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–435/PDF18–19: resultant norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete printed433–435 freshly read from the published copy.. Worker decomposition of the scalar limiting step in A3.8(11). Native simultaneous reversal/swap and finite remainder-coordinate continuity justify the exact comparison and its limit. This does not construct the general entire spectral transform or infer continuity of evaluation from the coefficientwise topology.

### The normalized scalar limit in Coleman A3.8

`L4/spectral-simultaneous-truncation-limit` · theorem.

Assume F(0)=1 and let B=1−Q.reverse and B_n=trunc(n+1,B). Then D_(n,n)(B_n,F_n)(1) converges to Res(Q,F).

**Hypotheses.** A is a nontrivial complete normed commutative ring, with norm(1)=1 and ‖a+b‖≤max(‖a‖,‖b‖). Q is a monic native polynomial, d=Q.natDegree (including Q=1,d=0), and F is an existing entire power series: its weighted coefficients tend to zero at every positive radius. No field, splitting, reducedness or Noetherian hypothesis is used. Write F_n=PowerSeries.trunc(n+1,F), so coefficients through degree n are retained. S_Q(F) is the preceding entireMonicQuotient, and R_Q(F)=trunc_d(F−Q S_Q(F)) is its existing native polynomial remainder. Write Res(Q,F) for the preceding entireResultant, defined by the native finite-algebra norm. F.coeff0=1. B is the fixed native polynomial1−Q.reverse; its source truncations use coefficients through degree n.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-reciprocal-limit`, `LocallyAnalyticDistributions:L4/spectral-right-bound`, `LocallyAnalyticDistributions:L4/spectral-reversed-degree`, `mathlib:Polynomial.reverse`, `mathlib:Polynomial.natDegree_reflect_le`, `mathlib:PowerSeries.trunc_coe_eq_self`, `mathlib:PowerSeries.coeff_trunc`, `mathlib:PowerSeries.natDegree_trunc_lt`.

**Proof outline.** Since Q is monic, Q.reverse has constant coefficient1, hence B(0)=0; its natural degree is at most d. For n sufficiently large, native trunc_coe_eq_self gives B_n=B. Native coeff_trunc gives F_n(0)=1, and the natural degree of F_n is at most n. Its rank-n reversal is therefore monic, as in the preceding finite construction. For large n both n and d are valid right bounds for B. The existing spectral-right-bound theorem identifies D_(n,n)(B,F_n) and D_(n,d)(B,F_n), even if B has degree less than d. The simultaneous sequence is thus eventually equal to the fixed-B scalar sequence in spectral-reciprocal-limit. They have the same limit. This is precisely the scalar limiting equality required for A3.8(11), before the general entire D and its evaluation-continuity theorem are supplied.

**Unit tests.**

- `ReciprocalLimitTests.constant_entire` (degenerate): For F=1, the simultaneous scalar sequence converges to1 for every monic Q, including Q=1.

**Acceptance checks.** Retain F(0)=1 when comparing auxiliary bounds. No coefficientwise-series convergence is used to justify evaluation at1. A full D(1−Q*,F)(1) theorem still requires constructing entire D with the appropriate convergence.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, printed434–435/PDF18–19: resultant norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete printed433–435 freshly read from the published copy.. Worker decomposition of the scalar limiting step in A3.8(11). Native simultaneous reversal/swap and finite remainder-coordinate continuity justify the exact comparison and its limit. This does not construct the general entire spectral transform or infer continuity of evaluation from the coefficientwise topology.

### Entire series and native restrictedness

`L4/entire-native-restricted` · comparison.

F is entire if and only if it is native IsRestricted at every positive real radius.

**Hypotheses.** A is a normed commutative ring. Write G_R(F) for the existing native PowerSeries.gaussNorm applied to the coefficient norm and real radius R. IsEntire and gaussSize are the preceding packet interfaces; the comparisons below identify them with native restrictedness at every positive radius and the native Gauss norm. PowerSeries.trunc N retains precisely the coefficients of degrees less than N. Additional completeness, ultrametricity and norm-one assumptions are stated individually; no field, reducedness or Noetherian assumption is implicit.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:PowerSeries.isRestricted_iff'`, `tauceti:TauCeti.PowerSeries.hasGaussNorm_of_isRestricted`.

**Proof outline.** Unfold the existing entire predicate. At each radius apply the native univariate isRestricted_iff' statement, which already translates the multivariate cofinite indexing to the natural-number atTop filter. Consequently every entire F has native HasGaussNorm at every positive radius by the existing TauCeti restricted-series boundedness theorem. Do not replan that theorem or its weighted maximum argument.

**Acceptance checks.** The quantifier is every positive radius, not only the unit radius.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, complete published printed 432–436 / PDF 16–20 freshly read on 27 September 2026; entire coefficient decay on 432, division on 434, spectral truncation limit and Lemma A3.8 on 435.. Worker decomposition of the analytic convergence needed by the source limit. The native Gauss norm and restricted-series predicate already exist; the new estimates and completeness criterion do not construct the general spectral transform or assert its still-missing quantitative coefficient bounds.

### The native Gauss norm comparison

`L4/entire-native-gauss` · comparison.

For every real R and every power series F, the preceding gaussSize R F equals the native G_R(F).

**Hypotheses.** A is a normed commutative ring. Write G_R(F) for the existing native PowerSeries.gaussNorm applied to the coefficient norm and real radius R. IsEntire and gaussSize are the preceding packet interfaces; the comparisons below identify them with native restrictedness at every positive radius and the native Gauss norm. PowerSeries.trunc N retains precisely the coefficients of degrees less than N. Additional completeness, ultrametricity and norm-one assumptions are stated individually; no field, reducedness or Noetherian assumption is implicit.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:PowerSeries.gaussNorm_eq`.

**Proof outline.** Use native gaussNorm_eq to express the norm as the indexed supremum of ‖coeff_n(F)‖R^n. The indexed supremum is the supremum of its range, exactly the existing gaussSize expression. This is an equality of existing functions, not a new norm definition. Bounds using a supremum still require native HasGaussNorm; the equality alone provides no boundedness.

**Unit tests.**

- `EntireGaussTests.native_polynomial` (compatibility): For every polynomial P and real R, the preceding gaussSize of polynomialSeries(P) equals the native power-series Gauss norm of the actual polynomial coercion.

**Acceptance checks.** The comparison also holds for unbounded coefficient families under the native conditional-supremum convention, but no coefficient bound is inferred in that case.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, complete published printed 432–436 / PDF 16–20 freshly read on 27 September 2026; entire coefficient decay on 432, division on 434, spectral truncation limit and Lemma A3.8 on 435.. Worker decomposition of the analytic convergence needed by the source limit. The native Gauss norm and restricted-series predicate already exist; the new estimates and completeness criterion do not construct the general spectral transform or assert its still-missing quantitative coefficient bounds.

### Two-radius truncation estimate

`L4/entire-gauss-truncation-bound` · lemma.

If 0<R≤S and F has native HasGaussNorm at S, then G_R(F−trunc_N(F))≤G_S(F)(R/S)^N for every N≥0.

**Hypotheses.** A is a normed commutative ring. Write G_R(F) for the existing native PowerSeries.gaussNorm applied to the coefficient norm and real radius R. IsEntire and gaussSize are the preceding packet interfaces; the comparisons below identify them with native restrictedness at every positive radius and the native Gauss norm. PowerSeries.trunc N retains precisely the coefficients of degrees less than N. Additional completeness, ultrametricity and norm-one assumptions are stated individually; no field, reducedness or Noetherian assumption is implicit.

**Inputs.** `mathlib:PowerSeries.gaussNorm_eq`, `mathlib:PowerSeries.le_gaussNorm`, `mathlib:PowerSeries.gaussNorm_nonneg`, `mathlib:PowerSeries.coeff_trunc`, `mathlib:csSup_le`.

**Proof outline.** Native coeff_trunc says the difference coefficient is zero below N and the original coefficient at k≥N. For k≥N use the native coefficient bound at S and rewrite ‖coeff_k(F)‖R^k=(‖coeff_k(F)‖S^k)(R/S)^k. Since 0<R/S≤1 this is at most G_S(F)(R/S)^N. The resulting bound holds for every coefficient, including the zero head. Apply the native supremum upper-bound criterion. No completeness or ultrametricity is used.

**Unit tests.**

- `EntireGaussTests.tail_boundary` (computation): For F=aT^N and R>0 the truncation at N is zero and G_R(F−trunc_N(F))=‖a‖R^N.
- `EntireGaussTests.zero_truncation` (degenerate): The truncation at zero is zero, so its tail has the same Gauss norm as F.

**Acceptance checks.** The loss starts at N, not N+1. The boundary R=S is allowed, but yields no geometric decay.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, complete published printed 432–436 / PDF 16–20 freshly read on 27 September 2026; entire coefficient decay on 432, division on 434, spectral truncation limit and Lemma A3.8 on 435.. Worker decomposition of the analytic convergence needed by the source limit. The native Gauss norm and restricted-series predicate already exist; the new estimates and completeness criterion do not construct the general spectral transform or assert its still-missing quantitative coefficient bounds.

### Entire truncations converge at every radius

`L4/entire-gauss-truncation-convergence` · lemma.

If F is entire and R>0, then G_R(F−trunc_N(F)) tends to zero as N tends to infinity.

**Hypotheses.** A is a normed commutative ring. Write G_R(F) for the existing native PowerSeries.gaussNorm applied to the coefficient norm and real radius R. IsEntire and gaussSize are the preceding packet interfaces; the comparisons below identify them with native restrictedness at every positive radius and the native Gauss norm. PowerSeries.trunc N retains precisely the coefficients of degrees less than N. Additional completeness, ultrametricity and norm-one assumptions are stated individually; no field, reducedness or Noetherian assumption is implicit.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-native-restricted`, `tauceti:TauCeti.PowerSeries.hasGaussNorm_of_isRestricted`, `LocallyAnalyticDistributions:L4/entire-gauss-truncation-bound`, `mathlib:PowerSeries.gaussNorm_nonneg`, `mathlib:tendsto_pow_atTop_nhds_zero_of_lt_one`, `mathlib:squeeze_zero`.

**Proof outline.** Choose S=2R. Entire native restrictedness and the native boundedness theorem give HasGaussNorm at S. Apply the two-radius truncation estimate with ratio 1/2. The native geometric-power limit and nonnegativity of G_R squeeze the tail to zero.

**Acceptance checks.** This is convergence of the native Gauss norms at every positive radius; no new topology is installed.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, complete published printed 432–436 / PDF 16–20 freshly read on 27 September 2026; entire coefficient decay on 432, division on 434, spectral truncation limit and Lemma A3.8 on 435.. Worker decomposition of the analytic convergence needed by the source limit. The native Gauss norm and restricted-series predicate already exist; the new estimates and completeness criterion do not construct the general spectral transform or assert its still-missing quantitative coefficient bounds.

### Entire coefficient limits under radius bounds

`L4/entire-bounded-coefficient-limit` · lemma.

Let F_i be a sequence of entire series and f a formal power series. Assume every coefficient of F_i converges to that of f, and for every S>0 there is C_S≥0 with G_S(F_i)≤C_S for all i. Then f is entire.

**Hypotheses.** A is a normed commutative ring. Write G_R(F) for the existing native PowerSeries.gaussNorm applied to the coefficient norm and real radius R. IsEntire and gaussSize are the preceding packet interfaces; the comparisons below identify them with native restrictedness at every positive radius and the native Gauss norm. PowerSeries.trunc N retains precisely the coefficients of degrees less than N. Additional completeness, ultrametricity and norm-one assumptions are stated individually; no field, reducedness or Noetherian assumption is implicit.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-native-restricted`, `tauceti:TauCeti.PowerSeries.hasGaussNorm_of_isRestricted`, `mathlib:PowerSeries.gaussNorm_eq`, `mathlib:PowerSeries.le_gaussNorm`, `mathlib:PowerSeries.gaussNorm_nonneg`, `mathlib:le_of_tendsto`, `mathlib:tendsto_pow_atTop_nhds_zero_of_lt_one`, `mathlib:squeeze_zero`.

**Proof outline.** Fix S. Native restricted boundedness and le_gaussNorm give ‖coeff_k(F_i)‖S^k≤C_S. Norm continuity and the closed upper-bound limit theorem pass this inequality to coeff_k(f) for each k. For each R>0 use S=2R to bound ‖coeff_k(f)‖R^k by C_(2R)2^(−k). The native geometric limit and squeeze give the required coefficient decay. This proves actual native IsRestricted at every positive radius and hence the preceding IsEntire predicate. No completeness of A is needed because all coefficient limits are supplied.

**Unit tests.**

- `EntireGaussTests.radius_loss` (computation): For the moving monomial T^N in a norm-one ring, its Gauss norms at radii 1/2 and 2 are exactly (1/2)^N and 2^N. Small-radius decay supplies no large-radius bound.

**Acceptance checks.** A bound at one fixed radius does not imply entireness of the coefficient limit.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, complete published printed 432–436 / PDF 16–20 freshly read on 27 September 2026; entire coefficient decay on 432, division on 434, spectral truncation limit and Lemma A3.8 on 435.. Worker decomposition of the analytic convergence needed by the source limit. The native Gauss norm and restricted-series predicate already exist; the new estimates and completeness criterion do not construct the general spectral transform or assert its still-missing quantitative coefficient bounds.

### Bounded coefficient limits converge in Gauss norms

`L4/entire-bounded-gauss-limit` · theorem.

Under the preceding coefficient-limit and every-radius uniform-bound hypotheses, if A is ultrametric, then G_R(F_i−f) tends to zero for each R>0.

**Hypotheses.** A is a normed commutative ring. Write G_R(F) for the existing native PowerSeries.gaussNorm applied to the coefficient norm and real radius R. IsEntire and gaussSize are the preceding packet interfaces; the comparisons below identify them with native restrictedness at every positive radius and the native Gauss norm. PowerSeries.trunc N retains precisely the coefficients of degrees less than N. Additional completeness, ultrametricity and norm-one assumptions are stated individually; no field, reducedness or Noetherian assumption is implicit. The norm is ultrametric: ‖x+y‖≤max(‖x‖,‖y‖).

**Inputs.** `LocallyAnalyticDistributions:L4/entire-bounded-coefficient-limit`, `LocallyAnalyticDistributions:L4/entire-gauss-truncation-bound`, `mathlib:PowerSeries.gaussNorm_eq`, `mathlib:PowerSeries.le_gaussNorm`, `mathlib:PowerSeries.gaussNorm_nonneg`, `mathlib:PowerSeries.gaussNorm_add_le_max`, `mathlib:MvPowerSeries.gaussNorm_neg`, `mathlib:le_of_tendsto`, `mathlib:PowerSeries.coeff_trunc`, `mathlib:csSup_le`, `mathlib:tendsto_pow_atTop_nhds_zero_of_lt_one`.

**Proof outline.** The preceding node makes f entire. For fixed R take S=2R and the common S-bound C. Passing coefficient bounds to f also gives G_S(f)≤C. The ultrametric addition bound and native negation invariance bound G_S(F_i−f) by C. The truncation estimate bounds every tail after N at radius R by C2^(−N), uniformly in i. Choose N to make that tail smaller than a prescribed epsilon. The finitely many head coefficients converge to zero; intersect their eventual epsilon bounds and apply the supremum upper-bound criterion to the truncated head. The native ultrametric Gauss addition inequality bounds the full difference by the maximum of head and tail. This proves convergence and does not assume evaluation continuity.

**Unit tests.**

- `EntireGaussTests.moving_monomials` (non-example): In a norm-one ring the coefficients of T^N converge individually to zero, but G_1(T^N)=1 and its evaluation at 1 is 1 for every N.

**Acceptance checks.** The uniform bounds hold at all larger radii. Coefficientwise convergence by itself is insufficient.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, complete published printed 432–436 / PDF 16–20 freshly read on 27 September 2026; entire coefficient decay on 432, division on 434, spectral truncation limit and Lemma A3.8 on 435.. Worker decomposition of the analytic convergence needed by the source limit. The native Gauss norm and restricted-series predicate already exist; the new estimates and completeness criterion do not construct the general spectral transform or assert its still-missing quantitative coefficient bounds.

### Radius bounds for a Gauss-Cauchy sequence

`L4/entire-gauss-cauchy-bounded` · lemma.

Let F_i be entire and R>0. If for every epsilon>0 there is N with G_R(F_i−F_j)<epsilon for all i,j≥N, then G_R(F_i) has a common nonnegative upper bound.

**Hypotheses.** A is a normed commutative ring. Write G_R(F) for the existing native PowerSeries.gaussNorm applied to the coefficient norm and real radius R. IsEntire and gaussSize are the preceding packet interfaces; the comparisons below identify them with native restrictedness at every positive radius and the native Gauss norm. PowerSeries.trunc N retains precisely the coefficients of degrees less than N. Additional completeness, ultrametricity and norm-one assumptions are stated individually; no field, reducedness or Noetherian assumption is implicit. The norm is ultrametric: ‖x+y‖≤max(‖x‖,‖y‖).

**Inputs.** `LocallyAnalyticDistributions:L4/entire-native-restricted`, `tauceti:TauCeti.PowerSeries.hasGaussNorm_of_isRestricted`, `mathlib:PowerSeries.gaussNorm_add_le_max`, `mathlib:PowerSeries.gaussNorm_nonneg`.

**Proof outline.** Use epsilon=1 and fix the resulting index N. For i≥N, write F_i=(F_i−F_N)+F_N and apply the native ultrametric Gauss bound to obtain G_R(F_i)≤max(1,G_R(F_N)). Enlarge this bound by the maximum of the finitely many G_R(F_i) for i<N. Every term is finite by entire restrictedness. This covers the whole sequence.

**Acceptance checks.** No metric on the entire-series subring is assumed or constructed.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, complete published printed 432–436 / PDF 16–20 freshly read on 27 September 2026; entire coefficient decay on 432, division on 434, spectral truncation limit and Lemma A3.8 on 435.. Worker decomposition of the analytic convergence needed by the source limit. The native Gauss norm and restricted-series predicate already exist; the new estimates and completeness criterion do not construct the general spectral transform or assert its still-missing quantitative coefficient bounds.

### Unique entire limit of Gauss-Cauchy sequences

`L4/entire-gauss-cauchy-complete` · theorem.

Assume A is complete and ultrametric. A sequence F_i of entire series that is Cauchy in every native Gauss norm has a unique formal series f which is entire and satisfies G_R(F_i−f)→0 for every R>0.

**Hypotheses.** A is a normed commutative ring. Write G_R(F) for the existing native PowerSeries.gaussNorm applied to the coefficient norm and real radius R. IsEntire and gaussSize are the preceding packet interfaces; the comparisons below identify them with native restrictedness at every positive radius and the native Gauss norm. PowerSeries.trunc N retains precisely the coefficients of degrees less than N. Additional completeness, ultrametricity and norm-one assumptions are stated individually; no field, reducedness or Noetherian assumption is implicit. The norm is ultrametric: ‖x+y‖≤max(‖x‖,‖y‖). A is complete.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-gauss-cauchy-bounded`, `LocallyAnalyticDistributions:L4/entire-bounded-coefficient-limit`, `LocallyAnalyticDistributions:L4/entire-bounded-gauss-limit`, `mathlib:PowerSeries.le_gaussNorm`, `mathlib:Metric.cauchySeq_iff`, `mathlib:cauchySeq_tendsto_of_complete`, `mathlib:PowerSeries.mk`, `mathlib:tendsto_nhds_unique`.

**Proof outline.** At radius 1, native le_gaussNorm bounds the norm of each coefficient difference by the Gauss difference. Native Metric.cauchySeq_iff makes each coefficient sequence Cauchy. Completeness of A and the native Cauchy-sequence limit theorem supply a limit coefficient for each k. Use native PowerSeries.mk to form f from those coefficients; no new entire-series carrier is introduced. The preceding Cauchy boundedness node gives uniform bounds at every radius. Apply the bounded-coefficient-limit node to make f entire and the bounded-Gauss-limit theorem to obtain convergence at every radius. If g is another such limit, coefficient differences are bounded by the radius-one Gauss differences. Each coefficient therefore has both limits coeff_k(f) and coeff_k(g); native Hausdorff uniqueness and power-series extensionality give f=g.

**Acceptance checks.** This is the explicit sequential completeness criterion for all Gauss radii, not a CompleteSpace instance for an unspecified topology.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, complete published printed 432–436 / PDF 16–20 freshly read on 27 September 2026; entire coefficient decay on 432, division on 434, spectral truncation limit and Lemma A3.8 on 435.. Worker decomposition of the analytic convergence needed by the source limit. The native Gauss norm and restricted-series predicate already exist; the new estimates and completeness criterion do not construct the general spectral transform or assert its still-missing quantitative coefficient bounds.

### Uniform evaluation of a Gauss limit

`L4/entire-gauss-uniform-evaluation` · theorem.

Assume A is complete and ultrametric. For any filter l and family F_i of entire series, any entire f and R>0, G_R(F_i−f)→0 along l implies uniform convergence of entire_eval(F_i,a) to entire_eval(f,a) on the native closed ball ‖a‖≤R.

**Hypotheses.** A is a normed commutative ring. Write G_R(F) for the existing native PowerSeries.gaussNorm applied to the coefficient norm and real radius R. IsEntire and gaussSize are the preceding packet interfaces; the comparisons below identify them with native restrictedness at every positive radius and the native Gauss norm. PowerSeries.trunc N retains precisely the coefficients of degrees less than N. Additional completeness, ultrametricity and norm-one assumptions are stated individually; no field, reducedness or Noetherian assumption is implicit. The norm is ultrametric: ‖x+y‖≤max(‖x‖,‖y‖). A is complete.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-series`, `LocallyAnalyticDistributions:L4/entire-native-gauss`, `mathlib:Metric.tendstoUniformlyOn_iff`.

**Proof outline.** The existing entire evaluation homomorphism identifies the difference of evaluated series with evaluation of F_i−f. The existing evaluation bound and native gaussSize comparison bound its norm by G_R(F_i−f) simultaneously for every ‖a‖≤R. Apply native Metric.tendstoUniformlyOn_iff. The convergence of the common nonnegative upper bound supplies the same eventual index for every point of the ball. The coefficient ring must be complete so the evaluation sums converge in A. The suggested signature of the existing evaluation homomorphism now explicitly retains this already stated mathematical hypothesis.

**Unit tests.**

- `EntireGaussTests.uniform_truncation_evaluation` (compatibility): For entire F, its native truncations evaluate uniformly to F on every closed ball of positive radius.

**Acceptance checks.** This applies to arbitrary filters and does not require compactness of the closed ball. In particular it justifies passing a radius-one Gauss limit through evaluation at 1 when norm(1)≤1.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, complete published printed 432–436 / PDF 16–20 freshly read on 27 September 2026; entire coefficient decay on 432, division on 434, spectral truncation limit and Lemma A3.8 on 435.. Worker decomposition of the analytic convergence needed by the source limit. The native Gauss norm and restricted-series predicate already exist; the new estimates and completeness criterion do not construct the general spectral transform or assert its still-missing quantitative coefficient bounds.

### Multiplication of Gauss limits

`L4/entire-gauss-multiplication-limit` · lemma.

In an ultrametric A, if entire F_i→f and H_i→h in the native Gauss norm at a fixed R>0, then F_iH_i→fh in that same Gauss norm.

**Hypotheses.** A is a normed commutative ring. Write G_R(F) for the existing native PowerSeries.gaussNorm applied to the coefficient norm and real radius R. IsEntire and gaussSize are the preceding packet interfaces; the comparisons below identify them with native restrictedness at every positive radius and the native Gauss norm. PowerSeries.trunc N retains precisely the coefficients of degrees less than N. Additional completeness, ultrametricity and norm-one assumptions are stated individually; no field, reducedness or Noetherian assumption is implicit. The norm is ultrametric: ‖x+y‖≤max(‖x‖,‖y‖).

**Inputs.** `LocallyAnalyticDistributions:L4/entire-native-restricted`, `tauceti:TauCeti.PowerSeries.hasGaussNorm_of_isRestricted`, `mathlib:PowerSeries.gaussNorm_add_le_max`, `mathlib:PowerSeries.HasGaussNorm.hasMvGaussNorm`, `mathlib:MvPowerSeries.gaussNorm_mul_le`, `mathlib:PowerSeries.gaussNorm_nonneg`.

**Proof outline.** The ultrametric addition bound gives G_R(H_i)≤max(G_R(H_i−h),G_R(h)), so these values are eventually bounded. Use F_iH_i−fh=(F_i−f)H_i+f(H_i−h). Apply native Gauss addition and the native multivariate submultiplicative bound, specialized through HasGaussNorm.hasMvGaussNorm to the actual univariate series. The first error is bounded by a null sequence times a fixed bound; the second by G_R(f) times a null sequence. Their maximum tends to zero. Native restrictedness supplies all needed boundedness premises.

**Unit tests.**

- `EntireGaussTests.nilpotent_product` (non-example): For e≠0 with e²=0 and R>0, f=eT has G_R(f²)=0 but G_R(f)²>0. A multiplicative Gauss-norm claim would fail.

**Acceptance checks.** Use submultiplicativity, not multiplicativity: nonreduced normed coefficient rings are admitted.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, complete published printed 432–436 / PDF 16–20 freshly read on 27 September 2026; entire coefficient decay on 432, division on 434, spectral truncation limit and Lemma A3.8 on 435.. Worker decomposition of the analytic convergence needed by the source limit. The native Gauss norm and restricted-series predicate already exist; the new estimates and completeness criterion do not construct the general spectral transform or assert its still-missing quantitative coefficient bounds.

### A radius bound for entire monic division

`L4/entire-monic-quotient-gauss-bound` · lemma.

Let Q be monic of degree d. If 1≤C≤S, 0<R≤S and ‖coeff_i(Q.reverse)‖≤C^i for every i, then every entire F satisfies G_R(S_Q(F))≤G_S(F)/S^d, where S_Q is the existing entireMonicQuotient.

**Hypotheses.** A is a normed commutative ring. Write G_R(F) for the existing native PowerSeries.gaussNorm applied to the coefficient norm and real radius R. IsEntire and gaussSize are the preceding packet interfaces; the comparisons below identify them with native restrictedness at every positive radius and the native Gauss norm. PowerSeries.trunc N retains precisely the coefficients of degrees less than N. Additional completeness, ultrametricity and norm-one assumptions are stated individually; no field, reducedness or Noetherian assumption is implicit. The norm is ultrametric: ‖x+y‖≤max(‖x‖,‖y‖). A is nontrivial, complete and norm-one, as required by the preceding monic-division construction.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-native-restricted`, `tauceti:TauCeti.PowerSeries.hasGaussNorm_of_isRestricted`, `mathlib:PowerSeries.gaussNorm_eq`, `mathlib:PowerSeries.le_gaussNorm`, `mathlib:PowerSeries.gaussNorm_nonneg`, `LocallyAnalyticDistributions:L4/entire-monic-quotient-bound`, `mathlib:csSup_le`.

**Proof outline.** Native restricted boundedness supplies HasGaussNorm for F at S. Use native le_gaussNorm to insert M=G_S(F) into the preceding entire-monic-quotient coefficient bound. Multiply the kth quotient coefficient bound by R^k. It becomes at most (G_S(F)/S^d)(R/S)^k≤G_S(F)/S^d. Use the native supremum upper-bound criterion. This imports the already decomposed reciprocal-tail estimate and introduces no new division algorithm.

**Unit tests.**

- `EntireGaussTests.quotient_identity` (degenerate): Division by the monic polynomial 1 gives S_1(F)=F for every entire F.

**Acceptance checks.** The radius is allowed to increase with Q. The case Q=1,d=0 is included.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, complete published printed 432–436 / PDF 16–20 freshly read on 27 September 2026; entire coefficient decay on 432, division on 434, spectral truncation limit and Lemma A3.8 on 435.. Worker decomposition of the analytic convergence needed by the source limit. The native Gauss norm and restricted-series predicate already exist; the new estimates and completeness criterion do not construct the general spectral transform or assert its still-missing quantitative coefficient bounds.

### Continuity of entire monic division in Gauss radii

`L4/entire-monic-quotient-gauss-limit` · lemma.

For fixed monic Q, if entire F_i→f in every Gauss radius, then S_Q(F_i)→S_Q(f) in every Gauss radius.

**Hypotheses.** A is a normed commutative ring. Write G_R(F) for the existing native PowerSeries.gaussNorm applied to the coefficient norm and real radius R. IsEntire and gaussSize are the preceding packet interfaces; the comparisons below identify them with native restrictedness at every positive radius and the native Gauss norm. PowerSeries.trunc N retains precisely the coefficients of degrees less than N. Additional completeness, ultrametricity and norm-one assumptions are stated individually; no field, reducedness or Noetherian assumption is implicit. The norm is ultrametric: ‖x+y‖≤max(‖x‖,‖y‖). A is nontrivial, complete and norm-one.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-monic-quotient-gauss-bound`, `LocallyAnalyticDistributions:L4/entire-monic-quotient`, `LocallyAnalyticDistributions:L4/entire-monic-quotient-entire`, `mathlib:PowerSeries.gaussNorm_nonneg`, `mathlib:squeeze_zero`.

**Proof outline.** The finite support of Q.reverse and its constant coefficient 1 supply C≥1 with ‖coeff_i(Q.reverse)‖≤C^i: bound the finitely many nonconstant coefficients by C, while the constant case uses norm(1)=1. For fixed output radius R choose S≥max(C,R). The existing additivity and constant-scalar API of entireMonicQuotient identify the quotient difference with S_Q(F_i−f). The preceding Gauss bound bounds its output norm by G_S(F_i−f)/S^d. The hypothesis at this S and the native squeeze criterion give the result.

**Acceptance checks.** This strengthens the earlier coefficientwise quotient convergence. It still does not prove the missing bounds for the general spectral resultant D(B,P).

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, complete published printed 432–436 / PDF 16–20 freshly read on 27 September 2026; entire coefficient decay on 432, division on 434, spectral truncation limit and Lemma A3.8 on 435.. Worker decomposition of the analytic convergence needed by the source limit. The native Gauss norm and restricted-series predicate already exist; the new estimates and completeness criterion do not construct the general spectral transform or assert its still-missing quantitative coefficient bounds.

### Reduction of the functional polynomial at fixed characteristic rank

`L4/spectral-reduce-functional-polynomial` · lemma.

If P(0)=1, natDegree(P)≤n and natDegree(B)≤m, then D_(n,m)(B,P)=D_(n,n)(B modByMonic reflect_n(P),P).

**Hypotheses.** R is an arbitrary commutative ring. D_(n,m)(B,P) is the existing polynomialSpectralResultant with its explicit two natural bounds, and reflect_n is native bounded reflection. Additional normalization and bounds are stated explicitly.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-reversed-degree`, `LocallyAnalyticDistributions:L4/spectral-quotient-norm`, `mathlib:Polynomial.modByMonic_add_div`, `mathlib:Polynomial.degree_modByMonic_lt`.

**Proof outline.** The existing reversal lemma makes Q_n monic of degree n. Native monic division shows that B and its remainder have the same class in AdjoinRoot Q_n. After mapping coefficients into R[T], the classes of 1−T B and 1−T remainder also agree. Use the existing spectral quotient-norm comparison on each representative. The remainder has degree less than n, so its natural degree is at most n, including the zero remainder for n=0. The resulting norms and hence spectral polynomials agree. For the zero coefficient ring use uniqueness of all polynomials; no nontriviality is silently added.

**Acceptance checks.** The right output has a fixed auxiliary bound n even as m grows.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, published435/PDF19: definition of D and LemmaA3.8; full published435–436 freshly read28 September2026, with preceding full432–436 reading retained.. Worker decomposition of the case of entire functional input B and fixed normalized polynomial characteristic input P. A fixed monic remainder and bounded output degree justify coefficient and all-radius Gauss convergence. This does not assert uniformity as the characteristic degree grows, the full entire-input construction, or the infinite-operator comparison.

### The finite spectral output has degree at most its rank

`L4/spectral-output-degree` · lemma.

For any B,P and any n,m, natDegree(D_(n,m)(B,P))≤n.

**Hypotheses.** R is an arbitrary commutative ring. D_(n,m)(B,P) is the existing polynomialSpectralResultant with its explicit two natural bounds, and reflect_n is native bounded reflection. Additional normalization and bounds are stated explicitly.

**Inputs.** `LocallyAnalyticDistributions:L4/polynomial-spectral-resultant`, `mathlib:Polynomial.sylvester`, `mathlib:Polynomial.resultant`, `mathlib:Matrix.det_apply`.

**Proof outline.** Unfold the existing bounded resultant into its native Sylvester determinant over R[T]. Its first n columns come from 1−T B and have entries of output degree at most1; the other m columns come from reflected P and have constant entries. In the native determinant permutation expansion, every term uses exactly one entry in each column. Thus every product has degree at most n, and so does their finite sum. The zero polynomial has natural degree0, so n=0 is valid.

**Acceptance checks.** This holds without degree bounds or normalization of B or P. The two output and resultant variables must not be confused.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, published435/PDF19: definition of D and LemmaA3.8; full published435–436 freshly read28 September2026, with preceding full432–436 reading retained.. Worker decomposition of the case of entire functional input B and fixed normalized polynomial characteristic input P. A fixed monic remainder and bounded output degree justify coefficient and all-radius Gauss convergence. This does not assert uniformity as the characteristic degree grows, the full entire-input construction, or the infinite-operator comparison.

### Continuity of finite spectral coefficients

`L4/spectral-coefficient-coordinate-continuity` · lemma.

Over a topological commutative ring R, fix n,m,k and P. The kth coefficient of D_(n,m)(ofFn_(m+1)(b),P) is continuous as a function of b∈R^(m+1).

**Hypotheses.** R is an arbitrary commutative ring. D_(n,m)(B,P) is the existing polynomialSpectralResultant with its explicit two natural bounds, and reflect_n is native bounded reflection. Additional normalization and bounds are stated explicitly. R additionally has its given topological-ring structure; no norm or completeness is required.

**Inputs.** `LocallyAnalyticDistributions:L4/polynomial-spectral-resultant`, `mathlib:Polynomial.sylvester`, `mathlib:Polynomial.resultant`, `mathlib:Matrix.det_apply`, `mathlib:Polynomial.ofFn`, `mathlib:Polynomial.ofFn_coeff_eq_val_of_lt`, `mathlib:Polynomial.ofFn_coeff_eq_zero_of_ge`.

**Proof outline.** Native ofFn coefficients are the specified coordinates below m+1 and zero above. Each Sylvester entry is constant or affine in the output variable, with coefficient functions continuous in b. Expand the finite determinant and then its fixed output coefficient. Polynomial product coefficients are finite sums; all resulting expressions are finite sums and products of coordinate functions. Native topological-ring operations give continuity. No topology on R[T] or degree constancy is needed.

**Acceptance checks.** No claim that evaluation on R-points detects polynomials is used; the proof works over finite and nonreduced rings.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, published435/PDF19: definition of D and LemmaA3.8; full published435–436 freshly read28 September2026, with preceding full432–436 reading retained.. Worker decomposition of the case of entire functional input B and fixed normalized polynomial characteristic input P. A fixed monic remainder and bounded output degree justify coefficient and all-radius Gauss convergence. This does not assert uniformity as the characteristic degree grows, the full entire-input construction, or the infinite-operator comparison.

### Gauss convergence of bounded-degree coefficient limits

`L4/bounded-degree-gauss-limit` · lemma.

For any filter l, polynomials F_i and f over a normed commutative ring with all natural degrees≤d, and coefficientwise F_i→f along l, one has G_R(F_i−f)→0 for every R>0.

**Hypotheses.** A is a normed commutative ring. F is a polynomial-valued family on an arbitrary filter; f and every F_i have a common natural-degree bound d. G_R is the existing native power-series Gauss norm after the native polynomial inclusion.

**Inputs.** `mathlib:PowerSeries.gaussNorm_eq`, `mathlib:PowerSeries.gaussNorm_nonneg`, `mathlib:Polynomial.coeff_coe`.

**Proof outline.** Above d all coefficient differences vanish. Native gaussNorm_eq bounds the supremum by the finite sum of nonnegative weighted norms over k≤d. Each norm difference tends to0 by its coefficient limit. The finite sum therefore tends to0; Gauss nonnegativity and squeezing give the claim. No ultrametricity or completeness is needed.

**Acceptance checks.** The common finite degree bound is essential. The inherited moving-monomial example has coefficient limit0 but Gauss norm1 at radius1.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, published435/PDF19: definition of D and LemmaA3.8; full published435–436 freshly read28 September2026, with preceding full432–436 reading retained.. Worker decomposition of the case of entire functional input B and fixed normalized polynomial characteristic input P. A fixed monic remainder and bounded output degree justify coefficient and all-radius Gauss convergence. This does not assert uniformity as the characteristic degree grows, the full entire-input construction, or the infinite-operator comparison.

### Spectral transform with entire functional input and fixed polynomial input

`L4/entire-fixed-polynomial-spectral` · construction.

Define E_n(B,P)=D_(n,n)(R_(Q_n)(B),P), a native polynomial, using the existing entire monic remainder and Q_n=reflect_n(P).

**Hypotheses.** A is a nontrivial complete normed commutative ring with norm(1)=1 and ultrametric norm. B is an entire native power series. P is a native polynomial with constant coefficient1 and natDegree(P)≤n. The chosen rank n is explicit. Set Q_n=reflect_n(P), monic of degree n, and R_Q(B)=trunc_n(B−Q_n S_Q(B)), using the preceding entireMonicQuotient S_Q. No reducedness, field, Noetherianity, splitting, quotient topology or B(0)=0 hypothesis is imposed unless stated.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-monic-quotient`, `LocallyAnalyticDistributions:L4/entire-monic-division-remainder`, `LocallyAnalyticDistributions:L4/polynomial-spectral-resultant`, `LocallyAnalyticDistributions:L4/spectral-output-degree`, `LocallyAnalyticDistributions:L4/spectral-polynomial-constant`, `LocallyAnalyticDistributions:L4/spectral-right-bound`, `mathlib:PowerSeries.trunc`.

**Proof outline.** The construction takes the native degree-n truncation of B−Q_n S_(Q_n)(B), then applies the existing finite polynomial spectral construction with both bounds n. No quotient topology, limit carrier or new power-series type is introduced. When B is entire and P is normalized with degree bounded by n, the preceding monic-division theorem identifies this truncation as the actual remainder. The finite spectral degree bound gives output degree at most n. The finite constant-coefficient formula gives output constant1. For B=0 the reciprocal-tail quotient vanishes; finite right-bound independence and the zero-functional formula give E_n(0,P)=1.

**Uses.** Coleman A3 finite definition and its limiting passage: Extend the functional input to entire series while keeping the characteristic input polynomial. Coleman A3.8(10): Supply the factor-product law for normalized polynomial characteristic factors before the remaining general entire-input limit.

**API.**

| Declaration | Contract |
|---|---|
| `entirePolynomialSpectral_def` | The value is D_(n,n) of trunc_n(B−Q_n S_(Q_n)(B)) and P. |
| `entirePolynomialSpectral_constantCoeff` | For P(0)=1, the output constant coefficient is1. |
| `entirePolynomialSpectral_zero` | For normalized P of degree at most n, E_n(0,P)=1. |

**Unit tests.**

- `FixedSpectralTests.empty_rank` (degenerate): E_0(B,1)=1 for every B.
- `FixedSpectralTests.zero_function` (degenerate): The zero functional input gives1.
- `FixedSpectralTests.constant_padding` (non-example): For B=c constant and P=1, E_2(B,1)=(1−cT)^2, retaining both padded zero roots.
- `FixedSpectralTests.linear_value` (compatibility): E_1(B,1−aT)=1−B(a)T for entire B.
- `FixedSpectralTests.nilpotent_coefficients` (computation): If e²=0, E_2(T,1−eT²)=1−eT²; nilpotent coefficients remain visible.
- `FixedSpectralTests.unit_input_zero_constant` (compatibility): For entire B with B(0)=0, E_n(B,1)=1 at every rank.

**Acceptance checks.** The formula is defined for native inputs; analytic correctness is asserted under the stated complete ultrametric hypotheses. Rank is part of the input and cannot be replaced by the actual degree when B(0)≠0.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, published435/PDF19: definition of D and LemmaA3.8; full published435–436 freshly read28 September2026, with preceding full432–436 reading retained.. Worker decomposition of the case of entire functional input B and fixed normalized polynomial characteristic input P. A fixed monic remainder and bounded output degree justify coefficient and all-radius Gauss convergence. This does not assert uniformity as the characteristic degree grows, the full entire-input construction, or the infinite-operator comparison.

### Agreement with the polynomial spectral construction

`L4/entire-fixed-polynomial-compatibility` · comparison.

For polynomial B with natDegree(B)≤m, E_n(B,P)=D_(n,m)(B,P).

**Hypotheses.** A is a nontrivial complete normed commutative ring with norm(1)=1 and ultrametric norm. B is an entire native power series. P is a native polynomial with constant coefficient1 and natDegree(P)≤n. The chosen rank n is explicit. Set Q_n=reflect_n(P), monic of degree n, and R_Q(B)=trunc_n(B−Q_n S_Q(B)), using the preceding entireMonicQuotient S_Q. No reducedness, field, Noetherianity, splitting, quotient topology or B(0)=0 hypothesis is imposed unless stated.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-fixed-polynomial-spectral`, `LocallyAnalyticDistributions:L4/entire-monic-quotient-polynomial`, `LocallyAnalyticDistributions:L4/entire-monic-division-remainder`, `LocallyAnalyticDistributions:L4/spectral-reduce-functional-polynomial`.

**Proof outline.** The preceding entire-monic-quotient polynomial comparison and monic-division remainder identify R_(Q_n)(B) with native B modByMonic Q_n. Apply the new finite reduction identity. All rank and auxiliary bounds remain explicit.

**Acceptance checks.** Retain the fixed rank and all explicitly stated hypotheses, including degree-zero cases.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, published435/PDF19: definition of D and LemmaA3.8; full published435–436 freshly read28 September2026, with preceding full432–436 reading retained.. Worker decomposition of the case of entire functional input B and fixed normalized polynomial characteristic input P. A fixed monic remainder and bounded output degree justify coefficient and all-radius Gauss convergence. This does not assert uniformity as the characteristic degree grows, the full entire-input construction, or the infinite-operator comparison.

### Coefficient limits at fixed characteristic rank

`L4/entire-fixed-spectral-coefficient-limit` · lemma.

For every k, coeff_k D_(n,N)(trunc_(N+1)(B),P) tends to coeff_k E_n(B,P) as N→∞.

**Hypotheses.** A is a nontrivial complete normed commutative ring with norm(1)=1 and ultrametric norm. B is an entire native power series. P is a native polynomial with constant coefficient1 and natDegree(P)≤n. The chosen rank n is explicit. Set Q_n=reflect_n(P), monic of degree n, and R_Q(B)=trunc_n(B−Q_n S_Q(B)), using the preceding entireMonicQuotient S_Q. No reducedness, field, Noetherianity, splitting, quotient topology or B(0)=0 hypothesis is imposed unless stated.

**Inputs.** `LocallyAnalyticDistributions:L4/spectral-reduce-functional-polynomial`, `LocallyAnalyticDistributions:L4/spectral-reversed-degree`, `LocallyAnalyticDistributions:L4/entire-remainder-truncation-limit`, `LocallyAnalyticDistributions:L4/entire-fixed-polynomial-spectral`, `LocallyAnalyticDistributions:L4/spectral-coefficient-coordinate-continuity`, `mathlib:Polynomial.ofFn_coeff_eq_val_of_lt`, `mathlib:Polynomial.ofFn_coeff_eq_zero_of_ge`, `mathlib:PowerSeries.coeff_trunc`.

**Proof outline.** Native truncation gives the required degree bound N on B_N. Reduce its functional polynomial modulo the fixed Q_n by spectral-reduce-functional-polynomial. The preceding entire-remainder-truncation-limit says every coefficient of B_N modByMonic Q_n converges to the corresponding entire remainder coefficient. Both polynomials have degree less than n, hence they are recovered by native ofFn on their first n+1 coefficients. Convergence of this finite vector and the new spectral coefficient continuity give the claimed output coefficient limit. The argument includes n=0.

**Acceptance checks.** Retain the fixed rank and all explicitly stated hypotheses, including degree-zero cases.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, published435/PDF19: definition of D and LemmaA3.8; full published435–436 freshly read28 September2026, with preceding full432–436 reading retained.. Worker decomposition of the case of entire functional input B and fixed normalized polynomial characteristic input P. A fixed monic remainder and bounded output degree justify coefficient and all-radius Gauss convergence. This does not assert uniformity as the characteristic degree grows, the full entire-input construction, or the infinite-operator comparison.

### All-radius Gauss convergence at fixed characteristic rank

`L4/entire-fixed-spectral-gauss-limit` · theorem.

For every R>0, G_R(D_(n,N)(trunc_(N+1)(B),P)−E_n(B,P)) tends to0.

**Hypotheses.** A is a nontrivial complete normed commutative ring with norm(1)=1 and ultrametric norm. B is an entire native power series. P is a native polynomial with constant coefficient1 and natDegree(P)≤n. The chosen rank n is explicit. Set Q_n=reflect_n(P), monic of degree n, and R_Q(B)=trunc_n(B−Q_n S_Q(B)), using the preceding entireMonicQuotient S_Q. No reducedness, field, Noetherianity, splitting, quotient topology or B(0)=0 hypothesis is imposed unless stated.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-fixed-spectral-coefficient-limit`, `LocallyAnalyticDistributions:L4/spectral-output-degree`, `LocallyAnalyticDistributions:L4/bounded-degree-gauss-limit`.

**Proof outline.** The finite spectral output-degree theorem bounds every polynomial in the sequence and its defined limit by the same n. Combine the preceding coefficient limit with the bounded-degree Gauss convergence lemma. The result holds at every positive radius with that radius fixed.

**Acceptance checks.** The resulting limit is already a polynomial and therefore entire. This avoids any unsupported passage from a general coefficientwise limit to uniform evaluation.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, published435/PDF19: definition of D and LemmaA3.8; full published435–436 freshly read28 September2026, with preceding full432–436 reading retained.. Worker decomposition of the case of entire functional input B and fixed normalized polynomial characteristic input P. A fixed monic remainder and bounded output degree justify coefficient and all-radius Gauss convergence. This does not assert uniformity as the characteristic degree grows, the full entire-input construction, or the infinite-operator comparison.

### Simultaneous truncation convergence for polynomial characteristic input

`L4/spectral-simultaneous-fixed-polynomial-gauss` · theorem.

If also B(0)=0, the simultaneous D_(N,N)(trunc_(N+1)(B),trunc_(N+1)(P)) converges in every G_R to E_(natDegree(P))(B,P).

**Hypotheses.** A is a nontrivial complete normed commutative ring with norm(1)=1 and ultrametric norm. B is an entire native power series. P is a native polynomial with constant coefficient1 and natDegree(P)≤n. The chosen rank n is explicit. Set Q_n=reflect_n(P), monic of degree n, and R_Q(B)=trunc_n(B−Q_n S_Q(B)), using the preceding entireMonicQuotient S_Q. No reducedness, field, Noetherianity, splitting, quotient topology or B(0)=0 hypothesis is imposed unless stated. Here n is chosen as natDegree(P), and B(0)=0.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-fixed-spectral-gauss-limit`, `LocallyAnalyticDistributions:L4/spectral-padding-stability`, `mathlib:PowerSeries.coeff_trunc`.

**Proof outline.** For N at least natDegree(P), the second truncation is P itself. The first truncation has constant coefficient0. The existing finite padding-stability theorem reduces rank N to the fixed rank natDegree(P). The required auxiliary bound N remains valid for the first truncation. The tail of the sequence is therefore exactly the fixed-rank sequence in the preceding Gauss limit. Eventual equality transfers convergence.

**Acceptance checks.** This proves the source simultaneous limit for polynomial P only. For general entire P, the degrees are unbounded and the same proof does not apply.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, published435/PDF19: definition of D and LemmaA3.8; full published435–436 freshly read28 September2026, with preceding full432–436 reading retained.. Worker decomposition of the case of entire functional input B and fixed normalized polynomial characteristic input P. A fixed monic remainder and bounded output degree justify coefficient and all-radius Gauss convergence. This does not assert uniformity as the characteristic degree grows, the full entire-input construction, or the infinite-operator comparison.

### The exact zero-root padding law for entire functional input

`L4/entire-fixed-spectral-padding` · lemma.

E_(n+1)(B,P)=E_n(B,P)(1−B(0)T).

**Hypotheses.** A is a nontrivial complete normed commutative ring with norm(1)=1 and ultrametric norm. B is an entire native power series. P is a native polynomial with constant coefficient1 and natDegree(P)≤n. The chosen rank n is explicit. Set Q_n=reflect_n(P), monic of degree n, and R_Q(B)=trunc_n(B−Q_n S_Q(B)), using the preceding entireMonicQuotient S_Q. No reducedness, field, Noetherianity, splitting, quotient topology or B(0)=0 hypothesis is imposed unless stated.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-fixed-spectral-coefficient-limit`, `LocallyAnalyticDistributions:L4/spectral-zero-padding`, `mathlib:PowerSeries.coeff_trunc`.

**Proof outline.** Apply the existing finite padding formula to B_N. Its constant coefficient is B(0) for every N because trunc_(N+1) retains degree0. Pass to each output coefficient using the fixed-rank coefficient limits at n and n+1. Multiplication by the displayed fixed linear factor involves only two coefficients, so limits pass through it. Hausdorff uniqueness gives equality of every coefficient.

**Acceptance checks.** The factor equals1 precisely under the relevant zero-constant hypothesis; no unqualified rank independence is asserted.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, published435/PDF19: definition of D and LemmaA3.8; full published435–436 freshly read28 September2026, with preceding full432–436 reading retained.. Worker decomposition of the case of entire functional input B and fixed normalized polynomial characteristic input P. A fixed monic remainder and bounded output degree justify coefficient and all-radius Gauss convergence. This does not assert uniformity as the characteristic degree grows, the full entire-input construction, or the infinite-operator comparison.

### Factor products for polynomial characteristic inputs

`L4/entire-fixed-spectral-factor-product` · theorem.

If Q is also normalized with natDegree(Q)≤k, then E_(n+k)(B,PQ)=E_n(B,P)E_k(B,Q).

**Hypotheses.** A is a nontrivial complete normed commutative ring with norm(1)=1 and ultrametric norm. B is an entire native power series. P is a native polynomial with constant coefficient1 and natDegree(P)≤n. The chosen rank n is explicit. Set Q_n=reflect_n(P), monic of degree n, and R_Q(B)=trunc_n(B−Q_n S_Q(B)), using the preceding entireMonicQuotient S_Q. No reducedness, field, Noetherianity, splitting, quotient topology or B(0)=0 hypothesis is imposed unless stated. Q is a normalized polynomial of natural degree at most k.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-fixed-spectral-coefficient-limit`, `LocallyAnalyticDistributions:L4/spectral-factor-product`.

**Proof outline.** For every polynomial truncation B_N, apply the existing finite factor-product law with ranks n,k and auxiliary bound N. All three sequences converge coefficientwise by the fixed-rank theorem; the degree of PQ is at most n+k and its constant coefficient is1. A fixed coefficient of the product is a finite sum of products of convergent coefficients. Pass to the limit and use native polynomial extensionality.

**Acceptance checks.** This is Coleman A3.8(10) with polynomial characteristic factors and entire B. Entire characteristic factors and infinite-operator transport remain separate obligations.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, published435/PDF19: definition of D and LemmaA3.8; full published435–436 freshly read28 September2026, with preceding full432–436 reading retained.. Worker decomposition of the case of entire functional input B and fixed normalized polynomial characteristic input P. A fixed monic remainder and bounded output degree justify coefficient and all-radius Gauss convergence. This does not assert uniformity as the characteristic degree grows, the full entire-input construction, or the infinite-operator comparison.

### Linear characteristic input evaluates the entire function

`L4/entire-fixed-spectral-linear-input` · theorem.

For a∈A, E_1(B,1−aT)=1−B(a)T, with the preceding actual entire evaluation.

**Hypotheses.** A is a nontrivial complete normed commutative ring with norm(1)=1 and ultrametric norm. B is an entire native power series. P is a native polynomial with constant coefficient1 and natDegree(P)≤n. The chosen rank n is explicit. Set Q_n=reflect_n(P), monic of degree n, and R_Q(B)=trunc_n(B−Q_n S_Q(B)), using the preceding entireMonicQuotient S_Q. No reducedness, field, Noetherianity, splitting, quotient topology or B(0)=0 hypothesis is imposed unless stated. Here n=1 and P=1−aT, including a=0.

**Inputs.** `LocallyAnalyticDistributions:L4/entire-fixed-spectral-coefficient-limit`, `LocallyAnalyticDistributions:L4/spectral-linear-factor`, `LocallyAnalyticDistributions:L4/entire-gauss-truncation-convergence`, `LocallyAnalyticDistributions:L4/entire-gauss-uniform-evaluation`.

**Proof outline.** The finite linear-factor formula identifies the Nth approximant with 1−B_N(a)T. The fixed-rank coefficient limit controls its output. Truncations converge in every Gauss radius. Choose any positive radius at least norm(a), then use the existing uniform-evaluation theorem to obtain B_N(a)→B(a). The constant, linear and higher coefficients of the displayed limit are explicit. Uniqueness of coefficient limits proves the polynomial identity.

**Acceptance checks.** No compactness of the evaluation ball or field hypothesis is needed. At a=0 the formula records the rank-one padded zero root.

**Sources.** [P-adic Banach Spaces and Families of Modular Forms](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A3, published435/PDF19: definition of D and LemmaA3.8; full published435–436 freshly read28 September2026, with preceding full432–436 reading retained.. Worker decomposition of the case of entire functional input B and fixed normalized polynomial characteristic input P. A fixed monic remainder and bounded output degree justify coefficient and all-radius Gauss convergence. This does not assert uniformity as the characteristic degree grows, the full entire-input construction, or the infinite-operator comparison.

### Affinoid-valued analytic stages

`L4/affinoid-analytic-stage` · construction.

For a complete affinoid K-algebra A with a chosen submultiplicative Banach norm, define the normalized finite-chart analytic stage A_h(X,A) by c₀(S×N^d,A), realized as restricted analytic functions in the chart coordinates. This is an orthonormalizable Banach A-module; its natural integral lattice consists of coefficient families in the norm unit ball A₀.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L0/multivariable-fixed-radius`, `LocallyAnalyticDistributions:L4/orthonormalizable-modules`.

**Proof outline.** Use the existing c₀ carrier with pointwise A action and its complete sup norm. Interpret its coefficients by uniform nonarchimedean summation on each normalized chart.

**Uses.** Urban Definition 3.4.10: Uniformly analytic weight families are ONable A-modules. Compact semigroup action: Truncation in analytic variables gives finite A-image.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.AnalyticDistributions.affinoidAnalyticStage` | The native c₀ coefficient module over A. |
| `TauCeti.AnalyticDistributions.affinoidAnalyticStage_ext` | Coefficient equality determines a section. |
| `TauCeti.AnalyticDistributions.affinoidAnalyticStage_integral` | The chosen lattice is exactly the norm≤1 coefficient families. |

**Unit tests.**

- `AnalyticDistributionTests.affinoidStage_scalar` (compatibility): A=K recovers the scalar coefficient stage.
- `AnalyticDistributionTests.affinoidStage_point` (computation): The singleton coefficient index gives A.
- `AnalyticDistributionTests.affinoidStage_empty` (degenerate): An empty chart set gives zero.

**Acceptance checks.** At a point the stage is A.

**Sources.** [Eigenvarieties for reductive groups](https://www.math.columbia.edu/~urban/eurp/eigen.pdf), Lemmas 3.4.6–3.4.7 and Definition 3.4.10, author pp. 43–45. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Affinoid-valued Banach-stage distributions

`L4/affinoid-distribution-stage` · definition.

Define D_h(X,A)=Hom_(A,cts)(A_h(X,A),A) with its operator norm. Restriction of function stages induces maps D_(h+1)→D_h; their projective limit is the A-valued locally analytic distribution space. For the c₀ basis a stage dual is a bounded coefficient family, not a c₀ family.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/affinoid-analytic-stage`, `LocallyAnalyticDistributions:L0/compact-type-dual-reflexivity`.

**Proof outline.** Use the native continuous A-linear dual; its coefficient values are bounded. Extend a bounded coefficient family to c₀ by summation, and identify the operator norm under the chosen orthonormal normalization. Completeness and the locally convex projective limit over general affinoids require the explicitly recorded norm/limit interface.

**Uses.** Specialization and universal weight actions: Defines the actual coefficients acted on by transposed operators. Unbounded distributions: Passing through all radii includes positive-order distributions.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.AnalyticDistributions.affinoidDistributionStage` | The continuous A-linear dual of the analytic coefficient stage. |
| `TauCeti.AnalyticDistributions.affinoidDistributionStage_apply` | A stage distribution evaluates an analytic function in A. |
| `TauCeti.AnalyticDistributions.affinoidDistributionStage_ext` | Equality on every basis coefficient determines the functional. |

**Unit tests.**

- `AnalyticDistributionTests.distributionStage_point` (compatibility): For a point, evaluation at 1 identifies the dual with A.
- `AnalyticDistributionTests.distributionStage_zero` (degenerate): The zero functional has norm zero.
- `AnalyticDistributionTests.distributionStage_bounded_not_c0` (non-example): The functional summing all coefficients has basis values constantly 1, so lies in the dual while its basis family is not c₀ on an infinite index set.

**Acceptance checks.** The dual may contain families whose coefficients do not tend to zero.

**Sources.** [Eigenvarieties for reductive groups](https://www.math.columbia.edu/~urban/eurp/eigen.pdf), Lemmas 3.4.6–3.4.7 and Definition 3.4.10, author pp. 43–45. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Integral distribution lattices

`L4/family-integral-lattice` · construction.

In a chosen normalized analytic stage, the integral distribution lattice is {μ∈D_h(X,A):‖μ‖≤1}; equivalently μ takes the analytic coefficient unit ball to A₀={a:‖a‖≤1}. This lattice is tied to the chosen Banach model. It is not asserted to equal all power-bounded elements of a nonreduced affinoid.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/affinoid-distribution-stage`.

**Proof outline.** Use basis coefficient values and the ultrametric summation bound to characterize norm≤1. Stability under A₀ multiplication follows from the submultiplicative norm.

**Uses.** Integral coefficient models: Tracks actual norm bounds before reduction or specialization. Family semigroup action: A norm≤1 action preserves this lattice.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.AnalyticDistributions.familyIntegralLattice` | The stage-dual norm unit ball. |
| `TauCeti.AnalyticDistributions.familyIntegralLattice_mem` | Membership is the norm bound ≤1. |
| `TauCeti.AnalyticDistributions.familyIntegralLattice_smul` | A₀ scalar multiplication preserves the lattice. |

**Unit tests.**

- `AnalyticDistributionTests.integralLattice_zero` (degenerate): Zero belongs to the lattice.
- `AnalyticDistributionTests.integralLattice_point` (computation): At a point, multiplication by a lies in the lattice iff ‖a‖≤1.
- `AnalyticDistributionTests.integralLattice_boundary` (non-example): Multiplication by p^(−1) is outside the lattice for the normalized p-adic norm.

**Acceptance checks.** The chosen norm and lattice are part of the input.

**Sources.** [Eigenvarieties for reductive groups](https://www.math.columbia.edu/~urban/eurp/eigen.pdf), Lemmas 3.4.6–3.4.7 and Definition 3.4.10, author pp. 43–45. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Scalar tensors of analytic stages

`L4/analytic-completed-tensor` · comparison.

For affinoid A/K and scalar c₀ stage E, the canonical map E⊗̂_(K,π)A→A_h(X,A) is an isomorphism of Banach A-modules, under the standard completed projective nonarchimedean tensor norm. This compares existing algebraic TensorProduct plus its separated completion; it does not replace that carrier.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L0/multivariable-fixed-radius`, `LocallyAnalyticDistributions:L4/affinoid-analytic-stage`, `LocallyAnalyticDistributions:L4/completed-base-change`.

**Proof outline.** Send the scalar basis tensored with a to the corresponding A-valued coefficient. Finite-support coefficient families lie in the image and are dense; the crossnorm bounds give completion and its inverse. A native separated projective tensor norm/completion and its universal property remain an explicit foundational gap.

**Acceptance checks.** For a singleton index K⊗̂_K A≃A.

**Sources.** [Eigenvarieties for reductive groups](https://www.math.columbia.edu/~urban/eurp/eigen.pdf), Lemmas 3.4.6–3.4.7 and Definition 3.4.10, author pp. 43–45. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### The canonical distribution scalar-extension map

`L4/dual-scalar-extension-map` · construction.

The bilinear map D_h(X,K)×A→D_h(X,A) sends (μ,a) to the A-linear extension of μ on the scalar analytic stage, multiplied by a. It induces a continuous map D_h(X,K)⊗̂_K A→D_h(X,A). Isomorphism for infinite-dimensional A is not asserted.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/analytic-completed-tensor`, `LocallyAnalyticDistributions:L4/affinoid-distribution-stage`.

**Proof outline.** Apply the analytic tensor universal property to extend μ on simple tensors. Check the operator norm estimate before extending the distribution tensor map. For finite-dimensional A the coordinate-basis argument makes it an isomorphism; for a general affinoid, a separate image/base-change theorem is required.

**Uses.** Family specialization: Provides coefficient extension without assuming a dual/tensor isomorphism. Positive-order family coefficients: Extends unbounded distributions as well as measures.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.AnalyticDistributions.distributionScalarExtension` | The continuous map from the completed scalar tensor induced by the specified bilinear coefficient extension. |
| `TauCeti.AnalyticDistributions.distributionScalarExtension_pure` | On μ⊗a its coefficient at e_α is μ(e_α)a. |
| `TauCeti.AnalyticDistributions.distributionScalarExtension_finite` | For finite-dimensional A/K this is an isomorphism; for arbitrary affinoids it is only a map. |

**Unit tests.**

- `AnalyticDistributionTests.dualExtension_scalar` (degenerate): For A=K it is the identity.
- `AnalyticDistributionTests.dualExtension_point` (compatibility): At a point K⊗̂_K A→Hom_A(A,A) is multiplication.
- `AnalyticDistributionTests.dualExtension_derivative` (computation): dδ_0⊗a has Amice coefficients a times those of log(1+T).

**Acceptance checks.** A=K gives the identity. Duals of infinite c₀ stages are bounded families, so their tensor base change is not automatic.

**Sources.** [Eigenvarieties for reductive groups](https://www.math.columbia.edu/~urban/eurp/eigen.pdf), Lemmas 3.4.6–3.4.7 and Definition 3.4.10, author pp. 43–45. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Specialization of distribution families

`L4/family-specialization` · construction.

For a bounded affinoid map A→B, the bilinear specialization of stage distributions is D_h(X,A)×B→D_h(X,B). On coefficients it sends μ(e_α)⊗b to image(μ(e_α))b. It is compatible with radius transitions. For a finite residue-field specialization it gives the character-fibre distribution; an isomorphism after completed tensor is a separate hypothesis.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/affinoid-distribution-stage`, `LocallyAnalyticDistributions:L4/dual-scalar-extension-map`.

**Proof outline.** Express a stage distribution by its bounded coefficient values and apply the bounded algebra map. Use the coefficient model to extend to the B-valued analytic stage. Verify radius-transition and evaluation compatibility on dense finite-support functions.

**Uses.** Universal-character action: Specializes the actual multiplier and coefficient values. Slope-adapted families: Distinguishes fibre evaluation from an unjustified dual base-change equivalence.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.AnalyticDistributions.familySpecialization` | Specialize bounded distribution coefficient families along a bounded A→B map. |
| `TauCeti.AnalyticDistributions.familySpecialization_coeff` | Basis coefficient values map by the specified algebra homomorphism. |
| `TauCeti.AnalyticDistributions.familySpecialization_comp` | Successive bounded coefficient maps compose on every coefficient. |

**Unit tests.**

- `AnalyticDistributionTests.specialization_identity` (degenerate): Specialization along A→A is the identity.
- `AnalyticDistributionTests.specialization_atom` (computation): A-valued aδ_x specializes to image(a)δ_x.
- `AnalyticDistributionTests.specialization_logarithm` (compatibility): For finite field specialization the unbounded Amice series specializes coefficientwise, including log(1+T).

**Acceptance checks.** Specialization acts on each coefficient, including a derivative point mass.

**Sources.** [Eigenvarieties for reductive groups](https://www.math.columbia.edu/~urban/eurp/eigen.pdf), Lemmas 3.4.6–3.4.7 and Definition 3.4.10, author pp. 43–45. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Universal-character coefficient action

`L4/universal-character-coefficient-action` · construction.

Let a semigroup Σ act by analytic maps φ_σ on charts and analytic A-valued multipliers j_σ obtained by evaluating the imported universal character. Suppose φ_(στ)=φ_σ∘φ_τ and j_(στ)=j_τ·(j_σ∘φ_τ), with unit identities. The right function action is R_σf=j_σ(f∘φ_σ); the left distribution action is U_σμ=μ∘R_σ. The actual universal character and the automorphic semigroup are supplier inputs.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/affinoid-analytic-stage`, `LocallyAnalyticDistributions:L4/affinoid-distribution-stage`, `LocallyAnalyticDistributions:L1/distribution-multiply`, `LocallyAnalyticDistributions:L1/distribution-pushforward`, `PadicMeasuresIwasawaAlgebras:L0a`.

**Proof outline.** At uniform radii construct bounded pullback and multiplication maps. Compose the maps on functions and transpose them to the stage dual. The cocycle identities determine the handedness; no p-adic group representation theory is reconstructed here.

**Uses.** RS-16 transferred PMIA coefficient action: One owner supplies the analytic family action. PadicFamilies L2a: Specialized compact actions provide the finite-slope input.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.AnalyticDistributions.coefficientAction` | Compose a bounded analytic pullback with a bounded analytic multiplier. |
| `TauCeti.AnalyticDistributions.coefficientAction_apply` | (U_σμ)(f)=μ(j_σ(f∘φ_σ)). |
| `TauCeti.AnalyticDistributions.coefficientAction_comp` | U_σU_τ=U_(στ) from R_τR_σ=R_(στ). |

**Unit tests.**

- `AnalyticDistributionTests.coefficientAction_identity` (degenerate): Identity pullback and multiplier return μ.
- `AnalyticDistributionTests.coefficientAction_dirac` (computation): U_σδ_x=j_σ(x)δ_(φ_σ(x)).
- `AnalyticDistributionTests.coefficientAction_specialization` (compatibility): Specializing the multiplier and coefficient values gives the specialized action.

**Acceptance checks.** The identity multiplier and identity pullback act trivially.

**Sources.** [Eigenvarieties for reductive groups](https://www.math.columbia.edu/~urban/eurp/eigen.pdf), Lemmas 3.4.6–3.4.7 and Definition 3.4.10, author pp. 43–45. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Cocycle law and handedness

`L4/coefficient-action-cocycle` · lemma.

Under the preceding cocycle identities, R_τ∘R_σ=R_(στ) and U_σ∘U_τ=U_(στ). Thus the function action is right and the dual action is left; reversing the composition of pullbacks reverses the semigroup law.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/universal-character-coefficient-action`.

**Proof outline.** Expand R_τ(R_σf), then use the multiplier and chart-map identities. Transpose composition, which reverses its order.

**Acceptance checks.** For constant multipliers a_σ, the scalar product remains a_τa_σ in the commutative A-algebra.

**Sources.** [Eigenvarieties for reductive groups](https://www.math.columbia.edu/~urban/eurp/eigen.pdf), Lemmas 3.4.6–3.4.7 and Definition 3.4.10, author pp. 43–45. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### A common radius for universal weights

`L4/uniform-family-radius` · lemma.

On each affinoid U of imported character space, its universal character is analytic jointly in weight and in a sufficiently small subgroup p^{n(U)}Z_p^d. Consequently all its analytic multipliers use one common function stage over A=O(U). The radius depends on U, not on an individual weight.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/affinoid-analytic-stage`, `PadicMeasuresIwasawaAlgebras:L0a`.

**Proof outline.** Bound |κ(γ_i)−1|≤R<1 on a finite affinoid cover. Choose n so κ(γ_i)^{p^n}−1 is uniformly inside a convergent binomial/exponential radius. Use the uniform binomial coefficient estimate and multiply the finitely many coordinate expansions. Do not rely on the source’s omission of the constant term in its displayed binomial sum.

**Acceptance checks.** At p=2 a smaller principal-unit subgroup is required.

**Sources.** [Eigenvarieties for reductive groups](https://www.math.columbia.edu/~urban/eurp/eigen.pdf), Lemmas 3.4.6–3.4.7, author pp. 43–44. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Complete continuity from analytic contraction

`L4/contracting-family-compactness` · lemma.

If the coordinate pullback of a semigroup element maps a finite-chart analytic stage strictly inside its analytic polydiscs and its multiplier is bounded at the destination radius, the resulting operator on functions is A-completely continuous. Its transposed action between the dual stages has finite A-image approximants with the same tail estimate. Applying Fredholm theory to a same-stage dual module additionally requires its (Pr) property, which is not implied by taking a continuous dual.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/universal-character-coefficient-action`, `LocallyAnalyticDistributions:L4/uniform-family-radius`, `LocallyAnalyticDistributions:L0/radius-restriction-compact`, `LocallyAnalyticDistributions:L4/completely-continuous`.

**Proof outline.** Truncate the destination Taylor expansion after centering the strict image charts at total degree N; the error is ≤Cρ^N for some ρ<1. Multiplication by the bounded automorphy factor preserves the estimate and finite A-image. Transpose the finite-image coordinate approximants; verify boundedness and the operator norm estimate on the actual dual stage.

**Acceptance checks.** For A infinite-dimensional over K, finite A-image is sufficient; finite K-rank is not asserted. A noncontracting identity on an infinite analytic-variable stage is not compact by this argument.

**Sources.** [Eigenvarieties for reductive groups](https://www.math.columbia.edu/~urban/eurp/eigen.pdf), Lemmas 3.4.6–3.4.7 and Definition 3.4.10, author pp. 43–45. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Compact algebra maps with nilpotent coordinate images

`L4/pan-tate-compactness` · theorem.

Let K be Q_p or a finite extension, B a K-Banach algebra, and f:K〈T₁,…,T_d〉→B a continuous K-algebra homomorphism. If every f(T_i) is topologically nilpotent then f is compact as a K-linear map. In particular K〈T〉→K〈T/p〉 is compact.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L0/radius-restriction-compact`.

**Proof outline.** For a monomial of sufficiently large total degree one coordinate exponent is large; nilpotence makes its image uniformly small, using submultiplicativity. Truncate to finitely many monomials and use local compactness of K to make their bounded coefficient image precompact. The compactness/finite-rank equivalence here is over the locally compact field K, not an arbitrary A-algebra.

**Acceptance checks.** The unit image f(1)=1 is allowed; only coordinate images must be topologically nilpotent.

**Sources.** [On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366v1), §2.2.1 and Example 2.2.2, arXiv p. 13. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Compactness for bounded formal-series inputs

`L4/pan-formal-compactness` · theorem.

Let A=Z_p〈T₁,…,T_d〉[[x]][1/p] with the coefficient-sup Banach norm on bounded formal x-series. A continuous Q_p-algebra homomorphism f:A→B is compact when f(T_i) and f(x) are all topologically nilpotent. This A is larger than the restricted Tate algebra in x.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/pan-tate-compactness`.

**Proof outline.** Modulo x^N, truncate each of the finitely many Tate coefficients in T. The remaining formal tail is x^N times a bounded unit-ball element; continuity and nilpotence of f(x) bound its image. The resulting finite-dimensional Q_p approximants converge uniformly on the source unit ball. Polynomials are not norm dense in the formal x direction, so polynomial density cannot replace this tail argument.

**Acceptance checks.** Σ_(n≥0)x^n belongs to the source formal Banach algebra but not Q_p〈x〉.

**Sources.** [On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366v1), §2.2.1 and Example 2.2.2, arXiv p. 13. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Bounded complexes of projective Banach modules

`L4/banach-cochain-complex` · definition.

A Banach complex over affinoid A is a native cochain complex of A-modules with degreewise compatible complete Banach norms, continuous differentials, and only finitely many nonzero degrees. In the projective Banach complex category every degree has the inherited property (Pr); this does not mean it is a finite-projective A-module. Morphisms and homotopies have continuous degreewise components. Each chosen norm is K-homogeneous and the A-action satisfies a uniform bound ‖ax‖≤c‖a‖‖x‖ for some c≥0 on each term. Normed models are explicitly identified with the native ModuleCat terms; no replacement cochain category is introduced.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/projective-banach-modules`, `mathlib:CochainComplex`, `mathlib:ModuleCat`.

**Proof outline.** Use the native HomologicalComplex differential and its square-zero equations. Attach only degreewise norm/completeness/continuity data and (Pr), not a competing complex or derived category. The homotopy category must use continuous homotopies; arbitrary algebraic homotopies do not automatically preserve these structures.

**Uses.** Pilloni §13.1.2 and BCGP21 §6.1.1: A representative carries degreewise compactness and a characteristic product. Finite-slope perfect complex: Compactness makes the finite window finite projective.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.AnalyticDistributions.IsProjectiveBanachComplex` | Degreewise Banach/(Pr), continuous differentials and finite support. |
| `TauCeti.AnalyticDistributions.projectiveBanachComplex_zero` | The zero complex satisfies these conditions. |
| `TauCeti.AnalyticDistributions.projectiveBanachComplex_shift` | Degree shifts transport the norms, differentials and finite support. |

**Unit tests.**

- `AnalyticDistributionTests.banachComplex_one_degree` (compatibility): A Banach (Pr) module in degree zero is a projective Banach complex.
- `AnalyticDistributionTests.banachComplex_infinite_rank` (non-example): c_A(N) in degree zero is allowed although it is not a finite-projective algebraic A-module.
- `AnalyticDistributionTests.banachComplex_differential` (computation): A→A with identity differential in consecutive degrees is an acyclic projective Banach complex.

**Acceptance checks.** A one-degree complex recovers a projective Banach module.

**Sources.** [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf), §§13.1.1–13.1.3, author pp. 84–85. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Degreewise completely continuous representatives

`L4/compact-complex-representative` · definition.

A continuous cochain endomorphism U of a bounded projective Banach complex is degreewise completely continuous if each U^i satisfies the single inherited A-complete-continuity predicate. The chain condition dU=Ud is required; independent operators in the degrees do not define a complex endomorphism.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/banach-cochain-complex`, `LocallyAnalyticDistributions:L4/completely-continuous`.

**Proof outline.** Use the continuous degree map from the native cochain morphism. Evaluate the imported complete-continuity predicate degreewise.

**Uses.** Pilloni characteristic series: Determinants are defined for the chosen degreewise compact representative. Finite slope subcomplex: The differential commutes with its degree operators.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.AnalyticDistributions.DegreewiseCompletelyContinuous` | Every continuous degree map has finite A-image approximants. |
| `TauCeti.AnalyticDistributions.degreewiseCompletelyContinuous_zero` | The zero cochain endomorphism is compact in every degree. |
| `TauCeti.AnalyticDistributions.degreewiseCompletelyContinuous_add` | Sums of two such representatives have the same property. |

**Unit tests.**

- `AnalyticDistributionTests.complexCompact_one_degree` (compatibility): A concentrated complex gives module-level complete continuity.
- `AnalyticDistributionTests.complexCompact_finite_free` (computation): Every bounded endomorphism of a finite free complex is degreewise compact.
- `AnalyticDistributionTests.complexCompact_missing_degree` (non-example): Identity on c_K(N) in one nonzero degree is not degreewise compact.

**Acceptance checks.** At a single degree this is the existing module predicate.

**Sources.** [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf), §§13.1.1–13.1.3, author pp. 84–85. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Compactness of a homotopy endomorphism

`L4/compact-homotopy-endomorphism` · definition.

An endomorphism class in the continuous homotopy category of bounded projective Banach complexes is compact if it has a degreewise completely continuous representative. This is an existential property of the class, not a claim that every representative is compact.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/compact-complex-representative`, `mathlib:Homotopy`.

**Proof outline.** Use native cochain homotopy together with continuity of all homotopy components. A second homotopy representative defines the same class; transitivity gives representative independence of the existential property.

**Uses.** Pilloni §13.1.2: Compactness is a property in the homotopy category. BCGP21 finite-slope cohomology: A chosen representative produces the finite perfect model.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.AnalyticDistributions.CompactHomotopyEndomorphism` | There exists a continuous homotopic degreewise compact representative. |
| `TauCeti.AnalyticDistributions.compactHomotopyEndomorphism_of_rep` | A degreewise compact representative determines a compact class. |
| `TauCeti.AnalyticDistributions.compactHomotopyEndomorphism_homotopy` | Continuous homotopic endomorphisms have the same compactness property. |

**Unit tests.**

- `AnalyticDistributionTests.homotopyCompact_zero` (degenerate): The zero class is compact.
- `AnalyticDistributionTests.homotopyCompact_one_degree` (compatibility): A one-degree complex has no nontrivial homotopies, so this agrees with module compactness.
- `AnalyticDistributionTests.homotopyCompact_contractible` (computation): The identity of A→A with identity differential is homotopic to zero and hence compact.

**Acceptance checks.** A homotopy-to-zero endomorphism is compact through the zero representative.

**Sources.** [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf), §§13.1.1–13.1.3, author pp. 84–85. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Characteristic series of a compact complex representative

`L4/representative-fredholm-product` · construction.

For a chosen degreewise compact representative Ũ on a bounded projective Banach complex C, put P_(C,Ũ)(T)=∏_(i:C^i≠0)det(1−TŨ^i). This is a finite nonalternating product. It is an auxiliary entire series attached to the representative and is not an invariant of the homotopy class.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/compact-complex-representative`, `LocallyAnalyticDistributions:L4/summand-fredholm-theory`.

**Proof outline.** Use the inherited determinant in every degree and multiply over a finite support interval. Zero modules contribute 1; enlarging the support interval does not change the product.

**Uses.** Pilloni §13.1.2 and BCGP21 §6.1.1: The finite-window factorization uses a characteristic product of a representative. PadicFamilies L2a: Cohomology support is constructed from finite windows, not identified with every raw product zero.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.AnalyticDistributions.complexFredholmProduct` | Finite product of the chosen degree determinants. |
| `TauCeti.AnalyticDistributions.complexFredholmProduct_coeff_zero` | Its constant coefficient is 1. |
| `TauCeti.AnalyticDistributions.complexFredholmProduct_enlarge` | Adding zero degrees leaves the product unchanged. |

**Unit tests.**

- `AnalyticDistributionTests.complexProduct_empty` (degenerate): The empty product is 1.
- `AnalyticDistributionTests.complexProduct_single` (compatibility): One degree gives det(1−TU).
- `AnalyticDistributionTests.complexProduct_acyclic` (non-example): For A→A with differential 1 and Ũ=a in both degrees, the product is (1−aT)^2, whereas the zero complex has product 1.

**Acceptance checks.** A degree-zero complex gives the usual determinant.

**Sources.** [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf), §§13.1.1–13.1.3, author pp. 84–85. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Entirety of the representative product

`L4/complex-product-entire` · lemma.

The chosen representative product is entire over A and has constant coefficient 1. Finite multiplication of its degree Fredholm series is legitimate in the entire Gauss topology.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/representative-fredholm-product`, `LocallyAnalyticDistributions:L4/entire-gauss-multiplication-limit`.

**Proof outline.** Apply the inherited complete-continuity determinant theorem in each of finitely many degrees. Use continuity of finite multiplication for each Gauss radius.

**Acceptance checks.** The product of two copies of 1−aT is a degree-two polynomial.

**Sources.** [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269), §6.1.1, arXiv p. 139; Theorem 6.3.16 and proof, arXiv pp. 152–153. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### A contractible-complex test for characteristic products

`L4/representative-product-dependence` · lemma.

The acyclic complex A→A with differential 1 and scalar endomorphism a has raw characteristic product (1−aT)^2; its zero homotopy model has product 1. Consequently this raw product cannot define an invariant spectral support of derived cohomology.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/representative-fredholm-product`, `LocallyAnalyticDistributions:L4/compact-homotopy-endomorphism`.

**Proof outline.** The scalar maps commute with the differential and their determinants are 1−aT. The identity complex is contractible by its inverse differential. Its cohomology is zero, while for a≠0 the raw product has a zero after coefficient extension.

**Acceptance checks.** At a=1 the two products are (1−T)^2 and 1.

**Sources.** [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf), §§13.1.1–13.1.3, author pp. 84–85. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Numerical h-slope decomposition

`L4/numerical-slope-decomposition` · definition.

For a continuous operator U on a Banach A-module, an h-slope decomposition is M=M^{≤h}⊕M^{>h}, continuously split and U-stable, with M^{≤h} finite projective, annihilated by a monic polynomial with unit constant term whose roots on every geometric rank-one fibre have valuation ≤h, and every monic polynomial with unit constant term and roots of valuation ≤h on every such fibre acting invertibly on M^{>h}. In reciprocal Fredholm coordinates Q(0)=1, the corresponding roots of Q have valuation ≥−h. The complement uses ≤h, including the endpoint. The annihilator excludes zero eigenvalues; zero has valuation +∞ and belongs to the >h part for finite h.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/finite-slope-summands`.

**Proof outline.** Use the inherited coprime Fredholm factorization to construct the two summands on slope-adapted affinoids. Translate eigenvalues to reciprocal Fredholm roots and retain the endpoint in the polynomial invertibility test. Numerical slopes require the valued geometric-fibre and root-location interface; this interface is explicitly absent from the current typed prototype.

**Uses.** Urban Lemma 2.3.2 and Corollary 2.3.3: The polynomial complement condition yields functoriality and uniqueness. Finite-slope complexes: Every differential respects the selected numerical slope projector.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.AnalyticDistributions.NumericalSlopeDecomposition` | The continuous split, finite-projective ≤h summand and inclusive complement invertibility conditions. |
| `TauCeti.AnalyticDistributions.numericalSlope_projector` | The projector has image M^{≤h} and kernel M^{>h}. |
| `TauCeti.AnalyticDistributions.numericalSlope_module_comparison` | A slope-adapted Fredholm factorization supplies this numerical decomposition on its fibres. |

**Unit tests.**

- `AnalyticDistributionTests.slope_endpoint` (computation): For U=p^h on K with integral h, M^{≤h}=K and M^{>h}=0.
- `AnalyticDistributionTests.slope_zero_operator` (degenerate): For U=0 and finite h, M^{≤h}=0 and M^{>h}=K.
- `AnalyticDistributionTests.slope_reciprocal_sign` (compatibility): For U=p on K, the eigenvalue has valuation 1 and the Fredholm root p^(−1) has valuation −1.

**Acceptance checks.** A scalar eigenvalue of valuation h lies in ≤h and cannot also lie in >h. For U=0 and finite h the ≤h summand is zero; allowing X as a finite-slope annihilator would incorrectly admit a zero eigenvalue.

**Sources.** [Eigenvarieties for reductive groups](https://www.math.columbia.edu/~urban/eurp/eigen.pdf), §2.3, Definitions 2.3.1 and 2.3.6, Lemma 2.3.2 and Corollaries 2.3.3–2.3.4, author pp. 23–25. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Functoriality of slope projectors

`L4/slope-functoriality` · lemma.

A continuous A-linear map intertwining two operators with h-slope decompositions preserves their ≤h and >h summands, and commutes with the projectors.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/numerical-slope-decomposition`, `LocallyAnalyticDistributions:L4/riesz-projector-closure`.

**Proof outline.** For the ≤h source choose its annihilating slope polynomial; invertibility on the target complement forces the cross-component map to vanish. Use the target polynomial on its finite summand to eliminate the other cross component.

**Acceptance checks.** A differential commuting with U preserves the finite-slope summands.

**Sources.** [Eigenvarieties for reductive groups](https://www.math.columbia.edu/~urban/eurp/eigen.pdf), Lemma 2.3.2, author pp. 23–24. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Uniqueness of the h-slope decomposition

`L4/slope-uniqueness` · lemma.

An h-slope decomposition with the inclusive complement condition is unique as a continuous pair of summands. The projectors agree for any two such decompositions.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/slope-functoriality`.

**Proof outline.** Apply functoriality to the identity in both directions. Both decompositions have identical finite-slope and complementary submodules, hence the same projector.

**Acceptance checks.** For U=p^h on K with integral h, omitting the endpoint would permit incompatible decompositions.

**Sources.** [Eigenvarieties for reductive groups](https://www.math.columbia.edu/~urban/eurp/eigen.pdf), Corollary 2.3.3, author p. 24. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### The finite-slope subcomplex

`L4/slope-subcomplex` · lemma.

If a degreewise compact cochain representative admits a common h-slope decomposition in every degree, the ≤h summands form a bounded subcomplex, the >h summands form its complementary subcomplex, and the cochain projections are continuous.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/compact-complex-representative`, `LocallyAnalyticDistributions:L4/slope-functoriality`.

**Proof outline.** Apply slope functoriality to every differential using dŨ=Ũd. Assemble the degree projectors into native cochain morphisms.

**Acceptance checks.** For a one-degree complex this is the module decomposition.

**Sources.** [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf), §§13.1.1–13.1.3, author pp. 84–85. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### A finite perfect model on a slope window

`L4/finite-slope-perfect-complex` · theorem.

On an affinoid where the chosen representative product has a slope-adapted coprime factorization selecting the same finite h-window in each degree, the preceding ≤h subcomplex is a bounded complex of finite-projective A-modules, hence a perfect complex. Only the selected finite window has this algebraic finiteness assertion.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/complex-product-entire`, `LocallyAnalyticDistributions:L4/slope-subcomplex`, `LocallyAnalyticDistributions:L4/finite-slope-summands`.

**Proof outline.** Refine to finitely many simultaneous degree factorization neighborhoods; obtain finite-projective summands from the module Riesz theorem. Assemble their differentials by slope functoriality. Apply the algebraic criterion for a perfect complex: a bounded finite-projective representative. The corresponding formal coefficient/perfect-complex interface and canonical finite-module norm topology remain recorded gaps; no baseline declaration is asserted for them.

**Acceptance checks.** The original Banach complex may have infinite-rank terms.

**Sources.** [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269), §6.1.1, arXiv p. 139; Theorem 6.3.16 and proof, arXiv pp. 152–153. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Cohomology and finite slopes

`L4/cohomology-slope-comparison` · comparison.

For such a split cochain representative, H^j(C^{≤h}) identifies algebraically with the h-slope part of H^j(C). Cohomology is formed as ker d/im d even when im d is not closed; no Hausdorff Banach norm on arbitrary H^j(C) is assumed.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/slope-subcomplex`, `LocallyAnalyticDistributions:L4/finite-slope-perfect-complex`.

**Proof outline.** The direct sum of subcomplexes yields the direct sum of algebraic cohomology groups. The polynomial invertibility conditions descend to the cohomology of the complementary subcomplex; the finite summand is annihilated by an appropriate product of its degree polynomials. Use Urban Proposition 2.3.10 for the non-Hausdorff quotient formulation.

**Acceptance checks.** The finite-slope cohomology is a finite A-module, without forcing the full quotient image to be closed.

**Sources.** [Eigenvarieties for reductive groups](https://www.math.columbia.edu/~urban/eurp/eigen.pdf), Propositions 2.3.9–2.3.10, author pp. 26–27. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Homotopy invariance on a finite slope window

`L4/finite-slope-homotopy-invariance` · lemma.

Continuous U-equivariant cochain homotopy equivalences induce homotopy equivalences between their finite h-slope complexes on common slope-adapted affinoids. Their finite-slope cohomology and coherent support agree, even though their raw representative products may differ.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/slope-functoriality`, `LocallyAnalyticDistributions:L4/finite-slope-perfect-complex`, `LocallyAnalyticDistributions:L4/cohomology-slope-comparison`.

**Proof outline.** Restrict the intertwining cochain maps and U-equivariant continuous homotopies using the slope projectors. For homotopies or representative comparisons which commute with U only up to homotopy, supply the corrected homotopy-category finite-slope functor theorem rather than pretend pointwise commutation; that stronger input remains a gap. Deduce the finite-window cohomology isomorphism in the stated equivariant case.

**Acceptance checks.** Contractible summands have zero finite-slope cohomology despite their extra raw determinant zeros.

**Sources.** [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf), §§13.1.1–13.1.3, author pp. 84–85. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Derived base change of a finite slope complex

`L4/derived-slope-base-change` · comparison.

On compatible slope-adapted affinoids A→B, the finite perfect slope complex base changes to C^{≤h}⊗_A B and represents its derived tensor product. It agrees with the finite slope complex over B once the imported operator/factorization base-change hypotheses hold. Cohomology commutes with underived base change only under additional flatness or vanishing-Tor hypotheses.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/finite-slope-perfect-complex`, `LocallyAnalyticDistributions:L4/completed-base-change`.

**Proof outline.** Tensor the finite-projective degree modules and their differential matrices. Use the module projector/Fredholm base-change comparison on the selected factorization. The finite-projective representative computes derived tensor directly; use the native homological base-change interface, retained as a typing/refinement input.

**Acceptance checks.** For C=[A --t→ A] and B=A/(t), both resulting fibre cohomology groups can be nonzero; tensoring a single cohomology module would miss Tor.

**Sources.** [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269), §6.1.1, arXiv p. 139; Theorem 6.3.16 and proof, arXiv pp. 152–153. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Local constancy of exact-slope module rank

`L4/exact-slope-rank-local-constancy` · lemma.

For a compact operator on a projective Banach affinoid module and fixed finite h, the dimension of its exact-h fibre summand is locally constant near each rank-one point in the rank-one locus. Use slope-adapted finite-projective windows and neighborhoods on which the relevant eigenvalue norms remain in the selected bands. This assertion is not a cover of all higher-rank points of Spa(A).

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/numerical-slope-decomposition`, `LocallyAnalyticDistributions:L4/finite-slope-summands`.

**Proof outline.** Isolate the finitely many roots in a bounded slope window near the point. Choose strict gaps around h for all unequal slopes and use the local finite factorization to preserve multiplicities of the exact-h band. Coleman A5.5 is stated over the closed-disc base; extension to general affinoids and nonreduced finite-projective rank remains an explicit proof input.

**Acceptance checks.** For a scalar nonzero a, perturbations smaller than |a| have the same valuation.

**Sources.** [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf), Proposition 13.1.3.1 and proof, author p. 85; Coleman Proposition A5.5 and Corollary A5.5.1, printed pp. 441–442. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Local constancy of the finite-slope Euler characteristic

`L4/finite-slope-euler-local-constancy` · theorem.

For a bounded finite-projective slope complex in a rank-one weight neighborhood, the alternating sum of exact-h fibre cohomology dimensions is locally constant, equal to the alternating sum of the locally constant ranks of its exact-h terms. Individual cohomology dimensions may jump.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/finite-slope-perfect-complex`, `LocallyAnalyticDistributions:L4/exact-slope-rank-local-constancy`.

**Proof outline.** Use finite-dimensional Euler–Poincaré in each fibre to replace cohomology dimensions by term dimensions. Sum the finitely many locally constant exact-slope term ranks. Apply h=0 to the ordinary-window family in BCGP21 Theorem 6.3.16; the arithmetic perfect interpolation belongs to HigherHidaAndColemanTheory.

**Acceptance checks.** The family [A --t→ A] has Euler characteristic zero although both cohomology dimensions jump at t=0.

**Sources.** [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269), §6.1.1, arXiv p. 139; Theorem 6.3.16 and proof, arXiv pp. 152–153. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Extension through a factorized operator

`L4/factorized-finite-slope-extension` · lemma.

Suppose r:D→C and a:C→D are continuous intertwining maps with U_C=r a and U_D=a r. If a cohomology class f in C satisfies f=P(U_C)f with P(0)=0, write P=XQ and define its extension to D by a(Q(U_C)f). Then restricting it by r gives f. This is the type-correct finite-slope extension formula.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/cohomology-slope-comparison`.

**Proof outline.** Compute r a Q(U_C)f=U_C Q(U_C)f=P(U_C)f=f. Use the intertwining identities to remain in the selected finite-slope class.

**Acceptance checks.** For U_C=u·id_C with u≠0 and P(X)=X/u, the formula divides by u before applying a.

**Sources.** [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf), Corollary 13.2.4.2 and proof, author pp. 87–88. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Independence of the finite-slope extension polynomial

`L4/factorized-extension-independence` · lemma.

Under the factorized-map hypotheses and finite h-slope decompositions, restriction r:D^{≤h}→C^{≤h} is an isomorphism with inverse a·U_C^(−1). Therefore the finite-slope extension does not depend on the choice of P=XQ satisfying f=P(U_C)f.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/factorized-finite-slope-extension`, `LocallyAnalyticDistributions:L4/slope-functoriality`, `LocallyAnalyticDistributions:L4/numerical-slope-decomposition`.

**Proof outline.** On a finite finite-slope summand U is invertible because its annihilating polynomial has nonzero constant coefficient a unit on the affinoid window. Use the two factorizations to check r and aU_C^(−1) are inverses. Every admissible Q gives Q(U_C)f=U_C^(−1)f, hence the extension equality.

**Acceptance checks.** No extension is claimed for a zero-eigenvalue class.

**Sources.** [Eigenvarieties for reductive groups](https://www.math.columbia.edu/~urban/eurp/eigen.pdf), Corollary 2.3.4, author p. 24; Pilloni Corollary 13.2.4.2, author pp. 87–88. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Compact factorization on Fréchet presentations

`L4/compact-frechet-factorization` · definition.

Let V=lim_n V_n be a projective system of Banach modules with compact transition t_n:V_(n+1)→V_n. A compatible operator has compact-stage factorization when there are bounded a_n:V_n→V_(n+1) with U_n=t_n a_n and U_(n+1)=a_n t_n. This is additional data, not a consequence of Fréchet completeness.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/completely-continuous`, `LocallyAnalyticDistributions:L4/banach-cochain-complex`.

**Proof outline.** Specify the native continuous linear maps and their composition identities. Their compatible family induces the operator on the projective limit through the shared locally convex limit construction.

**Uses.** Urban Lemma 2.3.13: Transfers the same finite slope window between Banach presentations. Stein section module: Inner restrictions and raising maps must supply this data.

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.AnalyticDistributions.CompactStageFactorization` | Compact transitions t_n and bounded a_n with U_n=t_na_n and U_{n+1}=a_nt_n. |
| `TauCeti.AnalyticDistributions.compactStageFactorization_zero` | Compact transitions with zero stage operators admit a_n=0. |
| `TauCeti.AnalyticDistributions.compactStageFactorization_compatible` | The factorization implies U_n t_n=t_n U_{n+1}. |

**Unit tests.**

- `AnalyticDistributionTests.frechetFactor_zero` (degenerate): Zero stage operators factor through any compact transition system.
- `AnalyticDistributionTests.frechetFactor_finite` (computation): The constant system A with identity transitions and scalar U=a factors with a_n=a.
- `AnalyticDistributionTests.frechetFactor_noncompact` (non-example): The constant system c_K(N) with identity transitions fails the compact-transition condition, even if U=0.

**Acceptance checks.** An arbitrary continuous Fréchet endomorphism need not have this factorization.

**Sources.** [Eigenvarieties for reductive groups](https://www.math.columbia.edu/~urban/eurp/eigen.pdf), §2.3.12 and Lemma 2.3.13, author pp. 27–28. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Finite slopes of a compact Fréchet factorization

`L4/frechet-finite-slope` · theorem.

If the stage operators in the preceding factorization have h-slope decompositions with finite-projective ≤h summands, the transitions identify all stage ≤h summands; the induced Fréchet operator has this common finite-slope module. Its characteristic finite-window factor is independent of the chosen stage.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/compact-frechet-factorization`, `LocallyAnalyticDistributions:L4/factorized-extension-independence`, `LocallyAnalyticDistributions:L4/slope-uniqueness`.

**Proof outline.** Apply the factorized-map isomorphism to every pair of adjacent stages. Take the projective limit of the resulting isomorphism system on the finite summands. Use the canonical finite-module topology to identify the limiting module and its operator.

**Acceptance checks.** The statement requires the compact factorization, not just a compatible U_n.

**Sources.** [Eigenvarieties for reductive groups](https://www.math.columbia.edu/~urban/eurp/eigen.pdf), Lemma 2.3.13, author pp. 27–28. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Stein exhaustions for finite-slope operators

`L4/stein-frechet-interface` · comparison.

Import quasi-Stein/Stein spaces, their nested affinoid exhaustions, dense restriction maps and coherent Theorem B from AdicSpacesPartII R3. For a chosen coherent analytic coefficient sheaf, its section module is the Fréchet limit of affinoid section Banach modules. To use compact-stage factorization, the Stein exhaustion must give inner/compact restrictions in the actual coefficient norms; BCGP25’s relatively compact closure-proper criterion must be compared with the supplier’s Kiehl criterion.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `AdicSpacesPartII:R3/quasi-stein-space`, `AdicSpacesPartII:R3/quasi-stein-dense-restriction`, `AdicSpacesPartII:R3/quasi-stein-theorems-a-b`, `LocallyAnalyticDistributions:L4/compact-frechet-factorization`.

**Proof outline.** Use coherent acyclicity and sheaf gluing to identify the section inverse limit. Import the comparison of relative compactness/inner restrictions from the geometric owner; do not assert dense implies compact. For Banach or solid coefficient sheaves beyond coherent finite modules request the shared functional-analysis comparison.

**Acceptance checks.** The open unit disc has the usual increasing closed-disc exhaustion. A constant repeated closed-disc exhaustion is quasi-Stein but its identity restriction in positive dimension is not compact.

**Sources.** [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645), Definition 2.2.17, printed p. 21; §§4.6.46–4.6.49, printed pp. 93–95. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### The torus partial order on slopes

`L4/torus-slope-order` · comparison.

For the imported maximal split torus T, valuation lattice Λ=T(Q_p)/T(Z_p), and positive monoid T⁺ defined by nonnegative root valuations, put λ≥λ′ if 〈v(t),λ−λ′〉≥0 for every t∈T⁺. It is a partial order once the imported positive cone spans the valuation lattice. A character has slope λ exactly when v_pχ(t)=〈v(t),λ〉. The torus and root monoids are imported from ReductiveGroupsPartII.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `ReductiveGroupsPartII:RG2.1`, `PadicMeasuresIwasawaAlgebras:L0a`.

**Proof outline.** Reflexivity and transitivity follow from the inequalities. For antisymmetry use the spanning property of the positive cone from the root-data owner. A lattice splitting identifies the full character space of T(Q_p) with W_(T(Z_p))×(G_m^an)^rank; this is a noncanonical chart, not a new character-space owner.

**Acceptance checks.** For a one-generator monoid the order reduces to the ordinary numerical slope order. Central lattice directions with both signs force equality in those directions.

**Sources.** [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645), §1.8.5, printed p. 9; §§4.6.47–4.6.48, printed pp. 93–94. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

### Classical finite windows and solid localization

`L4/classical-solid-finite-window` · comparison.

For a compact single operator on a Banach space, the finite λ-slope windows give the classical finite-dimensional Riesz summands and their coherent character-space sheaf. BCGP25’s analytic solid finite-slope localization is f_*f^*, computed over affinoid exhaustions; its λ-bounded reconstruction is an inverse limit in the solid category. This layer supplies only the compact-operator finite-window comparison. The full solid localization and topological/solid tensor comparison are requested from the shared quasi-abelian functional-analysis Part II.

**Hypotheses.** Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm. Numerical slopes are tested on geometric rank-one fibres.

**Inputs.** `LocallyAnalyticDistributions:L4/finite-slope-perfect-complex`, `LocallyAnalyticDistributions:L4/stein-frechet-interface`, `LocallyAnalyticDistributions:L4/torus-slope-order`.

**Proof outline.** Apply the module slope theorem on each finite affinoid window. Transport those finite-projective modules through the shared solid comparison when it is supplied. Record f_*f^*, affinoid analytic-ring coefficients, and the inverse-limit topology as the precise requested contract. Algebraically inverting the monoid or taking a union of finite windows cannot establish it.

**Acceptance checks.** Q_p((X)) with X inverted has zero analytic finite-slope localization in the source example. A finite-dimensional nonzero-eigenvalue module already agrees with its own selected finite window.

**Sources.** [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645), §4.6.46 and Remark 4.6.49, printed pp. 93–95. Source-grounded contract; the proof steps specify any worker deduction and imported inputs separately.

## Closure obligations and ownership

### LocallyAnalyticDistributions:L0

Coverage: **partial**. Target contracts have been added across this stage in the 303-node pass. Existing composite declarations and the explicit foundational/proof gaps still need lemma-level refinement; the stage is not closed.

- Implement the native nonarchimedean locally convex stage/limit/strong-dual interface, including the compact-type reflexive duality and product completed inductive tensor theorem; ordered-field LocallyConvexSpace does not supply it.
- Close the left-heart strict-sequence comparison and the CN three-space proof dependencies: countable orthonormal bases, controlled quotient lifts, separated Ext¹ vanishing (Colmez–Gilles–Nizioł Lemma 2.5), and nuclear Fréchet extension (Dierolf–Roelcke Proposition 3.8).
- Refine the finite-manifold charts, multivariate substitution bounds and chart-realization signatures beyond the coefficient-stage prototype.

### LocallyAnalyticDistributions:L1

Coverage: **partial**. Target contracts have been added across this stage in the 303-node pass. Existing composite declarations and the explicit foundational/proof gaps still need lemma-level refinement; the stage is not closed.

- Implement the strong-dual operation signatures through the L0 carrier; the native stage transpose prototype is not a completed global locally analytic construction.
- Decompose the open-disc differentiation/substitution estimates and the strict smooth-quotient argument behind Kohlhaase Proposition 4.2; prove the derivative/logarithm nonsplitting without adding a section.
- Refine all parts of the inherited composite Amice and primitive declarations to lemma density, preserving the positive transpose-derivative convention.

### LocallyAnalyticDistributions:L2

Coverage: **partial**. Target contracts have been added across this stage in the 303-node pass. Existing composite declarations and the explicit foundational/proof gaps still need lemma-level refinement; the stage is not closed.

- Refine Colmez C^r wavelet/density and tensor multidegree moment bounds; connect the typed native locally constant box indicators and refinement partition to the wavelet basis and completed tensor function realization.
- Close bounded pullback/chart invariance for higher vector orders and finite-group Fourier inversion over the specified splitting field.
- Independently verify E3 against an accessible published Loeffler chapter or author correction; the present counterexample and repaired tensor proof are scoped to arXiv v3.

### LocallyAnalyticDistributions:L3

Coverage: **partial**. Target contracts have been added across this stage in the 303-node pass. Existing composite declarations and the explicit foundational/proof gaps still need lemma-level refinement; the stage is not closed.

- Implement the multivariate unbounded Amice topological inverse, finite-character descent and the strong-dual/function-sheaf Mellin map over the imported PMIA character charts.
- Close the distribution coefficient extension, local weight derivative and rigid/adic sheaf comparisons; scalar bounded point evaluation is insufficient.
- Build the actual pseudomeasure numerator-to-sheaf gluing from the cited PMIA nodes and local analytic vanishing-order API; poles and denominator components must be retained.

### LocallyAnalyticDistributions:L4

Coverage: **partial**. Target contracts have been added across this stage in the 303-node pass. Existing composite declarations and the explicit foundational/proof gaps still need lemma-level refinement; the stage is not closed.

- Complete the inherited entire spectral-resultant construction/quantitative bounds, Coleman A3.8–A3.9 transport, canonical finite-module topology, and determinant/rank proofs over nonreduced coefficient rings.
- Implement the separated nonarchimedean projective tensor completion, analytic base change, dual scalar-extension image theorem and actual specialization. Verify (Pr) for each same-stage distribution module used in Fredholm theory instead of assuming it for all continuous duals.
- Close the actual universal-character semigroup chart/multiplier construction, uniform radii and destination Taylor tail estimates; import its arithmetic semigroup and root-data input.
- Refine the numerical-slope root-location/fibre interface, finite-slope functor for endomorphisms commuting up to continuous homotopy, and native perfect/derived base-change signatures. The representative-product counterexample forbids claiming raw spectral support invariant.
- Prove exact-h local constancy for general affinoids from finite slope windows; Coleman A5.5 only supplies the checked closed-disc base case. Preserve the rank-one restriction and the distinction between Euler characteristic and individual cohomology dimensions.
- Obtain the geometric Stein/inner compact-restriction comparison from AdicSpacesPartII R3 and the full solid f_*f^* comparison from the shared Part II proposal. Ordinary inversion or a direct union of finite windows does not discharge BCGP25.

### Recorded gaps

**BGR finite-module topology and inverse norm bounds.** Read and decompose canonical finite-module Banach topology, closedness and inverse norm bounds (BGR 3.7.2/2, 3.7.3/1–3 or a freely available equivalent). The existing algebraic finite-coordinate detection does not require these topological statements; the finite-coordinate injection/approximation and finite-Pr projectivity results do. Native Henkel open mapping does not itself supply a finite-module topology.

Needed by `LocallyAnalyticDistributions:L4/finite-module-topology`, `LocallyAnalyticDistributions:L4/finite-coordinate-injection`, `LocallyAnalyticDistributions:L4/finite-submodule-approximation`.

**Completed tensor products and the (Pr) exercises.** Supply the nonarchimedean projective tensor seminorm, separated completion and universal property in the shared functional-analysis foundation. Decompose c0 scalar extension, extension of continuous retractions and Buzzard Lemmas 2.12–2.13. A canonical completed dual-extension map is planned, but arbitrary infinite affinoid dual base change is not an isomorphism without extra hypotheses.

Needed by .

**Spectral resultant and Coleman transport.** The inherited finite polynomial and unrestricted finite-matrix spectral comparison, monic entire division, quotient/resultant algebra, all-radius Gauss continuity and normalized scalar truncation limit are retained. Remaining: quantitative bounds uniform in the unbounded degree of truncations of an entire characteristic series P; construction of the general entire D(B,P); Coleman A3.8(10)–(11) and infinite-operator A3.9 transport. Preserve B(0)=0 for rank padding and infinite transport, and the Q/Q*(0) normalization. Coefficientwise limits alone do not give evaluation continuity. Compare Coleman ideal-reduction and principal-minor determinants and transport through u plus zero.

Needed by .

**Finite free and finite projective algebra interfaces.** Native monic quotient basis, quotient algebra norm/resultant and polynomial Bezout criteria are already cited. Remaining: finite-projective determinant and Cayley–Hamilton, rank and leading coefficient over nonreduced coefficients, and the rectangular Sylvester identity in operator comparison. The A=K×K and dual-number tests must remain; field-only ranks do not suffice.

Needed by .

**Remaining analytic helper and API granularity.** Retain all inherited Hasse/Riesz, distinct-column adjugate, finite-output/net, retraction, compact-identity, principal-minor perturbation, monic-tail and generic-matrix helper nodes. Further source decomposition is needed for the bounded lifting characterization of (Pr), finite-free-image determinant transport and the finite-projective determinant/rank interface. Their actual dependencies cannot be bypassed by the new compact-complex nodes.

Needed by .

**Distribution stages and universal-character families.** The current pass reads multivariable growth, Mellin, uniform affinoid stages and compact semigroup inputs. Still construct the chart-realized compact-type function limit and strong-dual projective limit, global pullback/tensor/convolution operations, uniform universal-character multiplier with an actual common radius, and coefficient fibre/completed scalar extension. The native coefficient and stage transpose signatures are proper restricted prototypes.

Needed by .

**Prototype and validation boundary.** The full suggested file retains inherited coefficient, entire division, resultant, matrix, Riesz and Mellin signatures and adds native stage/rectangular-growth/cochain prototypes. The current checks object records exact scopes, five omitted definition/construction API-and-test groups, and fourteen omitted new named theorems. The omitted signatures require unavailable carriers or determinant/root interfaces; no Prop placeholder supplies them. Compilation checks typing only. All 303 implementation statuses remain unchecked.

Needed by .

**Imported complete-continuity contract beyond affinoids.** AdicSpacesPartII:R3/completely-continuous-map owns the approximation predicate and ideal/closure API. Its current mathematical statement assumes affinoid coefficients, although its prototype predicate is more general. Request its ordinary complete-continuity contract over the present Noetherian K-Banach algebras, and promote the consumed composition/closure API. The finite-image convention comparison is proved here; no strict-complete-continuity theorem is imported.

Needed by `LocallyAnalyticDistributions:L4/completely-continuous`.

**Mellin equivalence, topology and geometric model beyond scalar adapters.** The current pass supplies target contracts for the global unbounded component Mellin equivalence, inverse bounded comparison, branch analyticity, derivatives, twists, multivariable pushforward, finite coefficient extension, rigid/adic comparison and meromorphic gluing. Their compact-type dual topology, imported universal-character coordinates and actual sheaf/section carriers still need construction. Native bounded component and scalar branch adapters alone do not prove the global equivalence or pseudomeasure gluing.

Needed by `LocallyAnalyticDistributions:L3/finite-character-component-mellin`, `LocallyAnalyticDistributions:L3/branch-mellin`, `LocallyAnalyticDistributions:L3/meromorphic-mellin-clearing`.

**Shared nonarchimedean topology, left-heart and compact-type duality.** The shared proposal LocallyAnalyticDistributionsPartIIQuasiAbelianFunctionalAnalysis, BCGP25 route 17, owns the generic strict/left-heart and exact duality infrastructure. It has no stage/node ids in the current catalogue to import. Until those exist this is an explicit external gap, not an invented supplier stage. The CN L0/L1 results remain owned here as the issue assigns. Required cited proofs not read in this pass: Colmez–Gilles–Nizioł arXiv:2308.07712 Lemma 2.5 and Dierolf–Roelcke Proposition 3.8; general orthonormal-basis and controlled-lift inputs must also be supplied.

Needed by `LocallyAnalyticDistributions:L0/strict-sequence-comparison`, `LocallyAnalyticDistributions:L0/banach-three-space`, `LocallyAnalyticDistributions:L0/frechet-three-space`, `LocallyAnalyticDistributions:L0/compact-type-three-space`, `LocallyAnalyticDistributions:L0/compact-type-dual-reflexivity`, `LocallyAnalyticDistributions:L0/product-analytic-tensor`.

**Analytic carriers and omitted global signatures.** The suggested file gives native coefficient stages, continuous-linear transposes and complex signatures where expressible. It explicitly omits the unavailable manifold/LA strong-dual, C^r completed tensor, clopen-box realization, multivariate analytic Fréchet sheaf and global Mellin signatures. These are mathematical contracts in the packet, not placeholder Prop fields. General operator continuity, wavelet density, Fourier inversion and tensor norm comparisons need source-level refinement. Kohlhaase Proposition 4.2 also needs its strict smooth-distribution quotient/resolution input; it is not proved by the local primitive lemma.

Needed by `LocallyAnalyticDistributions:L0/analytic-chart-pullback`, `LocallyAnalyticDistributions:L0/chart-independence`, `LocallyAnalyticDistributions:L1/distribution-pushforward`, `LocallyAnalyticDistributions:L1/distribution-convolution`, `LocallyAnalyticDistributions:L1/distribution-multiply`, `LocallyAnalyticDistributions:L1/derivative-nonsplitting`, `LocallyAnalyticDistributions:L1/logarithm-extension-nonsplitting`, `LocallyAnalyticDistributions:L2/anisotropic-tensor-wavelets`, `LocallyAnalyticDistributions:L2/rectangular-growth`, `LocallyAnalyticDistributions:L2/tensor-multidegree-extension`, `LocallyAnalyticDistributions:L2/locally-algebraic-determination`, `LocallyAnalyticDistributions:L2/quasifactor-chart-invariance`, `LocallyAnalyticDistributions:L3/unbounded-component-mellin`, `LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism`.

**Family dual base change and projectivity.** The projective nonarchimedean tensor seminorm, separated completion and universal property are not native interfaces yet. c₀ analytic stages have the stated coefficient tensor comparison; their bounded-family duals have a canonical map without a general infinite-affinoid isomorphism. A same-stage dual used for Fredholm determinants must be separately proved (Pr), or replaced by an appropriate radius/Pr model. The native dual prototype does not provide that proof.

Needed by `LocallyAnalyticDistributions:L4/affinoid-distribution-stage`, `LocallyAnalyticDistributions:L4/analytic-completed-tensor`, `LocallyAnalyticDistributions:L4/dual-scalar-extension-map`, `LocallyAnalyticDistributions:L4/family-specialization`, `LocallyAnalyticDistributions:L4/contracting-family-compactness`.

**Derived numerical slopes and homotopy-category comparison.** Missing: valued geometric-fibre root-location typing, the finite-slope functor in the continuous homotopy category for comparisons commuting only up to homotopy, native finite-perfect/derived tensor comparison, and general-affinoid exact-h local constancy beyond the checked Coleman disc case. The equivariant strict representative argument is available as a plan, while these stronger inputs remain unresolved. Nonreduced finite-projective rank/determinant arguments inherit the existing algebra gap.

Needed by `LocallyAnalyticDistributions:L4/numerical-slope-decomposition`, `LocallyAnalyticDistributions:L4/finite-slope-perfect-complex`, `LocallyAnalyticDistributions:L4/finite-slope-homotopy-invariance`, `LocallyAnalyticDistributions:L4/derived-slope-base-change`, `LocallyAnalyticDistributions:L4/exact-slope-rank-local-constancy`.

**Stein geometry and full analytic solid localization.** AdicSpacesPartII R3 owns generic quasi-Stein/Stein predicates and coherent acyclicity. Request its equivalence with BCGP25 relative-compact closure-proper exhaustions and inner/compact norm restriction. BCGP25 route 17’s shared Part II must supply exact solid/topological coefficient comparison and f_*f^* analytic localization, affinoid analytic-ring coefficients and inverse limits. This proposal has no catalogue stage ids yet; record it as a gap rather than inventing one. RT-AREA-iwasawa-2/5 is addressed by source-read compact-complex and finite-window target nodes, with the full solid theorem explicitly outside this layer’s closure claim.

Needed by `LocallyAnalyticDistributions:L4/stein-frechet-interface`, `LocallyAnalyticDistributions:L4/classical-solid-finite-window`.

### Supplier contracts

**PadicMeasuresIwasawaAlgebras:L0** (open). Bounded continuous-function duals, their norm/weak topology and coefficient conventions for L0. The current supplier packet exists and its concrete nodes must be used as L0 is decomposed; the inherited claim that the packet was absent is superseded. The locally analytic LF/strong-dual topology is not supplied by the bounded measure definition.

**PadicMeasuresIwasawaAlgebras:L2** (open). The bounded Mahler-Amice transform and bounded operator toolbox, with exact coefficient conventions, to be extended rather than reconstructed in L1.

**PadicMeasuresIwasawaAlgebras:L0a** (open). Scalar character-space functor, representability, universal character, generator changes and odd-p/dyadic components under RS-16. Distribution-valued coefficient actions and uniform local radii are retained in L4, not sent back to this supplier. Specifically provide a locally analytic group chart H:G≃Δ×Z_p (and its finite-dimensional product version), ν-component points κ_(ν,t)(g)=ν(H_Δg)(1+t)^(H_Zg), finite-character inversion over a splitting field with |Δ| invertible, generator changes, and the canonical odd/dyadic unit-coordinate formulas. These are supplier data, not definitions repeated by this packet.

**PadicMeasuresIwasawaAlgebras:L3** (open). Pseudo-measures and the precise evaluation/inversion domains for the meromorphic comparison in L3. Identify the genuine clearing numerator for ([a]−[1])λ and prove cross-product compatibility of two clearings on their nonvanishing character domains. The exact existing pointwise numerator/ratio nodes can supply the algebraic part; analytic meromorphic gluing belongs here.

**AdicSpacesPartII:R3** (open). Extend the ordinary predicate and finite-rank/composition/closedness API of AdicSpacesPartII:R3/completely-continuous-map from its stated affinoid setting to complete modules over commutative Noetherian K-Banach algebras with compatible bounded action; use the same range-FG epsilon predicate, which the current suggested file already spells out more generally. Promote consumed API to named supplier nodes. Do not import or generalize Kiehl's strict variant as part of this request.

**PadicMeasuresIwasawaAlgebras:L0** (open). Bounded measures M(X, L) = C⁰(X, L)′ on ℤ_p and ℤ_p^× with their norm, and the injectivity of restriction to a dense subspace of test functions. RS-16 gives bounded measures to PadicMeasuresIwasawaAlgebras L0.

**AdicSpacesPartII:R3** (open). Compare the existing Kiehl Stein criterion with BCGP25 Definition 2.2.17 relatively compact affinoid exhaustion whose closures are proper over Spa(K); prove inner/compact restriction for the relevant coherent-section Banach norms. Generic Stein/quasi-Stein definitions and coherent Theorem B are imported, not duplicated.

**ReductiveGroupsPartII:RG2.1** (open). For the maximal Q_p-split torus, its valuation lattice and positive/strictly positive root monoids, supply the spanning property of the positive cone and the integral subgroup chart used in the torus slope order. No torus, root data or reductive-group topology is reconstructed in LAD.

**tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry** (open). The existing rigid/adic comparison and analytic section comparison on character-space affinoids, with their rank-one evaluation compatibility. This is an imported roadmap output; any absent extension is a Part II need, never a replan of upstream.

## Source findings

### LocallyAnalyticDistributions/E1

Published Lemma A3.1, printed432/PDF16; also author-copy PDF22–23. Display notation checked on both page images.. Take A=Q_p, G=1-pT and H=sum_(n>=0)p^n T^n. The leading coefficient -p is multiplicative, H is a nonzero restricted series, and GH=1; G is nonconstant. H is not entire because at radius p the weighted coefficients are all1. Rescaling T to a^M T to make the leading term dominate does not in general preserve restricted convergence, whereas entire convergence survives every fixed rescaling. This falsifies the auxiliary lemma as stated; it does not refute the later entire-series division or resultant conclusions.

**Correction used.** Replace the restricted-series hypothesis H in A⟨T⟩ by the entire-series hypothesis H in A{{T}} for the stated rescaling proof. The new nodes prove the linear-factor entire case directly.

### LocallyAnalyticDistributions/E2

Published proof of Lemma A3.4, printed433/PDF17; also author-copy PDF24. Published formula checked on the page image.. The preceding Q is monic and the proof constructs a universal splitting algebra by imposing K(T)=product_i(T-b_i). As printed K has zero T^n coefficient; equating coefficients imposes0=1, giving the zero ring and no way to infer the claimed identity in C. The monic correction is the intended polynomial and restores the splitting-algebra argument. The displayed slip alone does not disprove Lemma A3.4.

**Correction used.** Insert the missing leading term: K(T)=T^n+sum_(i=1)^n(-1)^i c_i T^(n-i).

### LocallyAnalyticDistributions/E3

arXiv:1304.4042v3, Definition 2.12 and Remark 2.13, printed pp. 4–5. Take G=Z_p², r=(1/2,0), f(x₁,x₂)=1_(pZ_p)(x₂). For every m₁ and m₂=0 the infimum first-difference valuation is 0, so the required expression is −m₁/2. Infinitely many such tuples violate cofinite divergence and even boundedness. But f=1⊗1_(pZ_p) is a locally constant tensor in C^{1/2}(Z_p)⊗̂C⁰(Z_p). Thus the literal definition excludes a claimed tensor element. The plan proves the intended tensor version by wavelets and does not assert a published correction.

**Correction used.** Use the completed tensor of the one-variable C^{r_i} spaces, with its tensor-wavelet coefficient norm, for the rectangular extension theorem. A corrected joint difference formula requires mixed differences, not merely a different filter on the same formula.

The arXiv version record, author page, publisher chapter and Warwick record were checked in a bounded correction search. No relevant correction was located. The publisher PDF request returned HTML and the accepted copy was restricted; no published-PDF read is claimed.

### LocallyAnalyticDistributions/E4

§13.1.1, author p. 84. A one-dimensional eigenvalue at valuation h must belong to ≤h and be excluded from >h; the printed complementary condition cannot give this uniqueness.

**Correction used.** The complementary summand in an h-slope decomposition must invert polynomials of slope at most h; reciprocal Fredholm roots have valuation at least −h.

This reuses confirmed extraction finding E107; it is not a new independent erratum verification.

### LocallyAnalyticDistributions/E5

Proof of Corollary 13.2.4.2, author p. 87. The raising map has different domain and codomain from U_C; treating it as an endomorphism inside P is ill-typed. The corrected restriction is U_CQ(U_C)f=f.

**Correction used.** For P=XQ and U_C=r a, extend f by a(Q(U_C)f), then restrict by r.

This reuses confirmed extraction finding E112; it is not a new independent erratum verification.

### LocallyAnalyticDistributions/E6

§6.1.1, arXiv p. 139. Without equality the scalar eigenvalue at valuation h can be assigned inconsistently to the two summands.

**Correction used.** Invert all monic polynomials with root valuation at most h on the complementary >h summand, including equality.

This reuses confirmed extraction finding E77; it is not a new independent erratum verification.

## Suggested-signature boundary

The complete suggested file elaborates against the supplied pinned build. Its proofs remain omitted; typing is not proof validation. The exact restrictions below explain the difference between typed native prototypes and the global mathematical contracts.

- `LocallyAnalyticDistributions:L0/multivariable-fixed-radius`: Typed native c0 coefficient stage with a supplied discrete index I. Chart realization, chart-independence and compact-type inductive-limit signatures are omitted.
- `LocallyAnalyticDistributions:L1/distribution-pushforward`: Typed transpose of a supplied continuous linear pullback on stages. Construction of the global strong-dual pullback from an analytic map is omitted.
- `LocallyAnalyticDistributions:L1/distribution-convolution`: Typed finite-group convolution on the dual of all finite-group functions. Extension to a compact analytic group requires the completed analytic tensor carrier and is omitted.
- `LocallyAnalyticDistributions:L1/distribution-multiply`: Typed multiplier transpose on a normed K-algebra. The global locally analytic LF multiplication carrier and continuity theorem are omitted.
- `LocallyAnalyticDistributions:L4/affinoid-analytic-stage`: Typed native c0 coefficient stage over a normed commutative ring, with no automatic global affinoid section or tensor-completion identification.
- `LocallyAnalyticDistributions:L4/affinoid-distribution-stage`: Typed continuous A-linear dual of the native coefficient stage. It is a bounded-family dual, not asserted to be c0 or (Pr).
- `LocallyAnalyticDistributions:L4/family-integral-lattice`: Typed norm unit ball of the stage dual after restriction of scalars to K; no identification with the full power-bounded lattice is asserted.
- `LocallyAnalyticDistributions:L4/universal-character-coefficient-action`: Typed dual action of supplied continuous linear pullback and multiplier maps with their actual cocycle equations. Uniform analytic-radius construction and completed scalar specialization are omitted; the specialization example checks only scalar evaluation.
- `LocallyAnalyticDistributions:L4/banach-cochain-complex`: Typed predicate on native ModuleCat cochain data with explicitly identified normed modules: ultrametric norms, K-homogeneity, bounded A-action, completeness, continuous differentials, bounded support and (Pr). The homotopy-category coefficient comparison is omitted.
- `LocallyAnalyticDistributions:L4/compact-complex-representative`: Typed degreewise continuous operators on a native cochain endomorphism, with the single imported complete-continuity predicate.
- `LocallyAnalyticDistributions:L4/compact-homotopy-endomorphism`: Typed existence of a degreewise compact representative and an actual native Homotopy whose transported components are continuous. No new homotopy category is defined.
- `LocallyAnalyticDistributions:L4/representative-fredholm-product`: Typed finite-family product of native fredholmSeriesPr with actual (Pr) and compactness hypotheses. Association to the finite support of a cochain representative requires the preceding predicate; homotopy invariance of the raw product is false.
- `LocallyAnalyticDistributions:L4/compact-frechet-factorization`: Typed compatible inverse-stage system and compact transition/factorization equations. The global Frechet inverse-limit carrier and numerical finite-slope theorem are omitted.

The rectangular-growth predicate and its three examples use actual native locally constant functions on Z_p^g, including the one-coordinate refinement partition. The inherited resultant, finite-matrix, Hasse/Riesz, entire-division and scalar Mellin prototypes remain in the file.

### Unavailable definition and construction signatures

**`LocallyAnalyticDistributions:L0/disc-analytic-functions`.** The general weighted-radius analytic-disc Banach carrier and Gauss valuation comparison are not typed. Native restricted series and the new normalized c0 stage are building blocks, not the full real-radius carrier.

API names: `TauCeti.LocallyAnalytic.discAnalytic`, `TauCeti.LocallyAnalytic.gaussVal_mul`, `TauCeti.LocallyAnalytic.gaussVal_eq_inf`. Tests: `gaussVal_X`, `gaussVal_restrict_le`, `geometric_not_closed_disc`.

**`LocallyAnalyticDistributions:L0/locally-analytic-radius`.** The chart-realized Banach stage, compact-type locally convex inductive limit and globally cofinal radius maps are unavailable; the earlier LAh comment is not an elaborated declaration.

API names: `TauCeti.LocallyAnalytic.LAh`, `TauCeti.LocallyAnalytic.LAh_mono`, `TauCeti.LocallyAnalytic.locallyAnalytic_iff_exists_LAh`, `TauCeti.LocallyAnalytic.LA`. Tests: `indicator_mem_LAh`, `LAh_basis_orthonormal`, `indicator_not_mem_LAh_pred`.

**`LocallyAnalyticDistributions:L0/locally-analytic-distributions`.** The nonarchimedean strong-dual compact-type carrier and native bounded-measure restriction map into it are unavailable. Native CLM stage duals do not establish that global carrier.

API names: `TauCeti.LocallyAnalytic.Dist`, `TauCeti.LocallyAnalytic.Dist.valLAh`, `TauCeti.LocallyAnalytic.measureToDist`, `TauCeti.LocallyAnalytic.measureToDist_injective`. Tests: `dirac_mem`, `measureToDist_injective`, `derivative_at_zero_not_measure`.

**`LocallyAnalyticDistributions:L2/c-r-functions`.** The Colmez differentiability/remainder Banach carrier, its wavelet topology and continuous-completion interface are unavailable.

API names: `TauCeti.LocallyAnalytic.Cr`, `TauCeti.LocallyAnalytic.Cr_mahler`, `TauCeti.LocallyAnalytic.locallyPolynomial_dense_Cr`. Tests: `Cr_zero_eq_continuous`, `Cr_mahler_iff`, `digit_doubling_not_C2`.

**`LocallyAnalyticDistributions:L2/order-r-distributions`.** The global strong-dual and C^r carriers needed for the extension predicate are unavailable; the earlier DistOrder comment is not an elaborated declaration.

API names: `TauCeti.LocallyAnalytic.DistOrder`, `TauCeti.LocallyAnalytic.mem_distOrder_iff_amice`, `TauCeti.LocallyAnalytic.mem_distOrder_iff_growth`, `TauCeti.LocallyAnalytic.mem_distOrder_iff_riemann`. Tests: `dirac_order_zero`, `log_order_one`, `infinite_order_example`.

**`LocallyAnalyticDistributions:L2/anisotropic-tensor-wavelets`.** The completed projective tensor carrier and its separated C^{r_i} completion are unavailable. The rectangular-growth predicate is typed on native locally constant test functions, but does not construct this carrier.

API names: `TauCeti.AnalyticDistributions.anisotropicFunctionSpace`, `TauCeti.AnalyticDistributions.anisotropicFunctionSpace_pure`, `TauCeti.AnalyticDistributions.anisotropicFunctionSpace_basis`. Tests: `AnalyticDistributionTests.anisotropic_order_zero`, `AnalyticDistributionTests.anisotropic_empty`, `AnalyticDistributionTests.anisotropic_one_coordinate`.

**`LocallyAnalyticDistributions:L3/unbounded-component-mellin`.** The global nonarchimedean locally analytic strong-dual and analytic section carriers are unavailable. The inherited native bounded-measure componentMellin and branchMellin are proper special cases, not this global equivalence.

API names: `TauCeti.AnalyticDistributions.distributionMellin`, `TauCeti.AnalyticDistributions.distributionMellin_coeff`, `TauCeti.AnalyticDistributions.distributionMellin_ext`. Tests: `AnalyticDistributionTests.distributionMellin_point`, `AnalyticDistributionTests.distributionMellin_trivial_group`, `AnalyticDistributionTests.distributionMellin_bounded`.

**`LocallyAnalyticDistributions:L4/dual-scalar-extension-map`.** The completed tensor carrier and its universal map are unavailable. No arbitrary infinite affinoid dual-tensor isomorphism is assumed; finite-dimensional comparison alone cannot define the completed source.

API names: `TauCeti.AnalyticDistributions.distributionScalarExtension`, `TauCeti.AnalyticDistributions.distributionScalarExtension_pure`, `TauCeti.AnalyticDistributions.distributionScalarExtension_finite`. Tests: `AnalyticDistributionTests.dualExtension_scalar`, `AnalyticDistributionTests.dualExtension_point`, `AnalyticDistributionTests.dualExtension_derivative`.

**`LocallyAnalyticDistributions:L4/family-specialization`.** The global completed coefficient-extension and fibre carriers are unavailable. Scalar evaluation under a supplied ring map in coefficientAction_specialization is typed; it is not this family specialization construction.

API names: `TauCeti.AnalyticDistributions.familySpecialization`, `TauCeti.AnalyticDistributions.familySpecialization_coeff`, `TauCeti.AnalyticDistributions.familySpecialization_comp`. Tests: `AnalyticDistributionTests.specialization_identity`, `AnalyticDistributionTests.specialization_atom`, `AnalyticDistributionTests.specialization_logarithm`.

**`LocallyAnalyticDistributions:L4/numerical-slope-decomposition`.** The rank-one geometric fibre, valued root-location and finite-projective determinant interfaces are unavailable. The inherited typed Riesz projector does not yet express a numerical slope window.

API names: `TauCeti.AnalyticDistributions.NumericalSlopeDecomposition`, `TauCeti.AnalyticDistributions.numericalSlope_projector`, `TauCeti.AnalyticDistributions.numericalSlope_module_comparison`. Tests: `AnalyticDistributionTests.slope_endpoint`, `AnalyticDistributionTests.slope_zero_operator`, `AnalyticDistributionTests.slope_reciprocal_sign`.

### Unavailable named-theorem signatures

- `LocallyAnalyticDistributions:L0/banach-three-space`: The shared left-heart extension and nonarchimedean locally convex carriers are unavailable; the theorem requires actual outer Banach objects, not an assumed Banach middle term.
- `LocallyAnalyticDistributions:L0/banach-splitting`: The shared strict sequence carrier and controlled-lift/orthonormal basis interfaces are unavailable. Keep the spherical-completeness OR separable-outer-terms hypothesis.
- `LocallyAnalyticDistributions:L0/frechet-three-space`: The shared Frechet/left-heart carriers and nuclear Frechet extension input are unavailable.
- `LocallyAnalyticDistributions:L0/compact-type-three-space`: The shared compact-type inductive-limit and left-heart extension carriers are unavailable; keep the splitting hypotheses separate from closure.
- `LocallyAnalyticDistributions:L1/derivative-nonsplitting`: The global LA compact-type carrier, locally constant kernel topology and section carrier are unavailable.
- `LocallyAnalyticDistributions:L1/logarithm-extension-nonsplitting`: The open-disc Frechet quotient topology and strong-dual exactness comparison are unavailable; a formal PowerSeries quotient is not sufficient.
- `LocallyAnalyticDistributions:L2/rectangular-extension`: The anisotropic tensor completion and its continuous dual are unavailable. Rectangular-growth/refinement examples are typed on native locally constant functions.
- `LocallyAnalyticDistributions:L2/tensor-multidegree-extension`: The completed tensor C^r carrier and separate locally polynomial-degree test-space topology are unavailable.
- `LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism`: The global strong-dual and analytic section Frechet carriers are unavailable.
- `LocallyAnalyticDistributions:L4/pan-tate-compactness`: The full multivariable Tate-algebra Banach source interface and chosen algebra-map continuity/topological-nilpotence contract are unavailable in this prototype.
- `LocallyAnalyticDistributions:L4/pan-formal-compactness`: The bounded formal-coefficient Banach carrier is unavailable. Replacing it by polynomial density or a restricted power series carrier would change the theorem.
- `LocallyAnalyticDistributions:L4/finite-slope-perfect-complex`: The numerical window projector and finite-perfect comparison interfaces are unavailable; native cochain/compact representative data alone do not state the conclusion.
- `LocallyAnalyticDistributions:L4/finite-slope-euler-local-constancy`: The finite-projective rank-one fibre and locally constant Euler-rank interfaces are unavailable; individual cohomology ranks are not assumed constant.
- `LocallyAnalyticDistributions:L4/frechet-finite-slope`: The native global inverse-limit Frechet carrier and numerical stage-window comparison are unavailable.

The inherited global Amice–Mahler, unbounded Amice and Amice–Vélu–Vishik signatures also await their actual locally analytic and C^r carriers. Their earlier comment signatures are not elaborated declarations.

## Source-read boundary

The inventory records primary passages, versions and hashes in the packet. The following new public sources were read for these target contracts; this does not claim whole-paper extraction. Results from unread cited works remain proof-closure gaps. The maintainer’s library index was read; none of its cleared books was needed, and no copy of either book marked uncleared was used.

- [On the cohomology of p-adic analytic spaces, II: The C_st-conjecture](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf): Appendix A in full, Lemmas A.1–A.4 and Remark A.6, printed pp. 58–59.
- [P-adic integration on ray class groups and non-ordinary p-adic L-functions](https://arxiv.org/pdf/1304.4042): §§2.1–2.3 in full, printed pp. 2–5; §3.1, printed pp. 6–7; page images of pp. 4–5 checked.
- [The cohomology of locally analytic representations](https://esaga.net/f/jan.kohlhaase/Kohlhaase_Locally_Analytic_Cohomology.pdf): Introduction field hypotheses; §1, printed pp. 5–8; Proposition 4.2 and Corollary 4.3 with proofs, printed pp. 20–21; Theorem 4.4 and coefficient model, printed pp. 21–22.
- [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf): §§13.1.1–13.1.3, printed pp. 84–85; Corollary 13.2.4.2 and proof, printed pp. 87–88.
- [Eigenvarieties for reductive groups](https://www.math.columbia.edu/~urban/eurp/eigen.pdf): §2.3, printed pp. 23–28 through Lemma 2.3.13; §§3.2.6–3.2.8, printed pp. 33–34; Lemmas 3.4.6–3.4.7 and Definition 3.4.10, printed pp. 43–45.
- [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269): §6.1.1, printed p. 139; Theorem 6.3.16 and proof, printed pp. 152–153.
- [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645): §1.8.5, printed p. 9; Definition 2.2.17, printed p. 21; §§4.6.46–4.6.49 in full, printed pp. 93–95.
- [On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366v1): §2.2.1 and Example 2.2.2, printed p. 13; Proposition 2.2.3 and Corollary 2.2.4, printed p. 14.

The inherited Buzzard, Serre and Coleman Fredholm references retain their source locators and version evidence. Fresh reads also checked Schneider–Teitelbaum §1, Colmez’s C^r definition and §II.4, Rodrigues Jacinto–Williams §§3.7–3.8 and §5.3, and Coleman A5.3/A5.5. The source comments distinguish worker tensor/estimate deductions from statements printed as named theorems.
