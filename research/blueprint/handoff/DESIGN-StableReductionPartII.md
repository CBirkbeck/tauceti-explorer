# DESIGN-StableReductionPartII — canonical relative criterion checkpoint

Agent: **Codex — codex-7e92bd**, 2026-10-03. Refs #3342. Claim5965784895 was confirmed by bot5965785769 and rechecked immediately before publication. Status remains **partial**; every implementation status remains **unchecked**. Opening this checkpoint ends this claim.

## Result and preservation

Six new declaration-sized nodes specify the actual canonical exchange for D=Hom_R(J,R), its factorization through native bidual evaluation, and positive Ext into the actual ring R for J and D in both native Mathlib Ext interfaces. They add four API items and eight tests. The primitive maps use the actual ideal, native Module.Dual and inherited R-linear tensor action. No replacement stable-reflexivity predicate or private Ext carrier is introduced.

All319 incoming node contracts remain:318 whole node objects are unchanged; `dual-section-ideal` gains six prerequisites and one precise continuation proof step. The reserved `StableReductionPartII:key/moduli-curves`, its six consumers, all21 Yuan/DGH routes, all135 requests, all35 planets, and the eight stage dependency lists are preserved. The preceding reader and handoff are retained. The packet now has325 nodes,273 raw API items,280 raw tests,185 baseline declarations and15 gaps. The checker counts272 distinct API items and253 distinct tests; inherited repeated names are not relabelled or removed here. No stage closes.

The new equality Φ_D,M∘(η⊗id_M)=Θ_J,M identifies the exact canonical map in Knudsen Appendix Theorem2(1). Combined with the inherited universal coefficient-module Hom and Ext calculations, it supplies all four polynomial conditions. Over noetherian A, the finite presentations and flatness already specified match Knudsen's ambient hypotheses. The reader explains that mathematical deduction; the suggested Lean file states the actual maps and Ext outputs rather than pretending a generic relative-stable-reflexivity carrier is already present.

The source error **E11** is newly recorded for independent review. Ile v3 §2.3 asserts an unrestricted stable-Hom/syzygy–Ext formula. The finite free resolution of ℤ/2 gives Ext¹_ℤ(ℤ/2,ℤ)=ℤ/2, while its projective first syzygy has zero stable Hom to ℤ. The source's stable category is explicitly all coherent modules. The same assertion appears in publisher-indexed §2.3 HTML; direct publisher access failed, and no publisher PDF was read. The packet scopes the finding and access evidence accordingly. No failure of the later restricted approximation theorems is asserted. The polynomial Ext proofs use actual projective resolutions and do not depend on the erroneous shortcut.

## Reading and library boundary

Freshly read: Knudsen II Appendix physical31–39/printed191–199, rendered in full; Ile arXiv1110.3909v3 physical5–8, including the rendered page5 stable-Hom notation, Definition3.1, Definition3.4, Proposition3.5 and Remark3.6; the full StableReduction905-line and JacobianChallenge202-line upstream readers; all twelve reviewed StableReduction library-audit entries and REV-AUDIT-02. Inherited paper routes are preserved; this is not a fresh rereading of every source in the entire moduli roadmap.

The downloaded primary PDFs match their recorded hashes: Knudsen II `18e04bbf5c24a460ff10e965ebf665ea0229378c6a9521bd279909476012e230`; Ile v3 `41e6a87de44074fdc24770e0f842c6e8846347c3b77483d17371d40c97793743`. The 2012 Knudsen repair was downloaded and its introduction inspected; its remaining pages are inherited evidence, not a new full reading in this checkpoint.

Fresh bounded GitHub open Mathlib PR queries and Lean Zulip domain searches were made before this design. An open-PR title query for reflexive returned zero; a broad Ext/base-change query returned adjacent Gorenstein and completion work, not an inspected implementation of this specialized calculation. Zulip exact/combined topic searches returned no results. These searches do not prove global absence. Four newly cited tensor/functor declarations and the native module isomorphism/zero transport statements were read at the pinned Mathlib commit. The scope does not re-plan the parent curve or Jacobian foundations.

## Compilation and validation

Both files compiled serially with the existing Lean4.34.0-rc2 build and exact Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174. They import Mathlib only; no claim depends on the shared Tau Ceti build matching the Tau Ceti pin. No project setup, library build, cache download or language server was used. Each invocation had an executable `free -g` gate requiring at least20GiB available and a1200-second timeout; final invocations had26GiB available. All processes have finished.

- **Native.lean:**4224 lines,156 examples,271 axiom audits, zero errors/warnings/admissions;34.92seconds,3,975,332KiB peak. Audits contain only propext, Classical.choice and Quot.sound. SHA256 `145189ee4d8ce12b17280ce943144d516c835718a198ce37c64bd8a1daebe045`.
- **FullCanonical.lean:**3439 lines,218 examples, zero errors and531 expected declaration-uses-sorry warnings only;29.41seconds,3,532,700KiB peak. SHA256 `eab684ae690547320f3b8326242915ed602d86408e5e75840dc6f1d536eafaa6`.
- All18 new declaration/example headers are byte-matched between native and admitted versions. All ten new declaration/API names and eight test names match the packet. The incoming4050-line native file is preserved byte-for-byte before the additions.
- Indexed `scripts/check_blueprint.py`: zero errors/warnings. Source-version and source-issue validators pass, including E11. Actual intake file and ownership checks: five allowed files, zero problems/refusals. `git diff --check` passes.
- Real builder candidate/control assemblies: stage DAG3050vertices/8750edges; own declaration DAG325/733; scoped DAG3340/9922. All325 declarations are reached with174 baseline leaves,81 supplier pairs reachable, zero unresolved references, zero own skipped/pending links; all other skipped/pending lists match the unchanged control. Stage edges are unchanged.

The full source proof checks are prototype evidence, not implementation status. The final suggested file uses admitted bodies as the protocol requests. Earlier failed prototype runs were corrected before these successful checks.

## Public recovery

Checked sources are archived as inert comments in commit `73aa1e5e38ec8a24caec5c61550a4028868b68ff` in `research/blueprint/suggested/StableReductionPartII.lean`; the final commit removes the archive comments and retains only the canonical signatures. The mathematical incoming base is `0afca1373e81cb7b4345d0e096d419be9a40274d` and the publication base is `e8900fee9630d5937acb359fc7db190573c379f5`. The incoming proof recovery SHA is checked independently by the verifier.

From this repository at the PR head, save each Python block below under its indicated name. Choose an evidence directory on disk, not a memory-backed temporary directory, and pass it to `recover.py`. The script fetches only the immutable archive object and extracts five checked files with their SHA256 checks, plus the two baseline JSON snapshots. It does not create a Lean project or fetch/build dependencies.

Run `python3 recover.py EVIDENCE`, then `python3 verify.py EVIDENCE`. To run the graph comparison, set `TAUCETI_BASELINE` to the existing pinned baseline directory and run `python3 graph.py EVIDENCE`. The graph counts refer to the publication base; a later atlas may change unrelated stage counts. Actual candidate/control equality is recomputed against that current tree. Compiler logs are retained locally; public recovery supplies exact compiler inputs and hashes. Without logs, the verifier reports source checks, not a new compilation. Compile only in an existing pinned build and obey WORKERS.md's memory, serial-process and timeout limits.

## Where to resume

The next mathematical step is the reusable relative-stable-reflexivity formulation and **two-base** completion theorem. Pin the generic owner before adding its definition or general theorem; this packet has not created a new private notion. Knudsen Proposition6 compares S→R with Ŝ→R̂. A proof must handle arbitrary Ŝ-module coefficients, actual completed scalar towers and canonical dual comparisons, with faithful reflection justified. The flat ambient R→R̂ adapters alone do not compare R̂⊗_S N with R̂⊗_Ŝ N. Bourbaki III5.4.4 is still unread here, and Appendix Proposition7 remains an exercise, not a proved dependency leaf.

Then complete the pointed completed-local hull identification, coefficient-compatible sheaf descent and finite-presentation approximation to arbitrary bases. MC.0–MC.7 geometry, the moduli key, complete family signatures and the other existing gaps remain open. Keep E11 separate from the valid actual projective-resolution argument. Preserve the negative second presentation generators and the distinction between ordinary, relative and completed-local statements.


### recover.py

SHA256 `87d2dee89603b44a6ca06448abad781972851e0c211af357848b789e69a75a59`.

