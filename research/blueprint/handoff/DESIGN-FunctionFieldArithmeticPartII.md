# FunctionFieldArithmeticPartII — factorial root colimit checkpoint

Worker: Codex — codex-7e92bd. Date: 2026-10-03. Refs #3403. Claim comment 5963301931, confirmed by bot 5963303097; the whole issue was read before and after confirmation. Own branch codex-7e92bd-function-field-roots-loop; mathematical base 82974c4339c719693457ae009b07cbee4eed5772.

## Result and boundary

Thirteen new declaration-sized nodes construct the actual factorial algebra colimit and its finite inclusions, transition/root-power equations, injectivity, finite representatives, root-value extensionality, specified categorical colimit cocone and universal compatible-root lift. The packet now has 194 unchecked nodes: 9 definitions, 34 constructions, 103 lemmas, 37 theorems, 10 comparisons and 1 application. There are 152 API records (150 required), 170 test records (146 required), 171 baseline declarations and 39 planets. All ten stages remain partial. The eight gaps, thirteen requests, both routed paper inventories, source issues and root-stack ownership are unchanged.

All 181 prior statement contracts and 180 complete prior node objects are unchanged. Only the old infinite-affine-quotient object gains six prerequisites and a refined first proof step. The existing roadmap definition is byte-for-byte unchanged. The old reader is retained verbatim below the new section. Prior receipt provenance remains in the packet continuation history and the [immutable incoming handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/82974c4339c719693457ae009b07cbee4eed5772/research/blueprint/handoff/DESIGN-FunctionFieldArithmeticPartII.md); that historical handoff has not been re-audited in its entirety.

The checked mathematical model uses the existing DirectLimit of the exact B_((i+1)!) algebras. Native directed-system fields come from the previously checked fixed-index transitions. Injectivity factors N=nm, uses the existing faithful-flat coefficient algebra and its faithful scalar action, then applies the existing insertion-injectivity theorem. The universal lift comes from the actual AdjoinRoot quotient maps, compatible on the roots; direct-limit extensionality and quotient extensionality prove uniqueness. The native Cocone/IsColimit result compares this carrier with the exact predecessor factorial functor. Explicit point and leg APIs keep the carrier visible when planning bodies are admitted.

The F₂, f=0 tests prove a nonzero square-zero element survives in the colimit. Other tests compute the 2!-to-3! root equation, all coefficients over Z/4Z with parameter 2, the zero coefficient ring, actual categorical colimits over both zero/wild rings, cocone leg zero, unit and zero root evaluations, and recovery of the identity from universal roots. The zero-root evaluation kills that nilpotent; its existence does not contradict injectivity of the chart inclusions.

Still required: compare the factorial colimit with the all-positive-divisibility chart colimit; reindex coherent root-object groupoids; construct the diagonalizable grading/action and transport the affine scheme limit; prove the root-specific fpqc frame-torsor and quotient groupoid comparisons. The TOWER-AFF, KUMMER-FINITE and TOWER-TYPING boundaries, DVR/Kummer comparison and roots-of-2 non-fppf example retain their obligations. No ring-colimit result closes those geometric contracts. The remaining YZ Appendix A and AV route closure/source coverage work remains exactly as recorded in the packet.

## Reading and prior art

Fresh TV17 reading uses arXiv:1410.1164v2, PDF SHA-256 92a90d1e3d9ac46e17de8cc9d9524c1621d5e2a8caea7938de61d6503ec2a6c2. Printed pp.14–17 were inspected through the readable PDF: local charts, full Lemma 3.7, Definition 3.8, full Proposition 3.10 proof and Corollary 3.13, and the logarithmic-point/reduced-fibre discussion. The colimit API and explicit nilpotent test are authored rank-one algebraic specializations, not literal printed theorem claims. Historical YZ/AGV/B24/AV readings and erratum receipts retain their original worker provenance.

