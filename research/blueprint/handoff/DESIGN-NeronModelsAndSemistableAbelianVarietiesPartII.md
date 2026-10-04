# Target conductor coherence for successive flat base changes — checkpoint

Agent: Codex — codex-7e92bd. Refs #3378. This roadmap remains partial; every implementationStatus is unchecked.

For finite schematically dominant f:Y→P and flat q:T→P, r:Z→T, write C_g for the native closed subscheme defined by the full conductor ideal and e_(g,a) for the existing target base-change isomorphism. The first new construction t identifies the twice-recomputed target conductor C_((f_q)_r) with the direct one C_(f_(r∘q)). Both are closed in Z and their full ideal data equal the pullback of I_f along r∘q. Transport the actual subscheme carrier along this equality. Forward and inverse inclusion equations hold, and the forward map is uniquely characterized by its closed-inclusion equation.

The second construction h identifies the native pullback of r and the inclusion of C_(f_q) with the pullback of r∘q and the inclusion of C_f. Use native pullback.map with identities on Z and T and the actual e_(f,q), then native pullbackRightPullbackFstIso. The existing first-projection formula supplies the defining commutative square. All three components are isomorphisms. The forward and inverse projection formulas retain the intermediate comparison in the map to C_f.

The whole scheme isomorphism e_(f_q,r) followed by h equals t followed by e_(f,r∘q). Native Iso.ext reduces this to the forward maps; cancel the direct pullback first projection, which is monic because the old conductor inclusion is monic. Both composites with it equal the twice-recomputed inclusion. Inverse-map equality follows by congruence on the inverse field. Postcomposition with the actual second projection gives equality of the two induced morphisms to C_f. This establishes target-side two-step coherence on actual scheme carriers. Source-carrier tower coherence and three-step coherence remain required.

No reduced, Noetherian, affine, separated, birational, faithfully-flat or nonempty hypothesis is added. The full ideals retain nilpotents. Generic pullbacks, ideal-sheaf carriers, equality transport and pasting are imported from the pinned library or existing SF.0 contracts; no duplicate generic carrier is planned. Eight proved typed examples check carrier roundtrips/inclusions, uniqueness of the whole carrier isomorphism, both inverse pullback projections, the whole inverse comparison, the actual conductorMap followed by the target comparison, identity bases, nested open restrictions without affineness and Spec(Z/1).

The checkpoint adds12 declaration-sized nodes:2 constructions and10 lemmas,13 API references and13 references to8 distinct typed examples. Each construction has at least three API items and six tests with explicit consumers. All739 incoming node objects and530 baseline entries are retained whole. The packet has751 nodes,536 baseline declarations,471 raw API entries and470 raw test references. All29 planets,18 gap records,23 requests,78 source routes,27 source findings and seven partial stages are unchanged. Only the current G0 frontier and stage description are extended. No broad gap is marked closed.

## Reading and authentication

The complete18717-character issue was read before and after bot5981815218 confirmed claim5981814197. ClaimReceipt records exact partitions and body hash. The whole WORKERS was freshly reread. Original complete protocol, expansion and upstream reading scopes remain bound to the authenticated own6072→6060→6047/6039 records and unchanged control bytes. A truncated fresh protocol output is not counted as a fresh whole reading. OwnReadingReuse compares29 controls:23 unchanged; five changed deliverables are authenticated via incoming6077, and the changed SF.0 supplier packet is byte-identical to own6078. Original personal reading scopes are reused without enlarging them.

Fresh reading includes all complete reviewed parent R11.1–R11.6 audit objects and metadata, and the whole172-line REV-AUDIT-10. There is no separate PartII audit row. The full reserved Ferrand key node, conductorIdealSheaf node, both source/target comparison construction nodes, both SF.0 requests, last three G0 frontier paragraphs and then the whole current G0 stage object were read. All touching-link entry collections were scanned under both this PartII id and the legacy id:zero matches. No fresh manual audit of all739 nodes, the entire inherited reader or all source papers is claimed.

Incoming peer PR6077 at headb6e7fd87ac2c8fd40eb16dcd6fdca31ddbbbae71 was recovered over public HTTP:77 artifacts,10 helpers and5 deliverables. Manifest6a2c918330e685570860408a7986dfac11147e73fa884d1736ea7de7b4d92249 binds all three incoming Lean prefixes. Both actual immutable verifier executions reproduce the archived reports byte-for-byte. The inherited handoff first15500 characters and all ten consumed helpers were read, as were all12 incoming new declarations, all8 test bodies and the failed-test receipt. Native ranges9290–9335 and9400–9492 were freshly read. The full9828-line incoming native prefix was authenticated and replayed, without claiming a new whole-file manual reading. All726 own6072 node objects and528 baseline prefix entries remain exactly present in the incoming packet.

Own6072 manifestb03e012b0c6da09c4a21226432834345c4dad560972031c235f2c5934529d651 authenticates the original personal reading chain. Own6078 supplier manifest1980d44ac5e336f07861ecbdeedbfd910785a8947ae35a082c073efa40c8a186 authenticates the exact current176-node SF.0 packet and its personal reading record, which was reread. The consumed flat-annihilator, ideal-comap-top and ideal-restrict-top node identities remain supplied. No new direct supplier HTTP recovery or independent peer review is claimed in this job.

BaselineReading and BaselineRanges record exact current statements and ambient binders at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174: native pullback.map/map_isIso, actual right/left pasting APIs, eqToIso, asIso, Iso.ext, pullback of a monomorphism and the actual subscheme inclusion. The whole227-line IdealSheaf/Functorial module and bounded additional ranges were read. Exact specialized-name searches in pinned Mathlib, pinned TauCeti and existing blueprint JSON found no existing tower declarations. This is scoped name evidence, not an exhaustive absence survey.

Fresh source reading covers the whole displayed Stacks Section26.17, both definitions, all five lemma statements/proofs/diagrams and eight direct comments. It also covers the whole displayed Proposition37.67.3 statement/proof and its zero direct comments. Actual HTTP bytes, timestamps and hashes are archived. Linked Situation37.67.1, six section-level comments, historical patches and recursive linked proofs were not freshly read. The tower statements are authored deductions from the authenticated conductor comparisons and native pasting APIs. The displayed pushout/fibre-product notation slip is already recorded in inherited E7e92bd0E25; no duplicate finding or new correction-history claim is added. All27 findings retain their original attribution. The actual verifier independently enumerates the inherited five-dimensional commutative block-matrix algebra overF2:32 elements and1024 products.

## Validation and remaining proof limitation

The final entire Native.lean retains the authenticated9828-line prefix and appends12 proved declarations,8 proved examples and12 audits. Its631 axiom audits contain only propext, Classical.choice and Quot.sound; there are no errors, warnings or admissions. The complete admitted Sketch.lean retains its authenticated prefix and appends exactly matching declaration/example headers, with892 admission warnings as its only warnings. Both new constructions retain their actual definitions. The verifier checks exact header agreement, prefix hashes and all compiler receipts.

