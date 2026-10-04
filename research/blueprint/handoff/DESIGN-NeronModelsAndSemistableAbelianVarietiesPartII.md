# The actual conductor additive sheaf short exact sequence — checkpoint

Agent: Codex — codex-rtOQ9t. Refs #3378. The design remains partial; every implementation remains unchecked.

For every finite schematically dominant f:Y→P, let I be its actual conductor ideal datum and J=I.comap f. The preceding ring-sheaf pullback becomes a native additive-sheaf pullback through the existing CommRingCat→RingCat→AddCommGrpCat functors: whiskering preserves limits and the sheaf inclusion reflects them. Specialize Mathlib's native short complex of this square. Its first arrow is the actual structure-map biproduct lift; its last arrow is the actual conductor inclusion minus chart map. Both coordinate equations, both signed injection equations and their actual section formulas are proved.

The native pullback/kernel interfaces prove monomorphy and Exactness. On an affine target open, the source inverse image is affine because f is finite. The actual closed-conductor inclusion is surjective on sections there, and the first native biproduct injection gives a lift under the actual last map. Every point of any open has a smaller affine neighborhood inside it, so these lifts prove local surjectivity. Mathlib's native local-surjectivity criterion gives sheaf epimorphy. The specified short complex is therefore natively ShortExact. No reducedness, Noetherianity, birationality or global affineness is imposed. No last-map surjectivity on sections of every nonaffine open is claimed.

Fifteen new declarations (one construction, fourteen lemmas), thirteen distinct API entries and six typed tests are appended. All642 incoming node objects and441 baseline entries remain whole; 16 freshly inspected existing native interfaces extend the baseline inventory to457. All29 planets,78 routes,18 gaps,23 requests,23 source findings and seven partial stages remain. The reserved ferrand-pushouts key and the scheme/algebraic-space existence and small-étale-site boundaries are preserved. No general sheaf, abelian category, forgetful functor or short-complex carrier is replanned.

The tests cover both unit signs, the empty open, an actual structure-section pair, actual affine lifting, the kernel universal property against any native additive sheaf, and the nonzero square-zero section2 of Spec(Z/4) surviving the actual first sheaf map. The last test detects reduction of the structure ring. No concrete nonaffine failure of section surjectivity is exhibited; the arbitrary-open statements are local surjectivity and the inherited middle exactness.

## Reading and ownership

The whole18717-character issue was read before claim5975914966 and again after exact numeric bot5975915858 confirmed this session. The two complete reading ranges and identical body hash are in ClaimReceipt.json. Own6030 explicitly scoped protocol, reviewed R11.1–R11.6 and172-line REV-AUDIT-10, upstream and key readings are reused only at unchanged hashes. OwnPreviousReadingGuard.json records23 unchanged controls and6 changed inputs against that own checkpoint; hash agreement is not described as a fresh full reading. Current G.0 frontier, the global-geometric conductor contract, reserved key whole node/API/tests, conductor-touching requests and final two gaps were freshly inspected. Other historical stages and all642 old nodes were not freshly exhaustively audited. Reading.json records exact bounds and distinct own/peer attribution.

Incoming peer PR6039 at head1e9b8115fd273eee7034e4e6dfb68f1a83dc3b47 was actually recovered over public HTTP:61 artifacts,10 helpers and five final files authenticated. Its actual immutable verifier was executed and its report reproduced byte-for-byte. All17 new incoming declarations,9 typed tests, complete handoff and actual helper code were personally inspected, along with the consumed actual affine signed-difference and conductor chart scopes. IncomingManifest.json binds all three preserved Lean prefixes. Own6030 at head7dff2be408a27559747f538d9b3e334c32c8c8fc was also publicly recovered; its manifest binds the reused own Reading, InputGuard and SupplierReading. Peer reading is preserved as attribution, not adopted as this worker's reading.

The complete current displayed statement and proof of Stacks37.14.1(tag0ET0) were freshly read as structure-sheaf context. SourceReading.json records the exact HTTP hash and access time without retaining HTML. The broader additive finite-conductor sequence is an authored deduction from the preceding native proof and pinned interfaces. All23 source findings and their source-version scopes remain inherited. verify.py independently enumerates the32-element commutative F₂ block-matrix algebra and1024 products supporting the still-open matrix-image dimension justification. No new finding, full-paper or exhaustive correction audit, or recursive source closure is claimed.

SF.0 retains its generic quotient-presheaf, sheafification and finite-module flat-annihilator work. Own6040 supplied the current all-open quotient/sheafification interface in this continuous session; own551 publication reading inspected the complete current SF.0 frontier and conductor requests at the identical905a control. This continuation constructs only the actual conductor sequence. Coherent H0/H1 and genus require their existing supplier interfaces. Quotient topology, the geometric/categorical Scheme pushout, recomputed flat conductors, P¹/Proj, properness/projectivity, the separate I₂ model and later classification work remain required.

## Validation and limits

Native.lean preserves the complete authenticated proof prefix and adds all fifteen actual proof bodies, six typed tests and fifteen axiom audits. It compiles with no errors, warnings or admissions; all530 audits allow only propext, Classical.choice and Quot.sound. Sketch.lean preserves the complete authenticated Mathlib projection and adds exact new admitted headers and tests. It compiles with737 admission warnings only and20 inherited non-admission axiom audits. All fifteen new declaration headers and six example headers match their admitted projections exactly. The actual short-complex data body is retained.

Eight required individual Mathlib imports are inserted into the full suggested file ahead of its existing imports; every byte of the historical prefix remains in order. ImportAddition.lean records the exact insertion. The full Tau-importing canonical suggested file remains UNCOMPILED. A fresh probe again found the available Tau build at cf386627e9176a3827c1a5fe804989fd94a4d216, rather than required f790474821cf4256814db967cb154e7af3d0c369, and all five direct Tau import artifacts absent. TauBuildScope.json records this. No library build, project setup, cache download or language server was used. The two final Lean checks were serial, immediately memory-checked, capped at8GiB and1200seconds, at the exact Mathlib pin and compiler.

- Native.lean: 7849 lines, 275 examples, 0 warnings, 530 axiom audits, exit0; source SHA256 `8a628fb5f6c78c9262ad2a684218ae68deb48379f83b29672e3765e2f6df6563`, diagnostic SHA256 `48b42688033fab3468926de9f415bf59e434904a52220479ccb28b3eba213c70`. Serial run: 51GiB available beforehand, 114.82s, 7289228KiB maximum RSS.
- Sketch.lean: 5034 lines, 294 examples, 737 warnings, 20 axiom audits, exit0; source SHA256 `9091ed0bb9d5b30d2513ff81f747eb0bab51e7cbfc77707a463004ddf0bd96d4`, diagnostic SHA256 `104d400d341fb431514d10e65fffbd6c022e6590bf093f8d3a5d02a9e5ae2848`. Serial run: 51GiB available beforehand, 81.6s, 7104428KiB maximum RSS.

Suggested.lean equals Canonical.lean exactly, SHA256 `a032beddc78f5174108816530974bd2236fdf796b48dd5f043b76e90ce3c8ee8`. The bounded Mathlib checks do not certify that full Tau-importing file or the remaining geometric obligations.

The actual indexed packet checker reports657 nodes,403 API entries,334 recognized tests,457 baseline declarations,29 planets,18 gaps and23 requests, with zero errors/warnings. There are384 raw test objects. Actual immutable checker, intake file/authorization, source-issue/source-version validation and atlas assembly pass at mathematical base `905a15480b7f1136ec23ef2e88cea56347715bb4` and publication control `e8b4f9d8eec8122153e6cddecada0604e6b284f1`. Verification-mathematical.json and Verification.json contain the reproducible reports. All29 guarded inputs and the non-state queue contract agree between these controls; PublicationChanges.json records the empty change set.

The publication graph has stage3043/8727, own657/1576 and scoped3671/11148 vertices/edges, all acyclic. All69 required supplier paths are reachable. Owned dependencies resolve without skipped or pending links. Whole foreign roadmap/stage objects and the complete stage-edge vector match each corresponding control. The45 unrelated preexisting missing restructure paths remain unchanged.

## Resume

Use conductorAdditiveShortComplex_shortExact, its actual projection/signed component identities, affine component lifts and local-surjectivity theorem. Supply the coherent cohomology and genus interfaces through their owners rather than treating an arbitrary-open section map as surjective. The next conductor geometry work is the actual quotient topology and Scheme pushout universal property, then recomputed flat-conductor integration with the existing SF.0 annihilator supplier. Retain nilpotents, zero rings, empty schemes, all inherited source findings and all separate I₂ and model/classification obligations.

