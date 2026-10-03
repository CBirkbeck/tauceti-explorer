# Degree-one generation and polynomial presentations

Refs #551. Worker **Codex — codex-7e92bd**, 3 October 2026. Partial checkpoint; all implementation statuses remain unchecked. Claim5970691881 was confirmed by bot5970693319. The incoming checkpoint is PR6006 atbe9e54835450786e060b027cc0b43bf2fe2304e0 (archive22305ad448cc8b82cca09718c1906926fde667ca). Its public recovery authenticated39 artifacts,5 helpers and4 deliverables. All316 incoming node objects and the entire incoming suggested-file prefix are preserved.

## Result and boundary

Prove the existing `adicGradedRing_generated_degree_one` statement for the actual Rees quotient, without changing its contract. Add the actual A-linear degree-one map q→Gr_q(A), its evaluation/addition/scalar rules, exact q² kernel and coefficient-change compatibility. Any chosen ideal-generating family gives a surjective native polynomial algebra map over A/q. A finite family, or q.FG, gives native `Algebra.FiniteType`; algebra maps out of the quotient are determined on degree-one classes. All underlying carriers, quotient ideals, scalar actions and evaluation maps are concrete.

The15 new nodes comprise2 constructions and13 lemmas, with10 API items and9 tests. Tests retain zero and unit ideals, an empty generating family, the distinction between2 and4 in q=(2)⊆ℤ, and a surviving nonzero square-zero degree-one class for q=(2)⊆ℤ/4. The polynomial test computes X↦μ(2)≠0 and X²↦0; it does not separately prove X²≠0 in the source polynomial ring. Finite type of the ring is not a substitute for finite generation of its graded modules.

The old ordinary degree-one generation theorem now has an admission-free native proof using the pinned Rees generation theorem and actual quotient. The new degree-one linear map detects q² exactly and respects coefficient change. Every chosen ideal-generating family gives a surjective native polynomial algebra map; a finite family, or q.FG, implies finite type over A/q. Algebra maps from the quotient are determined on these degree-one classes. Still prove the actual graded-module decomposition/action and finite generation, then native homogeneous kernel/quotient gradings and the general Hilbert–Serre induction. Finite type of this ring does not establish finite generation of the graded module, its eventual polynomial, support-degree, intrinsic/ambient multiplicity, tangent-cone kernel, completion or any remaining routed-paper target.

The packet has331 nodes,403 indexed baseline declarations,261 raw API rows and301 raw test rows. The actual checker counts261 API items and228 tests, with13 existing planets. All316 incoming nodes,15 gaps,2 requests, source versions, source issues and all reserved/owner contracts are unchanged. Only the R03.3 remaining-work row receives the exact additional frontier; the other seven coverage rows are unchanged. The sibling R03.6 packet remains in actual atlas assembly. The reader prepends the new complete plan to the exact incoming reader.

## Sources and inspection

