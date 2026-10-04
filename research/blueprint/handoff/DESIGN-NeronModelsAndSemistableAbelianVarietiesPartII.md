# Actual conductor subscheme base-change comparisons — checkpoint

Agent: Codex — codex-rtOQ9t. Refs #3378. The roadmap remains partial and every implementationStatus stays unchecked.

For every finite schematically dominant scheme morphism f:Y→P and every flat q:T→P, two conductor-specific constructions give actual native scheme isomorphisms from the recomputed target and source conductor closed subschemes to the pullbacks of the original conductor inclusions. The target pullback is ordered with q first; the source pullback is ordered with pullback.fst f q first. Both use the previously proved equality of full conductor ideal-sheaf data followed by native comapIso. Nilpotents are retained. No affine, Noetherian, reduced, separated, birational, faithfully-flat or quasi-compact-target assumption is added.

Eight API lemmas compute the forward first projection, forward second projection followed by the old inclusion, and inverse followed by the recomputed inclusion; they also establish exact native IsPullback squares for both conductors. Two further lemmas identify the actual recomputed conductorMap with native pullback.map of the old conductor morphism under these isomorphisms, in the forward and inverse directions. The native map uses the actual scheme pullback condition and conductorMap_square; uniqueness after composing with the target inverse proves the forward square. The existing conductorMap_square API is promoted to its own dependency node because these new map comparisons consume it. Its exact retained native and suggested headers stay once, with no duplicate Lean declaration. No second generic pullback, equality-transport or ideal-sheaf carrier is planned.

Eight distinct typed examples check target/source isomorphism roundtrips and projection/cartesian equations, the actual conductor map square, empty conductors under base change of identity morphisms, identity base change of arbitrary f, restriction to any open without affineness, and the zero ring. The diagonal Spec(Z/4×Z/4)→Spec(Z/4) supplies an actual nonzero square-zero section of the recomputed conductor closed subscheme after identity base change; its section image under the actual inverse target comparison is still nonzero. This test computes the full conductor quotient and would fail under radical replacement.

All726 incoming node objects and all528 incoming baseline objects are unchanged. The checkpoint adds13 nodes: two constructions, ten authored lemmas and one promotion of the retained conductorMap_square API, eight API references and thirteen references to eight distinct typed tests. Each construction has four API items and at least six tests. The packet has739 nodes,530 baseline declarations,458 raw API references and457 raw test references. All29 planets,18 gap records,23 requests,78 source routes,27 source findings and seven partial stages are retained. Only the G0 frontier and stage description are extended; no retained broad gap is marked closed.

## Reading and authentication

The complete18717-character issue was read before and after bot5980527154 confirmed exact claim5980525391. Both complete partitions and the body hash are in ClaimReceipt.json. Whole WORKERS and blueprint sections0–5 were freshly reread; the original complete personal protocol, expansion and upstream reading scopes remain authenticated at unchanged controls. Reading.json and OwnOriginal6030Reading.json/OwnOriginal6044Reading.json state the original bounds rather than enlarging them.

Complete reviewed parent R11.1–R11.6 row objects and reviewer metadata, and the whole172-line REV-AUDIT-10, were freshly read. There is no separate PartII audit row. The reserved Ferrand node with all nine API items/seven tests, the actual conductor ideal/map and global comparison contracts, both SF0 requests and the final threeG0 frontier paragraphs were read. The whole link corpus was scanned across links, overlaps and examined for this PartII and its legacy id:zero matches. No fresh manual audit of all726 nodes, the entire inherited reader or all source papers is claimed.

Incoming peer PR6072 at head700b4da6ca49b7ceeee0fc3c162c01b2e5c2d290 was actually recovered over public HTTP:92 artifacts, ten helpers and five deliverables. Manifest b03e012b0c6da09c4a21226432834345c4dad560972031c235f2c5934529d651 binds all three incoming Lean prefixes. Both actual original immutable verifier executions reproduce their archived reports byte-for-byte. The first12000characters of the inherited handoff and all ten consumed helper files, separately and whole, were read. Native lines9324–9595, all272 lines added since own6069, were freshly read, as were the actual conductorIdealSheaf and conductorMap bodies. The entire9595-line inherited Native was authenticated and replayed rather than manually reread.

Own prior PR6069 was separately recovered over public HTTP:84 artifacts, ten helpers and five deliverables. Its manifest27cf54017d315dbd01aa55059738f6017ec032b99de9d3c5cee521ba60ca0ab8 binds OwnPreviousReading/InputGuard/Candidate and both original personal6030/6044 reading records. The first9323 lines of incoming Native match that own certificate exactly. OwnReadingReuse compares29 controls:23 unchanged, with the changed SF0 packet and five issue files separately authenticated. Original requests/gaps/routes/source findings are structurally unchanged. Peer personal source-reading attribution is never transferred to this worker.

The included47-line SF0 generic ideal-pullback proof cone was freshly read inside the inherited Native addition and is consumed unchanged. This job does not claim a new direct SF0 supplier HTTP recovery or fresh personal reading of the supplier's full source versions. Incoming peer verifier replay authenticates its inherited supplier evidence. Generic ideal pullbacks remain owned by SF0.

BaselineReading.json and BaselineRanges.json record fresh exact statements and ambient binders at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174. In particular, the whole227-line native IdealSheaf/Functorial module and bounded actual eqToIso, pullback.map/condition, of_iso_pullback and subscheme inclusion/empty APIs were read. Exact specialized names were absent in the recorded pinned Mathlib/Tau source and blueprint JSON searches; this is a scoped name search rather than an exhaustive mathematical absence survey.

Fresh source reading comprises the whole current displayed Stacks Section26.17: both definitions, all five lemma statements/proofs, diagrams and eight direct comments. Actual HTTP bytes, timestamp and SHA256 are archived. Linked correction patches, historical versions and linked proof pages were not reread. The conductor isomorphisms and map squares are authored deductions from the authenticated full-ideal comparisons and native scheme APIs, with this section as context. All27 inherited findings remain whole with their original attribution. No new source error is alleged. The verifier independently enumerates the retained five-dimensional commutative block-matrix algebra overF2:32 elements and1024 products.

## Validation

The final complete Native.lean retains the authenticated9595-line prefix and appends twelve proved declarations, seven proved examples and twelve new axiom audits. All twelve new declarations and the seven included examples pass. All619 audits use only propext, Classical.choice and Quot.sound; there are no errors, warnings or admissions. The complete Sketch.lean retains its authenticated6095-line Mathlib prefix and appends exactly matching admitted headers, with874 admission warnings as its only warnings. Both concrete constructions retain actual native definitions. The verifier compares all twelve declaration headers and all eight example headers against the full suggested file's exact appended projection. Native.lean contains seven new proved examples; the eighth test statement is checked only in the admitted Sketch.lean. The corresponding proof attempted in FailedFullNative.lean elaborated but exceeded the kernel heartbeat limit; its actual failed source, diagnostics and receipt are archived. Its proof is not claimed kernel checked.

The full Tau-importing Canonical.lean/Suggested.lean remains UNCOMPILED. Fresh TauBuildScope records available buildcf386627e9176a3827c1a5fe804989fd94a4d216 instead of required sourcef790474821cf4256814db967cb154e7af3d0c369, with all five direct compiled Tau imports absent. Native and admitted Mathlib checks do not certify that entire Tau-dependent file. No Lake setup/cache download, library build or language server was used. Each compiler ran serially with a fresh20GiB memory guard, one thread,8GiB memory limit and1200-second timeout. No Lean source was edited while its compiler ran. Initial cartesian-square inference/test elaboration errors were corrected. The eighth example still exceeds the deterministic kernel heartbeat limit even after abstracting routine quotient-section/isomorphism calculations and trying checked auxiliary proofs. The final successful native certificate omits that single example while retaining all twelve new declarations and seven proved examples. The admitted sketch checks its exact statement with the other seven. FailedFullNative.lean/log/receipt.json preserve the failed complete attempt at the same limits; no whole-file success is inferred from its twelve clean declaration audits.

