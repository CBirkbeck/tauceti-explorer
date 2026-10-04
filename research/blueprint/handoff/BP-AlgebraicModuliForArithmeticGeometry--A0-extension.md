# The global fixed-band Hom sheaf candidate

Codex — codex-7e92bd. Refs #672. Partial continuation; every implementation status is unchecked and all eight stages remain partial.

## Mathematical checkpoint

Six constructions and sixteen lemmas supply an actual global candidate sheaf and its functor on the full native fixed-band modification category. For X in HomCategory(b,b), form pairs (x,p:x≅X(x)) over U and identify them by the existing diagonal transport along an actual isomorphism e:x≅y. The relation is a proved native Setoid. Its native Quotient has the exact equality criterion and retains distinct arrows at a fixed chart: all loop transports are identity by fixed-band independence.

Restriction uses the actual StrongTrans fibre-isomorphism map. Representative independence follows from the existing transport/restriction square. Identity and composition are proved using F.mapId and F.mapComp as witnesses in the quotient, without strictifying the pseudofunctor. Modifications act by postcomposition with their actual component isomorphisms; these maps commute with restriction and preserve identities, compositions and inverses. They give the actual orbit-presheaf functor.

Postcompose with native ULift and then apply the existing Mathlib presheafToSheaf functor. The raw carrier universe is max(u′,v′); sheaves use max(u,v,u′,v′), so the native concrete-type sheafification instance applies. The coefficient universe w remains independent. No global object, neutrality, coherent choice of fibre isomorphisms, or extra sheafification assumption is required. The global candidate has actual modification maps, a natural sheafification unit, inverse compatibility, hom extensionality and unique extension to every target sheaf.

The raw quotient is not claimed to be a sheaf. If the fibre is empty its raw section carrier is empty; the sheafified carrier is not claimed empty. Injectivity or surjectivity of the unit is not asserted. The candidate is not yet identified with the earlier local fibreHomSheaf on every chart. Its band action and local torsor property are still required, before using the supplied D0 torsor groupoid and proving full faithfulness and a coherent inverse/unit/counit.

Fifteen parameterized native tests cover transport chains, supplied distinct arrows, empty fibres, two restrictions, changed representatives, the actual identity comparison, inverse modifications, two modifications interleaved with two restrictions, a modification supplied to change a fibre arrow, unit restrictions, the unit on explicit pairs, arbitrary universal targets, extensionality on all represented pairs, inverse maps on arbitrary sheafified sections, and equality of composite presheaf/sheaf maps. Conditional tests retain supplied witnesses; no new nonconstant-site or nonneutral geometric fixture is claimed.

All 620 incoming node objects remain unchanged. The packet has 642 nodes, 244 baseline references, 582 raw API references and 577 raw test references. There are 23 new API references and 21 references to the 15 new tests across six constructions. Eleven actual existing baseline declarations were newly read and cited. All ten gaps, 22 requests, eight source issues, ten planets and eight partial stages are preserved. The previous reader is a verbatim suffix. Every previous Lean body is retained byte for byte after two additional Mathlib import lines. Generic quotient and sheafification machinery is reused; general stacks/stackification and torsor-groupoid interfaces remain D0, and algebraic-space carriers/diagonals/atlases remain SF1 under accepted RS27.

## Reading and provenance

The whole 44,034-character issue was read before claim 5980587779 and after bot 5980589194 confirmed that exact comment. Both reads used [0,16000], [16000,32000], [32000,44034]; body SHA256 76b4b208fdc2daf287aff24fff621ad30741280c84a8c35c7f6ac34c2ea459af. WORKERS was reread whole. Blueprint PROTOCOL 1–245 and 365–575, expansion PROTOCOL and UPSTREAM_GUIDE were freshly read, with unchanged own continuous-session scopes retained for other binding sections.

