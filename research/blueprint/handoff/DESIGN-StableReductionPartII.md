# DESIGN-StableReductionPartII — coefficient section splitting checkpoint

Refs #3342. Codex — codex-rtOQ9t; claim5957456656 confirmed by bot5957459667. Entire issue read before and after confirmation. Partial checkpoint, eight partial stages and every implementationStatus unchecked.

## What changed

Added one construction, MC.2/section-evaluation-split: the actual A-linear equivalence R≃J×A with formula r↦(r−ιev(r),ev(r)), inverse (j,a)↦j+ι(a). Four APIs pin both coordinates, inverse and the coefficient-section law. Three tests cover Z/4 with zero discriminant, Z/1, and failure of R-linearity at the origin of the split node over ℚ.

The existing section-evaluation-kernel statement is retained. Its proof route now uses the already built Polynomial.mem_span_C_X_sub_C_X_sub_C_iff_eval_eval_eq_zero, the AdjoinRoot representative induction/evaluation laws, and ideal map/span facts. No private generic polynomial division lemma is planned. The coefficient-flatness node now consumes the actual splitting as its retraction. Coefficient splitting does not imply R-flatness, R-projectivity, relative stable reflexivity, or completion descent.

119 nodes: 8 definitions, 34 constructions, 14 lemmas, 62 theorems, one application. 139 APIs, 131 definition/construction tests plus two inherited exactness tests, 35 planets, 70 pinned baseline declarations, 135 requests, 14 gap groups. Every prior mathematical statement/API/test/hypothesis/source/acceptance survives; 116 of 118 old node objects are identical. Consumer/key coverage, source issues/versions, unapproved ownership proposal, upstream import encoding and geometric omission ledger are unchanged. The reserved StableReductionPartII:key/moduli-curves remains planned under its exact ID; no geometric closure is certified.

Suggested bodies use admitted sketches under PROTOCOL §13. The predecessor's fifteen proved bodies and nine proved examples survive at [immutable cef4c208](https://github.com/CBirkbeck/tauceti-explorer/blob/cef4c2085eddbf723e9050f7d4924924d593a0e3/research/blueprint/suggested/StableReductionPartII.lean). Its receipts remain historical. Condensing existing admitted example bodies changes no test statement.

## Fresh reading

Complete prior handoff, issue and binding Yuan/DGH StableReductionPartII routes; all 905 lines of the upstream StableReduction document and all 202 lines of JacobianChallenge. Reviewed parent layers1/3 fully read with accepted REV-AUDIT-02 metadata; Part II has no dedicated reviewed row. Built generic algebra is reused. Upstream nodal-family and curve theory is imported, not replanned. No new supplier edge is introduced.

