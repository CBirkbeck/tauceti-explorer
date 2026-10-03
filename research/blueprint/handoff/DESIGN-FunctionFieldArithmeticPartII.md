# Function-field rational-coordinate checkpoint

Agent: Codex — codex-7e92bd. Date: 2026-10-03. Refs #3403.
Claim5968506448 was confirmed by bot5968507290; the complete issue was reread after confirmation. Scope stays within the five permitted deliverables.

Proof archive: `6198988fb738488f01a04bec58b835bac969edb6`
Math base: `bf81c488cd59162798eae2db62b8ccd4edd4ca8c`.
Publication base: `8155f17cfe1b5ca6469df11f9e24a2249bc8d3d9`.

## Result and exact boundary

The existing normalized rational characters, finite group-algebra/chart maps, factorial unity-root map and actual A-algebra equivalence with A[Q/Z] now have separate native proof evidence. The extraction proves all28 existing coordinate declarations, including finite and colimit injectivity, surjectivity, the rational inverse-basis formula, comultiplication, counit, antipode and arbitrary coefficient naturality. Three additional computation lemmas expose natural representatives, canonical residue representatives and arbitrary factorial-level elements. The root-stack key, all388 original statement contracts, all existing APIs/tests and both arithmetic source routes are retained. The28 old execution qualifiers are explicitly attributed to their original checkpoint, without changing mathematical hypotheses. Ten old proof routes acquire explicit native alternatives; two construction APIs acquire the three helper lemmas and tests. All391 nodes remain unchecked and all ten stages partial.

The additions are:

- `TauCeti.RootStack.affineQZCharacter.natCast`: c_n([k])=[k/n] for any natural representative k.
- `TauCeti.RootStack.affineQZCharacter.apply`: c_n(k)=[val(k)/n].
- `TauCeti.RootStack.factorialUnitQZMap.level`: F after the i-th factorial inclusion equals the finite root map on every element of that quotient.

There are18 checked coordinate examples, including all15 incoming examples and three new regressions. The characteristic-two group algebra retains a nonzero square-zero element, and the infinite example checks its three-term comultiplication. The negative inverse and the nonflat coefficient map Z→Z/2 are checked. Arbitrary coefficients include the zero ring. No field-point or reduced-fibre substitute occurs.

The actual rational coaction on an arbitrary-section chart still has admitted contracts in the incoming continuation. Its coefficient square currently has only the predecessor's conditional proof evidence. The new E_A is now available to prove those contracts, after which that square can be replayed without their admissions. This checkpoint does not claim a geometric inverse limit, fpqc torsor/quotient equivalence, higher-universe/full-positive-index transport or completion of the DVR/Kummer bridge.

The full canonical suggested file remains **UNCOMPILED**. It has4284 lines and254 examples, SHA256 `576fa8fb811fc980a1850d2d333dff9d28f8fdeb7c33b29c8572cc1a65e52ad0`. The available full Tau build is not at the required source pin. The exact Mathlib-only fragments below are distinct authenticated artifacts. No library setup, dependency build/cache, Lake update or language server was used.

## Native execution

