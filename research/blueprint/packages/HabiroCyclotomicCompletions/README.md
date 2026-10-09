# Cyclotomic completions and classical Habiro rings

The classical Habiro ring packages compatible polynomial congruences into an
object that can be evaluated at every root of unity. Over the integers it
behaves like a ring of functions whose Taylor expansion at one root determines
the whole function. Its topology allows factorial series that have no meaning
as ordinary power series at zero. Its integral Taylor image is constrained by
explicit congruences, and those constraints disappear over rational
coefficients. These features make the ring useful in quantum topology,
arithmetic q-series, and the study of cyclotomic and Habiro cohomology.

This roadmap builds a reusable theory of the classical completions
\(R[q]^S\), for a commutative unital coefficient ring \(R\) and a set \(S\) of
positive root orders. The central outputs are their topology and universal
property; normalized factorial expansions and finite arithmetic; evaluation,
Taylor maps and p-adic re-expansion; rigidity under precise separation
hypotheses; the integral Taylor image; and the behavior of modules and
localized coefficient rings. The reference examples are part of the interface:
they distinguish an actual completion from an incorrectly chosen power-series
ring, tensor product, or localization.

`README.md` specifies the mathematics. [Suggested.lean](Suggested.lean) suggests
declarations, instances, and examples with placeholder proofs; it does not
assert that this mathematics has been implemented. The main namespace is
`TauCeti.Habiro`, with `TauCeti.Habiro.HC4` for the universal Taylor comparison.
Naming can follow the surrounding library, while the hypotheses, coordinate
conventions, and compatibility requirements below determine the interface.

## Scope and connections

The construction here is the ordinary cyclotomic completion. The arithmetic
Habiro ring of a number field has Frobenius conditions on its Taylor
collections; that ring and the comparison for the rational number field belong
to **HabiroNumberFields:HB.6**. In particular, a classical ring with coefficient
ring \(\mathbb Q\) is not the arithmetic ring attached to the number field
\(\mathbb Q\). The classical coefficient-change map and the components over
\(\mathbb Z[1/\Delta]\) constructed here are inputs to that comparison.

The elementary q-analogue library belongs to **HC.1**: q-integers,
q-factorials, Gaussian and multinomial polynomials, finite and infinite
Pochhammer symbols, their q-binomial and Euler identities, Jackson derivatives,
and the elementary plethystic substitution operation.
**QSeriesPartitionsAndMockModularForms:QM.0**, arithmetic q-series consumers,
and quantum-topology consumers import this toolkit. General lambda-ring theory
belongs to **QWittVectors:QW.1**. The toolkit's infinite products use
explicit coefficient topologies; they are distinct from HC.2's convergent
factorial sums in the cyclotomic completion.

General derived Habiro completion belongs to
**HabiroRings:HR.2**, which supplies the derived object used in the ordinary
versus derived comparison of HC.5. The exact ordinary functor on polynomial
modules is constructed here.

The consumers of the resulting library are:

| Consumer | Interface supplied here |
| --- | --- |
| HabiroRings:HR.2, HR.3, HR.5 and its number-field comparison | Completion systems, factorial expansions, polynomial-module exactness, cyclotomic comaximality, Taylor maps and rigidity |
| HabiroNumberFields:HB.6 and KU-habiroring | Coefficient change, classical evaluations, Taylor re-expansion, and the components after inverting primes |
| ArithmeticQuantumTopology:QT.2–QT.6 | Integral Habiro ring, factorial arithmetic, root values, single-root Taylor injectivity, and explicit examples |
| QSeriesPartitionsAndMockModularForms:QM.0 | HC.1 elementary q-calculus, Gaussian polynomials, Pochhammer identities, and the coefficientwise plethystic operation |
| QSeriesPartitionsAndMockModularForms:QM.5 | Cyclotomic convergence, root evaluation, Taylor coefficients, and evaluation uniqueness under the adjacency condition |
| HabiroNahmSeries:HB.4, HB.8 | Factorial convergence, normalized digits, and multiplication at finite precision |
| HabiroCohomologyFoundations:HQ.1 | Ordinary completion and its compatible Taylor maps |
| QWittVectors:QW.2 | Cyclotomic congruences, comaximality, and order adjacency |
| AnalyticHabiroStack:HS.0–HS.2 | The complete topological rings and their expansion coordinates |

No consumer may replace the infinite-adjacency condition of HC.4 by an
arbitrary infinite set or a phrase such as “a set with a limit point.” That
would require Habiro's Conjecture 6.1, which remains a conjecture in this
roadmap. Likewise, the conjectural description of the integral unit group is
not a theorem exported here. The actual theorem on the unit \(q\) is included.

## Conventions and library inputs

All rings are commutative and unital. A zero ring is allowed in the
constructions; statements about degrees, nonunits, domains, or positive ranks
explicitly require the appropriate nontriviality hypothesis. An order is
positive. With `S : Set ℕ`, ignore order zero: Mathlib's
`Polynomial.cyclotomic 0 R` is one, so including zero does not alter a
completion. Empty positive order sets give the zero ring, because the
indexing monoid then contains only the polynomial one.

Write \(\Phi_n\) for the image in \(R[q]\) of the integral cyclotomic
polynomial. Let \(\Phi_S^*\) be the submonoid of **actual polynomials** generated
by \(\Phi_n\), \(n\in S\). Two exponent lists which produce the same polynomial
are the same index. In characteristic two, \(\Phi_1=\Phi_2\); a free monoid of
labels would therefore be an unsuitable replacement. Transition maps of the
completion run from reduction modulo \(g\) to reduction modulo \(f\) when
\(f\mid g\).

The factorial convention is

\[
 P_N(q)=\prod_{i=1}^N(1-q^i),\qquad P_0=1.
\]

Its leading coefficient is \((-1)^N\); its monic associate, rather than
\(P_N\) itself, is used with APIs that demand a monic divisor. Normalized
digits in HC.2 start at zero:
\(h=\sum_{n\geq0}a_n(q)P_n(q)\), \(\deg a_n\leq n\). In HC.4's comparison
notation digits start at one, so its \(n\)-th block is the HC.2 block \(n-1\).
Comparison precision \(N\geq1\) means reduction modulo \(P_{N-1}\) and keeps
the blocks \(1\leq n<N\). This shift also fixes all determinant indices.

The ordinary root coordinate is \(X=q-\zeta\). Universal multiplicative Taylor
coordinates use \(q=z_m(1-u)\), where \(z_m\) is the universal root in
\(A_m(R)=R[q]/(\Phi_m)\). The coefficient indexed by \((m,l)\) is the
coefficient of \(u^{l-1}\), and its weight is \(ml\). Changing to an embedded
root algebra is a separate map, not an implicit identification for arbitrary
coefficients.

“Complete” always includes separatedness. The inverse-limit topology has
discrete finite quotients and the additive-group uniformity. For an ideal
\(I\subset R\), adic separation means
\(\bigcap_{k\geq0}I^k=0\), expressed by Mathlib's `IsHausdorff I R`; no
Noetherian hypothesis is built into that definition. Re-expansion at a
topologically nilpotent constant uses convergent power-series evaluation.
Algebraic substitution with a nonzero constant requires actual nilpotence and
does not provide the required p-adic operation.

The baseline interfaces are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Reuse the following library
material instead of introducing a parallel vocabulary:

| Input | Use in this roadmap |
| --- | --- |
| Mathlib polynomial cyclotomic modules | Monicity, base change, the factorization of \(q^N-1\), prime-power reductions, and values at one |
| Mathlib polynomial division and quotient operations | Canonical representatives modulo a monic polynomial, free finite quotient modules, ideal quotients, and Chinese remainder maps |
| `Polynomial.hasseDeriv` and `Polynomial.factorial_smul_hasseDeriv` | The coefficient formula \(D_k(\sum a_iq^i)=\sum\binom ik a_iq^{i-k}\), and \(k!D_k=\partial_q^k\) without dividing by \(k!\) |
| Mathlib polynomial Taylor and power-series modules | Polynomial translation, coefficient extensionality, power-series topology, and continuous evaluation through `PowerSeries.eval₂Hom` |
| Mathlib `AdicCompletion`, `IsAdicComplete`, `IsHausdorff` | Finite-order completions, separated coefficient embeddings, and completion at finitely generated witnessing ideals |
| Mathlib polynomial modules, exactness and tensor products | Polynomial modules \(M[q]\), monic finite quotients, finite presentation, and ordinary module completion |
| Mathlib roots of unity, fraction fields, finite modules and bases | Primitive-root arguments and the finite-domain separation transfer |
| Mathlib resultants and integral matrices | Cyclotomic resultants, simultaneous remainder determinants, and adjugate image congruences |
| Tau Ceti `TopCommRingCat.IsCompleteSeparated` and `CompleteSeparatedTopCommRingCat` | Complete separated topological rings as existing categorical objects; products and closed compatible-family subobjects |
| Tau Ceti polynomial coefficient-list and synthetic-division API | Descending coefficient lists, `ofCoeffList`, `divModByMonicList`, and their polynomial correctness theorems for executable factorial digits |

For the last row, the existing `TauCeti.Polynomial.ofCoeffList` is the Horner
fold \(p\mapsto pq+a\). The existing synthetic division divides by
\(q^{\operatorname{length}(t)}+\operatorname{ofCoeffList}(t)\). The new digit
algorithm consumes that operation with divisor \(q^{n+1}-1\) and negates the
quotient for the next residual polynomial. It does not redevelop list
polynomials or synthetic division. In suggested statements the Horner fold
can spell the correctness equation directly without a private replacement
for the existing API.

The general completion and category inputs belong to the existing Tau Ceti
topological-ring theory. The new work below is the particular cyclotomic
system and its mathematics. Sources are abbreviated H, H₀, G, A, W and O, with
versioned links in the bibliography. H uses printed journal pages; G and W
use their printed preprint pages. H₀ is cited separately because its numbering
and some proof details differ from H.

## HC.1 — Completion systems and factorial ideals

### Elementary q-calculus and its consumers

HC.1 supplies the elementary toolkit used by q-series and quantum-topology
roadmaps. All finite expressions are integral polynomials before any division
is introduced. Put

\[
 [n]_q=\sum_{i=0}^{n-1}q^i,\qquad [n]_q!=\prod_{i=1}^n[i]_q,
 \qquad (x;q)_n=\prod_{i=0}^{n-1}(1-xq^i).
\]

Define the Gaussian polynomial \({n\brack k}_q\) by zero outside
\(0\leq k\leq n\), \({0\brack0}_q=1\), and the integral recursion
\({n+1\brack k+1}_q=q^{k+1}{n\brack k+1}_q+{n\brack k}_q\).
For a list \((n_1,\ldots,n_r)\) define the multinomial by successively
choosing \(n_1\) from the total, then \(n_2\) from the remainder, and so
on; its empty value is one. The API includes polynomiality, symmetry of
binomials, permutation invariance of multinomials, both Pascal recursions,
coefficient change, and specialization at \(q=1\). In particular prove

\[
 (1-q)[n]_q=1-q^n,\quad
 (1-q)^n[n]_q!=(q;q)_n,\quad
 {n\brack k}_q[k]_q![n-k]_q!=[n]_q!\quad(k\leq n).
\]

These are polynomial identities, so they remain valid in positive
characteristic and at roots of unity. Quotient formulas are corollaries only
when the denominators are units. Prove the analogous multinomial factorial
identity and its specialization to the ordinary integer multinomial.
For finite Pochhammer products give the empty value, concatenation and shift
laws, base change, and, for a unit \(q\), the inverse-parameter formula

\[
 (q^{-1};q^{-1})_n=(-1)^nq^{-n(n+1)/2}(q;q)_n.
\]

Comparing coefficients of the finite product proves the finite q-binomial
theorem
\(\prod_{i=0}^{n-1}(1+tq^i)=
\sum_{k=0}^n q^{k(k-1)/2}{n\brack k}_q t^k\).
The factorial polynomials below are the specialization \(P_N=(q;q)_N\).
**Source and derivation:** O, Definition 1.1, p. 2, Table 1 and Proposition
2.1, p. 7; the displayed finite coefficient identities follow directly by
splitting the last factor of that product and induction.
**Prerequisites:** Mathlib finite sums and products, polynomial coefficients,
ordinary binomial coefficients, and HC.1's integral recursions.

Define the Jackson derivative coefficientwise on \(A[t]\):
\(D_q(t^n)=[n]_q t^{n-1}\), and the adapted derivative
\(D'_q=(1-q)D_q\), so \(D'_q(t^n)=(1-q^n)t^{n-1}\).
Both exist over any commutative ring and extend by the same coefficient rule
to \(A[[t]]\). They are additive and A-linear, commute with coefficient
maps, and satisfy the twisted Leibniz rule
\(D_q(fg)=D_q(f)g+f(qt)D_q(g)\).
At \(q=1\) the first is the ordinary derivative and the second is zero.
No division by \(t\) or \(1-q\) is part of their definition. When all
positive \([n]_q\) are units, the initial-value problem
\(D_qf=f\), \(f(0)=1\), has the unique solution
\(\sum_{n\geq0}t^n/[n]_q!\).
The adapted problem has the analogous solution
\(\sum_{n\geq0}t^n/(q;q)_n\) when those factors are units.
**Source:** O, Table 1 and Proposition 2.1, p. 7, Proposition 2.2, p. 8.
**Prerequisites:** the q-integer API and Mathlib power-series coefficient
extensionality and derivative. Define the operators on the existing
polynomial and power-series carriers.

For a field K and \(q\in K\) with \(q^n\ne1\) for every \(n>0\),
construct the formal coefficient series

\[
 E_q(t)=\sum_{n\geq0}\frac{(-1)^nq^{n(n-1)/2}}{(q;q)_n}t^n,
 \qquad U_q(t)=\sum_{n\geq0}\frac{t^n}{(q;q)_n}.
\]

The API states \(E_q(t)=(1-t)E_q(qt)\), \(E_qU_q=1\), and the general
q-binomial identity
\(E_q(at)U_q(t)=\sum_{n\geq0}(a;q)_nt^n/(q;q)_n\).
For a Q-algebra field the logarithm is

\[
 \log E_q(t)=-\sum_{\ell\geq1}\frac{t^\ell}{\ell(1-q^\ell)}.
\]

Thus \((t;q)_\infty\) denotes this coefficient series over Q(q).
It is not the t-adic limit of its finite products there: the coefficient of
\(t\) in the finite product is \(-\sum_{i<N}q^i\), which does not
stabilize. For the integral product use \(\mathbb Z[[q]][[t]]\), with
coefficientwise q-adic convergence. For each coefficient \(q^mt^k\),
products with \(N>m\) stabilize; use those stable coefficients as the
construction. Mapping into \(\mathbb Q((q))[[t]]\) identifies it with
\(E_q\). Give polynomial-product projection equations, the shift identity,
Euler's reciprocal identity, and coefficient change for this integral form.
**Sources:** O, the t-deformed proof of Proposition 1.5, p. 3, Propositions
2.2 and 2.5 and Corollary 2.6, p. 8, Proposition 2.7, p. 9; G, §2.1,
(46), p. 18. The general q-binomial identity follows from its coefficient
recursion and constant coefficient one. **Prerequisites:** finite
Pochhammer products, Mathlib `PowerSeries.rescale`, `PowerSeries.logOf`, and
formal inversion and q-adic coefficient stabilization.