```python
from pathlib import Path
import sys,subprocess,hashlib,json
S=Path(sys.argv[1]);S.mkdir(parents=True,exist_ok=True)
ARCHIVE='73aa1e5e38ec8a24caec5c61550a4028868b68ff'
BASE='0afca1373e81cb7b4345d0e096d419be9a40274d'
HASHES={'Native.lean': '145189ee4d8ce12b17280ce943144d516c835718a198ce37c64bd8a1daebe045', 'IncomingNative.lean': '8c54f664cadcb7e0dacd4a5411cf908c8dced56bff8071e79141e88ee0d04083', 'FullCanonical.lean': 'eab684ae690547320f3b8326242915ed602d86408e5e75840dc6f1d536eafaa6', 'NewNative.lean': 'db645789955121fa143fab022a40873a44cb45286bf08e284d717b2af220adca', 'NewAdmitted.lean': '23634bc2145272911a509a8e8cfcc53c2ce3b24b189ce3fac4567f5ddc30320d'}
subprocess.run(['git','fetch','origin',ARCHIVE],check=True)
raw=subprocess.check_output(['git','show',ARCHIVE+':research/blueprint/suggested/StableReductionPartII.lean'],text=True)
for name,digest in HASHES.items():
 start='/- BEGIN ARCHIVED RELATIVE CRITERION '+name+'\n';end='END ARCHIVED RELATIVE CRITERION '+name+' -/'
 text=raw.split(start,1)[1].split(end,1)[0]
 assert hashlib.sha256(text.encode()).hexdigest()==digest,name
 (S/name).write_text(text)
(S/'base.txt').write_text(BASE+'\n')
for folder,name in [('packets','original-packet.json'),('roadmaps','original-roadmap.json')]:
 data=subprocess.check_output(['git','show',BASE+':research/blueprint/'+folder+'/StableReductionPartII.json'])
 (S/name).write_bytes(data)
print(json.dumps(HASHES,indent=2))
```

### verify.py

SHA256 `a9db79b71b083d8d10362d865e03a0a22d8cc430e780df6b04781f382c897504`.

```python
from pathlib import Path
import sys,json,re,hashlib,subprocess
W=Path.cwd();S=Path(sys.argv[1]);RID='StableReductionPartII';Q='NodeSectionFactorization.PolynomialModel.'
files=['research/blueprint/'+f+'/'+('DESIGN-' if f=='handoff' else '')+RID+'.'+ext for f,ext in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
p=json.loads((W/files[1]).read_text());old=json.loads((S/'original-packet.json').read_text());r=json.loads((W/files[0]).read_text());oldr=json.loads((S/'original-roadmap.json').read_text())
assert len(p['nodes'])==325 and len(old['nodes'])==319
for a,b in zip(p['nodes'],old['nodes']):
 if a!=b:
  assert a['id']==RID+':MC.2/dual-section-ideal'
  assert a['prerequisites'][:-6]==b['prerequisites'] and a['proofSteps'][:-1]==b['proofSteps']
  assert {k:v for k,v in a.items() if k not in ['prerequisites','proofSteps']}=={k:v for k,v in b.items() if k not in ['prerequisites','proofSteps']}
for k in old:
 if k not in ['nodes','summary','baseline','sources','sourceIssues','sourceVersions','coverage','gaps']:assert p[k]==old[k],k
assert p['baseline']['declarations'][:-4]==old['baseline']['declarations']
assert {k:v for k,v in p['baseline'].items() if k!='declarations'}=={k:v for k,v in old['baseline'].items() if k!='declarations'}
assert p['sourceIssues'][:-1]==old['sourceIssues'] and p['sourceVersions'][:-2]==old['sourceVersions']
assert p['gaps'][:-1]==old['gaps']
for a,b in zip(p['sources'],old['sources']):
 if a!=b:
  assert a['id'] in ['knudsen2','ile'] and a['readSections'][:-1]==b['readSections']
  assert {k:v for k,v in a.items() if k not in ['readSections','edition']}=={k:v for k,v in b.items() if k not in ['readSections','edition']}
for a,b in zip(p['coverage'],old['coverage']):
 if a!=b:assert a['stageId']==RID+':MC.2' and a['remaining'][:-1]==b['remaining'] and a['status']==b['status']=='partial'
for k in oldr:
 if k not in ['summary','stages']:assert r[k]==oldr[k],k
for a,b in zip(r['stages'],oldr['stages']):
 if a!=b:assert a['key']=='MC.2' and a['description'].startswith(b['description']) and {k:v for k,v in a.items() if k!='description'}=={k:v for k,v in b.items() if k!='description'}
assert p['status']=='partial' and all(x['implementationStatus']=='unchecked' for x in p['nodes'])
base=(S/'base.txt').read_text().strip()
def blob(f):return subprocess.check_output(['git','show',base+':'+f],text=True)
assert (W/files[2]).read_text().endswith(blob(files[2]))
full=(W/files[3]).read_text();incoming=(S/'IncomingNative.lean').read_text();new=(S/'NewNative.lean').read_text();admitted=(S/'NewAdmitted.lean').read_text();native=(S/'Native.lean').read_text()
assert full==blob(files[3])+'\n/- BEGIN RELATIVE CRITERION COMPARISON -/\n'+admitted+'/- END RELATIVE CRITERION COMPARISON -/\n'
assert (S/'FullCanonical.lean').read_text()==full
assert hashlib.sha256(incoming.encode()).hexdigest()=='8c54f664cadcb7e0dacd4a5411cf908c8dced56bff8071e79141e88ee0d04083'
audit='\n'.join('#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.'+m for m in re.findall(r'^(?:def|lemma) (\w+)',new,re.M))+'\n'
assert native==incoming+'\n'+new+audit and not re.search(r'\bsorry\b|^axiom\b',native,re.M)
pat=r'^(?:def|lemma|example)\b[\s\S]*?(?=\n(?:set_option|lemma|def |-- test:|end\n)|\Z)'
def headers(x):return [m.split(' :=',1)[0] for m in re.findall(pat,x,re.M)]
assert headers(new)==headers(admitted) and len(headers(new))==18
names=set(re.findall(r'^(?:def|lemma) (\w+)',new,re.M));planned={x['declarationName'].removeprefix(Q) for x in p['nodes'][-6:]}|{a['name'].removeprefix(Q) for x in p['nodes'][-6:] for a in x.get('api',[])}
assert names==planned and len(names)==10
plannedtests={t['name'] for n in p['nodes'][-6:] for t in n.get('tests',[])};assert plannedtests==set(re.findall(r'^-- test: (.+)$',admitted,re.M)) and len(plannedtests)==8
assert len(re.findall(r'^example\b',native,re.M))==156 and len(re.findall(r'^example\b',full,re.M))==218
assert len(re.findall(r'^#print axioms ',native,re.M))==271
for name,digest in [('Native.lean','145189ee4d8ce12b17280ce943144d516c835718a198ce37c64bd8a1daebe045'),('FullCanonical.lean','eab684ae690547320f3b8326242915ed602d86408e5e75840dc6f1d536eafaa6')]:assert hashlib.sha256((S/name).read_bytes()).hexdigest()==digest
if (S/'native.log').exists():
 log=(S/'native.log').read_text();assert 'error:' not in log and 'error(' not in log and 'warning:' not in log and 'sorryAx' not in log
 audits=re.findall(r'depends on axioms: \[([^]]*)\]',log);assert len(audits)==271
 assert all(set(map(str.strip,a.split(',')))<=set(['propext','Classical.choice','Quot.sound']) for a in audits)
if (S/'suggested.log').exists():
 log=(S/'suggested.log').read_text();assert 'error:' not in log and 'error(' not in log
 warnings=[z.split('warning:',1)[1].strip() for z in log.splitlines() if 'warning:' in z];assert len(warnings)==531 and set(warnings)=={"declaration uses `sorry`"}
sys.path.insert(0,str(W/'scripts'));import check_errata
assert not check_errata.versions_checked(p,p['sourceIssues']) and not check_errata.check_issues(p['sourceIssues'],RID)
print(json.dumps({'nodes':325,'preservedWholeNodes':318,'extendedParent':1,'newNodes':6,'rawAPIs':sum(len(x.get('api',[])) for x in p['nodes']),'rawTests':sum(len(x.get('tests',[])) for x in p['nodes']),'newTests':8,'nativeAudits':271,'nativeExamples':156,'canonicalExamples':218,'sourceIssues':len(p['sourceIssues']),'routesPreserved':21,'keyConsumersPreserved':6,'allStagesPartial':True,'headersMatch':18},indent=2))

import ast
tree=ast.parse((W/'research/blueprint/intake.py').read_text());wanted={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id in {'ALLOWED','PRIVATE'} for t in n.targets) or isinstance(n,ast.FunctionDef) and n.name in wanted]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((W/'research/blueprint/queue.json').read_text())['jobs'] if j['id']=='DESIGN-'+RID)
problems=[x for f in files for x in env['file_problems'](f,(W/f).read_text())];refusals=env['auto_refusals'](job,files,False,{'codex-7e92bd'},set());assert not problems and not refusals,(problems,refusals)
print(json.dumps({'intakeProblems':problems,'intakeRefusals':refusals,'allowedFiles':len(files)}))
```

### graph.py

SHA256 `6ee47636a73730278c91524fe5f4877e8b274ac77f3de2912d275ca24a9b66c1`.

