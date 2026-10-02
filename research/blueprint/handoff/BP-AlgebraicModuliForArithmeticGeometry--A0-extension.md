# BP-AlgebraicModuliForArithmeticGeometry--A0-extension

Codex — codex-J6LwjP; Refs #672. Claim 5962622101 won by bot confirmation 5962623882; the whole issue was read before and after confirmation. The live issue remains claimed by this session before submission. Base 099cf06f3b3c49aa0cb075268da13d97b3dc300e. Partial checkpoint: all eight stages and the reserved gerbe key retain their partial/not_read status; all 179 implementations remain unchecked.

## Chosen-band coefficient inverse

For a prescribed abelian coefficient sheaf A and an actual A-banding b, construct the inverse of the existing homomorphism c_b(U):Multiplicative(A(U))→ZF(U), for every base U. Gerbe local nonemptiness chooses actual objects over a covering sieve, without choosing an object over U. Evaluation and the inverse banding produce local coefficients. The native evaluation-injectivity theorem recovers z locally; injectivity of the native coefficient map proves compatibility on every commutative test square. The actual sheaf property of A glues the coefficients, and native covering separatedness of central sections proves the global section round trip. Native MulEquiv.ofBijective then supplies the exact coefficient equivalence. Applying its injective forward map proves the inverse restriction and arbitrary-local-object recovery laws.

Six new nodes (four lemmas and two constructions) add seven construction API entries and nine tests. The tests concern units, recovery of existing coefficients, independent local object families, both round trips, inversion, restriction and nonidentity sections. These are universally quantified equations on the actual native carriers; they do not instantiate the required connected/disconnected point sites, restriction-chain site or nonneutral O(1) root gerbe. The band b is fixed: this does not identify different coefficient bandings. No terminal object, neutrality, sheaf-gluing oracle or replacement stack carrier is assumed.

All 173 inherited statements, hypotheses, acceptance conditions, source citations, API items and tests survive. 171 complete inherited node objects are unchanged; the coefficient-map consumer and chosen-band-uniqueness proof/prerequisites acquire the new equivalence. All 68 source routes, the reserved key contract, all 21 requests and nine gap records survive. Only the first gap and the R09.4 remaining-work description refine the resolved sectionwise inverse sub-obligation. The full compatible sheaf-isomorphism packaging, comparison with the actual SF1 descended-slice sheaf, specified geometric fixtures, derived H² classification and profinite-limit geometry remain open. Resume at that first gap, using fromBandingEquiv and its inverse restriction law. Generic stacks remain D0, geometric sites/diagonals/atlases SF1; no new ownership claim is made.

Counts: 179 nodes (16 definitions, 43 constructions, 87 lemmas, 28 theorems, five comparisons), 220 raw API entries and 199 tests; definition/construction totals 212 and 193. Ten planets and 103 baseline references. Three native baseline citations were added after reading their actual pinned defining statements and ambient hypotheses: Presieve.FamilyOfElements, FamilyOfElements.Compatible and MulEquiv.ofBijective.

## Reading and evidence boundary

