# Fixes to the Castella–Grossi–Lee–Skinner extraction

Issue [#5508](https://github.com/CBirkbeck/tauceti-explorer/issues/5508).
Codex, session `codex-5ebb6f`, 1 October 2026.
Input commit: `58ae33620c0f9b08089d7dd79ea9effbc051cfac`.
All four independently confirmed findings are addressed. These are extraction
fixes, not an independent review or Lean implementation.

## Finding /1: the ring-class unit quotient

Item /17 adds `p∤[O_K×:O_ℓ×]`, with `O_ℓ=Z+ℓO_K`, for each auxiliary
prime in the ring-class finite–singular comparison. The uniform sufficient
condition `p∤#O_K×` is also stated. The general Selmer-structure definition
and local conditions remain independent of this extra arithmetic hypothesis.
ES.1 retains the abstract comparison and HE.5 its Heegner consumer.

New **E42** records the source issue. For K=Q(√−3), p=3 and ℓ=2, the cube
roots of unity reduce onto F_4×, killing the residue-unit quotient in the
relative ring-class group. Thus G_2 is trivial, while trivial T=Z_3 gives
I_2=(3) and H¹_f(K_λ,F_3)=Hom_cont(Zhat,F_3)≃F_3. Its claimed target tensored
with G_2 is zero. The reduced forms of discriminants −3 and −12 each give
class number one, independently confirming the trivial relative group.

The source's §3.2 application has odd p and p∤D_K. Imaginary quadratic
fields have two units except Q(i), with four, and Q(√−3), with six. Odd p
never divides four, and p=3 is excluded for the latter by p∤D_K. Hence the
application satisfies the sufficient restriction; the main Eisenstein theorem
is not contradicted by this generic counterexample.

## Finding /2: the empty-module branch

Item /22 now chooses an omitted summand only when s>0, with
`1≤i_0≤2s`. If s=0, use the canonical injection `0↪X` without an index.
The other inclusions and inequalities retain their original hypotheses; the
range `1≤i≤2s−2` is empty when s=0 or s=1.

New **E43** records the quantified-statement defect. For M=M′=X=0,
k=1 and a=a′=b=b′=0, both exact sequences are the identity on R/𝔪 and all
numerical conditions hold. But the range for i_0 is empty. This is a valid
zero-module witness, not a failure of the nonzero assertion. The application
§3.3.3 first handles s=0 and then proves s(n_i)≥s−i>0 at each induction
step (v2 p.24; printed p.561). It therefore uses the corrected nonzero branch.
The owner remains ES.4; finite-module theory is not re-planned.

## Finding /3: define the local CM measures

Six items make the missing constructions and their imports explicit:

| Item | Content | Status / owner |
| --- | --- | --- |
| /40 | V_p(N;R), ordinary tower, q-expansion and coefficient ring Z_p^ur | planned: PadicFamilies L0 |
| /41 | Specified CM point x_a, integral Serre–Tate expansion and Atkin–Serre θ, with q-expansion action q d/dq | missing: source of AutomorphicPadicLFunctions L3 |
| /42 | Bounded Z_p^ur-valued μ_(f,a), with moments ∫binom(x,m)dμ=binom(θ,m)f(x_a) | missing: source of GZ.9 |
| /43 | f^♭=Σ_(p∤n)a_nq^n, unit support, intrinsic restriction and normalized CM unit dilation | missing: source of GZ.9 |
| /44 | General-coefficient bounded inverse Amice, unit restriction and dilation imports | planned: PadicMeasures L2 |
| /45 | General Mahler basis and the existing forward Amice transform/injectivity | library: pinned Mathlib |

Items /13 and /15 refer to these constructions for the BDP assembly and
congruence argument. Two source routes are added, L3 for /41 and GZ.9 for
/42–/43. Generic modular forms, CM geometry and measure theory are imported
from their existing owners. The mixed-characteristic CM lift and differential
comparison remain source-specific; RS-14's IG.1 special-fiber contract is
not promoted to such a lift. No new Igusa or measure carrier is introduced.

Freshly read actual pinned Mathlib signatures for `PadicInt.hasSum_mahler`,
`PadicInt.mahlerEquiv`, `AbstractMeasure.amiceTransform`,
`coeff_amiceTransform` and `injective_amiceTransform`. They provide the
coefficient-general substrate. The inverse equivalence
`amiceTransformEquiv` at line 156 covers Z_p-valued measures only, so it
cannot serve directly over Z_p^ur. The existing partial PadicMeasures packet
has the general bounded inverse and intrinsic unit-restriction contracts;
these remain planned imports, not formalized results.

The binomial moments retain the integral CM/operator comparison and bounded
coefficient condition. Unit support is an additional source-specific theorem
about the depleted expansion, not an automatic fact about arbitrary series.
The formal series and measures reuse the existing carriers. No blueprint
APIs/tests or recursive reconstruction of Castella–Hsieh is claimed.

## Finding /4: propagate E18 into the theorem

Item /11 now sums only over the finite imprimitive set
`S=Σ∖{v,v̄,∞}` and refers to the already confirmed E18. This agrees with
item /16 and removes infinity, where the Euler polynomial is undefined.
The old source issue and its review are unchanged; no duplicate issue is
registered. The current reader identifies this propagated correction.

## Versions, ownership and limits

Downloaded on 1 October 2026:

- [arXiv v2](https://arxiv.org/pdf/2008.02571v2), 34 pages, SHA-256
  `7cd995e0d9ee1c931f728da8b39603c4205fa0a84c25df27d44b4451a81a2c59`.
  Targeted pp.12–13,16–17,22–24 read; images pp.13,16,23.
- [Author copy](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), 34 pages,
  SHA-256 `2bd32832411151a628136b245eada847f2f1b2e04872391bbe630e8e1a54819b`.
  Compared pp.16 and 23 only.
- [Author-hosted printed article](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf),
  64 pages, SHA-256
  `d1c1afe0e91cd43851918d6999481bbfa7a34ec8473a3817468f769a13783f38`.
  Read metadata p.517 and targeted pp.540,545–547,556–558,561–562;
  visually checked pp.546 and 558.

The newly located printed copy has the journal DOI and pagination. Its
(3.1) on p.546 and Proposition 3.3.11(i) on p.558 retain the two unqualified
statements. E42–E43 therefore identify these inspected published locators as
well as the preprint and author-copy locators. This does **not** claim a full
journal collation of the previous 41 source issues. The original journal
access limitation is preserved as attributed history in the extraction.

The arXiv history, author's publication list, targeted correction searches
and Crossref relation/update fields were checked. No separate correction to
these exact defects was located in the limited search; no priority or
exhaustive-absence claim is made. E42–E43 await independent fix review.

Read the current L0, L3, GZ.9, L2, ES.1/ES.4 and HE.5 owner descriptions,
the relevant reviewed library-coverage rows, RS-14's Igusa boundary and the
existing partial measure packet. Searched the pinned Tau Ceti tree for
Igusa, Serre–Tate, Atkin–Serre, Mahler and Amice; no source-specific supplier
was found. The pins remain Mathlib `082e2d3` and Tau Ceti `f790474`.
Earlier Weierstrass/elliptic-curve checks and full paper readings remain
attributed to their original sessions, not freshly recertified here.

## Validation

The paper checker, §18 errata projection with all three version records,
three-file intake check and staged whitespace check pass. Preservation checks
confirm all 39 original IDs/statuses, nine original route memberships, ten
prerequisites and all 41 earlier sourceIssue objects remain. The final count
is 45 items (2 library, 11 planned, 32 missing), 11 routes and 43 source
issues; every missing item is routed exactly once.

The following exact checks reproduce the two finite witnesses. They do not
claim an implementation of class field theory or Galois cohomology.

```python
from math import gcd, isqrt
def forms(D):
    out = []
    for a in range(1, isqrt(abs(D)//3)+1):
        for b in range(-a, a+1):
            if (b*b-D) % (4*a):
                continue
            c = (b*b-D)//(4*a)
            if a > c or gcd(gcd(a, abs(b)), c) != 1:
                continue
            if (abs(b) == a or a == c) and b < 0:
                continue
            out.append((a,b,c))
    return out
assert forms(-3) == [(1,1,1)]
assert forms(-12) == [(1,0,3)]
# F_4=F_2[z]/(z²+z+1); z generates the residue-unit quotient.
def mul(a,b):
    a0,a1,b0,b1 = a&1,a>>1,b&1,b>>1
    return (a0*b0 ^ a1*b1) | ((a0*b1 ^ a1*b0 ^ a1*b1) << 1)
z = 2
assert {1,z,mul(z,z)} == {1,2,3} and mul(mul(z,z),z) == 1
# Zero-module branch: both sequences reduce to the identity on R/m.
k = 1
M = Mp = X = s = a = ap = b = bp = 0
assert k > M+2*a and ap <= a
assert list(range(1,2*s+1)) == []
```

No Lean deliverable, elaboration, Lake build/cache or language-server run.