For the elementary plethystic operation use the existing Laurent-series
carrier, with \(F\in t\mathbb Q((q))[[t]]\). Define Adams dilation for
positive n by \(\psi^n(t)=t^n\), \(\psi^n(q)=q^n\); its Laurent
coefficient at i is zero unless \(n\mid i\), when it is the original
coefficient at \(i/n\). These are ring homomorphisms, fix constants, and
satisfy \(\psi^m\psi^n=\psi^{mn}\). Put

\[
 \operatorname{PE}(F)=
 \exp\left(\sum_{n\geq1}\frac{\psi^n(F)}n\right).
\]

The sum converges t-adically because F has zero t-constant. The kth
coefficient needs only \(n\leq k\). Include the zero value, constant
coefficient one, additivity-to-multiplicativity, Adams compatibility,
\(\operatorname{PE}(q^it^j)=(1-q^it^j)^{-1}\) for \(j>0\), and
\(\operatorname{PE}(-q^it^j)=1-q^it^j\). Prove integrality when F lies in
\(t\mathbb Z((q))[[t]]\), by reducing to finite products at each pair of
precisions. General lambda-rings are supplied by **QWittVectors:QW.1**;
this elementary substitution construction does not require that theory.
**Source:** O, Definitions 5.4–5.5 and the following monomial product
calculation, pp. 26–27. **Prerequisites:** Mathlib Hahn/Laurent series,
`PowerSeries.expand`, `PowerSeries.exp` and substitution; the positive
Adams coefficient rule and the integral product argument just given.

The following are acceptance tests of these definitions; the suggested file
uses `QToolkit` for their shared namespace.