Existing Mathlib build pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`, with clean source checkout verified. Lean4.34.0-rc2. Tau source baseline: `f790474821cf4256814db967cb154e7af3d0c369`; available Tau build revision: `cf386627e9176a3827c1a5fe804989fd94a4d216`.

- `Native.lean`:5238 lines,220 examples,262 printed axiom audits. Exit0 in54.33 seconds;59GiB available immediately before compilation; peakRSS4,007,172KiB. Zero errors, warnings or admissions. All262 audits use only propext, Classical.choice and Quot.sound; the new31 declarations are individually audited. Source SHA256 `b14379ec16aebdf34588cdcfd038b7e69b4c079457d21e77f2fb513e003d998a`; normalized diagnostic SHA256 `15a3388756e192598c7b781ec83b115c869d84bc481e4b179d0aecfb70a3e9d7`.
- `AdmittedTyping.lean`:5264 lines. Exit0 in57.14 seconds;58GiB available immediately before compilation; peakRSS4,007,968KiB. Exactly83 expected admitted-declaration warnings and no other diagnostics. This is the predecessor's complete Mathlib-only admitted-coordinate/coaction/coefficients fragment plus the six new lemma/example signatures. Source SHA256 `924d77c99d144d59c2d0b75d036a4f54b91699a40e54e964f016fc5ad23246a9`; normalized diagnostic SHA256 `9efd6a19a0a7867d98447472aabf7887fcf756081b1fa9a8cf13b2707209080f`.

These were serial synchronous compilations, each bounded by1200 seconds. No compiler was left running. All28 existing selected declaration headers and fifteen example headers match the incoming canonical contracts modulo universe-variable spelling and whitespace. The three new lemma and three example headers match the appended canonical signatures. The full native fragment is checked for absence of admissions as well as its axiom audit.

## Validation and preservation

Actual blueprint checker: zero errors and warnings.391 nodes:67 constructions,11 definitions,11 comparisons,264 lemmas,37 theorems,1 application.308 checker API items/313 raw;277 required unit tests/309 raw;40 planets;236 baseline declarations. Eight original gaps and thirteen supplier requests remain. All33 own source-coverage rows and the independent38-item symplectic sibling route, source issues and reserved identifiers are preserved.

The actual intake functions report zero file problems/refusals. All23 guarded governing/audit/key/supplier/checker inputs and own files are unchanged between the math and publication bases. The actual atlas assembler, checker and accepted restructure inputs are read through one immutable Git tree per invocation; the candidate and incoming controls use that same tree. No repository snapshot or synthetic substitute atlas is used.

- Both bases: stageDAG3057 vertices/8724 edges; own declarationDAG391/925; both acyclic. All87 required stage reachability pairs hold. No unresolved prerequisite, own skipped link or pending link exists. The candidate's stage edges and other roadmaps' skips match the corresponding incoming control.
- Math base: scopedDAG3545/10534;528 reachable declarations,137 external;324 baseline leaves.
- Publication base: scopedDAG3553/10564;536 reachable declarations,145 external;331 baseline leaves. These external differences come from other workers' merged inputs and are validated against the publication control.
- All3658 accepted restructure pairs were tested. None is owned by this roadmap. The45 unrelated preexisting unreachable pairs are unchanged in the control; their list SHA256 is `4101be60e5c05999c4e96d9a60d93f717851d100e0bf02c6b4bac42a630c4aa6`.
- All36 link-map files were read for own references; none matched. The immutable runs read845 paths, with sorted-path-list SHA256 `058eeeb5e5c0bdfc5035fb51bc7ec615b0620060b78255e78566ae7f62f43681`.

## Reading and provenance

Fresh reading covers the complete printed14–16 of [Talpo–Vistoli1410.1164v2](https://arxiv.org/pdf/1410.1164v2), including the proofs of Lemmas3.7/3.12 and Proposition3.10 and Corollary3.13. The reading used extracted PDF text, with no screenshot or whole-paper claim. The named adapters are authored deductions motivated by that local model. Source/erratum receipts elsewhere in the incoming packet remain attributed to their original workers.

Fresh pinned-library reading includes the rational AddCircle quotient/interval API, ZMod.lift and canonical representatives, monoid-algebra domain maps and induction, AlgEquiv.ofBijective, and the native commutative antipode algebra map. The existing real-valued ZMod.toAddCircle was read and credited as a near match; it does not provide the rational target. The pinned Tau AddCircle torsion-generator and rational-exhaustion statements were read; they remain the earlier alternative route. The native proof instead uses a rational representative's numerator and denominator.

Reviewed audit reads: applicable FA.2/FA.4/FA.7 rows and complete REV-AUDIT20; no separate PartII layer audit found. Full earlier own AlgebraicCurves and JacobianChallenge document readings were reused after byte guards against checkpoint5957. Current stages, reserved root-stack definition/owner, requests, gaps and both route ledgers were inspected. This is not a fresh complete reading of Yun–Zhang or Abdurrahman–Venkatesh.

Bounded prior-art search: open PR query `group algebra rational in:title`, limit30, returned no matches. The indexed [Q/Z as a colimit Zulip discussion](https://leanprover-community.github.io/archive/stream/113489-new-members/topic/Q.2FZ.20as.20colimit.20of.20Z.2FnZ.html) was read; it recommends DirectLimit and notes missing comparison APIs. No implementation was adopted and no exhaustive absence claim is made.

The immediate predecessor is [PR5978](https://github.com/CBirkbeck/tauceti-explorer/pull/5978), archive `349ab914f41aaa37284158de168c513dc40229d4`. Its36 artifacts were recovered through GitHub and hash-verified; its four mathematical deliverables match this input byte-for-byte. `NativeIncoming.lean` is the inherited admission-free finite cyclic carrier. The prior complete handoff remains accessible from that public PR; its original source claims are not silently re-certified here.

## Resume

1. Recover this exact native E_A and prove the ten existing arbitrary-section rational coaction contracts, retaining the LEFT character factor and native tensor maps.
2. Replace the predecessor's admitted coaction assumptions and replay its coefficient naturality and one-way coinvariance preservation proofs. Do not infer reflection under a noninjective coefficient map.
3. Complete positive-index/higher-universe transport, coherent root-object reindexing, affine Spec limits, fpqc frame torsors and the geometric quotient comparison using the stated owners. Preserve TOWER-AFF, KUMMER-FINITE, TOWER-TYPING, the non-fppf all-roots-of2 example and both source routes.
4. Complete full exact-pin Tau typing and the remaining geometric and arithmetic gaps before changing any implementation or stage-closure status.

## Public recovery and replay

The archive is an ancestor commit touching only the permitted suggested file. Its delimited compressed JSON payload authenticates29 text artifacts: native and admitted sources, tests, audits, diagnostics, resource receipts, inputs, reading receipt and both graph receipts. The final suggested file has no payload. `recover.py` checks every artifact hash and the canonical file before exposing the current five deliverables. The four scripts below are read from the actual final handoff; no stale local helper is trusted.

Run from a checkout containing the pinned publication base and archive history:

```sh
python3 recover.py replay PR_HEAD
TAUCETI_REPO=. python3 replay/verify.py replay BASELINE/declarations.tsv
```

For actual remote recovery add `PUBLIC_RECOVERY=1` to the first command; it reads the five head blobs and archive via GitHub. To replay the starting world set `ROOTS_VALIDATE_BASE=bf81c488cd59162798eae2db62b8ccd4edd4ca8c` for the verifier. `compile.py` is a separate optional serial recheck using an already-existing exact Mathlib build, with the WORKERS resource guard:

```sh
TAUCETI_BUILD=EXISTING_BUILD python3 replay/compile.py replay Native.lean
TAUCETI_BUILD=EXISTING_BUILD python3 replay/compile.py replay AdmittedTyping.lean
```

Do not compile the complete canonical with the mismatched Tau build. A reviewer need not rerun Lean merely to authenticate the recorded sources, diagnostics and receipts.

### recover.py

```python
"""Recover the public evidence and current five deliverables; uses git or GitHub read-only."""
from pathlib import Path
import sys,subprocess,re,json,zlib,base64,hashlib,os
out=Path(sys.argv[1]);ref=sys.argv[2] if len(sys.argv)>2 else 'HEAD';out.mkdir(parents=True,exist_ok=True);RID='FunctionFieldArithmeticPartII'
def read(commit,path):
 if os.environ.get('PUBLIC_RECOVERY')=='1':
  return subprocess.check_output(['gh','api','repos/CBirkbeck/tauceti-explorer/contents/'+path+'?ref='+commit,'-H','Accept: application/vnd.github.raw+json'])
 return subprocess.check_output(['git','show',commit+':'+path])
