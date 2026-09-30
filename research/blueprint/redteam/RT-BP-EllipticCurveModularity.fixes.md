# Fixes for RT-BP-EllipticCurveModularity

Codex — session codex-J6LwjP, 30 September 2026. Issue #5045; claim comment 5915346351 confirmed by bot comment 5915348646. Base `d43c40c`. The whole claimed issue was reread after confirmation.

All five findings in the verified result are addressed below, including the four the generated issue body does not quote. The mathematical edits are ready for independent review, but **the stock blueprint checker blocks submission validation** by misclassifying thirteen genuine Tau Ceti stage prerequisites as library declarations. The diagnostic correction and remaining work are recorded explicitly. No checker, generated atlas, upstream roadmap or previous review is edited.

The packet remains partial: 20 nodes, 16 open supplier requests, 16 API entries and 15 named tests. All implementation statuses remain unchecked. Its historical accepted review is preserved exactly and does not certify these changes; the new independent `REV-FIX-RT-BP-EllipticCurveModularity` must review them.

## Finding 1 — import cross-level uniqueness

Deleted the locally owned `R29.3/strong-multiplicity-one-across-levels` node. Its live references are gone; the earlier review's historical account is unchanged. The newform construction, coefficient rationality and final theorem explicitly import Tau Ceti ModularForms Layer 5. The new request specifies positive primitive levels dividing N, weight two, trivial characters and agreement at almost all primes away from N, followed by equality of levels and forms after transport.

Freshly read the pinned `HeckeRing.GL2.Newform` and `Newform.eq_of_forall_notMem_eigenvalue_eq` statements. The former requires `[NeZero N]`; the latter fixes level, weight and character and compares all good indices outside a finite set. It is not a substitute for the requested prime-agreement theorem. The reviewed AUDIT-16 Layer 5 row and the actual supplier text distinguish them too.

Moved the level-11/22 acceptance example to `newform-of-E`. Layer 4 keeps its finiteness, primitive-associate, bad-factor and oldspace uses, but no longer supplies a local re-proof of uniqueness. Its oldspace decomposition is independently needed for finding 3. The suggested file labels the cross-level statement as an imported Layer 5 contract. The construction still begins with M_E dividing N, followed by the separate exact-conductor theorem.

## Finding 2 — make requested prerequisites explicit

Added all eight surviving omitted request/consumer pairs across seven nodes, together with the new Layer 5 and decomposition dependencies. Every one of the resulting **37 request/consumer pairs** now occurs in its consumer's prerequisite list. Six already listed stage prerequisites also now name their consumers in the corresponding requests, so the correspondence holds in both directions.

The individual A_f comparison already has a finer supplier node, `AutomorphicGaloisRepresentations:R19.6/weight-two-tate-module-decomposition`. Its statement was read, and the three R19.6 stage prerequisites were replaced with that node; the redundant stage request was removed. The final constituent argument also imports the existing `R19.1/newform-rank-two-realisation`, whose precise statement supplies absolute irreducibility when r∤2N. Both are imports, not new local theorem nodes.

The production assembly succeeds in memory: 2,840 ordinary stages, 2,891 vertices including virtual upstream suppliers and 8,256 edges. Adding the packet's 39 stage-supplier pairs gives 8,271 distinct edges, still acyclic. The fifteen new pairs are proposed by this packet, not written into generated atlas data. Local node closure and the six genuine Tau Ceti supplier IDs were also checked.

## Finding 3 — retain oldform multiplicities and coefficient fields

The Jacobian formula now indexes primitive newforms by **Galois orbit**, counts τ(N/M) degeneracy copies, and restricts scalars from K_{f,λ} on each local summand:

V_r(J₀(N)) ≅ ⊕_{M|N} ⊕_[f] (⊕_{λ|r} Res_{K_{f,λ}/ℚ_r} ρ_{f,λ})^{⊕τ(N/M)}.

The Jacobian old/new isogeny is an explicit R14.5 request using ModularForms Layer 4; R19.6 supplies only each individual A_f comparison. This does not silently enlarge that supplier's theorem. At N=22 the two level-11 copies give dimension four. The coefficient-field check gives total dimension 2[K_f:ℚ] whether r splits or is inert.

The converse proof also removes the invalid leap from semisimplicity alone to a two-dimensional constituent and the unsupported degree-one-prime assertion. Choose r∤2N and extend scalars to an algebraic closure of ℚ_r. The imported absolute irreducibility theorem makes every scalar summand two-dimensional and irreducible. The surjection to V_r(E) is nonzero on one summand; that restriction is injective and, by dimension, an isomorphism. Frobenius traces are then rational at almost all good primes. Conjugation and Layer 5 show all coefficients are rational integers and identify the form with F_E, so the existing exact-conductor and bad-factor nodes finish the argument. For the other converse, translate a parametrisation to send the rational cusp to O before applying the pointed universal property.