| Definition or family | Three discriminating tests |
| --- | --- |
| q-integer | \([0]_q=0\); \([3]_q=1+q+q^2\); \([3]_1=3\), hence its reduction at one in characteristic three is zero |
| q-factorial | \([0]_q!=1\); \([3]_q!=(1+q)(1+q+q^2)\); \([3]_1!=6\) |
| Gaussian polynomial | \({0\brack0}_q=1\) and \({2\brack3}_q=0\); \({3\brack1}_q={3\brack2}_q=1+q+q^2\); \({4\brack2}_1=6\), becoming zero in characteristic two |
| q-multinomial | empty and all-zero lists give one; the list \((1,1)\) gives \(1+q\); \((1,2)\) and \((2,1)\) give the same polynomial |
| finite Pochhammer | empty product one; \((q;q)_2=(1-q)(1-q^2)\); \((x;1)_3=(1-x)^3\), with no division at q=1 |
| Jackson and adapted derivatives | \(D_q(t^2)=(1+q)t\); \(D_1(t^3)=3t^2\); \(D_1(t^2)=0\) in characteristic two while \(D'_1(t^2)=0\) over the integers as well |
| series Jackson derivative | a constant has derivative zero; \(D_q(t^3)=(1+q+q^2)t^2\); \((1-q)D_qU_q=U_q\) under the stated unit hypotheses |
| normalized Jackson exponential | constant coefficient one; coefficients of t and \(t^2\) are 1 and \((1+q)^{-1}\); at q=1 over Q it is the ordinary exponential |
| rational infinite Pochhammer | constant coefficient one; at q=0 it is \(1-t\); its \(t^2\) coefficient is \(q/((1-q)(1-q^2))\) |
| reciprocal Pochhammer | constant coefficient one; at q=0 it is \((1-t)^{-1}\); its t coefficient is \((1-q)^{-1}\) |
| q-binomial series | a=1 gives one; a=0 gives \(U_q\); the t coefficient is \((1-a)/(1-q)\) |
| integral infinite product | t-constant one; \([q^0t]=[q^1t]=-1\); \([q^0t^2]=0\), \([q^1t^2]=1\) |
| logarithm | constant zero; t coefficient \(-1/(1-q)\); \(t^2\) coefficient \(-1/(2(1-q^2))\) |
| Adams Laurent dilation | \(q^{-1}\mapsto q^{-2}\) for n=2; a constant is fixed; dilation by 2 followed by 3 is dilation by 6 |
| Adams double-series dilation | t maps to \(t^2\) for n=2; \(q^{-1}t\) maps to \(q^{-2}t^2\); a coefficient at an odd t exponent vanishes after dilation by 2 |
| plethystic sum and exponential | zero sum gives PE=1; PE(t) is \((1-t)^{-1}\); PE(-t)=1-t, whose logarithmic sum has kth coefficient \(-1/k\) |

A further test fixes O, Proposition 1.5's normalization. With \(r=q^{1/2}\),
the raw series is
\(\sum_{n\geq0}r^{n^2}/(r^2;r^2)_n=
\prod_{i\geq0}(1+r^{2i+1})\).
Its constant coefficient is one, its coefficients in degrees 1, 2, 3 are
1, 0, 1, and its degree-eight coefficient is two. Define both sides by
coefficient stabilization in \(\mathbb Z[[r]]\) and expose their equality.
The modular normalization is a separate expression; the raw identity does
not contain the prefactor printed in that proposition.

### Indexing, compatible families, and finite quotients

Construct `cycloIndex R S` as the submonoid \(\Phi_S^*\). Its API includes
membership of each generator, monicity of every index, monotonicity in \(S\),
and transport under a coefficient ring homomorphism. Divisibility makes this
indexing system directed: the product is a common upper bound. It also has a
countable cofinal chain. One concrete choice is

\[
 g_N=\prod_{\substack{n\in S\\1\leq n\leq N}}\Phi_n^N.
\]

Every fixed finite product of cyclotomic powers divides some \(g_N\).
For finite \(S\), the powers of \(\prod_{n\in S}\Phi_n\) are cofinal.
The empty-set calculation, the equality of the characteristic-two systems
for \(\{1\}\) and \(\{2\}\), and coefficient transport from integers to
rationals are basic tests of the indexing choice. **Source:** H, §3.1,
(3.1), pp. 1130–1131. **Prerequisites:** polynomial cyclotomic monicity and
base change, submonoids, finite products and divisibility.

Define `CycloCompletion R S` by

\[
 R[q]^S=\varprojlim_{f\in\Phi_S^*}R[q]/(f).
\]

Use the subalgebra of compatible families, or an equivalent inverse-limit
construction, with the coordinatewise operations. Provide the polynomial
map `fromPoly`, projections `proj`, the transition equation for \(f\mid g\), and
an extensionality theorem reducing equality to all projections. Every
projection is surjective: successive monic division along a cofinal chain
extends a chosen residue. The polynomial map is injective if \(S\) contains
a positive order, since divisibility by arbitrarily high powers of a positive
degree monic polynomial forces a polynomial to vanish. In the empty case the
map is injective exactly when \(R\) is the zero ring. Equivalently, for all
\(S\), injectivity holds precisely when a positive order exists or \(R\) is
subsingleton. For a nonzero coefficient ring, the image of \(\Phi_n\),
\(n\in S\), is a nonunit: its projection modulo \(\Phi_n\) is zero in a
nonzero quotient. **Sources:** H, §1, (1.1), pp. 1127–1128; §3.1,
p. 1130; §4, p. 1134; H₀, §1, p. 3. **Prerequisites:** the index system,
monic quotient representatives, and inverse limits of rings.

The finite quotient theorem is stronger than a formula for polynomial
elements. For every \(f\in\Phi_S^*\) and every completed element \(h\), prove

\[
 \ker(\pi_f)=fR[q]^S,\qquad
 R[q]^S/fR[q]^S\simeq_R R[q]/(f).
\]

Multiplication by \(f\) is injective on the completion. This follows using
monic regularity at a deeper quotient, then all projections; it does not
require \(R\) to be a domain. An element admits a decomposition
\(h=\iota(b)+fc\) with \(b\in R[q]\). The quotient equivalence must take the
class of \(\iota(b)\) to the ordinary polynomial class, and it must commute
with reduction to smaller divisors. These statements are the API behind
dividing a completed element after its value or finite jet vanishes.
**Source:** the division used in H, proof of Theorem 6.1, (6.1), p. 1139,
together with monic representatives in §3.1, p. 1131.
**Prerequisites:** the compatible-family construction and monic division.

Test \(f=1\), giving the zero quotient and kernel the whole completion.
Test \(S=\{1\}\) and \(f=q-1\), whose quotient is \(R\); the kernel is
the principal ideal generated by \(q-1\). A torsion coefficient ring must
also be admitted, so none of the projection or kernel theorems may acquire a
domain hypothesis merely to simplify a proof.

### Topology, extension, and cofinal changes of presentation

Give each quotient the discrete topology and the completion the subspace
topology of the product. Its neighborhood ideals are
\(\ker\pi_f\); they form a basis at zero. Addition and multiplication are
continuous. The compatible-family locus is closed, so completeness and
Hausdorffness follow from those properties of the discrete quotient factors.
Use the existing complete separated topological-ring category to package this
object. The polynomial map has dense range because every finite collection
of coordinates is controlled by one common divisible index, and that
coordinate has a polynomial representative.

State the extension theorem for a polynomial ring map
\(\psi:R[q]\to B\), where \(B\) is a complete Hausdorff topological ring.
Require cyclotomic continuity: for each neighborhood of zero in \(B\), some
ideal \((f)\), \(f\in\Phi_S^*\), is mapped into it. There is then a unique
continuous ring map \(\widehat\psi:R[q]^S\to B\) extending \(\psi\).
The API needs the extension equation on polynomials, continuity, uniqueness
by density, and compatibility with continuous maps out of \(B\). Do not
weaken the target hypothesis to mere completeness without separatedness;
uniqueness uses the latter. **Source:** H, §3.1, inverse limit (3.1),
p. 1130, with the standard completion universal property.
**Prerequisites:** the topology just constructed and the existing completion
and complete separated ring interfaces.

For two directed polynomial-ideal families which are mutually cofinal,
construct the canonical isomorphism of complete topological rings induced
by the identity on \(R[q]\). Include the projection equations, its inverse,
and transitivity of cofinal replacement. This is the reusable mechanism for
all presentation changes here. For finite \(S\), apply it to identify
\(R[q]^S\) with the adic completion at
\((\prod_{n\in S}\Phi_n)\). In particular
\(R[q]^{\{1\}}\simeq R[[q-1]]\). For arbitrary \(S\), prove the compatible
inverse-limit description over finite subsets of \(S\). The finite-set and
cofinal-chain descriptions must preserve polynomial maps, not merely give
unrelated abstract ring isomorphisms. **Source:** H, §3.1, p. 1131,
including (3.2). **Prerequisites:** the extension theorem, monic systems,
and Mathlib adic completion.

The comparison carriers are explicit. For a nonempty directed polynomial
family \(g:I\to R[q]\), `PolynomialLimit R g` is the subalgebra of
\(\prod_i R[q]/(g_i)\) cut out by every divisibility transition; its topology
is induced from discrete factors. Mutual cofinality means
\(\forall j\ \exists i\ h_j\mid g_i\) and
\(\forall i\ \exists j\ g_i\mid h_j\). Define
`PolynomialLimit.equivOfCofinal` by reducing a dominating coordinate.
Compatibility and directedness prove independence of that choice. Its inverse
uses the reversed cofinality data. Prove its polynomial equation, continuity
in both directions, inverse equation, and composition under a third cofinal
replacement. The coordinate equation is
\(\pi_{h_j}(E(x))=\operatorname{reduce}_{g_i,h_j}(\pi_{g_i}(x))\)
whenever \(h_j\mid g_i\).
`CycloCompletion.cofinalEquiv` provides the same comparison with the actual
cyclotomic carrier, including associated but nonmonic factorial generators.
No domain or characteristic-zero assumption enters these comparisons.

For `FiniteOrderLimit R S`, indices are finite subsets U of S and coordinates
are the **completed** rings \(R[q]^U\). Compatibility is
\(\rho_{V,U}(x_V)=x_U\) for \(U\subseteq V\).
`finiteOrderEquiv` sends x to its restrictions. Its inverse reconstructs each
polynomial residue from a finite U containing the orders of its factors;
a common finite superset proves independence and compatibility. State the
reconstruction equation on each U, continuity both ways, the polynomial
map equation, coefficient-change and order-restriction naturality, and
extensionality by actual finite restrictions. This also deals with the empty
subset, whose coordinate is the zero ring.

Tests for the polynomial-family carrier and comparison are: powers
\((q-1)^k\) and \((q-1)^{2k}\) give the same adic limit; the exponent-zero
quotient is the zero ring; and powers of \(q-1\) are not cofinal in all
integral cyclotomic ideals because they never dominate \(\Phi_2\).
Tests for the finite-subset limit are: empty S gives the zero ring; the
polynomial q reconstructs q on every finite subset; and the proposed
coordinates 0 in \(\mathbb Z[q]^{\{1\}}\), 1 in
\(\mathbb Z[q]^{\{2\}}\) cannot come from a compatible family, since their
residues disagree modulo \((\Phi_1,\Phi_2)=(2,q-1)\).

### Factorial polynomials and the full completion

Provide `factorialPoly R N` with `factorialPoly_zero`, the recursion
\(P_{N+1}=P_N(1-q^{N+1})\), compatibility with coefficient maps, and
divisibility when \(M\leq N\). Over a nonzero ring,

\[
 P_N(0)=1,\quad
 \operatorname{lc}(P_N)=(-1)^N,\quad
 \deg P_N=N(N+1)/2,\quad
 (-1)^NP_N=\prod_{d=1}^N\Phi_d^{\lfloor N/d\rfloor}.
\]

The sign in the last formula is also the sign needed for monic division.
The degree formula should be proved from the factors, preserving its
nontriviality hypothesis. The factorization follows by multiplying the
standard decompositions of \(q^i-1\). **Sources:** H₀, §1, p. 3; H,
§7.1, Proposition 7.1, pp. 1141–1142. **Prerequisites:** the polynomial
cyclotomic product identity, finite products, and HC.1 Pochhammer notation.

Prove that the ideals \((P_N)\) are cofinal in the cyclotomic ideals for all
positive orders. If
\(f=\prod_d\Phi_d^{e_d}\), choosing
\(N\geq\max\{de_d:e_d\ne0\}\) makes \(f\mid P_N\). Over the integers,
the multiplicities \(\lfloor N/d\rfloor\) also show sharpness of this bound
for each individual power. Consequently the full classical ring is

\[
 H_R:=R[q]^{\mathbb N_{>0}}
       \simeq\varprojlim_N R[q]/(P_N).
\]

There is a second useful cofinal presentation: the ideals
\(((q^m-1)^k)\), for \(m,k\geq1\). A finite set of orders divides some
\(m\); taking \(k\) sufficiently large dominates all its exponents. In the
other direction \((q^m-1)^k\mid P_{mk}\), since each cyclotomic factor with
order dividing \(m\) occurs at least \(k\) times. Thus

\[
 H_R\simeq\varprojlim_{m\text{ under divisibility}}
       \widehat{R[q]}_{(q^m-1)}.
\]

The maps for \(m\mid m'\) are induced by the identity polynomial map.
Both cofinal isomorphisms must commute with root-order restriction and with
coefficient change. **Sources:** H, §1, p. 1128; §4, p. 1136; H₀, §1,
p. 3. **Prerequisites:** factorial factorization and cofinal replacement.

`HabiroRing.factorialEquiv` identifies the full completion with the actual
`PolynomialLimit R (factorialPoly R)`, and its inverse has projection y_N at
precision N. `OrderAdic R m` is Mathlib's adic completion for
\((q^m-1)\), for positive m. Its topology is the inverse limit of the
discrete power quotients. `orderAdicTransition m n` for \(m\mid n\) goes
from the n-adic to the m-adic completion; prove its polynomial equation,
identity, composition and continuity. `OrderAdicLimit R` is the subalgebra
of the product satisfying those transitions, rather than the unrestricted
product. `HabiroRing.orderAdicEquiv` and its inverse expose their coordinate
and polynomial equations and continuity. The inverse can reconstruct first
the residues modulo \((q^m-1)^k\), then all cyclotomic residues by cofinality.
`finiteDivisorsAdicEquiv` identifies each coordinate with the completion
at the divisors of m, making order restriction compatibility explicit.
Coefficient maps commute with the finite quotient maps, factorial comparison,
adic transitions and adic coordinates.

Tests for these carriers and maps are: reconstruction at \(P_0=1\) remains
inverse; the polynomial q has the polynomial q coordinate at every positive
m; constants 0 at m=1 and 1 at m=2 violate adic compatibility. Check the
transition \(2\mid6\) on polynomials, coefficient reduction to
\(\mathbb F_2\) through the factorial comparison, and that m=2 retains both
orders 1 and 2. These tests distinguish a tower limit from a product or a
single Taylor completion.

Tests should compute
\(P_2=1-q-q^2+q^3\) and
\(P_3=1-q-q^2+q^4+q^5-q^6=-\Phi_1^3\Phi_2\Phi_3\).
For the bound, check \(\Phi_3^2\mid P_6\) and
\(\Phi_3^2\nmid P_5\) over \(\mathbb Z\). Check a finite cyclotomic
projection by taking a larger factorial quotient, and check the order of
the transition maps in the divisibility-indexed adic presentation.

The full completion is neither the q-adic nor the \((q-1)\)-adic completion
via the identity on polynomials when \(R\ne0\). For the first comparison,
\(q-1\) is a unit in \(R[[q]]\), but its image in \(H_R\) is a nonunit.
For the second, \(\Phi_6\) is a unit at \(q=1\), since \(\Phi_6(1)=1\),
and a nonunit in \(H_R\). More generally, if \(R\) is a nonzero subring of
the algebraic numbers and \(S\) is infinite, no ideal-adic completion of
\(R[q]\) is topologically isomorphic to \(R[q]^S\) through the identity
polynomial map. Powers of an ideal containing a nonzero polynomial cannot
be cofinal in all these cyclotomic ideals: that polynomial misses a root of
some order in \(S\), and all its powers still miss it. The zero ideal would
give the discrete polynomial ring and does not describe this nondiscrete
completion. **Source:** H, Proposition 6.1, p. 1140, and the finite-order
contrast in §3.1, p. 1131. **Prerequisites:** density, the finite quotient
theorem, cofinality, and root evaluation for the noncofinality argument.

### Coefficient and order functoriality

For a ring homomorphism \(\varphi:R\to R'\), define
`mapRing φ : R[q]^S →+* R'[q]^S`. For \(S'\subset S\), define
`restrict : R[q]^S →+* R[q]^{S'}`. Both are continuous and commute with
polynomial maps and projections. Give identity and composition laws, the
commuting square between restriction and coefficient change, and the
corresponding algebra-homomorphism statements where the base ring is fixed.
At a finite monic quotient, coefficient extension is the ordinary base
change \(R'\otimes_R R[q]/(f)\). This finite formula must not be promoted to
an unrestricted infinite completion formula.

Prove that `mapRing φ` is injective when \(\varphi\) is injective and
surjective when \(\varphi\) is surjective. Monic reduced representatives
give finite-level injectivity. For surjectivity use a countable cofinal chain
and lift successive residual coefficients compatibly; surjectivity of an
arbitrary inverse limit is not an acceptable substitute for that lifting
argument. **Source:** H, §3.1, Lemma 3.1 and its proof, pp. 1130–1131;
coefficient extension in the proof of Theorem 5.2, p. 1138.
**Prerequisites:** monic finite quotients, the cofinal chain, and completed
finite quotient division.

Tests include integer-to-rational injectivity and reduction modulo two
surjectivity. For a failure of infinite base change, the natural map
\(\mathbb Q\otimes\mathbb Z[[t]]\to\mathbb Q[[t]]\) misses
\(\exp(t)=\sum t^n/n!\): a tensor element has one common integer denominator,
while these coefficients have unbounded denominators. The same issue will
appear for factorial digits. No tensor-commutation theorem in this roadmap
may lose the finite-level or finite-presentation hypothesis which makes it
true.
## HC.2 — Factorial series, canonical digits, and arithmetic

### Convergence and normalized coordinates

For any sequence \(b_n\in R[q]\), construct
`factorialSeries b` as the limit of \(\sum_{n<N}b_nP_n\) in \(H_R\).
Its projection modulo \(P_N\) is that finite sum; no growth hypothesis on
the coefficients is needed. Give additivity, compatibility with scalar
multiplication and coefficient maps, and an extensionality statement for
its projected sums. More generally, a sequence of summands lying in
\((P_{m_n})\), with \(m_n\to\infty\), is summable. State the convergence
hypothesis as eventual ideal membership for each precision rather than an
analytic absolute convergence condition.

Every element has a factorial-series expression, but unrestricted sequences
are not unique. The relation
\((1-q)P_0-P_1=0\) is a required test: the sequence with first entries
\(1-q,-1\) and all others zero maps to zero. A constructor which inferred
injectivity from this broad series presentation would be wrong. The
Kontsevich element
\(F=\sum_{n\geq0}P_n\) is the standing convergence example, with
\(F\equiv2-q\pmod {P_2}\). **Sources:** H, §1, p. 1128; H₀, §1, (2),
p. 2. **Prerequisites:** HC.1 factorial cofinality, completeness, and finite
projections.

The canonical presentation restricts the degree of each coefficient:

\[
 h=\sum_{n\geq0}a_n(q)P_n(q),\qquad \deg a_n\leq n.
\]

Construct `factorialCoeff R h n` and prove existence and uniqueness of these
digits. For polynomials, a convenient recursion starts with \(r_0=g\).
Divide \(r_n\) by the monic polynomial \(q^{n+1}-1\), with remainder
\(a_n\) of degree at most \(n\), and set \(r_{n+1}\) to the **negative**
quotient. Then
\(r_n=a_n+(1-q^{n+1})r_{n+1}\), giving the desired factorial expansion.
At finite precision, the first \(N\) digits depend only on the class of
\(g\) modulo \(P_N\). This representative-independence theorem is needed
before passing to completed elements.

Provide reconstruction from a bounded-degree digit family; digit extraction
after reconstruction; reconstruction after extraction; the degree bound;
agreement with polynomial recursion; and naturality under coefficient maps.
The truncated digit space is R-linearly isomorphic to \(R[q]/(P_N)\), with
basis \(q^kP_n\), \(0\leq n<N\), \(0\leq k\leq n\), and rank
\(N(N+1)/2\) when \(R\ne0\). Arbitrary degrees of a chosen polynomial
representative must not affect the finite digit vector. **Source:** H₀,
proof of Lemma 3.1, p. 7, with the factorial presentation in §1, p. 3.
**Prerequisites:** HC.1 monic quotient division and factorial cofinality.

Digit tests fix both the index and the sign: \(F\) has every digit one;
\(q\) has digits \(1,-1,0,\ldots\); \(1-q\) has digits
\(0,1,0,\ldots\). The normalized digits of the inverse of \(q\) are
\(q^n\), as proved below. Check that replacing a polynomial by
\(g+P_Nc\) leaves all digits of index less than \(N\) unchanged. The zero
digit sequence reconstructs zero, including over torsion coefficient rings.

### Finite arithmetic and executable division

Addition and negation operate digitwise because the degree bounds are
preserved. Multiplication requires normalization. To obtain the \(n\)-th
digit of a product, multiply the two truncations through digit \(n\), reduce
modulo \(P_{n+1}\), and apply the normalized polynomial recursion. Prove
the resulting congruence, independence of deeper digits, and compatibility
with addition, scalar multiplication, and coefficient maps. The algorithm
should expose truncation maps and the equation between multiplication in the
completion and multiplication followed by finite normalization. Carries can
only affect higher digit positions.

For the integer implementation, define `factorialDigitList l n` using the
existing Tau Ceti descending-list division interface. Its correctness theorem
identifies the Horner polynomial of its output with
`factorialDigit ℤ (ofCoeffList l) n`; this statement covers lists with leading
zeros as well as normalized coefficient lists. Use
`TauCeti.Polynomial.divModByMonicList` and its existing quotient/remainder
correctness theorems, with divisor \(q^{n+1}-1\). The new work is the
factorial iteration and its correctness, not synthetic division itself.
**Source:** the monic recursive expansion in H₀, proof of Lemma 3.1, p. 7.
**Prerequisites:** normalized digits and Tau Ceti's coefficient-list API.

As a multiplication test,

\[
 F^2\equiv1+(3-q)P_1+(6-3q-q^2)P_2
             +(7-4q-4q^2+2q^3)P_3\pmod {P_4}.
\]

In particular the first three digits are \(1,3-q,6-3q-q^2\).
An unnormalized candidate for the third digit,
\(q^3-q^2-3q+5\), differs from the normalized one by \(q^3-1\).
This is a direct test of the upward carry and of the sign in the residual
division. Include list-versus-polynomial correctness for an integer list
representing a polynomial of degree greater than the target digit bound.

### The unit q and the Laurent presentation

Every \(\Phi_n\) with positive \(n\) has unit constant term. Hence the
image of \(q\) is a unit in every finite index quotient and in every
\(R[q]^S\), including the zero completion. Define `qInv`, prove the left
and right inverse identities, and compatibility with coefficient maps and
restriction. The full completion has the explicit normalized expression

\[
 q^{-1}=\sum_{n\geq0}q^nP_n,\qquad
 q\sum_{n<N}q^nP_n=1-P_N.
\]

The second equality is a polynomial telescoping identity, valid at every
finite precision, and is the proof of the first. The inverse modulo \(P_3\)
is represented by \(1+q-q^3-q^4+q^5\).

Construct the canonical Laurent-polynomial map and identify the cyclotomic
completion of \(R[q,q^{-1}]\) with \(R[q]^S\). At each finite quotient the
polynomial and Laurent presentations are the same because \(q\) is already
invertible. The Laurent map is injective for a nonempty positive order set,
and the same zero-ring exception as in HC.1 applies. All presentation
isomorphisms must preserve \(q\), its inverse, and finite projections.
**Source:** H, §7.1, Proposition 7.1 and its proof, pp. 1141–1142.
**Prerequisites:** HC.1 finite quotient units and cofinal factorial sums.

This unit theorem does not imply that the cyclotomic factors are units.
Over \(\mathbb Z\), a factor whose order lies in \(S\) is a nonunit by
HC.1. For other restricted sets extra units can occur; \(1-q\) is a unit
in the order-six completion, an example treated in HC.6. Habiro's
Conjecture 7.1 about the full integral unit group, H, p. 1142, must remain
distinct from the established inversion formula.

For every odd \(m\geq3\), prove the further established unit example
\(\sum_{i=0}^{m-1}(-1)^iq^i\) in
\(\mathbb Z[q]^{\{n>0:\gcd(n,2m)=1\}}\).
Its cyclotomic factors are \(\Phi_{2d}\) for \(d\mid m\), \(d>1\).
Each order \(2d\) has at least two distinct prime factors and is coprime
to every admitted order, so their ratios cannot be nontrivial prime
powers. Thus the polynomial is coprime to every finite cyclotomic index
in this set, and its finite quotient inverses are compatible. This restricted-order
example does not determine the full integral unit group.
**Source:** H, §7.1, Remark 7.1, p. 1142.
**Prerequisites:** HC.1 finite projections and HC.4 cyclotomic comaximality.

## HC.3 — Values, Taylor expansions, and p-adic translation

### Root evaluation and additive Taylor coefficients

For \(n\in S\), an R-algebra \(B\), and \(\zeta\in B\) satisfying
\(\Phi_n(\zeta)=0\), define `evalAtRoot ζ` by projecting modulo
\(\Phi_n\) and evaluating the polynomial class. It is an R-algebra map
to the discrete algebra \(B\), continuous for the cyclotomic topology, and
agrees with ordinary polynomial evaluation. Its canonical universal target
is `AdjoinRoot (cyclotomic n R)`. When \(R\) embeds in a characteristic-zero
field and \(\Phi_n\) is irreducible over its fraction field, the universal
quotient identifies with the embedded ring \(R[\zeta]\).

The cyclotomic equation is essential for arbitrary coefficient algebras.
A primitive root alone is insufficient in that generality: three has exact
multiplicative order two in \(\mathbb Z/8\mathbb Z\), but
\(\Phi_2(3)=4\ne0\). Irreducibility over \(R[q]\) alone is also
insufficient for identifying the universal quotient with an embedded root
ring. For \(R=\mathbb Z[2i]\), evaluation at \(i\) kills the nonzero
class of \(2+2iq\) modulo \(q^2+1\), although that polynomial is
irreducible in \(R[q]\). Keep the fraction-field hypothesis.

For a factorial series, evaluation is finite at a root of order \(d\):

\[
 \operatorname{ev}_\zeta\Bigl(\sum b_nP_n\Bigr)
       =\sum_{n<d}b_n(\zeta)P_n(\zeta).
\]

For the integral full ring combine these maps into the product of root
algebras; injectivity is a later rigidity theorem, not a property of the
definition. A continuous polynomial-compatible map into a discrete target
must kill some index ideal, so its value of \(q\) satisfies the associated
product of cyclotomic equations. There is no substitution map
\(\mathbb Z[[q-1]]\to\mathbb Z\) extending \(q\mapsto-1\): the unit
\(2-q\) would map to the nonunit three. **Source:** H, §1, p. 1128.
**Prerequisites:** HC.1 projections and quotient universal properties,
Mathlib `AdjoinRoot`, and polynomial evaluation.

Define `taylorAt ζ : R[q]^S →ₐ[R] B[[X]]`, with \(X=q-\zeta\), from
compatible polynomial Taylor expansions. The coefficient of \(X^k\) is
the value of the kth Hasse derivative of a representative modulo
\(\Phi_n^{k+1}\). Prove representative independence: translating
\(\Phi_n^{k+1}\) at a root makes it divisible by \(X^{k+1}\).
Provide the constant-term evaluation identity, the polynomial Taylor
equation, coefficients through finite projections, continuity, ring-map
laws, and compatibility of coefficient truncations. For a factorial
series, its kth coefficient at order \(d\) uses only terms
\(n<d(k+1)\).

The ordinary derivative comparison is
\(k![X^k]\sigma_\zeta(g)=g^{(k)}(\zeta)\). No division by a factorial
is used unless the coefficient algebra is a \(\mathbb Q\)-algebra. In
characteristic two, \(q^2\) has Taylor coefficient one in degree two and
second ordinary derivative zero; this is a required safeguard for the Hasse
formulation. For rational coefficients a further coordinate
\(q=\zeta\exp(-t)\) is permitted by substituting the zero-constant-term
series \(\zeta(\exp(-t)-1)\) into the additive expansion. **Sources:** H,
§1, pp. 1128–1129; Mathlib's Hasse derivative and Taylor identities.
**Prerequisites:** root evaluation, monic powers, polynomial translation,
power-series coefficient extensionality and HC.1 completeness.

Tests should distinguish evaluation from an entire jet: \(F\) and the
constant one agree at \(q=1\) but have different first derivatives there.
The beginning of \(\sigma_1(F)\) is
\(1-X+2X^2-5X^3+15X^4-53X^5+217X^6\); at \(-1\) it begins
\(3+11X+72X^2+635X^3+7085X^4\). These finite computations must be
invariant under extending the factorial truncation beyond the coefficient's
required bound.

### Naturality and changes of q

Root evaluation and Taylor expansion commute with coefficient ring maps,
maps of root algebras, root-preserving automorphisms, and restriction to a
smaller order set containing the chosen root order. Give the equations on
completed elements, not just on polynomials. Uniqueness by density is the
mechanism for passing the polynomial equations to the completion.

For \(a\geq1\), polynomial substitution \(q\mapsto q^a\) extends to a map
\(R[q]^S\to R[q]^T\) when

\[
 \text{for all }m\in T,\quad m/\gcd(m,a)\in S.
\]

The order condition records the exact order of \(\zeta^a\). Its evaluation
equation is \(\operatorname{ev}_\zeta(h(q^a))=
\operatorname{ev}_{\zeta^a}(h)\). Its Taylor equation substitutes
\((\zeta+X)^a-\zeta^a\), a zero-constant-term series, into the expansion
at \(\zeta^a\). Include the identity and composition laws of these power
maps. Negative powers require the Laurent presentation and the unit \(q\);
they must not be inferred from the positive-order condition alone.
**Sources:** H, §3.1, pp. 1130–1131, functorial completions and Lemma 3.1,
with the elementary order-of-a-power formula. **Prerequisites:** HC.1
continuity and extension, HC.2 Laurent presentation, roots-of-unity order
arithmetic, and the Taylor map.

### Close roots and convergent re-expansion

Let two roots differ by a ratio \(\omega\) of p-power order. If
\(\omega^{p^e}=1\), then \((\omega-1)^{p^e}\) belongs to \(pB\) in the
root algebra. Thus their difference becomes topologically nilpotent in a
p-adically complete target. Conversely, if the ratio has order greater
than one which is not a prime power, \(1-\omega\) is a cyclotomic unit;
it cannot be topologically nilpotent in a nonzero separated ring. This is
a condition on the **actual ratio of roots**, not just on the ratio of
their orders.

For example choose \(\zeta_6=-\zeta_3^2\). Then
\(\zeta_6-\zeta_3=1\), while
\(\zeta_6-\zeta_3^2=-2\zeta_3^2\) is 2-adically small. The orders are
the same in the two comparisons, yet only the second shift is suitable.
Choosing matching prime-to-p parts of roots gives the compatible close
families used by arithmetic applications. **Sources:** H, Lemma 5.1,
pp. 1136–1137; G, §1.3, (7), pp. 4–5. **Prerequisites:** root-of-unity
arithmetic, cyclotomic values at one, and p-adic ideal powers.

Let \(B\) be p-adically complete and separated and let \(c\in B\) satisfy
\(c^M\in pB\) for some \(M\geq1\). Construct the continuous ring map
`reExpand c` by convergent evaluation at \(X+c\). Its coefficients are

\[
 [X^j]\operatorname{reExpand}_c(f)
       =\sum_{k\geq j}\binom kj f_k c^{k-j}.
\]

For each coefficient the summands tend p-adically to zero; completeness
produces the value. Use `PowerSeries.eval₂Hom` with its convergence
hypotheses. This is not an application of the algebraic `subst` API with a
non-nilpotent constant. Require the polynomial translation equation, the
zero shift identity, the composition rule
\(\operatorname{reExpand}_d\circ\operatorname{reExpand}_c
=\operatorname{reExpand}_{c+d}\), inverse shift \(-c\), continuity, and
naturality under continuous coefficient maps preserving the topology.
The shifted sums and the cocycle identity must carry the hypotheses that
make every evaluation converge.

For \(B=\mathbb Z_2\), \(c=-2\), and \(f=\sum_{k\geq0}X^k\), the
translated constant is \(\sum(-2)^k=1/3\); the translated series is
\(1/(3-X)\). This distinguishes convergent evaluation from substitution
in a discrete polynomial algebra. A unit shift in a nonzero separated
p-adic ring fails the evaluation hypothesis and is a negative test.
**Sources:** H, proof of Proposition 3.1, p. 1132; G, §1.3, (9), p. 5.
**Prerequisites:** p-adic complete separated rings, power-series evaluation,
and the close-root lemma.

For close roots \(\zeta,\zeta'\) in a common p-adically completed root
algebra, prove

\[
 \sigma_{\zeta'}(h)
   =\operatorname{reExpand}_{\zeta'-\zeta}(\sigma_\zeta(h)),\qquad
 \operatorname{ev}_{\zeta'}(h)
   =\sum_{k\geq0}[X^k]\sigma_\zeta(h)(\zeta'-\zeta)^k.
\]

The polynomial translation identity and density prove these equations for
all completed elements. They do not require order connectedness; that
hypothesis belongs to injectivity in HC.4. The common target and coefficient
embeddings must appear in the statement, so two Taylor series in different
root rings are never equated without transport. **Sources:** G, §1.3,
p. 5; H, §1, p. 1129. **Prerequisites:** all preceding re-expansion and
naturality interfaces.
## HC.4 — Rigidity and the integral Taylor image

The two parts of this layer share the preceding completion and Taylor APIs.
The first proves injectivity for restrictions, root expansions and certain
families of values. The second studies the joint Taylor collection at all
orders by finite free modules and integer matrices. Individual-root
injectivity and joint injectivity have different hypotheses and must have
different declarations. The projector examples for the matrix theory are
stated in HC.6, after the localization component theorem of HC.5 on which
their integral coefficient claims depend.

### Order adjacency and cyclotomic ideals

For positive \(m,n\), let \(c_{m,n}\) be zero when \(m=n\), the prime \(p\)
when \(m/n=p^j\) for a nonzero integer \(j\), and one otherwise. Define
`Adjacent R m n` by separation of \(R\) at the ideal generated by
\(c_{m,n}\). Thus over a nonzero ring distinct orders are adjacent precisely
when their ratio is a nontrivial prime power and the ring is separated at
that prime. The relation is reflexive and symmetric. A set is
`IsAdjConnected R S` if it is nonempty and any two of its elements can be
joined by a finite adjacency chain **lying in S**.

Provide the index symmetry, adjacency reflexivity and symmetry, the
distinct-order characterization, and connectedness through restricted
reflexive-transitive closure. Over \(\mathbb Q\), adjacency is equality;
over \(\mathbb Z\), it is equality or prime-power ratio. The divisors of
\(n\) are connected over \(R\) exactly when \(R\) is p-adically separated
for each prime dividing \(n\). Tests include
\(1\leftrightarrow2\leftrightarrow6\) over \(\mathbb Z\), but
\(1\not\leftrightarrow6\); \(3\leftrightarrow12\), but
\(4\not\leftrightarrow6\); and the divisors of twelve, connected over
\(\mathbb Z\) but disconnected over \(\mathbb Z[1/3]\). Equal orders remain
adjacent over \(\mathbb Q\), despite its failure of p-adic separation.
**Source:** H, §4, pp. 1134–1136. **Prerequisites:** Mathlib `IsHausdorff`,
positive integer prime-power arithmetic, and ideal powers.

For \(p\) prime, \(e\geq1\), \(n\geq1\), prove

\[
 \Phi_{p^e n}\equiv\Phi_n^d\pmod p,\quad
 p\in(\Phi_n,\Phi_{p^e n}),\quad
 (\Phi_n,\Phi_{p^e n})=(p,\Phi_n),
\]

where \(d=(p-1)p^{e-1}\) if \(p\nmid n\), and \(d=p^e\) if \(p\mid n\).
The integral quotient is consequently
\(\mathbb F_p[q]/(\Phi_n)\), and the ideal statements transport to
\(R[q]\). The exclusion \(e=0\) matters: the quotient for equal orders
is \(\mathbb Z[q]/(\Phi_n)\), not the characteristic-p quotient.
Examples are \(\Phi_{12}\equiv\Phi_3^2\pmod2\),
\(\Phi_9\equiv\Phi_3^3\pmod3\), and the two-dimensional
\(\mathbb F_2\)-quotient for \(\Phi_3,\Phi_{12}\).

If distinct orders have no prime-power ratio, prove that their cyclotomic
polynomials are comaximal over \(\mathbb Z\), hence over every \(R\).
The quantitative resultant formula for \(m>n\) is

\[
 |\operatorname{Res}(\Phi_m,\Phi_n)|=
 \begin{cases}p^{\varphi(n)}&m/n=p^a,\ a\geq1,\\1&\text{otherwise.}\end{cases}
\]

Do not identify that resultant with the smallest integer in the two-generator
ideal: \(|\operatorname{Res}(\Phi_{12},\Phi_3)|=4\), although the ideal
contains two; for \(\Phi_9,\Phi_3\) the corresponding values are nine and
three. The identity \(\Phi_6-q\Phi_1=1\) checks comaximality for orders
one and six. **Sources:** H, Lemma 4.1, (4.1)–(4.2), p. 1134;
W, §2.1, Lemma 2.1, p. 8, with distinct orders; A, Theorems 1, 3 and 4,
pp. 457–460. **Prerequisites:** polynomial cyclotomic prime-power identities,
HC.3 root-ratio units, and the existing resultant/coprimality API.

### Monic separation and restriction injectivity

For monic \(f,g\in R[q]\), define \(f\Rightarrow_R^I g\) by
\(f\in\sqrt{(g)+I[q]}\), where \(I[q]\) is the coefficient extension
of the ideal \(I\). Define `MonicImplies R f g` by the existence of such
an \(I\) at which \(R\) is separated. Define `MonicPrecedes` for
\(M_0\subset M\): every element of \(M\) is reached from an element of
\(M_0\) along a chain of this relation inside \(M\). Supply reflexive
and divisibility cases, and monotonicity: from \(f\Rightarrow g\),
\(f\mid f'\), and \(g'\mid g\), infer \(f'\Rightarrow g'\).
The witnessing ideal can always be finitely generated. Indeed the finitely
many coefficients of a relation \(f^r-gh\in I[q]\) generate a smaller
ideal, and separation persists for that smaller ideal. This reduction is a
required part of the API, not an extra Noetherian assumption.

The one-step theorem is injectivity of

\[
 \widehat{R[q]}_{(fg)}\longrightarrow\widehat{R[q]}_{(f)}
 \quad\text{if }f\Rightarrow_R g.
\]

When \(R\) is also complete at a finitely generated witnessing ideal, the
map is an isomorphism. Compare the two polynomial topologies after adding
that coefficient ideal; the radical relation makes them cofinal. For the
separated case, embed \(R\) in its completion at the witnessing ideal and
use injective coefficient change on the vertical maps. This identifies the
precise finite-generation input to the completion theorem.

The chain theorem states that `MonicPrecedes R M₀ M` makes
\(R[q]^M\to R[q]^{M_0}\) injective. Reduce to finite subsets containing the
finitely many chosen chains and then add one polynomial at a time; HC.1's
finite-subset inverse limit passes this to arbitrary sets. Cyclotomic
adjacency agrees, over a nonzero ring, with the monic relation on the
corresponding \(\Phi_m,\Phi_n\). The congruence and the prime-in-ideal
formula prove both orientations for prime-power ratios. In the other case
comaximality would force the witnessing ideal to be the unit ideal, which
cannot be separated on a nonzero ring.

Therefore if every order of \(S\) can be joined inside \(S\) to some
order of \(S'\subset S\), then
`restrict_injective_of_chain` proves \(R[q]^S\to R[q]^{S'}\) injective.
In particular, a connected \(S\) permits restriction to any nonempty
subset. Over \(\mathbb Z\), all positive orders are connected; the full
completion embeds in each nonempty restricted completion. For \(m\mid n\),
restriction from the divisors of \(n\) to those of \(m\) is injective, and
the full integral ring is the intersection of these divisor completions
inside \(\mathbb Z[[q-1]]\).

Test \(\Phi_2\Rightarrow_\mathbb Z\Phi_1\) with witnessing ideal \((2)\),
and its failure over \(\mathbb Q\). Over \(\mathbb Z\) the
\((q^2-1)\)-adic completion embeds in \(\mathbb Z[[q-1]]\); over
\(\mathbb Z_2\) this is an isomorphism; over \(\mathbb Q\) it has a
nonzero kernel. The sets \(\{1,2,4\}\) and \(\{1\}\) meet the chain
criterion. The sets \(\{1,6\}\) and \(\{1\}\) do not, even though one
can connect one to six through two in the larger set of all orders.
**Sources:** H, §3.2 and Proposition 3.1, p. 1132; Theorem 3.1,
p. 1133; Corollary 3.1 and Lemma 4.1, p. 1134; Theorem 4.1 and
Corollary 4.1, pp. 1135–1136. **Prerequisites:** HC.1 monic completions,
coefficient-change injectivity, finite-subset limits, and finitely generated
adic completion; the preceding adjacency and ideal lemmas.

### Primitive roots, finite extensions, and Taylor rigidity

For a characteristic-zero domain containing the roots in question, define
root adjacency by equality, or p-power order of the ratio together with
p-adic separation. It agrees with the monic relation on \(q-\zeta\) and
\(q-\zeta'\), and with separation at \(\zeta-\zeta'\).
The root-set chain theorem gives injectivity of restriction to a nonempty
subset of a connected root set. If the domain contains all primitive nth
roots and is separated at every odd prime dividing \(n\), and at two when
\(4\mid n\), the primitive nth roots are connected. Change one prime-power
part of a primitive root at a time. The primitive second roots form a
singleton, which explains why a factor two to the first power needs no
2-adic hypothesis. **Sources:** H, Lemma 5.1 and Theorem 5.1,
pp. 1136–1137; proof of Theorem 5.2, p. 1138.
**Prerequisites:** the monic chain theorem and HC.3 root-ratio closeness.

Supply explicitly the finite-extension transfer used when the root is not
already in the coefficient ring. If \(R\to B\) is an injective finite
extension of domains, there are \(r\geq1\) and an injective R-linear map
\(B\to R^r\). To construct it, embed in the fraction fields, choose a
basis for the finite-dimensional span of a finite set of module generators,
and clear all their coordinate denominators by one nonzero element of
\(R\). Coordinates of every element of \(B\) then lie in \(R\).
The coordinate map remains injective. Neither freeness of \(B\) nor
Noetherianity of either domain is required.

Consequently, for \(c\in R\), separation at \((c)\) transfers from
\(R\) to \(B\). A vector belonging to every \(c^kB\) has all its image
coordinates in every \(c^kR\), hence vanishes. Apply this to the actual
embedded finite domain \(R[\zeta]\), finite because \(\zeta\) satisfies
a monic cyclotomic polynomial. The transfer is not a claim about arbitrary
finite algebras with torsion or nilpotents. **Source and argument:** this
supplies the finite-domain input to H, proof of Theorem 5.2, p. 1138;
the coordinate proof uses the existing fraction-field and finite-module
basis APIs. **Prerequisites:** Mathlib finite modules, finite-dimensional
spans, fraction fields and common denominators.

Now let \(R\) be a characteristic-zero domain, let \(S\) be connected,
let \(n\in S\), and let \(\zeta\) be a primitive nth root in an
algebraic closure of its fraction field. If \(R\) is p-adically separated
for each odd \(p\mid n\), and also 2-adically separated when \(4\mid n\),
prove

\[
 \sigma_\zeta:R[q]^S\longrightarrow R[\zeta][[q-\zeta]]
 \quad\text{is injective}.
\]

First use injective coefficient change into \(R[\zeta]\), carrying the
separation hypotheses by the preceding transfer; then restrict to order
\(n\) and finally to one linear root factor. Primitive-root connectedness
justifies the last step. Over \(\mathbb Z\), every single-root Taylor map
of the full ring is injective. The connected completion is a domain whenever
one order in it satisfies these prime-separation hypotheses, by embedding
in a power-series ring over a domain. In particular every nonempty connected
integral order set gives a domain.

Connectedness cannot be dropped: the order set \(\{1,6\}\) gives
\(\mathbb Z[[q-1]]\times\mathbb Z[q]^{\{6\}}\), and \(\{2,3\}\)
gives another product. Nor can prime separation be discarded for a general
domain containing the root: over \(\mathbb Z[i,1/2]\), the order-four
completion splits at \(i,-i\); over
\(\mathbb Z[\zeta_3,1/3]\), the order-three completion splits at its two
primitive roots. The conditions are sufficient rather than necessary:
Galois descent over localized integers in HC.5 gives further injectivity.
**Sources:** H, Theorem 5.2 and Corollary 5.1, p. 1138, with
connectedness retained in the integral consequence. **Prerequisites:** all
preceding transfer and root-chain results, HC.1 coefficient change, and HC.3
Taylor maps.

### Evaluation uniqueness and proper embeddings

Let \(R\subset\overline{\mathbb Q}\), \(S\) connected over \(R\), and
\(T\subset S\). Define
\(\epsilon_{S,T}:R[q]^S\to\prod_{m\in T}R[q]/(\Phi_m)\).
If there exists \(n\in S\) with infinitely many \(m\in T\) adjacent to
\(n\), then \(\epsilon_{S,T}\) is injective. The proof begins with the
lowest nonzero \(\Phi_n\)-adic coefficient of an element in the kernel.
Vanishing at all primitive roots of successive adjacent orders permits
division by the product of their distinct cyclotomic polynomials. Reducing
that product modulo \(\Phi_n\) forces its lowest coefficient to be
divisible by arbitrarily long products of the associated primes. Algebraicity
and separation force that coefficient to be zero. Use universal residue
algebras, or all roots of each order, in the division argument.

If \(R\) is contained in the algebraic integers, the full order set is
connected and any \(T\) containing infinitely many prime powers suffices.
A finite \(T\) never determines an integral full-ring element: the nonzero
polynomial \(\prod_{m\in T}\Phi_m\) lies in the kernel. The theorem does
not decide a sparse infinite set such as products of consecutive primes
\(6,15,35,77,\ldots\), for which each fixed order has only finitely many
adjacent entries. Conjecture 6.1 predicts integral injectivity even without
the adjacency condition, but this roadmap does not prove or assume it.
**Source:** H, Theorem 6.1, pp. 1139–1140, and Conjecture 6.1, p. 1141.
**Prerequisites:** restriction injectivity, the finite quotient division
theorem, cyclotomic prime congruences, and algebraic-number arithmetic.

For evaluation at selected individual roots rather than entire residue
algebras, retain those hypotheses and additionally require
\(\Phi_{\operatorname{ord}(\zeta)}\) irreducible over \(\operatorname{Frac}(R)\)
for every selected root. Infinitely many selected roots whose orders are
adjacent to one \(n\in S\) then determine the completed element. Each order
has finitely many roots, so there are infinitely many such orders, and the
irreducibility hypothesis makes evaluation on the residue algebra injective.
This covers \(R=\mathbb Z\) and yields uniqueness from infinitely many
prime-power-order root values. Do not generalize it to a coefficient ring
where the cyclotomic polynomial splits: over \(\mathbb Z[i]\), evaluation
at the selected fourth root \(i\) kills \(q-i\) in the order-four residue
algebra. **Source:** H, Theorem 6.2 and its proof, pp. 1140–1141,
with the fraction-field irreducibility hypothesis required by that residue
algebra argument; integral consequence in §1, p. 1128.
**Prerequisites:** order-family uniqueness and HC.3 root evaluation.

Over \(\mathbb Z\), establish the following non-surjectivity results:

1. For distinct adjacent \(m,n\), restriction from \(\{m,n\}\) to
   \(\{m\}\) is not surjective.
2. For \(m\mid n\), \(m\ne n\), restriction from the divisors of \(n\)
   to the divisors of \(m\) is not surjective.
3. Restriction from all orders to any nonempty finite order set is not
   surjective.

These particular maps are injective by the chain theorem, so their images
are proper subrings. For the first case, pass from an order-m expansion to
the p-adic order-n residue algebra using the prime in the joint ideal;
elements coming from the two-order completion have integral residues, while
the whole single-order completion can have p-adic nonintegral residues.
For the divisor case use the finite free extension in the variable \(q^m\);
then use a larger divisor set to treat arbitrary finite sets.
**Source:** H, Proposition 7.4 and proof, pp. 1144–1145.
**Prerequisites:** restriction injectivity, prime-in-ideal congruences,
p-adic completion, and finite free adic base change.

Every Taylor map \(H_\mathbb Z\to\mathbb Z[\zeta][[q-\zeta]]\) is also
not surjective. At order one, \((2-q)^{-1}\) is a power series but cannot
come from the full ring: if it did, injectivity would make \(2-q\) a unit,
contradicting its value three at \(q=-1\). At order \(n\geq2\), use
\((1+\Phi_n(q))^{-1}\). Its constant at \(\zeta\) is one, but its
value at \(q=1\) is \(1+p\) for a prime-power order and two otherwise,
both nonunits. For \(n\geq3\), even the first-order jet \(q-\zeta\)
is missing: a polynomial with zero value at \(\zeta\) has linear
coefficient divisible by \(\Phi_n'(\zeta)\), a nonunit since the
cyclotomic discriminant has absolute value greater than one. For example
the discriminants at orders three, four and five are \(-3,-4,125\).
**Source and argument:** H, §1, p. 1128, for the Taylor non-surjectivity
claim; the unit-evaluation argument supplies all orders beyond the
restriction cases of Proposition 7.4. **Prerequisites:** Taylor injectivity,
HC.3 evaluation, and cyclotomic values at one and discriminants. The
rational contrast is proved in HC.5.
### Universal Taylor collections and finite filtrations

The coefficient algebra for order \(m\geq1\) is always

\[
 A_m(R)=R[q]/(\Phi_m(q))
       =R\otimes_\mathbb Z\mathbb Z[\zeta_m].
\]

Its universal root \(z_m\) has monic reduced representatives of degree less
than \(\varphi(m)\). Define
`TaylorProduct R = ∏ m>0, A_m(R)[[u]]`. For \(l\geq1\), let
`taylorCoeff m l` be the coefficient of \(u^{l-1}\); define
`gamma m l j` as the jth coefficient of its reduced representative,
\(0\leq j<\varphi(m)\). Supply coefficient extensionality and
coefficient-ring maps with identity, composition, and `map_gamma` equations.
The zero collection has all coordinates zero. The one collection has
\(\gamma_{m,1,0}=1\) and its other allowed coordinates zero.

This algebra keeps all cyclotomic components after a coefficient change.
For example, \(A_4(\mathbb Q(i))\) has rank two over \(\mathbb Q(i)\);
evaluation \(q\mapsto i\) kills the nonzero class \(q-i\). Replacing
\(A_4(\mathbb Q(i))\) by one embedded copy of \(\mathbb Q(i)\) loses a
component and invalidates the finite-rank comparison. **Source:** G, §5.1,
(298)–(300), p. 59, with the universal tensor coefficient algebra appropriate
to arbitrary base change; §1.4, p. 7. **Prerequisites:** HC.1 monic
quotients, `AdjoinRoot`, and HC.3 Taylor coefficients.

For comparison precision \(N\geq1\), define the ideal

\[
 H_{R,N}=\ker\bigl(H_R\to R[q]/(P_{N-1})\bigr).
\]

The full kernel theorem of HC.1 gives
\(H_{R,N}=P_{N-1}H_R\). An element belongs to it exactly when all its
one-based normalized digit polynomials of index \(n<N\) vanish.
Prove `hFiltration_eq_principal`, `mem_hFiltration_digits`, antitonicity,
zero intersection, and the R-algebra quotient equivalence
\(H_R/H_{R,N}\simeq R[q]/(P_{N-1})\). At \(N=1\) the ideal is the
whole ring and the quotient is zero. At \(N=2\), membership is vanishing
of the order-one constant Taylor coefficient. Over \(\mathbb Z\),
\(P_{N-1}\) belongs to \(H_{\mathbb Z,N}\) and not to
\(H_{\mathbb Z,N+1}\). **Source:** G, §5.1, (301)–(303), p. 60.
**Prerequisites:** HC.1 completed kernels and HC.2 normalized digits.

Define `pFiltration R N` on the Taylor product by

\[
 P_{R,N}=\{f:\ C_{m,l}(f)=0\text{ whenever }ml<N\}.
\]

Equivalently, its order-m component is divisible by
\(u^{\lfloor(N-1)/m\rfloor}\). It is an ideal, antitone in \(N\), starts
at the whole product for \(N=1\), and has zero intersection. Define
`jetCoordinates N` by the finite list of \(\gamma\)-coordinates with
\(ml<N\), and prove its kernel is exactly \(P_{R,N}\).
At precision three, this kills coefficients zero and one at order one,
and coefficient zero at order two; higher orders are unrestricted. A
collection supported at order two with value \(u\) belongs to
\(P_{\mathbb Z,4}\) but not \(P_{\mathbb Z,5}\), since that coefficient
has weight four. This test rules out an unshifted or unweighted filtration.
**Source:** G, §5.1, (304)–(305), p. 60; coordinates (299)–(300), p. 59.
**Prerequisites:** the universal Taylor product and power-series ideals.

The associated graded pieces, taken as quotients of R-submodules of nested
ideals, have R-linear equivalences

\[
 H_{R,N}/H_{R,N+1}\simeq_R R[q]/(1-q^N),\qquad
 P_{R,N}/P_{R,N+1}\simeq_R\prod_{m\mid N}A_m(R).
\]

The first sends \([g]\) to \([P_{N-1}g]\); the second extracts the
coefficient of \(u^{N/m-1}\) at each divisor \(m\) of \(N\).
These are linear equivalences, not unital ring equivalences of the graded
ideals. Their ranks are \(N\), since
\(\sum_{m\mid N}\varphi(m)=N\). State the finite rank conclusion with
\(R\ne0\), while the basis index cardinalities hold for every ring.
**Source:** G, §5.1, (308)–(309), p. 61. **Prerequisites:** completed
principal-kernel regularity, normalized monic quotient bases, and the totient
divisor sum.

At finite precision use the digit basis
\(q^kP_{n-1}\), \(1\leq n<N\), \(0\leq k<n\), ordered by increasing
\(n\), then increasing \(k\). The finite Taylor quotient has basis
\(z_m^ju^{l-1}\) supported in component \(m\), for \(ml<N\) and
\(j<\varphi(m)\), ordered by increasing weight \(ml\), decreasing \(m\)
within a weight, then increasing \(j\). Each basis has
\(d_N=N(N-1)/2\) elements. Its coordinate map is respectively
`digitCoordinates N` or `jetCoordinates N`. Compatible finite Taylor
quotients reconstruct a unique whole Taylor collection: each coefficient
is eventually retained, and transition compatibility fixes its value.
Include this reconstruction as a theorem, rather than assuming a general
limit interchange. **Sources:** G, (299)–(300), pp. 59–60; (303), p. 60;
(309) and the discussion before (312), p. 61.
**Prerequisites:** both filtrations, finite monic bases, and coefficient
extensionality.

### The filtered comparison and its leading coefficient

Define `iota : H_R →ₐ[R] TaylorProduct R` by

\[
 \iota(h)_m=h\bigl(z_m(1-u)\bigr).
\]

Construct it from HC.3's additive Taylor map with zero-constant-term change
of variable \(X=-z_mu\). On polynomials the kth coefficient is
\((-z_m)^kD_kg(z_m)\). Give `iota_fromPoly`, the coefficient formula,
coefficient-ring naturality, and compatibility with the completed factorial
projection. Its values on one and q are respectively one and
\(z_m-z_mu\). At order one, odd additive Taylor coefficients change sign;
the map must not silently identify the two conventions. **Source:** G,
§5.1, (298), p. 59. **Prerequisites:** HC.3 Taylor maps and the universal
coefficient algebra.

For every \(n\geq0,m\geq1\), prove that
\(P_n(z_m(1-u))\) is divisible by \(u^{\lfloor n/m\rfloor}\).
This is a lower bound on vanishing order over arbitrary \(R\), not an
assertion of exact order: the leading integer can vanish in a torsion ring.
It proves \(\iota(H_{R,N})\subset P_{R,N}\) and defines the finite
R-algebra map

\[
 \operatorname{finiteIota}_{R,N}:R[q]/(P_{N-1})
                    \longrightarrow\operatorname{TaylorProduct}(R)/P_{R,N}.
\]

Its polynomial equation, coefficient base-change square, precision
transition square, and compatibility with \(\iota\) on arbitrary
completed elements are required API. **Source:** G, §5.1, before (304) and
(306), pp. 60–61. **Prerequisites:** factorial factors, the two filtrations,
and polynomial Taylor substitution.

For positive \(m,l\), define

\[
 D_{m,l}=m^{2l-1}(l-1)!.
\]

It is positive and obeys \(D_{m,l+1}=m^2lD_{m,l}\). Prove first in
\(A_m(\mathbb Z)\) that
\(\prod_{r=1}^{m-1}(1-z_m^r)=m\), then transport that polynomial identity
to every \(R\). The empty product at \(m=1\) is one. Applying it to the
complete blocks of nonmultiples of \(m\), and taking the first terms at
the multiples of \(m\), gives

\[
 P_{ml-1}(z_m(1-u))=D_{m,l}u^{l-1}\pmod {u^l}.
\]

All lower coefficients vanish. The calculation must establish the identity
universally, rather than cancel factors over an arbitrary coefficient ring.
Tests are \(D_{1,4}=6\), \(D_{m,1}=m\), and \(D_{2,2}=8\); the last
rules out losing one of the complete nonmultiple blocks.
Under the graded equivalences, the comparison therefore sends

\[
 [g]\longmapsto
       \bigl(D_{m,N/m}g(z_m)\bigr)_{m\mid N}.
\]

No derivative of \(g\) occurs in the first surviving coefficient.
**Source:** G, §5.1, (310)–(311), p. 61, with the calculation following
(310). **Prerequisites:** universal cyclotomic root products and factorial
vanishing; the two graded equivalences.

The simultaneous remainder map
\(E_N:R[q]/(q^N-1)\to\prod_{m\mid N}A_m(R)\) is injective for
\(\mathbb Z\)-torsion-free \(R\). One can first prove the integral
finite free statement and then use the injective coefficient map
\(R\to R\otimes\mathbb Q\), or the integral determinant description
below; no characteristic-zero domain hypothesis is necessary. It becomes
an isomorphism for a \(\mathbb Q\)-algebra, since the different cyclotomic
factors are comaximal. Multiplication by each \(D_{m,l}\) is likewise
injective in the torsion-free case and invertible in a \(\mathbb Q\)-algebra.

Deduce injectivity of the graded Taylor map, then of every finite Taylor
map, and finally of the joint map \(\iota\), for torsion-free \(R\).
For a \(\mathbb Q\)-algebra, prove bijectivity successively on the graded
pieces and finite quotients, then reconstruct the unique full preimage.
Thus `rational_taylor_isomorphism` gives
\(H_R\simeq_R\operatorname{TaylorProduct}(R)\) for a
\(\mathbb Q\)-algebra. This is a statement about completing the new
coefficient ring, not about tensoring an infinite integral completion.
**Source:** G, §5.1, discussion after (306), (307), and after (311),
p. 61. **Prerequisites:** finite Taylor transitions, graded leading
coefficients, simultaneous remainders, and both finite reconstruction
theorems. A joint injection need not make any one component injective;
\(H_\mathbb Q\) is the main counterexample.

### Integral matrices, determinant factors, and congruences

Define `taylorMatrix N` to be the integer matrix \(M_N\) of
\(\operatorname{finiteIota}_{\mathbb Z,N}\) in the two pinned bases.
Its entry in row \((m,l,j)\) and column \((n,k)\) is the jth coefficient
of the reduced cyclotomic representative of

\[
 [u^{l-1}]\;z_m^k(1-u)^kP_{n-1}\bigl(z_m(1-u)\bigr).
\]

The finite map over any \(R\) has matrix the entrywise integer cast of
\(M_N\). Prove the matrix equation
\(M_N\operatorname{digitCoordinates}_N(h)
=\operatorname{jetCoordinates}_N(\iota h)\) for completed \(h\), using
the finite projection compatibility. An entry is zero whenever the row
weight \(ml\) is smaller than the column index \(n\), giving block lower
triangularity. This statement incorporates the specified row ordering and
does not rely on an unpinned determinant sign.

At precision one the matrix is empty, with determinant one. At precision
three it and its signed adjugate are

\[
 M_3=\begin{pmatrix}1&0&0\\1&2&-2\\0&1&1\end{pmatrix},\qquad
 M_3^*=\begin{pmatrix}4&0&0\\-1&1&2\\1&-1&2\end{pmatrix}.
\]

The last entry of \(M_3\) is positive one: the coefficient of \(u\)
in \(q(1-q)\) at \(q=1-u\) is one. This test catches use of the additive
coordinate in a multiplicative-coordinate matrix. **Source:** G, §5.1,
before (312) and (312), pp. 61–62. **Prerequisites:** finite digit and jet
bases, coefficient extraction, and monic reduced representatives.

For monic integral \(f,g\), prove that the simultaneous remainder map
\(\mathbb Z[q]/(fg)\to\mathbb Z[q]/(f)\oplus\mathbb Z[q]/(g)\)
has absolute determinant \(|\operatorname{Res}(f,g)|\) in monomial
quotient bases. This determinant theorem does not require integral
comaximality. Iterating it over the cyclotomic factors of \(q^N-1\) gives

\[
 D_2(N)=|\det E_N|
 =\prod_{\substack{d<e\\d,e\mid N}}
        |\operatorname{Res}(\Phi_e,\Phi_d)|.
\]

The resultant formula shows that a pair \(e/d=p^a\) contributes
\(p^{\varphi(d)}\), while every other pair contributes one. This positive
integer formula is preferable to introducing square roots of discriminants.
For \(N=1,\ldots,8\) it gives
\(1,2,3,8,5,72,7,128\). Define
\(D_1(N)=\prod_{m\mid N}D_{m,N/m}^{\varphi(m)}\).
The absolute determinant of the Nth graded comparison is
\(D_1(N)D_2(N)\), and both factors are positive. **Source and argument:**
G, Proposition 5.1, (314)–(315), p. 62; the remainder/resultant argument
gives its integral determinant form. **Prerequisites:** HC.4 cyclotomic
resultants, the graded map, and Mathlib determinant operations.

Set \(\delta_N=|\det M_N|\). With precision modulo \(P_{N-1}\), the
correct determinant identity is

\[
 \delta_N=\prod_{1\leq n<N}D_1(n)D_2(n)>0.
\]

In particular \(\delta_1=1,\delta_2=1,\delta_3=4,\delta_4=216\),
\(\delta_5=1327104\), and \(\delta_6=99532800000\).
The upper bound is strictly less than \(N\); a product through \(N\)
would belong to precision \(N+1\). This fixes the indexing of
G, Proposition 5.1, (313), p. 62, relative to its finite quotients
(301)–(306). **Prerequisites:** block triangularity and the graded
determinant theorem. Positivity, including the empty matrix case, is a
separate API lemma.

Define the integral matrix

\[
 M_N^*=\operatorname{sign}(\det M_N)\operatorname{adj}(M_N).
\]

Both \(M_NM_N^*=\delta_N I\) and \(M_N^*M_N=\delta_N I\) hold over
\(\mathbb Z\) and after any coefficient change. Over \(\mathbb Q\),
\(M_N^*=\delta_NM_N^{-1}\). The sign is required when taking the
absolute determinant with the chosen bases. Include all three identities,
the empty matrix case, and the explicit \(M_3^*\) computation above.
Applied to the jet vector \((1,0,0)\), that matrix gives \((4,-1,1)\),
which is not divisible by four coordinatewise. Thus even an integral
collection of finite jets need not be an integral Habiro jet.
**Source:** G, §5.1, Proposition 5.2, (319) and its surrounding discussion,
p. 63. **Prerequisites:** determinant positivity and Mathlib adjugates.

For a \(\mathbb Z\)-torsion-free ring \(R\), a finite jet vector
\(\gamma\in R^{d_N}\) lies in the image of the finite Taylor map exactly
when every coordinate of \(M_N^*\gamma\) belongs to \(\delta_NR\).
Membership here means the principal ideal in \(R\), not a congruence in
its fraction field. If \(M_N^*\gamma=\delta_Na\), the two adjugate
identities and torsion-freeness imply \(M_Na=\gamma\). Conversely, a
preimage directly supplies this divisibility. Over a \(\mathbb Q\)-algebra
the condition is automatic.

For a whole collection \(f\), prove the global criterion

\[
 f\in\iota(H_R)\quad\Longleftrightarrow\quad
 \forall N\geq1,\quad
 M_N^*\operatorname{jetCoordinates}_N(f)\in(\delta_NR)^{d_N}.
\]

Finite injectivity makes all finite preimages unique; transition
compatibility therefore makes them compatible with one another. HC.1's
factorial inverse limit reconstructs a completed preimage. Include this
`compatible_finite_preimages` argument explicitly: choosing unrelated
finite preimages without uniqueness would not justify the global claim.
**Source:** G, Proposition 5.2, (317)–(319), p. 63, with the fixed precision
indexing. **Prerequisites:** finite Taylor injectivity, adjugate identities,
factorial inverse limits, and Taylor finite reconstruction.

### Local detection of integral collections

Let \(R=\mathbb Z[1/\Delta]\), where the integer \(\Delta\ne0\), and
let \(d\geq1\). For an integer \(b\), prove

\[
 b\in dR\quad\Longleftrightarrow\quad
 \exists k\geq0,\ d\mid\Delta^kb\text{ in }\mathbb Z.
\]

For \(b\ne0\) this is equivalently
\(v_p(d)\leq v_p(|b|)\) for every prime \(p\nmid\Delta\); handle
\(b=0\) directly. More generally, for \(a\in R\), membership in \(dR\)
is equivalent to membership of its image in \(d\mathbb Z_p\) for every
prime not dividing \(\Delta\). Construct the canonical map to
\(\mathbb Z_p\) using the unit image of \(\Delta\). Denominators in
\(R\) have zero valuation at precisely these tested primes.

Apply this scalar theorem coordinatewise in the adjugate criterion to prove

\[
 f\in\iota(H_{\mathbb Z[1/\Delta]})
 \quad\Longleftrightarrow\quad
 \text{for every }p\nmid\Delta,
 \ f_p\in\iota(H_{\mathbb Z_p}).
\]

Use the same universal Taylor coordinates and cast integer matrices on
both sides. No infinite tensor product or completion is interchanged.
The equivalence works for negative as well as positive \(\Delta\), and
for \(\Delta=\pm1\) it tests every prime. **Sources:** G, §5.1,
(318)–(319), p. 63; §5.2, (332), p. 65.
**Prerequisites:** Mathlib localization away from one element and p-adic
integer valuations, the finite scalar divisibility theorem, and the global
integral image criterion. Projector integrality over a localization uses
the component theory of HC.5 and is illustrated in HC.6.
## HC.5 — Modules, components, and localization

### The exact ordinary functor on polynomial modules

For an R-module \(M\), let \(M[q]\) be Mathlib's polynomial module and
define

\[
 M[q]^S=\varprojlim_{f\in\Phi_S^*}M[q]/fM[q].
\]

Construct `cycloModuleCompletion R S M` as compatible quotient families.
It has an \(R[q]^S\)-module structure, complete separated inverse-limit
topology, and continuous scalar action. Provide the dense polynomial-module
map `of`, compatible projections `proj`, extensionality, and the completed
kernel theorem \(\ker\pi_f=fM[q]^S\). The scalar action must commute with
every projection. For \(M=R\), `selfEquiv` identifies this module with the
ring completion, preserving the polynomial maps, projections, and action.
For \(M=0\) or an empty positive order set it is zero.

An R-linear map \(M\to N\) induces a continuous
\(R[q]^S\)-linear completed map. Include identity and composition, order
restriction with its composition law, and compatibility between module maps
and restriction. Construct `piEquiv` for arbitrary products of modules and
the finite direct-sum version. Products are valid here because quotient
coordinates have finite monic bases and all limits are coordinatewise;
infinite direct sums require a separate comparison map and are not
identified with the completion of the sum.

The ordinary functor \(M\mapsto M[q]^S\) is exact for every coefficient
ring, order set, and R-module. At a finite monic quotient,

\[
 M[q]/fM[q]\simeq_R M\otimes_R R[q]/(f),
\]

and the second factor is finite free. To prove exactness after completion,
choose a cofinal chain starting at one,
\(1=g_0\mid g_1\mid g_2\mid\cdots\). Monic division splits the
successive coordinate blocks and yields an R-linear equivalence, natural
in \(M\),

\[
 M[q]^S\simeq_R
 \prod_{j\geq0}M^{\deg g_{j+1}-\deg g_j}.
\]

This proves injectivity, surjectivity, and exactness for maps of polynomial
modules without asserting a general exactness theorem for inverse limits.
The equivalence is linear; it is not a coordinatewise ring equivalence for
the completed ring. Equal successive indices give zero-sized blocks.
For an empty order set the whole product of blocks is zero.

Construct the natural tensor comparison
\(M\otimes_R R[q]^S\to M[q]^S\) and prove it bijective for finitely
presented \(M\). A finite presentation reduces to finite free modules,
where it is the obvious equivalence, and the exactness theorem handles the
cokernel. It is not bijective for general \(M\). With \(R=\mathbb Z\)
and \(M=\mathbb Q\), the normalized factorial series
\(\sum P_n/n!\) has no common denominator and is outside its image.
For \(M=\bigoplus_{j\geq0}\mathbb Ze_j\), the element
\(\sum e_jP_j\) is a compatible family in the completion but is not
contained in a finite direct sum of completed copies. These are required
tests of the two separate comparison maps.

Reduction modulo two is exact and gives
\(H_\mathbb Z/2H_\mathbb Z\simeq H_{\mathbb F_2}\). The latter ring has
nontrivial idempotents, so exactness does not imply that the quotient is a
domain or that the ideal generated by two is prime. The explicit residue
test is in HC.6. For the kernel theorem at \(f=P_2\), the element
\(q^{-1}-1-q(1-q)=\sum_{n\geq2}q^nP_n\) is a multiple of \(P_2\),
as its projection is zero. **Sources:** H, §7.3, p. 1144; proof of
Lemma 3.1, p. 1131, for monic coefficient blocks.
**Prerequisites:** HC.1 compatible families, completed kernels and cofinal
chains; polynomial modules, finite free quotients, tensor products and
finite presentation in Mathlib.

For an abelian group \(M\), define order adjacency using separation of
the group itself: equality of orders, or a nontrivial p-power ratio with
\(\bigcap p^kM=0\); all pairs are adjacent if \(M=0\). If each element
of \(S\) is joined inside \(S\) to an element of \(S'\), using this
module adjacency, restriction \(M[q]^S\to M[q]^{S'}\) is injective.
Do not substitute separation of an acting coefficient ring for separation
of \(M\). This is the module version of the monic restriction argument,
with the reflexive clause kept explicit. **Source:** H, Theorem 7.1 and
proof, §7.3, p. 1144. **Prerequisites:** the ordinary completed module
construction and the monic separation proof of HC.4, applied to coefficient
modules.

### Comaximal components and the rational case

Let \(S=S_1\sqcup S_2\) and suppose every cyclotomic polynomial from
one side is comaximal with every one from the other. Chinese remainder
at powers and products, followed by the inverse limit, yields a
topological R-algebra equivalence

\[
 R[q]^S\simeq R[q]^{S_1}\times R[q]^{S_2}.
\]

Its components are the restriction maps and its inverse is the compatible
Chinese remainder construction. For a nonzero ring and distinct positive
\(m,n\), the exact criterion for comaximality is: either their ratio is
not a nontrivial prime power, or that ratio is a power of a prime which is
a unit of \(R\). The prime-in-ideal formula proves the latter direction;
if that prime is not a unit, reduction modulo it leaves a positive-degree
monic common factor and proves failure of comaximality.

Define the equivalence relation generated by non-comaximality on \(S\).
For arbitrarily many classes \(C\), prove
\(R[q]^S\simeq\prod_C R[q]^C\), with product topology. One can pass from
the two-part theorem to all classes through the finite-subset limit; every
finite index uses only finitely many classes. Each nonempty class gives a
nonzero factor when \(R\ne0\). At least two classes therefore produce
nontrivial idempotents and zero divisors.

Comaximality is a stronger condition than failure of adjacency for a
general ring. For \(R=\mathbb Z\times\mathbb Q\), orders one and two are
not adjacent because \(R\) is not 2-adically separated, yet two is not a
unit and their cyclotomic polynomials are not comaximal. There is no product
decomposition into their singleton completions. For a Noetherian domain,
separation at every nonunit prime integer follows from the intersection
theorem, so the equivalence classes are exactly the adjacency components.
This includes \(\mathbb Z\), localized integers, \(\mathbb Q\), and
prime fields. **Sources:** H, Lemma 4.1(2), p. 1134; §7.5,
pp. 1145–1146; finite Chinese remainder and the ideal criterion of HC.4.
**Prerequisites:** HC.1 finite-subset limits, HC.4 comaximality and
prime-in-ideal, and Mathlib ideal quotient Chinese remainder.

For a nonzero ring in which every order in \(S\) is a unit, every class
is a singleton, giving

\[
 R[q]^S\simeq\prod_{n\in S}\widehat{R[q]}_{(\Phi_n)}.
\]

If \(S\) has at least two orders it is not a domain. Every restriction to
a smaller order set is surjective; for a proper subset it is not injective.
For nonempty \(S\), the simultaneous evaluation to
\(\prod_{n\in S}R[q]/(\Phi_n)\) is surjective and not injective.
Over \(\mathbb Q\), the nth singleton completion is
\(\mathbb Q(\zeta_n)[[q-\zeta_n]]\): irreducibility gives its residue
field and separability sends \(\Phi_n\) to a uniformizer times a unit.
This agrees with the universal rational Taylor isomorphism of HC.4.
An individual Taylor map is consequently surjective, but not injective if
there is another order in \(S\). Integer-to-rational coefficient change
remains injective; it does not preserve the single-component rigidity
property. **Sources:** H, §7.5, pp. 1145–1146; §1, p. 1128.
**Prerequisites:** comaximal decomposition, HC.1 coefficient change and
single-order adic completions, and HC.4 rational Taylor comparison.

### Inverting primes and domain factors

Let \(R=\mathbb Z[1/\Delta]\), \(\Delta\geq1\). Distinct orders are
adjacent precisely when their ratio is a nontrivial power of a prime not
dividing \(\Delta\). The component classes of all orders are

\[
 S_{\mathbf a}=\{n>0:\ v_p(n)=a_p
                \text{ for each prime }p\mid\Delta\},
 \qquad\mathbf a\in\mathbb N^{\{p:p\mid\Delta\}}.
\]

Construct the component decomposition
\(H_R\simeq\prod_{\mathbf a}R[q]^{S_{\mathbf a}}\), its idempotents,
and the equations for restriction to a union of classes. Each class is
connected and gives a nonzero factor. For \(\Delta>1\), the full ring
has infinitely many factors and is not a domain, although \(R\) is a
domain. Restriction to an order subset is injective exactly when that subset
meets every class. Necessity follows from a missed component idempotent;
sufficiency follows from restriction injectivity in each connected class.
For \(\Delta=1\), the class is all orders and the integral statements
are recovered.

Simultaneous evaluation at all orders is still injective over this localized
ring. On the class indexed by \(\mathbf a\), choose
\(n_0=\prod_{p\mid\Delta}p^{a_p}\). The infinitely many orders
\(n_0\ell\), with prime \(\ell\nmid\Delta\), are adjacent to it.
Apply the evaluation-uniqueness theorem class by class. Evaluation on a
subset missing a class is not injective. This contrast with
\(\mathbb Q\) is essential: inverting finitely many primes leaves enough
adjacency to determine an element by all its values.

At roots of order prime to \(\Delta\), the Taylor map is injective on
the component \(S_{\mathbf0}\), and kills the other components. To prove
the corresponding assertion for **every** component, including orders
divisible by inverted odd primes, supply Galois descent. For a fixed
\(n\in S_{\mathbf a}\), restriction to order \(n\) is injective. Change
coefficients injectively to \(R''=R[\zeta_n]\) and factor \(\Phi_n\)
into its primitive linear root factors. The close-root classes over
\(R''\) are separated by comaximality; each class completion embeds in
one power-series ring by the root-chain theorem and is a domain. The
Galois group of \(\mathbb Q(\zeta_n)/\mathbb Q\) permutes those classes
transitively and fixes the image of \(R[q]^{\{n\}}\). A member of that
image with zero component in one class therefore has zero components in
all classes. Its expansion at any one primitive nth root is injective.
The same argument on a product of two elements proves the singleton
completion, and hence its connected component, is a domain.

The separation needed over \(R''\) is at primes not inverted in \(R\);
it follows for this localized ring of algebraic integers. This argument
does not extend the sufficient prime-separation hypotheses of Theorem 5.2
to arbitrary coefficient domains. For example,
\(\mathbb Z[1/3][q]^{\{3\}}\) is a domain and its Taylor map at
\(\zeta_3\) is injective, although its coefficient ring is not
3-adically separated. After adjoining \(\zeta_3\) the completion splits
into two conjugate linear-root factors; Galois invariance is the reason
one factor still detects elements of the original ring.
**Sources and arguments:** H, Theorem 4.1, pp. 1135–1136; Theorem 5.1,
p. 1137; Theorem 6.1, p. 1139; G, §1.4, Remark 1.2, p. 7, for the
localization component phenomenon. The stated classical domain-factor
result uses the Galois argument above. **Prerequisites:** HC.4 order and
root chains, HC.1 injective coefficient change, comaximal decomposition,
finite cyclotomic Galois theory, and localized integer separation.

The component API uses positive `Δ`, `InvertedPrimes Δ`, the tuple
`ValuationTuple Δ`, and `valuationOrders Δ a`; repeated prime powers in Δ
do not add tuple coordinates. Prove finite indexing of primes, nonempty
connected classes, uniqueness of the tuple of a positive order, and
`LocalizedIntegers.componentEquiv`, with polynomial and restriction equations
and continuity in both directions. `componentIdempotent a` is one in exactly
that factor and zero elsewhere. Include its nonzero value, idempotence,
orthogonality, and the `restrict_injective_iff_meets` and `allValues_injective`
statements. The latter uses genuine universal root evaluations, not merely
all completed singleton restrictions.

For descent, `rootAlgebra Δ n` is the subalgebra generated by all nth roots
inside an algebraically closed characteristic-zero field containing R
faithfully. It is the localized cyclotomic integer algebra, and is p-adically
separated for every prime not dividing Δ. Give the transitivity theorem for
its R-algebra automorphisms on primitive nth roots. Prove joint injectivity
of all its primitive-root Taylor coordinates by linear-factor decomposition
and HC.4's root-chain theorem on each close-root class. Then expose two
naturality equations: every such automorphism fixes the coefficient-change
image of the base completion, and conjugating the coefficients conjugates
the root of a Taylor expansion. Thus zero in one coordinate of a base-image
element implies zero in every coordinate. This proves
`singleton_zero_of_one_taylor`, then `componentTaylor_injective` and
`component_isDomain` by connected restriction. None of these statements
requires p-adic separation at an inverted prime.

Tests of the coefficient ring, tuples and classes are: Δ=1 has one tuple and
its class is all positive orders; Δ=6 imposes both valuations and Δ=12 has
the same zero-valuation class; and Δ=3 with valuation one gives a domain
whose order-three Taylor coordinate detects it. Tests of component equivalence
and projectors are: restrictions to orders coprime to 6 fail injectivity;
distinct class projectors are nonzero and have product zero; their product
coordinates are exactly the respective Kronecker indicators. Tests of the
root-algebra bridge are: degree-one roots give R itself; the primitive cube
roots over Δ=3 are conjugate although their difference is a unit after
adjoining them; and their split completion has two factors while the base
singleton completion is a domain. This last test prevents descent from
being replaced by a false domain assertion about the split coefficient ring.

The coefficient map \(H_\mathbb Z\to H_R\) is injective, but the induced
map \(H_\mathbb Z[1/\Delta]\to H_R\) is not surjective for
\(\Delta>1\). Its source is a domain and has only the trivial
idempotents; its target has the nontrivial component projectors just
constructed. Completion therefore does not commute with inverting a
coefficient prime. This conclusion is stronger than merely observing that
the source coefficient ring is a domain.

### Restriction versus localization of a completed ring

If \(S'\subset S\) is a union of non-comaximality classes, restriction
is the projection onto those factors. Let \(e_{S'}\) be their projector.
Prove surjectivity, kernel generated by \(1-e_{S'}\), and the canonical
identifications

\[
 R[q]^{S'}\simeq e_{S'}R[q]^S
              \simeq R[q]^S[1/e_{S'}].
\]

This is localization at an idempotent. It covers every order subset over
\(\mathbb Q\), and the orders prime to \(\Delta\) over
\(\mathbb Z[1/\Delta]\). In contrast, if an excluded order \(n\) is
not comaximal with an included order \(m\), then \(\Phi_n\) is not a
unit in the restricted completion. The projection modulo \(\Phi_m\)
already detects this failure. Thus localization of the full ring by those
excluded cyclotomic polynomials has no compatible algebra map to the
restricted completion. Over the integers and \(S'=\{1\}\),
\(\Phi_2=2+(q-1)\) is a nonunit of \(\mathbb Z[[q-1]]\);
restriction is injective and not surjective. Restricted completion has
HC.1's completion universal property, which this attempted localization
cannot supply. **Sources:** H, §7.5, p. 1146; Proposition 7.4,
pp. 1144–1145; G, §1.4, Definition 1.1 and following paragraph, p. 7,
for the neighboring restricted-order notation.
**Prerequisites:** the component equivalence, HC.1 universal property,
HC.4 proper restriction maps, and localization away from an idempotent.

For general R, S and \(T\subseteq S\), require
\(\Phi_m\) and \(\Phi_n\) comaximal whenever \(m\in T\),
\(n\in S\setminus T\). `restrictionProjector` is the unique element
restricting to one on T and zero on its complement. State its idempotence,
surjectivity of restriction, and the kernel formula. Construct
`restrictionLocalizationEquiv` from the **actual** Mathlib carrier
`Localization.Away restrictionProjector` to \(R[q]^T\), with the equation
on its canonical map from \(R[q]^S\) and therefore on every polynomial.
For the obstruction, positive m in T and positive n with non-comaximal
\(\Phi_m,\Phi_n\) imply `excludedFactor_nonunit`; no polynomial-compatible
map from the completion localized at \(\Phi_n\) can exist.
Tests are T empty (projector zero, localized zero ring), T=S (projector
one, identity localization), and the integral example T={1}, n=2, where
that compatible map is impossible.

There is a different localization theorem for the full integral domain
\(H_\mathbb Z\). In its fraction field, let \(\Phi^{-1}\) mean inverses
of all positive cyclotomic polynomials. Then prove

\[
 H_\mathbb Z[\Phi^{-1}]
   =H_\mathbb Z+\mathbb Z[q,q^{-1}][\Phi^{-1}],\qquad
 H_\mathbb Z\cap\mathbb Z[q,q^{-1}][\Phi^{-1}]
   =\mathbb Z[q,q^{-1}].
\]

For the first identity use
\(H_\mathbb Z=fH_\mathbb Z+\mathbb Z[q,q^{-1}]\) for each index
product \(f\), a Laurent version of the completed quotient theorem.
For the intersection theorem, an equality \(hx=g\), with \(g\) Laurent
and \(h\) an index product, forces \(x\) to be Laurent; expose this
divisibility form as reusable API. The ambient fraction field and the
embedding of the rational function field must be explicit. These
localizations do not identify any arbitrary restricted-order completion.
**Sources:** H, §7.2, Propositions 7.2 and 7.3, pp. 1142–1143.
**Prerequisites:** HC.2 Laurent presentation, HC.4 integral domain theorem,
HC.1 completed finite quotient decomposition, and fraction fields.

Use `HabiroFractionField = FractionRing (HabiroRing ℤ)` after HC.4's
integral-domain instance. `rationalFunctionsToHabiroFraction` embeds
\(\operatorname{Frac}(\mathbb Z[q])=\mathbb Q(q)\) and commutes with the
polynomial maps. Define denominator monoids by mapping the actual
cyclotomic index monoid into the completed and Laurent rings, and take their
Mathlib `Localization` carriers. Both embed into this same fraction field,
with injectivity and their canonical-map equations. Characterize each image
by one numerator and one finite index denominator. State Proposition 7.2
as equality of the completed localization image with all sums of a completed
element and a localized Laurent element, and Proposition 7.3 as the image
intersection identity. Keep the divisibility theorem `mem_range_fromLaurent_of_mul`
as the reusable argument for the intersection. Tests are denominator one
for an arbitrary completed element, \((q-1)^{-1}\) in the localized Laurent
image but outside the completion, and \(q^{-1}\) already in both original
rings. These tests constrain the ambient embeddings as well as the fractions.

### The boundary with derived completion

For the imported derived completion of **HabiroRings:HR.2**, prove that
the derived Habiro completion of a Laurent-polynomial module
\(M[q,q^{-1}]\) is static and agrees with the ordinary full completion
\(M[q]^{\mathbb N_{>0}}\). Multiplication by \(q^m-1\) is injective on
every such Laurent-polynomial module, even when \(M\) has coefficient
torsion. The finite quotient transitions are surjective; there is no
derived-limit correction on these polynomial modules. Use the divisibility
presentation of HC.1 to make the comparison natural in \(M\) and
compatible with finite projections. The derived carrier and the term
“static” come from HR.2; do not introduce an uninterpreted proposition or
private derived object here.

Ordinary completion on arbitrary \(R[q]\)-modules is not exact. At
\(t=q-1\), consider
\(0\to\bigoplus_{k\geq1}\mathbb Z[q]\to
\bigoplus_{k\geq1}\mathbb Z[q]\to
\bigoplus_{k\geq1}\mathbb Z[q]/(t^k)\to0\), where the first map is
multiplication by \(t^k\) on the kth summand. The family \((t^k)_k\)
belongs to the completed middle module and maps to zero on the right.
Its prospective preimage would have all coordinates one and is not in
the completed left direct sum, since its reduction modulo \(t\) has
infinite support. This does not contradict the exactness of
\(M\mapsto M[q]^S\), which varies the coefficient module instead of an
arbitrary q-module. **Source and comparison:** H, §7.1, p. 1142, for the
Laurent completion; HR.2's derived Habiro completion interface for the
derived object. **Prerequisites:** HC.1 divisibility-indexed adic
presentation, HC.2 Laurent equivalence, HC.5 polynomial-module exactness,
and HabiroRings:HR.2/habiro-complete-modules. All other classical results
here are independent of that derived construction.
## HC.6 — Reference calculations and the exported interface

Export the `QToolkit` API of HC.1 directly to QM.0, arithmetic q-series,
and quantum-topology consumers: its integral polynomial forms, coefficient
maps, formal coefficient series, and specified convergence topologies are the
shared definitions. The identities below use that toolkit together with the
completed-ring interfaces; they introduce no second elementary q-calculus.

These examples are specifications for the completed objects, their finite
projections, and their comparison maps. Finite polynomial calculations
should be proved in the quotient in which they are asserted and then related
to the completed element by a projection theorem. A single finite
idempotent does not by itself specify an infinite completed idempotent; the
compatible Chinese remainder projectors of HC.5 provide the latter.

### Integral values, derivatives, and units

All assertions in this subsection use \(H_\mathbb Z\), unless a smaller
order set is named. Evaluation and expansion at \(q=1,-1\) are ring maps;
the expansions are injective and have proper image. Besides the witness
\((2-q)^{-1}\) from HC.4, \((3-2q)^{-1}\) is a power series at one
which does not come from the two-order completion or the full ring.
Re-expansion from one to minus one in \(\mathbb Z_2\) sends it to
\(1/5\), whereas an element from the two-order completion has an
integral value at minus one. A primitive cube root \(\omega\) gives
evaluation in \(\mathbb Z[\omega]\), with values that need not lie in
\(\mathbb Z\).

For \(1-q=P_1\), the normalized digits are \(0,1,0,\ldots\) and the
root value is \(1-\zeta\). It is not a unit of the full ring, since its
value at one is zero, and not a unit in the integral order-two completion,
since its value at minus one is two. In the order-six completion it is a
unit:

\[
 (1-q)^{-1}=q\sum_{k\geq0}\Phi_6^k,
 \qquad (1-q)q\sum_{k=0}^K\Phi_6^k
                    \equiv1\pmod{\Phi_6^{K+1}}.
\]

More generally, \(1-q\) is a unit of \(\mathbb Z[q]^S\) exactly when
\(S\) contains neither one nor a prime-power order. If all its residue
values are units, the polynomial is coprime to each index product, giving
compatible inverses in all quotients. The standard values
\(\Phi_n(1)=p\) for \(n=p^a\), and one for the other \(n>1\), give
the stated criterion. It includes the zero completion when \(S\) is empty.

The Kontsevich element has normalized digits all one. At orders one
through six its values are

| Root | Value of F |
| --- | --- |
| \(1\) | \(1\) |
| \(-1\) | \(3\) |
| \(\omega\), primitive of order three | \(5-\omega\) |
| \(i\) | \(8-3i\) |
| \(\zeta_5\) | \(9-5\zeta_5-3\zeta_5^2\) |
| \(\zeta_6\) | \(17-13\zeta_6\) |

Each value is computed from \(\sum_{n<d}P_n\) for the order \(d\),
and adding more terms does not change it. At one its coefficients in
\(q-1\) are alternating Fishburn numbers:
\(1,-1,2,-5,15,-53,217,-1014,5335,-31240,\ldots\).
The coefficient of degree \(k\) needs only \(n\leq k\). At minus one,
the first seven coefficients are
\(3,11,72,635,7085,95911,1528541\), with terms
\(n\leq2k+1\) sufficient for degree \(k\). At \(\omega\) the first
three coefficients in \(q-\omega\) are
\(5-\omega,49+40\omega,128+693\omega\). These are finite Hasse
coefficient computations in the corresponding cyclotomic quotient.

For the inverse of q, verify at every \(N\) the identity
\(q\sum_{n<N}q^nP_n=1-P_N\), its root value \(\zeta^{-1}\), and
its Taylor expansion \(\sum_{k\geq0}(-1)^k(q-1)^k\) at one. The
product \(Fq^{-1}\) has normalized digits \((n+1)q^n\). Verify the
normalized \(F^2\) calculation of HC.2 through \(P_4\), instead of
convolving the digits without carries. Finally, the formal series
\(\sum q^n\) does not define a Habiro element: its partial sums have
value \(N\) at one and are not Cauchy in the discrete evaluation quotient.
The usual algebraic geometric-series manipulation would incorrectly make
the nonunit \(1-q\) invertible.

**Sources:** H, §1, p. 1128; Proposition 7.1, pp. 1141–1142; proof of
Proposition 7.4(1), p. 1145; Fishburn generating function in OEIS A022493.
The displayed values and coefficients are determined by the finite
polynomial computations above. **Prerequisites:** HC.2 digit arithmetic and
q-inversion, HC.3 evaluation and coefficient formulas, HC.4 Taylor rigidity
and proper restriction images.

### Matrix recovery and projector digits

At comparison precision five, the ten digits of \(F\), in the fixed
one-based coordinate order, are
\((1,1,0,1,0,0,1,0,0,0)\). Their matrix image is

\[
 M_5(1,1,0,1,0,0,1,0,0,0)^{\mathsf T}
       =(1,3,1,5,-1,2,8,-3,11,5)^{\mathsf T}.
\]

Change just the first jet from one to two. Rational inversion then gives
the digit vector

\[
 (2,3/4,1/4,65/72,-1/72,17/72,
                    275/288,-7/144,1/32,17/72).
\]

Since these digits are not integral, no integral completed element has
the altered jet vector. This tests both the finite matrix calculation and
the integral image theorem. **Source:** G, §5.3, Example 5.6,
(334)–(337), p. 66. **Prerequisites:** HC.4 finite bases, matrix equations,
and image congruences; HC.2's definition of \(F\).

Let \(e\in H_\mathbb Q\) be the rational preimage of the constant
Taylor collection which is one at odd orders and zero at even orders.
The rational Taylor isomorphism makes this preimage unique and proves it is
an idempotent different from zero and one. HC.5 identifies it with the
odd-order projector over \(\mathbb Z[1/2]\), so it belongs to the image
of \(H_{\mathbb Z[1/2]}\) in \(H_\mathbb Q\), and it cannot belong to
\(H_\mathbb Z\), a domain. Its first four one-based normalized digit
polynomials are

\[
 1,\quad\frac{-1+q}{4},\quad\frac{1-q+q^2}{8},\quad
             \frac{-5+2q+q^2+4q^3}{32}.
\]

Define \(g(q)=e(q^2)-e(q)\) using HC.3's positive power map. The order
of a squared root is \(m/\gcd(m,2)\); consequently the Taylor component
of \(g\) is the constant one at orders \(m\equiv2\pmod4\), and zero
at the other orders. It is the exponent-one component idempotent over
\(\mathbb Z[1/2]\), with first digits

\[
 0,\quad\frac{1-q}{4},\quad\frac{-1+q-q^2}{8},\quad
                 \frac{1-2q+3q^2-4q^3}{32}.
\]

These examples require the localization component theorem, in addition to
the rational inverse matrix. Rational finite digits alone do not prove
integrality of the whole preimage over \(\mathbb Z[1/2]\).
**Source:** G, §5.3, Example 5.7, (338)–(341), p. 66.
**Prerequisites:** HC.4 rational Taylor reconstruction and finite matrices;
HC.5 localized components; HC.3 the square substitution map.

### Localization, rational kernels, and reduction modulo two

Over \(R=\mathbb Z[1/2]\), the order components are
\(S_a=\{n:v_2(n)=a\}\). The odd projector \(e_0\) has representatives

\[
 e_0\equiv(3+2q-q^2)/4\pmod{P_2},\qquad
 e_0\equiv(7+2q-q^2+q^3-2q^4+q^5)/8\pmod{P_3}.
\]

The second reduces to the first. Modulo \(P_3\) it is one modulo
\((q-1)^3\Phi_3\), zero modulo \(\Phi_2\), and idempotent.
The full projector is the component limit, and \(1-e_0\) is nonzero,
has value one at minus one, and is killed by the Taylor map at one and
restriction to order one. Both maps are injective over the integers, so
this explicitly tests the loss of connectedness after coefficient
localization. Evaluation at all orders nevertheless remains injective.
In the localized order-two completion,

\[
 (1-q)^{-1}=\sum_{k\geq0}\frac{\Phi_2^k}{2^{k+1}};
 \quad (1-q)\sum_{k=0}^K\frac{\Phi_2^k}{2^{k+1}}
                     \equiv1\pmod{\Phi_2^{K+1}}.
\]

This does not supply an inverse in the integral order-two completion.

Over \(\mathbb Q\), let \(e_1\) project to the singleton order-one
factor. Its representative modulo \(P_3\) is

\[
 (47+42q+7q^2-23q^3-18q^4+17q^5)/72.
\]

The nonzero element \(t=(q-1)e_1\) is killed by every root evaluation,
and modulo \(P_3\) is represented by

\[
 (-5-2q+3q^2+5q^3+2q^4-3q^5)/12.
\]

Check zero residue modulo \(\Phi_2\Phi_3\) and residue \(q-1\)
modulo \((q-1)^2\). Its nonzero Taylor component at one distinguishes
vanishing of all rational values from vanishing of all Taylor collections.

Finally, over \(\mathbb F_2\) the polynomial \(q^5+q+1\) is idempotent
modulo \(P_3\): it is one modulo \((1+q)^4\) and zero modulo
\(1+q+q^2\). The component decomposition over \(\mathbb F_2\) gives
the full idempotent separating orders \(2^k\) from orders \(3\cdot2^k\).
Together with the reduction isomorphism
\(H_\mathbb Z/2H_\mathbb Z\simeq H_{\mathbb F_2}\), this proves that
\(2H_\mathbb Z\) is not a prime ideal. Check the finite idempotency
equation in the characteristic-two quotient, not as an equality of
integral completed polynomials. **Source and calculations:** H, §7.5,
pp. 1145–1146, for the component mechanism; the displayed representatives
solve the stated finite Chinese remainder congruences.
**Prerequisites:** HC.5 exact coefficient reduction and component
decomposition, HC.2 normalization, and HC.3 values and Taylor maps.

### Implementation order and acceptance contract

The construction sequence is determined by the dependencies:

1. Build actual polynomial indices, compatible completion families, their
   topology, finite quotient kernels, and cofinal presentations in HC.1.
2. Build arbitrary convergent factorial sums, then unique bounded-degree
   digits and finite arithmetic in HC.2. Derive q-inversion and the Laurent
   presentation from the finite telescoping equation.
3. Build universal root evaluation and Hasse Taylor coefficients in HC.3,
   then naturality and continuous p-adic re-expansion.
4. Build cyclotomic ideal lemmas, order and monic chains, finite-domain
   separation transfer, and the individual rigidity theorems in HC.4.
   Independently construct universal Taylor filtrations and their finite
   bases; derive the graded leading factors, finite comparisons, matrices,
   and integral image congruences.
5. Build the exact polynomial-module functor and comaximal component
   decomposition in HC.5. Derive rational and localized-integer behavior,
   Galois domain factors, and localization comparisons. The derived
   comparison consumes HR.2's existing supplier interface.
6. Prove the examples in HC.6 using their completed projection equations.
   In particular the projector digit calculations use both HC.4 and HC.5.

The completion API is accepted when maps can be evaluated at a finite index
without unpacking a raw compatible family, their compositions reduce to
the expected polynomial maps, and cofinal replacements preserve those maps.
The expansion API is accepted when digit extraction and reconstruction are
inverse and multiplication agrees with each finite polynomial quotient.
The root API is accepted when it works in torsion coefficient algebras
through the cyclotomic equation, exposes Hasse coefficients, and translates
only under the stated convergence conditions.

The rigidity API must retain connectedness, the inside-set chain condition,
prime separation, and the infinite-adjacency condition in the corresponding
theorems. The Taylor comparison must use universal root algebras and the
strict precision bound \(ml<N\), provide both adjugate identities, and
reconstruct a global preimage from compatible finite preimages. The module
API must prove exactness for polynomial coefficient modules, products and
finite presentations with the declared generality, while the q-torsion
counterexample remains a separate statement. The examples above exercise
these contracts through ring maps and quotient maps, rather than treating
the displayed series as unsupported formal symbols.

## References

- **H.** Kazuo Habiro, *Cyclotomic completions of polynomial rings*,
  Publications of the Research Institute for Mathematical Sciences **40**
  (2004), 1127–1146.
  [Publisher page](https://ems.press/journals/prims/articles/2364),
  [public journal PDF](https://ems.press/content/serial-article-files/40881),
  [DOI](https://doi.org/10.2977/prims/1145475444).
  Journal theorem numbers and printed pages are used above.
- **H₀.** Kazuo Habiro, *Cyclotomic completions of polynomial rings*,
  [arXiv:math/0209324v1](https://arxiv.org/abs/math/0209324v1),
  24 September 2002,
  [PDF](https://arxiv.org/pdf/math/0209324v1).
  The recursive monic expansion in the proof of Lemma 3.1, p. 7, is cited
  from this version; its locators should not be read as journal locators.
- **G.** Stavros Garoufalidis, Peter Scholze, Campbell Wheeler and Don Zagier,
  *The Habiro ring of a number field*,
  [arXiv:2412.04241v2](https://arxiv.org/abs/2412.04241v2),
  27 August 2025,
  [PDF](https://arxiv.org/pdf/2412.04241v2).
  The ordinary Taylor comparison uses §5.1, pp. 59–63, and Examples 5.6–5.7,
  p. 66. Its precision \(N\) is modulo \(P_{N-1}\), giving the determinant
  product over \(n<N\). Statements about arbitrary coefficient rings use
  universal cyclotomic algebras, and injectivity uses integer torsion-freeness.
  The arithmetic ring of Definition 1.1, p. 7, is a separate object owned
  by HabiroNumberFields.
- **A.** Tom M. Apostol, *Resultants of cyclotomic polynomials*, Proceedings
  of the American Mathematical Society **24** (1970), 457–462.
  [DOI](https://doi.org/10.1090/S0002-9939-1970-0251010-X),
  [publisher PDF](https://www.ams.org/journals/proc/1970-024-03/S0002-9939-1970-0251010-X/S0002-9939-1970-0251010-X.pdf).
  Theorems 1, 3 and 4 give the absolute resultant formula, including the
  order-one case.
- **W.** Ferdinand Wagner, *q-Witt vectors and q-Hodge complexes*,
  [arXiv:2410.23078v5](https://arxiv.org/abs/2410.23078v5),
  6 October 2025,
  [PDF](https://arxiv.org/pdf/2410.23078v5),
  §2.1, Lemma 2.1, p. 8. Its prime-power quotient formula is used only for
  distinct orders; equal orders retain the integral cyclotomic quotient.
- **O.** Wern Juin Gabriel Ong, notes of Peter Scholze's course
  *V5A2 – The Habiro Ring of a Number Field*, winter 2024/25,
  50-page text corresponding to the 6 March 2025 version.
  [Author's notes page](https://wgabrielong.github.io/notes/),
  [public PDF](https://wgabrielong.github.io/academic-writing/notes/bonn-winter-24-25/V5A2-Habiro-Rings/Habiro_Rings_Notes.pdf).
  Definition 1.1, p. 2; Proposition 1.5 and its t-deformed proof, p. 3;
  Table 1 and Proposition 2.1, p. 7; Propositions 2.2 and 2.5 and
  Corollary 2.6, p. 8; Proposition 2.7, p. 9; Definitions 5.4–5.5,
  pp. 26–27. These supply the elementary toolkit rather than a general
  lambda-ring theory. The raw Proposition 1.5 normalization and the
  convergence topology are specified in HC.1 above.
- **Fishburn numbers.** [OEIS A022493](https://oeis.org/A022493), for the
  integer sequence defined by \(F(1-x)\). The finite factorial calculations
  specify the coefficients used in the examples, independently of a
  numerical sequence lookup.
