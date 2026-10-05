# FF.3 — Factorization, point counting, and polynomial censuses

This layer supplies certified polynomial factorization over finite fields, Hensel lifting, certified elliptic point counting, and the polynomial censuses used by arithmetic statistics. Its factorization and counting services build on the field presentations of FF.0, the arithmetic completion services of CA.3, and the operation and execution model of CN.0. Character-sum estimates use the precise results of FF.2; the factorization algorithms themselves require no Weil or Deligne theorem.

The [parent blueprint](../packets/FiniteFieldsAndCharacterSums.json) owns the factorization algorithms, their certificates, Hensel lifting, Schoof's algorithm, and the prime-polynomial theorems. The parent [reader](FiniteFieldsAndCharacterSums.md) gives their full statements and APIs. This document specifies the additional squarefree census and the degree-zero coefficient fiber and explains the interfaces used by the layer. Every identifier below starts with `FiniteFieldsAndCharacterSums:`; the abbreviated prefix `FF.3/` refers to this layer. The [supplement packet](../packets/FiniteFieldsAndCharacterSums--FF.3.json) and [suggested file](../suggested/FiniteFieldsAndCharacterSums--FF.3.lean) specify eight new declarations. Existing declarations retain their parent identifiers.

## Conventions and starting objects

Let F be a finite field, q its cardinality, and n and g natural numbers. Use Mathlib's polynomial ring F[X], monicity, natural degree, normalization, separability and `Squarefree`. A polynomial is squarefree when no square of a nonunit divides it. This includes the unit polynomial 1. The zero polynomial is not squarefree over a field and never belongs to a monic census. A derivative test is a consequence over perfect fields, not the definition of the census.

The monic degree-n census is supplied by `FF.2/monic-polynomials-of-degree`. Its carrier `monicOfDegree F n` is the image of the n lower coefficients under the map

\[
(c_0,\ldots,c_{n-1})\longmapsto X^n+\sum_{i<n}c_iX^i.
\]

It has exactly qⁿ elements and contains precisely the monic polynomials of natural degree n. At n=0 it is the singleton {1}. The placement of this elementary carrier in FF.2 does not make it depend on FF.2's cohomological or analytic targets. Algorithm consumers import this declaration directly. A structural assembly should expose the elementary census with FF.0 rather than restore an edge from the whole of FF.2 to every algorithm.

At the pinned Mathlib baseline, `Polynomial.degreeLTEquiv` provides the coefficient-vector equivalence needed to construct this carrier. `exists_sq_mul_squarefree` already gives a square times a squarefree element in a unique factorization monoid. Normalized-factor multiplication, powering, reconstruction, and the squarefree/no-repeated-factor equivalence provide its canonical polynomial refinement. We plan the monic uniqueness and degree-indexed counting results, rather than another generic existence theorem. `Polynomial.monic_normalize` and `Polynomial.eq_of_monic_of_associated` remove ambiguity from units; monic product and power degree formulas track the finite indexing. `PerfectField.separable_iff_squarefree` supplies compatibility with separability for finite fields. None of these baseline facts is a new roadmap node.

## Monic squarefree polynomials

**Carrier — `FF.3/monic-squarefree-polynomial-set`.** Define `monicSquarefreeOfDegree F n` by filtering `monicOfDegree F n` with `Squarefree`. Write sₙ for its cardinality. Use a classical decidability instance for the specification; executable polynomial operations and their refinement to Mathlib objects are supplied by CN.0. The mathematical specification does not assert that filtering a noncomputable census is already an executable certified algorithm.

The API is:

- `mem_monicSquarefreeOfDegree`: membership is equivalent to monicity, natural degree n, and squarefreeness.
- `monicSquarefreeOfDegree_subset`: forgetting squarefreeness embeds this finite set into the monic degree-n census.
- `mem_monicSquarefreeOfDegree_iff_separable`: membership is equivalently monicity, degree n, and separability over the finite field. This is the comparison with the existing library notion.
- `monicSquarefreeOfDegree_zero`: the degree-zero set is {1}.
- `monicSquarefreeOfDegree_one`: every monic linear polynomial is squarefree, so the degree-one set equals the full monic census.