paths={f'research/blueprint/roadmaps/{RID}.json':'Candidate-roadmap.json',f'research/blueprint/packets/{RID}.json':'Candidate.json',f'research/blueprint/readmes/{RID}.md':'Reader.md',f'research/blueprint/suggested/{RID}.lean':'Canonical.lean',f'research/blueprint/handoff/DESIGN-{RID}.md':'Handoff.md'}
head={path:read(ref,path) for path in paths};handoff=head[f'research/blueprint/handoff/DESIGN-{RID}.md'].decode();archive=re.search(r'Proof archive: `([0-9a-f]{40})`',handoff).group(1)
t=read(archive,f'research/blueprint/suggested/{RID}.lean').decode();m=re.search(r'/\- BEGIN ARCHIVED RATIONAL COORDINATE PAYLOAD\n(.*?)\nEND ARCHIVED RATIONAL COORDINATE PAYLOAD -/',t,re.S);assert m
items=json.loads(zlib.decompress(base64.b64decode(m.group(1))))
manifest={}
for name,item in items.items():
 assert name==Path(name).name and name not in {'.','..'}
 data=item['text'].encode();h=hashlib.sha256(data).hexdigest();assert h==item['sha256'];(out/name).write_bytes(data);manifest[name]=h
assert head[f'research/blueprint/suggested/{RID}.lean']==(out/'Canonical.lean').read_bytes()
for path,name in paths.items():(out/name).write_bytes(head[path])
(out/(RID+'.json')).write_bytes((out/'Candidate.json').read_bytes())
(out/'artifact-manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
for name in ['recover.py','verify.py','immutable_view.py','compile.py']:
 m=re.search(r'### '+re.escape(name)+r'\n\n```python\n(.*?)\n```\n',handoff,re.S);assert m,name;(out/name).write_text(m.group(1)+'\n')
print(json.dumps({'head':ref,'archive':archive,'verifiedArtifacts':len(items),'currentDeliverables':len(paths),'scripts':4,'allHashesMatch':True,'publicGitHubReads':os.environ.get('PUBLIC_RECOVERY')=='1'},indent=2))
```

### verify.py

```python
"""Exact immutable checker, intake, graph and archived proof/source validation."""
from pathlib import Path
import ast,collections,copy,hashlib,json,os,re,subprocess,sys
R=Path(os.environ.get('TAUCETI_REPO',str(Path.cwd()))).resolve();S=Path(sys.argv[1]).resolve()
RID='FunctionFieldArithmeticPartII';P=RID+':RS.2/';NS='TauCeti.RootStack.'
MATH=(S/'math-base.txt').read_text().strip();BASE=os.environ.get('ROOTS_VALIDATE_BASE',(S/'publication-base.txt').read_text().strip())
FILES=['research/blueprint/'+d+'/'+('DESIGN-' if d=='handoff' else '')+RID+'.'+e for d,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
def readref(ref,path):return subprocess.check_output(['git','show',ref+':'+path],cwd=R,text=True)
proposal=dict(zip(FILES,[(S/n).read_text() for n in ['Candidate-roadmap.json','Candidate.json','Reader.md','Canonical.lean','Handoff.md']]))
p=json.loads(proposal[FILES[1]]);old=json.loads((S/'Incoming-packets.json').read_text());nodes={n['id']:n for n in p['nodes']}
rd=json.loads(proposal[FILES[0]]);rold=json.loads((S/'Incoming-roadmaps.json').read_text());changes=json.loads((S/'changes.json').read_text())
assert len(old['nodes'])==388 and len(nodes)==391
changed={}
coordinateNames=set(json.loads((S/'proved-names.json').read_text()))
for a in old['nodes']:
 b=nodes[a['id']];allowed=[]
 if a.get('declarationName') in coordinateNames:
  allowed+=['hypotheses'];assert b['hypotheses'][:-1]==a['hypotheses'][:-1];assert b['hypotheses'][-1]=='Original QZCoordinates-codex-J6LwjP checkpoint: these planning declarations had admitted, then-uncompiled prototypes. The current separate native proof evidence does not certify the full canonical geometric file or the fpqc quotient.'
 if a['id'] in changes['proofRouteChanges']:
  allowed+=['prerequisites','proofSteps'];assert b['prerequisites'][:len(a['prerequisites'])]==a['prerequisites'];assert b['proofSteps'][:-1]==a['proofSteps']
 if a.get('declarationName') in [NS+'affineQZCharacter',NS+'factorialUnitQZMap']:
  allowed+=['api','tests','uses'];k=2 if a['declarationName']==NS+'affineQZCharacter' else 1
  for field in ['api','tests','uses']:assert b[field][:-k]==a[field]
 assert {k:v for k,v in a.items() if k not in allowed}=={k:v for k,v in b.items() if k not in allowed},a['id']
 if a!=b:changed[a['id']]=allowed
for key in old:
 if key not in ['nodes','summary','baseline','sources','coverage','auditEvidence','continuationHistory']:assert p[key]==old[key],key
assert p['sources'][:-1]==old['sources'] and p['baseline']['declarations'][:-8]==old['baseline']['declarations']
assert {k:v for k,v in p['baseline'].items() if k!='declarations'}=={k:v for k,v in old['baseline'].items() if k!='declarations'}
assert {k:v for k,v in p['auditEvidence'].items() if k!='rationalCoordinateNative'}==old['auditEvidence']
assert p['continuationHistory'][:-1]==old['continuationHistory']
for a,b in zip(old['coverage'],p['coverage']):
 if a['stageId'].endswith(':RS.2'):
  assert b['remaining'][:-1]==a['remaining'];assert {k:v for k,v in a.items() if k!='remaining'}=={k:v for k,v in b.items() if k!='remaining'}
 else:assert a==b
assert len(p['sourceCoverage'])==33 and len(p['requests'])==13 and len(p['gaps'])==8
assert all(n['implementationStatus']=='unchecked' for n in p['nodes']) and p['status']=='partial'
assert {k:v for k,v in rd.items() if k not in ['summary','stages']}=={k:v for k,v in rold.items() if k not in ['summary','stages']}
assert rd['summary'].startswith(rold['summary'])
for a,b in zip(rold['stages'],rd['stages']):
 if a['key']=='RS.2':
  assert b['description'].startswith(a['description']);assert {k:v for k,v in a.items() if k!='description'}=={k:v for k,v in b.items() if k!='description'}
 else:assert a==b
canonical=proposal[FILES[3]];assert canonical==(S/'Incoming-suggested.lean').read_text()+'\n/- Native rational-character computation API. Separate proof evidence is in the handoff. -/\n'+(S/'NewAdmitted.lean').read_text()
assert proposal[FILES[2]].endswith((S/'Incoming-readmes.md').read_text())
reader=proposal[FILES[2]][:-len((S/'Incoming-readmes.md').read_text())]
assert 'sorry' not in reader and '```lean' not in reader
for nid in changes['newNodes']:
 n=nodes[nid];assert n['declarationName'] in reader and n['statement'] in reader
for name in changes['newTests']:
 t=next(t for n in p['nodes'] for t in n.get('tests',[]) if t['name']==name);assert t['name'] in reader and t['statement'] in reader
for f,v in proposal.items():assert not re.search(r'/(?:home|tmp|Users)/|file'+'://|[ \t]+$',v,re.M),f

def headers(t):
 out=[]
 for m in re.finditer(r'^(?:def|lemma|example)\b',t,re.M):
  depth=0;end=None
  for i in range(m.start(),len(t)):
   if t[i] in '([{':depth+=1
   elif t[i] in ')]}':depth-=1
   if depth==0 and t.startswith(':=',i):
    line=t[t.rfind('\n',0,i)+1:i]
    if re.match(r'\s*(?:let|letI)\b',line):continue
    end=i;break
  assert end is not None
  out.append(re.sub(r'uQZ\w*','uQZ',' '.join(t[m.start():end].split())))
 return out
proof='\n'.join((S/f).read_text() for f in ['FiniteQZ.lean','InfiniteQZ.lean','HopfQZ.lean'])
oldheads=headers((S/'QZIncoming.lean').read_text());newheads=headers(proof);tests=headers((S/'QZTests.lean').read_text())
assert len(newheads)==31 and len(tests)==18 and len(oldheads)==43
assert all(h in newheads for h in oldheads[:28]);assert oldheads[28:]==tests[:15]
assert all(h in headers(canonical) for h in newheads) and all(h in headers(canonical) for h in tests)
assert headers((S/'NewAdmitted.lean').read_text())==[h for h in newheads if h not in oldheads[:28]]+tests[15:]
native=(S/'Native.lean').read_text();assert native=='import Mathlib.Topology.Instances.AddCircle.Defs\nimport Mathlib.RingTheory.HopfAlgebra.Convolution\n'+(S/'NativeIncoming.lean').read_text()+'\n'+proof+'\n'+(S/'QZTests.lean').read_text()+'\n'+(S/'Audits.lean').read_text()
assert not re.search(r'\b(?:sorry|admit|axiom)\b',native)
assert (S/'AdmittedTyping.lean').read_text()==(S/'IncomingAdmittedTyping.lean').read_text()+'\n'+(S/'NewAdmitted.lean').read_text()
resources={}
for name,expected in [('Native.lean',0),('AdmittedTyping.lean',83)]:
 rec=json.loads((S/(name+'.receipt.json')).read_text());log=(S/(name+'.log')).read_text();src=(S/name).read_bytes()
 assert rec['exit']==0 and rec['errors']==0 and rec['warnings']==rec['admissionWarnings']==expected
 assert rec['availableGiBBefore']>=20 and rec['seconds']<1200
 assert rec['sourceSha256']==hashlib.sha256(src).hexdigest() and rec['logSha256']==hashlib.sha256(log.encode()).hexdigest()
 assert not re.search(r': error(?:\([^)]*\))?:',log)
 assert len(re.findall(r'warning: declaration uses .sorry.',log))==expected
 resources[name]=rec
log=(S/'Native.lean.log').read_text();audits=re.findall(r"'([^']+)' depends on axioms: \[([^\]]*)\]",log,re.S)
assert len(audits)==262
for name,axioms in audits:assert set(x.strip() for x in axioms.split(','))<={'propext','Classical.choice','Quot.sound'},(name,axioms)
assert set(json.loads((S/'proved-names.json').read_text()))<={name for name,_ in audits}
if (S/'artifact-manifest.json').exists():
 for name,sha in json.loads((S/'artifact-manifest.json').read_text()).items():assert hashlib.sha256((S/name).read_bytes()).hexdigest()==sha,name
sys.path.insert(0,str(S))
GUARDS=["research/blueprint/WORKERS.md","research/blueprint/PROTOCOL.md","research/expansion/PROTOCOL.md","research/blueprint/UPSTREAM_GUIDE.md","data/library-coverage.json","research/blueprint/reviews/REV-AUDIT-02.md","research/blueprint/reviews/REV-AUDIT-20.md","data/keydefs/KEYDEF-algebraicgeometry.json","research/blueprint/keydefs/KEYDEF-algebraicgeometry.json","research/blueprint/keydefs/owners.json","research/blueprint/reserved-ids.json","content/tau-ceti/JacobianChallenge/README.md","content/tau-ceti/AlgebraicCurves/README.md","scripts/check_blueprint.py","scripts/source_issues.py","scripts/build.py","scripts/blueprints.py","research/blueprint/intake.py"]
for f in GUARDS+FILES:assert readref(MATH,f)==readref(BASE,f),('input changed',f)
linkpaths=[x for x in subprocess.check_output(['git','ls-tree','-r','--name-only',BASE],cwd=R,text=True).splitlines() if x.startswith('research/blueprint/links/') and x.endswith('.json')]
linkmatches=[]
for path in linkpaths:
 q=json.loads(readref(BASE,path))
 for key in ['links','overlaps','examined']:
  for entry in q.get(key,[]):
   if RID+':' in json.dumps(entry):linkmatches.append({'path':path,'kind':key,'entry':entry})
print(json.dumps({'boundedLinkMapsRead':len(linkpaths),'ownRelevantEntries':linkmatches}),flush=True)
os.environ['ROOTS_VALIDATE_BASE']=BASE
import immutable_view as gv
gv.install();sys.path.insert(0,str(R/'scripts'))
import check_blueprint,build,blueprints
errors,warnings,checker=check_blueprint.check(S/(RID+'.json'),check_blueprint.load_index(Path(sys.argv[2])),check_blueprint.world())
assert not errors and not warnings,(errors,warnings)
tree=ast.parse((R/'research/blueprint/intake.py').read_text());names={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id in {'ALLOWED','PRIVATE'} for t in n.targets) or isinstance(n,ast.FunctionDef) and n.name in names]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake', 'exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs'] if j['id']=='DESIGN-'+RID)
problems=[x for path,text in proposal.items() for x in env['file_problems'](path,text)]
refusals=env['auto_refusals'](job,list(proposal),False,{'codex-7e92bd'},set())
assert not problems and not refusals,(problems,refusals)
packets,documents,definitions=blueprints.load_promoted(R)
keep=[x for x in packets if x[0]!=RID];documents[RID]=FILES[2]
def assemble(candidate,definition):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(RID,candidate)]),copy.deepcopy(documents),copy.deepcopy([d for d in definitions if d.get('id')!=RID]+[definition]))
 return build.assemble(require_distances=False)[0]
