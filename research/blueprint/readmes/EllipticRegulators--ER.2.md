# Elliptic Deligne targets and regulator normalisation

ER.2 identifies the real Deligne regulator of an elliptic curve with an explicit
period functional. Its outputs are the target over every archimedean embedding,
the conjugation condition, its real dimension, and the real coordinate for an
oriented curve over \(\mathbb Q\). The normalisation is determined by the Chern
character and the Deligne cup product, before any L-value formula is used.

The generic Deligne complex and regulator belong to the early archimedean part
of `MotivicEtaleKTheory:M.8`. The form on a general curve, its Steinberg relation,
its distributional residues and its comparison with that regulator belong to
`Polylogarithms:P.5`. ER.2 specialises those interfaces to an elliptic curve and
adds its embedding and period coordinates. Integral and rational restriction
from a curve to its function field come from `EllipticKTheory:E.3`.

Suggested home: `TauCeti/NumberTheory/EllipticRegulators/Deligne`. All declaration
names below are in `TauCeti.EllipticRegulators` unless their supplier is named.
This mathematical document is definitive. The suggested file contains proposed
signatures for period models and identifies the geometric signatures whose
supplier types the pinned libraries do not yet contain.

## Conventions and imported objects

Let \(F\) be a number field and \(E/F\) an elliptic curve, hence smooth,
projective and geometrically connected. Write

\[
 X=\coprod_{\sigma:F\hookrightarrow\mathbb C} E_\sigma(\mathbb C).
\]

This finite disjoint union is the archimedean space. The antiholomorphic map
\(c_\sigma:E_\sigma(\mathbb C)\to E_{\bar\sigma}(\mathbb C)\) reverses the
complex orientation of each surface. ER.1 supplies these maps, the integral
rank-two homology lattices, symplectic period bases, and their geometric
conjugation action. Geometric pullback \(c^*\) is real linear and leaves the
coefficient line alone. Total de Rham conjugation also conjugates coefficients.

Use the literal Tate lines

\[
 \mathbb R(p)=(2\pi i)^p\mathbb R\subset\mathbb C.
\]

A class with coefficients in \(\mathbb R(1)\) is imaginary-valued. Write
\(\nu=2\pi i\,a\), with \(a\) real-valued. Dividing by \(2\pi i\) is Tate
untwisting. Dividing an imaginary functional value by \(i\) gives the chosen
real coordinate. These operations have different constants.

The early M.8 interface constructs the real Deligne complex, its logarithmic
variant on open varieties, hypercohomology, products and Chern-character
regulator. In weight two on a complex curve the complex is

\[
 \mathbb R(2)_{\mathcal D}
   =[\mathbb R(2)\longrightarrow\mathcal O\longrightarrow\Omega^1],
\]

in degrees \(0,1,2\). This specifies the imported convention; constructing this
complex is not an ER.2 target. `ComplexComparisonPartII:C5` supplies the
geometric Betti–de Rham comparison, Hodge decomposition and Poincaré pairing.
Mathlib already supplies `Module.End.eigenspace`; every minus space uses that
submodule at eigenvalue \(-1\), with `Module.End.mem_eigenspace_iff`.

## The elliptic Deligne specialisation

`elliptic_deligne_specialisation` refines
`EllipticRegulators:ER.2/the-deligne-cohomology-target`. For each \(E_\sigma\),
the imported degree-two, weight-two Deligne exact sequence is

\[
 0\longrightarrow F^2H^1_{\rm dR}(E_\sigma)
 \longrightarrow H^1(E_\sigma(\mathbb C),\mathbb R(1))
 \longrightarrow H^2_{\mathcal D}(E_\sigma,\mathbb R(2))
 \longrightarrow0.
\]

The elliptic Hodge decomposition has types \((1,0)\) and \((0,1)\), so
\(F^2H^1_{\rm dR}=0\); the comparison arrow is an isomorphism. Coefficient
conjugation on \(\mathbb R(1)\) is multiplication by \(-1\). Total conjugation
therefore becomes \(-c^*\), and its fixed classes form the geometric minus
eigenspace:

\[
 H^2_{\mathcal D}(E_{\mathbb R},\mathbb R(2))
 \simeq H^1(X,\mathbb R(1))^-.
\]

The left-hand notation includes every embedding of \(F\). Finite direct sums
and taking invariants commute; real invariants are exact by averaging the
order-two action.

The accepted target node supplies the wedge equivalence

\[
 W(\nu)(\omega)=\int_X\nu\wedge\omega,\qquad
 H^1(X,\mathbb R(1))
 \simeq\operatorname{Hom}_{\mathbb C}(\Omega^{1,0}(X),\mathbb C).
\]