The tests fix conventions as well as cardinalities. `monicSquarefree_degree_zero` includes 1. `monicSquarefree_quadratics_f2` requires the degree-two set over F₂ to be {X²+X, X²+X+1}; the first splits into distinct linear factors and the second is irreducible. `monicSquarefree_repeated_root_f2` excludes X²+1=(X+1)², whose derivative vanishes in characteristic two. `monicSquarefree_separable` compares membership with Mathlib separability for a monic input of the specified degree. A definition that counts only irreducibles, or excludes all units, fails these tests.

**Normalized decomposition — `FF.3/unique-monic-squarefree-square-decomposition`.** Every monic f has a unique pair of monic polynomials (h,m) satisfying

\[
\operatorname{Squarefree}(h),\qquad f=h m^2,
\qquad \operatorname{natDegree}(f)=\operatorname{natDegree}(h)+2\operatorname{natDegree}(m).
\]

The proposed name is `existsUnique_monic_squarefree_square`. Use the parent `FF.3/square-free-decomposition` and the pinned UFD factor API. For each normalized monic irreducible factor with multiplicity e, put it once in h when e is odd and put it in m with multiplicity ⌊e/2⌋. Reconstruction gives f=h m². The factors of h occur at most once, so h is squarefree. Any competing pair has the same parity and half-multiplicity at every irreducible factor. Monicity turns associated factors into equal polynomials, proving uniqueness. The baseline monic degree formulas yield the displayed degree equation.

This decomposition differs from the parent grouped squarefree factorization f=∏ᵢaᵢⁱ: here the desired output is one squarefree factor and one square factor, suited to a census. It also differs from a coprime factorization. For f=X³ the unique pair is (X,X); demanding that h and m be coprime would make the theorem false. Boundary examples are f=1 with pair (1,1), X²(X+1) over F₂ with pair (X+1,X), and (X+1)⁴ with pair (1,(X+1)²). For a nonzero nonmonic input, first normalize f and then put its leading coefficient back into h. This yields the squarefree-times-monic-square factorization used in the source without introducing a second generic factorization theorem.

**Finite degree decomposition — `FF.3/squarefree-square-degree-equivalence`.** Construct `squarefreeSquareEquiv F n` as the equivalence

\[
\coprod_{0\leq j\leq\lfloor n/2\rfloor}
 \{h\in\mathrm{monicSquarefreeOfDegree}(F,n-2j)\}
 \times\{m\in\mathrm{monicOfDegree}(F,j)\}
\;\simeq\;\{f\in\mathrm{monicOfDegree}(F,n)\}.
\]

The braces here mean subtypes of finite sets. The forward map sends (j,h,m) to h m². For the inverse, take the unique pair above and set j=deg m. The degree equation implies 2j≤n, so the natural-number subtraction n−2j gives the exact squarefree degree. Uniqueness proves both inverse laws. In the suggested signature the index is a member of the finite type with ⌊n/2⌋+1 elements, rather than an unbounded integer whose validity must be inferred.

Its API is `squarefreeSquareEquiv_apply` for the forward polynomial; `squarefreeSquareEquiv_symm_degree` for j=deg m; `squarefreeSquareEquiv_symm_squarefree` for squarefreeness and degree of h; and `squarefreeSquareEquiv_symm_eq` characterizing the inverse by f=h m² when the factors have the indicated membership proofs. The equivalence itself includes the two inverse laws, so contributors need no independent assertion of surjectivity.

