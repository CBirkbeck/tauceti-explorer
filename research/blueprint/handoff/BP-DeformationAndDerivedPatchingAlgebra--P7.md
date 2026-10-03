# Scalar restriction and intrinsic curve multiplicity checkpoint

Codex — codex-5ebb6f; Refs #551. Claim 5966565737 was confirmed by bot 5966566564. The entire issue was read before work; its claimed state and unchanged body were checked again before publication. This partial checkpoint preserves all 230 incoming node objects and adds 17 declarations (one construction, 16 lemmas), six promoted API items and 17 named tests. The packet has 247 nodes: eight definitions, 40 constructions, 183 lemmas and 16 theorems; 209 raw API items, 253 raw tests (185 required construction/definition tests), 336 cited baseline declarations, 13 planets, 15 gaps, two requests and eight partial stages. Every implementation status remains unchecked.

The new construction identifies the actual adic quotient carriers under scalar restriction using the identity on representatives. It needs neither flatness nor surjectivity. Surjectivity is added exactly at the scalar length comparison; infinite lengths are retained as extended naturals. In the finite local setting this gives equality of the already chosen general polynomials, intrinsic multiplicities and coefficient extractions with the same index. Both primary-ideal hypotheses remain explicit: the pinned radical-map formula has a kernel-containment premise, which is not silently removed.

The actual plane-curve polynomial is linked to the existing explicit polynomial d(T+1)−d(d−1)/2. Its intrinsic multiplicity is d, its positive-order degree is one, and its higher coefficient extractions vanish. For module C=R/(f) over ambient scalars R, intrinsic multiplicity is still d, but the degree-two extraction is zero. The latter is raw coefficient extraction: an ambient-dimension interpretation additionally needs dim R=2. Ordinary Noetherian/local/primary adapters are explicitly supplied, and the support-dimension consequence depends on the still open general degree theorem. No independent proof of that theorem or of the ambient power-series dimension upper bound is claimed.

Tests distinguish the identity representative, zeroth-power zero quotient, nonflat ℤ→𝔽₂ quotient, infinite length over ℤ, smooth/node/cusp examples, a nonreduced characteristic-two equation, order-three polynomial, zero/unit equations and the intrinsic/degree-two distinction. New tests and proposed bodies are uncompiled, not successful proof receipts. The characteristic-two nonreduced example has rational multiplicity 2; residue characteristic does not reduce length modulo 2.

Compilation was not attempted: the fresh resource guard found 5 GiB available, below the binding [WORKERS.md](../WORKERS.md) instruction, “With less than 20 GB available, do not compile”. The existing Mathlib build pin was confirmed as 082e2d37e8b0463410cdb532e111cd43d5a66174. No project, dependency build, update, cache fetch or language server was started. Canonical preserves the complete incoming admitted file as its exact prefix; NewProofDraft contains only the 17 proposed new proof bodies and depends on inherited declarations. The predecessor's canonical artifacts were personally recovered and hash-checked from the incoming public handoff. Its old 3,075-line native archive omits historical Rees/grading bodies and cannot certify this continuation. No historical peer log is presented as a new execution.

