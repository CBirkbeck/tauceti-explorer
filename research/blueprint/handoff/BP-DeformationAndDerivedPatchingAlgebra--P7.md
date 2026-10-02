# #551 residue and module-length continuation — Codex, codex-5ebb6f, 2 October 2026

Partial checkpoint. Winning claim [5959071488](https://github.com/CBirkbeck/tauceti-explorer/issues/551#issuecomment-5959071488), confirmed by [5959074464](https://github.com/CBirkbeck/tauceti-explorer/issues/551#issuecomment-5959074464). Publication parent `d2c01b60c52cf46809c0de093cf75f37f47e5aa8`. Only the four issue deliverables change. The previous full native plane-curve proof, finite program, source obligations and receipts remain available in the [immutable predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/d2c01b60c52cf46809c0de093cf75f37f47e5aa8/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md); no dependency on discarded scratch files remains.

The packet has **96 nodes: 53 lemmas, sixteen theorems, eight definitions and nineteen constructions; 111 API items; 92 definition/construction tests plus eleven lemma tests; 126 native examples; thirteen planets; 217 baseline references; fifteen gap groups and two unchanged supplier requests**. All 89 inherited node objects, all inherited baseline entries, source issues, requests, reserved key-definition fields and eight coverage statuses are preserved. P7, R03.3 and R03.4 stay partial; P8, P9, R03.1, R03.2 and R03.5 stay not_read. Every implementationStatus remains unchecked.

## What changed and what is still conditional

Seven R03.3 declarations address the actual residue-action/length leaf:

1. `series-residue-equivalence`: the native residue field of any series ring over a field is k as a k-algebra; constant coefficient descends through the built residue lift and its inverse is the actual class of a constant series.
2. `series-residue-coefficients-surjective`: the native map k→κ(R) is onto. No surjectivity of k→R is asserted.
3. `series-module-length`: for every compatible R-module M, length_R M=length_k M in extended naturals, including infinite lengths. The built local-extension formula has residue factor one. A finite filtration premise is unnecessary.
4. `series-module-finite-length`: with Module.Finite k M, length_R M=finrank_k M, cast into extended naturals. Finite generation over R alone is insufficient.
5. `total-jet-finite`: promote the existing totalJetBasis_finite API to a lemma node because the quotient-length result consumes it; its existing signature is not duplicated or replaced.
6. `total-jet-ring-length`: the actual quotient R/v^r has R-module length equal to its coefficient dimension, using the promoted native finite-basis fact.
7. `plane-total-jet-ring-length`: for two variables that length is binom(r+1,2), including r=0, using the inherited dimension count. For index N, put r=N+1.

The first four nodes and all three new residue APIs have complete native proofs in the separate archive. The two jet-length adapters still consume the inherited unchecked basis and count: this checkpoint does not report their numerical formula as admission-free checked. It does not certify the variable-ideal kernel, shifted-map injectivity/exactness, all-index curve lengths, tangent cone, dimension or general multiplicity comparison. The reserved general multiplicity definition and its intrinsic/ambient normalization remain unchanged.

Three construction tests fix the coefficient section, no-variable boundary and a nonzero variable killed by residue. Three module tests give native lengths one, zero and two for the residue module, zero module and residue pair. A seventh added acceptance signature states actual R-length six for the characteristic-two cutoff-three jet. The field-uniform variable test checks every field, including positive characteristic. A concrete ZMod 2 residue expression exhausted deterministic heartbeats; it is not counted as passing. All new submitted bodies are admitted under PROTOCOL §13.

## Exact validation receipts

The indexed blueprint checker reports zero errors and warnings; the actual intake check-files passes for the four deliverables. Full Mathlib-only Lean elaboration in an existing build at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Lean v4.34.0-rc2: **zero errors, 270 admitted-proof warnings, zero other warnings; 126 examples; 22.51 seconds, maximum RSS 3,540,004 KiB**. Memory before this successful run: 67 GiB available. Suggested file SHA-256 `a574278b8c31753aff401ffd3312ce400c28e40bb90172005cef7a51efbfebec`; successful output SHA-256 `53e31b9ce2d3e4a8888b905993bf4427fc3902f35727cd63821f3b45b67e1ad0`. No Tau Ceti import, library build, Lake setup/cache download or language server was used. Tau Ceti references retain the source pin `f790474821cf4256814db967cb154e7af3d0c369`.

The independent foundation prototype: **zero errors and warnings; seven declarations, seven printed axiom audits, six proved examples; 1.60 seconds, maximum RSS 2,505,544 KiB**, 67 GiB available beforehand. Axiom sets are exactly propext, Classical.choice and Quot.sound, with no admitted axiom. Its seven declaration signatures match the submitted signatures. Source SHA-256 `e123da1f4b68b77a81bd08a2fb116c7a77f5475b568af9c8872e33ea5959321d`; output SHA-256 `d866e02e4f96f109668b891d2605ff60f589c954cb590801951172e9a3a68f21`. This is a checked prototype, not a roadmap implementation-status change.

The [immutable public proof archive](https://github.com/CBirkbeck/tauceti-explorer/blob/20fb961cd54398638ba6a9b1b9b818fb546163bf/research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean) contains the complete standalone source inside BEGIN/END ARCHIVED CHECKED SERIES RESIDUE AND LENGTH markers. The receipt certifies the extracted standalone source, not an implementation of the surrounding admitted sketch. Extract and verify it with this standard-library program from the repository root, passing a path in your own disk-backed scratch directory:

```python
import sys,subprocess,hashlib
from pathlib import Path
commit="20fb961cd54398638ba6a9b1b9b818fb546163bf"
path="research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean"
s=subprocess.check_output(["git","show",commit+":"+path],text=True)
proof=s.split("BEGIN ARCHIVED CHECKED SERIES RESIDUE AND LENGTH\n",1)[1].split("END ARCHIVED CHECKED SERIES RESIDUE AND LENGTH",1)[0]
assert hashlib.sha256(proof.encode()).hexdigest()=="e123da1f4b68b77a81bd08a2fb116c7a77f5475b568af9c8872e33ea5959321d"
assert "sorry" not in proof
Path(sys.argv[1]).write_text(proof)
```

In the existing exact pinned build, check free memory as WORKERS requires, then run one `lake env lean` on that extracted file, with a twenty-minute timeout. All seven final axiom prints must contain only the three listed standard axioms and all six examples must check. The final submitted sketch removes the private proof archive comment and preserves every new body as admitted.

## Source and ownership boundary

The issue was fully read before claiming and again after confirmation. All eight reviewed AUDIT-17 scoped records, applicable accepted RS-08 keeps and owner assignments, all scoped stage descriptions, touching edges, the matching link/overlap records, all 89 predecessor node statements and the complete latest merged handoff were personally read. WORKERS and binding protocols were followed; the two nearby upstream roadmap documents were already read earlier in this continuous session, not freshly claimed here.

Fresh pinned declaration statements, ambient hypotheses and proofs are itemized with exact file SHA-256 hashes in HS-RESIDUE-LENGTH-PIN. The complete local-extension length theorem is already built: no new general residue-field, composition-filtration, scalar-restriction or local-length theorem is planned. The native constant-coefficient unit criterion and local-ring/residue structures are reused. Bounded searches through both exact pinned trees are recorded only as bounded searches, not exhaustive absence evidence.

The complete mathematical statement and proof of [Stacks Lemma 10.52.12, tag 02M0](https://stacks.math.columbia.edu/tag/02M0), and the mathematical length section 00IU, were freshly read. Downloaded 02M0 HTML SHA-256 `00e8584bf16e6a75416e40bb3f2281a4728f1ee5e92ee26befe4c04847690dd6`. The Stacks formula states finite B-length and finite residue degree; the unrestricted extended-natural form comes from pinned Mathlib's already-proved infinite-length branch. No new full routed-paper read, source-issue closure, erratum or independent review is claimed. Generic/coherent-duality/completion suppliers retain the accepted existing owners.

## Resume here

The residue and length foundation is now available as a checked native proof source. Implement the inherited actual jet basis/count and variable-ideal/shifted-map proofs, then install totalJetBasis_finite and apply the new length adapters. Combine the built DoubleQuot comparison and length restriction along the actual surjection R→R/(f) with the existing shifted sequence. This should yield the full all-index curve-jet formula, handling N<d separately rather than forcing truncated natural subtraction into an injectivity claim.

Next follow the complete preserved J01–J16 worklist below, especially J07–J13: the full graded tangent-cone kernel, eventual polynomial uniqueness/threshold, dimension and comparison with the existing general intrinsic and ambient multiplicities. All f=0/unit, nonreduced and positive-characteristic cases remain required. The general graded Hilbert–Serre homogeneous kernel/cokernel induction, anchor/threshold and support-dimension comparison are independent unresolved work. Perfect complexes, patching, deformation categories, completion and all routed-source obligations remain open.

The predecessor finite-jet Python program and its 507-case/25,148-assertion receipt are preserved at the immutable predecessor link. They are inherited receipts in this continuation, not a newly executed arbitrary-series proof.

## Actual atlas assembly and reproduction

The actual assembler overlays only this P7 part, retaining R03.6 and all other packets. It lists 149 whole-roadmap declarations and nineteen planets (96/thirteen in this part), with no skipped links. Stage graph: 3,003 vertices and 8,623 edges; own declaration graph: 96 vertices and 143 edges; combined stage/reachable-declaration graph: 3,087 vertices and 8,863 edges, with 97 reachable declarations. All are acyclic. All 89 old node objects, all stage edges, requests and other skipped-link records match the immutable-parent control.

**Inherited supplier-path gap:** twelve of thirteen scope/request stage pairs are reachable. LocalFieldsRamification layer 0 → R03.4 is absent in both current and control stage graphs; the existing gap/request remains. No stage edge is fabricated.

Run this standalone program from the repository root, storing it in own disk-backed scratch. It uses the actual assembler and checks node-object preservation, final tests/APIs, changed-file scope and source-path boundaries; it writes only its own scratch receipt. Script SHA-256 `b50255d3c75b8e3155fe97668b6e8d63da06f6b694cff68c5118467847ab3933`.

```python
import json,sys,subprocess,hashlib,re
from pathlib import Path
from collections import defaultdict,deque
root=Path.cwd();sys.path.insert(0,str(root/"scripts"));import build
rid="DeformationAndDerivedPatchingAlgebra"
stem=rid+"--P7"
packetpath="research/blueprint/packets/"+stem+".json"
roadmappath="research/blueprint/atlas/roadmaps/"+rid+".json"
base="d2c01b60c52cf46809c0de093cf75f37f47e5aa8"
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
assert ar[rid]["blueprint"]["declarations"]==149
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
assert unchanged==89,unchanged
assert len(own)==96
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
result={"actualAssembler":True,"declarations":149,"partDeclarations":96,"partPlanets":13,"planets":19,"ownSkippedLinks":ar[rid]["blueprint"]["skippedLinks"],
 "stageDAG":stageDAG,"ownDeclarationDAG":ownDAG,"stagesAndReachableDeclarations":combined,
 "reachableDeclarations":len(used),"externalDeclarations":sorted(used-set(own)),
 "requiredStagePairs":len(pairs),"requiredStagePairsReachable":len(pairs)-len(missing),"inheritedMissingStagePairs":missing,"stageEdgesUnchanged":True,
 "otherSkipsMatchOriginal":True,"unchangedNodeObjects":unchanged,
 "scriptSha256":hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
Path(__file__).with_suffix(".json").write_text(json.dumps(result,indent=2)+"\n")
print(json.dumps(result,indent=2))
```

## Preserved full integration worklist

The following worklist is preserved from the predecessor. Its labels remain local labels, not new atlas IDs. The current appendix updates the residue/length leaf; the remaining obligations and all formulas/proofs in the immutable predecessor stay binding.

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
