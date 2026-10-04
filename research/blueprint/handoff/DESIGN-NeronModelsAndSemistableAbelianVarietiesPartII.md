# Actual conductor Scheme descent — checkpoint

Agent: Codex — codex-7e92bd. Refs #3378. The design remains partial and every implementation remains unchecked.

For every finite schematically dominant morphism of actual schemes f:Y→P, compatible scheme maps y:Y→T and z:C_f→T descend to a specified scheme morphism P→T. Its two triangles, uniqueness and scheme postcomposition compatibility have native proofs. The exact pre-existing conductor_global_isPushout theorem now has a native proof at its unchanged header. There is no duplicate categorical target node. T is any scheme in the same universe, with no affine or separation assumption.

Write I=conductorIdealSheaf f, J=I.comap f, C_f=I.subscheme and D_f=J.subscheme. All four arrows remain the actual native ones: J.subschemeι, conductorMap f, f and I.subschemeι. The supplied compatibility is equality of scheme morphisms i≫y=g≫z, not only equality on points. The inherited continuous descent produces the base map d and identifies both actual inverse-image opens. For every open U of T, the existing actual ring pullback lifts the restricted y and z section maps to Γ(P,d⁻¹U). The two projections prove naturality under arbitrary restrictions. This assembles the actual presheaf morphism O_T→d_*O_P and a native PresheafedSpace morphism between the existing structure sheaves.

Native extensionality proves both ringed-space triangles, retaining the required equality transports on opens. Locality is proved separately: choose q∈Y over p∈P through the finite surjective map. The source ringed-space triangle and native stalk composition identify the composite stalk homomorphism with the local map induced by y, up to the native equality transport. The actual isLocalHom_of_comp theorem implies that the first factor is local. This supplies the native locally ringed-space and scheme morphism constructors. Surjectivity identifies the base maps of any two candidates, and the every-open ring pullback identifies their section maps. The two triangles then give scheme postcomposition by uniqueness.

No affine, Noetherian, reduced, separated, birational, nonempty or separability assumption is added to the global conductor theorem. This is a conductor-specific universal property using an already existing scheme P; it does not construct a scheme for an arbitrary Ferrand datum or assert an algebraic-space target theorem. Generic ringed-space, sheaf, local-ring, scheme and categorical carriers are reused from Mathlib.

Twenty-one nodes(5 constructions,16 lemmas),18 consumed API references and15 distinct typed examples(17 references) are appended. All675 incoming node contracts are preserved:674 whole node objects are unchanged; the existing conductor-scheme-pushout node gains only appended prerequisites and proof steps, preserving its statement, hypotheses, sources and acceptance conditions. Eighteen baseline declarations are appended to482 inherited ones. All29 planets,18 gaps,23 requests,26 source findings,78 routes and seven partial stages remain unchanged. The new G.0 frontier records the native Scheme-universal-property substep without promoting the roadmap or marking an implementation formalised.

The tests cover both underlying triangles, inverse images of intersections, empty-open sections, arbitrary restriction and two successive restrictions, actual presheaf components, full ringed-space triangles, locality at arbitrary points, identity reconstruction from the actual conductor square, identity descent into arbitrary scheme targets, the empty Spec(ZMod1), nonreduced Spec(ZMod4) with its nonzero square-zero element2, the actual globally glued cusp normalization over every field, and the actual inseparable quadratic normalization q=t²−s over F₂(s). The latter two use inherited actual global schemes and normalization maps, not substitute affine spectra.

## Reading and ownership

The entire18717-character issue was read before claiming and after bot5978073322 confirmed claim5978072374. Both reads cover0–10000 and10000–18717; the issue body was unchanged. ClaimReceipt.json records the exact hash. WORKERS and expansion PROTOCOL were freshly read in full; the immediately preceding own6058 job freshly covered blueprint sections9–15, and this job reread sections0–3. Remaining own protocol, upstream, key, supplier, source and touching-link readings retain their original bounded scopes at unchanged controls.

OwnPreviousManifest.json authenticates own6047's original Reading.json and InputGuard.json and its nested own6039 original reading, guard and manifest. OwnReadingReuse.json compares29 controls:23 unchanged,6 changed. No whole-file reading is inferred from hash equality, and no peer reading is adopted as this worker's personal reading. The reviewed parentR11.1–R11.6 library-coverage rows and REV-AUDIT-10 review metadata were freshly read; no PartII row exists. This is not a new full reading of the entire historical reviewer report.

Current G.0 description and all frontier entries, G1–6 remaining coverage, the whole reserved ferrand-pushouts node/API/tests, the whole global geometric and categorical conductor nodes, all seven conductor/pushout/sheaf-touching requests, and the final two relevant gaps were read. The current SF.0 frontier was freshly read. Its relevant native quotient/kernel/closed-section contracts were already consumed while producing own6058 in this same continuous session; the generic supplier remains at its owner. Publication refresh advances that supplier to own6058. Its final frontier was reread and PublicationChanges.json records the single changed guard and precise scope. All23 requests remain untouched.

Incoming peer PR6057 at immutable head d5cc7461550b31a7fc966e40445e5a1bc24e2eec was actually recovered over public HTTP. Its71 artifacts,10 archived/public-fence helpers and five final deliverables were authenticated. Both actual immutable verifiers reproduced their publication and mathematical reports byte-for-byte. The current mathematical handoff narrative, complete recovery and ten helper scripts, all9 new proofs and8 tests, and the exact existing geometric predicate/proof were read. All three Lean prefixes are bound to that manifest. Incoming recovery proves provenance, not a fresh exhaustive audit of all675 historical nodes or8419 inherited native lines.

The consumed conductorChartMap, commutativity and restriction block6425–6490 and the actual all-open pullback/open-section comparison block7405–7495 were freshly read. The exact existing Scheme theorem header1007–1023 was read and is matched mechanically against the new native counterpart. BaselineReading.json records each consumed named native declaration; Reading.json/BaselineRanges.json record exact source-file hashes and actual reading ranges. The proofs use native appLE/naturality, pullback lift/extensionality, PresheafedSpace and Scheme morphism extensionality, stalk composition/congruence and isLocalHom_of_comp. Exact new-name searches at both pins found no matching declarations within the stated algebraic-geometry/ringed-space scope; this is not an exhaustive online absence survey.

Fresh primary reading comprises the complete displayed Stacks37.14.1 and37.67.3 statements and proofs, including their zero-page-comment boundary. Section-level comments were not newly read. SourceReading.json records actual HTTP hashes and access times. The affine pushout argument supplies the sheaf-map and point-lift locality pattern; the global finite schematically dominant conductor extension is an authored deduction using earlier actual reconstruction. The previously recorded notation errors are retained without duplicate findings. All26 source findings retain their original scopes. The verifier independently enumerates the inherited32-element F₂ block-matrix algebra and all1024 products; the special curve-image dimension argument remains a recorded gap. No whole-paper, recursive source-closure or exhaustive correction audit is claimed.

## Validation and limits

Native.lean preserves the entire authenticated8419-line incoming native prefix and appends21 new proof bodies, the exact existing Scheme theorem proof,15 examples and22 new audits. It compiles without errors, warnings or admissions, with571 axiom audits containing only propext,Classical.choice and Quot.sound. The bounded Sketch preserves its entire incoming prefix and appends the same21 planning headers, existing Scheme theorem header and15 examples. It compiles with800 admission-only warnings and20 inherited clean axiom audits. All new and existing headers match their native/admitted counterparts; the five concrete construction bodies remain intact in the planning projection. An exact inherited native prefix was compiled once into disposable own proof-module output for fast prototypes; the final check nevertheless replays the complete native source. No library was built. An early incomplete native diagnostic run was stopped, and the final corrected run is the only claimed receipt.

The full Tau-importing Canonical.lean/Suggested.lean remains UNCOMPILED. It retains the complete incoming canonical prefix after two explicit Mathlib imports and appends the21 new planning declarations and15 examples. The existing conductor_global_isPushout header remains in the inherited prefix, without duplication. A fresh build probe finds the available Tau build at cf386627e9176a3827c1a5fe804989fd94a4d216 rather than required f790474821cf4256814db967cb154e7af3d0c369, and all five direct Tau compiled imports are absent. The prescribed source checkout is pinned and tracked-clean. No Lake setup, cache download, library build or language server was used. All Lean checks were serial, checked immediately for≥20GiB available, capped at8GiB and1200seconds.

