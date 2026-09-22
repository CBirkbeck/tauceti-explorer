# Shende–Tsimerman: weighted-Abel characteristic continuation


## Continuation — Codex, codex-a71f92, 22 September 2026

Refs #1334. This is a continuation of PR #1657, not an independent review.
Current totals are **131 items: 9 library, 20 planned, 102 missing**.
The original 14 routes now take 86 missing items exactly once; all 16
previously withheld items remain withheld. All 38 definition/construction
API/test blocks remain. There are 12 selected prerequisite edges, not a
claim of complete dependency closure.

The material change is a counterexample to **unrestricted weighted Abel
finiteness in positive characteristic**, stronger than failure of the
printed differential proof. The corrected theorem requires nonzero
**total multiplicities after collecting coincident support points**.
One original statement, weighted-fibers, is refined accordingly; all other
original item statements and statuses are retained.

### Fresh evidence and boundaries

Read all 40 pages of [arXiv v1](https://arxiv.org/pdf/1307.8237v1),
including Appendix A and references, and visually checked page 7 containing
Proposition 2.3 and Corollary 2.4. SHA-256:
542a52a2a04b65901a6d753266ef5f44aa73a8bde4dfdf7935ae27d489a5cf29.
The public arXiv record lists only v1. The author's link still points there.
The [canonical publisher](https://doi.org/10.1215/00127094-2017-0025)
download again returned security HTML, not the final 44-page paper.
Thus G0 remains open; the page-count difference does not establish a
mathematical change.

The 21 sourceIssues entries concern **v1**, not verified mistakes in the
final journal article. They record the predecessor's main-paper findings,
the selected fresh checks and the new characteristic-five family.
“new” means no correction was found in the limited listed searches, not
priority. No review verdict was added. The earlier AT/IY/MS/Sawin reading
is preserved with attribution; none of those prerequisite papers was
freshly read in this claim. In particular G6's later-Sawin observations
remain historical leads, not a new verification of that complete proof.

### W1. The exact characteristic-sensitive rank and finiteness contract

Let p_1,...,p_r be distinct points of a smooth curve over an algebraically
closed field, and assume h⁰(O(p_1+...+p_r))=1.
Lemma 2.1 makes the unweighted Abel differential injective: its source
has dimension r and its rank is r+1−1=r. Its r one-dimensional images
are therefore linearly independent.

For the weighted map (p_j)↦O(sum e_j p_j), the differential on the j-th
line is multiplication by e_j. Consequently its rank is the number of
e_j nonzero in k, and its kernel is the sum of the tangent lines with
e_j=0 in k. This proves the corrected Proposition 2.3 when every e_j is
nonzero, and describes its failure otherwise.

For a stratum of several effective divisors D_i with fixed support
multiplicities m_ij, first rewrite

    sum_i n_i D_i = sum_j e_j p_j,   e_j=sum_i n_i m_ij.

It is these e_j, not merely the original n_i, which must be nonzero in k.
For example, in characteristic three the weights 1 and 2 are both units,
but at a coincident support point their total is zero. The previous
weighted-fibers wording is sharpened to prevent that misuse.

When all total e_j are nonzero, a fiber has zero tangent space at each
point of the nonspecial-support stratum, hence local dimension zero.
A finite-type zero-dimensional fiber has finitely many geometric points.
This is a statement on that stratum; boundary strata must be checked
with their own collected multiplicities. It is valid in characteristic
zero for positive weights. A zero differential by itself would not prove
a positive-dimensional fiber; W2–W4 supplies an actual family.

### W2. A smooth genus-two model and a polynomial certificate

Work over an algebraically closed field k of characteristic five.
Let C be the smooth projective double cover with affine equation

    y²=x⁵−x.

The affine chart is smooth because the partial derivative with respect to
x of y²−x⁵+x is 1. At infinity use u=1/x, v=y/x³, giving

    v²=u−u⁵.

This chart is also smooth. There is one point infinity with u=v=0;
v is a uniformizer and u has order two, so x and y have pole orders two
and five. The polynomial x⁵−x is squarefree. The cover has six tame
ramification points, the five finite roots and infinity; the degree-two
Hurwitz formula gives 2g−2=−4+6=2, hence g=2.
This is an instance of existing Algebraic Curves Layers 7/10/12, not a
new model-class foundation. The scheme/model and genus adapters are
planned upstream, not already supplied by the generic library imports.

For P=(a,b) with b≠0 and a²⁵≠a, set

    t=x−a, U=b¹⁰+b²=a²⁵−a,
    H_b(t)=b⁶+2b⁴t+3b²t²+4t³,
    G_P=b⁵ y−H_b(t).

The equality U=a²⁵−a uses b²=a⁵−a and the characteristic-five binomial
identity. Direct coefficient expansion in F_5[b,t] gives

    b¹⁰(b²+t⁵−t)−H_b(t)²=t⁵(U−t),
    H_b(U)=−b³⁰.

These identities are exact. On C they say

    (b⁵y−H_b(t))(b⁵y+H_b(t))=t⁵(U−t).

They avoid any appeal to an unverified identification of Frobenius on the
Jacobian with multiplication by five.

### W3. The principal divisor, including every local order

Let Q=(a²⁵,−b²⁵), the image of P under the hyperelliptic involution
composed with the coordinate 25-power Frobenius map of this F_5-model,
base-changed to k. The binomial identity shows
Q lies on C. It has x-coordinate a+U, distinct from a.

At P, t is a uniformizer since b≠0. The factor b⁵y+H_b(t) evaluates
to 2b⁶, a unit, while U is nonzero. The product identity therefore gives
ord_P(G_P)=5.

At Q, H_b(U)=−b³⁰=b⁵y(Q), so G_P vanishes. Its conjugate factor
evaluates to −2b³⁰, a unit. Since U≠0, the factor U−t has a simple zero;
thus ord_Q(G_P)=1.

At infinity the term 4(x−a)³ has pole order six, while b⁵y has pole
order five and the remaining terms have smaller pole orders. There
is no cancellation, so ord_infinity(G_P)=−6. On the affine curve
the norm identity allows no other zeros; G_P has no finite poles.
Consequently

    div(G_P)=5P+Q−6 infinity,
    O(5P+Q) ≅ O(6 infinity).

This conclusion uses a divisor witness with computed local orders,
not merely a norm or a numerical point count.

### W4. A genuine positive-dimensional fiber

The set U_C of P=(a,b) with b≠0 and a²⁵≠a is a nonempty open subset
of C: only finitely many x-values are excluded. For such P, P and Q
are distinct and cannot be a hyperelliptic conjugate pair because their
x-coordinates differ. Lemma 2.13, at genus two with h=0,r=2, gives

    h⁰(O(P+Q))=1.

Nevertheless all divisors 5P+Q lie in the **same** complete linear
system |6 infinity| by W3. The map P↦(P,Q) is an algebraic graph, so
it is a one-dimensional family in a fixed weighted-Abel fiber.
The multiplicity-five point uniquely recovers P from the divisor;
the divisors are not constant along the family.

One can see algebraicity of the linear-system family directly: G_P is a
linear combination of 1,x,x²,x³,y with coefficients polynomial in a,b,
and its x³ coefficient is the nonzero constant −4. Its projective section
class therefore defines a morphism on U_C, with no denominator issue.

This disproves the intended varying-divisor finiteness conclusion of
Corollary 2.4 if read without a characteristic/weight restriction.
It does **not** disprove characteristic-zero finiteness, the nonzero-total-
weight version, or any later equidistribution theorem. In particular the
Corollary 2.20 argument uses residual weights 1 and 2; a weights-5-and-1
counterexample alone does not refute that restricted application.
Actual multiplicities and overlaps, characteristic two and the separate
septuple-rank error still need to be checked.

### Library matches and ownership

At the repository pins, the following actual statements and their
supporting proofs were read:

- Mathlib add_pow_char_pow and sub_pow_char_pow,
  Algebra/CharP/Lemmas.lean:116–178,243–263, at
  082e2d37e8b0463410cdb532e111cd43d5a66174.
- TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem:
  linearlyEquivalent_iff_exists_principalDivisor and
  coeff_principalDivisor in Principal/Basic.lean:67–155;
  weightedAbelJacobiDivisorClass_add, its zsmul version, and
  weightedAbelJacobiDivisorClass_eq_iff_linearlyEquivalent_of_weightedDegree_eq
  in AbelJacobi/Sum/Basic.lean:47–194.
- TauCeti.AlgebraicGeometry.SchemeWeilDivisor:
  nonempty_iso_sheaf_of_linearlyEquivalent in Scheme/Sheaf.lean:544,
  with the multiplication-isomorphism proof at 465–553 and standing
  integral/Noetherian/codimension-one DVR hypotheses at 62–77.

Tau Ceti's pin is f790474821cf4256814db967cb154e7af3d0c369.
The formal Abel-class sum is **not** the scheme Abel morphism and does
not supply its differential. The sheaf theorem requires the concrete
scheme and divisor/order adapter. These generic imports prevent
rebuilding established class-group or divisor-sheaf machinery.

Freshly read the reviewed Algebraic Curves Layers 7/10/12 and Jacobian
Challenge Layers A/F audit rows, and the relevant stage descriptions.
They distinguish the available divisor shadow from the unbuilt general
hyperelliptic model, scheme dictionary and Jacobian morphism.
The candidate IDs and weighted-Abel endpoints were searched in packets,
additional roadmaps, decompositions and reserved IDs without a matching
new owner. The original Jacobian Part II is the sole application route.
Its brief gains the characteristic-five regression and corrected
total-weight requirement; general curve and divisor foundations remain
with their existing upstream owners. No carrier or definition is added.

### Checks and handoff

The embedded standard-library Python verifies both polynomial identities
exactly over F_5[b,t], including the residual-point evaluation. Over
F_125=F_5[z]/(z³+z+1), it verifies the field construction, enumerates
126 curve points including infinity, and checks 120 eligible distinct
divisors and 15000 specialized norm identities. It also tests the
overlap-weight pitfall. These are finite/symbolic regressions, not a Lean
proof or a substitute for the local-order and family argument above.

All G0–G9 remain open or partial. G2 now has a positive-dimensional
counterexample and a precise restricted repair, but its downstream
all-characteristic geometry is not closed. No old withheld item is
promoted. The source-qualified measure normalization, IC/microlocal
comparisons, numerical constants, later Sawin proof, Linnik transfer,
ramified-level dictionary and original supplier readings still need work.
No Lean file was requested, written or compiled.

### Current delivery checks

The paper schema against the complete fresh catalogue and the three-file
intake both pass (3 files, 0 problems). Preservation checks retain all
122 original IDs/statuses, all original route assignments, all 38 D/C
API/test blocks and the same 16 withheld items. The sole original statement
refinement is weighted-fibers. All 86 routed missing items have one route;
the 12 selected edges have known endpoints and are acyclic. Historical
report/handoff text is retained, and no local paths occur. The Python
regression was also extracted from this report and executed successfully.
Publication base: a4a17bf2ff12608cc0f7c13a5bd6c6af7eb7ca22. Protocol,
catalogue, reviewed-coverage and checker hashes match the working snapshot.

### Reproducible regression

```python
"""Exact algebra checks for the weighted-Abel counterexample; not Lean proofs."""
from itertools import product

# Polynomials in b,t over F_5, represented by exponent-pair dictionaries.
def clean(P):
    return {e:c%5 for e,c in P.items() if c%5}
def add(P,Q):
    R=P.copy()
    for e,c in Q.items():R[e]=R.get(e,0)+c
    return clean(R)
def scale(c,P):return clean({e:c*a for e,a in P.items()})
def mul(P,Q):
    R={}
    for (b,t),c in P.items():
        for (d,u),a in Q.items():
            e=(b+d,t+u);R[e]=R.get(e,0)+c*a
    return clean(R)
def power(P,n):
    R={(0,0):1}
    for _ in range(n):R=mul(R,P)
    return R
b={(1,0):1};t={(0,1):1}
H={(6,0):1,(4,1):2,(2,2):3,(0,3):4}
curve=add(add(power(b,2),power(t,5)),scale(-1,t))
U=add(power(b,10),power(b,2))
lhs=add(mul(power(b,10),curve),scale(-1,mul(H,H)))
rhs=mul(power(t,5),add(U,scale(-1,t)))
assert lhs==rhs
HQ={}
for (e,j),c in H.items():HQ=add(HQ,scale(c,mul(power(b,e),power(U,j))))
assert HQ==scale(-1,power(b,30))
assert power(add({(1,0):1},{(0,1):1}),5)=={(5,0):1,(0,5):1}
print('PASS: exact F5[b,t] norm factorization, residual-point identity and Frobenius expansion')

# F_125 = F_5[z]/(z^3+z+1). A cubic with no base-field root is irreducible.
assert all((a**3+a+1)%5 for a in range(5))
def coeff(x):return [x%5,(x//5)%5,x//25]
def enc(v):return sum((a%5)*5**i for i,a in enumerate(v))
def fa(x,y):return enc([a+b for a,b in zip(coeff(x),coeff(y))])
def fn(x):return enc([-a for a in coeff(x)])
def fs(x,y):return fa(x,fn(y))
def fm(x,y):
    v=[0]*5
    for i,a in enumerate(coeff(x)):
        for j,b in enumerate(coeff(y)):v[i+j]+=a*b
    for k in (4,3):
        v[k-3]-=v[k];v[k-2]-=v[k]
    return enc(v[:3])
def fp(x,n):
    r=1
    while n:
        if n%2:r=fm(r,x)
        x=fm(x,x);n//=2
    return r
assert all(fp(x,124)==1 for x in range(1,125))
affine=[(a,b) for a,b in product(range(125),repeat=2) if fp(b,2)==fs(fp(a,5),a)]
checked=0;divisors=set()
for a,b in affine:
    aq,bq=fp(a,25),fn(fp(b,25))
    if not b or aq==a:continue
    u=fs(aq,a)
    assert u==fa(fp(b,10),fp(b,2))
    assert fp(bq,2)==fs(fp(aq,5),aq)
    h=fa(fa(fp(b,6),fm(2,fm(fp(b,4),u))),fa(fm(3,fm(fp(b,2),fp(u,2))),fm(4,fp(u,3))))
    assert h==fm(fp(b,5),bq)==fn(fp(b,30))
    # Exact factorization at each rational t, not merely the chosen residual point.
    for tt in range(125):
        ht=fa(fa(fp(b,6),fm(2,fm(fp(b,4),tt))),fa(fm(3,fm(fp(b,2),fp(tt,2))),fm(4,fp(tt,3))))
        yt2=fs(fa(fp(b,2),fp(tt,5)),tt)
        assert fs(fm(fp(b,10),yt2),fp(ht,2))==fm(fp(tt,5),fs(u,tt))
    # The points are distinct and not conjugate under (x,y)->(x,-y).
    assert a!=aq and bq!=0
    divisors.add(((a,b,5),(aq,bq,1)))
    checked+=1
assert len(divisors)==checked and checked>0
print('PASS:',len(affine)+1,'F125 points including infinity;',checked,
      'distinct 5P+Q divisors and',125*checked,'specialized norm identities')

# Weights must be collected at coincident support points before reducing modulo p.
assert 1%3 and 2%3 and (1+2)%3==0
print('PASS: separately invertible weights can have zero total weight on an overlap stratum')
```

---

## Historical report from PR #1657 (unchanged)

# PAPER-SHENDE-TSIMERMAN-17: source-qualified checkpoint

Codex — `codex-c83e7a`; Refs #1334. **Partial**, not a completed intake and not a formalization.

The complete available 40-page preprint has been read, including its appendix and references. The result contains **122 atomic items** (5 library, 19 planned, 98 missing), **14 routes**, and **38 definitions/constructions**, each with an API and at least three discriminating tests. 16 missing items remain deliberately unrouted because their statements or original suppliers are not closed. Those omissions prevent completion under PROTOCOL §16.

The paper relates line bundles on a hyperelliptic curve to rank-two bundles on P¹ modulo tensoring by line bundles. Its one-bundle limit is an inverse-automorphism law. The joint limit depends on ratio parity and on a uniform Betti bound plus a separate small-ratio dynamics argument. The central geometric theorem compares high cohomology of intersections of translated theta loci with shifted, Tate-twisted Jacobian cohomology. None of those scheme/cohomological theorems is already supplied by the five library imports below.

## Sources actually read

The main source is [arXiv:1307.8237v1](https://arxiv.org/pdf/1307.8237v1), dated 31 July 2013, all 40 pages. Its SHA-256 is `542a52a2a04b65901a6d753266ef5f44aa73a8bde4dfdf7935ae27d489a5cf29`. Both author pages lead to this version. Crossref identifies [the 2017 Duke article](https://doi.org/10.1215/00127094-2017-0025), 166(18), 3461–3504, which has 44 pages. The canonical publisher download returned security HTML; the final paper has **not** been read or matched. Every main-paper error report below concerns v1 only.

Selected original prerequisites were downloaded and read to the extents recorded in JSON `source.files`: Altuğ–Tsimerman §3 through Theorem 3.3 and its Lindelöf proof; Inoue–Yamazaki selected §2, including the homology-manifold proof; published Migliorini–Shende §2.5 and §3 through Theorem 3.4; and Sawin's introduction, the polar-coefficient discussion in Lemma 5.5, and Tsimerman's Appendix A. These are **selected readings**, not claims to have read all four papers. URLs, retrieval times, byte counts and hashes are in the JSON. The MS final numbering differs from the preprint cited by ST; AT's source citation “Lemma 3” also differs from the acquired version.

## Ownership and pinned-library evidence

The atlas snapshot is `06851ad5002dacc66c8cf335bd6e41e5690f4576`. All 211 atlas records, the current additional-roadmap proposals/reserved IDs, relevant full stage descriptions and their reviewed audits were checked for ownership. The prepublication check compares this snapshot and the earlier complete portfolio snapshot against current main. Relevant reviews are AUDIT-01 (SF.5), AUDIT-07 (ST), AUDIT-13 (AA), AUDIT-18 (EDC/DWP), AUDIT-19 (LPV/WC), and AUDIT-20 (GS).

The actual statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:

| Imported item | Declaration and file | Limit of the evidence |
|---|---|---|
| Riemann–Roch space | `TauCeti.riemannRochSpace`, `TauCeti.Divisor.dim`; `TauCeti/FieldTheory/FunctionField/RiemannRoch/Basic.lean` | Function-field carrier; coherent H⁰ comparison remains separate. |
| Class degree | `TauCeti.Divisor.degreeClass`, `degreeClass_divisorClass`; `Divisor/ProductFormula.lean` | Does not supply a degree-one class or the Picard scheme. |
| Finite class kernel | `TauCeti.Divisor.finite_ker_degreeClass`; `RiemannRoch/ClassNumber.lean` | Requires `IsFunctionField` and finite constants. |
| Projective cardinality | `Projectivization.card`; `Mathlib/LinearAlgebra/Projectivization/Cardinality.lean` | Abstract vector-space projectivization, not the Abel fiber identification. |
| General linear cardinality | `Matrix.card_GL_field`; `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean` | Bundle automorphisms still require splitting and a Hom computation. |

The audits distinguish these from unbuilt Bun_G stacks, Birkhoff–Grothendieck splitting, perverse categories, decomposition, Chow intersection products, curve zeta functions and higher-genus Weil bounds. JC's existing symmetric-power/Picard/coherent-RR plans and AC's hyperelliptic field-model plan are imported, never replanned. The Fargues–Fontaine Bun_G owner is not the global-curve owner GS.0.

## Scope and gaps to close

**G0 — final version.** Acquire and compare the 44-page Duke text first. The source's introduction omits the `q>4` condition printed in Theorem 4.2. The final-source comparison may resolve several other findings. Do not advertise an error in the published theorem based only on this preprint.

**G1 — measures and typed objects.** Bun₂ means PGL₂ bundle classes, not the full GL₂ stack. For `n>0`, `|Aut(O⊕O(n))|=(q−1)²q^(n+1)`; at `n=0` it is `|GL₂(F_q)|`. Normalizing gives `μ(0)=(q−1)/(2q)` and `μ(n)=(q²−1)/(2q^(n+1))`. Each parity has mass 1/2. Define `μ₀,μ₁` as the conditional probability laws. Ratio parity δ forces the mixture `½(μ₀⊗μ_δ+μ₁⊗μ_(1+δ mod 2))`. Distinguish line-bundle classes, Picard-scheme rational points, stack weights and adelic quotients throughout.

**G2 — divisor geometry and characteristic.** Proposition 2.3's tangent proof multiplies by the weights, so it fails when a weight is divisible by the characteristic. The corrected item explicitly assumes invertibility; a future all-characteristic finiteness proof cannot invoke that injective differential. Ramified hyperelliptic fibers have multiplicity two. In the canonical septuple the second residual subtraction is `τS`, not `S` (bars disappear in text extraction; PDF p.12 was inspected). Corollary 2.9 needs Veronese degree `g−1`, not `g`. Proposition 2.15's proof needs `d<g`: for `d=g`, the target is the smooth Jacobian but special Abel fibers are positive-dimensional. The printed lower bound for e(L) is false; the safe RR bound is `floor((deg L−g)/2)≤e(L)≤floor(deg L/2)`. A generic degree-g class has e=0. Criticality of a morphism and singularity of an individual fiber require an expected-dimension comparison. The exhaustive multiplicity test also falsifies the expanded rank in Corollary 2.18: at a ramification point p, D₁=p and D₂=2p give H₂=2p and R₁=p. Its formula gives min(g,2), but the union is 2p and rank is 2+1−h⁰(2p)=1. Cross-overlap between one hyperelliptic part and the other residual part must be subtracted. The correct union-divisor formula is retained, and every use of Corollary 2.18 must be rechecked. Positive-characteristic closure of the downstream geometry remains a named task.

**G3 — analytic counting and normalization.** A finite-field curve has a degree-one divisor class but need not have an F_q-point, contrary to the unqualified step in Theorem 4.2. Supply index one and Brauer descent. The contour error is `O(q^(n/2+εg))`, not `O(q^((n/2+ε)g))`. To divide by the class number, derive `#J=q^(g+o(g))` from Weil-angle equidistribution and the continuous logarithm at radius `q^−1/2<1`; a one-sided critical-circle bound is insufficient. The geometric single-bundle proof using `O(4^g)` alone gives `q>16`, so keep the analytic proof separate. Joint tail probabilities are `#X_L/(2#J)`, not the raw `#X_L` printed on p.33. All these corrections have explicit item-level contracts.

**G4 — perverse signs and motivic inversion.** Theorem 3.12 as printed fails on `K=Q_C[1]` for a smooth complex curve: its Euler function coefficient is −1, while its degree −1 stalk has dimension 1 and the top polar multiplicity is 1. Use effective characteristic-cycle coefficients with consistent shifts/signs. Published MS records signed conversion between Euler-obstruction and characteristic-cycle coefficients and explicitly warns against naive positive-characteristic pushforward. The relative Grothendieck-group inversion needs both middle factors `L`: `Σ_ab=A_ab−L A_(a+2,b)−L A_(a,b+2)+L² A_(a+2,b+2)`. Derived decompositions need shifts and twists, not just this identity. IY's complex proof does not automatically supply étale Frobenius-equivariant IC identifications.

**G5 — polar cycle and numerical bounds.** The PDF p.27 calculation uses `[2]_*[Θ_u]=2^u[Θ_u]`. In cohomology the factor for a u-dimensional abelian cycle is `4^u`. The instance `r=0,s=1,k=g−2` makes its coefficient 2 instead of 4 for the doubled-curve pushforward. Distinguish an image cycle from pushforward and prove its generic degree before deciding a repaired coefficient. Lemma 3.21's proof uses an annihilator not contained in the exceptional discriminant B, despite the printed condition. The proof of Proposition 3.23 also lifts a normalized curve through a proper surjection without recording the required finite base change. Consequently the exact `24`, `96`, and `960` bases are withheld; the qualitative geometric program remains routed. Even the source's claimed `O_ε((960+ε)^g)` does not imply its later exact `960^g` formulation.

**G6 — later source is a separate task.** Sawin v2 supplies a characteristic-p strategy and states the bound `28^g/16+4·8^g+2·4^g` for characteristic different from two, without the e(L) restriction. Its cited polar coefficient repeats the 2-power needing reconciliation, and its printed odd-parity mixture repeats the same cross term twice. Its characteristic-cycle construction avoids assuming every positive-characteristic singular support is a union of conormals. The selected reading does not justify declaring the complete proof verified, nor silently upgrading the 2017 intake to an unconditional all-q result. Obtain the full later proof and final versions before accepting a numerical endpoint.

**G7 — small-ratio dynamics and conditionality.** Theorem 4.4 has two branches. The large-ratio branch gives `N^g q^(−εg/4+o(g))`; if `q>N⁴`, choose a fixed ε<1 sufficiently close to 1. The small-ratio branch says the EMiV number-field proof carries over and uses a split place of degree `O(log_q g)`. Its positive-characteristic dynamics, varying-place constants and Hecke spectral normalization have not been established here. The optional Waldspurger route is explicitly described as unavailable in sufficient generality. The routed joint theorem is therefore an implication with this supplier as an explicit hypothesis. The Hecke-limit endpoint is withheld.

**G8 — ramified torus level.** For a ramified quadratic local extension `l_v=k_v(√π)`, the anisotropic torus `l_v×/k_v×` is compact. Its element √π is represented by `[[0,π],[1,0]]`, with odd determinant valuation, and cannot be conjugated into `PGL₂(O_v)`: scalar multiplication changes that valuation by an even number. The unit quotient is index two, not the maximal compact. This contradicts the unqualified maximal-compact step in Appendix A.2. The corrected construction uses unit-level integral models and the actual `Res G_m→GL₂` map before quotienting scalars. There is no canonical `T→GL₂` lift. Reprove the Picard/adelic measure identification with these local groups; ramified branch places cannot be discarded.

**G9 — original suppliers and remaining granularity.** The prerequisites list names the unacquired BBD/SGA/Weil-II proofs, the exact Macdonald/ACGH ring and Chern formulas, Fulton positivity/multiplicity hypotheses, Massey's original normalization, the finite-field index-one proof and EMiV/Linnik transfer. Locate and read the exact upstream trace-formula stage before routing that item. Complete the all-characteristic theta argument, all intermediate source lemmas and finite-field descent comparisons before claiming §16 closure. Suggested design-file ownership and proof order are below; no Lean deliverable is part of this paper issue.

## Routes and design contracts

### 1. source: `GlobalShtukasAndFunctionFieldLanglands`

GS.0 already owns global G-bundles, central degree, automorphisms and the generic-torsor adelic dictionary. Add the P¹ splitting and explicit unit-level double-cover instance there; ramified maximal compact is not the integral unit model.

Stages: `GlobalShtukasAndFunctionFieldLanglands:GS.0`.

Items: `bun-pgl`, `splitting`, `automorphism`, `pushforward-sections`, `adelic-bundle`, `weil-bundle`, `integral-torus-model`.

### 2. source: `GlobalShtukasAndFunctionFieldLanglands`

GS.1 owns global Hecke stacks and modifications. This elementary PGL₂ correspondence is an acceptance instance, not a second moduli owner.

Stages: `GlobalShtukasAndFunctionFieldLanglands:GS.1`.

Items: `hecke`.

### 3. source: `ArithmeticStatistics`

ST.0 owns weighted measures on arithmetic isomorphism classes. Record the exact inverse-automorphism mass, finite Picard normalization and parity support.

Stages: `ArithmeticStatistics:ST.0`.

Items: `natural-measure`, `tail-mass`, `pic-quotient`, `joint-measure`, `joint-normalization`, `parity-limit`, `hecke-measure`.

### 4. source: `ArithmeticStatistics`

ST.5 explicitly covers function-field statistics, convergence modes and error bounds. Add the gonality/Lindelöf suppliers and conditional mixing assembly; retain B(N) and the unclosed small-ratio theorem as hypotheses.

Stages: `ArithmeticStatistics:ST.5`.

Items: `betti-conjecture`, `gonality-points`, `weil-measure`, `gonality-lindelof`, `class-asymptotic`, `reduced-coefficients`, `theta-density`, `single-limit`, `geometric-single-threshold`, `escape`, `large-ratio-error`, `joint-conditional`, `split-place`.

### 5. source: `EtaleDualityAndPerverseSheaves`

The middle perverse category and IC are existing EDC.5 targets, not new definitions in the hyperelliptic application.

Stages: `EtaleDualityAndPerverseSheaves:EDC.5`.

Items: `perverse`.

### 6. source: `EtaleDualityAndPerverseSheaves`

EDC.7 owns pure rational decomposition and relative hard Lefschetz. Semismall geometry is the source-specific bridge; arithmetic Frobenius splitting is not automatic.

Stages: `EtaleDualityAndPerverseSheaves:EDC.7`.

Items: `decomposition`, `relative-hl`, `semismall`.

### 7. source: `LefschetzPencilsAndVanishingCycles`

LPV.2 owns ordinary quadratic singularities and their vanishing module. Hyperelliptic Hessian calculations consume it.

Stages: `LefschetzPencilsAndVanishingCycles:LPV.2`.

Items: `ordinary-double`.

### 8. source: `SchemeAndStackFoundations`

SF.5 owns Chow operations, refined intersection, Chern classes and positivity suppliers; the polar application must not rebuild them.

Stages: `SchemeAndStackFoundations:SF.5`.

Items: `chow`, `positive-intersection`.

### 9. source: `WeilConjectures`

Reuse the zeta and functional-equation owner, with the curve class-number evaluation as an additional explicitly named comparison.

Stages: `WeilConjectures:WC.1`, `WeilConjectures:WC.2`.

Items: `curve-zeta`, `curve-reciprocity`.

### 10. source: `WeilConjectures`

The all-extension curve bound is an existing target and feeds gonality and split-place estimates; elliptic special cases are insufficient.

Stages: `WeilConjectures:WC.5`.

Items: `curve-rh`.

### 11. source: `DeligneWeightsAndPurity`

Keep compact-support upper weights with DWP.7. Singular proper theta loci use upper bounds, not an unsupported smooth-purity claim.

Stages: `DeligneWeightsAndPurity:DWP.7`.

Items: `trace-weight`.

### 12. source: `AdelicAlgebraicGroups`

Shared adelic topology, measures and restriction of scalars remain with AA. The quadratic-torus model must export local unit subgroups explicitly.

Stages: `AdelicAlgebraicGroups:AA.0`, `AdelicAlgebraicGroups:AA.1`, `AdelicAlgebraicGroups:AA.2`.

Items: `adeles`, `quadratic-torus`.

### 13. part-ii: `JacobianChallengePartIIHyperellipticTheta`

Upstream JC.C/D construct symmetric powers, Abel maps and the Picard scheme, but do not plan the special-divisor stratification, Gauss/Nash models or intersection-cohomology comparison. Extend upstream rather than replanning it.

Build on Jacobian Challenge (tauceti:TauCetiRoadmap/JacobianChallenge) A–F and Algebraic Curves (tauceti:TauCetiRoadmap/AlgebraicCurves) 10/12. Import Etale Duality and Perverse Sheaves (EtaleDualityAndPerverseSheaves) EDC.5/7, Scheme and Stack Foundations (SchemeAndStackFoundations) SF.5, Lefschetz Pencils and Vanishing Cycles (LefschetzPencilsAndVanishingCycles) LPV.2 and Weil Conjectures (WeilConjectures). Construct Θ_d, hyperelliptic reduction including ramification, Abel differentials and canonical septuples, e(L) with integer shifts, and the proper sum maps. Prove the Gauss embedding for d<g and Nash model only in that range. Establish IC_Θ=Q[dim Θ], set-theoretic ample sections, the small-support constant-to-IC comparison and the exact Theorem 3.9 target: if e(L)≤n=g−a−b≥0 then H^i(X_L)=H^(i+2a+2b)(J)(a+b) for i>n+e(L), retaining coefficient and Frobenius conventions. First close the characteristic-zero proof and then supply an independent valid étale positive-characteristic argument; Proposition 2.3 does not transfer when weights vanish in k. Develop the generic Euler calculation, discriminant candidate geometry and incidence maps, importing the microlocal Part II. Do not promise the printed 960 numerical base until Lemma 3.22, the signed Morse formula and final-source reconciliation close. ArithmeticStatistics owns limiting measures; GS.0 owns bundles. Define APIs with ≥3 discriminating tests, source-faithful proof tasks and suggested Lean files; no implementation is claimed.

Items: `degree-one`, `theta`, `abel-tangent`, `abel-sum-tangent`, `weighted-abel`, `weighted-fibers`, `hyperell-reduction`, `hyperell-sections`, `canonical-bundle`, `canonical-involution`, `canonical-map`, `gauss`, `gauss-embedding`, `canonical-span`, `special-divisor`, `linear-system`, `nash-theta`, `sum-map`, `sum-rank`, `canonical-septuple`, `effectivity-index`, `critical-locus`, `theta-ic`, `theta-ample`, `theta-low`, `theta-high`, `intersection-lci`, `intersection-low`, `relative-semismall`, `ic-kernel`, `intersection-high`, `jacobian-betti`, `perverse-middle`, `weak-high`, `symmetric-chern`, `poincare-cycle`, `general-euler`, `abel-motivic`, `transverse-dimension`, `discriminant-strata`, `discriminant-components`, `node-count`, `polar-incidence`, `polar-incidence-generic`, `reduced-divisors`, `class-zeta`, `reduced-zeta`, `theta-betti-bound`.

### 14. part-ii: `EtaleDualityAndPerverseSheavesPartIIMicrolocal`

EDC.5/7 provide perverse sheaves and decomposition but have no characteristic-cycle, Euler-obstruction or higher-discriminant theory. Those are shared suppliers for theta geometry and later Sawin applications, not application-local placeholders.

Import Etale Duality and Perverse Sheaves (EtaleDualityAndPerverseSheaves) EDC.5/7, Scheme and Stack Foundations (SchemeAndStackFoundations) SF.5, Lefschetz Pencils and Vanishing Cycles (LefschetzPencilsAndVanishingCycles) LPV.0/2/6 and Complex Comparison (ComplexComparison and ComplexComparisonPartII). Construct complex conormal cycles, Nash bundle/local Euler obstruction, generic polar cycles and local multiplicities. Prove effective characteristic-cycle conventions for perverse objects, the signed local index formula and Massey stalk inequalities using effective cycle coefficients. Establish higher discriminants, codimension estimates in characteristic zero, support containment and the Migliorini–Shende Euler-obstruction expansion. Final target: dim H^(−i)(K)_x≤γ_i(CC(K),x) for a perverse K on smooth complex Y, with all genericity and indexing conventions, not the false signed n_α sum printed in ST v1. Obtain the original Massey proof and the entire relevant MS proof before declaring closure. Treat the positive-characteristic Beilinson–Saito/Sawin branch as a separately sourced extension: perfect ground field, ℓ invertible, conical singular support not assumed a union of conormals, wild ramification and pencil transversality explicit. Do not infer it from characteristic-zero stratified topology. Give every definition APIs and ≥3 unit tests, including a shifted constant sheaf on a curve and an Artin–Schreier map. Numerical hyperelliptic bounds stay in the Jacobian Part II, not this general supplier.

Items: `nash`, `euler-obstruction`, `polar`, `characteristic-cycle`, `morse-correct`, `higher-discriminant`, `discriminant-codim`, `discriminant-expansion`.

The Jacobian Part II should use a file such as `TauCeti/AlgebraicGeometry/Jacobian/HyperellipticTheta.lean`, after JC's actual scheme/Abel carriers. The microlocal Part II should use files such as `TauCeti/AlgebraicGeometry/Perverse/CharacteristicCycle.lean` and `HigherDiscriminant.lean`, after EDC and SF.5. These are **suggested design locations**, not files created or compiled here. Bundle splitting stays under GS.0; measures and limits stay under ST.0/ST.5. A design must split source acquisition, generic suppliers, geometric applications and the final statistical implication into dependent proof tasks.

## Complete item ledger

Every entry's exact statement, owner/library references, caveats and all definition APIs/tests are in the JSON. The following ledger supports coverage review.

| Item | Kind/status | Locator | Name |
|---|---|---|---|
| `hyperelliptic` | definition / planned | §1; §2.2 | Hyperelliptic double cover |
| `rr-space` | definition / library | §2 divisor calculations | Function-field Riemann–Roch space |
| `degree-class` | definition / library | §4 Picard counting | Degree on function-field divisor classes |
| `class-finite` | theorem / library | §4 finiteness input | Finite degree-zero function-field class group |
| `projective-card` | theorem / library | §4 Abel-fiber counting | Finite projective-space cardinality |
| `gl-card` | theorem / library | §1 inverse automorphism weights | Finite general-linear group cardinality |
| `picard` | definition / planned | §2.1 | Picard degree components and Jacobian |
| `symmetric-power` | construction / planned | §2.1 | Symmetric powers and Abel morphisms |
| `coherent-rr` | theorem / planned | §2.2; Lemma 4.1 | Coherent Riemann–Roch and duality on C |
| `bun-pgl` | definition / planned | §1; Appendix A.1 | Bundles modulo line-bundle twists |
| `splitting` | theorem / missing | §1 p.2; Lemma 4.1 | Birkhoff–Grothendieck splitting |
| `automorphism` | theorem / missing | §1 p.2 | Automorphism orders of split bundles |
| `natural-measure` | definition / planned | §1 p.2 | Normalized inverse-automorphism bundle measure |
| `tail-mass` | theorem / missing | §1 p.2 | Bundle-measure parity tails |
| `pic-quotient` | construction / missing | §1; §4.1 | Finite Picard quotient and uniform law |
| `degree-one` | theorem / missing | Theorem 4.2 proof, repaired supplier | Degree-one divisor classes over finite fields |
| `joint-measure` | construction / missing | Conjecture 1.2; Theorem 4.4 | Joint bundle pushforward |
| `main-single-source` | theorem / missing | Theorems 1.1,4.2 | Source one-bundle equidistribution |
| `main-joint-source` | theorem / missing | Conjecture 1.2; Theorem 4.4 | Source conditional joint equidistribution |
| `main-hecke-source` | theorem / missing | Conjecture 1.2; Theorem 4.4 | Source bounded-ratio Hecke alternative |
| `theta` | definition / missing | §2.1; §3 | Effective divisor loci |
| `abel-tangent` | theorem / missing | Lemma 2.1 | Differential of the Abel map |
| `abel-sum-tangent` | theorem / missing | Corollary 2.2 | Tangent image of a sum of Abel maps |
| `weighted-abel` | theorem / missing | Proposition 2.3, corrected hypothesis | Weighted Abel differential with invertible multiplicities |
| `weighted-source` | theorem / missing | Proposition 2.3 | Unqualified weighted Abel claim |
| `weighted-fibers` | theorem / missing | Corollary 2.4, restricted branch | Weighted Abel quasi-finiteness near nonspecial reduced support |
| `hyperell-reduction` | definition / missing | Notation 2.5–2.6 | Hyperelliptic and reduced parts of a divisor |
| `hyperell-sections` | theorem / missing | Lemma 2.7 | Sections of the hyperelliptic pencil |
| `canonical-bundle` | theorem / missing | Lemma 2.7 | Canonical bundle of a hyperelliptic curve |
| `canonical-involution` | theorem / missing | Corollary 2.8 | Projective action of the involution |
| `canonical-map` | theorem / missing | Corollary 2.9 | Canonical map through the rational normal curve |
| `gauss` | construction / missing | Corollary 2.10 | Extended Gauss map of an Abel image |
| `gauss-embedding` | theorem / missing | Lemma 2.11 | Embedding by secant planes |
| `canonical-span` | theorem / missing | Corollary 2.12 | Independent canonical directions |
| `special-divisor` | theorem / missing | Lemma 2.13 | Special divisor criterion |
| `linear-system` | theorem / missing | Lemma 2.13 | Complete linear system of a hyperelliptic divisor |
| `nash` | definition / missing | Notation 2.14 | Nash blowup |
| `nash-theta` | theorem / missing | Proposition 2.15, restricted degree | Nash model of a proper theta locus |
| `nash-source` | theorem / missing | Proposition 2.15 | Unrestricted Nash statement in v1 |
| `sum-map` | construction / missing | §2.3; §3.1 | Sum maps from divisors and theta loci |
| `sum-rank` | theorem / missing | Proposition 2.16 | Rank formula at a pair of divisors |
| `canonical-septuple` | construction / missing | Definition 2.17, PDF p.12 | Canonical decomposition of two divisors |
| `septuple-rank` | theorem / missing | Corollary 2.18 | Incorrect expanded septuple rank formula |
| `effectivity-index` | definition / missing | Definition 2.19 | Effectivity index modulo the pencil |
| `effectivity-source` | theorem / missing | p.12 after Definition 2.19 | Incorrect lower bound in v1 |
| `critical-locus` | theorem / missing | Corollary 2.20 | Dimension and indexing of critical loci |
| `perverse` | definition / planned | §3.1 | Middle perversity and intersection complexes |
| `decomposition` | theorem / planned | Lemma 3.1; §3.2 | Geometric decomposition theorem |
| `relative-hl` | theorem / planned | §3.2 | Relative hard Lefschetz |
| `semismall` | definition / missing | Lemma 3.1; Lemma 3.7 | Semismall maps and relevant strata |
| `theta-ic` | theorem / missing | Lemma 3.1 | Theta loci are rational homology manifolds |
| `theta-ample` | theorem / missing | Lemma 3.2 | Successive theta loci are set-theoretically ample sections |
| `theta-low` | theorem / missing | Corollary 3.3 | Low cohomology of theta loci |
| `theta-high` | theorem / missing | Theorem 3.4 | High cohomology of theta loci |
| `intersection-lci` | theorem / missing | Lemma 3.5 | Theta intersections as ample complete intersections set-theoretically |
| `intersection-low` | theorem / missing | Corollary 3.6 | Low cohomology of theta intersections |
| `relative-semismall` | theorem / missing | Lemma 3.7 | Semismallness away from a small locus |
| `ic-kernel` | theorem / missing | Proposition 3.8 and use in Theorem 3.9 | Constant perverse sheaf to the intersection complex |
| `intersection-high` | theorem / missing | Theorems 1.3,3.9 | High cohomology of theta intersections |
| `jacobian-betti` | theorem / missing | §3.2; §4.1 | Exterior cohomology of a Jacobian |
| `betti-conjecture` | definition / missing | Conjectures 1.4,3.10,4.3 | Uniform theta-intersection Betti hypothesis |
| `complex-betti-source` | theorem / missing | Theorems 1.5,3.11 | Source complex exponential Betti bound |
| `perverse-middle` | theorem / missing | §3.2 preceding Theorem 3.11 | Only the middle perverse direct image is nonconstant |
| `weak-high` | theorem / missing | Proposition 3.15 | Alternative high-cohomology range in characteristic zero |
| `chow` | definition / planned | §§3.3,3.5 | Chow operations and Chern classes |
| `symmetric-chern` | theorem / missing | Proposition 3.16, Macdonald input | Chern class of a symmetric power |
| `poincare-cycle` | theorem / missing | Proposition 3.16, [ACGH] input | Poincaré class of a theta locus |
| `general-euler` | theorem / missing | Proposition 3.16 | Euler number of a smooth general Abel-sum fiber |
| `euler-obstruction` | definition / missing | §3.2 | Local Euler obstruction |
| `polar` | definition / missing | §3.2; §3.5 | Polar varieties and multiplicities |
| `morse-source` | theorem / missing | Theorem 3.12 | Incorrect signed Morse inequality as printed |
| `characteristic-cycle` | definition / missing | Theorem 3.12 prerequisite; Sawin §1 | Characteristic cycle with normalized signs |
| `morse-correct` | theorem / missing | Massey input to Theorem 3.12; Sawin Theorem 1.4 comparison | Characteristic-cycle polar bound |
| `higher-discriminant` | definition / missing | Definition 3.13 | Higher discriminants |
| `discriminant-codim` | theorem / missing | Theorem 3.14 input; Migliorini–Shende | Codimension of higher discriminants |
| `discriminant-expansion` | theorem / missing | Theorem 3.14; MS published Corollaries 2.16–2.18 | Euler-obstruction expansion by higher discriminants |
| `abel-motivic` | theorem / missing | §3.2 after Theorem 3.14 | Motivic Abel-fiber decomposition and inversion |
| `transverse-dimension` | theorem / missing | Lemma 3.17 | Transverse slices along a canonical residual stratum |
| `discriminant-strata` | definition / missing | Notation 3.18; §3.5 | Candidate higher-discriminant varieties |
| `discriminant-components` | theorem / missing | Corollary 3.19 | Higher-discriminant component containment |
| `ordinary-double` | definition / planned | Proposition 3.20 | Ordinary quadratic singularity and vanishing module |
| `node-count` | theorem / missing | Proposition 3.20 | Nodal slices of Abel-sum maps |
| `polar-incidence` | construction / missing | §3.5 | Incidence model for polar cycles of V_(r,s) |
| `polar-incidence-generic` | theorem / missing | Lemma 3.21 | Generic incidence realization of the polar locus |
| `polar-coefficient-source` | theorem / missing | Lemma 3.22, PDF p.27 | Disputed polar-cycle coefficient |
| `polar-multiplicity-source` | theorem / missing | Proposition 3.23 | Disputed exponential polar-multiplicity bound |
| `positive-intersection` | theorem / missing | Proposition 3.23; Fulton 12.2(a),12.4 | Nonnegative intersection contributions on an abelian variety |
| `pushforward-sections` | theorem / missing | Lemma 4.1 | Splitting index from sections |
| `reduced-divisors` | definition / missing | §4.1 first proof | Divisors with no hyperelliptic pair |
| `curve-zeta` | construction / planned | §4.1 | Curve zeta series and numerator |
| `curve-reciprocity` | theorem / planned | §4.1 | Curve numerator functional equation |
| `class-zeta` | theorem / missing | §4.1 | Jacobian point count from the curve numerator |
| `curve-rh` | theorem / planned | §4.1; Theorem 4.4 split-place step | Curve Riemann hypothesis and extension counts |
| `reduced-zeta` | theorem / missing | §4.1 equation (7) | Generating series for reduced effective divisors |
| `gonality-points` | theorem / missing | Altuğ–Tsimerman §3, Theorem 3.3 input | Point counts from a finite morphism to P¹ |
| `weil-measure` | definition / missing | [AT] §3; §4.1 | Weil-angle measure and Lindelöf family |
| `gonality-lindelof` | theorem / missing | AT Theorems 3.1,3.3, selected proof read | Sublinear gonality implies Lindelöf |
| `class-asymptotic` | theorem / missing | Theorem 4.2 analytic normalization | Subexponential normalization of the Jacobian count |
| `reduced-coefficients` | theorem / missing | Theorem 4.2 first proof | Reduced-divisor coefficient estimate |
| `theta-density` | theorem / missing | Theorem 4.2 first proof | Asymptotic proportion of effective classes |
| `single-limit` | theorem / missing | Theorem 4.2, source-qualified assembly | One-bundle equidistribution with explicit inputs |
| `theta-betti-bound` | theorem / missing | Theorem 4.2 second proof | Exponential total Betti bound for theta loci |
| `trace-weight` | theorem / planned | §4.1 second proof; §4.2 | Weights for the compact-support counting error |
| `trace-formula` | theorem / missing | §4.1 second proof | Finite-field trace formula |
| `geometric-single-threshold` | theorem / missing | Theorem 4.2 second proof | Threshold for the geometric one-bundle proof |
| `escape` | definition / missing | Conjecture 1.2; Theorem 4.4 | Effective-degree escape modulo κ |
| `joint-normalization` | theorem / missing | Theorem 4.4 proof, p.33 | Correct joint tail normalization |
| `large-ratio-error` | theorem / missing | Theorem 4.4 Case 2 | Error estimate in the large-effectivity-distance case |
| `parity-limit` | definition / missing | Theorem 4.4; Sawin Theorem 1.7 | Parity-conditioned product law |
| `joint-conditional` | theorem / missing | Theorem 4.4, explicit dependency contract | Joint limit conditional on both proof branches |
| `split-place` | theorem / missing | Theorem 4.4 Case 1 | Small split place for a hyperelliptic double cover |
| `linnik-transfer-source` | theorem / missing | Theorem 4.4 Case 1 | Unproved transfer in the small-ratio case |
| `adeles` | definition / planned | Appendix A.1 | Adelic group and integral model |
| `adelic-bundle` | construction / planned | Appendix A.1 | Adelic construction of a vector bundle |
| `weil-bundle` | theorem / planned | Appendix A.1 | Weil double-coset classification |
| `quadratic-torus` | definition / missing | Appendix A.2 | Torus associated with a separable quadratic extension |
| `maxcompact-source` | theorem / missing | Appendix A.2–A.3 | Ramified maximal-compact error in the appendix |
| `integral-torus-model` | construction / missing | Appendix A.3, corrected local model | Unit-level torus dictionary |
| `hecke` | definition / planned | Appendix A.4 | Hecke correspondence of an effective base divisor |
| `hecke-measure` | construction / missing | Appendix A.4 | Hecke measure with automorphism weights |
| `hecke-mixing-source` | theorem / missing | Appendix A.4 | Hecke equidistribution input |
| `sawin-context` | theorem / missing | Later source: Sawin §§1,5, Appendix A | Later characteristic-p theorem to acquire fully |

## Withheld items

- `main-single-source`: G0/G3: retain the version discrepancy; the safe routed theorem below assumes q>4 and explicitly requires the analytic suppliers. This is not a claim for every q.
- `main-joint-source`: G0/G7: record the source claim without accepting its undeveloped function-field Linnik transfer. The precise conditional assembly is routed separately.
- `main-hecke-source`: G7/G8: the subsequence extraction is elementary after bounded-degree finiteness, but the convergence and torus integral-model identification remain unclosed. Unrouted endpoint.
- `weighted-source`: G2: false in characteristic p with one multiplicity p. Corollary 2.4 cannot inherit this infinitesimal proof unchanged. The restricted version is the routed item.
- `nash-source`: G2: reject the literal all-d reading; d=g has smooth target and nontrivial Abel fibers, and d>g has positive relative dimension. Restricted item routed separately.
- `septuple-rank`: G2: false for a ramification point p with D₁=p,D₂=2p and g≥2: H₂=2p,R₁=p, giving min(g,2), whereas D₁ union D₂=2p and the rank is 2+1−h⁰(2p)=1. Cross-overlap between a hyperelliptic part and the other residual part is not subtracted. The union-divisor formula is the routed target; all uses of this expanded formula require rechecking.
- `effectivity-source`: G2: false for generic L of degree g, for which e(L)=0, with g≥2 and a+b=g. RR gives only floor((deg L−g)/2) as a uniform lower bound. Unrouted.
- `complex-betti-source`: G0/G4/G5: the numerical base is withheld because the printed polar calculation and signed Morse inequality require repair. Record the ε-dependent statement exactly; not ≤960^g.
- `morse-source`: G4: K=Q_C[1] on a smooth complex curve has χ=−1 and γ₁=1, giving the false bound 1≤−1. Use effective characteristic-cycle coefficients with the correct dimension signs or a valid absolute-value bound; original Massey statement remains to acquire.
- `polar-coefficient-source`: G5: in cohomology [2]_* on a u-dimensional abelian cycle scales by 2^(2u)=4^u. For r=0,s=1,k=g−2 the displayed coefficient is 2, while the pushforward doubled-curve cycle has coefficient 4. Generic image degree must also be checked. Unrouted numerical display.
- `polar-multiplicity-source`: G5: depends on the disputed preceding coefficient; the lift of a normalization to a proper surjective product also needs a finite base change. Keep qualitative construction but withhold the numerical bound.
- `trace-formula`: G9: generic trace-formula owner is upstream CohomologicalPointCounting/PR196; exact supplier stage and original statement remain to read. Unrouted until checked, rather than assigning this theorem to the weights stage.
- `linnik-transfer-source`: G7: acquire and rederive the positive-characteristic dynamics, entropy/recurrence and variable-place uniformity. A statement that a proof carries over is not a closed supplier. The optional Waldspurger sketch explicitly says the available AT formula is not general enough.
- `maxcompact-source`: G8: for l_v=k_v(√π), the compact anisotropic group l_v×/k_v× contains √π, represented by [[0,π],[1,0]]. Its determinant valuation is odd, invariant under conjugacy and scalar multiplication modulo 2, so it cannot lie in PGL₂(O_v). The unit quotient has index two and is not the maximal compact. Unrouted literal statement.
- `hecke-mixing-source`: G7: exact spectral normalization and function-field Ramanujan supplier not extracted. Do not assert convergence to μ⊗μ across both parity components. Unrouted until the theorem is read.
- `sawin-context`: G6: selected introduction, polar coefficient discussion and Appendix A read, not the complete proof. The coefficient quoted from ST Lemma 3.22 repeats the 2-power requiring reconciliation. Its odd-parity display repeats even×odd twice; the correct mixture has both cross terms. Leave the numeric endpoint unrouted until original final versions and cycle conventions are checked.

## Validation

The custom audit checks unique IDs, exactly one route per routed item, existence of owners/stages, no library item being re-routed, every D/C having three tests, source hashes and the three allowed output paths. Numerical checks verify normalization and parity tails, both joint-mixture marginals, GL₂ counts, the canonical-divisor septuple including ramified multiplicities, the signed constant-sheaf counterexample, multiplication-by-two cycle scaling and the ramified determinant-parity obstruction. These are extraction checks, not Lean proofs. Run `scripts/check_paper.py` and `research/blueprint/intake.py check-files` on the deliverables. No Lean file was supplied or compiled.
