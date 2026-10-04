# Actual nilpotent conductor sections — completed planning pass

Agent: Codex — codex-7e92bd. Refs #3378. This planning pass is complete under the updated300-node budget. All seven stages remain partial with their gaps and remaining work explicit, and every implementationStatus stays unchecked.

The inherited ConductorSubschemeChecked.nonreduced_conductor_section test now has a kernel-checked proof with exactly its original statement. For the actual diagonal Spec(Z/4×Z/4)→Spec(Z/4), the proof derives finiteness and schematic dominance, then produces a nonzero square-zero global section of the actual recomputed conductor subscheme after identity base change. Its image under the section map of the inverse actual conductorTargetBaseChangeIso is nonzero. The successful proof retains the actual subscheme and actual comparison map; it does not substitute the base ring as the tested carrier.

Nine new lemmas supply the proof as reusable conductor-specific deductions. The diagonal Spec(R×R)→Spec(R) is finite for every commutative ring R by the native finite-product module instance. It is schematically dominant because the diagonal ring map is injective and native ΓSpecIso naturality transports that injectivity to actual global sections. The native affine kernel criterion gives a zero ideal-sheaf kernel. Multiplication by(1,0) shows that the contracted full diagonal conductor is zero. The retained Spec conductor formula and native affine extensionality identify its global ideal and entire ideal-sheaf datum with zero. None of these statements assumes reducedness, nontriviality, Noetherianity or birationality.

For finite schematically dominant f:Y→P with P affine, a global section a outside its full conductor ideal whose nth power vanishes gives a nonzero nilpotent section of the actual conductor subscheme. Use the native quotient membership criterion and subschemeObjIso at the top affine open. For flat q:T→P, the actual inverse conductor comparison section map preserves nonzeroness, without affineness assumptions. Applying the global-section functor to the symmetric opposite scheme isomorphism proves this by inverse cancellation. When T is affine, the retained full-ideal flat comparison and the first section lemma produce the desired recomputed conductor section from a section outside I_f.comap q. The final diagonal specialization works in any universe and for every nilpotence exponent.

The proof initially expanded the actual conductor comparison inside an inverse-cancellation argument and hit the configured8GiB kernel memory limit. FailedSectionMap-Prototype source/log/receipt records that bounded failed attempt. Moving the same general scheme-isomorphism cancellation into an opaque local auxiliary proof made the exact statement pass. The original inherited kernel-timeout attempt is also retained, separately authenticated as InheritedFailedRecovery and InheritedRecoveredTest. Neither historical failure is a current proof gap. RecoveredTest is checked against the exact inherited example header, and that test occurs exactly once in each final Native, Sketch and Canonical file. It is appended only to Native because the admitted statement already occurs in the other two prefixes.

Five additional proved examples cover the diagonal overZ/1, the reduced ringZ, the actual cubic-nilpotent conductor section from2 overZ/8, preservation of nonzeroness and vanishing powers by the actual inverse comparison section map, and arbitrary-universe diagonal conductor computation. The packet adds10 lemma nodes:9 newly authored declarations and the promoted existing Subring.conductor_mem API declaration. The promoted declaration retains its existing proof and header; no new generic carrier is defined. Generic quotient and section theory stays native, and the existing SF.0 suppliers stay imported.

All766 incoming node objects and539 baseline entries are preserved whole. The result has776 nodes,546 baseline declarations,486 raw API entries and487 raw test references. All29 planets,18 gaps,23 requests,78 source routes,27 source findings and seven partial stages remain unchanged. The G0 frontier and stage description gain an explicit current note superseding earlier admitted-only evidence claims for this one test. Source/target two-step conductor-map coherence is retained; this checkpoint does not establish three-step coherence or geometric-pushout transport.

## Reading and provenance

The complete18717-character issue was read before claim5983281521 in partitions[0,18000] and[18000,18717], and again in full after bot5983282777 confirmed that exact numeric claim. ClaimReceipt binds the body hash and equal before/after bodies. Whole WORKERS was freshly read. The original full continuous-session blueprint, expansion and upstream reading scopes are reused from authenticated personal6081/6072/6060/6047/6039 records; current protocol sections115–245 and325–410 were also freshly read. A truncated aggregate protocol output is not treated as complete reading.

Fresh reading includes the whole172-line REV-AUDIT-10, the six reviewed parent R11.1–R11.6 row objects and AUDIT10 metadata; there is no separate PartII audit row. The whole current G0 description, reserved Ferrand key contract, conductorIdealSheaf and target comparison contracts, full global-flat comparison and both SF.0 requests were read in bounded outputs. An initially truncated aggregate global-flat contract was then reread whole. The exact three current SF.0 contracts were read whole: flat-annihilator, ideal-comap-top and ideal-restrict-top; they remain byte-equal to the authenticated incoming supplier objects. The current supplier packet has186 nodes and is already included in the mathematical base. Current and legacy-id touching-link entry scans have zero matches. No fresh whole766-node, full inherited-reader or complete-paper reading is claimed.

Incoming peer PR6084, head66a91450f545a7c812b5367b7b360add123055aa, was recovered over actual public HTTP:83 artifacts,10 helpers and5 deliverables. Manifest66c5d0935737e130345083fc9b1e9049fbc053235e1664139172cac3a5fbe109 authenticates all three Lean prefixes. Both actual original immutable verifier executions reproduced the archived reports byte-for-byte. The incoming handoff first16200 characters, exact recovery script, actual verify/immutable/graph helpers, all15 incoming new declarations and9 examples were personally read. Assembly, projection, compilation, packaging and handoff helpers were inspected before adapting them. Consumed native ranges6120–6275,6260–6365,8280–8375 and9589–9734 plus the Subring conductor definition/membership were freshly read. The whole10404-line native prefix was authenticated and successfully replayed as Context; it was not manually read in full.

Own6081 retained manifest0ea223760b6800c275237cc9dc51952f8f8bb94600a39ca5a3be040df3125225 authenticates its original personal Reading, InputGuard and Candidate records. The nested own6072/6060/6047/6039 and own supplier reading records were preserved with their original scopes, and personally reread. OwnReadingReuse checks29 controls:20 unchanged, five changed deliverables from peer6084, one changed SF.0 packet and three publication-policy changes described below. All751 own6081 node objects and536 baseline entries remain whole inside incoming766/539. No peer personal-reading scope is adopted and no fresh direct supplier public recovery is claimed.

BaselineReading and BaselineRanges identify exact pinned native statement and ambient binder ranges for finite Spec maps, finite product modules, schematic dominance, affine kernel and ideal-sheaf extensionality, full quotient-section comparison, quotient membership, identity comap, ΓSpecIso naturality, global sections and functorial isomorphisms. All nine specialized new names were searched in pinned Mathlib, pinned Tau and blueprint JSON with no matches. This is scoped exact-name evidence, not an exhaustive conceptual absence survey.

Fresh primary-source reading covers the complete displayed Stacks Lemma37.14.1(tag0ET0) and Proposition37.67.3(tag0E25), with their statements, proofs, diagrams and zero direct comments. Actual HTTP bytes, hashes and access dates are retained. The section comments, linked Situation37.67.1 and histories were not freshly read. The inherited domain/notation findings stay unchanged; no duplicate erratum or fresh correction-history closure is claimed. The exact diagonal and nilpotent-section formulas are authored deductions motivated by the full-ideal conductor context and proved from the native APIs. The verifier also retains and recomputes the inherited32-element block-matrix counterexample with1024 products.

## Updated planning budget

During publication refresh the protocol changed to target-driven coverage, breadth before depth and a300-node pass budget. The whole protocol, key-owner-count and checker diffs were read. Since the inherited packet already has766 nodes, this pass stops with776 and sets status complete; it does not mark any stage planned or closed without evidence. All seven coverage records were freshly read whole and retain their explicit remaining lists. The new checker accepts complete passes above the budget with open stages recorded. Ferrand ownership is unchanged; only routed/unrouted counts changed. PolicyRefresh records the original mathematical checkpoint and exact three changed control hashes/read scopes. PrePolicy records retain the earlier guard, reading comparison and successful old-checker report. Final mathematical and publication reports execute the current actual checker against status complete at the new base; no old-checker result is presented as certifying the new completion rule.

## Validation