## Exact helper code

The following ten fences reproduce the archived helper files byte-for-byte. Inspect them before replay; the public recovery script also verifies these equalities and the immutable verifier verifies the archive and mathematical prefix.

## Helper: assemble.py

```python
"""Keep every authenticated incoming declaration; append exact new projections."""
from pathlib import Path
import re
from projection import admit_lemmas
S=Path(__file__).resolve().parent
def text(n):return (S/n).read_text()
def put(n,t):(S/n).write_text(t)
proofs=text('NewProofs.lean');tests=text('NewTests.lean')
put('NewAdmitted.lean',admit_lemmas(proofs));put('TestsAdmitted.lean',admit_lemmas(tests))
put('CanonicalAddition.lean',text('NewAdmitted.lean')+'\n'+text('TestsAdmitted.lean'))
prefix=text('CanonicalPrefix.lean');i=re.search(r'^import ',prefix,re.M).start()
canonical=prefix[:i]+text('ImportAddition.lean')+prefix[i:]+'\n'+text('CanonicalAddition.lean')
put('Canonical.lean',canonical)
put('Suggested.lean',text('Canonical.lean'))
put('Native.lean',text('NativePrefix.lean')+'\n'+proofs+'\n'+tests+'\n'+text('Audits.lean'))
put('Sketch.lean',text('SketchPrefix.lean')+'\n'+text('NewAdmitted.lean')+'\n'+text('TestsAdmitted.lean'))
```

## Helper: author.py