a=assemble(p,rd);b=assemble(old,rold)
world={}
for folder in ['data/decompositions','data/blueprints','research/blueprint/packets']:
 for file in sorted((R/folder).glob('*.json')):
  for n in json.loads(file.read_text()).get('nodes',[]):world.setdefault(n['id'],n)
world.update(nodes)
listedstageids={x['id'] for x in a['stages']}
stageids=listedstageids|set(check_blueprint.world()[1])
se={(e['source'],e['target']) for e in a['stageEdges']}
assert se=={(e['source'],e['target']) for e in b['stageEdges']}
def dag(vertices,edges):
 vertices=set(vertices)|{v for e in edges for v in e}
 following=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for s,t in edges:
  if t not in following[s]:following[s].add(t);indeg[t]+=1
 todo=[v for v,k in indeg.items() if k==0];count=0
 while todo:
  v=todo.pop();count+=1
  for w in following[v]:
   indeg[w]-=1
   if indeg[w]==0:todo.append(w)
 assert count==len(vertices),[v for v,k in indeg.items() if k][:10]
 return {'vertices':len(vertices),'edges':len(edges),'acyclic':True}
ownedges={(d,nid) for nid,n in nodes.items() for d in n['prerequisites'] if d in nodes}
todo=list(nodes);seen=set();de=set();unresolved=set();baseref=set()
while todo:
 nid=todo.pop()
 if nid in seen:continue
 seen.add(nid)
 for d in world[nid].get('prerequisites',[]):
  if d.startswith(('mathlib:','tauceti:')) and d not in stageids:baseref.add(d);continue
  de.add((d,nid))
  if d in world:todo.append(d)
  elif d not in stageids:unresolved.add(d)
