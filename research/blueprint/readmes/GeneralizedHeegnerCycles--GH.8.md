# GH.8 continuation: exact-conductor character comparison

**Partial; ChatGPT Pro — cgp-20260923-h7q4; 27 September 2026; issue #740.**

The packet now has **thirteen targets**: the twelve targets of the preceding
checkpoint and one new comparison, `GH.8/primitive-character-stabilization`.
It has eleven cited baseline declarations, forty-nine acceptance checks, three
planets, ten supplier requests and five gap groups. The preceding roadmap is
preserved verbatim below under a historical heading. Its compilation and
reading claims refer to the 26 September checkpoint, not to the enlarged file.

## 1. The last conductor kernel is the relevant condition

Write \(K_n=K_{c_0p^n}\), \(G_n=\operatorname{Gal}(K_n/K_0)\), and
\(H_n=\operatorname{Gal}(K_n/K_{n-1})\), for \(n\geq1\). The positive-level
weight-two stabilization is
\[
z_n^\alpha=z_n-\alpha^{-1}\operatorname{res}(z_{n-1}).
\]
For an exact-conductor character \(\chi\), the weighted sum of the second term
vanishes. The precise condition is \(\chi|_{H_n}\ne1\), not merely
\(\chi\ne1\) on \(G_n\). The former follows only after identifying the
actual conductor filtration with this ring-class tower. That adapter remains
with HE.0. The quotient action and invariance of a restricted class remain
with HE.3.