Fresh reading includes all nine reviewed DDPA audit rows and REV-AUDIT-17; eight scoped stage descriptions; the exact reserved key owner/id/catalog and six sample API requirements; accepted RS-08 own narrowed keeps, relevant links and owner entries; both current requests; the latest mathematical peer handoff and explicit curve polynomial contracts; and complete mathematical Stacks [00K4](https://stacks.math.columbia.edu/tag/00K4) and [0AZU](https://stacks.math.columbia.edu/tag/0AZU). Nested general Hilbert–Serre, dimension and Koszul references are not discharged. Pinned quotient/scalar-action/surjective-length and polynomial-coefficient statements were read with their hypotheses. The source record carries exact file/HTML hashes. Complete upstream Multiquadratic and SemisimpleAlgebras documents were read in bounded sections. Earlier whole campaign and routed-paper readings retain their historical attribution; this is not a fresh complete paper audit.

The indexed checker and actual intake functions pass with zero errors/warnings/refusals. The real assembler was run against immutable Git objects with the candidate overlaid, preserving the promoted R03.6 part and all foreign controls: 300 whole-roadmap declarations. Stage, own and combined graphs are acyclic; all declaration inputs resolve. All 65 accepted restructuring pairs are reachable. Twelve of thirteen required supplier pairs are reachable. The inherited LocalFieldsRamification layer-0 → R03.4 missing path equals the incoming control and remains explicitly recorded in its gap/request. It is not silently counted as closed.

Fresh-main reconciliation checked the four incoming deliverables and ten governing/read guards unchanged. Only the four issue deliverables are edited. The scripts below recover three hashed source artifacts, the incoming controls, four final overlays and four scripts from an immutable source-archive ancestor; they rerun the actual checker/intake/assembler against the recorded publication world without copying a repository snapshot. From an existing Atlas clone, run recover66.py with the immutable PR head and an owned on-disk scratch directory, then verify66.py with that directory and the pinned declaration index, and graph66.py with that directory. Set ROOT_ACTION_VALIDATE_BASE to the metadata publicationBase for the recorded graph counts. Recovery/verification never run Lean.

Resume by elaborating these signatures and tests when an existing pinned build has at least 20 GiB available, then checking the proposed scalar-comparison bodies. Implement the inherited Rees/grading bodies, general cumulative polynomial/degree input and ordinary formal-curve local/primary adapters; establish the ambient dimension separately before using its normalization. General Hilbert–Serre, Artin–Rees, completion/localization, associativity, the full reserved key and all routed papers remain required, as do both supplier requests and all eight scoped stages. All incoming gaps and ownership boundaries are intact.

```json
{
  "worker": "Codex — codex-5ebb6f",
  "issue": 551,
  "claim": 5966565737,
  "confirmation": 5966566564,
  "mathematicalBase": "4e056dc8f21b342e7c827de910e98ac42defb8b4",
  "publicationBase": "15c214e54cdc079a83242023a0d0093e7bf5aaa5",
  "sourceArchive": "79f9ad05e21173a15d629b1c8a183b71ad9e4078",
  "preservedWholeNodeObjects": 230,
  "newDeclarations": 17,
  "newApiItems": 6,
  "newTests": 17,
  "hashes": {
    "Canonical.lean": "03ec60add6d8b92b479be988154432d4752c62dabc62e5765721cc6ea9fcab02",
    "NewAdmitted.lean": "1233c93ce2c0f330c5f4c5ce598a2ffcc7c287c6042cf7adb6427442e0fe8a9c",
    "NewProofDraft.lean": "9b07520442b33b65bba24e57478ea6ee9338ec5b18745f47ee01a93b6afc686a"
  },
  "scriptHashes": {
    "recover66.py": "4289317d777c37eecb361fa0fec4016bfe3177ce66a23958ee093658409f02c9",
    "verify66.py": "e7f9f99d355dfb56316c34cbf501c34b7c425f155ee9628bfa1db1891d7ca9e1",
    "graph66.py": "45ba00cf05bf3263f0c43b337efc1b23723c42e9c480e8a755862ce842d5e3ac",
    "immutable_view.py": "23075f2a6c2ee890e93354b87bf81fce8baf87d62a2ee66b9996dcfdd6efe3b9"
  },
  "compileReceipt": {
    "time": "2026-10-03T07:58:15.612558+00:00",
    "availableGiB": 5,
    "preflight": "               total        used        free      shared  buff/cache   available\nMem:             125         120           0          16          21           5\nSwap:              0           0           0\n",
    "mathlib": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "started": false,
    "reason": "Below WORKERS 20 GiB guard; no compiler started."
  },
  "graph": {
    "stageDAG": {
      "vertices": 3003,
      "edges": 8623,
      "acyclic": true
    },
    "ownDAG": {
      "vertices": 247,
      "edges": 426,
      "acyclic": true
    },
    "combinedDAG": {
      "vertices": 3238,
      "edges": 9297,
      "acyclic": true
    },
    "reachableDeclarations": 248,
    "externalDeclarations": [
      "DeformationAndDerivedPatchingAlgebra:R03.3/depth-auslander-buchsbaum-and-dimension-bounds"
    ],
    "reachableBaselineReferences": 306,
    "unresolved": [],
    "otherPartsRetained": [
      "DeformationAndDerivedPatchingAlgebra--R03.6"
    ],
    "partDeclarations": 247,
    "partPlanets": 13,
    "roadmapDeclarations": 300,
    "requiredStagePairs": 13,
    "requiredStagePairsReachable": 12,
    "inheritedMissingStagePairs": [
      [
        "tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions",
        "DeformationAndDerivedPatchingAlgebra:R03.4"
      ]
    ],
    "acceptedRestructurePairs": 65,
    "acceptedRestructurePairsReachable": 65,
    "stageEdgesUnchanged": true,
    "otherSkippedPendingUnchanged": true,
    "ownSkippedPendingEmpty": true,
    "worldCommit": "15c214e54cdc079a83242023a0d0093e7bf5aaa5",
    "readPaths": 843,
    "foreignRoadmapsAndStagesUnchanged": true
  },
  "preservation": {
    "unchangedInputs": [
      "research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--P7.json",
      "research/blueprint/readmes/DeformationAndDerivedPatchingAlgebra--P7.md",
      "research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean",
      "research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md"
    ],
    "unchangedGoverning": [
      "research/blueprint/WORKERS.md",
      "research/blueprint/PROTOCOL.md",
      "research/blueprint/UPSTREAM_GUIDE.md",
      "research/expansion/PROTOCOL.md",
      "data/library-coverage.json",
      "research/blueprint/reviews/REV-AUDIT-17.md",
      "research/blueprint/reserved-ids.json",
      "research/blueprint/keydefs/owners.json",
      "data/keydefs/KEYDEF-algebraicgeometry.json",
      "research/blueprint/restructure/RS-08.result.json"
    ],
    "mathematicalBase": "4e056dc8f21b342e7c827de910e98ac42defb8b4",
    "publicationBase": "15c214e54cdc079a83242023a0d0093e7bf5aaa5"
  }
}
```

Portable recover66.py:

```python
from pathlib import Path
import hashlib,json,re,subprocess,sys
HEAD=sys.argv[1];S=Path(sys.argv[2]).resolve();S.mkdir(parents=True,exist_ok=True)
STEM='DeformationAndDerivedPatchingAlgebra--P7'
files=['research/blueprint/'+f+'/'+('BP-' if f=='handoff' else '')+STEM+'.'+e for f,e in [('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
def blob(commit,path):return subprocess.check_output(['git','show',commit+':'+path],text=True)
h=blob(HEAD,files[3]);meta=json.loads(re.search(r'```json\n(.*?)\n```',h,re.S).group(1))
archive=meta['sourceArchive'];base=meta['mathematicalBase'];pub=meta['publicationBase']
subprocess.run(['git','fetch','origin',archive,base,pub],check=True)
a=blob(archive,files[2]);canonical=a.split('\n/- SCALAR_CURVE_ARCHIVE\n',1)[0]
artifacts={'Canonical.lean':canonical}
for name in ['NewProofDraft.lean','NewAdmitted.lean']:
 artifacts[name]=a.split('BEGIN '+name+'\n',1)[1].split('END '+name+'\n',1)[0]
for name,text in artifacts.items():
 assert hashlib.sha256(text.encode()).hexdigest()==meta['hashes'][name],name
 (S/name).write_text(text)
for name,path in [('original-packets.json',files[0]),('original-readmes.md',files[1]),('original-suggested.lean',files[2]),('original-handoff.md',files[3])]:
 (S/name).write_text(blob(base,path))
(S/(STEM+'.json')).write_text(blob(HEAD,files[0]));(S/'Reader.md').write_text(blob(HEAD,files[1]))
(S/'base').write_text(base+'\n');(S/'publication-base.txt').write_text(pub+'\n')
scripts=re.findall(r'```python\n(.*?)\n```',h,re.S)
for name,text in zip(['recover66.py','verify66.py','graph66.py','immutable_view.py'],scripts[:4]):
 text+='\n';assert hashlib.sha256(text.encode()).hexdigest()==meta['scriptHashes'][name],name
 (S/name).write_text(text)
for path in files:
 target=S/'public'/path;target.parent.mkdir(parents=True,exist_ok=True);target.write_text(blob(HEAD,path))
(S/'recovery.json').write_text(json.dumps({'head':HEAD,'sourceArchive':archive,'mathematicalBase':base,'publicationBase':pub},indent=2)+'\n')
print(json.dumps({'recoveredSources':list(artifacts),'overlays':len(files),'scripts':4,'head':HEAD,'sourceArchive':archive},indent=2))
```

Portable verify66.py:

```python
from pathlib import Path
import ast, hashlib, json, os, re, subprocess, sys
S=Path(sys.argv[1]).resolve(); R=Path.cwd()
sys.path.insert(0,str(S)); import immutable_view
immutable_view.install()
BASE=immutable_view.BASE; STEM='DeformationAndDerivedPatchingAlgebra--P7'; NS='TauCeti.HilbertSamuel.'
files=['research/blueprint/'+f+'/'+('BP-' if f=='handoff' else '')+STEM+'.'+e for f,e in [('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
def current(path):
 public=S/'public'/path
 if public.exists():return public.read_text()
 with immutable_view.ORIGINAL['open'](R/path,encoding='utf-8') as handle:return handle.read()
old=json.loads((S/'original-packets.json').read_text())
p=json.loads((S/(STEM+'.json')).read_text())
assert len(old['nodes'])==230 and p['nodes'][:230]==old['nodes'] and len(p['nodes'])==247
for key in old:
 if key not in ['summary','nodes','sources','baseline']:assert p[key]==old[key],key
assert p['sources'][:-1]==old['sources']
assert p['baseline']['declarations'][:-6]==old['baseline']['declarations']
assert {k:v for k,v in p['baseline'].items() if k!='declarations'}=={k:v for k,v in old['baseline'].items() if k!='declarations'}
assert p['status']=='partial' and all(n['implementationStatus']=='unchecked' for n in p['nodes'])
full=(S/'Canonical.lean').read_text(); new=(S/'NewAdmitted.lean').read_text()
incoming=(S/'original-suggested.lean').read_text()
assert full==incoming+'\n'+new
assert len(re.findall(r'^(?:def|lemma) ',new,re.M))==17
assert len(re.findall(r'^example\b',new,re.M))==17
assert len(re.findall(r'\bsorry\b',new))==34
assert not re.search(r'\baxiom\b',new)
reader=(S/'Reader.md').read_text()
assert reader.endswith((S/'original-readmes.md').read_text())
tests=[]
for n in p['nodes'][230:]:
 assert n['declaration'] in reader and n['statement'] in reader
 assert re.search(r'^(?:def|lemma) '+re.escape(n['declaration'].removeprefix(NS))+r'\b',new,re.M)
 for a in n.get('api',[]):
  assert a['name'] in reader and a['statement'] in reader
  assert re.search(r'^(?:def|lemma) '+re.escape(a['name'].removeprefix(NS))+r'\b',new,re.M)
 for t in n.get('tests',[]):
  assert t['statement'] in reader and '-- test: '+t['name'] in new
  tests.append(t['name'])
assert len(tests)==len(set(tests))==17
# Actual recorded-world intake/checker code, read directly from immutable Git objects.
tree=ast.parse((R/'research/blueprint/intake.py').read_text())
names={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id in {'ALLOWED','PRIVATE'} for t in n.targets) or isinstance(n,ast.FunctionDef) and n.name in names]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake', 'exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs'] if j['id']=='BP-'+STEM)
problems=[x for path in files for x in env['file_problems'](path,current(path))]
refusals=env['auto_refusals'](job,files,False,{'codex-5ebb6f'},set())
assert not problems and not refusals,(problems,refusals)
assert json.loads(current(files[0]))==p
assert current(files[1])==reader
assert current(files[2]).startswith(full)
assert current(files[3]).endswith((S/'original-handoff.md').read_text())
for path in files:
 data=current(path)
 assert not re.search(r'[ \t]+$',data,re.M),path
 assert not re.search(r'/(?:home|Users)/[^/\s]+/',data),path
replay=S/'recovery.json'
head=json.loads(replay.read_text())['head'] if replay.exists() else None
pub=(S/'publication-base.txt').read_text().strip()
cmd=['git','diff','--name-only',pub]+([head] if head else [])
changed=set(subprocess.check_output(cmd,text=True).splitlines())
assert changed<=set(files),changed
import check_blueprint
errors,warnings,summary=check_blueprint.check(S/(STEM+'.json'),check_blueprint.load_index(Path(sys.argv[2])),check_blueprint.world())
assert not errors and not warnings,(errors,warnings)
summary['packet']=files[0]
report=dict(worldCommit=BASE,preservedWholeNodeObjects=230,newDeclarations=17,newTests=17,newApiItems=6,
 rawApiItems=sum(len(n.get('api',[])) for n in p['nodes']),rawTests=sum(len(n.get('tests',[])) for n in p['nodes']),
 checker=summary,intakeProblems=problems,intakeRefusals=refusals,
 lean=dict(compiled=False,reason='Resource guard below 20 GiB; no Lean process started. New admitted signatures, tests and proposed proof bodies remain uncompiled.'),
 hashes={name:hashlib.sha256((S/name).read_bytes()).hexdigest() for name in ['Canonical.lean','NewAdmitted.lean','NewProofDraft.lean']})
print(json.dumps(report,ensure_ascii=False,indent=2))
```

Portable graph66.py:

```python
from pathlib import Path
import sys,json,copy,collections
S=Path(sys.argv[1]).resolve()
sys.path.insert(0,str(S))
import immutable_view
immutable_view.install()
sys.path.insert(0,str(Path.cwd()/'scripts'))
import build,blueprints,check_blueprint
RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7'
p=json.loads((S/f'{STEM}.json').read_text())
original=json.loads((S/'original-packets.json').read_text())
new={n['id']:n for n in p['nodes']}
root=Path.cwd()
a0=json.loads((root/"data/atlas.json").read_text())
packets,documents,definitions=blueprints.load_promoted(root)
otherparts=[(stem,q) for stem,q in packets if q.get("roadmapId")==RID and stem!=STEM]
assert otherparts, "must preserve other promoted roadmap parts"
keep=[x for x in packets if x[0]!=STEM]
documents[STEM]="research/blueprint/readmes/"+STEM+".md"
def assemble(candidate):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(STEM,candidate)]),copy.deepcopy(documents),copy.deepcopy(definitions))
 return build.assemble(require_distances=False)[0]
a=assemble(p);b=assemble(original)
world={}
for folder in ["data/decompositions","data/blueprints","research/blueprint/packets"]:
 for path in sorted((root/folder).glob("*.json")):
  q=json.loads(path.read_text())
  for n in q.get("nodes",[]):world.setdefault(n["id"],n)
world.update(new)
stages={x["id"]:x for x in a["stages"]}
stageids=set(stages)|set(check_blueprint.world()[1])
stageedges={(e["source"],e["target"]) for e in a["stageEdges"]}
def dag(vertices,edges):
 vertices=set(vertices)|{v for edge in edges for v in edge}
 out=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for source,target in edges:
  if target not in out[source]:out[source].add(target);indeg[target]+=1
 stack=[v for v,count in indeg.items() if count==0];count=0
 while stack:
  v=stack.pop();count+=1
  for w in out[v]:
   indeg[w]-=1
   if indeg[w]==0:stack.append(w)
 assert count==len(vertices),[v for v,count in indeg.items() if count][:15]
 return {"vertices":len(vertices),"edges":len(edges),"acyclic":True}
ownedges={(q,nid) for nid,node in new.items() for q in node.get("prerequisites",[]) if q in new}
stack=list(new);seen=set();dep=set();unresolved=set();baseref=set()
while stack:
 nid=stack.pop()
 if nid in seen:continue
 seen.add(nid)
 for q in world[nid].get("prerequisites",[]):
  if q.startswith(("mathlib:","tauceti:")) and q not in stageids:baseref.add(q);continue
  dep.add((q,nid))
  if q in world:stack.append(q)
  elif q not in stageids:unresolved.add(q)
assert not unresolved,sorted(unresolved)
dep|={(world[nid]["parentStageId"],nid) for nid in seen if world[nid].get("parentStageId") in stageids or world[nid].get("parentStageId") in world}
dep|={(request["supplier"],consumer) for request in p.get("requests",[]) for consumer in request.get("neededBy",[]) if consumer in new or consumer in stageids}
roadmap=next(r for r in a["roadmaps"] if r["id"]==RID)
expected_decl=len(new)+sum(len(q["nodes"]) for _,q in otherparts)
assert roadmap["blueprint"]["declarations"]==expected_decl,(roadmap["blueprint"],expected_decl)
assert not roadmap["blueprint"]["skippedLinks"] and not roadmap.get("pendingLinks",[])
assert stageedges=={(e["source"],e["target"]) for e in b["stageEdges"]}
def skips(atlas):
 return {r["id"]:(r.get("blueprint",{}).get("skippedLinks",[]),r.get("pendingLinks",[])) for r in atlas["roadmaps"] if r["id"]!=RID}
assert skips(a)==skips(b)
assert {r['id']:r for r in a['roadmaps'] if r['id']!=RID}=={r['id']:r for r in b['roadmaps'] if r['id']!=RID}
assert {r['id']:r for r in a['stages'] if not r['id'].startswith(RID+':')}=={r['id']:r for r in b['stages'] if not r['id'].startswith(RID+':')}
out=collections.defaultdict(set)
for source,target in stageedges:out[source].add(target)
def reachable(source,target):
 stack=[source];seen=set()
 while stack:
  v=stack.pop()
  if v==target:return True
  if v in seen:continue
  seen.add(v);stack.extend(out[v]-seen)
 return False
pairs={(e["source"],e["target"]) for e in a0["stageEdges"] if e["target"].startswith(RID+":")}
for node in p["nodes"]:
 for q in node.get("prerequisites",[]):
  if q in stageids and q not in world and q!=node["parentStageId"]:pairs.add((q,node["parentStageId"]))
for req in p.get("requests",[]):
 for consumer in req.get("neededBy",[]):
  if consumer in new:pairs.add((req["supplier"],new[consumer]["parentStageId"]))
  elif consumer in stageids:pairs.add((req["supplier"],consumer))
missingpairs={(s,t) for s,t in pairs if not reachable(s,t)}
oldout=collections.defaultdict(set)
for edge in b['stageEdges']:oldout[edge['source']].add(edge['target'])
def reachable0(source,target):
 stack=[source];seen=set()
 while stack:
  v=stack.pop()
  if v==target:return True
  if v in seen:continue
  seen.add(v);stack.extend(oldout[v]-seen)
 return False
assert missingpairs=={(s,t) for s,t in pairs if not reachable0(s,t)}
assert missingpairs=={('tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions',RID+':R03.4')}
assert any('LocalFieldsRamification layer 0 to R03.4' in gap['detail'] for gap in p['gaps'])
# Independently retain all accepted restructure links touching the whole roadmap.
acceptedpairs=set()
for path in (root/"research/blueprint/restructure").glob("*.result.json"):
 q=json.loads(path.read_text())
 if q.get("review",{}).get("status")!="accepted":continue
 for row in q.get("links",[]):
  if any(row.get(k,"").startswith(RID+":") for k in ["source","target"]):
   acceptedpairs.add((row["source"],row["target"]))
assert all(reachable(s,t) for s,t in acceptedpairs),[(s,t) for s,t in acceptedpairs if not reachable(s,t)]
report={"stageDAG":dag(stages,stageedges),"ownDAG":dag(new,ownedges),
 "combinedDAG":dag(set(stages)|seen,stageedges|dep),"reachableDeclarations":len(seen),
 "externalDeclarations":sorted(seen-set(new)),"reachableBaselineReferences":len(baseref),
 "unresolved":sorted(unresolved),"otherPartsRetained":[stem for stem,_ in otherparts],
 "partDeclarations":len(new),"partPlanets":sum("planet" in n for n in p["nodes"]),
 "roadmapDeclarations":roadmap["blueprint"]["declarations"],
 "requiredStagePairs":len(pairs),"requiredStagePairsReachable":len(pairs)-len(missingpairs),
 "inheritedMissingStagePairs":sorted(missingpairs),
 "acceptedRestructurePairs":len(acceptedpairs),"acceptedRestructurePairsReachable":len(acceptedpairs),
 "stageEdgesUnchanged":True,"otherSkippedPendingUnchanged":True,"ownSkippedPendingEmpty":True}
report['worldCommit']=immutable_view.BASE
report['readPaths']=len(immutable_view.READS)
report['foreignRoadmapsAndStagesUnchanged']=True
print(json.dumps(report,ensure_ascii=False,indent=2),flush=True)
```

Portable immutable_view.py:

```python
"""Read the immutable audit tree without creating a repository snapshot."""
import fnmatch
import importlib.abc
import importlib.util
import io
from pathlib import Path
import subprocess
import sys

import os
REPO = Path(os.environ.get('TAUCETI_REPO', str(Path.cwd())))
BASE = os.environ.get('ROOT_ACTION_VALIDATE_BASE', '4e056dc8f21b342e7c827de910e98ac42defb8b4')
TRACKED = set(subprocess.check_output(['git', 'ls-tree', '-r', '--name-only', BASE], cwd=REPO, text=True).splitlines())
CACHE = {}
READS = set()
ORIGINAL = {name: getattr(Path, name) for name in ('read_text', 'read_bytes', 'exists', 'is_file', 'is_dir', 'glob', 'rglob', 'open', 'write_text', 'write_bytes')}

def relative(path):
    try:
        return str(path.resolve().relative_to(REPO.resolve()))
    except ValueError:
        return None

def blob(key):
    if key not in TRACKED:
        raise FileNotFoundError(key)
    READS.add(key)
    if key not in CACHE:
        CACHE[key] = subprocess.check_output(['git', 'show', BASE + ':' + key], cwd=REPO)
    return CACHE[key]

def read_text(path, encoding=None, errors=None):
    key = relative(path)
    if key is None:
        return ORIGINAL['read_text'](path, encoding=encoding, errors=errors)
    return blob(key).decode(encoding or 'utf-8', errors or 'strict')

def read_bytes(path):
    key = relative(path)
    return ORIGINAL['read_bytes'](path) if key is None else blob(key)

def is_file(path):
    key = relative(path)
    return ORIGINAL['is_file'](path) if key is None else key in TRACKED

def is_dir(path):
    key = relative(path)
    return ORIGINAL['is_dir'](path) if key is None else any(s.startswith(key.rstrip('/') + '/') for s in TRACKED) or key == '.'

def exists(path):
    key = relative(path)
    return ORIGINAL['exists'](path) if key is None else is_file(path) or is_dir(path)

def glob(path, pattern, recursive=False):
    key = relative(path)
    if key is None:
        yield from ORIGINAL['rglob' if recursive else 'glob'](path, pattern)
        return
    prefix = '' if key == '.' else key.rstrip('/') + '/'
    for candidate in sorted(TRACKED):
        if not candidate.startswith(prefix):
            continue
        tail = candidate[len(prefix):]
        if fnmatch.fnmatch(tail, pattern) and (recursive or '/' not in tail):
            yield REPO / candidate

def open_path(path, mode='r', buffering=-1, encoding=None, errors=None, newline=None):
    key = relative(path)
    if key is None:
        return ORIGINAL['open'](path, mode, buffering, encoding, errors, newline)
    if mode not in ('r', 'rb'):
        raise PermissionError('audit tree is read-only')
    return io.BytesIO(blob(key)) if mode == 'rb' else io.StringIO(blob(key).decode(encoding or 'utf-8', errors or 'strict'))

def write_text(path, *args, **kwargs):
    if relative(path) is not None:
        raise PermissionError('audit tree is read-only')
    return ORIGINAL['write_text'](path, *args, **kwargs)

def write_bytes(path, *args, **kwargs):
    if relative(path) is not None:
        raise PermissionError('audit tree is read-only')
    return ORIGINAL['write_bytes'](path, *args, **kwargs)

class Loader(importlib.abc.Loader):
    def __init__(self, key):
        self.key = key
    def create_module(self, spec):
        return None
    def exec_module(self, module):
        module.__file__ = str(REPO / self.key)
        exec(compile(blob(self.key), module.__file__, 'exec'), module.__dict__)

class Finder(importlib.abc.MetaPathFinder):
    def find_spec(self, fullname, path=None, target=None):
        key = 'scripts/' + fullname + '.py'
        if '.' not in fullname and key in TRACKED:
            return importlib.util.spec_from_loader(fullname, Loader(key))

def install():
    for name, function in [('read_text', read_text), ('read_bytes', read_bytes), ('exists', exists), ('is_file', is_file), ('is_dir', is_dir), ('glob', glob), ('rglob', lambda path, pattern: glob(path, pattern, True)), ('open', open_path), ('write_text', write_text), ('write_bytes', write_bytes)]:
        setattr(Path, name, function)
    sys.meta_path.insert(0, Finder())
```

## Incoming handoff and attribution

# Full curve tangent-cone assembly checkpoint

Codex — codex-7e92bd; Refs #551. Claim 5966266362 was confirmed by bot 5966267379. The full 55,002-character issue was read before and after confirmation; its body and claimed label were checked again before publication. This is a substantive partial blueprint checkpoint, with no closed stage or claimed implementation.

Twenty new declarations assemble the existing homogeneous/native degree comparison into the actual Rees quotient. They specify the homogeneous map, literal Rees representative, native-piece agreement, unit/product laws, the full polynomial algebra map, generator/coefficient formulas, surjectivity, projection compatibility, degree separation, initial relation, full principal kernel, quotient algebra equivalence and exact component-image equality. Three constructions have 16 API items and 13 named tests. All 210 incoming node objects are preserved verbatim; the final packet has 230 nodes, 203 API entries, 236 raw tests (182 required definition/construction test entries), 330 baseline declarations, 13 planets, 15 gaps, two requests and eight partial stages.

The map and surjectivity work with finite variables over arbitrary commutative coefficients. The full principal kernel and quotient equivalence retain NoZeroDivisors and exact finite order. The authored Z/4Z test f=2+X has initial form 2 but an extra X² kernel relation: in the actual quotient X=−2 and X²=0, while the polynomial X² is not divisible by 2. Over the domain ℤ, f=2+X instead illustrates a valid order-zero nonunit equation, with graded polynomial quotient ℤ[X]/(2). Other tests cover zero/unit equations, no variables, zero coefficients, mixed-degree products, inverse/representative formulas and characteristic-two nonreduced X². This is a hypothesis test, not a new published-source erratum.

The reader gives the full mathematical finite-sum kernel argument. The source quotient's degree-n component is specified by the image of Mathlib's native homogeneous submodule. Its image under the equivalence is exactly the existing adicRingComponents q n, so grading and degree-one generators are explicit. The target remains the existing Rees(q)/(q·Rees(q)); it is not defined by the theorem's claimed polynomial quotient.

**Compilation boundary:** the new final suggested file has not been elaborated. The actual resource guard found 14 GiB available at 06:44:11 UTC, below the binding [WORKERS.md](../WORKERS.md) instruction, “With less than 20 GB available, do not compile”. No Lean process started for this job. The exact existing Mathlib build pin was checked, but no project, dependency build, update, cache fetch or language server was started. New bodies are admitted prototypes; there are no new admission-free implementation claims. The complete incoming canonical file is retained as a byte-identical prefix. The predecessor's 3,075-line native proof was personally recovered and hash-checked from archive e7e248a990b6db47bcf6e10438a6e29c02d9d565 (SHA256 40bfb9d5be77ef425971e5c9e633ebc4b0e5f75e3c0e3eb61c387db2a0ccd8cf), but not recompiled. That native archive omits the historical Rees/graded-ring proof bodies; it cannot certify the new assembly. The complete incoming reader and handoff are appended with their original attribution.

Primary reading this claim: complete mathematical §§2–5 of the immutable credited [DDPA jet argument](https://github.com/CBirkbeck/tauceti-explorer/blob/eb645dc85df65608c56fafc4d9ed0e71ab0ca3ce/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md), hash d6bb818403e28967bc241c039a37fc503492d926159c6fcf89c8317ac7119f3c; complete mathematical [Stacks 00K4](https://stacks.math.columbia.edu/tag/00K4), retrieved HTML hash e3d86d2fc7e6a9df48e73e4e8d12629cdb08f9e0fb9d15e35472d7bc21629932. The new source record identifies the exact pinned DirectSum.toAlgebra, native graded decomposition, polynomial homogeneous, algebra quotient and scalar-tower statements read, with file hashes. Tau Ceti's pinned ascending word-filtration AssociatedGraded carrier was inspected and distinguished from the descending q-adic Rees model; no generic existing construction is duplicated.

Bounded current prior-art searches included homogeneous Rees open Mathlib PRs, PR27307 metadata/body/changed files (OPEN at 0127706ca379b684697f3c95c8cc772537a21774), and indexed Zulip searches. The unpinned homogeneous-relation implementation is not imported. No exhaustive library or discussion absence is claimed. Historical general-paper source readings retain their original attribution and limits. The nine reviewed DDPA audit rows, accepted review, whole campaign reader, eight stage objects, reserved key/catalog, accepted RS-08 and governing documents were personally read earlier in this continuous worker session and checked unchanged against that recorded read base. Current requests and the latest degree-comparison contracts were freshly read. Two upstream-style exemplars were read earlier in the same loop.

The indexed checker reports zero errors/warnings. Source preservation checks and the actual four-file intake functions pass. The actual assembler preserves the promoted R03.6 part: 283 whole-roadmap declarations. The stage, own and combined graphs are acyclic; all declaration inputs resolve. All 65 accepted restructure pairs are reachable. Twelve of thirteen required stage pairs are reachable: the existing LocalFieldsRamification layer-0 → R03.4 missing path is unchanged in the incoming control and remains an explicit gap/request. Other roadmaps' skipped/pending entries equal the control; this roadmap has none. No claim of complete supplier reachability is made.

Fresh-main reconciliation preserved the four issue inputs and the governing/read-base guards. Only the four allowed deliverables change. Source pins remain Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The suggested file imports Mathlib modules only; no compilation of another Tau Ceti checkout is claimed.

Resume by checking the new admitted signatures when a compliant existing build has sufficient memory, then implement the inherited Rees coefficient-ideal characterization, degree inclusion injectivity, direct-sum decomposition and grading together with these assembly bodies. Retain the finite-support kernel witness and the two coefficient-ring boundaries. Then address actual curve/support dimension, the general cumulative-polynomial specification and intrinsic/ambient multiplicity comparisons. General Hilbert–Serre, Artin–Rees, completion, localization, associativity, the full reserved key, all routed papers and all eight stages remain open. In particular preserve the existing distinction between unmixedness and minimal-prime formal equidimensionality. No ownership or supplier boundary is changed.

The metadata and four portable scripts below recover the public canonical/admitted source artifacts, verify exact incoming preservation and run the actual checker/intake/assembler. Run recover.py with the immutable PR head and an owned on-disk directory from the existing Atlas clone; then verify.py with that directory and the pinned declaration index, and graph.py with its original-packet.json. For exact world counts use the publication context; later worlds are explicitly identified in verification and compared against their own incoming control. Recovery and verification do not run Lean. compile.py is optional and enforces the exact Mathlib pin, the memory threshold and a 20-minute timeout in an already existing build. A source-only replay cannot turn the historical peer logs into a new execution.

```json
{
  "worker": "Codex — codex-7e92bd",
  "issue": 551,
  "claim": 5966266362,
  "confirmation": 5966267379,
  "mathematicalBase": "ff86552a93ce2493a792da280518a4b271523ac9",
  "publicationBase": "35c15841cfa2bfef146c15f0daad3db6094d34c4",
  "preservedWholeNodeObjects": 210,
  "newDeclarations": 20,
  "newApiItems": 16,
  "newTests": 13,
  "hashes": {
    "Canonical.lean": "613c62369795045f8671a6c348a951c1e7630fd9a4f9247a0edb214a70320eea",
    "IncomingCanonical.lean": "02c4e71eb60c7d244ecd4e8821193f77062715baead76f791556c110a36f9e2a",
    "NewAdmitted.lean": "a3d4b8a0e112fa17188b46963031fc98079e97619481efb2274a5c32f90682da"
  },
  "scriptHashes": {
    "recover.py": "efc73015493b6cd7d0326f099112273b95c8fd3febefb952be40afb5f0639ab5",
    "verify.py": "5ef71dbfe0047583fc6ff57c026ac0276bc0c96f1d0b9b9cfe870f010173edf6",
    "graph.py": "2ab5184487d1061bb9dde1ddb2b3f823e7ae4b9729eef348f694649fa0820292",
    "compile.py": "248eb8aa26b982ccc717d72043e1fe86a553b1732e569bcb33bbdc001450b63b"
  },
  "compileReceipt": {
    "time": "2026-10-03T06:44:11.441939+00:00",
    "mathlib": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "sha256": "613c62369795045f8671a6c348a951c1e7630fd9a4f9247a0edb214a70320eea",
    "preflight": "               total        used        free      shared  buff/cache   available\nMem:             125         110           1          16          31          14\nSwap:              0           0           0\n",
    "availableGiB": 14,
    "started": false,
    "reason": "WORKERS requires at least 20 GiB available; no Lean process started."
  },
  "graph": {
    "stageDAG": {
      "vertices": 3003,
      "edges": 8623,
      "acyclic": true
    },
    "ownDAG": {
      "vertices": 230,
      "edges": 392,
      "acyclic": true
    },
    "combinedDAG": {
      "vertices": 3221,
      "edges": 9246,
      "acyclic": true
    },
    "reachableDeclarations": 231,
    "externalDeclarations": [
      "DeformationAndDerivedPatchingAlgebra:R03.3/depth-auslander-buchsbaum-and-dimension-bounds"
    ],
    "reachableBaselineReferences": 300,
    "unresolved": [],
    "otherPartsRetained": [
      "DeformationAndDerivedPatchingAlgebra--R03.6"
    ],
    "partDeclarations": 230,
    "partPlanets": 13,
    "roadmapDeclarations": 283,
    "requiredStagePairs": 13,
    "requiredStagePairsReachable": 12,
    "inheritedMissingStagePairs": [
      [
        "tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions",
        "DeformationAndDerivedPatchingAlgebra:R03.4"
      ]
    ],
    "acceptedRestructurePairs": 65,
    "acceptedRestructurePairsReachable": 65,
    "stageEdgesUnchanged": true,
    "otherSkippedPendingUnchanged": true,
    "ownSkippedPendingEmpty": true
  },
  "artifacts": {
    "nodes": [
      "DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-representative-membership",
      "DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-map",
      "DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-representative",
      "DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-piece",
      "DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-one",
      "DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-product",
      "DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-map",
      "DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-homogeneous",
      "DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-generator",
      "DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-coefficient",
      "DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-surjective",
      "DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-projection",
      "DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-vanishing",
      "DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-vanishing",
      "DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-initial-relation",
      "DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-principal-kernel",
      "DeformationAndDerivedPatchingAlgebra:R03.3/curve-tangent-cone-equivalence",
      "DeformationAndDerivedPatchingAlgebra:R03.3/curve-tangent-cone-representative",
      "DeformationAndDerivedPatchingAlgebra:R03.3/curve-tangent-cone-homogeneous",
      "DeformationAndDerivedPatchingAlgebra:R03.3/curve-tangent-cone-components"
    ],
    "declarations": [
      "homogeneousCurveRepresentative_mem",
      "curveHomogeneousToGraded",
      "curveHomogeneousToGraded_apply",
      "curveHomogeneousToGraded_piece",
      "curveHomogeneousToGraded_one",
      "curveHomogeneousToGraded_mul",
      "curveGradedMap",
      "curveGradedMap_homogeneous",
      "curveGradedMap_X",
      "curveGradedMap_C",
      "curveGradedMap_surjective",
      "curveGradedMap_projection",
      "curveGradedMap_eq_zero_iff",
      "curveHomogeneousToGraded_eq_zero",
      "curveGradedMap_initial",
      "curveGradedMap_ker",
      "curveTangentConeEquiv",
      "curveTangentConeEquiv_mk",
      "curveTangentConeEquiv_homogeneous",
      "curveTangentConeEquiv_component"
    ],
    "tests": [
      "zero_equation_injective",
      "unit_equation",
      "native_representative",
      "degree_zero_unit",
      "mixed_degree_product",
      "characteristic_two_repeated_equation",
      "nilpotent_coefficients_extra_relation",
      "order_zero_nonunit",
      "no_variables",
      "quotient_generator",
      "quotient_constant",
      "quotient_inverse",
      "zero_coefficients"
    ],
    "baselineAdded": [
      "mathlib:DirectSum.toAlgebra",
      "mathlib:DirectSum.decomposeAlgEquiv",
      "mathlib:MvPolynomial.gradedAlgebra",
      "mathlib:MvPolynomial.isHomogeneous_one",
      "mathlib:MvPolynomial.isHomogeneous_X",
      "mathlib:MvPolynomial.homogeneousComponent_mem",
      "mathlib:MvPolynomial.sum_homogeneousComponent"
    ]
  },
  "validation": {
    "preservedWholeNodeObjects": 210,
    "newDeclarations": 20,
    "newTests": 13,
    "newApiItems": 16,
    "rawApiItems": 203,
    "rawTests": 236,
    "checker": {
      "packet": "research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--P7.json",
      "roadmap": "DeformationAndDerivedPatchingAlgebra",
      "status": "partial",
      "nodes": 230,
      "kinds": {
        "lemma": 167,
        "theorem": 16,
        "definition": 8,
        "construction": 39
      },
      "apiItems": 203,
      "unitTests": 182,
      "planets": 13,
      "baselineDeclarations": 330,
      "prerequisites": {
        "baseline": 456,
        "node (this packet)": 392,
        "node (integrated)": 1
      },
      "gaps": 15,
      "requests": 2,
      "stagesInScope": 8,
      "stagesClosed": 0
    },
    "intakeProblems": [],
    "intakeRefusals": [],
    "lean": {
      "compiled": false,
      "reason": "No local successful Lean log supplied; admitted source validation only."
    },
    "hashes": {
      "Canonical.lean": "613c62369795045f8671a6c348a951c1e7630fd9a4f9247a0edb214a70320eea",
      "IncomingCanonical.lean": "02c4e71eb60c7d244ecd4e8821193f77062715baead76f791556c110a36f9e2a",
      "NewAdmitted.lean": "a3d4b8a0e112fa17188b46963031fc98079e97619481efb2274a5c32f90682da"
    },
    "worldCommit": "35c15841cfa2bfef146c15f0daad3db6094d34c4",
    "sourceValidation": "All new declaration/API/test names and statements matched; incoming node objects, key/requests/stages and canonical/reader/handoff prefixes or suffixes preserved."
  }
}
```

### Portable recover.py

```python
from pathlib import Path
from urllib.request import urlopen
import hashlib,json,sys,subprocess
head=sys.argv[1];S=Path(sys.argv[2]);S.mkdir(parents=True,exist_ok=True)
STEM='DeformationAndDerivedPatchingAlgebra--P7'
files=['research/blueprint/'+folder+'/'+('BP-' if folder=='handoff' else '')+STEM+'.'+ext for folder,ext in [('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
def read(ref,path):
 return urlopen('https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'+ref+'/'+path,timeout=60).read().decode()
public={path:read(head,path) for path in files}
handoff=public[files[3]]
meta=json.loads(handoff.split('```json\n',1)[1].split('\n```\n',1)[0])
for path,data in public.items():
 target=S/'public'/path;target.parent.mkdir(parents=True,exist_ok=True);target.write_text(data)
incoming=read(meta['mathematicalBase'],files[2]);full=public[files[2]]
assert full.startswith(incoming)
artifacts={'Canonical.lean':full,'IncomingCanonical.lean':incoming,'NewAdmitted.lean':full[len(incoming):]}
for name,data in artifacts.items():
 assert hashlib.sha256(data.encode()).hexdigest()==meta['hashes'][name],name
 (S/name).write_text(data)
(S/'original-packet.json').write_text(read(meta['mathematicalBase'],files[0]))
(S/'base.txt').write_text(meta['mathematicalBase']+'\n')
(S/'publication-base.txt').write_text(meta['publicationBase']+'\n')
for name in ['recover.py','verify.py','graph.py','compile.py']:
 marker='### Portable '+name+'\n\n```python\n'
 data=handoff.split(marker,1)[1].split('\n```\n',1)[0]+'\n'
 assert hashlib.sha256(data.encode()).hexdigest()==meta['scriptHashes'][name],name
 (S/name).write_text(data)
# Existing clone only: fetch the two immutable receipts, never create a project or clone.
for ref in {meta['mathematicalBase'],meta['publicationBase']}:
 subprocess.run(['git','fetch','origin',ref],check=True,stdout=subprocess.DEVNULL)
print(json.dumps(dict(head=head,hashes=meta['hashes'],lean='No compiler was run by recovery.'),indent=2))
```

### Portable verify.py

```python
from pathlib import Path
import ast,hashlib,json,re,subprocess,sys
R=Path.cwd();S=Path(sys.argv[1]);STEM='DeformationAndDerivedPatchingAlgebra--P7';NS='TauCeti.HilbertSamuel.'
files=['research/blueprint/'+folder+'/'+('BP-' if folder=='handoff' else '')+STEM+'.'+ext for folder,ext in [('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
p=json.loads((R/files[0]).read_text());old=json.loads((S/'original-packet.json').read_text())
assert len(old['nodes'])==210 and len(p['nodes'])==230 and p['nodes'][:210]==old['nodes']
for key in old:
 if key not in ['summary','nodes','sources','baseline','coverage','gaps']:assert p[key]==old[key],key
assert p['sources'][:-1]==old['sources']
assert p['baseline']['declarations'][:323]==old['baseline']['declarations']
assert {k:v for k,v in p['baseline'].items() if k!='declarations'}=={k:v for k,v in old['baseline'].items() if k!='declarations'}
assert p['gaps'][:-1]==old['gaps'][:-1]
assert {k:v for k,v in p['gaps'][-1].items() if k!='fullGradedAssemblyContinuation'}==old['gaps'][-1]
for a,b in zip(p['coverage'],old['coverage']):
 if a['stageId'].endswith(':R03.3'):
  assert a['remaining'][:-1]==b['remaining'] and {k:v for k,v in a.items() if k!='remaining'}=={k:v for k,v in b.items() if k!='remaining'}
 else:assert a==b
assert p['status']=='partial' and all(n['implementationStatus']=='unchecked' for n in p['nodes'])
base=(S/'base.txt').read_text().strip()
def blob(path):return subprocess.check_output(['git','show',base+':'+path],text=True)
full=(R/files[2]).read_text();reader=(R/files[1]).read_text();handoff=(R/files[3]).read_text()
assert full.startswith(blob(files[2])) and reader.endswith(blob(files[1])) and handoff.endswith(blob(files[3]))
new=full[len(blob(files[2])):]
assert new==(S/'NewAdmitted.lean').read_text() and full==(S/'Canonical.lean').read_text()
assert blob(files[2])==(S/'IncomingCanonical.lean').read_text()
assert len(re.findall(r'^(?:def|lemma) ',new,re.M))==20
assert len(re.findall(r'^example\b',new,re.M))==13
assert len(re.findall(r'\bsorry\b',new))==33
assert not re.search(r'\baxiom\b',new)
alltests=[]
for n in p['nodes'][210:]:
 assert n['declaration'] in reader and n['statement'] in reader
 assert re.search(r'^(?:def|lemma) '+re.escape(n['declaration'].removeprefix(NS))+r'\b',new,re.M)
 for a in n.get('api',[]):
  assert a['name'] in reader and a['statement'] in reader
  assert re.search(r'^(?:def|lemma) '+re.escape(a['name'].removeprefix(NS))+r'\b',new,re.M)
 for t in n.get('tests',[]):
  assert t['statement'] in reader and '-- test: '+t['name'] in new
  alltests.append(t['name'])
assert len(alltests)==len(set(alltests))==13
# The actual intake functions are loaded, not reimplemented.
tree=ast.parse((R/'research/blueprint/intake.py').read_text());names={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id in {'ALLOWED','PRIVATE'} for t in n.targets) or isinstance(n,ast.FunctionDef) and n.name in names]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs'] if j['id']=='BP-'+STEM)
problems=[x for path in files for x in env['file_problems'](path,(R/path).read_text())]
refusals=env['auto_refusals'](job,files,False,{'codex-7e92bd'},set());assert not problems and not refusals,(problems,refusals)
for path in files:
 data=(R/path).read_text();assert not re.search(r'[ \t]+$',data,re.M),path
 assert not re.search(r'/(?:home|Users)/[^/\s]+/',data),path
pub=(S/'publication-base.txt').read_text().strip()
changed=set(subprocess.check_output(['git','diff','--name-only',pub],text=True).splitlines());assert changed<=set(files),changed
sys.path.insert(0,str(R/'scripts'));import check_blueprint
errors,warnings,summary=check_blueprint.check(R/files[0],check_blueprint.load_index(Path(sys.argv[2])),check_blueprint.world());assert not errors and not warnings,(errors,warnings)
summary['packet']=files[0]
lean={'compiled':False,'reason':'No local successful Lean log supplied; admitted source validation only.'}
if (S/'canonical.log').exists():
 log=(S/'canonical.log').read_text()
 assert 'Exit status: 0' in log and not re.search(r'error(?:\(|:)',log)
 assert log.count('warning:')==log.count('warning: declaration uses')==533
 lean={'compiled':True,'warnings':533,'admittedSketchOnly':True,'newAdmissionFreeProofs':False}
report=dict(preservedWholeNodeObjects=210,newDeclarations=20,newTests=13,newApiItems=16,
 rawApiItems=sum(len(n.get('api',[])) for n in p['nodes']),rawTests=sum(len(n.get('tests',[])) for n in p['nodes']),
 checker=summary,intakeProblems=problems,intakeRefusals=refusals,lean=lean,
 hashes={name:hashlib.sha256((S/name).read_bytes()).hexdigest() for name in ['Canonical.lean','IncomingCanonical.lean','NewAdmitted.lean']},
 worldCommit=subprocess.check_output(['git','rev-parse','HEAD'],text=True).strip(),
 sourceValidation='All new declaration/API/test names and statements matched; incoming node objects, key/requests/stages and canonical/reader/handoff prefixes or suffixes preserved.')
print(json.dumps(report,indent=2))
```

### Portable graph.py

```python
from pathlib import Path
import sys,json,copy,collections
sys.path.insert(0,str(Path.cwd()/'scripts'))
import build,blueprints,check_blueprint
RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7'
p=json.loads((Path.cwd()/'research/blueprint/packets'/f'{STEM}.json').read_text())
original=json.loads(Path(sys.argv[1]).read_text())
new={n['id']:n for n in p['nodes']}
root=Path.cwd()
a0=json.loads((root/"data/atlas.json").read_text())
packets,documents,definitions=blueprints.load_promoted(root)
otherparts=[(stem,q) for stem,q in packets if q.get("roadmapId")==RID and stem!=STEM]
assert otherparts, "must preserve other promoted roadmap parts"
keep=[x for x in packets if x[0]!=STEM]
documents[STEM]="research/blueprint/readmes/"+STEM+".md"
def assemble(candidate):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(STEM,candidate)]),copy.deepcopy(documents),copy.deepcopy(definitions))
 return build.assemble(require_distances=False)[0]
a=assemble(p);b=assemble(original)
world={}
for folder in ["data/decompositions","data/blueprints","research/blueprint/packets"]:
 for path in sorted((root/folder).glob("*.json")):
  q=json.loads(path.read_text())
  for n in q.get("nodes",[]):world.setdefault(n["id"],n)
world.update(new)
stages={x["id"]:x for x in a["stages"]}
stageids=set(stages)|set(check_blueprint.world()[1])
stageedges={(e["source"],e["target"]) for e in a["stageEdges"]}
def dag(vertices,edges):
 vertices=set(vertices)|{v for edge in edges for v in edge}
 out=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for source,target in edges:
  if target not in out[source]:out[source].add(target);indeg[target]+=1
 stack=[v for v,count in indeg.items() if count==0];count=0
 while stack:
  v=stack.pop();count+=1
  for w in out[v]:
   indeg[w]-=1
   if indeg[w]==0:stack.append(w)
 assert count==len(vertices),[v for v,count in indeg.items() if count][:15]
 return {"vertices":len(vertices),"edges":len(edges),"acyclic":True}
ownedges={(q,nid) for nid,node in new.items() for q in node.get("prerequisites",[]) if q in new}
stack=list(new);seen=set();dep=set();unresolved=set();baseref=set()
while stack:
 nid=stack.pop()
 if nid in seen:continue
 seen.add(nid)
 for q in world[nid].get("prerequisites",[]):
  if q.startswith(("mathlib:","tauceti:")) and q not in stageids:baseref.add(q);continue
  dep.add((q,nid))
  if q in world:stack.append(q)
  elif q not in stageids:unresolved.add(q)
assert not unresolved,sorted(unresolved)
dep|={(world[nid]["parentStageId"],nid) for nid in seen if world[nid].get("parentStageId") in stageids or world[nid].get("parentStageId") in world}
dep|={(request["supplier"],consumer) for request in p.get("requests",[]) for consumer in request.get("neededBy",[]) if consumer in new or consumer in stageids}
roadmap=next(r for r in a["roadmaps"] if r["id"]==RID)
expected_decl=len(new)+sum(len(q["nodes"]) for _,q in otherparts)
assert roadmap["blueprint"]["declarations"]==expected_decl,(roadmap["blueprint"],expected_decl)
assert not roadmap["blueprint"]["skippedLinks"] and not roadmap.get("pendingLinks",[])
assert stageedges=={(e["source"],e["target"]) for e in b["stageEdges"]}
def skips(atlas):
 return {r["id"]:(r.get("blueprint",{}).get("skippedLinks",[]),r.get("pendingLinks",[])) for r in atlas["roadmaps"] if r["id"]!=RID}
assert skips(a)==skips(b)
out=collections.defaultdict(set)
for source,target in stageedges:out[source].add(target)
def reachable(source,target):
 stack=[source];seen=set()
 while stack:
  v=stack.pop()
  if v==target:return True
  if v in seen:continue
  seen.add(v);stack.extend(out[v]-seen)
 return False
pairs={(e["source"],e["target"]) for e in a0["stageEdges"] if e["target"].startswith(RID+":")}
for node in p["nodes"]:
 for q in node.get("prerequisites",[]):
  if q in stageids and q not in world and q!=node["parentStageId"]:pairs.add((q,node["parentStageId"]))
for req in p.get("requests",[]):
 for consumer in req.get("neededBy",[]):
  if consumer in new:pairs.add((req["supplier"],new[consumer]["parentStageId"]))
  elif consumer in stageids:pairs.add((req["supplier"],consumer))
missingpairs={(s,t) for s,t in pairs if not reachable(s,t)}
oldout=collections.defaultdict(set)
for edge in b['stageEdges']:oldout[edge['source']].add(edge['target'])
def reachable0(source,target):
 stack=[source];seen=set()
 while stack:
  v=stack.pop()
  if v==target:return True
  if v in seen:continue
  seen.add(v);stack.extend(oldout[v]-seen)
 return False
assert missingpairs=={(s,t) for s,t in pairs if not reachable0(s,t)}
assert missingpairs=={('tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions',RID+':R03.4')}
assert any('LocalFieldsRamification layer 0 to R03.4' in gap['detail'] for gap in p['gaps'])
# Independently retain all accepted restructure links touching the whole roadmap.
acceptedpairs=set()
for path in (root/"research/blueprint/restructure").glob("*.result.json"):
 q=json.loads(path.read_text())
 if q.get("review",{}).get("status")!="accepted":continue
 for row in q.get("links",[]):
  if any(row.get(k,"").startswith(RID+":") for k in ["source","target"]):
   acceptedpairs.add((row["source"],row["target"]))
assert all(reachable(s,t) for s,t in acceptedpairs),[(s,t) for s,t in acceptedpairs if not reachable(s,t)]
report={"stageDAG":dag(stages,stageedges),"ownDAG":dag(new,ownedges),
 "combinedDAG":dag(set(stages)|seen,stageedges|dep),"reachableDeclarations":len(seen),
 "externalDeclarations":sorted(seen-set(new)),"reachableBaselineReferences":len(baseref),
 "unresolved":sorted(unresolved),"otherPartsRetained":[stem for stem,_ in otherparts],
 "partDeclarations":len(new),"partPlanets":sum("planet" in n for n in p["nodes"]),
 "roadmapDeclarations":roadmap["blueprint"]["declarations"],
 "requiredStagePairs":len(pairs),"requiredStagePairsReachable":len(pairs)-len(missingpairs),
 "inheritedMissingStagePairs":sorted(missingpairs),
 "acceptedRestructurePairs":len(acceptedpairs),"acceptedRestructurePairsReachable":len(acceptedpairs),
 "stageEdgesUnchanged":True,"otherSkippedPendingUnchanged":True,"ownSkippedPendingEmpty":True}
print(json.dumps(report,ensure_ascii=False,indent=2),flush=True)
```

### Portable compile.py

```python
from pathlib import Path
import subprocess,sys,json,hashlib,datetime
S=Path(sys.argv[1]).resolve();build=Path(sys.argv[2]).resolve()
pin='082e2d37e8b0463410cdb532e111cd43d5a66174'
actual=subprocess.check_output(['git','rev-parse','HEAD'],cwd=build/'.lake/packages/mathlib',text=True).strip()
assert actual==pin,(actual,pin)
file=S/'Canonical.lean'
assert not any(line.startswith('import TauCeti') for line in file.read_text().splitlines())
free=subprocess.check_output(['free','-g'],text=True)
available=int(free.splitlines()[1].split()[-1])
receipt=dict(time=datetime.datetime.now(datetime.timezone.utc).isoformat(),mathlib=actual,
 sha256=hashlib.sha256(file.read_bytes()).hexdigest(),preflight=free,availableGiB=available)
if available<20:
 receipt.update(started=False,reason='WORKERS requires at least 20 GiB available; no Lean process started.')
 (S/'compile-receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
 print(json.dumps(receipt,indent=2));sys.exit(75)
with (S/'canonical.log').open('w') as log:
 log.write(free);log.flush()
 result=subprocess.run(['/usr/bin/time','-v','timeout','1200','lake','env','lean',str(file)],cwd=build,stdout=log,stderr=subprocess.STDOUT)
receipt.update(started=True,exit=result.returncode)
(S/'compile-receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
print(json.dumps(receipt,indent=2));sys.exit(result.returncode)
```

## Complete incoming handoff, retained with attribution

# Actual curve degree quotient checkpoint

Codex — codex-rtOQ9t; Refs #551. Claim 5965904056 was confirmed by bot comment 5965904896. The whole issue was read before claiming and again after confirmation. This is a substantive partial checkpoint; no stage or implementation is certified closed.

The 18 new declarations identify the actual equation-jet image with the native quotient of q^n by q • top in A=R/(f), where q is the image of the formal-series variable ideal. They include the actual jet algebra equivalence, image membership/map/bijectivity/equivalence, native successive-power quotient comparison, homogeneous comparison, representative/inverse/vanishing formulas, and principal-kernel and strict-below-order adapters. Generic ideal and quotient equivalences already in the pinned Mathlib are consumed rather than replanned. The generic ideal-image comparisons allow arbitrary variable types and commutative coefficients; homogeneous comparisons use finite variables. Only the principal exact-order kernel adds no zero divisors.

All 192 incoming node objects remain identical. The full general Noetherian-local finite-module multiplicity key, intrinsic support dimension versus ambient ring dimension, all 15 gaps, both requests, all eight stage statuses and historical source attributions are retained. The reader appends the complete incoming reader, and this handoff appends the complete incoming handoff. Historical prototype omissions are superseded only for the mathematical comparison described here. Full graded multiplication and generator-compatible assembly, the full graded principal ideal kernel, curve/support dimension, comparison with the general cumulative polynomial, intrinsic/ambient multiplicity, Hilbert–Serre, Artin–Rees, completion, localization, associativity and all source/stage obligations remain required.

Fifteen named new tests use actual maps or quotient carriers: zero/unit equations, inverse and representative formulas, no-variable degree-zero constant, surviving nilpotent coefficient 2X over Z/4Z, and the nonreduced characteristic-two equation X², for which X survives in degree one and X² vanishes in degree two. Every new construction has at least three planned tests and an API tied to its consumers. There are 210 nodes (8 definitions, 36 constructions, 150 lemmas, 16 theorems), 187 API items, 223 raw test entries (169 required definition/construction test entries), 323 baseline declarations and 13 planets. All implementation statuses are unchecked.

Fresh reading comprises the credited immutable DDPA jet argument §§2–5 and complete Stacks 00K4 mathematical section, the actual generic quotient equivalence and ambient source hypotheses at the Mathlib pin, all nine reviewed roadmap audit rows and accepted review, whole campaign reader, all eight exact stage objects, reserved key/catalog brief, two current requests and applicable accepted RS-08 ownership/link and ModularCurves overlap records. Historical peer readings and executions remain credited, not claimed as our fresh reads. Two upstream style documents were inspected earlier in this continuous worker loop. A bounded current open-PR search found PR27307 (homogeneous relation), OPEN at 0127706ca379b684697f3c95c8cc772537a21774; its metadata/body/file list informed the remaining full-graded boundary and its implementation is not imported. Bounded indexed Zulip searches furnished no pertinent quotient adapter. No whole-library absence is inferred.

The mathematical read base and publication base are below. All four issue inputs and twelve governing inputs were byte-identical across those bases. Only the four allowed deliverables change. The pinned sources are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The existing build's Mathlib pin and Lean 4.34.0-rc2 were used; no Tau Ceti module is imported by either complete Lean file. Tau Ceti citations retain their source-pin audit, and this receipt does not claim compilation of a different Tau Ceti checkout.

Both full files were elaborated afresh, one process at a time, after an atomic free -g guard showed at least 20 GiB available. Final Native.lean: 3,075 lines, zero errors, warnings, admissions or sorryAx; 218 declaration/test axiom audits report only the standard propext/Classical.choice/Quot.sound axioms. Final Canonical.lean: 3,696 lines, zero errors and exactly 500 expected placeholder warnings, with no other warnings. The admission-free inherited native prefix is retained byte for byte. The newly admitted prototypes preserve the complete binder/type headers of all 18 new declarations and 15 tests, including type-level lets. Intermediate failed elaborations and unused-variable warnings were corrected before these final successful checks. No Lake project, library build, update, cache fetch or language server was started; no compiler remains running.

The actual indexed checker and intake functions pass with zero errors/warnings/refusals. The actual assembler retains the separately promoted R03.6 part: the whole roadmap has 263 declarations. Stage, own and combined dependency graphs are acyclic, with no unresolved declaration input. All 65 accepted restructure pairs touching this roadmap are reachable. Twelve of thirteen required stage pairs are reachable; the existing LocalFieldsRamification layer-0 → R03.4 missing path is unchanged in the incoming control and remains explicitly recorded as a gap/request. Other roadmaps' skipped/pending entries equal the control, and the owned roadmap has none. This is not a claim that every stage supplier is reachable.

The following metadata and four self-contained scripts recover the public source artifacts and replay the source/header/indexed-checker/intake/actual-assembler validation. Invoke recover.py with the immutable PR head and an owned on-disk scratch directory, then run verify.py from the existing Atlas clone with that scratch directory and the pinned declaration index. Neither recovery nor source verification silently runs Lean. A source-only replay without successful local logs reports that absence, rather than claiming our execution as a new run. The original normalized full logs and hashes are preserved below; scratch may be deleted after public recovery and submission. The proof archive is an ancestor commit of this PR, storing the full checked native proof inside the permitted suggested-file comment, and the final suggested file contains only canonical admitted prototypes.

```json
{
  "worker": "Codex — codex-rtOQ9t",
  "issue": 551,
  "claim": 5965904056,
  "confirmation": 5965904896,
  "mathematicalBase": "e8900fee9630d5937acb359fc7db190573c379f5",
  "nodes": [
    "DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-ideal-power",
    "DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-equivalence",
    "DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-representative",
    "DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-image-membership",
    "DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-image-map",
    "DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-image-value",
    "DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-image-bijective",
    "DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-image-equivalence",
    "DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-image-representative",
    "DeformationAndDerivedPatchingAlgebra:R03.3/native-curve-degree-equivalence",
    "DeformationAndDerivedPatchingAlgebra:R03.3/native-curve-degree-representative",
    "DeformationAndDerivedPatchingAlgebra:R03.3/native-curve-degree-inverse",
    "DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-native-curve-degree-equivalence",
    "DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-native-curve-degree-representative",
    "DeformationAndDerivedPatchingAlgebra:R03.3/native-curve-degree-class-vanishing",
    "DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-native-curve-degree-vanishing",
    "DeformationAndDerivedPatchingAlgebra:R03.3/native-curve-degree-principal-kernel",
    "DeformationAndDerivedPatchingAlgebra:R03.3/native-curve-degree-below-order"
  ],
  "declarations": [
    "curveAdicIdeal_pow",
    "curveJetEquiv",
    "curveJetEquiv_mk",
    "curveJetEquiv_image_mem",
    "curveJetImageMap",
    "curveJetImageMap_apply",
    "curveJetImageMap_bijective",
    "curveJetImageEquiv",
    "curveJetImageEquiv_mk",
    "nativeCurveDegreeEquiv",
    "nativeCurveDegreeEquiv_mk",
    "nativeCurveDegreeEquiv_symm",
    "homogeneousNativeCurveDegreeEquiv",
    "homogeneousNativeCurveDegreeEquiv_mk",
    "nativeCurveDegreeEquiv_mk_eq_zero",
    "homogeneousNativeCurveDegreeEquiv_eq_zero",
    "nativeCurveDegree_principal_kernel",
    "nativeCurveDegree_below_order"
  ],
  "tests": [
    "jet_inverse",
    "image_zero",
    "image_representative",
    "jet_zero",
    "jet_unit",
    "image_inverse",
    "native_zero",
    "native_roundtrip",
    "homogeneous_roundtrip",
    "zero_equation",
    "unit_equation",
    "no_variables_constant",
    "nilpotent_coeff_survives",
    "characteristic_two_repeated_killed",
    "characteristic_two_repeated_survives"
  ],
  "newApiItems": 16,
  "baselineAdded": [
    "mathlib:LinearMap.codRestrict",
    "mathlib:LinearMap.mem_ker",
    "mathlib:Ideal.quotEquivOfEq",
    "mathlib:Ideal.quotEquivOfEq_mk",
    "mathlib:AlgEquiv.ofRingEquiv",
    "mathlib:Ideal.mem_map_iff_of_surjective",
    "mathlib:Ideal.mem_map_of_mem",
    "mathlib:Ideal.powQuotPowSuccLinearEquivMapMkPowSuccPow",
    "mathlib:LinearEquiv.restrictScalars",
    "mathlib:LinearEquiv.map_eq_zero_iff"
  ],
  "inheritedProofArchive": "a9ae87a27904da425bf9d997e038bfa23fe3a466",
  "inheritedNativeSha256": "031d541cf87c7836c4ca9ec528f1f7f9b0ba25fa63ef14e1b63b548dd4ee885e",
  "proofHashes": {
    "Native": "40bfb9d5be77ef425971e5c9e633ebc4b0e5f75e3c0e3eb61c387db2a0ccd8cf",
    "Canonical": "02c4e71eb60c7d244ecd4e8821193f77062715baead76f791556c110a36f9e2a",
    "New": "ccf57bb45bfacb495b62ee342a48c91e86b80a1597d9e612431201168e717df6",
    "Tests": "3a592f066d4d3b9f142a43b2eaa35250e48acd1c4c3fb6374f2f860fb2b313a9",
    "NewAdmitted": "b00719653d2f29566ca67a17b14f51230dc6cd44cefce3f25894ada9b112354e",
    "Audits": "6fbf7d3625b62a708e6d237a099756e872d49f2ebeb0e81959b05f9de60d3d3a"
  },
  "publicationBase": "21b2f2946940fe7557c08f1b578854c0b015aa80",
  "validation": {
    "checker": {
      "packet": "research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--P7.json",
      "roadmap": "DeformationAndDerivedPatchingAlgebra",
      "status": "partial",
      "nodes": 210,
      "kinds": {
        "lemma": 150,
        "theorem": 16,
        "definition": 8,
        "construction": 36
      },
      "apiItems": 187,
      "unitTests": 169,
      "planets": 13,
      "baselineDeclarations": 323,
      "prerequisites": {
        "baseline": 440,
        "node (this packet)": 335,
        "node (integrated)": 1
      },
      "gaps": 15,
      "requests": 2,
      "stagesInScope": 8,
      "stagesClosed": 0
    },
    "graph": {
      "stageDAG": {
        "vertices": 3003,
        "edges": 8623,
        "acyclic": true
      },
      "ownDAG": {
        "vertices": 210,
        "edges": 335,
        "acyclic": true
      },
      "combinedDAG": {
        "vertices": 3201,
        "edges": 9169,
        "acyclic": true
      },
      "reachableDeclarations": 211,
      "externalDeclarations": [
        "DeformationAndDerivedPatchingAlgebra:R03.3/depth-auslander-buchsbaum-and-dimension-bounds"
      ],
      "reachableBaselineReferences": 293,
      "unresolved": [],
      "otherPartsRetained": [
        "DeformationAndDerivedPatchingAlgebra--R03.6"
      ],
      "partDeclarations": 210,
      "partPlanets": 13,
      "roadmapDeclarations": 263,
      "requiredStagePairs": 13,
      "requiredStagePairsReachable": 12,
      "inheritedMissingStagePairs": [
        [
          "tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions",
          "DeformationAndDerivedPatchingAlgebra:R03.4"
        ]
      ],
      "acceptedRestructurePairs": 65,
      "acceptedRestructurePairsReachable": 65,
      "stageEdgesUnchanged": true,
      "otherSkippedPendingUnchanged": true,
      "ownSkippedPendingEmpty": true
    },
    "preservedWholeNodeObjects": 192,
    "newDeclarations": 18,
    "newTests": 15,
    "newApiItems": 16,
    "totalRawTests": 223,
    "guardsUnchanged": 12,
    "intakeProblems": [],
    "intakeRefusals": [],
    "proofHashes": {
      "Native": "40bfb9d5be77ef425971e5c9e633ebc4b0e5f75e3c0e3eb61c387db2a0ccd8cf",
      "Canonical": "02c4e71eb60c7d244ecd4e8821193f77062715baead76f791556c110a36f9e2a",
      "New": "ccf57bb45bfacb495b62ee342a48c91e86b80a1597d9e612431201168e717df6",
      "Tests": "3a592f066d4d3b9f142a43b2eaa35250e48acd1c4c3fb6374f2f860fb2b313a9",
      "NewAdmitted": "b00719653d2f29566ca67a17b14f51230dc6cd44cefce3f25894ada9b112354e",
      "Audits": "6fbf7d3625b62a708e6d237a099756e872d49f2ebeb0e81959b05f9de60d3d3a"
    },
    "execution": {
      "Native": {
        "audits": 218,
        "warnings": 0,
        "logSha256": "d8c0f23b3e169d9ee439c937a19660c9c73b733bb2712b317821c6191eaa0544",
        "resourceFooter": "ELAPSED 19.91 RSS 3706408 EXIT 0",
        "execution": "Successful local log verified"
      },
      "Canonical": {
        "audits": 0,
        "warnings": 500,
        "logSha256": "3aa7bfc132fae7fc1d5671cac975298283ddd9e6ad766fe1bc29232fcb74c24e",
        "resourceFooter": "ELAPSED 32.81 RSS 3684004 EXIT 0",
        "execution": "Successful local log verified"
      }
    },
    "immutableReadPaths": 845,
    "immutableReadPathListSha256": "058eeeb5e5c0bdfc5035fb51bc7ec615b0620060b78255e78566ae7f62f43681",
    "verifierSha256": "2c0b00c7116c18e25d56b943ab7dff03a4979901f6f3a502811b0488df9ac64a"
  },
  "execution": {
    "Native": {
      "audits": 218,
      "warnings": 0,
      "logSha256": "d8c0f23b3e169d9ee439c937a19660c9c73b733bb2712b317821c6191eaa0544",
      "resourceFooter": "ELAPSED 19.91 RSS 3706408 EXIT 0",
      "execution": "Successful local log verified"
    },
    "Canonical": {
      "audits": 0,
      "warnings": 500,
      "logSha256": "3aa7bfc132fae7fc1d5671cac975298283ddd9e6ad766fe1bc29232fcb74c24e",
      "resourceFooter": "ELAPSED 32.81 RSS 3684004 EXIT 0",
      "execution": "Successful local log verified"
    }
  },
  "proofArchive": "e7e248a990b6db47bcf6e10438a6e29c02d9d565"
}
```

## recover.py

```python
from pathlib import Path
import hashlib,json,re,sys,urllib.request
head=sys.argv[1];s=Path(sys.argv[2]).resolve();s.mkdir(parents=True,exist_ok=True)
stem='DeformationAndDerivedPatchingAlgebra--P7';path='research/blueprint/suggested/'+stem+'.lean';root='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
def fetch(commit,p):
 return urllib.request.urlopen(root+commit+'/'+p).read()
def section(b,start,end):
 assert b.count(start)==1 and b.count(end)==1
 return b.split(start,1)[1].split(end,1)[0]
def sha(b):return hashlib.sha256(b).hexdigest()
files=[('packets','.json'),('readmes','.md'),('suggested','.lean'),('handoff','.md')]
public={}
for folder,ext in files:
 p='research/blueprint/'+folder+'/'+('BP-' if folder=='handoff' else '')+stem+ext
 public[folder]=fetch(head,p);(s/('public-'+folder+ext)).write_bytes(public[folder])
hand=public['handoff'].decode();meta=json.loads(re.search(r'```json\n(.*?)\n```',hand,re.S)[1]);base=meta['mathematicalBase']
(s/'metadata.json').write_text(json.dumps(meta,ensure_ascii=False,indent=2)+'\n')
for folder,ext in files:
 p='research/blueprint/'+folder+'/'+('BP-' if folder=='handoff' else '')+stem+ext
 (s/('incoming-'+folder+ext)).write_bytes(fetch(base,p))
native=section(fetch(meta['proofArchive'],path),b'/- BEGIN ARCHIVED ACTUAL CURVE DEGREE COMPARISON\n',b'END ARCHIVED ACTUAL CURVE DEGREE COMPARISON -/')
incoming=section(fetch(meta['inheritedProofArchive'],path),b'/- BEGIN ARCHIVED CHECKED DEGREE QUOTIENT COMPARISON\n',b'END ARCHIVED CHECKED DEGREE QUOTIENT COMPARISON -/')
assert sha(incoming)==meta['inheritedNativeSha256'];(s/'recovered').mkdir(exist_ok=True);(s/'recovered/Native.lean').write_bytes(incoming)
new=section(native,b'\n/- BEGIN NATIVE CURVE DEGREE COMPARISON -/\n',b'\n/- BEGIN NATIVE CURVE DEGREE TESTS -/\n')
tests=section(native,b'\n/- BEGIN NATIVE CURVE DEGREE TESTS -/\n',b'\n/- BEGIN NATIVE CURVE DEGREE AUDITS -/\n')
audits=section(native,b'\n/- BEGIN NATIVE CURVE DEGREE AUDITS -/\n',b'/- END NATIVE CURVE DEGREE COMPARISON -/\n')
admitted=section(public['suggested'],b'/- BEGIN ACTUAL CURVE DEGREE COMPARISON -/\n',b'/- END ACTUAL CURVE DEGREE COMPARISON -/')
for n,b in {'Native':native,'Canonical':public['suggested'],'New':new,'Tests':tests,'NewAdmitted':admitted,'Audits':audits}.items():
 assert sha(b)==meta['proofHashes'][n],(n,sha(b),meta['proofHashes'][n]);(s/(n+'.lean')).write_bytes(b)
blocks=re.findall(r'```python\n(.*?)\n```',hand,re.S)
assert len(blocks)>=4
for name,code in zip(['recover.py','verify.py','immutable_view.py','graph.py'],blocks[:4]):(s/name).write_text(code+'\n')
print(json.dumps({'publicHead':head,'proofArchive':meta['proofArchive'],'hashesVerified':True,'originalReceipts':meta.get('execution',{}),'execution':'Public source recovery only; this command does not run Lean.'},indent=2))
```

## verify.py

```python
from pathlib import Path
import ast,contextlib,hashlib,io,json,os,re,runpy,subprocess,sys
R=Path.cwd();S=Path(sys.argv[1]).resolve();RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7';NS='TauCeti.HilbertSamuel.'
FILES=['research/blueprint/'+d+'/'+('BP-' if d=='handoff' else '')+STEM+e for d,e in [('packets','.json'),('readmes','.md'),('suggested','.lean'),('handoff','.md')]]
def sha(x):return hashlib.sha256(x).hexdigest()
current={f:(R/f).read_bytes() for f in FILES}
p=json.loads(current[FILES[0]]);old=json.loads((S/'incoming-packets.json').read_text());meta=json.loads((S/'metadata.json').read_text())
assert len(old['nodes'])==192 and len(p['nodes'])==210 and p['nodes'][:192]==old['nodes']
assert p['sources'][:-1]==old['sources'] and p['baseline']['declarations'][:313]==old['baseline']['declarations']
assert len(p['baseline']['declarations'])==323
assert {k:v for k,v in p['baseline'].items() if k!='declarations'}=={k:v for k,v in old['baseline'].items() if k!='declarations'}
for k,v in old.items():
 if k not in {'summary','sources','baseline','nodes','gaps','coverage'}:assert p[k]==v,k
assert p['gaps'][:-1]==old['gaps'][:-1]
assert {k:v for k,v in p['gaps'][-1].items() if k!='nativeCurveDegreeContinuation'}==old['gaps'][-1]
header=json.loads(re.search(r'```json\n(.*?)\n```',current[FILES[3]].decode(),re.S)[1])
for k in ['worker','issue','claim','confirmation','mathematicalBase','publicationBase','proofArchive','proofHashes']:assert header[k]==meta[k],k
assert p['status']=='partial' and all(n['implementationStatus']=='unchecked' for n in p['nodes'])
full=current[FILES[2]].decode();reader=current[FILES[1]].decode();native=(S/'Native.lean').read_text();new=(S/'New.lean').read_text();tests=(S/'Tests.lean').read_text();admitted=(S/'NewAdmitted.lean').read_text();audits=(S/'Audits.lean').read_text();incoming=(S/'recovered/Native.lean').read_text()
assert native==incoming+'\n/- BEGIN NATIVE CURVE DEGREE COMPARISON -/\n'+new+'\n/- BEGIN NATIVE CURVE DEGREE TESTS -/\n'+tests+'\n/- BEGIN NATIVE CURVE DEGREE AUDITS -/\n'+audits+'/- END NATIVE CURVE DEGREE COMPARISON -/\n'
assert not re.search(r'\bsorry\b|^axiom\b',native,re.M)
assert full.startswith((S/'incoming-suggested.lean').read_text())
assert reader.endswith((S/'incoming-readmes.md').read_text())
assert current[FILES[3]].decode().endswith((S/'incoming-handoff.md').read_text())
assert (S/'Canonical.lean').read_text()==full
assert full.split('/- BEGIN ACTUAL CURVE DEGREE COMPARISON -/\n')[1].split('/- END ACTUAL CURVE DEGREE COMPARISON -/')[0]==admitted
# Main body delimiters exclude type-level lets. Keep their entire actual binder text.
def headers(text):
 out={};matches=list(re.finditer(r'^(def|lemma) (\w+)\b',text,re.M))
 for i,m in enumerate(matches):
  block=text[m.start():matches[i+1].start() if i+1<len(matches) else len(text)]
  marker=re.search(r' where\n| := by\b| := rfl\b| := map_zero\b| := LinearEquiv\.| :=\n(?=  [A-Za-z_(])',block)
  if marker is None:marker=re.search(r' := \(',block)
  assert marker,m[2]
  out[m[2]]=' '.join(block[:marker.start()].split())
 return out
assert headers(new+'\n'+tests)==headers(admitted)
assert set(headers(new))==set(meta['declarations']) and len(meta['tests'])==15
for n in p['nodes'][192:]:
 assert n['declaration'] in reader and n['statement'] in reader
 for a in n.get('api',[]):assert a['name'] in reader and a['statement'] in reader
 for t in n.get('tests',[]):
  assert t['statement'] in reader and '-- test: '+t['name'] in admitted
# Execution is certified only from successful local logs, never from source recovery alone.
execution={}
for name,count,warnings in [('Native',218,0),('Canonical',0,500)]:
 path=S/(name.lower()+'.log')
 if not path.exists():execution[name]='No local execution log supplied; source/header validation only.';continue
 log=path.read_text();assert not re.search(r'error(?:\(|:)|sorryAx|Command exited with non-zero',log)
 assert log.count('warning:')==log.count('warning: declaration uses')==warnings
 assert log.count('depends on axioms:')+log.count('does not depend on any axioms')==count
 assert re.search(r'ELAPSED [0-9.]+ RSS [0-9]+ EXIT 0\s*$',log)
 for found in re.findall(r'depends on axioms: \[(.*?)\]',log,re.S):
  assert set(re.findall(r'\b(?:\w+\.)*\w+\b',found))<={'propext','Classical.choice','Quot.sound'}
 execution[name]={'audits':count,'warnings':warnings,'logSha256':sha(path.read_bytes()),'resourceFooter':log.splitlines()[-1],'execution':'Successful local log verified'}
base=os.environ.get('P7_VALIDATE_BASE',meta['publicationBase'])
mathbase='e8900fee9630d5937acb359fc7db190573c379f5'
guards=['research/blueprint/WORKERS.md','research/blueprint/PROTOCOL.md','research/expansion/PROTOCOL.md','research/blueprint/UPSTREAM_GUIDE.md','data/library-coverage.json','research/blueprint/reviews/REV-AUDIT-17.md','research/blueprint/reserved-ids.json','data/keydefs/KEYDEF-algebraicgeometry.json','content/campaign/'+RID+'/README.md','research/blueprint/restructure/RS-08.result.json','research/blueprint/restructure/RS-08.md','research/blueprint/links/tauceti_TauCetiRoadmap_ModularCurves.json']
def blob(ref,path):return subprocess.check_output(['git','show',ref+':'+path],cwd=R)
for f in guards:assert blob(mathbase,f)==blob(base,f),f
for f in FILES:assert blob(mathbase,f)==blob(base,f),f
changed=set(subprocess.check_output(['git','diff','--name-only',base],text=True).splitlines());assert changed<=set(FILES),changed
assert p['coverage'][:5]==old['coverage'][:5] and p['coverage'][6:]==old['coverage'][6:]
assert p['coverage'][5]['remaining'][:-1]==old['coverage'][5]['remaining'][:-1]
assert [r['status'] for r in p['coverage']]==[r['status'] for r in old['coverage']]
sys.path.insert(0,str(S));import immutable_view as view
assert view.BASE==base;view.install()
import check_blueprint
# Overlay exactly our candidate packet, leaving every other promoted packet immutable.
view.CACHE[FILES[0]]=current[FILES[0]]
errors,warnings,summary=check_blueprint.check(R/FILES[0],check_blueprint.load_index(Path(sys.argv[2])),check_blueprint.world());assert not errors and not warnings,(errors,warnings)
intake=ast.parse(view.blob('research/blueprint/intake.py').decode());selected=[]
for node in intake.body:
 if isinstance(node,ast.Assign) and any(isinstance(x,ast.Name) and x.id in {'ALLOWED','PRIVATE'} for x in node.targets):selected.append(node)
 if isinstance(node,ast.FunctionDef) and node.name in {'file_problems','auto_refusals','own_files','independent_of'}:selected.append(node)
env={'json':json,'re':re};exec(compile(ast.Module(body=selected,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads(view.blob('research/blueprint/queue.json'))['jobs'] if j['id']=='BP-'+STEM)
problems=[q for f,b in current.items() for q in env['file_problems'](f,b.decode())];refusals=env['auto_refusals'](job,FILES,False,{'codex-rtOQ9t'},set());assert not problems and not refusals,(problems,refusals)
for f,b in current.items():
 assert not re.search(r'[ \t]+$',b.decode(),re.M),f
 assert not re.search(r'/(?:home|Users)/[^/\s]+/',b.decode()),f
output=io.StringIO();argv=sys.argv;sys.argv=[str(S/'graph.py'),str(S/'incoming-packets.json')]
with contextlib.redirect_stdout(output):runpy.run_path(str(S/'graph.py'),run_name='__main__')
sys.argv=argv;graph=json.loads(output.getvalue())
summary['packet']=FILES[0]
report={'checker':summary,'graph':graph,'preservedWholeNodeObjects':192,'newDeclarations':18,'newTests':15,'newApiItems':16,'totalRawTests':sum(len(n.get('tests',[])) for n in p['nodes']),'guardsUnchanged':len(guards),'intakeProblems':problems,'intakeRefusals':refusals,'proofHashes':{n:sha((S/(n+'.lean')).read_bytes()) for n in ['Native','Canonical','New','Tests','NewAdmitted','Audits']},'execution':execution,'immutableReadPaths':len(view.READS),'immutableReadPathListSha256':sha(json.dumps(sorted(view.READS)).encode()),'verifierSha256':sha(Path(__file__).read_bytes())}
print(json.dumps(report,ensure_ascii=False,indent=2))
```

## immutable_view.py

```python
"""Read the immutable audit tree without creating a repository snapshot."""
import fnmatch
import importlib.abc
import importlib.util
import io
from pathlib import Path
import subprocess
import sys

import os
REPO = Path(os.environ.get('TAUCETI_REPO', str(Path.cwd())))
BASE = os.environ.get('P7_VALIDATE_BASE', '21b2f2946940fe7557c08f1b578854c0b015aa80')
TRACKED = set(subprocess.check_output(['git', 'ls-tree', '-r', '--name-only', BASE], cwd=REPO, text=True).splitlines())
CACHE = {}
READS = set()
ORIGINAL = {name: getattr(Path, name) for name in ('read_text', 'read_bytes', 'exists', 'is_file', 'is_dir', 'glob', 'rglob', 'open', 'write_text', 'write_bytes')}

def relative(path):
    try:
        return str(path.resolve().relative_to(REPO.resolve()))
    except ValueError:
        return None

def blob(key):
    if key not in TRACKED:
        raise FileNotFoundError(key)
    READS.add(key)
    if key not in CACHE:
        CACHE[key] = subprocess.check_output(['git', 'show', BASE + ':' + key], cwd=REPO)
    return CACHE[key]

def read_text(path, encoding=None, errors=None):
    key = relative(path)
    if key is None:
        return ORIGINAL['read_text'](path, encoding=encoding, errors=errors)
    return blob(key).decode(encoding or 'utf-8', errors or 'strict')

def read_bytes(path):
    key = relative(path)
    return ORIGINAL['read_bytes'](path) if key is None else blob(key)

def is_file(path):
    key = relative(path)
    return ORIGINAL['is_file'](path) if key is None else key in TRACKED

def is_dir(path):
    key = relative(path)
    return ORIGINAL['is_dir'](path) if key is None else any(s.startswith(key.rstrip('/') + '/') for s in TRACKED) or key == '.'

def exists(path):
    key = relative(path)
    return ORIGINAL['exists'](path) if key is None else is_file(path) or is_dir(path)

def glob(path, pattern, recursive=False):
    key = relative(path)
    if key is None:
        yield from ORIGINAL['rglob' if recursive else 'glob'](path, pattern)
        return
    prefix = '' if key == '.' else key.rstrip('/') + '/'
    for candidate in sorted(TRACKED):
        if not candidate.startswith(prefix):
            continue
        tail = candidate[len(prefix):]
        if fnmatch.fnmatch(tail, pattern) and (recursive or '/' not in tail):
            yield REPO / candidate

def open_path(path, mode='r', buffering=-1, encoding=None, errors=None, newline=None):
    key = relative(path)
    if key is None:
        return ORIGINAL['open'](path, mode, buffering, encoding, errors, newline)
    if mode not in ('r', 'rb'):
        raise PermissionError('audit tree is read-only')
    return io.BytesIO(blob(key)) if mode == 'rb' else io.StringIO(blob(key).decode(encoding or 'utf-8', errors or 'strict'))

def write_text(path, *args, **kwargs):
    if relative(path) is not None:
        raise PermissionError('audit tree is read-only')
    return ORIGINAL['write_text'](path, *args, **kwargs)

def write_bytes(path, *args, **kwargs):
    if relative(path) is not None:
        raise PermissionError('audit tree is read-only')
    return ORIGINAL['write_bytes'](path, *args, **kwargs)

class Loader(importlib.abc.Loader):
    def __init__(self, key):
        self.key = key
    def create_module(self, spec):
        return None
    def exec_module(self, module):
        module.__file__ = str(REPO / self.key)
        exec(compile(blob(self.key), module.__file__, 'exec'), module.__dict__)

class Finder(importlib.abc.MetaPathFinder):
    def find_spec(self, fullname, path=None, target=None):
        key = 'scripts/' + fullname + '.py'
        if '.' not in fullname and key in TRACKED:
            return importlib.util.spec_from_loader(fullname, Loader(key))

def install():
    for name, function in [('read_text', read_text), ('read_bytes', read_bytes), ('exists', exists), ('is_file', is_file), ('is_dir', is_dir), ('glob', glob), ('rglob', lambda path, pattern: glob(path, pattern, True)), ('open', open_path), ('write_text', write_text), ('write_bytes', write_bytes)]:
        setattr(Path, name, function)
    sys.meta_path.insert(0, Finder())
```

## graph.py

```python
from pathlib import Path
import sys,json,copy,collections
sys.path.insert(0,str(Path.cwd()/'scripts'))
import build,blueprints,check_blueprint
RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7'
p=json.loads((Path.cwd()/'research/blueprint/packets'/f'{STEM}.json').read_text())
original=json.loads(Path(sys.argv[1]).read_text())
new={n['id']:n for n in p['nodes']}
root=Path.cwd()
a0=json.loads((root/"data/atlas.json").read_text())
packets,documents,definitions=blueprints.load_promoted(root)
otherparts=[(stem,q) for stem,q in packets if q.get("roadmapId")==RID and stem!=STEM]
assert otherparts, "must preserve other promoted roadmap parts"
keep=[x for x in packets if x[0]!=STEM]
documents[STEM]="research/blueprint/readmes/"+STEM+".md"
def assemble(candidate):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(STEM,candidate)]),copy.deepcopy(documents),copy.deepcopy(definitions))
 return build.assemble(require_distances=False)[0]
a=assemble(p);b=assemble(original)
world={}
for folder in ["data/decompositions","data/blueprints","research/blueprint/packets"]:
 for path in sorted((root/folder).glob("*.json")):
  q=json.loads(path.read_text())
  for n in q.get("nodes",[]):world.setdefault(n["id"],n)
world.update(new)
stages={x["id"]:x for x in a["stages"]}
stageids=set(stages)|set(check_blueprint.world()[1])
stageedges={(e["source"],e["target"]) for e in a["stageEdges"]}
def dag(vertices,edges):
 vertices=set(vertices)|{v for edge in edges for v in edge}
 out=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for source,target in edges:
  if target not in out[source]:out[source].add(target);indeg[target]+=1
 stack=[v for v,count in indeg.items() if count==0];count=0
 while stack:
  v=stack.pop();count+=1
  for w in out[v]:
   indeg[w]-=1
   if indeg[w]==0:stack.append(w)
 assert count==len(vertices),[v for v,count in indeg.items() if count][:15]
 return {"vertices":len(vertices),"edges":len(edges),"acyclic":True}
ownedges={(q,nid) for nid,node in new.items() for q in node.get("prerequisites",[]) if q in new}
stack=list(new);seen=set();dep=set();unresolved=set();baseref=set()
while stack:
 nid=stack.pop()
 if nid in seen:continue
 seen.add(nid)
 for q in world[nid].get("prerequisites",[]):
  if q.startswith(("mathlib:","tauceti:")) and q not in stageids:baseref.add(q);continue
  dep.add((q,nid))
  if q in world:stack.append(q)
  elif q not in stageids:unresolved.add(q)
assert not unresolved,sorted(unresolved)
dep|={(world[nid]["parentStageId"],nid) for nid in seen if world[nid].get("parentStageId") in stageids or world[nid].get("parentStageId") in world}
dep|={(request["supplier"],consumer) for request in p.get("requests",[]) for consumer in request.get("neededBy",[]) if consumer in new or consumer in stageids}
roadmap=next(r for r in a["roadmaps"] if r["id"]==RID)
expected_decl=len(new)+sum(len(q["nodes"]) for _,q in otherparts)
assert roadmap["blueprint"]["declarations"]==expected_decl,(roadmap["blueprint"],expected_decl)
assert not roadmap["blueprint"]["skippedLinks"] and not roadmap.get("pendingLinks",[])
assert stageedges=={(e["source"],e["target"]) for e in b["stageEdges"]}
def skips(atlas):
 return {r["id"]:(r.get("blueprint",{}).get("skippedLinks",[]),r.get("pendingLinks",[])) for r in atlas["roadmaps"] if r["id"]!=RID}
assert skips(a)==skips(b)
out=collections.defaultdict(set)
for source,target in stageedges:out[source].add(target)
def reachable(source,target):
 stack=[source];seen=set()
 while stack:
  v=stack.pop()
  if v==target:return True
  if v in seen:continue
  seen.add(v);stack.extend(out[v]-seen)
 return False
pairs={(e["source"],e["target"]) for e in a0["stageEdges"] if e["target"].startswith(RID+":")}
for node in p["nodes"]:
 for q in node.get("prerequisites",[]):
  if q in stageids and q not in world and q!=node["parentStageId"]:pairs.add((q,node["parentStageId"]))
for req in p.get("requests",[]):
 for consumer in req.get("neededBy",[]):
  if consumer in new:pairs.add((req["supplier"],new[consumer]["parentStageId"]))
  elif consumer in stageids:pairs.add((req["supplier"],consumer))
missingpairs={(s,t) for s,t in pairs if not reachable(s,t)}
oldout=collections.defaultdict(set)
for edge in b['stageEdges']:oldout[edge['source']].add(edge['target'])
def reachable0(source,target):
 stack=[source];seen=set()
 while stack:
  v=stack.pop()
  if v==target:return True
  if v in seen:continue
  seen.add(v);stack.extend(oldout[v]-seen)
 return False
assert missingpairs=={(s,t) for s,t in pairs if not reachable0(s,t)}
assert missingpairs=={('tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions',RID+':R03.4')}
assert any('LocalFieldsRamification layer 0 to R03.4' in gap['detail'] for gap in p['gaps'])
# Independently retain all accepted restructure links touching the whole roadmap.
acceptedpairs=set()
for path in (root/"research/blueprint/restructure").glob("*.result.json"):
 q=json.loads(path.read_text())
 if q.get("review",{}).get("status")!="accepted":continue
 for row in q.get("links",[]):
  if any(row.get(k,"").startswith(RID+":") for k in ["source","target"]):
   acceptedpairs.add((row["source"],row["target"]))
assert all(reachable(s,t) for s,t in acceptedpairs),[(s,t) for s,t in acceptedpairs if not reachable(s,t)]
report={"stageDAG":dag(stages,stageedges),"ownDAG":dag(new,ownedges),
 "combinedDAG":dag(set(stages)|seen,stageedges|dep),"reachableDeclarations":len(seen),
 "externalDeclarations":sorted(seen-set(new)),"reachableBaselineReferences":len(baseref),
 "unresolved":sorted(unresolved),"otherPartsRetained":[stem for stem,_ in otherparts],
 "partDeclarations":len(new),"partPlanets":sum("planet" in n for n in p["nodes"]),
 "roadmapDeclarations":roadmap["blueprint"]["declarations"],
 "requiredStagePairs":len(pairs),"requiredStagePairsReachable":len(pairs)-len(missingpairs),
 "inheritedMissingStagePairs":sorted(missingpairs),
 "acceptedRestructurePairs":len(acceptedpairs),"acceptedRestructurePairsReachable":len(acceptedpairs),
 "stageEdgesUnchanged":True,"otherSkippedPendingUnchanged":True,"ownSkippedPendingEmpty":True}
print(json.dumps(report,ensure_ascii=False,indent=2),flush=True)
```

## Successful normalized native.log

```text
'TauCeti.HilbertSamuel.monomial_mem_variableIdeal_pow_degree' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.order_lower_bound_of_mem_variableIdeal_pow' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.exists_degree_monomial_factorization' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.mem_variableIdeal_pow_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.jet_mk_eq_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.truncTotalAlgHom_ker' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.truncTotalAlgHom_surjective' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.totalJetEquiv' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.totalJetEquiv_mk' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.totalJetEquiv_symm_mk' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.totalJetEquiv_mul' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.totalJetCoefficients' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.totalJetCoefficients_mk' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.totalJetCoefficients_bijective' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.totalJetCoordinates' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.totalJetCoordinates_mk' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.totalJetCoordinates_symm_apply' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.totalJetBasis' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.totalJetBasis_repr_mk' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.totalJetBasis_apply' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.totalJetBasis_finite' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeJetIndex_card' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeTotalJet_finrank' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.totalJetCoefficients_monomial' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.totalJetCoefficients_eq_zero_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.totalJetCoordinates_symm_coeff' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.pow_mul_denominator' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.quotientMulMap' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.quotientMulMap_apply' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.principalQuotientProjection' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.principalQuotientProjection_apply' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.quotientMulMap_exact' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.quotientMulMap_injective_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.principalQuotientProjection_bijective' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.mul_mem_variableIdeal_pow_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.shiftedJet_denominator' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.shiftedJetMap' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.shiftedJetMap_apply' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.jetProjection' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.jetProjection_apply' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.shiftedJetMap_eq_quotientMulMap' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.jetProjection_eq_principalQuotientProjection' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.shiftedJetMap_injective' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.shiftedJetMap_exact' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.jetProjection_below_order' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.seriesResidueEquiv' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.seriesResidueEquiv_residue' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.seriesResidueEquiv_symm' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.seriesResidueEquiv_algebraMap' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.seriesResidue_coeff_surjective' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.seriesModule_length_eq_coeff_length' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.seriesModule_length_eq_finrank' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.function_ringQuotient' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.function_ringQuotient_of_le' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.function_ringQuotient_antitone' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.function' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeCurve_jet_length' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.equationJet_finite' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.equationJet_length_eq_finrank' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.totalJet_length_eq_finrank' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeTotalJet_length' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeEquationJet_length_balance' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeEquationJet_length' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeCurve_function' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeZeroEquation_function' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.quotient_length_succ' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeJetCount_defect' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeJetCount_step' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeCurve_gradedFunction' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeCurve_postulation_defect' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeCurve_postulation_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeCurve_graded_stable_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeCurve_postulation_predecessor' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeZeroEquation_gradedFunction' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.CurvePostulationTests.char_two_thresholds' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.CurvePostulationTests.negative_polynomial' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.CurvePostulationTests.sharp_predecessor' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.CurvePostulationTests.graded_threshold' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.CurvePostulationTests.cumulative_threshold' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.CurvePostulationTests.unit_graded' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.CurvePostulationTests.smooth_graded' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.CurvePostulationTests.zero_equation_growth' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.CurvePostulationTests.unit_defect' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.CurvePostulationTests.small_cutoff_defect' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.planeCurvePolynomial' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeCurvePolynomial_eval' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeCurvePolynomial_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeCurvePolynomial_natDegree' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeCurvePolynomial_leadingCoeff' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeCurvePolynomial_factorial_leadingCoeff' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.planeSurfacePolynomial' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeSurfacePolynomial_eval' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeSurfacePolynomial_natDegree' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeSurfacePolynomial_leadingCoeff' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeSurfacePolynomial_factorial_leadingCoeff' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.planeCurvePolynomial_eval_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeCurvePolynomial_tail' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeCurvePolynomial_unique' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeCurve_existsUnique_polynomial' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeZeroEquation_polynomial_eval' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeZeroEquation_polynomial_unique' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.planeZeroEquation_existsUnique_polynomial' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.CurvePolynomialTests.quartic_formula' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.CurvePolynomialTests.unit_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.CurvePolynomialTests.smooth_polynomial' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.CurvePolynomialTests.characteristic_two_unique' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.CurvePolynomialTests.sharp_tail' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.CurvePolynomialTests.cumulative_not_graded' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.CurvePolynomialTests.surface_shape' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.CurvePolynomialTests.surface_all_lengths' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.CurvePolynomialTests.zero_and_unit_quotients' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.CurvePolynomialTests.surface_unique' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.CurvePolynomialTests.coefficient_characteristic_is_not_length' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.homogeneous_mem_variableIdeal_pow' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.homogeneousComponent_eq_zero_iff_mem_next' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.mem_principal_add_next_iff_initial' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.mem_principal_add_next_below_order' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.curveDegreeProjection' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.curveDegreeProjection_apply' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.curveDegreeProjection_eq_zero_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.curveDegreeProjection_kernel' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.curveDegreeProjection_below_order' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.curveDegreeProjection_zero_equation' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.InitialRelationTests.equation_order_boundary' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.InitialRelationTests.zero_input' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.InitialRelationTests.unit_equation' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.InitialRelationTests.zero_equation_survives' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.InitialRelationTests.nonreduced_survives' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.InitialRelationTests.nonreduced_square_vanishes' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.homogeneousPolynomial' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.homogeneousPolynomial_coeff' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.coe_homogeneousPolynomial' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.homogeneousPolynomial_isHomogeneous' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.homogeneousPolynomial_coe' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.coe_isHomogeneous_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.homogeneousPolynomial_coe_of_homogeneous' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.homogeneous_existsUnique_polynomial' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.homogeneousPolynomial_eq_zero_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.homogeneousPolynomial_eq_truncTotal' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.homogeneousPolynomial_ne_zero_of_order' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.homogeneousPolynomial_mul_of_le_order' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.homogeneousPolynomial_component' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.curveDegreeProjection_polynomial_kernel' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.curveDegreeProjection_polynomial_below_order' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.curveDegreeProjection_polynomial_zero_equation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.HomogeneousPolynomialTests.zero_input' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.HomogeneousPolynomialTests.native_polynomial' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.HomogeneousPolynomialTests.no_variables' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.HomogeneousPolynomialTests.exact_degree_not_truncation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.HomogeneousPolynomialTests.not_multiplicative_in_fixed_degree' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.HomogeneousPolynomialTests.nilpotent_coefficients' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.homogeneousLift' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.homogeneousLift_apply' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.degreePolynomial' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.degreePolynomial_apply' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.degreePolynomial_lift' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.degreePolynomial_surjective' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.degreePolynomial_eq_zero_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.degreePolynomial_ker' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.ambientDegreeEquiv' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.ambientDegreeEquiv_mk' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.ambientDegreeEquiv_symm' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.homogeneousCurveProjection' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.homogeneousCurveProjection_apply' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.curveDegreeProjection_factor' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.homogeneousCurveProjection_range' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.homogeneousCurveProjection_kernel' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.homogeneousCurveProjection_below_order' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.homogeneousCurveQuotientEquiv' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.homogeneousCurveQuotientEquiv_mk' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.DegreeQuotientTests.lift_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.DegreeQuotientTests.lift_variable' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.DegreeQuotientTests.lift_torsion' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.DegreeQuotientTests.degree_lift' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.DegreeQuotientTests.degree_constant' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.DegreeQuotientTests.degree_next' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.DegreeQuotientTests.ambient_roundtrip' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.DegreeQuotientTests.ambient_inverse' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.DegreeQuotientTests.ambient_torsion' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.DegreeQuotientTests.curve_unit' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.DegreeQuotientTests.curve_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.DegreeQuotientTests.characteristic_two_killed' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.DegreeQuotientTests.quotient_value' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.DegreeQuotientTests.quotient_inverse' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.DegreeQuotientTests.quotient_zero_equation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.curveAdicIdeal_pow' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.curveJetEquiv' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.curveJetEquiv_mk' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.curveJetEquiv_image_mem' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.curveJetImageMap' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.curveJetImageMap_apply' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.curveJetImageMap_bijective' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.curveJetImageEquiv' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.curveJetImageEquiv_mk' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.nativeCurveDegreeEquiv' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.nativeCurveDegreeEquiv_mk' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.nativeCurveDegreeEquiv_symm' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.homogeneousNativeCurveDegreeEquiv' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.homogeneousNativeCurveDegreeEquiv_mk' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.nativeCurveDegreeEquiv_mk_eq_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.homogeneousNativeCurveDegreeEquiv_eq_zero' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.nativeCurveDegree_principal_kernel' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.nativeCurveDegree_below_order' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.NativeCurveDegreeTests.jet_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.NativeCurveDegreeTests.jet_unit' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.NativeCurveDegreeTests.jet_inverse' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.NativeCurveDegreeTests.image_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.NativeCurveDegreeTests.image_representative' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.NativeCurveDegreeTests.image_inverse' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.NativeCurveDegreeTests.native_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.NativeCurveDegreeTests.native_roundtrip' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.NativeCurveDegreeTests.homogeneous_roundtrip' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.NativeCurveDegreeTests.zero_equation' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.NativeCurveDegreeTests.unit_equation' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.HilbertSamuel.NativeCurveDegreeTests.no_variables_constant' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.NativeCurveDegreeTests.nilpotent_coeff_survives' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.NativeCurveDegreeTests.characteristic_two_repeated_killed' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.HilbertSamuel.NativeCurveDegreeTests.characteristic_two_repeated_survives' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
ELAPSED 19.91 RSS 3706408 EXIT 0
```

## Successful normalized canonical.log

```text
Submodule.IsQuotientEquivQuotientPrime.{u, v} {A : Type u} [CommRing A] {M : Type v} [AddCommGroup M] [Module A M]
  (N₁ N₂ : Submodule A M) : Prop
Submodule.isQuotientEquivQuotientPrime_iff.{u, v} {A : Type u} [CommRing A] {M : Type v} [AddCommGroup M] [Module A M]
  {N₁ N₂ : Submodule A M} : N₁.IsQuotientEquivQuotientPrime N₂ ↔ ∃ x, (⊥.colon {N₁.mkQ x}).IsPrime ∧ N₂ = N₁ ⊔ A ∙ x
IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime.{u, v} (A : Type u) [CommRing A] (M : Type v)
  [AddCommGroup M] [Module A M] [IsNoetherianRing A] [Module.Finite A M] : ∃ s, s.head = ⊥ ∧ s.last = ⊤
IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime.{u, v} (A : Type u) [CommRing A] [IsNoetherianRing A]
  ⦃M : Type v⦄ [AddCommGroup M] [Module A M] (x✝ : Module.Finite A M)
  {motive : (N : Type v) → [inst : AddCommGroup N] → [inst_1 : Module A N] → [Module.Finite A N] → Prop}
  (subsingleton :
    ∀ (N : Type v) [inst : AddCommGroup N] [inst_1 : Module A N] [inst_2 : Module.Finite A N] [Subsingleton N],
      motive N)
  (quotient :
    ∀ (N : Type v) [inst : AddCommGroup N] [inst_1 : Module A N] [inst_2 : Module.Finite A N] (p : PrimeSpectrum A)
      (a : N ≃ₗ[A] A ⧸ p.asIdeal), motive N)
  (exact :
    ∀ (N₁ : Type v) [inst : AddCommGroup N₁] [inst_1 : Module A N₁] [inst_2 : Module.Finite A N₁] (N₂ : Type v)
      [inst_3 : AddCommGroup N₂] [inst_4 : Module A N₂] [inst_5 : Module.Finite A N₂] (N₃ : Type v)
      [inst_6 : AddCommGroup N₃] [inst_7 : Module A N₃] [inst_8 : Module.Finite A N₃] (f : N₁ →ₗ[A] N₂)
      (g : N₂ →ₗ[A] N₃),
      Function.Injective ⇑f → Function.Surjective ⇑g → Function.Exact ⇑f ⇑g → motive N₁ → motive N₃ → motive N₂) :
  motive M
associatedPrimes.finite.{u, v} (A : Type u) [CommRing A] (M : Type v) [AddCommGroup M] [Module A M] [IsNoetherianRing A]
  [Module.Finite A M] : (associatedPrimes A M).Finite
IsDiscreteValuationRing.irreducible_iff_uniformizer.{u} {R : Type u} [CommRing R] [IsDomain R]
  [IsDiscreteValuationRing R] (ϖ : R) : Irreducible ϖ ↔ IsLocalRing.maximalIdeal R = Ideal.span {ϖ}
IsDiscreteValuationRing.iff_pid_with_one_nonzero_prime.{u} (R : Type u) [CommRing R] [IsDomain R] :
  IsDiscreteValuationRing R ↔ IsPrincipalIdealRing R ∧ ∃! P, P ≠ ⊥ ∧ P.IsPrime
IsDiscreteValuationRing.exists_irreducible.{u} (R : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R] :
  ∃ ϖ, Irreducible ϖ
IsDiscreteValuationRing.length_quotient_pow_maximalIdeal.{u_1} (R : Type u_1) [CommRing R] [IsDomain R]
  [IsDiscreteValuationRing R] (n : ℕ) : Module.length R (R ⧸ IsLocalRing.maximalIdeal R ^ n) = ↑n
Module.length_ne_top_iff.{u_1, u_2} {R : Type u_1} {M : Type u_2} [Ring R] [AddCommGroup M] [Module R M] :
  Module.length R M ≠ ⊤ ↔ IsFiniteLength R M
isFiniteLength_iff_isNoetherian_isArtinian.{u_1, u_2} {R : Type u_1} [Ring R] {M : Type u_2} [AddCommGroup M]
  [Module R M] : IsFiniteLength R M ↔ IsNoetherian R M ∧ IsArtinian R M
isArtinian_of_tower.{u_1, u_2, u_3} (R : Type u_1) {S : Type u_2} {M : Type u_3} [Semiring R] [Semiring S]
  [AddCommMonoid M] [SMul R S] [Module S M] [Module R M] [IsScalarTower R S M] (h : IsArtinian R M) : IsArtinian S M
IsArtinianRing.of_finite.{u_1, u_2} (R : Type u_1) (S : Type u_2) [Ring R] [Ring S] [Module R S] [IsScalarTower R S S]
  [IsArtinianRing R] [Module.Finite R S] : IsArtinianRing S
IsArtinianRing.isMaximal_of_isPrime.{u_2} {R : Type u_2} [CommRing R] (p : Ideal R) [p.IsPrime] [IsArtinianRing R] :
  p.IsMaximal
Ring.krullDimLE_zero_iff.{u_1} {R : Type u_1} [CommSemiring R] :
  Ring.KrullDimLE 0 R ↔ ∀ (I : Ideal R), I.IsPrime → I.IsMaximal
Ring.krullDimLE_iff.{u_1} {R : Type u_1} [CommSemiring R] {n : ℕ} : Ring.KrullDimLE n R ↔ ringKrullDim R ≤ ↑n
nilpotent_iff_mem_prime.{u_1} {R : Type u_1} [CommSemiring R] {x : R} :
  IsNilpotent x ↔ ∀ (J : Ideal R), J.IsPrime → x ∈ J
Algebra.finite_iff_isIntegral_and_finiteType.{u_1, u_2} {R : Type u_1} {A : Type u_2} [CommRing R] [CommRing A]
  [Algebra R A] : Module.Finite R A ↔ Algebra.IsIntegral R A ∧ Algebra.FiniteType R A
IsAlgClosed.lift.{u, v, w} {M : Type w} [Field M] [IsAlgClosed M] {R : Type u} [CommRing R] [IsDomain R] {S : Type v}
  [CommRing S] [IsDomain S] [Algebra R S] [Algebra R M] [Module.IsTorsionFree R S] [Module.IsTorsionFree R M]
  [Algebra.IsAlgebraic R S] : S →ₐ[R] M
Module.Finite.exists_fin'.{u_1, u_2} (R : Type u_1) (M : Type u_2) [Semiring R] [AddCommMonoid M] [Module R M]
  [Module.Finite R M] : ∃ n f, Function.Surjective ⇑f
Algebra.IsIntegral.inv_mem.{u_1, u_2} {R : Type u_1} {S : Type u_2} [Field R] [DivisionRing S] [Algebra R S] {x : S}
  {A : Subalgebra R S} [Algebra.IsIntegral R ↥A] (hx : x ∈ A) : x⁻¹ ∈ A
IsIntegralClosure.finite.{u_1, u_2, u_3, u_4} (A : Type u_1) (K : Type u_2) [CommRing A] [Field K] [Algebra A K]
  [IsFractionRing A K] (L : Type u_3) [Field L] (C : Type u_4) [CommRing C] [Algebra K L] [Algebra A L]
  [IsScalarTower A K L] [Algebra C L] [IsIntegralClosure C A L] [Algebra A C] [IsScalarTower A C L]
  [FiniteDimensional K L] [IsDomain A] [Algebra.IsSeparable K L] [IsIntegrallyClosed A] [IsNoetherianRing A] :
  Module.Finite A C
integralClosure.isIntegral.{u_1, u_2} {R : Type u_1} {A : Type u_2} [CommRing R] [CommRing A] [Algebra R A]
  (x : ↥(integralClosure R A)) : IsIntegral R x
Algebra.IsIntegral.tower_top.{u_1, u_4, u_5} (R : Type u_1) {S : Type u_4} {T : Type u_5} [CommRing R] [CommRing S]
  [CommRing T] [Algebra R S] [Algebra R T] [Algebra S T] [IsScalarTower R S T] [h : Algebra.IsIntegral R T] :
  Algebra.IsIntegral S T
RingHom.IsIntegral.isLocalHom.{u_1, u_4} {R : Type u_1} {S : Type u_4} [CommRing R] [CommRing S] {f : R →+* S}
  (hf : f.IsIntegral) (inj : Function.Injective ⇑f) : IsLocalHom f
IsLocalHom.of_surjective.{u_1, u_2} {R : Type u_1} {S : Type u_2} [CommRing R] [CommRing S] [Nontrivial S]
  [IsLocalRing R] (f : R →+* S) (hf : Function.Surjective ⇑f) : IsLocalHom f
RingHom.isLocalHom_comp.{u_1, u_2, u_3} {R : Type u_1} {S : Type u_2} {T : Type u_3} [Semiring R] [Semiring S]
  [Semiring T] (g : S →+* T) (f : R →+* S) [IsLocalHom g] [IsLocalHom f] : IsLocalHom (g.comp f)
Canonical.lean:188:0: warning: declaration uses `sorry`
Canonical.lean:194:0: warning: declaration uses `sorry`
Canonical.lean:202:0: warning: declaration uses `sorry`
Canonical.lean:228:8: warning: declaration uses `sorry`
Canonical.lean:236:8: warning: declaration uses `sorry`
Canonical.lean:246:8: warning: declaration uses `sorry`
Canonical.lean:257:8: warning: declaration uses `sorry`
Canonical.lean:271:8: warning: declaration uses `sorry`
Canonical.lean:287:0: warning: declaration uses `sorry`
Canonical.lean:292:0: warning: declaration uses `sorry`
Canonical.lean:297:0: warning: declaration uses `sorry`
Canonical.lean:301:0: warning: declaration uses `sorry`
Canonical.lean:328:8: warning: declaration uses `sorry`
Canonical.lean:332:8: warning: declaration uses `sorry`
Canonical.lean:336:8: warning: declaration uses `sorry`
Canonical.lean:341:8: warning: declaration uses `sorry`
Canonical.lean:348:8: warning: declaration uses `sorry`
Canonical.lean:358:8: warning: declaration uses `sorry`
Canonical.lean:368:0: warning: declaration uses `sorry`
Canonical.lean:371:0: warning: declaration uses `sorry`
Canonical.lean:375:0: warning: declaration uses `sorry`
Canonical.lean:379:0: warning: declaration uses `sorry`
Canonical.lean:385:0: warning: declaration uses `sorry`
Canonical.lean:424:8: warning: declaration uses `sorry`
Canonical.lean:427:8: warning: declaration uses `sorry`
Canonical.lean:431:8: warning: declaration uses `sorry`
Canonical.lean:439:8: warning: declaration uses `sorry`
Canonical.lean:444:8: warning: declaration uses `sorry`
Canonical.lean:452:8: warning: declaration uses `sorry`
Canonical.lean:462:8: warning: declaration uses `sorry`
Canonical.lean:468:8: warning: declaration uses `sorry`
Canonical.lean:474:8: warning: declaration uses `sorry`
Canonical.lean:478:8: warning: declaration uses `sorry`
Canonical.lean:484:8: warning: declaration uses `sorry`
Canonical.lean:503:8: warning: declaration uses `sorry`
Canonical.lean:513:8: warning: declaration uses `sorry`
Canonical.lean:519:8: warning: declaration uses `sorry`
Canonical.lean:525:8: warning: declaration uses `sorry`
Canonical.lean:535:8: warning: declaration uses `sorry`
Canonical.lean:541:8: warning: declaration uses `sorry`
Canonical.lean:547:8: warning: declaration uses `sorry`
Canonical.lean:552:8: warning: declaration uses `sorry`
Canonical.lean:561:8: warning: declaration uses `sorry`
Canonical.lean:581:8: warning: declaration uses `sorry`
Canonical.lean:599:8: warning: declaration uses `sorry`
Canonical.lean:612:0: warning: declaration uses `sorry`
Canonical.lean:616:0: warning: declaration uses `sorry`
Canonical.lean:621:0: warning: declaration uses `sorry`
Canonical.lean:624:0: warning: declaration uses `sorry`
Canonical.lean:628:0: warning: declaration uses `sorry`
Canonical.lean:633:0: warning: declaration uses `sorry`
Canonical.lean:646:0: warning: declaration uses `sorry`
Canonical.lean:655:0: warning: declaration uses `sorry`
Canonical.lean:661:0: warning: declaration uses `sorry`
Canonical.lean:666:0: warning: declaration uses `sorry`
Canonical.lean:672:0: warning: declaration uses `sorry`
Canonical.lean:678:0: warning: declaration uses `sorry`
Canonical.lean:686:0: warning: declaration uses `sorry`
Canonical.lean:693:0: warning: declaration uses `sorry`
Canonical.lean:705:0: warning: declaration uses `sorry`
Canonical.lean:710:0: warning: declaration uses `sorry`
Canonical.lean:759:8: warning: declaration uses `sorry`
Canonical.lean:764:8: warning: declaration uses `sorry`
Canonical.lean:767:8: warning: declaration uses `sorry`
Canonical.lean:774:8: warning: declaration uses `sorry`
Canonical.lean:776:8: warning: declaration uses `sorry`
Canonical.lean:779:8: warning: declaration uses `sorry`
Canonical.lean:783:8: warning: declaration uses `sorry`
Canonical.lean:786:8: warning: declaration uses `sorry`
Canonical.lean:792:8: warning: declaration uses `sorry`
Canonical.lean:795:8: warning: declaration uses `sorry`
Canonical.lean:799:8: warning: declaration uses `sorry`
Canonical.lean:803:0: warning: declaration uses `sorry`
Canonical.lean:805:0: warning: declaration uses `sorry`
Canonical.lean:810:0: warning: declaration uses `sorry`
Canonical.lean:813:0: warning: declaration uses `sorry`
Canonical.lean:815:0: warning: declaration uses `sorry`
Canonical.lean:819:0: warning: declaration uses `sorry`
Canonical.lean:828:0: warning: declaration uses `sorry`
Canonical.lean:832:0: warning: declaration uses `sorry`
Canonical.lean:846:15: warning: declaration uses `sorry`
Canonical.lean:854:8: warning: declaration uses `sorry`
Canonical.lean:858:8: warning: declaration uses `sorry`
Canonical.lean:861:8: warning: declaration uses `sorry`
Canonical.lean:863:8: warning: declaration uses `sorry`
Canonical.lean:866:8: warning: declaration uses `sorry`
Canonical.lean:873:0: warning: declaration uses `sorry`
Canonical.lean:875:0: warning: declaration uses `sorry`
Canonical.lean:878:0: warning: declaration uses `sorry`
Canonical.lean:880:0: warning: declaration uses `sorry`
Canonical.lean:885:8: warning: declaration uses `sorry`
Canonical.lean:892:8: warning: declaration uses `sorry`
Canonical.lean:900:8: warning: declaration uses `sorry`
Canonical.lean:907:8: warning: declaration uses `sorry`
Canonical.lean:917:8: warning: declaration uses `sorry`
Canonical.lean:923:8: warning: declaration uses `sorry`
Canonical.lean:926:8: warning: declaration uses `sorry`
Canonical.lean:934:0: warning: declaration uses `sorry`
Canonical.lean:941:0: warning: declaration uses `sorry`
Canonical.lean:949:0: warning: declaration uses `sorry`
Canonical.lean:954:8: warning: declaration uses `sorry`
Canonical.lean:959:8: warning: declaration uses `sorry`
Canonical.lean:969:8: warning: declaration uses `sorry`
Canonical.lean:976:8: warning: declaration uses `sorry`
Canonical.lean:993:8: warning: declaration uses `sorry`
Canonical.lean:1008:8: warning: declaration uses `sorry`
Canonical.lean:1033:18: warning: declaration uses `sorry`
Canonical.lean:1037:8: warning: declaration uses `sorry`
Canonical.lean:1059:8: warning: declaration uses `sorry`
Canonical.lean:1071:8: warning: declaration uses `sorry`
Canonical.lean:1076:8: warning: declaration uses `sorry`
Canonical.lean:1084:0: warning: declaration uses `sorry`
Canonical.lean:1105:8: warning: declaration uses `sorry`
Canonical.lean:1113:8: warning: declaration uses `sorry`
Canonical.lean:1118:8: warning: declaration uses `sorry`
Canonical.lean:1123:8: warning: declaration uses `sorry`
Canonical.lean:1128:0: warning: declaration uses `sorry`
Canonical.lean:1132:0: warning: declaration uses `sorry`
Canonical.lean:1138:0: warning: declaration uses `sorry`
Canonical.lean:1141:0: warning: declaration uses `sorry`
Canonical.lean:1173:8: warning: declaration uses `sorry`
Canonical.lean:1176:8: warning: declaration uses `sorry`
Canonical.lean:1179:8: warning: declaration uses `sorry`
Canonical.lean:1183:8: warning: declaration uses `sorry`
Canonical.lean:1187:8: warning: declaration uses `sorry`
Canonical.lean:1193:8: warning: declaration uses `sorry`
Canonical.lean:1198:8: warning: declaration uses `sorry`
Canonical.lean:1203:8: warning: declaration uses `sorry`
Canonical.lean:1220:8: warning: declaration uses `sorry`
Canonical.lean:1222:8: warning: declaration uses `sorry`
Canonical.lean:1225:8: warning: declaration uses `sorry`
Canonical.lean:1228:8: warning: declaration uses `sorry`
Canonical.lean:1231:8: warning: declaration uses `sorry`
Canonical.lean:1234:8: warning: declaration uses `sorry`
Canonical.lean:1238:8: warning: declaration uses `sorry`
Canonical.lean:1244:8: warning: declaration uses `sorry`
Canonical.lean:1249:8: warning: declaration uses `sorry`
Canonical.lean:1267:0: warning: declaration uses `sorry`
Canonical.lean:1272:0: warning: declaration uses `sorry`
Canonical.lean:1277:0: warning: declaration uses `sorry`
Canonical.lean:1281:0: warning: declaration uses `sorry`
Canonical.lean:1287:0: warning: declaration uses `sorry`
Canonical.lean:1301:0: warning: declaration uses `sorry`
Canonical.lean:1306:0: warning: declaration uses `sorry`
Canonical.lean:1311:0: warning: declaration uses `sorry`
Canonical.lean:1316:0: warning: declaration uses `sorry`
Canonical.lean:1323:0: warning: declaration uses `sorry`
Canonical.lean:1328:0: warning: declaration uses `sorry`
Canonical.lean:1331:0: warning: declaration uses `sorry`
Canonical.lean:1334:0: warning: declaration uses `sorry`
Canonical.lean:1356:6: warning: declaration uses `sorry`
Canonical.lean:1357:6: warning: declaration uses `sorry`
Canonical.lean:1362:6: warning: declaration uses `sorry`
Canonical.lean:1366:18: warning: declaration uses `sorry`
Canonical.lean:1385:6: warning: declaration uses `sorry`
Canonical.lean:1398:6: warning: declaration uses `sorry`
Canonical.lean:1405:6: warning: declaration uses `sorry`
Canonical.lean:1415:6: warning: declaration uses `sorry`
Canonical.lean:1422:6: warning: declaration uses `sorry`
Canonical.lean:1428:6: warning: declaration uses `sorry`
Canonical.lean:1433:6: warning: declaration uses `sorry`
Canonical.lean:1438:0: warning: declaration uses `sorry`
Canonical.lean:1440:0: warning: declaration uses `sorry`
Canonical.lean:1442:0: warning: declaration uses `sorry`
Canonical.lean:1446:0: warning: declaration uses `sorry`
Canonical.lean:1450:0: warning: declaration uses `sorry`
Canonical.lean:1453:0: warning: declaration uses `sorry`
Canonical.lean:1456:0: warning: declaration uses `sorry`
Canonical.lean:1458:0: warning: declaration uses `sorry`
Canonical.lean:1462:0: warning: declaration uses `sorry`
Canonical.lean:1465:0: warning: declaration uses `sorry`
Canonical.lean:1468:0: warning: declaration uses `sorry`
Canonical.lean:1472:0: warning: declaration uses `sorry`
Canonical.lean:1511:9: warning: declaration uses `sorry`
Canonical.lean:1514:9: warning: declaration uses `sorry`
Canonical.lean:1521:6: warning: declaration uses `sorry`
Canonical.lean:1523:6: warning: declaration uses `sorry`
Canonical.lean:1526:6: warning: declaration uses `sorry`
Canonical.lean:1532:18: warning: declaration uses `sorry`
Canonical.lean:1538:6: warning: declaration uses `sorry`
Canonical.lean:1542:6: warning: declaration uses `sorry`
Canonical.lean:1545:6: warning: declaration uses `sorry`
Canonical.lean:1549:6: warning: declaration uses `sorry`
Canonical.lean:1565:6: warning: declaration uses `sorry`
Canonical.lean:1567:6: warning: declaration uses `sorry`
Canonical.lean:1573:6: warning: declaration uses `sorry`
Canonical.lean:1583:6: warning: declaration uses `sorry`
Canonical.lean:1589:6: warning: declaration uses `sorry`
Canonical.lean:1594:6: warning: declaration uses `sorry`
Canonical.lean:1599:6: warning: declaration uses `sorry`
Canonical.lean:1603:6: warning: declaration uses `sorry`
Canonical.lean:1607:6: warning: declaration uses `sorry`
Canonical.lean:1624:0: warning: declaration uses `sorry`
Canonical.lean:1626:0: warning: declaration uses `sorry`
Canonical.lean:1628:0: warning: declaration uses `sorry`
Canonical.lean:1633:0: warning: declaration uses `sorry`
Canonical.lean:1635:0: warning: declaration uses `sorry`
Canonical.lean:1639:0: warning: declaration uses `sorry`
Canonical.lean:1647:0: warning: declaration uses `sorry`
Canonical.lean:1652:0: warning: declaration uses `sorry`
Canonical.lean:1656:0: warning: declaration uses `sorry`
Canonical.lean:1661:0: warning: declaration uses `sorry`
Canonical.lean:1666:0: warning: declaration uses `sorry`
Canonical.lean:1699:6: warning: declaration uses `sorry`
Canonical.lean:1704:9: warning: declaration uses `sorry`
Canonical.lean:1717:6: warning: declaration uses `sorry`
Canonical.lean:1721:6: warning: declaration uses `sorry`
Canonical.lean:1747:6: warning: declaration uses `sorry`
Canonical.lean:1752:9: warning: declaration uses `sorry`
Canonical.lean:1757:9: warning: declaration uses `sorry`
Canonical.lean:1770:6: warning: declaration uses `sorry`
Canonical.lean:1779:6: warning: declaration uses `sorry`
Canonical.lean:1783:6: warning: declaration uses `sorry`
Canonical.lean:1789:0: warning: declaration uses `sorry`
Canonical.lean:1793:0: warning: declaration uses `sorry`
Canonical.lean:1796:0: warning: declaration uses `sorry`
Canonical.lean:1798:0: warning: declaration uses `sorry`
Canonical.lean:1800:0: warning: declaration uses `sorry`
Canonical.lean:1803:0: warning: declaration uses `sorry`
Canonical.lean:1807:0: warning: declaration uses `sorry`
Canonical.lean:1811:0: warning: declaration uses `sorry`
Canonical.lean:1814:0: warning: declaration uses `sorry`
Canonical.lean:1817:0: warning: declaration uses `sorry`
Canonical.lean:1820:0: warning: declaration uses `sorry`
Canonical.lean:1824:0: warning: declaration uses `sorry`
Canonical.lean:1843:6: warning: declaration uses `sorry`
Canonical.lean:1848:6: warning: declaration uses `sorry`
Canonical.lean:1852:6: warning: declaration uses `sorry`
Canonical.lean:1859:6: warning: declaration uses `sorry`
Canonical.lean:1863:6: warning: declaration uses `sorry`
Canonical.lean:1892:6: warning: declaration uses `sorry`
Canonical.lean:1897:6: warning: declaration uses `sorry`
Canonical.lean:1904:6: warning: declaration uses `sorry`
Canonical.lean:1910:0: warning: declaration uses `sorry`
Canonical.lean:1930:0: warning: declaration uses `sorry`
Canonical.lean:1948:0: warning: declaration uses `sorry`
Canonical.lean:1957:0: warning: declaration uses `sorry`
Canonical.lean:1976:6: warning: declaration uses `sorry`
Canonical.lean:1980:4: warning: declaration uses `sorry`
Canonical.lean:1984:6: warning: declaration uses `sorry`
Canonical.lean:1988:6: warning: declaration uses `sorry`
Canonical.lean:1993:6: warning: declaration uses `sorry`
Canonical.lean:1999:4: warning: declaration uses `sorry`
Canonical.lean:2002:6: warning: declaration uses `sorry`
Canonical.lean:2006:6: warning: declaration uses `sorry`
Canonical.lean:2011:6: warning: declaration uses `sorry`
Canonical.lean:2014:6: warning: declaration uses `sorry`
Canonical.lean:2019:0: warning: declaration uses `sorry`
Canonical.lean:2025:0: warning: declaration uses `sorry`
Canonical.lean:2032:0: warning: declaration uses `sorry`
Canonical.lean:2040:0: warning: declaration uses `sorry`
Canonical.lean:2046:0: warning: declaration uses `sorry`
Canonical.lean:2052:0: warning: declaration uses `sorry`
Canonical.lean:2060:0: warning: declaration uses `sorry`
Canonical.lean:2067:0: warning: declaration uses `sorry`
Canonical.lean:2072:0: warning: declaration uses `sorry`
Canonical.lean:2090:15: warning: declaration uses `sorry`
Canonical.lean:2093:4: warning: declaration uses `sorry`
Canonical.lean:2095:6: warning: declaration uses `sorry`
Canonical.lean:2099:6: warning: declaration uses `sorry`
Canonical.lean:2103:6: warning: declaration uses `sorry`
Canonical.lean:2107:6: warning: declaration uses `sorry`
Canonical.lean:2110:6: warning: declaration uses `sorry`
Canonical.lean:2114:6: warning: declaration uses `sorry`
Canonical.lean:2120:0: warning: declaration uses `sorry`
Canonical.lean:2127:0: warning: declaration uses `sorry`
Canonical.lean:2133:0: warning: declaration uses `sorry`
Canonical.lean:2139:0: warning: declaration uses `sorry`
Canonical.lean:2143:0: warning: declaration uses `sorry`
Canonical.lean:2147:0: warning: declaration uses `sorry`
Canonical.lean:2163:6: warning: declaration uses `sorry`
Canonical.lean:2167:6: warning: declaration uses `sorry`
Canonical.lean:2173:0: warning: declaration uses `sorry`
Canonical.lean:2188:6: warning: declaration uses `sorry`
Canonical.lean:2196:6: warning: declaration uses `sorry`
Canonical.lean:2201:6: warning: declaration uses `sorry`
Canonical.lean:2207:6: warning: declaration uses `sorry`
Canonical.lean:2213:6: warning: declaration uses `sorry`
Canonical.lean:2218:6: warning: declaration uses `sorry`
Canonical.lean:2225:6: warning: declaration uses `sorry`
Canonical.lean:2232:6: warning: declaration uses `sorry`
Canonical.lean:2241:6: warning: declaration uses `sorry`
Canonical.lean:2251:0: warning: declaration uses `sorry`
Canonical.lean:2260:0: warning: declaration uses `sorry`
Canonical.lean:2269:0: warning: declaration uses `sorry`
Canonical.lean:2278:0: warning: declaration uses `sorry`
Canonical.lean:2292:0: warning: declaration uses `sorry`
Canonical.lean:2302:0: warning: declaration uses `sorry`
Canonical.lean:2318:8: warning: declaration uses `sorry`
Canonical.lean:2324:8: warning: declaration uses `sorry`
Canonical.lean:2331:8: warning: declaration uses `sorry`
Canonical.lean:2337:0: warning: declaration uses `sorry`
Canonical.lean:2342:0: warning: declaration uses `sorry`
Canonical.lean:2347:0: warning: declaration uses `sorry`
Canonical.lean:2352:0: warning: declaration uses `sorry`
Canonical.lean:2359:0: warning: declaration uses `sorry`
Canonical.lean:2367:0: warning: declaration uses `sorry`
Canonical.lean:2379:6: warning: declaration uses `sorry`
Canonical.lean:2385:4: warning: declaration uses `sorry`
Canonical.lean:2390:6: warning: declaration uses `sorry`
Canonical.lean:2395:4: warning: declaration uses `sorry`
Canonical.lean:2399:6: warning: declaration uses `sorry`
Canonical.lean:2404:6: warning: declaration uses `sorry`
Canonical.lean:2411:6: warning: declaration uses `sorry`
Canonical.lean:2417:6: warning: declaration uses `sorry`
Canonical.lean:2421:0: warning: declaration uses `sorry`
Canonical.lean:2425:0: warning: declaration uses `sorry`
Canonical.lean:2429:0: warning: declaration uses `sorry`
Canonical.lean:2435:0: warning: declaration uses `sorry`
Canonical.lean:2441:0: warning: declaration uses `sorry`
Canonical.lean:2450:0: warning: declaration uses `sorry`
Canonical.lean:2456:0: warning: declaration uses `sorry`
Canonical.lean:2584:6: warning: declaration uses `sorry`
Canonical.lean:2588:6: warning: declaration uses `sorry`
Canonical.lean:2591:4: warning: declaration uses `sorry`
Canonical.lean:2594:6: warning: declaration uses `sorry`
Canonical.lean:2597:6: warning: declaration uses `sorry`
Canonical.lean:2600:4: warning: declaration uses `sorry`
Canonical.lean:2603:6: warning: declaration uses `sorry`
Canonical.lean:2606:6: warning: declaration uses `sorry`
Canonical.lean:2612:6: warning: declaration uses `sorry`
Canonical.lean:2616:6: warning: declaration uses `sorry`
Canonical.lean:2621:6: warning: declaration uses `sorry`
Canonical.lean:2624:6: warning: declaration uses `sorry`
Canonical.lean:2629:0: warning: declaration uses `sorry`
Canonical.lean:2632:0: warning: declaration uses `sorry`
Canonical.lean:2637:0: warning: declaration uses `sorry`
Canonical.lean:2642:0: warning: declaration uses `sorry`
Canonical.lean:2647:0: warning: declaration uses `sorry`
Canonical.lean:2651:0: warning: declaration uses `sorry`
Canonical.lean:2657:0: warning: declaration uses `sorry`
Canonical.lean:2661:0: warning: declaration uses `sorry`
Canonical.lean:2664:0: warning: declaration uses `sorry`
Canonical.lean:2671:0: warning: declaration uses `sorry`
Canonical.lean:2677:0: warning: declaration uses `sorry`
Canonical.lean:2680:0: warning: declaration uses `sorry`
Canonical.lean:2683:0: warning: declaration uses `sorry`
Canonical.lean:2686:0: warning: declaration uses `sorry`
Canonical.lean:2701:6: warning: declaration uses `sorry`
Canonical.lean:2705:6: warning: declaration uses `sorry`
Canonical.lean:2711:6: warning: declaration uses `sorry`
Canonical.lean:2715:0: warning: declaration uses `sorry`
Canonical.lean:2719:0: warning: declaration uses `sorry`
Canonical.lean:2723:0: warning: declaration uses `sorry`
Canonical.lean:2727:0: warning: declaration uses `sorry`
Canonical.lean:2739:0: warning: declaration uses `sorry`
Canonical.lean:2748:0: warning: declaration uses `sorry`
Canonical.lean:2767:6: warning: declaration uses `sorry`
Canonical.lean:2775:6: warning: declaration uses `sorry`
Canonical.lean:2781:0: warning: declaration uses `sorry`
Canonical.lean:2787:0: warning: declaration uses `sorry`
Canonical.lean:2793:0: warning: declaration uses `sorry`
Canonical.lean:2802:6: warning: declaration uses `sorry`
Canonical.lean:2807:6: warning: declaration uses `sorry`
Canonical.lean:2812:6: warning: declaration uses `sorry`
Canonical.lean:2815:6: warning: declaration uses `sorry`
Canonical.lean:2819:6: warning: declaration uses `sorry`
Canonical.lean:2837:0: warning: declaration uses `sorry`
Canonical.lean:2842:0: warning: declaration uses `sorry`
Canonical.lean:2846:0: warning: declaration uses `sorry`
Canonical.lean:2850:0: warning: declaration uses `sorry`
Canonical.lean:2854:0: warning: declaration uses `sorry`
Canonical.lean:2858:0: warning: declaration uses `sorry`
Canonical.lean:2864:0: warning: declaration uses `sorry`
Canonical.lean:2870:0: warning: declaration uses `sorry`
Canonical.lean:2876:0: warning: declaration uses `sorry`
Canonical.lean:2880:0: warning: declaration uses `sorry`
Canonical.lean:2892:4: warning: declaration uses `sorry`
Canonical.lean:2895:6: warning: declaration uses `sorry`
Canonical.lean:2899:6: warning: declaration uses `sorry`
Canonical.lean:2902:6: warning: declaration uses `sorry`
Canonical.lean:2906:6: warning: declaration uses `sorry`
Canonical.lean:2910:6: warning: declaration uses `sorry`
Canonical.lean:2914:4: warning: declaration uses `sorry`
Canonical.lean:2917:6: warning: declaration uses `sorry`
Canonical.lean:2921:6: warning: declaration uses `sorry`
Canonical.lean:2924:6: warning: declaration uses `sorry`
Canonical.lean:2926:6: warning: declaration uses `sorry`
Canonical.lean:2932:6: warning: declaration uses `sorry`
Canonical.lean:2936:6: warning: declaration uses `sorry`
Canonical.lean:2940:6: warning: declaration uses `sorry`
Canonical.lean:2945:6: warning: declaration uses `sorry`
Canonical.lean:2949:6: warning: declaration uses `sorry`
Canonical.lean:2953:6: warning: declaration uses `sorry`
Canonical.lean:2958:6: warning: declaration uses `sorry`
Canonical.lean:2974:0: warning: declaration uses `sorry`
Canonical.lean:2979:0: warning: declaration uses `sorry`
Canonical.lean:2984:0: warning: declaration uses `sorry`
Canonical.lean:2987:0: warning: declaration uses `sorry`
Canonical.lean:2992:0: warning: declaration uses `sorry`
Canonical.lean:2997:0: warning: declaration uses `sorry`
Canonical.lean:3001:0: warning: declaration uses `sorry`
Canonical.lean:3006:0: warning: declaration uses `sorry`
Canonical.lean:3011:0: warning: declaration uses `sorry`
Canonical.lean:3018:0: warning: declaration uses `sorry`
Canonical.lean:3027:0: warning: declaration uses `sorry`
Canonical.lean:3046:6: warning: declaration uses `sorry`
Canonical.lean:3049:6: warning: declaration uses `sorry`
Canonical.lean:3052:6: warning: declaration uses `sorry`
Canonical.lean:3059:6: warning: declaration uses `sorry`
Canonical.lean:3072:6: warning: declaration uses `sorry`
Canonical.lean:3078:6: warning: declaration uses `sorry`
Canonical.lean:3081:6: warning: declaration uses `sorry`
Canonical.lean:3088:6: warning: declaration uses `sorry`
Canonical.lean:3093:6: warning: declaration uses `sorry`
Canonical.lean:3106:0: warning: declaration uses `sorry`
Canonical.lean:3109:0: warning: declaration uses `sorry`
Canonical.lean:3112:0: warning: declaration uses `sorry`
Canonical.lean:3117:0: warning: declaration uses `sorry`
Canonical.lean:3122:0: warning: declaration uses `sorry`
Canonical.lean:3127:0: warning: declaration uses `sorry`
Canonical.lean:3147:4: warning: declaration uses `sorry`
Canonical.lean:3151:6: warning: declaration uses `sorry`
Canonical.lean:3157:6: warning: declaration uses `sorry`
Canonical.lean:3162:6: warning: declaration uses `sorry`
Canonical.lean:3167:6: warning: declaration uses `sorry`
Canonical.lean:3172:6: warning: declaration uses `sorry`
Canonical.lean:3177:6: warning: declaration uses `sorry`
Canonical.lean:3182:6: warning: declaration uses `sorry`
Canonical.lean:3187:6: warning: declaration uses `sorry`
Canonical.lean:3192:6: warning: declaration uses `sorry`
Canonical.lean:3197:6: warning: declaration uses `sorry`
Canonical.lean:3202:6: warning: declaration uses `sorry`
Canonical.lean:3209:6: warning: declaration uses `sorry`
Canonical.lean:3215:6: warning: declaration uses `sorry`
Canonical.lean:3223:6: warning: declaration uses `sorry`
Canonical.lean:3229:6: warning: declaration uses `sorry`
Canonical.lean:3239:0: warning: declaration uses `sorry`
Canonical.lean:3244:0: warning: declaration uses `sorry`
Canonical.lean:3250:0: warning: declaration uses `sorry`
Canonical.lean:3256:0: warning: declaration uses `sorry`
Canonical.lean:3262:0: warning: declaration uses `sorry`
Canonical.lean:3268:0: warning: declaration uses `sorry`
Canonical.lean:3288:4: warning: declaration uses `sorry`
Canonical.lean:3291:6: warning: declaration uses `sorry`
Canonical.lean:3295:4: warning: declaration uses `sorry`
Canonical.lean:3298:6: warning: declaration uses `sorry`
Canonical.lean:3302:6: warning: declaration uses `sorry`
Canonical.lean:3306:6: warning: declaration uses `sorry`
Canonical.lean:3309:6: warning: declaration uses `sorry`
Canonical.lean:3313:6: warning: declaration uses `sorry`
Canonical.lean:3318:4: warning: declaration uses `sorry`
Canonical.lean:3322:6: warning: declaration uses `sorry`
Canonical.lean:3326:6: warning: declaration uses `sorry`
Canonical.lean:3330:4: warning: declaration uses `sorry`
Canonical.lean:3334:6: warning: declaration uses `sorry`
Canonical.lean:3339:6: warning: declaration uses `sorry`
Canonical.lean:3343:6: warning: declaration uses `sorry`
Canonical.lean:3347:6: warning: declaration uses `sorry`
Canonical.lean:3353:6: warning: declaration uses `sorry`
Canonical.lean:3358:4: warning: declaration uses `sorry`
Canonical.lean:3363:6: warning: declaration uses `sorry`
Canonical.lean:3380:6: warning: declaration uses `sorry`
Canonical.lean:3384:6: warning: declaration uses `sorry`
Canonical.lean:3389:6: warning: declaration uses `sorry`
Canonical.lean:3397:6: warning: declaration uses `sorry`
Canonical.lean:3401:6: warning: declaration uses `sorry`
Canonical.lean:3408:6: warning: declaration uses `sorry`
Canonical.lean:3413:6: warning: declaration uses `sorry`
Canonical.lean:3418:6: warning: declaration uses `sorry`
Canonical.lean:3423:6: warning: declaration uses `sorry`
Canonical.lean:3430:6: warning: declaration uses `sorry`
Canonical.lean:3434:6: warning: declaration uses `sorry`
Canonical.lean:3439:6: warning: declaration uses `sorry`
Canonical.lean:3447:6: warning: declaration uses `sorry`
Canonical.lean:3453:6: warning: declaration uses `sorry`
Canonical.lean:3459:6: warning: declaration uses `sorry`
Canonical.lean:3476:6: warning: declaration uses `sorry`
Canonical.lean:3479:4: warning: declaration uses `sorry`
Canonical.lean:3482:6: warning: declaration uses `sorry`
Canonical.lean:3487:6: warning: declaration uses `sorry`
Canonical.lean:3492:4: warning: declaration uses `sorry`
Canonical.lean:3497:6: warning: declaration uses `sorry`
Canonical.lean:3502:6: warning: declaration uses `sorry`
Canonical.lean:3505:4: warning: declaration uses `sorry`
Canonical.lean:3510:6: warning: declaration uses `sorry`
Canonical.lean:3517:4: warning: declaration uses `sorry`
Canonical.lean:3522:6: warning: declaration uses `sorry`
Canonical.lean:3528:6: warning: declaration uses `sorry`
Canonical.lean:3536:4: warning: declaration uses `sorry`
Canonical.lean:3542:6: warning: declaration uses `sorry`
Canonical.lean:3550:6: warning: declaration uses `sorry`
Canonical.lean:3557:6: warning: declaration uses `sorry`
Canonical.lean:3563:6: warning: declaration uses `sorry`
Canonical.lean:3571:6: warning: declaration uses `sorry`
Canonical.lean:3589:6: warning: declaration uses `sorry`
Canonical.lean:3593:6: warning: declaration uses `sorry`
Canonical.lean:3600:6: warning: declaration uses `sorry`
Canonical.lean:3607:6: warning: declaration uses `sorry`
Canonical.lean:3611:6: warning: declaration uses `sorry`
Canonical.lean:3621:6: warning: declaration uses `sorry`
Canonical.lean:3629:6: warning: declaration uses `sorry`
Canonical.lean:3633:6: warning: declaration uses `sorry`
Canonical.lean:3644:6: warning: declaration uses `sorry`
Canonical.lean:3652:6: warning: declaration uses `sorry`
Canonical.lean:3657:6: warning: declaration uses `sorry`
Canonical.lean:3662:6: warning: declaration uses `sorry`
Canonical.lean:3670:6: warning: declaration uses `sorry`
Canonical.lean:3679:6: warning: declaration uses `sorry`
Canonical.lean:3687:6: warning: declaration uses `sorry`
ELAPSED 32.81 RSS 3684004 EXIT 0
```

---

The complete incoming handoff follows unchanged, attributed to its workers. Its historical receipts are not new executions by codex-rtOQ9t.

# Native degree quotients — current #551 checkpoint

Codex — codex-J6LwjP, 2026-10-03. Claim 5965502494 won by bot confirmation 5965503592. The complete 55,002-character issue was read before the claim and reread unchanged after confirmation. Continue merged #5938. This remains a partial planning checkpoint; every node is unchecked.

Nineteen nodes (five constructions and fourteen lemmas), seventeen API records and fifteen tests compare the actual ambient ideal-power quotient with the native homogeneous polynomial submodule, factor the actual curve-degree projection through homogeneous representatives, identify their actual images and construct the homogeneous quotient-to-image equivalence. The ambient inverse is the actual class of polynomial inclusion. This is a comparison of existing carriers, not a replacement definition of an associated graded ring.

The ambient equivalence and image equivalence work for finite variable types over every commutative coefficient ring, including zero rings and nilpotent coefficients. Only the principal-equation kernel keeps no-zero-divisors coefficients, exact finite equation order and d≤n. The strict-below-order result keeps its weaker lower-bound hypotheses. The zero equation retains infinite order, while a unit equation kills every image. Tests include no-variable constants, the nonzero degree-one class of 2X over ℤ/4ℤ and the vanishing degree-two class of X² for the repeated equation x² over 𝔽₂.

All 173 incoming node objects are identical. Totals:192 nodes (8 definitions,31 constructions,137 lemmas,16 theorems),171 API records,204 raw tests (150 required definition/construction tests),313 baseline declarations,13 unchanged planets,15 gaps and2 requests. All eight coverage records, general reserved multiplicity definition, intrinsic/ambient conventions, source obligations, ownership metadata and other packet fields remain unchanged. No additional planet is inserted into the already full R03.3 layer.

Resume by identifying the actual equation-jet image with q^n/q^(n+1) for q=v(R/(f)), using the existing native power-quotient and third-isomorphism interfaces. Construct the generator-compatible graded map, prove multiplication under these quotient comparisons and then the full principal ideal kernel. Actual curve/support dimension, intrinsic/ambient multiplicity comparison, general Hilbert–Serre, Artin–Rees, completion, localization, associativity and every routed stage/source obligation remain required. A degreewise linear equivalence does not prove these remaining ring or dimension results.

Fresh reading: current issue, current handoff frontier, campaign stage text, the nine AUDIT-17 library-coverage rows and applicable accepted audit findings, RS-08's applicable keeps/import ownership and accepted review, both requests, complete reserved key entry and current native construction, and the matching ModularCurves coefficient-category overlap. Existing upstream roadmap exemplars and governing protocols were read in this continuous worker loop. This is not a fresh full audit of all historical source proofs. Source reading: immutable credited DDPA-JET-HANDOFF §§2–5 with its published hash, Stacks 00K4 mathematical section, and the exact pinned homogeneous-submodule, equal-submodule, quotient transport and first-isomorphism statements, assumptions and constructions. All new adapter deductions are credited as such. Fresh PR9819 metadata/body/changed-file list still shows the general Hilbert–Serre work OPEN at413e5b872a7c758e0eb91f99cb96d6a61c81f0a2; no unpinned code is imported. A bounded indexed Zulip search found no pertinent API discussion; no whole-library absence claim is made.

Both the complete admitted suggested file and the checked native prototype compiled serially in the existing Lean4.34.0-rc2 build at exact Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174. Tau Ceti's recorded source pin remains f790474821cf4256814db967cb154e7af3d0c369; neither file imports Tau Ceti. No project setup, library build, cache download or language server was used. Available memory was22GiB for the final native check and29GiB for the final canonical check, both with timeout1200. Native:2745 lines,185 axiom audits,zero errors/warnings/admissions;15.71 seconds;3591152KiB peak. Canonical:3465 lines,467 expected admission warnings,zero other errors/warnings;29.51 seconds;3603804KiB peak. Only propext,Classical.choice and Quot.sound appear in native audits. All incoming native proof bytes, suggested-file prefix and reader suffix are preserved; all34 new declaration/test headers match between proof and admitted sketch, including type-level lets. No compiler remains running.

The indexed packet checker, actual intake path/ownership checks, whole-object preservation, header parity and actual atlas assembly pass. The immutable view reads845 repository paths without copying a repository snapshot; their sorted-list hash is058eeeb5e5c0bdfc5035fb51bc7ec615b0620060b78255e78566ae7f62f43681. Twelve governing inputs and all four incoming deliverables are unchanged between mathematical and publication trees. Initial assembled graph:stage3003/8623,own192/302,combined3183/9118,all acyclic.193 declarations and283 baseline leaves are reached without unresolved references. The other R03.6 part is retained, giving245 whole-roadmap declarations. All65 accepted restructure pairs are reachable. Twelve of13 required supplier pairs are reachable; LocalFieldsRamification layer0→R03.4 remains the documented incoming missing path, identical in the control. Own skipped/pending links remain empty; stage edges and unrelated skipped/pending records stay control-equal. The final publication-tree graph receipt is recorded by verification.

Mathematical base:fb636d0b727444d0078a661b7591b0d79409af63. Publication base:2bc684df36a586e1a305395ddf6f0d0fb82aa63c. Only the four issue-authorized deliverables change.

The checked prototype is archived in the inert suggested-file block at [a9ae87a27904da425bf9d997e038bfa23fe3a466](https://github.com/CBirkbeck/tauceti-explorer/commit/a9ae87a27904da425bf9d997e038bfa23fe3a466). The final suggested file restores admitted planning bodies. Save the first four Python blocks below as recover.py,verify.py,immutable_view.py,graph.py in disk evidence storage. From the submitted checkout, run python3 EVIDENCE/recover.py SUBMITTED_COMMIT EVIDENCE, then P7_VALIDATE_BASE=2bc684df36a586e1a305395ddf6f0d0fb82aa63c python3 EVIDENCE/verify.py EVIDENCE PINNED_DECLARATIONS_TSV. Recovery fetches immutable public sources and checks their exact hashes. Compiler logs are not distributed; their receipts below record the original executions. Without logs the verifier explicitly reports source/header validation only. For a new execution, check free memory and existing build pins and compile Native.lean and Canonical.lean serially with timeout1200, redirecting to native.log and canonical.log and using the elapsed/peak resource footer checked by verify.py. Do not set up or build libraries.

### recover.py (SHA-256 c12dba3bfa0e47e2d35bdfd06eda430741f971867cfe0362c72a2f5712d796b9)

```python
from pathlib import Path
from urllib.request import urlopen
import hashlib,json,re,sys
STEM='DeformationAndDerivedPatchingAlgebra--P7'
PATH='research/blueprint/suggested/'+STEM+'.lean'
ARCHIVE='a9ae87a27904da425bf9d997e038bfa23fe3a466'
INCOMING='ad60c74c52d6e284558f4c3c87a435897e5eaa4f'
BASE='fb636d0b727444d0078a661b7591b0d79409af63'
def read(ref,path):return urlopen('https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'+ref+'/'+path).read().decode()
def section(text,start,end):return text.split(start+'\n',1)[1].split(end,1)[0]
def sha(t):return hashlib.sha256(t.encode()).hexdigest()
if __name__=='__main__':
 ref=sys.argv[1];out=Path(sys.argv[2]);out.mkdir(parents=True,exist_ok=True)
 handoff=read(ref,'research/blueprint/handoff/BP-'+STEM+'.md')
 metadata=json.loads(re.findall(chr(96)*3+r'json\n(.*?)'+chr(96)*3,handoff,re.S)[0])
 native=section(read(ARCHIVE,PATH),'/- BEGIN ARCHIVED CHECKED DEGREE QUOTIENT COMPARISON','END ARCHIVED CHECKED DEGREE QUOTIENT COMPARISON -/')
 incoming=section(read(INCOMING,PATH),'/- BEGIN ARCHIVED CHECKED POLYNOMIAL HOMOGENEOUS COMPARISON','END ARCHIVED CHECKED POLYNOMIAL HOMOGENEOUS COMPARISON -/')
 assert sha(incoming)=='6af365e82b4f3db615436237ee78b14c214e46509f8af8fcaa5653996c240139'
 assert native.startswith(incoming+'\n')
 tail=native[len(incoming)+1:]
 new,sep,tail=tail.partition('\nnamespace TauCeti.HilbertSamuel.DegreeQuotientTests\n');assert sep
 tests,sep,audits=('namespace TauCeti.HilbertSamuel.DegreeQuotientTests\n'+tail).partition('\n#print axioms TauCeti.HilbertSamuel.homogeneousLift\n');assert sep
 audits='#print axioms TauCeti.HilbertSamuel.homogeneousLift\n'+audits
 full=read(ref,PATH)
 admitted=section(full,'/- BEGIN DEGREE QUOTIENT COMPARISON -/','/- END DEGREE QUOTIENT COMPARISON -/')
 objects={'Native':native,'Canonical':full,'New':new,'Tests':tests,'Audits':audits,'NewAdmitted':admitted}
 for name,text in objects.items():
  assert sha(text)==metadata['proofHashes'][name],name
  (out/(name+'.lean')).write_text(text)
 (out/'incoming').mkdir(exist_ok=True);(out/'incoming/Native.lean').write_text(incoming)
 for folder,ext in [('packets','.json'),('readmes','.md'),('suggested','.lean'),('handoff','.md')]:
  path='research/blueprint/'+folder+'/'+('BP-' if folder=='handoff' else '')+STEM+ext
  (out/('Incoming-'+folder+ext)).write_text(read(BASE,path))
 (out/'metadata.json').write_text(json.dumps(metadata,ensure_ascii=False,indent=2)+'\n')
 fences=re.findall(chr(96)*3+r'python\n(.*?)'+chr(96)*3,handoff,re.S)
 for filename,code in zip(['recover.py','verify.py','immutable_view.py','graph.py'],fences[:4]):(out/filename).write_text(code)
 print('Public source/hash recovery passed; compiler logs are not distributed or recertified.')
```

### verify.py (SHA-256 1648e9df03c93e9bd1d069df244520ecab57dfa2e454d88e8b6ce894c98cd4e5)

```python
from pathlib import Path
import ast,contextlib,hashlib,io,json,os,re,runpy,subprocess,sys
R=Path.cwd();S=Path(sys.argv[1]).resolve();RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7';NS='TauCeti.HilbertSamuel.'
FILES=['research/blueprint/'+d+'/'+('BP-' if d=='handoff' else '')+STEM+e for d,e in [('packets','.json'),('readmes','.md'),('suggested','.lean'),('handoff','.md')]]
def sha(x):return hashlib.sha256(x).hexdigest()
current={f:(R/f).read_bytes() for f in FILES}
p=json.loads(current[FILES[0]]);old=json.loads((S/'Incoming-packets.json').read_text());meta=json.loads((S/'metadata.json').read_text())
assert len(old['nodes'])==173 and len(p['nodes'])==192 and p['nodes'][:173]==old['nodes']
assert p['sources'][:-1]==old['sources'] and p['baseline']['declarations'][:304]==old['baseline']['declarations']
assert len(p['baseline']['declarations'])==313
assert {k:v for k,v in p['baseline'].items() if k!='declarations'}=={k:v for k,v in old['baseline'].items() if k!='declarations'}
for k,v in old.items():
 if k not in {'summary','sources','baseline','nodes','gaps'}:assert p[k]==v,k
assert p['gaps'][:-1]==old['gaps'][:-1]
assert {k:v for k,v in p['gaps'][-1].items() if k!='degreeQuotientContinuation'}==old['gaps'][-1]
assert p['status']=='partial' and all(n['implementationStatus']=='unchecked' for n in p['nodes'])
full=current[FILES[2]].decode();reader=current[FILES[1]].decode();native=(S/'Native.lean').read_text();new=(S/'New.lean').read_text();tests=(S/'Tests.lean').read_text();admitted=(S/'NewAdmitted.lean').read_text();audits=(S/'Audits.lean').read_text();incoming=(S/'incoming/Native.lean').read_text()
assert native==incoming+'\n'+new+'\n'+tests+'\n'+audits
assert not re.search(r'\bsorry\b|^axiom\b',native,re.M)
assert full.startswith((S/'Incoming-suggested.lean').read_text())
assert reader.endswith((S/'Incoming-readmes.md').read_text())
assert current[FILES[3]].decode().endswith((S/'Incoming-handoff.md').read_text())
assert (S/'Canonical.lean').read_text()==full
assert full.split('/- BEGIN DEGREE QUOTIENT COMPARISON -/\n')[1].split('/- END DEGREE QUOTIENT COMPARISON -/')[0]==admitted
# Main body delimiters exclude type-level lets. Keep their entire actual binder text.
def headers(text):
 out={};matches=list(re.finditer(r'^(def|lemma) (\w+)\b',text,re.M))
 for i,m in enumerate(matches):
  block=text[m.start():matches[i+1].start() if i+1<len(matches) else len(text)]
  marker=re.search(r' where\n| := by\b| := rfl\b| := map_zero\b| := degreePolynomial_lift\b| :=\n(?=  [A-Za-z_(])',block)
  if marker is None:marker=re.search(r' := \(',block)
  assert marker,m[2]
  out[m[2]]=' '.join(block[:marker.start()].split())
 return out
assert headers(new+'\n'+tests)==headers(admitted)
assert set(headers(new))==set(meta['declarations']) and len(meta['tests'])==15
for n in p['nodes'][173:]:
 assert n['declaration'] in reader and n['statement'] in reader
 for a in n.get('api',[]):assert a['name'] in reader and a['statement'] in reader
 for t in n.get('tests',[]):
  assert t['statement'] in reader and '-- test: '+t['name'] in admitted
# Execution is certified only from successful local logs, never from source recovery alone.
execution={}
for name,count,warnings in [('Native',185,0),('Canonical',0,467)]:
 path=S/(name.lower()+'.log')
 if not path.exists():execution[name]='No local execution log supplied; source/header validation only.';continue
 log=path.read_text();assert not re.search(r'error(?:\(|:)|sorryAx|Command exited with non-zero',log)
 assert log.count('warning:')==log.count('warning: declaration uses')==warnings
 assert log.count('depends on axioms:')+log.count('does not depend on any axioms')==count
 assert re.search(r'Elapsed [0-9.]+ seconds; peak [0-9]+ KiB\s*$',log)
 for found in re.findall(r'depends on axioms: \[(.*?)\]',log,re.S):
  assert set(re.findall(r'\b(?:\w+\.)*\w+\b',found))<={'propext','Classical.choice','Quot.sound'}
 execution[name]={'audits':count,'warnings':warnings,'logSha256':sha(path.read_bytes()),'resourceFooter':log.splitlines()[-1],'execution':'Successful local log verified'}
base=os.environ.get('P7_VALIDATE_BASE','fb636d0b727444d0078a661b7591b0d79409af63')
mathbase='fb636d0b727444d0078a661b7591b0d79409af63'
guards=['research/blueprint/WORKERS.md','research/blueprint/PROTOCOL.md','research/expansion/PROTOCOL.md','research/blueprint/UPSTREAM_GUIDE.md','data/library-coverage.json','research/blueprint/reviews/REV-AUDIT-17.md','research/blueprint/reserved-ids.json','data/keydefs/KEYDEF-algebraicgeometry.json','content/campaign/'+RID+'/README.md','research/blueprint/restructure/RS-08.result.json','research/blueprint/restructure/RS-08.md','research/blueprint/links/tauceti_TauCetiRoadmap_ModularCurves.json']
def blob(ref,path):return subprocess.check_output(['git','show',ref+':'+path],cwd=R)
for f in guards:assert blob(mathbase,f)==blob(base,f),f
for f in FILES:assert blob(mathbase,f)==blob(base,f),f
changed=set(subprocess.check_output(['git','diff','--name-only',base],text=True).splitlines());assert changed<=set(FILES),changed
sys.path.insert(0,str(S));import immutable_view as view
assert view.BASE==base;view.install()
import check_blueprint
# Overlay exactly our candidate packet, leaving every other promoted packet immutable.
view.CACHE[FILES[0]]=current[FILES[0]]
errors,warnings,summary=check_blueprint.check(R/FILES[0],check_blueprint.load_index(Path(sys.argv[2])),check_blueprint.world());assert not errors and not warnings,(errors,warnings)
intake=ast.parse(view.blob('research/blueprint/intake.py').decode());selected=[]
for node in intake.body:
 if isinstance(node,ast.Assign) and any(isinstance(x,ast.Name) and x.id in {'ALLOWED','PRIVATE'} for x in node.targets):selected.append(node)
 if isinstance(node,ast.FunctionDef) and node.name in {'file_problems','auto_refusals','own_files','independent_of'}:selected.append(node)
env={'json':json,'re':re};exec(compile(ast.Module(body=selected,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads(view.blob('research/blueprint/queue.json'))['jobs'] if j['id']=='BP-'+STEM)
problems=[q for f,b in current.items() for q in env['file_problems'](f,b.decode())];refusals=env['auto_refusals'](job,FILES,False,{'codex-J6LwjP'},set());assert not problems and not refusals,(problems,refusals)
for f,b in current.items():
 assert not re.search(r'[ \t]+$',b.decode(),re.M),f
 assert not re.search(r'/(?:home|Users)/[^/\s]+/',b.decode()),f
output=io.StringIO();argv=sys.argv;sys.argv=[str(S/'graph.py'),str(S/'Incoming-packets.json')]
with contextlib.redirect_stdout(output):runpy.run_path(str(S/'graph.py'),run_name='__main__')
sys.argv=argv;graph=json.loads(output.getvalue())
report={'checker':summary,'graph':graph,'preservedWholeNodeObjects':173,'newDeclarations':19,'newTests':15,'newApiItems':17,'totalRawTests':sum(len(n.get('tests',[])) for n in p['nodes']),'guardsUnchanged':len(guards),'intakeProblems':problems,'intakeRefusals':refusals,'proofHashes':{n:sha((S/(n+'.lean')).read_bytes()) for n in ['Native','Canonical','New','Tests','NewAdmitted','Audits']},'execution':execution,'immutableReadPaths':len(view.READS),'immutableReadPathListSha256':sha(json.dumps(sorted(view.READS)).encode()),'verifierSha256':sha(Path(__file__).read_bytes())}
print(json.dumps(report,ensure_ascii=False,indent=2))
```

### immutable_view.py (SHA-256 136d1a1446746baede2ba0e47841633b497544e665335e4314b25bf09c1fdce1)

```python
"""Read the immutable audit tree without creating a repository snapshot."""
import fnmatch
import importlib.abc
import importlib.util
import io
from pathlib import Path
import subprocess
import sys

import os
REPO = Path(os.environ.get('TAUCETI_REPO', str(Path.cwd())))
BASE = os.environ.get('P7_VALIDATE_BASE', '2bc684df36a586e1a305395ddf6f0d0fb82aa63c')
TRACKED = set(subprocess.check_output(['git', 'ls-tree', '-r', '--name-only', BASE], cwd=REPO, text=True).splitlines())
CACHE = {}
READS = set()
ORIGINAL = {name: getattr(Path, name) for name in ('read_text', 'read_bytes', 'exists', 'is_file', 'is_dir', 'glob', 'rglob', 'open', 'write_text', 'write_bytes')}

def relative(path):
    try:
        return str(path.resolve().relative_to(REPO.resolve()))
    except ValueError:
        return None

def blob(key):
    if key not in TRACKED:
        raise FileNotFoundError(key)
    READS.add(key)
    if key not in CACHE:
        CACHE[key] = subprocess.check_output(['git', 'show', BASE + ':' + key], cwd=REPO)
    return CACHE[key]

def read_text(path, encoding=None, errors=None):
    key = relative(path)
    if key is None:
        return ORIGINAL['read_text'](path, encoding=encoding, errors=errors)
    return blob(key).decode(encoding or 'utf-8', errors or 'strict')

def read_bytes(path):
    key = relative(path)
    return ORIGINAL['read_bytes'](path) if key is None else blob(key)

def is_file(path):
    key = relative(path)
    return ORIGINAL['is_file'](path) if key is None else key in TRACKED

def is_dir(path):
    key = relative(path)
    return ORIGINAL['is_dir'](path) if key is None else any(s.startswith(key.rstrip('/') + '/') for s in TRACKED) or key == '.'

def exists(path):
    key = relative(path)
    return ORIGINAL['exists'](path) if key is None else is_file(path) or is_dir(path)

def glob(path, pattern, recursive=False):
    key = relative(path)
    if key is None:
        yield from ORIGINAL['rglob' if recursive else 'glob'](path, pattern)
        return
    prefix = '' if key == '.' else key.rstrip('/') + '/'
    for candidate in sorted(TRACKED):
        if not candidate.startswith(prefix):
            continue
        tail = candidate[len(prefix):]
        if fnmatch.fnmatch(tail, pattern) and (recursive or '/' not in tail):
            yield REPO / candidate

def open_path(path, mode='r', buffering=-1, encoding=None, errors=None, newline=None):
    key = relative(path)
    if key is None:
        return ORIGINAL['open'](path, mode, buffering, encoding, errors, newline)
    if mode not in ('r', 'rb'):
        raise PermissionError('audit tree is read-only')
    return io.BytesIO(blob(key)) if mode == 'rb' else io.StringIO(blob(key).decode(encoding or 'utf-8', errors or 'strict'))

def write_text(path, *args, **kwargs):
    if relative(path) is not None:
        raise PermissionError('audit tree is read-only')
    return ORIGINAL['write_text'](path, *args, **kwargs)

def write_bytes(path, *args, **kwargs):
    if relative(path) is not None:
        raise PermissionError('audit tree is read-only')
    return ORIGINAL['write_bytes'](path, *args, **kwargs)

class Loader(importlib.abc.Loader):
    def __init__(self, key):
        self.key = key
    def create_module(self, spec):
        return None
    def exec_module(self, module):
        module.__file__ = str(REPO / self.key)
        exec(compile(blob(self.key), module.__file__, 'exec'), module.__dict__)

class Finder(importlib.abc.MetaPathFinder):
    def find_spec(self, fullname, path=None, target=None):
        key = 'scripts/' + fullname + '.py'
        if '.' not in fullname and key in TRACKED:
            return importlib.util.spec_from_loader(fullname, Loader(key))

def install():
    for name, function in [('read_text', read_text), ('read_bytes', read_bytes), ('exists', exists), ('is_file', is_file), ('is_dir', is_dir), ('glob', glob), ('rglob', lambda path, pattern: glob(path, pattern, True)), ('open', open_path), ('write_text', write_text), ('write_bytes', write_bytes)]:
        setattr(Path, name, function)
    sys.meta_path.insert(0, Finder())
```

### graph.py (SHA-256 2ab5184487d1061bb9dde1ddb2b3f823e7ae4b9729eef348f694649fa0820292)

```python
from pathlib import Path
import sys,json,copy,collections
sys.path.insert(0,str(Path.cwd()/'scripts'))
import build,blueprints,check_blueprint
RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7'
p=json.loads((Path.cwd()/'research/blueprint/packets'/f'{STEM}.json').read_text())
original=json.loads(Path(sys.argv[1]).read_text())
new={n['id']:n for n in p['nodes']}
root=Path.cwd()
a0=json.loads((root/"data/atlas.json").read_text())
packets,documents,definitions=blueprints.load_promoted(root)
otherparts=[(stem,q) for stem,q in packets if q.get("roadmapId")==RID and stem!=STEM]
assert otherparts, "must preserve other promoted roadmap parts"
keep=[x for x in packets if x[0]!=STEM]
documents[STEM]="research/blueprint/readmes/"+STEM+".md"
def assemble(candidate):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(STEM,candidate)]),copy.deepcopy(documents),copy.deepcopy(definitions))
 return build.assemble(require_distances=False)[0]
a=assemble(p);b=assemble(original)
world={}
for folder in ["data/decompositions","data/blueprints","research/blueprint/packets"]:
 for path in sorted((root/folder).glob("*.json")):
  q=json.loads(path.read_text())
  for n in q.get("nodes",[]):world.setdefault(n["id"],n)
world.update(new)
stages={x["id"]:x for x in a["stages"]}
stageids=set(stages)|set(check_blueprint.world()[1])
stageedges={(e["source"],e["target"]) for e in a["stageEdges"]}
def dag(vertices,edges):
 vertices=set(vertices)|{v for edge in edges for v in edge}
 out=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for source,target in edges:
  if target not in out[source]:out[source].add(target);indeg[target]+=1
 stack=[v for v,count in indeg.items() if count==0];count=0
 while stack:
  v=stack.pop();count+=1
  for w in out[v]:
   indeg[w]-=1
   if indeg[w]==0:stack.append(w)
 assert count==len(vertices),[v for v,count in indeg.items() if count][:15]
 return {"vertices":len(vertices),"edges":len(edges),"acyclic":True}
ownedges={(q,nid) for nid,node in new.items() for q in node.get("prerequisites",[]) if q in new}
stack=list(new);seen=set();dep=set();unresolved=set();baseref=set()
while stack:
 nid=stack.pop()
 if nid in seen:continue
 seen.add(nid)
 for q in world[nid].get("prerequisites",[]):
  if q.startswith(("mathlib:","tauceti:")) and q not in stageids:baseref.add(q);continue
  dep.add((q,nid))
  if q in world:stack.append(q)
  elif q not in stageids:unresolved.add(q)
assert not unresolved,sorted(unresolved)
dep|={(world[nid]["parentStageId"],nid) for nid in seen if world[nid].get("parentStageId") in stageids or world[nid].get("parentStageId") in world}
dep|={(request["supplier"],consumer) for request in p.get("requests",[]) for consumer in request.get("neededBy",[]) if consumer in new or consumer in stageids}
roadmap=next(r for r in a["roadmaps"] if r["id"]==RID)
expected_decl=len(new)+sum(len(q["nodes"]) for _,q in otherparts)
assert roadmap["blueprint"]["declarations"]==expected_decl,(roadmap["blueprint"],expected_decl)
assert not roadmap["blueprint"]["skippedLinks"] and not roadmap.get("pendingLinks",[])
assert stageedges=={(e["source"],e["target"]) for e in b["stageEdges"]}
def skips(atlas):
 return {r["id"]:(r.get("blueprint",{}).get("skippedLinks",[]),r.get("pendingLinks",[])) for r in atlas["roadmaps"] if r["id"]!=RID}
assert skips(a)==skips(b)
out=collections.defaultdict(set)
for source,target in stageedges:out[source].add(target)
def reachable(source,target):
 stack=[source];seen=set()
 while stack:
  v=stack.pop()
  if v==target:return True
  if v in seen:continue
  seen.add(v);stack.extend(out[v]-seen)
 return False
pairs={(e["source"],e["target"]) for e in a0["stageEdges"] if e["target"].startswith(RID+":")}
for node in p["nodes"]:
 for q in node.get("prerequisites",[]):
  if q in stageids and q not in world and q!=node["parentStageId"]:pairs.add((q,node["parentStageId"]))
for req in p.get("requests",[]):
 for consumer in req.get("neededBy",[]):
  if consumer in new:pairs.add((req["supplier"],new[consumer]["parentStageId"]))
  elif consumer in stageids:pairs.add((req["supplier"],consumer))
missingpairs={(s,t) for s,t in pairs if not reachable(s,t)}
oldout=collections.defaultdict(set)
for edge in b['stageEdges']:oldout[edge['source']].add(edge['target'])
def reachable0(source,target):
 stack=[source];seen=set()
 while stack:
  v=stack.pop()
  if v==target:return True
  if v in seen:continue
  seen.add(v);stack.extend(oldout[v]-seen)
 return False
assert missingpairs=={(s,t) for s,t in pairs if not reachable0(s,t)}
assert missingpairs=={('tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions',RID+':R03.4')}
assert any('LocalFieldsRamification layer 0 to R03.4' in gap['detail'] for gap in p['gaps'])
# Independently retain all accepted restructure links touching the whole roadmap.
acceptedpairs=set()
for path in (root/"research/blueprint/restructure").glob("*.result.json"):
 q=json.loads(path.read_text())
 if q.get("review",{}).get("status")!="accepted":continue
 for row in q.get("links",[]):
  if any(row.get(k,"").startswith(RID+":") for k in ["source","target"]):
   acceptedpairs.add((row["source"],row["target"]))
assert all(reachable(s,t) for s,t in acceptedpairs),[(s,t) for s,t in acceptedpairs if not reachable(s,t)]
report={"stageDAG":dag(stages,stageedges),"ownDAG":dag(new,ownedges),
 "combinedDAG":dag(set(stages)|seen,stageedges|dep),"reachableDeclarations":len(seen),
 "externalDeclarations":sorted(seen-set(new)),"reachableBaselineReferences":len(baseref),
 "unresolved":sorted(unresolved),"otherPartsRetained":[stem for stem,_ in otherparts],
 "partDeclarations":len(new),"partPlanets":sum("planet" in n for n in p["nodes"]),
 "roadmapDeclarations":roadmap["blueprint"]["declarations"],
 "requiredStagePairs":len(pairs),"requiredStagePairsReachable":len(pairs)-len(missingpairs),
 "inheritedMissingStagePairs":sorted(missingpairs),
 "acceptedRestructurePairs":len(acceptedpairs),"acceptedRestructurePairsReachable":len(acceptedpairs),
 "stageEdgesUnchanged":True,"otherSkippedPendingUnchanged":True,"ownSkippedPendingEmpty":True}
print(json.dumps(report,ensure_ascii=False,indent=2),flush=True)
```

### Public proof and execution receipt

```json
{
  "nodes": [
    "DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-polynomial-lift",
    "DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-polynomial-lift-value",
    "DeformationAndDerivedPatchingAlgebra:R03.3/ideal-power-polynomial-projection",
    "DeformationAndDerivedPatchingAlgebra:R03.3/ideal-power-polynomial-projection-value",
    "DeformationAndDerivedPatchingAlgebra:R03.3/ideal-power-projection-section",
    "DeformationAndDerivedPatchingAlgebra:R03.3/ideal-power-polynomial-surjectivity",
    "DeformationAndDerivedPatchingAlgebra:R03.3/ideal-power-polynomial-vanishing",
    "DeformationAndDerivedPatchingAlgebra:R03.3/ideal-power-polynomial-kernel-submodule",
    "DeformationAndDerivedPatchingAlgebra:R03.3/ambient-degree-quotient-equivalence",
    "DeformationAndDerivedPatchingAlgebra:R03.3/ambient-degree-quotient-representative",
    "DeformationAndDerivedPatchingAlgebra:R03.3/ambient-degree-quotient-inverse",
    "DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-curve-projection",
    "DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-curve-projection-value",
    "DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-polynomial-factorization",
    "DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-curve-projection-image",
    "DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-curve-principal-kernel",
    "DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-curve-low-degree-injectivity",
    "DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-curve-quotient-image-equivalence",
    "DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-curve-quotient-representative"
  ],
  "declarations": [
    "homogeneousLift",
    "homogeneousLift_apply",
    "degreePolynomial",
    "degreePolynomial_apply",
    "degreePolynomial_lift",
    "degreePolynomial_surjective",
    "degreePolynomial_eq_zero_iff",
    "degreePolynomial_ker",
    "ambientDegreeEquiv",
    "ambientDegreeEquiv_mk",
    "ambientDegreeEquiv_symm",
    "homogeneousCurveProjection",
    "homogeneousCurveProjection_apply",
    "curveDegreeProjection_factor",
    "homogeneousCurveProjection_range",
    "homogeneousCurveProjection_kernel",
    "homogeneousCurveProjection_below_order",
    "homogeneousCurveQuotientEquiv",
    "homogeneousCurveQuotientEquiv_mk"
  ],
  "tests": [
    "lift_zero",
    "lift_variable",
    "lift_torsion",
    "degree_lift",
    "degree_constant",
    "degree_next",
    "ambient_roundtrip",
    "ambient_inverse",
    "ambient_torsion",
    "curve_unit",
    "curve_zero",
    "characteristic_two_killed",
    "quotient_value",
    "quotient_inverse",
    "quotient_zero_equation"
  ],
  "baselineAdded": [
    "mathlib:LinearEquiv.coe_ofEq_apply",
    "mathlib:LinearEquiv.ofEq",
    "mathlib:LinearMap.quotKerEquivOfSurjective",
    "mathlib:LinearMap.quotKerEquivOfSurjective_apply_mk",
    "mathlib:LinearMap.quotKerEquivRange",
    "mathlib:LinearMap.quotKerEquivRange_apply_mk",
    "mathlib:MvPolynomial.homogeneousSubmodule",
    "mathlib:Submodule.quotEquivOfEq",
    "mathlib:Submodule.quotEquivOfEq_mk"
  ],
  "worker": "Codex — codex-J6LwjP",
  "issue": 551,
  "claim": 5965502494,
  "confirmation": 5965503592,
  "mathematicalBase": "fb636d0b727444d0078a661b7591b0d79409af63",
  "publicationBase": "2bc684df36a586e1a305395ddf6f0d0fb82aa63c",
  "proofHashes": {
    "Native": "031d541cf87c7836c4ca9ec528f1f7f9b0ba25fa63ef14e1b63b548dd4ee885e",
    "Canonical": "940329864e28497babbe6e37e3a5fcca997ce0484c6f42946b8afdfc34646042",
    "New": "83859f2a4f76faf83d9a7e1443004033922d98a4569344d374eb5b8f057b333d",
    "Tests": "42929300bbe6e569829f9e2f752cc9f00eab9290c0d6eb088d896d1b32a49efb",
    "NewAdmitted": "854feaf8c19e5d6f83456d0fb78722d3b7d40d73bf3c6dc7ece7e5932fdbab67",
    "Audits": "b4f5ec627dd8d4162d0b845615a7f3dd0e33c57adc6dfa2a4a612fb403982389"
  },
  "originalExecution": {
    "Native": {
      "audits": 185,
      "warnings": 0,
      "logSha256": "0e190b7d78eaa6d920eb0b8f11f330cccc1fdb15a32f79d7e3ae9ba375e81766",
      "resourceFooter": "Elapsed 15.71 seconds; peak 3591152 KiB",
      "execution": "Successful local log verified"
    },
    "Canonical": {
      "audits": 0,
      "warnings": 467,
      "logSha256": "374949418297994596eeda4874affb11f8a08e104291e3aaba423bb51921089e",
      "resourceFooter": "Elapsed 29.51 seconds; peak 3603804 KiB",
      "execution": "Successful local log verified"
    }
  },
  "validation": {
    "checker": {
      "packet": "research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--P7.json",
      "roadmap": "DeformationAndDerivedPatchingAlgebra",
      "status": "partial",
      "nodes": 192,
      "kinds": {
        "lemma": 137,
        "theorem": 16,
        "definition": 8,
        "construction": 31
      },
      "apiItems": 171,
      "unitTests": 150,
      "planets": 13,
      "baselineDeclarations": 313,
      "prerequisites": {
        "baseline": 425,
        "node (this packet)": 302,
        "node (integrated)": 1
      },
      "gaps": 15,
      "requests": 2,
      "stagesInScope": 8,
      "stagesClosed": 0
    },
    "graph": {
      "stageDAG": {
        "vertices": 3003,
        "edges": 8623,
        "acyclic": true
      },
      "ownDAG": {
        "vertices": 192,
        "edges": 302,
        "acyclic": true
      },
      "combinedDAG": {
        "vertices": 3183,
        "edges": 9118,
        "acyclic": true
      },
      "reachableDeclarations": 193,
      "externalDeclarations": [
        "DeformationAndDerivedPatchingAlgebra:R03.3/depth-auslander-buchsbaum-and-dimension-bounds"
      ],
      "reachableBaselineReferences": 283,
      "unresolved": [],
      "otherPartsRetained": [
        "DeformationAndDerivedPatchingAlgebra--R03.6"
      ],
      "partDeclarations": 192,
      "partPlanets": 13,
      "roadmapDeclarations": 245,
      "requiredStagePairs": 13,
      "requiredStagePairsReachable": 12,
      "inheritedMissingStagePairs": [
        [
          "tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions",
          "DeformationAndDerivedPatchingAlgebra:R03.4"
        ]
      ],
      "acceptedRestructurePairs": 65,
      "acceptedRestructurePairsReachable": 65,
      "stageEdgesUnchanged": true,
      "otherSkippedPendingUnchanged": true,
      "ownSkippedPendingEmpty": true
    },
    "preservedWholeNodeObjects": 173,
    "newDeclarations": 19,
    "newTests": 15,
    "newApiItems": 17,
    "totalRawTests": 204,
    "guardsUnchanged": 12,
    "intakeProblems": [],
    "intakeRefusals": [],
    "proofHashes": {
      "Native": "031d541cf87c7836c4ca9ec528f1f7f9b0ba25fa63ef14e1b63b548dd4ee885e",
      "Canonical": "940329864e28497babbe6e37e3a5fcca997ce0484c6f42946b8afdfc34646042",
      "New": "83859f2a4f76faf83d9a7e1443004033922d98a4569344d374eb5b8f057b333d",
      "Tests": "42929300bbe6e569829f9e2f752cc9f00eab9290c0d6eb088d896d1b32a49efb",
      "NewAdmitted": "854feaf8c19e5d6f83456d0fb78722d3b7d40d73bf3c6dc7ece7e5932fdbab67",
      "Audits": "b4f5ec627dd8d4162d0b845615a7f3dd0e33c57adc6dfa2a4a612fb403982389"
    },
    "execution": {
      "Native": {
        "audits": 185,
        "warnings": 0,
        "logSha256": "0e190b7d78eaa6d920eb0b8f11f330cccc1fdb15a32f79d7e3ae9ba375e81766",
        "resourceFooter": "Elapsed 15.71 seconds; peak 3591152 KiB",
        "execution": "Successful local log verified"
      },
      "Canonical": {
        "audits": 0,
        "warnings": 467,
        "logSha256": "374949418297994596eeda4874affb11f8a08e104291e3aaba423bb51921089e",
        "resourceFooter": "Elapsed 29.51 seconds; peak 3603804 KiB",
        "execution": "Successful local log verified"
      }
    },
    "immutableReadPaths": 845,
    "immutableReadPathListSha256": "058eeeb5e5c0bdfc5035fb51bc7ec615b0620060b78255e78566ae7f62f43681",
    "verifierSha256": "1648e9df03c93e9bd1d069df244520ecab57dfa2e454d88e8b6ce894c98cd4e5"
  },
  "proofArchive": "a9ae87a27904da425bf9d997e038bfa23fe3a466"
}
```

---

The following is the complete incoming handoff history; earlier frontiers are retained as historical checkpoints.

# Polynomial homogeneous comparison — current #551 checkpoint

Codex — codex-7e92bd, 2026-10-03. Claim comment 5965260354 was confirmed by bot 5965261825. The entire 55002-character issue was read before claiming and reread unchanged afterward. Continue merged #5935; preserve its credited source and proof receipts. This is a partial planning checkpoint and every implementation status remains unchecked.

## Result and mathematical boundary

Sixteen declaration nodes (one construction and fifteen lemmas), fifteen API records and six tests provide the actual coefficient-linear polynomial component H_n, its coefficient formula, compatibility with native polynomial inclusion and both native component maps, homogeneity equivalence, unique polynomial representatives, vanishing, order-bounded truncation and multiplication, exact-order nonvanishing, and orthogonal projection laws. The actual equation-jet kernel now has a polynomial witness in both directions; the strict-below-order and zero-equation branches retain their weaker assumptions.

All adapters are for finite variable sets and arbitrary commutative coefficient rings. Only the exact principal-equation upper kernel uses no-zero-divisors coefficients, exact finite order(f)=d and d≤n. No field, reducedness, irreducibility, characteristic or local-ring hypothesis is silently added. The empty-variable and F₂ tests distinguish exact-degree extraction from truncation. Over ℚ a fixed-degree component fails multiplicativity; over ℤ/4ℤ the nonzero polynomial 2X has zero square. These tests prevent strengthening the valid product identity to nonvanishing for arbitrary coefficients.

All 157 incoming node objects are unchanged, including the reserved general Hilbert–Samuel definition. Totals are 173 nodes (8 definitions, 26 constructions, 123 lemmas, 16 theorems), 154 API records, 189 raw tests (135 required definition/construction tests), 13 planets, 304 baseline declarations, 15 gaps and two requests. P7/R03.3/R03.4 stay partial and the other five stages stay not_read. All old sources, route records, source issues, requests, coverage targets and boundary metadata remain intact.

The full tangent-cone algebra is not yet assembled. Identify the degree projection's actual image with q^n/q^(n+1), construct the generator-compatible graded map, and prove multiplication and the full principal kernel. Then prove actual curve/support dimension before comparison with the existing general cumulative polynomial and intrinsic/ambient multiplicities. General Hilbert–Serre, Artin–Rees, completion, localization, associativity and every routed source/stage obligation remain required.

## Reading and ownership

Fresh: whole campaign reader, all nine reviewed AUDIT-17 roadmap rows and the complete accepted review, applicable accepted RS-08 narrowing and ownership records and its local algebra architecture/conservation, all 22 touching campaign edge identities, the one matching link/overlap record, both requests, and full reserved key/catalog entry. The generic local-algebra owner and its upstream ModularCurves special-case imports remain unchanged. No new supplier is requested. Upstream style documents were read earlier in this continuous loop; the current reading is not a new full audit of all historical proofs or routed papers.

Primary mathematical reading: complete Stacks 00K4 mathematical section and the credited immutable DDPA-JET-HANDOFF §§2–5, including equation (9), both degreewise kernel directions and the graded-map boundary. The latter is the authored proof checkpoint at eb645dc85df65608c56fafc4d9ed0e71ab0ca3ce, already credited in the packet. Selected pinned polynomial Homogeneous.lean, series Basic.lean, Trunc.lean and Order.lean statements, ambient assumptions and proofs were read; source hashes and exact extents are in HS-POLYNOMIAL-COMPONENT-PIN-7e92bd. The new finite-variable coefficient generalization is an authored deduction, not a newly printed whole-paper theorem.

Fresh bounded open-PR search found Mathlib PR9819, OPEN at 413e5b872a7c758e0eb91f99cb96d6a61c81f0a2. Its metadata, body and changed-file list describe graded finite generation, additive functions and Hilbert–Serre. No code was copied or unpinned theorem imported. That general backlog is distinct from this native polynomial/series adapter. A bounded web-indexed Zulip search returned no relevant API discussion; no whole-library or whole-Zulip absence claim is made.

## Validation and resources

Both files compiled serially in the existing Lean 4.34.0-rc2 build at exact Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. The Tau Ceti source pin remains f790474821cf4256814db967cb154e7af3d0c369; neither file imports Tau Ceti. No language server, project setup, cache download or library build was used. Each run had timeout 1200 and more than 20 GiB available. No own compiler is left running.

Native: 2473 lines, 64 inherited anonymous examples plus inherited named tests and six new named tests, 151 axiom audits, zero admissions/errors/warnings. Only propext,Classical.choice and Quot.sound appear. Available 36 GiB; 11.10 seconds; 3590856 KiB peak RSS. Canonical: 3275 lines, 213 examples, 433 expected admission warnings only; available 35 GiB; 28.21 seconds; 3592004 KiB peak RSS. All 2251 incoming native lines are exact after one added import. The entire incoming suggested file is preserved after the same added import. Every new declaration and complete test header matches, including type-level lets. The complete incoming reader is preserved as a suffix.

Native SHA-256:6af365e82b4f3db615436237ee78b14c214e46509f8af8fcaa5653996c240139.
Canonical SHA-256:269dfcb080265133bf2e1e2fc459e0e70ff36447303b5646fc228ee70e5d91b2.
Normalized native log SHA-256:6ee3146d0fc0596d23dc6132cc647888803732481e38d5920b335780827c4f6c.
Normalized canonical log SHA-256:c4682599b766c0723fd0b7463cfa6f95f4ab42dd5a82f3e9e3e3a7d8485fc365.
Normalization changes only the evidence-directory prefix to EVIDENCE and retains resource footers.

The indexed packet checker reports zero errors/warnings; actual intake ownership/file checks and preservation/header checks pass. Actual atlas assembly retains all other promoted packets, including this roadmap's R03.6 part (226 whole-roadmap declarations). Own DAG: 173 vertices/261 edges; stage DAG: 3003/8623; scoped combined DAG: 3164/9058, including every reached declaration's parent stage. All are acyclic, 174 declarations and 274 baseline leaves are reached, with zero unresolved references or own skipped/pending links. All 65 accepted restructure pairs are reachable. Twelve of 13 required supplier pairs are reachable; the missing LocalFieldsRamification layer 0→R03.4 path is inherited, documented and identical in the incoming control. No claim of complete supplier closure is made. Stage edges and every other roadmap's skipped/pending records remain control-equal.

Read base 1a0342b3b20f9b2faae813b2f5a230890264eef8; publication base b725306dcef5613ca909fcaafaded4840e72777c. Governing/read inputs and all four own incoming deliverables were unchanged; only the preceding Anabelian checkpoint and queue advanced. Only the four issue-authorized files change.

## Public recovery and continuation

The preceding own commit [ad60c74c52d6e284558f4c3c87a435897e5eaa4f](https://github.com/CBirkbeck/tauceti-explorer/commit/ad60c74c52d6e284558f4c3c87a435897e5eaa4f) contains the exact checked native proof in an inert suggested-file block. The final file restores admitted planning bodies. The incoming proof is recoverable from archive 1ee3d626cd226cffc0ee869aff618df03e133c65 with SHA-256 695a088a82bfd4d432a4af5bf41d4f1b99d33138db2bcf86f3d9c08c9973a3a5.

Save the following three blocks as recover.py, verify.py, graph.py in disk evidence storage. From a checkout of the submitted commit, run python3 EVIDENCE/recover.py SUBMITTED_COMMIT EVIDENCE, then python3 EVIDENCE/verify.py EVIDENCE PINNED_DECLARATIONS_TSV and python3 EVIDENCE/graph.py EVIDENCE/original-packet.json. The recovery checks immutable source hashes. Without local compiler logs, verification explicitly reports source/header validation only. To rerun compilation, check free memory and existing build pins, run the two recovered files serially with /usr/bin/time -v timeout 1200 lake env lean, redirecting to native.log and canonical.log; then rerun verification. Do not set up or build libraries.

Resume at the actual quotient-image comparison and full graded assembly described above. Preserve general key-definition scope, all routed obligations and the documented missing supplier path. A polynomial-valued degreewise kernel is not a dimension theorem.

### recover.py (SHA-256 eabd5b8003e4b82680d30f21bdd501e8f3bf8bb2430a994b0bf51a6c0bec7c23)

```python
from pathlib import Path
from urllib.request import urlopen
import hashlib,sys
STEM='DeformationAndDerivedPatchingAlgebra--P7'
PATH='research/blueprint/suggested/'+STEM+'.lean'
ARCHIVE='ad60c74c52d6e284558f4c3c87a435897e5eaa4f'
INCOMING='1ee3d626cd226cffc0ee869aff618df03e133c65'
BASE='1a0342b3b20f9b2faae813b2f5a230890264eef8'
PUBLICATION='b725306dcef5613ca909fcaafaded4840e72777c'
def read(ref,path=PATH):return urlopen('https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'+ref+'/'+path).read().decode()
def section(text,start,end):return text.split(start+'\n',1)[1].split(end,1)[0]
def sha(text):return hashlib.sha256(text.encode()).hexdigest()
def reconstruct(submitted_ref):
 native=section(read(ARCHIVE),'/- BEGIN ARCHIVED CHECKED POLYNOMIAL HOMOGENEOUS COMPARISON','END ARCHIVED CHECKED POLYNOMIAL HOMOGENEOUS COMPARISON -/')
 assert sha(native)=='6af365e82b4f3db615436237ee78b14c214e46509f8af8fcaa5653996c240139'
 incoming=section(read(INCOMING),'/- BEGIN ARCHIVED CHECKED INITIAL RELATIONS codex-a71f92','END ARCHIVED CHECKED INITIAL RELATIONS codex-a71f92 -/')
 assert sha(incoming)=='695a088a82bfd4d432a4af5bf41d4f1b99d33138db2bcf86f3d9c08c9973a3a5'
 extra='import Mathlib.RingTheory.MvPolynomial.Homogeneous\n'
 assert native.startswith(extra+incoming)
 tail=native[len(extra+incoming):];i=tail.index('\n#print axioms TauCeti.HilbertSamuel.homogeneousPolynomial\n');new,audits=tail[:i],tail[i:]
 full=read(submitted_ref);assert sha(full)=='269dfcb080265133bf2e1e2fc459e0e70ff36447303b5646fc228ee70e5d91b2'
 admitted=section(full,'/- BEGIN POLYNOMIAL HOMOGENEOUS COMPARISON -/','/- END POLYNOMIAL HOMOGENEOUS COMPARISON -/')
 assert full.startswith(extra+read(BASE))
 return {'Native.lean':native,'IncomingNative.lean':incoming,'New.lean':new,'Audits.lean':audits,
  'Canonical.lean':full,'NewAdmitted.lean':admitted,'base.txt':BASE+'\n','publication-base.txt':PUBLICATION+'\n',
  'original-packet.json':read(BASE,'research/blueprint/packets/'+STEM+'.json')}
if __name__=='__main__':
 out=Path(sys.argv[2]);out.mkdir(parents=True,exist_ok=True)
 for name,text in reconstruct(sys.argv[1]).items():(out/name).write_text(text)
```

### verify.py (SHA-256 9d9baacd7d52af6501266d458ab4c25f7881efb3e800c5c49616e1c110df092f)

```python
from pathlib import Path
import ast,hashlib,json,re,subprocess,sys
R=Path.cwd();S=Path(sys.argv[1]);RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7';NS='TauCeti.HilbertSamuel.'
files=['research/blueprint/'+f+'/'+('BP-' if f=='handoff' else '')+STEM+'.'+ext for f,ext in [('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
p=json.loads((R/files[0]).read_text());old=json.loads((S/'original-packet.json').read_text());nodes={n['id']:n for n in p['nodes']}
assert len(old['nodes'])==157 and len(nodes)==173 and p['nodes'][:157]==old['nodes']
for k in old:
 if k not in ['summary','nodes','sources','baseline','coverage','gaps']:assert p[k]==old[k],k
assert p['sources'][:-1]==old['sources'] and p['baseline']['declarations'][:292]==old['baseline']['declarations']
assert {k:v for k,v in p['baseline'].items() if k!='declarations'}=={k:v for k,v in old['baseline'].items() if k!='declarations'}
assert p['gaps'][:-1]==old['gaps'][:-1]
assert {k:v for k,v in p['gaps'][-1].items() if k!='polynomialComponentContinuation'}==old['gaps'][-1]
for a,b in zip(p['coverage'],old['coverage']):
 if a['stageId']==RID+':R03.3':
  assert a['remaining'][:-1]==b['remaining'] and {k:v for k,v in a.items() if k!='remaining'}=={k:v for k,v in b.items() if k!='remaining'}
 else:assert a==b
assert all(n['implementationStatus']=='unchecked' for n in p['nodes']) and p['status']=='partial'
base=(S/'base.txt').read_text().strip()
def blob(path):return subprocess.check_output(['git','show',base+':'+path],text=True)
full=(R/files[2]).read_text();reader=(R/files[1]).read_text();extra='import Mathlib.RingTheory.MvPolynomial.Homogeneous\n'
incoming=(S/'IncomingNative.lean').read_text();new=(S/'New.lean').read_text();native=(S/'Native.lean').read_text();audits=(S/'Audits.lean').read_text()
assert hashlib.sha256(incoming.encode()).hexdigest()=='695a088a82bfd4d432a4af5bf41d4f1b99d33138db2bcf86f3d9c08c9973a3a5'
assert native==extra+incoming+new+audits and not re.search(r'\bsorry\b|\baxiom\b',native)
assert full.startswith(extra+blob(files[2])) and reader.endswith(blob(files[1]))
admitted=full.split('/- BEGIN POLYNOMIAL HOMOGENEOUS COMPARISON -/\n')[1].split('/- END POLYNOMIAL HOMOGENEOUS COMPARISON -/')[0]
def headers(text):
 matches=list(re.finditer(r'^(def|lemma|example)\b(?: (\w+))?',text,re.M));out=[]
 for i,m in enumerate(matches):
  raw=text[m.start():matches[i+1].start() if i+1<len(matches) else len(text)]
  sep=re.search(r' :=(?= by(?:\s)|\n| map_zero)',raw).start();header=raw[:sep]
  if i>=16:header=re.sub(r'^lemma \w+','example',header)
  out.append(' '.join(header.split()))
 return out
assert len(headers(new))==22 and headers(new)==headers(admitted)
for n in p['nodes'][157:]:
 assert n['declaration'] in reader and n['statement'] in reader
 assert re.search(r'^(def|lemma) '+re.escape(n['declaration'].removeprefix(NS))+r'\b',new,re.M)
 for a in n.get('api',[]):assert a['name'] in reader and a['statement'] in reader
 for t in n.get('tests',[]):assert t['statement'] in reader and '-- test: '+t['name'] in admitted
assert (S/'Canonical.lean').read_text()==full and (S/'NewAdmitted.lean').read_text()==admitted
lean={}
for name,count,warnings in [('Native',151,0),('Canonical',0,433)]:
 path=S/(name.lower()+'.log')
 if not path.exists():lean[name]='No local execution log supplied; source/header validation only.';continue
 log=path.read_text();assert 'Exit status: 0' in log and not re.search(r'error(?:\(|:)|sorryAx',log)
 assert log.count('warning:')==log.count('warning: declaration uses')==warnings
 assert log.count('depends on axioms:')+log.count('does not depend on any axioms')==count
 found=re.findall(r'depends on axioms: \[(.*?)\]',log,re.S)
 assert all(set(re.findall(r'\b(?:\w+\.)*\w+\b',v))<={'propext','Classical.choice','Quot.sound'} for v in found)
 lean[name]={'warnings':warnings,'audits':count,'exit':0}
tree=ast.parse((R/'research/blueprint/intake.py').read_text());names={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id in {'ALLOWED','PRIVATE'} for t in n.targets) or isinstance(n,ast.FunctionDef) and n.name in names]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs'] if j['id']=='BP-'+STEM)
problems=[x for path in files for x in env['file_problems'](path,(R/path).read_text())]
refusals=env['auto_refusals'](job,files,False,{'codex-7e92bd'},set());assert not problems and not refusals,(problems,refusals)
for path in files:
 text=(R/path).read_text();assert not re.search(r'[ \t]+$',text,re.M),path
 assert not re.search(r'/(?:home|Users)/[^/\s]+/',text),path
pub=(S/'publication-base.txt').read_text().strip() if (S/'publication-base.txt').exists() else base
changed=set(subprocess.check_output(['git','diff','--name-only',pub],text=True).splitlines());assert changed<=set(files),changed
sys.path.insert(0,str(R/'scripts'));import check_blueprint
errors,warnings,summary=check_blueprint.check(R/files[0],check_blueprint.load_index(Path(sys.argv[2])),check_blueprint.world());assert not errors and not warnings,(errors,warnings)
summary['packet']=files[0]
report={'oldNodeObjectsPreserved':157,'newHeadersMatched':16,'newTestsMatched':6,'incomingProofPreservedAfterOneImport':True,'canonicalPrefixPreservedAfterOneImport':True,'readerSuffixPreserved':True,'intakeFileProblems':problems,'intakeAutoRefusals':refusals,'checker':summary,'rawApiItems':sum(len(n.get('api',[])) for n in p['nodes']),'rawTests':sum(len(n.get('tests',[])) for n in p['nodes']),'lean':lean,'fullCanonicalCompiled':True,'scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
print(json.dumps(report,indent=2))
```

### graph.py (SHA-256 2ab5184487d1061bb9dde1ddb2b3f823e7ae4b9729eef348f694649fa0820292)

```python
from pathlib import Path
import sys,json,copy,collections
sys.path.insert(0,str(Path.cwd()/'scripts'))
import build,blueprints,check_blueprint
RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7'
p=json.loads((Path.cwd()/'research/blueprint/packets'/f'{STEM}.json').read_text())
original=json.loads(Path(sys.argv[1]).read_text())
new={n['id']:n for n in p['nodes']}
root=Path.cwd()
a0=json.loads((root/"data/atlas.json").read_text())
packets,documents,definitions=blueprints.load_promoted(root)
otherparts=[(stem,q) for stem,q in packets if q.get("roadmapId")==RID and stem!=STEM]
assert otherparts, "must preserve other promoted roadmap parts"
keep=[x for x in packets if x[0]!=STEM]
documents[STEM]="research/blueprint/readmes/"+STEM+".md"
def assemble(candidate):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(STEM,candidate)]),copy.deepcopy(documents),copy.deepcopy(definitions))
 return build.assemble(require_distances=False)[0]
a=assemble(p);b=assemble(original)
world={}
for folder in ["data/decompositions","data/blueprints","research/blueprint/packets"]:
 for path in sorted((root/folder).glob("*.json")):
  q=json.loads(path.read_text())
  for n in q.get("nodes",[]):world.setdefault(n["id"],n)
world.update(new)
stages={x["id"]:x for x in a["stages"]}
stageids=set(stages)|set(check_blueprint.world()[1])
stageedges={(e["source"],e["target"]) for e in a["stageEdges"]}
def dag(vertices,edges):
 vertices=set(vertices)|{v for edge in edges for v in edge}
 out=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for source,target in edges:
  if target not in out[source]:out[source].add(target);indeg[target]+=1
 stack=[v for v,count in indeg.items() if count==0];count=0
 while stack:
  v=stack.pop();count+=1
  for w in out[v]:
   indeg[w]-=1
   if indeg[w]==0:stack.append(w)
 assert count==len(vertices),[v for v,count in indeg.items() if count][:15]
 return {"vertices":len(vertices),"edges":len(edges),"acyclic":True}
ownedges={(q,nid) for nid,node in new.items() for q in node.get("prerequisites",[]) if q in new}
stack=list(new);seen=set();dep=set();unresolved=set();baseref=set()
while stack:
 nid=stack.pop()
 if nid in seen:continue
 seen.add(nid)
 for q in world[nid].get("prerequisites",[]):
  if q.startswith(("mathlib:","tauceti:")) and q not in stageids:baseref.add(q);continue
  dep.add((q,nid))
  if q in world:stack.append(q)
  elif q not in stageids:unresolved.add(q)
assert not unresolved,sorted(unresolved)
dep|={(world[nid]["parentStageId"],nid) for nid in seen if world[nid].get("parentStageId") in stageids or world[nid].get("parentStageId") in world}
dep|={(request["supplier"],consumer) for request in p.get("requests",[]) for consumer in request.get("neededBy",[]) if consumer in new or consumer in stageids}
roadmap=next(r for r in a["roadmaps"] if r["id"]==RID)
expected_decl=len(new)+sum(len(q["nodes"]) for _,q in otherparts)
assert roadmap["blueprint"]["declarations"]==expected_decl,(roadmap["blueprint"],expected_decl)
assert not roadmap["blueprint"]["skippedLinks"] and not roadmap.get("pendingLinks",[])
assert stageedges=={(e["source"],e["target"]) for e in b["stageEdges"]}
def skips(atlas):
 return {r["id"]:(r.get("blueprint",{}).get("skippedLinks",[]),r.get("pendingLinks",[])) for r in atlas["roadmaps"] if r["id"]!=RID}
assert skips(a)==skips(b)
out=collections.defaultdict(set)
for source,target in stageedges:out[source].add(target)
def reachable(source,target):
 stack=[source];seen=set()
 while stack:
  v=stack.pop()
  if v==target:return True
  if v in seen:continue
  seen.add(v);stack.extend(out[v]-seen)
 return False
pairs={(e["source"],e["target"]) for e in a0["stageEdges"] if e["target"].startswith(RID+":")}
for node in p["nodes"]:
 for q in node.get("prerequisites",[]):
  if q in stageids and q not in world and q!=node["parentStageId"]:pairs.add((q,node["parentStageId"]))
for req in p.get("requests",[]):
 for consumer in req.get("neededBy",[]):
  if consumer in new:pairs.add((req["supplier"],new[consumer]["parentStageId"]))
  elif consumer in stageids:pairs.add((req["supplier"],consumer))
missingpairs={(s,t) for s,t in pairs if not reachable(s,t)}
oldout=collections.defaultdict(set)
for edge in b['stageEdges']:oldout[edge['source']].add(edge['target'])
def reachable0(source,target):
 stack=[source];seen=set()
 while stack:
  v=stack.pop()
  if v==target:return True
  if v in seen:continue
  seen.add(v);stack.extend(oldout[v]-seen)
 return False
assert missingpairs=={(s,t) for s,t in pairs if not reachable0(s,t)}
assert missingpairs=={('tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions',RID+':R03.4')}
assert any('LocalFieldsRamification layer 0 to R03.4' in gap['detail'] for gap in p['gaps'])
# Independently retain all accepted restructure links touching the whole roadmap.
acceptedpairs=set()
for path in (root/"research/blueprint/restructure").glob("*.result.json"):
 q=json.loads(path.read_text())
 if q.get("review",{}).get("status")!="accepted":continue
 for row in q.get("links",[]):
  if any(row.get(k,"").startswith(RID+":") for k in ["source","target"]):
   acceptedpairs.add((row["source"],row["target"]))
assert all(reachable(s,t) for s,t in acceptedpairs),[(s,t) for s,t in acceptedpairs if not reachable(s,t)]
report={"stageDAG":dag(stages,stageedges),"ownDAG":dag(new,ownedges),
 "combinedDAG":dag(set(stages)|seen,stageedges|dep),"reachableDeclarations":len(seen),
 "externalDeclarations":sorted(seen-set(new)),"reachableBaselineReferences":len(baseref),
 "unresolved":sorted(unresolved),"otherPartsRetained":[stem for stem,_ in otherparts],
 "partDeclarations":len(new),"partPlanets":sum("planet" in n for n in p["nodes"]),
 "roadmapDeclarations":roadmap["blueprint"]["declarations"],
 "requiredStagePairs":len(pairs),"requiredStagePairsReachable":len(pairs)-len(missingpairs),
 "inheritedMissingStagePairs":sorted(missingpairs),
 "acceptedRestructurePairs":len(acceptedpairs),"acceptedRestructurePairsReachable":len(acceptedpairs),
 "stageEdgesUnchanged":True,"otherSkippedPendingUnchanged":True,"ownSkippedPendingEmpty":True}
print(json.dumps(report,ensure_ascii=False,indent=2),flush=True)
```

---

The complete incoming handoff follows as credited historical evidence. Its earlier source and verification receipts remain attributed to their authors.

# Degree-wise actual initial relations — #551 checkpoint

Codex — codex-a71f92, 2026-10-03. Claim 5964959432 was confirmed explicitly
by bot 5964960489 after the whole issue was reread.
Mathematical base: `7a0839ba10a362fba9724a9704e986412ea03aa8`.
Publication base: `9c8a340faae54f977214d1a159764c3ca25a1e0e`.
Only the four issue-authorized deliverables change. The shared checkout
was read-only; no repository snapshot, library build, new Lake project,
cache fetch, language server, manual merge/label change or worker delegation
was used.

## Result and remaining boundary

Ten new declaration nodes (one actual coefficient-linear projection and nine
lemmas), five API items and six typed tests provide the two directions of
the principal-equation degree relation and actual projection kernel.
For finite σ, R=k[[X_i]], v=span(X_i) and g∈v^n, HC_n(g)=0 iff
g∈v^(n+1). With no-zero-divisors k, exact order(f)=d≤n, actual
denominator membership is equivalent to HC_n(g)=HC_d(f)·w for a
homogeneous degree-(n−d) series w. The strict-below-order and zero-equation
branches require no domain. The projection definition and its quotient
representative API need no finiteness of σ.

The codex-a71f92 continuation proves the actual degree-wise series/ideal kernel adapters and coefficient-linear equation-jet projection, including both principal relation directions, small-index, zero/unit and characteristic-two nonreduced tests. It preserves the complete incoming proof prefix. Still construct the polynomial-valued homogeneous comparison, identify the map's image with the existing q^n/q^(n+1) carrier, and assemble the multiplicatively compatible full tangent-cone graded isomorphism. Curve/support dimension, comparison with the general Hilbert–Samuel constructor, intrinsic/ambient multiplicities, general Hilbert–Serre, Artin–Rees, completion, localization, associativity, all eight stage targets and every routed source obligation remain required; canonical bodies remain admitted and every node remains unchecked and every stage retains its incoming partial or not_read status.

All 147 incoming node objects and the reserved general multiplicity node
are unchanged. No existing gap, request, source issue, route, supplier,
boundary field or source receipt is deleted or reattributed. Preserve all
eight stage statuses exactly: P7/R03.3/R03.4 partial; the other five not_read.
Every mathematical implementation status remains unchecked, and the whole
packet remains partial. The reader append supplies individual statements,
proof steps, inputs, API and discriminating tests; the suggested append
has matching native mathematical headers and six typed examples.

## Reading and source discipline

The current WORKERS and governing protocols were hash-confirmed at the
immutable base. The accepted scoped AUDIT-17 rows and complete accepted
review were read before math planning, as were applicable accepted RS-08
ownership and narrowing records, its architecture/conservation text and
whole campaign document. The two whole upstream style examples read in
this continuous session are JacobianChallenge and StableReduction;
their blobs at this base match the previously read exact blobs.

Credited DDPA-JET-HANDOFF §§3–5 were personally read with the actual
equation (9), both kernel directions and the remaining full graded map.
The generalized series/ideal adapters are authored deductions from that
proof and the already proved native finite-variable order equivalence;
they are not claimed as a newly printed theorem. Selected pinned native
homogeneous-component, order, ideal-sum and quotient/linear-map statements
were read with their hypotheses. Complete Stacks 00K4 mathematical content
was read for its conventions. Bounded pinned concept, open Mathlib issue/PR
and Zulip screens supply no additional implementation assumption. Source
hashes and exact reading extent are in HS-INITIAL-RELATION-PIN-a71f92;
all whole-paper/routed-source backlog stays attributed and open.

## Checks and resources

Native proof SHA-256:
`695a088a82bfd4d432a4af5bf41d4f1b99d33138db2bcf86f3d9c08c9973a3a5`.
Canonical suggested SHA-256:
`d4436ea6117da50ee365d6886425697862cfebae297be2f735cfdca3a279bc6e`.
Incoming native prefix SHA-256:
`5a8f33443d5002d6d11eb5a4b513cfdafc36fa8fd4cf0a2874ea4b2b504a0389`.

The complete 2251-line native proof passes with 129 distinct axiom audits,
only propext/Classical.choice/Quot.sound, no admissions and no warnings/errors.
Its complete 2018-line incoming prefix is byte-preserved. Six new named tests
cover zero input, units, zero equation survival, characteristic-two degree-one
survival and degree-two equation annihilation, and the exact n=d boundary.
The complete 3134-line canonical file passes with 411 placeholder warnings
only and 207 examples. The native file contains 64 anonymous inherited
examples in addition to its inherited/new named tests.

Both compiles used the already existing Lean 4.34.0-rc2 / Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174 build. Tau Ceti source pin
f790474821cf4256814db967cb154e7af3d0c369 was checked; no Tau Ceti import is
required by this suggested file. Available memory was 38–39 GiB before
each compile. One Lean process ran at a time under a 1200-second limit.
Final native time was 10.70 seconds, peak RSS 3567696 KiB. No process is
left running. Source/log scratch remained under 2 MiB before replay and
is removed recoverably after the PR opens.

Actual indexed scripts/check_blueprint.py logic returns no errors/warnings:
157 nodes, 139 API items, 129 required definition/construction tests,
13 planets, 292 baseline declarations, 15 gaps and 2 requests.
(The all-node test count, including lemma fixtures, is printed by the
supplementary validator.) Actual intake file rules pass. The actual
immutable build.assemble output retains R03.6 and 210 whole-roadmap
declarations. Own and scoped combined DAGs are acyclic, with no unresolved
references; all incoming stage edges and other roadmap skipped/pending
records are unchanged. All 65 accepted restructure pairs are reachable.
Of 13 required supplier pairs, 12 are reachable. The one missing
LocalFieldsRamification layer 0 → R03.4 pair is inherited and control-equal;
it is a separate ownership/integration boundary, not repaired here.

## Durable public replay

[Public proof/check archive 1ee3d626cd226cffc0ee869aff618df03e133c65](https://github.com/CBirkbeck/tauceti-explorer/commit/1ee3d626cd226cffc0ee869aff618df03e133c65)
is the final head's second parent and changes only the same four authorized
paths. Its suggested-file comment contains the exact full native proof
between BEGIN/END ARCHIVED CHECKED INITIAL RELATIONS codex-a71f92 markers.
Its handoff contains full path-normalized native/canonical logs, the actual
validation receipt, and complete immutable_view.py / validate.py scripts.
No private scratch directory is needed to resume.

The recovery program below extracts only the issue's four files and exact
proof/check evidence, using apply_patch for writes. Supply REPO as the
existing clone, REPLAY_SCRATCH as a new empty disk scratch directory, ARCHIVE
as 1ee3d626cd226cffc0ee869aff618df03e133c65, and CANDIDATE as the immutable PR head. Read-only git fetch
of those exact commits is permitted; never clone/copy the repository.

```python
"""Recover only the four issue deliverables and their exact native replay evidence."""
import hashlib,sys,subprocess
from pathlib import Path
repo=Path(sys.argv[1]).resolve();dst=Path(sys.argv[2]).resolve()
archive=sys.argv[3];candidate=sys.argv[4]
stem="DeformationAndDerivedPatchingAlgebra--P7"
paths={
"research/blueprint/packets/"+stem+".json":"packet.json",
"research/blueprint/readmes/"+stem+".md":"reader.md",
"research/blueprint/suggested/"+stem+".lean":"Canonical.lean",
"research/blueprint/handoff/BP-"+stem+".md":"handoff.md"}
def blob(commit,path):
 return subprocess.check_output(["git","show",commit+":"+path],cwd=repo).decode()
archlean=blob(archive,"research/blueprint/suggested/"+stem+".lean")
marker="\n/- BEGIN ARCHIVED CHECKED INITIAL RELATIONS codex-a71f92\n"
end="END ARCHIVED CHECKED INITIAL RELATIONS codex-a71f92 -/\n"
assert archlean.count(marker)==1
canonical,native=archlean.split(marker);native=native.rsplit(end,1)[0]
assert hashlib.sha256(native.encode()).hexdigest()=="695a088a82bfd4d432a4af5bf41d4f1b99d33138db2bcf86f3d9c08c9973a3a5"
assert hashlib.sha256(canonical.encode()).hexdigest()=="d4436ea6117da50ee365d6886425697862cfebae297be2f735cfdca3a279bc6e"
hand=blob(archive,"research/blueprint/handoff/BP-"+stem+".md")
def section(heading,language):
 tail=hand.split("\n## "+heading+"\n",1)[1]
 data=tail.split("\n```"+language+"\n",1)[1].split("\n```\n",1)[0]
 return data if data.endswith("\n") else data+"\n"
files={name:blob(candidate,path)for path,name in paths.items()}
assert files["Canonical.lean"]==canonical
files.update({"Native.lean":native,
"Native.log":section("Native log (machine paths normalized)","text"),
"Canonical.log":section("Canonical log (machine paths normalized)","text"),
"validation.log":section("Actual immutable validation log (path normalized)","text"),
"immutable_view.py":section("Exact immutable view","python"),
"validate.py":section("Exact validator","python")})
assert dst.is_dir() and not any((dst/name).exists()for name in files)
patch="*** Begin Patch\n"
for name,data in files.items():
 assert data.endswith("\n"),name
 patch+="*** Add File: "+str(dst/name)+"\n"+"\n".join("+"+line for line in data[:-1].split("\n"))+"\n"
patch+="*** End Patch\n"
subprocess.run(["apply_patch"],input=patch,text=True,check=True,stdout=subprocess.DEVNULL)
print("Recovered exact issue files, native proof, normalized logs and actual validator; no repository snapshot.")

```

Run recovery and the actual validator against the stated immutable
publication base. The recovered compile logs document the exact checked
bytes; to rerun Lean, first verify the existing build pins and free -g,
then run Native.lean and Canonical.lean sequentially, each with timeout 1200.
Do not compile below 20 GiB available, set up a project, build libraries,
or start a language server.

```bash
python3 recover.py "$REPO" "$REPLAY_SCRATCH" "$ARCHIVE" "$CANDIDATE"
TAUCETI_REPO="$REPO" N11_VALIDATE_BASE=9c8a340faae54f977214d1a159764c3ca25a1e0e TAUCETI_BASELINE="$PINNED_BASELINE" python3 "$REPLAY_SCRATCH/validate.py"
```

The publication replay is exercised byte-for-byte before opening the PR;
the validator is rerun on the recovered files without repeating the
unchanged compiler run. Submission uses Refs #551, not a closing keyword.
The bot performs intake; no manual merge or labels.

## Where to resume

First compare native homogeneous series with homogeneous polynomials,
then identify the actual projection image with the existing q^n/q^(n+1)
carrier and assemble the full graded algebra map/isomorphism with generator,
component and multiplication specifications. Only after native curve/support
dimension is proved, compare the actual unique eventual polynomial with
the existing general constructor and extract intrinsic/ambient multiplicity.
Do not change the general reserved key into this special case. General
Hilbert–Serre, support/degree, Artin–Rees, completion, localization, associativity,
all stage targets and every routed-paper/source correction remain required.

---

The complete incoming handoff follows as credited historical evidence;
its earlier reading and check receipts belong to their respective authors.

# Actual plane quotient lengths determine unique rational polynomials — #551 checkpoint

Codex — codex-5ebb6f, 2026-10-03. Winning [claim 5964618237](https://github.com/CBirkbeck/tauceti-explorer/issues/551#issuecomment-5964618237), confirmed by [bot 5964619220](https://github.com/CBirkbeck/tauceti-explorer/issues/551#issuecomment-5964619220).
Mathematical base `1cb7fbca1727576cfc5c3fa0de58b9f1092552ea`; publication base `0f8afef629b4d0be5a436d2d5da7112ee34a9999`.
This is a partial planning checkpoint, with all eight stages partial and every implementation status unchecked.

For every field k and actual A=k[[x,y]]/(f), q=image(x,y), native finite
order(f)=d gives the explicit rational polynomial P_d=d(T+1)−d(d−1)/2.
The native proof independently establishes that this is the unique polynomial
agreeing eventually with actual cumulative quotient lengths. It supplies the
sharp witness max(0,d−2), accepts a competing polynomial with any tail witness,
and uses pinned Mathlib infinite-evaluation uniqueness on the infinite rational
image of a natural tail. It needs no general Hilbert–Serre premise, Noetherian
or local instance on A, reducedness, irreducibility, algebraic closure,
perfectness or coefficient-characteristic restriction. Finiteness precedes the
natural-value conversion, inherited from the checked actual finite-jet proof.

Polynomial degree is one at d>0, its leading coefficient is d, and
natDegree! times leadingCoeff equals d for all d. At d=0, P₀=0, with
ordinary polynomial degree −∞ and native natural degree zero. This does not
assign dimension zero to a zero module. For f=0 the separate actual quotient
has unique polynomial Q=(T+1)(T+2)/2, degree two and leading coefficient 1/2;
its factorial coefficient is one. The zero series has infinite order, while a
unit equation has order zero and gives the zero quotient. The actual scalar
field may be F₂, but the lengths and polynomials here are recorded in ℕ and ℚ.
No rational denominator is used inside that coefficient field.

Seventeen new nodes are two constructions and fifteen lemmas, all in R03.3.
Nine usable API items and eleven named tests accompany them. The existing
plane-curve-polynomial node gains only one prerequisite and one appended proof
step: use this independently verified special-case existence before comparing
with the general constructor’s eventual-value specification. Equality with
that unfinished general constructor is not certified by this prototype.
The reserved general multiplicity node is unchanged; extracting a coefficient
from an explicit polynomial is not a second definition of multiplicity.

All 130 incoming contracts are preserved; 129 complete node objects are
unchanged. Inventory is 147 nodes (8 definitions, 24 constructions, 99 lemmas,
16 theorems), 134 API items, 177 tests including 123 definition/construction
tests, 281 indexed baseline declarations, 13 planets, 15 gaps and two supplier
requests. Every source object and route, earlier continuation receipt, request,
gap, source finding, old remaining list and planet is retained. One precise
remaining entry is appended to R03.3. Reader and canonical source preserve their
complete incoming text, with only three imports added before the canonical
prefix. The scope and general key contract are unchanged.

## Reading, credit and ownership

The whole current issue was read before claiming and reread after the bot
confirmed this session’s claim. WORKERS was reread on this branch; the binding
blueprint, expansion and upstream instructions were read in this continuous
session, with the blueprint closure/API and §§12–15 reread for this checkpoint.
At least two upstream documents had been read in this continuous session;
no new whole-upstream-document reading is asserted here. The actual campaign
scope, all eight applicable complete reviewed AUDIT-17 rows, the accepted RS-08
review and applicable narrowing/owner records, the exact reserved key node,
maintained key survey and owner, and the complete scoped ModularCurves overlap
entry were read. Generic rational polynomial operations are imported from
Mathlib; R03.3 owns these local-algebra adapters. Other stage owners are retained.

Fresh mathematics reading covers the complete credited authored
[DDPA-CURVE-POSTULATION §§1–3](https://github.com/CBirkbeck/tauceti-explorer/blob/ab76ddae905be2ec38836c070c5495c6d1c4e3c0/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md), including each finite-jet and sharp-cutoff proof in those sections;
[Stacks 00K4](https://stacks.math.columbia.edu/tag/00K4) opening graded/cumulative
conventions and Proposition 10.59.5 with its complete proof; and selected exact
native statements and proofs at the Mathlib pin. These include Roots uniqueness,
linear/quadratic degree and leading coefficient, infinite natural intervals,
the infinite-image equivalence with its Infinite.image alias, rational cast
injectivity, and the complete HilbertPoly uniqueness proof whose infinite-image
argument is adapted. HilbertPoly’s rational-generating-function constructor is
already built and is not the missing general module Hilbert–Samuel theorem.
The new special-case existence and coefficient deductions are authored adapters,
not an allegation that Stacks prints this special computation.

The new exact-pin records include source files, lines and hashes for seven
additional indexed declarations. The existing broader Roots uniqueness record
is reused. Bounded RingTheory/MvPowerSeries and Polynomial name screens found no
existing actual plane quotient-length/postulation adapters in those searched
areas; this is not an exhaustive absence survey. Mathlib [PR #9819](https://github.com/leanprover-community/mathlib4/pull/9819) remains OPEN at
`413e5b872a7c758e0eb91f99cb96d6a61c81f0a2`; no unmerged result is imported.
Bounded public Zulip searches produced no additional applicable API decision.
No fresh complete routed-paper collation or whole-packet node-by-node audit is
claimed. No new source mistake is alleged. All inherited findings remain.

The complete 1732-line predecessor is recovered, hash-verified, preserved
verbatim after the three imports, and rerun within the 2018-line combined proof.
Selected relevant proof bodies were read; the whole predecessor was not freshly
read line by line. Its SHA-256 is
`e98df77f9ff9b57b919b0a829e5dd8eb23e52a8c5a6c603609350e727756a5a1`.
Credit remains with all predecessor authors: codex-J6LwjP, codex-a71f92,
codex-5ebb6f, codex-rtOQ9t, codex-7e92bd, ChatGPT — gpt6astra-20261002-7d2f90,
and ChatGPT Pro — cp-20261002-sr-c72e81. Generic proof adaptation credits the
Mathlib authors, including Fangming Li and Jujian Zhang’s HilbertPoly proof.
Earlier computational receipts beyond the recovered source remain historical.

## Complete-file validation

Both complete files elaborate in the existing Lean 4.34.0-rc2 build against
exact Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; neither imports a
Tau Ceti module. The independent source baseline is exact Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, not an assertion that a Tau Ceti
build is certified. A single compiler ran at a time with timeout 1200 and
43 GiB available before each final check. No project setup, library build,
cache retrieval, language server or background compiler was started or left.

The native file has 64 retained examples and eleven new named test proofs,
113 distinct transitive axiom audits, and no errors, warnings or admissions.
Only propext, Classical.choice and Quot.sound occur in the axiom lists.
The canonical suggested file has 201 examples and exactly 396 admitted-proof
warnings, no other warnings or errors. Its 18 mathematical headers and all
11 new example types match the native statements after whitespace normalization.
The small private linear-normal-form proof is only a native proof step, not an
additional canonical mathematical contract.

The fixtures check quartic polynomial 4T−2; smooth T+1; unit zero with degree
−∞; actual characteristic-two arbitrary-tail uniqueness; sharp agreement
starting at two and failing at one; cumulative polynomial distinct from the
constant graded value; the F₂ expression 4T−2 vanishing while actual H(0)=1;
Q’s quadratic shape and all-index actual lengths; distinct actual zero/unit
quotients; and uniqueness for the zero equation. They use actual quotients,
not carriers defined by their expected dimension or length.

```json
{
  "Native": {
    "sourceSha256": "5a8f33443d5002d6d11eb5a4b513cfdafc36fa8fd4cf0a2874ea4b2b504a0389",
    "diagnosticSha256": "110907d3bb3f65b2283c46b20d290c23ac43fca586952f6985bd7329ef70eb17",
    "lines": 2018,
    "bytes": 99933,
    "examples": 64,
    "newNamedTests": 11,
    "errors": 0,
    "warnings": 0,
    "admissionWarnings": 0,
    "axiomAudits": 113,
    "sorryAxInAudits": 0,
    "availableGiBBeforeCompile": 43,
    "elapsed": "0:09.34",
    "maxRSSKiB": 3562840,
    "exitStatus": 0
  },
  "Canonical": {
    "sourceSha256": "d79478f1e937c1b3047a92677e71b7ee3bec1eb95c99030f3a99188301414a9e",
    "diagnosticSha256": "314462559f7a6fc1660365ebff1eeaff75c6d070b4f727b74ecdf4d57d93783a",
    "lines": 3034,
    "bytes": 149522,
    "examples": 201,
    "newNamedTests": 11,
    "errors": 0,
    "warnings": 396,
    "admissionWarnings": 396,
    "axiomAudits": 0,
    "sorryAxInAudits": 0,
    "availableGiBBeforeCompile": 43,
    "elapsed": "0:25.61",
    "maxRSSKiB": 3574948,
    "exitStatus": 0
  }
}
```

Indexed packet and actual intake validation report no errors, warnings or
file refusals. The actual assembler retains the other R03.6 part, all stage
edges, other-roadmap skipped/pending links and empty own skipped/pending lists.
All 65 accepted restructure links touching this roadmap are reachable.
Twelve of thirteen inherited supplier pairs are reachable; the same inherited
LocalFieldsRamification layer-0 → R03.4 owner-reconciliation boundary remains.
It is checked against the incoming control rather than silently repaired here.
Stage, own declaration and scoped combined graphs are acyclic, with no
unresolved declaration references. Eighteen governing/source/ownership/scoped
catalogue/checker inputs were byte-identical between the mathematical and
publication bases; unrelated merged roadmaps are retained in the branch.

```json
{
  "publicationBase": "0f8afef629b4d0be5a436d2d5da7112ee34a9999",
  "mathematicalBase": "1cb7fbca1727576cfc5c3fa0de58b9f1092552ea",
  "checker": {
    "roadmap": "DeformationAndDerivedPatchingAlgebra",
    "status": "partial",
    "nodes": 147,
    "kinds": {
      "lemma": 99,
      "theorem": 16,
      "definition": 8,
      "construction": 24
    },
    "apiItems": 134,
    "unitTests": 123,
    "planets": 13,
    "baselineDeclarations": 281,
    "prerequisites": {
      "baseline": 366,
      "node (this packet)": 221,
      "node (integrated)": 1
    },
    "gaps": 15,
    "requests": 2,
    "stagesInScope": 8,
    "stagesClosed": 0
  },
  "errors": [],
  "warnings": [],
  "intake": "pass",
  "preservedContracts": 130,
  "preservedWholeNodes": 129,
  "newNodes": 17,
  "mathHeadersMatched": 18,
  "newTestTypesMatched": 11,
  "allAPIItems": 134,
  "allTests": 177,
  "nativeAxiomAudits": 113,
  "canonicalAdmissionWarnings": 396,
  "nativeSha256": "5a8f33443d5002d6d11eb5a4b513cfdafc36fa8fd4cf0a2874ea4b2b504a0389",
  "canonicalSha256": "d79478f1e937c1b3047a92677e71b7ee3bec1eb95c99030f3a99188301414a9e",
  "stageDAG": {
    "vertices": 3003,
    "edges": 8623,
    "acyclic": true
  },
  "ownDAG": {
    "vertices": 147,
    "edges": 221,
    "acyclic": true
  },
  "scopedCombinedDAG": {
    "vertices": 3138,
    "edges": 8992,
    "acyclic": true
  },
  "reachableDeclarations": 148,
  "externalDeclarations": [
    "DeformationAndDerivedPatchingAlgebra:R03.3/depth-auslander-buchsbaum-and-dimension-bounds"
  ],
  "baselineLeaves": 250,
  "unresolvedReferences": 0,
  "otherPartsRetained": [
    "DeformationAndDerivedPatchingAlgebra--R03.6"
  ],
  "roadmapDeclarations": 200,
  "supplierStagePairs": 13,
  "supplierStagePairsReachable": 12,
  "inheritedMissingPairs": [
    [
      "tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions",
      "DeformationAndDerivedPatchingAlgebra:R03.4"
    ]
  ],
  "acceptedRestructurePairs": 65,
  "acceptedRestructurePairsAllReachable": true,
  "stageEdgesUnchanged": true,
  "otherSkippedPendingUnchanged": true,
  "ownSkippedPendingEmpty": true,
  "changedPaths": [
    "research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md",
    "research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--P7.json",
    "research/blueprint/readmes/DeformationAndDerivedPatchingAlgebra--P7.md",
    "research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean"
  ]
}
```

## Public recovery and reproduction

The checked source is publicly archived in immutable ancestor
[17609bb00b2bdb9f50bb72f35150dd692670fb44](https://github.com/CBirkbeck/tauceti-explorer/blob/17609bb00b2bdb9f50bb72f35150dd692670fb44/research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean)
between ACTUAL CURVE POLYNOMIALS markers. Its prefix is the exact canonical
source. The inert archive comment is absent from the final signature plan.
All public evidence stays within the four allowed deliverables.

Save this first complete Python fence as recover.py in small disk scratch.
Its SHA-256 is `2fc0839354a4d577106a8b9c21e6f1917bfd078cc149ada1334ed5eb06d775fa`.
It fetches immutable public sources and byte-verifies fifteen proof, control
and script files; mathematical and publication bases are separate controls.
Pass this submitted handoff’s filename as the second argument, so its second
Python fence supplies the exact complete validator below. Use the existing
clone, existing exact-pin build and exact pinned declaration-index file.
No second clone or Lake project is required.

```python
from pathlib import Path
import urllib.request,hashlib,sys,re,json
S=Path(sys.argv[1]);S.mkdir(parents=True,exist_ok=True)
ROOT="https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/"
PATH="research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean"
ARCHIVE='17609bb00b2bdb9f50bb72f35150dd692670fb44'
MATHBASE='1cb7fbca1727576cfc5c3fa0de58b9f1092552ea'
PUBLICATIONBASE='0f8afef629b4d0be5a436d2d5da7112ee34a9999'
EXPECTED={
  "Native.lean": "5a8f33443d5002d6d11eb5a4b513cfdafc36fa8fd4cf0a2874ea4b2b504a0389",
  "Canonical.lean": "d79478f1e937c1b3047a92677e71b7ee3bec1eb95c99030f3a99188301414a9e",
  "IncomingNative.lean": "e98df77f9ff9b57b919b0a829e5dd8eb23e52a8c5a6c603609350e727756a5a1",
  "IncomingCanonical.lean": "8365614bae72634c89a572179f90864b4ad8468c32b57b2dfe1f9e501703f55c",
  "NewPolynomials.lean": "417bb9416a669deb4e17021f4294d376968cc67d0923067b0bd0708cde6707a3",
  "PolynomialTests.lean": "80dc6b7aea0138d15241b3fef0bb6a488c41d8268cedd320bf3d8390974e5a78",
  "NewImports.lean": "176a28725435fa3476d182aafc22cf7452c13325749df801dac22e01ffd7bc6a",
  "NewAudits.lean": "351d9b1bbc8fdc3636a82bdd4d48896968930c70d6d97171a167e8400e88d4df",
  "new-canonical.lean": "444364f7aaae21c29f0d4454309d6bb5597d9b868bacd7ba6f482c97c29461e3",
  "math-names.json": "79bb7ecfa3bf4036ee92f17466abd8a05e4807052d759baa979bb652a744dc95",
  "DeformationAndDerivedPatchingAlgebra--P7.json": "b5138a2a0825bd243d127a12a660e1be7401d30bf4d7084beb74d03295dac029",
  "DeformationAndDerivedPatchingAlgebra--P7.md": "cf7c4e45d2ee54f969cade07f87eb55290a0956c8f21d6f6f9bd393866afdd03",
  "DeformationAndDerivedPatchingAlgebra--P7.lean": "8365614bae72634c89a572179f90864b4ad8468c32b57b2dfe1f9e501703f55c",
  "BP-DeformationAndDerivedPatchingAlgebra--P7.md": "eaeda2630c43774f92f7d1cac584a45dde23a14853b72788089e6f1f5ddd3840",
  "validate.py": "e5256413c88f1265c89ad08465bcef609200d01cad63d35a2006cb4d9563b4f2"
}
def get(commit,path=PATH):return urllib.request.urlopen(ROOT+commit+"/"+path,timeout=90).read()
def put(name,data):
 assert hashlib.sha256(data).hexdigest()==EXPECTED[name],name
 (S/name).write_bytes(data)
b=get(ARCHIVE)
c,tail=b.split(b"\n/- BEGIN ARCHIVED CHECKED ACTUAL CURVE POLYNOMIALS\n",1)
n=tail.split(b"\nEND ARCHIVED CHECKED ACTUAL CURVE POLYNOMIALS -/\n",1)[0]
put("Canonical.lean",c);put("Native.lean",n)
p=get("277c8f6129fe7d98b31c9f204f34a5f0f8214e95")
incoming=p.split(b"\n/- BEGIN ARCHIVED CHECKED SHARP PLANE CURVE POSTULATION\n",1)[1].split(b"\nEND ARCHIVED CHECKED SHARP PLANE CURVE POSTULATION -/\n",1)[0]+b"\n"
put("IncomingNative.lean",incoming)
imports=b"import Mathlib.Algebra.Polynomial.Roots\nimport Mathlib.Algebra.Polynomial.Degree.SmallDegree\nimport Mathlib.Order.Interval.Set.Infinite\n"
put("NewImports.lean",imports)
assert n.startswith(imports+incoming)
new,rest=n[len(imports+incoming):].split(b"\nnamespace TauCeti.HilbertSamuel.CurvePolynomialTests",1)
test,au=(b"\nnamespace TauCeti.HilbertSamuel.CurvePolynomialTests"+rest).split(b"\n#print axioms TauCeti.HilbertSamuel.planeCurvePolynomial\n",1)
put("NewPolynomials.lean",new)
put("PolynomialTests.lean",test)
put("NewAudits.lean",b"\n#print axioms TauCeti.HilbertSamuel.planeCurvePolynomial\n"+au)
for directory,extension in [("packets","json"),("readmes","md"),("suggested","lean")]:
 name="DeformationAndDerivedPatchingAlgebra--P7."+extension
 put(name,get(MATHBASE,"research/blueprint/"+directory+"/"+name))
put("BP-DeformationAndDerivedPatchingAlgebra--P7.md",get(MATHBASE,"research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md"))
old=(S/"DeformationAndDerivedPatchingAlgebra--P7.lean").read_bytes()
put("IncomingCanonical.lean",old)
assert c.startswith(imports+old)
put("new-canonical.lean",c[len(imports+old):])
math_names=['planeCurvePolynomial', 'planeCurvePolynomial_eval', 'planeCurvePolynomial_zero', 'planeCurvePolynomial_natDegree', 'planeCurvePolynomial_leadingCoeff', 'planeCurvePolynomial_factorial_leadingCoeff', 'planeSurfacePolynomial', 'planeSurfacePolynomial_eval', 'planeSurfacePolynomial_natDegree', 'planeSurfacePolynomial_leadingCoeff', 'planeCurvePolynomial_eval_iff', 'planeCurvePolynomial_tail', 'planeCurvePolynomial_unique', 'planeCurve_existsUnique_polynomial', 'planeZeroEquation_polynomial_eval', 'planeZeroEquation_polynomial_unique', 'planeZeroEquation_existsUnique_polynomial', 'planeSurfacePolynomial_factorial_leadingCoeff']
put("math-names.json",(json.dumps(math_names,indent=2)+"\n").encode())
# Read the submitted handoff at the existing submitted clone; its second Python fence is this exact validator.
h=Path(sys.argv[2]).read_text()
fences=re.findall(r"```python\n(.*?)\n```",h,re.S)
assert len(fences)>=2
put("validate.py",(fences[1]+"\n").encode())
(S/"base.txt").write_text(MATHBASE+"\n")
(S/"publication-base.txt").write_text(PUBLICATIONBASE+"\n")
print("Recovered 15 byte-verified proof/control/script files plus mathematical and publication bases.")
```

Save this second complete Python fence as validate.py if reproducing it
separately. SHA-256 `e5256413c88f1265c89ad08465bcef609200d01cad63d35a2006cb4d9563b4f2`.
It uses the actual submitted packet checker, intake file rules and assembler,
reads mathematical controls from the immutable base, and checks changed paths
against the publication base. VALIDATE_BASE may override only the path-comparison
base when auditing a later merged checkout. It performs no repository or atlas
writes. The checker consumes fresh complete compile logs in the same scratch.

```python
from pathlib import Path
import sys,json,re,ast,hashlib,collections,copy,subprocess,os
R=Path(sys.argv[1]).resolve();S=Path(sys.argv[2]).resolve();INDEX=Path(sys.argv[3])
RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7';PREFIX='research/blueprint/'
FILES=[PREFIX+x+'/'+STEM+'.'+e for x,e in [('packets','json'),('readmes','md'),('suggested','lean')]]+[PREFIX+'handoff/BP-'+STEM+'.md']
MATHBASE=(S/'base.txt').read_text().strip();BASE=os.getenv('VALIDATE_BASE',(S/'publication-base.txt').read_text().strip())
def blob(path):return subprocess.check_output(['git','show',MATHBASE+':'+path],cwd=R)
def sha(data):return hashlib.sha256(data).hexdigest()
p0=json.loads(blob(FILES[0]));p=json.loads((R/FILES[0]).read_text())
old={n['id']:n for n in p0['nodes']};new={n['id']:n for n in p['nodes']};added={k:n for k,n in new.items()if k not in old}
assert len(old)==130 and len(new)==147 and len(added)==17
changed_node=RID+':R03.3/plane-curve-polynomial'
for nid,n0 in old.items():
 for key in n0:
  if nid==changed_node and key in {'prerequisites','proofSteps'}:assert new[nid][key][:-1]==n0[key],(nid,key)
  else:assert new[nid][key]==n0[key],(nid,key)
assert all(new[k]==v for k,v in old.items()if k!=changed_node)
for key in p0:
 if key not in {'summary','nodes','baseline','sources','coverage'}:assert p[key]==p0[key],key
assert set(p)-set(p0)=={'explicitPolynomialContinuation'}
for key in p0['baseline']:
 if key!='declarations':assert p['baseline'][key]==p0['baseline'][key],key
assert p['baseline']['declarations'][:274]==p0['baseline']['declarations'] and len(p['baseline']['declarations'])==281
assert p['sources'][:-1]==p0['sources']
for row,row0 in zip(p['coverage'],p0['coverage']):
 if row['stageId']!=RID+':R03.3':assert row==row0
 else:
  for key in row0:
   if key!='remaining':assert row[key]==row0[key],key
  assert row['remaining'][:-1]==row0['remaining']
assert p['status']=='partial' and all(n['implementationStatus']=='unchecked'for n in new.values())
reader=(R/FILES[1]).read_text();lean=(R/FILES[2]).read_text();oldlean=blob(FILES[2]).decode()
assert reader.startswith(blob(FILES[1]).decode())
imports=(S/'NewImports.lean').read_text();extra=(S/'NewPolynomials.lean').read_text();tests=(S/'PolynomialTests.lean').read_text();cn=(S/'new-canonical.lean').read_text()
assert lean==imports+oldlean+cn and lean.encode()==(S/'Canonical.lean').read_bytes()
for n in added.values():
 assert n['statement'] in reader and n['declaration'] in reader,n['id']
 for t in n.get('tests',[]):assert t['name'] in lean and t['statement'] in reader,t
 for a in n.get('api',[]):assert a['name'].split('.')[-1] in cn and a['statement'] in reader,a
native=(S/'Native.lean').read_text()
assert native==imports+(S/'IncomingNative.lean').read_text()+extra+tests+(S/'NewAudits.lean').read_text()
assert sha((S/'IncomingNative.lean').read_bytes())=='e98df77f9ff9b57b919b0a829e5dd8eb23e52a8c5a6c603609350e727756a5a1'
assert not re.search(r'\bsorry\b|\baxiom\b|\badmit\b',native)
log=(S/'native.log').read_text();clog=(S/'canonical.log').read_text()
assert not re.search(r'error:|warning:|sorryAx',log) and 'Exit status: 0' in log
au=re.findall(r"'([^']+)' depends on axioms:\s*\[([^\]]*)\]",log)
assert len(au)==113 and len({n for n,_ in au})==113
assert all(set(re.findall(r'[\w.]+',axes))<={'propext','Classical.choice','Quot.sound'}for _,axes in au)
assert 'error:' not in clog and clog.count('warning:')==clog.count('warning: declaration uses')==396 and 'Exit status: 0' in clog
assert len(re.findall(r'^example\b',native,re.M))==64 and len(re.findall(r'^example\b',lean,re.M))==201
def norm(s):return re.sub(r'\s+',' ',s).strip()
def header(s,start):
 tail=s[start:];end=re.search(r' :=(?= by\b|\n  C)',tail);assert end,tail[:120]
 return tail[:end.start()]
names=json.loads((S/'math-names.json').read_text());assert len(names)==18
for name in names:
 pat=r'^(?:def|lemma) '+re.escape(name)+r'\b';a=re.search(pat,extra,re.M);b=re.search(pat,cn,re.M);assert a and b,name
 assert norm(header(extra,a.start()))==norm(header(cn,b.start())),name
matches=list(re.finditer(r'^-- test: (\S+)\n',tests,re.M));assert len(matches)==11
for m in matches:
 b=re.search(r'^-- test: '+re.escape(m[1])+r'\n',cn,re.M);assert b,m[1]
 assert norm(re.sub(r'^lemma \S+','example',header(tests,m.end())))==norm(header(cn,b.end())),m[1]
# The proof diagnostics are read only; recompile with the documented pin before this checker.
tree=ast.parse((R/'research/blueprint/intake.py').read_text())
picked=[n for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id in {'ALLOWED','PRIVATE'}for t in n.targets)or isinstance(n,ast.FunctionDef)and n.name=='file_problems']
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
for dst in FILES:
 text=(R/dst).read_text();assert not env['file_problems'](dst,text),dst
 assert not re.search(r'[ \t]+$',text,re.M),dst
 assert not re.search(r'/(?:home|Users)/[^/\s]+/',text),dst
