# Elliptic curves, Part II: scheme K-theory and arithmetic symbol classes — E.5

This part plans the functorial and finite-field computations of K-theory for
elliptic curves. It continues the accepted
[parent blueprint](../packets/EllipticKTheory.json), uses its E.1 scheme and point
comparisons and E.2 rank–Picard calculation, and follows the accepted
[RS-18 boundary](../restructure/RS-18.md). The scope is the single stage
`EllipticKTheory:E.5`. The general constructions of scheme pullback, proper
perfect pushforward, projection formulas and projective bundles are imported
from SchemeKTheoryOperations S.2 and S.5. The elliptic point, isogeny, torsion
and Tate-module theories belong to upstream EllipticCurves; the scheme model
and relative elliptic Picard duality belong to upstream ModularCurves.

The pass is **complete at target level**, with eleven nodes, one construction,
six API entries, five discriminating unit tests and four planet choices. E.5 is
`planned`, with precise supplier requests and gaps; it is not closed. Every
node has implementation status `unchecked`. The missing finite-generation,
Milnor, Geisser–Levine, coefficient and cohomology inputs are mathematical work
for their named suppliers. Their absence is not hidden by treating a similarly
named theorem as an import.

## Conventions and inherited objects

Let E be a smooth projective geometrically integral genus-one curve over a
field k with a k-rational origin O. The parent supplies the comparison with a
nonsingular Weierstrass equation W, its existing nonsingular-point group, its
function field, and the scheme model imported from ModularCurves. A nonzero
isogeny has a finite flat scheme morphism. The constant-at-origin group map
has no finite isogeny degree and is excluded from that assertion.

K denotes the actual scheme K-theory of perfect complexes supplied by S.2;
in nonnegative degrees it agrees with the regular scheme/vector-bundle
comparison used in the parent. The regular-curve identification K=G and the
localization sequence are imported. We do not create a new K-functor. Products
mean the K₀-module action on K_n, or the tensor-product ring structure on K₀.
A direct sum of additive groups must not be mistaken for a product ring.

For a finite field k of characteristic p and size q, fix an algebraic closure
kbar. Write σ for **arithmetic Frobenius**, x↦x^q in Gal(kbar/k), and π for the
q-power elliptic Frobenius isogeny. Its point action is σ. Geometric Frobenius
is σ⁻¹. Mathlib already provides the additive point map associated to the
q-power algebra homomorphism; its agreement with the upstream isogeny action
is an import, not a second definition of Frobenius.

For ℓ≠p put D_ℓ=Q_ℓ/Z_ℓ and D=⊕_{ℓ≠p}D_ℓ. In D_ℓ(j), arithmetic Frobenius
acts by q^j. The point group E(kbar)[ℓ∞] already carries π; an additional twist
j changes that action to q^jπ. This convention fixes the exponent in every
even-degree formula below. The roots-of-unity notation in the source is
translated into D_ℓ(j), rather than receiving an unintended extra twist.

## Operations and the determinant obstruction

The node `elliptic-operation-comparisons` specializes the existing scheme
operations to an isogeny f:E′→E. Finite flatness makes f proper and perfect.
Its pullback is Lf* and its pushforward is Rf*. On finite affine restrictions
Spec B→Spec A, B is locally free over A. Derived direct image is therefore the
same exact restriction-of-scalars construction that gives the classical
finite-flat transfer, in every nonnegative K-degree. The identity, composition
and comparison maps are those of S.2. This assertion covers inseparable
isogenies as well as separable ones; an étale hypothesis is unnecessary here.

The node `isogeny-rank-determinant-action` makes the projection formula
computational. For d=deg(f), let L_f=det(f_*O_E′). The parent determinant theorem
and Euler characteristic give rank d and deg(L_f)=0. Identify L_f with a point
P_f under Pic⁰(E)≅E(k). In the parent coordinates (rank, determinant degree,
point), the class and its action are

