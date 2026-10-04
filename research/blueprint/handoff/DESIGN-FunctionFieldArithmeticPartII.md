# Framed root coordinates and normalized charts — checkpoint

Codex — codex-rtOQ9t. Refs #3403. Partial; all implementations remain unchecked.

This continuation adds25 nodes: one definition, four constructions and20 lemmas. FramedRoot stores a bundled power-identification unit u and root coordinate y with u*y^n=f. Its native groupoid has actual unit-labelled arrows with both y_target=w*y_source and u_target*w^n=u_source. The actual identity, composite and inverse labels satisfy the native category and groupoid axioms. A chosen frame is a premise of the coordinate interpretation; no global frame existence is proved.

The existing normalized affine root-point action groupoid embeds by coefficient1, its actual root image and the same underlying unit on every arrow. Native Functor.FullyFaithful data explicitly recovers the roots-of-unity label from the power-identification equation. The native Hom equivalence preserves all automorphisms, identities, composites and unit labels, with actual roundtrip laws. A framed object is isomorphic to an embedded chart object exactly when its coefficient is an n-th power in the test algebra unit group. At exponent1 it always normalizes.

Over Z/4, n=2,u=3,y=1,f=3 gives valid framed data while the normalized chart has no root. Thus the chart embedding is not objectwise essentially surjective over every test algebra. Over Z/9 at f=0,n=2, the framed roots y=3 and y=0 share coefficient1 but have no arrow from the first to the second; nonzero nilpotent root sections remain even though n is invertible. Nine typed examples also consume the arbitrary chart coordinates, full Hom bijection, both arrow roundtrips, categorical inverse/composite/identity labels and the nonidentity wild stabilizer labelled minus1 over Z/4.

All558 incoming node objects and292 incoming baseline objects are unchanged. New nodes have22 API references and19 test references to9 distinct examples; four native baseline declarations are added. The framed carrier and each construction have at least three API items and three typed tests with explicit uses. All40 planets,ten partial stages,eight gaps,thirteen requests,both paper routes and the complete omission ledger retain their scope. Only the RS.0 coverage/roadmap frontier and TOWER-TYPING detail gain this local result. All nine inherited source findings and original version receipts remain byte-equivalent as JSON objects; two corrected-author-draft findings and two exact author-draft version receipts are appended.

The actual native sheaf RootObject-to-coordinate functor, existence of root-line frames and unit roots locally, fppf stackification, general root-object comparison, infinite coherent reindexing, genuine 2-limit comparison, effective fpqc quotient/descent and higher-universe adapters remain open. No orbit-set or objectwise chart limit substitutes for them. The reserved key retains scheme/stack bases, arbitrary invertible line bundles with section, every positive exponent and fppf scope. Étale/DM results keep exponent-invertibility premises. Yun–Zhang relative closed-subscheme roots, finite Kummer/DVR and geometric sheaf obligations remain.

## Reading and provenance

The whole19646-character issue was read before claim5978109879 and again after bot5978114614 confirmed that exact numeric comment; bodies were identical. All eight complete FA.0–FA.7 applicable reviewed library-coverage row objects were freshly read in bounded outputs; no PartII row exists. The whole reserved root-stack key, TOWER-TYPING gap, canonical RootObject/iso and coordinate-arrow headers, incoming ProbePrefix298 lines, incoming20 new proofs and7 tests were read. The latest RS.2 remaining tail was read, not its full historical accumulated text. Full protocols were read earlier in this continuous session with unchanged hashes verified. The entire8895-line incoming native prefix is authenticated and recompiled, not claimed manually reread in full.

Incoming peer PR6055 at head4b5d7dede5fa23065e2d6adfa58d34721bf9cff0 was recovered from public archiveb1ce1133a69ed176a54d6a1de239f86076234a0d. All68 artifacts,ten helpers andfive final public deliverables authenticated; manifest0046e8b5555403fcd1e155fa393b2f64724904d9828b41cbcad3f7ca186e7a62. Its actual recovered verifier reproduced the archived report byte-for-byte, without executing Lean. All three prefixes remain byte-for-byte in order; assembly inserts one individual native FullyFaithful import and appends the new data, proofs/tests and audits or their exact admitted projection.

Original own PR6048 head43b89b72af6f491d5f90a7f4715be3b5293b278e was freshly recovered from its actual public archiveb9518b740becd088f0e70f5e0fc2984a835b5d34. Manifestd3eea293f0318c30a15a5e82e221098fe5ce923c301d43e9fc1aa01829b0d6bd authenticates all69 original artifacts andten helpers, including OwnPreviousReading.json, OwnInheritedReadingReceipt.json and original own6036 reading. All18 external input controls are unchanged; five own deliverables changed. Original source, supplier, route, parent-reader and upstream-reader scopes are reused only at their recorded extent. OwnContractGuard.json verifies the unchanged whole13 requests, omission/source route and inherited source issue/version contracts. No peer reading is relabelled as this worker's reading.

Actual pinned native statements and ambient hypotheses were read for Units, Groupoid, FullyFaithful, its Hom equivalence and Groupoid.isoEquivHom. Native structures are reused. The three original coordinate equations motivate the new carrier; this checkpoint does not implement their geometric sheaf comparison. Exact-name library/packet scans and the touching link scan found no new specialized declaration or PartII link entry; these are bounded searches, not exhaustive absence proofs.

Fresh primary source collation is limited to Alper's author working draft23February2023, complete extracted printedp.139, and author draft5January2026, complete extracted printedpp.159–160. The complete books and rendered pages were not read; no publisher version was read. Exact PDF SHA256 values, URLs and read extents are in SourceReading.json and appended sourceVersions. The old zero-section identification with the root gerbe is corrected by the explicit later Caution in Example4.9.22; E10 records that correction and the Z/9 coordinate counterexample. E11 records the old exercise's blanket classifying-stack fiber assertion, corrected by Exercise4.9.23(f). Both are attributed to their precise author drafts and already-known later corrections, with no new erratum or published-version claim. The corrected root-stack definition motivates the framed coordinates; their native algebraic proofs are authored deductions without the exercise's exponent-invertibility restriction.

## Validation

The whole Tau-dependent Canonical.lean and final Suggested.lean remain UNCOMPILED. TauProbe.json freshly confirms exact pinned sourcef790474821cf4256814db967cb154e7af3d0c369, a different existing build head and four missing required imports. No Tau build, cache, clone, snapshot, Lake project or language server was created. Every Lean run used only the existing Mathlib build082e2d37e8b0463410cdb532e111cd43d5a66174 and Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d, serially, with immediately checked memory≥20GiB, one thread,8192MiB managed limit and1200-second timeout. Every compiler process finished.