Fresh reading covers the full statement/proof of [Stacks Lemma 8.11.8](https://stacks.math.columbia.edu/tag/0CJY), including its final omitted varying-base step, and the complete [Definition 8.4.1](https://stacks.math.columbia.edu/tag/026F). The fixed-band inverse here is an authored deduction on the inherited native model, not a separately printed assertion in the source. The HTML hashes are {"026F": "0024923a8e370df81c72261a9765c15c3e1d3bbb8b59a46ab41605f2f2ae60a0", "0CJY": "41dd0c0a1e20dfe2fd60212274a30f259ae0875225b1540b069adf3f89f27a9e"}. All 173 inherited statement/hypothesis contracts were read, together with the current native lifting continuation, actual banding/central-section/evaluation/coefficient helpers, reviewed AUDIT-01 R09.4 row, accepted RS-27 R09.4 ownership decision/current acceptance review, reserved gerbe survey contract and atlas stage descriptions. Earlier whole-paper, other audit-row and confirmed-finding receipts remain credited to their original readers; this is not a claim to have freshly reread every full source or all historical handoffs.

## Lean receipts and reproduction

Use the already-existing build at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369, Lean 4.34.0-rc2. One Lean process at a time, each bounded by 1,200 seconds; available memory was 53 GiB for the final proof and 52 GiB for the final extraction. No environment setup, update, cache fetch, library build or language server was run.

The actual proof passes without errors, warnings, admissions or sorryAx dependencies. It contains the complete 1,000-line predecessor proof byte for byte (SHA256 1726b9e445521e7138da8a748122f70880146b5dcf972056bdf83d54ce2f1e1e), plus four native Mathlib imports and exact native gerbe/banding/evaluation/coefficient helpers. All nine new public declarations have kernel-axiom audits. Explicit banding parameters on the two new constructions ensure that their admitted bodies preserve the exact checked signature. All nine new public headers and all nine example headers match, and all 3,020 inherited suggested-file lines are byte-identical.

The submitted 3,144-line full suggested file is **uncompiled**: the existing build lacks TauCeti.CategoryTheory.Sites.SheafCohomology.LongExactSequence. The exact Mathlib-only extraction passes with 145 admission warnings and no other warnings; it is an admitted planning sketch, not an actual proof. New final outer bodies are sorry under PROTOCOL §13. No imports were stubbed or missing artifacts built.

```json
{
  "Gerbe.lean": {
    "sha256": "a811521350986092ef1ad65db0556558274c1b330ee94716e9be86f40d9e0284",
    "lines": 1463,
    "examples": 32,
    "audits": 50,
    "errors": 0,
    "admissionWarnings": 0,
    "otherWarnings": 0,
    "sorryAx": false,
    "diagnosticSha256": "df31e983c6f7b02919f79b8b0e39f2de2942562d3af9542e6838c28c6fdca671",
    "time": "Elapsed 5.20 seconds; peak 2225540 KiB"
  },
  "SubmittedMathlib.lean": {
    "sha256": "c249ff064b0b26cb930783f5acdaccf95cf4d25f79d6b521fadfcd3684bcb02c",
    "lines": 1762,
    "examples": 74,
    "audits": 0,
    "errors": 0,
    "admissionWarnings": 145,
    "otherWarnings": 0,
    "sorryAx": false,
    "diagnosticSha256": "ab921f05f453ddeed4195c415df61b46ae03cf9dbd7bb3a01f5663ec13b0ca93",
    "time": "Elapsed 6.10 seconds; peak 3378908 KiB"
  },
  "canonical": {
    "sha256": "386f58865dd16b19c590bcd6b1c4cd8761d76345d0f3a2e28b4fc73b4c5fdfb2",
    "lines": 3144,
    "preservedPrefixLines": 3020,
    "newPublicHeadersMatch": 9,
    "newExampleHeadersMatch": 9
  }
}
```

Normalize diagnostics by dropping the final timing line, replacing the absolute source filename by its basename, stripping outer whitespace and adding one newline. The following extracts the actual proof from the immutable allowed-path archive and the exact Mathlib portion from the submitted file. Save generated sources only in your own disk scratch space, then run the existing build's lean command on each sequentially, after checking available memory.

```python
from pathlib import Path
import subprocess, hashlib
path = 'research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--A0-extension.lean'
archived = subprocess.check_output(['git','show','2bfc10cbb6324f3f15634465a13bcefe07a770ba:'+path], text=True)
proof = archived.split('BEGIN ARCHIVED CHECKED CHOSEN BAND INVERSE\n',1)[1].split('END ARCHIVED CHECKED CHOSEN BAND INVERSE\n',1)[0]
assert hashlib.sha256(proof.encode()).hexdigest() == 'a811521350986092ef1ad65db0556558274c1b330ee94716e9be86f40d9e0284'
Path('Gerbe.lean').write_text(proof)
canonical = Path(path).read_text()
assert hashlib.sha256(canonical.encode()).hexdigest() == '386f58865dd16b19c590bcd6b1c4cd8761d76345d0f3a2e28b4fc73b4c5fdfb2'
imports = '\n'.join(l for l in canonical.splitlines() if l.startswith('import Mathlib'))
prefix = canonical[canonical.index('open CategoryTheory Opposite Bicategory'):canonical.index('variable {A : Sheaf')]
marker = 'namespace TauCeti.AlgebraicGeometry\n\nopen CategoryTheory Opposite Bicategory\n\nvariable {C'
central = canonical[canonical.index(marker,canonical.index('/-! Intrinsic-band continuation')):]
sketch = imports+'\n'+prefix+'\nend TauCeti.AlgebraicGeometry\n'+central
assert hashlib.sha256(sketch.encode()).hexdigest() == 'c249ff064b0b26cb930783f5acdaccf95cf4d25f79d6b521fadfcd3684bcb02c'
Path('SubmittedMathlib.lean').write_text(sketch)
```

## Actual assembler and preservation guards

The actual scripts/build.py assembler overlays this packet before trimming its already-promoted predecessor, retaining other parts. It compares the original packet as a control, checks the stage DAG, own declarations and the recursively reachable combined stage/declaration DAG, and follows actual supplier paths. Context edges do not claim mathematical closure. All 24 required stage pairs are reachable; no own skipped/pending links or unresolved nonlibrary prerequisites occur. Unrelated skipped/pending entries match the control and all stage edges are unchanged.

```json
{
  "actualAssembler": true,
  "unresolvedNonlibraryPrerequisites": [],
  "base": "099cf06f3b3c49aa0cb075268da13d97b3dc300e",
  "declarations": 179,
  "ownDeclarations": 179,
  "kinds": {
    "definition": 16,
    "lemma": 87,
    "construction": 43,
    "theorem": 28,
    "comparison": 5
  },
  "apiTotal": 220,
  "testsTotal": 199,
  "baseline": 103,
  "planets": 10,
  "gaps": 9,
  "requests": 21,
  "ownSkippedLinks": [],
  "ownPendingLinks": [],
  "stageDAG": {
    "vertices": 3017,
    "edges": 8655,
    "acyclic": true
  },
  "ownDeclarationDAG": {
    "vertices": 179,
    "edges": 373,
    "acyclic": true
  },
  "stagesAndReachableDeclarations": {
    "vertices": 3189,
    "edges": 9274,
    "acyclic": true
  },
  "reachableDeclarations": 182,
  "externalDeclarations": [
    "DiamondsAndVStacks:D0/cech-to-derived-comparison",
    "DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products",
    "DiamondsAndVStacks:D0/stackification"
  ],
  "requiredStagePairs": 24,
  "requiredStagePairsReachable": 24,
  "stageEdgesUnchanged": true,
  "otherSkipsMatchOriginal": true,
  "unchangedNodeObjects": 171,
  "preservedStatements": 173,
  "addedNodes": 6,
  "scriptSha256": "f0fb6b83a591597ba3fd418f941124f125a503254386d372e499f0bb789983d2"
}
```

The complete recipe below has SHA256 f0fb6b83a591597ba3fd418f941124f125a503254386d372e499f0bb789983d2; save it in your own disk scratch space and run from the repository root. Its output file belongs to that scratch space. The 17 real tracked instruction, protocol, baseline, audit, key-owner, RS-27 review, atlas, assembler and deliverable paths were byte-checked against latest main daa16ce58d3831a75694ed9791081b9b2f18b4e1 before submission and were unchanged from the base. The indexed packet check, intake four-file path/JSON check and git diff --check pass. Only the four authorized deliverables change.

```python
import json,sys,subprocess,hashlib,re
from pathlib import Path
from collections import defaultdict,deque,Counter
root=Path.cwd();sys.path.insert(0,str(root/'scripts'));import build
rid='AlgebraicModuliForArithmeticGeometry';stem=rid+'--A0-extension'
packetpath='research/blueprint/packets/'+stem+'.json'
base='099cf06f3b3c49aa0cb075268da13d97b3dc300e'
p=json.loads((root/packetpath).read_text())
old=json.loads(subprocess.check_output(['git','show',base+':'+packetpath],text=True))
r=json.loads((root/('research/blueprint/atlas/roadmaps/'+rid+'.json')).read_text())
load=build.load_promoted
def assemble(packet):
    def overlay(*a,**k):
        ps,ds,defs=load(*a,**k)
        return ([(n,v) for n,v in ps if n!=stem]+[(stem,packet)],
            {**ds,stem:'research/blueprint/readmes/'+stem+'.md'},defs)
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
        if dep not in stageids and dep not in used and not dep.startswith(('mathlib:','tauceti:')):
            unresolved.append((v,dep))
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
assert ar[rid]['blueprint']['declarations']==cr[rid]['blueprint']['declarations']+6
assert ar[rid]['blueprint']['planets']==cr[rid]['blueprint']['planets']
assert ar[rid]['blueprint']['skippedLinks']==cr[rid]['blueprint']['skippedLinks']
assert not ar[rid].get('pendingLinks')
assert all(ar[x].get('pendingLinks')==cr[x].get('pendingLinks') for x in cr)
assert all(ar[x].get('blueprint',{}).get('skippedLinks')==cr[x].get('blueprint',{}).get('skippedLinks') for x in cr)
for key in ('sourceIssues','requests','routedItems','keyDefinitions','routedItemAudit'):
    assert p[key]==old[key],key
assert p['gaps'][1:]==old['gaps'][1:]
assert [(c['stageId'],c['status']) for c in p['coverage']]==[(c['stageId'],c['status']) for c in old['coverage']]
assert len(p['gaps'])==len(old['gaps'])
assert p['baseline']['declarations'][:len(old['baseline']['declarations'])]==old['baseline']['declarations']
on={n['id']:n for n in old['nodes']}
for id,n in on.items():
    for key in ('id','kind','statement','hypotheses','sources','implementationStatus'):
        assert own[id].get(key)==n.get(key),(id,key)
    assert all(x in own[id].get('uses',[]) for x in n.get('uses',[]))
    assert all(x in own[id].get('prerequisites',[]) for x in n.get('prerequisites',[]))
    assert all(t in own[id].get('tests',[]) for t in n.get('tests',[]))
    assert all(x in own[id].get('api',[]) for x in n.get('api',[]))
    assert all(x in own[id].get('acceptance',[]) for x in n.get('acceptance',[]))
assert sum(own[id]==n for id,n in on.items())==171
assert len(own)==179
assert all(n['implementationStatus']=='unchecked' for n in own.values())
lean=(root/('research/blueprint/suggested/'+stem+'.lean')).read_text()
for node in p['nodes'][len(old['nodes']):]:
    assert node['declarationName'].split('.')[-1] in lean
    for test in node.get('tests',[]):assert test['name'] in lean,test['name']
    for api in node.get('api',[]):assert api['name'].split('.')[-1] in lean,api['name']
allowed={packetpath,'research/blueprint/readmes/'+stem+'.md','research/blueprint/suggested/'+stem+'.lean','research/blueprint/handoff/BP-'+stem+'.md'}
changed=set(subprocess.check_output(['git','diff','--name-only',base],text=True).splitlines())
assert changed<=allowed,changed
for path in changed:
    assert not re.search(r'/(?:home|tmp|Users)/|file'+'://',(root/path).read_text()),path
result={'actualAssembler':True,'unresolvedNonlibraryPrerequisites':unresolved,'base':base,'declarations':ar[rid]['blueprint']['declarations'],'ownDeclarations':len(own),
    'kinds':dict(Counter(n['kind'] for n in own.values())),
    'apiTotal':sum(len(n.get('api',[])) for n in own.values()),'testsTotal':sum(len(n.get('tests',[])) for n in own.values()),
    'baseline':len(p['baseline']['declarations']),'planets':ar[rid]['blueprint']['planets'],'gaps':len(p['gaps']),'requests':len(p['requests']),
    'ownSkippedLinks':ar[rid]['blueprint']['skippedLinks'],'ownPendingLinks':ar[rid]['blueprint'].get('pendingLinks',[]),
    'stageDAG':stageDAG,'ownDeclarationDAG':ownDAG,'stagesAndReachableDeclarations':combined,
    'reachableDeclarations':len(used),'externalDeclarations':sorted(used-set(own)),
    'requiredStagePairs':len(pairs),'requiredStagePairsReachable':len(pairs)-len(missing),'stageEdgesUnchanged':True,
    'otherSkipsMatchOriginal':True,'unchangedNodeObjects':171,'preservedStatements':173,'addedNodes':6,
    'scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
Path(__file__).with_suffix('.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
```

## Retained predecessor receipts

Everything below is historical evidence and its earlier counts/frontiers. The current inverse and receipts above supersede its chosen-band inverse frontier; other obligations and attributions remain.

# BP-AlgebraicModuliForArithmeticGeometry--A0-extension

Codex — codex-7e92bd; Refs #672. Claim comment 5961978270 was confirmed by bot 5961980212. The issue was read before and after confirmation, and the live claim was checked before submission. Base db0fce2ffbccc7e02eb25d9b6856a4e3dc50d48d. Partial checkpoint; no stage, reserved key or implementation is closed.

## Intrinsic-band lifting and evaluation surjectivity

For a gerbe F with abelian inertia, an automorphism a of an object x over U determines a section of the existing compatible-centre group ZF(U). At f:V→U and y over V, choose local isomorphisms f*x→y and descend the conjugates of f*a. Cover independence removes the choices. Naturality in source and target objects gives an actual invertible natural transformation of the identity functor of each fibre, hence a unit of its native categorical centre.

The arbitrary-base comparison uses the intersection of a pulled-back cover with any independently chosen target cover. Native prestack descent detects equality there. The mapComp natural isomorphism compares composite and iterated restrictions; source naturality then proves the precise compatibility equation defining ZF. Native mapId identifies the component at the identity arrow with the original a. Thus the lifting homomorphism is a right inverse of evaluation, proving the existing evaluation-surjectivity leaf. Its uniqueness still uses the existing evaluation-injectivity leaf; the new standalone receipt proves the right inverse and surjectivity without assuming injectivity or the central-section sheaf theorem.

Four declarations are added: arbitrary-base conjugation, source-and-target naturality, the lifting homomorphism, and its identity-evaluation law. The lifting API includes identity, multiplication, inverse, recovery on an arbitrary chosen cover, global-isomorphism comparison, whole-section restriction, injectivity and evaluation. Five native tests cover the unit section, preservation of a nonidentity automorphism, labelled global conjugation, a two-arrow restriction chain, and exact recovery. These are parameterized equations on the actual native carriers. They do not instantiate the still-required point-site, disconnected-site or nonneutral root-gerbe fixtures.

The packet has 173 nodes: 16 definitions, 41 constructions, 83 lemmas, 28 theorems and 5 comparisons. There are 213 total API entries and 190 total tests; the definition/construction counts are 205 and 184. All 169 inherited statements, hypotheses, acceptance conditions, API items, tests and source citations remain; 168 complete inherited node objects are unchanged. Only the existing evaluation-surjectivity proof/prerequisites change. The 100 baseline references, ten planets, 68 source routes, nine gaps and 21 open requests retain all earlier obligations. All eight stages and the reserved gerbe key remain partial or not_read, with implementation status unchecked.

The independent native prototype has 1,000 lines, 23 examples and 41 kernel-axiom audits: zero errors, warnings, admissions or admitted dependencies, 4.42 seconds and 2,156,996 KiB peak memory. Its immutable [proof archive](https://github.com/CBirkbeck/tauceti-explorer/commit/400047f877590da21b1c04c1437dc926fde363ba) includes the exact predecessor proof and the actual existing gerbe and compatible-centre carriers. The final suggested file admits all eleven new public declaration bodies and five new examples under PROTOCOL §13. Its 1,638-line Mathlib-only extraction has 65 examples, zero errors, 127 admission warnings and no other warnings, 6.37 seconds and 3,366,408 KiB peak memory. The full 3,020-line suggested file is uncompiled: the existing pinned build lacks the imported TauCeti cohomology artifact. No library or dependency was built.

The indexed packet checker passes. The actual assembler preserves all stage edges and unrelated skipped links. The stage DAG has 3,017 vertices and 8,655 edges; the own-declaration DAG has 173 vertices and 351 edges; the combined contextual DAG has 3,183 vertices and 9,246 edges. All 24 required supplier paths remain reachable, with no own skipped or pending links. Context edges from parent stages to declarations do not assert mathematical completion.

This supplies a derived completion of the varying-base step omitted from the printed proof of [Stacks Lemma 8.11.8](https://stacks.math.columbia.edu/tag/0CJY). Fresh reading covers that complete statement/proof, [Definition 8.4.1](https://stacks.math.columbia.edu/tag/026F), all eight in-scope reviewed audit rows, the accepted RS-27 decisions and current fix-review report, confirmed finding claims/fixes, and the reserved gerbe contract. Full-paper and whole-upstream-document receipts elsewhere remain attributed to their original readers. This is a focused continuation, not a new whole-source or whole-packet reread.

The locally glued chosen-band inverse, comparison with the actual SF1 slice sheaf and the specified geometric-site fixtures remain open. The other eight gap records, all requests and all source routes are unchanged. Generic stacks/descent remain at D0, spaces/sites/diagonals/atlases at SF1, coherent duality and stable pointed curves at their reserved suppliers, and abelian/PEL applications downstream. No full intrinsic-band, key-definition or stage closure is claimed.

## Reproduction

Pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369; Lean 4.34.0-rc2. The existing build's manifest and Mathlib checkout match the pin. The missing full-file artifact is TauCeti.CategoryTheory.Sites.SheafCohomology.LongExactSequence. Each invocation was bounded by 1,200 seconds; at least 55 GiB was available before the final runs, one Lean process at a time. No setup, update, cache fetch, build or LSP was run.

The new public headers match the checked proof; all their final bodies are admitted. The proof uses actual native prestack descent and an exact copy of the existing gerbe predicate and compatible-centre subgroup. There are no opaque mathematical hypotheses, custom replacement descent carriers, admissions or admitted dependencies. The previous 564-line proof is included verbatim. The identity-recovery and surjectivity audits do not depend on the still-admitted sheaf theorem or evaluation-injectivity statement.

```json
{
  "GerbeLiftProbe.lean": {
    "sha256": "1726b9e445521e7138da8a748122f70880146b5dcf972056bdf83d54ce2f1e1e",
    "lines": 1000,
    "examples": 23,
    "audits": 41,
    "errors": 0,
    "admissionWarnings": 0,
    "otherWarnings": 0,
    "sorryAx": false,
    "elapsed": "0:04.42",
    "maxRSSKiB": 2156996,
    "diagnosticSha256": "0554eb22dec2b3bf409ff07ba2f0e4b892ff99634b410591610b2d655eadbdaf"
  },
  "SubmittedMathlib.lean": {
    "sha256": "ec59277311b2597b50a91eeb90e51306a1e4b2bf6541770728bc72e150c27945",
    "lines": 1638,
    "examples": 65,
    "audits": 0,
    "errors": 0,
    "admissionWarnings": 127,
    "otherWarnings": 0,
    "sorryAx": false,
    "elapsed": "0:06.37",
    "maxRSSKiB": 3366408,
    "diagnosticSha256": "24fd0cf92069a6b6fb94193155d09d09f5a79508537e9fabdf0bb6921096bf0f"
  }
}
```

The first receipt concerns actual proofs, the second an intentionally admitted planning sketch. Normalize logs by removing the timing wrapper, replacing the exact source filename by the basename, stripping outer whitespace and adding one newline. The final suggested source SHA256 is 18550c3f24e251de8009a8e07afd2983eaae7d237917be4e6f348e87a1b3a59a.

```python
from pathlib import Path
import hashlib, subprocess
path = 'research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--A0-extension.lean'
archive = '400047f877590da21b1c04c1437dc926fde363ba'
text = subprocess.check_output(['git', 'show', archive + ':' + path], text=True)
proof = text.split('BEGIN ARCHIVED CHECKED GERBE BAND LIFT\n', 1)[1].split('END ARCHIVED CHECKED GERBE BAND LIFT', 1)[0]
assert hashlib.sha256(proof.encode()).hexdigest() == '1726b9e445521e7138da8a748122f70880146b5dcf972056bdf83d54ce2f1e1e'
# Write proof into your own disk scratch and use the existing pinned build.
submitted = Path(path).read_text()
imports = '\n'.join(l for l in submitted.splitlines() if l.startswith('import Mathlib'))
prefix = submitted[submitted.index('open CategoryTheory Opposite Bicategory'):submitted.index('variable {A : Sheaf')]
marker = 'namespace TauCeti.AlgebraicGeometry\n\nopen CategoryTheory Opposite Bicategory\n\nvariable {C'
central = submitted[submitted.index(marker, submitted.index('/-! Intrinsic-band continuation')):]
sketch = imports + '\n' + prefix + '\nend TauCeti.AlgebraicGeometry\n' + central
assert hashlib.sha256(sketch.encode()).hexdigest() == 'ec59277311b2597b50a91eeb90e51306a1e4b2bf6541770728bc72e150c27945'
```

If the archive Git object is absent, retrieve the same file from [the immutable raw archive](https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/400047f877590da21b1c04c1437dc926fde363ba/research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--A0-extension.lean). Its complete comment payload is the standalone source. The archive comment is removed from the final suggested file.

The predecessor archive 66ab10c1324aa6942326f55697ce5d776118d061 was recovered with the exact markers BEGIN/END ARCHIVED CHECKED GERBE COVER REFINEMENT and verified against SHA256 889afb3d3d18c7df3e029e9023bec487baa58b74b2b264a3e33770a3f4b1bc45. Its older handoff recipe accidentally replaced part of the word ARCHIVED by the commit hash; that recipe is corrected below. The archive payload itself was intact.

Source HTML, accessed 2026-10-02: Stacks 0CJY SHA256 41dd0c0a1e20dfe2fd60212274a30f259ae0875225b1540b069adf3f89f27a9e; 026F SHA256 0024923a8e370df81c72261a9765c15c3e1d3bbb8b59a46ab41605f2f2ae60a0. The newly added baseline reference is mapId'; mapComp', native Cat conversion, topology stability/intersection, centre units and natural-isomorphism construction were also reread at the pin. No new exhaustive library-absence claim is made.

## Assembler and preservation reproduction

The indexed checker reports 173 nodes, 205 definition/construction API items, 184 required tests, ten planets, 100 baseline declarations, nine gaps, 21 requests and eight unclosed stages, with zero errors or warnings. Old source issues, key contracts and all 68 routes remain byte-equivalent as parsed objects. Only the first gap and R09.4's remaining-work paragraph change, resolving evaluation surjectivity while retaining the remaining obligations.

```json
{
  "actualAssembler": true,
  "base": "db0fce2ffbccc7e02eb25d9b6856a4e3dc50d48d",
  "declarations": 173,
  "ownDeclarations": 173,
  "kinds": {
    "definition": 16,
    "lemma": 83,
    "construction": 41,
    "theorem": 28,
    "comparison": 5
  },
  "apiTotal": 213,
  "testsTotal": 190,
  "baseline": 100,
  "planets": 10,
  "gaps": 9,
  "requests": 21,
  "ownSkippedLinks": [],
  "ownPendingLinks": [],
  "stageDAG": {
    "vertices": 3017,
    "edges": 8655,
    "acyclic": true
  },
  "ownDeclarationDAG": {
    "vertices": 173,
    "edges": 351,
    "acyclic": true
  },
  "stagesAndReachableDeclarations": {
    "vertices": 3183,
    "edges": 9246,
    "acyclic": true
  },
  "reachableDeclarations": 176,
  "externalDeclarations": [
    "DiamondsAndVStacks:D0/cech-to-derived-comparison",
    "DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products",
    "DiamondsAndVStacks:D0/stackification"
  ],
  "requiredStagePairs": 24,
  "requiredStagePairsReachable": 24,
  "stageEdgesUnchanged": true,
  "otherSkipsMatchOriginal": true,
  "unchangedNodeObjects": 168,
  "preservedStatements": 169,
  "addedNodes": 4,
  "scriptSha256": "84d9381bc324e4c9538a865f7ae58c2b21a6d1de527b58b157cc210364911aba"
}
```

Run the following read-only graph script from the submitted repository. It compares the actual assembler with the base packet before trimming, keeps the other roadmap part, and checks all supplier paths and old mathematical contracts. The hashes and counts describe this checkpoint's base, not unrelated future atlas changes.

```python
import json,sys,subprocess,hashlib,re
from pathlib import Path
from collections import defaultdict,deque,Counter
root=Path.cwd();sys.path.insert(0,str(root/'scripts'));import build
rid='AlgebraicModuliForArithmeticGeometry';stem=rid+'--A0-extension'
packetpath='research/blueprint/packets/'+stem+'.json'
base='db0fce2ffbccc7e02eb25d9b6856a4e3dc50d48d'
p=json.loads((root/packetpath).read_text())
old=json.loads(subprocess.check_output(['git','show',base+':'+packetpath],text=True))
r=json.loads((root/('research/blueprint/atlas/roadmaps/'+rid+'.json')).read_text())
load=build.load_promoted
def assemble(packet):
    def overlay(*a,**k):
        ps,ds,defs=load(*a,**k)
        return ([(n,v) for n,v in ps if n!=stem]+[(stem,packet)],
            {**ds,stem:'research/blueprint/readmes/'+stem+'.md'},defs)
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
assert ar[rid]['blueprint']['declarations']==cr[rid]['blueprint']['declarations']+4
assert ar[rid]['blueprint']['planets']==cr[rid]['blueprint']['planets']
assert ar[rid]['blueprint']['skippedLinks']==cr[rid]['blueprint']['skippedLinks']
assert not ar[rid]['blueprint'].get('pendingLinks')
assert all(ar[x].get('blueprint',{}).get('skippedLinks')==cr[x].get('blueprint',{}).get('skippedLinks') for x in cr)
for key in ('sourceIssues','requests','routedItems','keyDefinitions','routedItemAudit'):
    assert p[key]==old[key],key
assert p['gaps'][1:]==old['gaps'][1:]
assert [(c['stageId'],c['status']) for c in p['coverage']]==[(c['stageId'],c['status']) for c in old['coverage']]
assert len(p['gaps'])==len(old['gaps'])
assert p['baseline']['declarations'][:len(old['baseline']['declarations'])]==old['baseline']['declarations']
on={n['id']:n for n in old['nodes']}
for id,n in on.items():
    for key in ('id','kind','statement','hypotheses','sources','implementationStatus','uses'):
        assert own[id].get(key)==n.get(key),(id,key)
    assert all(t in own[id].get('tests',[]) for t in n.get('tests',[]))
    assert all(x in own[id].get('api',[]) for x in n.get('api',[]))
    assert all(x in own[id].get('acceptance',[]) for x in n.get('acceptance',[]))
assert sum(own[id]==n for id,n in on.items())==168
assert len(own)==173
assert all(n['implementationStatus']=='unchecked' for n in own.values())
lean=(root/('research/blueprint/suggested/'+stem+'.lean')).read_text()
for node in p['nodes'][len(old['nodes']):]:
    assert node['declarationName'].split('.')[-1] in lean
    for test in node.get('tests',[]):assert test['name'] in lean,test['name']
    for api in node.get('api',[]):assert api['name'].split('.')[-1] in lean,api['name']
allowed={packetpath,'research/blueprint/readmes/'+stem+'.md','research/blueprint/suggested/'+stem+'.lean','research/blueprint/handoff/BP-'+stem+'.md'}
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
    'otherSkipsMatchOriginal':True,'unchangedNodeObjects':168,'preservedStatements':169,'addedNodes':4,
    'scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
print(json.dumps(result,indent=2))
```

Retained worker evidence: GerbeLiftProbe.lean, lift-proof.log and its normalized output; SubmittedMathlib.lean, submitted-mathlib.log and its normalized output; lean-receipt.json, packet-check.log, graph.json, verify_graph.py, fresh-source-receipt.json, final-suggested.lean and remote verification receipts. These filenames refer to worker evidence; public reproduction uses the immutable archive and recipes above.

## Resume

Continue with the locally glued inverse to the fixed-band coefficient map, then compare the simultaneous compatible-centre sheaf with the actual SF1 descended slice sheaf. Reuse the new lifting homomorphism and its restriction/evaluation laws; do not re-prove arbitrary-base conjugation. Evaluation uniqueness is supplied by the existing separate injectivity leaf. Instantiate the connected/disconnected point sites, noninjective restriction-chain site and nonneutral root gerbe of O(1). Full source work for the other branches and every open request remains part of this job.

## Historical handoff receipts

The following earlier counts, frontiers and receipts are attributed history, not current claims. The opening section supersedes its now-completed evaluation-surjectivity frontier.

# Current checkpoint — Codex codex-J6LwjP, issue #672

Claim5961534150 confirmed by bot5961536135; complete issue read again after confirmation. Base4557261650818a24845bd3c8f195e393990ea9c0. This checkpoint changes only the four authorised packet, reader, suggested and handoff paths. Earlier ledgers below are historical.

## Current continuation: cover independence and reversible conjugation

Codex — codex-J6LwjP, issue #672, base 4557261650818a24845bd3c8f195e393990ea9c0. Six consumed native leaves extend the packet from163 to169 declarations (16 definitions,40 constructions,80 lemmas,28 theorems,5 comparisons). All163 inherited statements, hypotheses, sources and mathematical acceptance/API/test contracts remain;162 complete inherited node objects are unchanged. Only the evaluation-surjectivity leaf gains prerequisites and a more precise proof frontier. The99 baseline declarations include one newly read pinned intersection-covering theorem. The packet contains205 raw API entries (197 on definitions/constructions) and185 raw mathematical tests (179 on definitions/constructions), ten planets, nine gaps,21 open requests and68 unchanged source routes. All eight coverage rows and the reserved gerbe key remain partial or not_read, with no closure.

The covering-refinement theorem compares the lift on R with the lift on S when R≤S, although the two local object-isomorphism families may be unrelated. Restrict the S-lift to each actual arrow of R; native local recovery and commutative inertia identify it with the prescribed R-conjugate. Uniqueness on R proves equality. Two unrelated covering sieves are compared through their actual intersection, which the pinned topology already proves covering. This removes the previously explicit cover-change obligation without creating another cover, descent or stack carrier.

Reverse local isomorphisms give inverse transport: recovery twice and native descent faithfulness recover every original automorphism. The inherited group homomorphism therefore yields an actual MulEquiv Aut(x)≃*Aut(y), with the specified forward and inverse maps, native group laws, local restrictions and global-isomorphism comparison. Whole-equivalence extensionality proves independence of the covering sieve. Finally, on one cover, transport x→y→z equals x→z for arbitrary choices of all three local isomorphism families: their composite and the direct family induce equal conjugations by abelian inertia. This is the same-base cocycle used by the intrinsic-band route.

The seven mathematical equivalence tests retain both round trips, every local restriction, agreement with a global native conjugation equivalence, equality under unrelated covers, native products and the identity equivalence when x=y despite arbitrary local automorphisms. These detect loss of source or target automorphisms and a wrong labelled conjugation map. They are generic equations in the actual pinned carriers; no new geometric-site fixture or finite-model receipt is claimed.

The complete checked native source has564 lines,18 examples and32 kernel audits, with zero errors, warnings, admissions or admitted dependencies; Elapsed 2.30 seconds; peak 2073768 KiB. Its immutable archive is [66ab10c1324aa6942326f55697ce5d776118d061](https://github.com/CBirkbeck/tauceti-explorer/commit/66ab10c1324aa6942326f55697ce5d776118d061). All13 new declaration/API headers and seven example headers are retained exactly in the suggested file, with their final bodies admitted under PROTOCOL§13. The1531-line Mathlib-only admitted extraction has60 examples, zero errors,111 admission warnings and no other warnings; Elapsed 5.50 seconds; peak 3346136 KiB. The full2913-line suggested file remains uncompiled because the existing pinned build lacks the imported TauCeti.CategoryTheory.Sites.SheafCohomology.LongExactSequence artifact; no dependency was built.

The actual atlas assembler retains all stage edges and unrelated skips. Stage, own-declaration and combined dependency DAGs are acyclic; all24 old required supplier paths remain reachable, with no own skipped or pending links. The combined graph contains the169 own nodes plus three reachable D0 declarations. Parent-stage→declaration edges in this diagnostic graph provide context only; they do not assert that a stage has been proved or realised.

Fresh reading covers the entire printed [Stacks Lemma8.11.8](https://stacks.math.columbia.edu/tag/0CJY) and [Definition8.4.1](https://stacks.math.columbia.edu/tag/026F), the current eight reviewed audit rows, all163 node statements/hypotheses, full predecessor handoff, accepted RS27 decisions/report, applicable ModularCurves links, confirmed finding claims/verdicts and the gerbe reserved contract. Historical whole-source reading receipts retain their original attribution. The new adapters are derived from the local-conjugation argument; they are not proofs printed by the source, whose varying-base conclusion is explicitly omitted.

Still prove compatibility of the conjugation equivalence with arbitrary further base arrows, retaining native mapComp and mapId, before assembling natural centre units and proving evaluation surjectivity. The chosen-band inverse, SF1 slice comparison, connected/disconnected point sites, restriction-chain site and nonneutral O(1) root-gerbe fixtures remain open, as do all inherited non-gerbe scope gaps. Generic stack/descent belongs to D0, spaces/sites/diagonals/atlases to SF1, coherent duality and stable pointed-curve moduli to their reserved suppliers, and abelian/PEL applications downstream.



## Reproduction receipts

Actual native source SHA256: 889afb3d3d18c7df3e029e9023bec487baa58b74b2b264a3e33770a3f4b1bc45. Normalized diagnostics SHA256: 2464969f47f0bc7d6fb6bab8b837b713868f0f3781c677fbd68e8198f5af5b5d. Compile with Lean4.34.0-rc2 and the already-existing Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 / TauCeti f790474821cf4256814db967cb154e7af3d0c369 build, individual Mathlib imports only.58GiB was available before the final actual run. All32 audits list only standard kernel axioms; no sorryAx. No background process remains.

Final admitted Mathlib extraction SHA256: a90f771beb5701fc05f4a930a4c82a6cac22a1adb700ed2c7e46f4f6dd2dbd6f; normalized diagnostics SHA256: d33c82a026b118a4e453ca447ecd99e05a0c630fc43a4bc7de18b551205cb7c4.58GiB available before its run. Normalize by replacing only the source filename with SubmittedMathlib.lean, remove the timing wrapper and strip outer whitespace plus add one newline. The final native proof diagnostics have no filename lines. Compiler invocation was bounded by1200 seconds and used the existing build's library path; no project, setup, download, cache or dependency build was performed.

The archive comment is absent from the final suggested file but remains durably accessible at the immutable intermediate commit. It contains all342 lines of predecessor proof recovered from57332e8119e7f8e152f41484583d1291bfc2f92d and verified against9af35ace261858f92b9980584627d8803adf5c06281a64948e3ed7b52e1227ac, plus the complete new proof/API/examples/audits. No admitted gerbe or intrinsic-band stub enters its dependencies.

```python
from pathlib import Path
import hashlib, subprocess
stem = 'AlgebraicModuliForArithmeticGeometry--A0-extension'
path = 'research/blueprint/suggested/' + stem + '.lean'
archive = '66ab10c1324aa6942326f55697ce5d776118d061'
t = subprocess.check_output(['git', 'show', archive + ':' + path], text=True)
proof = t.split('BEGIN ARCHIVED CHECKED GERBE COVER REFINEMENT\n', 1)[1].split('END ARCHIVED CHECKED GERBE COVER REFINEMENT', 1)[0]
assert hashlib.sha256(proof.encode()).hexdigest() == '889afb3d3d18c7df3e029e9023bec487baa58b74b2b264a3e33770a3f4b1bc45'
# Save this source in your own disk scratch before the one permitted Lean invocation.
# Public fallback, if the archive object is absent:
# https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/66ab10c1324aa6942326f55697ce5d776118d061/research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--A0-extension.lean
submitted = Path(path).read_text()
imports = '\n'.join(l for l in submitted.splitlines() if l.startswith('import Mathlib'))
prefix = submitted[submitted.index('open CategoryTheory Opposite Bicategory'):submitted.index('variable {A : Sheaf')]
marker = 'namespace TauCeti.AlgebraicGeometry\n\nopen CategoryTheory Opposite Bicategory\n\nvariable {C'
central = submitted[submitted.index(marker, submitted.index('/-! Intrinsic-band continuation')):]
mathlib_only = imports + '\n' + prefix + '\nend TauCeti.AlgebraicGeometry\n' + central
assert hashlib.sha256(mathlib_only.encode()).hexdigest() == 'a90f771beb5701fc05f4a930a4c82a6cac22a1adb700ed2c7e46f4f6dd2dbd6f'
```

Fresh source HTML hashes: Stacks0CJY41dd0c0a1e20dfe2fd60212274a30f259ae0875225b1540b069adf3f89f27a9e and026F0024923a8e370df81c72261a9765c15c3e1d3bbb8b59a46ab41605f2f2ae60a0. Accessed2026-10-02. The new baseline intersection theorem was read in full at the pin, together with native Presieve.category/categoryMk, prestack full faithfulness and preimageIso. Existing upstream document and whole-paper receipts are inherited, not new claims.

## Actual assembler and preservation check

Indexed packet checker:169 nodes,197 definition/construction API entries,179 required mathematical tests,10 planets,99 baseline declarations,9 gaps,21 requests,8 stages,0 closed;0 errors or warnings. The raw packet totals205 API and185 tests additionally count lemma API/tests. Intake and diff whitespace checks run on the four authorised paths.

The read-only reproducer below uses scripts/build.py assemble(require_distances=False), candidate versus base packet injected before blueprint trimming, preserving the other packet part. It checks acyclicity, all24 required old stage paths, immutable stage edges, unchanged unrelated skips, absence of own unresolved links and contract preservation. It adds parent-stage→declaration context edges only in the combined diagnostic graph; these are not extra mathematical prerequisites or realises assertions. Results:

```json
{
  "actualAssembler": true,
  "base": "4557261650818a24845bd3c8f195e393990ea9c0",
  "declarations": 169,
  "ownDeclarations": 169,
  "kinds": {
    "definition": 16,
    "lemma": 80,
    "construction": 40,
    "theorem": 28,
    "comparison": 5
  },
  "apiTotal": 205,
  "testsTotal": 185,
  "baseline": 99,
  "planets": 10,
  "gaps": 9,
  "requests": 21,
  "ownSkippedLinks": [],
  "ownPendingLinks": [],
  "stageDAG": {
    "vertices": 3017,
    "edges": 8655,
    "acyclic": true
  },
  "ownDeclarationDAG": {
    "vertices": 169,
    "edges": 334,
    "acyclic": true
  },
  "stagesAndReachableDeclarations": {
    "vertices": 3179,
    "edges": 9225,
    "acyclic": true
  },
  "reachableDeclarations": 172,
  "externalDeclarations": [
    "DiamondsAndVStacks:D0/cech-to-derived-comparison",
    "DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products",
    "DiamondsAndVStacks:D0/stackification"
  ],
  "requiredStagePairs": 24,
  "requiredStagePairsReachable": 24,
  "stageEdgesUnchanged": true,
  "otherSkipsMatchOriginal": true,
  "unchangedNodeObjects": 162,
  "preservedStatements": 163,
  "addedNodes": 6,
  "scriptSha256": "f42bd4225990cfc31e7cf9b261578d8c21ee509f5d9379ef16b6d8b63054ddee"
}
```

Script SHA256f42bd4225990cfc31e7cf9b261578d8c21ee509f5d9379ef16b6d8b63054ddee:

```python
import json,sys,subprocess,hashlib,re
from pathlib import Path
from collections import defaultdict,deque,Counter
root=Path.cwd();sys.path.insert(0,str(root/'scripts'));import build
rid='AlgebraicModuliForArithmeticGeometry';stem=rid+'--A0-extension'
packetpath='research/blueprint/packets/'+stem+'.json'
base='4557261650818a24845bd3c8f195e393990ea9c0'
p=json.loads((root/packetpath).read_text())
old=json.loads(subprocess.check_output(['git','show',base+':'+packetpath],text=True))
r=json.loads((root/('research/blueprint/atlas/roadmaps/'+rid+'.json')).read_text())
load=build.load_promoted
def assemble(packet):
    def overlay(*a,**k):
        ps,ds,defs=load(*a,**k)
        return ([(n,v) for n,v in ps if n!=stem]+[(stem,packet)],
            {**ds,stem:'research/blueprint/readmes/'+stem+'.md'},defs)
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
assert ar[rid]['blueprint']['declarations']==cr[rid]['blueprint']['declarations']+6
assert ar[rid]['blueprint']['planets']==cr[rid]['blueprint']['planets']
assert ar[rid]['blueprint']['skippedLinks']==cr[rid]['blueprint']['skippedLinks']
assert not ar[rid]['blueprint'].get('pendingLinks')
assert all(ar[x].get('blueprint',{}).get('skippedLinks')==cr[x].get('blueprint',{}).get('skippedLinks') for x in cr)
for key in ('sourceIssues','requests','routedItems','keyDefinitions','routedItemAudit','coverage','gaps'):
    assert p[key]==old[key],key
assert p['baseline']['declarations'][:len(old['baseline']['declarations'])]==old['baseline']['declarations']
on={n['id']:n for n in old['nodes']}
for id,n in on.items():
    for key in ('id','kind','statement','hypotheses','sources','implementationStatus','uses'):
        assert own[id].get(key)==n.get(key),(id,key)
    assert all(t in own[id].get('tests',[]) for t in n.get('tests',[]))
    assert all(x in own[id].get('api',[]) for x in n.get('api',[]))
    assert all(x in own[id].get('acceptance',[]) for x in n.get('acceptance',[]))
assert sum(own[id]==n for id,n in on.items())==162
assert len(own)==169
assert all(n['implementationStatus']=='unchecked' for n in own.values())
lean=(root/('research/blueprint/suggested/'+stem+'.lean')).read_text()
for node in p['nodes'][len(old['nodes']):]:
    assert node['declarationName'].split('.')[-1] in lean
    for test in node.get('tests',[]):assert test['name'] in lean,test['name']
    for api in node.get('api',[]):assert api['name'].split('.')[-1] in lean,api['name']
allowed={packetpath,'research/blueprint/readmes/'+stem+'.md','research/blueprint/suggested/'+stem+'.lean','research/blueprint/handoff/BP-'+stem+'.md'}
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
    'otherSkipsMatchOriginal':True,'unchangedNodeObjects':162,'preservedStatements':163,'addedNodes':6,
    'scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
print(json.dumps(result,indent=2))
```

## Resume

Start with arbitrary-base conjugation transport: pull the actual cover back along a base arrow, compare composite and iterated pullbacks via the native mapComp isomorphism, use cover independence and the same-base cocycle, and detect equality by native Hom descent. Then assemble the natural centre unit, prove its inverse/naturality and evaluation at identity using mapId. Do not claim evaluation surjectivity merely from this fixed-base equivalence. Keep the chosen-band inverse, SF1 comparison and actual geometric-site examples explicit. All other scope gaps/requests remain as in the163-node packet.

---

# BP-AlgebraicModuliForArithmeticGeometry--A0-extension

Codex — codex-rtOQ9t; Refs #672. Partial checkpoint. No stage or reserved key is closed.

Claim 5958723720 was confirmed by bot 5958726791; the whole issue was read before and after claiming. Base d3c075d7689eec2439a5bc78e8813551730d72f5 contains PR #5818. The [predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/d3c075d7689eec2439a5bc78e8813551730d72f5/research/blueprint/handoff/BP-AlgebraicModuliForArithmeticGeometry--A0-extension.md) retains earlier full-paper, module/Picard/cohomology and finite-regression receipts, plus its native covering-descent proof archive. Historical receipts belong to their stated agents. The finite regression was not rerun here.

## Concrete delivery

Four new R09.4 nodes: coverAut_naturality, coverAut_inv, coverCenter and coverCenter_unique. The centre-unit construction has seven API items and four tests. All 144 earlier statements and 143 complete earlier node objects remain unchanged; only the central-section sheaf node’s prerequisites/proof outline changes. All 91 baseline entries, ten planets, 68 routes, 21 requests, reserved contracts and source-issue records are preserved.

Counts: 148 nodes (16 definitions, 34 constructions, 67 lemmas, 27 theorems, four comparisons), 171 total API items, 161 total tests; definition/construction-only counts 166 API items and 155 tests. Nine gaps remain. Four scope rows are partial and four not_read; every implementation status remains unchecked.

For a covering matching family, native full faithfulness detects the naturality equation at every fibre morphism. Native descent hom extensionality reduces it to the cover; the local centre unit’s naturality supplies the equation there. This requires only covering/prestack hypotheses. NatIso.ofComponents then supplies the actual identity-functor automorphism, including its inverse naturality; unitsEndEquivAut at that identity functor gives a unit of the existing categorical centre. All-object local uniqueness, identity, inverse and agreement with the (U,id) component of an existing section are checked. No new generic descent or stack carrier is planned.

The four native examples use the actual parameterized carriers: identity, inverse-family agreement, exact existing-section component and empty F(U). The empty-fibre example does not imply the whole central-section group on C/U is trivial. There is no newly instantiated geometric point-site, restriction-chain or root-gerbe fixture.

## Reading and owner boundary

Read all eight current reviewed library-audit rows; all 144 current node statements; all nine applicable RS-27 layer decisions and accepted status; confirmed algebraicgeometry/1,/2,/10,/11,/12,/14,/17,/18 and etale/25 claim/fix records. The earlier required whole upstream StableReduction/JacobianChallenge reads remain continuous-session history, not fresh reads for this checkpoint. D0 owns generic stacks/descent/stackification, SF1 owns ordinary spaces/sites/diagonals, and R09.4 retains the accepted algebraic-stack criteria/elliptic comparison. Generalized elliptic and abelian/PEL applications remain downstream without reverse cycles; stable pointed-curve moduli and coherent duality retain their reserved suppliers.

Fresh source reading is the complete statement and printed proof of [Stacks Lemma 8.11.8](https://stacks.math.columbia.edu/tag/06NY), including the final omitted varying-base conclusion, and the entire printed [Definition 8.4.1](https://stacks.math.columbia.edu/tag/026F). No referenced proof or whole paper is newly claimed. Their fresh downloaded HTML SHA256 values are 784df742e6d6c147f90645bfef73a6ad9fa60cb34e9b2d3006401857ed88a32e and 0024923a8e370df81c72261a9765c15c3e1d3bbb8b59a46ab41605f2f2ae60a0.

At Mathlib 082e2d3, read the actual NatIso.ofComponents, Aut.unitsEndEquivAut, CatCenter/ext/naturality, fully faithful map_injective/preimageIso, IsPrestack/IsPrestackFor/isPrestackFor′ and native DescentData.hom_ext statements/constructions. These declarations are already in the 91-entry baseline and are imported rather than replanned.

## Distinct native proof receipt

The [immutable new proof block](https://github.com/CBirkbeck/tauceti-explorer/blob/61239b522c3a1eb4f4bc646f6b144aaa0d2b3ae7/research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--A0-extension.lean) contains actual proofs for all ten new declarations and four examples. The recipe below combines its exact block with the predecessor’s actual native cover proofs at f0bb4f284aefaffe97578454ecf9a0588472103e. It does not use the predecessor’s admitted final cover declarations.

The resulting 578-line extraction (including ten audits) has eleven examples, zero errors, two unused inherited admission warnings and no other warnings. All ten kernel audits depend only on propext, Classical.choice and Quot.sound, with no admission dependency. It excludes global sheaf/evaluation-surjectivity and earlier TauCeti cohomology/module blocks. Runtime 3.30 seconds; maximum RSS 3264356 KiB; 65 GiB available before the single compiler process.

SHA256:

- Immutable full proof source: af52e5d4cec14f84e1aed2097178e41cae157e27a0afe1a732fbaa2dbf2e2f46.
- Native extraction with audits: 5ba7bf1bae0220dac0747c1a57b6db98b92e0b491de98658cb42ae79e87afe5c.
- Normalized native Lean output (compiler output only, scratch path removed): a25591883e5c4f92f1df636ebac7a909cfb897488bb4ef525b88bb0517a3762a.

## Distinct admitted-sketch receipt

All ten new declaration bodies and four new example bodies in the final suggested file are admitted under PROTOCOL §13. The separate 932-line extraction uses only Mathlib imports, the complete initial gerbe/banding prefix, an explicit namespace closure and the complete intrinsic-band namespace. It includes the unfinished global sheaf/evaluation-surjectivity signatures as admissions; earlier module/cohomology blocks and the TauCeti cohomology import are excluded.

It has 36 examples, zero errors, 38 admission warnings and no other warnings. Runtime 4.30 seconds; maximum RSS 3302744 KiB; 67 GiB available before the single process. The full suggested file remains uncompiled because the exact pinned TauCeti cohomology import has no compiled artifact. Both extractions use Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Lean 4.34.0-rc2. No Lake setup/cache/build/LSP was started. Neither receipt proves arbitrary-base compatibility or global central-section sheaf existence.

SHA256:

- Final suggested source: 6e150287ce6500aaa60bf0f5ded5ddbe458062a99febba8bde4befcbeca4442a.
- Admitted extraction: c29381a1c95b4bef492b358e7fcb7077264dc1e336cfc5ec94b1000a872151f2.
- Normalized admitted-sketch Lean output: 815882eddf1a31b8fc71963214d855ee370d78652f80c454ad43875d30db7f15.

Run this exact extraction recipe from the final submitted checkout containing both immutable commits. Outputs go into its own scratch directory; run each generated file separately with lake env lean from an existing exact-pin Mathlib build, observing WORKERS memory and time limits. Recipe SHA256 32944dbadf423ade7756936ec2f14f880092bfba760086e8173a0749b455852e.

```python
from pathlib import Path
import subprocess
output = Path("scratch-codex-rtOQ9t-center")
output.mkdir(exist_ok=True)
path = "research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--A0-extension.lean"
prior = "f0bb4f284aefaffe97578454ecf9a0588472103e"
archive = "61239b522c3a1eb4f4bc646f6b144aaa0d2b3ae7"
old = subprocess.check_output(["git", "show", prior + ":" + path], text=True)
new = subprocess.check_output(["git", "show", archive + ":" + path], text=True)
start = "/-- R09.4/band-center-cover-naturality"
stop = "/-- R09.4/band-center-sheaf: glue"
marker = "namespace TauCeti.AlgebraicGeometry\n\nopen CategoryTheory Opposite Bicategory\n\nvariable {C"
def imports_prefix_central(s):
    imports = "\n".join(l for l in s.splitlines() if l.startswith("import Mathlib"))
    prefix = s[s.index("open CategoryTheory Opposite Bicategory"):s.index("variable {A : Sheaf")]
    central = s[s.index(marker, s.index("/-! Intrinsic-band continuation")):]
    return imports + "\n" + prefix + "\nend TauCeti.AlgebraicGeometry\n", central
head, central = imports_prefix_central(old)
fragment = head + central[:central.index(stop)] + new[new.index(start):new.index(stop)]
fragment += "\nend IntrinsicBandSections\nend TauCeti.AlgebraicGeometry\n"
names = ["coverAut_naturality", "coverAut_inv", "coverCenter", "coverCenter_app_hom",
         "coverCenter_app_inv", "coverCenter_map_hom", "coverCenter_one", "coverCenter_inv",
         "coverCenter_unique", "coverCenter_existing"]
audits = "\n".join("#print axioms TauCeti.AlgebraicGeometry.IntrinsicBandSections." + n for n in names)
(output / "center-native.lean").write_text(fragment + "\n" + audits + "\n")
# Run this portion from the final submitted revision, not the intermediate archive.
submitted = Path(path).read_text()
head, central = imports_prefix_central(submitted)
central = central[:central.index("end TauCeti.AlgebraicGeometry") + len("end TauCeti.AlgebraicGeometry")]
(output / "center-admitted.lean").write_text(head + central + "\n")
```

## Packet and actual atlas validation

Indexed check_blueprint passes with zero errors/warnings. Intake file-policy and whitespace checks pass. The actual read-only build.assemble overlay retains all other promoted parts and yields 148 declarations and ten planets, no skipped links for this roadmap, all 24 computed scope/supplier stage paths reachable, and unchanged stage edges and other roadmaps’ skipped links. The stage DAG has 3017 vertices/8655 edges; the own declaration DAG has 148/282; the combined stage/151-reachable-declaration DAG has 3158/9152. All three are acyclic. The three reached external declarations are existing D0 stackification, groupoid quotient/2-fibre-product and Čech/derived-comparison suppliers. No assembled data or application file was written.

The reproducible read-only projection/preservation recipe follows. Run it from the same checkout as the base and final revision; it prints JSON and writes no atlas files. Script SHA256 fd088f8047e306d08b64c5f97fd374dfbf35204805dac1007540cbca85e56949.

```python
import json,sys,subprocess,hashlib,re
from pathlib import Path
from collections import defaultdict,deque
root=Path.cwd();sys.path.insert(0,str(root/"scripts"));import build
rid="AlgebraicModuliForArithmeticGeometry"
stem=rid+"--A0-extension"
packetpath="research/blueprint/packets/"+stem+".json"
roadmappath="research/blueprint/atlas/roadmaps/"+rid+".json"
base="d3c075d7689eec2439a5bc78e8813551730d72f5"
p=json.loads((root/packetpath).read_text());r=json.loads((root/roadmappath).read_text())
old=json.loads(subprocess.check_output(["git","show",base+":"+packetpath],text=True))
oldr=json.loads(subprocess.check_output(["git","show",base+":"+roadmappath],text=True))
load=build.load_promoted
def assemble(packet,definition):
 def overlay(*a,**k):
  ps,ds,defs=load(*a,**k)
  return ([(n,v) for n,v in ps if n!=stem]+[(stem,packet)],
   {**ds,stem:"research/blueprint/readmes/"+stem+".md"},
   defs)
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
inheritedMissing=[]
assert missing==inheritedMissing,missing
assert p["requests"]==old["requests"]
ar={x["id"]:x for x in a["roadmaps"]};cr={x["id"]:x for x in control["roadmaps"]}
assert ar[rid]["blueprint"]["declarations"]==cr[rid]["blueprint"]["declarations"]+4
assert ar[rid]["blueprint"]["planets"]==cr[rid]["blueprint"]["planets"]
assert ar[rid]["blueprint"]["skippedLinks"]==cr[rid]["blueprint"]["skippedLinks"]
assert all(ar[x].get("blueprint",{}).get("skippedLinks")==cr[x].get("blueprint",{}).get("skippedLinks") for x in cr)
for key in ("sourceIssues","requests","routedItems","keyDefinitions","routedItemAudit"):
 assert p[key]==old[key],key
on={n["id"]:n for n in old["nodes"]}
for id,n in on.items():
 for key in ("id","kind","statement","hypotheses","api","sources","implementationStatus","uses"):
  assert own[id].get(key)==n.get(key),(id,key)
 assert all(t in own[id].get("tests",[]) for t in n.get("tests",[]))
 assert all(a in own[id].get("acceptance",[]) for a in n.get("acceptance",[]))
assert p["baseline"]==old["baseline"]
unchanged=sum(own[id]==n for id,n in on.items())
assert unchanged==143
assert len(own)==148
assert all(n["implementationStatus"]=="unchecked" for n in own.values())
lean=(root/("research/blueprint/suggested/"+stem+".lean")).read_text()
for node in p["nodes"][len(old["nodes"]):]:
 for test in node.get("tests",[]):assert test["name"] in lean,test["name"]
for node in p["nodes"][len(old["nodes"]):]:
 for api in node.get("api",[]):assert api["name"].split(".")[-1] in lean,api["name"]
allowed={packetpath,"research/blueprint/readmes/"+stem+".md","research/blueprint/suggested/"+stem+".lean","research/blueprint/handoff/BP-"+stem+".md"}
changed=set(subprocess.check_output(["git","diff","--name-only",base],text=True).splitlines())
assert changed<=allowed,changed
for path in changed:
 assert not re.search(r"/(?:home|tmp|Users)/|file"+"://",(root/path).read_text()),path
result={"actualAssembler":True,"declarations":ar[rid]["blueprint"]["declarations"],"partDeclarations":len(own),"partPlanets":sum("planet" in n for n in own.values()),"planets":ar[rid]["blueprint"]["planets"],"ownSkippedLinks":ar[rid]["blueprint"]["skippedLinks"],
 "stageDAG":stageDAG,"ownDeclarationDAG":ownDAG,"stagesAndReachableDeclarations":combined,
 "reachableDeclarations":len(used),"externalDeclarations":sorted(used-set(own)),
 "requiredStagePairs":len(pairs),"requiredStagePairsReachable":len(pairs)-len(missing),"inheritedMissingStagePairs":missing,"stageEdgesUnchanged":True,
 "otherSkipsMatchOriginal":True,"unchangedNodeObjects":unchanged,
 "scriptSha256":hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}

print(json.dumps(result,indent=2))
```

## Resume

Next prove compatibility under every g:W→V of the fibre-centre units formed on the pullback covering sieves, comparing on common covering refinements and retaining the native mapId/mapComp transports. Then assemble their family over all a:V→U into an actual IntrinsicBandSection, apply covering separatedness for uniqueness and prove the existing isSheaf statement. The present fibre-centre unit and all-object uniqueness do not discharge arbitrary-base restriction or assembly.

Continue abelian-inertia evaluation surjectivity, the locally glued inverse of the chosen-band comparison and the SF1 descended-slice comparison. Instantiate actual connected/disconnected point-site classifying groupoids, the restriction-chain site without a terminal object and nonneutral O(1) root gerbes. Continue all broader source reading, nine gaps and 21 requests before claiming stage or reserved-key closure.


## Current continuation — Codex codex-a71f92, issue #672

All preceding continuation receipts and their resume sections are historical. The current frontier is below. Base d7d17eaa67f35fa990fcbbfcc3e1a37108e764e1 includes PR #5832. Seven new declaration-sized leaves preserve all 148 existing statements and 147 complete node objects. The inherited sheaf theorem receives the stronger prestack-sheaf supplier; no earlier statement, reserved id, 68 source route, 21 request, source issue, stage id or planet changes.

### Established sub-obligation

The native centre units over every pullback covering sieve commute with every base restriction. The comparison is checked using the actual native mapComp natural isomorphism and centre naturality, not strict equality of iterated pullback objects. The matching dependent arrow indices are reconciled by base-category associativity and proof irrelevance.

These units form an actual IntrinsicBandSection; its restrictions recover the original matching family. Existing covering separatedness proves uniqueness and recovery of an existing section. Identity and inverse gluing are exact. Finally, a direct Hom(E,-)-valued proof establishes the actual categorical Presheaf.IsSheaf predicate for every prestack, without groupoid fibres, terminal objects or fibre products. Preservation of zero and addition in each assembled abelian-group homomorphism is proved by cover separatedness and local homomorphism laws. The generic stack/descent carrier remains imported, never rebuilt.

The old intrinsic-band gap is not removed: general Hom-gluing/sheafness is now discharged, but abelian-inertia evaluation surjectivity, the locally glued chosen-band inverse and the actual SF1 slice comparison remain unfinished. All eight stages, nine broader gaps and 21 supplier requests remain partial/not_read/open.

### Sources, ownership and finding boundaries

Freshly read the entire printed Stacks Lemma8.11.8 proof and Definition8.4.1; exact HTML hashes are the two new source records. This is the derived completion of the omitted varying-base argument, not a source quotation claiming that proof was printed. The pinned mapComp′, its naturality, Cat.Hom.toNatIso, categorical/type-valued sheaf definitions and epi cancellation were read before adding seven baseline entries. All 91 inherited baseline entries and all historical whole-paper receipts remain credited to their original readings.

The current eight audit rows and accepted RS27 narrowing remain binding. The nine confirmed area finding claim/fix records were rechecked. Their existing handling is preserved: /1 imports spaces/sites/diagonals from SF1 and ordinary stacks/descent from D0; /2 retains the explicit approximation/G-ring/Popescu supplier rather than a backwards Artin cycle; /10 imports anchor descent classes; /11 imports the affine Weil-restriction cases; /12 imports relative Proj/Grassmannian anchors; /14 keeps the non-Noetherian/Tor-amplitude extension; /17 imports StableReductionPartII:key/moduli-curves; /18 and etale/25 import SchemeAndStackFoundations:key/coherent-duality. No new whole-paper, finite-regression or geometric-site fixture receipt is claimed.

### Compilation receipt

The full suggested file is uncompiled: its exact pinned TauCeti cohomology module has no existing compiled artifact. No new Lake project, library build or cache download was made. A single Lean process at a time ran in the existing build at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Available memory was at least 64 GiB in these checks, above the 20-GiB threshold, and each invocation had a 20-minute timeout.

The actual native proof block is archived at commit 7ce3625771acbf90d4fb6e6495cd30bc0d867e4c (suggested deliverable path only); the recipe combines it with the two native predecessor archives, avoiding the admitted cover proofs in the final file. The audited extraction has 922 lines, 17 examples and 17 new kernel audits: zero errors, two unused inherited admission warnings and no other warnings. Every new audit depends only on propext, Classical.choice and Quot.sound, never an admission. Its SHA-256 is c537788524541bf1ae88971f6b28f6c807e4cedc2258ce107fafb154e74068ec; normalized Lean-output SHA-256 2ed0ec3f217395efdbb33d242fe6f49f5080bad765ccd67ffee13fea37027bc4. RSS 3353912 KiB, elapsed 3.93 seconds.

The final new signatures and six examples have admitted bodies as required by PROTOCOL §13; the routine pullbackArrow is a reducible indexing alias with actual data. The final Mathlib-only extraction has 1,131 lines and 42 examples: zero errors, 61 admission warnings and no other warnings. SHA-256 ee67893a7278573cee36d9ededbf3bce49ceb5406b0adb364644eb063e615580; normalized output SHA-256 40320048cd4a85c66815cefade444f46a7c7d1b34a6b671234516925ba6a32a0. RSS 3325820 KiB, elapsed 4.65 seconds. Neither extraction validates the inherited module/cohomology blocks or the full file. All implementationStatus values remain unchecked.

### Immutable-source reconstruction

Read the three commits into the existing shared clone with read-only fetches. The following recipe takes that clone and the submitted suggested text and returns two strings for own-scratch files. Use apply_patch to materialize those strings, then run one existing-build Lean process per file. It creates no repository snapshot and writes nothing to the shared tree. Strip only the own scratch-directory prefix and the resource-timing tail to reproduce the normalized output digests.

```python
"""Read immutable proof sources. Return strings for apply_patch; never edit the shared tree."""
import subprocess
from pathlib import Path
def reconstruct(repo,submitted):
    path="research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--A0-extension.lean"
    def read(ref):return subprocess.check_output(["git","show",ref+":"+path],cwd=repo,text=True)
    old=read("f0bb4f284aefaffe97578454ecf9a0588472103e")
    prior=read("61239b522c3a1eb4f4bc646f6b144aaa0d2b3ae7")
    new=read("7ce3625771acbf90d4fb6e6495cd30bc0d867e4c")
    start="/-- R09.4/band-center-cover-naturality"
    stop="/-- R09.4/band-center-sheaf: glue"
    marker="namespace TauCeti.AlgebraicGeometry\n\nopen CategoryTheory Opposite Bicategory\n\nvariable {C"
    def head(s):
        imports="\n".join(l for l in s.splitlines() if l.startswith("import Mathlib"))
        prefix=s[s.index("open CategoryTheory Opposite Bicategory"):s.index("variable {A : Sheaf")]
        return imports+"\n"+prefix+"\nend TauCeti.AlgebraicGeometry\n"
    def central(s):return s[s.index(marker,s.index("/-! Intrinsic-band continuation")):]
    oldcentral=central(old)
    nativehead=head(old)+oldcentral[:oldcentral.index(stop)]+prior[prior.index(start):prior.index(stop)]
    firstmarker="/-! Arbitrary-base cover descent continuation, Codex codex-a71f92. -/\n"
    secondmarker="/-! Unique gluing and prestack sheaf descent continuation. -/\n"
    a=new[new.index(firstmarker)+len(firstmarker):new.index(stop)]
    # Each insertion contributes one separator newline after the archived block.
    a=a[:-1]
    b=new[new.index(secondmarker)+len(secondmarker):new.index("variable [hGerbe : IsGerbe F J]")]
    b=b[:-1]
    local=new[new.index("/-- Specific descent of evaluations"):new.index(secondmarker)]
    local=local.rstrip("\n")+"\n\n"
    names=["center_map_comp","centerFamily_congr","coverCenterAt","coverCenterAt_map_hom","coverCenterAt_compatible","coverCenterAt_one","coverCenterAt_inv","coverCenterAt_of_mem","glue","glue_val","glue_restrict","glue_one","glue_inv","coverCenterAt_existing","glue_unique","glue_existing","isSheaf_of_prestack"]
    native=nativehead+"\n\n"+a+"variable (J : GrothendieckTopology C)\n\n"+local+"\n"+b
    native+="\n".join("#print axioms "+n for n in names)+"\nend IntrinsicBandSections\nend TauCeti.AlgebraicGeometry\n"
    sketch=head(submitted)+central(submitted)
    return native,sketch
```

### Current counts and resume

155 nodes: 16 definitions, 36 constructions, 71 lemmas, 28 theorems and four comparisons. 183 total API items and 167 total tests; definition/construction totals 178 API items and 161 tests. Ten planets, 98 baseline declarations, nine gaps and 21 requests. Four coverage rows partial, four not_read. The gerbe reserved key is still partial.

Next prove evaluation surjectivity for abelian-inertia gerbes by local object-isomorphism transport. Then construct the locally glued inverse to the chosen-band comparison and compare with the actual SF1 descended slice sheaf. Instantiate the specified connected/disconnected point sites, terminal-free restriction-chain site, and nonneutral O(1) root gerbes. Continue the source reading and supplier requests of all other branches before claiming stage or reserved-key closure.


### Current atlas and preservation receipt

Publication preflight uses immutable base 09bb3d03b8984582f3e9d686ffaf0fcd4568f9f6. The fourteen targeted instruction, audit, roadmap and deliverable inputs and all eight scoped library-audit rows are unchanged from the mathematical audit base. The reserved-id registry is also unchanged. Both the original 148-node packet and this 155-node candidate were overlaid into the actual assembler while retaining every other promoted part; an unpromoted checkpoint was not treated as an empty baseline.

The indexed checker returns zero errors and zero warnings; actual intake and whitespace/private-path checks pass. The own declaration DAG has 155 vertices and 303 edges. The atlas stage DAG has 2966 listed stages and 8655 edges. Including all edge endpoints, all 158 reachable declarations (155 own and three existing suppliers), their parent-stage links, and all 21 request links gives 3165 vertices and 9180 edges. All three DAGs are acyclic. All 24 required stage paths are reachable: roadmap requires, explicit stage prerequisites and request suppliers are included. Own pending/skipped links are empty, other roadmap skips are unchanged, and no stage edge is added. The additional backwards dependency traversal, including baseline references, reaches 270 identifiers without a cycle.

For the historical read-only projection recipe above, use this publication base and the current candidate, change the declaration increment to seven, the unchanged-node assertion to 147, and total own nodes to 155. Replace whole-baseline equality by equality of the first 91 inherited baseline declarations; the seven appended declarations are the new native suppliers. Use endpoint-complete vertex counts as in that recipe's dag function. All requests, source issues, reserved-key mappings and routed-item audits remain equal. These are current receipts, not the old 148-node receipt. The exact own scratch validator SHA256 is 6eb7572f757dd28c08bc3c52c7589c12468d48a3338fdca62f7f3e1d3bf928e9; it executes the immutable-tree checker/intake/assembler and writes no repository or atlas files. The immutable proof-source archive is an additional parent of the final PR commit, so the native reproducer's commit remains reachable.

## Current continuation — Codex codex-5ebb6f, issue #672

All preceding continuation/resume receipts are historical. This continuation starts at immutable main62abfc13962892abfacb792ccb3527b37103aa42, containing the155-node packet from PR#5842. Eight new leaves give163 nodes:16 definitions,39 constructions,75 lemmas,28 theorems and five comparisons. There are198 total API items and178 total tests; the indexed definition/construction counts are190 API items and172 tests. All155 earlier statements and153 complete node objects are preserved. Only the existing choice-independence and evaluation-surjectivity nodes gain native adapters/suppliers and a precise frontier. All98 baseline references,10 planets,68 routed source items,21 requests, nine gaps, eight coverage rows and reserved ids remain unchanged.

### Established sub-obligation and frontier

For a fixed sieve R, objects x,y and arbitrary local isomorphisms e_i between their pulled-back objects, local conjugates of a∈Aut(x) form an actual native descent automorphism of y when inertia is commutative. The isomorphisms e_i need not form descent data. At every common test object, compare e₁ followed by the y transition with the x transition followed by e₂; their conjugation maps agree because the source automorphism group is commutative. The original a supplies the actual x transition equation. Native DescentData.isoMk supplies the inverse equation by its existing cancellation proof.

For a covering R of a prestack, the existing fully faithful canonical descent functor lifts that isomorphism to an actual Aut(y). Every local restriction recovers its prescribed conjugate, and faithfulness proves uniqueness. Replacing the e_i on this same R has no effect. The construction is a native group homomorphism, with exact identity, multiplication and inverse laws. A global x-to-y isomorphism gives precisely the existing Mathlib conjugation; when x=y the resulting map is the identity for arbitrary local choices.

This is a local-conjugation supplier for the existing evaluation-surjectivity route. It does NOT prove independence under changing/refining R or compatibility under arbitrary further base restriction. Next choose the local-isomorphism covers supplied by IsGerbe, prove independence on common refinements and the pullback law retaining native mapComp constraints, then form the actual compatible centre units over every V→U and prove evaluation surjectivity. Continue the chosen-band inverse and actual SF1 descended-slice comparison after that. The existing prestack centre-sheaf proof is retained and is not redone.

The two covering constructions require only native prestack morphism descent, given local isomorphisms and commutative inertia. They require no terminal object, fibre products, object effectivity, chosen coefficient sheaf or global neutrality. No generic stack, sheaf or descent carrier is redefined. Continue the connected/disconnected point-site groupoids, terminal-free restriction-chain site and nonneutral O(1) root-gerbe fixtures; none is claimed instantiated here. All wider source reading and open suppliers remain mandatory before stage/key closure.

### Reading and ownership receipt

Fresh full reading: all155 current statements/hypotheses, the303-line incoming handoff, all eight reviewed audit rows, accepted RS27 nine scoped decisions and the relevant R09.4 owner/link records, the gerbe reserved contract and nine confirmed finding records. Fresh pinned native reading covers Aut multiplication/conjugation, Functor.mapAut, native DescentData/isoMk/ofObj/toDescentData and their transition equations, prestack full faithfulness, FullyFaithful.preimageIso/map_preimage/map_injective, and the Hom presheaf/pullHom interface. Native searches find no IsGerbe, IntrinsicBandSection, AbelianBanding or GerbeAutTransport declaration in pinned TauCeti, and no choice-independence or functorial-conjugation theorem alongside Mathlib's existing autMulEquivOfIso definition. These searches are scoped absence checks, not assertions about every library notion.

The entire printed Stacks Lemma8.11.8 statement/proof at https://stacks.math.columbia.edu/tag/0CJY was freshly read, including the empty-fibre construction and explicitly omitted varying-base conclusion. HTML SHA25641dd0c0a1e20dfe2fd60212274a30f259ae0875225b1540b069adf3f89f27a9e; accessed2026-10-02. The native overlap/descent adapter is derived from its local-conjugation argument. No new whole-paper read is claimed. Prior paper receipts retain their original authors/readings.

RS27 keeps ordinary stacks/descent at D0 and spaces/sites/diagonals/atlases at SF1; specialized generalized-elliptic and PEL applications remain downstream. The confirmed finding handling is unchanged: algebraicgeometry/1 imports SF1/D0; /2 retains approximation/G-ring/Popescu suppliers without a backwards Artin cycle; /10 imports anchor descent; /11 imports affine Weil restriction; /12 imports Proj/Grassmannian anchors; /14 keeps non-Noetherian/Tor-amplitude extensions; /17 imports StableReductionPartII:key/moduli-curves; /18 and etale/25 import the SF coherent-duality reserved key. There is no new stage edge or ownership change.

### Native and submitted compilation boundaries

The full suggested file is uncompiled because the exact pinned TauCeti cohomology import has no available existing compiled artifact. No library build, Lake-project setup, cache download or language server was used. A single existing-build Lean process ran at a time with a1200-second timeout, after free-memory checks of at least61GiB, exceeding WORKERS'20GiB floor.

The actual proof is archived in the suggested deliverable at immutable commit57332e8119e7f8e152f41484583d1291bfc2f92d, between BEGIN/END ARCHIVED CHECKED GERBE CONJUGATE DESCENT. This complete standalone342-line source uses only two Mathlib imports and the native carriers; no earlier proof archive or admitted intrinsic-band prototype is a dependency. Eleven examples and19 kernel audits pass with zero errors or warnings. Every audit has only propext, Classical.choice and Quot.sound, with no admission dependency. Source SHA2569af35ace261858f92b9980584627d8803adf5c06281a64948e3ed7b52e1227ac; normalized output SHA2569ee57dbbc75193069c8a87aaeb1e01d8b55b52769aa0cd3f5325d19eb5f1cca3. Elapsed2.00s, RSS2051672KiB, available memory63GiB.

The final canonical new bodies are all admissions as PROTOCOL§13 requires; all implementationStatus fields stay unchecked. The admitted Mathlib extraction has1363 lines and53 examples: zero errors,91 admission warnings, no other warnings. Source SHA25678a1c04f52ef3274ce1b068753e2f122a66420350aad7cc7ff713643d25ffaa9; normalized output SHA256d409dd1dab9ba1af7a182d3bab9fd7d83c105d38877d02944e7cc2b9924b4fca. Elapsed6.10s, RSS3306732KiB, available memory61GiB. This extraction does not certify inherited TauCeti module/cohomology blocks or the whole file. The19 new canonical headers match the actual native archive; the inherited pointwise banding_iso_independent header is also audited in its native form.

The archive remains an ancestor of the submitted commit. Read it with git show from the shared clone. The following function returns the two exact strings for own-scratch files; it copies no repository snapshot and edits no atlas or shared file. Materialize them in your own disk scratch, then run one existing-build lake env lean process per file. Normalize output by removing only the scratch-path prefix and resource-timing tail.

```python
import subprocess
def reconstruct(repo,submitted):
    path="research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--A0-extension.lean"
    archived=subprocess.check_output(["git","show","57332e8119e7f8e152f41484583d1291bfc2f92d:"+path],cwd=repo,text=True)
    native=archived.split("BEGIN ARCHIVED CHECKED GERBE CONJUGATE DESCENT\n",1)[1].split("END ARCHIVED CHECKED GERBE CONJUGATE DESCENT",1)[0]
    imports="\n".join(l for l in submitted.splitlines() if l.startswith("import Mathlib"))
    prefix=submitted[submitted.index("open CategoryTheory Opposite Bicategory"):submitted.index("variable {A : Sheaf")]
    marker="namespace TauCeti.AlgebraicGeometry\n\nopen CategoryTheory Opposite Bicategory\n\nvariable {C"
    central=submitted[submitted.index(marker,submitted.index("/-! Intrinsic-band continuation")):]
    sketch=imports+"\n"+prefix+"\nend TauCeti.AlgebraicGeometry\n"+central
    return native,sketch
```

### Actual atlas and preservation receipt

Publication preflight uses immutable main44c8eda3f52da4d734be74ccac5a73f15dc58a94. All fourteen targeted rule/audit/owner/roadmap/deliverable/checker inputs are unchanged from the mathematical base; concurrent changes in other roadmaps are retained in this branch and the actual assembler. The indexed packet checker has zero errors/warnings. Actual intake, four-deliverable, JSON, private-path and whitespace checks pass. The actual build.assemble overlay retains every other promoted part, comparing this candidate with the incoming155-node packet. Own pending/skipped links are empty, other roadmap skips and all stage edges are unchanged, and all24 scope/supplier stage paths are reachable. The own declaration DAG is163 vertices/319 edges; endpoint-complete stage DAG3017/8655; stage-plus166 reachable declarations graph3173/9204. All are acyclic. Three reached external declarations are existing D0 suppliers. No synthetic stage attachment or application/atlas file was written.

The following read-only script reproduces the assembler and preservation checks from the stated base and candidate. Its SHA256204f1cff78a0c208ce634b8a7cf6819f1bdbc3658906c9ff5a9fbbae892beeac. Counts include actual endpoint vertices, even when a stage endpoint is not a listed stage object.

```python
import json,sys,subprocess,hashlib,re
from pathlib import Path
from collections import defaultdict,deque,Counter
root=Path.cwd();sys.path.insert(0,str(root/'scripts'));import build
rid='AlgebraicModuliForArithmeticGeometry';stem=rid+'--A0-extension'
packetpath='research/blueprint/packets/'+stem+'.json'
base='44c8eda3f52da4d734be74ccac5a73f15dc58a94'
p=json.loads((root/packetpath).read_text())
old=json.loads(subprocess.check_output(['git','show',base+':'+packetpath],text=True))
r=json.loads((root/('research/blueprint/atlas/roadmaps/'+rid+'.json')).read_text())
load=build.load_promoted
def assemble(packet):
    def overlay(*a,**k):
        ps,ds,defs=load(*a,**k)
        return ([(n,v) for n,v in ps if n!=stem]+[(stem,packet)],
            {**ds,stem:'research/blueprint/readmes/'+stem+'.md'},defs)
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
assert ar[rid]['blueprint']['declarations']==cr[rid]['blueprint']['declarations']+8
assert ar[rid]['blueprint']['planets']==cr[rid]['blueprint']['planets']
assert ar[rid]['blueprint']['skippedLinks']==cr[rid]['blueprint']['skippedLinks']
assert not ar[rid]['blueprint'].get('pendingLinks')
assert all(ar[x].get('blueprint',{}).get('skippedLinks')==cr[x].get('blueprint',{}).get('skippedLinks') for x in cr)
for key in ('sourceIssues','requests','routedItems','keyDefinitions','routedItemAudit','baseline','coverage','gaps'):
    assert p[key]==old[key],key
on={n['id']:n for n in old['nodes']}
for id,n in on.items():
    for key in ('id','kind','statement','hypotheses','sources','implementationStatus','uses'):
        assert own[id].get(key)==n.get(key),(id,key)
    assert all(t in own[id].get('tests',[]) for t in n.get('tests',[]))
    assert all(x in own[id].get('api',[]) for x in n.get('api',[]))
    assert all(x in own[id].get('acceptance',[]) for x in n.get('acceptance',[]))
assert sum(own[id]==n for id,n in on.items())==153
assert len(own)==163
assert all(n['implementationStatus']=='unchecked' for n in own.values())
lean=(root/('research/blueprint/suggested/'+stem+'.lean')).read_text()
for node in p['nodes'][len(old['nodes']):]:
    assert node['declarationName'].split('.')[-1] in lean
    for test in node.get('tests',[]):assert test['name'] in lean,test['name']
    for api in node.get('api',[]):assert api['name'].split('.')[-1] in lean,api['name']
allowed={packetpath,'research/blueprint/readmes/'+stem+'.md','research/blueprint/suggested/'+stem+'.lean','research/blueprint/handoff/BP-'+stem+'.md'}
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
    'otherSkipsMatchOriginal':True,'unchangedNodeObjects':153,'preservedStatements':155,'addedNodes':8,
    'scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
print(json.dumps(result,indent=2))
```