The differential space has the semilinear action \(\omega\mapsto c^*\bar\omega\).
Write \(\Omega^{1,0}_{\mathbb R}\) for its fixed real space. The minus target
corresponds to
\(\operatorname{Hom}_{\mathbb R}(\Omega^{1,0}_{\mathbb R},\mathbb R(1))\).
Brunault’s Lemma 62 proves injectivity by Hodge decomposition and Poincaré
duality, then uses dimension for surjectivity. His (2.104), with complex
dimension one and orientation reversal under \(c\), shows that fixed
differentials receive imaginary functional values.

Acceptance requires conjugation compatibility as well as the isomorphism.
An isomorphism of unstructured real spaces of the correct dimension could
select geometric plus classes and fail the real-cycle period test. The
intermediate coefficient group is \(\mathbb R(1)\), despite Deligne weight two.

## Archimedean orbit coordinates

`Archimedean.orbitEquiv` constructs coordinates on this existing target after
Tate untwisting and ER.1’s period comparisons. Let \(I_{\rm real}\) index the
real places and let \(I_{\rm complex}\) contain one representative of each
nonreal conjugate pair. The choices are recorded; coordinates depend on them.

At a real place choose \(\gamma_+,\gamma_2\) with
\(\gamma_+\cdot\gamma_2=1\), where \(\gamma_+\) is the primitive generator of
the conjugation-fixed homology line, oriented by \(E^0(\mathbb R)\). ER.1 gives

\[
 c\gamma_+=\gamma_+,\qquad
 c\gamma_2=\varepsilon\gamma_+-\gamma_2,\qquad \varepsilon\in\{0,1\}.
\]

On the dual, untwisted period vector \((a,b)\), the action is
\[
 C_\varepsilon(a,b)=(a,\varepsilon a-b).
\]

Its minus eigencondition gives \(a=-a\), hence \(a=0\); \(b\) is unrestricted.
This applies to both topological types of the real elliptic curve. For
\(\varepsilon=1\), conjugation is not diagonal in this integral basis, but the
minus line is still \(\{(0,b)\}\).

At a complex place identify the conjugate cohomology summand with the first
using geometric pullback along \(c_\sigma\). Only after this transport does
the action become \(S(u,v)=(v,u)\). Its minus eigenspace is
\(\{(u,-u)\}\), with \(u\) arbitrary in the real rank-two
\(H^1(E_\sigma(\mathbb C),\mathbb R)\). Projecting to \(u\) retains two real
coordinates.

Combining the orbit maps gives a linear equivalence

\[
 \mathrm{orbitEquiv}:
 H^2_{\mathcal D}(E_{\mathbb R},\mathbb R(2))
 \simeq_{\mathbb R}
 (I_{\rm real}\to\mathbb R)\times(I_{\rm complex}\to\mathbb R^2).
\]

Its geometric definition composes the imported Deligne comparison, Tate
untwisting, ER.1’s period isomorphisms and these explicit maps. Its inverse
inserts \((0,b)\) at real orbits and \((u,-u)\) at transported complex orbits.
Switching the representative of a complex place changes the intrinsic
coordinate by \(-c^*\), transporting between the two cohomology spaces.

The construction serves two uses: ER.2 evaluates a regulator over all embeddings
and ER.6 takes its determinant in a space of the correct real dimension. The
API exposes components and inverses without unfolding the orbit decomposition.

| Declaration | Required mathematical API |
| --- | --- |
| `Archimedean.orbitEquiv` | The real linear equivalence above, transported through ER.1. |
| `Archimedean.orbitEquiv_real` | The component at a real place is its untwisted \(\gamma_2\)-period \(b\). |
| `Archimedean.orbitEquiv_complex` | The component at a complex place is its first transported rank-two vector \(u\). |
| `Archimedean.orbitEquiv_symm` | The inverse inserts \((0,b)\) and \((u,-u)\), with both inverse laws. |
| `Archimedean.orbitEquiv_ext` | Equality of every orbit coordinate is equivalent to equality of target classes. |
| `Archimedean.real_mem_iff` | Membership in Mathlib’s minus eigenspace of \(C_\varepsilon\) is equivalent to \(a=0\). |
| `Archimedean.pair_mem_iff` | Membership in Mathlib’s minus eigenspace of \(S\) is equivalent to \(v=-u\). |

Five unit tests distinguish the definition from plausible wrong ones. They
appear under these names in the suggested file.