The incoming ConductorSubschemeChecked.nonreduced_conductor_section statement remains admitted-only evidence. A retry preserving its actual recomputed conductor and inverse-comparison section map, with a finite2400000-heartbeat option and the same1200-second/8GiB external bounds, still failed kernel checking after271.6seconds. FailedRecovery.lean/log/receipt preserve this actual failure; Context.lean/log/receipt bind the successful imported prefix, and RecoveredTest.lean holds the attempted test. The final successful Native prefix continues to omit that previously omitted example; it is not counted among the new8 proofs. Do not infer kernel success from elaboration or other clean declaration audits.

The full Tau-importing Canonical.lean/Suggested.lean remains UNCOMPILED. Fresh TauBuildScope records the required clean sourcef790474821cf4256814db967cb154e7af3d0c369, available buildcf386627e9176a3827c1a5fe804989fd94a4d216, and all five direct compiled Tau imports absent. The Mathlib native/sketch checks do not certify that whole file. No Lake project/setup/cache/build or language server was used. Each Lean process ran serially after a fresh20GiB guard, with one thread,8GiB memory and1200-second timeout. No Lean source edits or rebase occurred while its compiler ran. A full-file universe-name collision found after the isolated test was corrected before the final complete replay.

- Native.lean: 10061 lines, 347 examples, 0 warnings, 631 axiom audits, exit0. Source SHA256 `2696ce862b122625fe3f8910d6316e5c47d648798717d1267b8677ee62cbb69e`; diagnostic SHA256 `456ef4bd41a1caa8fba319688558344347fa4ba87889be0c39d1ed9834cde9d8`. Fresh available memory 41GiB; elapsed 130.33s; maximum RSS 7281580KiB.
- Sketch.lean: 6495 lines, 367 examples, 892 warnings, 20 axiom audits, exit0. Source SHA256 `852c5e5b1cebabacfd23fef2b72c81acf213d63604d3711cf70bf5275313e43d`; diagnostic SHA256 `f1a68483726c551e482fde9045d11dfd7adbdffbb5d682f42d1f79ca17cf8357`. Fresh available memory 41GiB; elapsed 87.8s; maximum RSS 7093148KiB.

Suggested.lean equals Canonical.lean; SHA256 `e0436fcc9aedad00cd05a414173249e8e64fb35e602cd327c7157a30c5dd901f`.

The actual indexed blueprint checker, source/errata validation, intake and atlas assembler run against mathematical base `814090e8fe8c4f0b44a1949ae939ced812e4103a` and publication base `748bea7490e639705cc48d991970c06719257f37`. Both reports are archived. All29 guards and the queue's non-state contract are checked; any publication refresh has explicit scope in PublicationChanges. The verifier never executes Lean or creates a repository snapshot.

The stage DAG has3043 vertices/8727 edges, own declaration DAG751/1745, and scoped DAG3772/11426. All are acyclic; all69 required supplier pairs are reachable. Whole foreign roadmaps/stages and every existing stage edge match the control. The45 unrelated preexisting missing restructure paths are unchanged. There are no skipped or pending owned links.

## Resume

Use the named target tower carrier and native pullback-flattening isomorphisms, their whole coherence equality, inverse and old-conductor morphism formulas. Construct the source-carrier tower comparison along the actual ambient pullbackLeftPullbackSndIso, prove compatibility with the actual conductorMap, then establish three-step coherence and transport the geometric conductor pushout predicate. Obtain a kernel-checked proof of the retained nonreduced_conductor_section statement without weakening it. Generic Ferrand algebraic-space existence, the scheme affine-neighborhood criterion, small étale structure sheaves, projective/Proj and properness work, coherent H0/H1/genus, separateI2 and later model/classification obligations remain required. All retained requests and source routes remain. This is a partial checkpoint, not completion of the roadmap.

## Public recovery and replay

Archive commit `8c6750e634f90601a16b9d4d064d3411904b1a70` is an ancestor changing only this issue's suggested file. Its 90 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `0ea223760b6800c275237cc9dc51952f8f8bb94600a39ca5a3be040df3125225`; payload SHA256 `028f6204e1394f9d5ffebf1ea26b86785aa4ff989d26a2e3e3c34b7a737c8cf4`. The final suggested file has no archive payload and equals Canonical.lean, whose full Tau-importing file remains UNCOMPILED.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count and all ten exact public helper fences, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set NERON_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Sketch.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. The full Tau-importing Canonical.lean/Suggested.lean is not covered by these checks and remains UNCOMPILED. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Helper: assemble.py

```python
"""Append exact conductor tower proofs and header-identical admitted projections."""
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
(S/'Native.lean').write_text(txt('NativePrefix.lean')+'\n'+txt('NewProofs.lean')+'\n'+txt('NewTests.lean')+'\n'+audits)
(S/'Sketch.lean').write_text(txt('SketchPrefix.lean')+'\n'+admitted)
(S/'Canonical.lean').write_text(txt('CanonicalPrefix.lean')+'\n'+admitted)
(S/'Suggested.lean').write_text(txt('Canonical.lean'))
```

## Helper: author.py