- Native.lean: 9828 lines, 339 examples, 0 warnings, 619 axiom audits, exit0. Source SHA256 `697c33fafef485a876b3d178b0ef3c2f6e52948dbd5c3d85b6fa821cb87d78d7`; diagnostic SHA256 `96a21a0ce334d4d211090190914d869dbc865f0f3c522bb5be5a0fa2565a6e0f`. Fresh available memory 41GiB; elapsed 128.03s; maximum RSS 7281716KiB.
- Sketch.lean: 6289 lines, 359 examples, 874 warnings, 20 axiom audits, exit0. Source SHA256 `218db02ae81aa66aeb94efd6a99870e0ddb43d2056d2fc70ce93d9c835923922`; diagnostic SHA256 `1677adf2e478055d7bb9ceabfe964ec6128e307c1738638050bfbd1f6ab99044`. Fresh available memory 41GiB; elapsed 87.9s; maximum RSS 7092460KiB.

Suggested.lean equals Canonical.lean, SHA256 `6f5c952df762a69815fe5b3ae0cb5df60bd719badd1969783c153e59a2eae94a`.

The actual indexed blueprint checker, source/errata validators, intake and atlas assembler run against immutable mathematical base `9fb047904c40a56fb53f20db7e52145dd01e7bce` and publication base `ce8866e2bfd2db338b709a2c8ef5a97cde812a4b`. Both actual reports are archived. All29 guards and the queue's non-state contract are checked. The verifier does not execute Lean or create a repository snapshot.

The atlas stage DAG has3043 vertices/8727 edges, the own declaration DAG739/1728, and the scoped DAG3760/11397. All are acyclic; all69 required supplier paths are reachable. Whole foreign roadmaps/stages and every existing stage edge match the control. The45 unrelated preexisting missing restructure paths remain unchanged. No owned links are skipped or pending.

## Resume

Use the actual target/source conductor scheme isomorphisms and both actual conductorMap comparison squares. The nonreduced_conductor_section statement has admitted typing evidence only: resume from its archived failed native attempt to obtain a kernel-checked proof, without changing its actual recomputed conductor and inverse-comparison section map. Establish coherence under iterated base change with explicitly named carrier isomorphisms, and transport the geometric conductor pushout predicate along these actual comparisons. Those two obligations remain open; proving an ideal equality or one comparison square does not establish them. Generic Ferrand algebraic-space existence and its scheme affine-neighborhood criterion remain separate. Retain the small étale structure-sheaf requirement and all projective/Proj, properness, coherent H0/H1/genus, separateI2 and model/classification obligations, requests and source routes. This checkpoint does not complete the roadmap.

## Public recovery and replay

Archive commit `8993c5cdf0d09403180b3aa4a21eae5912d1a0d0` is an ancestor changing only this issue's suggested file. Its 77 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `6a2c918330e685570860408a7986dfac11147e73fa884d1736ea7de7b4d92249`; payload SHA256 `1ebcd43371e1b623f8d527a5433fe4f4b3ab73d8ef6c799eb11d22ae1c21f8e6`. The final suggested file has no archive payload and equals Canonical.lean, whose full Tau-importing file remains UNCOMPILED.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count and all ten exact public helper fences, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set NERON_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Sketch.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. The full Tau-importing Canonical.lean/Suggested.lean is not covered by these checks and remains UNCOMPILED. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Helper: assemble.py

```python
"""Preserve authenticated prefixes and append exact new conductor comparisons."""
from pathlib import Path
import re,sys
S=Path(sys.argv[1]).resolve();sys.path.insert(0,str(S))
from projection import project
txt=lambda n:(S/n).read_text()
names=re.findall(r'^(?:def|lemma|theorem) ([\w.]+)',txt('NewProofs.lean'),re.M)
assert len(names)==12 and len(re.findall(r'^example\b',txt('NewTests.lean'),re.M))==8
admitted=project(txt('NewProofs.lean'),txt('NewTests.lean'))
assert len(re.findall(r'\bsorry\b',admitted))==18
(S/'NewAdmitted.lean').write_text(admitted)
audits=''.join('#print axioms TauCeti.GenusOne.FerrandPushout.'+n+'\n'for n in names)
(S/'Audits.lean').write_text(audits)
checked=txt('NewTests.lean').split('-- test: ConductorSubschemeChecked.nonreduced_conductor_section',1)[0]+'end TauCeti.GenusOne.FerrandPushout\n'
assert len(re.findall(r'^example\b',checked,re.M))==7
(S/'CheckedTests.lean').write_text(checked)
(S/'Native.lean').write_text(txt('NativePrefix.lean')+'\n'+txt('NewProofs.lean')+'\n'+checked+'\n'+audits)
(S/'Sketch.lean').write_text(txt('SketchPrefix.lean')+'\n'+admitted)
(S/'Canonical.lean').write_text(txt('CanonicalPrefix.lean')+'\n'+admitted)
(S/'Suggested.lean').write_text(txt('Canonical.lean'))
```

## Helper: author.py

