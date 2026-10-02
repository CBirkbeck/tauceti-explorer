# FIX-RT-BP-GlobalGaloisDeformations — confirmed findings /1–/3

Agent: Codex — codex-a71f92. Date: 2 October 2026. Refs #5719.
Immutable input tree: faedbc6e9797a36533dcdcd4468781d003f26af1.
All three confirmed findings are addressed in the packet, reader and suggested file.
This report proposes fixes; it is not an independent acceptance or proof-closure claim.

## /1 — explicit local coefficient hypotheses

The correctly scoped packet statements are preserved verbatim. The native strict_of_full
now takes IsLocalRing A, a surjective π and ker π=maximalIdeal A. The trace theorem also
requires Noetherianity and maximal-ideal adic completeness, matching Gee's C_𝒪; its separate
Artinian-local variant matches Kisin's Theorem1.4.1. The raw Lift carrier is intentionally
more general and does not assert that an arbitrary reduction homomorphism is a residue map.
R03.1 remains the coefficient-category owner; its existing request now states this exact
interface, scalar-unit lifting and compatible Artinian quotient limits. No category is duplicated.

The counterexample is concrete: C=[[0,−1],[1,−1]], S=[[0,1],[1,0]],
a=[[2,5],[5,12]], a⁻¹=[[−12,5],[5,−2]]. These generate S₃, a is an integral unit matrix,
and ā=2I mod5. Set ρ′=aρa⁻¹; the reductions and traces agree. I,C,S,CS have flattened
determinant−3, hence span M₂(𝔽₅), certifying residual absolute irreducibility. Commuting
with S forces z=y,w=x; commuting with C forces y=−y, so the integral centralizer is scalar.
Its GL₂ units are ±I. If bρb⁻¹=ρ′ then a⁻¹b centralizes ρ, so b=±a; reductions2I,3I are
never I. Thus both previous signatures were false over ℤ, even with residual Burnside.
Give S₃ and ℤ discrete topologies to make these actual continuous representations.

The positive example uses A=ℤ/25, a finite Artinian local ring with residue𝔽₅:
its nonunits are exactly the ideal5A. The scalar2 has inverse13, so b=13a is invertible,
reduces to I and acts by the same conjugation. Native tests prove the matrix equalities
and generic local-residue unit lifting; the independent finite program verifies locality.
They do not purport to formalize the entire S₃ counterexample or coefficient category.

## /2 — full adjoint in degree zero and shifted mapping fibre

Set M=ad ρ̄ and M₀=ad⁰ρ̄. The modified global complex has Cglob⁰=C⁰(G,M), Cglobⁱ=Cⁱ(G,M₀) for i>0. Cloc⁰=⊕_{v∈T} C⁰(G_v,M); Cloc¹=⊕_{v∈T} C¹(G_v,M₀) ⊕ ⊕_{v∈S∖T} C¹(G_v,M₀)/L̃_v, where L̃_v is the inverse image of L(D_v)⊆H¹ under Z¹→H¹, embedded in C¹; Clocⁱ=⊕_{v∈S} Cⁱ(G_v,M₀) for i≥2. Negative terms are zero. The degree-zero coboundary of a full matrix is its adjoint commutator, which has trace zero; d(L̃_v)=0 makes the local quotient differential well-defined. Restriction is to full adjoint degree-zero terms at T, to the indicated quotients in degree one, and to all S in higher degrees. Crelⁱ=Cglobⁱ⊕Cloc^{i−1}, with d(φ,ψ)=(dφ,res φ−dψ); thus Crel=Cone(res)[−1], the MAPPING FIBRE, not the unshifted cone of ordinary trace-zero global cochains.

For Schur ρ̄ and T≠∅, under Gee's p>2, p∤n assumptions, finite S,T and T containing all p-adic places, dim H¹rel = #T−1−Σ_{v|∞} h⁰(G_{F_v},M₀)+Σ_{v∈S∖T}(dim L(D_v)−h⁰(G_{F_v},M₀))+dim H¹dual−h⁰(G_{F,S},M₀(1)), with H¹dual the ORDINARY Selmer kernel ker(H¹(G_{F,S},M₀^∨(1))→⊕_{v∈S∖T} H¹(G_v,M₀^∨(1))/L(D_v)^⊥), distinct from H¹ of this framed complex. H⁰rel=0 for nonempty T and H⁰rel=𝔽 for T=∅. For T=∅, H¹rel is ordinary fixed-determinant Selmer H¹; do not apply the displayed Euler formula after dropping its T⊇{v|p} hypothesis. E3's existing #T−1 correction is preserved.

