# Actual groupoid diagrams of affine roots — checkpoint

Codex — codex-7e92bd. Refs #3403. Partial; all implementations remain unchecked.

This continuation adds20 nodes: three constructions and17 lemmas. The existing finite chart power and test-algebra change functors now satisfy identity, composition and interchange as equalities of whole functors. A specialized extensionality theorem uses actual object equalities and equality of unit labels on every arrow; categorical transport between equal root points has label1. Native Functor.ext supplies the dependent-arrow equality, rather than discarding stabilizers.

The actual power functors form rootPointDiagram:RootDivIndexᵒᵖ→Grpd, contravariant in positive divisibility indices. At n the object is the existing full action groupoid of A-algebra points of A[t]/(t^n−f); the transition for n|N uses N/n powers. Arbitrary A-algebra maps give natural transformations rootPointChangeNatTrans, with full groupoid-functor naturality. Their identity and composition laws hold as equalities of natural transformations, so rootPointFunctor is a native functor from CommAlgCat A to the groupoid-diagram category.

All538 inherited mathematical contracts remain:535 whole node objects are unchanged and only the existing groupoid/power/change constructions receive appended API references. All288 incoming baseline objects remain. The three new constructions have10 API references and10 test references, and seven further API references are appended to those existing constructions:17 references to17 distinct new lemmas in total. Seven distinct typed tests check reversed divisibility versus numeric order, the full nonfactorial12→6→2 functor composite, the nonzero sixth-root2 over Z/4 becoming root0 under6→2, and a nonidentity stabilizer becoming the categorical identity under4→2. They also check the actual nonflat Z-algebra quotient Z/4→Z/2 collapsing a nilpotent root through the new natural transformation, the6→2 naturality square as equality of whole functors, and natural-transformation composition/identity over three test algebras.

No exponent invertibility, reducedness, nontriviality, flatness or injectivity is imposed. Rings and native algebra-point carriers use the stated common universe. This supplies categorical coherence for finite chart action groupoids only. It does not provide an equivalence with general line-bundle root-object groupoids, infinite coherent reindexing or a 2-limit comparison. TOWER-AFF frame-torsor existence, fppf stackification, effective infinite fpqc quotient/descent and higher-universe adapters remain open. The reserved root-stack key retains scheme/stack bases, arbitrary invertible line bundles with section, every positive exponent and fppf scope; étale/DM results retain exponent-invertibility hypotheses. Yun–Zhang relative closed-subscheme roots, finite Kummer/DVR and geometric sheaf obligations remain.

All40 planets,ten partial stages,eight gaps,thirteen requests,both paper routes,the complete omission ledger and nine source issue/version envelopes are preserved. Only the RS.2 frontier, its roadmap description and TOWER-TYPING detail gain this bounded result. No source route, supplier, global key or implementation is closed.

## Reading and incoming evidence

The whole19646-character issue was read before claim5977384442 and again in two complete slices after bot5977385292 confirmed that exact numeric comment. The bodies were identical. The current handoff narrative/recovery, all23 incoming new proofs and14 tests, actual recovered verifier and consumed helpers were read. The whole reserved key and TOWER-TYPING gap and latest RS.2 frontier were read. Native AffineRing/root-equation and positive-divisibility index blocks were read. The entire8636-line native prefix is authenticated and recompiled, not claimed manually reread in full.

Actual incoming peer PR6048 at head43b89b72af6f491d5f90a7f4715be3b5293b278e, merge7477709dbacf0e9005c2aa894ef87b6c7bb57d9b, was recovered from public archiveb9518b740becd088f0e70f5e0fc2984a835b5d34. All69 artifacts,ten helpers andfive public deliverables authenticated; manifest SHA256d3eea293f0318c30a15a5e82e221098fe5ce923c301d43e9fc1aa01829b0d6bd. Its actual recovered verifier reproduced the archived report byte-for-byte. All three prefixes remain byte-for-byte in order; assembly inserts one individual Grpd import and appends only the new declarations/tests/audits or exact admitted projection.

Own6043 Reading.json,InputGuard.json and Candidate.json are authenticated by manifestc70603277c0c04b8b04ec2cb7fc1826fca7126ef48af42fad31800112390760e. All18 external controls are unchanged; five own deliverables changed. Protocol, reviewed FA.0–FA.7 audit/REV-AUDIT20, full parent and AlgebraicCurves/JacobianChallenge readers, and source/route/supplier readings are reused only at their original bounded scopes. OwnContractGuard.json verifies the unchanged13 requests, source routes/issues/versions/omission ledger and other listed whole contracts. No peer reading is relabelled as this worker's own, and no fresh whole538-node or historical-reader audit is claimed.

Fresh pinned statements read include native Functor.ext with its dependent equality-transport square, Grpd.of/category, CommAlgCat carriers and actual hom projection, native functor composition and natural transformations. Reading.json records source ranges and hashes. Exact-name searches in both pinned library trees and current packets found no new specialized declaration; native generic structures are reused. A fresh touching link-map scan found no PartII entries. These are bounded searches, not exhaustive absence claims.

The complete current displayed Stacks Section39.10 at https://stacks.math.columbia.edu/tag/022Y was read: both definitions, action/equivariance diagrams, Lemma39.10.3 proof and allfive comments. SourceReading.json binds exact HTTP bytes/hash/time without retaining source text. It supplies action/equivariance conventions only; the categorical diagram and test-algebra functor are authored deductions. The historical diagram typo is already corrected in the displayed text. No new source error, whole-paper reading, recursive citation closure or general descent theorem is claimed; the inherited source issue/version envelope retains attribution.

## Validation

The whole Tau-dependent Canonical.lean and final Suggested.lean remain UNCOMPILED. TauProbe.json freshly confirms exact pinned sourcef790474821cf4256814db967cb154e7af3d0c369, a different available build head and four missing required imports. No Tau build, cache, clone, snapshot, Lake project or language server was created. The checks below used only the existing Mathlib build082e2d37e8b0463410cdb532e111cd43d5a66174 and Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d, serially, with immediately checked memory≥20GiB, one thread,8192MiB managed limit and1200-second timeout. Every compiler process finished.

- Native.lean: 8895 lines, 355 examples, exit0, 0 warnings, 461 axiom audits; 52GiB available, 335.13 seconds, peak4187768KiB. Source SHA256 `eacbb7970ad746cf9e5dd60c4471c5271b06ed6c8d17d993bc6b9b1e234f789a`; diagnostic SHA256 `92b04d0f17b573099ffc5ec9f7ea9aec47d8664d0e8233df845757dc195c9f7f`.
- Sketch.lean: 7453 lines, 355 examples, exit0, 351 warnings, 231 axiom audits; 52GiB available, 153.94 seconds, peak4010748KiB. Source SHA256 `e8a56685214d7a3df186659e886c96099250b5304ee5c8a41d150e66e1b5f63f`; diagnostic SHA256 `c4db1ddc74bb65b6288a0e33d8e054bb14209d90eb8692fd9b3ec9ff6627d2cb`.

The entire Native.lean has355 examples, zero admissions/errors/warnings and461 audited declaration closures using only propext,Classical.choice and Quot.sound. The bounded Sketch.lean has355 examples,351 admission warnings only and231 inherited clean axiom audits. All20 new declaration headers and7 example headers match the suggested projection. Three constructions remain concrete;17 new lemma proofs and7 example proofs are admitted in the projection. Suggested.lean equals the entire Canonical.lean, SHA256 `78c4a1f32baa448127a520ff6a9d1ffc1426219cc8bdf3c0236df5c6babb900f`. These bounded checks do not certify whole Tau-dependent canonical compilation.

Prototype.lean separately compiled without warnings using the incoming authenticated88-line ProbePrefix, the complete incoming NewProofs and the extracted existing positive-divisibility index block. It is retained with its exact source/log/receipt and does not replace either complete run. No full inherited prefix is claimed from the focused prototype.

The indexed packet checker, actual intake/file rules and source issue/version checks pass without errors or warnings. The packet has558 nodes,292 baseline references,455 raw API entries and436 raw test references. The publication graph has stage3057/8726, own558/1282 and scoped3720/11090 vertices/edges, all acyclic. All89 required supplier pairs are reachable. No owned skipped/pending links occur. Every foreign roadmap/stage and inherited stage-edge object matches the immutable control. The45 unrelated pre-existing unreachable restructure pairs are recorded without changing their ownership.

Mathematical base `130fed55d6203cf67fdc0e1f9c0d68f401a66131`; publication base `578db5dbf6dedb4f9c2e0beabce77ba0f2099a7f`. All23 guarded inputs and the issue contract are unchanged. Index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Both immutable verifier reports execute the actual checker,intake and atlas assembler without Lean or a repository snapshot. Public recovery authenticates all artifacts,five final deliverables,ten exact helper fences and its own public code; both actual recovered reports must match the archived reports before opening the PR.

## Resume

Use rootPointDiagram,rootPointChangeNatTrans and rootPointFunctor with their full categorical identity/composition/interchange laws. Continue the comparison with general line-bundle root objects on actual objects and arrows. Then construct coherent infinite groupoid reindexing and its genuine 2-limit comparison, preserving automorphisms rather than using an orbit set or a strict objectwise limit as a substitute. Keep higher-universe adapters,TOWER-AFF frame-torsor existence,fppf stackification and effective fpqc quotient/descent explicit. Preserve the general key and all source/supplier/omission contracts. No implementation or source closure is marked complete.