- Native.lean: 9185 lines, 364 examples, exit0, 0 warnings, 484 axiom-dependency audits plus1 axiom-free audits; 52GiB available, 334.24 seconds, peak4187492KiB. Source SHA256 `0a892c3592bb81b052adc9d2d2b9794d83c52963f8d4be136f345403418183bc`; diagnostic SHA256 `c72028eaacd94d4a9c40c0a4509819081fe171f872ddb49090981675e513a6be`.
- Sketch.lean: 7689 lines, 364 examples, exit0, 380 warnings, 231 axiom-dependency audits plus0 axiom-free audits; 52GiB available, 155.54 seconds, peak4021376KiB. Source SHA256 `85f6dcf9364ec11c68fc501bea9364b6eaafc9a6a69f164ae15e84bdd692e34d`; diagnostic SHA256 `29d5d4fe38be0f4a7da375e7007cb6b4faa0d3655e4f90d92e86802404694a33`.

Native has364 examples and zero admissions/errors/warnings. All24 new non-structure declaration closures were audited; the coordinate-equation projection is axiom-free and the other closures use only propext,Classical.choice,Quot.sound. The bounded Sketch has364 examples and380 admission warnings only, with231 inherited axiom-dependency audits. All25 new declaration and9 example headers match the exact suggested projection. The framed carrier and all four constructions remain concrete;20 lemma proofs and9 example proofs are admitted in the projection. Suggested equals the entire Canonical, SHA256 `35899f42ce344316457f3ab3fd6efd8646c5801616d417854b0fec65c879b90a`. These bounded checks do not certify whole Tau-dependent canonical compilation.

The final focused Prototype separately compiled with no errors/warnings against the exact incoming298-line ProbePrefix. It contains the new data/proofs and all nine tests, with source/log/receipt retained. It does not replace either complete run.

The indexed packet checker, actual intake/file rules and source issue/version checks pass. The packet has583 nodes,296 baseline references,477 raw API entries and455 raw test references. The publication graph has stage3057/8726, own583/1309 and scoped3745/11142 vertices/edges, all acyclic. All89 required supplier pairs are reachable; no owned skipped/pending links. All foreign roadmap/stage objects and inherited stage-edge objects match the immutable control. The45 unrelated pre-existing unreachable restructure pairs are recorded without changing their ownership.

Mathematical base `44786d09345d14fb61f2aa03980d5e56ac091914`; publication base `f142d5038553b7fbe96b2cd62b612af9b32b930c`. All23 guarded inputs and the queue issue contract are unchanged between them. Index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Both immutable verifier reports execute the actual checker,intake and atlas assembler without Lean or a repository snapshot. Actual public HTTP recovery authenticates every artifact,five final deliverables,ten exact helper fences and its own public code; both actual recovered reports must match the archived reports before opening the PR.

## Resume