```python
"""Append conductor-specific two-step target coherence; preserve every incoming contract."""
from pathlib import Path
import copy,csv,json,re,sys
S=Path(__file__).resolve().parent;RID='NeronModelsAndSemistableAbelianVarietiesPartII';P=RID+':G.0/';NS='TauCeti.GenusOne.FerrandPushout.'
load=lambda n:json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
old=load('Incoming.json');p=copy.deepcopy(old);road=load('Incoming-roadmap.json')
existing={n.get('declarationName','').removeprefix(NS):n['id']for n in old['nodes']}
specs=[
('conductor-target-tower-iso','conductorTargetTowerIso','construction','The target conductor carrier comparison for a flat tower','For finite schematically dominant f:Y→P and flat q:T→P, r:Z→T, construct the actual scheme isomorphism t from the target conductor subscheme of (f_q)_r to the target conductor subscheme of f_(r∘q), both closed in Z. Here f_q is the native second projection of the pullback of f and q.',['conductorIdealSheaf_flat_tower','conductor_global_flat_comparison','mathlib:CategoryTheory.eqToIso'],'Both full conductor ideal-sheaf data equal the pullback of I_f along r∘q. Compose those equalities, apply the native subscheme constructor and use eqToIso. Retain the full ideals, without radicalization.'),
('conductor-target-tower-hom-inclusion','conductorTargetTowerIso_hom_inclusion','lemma','The tower comparison preserves the actual inclusion','The forward carrier comparison t.hom followed by the direct recomputed target conductor inclusion into Z equals the twice-recomputed target conductor inclusion into Z.',['conductorTargetTowerIso'],'Eliminate the equality of full ideal data used by t; the transported closed inclusion becomes the original inclusion.'),
('conductor-target-tower-inv-inclusion','conductorTargetTowerIso_inv_inclusion','lemma','The inverse tower comparison preserves the inclusion','The inverse carrier comparison t.inv followed by the twice-recomputed target conductor inclusion equals the direct recomputed target conductor inclusion.',['conductorTargetTowerIso_hom_inclusion'],'Rewrite the twice-recomputed inclusion using the forward formula and cancel the inverse-forward pair.'),
('conductor-target-tower-unique','conductorTargetTowerIso_unique','lemma','The tower carrier map is determined by its inclusion','Every actual morphism from the twice-recomputed target conductor subscheme to the direct recomputed one whose composite with the direct closed inclusion is the twice-recomputed inclusion equals t.hom.',['conductorTargetTowerIso_hom_inclusion','mathlib:AlgebraicGeometry.Scheme.IdealSheafData.subschemeι'],'Cancel the native monomorphism given by the direct closed-subscheme inclusion; use the proved forward inclusion equation.'),
('conductor-target-pullback-tower-iso','conductorTargetPullbackTowerIso','construction','Flattening successive target conductor pullbacks','Construct the actual scheme isomorphism h from the native pullback of r and the recomputed conductor inclusion i_(f_q) to the native pullback of r∘q and i_f. First use native pullback.map induced by identities on Z,T and the actual conductorTargetBaseChangeIso(f,q), then the native right pullback-pasting isomorphism.',['conductorTargetBaseChangeIso','conductorTargetBaseChangeIso_hom_fst','mathlib:CategoryTheory.Limits.pullback.map','mathlib:CategoryTheory.Limits.pullback.map_isIso','mathlib:CategoryTheory.asIso','mathlib:CategoryTheory.Limits.pullbackRightPullbackFstIso'],'The existing target comparison identifies i_(f_q) with the first projection of the pullback of q and i_f. Thus the native map has three isomorphism components and is an isomorphism. Compose its asIso with native pullbackRightPullbackFstIso; no generic pullback carrier is introduced.'),
('conductor-target-pullback-tower-hom-fst','conductorTargetPullbackTowerIso_hom_fst','lemma','Flattening preserves the projection to the last base','The forward flattening h.hom followed by the direct pullback first projection to Z equals the iterated pullback first projection to Z.',['conductorTargetPullbackTowerIso','mathlib:CategoryTheory.Limits.pullbackRightPullbackFstIso_hom_fst'],'Use the native pasting first-projection formula and the first-projection computation of pullback.map with its identity component on Z.'),
('conductor-target-pullback-tower-hom-snd','conductorTargetPullbackTowerIso_hom_snd','lemma','Flattening preserves the projection to the old conductor','The forward flattening h.hom followed by the direct second projection to C_f equals the successive composite: second projection to C_(f_q), forward conductorTargetBaseChangeIso(f,q), and second projection to C_f.',['conductorTargetPullbackTowerIso','mathlib:CategoryTheory.Limits.pullbackRightPullbackFstIso_hom_snd'],'Compute the second projection using the native pasting formula and pullback.map second projection. Keep the actual intermediate target comparison in the composite.'),
('conductor-target-pullback-tower-inv-fst','conductorTargetPullbackTowerIso_inv_fst','lemma','Inverse flattening preserves the last-base projection','The inverse flattening h.inv followed by the iterated first projection to Z equals the direct first projection.',['conductorTargetPullbackTowerIso_hom_fst'],'Precompose the forward first-projection identity with h.inv and cancel the inverse-forward pair.'),
('conductor-target-pullback-tower-inv-snd','conductorTargetPullbackTowerIso_inv_snd','lemma','Inverse flattening preserves the old-conductor projection','The inverse flattening h.inv followed by the successive old-conductor projection through C_(f_q) and conductorTargetBaseChangeIso(f,q) equals the direct second projection to C_f.',['conductorTargetPullbackTowerIso_hom_snd'],'Precompose the full forward second-projection identity with h.inv; reassociate and cancel.'),
('conductor-target-base-change-tower','conductorTargetBaseChangeIso_tower','lemma','Successive and direct target conductor comparisons agree','As whole native scheme isomorphisms, e_(f_q,r) followed by h equals t followed by e_(f,r∘q), where e is the existing conductorTargetBaseChangeIso. All four corners are the actual recomputed conductor subschemes or native scheme pullbacks.',['conductorTargetTowerIso_hom_inclusion','conductorTargetPullbackTowerIso_hom_fst','conductorTargetBaseChangeIso_hom_fst','mathlib:CategoryTheory.Iso.ext','mathlib:CategoryTheory.Limits.pullback.fst_of_mono'],'Use native Iso.ext. Cancel the first projection of the direct pullback, which is monic because the old conductor inclusion is monic. Both composites with it equal the twice-recomputed closed inclusion by the three listed projection identities.'),
('conductor-target-base-change-tower-inverse','conductorTargetBaseChangeIso_tower_inverse','lemma','The inverse successive and direct comparisons agree','The composite h.inv followed by e_(f_q,r).inv equals e_(f,r∘q).inv followed by t.inv, as actual scheme morphisms between the specified carriers.',['conductorTargetBaseChangeIso_tower'],'Apply congruence to the inverse field of the proved whole-isomorphism equality; the composite inverse has the indicated reversed order.'),
('conductor-target-base-change-tower-snd','conductorTargetBaseChangeIso_tower_snd','lemma','Both tower routes induce the same old-conductor morphism','The morphism from C_((f_q)_r) to C_f obtained by e_(f_q,r), the intermediate second projection, e_(f,q) and its second projection equals the route through t, e_(f,r∘q) and the direct second projection.',['conductorTargetBaseChangeIso_tower','conductorTargetPullbackTowerIso_hom_snd'],'Postcompose the whole-isomorphism equality with the direct second projection, then substitute the actual flattening second-projection formula.')]
ids={name:P+slug for slug,name,*_ in specs};nodes=[];sid='ConductorTargetTower-codex-7e92bd';src=load('SourceReading.json')[0]
common=['Schemes in a common universe; f:Y→P finite and schematically dominant; q:T→P and r:Z→T flat. Native base-change and composition instances supply the required hypotheses.','C_g denotes the native closed subscheme of the full conductorIdealSheaf(g); i_g is its actual closed inclusion. e_(g,a) is the existing conductorTargetBaseChangeIso(g,a). Composition is written in traversal order in the declarations.','No affine, Noetherian, reduced, separated, birational, faithfully-flat or nonempty assumption is added. These are target-conductor comparisons; source-carrier tower coherence and three-step coherence remain distinct obligations.']
for slug,name,kind,title,statement,deps,proof in specs:
 nodes.append(dict(id=ids[name],parentStageId=RID+':G.0',realises=[RID+':G.0'],kind=kind,title=title,declarationName=NS+name,statement=statement,hypotheses=common,prerequisites=[d if ':'in d else ids[d]if d in ids else existing[d]for d in deps],proofSteps=[proof],acceptance=[statement,'Use actual native recomputed conductor carriers and inclusions; do not replace a whole-isomorphism equality by an ideal equality alone.'],library=dict(module='TauCeti/AlgebraicGeometry/GenusOne/G0',namespace=NS[:-1]),sources=[dict(sourceId=sid,locator='Section26.17 Definition26.17.1 and Lemma26.17.6(1); authored conductor-specific two-step comparison',excerpt='fibre product',match='The section supplies the universal-property and closed-subscheme context. The exact tower isomorphisms and coherence identities are authored deductions from the retained conductor ideal/comparison contracts and pinned native pullback-pasting APIs, not statements attributed verbatim to Stacks.')],api=[],tests=[],implementationStatus='unchecked'))
by={n['declarationName'].removeprefix(NS):n for n in nodes}
apis={'conductorTargetTowerIso':['conductorTargetTowerIso_hom_inclusion','conductorTargetTowerIso_inv_inclusion','conductorTargetTowerIso_unique','conductorTargetBaseChangeIso_tower','conductorTargetBaseChangeIso_tower_inverse','conductorTargetBaseChangeIso_tower_snd'],'conductorTargetPullbackTowerIso':['conductorTargetPullbackTowerIso_hom_fst','conductorTargetPullbackTowerIso_hom_snd','conductorTargetPullbackTowerIso_inv_fst','conductorTargetPullbackTowerIso_inv_snd','conductorTargetBaseChangeIso_tower','conductorTargetBaseChangeIso_tower_inverse','conductorTargetBaseChangeIso_tower_snd']}
testdata=[('carrier_inclusions','compatibility','The actual carrier comparison has its native roundtrip and the inverse preserves the full twice-recomputed closed inclusion.'),('uniqueness','compatibility','Every scheme isomorphism between the specified recomputed conductor carriers preserving the inclusion equals the constructed tower isomorphism as a whole isomorphism.'),('native_pullback_projections','compatibility','The inverse native pullback flattening preserves both the last-base projection and the full successive projection to the original conductor.'),('whole_inverse','compatibility','The inverses of the successive and direct composite comparison isomorphisms are equal as whole native isomorphisms.'),('actual_conductor_map','compatibility','After precomposition with the actual conductorMap of the twice-base-changed finite morphism, the successive and direct maps to the old target conductor agree. This does not assert source-carrier tower coherence.'),('identity_base','degenerate','Two identity base changes satisfy the whole tower comparison on the actual native pullback carriers; no definitional identification of these carriers with the original one is assumed.'),('nested_open_restriction','compatibility','For any open U of P and any open V of U, without either being affine, the successive restriction comparison equals the direct comparison along V→U→P after the specified carrier isomorphisms.'),('zero_ring','degenerate','Over Spec(Z/1), both actual conductor carrier and native pullback flattening isomorphisms have the native forward-inverse roundtrip, without a point or nontriviality hypothesis.')]
tests=[dict(name='ConductorTowerChecked.'+a,kind=b,statement=c)for a,b,c in testdata];tb={a:t for (a,*_),t in zip(testdata,tests)}
sets={'conductorTargetTowerIso':['carrier_inclusions','uniqueness','whole_inverse','actual_conductor_map','identity_base','nested_open_restriction','zero_ring'],'conductorTargetPullbackTowerIso':['native_pullback_projections','whole_inverse','actual_conductor_map','identity_base','nested_open_restriction','zero_ring']}
for name,entries in apis.items():
 by[name]['api']=[dict(name=NS+x,role='compatibility',statement=by[x]['statement'])for x in entries];by[name]['tests']=[tb[x]for x in sets[name]]
 by[name]['uses']=[dict(where=ids['conductorTargetBaseChangeIso_tower'],how='Compare the actual two-step and direct target conductor isomorphisms with named native carriers.'),dict(where=RID+':key/ferrand-pushouts',how='Supply the target-side coherence required for conductor square transport under iterated flat base change; the source side remains a separate obligation.')]
p['nodes']+=nodes
rows=list(csv.reader(Path(sys.argv[1]).open(),delimiter='\t'));have={x['ref']for x in p['baseline']['declarations']};baseline=[];reading=[]
for name in sorted({x.removeprefix('mathlib:')for n in nodes for x in n['prerequisites']if x.startswith('mathlib:')}):
 row=next(r for r in rows if len(r)>5 and r[0]=='mathlib'and r[1]==name);reading.append(dict(name=name,file=row[3],line=int(row[4]),signature=row[5],scope='Exact statement and ambient hypotheses read at the pin; source ranges and hashes in BaselineRanges.json.'))
 if 'mathlib:'+name not in have:baseline.append(dict(ref='mathlib:'+name,kind=row[2],module=row[3],line=int(row[4]),provides=row[5]+' Native carrier/projection API for the conductor-specific tower.',checked='Codex — codex-7e92bd read the exact statement at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 on2026-10-04.'))
p['baseline']['declarations']+=baseline;save('BaselineReading.json',reading)
source=dict(id=sid,title='Scheme fibre products and authored target conductor tower coherence',authors='The Stacks Project authors; conductor specialization by Codex — codex-7e92bd',edition='Current displayed Section26.17, accessed4October2026',url=src['url'],sha256=src['sha256'],accessed=src['accessed'][:10],readSections=[src['scope']]);p['sources'].append(source)
frontier='Two actual conductor-specific isomorphisms now identify the twice-recomputed target conductor carrier with the direct one and flatten the intermediate native target conductor pullback. Ten lemmas give forward/inverse projection laws, uniqueness by the closed inclusion, equality of the whole successive and direct comparison isomorphisms, the inverse equality and the induced map to the old conductor. Eight proved typed examples include nested nonaffine open restrictions, identity base changes and the zero ring. All739 incoming node objects and530 baseline entries are retained. Target-side two-step coherence is supplied; source-carrier tower coherence, three-step coherence and geometric conductor pushout transport remain required, as do generic Ferrand algebraic-space existence, the scheme affine-neighborhood criterion, projective/cohomological work, separateI2 and the other model/classification obligations. The incoming nonreduced_conductor_section has admitted typing evidence only: its attempted native proof again hit a kernel timeout, so no new proof certificate is claimed for it. All18 gaps,23 requests,78 routes,27 findings and seven partial stages remain; implementations stay unchecked and the whole Tau-dependent suggested file is UNCOMPILED.'
p['summary']+=' Target conductor tower continuation:12 nodes (2 constructions,10 lemmas),13 API references and13 references to8 distinct proved typed examples; all739 incoming node objects unchanged.'
next(x for x in p['coverage']if x['stageId']==RID+':G.0')['remaining'].append(frontier);next(x for x in road['stages']if x['key']=='G.0')['description']+=' '+frontier
plan=dict(newNames=[n['declarationName']for n in nodes],newNodes=[n['id']for n in nodes],newApi=[a for n in nodes for a in n['api']],newTests=tests,newTestReferences=sum(map(len,sets.values())),newBaseline=baseline,newSources=[source],newSourceIssues=[],newGaps=[],changedExisting={},existingNativeNames=[],frontier=frontier)
for n,x in [('Candidate.json',p),(RID+'.json',p),('Candidate-roadmap.json',road),('NewNodes.json',nodes),('Plan.json',plan)]:save(n,x)
intro='''# Target conductor coherence for successive flat base changes

Let f:Y→P be finite and schematically dominant, q:T→P flat and r:Z→T flat. Write C_g for the closed subscheme defined by the full conductor ideal of g, and e_(g,a) for the existing actual target base-change comparison. The twice-recomputed conductor and the directly recomputed conductor are closed in the same scheme Z. Their full ideal data are equal by the proved conductor tower identity. The first construction t transports their actual closed-subscheme carriers along this equality. It preserves the inclusion in both directions and is uniquely characterized by the forward inclusion equation.

The second construction h maps the native pullback of r and the inclusion of C_(f_q) to the pullback of r∘q and the inclusion of C_f. It uses the actual e_(f,q) through native pullback.map, followed by the native right pullback-pasting isomorphism. Both forward and inverse projection formulas retain the intermediate comparison in the map to C_f. The whole isomorphism e_(f_q,r) followed by h equals t followed by e_(f,r∘q). Canceling the monic projection to Z proves this equality; the inverse equation and the equality of both actual maps to C_f follow. This is an equality of the actual scheme isomorphisms, not only an equality of ideals.

Both new constructions have at least three API items and tests with explicit consumers. Eight proved examples cover the two carrier roundtrips, uniqueness, the whole inverse comparison, both inverse projections, the actual conductor map followed by the target comparison, identity bases, nested open restrictions and Spec(Z/1). No reducedness, Noetherianity, affine-open condition, faithful flatness or nonemptiness is imposed. Generic scheme pullbacks and ideal-sheaf constructions remain native or SF.0 imports.

The incoming nonreduced_conductor_section retains its exact typed statement, but its attempted native proof still times out in kernel checking. The final successful native file omits that single previously omitted test. No nilpotent-test recovery is claimed here. Source-carrier tower coherence, three-step coherence and geometric conductor pushout transport remain required. Every incoming node object, request, gap, source finding, route and planet is preserved. The full Tau-importing suggested file remains UNCOMPILED.

'''
parts=[intro,frontier+'\n\n']
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
"""Write measured target conductor tower scope and reproducible provenance."""
from pathlib import Path
import hashlib,json,re
S=Path(__file__).resolve().parent
txt=lambda n:(S/n).read_text()
data=lambda n:json.loads(txt(n))
sha=lambda b:hashlib.sha256(b).hexdigest()
def measurement(stem):
 r=data(stem+'.receipt.json');b=(S/(stem+'.lean')).read_bytes();assert r['exitStatus']==0
 return f"- {stem}.lean: {len(b.splitlines())} lines, {len(re.findall(r'^example\b',b.decode(),re.M))} examples, {r['warnings']} warnings, {r['axiomAudits']} axiom audits, exit0. Source SHA256 `{sha(b)}`; diagnostic SHA256 `{r['logSha256']}`. Fresh available memory {r['availableGiBBefore']}GiB; elapsed {r['elapsedSeconds']}s; maximum RSS {r['maxRssKiB']}KiB.\n"
g=data('Graph.json');c=data('ClaimReceipt.json');plan=data('Plan.json')
h=f'''# Target conductor coherence for successive flat base changes — checkpoint

Agent: Codex — codex-7e92bd. Refs #3378. This roadmap remains partial; every implementationStatus is unchecked.

For finite schematically dominant f:Y→P and flat q:T→P, r:Z→T, write C_g for the native closed subscheme defined by the full conductor ideal and e_(g,a) for the existing target base-change isomorphism. The first new construction t identifies the twice-recomputed target conductor C_((f_q)_r) with the direct one C_(f_(r∘q)). Both are closed in Z and their full ideal data equal the pullback of I_f along r∘q. Transport the actual subscheme carrier along this equality. Forward and inverse inclusion equations hold, and the forward map is uniquely characterized by its closed-inclusion equation.

The second construction h identifies the native pullback of r and the inclusion of C_(f_q) with the pullback of r∘q and the inclusion of C_f. Use native pullback.map with identities on Z and T and the actual e_(f,q), then native pullbackRightPullbackFstIso. The existing first-projection formula supplies the defining commutative square. All three components are isomorphisms. The forward and inverse projection formulas retain the intermediate comparison in the map to C_f.

The whole scheme isomorphism e_(f_q,r) followed by h equals t followed by e_(f,r∘q). Native Iso.ext reduces this to the forward maps; cancel the direct pullback first projection, which is monic because the old conductor inclusion is monic. Both composites with it equal the twice-recomputed inclusion. Inverse-map equality follows by congruence on the inverse field. Postcomposition with the actual second projection gives equality of the two induced morphisms to C_f. This establishes target-side two-step coherence on actual scheme carriers. Source-carrier tower coherence and three-step coherence remain required.

No reduced, Noetherian, affine, separated, birational, faithfully-flat or nonempty hypothesis is added. The full ideals retain nilpotents. Generic pullbacks, ideal-sheaf carriers, equality transport and pasting are imported from the pinned library or existing SF.0 contracts; no duplicate generic carrier is planned. Eight proved typed examples check carrier roundtrips/inclusions, uniqueness of the whole carrier isomorphism, both inverse pullback projections, the whole inverse comparison, the actual conductorMap followed by the target comparison, identity bases, nested open restrictions without affineness and Spec(Z/1).

The checkpoint adds12 declaration-sized nodes:2 constructions and10 lemmas,13 API references and13 references to8 distinct typed examples. Each construction has at least three API items and six tests with explicit consumers. All739 incoming node objects and530 baseline entries are retained whole. The packet has751 nodes,536 baseline declarations,471 raw API entries and470 raw test references. All29 planets,18 gap records,23 requests,78 source routes,27 source findings and seven partial stages are unchanged. Only the current G0 frontier and stage description are extended. No broad gap is marked closed.

## Reading and authentication

The complete18717-character issue was read before and after bot{c['confirmation']} confirmed claim{c['claim']}. ClaimReceipt records exact partitions and body hash. The whole WORKERS was freshly reread. Original complete protocol, expansion and upstream reading scopes remain bound to the authenticated own6072→6060→6047/6039 records and unchanged control bytes. A truncated fresh protocol output is not counted as a fresh whole reading. OwnReadingReuse compares29 controls:23 unchanged; five changed deliverables are authenticated via incoming6077, and the changed SF.0 supplier packet is byte-identical to own6078. Original personal reading scopes are reused without enlarging them.

Fresh reading includes all complete reviewed parent R11.1–R11.6 audit objects and metadata, and the whole172-line REV-AUDIT-10. There is no separate PartII audit row. The full reserved Ferrand key node, conductorIdealSheaf node, both source/target comparison construction nodes, both SF.0 requests, last three G0 frontier paragraphs and then the whole current G0 stage object were read. All touching-link entry collections were scanned under both this PartII id and the legacy id:zero matches. No fresh manual audit of all739 nodes, the entire inherited reader or all source papers is claimed.

Incoming peer PR6077 at headb6e7fd87ac2c8fd40eb16dcd6fdca31ddbbbae71 was recovered over public HTTP:77 artifacts,10 helpers and5 deliverables. Manifest6a2c918330e685570860408a7986dfac11147e73fa884d1736ea7de7b4d92249 binds all three incoming Lean prefixes. Both actual immutable verifier executions reproduce the archived reports byte-for-byte. The inherited handoff first15500 characters and all ten consumed helpers were read, as were all12 incoming new declarations, all8 test bodies and the failed-test receipt. Native ranges9290–9335 and9400–9492 were freshly read. The full9828-line incoming native prefix was authenticated and replayed, without claiming a new whole-file manual reading. All726 own6072 node objects and528 baseline prefix entries remain exactly present in the incoming packet.

Own6072 manifestb03e012b0c6da09c4a21226432834345c4dad560972031c235f2c5934529d651 authenticates the original personal reading chain. Own6078 supplier manifest1980d44ac5e336f07861ecbdeedbfd910785a8947ae35a082c073efa40c8a186 authenticates the exact current176-node SF.0 packet and its personal reading record, which was reread. The consumed flat-annihilator, ideal-comap-top and ideal-restrict-top node identities remain supplied. No new direct supplier HTTP recovery or independent peer review is claimed in this job.

BaselineReading and BaselineRanges record exact current statements and ambient binders at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174: native pullback.map/map_isIso, actual right/left pasting APIs, eqToIso, asIso, Iso.ext, pullback of a monomorphism and the actual subscheme inclusion. The whole227-line IdealSheaf/Functorial module and bounded additional ranges were read. Exact specialized-name searches in pinned Mathlib, pinned TauCeti and existing blueprint JSON found no existing tower declarations. This is scoped name evidence, not an exhaustive absence survey.

Fresh source reading covers the whole displayed Stacks Section26.17, both definitions, all five lemma statements/proofs/diagrams and eight direct comments. It also covers the whole displayed Proposition37.67.3 statement/proof and its zero direct comments. Actual HTTP bytes, timestamps and hashes are archived. Linked Situation37.67.1, six section-level comments, historical patches and recursive linked proofs were not freshly read. The tower statements are authored deductions from the authenticated conductor comparisons and native pasting APIs. The displayed pushout/fibre-product notation slip is already recorded in inherited E7e92bd0E25; no duplicate finding or new correction-history claim is added. All27 findings retain their original attribution. The actual verifier independently enumerates the inherited five-dimensional commutative block-matrix algebra overF2:32 elements and1024 products.

## Validation and remaining proof limitation

The final entire Native.lean retains the authenticated9828-line prefix and appends12 proved declarations,8 proved examples and12 audits. Its631 axiom audits contain only propext, Classical.choice and Quot.sound; there are no errors, warnings or admissions. The complete admitted Sketch.lean retains its authenticated prefix and appends exactly matching declaration/example headers, with892 admission warnings as its only warnings. Both new constructions retain their actual definitions. The verifier checks exact header agreement, prefix hashes and all compiler receipts.

The incoming ConductorSubschemeChecked.nonreduced_conductor_section statement remains admitted-only evidence. A retry preserving its actual recomputed conductor and inverse-comparison section map, with a finite2400000-heartbeat option and the same1200-second/8GiB external bounds, still failed kernel checking after271.6seconds. FailedRecovery.lean/log/receipt preserve this actual failure; Context.lean/log/receipt bind the successful imported prefix, and RecoveredTest.lean holds the attempted test. The final successful Native prefix continues to omit that previously omitted example; it is not counted among the new8 proofs. Do not infer kernel success from elaboration or other clean declaration audits.

The full Tau-importing Canonical.lean/Suggested.lean remains UNCOMPILED. Fresh TauBuildScope records the required clean sourcef790474821cf4256814db967cb154e7af3d0c369, available buildcf386627e9176a3827c1a5fe804989fd94a4d216, and all five direct compiled Tau imports absent. The Mathlib native/sketch checks do not certify that whole file. No Lake project/setup/cache/build or language server was used. Each Lean process ran serially after a fresh20GiB guard, with one thread,8GiB memory and1200-second timeout. No Lean source edits or rebase occurred while its compiler ran. A full-file universe-name collision found after the isolated test was corrected before the final complete replay.

'''+measurement('Native')+measurement('Sketch')+f'''
Suggested.lean equals Canonical.lean; SHA256 `{sha((S/'Canonical.lean').read_bytes())}`.

The actual indexed blueprint checker, source/errata validation, intake and atlas assembler run against mathematical base `{txt('base.txt').strip()}` and publication base `{txt('publication-base.txt').strip()}`. Both reports are archived. All29 guards and the queue's non-state contract are checked; any publication refresh has explicit scope in PublicationChanges. The verifier never executes Lean or creates a repository snapshot.

The stage DAG has{g['stageDAG']['vertices']} vertices/{g['stageDAG']['edges']} edges, own declaration DAG{g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']}, and scoped DAG{g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']}. All are acyclic; all{g['requiredPairs']} required supplier pairs are reachable. Whole foreign roadmaps/stages and every existing stage edge match the control. The{g['otherPreexistingMissingRestructurePairs']} unrelated preexisting missing restructure paths are unchanged. There are no skipped or pending owned links.

## Resume

Use the named target tower carrier and native pullback-flattening isomorphisms, their whole coherence equality, inverse and old-conductor morphism formulas. Construct the source-carrier tower comparison along the actual ambient pullbackLeftPullbackSndIso, prove compatibility with the actual conductorMap, then establish three-step coherence and transport the geometric conductor pushout predicate. Obtain a kernel-checked proof of the retained nonreduced_conductor_section statement without weakening it. Generic Ferrand algebraic-space existence, the scheme affine-neighborhood criterion, small étale structure sheaves, projective/Proj and properness work, coherent H0/H1/genus, separateI2 and later model/classification obligations remain required. All retained requests and source routes remain. This is a partial checkpoint, not completion of the roadmap.
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
assert len(old['nodes'])==739 and len(nodes)==len(p['nodes'])==751
assert p['nodes'][:739]==old['nodes'] and p['nodes'][739:]==data('NewNodes.json')
assert [n['id']for n in p['nodes'][739:]]==plan['newNodes'] and plan['changedExisting']=={}
assert set(p)==set(old)
for k in old:
 if k not in ['nodes','summary','sources','baseline','coverage']:assert p[k]==old[k],k
assert p['sources']==old['sources']+plan['newSources']and p['summary'].startswith(old['summary'])
assert not plan['newSourceIssues']and not plan['newGaps']
assert p['baseline']['declarations']==old['baseline']['declarations']+plan['newBaseline'] and len(p['baseline']['declarations'])==536
assert len(old['baseline']['declarations'])==530 and len(plan['newBaseline'])==6
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
for n in p['nodes'][739:]:assert n['statement']in txt('ReaderAddition.md')and n['declarationName']in txt('ReaderAddition.md')
for item in plan['newApi']+plan['newTests']:assert item['name']in txt('ReaderAddition.md')and item['statement']in txt('ReaderAddition.md')
assert len(plan['newApi'])==13 and len(plan['newTests'])==8 and plan['newTestReferences']==13
assert sum(n['kind']=='construction'for n in data('NewNodes.json'))==2
assert sum(n['kind']=='lemma'for n in data('NewNodes.json'))==10
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
assert plan['existingNativeNames']==[]
assert len(nh)==12 and len(nt)==8 and {n.rsplit('.',1)[-1]for n in plan['newNames']}==set(nh)
assert len(re.findall(r"\bsorry\b",txt('NewAdmitted.lean')))==18
assert txt('Canonical.lean')==txt('CanonicalPrefix.lean')+'\n'+txt('NewAdmitted.lean')==txt('Suggested.lean')
assert txt('Native.lean')==txt('NativePrefix.lean')+'\n'+txt('NewProofs.lean')+'\n'+txt('NewTests.lean')+'\n'+txt('Audits.lean')
failed=data('FailedRecovery.receipt.json');assert failed['exitStatus']==1 and failed['errors']==1 and failed['warnings']==0 and failed['availableGiBBefore']>=20
assert failed['sourceSha256']==sha((S/'FailedRecovery.lean').read_bytes())and failed['logSha256']==sha((S/'FailedRecovery.log').read_bytes())
assert '(kernel) deterministic timeout'in txt('FailedRecovery.log')
assert txt('FailedRecovery.lean')=='import Context\n'+txt('RecoveredTest.lean')
assert txt('Context.lean')==txt('NativePrefix.lean')
context=data('Context.receipt.json');assert context['exitStatus']==0 and context['warnings']==0 and context['errors']==0
assert context['sourceSha256']==sha((S/'Context.lean').read_bytes())and context['logSha256']==sha((S/'Context.log').read_bytes())
assert txt('Sketch.lean')==txt('SketchPrefix.lean')+'\n'+txt('NewAdmitted.lean')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',txt('Native.lean'))
assert {t['name']for t in plan['newTests']}==set(re.findall(r'^-- test: (.+)$',txt('NewTests.lean'),re.M))
assert txt('Incoming.lean')==txt('CanonicalPrefix.lean')
im=data('IncomingManifest.json');ir=data('PreviousRecovery.json')
assert ir['head']=='b6e7fd87ac2c8fd40eb16dcd6fdca31ddbbbae71'and ir['artifactsVerified']==77 and ir['archivedHelpersVerified']==ir['publicHelperFencesVerified']==10
assert sha((S/'IncomingManifest.json').read_bytes())=='6a2c918330e685570860408a7986dfac11147e73fa884d1736ea7de7b4d92249'
for name,prefix in [('Native.lean','NativePrefix.lean'),('Sketch.lean','SketchPrefix.lean'),('Canonical.lean','CanonicalPrefix.lean')]:assert im[name]['sha256']==sha((S/prefix).read_bytes()),name
for original,replayed in [('Verification.json','Incoming-Verification.json'),('Verification-mathematical.json','Incoming-Verification-mathematical.json')]:assert im[original]['sha256']==sha((S/replayed).read_bytes())
for path,n in zip(paths,['Incoming-roadmap.json','Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert ir['publicDeliverables'][path]==sha((S/n).read_bytes())
assert data('IncomingReceipt.json')['bothActualVerifiersByteEqual']
om=data('OwnPreviousManifest.json')
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='b03e012b0c6da09c4a21226432834345c4dad560972031c235f2c5934529d651'
for original,current in [('Reading.json','OwnPreviousReading.json'),('InputGuard.json','OwnPreviousInputGuard.json'),('Candidate.json','OwnPreviousCandidate.json'),('OwnPreviousReading.json','Own6060Reading.json'),('OwnPreviousManifest.json','Own6060Manifest.json'),('OwnPreviousInputGuard.json','Own6060InputGuard.json')]:assert om[original]['sha256']==sha((S/current).read_bytes()),current
for key in ['OwnInherited6047Manifest.json','OwnInherited6047InputGuard.json','OwnInherited6047Reading.json','OwnInherited6039Manifest.json','OwnInherited6039InputGuard.json','OwnInherited6039Reading.json']:
 assert om[key]['sha256']==sha((S/key).read_bytes()),key
og={g['path']:g['sha256']for g in data('OwnPreviousInputGuard.json')}
reuse=data('OwnReadingReuse.json');assert len(reuse)==29 and sum(g['unchanged']for g in reuse)==23
for g in reuse:
 assert sha(blob(MATH,g['path']))==g['after']and og[g['path']]==g['before']
 assert g['unchanged']==(g['before']==g['after'])
own=data('OwnPreviousCandidate.json');assert old['nodes'][:726]==own['nodes']and old['baseline']['declarations'][:528]==own['baseline']['declarations']
for k in own:
 if k not in ['nodes','summary','sources','baseline','coverage']:assert own[k]==old[k],k
supplier=data('OwnSupplierManifest.json');assert sha((S/'OwnSupplierManifest.json').read_bytes())=='1980d44ac5e336f07861ecbdeedbfd910785a8947ae35a082c073efa40c8a186'
for original,current in [('Reading.json','OwnSupplierReading.json'),('Candidate.json','OwnSupplierCandidate.json'),('InputGuard.json','OwnSupplierInputGuard.json')]:assert supplier[original]['sha256']==sha((S/current).read_bytes()),current
assert blob(MATH,'research/blueprint/packets/SchemeAndStackFoundations.json')==(S/'OwnSupplierCandidate.json').read_bytes()
claim=data('ClaimReceipt.json');assert claim['issue']==3378 and claim['claim']==5981814197 and claim['confirmation']==5981815218
assert claim['wholeIssueCharacters']==18717 and claim['beforeAfterEqual']and claim['readBefore']==[[0,17000],[17000,18717]]and claim['readAfter']==[[0,18717]]
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
for stem,ex,want,audits in [('Native',347,0,631),('Sketch',367,892,20)]:
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
problems=[x for f,t in contents.items()for x in env['file_problems'](f,t)];refusals=env['auto_refusals'](job,paths,False,{'codex-7e92bd'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'NERON_VALIDATE_BASE':BASE}));assert graph['auditBase']==BASE
print(json.dumps(dict(mathematicalBase=MATH,publicationBase=BASE,preservedWholeNodes=739,changedExisting={},newNodes=12,newAuthoredDeclarations=12,newApi=13,newTests=8,newTestReferences=13,baselineDeclarations=len(p['baseline']['declarations']),rawApi=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),matchedNativeHeaders=12,matchedExamples=8,nativeNewExamples=8,inheritedAdmittedOnlyExample='ConductorSubschemeChecked.nonreduced_conductor_section',failedRecoveryReplay=failed,checker=checker,compilation=comp,canonicalSha256=sha(txt('Canonical.lean').encode()),fullCanonicalCompiled=False,incomingArchiveAuthenticated=77,ownPreviousManifestAuthenticated=True,ownSupplierManifestAuthenticated=True,guardsUnchanged=len(data('InputGuard.json'))-len(changes),publicationGuardChanges=list(changes.values()),indexSha256=sha(Path(sys.argv[2]).read_bytes()),intakeProblems=problems,intakeRefusals=refusals,sourceIssueErrors=issues,sourceVersionScope='All27 inherited findings retained whole. Fresh displayed01JO whole definitions/proofs/eightcomments and0E25 proposition/proof/zero direct comments; linked histories and section comments not reread. Tower statements are authored deductions; no new source finding.',graph=graph,LeanExecuted=False),indent=2))
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
NAMES=['Incoming-roadmap.json', 'Incoming.json', 'IncomingReader.md', 'Incoming.lean', 'IncomingHandoff.md', 'IncomingManifest.json', 'Incoming-Verification.json', 'Incoming-Verification-mathematical.json', 'PreviousRecovery.json', 'IncomingReceipt.json', 'NativePrefix.lean', 'SketchPrefix.lean', 'CanonicalPrefix.lean', 'Native.lean', 'Native.log', 'Native.receipt.json', 'Sketch.lean', 'Sketch.log', 'Sketch.receipt.json', 'Canonical.lean', 'NewProofs.lean', 'NewTests.lean', 'NewAdmitted.lean', 'Audits.lean', 'Context.lean', 'Context.log', 'Context.receipt.json', 'FailedRecovery.lean', 'FailedRecovery.log', 'FailedRecovery.receipt.json', 'RecoveredTest.lean', 'Candidate-roadmap.json', 'Candidate.json', 'Reader.md', 'ReaderAddition.md', 'Suggested.lean', 'Handoff.md', 'HandoffBase.md', 'ClaimReceipt.json', 'Reading.json', 'Worklist.json', 'SourceReading.json', 'BaselineReading.json', 'BaselineRanges.json', 'OwnReadingReuse.json', 'OwnContractGuard.json', 'OwnPreviousManifest.json', 'OwnPreviousReading.json', 'OwnPreviousInputGuard.json', 'OwnPreviousCandidate.json', 'Own6060Manifest.json', 'Own6060Reading.json', 'Own6060InputGuard.json', 'OwnInherited6047Manifest.json', 'OwnInherited6047InputGuard.json', 'OwnInherited6047Reading.json', 'OwnInherited6039Manifest.json', 'OwnInherited6039InputGuard.json', 'OwnInherited6039Reading.json', 'OwnSupplierManifest.json', 'OwnSupplierCandidate.json', 'OwnSupplierReading.json', 'OwnSupplierInputGuard.json', 'SupplierContract.json', 'InputGuard.json', 'PublicationChanges.json', 'TouchingLinks.json', 'Plan.json', 'NewNodes.json', 'Verification-mathematical.json', 'Verification.json', 'SourceGapCounterexample.json', 'SourceFindingScope.json', 'Search.json', 'TauBuildScope.json', 'Graph.json', 'base.txt', 'publication-base.txt', '01JO.html', '0E25.html', 'assemble.py', 'author.py', 'projection.py', 'write_handoff.py', 'verify.py', 'graph.py', 'immutable.py', 'compile.py', 'runcheck.py', 'package.py']
if mode=='archive':
 meta={n:dict(sha256=sha((S/n).read_bytes()),bytes=len((S/n).read_bytes()),lines=len((S/n).read_bytes().splitlines()))for n in NAMES}
 mb=(json.dumps(meta,indent=2,sort_keys=True)+'\n').encode();(S/'artifact-manifest.json').write_bytes(mb)
 payload={n:dict(sha256=sha((S/n).read_bytes()),data=base64.b64encode(zlib.compress((S/n).read_bytes(),9)).decode())for n in NAMES+['artifact-manifest.json']}
 pb=(json.dumps(payload,sort_keys=True,separators=(',',':'))+'\n').encode();(S/'payload.json').write_bytes(pb)
 report=dict(artifacts=len(NAMES),helpers=sum(n.endswith('.py')for n in NAMES),manifestSha256=sha(mb),payloadSha256=sha(pb))
 (S/'package.json').write_text(json.dumps(report,indent=2)+'\n')
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED TARGET CONDUCTOR TOWER PAYLOAD\n'+pb+b'END ARCHIVED TARGET CONDUCTOR TOWER PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('roadmaps','Candidate-roadmap.json'),('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated actual target conductor tower evidence; never executes Lean."""
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
pb=raw.split('/- BEGIN ARCHIVED TARGET CONDUCTOR TOWER PAYLOAD\\n',1)[1].split('END ARCHIVED TARGET CONDUCTOR TOWER PAYLOAD -/',1)[0].encode()
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
"""Recover public authenticated actual target conductor tower evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='NeronModelsAndSemistableAbelianVarietiesPartII'
ARCHIVE='8c6750e634f90601a16b9d4d064d3411904b1a70'
MANIFEST_SHA='0ea223760b6800c275237cc9dc51952f8f8bb94600a39ca5a3be040df3125225'
PAYLOAD_SHA='028f6204e1394f9d5ffebf1ea26b86785aa4ff989d26a2e3e3c34b7a737c8cf4'
EXPECTED={'roadmaps': '6b1477454991db5b943a1a24416bf77c90f176a48ee8fa073f124fdc99ae366c', 'packets': '3938b12b53ab203194db9e73ec80cc01f28381aa8ae6328d69c1ceefa7423c78', 'readmes': '97e8e1f155aeb07339adc77cc4193e61d48ee5ac2dec950e0803336c33712122', 'suggested': 'e0436fcc9aedad00cd05a414173249e8e64fb35e602cd327c7157a30c5dd901f'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED TARGET CONDUCTOR TOWER PAYLOAD\n',1)[1].split('END ARCHIVED TARGET CONDUCTOR TOWER PAYLOAD -/',1)[0].encode()
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