## Script: assemble.py

```python
"""Retain all incoming prefixes, insert one native groupoid import, append exact new data."""
from pathlib import Path
import re
from projection import project
S=Path(__file__).resolve().parent
t=lambda n:(S/n).read_text()
def prefix(n):
 text=t(n);i=text.index('import ');return text[:i]+t('NewImports.lean')+'\n'+text[i:]
a=project(t('NewProofs.lean'),t('NewTests.lean'));(S/'NewAdmitted.lean').write_text(a)
for out,p in [('Canonical.lean','CanonicalPrefix.lean'),('Sketch.lean','SketchPrefix.lean')]:
 (S/out).write_text(prefix(p)+'\n'+a)
(S/'Suggested.lean').write_text(t('Canonical.lean'))
names=re.findall(r'^(?:def|lemma|theorem) ([\w.]+)',t('NewProofs.lean'),re.M)
audit=''.join('#print axioms TauCeti.RootStack.'+n+'\n'for n in names);(S/'Audits.lean').write_text(audit)
(S/'Native.lean').write_text(prefix('NativePrefix.lean')+'\n'+t('NewProofs.lean')+'\n'+t('NewTests.lean')+'\n'+audit)
```

## Script: author.py

```python
"""Append actual groupoid-valued root diagrams; retain every inherited contract."""
from pathlib import Path
import copy,csv,json,re,sys
S=Path(__file__).resolve().parent;RID='FunctionFieldArithmeticPartII';NS='TauCeti.RootStack.';P=RID+':RS.2/root-diagram-'
def load(n):return json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
old=load('Incoming.json');p=copy.deepcopy(old);road=load('Incoming-roadmap.json')
existing={n.get('declarationName','').removeprefix(NS):n['id']for n in old['nodes']}
specs=[
('transport-label','affineRootPointGroupoid.eqToHom_label','lemma','Identity label for equality transport','For an equality p=q of actual n-root points, the categorical eqToHom arrow has roots-of-unity label1.',['affineRootPointGroupoid.groupoid'],'Induct on the equality and reduce the actual groupoid identity.'),
('functor-ext','affineRootPointGroupoid.functor_ext','lemma','Extensionality of functors into root-point groupoids','Two actual functors into the same finite root-point groupoid are equal if their object maps agree and their maps of every arrow have equal underlying unit labels. The source is any category; equality transport between equal target objects has label1.',['affineRootPointGroupoid.eqToHom_label','affineRootPointGroupoid.comp_label','mathlib:CategoryTheory.Functor.ext'],'Apply native categorical Functor.ext. For the conjugated arrow equation, use twice subtype extensionality and the equality-transport label1 law.'),
('power-identity','affineRootPointPower.identity','lemma','Equal-index power as the identity functor','For every positive n, the actual n→n power functor equals the identity functor on the entire root-point groupoid, including all stabilizer arrows.',['affineRootPointGroupoid.functor_ext','affineRootPointPower.identity_obj','affineRootPointPower.identity_label'],'Use the already proved object and label laws with the specialized functor extensionality theorem.'),
('power-composition','affineRootPointPower.composition','lemma','Composition of power functors','For positive n|N|K, the actual K→N power functor followed by N→n equals K→n as a functor between the full groupoids.',['affineRootPointGroupoid.functor_ext','affineRootPointPower.composition_obj','affineRootPointPower.composition_label'],'Apply functor extensionality to the inherited object composition and unit-label power composition equations.'),
('change-identity','affineRootPointChange.identity','lemma','Identity test-algebra change as a functor','Changing the test algebra by id_B gives the actual identity functor on the n-root point groupoid.',['affineRootPointGroupoid.functor_ext','affineRootPointChange'],'Postcomposition by id fixes the actual algebra point. Unit extensionality gives equality of the native roots-of-unity labels.'),
('change-composition','affineRootPointChange.composition','lemma','Composition of test-algebra change functors','For A-algebra maps φ:B→C and ψ:C→D, change(φ) followed by change(ψ) equals change(ψ∘φ) as actual functors.',['affineRootPointGroupoid.functor_ext','affineRootPointChange'],'The object equation is native algebra-map associativity. The label equation follows by unit extensionality and reduction of the restriction homomorphisms.'),
('change-power','affineRootPointChange.power','lemma','The full functor square for change and powers','For positive n|N and arbitrary A-algebra φ:B→C, power_B(N→n) followed by change_n(φ) equals change_N(φ) followed by power_C(N→n), as actual functors including stabilizer maps.',['affineRootPointGroupoid.functor_ext','affineRootPointChange.power_obj','affineRootPointChange.power_label'],'Apply specialized functor extensionality to the inherited object and label squares.'),
('diagram','rootPointDiagram','construction','The positive-divisibility diagram of root-point groupoids','For arbitrary f∈A and A-algebra B, construct a native functor RootDivIndexᵒᵖ→Grpd. Its object at positive n is the actual finite n-root chart action groupoid; the reversed arrow from N to n uses the actual power functor for n|N. Identity and composition hold as equalities of functors.',['RootDivIndex','affineRootPointGroupoid.groupoid','affineRootPointPower','affineRootPointPower.identity','affineRootPointPower.composition','mathlib:CategoryTheory.Grpd.of','mathlib:CategoryTheory.Grpd.category'],'Bundle the existing actual groupoids using native Grpd.of and use the reversed positive-divisibility arrows. The new whole-functor laws discharge the diagram axioms.'),
('diagram-object','rootPointDiagram.obj','lemma','The actual groupoid at a positive index','At op(n), rootPointDiagram(f,B) is exactly Grpd.of of the existing actual n-root point groupoid. All unit-labelled arrows are retained.',['rootPointDiagram'],'Reduce the object field of the native diagram.'),
('diagram-root','rootPointDiagram.map_root','lemma','A diagram transition on root images','For positive n|N and actual N-root point p, the diagram transition sends its root image to p(t_N)^(N/n).',['rootPointDiagram','affineRootPointPower.obj_root'],'Reduce the map field and use the existing power root formula.'),
('diagram-label','rootPointDiagram.map_label','lemma','A diagram transition on stabilizer labels','For positive n|N and an actual labelled arrow a, the transition sends the underlying unit label to a.label^(N/n). This need not be injective.',['rootPointDiagram','affineRootPointPower.map_label'],'Reduce the exact groupoid functor and its native unit-power map.'),
('change-natural','rootPointChangeNatTrans','construction','Natural transformations for arbitrary test-algebra change','For any A-algebra map φ:B→C, construct a native natural transformation rootPointDiagram(f,B)→rootPointDiagram(f,C), with component the actual finite change-of-test-algebra functor. Its naturality square is equality of full groupoid functors.',['rootPointDiagram','affineRootPointChange','affineRootPointChange.power'],'Use the actual change functor at each positive index. The whole-functor power square proves naturality in Grpd; no flatness assumption is needed.'),
('change-natural-root','rootPointChangeNatTrans.app_root','lemma','Natural change on each root image','At every positive n, the component of rootPointChangeNatTrans(f,φ) sends p(t_n) to φ(p(t_n)).',['rootPointChangeNatTrans','affineRootPointChange.obj_root'],'Reduce the actual component and algebra-map postcomposition.'),
('change-natural-label','rootPointChangeNatTrans.app_label','lemma','Natural change on each arrow label','At every positive n, the component maps each arrow label by native restrictRootsOfUnity φ n.',['rootPointChangeNatTrans','affineRootPointChange.map_label'],'Reduce the actual component map on the full groupoid arrows.'),
('change-natural-identity','rootPointChangeNatTrans.identity','lemma','Identity algebra change as a natural transformation','rootPointChangeNatTrans(f,id_B) is the identity natural transformation of the whole positive-divisibility groupoid diagram.',['rootPointChangeNatTrans','affineRootPointChange.identity'],'Apply native natural-transformation extensionality and the actual component functor identity.'),
('change-natural-composition','rootPointChangeNatTrans.composition','lemma','Composition of natural algebra changes','For φ:B→C and ψ:C→D, the composite of their natural transformations is rootPointChangeNatTrans(f,ψ∘φ).',['rootPointChangeNatTrans','affineRootPointChange.composition'],'Apply native natural-transformation extensionality to the component whole-functor composition law.'),
('algebra-functor','rootPointFunctor','construction','The root-point diagram as a functor of test algebras','For arbitrary f∈A, construct a native functor CommAlgCat A→(RootDivIndexᵒᵖ→Grpd). It sends the actual test algebra B to rootPointDiagram(f,B) and a native algebra morphism to its actual change natural transformation. Prove identity and composition at the natural-transformation level.',['rootPointDiagram','rootPointChangeNatTrans','rootPointChangeNatTrans.identity','rootPointChangeNatTrans.composition','mathlib:CommAlgCat','mathlib:CommAlgCat.Hom.hom'],'Reuse the existing native algebra category and functor category. The two whole-natural-transformation laws give the functor axioms.'),
('algebra-functor-object','rootPointFunctor.obj','lemma','The functor returns the actual diagram','For every native A-algebra object B, rootPointFunctor(f).obj(B) equals rootPointDiagram(f,B).',['rootPointFunctor'],'Reduce the functor object field.'),
('algebra-functor-root','rootPointFunctor.map_root','lemma','The algebra functor maps actual root images','For an actual algebra map φ and positive index n, the corresponding component of rootPointFunctor(f).map(ofHom φ) sends p(t_n) to φ(p(t_n)).',['rootPointFunctor','rootPointChangeNatTrans.app_root','mathlib:CommAlgCat.ofHom'],'Reduce the chosen natural transformation and its actual algebra-valued point map.'),
('algebra-functor-label','rootPointFunctor.map_label','lemma','The algebra functor maps all stabilizer labels','For any algebra map φ, positive index n and actual arrow a, the corresponding component sends a.label to native restrictRootsOfUnity φ n a.label.',['rootPointFunctor','rootPointChangeNatTrans.app_label','mathlib:CommAlgCat.ofHom'],'Reduce the selected natural-transformation component and label map.')]
ids={name:P+slug for slug,name,*_ in specs};nodes=[];sid='RootPointDiagram-codex-7e92bd';src=load('SourceReading.json')[0]
for slug,name,kind,title,statement,deps,proof in specs:
 nodes.append(dict(id=ids[name],parentStageId=RID+':RS.2',realises=[RID+':RS.2'],kind=kind,title=title,declarationName=NS+name,statement=statement,hypotheses=['Arbitrary commutative A and commutative A-algebras B,C,D in a common universe; f∈A arbitrary; every root index positive. Divisibility, not numerical order, determines index arrows, and the groupoid diagram is contravariant in those indices. No exponent-invertibility, reducedness, nontriviality, regularity, unit-section, finite-generation, flatness or injectivity assumption.','Only the existing finite affine chart action groupoids are packaged. No equivalence with general line-bundle root groupoids, fppf stackification, 2-limit, effective infinite fpqc quotient/descent or higher-universe adapter follows from this strict diagram.'],prerequisites=[d if ':'in d else ids[d]if d in ids else existing[d]for d in deps],proofSteps=[proof],acceptance=[statement,'Use native Grpd, CommAlgCat and functor categories. Retain every actual chart point and stabilizer arrow; do not replace them by orbit sets or infer a general root-stack limit.'],library=dict(module='TauCeti/AlgebraicGeometry/RootStacks/RS2',namespace=NS[:-1]),sources=[dict(sourceId=sid,locator='Stacks Section39.10 Definitions39.10.1–2 action/equivariance conventions; authored categorical chart-diagram deduction',excerpt='action',match='Context for the existing action convention only. The actual diagram and natural algebra changes are authored from inherited point/label laws and pinned native category APIs; no stackification or descent theorem is attributed here.')],api=[],tests=[],implementationStatus='unchecked'))
by={n['declarationName'].removeprefix(NS):n for n in nodes}
apis={'rootPointDiagram':['rootPointDiagram.'+x for x in ['obj','map_root','map_label']],'rootPointChangeNatTrans':['rootPointChangeNatTrans.'+x for x in ['app_root','app_label','identity','composition']],'rootPointFunctor':['rootPointFunctor.'+x for x in ['obj','map_root','map_label']]}
oldapis={'affineRootPointGroupoid.groupoid':['affineRootPointGroupoid.eqToHom_label','affineRootPointGroupoid.functor_ext'],'affineRootPointPower':['affineRootPointPower.identity','affineRootPointPower.composition'],'affineRootPointChange':['affineRootPointChange.identity','affineRootPointChange.composition','affineRootPointChange.power']}
additions={}
for name,entries in oldapis.items():
 additions[existing[name]]=[dict(name=NS+x,role='compatibility',statement=by[x]['statement'])for x in entries]
 next(n for n in p['nodes']if n['id']==existing[name])['api']+=additions[existing[name]]
testdata=[('divisibility_direction','non-example','There is no index arrow from op(3) to op(2): such an arrow would require2|3. This detects use of numerical order or reversal in the wrong direction.'),('nonfactorial_functor_composition','compatibility','The actual diagram functors12→6 and6→2 compose to the full12→2 power functor, not merely equal functions on root images.'),('nilpotent_power','computation','Over Z/4 at f=0, the actual sixth-root point with root2 is nonzero at the root, while its6→2 diagram image has root2 cubed=0.'),('power_not_faithful','non-example','Over Z/4 at f=0, construct a nonidentity stabilizer arrow labelled−1 at the zero fourth-root point. The actual4→2 diagram functor maps that arrow to the categorical identity.'),('nonflat_natural_change','non-example','The actual algebra-functor natural transformation for the Z-algebra quotient Z/4→Z/2 sends the nonzero nilpotent second-root point2 to the zero-root point. Neither source roots nor their distinctions are replaced by reduced data before applying the map.'),('change_power_square','compatibility','For arbitrary A-algebra φ:B→C, the naturality square of its actual natural transformation and the6→2 diagram transition is equality of full groupoid functors.'),('three_algebra_changes','compatibility','For three test algebras B,C,D, the actual algebra-functor maps of φ:B→C andψ:C→D compose to the map ofψ∘φ, and the identity algebra map gives the identity natural transformation.')]
tests=[dict(name=NS+'rootDiagramTests.'+a,kind=b,statement=c)for a,b,c in testdata];tb={a:t for (a,*_),t in zip(testdata,tests)}
testsets={'rootPointDiagram':['divisibility_direction','nonfactorial_functor_composition','nilpotent_power','power_not_faithful'],'rootPointChangeNatTrans':['nonflat_natural_change','change_power_square','three_algebra_changes'],'rootPointFunctor':['nonflat_natural_change','change_power_square','three_algebra_changes']}
for name,entries in apis.items():
 by[name]['api']=[dict(name=NS+x,role='compatibility',statement=by[x]['statement'])for x in entries]
 by[name]['tests']=[tb[x]for x in testsets[name]]
 by[name]['uses']=[dict(where=RID+':RS.2/factorial-root-limit',how='Provide the actual finite-chart groupoid diagram and natural test-algebra changes required before coherent general root-object reindexing and a 2-limit comparison. General line-bundle and effective-descent steps remain open.')]
p['nodes']+=nodes
rows=list(csv.reader(Path(sys.argv[1]).open(),delimiter='\t'));have={x['ref']for x in p['baseline']['declarations']};baseline=[];reading=[]
for name in ['CategoryTheory.Functor.ext','CategoryTheory.Grpd.of','CategoryTheory.Grpd.category','CommAlgCat.Hom.hom','CommAlgCat','CommAlgCat.ofHom']:
 row=next(r for r in rows if len(r)>5 and r[0]=='mathlib'and r[1]==name);reading.append(dict(name=name,file=row[3],line=int(row[4]),signature=row[5],scope='Actual statement and applicable ambient hypotheses read at the exact pin; precise ranges in Reading.json.'))
 if 'mathlib:'+name not in have:baseline.append(dict(ref='mathlib:'+name,kind=row[2],module=row[3],line=int(row[4]),provides=row[5]+' Reuse native categorical structure for the specialized root-point diagram.',checked='Codex — codex-7e92bd read the actual statement at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 on2026-10-04.'))
p['baseline']['declarations']+=baseline;save('BaselineReading.json',reading)
p['sources'].append(dict(id=sid,title='Actions of group schemes; authored actual root-point diagram and algebra-functor deductions',authors='The Stacks Project authors; specialized deductions by Codex — codex-7e92bd',edition='Complete current displayed Section39.10 and comments,4October2026',url=src['url'],sha256=src['sha256'],accessed=src['accessed'],readSections=[src['readScope']]))
frontier='The actual finite root-point power and test-algebra change functors now satisfy identity, composition and interchange as equalities of full functors. They give a native positive-divisibility diagram valued in Grpd and natural transformations for arbitrary test-algebra maps, packaged into a functor from native CommAlgCat to the groupoid-diagram category. All stabilizers and nilpotent points are retained. This provides finite chart categorical coherence only: the general line-bundle root-object comparison, coherent infinite groupoid reindexing and 2-limit comparison, frame-torsor existence, fppf stackification, effective infinite fpqc quotient/descent and higher-universe adapters remain open. All ten partial stages,eight gaps,thirteen requests,forty planets,both paper routes,the full omission ledger and source issue/version envelopes retain their scope.'
p['summary']+=' Root-point diagram continuation:20 declarations(3 constructions17 lemmas),17 API references and7 distinct typed tests; all538 incoming mathematical contracts preserved,535 whole old nodes unchanged and three receive only appended API references.'
next(x for x in p['coverage']if x['stageId']==RID+':RS.2')['remaining'].append(frontier);next(x for x in p['gaps']if x['id']=='TOWER-TYPING')['detail']+=' '+frontier;next(x for x in road['stages']if x['key']=='RS.2')['description']+=' '+frontier
for n,x in [('Candidate.json',p),(RID+'.json',p),('Candidate-roadmap.json',road),('NewNodes.json',nodes),('NewTests.json',tests)]:save(n,x)
apiCount=sum(map(len,apis.values()))+sum(map(len,oldapis.values()));refs=sum(map(len,testsets.values()))
save('Plan.json',dict(newNames=[n['declarationName']for n in nodes],apiAdditions=additions,newNodes=[n['id']for n in nodes],newBaseline=baseline,newBaselineRefs=[x['ref']for x in baseline],frontier=frontier,newNodesCount=len(nodes),newAPI=apiCount,distinctNewAPI=17,newTests=len(tests),testReferences=refs))
intro='''# Actual groupoid diagrams of affine roots

The finite chart power and test-algebra change laws now hold as equalities of whole functors, including every unit-labelled arrow. They define a native positive-divisibility diagram in Grpd, contravariant in root indices. At positive n the diagram is the actual root-point action groupoid. A test-algebra map gives a natural transformation of these diagrams, and identity and composition hold as equalities of natural transformations. The entire construction is a native functor from CommAlgCat A to the groupoid-diagram category.

The construction retains nilpotents and all stabilizers for arbitrary commutative algebras and positive exponents, without invertibility or flatness premises. Seven typed examples check the direction of divisibility, a nonfactorial12→6→2 composite as a whole functor, the nonzero sixth-root2 over Z/4 becoming zero under6→2, a nonidentity stabilizer becoming the identity under4→2, the nonflat quotient Z/4→Z/2 collapsing a nilpotent point, and naturality/composition under test-algebra change. These are actual categorical objects and arrows, not orbit-set tests.

All538 inherited mathematical contracts remain;535 whole node objects are unchanged and three receive only appended API references. This continuation adds20 nodes,three constructions,17 API references and7 typed tests. All40 planets,ten partial stages,eight gaps,thirteen requests,source routes/versions/issues and the omission ledger are preserved. Every implementation remains unchecked.

This finite chart diagram does not give the general line-bundle root-object comparison, infinite coherent reindexing or a 2-limit equivalence. Frame torsor existence, fppf stackification, effective fpqc quotient/descent and higher-universe adapters remain explicit. The reserved root-stack key still permits scheme/stack bases, arbitrary line bundles with section, every positive exponent and fppf scope. Full Tau-dependent canonical execution remains UNCOMPILED; native and bounded Mathlib evidence is reported separately.

'''+frontier+'\n\n'
parts=[intro]
for n in nodes:
 parts+=['## '+n['title']+'\n\n','**'+n['declarationName']+'** — '+n['statement']+'\n\n','Hypotheses: '+' '.join(n['hypotheses'])+'\n\n','Prerequisites: '+', '.join(n['prerequisites'])+'.\n\n','Proof: '+' '.join(n['proofSteps'])+'\n\n']
 for label,key in [('Consumed API','api'),('Typed examples','tests')]:
  if n[key]:parts+=[label+':\n\n']+['- **'+x['name']+'**: '+x['statement']+'\n'for x in n[key]]+['\n']
(S/'ReaderAddition.md').write_text(''.join(parts));(S/'Reader.md').write_text(''.join(parts)+(S/'IncomingReader.md').read_text())
assert set(re.findall(r'^(?:def|lemma|theorem) ([\w.]+)',(S/'NewProofs.lean').read_text(),re.M))==set(ids)
print(json.dumps(dict(nodes=len(p['nodes']),newNodes=len(nodes),rawAPI=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),baseline=len(p['baseline']['declarations']),newAPI=apiCount,testReferences=refs)))
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
                line=block[:k].rsplit('\n',1)[-1]
                let_assignment=re.match(r'\s*(?:example\s*:\s*)?let\b',line) and ':=' not in line
                if block[k:k+2]==':=' and depth==0 and not let_assignment:pos=k;break
            assert pos is not None
            out.append(block[:pos]+':= by\n  sorry\n\n');i=j
        else:out.append(lines[i]);i+=1
    return ''.join(out)

def project(proofs,tests):
    return admit_lemmas(proofs)+'\n'+admit_lemmas(tests)
```