The three tests are `squarefreeSquareEquiv_zero`, sending (0,1,1) to 1; `squarefreeSquareEquiv_repeated_linear_f2`, sending (1,1,X+1) to X²+1 at degree two; and `squarefreeSquareEquiv_shared_factor`, sending (1,X,X) to X³ at degree three. At n=2 over F₂, the index j=0 contributes the two squarefree quadratics and j=1 contributes the squares X² and X²+1. All four monic quadratics appear once. These tests prevent a target containing only squarefree inputs or an inverse imposing a false coprimality condition.

**Convolution — `FF.3/monic-squarefree-convolution`.** Taking finite cardinalities of the equivalence gives `card_monic_eq_sum_squarefree`:

\[
q^n=\sum_{j=0}^{\lfloor n/2\rfloor}s_{n-2j}q^j.
\]

The factor qʲ is the parent's monic degree-j count. This identity includes n=0 and n=1. At n=2 over F₂ it says 4=2+2. It is the finite coefficient form of the formal generating-function identity

\[
\sum_{n\geq0}q^nt^n
 =\left(\sum_{n\geq0}s_nt^n\right)
  \left(\sum_{j\geq0}q^jt^{2j}\right).
\]

The proof needs only the finite convolution; no analytic convergence or additional power-series construction is a prerequisite. The generating-function identity explains the source recurrence, while the finite equivalence supplies an exact dependency route for its coefficients.

**Closed count — `FF.3/monic-squarefree-count-formula`.** Prove `card_monicSquarefreeOfDegree` with the full boundary convention

\[
s_0=1,\qquad s_1=q,\qquad s_n=q^n-q^{n-1}\quad(n\geq2).
\]

For n≥2, separate j=0 in the convolution. Reindex the remaining terms by j=k+1; their sum is q times the convolution for n−2, hence q·qⁿ⁻²=qⁿ⁻¹. Thus qⁿ=sₙ+qⁿ⁻¹. The formula follows in natural numbers; q≥2 ensures the expected nonnegative difference. The degree-one exception cannot be replaced by the general expression, which would give q−1. Over F₂ the counts in degrees zero through five are 1,2,2,4,8,16; over F₃ in degrees zero through four they are 1,3,6,18,54. This argument works in every characteristic.

## The degree-pair presentation space

**Carrier — `FF.3/hyperelliptic-presentation-polynomial-set`.** Define `hyperellipticPolynomials F g`, denoted P_g, as the squarefree polynomials whose degree is either 2g+1 or 2g+2. Monicity is not required. Construct the finite set as the image of

\[
F^\times\times
 \bigl(\mathrm{monicSquarefreeOfDegree}(F,2g+1)
 \cup\mathrm{monicSquarefreeOfDegree}(F,2g+2)\bigr)
 \longrightarrow F[X],\qquad(a,h)\longmapsto C(a)h.
\]

Different degrees make the union disjoint. Since every degree here is positive, each input and output is nonzero. Recover a as the leading coefficient and h as the normalized polynomial. This proves uniqueness of the scalar/monic representation and injectivity of the displayed map. Scaling by a nonzero constant preserves squarefreeness because constants are units; it also preserves degree.

The name follows Bergström–Faber–Payne's §5 presentation, but the object is a finite polynomial set in every characteristic. The interpretation through y²=f and binary forms in that source assumes odd q and genus at least two for the moduli stack. The polynomial set and its g=0 and g=1 counting cases are meaningful without these geometric restrictions. P_g does not count curve isomorphism classes and does not apply an automorphism weighting. The ArithmeticStatistics consumer owns those subsequent operations.

Its API is:

- `mem_hyperellipticPolynomials`: membership iff squarefreeness and **either** allowed degree. Parenthesize the degree disjunction inside the conjunction with squarefreeness.
- `hyperellipticPolynomials_leadingCoeff_ne_zero`: membership implies nonzero leading coefficient.
- `hyperellipticPolynomials_normalize`: the normalized polynomial belongs to the monic degree-pair union, and f=C(leadingCoeff f)·normalize f.
- `hyperellipticPolynomials_scalar_iff`: for a≠0, C(a)f belongs to P_g iff f does. The identity and multiplication laws are those of the existing constant-polynomial multiplication, with no new scalar-action structure.
- `hyperellipticPolynomials_map`: a field isomorphism transports P_g coefficientwise onto the corresponding set over the target field. Injectivity follows from the isomorphism; identity and composition are the existing polynomial-map laws.