changed=set(subprocess.check_output(['git','diff','--name-only',BASE],cwd=R,text=True).splitlines());assert changed<=set(FILES),changed
sys.path.insert(0,str(R/'scripts'));import check_blueprint,build,blueprints
errors,warnings,summary=check_blueprint.check(R/FILES[0],check_blueprint.load_index(INDEX),check_blueprint.world())
assert not errors and not warnings,(errors,warnings);summary.pop('packet',None)
packets,documents,definitions=blueprints.load_promoted(R)
otherparts=[(stem,q)for stem,q in packets if q.get('roadmapId')==RID and stem!=STEM];assert otherparts
keep=[x for x in packets if x[0]!=STEM];documents[STEM]=FILES[1]
def assemble(candidate):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(STEM,candidate)]),copy.deepcopy(documents),copy.deepcopy(definitions))
 return build.assemble(require_distances=False)[0]
a=assemble(p);b=assemble(p0);a0=json.loads((R/'data/atlas.json').read_text())
world={}
for folder in ['data/decompositions','data/blueprints','research/blueprint/packets']:
 for path in sorted((R/folder).glob('*.json')):
  q=json.loads(path.read_text())
  for n in q.get('nodes',[]):world.setdefault(n['id'],n)
world.update(new)
stages={x['id']:x for x in a['stages']};stageids=set(stages)|set(check_blueprint.world()[1]);scope=set(p['scope'])
stageedges={(e['source'],e['target'])for e in a['stageEdges']}
def dag(vertices,edges):
 vertices=set(vertices)|{v for edge in edges for v in edge};out=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for s,t in edges:
  if t not in out[s]:out[s].add(t);indeg[t]+=1
 stack=[v for v,c in indeg.items()if c==0];count=0
 while stack:
  v=stack.pop();count+=1
  for w in out[v]:
   indeg[w]-=1
   if indeg[w]==0:stack.append(w)
 assert count==len(vertices),[v for v,c in indeg.items()if c][:15]
 return {'vertices':len(vertices),'edges':len(edges),'acyclic':True}