## Script: write_handoff.py

```python
"""Render actual groupoid-diagram scope, authenticated provenance and validation limits."""
from pathlib import Path
import json,hashlib,re
S=Path(__file__).resolve().parent
text=lambda n:(S/n).read_text()
data=lambda n:json.loads(text(n))
sha=lambda b:hashlib.sha256(b).hexdigest()
def line(stem):
 r=data(stem+'.receipt.json');b=(S/(stem+'.lean')).read_bytes();assert r['exitStatus']==0
 examples=len(re.findall(r'^example\b',b.decode(),re.M))
 return f"- {stem}.lean: {len(b.splitlines())} lines, {examples} examples, exit0, {r['warnings']} warnings, {r['axiomAudits']} axiom audits; {r['availableGiBBefore']}GiB available, {r['elapsedSeconds']} seconds, peak{r['maxRssKiB']}KiB. Source SHA256 `{sha(b)}`; diagnostic SHA256 `{r['logSha256']}`.\n"
g=data('Graph.json');p=data('Candidate.json');plan=data('Plan.json');assert g['worldCommit']==text('publication-base.txt').strip()
h='''# Actual groupoid diagrams of affine roots — checkpoint

Codex — codex-7e92bd. Refs #3403. Partial; all implementations remain unchecked.

This continuation adds20 nodes: three constructions and17 lemmas. The existing finite chart power and test-algebra change functors now satisfy identity, composition and interchange as equalities of whole functors. A specialized extensionality theorem uses actual object equalities and equality of unit labels on every arrow; categorical transport between equal root points has label1. Native Functor.ext supplies the dependent-arrow equality, rather than discarding stabilizers.

The actual power functors form rootPointDiagram:RootDivIndexᵒᵖ→Grpd, contravariant in positive divisibility indices. At n the object is the existing full action groupoid of A-algebra points of A[t]/(t^n−f); the transition for n|N uses N/n powers. Arbitrary A-algebra maps give natural transformations rootPointChangeNatTrans, with full groupoid-functor naturality. Their identity and composition laws hold as equalities of natural transformations, so rootPointFunctor is a native functor from CommAlgCat A to the groupoid-diagram category.

All538 inherited mathematical contracts remain:535 whole node objects are unchanged and only the existing groupoid/power/change constructions receive appended API references. All288 incoming baseline objects remain. The three new constructions have10 API references and10 test references, and seven further API references are appended to those existing constructions:17 references to17 distinct new lemmas in total. Seven distinct typed tests check reversed divisibility versus numeric order, the full nonfactorial12→6→2 functor composite, the nonzero sixth-root2 over Z/4 becoming root0 under6→2, and a nonidentity stabilizer becoming the categorical identity under4→2. They also check the actual nonflat Z-algebra quotient Z/4→Z/2 collapsing a nilpotent root through the new natural transformation, the6→2 naturality square as equality of whole functors, and natural-transformation composition/identity over three test algebras.

No exponent invertibility, reducedness, nontriviality, flatness or injectivity is imposed. Rings and native algebra-point carriers use the stated common universe. This supplies categorical coherence for finite chart action groupoids only. It does not provide an equivalence with general line-bundle root-object groupoids, infinite coherent reindexing or a 2-limit comparison. TOWER-AFF frame-torsor existence, fppf stackification, effective infinite fpqc quotient/descent and higher-universe adapters remain open. The reserved root-stack key retains scheme/stack bases, arbitrary invertible line bundles with section, every positive exponent and fppf scope; étale/DM results retain exponent-invertibility hypotheses. Yun–Zhang relative closed-subscheme roots, finite Kummer/DVR and geometric sheaf obligations remain.

All40 planets,ten partial stages,eight gaps,thirteen requests,both paper routes,the complete omission ledger and nine source issue/version envelopes are preserved. Only the RS.2 frontier, its roadmap description and TOWER-TYPING detail gain this bounded result. No source route, supplier, global key or implementation is closed.

## Reading and incoming evidence

The whole19646-character issue was read before claim5977384442 and again in two complete slices after bot5977385292 confirmed that exact numeric comment. The bodies were identical. The current handoff narrative/recovery, all23 incoming new proofs and14 tests, actual recovered verifier and consumed helpers were read. The whole reserved key and TOWER-TYPING gap and latest RS.2 frontier were read. Native AffineRing/root-equation and positive-divisibility index blocks were read. The entire8636-line native prefix is authenticated and recompiled, not claimed manually reread in full.

Actual incoming peer PR6048 at head43b89b72af6f491d5f90a7f4715be3b5293b278e, merge7477709dbacf0e9005c2aa894ef87b6c7bb57d9b, was recovered from public archiveb9518b740becd088f0e70f5e0fc2984a835b5d34. All69 artifacts,ten helpers andfive public deliverables authenticated; manifest SHA256d3eea293f0318c30a15a5e82e221098fe5ce923c301d43e9fc1aa01829b0d6bd. Its actual recovered verifier reproduced the archived report byte-for-byte. All three prefixes remain byte-for-byte in order; assembly inserts one individual Grpd import and appends only the new declarations/tests/audits or exact admitted projection.

Own6043 Reading.json,InputGuard.json and Candidate.json are authenticated by manifestc70603277c0c04b8b04ec2cb7fc1826fca7126ef48af42fad31800112390760e. All18 external controls are unchanged; five own deliverables changed. Protocol, reviewed FA.0–FA.7 audit/REV-AUDIT20, full parent and AlgebraicCurves/JacobianChallenge readers, and source/route/supplier readings are reused only at their original bounded scopes. OwnContractGuard.json verifies the unchanged13 requests, source routes/issues/versions/omission ledger and other listed whole contracts. No peer reading is relabelled as this worker's own, and no fresh whole538-node or historical-reader audit is claimed.

Fresh pinned statements read include native Functor.ext with its dependent equality-transport square, Grpd.of/category, CommAlgCat carriers and actual hom projection, native functor composition and natural transformations. Reading.json records source ranges and hashes. Exact-name searches in both pinned library trees and current packets found no new specialized declaration; native generic structures are reused. A fresh touching link-map scan found no PartII entries. These are bounded searches, not exhaustive absence claims.

The complete current displayed Stacks Section39.10 at https://stacks.math.columbia.edu/tag/022Y was read: both definitions, action/equivariance diagrams, Lemma39.10.3 proof and allfive comments. SourceReading.json binds exact HTTP bytes/hash/time without retaining source text. It supplies action/equivariance conventions only; the categorical diagram and test-algebra functor are authored deductions. The historical diagram typo is already corrected in the displayed text. No new source error, whole-paper reading, recursive citation closure or general descent theorem is claimed; the inherited source issue/version envelope retains attribution.

## Validation

The whole Tau-dependent Canonical.lean and final Suggested.lean remain UNCOMPILED. TauProbe.json freshly confirms exact pinned sourcef790474821cf4256814db967cb154e7af3d0c369, a different available build head and four missing required imports. No Tau build, cache, clone, snapshot, Lake project or language server was created. The checks below used only the existing Mathlib build082e2d37e8b0463410cdb532e111cd43d5a66174 and Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d, serially, with immediately checked memory≥20GiB, one thread,8192MiB managed limit and1200-second timeout. Every compiler process finished.

'''+line('Native')+line('Sketch')+f'''
The entire Native.lean has355 examples, zero admissions/errors/warnings and461 audited declaration closures using only propext,Classical.choice and Quot.sound. The bounded Sketch.lean has355 examples,351 admission warnings only and231 inherited clean axiom audits. All20 new declaration headers and7 example headers match the suggested projection. Three constructions remain concrete;17 new lemma proofs and7 example proofs are admitted in the projection. Suggested.lean equals the entire Canonical.lean, SHA256 `{sha((S/'Canonical.lean').read_bytes())}`. These bounded checks do not certify whole Tau-dependent canonical compilation.

Prototype.lean separately compiled without warnings using the incoming authenticated88-line ProbePrefix, the complete incoming NewProofs and the extracted existing positive-divisibility index block. It is retained with its exact source/log/receipt and does not replace either complete run. No full inherited prefix is claimed from the focused prototype.

The indexed packet checker, actual intake/file rules and source issue/version checks pass without errors or warnings. The packet has558 nodes,292 baseline references,{sum(len(n.get('api',[]))for n in p['nodes'])} raw API entries and{sum(len(n.get('tests',[]))for n in p['nodes'])} raw test references. The publication graph has stage{g['stageDAG']['vertices']}/{g['stageDAG']['edges']}, own{g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']} and scoped{g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']} vertices/edges, all acyclic. All{g['requiredPairs']} required supplier pairs are reachable. No owned skipped/pending links occur. Every foreign roadmap/stage and inherited stage-edge object matches the immutable control. The{g['otherPreexistingUnreachableRestructurePairs']} unrelated pre-existing unreachable restructure pairs are recorded without changing their ownership.

Mathematical base `{text('base.txt').strip()}`; publication base `{text('publication-base.txt').strip()}`. All23 guarded inputs and the issue contract are unchanged. Index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Both immutable verifier reports execute the actual checker,intake and atlas assembler without Lean or a repository snapshot. Public recovery authenticates all artifacts,five final deliverables,ten exact helper fences and its own public code; both actual recovered reports must match the archived reports before opening the PR.

## Resume

Use rootPointDiagram,rootPointChangeNatTrans and rootPointFunctor with their full categorical identity/composition/interchange laws. Continue the comparison with general line-bundle root objects on actual objects and arrows. Then construct coherent infinite groupoid reindexing and its genuine 2-limit comparison, preserving automorphisms rather than using an orbit set or a strict objectwise limit as a substitute. Keep higher-universe adapters,TOWER-AFF frame-torsor existence,fppf stackification and effective fpqc quotient/descent explicit. Preserve the general key and all source/supplier/omission contracts. No implementation or source closure is marked complete.

'''
for helper in ['assemble.py','author.py','projection.py','write_handoff.py','verify.py','graph.py','immutable_view.py','compile.py','runcheck.py','package.py']:
 h+='## Script: '+helper+'\n\n```python\n'+text(helper)+'```\n\n'
h=h.rstrip()+'\n';(S/'HandoffBase.md').write_text(h);(S/'Handoff.md').write_text(h)
```

