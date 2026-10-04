# Global flat comparison of conductor ideals — checkpoint

Agent: Codex — codex-7e92bd. Refs #3378. The roadmap remains partial; every implementationStatus remains unchecked.

The exact existing conductor_global_flat_comparison header now has native proof evidence. For any finite schematically dominant f:Y→P and any flat q:T→P, the recomputed conductorIdealSheaf(pullback.snd f q) equals (conductorIdealSheaf f).comap q as native ideal-sheaf data. This retains full ideals and their nilpotents. No affine, Noetherian, reduced, separated, birational, faithful-flat or quasi-compact-target assumption is added.

The proof uses affine V in T lying over affine U in P. The map q need not be affine, and q⁻¹U need not be affine. Finiteness of f makes f⁻¹U affine. The native affine-section pushout identifies the four actual section maps; the previously proved finite-flat conductor formula transports through its actual comparison ring equivalence. The SF.0 affine ideal-pullback formula, restricted along the actual V→U map and transported by the two native topIso section maps, identifies the other side. Native ideal-sheaf extensionality on the cover of all such V proves the global equality.

Five new lemma nodes provide conductor_comap_pushout, conductorIdealSheaf_comap_chart, conductor_flat_chart, conductorSourceIdeal_flat and conductorIdealSheaf_flat_tower. The ring-pushout ideal equality needs only finiteness and flatness, without injectivity. The pulled-back chart formula needs no flatness; the recomputed chart formula does. The source-ideal equality uses the actual pullback square. The two-step theorem gives equality with pullback along the composite without identifying distinct scheme carriers silently. Generic ideal pullback and flat annihilator theory stays at SF.0; no new generic carrier is introduced.

Four API entries and eight typed examples extend the existing conductorIdealSheaf API. They check identity base change, base change of the identity morphism, the empty chart, actual affine restriction maps between refined charts, the source ideal for identity base change, a flat tower ending in open restriction, the zero ring, and the finite schematically dominant diagonal Spec(Z/4×Z/4)→Spec(Z/4). In the last example the actual global section corresponding to2 is nonzero and square-zero but remains outside the conductor after identity base change. A radical replacement would fail this test.

All721 incoming mathematical contracts are preserved;719 entire node objects are unchanged. The conductor ideal-sheaf node only gains appended API/tests. The existing global comparison node only gains appended prerequisites/proof steps; its statement and hypotheses are unchanged. The packet now has726 nodes,528 baseline declarations,450 raw API references and444 raw test references. All29 planets,18 gap records,23 requests,78 source routes,27 source findings and seven partial stages remain. The latest frontier records that the ideal-sheaf equality substep has native evidence; the broader retained gap records are not marked closed.

## Reading and provenance

The complete18717-character issue was read before and after bot5979767117 confirmed exact claim5979765642; the two complete read partitions and body hash are in ClaimReceipt.json. WORKERS was freshly read, as were blueprint PROTOCOL sections0–5,9,12–15 and19. Earlier complete own expansion, upstream and remaining protocol reading is reused only within authenticated original scopes at unchanged controls. Own prior PR6060 manifest dde63f3028cfe79790175a6cbdc32d1bbd0ebb2902ed6151f9394641aa52f1d8 authenticates its Reading/InputGuard/Candidate and the nested own6047/6039 reading records. Of29 controls,23 are unchanged; the changed SF.0 packet and five issue deliverables are separately authenticated. Matching hashes do not enlarge personal reading scopes.

The full reviewed parentR11.1–R11.6 audit rows and reviewer metadata were freshly read; there is no separate PartII audit row. The complete reserved Ferrand node with its9API/7tests, relevant conductor target/ideal nodes and both SF.0 requests were freshly read. Original own coverage frontiers, requests, gaps and routes are structurally checked against the current packet. The two appendedG0 frontier paragraphs and the peer's additional historical00DF correction record were read as inherited records. No fresh whole721-node, inherited-reader or historical source audit is claimed. The complete link corpus was scanned for this PartII and its legacy id across links, overlaps and examined:zero matching entries. Reading.json records the bounded scopes.

Incoming peer PR6069, head1bbd3568bd0bf4667590372a7b0266a6898f21f0, was actually recovered over public HTTP:84 artifacts,10 helpers and five deliverables. Manifest27cf54017d315dbd01aa55059738f6017ec032b99de9d3c5cee521ba60ca0ab8 authenticates the exact three incoming Lean prefixes. Both actual original verifier executions reproduce their recorded reports byte-for-byte. The whole human handoff prefix and recovery/verification/immutable/graph helpers were read. Own6060 Native is the exact first8790 lines of the incoming9323-line Native; all533 added peer lines were freshly read, including the left/right quotient comparisons and generic flat-annihilator proof cone. Existing conductor affine, restriction and pre/postcomposition adapters used here were freshly read. Peer source-reading attribution is not transferred to this worker.

The current SF.0 supplier was actually recovered from own PR6070 headc45ace1a83295590226033ffbba993dcca1ef0bd and archive0c8fa79af1d24e9220bea3b873e009d70a781c22. Its69 artifacts,11 helpers and four deliverables match manifest91805b2d6c27eb515c25dc9d547e18c20338e069ee2bc16a1940fe678164095f. Both actual original verifier reports match byte-for-byte. The generic ideal pullback node objects and actual proof slice were freshly read. SupplierPrelude.lean is exactly native lines431–477 followed by namespace/section closures: ideal_comap_top, comap_restrict and ideal_restrict_top. The three unchanged generic proofs appear only in native evidence, with their own axiom audits; they are not replanned or pasted into the full suggested file. BaselineRanges.json and BaselineReading.json record the actual native statements and ambient binders read at the exact Mathlib pin. New exact names were absent in bounded pinned Mathlib/Tau and blueprint JSON searches; this is not a general online absence survey.

Fresh source reading comprises the entire displayed Stacks Lemma10.40.4 statement/proof, with no direct comments, and all of displayed Section26.17, including its definitions, five lemmas/proofs and eight direct comments. Linked section comments for07T8, historical versions, correction patches and linked proofs were not reread. Actual HTTP bytes, timestamps and hashes are in SourceReading.json. The conductor deduction is authored, importing the generic finite-flat annihilator and ideal-pullback results. All27 inherited findings remain whole with their original attribution. The verifier independently enumerates the inherited five-dimensional commutative block-matrix algebra overF2:32 elements and1024 products. No new source error is alleged.

## Validation

The final complete Native.lean preserves the entire authenticated incoming prefix and appends the exact supplier proof cone, five new lemmas, the exact existing global comparison proof, eight tests and nine axiom audits. The final replay has no errors, warnings or admissions; all607 audits use only propext, Classical.choice and Quot.sound. Sketch.lean preserves its complete authenticated Mathlib prefix and appends exactly matching admitted headers. The verifier compares each new and test header, and compares the existing global header directly against the inherited full suggested file. That existing header stays once in Canonical.lean; it is not duplicated by the new plan.

