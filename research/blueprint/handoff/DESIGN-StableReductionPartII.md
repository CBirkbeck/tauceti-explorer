# DESIGN-StableReductionPartII — native coefficient splitting checkpoint

Refs #3342. Codex — codex-5ebb6f; claim5958635306 confirmed by bot5958637359. Entire issue read before and after confirmation. Base7d980305cb145551de205b667b7300a7b18d99c7 after merged PR5819. Partial checkpoint: all eight stages partial, all implementationStatus unchecked.

## What changed

Instantiated the inherited canonical sectionSplit on the actual polynomial quotient R, actual coordinate ideal J and inherited coefficient scalar tower. Six added nodes: coefficient-inclusion-action, section-evaluation-scalars, section-evaluation-projection, section-projection-formula, section-projection-retraction and section-projection-coefficients. The last three promote the projection APIs used by the splitting and flatness proof, under PROTOCOL§4. Three projection APIs and four tests supplement the unchanged four splitting APIs and three tests.

The coefficient hom equals the native algebra map, evaluation is A-linear and p(r)=r−ιev(r) is the native A-linear ideal retraction. It fixes J and kills the coefficient section. Define e(r)=(p(r),ev(r)), inverse (j,a)↦j+ι(a), and check both inverse identities and coefficient linearity. No separate module action, assumed kernel or opaque ideal carrier is used. The built bivariate evaluation-ideal theorem and actual quotient map prove the original sectionEvaluationKernel statement.

The splitting proof route now directly constructs its displayed formulas, replacing an uninstantiated complement-equivalence outline. The coefficient-flatness proof consumes the actual ideal retraction. Both original mathematical statements survive. No generic splitting theorem or upstream stable-family object is replanned. Coefficient splitting does not imply R-flatness, R-projectivity, relative stable reflexivity or completion descent.

125 nodes: eight definitions,35 constructions,19 lemmas,62 theorems and one application;142 APIs,135 definition/construction tests plus two inherited exactness tests,35 planets,73 pinned baseline declarations,135 requests and fourteen gap groups. All119 original statements, hypotheses, APIs, tests, sources and acceptance conditions are preserved;117 full node objects are identical. Only splitting and coefficient-flatness prerequisite/proof routes change. Binding nineteen Yuan and two DGH routes, six key consumers, reserved StableReductionPartII:key/moduli-curves, ownership proposal, source issues/versions and supplier requests/gaps remain unchanged. No geometric closure is claimed.

## Reading boundary

Fresh whole issue before/after claim, complete latest handoff, exact own Yuan/DGH routes and reviewed parent StableReduction layers1/3 with accepted REV-AUDIT-02 metadata. PartII has no dedicated reviewed library-audit row. Upstream StableReduction and JacobianChallenge were read earlier in this continuous worker session; they remain the ownership models, without a claim of fresh whole-document reading in this cycle.