| Test | Expected result and discrimination |
| --- | --- |
| `Archimedean.rectangular_real` | One real orbit, \(\varepsilon=0\): \((0,1)\) has coordinate \(1\), and \((1,0)\) is excluded. Selecting the plus line fails. |
| `Archimedean.tilted_real` | For \(\varepsilon=1\), every \((0,b)\) belongs and \((1,0)\) is excluded. Assuming a diagonal conjugation matrix fails. |
| `Archimedean.complex_pair` | \(((1,2),(-1,-2))\) has coordinate \((1,2)\). The vectors with first coordinates \((1,0)\), \((0,1)\) are independent. A single real coordinate for a complex place fails. |
| `Archimedean.empty_orbits` | Empty index sets give the zero period model, and the inverse sends its sole coordinate to zero. This is a model boundary test, not a number field with no embeddings. |
| `Archimedean.invariant_pair_fails` | \(((1,2),(1,2))\) is swap invariant and fails the minus condition. Omitting coefficient conjugation selects the wrong eigenspace. |

## Dimension and number-field conjugation

`Archimedean.archimedean_rank` gives

\[
 \dim_{\mathbb R}H^2_{\mathcal D}(E_{\mathbb R},\mathbb R(2))
 =|I_{\rm real}|+2|I_{\rm complex}|=r_1+2r_2=[F:\mathbb Q].
\]

The proof uses `orbitEquiv` and finite-product dimension. The arithmetic equality
is already `NumberField.InfinitePlace.card_add_two_mul_card_eq_rank` at the
pinned Mathlib commit. The pinned definitions `nrRealPlaces`,
`nrComplexPlaces`, `ComplexEmbedding.conjugate` and
`ComplexEmbedding.isReal_iff` identify the index sets with conjugation orbits;
they are baseline inputs.

Before imposing conjugation there are \([F:\mathbb Q]\) summands, each of real
dimension two, so the unrestricted target has dimension \(2[F:\mathbb Q]\).
Naturality of the imported regulator under total conjugation makes a class
defined over \(F\) land in the fixed part. Its imaginary-valued presentation
satisfies \(c_\sigma^*\nu_{\bar\sigma}=-\nu_\sigma\), with pullback from the
conjugate component to the first component. This is the orbit condition.

For \(E/\mathbb Q\) the rank is one. For the same curve over \(\mathbb Q(i)\),
one complex place gives rank two. Over \(\mathbb Q(\sqrt2)\), two real places
also give rank two. These tests detect doubling every embedding target and
counting a complex place only once. The dimension formula asserts no
injectivity or surjectivity of the regulator and proves no Beilinson conjecture.

## Symbol formula and universal comparison

The general curve form is imported through
`Polylogarithms:P.5/weight-two-regulator-form`:

\[
 \eta(f,g)=\log|f|\,d\arg g-\log|g|\,d\arg f.
\]

Here \(f,g\) are nonzero meromorphic functions and the form is considered off
their divisors. The one-form \(d\arg f=\operatorname{Im}(df/f)\) needs no
global argument branch. P.5 supplies bilinearity, antisymmetry, closedness off
divisors, the Steinberg identity through the Bloch–Wigner dilogarithm, and

\[
 d\eta(\xi)=2\pi\sum_x\log|\operatorname{tame}_x\xi|\,\delta_x.
\]

The tame convention is \((-1)^{ab}f^b/g^a\), where \(a,b\) are the orders of
\(f,g\). `P.5/unramified-weight-two-class` supplies closed-current and
homology-period results when the logarithmic residues vanish. Thus compact
periods do not depend on representative cuts or insertion of small puncture
circles. These are imported at their general curve scope.

The accepted elliptic nodes specialise the expressions

\[
 \eta_B(f,g)=
 \log|f|(\partial-\bar\partial)\log|g|
 -\log|g|(\partial-\bar\partial)\log|f|=i\eta(f,g),
\]

\[
 r_E(\{f,g\})(\omega)
 =\int_{E(\mathbb C)}\log|f|\,\omega\wedge\bar\partial\log|g|.
\]

The integrals converge absolutely: locally the integrands have logarithmic
singularities of size \(O(|\log r|/r)\) in the area integral. Stokes on the
complement of small discs gives boundary terms \(O(r\log^2r)\), which vanish.
Integration by parts therefore yields
\[
 \int\eta_B(f,g)\wedge\omega=2r_E(\{f,g\})(\omega).
\]

`chern_character_symbol_comparison` checks the universal-regulator convention.
Schneider’s higher K-theory convention, for \(i\geq1\), is
\[
 \operatorname{ch}_{i,j}=\frac{(-1)^{j-1}}{(j-1)!}c_{i,j}.
\]

