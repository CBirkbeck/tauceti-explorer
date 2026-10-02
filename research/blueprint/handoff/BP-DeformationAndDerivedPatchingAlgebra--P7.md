# #551 total-jet continuation — Codex, codex-rtOQ9t, 2 October 2026

Partial checkpoint. Winning claim [5958284445](https://github.com/CBirkbeck/tauceti-explorer/issues/551#issuecomment-5958284445), confirmed by [5958287924](https://github.com/CBirkbeck/tauceti-explorer/issues/551#issuecomment-5958287924). Audit base: `06d01f00ec9fc6dc86a2b939c1a02a0fe4494c4d`. Only the four issue deliverables changed. Every implementation remains unchecked and all eight stages remain open.

The packet now has **89 nodes: 47 lemmas, sixteen theorems, eight definitions and eighteen constructions; 108 API items; 89 definition/construction tests plus seven lemma tests; 119 native examples; thirteen planets; 202 baseline references; fifteen gap groups and two unchanged supplier requests**. P7, R03.3 and R03.4 remain partial; five other scoped stages retain not_read status. All 85 inherited node objects, including the exact reserved general multiplicity definition, are unchanged. Source issues and supplier requests are unchanged.

## What this checkpoint closes as a written plan

Four R03.3 declaration nodes integrate J02 and the field-dimension part of J03 of the full predecessor worklist:

- `total-jet-kernel`: the kernel of the already built truncTotalAlgHom is the algebraic variable ideal to the cutoff power. Its written coefficient proof covers arbitrary commutative k, finite σ, r=0 and zero series.
- `total-jet-equivalence`: the actual k-algebra equivalence R/v^r ≃ k[X_i]/p^r, using the native first isomorphism theorem, polynomial representatives and the proven kernel equality. Forward and inverse representative formulas are fixed.
- `total-jet-monomial-basis`: actual monomial classes indexed by degree<r; representation by low coefficients, independent of the representative; finiteness over k. The finite coordinate sum and coefficient map are explicitly inverse, so a mere dimension assertion cannot substitute for the basis.
- `plane-total-jet-finrank`: for any field and every r≥0, dimension binom(r+1,2), obtained by t+1 pairs in degree t. Built length_eq_finrank then computes length **over k**.

All six new APIs and seven packet tests have admitted native signatures. Tests distinguish the zero cutoff, residue cutoff, total versus inclusive rectangular truncation, mixed monomials over F₂ and nonzero nilpotent coefficients over Z/4. The two-variable r=3 field length is six.

The generic third-isomorphism and surjective scalar restriction are already built. New baseline citations record Ideal.map_pow, DoubleQuot.quotQuotEquivQuotSupₐ and Module.length_eq_of_surjective, rather than adding duplicate nodes. They identify (R/(f))/n^r with R/((f)+v^r), and preserve its length under R→R/(f), on the actual native quotients and scalar towers.

## Checked boundaries and exact receipts

The indexed checker reports zero errors and zero warnings. Actual intake check-files passes for all four deliverables. The full Mathlib-only suggested file elaborates using an existing Lean 4.34.0-rc2 build at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: **zero errors, 253 admitted-proof warnings, zero other warnings**, elapsed=23.61 maxrss=3541096. Available memory before the initial and final compilation was 69 GiB. No new Lake project, library build, cache download, language server or Tau Ceti import was used. Tau Ceti baseline statements retain their source pin `f790474821cf4256814db967cb154e7af3d0c369`.

Final suggested file SHA-256: `d3615237cefa3ce05bf28587d0006351e72dd879c73971162b42b4d1f915f321`. Successful final compile-log SHA-256: `5429d0677cec6e66147c5b59ad075323c978e4f666a29baf07cc7784f1d28073`. Proposed definitions, APIs and examples in this continuation all use admitted bodies; this compilation checks their actual native types, not the mathematical proofs.

Two separate native applications of the built double quotient and scalar length theorem were proved with no admitted axioms. Their printed axiom sets are exactly propext, Classical.choice and Quot.sound. Their checked source is archived in a block comment in the allowed suggested file at [commit 9bc8dab](https://github.com/CBirkbeck/tauceti-explorer/blob/9bc8dab8840a5ba9f68f6bb1f645aa91bd8e3d80/research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean). To reproduce, read that immutable file and remove the outer block-comment delimiters around BEGIN CHECKED TOTAL JET BASELINE EXPERIMENT through END CHECKED TOTAL JET BASELINE EXPERIMENT; run the resulting complete file in the existing pinned build. No standalone Lean file is needed outside the allowed suggested file. Checked complete-file SHA-256 `963d788a81dc563021dfc6365b8605db52386d9dfce81d27af847ed8b91033ad`, fragment SHA-256 `923702cd7ecf0c4e7c3ec71d3c540c45c5c2aae5e9ee395965d37709a0e4c93e`, compile-log SHA-256 `5b14cb81263e55f196ed3494cdb9df00c9a52fe8f91fe462f3579f5409c924a5`; elapsed=23.71 maxrss=3534500. The final suggested file removes the private experiment and retains admitted baseline-application examples. These two proofs establish the built generic applications; they do not prove the new kernel or basis.

The unchanged durable predecessor finite program below was reproduced: **507 models, 25,148 assertions**, including characteristics 2, 3, 5 and 7, the shifted bounds, nonreduced equation and nonprincipal initial-ideal counterexample. Script SHA-256 `ed9dc3d82ba5b988e95634bfd035821efcd4ebda2e552465c757e38b9df73a35`, output SHA-256 `058a580c33c92c372851ded432b1740fb069243fa5e19a24943c6a3c86b182d5`. Extract the existing Python block headed “12. Reproduction” to an own scratch script and execute it. Its finite checks are not proofs for arbitrary formal series.

The actual repository assembler was called read-only with the current part overlaid beside the existing R03.6 part, with all other promoted packets/definitions unchanged. Actual stage graph: 3003 vertices and 8623 edges, acyclic. Own declaration graph: 89 vertices and 135 edges, acyclic. Combined stage/reachable-declaration graph: 3080 vertices and 8848 edges, acyclic, with 90 reachable declarations. Whole-roadmap declaration listing: 142, with nineteen planets; this part lists 89 and thirteen. No skipped links for this roadmap and all other skipped-link records match the control. Stage edges are unchanged.

**Inherited supplier-path gap:** twelve of thirteen computed scope/request stage pairs are reachable. The requested LocalFieldsRamification layer 0 → R03.4 path is absent in the assembled stage graph, in both current and control projections. The existing local-field interpretation request and its gap now explicitly record this; no stage edge is fabricated or edited here. The new total-jet nodes add only same-stage declaration dependencies. The required external integrated depth node remains visible in the reachable declaration closure.

## Fresh reading and remaining source obligations

The issue was read in full before claim and again after the bot confirmed it. All eight current reviewed AUDIT-17 scope entries, applicable accepted RS-08 keeps and owner assignments, all eight atlas stage descriptions and touching edges, matching link/overlap records, the complete latest merged handoff and all 85 inherited node statements were personally read. Two nearby upstream roadmap documents had already been read in this continuous session (StableReduction and Jacobian); this continuation does not claim new full reads of the many routed papers.

Fresh pinned source reads are itemized with file hashes and intervals in HS-TOTAL-JET-PIN. Bounded searches of both pinned trees located the built truncation, third-isomorphism and length restriction. No claim of exhaustive library absence is made. Public [Stacks 00K4](https://stacks.math.columbia.edu/tag/00K4) and [0AZU](https://stacks.math.columbia.edu/tag/0AZU) were freshly inspected through their mathematical sections. Their cumulative exponent conventions remain distinct; the inherited general definition uses n+1. Source issues retain their historical status; no new erratum or paper-route closure is asserted.

The next mathematical work is the remaining J03 and the length part of J06: identify v as the constant-coefficient kernel over a field, use the actual residue action on finite v-filtration pieces, prove R-module length equals k-dimension for finite modules killed by v^r, then apply the already built double-quotient/scalar comparisons to the existing shifted sequence. A field-length computation cannot substitute for this comparison because k→R is not surjective.

Continue J07–J16 with the full tangent-cone kernel, all-index curve lengths, eventual polynomial, dimension and compatibility with the existing general intrinsic and ambient multiplicities, retaining f=0/unit boundaries, positive characteristic and nonreduced equations. The general graded Hilbert–Serre induction still needs actual homogeneous kernels/cokernels, quotient scalars, finite lengths, the anchored polynomial and threshold; it is not closed by this finite-jet checkpoint. All perfect-complex, patching, depth, completion and routed-paper obligations in the preserved handoff and packet remain binding. Coherent duality keeps its existing external reserved owner.

## Reproduce the actual assembler projection

Run this standalone Python program from the repository root, storing it in an own disk-backed scratch directory. It uses the repository assembler and checks against the immutable audit base, including the inherited missing supplier path, complete unchanged node objects, scope and source/JSON boundaries. It writes only its own scratch receipt. Script SHA-256 `bdc303832123649543c03abf2ea3f740745daee849533651c8d7a8ec7b5d583a`.

```python
import json,sys,subprocess,hashlib,re
from pathlib import Path
from collections import defaultdict,deque
root=Path.cwd();sys.path.insert(0,str(root/"scripts"));import build
rid="DeformationAndDerivedPatchingAlgebra"
stem=rid+"--P7"
packetpath="research/blueprint/packets/"+stem+".json"
roadmappath="research/blueprint/atlas/roadmaps/"+rid+".json"
base="06d01f00ec9fc6dc86a2b939c1a02a0fe4494c4d"
p=json.loads((root/packetpath).read_text());r=json.loads((root/roadmappath).read_text())
old=json.loads(subprocess.check_output(["git","show",base+":"+packetpath],text=True))
oldr=json.loads(subprocess.check_output(["git","show",base+":"+roadmappath],text=True))
load=build.load_promoted
def assemble(packet,definition):
 def overlay(*a,**k):
  ps,ds,defs=load(*a,**k)
  return ([(n,v) for n,v in ps if n!=stem]+[(stem,packet)],
   {**ds,stem:"research/blueprint/readmes/"+stem+".md"},
   defs)
 build.load_promoted=overlay
 return build.assemble(require_distances=False)[0]
a=assemble(p,r);control=assemble(old,oldr)
def dag(vertices,edges):
 vertices=set(vertices)|{x for e in edges for x in e};following=defaultdict(set);indegree=dict.fromkeys(vertices,0)
 for s,t in set(edges):
  following[s].add(t);indegree[t]+=1
 q=deque(v for v in vertices if not indegree[v]);seen=[]
 while q:
  v=q.popleft();seen.append(v)
  for w in following[v]:
   indegree[w]-=1
   if not indegree[w]:q.append(w)
 assert len(seen)==len(vertices),("cycle",sorted(v for v in vertices if indegree[v])[:10])
 return {"vertices":len(vertices),"edges":len(set(edges)),"acyclic":True}
se={(e["source"],e["target"]) for e in a["stageEdges"]}
ce={(e["source"],e["target"]) for e in control["stageEdges"]}
assert se==ce
stageids={s["id"] for s in a["stages"]}
own={n["id"]:n for n in p["nodes"]}
oe={(dep,n["id"]) for n in own.values() for dep in n.get("prerequisites",[]) if dep in own}
stageDAG=dag(stageids,se);ownDAG=dag(own,oe)
allnodes=dict(own)
for folder in ("data/decompositions","data/blueprints","research/blueprint/packets"):
 for path in sorted((root/folder).glob("*.json")):
  for n in json.loads(path.read_text()).get("nodes",[]):allnodes.setdefault(n["id"],n)
used=set(own);todo=list(own)
while todo:
 v=todo.pop()
 for d in allnodes[v].get("prerequisites",[]):
  if d in allnodes and d not in used:used.add(d);todo.append(d)
edges=set(se)
for v in used:
 n=allnodes[v]
 parent=n.get("parentStageId")
 if parent:edges.add((parent,v))
 for d in n.get("prerequisites",[]):
  if d in stageids or d in used:edges.add((d,v))
for request in p["requests"]:
 for v in request["neededBy"]:edges.add((request["supplier"],v))
combined=dag(stageids|used,edges)
following=defaultdict(set)
for s,t in se:following[s].add(t)
def reachable(s,t):
 todo=[s];seen=set()
 while todo:
  x=todo.pop()
  if x==t:return True
  if x not in seen:seen.add(x);todo+=list(following[x])
 return False
pairs=set()
for stage in r['stages']:
 for dep in stage.get('requires',[]):pairs.add((dep,rid+':'+stage['key']))
def stage_of(v):
 seen=set()
 while v in allnodes and v not in seen:
  seen.add(v);v=allnodes[v].get('parentStageId')
 return v
for n in own.values():
 for d in n.get("prerequisites",[]):
  if d in stageids and d not in allnodes and d!=stage_of(n['id']):pairs.add((d,stage_of(n['id'])))
for req in p["requests"]:
 for v in req["neededBy"]:
  target=stage_of(v)
  if req["supplier"]!=target:pairs.add((req["supplier"],target))
missing=[(s,t) for s,t in pairs if not reachable(s,t)]
inheritedMissing=[("tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions",rid+":R03.4")]
assert missing==inheritedMissing,missing
assert p["requests"]==old["requests"]
ar={x["id"]:x for x in a["roadmaps"]};cr={x["id"]:x for x in control["roadmaps"]}
assert ar[rid]["blueprint"]["declarations"]==142
assert ar[rid]["blueprint"]["planets"]==19
assert ar[rid]["blueprint"]["skippedLinks"]==cr[rid]["blueprint"]["skippedLinks"]
assert all(ar[x].get("blueprint",{}).get("skippedLinks")==cr[x].get("blueprint",{}).get("skippedLinks") for x in cr)
for key in ("sourceIssues",):
 assert p[key]==old[key],key
on={n["id"]:n for n in old["nodes"]}
for id,n in on.items():
 for key in ("id","kind","statement","hypotheses","api","sources","implementationStatus","uses"):
  assert own[id].get(key)==n.get(key),(id,key)
 assert all(t in own[id].get("tests",[]) for t in n.get("tests",[]))
 assert all(a in own[id].get("acceptance",[]) for a in n.get("acceptance",[]))
assert p["baseline"]["declarations"][:len(old["baseline"]["declarations"])]==old["baseline"]["declarations"]
unchanged=sum(own[id]==n for id,n in on.items())
lean=(root/("research/blueprint/suggested/"+stem+".lean")).read_text()
for node in p["nodes"][len(old["nodes"]):]:
 for test in node.get("tests",[]):assert test["name"] in lean,test["name"]
for node in p["nodes"][len(old["nodes"]):]:
 for api in node.get("api",[]):assert api["name"].split(".")[-1] in lean,api["name"]
allowed={packetpath,"research/blueprint/readmes/"+stem+".md","research/blueprint/suggested/"+stem+".lean","research/blueprint/handoff/BP-"+stem+".md"}
changed=set(subprocess.check_output(["git","diff","--name-only",base],text=True).splitlines())
assert changed<=allowed,changed
for path in changed:
 assert not re.search(r"/(?:home|tmp|Users)/|file"+"://",(root/path).read_text()),path
result={"actualAssembler":True,"declarations":142,"partDeclarations":89,"partPlanets":13,"planets":19,"ownSkippedLinks":ar[rid]["blueprint"]["skippedLinks"],
 "stageDAG":stageDAG,"ownDeclarationDAG":ownDAG,"stagesAndReachableDeclarations":combined,
 "reachableDeclarations":len(used),"externalDeclarations":sorted(used-set(own)),
 "requiredStagePairs":len(pairs),"requiredStagePairsReachable":len(pairs)-len(missing),"inheritedMissingStagePairs":missing,"stageEdgesUnchanged":True,
 "otherSkipsMatchOriginal":True,"unchangedNodeObjects":unchanged,
 "scriptSha256":hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
Path(__file__).with_suffix(".json").write_text(json.dumps(result,indent=2)+"\n")
print(json.dumps(result,indent=2))
```

## Complete predecessor handoff (unchanged)

# Codex — codex-a71f92 jet-map continuation of #551

Latest receipt first; the complete predecessor handoff and reproduction
program follow unchanged. 2026-10-02. Claim 5957656405 was confirmed by bot
5957659158, followed by a complete reread of the issue. Initial read
base: eb645dc85df65608c56fafc4d9ed0e71ab0ca3ce. Publication parent:
b9239798babb94f290b4302764f457bacfe87d36. This is a partial blueprint checkpoint, not
independent review or mathematical implementation.

## What changed

Six canonical R03.3 nodes integrate the first shifted-quotient strand of the
predecessor plane-curve proof: variable-ideal power/order membership,
denominator containment, native shifted multiplication with its projection,
exact-order injectivity, range/kernel right-exactness, and the distinct
small-index branch. The finite-variable extension groups coefficients into
a finite sum of degree-r monomial multiples; it never asserts ideal closure
under an infinite sum. Well-definedness and right-exactness work over any
commutative coefficient ring; injectivity needs exact finite order and no
zero divisors.

The existing Mathlib order_mul is reused, not re-planned. The denominator
uses Submodule.comap of the actual LinearMap.mulLeft, not Ideal.comap.
The constructor is native mapQ and the projection native factor on ordinary
ideal quotients. No new generic jet, graded, local-ring or multiplicity
carrier is introduced. The explicit finite ENat order premise rejects the
zero equation for injectivity, while d=0 and zero multiplication are
allowed adapter boundary cases.

All 79 inherited node objects, statements and IDs are identical. Every
source finding, request, reserved-key definition and planet is preserved.
Inventory: 85 nodes (8 definitions, 16 constructions, 45 lemmas,
16 theorems), 102 API items, 83 definition/construction tests and six lemma
tests, 110 native examples, 191 baseline declarations, 13 planets, 15 gaps
and two requests. Three stages remain partial and five not_read. Every
implementation remains unchecked. The original fourteen gaps remain;
the extra gap records the admitted jet proofs and the unintegrated
formal-curve comparisons.

## Checks and exact limits

The whole suggested Mathlib-only file elaborates with Lean v4.34.0-rc2 at
the existing exact Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 build:
0 errors, 234 admitted-proof warnings, no other warnings, 110 examples,
21.73 seconds, maximum RSS 3,527,296 KiB. Before this successful run 70 GiB
were available. No Tau Ceti import, library build, cache download, new Lake
project or language server was used. File SHA-256:
e3164f12e7f6f3719fdf4c61fd6abae12d009eaf1ec3441215f4f0203fd7f274.
Full output SHA-256:
aa871b8d5295369575cc5a75f222677098ab37a65f53f1fc3055f9a5b5fc04ce.
The substantive planned proofs are admitted; this is signature validation,
not formal closure.

The exact predecessor program below was freshly reproduced unchanged:
507 cases, 25,148 assertions, script SHA-256
ed9dc3d82ba5b988e95634bfd035821efcd4ebda2e552465c757e38b9df73a35
and output SHA-256
058a580c33c92c372851ded432b1740fb069243fa5e19a24943c6a3c86b182d5,
matching the published receipt. This finite calculation is not a proof of
arbitrary series, scalar restrictions or general multiplicity. The earlier
grading/induction programs were not rerun in this checkpoint.

The six new signatures and every new API/test are in the native file and
reader. The four deliverables are validated using the actual indexed
blueprint checker and actual intake file checks against the immutable
publication base. The normal atlas assembly is executed read-only with
this part overlaid in memory, and its stage graph and reachable current
declaration graph are checked for cycles. No repository snapshot or
checkout mutation is needed. The final graph counts are recorded after
that run: indexed checker 0 errors/warnings, intake pass; actual assembly
2,952 stages and 8,623 edges, acyclic; all 85 declarations from this part
listed (138 whole-roadmap declarations), no skipped links; reachable
declaration graph 260 vertices and 130 own edges, acyclic. All four target
blobs and binding instructions/owner inputs were freshly confirmed
unchanged before publishing on the current main parent.
No independent review or whole-source erratum audit is claimed.

## Sources, ownership, and where to resume

Read the full issue before and after winning the claim; the whole current
handoff, all 79 original mathematical statements, all eight current
AUDIT-17 records, accepted RS-08 applicable keeps/review/owners, the matching
link-map overlap and stage edges, and all eight atlas stage descriptions.
Nearby upstream density readings include the earlier stable-reduction and
Jacobian roadmaps and the current complete GrothendieckEulerForms roadmap.
Fresh primary reads cover all mathematical statements/proofs in Stacks
00K4 and 0AZU. Remark 032C was inspected as a statement only; it is not a
new native multivariate dimension proof. The packet records exact pinned
source intervals and file hashes. The complete built weightedOrder_mul
proof was personally read. Bounded source searches are not an exhaustive
absence claim.

Next, integrate J02–J03 and the remaining part of J06: native polynomial
total-jet equivalence/basis, finite length versus coefficient-field
dimension, length restriction along a surjective ring map, and the actual
quotient-of-quotient equivalence with A/n^(N+1). Reuse the already-built
truncTotalAlgHom (into the polynomial ideal quotient) and adic completeness.
Then canonically register J07–J16: full tangent-cone kernel, all-index jet
lengths, graded pieces, eventual polynomial, intrinsic/ambient multiplicity
comparison, positive-characteristic/nonreduced and nonprincipal
counterexamples, and source-qualified coordinate/unit/field-extension
comparisons. Preserve the exact nonzero/unit and coefficient-domain
hypotheses. Do not redefine multiplicity as equation order.

The general homogeneous kernel/cokernel Hilbert–Serre induction remains
independently open, including its anchor and threshold. So do
degree/dimension, Artin–Rees, associativity, Nagata, parameters, completion,
coefficient categories, derived base change, minimal/filtered-colimit
comparisons, patching and all routed papers' source closure.
No stage or key definition is certified closed.

## Complete predecessor handoff (unchanged)

# BP-DeformationAndDerivedPatchingAlgebra--P7: formal plane-curve jet checkpoint

ChatGPT — `gpt6astra-20261002-7d2f90`. Refs #551. 2 October 2026.
Claim 5956883551 was confirmed by bot comment 5956885951; the issue was reread
after confirmation. Publication base:
`d0ee3b9e6c08178c5731865831db82b409306dbb`.

**Partial source-proof checkpoint, not canonical blueprint integration or a
mathematical implementation.** This submission changes only this handoff.
It addresses the explicit formal plane-curve comparison left open in the
canonical reader, with actual quotient maps, the complete tangent-cone
kernel, and an exact length formula at every index. It supplies
characteristic-sensitive and nonreduced examples and 25,148 executed finite
regressions. Native signature integration and the general multiplicity
construction still remain open.

## 1. Preserve the preceding native grading work

The full preceding checkpoint, its exact registered IDs, the generic
Hilbert–Serre continuation, compilation receipts and reproduction programs
are preserved at [the immutable publication-base handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/d0ee3b9e6c08178c5731865831db82b409306dbb/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md).
Its link to the preceding kernel/cokernel source proof remains part of that
history. This continuation does not replace the native graded carriers or
restart the packet.

The inherited inventory is 79 nodes (8 definitions, 15 constructions,
40 lemmas, 16 theorems), 99 API entries, 79 definition/construction tests plus
four lemma tests, 104 native examples, 176 pinned baseline references,
13 planets, 14 gaps and two requests. These are the predecessor's counts,
not a fresh full-packet census. The canonical packet, reader and suggested
file are unchanged. Every registered ID, source finding, request, coverage
record and unchecked implementation status is retained. All eight stages
remain open. In particular the following seven IDs are not replaced:

- `DeformationAndDerivedPatchingAlgebra:R03.3/adic-ring-homogeneous-components`
- `DeformationAndDerivedPatchingAlgebra:R03.3/adic-ring-homogeneous-decomposition`
- `DeformationAndDerivedPatchingAlgebra:R03.3/adic-ring-grading-registration`
- `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-homogeneous-components`
- `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-homogeneous-decomposition`
- `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-homogeneous-scalar-action`
- `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-grading-registration`

Those declarations use the existing adic Rees ring and module quotients.
Their degree components are the ranges of the actual quotient inclusions;
their decomposition maps are finite expansions. The ring registers
`GradedAlgebra`, the module registers `DirectSum.Decomposition` and
`SetLike.GradedSMul`, and the action is the original quotient action.
Individual component projections are only linear over the coefficient
ring. The notation `gr` below refers to those same objects and their
existing degree-quotient comparisons, not a new stand-in carrier.

The reserved identifier
`DeformationAndDerivedPatchingAlgebra:key/hilbert-samuel-multiplicity`
continues to define the general invariant for finite modules and ideals of
definition over Noetherian local rings. The order of an equation is a
specialization theorem, not a replacement definition of multiplicity.

## 2. Hypotheses and the precise target

Let k be any field and put

    R = k[[x,y]],   m = (x,y),   A = R/(f),   n = m A,

where f is nonzero and has zero constant coefficient. Thus

    d = ord(f) >= 1

is finite. No perfectness, algebraic closedness, characteristic restriction,
reducedness, or irreducibility is imposed. In particular repeated equations
are included. The field assumption is material to the product-order
argument; the general Hilbert–Samuel definition is not being restricted
to fields.

Use the existing convention

    H(N) = length_A(A / n^(N+1)),   N >= 0.

It is initially an extended-natural-valued length. We prove finiteness
before interpreting it as a natural number or a rational number. Define
h(j) as the length of the actual degree quotient n^j/n^(j+1), for j>=0.
The claim is

    H(N) = choose(N+2,2)
           - (choose(N-d+2,2) if N >= d, otherwise 0),        (1)
    h(j) = min(j+1,d).                                       (2)

In particular an eventual rational polynomial is

    P_f(T) = d T + d(3-d)/2,                                 (3)

valid for every N>=d-1. This is a safe threshold, not a claim that it is
always minimal. The intrinsic multiplicity is d. The ambient-normalized
multiplicity of the same finite module A over the two-dimensional ring R
is zero in degree two. Sections 3–8 prove these statements and the actual
comparison maps.

For f=0 the quotient is the regular two-dimensional ring R, not a plane
curve of finite equation order. For a unit f the quotient is the zero ring,
not a nontrivial one-dimensional local ring. Neither case is silently
passed to `order.toNat`, which would lose the distinction for f=0.

## 3. Powers, finite jets and the coefficient-ring length comparison

For r>=0, a series g belongs to m^r exactly when all coefficients of total
degree less than r vanish. The forward implication follows from the
coefficient formula for products. For the reverse implication, assign
an exponent (i,j) with i+j>=r to the degree-r monomial

    x^min(i,r) y^(r-min(i,r)).

The remaining two exponents are nonnegative. Group all assigned
coefficients into r+1 formal series, indexed by 0,...,r. Their finite sum
of multiples of these degree-r monomials is exactly g, coefficient by
coefficient. Thus this is membership in the algebraically generated ideal
m^r, not an assertion that an ideal is closed under an unspecified infinite
sum. It includes r=0. It also identifies this filtration with the native
total-degree order from `MvPowerSeries.order`.

The constant coefficient map R->k is surjective with kernel m. A series
with nonzero constant coefficient c is a unit: write it as c(1+u), where
u has positive order. In each fixed coefficient the formal geometric
series for (1+u)^(-1) has only finitely many contributing terms, and
multiplication verifies the inverse. Conversely a unit has invertible
constant coefficient. Consequently R is local with residue field k.
Since f belongs to m, A is also local, with maximal ideal n and residue
field k.

For N>=0 the native `MvPowerSeries.truncTotal (N+1)` retains exactly the
monomials of total degree at most N. Its coefficient formula and the
preceding power criterion give the actual isomorphism

    k[X,Y]/(X,Y)^(N+1)  ->  R/m^(N+1),                       (4)

induced by polynomial inclusion. It is surjective by truncation and its
kernel is precisely the displayed polynomial ideal. The classes of
x^i y^j, i+j<=N, are a k-basis. In particular its dimension is
choose(N+2,2).

Truncation itself is linear, not a ring homomorphism into the unquotiented
polynomial ring. Its multiplicativity is only asserted after passing to
(4); the pinned coefficient-of-product comparison supplies exactly that
statement. The pinned operations `trunc` and `trunc'` instead use
componentwise bounds on exponent vectors and must not be substituted for
the total-degree cutoff.

For every finite-dimensional R-module V annihilated by some power of m,
its R-length equals its k-dimension. Indeed filter by m^i V until zero.
Each subquotient is annihilated by m, hence has its actual k=R/m action.
Its submodules are exactly its k-subspaces, so its length is its finite
k-dimension. Additivity along these finite exact sequences proves the
claim for V. The same argument applies to A and n. It does not assert
that an arbitrary k-basis spans an R-submodule filtration.

In particular all modules in (4) have finite length. For modules with an
A-action, restriction along the surjection R->A preserves the submodule
lattice and length. This is the comparison used below, matching the
existing `Module.length_eq_of_surjective`; no implicit change from
R-length to A-length is made.

## 4. Lowest terms and multiplication by the equation

For a nonzero series g of order e, its lowest homogeneous polynomial is

    in(g) = truncTotal (e+1) g,

since every coefficient of degree below e vanishes. This reuses the native
polynomial-valued truncation. The existing
`MvPowerSeries.homogeneousComponent e g` is instead a power series; its
coefficient comparison identifies it with the polynomial above after
polynomial inclusion.

For nonzero f,g of orders d,e, respectively, the native theorem
`homogeneousComponent_mul_of_le_order` identifies the degree d+e component
of fg with in(f) in(g). All lower components vanish. Both initial
polynomials are nonzero, and k[X,Y] is a domain, so their product is
nonzero. Consequently

    ord(fg) = d+e,   in(fg) = in(f) in(g).                      (5)

This also proves that R is a domain. The coefficient identity is already
in the pinned library; it is not a proposed new generic multiplication
API. Equality of orders needs the nonzero-product argument, not merely
the existing lower-bound theorem `le_order_mul`.

If N>=d, multiplication by f defines a short exact sequence of actual
R-modules

    0 -> R/m^(N+1-d) --[g] |-> [fg]--> R/m^(N+1)
      -> A/n^(N+1) -> 0.                                    (6)

Well-definedness follows from (5), or the product-order lower bound when
a representative is zero. If fg belongs to m^(N+1), then either g=0 or
(5) implies ord(g)>=N+1-d; this proves injectivity. The cokernel is
R/((f)+m^(N+1)), identified with A/n^(N+1) by the quotient map. Its
kernel in the middle term consists precisely of residue classes of
multiples of f, proving exactness and surjectivity.

The first arrow in (6) is R-linear, not an algebra homomorphism. Also the
source exponent is formed only under N>=d. When N<d, f belongs to
m^(N+1) and instead the actual quotient map gives

    R/m^(N+1) = A/n^(N+1).                                  (7)

One must not replace N-d by truncated natural subtraction in (6) and
assert that sequence in the range N<d. For example f=x^4,N=0 would
produce a nonzero alleged source mapping to zero.

Take finite lengths in (6) and use (4) and the restriction-of-scalars
comparison. This proves (1); (7) handles every small index. A
subtraction-free formulation for N>=d is

    H(N) + choose(N-d+2,2) = choose(N+2,2),                   (8)

which avoids extended-natural or truncated-subtraction pitfalls in a
native signature. All terms are now known finite.

For j>=1 use the actual quotient sequence

    0 -> n^j/n^(j+1) -> A/n^(j+1) -> A/n^j -> 0.

Subtracting the finite lengths computed in (1) gives (2); for j=0,
A/n=k gives h(0)=1. In particular this also proves H(N)=sum_(j=0)^N h(j)
with the correct endpoint, rather than presuming a graded/cumulative
indexing convention.

## 5. The complete tangent-cone kernel

Let G=in(f), a nonzero homogeneous polynomial of degree d. The existing
adic associated graded ring of A has its degree-j quotient n^j/n^(j+1).
Send X,Y to the actual classes of x,y in degree one. This constructs a
graded k-algebra homomorphism

    theta : k[X,Y] -> gr_n(A).

For each j, every class of n^j/n^(j+1) lifts to a series in m^j.
Keeping only its degree-j terms shows that theta is surjective in that
degree, and hence surjective on the graded ring.

We check the entire kernel. Let F be homogeneous of degree j and suppose
its degree-j image vanishes. Under polynomial inclusion into R this says

    F = f g + r,   r in m^(j+1),                             (9)

for some g in R. If j<d, then fg and r both have order at least j+1,
forcing F=0. If j>=d and g is nonzero, (9) gives fg in m^j, and (5)
gives ord(g)>=j-d. Taking degree-j components in (9) therefore gives

    F = G g_(j-d),

where g_(j-d) is the degree-j-d homogeneous polynomial of g. The case
g=0 gives F=0 directly. Conversely every homogeneous multiple of G has
zero image, because the same polynomial multiple of f vanishes in A and
differs from it only in higher degree. This proves the degreewise kernel.
The direct-sum decomposition separates homogeneous components; applying
this argument to the finitely many components of an arbitrary polynomial
proves the full ideal identity

    ker(theta) = (G).

Thus theta induces the actual graded algebra isomorphism

    k[X,Y]/(G)  ->  gr_n(A).                                 (10)

Its specification includes the images of X,Y and compatibility with each
native quotient inclusion. It is not merely an equality of Hilbert
functions, and it is not a replacement definition of `gr_n(A)`.

The principal-ideal hypothesis is essential to the displayed argument.
For example I=(x^2+y^3,xy) also contains

    y(x^2+y^3)-x(xy)=y^4.

Its initial ideal therefore contains Y^4, which is not in (X^2,XY), the
ideal generated by the initial forms of the two displayed generators.
The actual quotient by I has basis 1,x,y,y^2,y^3: the relation x^2=-y^3
and xy=0 reduce every monomial, while y^4=0. Independence can be seen in
the five-dimensional algebra with these basis vectors, the indicated
products, and all further products forced by those relations. Sending
x,y to its named elements and back verifies inverse maps. Its length is
5. The naive initial-generator quotient has length 7 after truncation
at degree 5. The reproduction checks this distinction in characteristics
2,3,5,7. This is a regression against an incorrect generalization, not a
new source erratum.

## 6. Polynomial, dimension and the existing multiplicity

Summing (2) gives

    H(N) = d(N+1) - d(d-1)/2   for N>=d-1,

which is (3). The formula is over the rational numbers; dividing by 2
here does not divide in the residue field. It remains valid in
characteristic two. For d=4, for example, P_f(0)=-2 whereas H(0)=1.
An eventual polynomial need not give nonnegative values before its tail.

To attach this calculation to the general key definition, retain the
standard input that R is Noetherian of dimension two, as in Stacks
Remark 10.160.9. A is then Noetherian. Its dimension is exactly one:
a prime minimal over (f) is nonzero because R is a domain and f!=0;
the principal ideal theorem gives height one. It is not m, of height
two, so it gives a strict chain in A of length one. Conversely any
chain of length two in A would lift to a chain of three nonzero primes
in R. Prepending (0) gives a chain of length three, contradicting
dim(R)=2. This proves both bounds without identifying a function-field
genus or a normalization invariant with a local-ring dimension.

This use of Noetherianity and dimension is a standard mathematical input,
not a claim that the complete native multivariable power-series dimension
interface is available at the pin. Its exact supplier comparison remains
an integration leaf in Section 10. The explicit length proof in Sections
3–4 does not depend on a general Hilbert–Serre existence theorem.

Any rational polynomial agreeing eventually with H must equal P_f:
the difference has infinitely many rational roots and hence is zero.
Therefore the existing canonical Hilbert–Samuel polynomial, once its
general construction is implemented, compares to P_f by its uniqueness
API. Multiplying the degree-one coefficient by 1! gives

    e(n;A) = d.                                             (11)

This proves the requested equation-order specialization. It does not
define a second multiplicity. Similarly the regular surface R itself has
P_R(T)=(T+1)(T+2)/2 from (4), so its degree-two factorial normalization
gives multiplicity 1, not 1/2.

For the finite R-module A, restriction of scalars gives the same length
function and support dimension one. Its intrinsic multiplicity is still
d, while the degree-indexed value at ambient dim(R)=2 is zero. This is
consistent with the existing intrinsic/ambient convention and is a test
that one extracts the coefficient in the requested degree rather than
multiplying the leading coefficient by a different factorial.

Finally dim_k(n/n^2)=h(1)=min(2,d). Since dim(A)=1, the usual
Noetherian-local embedding-dimension criterion gives

    A regular  iff  d=1  iff  e(n;A)=1.                      (12)

This is a result for this hypersurface family. It is not the general
Nagata converse with an omitted unmixedness hypothesis. The already
recorded nonprincipal example k[[x,y]]/(xy,y^2) has multiplicity one,
embedding dimension two and an embedded associated prime. That known
warning is retained, not presented as a fresh discovery.

## 7. Powers, changes of coefficients and coordinates

For s>=1, put q=n^s. The quotient maps themselves identify

    H_q(N) = H_n(s(N+1)-1).

There is no negative index because s>=1. Substitution into the proven
tail formula gives, whenever s(N+1)>=d,

    P_q(T) = ds T + ds - d(d-1)/2,
    e(q;A) = s d.                                           (13)

This confirms the existing general power-ideal contract in a case where
both the complete function and its threshold are known. It rejects an
ideal-independent multiplicity rule.

Multiplying f by a unit leaves its ideal and every displayed quotient
unchanged. Formula (5) gives unchanged order, since a unit has order zero.
A k-algebra automorphism of R preserves its unique maximal ideal, hence
all powers of that ideal. It therefore preserves order and induces the
actual isomorphisms of all the quotients, compatible with their quotient
maps. Such an automorphism is automatically continuous for this adic
topology. This proves the coordinate-independence of the comparison
without treating two coordinate formulas as literally identical elements.

Let K/k be any field extension and let f_K be obtained by the actual
coefficient map. Its order remains d because that map is injective on
coefficients. At every finite index there is an isomorphism

    (A/n^(N+1)) tensor_k K
       -> K[[x,y]]/(f_K,(x,y)^(N+1)).                        (14)

To construct it, first tensor the finite monomial-basis comparison (4)
with K. It identifies the ambient finite jet algebra with its K-version.
The image of the multiplication-by-f presentation is the ideal generated
by the image of f. Passing to cokernels, or using right exactness of
tensor, gives (14). This specifies the map on residue classes of
polynomials and proves compatibility with transitions in N. In
particular the finite dimensions, H, P_f and intrinsic multiplicity are
unchanged under field extension.

Only finite jets are tensored in (14). No isomorphism
R tensor_k K = K[[x,y]] is asserted for the entire power-series rings;
ordinary tensor products do not automatically commute with that infinite
product. Also a noninjective coefficient specialization may kill the
initial form: 2x+y^2 has order one modulo 3 and order two modulo 2.
The field-extension hypothesis must not become an arbitrary coefficient
map in the interface.

## 8. Discriminating examples and construction contracts

The following are exact specializations, valid in every characteristic
unless a restriction is explicitly stated. The symbols name equations,
not newly defined singularity predicates.

| equation f | d | P_f(T) | boundary checked |
| --- | --- | --- | --- |
| y-x^2 | 1 | T+1 | regular branch; lowest degree, not polynomial total degree |
| xy | 2 | 2T+1 | two transverse branches |
| y^2-x^3 | 2 | 2T+1 | cusp, including characteristics two and three |
| y(y-x^2) | 2 | 2T+1 | two tangent branches, not a node |
| x^3-y^3 | 3 | 3T | three geometric lines only when characteristic is not three |
| x^4 | 4 | 4T-2 | nonreduced equation; negative early polynomial value |

In characteristic three x^3-y^3=(x-y)^3. It still has multiplicity three
but is not an ordinary triple point with three distinct geometric
branches. The node, cusp and tangent-branch examples all have the same
function 1,3,5,7,...; multiplicity alone cannot classify their branches.
The branch comparisons are separate geometric assertions. The explicit
normalization/local-equation arguments in the merged #5805 checkpoint
supply relevant nodal/cuspidal examples, but are not imported as a new
generic singularity definition here.

Each construction has at least three distinguishing acceptance contracts:

**Finite jet map (4).** Its value on x^i y^j is the corresponding class;
its kernel on polynomials is precisely total degree >=N+1. At N=0 the
quotient is k and 1 survives. At N=1 its basis is 1,x,y and xy vanishes;
a rectangular cutoff would give the wrong dimension. At N=2, x^2,xy,y^2
survive but every degree-three monomial vanishes. Multiplication must be
compared modulo the jet ideal, not in the entire polynomial ring.

**Shifted map (6).** For f=x,N=1 the source is R/m and [1] maps to [x],
not to [1]. For f=xy,N=2 it again has one-dimensional source and sends
[1] to [xy]. For f=x^4,N=0 there is no source of the form in (6); (7)
is the correct small-index case. For f=x^4,N=4 its nonzero image confirms
that nonreducedness does not destroy injectivity of the shifted map.

**Tangent-cone map (10).** For f=y-x^2, the kernel is (Y) and X survives.
For f=y^2-x^3 it is (Y^2), not (Y^2-X^3), and the nonzero nilpotent class
of Y must remain. For f=xy it is (XY), with both independent degree-one
classes. The nonprincipal example in Section 5 rejects a kernel inferred
only from the initial forms of a chosen generating list.

**Field-change map (14).** At N=0 it is the canonical k tensor_k K=K
comparison. At N=1 for d>=2 it identifies the basis 1,x,y with that
same K-basis. It carries the truncated relation of f to the truncated
relation of f_K at every N, including f=x^4 where nilpotents survive.
The noninjective specialization of 2x+y^2 is a negative test, and no
untruncated tensor-product comparison is included in the contract.

For the polynomial comparison the concrete sequences beginning at N=0
are: d=1 gives 1,2,3,4,5,6,7; d=2 gives 1,3,5,7,9,11,13; d=3 gives
1,3,6,9,12,15,18; d=4 gives 1,3,6,10,14,18,22. The d=3 and d=4 cases
check an eventual rather than everywhere polynomial. The zero equation
gives choose(N+2,2); a unit equation gives zero. The embedded-point
example has H(0)=1 and H(N)=N+2 for N>=1, distinguishing its early
value from the eventual constant correction.

## 9. Pinned reuse and source reading

The baseline remains Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

Fresh exact pinned file reading:

- `Mathlib/RingTheory/MvPowerSeries/Order.lean`, blob
  `ee54d6e9f646397f97af727b3306cefde4c69cfc`: read the total-degree order
  definitions and coefficient characterizations, product lower bound,
  and the homogeneous-component section through the end of the file.
  Reuse `order_eq_top_iff`, `order_eq_nat`, `coeff_of_lt_order`,
  `homogeneousComponent_of_order`, `coeff_homogeneousComponent` and
  `homogeneousComponent_mul_of_le_order` with their actual hypotheses.
  The last declaration already proves the needed lowest-component
  multiplication identity. Its codomain is power series.
- `Mathlib/RingTheory/MvPowerSeries/Trunc.lean`, complete file, blob
  `0c5e65a2c660a736d79f6c14a16cb2cc643f5aee`: reuse `truncTotal`,
  `coeff_truncTotal_eq_ite`, `coeff_truncTotal_mul_truncTotal_eq_coeff_mul`
  and the polynomial-inclusion comparisons. Read the distinction from
  componentwise `trunc` and `trunc'`. The strict cutoff is why (4) uses N+1.
- `Mathlib/RingTheory/MvPowerSeries/Ideal.lean`, complete file, blob
  `ea0a8e441c9bbba5a2f8dd946d0c530deb643bdc`: these are coefficient-ideal
  and coefficient-map kernel lemmas. They are not by themselves the
  maximal-ideal-power criterion in Section 3.
- `Mathlib/RingTheory/MvPowerSeries/LinearTopology.lean`, complete file,
  blob `ca7c9f02283c596cf96735ac4338cf5e59d59551`: its coefficient-box
  neighborhood ideals do not by themselves identify the total-degree
  powers used here. The proof above makes that comparison explicitly.

The native length exactness and surjective-scalar comparison are retained
from the predecessor's checked baseline entries, not claimed freshly
recompiled or freshly read in their full source files on this pass.
The accepted AUDIT-17 material was read in its selected R03.1 and R03.3
power-series, dimension, support and ownership records; its blob is
`b9d2c4d813061c8614c35e60094de52f92ce660d`. The accepted-review status is
inherited from the preceding receipts, not a new independent review of
that audit. The audit records only a power-series dimension lower bound
in the cited native interface; it does not discharge the full native
two-variable dimension comparison merely by naming power series.

Fresh primary mathematical sources read on 2 October 2026:

- [Stacks 0AZU, Definition 43.15.1](https://stacks.math.columbia.edu/tag/0AZU):
  the dimension-indexed and intrinsic conventions, and the surrounding
  length and polynomial statements. Its cumulative function uses the nth
  power, whereas ours uses the (N+1)st; translating the variable preserves
  the leading coefficient. The plane-curve calculations in this handoff
  are derived proofs, not assertions that this section prints those
  numbered formulas.
- [Stacks 032C, Remark 10.160.9](https://stacks.math.columbia.edu/tag/032C):
  the standard Noetherian/local/regular/dimension input for a formal
  power-series ring over a field. The remark was read as a statement;
  no new proof or native implementation of the entire Cohen structure
  theorem is claimed.
- [Stacks 00KD, Lemma 10.60.11 and Definition 10.60.10](https://stacks.math.columbia.edu/tag/00KD):
  the principal ideal theorem and its displayed proof, and the
  embedding-dimension/regular-local criterion. These supply the standard
  dimension inputs isolated in Section 6, not a fresh formalization of
  general dimension theory.
- [Stacks 00NO, Lemma 10.106.1](https://stacks.math.columbia.edu/tag/00NO):
  the regular-local associated-graded comparison and its proof were
  inspected as a comparison. That proof uses the general Hilbert–Samuel
  dimension theorem. Sections 3–5 instead give direct coefficient and
  quotient proofs, so this comparison is not used circularly to establish
  the specialized function formula.

The live issue, current handoff, selected canonical reader sections and
packet opening were reread. Selected upstream style and ownership sections
of ModularCurves and GrothendieckEulerForms were read; these do not amount
to a new full review of ModularCurves 4D or of all accepted supplier
signatures. The generic regularity/completion contracts continue with
their existing owners. No generic K0, derived category or Euler
characteristic construction is needed for the finite exact sequence (6).
No exhaustive library-absence search or reading of the oversized aggregate
library-coverage file is claimed. Empty connector search results were
inconclusive and are not absence evidence. No new published-source erratum
is alleged, and every inherited paper route remains unchanged.

## 10. Proof-sized integration work and what remains

These are local worklist labels, **not new registered atlas node IDs**.
Integration must update packet, reader and suggested file together while
preserving all existing identifiers and using the real native carriers.

1. J01: identify m^r with the native coefficient/order condition by the
   finite monomial grouping; expose the membership equivalence.
2. J02: construct (4) by polynomial inclusion and identify its full kernel.
   Export the monomial basis and the quotient-map evaluation formulas.
3. J03: compare the lowest native homogeneous component with polynomial
   truncation, then deduce (5) from the existing multiplication theorem
   and the polynomial domain instance. Do not duplicate that theorem.
4. J04: construct the actual R-linear shifted quotient map under N>=d;
   separate its representative-independence and generator-evaluation API.
5. J05: prove injectivity of J04 by (5), and identify its cokernel and
   quotient projection. State (6) using the native exact-sequence API.
6. J06: prove the small-index isomorphism (7), separately from (6).
7. J07: prove the finite length comparison and (8), then derive the full
   natural-valued formula (1) after establishing finiteness.
8. J08: construct theta into the existing adic Rees quotient using the
   registered degree-one inclusions; prove degreewise surjectivity.
9. J09: prove its full homogeneous kernel by (9) and assemble the graded
   isomorphism (10), including its compatibility with the named maps.
10. J10: derive (2) from the native successive-quotient exact sequence;
    compare the degree components in (10) as a second consistency check.
11. J11: identify (3) with the existing eventual polynomial using its
    uniqueness contract and the explicit threshold; do not introduce an
    assumed record containing the required formula.
12. J12: connect the actual two-variable Noetherian/dimension input with
    its supplier or sharpen its existing gap; use the quotient prime
    correspondence and height bound to show dim(A)=1.
13. J13: specialize the reserved intrinsic and degree-indexed multiplicity
    APIs to (11), to the ambient zero value, and to the regular surface.
14. J14: prove (13) via actual quotient powers and the same uniqueness API.
15. J15: construct (14) at finite levels, with coefficient maps and
    transition naturality; keep untruncated completion out of its type.
16. J16: record unit and coordinate-change transport, then derive (12)
    and the characteristic-sensitive native examples.

This advances the mathematical formal-plane-curve leaf, but does not
close the canonical geometric-comparisons gap before J01–J16 and their
native signatures are integrated. In particular it does not prove the
general regular-local multiplicity theorem, Nagata's unmixed converse,
the parameter-ideal Cohen–Macaulay criterion, or general completion
invariance. The field-extension finite-jet theorem is not a substitute
for that completion theorem.

The predecessor's main general Hilbert–Serre next step also remains:
inspect the pinned `DirectSum.Decomposition.restrict` and
`DirectSum.map_decompose_shift`; construct the actual homogeneous kernel,
image and cokernel of multiplication by a degree-one generator; descend
the action to S/(x); handle Q_0=M_0; prove the signed length recurrence
without assuming injectivity. The induction uses

    D(T)=P_Q(T)-P_K(T-1),
    N=max(1,N_Q,N_K+1),
    P_M(T)=summatoryPolynomial(D)(T)+h_M(N-1)
           -summatoryPolynomial(D)(N-1).

The threshold and anchor cannot be omitted. The zero-generator-list tail
is zero; the nonempty-list degree bound does not by itself identify degree
with support dimension. Those obligations, the dimension/Artin–Rees and
associativity leaves, the two supplier requests and every original
patching, deformation and derived paper route remain open. No new planet,
owner, source issue or stage-closure claim is introduced here.

## 11. Executed checks and compilation boundary

The standard-library program below executed **25,148 assertions on 507
finite-jet models**, over fields of orders 2,3,5,7. It includes every
nonzero binary leading form of degrees 1–4 over F2 and F3, plus seeded
coefficient vectors over F5 and F7, with nonhomogeneous higher terms.
Each quotient dimension is obtained independently from the rank of the
actual truncated multiplication matrix, not by evaluating formula (1).

There are 4,563 exact quotient-length checks and 4,563 successive-piece
checks, 3,378 eventual-polynomial checks, 1,185 small-index ambient-jet
checks, 1,521 unit-invariance checks, power-ideal checks, and negative
examples for characteristic three, noninjective coefficient changes,
zero-divisor coefficients and nonprincipal initial ideals. The program
also checks zero equations, unit equations and the already recorded
embedded-point example. The complete count by kind is printed by the
reproduction; the examples in Section 8 occur among its direct outputs.

These finite computations are regressions, not proofs about arbitrary
formal series, field extensions, categorical quotients or general
multiplicity. The separate mathematical arguments above establish the
stated comparisons with the standard inputs isolated in Section 6.

Program SHA-256:
`ed9dc3d82ba5b988e95634bfd035821efcd4ebda2e552465c757e38b9df73a35`.
Printed JSON SHA-256:
`058a580c33c92c372851ded432b1740fb069243fa5e19a24943c6a3c86b182d5`.
The JSON also records the deterministic model-table hash.

**Lean was not compiled in this continuation.** Available memory was
about 3.6 GiB, below WORKERS' 20 GB threshold, and no existing pinned build
was available. No Lake project, cache download, library build or language
server was started. The predecessor's successful elaboration receipt is
preserved in the immutable link, but it is not a compilation of the new
worklist. The canonical suggested file is unchanged.

The indexed blueprint checker and atlas assembly were not run locally:
there was no accessible local repository checkout. No canonical graph or
node is changed in this handoff-only submission. Submission CI is a
separate mechanical check and is not independent mathematical review.

## 12. Reproduction

Run with Python 3. It uses only the standard library.

```python
"""Exact jet-space regressions; no symbolic CAS or third-party dependency.
Finite computations test the contracts, not the arbitrary-series proof.
"""
from collections import Counter
from itertools import product
from fractions import Fraction
from math import comb
import hashlib
import json
import random

checks = Counter()

def ck(name, condition):
    if not condition:
        raise AssertionError(name)
    checks[name] += 1


def monomials(n):
    return [(i, degree-i) for degree in range(n+1) for i in range(degree+1)]


def clean(f, p):
    return {a:c % p for a,c in f.items() if c % p}


def order(f):
    return min((sum(a) for a in f), default=None)


def mul(f,g,p):
    out={}
    for (i,j),a in f.items():
        for (k,l),b in g.items():
            exponent=(i+k,j+l)
            out[exponent]=(out.get(exponent,0)+a*b)%p
    return clean(out,p)


def rank(columns,p):
    pivots={}
    for column in columns:
        v=[a % p for a in column]
        for j in sorted(pivots):
            if v[j]:
                c=v[j]
                v=[(a-c*b)%p for a,b in zip(v,pivots[j])]
        pivot=next((j for j,a in enumerate(v) if a),None)
        if pivot is not None:
            inverse=pow(v[pivot],-1,p)
            pivots[pivot]=[(a*inverse)%p for a in v]
    return len(pivots)


def jet_length(generators,N,p):
    basis=monomials(N)
    index={a:i for i,a in enumerate(basis)}
    columns=[]
    for raw in generators:
        f=clean(raw,p)
        d=order(f)
        if d is None or d>N:
            continue
        for i,j in monomials(N-d):
            v=[0]*len(basis)
            for (k,l),a in f.items():
                e=(i+k,j+l)
                if e in index:
                    v[index[e]]=a
            columns.append(v)
    return len(basis)-rank(columns,p)


def expected(N,d):
    return comb(N+2,2)-(comb(N-d+2,2) if N>=d else 0)


rng=random.Random(55120261002)
cases=[]
for p in (2,3,5,7):
    # Every nonzero binary form of degrees 1..4 over F2 and F3;
    # 12 deterministic coefficient vectors per degree over F5/F7.
    for d in range(1,5):
        leading=[(i,d-i) for i in range(d+1)]
        coefficients=(product(range(p),repeat=d+1) if p in (2,3)
                      else (tuple(rng.randrange(p) for _ in leading) for _ in range(12)))
        for coeffs in coefficients:
            if not any(coeffs):
                continue
            f={a:c for a,c in zip(leading,coeffs) if c}
            # Nonhomogeneous tails check that total degree is not the input order.
            for degree in (d+1,d+2):
                for i in range(degree+1):
                    c=rng.randrange(p)
                    if c:
                        f[(i,degree-i)]=c
            cases.append((p,d,f))

rows=[]
for p,d,f in cases:
    lengths=[jet_length([f],N,p) for N in range(9)]
    for N,H in enumerate(lengths):
        ck('hypersurface_jet_length',H==expected(N,d))
        previous=lengths[N-1] if N else 0
        ck('graded_piece_dimension',H-previous==min(N+1,d))
        if N>=d-1:
            ck('eventual_polynomial',Fraction(H)==d*N+Fraction(d*(3-d),2))
        else:
            ck('early_ambient_jet',H==comb(N+2,2))
    ck('zeroth_quotient',lengths[0]==1)
    ck('intrinsic_from_jet_slope',lengths[8]-lengths[7]==d)
    ck('ambient_degree_two_coefficient',lengths[8]-2*lengths[7]+lengths[6]==0)
    for s in (1,2,3):
        for N in range(3):
            exponent=s*(N+1)-1
            H=lengths[exponent]
            ck('power_ideal_function',H==expected(exponent,d))
            if s*(N+1)>=d:
                ck('power_ideal_polynomial',Fraction(H)==d*s*(N+1)-Fraction(d*(d-1),2))
    g=clean({(0,1):1,(1,0):rng.randrange(p),(2,1):1},p)
    fg=mul(f,g,p)
    ck('order_product',order(fg)==d+order(g))
    low_f={a:c for a,c in f.items() if sum(a)==d}
    low_g={a:c for a,c in g.items() if sum(a)==order(g)}
    low_fg={a:c for a,c in fg.items() if sum(a)==d+order(g)}
    ck('initial_form_product',low_fg==mul(low_f,low_g,p))
    # Multiplying a generator by 1+x gives the same ideal in every jet ring.
    unit_times=mul(f,{(0,0):1,(1,0):1},p)
    for N in (0,3,6):
        ck('unit_invariance',jet_length([unit_times],N,p)==lengths[N])
    rows.append((p,d,tuple(lengths)))

examples={
    'smooth': {(0,1):1,(2,0):-1},
    'node_xy': {(1,1):1},
    'cusp': {(0,2):1,(3,0):-1},
    'tangent_branches': {(0,2):1,(2,1):-1},
    'triple_polynomial': {(3,0):1,(0,3):-1},
    'fourth_power': {(4,0):1},
}
samples={}
for p in (2,3,5,7):
    for name,f in examples.items():
        d=order(clean(f,p))
        values=[jet_length([f],N,p) for N in range(7)]
        ck('named_example',values==[expected(N,d) for N in range(7)])
        samples[f'{name}_F{p}']=values
    for N in range(9):
        ck('zero_equation',jet_length([],N,p)==comb(N+2,2))
        ck('unit_equation',jet_length([{(0,0):1,(1,0):1}],N,p)==0)
        embedded=jet_length([{(1,1):1},{(0,2):1}],N,p)
        ck('embedded_point',embedded==(1 if N==0 else N+2))
        if N>=1:
            ck('embedded_point_tail_difference',embedded-jet_length([{(1,1):1},{(0,2):1}],N-1,p)==(2 if N==1 else 1))

# These are deliberately false conclusions; require the test to distinguish them.
ck('cubic_char3_nonreduced',mul(mul({(1,0):1,(0,1):-1},{(1,0):1,(0,1):-1},3),{(1,0):1,(0,1):-1},3)==clean(examples['triple_polynomial'],3))
ck('noninjective_coefficient_change',order(clean({(1,0):2,(0,2):1},3))==1 and order(clean({(1,0):2,(0,2):1},2))==2)
ck('not_total_degree',order(examples['cusp'])==2 and max(map(sum,examples['cusp']))==3)
ck('not_all_nonzero_polynomials_curves',jet_length([{(0,0):1}],4,2)==0)
ck('regular_surface_factorial',comb(10,2)-2*comb(9,2)+comb(8,2)==1)
# Same HS multiplicity does not distinguish one, two or tangent branches.
ck('same_length_different_branches',samples['node_xy_F2']==samples['cusp_F2']==samples['tangent_branches_F2'])
# Product of two nonzero linear forms with nilpotent coefficients over Z/4.
ck('zero_divisor_base_rejects_order_equality',mul({(1,0):2},{(0,1):2},4)=={})

# A nonprincipal ideal need not have its initial ideal generated by the
# displayed generators' initial forms: y*(x^2+y^3)-x*(xy)=y^4.
for p in (2,3,5,7):
    actual=jet_length([{(2,0):1,(0,3):1},{(1,1):1}],5,p)
    naive=jet_length([{(2,0):1},{(1,1):1}],5,p)
    ck('principal_hypothesis',actual==5 and naive==7)

out={'cases':len(cases),'assertions':sum(checks.values()),'by_kind':dict(sorted(checks.items())),
     'cases_by_field_and_order':{f'F{p}_d{d}':sum(p0==p and d0==d for p0,d0,_ in cases) for p in (2,3,5,7) for d in range(1,5)},
     'case_receipt_sha256':hashlib.sha256(json.dumps(rows,separators=(',',':')).encode()).hexdigest(),
     'samples':samples}
print(json.dumps(out,sort_keys=True,indent=2))
```