The complete Tau-dependent Canonical.lean/Suggested.lean remains UNCOMPILED. The fresh build probe records available Tau headcf386627e9176a3827c1a5fe804989fd94a4d216 instead of the requiredf790474821cf4256814db967cb154e7af3d0c369, and all five direct compiled Tau imports are absent. Pinned source trees and the exact declaration index were verified. No Lake setup, cache download, library build or language server was used. Each Lean check ran serially in the existing exact Mathlib build, with fresh available memory≥20GiB, one thread,8GiB limit and1200-second timeout. No Lean file was edited while a compiler ran. An initial explicit pushout-lemma argument mismatch and letI lint were corrected before the successful complete prototype and final replay.

- Native.lean: 9595 lines, 332 examples, 0 warnings, 607 axiom audits, exit0. Source SHA256 `a8b0d1e7c14ae6ef974afe86d86f5defbd8fdb8976f85927fb68d73966714772`; diagnostic SHA256 `a965c6405d7b1f09affcfc591d68d6565b9269792ba1bfae0f3e874659fc4fd3`. Before the serial run: 42GiB available; elapsed 128.73s; maximum RSS 7280796KiB.
- Sketch.lean: 6095 lines, 351 examples, 856 warnings, 20 axiom audits, exit0. Source SHA256 `4f30d4dac349e3b35f62dbe2ed46dba0984d8be0017cad358ea62b06af644eeb`; diagnostic SHA256 `decfd2e2fea1bd096fb88733f661da3a85e7dea1c792cd2c32e4101a7d7b3045`. Before the serial run: 42GiB available; elapsed 87.2s; maximum RSS 7096068KiB.

Suggested.lean equals Canonical.lean, SHA256 `2df202c73c42d2a19fa69223c8d95abe4c235cfb162d86403bf667d1d2a6a237`. Native and bounded admitted evidence do not certify that complete Tau-dependent file.

The actual indexed checker, source-issue checker, intake checks and atlas assembler run at immutable mathematical base `dc553a27b51de533edcae948497fca82891e9a8b` and publication base `dc553a27b51de533edcae948497fca82891e9a8b`. All29 input guards and the queue's non-state contract are checked. Both actual verifier reports are retained. The verifier does not run Lean or create a repository snapshot.

The atlas stage DAG has3043 vertices/8727 edges; the own declaration DAG has726/1707; the scoped DAG has3747/11363. All are acyclic and all69 required supplier paths are reachable. Entire foreign roadmaps/stages and every existing stage edge match the control. The45 unrelated preexisting missing restructure paths remain unchanged. No owned links are skipped or pending.

## Resume

Reuse the exact global ideal-sheaf equality and both source/tower equalities. Next build explicit native conductor subscheme comparison isomorphisms and verify the conductorMap projection squares and coherence through further base change. Native comapIso supplies the underlying closed-subscheme pullback comparison, but those conductor-specific maps are not proved here. Generic Ferrand algebraic-space existence and its scheme affine-neighborhood criterion remain separate. Retain the projective-line/Proj, properness/projectivity, coherent H0/H1/genus, separateI2, and later model/classification obligations, every supplier request, source route and reserved Ferrand/small-étale-site requirement. This checkpoint does not complete the roadmap.

## Public recovery and replay

Archive commit `9fbc1ff9306d9d508fc30a7350e6e16b765a54d4` is an ancestor changing only this issue's suggested file. Its 92 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `b03e012b0c6da09c4a21226432834345c4dad560972031c235f2c5934529d651`; payload SHA256 `c853e54200a6b607fb6ef1f9c439b17f31e3bfaab1553ac789006052bba17f1e`. The final suggested file has no archive payload and equals Canonical.lean, whose full Tau-importing file remains UNCOMPILED.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count and all ten exact public helper fences, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set NERON_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Sketch.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. The full Tau-importing Canonical.lean/Suggested.lean is not covered by these checks and remains UNCOMPILED. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Helper: assemble.py

```python
"""Preserve exact prefixes and project identical native and admitted statements."""
from pathlib import Path
import re,sys
S=Path(sys.argv[1]).resolve();sys.path.insert(0,str(S))
from projection import admit_lemmas
txt=lambda n:(S/n).read_text()
names=re.findall(r'^lemma (\w+)',txt('NewProofs.lean')+txt('PostProofs.lean'),re.M)
assert len(names)==5 and len(re.findall(r'^example\b',txt('NewTests.lean'),re.M))==8
for a,b in [('NewProofs.lean','NewAdmitted.lean'),('PostProofs.lean','PostAdmitted.lean'),('ExistingProofs.lean','ExistingAdmitted.lean'),('NewTests.lean','TestsAdmitted.lean')]:
 (S/b).write_text(admit_lemmas(txt(a)))
audits=''.join('#print axioms TauCeti.GenusOne.FerrandPushout.'+n+'\n'for n in names+['conductor_global_flat_comparison'])
audits+=''.join('#print axioms TauCeti.SchemeFoundations.IdealPullback.'+n+'\n'for n in ['ideal_comap_top','comap_restrict','ideal_restrict_top'])
(S/'Audits.lean').write_text(audits)
imports='import Mathlib.AlgebraicGeometry.Morphisms.Flat\nimport Mathlib.Algebra.Category.Ring.Constructions\nimport Mathlib.Topology.Sets.OpenCover\n'
(S/'ImportAddition.lean').write_text(imports)
(S/'Native.lean').write_text('\n'.join(txt(n)for n in ['NativePrefix.lean','SupplierPrelude.lean','NewProofs.lean','ExistingProofs.lean','PostProofs.lean','NewTests.lean','Audits.lean']))
(S/'Sketch.lean').write_text('\n'.join(txt(n)for n in ['SketchPrefix.lean','NewAdmitted.lean','ExistingAdmitted.lean','PostAdmitted.lean','TestsAdmitted.lean']))
addition='\n'.join(txt(n)for n in ['NewAdmitted.lean','PostAdmitted.lean','TestsAdmitted.lean'])
assert len(re.findall(r'\bsorry\b',addition))==13
(S/'CanonicalAddition.lean').write_text(addition)
(S/'Canonical.lean').write_text(imports+txt('CanonicalPrefix.lean')+'\n'+addition)
(S/'Suggested.lean').write_text(txt('Canonical.lean'))
```

## Helper: author.py

