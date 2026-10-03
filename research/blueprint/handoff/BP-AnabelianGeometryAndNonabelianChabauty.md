# Continuous source restriction — Codex codex-7e92bd

Refs #1020. Claim5963616382 confirmed by bot5963617645. Complete issue read
before and after confirmation. Mathematical base `b80fdf573cd685fc5723bd55865eb7392a56c9c2`;
publication base `bfef64afffd06e4c8a18b53a76c331a147dd7eb7`. Eighteen own, governing, audit/review,
key, atlas and validator inputs were byte-identical between those bases before
foreign main changes were brought into the worker branch.

## Result and scope

Twenty-three declaration-sized nodes specify general continuous source
restriction on actual nonabelian cocycles, gauge-orbit H¹ and native invariant
subgroups: three constructions and twenty lemmas. Their twenty API records
and thirteen tests include agreement with the existing subgroup restrictions,
native pulled-back action construction, surjective-source neutral reflection,
and an explicit nonneutral discrete S₂→S₃ transposition cocycle killed by
restriction along the constant-one source map.

For φ:H→G continuous, with H acting on U through φ, cocycle restriction is
c↦c∘φ. The identity c(φ(hk))=c(φ(h))·φ(h)c(φ(k)) gives the H-cocycle law.
Expanding the ordered gauge action gives res_φ(x·c)=x·res_φ(c), with the same
witness x. Native Quotient.lift therefore gives H¹ restriction. Precomposition
is contravariant under composition and commutes with coefficient maps. Its
subgroup special case agrees with the existing native restriction, with no
closedness assumption needed for this abstract map. Native invariant
restriction is inclusion U^G→U^H and is always injective. For cocycles and H¹,
surjectivity of φ permits recovery of values and gauge witnesses, proving
injectivity; general source maps need not be injective on H¹.

The signature supports groups with arbitrary topologies on the source,
not necessarily topological-group structures. H¹/gauge operations require a
topological coefficient group and jointly continuous actions. Pure cocycle
precomposition needs only continuity of φ. H⁰ requires no topology.
Mathlib's native MulDistribMulAction.compHom and
MulAction.continuousSMul_compHom supply the canonical pulled-back action and
its continuity; no private replacement is added. No compactness, discreteness,
finite U, coefficient commutativity or unipotent realization is assumed.

All112 old mathematical statement/hypothesis/API/test/acceptance/use contracts
are preserved;111 whole node objects are unchanged. The existing functoriality
node gains source-map prerequisites and its proof route is updated. Its Kim2009
restriction citation is corrected from §3 to §4 Comments II, printed p.25,
where the exact quoted paragraph occurs. This is a corrected packet locator,
not a newly alleged mathematical error in the source. Historical sourceIssues,
sourceVersions and all prior continuation receipts remain unchanged.