- Native.lean: 8790 lines, 304 examples, 0 warnings, 571 axiom audits, exit0. Source SHA256 `7b00f7a23255d2ff3af1351b385d7861ec8fcb49663eca97de0eaf2959aa7286`; diagnostic SHA256 `57b55b603c4837159afeb27390d5c1aa9d39a2eff77115bcf3e3295b8417009b`. Serial run: 52GiB available beforehand, 119.32s, 7301808KiB maximum RSS.
- Sketch.lean: 5622 lines, 323 examples, 800 warnings, 20 axiom audits, exit0. Source SHA256 `7752d29526a53b92745ea18fbb3c6cacb0423ab46dd2cd9db4facd530795c42a`; diagnostic SHA256 `6ca34e57bd53fecde290225cc3aedabab0a8d6ae68ee9f7191047f2cb7b224b3`. Serial run: 51GiB available beforehand, 84.0s, 7115516KiB maximum RSS.

Suggested.lean equals Canonical.lean exactly, SHA256 `fdf3fe4aa8229c17f6b711cd7943ff8926a3ab4d1d831a64796fd0269a9fc83c`. The full Tau-dependent file is not certified by the bounded projection.

The actual indexed packet checker, source-issue and intake checks have no errors or warnings/refusals. The packet has696 nodes,429 API references,415 raw test references,500 baseline declarations,29 planets,18 gaps and23 requests. Exact recognized-test counts and all actual outputs appear in Verification.json. The graph and verifier execute the actual immutable atlas assembler, checker and intake functions at mathematical base `686cfb1b7f65ff3d72e21b8dc5ce9f9f579fdef6` and publication control `4ae85ec4bf15b17e66fe8b22db9b7e1cb5cc25f4`. The queue's non-state issue contract is checked unchanged. The single changed supplier guard is explicitly scoped in PublicationChanges.json.

The publication graph has stage 3043/8727, own 696/1660 and scoped 3710/11271 vertices/edges, all acyclic. All 69 required supplier paths are reachable. Owned dependencies resolve with no skipped or pending links. Whole foreign roadmap/stage objects and all stage edges match the publication control. The 45 unrelated preexisting missing restructure paths remain unchanged.

## Resume

Use conductorDescApp and its two projection, uniqueness and restriction lemmas; conductorDescPresheaf; conductorDescRingedSpace and its triangles/locality; conductorSchemeDesc with both triangles, uniqueness and postcomposition; and the exact existing conductor_global_isPushout native proof. The topology, actual sheaf reconstruction and actual Scheme universal property are now separately evidenced for the finite schematically dominant conductor square.

Next conductor integration is recomputation under flat base change: identify the actual base-changed algebra-image quotient/cokernel and pullback conductor ideals and sheaf maps using the SF.0 annihilator/quotient supplier. Generic Ferrand algebraic-space existence and the scheme affine-neighborhood criterion remain separate obligations. P¹/Proj identifications, projectivity/properness, coherent H0/H1 and genus, separate I₂ and all later model/classification work remain required. Keep every existing gap, request, route and source obligation. This checkpoint does not close the broader reserved Ferrand key or the small-étale-site obligations.

## Public recovery and replay

Archive commit `2bf039888dce45bd6fae3408e91c3627b6c4ecfe` is an ancestor changing only this issue's suggested file. Its 72 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `dde63f3028cfe79790175a6cbdc32d1bbd0ebb2902ed6151f9394641aa52f1d8`; payload SHA256 `0a06b10591e19a030a0de425292df1bc01633f980e5b8f4a4b9d9cfb75183c38`. The final suggested file has no archive payload and equals Canonical.lean, whose full Tau-importing file remains UNCOMPILED.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count and all ten exact public helper fences, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set NERON_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Sketch.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. The full Tau-importing Canonical.lean/Suggested.lean is not covered by these checks and remains UNCOMPILED. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Helper: assemble.py

```python
"""Append exact scheme-descent planning headers; replay the unchanged existing Scheme target."""
from pathlib import Path
import re,sys
S=Path(sys.argv[1]).resolve();sys.path.insert(0,str(S))
from projection import admit_lemmas
def text(n):return (S/n).read_text()
proofs=text('NewProofs.lean');tests=text('NewTests.lean');existing=text('ExistingSchemeProof.lean')
names=re.findall(r'^(?:noncomputable )?(?:def|lemma|theorem) (\w+)',proofs,re.M);assert len(names)==21
assert len(re.findall(r'^example\b',tests,re.M))==15
for name,body in [('NewAdmitted.lean',proofs),('TestsAdmitted.lean',tests),('ExistingSchemeAdmitted.lean',existing)]:
 (S/name).write_text(admit_lemmas(body))
audits=''.join('#print axioms TauCeti.GenusOne.FerrandPushout.'+n+'\n' for n in names+['conductor_global_isPushout'])
(S/'Audits.lean').write_text(audits)
addition=admit_lemmas(proofs)+'\n'+admit_lemmas(tests)
assert len(re.findall(r'\bsorry\b',addition))==31
(S/'CanonicalAddition.lean').write_text(addition)
imports='import Mathlib.Geometry.RingedSpace.Stalks\nimport Mathlib.RingTheory.LocalRing.RingHom.Basic\n'
(S/'ImportAddition.lean').write_text(imports)
(S/'Native.lean').write_text(text('NativePrefix.lean')+'\n'+proofs+'\n'+existing+'\n'+tests+'\n'+audits)
(S/'Sketch.lean').write_text(text('SketchPrefix.lean')+'\n'+admit_lemmas(proofs)+'\n'+admit_lemmas(existing)+'\n'+admit_lemmas(tests))
(S/'Canonical.lean').write_text(imports+text('CanonicalPrefix.lean')+'\n'+addition)
(S/'Suggested.lean').write_text(text('Canonical.lean'))
```

## Helper: author.py

