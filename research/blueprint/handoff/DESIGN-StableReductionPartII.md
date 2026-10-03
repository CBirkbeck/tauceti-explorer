# Polynomial section bidual evaluation — Codex codex-7e92bd

Refs #3342. Claim 5963507827 was confirmed by bot 5963509180.
Mathematical base `1636db22ab77e42624c42da4706ca8e9e8f28ce0`; publication base `b80fdf573cd685fc5723bd55865eb7392a56c9c2`.
Seventeen owner, governing, audit, key, source-route and validator inputs were
byte-identical between those bases before bringing foreign main changes into
this worker branch. The scripts below use that publication context.
This is a partial checkpoint; every implementation status remains unchecked.

## What is proved in the separate native evidence

For any commutative coefficient ring A, set
R=A[Y][X]/(X²+γXY+δY²−q(s,t)), c=u−s, d=v−t,
b=u+s+γt and a=δv+δt+γu, with coefficient inclusions understood.
The actual ideal is J=(c,d), its actual R-linear dual is D, and ε∈D satisfies
dε(j)=bj. The inverse of native bidual evaluation is
ψ(F)=F(incl)∈J. Indeed dF(ε)=bF(incl), and the previously checked dual syzygy
writes F(incl)=dr+ιαc. Evaluation at inclusion gives ψη=id.
Regularity of d gives F(ε)=ε(ψ(F)); the surjective ordered presentation
(z₀,z₁)↦z₀·incl−z₁·ε then proves ηψ=id on every h∈D.
The resulting `Module.IsReflexive R J` supplies native `Module.evalEquiv`;
its inverse is exactly ψ. The native dual-of-reflexive instance supplies
ordinary reflexivity of D without a second local definition.

There is no noetherian, unit-discriminant, nonzero-ring or nonzero-parameter
hypothesis in this polynomial calculation. Knudsen's printed Proposition3.1
has stronger hypotheses and the stronger stable-reflexivity conclusion.
Arbitrary coefficient-module Hom exchange, higher Ext interpretation,
relative stable reflexivity and completion/family descent remain required.

Twelve new nodes give two constructions, nine lemmas and one theorem.
The two constructions have six API entries and seven tests; the theorem has
three further tests, including nonreduced Z/4, the zero ring and native dual
reflexivity. All 214 old statement/hypothesis/source/acceptance/API/test/use
contracts are preserved; 213 whole node objects are unchanged. Only the
`dual-section-ideal` consumer gains prerequisites and one proof step.
The reader retains the previous document exactly after its new section.
The prior checkpoint's detailed provenance is available at the
[incoming handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/1636db22ab77e42624c42da4706ca8e9e8f28ce0/research/blueprint/handoff/DESIGN-StableReductionPartII.md).
All prior continuation receipts remain in the packet verbatim.

Current totals: 226 nodes (8 definitions, 47 constructions, 107 lemmas,
63 theorems, 1 application), 206 API entries overall (205 on definitions and
constructions), 209 tests overall (196 on definitions and constructions),
123 baseline references, 35 planets, 14 gaps and 135 supplier requests.
All eight stages remain partial; no stage is closed. The reserved moduli key,
six paper consumers, nineteen Yuan items and two DGH items are unchanged.

## Source and library readings

