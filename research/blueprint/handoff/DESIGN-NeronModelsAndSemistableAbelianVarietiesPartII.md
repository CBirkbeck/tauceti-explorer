# Quadratic finite-extension parity — #3378

Codex — codex-J6LwjP; 2 October2026. Claim5961771184, bot5961772756. Read base `4a1f4b6f4dc475b67e029001f90053ff85163a04`.

This is a partial design checkpoint. Five specialized G.1 lemma nodes and seven typed examples advance the predecessor’s finite-extension frontier. For an irreducible quadratic over k, the receiving root exists exactly when2 divides the native relative finrank. With explicit nonzero quadratic discriminant, the distinct-root count is2 or0, native one-component pointCount is card(L) or card(L)+2, its power form is card(k)^n or card(k)^n+2, and the existing integer count defect is1 or−1. These are equation-level inputs for the still-open geometric consumer. Generic finite-field embedding/extension/cardinality theory is imported from the pinned libraries, never planned again.

The packet has198 nodes:13 definitions,144 lemmas,26 theorems,5 comparisons,10 constructions;89 API items;102 raw tests (86 definition/construction tests,16 additional lemma tests);29 planets;160 baseline declarations;17 gaps;23 requests;78 route records;21 source findings;7 partial stages and0 closed. All193 inherited statements, hypotheses, sources, acceptance, API, tests, uses and implementation statuses are preserved.192 whole node objects are identical; only quadratic-extension-counts gains four proved inputs and an updated final proof step. All prior metadata and the complete roadmap bytes are retained. The reserved Ferrand geometric-square predicate and its scheme versus algebraic-space existence hypotheses remain intact for both Witaszek and Schröer consumers.

## Actual proof and exact validation scope