```python
"""Append the actual conductor additive sheaf short complex; retain every incoming object."""
from pathlib import Path
import copy,json,re
S=Path(__file__).resolve().parent
RID='NeronModelsAndSemistableAbelianVarietiesPartII';P=RID+':G.0/';NS='TauCeti.GenusOne.FerrandPushout.'
def load(n):return json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
def dep(x):return x if ':' in x else P+x
specs=[
('conductor-additive-sheaf-pullback','conductor_additive_isPullback','The conductor square after forgetting multiplication',
 'For every finite schematically dominant f:Y→P, apply the existing sheaf-composition functor for CommRingCat→RingCat→AddCommGrpCat to the actual conductor structure-sheaf square. The resulting square of native additive sheaves on P is a pullback, with the two specified structure maps and the actual conductor inclusion and chart maps.',
 ['conductor-sheaf-pullback','mathlib:CategoryTheory.sheafCompose','mathlib:CategoryTheory.Functor.whiskeringRight','mathlib:CategoryTheory.whiskeringRightPreservesLimits','mathlib:CategoryTheory.Sheaf.createsLimits','mathlib:CategoryTheory.sheafToPresheaf','mathlib:CommRingCat.forget₂Ring_preservesLimits','mathlib:RingCat.forget₂AddCommGroup_preservesLimits','mathlib:CategoryTheory.IsPullback.of_map_of_faithful','mathlib:CategoryTheory.Functor.map_isPullback'],
 'Inclusion into presheaves preserves and reflects limits. Whiskering with the existing two-step forgetful functor preserves limits. Map the ring-sheaf pullback into additive presheaves and reflect it through the additive sheaf inclusion. No new generic sheaf or forgetful carrier is introduced.'),
('conductor-additive-short-complex','conductorAdditiveShortComplex','The actual conductor additive sheaf short complex',
 'Construct the native ShortComplex in additive sheaves on P with objects O_P,+, f_*O_Y,+ ⊞ I.ι_*O_I,+, and f_*J.ι_*O_J,+, where I is the actual conductor ideal datum and J=I.comap f. Its first map is the biproduct lift of the actual structure maps; its second map is the biproduct desc of the actual source inclusion and the negative of the actual chart map. The native zero-composite equation uses the actual conductor square.',
 ['conductor-additive-sheaf-pullback','mathlib:CategoryTheory.CommSq.shortComplex\'','mathlib:CategoryTheory.sheafIsAbelian'],
 'Specialize the existing native CommSq.shortComplex′ to the proved additive conductor pullback. All three objects and both arrows are determined by the actual sheaves and maps; do not add an ad hoc complex with assumed exactness.'),
('conductor-additive-first-projection','conductorAdditiveShortComplex_f_fst','First coordinate of the additive structure map',
 'The first map of conductorAdditiveShortComplex followed by the first native biproduct projection is exactly f.c after forgetting multiplication.',
 ['conductor-additive-short-complex'],'Use the native biproduct lift first-projection identity.'),
('conductor-additive-second-projection','conductorAdditiveShortComplex_f_snd','Second coordinate of the additive structure map',
 'The first map followed by the second native biproduct projection is exactly I.ι.c after forgetting multiplication.',
 ['conductor-additive-short-complex'],'Use the native biproduct lift second-projection identity.'),
('conductor-additive-first-injection','conductorAdditiveShortComplex_inl_g','The source summand maps by the actual inclusion',
 'The first native biproduct injection followed by the last map equals the actual conductorSheafInclusion after forgetting multiplication.',
 ['conductor-additive-short-complex'],'Use the native first-injection/desc identity.'),
('conductor-additive-second-injection','conductorAdditiveShortComplex_inr_g','The chart summand has the negative sign',
 'The second native biproduct injection followed by the last map equals the negative of the actual conductorSheafChart after forgetting multiplication.',
 ['conductor-additive-short-complex'],'Use the native second-injection/desc identity, retaining its negative chart map.'),
('conductor-additive-first-injection-sections','conductorAdditiveShortComplex_inl_g_app','Evaluate the inclusion on actual sections',
 'On every open U⊂P and every b∈Γ(Y,f⁻¹U), applying the actual last sheaf map to the first injected section gives J.ι.app(f⁻¹U)(b).',
 ['conductor-additive-first-injection','conductor-sheaf-inclusion-component'],'Evaluate the sheaf-morphism identity at U and then at b.'),
('conductor-additive-second-injection-sections','conductorAdditiveShortComplex_inr_g_app','Evaluate the negative chart component',
 'On every open U⊂P and every c∈Γ(I,I.ι⁻¹U), applying the actual last sheaf map to the second injected section gives −conductorChartMap(f,U)(c).',
 ['conductor-additive-second-injection','conductor-sheaf-chart-component'],'Evaluate the sheaf-morphism identity and the native additive negation at U and c.'),
('conductor-additive-pair-sections','conductorAdditiveShortComplex_pair_app','The actual sheaf differential is the signed section difference',
 'On every open U, the last sheaf map sends inl(b)+inr(c) to the preceding actual conductorSectionDifference(f,U)(b,c). Both rings, restrictions and the subtraction sign are unchanged.',
 ['conductor-additive-first-injection-sections','conductor-additive-second-injection-sections','conductor-section-difference-evaluation'],
 'Add the two evaluated component identities, then use the existing signed section-difference formula.'),
('conductor-additive-monomorphism','conductorAdditiveShortComplex_mono','The first additive sheaf map is monic',
 'The first morphism of the actual conductorAdditiveShortComplex is a monomorphism in native additive sheaves on P.',
 ['conductor-additive-short-complex','conductor-additive-sheaf-pullback','mathlib:CategoryTheory.IsPullback.mono_shortComplex\'_f'],
 'Apply the existing native pullback-kernel monomorphism theorem to the actual additive square.'),
('conductor-additive-middle-exact','conductorAdditiveShortComplex_exact','Exactness in the native abelian sheaf category',
 'The actual conductorAdditiveShortComplex is Exact in the native abelian category of additive sheaves on P. The actual structure map is the kernel of the specified signed difference.',
 ['conductor-additive-short-complex','conductor-additive-sheaf-pullback','mathlib:CategoryTheory.IsPullback.exact_shortComplex\''],
 'Apply the existing native exactness theorem for the short complex of a pullback, through its genuine limiting kernel fork.'),
('conductor-additive-affine-surjective','conductorAdditiveShortComplex_affine_surjective','Lift actual conductor sections on affine opens',
 'For every affine open U⊂P, the component on U of the last actual sheaf map is surjective as an additive group homomorphism. A target section lifts along the actual closed inclusion J.ι on the affine inverse image f⁻¹U, and the first native biproduct injection supplies its middle-term lift.',
 ['conductor-additive-first-injection-sections','mathlib:AlgebraicGeometry.Scheme.IdealSheafData.subschemeι_app_surjective','mathlib:AlgebraicGeometry.IsAffineOpen.preimage'],
 'Finite f is affine, so f⁻¹U is affine. Use the existing closed-subscheme restriction surjectivity there and the proved actual inclusion-component equation. No last-map surjectivity on arbitrary opens is inferred.'),
('conductor-additive-local-surjective','conductorAdditiveShortComplex_locally_surjective','The signed conductor sheaf map is locally surjective',
 'The actual last map is locally surjective: for every target section on any open U and each x∈U, choose an affine open V⊆U containing x; the restricted section has an actual middle-term lift on V.',
 ['conductor-additive-affine-surjective','mathlib:AlgebraicGeometry.Scheme.isBasis_affineOpens','mathlib:TopologicalSpace.IsTopologicalBasis.exists_subset_of_mem_open','mathlib:TopCat.Presheaf.isLocallySurjective_iff'],
 'Use the affine-open basis to choose V around x inside U, then apply actual affine component surjectivity to the restricted section. Apply the native local-surjectivity criterion with the prescribed restriction.'),
('conductor-additive-epimorphism','conductorAdditiveShortComplex_epi','The signed conductor differential is an epimorphism of sheaves',
 'The last morphism of conductorAdditiveShortComplex is an epimorphism in additive sheaves on P. This is sheaf epimorphy obtained from local lifts, not surjectivity on sections of every nonaffine open.',
 ['conductor-additive-local-surjective','mathlib:TopCat.Sheaf.isLocallySurjective_iff_epi'],
 'Use the existing equivalence between local surjectivity and epimorphy in the native additive sheaf category, with its existing sheafification and abelian structure.'),
('conductor-additive-short-exact','conductorAdditiveShortComplex_shortExact','The conductor additive sheaf sequence is short exact',
 'For every finite schematically dominant f:Y→P, the specified native conductorAdditiveShortComplex is ShortExact: 0→O_P,+→f_*O_Y,+⊞I.ι_*O_I,+→f_*J.ι_*O_J,+→0. No reducedness, Noetherianity, birationality or global affineness is required.',
 ['conductor-additive-monomorphism','conductor-additive-middle-exact','conductor-additive-epimorphism','mathlib:CategoryTheory.ShortComplex.ShortExact.mk\''],
 'Package the independently established native mono, Exact and epi facts using ShortComplex.ShortExact.mk′. This does not prove quotient topology, the Scheme pushout universal property, or coherent cohomology.')]
tests=[
 dict(name='ConductorAdditiveChecked.signed_units',kind='computation',statement='For every open, the actual last map sends the injected pair (1,0) to 1 and (0,1) to −1 in the actual source-conductor section ring.'),
 dict(name='ConductorAdditiveChecked.empty_open',kind='degenerate',statement='On the empty target open the actual last map sends every native middle-term section to zero; the native zero section ring is retained.'),
 dict(name='ConductorAdditiveChecked.actual_section_pair',kind='compatibility',statement='For every open and every section a of O_P, the actual last map kills inl(f.app(a))+inr(I.ι.app(a)).'),
 dict(name='ConductorAdditiveChecked.affine_lift',kind='compatibility',statement='For every affine open and actual target section, a section of the native sheaf biproduct maps to it under the actual last morphism.'),
 dict(name='ConductorAdditiveChecked.kernel_universal_property',kind='characterisation',statement='For any native additive sheaf F on P and any morphism F→the native middle sheaf killed by the actual last map, there is a unique morphism F→O_P,+ whose composite with the actual first map is the given morphism.'),
 dict(name='ConductorAdditiveChecked.nonreduced_identity',kind='non-example',statement='For the identity of Spec(Z/4), the global section corresponding to 2 is nonzero and square-zero, and its image under the actual first additive sheaf map remains nonzero. Reducing the structure ring loses this test.')]
old=load('Incoming.json');p=copy.deepcopy(old);sourceId='conductor-additive-rtOQ9t-0ET0'
source=[dict(sourceId=sourceId,locator='Stacks37.14.1 complete displayed statement and proof; authored additive finite-conductor deduction',excerpt='sheaves of rings',match='Context for the actual structure-sheaf pullback. This short-exact additive sequence is an authored consequence of the preceding general finite-conductor pullback, actual closed-inclusion surjectivity on affine opens, and pinned native abelian/sheaf APIs. No source claim of arbitrary-open section surjectivity is made.')]
nodes=[dict(id=P+slug,parentStageId=RID+':G.0',realises=[RID+':G.0'],kind='construction'if name=='conductorAdditiveShortComplex'else'lemma',title=title,declarationName=NS+name,statement=statement,hypotheses=['Finite and schematically dominant f:Y→P; I=conductorIdealSheaf f and J=I.comap f. Opens arbitrary except where explicitly affine. Actual native sheaves, maps and biproduct throughout.'],prerequisites=[dep(x)for x in deps],proofSteps=[proof],acceptance=[statement,'No generic sheaf or short-complex carrier is replanned. Last-map component surjectivity is only asserted on affine opens; all arbitrary opens have local lifts and the inherited middle exactness.'],library=dict(module='TauCeti/AlgebraicGeometry/GenusOne/G0',namespace=NS[:-1]),sources=source,implementationStatus='unchecked')for slug,name,title,statement,deps,proof in specs]
api=[dict(name=n['declarationName'],role='compatibility',statement=n['statement'])for n in nodes if n['declarationName']not in [NS+'conductor_additive_isPullback',NS+'conductorAdditiveShortComplex']]
next(n for n in nodes if n['kind']=='construction').update(api=api,tests=tests,uses=[dict(where=P+'conductor-scheme-geometric',how='Record the additive kernel and local epimorphism attached to the actual conductor sheaf comparison while the separate quotient-topology and Scheme universal-property arguments remain.'),dict(where=RID+':G.1/quadratic-pinch-i1-genus',how='Supply the genuine native short exact sheaf sequence for the separately required coherent H0/H1 and genus comparison; the cohomology interfaces remain at their owners.')])
have={x['ref']for x in p['baseline']['declarations']};baseline=[dict(ref='mathlib:'+x['name'],kind=x['kind'],module=x['file'],line=x['line'],provides=x['signature']+' Existing native infrastructure, read at the exact pinned commit; no second generic carrier.',checked='Codex — codex-rtOQ9t freshly read the complete native statement, ambient hypotheses and relevant proof on2026-10-04 at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174.')for x in load('BaselineReading.json')if'mathlib:'+x['name']not in have]
p['nodes']+=nodes;p['baseline']['declarations']+=baseline
s=load('SourceReading.json')[0];ss=dict(id=sourceId,title='Conductor additive sheaf sequence, context in Stacks37.14.1',authors='The Stacks Project authors; additive finite-conductor deduction by Codex — codex-rtOQ9t',edition='Online version read4October2026',url=s['url'],sha256=s['sha256'],accessed=s['accessed'],readSections=[s['readScope']]);p['sources'].append(ss)
frontier='The actual general finite schematically dominant conductor square now supplies a native additive sheaf ShortComplex and ShortExact theorem. The first arrow is the actual structure-map biproduct lift; the second is the actual inclusion minus chart map. Projection, signed injection and section-pair identities are retained. Native pullback/kernel APIs prove mono and middle exactness; affine closed-inclusion lifts and the affine-open basis prove local surjectivity and native sheaf epimorphy. No last-map section surjectivity on nonaffine opens is claimed. Quotient topology, geometric/categorical Scheme pushout, recomputed flat-conductor integration, P¹/Proj, properness/projectivity, coherent H0/H1 and genus, separate I₂ and later model/classification work remain required. All18 gaps,23 requests,23 source findings and seven partial stages remain; every implementation is unchecked and the full Tau-importing suggested file remains UNCOMPILED.'
p['summary']+=' Additive conductor sheaf continuation:15 new declarations(1construction14lemmas),13 API entries and6 typed tests. The specified actual sequence is natively ShortExact, with epimorphy proved by local affine lifts.'
for row in p['coverage']:
 if row['stageId']==RID+':G.0':row['remaining'].append(frontier)
rd=load('Incoming-roadmap.json');rd['stages'][0]['description']+=' '+frontier
save('Candidate.json',p);save(RID+'.json',p);save('Candidate-roadmap.json',rd);save('NewNodes.json',nodes)
save('Plan.json',dict(newNodes=[n['id']for n in nodes],newNames=[n['declarationName']for n in nodes],changedExisting={},newBaseline=baseline,newApi=api,newTests=tests,newSources=[ss],newSourceIssues=[],newGaps=[],frontier=frontier))
intro='''# The actual conductor additive sheaf sequence

Let f:Y→P be finite and schematically dominant, I its actual conductor ideal datum and J=I.comap f. The preceding actual pullback of structure sheaves becomes a pullback of additive sheaves by the existing CommRingCat→RingCat→AddCommGrpCat forgetful functors. Inclusion of sheaves into presheaves creates limits, and whiskering with the existing forgetful functors preserves them. The additive pullback is therefore reflected from presheaves. No general forgetful functor, sheaf carrier or complex is newly planned.

Specialize Mathlib's native short complex of a pullback square. Its first map into the actual sheaf biproduct has the two native structure maps as coordinates. Its second map is the actual conductor inclusion minus the actual chart map. The signed section formula agrees with the preceding conductorSectionDifference on every open. Native pullback/kernel results provide monomorphy and Exactness in the actual abelian category of additive sheaves.

For an affine target open U, finiteness makes f⁻¹U affine. The native closed-conductor inclusion is surjective on sections there, so the first biproduct injection lifts every actual target section. For a section on an arbitrary open and a point of that open, choose a smaller affine neighborhood and lift its restriction. Mathlib's native criterion turns these local lifts into an epimorphism of sheaves. Thus the actual short complex is ShortExact. This is a statement about sheaves; surjectivity of sections on every nonaffine open does not follow and is not claimed.

Six typed tests check both unit signs, the empty target open, annihilation of an actual structure-section pair, lifting on affine opens, the kernel universal property against any additive sheaf, and the nonzero square-zero section2 of Spec(Z/4) surviving the actual first additive map. These test the prescribed carriers and maps, rather than an independently assumed exact sequence. No concrete nonaffine failure of section surjectivity is supplied.

The complete current Stacks37.14.1 statement and proof were freshly read as context for the structure-sheaf pullback. The general finite-conductor additive sequence is an authored deduction using the preceding native proof and the pinned categorical interfaces. All642 incoming node objects,29 planets,78 routes,18 gaps,23 requests and23 source findings remain whole. Their historical source attribution is inherited; no new finding or fresh exhaustive source audit is claimed. The independent F₂ matrix-image counterexample remains reproducible in the verifier.

The reserved ferrand-pushouts node and supplier boundaries remain whole. In particular quotient topology and the Scheme universal property remain separate, algebraic spaces still require the small étale structure sheaf, and coherent H0/H1 must use the existing supplier interfaces. Earlier frontiers below are historical; this opening section records the new short-exact sheaf result.

'''+frontier+'\n\n'
parts=[intro]
for n in nodes:parts+=['## '+n['title']+'\n\n','**'+n['declarationName']+'** — '+n['statement']+'\n\n','Hypotheses: '+' '.join(n['hypotheses'])+'\n\n','Prerequisites: '+', '.join(n['prerequisites'])+'.\n\n','Proof: '+' '.join(n['proofSteps'])+'\n\n']
parts+=['## API and typed boundary examples\n\n']
for label,items in [('API',api),('Tests',tests)]:parts+=[label+':\n\n']+['- **'+x['name']+'**: '+x['statement']+'\n'for x in items]+['\n']
(S/'ReaderAddition.md').write_text(''.join(parts));(S/'Reader.md').write_text(''.join(parts)+(S/'IncomingReader.md').read_text())
print(json.dumps(dict(nodes=len(p['nodes']),newNodes=len(nodes),newApi=len(api),newTests=len(tests),baseline=len(p['baseline']['declarations']))))
```

