# Actual continuous inner twisting — Codex codex-J6LwjP

Refs #1020. Claim5963821834 won, explicitly confirmed by bot5963822933.
The complete issue was reread after confirmation. Read base `aeae47c9a675600efe5c88a0b7ab4cc82b9d13f3`;
publication base `f8680e820b542a5f2caba153c1ab7a762e56bd51`. All 48 own/governing/audit/key/atlas/validator
and touching-link inputs were byte-identical between these bases. Foreign main
changes were brought into this job branch before publication.

## Result and precise boundary

Nine declaration-sized nodes continue NC.3's existing twisting target: the actual
underlying-group identification, continuous cocycle equivalence, its two value
formulas and gauge equivariance, native orbit-quotient equivalence, its
representative and neutral-fibre formulas, and the twisted-invariant criterion.
Eight new API records and eight full typed examples cover these constructions.

For an actual continuous cocycle c, the twisted action is
`g⋆x=c(g) g(x) c(g)⁻¹`. Its action/automorphism laws and joint continuity are
proved in the checked prototype. The native group equivalence
`Twist.toOriginal : Twist(c) ≃* U` is `MulEquiv.refl` specialized to the existing
type synonym and original group/topology; it does not identify the G-actions.
The actual continuous cocycle bijection is `d(g) ↦ d(g)c(g)`, with inverse
`e(g) ↦ e(g)c(g)⁻¹`. Both return cocycles and respect the ordered gauge action
with the same underlying witness. Native `Quotient.congr` gives H¹'s actual
bijection. It sends 1 to [c], so it is pointed only after repointing the target.
The invariant criterion is `c(g)g(x)=xc(g)` for every g.

The discrete S₂→S₃ transposition example proves the image of the neutral
source class is nonneutral in the original target. Its twisted invariants are
exactly 1 and the transposition (two elements, rather than the six invariants
of the original trivial action). Other tests cover the neutral value, both
inverse formulas, the quotient representative and the commutative action.
There is no assumed comparison, stored inverse oracle, or new axiom.

All 135 incoming mathematical contracts are preserved; 134 whole node objects
are unchanged. Only the inherited twisting node gains two APIs/two tests.
Its broader subgroup/quotient compatibility target remains unchanged and open.
All historical source versions/issues, route obligations, supplier requests,
key definitions and omission ledgers are retained. The reader and the entire
incoming handoff are retained verbatim after this continuation.

Totals: 144 nodes (3 definitions,25 constructions,82 lemmas,27 theorems,
7 comparisons),153 API records (141 required),128 tests (117 required),128
baseline declarations,11 planets,9 gaps,16 requests. All seven stages remain
partial and every implementation status remains unchecked. No closure claim
is made for geometric torsors, representability, local conditions or the
coefficient-class-sensitive all-degree étale K(π,1) definition. The latter's
raw-homotopy qualifications and reserved owner contract remain unchanged.
RT-AREA-algebraicgeometry/8 still imports NS/ρ and symmetric homomorphisms
from A2. Chen /57–58 and the full BDMTV NC.2/NC.5 routes, four application
items and E9/E10 remain source obligations, not consequences of this slice.

## Reading and baseline

Fresh selected reading covers the campaign, all seven stage descriptions and
17 touching stage-edge endpoints, the seven reviewed NC audit rows and full
REV-AUDIT-08 correction report, the reserved key-definition contract, all29
matching link entries, the incoming handoff and the selected existing
cocycle/gauge/twisting and restriction interfaces. Link screens are bounded
screens; no new whole135-node proof audit or whole Chen/BDMTV audit is claimed.
The upstream Jacobian and stable-reduction style reading is from this
continuous worker session, not a fresh whole-document reading.