The unit tests are `hyperellipticPolynomials_f2_zero`, requiring P₀(F₂)={X,X+1,X²+X,X²+X+1}; `hyperellipticPolynomials_nonmonic_f3`, including 2X in P₀(F₃); `hyperellipticPolynomials_square_excluded`, excluding X² over F₃ despite its permitted degree; and `hyperellipticPolynomials_zero_excluded`, excluding zero for every g. The F₃ test distinguishes the intended set from a monic-only census. The repeated-factor test distinguishes it from all polynomials of the right degrees.

**Count — `FF.3/hyperelliptic-presentation-count`.** Prove `card_hyperellipticPolynomials` in two steps:

\[
\#P_g=(q-1)(s_{2g+1}+s_{2g+2}),
\]

\[
\#P_0=q^2(q-1),\qquad
\#P_g=(q-1)(q^{2g+2}-q^{2g})\quad(g\geq1).
\]

The first equality follows from the injective scalar/monic representation and #F×=q−1. At g=0 insert s₁=q and s₂=q²−q. For g≥1 both degrees are at least two, and the intermediate q²ᵍ⁺¹ terms cancel when adding their squarefree counts. The proposed theorem exports the scalar formula as well as the closed expression so consumers can see where the normalization factor occurs.

Concrete checks are #P₀(F₃)=18, #P₁(F₃)=144 and #P₁(F₂)=12. Substituting g=0 into the g≥1 expression incorrectly gives 16 over F₃. Restricting to monic polynomials incorrectly gives 9 at q=3,g=0. Omitting one of the two degrees also changes the count. These provide independent checks of the exceptional case, the scaling factor, and the degree-pair convention.

## Prime-polynomial and constant-coefficient interfaces

Bary-Soroker–Koukoulopoulos–Kozma's Proposition 8.1, printed p. 39, uses the count π_p(k) of monic irreducible degree-k polynomials over F_p. Its routed item `/73` is supplied by the parent's `FF.3/prime-polynomial-theorem` and `FF.3/irreducible-count-upper-bound`. For n≥1 the parent exports

\[
\frac{q^n-2q^{n/2}}{n}\leq\Pi_F(n)\leq\frac{q^n}{n},
\qquad\frac{\Pi_F(n)}{q^n}\leq\frac1n,
\]

with real exponent n/2. The latter is precisely the reciprocal-norm sum over degree-n irreducibles, since every such irreducible has norm qⁿ. The intermediate exact suppliers are `FF.3/gauss-count-formula` and `FF.3/moebius-formula-for-irreducible-count`. Gauss's identity is ∑_{d∣n}dΠ_F(d)=qⁿ for positive n; Möbius inversion gives the exact degree count. The asymptotic and inequality are not a new declaration here. At degree zero there are no irreducible monic constants; at degree one there are q monic irreducibles. The reciprocal expression is used only at positive degree, despite the parent's multiplication-form upper bound also being meaningful at zero.

For item `/130`, the proof of BKK Lemma 3.2 on p. 20 uses irreducibles with prescribed **nonzero** constant coefficient. The parent `FF.3/irreducible-count-with-constant-coefficient` supplies the carrier and exact boundary APIs. The theorem `FF.3/irreducible-polynomials-with-prescribed-constant-coefficient` exports, for n≥1 and b≠0,

\[
\left|\frac{n(q-1)\Pi_F(n;b)}{q^n}-1\right|
 \leq3q^{1-n/2}.
\]