## Helper: projection.py

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
                if block[k:k+2]==':=' and depth==0 and not re.match(r'\s*let(?:I)?\b',block[:k].rsplit('\n',1)[-1]):pos=k;break
            assert pos is not None
            out.append(block[:pos]+':= by\n  sorry\n\n');i=j
        else:out.append(lines[i]);i+=1
    return ''.join(out)

def project(proofs,tests):
    return admit_lemmas(proofs)+'\n'+admit_lemmas(tests)
```

## Helper: write_handoff.py

```python
"""Record the actual additive conductor sequence, exact evidence, and remaining frontier."""
from pathlib import Path
import hashlib,json,re
S=Path(__file__).resolve().parent
def txt(n):return (S/n).read_text()
def data(n):return json.loads(txt(n))
sha=lambda b:hashlib.sha256(b).hexdigest()
def line(stem):
 r=data(stem+'.receipt.json');b=(S/(stem+'.lean')).read_bytes();assert r['exitStatus']==0
 return f"- {stem}.lean: {len(b.splitlines())} lines, {len(re.findall(r'^example\b',b.decode(),re.M))} examples, {r['warnings']} warnings, {r['axiomAudits']} axiom audits, exit0; source SHA256 `{sha(b)}`, diagnostic SHA256 `{r['logSha256']}`. Serial run: {r['availableGiBBefore']}GiB available beforehand, {r['elapsedSeconds']}s, {r['maxRssKiB']}KiB maximum RSS.\n"