Use the framed coordinate groupoid as the target of the native RootObject comparison under chosen trivializations, proving both object and actual arrow transports. Retain the unit-root obstruction over the original test algebra and construct its local normalization via frame/unit-root torsors before fppf stackification. Then compare general root-object groupoids, retain the existing actual Grpd diagram and natural algebra changes, and continue coherent infinite reindexing and genuine 2-limits. Keep nilpotent sections, automorphisms, higher-universe adapters, effective fpqc quotient/descent and all source/supplier/omission contracts explicit. No implementation or source closure is marked complete.

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
"""Append framed root coordinates and the exact normalized-chart comparison."""
from pathlib import Path
import copy,csv,json,re,sys
S=Path(__file__).resolve().parent;RID='FunctionFieldArithmeticPartII';NS='TauCeti.RootStack.';P=RID+':RS.0/framed-'
load=lambda n:json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
old=load('Incoming.json');p=copy.deepcopy(old);road=load('Incoming-roadmap.json')
existing={n.get('declarationName','').removeprefix(NS):n['id']for n in old['nodes']}
specs=[
('object','FramedRoot','definition','Framed root coordinates','For arbitrary f in A and a commutative A-algebra B, store a bundled unit u and a root-section coordinate y with u*y^n=algebraMap(f). The unit records the power identification after choosing a frame; it is not assumed to have an n-th root. This coordinate carrier does not assert that a root line admits a global frame.',['mathlib:Units'],'Use the native unit type and retain the power-identification equation as a field.'),
('groupoid','FramedRoot.groupoid','construction','The groupoid of framed root coordinates','Construct a native Groupoid of framed root coordinates. An arrow p to q has a unit label w with q.y=w*p.y and q.u*w^n=p.u. Compose labels in categorical order as label(j)*label(h); identities have label1 and inverses have inverse labels. Both arrow equations remain even for the zero section.',['FramedRoot','mathlib:CategoryTheory.Groupoid'],'Multiply the section equations and unit-power equations for composition; use the native unit inverse for both inverse equations. Subtype extensionality proves the category and inverse axioms.'),
('equation','FramedRoot.coordinate_equation','lemma','The retained framed root equation','Every framed root p satisfies p.u*p.y^n=algebraMap(f), with p.u a native bundled unit.',['FramedRoot'],'Use the actual coordinate carrier equation field.'),
('hom-ext','FramedRoot.hom_ext','lemma','Extensionality of framed root arrows','Two arrows between the same framed roots are equal when their underlying bundled unit labels agree.',['FramedRoot.groupoid'],'Use native subtype extensionality.'),
('identity','FramedRoot.id_label','lemma','The framed identity label','The categorical identity arrow on a framed root has unit label1.',['FramedRoot.groupoid'],'Reduce the actual groupoid identity.'),
('composition','FramedRoot.comp_label','lemma','The framed composite label','The actual categorical composite h followed by j has label(j)*label(h).',['FramedRoot.groupoid'],'Reduce the actual groupoid composition.'),
('inverse','FramedRoot.inv_label','lemma','The framed inverse label','The native groupoid inverse of an arrow has the inverse bundled unit label.',['FramedRoot.groupoid'],'Reduce the actual inverse construction.'),
('arrow-section','FramedRoot.arrow_section','lemma','The section equation on every framed arrow','For every actual framed arrow h:p to q, q.y=h.label*p.y. No cancellation or regularity of the section is assumed.',['FramedRoot.groupoid'],'Use the first retained equation in the actual arrow carrier.'),
('arrow-coefficient','FramedRoot.arrow_coefficient','lemma','The power-identification equation on every framed arrow','For every actual framed arrow h:p to q, q.u*h.label^n=p.u as an equality of bundled units. This retains the power-identification constraint even if the sections vanish.',['FramedRoot.groupoid'],'Use the second retained equation in the actual arrow carrier.'),
('chart-embedding','rootChartEmbedding','construction','The normalized chart embedded in framed coordinates','Construct an actual functor from the existing affine root-point action groupoid to framed coordinates. A chart point becomes coefficient1 with its actual root image; its roots-of-unity arrow keeps its underlying unit label.',['affineRootPointGroupoid.groupoid','affineRootPointGroupoid.root_equation','FramedRoot.groupoid','mathlib:mem_rootsOfUnity'],'The inherited root equation defines the framed object with coefficient1. The roots-of-unity equation supplies the second framed arrow equation. Both categorical functor axioms reduce to the existing labels.'),
('chart-coefficient','rootChartEmbedding.obj_coefficient','lemma','The embedded power identification is normalized','Every embedded chart object has coefficient1 as a bundled unit.',['rootChartEmbedding'],'Reduce the actual object field.'),
('chart-section','rootChartEmbedding.obj_section','lemma','The embedding keeps the actual root image','The section coordinate of the embedded chart object is its algebra-map image of the AdjoinRoot root.',['rootChartEmbedding'],'Reduce the actual object field.'),
('chart-arrow','rootChartEmbedding.map_label','lemma','The embedding keeps every arrow label','The mapped arrow label is exactly the underlying bundled unit of the original roots-of-unity label.',['rootChartEmbedding'],'Reduce the actual functor map.'),
('fully-faithful','rootChartEmbedding.fullyFaithful','construction','Full faithfulness of the normalized chart embedding','Construct native Functor.FullyFaithful data for the actual chart embedding. Recover every framed arrow between normalized objects by its unit label; its power-identification equation proves membership in rootsOfUnity. The recovery and map are mutually inverse.',['rootChartEmbedding','mathlib:CategoryTheory.Functor.FullyFaithful','mathlib:mem_rootsOfUnity'],'Between coefficient1 objects the second arrow equation is w^n=1. Bundle the same unit as a root of unity and retain the section equation. Both native roundtrip laws hold on actual arrows.'),
('hom-equivalence','rootChartEmbedding.homEquiv','construction','An equivalence on actual chart Hom types','For every pair of chart objects, provide the actual equivalence of its full Hom type with the framed Hom type between their embedded objects. In particular every automorphism and its label is retained.',['rootChartEmbedding.fullyFaithful','mathlib:CategoryTheory.Functor.FullyFaithful.homEquiv'],'Reuse the native Hom equivalence of the constructed FullyFaithful data.'),
('preimage-label','rootChartEmbedding.preimage_label','lemma','The recovered chart arrow label','The preimage of an actual framed arrow between embedded chart objects has the same underlying bundled unit label.',['rootChartEmbedding.fullyFaithful'],'Reduce the explicit arrow preimage.'),
('map-preimage','rootChartEmbedding.map_preimage','lemma','The framed-arrow roundtrip','Mapping the recovered chart preimage of an actual framed arrow gives that very framed arrow.',['rootChartEmbedding.fullyFaithful'],'Reduce the actual native FullyFaithful roundtrip.'),
('preimage-map','rootChartEmbedding.preimage_map','lemma','The chart-arrow roundtrip','Recovering the preimage of a mapped chart arrow gives that very chart arrow.',['rootChartEmbedding.fullyFaithful'],'Reduce the actual native FullyFaithful roundtrip.'),
('hom-label','rootChartEmbedding.homEquiv_label','lemma','The forward Hom equivalence label','The Hom equivalence sends a chart arrow to a framed arrow with its same underlying bundled unit.',['rootChartEmbedding.homEquiv'],'Reduce the native Hom equivalence and explicit map.'),
('hom-inverse-label','rootChartEmbedding.homEquiv_symm_label','lemma','The inverse Hom equivalence label','The inverse Hom equivalence recovers the original bundled unit label of any actual framed arrow between embedded objects.',['rootChartEmbedding.homEquiv'],'Reduce the inverse Hom equivalence and explicit preimage.'),
('hom-identity','rootChartEmbedding.homEquiv_identity','lemma','The Hom equivalence preserves identities','At every chart object the actual Hom equivalence maps the categorical identity to the framed categorical identity.',['rootChartEmbedding.homEquiv'],'Reduce the concrete native functor identity.'),
('hom-composition','rootChartEmbedding.homEquiv_composition','lemma','The Hom equivalence preserves composition','The Hom equivalence sends a composite of chart arrows to the actual categorical composite of their framed images.',['rootChartEmbedding.homEquiv'],'Reduce the concrete native functor composition.'),
('normalized-equation','FramedRoot.normalized_section_pow','lemma','Normalizing a framed root by a unit root','If a bundled unit w has w^n=p.u, then (w*p.y)^n=algebraMap(f). This gives an actual normalized chart root with no field, regularity or exponent-invertibility assumption.',['FramedRoot.coordinate_equation'],'Expand the power of the product, use the actual unit-power coercion and w^n=p.u, and apply the framed root equation.'),
('essential-image','rootChartEmbedding.essentialImage_iff','lemma','The exact objectwise normalization obstruction','For a framed root p, an isomorphism to some embedded normalized chart object exists if and only if its coefficient p.u is an n-th power in the native unit group B.units. The isomorphism is an actual groupoid arrow, not an orbit-set equality.',['rootChartEmbedding','FramedRoot.normalized_section_pow','mathlib:CategoryTheory.Groupoid.isoEquivHom'],'An actual isomorphism to a coefficient1 object supplies a unit w with w^n=p.u. Conversely construct the AdjoinRoot point with root w*p.y, construct the actual framed arrow labelled w, and use the native groupoid Hom-to-Iso equivalence.'),
('exponent-one','rootChartEmbedding.exponent_one','lemma','Every framed first root normalizes','At exponent1 every framed root is isomorphic to an embedded normalized chart object, using its own coefficient as the unit root.',['rootChartEmbedding.essentialImage_iff'],'Apply the proved criterion with w=p.u and the native first-power identity.')]
ids={name:P+slug for slug,name,*_ in specs};nodes=[];sid='FramedRoot-codex-rtOQ9t';src=load('SourceReading.json')[1]
for slug,name,kind,title,statement,deps,proof in specs:
 nodes.append(dict(id=ids[name],parentStageId=RID+':RS.0',realises=[RID+':RS.0'],kind=kind,title=title,declarationName=NS+name,statement=statement,hypotheses=['Arbitrary commutative A and commutative A-algebra B in a common universe; f arbitrary. The coordinate carrier and its groupoid exist for every natural n; the chart embedding and normalization comparison use positive n via NeZero. No invertibility of n, reducedness, nontriviality, unit-section, regularity, finite-generation, flatness or injectivity assumption.','A chosen-frame coordinate groupoid only. The actual sheaf RootObject-to-coordinate functor, existence of frames and unit roots locally, fppf stackification, effective descent, infinite coherent reindexing and genuine 2-limits remain separate obligations.'],prerequisites=[d if ':'in d else ids[d]if d in ids else existing[d]for d in deps],proofSteps=[proof],acceptance=[statement,'Retain the arbitrary bundled power-identification unit and both arrow equations. Do not identify chart points with all root-stack points over the original test algebra.'],library=dict(module='TauCeti/AlgebraicGeometry/RootStacks/RS0',namespace=NS[:-1]),sources=[dict(sourceId=sid,locator='Alper corrected author draft5January2026 Example4.9.22 and Exercise4.9.23(c), pp.159–160; authored framed coordinate deductions',excerpt='Root stacks',match='The source motivates root data. The coordinate groupoid and chart comparison are authored algebraic deductions from the retained root equation and arrow equations. The source exercise assumes invertible exponent; the native coordinate proofs do not. No global line-bundle comparison or descent theorem is attributed here.')],api=[],tests=[],implementationStatus='unchecked'))