\[
 [f_*O_{E'}]=(d,0,P_f),\qquad
 f_*f^*(r,e,P)=(dr,de,dP+rP_f).
\]

For every n≥0 the actual formula is

\[
 f_*f^*(y)=[f_*O_{E'}]\,y.
\]

Integral degree multiplication on K₀ holds **if and only if** L_f is trivial:
apply the formula to [O_E]=(1,0,O) for necessity. Triviality of L_f then gives
degree multiplication on every K_n by the same projection formula. Rank alone
does not establish that equality.

The following parent results are retained with their hypotheses. A separable
isogeny of elliptic curves is finite étale; the trace pairing identifies its
pushforward bundle with its dual, so L_f² is trivial. Its class is consequently
d after tensoring with Q. For [m] with m odd and char(k) not dividing m,
pullback trivializes [m]_*O. The Picard-dual multiplication identity
[m]*=[m] on Pic⁰ makes its determinant m-torsion, and the trace pairing makes
it 2-torsion. These conditions force triviality, giving integral multiplication
by m². The Picard identity has a direct request to ModularCurves 2D; it is not
assigned to the Tate-module layer.

A separable degree-two isogeny in characteristic different from two provides
the mandatory counterexample. Half-trace splits f_*O as O⊕L. Since E′ is
geometrically connected, H⁰(E′,O)=k, and the complementary line has no global
sections. It cannot be O. Thus [f_*O]=(2,0,P_f) with P_f≠O, and evaluating on
the unit detects failure of integral multiplication by two. These distinctions
retain the accepted parent's work rather than planning another determinant or
projection-formula theory.

## The projective-line comparison

The node `projective-line-finite-field-comparison` imports the all-degree S.5
projective-line theorem. For π:P¹_k→Spec k and the infinity section σ, the basis
is O,O(-1), and the maps are

\[
 (a,b)\longmapsto \pi^*a+[O(-1)]\pi^*b,
 \qquad x\longmapsto(\pi_*x,\sigma^*x-\pi_*x).
\]

In K₀ the coordinates of a class are (χ,rk−χ), so [O(m)]=(m+1,−m) and
[O_∞]=(1,−1). The sign of O(-1) is fixed by these tests. The generic theorem
and its inverse are S.5's; this node is their elliptic comparison application.

Quillen's finite-field calculation, supplied by KTheoryFiniteLocalFields L.1,
gives for i≥1

\[
 K_{2i}(P^1_{\mathbf F_q})=0,\qquad
 K_{2i-1}(P^1_{\mathbf F_q})\cong(\mathbf Z/(q^i-1))^2.
\]

The odd abstract groups will be the same for E. The even groups record its
elliptic torsion and generally do not vanish. In particular, the example over
F₂ below has K₂(E) of order five, while K₂(P¹)=0.

## Harder finiteness and its producer contracts

The node `harder-elliptic-input-closure` plans the elliptic specialization of
Harder's theorem: K_n(E) is finite of order prime to p for every n≥1.
Its proof has three different low-degree and higher-degree routes.

For n=1, localization relates K₁(E) to the tame residues of k(E). The affine
complement of O has SK₁=0. The **exact** global normed tame reciprocity
sequence, together with the origin splitting, gives K₁(E)≅k×⊕k×. A theorem
saying only that the normed residue composite vanishes cannot prove exactness.
This is the accepted parent's source correction E2. The required strengthened
reciprocity/SK₁ interface is requested from K2SymbolsBrauer T.4.

For n=2, the residue fields are finite and have K₂=0. Parent E.3 consequently
identifies K₂(E) integrally with the tame kernel in K₂(k(E)). Its finiteness and
prime-to-p order require the global function-field tame-kernel input requested
from T.5. The source's citation to III.7.2(a) proves higher Milnor vanishing,
not this tame-kernel theorem; the parent's confirmed source correction E1 is
retained. T.5 currently treats number fields. This request is explicitly an
extension of that general owner, rather than a claim that its present brief
already proves the function-field case.

For n≥3, Bass–Tate gives K_n^M(k(E))=0. The Geisser–Levine comparison says that
the kernel and cokernel of K_n^M(F)→K_n(F) are uniquely p-divisible for a field
F of characteristic p. Therefore multiplication by p is bijective on the
Quillen groups of k(E) in degrees n and n+1. Apply multiplication by p to the
five-term localization segment

\[
 K_{n+1}(k(E))\to\bigoplus_xK_n(k(x))\to K_n(E)
 \to K_n(k(E))\to\bigoplus_xK_{n-1}(k(x)).
\]

The four exterior vertical maps are bijective. The field maps use
Geisser–Levine and Bass–Tate, and the residue maps use Quillen's finite-field
calculation; every closed point, including a non-rational one, has a finite
residue field. The five lemma proves unique p-divisibility of K_n(E). The
initial K_{n+1}(k(E)) term is retained to justify injectivity, not merely
surjectivity, in the middle.

Finally, Quillen/GQ82 finite generation for the affine complement E minus O,
and localization at its single residue field, give finite generation for E.
A finitely generated abelian group on which multiplication by p is bijective
has rank zero and no p-primary component. This proves the higher-degree
finiteness assertion. It does not assume the general Parshin conjecture for
higher-dimensional varieties.

The producer audit matters here. The existing N.3-finite-generation packet
covers number-field rings, with no proper finite-curve theorem. The M.5d packet
supplies Bloch–Gabber–Kato/logarithmic differential results, without the
Geisser–Levine Quillen comparison. Neither is an adequate import for this
proof. The requests name the full needed statements and record the missing
extensions as gaps. The T.5 extension receives both higher Milnor vanishing
and tame-kernel finiteness, as the confirmed red-team finding requests.
T.2:graded-map supplies the natural Milnor-to-Quillen comparison from the
existing Milnor functor; its degree-two Matsumoto theorem is not a replacement
for that graded map or for the function-field vanishing theorem.

## Geometric groups and coefficient degrees

The node `geometric-elliptic-k-modules` uses filtered-colimit compatibility and
Harder finiteness over finite base extensions to show that the positive
geometric groups are torsion with no p-primary part. The equivariant formulas
for i≥1 are

\[
 K_{2i-1}(\overline E)\cong D(i)^2,
 \qquad
 K_{2i}(\overline E)\cong E(\overline k)[\text{prime-to-}p\text{ torsion}](i).
\]

The corresponding divisible-coefficient groups, for ℓ≠p, are

\[
 K_{2i}(\overline E;\mathbf Q_\ell/\mathbf Z_\ell)
   \cong(\mathbf Q_\ell/\mathbf Z_\ell(i))^2,
 \qquad
 K_{2i-1}(\overline E;\mathbf Q_\ell/\mathbf Z_\ell)
   \cong E(\overline k)[\ell^\infty](i-1).
\]

The shift between integral and coefficient degree follows from the actual
universal-coefficient sequence. These are neither an identification of an
integral K-group with its finite-coefficient version nor a completion formula.
The coefficient spectral sequence has only geometric curve cohomological
degrees zero, one and two. Its two even coefficient pieces must be split by
the field/e-invariant summand, with Galois compatibility. An associated graded
calculation alone would leave a group extension unresolved.

The geometric étale inputs are H⁰=D_ℓ(j), H¹=E(kbar)[ℓ∞](j−1), H²=D_ℓ(j−1)
and vanishing above two. They come from Kummer/Jacobian duality and the
normalized curve trace, with E identified with its Jacobian by the origin.
They are requested from EtaleDualityAndPerverseSheaves EDC.2's trace/pairing
interfaces. M.6 owns the motivic/coefficient spectral sequence and M.7 the
ordinary-to-étale comparison in the required degree ranges, including ℓ=2
when ℓ≠p. Curve cohomology and the elliptic Weil bound are not reassigned to
M.7.

## Frobenius descent with the correct range

Let a_q=q+1−#E(F_q), and let α,β be the roots of T²−a_qT+q. The elliptic
Frobenius/Tate comparison of WeightsInEtaleCohomology R34.2 and upstream
EllipticCurves supplies αβ=q and |α|=|β|=sqrt(q). On H¹(Ebar,Q_ℓ), arithmetic
Frobenius has eigenvalues 1/α,1/β. As a multiset these are α/q,β/q. Thus on
the three geometric rational cohomology groups of twist j the eigenvalues are

\[
 q^j;\qquad q^{j-1}\alpha,\ q^{j-1}\beta;\qquad q^{j-1}.
\]

For j≥2 none equals one. Frobenius-minus-one is invertible on the rational
spaces, and is surjective on their divisible quotients. The continuous
procyclic Galois cohomology sequence and cd_ℓ(G)=1 then remove the H¹(G,−)
terms in Hochschild–Serre. The node `elliptic-cohomology-frobenius-descent`
obtains, for r≥0,

\[
 H^r(E,\mathbf Q_\ell/\mathbf Z_\ell(j))
 \cong H^r(\overline E,\mathbf Q_\ell/\mathbf Z_\ell(j))^G
 \cong H^{r+1}(E,\mathbf Z_\ell(j)),\qquad j\ge2,
\]

with vanishing for r≥3. The last isomorphism uses the derived coefficient
triangle and vanishing of rational absolute cohomology in this range.

The restriction j≥2 is essential. In particular H¹(G,Q_ℓ)=Q_ℓ for the trivial
continuous action; an assertion that rational absolute cohomology always
reduces to geometric invariants is false. The parent's confirmed source
correction E5 is used, and the finite-field continuous-cohomology contract is
requested separately from ArithmeticGaloisRepresentations R01.1.

The node `finite-elliptic-k-descent` combines these coefficient calculations
with Harder and the compatible K spectral sequence to prove that the actual
base-change map K_n(E)→K_n(Ebar)^G is an isomorphism for n>0. Degree one uses
the separate reciprocity/origin argument, rather than applying the j≥2 lemma
to weight one. This is the specific positive-degree elliptic computation,
not an unrestricted integral descent theorem for K-theory.

## The twisted Frobenius kernel: definition, API and tests

The construction `twisted-frobenius-kernel` names the subgroup B_i(E,L), for
any field extension L/k and i≥0:

\[
 B_i(E,L)=\{P\in E(L):\exists m>0,\ (m,p)=1,\ mP=O,
                         \quad q^i\pi(P)=P\}.
\]

It uses the existing Weierstrass point group and its field-map action. Closure
under addition uses the product of two prime-to-p annihilators; negation uses
the same annihilator. The additive subgroup supplies the inherited group law.
For L=kbar it is the invariant subgroup of the additional i-th twist of
prime-to-p torsion. The i=0 case is useful for testing the convention and is
not asserted to be the zeroth K-group.

The API namespace is `TauCeti.EllipticK`. The packet's six API entries are:

| Name | Contract |
| --- | --- |
| `twistedFrobeniusKernel` | The subgroup with its inherited additive structure. |
| `mem_twistedFrobeniusKernel` | Exactly the coprime-annihilator and q^iπ-fixed conditions. |
| `zero_mem_twistedFrobeniusKernel` | O belongs, using annihilator one. |
| `baseChange_mem_twistedFrobeniusKernel` | For rational prime-to-p torsion, membership is q^iP=P, equivalently (q^i−1)P=O. |
| `map_twistedFrobeniusKernel` | The existing point map along a k-algebra field map preserves B_i; an isomorphism gives an additive equivalence. |
| `p_torsion_not_mem_twistedFrobeniusKernel` | A p-torsion point in B_i must be O. |

The five named unit tests appear on actual point types in the suggested file.
They test more than closure properties. `test_twistedKernel_origin` includes
O for all i. `test_twistedKernel_rational_two_torsion` uses (0,0) on
E/F₃: y²=x³−x; this nonzero point has order two and belongs to B₁ because
q−1=2. `test_twistedKernel_excludes_characteristic_torsion` uses the rational
point (0,1) on E/F₂: y²+xy=x³+1. It is nonzero of order two and Frobenius
fixed, yet it is excluded from B₀. That test rejects replacing prime-to-p
torsion by all torsion or all rational points.

The two remaining tests are numerical: `test_twistedKernel_F2_card_five`
gives #B₁=5 and #B₀=1 for y²+y=x³+x+1, while
`test_twistedKernel_F2_trace_sign` gives #B₁=13 for y²+y=x³+x. They distinguish
the missing twist and the sign of the trace. Cardinal tests explicitly assert
finiteness; the zero default of a cardinal function on infinite types cannot
serve as evidence.

## Positive K-groups and their orders

The node `positive-odd-elliptic-k-groups` gives, for i≥1,

\[
 K_{2i-1}(E)\cong K_{2i-1}(\mathbf F_q)^2
                 \cong(\mathbf Z/(q^i-1))^2.
\]

At i=1 the natural notation is K₁(E)≅F_q×⊕F_q×, interpreted as additive
groups through Additive. Cyclic generators are noncanonical. This is neither
the elliptic rational point group nor a ring decomposition.

The node `positive-even-elliptic-k-groups` identifies

\[
 K_{2i}(E)\cong B_i(E,\overline k)
 \cong\bigoplus_{\ell\ne p}\ker(1-q^i\pi\mid E(\overline k)[\ell^\infty]),
 \qquad i\ge1.
\]

For each prime, the existing Tate module T_ℓE and V_ℓE=T_ℓE⊗Q_ℓ give a
canonical reformulation

\[
 B_i(E,\overline k)[\ell^\infty]
 \cong\operatorname{coker}(1-q^i\pi:T_\ell E\to T_\ell E).
\]

Indeed 1−q^iπ is invertible on V_ℓE because its eigenvalues q^iα,q^iβ have
absolute value q^(i+1/2)>1. The snake lemma on T_ℓE→V_ℓE→V_ℓE/T_ℓE
identifies the lattice cokernel with the torsion kernel. Taking the invariant
subgroup of the lattice instead would give zero and lose the group. Only the
primes dividing the nonzero determinant contribute, so the expression is a
finite-support direct sum. Its invariant factors depend on the integral
operator; its characteristic polynomial determines the order but need not
determine the group.

Finally, `elliptic-k-group-orders` proves

\[
 \#K_{2i-1}(E)=(q^i-1)^2,\qquad
 \#K_{2i}(E)=1-a_qq^i+q^{2i+1}=:D_i.
\]

The even number is also deg(1−[q^i]π), by the imported quadratic degree form
and Frobenius relation. Its differential is the identity in characteristic p,
so this is a separable isogeny. Its geometric kernel has D_i points. Since
D_i≡1 modulo p, those points are prime-to-p torsion and its kernel is exactly
B_i. The Hasse bound ensures positivity. This route reuses the upstream
degree theory and avoids planning another general lattice-index theory.

| Curve | #E(F_q) | a_q | #K₂(E) | Further check |
| --- | ---: | ---: | ---: | --- |
| F₂, y²+y=x³+x+1 | 1 | 2 | 5 | K₁=0, K₃≅(Z/3)², #K₄=25 |
| F₂, y²+y=x³+x | 5 | −2 | 13 | Odd groups agree with the first curve |
| F₃, y²=x³−x | 4 | 0 | 28 | K₁≅(Z/2)² |

All displayed equations are nonsingular. Counting their affine solutions and
adding O verifies the point counts. The order 25 does not assert that K₄ is
cyclic. These examples also show why the untwisted group E(F_q) is the wrong
even-degree answer.

## Dependency closure, sources and prototype limits

The eleven new IDs are distinct from the accepted parent's IDs. Generic
operations and the parent determinant/projective-line statements remain
imports. The finite-field chain is: explicit Harder inputs → geometric
Galois modules and coefficient calculations → positive K-descent → odd and
even computations → orders. The point-subgroup construction itself uses the
pinned group and field-map API; it does not wait for a K-theory construction.

Fourteen requests identify the remaining producers: N.3 finite generation;
T.2 graded comparison; T.5 higher Milnor vanishing and function-field tame-kernel finiteness; T.4
exact reciprocity; M.5d Geisser–Levine; M.6 spectral sequence; M.7 comparison;
EDC.2 trace and pairings; R01.1 continuous cohomology; upstream EllipticCurves
Layers 1–3; and ModularCurves 2D Picard duality. The requests to stages whose
current briefs are narrower are labelled extensions and accompanied by gaps.
None is reported as a library implementation. The three gap records collect
these precise contracts, rather than an unowned finite-curve theorem.

Four restructuring proposals record the supplier extensions as Part II work:
global function-field S-integers beyond ArithmeticKTheory's number fields;
global function-field vanishing and tame kernels beyond K2SymbolsBrauer's
current arithmetic brief; the characteristic-p Quillen comparison beyond
M.5d's logarithmic differential package; and continuous finite-field
cohomology beyond R01.1's present interface. Each starts from its existing
roadmap. The requests use current supplier stage IDs pending that structural
decision; they do not assert that the expanded scopes already exist.

Primary passages read are Weibel's author-hosted
[Chapter III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf),
[Chapter IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf),
[Chapter V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf) and
[Chapter VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf).
The packet records the SHA-256 hashes, access date and exact chapter locators;
chapter pagination differs from the printed book. VI.6.4's formulas were also
checked on a rendered page. The accepted parent's confirmed corrections E1,
E2, E5 and E6 remain referenced. New sourceIssue E17 records the missing bar
on X in the sentence before VI.6.4's coefficient table; it is scoped to this
author chapter copy. The author's errata URL returned 404, and the published
volume was not independently collated. No claim is made that an author-copy
misprint has been checked against the version of record.

The [suggested Lean file](../suggested/EllipticKTheory--E.5.lean) gives the
actual subgroup, all API entries and all tests, using pinned Mathlib point,
field, algebraic-closure and subgroup types. Its point-kernel order theorem
is also stated. Proofs are prototypes. Higher-K, continuous-cohomology,
finite-coefficient and Tate signatures whose actual supplier objects are
absent are explicitly named comments with their mathematical contracts.
They are not encoded as arbitrary groups or as assumed structures containing
the desired conclusion. The shared build lacks a compiled Tau Ceti
point-count module, so the executable order signature spells out the same
q+1−#E(k) trace expression. Elaborating that file checks its expressed types,
not the omitted supplier-dependent statements or the proposed proofs.

The four planets are **Isogeny projection formula**, **Harder finiteness**,
**Twisted Frobenius kernel**, and **Finite-field elliptic K-groups**. Assembly
can retain the parent's projective-bundle landmark as a fifth. It must choose
a single stage-wide set of at most six, without adding generic S.2
pullback/pushforward as duplicate elliptic constructions.