g=data('Graph.json');p=data('Candidate.json');old=data('Incoming.json');plan=data('Plan.json')
raw=sum(len(n.get('tests',[]))for n in p['nodes'])
h=f'''# The actual conductor additive sheaf short exact sequence — checkpoint

Agent: Codex — codex-rtOQ9t. Refs #3378. The design remains partial; every implementation remains unchecked.

For every finite schematically dominant f:Y→P, let I be its actual conductor ideal datum and J=I.comap f. The preceding ring-sheaf pullback becomes a native additive-sheaf pullback through the existing CommRingCat→RingCat→AddCommGrpCat functors: whiskering preserves limits and the sheaf inclusion reflects them. Specialize Mathlib's native short complex of this square. Its first arrow is the actual structure-map biproduct lift; its last arrow is the actual conductor inclusion minus chart map. Both coordinate equations, both signed injection equations and their actual section formulas are proved.

The native pullback/kernel interfaces prove monomorphy and Exactness. On an affine target open, the source inverse image is affine because f is finite. The actual closed-conductor inclusion is surjective on sections there, and the first native biproduct injection gives a lift under the actual last map. Every point of any open has a smaller affine neighborhood inside it, so these lifts prove local surjectivity. Mathlib's native local-surjectivity criterion gives sheaf epimorphy. The specified short complex is therefore natively ShortExact. No reducedness, Noetherianity, birationality or global affineness is imposed. No last-map surjectivity on sections of every nonaffine open is claimed.

Fifteen new declarations (one construction, fourteen lemmas), thirteen distinct API entries and six typed tests are appended. All642 incoming node objects and441 baseline entries remain whole; {len(plan['newBaseline'])} freshly inspected existing native interfaces extend the baseline inventory to{len(p['baseline']['declarations'])}. All29 planets,78 routes,18 gaps,23 requests,23 source findings and seven partial stages remain. The reserved ferrand-pushouts key and the scheme/algebraic-space existence and small-étale-site boundaries are preserved. No general sheaf, abelian category, forgetful functor or short-complex carrier is replanned.

The tests cover both unit signs, the empty open, an actual structure-section pair, actual affine lifting, the kernel universal property against any native additive sheaf, and the nonzero square-zero section2 of Spec(Z/4) surviving the actual first sheaf map. The last test detects reduction of the structure ring. No concrete nonaffine failure of section surjectivity is exhibited; the arbitrary-open statements are local surjectivity and the inherited middle exactness.

## Reading and ownership

The whole18717-character issue was read before claim5975914966 and again after exact numeric bot5975915858 confirmed this session. The two complete reading ranges and identical body hash are in ClaimReceipt.json. Own6030 explicitly scoped protocol, reviewed R11.1–R11.6 and172-line REV-AUDIT-10, upstream and key readings are reused only at unchanged hashes. OwnPreviousReadingGuard.json records23 unchanged controls and6 changed inputs against that own checkpoint; hash agreement is not described as a fresh full reading. Current G.0 frontier, the global-geometric conductor contract, reserved key whole node/API/tests, conductor-touching requests and final two gaps were freshly inspected. Other historical stages and all642 old nodes were not freshly exhaustively audited. Reading.json records exact bounds and distinct own/peer attribution.

Incoming peer PR6039 at head1e9b8115fd273eee7034e4e6dfb68f1a83dc3b47 was actually recovered over public HTTP:61 artifacts,10 helpers and five final files authenticated. Its actual immutable verifier was executed and its report reproduced byte-for-byte. All17 new incoming declarations,9 typed tests, complete handoff and actual helper code were personally inspected, along with the consumed actual affine signed-difference and conductor chart scopes. IncomingManifest.json binds all three preserved Lean prefixes. Own6030 at head7dff2be408a27559747f538d9b3e334c32c8c8fc was also publicly recovered; its manifest binds the reused own Reading, InputGuard and SupplierReading. Peer reading is preserved as attribution, not adopted as this worker's reading.

The complete current displayed statement and proof of Stacks37.14.1(tag0ET0) were freshly read as structure-sheaf context. SourceReading.json records the exact HTTP hash and access time without retaining HTML. The broader additive finite-conductor sequence is an authored deduction from the preceding native proof and pinned interfaces. All23 source findings and their source-version scopes remain inherited. verify.py independently enumerates the32-element commutative F₂ block-matrix algebra and1024 products supporting the still-open matrix-image dimension justification. No new finding, full-paper or exhaustive correction audit, or recursive source closure is claimed.

SF.0 retains its generic quotient-presheaf, sheafification and finite-module flat-annihilator work. Own6040 supplied the current all-open quotient/sheafification interface in this continuous session; own551 publication reading inspected the complete current SF.0 frontier and conductor requests at the identical905a control. This continuation constructs only the actual conductor sequence. Coherent H0/H1 and genus require their existing supplier interfaces. Quotient topology, the geometric/categorical Scheme pushout, recomputed flat conductors, P¹/Proj, properness/projectivity, the separate I₂ model and later classification work remain required.

## Validation and limits

Native.lean preserves the complete authenticated proof prefix and adds all fifteen actual proof bodies, six typed tests and fifteen axiom audits. It compiles with no errors, warnings or admissions; all530 audits allow only propext, Classical.choice and Quot.sound. Sketch.lean preserves the complete authenticated Mathlib projection and adds exact new admitted headers and tests. It compiles with737 admission warnings only and20 inherited non-admission axiom audits. All fifteen new declaration headers and six example headers match their admitted projections exactly. The actual short-complex data body is retained.

Eight required individual Mathlib imports are inserted into the full suggested file ahead of its existing imports; every byte of the historical prefix remains in order. ImportAddition.lean records the exact insertion. The full Tau-importing canonical suggested file remains UNCOMPILED. A fresh probe again found the available Tau build at cf386627e9176a3827c1a5fe804989fd94a4d216, rather than required f790474821cf4256814db967cb154e7af3d0c369, and all five direct Tau import artifacts absent. TauBuildScope.json records this. No library build, project setup, cache download or language server was used. The two final Lean checks were serial, immediately memory-checked, capped at8GiB and1200seconds, at the exact Mathlib pin and compiler.

'''+line('Native')+line('Sketch')+f'''
Suggested.lean equals Canonical.lean exactly, SHA256 `{sha((S/'Canonical.lean').read_bytes())}`. The bounded Mathlib checks do not certify that full Tau-importing file or the remaining geometric obligations.

The actual indexed packet checker reports657 nodes,403 API entries,334 recognized tests,{len(p['baseline']['declarations'])} baseline declarations,29 planets,18 gaps and23 requests, with zero errors/warnings. There are{raw} raw test objects. Actual immutable checker, intake file/authorization, source-issue/source-version validation and atlas assembly pass at mathematical base `{txt('base.txt').strip()}` and publication control `{txt('publication-base.txt').strip()}`. Verification-mathematical.json and Verification.json contain the reproducible reports. All29 guarded inputs and the non-state queue contract agree between these controls; PublicationChanges.json records the empty change set.

The publication graph has stage{g['stageDAG']['vertices']}/{g['stageDAG']['edges']}, own{g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']} and scoped{g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']} vertices/edges, all acyclic. All{g['requiredPairs']} required supplier paths are reachable. Owned dependencies resolve without skipped or pending links. Whole foreign roadmap/stage objects and the complete stage-edge vector match each corresponding control. The{g['otherPreexistingMissingRestructurePairs']} unrelated preexisting missing restructure paths remain unchanged.

## Resume

Use conductorAdditiveShortComplex_shortExact, its actual projection/signed component identities, affine component lifts and local-surjectivity theorem. Supply the coherent cohomology and genus interfaces through their owners rather than treating an arbitrary-open section map as surjective. The next conductor geometry work is the actual quotient topology and Scheme pushout universal property, then recomputed flat-conductor integration with the existing SF.0 annihilator supplier. Retain nilpotents, zero rings, empty schemes, all inherited source findings and all separate I₂ and model/classification obligations.

## Exact helper code

The following ten fences reproduce the archived helper files byte-for-byte. Inspect them before replay; the public recovery script also verifies these equalities and the immutable verifier verifies the archive and mathematical prefix.

'''
for name in ['assemble.py','author.py','projection.py','write_handoff.py','verify.py','graph.py','immutable.py','compile.py','runcheck.py','package.py']:
 h+='## Helper: '+name+'\n\n```python\n'+txt(name)+'```\n\n'