ownedges={(q,nid)for nid,n in new.items()for q in n.get('prerequisites',[])if q in new}
stack=list(new);seen=set();dep=set();unresolved=set();baseref=set()
while stack:
 nid=stack.pop()
 if nid in seen:continue
 seen.add(nid);n=world[nid]
 if n.get('parentStageId'):dep.add((n['parentStageId'],nid))
 for q in n.get('prerequisites',[]):
  if q.startswith(('mathlib:','tauceti:'))and q not in stageids:baseref.add(q);continue
  dep.add((q,nid))
  if q in world:stack.append(q)
  elif q not in stageids:unresolved.add(q)
assert not unresolved,sorted(unresolved)
dep|={(r['supplier'],c)for r in p['requests']for c in r['neededBy']if c in new or c in stageids}
ar=next(r for r in a['roadmaps']if r['id']==RID)
assert ar['blueprint']['declarations']==len(new)+sum(len(q['nodes'])for _,q in otherparts)
assert not ar['blueprint']['skippedLinks'] and not ar.get('pendingLinks',[])
control={(e['source'],e['target'])for e in b['stageEdges']};assert stageedges==control
def skips(atlas):return {r['id']:(r.get('blueprint',{}).get('skippedLinks',[]),r.get('pendingLinks',[]))for r in atlas['roadmaps']if r['id']!=RID}
assert skips(a)==skips(b)
def reachable(s,t,edges=stageedges):
 out=collections.defaultdict(set)
 for u,v in edges:out[u].add(v)
 stack=[s];visited=set()
 while stack:
  v=stack.pop()
  if v==t:return True
  if v in visited:continue
  visited.add(v);stack.extend(out[v]-visited)
 return False