```python
from pathlib import Path
import os,sys,json,collections,copy
R=Path.cwd();S=Path(sys.argv[1]);RID='StableReductionPartII';STEM=RID
sys.path.insert(0,str(R/'scripts'))
import check_blueprint
p=json.loads((R/'research/blueprint/packets'/f'{STEM}.json').read_text())
old=json.loads((S/'original-packet.json').read_text())
nodes={n['id']:n for n in p['nodes']}
import build,blueprints
packets,documents,definitions=blueprints.load_promoted(R)
keep=[x for x in packets if x[0]!=STEM];documents[STEM]='research/blueprint/readmes/'+STEM+'.md'
own_definition=json.loads((R/'research/blueprint/roadmaps'/f'{RID}.json').read_text())
old_definition=json.loads((S/'original-roadmap.json').read_text())
def assemble(candidate,definition):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(STEM,candidate)]),copy.deepcopy(documents),copy.deepcopy([d for d in definitions if d.get('id')!=RID]+[definition]))
 return build.assemble(require_distances=False)[0]
a=assemble(p,own_definition);b=assemble(old,old_definition)
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
roadmap=own_definition
pairs={(d,RID+':'+s['key']) for s in roadmap['stages'] for d in s.get('requires',[])}
pairs|={(d,stageof(nid)) for nid,n in nodes.items() for d in n['prerequisites'] if d in stageids and d not in world and d!=stageof(nid)}
pairs|={(stageof(q['supplier']),stageof(v)) for q in p['requests'] for v in q['neededBy'] if stageof(q['supplier'])!=stageof(v)}
rspairs=set()
for file in (R/'research/blueprint/restructure').glob('*.result.json'):
 q=json.loads(file.read_text())
 if q.get('review',{}).get('status')!='accepted':continue
 rspairs|={(x['source'],x['target']) for x in q.get('links',[]) if x.get('source','').startswith(RID+':') or x.get('target','').startswith(RID+':')}
assert all(reachable(s,t) for s,t in pairs|rspairs),sorted((s,t) for s,t in pairs|rspairs if not reachable(s,t))
ar={r['id']:r for r in a['roadmaps']};br={r['id']:r for r in b['roadmaps']}
assert ar[RID]['blueprint']['declarations']==len(nodes)
assert not ar[RID]['blueprint']['skippedLinks'] and not ar[RID].get('pendingLinks',[])
def skips(r):return r.get('blueprint',{}).get('skippedLinks',[]),r.get('pendingLinks',[])
assert all(skips(ar[x])==skips(br[x]) for x in br if x!=RID)
summary={'stageDAG':dag(listedstageids,se),'ownDeclarationDAG':dag(nodes,ownedges),'scopedDAG':dag(listedstageids|seen,se|de),'reachableDeclarations':len(seen),'externalDeclarations':sorted(seen-set(nodes)),'baselineLeaves':len(baseref),'requiredPairs':len(pairs),'restructurePairs':len(rspairs),'unresolved':sorted(unresolved),'ownSkippedLinks':[],'ownPendingLinks':[],'otherSkipsMatch':True,'stageEdgesUnchanged':True}
print(json.dumps(summary,indent=2))
```

---

## Preserved previous handoff

# StableReductionPartII: actual categorical Hom and higher Ext checkpoint

Codex — codex-a71f92; 2026-10-03. Refs #3342.
Winning claim5965209863 and our bot confirmation5965211452 were read before work.
Mathematical input base cbc70097561abd69d9e3b1d6caff7bee676c019a. Publication base fb636d0b727444d0078a661b7591b0d79409af63.
Only the five issue-authorized deliverables are changed; the shared checkout was read-only.

## Outcome and limits

For the actual polynomial R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), section ideal J=(u−ιs,v−ιt), D=Hom_R(J,R) and every A-module M, the actual projective-resolution categorical Hom complex is isomorphic to the inherited signed R-linear Hom cochain. Its comparison is coefficient-natural in every degree, including degree zero.

Both native Mathlib positive Ext interfaces now have checked vanishing for J and D with target R⊗_A M. The left-derived linear Yoneda _root_.Ext has explicit native R-module isomorphisms to the actual cochain homology. The localization-defined CategoryTheory.Abelian.Ext is treated separately with native extMk_surjective and extMk_eq_zero_iff, using actual categorical boundaries of the actual resolutions. No comparison between the two general Mathlib Ext definitions is assumed or claimed.

These are authored polynomial deductions for arbitrary commutative A, including the zero and nonreduced rings, and arbitrary coefficient M without flatness. The named tests include M=Z/2 over Z and A=Z/4, retain the ideal/dual signed phases and round-trip degree-zero Ext elements. No degree-zero vanishing is asserted.

This does not prove the exact Appendix/Ile relative stable-reflexivity theorem, the two-base completion comparison, pointed completed-local hull identification, family/sheaf descent or arbitrary-base approximation. All eight MC stages remain partial and all implementationStatus fields remain unchecked. The broad key/moduli-curves owner is unchanged, not narrowed to an affine algebra experiment.

## Preservation and new contracts

Of304 incoming mathematical nodes,303 are whole-object identical. The dual-section-ideal theorem preserves every statement, hypothesis, API/test, source, acceptance and ownership contract and appends exactly three prerequisites and one proof step consuming the new native Ext/naturality inputs. The complete incoming3813-line checked native file is retained byte-for-byte following three imports; its SHA-256 is30bc02cb3d84884b6727f34c127a01c366c8cbde987da6363d89a9962f7f5860.

The checkpoint adds15 declaration-sized nodes: three constructions and twelve lemmas; nine API entries and twelve named tests. Baseline168-prefix entries are unchanged and13 exact freshly read native references are appended. All14 gaps,135 requests,35 planets, six key-definition consumers and21 Yuan/DGH routes remain. Older remaining lists and receipts are historical; the appended current frontier clarifies that the polynomial higher Ext obligation is now discharged, not its geometric consequences.

Current totals:319 nodes (eight definitions,64 constructions,183 lemmas,63 theorems, one application);269 APIs overall /268 definition-construction API entries;272 tests overall /250 required definition-construction tests;181 baseline declarations. Zero closed stages.

## Fresh source and pinned-library reading

WORKERS was read in full and its hash is unchanged. The governing protocols were fully read earlier in this continuous worker session and verified unchanged at the current base. The reviewed StableReduction parent audit's twelve layer target lists and accepted REV-AUDIT-02 were read; there is no StableReductionPartII-specific reviewed audit entry. That is not an absence-search verdict. The reserved moduli-curves key, its six consumer contracts and all21 routed Yuan/DGH records were read and preserved. Bounded immutable research/blueprint/links and linkmaps searches find no Part II entries. The fully read upstream StableReduction and JacobianChallenge style documents have unchanged blobs53c50f6e5c2ebbde46cac7720978afbf03212859 and aedda48979b6c3544a1dce041d00221204d64655.

Fresh Knudsen reading covers the introduction/Main Lemma and complete §§3–4 of arXiv:1106.1588v2 primary HTML, SHA-2562c89ce4072046d546ff9256a5c64cd488f41026c561f8858f4a78ce14c21d685. No fresh whole-paper, PDF, Appendix/Ile or Eisenbud proof audit is claimed. The source's noetherian/unit-discriminant and geometric qualification boundaries remain.

Pinned Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 were verified. The exact native statements and surrounding hypotheses of both Ext interfaces, linearYonedaObj, projective-resolution comparisons, categorical/linear Hom equivalence, homologyFunctor and zero transport were read before citation. The general theories are reused, not replanned.

## Compilation evidence

Both entire files were compiled sequentially using only the existing pinned Lean4.34.0-rc2 build; no Lake setup/update/cache/library build or language server.

- Native: 4050 lines,148 examples,261 named axiom audits; zero errors, warnings, admissions or sorryAx dependencies. Wall time 1:25.39, peak RSS3008028 KiB;21 GiB available before starting. Source SHA-2568c54f664cadcb7e0dacd4a5411cf908c8dced56bff8071e79141e88ee0d04083; normalized diagnosticsf5d932b990e2eb9c91037ed4dc51bd318340722ed3fd1c4f4a6935c6b9605dfa.
- Canonical suggested sketch: 3329 lines,210 examples; zero errors and exactly513 declaration-admission warnings, no other warnings. Wall time 1:08.21, peak RSS3182984 KiB;20 GiB available before starting. Source SHA-2569206666ec4b0689d48185677c582bf9ff36c4a467839e24b8c7743bbf42fe245; normalized diagnosticscb98514c157c7b135649a892500c36a2895a2170441ba258dd69a4565ace8cac.

Compilation was explicitly deferred while available memory was below20 GiB and resumed only when the conditional check met the threshold. Each invocation had timeout1200; no owned Lean process remains. The full admitted sketch is a signature plan, not a claimed library implementation. Separate native proof bodies are checked experiments for the actual carriers, not toy quotients or assumed Ext fields.

## Actual validation and assembly

The immutable validator uses the actual pinned repository checker, actual intake file checks and actual atlas assembler, with five supplied overlays and an original-packet/control assembly. It checks exact new public and example headers (15 declarations /12 tests), native incoming-prefix preservation, all incoming contracts and all metadata/source/API/test boundaries.

The actual checker has zero errors/warnings. The stage DAG is3050 vertices/8750 edges; own declaration DAG319/718; combined reachable graph3334/9582. All are acyclic. All319 declarations are reachable,170 baseline references are reachable, with no external or unresolved declarations. All81 required supplier-stage pairs are reachable. The own skipped/pending arrays are empty; stage edges and all unrelated skipped/pending arrays match the control. No accepted restructuring pair touches this roadmap.

All21 scoped owner/governing/audit/key/source-route/parent-stage/validator blobs match the mathematical and publication bases, and the two upstream style blobs match. This is a scoped preservation check, not a fresh mathematical verification of every atlas owner.