by={n['declarationName'].removeprefix(NS):n for n in nodes}
apis={'FramedRoot':['FramedRoot.coordinate_equation','FramedRoot.normalized_section_pow','FramedRoot.arrow_section','FramedRoot.arrow_coefficient'],
'FramedRoot.groupoid':['FramedRoot.hom_ext','FramedRoot.id_label','FramedRoot.comp_label','FramedRoot.inv_label','FramedRoot.arrow_section','FramedRoot.arrow_coefficient'],
'rootChartEmbedding':['rootChartEmbedding.obj_coefficient','rootChartEmbedding.obj_section','rootChartEmbedding.map_label','rootChartEmbedding.essentialImage_iff','rootChartEmbedding.exponent_one'],
'rootChartEmbedding.fullyFaithful':['rootChartEmbedding.preimage_label','rootChartEmbedding.map_preimage','rootChartEmbedding.preimage_map'],
'rootChartEmbedding.homEquiv':['rootChartEmbedding.homEquiv_label','rootChartEmbedding.homEquiv_symm_label','rootChartEmbedding.homEquiv_identity','rootChartEmbedding.homEquiv_composition']}
testdata=[('chart_coordinates','computation','For arbitrary actual chart root y, the embedding has coefficient1 and section coordinate y and has its actual identity isomorphism.'),('all_arrows_recovered','compatibility','For arbitrary chart objects the actual embedding map is bijective on the full Hom type and its Hom equivalence preserves the bundled unit label.'),('exponent_one','computation','For arbitrary framed root at exponent1, the retained equation becomes u*y=f and the actual normalization isomorphism exists.'),('inverse_and_composition','compatibility','The actual embedding retains the categorical composite label, groupoid inverse label and identity label for arbitrary actual chart arrows.'),('wild_stabilizer_retained','non-example','Over Z/4 at f=0,n=2,y=0, construct the nonidentity stabilizer labelled minus1; its actual image stays nonidentity and keeps the same label. The Hom equivalence detects the distinction.'),('arrow_roundtrips','compatibility','Every actual framed arrow between embedded chart objects is recovered and mapped back exactly, with the same unit label; both FullyFaithful and Hom equivalence roundtrips are consumed.'),('unit_section_chart_empty','non-example','Over Z/4 at f=3,n=2, the framed root u=minus1,y=1 exists, but no normalized chart root or isomorphism to an embedded chart point exists. A unit section does not imply objectwise surjectivity of this chart presentation.'),('zero_section_retains_nilpotents','non-example','Over Z/9 at f=0,n=2, the framed roots with coefficient1 and root3 or root0 share power-identification data but admit no arrow from root3 to root0. Nonzero nilpotent root sections remain even when n is invertible.'),('normalization_obstruction','non-example','Over Z/4 at f=3,n=2,u=minus1,y=1, no bundled unit has square equal to u; the framed power-identification coefficient cannot be dropped over the original test algebra.')]
tests=[dict(name=NS+'framedRootTests.'+a,kind=b,statement=c)for a,b,c in testdata];tb={a:t for (a,*_),t in zip(testdata,tests)}
testsets={'FramedRoot':['chart_coordinates','exponent_one','unit_section_chart_empty','normalization_obstruction','zero_section_retains_nilpotents'],
'FramedRoot.groupoid':['inverse_and_composition','wild_stabilizer_retained','unit_section_chart_empty','zero_section_retains_nilpotents'],
'rootChartEmbedding':['chart_coordinates','all_arrows_recovered','wild_stabilizer_retained','unit_section_chart_empty'],
'rootChartEmbedding.fullyFaithful':['all_arrows_recovered','arrow_roundtrips','wild_stabilizer_retained'],
'rootChartEmbedding.homEquiv':['all_arrows_recovered','arrow_roundtrips','wild_stabilizer_retained']}
for name,entries in apis.items():
 by[name]['api']=[dict(name=NS+x,role='compatibility',statement=by[x]['statement'])for x in entries]
 by[name]['tests']=[tb[x]for x in testsets[name]]
 by[name]['uses']=[dict(where=RID+':RS.0/root-arrow-scalars',how='Supply the actual target coordinate groupoid for the planned native sheaf-arrow comparison; the sheaf-to-coordinate functor and frame existence remain open.'),dict(where=RID+':RS.2/factorial-root-limit',how='Locate the exact chart-normalization obstruction before claiming that finite chart point diagrams recover general root-object groupoids or their limits.')]
p['nodes']+=nodes
rows=list(csv.reader(Path(sys.argv[1]).open(),delimiter='\t'));have={x['ref']for x in p['baseline']['declarations']};baseline=[];reading=[]
for name in ['Units','CategoryTheory.Functor.FullyFaithful','CategoryTheory.Functor.FullyFaithful.homEquiv','CategoryTheory.Groupoid.isoEquivHom']:
 row=next(r for r in rows if len(r)>5 and r[0]=='mathlib'and r[1]==name);reading.append(dict(name=name,file=row[3],line=int(row[4]),signature=row[5],scope='Actual statement and applicable ambient hypotheses personally read at exact pin; ranges in Reading.json.'))
 if 'mathlib:'+name not in have:baseline.append(dict(ref='mathlib:'+name,kind=row[2],module=row[3],line=int(row[4]),provides=row[5]+' Reuse native categorical structure for the framed root comparison.',checked='Codex — codex-rtOQ9t read the actual statement at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 on2026-10-04.'))
