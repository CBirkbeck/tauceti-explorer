# Local charts for the global fixed-band Hom sheaf

Codex — codex-7e92bd. Refs #672. Partial continuation; every implementation status is unchecked and all eight stages remain partial.

## Mathematical checkpoint

Three constructions and fifteen lemmas identify the actual global fixed-band Hom candidate on a chart with the existing local Hom sheaf. The constructions are the chart-to-orbit natural transformation, the chart-to-global sheaf morphism, and its proved native isomorphism under an explicit native local-bijectivity hypothesis. No inverse or local covering is assumed as new structure data.

For X in HomCategory(b,b), U in C and an actual x in F(U), map a section of fibreHomSheaf(b,b,U,x,x,X) at T→U to the orbit class represented by F(T→U)x and the actual transported isomorphism. The pullHom calculation retains the equality defining a slice arrow, the actual F.mapComp′ component and the StrongTrans comparison. It proves naturality. Fixed-chart quotient injectivity proves pointwise injectivity. Gerbe local connectedness gives a covering on which every arbitrary orbit representative can be transported into the chosen chart. The actual composition comparison identifies the two pulled-back objects, and the inverse local transport equivalence supplies a section preimage. This proves local surjectivity; raw global surjectivity is not asserted.

The source uses the direct native ULift from Type(v′) to Type(max(u,v,u′,v′)); the orbit presheaf uses its existing ULift from Type(max(u′,v′)) to that same universe. The coefficient universe w remains independent. Composing the chart map with the slice restriction of the actual sheafification unit gives a sheaf morphism without any additional local-bijectivity assumption.

The isomorphism theorem explicitly assumes the native class J.WEqualsLocallyBijective(Type(max(u,v,u′,v′))). This makes the sheafification unit locally injective and locally surjective. Transfer its equalizer and image covering sieves through the native overEquiv, compose with the chart map, and apply the native locally-bijective sheaf criterion. Native asIso then supplies the actual inverse. The pinned instance supplies the hypothesis automatically when fibre object and morphism universes match the base universes u and v; a separate compiled test has no such hypothesis in its statement. This checkpoint does not prove an automatic instance for arbitrary larger independent fibre universes. The hypothesis is explicit in the packet, reader, native theorem, admitted projection and tests, not hidden in construction data.

The raw and sheafified chart maps commute with every native modification. Changing x along any actual isomorphism gives the same global comparison. The actual fibreHomBaseChangeIso commutes with the comparison on sections, retaining Over.map and F.mapComp. Two-sided inverse formulas apply to arbitrary global sheaf sections, without assuming they have supplied raw representatives. No assertion of global injectivity of the raw sheafification unit is made.

Eleven parameterized tests cover supplied unequal local sections, the covering image sieve of an arbitrary quotient class, every slice restriction, two chart transports, independent chart-isomorphism choices, two modifications, a further restriction after base change, preimages of arbitrary global sheaf sections, noncollapse of unequal sections after sheafification, a supplied empty local section carrier, and the automatic matched-universe instance. Conditional tests retain their witnesses. These are not new nonconstant-site or nonneutral geometric fixtures.

All 642 incoming node objects remain unchanged. The packet now has 660 nodes, 248 baseline references, 596 raw API references and 589 raw test references. Four additional existing baseline declarations are cited. The three constructions have fourteen API references and twelve references to the eleven tests. All ten gaps, 22 requests, eight source issues, ten planets and eight partial stages are preserved. The previous reader is a verbatim suffix; previous Lean text is retained after one additional import. Generic local-bijectivity, slice and sheafification machinery is reused from Mathlib. General stacks/stackification and torsor-groupoid packaging remain D0; algebraic-space carriers, diagonals and atlases remain SF1 under accepted RS27.

## Reading and provenance

The whole 44,034-character issue was read before claim 5983004920 and after bot 5983005936 confirmed that exact comment. Both reads used [0,18000], [18000,36000], [36000,44034]; body SHA256 76b4b208fdc2daf287aff24fff621ad30741280c84a8c35c7f6ac34c2ea459af. WORKERS was reread whole. Current relevant closure/API/tests/suggested-file/planet rules and unchanged own complete binding/upstream reading scopes were retained in this continuous session.