Thus the asymptotic in the paper has an explicit absolute constant. Its proof uses the norm map on the degree-n extension, the norm fiber size (qⁿ−1)/(q−1), and the lower-degree elements excluded by Möbius inversion. Constant coefficients relate to norms by the sign (−1)ⁿ. Reuse that parent's proof route rather than create another Rosen-theorem node. Degree one has exactly one monic irreducible with each specified constant b, including b=0. At b=0 and degree n≥2 the count is zero, since X divides the polynomial. These exact APIs are distinct from the nonzero-constant asymptotic.

**Auxiliary coefficient fiber — `FF.3/monic-prescribed-constant-count-boundary`.** BKK's same proof also counts all monic degree-m polynomials with a fixed constant coefficient. This is a different object from the irreducible count. The proposed theorem `card_monic_prescribed_constant` states

\[
\#\{f\in\mathrm{monicOfDegree}(F,n):f(0)=b\}
 =\begin{cases}
 1&n=0,\ b=1,\\
 0&n=0,\ b\ne1,\\
 q^{n-1}&n\geq1.
 \end{cases}
\]

For n≥1 fix the first lower coefficient and let the remaining n−1 coefficients vary. At n=0 use the monic census {1}. In the paper's sum the auxiliary degree m includes zero, so the indicator at b=1 must replace the printed positive-degree expression there. This exception is already recorded as the parent source issue E734 and the paper extraction's E6; this supplement gives its explicit reusable theorem and does not claim to discover another error. Acceptance examples over F₃ are the three degree-zero fibers 0,1,0 at b=0,1,2; one element in every degree-one fiber; and three in every degree-two fiber.

## Certified services and their owners

All following IDs remain in the parent packet. Their statements and interfaces are imports, not another algorithm plan:

| Target | Parent provider and contract |
| --- | --- |
| Squarefree and distinct-degree stages | `FF.3/square-free-decomposition` and its algorithm correctness/cost nodes; `FF.3/distinct-degree-factorization-algorithm-correct` groups irreducibles by exact degree. These algorithms use FF.0's finite-field and Frobenius census. |
| Equal-degree splitting and full factorization | `FF.3/cantor-zassenhaus-correct` and `FF.3/berlekamp-algorithm-correct`, with their parent output, randomness, termination, and cost contracts. Factorization returns monic irreducible factors and multiplicities with exact product and completeness. |
| Checked output | `FF.3/factorization-certificate-sound` and `FF.3/factorization-certificate-complete`; checking proves the stated factorization, and every valid factorization admits the specified certificate. |
| Hensel factor lifting | `FF.3/hensel-lifting-of-factorizations`, `FF.3/hensel-lifting-over-complete-rings`, and `FF.3/hensel-lifting-modulo-prime-powers`; lift the coprime modular factors under the exact parent completeness and congruence hypotheses. The complete-ring input comes from CA.3. |
| Elliptic counting | `FF.3/schoof-algorithm-correct` and `FF.3/schoof-algorithm-cost`; exact count recovered from Frobenius trace residues and the Hasse interval under the parent's curve, characteristic and prime-selection hypotheses. |
| Point-count certificates | `FF.3/point-count-certificate-sound` and `FF.3/point-count-certificate-complete`; the parent's root-table checker handles odd q and Weierstrass models with a₁=a₃=0, counting the point at infinity in addition to affine solutions. |
| Elliptic and affine error bounds | `FF.3/hasse-error-bound-for-point-counts` imports the elliptic Hasse bound from Tau Ceti's EllipticCurves Layer 3; `FF.3/weil-error-bound-for-hyperelliptic-counts` uses the precise FF.2 character bound for squarefree f in odd characteristic. |

The operation model is an explicit CN.0 request: field operations and equality tests have unit algebraic cost, random draws have the specified uniform law, randomized loops have a termination and expected-cost statement, and dense polynomial and linear-algebra operations have their cited costs. The model must translate costs to bit operations on the standard FF.0 field presentations. A second CN.0 request supplies coefficient-list refinements of the Mathlib operations, including division, gcd and modular powering. A bare mathematical function on `Polynomial F` is not itself a demonstrated executable implementation.