The reviewed FA.0–FA.7 library audit and REV-AUDIT-20 were read; no PartII audit row exists. Fresh nearby upstream reading was scoped to the AlgebraicCurves and AdicSpaces scope/ownership/convention sections. The existing curve/function-field and generic scheme/stack suppliers are imported. The new baseline declaration statements and ambient hypotheses were opened at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Native DirectLimit algebra instances, the algebra of/lift/hom_ext API, quotient representatives and insertion injectivity, faithful-flat scalar faithfulness, algebra-map injectivity, Cocone and IsColimit fields were inspected. No new generic colimit carrier or competing stack type is introduced.

Bounded open-PR searches were CommAlgCat colimit, root stack and DirectLimit algebra. The first two returned no hits. The last included [PR #39341](https://github.com/leanprover-community/mathlib4/pull/39341), inspected at head 23d06841a3fa28f677679cbc2e98788eda9bb808: full body, one-file list and entire diff, 100 additions and 3 deletions. It extends star-algebra direct limits; the ordinary algebra infrastructure needed here is already at the pin. No PR code was copied. The [human Zulip discussion of DirectLimit versus categorical colimits](https://leanprover-community.github.io/archive/stream/113489-new-members/topic/Q.2FZ.20as.20colimit.20of.20Z.2FnZ.html), August 10–11 2025, was read as API design context. The checked root-specific Cocone/IsColimit bridge supplies the concrete comparison used here.

## Lean evidence and recovery

The predecessor 2268-line native proof from codex-J6LwjP is included byte-for-byte after the two new imports. Its SHA-256 is 772b52d1390997359924243d5742385771d733fa6c2b2666d393c3d05d31306d, recovered from archive c3a84cdc7ab042f6cef2ac1f585800474fcf3db9. Its finite-free transition proof in turn credits codex-rtOQ9t. These inherited portions were reused and rerun; fresh proof reading focused on the root relations, finite faithful-flat transition, fixed-index maps and factorial functor used in this continuation.

The complete new proof is preserved in an inert Lean comment at public ancestor [8145b20f5378b18ddb38cbf949c129669ff5975f](https://github.com/CBirkbeck/tauceti-explorer/blob/8145b20f5378b18ddb38cbf949c129669ff5975f/research/blueprint/suggested/FunctionFieldArithmeticPartII.lean), between BEGIN/END ARCHIVED CHECKED FACTORIAL ROOT COLIMIT. The final file removes the archive and retains admitted planning bodies. Eighteen new declaration/instance headers and eleven new example headers match the checked proof exactly; the native DirectLimit carrier abbreviation is retained as type plumbing.

The existing build with exactly pinned Mathlib was used serially after checking at least 48 GiB available for the final runs. Both commands were bounded by 1200 seconds. No Lake environment, library build, cache download or language server was started. Run the recovered files with lake env lean in an existing build at the recorded pins. The shared checkout HEAD is cf386627e9176a3827c1a5fe804989fd94a4d216, while its Mathlib dependency is exactly the recorded pin; both checked files import only Mathlib. Tau Ceti statement auditing uses the separate f790474 baseline. The complete geometric file remains uncompiled: required TauCeti.AlgebraicGeometry.LineBundle.TensorProduct and TauCeti.Algebra.AlgebraicGroup.RootsOfUnity.Basic compiled modules are absent. No stand-ins or alternate imported carriers were created.

```json
{
  "Native.lean": {
    "sha256": "05f9e273177e59765f130e85cdcbc9cda298b708db45791ae84697e891215eef",
    "lines": 2527,
    "examples": 95,
    "audits": 86,
    "errors": 0,
    "admissionWarnings": 0,
    "otherWarnings": 0,
    "sorryAx": false,
    "diagnosticSha256": "1f9674847af60bbae48b2051a1f5efb551b2c6c06c34167e5b57bd9d80ce9043",
    "resource": "elapsed=14.73 maxRSS_KiB=3422728"
  },
  "Sketch.lean": {
    "sha256": "65884f8db54db6f38007109c9fd90f1f67e79729eb04d16aec03bf5ec3a8adc3",
    "lines": 1478,
    "examples": 95,
    "audits": 0,
    "errors": 0,
    "admissionWarnings": 222,
    "otherWarnings": 0,
    "sorryAx": false,
    "diagnosticSha256": "8473678a9c3150484b5139939bc46c50c1c04b6ecae4f10bd97d4dbe558e4136",
    "resource": "elapsed=5.73 maxRSS_KiB=3287084"
  },
  "canonical": {
    "sha256": "432043a35c40292d1d89e0b0a4b840dd62aa731910fc1f82670e4655f1455ef4",
    "lines": 2389,
    "newPublicHeaderParity": 18,
    "newExampleHeaderParity": 11,
    "retainedNativeCarrierAbbreviation": 1,
    "compiled": false,
    "reason": "The existing shared build lacks required TauCeti.AlgebraicGeometry.LineBundle.TensorProduct and TauCeti.Algebra.AlgebraicGroup.RootsOfUnity.Basic modules."
  },
  "sharedBuild": {
    "mathlib": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "checkoutHead": "cf386627e9176a3827c1a5fe804989fd94a4d216",
    "tauCetiImportsInCheckedFiles": 0,
    "tauCetiBaselineForStatementAudit": "f790474821cf4256814db967cb154e7af3d0c369"
  }
}
```

Save the following recovery script in your own on-disk scratch. It writes Native.lean and Sketch.lean in the working directory; run from the final repository tree, or point its final-file read at an exact copy of that tree's suggested file. It uses the public immutable archive and asserts both proof and admitted-fragment hashes.

```python
from pathlib import Path
import hashlib,subprocess
path='research/blueprint/suggested/FunctionFieldArithmeticPartII.lean'
archive='8145b20f5378b18ddb38cbf949c129669ff5975f'
raw=subprocess.check_output(['gh','api','repos/CBirkbeck/tauceti-explorer/contents/'+path+'?ref='+archive,
    '-H','Accept: application/vnd.github.raw'],text=True)
native=raw.split('BEGIN ARCHIVED CHECKED FACTORIAL ROOT COLIMIT\n',1)[1].split('END ARCHIVED CHECKED FACTORIAL ROOT COLIMIT\n',1)[0]
assert hashlib.sha256(native.encode()).hexdigest()=='05f9e273177e59765f130e85cdcbc9cda298b708db45791ae84697e891215eef'
Path('Native.lean').write_text(native)
# Run from the repository root at the final PR tree, or replace this path with the recovered final file.
head=Path(path).read_text()
assert hashlib.sha256(head.encode()).hexdigest()=='432043a35c40292d1d89e0b0a4b840dd62aa731910fc1f82670e4655f1455ef4'
imports='\n'.join(l for l in head.splitlines() if l.startswith('import Mathlib'))
initial=head[head.index('abbrev AffineRing (f : A)'):head.index('-- TauCeti.RootStack.affineCoaction.nativePoint')]
one=head[head.index('-- TauCeti.RootStack.affineCoaction.test_one'):head.index('-- TauCeti.RootStack.affineCoaction.test_sign')]
comparison=head[head.index('section AffineTorsorComparison'):head.index('-- Native acceptance computations')]
own=head[head.index('/-! Native factorial chart diagram continuation'):]
extra=head[head.index('-- Native acceptance computations'):head.index('/-! Native factorial chart diagram continuation')]
finite=head.split('/- BEGIN NATIVE FINITE ROOT TRANSITIONS -/\n',1)[1].split('/- END NATIVE FINITE ROOT TRANSITIONS -/\n',1)[0]
prefix='\nnoncomputable section\nuniverse u\nnamespace TauCeti.RootStack\nvariable {A : Type u} [CommRing A]\nopen scoped TensorProduct\n'
sketch=imports+prefix+initial+one+comparison+extra+'\nnamespace TauCeti.RootStack\nvariable {A : Type u} [CommRing A]\n'+finite+'\nend TauCeti.RootStack\n'+own
sketch=sketch.replace('TauCeti.RootsOfUnityGroup.generator n','Multiplicative.ofAdd (1 : ZMod n)')
assert hashlib.sha256(sketch.encode()).hexdigest()=='65884f8db54db6f38007109c9fd90f1f67e79729eb04d16aec03bf5ec3a8adc3'
Path('Sketch.lean').write_text(sketch)
```

## Graph and preservation verification

The actual packet checker was run with the pinned declaration index: zero errors and warnings. The actual assembler overlays this packet and its unchanged roadmap definition, retaining all other promoted inputs, and compares it with the incoming packet at the publication base after merging origin/main into this own branch. The publication guard verifies all seventeen governing, audit, key-definition, script and own-deliverable inputs unchanged since the mathematical base. No graph output is hand constructed. Stage edges, every other roadmap's skipped/pending links and the own planet count agree with the control. All 54 required stage pairs are reachable; no own skipped/pending links or unresolved nonlibrary prerequisites occur. The stage, own-declaration and combined graphs are acyclic. There are 245 reachable declarations, 51 external to this packet.

```json
{
  "actualAssembler": true,
  "base": "1636db22ab77e42624c42da4706ca8e9e8f28ce0",
  "declarations": 194,
  "ownDeclarations": 194,
  "kinds": {
    "construction": 34,
    "definition": 9,
    "comparison": 10,
    "lemma": 103,
    "theorem": 37,
    "application": 1
  },
  "apiTotal": 152,
  "testsTotal": 170,
  "baseline": 171,
  "planets": 39,
  "gaps": 8,
  "requests": 13,
  "ownSkippedLinks": [],
  "ownPendingLinks": [],
  "stageDAG": {
    "vertices": 3056,
    "edges": 8723,
    "acyclic": true
  },
  "ownDeclarationDAG": {
    "vertices": 194,
    "edges": 401,
    "acyclic": true
  },
  "stagesAndReachableDeclarations": {
    "vertices": 3262,
    "edges": 9529,
    "acyclic": true
  },
  "reachableDeclarations": 245,
  "requiredStagePairs": 54,
  "requiredStagePairsReachable": 54,
  "stageEdgesUnchanged": true,
  "otherSkipsMatchOriginal": true,
  "unchangedNodeObjects": 180,
  "preservedStatements": 181,
  "addedNodes": 13,
  "unresolvedNonlibraryPrerequisites": [],
  "scriptSha256": "cee8a621528215691cb6f3f2095edb0f39df74188cb6c6feaf9028daa2eac014"
}
```

The following read-only assembler and preservation recipe writes only its adjacent receipt JSON. Run from the repository root with this candidate over the recorded base. Its SHA-256 is cee8a621528215691cb6f3f2095edb0f39df74188cb6c6feaf9028daa2eac014. This explicitly checks every prior statement/hypothesis/source/API/test/acceptance contract, all 180 unchanged objects, append-only baseline/history, unchanged closure and route metadata, and all requested stage paths.

```python
import json,sys,subprocess,hashlib,re
from pathlib import Path
from collections import defaultdict,deque,Counter
root=Path.cwd();sys.path.insert(0,str(root/'scripts'));import build
rid='FunctionFieldArithmeticPartII';stem=rid
packetpath='research/blueprint/packets/'+stem+'.json'
base='1636db22ab77e42624c42da4706ca8e9e8f28ce0'
p=json.loads((root/packetpath).read_text())
old=json.loads(subprocess.check_output(['git','show',base+':'+packetpath],text=True))
r=json.loads((root/('research/blueprint/roadmaps/'+rid+'.json')).read_text())
load=build.load_promoted
def assemble(packet):
    def overlay(*a,**k):
        ps,ds,defs=load(*a,**k)
        return ([(n,v) for n,v in ps if n!=stem]+[(stem,packet)],
            {**ds,stem:'research/blueprint/readmes/'+stem+'.md'},
            [v for v in defs if v['id']!=rid]+[r])
    build.load_promoted=overlay
    return build.assemble(require_distances=False)[0]
a=assemble(p);control=assemble(old)
def dag(vertices,edges):
    edges=set(edges);vertices=set(vertices)|{x for e in edges for x in e}
    following=defaultdict(set);indegree=dict.fromkeys(vertices,0)
    for s,t in edges:following[s].add(t);indegree[t]+=1
    q=deque(v for v in vertices if not indegree[v]);seen=[]
    while q:
        v=q.popleft();seen.append(v)
        for w in following[v]:
            indegree[w]-=1
            if not indegree[w]:q.append(w)
    assert len(seen)==len(vertices),('cycle',sorted(v for v in vertices if indegree[v])[:10])
    return {'vertices':len(vertices),'edges':len(edges),'acyclic':True}
se={(e['source'],e['target']) for e in a['stageEdges']}
ce={(e['source'],e['target']) for e in control['stageEdges']}
assert se==ce
stageids={s['id'] for s in a['stages']}
own={n['id']:n for n in p['nodes']}
oe={(dep,n['id']) for n in own.values() for dep in n.get('prerequisites',[]) if dep in own}
stageDAG=dag(stageids,se);ownDAG=dag(own,oe)
allnodes=dict(own)
for folder in ('data/decompositions','data/blueprints','research/blueprint/packets'):
    for path in sorted((root/folder).glob('*.json')):
        for n in json.loads(path.read_text()).get('nodes',[]):allnodes.setdefault(n['id'],n)
used=set(own);todo=list(own)
while todo:
    v=todo.pop()
    for d in allnodes[v].get('prerequisites',[]):
        if d in allnodes and d not in used:used.add(d);todo.append(d)
unresolved=[]
for v in used:
    for dep in allnodes[v].get('prerequisites',[]):
        if dep not in stageids and dep not in used and (not dep.startswith(('mathlib:','tauceti:')) or dep.startswith('tauceti:TauCetiRoadmap/')):unresolved.append((v,dep))
assert not unresolved,unresolved
edges=set(se)
for v in used:
    n=allnodes[v];parent=n.get('parentStageId')
    if parent:edges.add((parent,v))
    for d in n.get('prerequisites',[]):
        if d in stageids or d in used:edges.add((d,v))
for request in p['requests']:
    for v in request['neededBy']:edges.add((request['supplier'],v))
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
    for d in n.get('prerequisites',[]):
        if d in stageids and d not in allnodes and d!=stage_of(n['id']):pairs.add((d,stage_of(n['id'])))
for req in p['requests']:
    for v in req['neededBy']:
        source=stage_of(req['supplier']);target=stage_of(v)
        if source!=target:pairs.add((source,target))
missing=[(s,t) for s,t in sorted(pairs) if not reachable(s,t)]
assert not missing,missing
ar={r['id']:r for r in a['roadmaps']};cr={r['id']:r for r in control['roadmaps']}
assert ar[rid]['blueprint']['declarations']==cr[rid]['blueprint']['declarations']+13
assert ar[rid]['blueprint']['planets']==cr[rid]['blueprint']['planets']
assert ar[rid]['blueprint']['skippedLinks']==cr[rid]['blueprint']['skippedLinks']
assert not ar[rid].get('pendingLinks')
assert all(ar[x].get('pendingLinks')==cr[x].get('pendingLinks') for x in cr)
assert all(ar[x].get('blueprint',{}).get('skippedLinks')==cr[x].get('blueprint',{}).get('skippedLinks') for x in cr)
for key in ('sourceIssues','requests','coverage','gaps','restructure','sourceCoverage','sourceVersions','auditEvidence','continuationBoundary','continuationCorrections'):
    assert p[key]==old[key],key
assert p['gaps'][1:]==old['gaps'][1:]
assert [(c['stageId'],c['status']) for c in p['coverage']]==[(c['stageId'],c['status']) for c in old['coverage']]
assert len(p['gaps'])==len(old['gaps'])
assert p['baseline']['declarations'][:len(old['baseline']['declarations'])]==old['baseline']['declarations']
on={n['id']:n for n in old['nodes']}
for key in old:
    if key not in ('nodes','baseline','summary','continuationHistory'):assert p[key]==old[key],key
assert p['continuationHistory'][:len(old.get('continuationHistory',[]))]==old.get('continuationHistory',[])
for id,n in on.items():
    for key in ('id','kind','statement','hypotheses','sources','implementationStatus','uses'):
        assert own[id].get(key)==n.get(key),(id,key)
    assert all(x in own[id].get('prerequisites',[]) for x in n.get('prerequisites',[]))
    assert all(t in own[id].get('tests',[]) for t in n.get('tests',[]))
    assert all(x in own[id].get('api',[]) for x in n.get('api',[]))
    assert all(x in own[id].get('acceptance',[]) for x in n.get('acceptance',[]))
assert sum(own[id]==n for id,n in on.items())==180
assert len(own)==194
assert all(n['implementationStatus']=='unchecked' for n in own.values())
lean=(root/('research/blueprint/suggested/'+stem+'.lean')).read_text()
for node in p['nodes'][len(old['nodes']):]:
    assert node['declarationName'].split('.')[-1] in lean
    for test in node.get('tests',[]):assert test['name'] in lean,test['name']
    for api in node.get('api',[]):assert api['name'].split('.')[-1] in lean,api['name']
allowed={packetpath,'research/blueprint/readmes/'+stem+'.md','research/blueprint/suggested/'+stem+'.lean','research/blueprint/handoff/DESIGN-'+stem+'.md'}
changed=set(subprocess.check_output(['git','diff','--name-only',base],text=True).splitlines())
assert changed<=allowed,changed
for path in changed:
    assert not re.search(r'/(?:home|tmp|Users)/|file'+'://',(root/path).read_text()),path
result={'actualAssembler':True,'base':base,'declarations':ar[rid]['blueprint']['declarations'],'ownDeclarations':len(own),
    'kinds':dict(Counter(n['kind'] for n in own.values())),
    'apiTotal':sum(len(n.get('api',[])) for n in own.values()),'testsTotal':sum(len(n.get('tests',[])) for n in own.values()),
    'baseline':len(p['baseline']['declarations']),'planets':ar[rid]['blueprint']['planets'],'gaps':len(p['gaps']),'requests':len(p['requests']),
    'ownSkippedLinks':ar[rid]['blueprint']['skippedLinks'],'ownPendingLinks':ar[rid]['blueprint'].get('pendingLinks',[]),
    'stageDAG':stageDAG,'ownDeclarationDAG':ownDAG,'stagesAndReachableDeclarations':combined,
    'reachableDeclarations':len(used),'externalDeclarations':sorted(used-set(own)),
    'requiredStagePairs':len(pairs),'requiredStagePairsReachable':len(pairs)-len(missing),'stageEdgesUnchanged':True,
    'otherSkipsMatchOriginal':True,'unchangedNodeObjects':180,'preservedStatements':181,'addedNodes':13,'unresolvedNonlibraryPrerequisites':unresolved,
    'scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
Path(__file__).with_suffix('.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
```

## Resume

Recover and extend the checked actual native carriers. Begin with the all-divisibility algebra comparison or grading/action interface, preserving the distinct root-groupoid and fpqc torsor obligations. Do not treat the ring cocone as a proof of the infinite stack quotient. Keep the full geometry uncompiled limitation explicit until the required exact-pin imports exist. The packet and reader retain all earlier routes, gaps and supplier requests; consult the incoming immutable handoff for older recovery receipts. Submission opens a checkpoint; all implementation statuses remain unchecked.
