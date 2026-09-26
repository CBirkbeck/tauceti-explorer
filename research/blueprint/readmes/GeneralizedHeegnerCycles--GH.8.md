# Weight-two comparisons for generalized Heegner cycles

This is a partial GH.8 blueprint, continuing the seven geometric targets of the
previous checkpoint. Their identifiers and ownership boundaries are retained.
Five additional declarations make the initial-conductor and integral-tower
comparison tests explicit. They do not replace the still-required geometric
realizations by abstract predicates. The packet is the machine-readable record
of the twelve targets, requests and remaining obligations.

## The divisor and the quotient map

BDP indexes the fiber power by \(k-2\), whereas Castella--Hsieh writes the modular
weight as \(2r\). Weight two means fiber-power index zero and \(r=1\),
respectively. The graph construction then gives a CM point on the modular curve,
not a homologically trivial cycle. For a CM point \(x\) and a rational
degree-one cusp \(b\), use
\[
D=[x]-[b].
\]
The field must define both the level point and the cusp. It cannot be replaced
by a smaller ring class field merely because the CM elliptic curve has a model
there. BDP Section 2.3, printed p. 1063, supplies the index-zero correction; the
positive-index projector argument cannot be substituted for it.

Let \(C/L\) be the resulting smooth proper geometrically connected curve,
\(J=\operatorname{Pic}^0(C)\), and \(\pi:C\to E\) the chosen modular
parametrization. Its induced map satisfies
\[
q_\pi([x]-[b])=\pi(x)-\pi(b).
\]
Using the Picard--Kummer identification, set
\[
\theta_C:V_pJ\xrightarrow{\sim}H^1_{\mathrm{et}}(C_{\overline L},\mathbf Q_p(1)),
\qquad \gamma_\pi=V_p(q_\pi)\circ\theta_C^{-1}.
\]
The comparison is the commutative Abel--Jacobi/Kummer square for this actual map.
If \(q_\pi e_f=q_\pi\), it gives
\[
H^1(L,\gamma_\pi)(\operatorname{AJ}_{\mathrm{et}}(e_fD))
 =\kappa_E(\pi(x)-\pi(b)).
\]

At \(m=p^n\), take the support of the entire divisor, including its cusp.
Its residue vector belongs to the kernel of the degree map on
\((\mathbf Z/m)^S\). The finite Picard--Kummer/Gysin comparison must compute its
boundary using an \(m\)-division line bundle and a trivialization on
\(C\setminus S\), with connecting cocycle \(\sigma(Q)-Q\). Its sign,
independence of choices, Galois descent, transition in \(n\), and passage to
continuous cochains are exact GH.1 obligations. Interchanging inverse limits
and cohomology without a comparison theorem does not discharge them.

