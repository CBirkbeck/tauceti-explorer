# The number-field Habiro ring

This is the target-level plan for `HabiroNumberFields:HB.6`. It completes the local classical splitting and the rational comparison used by the [number-field Habiro ring plan](HabiroNumberFields.md). The compatible roots, number-field coefficient algebras, Frobenius lifts, glued ring and its restrictions remain the ten declarations of that plan. Their node ids, API, tests and two planets are retained. The [supplementary packet](../packets/HabiroNumberFields--HB.6.json) adds five declarations, without redefining the classical completion or the integral Taylor lattice.

The stage has a closed plan. This means that its target declarations have proof plans ending in pinned library declarations or exact supplier nodes. All implementation statuses are **unchecked**. The [suggested file](../suggested/HabiroNumberFields--HB.6.lean) gives concrete signature models for the new declarations and their tests.

## Objects and conventions

Let $K$ be a number field, let $\Delta\geq1$ be divisible by its absolute discriminant, and put $R=\mathcal O_K[1/\Delta]$. Divisibility by 6 is needed for the module/regulator stages, not for the ring definition. At every positive order use the full coefficient algebra

$$
 A_m(R)=R\otimes_{\mathbb Z}\mathbb Z[\zeta_m]
       =R[t]/(\Phi_m(t)).
$$

It has the monic power basis of size $\varphi(m)$. An embedded compositum is not a substitute: if $R=\mathbb Q(i)$, the order-four algebra has two components, even though $i\in R$.

The universal roots are organized by the compatible convention

$$
 \zeta_{mn}=\zeta_m\zeta_n\quad((m,n)=1),\qquad
 \zeta_{p^r}^p=\zeta_{p^{r-1}}.
$$

For $m=p^k m'$, $p\nmid m'$, the coefficient inclusion $A_m\to A_{pm}$ sends the root to $\zeta_{pm}^{e(p,m)}$, where