## Script: verify.py

```python
"""Replay exact contracts, source receipts and actual immutable checker/intake/atlas; no Lean."""
from pathlib import Path
import ast,hashlib,json,os,re,subprocess,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd().resolve();sys.path.insert(0,str(S))
RID='FunctionFieldArithmeticPartII';NS='TauCeti.RootStack.'
sha=lambda b:hashlib.sha256(b).hexdigest()
def txt(n):return (S/n).read_text()
def data(n):return json.loads(txt(n))
MATH=txt('base.txt').strip();BASE=os.environ.get('ROOTS_VALIDATE_BASE',txt('publication-base.txt').strip())
def blob(ref,path):return subprocess.check_output(['git','show',ref+':'+path],cwd=R)
paths=['research/blueprint/'+f+'/'+('DESIGN-'if f=='handoff'else'')+RID+'.'+e for f,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
names=['Candidate-roadmap.json','Candidate.json','Reader.md','Suggested.lean','Handoff.md'];contents={p:txt(n)for p,n in zip(paths,names)}
if (S/'PublicHandoff.md').exists():
 assert txt('PublicHandoff.md').startswith(txt('HandoffBase.md'))
 contents[paths[-1]]=txt('PublicHandoff.md')
 fence=chr(96)*3
 code=txt('PublicHandoff.md').split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
 assert code==txt('recover.py')
 if (S/'artifact-manifest.json').exists():
  for helper in data('artifact-manifest.json'):
   if helper.endswith('.py'):
    embedded=txt('PublicHandoff.md').split('## Script: '+helper+'\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
    assert embedded==txt(helper),helper

for p,n in zip(paths,['Incoming-roadmap.json','Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):
 assert blob(MATH,p)==(S/n).read_bytes()==blob(BASE,p),p
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='c70603277c0c04b8b04ec2cb7fc1826fca7126ef48af42fad31800112390760e'
for n,o in [('OwnPreviousReading.json','Reading.json'),('OwnPreviousInputGuard.json','InputGuard.json'),('OwnPreviousCandidate.json','Candidate.json')]:assert sha((S/n).read_bytes())==data('OwnPreviousManifest.json')[o]['sha256']
guards=data('OwnReadingReuse.json');assert len(guards)==23 and sum(g['unchanged']for g in guards)==18
assert [{k:g[k]for k in ['path','sha256']}for g in guards]==data('OwnPreviousInputGuard.json')
for g in guards:
 assert sha(blob(MATH,g['path']))==g['after']
 assert g['unchanged']==(g['sha256']==g['after'])
claim=data('ClaimReceipt.json');assert claim['claim']==5977384442 and claim['bot']==5977385292 and claim['rereadAfterConfirmation']
p=data('Candidate.json');old=data('Incoming.json');road=data('Candidate-roadmap.json');oldroad=data('Incoming-roadmap.json');plan=data('Plan.json')
assert len(old['nodes'])==538 and len(p['nodes'])==558 and p['nodes'][538:]==data('NewNodes.json')
unchanged=0
for a,b in zip(old['nodes'],p['nodes']):
 expected=json.loads(json.dumps(a))
 if a['id']in plan['apiAdditions']:expected['api']+=plan['apiAdditions'][a['id']]
 else:unchanged+=1
 assert b==expected,a['id']
assert unchanged==535 and set(p)==set(old)
for k in old:
 if k not in ['nodes','summary','sources','baseline','coverage','gaps']:assert p[k]==old[k],k
assert p['sources'][:-1]==old['sources']and p['summary'].startswith(old['summary'])
assert {k:v for k,v in p['baseline'].items()if k!='declarations'}=={k:v for k,v in old['baseline'].items()if k!='declarations'}
assert p['baseline']['declarations'][:288]==old['baseline']['declarations']
assert [d['ref']for d in p['baseline']['declarations'][288:]]==plan['newBaselineRefs']and len(plan['newBaselineRefs'])==4
assert p['status']=='partial'and all(n['implementationStatus']=='unchecked'for n in p['nodes'])
assert len(p['requests'])==13 and len(p['gaps'])==8 and len(p['coverage'])==10
for a,b in zip(old['coverage'],p['coverage']):
 if a['stageId']==RID+':RS.2':assert b['remaining'][:-1]==a['remaining']and {k:v for k,v in a.items()if k!='remaining'}=={k:v for k,v in b.items()if k!='remaining'}
 else:assert a==b
for a,b in zip(old['gaps'],p['gaps']):
 if a['id']=='TOWER-TYPING':assert b['detail'].startswith(a['detail'])and {k:v for k,v in a.items()if k!='detail'}=={k:v for k,v in b.items()if k!='detail'}
 else:assert a==b
assert {k:v for k,v in road.items()if k!='stages'}=={k:v for k,v in oldroad.items()if k!='stages'}
for a,b in zip(oldroad['stages'],road['stages']):
 if a['key']=='RS.2':assert b['description']==a['description']+' '+plan['frontier']and {k:v for k,v in a.items()if k!='description'}=={k:v for k,v in b.items()if k!='description'}
 else:assert a==b
assert data('PreviousRecovery.json')['head']=='43b89b72af6f491d5f90a7f4715be3b5293b278e'
assert data('PreviousRecovery.json')['artifactsVerified']==69
assert data('OwnContractGuard.json')=={k:data('Incoming.json')[k]==data('OwnPreviousCandidate.json')[k]for k in data('Incoming.json')if k not in ['nodes','summary','sources','baseline','coverage','gaps']}
assert all(data('OwnContractGuard.json').values())
assert data('TauProbe.json')['fullCanonicalExecution'].startswith('UNCOMPILED')
assert txt('Reader.md')==txt('ReaderAddition.md')+txt('IncomingReader.md')
from projection import project
assert txt('NewAdmitted.lean')==project(txt('NewProofs.lean'),txt('NewTests.lean'))
assert txt('CanonicalPrefix.lean')==txt('Incoming.lean')
def with_import(n):
 text=txt(n);i=text.index('import ');return text[:i]+txt('NewImports.lean')+'\n'+text[i:]
assert txt('Canonical.lean')==with_import('Incoming.lean')+'\n'+txt('NewAdmitted.lean')==txt('Suggested.lean')
assert txt('Sketch.lean')==with_import('SketchPrefix.lean')+'\n'+txt('NewAdmitted.lean')
for target,source in [('NativePrefix.lean','Native.lean'),('Incoming.lean','Canonical.lean'),('SketchPrefix.lean','Sketch.lean')]:
 assert sha((S/target).read_bytes())==data('IncomingManifest.json')[source]['sha256']
assert sha((S/'IncomingManifest.json').read_bytes())=='d3eea293f0318c30a15a5e82e221098fe5ce923c301d43e9fc1aa01829b0d6bd'
assert txt('IncomingVerification-replayed.json')==txt('PreviousVerification.json')
assert sha((S/'IncomingVerification-replayed.json').read_bytes())==data('IncomingManifest.json')['Verification.json']['sha256']
assert sha(Path(sys.argv[2]).read_bytes())=='86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1'
probe=txt('ProbePrefix.lean');i=probe.index('import ')
assert txt('Prototype.lean')==probe[:i]+txt('NewImports.lean')+probe[i:]+'\n'+txt('NewProofs.lean')+'\n'+txt('NewTests.lean')
pr=data('Prototype.receipt.json');pl=txt('Prototype.log')
assert pr['exitStatus']==0 and pr['warnings']==0 and pr['availableGiBBefore']>=20
assert pr['sourceSha256']==sha((S/'Prototype.lean').read_bytes())and pr['logSha256']==sha(pl.encode())
assert not re.search(r'\b(?:sorry|admit|axiom)\b',txt('Prototype.lean'))
assert txt('Native.lean')==with_import('NativePrefix.lean')+'\n'+txt('NewProofs.lean')+'\n'+txt('NewTests.lean')+'\n'+txt('Audits.lean')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',txt('Native.lean'))
def headers(text):
 found={}
 for m in re.finditer(r'^(def|lemma|theorem|example)\b(?: ([\w.]+))?',text,re.M):
  depth=0;end=None
  for i in range(m.start(),len(text)):
   c=text[i]
   if c in '([{⟨':depth+=1
   elif c in ')]}⟩':depth-=1
   line=text[m.start():i].rsplit('\n',1)[-1]
   let_assignment=re.match(r'\s*(?:example\s*:\s*)?let\b',line)and ':='not in line
   if depth==0 and text.startswith(':=',i)and not let_assignment:end=i;break
   if depth==0 and m.group(1)=='def'and text.startswith('where',i)and text[i-1].isspace()and text[i+5].isspace():end=i;break
  assert end is not None
  label=m.group(2)if m.group(1)!='example'else'example#'+str(sum(x.startswith('example#')for x in found))
  assert label not in found;found[label]=' '.join(text[m.start():end].split())
 return found
nh=headers(txt('NewProofs.lean'));nt=headers(txt('NewTests.lean'));ch=headers(txt('NewAdmitted.lean'));assert {**nh,**nt}==ch
assert all(not re.search(r'\b(?:sorry|admit|axiom)\b',h)for h in ch.values())
assert len(nh)==20 and len(nt)==7
assert set(plan['newNames'])=={NS+n for n in nh}=={n['declarationName']for n in p['nodes'][538:]}
assert {t['name']for t in data('NewTests.json')}=={NS+n for n in re.findall(r'^-- test: (.+)$',txt('NewTests.lean'),re.M)}
for n in p['nodes'][538:]:
 if n['kind']=='construction':assert len(n['api'])>=3 and len(n['tests'])>=3 and n['uses']
 assert n['declarationName']in txt('Reader.md')and n['statement']in txt('Reader.md')
 for x in n['api']+n['tests']:assert x['name']in txt('Reader.md')and x['statement']in txt('Reader.md')
assert sum(len(n['api'])for n in p['nodes'][538:])+sum(map(len,plan['apiAdditions'].values()))==17 and sum(len(n['tests'])for n in p['nodes'][538:])==10
compilation={}
for name,want,audits in [('Native',0,461),('Sketch',351,231)]:
 rec=data(name+'.receipt.json');log=txt(name+'.log')
 assert rec['exitStatus']==0 and rec['availableGiBBefore']>=20
 assert rec['sourceSha256']==sha((S/(name+'.lean')).read_bytes())and rec['logSha256']==sha(log.encode())
 assert ': error'not in log and log.count('warning:')==log.count('warning: declaration uses `sorry`')==want,(name,log.count('warning:'))
 ex=len(re.findall(r'^example\b',txt(name+'.lean'),re.M));assert ex==355,(name,ex)
 a=re.findall(r'depends on axioms:\s*\[([^]]*)\]',log);assert len(a)==audits,(name,len(a))
 assert 'sorryAx'not in log and all(set(v.strip()for v in x.replace('\n',' ').split(','))<={'propext','Classical.choice','Quot.sound'}for x in a)
 compilation[name]={**rec,'lines':len(txt(name+'.lean').splitlines()),'examples':ex}
assert set(plan['newNames'])<={n for n in re.findall(r"'([^']+)' depends on axioms:",txt('Native.log'))}
for g in data('InputGuard.json'):assert sha(blob(MATH,g['path']))==g['sha256']==sha(blob(BASE,g['path'])),g['path']
for qbase in [MATH,BASE]:
 jq=json.loads(blob(qbase,'research/blueprint/queue.json'));own=next(j for j in jq['jobs']if j['id']=='DESIGN-'+RID)
 contract={k:v for k,v in own.items()if k not in ['state','note']}
 if qbase==MATH:own_original=contract
 else:assert contract==own_original
if (S/'artifact-manifest.json').exists():
 for n,m in data('artifact-manifest.json').items():
  b=(S/n).read_bytes();assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],n
for path,text in contents.items():
 assert not re.search(r'/(?:home|tmp|Users)/|file'+'://',text),path
 assert not re.search(r'[ \t]+$',text,re.M),path
os.environ['ROOTS_VALIDATE_BASE']=BASE
import immutable_view;assert immutable_view.BASE==BASE
for path,t in contents.items():immutable_view.CACHE[path]=t.encode()
immutable_view.install();sys.path.insert(0,str(R/'scripts'))
import check_blueprint,source_issues,check_errata
index=check_blueprint.load_index(Path(sys.argv[2]));assert index[0]is not None
errors,warnings,summary=check_blueprint.check(S/(RID+'.json'),index,check_blueprint.world());assert not errors and not warnings,(errors,warnings)
summary['packet']=paths[1]
issues=source_issues.check_issues(p['sourceIssues'],RID)+check_errata.versions_checked(p,p['sourceIssues']);assert not issues,issues
tree=ast.parse((R/'research/blueprint/intake.py').read_text());wanted={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id in {'ALLOWED','PRIVATE'}for t in n.targets)or isinstance(n,ast.FunctionDef)and n.name in wanted]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs']if j['id']=='DESIGN-'+RID)
problems=[x for f in paths for x in env['file_problems'](f,contents[f])];refusals=env['auto_refusals'](job,paths,False,{'codex-7e92bd'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'ROOTS_VALIDATE_BASE':BASE}));assert graph['worldCommit']==BASE
if BASE==txt('publication-base.txt').strip():assert graph==data('Graph.json')
print(json.dumps(dict(checker=summary,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,wholeIncomingNodesUnchanged=535,incomingMathematicalContractsPreserved=538,newNodes=20,newAPIItems=17,newTests=7,newTestReferences=10,matchedNewHeaders=len(ch),rawAPIItems=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),compilation=compilation,canonicalExecution='UNCOMPILED: no existing full Tau Ceti build at the exact pin; entire canonical prefix retained.',inputGuards=len(data('InputGuard.json')),indexSha256=sha(Path(sys.argv[2]).read_bytes()),immutableBase=BASE,graph=graph,LeanExecuted=False),indent=2))
```