The reserved all-degree, coefficient-class-sensitive étale K(π,1) owner and
its raw-homotopy qualifications are unchanged. RT-AREA-algebraicgeometry/8
still imports NS/ρ and symmetric homomorphisms from A2, without a duplicate
or reverse generic-height dependency. Chen /57–58, all17 BDMTV NC.2 and19 NC.5
route items, four applications and E9/E10 remain explicit source obligations.
The entire predecessor reader is retained after its new section. Prior
handoff provenance is available at the
[incoming checkpoint](https://github.com/CBirkbeck/tauceti-explorer/blob/b80fdf573cd685fc5723bd55865eb7392a56c9c2/research/blueprint/handoff/BP-AnabelianGeometryAndNonabelianChabauty.md).

Current totals:135 nodes (3 definitions,23 constructions,76 lemmas,
27 theorems,6 comparisons),145 API records overall (133 required),120 tests
(109 required),126 baseline references,11 planets,9 gaps and16 requests.
All seven stages remain partial; all implementation statuses are unchecked.

## Reading and library boundary

Fresh reading covers the campaign document, all seven stage descriptions and
17 touching stage edges, all seven reviewed NC audit rows and the complete
REV-AUDIT-08 correction report, the reserved survey definition/API and current
key-node contract, all29 matching link-file entries, the current gaps and the
inherited cocycle, gauge, subgroup-restriction and coefficient-map interfaces.
Negative link screens remain screens. Style passages of the upstream
AlgebraicCurves and AdicSpaces documents were read earlier in this continuous
session; no new full reading of those long documents is claimed. No fresh
whole112-node proof audit or full Chen/BDMTV reading is claimed.

Fresh source reading:

- [Kim, math/0409456v1](https://arxiv.org/pdf/math/0409456v1), §1 printed
  pp.5–7: continuous cocycle/gauge conventions, Proposition1 proof and the
  coefficient-functor paragraph. PDF SHA-256
  `00efa6e96091d564f7afa2ad9fb917a34cc0a55b7e258164383519b4e93ba941`.
- [Kim, math/0510441v4](https://arxiv.org/pdf/math/0510441v4), selected §4
  printed pp.25–26: restriction, inverse-image local conditions and initial
  local exactness argument. No complete local-condition or whole-paper audit.
  PDF SHA-256 `7b404331925f1d8e9bce81e9b16473f0d65a7f1ac2948ccff0db3a6e7b0d0f19`.

Both exact versioned PDFs were downloaded on2026-10-03. The general source
laws and injectivity criterion are authored deductions from the actual
cocycle/gauge definitions. No representability or geometric torsor comparison
is certified by these elementary maps.

Fresh open-Mathlib-PR search found
[PR31613](https://github.com/leanprover-community/mathlib4/pull/31613) at
`9dc1e337689fa7ba4fefa52b4874660bdd3a3619`. Its body, changed filenames,
declaration-name screen and actual H0/Z1/H1 coefficient-map portions were
read. It uses algebraic additive notation without topology. No PR code was
copied. The human March11 2024
[bundled-restriction discussion](https://leanprover-community.github.io/archive/stream/113489-new-members/topic/Restriction.20of.20a.20bundled.20function.20to.20a.20subset.html)
points to native subgroup homomorphisms and composition. The search was bounded.

The new native Subgroup.subtype, MulDistribMulAction.compHom and
MulAction.continuousSMul_compHom statements, and the existing relevant
continuous homomorphism/low-degree cohomology interfaces, were read at pinned
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Tau Ceti's audit pin remains `f790474821cf4256814db967cb154e7af3d0c369`.
The existing compilation checkout has Tau Ceti HEAD
`cf386627e9176a3827c1a5fe804989fd94a4d216`, while its Mathlib dependency is
exactly pinned. The checked proof and extraction import only Mathlib; no claim
is made that they validate Tau Ceti imports at its audit pin.

## Checked evidence and public recovery

Native.lean:1920 lines,78 examples,103 named axiom audits, zero errors,
warnings, admissions or sorryAx;11.55s,3578556KiB peak RSS.
The entire1599-line incoming native source is an exact prefix. All23 public
declaration and13 full example headers match the canonical continuation,
including the complete let-bound finite-group and action setups.

Sketch.lean:2295 lines,120 examples,288 expected admission warnings,
zero errors or other warnings;12.80s,3592080KiB peak RSS. This removes only
Tau Ceti imports and the named Abelian section from the canonical plan.
The full2312-line canonical file is UNCOMPILED: the existing shared build lacks
TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree.olean,
checked again at publication. No project setup, dependency update, cache
retrieval, library build, stubs or language server was used. Each serial Lean
run began with46GiB available and used a1200-second timeout. All compilers exited.

Exact source/diagnostic digests:

```json
{
  "Native": {
    "lines": 1920,
    "examples": 78,
    "sha256": "a16998e71dad9598ba3ca20aa69586a42c9815778bcc5b0200195905380beef5",
    "diagnosticsSha256": "85b2e778ad7c2deb13b9c2574bd742d5d8a3a1a56f30b6daf7286956a02f99a8",
    "errors": 0,
    "warnings": 0,
    "admissionWarnings": 0,
    "axiomAudits": 103,
    "seconds": 11.55,
    "peakRSSKiB": 3578556,
    "availableGiB": 46,
    "exit": 0
  },
  "Sketch": {
    "lines": 2295,
    "examples": 120,
    "sha256": "e140dcf74d257c337b8e8209cd014b513a8d037321179a8de4e5649887bed5d6",
    "diagnosticsSha256": "033f7ce369d5a57b86538118c35b8befdc6b538cd882e857b15620433dc7c1bd",
    "errors": 0,
    "warnings": 288,
    "admissionWarnings": 288,
    "axiomAudits": 0,
    "seconds": 12.8,
    "peakRSSKiB": 3592080,
    "availableGiB": 46,
    "exit": 0
  },
  "Canonical": {
    "lines": 2312,
    "examples": 120,
    "sha256": "47d2f863bd53147cd1d5308021718f28ff59d0f0d330ff80ea89a06b34f4c63a",
    "compiled": false,
    "reason": "Missing TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree artifact in the existing shared build. The checked Mathlib-only extraction removes TauCeti imports and only the named Abelian section."
  }
}
```

The proof is publicly archived in an inert comment at `d8071e2f07137e000f4972b8d880c0ecd86a9a51`, in the
[allowed suggested file](https://github.com/CBirkbeck/tauceti-explorer/blob/d8071e2f07137e000f4972b8d880c0ecd86a9a51/research/blueprint/suggested/AnabelianGeometryAndNonabelianChabauty.lean).
The final file restores the admitted plan. Save this complete recovery script
as `recover.py` in your own disk scratch and run it from the final repository
checkout after fetching the PR branch. It writes only sibling Native.lean,
Sketch.lean and the original control packet, checking both Lean digests:

```python
from pathlib import Path
import subprocess,hashlib
out=Path(__file__).parent
archive="d8071e2f07137e000f4972b8d880c0ecd86a9a51"
path="research/blueprint/suggested/AnabelianGeometryAndNonabelianChabauty.lean"
raw=subprocess.check_output(["git","show",archive+":"+path],text=True)
start="/- BEGIN ARCHIVED CHECKED NONABELIAN SOURCE RESTRICTION\n"
end="END ARCHIVED CHECKED NONABELIAN SOURCE RESTRICTION -/"
assert raw.count(start)==raw.count(end)==1
native=raw.split(start,1)[1].split(end,1)[0]
assert hashlib.sha256(native.encode()).hexdigest()=="a16998e71dad9598ba3ca20aa69586a42c9815778bcc5b0200195905380beef5"
(out/"Native.lean").write_text(native)
can=Path(path).read_text()
assert hashlib.sha256(can.encode()).hexdigest()=="47d2f863bd53147cd1d5308021718f28ff59d0f0d330ff80ea89a06b34f4c63a"
sketch="\n".join(l for l in can.splitlines() if not l.startswith("import TauCeti."))+"\n"
x=sketch.index("section Abelian");z=sketch.index("end Abelian",x)+len("end Abelian")
sketch=sketch[:x]+sketch[z:]
assert hashlib.sha256(sketch.encode()).hexdigest()=="e140dcf74d257c337b8e8209cd014b513a8d037321179a8de4e5649887bed5d6"
(out/"Sketch.lean").write_text(sketch)
(out/"original-packet.json").write_bytes(subprocess.check_output([
 "git","show","b80fdf573cd685fc5723bd55865eb7392a56c9c2:research/blueprint/packets/AnabelianGeometryAndNonabelianChabauty.json"]))
print("Native and Mathlib-only sketch recovered with exact hashes")
```

Compile Native.lean and Sketch.lean serially from an existing build with pinned
Mathlib after `free -g` shows at least20GiB available, using
`timeout 1200 lake env lean <absolute-file>`. No setup or build is required.
Worker-retained evidence consists of those two files, Canonical.lean, logs,
lean-evidence.json, the versioned PDFs, prior-art receipt, recovery/verification/
graph scripts and receipts, publication guard and the four submitted files.

## Validation

The fully indexed packet checker has zero errors and warnings. Actual intake
reports no file problems or automatic refusals. The actual assembler overlays
this owner packet into unchanged promoted inputs and compares the original
owner packet on the same publication tree. It reports stage DAG3018/8655,
owner DAG135/303 and combined DAG3142/9129, all acyclic;135 reachable owner
nodes, zero unresolved references, all20 required stage paths reachable and
no owner pending/skipped links. Other roadmaps' skipped/pending links and all
stage edges agree with the original control. Only the four allowed files differ
from publication main.

Save this exact verifier beside the recovered proof and run it from the
repository root. It checks all inherited contracts, the one locator correction,
new headers, API/test names, reader statements and actual intake rules:

```python
from pathlib import Path
import json,re,subprocess,hashlib,importlib.util
root=Path.cwd();scratch=Path(__file__).parent;rid='AnabelianGeometryAndNonabelianChabauty'
paths=['research/blueprint/'+k+'/'+rid+ext for k,ext in [('packets','.json'),('readmes','.md'),('suggested','.lean')]]+['research/blueprint/handoff/BP-'+rid+'.md']
p=json.loads((root/paths[0]).read_text());meta=p['sourceRestrictionContinuation'];base=meta['base'];pub=meta['publicationBase']
old=json.loads(subprocess.check_output(['git','show',base+':'+paths[0]],text=True));on={n['id']:n for n in old['nodes']};nn={n['id']:n for n in p['nodes']}
for key in old:
 if key not in ['nodes','baseline','summary']:assert p[key]==old[key],key
for id,n in on.items():
 for k in ['id','kind','statement','hypotheses','sources','implementationStatus','acceptance','api','tests','uses']:
  expected=json.loads(json.dumps(n.get(k)))
  if id==rid+':NC.3/functoriality' and k=='sources':expected[0]['locator']='§4 Comments II, printed p.25'
  assert nn[id].get(k)==expected,(id,k)
 assert all(d in nn[id]['prerequisites'] for d in n['prerequisites'])
assert sum(nn[k]==v for k,v in on.items())==111
assert p['baseline']['declarations'][:len(old['baseline']['declarations'])]==old['baseline']['declarations']
assert all(n['implementationStatus']=='unchecked' for n in p['nodes'])
can=(root/paths[2]).read_text();native=(scratch/'Native.lean').read_text();reader=(root/paths[1]).read_text();marker='/- Continuous source restriction and coefficient compatibility. -/'
def bodypos(t):
 depth=0
 for i,c in enumerate(t):
  if depth==0:
   if t.startswith('example'):
    if any(t.startswith(x,i) for x in [' := by\n',' := rfl\n',' :=\n']):return i
   elif t.startswith(' :=',i) or t.startswith(' where\n',i):return i
  if c in '([{':depth+=1
  elif c in ')]}':depth-=1
 raise ValueError(t[:200])
def headers(text):
 out={}
 for m in re.finditer(r'^(?:def|lemma|example)\b',text,re.M):
  tail=text[m.start():];hdr=tail[:bodypos(tail)]
  if hdr.startswith('example'):
   match=re.search(r'^-- test: ([\w.]+)\n\s*$',text[:m.start()],re.M);assert match;name=match[1]
  else:name=hdr.split()[1]
  assert name not in out;out[name]=' '.join(hdr.split())
 return out
nh=headers(native.split(marker,1)[1]);ch=headers(can.split(marker,1)[1]);assert nh==ch and len(nh)==36
prefix=native.split(marker,1)[0].removesuffix('\n');assert hashlib.sha256(prefix.encode()).hexdigest()=='f5623ec94e4bb750a876d6a0268f362a0ee90a96dbffff26f2cece8cb59d604e'
assert not re.search(r'\bsorry\b|^axiom\b|^opaque\b',native,re.M)
assert len(re.findall(r'^example\b',native,re.M))==78
assert len(re.findall(r'^#print axioms ',native,re.M))==103
assert len(re.findall(r'^example\b',can,re.M))==120
assert 'BEGIN ARCHIVED CHECKED' not in can
for n in p['nodes']:
 for a in n.get('api',[]):assert a['name'] in can or a['name'].split('.')[-1] in can,a['name']
 for t in n.get('tests',[]):assert t['name'] in can,t['name']
for id in set(nn)-set(on):
 n=nn[id];name=n['declarationName'].removeprefix('TauCeti.NonabelianCohomology.');assert name in ch
 assert n['statement'] in reader and n['declarationName'] in reader
 for a in n.get('api',[]):assert a['name'] in reader and a['statement'] in reader
 for t in n.get('tests',[]):assert t['name'] in nh and t['statement'] in reader
assert reader.endswith(subprocess.check_output(['git','show',base+':'+paths[1]],text=True))
sketch='\n'.join(l for l in can.splitlines() if not l.startswith('import TauCeti.'))+'\n';a=sketch.index('section Abelian');z=sketch.index('end Abelian',a)+len('end Abelian');sketch=sketch[:a]+sketch[z:]
assert sketch==(scratch/'Sketch.lean').read_text()
spec=importlib.util.spec_from_file_location('intake',root/'research/blueprint/intake.py');intake=importlib.util.module_from_spec(spec);spec.loader.exec_module(intake)
problems=[v for path in paths for v in intake.file_problems(path,(root/path).read_text())];assert not problems,problems
jobs,mapping=intake.load_queue();job=next(j for j in jobs if j['id']=='BP-'+rid);refusals=intake.auto_refusals(job,paths,False,set(),{'codex-7e92bd'});assert not refusals,refusals
changed=set(subprocess.check_output(['git','diff','--name-only',pub],text=True).splitlines());assert changed<=set(paths),changed
for path in paths:assert not re.search(r'/(?:home|tmp|Users)/|file'+':/'+'/',(root/path).read_text()),path
result={'inheritedMathematicalContracts':112,'wholeInheritedNodesUnchanged':111,'sourceLocatorCorrection':1,'exactNewHeaderParity':36,'nativeLines':len(native.splitlines()),'nativeExamples':78,'nativeAxiomAudits':103,'canonicalLines':len(can.splitlines()),'canonicalExamples':120,'intakeProblems':problems,'automaticIntakeRefusals':refusals,'allStatusesUnchecked':True,'scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
Path(__file__).with_suffix('.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
```

Verifier SHA-256 `176700d2aab4cac7b3f2eebecb1c6a6275d094d0bcef5794c1770e6b8e6aac73`.

Save the following actual assembler comparator as `graph.py` in scratch and
run it from the repository root with the recovered original-packet.json as its
first argument. It writes only its JSON report to stdout:

```python
"""Read-only actual atlas assembly with the candidate injected as promotion inputs."""
from pathlib import Path
import sys,json,copy,collections
root=Path.cwd();sys.path.insert(0,str(root/'scripts'))
import build,blueprints,check_blueprint
rid='AnabelianGeometryAndNonabelianChabauty'
p=json.loads((root/'research/blueprint/packets'/f'{rid}.json').read_text())
r=next(x for x in json.loads((root/'data/atlas.json').read_text())['roadmaps'] if x['id']==rid)
a0=json.loads((root/'data/atlas.json').read_text())
packets,documents,definitions=blueprints.load_promoted(root)
packets=[x for x in packets if x[1].get('roadmapId')!=rid]+[(rid,p)]
documents[rid]=f'research/blueprint/readmes/{rid}.md'
definitions=[x for x in definitions if x['id']!=rid]
if not any(x['id']==rid for x in a0['roadmaps']):definitions.append(r)
build.load_promoted=lambda *args:(copy.deepcopy(packets),copy.deepcopy(documents),copy.deepcopy(definitions))
a,*rest=build.assemble(require_distances=False)
ctx=check_blueprint.world()
world={}
for folder in ['data/decompositions','data/blueprints','research/blueprint/packets']:
 for path in sorted((root/folder).glob('*.json')):
  q=json.loads(path.read_text())
  for n in q.get('nodes',[]):world.setdefault(n['id'],n)
world.update({n['id']:n for n in p['nodes']})
stages={s['id']:s for s in a['stages']}
stageids=set(stages)|set(ctx[1])
stageedges={(e['source'],e['target']) for e in a['stageEdges']}
virtual={v for e in stageedges for v in e}-set(stages)

def dag(vertices,edges):
 vertices=set(vertices)|{v for e in edges for v in e}
 out=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for s,t in edges:
  if t not in out[s]:out[s].add(t);indeg[t]+=1
 stack=[v for v,k in indeg.items() if k==0];count=0
 while stack:
  x=stack.pop();count+=1
  for y in out[x]:
   indeg[y]-=1
   if indeg[y]==0:stack.append(y)
 assert count==len(vertices),f'cycle: {[v for v,k in indeg.items() if k][:15]}'
 return {'vertices':len(vertices),'edges':len(edges),'acyclic':True}

own={n['id']:n for n in p['nodes']}
ownedges={(q,n['id']) for n in p['nodes'] for q in n.get('prerequisites',[]) if q in own}
stack=list(own);seen=set();dep=set();unresolved=set()
while stack:
 nid=stack.pop()
 if nid in seen:continue
 seen.add(nid)
 n=world[nid]
 for q in n.get('prerequisites',[]):
  if q.startswith(('mathlib:','tauceti:')) and q not in stageids and not q.startswith('tauceti:TauCetiRoadmap/'):continue
  dep.add((q,nid))
  if q in world:stack.append(q)
  elif q not in stageids:unresolved.add(q)
assert not unresolved,sorted(unresolved)
# Include actual recorded parent metadata and request edges, not synthetic realises attachments.
parents={(world[v]['parentStageId'],v) for v in seen
         if world[v].get('parentStageId') in stageids or world[v].get('parentStageId') in seen}
requests={(request['supplier'],consumer) for request in p.get('requests',[])
          for consumer in request.get('neededBy',[]) if consumer in own or consumer in stageids}
dep |= parents | requests
report={'stage':dag(stages,stageedges),'own':dag(own,ownedges),'combinedPrerequisites':dag(set(stages)|seen,stageedges|dep),'virtualSupplierEndpoints':len(virtual),'reachableDeclarations':len(seen),'unresolvedReferences':len(unresolved)}
roadmap=next(x for x in a['roadmaps'] if x['id']==rid)
assert roadmap['blueprint']['declarations']==len(own)
assert roadmap['blueprint']['planets']==11
assert not roadmap['blueprint']['skippedLinks'],roadmap['blueprint']['skippedLinks']
assert not roadmap.get('pendingLinks',[]),roadmap.get('pendingLinks',[])
report['actualBlueprint']={k:roadmap['blueprint'][k] for k in ['declarations','planets','kinds','skippedLinks']}
# The original packet is used as a second promotion input to check projection preservation.
p0=json.loads(sys.argv[1] and Path(sys.argv[1]).read_text()) if len(sys.argv)>1 else p
r0=copy.deepcopy(r)
basepackets=[x for x in packets if x[1].get('roadmapId')!=rid]+[(rid,p0)]
build.load_promoted=lambda *args:(copy.deepcopy(basepackets),copy.deepcopy(documents),copy.deepcopy(definitions))
b,*_=build.assemble(require_distances=False)
bedges={(e['source'],e['target']) for e in b['stageEdges']}
assert stageedges==bedges
report['stageEdgesUnchanged']=True
control={x['id']:(x.get('blueprint',{}).get('skippedLinks',[]),x.get('pendingLinks',[])) for x in a['roadmaps'] if x['id']!=rid}
control0={x['id']:(x.get('blueprint',{}).get('skippedLinks',[]),x.get('pendingLinks',[])) for x in b['roadmaps'] if x['id']!=rid}
assert control==control0
report['otherRoadmapSkippedPendingLinksUnchanged']=True
# Check all original in-roadmap dependencies and explicit request supplier paths.
stageout=collections.defaultdict(set)
for source,target in stageedges:stageout[source].add(target)
def reachable(source,target):
 todo=[source];done=set()
 while todo:
  x=todo.pop()
  if x==target:return True
  if x in done:continue
  done.add(x);todo.extend(stageout[x]-done)
 return False
pairs={(e['source'],e['target']) for e in a0['stageEdges'] if e['target'].startswith(rid+':')}
for node in p['nodes']:
 for q in node.get('prerequisites',[]):
  if q in stageids and q not in world and q != node['parentStageId']:pairs.add((q,node['parentStageId']))
for request in p.get('requests',[]):
 for consumer in request.get('neededBy',[]):
  if consumer in own:pairs.add((request['supplier'],own[consumer]['parentStageId']))
  elif consumer in stageids:pairs.add((request['supplier'],consumer))
assert all(reachable(source,target) for source,target in pairs),[(s,t) for s,t in pairs if not reachable(s,t)]
report['requiredStagePairs']=len(pairs)
report['requiredStagePairsReachable']=len(pairs)

# Exact old-object and metadata preservation, with one consumed bundled node refined.
on={n['id']:n for n in p0['nodes']}
for id,n in on.items():
 for k in ('id','kind','statement','hypotheses','sources','implementationStatus','acceptance','api','tests','uses'):
  expected=copy.deepcopy(n.get(k))
  if id==rid+':NC.3/functoriality' and k=='sources':expected[0]['locator']='§4 Comments II, printed p.25'
  assert own[id].get(k)==expected,(id,k)
 assert all(x in own[id].get('prerequisites',[]) for x in n.get('prerequisites',[]))
assert sum(own[id]==n for id,n in on.items())==111
assert len(own)==135 and len(on)==112
for k in p0:
 if k not in ('nodes','baseline','summary'):assert p[k]==p0[k],k
assert p['baseline']['declarations'][:len(p0['baseline']['declarations'])]==p0['baseline']['declarations']
assert all(n['implementationStatus']=='unchecked' for n in p['nodes'])
report.update(preservedStatementContracts=112,unchangedNodeObjects=111,addedNodes=23,
 apiTotal=sum(len(n.get('api',[])) for n in p['nodes']),testsTotal=sum(len(n.get('tests',[])) for n in p['nodes']),
 baseline=len(p['baseline']['declarations']),gaps=len(p['gaps']),requests=len(p['requests']))
report['scriptSha256']=__import__('hashlib').sha256(Path(__file__).read_bytes()).hexdigest()
print(json.dumps(report,ensure_ascii=False,indent=2))
```

Assembler SHA-256 `7b9951f82e26dbe1aa723f4bcd1fddb4adbce7cddaaa497ad4d35b4f113122e1`.
Run the indexed checker with the existing declaration index:
`python3 scripts/check_blueprint.py research/blueprint/packets/AnabelianGeometryAndNonabelianChabauty.json --index <declarations.tsv> --json`.

## Exact next work

Construct the genuine canonical additive cocycle comparison and its naturality
against Tau Ceti's additive finite-quotient transition and colimit maps. The
source and coefficient halves of abstract functoriality are now separately
specified; they do not supply a geometric/local-condition comparison. Continue
unipotent point topologies, representability, local unramified/crystalline
conditions and the source/supplier decompositions. Twisting and the remaining
inherited API granularity retain their recorded tasks. Preserve the discrete
boundary of the compact finite-quotient colimit, the all-degree coefficient
classes in K(π,1), every conjectural frontier and all Chen/BDMTV obligations.