The ordinary dual Selmer kernel is explicitly separate from this framed complex. The
existing R02.5 request now supplies every term, the actual restriction chain map, d²=0,
LES and scalar boundary, coordinating D8 and importing L2's generic fibre. It retains
all existing dyadic/generator-count consumers; odd-p trace splitting is not transferred
to characteristic2. The current L2 packet has ordinary kernels but not this modified
complex, and the current R02.5 packet does not already supply it: the request remains open.
No dummy Prop-valued cohomology structure or second Selmer carrier is introduced.

The source issue E3 and its confirmed review are preserved without modification. The reader's
old #T constant is corrected to #T−1. The native comment-only supplier contract now uses
integer Euler terms, avoiding truncating subtraction. It remains comment-only because
its actual cohomology/coefficient suppliers are absent; it is not a compiled arithmetic theorem.

Rank1, k=𝔽₃, trivial fixed determinant, S=T={3,5}: ad⁰=0 but scalar framings give
k²/diag(k), dimension1. With one framing the quotient dimension is0; with none H¹=0
and H⁰=k. Six new native tests on the actual existing Submodule quotient/diagonal LinearMap
prove the rank-one trace-zero vanishing, injection, dimensions1,0,0, nonzero [(0,1)] class
and empty-boundary kernel. None relies on a numerical surrogate for the quotient.

## /3 — KW constituent detector, Gee spanning, correct Taylor source

The odd-prime existence statement is preserved verbatim: KW's permitted weak image
hypothesis is not strengthened. Only the proof route, dependencies, acceptance and citation
are repaired. R01.4's existing request now exports the KW constituent detector (including
induced/dihedral cases) and the separate Gee whole-adjoint detector. R02.6's existing request
keeps the independent H¹(Gal(E/F),M)=0 input and explicitly includes KW's p=3 branch.
Both variants retain the same existing R04.5/chebotarev-selmer-selection node, unchanged.

Taylor's actual reference is [On the meromorphic continuation of degree two L-functions](https://ftp.gwdg.de/pub/misc/EMIS/journals/DMJDMV/vol-coates/taylor.pdf),
Documenta Mathematica, Extra Volume Coates (2006),729–779; Lemma2.5, printed749–750,
physical21–22. This is KW bibliography[59], not the Fontaine–Mazur paper[58]. The packet
adds this exact source/version/hash and selective read record. The proof writes ad⁰=V⊕W:
W=0 is whole-adjoint detection; dimW=1 chooses outside the inducing quadratic extension;
dimW=2 chooses inside it where χ/χᶜ≠1. A nonzero image of V in the semisimple σ-coinvariant
quotient lets a translate of the initial lift detect the cocycle. No claim that the whole
adjoint is irreducible under KW's hypothesis survives.

At p=3, use KW Lemmas5.2(1) and5.3, including the indicated DDT Theorem2.49 vanishing
argument under the exact totally real/unramified hypotheses. Taylor's l>3 cyclotomic-degree
vanishing step is NOT used there. R01.4 must give the characteristic-three constituent
argument and R02.6 the vanishing; the current Q-only sigma-criterion is not already the
number-field interface. These are explicit supplier requests, not silently admitted completed
extractions of those owners. Prime selection and cardinality remain the shared selector's.

Allowed regression: p=5,F=ℚ, splitting field of X³−2 and its standard S₃ representation.
The polynomial is irreducible and its discriminant−108 is nonsquare, giving S₃ and quadratic
subfield ℚ(√−3). Since ℚ(ζ₅)'s only quadratic subfield is ℚ(√5), the extensions are disjoint:
an intersection would be an abelian quotient of S₃ and hence that quadratic field. The
cyclotomic restriction still has S₃ image and is absolutely irreducible, but
J=C−C⁻¹=[[1,−2],[2,−1]] spans a proper invariant trace-zero sign line; Tate twist preserves
invariant subspaces. Native tests verify J≠0, trJ=0, invariance under C,S, properness inside
ad⁰ and the residual matrix-span determinant. The field argument is elementary written
mathematics, not an asserted compiled theorem about G_ℚ.

## Scope, preservation and source/baseline checks