assert not unresolved,unresolved
de|={(world[nid]['parentStageId'],nid) for nid in seen if world[nid].get('parentStageId')}
de|={(q['supplier'],v) for q in p['requests'] for v in q.get('neededBy',[]) if v in nodes or v in stageids}
out=collections.defaultdict(set)
for s,t in se:out[s].add(t)
def reachable(source,target):
 todo=[source];seen=set()
 while todo:
  v=todo.pop()
  if v==target:return True
  if v not in seen:seen.add(v);todo.extend(out[v])
 return False
def stageof(v):
 checked=set()
 while v in world and v not in checked:checked.add(v);v=world[v].get('parentStageId')
 return v
pairs={(d,s['id']) for s in a['stages'] if s['id'].startswith(RID+':') for d in s.get('requires',[])}
pairs|={(d,stageof(nid)) for nid,n in nodes.items() for d in n['prerequisites'] if d in stageids and d not in world and d!=stageof(nid)}
pairs|={(stageof(q['supplier']),stageof(v)) for q in p['requests'] for v in q['neededBy'] if stageof(q['supplier'])!=stageof(v)}
rspairs=set()
for file in (R/'research/blueprint/restructure').glob('*.result.json'):
 q=json.loads(file.read_text())
 if q.get('review',{}).get('status')!='accepted':continue
 rspairs|={(x['source'],x['target']) for x in q.get('links',[]) if x.get('source') in stageids and x.get('target') in stageids}