(S/'HandoffBase.md').write_text(h);(S/'Handoff.md').write_text(h)
```

## Helper: verify.py

```python
"""Verify exact source-conductor contracts, compiler receipts and actual immutable atlas assembly; never runs Lean."""
from pathlib import Path
import ast,hashlib,json,os,re,subprocess,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd().resolve();sys.path.insert(0,str(S))
RID='NeronModelsAndSemistableAbelianVarietiesPartII';NS='TauCeti.GenusOne.FerrandPushout.'
sha=lambda b:hashlib.sha256(b).hexdigest()
def txt(n):return (S/n).read_text()
def data(n):return json.loads(txt(n))
MATH=txt('base.txt').strip();BASE=os.environ.get('NERON_VALIDATE_BASE',txt('publication-base.txt').strip())
def blob(ref,path):return subprocess.check_output(['git','show',ref+':'+path],cwd=R)
paths=['research/blueprint/'+f+'/'+('DESIGN-'if f=='handoff'else'')+RID+'.'+e for f,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
contents=dict(zip(paths,[txt(n)for n in ['Candidate-roadmap.json','Candidate.json','Reader.md','Suggested.lean','Handoff.md']]))
if (S/'PublicHandoff.md').exists():
 contents[paths[-1]]=txt('PublicHandoff.md')
 assert txt('PublicHandoff.md').startswith(txt('HandoffBase.md'))
 fence=chr(96)*3
 script=txt('PublicHandoff.md').split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
 assert script==txt('recover.py')

for path,n in zip(paths,['Incoming-roadmap.json','Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert blob(MATH,path)==(S/n).read_bytes(),path
p=data('Candidate.json');old=data('Incoming.json');plan=data('Plan.json');nodes={n['id']:n for n in p['nodes']}
assert len(old['nodes'])==642 and len(nodes)==len(p['nodes'])==657
assert [n['id']for n in p['nodes'][:642]]==[n['id']for n in old['nodes']]
assert p['nodes'][642:]==data('NewNodes.json')and [n['id']for n in p['nodes'][642:]]==plan['newNodes']
changed={}
for a in old['nodes']:
 b=nodes[a['id']];allowed=plan['changedExisting'].get(a['id'],[])
 assert {k:v for k,v in a.items()if k not in allowed}=={k:v for k,v in b.items()if k not in allowed}
 for k in allowed:assert b[k][:len(a.get(k,[]))]==a.get(k,[])
 if a!=b:changed[a['id']]=allowed
assert changed==plan['changedExisting']
assert set(p)==set(old)
for k in old:
 if k not in ['nodes','summary','sources','baseline','coverage','sourceIssues','gaps']:assert p[k]==old[k],k
assert p['sources']==old['sources']+plan['newSources']and p['summary'].startswith(old['summary'])
assert p['sourceIssues']==old['sourceIssues']+plan['newSourceIssues']
assert p['gaps']==old['gaps']+plan['newGaps']
assert p['baseline']['declarations']==old['baseline']['declarations']+plan['newBaseline']and len(p['baseline']['declarations'])==len(old['baseline']['declarations'])+len(plan['newBaseline'])
assert {k:v for k,v in p['baseline'].items()if k!='declarations'}=={k:v for k,v in old['baseline'].items()if k!='declarations'}
for a,b in zip(old['coverage'],p['coverage']):
 if a['stageId']==RID+':G.0':
  assert b['remaining']==a['remaining']+[plan['frontier']]
  assert {k:v for k,v in a.items()if k!='remaining'}=={k:v for k,v in b.items()if k!='remaining'}
 else:assert a==b
assert p['status']=='partial'and all(n['implementationStatus']=='unchecked'for n in p['nodes'])and all(c['status']=='partial'for c in p['coverage'])
assert (len(p['requests']),len(p['gaps']),len(p['coverage']),len(p['routeCoverage']),len(p['sourceIssues']))==(23,18,7,78,23)
rd=data('Candidate-roadmap.json');rold=data('Incoming-roadmap.json')
assert rd['stages'][1:]==rold['stages'][1:]
assert {k:v for k,v in rd.items()if k!='stages'}=={k:v for k,v in rold.items()if k!='stages'}
assert {k:v for k,v in rd['stages'][0].items()if k!='description'}=={k:v for k,v in rold['stages'][0].items()if k!='description'}
assert rd['stages'][0]['description']==rold['stages'][0]['description']+' '+plan['frontier']
assert txt('Reader.md')==txt('ReaderAddition.md')+txt('IncomingReader.md')
for n in p['nodes'][642:]:assert n['statement']in txt('ReaderAddition.md')and n['declarationName']in txt('ReaderAddition.md')
for item in plan['newApi']+plan['newTests']:assert item['name']in txt('ReaderAddition.md')and item['statement']in txt('ReaderAddition.md')
assert len(plan['newApi'])==13 and len(plan['newTests'])==6
assert sum(len(n.get('tests',[]))for n in data('NewNodes.json'))==6
assert set(t['name']for n in data('NewNodes.json')for t in n.get('tests',[]))==set(t['name']for t in plan['newTests'])
assert all(len(n['api'])>=3 and len(n['tests'])>=3 for n in data('NewNodes.json')if n['kind']=='construction')
from projection import admit_lemmas
assert txt('NewAdmitted.lean')==admit_lemmas(txt('NewProofs.lean'))
assert txt('TestsAdmitted.lean')==admit_lemmas(txt('NewTests.lean'))
def headers(text):
 found={}
 for match in re.finditer(r'^(def|lemma|theorem|example)\b(?: ([\w.]+))?',text,re.M):
  depth=0;end=None
  for i in range(match.start(),len(text)):
   c=text[i]
   if c in '([{⟨':depth+=1
   elif c in ')]}⟩':depth-=1
   if depth==0 and text.startswith(':=',i)and not re.match(r'\s*let(?:I)?\b',text[match.start():i].rsplit('\n',1)[-1]):end=i;break
  assert end is not None
  label=match.group(2)if match.group(1)!='example'else'example#'+str(sum(k.startswith('example#')for k in found))
  assert label not in found,label
  found[label]=' '.join(text[match.start():end].split())
 return found
nh=headers(txt('NewProofs.lean'));nt=headers(txt('NewTests.lean'))
assert nh==headers(txt('NewAdmitted.lean'))and nt==headers(txt('TestsAdmitted.lean'))and len(nh)==15 and len(nt)==6
existing=[]
def remove(t,name):
 lines=t.splitlines(keepends=True);i=next(i for i,l in enumerate(lines)if re.match(r'(?:def|lemma) '+re.escape(name)+r'\b',l));j=i+1
 while j<len(lines)and(not lines[j].strip()or lines[j][0].isspace()):j+=1
 return ''.join(lines[:i]+lines[j:])
extra=txt('NewAdmitted.lean');prior=txt('CanonicalPrefix.lean')
for name in existing:
 m=re.search(r'^(?:def|lemma) '+re.escape(name)+r'\b[\s\S]*?(?=^end |^namespace |^variable |^def |^lemma |^theorem |^example |\Z)',prior,re.M);assert m,name
 assert headers(m[0])[name]==nh[name],name
 extra=remove(extra,name)
assert txt('CanonicalAddition.lean')==extra+'\n'+txt('TestsAdmitted.lean')
i=re.search(r'^import ',prior,re.M).start()
assert txt('Canonical.lean')==prior[:i]+txt('ImportAddition.lean')+prior[i:]+'\n'+txt('CanonicalAddition.lean')==txt('Suggested.lean')
assert txt('Native.lean')==txt('NativePrefix.lean')+'\n'+txt('NewProofs.lean')+'\n'+txt('NewTests.lean')+'\n'+txt('Audits.lean')
assert txt('Sketch.lean')==txt('SketchPrefix.lean')+'\n'+txt('NewAdmitted.lean')+'\n'+txt('TestsAdmitted.lean')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',txt('Native.lean'))
assert {t['name']for t in plan['newTests']}==set(re.findall(r'^-- test: (.+)$',txt('NewTests.lean'),re.M))
assert txt('Incoming.lean')==prior
im=data('IncomingManifest.json');ir=data('PreviousRecovery.json')
assert ir['head']=='1e9b8115fd273eee7034e4e6dfb68f1a83dc3b47'and ir['artifactsVerified']==61 and ir['archivedHelpersVerified']==10
assert sha((S/'IncomingManifest.json').read_bytes())=='0966377fb31341fc2d735e392e4a64b8fe691e9392d3a456e7dda9242dace689'
for name,prefix in [('Native.lean','NativePrefix.lean'),('Sketch.lean','SketchPrefix.lean'),('Canonical.lean','CanonicalPrefix.lean')]:assert im[name]['sha256']==sha((S/prefix).read_bytes()),name
assert (S/'PreviousVerification.json').read_bytes()==(S/'IncomingVerification-replayed.json').read_bytes()
for path,n in zip(paths,['Incoming-roadmap.json','Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert ir['publicDeliverables'][path]==sha((S/n).read_bytes())

ownr=data('OwnPreviousRecovery.json');ownm=data('OwnPreviousManifest.json')
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='e79424711458374fd7f54991d1f2c9a3f7203f1a6b90cb9d9dffd38703ae9620'
assert ownr['head']=='7dff2be408a27559747f538d9b3e334c32c8c8fc' and ownr['artifactsVerified']==59
for name,archived in [('Reading.json','OwnPreviousReading.json'),('InputGuard.json','OwnPreviousInputGuard.json'),('SupplierReading.json','OwnPreviousSupplierReading.json')]:assert ownm[name]['sha256']==sha((S/archived).read_bytes())
assert data('OwnPreviousReading.json')['session']=='codex-rtOQ9t'
gprior={g['path']:g['sha256']for g in data('OwnPreviousInputGuard.json')};current=data('InputGuard.json');reuse=data('OwnPreviousReadingGuard.json')
assert reuse['unchanged']==[g for g in current if gprior.get(g['path'])==g['sha256']]
assert reuse['changed']==[g for g in current if gprior.get(g['path'])!=g['sha256']]
assert len(reuse['unchanged'])==23 and len(reuse['changed'])==6
claim=data('ClaimReceipt.json');assert claim['session']=='codex-rtOQ9t' and claim['beforeAfterBodyIdentical']
assert claim['claim']['id']==5975914966 and claim['bot']['id']==5975915858
assert '5975914966' in claim['bot']['body'] and 'codex-rtOQ9t' in claim['bot']['body'] and claim['bot']['user']['login']=='github-actions[bot]'

# Independently enumerate the recorded block matrix subalgebra over F2.
counter=data('SourceGapCounterexample.json');basis=counter['basis']
assert len(basis)==5 and all(len(b)==16 for b in basis)
assert basis==[[int(i==j)for i in range(4)for j in range(4)]]+[[int(i==a and j==b)for i in range(4)for j in range(4)]for a,b in [(0,2),(0,3),(1,2),(1,3)]]
elements={tuple(sum(basis[j][i] for j in range(5)if mask>>j&1)%2 for i in range(16))for mask in range(32)}
assert len(elements)==32==counter['elements'] and counter['ambientModuleDimension']==4 and counter['subalgebraDimension']==5
def multiply(a,b):return tuple(sum(a[4*i+k]*b[4*k+j]for k in range(4))%2 for i in range(4)for j in range(4))
assert all(multiply(a,b)in elements and multiply(a,b)==multiply(b,a)for a in elements for b in elements)
assert len(elements)**2==counter['checkedProducts']==1024

comp={}
for stem,ex,want,audits in [('Native',275,0,530),('Sketch',294,737,20)]:
 rec=data(stem+'.receipt.json');log=txt(stem+'.log');b=(S/(stem+'.lean')).read_bytes()
 assert rec['exitStatus']==0 and rec['availableGiBBefore']>=20
 assert rec['sourceSha256']==sha(b)and rec['logSha256']==sha(log.encode())
 assert ': error'not in log and 'Exit status: 0'in log and 'timeout 1200'in log and '-j 1 -M 8192'in log
 assert log.count('warning:')==log.count('warning: declaration uses `sorry`')==want
 assert len(re.findall(r'^example\b',b.decode(),re.M))==ex
 au=re.findall(r"'([^']+)' depends on axioms:\s*\[([^]]*)\]",log);assert len(au)==audits==rec['axiomAudits']
 assert 'sorryAx'not in log
 for name,axs in au:assert set(x.strip()for x in axs.replace('\n',' ').split(',')if x.strip())<={'propext','Classical.choice','Quot.sound'},(name,axs)
 if stem=='Native':assert set(plan['newNames'])|{NS+n for n in existing}<={n for n,_ in au}
 comp[stem]={**rec,'lines':len(b.splitlines()),'examples':ex}
changes={g['path']:g for g in data('PublicationChanges.json')}if BASE!=MATH else {}
for g in data('InputGuard.json'):
 assert sha(blob(MATH,g['path']))==g['sha256'],g['path']
 actual=sha(blob(BASE,g['path']))
 if g['path']in changes:
  c=changes[g['path']];assert c['before']==g['sha256']and c['after']==actual
  assert c.get('readScope'),g['path']
 else:assert actual==g['sha256'],g['path']
for ref in [MATH,BASE]:
 job=next(j for j in json.loads(blob(ref,'research/blueprint/queue.json'))['jobs']if j['id']=='DESIGN-'+RID)
 contract={k:v for k,v in job.items()if k not in ['state','note']}
 if ref==MATH:original=contract
 else:assert contract==original
if (S/'artifact-manifest.json').exists():
 for n,item in data('artifact-manifest.json').items():
  b=(S/n).read_bytes();assert sha(b)==item['sha256']and len(b)==item['bytes']and len(b.splitlines())==item['lines'],n
fence=chr(96)*3
for name in ['assemble.py','author.py','projection.py','write_handoff.py','verify.py','graph.py','immutable.py','compile.py','runcheck.py','package.py']:
 code=txt('HandoffBase.md').split('## Helper: '+name+'\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
 assert code==txt(name),name
for path,t in contents.items():assert not re.search(r'/(?:home|tmp|Users)/|file'+'://|[ \t]+$',t,re.M),path
os.environ['NERON_VALIDATE_BASE']=BASE
import immutable;assert immutable.BASE==BASE
for path,t in contents.items():immutable.CACHE[path]=t.encode()
immutable.install();sys.path.insert(0,str(R/'scripts'))
import check_blueprint,source_issues,check_errata
index=check_blueprint.load_index(Path(sys.argv[2]));assert index[0]is not None
errors,warnings,checker=check_blueprint.check(S/(RID+'.json'),index,check_blueprint.world());assert not errors and not warnings,(errors,warnings)
checker['packet']=paths[1]
issues=source_issues.check_issues(p['sourceIssues'],RID)
envelope={'roadmapId':RID,'protocol':'errata-v1','sourceIssues':p['sourceIssues'],'sourceVersions':[dict(kind=('preprint'if x['id']=='schroer'else'author copy'),url=x['url'],read=x.get('accessed'),sha256=x.get('sha256'),attribution=('Fresh bounded current-page contextual reading; no new findings'if x['id']in {s['id']for s in plan['newSources']}else'Inherited source record; no fresh erratum audit claimed'))for x in p['sources']if x['id']in{f['source']for f in p['sourceIssues']}]}
issues+=check_errata.check(envelope,RID);assert not issues,issues
tree=ast.parse((R/'research/blueprint/intake.py').read_text());wanted={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id in {'ALLOWED','PRIVATE'}for t in n.targets)or isinstance(n,ast.FunctionDef)and n.name in wanted]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs']if j['id']=='DESIGN-'+RID)
problems=[x for f,t in contents.items()for x in env['file_problems'](f,t)];refusals=env['auto_refusals'](job,paths,False,{'codex-rtOQ9t'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'NERON_VALIDATE_BASE':BASE}));assert graph['auditBase']==BASE
print(json.dumps(dict(mathematicalBase=MATH,publicationBase=BASE,preservedContracts=642,preservedWholeNodes=642,changedExisting=changed,newNodes=15,newApi=13,newTests=6,newTestReferences=6,baselineDeclarations=len(p['baseline']['declarations']),rawApi=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),matchedNativeHeaders=15,matchedExistingHeaders=0,matchedExamples=6,checker=checker,compilation=comp,canonicalSha256=sha(txt('Canonical.lean').encode()),fullCanonicalCompiled=False,incomingArchiveAuthenticated=61,guardsUnchanged=len(data('InputGuard.json'))-len(changes),publicationGuardChanges=list(changes.values()),indexSha256=sha(Path(sys.argv[2]).read_bytes()),intakeProblems=problems,intakeRefusals=refusals,sourceIssueErrors=issues,sourceVersionScope='All23 inherited findings retained whole with inherited source-version attribution; one freshly read contextual source version, no new findings. No full-paper or exhaustive correction audit.',graph=graph,LeanExecuted=False),indent=2))
```

## Helper: graph.py

```python
from pathlib import Path
import os,sys,json,collections,copy
R=Path.cwd();S=Path(sys.argv[1]);RID='NeronModelsAndSemistableAbelianVarietiesPartII';STEM=RID
sys.path.insert(0,str(R/'scripts'))
p=json.loads((S/'Candidate.json').read_text())
old=json.loads((S/'Incoming.json').read_text())
nodes={n['id']:n for n in p['nodes']}
own_definition=json.loads((S/'Candidate-roadmap.json').read_text())
old_definition=json.loads((S/'Incoming-roadmap.json').read_text())
os.environ.setdefault('NERON_VALIDATE_BASE', (S/'publication-base.txt').read_text().strip())
import immutable
immutable.install()
import check_blueprint
import build,blueprints
packets,documents,definitions=blueprints.load_promoted(R)
keep=[x for x in packets if x[0]!=STEM];documents[STEM]='research/blueprint/readmes/'+STEM+'.md'

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
oldse={(e['source'],e['target']) for e in b['stageEdges']}
assert a['stageEdges']==b['stageEdges']
assert se==oldse
assert oldse<=se
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
 rspairs|={(x['source'],x['target']) for x in q.get('links',[]) if x.get('source') in stageids and x.get('target') in stageids}
assert all(reachable(s,t) for s,t in pairs),sorted((s,t) for s,t in pairs if not reachable(s,t))
missing=sorted((s,t) for s,t in rspairs if not reachable(s,t))
assert not any(s.startswith(RID+':') or t.startswith(RID+':') for s,t in missing),missing
ar={r['id']:r for r in a['roadmaps']};br={r['id']:r for r in b['roadmaps']}
assert ar[RID]['blueprint']['declarations']==len(nodes)
assert not ar[RID]['blueprint']['skippedLinks'] and not ar[RID].get('pendingLinks',[])
def skips(r):return r.get('blueprint',{}).get('skippedLinks',[]),r.get('pendingLinks',[])
assert set(ar)==set(br)
assert all(ar[x]==br[x] for x in br if x!=RID)
ast={s['id']:s for s in a['stages']};bst={s['id']:s for s in b['stages']}
assert set(ast)==set(bst)
assert all(ast[x]==bst[x] for x in bst if not x.startswith(RID+':'))
assert all(skips(ar[x])==skips(br[x]) for x in br if x!=RID)
summary={'stageDAG':dag(listedstageids,se),'ownDeclarationDAG':dag(nodes,ownedges),'scopedDAG':dag(listedstageids|seen,se|de),'reachableDeclarations':len(seen),'externalDeclarations':sorted(seen-set(nodes)),'baselineLeaves':len(baseref),'requiredPairs':len(pairs),'restructurePairs':len(rspairs),'ownRestructurePairs':sum(s.startswith(RID+':') or t.startswith(RID+':') for s,t in rspairs),'otherPreexistingMissingRestructurePairs':len(missing),'otherMissingRestructurePairsSha256':__import__('hashlib').sha256(json.dumps(missing).encode()).hexdigest(),'unresolved':sorted(unresolved),'ownSkippedLinks':[],'ownPendingLinks':[],'otherSkipsMatch':True,'wholeForeignRoadmapsMatch':True,'wholeForeignStagesMatch':True,'wholeStageEdgesMatch':True,'stageEdgesUnchanged':se==oldse,'addedStageEdges':sorted(se-oldse),'removedStageEdges':sorted(oldse-se)}
import hashlib
summary['auditBase']=immutable.BASE
summary['gitBlobReadCount']=len(immutable.READS)
summary['gitBlobReadsSha256']=hashlib.sha256(json.dumps(sorted(immutable.READS)).encode()).hexdigest()
print(json.dumps(summary,indent=2))
```

## Helper: immutable.py

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
BASE = os.environ.get('NERON_VALIDATE_BASE', 'ba26650311df0a78e2f01f19bd298bfc7d636794')
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
    return blob(key).decode(('utf-8' if encoding in (None, 'locale') else encoding), errors or 'strict')

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
    return io.BytesIO(blob(key)) if mode == 'rb' else io.StringIO(blob(key).decode(('utf-8' if encoding in (None, 'locale') else encoding), errors or 'strict'))

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

## Helper: compile.py

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

## Helper: runcheck.py

```python
"""Serial checked replay with bounded diagnostics and apply_patch receipt writes."""
from pathlib import Path
import subprocess,sys,hashlib,json,re,time
S=Path(sys.argv[1]);name=sys.argv[4];prefix=name[:-5]
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

## Helper: package.py

```python
"""Archive only named job evidence in an inert comment; write final public recovery."""
from pathlib import Path
import base64,hashlib,json,re,sys,zlib
S=Path(sys.argv[1]).resolve();R=Path.cwd();mode=sys.argv[2]
STEM='NeronModelsAndSemistableAbelianVarietiesPartII'
suggested=R/'research/blueprint/suggested'/(STEM+'.lean')
sha=lambda b:hashlib.sha256(b).hexdigest()
NAMES='''Incoming-roadmap.json Incoming.json IncomingReader.md Incoming.lean IncomingHandoff.md IncomingManifest.json
IncomingVerification-replayed.json NativePrefix.lean SketchPrefix.lean CanonicalPrefix.lean
Native.lean Native.log Native.receipt.json Sketch.lean Sketch.log Sketch.receipt.json Canonical.lean CanonicalAddition.lean
ImportAddition.lean NewProofs.lean NewTests.lean NewAdmitted.lean TestsAdmitted.lean Audits.lean Candidate-roadmap.json Candidate.json Reader.md ReaderAddition.md Suggested.lean Handoff.md HandoffBase.md
ClaimReceipt.json Reading.json SourceReading.json BaselineReading.json IncomingReading.json OwnPreviousReading.json OwnPreviousInputGuard.json OwnPreviousSupplierReading.json OwnPreviousManifest.json OwnPreviousRecovery.json OwnPreviousReadingGuard.json
InputGuard.json PublicationChanges.json Plan.json NewNodes.json PreviousHead.txt PreviousRecovery.json PreviousVerification.json Verification-mathematical.json Verification.json
SourceGapCounterexample.json TauBuildScope.json Graph.json base.txt publication-base.txt
assemble.py author.py projection.py write_handoff.py verify.py graph.py immutable.py compile.py runcheck.py package.py'''.split()
if mode=='archive':
 meta={n:dict(sha256=sha((S/n).read_bytes()),bytes=len((S/n).read_bytes()),lines=len((S/n).read_bytes().splitlines()))for n in NAMES}
 mb=(json.dumps(meta,indent=2,sort_keys=True)+'\n').encode();(S/'artifact-manifest.json').write_bytes(mb)
 payload={n:dict(sha256=sha((S/n).read_bytes()),data=base64.b64encode(zlib.compress((S/n).read_bytes(),9)).decode())for n in NAMES+['artifact-manifest.json']}
 pb=(json.dumps(payload,sort_keys=True,separators=(',',':'))+'\n').encode();(S/'payload.json').write_bytes(pb)
 report=dict(artifacts=len(NAMES),helpers=sum(n.endswith('.py')for n in NAMES),manifestSha256=sha(mb),payloadSha256=sha(pb))
 (S/'package.json').write_text(json.dumps(report,indent=2)+'\n')
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED CONDUCTOR ADDITIVE SHEAVES PAYLOAD\n'+pb+b'END ARCHIVED CONDUCTOR ADDITIVE SHEAVES PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('roadmaps','Candidate-roadmap.json'),('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated conductor additive sheaf evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='NeronModelsAndSemistableAbelianVarietiesPartII'
ARCHIVE=__ARCHIVE__
MANIFEST_SHA=__MANIFEST__
PAYLOAD_SHA=__PAYLOAD__
EXPECTED=__EXPECTED__
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED CONDUCTOR ADDITIVE SHEAVES PAYLOAD\\n',1)[1].split('END ARCHIVED CONDUCTOR ADDITIVE SHEAVES PAYLOAD -/',1)[0].encode()
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
(S/'recover.py').write_text(code)
for name in ['assemble.py','author.py','projection.py','write_handoff.py','verify.py','graph.py','immutable.py','compile.py','runcheck.py','package.py']:
 helper=handoff.split('## Helper: '+name+'\\n\\n'+fence+'python\\n',1)[1].split('\\n'+fence+'\\n',1)[0]+'\\n'
 assert helper==(S/name).read_text(),name
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\\n');print(json.dumps(receipt,indent=2))
'''
 for key,val in [('__ARCHIVE__',archive),('__MANIFEST__',p['manifestSha256']),('__PAYLOAD__',p['payloadSha256']),('__EXPECTED__',expected)]:code=code.replace(key,repr(val))
 compile(code,'recover.py','exec');(S/'recover.py').write_text(code)
 prose=f'''
## Public recovery and replay

Archive commit `{archive}` is an ancestor changing only this issue's suggested file. Its {p['artifacts']} inert artifacts include all {p['helpers']} authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `{p['manifestSha256']}`; payload SHA256 `{p['payloadSha256']}`. The final suggested file has no archive payload and equals Canonical.lean, whose full Tau-importing file remains UNCOMPILED.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count, matches all archived helper fences exactly, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set NERON_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Sketch.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. The full Tau-importing Canonical.lean/Suggested.lean is not covered by these checks and remains UNCOMPILED. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

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

Archive commit `1b6a1b128eee42d6bf350a9e5fee784c4d160e56` is an ancestor changing only this issue's suggested file. Its 66 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `3ca1428d95d01dd3b4356c4a39fca79c35efd3153f66543f14bf8297769862e2`; payload SHA256 `f7930099d5e65ae6a30f2ea080d21eca3f1a531aecd9cdd12e12d49dfc76c06a`. The final suggested file has no archive payload and equals Canonical.lean, whose full Tau-importing file remains UNCOMPILED.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count, matches all archived helper fences exactly, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set NERON_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Sketch.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. The full Tau-importing Canonical.lean/Suggested.lean is not covered by these checks and remains UNCOMPILED. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

```python
"""Recover public authenticated conductor additive sheaf evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='NeronModelsAndSemistableAbelianVarietiesPartII'
ARCHIVE='1b6a1b128eee42d6bf350a9e5fee784c4d160e56'
MANIFEST_SHA='3ca1428d95d01dd3b4356c4a39fca79c35efd3153f66543f14bf8297769862e2'
PAYLOAD_SHA='f7930099d5e65ae6a30f2ea080d21eca3f1a531aecd9cdd12e12d49dfc76c06a'
EXPECTED={'roadmaps': '8c0ce36645c14ddb1fba8b8cb1b4ed8111744a82c0c65f720627e32e47694acb', 'packets': '7b0ad0531ec1a8f57b475f38a8c4cae0360f8676ec8699459e4f12043efc0047', 'readmes': 'b8a29ff64c24091baf2db7a80f9eefe5e5707c159dc28a64bdb33975752911ca', 'suggested': 'a032beddc78f5174108816530974bd2236fdf796b48dd5f043b76e90ce3c8ee8'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED CONDUCTOR ADDITIVE SHEAVES PAYLOAD\n',1)[1].split('END ARCHIVED CONDUCTOR ADDITIVE SHEAVES PAYLOAD -/',1)[0].encode()
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
(S/'recover.py').write_text(code)
for name in ['assemble.py','author.py','projection.py','write_handoff.py','verify.py','graph.py','immutable.py','compile.py','runcheck.py','package.py']:
 helper=handoff.split('## Helper: '+name+'\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
 assert helper==(S/name).read_text(),name
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