Fresh reading covered the complete [Stacks10.59 section and proofs](https://stacks.math.columbia.edu/tag/00K4), the ordinary Rees definition and early [10.70 statements/proofs through10.70.11](https://stacks.math.columbia.edu/tag/052P), and the complete [10.58.7 statement and induction proof](https://stacks.math.columbia.edu/tag/00K1). The last identifies the finite degree-one-generator input; this checkpoint does not discharge its graded-module or general Hilbert–Serre argument. The precise native maps and proofs here are authored deductions from the pinned generic Rees, ideal-span and polynomial APIs. No source HTML, PDF or extracted book text is committed, and no new whole-paper/version audit is claimed.

The reading receipt distinguishes fresh inspection from retained earlier evidence. It records the whole issue/campaign reader, the R03.3 audit and review, all current gaps/requests, own RS-08 records, the full reserved multiplicity contract and31 touching link entries. Earlier full supplier-reader and audit readings are retained with unchanged-file hashes. It does not claim a fresh full read of every inherited contract, all routed papers or the entire word-filtration implementation. The native declarations and ambient assumptions for every newly added baseline reference were read at the exact pin. Open Mathlib PR9819 and PR33220 were checked for current metadata; no code was adopted.

## Checks and precise compile scope

- `Native.lean`:1215 lines,30 examples,93 clean axiom audits. Exit0 with no admissions or warnings and only propext/Classical.choice/Quot.sound dependencies. SHA25676e8ca54670ef2150fb26d4eb19adfb8c392ce0c95cb2a053f55707e108a08ba. Memory guard36GiB; peak RSS3533080KiB.
- **The full canonical suggested file compiled.** `Canonical.lean`:4902 lines,291 examples, exit0 with exactly693 admission warnings and no other warnings. SHA256da47c9e9b469e53bde8e86c83a541fa89d40acb75ffafd2c387079e9d1d29521. Memory guard36GiB; peak RSS3798260KiB. All24 new declaration/example signatures and the one existing generation signature match the proved experiment. Concrete new definition bodies are preserved in the projection.
- Both artifacts import only Mathlib and used an existing tracked-clean package at082e2d37e8b0463410cdb532e111cd43d5a66174 with Lean4.34.0-rc2. The full Tau checkout atf790474821cf4256814db967cb154e7af3d0c369 was not needed for these imports. One compiler ran at a time, each bounded by1200 seconds; no project/library/cache build or Lean server was started. No compiler remains running.
- Real indexed `check_blueprint.py`, source-issue/version checks and actual extracted intake checks pass without errors, warnings or refusals. Declaration index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1.
- Actual immutable atlas assembly passes at mathematical base20ee6c0227a623ea43ae92a967b2141edc7b49cc and publication base1ed08e746433b8466fb1bcad4d5920dde7ff2f4f. Stage graph3003 vertices/8623 edges; owned graph331/561; scoped graph3322/9516, all acyclic. All65 accepted restructuring paths are reachable. Of13 other required stage pairs,12 are reachable: the inherited LocalFieldsRamification layer0→R03.4 missing path remains precisely unchanged and explicitly recorded in the existing gap. No owned skipped/pending links, no unresolved declarations, and no changes to foreign roadmap/stage objects or skip reports. The whole roadmap retains384 declarations including sibling R03.6.
- All27 guarded complete input files are unchanged between bases. The own queue contract is unchanged apart from permitted state/note fields. Six unrelated atlas inputs changed; publication checks were rerun against their actual new bytes. The evidence preserves both full graph receipts and input hashes.

## Reproduce the evidence

Copy `recover.py` below into a file and run it with a fresh evidence directory and the final PR head SHA. It downloads immutable public blobs, authenticates39 archived artifacts including6 archived helpers, and retrieves all4 final deliverables. It verifies the executed recovery helper against the public handoff. Recovery and verification never run Lean or create a checkout.

```sh
python3 recover.py evidence FINAL_PR_HEAD_SHA
python3 evidence/verify.py evidence PINNED_DECLARATIONS_TSV
```

Run verification from an existing checkout containing the recorded immutable commits. It checks exact incoming objects, statements, concrete definition projections, compilation log hashes, source metadata, actual indexed checker/intake and actual atlas assembly using a read-only Git-backed view. Optional Lean replay uses an already existing build with the exact Mathlib pin; run these serially:

```sh
python3 evidence/run-lean.py Native.lean EXISTING_BUILD native-replay
python3 evidence/run-lean.py Canonical.lean EXISTING_BUILD canonical-replay
```

The helper rechecks the exact tracked-clean package and available memory immediately before each bounded compile. Archive ancestor: [`f0084b0de287b20621c66261f6ce45a871ce6ffd`](https://github.com/CBirkbeck/tauceti-explorer/blob/f0084b0de287b20621c66261f6ce45a871ce6ffd/research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean). Manifest SHA256:`832f59874e4ac6927cc0e85deb039bc530fe96cfc3edc51c203adfa07a6dea2c`. Only the four authorized deliverables differ at the final head. The archive includes complete incoming files, native proof, matching canonical projection, tests, logs, fresh and retained reading records, immutable check receipts and all six helper sources.

## Resume

Use the new surjective polynomial presentation to finish the actual homogeneous graded-module carrier/action and its finite generation under explicit hypotheses. Prove native homogeneous kernel/quotient grading adapters before applying the graded-module Hilbert–Serre induction; consult the existing general upstream work instead of duplicating it. Retain the q² kernel and nilpotent tests, both intrinsic and ambient multiplicity normalizations, the full general finite-module quantifiers and all paper routes. The degree/support, tangent-cone kernel, completion, derived patching and other seven stage obligations remain recorded in the incoming packet and reader. Do not replace those targets by a ring-only result.

## Script: recover.py

```python
"""Recover public, hash-authenticated adic degree-one and generator-presentation evidence; never runs Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='DeformationAndDerivedPatchingAlgebra--P7'
ARCHIVE='f0084b0de287b20621c66261f6ce45a871ce6ffd'
MANIFEST_SHA='832f59874e4ac6927cc0e85deb039bc530fe96cfc3edc51c203adfa07a6dea2c'
EXPECTED={'packets': '69b957e1f67efc655390bfb1cb5ba3a7ca3f90a2ee224f8f921220725faf734b', 'readmes': 'c57028cd18d913943e443a04ec92cbb3bb555aff27b0c9b8c74f476087a9cc37', 'suggested': 'da47c9e9b469e53bde8e86c83a541fa89d40acb75ffafd2c387079e9d1d29521'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=60)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
payload=json.loads(raw.split('/- BEGIN ARCHIVED ADIC GENERATORS PAYLOAD\n',1)[1].split('\nEND ARCHIVED ADIC GENERATORS PAYLOAD -/',1)[0])
def unpack(name):
 b=zlib.decompress(base64.b64decode(payload[name]['data']));assert sha(b)==payload[name]['sha256'],name
 return b
mb=unpack('artifact-manifest.json');assert sha(mb)==MANIFEST_SHA;meta=json.loads(mb)
assert set(payload)==set(meta)|{'artifact-manifest.json'}
for name,m in meta.items():
 assert Path(name).name==name
 b=unpack(name);assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],name
 (S/name).write_bytes(b)
(S/'artifact-manifest.json').write_bytes(mb)
public={}
for folder,ext,name in [('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','Handoff.md')]:
 path='research/blueprint/'+folder+'/'+('BP-'if folder=='handoff'else'')+RID+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder],path
 (S/name).write_bytes(b);public[path]=sha(b)
(S/(RID+'.json')).write_bytes((S/'Candidate.json').read_bytes())
assert (S/'Suggested.lean').read_bytes()==(S/'Canonical.lean').read_bytes()
fence=chr(96)*3;handoff=(S/'Handoff.md').read_text()
code=handoff.split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from current public handoff.'
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=6,publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```

## Script: verify.py

```python
"""Check exact contracts, typed statements, recorded proofs, and the real immutable checker/intake/atlas."""
from pathlib import Path
import ast,hashlib,json,os,re,subprocess,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd().resolve();sys.path.insert(0,str(S));RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7';NS='TauCeti.HilbertSamuel.'
sha=lambda b:hashlib.sha256(b).hexdigest()
def txt(n):return (S/n).read_text()
def data(n):return json.loads(txt(n))
MATH=txt('base.txt').strip();BASE=os.environ.get('ROOT_ACTION_VALIDATE_BASE',txt('publication-base.txt').strip())
def blob(ref,path):return subprocess.check_output(['git','show',ref+':'+path],cwd=R)
paths=['research/blueprint/'+f+'/'+('BP-'if f=='handoff'else'')+STEM+'.'+e for f,e in [('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
names=['Candidate.json','Reader.md','Suggested.lean','Handoff.md'];contents={p:txt(n)for p,n in zip(paths,names)}
for p,n in zip(paths,['Incoming-packets.json','Incoming-readmes.md','Incoming-suggested.lean','Incoming-handoff.md']):assert blob(MATH,p)==(S/n).read_bytes(),p
p=data('Candidate.json');old=data('Incoming-packets.json');plan=data('Plan.json')
assert len(old['nodes'])==316 and len(p['nodes'])==331 and p['nodes'][:316]==old['nodes']
assert set(p)==set(old)
for k in old:
 if k not in ['nodes','summary','sources','baseline','coverage']:assert p[k]==old[k],k
assert p['sources'][:-1]==old['sources'] and p['summary'].startswith(old['summary'])
assert p['baseline']['declarations'][:395]==old['baseline']['declarations'] and len(p['baseline']['declarations'])==403
assert {k:v for k,v in p['baseline'].items()if k!='declarations'}=={k:v for k,v in old['baseline'].items()if k!='declarations'}
for a,b in zip(old['coverage'],p['coverage']):
 if a['stageId']==RID+':R03.3':
  assert b['remaining']==a['remaining']+[plan['frontier']]
  assert {k:v for k,v in a.items()if k!='remaining'}=={k:v for k,v in b.items()if k!='remaining'}
 else:assert a==b
assert p['status']=='partial'and all(n['implementationStatus']=='unchecked'for n in p['nodes'])
assert len(p['requests'])==2 and len(p['gaps'])==15 and len(p['coverage'])==8
assert txt('Reader.md')==txt('ReaderAddition.md')+txt('Incoming-readmes.md')
from projection import project
assert txt('NewAdmitted.lean')==project(txt('NewOnly.lean'),txt('NewTests.lean'))
assert txt('Canonical.lean')==txt('Incoming-suggested.lean')+txt('NewAdmitted.lean')==txt('Suggested.lean')
assert sha((S/'Previous-Native.lean').read_bytes())=='fad1a5c1485c78774e96837c666b238068f463fcb8fb570412b063910274d258'
assert txt('Native.lean')==''.join(txt(n)for n in ['Previous-Native.lean','NewProofs.lean','NewTests.lean','NewAudits.lean'])
assert not re.search(r'\b(?:sorry|admit|axiom)\b',txt('Native.lean'))
def headers(text):
 found={}
 for match in re.finditer(r'^(def|lemma|theorem|example)\b(?: ([\w.]+))?',text,re.M):
  depth=0;end=None
  for i in range(match.start(),len(text)):
   c=text[i]
   if c in '([{⟨':depth+=1
   elif c in ')]}⟩':depth-=1
   if depth==0 and text.startswith(':=',i)and not re.match(r'\s*let\b',text[match.start():i].rsplit('\n',1)[-1]):end=i;break
  assert end is not None
  label=match.group(2)if match.group(1)!='example'else'example#'+str(sum(x.startswith('example#')for x in found))
  assert label not in found;found[label]=' '.join(text[match.start():end].split())
 return found
nh=headers(txt('NewOnly.lean'));nt=headers(txt('NewTests.lean'));ch=headers(txt('NewAdmitted.lean'));assert {**nh,**nt}==ch
assert len(nh)==15 and len(nt)==9
eh=headers(txt('ExistingProof.lean'));assert len(eh)==1
assert all(headers(re.search(r'^lemma '+re.escape(k)+r'\b[\s\S]*?(?=^end |^def |^theorem |^lemma |^example |\Z)',txt('Incoming-suggested.lean'),re.M)[0])[k]==v for k,v in eh.items())
assert headers(txt('NewProofs.lean'))=={**eh,**nh}
assert set(plan['newNames'])=={NS+n for n in nh}=={n['declaration']for n in p['nodes'][316:]}
assert p['nodes'][316:]==data('new-nodes.json')
assert {t['name']for t in data('new-tests.json')}=={n for n in re.findall(r'^-- test: (.+)$',txt('NewTests.lean'),re.M)}
for n in p['nodes'][316:]:
 assert n['declaration']in txt('Reader.md')and n['statement']in txt('Reader.md')
 for x in n.get('api',[])+n.get('tests',[]):assert x['name']in txt('Reader.md')and x['statement']in txt('Reader.md')
assert sum(len(n.get('api',[]))for n in p['nodes'][316:])==10 and sum(len(n.get('tests',[]))for n in p['nodes'][316:])==9
compilation={}
for name,stem,want,ex,audits in [('Native.lean','native-final',0,30,93),('Canonical.lean','canonical-final',693,291,0)]:
 rec=data(stem+'.receipt.json');log=txt(stem+'.diag')
 assert rec['exit']==0 and rec['availableGiB']>=20 and rec['timeoutSeconds']==1200
 assert rec['sha256']==sha((S/name).read_bytes())and rec['diagnosticsSha256']==sha(log.encode())
 assert ': error'not in log and log.count('warning:')==log.count('warning: declaration uses `sorry`')==want,(name,log.count('warning:'))
 examples=len(re.findall(r'^example\b',txt(name),re.M))
 if ex is not None:assert examples==ex
 a=re.findall(r'depends on axioms:\s*\[([^]]*)\]',log);assert len(a)==audits
 assert 'sorryAx'not in log and all(set(v.strip()for v in x.replace('\n',' ').split(','))<={'propext','Classical.choice','Quot.sound'}for x in a)
 compilation[name]={**rec,'lines':len(txt(name).splitlines()),'examples':examples,'axiomAudits':len(a),'warnings':want,'peakRSSKiB':int(re.search(r'Maximum resident set size \(kbytes\): (\d+)',log)[1])}
assert set(plan['newNames'])<={n for n in re.findall(r"'([^']+)' depends on axioms:",txt('native-final.diag'))}
for g in data('InputGuard.json'):assert sha(blob(MATH,g['path']))==g['sha256']==sha(blob(BASE,g['path'])),g['path']
for qbase in [MATH,BASE]:
 jq=json.loads(blob(qbase,'research/blueprint/queue.json'))
 own=next(j for j in jq['jobs']if j['id']=='BP-'+STEM)
 contract={k:v for k,v in own.items()if k not in ['state','note']}
 if qbase==MATH:own_original=contract
 else:assert contract==own_original
if (S/'artifact-manifest.json').exists():
 for n,m in data('artifact-manifest.json').items():
  b=(S/n).read_bytes();assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],n
for path,text in contents.items():
 assert not re.search(r'/(?:home|tmp|Users)/|file'+'://',text),path
 assert not re.search(r'[ \t]+$',text,re.M),path
os.environ['ROOT_ACTION_VALIDATE_BASE']=BASE
import immutable_view;assert immutable_view.BASE==BASE
for path,t in contents.items():immutable_view.CACHE[path]=t.encode()
immutable_view.install();sys.path.insert(0,str(R/'scripts'))
import check_blueprint,source_issues,check_errata
index=check_blueprint.load_index(Path(sys.argv[2]));assert index[0]is not None
errors,warnings,summary=check_blueprint.check(S/(STEM+'.json'),index,check_blueprint.world());assert not errors and not warnings,(errors,warnings)
summary['packet']=paths[0]
issues=source_issues.check_issues(p['sourceIssues'],RID)+check_errata.versions_checked(p,p['sourceIssues']);assert not issues,issues
tree=ast.parse((R/'research/blueprint/intake.py').read_text());wanted={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id in {'ALLOWED','PRIVATE'}for t in n.targets)or isinstance(n,ast.FunctionDef)and n.name in wanted]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs']if j['id']=='BP-'+STEM)
problems=[x for f in paths for x in env['file_problems'](f,contents[f])];refusals=env['auto_refusals'](job,paths,False,{'codex-7e92bd'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'ROOT_ACTION_VALIDATE_BASE':BASE}))
assert graph['worldCommit']==BASE
print(json.dumps(dict(checker=summary,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,wholeIncomingNodesUnchanged=316,newNodes=15,newAPIItems=10,newTests=9,matchedNewHeaders=len(ch),matchedExistingHeaders=len(eh),rawAPIItems=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),compilation=compilation,canonicalExecution='PASS: entire Mathlib-only canonical file compiled at exact pin, with admissions as its only warnings.',inputGuards=len(data('InputGuard.json')),indexSha256=sha(Path(sys.argv[2]).read_bytes()),immutableBase=BASE,graph=graph,LeanExecuted=False),indent=2))
```

## Script: graph.py

```python
from pathlib import Path
import sys,json,copy,collections,hashlib
S=Path(sys.argv[1]).resolve()
sys.path.insert(0,str(S))
import immutable_view
immutable_view.install()
sys.path.insert(0,str(Path.cwd()/'scripts'))
import build,blueprints,check_blueprint
RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7'
p=json.loads((S/f'{STEM}.json').read_text())
original=json.loads((S/'Incoming-packets.json').read_text())
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
report['readPathHashes']={path:hashlib.sha256(immutable_view.blob(path)).hexdigest() for path in sorted(immutable_view.READS)}
report['foreignRoadmapsAndStagesUnchanged']=True
print(json.dumps(report,ensure_ascii=False,indent=2),flush=True)
```

## Script: immutable_view.py

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
BASE = os.environ.get('ROOT_ACTION_VALIDATE_BASE', (Path(__file__).resolve().parent / 'publication-base.txt').read_text().strip())
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
    return blob(key).decode('utf-8' if encoding in (None,'locale') else encoding, errors or 'strict')

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
    return io.BytesIO(blob(key)) if mode == 'rb' else io.StringIO(blob(key).decode('utf-8' if encoding in (None,'locale') else encoding, errors or 'strict'))

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

## Script: projection.py

```python
"""Keep concrete carriers, maps and components; admit mathematical proofs only."""
import re

def admit_lemmas(text):
    lines=text.splitlines(keepends=True);out=[];i=0
    while i<len(lines):
        if re.match(r'^(?:lemma|theorem) |^example\b',lines[i]):
            j=i+1
            while j<len(lines) and (not lines[j].strip() or lines[j][0].isspace()):j+=1
            block=''.join(lines[i:j]);depth=0;pos=None
            for k,c in enumerate(block):
                if c in '([{':depth+=1
                elif c in ')]}':depth-=1
                if block[k:k+2]==':=' and depth==0 and not re.match(r'\s*let\b',block[:k].rsplit('\n',1)[-1]):pos=k;break
            assert pos is not None
            out.append(block[:pos]+':= by\n  sorry\n\n');i=j
        else:out.append(lines[i]);i+=1
    return ''.join(out)

def project(proofs,tests):
    return admit_lemmas(proofs)+'\n'+admit_lemmas(tests)
```

## Script: run-lean.py

```python
"""Optional serial replay in an existing exact Mathlib build; never creates or builds a project."""
from pathlib import Path
import hashlib,json,subprocess,sys,datetime
S=Path(__file__).resolve().parent;file=S/sys.argv[1];B=Path(sys.argv[2]).resolve();stem=sys.argv[3]
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=B/'.lake/packages/mathlib',text=True).strip()=='082e2d37e8b0463410cdb532e111cd43d5a66174'
assert not subprocess.check_output(['git','status','--porcelain','--untracked-files=no'],cwd=B/'.lake/packages/mathlib',text=True).strip()
free=subprocess.check_output(['free','-g'],text=True);available=int(free.splitlines()[1].split()[-1]);receipt=dict(file=file.name,sha256=hashlib.sha256(file.read_bytes()).hexdigest(),availableGiB=available,time=datetime.datetime.now(datetime.timezone.utc).isoformat(),timeoutSeconds=1200)
if available<20:print(json.dumps({**receipt,'started':False}));sys.exit(75)
with (S/(stem+'.raw')).open('w') as log:
 log.write(free);log.flush();r=subprocess.run(['/usr/bin/time','-v','timeout','1200','lake','env','lean',str(file)],cwd=B,stdout=log,stderr=subprocess.STDOUT)
t=(S/(stem+'.raw')).read_text().replace(str(S)+'/', 'REPLAY/');(S/(stem+'.diag')).write_text(t);(S/(stem+'.raw')).unlink()
receipt.update(started=True,exit=r.returncode,diagnosticsSha256=hashlib.sha256(t.encode()).hexdigest());(S/(stem+'.receipt.json')).write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt));sys.exit(r.returncode)
```

## Script: author.py

```python
"""Append concrete degree-one and polynomial-presentation plans to the preserved packet."""
from pathlib import Path
import json,copy,hashlib
S=Path(__file__).resolve().parent;RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7';P=RID+':R03.3/';NS='TauCeti.HilbertSamuel.'
def load(n):return json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
p=load('Incoming-packets.json');old=copy.deepcopy(p)
specs=[
('adic-degree-one-map','adicDegreeOne','construction','Degree-one class map','Construct the actual A-linear map μ:q→Gr_q(A) sending x to the quotient class of xT in the existing Rees quotient.',['adic-monomial-map'],'Compose the existing degree-one monomial map with the canonical linear identification q→q¹. The target and quotient ideal are unchanged.'),
('adic-degree-one-value','adicDegreeOne_apply','lemma','Degree-one class evaluation','For x∈q, μ(x) is the existing adicMonomial(q,1)(x), with membership transported by q¹=q.',['adic-degree-one-map'],'Evaluate the composition of the actual linear maps.'),
('adic-degree-one-add','adicDegreeOne_add','lemma','Additivity of degree-one classes','For x,y∈q, μ(x+y)=μ(x)+μ(y).',['adic-degree-one-map'],'Use the native linear-map additivity law.'),
('adic-degree-one-scalar','adicDegreeOne_smul','lemma','Scalar compatibility of degree-one classes','For a∈A and x∈q, μ(a·x)=a·μ(x), using the actual A-module structure on the Rees quotient.',['adic-degree-one-map'],'Use the native linear-map scalar law. The A-action already factors through A/q.'),
('adic-degree-one-zero-criterion','adicDegreeOne_eq_zero_iff','lemma','Degree-one kernel criterion','For every x∈q, μ(x)=0 if and only if x∈q².',['adic-degree-one-value','adic-monomial-kernel'],'Apply the already proved monomial zero criterion at degree1. Nilpotence of x alone does not make its degree-one class zero.'),
('adic-chosen-degree-one-generation','adicDegreeOne_adjoin_generators','lemma','Generation by chosen ideal generators','For any family a:ι→q with ideal span of its underlying values equal to q, the classes μ(a_i) generate Gr_q(A) as an A/q-algebra. No finiteness premise on ι is required.',['adic-degree-one-generation','adic-degree-one-add','adic-degree-one-scalar','mathlib:Submodule.span_induction'],'The native degree-one generation theorem reduces to arbitrary x∈q. Induct on membership in the ideal span of the chosen generators. Generator, zero, addition and A-scalar cases give membership in the target adjoin; restrict its scalars from A/q to A in the scalar case.'),
('adic-generator-polynomial-map','adicGeneratorMap','construction','Polynomial presentation from ideal generators','For any family a:ι→q, construct ε_a:(A/q)[X_i | i∈ι]→ₐ[A/q]Gr_q(A) with X_i↦μ(a_i), using native multivariate polynomial evaluation. The definition does not assume the family generates q.',['adic-degree-one-map','mathlib:MvPolynomial.aeval'],'Apply the pinned native aeval constructor to the actual family of quotient monomials. Surjectivity is proved separately under the explicit ideal-generation premise.'),
('adic-generator-polynomial-variable','adicGeneratorMap_X','lemma','Variable evaluation in the graded presentation','For every i∈ι, ε_a(X_i)=μ(a_i).',['adic-generator-polynomial-map','mathlib:MvPolynomial.aeval_X'],'Use the native evaluation formula on a polynomial variable.'),
('adic-generator-polynomial-coefficient','adicGeneratorMap_C','lemma','Coefficient evaluation in the graded presentation','For c∈A/q, ε_a(C(c)) is the actual coefficient algebraMap(c) in Gr_q(A).',['adic-generator-polynomial-map','mathlib:MvPolynomial.aeval_C'],'Use the native evaluation formula on a coefficient.'),
('adic-generator-polynomial-surjective','adicGeneratorMap_surjective','lemma','Surjective graded polynomial presentation','If the underlying family a:ι→q generates q as an ideal, the actual polynomial evaluation ε_a is surjective.',['adic-chosen-degree-one-generation','adic-generator-polynomial-map','mathlib:Algebra.adjoin_range_eq_range_aeval'],'The pinned range-of-aeval theorem identifies its algebra range with the adjoin of the generator images. The chosen degree-one generation theorem makes that adjoin top.'),
('adic-generator-polynomial-unique','adicGeneratorMap_unique','lemma','Uniqueness of the polynomial presentation map','Any A/q-algebra homomorphism from the same native polynomial algebra to Gr_q(A) sending every X_i to μ(a_i) equals ε_a.',['adic-generator-polynomial-variable','mathlib:MvPolynomial.algHom_ext'],'Apply native multivariate-polynomial algebra-hom extensionality on every variable. Coefficient agreement follows from the algebra-hom structure.'),
('adic-finite-type-chosen-generators','adicGradedRing_finiteType_of_generators','lemma','Finite type from a finite generating family','If ι is finite and the underlying values of a:ι→q generate q, then Gr_q(A) is of finite type as an A/q-algebra. No Noetherian hypothesis on A is needed.',['adic-generator-polynomial-surjective','mathlib:Algebra.FiniteType.of_surjective'],'The native polynomial algebra on a finite index type is of finite type. Descend that actual property through the proved surjective algebra homomorphism.'),
('adic-finite-type-fg-ideal','adicGradedRing_finiteType_of_fg','lemma','Finite type for a finitely generated ideal','For every finitely generated ideal q of any commutative ring A, Gr_q(A) is of finite type over A/q.',['adic-finite-type-chosen-generators'],'Choose a native finite set witnessing q.FG. Regard its elements as an indexed family in q and identify its range with that finite set. Apply the finite-family theorem; no dimension or regularity conclusion follows.'),
('adic-degree-one-hom-ext','adicGradedRing_hom_ext','lemma','Algebra maps determined in degree one','For every A/q-algebra B whose carrier is a semiring, two A/q-algebra maps Gr_q(A)→B agreeing on μ(x) for all x∈q are equal. B may have a different universe.',['adic-degree-one-generation','adic-degree-one-value','mathlib:AlgHom.ext_of_adjoin_eq_top'],'Use the pinned algebra-hom extensionality theorem with the proved degree-one generating set. This concerns maps from the actual graded quotient.'),
('adic-degree-one-coefficient-change','adicDegreeOne_coefficient_change','lemma','Degree-one classes under coefficient change','For f:A→B, ideals I⊆A,J⊆B and I≤f⁻¹(J), the existing coefficient-change map sends μ_I(x) to μ_J(f(x)) for every x∈I.',['adic-degree-one-value','adic-graded-map-monomial'],'Specialize the inherited actual monomial coefficient-change theorem to degree1. Retain precisely the ideal-containment hypothesis; no injectivity or flatness is inferred.')]
# Resolve the one inherited identifier by its actual declaration, rather than guessing its slug.
bydecl={n.get('declaration',n.get('declarationName','')):n['id']for n in p['nodes']}
for i,row in enumerate(specs):
 if row[1]=='adicDegreeOne_eq_zero_iff':row[5][-1]=bydecl[NS+'adicMonomial_eq_zero_iff']
 if row[1]=='adicDegreeOne_coefficient_change':row[5][-1]=bydecl[NS+'adicGradedMap_monomial']
def dep(d):return d if d.startswith(('mathlib:',RID+':')) else P+d
hyp=['A is an arbitrary commutative ring and q is an arbitrary ideal; use the existing Gr_q(A)=Rees(q)/(q·Rees(q)) with its actual A/q-algebra and A-module structures. Zero rings, zero/unit ideals and nilpotents are retained. No local, Noetherian, proper-ideal or reducedness assumption is imposed.', 'A family a:ι→q may have an arbitrary index type and independent universe. Surjectivity and chosen-family generation explicitly assume Ideal.span(range(val∘a))=q. Finite type from the chosen family additionally assumes Finite ι; the separate finite-type theorem assumes q.FG. No finite-presentation, injectivity, freeness or polynomial-ring isomorphism is asserted.']
sourceid='ADIC-GENERATORS-7e92bd'
sources=[dict(sourceId=sourceid,locator='Authored native deductions for degree-one generation and polynomial presentations; Stacks10.59.5 full proof,10.70.1(1), and10.58.7 generator-induction premise',excerpt='graded ring',match='The displayed ordinary associated graded and the finite degree-one-generator premise motivate the adapters. These precise native quotient/polynomial maps and proofs are authored deductions from pinned generic Rees and polynomial results; the general Hilbert–Serre theorem remains open.')]
nodes=[]
for slug,name,kind,title,statement,deps,proof in specs:
 nodes.append(dict(id=P+slug,parentStageId=RID+':R03.3',realises=[RID+':R03.3'],kind=kind,title=title,declaration=NS+name,statement=statement,hypotheses=hyp,prerequisites=[dep(d)for d in deps],proofSteps=[proof],acceptance=[statement,'Keep the zero/unit-ideal and nonreduced boundaries. Generation as an algebra is distinct from finite generation as a module and from a free polynomial presentation.'],library=dict(module='TauCeti/RingTheory/HilbertSamuel',namespace='TauCeti.HilbertSamuel'),sources=sources,implementationStatus='unchecked'))
nd={n['declaration'].removeprefix(NS):n for n in nodes}
apis={'adicDegreeOne':['adicDegreeOne_apply','adicDegreeOne_add','adicDegreeOne_smul','adicDegreeOne_eq_zero_iff','adicDegreeOne_coefficient_change','adicGradedRing_hom_ext'],'adicGeneratorMap':['adicGeneratorMap_X','adicGeneratorMap_C','adicGeneratorMap_surjective','adicGeneratorMap_unique']}
for name,ls in apis.items():
 nd[name]['api']=[dict(name=NS+n,role='compatibility'if n.endswith(('coefficient_change','smul','C'))else'characterisation',statement=nd[n]['statement'])for n in ls]
 nd[name]['uses']=[dict(where=P+'eventual-hilbert-samuel-polynomial',how='Provides the actual finite degree-one algebra-generating family and polynomial surjection needed before the separate graded-module finiteness and Hilbert–Serre induction; does not assume the polynomial tail to be proved.'),dict(where=P+'curve-tangent-cone-equivalence',how='The native evaluation and degree-one extensionality specify generator images for compatible tangent-cone comparisons without asserting their kernel or freeness.')]
testspec=[('adicDegreeOne','AdicDegreeOne.zero_ideal','degenerate','For q=0, every actual ideal element has degree-one class zero.'),('adicDegreeOne','AdicDegreeOne.integer_next_power','computation','For q=(2) in ℤ, μ(2)≠0 while μ(4)=0, distinguishing q from q².'),('adicDegreeOne','AdicDegreeOne.wild_nilpotent','counterexample','For q=(2) in ℤ/4, μ(2)≠0 and μ(2)²=0. A nilpotent coefficient can survive in degree one.'),('adicDegreeOne','AdicDegreeOne.coefficient_change','compatibility','Under any ring map f, the actual image-ideal coefficient change sends μ_I(x) to μ_(I.map f)(f(x)).'),('adicGeneratorMap','AdicGeneratorMap.single_generator','computation','The native one-variable presentation for q=(2) in ℤ is surjective over ℤ/(2).'),('adicGeneratorMap','AdicGeneratorMap.empty_zero_ideal','degenerate','The empty generating family for q=0 gives a surjective constant polynomial presentation.'),('adicGeneratorMap','AdicGeneratorMap.unit_ideal','degenerate','For q=A, every polynomial maps to zero in the actual quotient; the coefficient ring is the zero ring.'),('adicGeneratorMap','AdicGeneratorMap.nilpotent_relation','counterexample','For q=(2) in ℤ/4, the one-variable evaluation sends X to a nonzero element and X² to zero. A polynomial surjection need not give a free graded algebra.'),('adicGeneratorMap','AdicGeneratorMap.unique','characterisation','Every algebra map with the prescribed variable images equals the actual evaluation map.')]
tests=[dict(name=n,kind=k,statement=t)for _,n,k,t in testspec]
for name in apis:nd[name]['tests']=[dict(name=n,kind=k,statement=t)for owner,n,k,t in testspec if owner==name]
p['nodes']+=nodes
refs=[('MvPolynomial.aeval','def','Mathlib/Algebra/MvPolynomial/Eval.lean','Native algebra evaluation from arbitrary-variable polynomial rings.'),('MvPolynomial.aeval_X','theorem','Mathlib/Algebra/MvPolynomial/Eval.lean','Variable evaluation formula.'),('MvPolynomial.aeval_C','theorem','Mathlib/Algebra/MvPolynomial/Eval.lean','Coefficient evaluation formula.'),('Algebra.adjoin_range_eq_range_aeval','theorem','Mathlib/Algebra/MvPolynomial/Eval.lean','Identifies the actual evaluation range with the adjoin of generator images.'),('MvPolynomial.algHom_ext','theorem','Mathlib/Algebra/MvPolynomial/Basic.lean','Algebra maps from a polynomial ring are determined on variables.'),('AlgHom.ext_of_adjoin_eq_top','theorem','Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean','Maps from an algebra generated by a set agree when they agree on that set.'),('Algebra.FiniteType.of_surjective','theorem','Mathlib/RingTheory/FiniteType.lean','Finite-type algebra descends through a surjective algebra homomorphism.'),('Submodule.span_induction','theorem','Mathlib/LinearAlgebra/Span/Defs.lean','Dependent induction through generator,zero,addition and scalar cases of submodule span.')]
for name,kind,module,provides in refs:
 assert 'mathlib:'+name not in {x['ref']for x in p['baseline']['declarations']}
 p['baseline']['declarations'].append(dict(ref='mathlib:'+name,kind=kind,module=module,provides=provides,checked='Full statement and ambient typeclass/universe assumptions read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 on2026-10-03 by Codex — codex-7e92bd. Imported generic theorem, not replanned.'))
src=load('source-receipts.json');p['sources'].append(dict(id=sourceid,title='Ordinary degree-one generators and native polynomial presentations',authors='The Stacks Project authors; explicit adapter deductions by Codex — codex-7e92bd',edition='Online passages read3October2026',url=src[0]['url'],sha256=src[0]['sha256'],readSections=['Complete10.59 section and proofs.','10.70.1(1) and early context through10.70.11; separate052P receipt.','Complete10.58.7 statement and proof; separate00K1 receipt. Only its generator prerequisite is discharged here.'],derivation='The actual quotient generation, chosen-family evaluation and finite-type adapters are authored deductions. No generic associated-graded framework or Hilbert–Serre theorem is reconstructed.'))
frontier='The old ordinary degree-one generation theorem now has an admission-free native proof using the pinned Rees generation theorem and actual quotient. The new degree-one linear map detects q² exactly and respects coefficient change. Every chosen ideal-generating family gives a surjective native polynomial algebra map; a finite family, or q.FG, implies finite type over A/q. Algebra maps from the quotient are determined on these degree-one classes. Still prove the actual graded-module decomposition/action and finite generation, then native homogeneous kernel/quotient gradings and the general Hilbert–Serre induction. Finite type of this ring does not establish finite generation of the graded module, its eventual polynomial, support-degree, intrinsic/ambient multiplicity, tangent-cone kernel, completion or any remaining routed-paper target.'
p['summary']+=' Degree-one and generator-presentation continuation:15 declaration-sized nodes,10 API items and9 typed tests, plus a native proof of the existing degree-one generation contract.'
for row in p['coverage']:
 if row['stageId']==RID+':R03.3':row['remaining'].append(frontier)
save('Candidate.json',p);save(STEM+'.json',p);save('new-nodes.json',nodes);save('new-tests.json',tests);save('Plan.json',dict(newNodes=[n['id']for n in nodes],newNames=[n['declaration']for n in nodes],existingProved=NS+'adicGradedRing_generated_degree_one',newBaselineRefs=['mathlib:'+r[0]for r in refs],frontier=frontier))
intro='''# Degree-one generation and polynomial presentations of the adic graded ring

For any commutative ring A and ideal q, this continuation proves the existing contract that the actual Rees quotient Gr_q(A) is generated over A/q by its degree-one classes. Pull the target generated subalgebra back along the quotient homomorphism, restrict scalars to A and map it into the native polynomial ring. It contains every q-valued degree-one monomial, so the pinned Rees generation theorem makes it contain the entire Rees algebra. Quotient surjectivity then gives the claimed generation on the actual quotient.

The actual A-linear degree-one map μ:q→Gr_q(A) has μ(x)=0 exactly for x∈q². If a family a_i generates q as an ideal, span induction shows that its classes μ(a_i) already generate the quotient algebra. The scalar case uses the actual A/q-algebra restricted to A; it does not replace the quotient scalar structure. Native multivariate evaluation therefore gives a surjection from (A/q)[X_i] with its specified variables and coefficients. The map is uniquely determined by the variable images. A finite generating family gives finite type by the native surjective-algebra theorem, and an arbitrary native q.FG witness supplies such a family. No Noetherian hypothesis is needed for these statements.

These are polynomial presentations by surjection. They do not claim a free polynomial algebra or finite presentation. Over ℤ with q=(2), μ(2) survives but μ(4) vanishes. Over ℤ/4 with q=(2), μ(2) is nonzero and square-zero, so the one-variable evaluation kills X² while retaining X. The zero-ideal test uses an empty generator family; the unit-ideal test retains the zero coefficient ring. The coefficient-change test uses the actual image ideal.

The source passages are the full Stacks10.59 proof text, the ordinary Rees definition10.70.1(1), and the complete10.58.7 induction proof. The work here discharges only its ring-generation prerequisite; the graded-module and numerical-polynomial proof is still required. The generic Rees generation, polynomial evaluation, span induction and finite-type APIs already exist at the pin and are imported. All316 incoming node objects are preserved, and the complete incoming canonical file remains the suggested-file prefix.

'''+frontier+'\n\nThe checked existing declaration is **'+NS+'adicGradedRing_generated_degree_one**. Its exact old statement and packet contract are retained. Earlier reader sections below record their checkpoint boundaries.\n\n'
parts=[intro]
for n in nodes:
 parts+=['## '+n['title']+'\n\n','**'+n['declaration']+'** — '+n['statement']+'\n\n','Hypotheses: '+' '.join(n['hypotheses'])+'\n\n','Prerequisites: '+', '.join(n['prerequisites'])+'.\n\n','Proof: '+' '.join(n['proofSteps'])+'\n\n']
 for key in ['api','tests']:
  if n.get(key):parts+=[key.upper()+':\n\n']+['- **'+x['name']+'**: '+x['statement']+'\n'for x in n[key]]+['\n']
(S/'ReaderAddition.md').write_text(''.join(parts));(S/'Reader.md').write_text(''.join(parts)+(S/'Incoming-readmes.md').read_text())
print(json.dumps(dict(nodes=len(p['nodes']),newNodes=len(nodes),baseline=len(p['baseline']['declarations']),newAPI=10,newTests=9)))
```