Five node objects are amended; all61 other node objects and all66 stable IDs are unchanged.
There are19 requests, all still open; four existing requests are sharpened, none replaced.
The existing PA.3/PA.4 consumer contracts, fixAmendment, sourceIssues E1–E3, coverage and
one stage-coarsening gap remain unchanged. The current needs-changes review is copied
verbatim to reviewHistory; the new review object is not_reviewed, with no fixer acceptance.
The old R04.2→R04.1 whole-stage determinant-comparison obstruction and PA.3 stage-input
handoffs are not claimed solved by this narrowly scoped job. No content/campaign or data file changes.

Read WORKERS and all binding protocols; read the whole issue before/after explicit bot
confirmation, all three red-team findings/verifications, the full current suggested file and
reader, affected packet objects, RS-08 keeps/owners, all eight atlas stages and the Chebotarev
link. The aggregate library-coverage has no entries for this roadmap and still lists AUDIT-32
in pendingReview. Therefore the eight-layer AUDIT-32 result and its accepted REV-AUDIT-32
were read directly; its verdict is not built at both pins. Relevant actual R02.5/R02.6 and
L2 packet statements and D8/R01.4 supplier stages were read before tightening requests.

Fresh primary-source reading: Gee physical12–18 and38–39 (the stored arXiv-v2 hash matches);
Kisin's whole four-page Lecture1 via author PDF; KW author-final47–48 and97 (hash matches,
TLS verified); Taylor title and749–750 (hash below). Previous source records stay historical;
this fix does not claim a fresh full extraction of the other papers or supplier roadmaps.

New baseline citations were read with hypotheses at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174
and checked in the pinned index: IsNoetherianRing, RingHom.ker, maximalIdeal, LinearMap.pi/range,
Submodule.Quotient.mk_eq_zero, mem_span_singleton, finrank_quotient_add_finrank,
LinearMap.finrank_range_of_inj and Module.finrank_fin_fun. The original16 baseline records
are unchanged; ten explicit reuse records are added. Rank-nullity is used over the genuine
prime field, with its DivisionRing instance, not over an arbitrary commutative ring.

## Reproducible exact arithmetic regression

The complete standard-library program follows, so it remains reproducible after scratch cleanup.
SHA-256 af434c90e964e326cc7f9f3ff7d4a99be9ae19e641e4839ece00b1dc300e0d13.
Output:279 assertions; six S₃ matrices;625 residual matrix-span elements; five scalar
centralizers; a five-element proper adjoint sign line; rank-one quotient dimensions0,0,1
for zero,one,two framings, with H⁰ cardinalities3,1,1. It proves finite matrix facts only.