p['baseline']['declarations']+=baseline;save('BaselineReading.json',reading)
p['sources'].append(dict(id=sid,title='Root stacks; authored framed root-coordinate and normalized-chart deductions',authors='Jarod Alper; specialized deductions by Codex — codex-rtOQ9t',edition='Author draft5January2026, selected extracted printedpp.159–160 only; corresponding23February2023 p.139 collated',url=src['url'],sha256=src['sha256'],accessed=src['accessed'],readSections=[x['readScope']for x in load('SourceReading.json')]))
p['sourceIssues']+=load('NewSourceIssues.json');p['sourceVersions']+=load('NewSourceVersions.json')
frontier='An actual native framed root-coordinate groupoid now retains the arbitrary power-identification unit u and equation u*y^n=f. Its arrows retain both section and unit-power equations. The existing normalized affine chart embeds fully faithfully, with native FullyFaithful data and an actual Hom equivalence preserving all stabilizers. A framed object is isomorphic to an embedded chart object exactly when u is an n-th power in the test algebra unit group. The Z/4 example u=3,y=1,f=3,n=2 has framed root data but no chart root, so chart points do not give objectwise essential surjectivity before local trivialization and stackification. The native sheaf RootObject-to-coordinate functor, frame/unit-root existence locally, fppf stackification, infinite coherent reindexing, genuine 2-limit comparison, effective fpqc quotient/descent and higher-universe adapters remain open. The reserved scheme/stack and all-positive-exponent fppf scope is unchanged.'
p['summary']+=' Framed root continuation:25 declarations(1 definition4 constructions20 lemmas),22 API references and9 distinct typed tests. All558 incoming node objects are unchanged.'
next(x for x in p['coverage']if x['stageId']==RID+':RS.0')['remaining'].append(frontier);next(x for x in p['gaps']if x['id']=='TOWER-TYPING')['detail']+=' '+frontier;next(x for x in road['stages']if x['key']=='RS.0')['description']+=' '+frontier
for n,x in [('Candidate.json',p),(RID+'.json',p),('Candidate-roadmap.json',road),('NewNodes.json',nodes),('NewTests.json',tests)]:save(n,x)
save('Plan.json',dict(newNames=[n['declarationName']for n in nodes],apiAdditions={},newNodes=[n['id']for n in nodes],newBaseline=baseline,newBaselineRefs=[x['ref']for x in baseline],frontier=frontier,newNodesCount=len(nodes),newAPI=sum(map(len,apis.values())),distinctNewAPI=len({x for a in apis.values()for x in a}),newTests=len(tests),testReferences=sum(map(len,testsets.values()))))
intro='''# Framed root coordinates and normalized charts

The new coordinate groupoid keeps the unit u of the power identification and the root coordinate y, with u*y^n=f. An actual arrow labelled by a bundled unit w has y_target=w*y_source and u_target*w^n=u_source. Both equations are retained when sections vanish. This is a coordinate carrier after a chosen frame; existence of that frame and its comparison with the native sheaf RootObject remain open.

The existing normalized affine chart embeds with u=1, its actual root image and every original roots-of-unity arrow. Native FullyFaithful data recovers all arrows between embedded chart objects, and a native Hom equivalence preserves every stabilizer. A framed object is isomorphic to an embedded chart object exactly when u has an n-th root in the test algebra unit group. For n=1 every framed object normalizes. For n=2 over Z/4, u=3,y=1,f=3 is valid framed data while the normalized chart has no root: no element has square3. This is an objectwise obstruction, prior to fppf-local normalization and stackification.

All558 incoming node objects and292 baseline objects are retained. This continuation adds25 nodes,22 API references,19 test references to9 distinct typed examples and4 native baseline references. All40 planets,ten partial stages,eight gaps,thirteen requests,both paper routes,the complete omission ledger and inherited source issue/version envelopes retain their scope. Every implementation remains unchecked. Full Tau-dependent canonical execution remains UNCOMPILED; native and bounded Mathlib evidence is reported separately.

'''+frontier+'\n\n'
parts=[intro,'Two source findings against the23February2023 author draft are recorded as E10–E11, with corrections in the5January2026 author draft. The zero-section root stack retains nilpotent sections; do not identify it with the root gerbe or assign all root-stack fibers the classifying-stack description. These findings are scoped to the two author drafts, with no publisher-version claim. The inherited nine findings and all original version receipts remain unchanged.\n\n']
for n in nodes:
 parts+=['## '+n['title']+'\n\n','**'+n['declarationName']+'** — '+n['statement']+'\n\n','Hypotheses: '+' '.join(n['hypotheses'])+'\n\n','Prerequisites: '+', '.join(n['prerequisites'])+'.\n\n','Proof: '+' '.join(n['proofSteps'])+'\n\n']
 for label,key in [('Consumed API','api'),('Typed examples','tests')]:
  if n[key]:parts+=[label+':\n\n']+['- **'+x['name']+'**: '+x['statement']+'\n'for x in n[key]]+['\n']
(S/'ReaderAddition.md').write_text(''.join(parts));(S/'Reader.md').write_text(''.join(parts)+(S/'IncomingReader.md').read_text())
assert set(re.findall(r'^(?:structure|def|lemma|theorem) ([\w.]+)',(S/'NewProofs.lean').read_text(),re.M))==set(ids)
print(json.dumps(dict(nodes=len(p['nodes']),newNodes=len(nodes),rawAPI=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),baseline=len(p['baseline']['declarations']))))
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
"""Render framed root comparison, source corrections and exact evidence limits."""
from pathlib import Path
import json,hashlib,re
S=Path(__file__).resolve().parent
text=lambda n:(S/n).read_text()
data=lambda n:json.loads(text(n))
sha=lambda b:hashlib.sha256(b).hexdigest()
def line(stem):
 r=data(stem+'.receipt.json');b=(S/(stem+'.lean')).read_bytes();assert r['exitStatus']==0
 ex=len(re.findall(r'^example\b',b.decode(),re.M))
 return f"- {stem}.lean: {len(b.splitlines())} lines, {ex} examples, exit0, {r['warnings']} warnings, {r['axiomAudits']} axiom-dependency audits plus{text(stem+'.log').count('does not depend on any axioms')} axiom-free audits; {r['availableGiBBefore']}GiB available, {r['elapsedSeconds']} seconds, peak{r['maxRssKiB']}KiB. Source SHA256 `{sha(b)}`; diagnostic SHA256 `{r['logSha256']}`.\n"