def stage_of(v):
 visited=set()
 while v in world:
  assert v not in visited;visited.add(v);v=world[v].get('parentStageId')or(world[v].get('realises')or[None])[0]
 return v
pairs={(e['source'],e['target'])for e in a0['stageEdges']if e['target']in scope}
for n in new.values():
 for q in n.get('prerequisites',[]):
  if q not in new and not q.startswith(('mathlib:','tauceti:')):pairs.add((stage_of(q),stage_of(n['id'])))
for r in p['requests']:
 for c in r['neededBy']:pairs.add((stage_of(r['supplier']),stage_of(c)))
missing={(s,t)for s,t in pairs if not reachable(s,t)}
assert missing=={(s,t)for s,t in pairs if not reachable(s,t,control)}
expected={('tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions',RID+':R03.4')}
assert missing==expected,missing
acceptedpairs=set()
for path in (R/PREFIX/'restructure').glob('*.result.json'):
 q=json.loads(path.read_text())
 if q.get('review',{}).get('status')!='accepted':continue
 for row in q.get('links',[]):
  if any(row.get(k,'').startswith(RID+':')for k in ['source','target']):acceptedpairs.add((row['source'],row['target']))
assert all(reachable(s,t)for s,t in acceptedpairs)
report={'publicationBase':BASE,'mathematicalBase':MATHBASE,'checker':summary,'errors':errors,'warnings':warnings,'intake':'pass','preservedContracts':130,'preservedWholeNodes':129,'newNodes':17,'mathHeadersMatched':18,'newTestTypesMatched':11,'allAPIItems':sum(len(n.get('api',[]))for n in new.values()),'allTests':sum(len(n.get('tests',[]))for n in new.values()),'nativeAxiomAudits':113,'canonicalAdmissionWarnings':396,'nativeSha256':sha(native.encode()),'canonicalSha256':sha(lean.encode()),'stageDAG':dag(stages,stageedges),'ownDAG':dag(new,ownedges),'scopedCombinedDAG':dag(set(stages)|seen,stageedges|dep),'reachableDeclarations':len(seen),'externalDeclarations':sorted(seen-set(new)),'baselineLeaves':len(baseref),'unresolvedReferences':0,'otherPartsRetained':[stem for stem,_ in otherparts],'roadmapDeclarations':ar['blueprint']['declarations'],'supplierStagePairs':len(pairs),'supplierStagePairsReachable':len(pairs)-len(missing),'inheritedMissingPairs':sorted(missing),'acceptedRestructurePairs':len(acceptedpairs),'acceptedRestructurePairsAllReachable':True,'stageEdgesUnchanged':True,'otherSkippedPendingUnchanged':True,'ownSkippedPendingEmpty':True,'changedPaths':sorted(changed)}
print(json.dumps(report,ensure_ascii=False,indent=2))
```

Set REPO, PROOF_SCRATCH, EXISTING_PINNED_BUILD and PINNED_INDEX to the existing
clone, small disk scratch, existing exact-pin build and exact index file.
Check free -g before each compile and skip that compile below 20 GiB available.
Run these sequentially, never starting two Lean processes at once:

```bash
python3 recover.py "$PROOF_SCRATCH" "$REPO/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md"
free -g
cd "$EXISTING_PINNED_BUILD"
timeout 1200 /usr/bin/time -v lake env lean "$PROOF_SCRATCH/Native.lean" > "$PROOF_SCRATCH/native.log" 2>&1
free -g
timeout 1200 /usr/bin/time -v lake env lean "$PROOF_SCRATCH/Canonical.lean" > "$PROOF_SCRATCH/canonical.log" 2>&1
python3 "$PROOF_SCRATCH/validate.py" "$REPO" "$PROOF_SCRATCH" "$PINNED_INDEX"
```

The publication recovery and complete validator were exercised as a byte-for-byte
round trip before submission. The already successful final compile logs were
used for that independent file reconstruction check; compilers were not rerun
without a change to their sources. Only the four permitted files differ from
the publication base.

## Where to resume

Prove the actual tangent-cone kernel and native curve-ring dimension, then
compare the unique actual polynomial with the existing general constructor
through its proved eventual-value specification. Use the checked coefficient
arithmetic for the intrinsic and ambient multiplicity comparisons only after
the relevant support and dimension hypotheses are established. General
Hilbert–Serre induction, support/degree, Artin–Rees, completion, localization
lengths, associativity, all eight stage targets and every routed-paper
obligation remain required. The native special-case existence proof does not
close the general multiplicity key. Continue from these actual carriers and
preserve all source, supplier and historical worklists below.

---

The complete incoming handoff follows as historical evidence. Its earlier
reading and check receipts describe their own checkpoints.

# Sharp plane-curve graded and cumulative thresholds — #551 checkpoint

Codex — codex-rtOQ9t, 2026-10-03. Winning claim 5964192823;
bot confirmation 5964193904. Mathematical base
`14122f5410315c7254b29874b6b80bf3f7bdd159`; publication base `84e885b95c0ad537079c0fe6fdbb122c8020ac33`.
This is a partial planning checkpoint; all implementation statuses remain unchecked.

For any field k, R=k[[x,y]], variable ideal v, A=R/(f), q=image(v), and
finite order(f)=d, the admission-free prototype now proves the actual
quotient-module graded function G(N)=min(N+1,d), and the rational cumulative
defect H(N).toNat−[d(N+1)−d(d−1)/2]=binom(d−N−1,2). The binomial arguments
use natural subtraction; the polynomial and defect use rational arithmetic.
Agreement with the cumulative polynomial holds exactly when d≤N+2;
agreement of G with d holds exactly when d≤N+1. For d≥3, at N=d−3 the
cumulative defect is exactly one. These are distinct sharp thresholds.

The native general quotient-transition length identity uses the actual
Submodule power-quotient inclusion, quotient transition, kernel, range and
surjectivity in the pinned library. It holds for every commutative ring,
module, ideal and natural index without a finite-length or local assumption.
Finite length is proved before conversion to natural numbers in the curve
arguments. A separate actual zero-equation proof gives G(N)=N+1; it does
not supply a finite order for zero. Units give d=0 and G=0, including the
zero quotient ring without an IsLocalRing assumption. Characteristic two
fixtures use real F₂[[x,y]] quotients, including quartic, smooth, unit and
zero equations; no carrier or length is prescribed by the expected formula.

Five added lemma nodes are plane-jet-binomial-defect, plane-jet-count-step,
plane-curve-graded-stable, plane-curve-postulation-predecessor and
plane-zero-equation-graded, all in R03.3. Four previously planned bodies are
now proved natively: quotient_length_succ, planeCurve_gradedFunction,
planeCurve_postulation_defect and planeCurve_postulation_iff. The nine
mathematical headers and all ten new named test types match the canonical
source after whitespace normalization. The tests distinguish the quartic
cumulative cutoff 2 from graded cutoff 3, check the negative rational
polynomial value at zero and its actual defect, the predecessor defect,
all-index quartic/zero/unit/smooth behavior, and exact finite count defects.

All 125 incoming contracts are preserved. 123 whole node objects are
unchanged; only the graded-function and postulation-defect nodes gain one
prerequisite and one appended proof step apiece. The reserved general
HilbertSamuelMultiplicity node is unchanged. Inventory: 130 nodes
(8 definitions, 22 constructions, 84 lemmas, 16 theorems), 125 API items,
166 total tests, 115 definition/construction tests, 13 planets, 274 indexed
baseline declarations, 15 gaps, two requests, eight stages and zero closed
stages. The 268 incoming baselines and all source routes, API contracts,
requests, gaps, remaining lists and source findings are retained. One precise
R03.3 remaining entry records the frontier. Reader and canonical incoming
text remain as complete prefixes apart from one added Mathlib import.

The 1430-line predecessor is preserved verbatim, SHA-256
`245b3ef78743d357299ec7d332c46534d930aa3780f5cb466b39e494c39e2402`. Its 64 examples and 65 named axiom audits
are rerun as part of the full combined native check. Credit remains with
codex-J6LwjP, codex-a71f92, codex-5ebb6f, codex-rtOQ9t, codex-7e92bd,
ChatGPT — gpt6astra-20261002-7d2f90 and ChatGPT Pro — cp-20261002-sr-c72e81.
The complete incoming handoff follows this current receipt below. Earlier
computational regressions beyond that recovered source were not rerun.

## Reading and ownership boundary

The whole current issue was read before claiming and reread after the bot
confirmed this claim. The four binding instructions were read in this
continuous session; all twenty governing, ownership, audit, accepted RS-08,
checker and incoming deliverable inputs were unchanged when the branch was
updated from the mathematical base to the publication base. The reviewed
AUDIT-17 rows for all eight applicable scopes were read completely, along
with the exact reserved multiplicity key, survey and owner. The campaign
reader, applicable accepted RS-08 ownership and the complete actual scoped
ModularCurves overlap entry were read. This entry preserves ModularCurves'
existing upstream scope and the coefficient-category boundary at R03.1.

Fresh mathematical reading covers [Stacks 00K4](https://stacks.math.columbia.edu/tag/00K4)
for the graded/cumulative conventions and Proposition 10.59.5, and
[the credited authored postulation deduction, §§1–3](https://github.com/CBirkbeck/tauceti-explorer/blob/ab76ddae905be2ec38836c070c5495c6d1c4e3c0/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md).
The deduction is an authored blueprint calculation rather than an additional
published theorem. Selected indexed native statements were read at the
pin: PowTransition's actual maps and exactness, quotient map kernels,
module-length additivity, Pascal/monotonicity/vanishing and rational
choose-two, and ENat finite casts/addition. The six new baseline records
include exact source files, lines and hashes. The bounded RingTheory and
MvPowerSeries name search found no existing HilbertSamuel/postulation/
gradedFunction declarations in those directories; this is not an exhaustive
absence survey. The selected predecessor proof headers/bodies were read;
the entire predecessor was recovered, hashed and rerun, not claimed freshly
read line by line. No fresh complete routed-paper collation is claimed.
No source mistake is alleged. All inherited source findings and routes remain.

## Complete-file checks

Both files elaborate in the existing Lean 4.34.0-rc2 build using exact
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. They import no Tau Ceti
module. The independent source baseline is Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`; this does not certify a Tau Ceti
build. Each check ran a single bounded compiler with timeout 1200 after
checking available memory. No project, library build, cache fetch or language
server was started, and no compiler remains running.