CN.5 supplies the reusable finite-verification and theorem-instantiation discipline: certify a decidable predicate over an explicit finite set, with verification cost, by an evaluated proof or checked certificate. FF.3 owns the checker semantics and mathematical soundness; CN.0 owns executable refinement; CN.5 owns the reusable recording discipline. The polynomial-count tests in the suggested file specify expected statements; they are not certificates of executed Lean computations.

ComputationalNumberTheory CN.1 consumes these finite-field factorization outputs and checked-factor contracts. It must not retain a second owner of Shoup Chapter 20. FunctionFieldArithmetic FA.7 imports factorization and point-count certificates and owns the assembly of its L-polynomial from extension counts and the functional-equation check. In particular a list of counts over the first g extensions is an input to FA.7's assembly, not a new point-counting algorithm in that layer.

## General point-count bounds and comparison requirements

For a smooth projective geometrically connected curve C/F_q of genus g and every r≥1, the supplier is WeilConjectures WC.5:

\[
\left|\#C(F_{q^r})-(q^r+1)\right|\leq2gq^{r/2}.
\]

For a smooth projective geometrically connected variety of dimension d>0 the contract is

\[
\left|N_r-(1+q^{dr})\right|
 \leq\sum_{i=1}^{2d-1}b_iq^{ir/2},
\]

where the b_i are the geometric Betti numbers and N_r is the actual rational-point count. The zero-dimensional case requires its separate supplier statement. The export must identify the cohomological trace count with the rational-point set and fix geometric Frobenius conventions. The packet makes this a precise WC.5 request, rather than applying an elliptic bound to an arbitrary model.

The root-table and Schoof certificates above are not general-variety certificates. A general smooth projective model needs a concrete computable representation of its rational points, inclusion of points at infinity, and a cardinality comparison with the N_r in WC.5. The packet records this comparison requirement as a gap with the exact supplier contract. The general error-bound target therefore has an explicit route, but a general certificate representation is not asserted to exist. The affine bound |#\{(x,y):y²=f(x)\}−q|≤(deg f−1)√q is a different target: its main term lacks the projective model's points at infinity, and it cannot silently replace the all-extension projective theorem.

## Sources and atlas structure

The squarefree counts follow [Bergström–Faber–Payne, arXiv:2206.07759v2](https://arxiv.org/pdf/2206.07759v2), §5, printed pp. 7–8, with the finite degree decomposition made explicit. The prime and fixed-constant uses are [Bary-Soroker–Koukoulopoulos–Kozma, arXiv:2007.14567v3](https://arxiv.org/pdf/2007.14567v3), Proposition 8.1 on p. 39 and the proof of Lemma 3.2 on pp. 19–20. The packet records version-specific PDF hashes and the passages read. Shoup Chapters 19–20 remain the parent's factorization and finite-field enumeration route. Schoof and Sutherland remain its elliptic algorithm routes, while its complete-ring and modular Hensel sources remain distinct from Shoup's square-root example. Deligne supplies the FF.2 estimate route through its owning roadmap, not a replacement citation for these algorithms.

Retain the six existing FF.3 planets: Gauss's product formula, Prime polynomial theorem, Cantor–Zassenhaus algorithm, Berlekamp's algorithm, Hensel lifting of factorizations, and Schoof's algorithm. The squarefree census adds declarations to their layer without exceeding its six-planet limit.

The structural proposal gives factorization, irreducibility certificates and Hensel lifting direct inputs FF.0 and CA.3; only character-based point bounds retain their precise FF.2 input. Elliptic bounds import EllipticCurves Layer 3, and general point bounds import WC.5. FF.4's arithmetic objects take FF.0/FF.1 directly and use FF.2 only for consequences of Weil bounds; FF.5 packages the exact supplying layers. These are integration instructions for the authorized structure jobs, which also recompute depths. They do not change the eight declaration targets or give a second roadmap ownership of factorization.