Full Native appends9 proved lemmas,5 new proved examples and the recovered exact inherited example to the10404-line authenticated prefix. Its655 axiom audits contain only propext, Classical.choice and Quot.sound, with no errors, warnings or admissions. Context separately replays the complete prefix. Prototype checks all9 new declarations and6 proved examples. Full Sketch appends14 matching admitted declaration/example headers; its928 admission warnings are its only warnings. All sources, logs and receipts are bound by hashes. The promoted Subring membership declaration is inherited unchanged and used by an audited new theorem.

The whole Tau-importing Canonical/Suggested file remains UNCOMPILED. A fresh probe found clean sourcef790474821cf4256814db967cb154e7af3d0c369, an available build atcf386627e9176a3827c1a5fe804989fd94a4d216 and all five required direct compiled Tau imports absent. Native/Sketch checks do not certify the whole file. No Lake setup, cache fetch, library build or language server was used. Every Lean process ran serially after a fresh20GiB memory guard, with one thread,8GiB memory and1200-second timeout. No Lean file was edited or branch rebased during its compilation.

- Native.lean: 10636 lines, 362 examples, 0 warnings, 655 clean axiom audits, exit0. Source SHA256 59e33a5b2347bc136fa0bd8416aeabc71c20e2c65145961f39dd4884017439a6; log SHA256 ac054816433548d04fb3ca1abf58fe288711e75df4630bf4e076a900a307f914. Available memory 39GiB; elapsed 137.23s; maximum RSS 7300728KiB.
- Sketch.lean: 6907 lines, 381 examples, 928 warnings, 20 clean axiom audits, exit0. Source SHA256 3d2dcabb603d7cf54f7f7b7ade38daf4776fb5b842ff25f8d0d252b7f8b52424; log SHA256 3aeba8e29f2dccb49e7c7e52ba5029efba480ae9b048713e0bd7794ca055d81e. Available memory 39GiB; elapsed 93.05s; maximum RSS 7086128KiB.

Suggested equals Canonical, SHA256 6f77ae834c6a8856218cc9a788ab933aa91d65671fe59511049e237d8ce125fb.

The actual indexed checker, source/errata validation, intake and atlas assembler run at mathematical base 3365b4e7acfc1256c0ecab1f714733af2f1385cf and publication base 3365b4e7acfc1256c0ecab1f714733af2f1385cf. Both reports are archived. All29 input guards and the non-state queue contract are checked. PublicationChanges records any changed guard with its exact before/after hashes and scope; an empty list means all29 guards match. Every consumed supplier node is checked whole at both bases. The verifier runs no Lean and creates no repository snapshot.

Stage DAG: 3043 vertices/8727 edges. Own declaration DAG: 776/1782. Scoped DAG: 3797/11488. All are acyclic and all69 required supplier pairs are reachable. All foreign roadmap/stage objects and stage edges match controls. The45 unrelated preexisting missing restructure paths are unchanged; there are no owned skipped or pending links.

## Resume

Use the retained source and target tower carrier comparisons, whole-comparison coherence and both actual conductorMap squares to establish three-step coherence and transport the actual geometric conductor-pushout predicate. The exact nonreduced conductor-section test is now discharged in Native; do not treat its inherited historical failure as an outstanding obligation. Generic Ferrand algebraic-space existence, the scheme affine-neighborhood criterion, small étale structure sheaves, projective/Proj/properness work, coherent H0/H1/genus, separateI2 and model/classification obligations remain required. Follow all retained routes and supplier requests. This planning pass is complete at the node budget; independent review and separate follow-up jobs handle its open stages.

## Public recovery and replay

Archive commit `0bb0a88e7766565c8e36d3be82a3b1ce9e884cfc` is an ancestor changing only this issue's five deliverables. Its 104 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `606931b1339254544921c92ed2aabf7f9d2643d4e906c20d892792c694180d31`; payload SHA256 `962277eb5ed750a032d43c40a21dbaa708fa7742cb5cf4288778253a69a128ce`. The final suggested file has no archive payload and equals Canonical.lean, whose full Tau-importing file remains UNCOMPILED.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count and all ten exact public helper fences, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set NERON_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Sketch.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. The full Tau-importing Canonical.lean/Suggested.lean is not covered by these checks and remains UNCOMPILED. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Helper: assemble.py

```python
"""Append conductor nilpotent lemmas and recover the unchanged inherited test header."""
from pathlib import Path
import re,sys
S=Path(sys.argv[1]).resolve();sys.path.insert(0,str(S))
from projection import project
txt=lambda n:(S/n).read_text()
names=re.findall(r'^lemma ([\w.]+)',txt('NewProofs.lean'),re.M)
assert len(names)==9 and len(re.findall(r'^example\b',txt('NewTests.lean'),re.M))==5
admitted=project(txt('NewProofs.lean'),txt('NewTests.lean'))
assert len(re.findall(r'\bsorry\b',admitted))==14
(S/'NewAdmitted.lean').write_text(admitted)
audits=''.join('#print axioms TauCeti.GenusOne.FerrandPushout.'+n+'\n'for n in names)
(S/'Audits.lean').write_text(audits)
(S/'Native.lean').write_text(txt('NativePrefix.lean')+'\n'+txt('NewProofs.lean')+'\n'+txt('NewTests.lean')+'\n'+txt('RecoveredTest.lean')+'\n'+audits)
(S/'Sketch.lean').write_text(txt('SketchPrefix.lean')+'\n'+admitted)
(S/'Canonical.lean').write_text(txt('CanonicalPrefix.lean')+'\n'+admitted)
(S/'Suggested.lean').write_text(txt('Canonical.lean'))
```

## Helper: author.py