## Script: graph.py

```python
from pathlib import Path
import sys,json,copy,collections,hashlib
S=Path(sys.argv[1]).resolve();R=Path.cwd();sys.path.insert(0,str(S));import immutable_view;immutable_view.install()
sys.path.insert(0,str(R/'scripts'));import build,blueprints,check_blueprint
RID='FunctionFieldArithmeticPartII';FILES=['research/blueprint/'+f+'/'+('DESIGN-' if f=='handoff' else '')+RID+'.'+e for f,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
p=json.loads((S/'Candidate.json').read_text());old=json.loads((S/'Incoming.json').read_text());rd=json.loads((S/'Candidate-roadmap.json').read_text());rold=json.loads((S/'Incoming-roadmap.json').read_text());nodes={n['id']:n for n in p['nodes']}
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
before_edges={(e['source'],e['target'])for e in b['stageEdges']}
added=se-before_edges
expected=set()
assert added==expected and not(before_edges-se),{'added':sorted(added),'removed':sorted(before_edges-se)}
assert all(s in nodes and t in nodes and nodes[s].get('planet')and nodes[t].get('planet')for s,t in added)
assert all(e['kind']=='blueprint'for e in a['stageEdges']if(e['source'],e['target'])in added)
assert [e for e in a['stageEdges']if(e['source'],e['target'])not in added]==b['stageEdges']
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
# All inherited edges remain identical; added edges join existing owned planets only.
ar={r['id']:r for r in a['roadmaps']};br={r['id']:r for r in b['roadmaps']}
assert ar[RID]['blueprint']['declarations']==len(nodes)
assert not ar[RID]['blueprint']['skippedLinks'] and not ar[RID].get('pendingLinks',[])
def skips(r):return r.get('blueprint',{}).get('skippedLinks',[]),r.get('pendingLinks',[])
assert all(skips(ar[x])==skips(br[x]) for x in br if x!=RID)
assert {k:v for k,v in ar.items() if k!=RID}=={k:v for k,v in br.items() if k!=RID}
assert {x['id']:x for x in a['stages'] if not x['id'].startswith(RID+':')}=={x['id']:x for x in b['stages'] if not x['id'].startswith(RID+':')}
summary={'stageDAG':dag(listedstageids,se),'ownDeclarationDAG':dag(nodes,ownedges),'scopedDAG':dag(listedstageids|seen,se|de),'reachableDeclarations':len(seen),'externalDeclarations':sorted(seen-set(nodes)),'baselineLeaves':len(baseref),'requiredPairs':len(pairs),'restructurePairs':len(rspairs),'ownRestructurePairs':sum(s.startswith(RID+':') or t.startswith(RID+':') for s,t in rspairs),'otherPreexistingUnreachableRestructurePairs':len(missing_restructures),'otherUnreachableRestructurePairListSha256':hashlib.sha256(json.dumps(missing_restructures).encode()).hexdigest(),'unresolved':sorted(unresolved),'ownSkippedLinks':[],'ownPendingLinks':[],'otherSkipsMatch':True,'stageEdgesUnchanged':True,'inheritedStageEdgeObjectsUnchanged':True,'newInternalPlanetEdges':sorted(added)}

summary['worldCommit']=immutable_view.BASE
summary['foreignRoadmapsAndStagesUnchanged']=True
summary['immutableInputHashes']={path:hashlib.sha256(immutable_view.blob(path)).hexdigest() for path in sorted(immutable_view.READS)}
print(json.dumps(summary,indent=2))
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
BASE = os.environ.get('ROOTS_VALIDATE_BASE', (Path(__file__).resolve().parent/'publication-base.txt').read_text().strip())
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

## Script: compile.py

```python
"""Serial pinned Lean replay; use only an existing build, never Lake setup."""
from pathlib import Path
import os,sys,subprocess,json
out=Path(sys.argv[1]).resolve();mathlib=Path(sys.argv[2]).resolve();lean=Path(sys.argv[3]).resolve()
name=sys.argv[4];assert name in {'Native.lean','Canonical.lean','Published.lean','AdmittedTyping.lean','Prototype.lean','Sketch.lean'}
pin='082e2d37e8b0463410cdb532e111cd43d5a66174'
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=mathlib,text=True).strip()==pin
assert not subprocess.check_output(['git','status','--porcelain','--untracked-files=no'],cwd=mathlib,text=True).strip()
assert (mathlib/'lean-toolchain').read_text().strip()=='leanprover/lean4:v4.34.0-rc2'
version=subprocess.check_output([str(lean),'--version'],text=True).strip()
assert '4.34.0-rc2' in version and '6a10ac8c22beadecabdbb0919c2b50214762f91d' in version,version
libs=[mathlib/'.lake/build/lib/lean'];assert libs[0].is_dir()
packages=[];omitted=[]
for item in json.loads((mathlib/'lake-manifest.json').read_text())['packages']:
 package=mathlib.parent/item['name'];lib=package/'.lake/build/lib/lean'
 if not lib.is_dir():
  assert item['name']=='Cli',item['name']
  omitted.append('Cli: no compiled library directory; not in either checked import cone')
  continue
 assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=package,text=True).strip()==item['rev'],item['name']
 libs.append(lib);packages.append(item['name'])