Fresh sources read:

- [Cremona, Chapter II](https://johncremona.github.io/book/fulltext/chapter2.pdf), printed pp. 25–27, especially the oldclass basis and Proposition 2.7.2; SHA-256 `432fa5290b2b2ac0d623169e9198d928e5dd75acb490db2d58775630d0f6ea94`.
- [Darmon–Diamond–Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), author revision 9 September 2007, p. 46 and pp. 85–87, Lemma 1.48 and Theorem 3.1 with proof discussion; SHA-256 `254f6e29957f95219eff046c29478f5ee584615bee12c8aa8357f499c8cbe8b3`. Ribet's underlying proof is an existing R19.1 supplier obligation, not claimed freshly read here.

## Finding 4 — tests that exercise the substantive clauses

Added the two required tests and the verifier's valuation-only case:

| Curve equation | Assertion at 7 | Exact evidence |
| --- | --- | --- |
| y²+y=x³−x²−10x−20 | 7∉Σ | Δ=−11⁵, v₁₁(j)=−5, a₃=−1; Frobenius discriminant 3 mod 7 is nonsquare |
| y²+xy+y=x³−x²−3x+3 | 7∈Σ | (1,0) has order seven; Δ=−2⁷·13, c₄=129, v₂(j)=−7 |
| y²+xy=x³−7x+9 | 7∈Σ, valuation clause only | Δ=−2⁷·137, c₄=337, v₂(j)=−7; a₃=−2 gives nonsquare discriminant 6 mod 7 |

All three have good reduction at 7. The first two distinguish over-inclusion and deletion of both substantive clauses. The third separately detects deletion of the valuation clause; the second alone cannot distinguish the two clauses. No complete classification of rational isogeny degrees or isogeny-only positive test is claimed. The packet and suggested file use the same test names. Prime hypotheses are explicit in the adjacent exceptional-set APIs.

Freshly read [Serre §4.6, pp. 207–208](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), SHA-256 `8048919db24dcb972435aaaa2a74d1168d0fe533af3aa26c6c809b12ddaee038`, to check the definition's arithmetic clauses. The executable exact regression below verifies invariants, point multiples, Frobenius traces, genus counts and scalar dimensions.

## Finding 5 — truthful suggested interfaces and name coverage

The suggested file now imports the built Newform carrier. Its fixed-level `newformOf` takes an explicit existence proof that a level-N, weight-two, trivial-character newform has the curve's prime coefficients away from N, expressed with `WeierstrassCurve.LFunction`. It uses no opaque proposition field. It is a conditional interface: the actual mathematical construction and exact-conductor must supply that proof. It cannot produce a newform at an arbitrary level merely from E. The coefficient, uniqueness and integer-coefficient APIs are actual signatures against that carrier.

Freshly read the pinned `LFunction`, `UpperHalfPlane.qExpansion` and `ModularForm.eta` definitions. The latter two are now recorded in the baseline. The level-11 eta-product identity and both witness tests can therefore be stated for a supplied actual Newform, even before the residual comparison is exported. Corrected the quadratic-twist contract to use its primitive associate and good-prime coefficient comparison.

All **16 API names and 15 test names** occur. A comment-stripping check finds **six actual API declarations and ten actual test declarations**. The remaining ten APIs and five tests have precise commented contracts, with the conductor/residual/isogeny/modular-curve ownership identified and an explicit packet gap. Comments are not claimed to elaborate. All parametrisation contracts retain the chosen isogeny; the degree tests fix that choice.

No Lean was compiled. The shared pinned source trees have no build, and the seven located builds containing Newform have different Tau Ceti commits. None was changed or used as if it were the pin. No Lake environment, cache, library build or language server was started. The earlier review's elaboration claim applies to the earlier file only.

The actual ModularForms Layers 4, 5, 7 and 8g, the EllipticCurves local-field layer, the JacobianChallenge document and the R14.5/R19.6 supplier descriptions were inspected. Reviewed AUDIT-16 rows were read from the combined audit. The combined audit at this snapshot contains no EllipticCurveModularity rows; the accepted REV-AUDIT-32 report was read separately, with its fixed-index SMO scope kept distinct from prime agreement. No new whole-library absence audit is claimed.

## Validator blocker and reproducible checks

The stock checker, including the pinned declaration index, reports **13 errors and zero warnings**. Each error is the same classifier defect: `BASE_REF` accepts the `tauceti:TauCetiRoadmap/` prefix before the known-stage branch. All six referenced suppliers are real, nonretired stages and have requests. Adding fake baseline declarations would misrepresent the libraries and fail the index check. The problem was reported in [issue comment 5915498336](https://github.com/CBirkbeck/tauceti-explorer/issues/5045#issuecomment-5915498336).

A diagnostic run changes only that regexp **in memory**, leaving every repository checker file untouched:

```python
import re, sys
from pathlib import Path
sys.path.insert(0, 'scripts')
import check_blueprint as cb
# Use the actual pinned declarations.tsv as index_path.
index = cb.load_index(index_path)
context = cb.world()
cb.BASE_REF = re.compile(r'^(mathlib|tauceti):(?!TauCetiRoadmap/)(\S+)$')
errors, warnings, summary = cb.check(
    Path('research/blueprint/packets/EllipticCurveModularity.json'), index, context)
assert not errors and not warnings
```

That run passes with **zero errors and zero warnings**, checking all eighteen baseline names against the index. It is diagnostic evidence, not a stock-checker pass. The maintainer must correct the stage classification before the normal submission check can pass. The stock checker and CI must be rerun afterward. Independent mathematical review is still required.

Other checks pass: 37 explicit request/consumer pairs, all names accounted for, original review preserved exactly, the duplicate absent from live fields, every node unchecked, and the combined dependency DAG described above. The 30 arithmetic regression checks pass:

```python
from fractions import Fraction as Q
from math import gcd, prod
checks=0
def check(b):
 global checks
 assert b;checks+=1

def invariants(a):
 a1,a2,a3,a4,a6=a
 b2=a1*a1+4*a2;b4=2*a4+a1*a3;b6=a3*a3+4*a6
 b8=a1*a1*a6+4*a2*a6-a1*a3*a4+a2*a3*a3-a4*a4
 c4=b2*b2-24*b4;delta=-b2*b2*b8-8*b4**3-27*b6*b6+9*b2*b4*b6
 return c4,delta,Q(c4**3,delta)
def trace(a,p):
 a1,a2,a3,a4,a6=a
 return p-sum((y*y+a1*x*y+a3*y-x**3-a2*x*x-a4*x-a6)%p==0 for x in range(p) for y in range(p))
def val(q,p):
 q=Q(q);x=abs(q.numerator);y=q.denominator;n=0
 assert x
 while x%p==0:x//=p;n+=1
 while y%p==0:y//=p;n-=1
 return n
def add(a,P,R):
 if P is None:return R
 if R is None:return P
 a1,a2,a3,a4,a6=map(Q,a);x,y=map(Q,P);u,v=map(Q,R)
 if x==u and y+v+a1*x+a3==0:return None
 if P==R:
  slope=(3*x*x+2*a2*x+a4-a1*y)/(2*y+a1*x+a3)
  intercept=(-x**3+a4*x+2*a6-a3*y)/(2*y+a1*x+a3)
 else:slope=(v-y)/(u-x);intercept=(y*u-v*x)/(u-x)
 X=slope*slope+a1*slope-a2-x-u
 return X,-(slope+a1)*X-intercept-a3
A=(0,-1,1,-10,-20);B=(1,-1,1,-3,3);C=(1,0,0,-7,9)
for a,c,d in [(A,496,-11**5),(B,129,-2**7*13),(C,337,-2**7*137)]:
 c4,delta,j=invariants(a);check((c4,delta)==(c,d));check(delta%7!=0)
check(val(invariants(A)[2],11)==-5)
check(val(invariants(B)[2],2)==-7)
check(val(invariants(C)[2],2)==-7)
check(trace(A,2)==-2)
for a,ap,disc in [(A,-1,3),(C,-2,6)]:
 check(trace(a,3)==ap);check((ap*ap-4*3)%7==disc)
 check(disc not in {x*x%7 for x in range(7)})
P=(Q(1),Q(0));R=None
for k,expected in enumerate([(1,0),(-1,-2),(3,-6),(3,2),(-1,2),(1,-2),None],1):
 R=add(B,R,P);check(R==expected)
# Genus from the index, elliptic points and cusp count.
for N,mu,e2,e3,c,g in [(1,1,1,1,1,0),(2,3,1,0,2,0),(11,12,0,0,2,1),(22,36,0,0,4,2)]:
 check(1+Q(mu,12)-Q(e2,4)-Q(e3,3)-Q(c,2)==g)
tau=lambda n:sum(n%d==0 for d in range(1,n+1))
check(2*tau(22//11)==4)
# Degree-two coefficient field: split and inert give dimension four, before old multiplicity.
check(sum(2*d for d in [1,1])==4)
check(sum(2*d for d in [2])==4)
print(checks,'exact curve, torsion, genus and scalar-dimension checks passed')
```

All source hashes, the regression and the diagnostic recipe are retained here or in the packet. No job scratch needs preservation after opening the PR.