```python
"""Plan actual conductor scheme descent; preserve inherited contracts and supplier boundaries."""
from pathlib import Path
import copy,csv,json,re,sys
S=Path(__file__).resolve().parent;RID='NeronModelsAndSemistableAbelianVarietiesPartII';P=RID+':G.0/';NS='TauCeti.GenusOne.FerrandPushout.'
def load(n):return json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
p=copy.deepcopy(load('Incoming.json'));road=load('Incoming-roadmap.json')
# Each row is one actual declaration, including its exact nonroutine prerequisites.
specs=[
('conductor-descent-base','conductorDescBase','construction','The underlying map for scheme descent','Given compatible scheme morphisms y:Y→T and z:C_f→T, define the native TopCat morphism d:P→T by the existing continuous conductor descent applied to their actual underlying maps.',['conductorGlobalDesc','mathlib:TopCat.ofHom'],'Apply the actual continuous descent to the pointwise equality obtained by forgetting the supplied scheme square.'),
('conductor-descent-base-source','conductorDescBase_source','lemma','The underlying source triangle','The composite of the underlying map of f with d equals the underlying map of y.',['conductorDescBase','conductorGlobalDesc_source'],'Use native TopCat extensionality and the existing pointwise source triangle.'),
('conductor-descent-base-closed','conductorDescBase_closed','lemma','The underlying closed triangle','The composite of the actual inclusion C_f→P with d equals the underlying map of z.',['conductorDescBase','conductorGlobalDesc_closed'],'Use native TopCat extensionality and the existing pointwise closed triangle.'),
('conductor-descent-preimage-source','conductorDescBase_preimage_source','lemma','Actual source preimages for descent','For every open U of T, f⁻¹(d⁻¹U)=y⁻¹U as actual opens of Y.',['conductorDescBase_source'],'Apply the inverse-image functor on opens to the actual source triangle.'),
('conductor-descent-preimage-closed','conductorDescBase_preimage_closed','lemma','Actual closed preimages for descent','For every open U of T, the inverse image of d⁻¹U under C_f→P equals z⁻¹U as actual opens of C_f.',['conductorDescBase_closed'],'Apply the inverse-image functor on opens to the actual closed triangle.'),
('conductor-descent-section-compatible','conductorDescApp_compatible','lemma','Compatible sections on the actual overlap','For every target open U, restrict the actual y and z section maps using the two descent-preimage equalities. Their composites to Γ(D_f,i⁻¹f⁻¹d⁻¹U) agree through i.app and the existing conductorChartMap.',['conductorDescBase_preimage_source','conductorDescBase_preimage_closed','conductorChartMap','mathlib:AlgebraicGeometry.Scheme.Hom.appLE_comp_appLE','mathlib:AlgebraicGeometry.Scheme.Hom.app_eq_appLE'],'Express both composites as appLE of i≫y and g≫z. The supplied equality of scheme morphisms identifies them, with dependent open-domain inequalities retained.'),
('conductor-descent-section-map','conductorDescApp','construction','The descended map on every open','For each open U of T, construct the native commutative-ring morphism Γ(T,U)→Γ(P,d⁻¹U) by the actual every-open conductor pullback and the two compatible restricted section maps.',['conductorDescApp_compatible','conductor_open_isPullback','mathlib:CategoryTheory.IsPullback.lift'],'Use the native IsPullback lift; its carrier is the existing structure sheaf on P, not a replacement ring of pairs.'),
('conductor-descent-section-source','conductorDescApp_source','lemma','The descended source section map','Composing the descended section map with f.app on d⁻¹U gives y.appLE on the exact source inverse image.',['conductorDescApp','mathlib:CategoryTheory.IsPullback.lift_fst'],'Apply the native pullback-lift first projection identity.'),
('conductor-descent-section-closed','conductorDescApp_closed','lemma','The descended closed section map','Composing the descended section map with the actual C_f→P section map gives z.appLE on the exact closed inverse image.',['conductorDescApp','mathlib:CategoryTheory.IsPullback.lift_snd'],'Apply the native pullback-lift second projection identity.'),
('conductor-descent-section-unique','conductorDescApp_unique','lemma','Uniqueness of the descended section map','Any ring morphism Γ(T,U)→Γ(P,d⁻¹U) with both specified section projections equals the descended section map.',['conductorDescApp_source','conductorDescApp_closed','conductor_open_isPullback','mathlib:CategoryTheory.IsPullback.hom_ext'],'Use both projections of the actual ring pullback to compare the candidate morphisms.'),
('conductor-descent-section-natural','conductorDescApp_naturality','lemma','Descent respects arbitrary restrictions','For every restriction U→V in the opposite opens of T, restriction followed by the V section map equals the U section map followed by restriction on the actual inverse-image opens of P.',['conductorDescApp_source','conductorDescApp_closed','conductor_open_isPullback','mathlib:CategoryTheory.IsPullback.hom_ext','mathlib:AlgebraicGeometry.Scheme.Hom.naturality','mathlib:AlgebraicGeometry.Scheme.Hom.appLE_map','mathlib:AlgebraicGeometry.Scheme.Hom.map_appLE'],'Check the two pullback projections using the native naturality and appLE restriction identities. No basis-only or affine-open assertion substitutes for all-open naturality.'),
('conductor-descent-presheaf','conductorDescPresheaf','construction','The actual descended presheaf morphism','Assemble the descended section maps into a native natural transformation O_T→d_*O_P on all opens of T. Its components are exactly conductorDescApp and its naturality is the proved restriction identity.',['conductorDescApp','conductorDescApp_naturality'],'Use the native presheaf pushforward and natural-transformation constructor, retaining actual components and the naturality witness in the planning signature.'),
('conductor-descent-ringed-space','conductorDescRingedSpace','construction','The descended morphism of ringed spaces','Construct a native PresheafedSpace morphism from the underlying ringed space of P to that of T, with base d and presheaf map conductorDescPresheaf. Both prescribed presheaves are the actual structure sheaves; locality is proved separately.',['conductorDescBase','conductorDescPresheaf','mathlib:AlgebraicGeometry.PresheafedSpace.Hom'],'Pair the actual continuous map and actual natural transformation using the native morphism constructor; no new ringed-space carrier is introduced.'),
('conductor-descent-ringed-source','conductorDescRingedSpace_source','lemma','The source triangle as ringed spaces','Composing the underlying PresheafedSpace morphism of f with the descended ringed-space map equals the underlying morphism of y, including the entire sheaf map.',['conductorDescRingedSpace','conductorDescBase_source','conductorDescBase_preimage_source','conductorDescApp_source','mathlib:AlgebraicGeometry.PresheafedSpace.ext','mathlib:TopCat.Presheaf.ext','mathlib:AlgebraicGeometry.Scheme.Hom.appLE_map','mathlib:AlgebraicGeometry.Scheme.Hom.appLE_eq_app'],'Use native extensionality, the actual base triangle, and the section projection after the required equality transport on opens. The native appLE composition removes the inverse transport.'),
('conductor-descent-ringed-closed','conductorDescRingedSpace_closed','lemma','The closed triangle as ringed spaces','Composing the underlying actual C_f→P morphism with the descended ringed-space map equals the underlying morphism of z, including the entire sheaf map.',['conductorDescRingedSpace','conductorDescBase_closed','conductorDescBase_preimage_closed','conductorDescApp_closed','mathlib:AlgebraicGeometry.PresheafedSpace.ext','mathlib:TopCat.Presheaf.ext','mathlib:AlgebraicGeometry.Scheme.Hom.appLE_map','mathlib:AlgebraicGeometry.Scheme.Hom.appLE_eq_app'],'Use the same native extensionality argument with the actual closed inclusion and its dependent inverse-image transport.'),
('conductor-descent-local-stalks','conductorDescRingedSpace_isLocalHom','lemma','Locality of the descended stalk maps','At every point p of P, the descended map O_T,d(p)→O_P,p is a local ring homomorphism.',['conductorDescRingedSpace_source','mathlib:AlgebraicGeometry.Scheme.Hom.isClosedMap','mathlib:AlgebraicGeometry.surjective_of_isDominant_of_isClosed_range','mathlib:AlgebraicGeometry.PresheafedSpace.stalkMap.comp','mathlib:AlgebraicGeometry.PresheafedSpace.stalkMap.congr_hom','mathlib:isLocalHom_of_comp'],'Choose q∈Y above p using finite schematic dominance. The source ringed-space triangle identifies the composite stalk map with that of y, up to the native equality transport. This composite is local; the native isLocalHom_of_comp theorem gives locality of the first factor. No stalkwise surjectivity or separability hypothesis is used.'),
('conductor-scheme-descent','conductorSchemeDesc','construction','The actual descended scheme morphism','Construct the scheme morphism P→T whose underlying ringed-space morphism is conductorDescRingedSpace and whose locality witness is the proved local-stalk theorem.',['conductorDescRingedSpace','conductorDescRingedSpace_isLocalHom','mathlib:AlgebraicGeometry.LocallyRingedSpace.Hom','mathlib:AlgebraicGeometry.Scheme.Hom'],'Use the native locally ringed-space and scheme morphism constructors on the already existing schemes. Scheme existence is not an assumption or a new carrier.'),
('conductor-scheme-descent-source','conductorSchemeDesc_source','lemma','The descended scheme source triangle','The composite f≫conductorSchemeDesc equals y as an actual scheme morphism.',['conductorSchemeDesc','conductorDescRingedSpace_source','mathlib:AlgebraicGeometry.Scheme.Hom.ext\'','mathlib:AlgebraicGeometry.LocallyRingedSpace.Hom.ext\''],'Apply native scheme and locally ringed-space extensionality to the proved ringed-space source triangle.'),
('conductor-scheme-descent-closed','conductorSchemeDesc_closed','lemma','The descended scheme closed triangle','The actual conductor inclusion C_f→P followed by conductorSchemeDesc equals z as a scheme morphism.',['conductorSchemeDesc','conductorDescRingedSpace_closed','mathlib:AlgebraicGeometry.Scheme.Hom.ext\'','mathlib:AlgebraicGeometry.LocallyRingedSpace.Hom.ext\''],'Apply native extensionality to the proved closed ringed-space triangle.'),
('conductor-scheme-descent-unique','conductorSchemeDesc_unique','lemma','Uniqueness against every scheme target','Any scheme morphism m:P→T with f≫m=y and (C_f→P)≫m=z equals conductorSchemeDesc. T is an arbitrary scheme, including nonaffine and nonseparated targets.',['conductorSchemeDesc','conductorDescBase_source','conductorDescApp_unique','mathlib:AlgebraicGeometry.Scheme.Hom.isClosedMap','mathlib:AlgebraicGeometry.surjective_of_isDominant_of_isClosed_range','mathlib:AlgebraicGeometry.Scheme.Hom.ext','mathlib:AlgebraicGeometry.Scheme.Hom.appLE_comp_appLE','mathlib:AlgebraicGeometry.Scheme.Hom.app_eq_appLE'],'Surjectivity identifies the underlying maps. After transporting the actual inverse-image opens, both section triangles identify the section maps by the ring pullback uniqueness. Native scheme extensionality then proves equality.'),
('conductor-scheme-descent-natural','conductorSchemeDesc_natural','lemma','Descent commutes with scheme postcomposition','For every scheme morphism m:T→T′, conductorSchemeDesc followed by m equals the descent of y≫m and z≫m with their transported compatibility.',['conductorSchemeDesc_unique','conductorSchemeDesc_source','conductorSchemeDesc_closed'],'Apply scheme-descent uniqueness and the two actual triangles, using associativity.')]
assert len(specs)==21
ids={n['declarationName'].split('.')[-1]:n['id'] for n in p['nodes'] if n.get('declarationName')}
ids.update({name:P+slug for slug,name,*_ in specs})
common=['Y,P,T are actual schemes in a common universe; f:Y→P is finite and schematically dominant. I=conductorIdealSheaf f, J=I.comap f, C_f=I.subscheme, D_f=J.subscheme, i=J.subschemeι and g=conductorMap f.','The supplied y:Y→T and z:C_f→T satisfy i≫y=g≫z as scheme morphisms, not merely as point maps. Every open is allowed. No affine, Noetherian, reduced, separated, birational, nonempty or separability assumption is added.']
nodes=[]
for slug,name,kind,title,statement,deps,proof in specs:
 nodes.append(dict(id=P+slug,parentStageId=RID+':G.0',realises=[RID+':G.0'],kind=kind,title=title,declarationName=NS+name,statement=statement,hypotheses=common,prerequisites=[d if d.startswith('mathlib:')else ids[d]for d in deps],proofSteps=[proof],acceptance=[statement,'Use actual all-open structure-sheaf maps and native scheme morphisms; retain nilpotents and the empty scheme.'],library=dict(module='TauCeti/AlgebraicGeometry/GenusOne/G0',namespace=NS[:-1]),sources=[dict(sourceId='conductor-scheme-descent-7e92bd-0ET0',locator='Lemma37.14.1, complete displayed statement/proof and zero-page-comment boundary',excerpt='morphism of schemes',match='The affine proof constructs the sheaf map and checks locality using a point lift. The global finite schematically dominant conductor extension is an authored deduction from the earlier actual topology and all-open conductor pullback, with native restriction and stalk APIs.')],api=[],tests=[],implementationStatus='unchecked'))
by={n['declarationName'].split('.')[-1]:n for n in nodes}
testrows=[
('base_triangles','compatibility','Both actual TopCat triangles hold simultaneously for a compatible pair of scheme morphisms.'),
('preimages','compatibility','Both source and closed preimages of the intersection of two arbitrary target opens agree with the actual y and z inverse images.'),
('empty_sections','degenerate','The actual descended section map on the empty target open sends every section to zero, using the zero ring on the empty inverse image.'),
('restriction','compatibility','An arbitrary target-open inclusion commutes with the descended section map and the actual inverse-image restriction.'),
('presheaf_triangles','compatibility','The components of the actual descended natural transformation satisfy both section triangles on every target open.'),
('presheaf_empty','degenerate','The actual natural-transformation component on the empty open has its value in the zero ring.'),
('presheaf_two_restrictions','compatibility','Two successive arbitrary target-open restrictions agree with the single actual inverse-image restriction through the descended natural transformation.'),
('ringed_triangles','compatibility','Both triangles hold as full native PresheafedSpace morphisms, including their sheaf components and dependent base transports.'),
('local_stalks','compatibility','At every point of the actual target P the descended ringed-space stalk homomorphism is local.'),
('scheme_reconstruction','compatibility','Descending the actual f and actual conductor inclusion into P reconstructs the identity scheme morphism of P.'),
('identity_arbitrary_target','degenerate','For f=id_P and any compatible maps into any scheme T, descent equals y, with no affine restriction on P or T.'),
('empty_scheme','degenerate','The identity on Spec(ZMod1), an empty scheme, gives the actual categorical conductor pushout in Scheme.'),
('nonreduced_scheme','degenerate','The identity on Spec(ZMod4) gives the actual categorical conductor pushout while2 remains nonzero and square-zero in the ring.'),
('cusp_scheme_pushout','compatibility','The actual globally glued quadratic cusp normalization with a=b=0 over every field has its categorical conductor pushout in Scheme.'),
('inseparable_scheme_pushout','compatibility','The actual global quadratic normalization for q=t²−s over F₂(s) has its categorical conductor pushout, without separability or rational-branch hypotheses.')]
tests={a:dict(name='ConductorSchemeDescentChecked.'+a,kind=b,statement=c)for a,b,c in testrows}
assign={
'conductorDescBase':(['conductorDescBase_source','conductorDescBase_closed','conductorDescBase_preimage_source','conductorDescBase_preimage_closed'],['base_triangles','preimages','identity_arbitrary_target']),
'conductorDescApp':(['conductorDescApp_source','conductorDescApp_closed','conductorDescApp_unique','conductorDescApp_naturality'],['empty_sections','restriction','presheaf_triangles']),
'conductorDescPresheaf':(['conductorDescApp_source','conductorDescApp_closed','conductorDescApp_naturality'],['presheaf_triangles','presheaf_empty','presheaf_two_restrictions']),
'conductorDescRingedSpace':(['conductorDescRingedSpace_source','conductorDescRingedSpace_closed','conductorDescRingedSpace_isLocalHom'],['ringed_triangles','local_stalks','cusp_scheme_pushout']),
'conductorSchemeDesc':(['conductorSchemeDesc_source','conductorSchemeDesc_closed','conductorSchemeDesc_unique','conductorSchemeDesc_natural'],['scheme_reconstruction','identity_arbitrary_target','empty_scheme','nonreduced_scheme','inseparable_scheme_pushout'])}
for name,(api,ts)in assign.items():
 by[name]['api']=[dict(name=NS+a,role='compatibility',statement=by[a]['statement'])for a in api]
 by[name]['tests']=[tests[t]for t in ts]
 by[name]['uses']=[dict(where=P+'conductor-scheme-pushout',how='Supply the actual section, ringed-space or scheme map needed for the existing categorical conductor universal property.')]
existing=next(n for n in p['nodes']if n['id']==P+'conductor-scheme-pushout')
existing['prerequisites'] += [ids[a]for a in ['conductorSchemeDesc','conductorSchemeDesc_source','conductorSchemeDesc_closed','conductorSchemeDesc_unique']]+["mathlib:CategoryTheory.Limits.PushoutCocone.isColimitAux'"]
existing['proofSteps'].append('A direct native counterpart now constructs conductorSchemeDesc from the actual all-open ring pullback, proves locality using surjective point lifts and native stalk composition, and supplies both triangles and uniqueness. Apply the native PushoutCocone colimit constructor to this actual scheme cocone. The original statement, hypotheses and acceptance conditions are unchanged; the broader generic GeometricPushout.lift route remains a separate planned contract.')
p['nodes']+=nodes
rows=list(csv.reader(Path(sys.argv[1]).open(),delimiter='\t'));have={x['ref']for x in p['baseline']['declarations']};baseline=[];reading=[]
refs=sorted({d.removeprefix('mathlib:')for n in nodes+[existing]for d in n['prerequisites']if d.startswith('mathlib:')})
for name in refs:
 row=next(r for r in rows if len(r)>5 and r[0]=='mathlib' and r[1]==name)
 reading.append(dict(name=name,file=row[3],line=int(row[4]),signature=row[5],scope='Actual statement and ambient binders read at the prescribed pin, with file hashes/ranges recorded in Reading.json; earlier bounded reading retained for inherited references.'))
 if 'mathlib:'+name not in have:baseline.append(dict(ref='mathlib:'+name,kind=row[2],module=row[3],line=int(row[4]),provides=row[5]+' Reuse the native pullback, scheme, presheaf or stalk API at its actual scope.',checked='Codex — codex-7e92bd read this declaration at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-10-04.'))
p['baseline']['declarations']+=baseline;save('BaselineReading.json',reading)
sources=[]
for row,tag,title in zip(load('SourceReading.json'),['0ET0','0E25'],['Affine pushout universal property and locality','Global pushouts along closed immersions and integral maps']):
 sources.append(dict(id='conductor-scheme-descent-7e92bd-'+tag,title=title,authors='The Stacks Project authors',edition='Current displayed page, 4 October 2026',url=row['url'],sha256=row['sha256'],accessed=row['accessedUTC'],readSections=[row['scope']]))
p['sources']+=sources
frontier='The actual global conductor square for every finite schematically dominant scheme morphism now has an explicit descended scheme morphism to every compatible scheme target. Twenty-one declarations construct the actual base map, every-open ring maps, their natural transformation, ringed-space morphism and stalk-local scheme morphism, with both triangles, uniqueness and scheme postcomposition. A native proof realizes the exact existing conductor_global_isPushout header without a duplicate target node. No affine, Noetherian, reduced, separated, birational, nonempty or separability assumption is added. This closes this native Scheme-universal-property substep; it does not establish generic Ferrand algebraic-space existence, recomputed flat conductors, P¹/Proj, properness/projectivity, coherent cohomology, separate I₂ or later classification/model obligations. All18 gaps,23 requests,26 source findings,78 routes and seven partial stages remain, all implementations unchecked; the full Tau-dependent suggested file is UNCOMPILED.'
p['summary']+=' Actual conductor Scheme descent continuation:21 declarations(5 constructions,16 lemmas),18 API references and15 distinct typed examples(17 references). All675 incoming node contracts are preserved;674 whole objects are unchanged, and the existing Scheme pushout node gains only appended prerequisites/proof steps.'
next(x for x in p['coverage']if x['stageId']==RID+':G.0')['remaining'].append(frontier)
next(x for x in road['stages']if x['key']=='G.0')['description']+=' '+frontier
plan=dict(newNames=[n['declarationName']for n in nodes],newNodes=[n['id']for n in nodes],newApi=[a for n in nodes for a in n['api']],newTests=list(tests.values()),newBaseline=baseline,newSources=sources,newSourceIssues=[],newGaps=[],changedExisting={existing['id']:['prerequisites','proofSteps']},existingNativeNames=[NS+'conductor_global_isPushout'],frontier=frontier)
for n,x in [('Candidate.json',p),(RID+'.json',p),('Candidate-roadmap.json',road),('NewNodes.json',nodes),('Plan.json',plan)]:save(n,x)
intro='''# Scheme morphisms descend through the actual conductor square

For every finite schematically dominant f:Y→P and compatible scheme maps y:Y→T and z:C_f→T, there is a specified scheme morphism P→T with both triangles and uniqueness. The target T is arbitrary in the same universe; it need not be affine or separated. The actual conductor closed subschemes and the existing schemes are retained, including nilpotents and empty schemes.

The earlier topological descent gives the underlying map d. Its two triangles identify the actual source and closed inverse-image opens. On every target open U, the existing conductor ring pullback lifts the restricted y and z section maps to Γ(P,d⁻¹U). The projections prove naturality for arbitrary restrictions, so these components assemble into the actual presheaf morphism O_T→d_*O_P. Native extensionality, including the required equality transports on opens, gives both full ringed-space triangles.

Locality is a separate step: lift p∈P to q∈Y through the finite surjective map. Stalk composition and the source triangle identify the composite stalk homomorphism with the local homomorphism induced by y. The native theorem that locality of a composite implies locality of its first factor proves the required condition. This produces an actual scheme morphism. Surjectivity and the every-open pullback then prove uniqueness; the two triangles prove scheme postcomposition compatibility.

The exact existing conductor_global_isPushout theorem receives a native proof from these maps. Its node gains appended prerequisites and proof steps, while its statement, hypotheses, sources and acceptance conditions remain unchanged. No duplicate target is added. All other674 incoming whole node objects are retained, together with29 planets,18 gaps,23 requests,26 source findings and78 routes. All seven stages remain partial and all implementations unchecked.

There are21 new declaration nodes,18 consumed API references and15 distinct typed tests(17 references across the five constructions). Tests include arbitrary-open restrictions and empty sections, actual presheaf and ringed-space triangles, local stalks, identity reconstruction, arbitrary scheme targets, the empty Spec(ZMod1), nonreduced Spec(ZMod4), the globally glued cusp and an inseparable quadratic example over F₂(s). The full Tau-dependent suggested file remains UNCOMPILED; the native counterpart and bounded Mathlib planning projection have separate compiler receipts.

Stacks37.14.1 supplies the affine universal-property and stalk-locality argument; Stacks37.67.3 supplies the global Ferrand context. The global finite schematically dominant conductor extension is an authored deduction from the earlier actual conductor reconstruction. Fresh displayed-page readings do not constitute a whole-paper or exhaustive correction audit. Incoming peer6057 evidence is publicly authenticated, while own historical reading scopes are reused only at unchanged controls and are not enlarged by hash equality.

'''+frontier+'\n\n'
parts=[intro]
for n in nodes:
 parts+=['## '+n['title']+'\n\n','**'+n['declarationName']+'** — '+n['statement']+'\n\n','Hypotheses: '+' '.join(n['hypotheses'])+'\n\n','Prerequisites: '+', '.join(n['prerequisites'])+'.\n\n','Proof: '+' '.join(n['proofSteps'])+'\n\n']
 for label,key in [('Consumed API','api'),('Typed examples','tests')]:
  if n[key]:parts+=[label+':\n\n']+['- **'+x['name']+'**: '+x['statement']+'\n'for x in n[key]]+['\n']
(S/'ReaderAddition.md').write_text(''.join(parts));(S/'Reader.md').write_text(''.join(parts)+(S/'IncomingReader.md').read_text())
print(json.dumps(dict(nodes=len(p['nodes']),newBaseline=len(baseline),baseline=len(p['baseline']['declarations']),newApi=len(plan['newApi']),newTests=len(plan['newTests']),testReferences=sum(len(n['tests'])for n in nodes),rawApi=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']))))
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
"""Write measured conductor Scheme-descent evidence and precise continuation boundaries."""
from pathlib import Path
import hashlib,json,re
S=Path(__file__).resolve().parent
def txt(n):return (S/n).read_text()
def data(n):return json.loads(txt(n))
sha=lambda b:hashlib.sha256(b).hexdigest()
def line(stem):
 r=data(stem+'.receipt.json');b=(S/(stem+'.lean')).read_bytes();assert r['exitStatus']==0
 return f"- {stem}.lean: {len(b.splitlines())} lines, {len(re.findall(r'^example\b',b.decode(),re.M))} examples, {r['warnings']} warnings, {r['axiomAudits']} axiom audits, exit0. Source SHA256 `{sha(b)}`; diagnostic SHA256 `{r['logSha256']}`. Serial run: {r['availableGiBBefore']}GiB available beforehand, {r['elapsedSeconds']}s, {r['maxRssKiB']}KiB maximum RSS.\n"
g=data('Graph.json');claim=data('ClaimReceipt.json')
h=f'''# Actual conductor Scheme descent — checkpoint

Agent: Codex — codex-7e92bd. Refs #3378. The design remains partial and every implementation remains unchecked.

For every finite schematically dominant morphism of actual schemes f:Y→P, compatible scheme maps y:Y→T and z:C_f→T descend to a specified scheme morphism P→T. Its two triangles, uniqueness and scheme postcomposition compatibility have native proofs. The exact pre-existing conductor_global_isPushout theorem now has a native proof at its unchanged header. There is no duplicate categorical target node. T is any scheme in the same universe, with no affine or separation assumption.

Write I=conductorIdealSheaf f, J=I.comap f, C_f=I.subscheme and D_f=J.subscheme. All four arrows remain the actual native ones: J.subschemeι, conductorMap f, f and I.subschemeι. The supplied compatibility is equality of scheme morphisms i≫y=g≫z, not only equality on points. The inherited continuous descent produces the base map d and identifies both actual inverse-image opens. For every open U of T, the existing actual ring pullback lifts the restricted y and z section maps to Γ(P,d⁻¹U). The two projections prove naturality under arbitrary restrictions. This assembles the actual presheaf morphism O_T→d_*O_P and a native PresheafedSpace morphism between the existing structure sheaves.

Native extensionality proves both ringed-space triangles, retaining the required equality transports on opens. Locality is proved separately: choose q∈Y over p∈P through the finite surjective map. The source ringed-space triangle and native stalk composition identify the composite stalk homomorphism with the local map induced by y, up to the native equality transport. The actual isLocalHom_of_comp theorem implies that the first factor is local. This supplies the native locally ringed-space and scheme morphism constructors. Surjectivity identifies the base maps of any two candidates, and the every-open ring pullback identifies their section maps. The two triangles then give scheme postcomposition by uniqueness.

No affine, Noetherian, reduced, separated, birational, nonempty or separability assumption is added to the global conductor theorem. This is a conductor-specific universal property using an already existing scheme P; it does not construct a scheme for an arbitrary Ferrand datum or assert an algebraic-space target theorem. Generic ringed-space, sheaf, local-ring, scheme and categorical carriers are reused from Mathlib.

Twenty-one nodes(5 constructions,16 lemmas),18 consumed API references and15 distinct typed examples(17 references) are appended. All675 incoming node contracts are preserved:674 whole node objects are unchanged; the existing conductor-scheme-pushout node gains only appended prerequisites and proof steps, preserving its statement, hypotheses, sources and acceptance conditions. Eighteen baseline declarations are appended to482 inherited ones. All29 planets,18 gaps,23 requests,26 source findings,78 routes and seven partial stages remain unchanged. The new G.0 frontier records the native Scheme-universal-property substep without promoting the roadmap or marking an implementation formalised.

The tests cover both underlying triangles, inverse images of intersections, empty-open sections, arbitrary restriction and two successive restrictions, actual presheaf components, full ringed-space triangles, locality at arbitrary points, identity reconstruction from the actual conductor square, identity descent into arbitrary scheme targets, the empty Spec(ZMod1), nonreduced Spec(ZMod4) with its nonzero square-zero element2, the actual globally glued cusp normalization over every field, and the actual inseparable quadratic normalization q=t²−s over F₂(s). The latter two use inherited actual global schemes and normalization maps, not substitute affine spectra.

## Reading and ownership

The entire18717-character issue was read before claiming and after bot{claim['confirmation']} confirmed claim{claim['claim']}. Both reads cover0–10000 and10000–18717; the issue body was unchanged. ClaimReceipt.json records the exact hash. WORKERS and expansion PROTOCOL were freshly read in full; the immediately preceding own6058 job freshly covered blueprint sections9–15, and this job reread sections0–3. Remaining own protocol, upstream, key, supplier, source and touching-link readings retain their original bounded scopes at unchanged controls.

OwnPreviousManifest.json authenticates own6047's original Reading.json and InputGuard.json and its nested own6039 original reading, guard and manifest. OwnReadingReuse.json compares29 controls:23 unchanged,6 changed. No whole-file reading is inferred from hash equality, and no peer reading is adopted as this worker's personal reading. The reviewed parentR11.1–R11.6 library-coverage rows and REV-AUDIT-10 review metadata were freshly read; no PartII row exists. This is not a new full reading of the entire historical reviewer report.

Current G.0 description and all frontier entries, G1–6 remaining coverage, the whole reserved ferrand-pushouts node/API/tests, the whole global geometric and categorical conductor nodes, all seven conductor/pushout/sheaf-touching requests, and the final two relevant gaps were read. The current SF.0 frontier was freshly read. Its relevant native quotient/kernel/closed-section contracts were already consumed while producing own6058 in this same continuous session; the generic supplier remains at its owner. Publication refresh advances that supplier to own6058. Its final frontier was reread and PublicationChanges.json records the single changed guard and precise scope. All23 requests remain untouched.

Incoming peer PR6057 at immutable head d5cc7461550b31a7fc966e40445e5a1bc24e2eec was actually recovered over public HTTP. Its71 artifacts,10 archived/public-fence helpers and five final deliverables were authenticated. Both actual immutable verifiers reproduced their publication and mathematical reports byte-for-byte. The current mathematical handoff narrative, complete recovery and ten helper scripts, all9 new proofs and8 tests, and the exact existing geometric predicate/proof were read. All three Lean prefixes are bound to that manifest. Incoming recovery proves provenance, not a fresh exhaustive audit of all675 historical nodes or8419 inherited native lines.

The consumed conductorChartMap, commutativity and restriction block6425–6490 and the actual all-open pullback/open-section comparison block7405–7495 were freshly read. The exact existing Scheme theorem header1007–1023 was read and is matched mechanically against the new native counterpart. BaselineReading.json records each consumed named native declaration; Reading.json/BaselineRanges.json record exact source-file hashes and actual reading ranges. The proofs use native appLE/naturality, pullback lift/extensionality, PresheafedSpace and Scheme morphism extensionality, stalk composition/congruence and isLocalHom_of_comp. Exact new-name searches at both pins found no matching declarations within the stated algebraic-geometry/ringed-space scope; this is not an exhaustive online absence survey.

Fresh primary reading comprises the complete displayed Stacks37.14.1 and37.67.3 statements and proofs, including their zero-page-comment boundary. Section-level comments were not newly read. SourceReading.json records actual HTTP hashes and access times. The affine pushout argument supplies the sheaf-map and point-lift locality pattern; the global finite schematically dominant conductor extension is an authored deduction using earlier actual reconstruction. The previously recorded notation errors are retained without duplicate findings. All26 source findings retain their original scopes. The verifier independently enumerates the inherited32-element F₂ block-matrix algebra and all1024 products; the special curve-image dimension argument remains a recorded gap. No whole-paper, recursive source-closure or exhaustive correction audit is claimed.

## Validation and limits

Native.lean preserves the entire authenticated8419-line incoming native prefix and appends21 new proof bodies, the exact existing Scheme theorem proof,15 examples and22 new audits. It compiles without errors, warnings or admissions, with571 axiom audits containing only propext,Classical.choice and Quot.sound. The bounded Sketch preserves its entire incoming prefix and appends the same21 planning headers, existing Scheme theorem header and15 examples. It compiles with800 admission-only warnings and20 inherited clean axiom audits. All new and existing headers match their native/admitted counterparts; the five concrete construction bodies remain intact in the planning projection. An exact inherited native prefix was compiled once into disposable own proof-module output for fast prototypes; the final check nevertheless replays the complete native source. No library was built. An early incomplete native diagnostic run was stopped, and the final corrected run is the only claimed receipt.

The full Tau-importing Canonical.lean/Suggested.lean remains UNCOMPILED. It retains the complete incoming canonical prefix after two explicit Mathlib imports and appends the21 new planning declarations and15 examples. The existing conductor_global_isPushout header remains in the inherited prefix, without duplication. A fresh build probe finds the available Tau build at cf386627e9176a3827c1a5fe804989fd94a4d216 rather than required f790474821cf4256814db967cb154e7af3d0c369, and all five direct Tau compiled imports are absent. The prescribed source checkout is pinned and tracked-clean. No Lake setup, cache download, library build or language server was used. All Lean checks were serial, checked immediately for≥20GiB available, capped at8GiB and1200seconds.

'''+line('Native')+line('Sketch')+f'''
Suggested.lean equals Canonical.lean exactly, SHA256 `{sha((S/'Canonical.lean').read_bytes())}`. The full Tau-dependent file is not certified by the bounded projection.

The actual indexed packet checker, source-issue and intake checks have no errors or warnings/refusals. The packet has696 nodes,429 API references,415 raw test references,500 baseline declarations,29 planets,18 gaps and23 requests. Exact recognized-test counts and all actual outputs appear in Verification.json. The graph and verifier execute the actual immutable atlas assembler, checker and intake functions at mathematical base `{txt('base.txt').strip()}` and publication control `{txt('publication-base.txt').strip()}`. The queue's non-state issue contract is checked unchanged. The single changed supplier guard is explicitly scoped in PublicationChanges.json.

The publication graph has stage {g['stageDAG']['vertices']}/{g['stageDAG']['edges']}, own {g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']} and scoped {g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']} vertices/edges, all acyclic. All {g['requiredPairs']} required supplier paths are reachable. Owned dependencies resolve with no skipped or pending links. Whole foreign roadmap/stage objects and all stage edges match the publication control. The {g['otherPreexistingMissingRestructurePairs']} unrelated preexisting missing restructure paths remain unchanged.

## Resume

Use conductorDescApp and its two projection, uniqueness and restriction lemmas; conductorDescPresheaf; conductorDescRingedSpace and its triangles/locality; conductorSchemeDesc with both triangles, uniqueness and postcomposition; and the exact existing conductor_global_isPushout native proof. The topology, actual sheaf reconstruction and actual Scheme universal property are now separately evidenced for the finite schematically dominant conductor square.

Next conductor integration is recomputation under flat base change: identify the actual base-changed algebra-image quotient/cokernel and pullback conductor ideals and sheaf maps using the SF.0 annihilator/quotient supplier. Generic Ferrand algebraic-space existence and the scheme affine-neighborhood criterion remain separate obligations. P¹/Proj identifications, projectivity/properness, coherent H0/H1 and genus, separate I₂ and all later model/classification work remain required. Keep every existing gap, request, route and source obligation. This checkpoint does not close the broader reserved Ferrand key or the small-étale-site obligations.
'''
h=h.rstrip()+'\n';(S/'HandoffBase.md').write_text(h);(S/'Handoff.md').write_text(h)
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
 for name in ['assemble.py','author.py','projection.py','write_handoff.py','verify.py','graph.py','immutable.py','compile.py','runcheck.py','package.py']:
  helper=txt('PublicHandoff.md').split('## Helper: '+name+'\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
  assert helper==txt(name),name

for path,n in zip(paths,['Incoming-roadmap.json','Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert blob(MATH,path)==(S/n).read_bytes(),path
p=data('Candidate.json');old=data('Incoming.json');plan=data('Plan.json');nodes={n['id']:n for n in p['nodes']}
assert len(old['nodes'])==675 and len(nodes)==len(p['nodes'])==696
assert [n['id']for n in p['nodes'][:675]]==[n['id']for n in old['nodes']]
assert p['nodes'][675:]==data('NewNodes.json')and [n['id']for n in p['nodes'][675:]]==plan['newNodes']
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
assert p['baseline']['declarations']==old['baseline']['declarations']+plan['newBaseline']and len(p['baseline']['declarations'])==500
assert {k:v for k,v in p['baseline'].items()if k!='declarations'}=={k:v for k,v in old['baseline'].items()if k!='declarations'}
for a,b in zip(old['coverage'],p['coverage']):
 if a['stageId']==RID+':G.0':
  assert b['remaining']==a['remaining']+[plan['frontier']]
  assert {k:v for k,v in a.items()if k!='remaining'}=={k:v for k,v in b.items()if k!='remaining'}
 else:assert a==b
assert p['status']=='partial'and all(n['implementationStatus']=='unchecked'for n in p['nodes'])and all(c['status']=='partial'for c in p['coverage'])
assert (len(p['requests']),len(p['gaps']),len(p['coverage']),len(p['routeCoverage']),len(p['sourceIssues']))==(23,18,7,78,26)
rd=data('Candidate-roadmap.json');rold=data('Incoming-roadmap.json')
assert rd['stages'][1:]==rold['stages'][1:]
assert {k:v for k,v in rd.items()if k!='stages'}=={k:v for k,v in rold.items()if k!='stages'}
assert {k:v for k,v in rd['stages'][0].items()if k!='description'}=={k:v for k,v in rold['stages'][0].items()if k!='description'}
assert rd['stages'][0]['description']==rold['stages'][0]['description']+' '+plan['frontier']
assert txt('Reader.md')==txt('ReaderAddition.md')+txt('IncomingReader.md')
for n in p['nodes'][675:]:assert n['statement']in txt('ReaderAddition.md')and n['declarationName']in txt('ReaderAddition.md')
for item in plan['newApi']+plan['newTests']:assert item['name']in txt('ReaderAddition.md')and item['statement']in txt('ReaderAddition.md')
assert len(plan['newApi'])==18 and len(plan['newTests'])==15
assert sum(len(n.get('tests',[]))for n in data('NewNodes.json'))==17
assert set(t['name']for n in data('NewNodes.json')for t in n.get('tests',[]))==set(t['name']for t in plan['newTests'])
assert all(len(n['api'])>=3 and len(n['tests'])>=3 for n in data('NewNodes.json')if n['kind']=='construction')
from projection import admit_lemmas
assert txt('NewAdmitted.lean')==admit_lemmas(txt('NewProofs.lean'))
assert txt('TestsAdmitted.lean')==admit_lemmas(txt('NewTests.lean'))
def headers(text):
 found={}
 for match in re.finditer(r'^(?:noncomputable )?(def|lemma|theorem|example)\b(?: ([\w.]+))?',text,re.M):
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
assert nh==headers(txt('NewAdmitted.lean'))and nt==headers(txt('TestsAdmitted.lean'))and len(nh)==21 and len(nt)==15
existing=['conductor_global_isPushout']
eh=headers(txt('ExistingSchemeProof.lean'))
assert eh==headers(txt('ExistingSchemeAdmitted.lean'))
prior=re.search(r'^theorem conductor_global_isPushout[\s\S]*?(?=^theorem |^end |\Z)',txt('CanonicalPrefix.lean'),re.M)
assert headers(prior[0])['conductor_global_isPushout']==eh['conductor_global_isPushout']
extra=txt('NewAdmitted.lean');prior=txt('CanonicalPrefix.lean')
assert txt('CanonicalAddition.lean')==extra+'\n'+txt('TestsAdmitted.lean')
assert txt('Canonical.lean')==txt('ImportAddition.lean')+prior+'\n'+txt('CanonicalAddition.lean')==txt('Suggested.lean')
assert txt('Native.lean')==txt('NativePrefix.lean')+'\n'+txt('NewProofs.lean')+'\n'+txt('ExistingSchemeProof.lean')+'\n'+txt('NewTests.lean')+'\n'+txt('Audits.lean')
assert txt('Sketch.lean')==txt('SketchPrefix.lean')+'\n'+txt('NewAdmitted.lean')+'\n'+txt('ExistingSchemeAdmitted.lean')+'\n'+txt('TestsAdmitted.lean')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',txt('Native.lean'))
assert {t['name']for t in plan['newTests']}==set(re.findall(r'^-- test: (.+)$',txt('NewTests.lean'),re.M))
assert txt('Incoming.lean')==prior
im=data('IncomingManifest.json');ir=data('PreviousRecovery.json')
assert ir['head']=='d5cc7461550b31a7fc966e40445e5a1bc24e2eec'and ir['artifactsVerified']==71 and ir['archivedHelpersVerified']==10
assert sha((S/'IncomingManifest.json').read_bytes())=='152ccad4e07f1dc49a186703577c2567240999a978c187bb74905125d3d325d2'
for name,prefix in [('Native.lean','NativePrefix.lean'),('Sketch.lean','SketchPrefix.lean'),('Canonical.lean','CanonicalPrefix.lean')]:assert im[name]['sha256']==sha((S/prefix).read_bytes()),name
assert (S/'PreviousVerification.json').read_bytes()==(S/'IncomingPublicationVerification-replayed.json').read_bytes()
assert (S/'PreviousMathematicalVerification.json').read_bytes()==(S/'IncomingMathematicalVerification-replayed.json').read_bytes()
assert ir['publicHelperFencesVerified']==10
for path,n in zip(paths,['Incoming-roadmap.json','Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert ir['publicDeliverables'][path]==sha((S/n).read_bytes())

# Preserve own previous reading attribution at exact controls, without asserting fresh full reading.
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='af53c0e7832697f2ae98fcadf053bd18e3c8181cbad8ba49bedc59552397e26e'
om=data('OwnPreviousManifest.json')
for original,current in [('Reading.json','OwnPreviousReading.json'),('InputGuard.json','OwnPreviousInputGuard.json')]:assert om[original]['sha256']==sha((S/current).read_bytes())
og={g['path']:g['sha256']for g in data('OwnPreviousInputGuard.json')}
reuse=data('OwnReadingReuse.json');assert len(reuse)==29 and sum(g['unchanged']for g in reuse)==23
for g in reuse:
 assert sha(blob(MATH,g['path']))==g['after']
 assert og[g['path']]==g['before']
 assert g['unchanged']==(g['before']==g['after'])
for original,current in [('OwnPreviousReading.json','OwnInheritedReading.json'),('OwnPreviousInputGuard.json','OwnInheritedInputGuard.json'),('OwnPreviousManifest.json','OwnInheritedManifest.json')]:
 assert om[original]['sha256']==sha((S/current).read_bytes())
nested=data('OwnInheritedManifest.json')
for original,current in [('Reading.json','OwnInheritedReading.json'),('InputGuard.json','OwnInheritedInputGuard.json')]:assert nested[original]['sha256']==sha((S/current).read_bytes())
claim=data('ClaimReceipt.json');assert claim['issue']==3378 and claim['claim']==5978072374 and claim['confirmation']==5978073322 and claim['beforeAfterEqual']
assert claim['wholeIssueCharacters']==18717 and claim['wholeReadsBeforeAndAfter']==[[0,10000],[10000,18717]]
assert txt('ImportAddition.lean')=='import Mathlib.Geometry.RingedSpace.Stalks\nimport Mathlib.RingTheory.LocalRing.RingHom.Basic\n'

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
for stem,ex,want,audits in [('Native',304,0,571),('Sketch',323,800,20)]:
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
envelope={'roadmapId':RID,'protocol':'errata-v1','sourceIssues':p['sourceIssues'],'sourceVersions':[dict(kind=('preprint'if x['id']=='schroer'else'author copy'),url=x['url'],read=x.get('accessed'),sha256=x.get('sha256'),attribution=('Fresh bounded current-page reading'if x['id']in {s['id']for s in plan['newSources']}else'Inherited source record; no fresh erratum audit claimed'))for x in p['sources']if x['id']in{f['source']for f in p['sourceIssues']}]}
issues+=check_errata.check(envelope,RID);assert not issues,issues
tree=ast.parse((R/'research/blueprint/intake.py').read_text());wanted={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id in {'ALLOWED','PRIVATE'}for t in n.targets)or isinstance(n,ast.FunctionDef)and n.name in wanted]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs']if j['id']=='DESIGN-'+RID)
problems=[x for f,t in contents.items()for x in env['file_problems'](f,t)];refusals=env['auto_refusals'](job,paths,False,{'codex-7e92bd'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'NERON_VALIDATE_BASE':BASE}));assert graph['auditBase']==BASE
print(json.dumps(dict(mathematicalBase=MATH,publicationBase=BASE,preservedContracts=675,preservedWholeNodes=674,changedExisting=changed,newNodes=21,newApi=18,newTests=15,newTestReferences=17,baselineDeclarations=500,rawApi=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),matchedNativeHeaders=21,matchedExistingHeaders=1,matchedExamples=15,checker=checker,compilation=comp,canonicalSha256=sha(txt('Canonical.lean').encode()),fullCanonicalCompiled=False,incomingArchiveAuthenticated=71,guardsUnchanged=len(data('InputGuard.json'))-len(changes),publicationGuardChanges=list(changes.values()),indexSha256=sha(Path(sys.argv[2]).read_bytes()),intakeProblems=problems,intakeRefusals=refusals,sourceIssueErrors=issues,sourceVersionScope='All26 inherited findings retained whole; complete displayed Stacks37.14.1 and37.67.3 read. Actual global scheme descent is an authored finite conductor deduction. No new finding or full-paper/exhaustive correction audit.',graph=graph,LeanExecuted=False),indent=2))
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
BASE = os.environ.get('NERON_VALIDATE_BASE', '4ae85ec4bf15b17e66fe8b22db9b7e1cb5cc25f4')
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

## Helper: package.py

```python
"""Archive only named job evidence in an inert comment; write final public recovery."""
from pathlib import Path
import base64,hashlib,json,re,sys,zlib
S=Path(sys.argv[1]).resolve();R=Path.cwd();mode=sys.argv[2]
STEM='NeronModelsAndSemistableAbelianVarietiesPartII'
suggested=R/'research/blueprint/suggested'/(STEM+'.lean')
sha=lambda b:hashlib.sha256(b).hexdigest()
NAMES='Incoming-roadmap.json Incoming.json IncomingReader.md Incoming.lean IncomingHandoff.md IncomingManifest.json\nIncomingPublicationVerification-replayed.json IncomingMathematicalVerification-replayed.json NativePrefix.lean SketchPrefix.lean CanonicalPrefix.lean\nNative.lean Native.log Native.receipt.json Sketch.lean Sketch.log Sketch.receipt.json Canonical.lean CanonicalAddition.lean ImportAddition.lean\nNewProofs.lean NewTests.lean NewAdmitted.lean TestsAdmitted.lean Audits.lean ExistingSchemeProof.lean ExistingSchemeAdmitted.lean\nCandidate-roadmap.json Candidate.json Reader.md ReaderAddition.md Suggested.lean Handoff.md HandoffBase.md\nClaimReceipt.json Reading.json SourceReading.json BaselineReading.json BaselineRanges.json OwnReadingReuse.json OwnInheritedReading.json OwnInheritedInputGuard.json OwnInheritedManifest.json\nOwnPreviousReading.json OwnPreviousInputGuard.json OwnPreviousManifest.json\nInputGuard.json PublicationChanges.json Plan.json NewNodes.json PreviousHead.txt PreviousRecovery.json PreviousVerification.json PreviousMathematicalVerification.json Verification-mathematical.json Verification.json\nSourceGapCounterexample.json Search.json TauBuildScope.json Graph.json base.txt publication-base.txt\nassemble.py author.py projection.py write_handoff.py verify.py graph.py immutable.py compile.py runcheck.py package.py'.split()
if mode=='archive':
 meta={n:dict(sha256=sha((S/n).read_bytes()),bytes=len((S/n).read_bytes()),lines=len((S/n).read_bytes().splitlines()))for n in NAMES}
 mb=(json.dumps(meta,indent=2,sort_keys=True)+'\n').encode();(S/'artifact-manifest.json').write_bytes(mb)
 payload={n:dict(sha256=sha((S/n).read_bytes()),data=base64.b64encode(zlib.compress((S/n).read_bytes(),9)).decode())for n in NAMES+['artifact-manifest.json']}
 pb=(json.dumps(payload,sort_keys=True,separators=(',',':'))+'\n').encode();(S/'payload.json').write_bytes(pb)
 report=dict(artifacts=len(NAMES),helpers=sum(n.endswith('.py')for n in NAMES),manifestSha256=sha(mb),payloadSha256=sha(pb))
 (S/'package.json').write_text(json.dumps(report,indent=2)+'\n')
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED CONDUCTOR SCHEME DESCENT PAYLOAD\n'+pb+b'END ARCHIVED CONDUCTOR SCHEME DESCENT PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('roadmaps','Candidate-roadmap.json'),('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated conductor Scheme descent evidence; never executes Lean."""
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
pb=raw.split('/- BEGIN ARCHIVED CONDUCTOR SCHEME DESCENT PAYLOAD\\n',1)[1].split('END ARCHIVED CONDUCTOR SCHEME DESCENT PAYLOAD -/',1)[0].encode()
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
helpers=[n for n in meta if n.endswith('.py')];assert len(helpers)==10
for name in helpers:
 code=handoff.split('## Helper: '+name+'\\n\\n'+fence+'python\\n',1)[1].split('\\n'+fence+'\\n',1)[0]+'\\n'
 assert code==(S/name).read_text(),name
assert handoff.startswith((S/'HandoffBase.md').read_text())
code=handoff.split('## Script: recover.py\\n\\n'+fence+'python\\n',1)[1].split('\\n'+fence+'\\n',1)[0]+'\\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from public handoff.'
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicHelperFencesVerified=len(helpers),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\\n');print(json.dumps(receipt,indent=2))
'''
 for key,val in [('__ARCHIVE__',archive),('__MANIFEST__',p['manifestSha256']),('__PAYLOAD__',p['payloadSha256']),('__EXPECTED__',expected)]:code=code.replace(key,repr(val))
 compile(code,'recover.py','exec');(S/'recover.py').write_text(code)
 prose=f'''
## Public recovery and replay

Archive commit `{archive}` is an ancestor changing only this issue's suggested file. Its {p['artifacts']} inert artifacts include all {p['helpers']} authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `{p['manifestSha256']}`; payload SHA256 `{p['payloadSha256']}`. The final suggested file has no archive payload and equals Canonical.lean, whose full Tau-importing file remains UNCOMPILED.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count and all ten exact public helper fences, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set NERON_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Sketch.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. The full Tau-importing Canonical.lean/Suggested.lean is not covered by these checks and remains UNCOMPILED. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

'''
 helpers=''.join('## Helper: '+n+'\n\n```python\n'+(S/n).read_text()+'```\n\n' for n in NAMES if n.endswith('.py'))
 text=(S/'HandoffBase.md').read_text()+prose.replace('## Script: recover.py\n\n','')+helpers+'## Script: recover.py\n\n```python\n'+code+'```\n'
 (S/'PublicHandoff.md').write_text(text)
 (R/'research/blueprint/handoff'/('DESIGN-'+STEM+'.md')).write_text(text)
 suggested.write_bytes((S/'Suggested.lean').read_bytes())
 print(json.dumps(dict(archive=archive,recoverySha256=sha(code.encode()),finalHandoffSha256=sha(text.encode())),indent=2))
else:raise ValueError(mode)
```

## Script: recover.py

```python
"""Recover public authenticated conductor Scheme descent evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='NeronModelsAndSemistableAbelianVarietiesPartII'
ARCHIVE='2bf039888dce45bd6fae3408e91c3627b6c4ecfe'
MANIFEST_SHA='dde63f3028cfe79790175a6cbdc32d1bbd0ebb2902ed6151f9394641aa52f1d8'
PAYLOAD_SHA='0a06b10591e19a030a0de425292df1bc01633f980e5b8f4a4b9d9cfb75183c38'
EXPECTED={'roadmaps': '9ffad71765600ae6e684ee0cd77c7ff22ebbc098f3904196e37131fb391cb038', 'packets': 'ca14eadd9a4b20d2815919aad7640881043a6ff7bf8796b108e68cfe6f645189', 'readmes': 'fb948ad33a38054cc91ee2e36eaa622af9a06a9415ca57b8ac9ca3f3b4e7ad14', 'suggested': 'fdf3fe4aa8229c17f6b711cd7943ff8926a3ab4d1d831a64796fd0269a9fc83c'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED CONDUCTOR SCHEME DESCENT PAYLOAD\n',1)[1].split('END ARCHIVED CONDUCTOR SCHEME DESCENT PAYLOAD -/',1)[0].encode()
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
helpers=[n for n in meta if n.endswith('.py')];assert len(helpers)==10
for name in helpers:
 code=handoff.split('## Helper: '+name+'\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
 assert code==(S/name).read_text(),name
assert handoff.startswith((S/'HandoffBase.md').read_text())
code=handoff.split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from public handoff.'
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicHelperFencesVerified=len(helpers),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