free=subprocess.check_output(['free','-g'],text=True)
available=int(free.splitlines()[1].split()[-1])
print(json.dumps({'preflight':'serial existing pinned build','availableGiB':available,'packages':packages,'omitted':omitted,'leanVersion':version}),flush=True)
if available<20:print('Memory guard refused compilation.',flush=True);sys.exit(75)
env=os.environ.copy();env['LEAN_PATH']=os.pathsep.join(str(p) for p in libs)
result=subprocess.run(['/usr/bin/time','-v','timeout','1200',str(lean),'-j','1','-M','8192',str(out/name)],env=env)
sys.exit(result.returncode)
```

## Script: runcheck.py

```python
"""Serial checked replay with bounded diagnostics and apply_patch receipt writes."""
from pathlib import Path
import subprocess,sys,hashlib,json,re,time
S=Path(sys.argv[1]).resolve();name=sys.argv[4];prefix=name[:-5]
start=time.monotonic()
r=subprocess.run([sys.executable,str(S/'compile.py')]+sys.argv[1:],text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
raw=r.stdout
log=raw.replace(str(S),'<SCRATCH>').replace(sys.argv[2],'<MATHLIB>').replace(sys.argv[3],'<LEAN>')
def put(n,t):
 p=S/n
 if p.exists():
  old=p.read_text()
  if old==t:return
  diff='*** Update File: '+str(p)+'\n@@\n'+''.join('-'+x+'\n' for x in old.splitlines())
 else:diff='*** Add File: '+str(p)+'\n'
 patch='*** Begin Patch\n'+diff+''.join('+'+x+'\n' for x in t.splitlines())+'*** End Patch\n'
 subprocess.run(['apply_patch'],input=patch,text=True,check=True,stdout=subprocess.DEVNULL)
 assert p.read_text()==t,n
pre=json.loads(raw.splitlines()[0]);assert pre['availableGiB']>=20
rss=re.search(r'Maximum resident set size \(kbytes\): (\d+)',raw)
record={'sourceSha256':hashlib.sha256((S/name).read_bytes()).hexdigest(),'logSha256':hashlib.sha256(log.encode()).hexdigest(),'availableGiBBefore':pre['availableGiB'],'elapsedSeconds':round(time.monotonic()-start,2),'maxRssKiB':int(rss[1]) if rss else None,'exitStatus':r.returncode,'errors':raw.count('error:' )+raw.count('error('),'warnings':raw.count('warning:'),'admissionWarnings':raw.count('warning: declaration uses'),'axiomAudits':raw.count('depends on axioms'),'sorryAxReferences':raw.count('sorryAx'),'leanVersion':pre['leanVersion']}
put(prefix+'.log',log);put(prefix+'.receipt.json',json.dumps(record,indent=2)+'\n')
print(json.dumps(record,indent=2))
if r.returncode or record['warnings']!=record['admissionWarnings']:
 print('\n'.join(x for x in log.splitlines() if 'error' in x or 'warning' in x))
sys.exit(r.returncode)
```

## Script: package.py

```python
"""Archive only named job evidence in an inert comment; write final public recovery."""
from pathlib import Path
import base64,hashlib,json,re,sys,zlib
S=Path(sys.argv[1]).resolve();R=Path.cwd();mode=sys.argv[2]
STEM='FunctionFieldArithmeticPartII'
suggested=R/'research/blueprint/suggested'/(STEM+'.lean')
sha=lambda b:hashlib.sha256(b).hexdigest()
NAMES='''Incoming-roadmap.json Incoming.json IncomingReader.md Incoming.lean IncomingHandoff.md IncomingManifest.json
IncomingVerification-replayed.json NativePrefix.lean CanonicalPrefix.lean SketchPrefix.lean NewImports.lean
Native.lean Native.log Native.receipt.json Canonical.lean Sketch.lean Sketch.log Sketch.receipt.json
NewProofs.lean NewTests.lean NewAdmitted.lean Audits.lean Candidate-roadmap.json Candidate.json Reader.md ReaderAddition.md Suggested.lean Handoff.md HandoffBase.md
ClaimReceipt.json Reading.json SourceReading.json BaselineReading.json OwnReadingReuse.json OwnContractGuard.json OwnPreviousReading.json OwnPreviousInputGuard.json OwnPreviousManifest.json OwnPreviousCandidate.json TauProbe.json
InputGuard.json PublicationChanges.json Plan.json NewNodes.json NewTests.json PreviousHead.txt PreviousRecovery.json PreviousVerification.json Verification-mathematical.json Verification.json
TouchingLinks.json Graph.json base.txt publication-base.txt ProbePrefix.lean Prototype.lean Prototype.log Prototype.receipt.json
assemble.py author.py projection.py write_handoff.py verify.py graph.py immutable_view.py compile.py runcheck.py package.py'''.split()
if mode=='archive':
 meta={n:dict(sha256=sha((S/n).read_bytes()),bytes=len((S/n).read_bytes()),lines=len((S/n).read_bytes().splitlines()))for n in NAMES}
 mb=(json.dumps(meta,indent=2,sort_keys=True)+'\n').encode();(S/'artifact-manifest.json').write_bytes(mb)
 payload={n:dict(sha256=sha((S/n).read_bytes()),data=base64.b64encode(zlib.compress((S/n).read_bytes(),9)).decode())for n in NAMES+['artifact-manifest.json']}
 pb=(json.dumps(payload,sort_keys=True,separators=(',',':'))+'\n').encode();(S/'payload.json').write_bytes(pb)
 report=dict(artifacts=len(NAMES),helpers=sum(n.endswith('.py')for n in NAMES),manifestSha256=sha(mb),payloadSha256=sha(pb))
 (S/'package.json').write_text(json.dumps(report,indent=2)+'\n')
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED ROOT POINT DIAGRAM PAYLOAD\n'+pb+b'END ARCHIVED ROOT POINT DIAGRAM PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('roadmaps','Candidate-roadmap.json'),('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated root-point diagram evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='FunctionFieldArithmeticPartII'
ARCHIVE=__ARCHIVE__
MANIFEST_SHA=__MANIFEST__
PAYLOAD_SHA=__PAYLOAD__
EXPECTED=__EXPECTED__
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED ROOT POINT DIAGRAM PAYLOAD\\n',1)[1].split('END ARCHIVED ROOT POINT DIAGRAM PAYLOAD -/',1)[0].encode()
assert sha(pb)==PAYLOAD_SHA
payload=json.loads(pb)
def unpack(name):
 b=zlib.decompress(base64.b64decode(payload[name]['data']));assert sha(b)==payload[name]['sha256'],name
 return b
mb=unpack('artifact-manifest.json');assert sha(mb)==MANIFEST_SHA;meta=json.loads(mb)
assert set(payload)==set(meta)|{'artifact-manifest.json'}
for name,m in meta.items():
 assert Path(name).name==name and name not in {'.','..'}
 b=unpack(name);assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],name
 (S/name).write_bytes(b)
(S/'artifact-manifest.json').write_bytes(mb)
public={}
for folder,ext,name in [('roadmaps','json','Candidate-roadmap.json'),('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','PublicHandoff.md')]:
 path='research/blueprint/'+folder+'/'+('DESIGN-'if folder=='handoff'else'')+RID+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder]and b==(S/name).read_bytes(),path
 (S/name).write_bytes(b);public[path]=sha(b)