The quotient calculation itself is concrete: applying \(q_\pi\) to a division
point applies it to the same connecting cocycle, and changing the division point
changes both sides by corresponding coboundaries. Replacing \(b\) by \(b'\)
adds \(\kappa_E(\pi(b)-\pi(b'))\), not literal integral independence.
Torsion disappears rationally, not automatically in the integral Tate-module
class. An isomorphism of rational representations does not by itself identify
the chosen integral lattices.

## Character sums

For \(G=\operatorname{Gal}(F/L)\) finite abelian and
\(\chi:G\to B^\times\), a quotient comparison defined over \(L\) commutes with
\[
\sum_{g\in G}\chi(g)\,g z.
\]
Under the left-action convention this is a \(\chi^{-1}\)-eigenvector, by
substituting \(g=h^{-1}t\) after applying \(h\). The cyclic group of order
three is a useful sign test. There is no division by \(|G|\): the trivial
character gives the trace, not the average. When \(p\mid |G|\), an averaging
projector is not an integral substitute. Descent to a twisted cohomology group
requires its own coefficient and inflation--restriction maps. The convention
is compared with CH Section 5.2, not inferred from the problematic full
symmetric-power identification discussed below.

## Positive-conductor stabilization

For the ordinary unit root \(\alpha\) of \(X^2-a_pX+p\), put
\(K_n=K_{c_0p^n}\) and \(k_n=\kappa_E(P_n)\). For \(n\geq1\),
\[
k_n^\alpha=k_n-\alpha^{-1}\operatorname{res}(k_{n-1}).
\]
Linearity and restriction compatibility transport the same expression on cycle
classes. Multiplication by \(\alpha^{-n}\) is a further tower normalization.

For \(n\geq2\), the required raw trace and degree give
\[
\operatorname{cor}(k_n)=a_pk_{n-1}-\operatorname{res}(k_{n-2}),
\qquad [K_n:K_{n-1}]=p.
\]
Consequently
\[
\operatorname{cor}(k_n^\alpha)
 =(a_p-p/\alpha)k_{n-1}-\operatorname{res}(k_{n-2})
 =\alpha k_{n-1}^\alpha.
\]
Thus \(y_n=\alpha^{-n}k_n^\alpha\) is a compatible positive tail. Its bottom is
uniquely determined by \(y_0=\operatorname{cor}(y_1)\). CH Proposition 4.4,
printed pp. 591--593, states its split recurrence for \(n>1\); this must not be
used as a proof that the first field degree is also \(p\).

## The initial factor: an explicit conditional comparison

The new `initial-corestriction-comparison` isolates the remaining algebra. Work
with two vector spaces and actual linear restriction/corestriction maps. Write
\(\sigma,\tau\) for the two endomorphisms of the lower space. Suppose
\[
 u\,\operatorname{cor}(k_1)=a_pk_0-\sigma k_0-\tau k_0,
 \qquad \operatorname{cor}\operatorname{res}(k_0)=d k_0,
 \qquad ud=p-1,
 \qquad \sigma\tau k_0=k_0.
\]
Here \(u\) and \(\alpha\) are nonzero. In the arithmetic application, the
identification of \(u\), \(d\), the maps and the class normalization is input
to be proved, not built into an unspecified type of Heegner system. Then
\[
\boxed{\quad
\operatorname{cor}\bigl(\alpha^{-1}
 (k_1-\alpha^{-1}\operatorname{res}(k_0))\bigr)
 =u^{-1}(1-\alpha^{-1}\sigma)(1-\alpha^{-1}\tau)k_0.
\quad}
\]
Indeed, expanding the left side after multiplying by \(u\alpha\) gives
\[
(a_p-(p-1)/\alpha)k_0-\sigma k_0-\tau k_0
 =(\alpha+\alpha^{-1})k_0-\sigma k_0-\tau k_0,
\]
which is the expansion of the right side with the same multiplier. The root
identity is the only scalar algebra beyond cancellation. Only
\(\sigma\tau k_0=k_0\), not an unmentioned global commutation theorem, is needed.

The exact suppliers are now separated. HE.0 must prove the conductor-change
unit-index and field-degree relation. HE.2 must prove the displayed raw trace
in the actual point convention, including the two horizontal terms. HE.1--HE.3
and GH.1 must transport it through level descent, basepoint correction and the
quotient. These requirements are stronger and more useful than requesting
an unspecified initial Euler factor.

CH Definition 5.2, printed p. 601, writes the full unit-group order in its
prime-to-\(p\) branch, while the inspected Castella author-copy equation (6.7)
writes half that order. The formula above supplies a **conditional diagnostic**:
once the geometric multiplicity in the raw trace is the unit index, that same
index occurs in the stabilized bottom. It does not, without the actual class
normalization comparison, prove a second source error.

The new `initial-only-rescaling-obstruction` also prevents a false resolution.
If \(\operatorname{cor}(y_1)=y_0\ne0\), replacing just \(y_0\) by \(t y_0\)
with \(t\ne1\) breaks the relation. Multiplying every level by \(t\) does not.
Nonvanishing is essential: this test does not prove that an arithmetic bottom
class is nonzero.

As an exact algebraic regression, take \(p=5\), \(\alpha=2\), \(a_p=9/2\),
\(u=1\), \(d=4\), \(\sigma=\tau=1\), \(k_0=1\), corestriction the identity,
restriction multiplication by four, and \(k_1=5/2\). The normalized bottom is
\(1/4\); replacing the index one by the full count two predicts \(1/8\).
These are vector-space test data, not an assertion that \(9/2\) is an elliptic
curve Fourier coefficient.

## Differential normalization

In the good-reduction range and local base of the BDP de Rham construction, let
\(\pi^*\omega_E=c_\pi\omega_f\). Bloch--Kato naturality, its elliptic
formal-group comparison, and adjunction of quotient and differential pullback
give
\[
\log_{E,\omega_E}(\pi(x)-\pi(b))
 =c_\pi\operatorname{AJ}_{\mathrm{dR}}(e_fD)(\omega_f).
\]
The purely linear step is evaluation after a map, equivalently evaluation
against its transpose. A squared formula therefore substitutes
\(c_\pi^{-2}\). For \(c_\pi=3\) this is \(1/9\), not \(1/3\).
Rational invertibility, or the zero CM-period exponent at weight two, does not
make \(c_\pi\) an integral unit. The inspected BDP construction uses an
unramified local base; a larger range needs its comparison theorem.

## Uniform comparison of the integral towers

A quotient of a Jacobian is not usually an isomorphism on the entire Jacobian
cohomology. Before asking for inverse maps, choose the actual coefficient
factor on which the quotient is a rational isomorphism and prove that
identification, including any multiplicity and projector denominators. The new
comparison lemmas are not applied to the full Jacobian by coercion.

Let \(M_n,N_n\) be the selected integral cohomology modules, with their actual
corestrictions \(\mu_n,\nu_n\). The supplier contract asks for maps
\[
f_n:M_n\longrightarrow N_n,\qquad g_n:N_n\longrightarrow M_n,
\qquad g_nf_n=d,\qquad f_ng_n=d
\]
for **one fixed nonzero scalar \(d\)** independent of \(n\). Both map families
must commute with the transitions. These are actual coefficient/realization
comparisons; arbitrary levelwise rational isomorphisms do not provide them.

`uniform-coherent-kernel-bound` is the componentwise calculation: if all
\(f_n(x_n)=0\), apply \(g_n\) to obtain \(d x_n=0\). It applies in particular
to compatible sequences, even when the cohomology modules have torsion.

`uniform-coherent-lift` supplies a compatible lift of a fixed multiple. For a
compatible target sequence \(y\), choose \(x_n=g_n(y_n)\). Then
\[
\mu_n x_{n+1}=g_n\nu_n y_{n+1}=x_n,
\qquad f_nx_n=d y_n.
\]
Thus the kernel and cokernel of the induced map of compatible integral towers
are annihilated by \(d\). This proof does not assert that inverse limits are
right exact: it constructs compatible preimages explicitly. After inverting
\(d\), the comparison becomes an isomorphism. An integral isomorphism needs
stronger information, for example \(d\) a unit. For constant integer towers,
\(f=2\), \(g=1\), \(d=2\) meets the scalar identities but does not lift the
integral element one.

These elementary arguments are ready to be instantiated once the geometric
maps and one denominator bound are supplied. GH.3 and the existing Iwasawa
cohomology owners retain the realization of compatible classes; no competing
inverse-limit or cohomology carrier is defined here.

### A counterexample to unbounded levelwise comparison

The new `unbounded-denominators-counterexample` takes
\[
M_n=\mathbf Z,\quad \mu_n=2,\qquad
N_n=\mathbf Z,\quad \nu_n=1,\qquad f_n=2^n.
\]
Naturality is \(2^n\cdot2=2^{n+1}\). Each level map becomes an isomorphism over
\(\mathbf Q\). However, an integral compatible source sequence satisfies
\(x_n=2^k x_{n+k}\) for every \(k\). If \(x_n\ne0\), divisibility implies
\(2^k\le |x_n|\), contradicting \(2^k\ge k+1\) for large \(k\). Hence
\(\varprojlim M_n=0\), whereas \(\varprojlim N_n=\mathbf Z\), and
\[
(\varprojlim M_n)\otimes\mathbf Q\longrightarrow
(\varprojlim N_n)\otimes\mathbf Q
\]
is the non-isomorphism \(0\to\mathbf Q\).

In contrast, \(x_n=2^{-n}\) is a compatible sequence in the rationalized source
levels and maps to the constant one. Its denominators are unbounded. This
pinpoints the forbidden interchange between integral inverse limit followed by
coefficient extension, as used in CH Section 5.2, and levelwise rationalization.
Finite truncations have nonzero integral compatible sequences, so finitely many
computational checks alone cannot establish the infinite assertion. The proof
above, not a numerical extrapolation, supplies the counterexample.

## The ordinary-family boundary

Castella's Theorem 6.5 is higher-weight. Remark 6.6 of the inspected 31-page
copy extends the comparison to weight-two ordinary \(p\)-stabilizations of
prime-to-\(p\) newforms, not to weight-two \(p\)-new specializations. The packet
retains both weight congruences, residual hypotheses, actual lattices,
specialization and critical-twist maps. The finite ring-class component is not
silently traced away.

The proof compares specialized regulator images and uses both global
localization injectivity and local regulator injectivity. Equality of scalar
regulator values alone is not equality of global classes. The family proof and
the 2022 CH revision have different displayed Tate-period powers; comparing
versions needs an actual twist/coefficient map. The uniform denominator lemmas
above supply neither those maps nor either injectivity theorem.

## A coefficient identity that cannot be used literally

In CH Section 4.4, \(B=\operatorname{Res}_{H_K/K}A\). For \(h=[H_K:K]\), the
full symmetric power of \(T_pB\) and the induced symmetric power of \(T_pA\)
have dimensions \(1\) and \(h\) in degree zero, and \(h(2h+1)\) and \(3h\)
in degree two. The displayed identification therefore fails for \(h>1\).
The retained source issue records that obstruction, not a claim that all later
theorems are false.

For positive degree the pure-factor symmetric powers form the induced
submodule; mixed monomials remain in the full symmetric power. Degree zero
needs a separate treatment. The direct divisor/Kummer route avoids the false
identification, but comparison with the general CM-character construction
still requires repaired carriers and actual maps.

## Ownership and validation boundary

GH.0--GH.1 own the cycle geometry and realizations. HE.0--HE.3 own the order,
field, point, trace and Kummer inputs. GH.3 and HE.8 own the tower realizations.
GH.8 compares these objects. ModularIwasawaMainConjectures L6 owns the general
endpoint formulation comparisons, including determinant lines and
primitive/imprimitive conventions. Source-qualified maps feed the consumers;
there is no dependency back from the early class comparison to a completed
main conjecture.

The suggested file uses existing modules, linear maps, duals and integers. It
contains five named algebraic signatures and thirteen regression examples,
including the five earlier linear tests. It is uncompiled and is not a
formalization of the seven geometric targets. The packet retains partial
coverage, exact supplier requests and the unclosed source/realization gaps.

## Sources

BDP: Bertolini--Darmon--Prasanna, *Generalized Heegner cycles and p-adic Rankin
L-series*, Duke Math. J. 162 (2013), especially Section 2.3 and Sections 3.1--3.4.
The original checkpoint read those passages; this continuation does not claim
a fresh full read of them.

CH: Castella--Hsieh, *Heegner cycles and p-adic L-functions*, Math. Ann. 370
(2018), Sections 4.3--4.4 and 5.2. Definition 5.2 on printed p. 601 was
independently rechecked in its page image. Distinguish the 2 July 2022 revision
and one-page erratum. The latter's original read is retained, not represented
as a new errata search in this continuation.

Castella: *On the p-adic variation of Heegner points*, inspected 31-page author
copy, Section 6.2, Lemma 6.4, Theorem 6.5, equations (6.7)--(6.9) and Remark 6.6.
The continuation re-read the parsed section; its additional screenshot request
for p. 28 failed. No new source error is declared from the unit discrepancy.
The packet records exact URLs, source versions and which reads are inherited.