Incoming own [PR6075](https://github.com/CBirkbeck/tauceti-explorer/pull/6075), head 0f0dcb2eca49372cffe88ec9b69219376d66a219, archive 68dab44da9060df898cd2f8c36053738d7b59447, was actually recovered over public HTTP. All 72 artifacts, eleven helpers and four final deliverables were authenticated. Manifest SHA256 71725cdc1330306335f8e0a2289cc383fe8bc001ff4235ff8290fb2cc7186be3. After reading the actual recovery/verification/immutable/graph helpers, both original mathematical and publication reports were reproduced byte for byte. Incoming deliverables equal those public files.

Own6075 scopes and its authenticated own6067/6056/6045 reading chain are retained; all four reading records were reread. All 84 external controls are unchanged. Hash equality preserves those original scopes and is not a fresh whole-file reading claim. Fresh reads include the exact reviewed R09.4 audit, all ten gaps and latest three frontier entries, the whole reserved gerbe contract/API/tests and whole algebraicgeometry/gerbes keydef. The SF1 boundary, including nodes, coverage, requests and sourceWorklist, compares unchanged; its original reading limits remain.

The 57 touching research/legacy link and accepted RS02/05/06/27 files and their 144 structured entries are unchanged against the authenticated own6075 reading record, which recorded complete entry reads. A fresh research-link inventory finds the same 29 files. These scopes are reused explicitly, without adopting another worker's reading claims or claiming a fresh full read. Reading.json records consumed incoming native ranges, freshly read primary sources and pinned library ranges. The complete 4590-line incoming native prefix was authenticated and recompiled; only recorded consumed ranges are newly claimed as manual reads. Every new proof, test and adapted helper was read.

Whole displayed [Stacks Section 8.11](https://stacks.math.columbia.edu/tag/06NY) and [Section 7.49](https://stacks.math.columbia.edu/tag/00ZG) were read, including all statements, displayed proofs/diagrams and both comments each. Lemma7.49.1 has an omitted proof, 7.49.3 a sketch, and the proof linked from 7.49.5 was not recursively read. Lemma8.11.8 omits varying-base compatibility. The exact fixed-band formulas here are authored deductions from the listed prerequisites, not assertions that those sources contain the typed formulas. SourceReading.json records the fetched hashes. Existing source issues, including E6, remain; no new source error is asserted.

Exact proposed-name searches across both tracked-clean pinned source trees and current packets found no matches. ExternalSearch.json retains the bounded open Mathlib gerbe PR query; it is not an exhaustive semantic or PR/Zulip absence claim. Generic Mathlib declarations were read at their pinned statements and the new applications compiled.

## Validation and limits

Mathlib pin 082e2d37e8b0463410cdb532e111cd43d5a66174, Tau Ceti pin f790474821cf4256814db967cb154e7af3d0c369, Lean4.34.0-rc2 compiler 6a10ac8c22beadecabdbb0919c2b50214762f91d. Both pinned source trees were freshly verified tracked-clean. The full Tau-dependent Suggested.lean is **UNCOMPILED**: the alternate available Tau build is cf386627e9176a3827c1a5fe804989fd94a4d216 and a fresh probe finds no TauCeti.CategoryTheory.Sites.SheafCohomology.LongExactSequence olean. No Lake setup, cache download, library build or language server was used.

Full Native and Mathlib-only Canonical files were compiled serially in the existing pinned build, one thread, 8GiB cap and 1200-second timeout. Each run checked source/dependency pins, tracked cleanliness, compiler version and available memory≥20GiB. No compiler remains running.

- Native.lean: 4972 lines, 176 examples, exit 0, 0 warnings (0 admissions), 253 axiom audits; 39GiB available, elapsed 28.37 seconds, peak RSS 2413912KiB. Source SHA256 `4d776edebbc69bf460de38fe34432fb963573cffe98b7114f7b4c78a328f3c7f`; log SHA256 `8663c41ce6e1bcabe9182b89a4de68654afedf8d4973fe41a6432435e5b33b9b`.

- Canonical.lean: 8210 lines, 437 examples, exit 0, 972 warnings (972 admissions), 0 axiom audits; 40GiB available, elapsed 31.28 seconds, peak RSS 3865016KiB. Source SHA256 `7ffeee5eaf787b9c8e03d5f3e35561057e8d6e5d8445c78c2d8a8d80faba8976`; log SHA256 `dbaa466955b5f60e36a2718410a54cf69922f099f0217b6cbe264e8e1312535a`.

Native has 235 inherited and eighteen new audits, all 253 closures using only propext, Classical.choice and Quot.sound, with no admission or declared axiom. The planning projection retains all three actual construction bodies and admits fifteen lemmas and eleven tests. Canonical has 972 admission-only warnings: 946 inherited plus 26 new. Exact projection, all 29 new declaration/test headers, immutable prefixes and source/log receipts are checked. Compilation does not change implementation status.

The actual indexed checker reports {'packet': 'research/blueprint/packets/AlgebraicModuliForArithmeticGeometry--A0-extension.json', 'roadmap': 'AlgebraicModuliForArithmeticGeometry', 'status': 'partial', 'nodes': 660, 'kinds': {'definition': 17, 'lemma': 468, 'construction': 142, 'theorem': 28, 'comparison': 5}, 'apiItems': 588, 'unitTests': 556, 'planets': 10, 'baselineDeclarations': 248, 'prerequisites': {'baseline': 660, 'node (this packet)': 1391, 'node (blueprint)': 25, 'stage': 40}, 'gaps': 10, 'requests': 22, 'stagesInScope': 8, 'stagesClosed': 0}, without errors or warnings. Actual source-issue/version and intake checks pass. Stage DAG 3017/8655, own declaration DAG 660/1391, scoped DAG 3670/10774; all acyclic. All 24 supplier and 40 accepted touching-restructure pairs are reachable. There are no unresolved leaves or own skipped/pending links. Foreign roadmap/stage and stage-edge objects, plus sibling parts, are unchanged. All84 external guards, four incoming files and the entire SF1 boundary agree at both bases.

Mathematical base `d1d8777829517a4b36887c562340ef571c774ce1`; publication control `2c175a30fabe58e901fcdd386506ee6e2ac6280f`. Reports: Verification-math.json and Verification.json. Declaration-index SHA256 `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`. Full uncompiled Suggested.lean SHA256 `888142decdc72c5be3e601fcba37f36fef51e2147e6b51aad49dbf27356a8c3d`.

## Resume

Continue from R09.4/chart-global. Descend the existing local band actions through the actual chart comparison, prove chart independence and restriction/modification compatibility, then prove local torsor properties. Import the supplied D0 torsor-groupoid interface before establishing full faithfulness and a coherent inverse/unit/counit. Do not replace these tasks with records assuming the desired properties.

The arbitrary larger-fibre-universe native WEqualsLocallyBijective instance is not proved here. Keep the hypothesis explicit, or resolve it through existing generic supplier machinery; the matched-universe case already needs no extra assumption. Preserve actual pseudofunctor comparisons and the independent coefficient universe. Nonconstant-site/nonneutral fixtures, intrinsic descended-band/SF1, root gerbes and derived H², compatible fpqc limits and all other-stage/source obligations remain. The packet is partial.

## Script: author.py

```python
"""Append the actual fixed-band local chart comparison, preserving all prior nodes."""
from pathlib import Path
import copy,json,re,sys
S=Path(sys.argv[1]).resolve();RID='AlgebraicModuliForArithmeticGeometry';STEM=RID+'--A0-extension';P=RID+':R09.4/';NEW=P+'chart-global/';NS='TauCeti.AlgebraicGeometry.BandedMorphism.'
old=json.loads((S/'Incoming.json').read_text());p=copy.deepcopy(old);assert len(old['nodes'])==642
existing={n.get('declarationName','').removeprefix(NS):n['id']for n in old['nodes']}
specs=[
('pull-hom','selfHomTransport_pullHom','Restriction of a local Hom section in orbit coordinates','lemma',
 'For f:V→U, g:W→V and h:W→U with g followed by f equal to h, the transported isomorphism of the native pullHom of a section p equals the fibre restriction of its transported isomorphism, followed by diagonal transport along the inverse of the actual F.mapComp′ component. The equality witness and both endpoint comparisons are retained.',
 ['fibreHomTransportIsoEquiv','restrictionIso_comp','selfTransportActionIso','fibreIsomRestriction'],
 'Substitute the equality of base arrows, use the established StrongTrans composition formula, and cancel the two inverse pseudofunctor comparison components.'),
('orbit-map','selfHomChartToOrbit','The local chart map to orbit classes','construction',
 'For X in HomCategory(b,b), U in C and an actual x in F(U), construct a natural transformation from the ULift of fibreHomSheaf(b,b,U,x,x,X) to the restriction of the lifted global orbit presheaf along Over.forget U. At T→U it sends p to the class of (F(T→U)x,transport(p)). This map is defined in independent fibre universes without a local-bijectivity assumption on sheafification.',
 ['@pull-hom','selfHomOrbit_mk_transport','selfHomOrbitPresheaf','fibreHomTransportIsoEquiv'],
 'Supply the explicit represented class. The pullHom comparison gives the actual mapComp′ witness identifying its restriction with the image of the restricted section in the quotient.'),
('injective','selfHomChartToOrbit_injective','The chart map is pointwise injective','lemma',
 'At every T of Over U, the lifted chart-to-orbit component is injective. Equality is tested at the same pulled-back object, so no local or global choice of isomorphism is required.',
 ['@orbit-map','selfHomOrbit_mk_injective','fibreHomTransportIsoEquiv'],
 'Remove ULift, apply fixed-chart injectivity of the orbit quotient and injectivity of the local transport equivalence, then restore equality of lifted sections.'),
('locally-surjective','selfHomChartToOrbit_locallySurjective','Every orbit section is locally in the chart image','lemma',
 'For every actual chart x over U, the chart-to-orbit natural transformation is locally surjective for the native topology J.over U. This covers arbitrary quotient sections, and is not a claim of global surjectivity of the raw chart map.',
 ['@orbit-map','selfHomOrbit_mk_transport','fibreIsomRestriction','mathlib:CategoryTheory.Presheaf.IsLocallySurjective','mathlib:CategoryTheory.Sieve.overEquiv_iff'],
 'Induct on a represented pair (y,q). Local gerbe connectedness gives a covering sieve on which the pullbacks of y and F(T→U)x are isomorphic. Compose with the inverse actual mapComp component, diagonally transport the restricted q, and invert fibreHomTransportIsoEquiv to obtain the local preimage. Native overEquiv transfers this covering to the slice.'),
('global-map','selfHomChartToGlobal','The local chart map to the global sheaf','construction',
 'Construct an actual morphism of sheaves on J.over U from the explicit ULift of the local Hom sheaf to the restriction of selfHomGlobalSheafFunctor(b)(X). Its underlying map is chart-to-orbit followed by the slice restriction of the native sheafification unit. No WEqualsLocallyBijective assumption is needed to define this morphism.',
 ['@orbit-map','selfHomGlobalSheafFunctor'],
 'Use native sheafCompose for ULift and native Sheaf.over. Compose the proved chart natural transformation with whiskerLeft of the existing sheafification unit.'),
('is-iso','selfHomChartToGlobal_isIso','The local chart map is an isomorphism','lemma',
 'Assuming the explicit native class J.WEqualsLocallyBijective(Type(max(u,v,u′,v′))), the local chart-to-global sheaf morphism is an isomorphism. The native instance supplies this assumption automatically when the fibre object and morphism universes are u and v. No unconditional larger-universe instance is asserted.',
 ['@global-map','@injective','@locally-surjective','mathlib:CategoryTheory.GrothendieckTopology.WEqualsLocallyBijective','mathlib:CategoryTheory.Sheaf.isLocallyBijective_iff_isIso','mathlib:CategoryTheory.Presheaf.isLocallyInjective_of_injective','mathlib:CategoryTheory.Presheaf.equalizerSieve_mem','mathlib:CategoryTheory.Presheaf.imageSieve_mem','mathlib:CategoryTheory.GrothendieckTopology.overEquiv_symm_mem_over'],
 'The native class makes the unit locally injective and locally surjective. Transfer its equalizer and image covering sieves along overEquiv. Compose with the injective and locally surjective chart map; the native locally-bijective sheaf criterion then proves IsIso. No inverse is postulated.'),
('iso','selfHomChartGlobalIso','The actual local-global chart isomorphism','construction',
 'Under the explicit native WEqualsLocallyBijective class at the lifted section universe, package the proved local chart morphism and its actual inverse as a native sheaf isomorphism. Its source is the ULift of fibreHomSheaf and its target is the native restriction of the global candidate; it uses no global gerbe object beyond the particular chart U,x.',
 ['@global-map','@is-iso'],
 'Install the proved IsIso instance locally and use native asIso. The inverse is supplied by the established sheaf criterion.'),
('iso-hom','selfHomChartGlobalIso_hom','The comparison isomorphism has the specified forward map','lemma',
 'The forward morphism of selfHomChartGlobalIso is exactly selfHomChartToGlobal, under the same explicit native local-bijectivity hypothesis.',
 ['@iso','@global-map'],'Unfold native asIso.'),
('orbit-apply','selfHomChartToOrbit_apply','The chart map on a local section','lemma',
 'At T→U the chart-to-orbit map sends ULift(p) to ULift of the class represented by the actual pulled-back object F(T→U)x and fibreHomTransportIsoEquiv(p).',
 ['@orbit-map'],'Evaluate the explicit component.'),
('iso-apply','selfHomChartGlobalIso_apply','The comparison on a local section','lemma',
 'Under the explicit native local-bijectivity hypothesis, the comparison isomorphism sends a lifted local section to the image of its specified orbit class under the actual global sheafification unit.',
 ['@iso','@orbit-map'],'Evaluate the actual forward morphism and its composed natural transformation.'),
('orbit-modification','selfHomChartToOrbit_modification','Chart coordinates commute with modifications','lemma',
 'For every native fixed-band modification m:X→Y, the square of local Hom-sheaf maps, chart-to-orbit maps and the actual global orbit-presheaf map commutes as equality of natural transformations.',
 ['@orbit-map','fibreHomTransportIsoEquiv_modification','selfHomOrbitFunctor'],'Evaluate on sections, use transport-equivalence modification compatibility, and retain the actual component isomorphism inside the represented class.'),
('global-modification','selfHomChartToGlobal_modification','The sheaf comparison commutes with modifications','lemma',
 'For every native modification, the local chart-to-global morphisms intertwine the lifted local Hom-sheaf map and the restriction of the actual global sheaf map. The equality holds without WEqualsLocallyBijective.',
 ['@global-map','@orbit-modification','selfHomGlobalSheafFunctor_unit_naturality'],'Apply the sheafification unit to the orbit-level square and then use the established naturality of that unit in modifications.'),
('orbit-transport','selfHomChartToOrbit_transport','Changing the chart object leaves its orbit image unchanged','lemma',
 'For every actual e:x≅y over U, mapping a local section after selfHomSheafTransport(e) into orbit classes equals mapping the original section from the x chart, at every T→U.',
 ['@orbit-map','selfHomSheafTransport_transport','selfHomOrbit_mk_transport'],'The transported section is diagonal transport along F(T→U)(e); that actual isomorphism witnesses equality in the native quotient.'),
('orbit-base-change','selfHomChartToOrbit_baseChange','Orbit coordinates respect native local base change','lemma',
 'For f:V→U and T→V, apply the actual fibreHomBaseChangeIso to a section of the original chart pulled back along Over.map f. Its image in the chart for F(f)x equals the original chart image at (Over.map f)(T).',
 ['@orbit-map','selfHomBaseChangeIso_transport','selfHomOrbit_mk_transport'],'Use the proved base-change transport formula. The actual component of F.mapComp witnesses equality of the two represented classes.'),
('global-transport','selfHomChartToGlobal_transport','Chart-object changes commute with the global comparison','lemma',
 'For every e:x≅y, the lifted local transport morphism followed by the y-chart global comparison equals the x-chart global comparison, as actual sheaf morphisms and without a sheafification local-bijectivity assumption.',
 ['@global-map','@orbit-transport'],'Apply the same global sheafification-unit component to the orbit transport equation, then use sheaf-morphism extensionality.'),
('global-base-change','selfHomChartToGlobal_baseChange','Base change commutes with the global comparison on sections','lemma',
 'For every f:V→U and T→V, the actual local base-change isomorphism followed by the new-chart global map agrees on each section with the original chart map at (Over.map f)(T). The global target component is exactly the same object T.left.',
 ['@global-map','@orbit-base-change'],'Apply the unit at T.left to the explicit orbit base-change equation; no strictification or omitted endpoint identification is used.'),
('inverse-forward','selfHomChartGlobalIso_inv_hom','Every global section is recovered from its chart preimage','lemma',
 'Under the explicit native local-bijectivity hypothesis, applying the actual inverse comparison and then the forward comparison returns every section of the restricted global sheaf. A quotient representative for the section is not assumed.',
 ['@iso'],'Evaluate the native inverse-forward identity on an arbitrary global sheaf section.'),
('forward-inverse','selfHomChartGlobalIso_hom_inv','Every local section is recovered by the inverse comparison','lemma',
 'Under the explicit native local-bijectivity hypothesis, the inverse comparison recovers each lifted local Hom section from its forward image.',
 ['@iso'],'Evaluate the native forward-inverse identity on an arbitrary lifted local section.')]
ids={k:NEW+k for k,*_ in specs}
provides={
 'CategoryTheory.GrothendieckTopology.WEqualsLocallyBijective':'The native criterion equating sheafification equivalences and local bijectivity, with its actual universe parameters.',
 'CategoryTheory.Sheaf.isLocallyBijective_iff_isIso':'A morphism of sheaves of types is invertible exactly when locally injective and locally surjective.',
 'CategoryTheory.Presheaf.IsLocallySurjective':'The actual image-sieve covering criterion for local surjectivity.',
 'CategoryTheory.Presheaf.imageSieve_mem':'The image sieve of each target section covers for a locally surjective morphism.',
 'CategoryTheory.Presheaf.equalizerSieve_mem':'The equality sieve covers when images under a locally injective morphism agree.',
 'CategoryTheory.Presheaf.isLocallyInjective_of_injective':'Pointwise injectivity implies local injectivity.',
 'CategoryTheory.GrothendieckTopology.overEquiv_symm_mem_over':'A covering base sieve gives the corresponding covering sieve on the slice.',
 'CategoryTheory.Sieve.overEquiv_iff':'The explicit evaluation of the sieve equivalence between a slice and its underlying object.'}
index={c[1]:c for l in Path(sys.argv[2]).read_text().splitlines()if len(c:=l.split('\t'))>=5 and c[0]=='mathlib'}
refs={d['ref']for d in old['baseline']['declarations']};newbaseline=[]
for name,st in provides.items():
 if 'mathlib:'+name in refs:continue
 c=index[name];newbaseline.append(dict(ref='mathlib:'+name,kind=c[2],module=c[3],provides=st,checked='Full statement and relevant proof/instance read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; native application compiled.'))
p['baseline']['declarations']+=newbaseline;refs|={x['ref']for x in newbaseline}
remaining='The global Hom candidate now has an explicit local chart map, injectivity and local surjectivity before sheafification, and an actual sheaf comparison isomorphism under the stated native WEqualsLocallyBijective class. The matched base/fibre-universe case supplies that class automatically; the arbitrary larger-fibre-universe instance remains unproved here. Modification, chart-object transport and base change agree with the comparison. Still required: descend the actual band action and prove local torsor properties, package the supplied D0 torsor groupoid, then prove full faithfulness and a coherent inverse/unit/counit. No global injectivity or surjectivity of the raw chart map or raw sheafification unit is asserted. Intrinsic descended-band/SF1, nonconstant-site and nonneutral geometric fixtures, root gerbes and derived H², compatible fpqc limits and all other-stage/source obligations remain open.'
hyps=['C has object universe u and morphism universe v; J is any Grothendieck topology. F is an actual Cat-valued pseudofunctor with fibre object universe u′ and morphism universe v′ and IsGerbe F J. b is an actual abelian banding by A in independent coefficient universe w; morphisms and modifications are the existing native HomCategory(b,b).', 'A chart consists of an actual U and x in F(U). Sections on Over U are lifted directly by ULift(max(u,v,u′),v′); the orbit presheaf is lifted by ULift(max(u,v),max(u′,v′)). Their target universe is max(u,v,u′,v′). No global object on all of C, neutrality, or strictification of F is assumed.']
new=[]
for key,name,title,kind,st,deps,proof in specs:
 ds=[ids[d[1:]]if d.startswith('@')else d if d.startswith('mathlib:')else existing[d]for d in deps]
 assert all(d in refs or d in ids.values()or d in existing.values()for d in ds)
 h=hyps+(['The native class J.WEqualsLocallyBijective(Type(max(u,v,u′,v′))) is an explicit additional hypothesis. It is supplied by the pinned native instance for matched fibre/base universes, as checked by an independent test; its automatic availability in arbitrary larger fibre universes is not claimed.']if key in ['is-iso','iso','iso-hom','iso-apply','inverse-forward','forward-inverse']else[])
 new.append(dict(id=ids[key],parentStageId=RID+':R09.4',realises=[RID+':R09.4'],title=title,kind=kind,declarationName=NS+name,statement=st,hypotheses=h,prerequisites=ds,proofSteps=[proof],acceptance=['Use actual slice sheaves, unit, orbit representatives and pseudofunctor comparisons. Never replace the inverse or a local covering by an assumption that it exists.',remaining],uses=[dict(where=P+'self-equivalence-torsor',how='Identify the actual global candidate with local Hom sheaves before descending the band action and importing D0 torsor-groupoid packaging.')],library=dict(module='TauCeti/AlgebraicGeometry/Stacks/Gerbes',namespace=NS[:-1]),sources=[dict(sourceId='CG-sheafification-codex-7e92bd'if key in ['global-map','is-iso','iso','iso-hom','iso-apply','inverse-forward','forward-inverse']else'CG-gerbe-context-codex-7e92bd',locator='Stacks Section 7.49/tag 00ZG and Section 8.11/tag 06NY; exact fixed-band chart comparison is an authored deduction using the read native library.',excerpt='sheafification'if key in ['global-map','is-iso','iso','iso-hom','iso-apply','inverse-forward','forward-inverse']else'gerbe',match='These sections supply the general context, not the exact typed comparison. The explicit construction and coherence equations are authored from the listed prerequisites. Generic sheafification, local-bijectivity and slice machinery are imported from native Mathlib.')],implementationStatus='unchecked'))
tests=[
 ('raw_distinct','non-example','Two supplied distinct sections of the same local Hom sheaf remain distinct in the raw orbit image; their existence on every chart is not asserted.'),
 ('cover_of_arbitrary_class','compatibility','For an arbitrary lifted quotient section over a slice object, the native image sieve of the chart map covers; no global representative on the chosen chart is assumed.'),
 ('restriction_square','compatibility','The explicit chart map commutes with restriction along every slice arrow, with the actual local Hom restriction and global orbit restriction.'),
 ('two_transports','compatibility','Two successive actual changes of chart object followed by the global comparison give the original global comparison as sheaf morphisms.'),
 ('transport_choice','compatibility','Two different supplied chart-object isomorphisms give the same raw orbit image of a local section.'),
 ('two_modifications','compatibility','Two successive local modification maps followed by the global comparison equal the original comparison followed by the actual composite global modification.'),
 ('refined_base_change','compatibility','The global comparison respects local base change after an additional arbitrary slice restriction, retaining the native Over.map and fibreHomBaseChangeIso.'),
 ('arbitrary_global_section','compatibility','With the explicit native local-bijectivity class, every section of the restricted global sheaf has an actual local Hom-section preimage under the comparison, without assuming that the global section is represented in the raw quotient.'),
 ('distinct_after_sheafification','non-example','Under the same explicit class, two supplied distinct sections on one chart remain distinct under the actual global sheaf comparison. No global injectivity of the raw sheafification unit is claimed.'),
 ('empty_local_carrier','degenerate','Under the same explicit class, an empty local Hom-section carrier forces an empty restricted global-sheaf section carrier at that slice object. The chart object itself is still supplied.'),
 ('matched_universes','compatibility','When F has the same fibre object and morphism universes as the base category, the native instance proves IsIso for the actual chart map with no WEqualsLocallyBijective hypothesis in the test statement; the coefficient universe stays independent.')]
apiowners={'orbit-map':['orbit-apply','injective','locally-surjective','orbit-modification','orbit-transport','orbit-base-change'],'global-map':['is-iso','global-modification','global-transport','global-base-change'],'iso':['iso-hom','iso-apply','inverse-forward','forward-inverse']}
testowners={'orbit-map':['raw_distinct','cover_of_arbitrary_class','restriction_square','transport_choice'],'global-map':['two_transports','two_modifications','refined_base_change','matched_universes'],'iso':['arbitrary_global_section','distinct_after_sheafification','empty_local_carrier','matched_universes']}
byid={n['id']:n for n in new};td={name:(kind,st)for name,kind,st in tests}
for key,aks in apiowners.items():
 n=byid[ids[key]];n['api']=[dict(name=byid[ids[k]]['declarationName'],role='extensionality'if k=='injective'else'compatibility',statement=byid[ids[k]]['statement'])for k in aks]
 n['tests']=[dict(name='TauCeti.AlgebraicGeometry.ChartGlobalTests.'+name,kind=td[name][0],statement=td[name][1])for name in testowners[key]]
p['nodes']+=new
for c in p['coverage']:
 if c['stageId']==RID+':R09.4':c['remaining'].append(remaining)
p['summary']='Local chart comparison for the global fixed-band Hom candidate: three constructions, fifteen lemmas and eleven native tests; all stages remain partial. '+old['summary']
reads=json.loads((S/'SourceReading.json').read_text())
for tag,sid,title in [('06NY','CG-gerbe-context-codex-7e92bd','Gerbes and the fixed-band local chart comparison'),('00ZG','CG-sheafification-codex-7e92bd','Sheafification and the local-global Hom comparison')]:
 r=next(r for r in reads if r['url'].endswith(tag));p['sources'].append(dict(id=sid,title=title,authors='The Stacks Project Authors; fixed-band comparison deductions by Codex — codex-7e92bd',edition='Displayed section read 2026-10-04; exact Mathlib pin',url=r['url'],sha256=r['sha256'],accessDate='2026-10-04',readSections=[r['scope']]))
plan=dict(newNodes=[n['id']for n in new],newNames=[n['declarationName']for n in new],newAPI=sum(len(n.get('api',[]))for n in new),newTests=len(tests),newTestReferences=sum(len(n.get('tests',[]))for n in new),tests=tests,remaining=remaining,wholeIncomingObjectsPreserved=642,mathematicalContractsPreserved=642,newBaseline=newbaseline,newSources=2)
addition='# Local charts for the global fixed-band Hom sheaf\n\nCodex — codex-7e92bd, 4 October 2026. Partial continuation: three constructions and fifteen lemmas.\n\n'+remaining+'\n\n'
addition+='For a chart U,x, the native local Hom sheaf maps to the orbit presheaf restricted to Over U. The map sends a section to the represented class at the pulled-back object, using the actual StrongTrans comparison. Its naturality retains F.mapComp′ and the equality witnessing a slice arrow. Fixed-chart quotient injectivity proves injectivity. Gerbe local connectedness provides a covering on which an arbitrary represented pair can be transported into this chart; the actual composition comparison identifies the pulled-back objects. This proves local surjectivity, without asserting global surjectivity of the raw map.\n\n'
addition+='Compose with the native sheafification unit to obtain the actual local-to-global sheaf morphism. Under the explicit native WEqualsLocallyBijective class at the lifted section universe, the unit is locally bijective; native slice-sieve transfer and the native sheaf criterion prove the comparison is an isomorphism. This hypothesis is automatic for matched base/fibre universes, as an independent test verifies. It is not silently assumed automatic for arbitrary larger fibre universes. The inverse applies to all global sections, including those without a supplied raw representative. Chart-object changes, modifications and base changes commute with the actual comparison. The band action and torsor-groupoid equivalence remain subsequent tasks.\n\n'
addition+='This gerbe-specific comparison imports generic local-bijectivity, slice and sheafification machinery from the pinned native library. General stacks/stackification and torsor-groupoid packaging remain D0; algebraic-space carriers, diagonals and atlases remain SF1 under RS27. No new generic supplier theory is duplicated.\n\n'
for n in new:
 addition+='## '+n['title']+'\n\nDeclaration: **'+n['declarationName']+'**. Node: **'+n['id']+'**.\n\n'+n['statement']+'\n\nHypotheses: '+' '.join(n['hypotheses'])+'\n\nProof plan: '+' '.join(n['proofSteps'])+'\n\nPrerequisites: '+', '.join(n['prerequisites'])+'.\n\n'
 for a in n.get('api',[]):addition+='API **'+a['name']+'**: '+a['statement']+'\n\n'
 for t in n.get('tests',[]):addition+='Test **'+t['name']+'** ('+t['kind']+'): '+t['statement']+'\n\n'
addition+='All 642 prior node objects, ten gaps, 22 requests, eight source issues, ten planets and eight partial stages are preserved. All implementation statuses remain unchecked. The eleven parameterized tests have twelve references across the three constructions. The matched-universe test has no extra local-bijectivity premise. Conditional unequal-section and empty-carrier tests retain their supplied witnesses. No new nonconstant-site or nonneutral geometric fixture is claimed. The full Tau-dependent suggested file remains uncompiled.\n\nSources: [Stacks Section 8.11](https://stacks.math.columbia.edu/tag/06NY) and [Stacks Section 7.49](https://stacks.math.columbia.edu/tag/00ZG). Displayed proofs were read with their stated omissions; the generic formal statements and universe-limited instances were read at the pinned Mathlib source. Exact fixed-band formulas are authored deductions. The complete prior reader follows verbatim.\n\n'
for name,d in [('Candidate.json',p),(STEM+'.json',p),('Plan.json',plan),('new-nodes.json',new)]: (S/name).write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n')
(S/'ReaderAddition.md').write_text(addition);(S/'Reader.md').write_text(addition+(S/'IncomingReader.md').read_text())
assert len(new)==18 and sum(n['kind']=='construction'for n in new)==3
assert {NS+n for n in re.findall(r'^(?:noncomputable )?(?:def|lemma) (\w+)',(S/'NewProofs.lean').read_text(),re.M)}==set(plan['newNames'])
print(json.dumps(dict(nodes=len(p['nodes']),baseline=len(p['baseline']['declarations']),newBaseline=len(newbaseline),newAPI=plan['newAPI'],newTestReferences=plan['newTestReferences'],rawAPI=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']))))
```

## Script: projection.py

```python
"""Admit lemma/test proofs while retaining actual chart comparison construction data."""
import re
def admit_lemmas(text):
 lines=text.splitlines(keepends=True);out=[];i=0
 while i<len(lines):
  if re.match(r'^(?:lemma|theorem) |^example\b',lines[i]):
   j=i+1
   while j<len(lines)and(not lines[j].strip()or lines[j][0].isspace()):j+=1
   block=''.join(lines[i:j]);depth=0;pos=None;pending_let=0
   for k,c in enumerate(block):
    if c in '([{':depth+=1
    elif c in ')]}':depth-=1
    if depth==0 and re.match(r'let(?:I)?\b',block[k:]) and (k==0 or not (block[k-1].isalnum() or block[k-1]=='_')):
     pending_let+=1
    if block[k:k+2]==':='and depth==0:
     if pending_let:pending_let-=1
     else:pos=k;break
   assert pos is not None,block
   out.append(block[:pos]+':= by\n  sorry\n\n');i=j
  else:out.append(lines[i]);i+=1
 return ''.join(out)
def split_imports(text):
 lines=text.splitlines(keepends=True);last=max(i for i,l in enumerate(lines)if l.startswith('import '))
 assert all(not l.strip()or l.startswith(('import ','--'))for l in lines[:last+1])
 return ''.join(lines[:last+1]),''.join(lines[last+1:])

def project(proofs,tests):
 return admit_lemmas(proofs)+'\n'+admit_lemmas(tests)
```

## Script: assemble.py

```python
"""Preserve incoming prefixes; admit only new theorem and test bodies."""
from pathlib import Path
import re,sys
S=Path(sys.argv[1]).resolve();sys.path.insert(0,str(S))
from projection import project
p=(S/'NewProofs.lean').read_text();t=(S/'Tests.lean').read_text()
names=re.findall(r'^(?:noncomputable )?(?:def|lemma) (\w+)',p,re.M)
assert len(names)==18
a=''.join('#print axioms TauCeti.AlgebraicGeometry.BandedMorphism.'+n+'\n'for n in names)
n=project(p,t);assert len(re.findall(r'\bsorry\b',n))==26
for name,text in [('Audits.lean',a),('NewAdmitted.lean',n),('Native.lean',(S/'NewImports.lean').read_text()+(S/'NativePrefix.lean').read_text()+'\n'+p+'\n'+t+'\n'+a),('Canonical.lean',(S/'NewImports.lean').read_text()+(S/'MathlibPrefix.lean').read_text()+'\n'+n),('Suggested.lean',(S/'NewImports.lean').read_text()+(S/'Incoming.lean').read_text()+'\n'+n)]:
 (S/name).write_text(text)
```

## Script: handoff.py

```python
"""Publish the local-global comparison checkpoint and its exact replay helpers."""
from pathlib import Path
import hashlib,json,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd();STEM='AlgebraicModuliForArithmeticGeometry--A0-extension'
sha=lambda b:hashlib.sha256(b).hexdigest()
t='''# Local charts for the global fixed-band Hom sheaf

Codex — codex-7e92bd. Refs #672. Partial continuation; every implementation status is unchecked and all eight stages remain partial.

## Mathematical checkpoint

Three constructions and fifteen lemmas identify the actual global fixed-band Hom candidate on a chart with the existing local Hom sheaf. The constructions are the chart-to-orbit natural transformation, the chart-to-global sheaf morphism, and its proved native isomorphism under an explicit native local-bijectivity hypothesis. No inverse or local covering is assumed as new structure data.

For X in HomCategory(b,b), U in C and an actual x in F(U), map a section of fibreHomSheaf(b,b,U,x,x,X) at T→U to the orbit class represented by F(T→U)x and the actual transported isomorphism. The pullHom calculation retains the equality defining a slice arrow, the actual F.mapComp′ component and the StrongTrans comparison. It proves naturality. Fixed-chart quotient injectivity proves pointwise injectivity. Gerbe local connectedness gives a covering on which every arbitrary orbit representative can be transported into the chosen chart. The actual composition comparison identifies the two pulled-back objects, and the inverse local transport equivalence supplies a section preimage. This proves local surjectivity; raw global surjectivity is not asserted.

The source uses the direct native ULift from Type(v′) to Type(max(u,v,u′,v′)); the orbit presheaf uses its existing ULift from Type(max(u′,v′)) to that same universe. The coefficient universe w remains independent. Composing the chart map with the slice restriction of the actual sheafification unit gives a sheaf morphism without any additional local-bijectivity assumption.

The isomorphism theorem explicitly assumes the native class J.WEqualsLocallyBijective(Type(max(u,v,u′,v′))). This makes the sheafification unit locally injective and locally surjective. Transfer its equalizer and image covering sieves through the native overEquiv, compose with the chart map, and apply the native locally-bijective sheaf criterion. Native asIso then supplies the actual inverse. The pinned instance supplies the hypothesis automatically when fibre object and morphism universes match the base universes u and v; a separate compiled test has no such hypothesis in its statement. This checkpoint does not prove an automatic instance for arbitrary larger independent fibre universes. The hypothesis is explicit in the packet, reader, native theorem, admitted projection and tests, not hidden in construction data.

The raw and sheafified chart maps commute with every native modification. Changing x along any actual isomorphism gives the same global comparison. The actual fibreHomBaseChangeIso commutes with the comparison on sections, retaining Over.map and F.mapComp. Two-sided inverse formulas apply to arbitrary global sheaf sections, without assuming they have supplied raw representatives. No assertion of global injectivity of the raw sheafification unit is made.

Eleven parameterized tests cover supplied unequal local sections, the covering image sieve of an arbitrary quotient class, every slice restriction, two chart transports, independent chart-isomorphism choices, two modifications, a further restriction after base change, preimages of arbitrary global sheaf sections, noncollapse of unequal sections after sheafification, a supplied empty local section carrier, and the automatic matched-universe instance. Conditional tests retain their witnesses. These are not new nonconstant-site or nonneutral geometric fixtures.

All 642 incoming node objects remain unchanged. The packet now has 660 nodes, 248 baseline references, 596 raw API references and 589 raw test references. Four additional existing baseline declarations are cited. The three constructions have fourteen API references and twelve references to the eleven tests. All ten gaps, 22 requests, eight source issues, ten planets and eight partial stages are preserved. The previous reader is a verbatim suffix; previous Lean text is retained after one additional import. Generic local-bijectivity, slice and sheafification machinery is reused from Mathlib. General stacks/stackification and torsor-groupoid packaging remain D0; algebraic-space carriers, diagonals and atlases remain SF1 under accepted RS27.

## Reading and provenance

The whole 44,034-character issue was read before claim 5983004920 and after bot 5983005936 confirmed that exact comment. Both reads used [0,18000], [18000,36000], [36000,44034]; body SHA256 76b4b208fdc2daf287aff24fff621ad30741280c84a8c35c7f6ac34c2ea459af. WORKERS was reread whole. Current relevant closure/API/tests/suggested-file/planet rules and unchanged own complete binding/upstream reading scopes were retained in this continuous session.

Incoming own [PR6075](https://github.com/CBirkbeck/tauceti-explorer/pull/6075), head 0f0dcb2eca49372cffe88ec9b69219376d66a219, archive 68dab44da9060df898cd2f8c36053738d7b59447, was actually recovered over public HTTP. All 72 artifacts, eleven helpers and four final deliverables were authenticated. Manifest SHA256 71725cdc1330306335f8e0a2289cc383fe8bc001ff4235ff8290fb2cc7186be3. After reading the actual recovery/verification/immutable/graph helpers, both original mathematical and publication reports were reproduced byte for byte. Incoming deliverables equal those public files.

Own6075 scopes and its authenticated own6067/6056/6045 reading chain are retained; all four reading records were reread. All 84 external controls are unchanged. Hash equality preserves those original scopes and is not a fresh whole-file reading claim. Fresh reads include the exact reviewed R09.4 audit, all ten gaps and latest three frontier entries, the whole reserved gerbe contract/API/tests and whole algebraicgeometry/gerbes keydef. The SF1 boundary, including nodes, coverage, requests and sourceWorklist, compares unchanged; its original reading limits remain.

The 57 touching research/legacy link and accepted RS02/05/06/27 files and their 144 structured entries are unchanged against the authenticated own6075 reading record, which recorded complete entry reads. A fresh research-link inventory finds the same 29 files. These scopes are reused explicitly, without adopting another worker's reading claims or claiming a fresh full read. Reading.json records consumed incoming native ranges, freshly read primary sources and pinned library ranges. The complete 4590-line incoming native prefix was authenticated and recompiled; only recorded consumed ranges are newly claimed as manual reads. Every new proof, test and adapted helper was read.

Whole displayed [Stacks Section 8.11](https://stacks.math.columbia.edu/tag/06NY) and [Section 7.49](https://stacks.math.columbia.edu/tag/00ZG) were read, including all statements, displayed proofs/diagrams and both comments each. Lemma7.49.1 has an omitted proof, 7.49.3 a sketch, and the proof linked from 7.49.5 was not recursively read. Lemma8.11.8 omits varying-base compatibility. The exact fixed-band formulas here are authored deductions from the listed prerequisites, not assertions that those sources contain the typed formulas. SourceReading.json records the fetched hashes. Existing source issues, including E6, remain; no new source error is asserted.

Exact proposed-name searches across both tracked-clean pinned source trees and current packets found no matches. ExternalSearch.json retains the bounded open Mathlib gerbe PR query; it is not an exhaustive semantic or PR/Zulip absence claim. Generic Mathlib declarations were read at their pinned statements and the new applications compiled.

## Validation and limits

Mathlib pin 082e2d37e8b0463410cdb532e111cd43d5a66174, Tau Ceti pin f790474821cf4256814db967cb154e7af3d0c369, Lean4.34.0-rc2 compiler 6a10ac8c22beadecabdbb0919c2b50214762f91d. Both pinned source trees were freshly verified tracked-clean. The full Tau-dependent Suggested.lean is **UNCOMPILED**: the alternate available Tau build is cf386627e9176a3827c1a5fe804989fd94a4d216 and a fresh probe finds no TauCeti.CategoryTheory.Sites.SheafCohomology.LongExactSequence olean. No Lake setup, cache download, library build or language server was used.

Full Native and Mathlib-only Canonical files were compiled serially in the existing pinned build, one thread, 8GiB cap and 1200-second timeout. Each run checked source/dependency pins, tracked cleanliness, compiler version and available memory≥20GiB. No compiler remains running.
'''
for name in ['Native','Canonical']:
 d=json.loads((S/(name+'.receipt.json')).read_text());code=(S/(name+'.lean')).read_text();ex=sum(l.startswith('example')for l in code.splitlines())
 t+=f"\n- {name}.lean: {len(code.splitlines())} lines, {ex} examples, exit {d['exitStatus']}, {d['warnings']} warnings ({d['admissionWarnings']} admissions), {d['axiomAudits']} axiom audits; {d['availableGiBBefore']}GiB available, elapsed {d['elapsedSeconds']} seconds, peak RSS {d['maxRssKiB']}KiB. Source SHA256 `{d['sourceSha256']}`; log SHA256 `{d['logSha256']}`.\n"
t+='''
Native has 235 inherited and eighteen new audits, all 253 closures using only propext, Classical.choice and Quot.sound, with no admission or declared axiom. The planning projection retains all three actual construction bodies and admits fifteen lemmas and eleven tests. Canonical has 972 admission-only warnings: 946 inherited plus 26 new. Exact projection, all 29 new declaration/test headers, immutable prefixes and source/log receipts are checked. Compilation does not change implementation status.
'''
if (S/'Verification.json').exists():
 v=json.loads((S/'Verification.json').read_text());g=v['graph']
 t+=f"\nThe actual indexed checker reports {v['checker']}, without errors or warnings. Actual source-issue/version and intake checks pass. Stage DAG {g['stageDAG']['vertices']}/{g['stageDAG']['edges']}, own declaration DAG {g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']}, scoped DAG {g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']}; all acyclic. All {g['requiredPairs']} supplier and {g['restructurePairs']} accepted touching-restructure pairs are reachable. There are no unresolved leaves or own skipped/pending links. Foreign roadmap/stage and stage-edge objects, plus sibling parts, are unchanged. All84 external guards, four incoming files and the entire SF1 boundary agree at both bases.\n"
t+=f"\nMathematical base `{(S/'base.txt').read_text().strip()}`; publication control `{(S/'publication-base.txt').read_text().strip()}`. Reports: Verification-math.json and Verification.json. Declaration-index SHA256 `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`. Full uncompiled Suggested.lean SHA256 `{sha((S/'Suggested.lean').read_bytes())}`.\n"
t+='''
## Resume

Continue from R09.4/chart-global. Descend the existing local band actions through the actual chart comparison, prove chart independence and restriction/modification compatibility, then prove local torsor properties. Import the supplied D0 torsor-groupoid interface before establishing full faithfulness and a coherent inverse/unit/counit. Do not replace these tasks with records assuming the desired properties.

The arbitrary larger-fibre-universe native WEqualsLocallyBijective instance is not proved here. Keep the hypothesis explicit, or resolve it through existing generic supplier machinery; the matched-universe case already needs no extra assumption. Preserve actual pseudofunctor comparisons and the independent coefficient universe. Nonconstant-site/nonneutral fixtures, intrinsic descended-band/SF1, root gerbes and derived H², compatible fpqc limits and all other-stage/source obligations remain. The packet is partial.
'''
for name in ['author.py','projection.py','assemble.py','handoff.py','verify.py','graph.py','immutable_view.py','compile.py','runcheck.py','package.py','recover-incoming.py']:
 t+='\n## Script: '+name+'\n\n```python\n'+(S/name).read_text()+'```\n'
assert all(l.rstrip()==l for l in t.splitlines())
(S/'HandoffBase.md').write_text(t);(S/'Handoff.md').write_text(t)
for folder,ext,name in [('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','Handoff.md')]:
 (R/'research/blueprint'/folder/(('BP-'if folder=='handoff'else'')+STEM+'.'+ext)).write_bytes((S/name).read_bytes())
```

## Script: verify.py

```python
"""Run exact preservation and actual immutable checker/intake/atlas; never Lean."""
from pathlib import Path
import ast,copy,hashlib,json,os,re,subprocess,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd().resolve();sys.path.insert(0,str(S))
RID='AlgebraicModuliForArithmeticGeometry';STEM=RID+'--A0-extension';NS='TauCeti.AlgebraicGeometry.BandedMorphism.'
sha=lambda b:hashlib.sha256(b).hexdigest()
def txt(n):return (S/n).read_text()
def data(n):return json.loads(txt(n))
MATH=txt('base.txt').strip();BASE=os.environ.get('MODULI_VALIDATE_BASE',txt('publication-base.txt').strip())
def blob(ref,path):return subprocess.check_output(['git','show',ref+':'+path],cwd=R)
paths=['research/blueprint/'+folder+'/'+('BP-'if folder=='handoff'else'')+STEM+'.'+ext for folder,ext in [('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
texts={p:txt(n)for p,n in zip(paths,['Candidate.json','Reader.md','Suggested.lean','PublicHandoff.md'if (S/'PublicHandoff.md').exists()else'Handoff.md'])}
assert texts[paths[-1]].startswith(txt('HandoffBase.md'))
for p,n in zip(paths,['Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert blob(MATH,p)==(S/n).read_bytes()==blob(BASE,p),p
p=data('Candidate.json');old=data('Incoming.json');plan=data('Plan.json')
assert len(old['nodes'])==642 and len(p['nodes'])==660 and p['nodes'][642:]==data('new-nodes.json')
assert p['nodes'][:642]==old['nodes'] and set(p)==set(old)
for k in old:
 if k not in ['nodes','summary','sources','coverage','baseline']:assert p[k]==old[k],k
assert p['summary'].endswith(old['summary'])and p['sources'][:-2]==old['sources']
expectedBaseline=copy.deepcopy(old['baseline'])
expectedBaseline['declarations']+=plan['newBaseline']
assert p['baseline']==expectedBaseline and len(p['baseline']['declarations'])==248
for a,b in zip(old['coverage'],p['coverage']):
 if a['stageId']==RID+':R09.4':assert b['remaining']==a['remaining']+[plan['remaining']]and {k:v for k,v in a.items()if k!='remaining'}=={k:v for k,v in b.items()if k!='remaining'}
 else:assert a==b
assert p['status']=='partial'and all(n['implementationStatus']=='unchecked'for n in p['nodes'])
assert data('Search.json')['names']==plan['newNames'] and all(q['exitStatus']==1 and q['matches']==[]for q in data('Search.json')['searches'])
assert len(p['gaps'])==10 and len(p['requests'])==22 and len(p['sourceIssues'])==8 and len(p['coverage'])==8
assert txt('Reader.md')==txt('ReaderAddition.md')+txt('IncomingReader.md')
from projection import project
proofs=txt('NewProofs.lean');tests=txt('Tests.lean');admitted=txt('NewAdmitted.lean')
assert admitted==project(proofs,tests)
assert len(re.findall(r'\bsorry\b',admitted))==26
assert txt('Native.lean')==txt('NewImports.lean')+txt('NativePrefix.lean')+'\n'+proofs+'\n'+tests+'\n'+txt('Audits.lean')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',txt('Native.lean'))
assert txt('Canonical.lean')==txt('NewImports.lean')+txt('MathlibPrefix.lean')+'\n'+admitted
assert txt('Suggested.lean')==txt('NewImports.lean')+txt('Incoming.lean')+'\n'+admitted
pm=data('IncomingManifest.json')
assert sha((S/'IncomingManifest.json').read_bytes())=='71725cdc1330306335f8e0a2289cc383fe8bc001ff4235ff8290fb2cc7186be3'
for n,source in [('NativePrefix.lean','Native.lean'),('MathlibPrefix.lean','Canonical.lean'),('Incoming.lean','Suggested.lean')]:assert sha((S/n).read_bytes())==pm[source]['sha256']
assert txt('IncomingVerification-replayed.json')==txt('PreviousVerification.json')and sha((S/'IncomingVerification-replayed.json').read_bytes())==pm['Verification.json']['sha256']
assert txt('IncomingMathematicalVerification-replayed.json')==txt('PreviousMathematicalVerification.json') and sha((S/'IncomingMathematicalVerification-replayed.json').read_bytes())==pm['Verification-math.json']['sha256']
def headers(text):
 out={};ex=0
 for m in re.finditer(r'^(?:noncomputable )?(def|lemma|example)\b(?: (\w+))?',text,re.M):
  depth=0;end=None;pending_let=0
  for i in range(m.start(),len(text)):
   c=text[i]
   if c in '([{⟨':depth+=1
   elif c in ')]}⟩':depth-=1
   if depth==0 and re.match(r'let(?:I)?\b',text[i:]) and (i==0 or not (text[i-1].isalnum() or text[i-1]=='_')):pending_let+=1
   if depth==0 and text.startswith(':=',i):
    if pending_let:pending_let-=1;continue
    end=i;break
   if depth==0 and m[1]=='def'and text.startswith('where',i)and text[i-1].isspace()and text[i+5].isspace():end=i;break
  assert end is not None
  name=m[2]if m[1]!='example'else'example#'+str(ex)
  if m[1]=='example':ex+=1
  assert name not in out;out[name]=' '.join(text[m.start():end].split())
 return out
nh=headers(proofs);th=headers(tests);ch=headers(admitted)
assert len(nh)==18 and len(th)==11 and ch=={**nh,**th}
assert {NS+n for n in nh}==set(plan['newNames'])=={n['declarationName']for n in p['nodes'][642:]}
assert txt('Audits.lean')==''.join('#print axioms '+NS+n+'\n'for n in nh)
assert all(len(n['api'])>=3 and len(n['tests'])>=3 for n in p['nodes'][642:]if n['kind']=='construction')
assert sum(len(n.get('api',[]))for n in p['nodes'])==596
assert sum(len(n.get('tests',[]))for n in p['nodes'])==589
for n in p['nodes'][642:]:
 assert n['declarationName']in texts[paths[1]]and n['statement']in texts[paths[1]]
 for x in n.get('api',[])+n.get('tests',[]):assert x['name']in texts[paths[1]]and x['statement']in texts[paths[1]]
for name,kind,st in plan['tests']:assert '-- test: ChartGlobalTests.'+name in tests and st in texts[paths[1]]
compilation={}
for name,want,audits,examples in [('Native',0,253,176),('Canonical',972,0,437)]:
 rec=data(name+'.receipt.json');log=txt(name+'.log')
 assert rec['exitStatus']==0 and rec['availableGiBBefore']>=20
 assert rec['sourceSha256']==sha((S/(name+'.lean')).read_bytes())and rec['logSha256']==sha(log.encode())
 assert ': error'not in log and log.count('warning:')==log.count('warning: declaration uses `sorry`')==want
 assert 'Exit status: 0'in log
 assert len(re.findall(r'^example\b',txt(name+'.lean'),re.M))==examples
 a=re.findall(r'depends on axioms:\s*\[([^]]*)\]',log);assert len(a)==audits
 assert 'sorryAx'not in log and all(set(v.strip()for v in x.replace('\n',' ').split(','))<={'propext','Classical.choice','Quot.sound'}for x in a)
 compilation[name]={**rec,'lines':len(txt(name+'.lean').splitlines()),'examples':examples}
assert set(plan['newNames'])<={n for n in re.findall(r"'([^']+)' depends on axioms:",txt('Native.log'))}
for g in data('InputGuard.json'):assert sha(blob(MATH,g['path']))==g['sha256']==sha(blob(BASE,g['path'])),g['path']
reuse=data('OwnReadingReuse.json')
assert len(reuse)==84 and all(q['unchanged']for q in reuse)
assert {q['path']for q in reuse}<={q['path']for q in data('InputGuard.json')}
om=data('OwnPreviousManifest.json')
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='71725cdc1330306335f8e0a2289cc383fe8bc001ff4235ff8290fb2cc7186be3'
for original in ['Reading.json','InputGuard.json','Candidate.json','SFBoundary.json']:
 assert sha((S/('OwnPrevious'+original)).read_bytes())==om[original]['sha256']
for original,m in pm.items():
 if original.startswith(('OwnPrevious','Own6067')):
  assert sha((S/('Own6075'+original)).read_bytes())==m['sha256'],original
for original,pin in [('OwnPreviousManifest.json','c899a5476df088bf899ceeedf25f34c1f4426a323f9afad93607162d4c5599aa'),('Own6067OwnPreviousManifest.json','188f9f17676fed64bfe36ce2a9197b24a228d6ad9a5efe5c171f585fabba8214'),('Own6067OwnInheritedManifest.json','bc24350852864995d87a1f842319f87e5882547ce4e9ab3e7a8e10f7ad2608af')]:
 assert sha((S/('Own6075'+original)).read_bytes())==pin
links=data('TouchingLinks.json');assert len(links)==57 and sum(len(x['entries'])for x in links)==144
for link in links:
 assert sha(blob(MATH,link['path']))==link['sha256']==sha(blob(BASE,link['path']))
 def contains(obj,wanted):
  if obj==wanted:return True
  if isinstance(obj,dict):return any(contains(v,wanted)for v in obj.values())
  if isinstance(obj,list):return any(contains(v,wanted)for v in obj)
  return False
 parsed=json.loads(blob(MATH,link['path']))
 for entry in link['entries']:assert contains(parsed,entry['entry'])
assert len(data('CurrentLinkFiles.json'))==29 and set(data('CurrentLinkFiles.json'))<={g['path']for g in data('InputGuard.json')}
for ref in [MATH,BASE]:
 links=subprocess.check_output(['git','ls-tree','-r','--name-only',ref,'research/blueprint/links'],cwd=R,text=True).splitlines()
 assert {f for f in links if f.endswith('.json')and RID.encode()in blob(ref,f)}==set(data('CurrentLinkFiles.json'))
assert data('SourcePins.json')=={'mathlib':{'head':'082e2d37e8b0463410cdb532e111cd43d5a66174','trackedStatus':''},'TauCeti':{'head':'f790474821cf4256814db967cb154e7af3d0c369','trackedStatus':''}}
assert sha(Path(sys.argv[2]).read_bytes())=='86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1'
own=data('OwnPreviousCandidate.json')
assert old==own
assert data('Reading.json')['worker']=='Codex — codex-7e92bd'
assert data('ClaimReceipt.json')['claim']==5983004920 and data('ClaimReceipt.json')['confirmation']==5983005936
assert data('TauProbe.json')['fullTauCompiled'] is False
sf=data('SFBoundary.json')
def boundary(raw):
 q=json.loads(raw);return dict(nodes=[n for n in q['nodes']if n['parentStageId']=='SchemeAndStackFoundations:SF.1'],coverage=[c for c in q['coverage']if c['stageId']=='SchemeAndStackFoundations:SF.1'],requests=q['requests'],sourceWorklist=q['sourceWorklist'])
assert boundary(blob(MATH,sf['path']))==sf['boundary']==boundary(blob(BASE,sf['path']))
for ref in [MATH,BASE]:
 own=next(j for j in json.loads(blob(ref,'research/blueprint/queue.json'))['jobs']if j['id']=='BP-'+STEM);contract={k:v for k,v in own.items()if k not in ['state','note']}
 if ref==MATH:job_contract=contract
 else:assert contract==job_contract
if (S/'artifact-manifest.json').exists():
 for name,m in data('artifact-manifest.json').items():
  b=(S/name).read_bytes();assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],name
for path,t in texts.items():
 assert not re.search(r'[ \t]+$',t,re.M),path
 assert not re.search(r'/(?:home|Users|tmp)/|file'+'://',t),path
os.environ['MODULI_VALIDATE_BASE']=BASE
import immutable_view;assert immutable_view.BASE==BASE
for path,t in texts.items():immutable_view.CACHE[path]=t.encode()
immutable_view.install();sys.path.insert(0,str(R/'scripts'))
import check_blueprint,source_issues,check_errata
index=check_blueprint.load_index(Path(sys.argv[2]));assert index[0]is not None
errors,warnings,summary=check_blueprint.check(S/(STEM+'.json'),index,check_blueprint.world());assert not errors and not warnings,(errors,warnings)
issues=source_issues.check_issues(p['sourceIssues'],RID)+check_errata.versions_checked(p,p['sourceIssues']);assert not issues,issues
summary['packet']=paths[0]
tree=ast.parse((R/'research/blueprint/intake.py').read_text());wanted={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id in {'ALLOWED','PRIVATE'}for t in n.targets)or isinstance(n,ast.FunctionDef)and n.name in wanted]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs']if j['id']=='BP-'+STEM)
problems=[x for f,t in texts.items()for x in env['file_problems'](f,t)];refusals=env['auto_refusals'](job,paths,False,{'codex-7e92bd'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'MODULI_VALIDATE_BASE':BASE}));assert graph['worldCommit']==BASE
print(json.dumps(dict(worldCommit=BASE,checker=summary,checkerErrors=errors,checkerWarnings=warnings,intakeProblems=problems,intakeRefusals=refusals,sourceIssueErrors=issues,preservedWholeNodeObjects=642,preservedMathematicalContracts=642,newDeclarations=18,newConstructions=3,newAPI=14,newTests=11,newTestReferences=12,rawAPI=596,rawTests=589,matchedNewHeaders=29,compilation=compilation,fullTauCetiCompiled=False,externalInputGuards=len(data('InputGuard.json')),incomingDeliverableGuards=len(paths),sf1BoundaryPreserved=True,indexSha256=sha(Path(sys.argv[2]).read_bytes()),graph=graph,LeanExecuted=False),indent=2))
```

## Script: graph.py

```python
from pathlib import Path
import os,sys,json,collections,copy,hashlib
R=Path.cwd();S=Path(sys.argv[1]);RID='AlgebraicModuliForArithmeticGeometry';STEM=RID+'--A0-extension'
os.environ.setdefault('MODULI_VALIDATE_BASE',(S/'publication-base.txt').read_text().strip())
sys.path.insert(0,str(S));import immutable_view;immutable_view.install()
sys.path.insert(0,str(R/'scripts'))
import check_blueprint
p=json.loads((S/'Candidate.json').read_text())
old=json.loads((S/'Incoming.json').read_text())
nodes={n['id']:n for n in p['nodes']}
import build,blueprints
packets,documents,definitions=blueprints.load_promoted(R)
keep=[x for x in packets if x[0]!=STEM];documents[STEM]='research/blueprint/readmes/'+STEM+'.md'
def assemble(candidate):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(STEM,candidate)]),copy.deepcopy(documents),copy.deepcopy(definitions))
 return build.assemble(require_distances=False)[0]
a=assemble(p);b=assemble(old)
world={}
for folder in ['data/decompositions','data/blueprints','research/blueprint/packets']:
 for file in sorted((R/folder).glob('*.json')):
  for n in json.loads(file.read_text()).get('nodes',[]):world.setdefault(n['id'],n)
world.update(nodes)
listedstageids={x['id'] for x in a['stages']}
stageids=listedstageids|set(check_blueprint.world()[1])
se={(e['source'],e['target']) for e in a['stageEdges']}
assert se=={(e['source'],e['target']) for e in b['stageEdges']}
assert a['stageEdges']==b['stageEdges'],'stage edge objects changed'
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
roadmap=json.loads((R/('research/blueprint/atlas/roadmaps/'+RID+'.json')).read_text())
pairs={(d,RID+':'+s['key']) for s in roadmap['stages'] for d in s.get('requires',[])}
pairs|={(d,stageof(nid)) for nid,n in nodes.items() for d in n['prerequisites'] if d in stageids and d not in world and d!=stageof(nid)}
pairs|={(stageof(q['supplier']),stageof(v)) for q in p['requests'] for v in q['neededBy'] if stageof(q['supplier'])!=stageof(v)}
rspairs=set()
for file in (R/'research/blueprint/restructure').glob('*.result.json'):
 rs=json.loads(file.read_text())
 if rs.get('review',{}).get('status')!='accepted':continue
 rspairs|={(x['source'],x['target']) for x in rs.get('links',[]) if x['source'].startswith(RID+':') or x['target'].startswith(RID+':')}
assert all(reachable(s,t) for s,t in pairs|rspairs),sorted((s,t) for s,t in pairs|rspairs if not reachable(s,t))
ar={r['id']:r for r in a['roadmaps']};br={r['id']:r for r in b['roadmaps']}
assert ar[RID]['blueprint']['declarations']-br[RID]['blueprint']['declarations']==len(nodes)-len(old['nodes'])
otherparts=[x for x in keep if x[0].startswith(RID+'--')]
assert ar[RID]['blueprint']['declarations']==len(nodes)+sum(len(q['nodes']) for _,q in otherparts)
assert not ar[RID]['blueprint']['skippedLinks'] and not ar[RID].get('pendingLinks',[])
def skips(r):return r.get('blueprint',{}).get('skippedLinks',[]),r.get('pendingLinks',[])
assert all(skips(ar[x])==skips(br[x]) for x in br if x!=RID)
assert all(ar[x]==br[x] for x in br if x!=RID),'foreign roadmap changed'
foreign_a={q['id']:q for q in a['stages'] if q.get('owner')!=RID}
foreign_b={q['id']:q for q in b['stages'] if q.get('owner')!=RID}
assert foreign_a==foreign_b,'foreign stage changed'
assert not ar[RID]['blueprint']['skippedLinks']
summary={'worldCommit':immutable_view.BASE,'stageDAG':dag(listedstageids,se),'ownDeclarationDAG':dag(nodes,ownedges),'scopedDAG':dag(listedstageids|seen,se|de),'reachableDeclarations':len(seen),'externalDeclarations':sorted(seen-set(nodes)),'baselineLeaves':len(baseref),'requiredPairs':len(pairs),'restructurePairs':len(rspairs),'unresolved':sorted(unresolved),'ownSkippedLinks':[],'ownPendingLinks':[],'otherSkipsMatch':True,'fullForeignRoadmapsMatch':True,'fullForeignStagesMatch':True,'otherParts':{stem:len(q['nodes']) for stem,q in otherparts},'stageEdgesUnchanged':True}
summary['immutableInputPathsRead']=len(immutable_view.READS);summary['immutableReadPathsSha256']=hashlib.sha256(json.dumps(sorted(immutable_view.READS)).encode()).hexdigest()
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
BASE = os.environ.get('MODULI_VALIDATE_BASE', 'a29a5de40a8f9ea98f544153013ca05c7aca8649')
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
name=sys.argv[4];assert name in {'Native.lean','Canonical.lean','Published.lean','AdmittedTyping.lean','Prototype.lean','Sketch.lean','Context.lean'}
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
env=os.environ.copy();env['LEAN_PATH']=os.pathsep.join(str(p) for p in libs+[out])
extra=['-o',str(out/'Context.olean')]if name=='Context.lean'else[]
result=subprocess.run(['/usr/bin/time','-v','timeout','1200',str(lean),'-j','1','-M','8192']+extra+[str(out/name)],env=env,cwd=out)
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
STEM='AlgebraicModuliForArithmeticGeometry--A0-extension'
suggested=R/'research/blueprint/suggested'/(STEM+'.lean')
sha=lambda b:hashlib.sha256(b).hexdigest()
NAMES=['AlgebraicModuliForArithmeticGeometry--A0-extension.json', 'Incoming.json', 'Incoming.lean', 'IncomingReader.md', 'IncomingHandoff.md', 'IncomingManifest.json', 'NewImports.lean', 'NativePrefix.lean', 'MathlibPrefix.lean', 'IncomingVerification-replayed.json', 'IncomingMathematicalVerification-replayed.json', 'PreviousMathematicalVerification.json', 'PreviousVerification.json', 'PreviousRecovery.json', 'PreviousHead.txt', 'ClaimReceipt.json', 'Reading.json', 'SourceReading.json', 'Search.json', 'ExternalSearch.json', 'Worklist.json', 'OwnReadingReuse.json', 'OwnPreviousReading.json', 'OwnPreviousInputGuard.json', 'OwnPreviousManifest.json', 'OwnPreviousSFBoundary.json', 'OwnPreviousCandidate.json', 'InputGuard.json', 'SFBoundary.json', 'TauProbe.json', 'SourcePins.json', 'TouchingLinks.json', 'CurrentLinkFiles.json', 'Native.lean', 'Native.log', 'Native.receipt.json', 'NewProofs.lean', 'Tests.lean', 'Audits.lean', 'NewAdmitted.lean', 'Canonical.lean', 'Canonical.log', 'Canonical.receipt.json', 'Candidate.json', 'Reader.md', 'ReaderAddition.md', 'Suggested.lean', 'Handoff.md', 'HandoffBase.md', 'Plan.json', 'new-nodes.json', 'Verification-math.json', 'Verification.json', 'base.txt', 'publication-base.txt', 'author.py', 'projection.py', 'assemble.py', 'handoff.py', 'verify.py', 'graph.py', 'immutable_view.py', 'compile.py', 'runcheck.py', 'package.py', 'recover-incoming.py', 'Own6075Own6067OwnInheritedInputGuard.json', 'Own6075Own6067OwnInheritedManifest.json', 'Own6075Own6067OwnInheritedReading.json', 'Own6075Own6067OwnPreviousInputGuard.json', 'Own6075Own6067OwnPreviousManifest.json', 'Own6075Own6067OwnPreviousReading.json', 'Own6075OwnPreviousCandidate.json', 'Own6075OwnPreviousInputGuard.json', 'Own6075OwnPreviousManifest.json', 'Own6075OwnPreviousReading.json', 'Own6075OwnPreviousSFBoundary.json']
if mode=='archive':
 meta={n:dict(sha256=sha((S/n).read_bytes()),bytes=len((S/n).read_bytes()),lines=len((S/n).read_bytes().splitlines()))for n in NAMES}
 mb=(json.dumps(meta,indent=2,sort_keys=True)+'\n').encode();(S/'artifact-manifest.json').write_bytes(mb)
 payload={n:dict(sha256=sha((S/n).read_bytes()),data=base64.b64encode(zlib.compress((S/n).read_bytes(),9)).decode())for n in NAMES+['artifact-manifest.json']}
 pb=(json.dumps(payload,sort_keys=True,separators=(',',':'))+'\n').encode();(S/'payload.json').write_bytes(pb)
 report=dict(artifacts=len(NAMES),helpers=sum(n.endswith('.py')for n in NAMES),manifestSha256=sha(mb),payloadSha256=sha(pb))
 (S/'package.json').write_text(json.dumps(report,indent=2)+'\n')
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED LOCAL GLOBAL HOM COMPARISON PAYLOAD\n'+pb+b'END ARCHIVED LOCAL GLOBAL HOM COMPARISON PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated global fixed-band Hom evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='AlgebraicModuliForArithmeticGeometry--A0-extension'
ARCHIVE=__ARCHIVE__
MANIFEST_SHA=__MANIFEST__
PAYLOAD_SHA=__PAYLOAD__
EXPECTED=__EXPECTED__
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED LOCAL GLOBAL HOM COMPARISON PAYLOAD\\n',1)[1].split('END ARCHIVED LOCAL GLOBAL HOM COMPARISON PAYLOAD -/',1)[0].encode()
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
for folder,ext,name in [('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','PublicHandoff.md')]:
 path='research/blueprint/'+folder+'/'+('BP-'if folder=='handoff'else'')+RID+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder]and b==(S/name).read_bytes(),path
 (S/name).write_bytes(b);public[path]=sha(b)
fence=chr(96)*3;handoff=(S/'PublicHandoff.md').read_text()
assert handoff.startswith((S/'HandoffBase.md').read_text())
for name in meta:
 if name.endswith('.py'):
  publicCode=handoff.split('## Script: '+name+'\\n\\n'+fence+'python\\n',1)[1].split('\\n'+fence+'\\n',1)[0]+'\\n'
  assert publicCode.encode()==(S/name).read_bytes(),'Public helper differs: '+name
code=handoff.split('## Script: recover.py\\n\\n'+fence+'python\\n',1)[1].split('\\n'+fence+'\\n',1)[0]+'\\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from public handoff.'
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\\n');print(json.dumps(receipt,indent=2))
'''
 for key,val in [('__ARCHIVE__',archive),('__MANIFEST__',p['manifestSha256']),('__PAYLOAD__',p['payloadSha256']),('__EXPECTED__',expected)]:code=code.replace(key,repr(val))
 compile(code,'recover.py','exec');(S/'recover.py').write_text(code)
 prose=f'''
## Public recovery and replay

Archive commit `{archive}` is an ancestor changing only this issue's suggested file. Its {p['artifacts']} inert artifacts include all {p['helpers']} authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `{p['manifestSha256']}`; payload SHA256 `{p['payloadSha256']}`. The final suggested file has no archive payload and preserves the complete Tau Ceti-import planning text.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and four final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set MODULI_VALIDATE_BASE to the mathematical base to reproduce Verification-math.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Canonical.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean is the Mathlib-only projection; Suggested.lean is the complete uncompiled Tau Ceti-import file. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

'''
 text=(S/'Handoff.md').read_text()+prose+'```python\n'+code+'```\n'
 (S/'PublicHandoff.md').write_text(text)
 (R/'research/blueprint/handoff'/('BP-'+STEM+'.md')).write_text(text)
 suggested.write_bytes((S/'Suggested.lean').read_bytes())
 print(json.dumps(dict(archive=archive,recoverySha256=sha(code.encode()),finalHandoffSha256=sha(text.encode())),indent=2))
else:raise ValueError(mode)
```

## Script: recover-incoming.py

```python
"""Recover public authenticated global fixed-band Hom evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='AlgebraicModuliForArithmeticGeometry--A0-extension'
ARCHIVE='68dab44da9060df898cd2f8c36053738d7b59447'
MANIFEST_SHA='71725cdc1330306335f8e0a2289cc383fe8bc001ff4235ff8290fb2cc7186be3'
PAYLOAD_SHA='20790ed51cf4cdfa6d7e837993e93190fae76385125d2814a345317896b6081b'
EXPECTED={'packets': 'a4ddc7077c528fe0ff7e50f64b3b6282bfb862b2091f8c8a0b68dc8eceb1adea', 'readmes': '1f8ad713947383c5d1d082531a42db9d35f97f738f38508995bc4c421e749275', 'suggested': '4b068404fbbcc5d9f94ea19010d52262edf9fbf0ffa18aff752207d9bf53beb2'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED GLOBAL FIXED BAND HOM PAYLOAD\n',1)[1].split('END ARCHIVED GLOBAL FIXED BAND HOM PAYLOAD -/',1)[0].encode()
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
for folder,ext,name in [('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','PublicHandoff.md')]:
 path='research/blueprint/'+folder+'/'+('BP-'if folder=='handoff'else'')+RID+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder]and b==(S/name).read_bytes(),path
 (S/name).write_bytes(b);public[path]=sha(b)
fence=chr(96)*3;handoff=(S/'PublicHandoff.md').read_text()
assert handoff.startswith((S/'HandoffBase.md').read_text())
for name in meta:
 if name.endswith('.py'):
  publicCode=handoff.split('## Script: '+name+'\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
  assert publicCode.encode()==(S/name).read_bytes(),'Public helper differs: '+name
code=handoff.split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from public handoff.'
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