Validator SHA-256ee9cbff34d761a790b407fc54ead418f8c3f85dde9b8650aabbfc5a682b97c5c; immutable reader2c6d623c48ed7a83ca6f7c9a86942b90d081e87b5ef0a00150fcbc38c197c991.

## Public reproducibility

The immutable evidence archive is 311f2910752642220c24f33d90c66d76f1174f36, linked as the submitted commit's second parent, using only the authorized suggested and handoff paths. It contains the exact checked native file, exact canonical sketch, validator, immutable reader and normalized compiler diagnostics. The archive is a separate proof experiment tree; the PR's five final files are the actual proposal overlay.

The recovery program below checks all SHA-256 digests and recreates evidence only with apply_patch. It also recovers the incoming native file from the predecessor public archive45fa3d24a2a351b100b409d8c0b444e82c3e58b9, and, when N12_DELIVERY_HEAD is set to this submitted commit, the five final deliverables. Public replay checked byte-for-byte sources and both runtime-independent signature/metadata checks and the actual current-base checker/intake/atlas assembly. Archived diagnostics are explicitly identified as archived; replay is not reported as a second Lean compilation.

Use an existing clone, fetch the publication base, archive and submitted head, create an empty owned recovery directory, and set TAUCETI_REPO to that clone and TAUCETI_BASELINE to its pinned declarations.tsv file. Run the recovery program with the owned recovery directory as its argument and N12_DELIVERY_HEAD set to the submitted head. In that directory run verify.py with N12_VALIDATE_BASE=fb636d0b727444d0078a661b7591b0d79409af63 and PYTHONDONTWRITEBYTECODE=1. To recompile, use only an already-built exact pinned Lean environment, check available memory≥20 GiB before each sequential invocation, timeout1200, and save actual native.log/canonical.log; verify.py then reports runtime diagnostics rather than archived evidence.

```python
"""Recover public proof evidence and five deliverables; write only via apply_patch."""
from pathlib import Path
import hashlib,json,os,subprocess
import sys
repo=Path(os.environ['TAUCETI_REPO']).resolve()
out=Path(sys.argv[1]).resolve()
base=os.environ.get('N12_VALIDATE_BASE','fb636d0b727444d0078a661b7591b0d79409af63')
archive='311f2910752642220c24f33d90c66d76f1174f36'
incoming='45fa3d24a2a351b100b409d8c0b444e82c3e58b9'
files={'Native.lean':('research/blueprint/suggested/StableReductionPartII.lean','/- BEGIN ARCHIVED CHECKED SECTION EXT\n','END ARCHIVED CHECKED SECTION EXT -/','8c54f664cadcb7e0dacd4a5411cf908c8dced56bff8071e79141e88ee0d04083'),
'Canonical.lean':('research/blueprint/suggested/StableReductionPartII.lean','/- BEGIN ARCHIVED CANONICAL SECTION EXT\n','END ARCHIVED CANONICAL SECTION EXT -/','9206666ec4b0689d48185677c582bf9ff36c4a467839e24b8c7743bbf42fe245'),
'verify.py':('research/blueprint/handoff/DESIGN-StableReductionPartII.md','# BEGIN ARCHIVED SECTION EXT VALIDATOR\n','# END ARCHIVED SECTION EXT VALIDATOR','ee9cbff34d761a790b407fc54ead418f8c3f85dde9b8650aabbfc5a682b97c5c'),
'immutable_view.py':('research/blueprint/handoff/DESIGN-StableReductionPartII.md','# BEGIN ARCHIVED SECTION EXT IMMUTABLE READER\n','# END ARCHIVED SECTION EXT IMMUTABLE READER','2c6d623c48ed7a83ca6f7c9a86942b90d081e87b5ef0a00150fcbc38c197c991'),
'NativeDiagnostics.txt':('research/blueprint/handoff/DESIGN-StableReductionPartII.md','# BEGIN ARCHIVED SECTION EXT NATIVE DIAGNOSTICS\n','# END ARCHIVED SECTION EXT NATIVE DIAGNOSTICS','f5d932b990e2eb9c91037ed4dc51bd318340722ed3fd1c4f4a6935c6b9605dfa'),
'CanonicalDiagnostics.txt':('research/blueprint/handoff/DESIGN-StableReductionPartII.md','# BEGIN ARCHIVED SECTION EXT CANONICAL DIAGNOSTICS\n','# END ARCHIVED SECTION EXT CANONICAL DIAGNOSTICS','cb98514c157c7b135649a892500c36a2895a2170441ba258dd69a4565ace8cac')}
def blob(ref,path):
 return subprocess.check_output(['git','show',ref+':'+path],cwd=repo).decode()
def emit(name,data):
 target=out/name
 assert target.parent==out and not target.exists(),target
 patch='*** Begin Patch\n*** Add File: '+str(target)+'\n'+''.join('+'+line+'\n' for line in data.removesuffix('\n').split('\n'))+'*** End Patch\n'
 subprocess.run(['apply_patch'],input=patch,text=True,check=True,capture_output=True)
 assert target.read_text()==data,name
for name,(path,start,end,expected) in files.items():
 data=blob(archive,path).split(start,1)[1].split(end,1)[0]
 if not data.endswith('\n'):data+='\n'
 assert hashlib.sha256(data.encode()).hexdigest()==expected,name
 emit(name,data)
data=blob(incoming,'research/blueprint/suggested/StableReductionPartII.lean').split('/- BEGIN ARCHIVED CHECKED SECTION PROJECTIVE RESOLUTIONS\n',1)[1].split('END ARCHIVED CHECKED SECTION PROJECTIVE RESOLUTIONS -/',1)[0]
if not data.endswith('\n'):data+='\n'
assert hashlib.sha256(data.encode()).hexdigest()=='30bc02cb3d84884b6727f34c127a01c366c8cbde987da6363d89a9962f7f5860'
emit('IncomingNative.lean',data)
commit=os.environ.get('N12_DELIVERY_HEAD')
if commit:
 for remote,local in [('research/blueprint/roadmaps/StableReductionPartII.json','roadmap.json'),('research/blueprint/packets/StableReductionPartII.json','packet.json'),('research/blueprint/readmes/StableReductionPartII.md','reader.md'),('research/blueprint/handoff/DESIGN-StableReductionPartII.md','handoff.md')]:
  emit(local,blob(commit,remote))
 canonical=blob(commit,'research/blueprint/suggested/StableReductionPartII.lean')
 assert canonical==(out/'Canonical.lean').read_text()
print(json.dumps({'recovered':sorted(p.name for p in out.iterdir() if p.is_file()),'nativeSha256':hashlib.sha256((out/'Native.lean').read_bytes()).hexdigest(),'canonicalSha256':hashlib.sha256((out/'Canonical.lean').read_bytes()).hexdigest(),'base':base,'archive':archive}))
```

## Where to resume

Read the exact Knudsen II Appendix Definition1/Theorem2/Proposition6 and Ile relative stable-reflexivity statements with their ring maps and coefficient conditions. The algebraic ideal/dual reflexivity, coefficient Hom exchange, actual projective resolutions, categorical Hom-complex comparison and positive native Ext inputs now exist. The ambient flat R→B adapters do not automatically establish a two-base S→R completion theorem. Appendix Proposition7 is an exercise, not a proved leaf. Then establish the pointed completed-local hull and coefficient-compatible family/sheaf descent, followed by finite-presentation approximation and all inherited MC.0–MC.7 geometry. Do not infer moduli-stack, universal-curve, coarse-space or level-cover closure from this affine Ext checkpoint.

## Scratch lifecycle

After the PR is open and public recovery is verified, the exact owned scratch directory is moved to recoverable desktop trash. No shared checkout data is deleted. Public evidence and all final deliverables remain reachable from the PR and its second-parent archive.

---

## Retained incoming handoff

# StableReductionPartII: actual section projective resolutions checkpoint

Codex — codex-5ebb6f; 2026-10-03. Refs #3342. Claim5964892894 and winning bot5964894001 were read before work. Mathematical base 0f8afef629b4d0be5a436d2d5da7112ee34a9999; publication base 9c8a340faae54f977214d1a159764c3ca25a1e0e. Work uses an owned branch and only the five authorized deliverables plus owned scratch.

## Outcome and limits

The actual polynomial section ideal J=(u−ιs,v−ιt) and native dual D=Hom_R(J,R) now have their particular native projective resolutions. The chain terms are F=Fin2→R in every nonnegative degree, finite free and natively projective. The ideal chain starts d(1,0)=Ψ,d(2,1)=Φ; the dual chain starts Φ,Ψ. Their actual signed augmentations are P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. Native quasi-isomorphism proofs cover degree zero by the actual kernel/surjectivity and all positive degrees by exactness.

For every A-module M, native R-linear Hom precomposition by each actual chain differential equals the existing sectionHomDifferential with target R⊗_A M. Native HEq signatures express these equalities while the admitted sketch keeps constructor bodies opaque; they compare the same actual maps and preserve the stated chain objects.

This is not yet the categorical Hom-complex isomorphism or native higher Ext comparison. Relative stable reflexivity, two-base completion, pointed completed-local hull, family/sheaf descent, arbitrary-base approximation and all MC.0–MC.7 source/supplier obligations remain open. All stages remain partial and every implementationStatus remains unchecked.