g=data('Graph.json');p=data('Candidate.json');plan=data('Plan.json');assert g['worldCommit']==text('publication-base.txt').strip()
h='''# Framed root coordinates and normalized charts — checkpoint

Codex — codex-rtOQ9t. Refs #3403. Partial; all implementations remain unchecked.

This continuation adds25 nodes: one definition, four constructions and20 lemmas. FramedRoot stores a bundled power-identification unit u and root coordinate y with u*y^n=f. Its native groupoid has actual unit-labelled arrows with both y_target=w*y_source and u_target*w^n=u_source. The actual identity, composite and inverse labels satisfy the native category and groupoid axioms. A chosen frame is a premise of the coordinate interpretation; no global frame existence is proved.

The existing normalized affine root-point action groupoid embeds by coefficient1, its actual root image and the same underlying unit on every arrow. Native Functor.FullyFaithful data explicitly recovers the roots-of-unity label from the power-identification equation. The native Hom equivalence preserves all automorphisms, identities, composites and unit labels, with actual roundtrip laws. A framed object is isomorphic to an embedded chart object exactly when its coefficient is an n-th power in the test algebra unit group. At exponent1 it always normalizes.

Over Z/4, n=2,u=3,y=1,f=3 gives valid framed data while the normalized chart has no root. Thus the chart embedding is not objectwise essentially surjective over every test algebra. Over Z/9 at f=0,n=2, the framed roots y=3 and y=0 share coefficient1 but have no arrow from the first to the second; nonzero nilpotent root sections remain even though n is invertible. Nine typed examples also consume the arbitrary chart coordinates, full Hom bijection, both arrow roundtrips, categorical inverse/composite/identity labels and the nonidentity wild stabilizer labelled minus1 over Z/4.

All558 incoming node objects and292 incoming baseline objects are unchanged. New nodes have22 API references and19 test references to9 distinct examples; four native baseline declarations are added. The framed carrier and each construction have at least three API items and three typed tests with explicit uses. All40 planets,ten partial stages,eight gaps,thirteen requests,both paper routes and the complete omission ledger retain their scope. Only the RS.0 coverage/roadmap frontier and TOWER-TYPING detail gain this local result. All nine inherited source findings and original version receipts remain byte-equivalent as JSON objects; two corrected-author-draft findings and two exact author-draft version receipts are appended.

The actual native sheaf RootObject-to-coordinate functor, existence of root-line frames and unit roots locally, fppf stackification, general root-object comparison, infinite coherent reindexing, genuine 2-limit comparison, effective fpqc quotient/descent and higher-universe adapters remain open. No orbit-set or objectwise chart limit substitutes for them. The reserved key retains scheme/stack bases, arbitrary invertible line bundles with section, every positive exponent and fppf scope. Étale/DM results keep exponent-invertibility premises. Yun–Zhang relative closed-subscheme roots, finite Kummer/DVR and geometric sheaf obligations remain.

## Reading and provenance

The whole19646-character issue was read before claim5978109879 and again after bot5978114614 confirmed that exact numeric comment; bodies were identical. All eight complete FA.0–FA.7 applicable reviewed library-coverage row objects were freshly read in bounded outputs; no PartII row exists. The whole reserved root-stack key, TOWER-TYPING gap, canonical RootObject/iso and coordinate-arrow headers, incoming ProbePrefix298 lines, incoming20 new proofs and7 tests were read. The latest RS.2 remaining tail was read, not its full historical accumulated text. Full protocols were read earlier in this continuous session with unchanged hashes verified. The entire8895-line incoming native prefix is authenticated and recompiled, not claimed manually reread in full.

Incoming peer PR6055 at head4b5d7dede5fa23065e2d6adfa58d34721bf9cff0 was recovered from public archiveb1ce1133a69ed176a54d6a1de239f86076234a0d. All68 artifacts,ten helpers andfive final public deliverables authenticated; manifest0046e8b5555403fcd1e155fa393b2f64724904d9828b41cbcad3f7ca186e7a62. Its actual recovered verifier reproduced the archived report byte-for-byte, without executing Lean. All three prefixes remain byte-for-byte in order; assembly inserts one individual native FullyFaithful import and appends the new data, proofs/tests and audits or their exact admitted projection.

Original own PR6048 head43b89b72af6f491d5f90a7f4715be3b5293b278e was freshly recovered from its actual public archiveb9518b740becd088f0e70f5e0fc2984a835b5d34. Manifestd3eea293f0318c30a15a5e82e221098fe5ce923c301d43e9fc1aa01829b0d6bd authenticates all69 original artifacts andten helpers, including OwnPreviousReading.json, OwnInheritedReadingReceipt.json and original own6036 reading. All18 external input controls are unchanged; five own deliverables changed. Original source, supplier, route, parent-reader and upstream-reader scopes are reused only at their recorded extent. OwnContractGuard.json verifies the unchanged whole13 requests, omission/source route and inherited source issue/version contracts. No peer reading is relabelled as this worker's reading.

Actual pinned native statements and ambient hypotheses were read for Units, Groupoid, FullyFaithful, its Hom equivalence and Groupoid.isoEquivHom. Native structures are reused. The three original coordinate equations motivate the new carrier; this checkpoint does not implement their geometric sheaf comparison. Exact-name library/packet scans and the touching link scan found no new specialized declaration or PartII link entry; these are bounded searches, not exhaustive absence proofs.

Fresh primary source collation is limited to Alper's author working draft23February2023, complete extracted printedp.139, and author draft5January2026, complete extracted printedpp.159–160. The complete books and rendered pages were not read; no publisher version was read. Exact PDF SHA256 values, URLs and read extents are in SourceReading.json and appended sourceVersions. The old zero-section identification with the root gerbe is corrected by the explicit later Caution in Example4.9.22; E10 records that correction and the Z/9 coordinate counterexample. E11 records the old exercise's blanket classifying-stack fiber assertion, corrected by Exercise4.9.23(f). Both are attributed to their precise author drafts and already-known later corrections, with no new erratum or published-version claim. The corrected root-stack definition motivates the framed coordinates; their native algebraic proofs are authored deductions without the exercise's exponent-invertibility restriction.

## Validation

The whole Tau-dependent Canonical.lean and final Suggested.lean remain UNCOMPILED. TauProbe.json freshly confirms exact pinned sourcef790474821cf4256814db967cb154e7af3d0c369, a different existing build head and four missing required imports. No Tau build, cache, clone, snapshot, Lake project or language server was created. Every Lean run used only the existing Mathlib build082e2d37e8b0463410cdb532e111cd43d5a66174 and Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d, serially, with immediately checked memory≥20GiB, one thread,8192MiB managed limit and1200-second timeout. Every compiler process finished.

'''+line('Native')+line('Sketch')+f'''
Native has364 examples and zero admissions/errors/warnings. All24 new non-structure declaration closures were audited; the coordinate-equation projection is axiom-free and the other closures use only propext,Classical.choice,Quot.sound. The bounded Sketch has364 examples and380 admission warnings only, with231 inherited axiom-dependency audits. All25 new declaration and9 example headers match the exact suggested projection. The framed carrier and all four constructions remain concrete;20 lemma proofs and9 example proofs are admitted in the projection. Suggested equals the entire Canonical, SHA256 `{sha((S/'Canonical.lean').read_bytes())}`. These bounded checks do not certify whole Tau-dependent canonical compilation.

The final focused Prototype separately compiled with no errors/warnings against the exact incoming298-line ProbePrefix. It contains the new data/proofs and all nine tests, with source/log/receipt retained. It does not replace either complete run.

The indexed packet checker, actual intake/file rules and source issue/version checks pass. The packet has583 nodes,296 baseline references,{sum(len(n.get('api',[]))for n in p['nodes'])} raw API entries and{sum(len(n.get('tests',[]))for n in p['nodes'])} raw test references. The publication graph has stage{g['stageDAG']['vertices']}/{g['stageDAG']['edges']}, own{g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']} and scoped{g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']} vertices/edges, all acyclic. All{g['requiredPairs']} required supplier pairs are reachable; no owned skipped/pending links. All foreign roadmap/stage objects and inherited stage-edge objects match the immutable control. The{g['otherPreexistingUnreachableRestructurePairs']} unrelated pre-existing unreachable restructure pairs are recorded without changing their ownership.

Mathematical base `{text('base.txt').strip()}`; publication base `{text('publication-base.txt').strip()}`. All23 guarded inputs and the queue issue contract are unchanged between them. Index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Both immutable verifier reports execute the actual checker,intake and atlas assembler without Lean or a repository snapshot. Actual public HTTP recovery authenticates every artifact,five final deliverables,ten exact helper fences and its own public code; both actual recovered reports must match the archived reports before opening the PR.

## Resume

Use the framed coordinate groupoid as the target of the native RootObject comparison under chosen trivializations, proving both object and actual arrow transports. Retain the unit-root obstruction over the original test algebra and construct its local normalization via frame/unit-root torsors before fppf stackification. Then compare general root-object groupoids, retain the existing actual Grpd diagram and natural algebra changes, and continue coherent infinite reindexing and genuine 2-limits. Keep nilpotent sections, automorphisms, higher-universe adapters, effective fpqc quotient/descent and all source/supplier/omission contracts explicit. No implementation or source closure is marked complete.

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
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='d3eea293f0318c30a15a5e82e221098fe5ce923c301d43e9fc1aa01829b0d6bd'
for n,o in [('OwnPreviousReading.json','Reading.json'),('OwnPreviousInputGuard.json','InputGuard.json'),('OwnPreviousCandidate.json','Candidate.json'),('OwnInheritedReadingReceipt.json','OwnInheritedReadingReceipt.json'),('OwnOriginal6036Reading.json','OwnPreviousReading.json')]:assert sha((S/n).read_bytes())==data('OwnPreviousManifest.json')[o]['sha256']
reuse=data('OwnReadingReuse.json');guards=data('OwnPreviousInputGuard.json')
assert len(guards)==23 and len(reuse['unchangedExternalControls'])==18 and len(reuse['changedOwnDeliverables'])==5
assert reuse['manifestSha256']==sha((S/'OwnPreviousManifest.json').read_bytes())
for g in guards:
 same=g['sha256']==sha(blob(MATH,g['path']))
 assert same==(g['path']in reuse['unchangedExternalControls'])
 assert (not same)==(g['path']in reuse['changedOwnDeliverables'])
claim=data('ClaimReceipt.json');assert claim['claim']==5978109879 and claim['bot']==5978114614 and claim['beforeAfterEqual']
for k in ['beforeReads','afterReads']:
 ranges=claim[k];assert ranges[0][0]==0 and ranges[-1][1]==19646 and all(a[1]==b[0]for a,b in zip(ranges,ranges[1:]))
p=data('Candidate.json');old=data('Incoming.json');road=data('Candidate-roadmap.json');oldroad=data('Incoming-roadmap.json');plan=data('Plan.json')
assert len(old['nodes'])==558 and len(p['nodes'])==583 and p['nodes'][558:]==data('NewNodes.json')
unchanged=0
for a,b in zip(old['nodes'],p['nodes']):
 expected=json.loads(json.dumps(a))
 if a['id']in plan['apiAdditions']:expected['api']+=plan['apiAdditions'][a['id']]
 else:unchanged+=1
 assert b==expected,a['id']
assert unchanged==558 and set(p)==set(old)and plan['apiAdditions']=={}and p['nodes'][:558]==old['nodes']
for k in old:
 if k not in ['nodes','summary','sources','baseline','coverage','gaps','sourceIssues','sourceVersions']:assert p[k]==old[k],k
assert p['sourceIssues']==old['sourceIssues']+data('NewSourceIssues.json')and len(data('NewSourceIssues.json'))==2
assert p['sourceVersions']==old['sourceVersions']+data('NewSourceVersions.json')and len(data('NewSourceVersions.json'))==2
assert [x['sha256']for x in data('SourceReading.json')]==[x['sha256']for x in data('NewSourceVersions.json')]
assert p['sources'][:-1]==old['sources']and p['summary'].startswith(old['summary'])
assert {k:v for k,v in p['baseline'].items()if k!='declarations'}=={k:v for k,v in old['baseline'].items()if k!='declarations'}
assert p['baseline']['declarations'][:292]==old['baseline']['declarations']
assert [d['ref']for d in p['baseline']['declarations'][292:]]==plan['newBaselineRefs']and len(plan['newBaselineRefs'])==4
assert p['status']=='partial'and all(n['implementationStatus']=='unchecked'for n in p['nodes'])
assert len(p['requests'])==13 and len(p['gaps'])==8 and len(p['coverage'])==10
for a,b in zip(old['coverage'],p['coverage']):
 if a['stageId']==RID+':RS.0':assert b['remaining'][:-1]==a['remaining']and {k:v for k,v in a.items()if k!='remaining'}=={k:v for k,v in b.items()if k!='remaining'}
 else:assert a==b
for a,b in zip(old['gaps'],p['gaps']):
 if a['id']=='TOWER-TYPING':assert b['detail'].startswith(a['detail'])and {k:v for k,v in a.items()if k!='detail'}=={k:v for k,v in b.items()if k!='detail'}
 else:assert a==b
assert {k:v for k,v in road.items()if k!='stages'}=={k:v for k,v in oldroad.items()if k!='stages'}
for a,b in zip(oldroad['stages'],road['stages']):
 if a['key']=='RS.0':assert b['description']==a['description']+' '+plan['frontier']and {k:v for k,v in a.items()if k!='description'}=={k:v for k,v in b.items()if k!='description'}
 else:assert a==b
assert data('PreviousRecovery.json')['head']=='4b5d7dede5fa23065e2d6adfa58d34721bf9cff0'
assert data('PreviousRecovery.json')['artifactsVerified']==68
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
assert sha((S/'IncomingManifest.json').read_bytes())=='0046e8b5555403fcd1e155fa393b2f64724904d9828b41cbcad3f7ca186e7a62'
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
 for m in re.finditer(r'^(structure|def|lemma|theorem|example)\b(?: ([\w.]+))?',text,re.M):
  depth=0;end=None
  for i in range(m.start(),len(text)):
   c=text[i]
   if c in '([{⟨':depth+=1
   elif c in ')]}⟩':depth-=1
   line=text[m.start():i].rsplit('\n',1)[-1]
   let_assignment=re.match(r'\s*(?:example\s*:\s*)?let\b',line)and ':='not in line
   if depth==0 and text.startswith(':=',i)and not let_assignment:end=i;break
   if depth==0 and m.group(1)in {'def','structure'}and text.startswith('where',i)and text[i-1].isspace()and text[i+5].isspace():end=i;break
  assert end is not None
  label=m.group(2)if m.group(1)!='example'else'example#'+str(sum(x.startswith('example#')for x in found))
  assert label not in found;found[label]=' '.join(text[m.start():end].split())
 return found
nh=headers(txt('NewProofs.lean'));nt=headers(txt('NewTests.lean'));ch=headers(txt('NewAdmitted.lean'));assert {**nh,**nt}==ch
assert all(not re.search(r'\b(?:sorry|admit|axiom)\b',h)for h in ch.values())
assert len(nh)==25 and len(nt)==9
assert set(plan['newNames'])=={NS+n for n in nh}=={n['declarationName']for n in p['nodes'][558:]}
assert {t['name']for t in data('NewTests.json')}=={NS+n for n in re.findall(r'^-- test: (.+)$',txt('NewTests.lean'),re.M)}
for n in p['nodes'][558:]:
 if n['kind']in {'construction','definition'}:assert len(n['api'])>=3 and len(n['tests'])>=3 and n['uses']
 assert n['declarationName']in txt('Reader.md')and n['statement']in txt('Reader.md')
 for x in n['api']+n['tests']:assert x['name']in txt('Reader.md')and x['statement']in txt('Reader.md')
assert sum(len(n['api'])for n in p['nodes'][558:])+sum(map(len,plan['apiAdditions'].values()))==22 and sum(len(n['tests'])for n in p['nodes'][558:])==19
compilation={}
for name,want,audits in [('Native',0,484),('Sketch',380,231)]:
 rec=data(name+'.receipt.json');log=txt(name+'.log')
 assert rec['exitStatus']==0 and rec['availableGiBBefore']>=20
 assert rec['sourceSha256']==sha((S/(name+'.lean')).read_bytes())and rec['logSha256']==sha(log.encode())
 assert ': error'not in log and log.count('warning:')==log.count('warning: declaration uses `sorry`')==want,(name,log.count('warning:'))
 ex=len(re.findall(r'^example\b',txt(name+'.lean'),re.M));assert ex==364,(name,ex)
 a=re.findall(r'depends on axioms:\s*\[([^]]*)\]',log);assert len(a)==audits,(name,len(a))
 assert 'sorryAx'not in log and all(set(v.strip()for v in x.replace('\n',' ').split(','))<={'propext','Classical.choice','Quot.sound'}for x in a)
 compilation[name]={**rec,'lines':len(txt(name+'.lean').splitlines()),'examples':ex,'axiomFreeAudits':log.count('does not depend on any axioms')}
audited=set(re.findall(r"'([^']+)' (?:depends on axioms:|does not depend on any axioms)",txt('Native.log')))
assert set(plan['newNames'])-{NS+'FramedRoot'}<=audited
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
problems=[x for f in paths for x in env['file_problems'](f,contents[f])];refusals=env['auto_refusals'](job,paths,False,{'codex-rtOQ9t'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'ROOTS_VALIDATE_BASE':BASE}));assert graph['worldCommit']==BASE
if BASE==txt('publication-base.txt').strip():assert graph==data('Graph.json')
print(json.dumps(dict(checker=summary,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,wholeIncomingNodesUnchanged=558,incomingMathematicalContractsPreserved=558,newNodes=25,newAPIItems=22,newTests=9,newTestReferences=19,newSourceFindings=2,inheritedSourceFindingsUnchanged=len(old['sourceIssues']),matchedNewHeaders=len(ch),rawAPIItems=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),compilation=compilation,canonicalExecution='UNCOMPILED: no existing full Tau Ceti build at the exact pin; entire canonical prefix retained.',inputGuards=len(data('InputGuard.json')),indexSha256=sha(Path(sys.argv[2]).read_bytes()),immutableBase=BASE,graph=graph,LeanExecuted=False),indent=2))
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
ClaimReceipt.json Reading.json SourceReading.json BaselineReading.json OwnReadingReuse.json OwnContractGuard.json OwnPreviousReading.json OwnPreviousInputGuard.json OwnPreviousManifest.json OwnPreviousCandidate.json OwnInheritedReadingReceipt.json OwnOriginal6036Reading.json OwnPreviousRecovery.json NewSourceIssues.json NewSourceVersions.json LibrarySearch.json TauProbe.json
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
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED FRAMED ROOT COORDINATE PAYLOAD\n'+pb+b'END ARCHIVED FRAMED ROOT COORDINATE PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('roadmaps','Candidate-roadmap.json'),('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated framed root coordinate evidence; never executes Lean."""
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
pb=raw.split('/- BEGIN ARCHIVED FRAMED ROOT COORDINATE PAYLOAD\\n',1)[1].split('END ARCHIVED FRAMED ROOT COORDINATE PAYLOAD -/',1)[0].encode()
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

Archive commit `856e94d366950d1b98dcd0b1cc750ce4ef058c34` is an ancestor changing only this issue's suggested file. Its 74 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `dbc0b2ddc5a28be6f5bdb1c7d64bf0ba8380b2ccb775d0f84a0f76c7ac54d2b9`; payload SHA256 `f39fde0d0dd8dc4ec92469a9ad651fb013dc99c1fddedfd2b7b0765f4dd7c243`. The final suggested file has no archive payload and equals the entire Tau-dependent Canonical.lean, which remains UNCOMPILED.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set ROOTS_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Sketch.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean and Suggested.lean are byte-equal, but neither whole file was compiled: no existing complete Tau build at the pin is available. The two bounded Mathlib checks certify only their recorded import cones. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

```python
"""Recover public authenticated framed root coordinate evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='FunctionFieldArithmeticPartII'
ARCHIVE='856e94d366950d1b98dcd0b1cc750ce4ef058c34'
MANIFEST_SHA='dbc0b2ddc5a28be6f5bdb1c7d64bf0ba8380b2ccb775d0f84a0f76c7ac54d2b9'
PAYLOAD_SHA='f39fde0d0dd8dc4ec92469a9ad651fb013dc99c1fddedfd2b7b0765f4dd7c243'
EXPECTED={'roadmaps': '720d1176ff1a4c659a9db1e33d06870aa5ff8f86972ef2e051414f21ae3b42c0', 'packets': '994becbc13f453732001e620640a54a170f5a1868337c02f929cd259935695f2', 'readmes': 'ea02cf3797f81df5d4a4b23fb94b57cd96573366b0ed45e4e10f9b51c92cc64b', 'suggested': '35899f42ce344316457f3ab3fd6efd8646c5801616d417854b0fec65c879b90a'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED FRAMED ROOT COORDINATE PAYLOAD\n',1)[1].split('END ARCHIVED FRAMED ROOT COORDINATE PAYLOAD -/',1)[0].encode()
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