```python
"""Plan the conductor specialization, importing native and SF.0 constructions."""
from pathlib import Path
import copy,csv,json,sys
S=Path(__file__).resolve().parent;RID='NeronModelsAndSemistableAbelianVarietiesPartII';P=RID+':G.0/';NS='TauCeti.GenusOne.FerrandPushout.'
load=lambda n:json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
p=copy.deepcopy(load('Incoming.json'));road=load('Incoming-roadmap.json')
specs=[
('conductor-pushout-recomputation','conductor_comap_pushout','Conductor recomputation in an actual ring pushout','For an actual CommRingCat pushout A→B, A→F, B→D, F→D, if A→B is finite and A→F is flat, extending the full inverse-image conductor ideal of A→B to F gives the full inverse-image conductor ideal of F→D. Injectivity of A→B is not needed for this ideal equality.',[P+'conductor-right-flat-annihilator',P+'conductor-annihilator',P+'conductor-postcomposition','mathlib:CommRingCat.isPushout_tensorProduct','mathlib:CategoryTheory.IsPushout.isoIsPushout','mathlib:CategoryTheory.IsPushout.inr_isoIsPushout_hom'],'Use the native tensor-product pushout and its unique comparison with the given pushout. Its actual right inclusion commutes with F→D. Rewrite the finite flat annihilator result as the original conductor, then transport the recomputed conductor by the actual comparison ring equivalence.'),
('conductor-pullback-refined-chart','conductorIdealSheaf_comap_chart','Pullback conductor ideal on a refined chart','For finite schematically dominant f:Y→P, any q:T→P, affine U⊂P and affine V⊂T with V⊂q⁻¹U, the V-ideal of (conductorIdealSheaf f).comap q equals the extension of the U-conductor ideal along the actual q.appLE U V. Neither q-affineness nor q-flatness is required.', ['SchemeAndStackFoundations:SF.0/ideal-comap-top','SchemeAndStackFoundations:SF.0/ideal-restrict-top',P+'conductor-ideal-sheaf','mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comap_comp','mathlib:AlgebraicGeometry.Scheme.Hom.resLE_comp_ι','mathlib:AlgebraicGeometry.Scheme.Hom.resLE_app_top','mathlib:Ideal.comap_injective_of_surjective','mathlib:Ideal.map_comap_of_surjective','mathlib:Ideal.map_symm'],'Restrict q to V→U and consume the SF.0 native affine ideal-pullback formula. Use native composition of ideal pullbacks and resLE_comp_ι. Transport along the two actual topIso section isomorphisms and cancel the surjective source topIso. This conductor specialization imports the generic ideal theory without replanning it.'),
('conductor-flat-refined-chart','conductor_flat_chart','Recomputed flat conductor on a refined chart','For finite schematically dominant f:Y→P and flat q:T→P, on every affine V⊂q⁻¹U with U affine, the recomputed conductor of pullback.snd f q on V equals the extension of the original U-conductor along q.appLE U V. All ideals are full ideals.', ['conductor_comap_pushout',P+'conductor-sheaf-affine-component','mathlib:AlgebraicGeometry.isIso_pushoutSection_of_isAffineOpen','mathlib:AlgebraicGeometry.isIso_pushoutSection_iff','mathlib:AlgebraicGeometry.Scheme.Hom.finite_app','mathlib:AlgebraicGeometry.Scheme.Hom.flat_appLE','mathlib:AlgebraicGeometry.Scheme.Hom.app_eq_appLE','mathlib:CategoryTheory.Limits.pullback.condition'],'The inverse image of V under pullback.snd is the intersection of its inverse image with the pullback of f⁻¹U. Native affine-section comparison makes the actual four section maps a ring pushout. Apply conductor_comap_pushout with native finite_app and flat_appLE, then identify both actual conductorIdealSheaf affine ideals.'),
('conductor-source-flat-comparison','conductorSourceIdeal_flat','Flat comparison of the source conductor ideal','For finite schematically dominant f:Y→P and flat q:T→P, the source conductor ideal of the base-changed map equals the pullback along pullback.fst f q of the original source ideal (conductorIdealSheaf f).comap f.',[P+'conductor-scheme-flat-comparison','mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comap_comp','mathlib:CategoryTheory.Limits.pullback.condition'],'Rewrite the recomputed target conductor by the exact global flat comparison. Native ideal-pullback composition and the actual scheme pullback square identify the two source ideals.'),
('conductor-flat-tower','conductorIdealSheaf_flat_tower','Conductor ideals through two flat base changes','For finite schematically dominant f:Y→P and flat q:T→P and r:Z→T, the conductor of the iterated pullback map to Z equals the pullback of the original conductor along r≫q.',[P+'conductor-scheme-flat-comparison','mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comap_comp'],'Apply the exact global flat comparison twice and native comap_comp. Native instances supply finiteness and schematic dominance after the first flat base change. No identification of the two iterated pullback scheme carriers is silently assumed.')]
ids={name:P+slug for slug,name,*_ in specs}
common=['Schemes and section rings lie in a common universe. Zero rings and nonreduced rings are allowed. Only the finite, schematically dominant and flat hypotheses explicitly stated are assumed. No Noetherian, reduced, separated, faithful-flat, birational or quasi-compactness hypothesis on the base-change target is added.']
nodes=[]
for slug,name,title,statement,deps,proof in specs:
 nodes.append(dict(id=P+slug,parentStageId=RID+':G.0',realises=[RID+':G.0'],kind='lemma',title=title,declarationName=NS+name,statement=statement,hypotheses=common if name!='conductor_comap_pushout'else['Four commutative rings in a common universe; the specified square is a categorical pushout, its original map is finite and its base-change map is flat. The original map need not be injective.'],prerequisites=[ids.get(d,d)for d in deps],proofSteps=[proof],acceptance=[statement,'Use the actual section maps and full ideals, retaining nilpotents.'],library=dict(module='TauCeti/AlgebraicGeometry/GenusOne/G0',namespace=NS[:-1]),sources=[dict(sourceId='conductor-scheme-flat-7e92bd-01JO',locator='Section26.17, Lemmas26.17.2–4 and26.17.6(1); conductor deduction also uses07T8',excerpt='affine',match='Native affine fibre-product and ideal-pullback descriptions support this authored conductor specialization. The finite flat annihilator theorem is consumed from SF.0 through the already planned conductor ring formula.')],implementationStatus='unchecked'))
tests=[]
for short,kind,statement in [
('identity_base','compatibility','Base change of any finite schematically dominant f along the identity has exactly the original conductor ideal sheaf.'),
('identity_morphism','degenerate','After any flat base change of the identity morphism, the conductor ideal sheaf is the whole ideal.'),
('empty_chart','degenerate','Extension of an affine conductor along the actual section map to the empty open equals the whole ideal of the zero section ring.'),
('refinement','compatibility','For affine V⊂W⊂q⁻¹U, restricting the extended U-conductor from W to V equals extending it directly along q.appLE U V, using the actual presheaf restriction map.'),
('source_identity','compatibility','For identity base change the recomputed source conductor equals the pullback of the original source conductor along the actual pullback.fst.'),
('tower_restriction','compatibility','Following an arbitrary flat base change by restriction to any open V gives the conductor ideal obtained by restricting the first pulled-back ideal to V.'),
('zero_ring','degenerate','Identity base change of the identity of Spec(Z/1) has the whole conductor ideal sheaf.'),
('nonreduced_identity_base','non-example','For the actual finite schematically dominant Spec(Z/4×Z/4)→Spec(Z/4) induced by the diagonal, after identity base change the global section corresponding to the nonzero square-zero element2 is not in the conductor ideal. Thus replacing this full ideal by its radical fails the test.')]:tests.append(dict(name='ConductorSchemeFlatChecked.'+short,kind=kind,statement=statement))
by={n['id']:n for n in p['nodes']};target=by[P+'conductor-scheme-flat-comparison']
target['prerequisites'] += [ids['conductorIdealSheaf_comap_chart'],ids['conductor_flat_chart'],'mathlib:AlgebraicGeometry.Scheme.IdealSheafData.ext_of_iSup_eq_top','mathlib:TopologicalSpace.Opens.IsBasis.isOpenCover_mem_and_le','mathlib:TopologicalSpace.Opens.IsBasis.isOpenCover','mathlib:TopologicalSpace.IsOpenCover.comap','mathlib:AlgebraicGeometry.Scheme.isBasis_affineOpens']
target['proofSteps'].append('The exact existing conductor_global_flat_comparison header now has native evidence. Pull back the affine-open cover of P, refine it by all affine V in T lying over an affine U, and apply native ideal-sheaf extensionality on that cover. The two refined-chart lemmas identify both full ideals with extension along the same actual q.appLE. This works for arbitrary flat q, without assuming q affine or T quasi-compact. Source-ideal and two-step pullback equalities follow. Explicit conductor subscheme isomorphisms and their conductorMap projection coherence remain the next adapter work; no generic Ferrand existence result is concluded.')
obj=by[P+'conductor-ideal-sheaf'];api=[dict(name=n['declarationName'],role='compatibility',statement=n['statement'])for n in nodes[1:]]
obj['api']+=api;obj['tests']+=tests
p['nodes']+=nodes
refs=sorted({d.removeprefix('mathlib:')for n in nodes+[target]for d in n['prerequisites']if d.startswith('mathlib:')}- {d.removeprefix('mathlib:')for d in load('Incoming.json')['nodes'][list(by).index(target['id'])]['prerequisites']if d.startswith('mathlib:')})
# Include already-listed native references used directly by the new bodies as well.
refs=sorted(set(refs)|{d.removeprefix('mathlib:')for n in nodes for d in n['prerequisites']if d.startswith('mathlib:')})
rows=list(csv.reader(Path(sys.argv[1]).open(),delimiter='\t'));have={x['ref']for x in p['baseline']['declarations']};baseline=[];reading=[]
for name in refs:
 row=next(r for r in rows if len(r)>5 and r[0]=='mathlib'and r[1]==name)
 reading.append(dict(name=name,file=row[3],line=int(row[4]),signature=row[5],scope='Actual statement and ambient binders freshly read; ranges and source hashes in BaselineRanges.json.'))
 if 'mathlib:'+name not in have:baseline.append(dict(ref='mathlib:'+name,kind=row[2],module=row[3],line=int(row[4]),provides=row[5]+' Reuse the native declaration for conductor base change.',checked='Codex — codex-7e92bd read this statement at the pinned Mathlib commit on2026-10-04.'))
p['baseline']['declarations']+=baseline;save('BaselineReading.json',reading)
sources=[]
for tag,row in zip(['07T8','01JO'],load('SourceReading.json')):
 sources.append(dict(id='conductor-scheme-flat-7e92bd-'+tag,title='Finite flat annihilators'if tag=='07T8'else'Fibre products of schemes and inverse-image ideals',authors='The Stacks Project authors',edition='Current primary displayed source; read4October2026',url=row['url'],sha256=row['sha256'],accessed=row['accessed'],readSections=[row['scope'],'The conductor scheme comparison is an authored deduction; generic ideal pullbacks and flat annihilators remain supplier-owned.']))
p['sources']+=sources
frontier='The exact existing conductor_global_flat_comparison header now has native proof evidence for every finite schematically dominant f and arbitrary flat q. Five new lemmas connect the actual ring pushout to refined affine charts, compare the source ideal and handle a two-step flat tower. Four API entries and eight typed examples include actual chart restrictions, empty charts, zero rings and a nonzero nilpotent excluded from the full diagonal conductor overZ/4. No affine, Noetherian, reduced, separated or quasi-compact-target hypothesis is added. Explicit subscheme comparison isomorphisms and conductorMap coherence remain, together with generic Ferrand algebraic-space existence, the scheme affine-neighborhood criterion, projective/cohomological work, separateI2 and later models/classification. All18 gap records,23 requests,78 routes,27 findings and seven partial stages remain; every implementation stays unchecked and the full Tau-dependent suggested file is UNCOMPILED.'
p['summary']+=' Scheme flat-conductor continuation:five conductor-specific lemmas, four API references and eight typed tests; the exact inherited global ideal-sheaf equality has native evidence. All721 incoming contracts remain, with719 whole node objects unchanged; only the conductor ideal-sheaf API/tests and global comparison proof dependencies are appended.'
next(c for c in p['coverage']if c['stageId']==RID+':G.0')['remaining'].append(frontier)
next(c for c in road['stages']if c['key']=='G.0')['description']+=' '+frontier
plan=dict(newNames=[n['declarationName']for n in nodes],newNodes=[n['id']for n in nodes],newApi=api,newTests=tests,newBaseline=baseline,newSources=sources,newSourceIssues=[],newGaps=[],changedExisting={target['id']:['prerequisites','proofSteps'],obj['id']:['api','tests']},existingNativeNames=[NS+'conductor_global_flat_comparison'],frontier=frontier)
for n,x in [('Candidate.json',p),(RID+'.json',p),('Candidate-roadmap.json',road),('NewNodes.json',nodes),('Plan.json',plan)]:save(n,x)
parts=['# Global flat comparison of conductor ideal sheaves\n\n'+frontier+'\n\nThe affine opens of T used here lie over affine opens of P. The proof never assumes their full inverse images under q are affine. The actual finite map f has affine inverse images, so the native section pushout supplies the required tensor comparison. Ideal extension uses the full conductor, including its nilpotents, and actual presheaf maps. The SF.0 generic affine ideal-pullback formula is imported. Both source-ideal equality and iterated pullback equality concern native ideal data; explicit isomorphisms of the closed conductor schemes and conductorMap compatibility are still required.\n\nAll721 incoming contracts,27 source findings,78 routes and23 requests are retained. The exact existing global theorem is proved in native evidence without a duplicate node or a stronger hypothesis. The plan and full suggested file remain partial and unchecked.\n\n']
for n in nodes:
 parts+=['## '+n['title']+'\n\n','**'+n['declarationName']+'** — '+n['statement']+'\n\n','Hypotheses: '+' '.join(n['hypotheses'])+'\n\n','Prerequisites: '+', '.join(n['prerequisites'])+'.\n\n','Proof: '+' '.join(n['proofSteps'])+'\n\n']
parts+=['## Added conductor API and tests\n\n']
for label,items in [('Consumed API',api),('Typed examples',tests)]:
 parts+=[label+':\n\n']+['- **'+x['name']+'**: '+x['statement']+'\n'for x in items]+['\n']
(S/'ReaderAddition.md').write_text(''.join(parts));(S/'Reader.md').write_text(''.join(parts)+(S/'IncomingReader.md').read_text())
print(json.dumps(dict(nodes=len(p['nodes']),newBaseline=len(baseline),baseline=len(p['baseline']['declarations']),newApi=len(api),newTests=len(tests),rawApi=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']))))
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
"""Record measured evidence, exact reading scopes and the remaining roadmap frontier."""
from pathlib import Path
import hashlib,json,re
S=Path(__file__).resolve().parent
txt=lambda n:(S/n).read_text()
data=lambda n:json.loads(txt(n))
sha=lambda b:hashlib.sha256(b).hexdigest()
def measurement(stem):
 r=data(stem+'.receipt.json');b=(S/(stem+'.lean')).read_bytes();assert r['exitStatus']==0
 return f"- {stem}.lean: {len(b.splitlines())} lines, {len(re.findall(r'^example\b',b.decode(),re.M))} examples, {r['warnings']} warnings, {r['axiomAudits']} axiom audits, exit0. Source SHA256 `{sha(b)}`; diagnostic SHA256 `{r['logSha256']}`. Before the serial run: {r['availableGiBBefore']}GiB available; elapsed {r['elapsedSeconds']}s; maximum RSS {r['maxRssKiB']}KiB.\n"
g=data('Graph.json');claim=data('ClaimReceipt.json');plan=data('Plan.json')
h=f'''# Global flat comparison of conductor ideals — checkpoint

Agent: Codex — codex-7e92bd. Refs #3378. The roadmap remains partial; every implementationStatus remains unchecked.

The exact existing conductor_global_flat_comparison header now has native proof evidence. For any finite schematically dominant f:Y→P and any flat q:T→P, the recomputed conductorIdealSheaf(pullback.snd f q) equals (conductorIdealSheaf f).comap q as native ideal-sheaf data. This retains full ideals and their nilpotents. No affine, Noetherian, reduced, separated, birational, faithful-flat or quasi-compact-target assumption is added.

The proof uses affine V in T lying over affine U in P. The map q need not be affine, and q⁻¹U need not be affine. Finiteness of f makes f⁻¹U affine. The native affine-section pushout identifies the four actual section maps; the previously proved finite-flat conductor formula transports through its actual comparison ring equivalence. The SF.0 affine ideal-pullback formula, restricted along the actual V→U map and transported by the two native topIso section maps, identifies the other side. Native ideal-sheaf extensionality on the cover of all such V proves the global equality.

Five new lemma nodes provide conductor_comap_pushout, conductorIdealSheaf_comap_chart, conductor_flat_chart, conductorSourceIdeal_flat and conductorIdealSheaf_flat_tower. The ring-pushout ideal equality needs only finiteness and flatness, without injectivity. The pulled-back chart formula needs no flatness; the recomputed chart formula does. The source-ideal equality uses the actual pullback square. The two-step theorem gives equality with pullback along the composite without identifying distinct scheme carriers silently. Generic ideal pullback and flat annihilator theory stays at SF.0; no new generic carrier is introduced.

Four API entries and eight typed examples extend the existing conductorIdealSheaf API. They check identity base change, base change of the identity morphism, the empty chart, actual affine restriction maps between refined charts, the source ideal for identity base change, a flat tower ending in open restriction, the zero ring, and the finite schematically dominant diagonal Spec(Z/4×Z/4)→Spec(Z/4). In the last example the actual global section corresponding to2 is nonzero and square-zero but remains outside the conductor after identity base change. A radical replacement would fail this test.

All721 incoming mathematical contracts are preserved;719 entire node objects are unchanged. The conductor ideal-sheaf node only gains appended API/tests. The existing global comparison node only gains appended prerequisites/proof steps; its statement and hypotheses are unchanged. The packet now has726 nodes,528 baseline declarations,450 raw API references and444 raw test references. All29 planets,18 gap records,23 requests,78 source routes,27 source findings and seven partial stages remain. The latest frontier records that the ideal-sheaf equality substep has native evidence; the broader retained gap records are not marked closed.

## Reading and provenance

The complete18717-character issue was read before and after bot{claim['confirmation']} confirmed exact claim{claim['claim']}; the two complete read partitions and body hash are in ClaimReceipt.json. WORKERS was freshly read, as were blueprint PROTOCOL sections0–5,9,12–15 and19. Earlier complete own expansion, upstream and remaining protocol reading is reused only within authenticated original scopes at unchanged controls. Own prior PR6060 manifest dde63f3028cfe79790175a6cbdc32d1bbd0ebb2902ed6151f9394641aa52f1d8 authenticates its Reading/InputGuard/Candidate and the nested own6047/6039 reading records. Of29 controls,23 are unchanged; the changed SF.0 packet and five issue deliverables are separately authenticated. Matching hashes do not enlarge personal reading scopes.

The full reviewed parentR11.1–R11.6 audit rows and reviewer metadata were freshly read; there is no separate PartII audit row. The complete reserved Ferrand node with its9API/7tests, relevant conductor target/ideal nodes and both SF.0 requests were freshly read. Original own coverage frontiers, requests, gaps and routes are structurally checked against the current packet. The two appendedG0 frontier paragraphs and the peer's additional historical00DF correction record were read as inherited records. No fresh whole721-node, inherited-reader or historical source audit is claimed. The complete link corpus was scanned for this PartII and its legacy id across links, overlaps and examined:zero matching entries. Reading.json records the bounded scopes.

Incoming peer PR6069, head1bbd3568bd0bf4667590372a7b0266a6898f21f0, was actually recovered over public HTTP:84 artifacts,10 helpers and five deliverables. Manifest27cf54017d315dbd01aa55059738f6017ec032b99de9d3c5cee521ba60ca0ab8 authenticates the exact three incoming Lean prefixes. Both actual original verifier executions reproduce their recorded reports byte-for-byte. The whole human handoff prefix and recovery/verification/immutable/graph helpers were read. Own6060 Native is the exact first8790 lines of the incoming9323-line Native; all533 added peer lines were freshly read, including the left/right quotient comparisons and generic flat-annihilator proof cone. Existing conductor affine, restriction and pre/postcomposition adapters used here were freshly read. Peer source-reading attribution is not transferred to this worker.

The current SF.0 supplier was actually recovered from own PR6070 headc45ace1a83295590226033ffbba993dcca1ef0bd and archive0c8fa79af1d24e9220bea3b873e009d70a781c22. Its69 artifacts,11 helpers and four deliverables match manifest91805b2d6c27eb515c25dc9d547e18c20338e069ee2bc16a1940fe678164095f. Both actual original verifier reports match byte-for-byte. The generic ideal pullback node objects and actual proof slice were freshly read. SupplierPrelude.lean is exactly native lines431–477 followed by namespace/section closures: ideal_comap_top, comap_restrict and ideal_restrict_top. The three unchanged generic proofs appear only in native evidence, with their own axiom audits; they are not replanned or pasted into the full suggested file. BaselineRanges.json and BaselineReading.json record the actual native statements and ambient binders read at the exact Mathlib pin. New exact names were absent in bounded pinned Mathlib/Tau and blueprint JSON searches; this is not a general online absence survey.

Fresh source reading comprises the entire displayed Stacks Lemma10.40.4 statement/proof, with no direct comments, and all of displayed Section26.17, including its definitions, five lemmas/proofs and eight direct comments. Linked section comments for07T8, historical versions, correction patches and linked proofs were not reread. Actual HTTP bytes, timestamps and hashes are in SourceReading.json. The conductor deduction is authored, importing the generic finite-flat annihilator and ideal-pullback results. All27 inherited findings remain whole with their original attribution. The verifier independently enumerates the inherited five-dimensional commutative block-matrix algebra overF2:32 elements and1024 products. No new source error is alleged.

## Validation

The final complete Native.lean preserves the entire authenticated incoming prefix and appends the exact supplier proof cone, five new lemmas, the exact existing global comparison proof, eight tests and nine axiom audits. The final replay has no errors, warnings or admissions; all607 audits use only propext, Classical.choice and Quot.sound. Sketch.lean preserves its complete authenticated Mathlib prefix and appends exactly matching admitted headers. The verifier compares each new and test header, and compares the existing global header directly against the inherited full suggested file. That existing header stays once in Canonical.lean; it is not duplicated by the new plan.

The complete Tau-dependent Canonical.lean/Suggested.lean remains UNCOMPILED. The fresh build probe records available Tau headcf386627e9176a3827c1a5fe804989fd94a4d216 instead of the requiredf790474821cf4256814db967cb154e7af3d0c369, and all five direct compiled Tau imports are absent. Pinned source trees and the exact declaration index were verified. No Lake setup, cache download, library build or language server was used. Each Lean check ran serially in the existing exact Mathlib build, with fresh available memory≥20GiB, one thread,8GiB limit and1200-second timeout. No Lean file was edited while a compiler ran. An initial explicit pushout-lemma argument mismatch and letI lint were corrected before the successful complete prototype and final replay.

'''+measurement('Native')+measurement('Sketch')+f'''
Suggested.lean equals Canonical.lean, SHA256 `{sha((S/'Canonical.lean').read_bytes())}`. Native and bounded admitted evidence do not certify that complete Tau-dependent file.

The actual indexed checker, source-issue checker, intake checks and atlas assembler run at immutable mathematical base `{txt('base.txt').strip()}` and publication base `{txt('publication-base.txt').strip()}`. All29 input guards and the queue's non-state contract are checked. Both actual verifier reports are retained. The verifier does not run Lean or create a repository snapshot.

The atlas stage DAG has{g['stageDAG']['vertices']} vertices/{g['stageDAG']['edges']} edges; the own declaration DAG has{g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']}; the scoped DAG has{g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']}. All are acyclic and all{g['requiredPairs']} required supplier paths are reachable. Entire foreign roadmaps/stages and every existing stage edge match the control. The{g['otherPreexistingMissingRestructurePairs']} unrelated preexisting missing restructure paths remain unchanged. No owned links are skipped or pending.

## Resume

Reuse the exact global ideal-sheaf equality and both source/tower equalities. Next build explicit native conductor subscheme comparison isomorphisms and verify the conductorMap projection squares and coherence through further base change. Native comapIso supplies the underlying closed-subscheme pullback comparison, but those conductor-specific maps are not proved here. Generic Ferrand algebraic-space existence and its scheme affine-neighborhood criterion remain separate. Retain the projective-line/Proj, properness/projectivity, coherent H0/H1/genus, separateI2, and later model/classification obligations, every supplier request, source route and reserved Ferrand/small-étale-site requirement. This checkpoint does not complete the roadmap.
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
assert len(old['nodes'])==721 and len(nodes)==len(p['nodes'])==726
assert [n['id']for n in p['nodes'][:721]]==[n['id']for n in old['nodes']]
assert p['nodes'][721:]==data('NewNodes.json')and [n['id']for n in p['nodes'][721:]]==plan['newNodes']
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
assert (len(p['requests']),len(p['gaps']),len(p['coverage']),len(p['routeCoverage']),len(p['sourceIssues']))==(23,18,7,78,27)
rd=data('Candidate-roadmap.json');rold=data('Incoming-roadmap.json')
assert rd['stages'][1:]==rold['stages'][1:]
assert {k:v for k,v in rd.items()if k!='stages'}=={k:v for k,v in rold.items()if k!='stages'}
assert {k:v for k,v in rd['stages'][0].items()if k!='description'}=={k:v for k,v in rold['stages'][0].items()if k!='description'}
assert rd['stages'][0]['description']==rold['stages'][0]['description']+' '+plan['frontier']
assert txt('Reader.md')==txt('ReaderAddition.md')+txt('IncomingReader.md')
for n in p['nodes'][721:]:assert n['statement']in txt('ReaderAddition.md')and n['declarationName']in txt('ReaderAddition.md')
for item in plan['newApi']+plan['newTests']:assert item['name']in txt('ReaderAddition.md')and item['statement']in txt('ReaderAddition.md')
assert len(plan['newApi'])==4 and len(plan['newTests'])==8
obj=nodes[RID+':G.0/conductor-ideal-sheaf'];previous=next(n for n in old['nodes']if n['id']==obj['id'])
assert obj['api']==previous['api']+plan['newApi'] and obj['tests']==previous['tests']+plan['newTests']
assert all(len(n['api'])>=3 and len(n['tests'])>=3 for n in data('NewNodes.json')if n['kind']=='construction')
from projection import admit_lemmas
assert txt('NewAdmitted.lean')==admit_lemmas(txt('NewProofs.lean'))
assert txt('TestsAdmitted.lean')==admit_lemmas(txt('NewTests.lean'))
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
nh=headers(txt('NewProofs.lean')+'\n'+txt('PostProofs.lean'));nt=headers(txt('NewTests.lean'))
assert nh==headers(txt('NewAdmitted.lean')+'\n'+txt('PostAdmitted.lean'))and nt==headers(txt('TestsAdmitted.lean'))and len(nh)==5 and len(nt)==8
assert txt('PostAdmitted.lean')==admit_lemmas(txt('PostProofs.lean'))
assert {n.rsplit('.',1)[-1]for n in plan['newNames']}==set(nh)
existing=['conductor_global_flat_comparison']
assert headers(txt('ExistingProofs.lean'))==headers(txt('ExistingAdmitted.lean'))
eh=headers(txt('ExistingProofs.lean'))
assert eh['conductor_global_flat_comparison']==headers(re.search(r'^theorem conductor_global_flat_comparison[\s\S]*? := by sorry',txt('CanonicalPrefix.lean'),re.M).group())['conductor_global_flat_comparison']
extra=txt('NewAdmitted.lean');prior=txt('CanonicalPrefix.lean')
assert txt('CanonicalAddition.lean')==extra+'\n'+txt('PostAdmitted.lean')+'\n'+txt('TestsAdmitted.lean')
assert txt('Canonical.lean')==txt('ImportAddition.lean')+prior+'\n'+txt('CanonicalAddition.lean')==txt('Suggested.lean')
assert txt('Native.lean')==txt('NativePrefix.lean')+'\n'+txt('SupplierPrelude.lean')+'\n'+txt('NewProofs.lean')+'\n'+txt('ExistingProofs.lean')+'\n'+txt('PostProofs.lean')+'\n'+txt('NewTests.lean')+'\n'+txt('Audits.lean')
assert txt('Sketch.lean')==txt('SketchPrefix.lean')+'\n'+txt('NewAdmitted.lean')+'\n'+txt('ExistingAdmitted.lean')+'\n'+txt('PostAdmitted.lean')+'\n'+txt('TestsAdmitted.lean')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',txt('Native.lean'))
assert {t['name']for t in plan['newTests']}==set(re.findall(r'^-- test: (.+)$',txt('NewTests.lean'),re.M))
assert txt('Incoming.lean')==prior
im=data('IncomingManifest.json');ir=data('PreviousRecovery.json')
assert ir['head']=='1bbd3568bd0bf4667590372a7b0266a6898f21f0'and ir['artifactsVerified']==84 and ir['archivedHelpersVerified']==10
assert sha((S/'IncomingManifest.json').read_bytes())=='27cf54017d315dbd01aa55059738f6017ec032b99de9d3c5cee521ba60ca0ab8'
for name,prefix in [('Native.lean','NativePrefix.lean'),('Sketch.lean','SketchPrefix.lean'),('Canonical.lean','CanonicalPrefix.lean')]:assert im[name]['sha256']==sha((S/prefix).read_bytes()),name
assert (S/'PreviousVerification.json').read_bytes()==(S/'IncomingPublicationVerification-replayed.json').read_bytes()
assert (S/'PreviousMathematicalVerification.json').read_bytes()==(S/'IncomingMathematicalVerification-replayed.json').read_bytes()
assert ir['publicHelperFencesVerified']==10
for path,n in zip(paths,['Incoming-roadmap.json','Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert ir['publicDeliverables'][path]==sha((S/n).read_bytes())

# Retain only authenticated personal prior reading scopes.
om=data('OwnPreviousManifest.json')
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='dde63f3028cfe79790175a6cbdc32d1bbd0ebb2902ed6151f9394641aa52f1d8'
for original,current in [('Reading.json','OwnPreviousReading.json'),('InputGuard.json','OwnPreviousInputGuard.json'),('Candidate.json','OwnPreviousCandidate.json'),('OwnPreviousManifest.json','OwnInherited6047Manifest.json'),('OwnPreviousReading.json','OwnInherited6047Reading.json'),('OwnPreviousInputGuard.json','OwnInherited6047InputGuard.json'),('OwnInheritedManifest.json','OwnInherited6039Manifest.json'),('OwnInheritedReading.json','OwnInherited6039Reading.json'),('OwnInheritedInputGuard.json','OwnInherited6039InputGuard.json')]:assert om[original]['sha256']==sha((S/current).read_bytes()),current
og={g['path']:g['sha256']for g in data('OwnPreviousInputGuard.json')}
reuse=data('OwnReadingReuse.json');assert len(reuse)==29 and sum(g['unchanged']for g in reuse)==23
for g in reuse:
 assert sha(blob(MATH,g['path']))==g['after']and og[g['path']]==g['before']
 assert g['unchanged']==(g['before']==g['after'])
own=data('OwnPreviousCandidate.json')
for k in ['requests','gaps','routeCoverage']:assert own[k]==old[k]
assert old['sourceIssues'][:-1]==own['sourceIssues']
for a,b in zip(own['coverage'],old['coverage']):
 assert {k:v for k,v in a.items()if k!='remaining'}=={k:v for k,v in b.items()if k!='remaining'}
 assert b['remaining'][:len(a['remaining'])]==a['remaining']
assert sha(''.join(txt('NativePrefix.lean').splitlines(keepends=True)[:8790]).encode())==om['Native.lean']['sha256']
assert txt('PeerSince6060.lean')==''.join(txt('NativePrefix.lean').splitlines(keepends=True)[8790:])
claim=data('ClaimReceipt.json');assert claim['issue']==3378 and claim['claim']==5979765642 and claim['confirmation']==5979767117
assert claim['wholeIssueCharacters']==18717 and claim['wholeReadsBeforeAndAfter']==[[0,16000],[16000,18717]]
assert claim['bodySha256']=='518055d3920b403fce956f8b1f50def5fd3e13ca01eb40f0cd42b734a9fca979'
assert txt('ImportAddition.lean')=='import Mathlib.AlgebraicGeometry.Morphisms.Flat\nimport Mathlib.Algebra.Category.Ring.Constructions\nimport Mathlib.Topology.Sets.OpenCover\n'
for tag,row in zip(['07T8','01JO'],data('SourceReading.json')):assert row['sha256']==sha((S/(tag+'.html')).read_bytes())
search=data('Search.json');assert search['names']==plan['newNames']and all(r['exitStatus']==1 and r['matches']==[]for r in search['searches'])
touch=data('TouchingLinks.json');assert touch==[]
for ref in [MATH,BASE]:
 for path in subprocess.check_output(['git','ls-tree','-r','--name-only',ref,'--','research/blueprint/links'],cwd=R,text=True).splitlines():
  if not path.endswith('.json'):continue
  link=json.loads(blob(ref,path))
  assert not [e for k in ['links','overlaps','examined']for e in link.get(k,[])if any(s in json.dumps(e)for s in [RID,'GenusOneFibrationsAndRationalEllipticSurfaces'])],path
assert sha(Path(sys.argv[2]).read_bytes())=='86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1'
sm=data('SupplierManifest.json');sr=data('SupplierRecovery.json')
assert sha((S/'SupplierManifest.json').read_bytes())=='91805b2d6c27eb515c25dc9d547e18c20338e069ee2bc16a1940fe678164095f'
assert sm['Native.lean']['sha256']==sha((S/'SupplierNative.lean').read_bytes())
assert sr['artifactsVerified']==69 and sr['archivedHelpersVerified']==11
assert sha((S/'SupplierRecoveryCode.txt').read_bytes())==sr['recoverySha256']=='b4e1452290c2989af683e9f5b3d1767bd0edda7a4aa71e46a48d7181c78d6bd7'
assert (S/'SupplierPublicationVerification.json').read_bytes()==(S/'SupplierOriginalVerification.json').read_bytes()
assert (S/'SupplierMathematicalVerification.json').read_bytes()==(S/'SupplierOriginalMathematicalVerification.json').read_bytes()
assert txt('SupplierPrelude.lean')==''.join(txt('SupplierNative.lean').splitlines(keepends=True)[430:477])+'\nend TauCeti.SchemeFoundations.IdealPullback\nend\n'
assert not re.search(r'\b(?:sorry|admit|axiom)\b',txt('SupplierPrelude.lean'))
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
for stem,ex,want,audits in [('Native',332,0,607),('Sketch',351,856,20)]:
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
print(json.dumps(dict(mathematicalBase=MATH,publicationBase=BASE,preservedContracts=721,preservedWholeNodes=719,changedExisting=changed,newNodes=5,newApi=4,newTests=8,newTestReferences=8,baselineDeclarations=len(p['baseline']['declarations']),rawApi=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),matchedNativeHeaders=5,matchedExistingHeaders=1,matchedExamples=8,checker=checker,compilation=comp,canonicalSha256=sha(txt('Canonical.lean').encode()),fullCanonicalCompiled=False,incomingArchiveAuthenticated=84,supplierArchiveAuthenticated=69,guardsUnchanged=len(data('InputGuard.json'))-len(changes),publicationGuardChanges=list(changes.values()),indexSha256=sha(Path(sys.argv[2]).read_bytes()),intakeProblems=problems,intakeRefusals=refusals,sourceIssueErrors=issues,sourceVersionScope='All27 inherited findings retained whole. Fresh07T8 displayed lemma/proof and complete displayed01JO section/proofs/eightcomments; linked history not read. Scheme conductor comparison is an authored deduction importing native section pushouts and SF0 ideal pullbacks. No new source finding.',graph=graph,LeanExecuted=False),indent=2))
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
NAMES='Incoming-roadmap.json Incoming.json IncomingReader.md Incoming.lean IncomingHandoff.md IncomingManifest.json IncomingNarrative.md\nIncomingPublicationVerification-replayed.json IncomingMathematicalVerification-replayed.json NativePrefix.lean SketchPrefix.lean CanonicalPrefix.lean PeerSince6060.lean\nNative.lean Native.log Native.receipt.json Sketch.lean Sketch.log Sketch.receipt.json Canonical.lean CanonicalAddition.lean ImportAddition.lean\nNewProofs.lean PostProofs.lean NewTests.lean NewAdmitted.lean PostAdmitted.lean TestsAdmitted.lean ExistingProofs.lean ExistingAdmitted.lean SupplierPrelude.lean Audits.lean\nCandidate-roadmap.json Candidate.json Reader.md ReaderAddition.md Suggested.lean Handoff.md HandoffBase.md\nClaimReceipt.json Reading.json SourceReading.json BaselineReading.json BaselineRanges.json OwnReadingReuse.json\nOwnPreviousReading.json OwnPreviousInputGuard.json OwnPreviousManifest.json OwnPreviousCandidate.json\nOwnInherited6047Manifest.json OwnInherited6047Reading.json OwnInherited6047InputGuard.json OwnInherited6039Manifest.json OwnInherited6039Reading.json OwnInherited6039InputGuard.json\nInputGuard.json PublicationChanges.json TouchingLinks.json Plan.json NewNodes.json PreviousHead.txt PreviousRecovery.json PreviousVerification.json PreviousMathematicalVerification.json Verification-mathematical.json Verification.json\nSupplierManifest.json SupplierNative.lean SupplierRecovery.json SupplierPublicationVerification.json SupplierMathematicalVerification.json SupplierOriginalVerification.json SupplierOriginalMathematicalVerification.json SupplierRecoveryCode.txt\nSourceGapCounterexample.json Search.json TauBuildScope.json Graph.json base.txt publication-base.txt 07T8.html 01JO.html\nassemble.py author.py projection.py write_handoff.py verify.py graph.py immutable.py compile.py runcheck.py package.py'.split()
if mode=='archive':
 meta={n:dict(sha256=sha((S/n).read_bytes()),bytes=len((S/n).read_bytes()),lines=len((S/n).read_bytes().splitlines()))for n in NAMES}
 mb=(json.dumps(meta,indent=2,sort_keys=True)+'\n').encode();(S/'artifact-manifest.json').write_bytes(mb)
 payload={n:dict(sha256=sha((S/n).read_bytes()),data=base64.b64encode(zlib.compress((S/n).read_bytes(),9)).decode())for n in NAMES+['artifact-manifest.json']}
 pb=(json.dumps(payload,sort_keys=True,separators=(',',':'))+'\n').encode();(S/'payload.json').write_bytes(pb)
 report=dict(artifacts=len(NAMES),helpers=sum(n.endswith('.py')for n in NAMES),manifestSha256=sha(mb),payloadSha256=sha(pb))
 (S/'package.json').write_text(json.dumps(report,indent=2)+'\n')
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED GLOBAL FLAT CONDUCTOR IDEAL PAYLOAD\n'+pb+b'END ARCHIVED GLOBAL FLAT CONDUCTOR IDEAL PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('roadmaps','Candidate-roadmap.json'),('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated global flat conductor ideal evidence; never executes Lean."""
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
pb=raw.split('/- BEGIN ARCHIVED GLOBAL FLAT CONDUCTOR IDEAL PAYLOAD\\n',1)[1].split('END ARCHIVED GLOBAL FLAT CONDUCTOR IDEAL PAYLOAD -/',1)[0].encode()
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
"""Recover public authenticated global flat conductor ideal evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='NeronModelsAndSemistableAbelianVarietiesPartII'
ARCHIVE='9fbc1ff9306d9d508fc30a7350e6e16b765a54d4'
MANIFEST_SHA='b03e012b0c6da09c4a21226432834345c4dad560972031c235f2c5934529d651'
PAYLOAD_SHA='c853e54200a6b607fb6ef1f9c439b17f31e3bfaab1553ac789006052bba17f1e'
EXPECTED={'roadmaps': '2420a4bc8164a43915c500e994dfab18bbd1106f8a56eb9dd8d5dbd5aaa28864', 'packets': '873dcb98ce17587fa39af07e2646941c9296eaf4c873fcb3fd3539b40dbff679', 'readmes': 'a98edb3d75b4b1d80f7cbf6103e70f430f8d36c1501febd907ab81d6471467cc', 'suggested': '2df202c73c42d2a19fa69223c8d95abe4c235cfb162d86403bf667d1d2a6a237'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED GLOBAL FLAT CONDUCTOR IDEAL PAYLOAD\n',1)[1].split('END ARCHIVED GLOBAL FLAT CONDUCTOR IDEAL PAYLOAD -/',1)[0].encode()
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