```python
"""Append actual target/source conductor subscheme comparisons and their map squares."""
from pathlib import Path
import copy,csv,json,re,sys
S=Path(__file__).resolve().parent;RID='NeronModelsAndSemistableAbelianVarietiesPartII';P=RID+':G.0/';NS='TauCeti.GenusOne.FerrandPushout.'
load=lambda n:json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
old=load('Incoming.json');p=copy.deepcopy(old);road=load('Incoming-roadmap.json')
existing={n.get('declarationName','').removeprefix(NS):n['id']for n in old['nodes']}
specs=[
('conductor-target-base-change-iso','conductorTargetBaseChangeIso','construction','The actual target conductor subscheme base-change isomorphism','For finite schematically dominant f:Y to P and flat q:T to P, construct an actual scheme isomorphism from the recomputed target conductor closed subscheme of pullback.snd f q to the native pullback of q and the original target conductor inclusion.',['conductor_global_flat_comparison','conductorIdealSheaf','mathlib:CategoryTheory.eqToIso','mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comapIso'],'Transport the actual closed-subscheme carrier along the proved equality of full conductor ideal-sheaf data, then compose with native comapIso. Use the actual recomputed ideal, including its nilpotents.'),
('conductor-target-base-change-fst','conductorTargetBaseChangeIso_hom_fst','lemma','The target comparison preserves the actual closed inclusion','The forward target conductor comparison followed by the native first pullback projection equals the recomputed conductor closed inclusion into T.',['conductorTargetBaseChangeIso','mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comapIso_hom_fst'],'Compute the native comapIso first projection. Equality elimination on the full ideal data identifies its transported inclusion with the actual recomputed inclusion.'),
('conductor-target-base-change-snd','conductorTargetBaseChangeIso_hom_snd_inclusion','lemma','The target comparison preserves the old conductor projection','The forward target comparison followed by the native second projection and the old conductor inclusion equals the recomputed conductor inclusion followed by q.',['conductorTargetBaseChangeIso_hom_fst','mathlib:CategoryTheory.Limits.pullback.condition'],'Use the actual native pullback square and the proved first-projection identity.'),
('conductor-target-base-change-inverse','conductorTargetBaseChangeIso_inv_inclusion','lemma','The inverse target comparison preserves the actual inclusion','The inverse target comparison followed by the recomputed conductor inclusion equals the native first projection of the old conductor pullback.',['conductorTargetBaseChangeIso_hom_fst'],'Rewrite the recomputed inclusion by the forward projection equation and cancel the actual inverse/forward isomorphism pair.'),
('conductor-target-base-change-cartesian','conductorTargetBaseChangeIso_isPullback','lemma','The recomputed target conductor square is actually cartesian','The recomputed target inclusion, the forward comparison followed by the second projection, q and the original target inclusion form a native IsPullback square with those exact morphisms.',['conductorTargetBaseChangeIso_hom_fst','conductorTargetBaseChangeIso_hom_snd_inclusion','mathlib:CategoryTheory.IsPullback.of_iso_pullback'],'Supply the actual comparison isomorphism and both projection equations to the native cartesian-square criterion.'),
('conductor-source-base-change-iso','conductorSourceBaseChangeIso','construction','The actual source conductor subscheme base-change isomorphism','Construct an actual scheme isomorphism from the recomputed source conductor closed subscheme of pullback.snd f q to the native pullback of pullback.fst f q and the old source conductor inclusion into Y.',['conductorSourceIdeal_flat','conductorIdealSheaf','mathlib:CategoryTheory.eqToIso','mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comapIso'],'Transport the actual source closed-subscheme carrier along the existing full source ideal equality, then compose with native comapIso along pullback.fst f q.'),
('conductor-source-base-change-fst','conductorSourceBaseChangeIso_hom_fst','lemma','The source comparison preserves the actual source inclusion','The forward source conductor comparison followed by the first native pullback projection equals the recomputed source conductor inclusion into the actual base-changed source scheme.',['conductorSourceBaseChangeIso','mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comapIso_hom_fst'],'Compute the native first projection and eliminate the equality of the full source ideal data to compare the transported inclusions.'),
('conductor-source-base-change-snd','conductorSourceBaseChangeIso_hom_snd_inclusion','lemma','The source comparison preserves the old source projection','The forward source comparison followed by the native second projection and the old source conductor inclusion equals the recomputed source inclusion followed by pullback.fst f q.',['conductorSourceBaseChangeIso_hom_fst','mathlib:CategoryTheory.Limits.pullback.condition'],'Use the native source pullback square and its actual first-projection identity.'),
('conductor-source-base-change-inverse','conductorSourceBaseChangeIso_inv_inclusion','lemma','The inverse source comparison preserves the actual source inclusion','The inverse source comparison followed by the recomputed source conductor inclusion equals the native first projection of the pullback of the old source conductor.',['conductorSourceBaseChangeIso_hom_fst'],'Use the actual forward projection identity and the native inverse/forward isomorphism cancellation.'),
('conductor-source-base-change-cartesian','conductorSourceBaseChangeIso_isPullback','lemma','The recomputed source conductor square is actually cartesian','The recomputed source conductor inclusion, forward comparison followed by second projection, pullback.fst f q and original source conductor inclusion form a native IsPullback square with those exact morphisms.',['conductorSourceBaseChangeIso_hom_fst','conductorSourceBaseChangeIso_hom_snd_inclusion','mathlib:CategoryTheory.IsPullback.of_iso_pullback'],'Apply the native cartesian-square criterion to the actual source comparison isomorphism and projection identities.'),
('conductor-map-base-change-square','conductorMap_baseChange_square','lemma','The actual conductor map agrees with the native base-changed map','The recomputed conductorMap followed by the target comparison equals the source comparison followed by the native pullback.map induced by the actual base-change source/target projections, original conductorMap and original f. The two defining squares are the actual scheme pullback condition and original conductorMap inclusion square.',['conductorTargetBaseChangeIso_inv_inclusion','conductorSourceBaseChangeIso_hom_fst','conductorMap_unique','conductorMap','mathlib:CategoryTheory.Limits.pullback.map'],'Compose both sides with the inverse target comparison. The actual conductorMap uniqueness lemma reduces equality to the closed-inclusion square; the native first-projection formula and the source/target inclusion equations prove that square.'),
('conductor-map-base-change-inverse-square','conductorMap_baseChange_inverse_square','lemma','The inverse comparisons preserve the actual conductor map square','The inverse source comparison followed by the recomputed conductorMap equals the native base-changed original conductorMap followed by the inverse target comparison, as actual scheme morphisms.',['conductorMap_baseChange_square'],'Compose the proved forward square with the actual inverse source and target comparisons and use the native isomorphism identities.')]
ids={name:P+slug for slug,name,*_ in specs};nodes=[];sid='ConductorSubschemeBaseChange-codex-rtOQ9t';src=load('SourceReading.json')[0]
common=['Schemes lie in a common universe. The original morphism f is finite and schematically dominant; q is an arbitrary flat morphism. Native instances supply finiteness and schematic dominance of its actual base change.','No affine, Noetherian, reduced, separated, birational, faithful-flat or quasi-compactness hypothesis on T is assumed. The full conductor ideals are retained; no radical replacement is used.','Generic ideal-sheaf pullbacks, equality transport, scheme pullbacks and isomorphism carriers are imported. These are conductor-specific comparisons; iterated carrier/isomorphism coherence and generic Ferrand existence remain separate open obligations.']
for slug,name,kind,title,statement,deps,proof in specs:
 nodes.append(dict(id=ids[name],parentStageId=RID+':G.0',realises=[RID+':G.0'],kind=kind,title=title,declarationName=NS+name,statement=statement,hypotheses=common,prerequisites=[d if ':'in d else ids[d]if d in ids else existing[d]for d in deps],proofSteps=[proof],acceptance=[statement,'Use actual recomputed conductor closed subschemes and their actual inclusion/projection morphisms; preserve nilpotent sections and the empty zero-ring case.'],library=dict(module='TauCeti/AlgebraicGeometry/GenusOne/G0',namespace=NS[:-1]),sources=[dict(sourceId=sid,locator='Stacks Section26.17, Definition26.17.1 and Lemma26.17.6(1), current displayed statements/proof; authored conductor specialization',excerpt='closed immersion',match='The source supplies the actual fibre-product universal property and full inverse-image ideal construction for closed subschemes. The precise conductor comparisons and map squares are authored deductions from the authenticated prior full-ideal flat comparisons and pinned native comapIso/pullback APIs.')],api=[],tests=[],implementationStatus='unchecked'))
by={n['declarationName'].removeprefix(NS):n for n in nodes}
apis={'conductorTargetBaseChangeIso':['conductorTargetBaseChangeIso_hom_fst','conductorTargetBaseChangeIso_hom_snd_inclusion','conductorTargetBaseChangeIso_inv_inclusion','conductorTargetBaseChangeIso_isPullback'],'conductorSourceBaseChangeIso':['conductorSourceBaseChangeIso_hom_fst','conductorSourceBaseChangeIso_hom_snd_inclusion','conductorSourceBaseChangeIso_inv_inclusion','conductorSourceBaseChangeIso_isPullback']}
testdata=[('target_projection_roundtrip','compatibility','For arbitrary finite schematically dominant f and flat q, the actual target isomorphism has its native inverse roundtrip, preserves the recomputed closed inclusion and supplies the exact native cartesian target square.'),('source_projection_roundtrip','compatibility','For arbitrary f and flat q, the actual source isomorphism has its native inverse roundtrip, preserves the actual recomputed source inclusion and supplies the exact native cartesian source square.'),('actual_conductor_map','compatibility','The actual recomputed conductorMap and the two actual comparison isomorphisms satisfy the square with native pullback.map on the original conductor morphism and the actual source/target projections.'),('identity_morphism_empty','degenerate','For any flat base change of an identity scheme morphism, both actual recomputed conductor closed subschemes are empty.'),('identity_base','compatibility','For identity base change of arbitrary f, the actual target comparison preserves the original target inclusion after its second projection and the inverse source comparison preserves the actual source inclusion.'),('open_restriction','compatibility','For restriction to any open of P, both actual recomputed conductor inclusion squares are native pullbacks. No affineness of the open is assumed.'),('zero_ring','degenerate','Over Spec(Z/1), the actual target inverse inclusion equation and source comparison roundtrip hold without assuming any scheme point exists.'),('nonreduced_conductor_section','non-example','For the actual finite schematically dominant diagonal Spec(Z/4 times Z/4) to Spec(Z/4), after identity base change the actual recomputed target conductor closed subscheme has a nonzero square-zero global section. Its actual section map induced by the inverse target comparison remains nonzero. A radical replacement fails this test.')]
tests=[dict(name='ConductorSubschemeChecked.'+a,kind=b,statement=c)for a,b,c in testdata];tb={a:t for (a,*_),t in zip(testdata,tests)}
sets={'conductorTargetBaseChangeIso':['target_projection_roundtrip','actual_conductor_map','identity_morphism_empty','identity_base','open_restriction','zero_ring','nonreduced_conductor_section'],'conductorSourceBaseChangeIso':['source_projection_roundtrip','actual_conductor_map','identity_morphism_empty','identity_base','open_restriction','zero_ring']}
for name,entries in apis.items():
 by[name]['api']=[dict(name=NS+x,role='compatibility',statement=by[x]['statement'])for x in entries];by[name]['tests']=[tb[x]for x in sets[name]]
 by[name]['uses']=[dict(where=P+'conductor-scheme-flat-comparison',how='Identify actual recomputed quotient subschemes and morphisms with the original conductor square after flat base change.'),dict(where=RID+':key/ferrand-pushouts',how='Supply the actual conductor square comparison needed when transporting geometric conductor pushouts along flat morphisms, preserving full ideals and nilpotents.')]
# Promote the already retained conductorMap square API because the new map node consumes it.
square_name=NS+'conductorMap_square';square_id=P+'conductor-induced-map-square'
assert square_id not in {n['id']for n in old['nodes']}
square=dict(id=square_id,parentStageId=RID+':G.0',realises=[RID+':G.0'],kind='lemma',title='The actual conductor inclusion square',declarationName=square_name,statement='For finite schematically dominant f:Y to P, the actual conductorMap f followed by the target conductor closed inclusion equals the source conductor closed inclusion followed by f.',hypotheses=['Schemes in a common universe; f is finite and schematically dominant. No base-change morphism or flatness hypothesis is needed.'],prerequisites=[existing['conductorMap'],'mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comapIso_hom_fst','mathlib:CategoryTheory.Limits.pullback.condition'],proofSteps=['Promote the exact existing conductorMap_square API without changing its declaration or hypotheses. Its retained native proof unfolds conductorMap and uses the native pullback condition and comapIso_hom_fst projection identity. The new base-changed conductor-map node consumes this named square.'],acceptance=['The exact existing native conductorMap_square declaration and full suggested header are retained once; no duplicate Lean declaration is added.'],library=dict(module='TauCeti/AlgebraicGeometry/GenusOne/G0',namespace=NS[:-1]),sources=[dict(sourceId=sid,locator='Authored promotion of the existing conductorMap square API; native comapIso_hom_fst/pullback.condition, with Stacks Section26.17 as context',excerpt='closed immersion',match='This promotes an already planned conductor-specific compatibility API to a declaration-sized dependency node. It does not claim a new theorem in the source.')],implementationStatus='unchecked')
square['api']=[];square['tests']=[]
nodes.append(square)
by['conductorMap_baseChange_square']['prerequisites'] += [square_id,'mathlib:CategoryTheory.Limits.pullback.condition']
p['nodes']+=nodes
rows=list(csv.reader(Path(sys.argv[1]).open(),delimiter='\t'));have={x['ref']for x in p['baseline']['declarations']};baseline=[];reading=[]
used=sorted({x.removeprefix('mathlib:')for n in nodes for x in n['prerequisites']if x.startswith('mathlib:')})
for name in used:
 row=next(r for r in rows if len(r)>5 and r[0]=='mathlib'and r[1]==name);reading.append(dict(name=name,file=row[3],line=int(row[4]),signature=row[5],scope='Actual statement and ambient hypotheses read at the exact Mathlib pin; bounded source ranges in Reading.json.'))
 if 'mathlib:'+name not in have:baseline.append(dict(ref='mathlib:'+name,kind=row[2],module=row[3],line=int(row[4]),provides=row[5]+' Reuse the actual native API for conductor subscheme comparisons.',checked='Codex — codex-rtOQ9t read the actual statement at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 on2026-10-04.'))
p['baseline']['declarations']+=baseline;save('BaselineReading.json',reading)
source=dict(id=sid,title='Closed-subscheme fibre products and authored conductor comparisons',authors='The Stacks Project authors; conductor specialization by Codex — codex-rtOQ9t',edition='Current displayed Section26.17 only, accessed4October2026',url=src['url'],sha256=src['sha256'],accessed=src['accessed'][:10],readSections=[src['scope']]);p['sources'].append(source)
frontier='The recomputed target and source conductor closed subschemes now have actual native scheme isomorphisms to the pullbacks of the original conductor inclusions. Eight API lemmas compute their forward and inverse inclusion/projection maps and supply exact native IsPullback squares. Two further lemmas identify the actual recomputed conductorMap with the native pullback.map of the original conductor map, in both forward and inverse comparison diagrams. The existing conductorMap_square API is promoted to its own dependency node without duplicating its retained Lean declaration. Two concrete constructions and eight distinct typed tests preserve arbitrary flat base change, open restrictions, identity/empty conductors, zero rings and a nonzero square-zero actual conductor global section overZ/4. All726 incoming node objects and528 baseline objects are retained whole. Iterated conductor subscheme isomorphism/carrier coherence, geometric conductor pushout transport, generic Ferrand algebraic-space existence and the scheme affine-neighborhood criterion remain open, together with projective/cohomological work, separateI2 and remaining model/classification obligations. All18 gaps,23 requests,78 routes,27 source findings and seven partial stages remain; implementations stay unchecked and the complete Tau-dependent suggested file remains UNCOMPILED.'
p['summary']+=' Conductor subscheme comparison continuation:13 nodes (2 constructions,10 authored lemmas and1 promotion of the retained conductorMap_square API),8 API references and13 references to8 distinct typed tests. All726 incoming node objects are unchanged.'
next(x for x in p['coverage']if x['stageId']==RID+':G.0')['remaining'].append(frontier);next(x for x in road['stages']if x['key']=='G.0')['description']+=' '+frontier
plan=dict(newNames=[n['declarationName']for n in nodes if n['declarationName']!=square_name],newNodes=[n['id']for n in nodes],newApi=[a for n in nodes for a in n['api']],newTests=tests,newTestReferences=sum(map(len,sets.values())),newBaseline=baseline,newSources=[source],newSourceIssues=[],newGaps=[],changedExisting={},existingNativeNames=[square_name],frontier=frontier)
for n,x in [('Candidate.json',p),(RID+'.json',p),('Candidate-roadmap.json',road),('NewNodes.json',nodes),('Plan.json',plan)]:save(n,x)
parts=['# Actual conductor subscheme base-change comparisons\n\nFor finite schematically dominant f and arbitrary flat q, use the proved equality of full target and source conductor ideals. Transport their actual closed subschemes along those equalities and compose with native comapIso. The result is a pair of actual scheme isomorphisms to the pullbacks of the old conductor inclusions. Their forward and inverse maps preserve the actual inclusions and projections, and both recomputed conductor inclusion squares are native cartesian squares.\n\nThe actual recomputed conductorMap agrees with native pullback.map of the original conductor map under these isomorphisms. Both comparison directions are proved. Generic ideal-sheaf carriers, scheme pullbacks and equality transport remain native imports. No reduced, Noetherian, affine, birational or quasi-compact-target hypothesis is added. A concrete diagonal overZ/4 yields a nonzero square-zero actual conductor global section, whose actual inverse-comparison section image stays nonzero.\n\nAll726 incoming node objects, all528 baseline objects,29 planets,18 gap records,23 requests,78 source routes and27 source findings are retained. This checkpoint adds13 nodes, including one promoted retained square API,8 API references and13 references to8 distinct typed examples. Every construction has at least three API items and three tests, with explicit consumers. The full Tau-dependent suggested file remains UNCOMPILED; native Mathlib evidence and the admitted sketch have the precise scopes in the handoff.\n\n'+frontier+'\n\n']
for n in nodes:
 parts+=['## '+n['title']+'\n\n','**'+n['declarationName']+'** — '+n['statement']+'\n\n','Hypotheses: '+' '.join(n['hypotheses'])+'\n\n','Prerequisites: '+', '.join(n['prerequisites'])+'.\n\n','Proof: '+' '.join(n['proofSteps'])+'\n\n']
 for label,key in [('Consumed API','api'),('Typed examples','tests')]:
  if n[key]:parts+=[label+':\n\n']+['- **'+x['name']+'**: '+x['statement']+'\n'for x in n[key]]+['\n']
(S/'ReaderAddition.md').write_text(''.join(parts));(S/'Reader.md').write_text(''.join(parts)+(S/'IncomingReader.md').read_text())
assert set(re.findall(r'^(?:def|lemma|theorem) ([\w.]+)',(S/'NewProofs.lean').read_text(),re.M))==set(ids)
print(json.dumps(dict(nodes=len(p['nodes']),newNodes=len(nodes),rawAPI=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),baseline=len(p['baseline']['declarations']),newBaseline=len(baseline))))
```

