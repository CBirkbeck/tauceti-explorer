# Generic double-point interpolation

This roadmap builds value-and-first-derivative interpolation for multivariate
polynomials, the projective double-point theorem that supplies its generic
rank, and a polynomial certificate that produces small integer coordinates.
The reusable objects are the bounded polynomial submodule, its coefficient
basis, the native square-zero first-jet algebra, finite double-point quotients,
and universal interpolation matrices. The geometric argument develops the
restriction-rank and residual/trace tools needed for ordinary and differential
Horace induction.

The final theorem is the following. Let k be an algebraically closed field of
characteristic zero, let r,n≥1 and d≥5, and suppose

$$m=n(r+1)\le N(r,d)=\binom{r+d}{d}.$$

There is a nonzero polynomial Δ with integer coefficients in the rn point
coordinates such that its principal open is nonempty and every tuple on that
open consists of distinct points and admits arbitrary values and first partial
derivatives of a polynomial of total degree at most d. One can choose such a
tuple with all integer coordinates between 0 and md. This is a theorem about a
nonempty open set of configurations. For example, seven distinct collinear
points in the affine plane have rank 11 in degree 5 although m=N(2,5)=21.

The projective input is the degree-d≥5 range of the Alexander–Hirschowitz
theorem. The plane, cubic and quartic results are included as the bases of its
proof, with their exceptional triples stated explicitly. The proof uses
Brambilla–Ottaviani's plane contact argument, codimension-three cubic
specializations, and differential Horace induction. Couveignes's interpolation
matrix and integer-box argument give the affine and effective endpoint.
These sources support different parts of the development; the native algebraic
comparisons below specify how those parts fit together.

## Scope and prerequisites

This roadmap owns bounded-degree coefficient coordinates, fixed-degree
homogenization, first jets, double-point interpolation, the specializations used
in its Horace proof, and the universal minor certificate. It imports general
algebraic geometry from the following owning layers.

| Owning roadmap and layer | Interface used here |
| --- | --- |
| **AlgebraicModuliForArithmeticGeometry, R09.1** | Projective space over k, the invertible sheaf O(d), its global sections and the homogeneous-form equivalence; affine-chart trivialization and naturality of restriction and base change. |
| **SchemeAndStackFoundations, SF.0** | Ideal sheaves, squared finite closed subschemes, affine quotients and their k-valued points, finite-scheme length, Cartier residual/trace sequences and left exactness of global sections. Its continuation for generic tangent incidence supplies generic smoothness, irreducible parameter products, generic rank/dimension and contact-fiber statements. |
| **SchemeAndStackFoundations, SF.5** | Plane divisors, double containment of a singular curve, Bézout and the incidence-dimension bound for reduced curves through general points. |
| **AlgebraicModuliForArithmeticGeometry, R09.2** | Finite-flat moving subschemes, Hilbert/incidence families, locally free finite pushforwards with base change, proper projective tangent-direction incidence and valuative extension. |

These are actual scheme, sheaf and section interfaces. A vector space with the
right dimension does not replace H⁰(P^r,O(d)); a collection of pointwise choices
does not replace a finite-flat family. The generic tangent-incidence continuation
belongs to SchemeAndStackFoundations, in the direction of SF.0. Only its
Veronese and plane specializations belong here. The hyperplane residual/trace
sequence is imported from SF.0 and applied to squared point ideals here.

**EffectiveBoundsCompactModels** consumes the principal-open and integer-box
results. It owns the number-field embedding parametrization, the proof that its
pullback of Δ is nonzero, and the subsequent lattice and counting arguments.
The coefficient metric here is the elementary monomial metric needed for that
interface. General lattice theory belongs to **IntegralLattices**. Higher-order
jets, positive-characteristic Alexander–Hirschowitz statements, classification
of Waring decompositions, and the arithmetic counting theorem lie outside this
roadmap's scope.

The algebraic starting point is Mathlib's polynomial submodule and basis, rather
than a new bounded-polynomial carrier. The following declarations supply the
baseline at Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Their hypotheses are used as written: in particular, the affine first-jet
identities do not require characteristic zero, while the geometric genericity
arguments do.

| Mathlib declarations | What is reused |
| --- | --- |
| [MvPolynomial.restrictTotalDegree, basisRestrictSupport, mem_restrictTotalDegree, monomial_mem_restrictSupport](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPolynomial/Basic.lean) | The submodule of polynomials of total degree ≤d, its admissible monomials and its restricted monomial basis. |
| [MvPolynomial.pderiv, pderiv_monomial, pderiv_X, pderiv_mul](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/PDeriv.lean) | Partial differentiation, including the exponent-decrement formula and Leibniz rule. |
| [MvPolynomial.eval, aeval, eval_monomial, aeval_monomial](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/Eval.lean) | Evaluation and algebra evaluation, including evaluation in square-zero algebras and substitution. |
| [MvPolynomial.homogeneousSubmodule](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPolynomial/Homogeneous.lean) | The native fixed-degree homogeneous submodule. |
| [MvPolynomial.lcoeff](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/Basic.lean) | Coefficient extraction as a linear map. |
| [Sym.equivNatSum](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Finsupp/Multiset.lean), [Sym.card_sym_eq_choose](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Sym/Card.lean) | Degree-d exponent tuples as size-d multisets, and their stars-and-bars count. Only the slack-coordinate adapter is new here. |
| [TrivSqZeroExt, TrivSqZeroExt.inr_mul_inr](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/TrivSqZeroExt/Basic.lean) | The existing algebra R⊕M and the vanishing of products of infinitesimal terms. |
| [Ideal.quotientInfRingEquivPiQuotient](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/Operations.lean) | Finite Chinese remainder for pairwise comaximal ideals. The scalar-compatible algebra upgrade is checked here. |
| [Matrix.rank_of_det_ne_zero, rank_submatrix_le, rank_eq_finrank_range_toLin](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Rank.lean) | Determinant and submatrix rank bounds, and matrix rank as dimension of the range of its represented linear map. |
| [MvPolynomial.eq_zero_of_eval_zero_at_prod_finset](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Combinatorics/Nullstellensatz.lean) | A polynomial over a domain vanishing on a product of sufficiently large coordinate sets is zero. |
| [MvPolynomial.degreeOf_le_totalDegree](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/Degrees.lean) | The coordinate-degree bound used for the integer grid. |
| [PrimeSpectrum.basicOpen, mem_basicOpen](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/Topology.lean) | The principal open D(Δ) and its pointwise membership criterion. |
| [AlgebraicGeometry.Spec, Spec.map, Spec.algebraMap, Spec.map_apply](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Scheme.lean), [AffineSpace.SpecIso, homOverEquiv](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/AffineSpace.lean) | Actual affine schemes, evaluation morphisms over Spec k, the polynomial-spectrum identification and the existing affine-space functor of points. |

Tau Ceti also supplies the total-degree inclusion and span lemmas in
[RingTheory/MvPolynomial/RestrictTotalDegree](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RingTheory/MvPolynomial/RestrictTotalDegree.lean),
including `MvPolynomial.restrictTotalDegree_mono`,
`MvPolynomial.restrictTotalDegree_eq_span` and
`TauCeti.MvPolynomial.apply_mem_of_basis`. These are existing polynomial APIs,
not targets of this roadmap. They concern inclusion and linear extension on the
submodule, whereas the targets here add coefficient coordinates, homogenization
and jets.

## Conventions and sources

Write V(R,r,d) for the native submodule
MvPolynomial.restrictTotalDegree (Fin r) R d. Its monomial index is

$$A(r,d)=\{\alpha:\operatorname{Fin}(r)\to_0\mathbf N:\;|\alpha|\le d\},
\qquad |\alpha|=\sum_j\alpha_j.$$

Here finite support is Mathlib's Finsupp. The finite type structure on A(r,d)
is the adapter supplied in GI.0. A commutative ring R is sufficient for
coefficient coordinates, homogenization and the jet evaluation formulas.
Dimension and finite quotient statements explicitly use a field. The real
coefficient metric uses R=ℝ. All geometric statements in GI.2–GI.5, including
the word *general*, use an algebraically closed field k of characteristic zero
unless an algebraic statement explicitly gives weaker hypotheses.

An ordered affine tuple is P:Fin n→(Fin r→k). A jet row is a pair
(i,z) with z in Option(Fin r): None selects the value and Some j selects the
j-th partial derivative. Thus there are n(r+1) rows. We use genuine partial
polynomial derivatives, with exponent coefficients in k; no factorial or
inverse coordinate appears. Products with exponent decrement are zero when
the original exponent is zero. The target is a product of square-zero algebras,
not a product of reduced residue fields.

For projective statements, P^r means projective dimension r and has r+1
homogeneous coordinates. A double point 2P is cut out by the square of its
point ideal sheaf and has length r+1. In a hyperplane H≅P^(r−1), a double point
has length r. Distinct support is a separate hypothesis for all product,
length and degeneration statements. The empty tuple has ideal top and
zero-dimensional quotient; the algebraic carriers also allow r=0 and d=0.
The hyperplane rank inequalities and ordinary Horace estimates use r≥1,d≥1,
so the residual degree d−1 is an ordinary nonnegative polynomial degree.

For a finite subscheme X and a finite-dimensional linear system D of degree d,
write h(X,D) for restriction rank and h(X,d) for the full system. *Independent*
means h(X,D)=length X. *Maximal rank* means h(X,D)=min(dim D,length X), which
means injectivity rather than surjectivity in the overfilled case. AH(r,d,q)
means that q general distinct double points in P^r have degree-d maximal rank.
General assertions mean a nonempty Zariski-open subset of the specified ordered
parameter scheme. They do not quantify over every distinct tuple.

The exceptional triples relevant to the induction are

$$d=2,\;2\le q\le r;\qquad
(r,d,q)=(2,4,5),(3,4,9),(4,3,7),(4,4,14).$$

The geometric endpoint uses d≥5 and so has none of these exceptions. The
one-dimensional Hermite theorem uses arbitrary distinct points over any field.
In all division formulas below u is an integer; only in the critical range is
its nonnegativity established. This prevents natural-number subtraction from
silently changing a statement when the dividend is negative.

The sources are cited by the pagination of these particular versions:

- **BO:** Maria Chiara Brambilla and Giorgio Ottaviani, *On the
  Alexander–Hirschowitz Theorem*, [arXiv:math/0701409v2](https://arxiv.org/pdf/math/0701409v2),
  10 September 2007. The relevant material is Theorem 1.1 and §§2–6,
  printed pp.1–19. The arbitrary-distinct univariate observation is also in
  the opening paragraph of §7.1, p.19. Source dimension n is called r here.
- **COU:** Jean-Marc Couveignes, *Enumerating number fields*,
  [Annals of Mathematics 192 (2020), 487–497](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf),
  §3, printed pp.491–493. This supplies the affine interpretation, matrix,
  minor, small integer box and coefficient metric. BO's Theorem 1.1 supplies
  the inclusive degree-5 endpoint.

Each target below gives its source and its direct prerequisites. The statements
and proof descriptions use the conventions above. Algebraic reformulations,
finite witness replacements and the coarse degree bound are identified where
they occur. The API names designate proposed library declarations; existing
linearity, algebra-map and equivalence laws come from the native structures.
The tests are exact mathematical contracts, including zero and failure cases.

## GI.0. Coefficient spaces and fixed homogenization

The bounded space has a native finite monomial basis. This layer exposes that basis as coefficient functions, relates it to homogeneous forms and genuine projective sections, and supplies the real coefficient metric. The cardinality computation builds only the bounded/slack adapter to Mathlib’s multiset equivalence.

### The bounded monomial basis

<a id="monomial-count"></a>

**Binomial count of bounded monomials.** For r,d≥0, the finite set A(r,d)={α:Fin r→₀N | Σα≤d} has cardinality N(r,d)=choose(r+d,d).

Adjoin a slack exponent d−|α| in the None coordinate. This is a bijection with degree-d exponent tuples on Option(Fin r); compose it with Sym.equivNatSum and apply Sym.card_sym_eq_choose. Deleting the slack coordinate proves the inverse formula.

**Prerequisites:** `Sym.card_sym_eq_choose` (Mathlib); `Sym.equivNatSum` (Mathlib).

**Source:** [BO, §1, p.1](https://arxiv.org/pdf/math/0701409v2); [COU, §3, p.491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

<a id="bounded-finrank"></a>

**Dimension of bounded polynomials.** For any field k and r,d≥0, finrank_k(MvPolynomial.restrictTotalDegree (Fin r) k d)=N(r,d).

Use basisRestrictSupport on the admissible exponent set. Its cardinality is N(r,d), so the dimension follows from the native finite-basis dimension formula. No extra space of formal coefficient lists is used as the polynomial carrier.

**Prerequisites:** `MvPolynomial.restrictTotalDegree` (Mathlib); `MvPolynomial.basisRestrictSupport` (Mathlib); [Binomial count of bounded monomials](#monomial-count).

**Source:** [COU, §3, p. 491, bounded polynomial dimension](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

<a id="coefficient-coordinates"></a>

**Coefficient coordinates.** For a commutative ring R, identify the native bounded submodule V(R,r,d) with functions A(r,d)→R by a linear equivalence c_d; its α-coordinate is the actual MvPolynomial coefficient.

Restrict the native coefficient representation to A(r,d), then use finiteness to replace the finitely supported coordinate function by an ordinary function. The inverse is the finite sum of admissible monomials, and native polynomial coefficient extensionality proves both inverse identities.

**API.**

- `coefficientCoordinates_apply` (projection): c_d(f)(α)=coeff_α(f).
- `coefficientCoordinates_symm` (constructor): c_d⁻¹(a)=Σ_{α∈A(r,d)}a_α X^α.
- `coefficientCoordinates_ext` (extensionality): f=g iff c_d(f)=c_d(g).

**Tests.**

- `six_not_nine`: For r=2,d=2 the coordinates are 1,x,y,x²,xy,y², six in all.
- `constants`: For d=0 there is one coordinate and c_0(C a)=a.
- `native_coefficient`: For r=1,d=3 and f=2+3x², coordinates are (2,0,3,0).

**Prerequisites:** `MvPolynomial.basisRestrictSupport` (Mathlib); `MvPolynomial.restrictTotalDegree` (Mathlib); [Binomial count of bounded monomials](#monomial-count).

**Source:** [COU, §3 pp. 491,493](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

### Homogeneous forms and sections

<a id="fixed-homogenization"></a>

**Fixed-degree homogenization.** For a commutative ring R, fixedHomogenization_d is a linear equivalence V(R,r,d)≃ homogeneousSubmodule (Option(Fin r)) R d. It sends X^α to X₀^(d−Σα)∏X_j^α_j; inverse evaluation sets X₀=1.

Transport the bounded monomial basis through the slack-coordinate bijection. Dehomogenization evaluates X₀ at 1 and the remaining variables at their native polynomial variables. Checking the two composites on monomials gives a linear equivalence at each degree; multiplication relates degrees d,e and d+e.

**API.**

- `fixedHomogenization_monomial` (simp): X^α maps to X₀^(d−Σα)X^α.
- `fixedHomogenization_dehomogenize` (equivalence): Setting X₀=1 is the inverse on degree-d homogeneous forms.
- `fixedHomogenization_mul` (compatibility): H_{d+e}(fg)=H_d(f)H_e(g), for f∈V_d and g∈V_e; targets have different degrees.

**Tests.**

- `homogenize_quadratic`: At d=2, 1+x maps to X₀²+X₀X₁, not 1+X₁.
- `homogenize_constant`: At d=0 constants remain constants.
- `dehomogenize_native`: The monomial X₀X₁ in degree 2 dehomogenizes to x in the native degree≤2 submodule.

**Prerequisites:** [Coefficient coordinates](#coefficient-coordinates); `MvPolynomial.homogeneousSubmodule` (Mathlib); `MvPolynomial.aeval` (Mathlib).

**Source:** [COU, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

<a id="sections-comparison"></a>

**Homogeneous forms and twisting sections.** For algebraically closed k and d≥0, the fixed-homogenization equivalence followed by the supplier homogeneous-form/section equivalence identifies V(k,r,d) with H⁰(P^r_k,O(d)), compatibly with restriction to the chart X₀≠0.

Compose fixedHomogenization with the homogeneous-form/global-section equivalence of R09.1. The comparison with the chart uses the actual O(d) trivialization there. Its monomial calculation determines the restriction square, rather than comparing dimensions alone.

**Prerequisites:** [Fixed-degree homogenization](#fixed-homogenization); **AlgebraicModuliForArithmeticGeometry, R09.1**.

**Source:** [COU, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

### The real coefficient metric

<a id="coefficient-gram"></a>

**Coefficient Gram form.** Over ℝ, the bounded real polynomial space has positive definite bilinear form G(f,g)=Σ_{α∈A(r,d)}coeff_α(f)coeff_α(g). Transporting the Euclidean structure along c_d makes the monomials orthonormal; the integral lattice consists exactly of integral coordinate tuples.

Pull the finite-dimensional Euclidean inner product back through coefficientCoordinates. A nonzero polynomial has a nonzero coefficient, giving strict positivity of the sum of squares. Use this transport to equip the bounded real submodule with its norm and inner product; integral tuples form its additive ℤ-coordinate subgroup.

**API.**

- `coefficientGram_apply` (projection): G(f,g)=Σ coeff_α(f)coeff_α(g).
- `coefficientGram_positive` (structure): For real f≠0, G(f,f)>0.
- `coefficientCoordinates_isometry` (compatibility): For the transported Euclidean norm, c_d is an isometry and the integral coordinates are Z^A(r,d).

**Tests.**

- `orthonormal_xy`: For r=2,d=2, G(x,y)=0 and G(x,x)=1.
- `gram_constants`: At d=0, G(C a,C b)=ab.
- `integral_coordinates`: The native polynomial 2+x has integral coordinates and squared norm5.

**Prerequisites:** [Coefficient coordinates](#coefficient-coordinates).

**Source:** [COU, §3, p. 493, monomial coefficient metric](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

## GI.1. First-jet algebras and double-point evaluation

The first jet is the order-one square-zero algebra, whose infinitesimal dimension is r. This layer connects that algebra to squared evaluation ideals, CRT, the bounded linear evaluation map and its matrix. The affine identities hold over their stated rings or fields in every characteristic; the projective comparison imports R09.1 and SF.0.

### The local square-zero algebra

<a id="jet-algebra"></a>

**First-jet algebra evaluation.** For any commutative ring k and P∈k^r, jetAlgebra_P:k[x₁,…,x_r]→ₐ[k]TrivSqZeroExt k (Fin r→k) sends X_j to (P_j,e_j). Its value part is f(P) and its square-zero part is (∂_j f(P))_j.

Use algebra evaluation with X_j sent to the sum of the scalar P_j and the infinitesimal coordinate e_j. The square-zero multiplication kills all terms with two infinitesimals. Expanding monomials gives exactly the native partial-derivative formula in every characteristic.

**API.**

- `jetAlgebra_fst` (projection): fst(jetAlgebra_P(f))=eval P f.
- `jetAlgebra_snd` (projection): snd(jetAlgebra_P(f))(j)=eval P(pderiv j f).
- `jetAlgebra_X` (simp): jetAlgebra_P(X_j)=(P_j,e_j).

**Tests.**

- `jet_variable`: At the origin, jetAlgebra(X₁)=(0,e₁), not zero.
- `jet_constant`: jetAlgebra(C a)=(a,0).
- `jet_square`: At the origin, X₁² maps to zero in the native square-zero extension; an order-two jet retaining quadratics would fail.

**Prerequisites:** `MvPolynomial.aeval` (Mathlib); `MvPolynomial.aeval_monomial` (Mathlib); `MvPolynomial.pderiv_monomial` (Mathlib); `TrivSqZeroExt` (Mathlib).

**Source:** [COU, §3, p.491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf); [BO, §2, Proposition 2.1, p.3](https://arxiv.org/pdf/math/0701409v2).

<a id="jet-kernel"></a>

**Kernel of one first jet.** For a field k and P∈k^r, jetAlgebra_P is surjective and its kernel is (ker(eval P))². This assertion holds in every characteristic.

Translate to variables X_j−P_j. Constants and those translated variables generate the scalar and infinitesimal target coordinates. The remaining terms have translated total degree at least two and lie in m_P²; Leibniz proves the reverse kernel inclusion.

**Prerequisites:** [First-jet algebra evaluation](#jet-algebra); `MvPolynomial.eval` (Mathlib); `TrivSqZeroExt.inr_mul_inr` (Mathlib).

**Source:** [COU, §3, p.491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf); [BO, §2, Proposition 2.1, p.3](https://arxiv.org/pdf/math/0701409v2).

<a id="point-comaximal"></a>

**Distinct point ideals and their powers.** For a field k and distinct P,Q∈k^r, the evaluation ideals m_P,m_Q and their squares are comaximal.

Select a coordinate in which P and Q differ. The two translated coordinate functions have nonzero constant difference, so a scalar multiple expresses 1 in m_P+m_Q. Apply the native coprime-power identity to obtain m_P²+m_Q²=top.

**Prerequisites:** `MvPolynomial.eval` (Mathlib); [Kernel of one first jet](#jet-kernel).

**Source:** [COU, §3, p. 491, distinct-point squared ideal decomposition](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

### The finite double-point scheme and its quotient

<a id="double-ideal"></a>

**Squared union ideal.** For a finite ordered tuple P:Fin n→k^r over a field, doubleIdeal(P)=(⋂_i m_{P_i})². Under Injective P this equals ⋂_i m_{P_i}²; Spec(k[x]/doubleIdeal(P)) is the affine double-point scheme.

Take the infimum of the actual evaluation ideals and square that ideal. Pairwise comaximality identifies the finite infimum with a product, and squaring the product gives the infimum of the squared factors. SF.0 turns the affine quotient into its closed subscheme and compares it with the projective chart.

**API.**

- `doubleIdeal_def` (characterisation): doubleIdeal(P)=(⋂ ker(eval P_i))².
- `doubleIdeal_distinct` (compatibility): If P is injective, doubleIdeal(P)=⋂ (ker(eval P_i))².
- `doubleIdeal_reindex` (functoriality): Permuting the finite tuple leaves doubleIdeal unchanged.

**Tests.**

- `double_origin`: For r=1,n=1,P=0, the ideal is (x²), not (x).
- `empty_double`: For n=0 the ideal is top and the quotient has dimension 0.
- `double_vs_triple`: For r=1,P=0, x² is zero modulo doubleIdeal, but is nonzero modulo (x³).

**Prerequisites:** `MvPolynomial.eval` (Mathlib); [Distinct point ideals and their powers](#point-comaximal).

**Source:** [COU, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

<a id="double-quotient"></a>

**Double-point quotient comparison.** For a field k and injective P:Fin n→k^r, k[x]/doubleIdeal(P)≃ₐ[k]Π_i TrivSqZeroExt k(k^r), with the class of f mapped to (jetAlgebra_{P_i}(f))_i.

Apply Ideal.quotientInfRingEquivPiQuotient to the squared ideals, then the first isomorphism theorem to each jetAlgebra. Verify preservation of scalar constants to obtain an algebra equivalence, including the nonreduced multiplication in every factor.

**API.**

- `doubleQuotient_mk` (projection): The class of f maps to its tuple of native first jets.
- `doubleQuotient_mul` (compatibility): Multiplication is the native square-zero multiplication in each factor.
- `doubleQuotient_reindex` (functoriality): A tuple permutation commutes with the induced product-factor permutation.

**Tests.**

- `one_point_length`: For r=2,n=1 the quotient has basis1,x−P₁,y−P₂ and dimension 3.
- `empty_quotient`: For n=0 both sides are the zero-dimensional empty product algebra.
- `nonreduced_product`: For r=1,P=(0,1), the class of x(x−1) is nonzero, but its square is zero; the reduced quotient would kill the class.

**Prerequisites:** [Squared union ideal](#double-ideal); [Kernel of one first jet](#jet-kernel); [Distinct point ideals and their powers](#point-comaximal); `Ideal.quotientInfRingEquivPiQuotient` (Mathlib).

**Source:** [COU, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

<a id="double-length"></a>

**Length of distinct double points.** For a field k, injective P:Fin n→k^r gives finrank_k(k[x]/doubleIdeal(P))=n(r+1); the projective double-point scheme on the affine chart has the same length.

The algebra equivalence is linear over k. Each factor has the basis of a scalar and r infinitesimal coordinates. Finite-product dimension gives n(r+1), and the affine finite-scheme comparison identifies this with geometric length.

**Prerequisites:** [Double-point quotient comparison](#double-quotient); **SchemeAndStackFoundations, SF.0**.

**Source:** [COU, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

### Bounded values and derivatives

<a id="first-jet-map"></a>

**Bounded first-jet evaluation.** For a field k, define J_{P,d}:V(k,r,d)→ₗ[k](Fin n→Option(Fin r)→k) by J(f)_i(None)=f(P_i) and J(f)_i(Some j)=∂_j f(P_i). The row index contains n(r+1) entries.

Restrict the evaluations and derivative evaluations to the native bounded submodule. Their product is a linear map with the stated Option-indexed codomain. On monomials its entries are the value monomial and the exponent-weighted monomial of one lower degree.

**API.**

- `firstJetMap_value` (projection): J(f)_i(None)=eval P_i f.
- `firstJetMap_partial` (projection): J(f)_i(Some j)=eval P_i(pderiv j f).
- `firstJetMap_monomial` (simp): The α column is P_i^α in the value row and α_jP_i^(α−e_j) in derivative row j; zero exponent gives zero.

**Tests.**

- `linear_origin_jets`: For one point0 in A² and d=1, 1,x,y give the identity3×3 matrix.
- `constant_jets`: At d=0 gradients vanish; for r≥1,n=1 the map is not onto.
- `native_derivative`: For f=x² at P=3 in A¹, J(f)=(9,6), using native pderiv.

**Prerequisites:** [First-jet algebra evaluation](#jet-algebra); `MvPolynomial.restrictTotalDegree` (Mathlib); `MvPolynomial.pderiv` (Mathlib).

**Source:** [COU, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

<a id="value-map"></a>

**Value projection.** For a field k, valueMap_{P,d}:V(k,r,d)→ₗ[k](Fin n→k) is evaluation at P; it is the None-row projection of J.

Project firstJetMap to its None coordinates. This is the usual value evaluation map, whose native linear kernel is the bounded-polynomial vanishing subspace. The projection retains its codomain and reindexing laws without introducing a second vanishing predicate.

**API.**

- `valueMap_apply` (projection): valueMap(f)(i)=eval P_i f.
- `valueMap_eq_jetProjection` (compatibility): valueMap is the None-row projection of J.
- `mem_valueKernel` (characterisation): f∈ker(valueMap) iff every f(P_i)=0.

**Tests.**

- `values_linear`: At points0,1 in A¹, valueMap(x)=(0,1).
- `empty_values`: For n=0 the codomain is the zero module and the kernel is all V_d.
- `values_not_gradients`: At one point0, x has value0 but nonzero first derivative.

**Prerequisites:** [Bounded first-jet evaluation](#first-jet-map).

**Source:** [COU, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

<a id="derivative-on-kernel"></a>

**Derivatives of vanishing polynomials.** For a field k, derivativeOnKernel_{P,d}:ker(valueMap_{P,d})→ₗ[k](Fin n→Fin r→k) evaluates native partial derivatives.

Restrict the Some-coordinate projection of firstJetMap to LinearMap.ker(valueMap). The inherited subtype map identifies its values with actual derivatives. Point permutations act simultaneously on the kernel inclusion and derivative target.

**API.**

- `derivativeOnKernel_apply` (projection): The (i,j) coordinate is ∂_j f(P_i).
- `derivativeOnKernel_eq_jet` (compatibility): It equals the Some-row projection of J on ker(valueMap).
- `derivativeOnKernel_reindex` (functoriality): Permuting points permutes the derivative target coordinates.

**Tests.**

- `simple_zero_derivative`: At P=0,d=1,r=1, x lies in the value kernel and maps to1.
- `constant_kernel`: For one point and d=0, the value kernel is zero.
- `square_zero_gradient`: At P=0,d=2, x² is a nonzero element of the value kernel with zero derivative.

**Prerequisites:** [Value projection](#value-map); [Bounded first-jet evaluation](#first-jet-map).

**Source:** [COU, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

<a id="jet-kernel-split"></a>

**Surjectivity through the value kernel.** For any field k and tuple P, J_{P,d} is onto iff valueMap_{P,d} is onto and derivativeOnKernel_{P,d} is onto.

For a map into a product, surjectivity is equivalent to surjectivity onto the first factor and onto the second factor from the kernel of the first projection. Lift the value tuple first and correct its derivatives using a polynomial in the value kernel.

**Prerequisites:** [Bounded first-jet evaluation](#first-jet-map); [Value projection](#value-map); [Derivatives of vanishing polynomials](#derivative-on-kernel).

**Source:** [COU, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

### Matrix rank and projective restriction

<a id="jet-matrix"></a>

**Monomial first-jet matrix.** For a field k, firstJetMatrix(P,d) has rows Fin n×Option(Fin r) and columns A(r,d), entry P_i^α for None and α_jP_i^(α−e_j) for Some j. Its linear map in coefficient coordinates is J.

Represent firstJetMap in coefficientCoordinates and the standard row-coordinate basis. Native evaluation and pderiv_monomial determine all matrix entries and the mulVec equality. The Option row index records precisely one value and r derivatives per support.

**API.**

- `firstJetMatrix_value` (projection): The None row at α equals P_i^α.
- `firstJetMatrix_partial` (projection): The Some j row equals α_jP_i^(α−e_j), with zero when α_j=0.
- `firstJetMatrix_mulVec` (compatibility): firstJetMatrix(P,d)·c_d(f)=J_{P,d}(f).

**Tests.**

- `matrix_linear_origin`: For r=1,n=1,d=1,P=0, columns1,x give the identity2×2 matrix.
- `matrix_constants`: For d=0 the single column has value1 and every derivative entry0.
- `matrix_shape`: For r=2,n=2,d=2 the native matrix is6×6, not 2×18.

**Prerequisites:** [Coefficient coordinates](#coefficient-coordinates); [Bounded first-jet evaluation](#first-jet-map); `MvPolynomial.eval_monomial` (Mathlib); `MvPolynomial.pderiv_monomial` (Mathlib).

**Source:** [COU, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

<a id="jet-rank"></a>

**Full row rank criterion.** For a field k, J_{P,d} is onto iff rank(firstJetMatrix(P,d))=n(r+1).

Apply Matrix.rank_eq_finrank_range_toLin to the matrix representation. The target dimension is n(r+1); equality of range dimension with target dimension is equivalent to a full range and hence surjectivity.

**Prerequisites:** [Monomial first-jet matrix](#jet-matrix); [Dimension of bounded polynomials](#bounded-finrank); `Matrix.rank_eq_finrank_range_toLin` (Mathlib).

**Source:** [COU, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

<a id="well-poised"></a>

**Well-poised double points.** For a field k and an injective finite tuple P, WellPoised(P,d) means J_{P,d} is surjective. Via the projective restriction comparison this is COU’s well-poisedness of 2P in degree d.

Define the predicate directly as Function.Surjective(firstJetMap P d). Permuting points gives an invertible target-coordinate permutation, while increasing d includes the old bounded submodule in the new one. The scheme interpretation is established by the separate projective comparison.

**API.**

- `wellPoised_iff_surjective` (characterisation): WellPoised(P,d) iff Surjective(J_{P,d}).
- `wellPoised_reindex` (functoriality): WellPoised is unchanged under a permutation of points.
- `wellPoised_degree_mono` (relation): If d≤e and WellPoised(P,d), then WellPoised(P,e).

**Tests.**

- `wellPoised_one_linear`: One point in A^r is well poised in degree 1.
- `wellPoised_constants_fail`: For r≥1 one point is not well poised in degree 0.
- `wellPoised_collinear_fail`: Seven distinct collinear points in A² are not well poised in degree 5, although21=choose(7,5).

**Prerequisites:** [Bounded first-jet evaluation](#first-jet-map).

**Source:** [COU, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

<a id="projective-jet-comparison"></a>

**Restriction to projective double points.** For d≥0 and an injective affine-chart tuple P, the H⁰(P^r,O(d))→H⁰(2P,O(d)) restriction map is J_{P,d} under fixed homogenization and the chart’s O(d) trivialization; therefore the projective restriction is onto iff WellPoised(P,d).

Extend the finite affine subscheme through the standard open chart, square its ideal sheaf and trivialize O(d) there. Fixed homogenization and doubleQuotient identify source and target with the native polynomial and jet modules. Check the restriction square on the monomial basis.

**Prerequisites:** [Homogeneous forms and twisting sections](#sections-comparison); [Double-point quotient comparison](#double-quotient); [Well-poised double points](#well-poised); **AlgebraicModuliForArithmeticGeometry, R09.1**; **SchemeAndStackFoundations, SF.0**.

**Source:** [COU, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

## GI.2. Restriction rank, Horace and curvilinear families

This layer applies the general geometry interfaces to interpolation. Restriction rank always means the range dimension of a genuine section map, including for a proper linear subsystem. Residual/trace estimates use left exactness only. The curvilinear criterion and proper direction incidence supply the logical and geometric tools for the differential argument.

### Ranks of section maps

<a id="restriction-rank"></a>

**Restriction rank of a finite scheme.** For d≥0, a zero-dimensional subscheme X⊂P^r_k and a finite-dimensional linear system D⊂H⁰(P^r,O(d)), h(X,D) is the rank of the actual restriction D→H⁰(X,O(d)|X). Independence means h(X,D)=length(X). Write h(X,d) for the full system.

Restrict the actual section map to D and take the dimension of its linear range. Rank-nullity gives its kernel formula, while finite-scheme length is the dimension of the twisted target section module. The kernel is a subspace of D, also when D is a proper subsystem.

**API.**

- `restrictionRank_kernel` (characterisation): h(X,D)=dim D−dim ker(D→H⁰(X,O(d)|X)).
- `restrictionRank_le_length` (relation): h(X,D)≤min(dim D,length X).
- `restrictionRank_empty` (simp): h(∅,D)=0.

**Tests.**

- `simple_point_rank`: For a simple point and the full degree 0 constant system, h=1.
- `zero_system_rank`: For D=0, h(X,D)=0 even when X has positive length.
- `double_linear_rank`: For one affine double point and d=1, h=r+1, agreeing with the native first-jet matrix.

**Prerequisites:** **AlgebraicModuliForArithmeticGeometry, R09.1**; **SchemeAndStackFoundations, SF.0**.

**Source:** [BO, §6, Lemma 6.1, pp.12–14](https://arxiv.org/pdf/math/0701409v2).

<a id="rank-disjoint"></a>

**Restriction rank on disjoint unions.** For disjoint finite schemes A,B and D as above, h(A∪B,D)=h(B,D)+h(A,ker(D→H⁰(B,O(d)|B))).

Sections on a disjoint union split into a product. Project the restriction image onto the B factor; its kernel is the restriction image on A of the B-vanishing subspace of D. Rank-nullity proves the identity for this native kernel.

**Prerequisites:** [Restriction rank of a finite scheme](#restriction-rank); **SchemeAndStackFoundations, SF.0**.

**Source:** [BO, §6, Lemma 6.1, pp.12–14](https://arxiv.org/pdf/math/0701409v2).

### Hyperplane residuals and ordinary Horace

<a id="residual-trace"></a>

**Double-point residual and trace.** Let X be q distinct double points in P^r and H a hyperplane containing exactly u supports. Then Tr_H X consists of u double points in H≅P^(r−1), Res_H X consists of q−u double points off H and u reduced points on H, and 0→I_Res(d−1)→I_X(d)→I_Tr,H(d)→0 is exact as sheaves.

Apply the Cartier-divisor residual sequence from SF.0. At a support on H, coordinates with H=(x_r) give (m²:x_r)=m and the trace m²+(x_r); away from H its equation is a unit. Twist the sheaf sequence by O(d).

**Prerequisites:** [Squared union ideal](#double-ideal); **SchemeAndStackFoundations, SF.0**; **AlgebraicModuliForArithmeticGeometry, R09.1**.

**Source:** [BO, §4 pp. 7–8](https://arxiv.org/pdf/math/0701409v2).

<a id="castelnuovo-bound"></a>

**Castelnuovo dimension bound.** In the preceding situation, dim H⁰(I_X(d))≤dim H⁰(I_Res(d−1))+dim H⁰(I_Tr,H(d)). Equivalently h(X,d)≥h(Res,d−1)+h(Tr,d).

Left exactness of global sections identifies the residual section space with the kernel and bounds the image by the trace section space. Convert vanishing-space dimensions to ranks using N(r,d)=N(r,d−1)+N(r−1,d). No right exactness of global sections is required.

**Prerequisites:** [Double-point residual and trace](#residual-trace); [Restriction rank of a finite scheme](#restriction-rank); [Dimension of bounded polynomials](#bounded-finrank).

**Source:** [BO, §4, Theorem 4.1, pp.7–8; §6, Theorem 6.4, pp.16–19](https://arxiv.org/pdf/math/0701409v2).

<a id="ordinary-horace"></a>

**Ordinary Horace criterion.** Suppose trace and residual have maximal rank. If both ur≤N(r−1,d) and q(r+1)−ur≤N(r,d−1), or both reverse inequalities hold, then X has maximal rank in degree d.

The lengths of trace and residual are ur and q(r+1)−ur. Insert their maximal ranks into the Castelnuovo bound. In either of the two matched inequality ranges the lower bound equals min(N(r,d),q(r+1)); the general rank upper bound gives equality.

**Prerequisites:** [Castelnuovo dimension bound](#castelnuovo-bound); [Squared union ideal](#double-ideal); [Length of distinct double points](#double-length).

**Source:** [BO, §4, Theorem 4.1, pp.7–8](https://arxiv.org/pdf/math/0701409v2).

### Testing independence on curvilinear subschemes

<a id="subscheme-independence"></a>

**Independent subschemes.** If X is D-independent and Y⊂X is a finite subscheme, then Y is D-independent. If restriction to X is injective, restriction to every finite superscheme is injective.

For Y⊂X, the finite target section module for Y is a quotient of the one for X; a surjective restriction map therefore remains surjective after composition. A section vanishing on a superscheme also vanishes on X, proving the injective assertion.

**Prerequisites:** [Restriction rank of a finite scheme](#restriction-rank); **SchemeAndStackFoundations, SF.0**.

**Source:** [BO, §1, p.1; §6, Lemma 6.1, pp.12–14](https://arxiv.org/pdf/math/0701409v2).

<a id="curvilinear-one-point"></a>

**Curvilinear criterion at one support.** For X contained in a double point, X is D-independent iff every curvilinear subscheme ξ⊂X of length≤2 is D-independent.

Induct on length inside the square-zero coordinate algebra of one double point. Choose a section vanishing at the support but nonzero on a length-two direction. Its equation cuts length by one; the induction hypothesis gives full rank on that section, and the extra nonzero condition completes the rank.

**Prerequisites:** [Restriction rank of a finite scheme](#restriction-rank); [Independent subschemes](#subscheme-independence); [Kernel of one first jet](#jet-kernel); **SchemeAndStackFoundations, SF.0**.

**Source:** [BO, §6, Lemma 6.1, pp.12–14](https://arxiv.org/pdf/math/0701409v2).

<a id="curvilinear-global"></a>

**Curvilinear reduction.** If X is a finite subscheme of a union of distinct double points, then X is D-independent iff every curvilinear ξ⊂X, with at most length 2 at each support, is D-independent.

Separate one support from the others and apply the disjoint-rank formula to the kernel of the other restrictions. Induction tests every length-two direction for that kernel system; the one-point criterion then recovers the full local component. Iterate over supports.

**Prerequisites:** [Curvilinear criterion at one support](#curvilinear-one-point); [Restriction rank on disjoint unions](#rank-disjoint); [Independent subschemes](#subscheme-independence).

**Source:** [BO, §6, Lemma 6.1, pp.12–14](https://arxiv.org/pdf/math/0701409v2).

### Families and limits

<a id="rank-open"></a>

**Rank in flat point families.** In an actual flat finite family of fixed length on P^r over a reduced parameter scheme, the locus where restriction of a fixed finite-dimensional linear system has rank at least t is open. A specialization cannot increase rank.

Push the twisting restriction forward along the finite-flat family and use base change and local freeness from R09.2. In local bundle coordinates the rank-at-least-t locus is a union of nonvanishing t-minor opens. Determinantal closed sets imply that a specialization cannot increase rank.

**Prerequisites:** [Restriction rank of a finite scheme](#restriction-rank); **AlgebraicModuliForArithmeticGeometry, R09.2**.

**Source:** [BO, §6 pp. 14–18](https://arxiv.org/pdf/math/0701409v2).

<a id="curvilinear-limits"></a>

**Proper limits of curvilinear failures.** For the moving-point family in BO6.4, a failure of D-independence can be witnessed by length 2 subschemes at the moving supports. Their projective direction-incidence parameter is proper, so after a valuative base change they have an actual flat limit with tangent/transverse classifications relative to H.

Each local length-two subscheme is parametrized by a tangent line, with its universal incidence family. Properness of the projective direction parameter extends a generic bad incidence tuple after a valuative base change. The resulting flat limit retains length and supplies its tangent/transverse classification.

**Prerequisites:** [Curvilinear reduction](#curvilinear-global); [Rank in flat point families](#rank-open); **AlgebraicModuliForArithmeticGeometry, R09.2**.

**Source:** [BO, §6 Theorem 6.4, cases after Step 3, pp. 17–19](https://arxiv.org/pdf/math/0701409v2).

## GI.3. Plane and cubic interpolation bases

This layer provides the low-degree inputs for the induction. Finite integer rank witnesses replace the finite computer calculations by explicit determinant assertions. Plane interpolation uses generic tangent/contact geometry. Cubic interpolation uses general codimension-three configurations and a remainder subscheme contained in a double point.

### Exact low-degree rank witnesses

<a id="modular-rank-lift"></a>

**Exact integer rank witnesses.** If an integer constraint matrix has a t×t minor nonzero modulo101, its rank over every characteristic-zero field is at least t. For homogeneous degree d>0 in characteristic zero, vanishing of all r+1 partials at a nonzero vector implies vanishing of the form itself.

A determinant nonzero modulo 101 is a nonzero integer, and the canonical integer map into a characteristic-zero field is injective. The native minor/rank criterion gives the lower bound. Separately, the monomial Euler identity Σx_j∂_jF=dF shows that all homogeneous partials imply the value condition when d is invertible.

**Prerequisites:** `Matrix.rank_eq_finrank_range_toLin` (Mathlib); `MvPolynomial.pderiv_monomial` (Mathlib).

**Source:** [BO, §5, pp.9–12; §6, p.19](https://arxiv.org/pdf/math/0701409v2).

<a id="quadric-kernel"></a>

**Quadrics with prescribed singular points.** For q general points in P^r, the space of singular quadrics has dimension choose(r+2−q,2) when 0≤q≤r+1 and is zero for q≥r+1. In particular at least r+1 general double points leave no quadrics.

Write a quadric as a symmetric bilinear form, using characteristic zero to divide by two. Singularity at independent supports puts their vector span into its radical. Quadrics on the quotient of dimension r+1−q have dimension choose(r+2−q,2); r+1 supports leave a zero quotient.

**Prerequisites:** [Restriction to projective double points](#projective-jet-comparison); [Restriction rank of a finite scheme](#restriction-rank).

**Source:** [BO, §3 p. 6](https://arxiv.org/pdf/math/0701409v2).

<a id="low-rank-bases"></a>

**Low-degree near-exception certificates.** Generic homogeneous jet ranks at cubic(r,q)=(2,3),(2,4),(3,5),(4,6),(4,8),(7,15) and quartic(r,q)=(2,4),(2,6),(3,8),(3,10),(4,13),(4,15) are respectively 9,10,20,30,35,120 and 12,15,32,35,65,70.

For each listed triple construct the homogeneous monomial derivative matrix at distinct integer projective supports. A minor of the stated size is nonzero modulo 101, so its characteristic-zero rank reaches the dimensional upper bound. Rank openness gives the corresponding generic assertion; no rank at an exceptional count is inferred from a neighboring count.

**Prerequisites:** [Exact integer rank witnesses](#modular-rank-lift); [Rank in flat point families](#rank-open).

**Source:** [BO, §2, p.6; §3, pp.6–7; §5, pp.9–12; §6, p.19](https://arxiv.org/pdf/math/0701409v2).

### Plane interpolation through tangent and contact geometry

<a id="veronese-tangent"></a>

**Veronese tangents and double-point conditions.** For d≥1 and nonzero v∈k^(r+1), the tangent space to the affine Veronese cone at v^d is v^(d−1)k^(r+1); its annihilator in degree-d forms is the squared point ideal in degree d.

Differentiate the degree-d Veronese map; its differential is multiplication by d v^(d−1), and d is invertible. At a coordinate support the annihilator consists of forms with zero value and first derivatives. Coordinate change identifies that annihilator with the degree-d part of the squared point ideal.

**Prerequisites:** [Kernel of one first jet](#jet-kernel); [Homogeneous forms and twisting sections](#sections-comparison); **SchemeAndStackFoundations, SF.0**.

**Source:** [BO, §2, Proposition 2.1, p.3](https://arxiv.org/pdf/math/0701409v2).

<a id="terracini-span"></a>

**Terracini span for the Veronese family.** At general q Veronese points and a general point in their span, the tangent to their q-secant variety is the span of their tangent spaces; its affine dimension is the restriction rank of the q double points.

Use the incidence map from ordered points and coefficients in their projective span. Its differential is the span of the point tangents and span-coefficient directions. Generic smoothness and the generic rank/dimension theorem from the SF.0 continuation identify this with the secant tangent space.

**Prerequisites:** [Veronese tangents and double-point conditions](#veronese-tangent); **SchemeAndStackFoundations, SF.0**.

**Source:** [BO, §2 Lemma 2.2, pp. 3–4](https://arxiv.org/pdf/math/0701409v2).

<a id="terracini-contact"></a>

**Contact curve in the defective plane case.** For general q points in the Veronese plane, a defective tangent span has positive-dimensional contact through each support. For a general degree-d form singular at those supports this yields a reduced plane curve C of degree l through them with 2C contained in its divisor.

Apply the generic contact-fiber argument to the incidence map and a general span point. Positive-dimensional components through the supports yield a reduced contact curve. SF.5 identifies its double containment in the singular divisor and gives 2ℓ≤d and q≤ℓ(ℓ+3)/2 for general plane supports.

**Prerequisites:** [Terracini span for the Veronese family](#terracini-span); **SchemeAndStackFoundations, SF.0**; **SchemeAndStackFoundations, SF.5**.

**Source:** [BO, §2 Lemma 2.3 p. 5 and Theorem 2.4 p. 6](https://arxiv.org/pdf/math/0701409v2).

<a id="plane-numerics"></a>

**Plane contact numerical reduction.** In the plane critical-count argument of BO’s Theorem 2.4, the bounds 2l≤d and q≤l(l+3)/2, with q the relevant critical floor count, reduce a possible defect to d≤4 or d=6.

Substitute q=floor(N(2,d)/3) and ℓ≤floor(d/2) into q≤ℓ(ℓ+3)/2. Separate even and odd d and calculate the small boundary values explicitly. The only possible degrees left beyond d≤4 are sextics.

**Prerequisites:** [Contact curve in the defective plane case](#terracini-contact); [Binomial count of bounded monomials](#monomial-count).

**Source:** [BO, §2 Theorem 2.4 proof, p. 6](https://arxiv.org/pdf/math/0701409v2).

<a id="plane-sextic-base"></a>

**Exact sextic plane critical ranks.** There exist distinct plane point configurations for which degree 6 homogeneous jet ranks are 27 at q=9 and 28 at q=10. Thus the corresponding generic ranks are maximal.

Construct integer homogeneous derivative matrices for 9 and 10 distinct plane supports and exhibit nonzero minors of sizes 27 and 28 modulo 101. Determinant lifting gives the same characteristic-zero lower bounds, and openness on the irreducible support parameter gives the generic ranks.

**Prerequisites:** [Exact integer rank witnesses](#modular-rank-lift); [Rank in flat point families](#rank-open).

**Source:** [BO, §2 Theorem 2.4 proof, p. 6; authored sextic certificate replacement](https://arxiv.org/pdf/math/0701409v2).

<a id="plane-interpolation"></a>

**Plane interpolation input.** General double points in P² impose maximal-rank conditions in every degree, except (d,q)=(2,2) and (4,5). The endpoint needed here includes both critical counts in every d≥5.

Combine the contact-curve numerical reduction with the sextic and low-degree rank witnesses. The quadric radical formula gives the quadratic exception and a doubled conic gives the quartic exception. Independence passes to subsets and injectivity to supersets, extending the two critical counts to every count.

**Prerequisites:** [Plane contact numerical reduction](#plane-numerics); [Exact sextic plane critical ranks](#plane-sextic-base); [Quadrics with prescribed singular points](#quadric-kernel); [Low-degree near-exception certificates](#low-rank-bases); [Independent subschemes](#subscheme-independence).

**Source:** [BO, §2, Theorem 2.4, p.6](https://arxiv.org/pdf/math/0701409v2).

### Codimension-three cubic systems

<a id="three-cubic-bases"></a>

**Three-subspace cubic base certificates.** For r=5,6,7: no cubic containing three suitably chosen codimension 3 subspaces and singular at three distinct points on each. The full-column integer constraint matrices have ranks 56,84,120.

Choose integer subspace frames and support vectors in the prescribed incidences for dimensions 5,6,7. Build the homogeneous derivative constraints together with value constraints at integer sample points on each space, and any specified remainder-direction constraints. A full-column minor has nonzero residue modulo 101, giving ranks 56,84,120. These are necessary conditions for a containing cubic, so full column rank excludes it; openness yields the general assertion.

**Prerequisites:** [Exact integer rank witnesses](#modular-rank-lift); [Rank in flat point families](#rank-open).

**Source:** [BO, §5 Proposition 5.2 pp. 9–10](https://arxiv.org/pdf/math/0701409v2).

<a id="three-cubic-recursion"></a>

**Three-subspace cubic recursion.** For r≥5, three general codimension 3 subspaces and three general points on each admit no cubic containing the spaces and singular at all nine points.

For r≥8 specialize the nine supports to a general hyperplane and use the r−1 assertion on the trace. The residual is a quadric containing the three general codimension-three spaces. A coefficient calculation shows its space is zero, so the residual/trace bound completes the induction.

**Prerequisites:** [Three-subspace cubic base certificates](#three-cubic-bases); [Double-point residual and trace](#residual-trace); [Rank in flat point families](#rank-open).

**Source:** [BO, §5, Proposition 5.2, pp.9–10](https://arxiv.org/pdf/math/0701409v2).

<a id="two-cubic-bases"></a>

**Two-subspace cubic base certificates.** For r=5,7 there exist two suitably chosen codimension 3 spaces in general position, r−2 distinct double supports on each and three distinct ambient double supports outside them, with no nonzero cubic containing both spaces and singular at those supports. The integer certificate ranks are 56 and 120; openness gives the corresponding general configurations.

Choose integer subspace frames and support vectors in the prescribed incidences for dimensions 5,7. Build the homogeneous derivative constraints together with value constraints at integer sample points on each space, and any specified remainder-direction constraints. A full-column minor has nonzero residue modulo 101, giving ranks 56,120. These are necessary conditions for a containing cubic, so full column rank excludes it; openness yields the general assertion.

**Prerequisites:** [Exact integer rank witnesses](#modular-rank-lift); [Rank in flat point families](#rank-open).

**Source:** [BO, §5 Proposition 5.3 p. 10, corrected P⁷ base](https://arxiv.org/pdf/math/0701409v2).

<a id="two-cubic-recursion"></a>

**Two-subspace cubic recursion.** For r≥3,r≠4, two general codimension 3 spaces L,M, r−2 general double points on each and three general ambient double points leave no cubic containing L∪M.

Use the direct r=3 case and the r=5,7 bases. In r=6 or r≥8 introduce a third codimension-three space, specialize r−5 supports from each original list to its intersections, and move the three ambient supports into it. The trace is the r−3 two-space assertion; the kernel is killed by the three-space assertion with its nine remaining singularities.

**Prerequisites:** [Two-subspace cubic base certificates](#two-cubic-bases); [Three-subspace cubic recursion](#three-cubic-recursion); [Rank in flat point families](#rank-open).

**Source:** [BO, §5, Proposition 5.3, p.10](https://arxiv.org/pdf/math/0701409v2).

<a id="one-cubic-bases"></a>

**One-subspace cubic base certificates.** For r=5 there exist a codimension 3 subspace L, three distinct double supports on L, six distinct ambient double supports outside L, and a length 2 scheme η⊂2Q at a further support Q∈L with length(η∩L)=1, such that no nonzero cubic contains L and satisfies these conditions. For r=7 the corresponding configuration has seven distinct double supports on L and eight distinct ambient double supports outside L, with no remainder scheme. Certificate ranks are 56 and 120; openness gives the corresponding general configurations.

Choose integer subspace frames and support vectors in the prescribed incidences for dimensions 5,7. Build the homogeneous derivative constraints together with value constraints at integer sample points on each space, and any specified remainder-direction constraints. A full-column minor has nonzero residue modulo 101, giving ranks 56,120. These are necessary conditions for a containing cubic, so full column rank excludes it; openness yields the general assertion.

**Prerequisites:** [Exact integer rank witnesses](#modular-rank-lift); [Rank in flat point families](#rank-open).

**Source:** [BO, §5 Proposition 5.4 pp. 10–11](https://arxiv.org/pdf/math/0701409v2).

<a id="one-cubic-recursion"></a>

**One-subspace cubic recursion.** For r≥3,r≠4, let L have codimension 3. If r≠2 mod3, prescribe r(r−1)/6 general distinct double supports on L and r+1 general ambient double supports outside L. If r≡2 mod3, prescribe (r+1)(r−2)/6 general distinct double supports on L, r+1 general ambient double supports outside L, and a general η⊂2Q at a further general Q∈L of length δ_r=(r+1)/3 and trace length δ_r−1. No nonzero cubic containing L satisfies these conditions.

Introduce a second codimension-three space M. Specialize the required on-L supports to L∩M and r−2 ambient supports to M; in the remainder case place η inside M with the prescribed trace. The restriction image is controlled by the r−3 one-space assertion and the kernel by the two-space assertion. Use a finite-flat η family inside a double point to preserve the trace and length requirements.

**Prerequisites:** [One-subspace cubic base certificates](#one-cubic-bases); [Two-subspace cubic recursion](#two-cubic-recursion); [Rank in flat point families](#rank-open).

**Source:** [BO, §5, Proposition 5.4, pp.10–11](https://arxiv.org/pdf/math/0701409v2).

<a id="cubic-remainder"></a>

**Cubic critical-count remainder.** Put q_r=floor((r+3)(r+2)/6) and δ_r=N(r,3)−(r+1)q_r. Then δ_r=0 for r≠2 mod3 and δ_r=(r+1)/3 otherwise. For r≥2,r≠4, q_r general double points together with a general η⊂2Q of length δ_r impose N(r,3) independent conditions.

Compute δ_r by r modulo three. A codimension-three specialization puts q_(r−3) doubles and the trace of η on L, leaving r+1 ambient doubles. Apply the lower-dimensional critical assertion to the trace and the one-space assertion to the kernel. In P² the three coordinate supports leave only the triangle cubic x₀x₁x₂, and its value at [1:1:1] kills it.

**Prerequisites:** [One-subspace cubic recursion](#one-cubic-recursion); [Low-degree near-exception certificates](#low-rank-bases); [Independent subschemes](#subscheme-independence).

**Source:** [BO, §5, Theorem 5.1, pp.9–12](https://arxiv.org/pdf/math/0701409v2).

<a id="cubic-maximal-rank"></a>

**Cubic maximal-rank input.** For r≥2, general q double points in P^r have maximal rank in degree 3 unless (r,q)=(4,7). In dimension 4 only q≤6 or q≥8 are used in the induction.

The remainder assertion gives the critical floor independence. When δ_r>0, enlarging η to its containing double point kills the kernel at the critical ceiling count. Use subset and superscheme monotonicity; in dimension four use the separate six-point and eight-point bases.

**Prerequisites:** [Cubic critical-count remainder](#cubic-remainder); [Low-degree near-exception certificates](#low-rank-bases); [Independent subschemes](#subscheme-independence).

**Source:** [BO, §5, Theorem 5.1, pp.9–12; §3, p.7](https://arxiv.org/pdf/math/0701409v2).

### The quartic starting dimension

<a id="quartic-five"></a>

**Quartic P⁵ critical certificate.** There is a configuration of 21 distinct points in P⁵ whose homogeneous quartic first-derivative constraint matrix has full rank 126. Therefore 21 general double points impose independent quartic conditions.

At 21 distinct integer supports in P⁵, an integer homogeneous quartic derivative matrix has a 126-minor nonzero modulo 101. This reaches both the source and target dimensions. Lift the determinant and use rank openness to obtain the general quartic assertion.

**Prerequisites:** [Exact integer rank witnesses](#modular-rank-lift); [Rank in flat point families](#rank-open).

**Source:** [BO, §6 p. 19 final quartic base](https://arxiv.org/pdf/math/0701409v2).

## GI.4. Differential Horace and generic projective interpolation

The differential theorem connects the trace and two lower-degree predecessors, with both critical counts handled explicitly. This layer first establishes the arithmetic and residual tools, then the moving-family rank argument, and finally the quartic and degree-at-least-five induction. Maximal rank is maintained throughout, so overfilled systems give injectivity.

For r≥2 and d≥4, the two critical counts satisfy
floor(N(r,d)/(r+1))≤q≤ceil(N(r,d)/(r+1)). Define the integer division data by

$$ru+e=q(r+1)-N(r,d-1),\qquad 0\le e<r.$$

Fix a hyperplane H and pairwise distinct, simultaneously general support lists:
Φ consists of u points on H; Γ consists of e further points on H; and Σ
consists of q−u−e points off H. In the full induction all three hypotheses

$$\mathrm{AH}(r-1,d,u),\qquad\mathrm{AH}(r,d-1,q-u),\qquad
\mathrm{AH}(r,d-2,q-u-e)$$

are explicit inputs. The *successful residual setup* means that
Φ∪Σ²∪(Γ²|H) is independent in degree d−1, with total length N(r,d−1).
This is obtained by the partial-residual, restriction-injectivity and
simple-point results below. A *simultaneous choice* intersects the trace and
residual nonempty opens in their irreducible parameter scheme. The trace used
in the overfilled branch is the selected partial trace Φ²|H∪Γ₀ with
|Γ₀|=ν, rather than the full Γ trace.

### Integer division and the Horace size inequalities

<a id="numerical-trace-bound"></a>

**Horace trace-size inequality.** For r≥2,d≥4,0≤q≤ceil(N(r,d)/(r+1)), let integers u,e satisfy ru+e=q(r+1)−N(r,d−1) and 0≤e<r. Then re+u≤N(r−1,d−1).

Bound q(r+1) by N(r,d)+r and insert the division relation and Pascal identity. Use 0≤e<r to estimate re+u. The sharp estimate includes the small pairs (r,d)=(3,4),(4,4),(5,4), which are checked by integer division rather than asymptotics.

**Prerequisites:** [Binomial count of bounded monomials](#monomial-count).

**Source:** [BO, §6 Lemma 6.3(i), pp. 15–16](https://arxiv.org/pdf/math/0701409v2).

<a id="numerical-residual-bound"></a>

**Horace residual-size inequality.** For the same r,d,q,u,e, N(r,d−2)≤(q−u−e)(r+1).

Eliminate q with ru+e=q(r+1)−N(r,d−1), then insert the trace bound for u+re. Pascal gives N(r,d−1)−N(r−1,d−1)=N(r,d−2). The resulting positive lower bound also forces q−u−e≥0.

**Prerequisites:** [Horace trace-size inequality](#numerical-trace-bound).

**Source:** [BO, §6 Lemma 6.3(ii), pp. 15–16](https://arxiv.org/pdf/math/0701409v2).

<a id="numerical-quartic-bound"></a>

**Large-dimensional quartic residual bound.** For d=4,r≥10 and the integer division data just defined, q−u−e≥r+1.

Specialize the sharper division estimate to d=4, retaining the actual remainder e<r. Check the boundary r=10 and the increasing polynomial bound for larger r. The coarse residual bound alone is weaker than r+1 and is not substituted for this sharp conclusion.

**Prerequisites:** [Horace residual-size inequality](#numerical-residual-bound).

**Source:** [BO, §6 Lemma 6.3(iii), pp. 15–16](https://arxiv.org/pdf/math/0701409v2).

<a id="critical-division"></a>

**Nonnegative critical Horace data.** For r≥2,d≥4 and floor(N(r,d)/(r+1))≤q≤ceil(N(r,d)/(r+1)), the Euclidean-division data u,e above satisfy 0≤u≤q and 0≤q−u−e.

At either critical count q(r+1)≥N(r,d)−r. Comparing with N(r,d−1) makes the dividend nonnegative for r≥2,d≥4. Integer Euclidean division gives u≥0; the residual bound gives q−u−e≥0 and therefore u≤q.

**Prerequisites:** [Horace residual-size inequality](#numerical-residual-bound).

**Source:** [BO, §6, Lemma 6.3, pp.15–16; Theorem 6.4, p.16](https://arxiv.org/pdf/math/0701409v2).

### Filling the residual and trace systems

<a id="partial-residual-rank"></a>

**Mixed residual rank in degree d−1.** Let q,u,e be critical Horace data and assume AH(r,d−1,q−u). Choose Σ of q−u−e general off-H supports and Γ of e general supports on H. Their full doubles at Σ and H-restricted doubles at Γ have rank (r+1)(q−u)−e in degree d−1; their vanishing-system dimension is u.

Specialize e supports to H, discard their normal derivative conditions and prove independence of the remaining restricted conditions using the lower-degree hypothesis and trace bound. This requires the specialization and transversality argument; row deletion by itself does not establish it. Subtract the independent-condition count from N(r,d−1) to obtain dimension u.

**Prerequisites:** [Horace trace-size inequality](#numerical-trace-bound); [Nonnegative critical Horace data](#critical-division); [Restriction rank on disjoint unions](#rank-disjoint); [Rank in flat point families](#rank-open).

**Source:** [BO, §6 Theorem 6.4 Step 1 pp. 16–17](https://arxiv.org/pdf/math/0701409v2).

<a id="residual-restrict-injective"></a>

**Injective residual restriction to H.** Assume AH(r,d−2,q−u−e). By the numerical residual bound, no degree d−2 form vanishes doubly at Σ. Consequently restriction to H is injective on the degree d−1 system vanishing on Σ² and the restricted doubles Γ²|H.

The numerical residual bound makes the degree-(d−2) predecessor overfilled, so its maximal rank kills its kernel. A degree-(d−1) residual section that restricts to zero on H is divisible by the equation of H. Its quotient vanishes doubly at off-H Σ and must therefore be zero.

**Prerequisites:** [Horace residual-size inequality](#numerical-residual-bound); [Mixed residual rank in degree d−1](#partial-residual-rank); [Double-point residual and trace](#residual-trace).

**Source:** [BO, §6, Theorem 6.4, Step 2, p.16](https://arxiv.org/pdf/math/0701409v2).

<a id="residual-simple-points"></a>

**Killing a residual system with simple points.** If a degree d−1 residual linear system has dimension u and restricts injectively to H, then u general reduced points Φ on H make its restriction map injective. Applied to the Horace residual system this fills N(r,d−1) conditions.

A nonzero restricted section on the reduced hyperplane is nonzero at some k-point. Successively choose a point that lowers the evaluation kernel dimension by one; distinct choices occur on a nonempty open. After u choices the injectively restricted u-dimensional system has zero kernel.

**Prerequisites:** [Injective residual restriction to H](#residual-restrict-injective); [Rank in flat point families](#rank-open); [Restriction rank on disjoint unions](#rank-disjoint).

**Source:** [BO, §6, Theorem 6.4, Step 2, p.16](https://arxiv.org/pdf/math/0701409v2).

<a id="trace-simple-rank"></a>

**Underfilled trace with simple remainder.** In the underfilled critical case q(r+1)≤N(r,d), assuming AH(r−1,d,u), choose Φ,Γ on H as above so h(Φ²|H∪Γ,d)=ru+e. Every subcollection of the simple Γ points preserves independence.

The underfilled division identity gives ru+e≤N(r−1,d). Use AH(r−1,d,u) for Φ, then add e general simple points to its remaining section system. Intersect this open with the residual-filling open for Φ; irreducibility gives a simultaneous choice.

**Prerequisites:** [Killing a residual system with simple points](#residual-simple-points); [Independent subschemes](#subscheme-independence); [Rank in flat point families](#rank-open).

**Source:** [BO, §6, Theorem 6.4, Step 3, p.17](https://arxiv.org/pdf/math/0701409v2).

### The moving finite-flat family

<a id="moving-supports"></a>

**Moving supports and hyperplanes.** For fixed Γ={γ_i}⊂H, choose an actual algebraic family δ_i(t_i) with δ_i(0)=γ_i and general δ_i(t_i) off H, together with hyperplanes H_i(t_i) through δ_i(t_i) specializing to H. The corresponding full and hyperplane-restricted double-point families are finite flat over the parameter open.

In a chart choose δ_i(t_i)=γ_i+t_i v_i with v_i transverse to H and vary a hyperplane equation through δ_i(t_i). Pull back the actual squared-ideal incidence families of R09.2. Restrict to the open where supports remain distinct; full and hyperplane-restricted fibres have lengths r+1 and r.

**API.**

- `movingSupports_zero` (simp): δ_i(0)=γ_i and H_i(0)=H.
- `movingSupports_flat` (structure): The double-point and restricted double-point families have constant ranks r+1 and r over the distinct-support open.
- `movingSupports_baseChange` (functoriality): Any parameter base change pulls back the same squared-ideal incidence family.

**Tests.**

- `moving_affine_line`: In A² with H=(y=0), δ(t)=(a,t) and H_t=(y=t) give the stated fibres.
- `moving_zero_fibre`: At t=0 the double point retains length 3; it does not become reduced.
- `moving_restricted_length`: Intersecting its double scheme with H_t gives length 2, agreeing with the local square-zero quotient.

**Prerequisites:** [Proper limits of curvilinear failures](#curvilinear-limits); **AlgebraicModuliForArithmeticGeometry, R09.2**; **SchemeAndStackFoundations, SF.0**.

**Source:** [BO, §6 Theorem 6.4, moving families in the first and second cases, pp. 17–18](https://arxiv.org/pdf/math/0701409v2).

<a id="transverse-limit-rank"></a>

**Transverse curvilinear limit rank.** Assume the chosen partial trace Φ²|H∪Γ₀ is d-independent, with F⊆Γ₀ a set of f moving length 2 directions whose limits are transverse to H. Their special traces retain one reduced support each, so h(Φ²|H∪F,d)=ru+f. Their local residuals have length 1 each; these are independent residual conditions when added to the successful Step2 residual setup.

The local ideal of a transverse length-two direction has a reduced length-one trace and a reduced length-one residual. Independence of the selected partial trace gives rank ru+f by subset monotonicity. The successfully filled residual system supplies the corresponding reduced residual conditions.

**Prerequisites:** [Moving supports and hyperplanes](#moving-supports); [Double-point residual and trace](#residual-trace); [Proper limits of curvilinear failures](#curvilinear-limits); [Independent subschemes](#subscheme-independence); [Killing a residual system with simple points](#residual-simple-points).

**Source:** [BO, §6 Theorem 6.4 first case p. 18](https://arxiv.org/pdf/math/0701409v2).

<a id="tangent-moving-rank"></a>

**Tangent directions in the moving residual.** In the critical Horace setup with the successful Step2 (d−1)-independent residual system Φ∪Σ²∪Γ²|H, take g bad curvilinear directions whose limits lie in H and f transverse indices, with f+g=e. Keep the tangent supports at a general nonzero parameter during the mixed residual estimate. They contribute2g independent residual conditions; combined residual rank is at least u+(r+1)(q−u−e)+f+2g.

Split indices into transverse F and tangent G. Set the F parameters to their limits, while keeping the G parameters general and nonzero so their length-two conditions remain in the residual. Combine the successful residual setup, subset independence and rank semicontinuity to obtain the lower bound.

**Prerequisites:** [Killing a residual system with simple points](#residual-simple-points); [Moving supports and hyperplanes](#moving-supports); [Rank in flat point families](#rank-open); [Proper limits of curvilinear failures](#curvilinear-limits).

**Source:** [BO, §6 Theorem 6.4 first case p. 18](https://arxiv.org/pdf/math/0701409v2).

### The two critical-count arguments

<a id="underfilled-contradiction"></a>

**Underfilled differential Horace contradiction.** For r≥2,d≥4 and critical q with q(r+1)≤N(r,d), assume AH(r−1,d,u), AH(r,d−1,q−u), AH(r,d−2,q−u−e), and the simultaneous residual/trace setup above. A curvilinear failure at the e moved supports would have rank below (r+1)(q−e)+2e, while the mixed specialization has rank at least that number. Hence a nonempty open set of moves is independent.

Curvilinear reduction and proper direction incidence give a flat limit of a generic failing configuration. Add the mixed residual bound u+(r+1)(q−u−e)+f+2g to the trace bound ru+f. Since f+g=e, this is (r+1)(q−e)+2e, contradicting the closed upper-rank condition of failure.

**Prerequisites:** [Transverse curvilinear limit rank](#transverse-limit-rank); [Tangent directions in the moving residual](#tangent-moving-rank); [Castelnuovo dimension bound](#castelnuovo-bound); [Curvilinear reduction](#curvilinear-global); [Rank in flat point families](#rank-open); [Underfilled trace with simple remainder](#trace-simple-rank).

**Source:** [BO, §6, Theorem 6.4, first case, pp.17–18](https://arxiv.org/pdf/math/0701409v2).

<a id="overfilled-partial-scheme"></a>

**Overfilled partial-length reduction.** For r≥2,d≥4 and critical q with q(r+1)>N(r,d), assume AH(r−1,d,u), AH(r,d−1,q−u), AH(r,d−2,q−u−e), and the successful simultaneous residual/trace setup. Put ν=N(r−1,d)−ru. If ν<0 ordinary Horace applies. Otherwise 0≤ν<e; choose Γ₀⊆Γ with ν supports so Φ²|H∪Γ₀ is independent. Replacing the moved e doubles by ν full doubles and e−ν hyperplane-restricted doubles gives a subscheme of length exactly N(r,d).

For ν≥0 select ν simple trace supports from Γ and keep only the corresponding full moving doubles; at the other indices use hyperplane-restricted doubles. Its length is (q−e)(r+1)+ν(r+1)+(e−ν)r=N(r,d). If ν<0, trace injectivity and the filled residual already give ordinary Horace.

**Prerequisites:** [Nonnegative critical Horace data](#critical-division); [Horace residual-size inequality](#numerical-residual-bound); [Ordinary Horace criterion](#ordinary-horace); [Moving supports and hyperplanes](#moving-supports); [Killing a residual system with simple points](#residual-simple-points); [Independent subschemes](#subscheme-independence); [Rank in flat point families](#rank-open).

**Source:** [BO, §6 Theorem 6.4 second case p. 18](https://arxiv.org/pdf/math/0701409v2).

<a id="overfilled-contradiction"></a>

**Overfilled differential Horace contradiction.** Under the overfilled critical-case hypotheses and successful setup of overfilled-partial-scheme, with ν≥0, apply the mixed-parameter transverse/tangent argument to its independent selected trace Φ²|H∪Γ₀, not to the full Γ trace. This makes the partial-length subscheme independent and therefore makes the full q-double-point system injective in degree d.

In the partial scheme, every direction at a restricted index belongs to the tangent set G. Transverse F is consequently a subset of the ν selected trace supports, where the trace rank bound applies. The same mixed-rank contradiction gives independence at length N(r,d); enlarging to all full doubles preserves injectivity.

**Prerequisites:** [Overfilled partial-length reduction](#overfilled-partial-scheme); [Transverse curvilinear limit rank](#transverse-limit-rank); [Tangent directions in the moving residual](#tangent-moving-rank); [Independent subschemes](#subscheme-independence); [Curvilinear reduction](#curvilinear-global).

**Source:** [BO, §6 Theorem 6.4 second case pp. 18–19](https://arxiv.org/pdf/math/0701409v2).

### The differential induction theorem

<a id="differential-horace"></a>

**Differential Horace induction step.** For r≥2,d≥4 and a critical q, suppose AH(r−1,d,u), AH(r,d−1,q−u), and AH(r,d−2,q−u−e) for the division data. Then AH(r,d,q) holds. Here AH means generic maximal rank, not independence when the system is overfilled.

Choose the residual and trace configurations on simultaneous nonempty opens using all three predecessor hypotheses. Use the underfilled contradiction when q(r+1)≤N(r,d), and the partial-length argument or its ordinary branch otherwise. A witness and rank openness give AH(r,d,q).

**Prerequisites:** [Mixed residual rank in degree d−1](#partial-residual-rank); [Killing a residual system with simple points](#residual-simple-points); [Underfilled differential Horace contradiction](#underfilled-contradiction); [Overfilled differential Horace contradiction](#overfilled-contradiction).

**Source:** [BO, §6, Theorem 6.4, pp.16–19](https://arxiv.org/pdf/math/0701409v2).

### The univariate base

<a id="univariate-hermite"></a>

**Univariate Hermite interpolation.** For any field k, every injective n-tuple in A¹ and d≥2n−1 has surjective first-jet evaluation. More generally its rank is min(d+1,2n).

The pairwise comaximal ideals (x−P_i)² have product a monic polynomial of degree 2n. Division gives a unique representative of degree less than 2n in the quotient. Below that degree the restriction is injective; at and above it the map is surjective. This reasoning uses no division by factorials.

**Prerequisites:** [Double-point quotient comparison](#double-quotient); [Full row rank criterion](#jet-rank).

**Source:** [BO, §1 univariate remark p. 1; §7.1 opening paragraph p. 19](https://arxiv.org/pdf/math/0701409v2).

### Quartic induction and the exception schedule

<a id="quartic-seven"></a>

**Quartic P⁷ ordinary Horace input.** Assuming the quartic30-point assertion in P⁶, quartic q=41 and q=42 in P⁷ have maximal rank by specializing u=30 supports to a hyperplane; both ordinary Horace inequalities have the matching direction.

Use u=30 hyperplane supports. The quartic trace has dimension and length 210; the cubic residual has source dimension 120 and lengths 118 or 126 for q=41 or 42. Cubic maximal rank and general simple-point selection supply the residual. The quartic input in P⁶ is a hypothesis of this argument.

**Prerequisites:** [Cubic maximal-rank input](#cubic-maximal-rank); [Ordinary Horace criterion](#ordinary-horace); [Killing a residual system with simple points](#residual-simple-points).

**Source:** [BO, §6 p. 19](https://arxiv.org/pdf/math/0701409v2).

<a id="quartic-induction"></a>

**Quartic induction inputs.** Quartic critical counts have maximal rank for r≥5. For r=6,8,9 the differential Horace data avoid the low-degree exceptions; for r≥10 its degree 2 residual is empty by q−u−e≥r+1.

Induct increasingly in dimension from r=5. Handle r=7 by ordinary Horace and r=6,8,9 by the differential theorem with explicit critical division data. For r≥10, the quartic arithmetic bound ensures at least r+1 supports in the quadratic predecessor, so its kernel vanishes. The other predecessors are the cubic theorem and the smaller-dimensional quartic theorem.

**Prerequisites:** [Quartic P⁵ critical certificate](#quartic-five); [Quartic P⁷ ordinary Horace input](#quartic-seven); [Quadrics with prescribed singular points](#quadric-kernel); [Cubic maximal-rank input](#cubic-maximal-rank); [Differential Horace induction step](#differential-horace); [Large-dimensional quartic residual bound](#numerical-quartic-bound).

**Source:** [BO, §6 p. 19 final induction](https://arxiv.org/pdf/math/0701409v2).

<a id="exception-scheduler"></a>

**Exception-avoiding induction schedule.** For r≥3,d≥5 and each critical q, the differential-Horace predecessor triples avoid all exceptional AH cases, once the plane and cubic inputs and the quartic bases are used. The induction is lexicographic in degree and then dimension; the r=2 case is supplied independently.

Use the complete low-degree exception list. For d=5 examine quartic and cubic predecessors; for d=6 examine the quartic residual; for d≥7 their degrees are at least five. Combine the quartic schedule and critical division inequalities to exclude every exceptional predecessor for r≥3. The plane case is a separate input.

**Prerequisites:** [Plane interpolation input](#plane-interpolation); [Cubic maximal-rank input](#cubic-maximal-rank); [Quartic induction inputs](#quartic-induction); [Nonnegative critical Horace data](#critical-division).

**Source:** [BO, §6 p. 19 final induction](https://arxiv.org/pdf/math/0701409v2).

### The projective endpoint

<a id="generic-projective"></a>

**Generic characteristic-zero double-point rank.** Over algebraically closed characteristic-zero k, for r≥1,d≥5 and every q≥1, a nonempty Zariski-open subset of ordered distinct q-tuples in (P^r)^q has homogeneous degree-d jet rank min(N(r,d),q(r+1)).

Prove the two critical counts by lexicographic induction in degree then dimension, with the separate plane and univariate inputs. Pass to subsets below the floor count and add supports above the ceiling count. Irreducibility and rank openness turn each maximal-rank witness into the required nonempty open.

**Prerequisites:** [Differential Horace induction step](#differential-horace); [Exception-avoiding induction schedule](#exception-scheduler); [Univariate Hermite interpolation](#univariate-hermite); [Plane interpolation input](#plane-interpolation); [Independent subschemes](#subscheme-independence); [Rank in flat point families](#rank-open).

**Source:** [BO, §1, Theorem 1.1, p.1; §6, conclusion, p.19](https://arxiv.org/pdf/math/0701409v2).

## GI.5. Affine principal opens and integer coordinates

The projective theorem meets the affine chart and gives a full-row-rank witness. The universal integer matrix then yields a chosen nonzero maximal minor, a principal open and an integer box point. Polynomial pullback is conditional on nonvanishing in the consumer’s parameter family.

### The affine chart and universal matrix

<a id="affine-dense"></a>

**Passing to the dense affine chart.** The ordered-distinct affine chart of (P^r)^n is a nonempty dense open for r,n≥1. It meets the nonempty generic projective maximal-rank locus, and fixed homogenization identifies its rank with the bounded-polynomial first-jet rank.

Intersect the generic projective rank locus with the standard chart in every factor and with the complement of all support diagonals. These are nonempty opens in the irreducible projective product. Apply the actual homogeneous-section/first-jet comparison on that chart.

**Prerequisites:** [Generic characteristic-zero double-point rank](#generic-projective); [Restriction to projective double points](#projective-jet-comparison); **SchemeAndStackFoundations, SF.0**.

**Source:** [COU, §3, p.491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf); [BO, §1, Theorem 1.1, p.1](https://arxiv.org/pdf/math/0701409v2).

<a id="universal-jet-matrix"></a>

**Universal first-jet matrix.** For r,n,d≥0 define a matrix U(r,n,d) over Z[T_{ij}] with the same row and column indices as firstJetMatrix. Its entries are T_i^α and α_jT_i^(α−e_j). Evaluation in any field at a tuple P gives firstJetMatrix(P,d).

Use native integer polynomials in variables indexed by Fin n×Fin r. Rename each monomial into the i-th coordinate block and apply the exponent-decrement derivative formula. Evaluation through the canonical integer algebra map commutes with the entries and their determinants.

**API.**

- `universalJetMatrix_eval` (compatibility): Evaluating T_{ij}=P_ij in k gives firstJetMatrix(P,d).
- `universalJetMatrix_value` (projection): The value entry is the product of T_i coordinates to exponent α.
- `universalJetMatrix_partial` (projection): The derivative entry is α_j times the exponent-decremented monomial, zero when α_j=0.

**Tests.**

- `universal_one_linear`: For r=n=d=1, the matrix in columns1,x is [[1,T],[0,1]], determinant1.
- `universal_zero_degree`: For d=0 all derivative rows are zero.
- `universal_integer_eval`: Evaluating at P=3 gives the native value9 and derivative6 for x².

**Prerequisites:** [Monomial first-jet matrix](#jet-matrix); `MvPolynomial.aeval` (Mathlib); `MvPolynomial.pderiv_monomial` (Mathlib).

**Source:** [COU, §3 pp. 491–492](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

### A selected determinant and its principal open

<a id="maximal-minor"></a>

**Nonzero maximal minor.** In the endpoint range r,n≥1,d≥5,n(r+1)≤N(r,d), there exists a choice of n(r+1) distinct columns of U whose determinant Δ∈Z[T] evaluates nonzero at an affine distinct configuration over k. In particular Δ is nonzero.

At an affine full-row-rank witness select m pivot columns. Form their square determinant in the integer universal matrix before evaluating. The value at the witness is nonzero, so the integer polynomial is nonzero as well. Other choices of m columns need not have nonzero determinants.

**Prerequisites:** [Passing to the dense affine chart](#affine-dense); [Universal first-jet matrix](#universal-jet-matrix); [Full row rank criterion](#jet-rank).

**Source:** [COU, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

<a id="minor-degree"></a>

**Degree of a first-jet minor.** For any m=n(r+1) chosen-column minor Δ of U, totalDegree Δ≤md and degreeOf(T_ij)≤md. The bound remains valid when Δ=0.

Expand a selected determinant into its signed permutation products. Each value entry has total degree at most d and each nonzero derivative entry at most d−1, giving total degree at most md for every term and their sum. Coordinate degree is bounded by total degree, also for the zero polynomial.

**Prerequisites:** [Universal first-jet matrix](#universal-jet-matrix); `MvPolynomial.degreeOf_le_totalDegree` (Mathlib).

**Source:** [COU, §3 pp. 491–492](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

<a id="principal-open"></a>

**Principal-open full-jet locus.** For the chosen minor mapped into k[T], D(Δ)⊂Spec(k[T]) is the native principal open. Its k-points are exactly ordered affine tuples with eval_P Δ≠0; each such tuple is injective and J_{P,d} is onto. The witness makes this open nonempty.

Map the selected integer determinant into k[T]. Use the existing AffineSpace.SpecIso to identify the ordered affine parameter space with Spec k[T]. A tuple gives the native evaluation morphism Spec k→Spec k[T] over Spec k; its image is the evaluation prime kernel and it avoids Δ exactly when its evaluation is nonzero. The selected square submatrix then gives full row rank. Repeated supports would duplicate value rows, so nonvanishing also gives distinctness.

**Prerequisites:** [Nonzero maximal minor](#maximal-minor); [Universal first-jet matrix](#universal-jet-matrix); `PrimeSpectrum.basicOpen` (Mathlib); `PrimeSpectrum.mem_basicOpen` (Mathlib); `AlgebraicGeometry.Spec.map` and `Spec.map_apply` (Mathlib); `AlgebraicGeometry.AffineSpace.SpecIso` (Mathlib); **SchemeAndStackFoundations, SF.0**.

**Source:** [COU, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

<a id="generic-affine"></a>

**Generic affine Hermite interpolation.** For algebraically closed characteristic-zero k, r≥1,d≥5,n≥1 and n(r+1)≤N(r,d), a nonempty Zariski-open locus of ordered distinct n-tuples in (A^r_k)^n has surjective value-and-first-derivative evaluation on the native degree≤d submodule. One nonempty principal open D(Δ) suffices.

Combine the selected-minor witness, its principal-open membership criterion and the matrix representation of firstJetMap. The resulting nonempty principal open lies in the ordered-distinct locus and every tuple there is well poised.

**Prerequisites:** [Principal-open full-jet locus](#principal-open); [Well-poised double points](#well-poised).

**Source:** [COU, §3, p.491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf); [BO, §1, Theorem 1.1, p.1](https://arxiv.org/pdf/math/0701409v2).

### Integer boxes and polynomial parametrizations

<a id="integer-grid"></a>

**Bounded integer specialization.** Under the endpoint hypotheses, with a chosen Δ of degree at most B=n(r+1)d, there is an ordered integer tuple with every coordinate in {0,…,B} and Δ nonzero. Its first jets are surjective after embedding the integers into k.

For each variable take the B+1 integers 0,…,B with B=md. The contrapositive of Mathlib’s product-finset vanishing theorem gives an integer assignment where the nonzero Δ remains nonzero. Injectivity of ℤ→k preserves the determinant, giving distinct supports and surjective first jets.

**Prerequisites:** [Nonzero maximal minor](#maximal-minor); [Degree of a first-jet minor](#minor-degree); `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset` (Mathlib); [Principal-open full-jet locus](#principal-open).

**Source:** [COU, §3 pp. 491–492](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

<a id="parameter-pullback"></a>

**Polynomial parameter pullback.** Let θ=(θ_ij) be an integer-polynomial point parametrization in a finite set of parameters S. If Δ∘θ is nonzero and each parameter degree is at most B_s, there is an integer parameter vector with 0≤u_s≤B_s for which Δ(θ(u))≠0 and θ(u) is a distinct well-poised configuration after embedding into k.

Form Δ∘θ using native algebra substitution. Apply the coordinatewise product-finset theorem to this nonzero pullback with sets 0,…,B_s, then commute substitution with evaluation. Characteristic-zero integer lifting places the resulting tuple in the selected principal open.

**Prerequisites:** [Universal first-jet matrix](#universal-jet-matrix); [Principal-open full-jet locus](#principal-open); `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset` (Mathlib).

**Source:** [COU, §3 p. 492](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

### A boundary test for genericity

<a id="collinear-boundary"></a>

**Special collinear configurations fail.** For P_i=(i,0)∈Q²,0≤i≤6,d=5, the first-jet matrix has rank 11 rather than21. Thus the dimension inequality alone does not imply every distinct tuple is well poised.

The value and x-derivative rows factor through f(x,0), a six-dimensional polynomial space. The y-derivative rows factor through the independent coefficient slice of degree at most four, of dimension five. Ordinary univariate evaluation separates both slices at seven points, proving the exact rank 11.

**Prerequisites:** [Monomial first-jet matrix](#jet-matrix); [Full row rank criterion](#jet-rank).

**Source:** [COU, §3 p. 491 genericity condition; authored counterexample](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

## Interfaces at the endpoint

For a fixed choice of columns, let Δ be the determinant of the corresponding
square submatrix of U. GI.5 exports four compatible facts: evaluation gives
that selected minor of firstJetMatrix; its nonzero locus is a native basic
open; its points are distinct and well poised; and its coordinate degrees
are bounded. The choice of a nonzero minor is existential and depends on the
full-rank witness. The degree estimate applies to every selected minor,
including a zero one. These two quantifiers are kept separate.

The integer-grid theorem can be used before or after a polynomial
parametrization. Before parametrization it supplies independent point
coordinates. After parametrization the caller supplies the nonzero polynomial
Δ∘θ and bounds for its individual parameter degrees. In either case the
integer evaluation is proved nonzero in ℤ, and characteristic zero preserves
it in k. Algebraic closure is used to obtain the generic witness, not to
justify integer determinant lifting.

For projective consumers the restriction comparison must carry its O(d)
trivialization and base-change square. For arithmetic consumers the coordinate
identification is the native monomial coefficient identification, and the real
norm is the transported ℓ² norm. None of the interpolation statements asserts
that an arithmetic parametrization meets the generic locus without its
nonzero-pullback hypothesis.

## Finite witness specifications

The low-degree assertions in GI.3 admit a uniform exact certificate interface.
Choose integer homogeneous support vectors and integer frames for the specified
linear subspaces. Columns are all homogeneous monomials of the prescribed
degree. Double-support rows are the r+1 homogeneous partials. Euler's identity
is used only with nonzero degree in characteristic zero. For a cubic required
to contain a linear subspace, evaluations at sample points on that subspace
are necessary conditions, so full column rank of the resulting matrix suffices
to exclude a containing cubic. It does not assert that those evaluation samples
form a basis for every containing-form ideal. A remainder length-two row pair
consists of its value and derivative in the specified transverse direction.

The following determinant sizes are the exact numerical contracts. Each
witness uses distinct projective supports, and subspace witnesses retain the
listed incidence and general-position requirements. A nonzero determinant
modulo 101 lifts to every characteristic-zero field. The passage from one
witness to general configurations uses the appropriate irreducible incidence
parameter and the rank-open theorem of GI.2.

| Degree and configuration | Required rank |
| --- | ---: |
| Cubic, three codimension-three spaces, r=5,6,7 | 56,84,120 |
| Cubic, two codimension-three spaces, r=5,7 | 56,120 |
| Cubic, one codimension-three space, r=5,7 | 56,120 |
| Cubic, (r,q)=(2,3),(2,4),(3,5),(4,6),(4,8),(7,15) | 9,10,20,30,35,120 |
| Quartic, (r,q)=(2,4),(2,6),(3,8),(3,10),(4,13),(4,15) | 12,15,32,35,65,70 |
| Sextic in P², q=9,10 | 27,28 |
| Quartic in P⁵, q=21 | 126 |

These finite determinants discharge only the specified bases. Their algebraic
lifting, Euler comparison and generic openness are mathematical statements to
prove, as are the unbounded cubic recursion and Horace induction. Exact
arithmetic for selected small dimensions does not replace the symbolic
exception scheduler.