For \(i=j=2\), \(\operatorname{ch}_{2,2}=-c_{2,2}\). The higher Chern product
formula for two weight-one units has coefficient \(-1\):
\[
 c_{2,2}(\{f,g\})=-c_{1,1}(f)\cup c_{1,1}(g).
\]

The signs cancel, giving the positive cup product for the Chern-character
regulator. These are imported maps; ER.2 does not reconstruct Chern classes.
Nekovář’s smooth-form model, (7.3.2), computes the cup as
\[
 \log|f|\,\pi_1(d\log g)-\log|g|\,\pi_1(d\log f),
 \qquad \pi_1(\alpha)=\frac{\alpha-\bar\alpha}{2}.
\]

Since \(\pi_1(d\log g)=i\,d\arg g\), its representative is \(i\eta=\eta_B\).
No additional \(2\pi\) enters this projection. If
\(\gamma\in K_2(E)_{\mathbb Q}\) restricts to
\(\xi=\sum_jq_j\{f_j,g_j\}\), then, at every embedding,
\[
 W(r_{\mathcal D}\gamma)(\omega)
 =\sum_jq_j\int\eta_B(f_j,g_j)\wedge\omega
 =2r_E(\xi)(\omega).
\]

P.5 supplies the general comparison of the current with the universal Deligne
regulator; E.3 supplies the rational restriction image. Brunault’s Proposition
67 gives the elliptic comparison: restriction to the punctured curve represents
the same class, with a logarithmic exact correction whose wedge integral
vanishes by Stokes. This verifies the accepted factor-two node in the Schneider
convention.

Actual rational unramifiedness is required for a \(K_2(E)_{\mathbb Q}\) lift.
Vanishing of every \(\log|\operatorname{tame}_x\xi|\) gives a real closed-current
class but need not give such a lift. Locally \(\{z,c\}\) has tame symbol \(c^{-1}\)
and period \(-2\pi\log|c|\). For \(|c|\ne1\), the puncture period obstructs
compact descent. For \(|c|=1\) with \(c\) not a root of unity, the real residue
vanishes while the rational tame class need not vanish. The comparison keeps
these conditions distinct.

## The oriented coordinate over \(\mathbb Q\)

For \(E/\mathbb Q\), choose \(\gamma_+,\gamma_2\) as above and the unique
holomorphic differential \(\omega_0\) with \(\int_{\gamma_+}\omega_0=1\).
ER.1 gives it as the pullback of \(dz\) on the normalised torus. Orientation
is part of the data for both topological types of \(E(\mathbb R)\).
The existing `ellipticDeligneTarget_toReal` evaluates \(W(\nu)\) at \(\omega_0\)
and divides by \(i\).

`oriented_period_coordinate_comparison` computes this map. For a geometric
minus class, \(\nu(\gamma_+)=0\). The Riemann bilinear formula, with intersection
\(+1\) and wedge order \(\nu\wedge\omega\), gives
\[
 W(\nu)(\omega_0)
 =\nu(\gamma_+)\omega_0(\gamma_2)-\nu(\gamma_2)\omega_0(\gamma_+)
 =-\nu(\gamma_2).
\]

For \(\nu=2\pi i\,a\), the result is
\[
 \mathrm{toReal}(\nu)=-2\pi a(\gamma_2).
\]

This is where the literal Tate-line factor occurs. For a regulator class
\(\nu=[i\eta(\xi)]\), it becomes
\[
 \mathrm{toReal}(r_{\mathcal D}\gamma)
 =-\int_{\gamma_2}\eta(\xi)
 =2\operatorname{Im}(r_E(\xi)(\omega_0)).
\]

Mathlib’s `Complex.imCLM` extracts the real imaginary coordinate in the
suggested file; division by \(i\) agrees on the imaginary line. Untwisted
transverse period \(a(\gamma_2)=1\) gives scalar \(-2\pi\). An \(\eta\)-period
equal to one instead gives scalar \(-1\) and \(r_E(\omega_0)=-i/2\).
These are period-model computations, not an assertion that an arbitrary period
is realised by an algebraic \(K_2\) class.

Replacing \(\gamma_2\) by \(\gamma_2+n\gamma_+\) leaves the coordinate unchanged
because the added period is zero. Reversing the real orientation replaces
\((\gamma_+,\gamma_2,\omega_0)\) by
\((-\gamma_+,-\gamma_2,-\omega_0)\); the intersection stays \(+1\), and the
scalar changes sign. A plus eigenclass with nonzero \(\gamma_+\)-period is a
non-example: it fails the transverse-only formula.