```python
"""Plan actual conductor nilpotent sections while preserving incoming contracts."""
from pathlib import Path
import copy,csv,json,re,sys
S=Path(__file__).resolve().parent;RID='NeronModelsAndSemistableAbelianVarietiesPartII';P=RID+':G.0/';NS='TauCeti.GenusOne.FerrandPushout.'
load=lambda n:json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
old=load('Incoming.json');p=copy.deepcopy(old);p['status']='complete';road=load('Incoming-roadmap.json')
existing={n.get('declarationName','').removeprefix(NS):n['id']for n in old['nodes']}
specs=[
('subring-conductor-membership','Subring.conductor_mem','Membership in the full subring conductor','For any commutative ring B, subring A and b in B, b belongs to the full B-ideal c(A,B) if and only if bx belongs to A for every x in B.',['id:subring-conductor'],'Unfold the retained conductor definition. This promotes its existing API declaration without adding another carrier or another proof.'),
('conductor-diagonal-finite','conductor_diagonal_isFinite','Finiteness of the diagonal test morphism','For every commutative ring R in any universe, the actual morphism Spec(R×R)→Spec(R) induced by a↦(a,a) is finite.',['mathlib:AlgebraicGeometry.IsFinite.SpecMap_iff','mathlib:RingHom.Finite','mathlib:Module.Finite.prod'],'Use the native SpecMap criterion and the product finite-module instance. The algebra structure induced by the diagonal is the native coordinatewise R-module structure.'),
('conductor-diagonal-dominance','conductor_diagonal_schemeTheoreticallyDominant','Schematic dominance of the diagonal test morphism','For every commutative ring R, including the zero ring and nonreduced rings, the actual diagonal Spec(R×R)→Spec(R) is schematically dominant.',['mathlib:AlgebraicGeometry.IsSchemeTheoreticallyDominant','mathlib:AlgebraicGeometry.Scheme.ΓSpecIso_naturality','mathlib:AlgebraicGeometry.Scheme.ΓSpecIso','mathlib:AlgebraicGeometry.Scheme.ker_of_isAffine','mathlib:AlgebraicGeometry.Scheme.IdealSheafData.ext','mathlib:RingHom.injective_iff_ker_eq_bot'],'The diagonal ring homomorphism is injective by its first coordinate. Native global-section naturality transports injectivity to the actual scheme map. Its affine ideal-sheaf kernel is zero by the native injective-kernel criterion.'),
('conductor-diagonal-zero-ideal','conductor_diagonal_comap_eq_bot','The contracted diagonal conductor is zero','For every commutative ring R and diagonal d:R→R×R, the full conductor of im(d) contracted along d is the zero ideal of R.',['Subring.conductor_mem'],'If a lies in the contracted conductor, d(a)(1,0) lies in im(d). Its coordinates force its diagonal preimage to be both a and zero. The reverse containment is automatic. This does not replace the zero ideal by its radical.'),
('conductor-diagonal-affine-ideal','conductor_diagonal_ideal_top','The actual diagonal conductor on the top affine open','For R a commutative ring, the global affine ideal of the actual conductorIdealSheaf of the diagonal Spec(R×R)→Spec(R) is zero, for its finite and schematically dominant instances.',['conductor_diagonal_isFinite','conductor_diagonal_schemeTheoreticallyDominant','conductor_diagonal_comap_eq_bot','ConductorIdealSheaf.spec_ideal','mathlib:AlgebraicGeometry.Scheme.ΓSpecIso','mathlib:RingHom.injective_iff_ker_eq_bot'],'The retained Spec comparison expresses this ideal as contraction of the ring conductor along the actual ΓSpecIso. Apply the diagonal computation and injectivity of that native section isomorphism.'),
('conductor-diagonal-ideal-sheaf','conductor_diagonal_idealSheaf_eq_bot','The full diagonal conductor ideal-sheaf datum','For every commutative ring R, the actual full conductor ideal-sheaf datum of Spec(R×R)→Spec(R) is the bottom ideal-sheaf datum.',['conductor_diagonal_ideal_top','mathlib:AlgebraicGeometry.Scheme.IdealSheafData.ext_of_isAffine'],'Apply native affine ideal-sheaf extensionality to the zero global affine ideal. Thus the conductor subscheme retains the full target scheme structure, including nilpotents.'),
('conductor-nilpotent-section','conductor_nilpotent_section','A nilpotent section on the actual conductor subscheme','Let f:Y→P be finite and schematically dominant with P affine. If a in Γ(P,top) is outside the full conductor ideal and a^n=0 for a natural number n, the actual conductor closed subscheme has a section z with z≠0 and z^n=0.',['id:conductor-ideal-sheaf','mathlib:AlgebraicGeometry.Scheme.IdealSheafData.subschemeObjIso','mathlib:Ideal.Quotient.eq_zero_iff_mem'],'The quotient class of a is nonzero by the native quotient membership criterion and has vanishing nth power. Transport it along the inverse of the native subschemeObjIso at the top affine open. The native quotient and section isomorphism remain imported.'),
('conductor-comparison-nonzero-section','conductorTargetBaseChangeIso_nonzero','Nonzero sections survive the actual conductor comparison','Let f:Y→P be finite and schematically dominant and q:T→P flat. Every nonzero global section z of the actual recomputed target conductor subscheme remains nonzero under the section map induced by the inverse of the actual conductorTargetBaseChangeIso(f,q).',['conductorTargetBaseChangeIso','mathlib:AlgebraicGeometry.Scheme.Γ','mathlib:CategoryTheory.Functor.mapIso'],'Apply the native global-section functor to the opposite of the symmetric actual scheme isomorphism. Cancel its inverse after an assumed zero image. A local proof fact about arbitrary scheme isomorphisms keeps the conductor construction opaque during kernel checking; it adds no generic public carrier.'),
('conductor-flat-nilpotent-section','conductorTargetBaseChangeIso_nilpotent_section','Nilpotent sections after actual flat conductor recomputation','Let f:Y→P be finite and schematically dominant, q:T→P flat and T affine. If a in Γ(T,top) lies outside the top ideal of I_f.comap q and a^n=0, there is a nonzero section z of the actual recomputed conductor subscheme with z^n=0 whose image under the inverse target-comparison section map is nonzero.',['conductor_nilpotent_section','conductorTargetBaseChangeIso_nonzero','conductor_global_flat_comparison'],'Use the retained equality of the full recomputed and pulled-back conductor ideals. Apply the preceding quotient-section lemma and nonzero-comparison lemma. No nilpotence is inferred merely from a ring used as a surrogate for the actual subscheme.'),
('conductor-diagonal-nilpotent-section','conductor_diagonal_nilpotent_section','Nonzero diagonal conductor sections from nilpotent ring elements','For every commutative ring R, n in the natural numbers and a≠0 in R with a^n=0, the diagonal Spec(R×R)→Spec(R), after identity base change, has an actual target conductor global section z≠0 with z^n=0, and the actual inverse target-comparison section map keeps z nonzero. Finiteness and schematic dominance are supplied by the preceding lemmas.',['conductorTargetBaseChangeIso_nilpotent_section','conductor_diagonal_ideal_top','mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comap_id','mathlib:AlgebraicGeometry.Scheme.ΓSpecIso'],'Transport a into actual global sections by ΓSpecIso inverse. The full diagonal conductor ideal is zero, so injectivity proves nonmembership. Ring-map laws preserve the vanishing nth power, and the flat section theorem supplies the actual recomputed conductor section.')]
ids={name:P+slug for slug,name,*_ in specs};nodes=[];sid='ConductorNilpotentSections-codex-7e92bd';src=load('SourceReading.json')[0]
common=['All schemes in a statement share an arbitrary universe. Rings are arbitrary commutative rings, including zero rings; no reducedness, Noetherianity or birationality is imposed.','Finiteness, schematic dominance, flatness and affineness are required exactly where stated. The actual full conductor ideals and native closed-subscheme carriers are used. Generic quotient, section and pullback theories remain imported.']
for slug,name,title,statement,deps,proof in specs:
 def dep(d):
  if d.startswith('id:'):return P+d[3:]
  if d.startswith('mathlib:'):return d
  return ids[d]if d in ids else existing[d]
 nodes.append(dict(id=ids[name],parentStageId=RID+':G.0',realises=[RID+':G.0'],kind='lemma',title=title,declarationName=(name if name.startswith('Subring.')else NS+name),statement=statement,hypotheses=common,prerequisites=list(map(dep,deps)),proofSteps=[proof],acceptance=[statement,'Retain actual conductor subschemes and the inverse comparison section map; no radical substitution.'],library=dict(module='TauCeti/AlgebraicGeometry/GenusOne/G0',namespace=('Subring'if name.startswith('Subring.')else NS[:-1])),sources=[dict(sourceId=sid,locator='Lemma37.14.1, full displayed statement and proof; authored conductor-specific deduction using native quotient-section comparison',excerpt='ideal',match='The source motivates full ideal and structure-sheaf data in conductor pushouts. The diagonal calculation and actual nilpotent-section formulas are authored deductions from the retained conductor contracts and native APIs, not claims quoted from the source.')],api=[],tests=[],implementationStatus='unchecked'))
testdata=[('diagonal_zero_ring','degenerate','For R=Z/1, derive finiteness and schematic dominance of the actual diagonal and prove its full conductor ideal-sheaf datum is zero; no point-existence assumption is made.'),('reduced_diagonal','computation','For R=Z, derive the actual diagonal morphism hypotheses and prove its full conductor ideal-sheaf datum is zero.'),('cubic_nilpotent','computation','For the actual diagonal over Z/8, derive its morphism hypotheses and use the nonzero element2 with cube zero to obtain a nonzero actual recomputed conductor section with cube zero and nonzero inverse-comparison image.'),('comparison_retains_nilpotence','compatibility','For every actual target conductor comparison along a flat map, its inverse section map preserves both nonzeroness and the vanishing nth power of a global conductor section.'),('arbitrary_universe_diagonal','compatibility','The full contracted diagonal conductor is zero for a commutative ring in an arbitrary universe, without a nontriviality assumption.')]
tests=[dict(name='ConductorNilpotentChecked.'+a,kind=b,statement=c)for a,b,c in testdata]
for i,j in [(5,0),(4,1),(9,2),(7,3),(3,4)]:nodes[i]['tests'].append(tests[j])
p['nodes']+=nodes
rows=list(csv.reader(Path(sys.argv[1]).open(),delimiter='\t'));have={x['ref']for x in p['baseline']['declarations']};baseline=[];reading=[]
for name in sorted({x.removeprefix('mathlib:')for n in nodes for x in n['prerequisites']if x.startswith('mathlib:')}):
 row=next(r for r in rows if len(r)>5 and r[0]=='mathlib'and r[1]==name);reading.append(dict(name=name,file=row[3],line=int(row[4]),signature=row[5],scope='Exact native statement and ambient binders personally read at the pin; source ranges and hashes in BaselineRanges.json.'))
 if 'mathlib:'+name not in have:baseline.append(dict(ref='mathlib:'+name,kind=row[2],module=row[3],line=int(row[4]),provides=row[5]+' Native input for actual conductor nilpotent-section deductions.',checked='Codex — codex-7e92bd read the exact statement at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 on2026-10-04.'))
p['baseline']['declarations']+=baseline;save('BaselineReading.json',reading)
source=dict(id=sid,title='Conductor pushouts and authored actual nilpotent-section tests',authors='The Stacks Project authors; conductor deductions by Codex — codex-7e92bd',edition='Current displayed Lemma37.14.1, accessed4October2026',url=src['url'],sha256=src['sha256'],accessed=src['accessDate'],readSections=[src['scope']]);p['sources'].append(source)
frontier='The actual nonreduced conductor-section test overZ/4 now has a kernel-checked proof with its exact inherited statement. Nine new lemmas derive diagonal finiteness and schematic dominance over arbitrary commutative rings, compute its full conductor ideal, produce nonzero nilpotent sections on actual conductor subschemes, and retain them through the actual inverse base-change comparison. The existing subring-conductor membership API is promoted to one lemma node. Five additional proved examples includeZ/1,Z,Z/8, arbitrary universes and preservation of nilpotence by the actual comparison. All766 incoming node objects and539 baseline entries remain unchanged. Earlier frontier statements about admitted-only evidence for this test are superseded by this exact native recovery. Source and target two-step conductor-map coherence remains available; three-step coherence and geometric conductor-pushout transport remain required, together with generic Ferrand existence, the scheme affine-neighborhood criterion, small étale structure sheaves, projective/cohomological work, separateI2 and model/classification obligations. All18 gaps,23 requests,78 routes,27 findings and seven partial stages remain; implementationStatus stays unchecked and the whole Tau-importing suggested file is UNCOMPILED.'
p['summary']+=' The planning pass is complete under the updated300-node budget; all seven stages remain honestly partial, with their remaining lists and gaps retained for independent review and follow-up jobs. Actual conductor nilpotent-section continuation:10 lemma nodes (9 new declarations and1 promoted existing API),5 new typed examples and recovery of the exact inherited nonreduced section test; all766 incoming nodes unchanged.'
next(x for x in p['coverage']if x['stageId']==RID+':G.0')['remaining'].append(frontier);road['stages'][0]['description']+=' '+frontier
plan=dict(newNames=[n['declarationName']for n in nodes[1:]],newNodes=[n['id']for n in nodes],newApi=[],newTests=tests,newTestReferences=5,newBaseline=baseline,newSources=[source],newSourceIssues=[],newGaps=[],changedExisting={},existingNativeNames=['Subring.conductor_mem'],recoveredTest='ConductorSubschemeChecked.nonreduced_conductor_section',frontier=frontier)
for n,x in [('Candidate.json',p),(RID+'.json',p),('Candidate-roadmap.json',road),('NewNodes.json',nodes),('Plan.json',plan)]:save(n,x)
intro='''# Nilpotent sections on actual conductor subschemes

Let f:Y→P be finite and schematically dominant. Its full conductor ideal determines a native closed subscheme C_f. When P is affine, a global section a outside that ideal whose nth power vanishes gives a nonzero nilpotent section on C_f through the native quotient-section isomorphism. For a flat q:T→P with T affine, the full conductor comparison identifies the recomputed ideal with I_f.comap q. The section on the recomputed C_(f_q) stays nonzero under the section map of the inverse actual conductorTargetBaseChangeIso. That ring map also preserves its vanishing nth power.

For the diagonal R→R×R, multiplication by (1,0) proves that the contracted full conductor is zero. The actual scheme morphism is finite by the native product finite-module instance and schematically dominant by injectivity, transported through ΓSpecIso. Native affine ideal-sheaf extensionality then proves the entire conductor ideal-sheaf datum is zero. No reducedness or nontriviality is assumed. This supplies actual conductor sections from every nonzero nilpotent element of R.

The retained test over Z/4 now has a native proof with exactly its original header: both morphism hypotheses are derived, and a nonzero square-zero section lies on the actual recomputed conductor subscheme after identity base change and stays nonzero under the actual inverse comparison section map. Five new proved examples cover the zero ring, Z, the cubic nilpotent2 overZ/8, arbitrary universes and preservation of nilpotence by the actual section map. This supersedes the older admitted-only evidence note for that one test. The planning pass is complete under the current300-node budget, with all seven stage coverage statuses still partial and remaining obligations retained for review and follow-up jobs. The complete Tau-importing suggested file remains UNCOMPILED; the independent native and admitted Mathlib slices have their own exact checks. No whole-roadmap closure is asserted.

'''
parts=[intro,frontier+'\n\n']
for n in nodes:
 parts+=['## '+n['title']+'\n\n','**'+n['declarationName']+'** — '+n['statement']+'\n\n','Hypotheses: '+' '.join(n['hypotheses'])+'\n\n','Prerequisites: '+', '.join(n['prerequisites'])+'.\n\n','Proof: '+' '.join(n['proofSteps'])+'\n\n']
 if n['tests']:parts+=['Typed examples:\n\n']+['- **'+x['name']+'**: '+x['statement']+'\n'for x in n['tests']]+['\n']
(S/'ReaderAddition.md').write_text(''.join(parts));(S/'Reader.md').write_text(''.join(parts)+(S/'IncomingReader.md').read_text())
assert set(re.findall(r'^lemma ([\w.]+)',(S/'NewProofs.lean').read_text(),re.M))==set(ids)-{'Subring.conductor_mem'}
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
"""Write measured actual conductor-section recovery, exact provenance and remaining work."""
from pathlib import Path
import hashlib,json,re
S=Path(__file__).resolve().parent
txt=lambda n:(S/n).read_text()
data=lambda n:json.loads(txt(n))
sha=lambda b:hashlib.sha256(b).hexdigest()
def measurement(stem):
 r=data(stem+'.receipt.json');b=(S/(stem+'.lean')).read_bytes();assert r['exitStatus']==0
 return f"- {stem}.lean: {len(b.splitlines())} lines, {len(re.findall(r'^example\b',b.decode(),re.M))} examples, {r['warnings']} warnings, {r['axiomAudits']} clean axiom audits, exit0. Source SHA256 {sha(b)}; log SHA256 {r['logSha256']}. Available memory {r['availableGiBBefore']}GiB; elapsed {r['elapsedSeconds']}s; maximum RSS {r['maxRssKiB']}KiB.\n"
g=data('Graph.json');plan=data('Plan.json')
h=f'''# Actual nilpotent conductor sections — completed planning pass

Agent: Codex — codex-7e92bd. Refs #3378. This planning pass is complete under the updated300-node budget. All seven stages remain partial with their gaps and remaining work explicit, and every implementationStatus stays unchecked.

The inherited ConductorSubschemeChecked.nonreduced_conductor_section test now has a kernel-checked proof with exactly its original statement. For the actual diagonal Spec(Z/4×Z/4)→Spec(Z/4), the proof derives finiteness and schematic dominance, then produces a nonzero square-zero global section of the actual recomputed conductor subscheme after identity base change. Its image under the section map of the inverse actual conductorTargetBaseChangeIso is nonzero. The successful proof retains the actual subscheme and actual comparison map; it does not substitute the base ring as the tested carrier.

Nine new lemmas supply the proof as reusable conductor-specific deductions. The diagonal Spec(R×R)→Spec(R) is finite for every commutative ring R by the native finite-product module instance. It is schematically dominant because the diagonal ring map is injective and native ΓSpecIso naturality transports that injectivity to actual global sections. The native affine kernel criterion gives a zero ideal-sheaf kernel. Multiplication by(1,0) shows that the contracted full diagonal conductor is zero. The retained Spec conductor formula and native affine extensionality identify its global ideal and entire ideal-sheaf datum with zero. None of these statements assumes reducedness, nontriviality, Noetherianity or birationality.

For finite schematically dominant f:Y→P with P affine, a global section a outside its full conductor ideal whose nth power vanishes gives a nonzero nilpotent section of the actual conductor subscheme. Use the native quotient membership criterion and subschemeObjIso at the top affine open. For flat q:T→P, the actual inverse conductor comparison section map preserves nonzeroness, without affineness assumptions. Applying the global-section functor to the symmetric opposite scheme isomorphism proves this by inverse cancellation. When T is affine, the retained full-ideal flat comparison and the first section lemma produce the desired recomputed conductor section from a section outside I_f.comap q. The final diagonal specialization works in any universe and for every nilpotence exponent.

The proof initially expanded the actual conductor comparison inside an inverse-cancellation argument and hit the configured8GiB kernel memory limit. FailedSectionMap-Prototype source/log/receipt records that bounded failed attempt. Moving the same general scheme-isomorphism cancellation into an opaque local auxiliary proof made the exact statement pass. The original inherited kernel-timeout attempt is also retained, separately authenticated as InheritedFailedRecovery and InheritedRecoveredTest. Neither historical failure is a current proof gap. RecoveredTest is checked against the exact inherited example header, and that test occurs exactly once in each final Native, Sketch and Canonical file. It is appended only to Native because the admitted statement already occurs in the other two prefixes.

Five additional proved examples cover the diagonal overZ/1, the reduced ringZ, the actual cubic-nilpotent conductor section from2 overZ/8, preservation of nonzeroness and vanishing powers by the actual inverse comparison section map, and arbitrary-universe diagonal conductor computation. The packet adds10 lemma nodes:9 newly authored declarations and the promoted existing Subring.conductor_mem API declaration. The promoted declaration retains its existing proof and header; no new generic carrier is defined. Generic quotient and section theory stays native, and the existing SF.0 suppliers stay imported.

All766 incoming node objects and539 baseline entries are preserved whole. The result has776 nodes,546 baseline declarations,486 raw API entries and487 raw test references. All29 planets,18 gaps,23 requests,78 source routes,27 source findings and seven partial stages remain unchanged. The G0 frontier and stage description gain an explicit current note superseding earlier admitted-only evidence claims for this one test. Source/target two-step conductor-map coherence is retained; this checkpoint does not establish three-step coherence or geometric-pushout transport.

## Reading and provenance

The complete18717-character issue was read before claim5983281521 in partitions[0,18000] and[18000,18717], and again in full after bot5983282777 confirmed that exact numeric claim. ClaimReceipt binds the body hash and equal before/after bodies. Whole WORKERS was freshly read. The original full continuous-session blueprint, expansion and upstream reading scopes are reused from authenticated personal6081/6072/6060/6047/6039 records; current protocol sections115–245 and325–410 were also freshly read. A truncated aggregate protocol output is not treated as complete reading.

Fresh reading includes the whole172-line REV-AUDIT-10, the six reviewed parent R11.1–R11.6 row objects and AUDIT10 metadata; there is no separate PartII audit row. The whole current G0 description, reserved Ferrand key contract, conductorIdealSheaf and target comparison contracts, full global-flat comparison and both SF.0 requests were read in bounded outputs. An initially truncated aggregate global-flat contract was then reread whole. The exact three current SF.0 contracts were read whole: flat-annihilator, ideal-comap-top and ideal-restrict-top; they remain byte-equal to the authenticated incoming supplier objects. The current supplier packet has186 nodes and is already included in the mathematical base. Current and legacy-id touching-link entry scans have zero matches. No fresh whole766-node, full inherited-reader or complete-paper reading is claimed.

Incoming peer PR6084, head66a91450f545a7c812b5367b7b360add123055aa, was recovered over actual public HTTP:83 artifacts,10 helpers and5 deliverables. Manifest66c5d0935737e130345083fc9b1e9049fbc053235e1664139172cac3a5fbe109 authenticates all three Lean prefixes. Both actual original immutable verifier executions reproduced the archived reports byte-for-byte. The incoming handoff first16200 characters, exact recovery script, actual verify/immutable/graph helpers, all15 incoming new declarations and9 examples were personally read. Assembly, projection, compilation, packaging and handoff helpers were inspected before adapting them. Consumed native ranges6120–6275,6260–6365,8280–8375 and9589–9734 plus the Subring conductor definition/membership were freshly read. The whole10404-line native prefix was authenticated and successfully replayed as Context; it was not manually read in full.

Own6081 retained manifest0ea223760b6800c275237cc9dc51952f8f8bb94600a39ca5a3be040df3125225 authenticates its original personal Reading, InputGuard and Candidate records. The nested own6072/6060/6047/6039 and own supplier reading records were preserved with their original scopes, and personally reread. OwnReadingReuse checks29 controls:20 unchanged, five changed deliverables from peer6084, one changed SF.0 packet and three publication-policy changes described below. All751 own6081 node objects and536 baseline entries remain whole inside incoming766/539. No peer personal-reading scope is adopted and no fresh direct supplier public recovery is claimed.

BaselineReading and BaselineRanges identify exact pinned native statement and ambient binder ranges for finite Spec maps, finite product modules, schematic dominance, affine kernel and ideal-sheaf extensionality, full quotient-section comparison, quotient membership, identity comap, ΓSpecIso naturality, global sections and functorial isomorphisms. All nine specialized new names were searched in pinned Mathlib, pinned Tau and blueprint JSON with no matches. This is scoped exact-name evidence, not an exhaustive conceptual absence survey.

Fresh primary-source reading covers the complete displayed Stacks Lemma37.14.1(tag0ET0) and Proposition37.67.3(tag0E25), with their statements, proofs, diagrams and zero direct comments. Actual HTTP bytes, hashes and access dates are retained. The section comments, linked Situation37.67.1 and histories were not freshly read. The inherited domain/notation findings stay unchanged; no duplicate erratum or fresh correction-history closure is claimed. The exact diagonal and nilpotent-section formulas are authored deductions motivated by the full-ideal conductor context and proved from the native APIs. The verifier also retains and recomputes the inherited32-element block-matrix counterexample with1024 products.

## Updated planning budget

During publication refresh the protocol changed to target-driven coverage, breadth before depth and a300-node pass budget. The whole protocol, key-owner-count and checker diffs were read. Since the inherited packet already has766 nodes, this pass stops with776 and sets status complete; it does not mark any stage planned or closed without evidence. All seven coverage records were freshly read whole and retain their explicit remaining lists. The new checker accepts complete passes above the budget with open stages recorded. Ferrand ownership is unchanged; only routed/unrouted counts changed. PolicyRefresh records the original mathematical checkpoint and exact three changed control hashes/read scopes. PrePolicy records retain the earlier guard, reading comparison and successful old-checker report. Final mathematical and publication reports execute the current actual checker against status complete at the new base; no old-checker result is presented as certifying the new completion rule.

## Validation

Full Native appends9 proved lemmas,5 new proved examples and the recovered exact inherited example to the10404-line authenticated prefix. Its655 axiom audits contain only propext, Classical.choice and Quot.sound, with no errors, warnings or admissions. Context separately replays the complete prefix. Prototype checks all9 new declarations and6 proved examples. Full Sketch appends14 matching admitted declaration/example headers; its928 admission warnings are its only warnings. All sources, logs and receipts are bound by hashes. The promoted Subring membership declaration is inherited unchanged and used by an audited new theorem.

The whole Tau-importing Canonical/Suggested file remains UNCOMPILED. A fresh probe found clean sourcef790474821cf4256814db967cb154e7af3d0c369, an available build atcf386627e9176a3827c1a5fe804989fd94a4d216 and all five required direct compiled Tau imports absent. Native/Sketch checks do not certify the whole file. No Lake setup, cache fetch, library build or language server was used. Every Lean process ran serially after a fresh20GiB memory guard, with one thread,8GiB memory and1200-second timeout. No Lean file was edited or branch rebased during its compilation.

'''+measurement('Native')+measurement('Sketch')+f'''
Suggested equals Canonical, SHA256 {sha((S/'Canonical.lean').read_bytes())}.

The actual indexed checker, source/errata validation, intake and atlas assembler run at mathematical base {txt('base.txt').strip()} and publication base {txt('publication-base.txt').strip()}. Both reports are archived. All29 input guards and the non-state queue contract are checked. PublicationChanges records any changed guard with its exact before/after hashes and scope; an empty list means all29 guards match. Every consumed supplier node is checked whole at both bases. The verifier runs no Lean and creates no repository snapshot.

Stage DAG: {g['stageDAG']['vertices']} vertices/{g['stageDAG']['edges']} edges. Own declaration DAG: {g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']}. Scoped DAG: {g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']}. All are acyclic and all{g['requiredPairs']} required supplier pairs are reachable. All foreign roadmap/stage objects and stage edges match controls. The{g['otherPreexistingMissingRestructurePairs']} unrelated preexisting missing restructure paths are unchanged; there are no owned skipped or pending links.

## Resume

Use the retained source and target tower carrier comparisons, whole-comparison coherence and both actual conductorMap squares to establish three-step coherence and transport the actual geometric conductor-pushout predicate. The exact nonreduced conductor-section test is now discharged in Native; do not treat its inherited historical failure as an outstanding obligation. Generic Ferrand algebraic-space existence, the scheme affine-neighborhood criterion, small étale structure sheaves, projective/Proj/properness work, coherent H0/H1/genus, separateI2 and model/classification obligations remain required. Follow all retained routes and supplier requests. This planning pass is complete at the node budget; independent review and separate follow-up jobs handle its open stages.
'''
h=h.rstrip()+'\n';(S/'HandoffBase.md').write_text(h);(S/'Handoff.md').write_text(h)
```