Incoming own [PR6067](https://github.com/CBirkbeck/tauceti-explorer/pull/6067), head b3e88fa4a13744bb9f5530ba9dff6f388568d018, archive 0e1436f5f79203563e911ada10d293dba7044ca2, was actually recovered over public HTTP. All 66 artifacts, eleven helpers and four final deliverables were authenticated. Manifest SHA256 c899a5476df088bf899ceeedf25f34c1f4426a323f9afad93607162d4c5599aa. After personally reading the actual verifier/immutable/graph helpers, both its mathematical and publication reports were reproduced byte for byte. Current incoming deliverables equal those public files.

Own6067 scopes and its authenticated own6056/6045 reading chain are retained. All 57 prior controls are unchanged; equality authenticates those original scopes rather than fresh whole-file readings. Fresh reads include the exact reviewed R09.4 library audit, all current gaps and latest four frontier entries, the whole reserved gerbe contract/API/tests and whole algebraic-geometry keydefs gerbes entry. The entire SF1 boundary was compared equal, including nodes, coverage, requests and sourceWorklist; its prior reading limits remain.

All 144 current structured touching entries in 57 research/legacy link and accepted RS02/05/06/27 files were read in full. The 29 current research-link files are guarded. Together with prior controls, InputGuard.json has 84 distinct paths. Consumed incoming native ranges are 1–46, 464–537, 539–737, 933–1016, 1031–1134 and 1745–1905. The entire 4190-line prefix was authenticated and recompiled; a new whole-file manual audit is not claimed. All new proofs, tests and adapted helpers were read. Reading.json gives exact native source ranges and hashes for Quotient, sheafification, the concrete-type instance, whiskering and ULift.

Whole displayed [Stacks Section8.11](https://stacks.math.columbia.edu/tag/06NY) and [Section7.49](https://stacks.math.columbia.edu/tag/00ZG) were read, including all statements, displayed proofs/diagrams and both comments each. The omitted proof of Lemma7.49.1 and linked proof used by Lemma7.49.5 were not recursively read; Lemma7.49.3 gives a sketch. The actual formal statements and concrete instances were read at the exact Mathlib pin. SourceReading.json records fetched hashes and access times. Exact fixed-band equations are authored deductions. Existing source issues, including E6, remain; no new source error is asserted.

Exact proposed-name searches across both pinned source trees and current packets found no matches. ExternalSearch.json records zero results for the bounded open Mathlib gerbe PR query. This does not establish exhaustive semantic or PR/Zulip absence.

## Validation and limits

Mathlib pin 082e2d37e8b0463410cdb532e111cd43d5a66174, Tau Ceti pin f790474821cf4256814db967cb154e7af3d0c369, Lean4.34.0-rc2 compiler 6a10ac8c22beadecabdbb0919c2b50214762f91d. Both source trees were freshly verified tracked-clean. The full Tau-dependent Suggested.lean is **UNCOMPILED**: the available alternate Tau build is cf386627e9176a3827c1a5fe804989fd94a4d216 and lacks the required TauCeti.CategoryTheory.Sites.SheafCohomology.LongExactSequence import. No Lake setup, cache download, library build or language server was used.

The full Native and separate Mathlib-only Canonical files were compiled serially with the existing pinned build, one thread, 8 GiB cap and 1200-second timeout. Each run checked source and dependency pins, compiler version and available memory≥20GiB. No compiler remains running.

- Native.lean: 4590 lines, 165 examples, exit 0, 0 warnings (0 admissions), 235 axiom audits; 41 GiB available, elapsed 24.17 seconds, peak RSS 2387772 KiB. Source SHA256 `af3803385312a324cd06fd66cd47baf2655ea387eed9606b314b8927a1b88dda`; log SHA256 `e7bed8b96e27b300daf5347a75df7c7fc41ced3cfe8a538b197fb705f2d938a4`.

- Canonical.lean: 7940 lines, 426 examples, exit 0, 946 warnings (946 admissions), 0 axiom audits; 41 GiB available, elapsed 29.68 seconds, peak RSS 3853476 KiB. Source SHA256 `ea226f226d3d791f486aefadc969bc43954da057e5f3208b925b47d819ae3e99`; log SHA256 `2e06de9f483fa67d9c79f3b0b7b647af47f65f8f50fda9ecbb2ee693a5ab3438`.

Native has 213 inherited and 22 new audits, all 235 closures using only propext, Classical.choice and Quot.sound, with no admission or declared axiom. The planning projection retains all six actual construction bodies and admits precisely sixteen lemmas and fifteen tests. Canonical has 946 admission warnings only: 914 inherited, 31 explicit new admissions, and one warning inside the retained Setoid symmetry proof when simplification unfolds the inherited admitted transport definition. Native validates that same proof without admissions. Exact projection, 37 new headers, immutable prefix hashes, examples and final source/log receipts are mechanically checked. Compilation does not change implementation status.

The actual indexed checker reports {'packet': 'research/blueprint/packets/AlgebraicModuliForArithmeticGeometry--A0-extension.json', 'roadmap': 'AlgebraicModuliForArithmeticGeometry', 'status': 'partial', 'nodes': 642, 'kinds': {'definition': 17, 'lemma': 453, 'construction': 139, 'theorem': 28, 'comparison': 5}, 'apiItems': 574, 'unitTests': 544, 'planets': 10, 'baselineDeclarations': 244, 'prerequisites': {'baseline': 652, 'node (this packet)': 1347, 'node (blueprint)': 25, 'stage': 40}, 'gaps': 10, 'requests': 22, 'stagesInScope': 8, 'stagesClosed': 0}, without errors or warnings. Actual source-issue/version and intake checks pass. Stage DAG 3017/8655, own declaration DAG 642/1347, scoped DAG 3652/10712; all acyclic. All 24 supplier and 40 accepted touching-restructure pairs are reachable. No unresolved leaves or own skipped/pending links; foreign roadmaps/stages, stage-edge objects and sibling parts are unchanged. All84 input guards, four incoming files and the entire SF1 boundary agree at both bases.

Mathematical base `f9b083a612aedb04b123dece283b191a0b48a63d`; publication control `2c13f576bc3ed3f140fe8cabbc530c91d8cb151e`. Reports: Verification-math.json and Verification.json. Declaration-index SHA256 `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`. Full uncompiled Suggested.lean SHA256 `4b068404fbbcc5d9f94ea19010d52262edf9fbf0ffa18aff752207d9bf53beb2`.

## Resume

Continue from R09.4/global-hom. Prove the comparison of the new global sheaf on each chart with the existing fibreHomSheaf, keeping native slice pullback and universe comparisons. Establish compatibility with arbitrary-choice chart transitions and refinement. Descend the actual band action and prove local torsor properties, then import the supplied D0 torsor groupoid and prove full faithfulness plus a coherent inverse/unit/counit. Do not replace missing local comparison or torsor proofs by records assuming them.

Preserve the independent coefficient universe, actual pseudofunctor comparisons, empty raw-fibre behavior and fixed-band diagonal boundary of transport independence. Nonconstant-site and nonneutral fixtures, intrinsic descended-band/SF1, nonneutral root gerbes and derived H², compatible fpqc limits, and all other-stage/source obligations remain. The packet is partial.

## Script: author.py

```python
"""Append the fixed-band chart-pair orbit presheaf and its native sheafification."""
from pathlib import Path
import copy,json,re,sys
S=Path(sys.argv[1]).resolve();RID='AlgebraicModuliForArithmeticGeometry';STEM=RID+'--A0-extension';P=RID+':R09.4/';NEW=P+'global-hom/';NS='TauCeti.AlgebraicGeometry.BandedMorphism.'
old=json.loads((S/'Incoming.json').read_text());p=copy.deepcopy(old);assert len(old['nodes'])==620
existing={n.get('declarationName','').removeprefix(NS):n['id']for n in old['nodes']}
specs=[
('orbit','selfHomOrbitSetoid','The relation on fixed-band Hom chart pairs','construction',
 'For U in C and X in HomCategory(b,b), put the native Setoid on pairs (x,p), where x belongs to F(U) and p:x≅X_U(x). Relate (x,p) and (y,q) precisely when there exists e:x≅y such that the actual diagonal transport sends p to q. Its equivalence laws are proved, rather than imposed as additional data.',
 ['selfTransportActionIso','selfTransportActionIso_id','selfTransportActionIso_comp'],
 ['Reflexivity uses identity transport; symmetry uses the inverse fibre isomorphism and cancellation; transitivity uses transport along the composite. The native Quotient is used throughout.']),
('equality','selfHomOrbit_mk_eq','Equality of chart-pair classes','lemma',
 'The classes of arbitrary pairs (x,p) and (y,q) in the native quotient are equal if and only if some e:x≅y transports p to q. This is an existence statement and chooses no isomorphism.',
 ['@orbit','mathlib:Quotient.eq'],['Specialize the native quotient equality criterion to the proved setoid.']),
('injective','selfHomOrbit_mk_injective','A fixed chart retains distinct arrows','lemma',
 'For each actual x in F(U), the function p↦[(x,p)] from isomorphisms x≅X_U(x) to chart-pair classes is injective. No global object of the gerbe is required.',
 ['@equality','selfTransportActionIso_independent','selfTransportActionIso_id'],['An equality gives a loop e at x. Fixed-band transport independence identifies its action with identity transport, so the two arrows are equal.']),
('restriction','selfHomOrbitRestrict','Restriction of chart-pair classes','construction',
 'For f:V→U send [(x,p)] to [(F(f)x,res_f(p))], with res_f the actual StrongTrans fibre-isomorphism restriction. The map has codomain the quotient for F(V), without identifying F with a strict functor.',
 ['@orbit','fibreIsomRestriction','selfTransportActionIso_restriction','mathlib:Quotient.map'],['Apply native Quotient.map. If e witnesses equivalent representatives, F(f)(e) witnesses their restricted equivalence by the actual transport/restriction square.']),
('restriction-mk','selfHomOrbitRestrict_mk','Restriction on a represented class','lemma',
 'Restriction of the class represented by (x,p) is exactly the class represented by (F(f)x,res_f(p)); the StrongTrans comparison in res_f is retained.',
 ['@restriction'],['Evaluate the native quotient map.']),
('restriction-id','selfHomOrbitRestrict_id','Identity restriction after quotienting','lemma',
 'Restriction along the identity of U is the identity function on all chart-pair classes, even when the pseudofunctor identity comparison is not a definitional equality.',
 ['@restriction','fibreIsomRestriction_id','selfTransportActionIso'],['Induct on a representative. Use the actual component of F.mapId as the equivalence witness, then cancel the corresponding endpoint transport.']),
('restriction-comp','selfHomOrbitRestrict_comp','Composition of restrictions after quotienting','lemma',
 'For f:V→U and g:W→V, restriction along g followed by f equals restriction along f and then along g, on every chart-pair class. The equivalence witness is the actual component of F.mapComp.',
 ['@restriction','fibreIsomRestriction_comp','selfTransportActionIso'],['Induct on a representative, keep the actual pseudofunctor composition isomorphism, and use the established restriction composition formula.']),
('presheaf','selfHomOrbitPresheaf','The global presheaf of Hom chart-pair classes','construction',
 'Construct the actual functor P_X:Cᵒᵖ→Type(max(u′,v′)) whose sections over U are the native chart-pair quotient and whose restriction maps are the proved quotient restrictions. A fibre with no object gives no raw sections; no sheaf condition is asserted here.',
 ['@restriction','@restriction-id','@restriction-comp'],['Use the exact quotient carriers and restrictions as native functor data. The preceding identity and composition lemmas supply the two functor laws.']),
('map','selfHomOrbitMap','Modification maps on chart-pair classes','construction',
 'For any native fixed-band modification m:X→Y, send [(x,p)] over U to [(x,p followed by m_x)], using the actual component isomorphism. This defines a function between the two chart-pair quotients.',
 ['@orbit','componentIso','selfTransportNatIso','mathlib:Quotient.map'],['Apply native Quotient.map. Naturality of the existing diagonal transport natural isomorphism in m supplies representative independence with the same fibre isomorphism e.']),
('map-mk','selfHomOrbitMap_mk','Modification on a represented class','lemma',
 'The map for m:X→Y sends the represented class (x,p) exactly to the class (x,p followed by componentIso(m,U,x)).',
 ['@map'],['Evaluate the native quotient map.']),
('map-id','selfHomOrbitMap_id','Identity modification on classes','lemma',
 'The quotient map induced by the identity modification of X fixes every class over every U.',
 ['@map-mk','componentIso_id'],['Induct on a representative and use the actual identity-component formula.']),
('map-comp','selfHomOrbitMap_comp','Composite modification on classes','lemma',
 'For m:X→Y and n:Y→Z, the quotient map for m followed by n equals the map for m then the map for n, on every class over U.',
 ['@map-mk','componentIso_comp'],['Induct on and destruct a pair representative, then use component composition and associativity of isomorphisms.']),
('map-restrict','selfHomOrbitMap_restrict','Modification maps commute with restriction','lemma',
 'For m:X→Y and f:V→U, restriction of the m-image of any class equals the m-image over V of its restriction from U.',
 ['@map','@restriction','restrictionIso_modification','mathlib:CategoryTheory.Functor.mapIso_trans'],['Induct on a pair. The two restricted pairs have exactly the same object; congruence reduces to the actual StrongTrans modification/restriction identity.']),
('functor','selfHomOrbitFunctor','The Hom-category functor to orbit presheaves','construction',
 'Construct a native functor HomCategory(b,b)→(Cᵒᵖ→Type(max(u′,v′))) sending X to P_X and every native modification to its quotient natural transformation. It is defined on all morphisms of the supplied category.',
 ['@presheaf','@map','@map-restrict','@map-id','@map-comp'],['Use the restriction square for naturality and the quotient identity/composition laws for functoriality.']),
('sheaf-functor','selfHomGlobalSheafFunctor','A global sheaf from the Hom chart-pair presheaf','construction',
 'Construct a native functor HomCategory(b,b)→Sheaf(J,Type(max(u,v,u′,v′))) by composing the orbit-presheaf functor, postcomposition with native ULift, and Mathlib presheafToSheaf. The universe lift makes native type-valued sheafification available; the coefficient universe w remains independent. No global neutral object or extra HasSheafify assumption is supplied.',
 ['@functor','mathlib:CategoryTheory.Functor.whiskeringRight','mathlib:CategoryTheory.uliftFunctor','mathlib:CategoryTheory.HasSheafify','mathlib:CategoryTheory.presheafToSheaf'],['Use native functor composition and whiskering. The actual existing concrete-type instance from Sites.LeftExact supplies sheafification in the enlarged universe. This gives a globally defined candidate and its maps; identification with the earlier local Hom sheaves is a separate remaining theorem.']),
('sheaf-object','selfHomGlobalSheafFunctor_obj','The exact sheafification object','lemma',
 'The global candidate at X is exactly the native sheafification of P_X postcomposed with ULift to Type(max(u,v,u′,v′)).',
 ['@sheaf-functor'],['Unfold the composite functors and native postcomposition on objects.']),
('sheaf-inverse','selfHomGlobalSheafFunctor_map_inverse','Global maps respect modification inverses','lemma',
 'For any m:X→Y, its global sheaf map followed by the map for the native inverse modification is the identity of the global sheaf at X.',
 ['@sheaf-functor','homIso'],['Combine the two maps using functoriality, then use the actual hom-inverse identity in HomCategory(b,b).']),
('sheaf-unit','selfHomGlobalSheafFunctor_unit_naturality','Naturality of the sheafification unit','lemma',
 'The ULift-whiskered presheaf map induced by m followed by the sheafification unit at Y equals the unit at X followed by the underlying global sheaf map of m.',
 ['@sheaf-functor','mathlib:CategoryTheory.toSheafify_naturality'],['Specialize naturality of the native sheafification unit to the actual whiskered quotient natural transformation.']),
('transport','selfHomOrbit_mk_transport','Transport preserves the represented class','lemma',
 'For every e:x≅y in F(U), the class represented by (x,p) equals the class represented by (y,transport_e(p)). The witness is the supplied e itself.',
 ['@orbit'],['Apply native quotient soundness to the defining relation with witness e.']),
('map-inverse','selfHomOrbitMap_inverse','Modification inverse on all quotient sections','lemma',
 'Applying the map of m:X→Y and then its native inverse modification recovers every quotient section over U.',
 ['@map-comp','@map-id','homIso'],['Combine the maps, use the native hom-inverse identity, and apply the proved identity-modification formula.']),
('sheaf-ext','selfHomGlobalSheafFunctor_hom_ext','Global sheaf maps are determined before sheafification','lemma',
 'For any sheaf Q in the stated type universe, two sheaf morphisms from the global candidate at X to Q are equal if their underlying presheaf maps agree after precomposition with the actual sheafification unit of ULift(P_X).',
 ['@sheaf-object','mathlib:CategoryTheory.Sheaf.hom_ext','mathlib:CategoryTheory.sheafify_hom_ext'],['Apply native sheaf morphism extensionality and native sheafification hom extensionality using the target sheaf property.']),
('sheaf-universal','selfHomGlobalSheafFunctor_universal','The universal property of the global candidate','lemma',
 'For every target sheaf Q and presheaf morphism ULift(P_X)→Q, there exists a unique sheaf morphism from the global candidate at X to Q whose underlying map restricts to the given morphism along the actual sheafification unit.',
 ['@sheaf-object','mathlib:CategoryTheory.sheafifyLift','mathlib:CategoryTheory.toSheafify_sheafifyLift','mathlib:CategoryTheory.sheafifyLift_unique','mathlib:CategoryTheory.Sheaf.hom_ext'],['Package the native sheafifyLift as a sheaf morphism. Its factorization and uniqueness follow from the actual native lemmas and sheaf hom extensionality.'])]
ids={k:NEW+k for k,*_ in specs}
# Every baseline statement below was read at the pinned source, not inferred from this index.
provides={'Quotient.map':'A relation-preserving function induces a function on native setoid quotients.', 'Quotient.eq':'Equality of quotient representatives is equivalent to the original setoid relation.', 'CategoryTheory.Functor.whiskeringRight':'Native postcomposition functor on functor categories.', 'CategoryTheory.uliftFunctor':'The native functor raising the universe of type-valued carriers.', 'CategoryTheory.HasSheafify':'Left-exact sheafification interface; Sites.LeftExact supplies its actual concrete-type instance at the required enlarged universe.', 'CategoryTheory.presheafToSheaf':'The native sheafification functor left adjoint to sheaf inclusion.', 'CategoryTheory.toSheafify_naturality':'Naturality of the actual sheafification unit.', 'CategoryTheory.sheafify_hom_ext':'Maps from sheafification to a sheaf are determined by precomposition with its unit.', 'CategoryTheory.sheafifyLift':'The universal map from a sheafified presheaf to a target sheaf.', 'CategoryTheory.toSheafify_sheafifyLift':'The native sheafification lift factors the original map.', 'CategoryTheory.sheafifyLift_unique':'Uniqueness of the native sheafification lift.'}
index={c[1]:c for l in Path(sys.argv[2]).read_text().splitlines()if len(c:=l.split('\t'))>=5 and c[0]=='mathlib'}
refs={d['ref']for d in old['baseline']['declarations']};newbaseline=[]
for name,st in provides.items():
 if 'mathlib:'+name in refs:continue
 c=index[name];newbaseline.append(dict(ref='mathlib:'+name,kind=c[2],module=c[3],provides=st,checked='Full statement read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; exact native application compiled.'))
p['baseline']['declarations']+=newbaseline;refs|={x['ref']for x in newbaseline}
remaining='An actual global candidate sheaf and functor on every fixed-band modification now exist, by native sheafification of the proved chart-pair orbit presheaf. Its unit and universal property are explicit. Still required: prove its local comparison with the existing fibreHomSheaf on every chart and the associated overlap/refinement compatibility; descend the actual band action and prove local torsor properties; package the supplied D0 torsor groupoid, then establish full faithfulness and a coherent inverse/unit/counit. No injectivity of the sheafification unit or sheaf condition for the raw quotient is claimed. Intrinsic descended-band/SF1, nonconstant-site and nonneutral geometric fixtures, root gerbes and derived H², compatible fpqc limits and all other-stage/source obligations remain open.'
hyps=['C has object universe u and morphism universe v, J is any Grothendieck topology, and F is an actual Cat-valued pseudofunctor with fibre object universe u′ and morphism universe v′, equipped with IsGerbe F J.', 'b is an actual abelian banding by A:Sheaf(J,AddCommGrpCat) in an independent coefficient universe w. X,Y,Z and their modifications belong to the existing native HomCategory(b,b). No global object, neutrality, strictification of F, nonempty fibre, or chosen coherent isomorphism system is assumed.', 'Raw presheaves take values in Type(max(u′,v′)); global sheaves use the explicit native ULift to Type(max(u,v,u′,v′)). The local Hom-sheaf comparison and torsor structures remain requirements, not assumptions hidden in these constructions.']
new=[]
for key,name,title,kind,st,deps,steps in specs:
 ds=[ids[d[1:]]if d.startswith('@')else d if d.startswith('mathlib:')else existing[d] for d in deps]
 assert all(d in refs or d in ids.values()or d in existing.values()for d in ds)
 sheaf=key.startswith('sheaf-')
 new.append(dict(id=ids[key],parentStageId=RID+':R09.4',realises=[RID+':R09.4'],title=title,kind=kind,declarationName=NS+name,statement=st,hypotheses=hyps,prerequisites=ds,proofSteps=steps,acceptance=['Keep actual quotient representatives, pseudofunctor comparisons, modification components, universe lift, and native sheafification. All construction data are supplied by the stated prerequisites.',remaining],uses=[dict(where=P+'self-equivalence-torsor',how='Construct the global candidate and its maps before the required local torsor comparison and the supplier-owned torsor-groupoid packaging.'),dict(where='Stacks Section 8.11; Section 7.49',how='Apply local gerbe transport and the existing universal sheafification; no new generic stackification or sheaf-descent package is planned.')],library=dict(module='TauCeti/AlgebraicGeometry/Stacks/Gerbes',namespace=NS[:-1]),sources=[dict(sourceId='GH-sheafification-codex-7e92bd'if sheaf else'GH-gerbe-context-codex-7e92bd',locator='Stacks Section 7.49/tag 00ZG, Lemmas 7.49.3–5; exact functor is an authored specialization.'if sheaf else'Stacks Section 8.11/tag 06NY, Definition 8.11.1 and Lemma 8.11.8; exact fixed-band orbit equations are authored deductions.',excerpt='sheafification'if sheaf else'gerbe',match='The source supplies general mathematical context. Exact fixed-band quotient, restriction and modification equations are authored from the listed prerequisites; the native library supplies all generic quotient and sheafification machinery.')],implementationStatus='unchecked'))
tests=[
('transport_chain','compatibility','Two consecutive actual transports give the same quotient class as the initial representative.'),
('unequal_arrows','non-example','A supplied pair of distinct isomorphisms at the same chart remains distinct in the raw quotient; existence of such a pair on every gerbe is not asserted.'),
('empty_fibre','degenerate','An empty fibre forces an empty raw presheaf section carrier. No emptiness of its sheafification is asserted.'),
('two_restrictions','compatibility','The actual presheaf restriction through two arrows agrees with restriction along their composite on arbitrary quotient sections.'),
('change_representative','compatibility','Restrict two representatives related by an arbitrary fibre isomorphism; their explicit restricted representatives define the same class.'),
('identity_comparison','computation','The explicitly restricted pair over the identity gives the original class although its object is F(id)(x), retaining the actual pseudofunctor identity comparison.'),
('inverse_modification','compatibility','The actual orbit-presheaf natural transformation for a modification followed by its native inverse recovers each section.'),
('modification_restriction','compatibility','Two arbitrary modifications interleaved with two restrictions agree with the composite modification after composite restriction.'),
('nonidentity_modification','non-example','If an actual modification changes a supplied fibre isomorphism by postcomposition, its raw quotient map changes that represented class; it is not silently collapsed to identity.'),
('unit_restriction','compatibility','On arbitrary raw quotient sections, the actual global sheaf restriction commutes with the ULift sheafification unit.'),
('unit_modification','computation','The global sheaf map on the image of an explicit pair under the unit is the unit image of postcomposition by the actual modification component.'),
('universal_target','compatibility','For an arbitrary sheaf target, every map out of the lifted orbit presheaf has a unique actual sheaf-morphism extension along the unit.'),
('generator_ext','compatibility','Agreement on the unit images of every represented pair at every U implies equality of actual sheaf morphisms to any target sheaf, by quotient induction and the native universal property.'),
('global_inverse','compatibility','Apply the inverse global map and then the forward map to an arbitrary sheafified section; it returns the section, without assuming a representative or unit surjectivity.'),
('global_composition','compatibility','Composition holds as equality of actual presheaf natural transformations and of actual global sheaf morphisms.')]
apiowners={'orbit':['equality','injective','transport'],'restriction':['restriction-mk','restriction-id','restriction-comp'],'presheaf':['restriction-mk','restriction-id','restriction-comp'],'map':['map-mk','map-id','map-comp','map-restrict','map-inverse'],'functor':['map-restrict','map-id','map-comp','map-inverse'],'sheaf-functor':['sheaf-object','sheaf-inverse','sheaf-unit','sheaf-ext','sheaf-universal']}
testowners={'orbit':['transport_chain','unequal_arrows','empty_fibre'],'restriction':['two_restrictions','change_representative','identity_comparison'],'presheaf':['empty_fibre','two_restrictions','change_representative'],'map':['inverse_modification','modification_restriction','nonidentity_modification'],'functor':['inverse_modification','modification_restriction','global_composition'],'sheaf-functor':['unit_restriction','unit_modification','universal_target','generator_ext','global_inverse','global_composition']}
byid={n['id']:n for n in new};td={name:(kind,st)for name,kind,st in tests}
for key,aks in apiowners.items():
 n=byid[ids[key]];n['api']=[dict(name=byid[ids[k]]['declarationName'],role='universal-property'if k=='sheaf-universal'else'extensionality'if k in ['injective','sheaf-ext']else'compatibility',statement=byid[ids[k]]['statement'])for k in aks]
 n['tests']=[dict(name='TauCeti.AlgebraicGeometry.GlobalHomTests.'+name,kind=td[name][0],statement=td[name][1])for name in testowners[key]]
p['nodes']+=new
for c in p['coverage']:
 if c['stageId']==RID+':R09.4':c['remaining'].append(remaining)
p['summary']='Global fixed-band Hom candidate: six constructions, sixteen lemmas, native orbit presheaf and sheafification with maps and universal property; all stages remain partial. '+old['summary']
reads=json.loads((S/'SourceReading.json').read_text())
for tag,sid,title,scope in [('06NY','GH-gerbe-context-codex-7e92bd','Gerbes and the chart-pair orbit construction','Whole displayed Section 8.11: all definitions, Lemmas 8.11.2–8 and displayed proofs/diagrams, both comments. E6 and varying-base/SF1 obligations remain.'),('00ZG','GH-sheafification-codex-7e92bd','Sheafification in a topology and the global Hom candidate','Whole displayed Section 7.49: Lemmas 7.49.1–5, all displayed proofs and both comments. The omitted proof of 7.49.1 and linked proof for 7.49.5 were not recursively read; 7.49.3 gives a sketch. Exact formal statements are supplied by the read pinned native library.')]:
 r=next(r for r in reads if r['url'].endswith(tag));p['sources'].append(dict(id=sid,title=title,authors='The Stacks Project Authors; fixed-band deductions by Codex — codex-7e92bd',edition='Displayed section read 2026-10-04; exact Mathlib pin',url=r['url'],sha256=r['sha256'],accessDate='2026-10-04',readSections=[scope]))
plan=dict(newNodes=[n['id']for n in new],newNames=[n['declarationName']for n in new],newAPI=sum(len(n.get('api',[]))for n in new),newTests=len(tests),newTestReferences=sum(len(n.get('tests',[]))for n in new),tests=tests,remaining=remaining,wholeIncomingObjectsPreserved=620,mathematicalContractsPreserved=620,newBaseline=newbaseline,newSources=2)
addition='# The global fixed-band Hom sheaf candidate\n\nCodex — codex-7e92bd, 4 October 2026. Partial continuation: six constructions and sixteen lemmas.\n\n'+remaining+'\n\nOver U, take pairs consisting of an object x of F(U) and an isomorphism from x to X(x). Identify pairs by the previously proved fixed-band diagonal transport. This is an actual equivalence relation; transport along every loop is identity, so different arrows at a fixed chart remain different in the quotient. Restrictions use the actual StrongTrans comparison. Their identity and composition laws hold in the quotient using F.mapId and F.mapComp as witnesses. Modifications act by postcomposition and commute with restriction. The resulting presheaf and its functor on the full Hom category therefore have actual data and proved laws.\n\nLift its section universe explicitly and apply the existing native sheafification functor. This produces a global candidate with actual modification maps, unit naturality, inverse compatibility, extensionality and a unique extension property into every sheaf. Native concrete-type sheafification supplies the instance; no additional existence axiom, global object, or strictification is assumed. The coefficient universe remains independent. This construction does not yet identify the candidate on a chart with the existing local Hom sheaf. Proving that comparison and descending the band action are the next mathematical steps. Empty raw sections need not remain empty after sheafification, and injectivity or surjectivity of the unit is not asserted.\n\nThis is a gerbe-specific application of existing quotient and sheafification machinery. General stacks, stackification and torsor-groupoid interfaces remain owned by D0; algebraic-space carriers, diagonals and atlases remain owned by SF1 under the accepted RS27 boundary. All previous source routes and unresolved targets remain.\n\n'
for n in new:
 addition+='## '+n['title']+'\n\nDeclaration: **'+n['declarationName']+'**. Node: **'+n['id']+'**.\n\n'+n['statement']+'\n\nHypotheses: '+' '.join(n['hypotheses'])+'\n\nProof plan: '+' '.join(n['proofSteps'])+'\n\nPrerequisites: '+', '.join(n['prerequisites'])+'.\n\n'
 for a in n.get('api',[]):addition+='API **'+a['name']+'**: '+a['statement']+'\n\n'
 for t in n.get('tests',[]):addition+='Test **'+t['name']+'** ('+t['kind']+'): '+t['statement']+'\n\n'
addition+='All 620 prior node objects, ten gaps, 22 requests, eight source issues, ten planets and eight partial stages are preserved. Every implementation status remains unchecked. The fifteen new parameterized native tests have 21 references across the six constructions. Conditional unequal-arrow and nonidentity-modification tests retain supplied witnesses; no new nonconstant-site or nonneutral geometric fixture is claimed. The full Tau-dependent suggested file remains uncompiled.\n\nSources: [Stacks Section 8.11](https://stacks.math.columbia.edu/tag/06NY) supplies gerbe context; [Stacks Section 7.49](https://stacks.math.columbia.edu/tag/00ZG) supplies sheafification context. Displayed proofs were read with their stated omissions; the actual generic formal statements were read at the pinned Mathlib source. Exact fixed-band formulas are authored deductions. The complete prior reader follows verbatim.\n\n'
for name,d in [('Candidate.json',p),(STEM+'.json',p),('Plan.json',plan),('new-nodes.json',new)]: (S/name).write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n')
(S/'ReaderAddition.md').write_text(addition);(S/'Reader.md').write_text(addition+(S/'IncomingReader.md').read_text())
assert len(new)==22 and sum(n['kind']=='construction'for n in new)==6
assert {NS+n for n in re.findall(r'^(?:noncomputable )?(?:def|lemma) (\w+)',(S/'NewProofs.lean').read_text(),re.M)}==set(plan['newNames'])
print(json.dumps(dict(nodes=len(p['nodes']),baseline=len(p['baseline']['declarations']),newBaseline=len(newbaseline),newAPI=plan['newAPI'],newTestReferences=plan['newTestReferences'],rawAPI=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']))))
```

## Script: projection.py

```python
"""Admit lemma/test proofs while retaining actual native scalar-module data."""
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
assert len(names)==22
a=''.join('#print axioms TauCeti.AlgebraicGeometry.BandedMorphism.'+n+'\n'for n in names)
n=project(p,t);assert len(re.findall(r'\bsorry\b',n))==31
for name,text in [('Audits.lean',a),('NewAdmitted.lean',n),('Native.lean',(S/'NewImports.lean').read_text()+(S/'NativePrefix.lean').read_text()+'\n'+p+'\n'+t+'\n'+a),('Canonical.lean',(S/'NewImports.lean').read_text()+(S/'MathlibPrefix.lean').read_text()+'\n'+n),('Suggested.lean',(S/'NewImports.lean').read_text()+(S/'Incoming.lean').read_text()+'\n'+n)]:
 (S/name).write_text(text)
```

## Script: handoff.py

```python
"""Write the global fixed-band Hom candidate checkpoint and exact replay helpers."""
from pathlib import Path
import hashlib,json,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd();STEM='AlgebraicModuliForArithmeticGeometry--A0-extension'
sha=lambda b:hashlib.sha256(b).hexdigest()
t='''# The global fixed-band Hom sheaf candidate

Codex — codex-7e92bd. Refs #672. Partial continuation; every implementation status is unchecked and all eight stages remain partial.

## Mathematical checkpoint

Six constructions and sixteen lemmas supply an actual global candidate sheaf and its functor on the full native fixed-band modification category. For X in HomCategory(b,b), form pairs (x,p:x≅X(x)) over U and identify them by the existing diagonal transport along an actual isomorphism e:x≅y. The relation is a proved native Setoid. Its native Quotient has the exact equality criterion and retains distinct arrows at a fixed chart: all loop transports are identity by fixed-band independence.

Restriction uses the actual StrongTrans fibre-isomorphism map. Representative independence follows from the existing transport/restriction square. Identity and composition are proved using F.mapId and F.mapComp as witnesses in the quotient, without strictifying the pseudofunctor. Modifications act by postcomposition with their actual component isomorphisms; these maps commute with restriction and preserve identities, compositions and inverses. They give the actual orbit-presheaf functor.

Postcompose with native ULift and then apply the existing Mathlib presheafToSheaf functor. The raw carrier universe is max(u′,v′); sheaves use max(u,v,u′,v′), so the native concrete-type sheafification instance applies. The coefficient universe w remains independent. No global object, neutrality, coherent choice of fibre isomorphisms, or extra sheafification assumption is required. The global candidate has actual modification maps, a natural sheafification unit, inverse compatibility, hom extensionality and unique extension to every target sheaf.

The raw quotient is not claimed to be a sheaf. If the fibre is empty its raw section carrier is empty; the sheafified carrier is not claimed empty. Injectivity or surjectivity of the unit is not asserted. The candidate is not yet identified with the earlier local fibreHomSheaf on every chart. Its band action and local torsor property are still required, before using the supplied D0 torsor groupoid and proving full faithfulness and a coherent inverse/unit/counit.

Fifteen parameterized native tests cover transport chains, supplied distinct arrows, empty fibres, two restrictions, changed representatives, the actual identity comparison, inverse modifications, two modifications interleaved with two restrictions, a modification supplied to change a fibre arrow, unit restrictions, the unit on explicit pairs, arbitrary universal targets, extensionality on all represented pairs, inverse maps on arbitrary sheafified sections, and equality of composite presheaf/sheaf maps. Conditional tests retain supplied witnesses; no new nonconstant-site or nonneutral geometric fixture is claimed.

All 620 incoming node objects remain unchanged. The packet has 642 nodes, 244 baseline references, 582 raw API references and 577 raw test references. There are 23 new API references and 21 references to the 15 new tests across six constructions. Eleven actual existing baseline declarations were newly read and cited. All ten gaps, 22 requests, eight source issues, ten planets and eight partial stages are preserved. The previous reader is a verbatim suffix. Every previous Lean body is retained byte for byte after two additional Mathlib import lines. Generic quotient and sheafification machinery is reused; general stacks/stackification and torsor-groupoid interfaces remain D0, and algebraic-space carriers/diagonals/atlases remain SF1 under accepted RS27.

## Reading and provenance

The whole 44,034-character issue was read before claim 5980587779 and after bot 5980589194 confirmed that exact comment. Both reads used [0,16000], [16000,32000], [32000,44034]; body SHA256 76b4b208fdc2daf287aff24fff621ad30741280c84a8c35c7f6ac34c2ea459af. WORKERS was reread whole. Blueprint PROTOCOL 1–245 and 365–575, expansion PROTOCOL and UPSTREAM_GUIDE were freshly read, with unchanged own continuous-session scopes retained for other binding sections.

Incoming own [PR6067](https://github.com/CBirkbeck/tauceti-explorer/pull/6067), head b3e88fa4a13744bb9f5530ba9dff6f388568d018, archive 0e1436f5f79203563e911ada10d293dba7044ca2, was actually recovered over public HTTP. All 66 artifacts, eleven helpers and four final deliverables were authenticated. Manifest SHA256 c899a5476df088bf899ceeedf25f34c1f4426a323f9afad93607162d4c5599aa. After personally reading the actual verifier/immutable/graph helpers, both its mathematical and publication reports were reproduced byte for byte. Current incoming deliverables equal those public files.

Own6067 scopes and its authenticated own6056/6045 reading chain are retained. All 57 prior controls are unchanged; equality authenticates those original scopes rather than fresh whole-file readings. Fresh reads include the exact reviewed R09.4 library audit, all current gaps and latest four frontier entries, the whole reserved gerbe contract/API/tests and whole algebraic-geometry keydefs gerbes entry. The entire SF1 boundary was compared equal, including nodes, coverage, requests and sourceWorklist; its prior reading limits remain.

All 144 current structured touching entries in 57 research/legacy link and accepted RS02/05/06/27 files were read in full. The 29 current research-link files are guarded. Together with prior controls, InputGuard.json has 84 distinct paths. Consumed incoming native ranges are 1–46, 464–537, 539–737, 933–1016, 1031–1134 and 1745–1905. The entire 4190-line prefix was authenticated and recompiled; a new whole-file manual audit is not claimed. All new proofs, tests and adapted helpers were read. Reading.json gives exact native source ranges and hashes for Quotient, sheafification, the concrete-type instance, whiskering and ULift.

Whole displayed [Stacks Section8.11](https://stacks.math.columbia.edu/tag/06NY) and [Section7.49](https://stacks.math.columbia.edu/tag/00ZG) were read, including all statements, displayed proofs/diagrams and both comments each. The omitted proof of Lemma7.49.1 and linked proof used by Lemma7.49.5 were not recursively read; Lemma7.49.3 gives a sketch. The actual formal statements and concrete instances were read at the exact Mathlib pin. SourceReading.json records fetched hashes and access times. Exact fixed-band equations are authored deductions. Existing source issues, including E6, remain; no new source error is asserted.

Exact proposed-name searches across both pinned source trees and current packets found no matches. ExternalSearch.json records zero results for the bounded open Mathlib gerbe PR query. This does not establish exhaustive semantic or PR/Zulip absence.

## Validation and limits

Mathlib pin 082e2d37e8b0463410cdb532e111cd43d5a66174, Tau Ceti pin f790474821cf4256814db967cb154e7af3d0c369, Lean4.34.0-rc2 compiler 6a10ac8c22beadecabdbb0919c2b50214762f91d. Both source trees were freshly verified tracked-clean. The full Tau-dependent Suggested.lean is **UNCOMPILED**: the available alternate Tau build is cf386627e9176a3827c1a5fe804989fd94a4d216 and lacks the required TauCeti.CategoryTheory.Sites.SheafCohomology.LongExactSequence import. No Lake setup, cache download, library build or language server was used.

The full Native and separate Mathlib-only Canonical files were compiled serially with the existing pinned build, one thread, 8 GiB cap and 1200-second timeout. Each run checked source and dependency pins, compiler version and available memory≥20GiB. No compiler remains running.
'''
for name in ['Native','Canonical']:
 d=json.loads((S/(name+'.receipt.json')).read_text());code=(S/(name+'.lean')).read_text();ex=sum(l.startswith('example')for l in code.splitlines())
 t+=f"\n- {name}.lean: {len(code.splitlines())} lines, {ex} examples, exit {d['exitStatus']}, {d['warnings']} warnings ({d['admissionWarnings']} admissions), {d['axiomAudits']} axiom audits; {d['availableGiBBefore']} GiB available, elapsed {d['elapsedSeconds']} seconds, peak RSS {d['maxRssKiB']} KiB. Source SHA256 `{d['sourceSha256']}`; log SHA256 `{d['logSha256']}`.\n"
t+='''
Native has 213 inherited and 22 new audits, all 235 closures using only propext, Classical.choice and Quot.sound, with no admission or declared axiom. The planning projection retains all six actual construction bodies and admits precisely sixteen lemmas and fifteen tests. Canonical has 946 admission warnings only: 914 inherited, 31 explicit new admissions, and one warning inside the retained Setoid symmetry proof when simplification unfolds the inherited admitted transport definition. Native validates that same proof without admissions. Exact projection, 37 new headers, immutable prefix hashes, examples and final source/log receipts are mechanically checked. Compilation does not change implementation status.
'''
if (S/'Verification.json').exists():
 v=json.loads((S/'Verification.json').read_text());g=v['graph']
 t+=f"\nThe actual indexed checker reports {v['checker']}, without errors or warnings. Actual source-issue/version and intake checks pass. Stage DAG {g['stageDAG']['vertices']}/{g['stageDAG']['edges']}, own declaration DAG {g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']}, scoped DAG {g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']}; all acyclic. All {g['requiredPairs']} supplier and {g['restructurePairs']} accepted touching-restructure pairs are reachable. No unresolved leaves or own skipped/pending links; foreign roadmaps/stages, stage-edge objects and sibling parts are unchanged. All84 input guards, four incoming files and the entire SF1 boundary agree at both bases.\n"
t+=f"\nMathematical base `{(S/'base.txt').read_text().strip()}`; publication control `{(S/'publication-base.txt').read_text().strip()}`. Reports: Verification-math.json and Verification.json. Declaration-index SHA256 `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`. Full uncompiled Suggested.lean SHA256 `{sha((S/'Suggested.lean').read_bytes())}`.\n"
t+='''
## Resume

Continue from R09.4/global-hom. Prove the comparison of the new global sheaf on each chart with the existing fibreHomSheaf, keeping native slice pullback and universe comparisons. Establish compatibility with arbitrary-choice chart transitions and refinement. Descend the actual band action and prove local torsor properties, then import the supplied D0 torsor groupoid and prove full faithfulness plus a coherent inverse/unit/counit. Do not replace missing local comparison or torsor proofs by records assuming them.

Preserve the independent coefficient universe, actual pseudofunctor comparisons, empty raw-fibre behavior and fixed-band diagonal boundary of transport independence. Nonconstant-site and nonneutral fixtures, intrinsic descended-band/SF1, nonneutral root gerbes and derived H², compatible fpqc limits, and all other-stage/source obligations remain. The packet is partial.
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
assert len(old['nodes'])==620 and len(p['nodes'])==642 and p['nodes'][620:]==data('new-nodes.json')
assert p['nodes'][:620]==old['nodes'] and set(p)==set(old)
for k in old:
 if k not in ['nodes','summary','sources','coverage','baseline']:assert p[k]==old[k],k
assert p['summary'].endswith(old['summary'])and p['sources'][:-2]==old['sources']
expectedBaseline=copy.deepcopy(old['baseline'])
expectedBaseline['declarations']+=plan['newBaseline']
assert p['baseline']==expectedBaseline and len(p['baseline']['declarations'])==244
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
assert len(re.findall(r'\bsorry\b',admitted))==31
assert txt('Native.lean')==txt('NewImports.lean')+txt('NativePrefix.lean')+'\n'+proofs+'\n'+tests+'\n'+txt('Audits.lean')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',txt('Native.lean'))
assert txt('Canonical.lean')==txt('NewImports.lean')+txt('MathlibPrefix.lean')+'\n'+admitted
assert txt('Suggested.lean')==txt('NewImports.lean')+txt('Incoming.lean')+'\n'+admitted
pm=data('IncomingManifest.json')
assert sha((S/'IncomingManifest.json').read_bytes())=='c899a5476df088bf899ceeedf25f34c1f4426a323f9afad93607162d4c5599aa'
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
assert len(nh)==22 and len(th)==15 and ch=={**nh,**th}
assert {NS+n for n in nh}==set(plan['newNames'])=={n['declarationName']for n in p['nodes'][620:]}
assert txt('Audits.lean')==''.join('#print axioms '+NS+n+'\n'for n in nh)
assert all(len(n['api'])>=3 and len(n['tests'])>=3 for n in p['nodes'][620:]if n['kind']=='construction')
assert sum(len(n.get('api',[]))for n in p['nodes'])==582
assert sum(len(n.get('tests',[]))for n in p['nodes'])==577
for n in p['nodes'][620:]:
 assert n['declarationName']in texts[paths[1]]and n['statement']in texts[paths[1]]
 for x in n.get('api',[])+n.get('tests',[]):assert x['name']in texts[paths[1]]and x['statement']in texts[paths[1]]
for name,kind,st in plan['tests']:assert '-- test: GlobalHomTests.'+name in tests and st in texts[paths[1]]
compilation={}
for name,want,audits,examples in [('Native',0,235,165),('Canonical',946,0,426)]:
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
assert len(reuse)==57 and all(q['unchanged']for q in reuse)
assert {q['path']for q in reuse}<={q['path']for q in data('InputGuard.json')}
om=data('OwnPreviousManifest.json')
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='c899a5476df088bf899ceeedf25f34c1f4426a323f9afad93607162d4c5599aa'
for original in ['Reading.json','InputGuard.json','Candidate.json','SFBoundary.json']:
 assert sha((S/('OwnPrevious'+original)).read_bytes())==om[original]['sha256']
for prefix,prior_hash in [('OwnPrevious','188f9f17676fed64bfe36ce2a9197b24a228d6ad9a5efe5c171f585fabba8214'),('OwnInherited','bc24350852864995d87a1f842319f87e5882547ce4e9ab3e7a8e10f7ad2608af')]:
 for part in ['Reading.json','Manifest.json','InputGuard.json']:
  assert sha((S/('Own6067'+prefix+part)).read_bytes())==pm[prefix+part]['sha256']
 prior=data('Own6067'+prefix+'Manifest.json')
 assert sha((S/('Own6067'+prefix+'Manifest.json')).read_bytes())==prior_hash
 for part in ['Reading.json','InputGuard.json']:
  assert sha((S/('Own6067'+prefix+part)).read_bytes())==prior[part]['sha256']
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
assert data('ClaimReceipt.json')['claim']==5980587779 and data('ClaimReceipt.json')['confirmation']==5980589194
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
print(json.dumps(dict(worldCommit=BASE,checker=summary,checkerErrors=errors,checkerWarnings=warnings,intakeProblems=problems,intakeRefusals=refusals,sourceIssueErrors=issues,preservedWholeNodeObjects=620,preservedMathematicalContracts=620,newDeclarations=22,newConstructions=6,newAPI=23,newTests=15,newTestReferences=21,rawAPI=582,rawTests=577,matchedNewHeaders=37,compilation=compilation,fullTauCetiCompiled=False,externalInputGuards=len(data('InputGuard.json')),incomingDeliverableGuards=len(paths),sf1BoundaryPreserved=True,indexSha256=sha(Path(sys.argv[2]).read_bytes()),graph=graph,LeanExecuted=False),indent=2))
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
name=sys.argv[4];assert name in {'Native.lean','Canonical.lean','Published.lean','AdmittedTyping.lean','Prototype.lean','Sketch.lean','PrototypeBase.lean','Probe.lean'}
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
env=os.environ.copy();env['LEAN_PATH']=os.pathsep.join(str(p) for p in ([out]+libs if name in {'Prototype.lean','Probe.lean'} else libs))
result=subprocess.run(['/usr/bin/time','-v','stdbuf','-oL','-eL','timeout','1200',str(lean),'-j','1','-M','8192',*(['-o',str(out/'PrototypeBase.olean')] if name=='PrototypeBase.lean' else []),str(out/name)],env=env,cwd=out)
sys.exit(result.returncode)
```

## Script: runcheck.py

```python
"""Serial checked replay with bounded diagnostics and apply_patch receipt writes."""
from pathlib import Path
import subprocess,sys,hashlib,json,re,time
S=Path(sys.argv[1]).resolve();name=sys.argv[4];prefix=name[:-5]
start=time.monotonic()
r=subprocess.Popen([sys.executable,str(S/'compile.py')]+sys.argv[1:],text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,bufsize=1)
lines=[]
for line in r.stdout:
 lines.append(line)
 if 'error:' in line or line.startswith('Test completed: ') or (line.startswith('TauCeti.SchemeFoundations.IdealPullback.') and 'depends on axioms' not in line):
  print(line.replace(str(S),'<SCRATCH>').rstrip(),flush=True)
r.wait();raw=''.join(lines)

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
 print('\n'.join(x for x in log.splitlines() if 'error' in x or ('warning' in x and 'warning: declaration uses' not in x)))
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
NAMES='''AlgebraicModuliForArithmeticGeometry--A0-extension.json Incoming.json Incoming.lean IncomingReader.md IncomingHandoff.md IncomingManifest.json
NewImports.lean NativePrefix.lean MathlibPrefix.lean IncomingVerification-replayed.json IncomingMathematicalVerification-replayed.json PreviousMathematicalVerification.json PreviousVerification.json PreviousRecovery.json PreviousHead.txt
ClaimReceipt.json Reading.json SourceReading.json Search.json ExternalSearch.json Worklist.json OwnReadingReuse.json OwnPreviousReading.json OwnPreviousInputGuard.json OwnPreviousManifest.json OwnPreviousSFBoundary.json OwnPreviousCandidate.json Own6067OwnPreviousReading.json Own6067OwnPreviousManifest.json Own6067OwnPreviousInputGuard.json Own6067OwnInheritedReading.json Own6067OwnInheritedManifest.json Own6067OwnInheritedInputGuard.json InputGuard.json SFBoundary.json TauProbe.json SourcePins.json TouchingLinks.json CurrentLinkFiles.json
Native.lean Native.log Native.receipt.json NewProofs.lean Tests.lean Audits.lean NewAdmitted.lean Canonical.lean Canonical.log Canonical.receipt.json Candidate.json Reader.md ReaderAddition.md Suggested.lean Handoff.md HandoffBase.md Plan.json new-nodes.json Verification-math.json Verification.json base.txt publication-base.txt author.py projection.py assemble.py handoff.py verify.py graph.py immutable_view.py compile.py runcheck.py package.py recover-incoming.py'''.split()
if mode=='archive':
 meta={n:dict(sha256=sha((S/n).read_bytes()),bytes=len((S/n).read_bytes()),lines=len((S/n).read_bytes().splitlines()))for n in NAMES}
 mb=(json.dumps(meta,indent=2,sort_keys=True)+'\n').encode();(S/'artifact-manifest.json').write_bytes(mb)
 payload={n:dict(sha256=sha((S/n).read_bytes()),data=base64.b64encode(zlib.compress((S/n).read_bytes(),9)).decode())for n in NAMES+['artifact-manifest.json']}
 pb=(json.dumps(payload,sort_keys=True,separators=(',',':'))+'\n').encode();(S/'payload.json').write_bytes(pb)
 report=dict(artifacts=len(NAMES),helpers=sum(n.endswith('.py')for n in NAMES),manifestSha256=sha(mb),payloadSha256=sha(pb))
 (S/'package.json').write_text(json.dumps(report,indent=2)+'\n')
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED GLOBAL FIXED BAND HOM PAYLOAD\n'+pb+b'END ARCHIVED GLOBAL FIXED BAND HOM PAYLOAD -/\n')
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
pb=raw.split('/- BEGIN ARCHIVED GLOBAL FIXED BAND HOM PAYLOAD\\n',1)[1].split('END ARCHIVED GLOBAL FIXED BAND HOM PAYLOAD -/',1)[0].encode()
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
"""Recover public authenticated fixed-band chart-refinement evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='AlgebraicModuliForArithmeticGeometry--A0-extension'
ARCHIVE='0e1436f5f79203563e911ada10d293dba7044ca2'
MANIFEST_SHA='c899a5476df088bf899ceeedf25f34c1f4426a323f9afad93607162d4c5599aa'
PAYLOAD_SHA='17229d3ca4356bb77a6efdc09ff3eaef501780c681870e673348b24a48762c96'
EXPECTED={'packets': '24009c527d2753e1a31652369d59857c009bc908d98b30df72e9cf33d936ad6e', 'readmes': 'bfb22fcb36b29352dd8f48d0392087e4c734df906564cb28b956d7b2867dd2f4', 'suggested': 'faee3040185ce47a3426446e9a06bb6367c9d941523af273fe78c95158c47373'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED FIXED BAND CHART REFINEMENTS PAYLOAD\n',1)[1].split('END ARCHIVED FIXED BAND CHART REFINEMENTS PAYLOAD -/',1)[0].encode()
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

## Public recovery and replay

Archive commit `68dab44da9060df898cd2f8c36053738d7b59447` is an ancestor changing only this issue's suggested file. Its 72 inert artifacts include all 11 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `71725cdc1330306335f8e0a2289cc383fe8bc001ff4235ff8290fb2cc7186be3`; payload SHA256 `20790ed51cf4cdfa6d7e837993e93190fae76385125d2814a345317896b6081b`. The final suggested file has no archive payload and preserves the complete Tau Ceti-import planning text.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and four final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set MODULI_VALIDATE_BASE to the mathematical base to reproduce Verification-math.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Canonical.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean is the Mathlib-only projection; Suggested.lean is the complete uncompiled Tau Ceti-import file. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

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