This is the finite-sum step in [CH, Lemma 5.4, printed p. 602](https://web.math.ucsb.edu/~castella/HeegnerCycles-print.pdf),
whose hypothesis gives the conductor \(c_0p^n\). The matching statement is
[the July 2022 revision, Section 5.2, p. 23](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf).
The shorthand in the proof is justified by that exact-conductor hypothesis;
this continuation does **not** allege another source error.

## 2. Integral proof, including torsion modules

Let \(G\) be finite abelian, \(H\leq G\), and \(R\) a commutative integral
domain containing the values of \(\chi:G\to R^\times\). Let \(M,N\) be
arbitrary \(R\)-modules; they need not be torsion-free. Suppose
\(b:G\to M\) satisfies \(b(th)=b(t)\) for all \(h\in H\), and
\(\chi|_H\ne1\).

First, scalar character orthogonality gives
\[
C_H:=\sum_{h\in H}\chi(h)=0\quad\text{in }R.
\]
This theorem already exists at the Mathlib pin as
`MulChar.sum_eq_zero_of_ne_one` in `Mathlib/NumberTheory/MulChar/Basic.lean`.
Its domain is a finite commutative monoid, not just a finite field. On the
commutative group \(H\), the condition of vanishing on nonunits is vacuous,
so the given group character is an instance of this existing carrier.
The full statement, context and proof were read at commit
`082e2d37e8b0463410cdb532e111cd43d5a66174`.

For completeness, its proof reindexes by multiplication by an \(h_0\) with
\(\chi(h_0)\ne1\). Thus \(\chi(h_0)C_H=C_H\), and cancellation takes place
in the **domain \(R\)**. It does not take place in \(M\).

Now partition \(G\) into the cosets \(tH\). For each one,
\[
\sum_{h\in H}\chi(th)b(th)
 =\chi(t)\left(\sum_{h\in H}\chi(h)\right)b(t)=0.
\]
Adding these identities proves \(\sum_g\chi(g)b(g)=0\) even if \(M\) has
torsion. Temporary coset representatives are eliminated by the finite-sum
reindexing identity, also already present as `Equiv.sum_comp` at the pin.
No division by \(|H|\), \(|G|\), or \(\chi(h_0)-1\) is used.

Consequently, for any \(R\)-linear \(q:M\to N\), any \(a:G\to M\), and
any \(\beta,c\in R\),
\[
q\left(c\sum_g\chi(g)(a(g)-\beta b(g))\right)
 =c\sum_g\chi(g)q(a(g)).
\tag{PC}
\]
This is the new comparison node. It does not rebuild general character theory.
For the arithmetic application take \(a(g)=g z_n\),
\(b(g)=g\operatorname{res}(z_{n-1})\),
\(\beta=\alpha^{-1}\), and \(c=\alpha^{-n}\), over a coefficient ring in
which the ordinary root \(\alpha\) is a unit. The previously specified
modular-quotient/Kummer square and its equivariance identify \(q(a(g))\)
with the conjugates of the point class. Thus (PC) is the integral finite-level
comparison needed after specialization, without discarding torsion by
rationalization.

## 3. Maps not supplied by a finite sum

CH Lemma 5.4 separately invokes Rubin, Lemma 2.4.3, to identify the finite
weighted expression with the specialization of the Iwasawa class in twisted
cohomology. That is not a consequence of (PC). GH.3 must supply that
specialization, its coefficient twist and descent, with the unnormalized
finite sum and the power \(\alpha^{-n}\) in the same convention. No new
formal cohomology carrier is introduced here, and the Rubin input has not been
independently source-decomposed in this claim.

The conductor-zero formula is also untouched. A character inflated from
\(G_n/H_n\) does not meet (PC)'s hypothesis. Ramified character checks alone
therefore do not settle the unit factor printed in Definition 5.2, nor do they
prove equality of arbitrary Iwasawa classes without a separation/control
theorem. These remain explicit requests, not implicit uses of injectivity.

There is a simple, different way to compare **already constructed** compatible
bottoms. If \(q_0\mu=\nu q_1\), \(x_0=\mu x_1\), \(y_0=\nu y_1\), and
\(q_1x_1=y_1\), then
\[
q_0x_0=q_0\mu x_1=\nu q_1x_1=\nu y_1=y_0.
\]
This supporting check refines the existing `positive-tail-corestriction` node;
it is not a duplicate new target. It requires the actual first-transition
square and does not identify an unverified printed bottom formula.

## 4. Discriminating examples

The condition on the last kernel cannot be weakened. In additive notation let
\(G=C_4\), \(H=\{0,2\}\), \(\chi(g)=(-1)^g\), and \(b(g)=(-1)^g\).
The character is nontrivial on \(G\), the function is \(H\)-invariant, but
\(\chi|_H=1\) and the weighted sum is \(4\), not zero.

The coefficient-domain condition also matters. In \(R=\mathbf Z/8\), the
unit \(3\) has order two. The corresponding nontrivial character of \(C_2\)
has scalar sum \(1+3=4\ne0\). In contrast, with **domain coefficients**
\(R=\mathbf Z\), the sign-character sum is zero before acting on any
\(\mathbf Z/t\)-module. These two examples distinguish coefficient
zero-divisors from module torsion.

A last-kernel example uses \(G=C_9\), \(H=\{0,3,6\}\), and
\(\chi(g)=4^g\) over \(\mathbf F_{19}\). Here \(4^9=1\),
\(4^3\ne1\), and every function constant on the three \(H\)-cosets has
zero weighted sum. The finite diagnostics below test all \(19^3\) profiles.
The other tests retain \(\alpha^{-n}\) and use \(\alpha^{-1}\), not
\(p/\alpha\), in the weight-two stabilization.

## 5. Source and validation record for this continuation

Fresh source reading was bounded: CH's standing hypotheses, split recurrence,
and Section 5.2; the published pages 601 and 602 were inspected as images.
The 2022 Section 5.2 was compared in parsed text. Castella's family paper,
Section 6.2, pp. 27--29, was read in parsed text, but this claim's additional
page-28 screenshot attempt failed. BDP, LZ and the earlier source-error audit
remain historical readings, not fresh full-paper reads. New PDF downloads to
scratch failed, so the retained September-26 byte hashes are not presented as
newly acquired or reverified hashes.

The two new baseline suppliers were read at the exact Mathlib pin. Their file
blobs are `5b3f293f24cced8669b6a5cd50efe1252fccdb06` (MulChar) and
`0eec64f2576f4d449b44b877678fe95678cfc9f0` (finite sums).
The existing dual-map statements were also reread. No new arithmetic
implementation is claimed. The accepted `AUDIT-24` GH.8 entry and relevant
campaign suppliers were reread; the direct aggregate library-coverage fetch
returned no text. The prior aggregate/integration checks remain historical.
The two nearby upstream style references were GrothendieckEulerForms and the
relevant CharacterTheory sections; neither is replanned.

The enlarged suggested file contains **six named signatures, twenty-four
examples and six baseline checks**, with thirty proof placeholders. It has
**not been compiled in this continuation**. Only the earlier file's recorded
compilation is retained. The new signature uses actual modules, `Subgroup`,
`MonoidHom`, and finite sums, not an invented geometric carrier. The seven
geometric signatures remain dependent on their actual realization interfaces.

The unchanged repository checker and its helper were copied to a scratch
mirror and checked by Git-blob hashing against
`75ae1b45faadb74ab6f38c6fb10da5ac949e5cd9` and
`da67776033cefc24d185ffd47b2c74d3e9167099`. The mirror uses only the actual
stage IDs needed here, read from the atlas/campaign sources; it is not a full
checkout and contains no full declaration index. Its check is a scoped
schema/ownership/DAG check. Repository-wide collision and intake checks are
left to the automatic submission check. No full Lean/library regression suite
is claimed.

The finite diagnostics produced **12,187 cancellation/comparison cases**, plus
explicit boundary regressions. These diagnose conventions, not the arithmetic
realization or source theorems. Reproducible code follows.

```python
"""Finite diagnostics for the GH.8 character comparison, not a proof of geometry."""
from fractions import Fraction
from itertools import product
from math import gcd

cases = 0
# C_m is written additively; H is generated by d, with d dividing m.
# Each b is constant on H-cosets. Check cancellation and the stabilized q-square.
for prime in (3, 5, 7, 11, 13, 17, 19, 31):
    for m in range(2, 13):
        for root in range(1, prime):
            if pow(root, m, prime) != 1:
                continue
            for d in range(1, m + 1):
                if m % d or pow(root, d, prime) == 1:
                    continue
                profiles = product(range(3), repeat=d) if d <= 4 else [
                    tuple(int(i == j) for i in range(d)) for j in range(d)
                ]
                for profile in profiles:
                    chi = [pow(root, g, prime) for g in range(m)]
                    lower = [profile[g % d] for g in range(m)]
                    raw = [(g * g + 2*g + 1) % prime for g in range(m)]
                    weighted = sum(chi[g] * lower[g] for g in range(m)) % prime
                    assert weighted == 0
                    # q(x) = (2x,3x); beta and c are arbitrary coefficients.
                    beta, c = (m + 2) % prime, (d + 1) % prime
                    stabilized = c * sum(chi[g] * (raw[g]-beta*lower[g]) for g in range(m))
                    raw_sum = c * sum(chi[g] * raw[g] for g in range(m))
                    assert tuple(a*stabilized % prime for a in (2, 3)) == tuple(a*raw_sum % prime for a in (2, 3))
                    cases += 1

# A nontrivial character inflated from C4/H does NOT kill H-fixed functions.
chi4 = [(-1)**g for g in range(4)]
b4 = chi4.copy()
assert all(b4[(g+2) % 4] == b4[g] for g in range(4))
assert chi4[2] == 1 and chi4[1] != 1
assert sum(chi4[g]*b4[g] for g in range(4)) == 4

# Actual last-kernel example C9, coefficient field F19, primitive ninth root 4.
assert pow(4, 9, 19) == 1 and pow(4, 3, 19) != 1
for profile in product(range(19), repeat=3):
    assert sum(pow(4, g, 19)*profile[g % 3] for g in range(9)) % 19 == 0
    cases += 1

# Domain coefficients do not require the module to be torsion-free.
# R=Z, chi=-1 and M=Z/t: cancellation is coefficientwise before acting.
for torsion in range(2, 41):
    for x in range(torsion):
        assert (x + (-1)*x) % torsion == 0
        cases += 1

# Dropping the coefficient-domain condition is invalid, even when values are units.
assert gcd(3, 8) == 1 and pow(3, 2, 8) == 1 and 3 != 1
assert (1 + 3) % 8 == 4  # b=1 on C2; no cancellation.

# Keep the tower normalization. These are algebraic test values, not Fourier coefficients.
alpha = Fraction(2)
raw = [Fraction(5), Fraction(1)]
lower = [Fraction(3), Fraction(3)]
for n in range(1, 8):
    stabilized_sum = alpha**(-n)*sum(chi4[g]*(raw[g]-alpha**(-1)*lower[g]) for g in range(2))
    assert stabilized_sum == alpha**(-n)*(raw[0]-raw[1])
    cases += 1

print(f'{cases} finite cancellation/comparison assertions passed; three boundary regressions passed.')
```

---

# Preserved twelve-target roadmap, 26 September 2026

The following is the preceding reader verbatim. Its references to “new”,
“this continuation”, source images and a compiled file describe that earlier
checkpoint. The current counts and validation limits are given above.

# Weight-two comparisons for generalized Heegner cycles

This partial GH.8 blueprint contains seven geometric targets and five
initial-conductor and integral-tower comparison declarations. The packet records
all twelve targets, their supplier requests and remaining obligations. The
family proof also specifies the regulator quotient-kernel and ordinary-line
pairing checks needed before scalar reciprocity can identify global classes.

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

### The regulator kernel after descent

Loeffler--Zerbes, arXiv v3 Proposition 4.11, proves injectivity with an infinite
unramified direction. Its proof reduces a Frobenius-fixed element to a compatible
sequence in stabilized finite-rank invariant lattices, whose transition is
multiplication by \(p\); divisibility by every power of \(p\) forces zero.
CH Theorem 5.1 then uses a quotient to reach the relative Lubin--Tate extension.
The construction and its kernel must be transported together.

The relevant algebra is already in the pinned Mathlib. For a linear map
\(f:M\to N\) and submodules \(P\subseteq f^{-1}(Q)\),
`Submodule.mapQ` induces \(\bar f:M/P\to N/Q\), and `Submodule.ker_mapQ` gives
\[
\ker\bar f=\operatorname{image}\bigl(f^{-1}(Q)\longrightarrow M/P\bigr).
\]
In particular, \(f^{-1}(Q)=P\) implies injectivity, using
`Submodule.mkQ_map_self` and `LinearMap.ker_eq_bot`. In a scalar specialization
these may be \(P=JM\) and \(Q=JN\), but the Iwasawa and distribution coefficient
algebras must first be identified by the actual comparison maps. An analytic
ideal cannot act on a bounded module without that construction.

Injectivity of \(f\) alone is insufficient: multiplication by \(X\) on
\(\mathbf Q[X]\) is injective, while its induced map on
\(\mathbf Q[X]/(X)=\mathbf Q\) is zero. This counterexample tests the proposed
inference; it is not a refutation of either arithmetic theorem.

GH.7 supplies the local descent, together with a proof of the zero descended
kernel. Scalar evaluation then needs the nonzero dual vector on the ordinary
crystalline **line**. CH Section 5.3 identifies that projection and its period
factor. Projection from \(\mathbf Q^2\) to the first coordinate loses \((0,1)\),
so a nonzero functional on the full crystalline space is not a substitute.

Global localization is a separate GH.7 import. Castella Lemma 6.4 uses integral
Greenberg torsion-freeness, specialization/control, characterwise nonvanishing
and rank-one Selmer bounds, retaining each finite ring-class component. These
steps, the local quotient kernel and the source-version period map are explicit
open obligations. None is certified by elaborating the algebraic examples.

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
contains five named algebraic signatures and seventeen regression examples,
including four checks of quotient descent and scalar evaluation, plus four
baseline declaration checks. It elaborates at the pinned baseline with zero
errors and only the twenty-two intended placeholder warnings. The seven
geometric signatures still require their actual realization interfaces. The
reviewed aggregate GH.8 audit and all applicable link-map entries have been
reconciled; coverage remains partial with ten requests and five gap groups.

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
The current continuation read pp. 27--29 and successfully inspected the image
of p. 28. It also read CH (2022), pp. 21--25, including its quotient construction
and ordinary-line pairing, and Loeffler--Zerbes, arXiv:1108.5954v3, pp. 16--18,
including the proof of Proposition 4.11. CH p. 22 and LZ p. 18 were inspected as
images. The downloaded source hashes and exact scopes are in the packet.
The retained source finding and its previous errata search are unchanged; no
new source error is asserted from the local descent or unit-factor boundary.