The [immutable checked proof snapshot](https://github.com/CBirkbeck/tauceti-explorer/blob/31e1edfddca815057809280d4b01ae904eda2910/research/blueprint/suggested/NeronModelsAndSemistableAbelianVarietiesPartII.lean) stores the545-line actual source between BEGIN/END ARCHIVED CHECKED QUADRATIC EXTENSION PARITY markers. Its initial370 lines are byte-identical to the [predecessor snapshot](https://github.com/CBirkbeck/tauceti-explorer/blob/e4ff005892a37a27cbabd336972a18d90bc4ad5d/research/blueprint/suggested/NeronModelsAndSemistableAbelianVarietiesPartII.lean), SHA2561970269a7c653d423ace5bd6fe2192c06672031cffcbd88e9dd1d78eb8b8c6b8. The20 named audits (15 inherited,5 new) report only propext,Classical.choice,Quot.sound, with no admitted axiom. All19 examples pass (12 inherited,7 new). Actual source has0 errors,0 warnings and no admissions.

Actual source SHA256 `99bf40cb0c2dd38f00d6b2466a887b5e21ba49f4cf50530726f97fb869a7e6ec`; normalized diagnostics SHA256 `73e94bb8339daed612cf13999e0b1cee66e31ff22553c9ce8b8e5bcbe48cafcd`; elapsed3.40s, maximumRSS6795264KiB, available56GiB before invocation. Exact admitted extraction:262 lines,19 examples,0 errors,39 admission warnings and0 other warnings; elapsed2.50s, maximumRSS6734812KiB, available57GiB. Source SHA256 `5bdac8ea7dc35f5e0bdd5e116c0e9865156c81140017b3eb5a3de0d3e3c88023`; normalized diagnostics SHA256 `3d5b2c1eb789fa7d81a46e8a30fda7a543eba95755362b4b98c6a9ec8078d2f4`. The five new lemma headers and seven example statements compare mechanically equal between actual and admitted fragments. All new submitted outer bodies are admitted under PROTOCOL§13.

**The full TauCeti-importing suggested file was not compiled.** The existing pinned build lacks PointCount and other required compiled TauCeti artifacts. The receipt covers precisely the native/admitted fragments with the exact pinned public PointCount namespace fixture, not a pruned whole-file compilation. Credit: The Tau Ceti contributors, Copyright2026, Apache2.0, [PointCount at the exact pin](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean). The fixture is only in the actual check archive; the submitted head imports it without duplicated library definitions. Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174, TauCeti f790474821cf4256814db967cb154e7af3d0c369, Lean4.34.0-rc2. No setup/update/cache/library build, language server or concurrent Lean invocation; each run checked memory and used the20-minute timeout.

## Tests, library and source evidence

The new examples use the actual existing FiniteField.Extension fields with the explicit native extension Algebra instance. ZMod’s general algebra instance is otherwise preferred, so that choice is required to rewrite the native finrank theorem without treating an isomorphic field as definitionally identical. The base irreducibility tests use the existing degree-one-through-three root criterion with exhaustive ZMod2/ZMod3 evaluation. They assert binary counts4,4,10 in degrees1,2,3; no root in degree3; two distinct roots in degree2; count9 over the ternary degree2 extension; and binary degree2 numerical defect1. No assumed root/parity/count witness or external computation oracle enters these proofs.

Ten new baseline citations: FiniteField.nonempty_algHom_iff_finrank_dvd; AdjoinRoot.instField,liftAlgHom,aeval_algHom_eq_zero; finrank_quotient_span_eq_natDegree; Polynomial.natDegree_quadratic; Module.natCard_eq_pow_finrank; FiniteField.Extension,finrank_extension; Polynomial.irreducible_of_degree_le_three_of_not_isRoot. Actual statements/constructions and ambient hypotheses were read at the pin before citation. Native PointCount was fully read again. Five exact helper-name searches through both pinned source trees had no matches; this does not claim exhaustive mathematical absence. Parent reviewed AUDIT-10 R11.1–R11.6 rows were read; no own PartII reviewed row was found. Full current issue,193 mathematical statements/hypotheses,495-line predecessor handoff,seven stage descriptions,reserved Ferrand node,full key-definition entry and78-item owner brief were read. Complete routed items15–18,170–171 were read; other historical source/extraction receipts retain their attribution. The required nearby upstream documents were fully read earlier in this continuous loop.

Fresh source: [Schröer arXiv2004.07025v3](https://arxiv.org/html/2004.07025v3), §3 conductor diagrams and complete Proposition3.1–3.2 proofs/table. HTML SHA256 d14049912dcab6a438ed62363e246d0087c61342c51813ac482f5aba48d92456, acquired2 October2026. The native every-extension lemmas are authored deductions, not printed theorems attributed to the paper. No fresh full-paper/Annals erratum collation or predecessor Python regression rerun is claimed. All21 inherited source findings, their corrections and verification states are preserved.

## Atlas and preservation checks

Indexed checker:0 errors,0 warnings. Actual intake passes; whitespace check passes. Read-only scripts/build.py assembly injects the own packet and new roadmap definition into both candidate and original-packet control, preserving other promoted work. Stage graph2992 vertices/8727 edges; own declaration graph198/477; stage-plus-reachable-declaration graph3212/9589;604 recursively reachable dependency vertices,198 reachable declaration nodes. All three graphs are acyclic and all69 required stage pairs remain reachable. Stage edges and unrelated skipped-link sets compare equal; no own pending or skipped links and no new unresolved references. Parent-stage context edges in the combined graph are diagnostic context, not mathematical proof dependencies. Actual tauceti:TauCetiRoadmap references remain stage vertices, not library declaration leaves.

The broader inherited supplier closure still reaches28 UPSTREAM placeholders. They compare equal with the original-packet control and remain open supplier obligations; they are not certified library facts. The complete list is recorded in quadraticExtensionParityContinuation.checks. Thus this checkpoint does not claim complete recursive proof closure of the roadmap. New specialized lemma prerequisites terminate in verified native baseline declarations and prior own nodes. No atlas data is written.

Graph/reconstruction script SHA256 `c0ec77914f93a3b23f74311d31224c1b3c1daf11f5fd2029652dfb067736291b`. Save the exact Python below in own disk-backed scratch and run from a checkout of this submitted commit. It reconstructs the545-line actual source,262-line admitted fragment and original packet/roadmap, verifies source/header parity and preservation, then calls the actual assembler with control and reports graphs. It writes only a small own scratch directory. Using an already-existing build at the specified pins, run one Lean invocation at a time for ExtensionParity.lean and Admitted.lean (memory at least20GiB; timeout1200s; no setup or library build). Normalize diagnostics by replacing the absolute source directory with the basename and removing the timing footer, preserving a final newline; compare the hashes above. Delete scratch after checks.

```python
from pathlib import Path
from collections import Counter,defaultdict
import sys,json,re,hashlib,subprocess
root=Path.cwd();sc=root.parent/'scratch-neron-extension-reproduce';sc.mkdir(exist_ok=True)
rid='NeronModelsAndSemistableAbelianVarietiesPartII';base='4a1f4b6f4dc475b67e029001f90053ff85163a04';archive='31e1edfddca815057809280d4b01ae904eda2910'
def blob(folder,ext,commit=base):
 name=('DESIGN-' if folder=='handoff' else '')+rid+'.'+ext
 return subprocess.check_output(['git','show',f'{commit}:research/blueprint/{folder}/{name}']).decode()
p=json.loads((root/'research/blueprint/packets'/f'{rid}.json').read_text());orig=json.loads(blob('packets','json'));road=json.loads((root/'research/blueprint/roadmaps'/f'{rid}.json').read_text());origroad=json.loads(blob('roadmaps','json'))
lean=(root/'research/blueprint/suggested'/f'{rid}.lean').read_text();reader=(root/'research/blueprint/readmes'/f'{rid}.md').read_text()
old={n['id']:n for n in orig['nodes']};new={n['id']:n for n in p['nodes']}
for nid,n in old.items():
 for k in ['id','kind','statement','hypotheses','acceptance','sources','implementationStatus','uses','api','tests']:assert n.get(k)==new[nid].get(k),(nid,k)
 assert n.get('prerequisites',[])==new[nid].get('prerequisites',[])[:len(n.get('prerequisites',[]))],nid
unchanged=sum(n==new[nid] for nid,n in old.items());assert unchanged==192
for k in orig:
 if k in ['summary','nodes','baseline','sources','coverage']:continue
 assert orig[k]==p[k],k
assert p['baseline']['declarations'][:150]==orig['baseline']['declarations']
assert p['sources'][:len(orig['sources'])]==orig['sources']
for a,b in zip(orig['coverage'],p['coverage']):
 assert {k:v for k,v in a.items() if k!='remaining'}=={k:v for k,v in b.items() if k!='remaining'}
 assert a['remaining']==b['remaining'][:len(a['remaining'])]
assert road==origroad and (root/'research/blueprint/roadmaps'/f'{rid}.json').read_text()==blob('roadmaps','json')
assert p['status']=='partial' and all(n['implementationStatus']=='unchecked' for n in new.values())
assert Counter(c['status'] for c in p['coverage'])=={'partial':7}
for nid,n in new.items():
 if nid in old:continue
 assert n['statement'] in reader
 assert re.search(r'^lemma '+re.escape(n['declarationName'].rsplit('.',1)[1])+r'\b',lean,re.M),nid
 for t in n.get('tests',[]):assert t['name'] in lean and t['name'] in reader and t['statement'] in reader
originalLean=blob('suggested','lean');imports='import Mathlib.FieldTheory.Finite.GaloisField\nimport Mathlib.FieldTheory.Finite.Extension\nimport Mathlib.FieldTheory.Finiteness\nimport Mathlib.Algebra.Polynomial.Degree.SmallDegree\nimport Mathlib.Algebra.Polynomial.SpecificDegree\n'
assert lean.startswith(originalLean.replace('import Mathlib.Algebra.Category.Ring.Constructions\n',imports+'import Mathlib.Algebra.Category.Ring.Constructions\n'))
a=blob('suggested','lean',archive).split('BEGIN ARCHIVED CHECKED QUADRATIC EXTENSION PARITY\n',1)[1].split('END ARCHIVED CHECKED QUADRATIC EXTENSION PARITY\n',1)[0]
assert hashlib.sha256(a.encode()).hexdigest()==p['quadraticExtensionParityContinuation']['native']['sourceSha256']
assert hashlib.sha256(''.join(a.splitlines(keepends=True)[:370]).encode()).hexdigest()=='1970269a7c653d423ace5bd6fe2192c06672031cffcbd88e9dd1d78eb8b8c6b8'
fixture=a[a.index('\nnamespace TauCeti'):a.index('\nnamespace TauCeti.GenusOne')]
def fragment(marker):return lean.split('/- BEGIN '+marker+' -/\n',1)[1].split('/- END '+marker+' -/',1)[0]
sketch='import Mathlib\n'+fixture+'\n'+fragment('QUADRATIC POINT PARAMETRIZATION')+'\n'+fragment('QUADRATIC ROOT BRANCH COUNTS')+'\n'+fragment('QUADRATIC EXTENSION PARITY')+'\n'
assert hashlib.sha256(sketch.encode()).hexdigest()==p['quadraticExtensionParityContinuation']['admittedExtraction']['sourceSha256']
headers=lambda s:re.findall(r'^(?:lemma |example ).*? := by',s,re.M|re.S)
actualnew=''.join(a.splitlines(keepends=True)[370:]);actualnew=re.sub(r'^#print axioms .*\n','',actualnew,flags=re.M)
assert headers(actualnew)==headers(fragment('QUADRATIC EXTENSION PARITY')) and len(headers(actualnew))==12
assert not re.search(r'\bsorry\b',a)
assert not re.search(r'^(?:axiom|opaque)\s|:\s*True\b',fragment('QUADRATIC EXTENSION PARITY'),re.M)
(sc/'ExtensionParity.lean').write_text(a);(sc/'Admitted.lean').write_text(sketch)
for ext,name in [('json','packets'),('json','roadmaps')]:(sc/f'original-{name}.{ext}').write_text(blob(name,ext))
sys.path.insert(0,str(root/'scripts'));import build
normal=build.load_promoted
def assemble(packet,definition):
 def candidate(*args,**kw):
  packets,docs,defs=normal(*args,**kw)
  return ([(name,q) for name,q in packets if q.get('roadmapId')!=rid]+[(rid,packet)],{**docs,rid:'research/blueprint/readmes/'+rid+'.md'},[x for x in defs if x.get('id')!=rid]+[definition])
 build.load_promoted=candidate
 return build.assemble(require_distances=False)
baseline,_=assemble(orig,origroad);atlas,_=assemble(p,road)
def acyclic(g,roots):
 colors={}
 def visit(v):
  assert colors.get(v)!=1,('cycle',v)
  if colors.get(v)==2:return
  colors[v]=1
  for w in g[v]:visit(w)
  colors[v]=2
 for v in list(roots):visit(v)
 return set(colors)
g=defaultdict(set)
for e in atlas['stageEdges']:g[e['source']].add(e['target'])
vertices={s['id'] for s in atlas['stages']};acyclic(g,vertices)
row=next(r for r in atlas['roadmaps'] if r['id']==rid)
assert row['blueprint']['declarations']==198 and row['blueprint']['planets']==29
assert not row.get('pendingLinks') and not row['blueprint'].get('skippedLinks')
assert {(e['source'],e['target']) for e in atlas['stageEdges']}=={(e['source'],e['target']) for e in baseline['stageEdges']}
before={r['id']:r for r in baseline['roadmaps']}
for r in atlas['roadmaps']:
 if r['id']!=rid:assert r.get('blueprint',{}).get('skippedLinks',[])==before[r['id']].get('blueprint',{}).get('skippedLinks',[]),r['id']
req=defaultdict(set)
for e in atlas['stageEdges']:req[e['target']].add(e['source'])
allnodes={}
for folder in ['data/decompositions','data/blueprints','research/blueprint/packets']:
 for path in (root/folder).glob('*.json'):
  q=json.loads(path.read_text())
  for n in q.get('nodes',[]):
   allnodes.setdefault(n['id'],n);req[n['id']].update(n.get('prerequisites',[])+n.get('upstreamPrerequisites',[]))
  for request in q.get('requests',[]):
   for target in request.get('neededBy',[]):req[target].add(request['supplier'])
allnodes.update(new)
for n in new.values():req[n['id']]=set(n.get('prerequisites',[])+n.get('upstreamPrerequisites',[]))
for q in p['requests']:
 for v in q['neededBy']:req[v].add(q['supplier'])
reachable=acyclic(req,list(new))
def unresolved(vs):
 return sorted(v for v in vs if not v.startswith(('mathlib:','tauceti:')) and v not in vertices and v not in allnodes)
# Existing supplier placeholders remain open; compare them with the original-packet control.
controlreq=defaultdict(set,{k:set(v) for k,v in req.items()})
for n in old.values():controlreq[n['id']]=set(n.get('prerequisites',[])+n.get('upstreamPrerequisites',[]))
for q in orig['requests']:
 for v in q['neededBy']:controlreq[v].add(q['supplier'])
controlReachable=acyclic(controlreq,list(old))
assert unresolved(reachable)==unresolved(controlReachable),('new unresolved references',unresolved(reachable),unresolved(controlReachable))
assert all(v.startswith('UPSTREAM:') for v in unresolved(reachable))
assert all(d.startswith(('mathlib:','tauceti:')) or d in vertices or d in new for n in new.values() if n['id'] not in old for d in n['prerequisites'])
# tauceti:TauCetiRoadmap/... are stages, never declaration leaves.
assert all(v in vertices for v in reachable if v.startswith('tauceti:TauCetiRoadmap/'))
used=set(new);todo=list(new)
while todo:
 v=todo.pop()
 for d in req[v]:
  if d in allnodes and d not in used:used.add(d);todo.append(d)
def stage_of(v):
 seen=set()
 while v in allnodes and v not in seen:seen.add(v);v=allnodes[v].get('parentStageId')
 return v
pairs={(d,rid+':'+s['key']) for s in road['stages'] for d in s.get('requires',[])}
pairs.update((s,stage_of(n['id'])) for n in new.values() for s in n['prerequisites'] if s in vertices and s not in allnodes and s!=stage_of(n['id']))
pairs.update((q['supplier'],stage_of(v)) for q in p['requests'] for v in q['neededBy'] if q['supplier']!=stage_of(v))
def reaches(source,target):
 seen=set();todo=[source]
 while todo:
  v=todo.pop()
  if v==target:return True
  if v in seen:continue
  seen.add(v);todo.extend(g[v])
 return False
assert all(reaches(s,t) for s,t in pairs),[v for v in pairs if not reaches(*v)]
combined=defaultdict(set)
for e in atlas['stageEdges']:combined[e['target']].add(e['source'])
for v in used:
 n=allnodes[v]
 # Diagnostic parent-stage context edges do not constitute mathematical proof dependencies.
 if n.get('parentStageId'):combined[v].add(n['parentStageId'])
 for d in req[v]:
  if d in vertices or d in used:combined[v].add(d)
combinedVertices=vertices|used|set(combined)|{v for ds in combined.values() for v in ds};acyclic(combined,combinedVertices)
receipt={'base':base,'preservedStatements':193,'unchangedNodes':unchanged,'addedNodes':5,'kinds':Counter(n['kind'] for n in p['nodes']),'api':sum(len(n.get('api',[])) for n in p['nodes']),'tests':sum(len(n.get('tests',[])) for n in p['nodes']),'definitionConstructionTests':sum(len(n.get('tests',[])) for n in p['nodes'] if n['kind'] in ['definition','construction']),'baseline':len(p['baseline']['declarations']),'planets':29,'gaps':len(p['gaps']),'requests':len(p['requests']),'routeRecords':len(p['routeCoverage']),'sourceFindings':len(p['sourceIssues']),'ownDeclarationEdges':sum(sum(v in new for v in n['prerequisites']) for n in new.values()),'stageVertices':len(vertices),'stageEdges':len(atlas['stageEdges']),'reachableDependencyVertices':len(reachable),'reachableDeclarations':len(used),'requiredStagePairs':len(pairs),'requiredStagePairsReachable':len(pairs),'combinedVertices':len(combinedVertices),'combinedEdges':sum(map(len,combined.values())),'allDAGs':'acyclic','pendingLinks':[],'ownSkippedLinks':[],'otherSkips':'unchanged','newStageEdges':0,'newUnresolvedReferences':[],'legacySupplierPlaceholders':unresolved(reachable),'legacyPlaceholders':'unchanged from base; open supplier obligations, not library baseline leaves','scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
print(json.dumps(receipt,ensure_ascii=False));(sc/'receipt.json').write_text(json.dumps(receipt,ensure_ascii=False,indent=2)+'\n')
```

## Resume here

Identify the actual projective I₁ pinch with the checked Weierstrass model via the two-chart P¹ normalization map, infinity-chart localization and explicit unit, finite birational normalization and actual conductor scheme. Relate the field quotient AdjoinRoot(q), roots/Hom(Spec L,Spec E) and the geometric base-change conductor; this transports the proved native parity calculation to the inherited all-extension geometric count. Prove the structure-sheaf sequence with the actual E/k quotient and finite-pushforward H⁰/H¹ comparison. Treat the fixed-component I₂ construction and its count separately, and import the field-valued-point reduction comparison for nonreduced schematic fibers. A native pointCount or numeric trace defect alone does not prove any of these scheme/cohomology statements. All other G.0–G.6 fibration/Picard/Néron/classification/model-completeness/source obligations and the23 supplier requests remain open. Existing remaining lists below record their original checkpoint frontiers; the present native degree criterion supersedes that numerical frontier only.

## Preserved predecessor handoff

# Quadratic root-count branches — #3378

Codex — codex-a71f92; 2 October 2026. Claim5961132544, bot5961134840. Audit base `b315875f27d5859bf9bd7a09c9673b692eaf821c`; publication preflight `4557261650818a24845bd3c8f195e393990ea9c0`.

This partial checkpoint adds four granular G.1 lemmas: distinct-root cardinality, native pointCount, numerical frobeniusTrace, and coefficient-map pointCount. For q(t)=t²+a·t+b with quadratic discriminant D=a²−4b nonzero, the distinct-root cardinality is2 or0 according to existence of a root; the actual Weierstrass tuple (a,−b,0,0,0) has count |k| or |k|+2 and numerical count defect1 or−1. Counts include the singular origin and the point at infinity; they do not use the nonsingular elliptic group. D is the quadratic discriminant, not the Weierstrass discriminant. No division by2 or characteristic restriction is used. Over a field homomorphism to a finite receiving field, injectivity preserves D≠0; no separate source-finiteness assumption is required in the signature, since it follows from that injection.

All189 inherited statements are preserved;188 whole node objects compare equal. Only quadratic-extension-counts gains the actual coefficient-map supplier and a proof step retaining the missing extension-splitting and geometric comparison obligations. All78 route records,21 source findings,23 requests,17 gaps,29 planets, seven stage IDs and historical receipts remain unchanged. The roadmap is semantically unchanged and is not republished. The packet has193 nodes (13 definitions,139 lemmas,26 theorems,5 comparisons,10 constructions),89 API entries,86 definition/construction tests plus9 other lemma tests, and150 baseline references. All implementations stay unchecked, all stages partial, and none is closed.

## Current checks and proof boundary

The exact native extraction is370 lines:12 examples (six inherited, six new),15 named axiom audits,0 errors and0 warnings. All audited declarations depend only on propext, Classical.choice and Quot.sound, never an admitted axiom. The four current declarations are quadraticRootCount_branch, pointCount_branch, frobeniusTrace_branch and pointCount_field_map. Time3.76s; maximumRSS6755548KiB;60GiB available before invocation. Source SHA256 `1970269a7c653d423ace5bd6fe2192c06672031cffcbd88e9dd1d78eb8b8c6b8`; normalized diagnostic SHA256 `894e162f8d9e7266f184f5e61ab273a1809a1f4200207f71c11319045ffabb87`.

The exact admitted extraction is197 lines with12 examples:0 errors,27 admission warnings and0 other warnings. Time3.30s; maximumRSS6719964KiB;60GiB available. Source SHA256 `3f1ec7fd1d036deec355313721950174605e5b67b928679385522d7f01f4e802`; normalized diagnostic SHA256 `8c85121118ce51541cc2c4a134e936a0adb6362d933a1de450b55fc4cad36300`. Its four new signatures and six example statements were mechanically extracted from the passing native fragment without changing binders or types. The nonzero-discriminant guard is tested separately against a repeated-root characteristic3 model; characteristic2 split/nonsplit and odd-characteristic cases are checked.

The entire1828-line Tau Ceti-importing suggested file **was not compiled**: the existing pinned build lacks required PointCount artifacts. Its source SHA256 is `156dc45f10e46d8e1b07f36e7b6529ece81c69dc54ca724e486b783ae7a2042c`. The two fragment receipts use only existing compiled Mathlib and the exact public PointCount namespace fixture, not a pruned claim about the whole file. No setup, update, cache download, library build, LSP or concurrent Lean invocation occurred. Both invocations used the memory minimum and20-minute timeout. Diagnostic normalization replaces the invocation source path with Native.lean or Sketch.lean, omits the RESOURCE footer, and retains the final newline.

The [durable actual proof archive](https://github.com/CBirkbeck/tauceti-explorer/blob/e4ff005892a37a27cbabd336972a18d90bc4ad5d/research/blueprint/suggested/NeronModelsAndSemistableAbelianVarietiesPartII.lean) contains the submitted source followed by the exact native extraction inside a block comment. Its additional parent retains the predecessor archive fd64cf3c4e41133e0f200698fef47c11247ec9dd; the submitted commit retains this archive as an additional parent. The fixture is credited to The Tau Ceti contributors, Copyright2026, Apache2.0, [PointCount at Tau Ceti f790474821cf4256814db967cb154e7af3d0c369](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean). No library definition is duplicated at submitted head. Mathlib pin082e2d37e8b0463410cdb532e111cd43d5a66174 and Lean4.34.0-rc2 are unchanged.

Indexed checker and actual intake return0 errors/0 warnings. The actual read-only assembler passes:2992 stage vertices/8727 edges,193 own declarations/467 prerequisite edges, and3207 combined stage/declaration/request vertices/9575 edges. All DAGs are acyclic; all69 computed required stage pairs are reachable. There are592 dependency vertices and193 recursively reached declarations, no own pending/skipped links, no new stage edges, and unrelated skips are unchanged. This69-pair algorithm is not identified with the predecessor's68 touching-edge algorithm. Private-path, whitespace, statement/API/test parity and historical preservation checks also pass.

## Evidence read in this continuation

The issue was read before and after the bot confirmed this claim; WORKERS was reread. Full binding protocols/guide and the two nearby StableReduction/JacobianChallenge roadmaps were read earlier in this continuous loop and governing instructions are unchanged. All189 inherited mathematical statements, the latest handoff, seven stage descriptions and the full reserved Ferrand key were read freshly. All parent AUDIT10 R11.1–R11.6 target/evidence/duplicate records were read; no own PartII audit row was found. The full78-item owner-route brief and relevant items15–18,170–171,189–190,195 were read, not every routed catalogue/source text.

The complete pinned PointCount file and all six new indexed Mathlib statements with their ambient hypotheses were read: discrim, vieta_formula_quadratic, discrim_eq_sq_of_quadratic_eq_zero, Fintype.card_of_subtype, Finset.card_pair_eq_two_iff, RingHom.injective. The exact Mathlib HEAD and unchanged relevant source files were verified. Bounded library searches do not assert whole-library absence.

Schröer's [arXiv2004.07025v3 parsed HTML](https://arxiv.org/html/2004.07025v3), §3 conductor discussion and complete Proposition3.1–3.2 proofs/table were read freshly. These native branches are an authored algebraic deduction, not a printed theorem attribution. There was no full-paper reread, acquisition fingerprint or erratum collation. Inherited Python regression programs and older mathematical proof strands retain original attribution; no fresh Python regression rerun or wholesale recertification is claimed.

## Exact recovery and read-only validation

The following script reads the publicly reachable archive and reconstructs the exact checked strings without writing files. Its three hash assertions were executed successfully against git show of the fetched immutable archive. Preserve every terminal newline. Use an already existing build at the pins to check these two exact strings one at a time after checking available memory≥20GiB; use a1200-second timeout. Do not set up or build a project.

```python
import hashlib, os, subprocess
from pathlib import Path
repo = Path(os.environ["TAUCETI_REPO"])
archive = "e4ff005892a37a27cbabd336972a18d90bc4ad5d"
path = "research/blueprint/suggested/NeronModelsAndSemistableAbelianVarietiesPartII.lean"
archived = subprocess.check_output(["git", "show", archive + ":" + path], cwd=repo).decode()
head = archived.split("\n/-\nChecked fixture credit:", 1)[0]
native = archived.split("BEGIN ARCHIVED CHECKED QUADRATIC ROOT BRANCHES\n", 1)[1].split("END ARCHIVED CHECKED QUADRATIC ROOT BRANCHES\n", 1)[0]
section = native[len("import Mathlib\n"):native.index("end TauCeti\n") + len("end TauCeti\n")]
def fragment(text, name):
    return text.split("/- BEGIN " + name + " -/\n", 1)[1].split("/- END " + name + " -/", 1)[0]
sketch = "import Mathlib\n" + section + "\n" + fragment(head, "QUADRATIC POINT PARAMETRIZATION") + "\n" + fragment(head, "QUADRATIC ROOT BRANCH COUNTS") + "\n\n"
expected = {
    "Native.lean": (native, "1970269a7c653d423ace5bd6fe2192c06672031cffcbd88e9dd1d78eb8b8c6b8"),
    "Sketch.lean": (sketch, "3f1ec7fd1d036deec355313721950174605e5b67b928679385522d7f01f4e802"),
    "submitted.lean": (head, "156dc45f10e46d8e1b07f36e7b6529ece81c69dc54ca724e486b783ae7a2042c"),
}
for name, (source, digest) in expected.items():
    assert hashlib.sha256(source.encode()).hexdigest() == digest, name
    print(name, digest)
# native and sketch are exact source strings; this script writes nothing.

```

For the packet/intake/atlas check, place the submitted deliverables in your own disk-backed scratch as packet.json, reader.md, NeronModelsAndSemistableAbelianVarietiesPartII.lean and handoff.md, together with the unchanged base roadmap as roadmap.json and the recovered Native.lean/Sketch.lean and their logs as native.log/sketch.log. Save the following two exact scripts in that scratch. Set TAUCETI_REPO to the read-only existing clone, TAUCETI_BASELINE to the pinned declarations.tsv, N3_VALIDATE_BASE to the publication preflight above, and PYTHONDONTWRITEBYTECODE=1; run python3 verify.py. Both audit and publication bases were checked. No repository snapshot, checkout, write or atlas output is produced. The loader injects the own proposed definition and packet before decomposition trimming while retaining all unrelated promoted inputs.

immutable_view.py SHA256 `5328b369712c016d447cb3b4699a5f6a50f276c36bdeead72adbf78221e913bf`:

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
BASE = os.environ.get('N3_VALIDATE_BASE', 'b315875f27d5859bf9bd7a09c9673b692eaf821c')
TRACKED = set(subprocess.check_output(['git', 'ls-tree', '-r', '--name-only', BASE], cwd=REPO, text=True).splitlines())
CACHE = {}
READS = set()
ORIGINAL = {name: getattr(Path, name) for name in ('read_text', 'read_bytes', 'exists', 'is_file', 'is_dir', 'glob', 'rglob', 'open', 'write_text', 'write_bytes')}

def relative(path):
    try:
        return str(path.relative_to(REPO))
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

verify.py SHA256 `68fa3da2201be9cbe5cfc519e791e08ced8f1a8ca56f56b446381329a9d96f92`:

```python
"""Validate the candidate using actual immutable-tree checker, intake and atlas code."""
import ast,hashlib,json,re
from collections import Counter,defaultdict
from pathlib import Path
import immutable_view as git_view
HERE=Path(__file__).resolve().parent
STEM="NeronModelsAndSemistableAbelianVarietiesPartII";RID="NeronModelsAndSemistableAbelianVarietiesPartII"
FILES={"research/blueprint/packets/"+STEM+".json":"packet.json",
"research/blueprint/readmes/"+STEM+".md":"reader.md",
"research/blueprint/suggested/"+STEM+".lean":STEM+".lean",
"research/blueprint/handoff/DESIGN-"+STEM+".md":"handoff.md"}
orig=json.loads(git_view.blob(next(iter(FILES))))
roadpath="research/blueprint/roadmaps/"+STEM+".json"
origroad=json.loads(git_view.blob(roadpath))
FILES[roadpath]="roadmap.json"
for dst,name in FILES.items():git_view.CACHE[dst]=(HERE/name).read_bytes()
git_view.install()
import check_blueprint
errors,warnings,summary=check_blueprint.check(git_view.REPO/next(iter(FILES)),
check_blueprint.load_index(Path(__import__("os").environ["TAUCETI_BASELINE"])),check_blueprint.world())
print(json.dumps({"checker":summary,"errors":errors,"warnings":warnings}),flush=True)
assert not errors and not warnings,(errors,warnings)
p=json.loads((HERE/"packet.json").read_text());reader=(HERE/"reader.md").read_text();lean=(HERE/(STEM+".lean")).read_text()
old={n["id"]:n for n in orig["nodes"]};new={n["id"]:n for n in p["nodes"]}
assert len(old)==189 and len(new)==193 and set(old)<=set(new)
for nid,n in old.items():
    for key in ("id","kind","statement","hypotheses","acceptance","sources","implementationStatus","uses"):
        assert n.get(key)==new[nid].get(key),(nid,key)
    assert new[nid].get("api",[])[:len(n.get("api",[]))]==n.get("api",[]),nid
    assert new[nid].get("tests",[])[:len(n.get("tests",[]))]==n.get("tests",[]),nid
unchanged=sum(n==new[nid] for nid,n in old.items())
assert unchanged==188,unchanged
for k in ["requests","gaps","sourceIssues","routeCoverage","scope","finiteF2Certificate","libraryAuditContinuation","continuationVerification","commonIdealVerification","globalConductorContinuation","quadraticPinchingContinuation","affineProofContinuation","quadraticNormalFormContinuation","quadraticBasisContinuation","quadraticPresentationContinuation","quadraticPointParametrizationContinuation"]:
    assert orig[k]==p[k],k
assert p["baseline"]["declarations"][:144]==orig["baseline"]["declarations"]
assert p["sources"][:len(orig["sources"])]==orig["sources"]
assert json.loads((HERE/"roadmap.json").read_text())==origroad
assert p["status"]=="partial" and all(n["implementationStatus"]=="unchecked" for n in new.values())
for nid,n in new.items():
    if nid in old:continue
    assert n["statement"] in reader and n["declarationName"].rsplit(".",1)[1] in lean,nid
    for a in n.get("api",[]):
        assert a["name"] in reader and a["statement"] in reader
        assert re.search(r"^(?:lemma|theorem|def|noncomputable def) "+re.escape(a["name"].rsplit(".",1)[1])+r"\b",lean,re.M),a["name"]
    for t in n.get("tests",[]):assert t["statement"] in reader and t["name"] in lean,t["name"]
for nid,n in new.items():
    for a in n.get("api",[]):assert a["name"].rsplit(".",1)[-1] in lean,a["name"]
    for t in n.get("tests",[]):assert t["name"] in lean,t["name"]
assert not re.search(r"\bsorry\b",(HERE/"packet.json").read_text()+reader)
assert not re.search(r"^(?:axiom|opaque)\s|:\s*True\b",lean[lean.index("/- BEGIN QUADRATIC ROOT BRANCH COUNTS -/"):],re.M)
assert Counter(c["status"] for c in p["coverage"])=={"partial":7}
tree=ast.parse(git_view.blob("research/blueprint/intake.py").decode())
picked=[n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id in {"ALLOWED","PRIVATE"} for t in n.targets) or isinstance(n,ast.FunctionDef) and n.name=="file_problems"]
env={"json":json,"re":re};exec(compile(ast.Module(body=picked,type_ignores=[]),"actual-intake", "exec"),env)
problems=[v for dst,name in FILES.items() for v in env["file_problems"](dst,(HERE/name).read_text())]
assert not problems,problems
for name in FILES.values():
    s=(HERE/name).read_text();assert not re.search(r"[ \t]+$",s,re.M),name
    assert not re.search(r"/(?:home|Users)/[^/\s]+/",s),name
native=(HERE/"Native.lean").read_text();log=(HERE/"native.log").read_text()
sketch=(HERE/"Sketch.lean").read_text()
assert log.count("depends on axioms:")==15 and "sorryAx" not in log and "error:" not in log and "warning:" not in log
assert not re.search(r"\bsorry\b",native)
slog=(HERE/"sketch.log").read_text()
assert "error:" not in slog and slog.count("warning:")==slog.count("warning: declaration uses")==27
assert len(re.findall(r"^example\b",native,re.M))==12 and len(re.findall(r"^example\b",sketch,re.M))==12
assert hashlib.sha256(native.encode()).hexdigest()=="1970269a7c653d423ace5bd6fe2192c06672031cffcbd88e9dd1d78eb8b8c6b8"
assert hashlib.sha256(sketch.encode()).hexdigest()=="3f1ec7fd1d036deec355313721950174605e5b67b928679385522d7f01f4e802"
def acyclic(g,roots):
    colors={}
    def visit(v):
        assert colors.get(v)!=1,("cycle",v)
        if colors.get(v)==2:return
        colors[v]=1
        for w in g[v]:visit(w)
        colors[v]=2
    for v in list(roots):visit(v)
    return set(colors)
import build
normal=build.load_promoted
def assemble(packet,definition):
    def candidate(*args,**kw):
        packets,docs,defs=normal(*args,**kw)
        return ([(name,q) for name,q in packets if q.get("roadmapId")!=RID]+[(RID,packet)],
            {**docs,RID:"research/blueprint/readmes/"+RID+".md"},
            [x for x in defs if x.get("id")!=RID]+[definition])
    build.load_promoted=candidate
    return build.assemble(require_distances=False)
baseline,_=assemble(orig,origroad)
atlas,_=assemble(p,json.loads((HERE/"roadmap.json").read_text()))
g=defaultdict(set)
for e in atlas["stageEdges"]:g[e["source"]].add(e["target"])
vertices={s["id"] for s in atlas["stages"]};acyclic(g,vertices)
row=next(r for r in atlas["roadmaps"] if r["id"]==RID)
assert row["blueprint"]["declarations"]==193 and row["blueprint"]["planets"]==29,row["blueprint"]
assert not row.get("pendingLinks") and not row["blueprint"].get("skippedLinks")
assert {(e["source"],e["target"]) for e in atlas["stageEdges"]}=={(e["source"],e["target"]) for e in baseline["stageEdges"]},"new stage edges"
before={r["id"]:r for r in baseline["roadmaps"]}
for r in atlas["roadmaps"]:
    if r["id"]==RID:continue
    assert r.get("blueprint",{}).get("skippedLinks",[])==before[r["id"]].get("blueprint",{}).get("skippedLinks",[]),r["id"]
req=defaultdict(set)
for e in atlas["stageEdges"]:req[e["target"]].add(e["source"])
for folder in ["data/decompositions","research/blueprint/packets"]:
    for path in (git_view.REPO/folder).glob("*.json"):
        q=json.loads(path.read_text())
        for n in q.get("nodes",[]):req[n["id"]].update(n.get("prerequisites",[])+n.get("upstreamPrerequisites",[]))
        for request in q.get("requests",[]):
            for target in request.get("neededBy",[]):req[target].add(request["supplier"])
reachable=acyclic(req,list(new))
allnodes=dict(new)
for folder in ["data/decompositions","data/blueprints","research/blueprint/packets"]:
    for path in (git_view.REPO/folder).glob("*.json"):
        for n in json.loads(path.read_text()).get("nodes",[]):allnodes.setdefault(n["id"],n)
used=set(new);todo=list(new)
while todo:
    v=todo.pop()
    for d in allnodes[v].get("prerequisites",[]):
        if d in allnodes and d not in used:used.add(d);todo.append(d)
def stage_of(v):
    seen=set()
    while v in allnodes and v not in seen:
        seen.add(v);v=allnodes[v].get("parentStageId")
    return v
roadmap=json.loads((HERE/"roadmap.json").read_text())
stagePairs={(d,RID+":"+s["key"]) for s in roadmap["stages"] for d in s.get("requires",[])}
stagePairs.update((s,stage_of(n["id"])) for n in new.values() for s in n["prerequisites"]
    if s in vertices and s not in allnodes and s!=stage_of(n["id"]))
stagePairs.update((q["supplier"],stage_of(v)) for q in p["requests"] for v in q["neededBy"]
    if q["supplier"]!=stage_of(v))
def reaches(source,target):
    seen=set();todo=[source]
    while todo:
        v=todo.pop()
        if v==target:return True
        if v in seen:continue
        seen.add(v);todo.extend(g[v])
    return False
assert all(reaches(s,t) for s,t in stagePairs),[p for p in stagePairs if not reaches(*p)]
ownEdges=sum(sum(v in new for v in n["prerequisites"]) for n in new.values())
combined=defaultdict(set)
for e in atlas["stageEdges"]:combined[e["target"]].add(e["source"])
for v in used:
    n=allnodes[v]
    if n.get("parentStageId"):combined[v].add(n["parentStageId"])
    for d in n.get("prerequisites",[]):
        if d in vertices or d in used:combined[v].add(d)
for q in p["requests"]:
    for v in q["neededBy"]:combined[v].add(q["supplier"])
combinedVertices=vertices|used|set(combined)|{v for ds in combined.values() for v in ds}
acyclic(combined,combinedVertices)
receipt={"indexedChecker":"pass","actualIntake":"pass","actualAssembler":"pass","base":git_view.BASE,
"preservedStatements":189,"unchangedNodes":unchanged,"addedNodes":4,
"kinds":Counter(n["kind"] for n in p["nodes"]),"api":sum(len(n.get("api",[])) for n in p["nodes"]),
"tests":sum(len(n.get("tests",[])) for n in p["nodes"]),"baseline":len(p["baseline"]["declarations"]),"planets":29,
"gaps":len(p["gaps"]),"requests":len(p["requests"]),"ownDeclarationEdges":ownEdges,
"stageVertices":len(vertices),"stageEdges":len(atlas["stageEdges"]),
"reachableDependencyVertices":len(reachable),"reachableDeclarations":len(used),
"requiredStagePairs":len(stagePairs),"requiredStagePairsReachable":len(stagePairs),
"combinedVertices":len(combinedVertices),"combinedEdges":sum(map(len,combined.values())),
"allDAGs":"acyclic","pendingLinks":[],"ownSkippedLinks":[],"otherSkips":"unchanged","newStageEdges":0,
"scriptSha256":hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
print(json.dumps(receipt,ensure_ascii=False),flush=True)

```

## Resume here

First prove the separate every-extension splitting/embedding criterion (including odd/even and characteristic2 cases), then consume quadratic-extension-counts only with the actual projective-pinch comparison. Continue the actual two-chart P¹ normalization map, infinity-chart localization with its explicit unit, finite birational normalization, conductor ideal sheaf, structure-sheaf sequence with the actual E/k quotient and its module actions, and finite-pushforward H⁰/H¹ comparison. Keep the two-component I₂ construction separate. No étale-cohomological trace, normalized scheme count, geometric genus-one classification or I₂ conclusion follows just from the numerical count defect. All G.0–G.6 fibration/Picard/Néron/classification obligations, suppliers, full paper extraction and reserved Ferrand ownership remain open.

## Preserved predecessor handoff — codex-J6LwjP

# Native quadratic point parametrization — #3378

Codex — codex-J6LwjP; 2 October 2026. Claim5960692130, bot5960694672. Read base `058d2a2bb164ceb15fe5163ab607fcc70bdc2ec2`.

This is a partial design checkpoint. Seven native G.1 nodes, four API entries and six typed examples integrate the first proof target in the predecessor handoff. The actual affine equation-solution subtype is equivalent to Option of the nonroot parameter subtype. Consequently native pointCount plus distinct-root count is field size plus two, and native frobeniusTrace is distinct-root count minus one. The construction works over every field; the counts explicitly assume finiteness. No separability, perfectness, characteristic or ellipticity hypothesis is introduced. The sign of the native coefficient a₂ is −b.

All182 inherited node objects, the reserved Ferrand-pushout key,78 route records,21 source findings,23 requests,29 planets,7 stage IDs and every roadmap byte are retained. The packet now has189 nodes,89 API entries,86 tests,144 baseline declarations,17 gaps and0 closed stages. Every implementation status remains unchecked; the source coverage remains partial. The reader supplies each new proof and its boundary cases. Every new outer suggested body is admitted under PROTOCOL§13.

The predecessor's complete projective/chart/conductor/sheaf/cohomology mathematical strand and its exact regression program remain publicly preserved at the [read base handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/058d2a2bb164ceb15fe5163ab607fcc70bdc2ec2/research/blueprint/handoff/DESIGN-NeronModelsAndSemistableAbelianVarietiesPartII.md). Its historical affine proof archives and supplier findings retain their attribution. This continuation does not erase or certify that whole strand.

## Actual native proof and validation boundaries

The separate [actual-body archive](https://github.com/CBirkbeck/tauceti-explorer/blob/fd64cf3c4e41133e0f200698fef47c11247ec9dd/research/blueprint/suggested/NeronModelsAndSemistableAbelianVarietiesPartII.lean) contains the new fragment between BEGIN/END QUADRATIC POINT PARAMETRIZATION markers. Only that fragment plus the exact public native PointCount section is extracted for this receipt. The public section is credited to The Tau Ceti contributors, Copyright2026, Apache2.0, from [the exact Tau Ceti pin](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean). It is a check fixture, never a replacement library definition in the submitted suggested file. Mathlib pin is082e2d37e8b0463410cdb532e111cd43d5a66174; Lean is4.34.0-rc2.

The actual extraction checked with0 errors,0 admission warnings,0 other warnings, six examples and eleven named declarations. All eleven axiom audits list only propext,Classical.choice,Quot.sound; none lists an admitted axiom. Time2.60s, maximumRSS6763548KiB, available memory62GiB before invocation. Source SHA256 `c76ff685ef6ce890bc33edacc714a6ba8130bdee89e4a99929c782955d04e48b`; normalized log SHA256 `e4556fb263e9c62ee90da544d373fe768d6c7108cc3b0c691ecd8fc407faefc4`.

The submitted admitted extraction checked with0 errors,17 admission warnings and0 other warnings, time2.40s, maximumRSS6738300KiB, available61GiB. Source SHA256 `119fe4571604dfb379f752f593c2b255be7a92a96f01a2b69492a5027624632d`; normalized log SHA256 `bccd547b2714c1b7d84f7e78738d5856bc1cc45b36d197b7b0264fca867e229c`. These hashes are for the exact reconstructed extraction, not the full suggested file.

**The full Tau Ceti-importing suggested file was not compiled.** The existing pinned build lacks PointCount and other required Tau Ceti compiled artifacts. The check uses its already compiled Mathlib together with the exact pinned public native section. No Lake setup/update/cache download, library build, language server or concurrent Lean invocation was used. Both invocations obeyed the memory minimum and20-minute timeout. No inherited planned algebra/scheme/cohomology declaration is an input to the new actual proof.

Fresh pinned statements read: WeierstrassCurve.Affine.equation_iff; the complete PointCount file, including pointCount_def,frobeniusTrace and frobeniusTrace_def; Nat.card_congr,Nat.card_eq_fintype_card; Fintype.card_option,card_subtype_compl,card_subtype_le. Their real statements supply the carrier, native signs, cardinal transport and complement subtraction used here. The reviewed AUDIT-10 R11.1–R11.6 records and the complete current issue/handoff were read. Bounded searches of the two pinned algebraic-geometry trees found no declarations under the new helper names; this is not an exhaustive absence claim. The nearby upstream SemisimpleAlgebras and AlgebraicCurves documents were read in full in this continuous worker loop.

Schröer's [arXiv2004.07025v3 HTML](https://arxiv.org/html/2004.07025v3), §3 conductor diagram and complete displayed Proposition3.1–3.2 proofs with adjoining count table, was read freshly. Download SHA256 d14049912dcab6a438ed62363e246d0087c61342c51813ac482f5aba48d92456. The explicit native equation-level parametrization is an authored deduction from that chart, not a printed theorem attribution. No full-paper reread or erratum collation is claimed.

The exact predecessor program, credited to ChatGPT Pro cp-20261002-sr-c72e81, was freshly rerun:132079 assertions,259 models,44089 projective candidates and3090 normalization source points over F2,F3,F5,F7,F11,F4,F8,F9,F27,F25. Its source SHA256 is c5ca830260f2389c362b635b72ddde749ec21d3d669aaf75ecfebdc76600c938. This is finite regression evidence, not a scheme normalization or cohomology proof. Its own receipt's lean_compiled=false describes that original Python program; the separate new native Lean proof is reported above.

## Packet, graph and reproduction

Indexed blueprint checker:0 errors,0 warnings. All182 inherited whole node objects and the route/source/request/scope records compare equal; the entire roadmap is byte equal; the suggested prefix is byte equal to the read base. Every new node and API/test has matching reader/signature coverage. Git diff whitespace check passes.

The actual read-only scripts/build.py assembler was run with packet/roadmap symlink overlays and an original-packet control. Stage graph3043 vertices/8727 edges; own declaration graph189/461; stages plus recursively reachable declarations3203/9368. All three are acyclic. All68 existing touching stage paths remain reachable. No unresolved prerequisites, external declaration nodes or own skipped links remain. Existing stage edges and unrelated skipped-link sets compare equal to control. Library references are terminal leaves; upstream roadmap references are stage vertices. No extra realization edge is invented and no atlas data is written. Graph script SHA256 `d3b89f4cff68adba943b80830163812214c3b709b7e171c214504faaeaa3b943`.

Save the following reconstruction script in disk-backed scratch and run it from this submission's repository root. It produces the exact checked sources, extracts the publicly archived predecessor regression and writes the original packet/roadmap into the own reconstruction directory. The archive commit is a parent of the submitted commit. Network access only fetches the exact public Tau Ceti file. Then run regression.py with Python3 and compare its source hash and counts. Preserve all terminal newlines.

```python
from pathlib import Path
import hashlib,subprocess,urllib.request,re
root=Path.cwd();sc=root.parent/'scratch-neron-cartan';sc.mkdir(exist_ok=True)
stem='NeronModelsAndSemistableAbelianVarietiesPartII';base='058d2a2bb164ceb15fe5163ab607fcc70bdc2ec2';archive='fd64cf3c4e41133e0f200698fef47c11247ec9dd';pin='f790474821cf4256814db967cb154e7af3d0c369'
for name,folder,ext in [('packets','packets','json'),('roadmaps','roadmaps','json'),('handoff','handoff','md')]:
 file=('DESIGN-' if name=='handoff' else '')+stem+'.'+ext
 (sc/f'original-{name}.{ext}').write_bytes(subprocess.check_output(['git','show',f'{base}:research/blueprint/{folder}/{file}']))
actual=subprocess.check_output(['git','show',f'{archive}:research/blueprint/suggested/{stem}.lean'],text=True)
submitted=(root/'research/blueprint/suggested'/f'{stem}.lean').read_text()
def fragment(text):return text.split('/- BEGIN QUADRATIC POINT PARAMETRIZATION -/\n',1)[1].split('/- END QUADRATIC POINT PARAMETRIZATION -/',1)[0]
tc=urllib.request.urlopen(f'https://raw.githubusercontent.com/CBirkbeck/TauCeti/{pin}/TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean',timeout=45).read().decode()
# Exact public namespace section, with the module's final section terminator removed.
section=tc[tc.index('\nnamespace TauCeti'):tc.rindex('\nend\n')]
ns=['parameter_equation','affine_zero_x','parameter_recovery','affineParamEquiv','affineParamEquiv_origin','affineParamEquiv_symm_none','affineParamEquiv_symm_some','affineParamEquiv_nonzero','affine_card_balance','pointCount_balance','frobeniusTrace_roots']
proof='import Mathlib\n'+section+'\n'+fragment(actual)+'\n'+'\n'.join('#print axioms TauCeti.GenusOne.QuadraticPinch.'+n for n in ns)+'\n'
sketch='import Mathlib\n'+section+'\n'+fragment(submitted)+'\n'
assert hashlib.sha256(proof.encode()).hexdigest()=='c76ff685ef6ce890bc33edacc714a6ba8130bdee89e4a99929c782955d04e48b'
assert hashlib.sha256(sketch.encode()).hexdigest()=='119fe4571604dfb379f752f593c2b255be7a92a96f01a2b69492a5027624632d'
(sc/'prototype.lean').write_text(proof);(sc/'sketch.lean').write_text(sketch)
old=(sc/'original-handoff.md').read_text();program,=re.findall(r'```python\n(.*?)\n```',old,re.S);program+='\n'
assert hashlib.sha256(program.encode()).hexdigest()=='c5ca830260f2389c362b635b72ddde749ec21d3d669aaf75ecfebdc76600c938'
(sc/'regression.py').write_text(program)
print('Exact proof, admitted fragment, base packet/roadmap and predecessor regression reconstructed.')
```

Save this exact graph script as graph.py in the same reconstruction directory and run it from the repository root. It writes only own scratch overlays and the receipt. It adds the new roadmap definition to both control/current overlays, preserving the actual stage structure.

```python
import sys,json,hashlib
from pathlib import Path
from collections import defaultdict,deque
root=Path.cwd();sc=root.parent/'scratch-neron-cartan';sys.path.insert(0,str(root/'scripts'));from build import assemble
stem='NeronModelsAndSemistableAbelianVarietiesPartII';rid=stem;packet=json.loads((root/'research/blueprint/packets'/f'{stem}.json').read_text());original=json.loads((sc/'original-packets.json').read_text())
def overlay(name,p):
 d=sc/name;d.mkdir(exist_ok=True)
 for f in (root/'data/blueprints').iterdir():
  if f.name in [stem+'.json','roadmaps']:continue
  t=d/f.name
  if not t.exists():t.symlink_to(f,target_is_directory=f.is_dir())
 rd=d/'roadmaps';rd.mkdir(exist_ok=True)
 for f in (root/'data/blueprints/roadmaps').glob('*.json'):
  if f.name==stem+'.json':continue
  target=rd/f.name
  if not target.exists():target.symlink_to(f)
 (rd/(stem+'.json')).write_text((root/'research/blueprint/roadmaps'/f'{stem}.json').read_text())
 (d/(stem+'.json')).write_text(json.dumps(p))
 return d
a,ctx=assemble(require_distances=False,blueprints=overlay('overlay',packet));control,cctx=assemble(require_distances=False,blueprints=overlay('control',original))
def stats(vertices,edges):
 vs=set(vertices);out=defaultdict(set);ins=defaultdict(int)
 for s,t in edges:
  vs.update([s,t]);out[s].add(t)
 for s in out:
  for t in out[s]:ins[t]+=1
 q=deque(sorted(v for v in vs if ins[v]==0));n=0
 while q:
  s=q.popleft();n+=1
  for t in out[s]:
   ins[t]-=1
   if ins[t]==0:q.append(t)
 return {'vertices':len(vs),'edges':sum(map(len,out.values())),'acyclic':n==len(vs)},out
stages={s['id'] for s in a['stages']};se={(e['source'],e['target']) for e in a['stageEdges']};ce={(e['source'],e['target']) for e in control['stageEdges']}
# Exact virtual upstream stage references are graph vertices, never library leaves.
st,following=stats(stages,se)
own={n['id']:n for n in packet['nodes']};oe={(x,n['id']) for n in own.values() for x in n['prerequisites'] if x in own};og,_=stats(own,oe)
universe={}
for folder in ['data/decompositions','research/blueprint/packets','data/blueprints']:
 for f in sorted((root/folder).glob('*.json')):
  p=json.loads(f.read_text())
  for n in p.get('nodes',[]):universe[n['id']]=n
universe.update(own);reachable={};unresolved=set();baselines=set();dep=set();todo=list(own)
while todo:
 nid=todo.pop()
 if nid in reachable:continue
 n=universe[nid];reachable[nid]=n
 for ref in n.get('prerequisites',[]):
  if ref in universe:
   dep.add((ref,nid));todo.append(ref)
  elif ref in stages or ref.startswith('tauceti:TauCetiRoadmap/'):
   stages.add(ref);dep.add((ref,nid))
  elif ref.startswith(('mathlib:','tauceti:')):baselines.add(ref)
  else:unresolved.add(ref)
combined,_=stats(stages|set(reachable),se|dep)
# Required stage paths come from the original touching links and binding RS-08.
# Planet declaration ids are not their parent stage ids.
scope=set(packet['scope']);pairs={(x,y) for x,y in ce if x in scope or y in scope}
for path in ['data/atlas.json']:
 record=json.loads((root/path).read_text())
 for edge in record.get('stageEdges',record.get('links',[])):
  if edge['source'] in scope or edge['target'] in scope:
   pairs.add((edge['source'],edge['target']))
def reaches(s,t):
 seen=set();todo=[s]
 while todo:
  x=todo.pop()
  if x==t:return True
  if x not in seen:seen.add(x);todo.extend(following.get(x,()))
 return False
missing=[list(x) for x in sorted(pairs) if not reaches(*x)]
roadmaps={r['id']:r for r in a['roadmaps']};cr={r['id']:r for r in control['roadmaps']}
skips={r['id']:r.get('blueprint',{}).get('skippedLinks',[]) for r in a['roadmaps'] if r['id']!=rid}
cskips={r['id']:r.get('blueprint',{}).get('skippedLinks',[]) for r in control['roadmaps'] if r['id']!=rid}
unchanged=sum(own[n['id']]==n for n in original['nodes']);assert unchanged==182
rec={'actualAssembler':True,'stageDAG':st,'ownDeclarationDAG':og,'stagesAndReachableDeclarations':combined,'reachableDeclarations':len(reachable),'externalDeclarations':sorted(set(reachable)-set(own)),'reachableBaselineReferences':len(baselines),'unresolved':sorted(unresolved),'ownSkippedLinks':roadmaps[rid]['blueprint']['skippedLinks'],'otherSkipsMatchOriginal':skips==cskips,'stageEdgesUnchanged':se==ce,'requiredStagePairs':len(pairs),'requiredStagePairsReachable':len(pairs)-len(missing),'inheritedMissingStagePairs':missing,'unchangedNodeObjects':unchanged,'partDeclarations':len(own),'partPlanets':sum('planet' in n for n in own.values()),'roadmapDeclarations':roadmaps[rid]['blueprint']['declarations'],'scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
assert st['acyclic'] and og['acyclic'] and combined['acyclic'];assert not unresolved;assert se==ce and skips==cskips
(sc/'graph-receipt.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec,indent=2))
```

For Lean, use an already existing build at the recorded pins and set LEAN_PATH to its package/root compiled-library directories. Run its Lean4.34.0-rc2 on prototype.lean, then sketch.lean, one invocation at a time. Check free memory≥20GiB and use timeout1200. Do not install/build/update/cache a project. Normalize the invocation source path to its basename before hashing the log. The actual file includes eleven print-axiom audits; the admitted file omits those audits and honestly warns on all17 outer bodies.

## Resume here

The native affine equation solution equivalence and numerical count/trace strand are now explicit and independently checked. Continue the preserved projective proof: construct the homogeneous normalization map on the two actual projective charts; prove the infinity chart localization using the explicit unit identity; establish finite birational normalization and the conductor ideal sheaf; construct the structure-sheaf exact sequence with the actual E/k quotient and specified module actions; derive H⁰ and H¹ through finite pushforward. No flatness of normalization at the pinch is assumed. Keep the inseparable and characteristic2/3 singular-scheme boundaries.

Package the count theorem over actual finite field extensions and prove root splitting/parity before consuming quadratic-extension-counts. The two-component I₂ construction remains separate. Do not mark either geometric genus-one classification or I₂ complete from this one-component formula. All G.0–G.6 fibration, Picard, Néron-model, classification and routed-paper obligations remain required; the exact supplier requests and reserved Ferrand owner are unchanged.