## Helper: projection.py

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

## Helper: write_handoff.py

```python
"""Write the measured conductor closed-subscheme checkpoint and precise personal reading scopes."""
from pathlib import Path
import hashlib,json,re
S=Path(__file__).resolve().parent
txt=lambda n:(S/n).read_text()
data=lambda n:json.loads(txt(n))
sha=lambda b:hashlib.sha256(b).hexdigest()
def measurement(stem):
 r=data(stem+'.receipt.json');b=(S/(stem+'.lean')).read_bytes();assert r['exitStatus']==0
 return f"- {stem}.lean: {len(b.splitlines())} lines, {len(re.findall(r'^example\b',b.decode(),re.M))} examples, {r['warnings']} warnings, {r['axiomAudits']} axiom audits, exit0. Source SHA256 `{sha(b)}`; diagnostic SHA256 `{r['logSha256']}`. Fresh available memory {r['availableGiBBefore']}GiB; elapsed {r['elapsedSeconds']}s; maximum RSS {r['maxRssKiB']}KiB.\n"
g=data('Graph.json');c=data('ClaimReceipt.json')
h=f'''# Actual conductor subscheme base-change comparisons — checkpoint

Agent: Codex — codex-rtOQ9t. Refs #3378. The roadmap remains partial and every implementationStatus stays unchecked.

For every finite schematically dominant scheme morphism f:Y→P and every flat q:T→P, two conductor-specific constructions give actual native scheme isomorphisms from the recomputed target and source conductor closed subschemes to the pullbacks of the original conductor inclusions. The target pullback is ordered with q first; the source pullback is ordered with pullback.fst f q first. Both use the previously proved equality of full conductor ideal-sheaf data followed by native comapIso. Nilpotents are retained. No affine, Noetherian, reduced, separated, birational, faithfully-flat or quasi-compact-target assumption is added.

Eight API lemmas compute the forward first projection, forward second projection followed by the old inclusion, and inverse followed by the recomputed inclusion; they also establish exact native IsPullback squares for both conductors. Two further lemmas identify the actual recomputed conductorMap with native pullback.map of the old conductor morphism under these isomorphisms, in the forward and inverse directions. The native map uses the actual scheme pullback condition and conductorMap_square; uniqueness after composing with the target inverse proves the forward square. The existing conductorMap_square API is promoted to its own dependency node because these new map comparisons consume it. Its exact retained native and suggested headers stay once, with no duplicate Lean declaration. No second generic pullback, equality-transport or ideal-sheaf carrier is planned.

Eight distinct typed examples check target/source isomorphism roundtrips and projection/cartesian equations, the actual conductor map square, empty conductors under base change of identity morphisms, identity base change of arbitrary f, restriction to any open without affineness, and the zero ring. The diagonal Spec(Z/4×Z/4)→Spec(Z/4) supplies an actual nonzero square-zero section of the recomputed conductor closed subscheme after identity base change; its section image under the actual inverse target comparison is still nonzero. This test computes the full conductor quotient and would fail under radical replacement.

All726 incoming node objects and all528 incoming baseline objects are unchanged. The checkpoint adds13 nodes: two constructions, ten authored lemmas and one promotion of the retained conductorMap_square API, eight API references and thirteen references to eight distinct typed tests. Each construction has four API items and at least six tests. The packet has739 nodes,530 baseline declarations,458 raw API references and457 raw test references. All29 planets,18 gap records,23 requests,78 source routes,27 source findings and seven partial stages are retained. Only the G0 frontier and stage description are extended; no retained broad gap is marked closed.

## Reading and authentication

The complete18717-character issue was read before and after bot{c['bot']} confirmed exact claim{c['claim']}. Both complete partitions and the body hash are in ClaimReceipt.json. Whole WORKERS and blueprint sections0–5 were freshly reread; the original complete personal protocol, expansion and upstream reading scopes remain authenticated at unchanged controls. Reading.json and OwnOriginal6030Reading.json/OwnOriginal6044Reading.json state the original bounds rather than enlarging them.

Complete reviewed parent R11.1–R11.6 row objects and reviewer metadata, and the whole172-line REV-AUDIT-10, were freshly read. There is no separate PartII audit row. The reserved Ferrand node with all nine API items/seven tests, the actual conductor ideal/map and global comparison contracts, both SF0 requests and the final threeG0 frontier paragraphs were read. The whole link corpus was scanned across links, overlaps and examined for this PartII and its legacy id:zero matches. No fresh manual audit of all726 nodes, the entire inherited reader or all source papers is claimed.

Incoming peer PR6072 at head700b4da6ca49b7ceeee0fc3c162c01b2e5c2d290 was actually recovered over public HTTP:92 artifacts, ten helpers and five deliverables. Manifest b03e012b0c6da09c4a21226432834345c4dad560972031c235f2c5934529d651 binds all three incoming Lean prefixes. Both actual original immutable verifier executions reproduce their archived reports byte-for-byte. The first12000characters of the inherited handoff and all ten consumed helper files, separately and whole, were read. Native lines9324–9595, all272 lines added since own6069, were freshly read, as were the actual conductorIdealSheaf and conductorMap bodies. The entire9595-line inherited Native was authenticated and replayed rather than manually reread.

Own prior PR6069 was separately recovered over public HTTP:84 artifacts, ten helpers and five deliverables. Its manifest27cf54017d315dbd01aa55059738f6017ec032b99de9d3c5cee521ba60ca0ab8 binds OwnPreviousReading/InputGuard/Candidate and both original personal6030/6044 reading records. The first9323 lines of incoming Native match that own certificate exactly. OwnReadingReuse compares29 controls:23 unchanged, with the changed SF0 packet and five issue files separately authenticated. Original requests/gaps/routes/source findings are structurally unchanged. Peer personal source-reading attribution is never transferred to this worker.

The included47-line SF0 generic ideal-pullback proof cone was freshly read inside the inherited Native addition and is consumed unchanged. This job does not claim a new direct SF0 supplier HTTP recovery or fresh personal reading of the supplier's full source versions. Incoming peer verifier replay authenticates its inherited supplier evidence. Generic ideal pullbacks remain owned by SF0.

BaselineReading.json and BaselineRanges.json record fresh exact statements and ambient binders at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174. In particular, the whole227-line native IdealSheaf/Functorial module and bounded actual eqToIso, pullback.map/condition, of_iso_pullback and subscheme inclusion/empty APIs were read. Exact specialized names were absent in the recorded pinned Mathlib/Tau source and blueprint JSON searches; this is a scoped name search rather than an exhaustive mathematical absence survey.

Fresh source reading comprises the whole current displayed Stacks Section26.17: both definitions, all five lemma statements/proofs, diagrams and eight direct comments. Actual HTTP bytes, timestamp and SHA256 are archived. Linked correction patches, historical versions and linked proof pages were not reread. The conductor isomorphisms and map squares are authored deductions from the authenticated full-ideal comparisons and native scheme APIs, with this section as context. All27 inherited findings remain whole with their original attribution. No new source error is alleged. The verifier independently enumerates the retained five-dimensional commutative block-matrix algebra overF2:32 elements and1024 products.

## Validation

The final complete Native.lean retains the authenticated9595-line prefix and appends twelve proved declarations, seven proved examples and twelve new axiom audits. All twelve new declarations and the seven included examples pass. All619 audits use only propext, Classical.choice and Quot.sound; there are no errors, warnings or admissions. The complete Sketch.lean retains its authenticated6095-line Mathlib prefix and appends exactly matching admitted headers, with874 admission warnings as its only warnings. Both concrete constructions retain actual native definitions. The verifier compares all twelve declaration headers and all eight example headers against the full suggested file's exact appended projection. Native.lean contains seven new proved examples; the eighth test statement is checked only in the admitted Sketch.lean. The corresponding proof attempted in FailedFullNative.lean elaborated but exceeded the kernel heartbeat limit; its actual failed source, diagnostics and receipt are archived. Its proof is not claimed kernel checked.

The full Tau-importing Canonical.lean/Suggested.lean remains UNCOMPILED. Fresh TauBuildScope records available buildcf386627e9176a3827c1a5fe804989fd94a4d216 instead of required sourcef790474821cf4256814db967cb154e7af3d0c369, with all five direct compiled Tau imports absent. Native and admitted Mathlib checks do not certify that entire Tau-dependent file. No Lake setup/cache download, library build or language server was used. Each compiler ran serially with a fresh20GiB memory guard, one thread,8GiB memory limit and1200-second timeout. No Lean source was edited while its compiler ran. Initial cartesian-square inference/test elaboration errors were corrected. The eighth example still exceeds the deterministic kernel heartbeat limit even after abstracting routine quotient-section/isomorphism calculations and trying checked auxiliary proofs. The final successful native certificate omits that single example while retaining all twelve new declarations and seven proved examples. The admitted sketch checks its exact statement with the other seven. FailedFullNative.lean/log/receipt.json preserve the failed complete attempt at the same limits; no whole-file success is inferred from its twelve clean declaration audits.

'''+measurement('Native')+measurement('Sketch')+f'''
Suggested.lean equals Canonical.lean, SHA256 `{sha((S/'Canonical.lean').read_bytes())}`.

The actual indexed blueprint checker, source/errata validators, intake and atlas assembler run against immutable mathematical base `{txt('base.txt').strip()}` and publication base `{txt('publication-base.txt').strip()}`. Both actual reports are archived. All29 guards and the queue's non-state contract are checked. The verifier does not execute Lean or create a repository snapshot.

The atlas stage DAG has{g['stageDAG']['vertices']} vertices/{g['stageDAG']['edges']} edges, the own declaration DAG{g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']}, and the scoped DAG{g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']}. All are acyclic; all{g['requiredPairs']} required supplier paths are reachable. Whole foreign roadmaps/stages and every existing stage edge match the control. The{g['otherPreexistingMissingRestructurePairs']} unrelated preexisting missing restructure paths remain unchanged. No owned links are skipped or pending.

## Resume

Use the actual target/source conductor scheme isomorphisms and both actual conductorMap comparison squares. The nonreduced_conductor_section statement has admitted typing evidence only: resume from its archived failed native attempt to obtain a kernel-checked proof, without changing its actual recomputed conductor and inverse-comparison section map. Establish coherence under iterated base change with explicitly named carrier isomorphisms, and transport the geometric conductor pushout predicate along these actual comparisons. Those two obligations remain open; proving an ideal equality or one comparison square does not establish them. Generic Ferrand algebraic-space existence and its scheme affine-neighborhood criterion remain separate. Retain the small étale structure-sheaf requirement and all projective/Proj, properness, coherent H0/H1/genus, separateI2 and model/classification obligations, requests and source routes. This checkpoint does not complete the roadmap.
'''
h=h.rstrip()+'\n';(S/'HandoffBase.md').write_text(h);(S/'Handoff.md').write_text(h)
```