```json
{
  "Native": {
    "sourceSha256": "e98df77f9ff9b57b919b0a829e5dd8eb23e52a8c5a6c603609350e727756a5a1",
    "lines": 1732,
    "examples": 64,
    "errors": 0,
    "warnings": 0,
    "admissionWarnings": 0,
    "axiomAudits": 84,
    "sorryAxInNativeAudits": 0,
    "availableGiBBeforeCompile": 39,
    "elapsed": "0:08.80",
    "maxRSSKiB": 3538664
  },
  "Canonical": {
    "sourceSha256": "8365614bae72634c89a572179f90864b4ad8468c32b57b2dfe1f9e501703f55c",
    "lines": 2881,
    "examples": 190,
    "errors": 0,
    "warnings": 367,
    "admissionWarnings": 367,
    "axiomAudits": 0,
    "sorryAxInNativeAudits": null,
    "availableGiBBeforeCompile": 37,
    "elapsed": "0:26.61",
    "maxRSSKiB": 3531252
  }
}
```

All 84 unique native axiom audits use only propext, Classical.choice and
Quot.sound. There are no native admissions or sorryAx dependencies.
The full submitted canonical file has 367 expected admission warnings and
no other warning or error; the 15 new admissions are five mathematical
signatures and ten example signatures. Historical canonical counts in the
incoming handoff are superseded by this current receipt.