(S/(RID+'.json')).write_bytes((S/'Candidate.json').read_bytes())
fence=chr(96)*3;handoff=(S/'PublicHandoff.md').read_text()
assert handoff.startswith((S/'HandoffBase.md').read_text())
code=handoff.split('## Script: recover.py\\n\\n'+fence+'python\\n',1)[1].split('\\n'+fence+'\\n',1)[0]+'\\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from public handoff.'
for helper in meta:
 if helper.endswith('.py'):
  embedded=handoff.split('## Script: '+helper+'\\n\\n'+fence+'python\\n',1)[1].split('\\n'+fence+'\\n',1)[0]+'\\n'
  assert embedded.encode()==(S/helper).read_bytes(),helper

(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\\n');print(json.dumps(receipt,indent=2))
'''
 for key,val in [('__ARCHIVE__',archive),('__MANIFEST__',p['manifestSha256']),('__PAYLOAD__',p['payloadSha256']),('__EXPECTED__',expected)]:code=code.replace(key,repr(val))
 compile(code,'recover.py','exec');(S/'recover.py').write_text(code)
 prose=f'''
## Public recovery and replay

Archive commit `{archive}` is an ancestor changing only this issue's suggested file. Its {p['artifacts']} inert artifacts include all {p['helpers']} authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `{p['manifestSha256']}`; payload SHA256 `{p['payloadSha256']}`. The final suggested file has no archive payload and equals the entire Tau-dependent Canonical.lean, which remains UNCOMPILED.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set ROOTS_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Sketch.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean and Suggested.lean are byte-equal, but neither whole file was compiled: no existing complete Tau build at the pin is available. The two bounded Mathlib checks certify only their recorded import cones. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

'''
 text=(S/'HandoffBase.md').read_text()+prose+'```python\n'+code+'```\n'
 (S/'PublicHandoff.md').write_text(text)
 (R/'research/blueprint/handoff'/('DESIGN-'+STEM+'.md')).write_text(text)
 suggested.write_bytes((S/'Suggested.lean').read_bytes())
 print(json.dumps(dict(archive=archive,recoverySha256=sha(code.encode()),finalHandoffSha256=sha(text.encode())),indent=2))
else:raise ValueError(mode)
```

## Public recovery and replay

Archive commit `b1ce1133a69ed176a54d6a1de239f86076234a0d` is an ancestor changing only this issue's suggested file. Its 68 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `0046e8b5555403fcd1e155fa393b2f64724904d9828b41cbcad3f7ca186e7a62`; payload SHA256 `2a9c6542d0504c779cba716d48c37afd576ecd8451f00920f074c0cc90a042bc`. The final suggested file has no archive payload and equals the entire Tau-dependent Canonical.lean, which remains UNCOMPILED.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set ROOTS_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Sketch.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean and Suggested.lean are byte-equal, but neither whole file was compiled: no existing complete Tau build at the pin is available. The two bounded Mathlib checks certify only their recorded import cones. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

```python
"""Recover public authenticated root-point diagram evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='FunctionFieldArithmeticPartII'
ARCHIVE='b1ce1133a69ed176a54d6a1de239f86076234a0d'
MANIFEST_SHA='0046e8b5555403fcd1e155fa393b2f64724904d9828b41cbcad3f7ca186e7a62'
PAYLOAD_SHA='2a9c6542d0504c779cba716d48c37afd576ecd8451f00920f074c0cc90a042bc'
EXPECTED={'roadmaps': '8a8eac0d5674807925c5b52b0b06bad04b0aea34a4526560d3948c78e508eb8a', 'packets': 'e972428b7b360c792524e824552354182d926b3dea9ed9fd720952726314d5fe', 'readmes': '1aece5ebae56240314324dd9eb31e3a9d523428a8ae4c2ac8cc1868a19f4fd9e', 'suggested': '78c4a1f32baa448127a520ff6a9d1ffc1426219cc8bdf3c0236df5c6babb900f'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED ROOT POINT DIAGRAM PAYLOAD\n',1)[1].split('END ARCHIVED ROOT POINT DIAGRAM PAYLOAD -/',1)[0].encode()
assert sha(pb)==PAYLOAD_SHA
payload=json.loads(pb)
def unpack(name):
 b=zlib.decompress(base64.b64decode(payload[name]['data']));assert sha(b)==payload[name]['sha256'],name
 return b
mb=unpack('artifact-manifest.json');assert sha(mb)==MANIFEST_SHA;meta=json.loads(mb)
assert set(payload)==set(meta)|{'artifact-manifest.json'}
for name,m in meta.items():
 assert Path(name).name==name and name not in {'.','..'}
 b=unpack(name);assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],name
 (S/name).write_bytes(b)
(S/'artifact-manifest.json').write_bytes(mb)
public={}
for folder,ext,name in [('roadmaps','json','Candidate-roadmap.json'),('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','PublicHandoff.md')]:
 path='research/blueprint/'+folder+'/'+('DESIGN-'if folder=='handoff'else'')+RID+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder]and b==(S/name).read_bytes(),path
 (S/name).write_bytes(b);public[path]=sha(b)
(S/(RID+'.json')).write_bytes((S/'Candidate.json').read_bytes())
fence=chr(96)*3;handoff=(S/'PublicHandoff.md').read_text()
assert handoff.startswith((S/'HandoffBase.md').read_text())
code=handoff.split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from public handoff.'
for helper in meta:
 if helper.endswith('.py'):
  embedded=handoff.split('## Script: '+helper+'\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
  assert embedded.encode()==(S/helper).read_bytes(),helper

(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