## Helper: verify.py

```python
"""Verify exact actual conductor subscheme contracts, compiler receipts and actual immutable atlas assembly; never runs Lean."""
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
assert len(old['nodes'])==726 and len(nodes)==len(p['nodes'])==739
assert p['nodes'][:726]==old['nodes'] and p['nodes'][726:]==data('NewNodes.json')
assert [n['id']for n in p['nodes'][726:]]==plan['newNodes'] and plan['changedExisting']=={}
assert set(p)==set(old)
for k in old:
 if k not in ['nodes','summary','sources','baseline','coverage']:assert p[k]==old[k],k
assert p['sources']==old['sources']+plan['newSources']and p['summary'].startswith(old['summary'])
assert not plan['newSourceIssues']and not plan['newGaps']
assert p['baseline']['declarations']==old['baseline']['declarations']+plan['newBaseline'] and len(p['baseline']['declarations'])==530
assert len(old['baseline']['declarations'])==528 and len(plan['newBaseline'])==2
assert {k:v for k,v in p['baseline'].items()if k!='declarations'}=={k:v for k,v in old['baseline'].items()if k!='declarations'}
for a,b in zip(old['coverage'],p['coverage']):
 if a['stageId']==RID+':G.0':
  assert b['remaining']==a['remaining']+[plan['frontier']]
  assert {k:v for k,v in a.items()if k!='remaining'}=={k:v for k,v in b.items()if k!='remaining'}
 else:assert a==b
assert p['status']=='partial'and all(n['implementationStatus']=='unchecked'for n in p['nodes'])and all(c['status']=='partial'for c in p['coverage'])
assert (len(p['requests']),len(p['gaps']),len(p['coverage']),len(p['routeCoverage']),len(p['sourceIssues']))==(23,18,7,78,27)
assert sum('planet'in n for n in p['nodes'])==29
rd=data('Candidate-roadmap.json');rold=data('Incoming-roadmap.json')
assert rd['stages'][1:]==rold['stages'][1:]
assert {k:v for k,v in rd.items()if k!='stages'}=={k:v for k,v in rold.items()if k!='stages'}
assert {k:v for k,v in rd['stages'][0].items()if k!='description'}=={k:v for k,v in rold['stages'][0].items()if k!='description'}
assert rd['stages'][0]['description']==rold['stages'][0]['description']+' '+plan['frontier']
assert txt('Reader.md')==txt('ReaderAddition.md')+txt('IncomingReader.md')
for n in p['nodes'][726:]:assert n['statement']in txt('ReaderAddition.md')and n['declarationName']in txt('ReaderAddition.md')
for item in plan['newApi']+plan['newTests']:assert item['name']in txt('ReaderAddition.md')and item['statement']in txt('ReaderAddition.md')
assert len(plan['newApi'])==8 and len(plan['newTests'])==8 and plan['newTestReferences']==13
assert sum(n['kind']=='construction'for n in data('NewNodes.json'))==2
assert sum(n['kind']=='lemma'for n in data('NewNodes.json'))==11
assert all(len(n['api'])>=3 and len(n['tests'])>=3 for n in data('NewNodes.json')if n['kind']=='construction')
from projection import project
assert txt('NewAdmitted.lean')==project(txt('NewProofs.lean'),txt('NewTests.lean'))
def headers(text):
 found={}
 for match in re.finditer(r'^(?:noncomputable )?(def|lemma|theorem|example)\b(?: ([\w.]+))?',text,re.M):
  depth=0;end=None;pending=0
  for i in range(match.start(),len(text)):
   c=text[i]
   if c in '([{⟨':depth+=1
   elif c in ')]}⟩':depth-=1
   if depth==0 and re.match(r'let(?:I)?\b',text[i:]) and (i==0 or not(text[i-1].isalnum()or text[i-1]=='_')):pending+=1
   if depth==0 and text.startswith(':=',i):
    if pending:pending-=1;continue
    end=i;break
  assert end is not None
  label=match.group(2)if match.group(1)!='example'else'example#'+str(len(found))
  assert label not in found,label
  found[label]=' '.join(text[match.start():end].split())
 return found
nh=headers(txt('NewProofs.lean'));nt=headers(txt('NewTests.lean'))
assert headers(txt('NewAdmitted.lean'))==dict(**nh,**{'example#'+str(12+i):v for i,v in enumerate(nt.values())})
assert headers(txt('PromotedNative.txt'))==headers(txt('PromotedCanonical.txt'))
assert 'conductorMap_square'in headers(txt('PromotedNative.txt'))
assert txt('PromotedNative.txt').strip()in txt('NativePrefix.lean')and txt('PromotedCanonical.txt').strip()in txt('CanonicalPrefix.lean')
assert plan['existingNativeNames']==[NS+'conductorMap_square']
assert len(nh)==12 and len(nt)==8 and {n.rsplit('.',1)[-1]for n in plan['newNames']}==set(nh)
assert len(re.findall(r"\bsorry\b",txt('NewAdmitted.lean')))==18
assert txt('Canonical.lean')==txt('CanonicalPrefix.lean')+'\n'+txt('NewAdmitted.lean')==txt('Suggested.lean')
assert txt('Native.lean')==txt('NativePrefix.lean')+'\n'+txt('NewProofs.lean')+'\n'+txt('CheckedTests.lean')+'\n'+txt('Audits.lean')
assert txt('CheckedTests.lean')==txt('NewTests.lean').split('-- test: ConductorSubschemeChecked.nonreduced_conductor_section',1)[0]+'end TauCeti.GenusOne.FerrandPushout\n'
assert len(headers(txt('CheckedTests.lean')))==7
failed=data('FailedFullNative.receipt.json');assert failed['exitStatus']==1 and failed['errors']==1 and failed['warnings']==0 and failed['availableGiBBefore']>=20
assert failed['sourceSha256']==sha((S/'FailedFullNative.lean').read_bytes())and failed['logSha256']==sha((S/'FailedFullNative.log').read_bytes())
assert '(kernel) deterministic timeout'in txt('FailedFullNative.log')
assert txt('FailedFullNative.lean')==txt('NativePrefix.lean')+'\n'+txt('NewProofs.lean')+'\n'+txt('NewTests.lean')+'\n'+txt('Audits.lean')
assert txt('Sketch.lean')==txt('SketchPrefix.lean')+'\n'+txt('NewAdmitted.lean')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',txt('Native.lean'))
assert {t['name']for t in plan['newTests']}==set(re.findall(r'^-- test: (.+)$',txt('NewTests.lean'),re.M))
assert txt('Incoming.lean')==txt('CanonicalPrefix.lean')
im=data('IncomingManifest.json');ir=data('PreviousRecovery.json')
assert ir['head']=='700b4da6ca49b7ceeee0fc3c162c01b2e5c2d290'and ir['artifactsVerified']==92 and ir['archivedHelpersVerified']==ir['publicHelperFencesVerified']==10
assert sha((S/'IncomingManifest.json').read_bytes())=='b03e012b0c6da09c4a21226432834345c4dad560972031c235f2c5934529d651'
for name,prefix in [('Native.lean','NativePrefix.lean'),('Sketch.lean','SketchPrefix.lean'),('Canonical.lean','CanonicalPrefix.lean')]:assert im[name]['sha256']==sha((S/prefix).read_bytes()),name
for original,replayed in [('Verification.json','Incoming-Verification.json'),('Verification-mathematical.json','Incoming-Verification-mathematical.json')]:assert im[original]['sha256']==sha((S/replayed).read_bytes())
assert txt('PreviousVerification.json')==txt('Incoming-Verification.json')and txt('PreviousMathematicalVerification.json')==txt('Incoming-Verification-mathematical.json')
for path,n in zip(paths,['Incoming-roadmap.json','Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert ir['publicDeliverables'][path]==sha((S/n).read_bytes())
om=data('OwnPreviousManifest.json');orr=data('OwnPreviousRecovery.json')
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='27cf54017d315dbd01aa55059738f6017ec032b99de9d3c5cee521ba60ca0ab8'
assert orr['head']=='1bbd3568bd0bf4667590372a7b0266a6898f21f0'and orr['artifactsVerified']==84 and orr['archivedHelpersVerified']==orr['publicHelperFencesVerified']==10
for original,current in [('Reading.json','OwnPreviousReading.json'),('InputGuard.json','OwnPreviousInputGuard.json'),('Candidate.json','OwnPreviousCandidate.json'),('OwnOriginal6030Reading.json','OwnOriginal6030Reading.json'),('OwnOriginal6044Reading.json','OwnOriginal6044Reading.json')]:assert om[original]['sha256']==sha((S/current).read_bytes()),current
og={g['path']:g['sha256']for g in data('OwnPreviousInputGuard.json')}
reuse=data('OwnReadingReuse.json');assert len(reuse)==29 and sum(g['unchanged']for g in reuse)==23
for g in reuse:
 assert sha(blob(MATH,g['path']))==g['after']and og[g['path']]==g['before']
 assert g['unchanged']==(g['before']==g['after'])
own=data('OwnPreviousCandidate.json')
for k in ['requests','gaps','routeCoverage','sourceIssues']:assert own[k]==old[k]
for a,b in zip(own['coverage'],old['coverage']):
 assert {k:v for k,v in a.items()if k!='remaining'}=={k:v for k,v in b.items()if k!='remaining'}
 assert b['remaining'][:len(a['remaining'])]==a['remaining']
assert sha(''.join(txt('NativePrefix.lean').splitlines(keepends=True)[:9323]).encode())==om['Native.lean']['sha256']
assert txt('PeerSince6069.lean')==''.join(txt('NativePrefix.lean').splitlines(keepends=True)[9323:])
claim=data('ClaimReceipt.json');assert claim['issue']==3378 and claim['claim']==5980525391 and claim['bot']==5980527154 and claim['session']=='codex-rtOQ9t'
assert claim['characters']==18717 and claim['beforeAfterEqual']and claim['beforeReads']==claim['afterReads']==[[0,11500],[11500,18717]]
assert claim['bodySha256']=='518055d3920b403fce956f8b1f50def5fd3e13ca01eb40f0cd42b734a9fca979'
assert data('SourceReading.json')[0]['sha256']==sha((S/'01JO.html').read_bytes())
search=data('Search.json');assert search['names']==plan['newNames']and all(r['exitStatus']==1 and r['matches']==[]for r in search['searches'])
assert data('TouchingLinks.json')==[]
for ref in [MATH,BASE]:
 for path in subprocess.check_output(['git','ls-tree','-r','--name-only',ref,'--','research/blueprint/links'],cwd=R,text=True).splitlines():
  if not path.endswith('.json'):continue
  link=json.loads(blob(ref,path))
  assert not [e for k in ['links','overlaps','examined']for e in link.get(k,[])if any(s in json.dumps(e)for s in [RID,'GenusOneFibrationsAndRationalEllipticSurfaces'])],path
assert sha(Path(sys.argv[2]).read_bytes())=='86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1'
tau=data('TauBuildScope.json');assert not tau['fullCanonicalCompiled'] and not tau['libraryBuildAttempted'] and tau['sourceTrackedClean']
assert tau['requiredSourceHead']=='f790474821cf4256814db967cb154e7af3d0c369' and len(tau['compiledImports'])==5 and not any(x['present']for x in tau['compiledImports'])
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
for stem,ex,want,audits in [('Native',339,0,619),('Sketch',359,874,20)]:
 rec=data(stem+'.receipt.json');log=txt(stem+'.log');b=(S/(stem+'.lean')).read_bytes()
 assert rec['exitStatus']==0 and rec['availableGiBBefore']>=20
 assert rec['sourceSha256']==sha(b)and rec['logSha256']==sha(log.encode())
 assert ': error'not in log and 'Exit status: 0'in log and 'timeout 1200'in log and '-j 1 -M 8192'in log
 assert log.count('warning:')==log.count('warning: declaration uses `sorry`')==want
 assert len(re.findall(r'^example\b',b.decode(),re.M))==ex
 au=re.findall(r"'([^']+)' depends on axioms:\s*\[([^]]*)\]",log);assert len(au)==audits==rec['axiomAudits']
 assert 'sorryAx'not in log
 for name,axs in au:assert set(x.strip()for x in axs.replace('\n',' ').split(',')if x.strip())<={'propext','Classical.choice','Quot.sound'},(name,axs)
 if stem=='Native':assert set(plan['newNames'])|set(plan['existingNativeNames'])<={n for n,_ in au}
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
problems=[x for f,t in contents.items()for x in env['file_problems'](f,t)];refusals=env['auto_refusals'](job,paths,False,{'codex-rtOQ9t'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'NERON_VALIDATE_BASE':BASE}));assert graph['auditBase']==BASE
print(json.dumps(dict(mathematicalBase=MATH,publicationBase=BASE,preservedContracts=726,preservedWholeNodes=726,changedExisting={},newNodes=13,newAuthoredDeclarations=12,promotedExistingApi=1,newApi=8,newTests=8,newTestReferences=13,baselineDeclarations=len(p['baseline']['declarations']),rawApi=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),matchedNativeHeaders=12,matchedExistingHeaders=1,matchedExamples=8,nativeNewExamples=7,admittedOnlyNewExample='ConductorSubschemeChecked.nonreduced_conductor_section',failedFullNativeReplay=failed,checker=checker,compilation=comp,canonicalSha256=sha(txt('Canonical.lean').encode()),fullCanonicalCompiled=False,incomingArchiveAuthenticated=92,ownPreviousArchiveAuthenticated=84,guardsUnchanged=len(data('InputGuard.json'))-len(changes),publicationGuardChanges=list(changes.values()),indexSha256=sha(Path(sys.argv[2]).read_bytes()),intakeProblems=problems,intakeRefusals=refusals,sourceIssueErrors=issues,sourceVersionScope='All27 inherited findings retained whole. Fresh whole displayed01JO definitions/proofs/eightcomments; linked history not read. Conductor isomorphisms and map squares are authored deductions from prior full-ideal comparisons and pinned native comapIso/pullback APIs. No new source finding.',graph=graph,LeanExecuted=False),indent=2))
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
BASE = os.environ.get('NERON_VALIDATE_BASE', '02e114932627b8940b6df881e8eb9e8bfdac748c')
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
result=subprocess.run(['/usr/bin/time','-v','stdbuf','-oL','-eL','timeout','1200',str(lean),'-j','1','-M','8192',str(out/name)],env=env)
sys.exit(result.returncode)
```