```python
"""Independent exact arithmetic regressions; standard Python only, no theorem oracle."""
from itertools import product
from math import gcd
import json
count=0
def check(ok):
 global count
 count+=1
 assert ok
I=(1,0,0,1);C=(0,-1,1,-1);S=(0,1,1,0)
a=(2,5,5,12);ai=(-12,5,5,-2)
def add(x,y):return tuple(u+v for u,v in zip(x,y))
def scale(t,x):return tuple(t*u for u in x)
def mul(x,y):
 return (x[0]*y[0]+x[1]*y[2],x[0]*y[1]+x[1]*y[3],
         x[2]*y[0]+x[3]*y[2],x[2]*y[1]+x[3]*y[3])
def mod(x,p):return tuple(u%p for u in x)
def trace(x):return x[0]+x[3]
C2=mul(C,C);G=[I,C,C2,S,mul(C,S),mul(C2,S)]
check(len(set(G))==6);check(mul(C2,C)==I);check(mul(S,S)==I)
check(mul(mul(S,C),S)==C2);check(mul(a,ai)==I);check(mul(ai,a)==I)
for x,y in product(G,repeat=2):check(mul(x,y) in G)
for x in G:
 xp=mul(mul(a,x),ai)
 check(mod(xp,5)==mod(x,5));check(trace(xp)==trace(x))
check(mod(a,5)==scale(2,I));check(mod(scale(-1,a),5)==scale(3,I))
# For a general integral centralizer, commuting with S gives z=y,w=x;
# commuting with C then gives y=-y, so y=z=0. A scalar integral unit is ±1.
# Hence every GL2(Z) conjugator between these two representations is ±a.
centralizers=[]
for x in product(range(5),repeat=4):
 if mod(mul(x,C),5)==mod(mul(C,x),5) and mod(mul(x,S),5)==mod(mul(S,x),5):
  centralizers.append(x)
check(set(centralizers)=={mod(scale(t,I),5) for t in range(5)})
span={mod(add(add(scale(w,I),scale(x,C)),add(scale(y,S),scale(z,mul(C,S)))),5)
      for w,x,y,z in product(range(5),repeat=4)}
check(len(span)==625)
# A=Z/25 is Artinian (finite). Its nonunits are the multiples of 5,
# an ideal with quotient F5, and every element outside is a unit: local.
nonunits={x for x in range(25) if gcd(x,25)!=1}
check(nonunits==set(range(0,25,5)))
for x,y in product(range(25),repeat=2):
 if x in nonunits and y in nonunits:check((x+y)%25 in nonunits)
 if y in nonunits:check(x*y%25 in nonunits)
 if (x+y)%25==1:check(gcd(x,25)==1 or gcd(y,25)==1)
check(2*13%25==1);check(mod(scale(13,a),5)==I)
check(mod(mul(scale(13,a),scale(2,ai)),25)==I)
frame=[]
for n in [0,1,2]:
 vectors=list(product(range(3),repeat=n))
 classes={tuple(sorted(tuple((v[i]+t)%3 for i in range(n)) for t in range(3))) for v in vectors}
 # Duplicate representatives in the empty diagonal orbit are harmless.
 distinct={tuple(sorted(set(orbit))) for orbit in classes}
 kernel=[t for t in range(3) if all(t%3==0 for _ in range(n))]
 check(len(distinct)==[1,1,3][n]);check(len(kernel)==[3,1,1][n])
 frame.append({"framings":n,"quotient_cardinality":len(distinct),"finrank":[0,0,1][n],"h0_cardinality":len(kernel)})
J=add(C,scale(-1,C2));signline={mod(scale(t,J),5) for t in range(5)}
check(mod(J,5)!=(0,0,0,0));check(trace(J)==0);check(len(signline)==5)
check(mod((1,0,0,-1),5) not in signline)
for x in G:
 xi=next(y for y in G if mul(x,y)==I)
 for v in signline:check(mod(mul(mul(x,v),xi),5) in signline)
check(mod(mul(mul(C,J),C2),5)==mod(J,5))
check(mod(mul(mul(S,J),S),5)==mod(scale(-1,J),5))
# This finite regression proves matrix facts, not a formal theorem about G_Q.
print(json.dumps({"assertions":count,"s3_elements":6,"residual_matrix_span":625,
 "residual_centralizers":len(centralizers),"adjoint_sign_line":len(signline),"rank_one":frame},sort_keys=True))
```

## Validation receipt

The ENTIRE suggested Lean file elaborated in the existing exact-Mathlib build, not a new
Lake project. Final run: exit0,18 admitted-proof warnings,0 errors,0 other warnings;
34 examples,16 new regression examples proved without admissions;3.08 seconds,
peak RSS2560568KiB,66GiB available before compilation. No LSP/cache download/build was used.
Tau Ceti pin f790474821cf4256814db967cb154e7af3d0c369 remains the cohomology source baseline;
its missing oleans and supplier signatures are explicitly comment-only.

Suggested SHA-256:865eaa2c99d23ddc7bc0db2ff669de8783cb3fddcc979f175021c6d8554b6dfa.
Elaboration-log SHA-256:6d83cfca94c54dcf448901632b2e1447cabe334d5096909871570a866e9e28b9.

Actual indexed check_blueprint:0 errors,0 warnings;66 nodes,91 API items,71 definition/construction
unit tests,26 planets,26 baseline citations,19 requests and one preserved gap. Actual intake file
filters:pass for all four deliverables. Preservation:61 unchanged node objects,66 stable IDs;
three source issues and all prior contracts/reviews preserved. Actual assembler:2956 stages,
8639 edges, acyclic projected graph;448 reachable declaration vertices, acyclic concrete graph;
all66 nodes listed, skippedLinks remains[] as before. This is not a whole-stage closure
certificate: the explicitly retained R04.2→R04.1 coarsening obstruction remains unresolved.

Fresh preflight at publish parent da7b4ae9600d7698d191b542286cb26721065951:
20 deliverable/binding/audit/owner/source inputs unchanged from the immutable input tree;
indexed checker, intake, preservation and actual assembly rerun successfully at that parent.