Fresh reading: Knudsen, *A Closer Look at the Stacks of Stable Pointed Curves*,
arXiv:1106.1588v2 (3 April2012), introduction/Main Lemma, complete §3,
Proposition3.1, Corollary3.2 and §4 proof, using the
[versioned HTML](https://arxiv.org/html/1106.1588v2#S3).
Downloaded HTML SHA-256:
`2c89ce4072046d546ff9256a5c64cd488f41026c561f8858f4a78ce14c21d685`.
Access date 2026-10-03. The explicit inverse and coefficient generality are
authored deductions from the polynomial syzygy; no new whole-paper,
Knudsen Appendix or Ile proof audit is claimed.

The parent roadmap's scope, end goals and standing conventions were read,
with reviewed library-audit layers1 and3 and REV-AUDIT-02. The current eight
stages, source metadata, full reserved-key entry, consumer inventory and
Yuan/DGH route requirements were inspected. The inherited global source
readings and unresolved completion/supplier obligations retain their scope.

At pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, the actual
`Module.Dual`, `Module.Dual.eval`, `Module.IsReflexive`, `Module.evalEquiv`
and `Module.Dual.instIsReflecive` declarations were read in
`Mathlib/LinearAlgebra/Dual/Defs.lean`. Native evaluation is reused directly.
A bounded fresh open Mathlib PR search for `module reflexive` returned no
matches. The human May9–11 2025
[dual linear maps discussion](https://leanprover-community.github.io/archive/stream/113489-new-members/topic/How.20to.20express.20dual.20linear.20maps.3F.html)
points to native evaluation and reflexivity; no external implementation was copied.
Specialized searches in the pinned algebraic-geometry and AdjoinRoot files
found no section-ideal bidual theorem; this is not a global absence claim.

The Tau Ceti audit pin remains `f790474821cf4256814db967cb154e7af3d0c369`.
The existing shared compilation checkout itself has Tau Ceti HEAD
`cf386627e9176a3827c1a5fe804989fd94a4d216`, while its Mathlib dependency is
exactly the pinned commit. Both checked files import only Mathlib; no claim
is made that this checkout validates pinned Tau Ceti imports. No build setup,
cache download, library build or language server was used.

## Lean evidence and public recovery

The final canonical file is the admitted plan required by PROTOCOL §13:
2476 lines, 147 examples, 355 admission warnings,
zero other warnings/errors; 21.89s, 3100036KiB peak RSS.
SHA-256 `94f645a88c399ce9ac560a3fb1cc8887deb46b7536385e1b39b7544d4645dd1a`.
Diagnostics SHA-256 `afb1245522c28192530d8a1c22c4df4fc04ccadf1a8f3678624376e568fefcd2`.

The separate native proof has 2586 lines, 85 examples and
166 named axiom audits; zero warnings/errors/admissions and no
`sorryAx`. It took 18.81s, 3244408KiB peak RSS.
SHA-256 `de4a6b846c7e33b576a7e9119947292ab5bd513e70b67c094b8a4303627904e5`.
Diagnostics SHA-256 `f53e06df11a79fa274d53613788937369741328bb71f87d7a8aec3b97302d609`.
Each run started with 47GiB available and used a 1200-second timeout;
only one worker Lean process ran at a time. Twelve declaration and ten example
headers match the canonical file exactly. The entire previous 2434-line native
source is preserved after one added import.

The proof is publicly recoverable from commit `ca039d9d67f5465b9218b5e8d0d171ec85fe6b57`, in an inert block
of the [suggested file](https://github.com/CBirkbeck/tauceti-explorer/blob/ca039d9d67f5465b9218b5e8d0d171ec85fe6b57/research/blueprint/suggested/StableReductionPartII.lean).
Save this complete script as `recover.py` in your own disk scratch and run it
from a repository checkout containing that commit. It writes only a sibling
`Native.lean` and verifies its exact digest:

```python
import subprocess,hashlib
from pathlib import Path
archive="ca039d9d67f5465b9218b5e8d0d171ec85fe6b57"
path="research/blueprint/suggested/StableReductionPartII.lean"
text=subprocess.check_output(["git","show",archive+":"+path],text=True)
start="/- BEGIN ARCHIVED CHECKED SECTION BIDUAL EVALUATION\n"
end="END ARCHIVED CHECKED SECTION BIDUAL EVALUATION -/"
assert text.count(start)==text.count(end)==1
native=text.split(start,1)[1].split(end,1)[0]
assert hashlib.sha256(native.encode()).hexdigest()=="de4a6b846c7e33b576a7e9119947292ab5bd513e70b67c094b8a4303627904e5"
Path(__file__).with_name("Native.lean").write_text(native)
print(len(native.splitlines()),"lines recovered exactly")
```

Compile recovered `Native.lean` and the final suggested file serially with an
existing build whose Mathlib dependency is at the pin, after checking `free -g`
shows at least20GiB available. Use `timeout 1200 lake env lean <absolute-file>`
from that build; do not create a project or download caches. The canonical
file has expected admissions; the recovered file must have none.
Worker-retained evidence contains `Native.lean`, `Canonical.lean`, their logs,
`lean-evidence.json`, `knudsen2012-v2.html`, recovery/verification/graph scripts
and receipts, publication guard and the five submitted deliverables.

## Validation

The fully indexed packet checker passes with zero errors and warnings.
Actual intake reports zero file problems and automatic refusals. The actual
atlas assembler is run with only this owner definition and packet overlaid;
foreign promoted inputs are preserved. Stage graph: 3050
vertices/8750 edges; owner declaration graph:
226/535; combined
stages and reachable declarations: 3241/
9625. All are acyclic.
All226 own declarations are reachable, there are no external declaration
nodes or unresolved prerequisites, all81 required stage pairs are reachable,
and own skipped/pending links are empty. Other roadmaps' skipped/pending links
match the original-owner control. Only the five allowed paths differ from
publication main.

Save the following as `verify.py` beside the recovered proof and run it from
the repository root. It checks native/canonical header parity, inherited
contracts, every API/test name, reader contracts and actual intake rules:

```python
import json,re,subprocess,hashlib,importlib.util,sys
from pathlib import Path
root=Path.cwd();scratch=Path(__file__).parent;rid='StableReductionPartII'
paths=['research/blueprint/'+k+'/'+rid+ext for k,ext in [('packets','.json'),('roadmaps','.json'),('readmes','.md'),('suggested','.lean')]]+['research/blueprint/handoff/DESIGN-'+rid+'.md']
p=json.loads((root/paths[0]).read_text());meta=p['ordinaryBidualContinuation'];base=meta['mathematicalBase'];pub=meta['publicationBase']
old=json.loads(subprocess.check_output(['git','show',base+':'+paths[0]],text=True));on={n['id']:n for n in old['nodes']};nn={n['id']:n for n in p['nodes']}
for key in ['requests','gaps','sources','sourceIssues','sourceVersions','consumerCoverage','keyDefinitionCoverage','restructure','upstreamImportEncoding']:
 assert p[key]==old[key],key
for name,n in on.items():
 for key in ['id','kind','statement','hypotheses','acceptance','sources','implementationStatus','api','tests','uses']:
  assert nn[name].get(key)==n.get(key),(name,key)
assert sum(nn[k]==v for k,v in on.items())==213
assert all(n['implementationStatus']=='unchecked' for n in p['nodes'])
assert p['baseline']['declarations'][:len(old['baseline']['declarations'])]==old['baseline']['declarations']
for key in ['coefficientChangeContinuation','polynomialCoordinateContinuation','dualCoordinateContinuation','coefficientFlatnessContinuation','matrixPresentationContinuation','universalTensorContinuation']:assert p[key]==old[key],key
can=(root/paths[3]).read_text();native=(scratch/'Native.lean').read_text();reader=(root/paths[2]).read_text()
marker='/- Actual polynomial section biduality; authored continuation of Knudsen §3. -/'
def headers(text):
 result={}
 for m in re.finditer(r'^(?:lemma|theorem|def|example)\b',text,re.M):
  tail=text[m.start():];depth=0;cut=None
  for i,c in enumerate(tail):
   if depth==0 and (tail.startswith(' :=',i) or tail.startswith(' where\n',i)):cut=i;break
   if c in '([{':depth+=1
   elif c in ')]}':depth-=1
  assert cut is not None
  header=tail[:cut]
  if header.startswith('example'):
   match=re.search(r'^-- (NodeSectionFactorization\.PolynomialModel\.[\w.]+)\n\s*$',text[:m.start()],re.M);assert match;name=match[1]
  else:name=header.split()[1]
  assert name not in result;result[name]=' '.join(header.split())
 return result
nh=headers(native.split(marker,1)[1]);ch=headers(can.split(marker,1)[1]);assert nh==ch and len(nh)==22
assert not re.search(r'\bsorry\b|^axiom\b|^opaque\b',native,re.M)
assert 'BEGIN ARCHIVED CHECKED' not in can
assert len(re.findall(r'^example\b',native,re.M))==85
assert len(re.findall(r'^#print axioms ',native,re.M))==166
assert len(re.findall(r'^example\b',can,re.M))==147
for n in p['nodes']:
 for t in n.get('tests',[]):assert t['name'] in can,t['name']
 for a in n.get('api',[]):assert a['name'].split('.')[-1] in can,a['name']
for id in set(nn)-set(on):
 n=nn[id];assert n['statement'] in reader and n['declarationName'] in reader
 assert n['declarationName'].split('.')[-1] in ch
 for t in n.get('tests',[]):assert t['statement'] in reader and t['name'] in nh
 for a in n.get('api',[]):assert a['statement'] in reader and a['name'] in reader
assert reader.endswith(subprocess.check_output(['git','show',base+':'+paths[2]],text=True))
spec=importlib.util.spec_from_file_location('intake',root/'research/blueprint/intake.py');intake=importlib.util.module_from_spec(spec);spec.loader.exec_module(intake)
problems=[v for path in paths for v in intake.file_problems(path,(root/path).read_text())];assert not problems,problems
jobs,mapping=intake.load_queue();job=next(j for j in jobs if j['id']=='DESIGN-'+rid)
refusals=intake.auto_refusals(job,paths,False,set(),{'codex-7e92bd'});assert not refusals,refusals
changed=set(subprocess.check_output(['git','diff','--name-only',pub],text=True).splitlines());assert changed<=set(paths),changed
for path in paths:assert not re.search(r'/(?:home|tmp|Users)/|file'+':/'+'/',(root/path).read_text()),path
result={'inheritedContracts':214,'wholeInheritedNodesUnchanged':213,'exactNewHeaderParity':22,'nativeLines':len(native.splitlines()),'nativeExamples':85,'nativeAxiomAudits':166,'canonicalLines':len(can.splitlines()),'canonicalExamples':147,'intakeProblems':problems,'automaticIntakeRefusals':refusals,'allStatusesUnchecked':True,'scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
Path(__file__).with_suffix('.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
```

Verification script SHA-256:
`4f56db3946b6ef1ee05d42b37a441b98b5a771396817cf526fb6b3f5fa6e174d`.

The complete actual assembler comparator follows. Save it as `graph.py` in
scratch and run it from the repository root; its only output file is its
sibling JSON receipt:

```python
import json,sys,subprocess,hashlib,re
from pathlib import Path
from collections import defaultdict,deque
root=Path.cwd();sys.path.insert(0,str(root/"scripts"));import build
rid="StableReductionPartII"
packetpath="research/blueprint/packets/"+rid+".json"
roadmappath="research/blueprint/roadmaps/"+rid+".json"
base="b80fdf573cd685fc5723bd55865eb7392a56c9c2"
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
unresolved=[]
for v in used:
 for d in allnodes[v].get("prerequisites",[]):
  if d not in used and d not in stageids and not d.startswith("mathlib:") and not (d.startswith("tauceti:") and "TauCetiRoadmap/" not in d):unresolved.append((v,d))
assert not unresolved,unresolved
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
assert ar[rid]["blueprint"]["declarations"]==len(own)
assert ar[rid]["blueprint"]["planets"]==35
assert not ar[rid]["blueprint"]["skippedLinks"]
assert not ar[rid].get("pendingLinks"), ar[rid].get("pendingLinks")
assert all(ar[x].get("pendingLinks")==cr[x].get("pendingLinks") for x in cr)
assert all(ar[x].get("blueprint",{}).get("skippedLinks")==cr[x].get("blueprint",{}).get("skippedLinks") for x in cr)
for key in ("requests","gaps","sources","sourceIssues","sourceVersions","consumerCoverage","keyDefinitionCoverage","restructure","upstreamImportEncoding"):
 assert p[key]==old[key],key
on={n["id"]:n for n in old["nodes"]}
for id,n in on.items():
 for key in ("id","kind","statement","hypotheses","acceptance","sources","implementationStatus"):
  assert own[id].get(key)==n.get(key),(id,key)
 assert all(u in own[id].get("uses",[]) for u in n.get("uses",[]))
 assert all(t in own[id].get("tests",[]) for t in n.get("tests",[]))
 assert all(t in own[id].get("api",[]) for t in n.get("api",[]))
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
result={"actualAssembler":True,"declarations":len(own),"planets":35,"ownSkippedLinks":[],
 "stageDAG":stageDAG,"ownDeclarationDAG":ownDAG,"stagesAndReachableDeclarations":combined,
 "reachableDeclarations":len(used),"externalDeclarations":sorted(used-set(own)),"unresolved":unresolved,
 "requiredStagePairsReachable":len(pairs),"stageEdgesUnchanged":True,
 "ownPendingLinks":[],"otherPendingLinksMatchOriginal":True,"otherSkipsMatchOriginal":True,"unchangedNodeObjects":unchanged,
 "scriptSha256":hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
Path(__file__).with_suffix(".json").write_text(json.dumps(result,indent=2)+"\n")
print(json.dumps(result,indent=2))
```

Assembler script SHA-256:
`854447542f3a61b20d6297578c06cf20d953df278bd321c70da9939bfe18a075`.

Run the indexed checker with the existing baseline declaration index:
`python3 scripts/check_blueprint.py research/blueprint/packets/StableReductionPartII.json --index <declarations.tsv> --json`.

## Exact next work

Construct the actual arbitrary-coefficient-module comparison
Hom_R(J,R)⊗_A M → Hom_R(J,R⊗_A M), and the analogous map for D,
with explicit naturality and the correct module structures. Interpret the
coefficient-universal matrix complexes as native finite-free resolutions and
their Hom complexes to prove higher Ext vanishing. Connect the ordinary
bidual evaluation proved here to those comparisons. Then reconcile the exact
relative stable-reflexivity Appendix/Ile interface, two-base completion,
pointed completed-local hull and family/sheaf descent. All other MC.0–MC.7,
reserved-key, level, determinant, Torelli, Picard and source obligations remain.