## Helper: verify.py

```python
"""Verify actual conductor nilpotent-section evidence with the immutable real checker/intake/atlas; never runs Lean."""
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
helpers=['assemble.py','author.py','projection.py','write_handoff.py','verify.py','graph.py','immutable.py','compile.py','runcheck.py','package.py']
if (S/'PublicHandoff.md').exists():
 contents[paths[-1]]=txt('PublicHandoff.md');assert txt('PublicHandoff.md').startswith(txt('HandoffBase.md'))
 fence=chr(96)*3
 assert txt('PublicHandoff.md').split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'==txt('recover.py')
 for name in helpers:assert txt('PublicHandoff.md').split('## Helper: '+name+'\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'==txt(name),name
for path,n in zip(paths,['Incoming-roadmap.json','Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert blob(MATH,path)==(S/n).read_bytes(),path
p=data('Candidate.json');old=data('Incoming.json');plan=data('Plan.json');nodes={n['id']:n for n in p['nodes']}
assert len(old['nodes'])==766 and len(nodes)==len(p['nodes'])==776
assert p['nodes'][:766]==old['nodes'] and p['nodes'][766:]==data('NewNodes.json')
assert [n['id']for n in p['nodes'][766:]]==plan['newNodes'] and plan['changedExisting']=={}
assert set(p)==set(old)
for k in old:
 if k not in ['nodes','summary','sources','baseline','coverage','status']:assert p[k]==old[k],k
assert p['sources']==old['sources']+plan['newSources']and p['summary'].startswith(old['summary'])
assert not plan['newSourceIssues']and not plan['newGaps']
assert p['baseline']['declarations']==old['baseline']['declarations']+plan['newBaseline']
assert len(p['baseline']['declarations'])==546 and len(old['baseline']['declarations'])==539 and len(plan['newBaseline'])==7
assert {k:v for k,v in p['baseline'].items()if k!='declarations'}=={k:v for k,v in old['baseline'].items()if k!='declarations'}
for a,b in zip(old['coverage'],p['coverage']):
 if a['stageId']==RID+':G.0':
  assert b['remaining']==a['remaining']+[plan['frontier']]
  assert {k:v for k,v in a.items()if k!='remaining'}=={k:v for k,v in b.items()if k!='remaining'}
 else:assert a==b
assert p['status']=='complete'and all(n['implementationStatus']=='unchecked'for n in p['nodes'])and all(c['status']=='partial'for c in p['coverage'])
assert (len(p['requests']),len(p['gaps']),len(p['coverage']),len(p['routeCoverage']),len(p['sourceIssues']))==(23,18,7,78,27)
assert sum('planet'in n for n in p['nodes'])==29
rd=data('Candidate-roadmap.json');rold=data('Incoming-roadmap.json')
assert rd['stages'][1:]==rold['stages'][1:]
assert {k:v for k,v in rd.items()if k!='stages'}=={k:v for k,v in rold.items()if k!='stages'}
assert {k:v for k,v in rd['stages'][0].items()if k!='description'}=={k:v for k,v in rold['stages'][0].items()if k!='description'}
assert rd['stages'][0]['description']==rold['stages'][0]['description']+' '+plan['frontier']
assert txt('Reader.md')==txt('ReaderAddition.md')+txt('IncomingReader.md')
for n in p['nodes'][766:]:assert n['statement']in txt('ReaderAddition.md')and n['declarationName']in txt('ReaderAddition.md')
for item in plan['newApi']+plan['newTests']:assert item['name']in txt('ReaderAddition.md')and item['statement']in txt('ReaderAddition.md')
assert len(plan['newApi'])==0 and len(plan['newTests'])==5 and plan['newTestReferences']==5
assert sum(n['kind']=='construction'for n in data('NewNodes.json'))==0
assert sum(n['kind']=='lemma'for n in data('NewNodes.json'))==10
assert all(len(n['api'])>=3 and len(n['tests'])>=3 and n['uses']for n in data('NewNodes.json')if n['kind']=='construction')
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
assert headers(txt('NewAdmitted.lean'))==dict(**nh,**{'example#'+str(9+i):v for i,v in enumerate(nt.values())})
assert len(nh)==9 and len(nt)==5 and {n.rsplit('.',1)[-1]for n in plan['newNames']}==set(nh)
assert len(re.findall(r"\bsorry\b",txt('NewAdmitted.lean')))==14
assert txt('Canonical.lean')==txt('CanonicalPrefix.lean')+'\n'+txt('NewAdmitted.lean')==txt('Suggested.lean')
assert txt('Native.lean')==txt('NativePrefix.lean')+'\n'+txt('NewProofs.lean')+'\n'+txt('NewTests.lean')+'\n'+txt('RecoveredTest.lean')+'\n'+txt('Audits.lean')
assert txt('Sketch.lean')==txt('SketchPrefix.lean')+'\n'+txt('NewAdmitted.lean')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',txt('Native.lean'))
assert {t['name']for t in plan['newTests']}==set(re.findall(r'^-- test: (.+)$',txt('NewTests.lean'),re.M))
assert txt('Incoming.lean')==txt('CanonicalPrefix.lean')
im=data('IncomingManifest.json');ir=data('PreviousRecovery.json')
assert ir['head']=='66a91450f545a7c812b5367b7b360add123055aa'and ir['artifactsVerified']==83 and ir['archivedHelpersVerified']==ir['publicHelperFencesVerified']==10
assert sha((S/'IncomingManifest.json').read_bytes())=='66c5d0935737e130345083fc9b1e9049fbc053235e1664139172cac3a5fbe109'
for name,prefix in [('Native.lean','NativePrefix.lean'),('Sketch.lean','SketchPrefix.lean'),('Canonical.lean','CanonicalPrefix.lean')]:assert im[name]['sha256']==sha((S/prefix).read_bytes()),name
for original,replayed in [('Verification.json','Incoming-Verification.json'),('Verification-mathematical.json','Incoming-Verification-mathematical.json')]:assert im[original]['sha256']==sha((S/replayed).read_bytes())
for path,n in zip(paths,['Incoming-roadmap.json','Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert ir['publicDeliverables'][path]==sha((S/n).read_bytes())
assert data('IncomingReceipt.json')['bothActualVerifiersByteEqual']
om=data('OwnPreviousManifest.json')
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='0ea223760b6800c275237cc9dc51952f8f8bb94600a39ca5a3be040df3125225'
for original,current in [('Reading.json','OwnPreviousReading.json'),('InputGuard.json','OwnPreviousInputGuard.json'),('Candidate.json','OwnPreviousCandidate.json')]:assert om[original]['sha256']==sha((S/current).read_bytes()),current
for original in om:
 if original.startswith('Own')and any(k in original for k in ['Reading','InputGuard','Manifest']):assert om[original]['sha256']==sha((S/('Own6081'+original)).read_bytes())
og={g['path']:g['sha256']for g in data('OwnPreviousInputGuard.json')}
reuse=data('OwnReadingReuse.json');assert len(reuse)==29 and sum(g['unchanged']for g in reuse)==20
for g in reuse:
 assert sha(blob(MATH,g['path']))==g['after']and og[g['path']]==g['before']
 assert g['unchanged']==(g['before']==g['after'])
own=data('OwnPreviousCandidate.json');assert old['nodes'][:751]==own['nodes']and old['baseline']['declarations'][:536]==own['baseline']['declarations']
supplier=data('SupplierContract.json');sp=blob(MATH,'research/blueprint/packets/SchemeAndStackFoundations.json')
assert supplier['packetSha256']==sha(sp)
sn={n['id']:n for n in json.loads(sp)['nodes']}
assert len(supplier['nodes'])==3 and all(sn[n['id']]==n for n in supplier['nodes'])
claim=data('ClaimReceipt.json');assert claim['issue']==3378 and claim['claim']==5983281521 and claim['confirmation']==5983282777
assert claim['wholeIssueCharacters']==18717 and claim['beforeAfterEqual']and claim['readBefore']==[[0,18000],[18000,18717]]and claim['readAfter']==[[0,18717]]
assert claim['bodySha256']=='518055d3920b403fce956f8b1f50def5fd3e13ca01eb40f0cd42b734a9fca979'
for rec,tag in zip(data('SourceReading.json'),['0ET0','0E25']):assert rec['sha256']==sha((S/(tag+'.html')).read_bytes())
refresh=data('PolicyRefresh.json');assert refresh['originalBase']==txt('PrePolicy-base.txt').strip() and refresh['currentBase']==MATH and refresh['status']=='complete'
assert len(refresh['changes'])==3
for c in refresh['changes']:
 assert sha(blob(refresh['originalBase'],c['path']))==c['before']and sha(blob(MATH,c['path']))==c['after']and c['readScope']
search=data('Search.json');assert search['names']==plan['newNames']and all(r['exitStatus']==1 and r['matches']==[]for r in search['searches'])
assert data('TouchingLinks.json')==[]
for ref in [MATH,BASE]:
 for path in subprocess.check_output(['git','ls-tree','-r','--name-only',ref,'--','research/blueprint/links'],cwd=R,text=True).splitlines():
  if path.endswith('.json'):
   link=json.loads(blob(ref,path));assert not [e for k in ['links','overlaps','examined']for e in link.get(k,[])if any(z in json.dumps(e)for z in [RID,'GenusOneFibrationsAndRationalEllipticSurfaces'])],path
assert sha(Path(sys.argv[2]).read_bytes())=='86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1'
tau=data('TauBuildScope.json');assert not tau['fullCanonicalCompiled'] and not tau['libraryBuildAttempted'] and tau['sourceTrackedClean']
assert tau['requiredSourceHead']=='f790474821cf4256814db967cb154e7af3d0c369'and len(tau['compiledImports'])==5 and not any(x['present']for x in tau['compiledImports'])
counter=data('SourceGapCounterexample.json');basis=counter['basis']
assert basis==[[int(i==j)for i in range(4)for j in range(4)]]+[[int(i==a and j==b)for i in range(4)for j in range(4)]for a,b in [(0,2),(0,3),(1,2),(1,3)]]
elements={tuple(sum(basis[j][i]for j in range(5)if mask>>j&1)%2 for i in range(16))for mask in range(32)}
assert len(elements)==32==counter['elements']and counter['ambientModuleDimension']==4 and counter['subalgebraDimension']==5
def multiply(a,b):return tuple(sum(a[4*i+k]*b[4*k+j]for k in range(4))%2 for i in range(4)for j in range(4))
assert all(multiply(a,b)in elements and multiply(a,b)==multiply(b,a)for a in elements for b in elements)
assert len(elements)**2==counter['checkedProducts']==1024
failed=data('InheritedFailedRecovery.receipt.json')
assert failed['exitStatus']==1 and failed['errors']==1 and failed['warnings']==0 and failed['availableGiBBefore']>=20
for n in ['FailedRecovery.lean','FailedRecovery.log','FailedRecovery.receipt.json','RecoveredTest.lean']:assert im['Inherited'+n]['sha256']==sha((S/('Inherited'+n)).read_bytes())
assert failed['sourceSha256']==sha((S/'InheritedFailedRecovery.lean').read_bytes())and failed['logSha256']==sha((S/'InheritedFailedRecovery.log').read_bytes())
assert '(kernel) deterministic timeout'in txt('InheritedFailedRecovery.log')
assert txt('InheritedFailedRecovery.lean')=='import Context\n'+txt('InheritedRecoveredTest.lean')
assert 'ConductorSubschemeChecked.nonreduced_conductor_section'in txt('SketchPrefix.lean')
assert 'ConductorSubschemeChecked.nonreduced_conductor_section'not in txt('NativePrefix.lean')
assert txt('Context.lean')==txt('NativePrefix.lean')
assert txt('Prototype.lean')=='import Context\n'+txt('NewProofs.lean')+'\n'+txt('NewTests.lean')+'\n'+txt('RecoveredTest.lean')
assert list(headers(txt('RecoveredTest.lean')).values())==list(headers(txt('InheritedRecoveredTest.lean')).values())
marker='-- test: ConductorSubschemeChecked.nonreduced_conductor_section'
for prefix in ['SketchPrefix.lean','CanonicalPrefix.lean']:
 block=txt(prefix).split(marker,1)[1].split('\nend ',1)[0]
 assert list(headers(block).values())[0]==list(headers(txt('RecoveredTest.lean')).values())[0]
failedmap=data('FailedSectionMap-Prototype.receipt.json')
assert failedmap['exitStatus']==1 and failedmap['sourceSha256']==sha((S/'FailedSectionMap-Prototype.lean').read_bytes())and failedmap['logSha256']==sha((S/'FailedSectionMap-Prototype.log').read_bytes())
assert '(kernel) excessive memory consumption'in txt('FailedSectionMap-Prototype.log')
for stem in ['Native','Sketch','Canonical']:assert txt(stem+'.lean').count(marker)==1
for stem in ['Context','Prototype']:
 rec=data(stem+'.receipt.json');assert rec['exitStatus']==rec['errors']==rec['warnings']==0 and rec['availableGiBBefore']>=20
 assert rec['sourceSha256']==sha((S/(stem+'.lean')).read_bytes())and rec['logSha256']==sha((S/(stem+'.log')).read_bytes())
comp={}
for stem,ex,want,audits in [('Native',362,0,655),('Sketch',381,928,20)]:
 rec=data(stem+'.receipt.json');log=txt(stem+'.log');b=(S/(stem+'.lean')).read_bytes()
 assert rec['exitStatus']==0 and rec['availableGiBBefore']>=20
 assert rec['sourceSha256']==sha(b)and rec['logSha256']==sha(log.encode())
 assert ': error'not in log and 'Exit status: 0'in log and 'timeout 1200'in log and '-j 1 -M 8192'in log
 assert log.count('warning:')==log.count('warning: declaration uses '+chr(96)+'sorry'+chr(96))==want
 assert len(re.findall(r'^example\b',b.decode(),re.M))==ex
 au=re.findall(r"'([^']+)' depends on axioms:\s*\[([^]]*)\]",log);assert len(au)==audits==rec['axiomAudits']
 assert 'sorryAx'not in log
 for name,axs in au:assert set(x.strip()for x in axs.replace('\n',' ').split(',')if x.strip())<={'propext','Classical.choice','Quot.sound'},(name,axs)
 if stem=='Native':assert set(plan['newNames'])<={n for n,_ in au}
 comp[stem]={**rec,'lines':len(b.splitlines()),'examples':ex}
changes={g['path']:g for g in data('PublicationChanges.json')}if BASE!=MATH else {}
for g in data('InputGuard.json'):
 assert sha(blob(MATH,g['path']))==g['sha256'],g['path']
 actual=sha(blob(BASE,g['path']))
 if g['path']in changes:
  c=changes[g['path']];assert c['before']==g['sha256']and c['after']==actual and c.get('readScope'),g['path']
 else:assert actual==g['sha256'],g['path']
sfpub=json.loads(blob(BASE,'research/blueprint/packets/SchemeAndStackFoundations.json'))
spn={n['id']:n for n in sfpub['nodes']}
assert all(spn[n['id']]==n for n in supplier['nodes'])
for ref in [MATH,BASE]:
 job=next(j for j in json.loads(blob(ref,'research/blueprint/queue.json'))['jobs']if j['id']=='DESIGN-'+RID);contract={k:v for k,v in job.items()if k not in ['state','note']}
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
assert check_blueprint.NODE_BUDGET==300 and len(nodes)>=check_blueprint.NODE_BUDGET
index=check_blueprint.load_index(Path(sys.argv[2]));assert index[0]is not None
errors,warnings,checker=check_blueprint.check(S/(RID+'.json'),index,check_blueprint.world());assert not errors and not warnings,(errors,warnings)
checker['packet']=paths[1]
issues=source_issues.check_issues(p['sourceIssues'],RID)
envelope={'roadmapId':RID,'protocol':'errata-v1','sourceIssues':p['sourceIssues'],'sourceVersions':[dict(kind=('preprint'if x['id']=='schroer'else'author copy'),url=x['url'],read=x.get('accessed'),sha256=x.get('sha256'),attribution='Inherited source record; no fresh erratum audit claimed')for x in p['sources']if x['id']in{f['source']for f in p['sourceIssues']}]}
issues+=check_errata.check(envelope,RID);assert not issues,issues
tree=ast.parse((R/'research/blueprint/intake.py').read_text());wanted={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id in {'ALLOWED','PRIVATE'}for t in n.targets)or isinstance(n,ast.FunctionDef)and n.name in wanted]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs']if j['id']=='DESIGN-'+RID)
problems=[x for f,t in contents.items()for x in env['file_problems'](f,t)];refusals=env['auto_refusals'](job,paths,False,{'codex-7e92bd'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'NERON_VALIDATE_BASE':BASE}));assert graph['auditBase']==BASE
print(json.dumps(dict(mathematicalBase=MATH,publicationBase=BASE,preservedWholeNodes=766,changedExisting={},newNodes=10,newAuthoredDeclarations=9,promotedExistingDeclaration='Subring.conductor_mem',newApi=0,newTests=5,newTestReferences=5,recoveredExactTest=plan['recoveredTest'],baselineDeclarations=546,rawApi=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),matchedNativeHeaders=9,matchedNewExamples=5,matchedRecoveredExample=True,checker=checker,compilation=comp,canonicalSha256=sha(txt('Canonical.lean').encode()),fullCanonicalCompiled=False,incomingArchiveAuthenticated=83,own6081ManifestAuthenticated=True,supplierScope='Exact3 current nodes freshly read and unchanged; retained incoming proofs authenticated. No peer personal-reading transfer.',guardsUnchanged=len(data('InputGuard.json'))-len(changes),publicationGuardChanges=list(changes.values()),indexSha256=sha(Path(sys.argv[2]).read_bytes()),intakeProblems=problems,intakeRefusals=refusals,sourceIssueErrors=issues,sourceVersionScope='All27 inherited findings retained whole. Fresh displayed0ET0 and0E25 statements/proofs/zero direct comments; linked histories and section comments not reread. Exact nilpotent-section formulas are authored deductions; no new source finding.',graph=graph,LeanExecuted=False),indent=2))
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
NAMES=['Incoming-roadmap.json', 'Incoming.json', 'IncomingReader.md', 'Incoming.lean', 'IncomingHandoff.md', 'IncomingManifest.json', 'Incoming-Verification.json', 'Incoming-Verification-mathematical.json', 'PreviousRecovery.json', 'IncomingReceipt.json', 'NativePrefix.lean', 'SketchPrefix.lean', 'CanonicalPrefix.lean', 'Native.lean', 'Native.log', 'Native.receipt.json', 'Sketch.lean', 'Sketch.log', 'Sketch.receipt.json', 'Canonical.lean', 'NewProofs.lean', 'NewTests.lean', 'RecoveredTest.lean', 'NewAdmitted.lean', 'Audits.lean', 'Context.lean', 'Context.log', 'Context.receipt.json', 'Prototype.lean', 'Prototype.log', 'Prototype.receipt.json', 'InheritedFailedRecovery.lean', 'InheritedFailedRecovery.log', 'InheritedFailedRecovery.receipt.json', 'InheritedRecoveredTest.lean', 'FailedSectionMap-Prototype.lean', 'FailedSectionMap-Prototype.log', 'FailedSectionMap-Prototype.receipt.json', 'Candidate-roadmap.json', 'Candidate.json', 'Reader.md', 'ReaderAddition.md', 'Suggested.lean', 'Handoff.md', 'HandoffBase.md', 'ClaimReceipt.json', 'Reading.json', 'Worklist.json', 'SourceReading.json', 'BaselineReading.json', 'BaselineRanges.json', 'OwnReadingReuse.json', 'OwnPreviousManifest.json', 'OwnPreviousReading.json', 'OwnPreviousInputGuard.json', 'OwnPreviousCandidate.json', 'SupplierContract.json', 'InputGuard.json', 'PublicationChanges.json', 'TouchingLinks.json', 'Plan.json', 'NewNodes.json', 'Verification-mathematical.json', 'Verification.json', 'SourceGapCounterexample.json', 'SourceFindingScope.json', 'Search.json', 'TauBuildScope.json', 'Graph.json', 'PolicyRefresh.json', 'PrePolicy-base.txt', 'PrePolicy-InputGuard.json', 'PrePolicy-OwnReadingReuse.json', 'PrePolicy-Verification-mathematical.json', 'base.txt', 'publication-base.txt', '0ET0.html', '0E25.html', 'Own6081Own6060InputGuard.json', 'Own6081Own6060Manifest.json', 'Own6081Own6060Reading.json', 'Own6081OwnInherited6039InputGuard.json', 'Own6081OwnInherited6039Manifest.json', 'Own6081OwnInherited6039Reading.json', 'Own6081OwnInherited6047InputGuard.json', 'Own6081OwnInherited6047Manifest.json', 'Own6081OwnInherited6047Reading.json', 'Own6081OwnPreviousInputGuard.json', 'Own6081OwnPreviousManifest.json', 'Own6081OwnPreviousReading.json', 'Own6081OwnReadingReuse.json', 'Own6081OwnSupplierInputGuard.json', 'Own6081OwnSupplierManifest.json', 'Own6081OwnSupplierReading.json', 'assemble.py', 'author.py', 'projection.py', 'write_handoff.py', 'verify.py', 'graph.py', 'immutable.py', 'compile.py', 'runcheck.py', 'package.py']
if mode=='archive':
 meta={n:dict(sha256=sha((S/n).read_bytes()),bytes=len((S/n).read_bytes()),lines=len((S/n).read_bytes().splitlines()))for n in NAMES}
 mb=(json.dumps(meta,indent=2,sort_keys=True)+'\n').encode();(S/'artifact-manifest.json').write_bytes(mb)
 payload={n:dict(sha256=sha((S/n).read_bytes()),data=base64.b64encode(zlib.compress((S/n).read_bytes(),9)).decode())for n in NAMES+['artifact-manifest.json']}
 pb=(json.dumps(payload,sort_keys=True,separators=(',',':'))+'\n').encode();(S/'payload.json').write_bytes(pb)
 report=dict(artifacts=len(NAMES),helpers=sum(n.endswith('.py')for n in NAMES),manifestSha256=sha(mb),payloadSha256=sha(pb))
 (S/'package.json').write_text(json.dumps(report,indent=2)+'\n')
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED CONDUCTOR NILPOTENT SECTION PAYLOAD\n'+pb+b'END ARCHIVED CONDUCTOR NILPOTENT SECTION PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('roadmaps','Candidate-roadmap.json'),('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated actual conductor nilpotent-section evidence; never executes Lean."""
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
pb=raw.split('/- BEGIN ARCHIVED CONDUCTOR NILPOTENT SECTION PAYLOAD\\n',1)[1].split('END ARCHIVED CONDUCTOR NILPOTENT SECTION PAYLOAD -/',1)[0].encode()
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

Archive commit `{archive}` is an ancestor changing only this issue's five deliverables. Its {p['artifacts']} inert artifacts include all {p['helpers']} authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `{p['manifestSha256']}`; payload SHA256 `{p['payloadSha256']}`. The final suggested file has no archive payload and equals Canonical.lean, whose full Tau-importing file remains UNCOMPILED.

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
"""Recover public authenticated actual conductor nilpotent-section evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='NeronModelsAndSemistableAbelianVarietiesPartII'
ARCHIVE='0bb0a88e7766565c8e36d3be82a3b1ce9e884cfc'
MANIFEST_SHA='606931b1339254544921c92ed2aabf7f9d2643d4e906c20d892792c694180d31'
PAYLOAD_SHA='962277eb5ed750a032d43c40a21dbaa708fa7742cb5cf4288778253a69a128ce'
EXPECTED={'roadmaps': '3a9d847717e602660a3083fd09d6f0cd71cbfb0d1f964c071e66680cc13844a0', 'packets': '2cf0ea0f7bfc56145b2e54de91555ec8eabaec25559573f5fa7a3929b443f0f7', 'readmes': 'ef98345c5025da059fc2ebb37fd3b2ff883755c52d3a0d97cd599d0e74b82490', 'suggested': '6f77ae834c6a8856218cc9a788ab933aa91d65671fe59511049e237d8ce125fb'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED CONDUCTOR NILPOTENT SECTION PAYLOAD\n',1)[1].split('END ARCHIVED CONDUCTOR NILPOTENT SECTION PAYLOAD -/',1)[0].encode()
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