assert all(reachable(s,t) for s,t in pairs),sorted((s,t) for s,t in pairs if not reachable(s,t))
missing_restructures=sorted((s,t) for s,t in rspairs if not reachable(s,t))
assert not any(s.startswith(RID+':') or t.startswith(RID+':') for s,t in missing_restructures),missing_restructures
# Stage edges are identical to the incoming control, so these unrelated preexisting paths are unchanged.
ar={r['id']:r for r in a['roadmaps']};br={r['id']:r for r in b['roadmaps']}
assert ar[RID]['blueprint']['declarations']==len(nodes)
assert not ar[RID]['blueprint']['skippedLinks'] and not ar[RID].get('pendingLinks',[])
def skips(r):return r.get('blueprint',{}).get('skippedLinks',[]),r.get('pendingLinks',[])
assert all(skips(ar[x])==skips(br[x]) for x in br if x!=RID)
summary={'stageDAG':dag(listedstageids,se),'ownDeclarationDAG':dag(nodes,ownedges),'scopedDAG':dag(listedstageids|seen,se|de),'reachableDeclarations':len(seen),'externalDeclarations':sorted(seen-set(nodes)),'baselineLeaves':len(baseref),'requiredPairs':len(pairs),'restructurePairs':len(rspairs),'ownRestructurePairs':sum(s.startswith(RID+':') or t.startswith(RID+':') for s,t in rspairs),'otherPreexistingUnreachableRestructurePairs':len(missing_restructures),'otherUnreachableRestructurePairListSha256':hashlib.sha256(json.dumps(missing_restructures).encode()).hexdigest(),'unresolved':sorted(unresolved),'ownSkippedLinks':[],'ownPendingLinks':[],'otherSkipsMatch':True,'stageEdgesUnchanged':True}