Nekovář’s author copy uses the evaluated pairing
\[
 J(\nu)(\omega)=\frac1{2\pi i}\int\nu\wedge\omega.
\]
It therefore satisfies
\[
 J(r_{\mathcal D}\gamma)(\omega_0)
 =\frac{r_E(\xi)(\omega_0)}{\pi i}
 =\frac{\mathrm{toReal}(r_{\mathcal D}\gamma)}{2\pi}.
\]

The Deligne class is the same. The additional factor belongs to the pairing,
so it must not be inserted again into the symbol regulator.

## Restriction, torsion and dependencies

`EllipticKTheory:E.3/what-the-sequence-does-not-identify` distinguishes the
integral localisation image from a rational identification. For a regular
curve over a number field, the kernel of integral restriction is the image of
the sum of closed-point \(K_2(k(x))\) groups, which are torsion. Rational
restriction is injective. The accepted ER.2 node
`torsion-ambiguity-has-zero-regulator` gives zero real regulator for a change
of lift: \(nx=0\) implies \(n r(x)=0\), and a nonzero integer acts injectively
on a real vector space. The oriented scalar is equally independent of the lift.
ER.2 imports this without planning another localisation sequence.

The five retained accepted nodes are `the-deligne-cohomology-target`,
`the-eta-form-and-its-differential-identity`, `the-regulator-on-symbols`,
`the-normalisation-factor` and `torsion-ambiguity-has-zero-regulator`, all
under `EllipticRegulators:ER.2/`. Their definitions, APIs and tests remain in
the base packet. This part adds the Deligne specialisation contract, orbit
equivalence, dimension from orbits, Chern-character symbol comparison and
oriented-period comparison, each with a unique node id. New planets are
**Archimedean orbit equivalence** and **Archimedean dimension formula**; the
existing target planet remains supplied by the base packet.

The early M.8 export must be independent of its late Borel, syntomic, Selmer
and Iwasawa comparisons. ER.2 has named-node imports from P.5 and E.3, and
period inputs from ER.1. The restructuring contract specifies edges from early
M.8 to P.5 and ER.2, and from P.5 to ER.2. A prerequisite from the whole
unsplit M.8 stage would import its late comparisons and risk a reverse
dependence on ER.2. Until the early export has an actual node or stage id,
its precise missing input is a supplier gap, rather than an invented stage.
M.8 consumes elliptic analytic applications from ER.4–ER.7; ER.2 does not
supply generic cohomology. ER.4’s trace comparison consumes M.8 norm
compatibility. Those interfaces are outside this part’s single-stage scope.

ER.2 is **planned**, with the early generic supplier export remaining. The
source comparison fixes the normalisation at the mathematical planning level.
Closing the cohomological prerequisite chain requires that export and the
imported geometric comparison types; elaborating period models alone does
not close it.

## Sources and text corrections

Primary public sources are [Brunault’s thesis, arXiv v1](https://arxiv.org/pdf/math/0602186v1)
(§1.1 pp.19–20, Proposition 26 p.26, §§2.5–2.6 pp.63–70),
[Schneider’s published chapter](https://ncatlab.org/nlab/files/SchneiderBeilinsonConjectures.pdf)
(§2 pp.7–10 and §4 pp.24–30), and
[Nekovář’s author copy](https://math.stanford.edu/~conrad/BSDseminar/refs/BeilinsonintroII.pdf)
(§7 pp.21–24). The packet records URLs, retrieval date, hashes and exact
locators. Page images were checked where extraction loses conjugation bars.
Nekovář’s publisher version was not retrieved; its published pagination is
537–570 in *Motives*, PSPM55 Part1 (1994).

Three corrections apply specifically to the hashed author copy’s p.24,
recorded as `EllipticRegulators/E24`–`E26` without a claim about the unread
publisher version. The cup sentence must use \(H^1(U,\mathbb R(1))\).
Its real \(d\arg\) expression needs the factor \(i\) required by \(\pi_1\).
In (7.5.1), the expression involving only \(g\) must contain
\(\log|g|\,d\log(\bar f)\wedge\omega\).
Integration by parts makes it equivalent to
\(-\log|f|\,d\log(\bar g)\wedge\omega\), giving the scaled pairing above.
The bar on the printed \(g\) is present in the image and absent from extracted
text. The intended formulas follow from the same copy’s (7.3.2) and
Brunault’s explicit comparison. Searches of the author publication listing
and public correction records located no erratum.