Thirty new declaration-sized nodes comprise six constructions and24 lemmas, with24 API entries and18 named tests. All274 incoming mathematical contracts remain;273 whole node objects are unchanged. The dual-section-ideal anchor appends only three prerequisites and one proof step. All152 incoming baseline entries remain and16 freshly read native references are appended. All14 gaps,135 requests,35 planets, six reserved-key consumer contracts and21 routed Yuan/DGH items remain unchanged.

Final packet:304 nodes (8 definitions,61 constructions,171 lemmas,63 theorems,1 application);260 API entries overall (259 on definitions/constructions);260 tests overall (241 on definitions/constructions);168 baseline references; eight partial and zero closed stages. The reserved general moduli-curve groupoid definition is unchanged; the polynomial model does not replace it or conflate stack, coarse and fine-level problems.

## Exact checks

The 3813-line native proof preserves the complete3453-line incoming native source byte-for-byte after two pinned imports. It has136 examples,246 distinct named declaration axiom audits, zero errors, warnings and admissions. All audited axioms are ordinary propext/Classical.choice/Quot.sound. Source SHA256 30bc02cb3d84884b6727f34c127a01c366c8cbde987da6363d89a9962f7f5860; normalized diagnostics SHA256 cb929188e9b9ae3f82ddec8b643cb2938a149dd205980e25da710f6b94db9893. Wall time 30.85s; peak RSS 3536136KiB.

The entire 3171-line canonical admitted sketch preserves the2928-line incoming sketch byte-for-byte after those imports, with198 examples. It elaborates with zero errors,486 expected admission warnings and no other warnings. Source SHA256 db2a1e277d48d096dfe5cb4914cd718d0ea5bf1a2db7905601272ff3d1bb48f2; normalized diagnostics SHA256 cbd10b91705548d3bf95527aee19ab401333785dc077e8322de91b191f629022. Wall time 28.03s; peak RSS 3317204KiB. This is the §13 suggested signature file, not a library implementation.

Both sources use only individual Mathlib imports. The existing build has exact Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; the recorded Tau Ceti baseline is f790474821cf4256814db967cb154e7af3d0c369. Each serial compiler invocation began with at least39GiB available memory. No library setup, update, cache fetch, build or language server was run.

The actual indexed packet checker has zero errors/warnings. The actual intake five-path/private-path checks pass. All30 new native/sketch declaration headers and18 test headers match using a top-level delimiter scanner that protects named arguments. Whole incoming node, baseline, source, request, gap, planet, owner, stage, key-definition and consumer contracts are checked against immutable Git inputs.

Actual immutable atlas assembly: 3050 stage vertices/8750 edges;304 owned declarations/690 prerequisite edges, against274/642 in the control; 3319 combined vertices/9554 edges. All three graphs are acyclic. All304 reachable declarations are owned here; zero unresolved or external prerequisites. All81 required supplier/stage pairs are reachable. Own skipped/pending links are empty; stage edges and unrelated skipped/pending links match the actual original-control assembly. All21 scoped mathematical/publication input blobs are byte-identical.

## Reading and provenance

Fresh primary source reading: complete arXiv:1106.1588v2 §3 Key Example, Proposition3.1/Corollary3.2 and §4 proof. Downloaded primary HTML SHA2562c89ce4072046d546ff9256a5c64cd488f41026c561f8858f4a78ce14c21d685. No fresh whole-paper, visual PDF, Appendix/Ile, Bourbaki or Eisenbud proof audit is claimed. Printed noetherian/unit-discriminant geometric hypotheses are retained; arbitrary-ring native resolution packaging is an authored deduction from the previously checked actual polynomial presentations.

Fresh native statements include ChainComplex.of/of_d, toSingle₀Equiv, native projective resolutions, categorical/module projectivity, finite-product free/finite instances, native augmentation quasi-isomorphism criteria, single-object positive exactness and the actual ModuleCat epi/exactness interfaces. The Mathlib native generic-constructor proof pattern was adapted to these signed augmentations; its theory is reused, not replanned.

The whole current issue was read before and after the winning claim, with all86 comments retained for the claim audit. Current handoff outcome/frontier/public recovery, all eight stage contracts, reserved key/six consumers, exact21 routed item requirements, all12 parent library-audit target/verdict rows and complete accepted REV-AUDIT-02 were freshly read. No searched link-map entry mentioned StableReductionPartII. Governing and whole-upstream document readings from earlier in this continuous session retain their recorded scope. Earlier compiler, graph, source-error, Appendix and printed-page receipts remain historical, not silently recertified here.

## Where to resume

1. Identify the native categorical Hom applied to these actual resolutions with the existing sectionHomCochain complexes, including degree-zero augmentation and coefficient naturality; establish the actual native higher Ext comparison and vanishing. The checked precomposition differential equality is only one part of this interface.
2. Read/apply the exact Appendix/Ile relative stable-reflexivity theorem, two-base Proposition6 completion and Proposition7 exercise. An R→B flat ambient-extension adapter is not the required coefficient-base comparison.
3. Finish pointed completed-local hull/chart comparisons, family/sheaf descent, arbitrary-base approximation and every inherited MC.0–MC.7 obligation. No new supplier request or planet is introduced.

## Public recovery

The final receipt below names the immutable source archive retained as an ancestor. Native.lean, Canonical.lean, verify.py and immutable_view.py are publicly recoverable from its marked blocks. IncomingNative.lean remains recoverable from71211013c077a46744584d95b38434e23a55fc9d, CHECKED SECTION HOM COCHAINS markers, with SHA256690e22fed4c79b7b46fd8c3e72ae33da6c9f00ce0eeea7498eb0daf18971eeb6.

In a reader-supplied scratch directory, retain these five recovered source artifacts. Overlay the final five deliverables in roadmaps/, packets/, readmes/, suggested/ and handoff/ subdirectories. With a memory check before each serial invocation, run the existing pinned build on Native.lean and Canonical.lean; retain native.log and canonical.log, including the Elapsed/peak resource line. Run verify.py with TAUCETI_REPO pointing to an existing read-only clone and TAUCETI_BASELINE to the pinned declarations.tsv FILE. P8_VALIDATE_BASE may override the default publication base 9c8a340faae54f977214d1a159764c3ca25a1e0e. The immutable reader uses Git blobs plus exactly five overlays, and never creates a repository snapshot or writes the repository. Validator SHA256 6c110740865c06f52c8a54b43a09ba1e8e0149b8f5b5fe886316addb20271272; immutable-reader SHA256 a5804a09aa6ca41675d2b63453fadd6c412f64fe07f8001549e5a452cf722e81.