$$
 e(p,m)\equiv p\pmod{p^{k+1}},\qquad
 e(p,m)\equiv1\pmod{m'}.
$$

All expressions comparing roots of different orders use these inclusions. The conventional complex roots $\exp(2\pi i/m)$ do not give this system: their order-six minus order-three difference is 1, for which the required 2-adic shift does not converge.

For a prime $p\nmid\Delta$, $R_p=\varprojlim_a R/p^aR\simeq R\otimes\mathbb Z_p$ is a product of completed unramified local rings. Import the unique étale Frobenius lift from `HabiroRings:HR.1/the-etale-frobenius-lift`. In Definition 1.1 it acts on $R_p$ and fixes the cyclotomic root and the power-series variable. It can be a local automorphism without extending to an automorphism of $K$. At $p\mid\Delta$, $R_p$ is the zero ring.

Write $x=q-\zeta_m$ and $P_R=\prod_{m\geq1} A_m(R)[[x]]$. The parent declaration `HB.6/the-gluing-condition` defines the subring

$$
 H_R=\left\{f\in P_R:
 \operatorname{rex}_{\zeta_{pm}-\zeta_m}(f_m)
   =(\varphi_p\otimes1)(f_{pm})
 \text{ in }A_{pm}(R_p)[[x]]
 \text{ for every prime }p\nmid\Delta\right\}.
$$

Here the left side first maps its coefficients into $A_{pm}(R_p)$. Re-expansion is the p-adically convergent coefficient formula owned by `HC.3/p-adic-re-expansion`, with inverse shift by the negative constant. The difference of these compatible roots is topologically p-nilpotent. Ordinary formal power-series substitution by an arbitrary nonzero constant does not supply this operation.

The parent p-completed ring is the explicit product

$$
 H_{R_p}^{\mathrm{loc}}=\prod_{p\nmid m} A_m(R_p)[[x]].
$$

For $f\in H_R$, its full local family is untwisted by $(\varphi_p^{v_p(m)} f_m)_m$. Restriction to prime-to-p orders is the map to this product. This definition does not assert that the p-adic completion of the global ring $H_R$ is the product; the parent construction already excludes that additional assertion.

## Retained declarations, API and tests

The following ids have the prefix `HabiroNumberFields:HB.6/` and remain in the [parent packet](../packets/HabiroNumberFields.json). Their full statements and API are incorporated by reference, as recorded by this packet's `imports` manifest.

| Retained declaration | Interface and tests retained |
| --- | --- |
| `compatible-roots-of-unity` | `compatExp`, coefficient transitions, root-power formula, topological nilpotence and change of compatible system. Tests: `compatExp_two_five`, `valuation_table`, `traditional_roots_not_close`, `compatible_one`. |
| `coefficient-rings-and-frobenius` | Full `CoeffRing`, its root and maps, `CompletedCoeff`, zero completion at inverted primes, coefficient and cyclotomic Frobenius conventions, uniqueness, bijectivity and transition compatibility. Tests: `completedCoeff_zero_of_dvd`, `coeffRing_gaussian_splits`, `frobenius_gaussian`, `frobenius_not_global`, `frobenius_rat`, `cyclotomicFrobenius_zeta`. |
| `the-substitution-exists` | Convergent re-expansion and its inverse; imports HC.3's operation. |
| `the-gluing-condition` | `Families`, `GluesAt`, `habiroRing`, membership, extensionality, projection, evaluation, prime-to-order restriction. Tests: `kontsevich_rational`, `gluesAt_of_dvd`, `constant_i_not_glued`, `odd_indicator_Z_half`, `traditional_roots_undefined`, `classical_case`. |
| `the-p-completed-ring` | Local product, zero case, untwisted restriction equivalence, `toPCompleted`, `frobeniusTwist`, membership via every local twist and coefficient integrality. Tests: `pCompleted_zero_of_dvd`, `kontsevich_two_adic`, `gaussian_split_prime`, `untwisted_map_fails`. |
| `the-p-adic-classical-ring` | Classical completion over $\mathbb Z_p$ and its full prime-to-p Taylor product. The proof bridge is supplied below. |
| `ring-operations-and-the-classical-comparison` | Rational comparison, including localized integer coefficients and its HC.5 decomposition consequences. Its missing image argument is supplied below. |
| `decomposition-into-classes` | Product decomposition by the $\Delta$-part of the order; class one is a domain, other classes can split. |
| `abelian-fields` | Commuting global Frobenius in the abelian case and the scalar embedding $a\mapsto(\varphi_m^{-1}(a))_m$, with the corrected inverse convention. |
| `what-is-not-true-of-this-ring` | Constant families need not glue, local Frobenius need not be global, and a number-field Habiro ring need not be a domain. |

These interfaces are used in HB.7 and `KU-habiroring`, and are exported to `HabiroRings:HR.5-number-field-comparison`. In particular, no naive $R$-algebra structure is obtained by constant families. For $K=\mathbb Q(i)$, $\Delta=4$, $p=3$, the scalar image of $i$ has components $i$ and $-i$ at orders 1 and 3; the local Frobenius twist makes them untwisted-glued.

## The p-chain completion

**Comparison — `HB.6/p-chain-mixed-adic-comparison`.** Let $p$ be prime, $m\geq1$, $p\nmid m$, $B=\mathbb Z_p[q]$, $C_m=\{mp^k:k\geq0\}$, and $I=(p,\Phi_m)$. There is a canonical ring equivalence

$$
 B^{C_m}\simeq\operatorname{AdicCompletion}_I B,
$$

compatible with the polynomial maps. The left side is the cyclotomic completion of `HC.1/the-cyclotomic-completion`, over all finite products with arbitrary exponents.

For each monic product $f$ in that monoid, the quotient $B/(f)$ is finite free over $\mathbb Z_p$, with its monic power basis from Mathlib `AdjoinRoot.powerBasisAux'`. Thus

$$
 B/(f)\simeq\varprojlim_{a\geq1}B/(f,p^a).
$$

This assertion includes $f=1$, whose quotient is zero. One can prove it coordinatewise: reduce the coefficients in the finite basis by `PadicInt.toZModPow`, then reconstruct each compatible coefficient using `PadicInt.lift`, its specification and uniqueness. The finite quotient must be completed before replacing the indexing system.

Taking the limit over $f$ gives

$$
 B^{C_m}\simeq\varprojlim_f\varprojlim_a B/(f,p^a)
       \simeq\varprojlim_a\varprojlim_f B/(f,p^a).
$$

Both iterated limits are the same compatible arrays indexed by $(f,a)$. Ring operations are coordinatewise. This interchange uses limits, not tensor products.

Put $\Phi=\Phi_m$. If $f=\prod_k\Phi_{mp^k}^{e_k}$, then modulo $p$

$$
 \bar f=\bar\Phi^E,\qquad
 E=e_0+\sum_{k>0}e_k(p^k-p^{k-1}).
$$

This follows from the pinned `Polynomial.cyclotomic_mul_prime_pow_eq`, also discussed in Wagner's q-Witt paper, Lemma 2.1. The identity is used in characteristic $p$, not asserted modulo $p^a$. In $B/(f,p^a)$, $\Phi^E$ belongs to $p$ times the quotient, so $\Phi^{aE}=0$. Consequently

$$
 (p^a,\Phi^{aE})\subseteq(p^a,f).
$$

Conversely every power $\Phi^s$ is an allowed monoid element. At each fixed $a$, the two quotient systems are therefore cofinal, giving the limit over $(p^a,\Phi^s)$. Finally, for positive $a,s,n$,

$$
 I^{a+s-1}\subseteq(p^a,\Phi^s),\qquad
 (p^n,\Phi^n)\subseteq I^n.
$$

The resulting limit is the baseline adic completion. All maps preserve polynomial classes, which fixes the comparison's normalization.

A check on the distinction is $p=2,m=1$. No nonempty monic chain product divides the constant 2, but 2 is in $I$. Thus the raw cyclotomic ideals and mixed-adic ideals are not cofinal in $B$. Modulo $(4,q+1)$, however, $(q-1)^2=0$, exactly as the fixed-$a$ argument requires.

## Prime-to-p Taylor splitting

**Construction — `HB.6/prime-to-p-taylor-equivalence`.** For every prime $p$, construct

$$
 \operatorname{primeToPTaylorEquiv}:
 \mathbb Z_p[q]^{\mathbb N_{>0}}
   \simeq\prod_{p\nmid m} A_m(\mathbb Z_p)[[x]].
$$

Its component at $m$ is the existing Taylor map $sigma_{\zeta_m}$. First import `HC.5/chinese-remainder-for-disconnected-collections`. Over $\mathbb Z_p$, the classes for non-comaximality are precisely $C_m$, for $p\nmid m$: all other primes are units. This yields the product of all chain completions, including infinitely many classes. Apply the preceding comparison to each factor. Then import `HabiroRings:HR.5/the-ell-adic-taylor-comparison`, part $a$, which identifies its mixed-adic completion with the full $A_m(\mathbb Z_p)[[x]]$.

The local chart uses separability of $Phi_m$ modulo $p$. It does not require irreducibility. At $p=11,m=5$, its residue coefficient ring is $\mathbb F_{11}^4$; every factor is retained. Its polynomial normalization identifies the product map with the existing Taylor maps. Applying the inverse chart in each factor and the inverse CRT map constructs the inverse equivalence.

This construction serves the local part of GSWZ (14), the rational comparison, and the downstream number-field specialization. Its API is:

| Declaration | Property |
| --- | --- |
| `primeToPTaylorEquiv` | The full ring equivalence. |
| `primeToPTaylorEquiv_component` | Component $m$ is $sigma_{\zeta_m}$. |
| `primeToPTaylorEquiv_polynomial` | A polynomial $g$ maps to $g(\zeta_m+x)$. |
| `primeToPTaylorEquiv_constant` | A constant $a$ maps to the constant series $a$. |
| `primeToPTaylorEquiv_X` | The polynomial $q$ maps to $\zeta_m+x$. |
| `primeToPTaylorEquiv_symm_component` | The inverse has each prescribed prime-to-p Taylor series. |
| `primeToPTaylorEquiv_ext` | All prime-to-p Taylor components determine the completion element. |
| `primeToPTaylorEquiv_idempotent` | Any subset of the prime-to-p indices gives an indicator idempotent. |

The four discriminatory tests are:

| Test | Required result |
| --- | --- |
| `primeToP_zero` | At $p=2$, zero maps to zero at every odd order. |
| `primeToP_square_at_one` | At $p=2,m=1$, the image of $q^2$ has coefficients $1,2,1,0$ at exponents $0,1,2,3$. |
| `primeToP_full_cyclotomic_algebra` | $A_5(\mathbb Z_{11})$ has a basis of size 4, and $A_5(\mathbb F_{11})\simeq\mathbb F_{11}^4$; a single chosen residue root loses components. |
| `primeToP_independent_orders` | At $p=2$, an idempotent has Taylor series 1 at order 1 and 0 at every other odd order. There is no relation between orders 1 and 3. |

## The full local Taylor image

**Theorem — `HB.6/untwisted-families-are-classical-taylor-families`.** Let $G_p\subset P_{\mathbb Z_p}$ be the subring of families with

$$
 \operatorname{rex}_{\zeta_{pm}-\zeta_m}(f_m)=f_{pm}
$$

for every $m$, with the coefficient inclusions explicit. The full Taylor map $iota_p:\mathbb Z_p[q]^{\mathbb N_{>0}}\to P_{\mathbb Z_p}$ is injective and has range $G_p$. The inverse on $G_p$ is `primeToPTaylorEquiv`'s inverse applied to the prime-to-p restriction.

Necessity is `HC.3/re-expansion-of-taylor-expansions`. For sufficiency, reconstruct the classical element from the prime-to-p tuple. Its family and the original family agree at those orders. Every order is uniquely $mp^k$, $p\nmid m$; induction using the gluing equations forces agreement along that whole chain. This is forward extension through the coefficient inclusions. It does not assume that arbitrary coefficients at a ramified order descend to a prime-to-p coefficient algebra. Injectivity follows from the prime-to-p equivalence.

The indicator of the 2-power chain is an allowed all-order family over $\mathbb Z_2$. The family that equals 1 only at order 1 fails the equation between orders 1 and 2. These checks distinguish the image from the unrestricted all-order product.

## Comparing the two Taylor coordinates

**Lemma — `HB.6/additive-and-multiplicative-taylor-coordinates`.** HC.3 uses $x=q-\zeta_m$; HC.4 uses $q=\zeta_m(1-u)$, so $x=-\zeta_m u$. Use the existing ring map `PowerSeries.rescale`, componentwise, with the unit $-\zeta_m$. Its inverse rescales by $-\zeta_m^{-1}$. If $f_m=\sum_k a_kx^k$, then

$$
 C_{m,l}=(-\zeta_m)^{l-1}a_{l-1}\qquad(l\geq1).
$$

The coordinate equivalence sends the additive Taylor family to the multiplicative one and commutes with coefficient maps preserving the universal root. Because every multiplier is a unit, it preserves the weighted finite-precision filtration: precision $N$ retains the coefficients with $m(k+1)<N$. In particular the constant coefficient is indexed by $l=1$, and at $N=4,m=1$ the retained exponents are $0,1,2$.

The signature names are `additiveToMultiplicative_coeff`, `additiveToMultiplicative_taylor`, `additiveToMultiplicative_natural` and `additiveToMultiplicative_precision`. Their proofs are the pinned rescale coefficient/composition identities and compatibility of the existing Taylor maps on finite polynomial jets. At $m=1$, $1+x$ becomes $1-u$; at $m=2$, $x$ becomes $u$. This coordinate change needs no p-adic translation.

## The rational comparison

**Theorem — `HB.6/rational-gluing-image-criterion`.** Let $\Delta\geq1$, $R=\mathbb Z[1/\Delta]$, and $iota_R:R[q]^{\mathbb N_{>0}}\to P_R$ be the full additive Taylor map. Then it is injective and

$$
 f\in\operatorname{range}(\iota_R)
 \quad\Longleftrightarrow\quad f\in H_R.
$$

Pass to HC.4's coordinates using the preceding lemma. Import the exact accepted node `HabiroCyclotomicCompletions:HC.4/local-integrality-detection`: a family over $\mathbb Z[1/\Delta]$ is in the global classical Taylor image precisely when its coefficientwise image is in the classical Taylor image over every $\mathbb Z_p$, $p\nmid\Delta$. This is the integral finite-lattice input requested by the parent plan. It uses the corrected finite matrices and integral preimages at every precision, not an uncompleted infinite tensor product.

The full local Taylor image theorem turns that condition into p-gluing for every non-inverted prime. The coefficient Frobenius for $K=\mathbb Q$ is the identity; hence this is exactly the defining condition of $H_R$. Injectivity follows from `HC.4/finite-taylor-injective` at every precision and factorial cofinality from HC.1. There is no claim that a single Taylor component is injective after inverting primes.

For $\Delta=1$ this gives the desired identification with Habiro's original ring. For $\Delta=2$, the constant-series family equal to 1 at odd orders and 0 at even orders is in the image over $\mathbb Z[1/2]$; over $\mathbb Z$ it fails the 2-gluing equation at order 1. Thus completing after localization differs from localizing the completed ring, as in the retained parent theorem. The family equal to 1 only at order 1 is excluded even though every coefficient is integral.

## Dependency boundary and acceptance

The supplement's graph is

$$
 \text{HC.1 chain completion}
 \longrightarrow \text{mixed-adic comparison}
 \longrightarrow \text{prime-to-p splitting}
 \longrightarrow \text{full local image}
 \longrightarrow \text{rational image criterion}.
$$

HC.5 supplies the CRT decomposition; the exact HR.5 local chart supplies the Taylor factor; HC.3 supplies Taylor maps and re-expansion. HC.4 supplies the integral image criterion, connected through the rescale coordinate lemma. The imported parent coefficient construction obtains Frobenius from HR.1. No continuous Galois cohomology or Tate twists occur in this graph.

The imported HR.5 local chart has only baseline prerequisites. It is distinct from `HR.5-number-field-comparison`, which depends on HB.6 and proves the relative construction specializes to this explicit ring. The latter is a consumer, not an input. The finite étale/rank-$[K:\mathbb Q]$ description remains there. The first isomorphism of GSWZ (14), comparing the p-adic completion of the global non-Noetherian ring with its local model, is also not proved by the p-chain argument. Neither additional claim is needed by the scoped stage statement or asserted by the parent p-completed construction.

Acceptance requires the finite-quotient completion step before cofinality, all cyclotomic factors in every local chart, explicit coefficient inclusions in gluing, the $l-1$ coordinate convention, the inverse-Frobenius abelian scalar embedding, and the localized parity example. The packet selects the planets **Prime-to-p Taylor splitting** and **Arithmetic Taylor gluing**; with the retained **Habiro ring of a number field** and **p-completed Habiro ring**, the stage has four planets.

## Source corrections and assembly

The sources read are GSWZ, [arXiv:2412.04241v2](https://arxiv.org/pdf/2412.04241v2), §§1.3–1.4 and 5.1–5.3; Wagner, [q-Witt vectors and q-Hodge complexes, v5](https://arxiv.org/pdf/2410.23078v5), §2.1; and Wagner, [q-Hodge complexes over the Habiro ring, v2](https://arxiv.org/pdf/2510.04782v2), §2 around Lemma 2.12. Versions, read date and hashes are in the packet.

The new source issue `HabiroNumberFields/EHB6.1` records the reversed inequality on GSWZ p. 4: at a primitive $m$-th root, $(q;q)_n$ vanishes for $n\geq m$. For $m=2,n=1$ its value is 2. This is a harmless misprint; the subsequent $\lfloor n/m\rfloor$ Taylor divisibility formula already uses the correct direction.

The inherited issue `HabiroNumberFields/E30` is resolved here only for its classical $\mathbb Z_p$ comparison, not for the first global-completion isomorphism. `E22`'s unsupported attribution of image characterization to Habiro is replaced by the explicit local proof and HC.4 detector. The imported corrected HR.5 chart handles `HabiroRings/E5`, the false irreducibility claim modulo p. Parent `E20` and `E21` retain their corrections to the abelian embedding and the domain assertion.

At assembly, keep the parent's two comparison ids. Replace the raw cofinality step in `the-p-adic-classical-ring` by the finite-monic-quotient/double-limit proof and the imported local chart. Replace the unfinished global image step in `ring-operations-and-the-classical-comparison` by the rational image criterion and resolve its old HC.4 request using the exact accepted supplier. The new nodes do not depend on either unfinished parent comparison.

The verified finding `RT-AREA-ktheory-2/16` requires maintainer edits to legacy stage edges. Remove `MotivicEtaleKTheory:M.1` from HB.6's prerequisites; remove `KU-continuous` and `KU-existing` from `KU-habiroring`'s prerequisites. Do not forward RS-08's three Galois-cohomology links to HB.6; attach them to HB.1, where Kummer theory is used. Add HR.1 to HB.6 and to `KU-habiroring`, and HC.4 to HB.6. The packet records this rescope proposal. These graph maintenance actions do not add mathematical gaps to the ring plan; this job does not change atlas data or another roadmap's files.