Fresh complete Knudsen2012 §3 Key Example, printed pp.11–12, and Corollary3.2 at [v2 PDF](https://arxiv.org/pdf/1106.1588v2). The section starts with noetherian/unit-discriminant hypotheses; the polynomial kernel and coefficient splitting here are explicit deductions over any commutative coefficient ring. No broader geometric strengthening follows. Eisenbud's cited resolution input, KnudsenII Appendix/Bourbaki III5.4.4 and Proposition7's exercise remain inherited open work.

Full named baseline statements, hypotheses and exact index names read for the two-variable ideal-membership theorem, bivariate evaluation order, AdjoinRoot induction/lift-on-representatives, ideal image membership and span containment, and Submodule.prodEquivOfIsCompl. Selected native ideal-map/span and complementary-submodule inputs inspected at the exact pins.

## Checks and reproduction

Complete current Mathlib-only sketch: Lean v4.34.0-rc2, exact Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; exit0, zero errors,160 admitted warnings only,70 examples. Existing build/artifacts reused, at least69 GB available before checks; one Lean process at a time. No project/cache/update/library build or language server. No matching Tau Ceti compiled import set certified or created.

Separate standalone kernel experiment: actual AdjoinRoot of the bivariate polynomial, actual evaluation and coordinate ideal; constants and kernel equivalence both check with zero errors/warnings. Both axiom audits contain only propext, Classical.choice and Quot.sound. It uses no supplied ideal-generation hypothesis and adds no public assumption. It is not a compiled proof of sectionSplit or a global statement.

The exact experiment is archived only in the allowed suggested Lean file at [prototype revision](https://github.com/CBirkbeck/tauceti-explorer/blob/3f2331a296aa232a5eaf419df358db0cfec27553/research/blueprint/suggested/StableReductionPartII.lean), between the BEGIN/END ARCHIVED CHECKED SECTION KERNEL EXPERIMENT markers. Extract only the text between those marker lines, retaining the final newline; check its SHA-256 below. Run a single lake env lean on the absolute scratch filename from an existing exact pinned Mathlib build after checking memory. No Lean code is placed in this handoff.

The following independent standard-library script checks 2,896 auxiliary finite quotients R/(v³), for all coefficient parameters over moduli1–8 with t³=0. It makes448,551 exact splitting/scalar/evaluation assertions and includes the three hypothesis-boundary fixtures. These finite quotients are regressions, not the full polynomial ring or a general proof. Save in your own disk scratch and run Python3.

```python
from itertools import product
L=3
assertions=models=0
def check(b):
 global assertions
 assert b
 assertions+=1
for n in range(1,9):
 for gamma,delta,s,t in product(range(n),repeat=4):
  if t**L%n:continue
  models+=1
  q=(s*s+gamma*s*t+delta*t*t)%n
  zero=(0,)*(2*L)
  one=(1%n,)+(0,)*(2*L-1)
  u=(0,)*L+(1%n,)+(0,)*(L-1)
  def add(a,b):return tuple((x+y)%n for x,y in zip(a,b))
  def scale(c,a):return tuple(c*x%n for x in a)
  def cp(c):return (c%n,)+(0,)*(2*L-1)
  def poly_mul(a,b):
   return tuple(sum(a[j]*b[i-j] for j in range(i+1))%n for i in range(L))
  def mul(a,b):
   aa,ab,ba,bb=a[:L],a[L:],b[:L],b[L:]
   ac=poly_mul(aa,ba);bd=poly_mul(ab,bb)
   cross=poly_mul(aa,bb);cross2=poly_mul(ab,ba)
   return tuple((ac[i]+q*bd[i]-(delta*bd[i-2] if i>=2 else 0))%n for i in range(L))+tuple(
    (cross[i]+cross2[i]-(gamma*bd[i-1] if i else 0))%n for i in range(L))
  def ev(r):return sum((r[i]+s*r[L+i])*t**i for i in range(L))%n
  def project(r):return add(r,scale(-1,cp(ev(r))))
  def split(r):return project(r),ev(r)
  def unsplit(j,a):return add(j,cp(a))
  basis=[tuple(int(i==j)%n for i in range(2*L)) for j in range(2*L)]
  for a in range(n):check(ev(cp(a))==a);check(split(cp(a))==(zero,a))
  for i,r in enumerate(basis):
   j,a=split(r);check(ev(j)==0);check(unsplit(j,a)==r);check(project(j)==j)
   check(ev(r)==sum((r[k]+s*r[L+k])*t**k for k in range(L))%n)
   for b in range(n):check(split(scale(b,r))==(scale(b,j),b*a%n))
   for z in basis:
    check(ev(mul(r,z))==ev(r)*ev(z)%n)
    check(project(add(r,z))==add(project(r),project(z)))
  if n==4 and (gamma,delta,s,t)==(0,0,1,0):
   check(split(u)==(add(u,scale(-1,one)),1));check(project(u)!=zero)
  if n==1:check(all(split(r)==(zero,0) for r in basis))
  if n==5 and (gamma,delta,s,t)==(1,0,0,0):
   check(project(one)==zero);check(project(u)==u);check(u!=zero)
   check(project(mul(u,one))!=mul(u,project(one)))
print("finite models R/(v^3), moduli 1–8:",models)
print("exact splitting, scalar and evaluation assertions:",assertions)
print("nonreduced, zero-base and non-R-linear fixtures: passed")
```

Indexed checker: zero errors/warnings. Actual read-only atlas assembler with the normal overlays and replaced-decomposition trimming: stages3050 vertices/8750 edges, own119/264, scoped stages/declarations/requests3134/9247, all acyclic. All81 computed stage prerequisite pairs reachable; no own skipped links; identical stage edges and other-roadmap skips compared with the unchanged packet overlay. Counts differ from historical receipts because the explicit computation and source snapshot are identified. This does not audit every unrelated accepted declaration graph.

Reproduce the projection/preservation check below from the repository, saving it in your own scratch. It only writes its JSON result next to itself and performs no site build.

```python
import json,sys,subprocess,hashlib,re
from pathlib import Path
from collections import defaultdict,deque
root=Path.cwd();sys.path.insert(0,str(root/"scripts"));import build
rid="StableReductionPartII"
packetpath="research/blueprint/packets/"+rid+".json"
roadmappath="research/blueprint/roadmaps/"+rid+".json"
base="8f4ada63db0b7f081d82ed98518523585770a21e"
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
assert ar[rid]["blueprint"]["declarations"]==119
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
result={"actualAssembler":True,"declarations":119,"planets":35,"ownSkippedLinks":[],
 "stageDAG":stageDAG,"ownDeclarationDAG":ownDAG,"stagesAndReachableDeclarations":combined,
 "reachableDeclarations":len(used),"externalDeclarations":sorted(used-set(own)),
 "requiredStagePairsReachable":len(pairs),"stageEdgesUnchanged":True,
 "otherSkipsMatchOriginal":True,"unchangedNodeObjects":unchanged,
 "scriptSha256":hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
Path(__file__).with_suffix(".json").write_text(json.dumps(result,indent=2)+"\n")
print(json.dumps(result,indent=2))
```

SHA-256 receipts:

- Current native: d544f7832817056f8155239d116d0d0fa55f5a1341e1d1ef56433d390c037784
- native.log: 35106ebb4dcb128e07a96dfe194ced01db341578dde6b68d3dea770799f049cd
- kernel.lean: 030538ddbfbf97c41743ce4d91d4b20e9a9229826a13c1f13f582dbb968dd11a
- kernel.log: 93c599da8f82de6a3c493b3e6cb17305b6ed374832beeecd4ff841b7062cba6f
- finite.py: f2c6ad3df39f5cc81195d3a150b73cc34bedc8178191629a61d520fe78be24bc
- finite.log: 22a786c2f09185507ed1711c38d7a513bd4fabc402a074d352e0baf4a2b9ce5c
- projection.py: c249208d9836ee6de726fa9f65c6e94302da2ec5a1a60a6ee329956c8bff99a5
- Knudsen2012-v2.pdf: de9f73f25a4fbe03dbe2865ebc5932412b5bf3aa7f02734c04de05013da44d36

## Continue from here

Instantiate the suggested coefficient splitting against its actual ideal and coefficient-module scalar tower, using the checked quotient-kernel route and built complementary-submodule equivalence. Keep the maps canonical. Then finish the actual cokernel/dual/scalar-correction/tensor comparisons and sheaf descent.

The unapproved StablePeriodicCurved PartII ownership proposal remains unapproved. Supply the relative S→R stable-reflexivity criterion and arbitrary S-module Hom/Ext comparisons; ordinary flat ambient Hom transport does not replace them. Acquire/prove the two-base completion comparison of Appendix Proposition6 and resolve Proposition7's exercise. Establish the unit-discriminant pointed completed-local hull, its actual nodal-family identification and coefficient-compatible faithful descent.

All remaining MC.0–MC.7 moduli, positivity, fine-level, determinant/Deligne pairing, Picard/Torelli, arbitrary-base approximation and source-collation gaps remain required. No stage or shared geometric key is closed.

The complete preceding handoff remains at the base commit named in the projection script. Own scratch is removed after opening the PR; referenced source code survives above or in the immutable suggested-file archive, with exact hashes.