print(json.dumps({'mathBase':MATH,'publicationBase':BASE,'checker':{k:v for k,v in checker.items() if k!='packet'},'graph':summary,'preservedMathematicalContracts':388,'preservedWholeNodes':388-len(changed),'changedExistingNodes':changed,'newNodes':3,'newApiItems':3,'newTests':3,'rawApiItems':sum(len(n.get('api',[])) for n in p['nodes']),'rawTests':sum(len(n.get('tests',[])) for n in p['nodes']),'nativeDeclarationsNewlyProved':31,'existingNativeCoordinateContracts':28,'nativeExamples':len(re.findall(r'^example\b',native,re.M)),'nativeAxiomAudits':len(audits),'canonicalExamples':len(re.findall(r'^example\b',canonical,re.M)),'canonicalLines':len(canonical.splitlines()),'canonicalSha256':hashlib.sha256(canonical.encode()).hexdigest(),'canonicalExecution':'UNCOMPILED: no existing full Tau build at the exact pin; Mathlib-only native and admitted-signature extractions checked separately.','compilation':resources,'intakeProblems':problems,'intakeRefusals':refusals,'guardsUnchanged':len(GUARDS)+len(FILES),'immutableReadPaths':len(gv.READS),'immutableReadPathListSha256':hashlib.sha256(json.dumps(sorted(gv.READS)).encode()).hexdigest()},indent=2),flush=True)
```

### immutable_view.py

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
BASE = os.environ.get('ROOTS_VALIDATE_BASE', '8c30afe02077e5b8923d4d71b823b6c574606a15')
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

### compile.py

```python
"""One synchronous exact-pin existing-build compiler; no setup, cache or LSP."""
from pathlib import Path
import json,os,subprocess,sys,time,hashlib,re
S=Path(sys.argv[1]).resolve();name=sys.argv[2]
B=Path(os.environ['TAUCETI_BUILD']).resolve()
pin=subprocess.check_output(['git','rev-parse','HEAD'],cwd=B/'.lake/packages/mathlib',text=True).strip()
assert pin=='082e2d37e8b0463410cdb532e111cd43d5a66174'
memory=subprocess.check_output(['free','-g'],text=True)
available=int(next(l for l in memory.splitlines() if l.startswith('Mem:')).split()[-1])
(S/(name+'.memory.txt')).write_text(memory)
print(memory,flush=True)
if available<20:
 print(json.dumps({'compiled':False,'availableGiB':available,'reason':'WORKERS memory guard'}));sys.exit(0)