Fresh primary source: [Kim's exact v1 PDF](https://arxiv.org/pdf/math/0409456v1),
§1 continuous cocycle/gauge definitions and complete Proposition1 statement
and proof, PDF pages5–7, accessed2026-10-03. PDF SHA-256
`00efa6e96091d564f7afa2ad9fb917a34cc0a55b7e258164383519b4e93ba941`.
The inner-group action and cocycle/orbit adapters are authored deductions from
these ordered formulas; Kim's geometric torsor classification and
representability are not certified. No complete new whole-paper read is claimed.

The actual pinned statements/bodies of MulEquiv.refl, Quotient.congr,
MulAut.conj/conj_apply and MulDistribMulAction.toMulAut were read.
The two new baseline declarations are exact index matches. Relevant old
fixed-point/orbit interfaces are reused. The actual Tau Ceti LowDegree
introduction and cochain definitions were read (lines1–160 of870); this is
neither a full low-degree-module reading nor the still-missing additive bridge.
Bounded nonabelian/twisting searches do not certify whole-library absence.
Mathlib pin `082e2d37e8b0463410cdb532e111cd43d5a66174` is exact in the existing
build; Tau Ceti's source/audit pin is `f790474821cf4256814db967cb154e7af3d0c369`.
The checked sources import only Mathlib and do not validate Tau Ceti imports.

## Lean evidence and recovery

Native.lean:2173 lines,86 examples,115 named axiom audits, zero errors,
warnings, admissions or sorryAx;12.00s,3613812KiB peak RSS. The complete incoming
1920-line native file is an exact prefix. Nine declaration headers (including
the existing two equivalence signatures) and all eight complete new example
headers match the canonical plan. The existing action-value signature uses
the definitionally identical underlying synonym; no literal-header match is
claimed for that old signature. All audited dependencies are standard
propext, Classical.choice and Quot.sound, or none.

Sketch.lean:2387 lines,128 examples,303 expected admission warnings,
zero errors or other warnings;13.30s,3587828KiB peak RSS. It removes only
TauCeti imports and the named Abelian section. The complete2404-line canonical
file is UNCOMPILED because the existing build lacks the actual
TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree.olean.
No replacement, setup, cache retrieval, library build or language server was
used. Serial runs began with43/42GiB available and a1200-second timeout;
both processes exited successfully. All new canonical outer bodies are admitted.

Source digests and normalized diagnostic digests (worker scratch prefix and
elapsed-time footer removed):

```json
{
  "Native": {
    "lines": 2173,
    "examples": 86,
    "sha256": "53fca6cde894dd0a0625e6aa73ab2e75c7067be0b8ab63b0c0a0f539d341c43b",
    "diagnosticsSha256": "59ae2d908a755099d760a749e006f78b7ca77f68f68f99a47a2ee560000b8916",
    "errors": 0,
    "warnings": 0,
    "admissionWarnings": 0,
    "axiomAudits": 115,
    "seconds": 12.0,
    "peakRSSKiB": 3613812,
    "availableGiB": 43,
    "exit": 0
  },
  "Sketch": {
    "lines": 2387,
    "examples": 128,
    "sha256": "398c677b15780deb8b76b2b3b90adf63bc3e217076fb40159608266936aaa3a2",
    "diagnosticsSha256": "063cacb4c36058688993475027fc4df5ddf0657b62e3e135da260a0ca0bff493",
    "errors": 0,
    "warnings": 303,
    "admissionWarnings": 303,
    "axiomAudits": 0,
    "seconds": 13.3,
    "peakRSSKiB": 3587828,
    "availableGiB": 42,
    "exit": 0
  },
  "Canonical": {
    "lines": 2404,
    "examples": 128,
    "sha256": "67de57f73c4794686ef666f0c26d1e057cee245bfcc7d79a5a21fa0a9f871e67",
    "compiled": false,
    "reason": "Missing actual Tau Ceti low-degree compiled artifact; the checked extraction removes only TauCeti imports and the named Abelian section."
  }
}
```

The complete checked proof is archived in an inert comment at
[`45c30245f5ea313cc99b2d0344bfe6812b3764c2`](https://github.com/CBirkbeck/tauceti-explorer/blob/45c30245f5ea313cc99b2d0344bfe6812b3764c2/research/blueprint/suggested/AnabelianGeometryAndNonabelianChabauty.lean).
The final suggested file restores the admitted plan. Save the following scripts
in your own disk scratch. From the final repository checkout, after fetching
the PR branch, run `python3 <scratch>/recover.py`. It verifies all three source
hashes and recovers the incoming controls and exact full headers.

```python
from pathlib import Path
import subprocess,hashlib,json,re
out=Path(__file__).resolve().parent
rid="AnabelianGeometryAndNonabelianChabauty"
archive="45c30245f5ea313cc99b2d0344bfe6812b3764c2"
base="aeae47c9a675600efe5c88a0b7ab4cc82b9d13f3"
path=f"research/blueprint/suggested/{rid}.lean"
raw=subprocess.check_output(["git","show",archive+":"+path])
a=b"\n/- BEGIN ARCHIVED CHECKED NONABELIAN INNER TWISTING\n"
b=b"END ARCHIVED CHECKED NONABELIAN INNER TWISTING -/\n"
assert raw.count(a)==raw.count(b)==1
native=raw.split(a,1)[1].split(b,1)[0]
can=Path(path).read_bytes()
sketch="\n".join(l for l in can.decode().splitlines() if not l.startswith("import TauCeti."))+"\n"
x=sketch.index("section Abelian");z=sketch.index("end Abelian",x)+len("end Abelian")
sketch=(sketch[:x]+sketch[z:]).encode()
for name,data,digest in [("Native.lean",native,"53fca6cde894dd0a0625e6aa73ab2e75c7067be0b8ab63b0c0a0f539d341c43b"),("Canonical.lean",can,"67de57f73c4794686ef666f0c26d1e057cee245bfcc7d79a5a21fa0a9f871e67"),("Sketch.lean",sketch,"398c677b15780deb8b76b2b3b90adf63bc3e217076fb40159608266936aaa3a2")]:
 assert hashlib.sha256(data).hexdigest()==digest,name
 (out/name).write_bytes(data)
for folder,ext in [("packets","json"),("readmes","md"),("suggested","lean"),("handoff","md")]:
 filename=("BP-" if folder=="handoff" else "")+rid+"."+ext
 original=subprocess.check_output(["git","show",base+":research/blueprint/"+folder+"/"+filename])
 (out/("original-"+folder+"."+ext)).write_bytes(original)
cantext=can.decode();prior=(out/"original-suggested.lean").read_text()
needle="instance (c : Z1 G U) : IsTopologicalGroup (Twist c) := inferInstanceAs (IsTopologicalGroup U)\n"
helper="def Twist.toOriginal (c : Z1 G U) : Twist c ≃* U := by sorry\n"
context="\nnamespace TauCeti.NonabelianCohomology\nsection TwistingContinuation"
new=cantext[cantext.rindex(context):]
assert cantext[:-len(new)].replace("\n"+helper,"",1)==prior
(out/"new-canonical.lean").write_text(new)
(out/"helper-canonical.lean").write_text(helper)
# Reconstruct header controls from the checked native continuation.
marker="\nnamespace TauCeti.NonabelianCohomology\nsection TwistingProof"
k=native.decode().rindex(marker);priornative=native[:len(native.decode()[:k].encode())]
assert hashlib.sha256(priornative).hexdigest()=="a16998e71dad9598ba3ca20aa69586a42c9815778bcc5b0200195905380beef5"
(out/"PriorNative.lean").write_bytes(priornative)
t=native.decode()[k:];starts=list(re.finditer(r"^(?:def|lemma|theorem|example)\b",t,re.M));heads={};examples=[]
def cut(block,example):
 depth=0
 for i,c in enumerate(block):
  if depth==0:
   if example:
    if re.match(r" :=(?= (?:by|rfl|one_mul)\b|\n)",block[i:]):return i
   elif block.startswith(" :=",i) or block.startswith(" where",i):return i
  if c in "([{⟨":depth+=1
  elif c in ")]}⟩":depth-=1
 raise ValueError(block[:150])
for i,m in enumerate(starts):
 block=t[m.start():starts[i+1].start() if i+1<len(starts) else len(t)];h=block[:cut(block,block.startswith("example"))]
 if h.startswith("example"):examples.append((re.findall(r"^-- test: ([\w.]+)\n",t[:m.start()],re.M)[-1],h))
 else:heads[h.split()[1]]=h
(out/"headers.json").write_text(json.dumps({"declarations":heads,"examples":examples},indent=2)+"\n")
print("Recovered three exact Lean sources, incoming controls and all continuation headers")
```

With at least20GiB available, elaborate Native.lean and Sketch.lean serially
in an existing build with the exact pinned Mathlib dependency, using
`timeout 1200 lake env lean <absolute-file>`, redirecting each output to
native.log/sketch.log beside the sources. The worker's elapsed/RSS footer is
produced by `/usr/bin/time -f 'Elapsed %e seconds; peak %M KiB'` around each run.
Do not set up or rebuild dependencies. The source hashes are reproducible;
elapsed time, memory and diagnostics may vary with the machine/tool path.

Save this verifier beside the recovered sources and logs and run it from the
repository root. It checks actual incoming objects, metadata, native prefix,
all new declaration/example headers and diagnostics. The available-memory
fields describe this worker's two runs; measure your own before compiling.

```python
from pathlib import Path
import json,re,hashlib,collections
root=Path.cwd();s=Path(__file__).resolve().parent;rid='AnabelianGeometryAndNonabelianChabauty';paths=[f'research/blueprint/{d}/{rid}.{ext}' for d,ext in [('packets','json'),('readmes','md'),('suggested','lean')]]
p=json.loads((root/paths[0]).read_text());o=json.loads((s/'original-packets.json').read_text());nn={n['id']:n for n in p['nodes']};on={n['id']:n for n in o['nodes']};special=rid+':NC.3/twisting'
assert len(on)==135 and len(nn)==144
for id,n in on.items():
 for k,v in n.items():
  if id==special and k in ('api','tests'):assert nn[id][k][:len(v)]==v
  else:assert nn[id][k]==v,(id,k)
assert sum(nn[id]==n for id,n in on.items())==134
for k in o:
 if k not in ('nodes','baseline','summary','coverage','sources'):assert p[k]==o[k],k
assert p['sources'][:-1]==o['sources']
assert p['baseline']['declarations'][:-2]==o['baseline']['declarations']
for k in o['baseline']:
 if k!='declarations':assert p['baseline'][k]==o['baseline'][k]
for a,b in zip(o['coverage'],p['coverage']):
 if a['stageId']==rid+':NC.3':assert b['remaining'][:-1]==a['remaining'];assert {k:v for k,v in b.items() if k!='remaining'}=={k:v for k,v in a.items() if k!='remaining'}
 else:assert a==b
assert all(n['implementationStatus']=='unchecked' for n in p['nodes'])
assert (root/paths[1]).read_bytes().endswith((s/'original-readmes.md').read_bytes())
can=(root/paths[2]).read_text();helper=(s/'helper-canonical.lean').read_text();new=(s/'new-canonical.lean').read_text();assert can[:-len(new)].replace('\n'+helper,'',1)==(s/'original-suggested.lean').read_text()
native=(s/'Native.lean').read_bytes();prior=(s/'PriorNative.lean').read_bytes();assert native.startswith(prior);assert hashlib.sha256(prior).hexdigest()=='a16998e71dad9598ba3ca20aa69586a42c9815778bcc5b0200195905380beef5'
h=json.loads((s/'headers.json').read_text());decls=h['declarations'];names=['Twist.toOriginal','Z1.twistEquiv','H1.twistEquiv','Z1.twistEquiv_apply','Z1.twistEquiv_symm_apply','Z1.twistEquiv_smul','H1.twistEquiv_mk','H1.twistEquiv_eq_class_iff','Twist.mem_fixed_iff']
for name in names:assert decls[name]+' := ' in can,name
for name,head in h['examples']:assert '-- test: '+name+'\n'+head+' := by sorry' in can,name
assert len(h['examples'])==8
assert not re.search(r'\b(sorry|admit|axiom)\b',native.decode())
reader=(root/paths[1]).read_text()
for id in set(nn)-set(on):
 n=nn[id];assert n['statement'] in reader and n['declarationName'] in reader
 for a in n.get('api',[]):assert a['name'] in reader and a['statement'] in reader
 for test in n.get('tests',[]):assert test['name'] in dict(h['examples']) and test['statement'] in reader
for test in nn[special]['tests'][len(on[special]['tests']):]:assert test['name'] in dict(h['examples']) and test['statement'] in reader
for n in p['nodes']:
 for a in n.get('api',[]):assert a['name'] in can or a['name'].split('.')[-1] in can,a['name']
 for test in n.get('tests',[]):assert test['name'] in can,test['name']
sketch='\n'.join(l for l in can.splitlines() if not l.startswith('import TauCeti.'))+'\n';a=sketch.index('section Abelian');z=sketch.index('end Abelian',a)+len('end Abelian');assert sketch[:a]+sketch[z:]==(s/'Sketch.lean').read_text()
import importlib.util,subprocess
spec=importlib.util.spec_from_file_location('intake',root/'research/blueprint/intake.py');intake=importlib.util.module_from_spec(spec);spec.loader.exec_module(intake)
allowed=paths+[f'research/blueprint/handoff/BP-{rid}.md']
assert intake.check_files(allowed)==0
jobs,mapping=intake.load_queue();job=next(j for j in jobs if j['id']=='BP-'+rid);refusals=intake.auto_refusals(job,allowed,False,set(),{'codex-J6LwjP'});assert not refusals,refusals
assert set(subprocess.check_output(['git','diff','--name-only','origin/main'],text=True).splitlines())<=set(allowed)
report={'preservedContracts':135,'unchangedNodeObjects':134,'newNodes':9,'declarationHeadersMatched':9,'newExampleHeadersMatched':8,'incomingNativeBytes':len(prior),'kinds':dict(collections.Counter(n['kind'] for n in p['nodes'])),'apiOverall':sum(len(n.get('api',[])) for n in p['nodes']),'testsOverall':sum(len(n.get('tests',[])) for n in p['nodes'])}
receipts={}
for name,source,log,avail in [('Native',s/'Native.lean',s/'native.log',43),('Sketch',s/'Sketch.lean',s/'sketch.log',42)]:
 t=source.read_text();l=log.read_text();norm=l.replace(str(s)+'/','');norm=re.sub(r'Elapsed [^\n]+\n?','',norm);errors=len(re.findall(r': error:',l));warnings=len(re.findall(r': warning:',l));admissions=len(re.findall(r'warning: declaration uses `sorry`',l));assert errors==0
 if name=='Native':assert warnings==0 and 'sorryAx' not in l
 else:assert warnings==admissions==303,(warnings,admissions)
 timing=re.search(r'Elapsed ([\d.]+) seconds; peak (\d+) KiB',l);assert timing
 receipts[name]={'lines':len(t.splitlines()),'examples':len(re.findall(r'^example\b',t,re.M)),'sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'diagnosticsSha256':hashlib.sha256(norm.encode()).hexdigest(),'errors':errors,'warnings':warnings,'admissionWarnings':admissions,'axiomAudits':len(re.findall(r'^#print axioms',t,re.M)),'seconds':float(timing[1]),'peakRSSKiB':int(timing[2]),'availableGiB':avail,'exit':0}
receipts['Canonical']={'lines':len(can.splitlines()),'examples':len(re.findall(r'^example\b',can,re.M)),'sha256':hashlib.sha256(can.encode()).hexdigest(),'compiled':False,'reason':'Missing actual Tau Ceti low-degree compiled artifact; the checked extraction removes only TauCeti imports and the named Abelian section.'}
(s/'receipts.json').write_text(json.dumps(receipts,indent=2)+'\n');(s/'preservation.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({'preservation':report,'receipts':receipts},indent=2))

assert (root/f"research/blueprint/handoff/BP-{rid}.md").read_bytes().endswith((s/"original-handoff.md").read_bytes())

assert (root/f"research/blueprint/handoff/BP-{rid}.md").read_bytes().endswith((s/"original-handoff.md").read_bytes())

assert (root/f"research/blueprint/handoff/BP-{rid}.md").read_bytes().endswith((s/"original-handoff.md").read_bytes())
```

## Actual atlas validation

The indexed packet checker reports zero errors/warnings. The actual assembler
uses the candidate as promotion input on the publication tree and compares
its incoming control on the same tree. Stage DAG3018/8655, owner DAG144/319,
combined DAG3151/9154 are acyclic;144 reachable declarations,zero unresolved
references and all20 required supplier-stage paths reachable. The51 virtual
supplier endpoints are counted explicitly. The owner has no skipped/pending
links; other roadmaps' skipped/pending links and all stage edges are unchanged.
No synthetic realises-to-parent edges are substituted for actual parent metadata.

Save this separate graph checker as graph.py beside the controls; run
`TAUCETI_BASELINE=<existing-baseline-directory> python3 <scratch>/graph.py <scratch>/original-packets.json`.
The environment value is the directory containing declarations.tsv.

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

report.update(preservedStatementContracts=135,unchangedNodeObjects=134,addedNodes=9,apiTotal=sum(len(n.get('api',[])) for n in p['nodes']),testsTotal=sum(len(n.get('tests',[])) for n in p['nodes']),baseline=len(p['baseline']['declarations']),gaps=len(p['gaps']),requests=len(p['requests']))
report['scriptSha256']=__import__('hashlib').sha256(Path(__file__).read_bytes()).hexdigest()
print(json.dumps(report,ensure_ascii=False,indent=2))
```

Only the four issue-authorized files differ from publication main.
For the actual intake file rules, run `python3 research/blueprint/intake.py
check-files` followed by those four paths. Native proof recovery from the
public archive and the canonical/extraction hashes must be verified before
scratch cleanup. No worker process is left running at submission.

## Resume

Continue from this actual twisting action and orbit bijection. Prove subgroup,
quotient and source/coefficient naturality without losing its base point or
noncommutative multiplication order; construct the genuine additive cocycle
comparison against the pinned Tau Ceti cochain differential and transition
colimit machinery. Keep geometric/unipotent topologies, torsor realizations,
representability and local conditions open until their actual constructions
and supplier interfaces are established. Source-sensitive NC.0/NC.1 and
complete Chen/BDMTV obligations still require their separate source work.

---

# Historical predecessor handoff — unchanged codex-7e92bd record

The following entire incoming record is retained verbatim as historical
provenance. Its receipts, commands and frontier describe that earlier
checkpoint; the current recovery and verification instructions above take
precedence for this continuation.

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