## Helper: runcheck.py

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

## Helper: package.py

```python
"""Archive only named job evidence in an inert comment; write final public recovery."""
from pathlib import Path
import base64,hashlib,json,re,sys,zlib
S=Path(sys.argv[1]).resolve();R=Path.cwd();mode=sys.argv[2]
STEM='NeronModelsAndSemistableAbelianVarietiesPartII'
suggested=R/'research/blueprint/suggested'/(STEM+'.lean')
sha=lambda b:hashlib.sha256(b).hexdigest()
NAMES='Incoming-roadmap.json Incoming.json IncomingReader.md Incoming.lean IncomingHandoff.md IncomingManifest.json Incoming-Verification.json Incoming-Verification-mathematical.json PreviousHead.txt PreviousRecovery.json PreviousVerification.json PreviousMathematicalVerification.json\nNativePrefix.lean SketchPrefix.lean CanonicalPrefix.lean PromotedNative.txt PromotedCanonical.txt PeerSince6069.lean Native.lean Native.log Native.receipt.json CheckedTests.lean FailedFullNative.lean FailedFullNative.log FailedFullNative.receipt.json Sketch.lean Sketch.log Sketch.receipt.json Canonical.lean NewProofs.lean NewTests.lean NewAdmitted.lean Audits.lean\nCandidate-roadmap.json Candidate.json Reader.md ReaderAddition.md Suggested.lean Handoff.md HandoffBase.md ClaimReceipt.json Reading.json SourceReading.json BaselineReading.json BaselineRanges.json OwnReadingReuse.json OwnPreviousManifest.json OwnPreviousRecovery.json OwnPreviousReading.json OwnPreviousInputGuard.json OwnPreviousCandidate.json OwnOriginal6030Reading.json OwnOriginal6044Reading.json\nInputGuard.json PublicationChanges.json TouchingLinks.json Plan.json NewNodes.json Verification-mathematical.json Verification.json SourceGapCounterexample.json Search.json TauBuildScope.json Graph.json base.txt publication-base.txt 01JO.html\nassemble.py author.py projection.py write_handoff.py verify.py graph.py immutable.py compile.py runcheck.py package.py'.split()
if mode=='archive':
 meta={n:dict(sha256=sha((S/n).read_bytes()),bytes=len((S/n).read_bytes()),lines=len((S/n).read_bytes().splitlines()))for n in NAMES}
 mb=(json.dumps(meta,indent=2,sort_keys=True)+'\n').encode();(S/'artifact-manifest.json').write_bytes(mb)
 payload={n:dict(sha256=sha((S/n).read_bytes()),data=base64.b64encode(zlib.compress((S/n).read_bytes(),9)).decode())for n in NAMES+['artifact-manifest.json']}
 pb=(json.dumps(payload,sort_keys=True,separators=(',',':'))+'\n').encode();(S/'payload.json').write_bytes(pb)
 report=dict(artifacts=len(NAMES),helpers=sum(n.endswith('.py')for n in NAMES),manifestSha256=sha(mb),payloadSha256=sha(pb))
 (S/'package.json').write_text(json.dumps(report,indent=2)+'\n')
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED CONDUCTOR SUBSCHEME COMPARISON PAYLOAD\n'+pb+b'END ARCHIVED CONDUCTOR SUBSCHEME COMPARISON PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('roadmaps','Candidate-roadmap.json'),('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated actual conductor subscheme comparison evidence; never executes Lean."""
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
pb=raw.split('/- BEGIN ARCHIVED CONDUCTOR SUBSCHEME COMPARISON PAYLOAD\\n',1)[1].split('END ARCHIVED CONDUCTOR SUBSCHEME COMPARISON PAYLOAD -/',1)[0].encode()
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

Serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Sketch.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. The full Tau-importing Canonical.lean/Suggested.lean is not covered by these checks and remains UNCOMPILED. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

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
"""Recover public authenticated actual conductor subscheme comparison evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='NeronModelsAndSemistableAbelianVarietiesPartII'
ARCHIVE='8993c5cdf0d09403180b3aa4a21eae5912d1a0d0'
MANIFEST_SHA='6a2c918330e685570860408a7986dfac11147e73fa884d1736ea7de7b4d92249'
PAYLOAD_SHA='1ebcd43371e1b623f8d527a5433fe4f4b3ab73d8ef6c799eb11d22ae1c21f8e6'
EXPECTED={'roadmaps': 'd380954287623f6b83fc8548a100a5aec04a6b49b96cc4d998cc3bb136b23760', 'packets': 'eb15be3289bc31e680465f514b9076a2a218f6ac933d382fe7f0802102400ba2', 'readmes': 'de89366e67a04b362521e1aa9d609a618e626d1bec81bb2c5ec9dc3de10c2272', 'suggested': '6f5c952df762a69815fe5b3ae0cb5df60bd719badd1969783c153e59a2eae94a'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED CONDUCTOR SUBSCHEME COMPARISON PAYLOAD\n',1)[1].split('END ARCHIVED CONDUCTOR SUBSCHEME COMPARISON PAYLOAD -/',1)[0].encode()
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