The indexed checker and actual intake file checks pass with no errors or
warnings. Actual source-tree assembler comparison retains the accepted R03.6
part and overlays original and candidate in the same publication tree.
The stage graph and scoped combined graph include all actual stage edges,
reachable declaration dependencies, declaration parent-stage edges and
request edges. All endpoints resolve and all three graphs are acyclic.
There are no new missing supplier paths or changed stage edges. The existing
LocalFieldsRamification layer-0 → R03.4 gap is present in both control and
candidate and stays explicitly recorded. All 65 accepted restructuring
paths touching this roadmap are reachable. Other roadmaps' skipped/pending
links remain unchanged; this roadmap has none. These are scoped checks,
not a claim that every atlas declaration graph or paper is complete.

```json
{
  "publicationBase": "84e885b95c0ad537079c0fe6fdbb122c8020ac33",
  "checker": {
    "roadmap": "DeformationAndDerivedPatchingAlgebra",
    "status": "partial",
    "nodes": 130,
    "kinds": {
      "lemma": 84,
      "theorem": 16,
      "definition": 8,
      "construction": 22
    },
    "apiItems": 125,
    "unitTests": 115,
    "planets": 13,
    "baselineDeclarations": 274,
    "prerequisites": {
      "baseline": 352,
      "node (this packet)": 198,
      "node (integrated)": 1
    },
    "gaps": 15,
    "requests": 2,
    "stagesInScope": 8,
    "stagesClosed": 0
  },
  "errors": [],
  "warnings": [],
  "intake": "pass",
  "preservedContracts": 125,
  "preservedWholeNodes": 123,
  "newNodes": 5,
  "mathHeadersMatched": 9,
  "newTestTypesMatched": 10,
  "allAPIItems": 125,
  "allTests": 166,
  "nativeAxiomAudits": 84,
  "canonicalAdmissionWarnings": 367,
  "nativeSha256": "e98df77f9ff9b57b919b0a829e5dd8eb23e52a8c5a6c603609350e727756a5a1",
  "canonicalSha256": "8365614bae72634c89a572179f90864b4ad8468c32b57b2dfe1f9e501703f55c",
  "stageDAG": {
    "vertices": 3003,
    "edges": 8623,
    "acyclic": true
  },
  "ownDAG": {
    "vertices": 130,
    "edges": 198,
    "acyclic": true
  },
  "scopedCombinedDAG": {
    "vertices": 3121,
    "edges": 8952,
    "acyclic": true
  },
  "reachableDeclarations": 131,
  "externalDeclarations": [
    "DeformationAndDerivedPatchingAlgebra:R03.3/depth-auslander-buchsbaum-and-dimension-bounds"
  ],
  "baselineLeaves": 242,
  "unresolvedReferences": 0,
  "otherPartsRetained": [
    "DeformationAndDerivedPatchingAlgebra--R03.6"
  ],
  "roadmapDeclarations": 183,
  "supplierStagePairs": 13,
  "supplierStagePairsReachable": 12,
  "inheritedMissingPairs": [
    [
      "tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions",
      "DeformationAndDerivedPatchingAlgebra:R03.4"
    ]
  ],
  "acceptedRestructurePairs": 65,
  "acceptedRestructurePairsAllReachable": true,
  "stageEdgesUnchanged": true,
  "otherSkippedPendingUnchanged": true,
  "ownSkippedPendingEmpty": true,
  "changedPaths": [
    "research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md",
    "research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--P7.json",
    "research/blueprint/readmes/DeformationAndDerivedPatchingAlgebra--P7.md",
    "research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean"
  ]
}
```

## Public reconstruction and verification