start=time.monotonic()
with (S/(name+'.log')).open('w') as log:
 r=subprocess.run(['/usr/bin/time','-f','ELAPSED %e RSS %M EXIT %x','timeout','1200','lake','env','lean',str(S/name)],cwd=B,stdout=log,stderr=subprocess.STDOUT)
raw=(S/(name+'.log')).read_text();normalized=raw.replace(str(S),'OWNED_SCRATCH')
(S/(name+'.log')).write_text(normalized)
result={'file':name,'compiled':True,'exit':r.returncode,'seconds':round(time.monotonic()-start,2),'availableGiBBefore':available,'sourceSha256':hashlib.sha256((S/name).read_bytes()).hexdigest(),'lines':len((S/name).read_text().splitlines()),'errors':len(re.findall(r': error(?:\(|:)' ,raw)),'warnings':len(re.findall(r'warning:',raw)),'admissionWarnings':len(re.findall(r'warning: declaration uses .sorry.',raw)),'logSha256':hashlib.sha256(normalized.encode()).hexdigest(),'time':re.findall(r'ELAPSED .*',raw)}
(S/(name+'.receipt.json')).write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2),flush=True)
print('\n'.join(l for l in normalized.splitlines() if ': error' in l or 'warning:' in l and 'declaration uses' not in l),flush=True)
```