Fresh complete Knudsen2012 v2 HTML §3 Key Example through the full Proposition3.1 and Corollary3.2 proofs at [arXiv HTML](https://arxiv.org/html/1106.1588v2). The publication assumes noetherian A and unit discriminant. The native coefficient/kernel/splitting deductions here hold over every commutative ring, including the zero ring. They establish no broader family/sheaf/completion or relative stable-reflexivity theorem. No fresh whole-paper or visual PDF read is claimed. Earlier Appendix, Stacks and whole-paper receipts remain historical; Eisenbud, Bourbaki III5.4.4 and Proposition7's exercise remain exact open inputs.

Full statements and ambient hypotheses freshly read for AdjoinRoot.algebraMap_eq', Polynomial.algebraMap_eq, AdjoinRoot.mk_ne_zero_of_natDegree_lt, Module.subsingleton, bivariate evaluation/ideal membership, quotient representative induction/lift, ideal image/span and containment. Exact new baseline index entries verified at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174. TauCetif790474821cf4256814db967cb154e7af3d0c369 unchanged.

## Native verification and reproduction

Complete final Mathlib-only sketch: Lean4.34.0-rc2 at the exact pin, exit0, zero errors,170 admitted warnings only,74 examples;13.68 seconds, maximum RSS2,926,184 KiB. Existing artifacts reused;66 GiB available before the check. One compiler at a time, no project/setup/cache/update/build or language server. No combined TauCeti geometric import set certified or created.

Separate public canonical proof extraction:13 matching declaration signatures,13 axiom audits,seven examples, exit0 with zero errors/warnings in2.91 seconds, maximum RSS2,811,936 KiB. Every printed axiom set is contained in propext, Classical.choice and Quot.sound; no admitted-proof axiom. All13 canonical signatures and all seven example statements match the submitted sketch. Tests include arbitrary ideal membership, the zero base, a nonreduced nonzero section and the native failure of R-linearity; the nonzero root follows from a monic degree bound, not a domain premise.

These actual proofs survive only in the allowed suggested file at [immutable 637b4515](https://github.com/CBirkbeck/tauceti-explorer/blob/637b45159fc2451aa40ce5b5cf9a31ce755c646f/research/blueprint/suggested/StableReductionPartII.lean). Extract the exact text after the line BEGIN ARCHIVED CHECKED CANONICAL SECTION SPLITTING and before the line END ARCHIVED CHECKED CANONICAL SECTION SPLITTING, retaining its final newline. Save in your own disk scratch; verify the source hash below. After checking memory, run a single lake env lean on that absolute scratch filename from an existing exact pinned Mathlib build. The receipt certifies the extracted archive, not the surrounding intermediate sketch. The final submitted new bodies are admitted under PROTOCOL§13.

Historical fifteen proved bodies/nine examples remain at [cef4c208](https://github.com/CBirkbeck/tauceti-explorer/blob/cef4c2085eddbf723e9050f7d4924924d593a0e3/research/blueprint/suggested/StableReductionPartII.lean); the preceding kernel experiment remains at [3f2331a2](https://github.com/CBirkbeck/tauceti-explorer/blob/3f2331a296aa232a5eaf419df358db0cfec27553/research/blueprint/suggested/StableReductionPartII.lean). Their checks are historical, not rerun here.

Indexed packet checker: zero errors/warnings. Actual read-only atlas assembler, injecting the packet before replaced-decomposition trimming: stages3,050 vertices/8,750 edges; own125/284; scoped stages/declarations/requests3,140/9,273. All acyclic. All81 computed stage prerequisite pairs reachable; no own skipped links; identical stage edges and unrelated skipped links compared with the original packet overlay. It does not audit every unrelated accepted declaration graph. Five-path intake, preservation, canonical signature/example parity and whitespace checks pass.

Reproduce the scoped graph and preservation check from the repository using the standard-library script below, saved in your own scratch. It writes only its JSON result next to the script and performs no site build.

```python
import json,sys,subprocess,hashlib,re
from pathlib import Path
from collections import defaultdict,deque
root=Path.cwd();sys.path.insert(0,str(root/"scripts"));import build
rid="StableReductionPartII"
packetpath="research/blueprint/packets/"+rid+".json"
roadmappath="research/blueprint/roadmaps/"+rid+".json"
base="7d980305cb145551de205b667b7300a7b18d99c7"
p=json.loads((root/packetpath).read_text());r=json.loads((root/roadmappath).read_text())
old=json.loads(subprocess.check_output(["git","show",base+":"+packetpath],text=True))
oldr=json.loads(subprocess.check_output(["git","show",base+":"+roadmappath],text=True))
load=build.load_promoted
def assemble(packet,definition):
 def overlay(*a,**k):
  ps,ds,defs=load(*a,**k)
  return ([(n,v) for n,v in ps if v.get("roadmapId")!=rid]+[(rid,packet)],
   {**ds,rid:"research/blueprint/readmes/"+rid+".md"},
   [x for x in defs if x.get("id")!=rid]+[definition])
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
assert not missing,missing
ar={x["id"]:x for x in a["roadmaps"]};cr={x["id"]:x for x in control["roadmaps"]}
assert ar[rid]["blueprint"]["declarations"]==125
assert ar[rid]["blueprint"]["planets"]==35
assert not ar[rid]["blueprint"]["skippedLinks"]
assert all(ar[x].get("blueprint",{}).get("skippedLinks")==cr[x].get("blueprint",{}).get("skippedLinks") for x in cr)
for key in ("requests","gaps","sources","sourceIssues","sourceVersions","consumerCoverage","keyDefinitionCoverage","restructure","upstreamImportEncoding"):
 assert p[key]==old[key],key
on={n["id"]:n for n in old["nodes"]}
for id,n in on.items():
 for key in ("id","kind","statement","hypotheses","api","acceptance","sources","implementationStatus","uses"):
  assert own[id].get(key)==n.get(key),(id,key)
 assert all(t in own[id].get("tests",[]) for t in n.get("tests",[]))
assert p["baseline"]["declarations"][:len(old["baseline"]["declarations"])]==old["baseline"]["declarations"]
unchanged=sum(own[id]==n for id,n in on.items())
lean=(root/"research/blueprint/suggested/StableReductionPartII.lean").read_text()
for node in p["nodes"]:
 for test in node.get("tests",[]):assert test["name"] in lean,test["name"]
for node in p["nodes"]:
 for api in node.get("api",[]):assert api["name"].split(".")[-1] in lean,api["name"]
allowed={packetpath,roadmappath,"research/blueprint/readmes/"+rid+".md","research/blueprint/suggested/"+rid+".lean","research/blueprint/handoff/DESIGN-"+rid+".md"}
changed=set(subprocess.check_output(["git","diff","--name-only",base],text=True).splitlines())
assert changed<=allowed,changed
for path in changed:
 assert not re.search(r"/(?:home|tmp|Users)/|file"+"://",(root/path).read_text()),path
result={"actualAssembler":True,"declarations":125,"planets":35,"ownSkippedLinks":[],
 "stageDAG":stageDAG,"ownDeclarationDAG":ownDAG,"stagesAndReachableDeclarations":combined,
 "reachableDeclarations":len(used),"externalDeclarations":sorted(used-set(own)),
 "requiredStagePairsReachable":len(pairs),"stageEdgesUnchanged":True,
 "otherSkipsMatchOriginal":True,"unchangedNodeObjects":unchanged,
 "scriptSha256":hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
Path(__file__).with_suffix(".json").write_text(json.dumps(result,indent=2)+"\n")
print(json.dumps(result,indent=2))
```

SHA-256 receipts:

- canonical proof source: 3d93800d52ffe26a39e1ce5e793b5294fd27d03599472a652adaf0243a4720e9
- canonical proof log: c3843e9e75665f9cd8306e298ffef6ab12ccffaa00df1f47e7760b2ff32b6093
- current full sketch: 1742af2721d465f31c49307c9ea6dc0797e20c4bb9e33fa5475c46b7b13a8367
- current sketch log: 535aafefafa1ced7c72379d89c62d23f4ff188eb734ea9c5ee6e0219297c4172
- atlas script: 0fbb46fa8cc7053b0276d9cc991fcba19626da329558ef9f61c0c0f490b0989a
- selected source HTML: 2c89ce4072046d546ff9256a5c64cd488f41026c561f8858f4a78ce14c21d685

## Continue from here

The concrete coefficient splitting is now established in the immutable native prototype. Finish actual cokernel/dual-generator/normal-equivalence/scalar-correction and tensor comparisons, preserving canonical maps. Then establish sheaf descent.

The unapproved StablePeriodicCurved PartII ownership proposal remains unapproved. Supply the relative S→R stable-reflexivity criterion and arbitrary S-module Hom/Ext comparisons; ordinary flat ambient Hom transport does not replace them. Acquire/prove Appendix Proposition6's two-base completion comparison and resolve Proposition7's exercise. Establish the unit-discriminant pointed completed-local hull, actual nodal-family identification and coefficient-compatible faithful descent.

All remaining MC.0–MC.7 moduli, positivity, fine-level, determinant/Deligne-pairing, Picard/Torelli, arbitrary-base approximation and source-collation gaps remain required. No stage or shared geometric key is closed. Complete preceding handoff remains at the recorded base. Scratch is deleted after PR opening; all reproducible proof source survives in the immutable archive and graph recipe above.