The checked native source is publicly archived inside an ancestor commit
of this job branch at
[277c8f6129fe7d98b31c9f204f34a5f0f8214e95](https://github.com/CBirkbeck/tauceti-explorer/blob/277c8f6129fe7d98b31c9f204f34a5f0f8214e95/research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean)
between the SHARP PLANE CURVE POSTULATION markers. The prefix is exactly the
submitted canonical file. The archive comment is removed in the final
suggested file to keep it a signature plan. No additional tracked file is
introduced. Its predecessor archive is
[6292c37](https://github.com/CBirkbeck/tauceti-explorer/blob/6292c37bd3730574a75b771115a52ad684dcea31/research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean).

Save the complete code below as reconstruct.py in your own disk scratch.
Use the submitted existing clone, an existing pinned build, and the exact
pinned declaration-index file; do not create a second clone or Lake project.
The reconstruction SHA-256 is `e1c5ec918c0f64310fdf0e4bd554218e41f5a02514789a902a3bc0f481c25772`.

```python
from pathlib import Path
import urllib.request,hashlib,sys
S=Path(sys.argv[1]);S.mkdir(parents=True,exist_ok=True)
ROOT="https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/"
PATH="research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean"
def get(commit):return urllib.request.urlopen(ROOT+commit+"/"+PATH,timeout=90).read()
def put(name,data,expected):
 assert hashlib.sha256(data).hexdigest()==expected,name
 (S/name).write_bytes(data)
b=get("277c8f6129fe7d98b31c9f204f34a5f0f8214e95")
c,tail=b.split(b'\n/- BEGIN ARCHIVED CHECKED SHARP PLANE CURVE POSTULATION\n',1)
n=tail.split(b"\nEND ARCHIVED CHECKED SHARP PLANE CURVE POSTULATION -/\n",1)[0]+b"\n"
put("Canonical.lean",c,"8365614bae72634c89a572179f90864b4ad8468c32b57b2dfe1f9e501703f55c")
put("Native.lean",n,"e98df77f9ff9b57b919b0a829e5dd8eb23e52a8c5a6c603609350e727756a5a1")
p=get("6292c37bd3730574a75b771115a52ad684dcea31").split(b"\n/- BEGIN ARCHIVED CHECKED EQUATION JET LENGTHS\n",1)[1].split(b"\nEND ARCHIVED CHECKED EQUATION JET LENGTHS -/\n",1)[0]+b"\n"
put("Predecessor.lean",p,"245b3ef78743d357299ec7d332c46534d930aa3780f5cb466b39e494c39e2402")
i=b'import Mathlib.RingTheory.Ideal.Quotient.PowTransition\nimport Mathlib.Data.Nat.Choose.Cast\n'
put("Imports.lean",i,"f974405cb539b8cdfb50802aed4f333d72a896066e49fcd1d5abc6ffa2914e45")
ci=b'import Mathlib.Data.Nat.Choose.Cast\n'
put("CanonicalImports.lean",ci,"134aabb7bff05ac10fcf5421d5302d7a6312aa2b0479ed648fa1461b5de2c769")
assert n.startswith(i+p)
new=n[len(i+p):len(i+p)+11280]
tests=n[len(i+p)+11280:]
put("New.lean",new,"9bb6b8853aa942a893d2da63e6c23483329221531a7f13c8cd9da3b8a794ff9c")
put("Tests.lean",tests,"07bd0ed4d4c03c15a9458af8acc93d77fdefb10da2baed5be1f2b52ce86d70db")
assert n==i+p+new+tests
(S/"publication-base.txt").write_text("84e885b95c0ad537079c0fe6fdbb122c8020ac33\n")
print("Recovered canonical file, complete credited predecessor, nine proof bodies and ten tests; all seven hashes match.")
```

Save this complete checker as validate.py in the same scratch. Its SHA-256 is
`5d0f57fa88f511d5c9a92b88addb55f2869682bd4ebd47fbf0040ceabab42a7d`. It reads the actual submitted checker/intake/
assembler and performs no atlas or repository writes. Runtime outputs go
only to the reviewer's own scratch.

```python
"""Read-only validation in the submitted existing clone; no atlas/repository writes.
Arguments: repository root, own proof scratch, exact pinned declaration-index file.
"""
from pathlib import Path
import sys,json,re,ast,hashlib,collections,copy,subprocess
R=Path(sys.argv[1]).resolve();S=Path(sys.argv[2]).resolve();INDEX=Path(sys.argv[3])
RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7';PREFIX='research/blueprint/'
FILES=[PREFIX+x+'/'+STEM+'.'+e for x,e in [('packets','json'),('readmes','md'),('suggested','lean')]]+[PREFIX+'handoff/BP-'+STEM+'.md']
BASE=(S/'publication-base.txt').read_text().strip()
def blob(path):return subprocess.check_output(['git','show',BASE+':'+path],cwd=R)
def sha(data):return hashlib.sha256(data).hexdigest()
p=json.loads((R/FILES[0]).read_text());p0=json.loads(blob(FILES[0]))
old={n['id']:n for n in p0['nodes']};new={n['id']:n for n in p['nodes']};added={k:n for k,n in new.items()if k not in old}
assert len(old)==125 and len(new)==130 and len(added)==5
changes={RID+':R03.3/'+x for x in ['plane-curve-graded-function','plane-curve-postulation-defect']}
for nid,n0 in old.items():
 for key in n0:
  if nid in changes and key in {'prerequisites','proofSteps'}:assert new[nid][key][:-1]==n0[key],(nid,key)
  else:assert new[nid][key]==n0[key],(nid,key)
assert all(new[k]==v for k,v in old.items()if k not in changes)
for key in p0:
 if key not in {'summary','nodes','baseline','sources','coverage'}:assert p[key]==p0[key],key
for key in p0['baseline']:
 if key!='declarations':assert p['baseline'][key]==p0['baseline'][key],key
assert p['baseline']['declarations'][:268]==p0['baseline']['declarations'] and len(p['baseline']['declarations'])==274
assert p['sources'][:-1]==p0['sources']
for row,row0 in zip(p['coverage'],p0['coverage']):
 if row['stageId']!=RID+':R03.3':assert row==row0
 else:
  for key in row0:
   if key!='remaining':assert row[key]==row0[key],key
  assert row['remaining'][:-1]==row0['remaining']
assert p['status']=='partial' and all(n['implementationStatus']=='unchecked'for n in new.values())
reader=(R/FILES[1]).read_text();lean=(R/FILES[2]).read_text();oldlean=blob(FILES[2]).decode()
assert reader.startswith(blob(FILES[1]).decode())
imports=(S/'CanonicalImports.lean').read_text();assert (lean.replace(imports,'',1)if imports else lean).startswith(oldlean)
assert lean.encode()==(S/'Canonical.lean').read_bytes()
for n in added.values():
 assert n['statement'] in reader and n['declaration'] in reader,n['id']
 for t in n.get('tests',[]):assert t['name'] in lean and t['statement'] in reader,t
native=(S/'Native.lean').read_text();extra=(S/'New.lean').read_text();tests=(S/'Tests.lean').read_text()
assert native==''.join((S/n).read_text()for n in ['Imports.lean','Predecessor.lean','New.lean','Tests.lean'])
assert sha((S/'Predecessor.lean').read_bytes())=='245b3ef78743d357299ec7d332c46534d930aa3780f5cb466b39e494c39e2402'
assert not re.search(r'\bsorry\b|\baxiom\b|\badmit\b',native)
log=(S/'native.log').read_text();clog=(S/'canonical.log').read_text()
assert not re.search(r'error:|warning:|sorryAx',log) and 'Exit status: 0' in log
audits=re.findall(r"'([^']+)' depends on axioms:\s*\[([^\]]*)\]",log)
assert len(audits)==84 and len({n for n,_ in audits})==84
assert all(set(re.findall(r'[\w.]+',axes))<={'propext','Classical.choice','Quot.sound'}for _,axes in audits)
assert 'error:' not in clog and clog.count('warning:')==clog.count('warning: declaration uses')==367 and 'Exit status: 0' in clog
assert len(re.findall(r'^example\b',native,re.M))==64 and len(re.findall(r'^example\b',lean,re.M))==190
def norm(s):return re.sub(r'\s+',' ',s).strip()
def header(s,start):
 tail=s[start:];end=re.search(r' :=(?= by\b| rfl\b|\n)',tail);assert end,tail[:120]
 return tail[:end.start()]
names=['quotient_length_succ','planeJetCount_defect','planeJetCount_step','planeCurve_gradedFunction','planeCurve_postulation_defect','planeCurve_postulation_iff','planeCurve_graded_stable_iff','planeCurve_postulation_predecessor','planeZeroEquation_gradedFunction']
for name in names:
 pat=r'^(?:theorem|lemma) '+re.escape(name)+r'\b';a=re.search(pat,extra,re.M);b=re.search(pat,lean,re.M);assert a and b,name
 assert norm(header(extra,a.start()))==norm(header(lean,b.start())),name
tt=list(re.finditer(r'^-- test: (\S+)\n',tests,re.M));assert len(tt)==10
for m in tt:
 b=re.search(r'^-- test: '+re.escape(m[1])+r'\n',lean,re.M);assert b,m[1]
 assert norm(re.sub(r'^theorem \S+','example',header(tests,m.end())))==norm(header(lean,b.end())),m[1]
tree=ast.parse((R/'research/blueprint/intake.py').read_text())
picked=[n for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id in {'ALLOWED','PRIVATE'}for t in n.targets)or isinstance(n,ast.FunctionDef)and n.name=='file_problems']
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
for dst in FILES:
 text=(R/dst).read_text();assert not env['file_problems'](dst,text),dst
 assert not re.search(r'[ \t]+$',text,re.M),dst
 assert not re.search(r'/(?:home|Users)/[^/\s]+/',text),dst
changed=set(subprocess.check_output(['git','diff','--name-only',BASE],cwd=R,text=True).splitlines());assert changed<=set(FILES),changed
sys.path.insert(0,str(R/'scripts'));import check_blueprint,build,blueprints
errors,warnings,summary=check_blueprint.check(R/FILES[0],check_blueprint.load_index(INDEX),check_blueprint.world())
assert not errors and not warnings,(errors,warnings);summary.pop('packet',None)
packets,documents,definitions=blueprints.load_promoted(R)
otherparts=[(stem,q)for stem,q in packets if q.get('roadmapId')==RID and stem!=STEM];assert otherparts
keep=[x for x in packets if x[0]!=STEM];documents[STEM]=FILES[1]
def assemble(candidate):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(STEM,candidate)]),copy.deepcopy(documents),copy.deepcopy(definitions))
 return build.assemble(require_distances=False)[0]
a=assemble(p);b=assemble(p0);a0=json.loads((R/'data/atlas.json').read_text())
world={}
for folder in ['data/decompositions','data/blueprints','research/blueprint/packets']:
 for path in sorted((R/folder).glob('*.json')):
  q=json.loads(path.read_text())
  for n in q.get('nodes',[]):world.setdefault(n['id'],n)
world.update(new)
stages={x['id']:x for x in a['stages']};stageids=set(stages)|set(check_blueprint.world()[1]);scope=set(p['scope'])
stageedges={(e['source'],e['target'])for e in a['stageEdges']}
def dag(vertices,edges):
 vertices=set(vertices)|{v for edge in edges for v in edge};out=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for s,t in edges:
  if t not in out[s]:out[s].add(t);indeg[t]+=1
 stack=[v for v,c in indeg.items()if c==0];count=0
 while stack:
  v=stack.pop();count+=1
  for w in out[v]:
   indeg[w]-=1
   if indeg[w]==0:stack.append(w)
 assert count==len(vertices),[v for v,c in indeg.items()if c][:15]
 return {'vertices':len(vertices),'edges':len(edges),'acyclic':True}
ownedges={(q,nid)for nid,n in new.items()for q in n.get('prerequisites',[])if q in new}
stack=list(new);seen=set();dep=set();unresolved=set();baseref=set()
while stack:
 nid=stack.pop()
 if nid in seen:continue
 seen.add(nid);n=world[nid]
 if n.get('parentStageId'):dep.add((n['parentStageId'],nid))
 for q in n.get('prerequisites',[]):
  if q.startswith(('mathlib:','tauceti:'))and q not in stageids:baseref.add(q);continue
  dep.add((q,nid))
  if q in world:stack.append(q)
  elif q not in stageids:unresolved.add(q)
assert not unresolved,sorted(unresolved)
dep|={(r['supplier'],c)for r in p['requests']for c in r['neededBy']if c in new or c in stageids}
ar=next(r for r in a['roadmaps']if r['id']==RID)
assert ar['blueprint']['declarations']==len(new)+sum(len(q['nodes'])for _,q in otherparts)
assert not ar['blueprint']['skippedLinks'] and not ar.get('pendingLinks',[])
control={(e['source'],e['target'])for e in b['stageEdges']};assert stageedges==control
def skips(atlas):return {r['id']:(r.get('blueprint',{}).get('skippedLinks',[]),r.get('pendingLinks',[]))for r in atlas['roadmaps']if r['id']!=RID}
assert skips(a)==skips(b)
def reachable(s,t,edges=stageedges):
 out=collections.defaultdict(set)
 for u,v in edges:out[u].add(v)
 stack=[s];visited=set()
 while stack:
  v=stack.pop()
  if v==t:return True
  if v in visited:continue
  visited.add(v);stack.extend(out[v]-visited)
 return False
def stage_of(v):
 visited=set()
 while v in world:
  assert v not in visited;visited.add(v);v=world[v].get('parentStageId')or(world[v].get('realises')or[None])[0]
 return v
pairs={(e['source'],e['target'])for e in a0['stageEdges']if e['target']in scope}
for n in new.values():
 for q in n.get('prerequisites',[]):
  if q not in new and not q.startswith(('mathlib:','tauceti:')):pairs.add((stage_of(q),stage_of(n['id'])))
for r in p['requests']:
 for c in r['neededBy']:pairs.add((stage_of(r['supplier']),stage_of(c)))
missing={(s,t)for s,t in pairs if not reachable(s,t)}
assert missing=={(s,t)for s,t in pairs if not reachable(s,t,control)}
expected={('tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions',RID+':R03.4')}
assert missing==expected,missing
acceptedpairs=set()
for path in (R/PREFIX/'restructure').glob('*.result.json'):
 q=json.loads(path.read_text())
 if q.get('review',{}).get('status')!='accepted':continue
 for row in q.get('links',[]):
  if any(row.get(k,'').startswith(RID+':')for k in ['source','target']):acceptedpairs.add((row['source'],row['target']))
assert all(reachable(s,t)for s,t in acceptedpairs)
report={'publicationBase':BASE,'checker':summary,'errors':errors,'warnings':warnings,'intake':'pass','preservedContracts':125,'preservedWholeNodes':123,'newNodes':5,'mathHeadersMatched':9,'newTestTypesMatched':10,'allAPIItems':sum(len(n.get('api',[]))for n in new.values()),'allTests':sum(len(n.get('tests',[]))for n in new.values()),'nativeAxiomAudits':84,'canonicalAdmissionWarnings':367,'nativeSha256':sha(native.encode()),'canonicalSha256':sha(lean.encode()),'stageDAG':dag(stages,stageedges),'ownDAG':dag(new,ownedges),'scopedCombinedDAG':dag(set(stages)|seen,stageedges|dep),'reachableDeclarations':len(seen),'externalDeclarations':sorted(seen-set(new)),'baselineLeaves':len(baseref),'unresolvedReferences':0,'otherPartsRetained':[stem for stem,_ in otherparts],'roadmapDeclarations':ar['blueprint']['declarations'],'supplierStagePairs':len(pairs),'supplierStagePairsReachable':len(pairs)-len(missing),'inheritedMissingPairs':sorted(missing),'acceptedRestructurePairs':len(acceptedpairs),'acceptedRestructurePairsAllReachable':True,'stageEdgesUnchanged':True,'otherSkippedPendingUnchanged':True,'ownSkippedPendingEmpty':True,'changedPaths':sorted(changed)}
print(json.dumps(report,ensure_ascii=False,indent=2))
```

After setting REPO to the submitted existing clone, PROOF_SCRATCH to your own
disk scratch, EXISTING_PINNED_BUILD to the existing build and PINNED_INDEX to
the exact existing index, run sequentially. Check free -g before each Lean
invocation and skip compiling if available memory is below 20 GiB. Retain
the 20-minute timeout and leave no process running.

```sh
python3 "$PROOF_SCRATCH/reconstruct.py" "$PROOF_SCRATCH"
cd "$EXISTING_PINNED_BUILD"
free -g
timeout 1200 /usr/bin/time -v lake env lean "$PROOF_SCRATCH/Native.lean" > "$PROOF_SCRATCH/native.log" 2>&1
free -g
timeout 1200 /usr/bin/time -v lake env lean "$PROOF_SCRATCH/Canonical.lean" > "$PROOF_SCRATCH/canonical.log" 2>&1
cd "$REPO"
PYTHONDONTWRITEBYTECODE=1 python3 "$PROOF_SCRATCH/validate.py" "$REPO" "$PROOF_SCRATCH" "$PINNED_INDEX"
```

## Where to resume

Prove the actual tangent-cone kernel and curve-ring dimension, then identify
the established finite formula with the existing general cumulative polynomial
and intrinsic/ambient multiplicities under proved hypotheses. The general
multiplicity key still includes all finite modules and primary ideals; this
plane-curve calculation does not replace it. General Hilbert–Serre induction,
support/degree, Artin–Rees, localization lengths, completion, associativity,
all eight stage targets and all inherited routed-paper obligations remain.
Continue from these actual carriers and sharp cutoff proofs rather than
assuming a general existence theorem or weakening a general owner contract.

---

The following complete incoming handoff is preserved as historical evidence.
Its reading, test and graph receipts describe its own checkpoint.

# Finite equation jets and actual curve lengths — #551 checkpoint

Codex — codex-7e92bd, 2026-10-03. Winning claim 5963743079, bot
confirmation 5963744198. Mathematical base `bfef64afffd06e4c8a18b53a76c331a147dd7eb7`;
publication base `9a3905af27dd59b81ab74e7df6ff86d5398eeb12`. All twenty governing,
audit, ownership, deliverable and checker inputs were unchanged at publication.

Two new lemma nodes make the finite quotient argument explicit: an equation
jet is finite over any commutative coefficient ring in finitely many variables;
over a field, its actual series-ring length equals its finite coefficient
dimension. The combined native proof then establishes the existing ambient
length, shifted length balance, all-index equation length, actual cumulative
curve function and separate zero-equation signatures. It handles the N<d
branch separately. No subtraction or natural conversion of an unproved
infinite length occurs.

For R=k[[x,y]], v=(x,y), A=R/(f), q=image(v), and order(f)=d finite,
H_q,A(N)=binom(N+2,2)−binom(N+2−d,2), with natural subtraction before
the extended-natural cast. This includes units and nonreduced equations in
positive characteristic. The zero equation has the ambient triangular count.
Neither general multiplicity nor curve dimension is defined by this formula.

All 123 old statement, hypothesis, acceptance, API, test, use and source
contracts are preserved; 121 whole node objects are unchanged. Two old proof
plans/dependency lists consume the checked finite adapter and exactness API.
The canonical source is the full incoming source plus two lemma signatures
and three examples. The reader retains its whole incoming text after the
new current section. The reserved multiplicity object, eight partial stages,
source findings, two requests and all historical remaining lists are retained.

Inventory: 125 nodes (8 definitions, 22 constructions, 79 lemmas,
16 theorems), 125 API items, 115 definition/construction tests and 156 total
test records, 13 planets, 268 indexed baseline declarations, 15 gaps and
2 requests. This checkpoint adds two lemmas and three tests; no API or
planet is added. All implementation statuses remain unchecked.

## Checks and proof boundary

The native source preserves the entire mathematical bodies of the incoming
975-line shifted-jet proof, the 121-line residue/length proof and the
128-line quotient-ring proof. Their imports are gathered into the top block;
no mathematical body is rewritten. The original hashes and archives are
checked by verify.py below. Credit remains with codex-J6LwjP, codex-a71f92,
codex-5ebb6f, codex-rtOQ9t, codex-7e92bd, ChatGPT —
gpt6astra-20261002-7d2f90 and ChatGPT Pro — cp-20261002-sr-c72e81.
The preceding complete handoff and its historical receipts remain available
[at the incoming base](https://github.com/CBirkbeck/tauceti-explorer/blob/bfef64afffd06e4c8a18b53a76c331a147dd7eb7/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md).
Earlier finite computational regressions were not rerun.

The combined native check contains 64 examples and 65 named axiom audits.
Every audit excludes sorryAx and uses only propext, Classical.choice and
Quot.sound. Five existing actual-curve tests are freshly checked, along with
three new finite-coefficient/rank tests. The graded-function example is not
claimed proved. Eight declaration headers and eight example headers match
the admitted canonical source exactly after whitespace normalization.

Both complete files elaborate in the existing Lean 4.34.0-rc2 / exact
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 build. They import no
Tau Ceti module. The shared checkout's Tau Ceti HEAD is
cf386627e9176a3827c1a5fe804989fd94a4d216, not the source-audit pin; this
is full Mathlib-only elaboration. The independent source baseline remains
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Each final compile had
45 GiB available, ran one Lean process with timeout 1200, and used no library
build, cache download, new project or language server. No compiler remains
running.

```json
{
  "Native": {
    "sourceSha256": "245b3ef78743d357299ec7d332c46534d930aa3780f5cb466b39e494c39e2402",
    "normalizedLogSha256": "1c6b32b6725be1a7377c50f1a5ac40fa032a27c411f5f63fd0c496d70d3be2d4",
    "lines": 1430,
    "examples": 64,
    "axiomAudits": 65,
    "errors": 0,
    "warnings": 0,
    "admissionWarnings": 0,
    "sorryAx": 0,
    "availableGiBBeforeCompile": 45,
    "seconds": 7.2,
    "maxRSSKiB": 3511764
  },
  "Canonical": {
    "sourceSha256": "c9035fb0d224d44c110e99d6e5c777692f1b7c7a1a4d19833abc17f101d41b79",
    "normalizedLogSha256": "38cbb579368216055c73e9cfbb476be1d2dc2d17fd4b0e338c16f70c945c513b",
    "lines": 2792,
    "examples": 180,
    "axiomAudits": 0,
    "errors": 0,
    "warnings": 352,
    "admissionWarnings": 352,
    "sorryAx": 0,
    "availableGiBBeforeCompile": 45,
    "seconds": 25.11,
    "maxRSSKiB": 3550000
  }
}
```

The indexed packet checker has zero errors and warnings. Full contract and
header preservation, actual intake file checks and whitespace checks pass.
The actual assembler overlays candidate and original packets in the same
publication tree. All three graphs are acyclic; the R03.6 part is retained;
there are no unresolved declaration dependencies or new missing stage paths.
All 65 accepted restructure paths are reachable. Twelve of thirteen scoped
supplier paths are reachable: the inherited LocalFieldsRamification layer-0
→ R03.4 gap remains in candidate and control, with its recorded request.
Stage edges and other roadmaps' skipped/pending links are unchanged; this
roadmap has no skipped/pending links.

```json
{
  "stageDAG": {
    "vertices": 3003,
    "edges": 8623,
    "acyclic": true
  },
  "ownDAG": {
    "vertices": 125,
    "edges": 192,
    "acyclic": true
  },
  "combinedDAG": {
    "vertices": 3116,
    "edges": 8815,
    "acyclic": true
  },
  "reachableDeclarations": 126,
  "externalDeclarations": [
    "DeformationAndDerivedPatchingAlgebra:R03.3/depth-auslander-buchsbaum-and-dimension-bounds"
  ],
  "reachableBaselineReferences": 237,
  "unresolved": [],
  "otherPartsRetained": [
    "DeformationAndDerivedPatchingAlgebra--R03.6"
  ],
  "partDeclarations": 125,
  "partPlanets": 13,
  "roadmapDeclarations": 178,
  "requiredStagePairs": 13,
  "requiredStagePairsReachable": 12,
  "inheritedMissingStagePairs": [
    [
      "tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions",
      "DeformationAndDerivedPatchingAlgebra:R03.4"
    ]
  ],
  "acceptedRestructurePairs": 65,
  "acceptedRestructurePairsReachable": 65,
  "stageEdgesUnchanged": true,
  "otherSkippedPendingUnchanged": true,
  "ownSkippedPendingEmpty": true
}
```

Fresh reading: complete issue before claiming and unchanged-body verification
after bot confirmation; incoming current handoff/proof recipe and continuation;
all eight applicable reviewed AUDIT-17 rows; campaign document, scoped stage
descriptions and original stage edges; accepted RS-08 own keeps/owners and
scoped link overlap; full reserved multiplicity entry and current owner node;
selected integrated depth/perfect-complex contracts. All three public proof
archives were recovered and hash-verified; the entire residue and quotient
proofs and selected incoming jet/shifted proof sections were freshly read.
DDPA-JET-HANDOFF §§3–4 and DDPA-CURVE-POSTULATION §§1–3 were freshly read.
HS-EQUATION-LENGTH-PIN records bounded native declaration reads and file
hashes. Earlier upstream-style and whole-source readings remain historical;
this is not a fresh complete read of every routed paper or the whole libraries.

Fresh open-PR search found [Mathlib #9819](https://github.com/leanprover-community/mathlib4/pull/9819),
head 413e5b872a7c758e0eb91f99cb96d6a61c81f0a2, still open. Its body and
file inventory were checked; the earlier full 131-line HilbertPolynomial
reading remains historical. Its general graded Hilbert–Serre work must be
reconciled before that open induction is implemented. No unmerged theorem is
used here. Two bounded public Zulip searches for Hilbert–Samuel/power-series
length and Hilbert polynomials returned no relevant mathematical thread;
this is not an absence proof.

## Recovery and reproduction

The complete checked native proof is archived in the allowed suggested path
at [6292c37bd3730574a75b771115a52ad684dcea31](https://github.com/CBirkbeck/tauceti-explorer/commit/6292c37bd3730574a75b771115a52ad684dcea31),
in an inert nested comment in the preceding commit. The final suggested file
removes only that archive comment and retains admitted bodies under PROTOCOL
§13. Save the following as recover.py in small disk scratch, then run it from
the existing clone with that scratch directory as argument. It fetches only
specific public commits if absent; it creates no repository snapshot.

```python
from pathlib import Path
import hashlib, subprocess, sys
out=Path(sys.argv[1]); assert out.is_dir()
archive="6292c37bd3730574a75b771115a52ad684dcea31"
base="bfef64afffd06e4c8a18b53a76c331a147dd7eb7"
path="research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean"
commits=[archive,base,"25a2ed36500d86f9158bfddf498d6f9f57a78ab3",
 "20fb961cd54398638ba6a9b1b9b818fb546163bf","30299125337a2f2532f316bd5390b3729c64c1b2"]
for commit in commits:
 if subprocess.run(["git","cat-file","-e",commit+"^{commit}"],
     stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL).returncode:
  subprocess.run(["git","fetch","origin",commit],check=True)
t=subprocess.check_output(["git","show",archive+":"+path],text=True)
canonical,nested=t.split("\n/- BEGIN ARCHIVED CHECKED EQUATION JET LENGTHS\n",1)
native=nested.split("END ARCHIVED CHECKED EQUATION JET LENGTHS -/\n",1)[0]
assert hashlib.sha256(native.encode()).hexdigest()=="245b3ef78743d357299ec7d332c46534d930aa3780f5cb466b39e494c39e2402"
assert hashlib.sha256(canonical.encode()).hexdigest()=="c9035fb0d224d44c110e99d6e5c777692f1b7c7a1a4d19833abc17f101d41b79"
(out/"Native.lean").write_text(native)
(out/"Canonical.lean").write_text(canonical)
packet="research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--P7.json"
(out/"original-packet.json").write_bytes(subprocess.check_output(["git","show",base+":"+packet]))
print("Recovered and hash-verified both checked sources and the original packet.")
```

After checking free -g reports at least 20 GiB available, from the existing
exact-pin build run one file at a time:
`/usr/bin/time -f 'Elapsed %e seconds; peak %M KiB' timeout 1200 lake env lean "$task_dir/Native.lean"`
and then the corresponding Canonical.lean command. Capture combined output.
For the diagnostic hash, drop the final Elapsed timing line, replace the
compiled filename by `<lean-file>` and retain a final newline.

Save the following as verify.py and run from the submitted clone with the
recovery directory as argument. SHA-256:
`b28c312f377243d3adfff2ec996386d788f79afbc0e6b61424721a8bf4b3a342`.

```python
from pathlib import Path
import collections, hashlib, json, re, subprocess, sys

root = Path.cwd()
s = Path(sys.argv[1])
stem = 'DeformationAndDerivedPatchingAlgebra--P7'
path = 'research/blueprint/suggested/' + stem + '.lean'
p = json.loads((root/'research/blueprint/packets'/f'{stem}.json').read_text())
old = json.loads((s/'original-packet.json').read_text())
byid = {n['id']: n for n in p['nodes']}
contracts = ['statement', 'hypotheses', 'acceptance', 'api', 'tests', 'uses', 'sources']
for n in old['nodes']:
    assert all(byid[n['id']].get(k) == n.get(k) for k in contracts), n['id']
changed = [n['id'] for n in old['nodes'] if n != byid[n['id']]]
assert sorted(x.rsplit('/',1)[-1] for x in changed) == [
    'plane-equation-jet-length', 'plane-equation-jet-length-balance']
for k, v in old.items():
    if k not in ['nodes','sources','baseline','gaps']:
        assert p[k] == v, k
assert p['baseline']['declarations'][:len(old['baseline']['declarations'])] == old['baseline']['declarations']
assert p['sources'][:len(old['sources'])] == old['sources']
assert p['gaps'][:-1] == old['gaps'][:-1]
assert p['gaps'][-1]['detail'].startswith(old['gaps'][-1]['detail'])
assert all(n['implementationStatus'] == 'unchecked' for n in p['nodes'])

native = (s/'Native.lean').read_text()
canonical = (s/'Canonical.lean').read_text()
assert canonical == (root/path).read_text()
base = p['equationLengthContinuation']['base']
incoming = subprocess.check_output(['git','show',base+':'+path],text=True)
assert canonical.startswith(incoming)
readerpath = 'research/blueprint/readmes/'+stem+'.md'
oldreader = subprocess.check_output(['git','show',base+':'+readerpath],text=True)
assert (root/readerpath).read_text().endswith(oldreader)
assert not re.search(r'\bsorry\b|\baxiom\b',native)

archives = [
 ('25a2ed36500d86f9158bfddf498d6f9f57a78ab3', 'EXACT ORDER SHIFTED JETS',
  '7df121750db08c9caf5a04386c16f9b835a7e05642c586cab997d7a0870c8111'),
 ('20fb961cd54398638ba6a9b1b9b818fb546163bf', 'SERIES RESIDUE AND LENGTH',
  'e123da1f4b68b77a81bd08a2fb116c7a77f5475b568af9c8872e33ea5959321d'),
 ('30299125337a2f2532f316bd5390b3729c64c1b2', 'QUOTIENT RING HILBERT SAMUEL',
  'cd8cb5cd1291a582f25dc0363a0a8d020b1bcc57b79766b3471388f2862d3c11')]
for commit, marker, expected in archives:
    t = subprocess.check_output(['git','show',commit+':'+path],text=True)
    body = t.split('BEGIN ARCHIVED CHECKED '+marker+'\n',1)[1].split(
        'END ARCHIVED CHECKED '+marker,1)[0]
    assert hashlib.sha256(body.encode()).hexdigest() == expected
    body = ''.join(l for l in body.splitlines(keepends=True) if not l.startswith('import '))
    assert body in native

def header(t, start):
    tail = t[t.index(start):]
    end = re.search(r' := (?:by(?: sorry)?\n|rfl\n|\n)',tail)
    assert end, start
    return ' '.join(tail[:end.start()].split())

names = ['equationJet_finite','equationJet_length_eq_finrank',
 'totalJet_length_eq_finrank','planeTotalJet_length','planeEquationJet_length_balance',
 'planeEquationJet_length','planeCurve_function','planeZeroEquation_function']
for name in names:
    assert header(native,'lemma '+name+' ') == header(canonical,'lemma '+name+' '),name
tests = ['PlaneCurveAcceptance.'+x for x in ['unit_boundary','zero_equation_six',
 'smooth_linear','nonreduced_cumulative','below_equation_order']]
tests += ['HilbertSamuelEquationJetTest.'+x for x in ['nonreduced_rank',
 'nilpotent_coefficients_finite','zero_coefficients_finite']]
for name in tests:
    assert header(native,'-- test: '+name+'\n') == header(canonical,'-- test: '+name+'\n'),name

print(json.dumps(dict(oldContractsPreserved=len(old['nodes']),
 wholeOldNodesUnchanged=len(old['nodes'])-len(changed),
 canonicalPrefixPreserved=True,readerSuffixPreserved=True,
 predecessorProofBodiesPreserved=len(archives),namedHeadersMatched=len(names),
 exampleHeadersMatched=len(tests),nodes=len(p['nodes']),
 kinds=dict(collections.Counter(n['kind'] for n in p['nodes'])),
 apiItems=sum(len(n.get('api',[])) for n in p['nodes']),
 totalTestRecords=sum(len(n.get('tests',[])) for n in p['nodes']),
 definitionConstructionTests=sum(len(n.get('tests',[])) for n in p['nodes']
     if n['kind'] in ['definition','construction']),
 planets=sum('planet' in n for n in p['nodes']),
 baselineDeclarations=len(p['baseline']['declarations']),gaps=len(p['gaps']),
 requests=len(p['requests'])),indent=2))
```

Save the following actual assembler check as graph.py and run from the
submitted clone with original-packet.json as argument. It does not write
atlas files or add artificial realization edges. SHA-256:
`1df378b97a169e8ebf8a89036aaf6170d5dfa79a3cb512587f2dbfd9277c7a3b`.

```python
from pathlib import Path
import sys,json,copy,collections
sys.path.insert(0,str(Path.cwd()/'scripts'))
import build,blueprints,check_blueprint
RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7'
p=json.loads((Path.cwd()/'research/blueprint/packets'/f'{STEM}.json').read_text())
original=json.loads(Path(sys.argv[1]).read_text())
new={n['id']:n for n in p['nodes']}
root=Path.cwd()
a0=json.loads((root/"data/atlas.json").read_text())
packets,documents,definitions=blueprints.load_promoted(root)
otherparts=[(stem,q) for stem,q in packets if q.get("roadmapId")==RID and stem!=STEM]
assert otherparts, "must preserve other promoted roadmap parts"
keep=[x for x in packets if x[0]!=STEM]
documents[STEM]="research/blueprint/readmes/"+STEM+".md"
def assemble(candidate):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(STEM,candidate)]),copy.deepcopy(documents),copy.deepcopy(definitions))
 return build.assemble(require_distances=False)[0]
a=assemble(p);b=assemble(original)
world={}
for folder in ["data/decompositions","data/blueprints","research/blueprint/packets"]:
 for path in sorted((root/folder).glob("*.json")):
  q=json.loads(path.read_text())
  for n in q.get("nodes",[]):world.setdefault(n["id"],n)
world.update(new)
stages={x["id"]:x for x in a["stages"]}
stageids=set(stages)|set(check_blueprint.world()[1])
stageedges={(e["source"],e["target"]) for e in a["stageEdges"]}
def dag(vertices,edges):
 vertices=set(vertices)|{v for edge in edges for v in edge}
 out=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for source,target in edges:
  if target not in out[source]:out[source].add(target);indeg[target]+=1
 stack=[v for v,count in indeg.items() if count==0];count=0
 while stack:
  v=stack.pop();count+=1
  for w in out[v]:
   indeg[w]-=1
   if indeg[w]==0:stack.append(w)
 assert count==len(vertices),[v for v,count in indeg.items() if count][:15]
 return {"vertices":len(vertices),"edges":len(edges),"acyclic":True}
ownedges={(q,nid) for nid,node in new.items() for q in node.get("prerequisites",[]) if q in new}
stack=list(new);seen=set();dep=set();unresolved=set();baseref=set()
while stack:
 nid=stack.pop()
 if nid in seen:continue
 seen.add(nid)
 for q in world[nid].get("prerequisites",[]):
  if q.startswith(("mathlib:","tauceti:")) and q not in stageids:baseref.add(q);continue
  dep.add((q,nid))
  if q in world:stack.append(q)
  elif q not in stageids:unresolved.add(q)
assert not unresolved,sorted(unresolved)
dep|={(n["parentStageId"],nid) for nid,n in new.items() if n.get("parentStageId") in new}
dep|={(request["supplier"],consumer) for request in p.get("requests",[]) for consumer in request.get("neededBy",[]) if consumer in new or consumer in stageids}
roadmap=next(r for r in a["roadmaps"] if r["id"]==RID)
expected_decl=len(new)+sum(len(q["nodes"]) for _,q in otherparts)
assert roadmap["blueprint"]["declarations"]==expected_decl,(roadmap["blueprint"],expected_decl)
assert not roadmap["blueprint"]["skippedLinks"] and not roadmap.get("pendingLinks",[])
assert stageedges=={(e["source"],e["target"]) for e in b["stageEdges"]}
def skips(atlas):
 return {r["id"]:(r.get("blueprint",{}).get("skippedLinks",[]),r.get("pendingLinks",[])) for r in atlas["roadmaps"] if r["id"]!=RID}
assert skips(a)==skips(b)
out=collections.defaultdict(set)
for source,target in stageedges:out[source].add(target)
def reachable(source,target):
 stack=[source];seen=set()
 while stack:
  v=stack.pop()
  if v==target:return True
  if v in seen:continue
  seen.add(v);stack.extend(out[v]-seen)
 return False
pairs={(e["source"],e["target"]) for e in a0["stageEdges"] if e["target"].startswith(RID+":")}
for node in p["nodes"]:
 for q in node.get("prerequisites",[]):
  if q in stageids and q not in world and q!=node["parentStageId"]:pairs.add((q,node["parentStageId"]))
for req in p.get("requests",[]):
 for consumer in req.get("neededBy",[]):
  if consumer in new:pairs.add((req["supplier"],new[consumer]["parentStageId"]))
  elif consumer in stageids:pairs.add((req["supplier"],consumer))
missingpairs={(s,t) for s,t in pairs if not reachable(s,t)}
oldout=collections.defaultdict(set)
for edge in b['stageEdges']:oldout[edge['source']].add(edge['target'])
def reachable0(source,target):
 stack=[source];seen=set()
 while stack:
  v=stack.pop()
  if v==target:return True
  if v in seen:continue
  seen.add(v);stack.extend(oldout[v]-seen)
 return False
assert missingpairs=={(s,t) for s,t in pairs if not reachable0(s,t)}
assert missingpairs=={('tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions',RID+':R03.4')}
assert any('LocalFieldsRamification layer 0 to R03.4' in gap['detail'] for gap in p['gaps'])
# Independently retain all accepted restructure links touching the whole roadmap.
acceptedpairs=set()
for path in (root/"research/blueprint/restructure").glob("*.result.json"):
 q=json.loads(path.read_text())
 if q.get("review",{}).get("status")!="accepted":continue
 for row in q.get("links",[]):
  if any(row.get(k,"").startswith(RID+":") for k in ["source","target"]):
   acceptedpairs.add((row["source"],row["target"]))
assert all(reachable(s,t) for s,t in acceptedpairs),[(s,t) for s,t in acceptedpairs if not reachable(s,t)]
report={"stageDAG":dag(stages,stageedges),"ownDAG":dag(new,ownedges),
 "combinedDAG":dag(set(stages)|seen,stageedges|dep),"reachableDeclarations":len(seen),
 "externalDeclarations":sorted(seen-set(new)),"reachableBaselineReferences":len(baseref),
 "unresolved":sorted(unresolved),"otherPartsRetained":[stem for stem,_ in otherparts],
 "partDeclarations":len(new),"partPlanets":sum("planet" in n for n in p["nodes"]),
 "roadmapDeclarations":roadmap["blueprint"]["declarations"],
 "requiredStagePairs":len(pairs),"requiredStagePairsReachable":len(pairs)-len(missingpairs),
 "inheritedMissingStagePairs":sorted(missingpairs),
 "acceptedRestructurePairs":len(acceptedpairs),"acceptedRestructurePairsReachable":len(acceptedpairs),
 "stageEdgesUnchanged":True,"otherSkippedPendingUnchanged":True,"ownSkippedPendingEmpty":True}
print(json.dumps(report,ensure_ascii=False,indent=2),flush=True)
```

## Continuation

Use the checked all-index cumulative formula to prove the existing native
gradedFunction formula, its rational postulation defect and sharp cumulative
agreement threshold, preserving the zero/unit and low-cutoff boundaries.
The existing polynomial identification still relies on its general existence
and uniqueness theorem. Prove the full tangent-cone kernel, actual curve
dimension and intrinsic/ambient multiplicity comparisons.

General Hilbert–Serre induction (reconciling #9819), degree/dimension,
Artin–Rees, finite top-dimensional localized lengths, associativity,
completion, parameter-ideal and regular-local comparisons, all P7/P8/P9 and
R03.1–R03.5 targets and every routed-paper obligation remain open. The two
supplier requests and the inherited local-field path gap are unchanged.