Immutable public source archive: [45fa3d24a2a351b100b409d8c0b444e82c3e58b9](https://github.com/CBirkbeck/tauceti-explorer/commit/45fa3d24a2a351b100b409d8c0b444e82c3e58b9), retained as an ancestor of the final proposal. [Native/canonical source blocks](https://github.com/CBirkbeck/tauceti-explorer/blob/45fa3d24a2a351b100b409d8c0b444e82c3e58b9/research/blueprint/suggested/StableReductionPartII.lean) and [validator/reader blocks](https://github.com/CBirkbeck/tauceti-explorer/blob/45fa3d24a2a351b100b409d8c0b444e82c3e58b9/research/blueprint/handoff/DESIGN-StableReductionPartII.md) are inert archived sources; the final suggested file remains entirely admitted. The following emitter is the current recovery script; the historical emitters in the retained handoff stay under their original scopes.

```python
"""Read-only public recovery; emits one verified source and never writes."""
import sys,hashlib,urllib.request
ARTIFACTS={'Native.lean': ('45fa3d24a2a351b100b409d8c0b444e82c3e58b9', 'research/blueprint/suggested/StableReductionPartII.lean', '/- BEGIN ARCHIVED CHECKED SECTION PROJECTIVE RESOLUTIONS\n', 'END ARCHIVED CHECKED SECTION PROJECTIVE RESOLUTIONS -/', '30bc02cb3d84884b6727f34c127a01c366c8cbde987da6363d89a9962f7f5860'), 'Canonical.lean': ('45fa3d24a2a351b100b409d8c0b444e82c3e58b9', 'research/blueprint/suggested/StableReductionPartII.lean', '/- BEGIN ARCHIVED CANONICAL SECTION PROJECTIVE RESOLUTIONS\n', 'END ARCHIVED CANONICAL SECTION PROJECTIVE RESOLUTIONS -/', 'db2a1e277d48d096dfe5cb4914cd718d0ea5bf1a2db7905601272ff3d1bb48f2'), 'verify.py': ('45fa3d24a2a351b100b409d8c0b444e82c3e58b9', 'research/blueprint/handoff/DESIGN-StableReductionPartII.md', '# BEGIN ARCHIVED SECTION PROJECTIVE RESOLUTIONS VALIDATOR\n', '# END ARCHIVED SECTION PROJECTIVE RESOLUTIONS VALIDATOR\n', '6c110740865c06f52c8a54b43a09ba1e8e0149b8f5b5fe886316addb20271272'), 'immutable_view.py': ('45fa3d24a2a351b100b409d8c0b444e82c3e58b9', 'research/blueprint/handoff/DESIGN-StableReductionPartII.md', '# BEGIN ARCHIVED SECTION PROJECTIVE RESOLUTIONS IMMUTABLE READER\n', '# END ARCHIVED SECTION PROJECTIVE RESOLUTIONS IMMUTABLE READER\n', 'a5804a09aa6ca41675d2b63453fadd6c412f64fe07f8001549e5a452cf722e81'), 'IncomingNative.lean': ('71211013c077a46744584d95b38434e23a55fc9d', 'research/blueprint/suggested/StableReductionPartII.lean', '/- BEGIN ARCHIVED CHECKED SECTION HOM COCHAINS\n', 'END ARCHIVED CHECKED SECTION HOM COCHAINS -/', '690e22fed4c79b7b46fd8c3e72ae33da6c9f00ce0eeea7498eb0daf18971eeb6')}
ref,path,start,end,expected=ARTIFACTS[sys.argv[1]]
url="https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/"+ref+"/"+path
with urllib.request.urlopen(url,timeout=45) as response:raw=response.read().decode()
assert raw.count(start)==raw.count(end)==1
source=raw.split(start,1)[1].split(end,1)[0]
assert hashlib.sha256(source.encode()).hexdigest()==expected
sys.stdout.write(source)
```

Public HTTP extraction is exercised byte-for-byte for all five sources, and the recovered validator is run on the final overlays before the PR opens. The recovered Native.lean/Canonical.lean are identical to the sources of the compiler receipts above. Scratch is deleted after submission; the immutable public sources preserve the checks.

---

## Retained incoming handoff

# StableReductionPartII: native section Hom cochains

Codex — codex-J6LwjP; 2026-10-03. Refs #3342. Winning claim5964320349 and bot confirmation5964321771 were read before work; the entire issue was reread after confirmation. Mathematical base f3a91b5086a592635ea3821b13ff36dc543fb313; publication base 84e885b95c0ad537079c0fe6fdbb122c8020ac33. Only the five authorized deliverables and owned scratch sources were edited.

## Outcome and limits

For the actual polynomial section model over every commutative A and every A-module M, both alternating R-linear Hom sequences into R⊗_A M now have native cochain-complex forms in ModuleCat R. The ideal phase starts with precomposition by Ψ, and the dual phase with Φ, following the actual signed P_J/P_D kernels. Successive differentials are exact and square to zero. The native positive cohomology objects are zero. Degree-zero cycles factor through the actual ideal or dual presentation, as native Hom left exactness requires.

These are actual Hom maps and native module-category homology objects; the coordinate equivalence is used only to transport the existing universal transpose-tensor exactness. There is no coefficient-flatness assumption. Nine named tests check the two signed columns, two-periodicity, actual successor differential, nonflat ℤ/2 coefficients, a nonreduced ℤ/4 base, the zero ring and both degree-zero augmentation cycles. The successor comparison uses heterogeneous equality so the canonical admitted construction can state it independently of its opaque body; the native object formula identifies both source and target with the actual Hom module.

The native augmented finite-free projective resolutions and their Hom/Ext comparison remain required. This checkpoint does not claim higher Ext vanishing, relative stable reflexivity, completed-local results or family descent. No geometric noetherian/unit-discriminant hypothesis is removed from inherited geometric contracts.

Sixteen new nodes: two constructions and14 lemmas;12 new API items and nine tests. All258 incoming mathematical contracts remain;257 complete node objects are identical. Only the existing dual-section-ideal node appends three prerequisites and one proof step. All140 incoming baseline rows remain intact;12 fresh native references are appended. The entire incoming reader and handoff are retained, and the canonical sketch retains the entire incoming source behind three new pinned imports.

Final packet:274 nodes ({'definition': 8, 'lemma': 147, 'theorem': 63, 'construction': 55, 'application': 1}), 236 API items overall (235 on definitions/constructions), 242 test entries overall (223 on definitions/constructions),35 planets,152 baseline declarations,14 gaps,135 requests, eight partial stages and no closed stages. The reserved general moduli-curves key, six key consumers and21 routed Yuan/DGH items are unchanged. All implementationStatus values remain unchecked.

## Exact checks

Native proof: 3453 lines,118 examples,216 axiom audits; zero errors, warnings or admissions. All reported axioms are ordinary propext/Classical.choice/Quot.sound. Source SHA256 690e22fed4c79b7b46fd8c3e72ae33da6c9f00ce0eeea7498eb0daf18971eeb6; normalized diagnostics SHA256 7e75a39249dbe07e43fb0bda31cf285171cda4052b784438bd1d679300564c0e. Time 26.71s; peak RSS 3517056KiB. Its entire3246-line incoming checked native source is retained byte-for-byte behind three new imports, with incoming SHA25603240fdfbc18f39e88621d22efed1d0a0433df5feb3beb7162f630090c77515d.

Full canonical suggested file: 2928 lines,180 examples; zero errors,438 expected admission warnings and no other warnings. Source SHA256 75072a34103f2da87b6fabf65f58c708e3e54f3bdf06a03ab1e629913b6a5d4b; normalized diagnostics SHA256 50f17c9d59e8b71f814edae7f8e29599126e4ab21375a3cd0d9faa0ee265eb4d. Time 25.61s; peak RSS 3313884KiB. This is the entire admitted §13 sketch, not a library implementation claim.

Both compiled serially against the existing pinned Mathlib artifacts at082e2d37e8b0463410cdb532e111cd43d5a66174. Recorded Tau Ceti source/index pin is f790474821cf4256814db967cb154e7af3d0c369; these files use only individual Mathlib imports. Available memory was at least36GiB before each accepted compile. No project setup, library build, cache download, installation or language server was used. No compiler process remains after submission.

The actual immutable packet checker, intake/private-path checks, incoming preservation,16 public signature comparisons, nine named test comparisons and actual atlas assembler pass. Graph: 3050 stage vertices/8750 edges; 274 owned declarations/642 edges; 3289 combined vertices/9506 edges. Every graph is acyclic. No unresolved prerequisite; all81 required stage pairs are reachable. Own skipped/pending links are empty; stage edges and other roadmaps’ skipped/pending links match the incoming control.

All21 selected owner, governing, library-audit, accepted audit-review, key, source-route, parent-stage and validator input blobs match between the mathematical and publication bases. Unrelated main changes are preserved. The handoff archive includes the exact verifier and its immutable reader, which use the actual assembly/checker code without copying a repository snapshot.

## Reading and provenance

Fresh primary reading: arXiv:1106.1588v2 introduction/Main Lemma, complete §3 Key Example including Proposition3.1/Corollary3.2 and §4 proof. Downloaded primary HTML SHA2562c89ce4072046d546ff9256a5c64cd488f41026c561f8858f4a78ce14c21d685. No fresh whole-paper/PDF, Appendix/Ile or Eisenbud proof audit is claimed. The arbitrary-ring native Hom cochain calculation is an authored deduction from the inherited actual polynomial model and universal transpose-tensor calculations.

Fresh pinned statements: native CochainComplex.of and successor morphism, HomologicalComplex/ExactAt and native homology vanishing, short-complex R-module exactness, native linear-Hom left exactness, ModuleCat object/morphism wrappers and Hom coordinate ladders. No generic Hom or complex theory is replanned.

The current whole issue, incoming handoff, eight stage contracts, reserved key/consumer contracts, all12 parent library-audit target/verdict rows and accepted REV-AUDIT-02 report were read. No link-map entry mentions StableReductionPartII. Governing protocol and upstream-document readings made earlier in this continuous worker session remain under their original scope. All inherited acquisition, printed-page, source-error, compiler and graph receipts remain historical; they are not silently recertified by this checkpoint.

## Where to resume

1. Construct the actual augmented finite-free R-chain resolutions of J and D, with the signed P_J/P_D augmentations and alternating differentials. Use native projectivity and identify native Hom applied to them with these cochain complexes. Establish the actual higher Ext comparison and vanishing; the positive cohomology theorem alone is not the native Ext identification.
2. Read and apply the precise Knudsen Appendix/Ile relative stable-reflexivity theorem and two-base Proposition6 completion interface, including the Proposition7 exercise. Flat ambient extension alone does not supply coefficient-base completion or the geometric Main Lemma.
3. Finish the pointed completed-local hull, chart comparisons, family/sheaf descent, arbitrary-base approximation and every inherited MC.0–MC.7 source/supplier obligation.

No new supplier request or planet is introduced. Status remains partial.

## Public recovery

The final handoff names the immutable public source archive. Recover Native.lean, Canonical.lean, verify.py and immutable_view.py from its marked blocks. The incoming native source remains publicly recoverable from76fa936508b28cd0e592b0fd580ae460bda613cf, CHECKED COEFFICIENT MODULE HOM markers, with SHA25603240fdfbc18f39e88621d22efed1d0a0433df5feb3beb7162f630090c77515d.

In a reader-supplied scratch directory, retain these four recovered sources and PriorNative.lean; overlay the final five deliverables in roadmaps/, packets/, readmes/, suggested/ and handoff/ subdirectories. After serial pinned compilations and a memory check, retain native.log and canonical.log, including the Elapsed/peak resource line. Run the recovered verifier with TAUCETI_REPO pointing to the shared read-only clone, TAUCETI_BASELINE to the pinned declarations.tsv file and P8_VALIDATE_BASE to 84e885b95c0ad537079c0fe6fdbb122c8020ac33. The ordinary CLI packet checker instead takes TAUCETI_BASELINE as the baseline directory. The immutable reader reads Git blobs and overlays only the five files; it never writes the repository or creates a snapshot.

The exact guard paths are: research/blueprint/roadmaps/StableReductionPartII.json, research/blueprint/packets/StableReductionPartII.json, research/blueprint/readmes/StableReductionPartII.md, research/blueprint/suggested/StableReductionPartII.lean, research/blueprint/handoff/DESIGN-StableReductionPartII.md, research/blueprint/WORKERS.md, research/blueprint/PROTOCOL.md, research/blueprint/UPSTREAM_GUIDE.md, research/expansion/PROTOCOL.md, data/library-coverage.json, research/blueprint/reviews/REV-AUDIT-02.md, data/keydefs/KEYDEF-algebraicgeometry.json, research/blueprint/papers/PAPER-YUAN-26.result.json, research/blueprint/papers/PAPER-DIMITROV-GAO-HABEGGER-21.result.json, research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_StableReduction.json, research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_JacobianChallenge.json, scripts/check_blueprint.py, scripts/build.py, scripts/blueprints.py, research/blueprint/intake.py, research/blueprint/reserved-ids.json.

---

## Retained incoming handoff

# StableReductionPartII: coefficient-module tensor–Hom checkpoint

Codex — codex-a71f92; 2026-10-03. Refs #3342. Winning claim5963812041 and our bot confirmation5963813232 were read before work. Mathematical input base aeae47c9a675600efe5c88a0b7ab4cc82b9d13f3. The shared clone was used read-only; only the five authorized proposal files and owned scratch sources were edited.

## Outcome and limits

The actual polynomial model over any commutative A has both canonical R-linear isomorphisms

- Hom_R(J,R)⊗_A M ≃ Hom_R(J,R⊗_A M);
- J⊗_A M ≃ Hom_R(Hom_R(J,R),R⊗_A M),

for every A-module M, without M-flatness. They use the inherited left R-action, the signed actual P_J and P_D presentations and the previously checked coefficient-universal transpose complexes. Both are natural for arbitrary A-linear coefficient maps. With M=A, native right-unit equivalences identify the first map with the identity of the actual dual and the second with native bidual evaluation.

The checkpoint adds32 declaration-sized nodes (six constructions,26 lemmas),18 promoted API items and24 named tests. Of226 incoming nodes,225 are whole-object identical. The remaining dual-section-ideal node preserves all statement, hypothesis, API, test, acceptance, source and ownership contracts and appends only five prerequisites and one proof step. Baseline123-prefix entries are unchanged and17 freshly read native references are appended. All135 requests,14 gaps,35 planets, six key-definition consumer contracts and21 routed Yuan/DGH items remain; one existing gap detail and the MC.2 remaining list gain explicit clarification, not closure.

Final packet:258 nodes, eight definitions,53 constructions,133 lemmas,63 theorems and one application;224 API entries overall (223 on definitions/constructions);233 unit-test entries overall (214 on definitions/constructions);35 planets;140 baseline declarations;14 gaps,135 open requests; eight partial stages, zero closed stages. Every implementationStatus remains unchecked.

The reserved StableReductionPartII:key/moduli-curves node is unchanged: it still owns the general smooth/stable ordered pointed-curve groupoid, not only this affine section model, and keeps stack/coarse/fine-level distinctions.

## Exact checks

The entire current2809-line suggested file imports only individual Mathlib modules and elaborates against the existing exact pinned Mathlib build: zero errors,413 expected declaration-admission warnings and no other warnings;171 examples. Source SHA256 cee923e71ffc381319f1ca3080b23fcb129e7bbe1b6738cbce9e4fe487ecc5d9. Normalized diagnostics SHA256 49e023599443b57ccbae7418a1794846216d549060c548a9bbdb7fbe03e8fde9. Wall time24.61s, peak RSS3170080KiB. This is the full §13 admitted sketch, not a proof or library implementation claim.

The separate3246-line native proof preserves the whole predecessor2586-line source, adding only one pinned import and the authored continuation. It has zero errors, warnings and admissions;109 examples;200 axiom audits, all limited to ordinary propext/Classical.choice/Quot.sound. Source SHA256 03240fdfbc18f39e88621d22efed1d0a0433df5feb3beb7162f630090c77515d. Normalized diagnostics SHA256 c3689dc9c2d9fa4e7542d28350ffb634b35f3eb7c027d2fe9c01df9a92a2760f. Wall time25.61s, peak RSS3368176KiB. Of34 new native declarations,32 correspond to new nodes; the other two merely abbreviate the existing native finite-product tensor/Hom coordinates and their pure-tensor evaluation, and are recorded as baseline adapters.

Before each single compiler invocation, available memory was at least42GiB. No library setup, update, cache download, build or language server was run. Mathlib is 082e2d37e8b0463410cdb532e111cd43d5a66174; recorded Tau Ceti baseline is f790474821cf4256814db967cb154e7af3d0c369. No Tau Ceti import was needed by these signatures, so the compiler receipt certifies the exact Mathlib artifacts, not a rebuilt Tau Ceti checkout.

The immutable packet checker, five-path intake/private-path check, mathematical preservation/header/test parity checks and actual atlas assembly are recorded with the final graph receipt. The actual assembler is run against immutable Git inputs with only these five overlays; no repository snapshot or substitute graph is used.

## Reading and provenance

Fresh primary reading: arXiv:1106.1588v2 introduction/Main Lemma, complete §3 Key Example through Proposition3.1/Corollary3.2 proofs, and §4 proof. Downloaded HTML SHA2562c89ce4072046d546ff9256a5c64cd488f41026c561f8858f4a78ce14c21d685. No fresh whole-paper, visual PDF, Appendix/Ile, Bourbaki or Eisenbud proof audit is claimed. The printed noetherian and unit-discriminant geometric hypotheses are retained; arbitrary-ring polynomial Hom exchange is an authored signed-presentation deduction.

Fresh pinned library statements include heterobasic lift/map/ext/unit, finite-product tensor and finite-free Hom coordinates, Hom precomposition, right-tensor surjectivity/exactness commutation and scalar restriction. The near matches in Contraction.lean require finite projectivity over the same tensor ring, while FinitePresentation.isBaseChange_map needs a flat ambient algebra; neither supplies the required coefficient-module theorem. The generic Matrix.toLin_transpose interface is reused conceptually, not replanned as a new matrix-dual theory.

Open Mathlib PR8495 was inspected: it is categorical Tensor-Hom adjunction, not the actual section-ideal arbitrary-coefficient Hom isomorphism. The full Apr23 2025 tensor-maps Zulip thread was read; native tensor/linear-map vocabulary is retained. No external code was copied. The governing documents, current whole issue, latest handoff, eight stage contracts, full reserved key definition, consumer coverage, routed Yuan/DGH briefs and accepted REV-AUDIT-02 report were read. The parent stable-reduction scope and relevant layer1/3 audit retain nodal-family/sheaf/contraction inputs as imports rather than duplicating them.

All preceding paper acquisition, printed-page, source-error, compiler and graph receipts remain historical under their original scopes. Fresh receipt metadata is appended rather than silently recertifying those checks.

## Where to resume

1. Identify the actual finite-free R-resolutions with their alternating Φ/Ψ differentials and P_J/P_D augmentations. Instantiate native Hom cochain complexes with coefficient target R⊗_A M, use the coefficient transpose bridge to identify differentials, and establish higher Ext vanishing for both J and D. Raw universal matrix exactness plus Hom exchange is not itself that native resolution/Ext comparison.
2. Read and use the exact Knudsen Appendix/Ile relative stable-reflexivity theorem. Prove/import Proposition6's different base/source completion comparison and account for Proposition7's exercise; the existing flat ambient R→B completion adapters do not imply these.
3. Finish the pointed completed-local hull, smooth/node chart comparison, family/sheaf descent and arbitrary-base approximation. Then discharge the listed geometric MC.0–MC.7 and source/supplier obligations. All inherited targets remain binding.

No new supplier request or planet was needed. Packet status remains partial. The proof source and replayable immutable checker are archived at a public immutable revision retained as a parent of the final submission; the final canonical suggested file remains entirely an admitted blueprint sketch.

## Public recovery and graph receipt

Final validation base 14122f5410315c7254b29874b6b80bf3f7bdd159. Twenty-one scoped owner/governing/audit/key/source-route/validator input blobs are byte-identical to the mathematical base. Unrelated main changes are preserved by the final first-parent tree.

Actual atlas assembly:3050 stage vertices/8750 edges;258 owned declarations/612 prerequisite edges (control226/535);3273 combined vertices/9476 edges. All graphs are acyclic. All258 reachable declarations are owned here; no unresolved or external declaration prerequisites. All81 required stage pairs are reachable. Own skipped/pending links are empty; stage edges and unrelated skipped/pending links match the original control. The final proposal is checked with the actual assembler, not a synthetic substitute.

Immutable public archive: [76fa936508b28cd0e592b0fd580ae460bda613cf](https://github.com/CBirkbeck/tauceti-explorer/commit/76fa936508b28cd0e592b0fd580ae460bda613cf), retained as the additional parent of the final canonical submission.

- [Proof/sketch source archive](https://github.com/CBirkbeck/tauceti-explorer/blob/76fa936508b28cd0e592b0fd580ae460bda613cf/research/blueprint/suggested/StableReductionPartII.lean): the checked source lies between the CHECKED COEFFICIENT MODULE HOM markers; the exact canonical admitted source lies between the CANONICAL COEFFICIENT MODULE HOM markers.
- [Replayable validator and immutable reader](https://github.com/CBirkbeck/tauceti-explorer/blob/76fa936508b28cd0e592b0fd580ae460bda613cf/research/blueprint/handoff/DESIGN-StableReductionPartII.md): use the COEFFICIENT MODULE HOM VALIDATOR and IMMUTABLE READER markers.
- The predecessor native source is recovered from ca039d9d67f5465b9218b5e8d0d171ec85fe6b57 using its CHECKED SECTION BIDUAL EVALUATION markers, with SHA256de4a6b846c7e33b576a7e9119947292ab5bd513e70b67c094b8a4303627904e5.

Validator SHA256ea180d5aa51c1725dd999a65f2c47acd835010ee6dc85cf928fea2497216f41d; immutable-reader SHA2568e881b1dd24943d907fc9be9ca0ed730c8afd819257b4d72535f0e63b15829a8. Public fetch/extraction byte parity and read-only HTTP recovery were checked for all five source artifacts. The publicly recovered3246-line native and2809-line canonical sources were separately re-elaborated with the existing pinned build and the same diagnostic bounds; the archived verifier was rerun against the final five overlays.

Replay in a reader-supplied scratch directory and an existing pinned build, without making a repository snapshot. Recover Native.lean, Canonical.lean, InheritedNative.lean, verify.py and immutable_view.py with the read-only emitter below. Load the five proposal overlays into their relative roadmap/packet/readme/suggested/handoff paths there, using the final PR revision. After single-process compilations with a memory check, run the recovered verifier with TAUCETI_REPO pointing to the shared read-only clone, TAUCETI_BASELINE to the pinned declaration index and P8_VALIDATE_BASE to the final validation base above. Native.log/Native.resources and Canonical.log/Canonical.resources are the corresponding actual compiler diagnostics.

The recovery emitter writes nothing; callers choose how to retain emitted source in their own scratch space.

```python
"""Read-only public source recovery: emits one verified artifact; never writes."""
import hashlib,sys,urllib.request
REPO="CBirkbeck/tauceti-explorer"
ARCHIVE="76fa936508b28cd0e592b0fd580ae460bda613cf"
LEAN="research/blueprint/suggested/StableReductionPartII.lean"
HANDOFF="research/blueprint/handoff/DESIGN-StableReductionPartII.md"
ARTIFACTS={
"Native.lean":(ARCHIVE,LEAN,"/- BEGIN ARCHIVED CHECKED COEFFICIENT MODULE HOM\n","END ARCHIVED CHECKED COEFFICIENT MODULE HOM -/","03240fdfbc18f39e88621d22efed1d0a0433df5feb3beb7162f630090c77515d"),
"Canonical.lean":(ARCHIVE,LEAN,"/- BEGIN ARCHIVED CANONICAL COEFFICIENT MODULE HOM\n","END ARCHIVED CANONICAL COEFFICIENT MODULE HOM -/","cee923e71ffc381319f1ca3080b23fcb129e7bbe1b6738cbce9e4fe487ecc5d9"),
"InheritedNative.lean":("ca039d9d67f5465b9218b5e8d0d171ec85fe6b57",LEAN,"/- BEGIN ARCHIVED CHECKED SECTION BIDUAL EVALUATION\n","END ARCHIVED CHECKED SECTION BIDUAL EVALUATION -/","de4a6b846c7e33b576a7e9119947292ab5bd513e70b67c094b8a4303627904e5"),
"verify.py":(ARCHIVE,HANDOFF,"# BEGIN ARCHIVED COEFFICIENT MODULE HOM VALIDATOR\n","# END ARCHIVED COEFFICIENT MODULE HOM VALIDATOR\n","ea180d5aa51c1725dd999a65f2c47acd835010ee6dc85cf928fea2497216f41d"),
"immutable_view.py":(ARCHIVE,HANDOFF,"# BEGIN ARCHIVED COEFFICIENT MODULE HOM IMMUTABLE READER\n","# END ARCHIVED COEFFICIENT MODULE HOM IMMUTABLE READER\n","8e881b1dd24943d907fc9be9ca0ed730c8afd819257b4d72535f0e63b15829a8")}
ref,path,start,end,expected=ARTIFACTS[sys.argv[1]]
url="https://raw.githubusercontent.com/"+REPO+"/"+ref+"/"+path
with urllib.request.urlopen(url,timeout=45) as response:raw=response.read().decode()
assert raw.count(start)==raw.count(end)==1
source=raw.split(start,1)[1].split(end,1)[0]
assert hashlib.sha256(source.encode()).hexdigest()==expected
sys.stdout.write(source)
```

Only the five authorized files are in the final first-parent diff. After submission, owned scratch sources/logs are removed recoverably; public immutable artifacts retain everything needed to reproduce the checks.


## Immutable source archive for this continuation

Public archive [71211013c077a46744584d95b38434e23a55fc9d](https://github.com/CBirkbeck/tauceti-explorer/commit/71211013c077a46744584d95b38434e23a55fc9d), retained as a parent of the final canonical submission. Exact Native.lean and Canonical.lean sources are marked in [the suggested-file archive](https://github.com/CBirkbeck/tauceti-explorer/blob/71211013c077a46744584d95b38434e23a55fc9d/research/blueprint/suggested/StableReductionPartII.lean); the exact validator and immutable reader are marked in [the handoff archive](https://github.com/CBirkbeck/tauceti-explorer/blob/71211013c077a46744584d95b38434e23a55fc9d/research/blueprint/handoff/DESIGN-StableReductionPartII.md).

The read-only emitter below recovers and verifies any of the five artifacts. The final canonical source is restored byte-for-byte; proof sources remain inert at the public archive. Public fetch/extraction checks and the final five-file validator are recorded before submission. Owned scratch artifacts are removed after the PR opens; the public sources supply the full replay.

```python
"""Read-only public source recovery: writes nothing; emits a verified artifact."""
import sys,hashlib,urllib.request
ARTIFACTS={'Native.lean': ('71211013c077a46744584d95b38434e23a55fc9d', 'research/blueprint/suggested/StableReductionPartII.lean', '/- BEGIN ARCHIVED CHECKED SECTION HOM COCHAINS\n', 'END ARCHIVED CHECKED SECTION HOM COCHAINS -/', '690e22fed4c79b7b46fd8c3e72ae33da6c9f00ce0eeea7498eb0daf18971eeb6'), 'Canonical.lean': ('71211013c077a46744584d95b38434e23a55fc9d', 'research/blueprint/suggested/StableReductionPartII.lean', '/- BEGIN ARCHIVED CANONICAL SECTION HOM COCHAINS\n', 'END ARCHIVED CANONICAL SECTION HOM COCHAINS -/', '75072a34103f2da87b6fabf65f58c708e3e54f3bdf06a03ab1e629913b6a5d4b'), 'verify.py': ('71211013c077a46744584d95b38434e23a55fc9d', 'research/blueprint/handoff/DESIGN-StableReductionPartII.md', '# BEGIN ARCHIVED SECTION HOM COCHAIN VALIDATOR\n', '# END ARCHIVED SECTION HOM COCHAIN VALIDATOR\n', '370c2aa47fdf16ceac5f8896dd2216ecda874f0d662582bb697a18ad9bd4ac49'), 'immutable_view.py': ('71211013c077a46744584d95b38434e23a55fc9d', 'research/blueprint/handoff/DESIGN-StableReductionPartII.md', '# BEGIN ARCHIVED SECTION HOM COCHAIN IMMUTABLE READER\n', '# END ARCHIVED SECTION HOM COCHAIN IMMUTABLE READER\n', '8894c75fe2998c5a466e9b83bd9e664d1e2f4b6ce5931af91f2c9ac8b793de73'), 'PriorNative.lean': ('76fa936508b28cd0e592b0fd580ae460bda613cf', 'research/blueprint/suggested/StableReductionPartII.lean', '/- BEGIN ARCHIVED CHECKED COEFFICIENT MODULE HOM\n', 'END ARCHIVED CHECKED COEFFICIENT MODULE HOM -/', '03240fdfbc18f39e88621d22efed1d0a0433df5feb3beb7162f630090c77515d')}
ref,path,start,end,expected=ARTIFACTS[sys.argv[1]]
url="https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/"+ref+"/"+path
with urllib.request.urlopen(url,timeout=45) as response:raw=response.read().decode()
assert raw.count(start)==raw.count(end)==1
source=raw.split(start,1)[1].split(end,1)[0]
assert hashlib.sha256(source.encode()).hexdigest()==expected
sys.stdout.write(source)
```

