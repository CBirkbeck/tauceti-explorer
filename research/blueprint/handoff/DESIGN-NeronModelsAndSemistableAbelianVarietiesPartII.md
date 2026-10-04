# Conductor cokernel scalar extension — checkpoint

Agent: Codex — codex-rtOQ9t. Refs #3378. The design remains partial and every implementation remains unchecked.

For any commutative A-algebras B and F, the native scalar extension of the actual unit-image submodule satisfies (span_A{1_B}).baseChange F=span_F{1_(F⊗_A B)}. The existing F-linear tensor quotient equivalence then supplies conductorCokernelBaseChange: F⊗_A(B/span_A{1}) ≃ (F⊗_A B)/span_F{1}. It sends s⊗[b] to [s⊗b], with the inverse representative formula, and sends every s⊗[algebraMap(a)] to zero. No flatness, finiteness, injectivity, faithful flatness, Noetherianity or reducedness is needed for these comparisons. Zero rings and independent universes are allowed.

Transport through this actual F-linear equivalence identifies Ann_F(F⊗_A(B/span_A{1})) with the full inverse image of the actual conductor of the image subring of algebraMap F (F⊗_A B). This computes the recomputed conductor; it does not yet prove equality with the extension to F of the original conductor. The native proof keeps nilpotent scalars. The inherited conductor_eq_annihilator header uses a common universe, so its elementary membership calculation is repeated inside this particular independent-universe specialization without adding a second generic conductor-annihilator node.

For an actual A-algebra morphism h:B→D, conductorCokernelMap uses the native mapQ between the two unit-span quotients. Its representative, identity, composition and surjectivity laws use the actual algebra map; injective h is not asserted to induce an injective cokernel map. The F-linear comparison is natural on every tensor for the actual tensor-algebra morphism id_F⊗h. The two paths are equal both pointwise and as actual F-linear maps. The carrier, quotient, baseChange, tensor equivalence and algebra-map APIs remain their native Mathlib ones.

Thirteen nodes(2 constructions,11 lemmas),10 consumed API references and9 distinct typed examples(10 references) are appended. All696 incoming contracts remain:695 whole node objects are unchanged, and the exact existing conductor-finite-flat-base-change node gains only appended prerequisites/proof steps. Its statement, hypotheses, sources and acceptance conditions stay unchanged. Nine baseline declarations are appended to500 inherited ones. All29 planets,18 gaps,23 requests,78 source routes and seven partial stages remain. All26 old source findings are unchanged and one known corrected historical Stacks proof-reference finding is appended.

The tests include tensor sums, the actual inverse comparison, algebra-image vanishing, identity and composition of actual cokernel maps, and all-element naturality for B×D→B. The class of (2,0) in (Z/4×Z/4)/span_(Z/4){(1,1)} is nonzero, even though2 is nilpotent. Under the actual quotient algebra Z/4→Z/2, the comparison sends1⊗[(2,0)] to zero. Thus the tensor quotient comparison survives this nonflat base change while tensoring can kill a nonzero original quotient class. This is not a proof that the old conductor commutation theorem holds for nonflat bases.

## Reading and ownership

The whole18717-character issue was read before claiming and after bot5978421446 confirmed claim5978420498; the body SHA256 is `518055d3920b403fce956f8b1f50def5fd3e13ca01eb40f0cd42b734a9fca979` and both whole-read partitions are recorded in ClaimReceipt.json. WORKERS was reread, the blueprint unit-test/suggested-file and source-correction rules were freshly checked, and previous complete own continuous-session protocol/upstream readings retain their original scopes at unchanged controls.

The complete reviewed parentR11.1–R11.6 coverage row objects and reviewer metadata were freshly read before planning. There is no separate PartII row. The original own6030 full172-line historical review reading is authenticated and reused at its unchanged hash, without claiming a new full report audit. The exact reserved Ferrand node/API/tests, currentG0 coverage, flat-conductor node and whole first SF supplier request were freshly read. G1–6 and earlier source/upstream/touching-link obligations retain their authenticated original own scope. No manual whole696-node or full inherited-reader audit is claimed.

The current Scheme and Stack Foundations coverage and whole relevant finite-flat annihilator, element/generator, quotient/cokernel-annihilator, range-basechange, quotient-annihilator and quotient-square contracts were read. The generic finite-flat annihilator and generic tensor quotient adapters stay at SF.0. Its checkpoints describe their native proof evidence; this job does not independently replay all supplier proofs or duplicate their nodes. Our new code is the conductor-specific actual unit-image comparison and algebra-map naturality needed by the existing consumer. No request is closed by these narrower comparisons.

Incoming peer PR6060 at immutable head88266271c1d732728b08f4f066c1b90399e5ca9d was actually recovered over public HTTP. Its72 artifacts,10 archived/public-fence helpers and five final deliverables were authenticated. Both actual immutable verifiers reproduced their mathematical and publication reports byte-for-byte. The handoff mathematical narrative, recovery and helper code were read; this does not transfer the peer's personal source reading or constitute a fresh manual audit of all8790 native lines or all21 incoming proof bodies. All three exact Lean prefixes are bound to the incoming manifest.

Own6057's original reading and input guards, plus original own6044 and6030 reading records, were separately recovered and authenticated over public HTTP. OwnReadingReuse.json compares29 controls,23 unchanged and6 changed. Reuse is limited to those original scopes; matching hashes do not enlarge them. The changed five issue deliverables are bound to peer6060's actual recovery, and the changed SF0 supplier was freshly read at the explicit contract/frontier scope above. Reading.json records these limits.

BaselineReading.json enumerates the exact consumed declarations at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174, and BaselineRanges.json records actual bounded statement/ambient-binder readings and file hashes. NativePrefix's actual conductor definition/membership and inherited conductor-annihilator body were read before reuse. Exact conductorCokernel/conductorUnitSpan name searches in the stated pinned source directories returned no matches; this is not a general online absence survey.

Complete current displayed Stacks Lemmas10.12.10 and10.40.4 were read, including the page comments. The entire authors' July2025 correction patch aee70b2c90b64dc043aa7740e0d9c9346aa4323f was read and hashed. The known historical proof-reference finding is scoped to that patch fragment and current comments10136/10607: the corrected argument explicitly quantifies over all modules P and uses Hom exactness twice. No new error in the current statement is alleged. Section comments/history, whole historical source versions and an exhaustive whole-paper correction search were not read. SourceReading.json gives actual HTTP hashes/access times. Right exactness supplies context; the precise conductor specialization and Lean names are authored deductions. All26 earlier source findings retain their existing scopes, and the inherited F₂ block-matrix counterexample is independently checked by the verifier.

## Validation and limits

Native.lean preserves the entire authenticated8790-line prefix and appends13 native proof bodies,9 examples and13 axiom audits. The final whole native file passes the pin without errors, warnings or admissions; all584 audits contain only propext,Classical.choice and Quot.sound. The bounded Sketch preserves its exact5622-line prefix and adds the same13 headers and9 examples, with mathematical proofs admitted. Both concrete construction bodies are retained. Header comparisons bind the native and admitted declarations and examples exactly.

The full Tau-importing Canonical.lean/Suggested.lean is UNCOMPILED. Four explicit Mathlib imports precede its complete incoming prefix, then the13 new planning declarations and9 examples are appended. The fresh available-build probe records headcf386627e9176a3827c1a5fe804989fd94a4d216 rather than required Tau pinf790474821cf4256814db967cb154e7af3d0c369, with all five direct Tau compiled imports absent. The prescribed Tau source is pinned and tracked-clean. No Lake setup, cache download, library build or language server was used. Lean runs were serial with fresh memory≥20GiB, one thread,8GiB limit and1200-second timeout. Earlier prototype diagnostics were corrected; only the final successful prototype/native/sketch receipts are claimed.

- Native.lean: 9004 lines, 313 examples, 0 warnings, 584 axiom audits, exit0. Source SHA256 `49fe47ab6e56b837211bc3a05ed626e82c22aa169f7deaac5169d0c9bd87dc8f`; diagnostic SHA256 `f1d893d890604918f959f58d77892f34569136c2dc0c5020558c99167c538cc4`. Serial run: 43GiB available beforehand, 127.93s, 7302376KiB maximum RSS.
- Sketch.lean: 5782 lines, 332 examples, 820 warnings, 20 axiom audits, exit0. Source SHA256 `a986d78643362cae2b28bfa64f667af808f226656f44d73ad0d12263856069b8`; diagnostic SHA256 `21abb64627f038aeec8ca9cdb46376da5d46dfeb59037adcdf62032cfc7493e0`. Serial run: 42GiB available beforehand, 87.0s, 7115788KiB maximum RSS.

Suggested.lean equals Canonical.lean, SHA256 `ea972a89c82320e32abcef9f5b23dac5491f00156288409220793c711ff63cce`. The bounded Mathlib projection does not certify the full Tau-dependent file.

The actual indexed packet checker, source-issue and intake checks run from immutable mathematics base `f142d5038553b7fbe96b2cd62b612af9b32b930c` and publication control `156be4fe5c33da24d10259243acfb66c20acbd42`. The packet has709 nodes,509 baseline declarations,439 raw API references,425 raw test references,29 planets,18 gaps,23 requests and27 source findings. All owned dependencies resolve; actual checker/intake outputs appear in Verification.json. Queue non-state contracts and all29 input guards are checked against their exact git blobs.

The actual atlas assembler yields stage 3043/8727, own 709/1677 and scoped 3728/11311 vertices/edges, all acyclic. All69 required supplier paths are reachable. Whole foreign roadmaps/stages and all stage edges match the publication control. The45 unrelated preexisting missing restructure paths stay unchanged. There are no owned skipped or pending links.

## Resume

Use conductorUnitSpan_baseChange, conductorCokernelBaseChange with its representative/inverse/scalar/annihilator formulas, and conductorCokernelMap with its actual identity/composition/surjectivity and tensor-algebra naturality. The left-oriented conductor cokernel comparison now has native evidence, including nonflat and nonreduced tests.

Next realize the exact existing right-oriented conductor_flat_baseChange header by importing SF.0's finite-module flat-annihilator export, proving the actual finite quotient instance and transporting the left-oriented comparison through native tensor-algebra commutativity to includeRight. Native flat tensor inclusion injectivity already exists at the prescribed pin; reuse it. Then compare recomputed conductor ideal sheaves under actual flat scheme base change, with the affine quotient/tensor charts and actual restriction maps. Generic Ferrand algebraic-space existence and the scheme affine-neighborhood criterion remain separate. P¹/Proj, properness/projectivity, coherent H0/H1 and genus, separate I₂ and later classification/model obligations remain open. Keep every gap, request, source route and reserved Ferrand/small-étale-site obligation; this checkpoint does not complete the roadmap.

## Public recovery and replay

Archive commit `f838e772cc31031971ed61e2619db4155fe017ce` is an ancestor changing only this issue's suggested file. Its 75 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `07b21109ed85d0cf1a7446b4365bb40e44e40a3c65d8e2235f3f02dc74b95aba`; payload SHA256 `b9e289f3fb4f9032fdd8743418210f51115dcb0fa11e599f6d2890f0a6924a6f`. The final suggested file has no archive payload and equals Canonical.lean, whose full Tau-importing file remains UNCOMPILED.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count and all ten exact public helper fences, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set NERON_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Sketch.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. The full Tau-importing Canonical.lean/Suggested.lean is not covered by these checks and remains UNCOMPILED. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Helper: assemble.py

```python
"""Append conductor-specific headers and faithful native/admitted counterparts."""
from pathlib import Path
import re,sys
S=Path(sys.argv[1]).resolve();sys.path.insert(0,str(S))
from projection import admit_lemmas
def text(n):return (S/n).read_text()
proofs=text('NewProofs.lean');tests=text('NewTests.lean')
names=re.findall(r'^(?:noncomputable )?(?:def|lemma|theorem) (\w+)',proofs,re.M);assert len(names)==13
assert len(re.findall(r'^example\b',tests,re.M))==9
for name,body in [('NewAdmitted.lean',proofs),('TestsAdmitted.lean',tests)]:
 (S/name).write_text(admit_lemmas(body))
audits=''.join('#print axioms TauCeti.GenusOne.FerrandPushout.'+n+'\n'for n in names)
(S/'Audits.lean').write_text(audits)
addition=admit_lemmas(proofs)+'\n'+admit_lemmas(tests)
assert len(re.findall(r'\bsorry\b',addition))==20
(S/'CanonicalAddition.lean').write_text(addition)
imports='import Mathlib.LinearAlgebra.TensorProduct.Quotient\nimport Mathlib.LinearAlgebra.TensorProduct.Tower\nimport Mathlib.RingTheory.TensorProduct.Maps\nimport Mathlib.Algebra.Algebra.Prod\n'
(S/'ImportAddition.lean').write_text(imports)
(S/'Native.lean').write_text(text('NativePrefix.lean')+'\n'+proofs+'\n'+tests+'\n'+audits)
(S/'Sketch.lean').write_text(text('SketchPrefix.lean')+'\n'+admit_lemmas(proofs)+'\n'+admit_lemmas(tests))
(S/'Canonical.lean').write_text(imports+text('CanonicalPrefix.lean')+'\n'+addition)
(S/'Suggested.lean').write_text(text('Canonical.lean'))
```

## Helper: author.py

```python
"""Plan conductor-specific scalar extension; preserve generic supplier ownership and contracts."""
from pathlib import Path
import copy,csv,json,sys
S=Path(__file__).resolve().parent;RID='NeronModelsAndSemistableAbelianVarietiesPartII';P=RID+':G.0/';NS='TauCeti.GenusOne.FerrandPushout.'
def load(n):return json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
p=copy.deepcopy(load('Incoming.json'));road=load('Incoming-roadmap.json')
specs=[
('conductor-unit-span-base-change','conductorUnitSpan_baseChange','lemma','The extended algebra image is the unit span','For any commutative A-algebra B and A-algebra F, (span_A{1_B}).baseChange F equals span_F{1_(F⊗_A B)} as actual F-submodules. No flatness, injectivity or finiteness is required.',['mathlib:Submodule.baseChange_span','mathlib:Algebra.TensorProduct.one_def'],'Apply the native singleton-span base-change formula and identify 1⊗1 with the actual tensor-algebra unit.'),
('conductor-cokernel-base-change','conductorCokernelBaseChange','construction','Scalar extension of the conductor cokernel','Construct the actual F-linear equivalence F⊗_A(B/span_A{1}) ≃ (F⊗_A B)/span_F{1} by the existing tensorQuotientEquiv followed by quotient transport through conductorUnitSpan_baseChange. Both carriers are native module quotients.',['conductorUnitSpan_baseChange','mathlib:TensorProduct.AlgebraTensorModule.tensorQuotientEquiv','mathlib:Submodule.quotEquivOfEq'],'Compose the existing F-linear tensor quotient equivalence with the native quotient equivalence for equal submodules. This is the conductor specialization, not a new generic tensor quotient construction.'),
('conductor-cokernel-base-change-tensor','conductorCokernelBaseChange_tmul','lemma','The comparison on actual tensor representatives','The conductor cokernel comparison sends s⊗[b] to [s⊗b] for all s∈F and b∈B.',['conductorCokernelBaseChange'],'Reduce the two actual native equivalence components on representatives.'),
('conductor-cokernel-base-change-inverse','conductorCokernelBaseChange_symm_tmul','lemma','Inverse comparison on actual representatives','The inverse comparison sends [s⊗b] to s⊗[b].',['conductorCokernelBaseChange','conductorCokernelBaseChange_tmul'],'Apply injectivity of the actual comparison and its inverse law.'),
('conductor-cokernel-base-change-scalars','conductorCokernelBaseChange_scalar_zero','lemma','The actual algebra image vanishes in the quotient','The comparison sends s⊗[algebraMap A B(a)] to zero for every s∈F and a∈A.',['conductorCokernelBaseChange','mathlib:Submodule.mem_span_singleton'],'The class of algebraMap(a)=a•1 is zero in the native quotient before tensoring; use the actual equivalence map-zero law.'),
('conductor-cokernel-base-change-annihilator','conductorCokernelBaseChange_annihilator','lemma','The recomputed conductor annihilates the extended cokernel','Ann_F(F⊗_A(B/span_A{1})) equals the inverse image under algebraMap F (F⊗_A B) of the actual conductor of its image subring. This unconditional equality identifies the recomputed conductor; it does not assert equality with the extension of Ann_A(B/span_A{1}).',['conductorCokernelBaseChange','mathlib:LinearEquiv.annihilator_eq',P+'conductor-annihilator'],'Transport the annihilator through the actual F-linear comparison. The existing conductor-annihilator proof is repeated only inside this conductor specialization at independent universes because its inherited standalone header uses a common universe. Retain the full ideals and nilpotent elements.'),
('conductor-cokernel-algebra-map','conductorCokernelMap','construction','The conductor cokernel map of an algebra morphism','For an actual A-algebra morphism h:B→D, construct the A-linear map B/span_A{1}→D/span_A{1} by native mapQ and the fact that h preserves the unit. No injectivity or surjectivity is assumed.',['mathlib:Submodule.mapQ'],'Use the native quotient map after proving that the actual algebra homomorphism carries the unit span into the target unit span. No new quotient carrier is introduced.'),
('conductor-cokernel-algebra-map-representative','conductorCokernelMap_mk','lemma','The cokernel map on representatives','The actual cokernel map of h sends [b] to [h(b)].',['conductorCokernelMap'],'Reduce the native mapQ component on a quotient representative.'),
('conductor-cokernel-algebra-map-identity','conductorCokernelMap_id','lemma','Identity algebra maps induce identity cokernel maps','For the identity A-algebra morphism on B, conductorCokernelMap equals the native identity linear map on B/span_A{1}.',['conductorCokernelMap'],'Use quotient-linear-map extensionality and the actual identity algebra map.'),
('conductor-cokernel-algebra-map-composition','conductorCokernelMap_comp','lemma','Composition of actual algebra maps','For h:B→D and g:D→E, the conductor cokernel map of g∘h equals conductorCokernelMap(g) composed with conductorCokernelMap(h), as actual A-linear maps.',['conductorCokernelMap'],'Use native quotient-map extensionality and the actual composed algebra morphism on representatives.'),
('conductor-cokernel-algebra-map-surjectivity','conductorCokernelMap_surjective','lemma','Surjective algebra maps induce surjective cokernel maps','If an actual A-algebra morphism h:B→D is surjective, its conductor cokernel map is surjective. No claim is made for injective h.',['conductorCokernelMap','mathlib:Submodule.Quotient.mk_surjective'],'Lift an actual target quotient class to D and then lift its representative along the supplied surjective algebra morphism.'),
('conductor-cokernel-base-change-naturality','conductorCokernelBaseChange_natural','lemma','Naturality for actual algebra morphisms','For every h:B→D and x∈F⊗_A(B/span_A{1}), compare then apply the cokernel map of the actual tensor algebra map id_F⊗h equals extend conductorCokernelMap(h) then compare. The equality is on all tensors, with F-linearity retained.',['conductorCokernelBaseChange','conductorCokernelMap','mathlib:TensorProduct.AlgebraTensorModule.map','mathlib:Algebra.TensorProduct.map','mathlib:Submodule.Quotient.mk_surjective'],'Use native tensor induction; zero and addition use the actual linear maps. On pure tensors lift the quotient representative and reduce both actual paths to the same class [s⊗h(b)].'),
('conductor-cokernel-base-change-natural-square','conductorCokernelBaseChange_natural_map','lemma','The F-linear comparison square','The naturality equality is an equality of actual F-linear maps: E_D ∘ (id_F⊗conductorCokernelMap(h)) = conductorCokernelMap(id_F⊗h) ∘ E_B.',['conductorCokernelBaseChange_natural'],'Apply native linear-map extensionality to the all-tensor equality.')]
assert len(specs)==13
ids={name:P+slug for slug,name,*_ in specs}
common=['A,B,F,D,E are commutative rings in independent universes, including zero and nonreduced rings. B,F,D,E carry the indicated A-algebra structures; no finite, flat, faithful, injective, Noetherian or reduced hypothesis is imposed unless stated.','Tensor orientation is F⊗_A B, with its native left F-algebra/module structure. This checkpoint does not identify the inherited right-oriented B⊗_A F conductor map or global ideal-sheaf pullbacks.']
nodes=[]
for slug,name,kind,title,statement,deps,proof in specs:
 nodes.append(dict(id=P+slug,parentStageId=RID+':G.0',realises=[RID+':G.0'],kind=kind,title=title,declarationName=NS+name,statement=statement,hypotheses=common,prerequisites=[ids.get(d,d)for d in deps],proofSteps=[proof],acceptance=[statement,'Use the actual unit-image submodules, tensor-algebra maps and native module quotients, retaining nilpotents.'],library=dict(module='TauCeti/AlgebraicGeometry/GenusOne/G0',namespace=NS[:-1]),sources=[dict(sourceId='conductor-cokernel-rtOQ9t-00DF',locator='Complete Lemma10.12.10 displayed statement/proof; conductor specialization is authored',excerpt='right exact',match='Right exactness permits comparison without flatness. The unit-image identity and actual algebra-map naturality are conductor-specific deductions using the pinned native tensor quotient APIs.')],api=[],tests=[],implementationStatus='unchecked'))
by={n['declarationName'].split('.')[-1]:n for n in nodes}
testrows=[
('pure_tensor_sum','compatibility','The comparison sends s⊗[b]+t⊗[c] to the class of s⊗b+t⊗c in the actual quotient.'),
('inverse_tensor','compatibility','Its inverse sends the actual class of s⊗b to s⊗[b].'),
('scalar_image_zero','degenerate','The actual algebra image class s⊗[algebraMap(a)] maps to zero for all scalars.'),
('nonreduced_diagonal_class','computation','The class of (2,0) is nonzero in (Z/4×Z/4)/span_(Z/4){(1,1)}; nilpotent elements are retained.'),
('nonflat_quotient_tensor','degenerate','Under the actual quotient algebra Z/4→Z/2, the comparison sends 1⊗[(2,0)] to zero. Together with the preceding nonzero source class this records a class killed by nonflat scalar extension, while the quotient comparison itself still exists.'),
('map_representative','compatibility','For an actual algebra morphism h, the cokernel map sends [b+c] to [h(b)+h(c)].'),
('map_identity','degenerate','The cokernel map of the actual identity algebra morphism fixes every actual quotient class.'),
('map_composition','compatibility','The cokernel map of g∘h equals the composite of the two actual cokernel maps on every quotient class.'),
('natural_projection','compatibility','For the actual algebra projection B×D→B, the F-linear comparison square commutes on every extended quotient element.')]
tests={a:dict(name='ConductorCokernelChecked.'+a,kind=b,statement=c)for a,b,c in testrows}
assign={'conductorCokernelBaseChange':(['conductorCokernelBaseChange_tmul','conductorCokernelBaseChange_symm_tmul','conductorCokernelBaseChange_scalar_zero','conductorCokernelBaseChange_annihilator','conductorCokernelBaseChange_natural','conductorCokernelBaseChange_natural_map'],['pure_tensor_sum','inverse_tensor','scalar_image_zero','nonreduced_diagonal_class','nonflat_quotient_tensor','natural_projection']),'conductorCokernelMap':(['conductorCokernelMap_mk','conductorCokernelMap_id','conductorCokernelMap_comp','conductorCokernelMap_surjective'],['map_representative','map_identity','map_composition','natural_projection'])}
for name,(api,ts)in assign.items():
 by[name]['api']=[dict(name=NS+a,role='compatibility',statement=by[a]['statement'])for a in api]
 by[name]['tests']=[tests[t]for t in ts]
 by[name]['uses']=[dict(where=P+'conductor-finite-flat-base-change',how='Identify the actual conductor quotient and its natural maps before applying the existing SF.0 generic flat-annihilator export. The right-oriented and global conductor targets remain open.')]
existing=next(n for n in p['nodes']if n['id']==P+'conductor-finite-flat-base-change')
existing['prerequisites'] += [ids[a]for a in ['conductorUnitSpan_baseChange','conductorCokernelBaseChange','conductorCokernelBaseChange_annihilator']]+['SchemeAndStackFoundations:SF.0/flat-annihilator']
existing['proofSteps'].append('A native F-linear equivalence now identifies F⊗_A(B/span_A{1}) with the quotient by the actual base-changed unit span, without flatness. Its annihilator is the recomputed conductor for the left-oriented F⊗_A B. To realize this existing theorem, import the already owned SF.0 finite-module flat-annihilator export, then explicitly compare the left-oriented algebraMap with the inherited right-oriented includeRight map by the actual tensor commutativity equivalence. Global conductor ideal-sheaf pullback and restriction maps remain separate. No original statement, hypotheses or acceptance condition changes.')
p['nodes']+=nodes
rows=list(csv.reader(Path(sys.argv[1]).open(),delimiter='\t'));have={x['ref']for x in p['baseline']['declarations']};baseline=[];reading=[]
refs=sorted({d.removeprefix('mathlib:')for n in nodes for d in n['prerequisites']if d.startswith('mathlib:')}|{'ZMod.castHom','AlgHom.fst'})
for name in refs:
 row=next(r for r in rows if len(r)>5 and r[0]=='mathlib'and r[1]==name)
 reading.append(dict(name=name,file=row[3],line=int(row[4]),signature=row[5],scope='Actual statement and ambient binders read at the pin; exact bounded ranges and source hashes in BaselineRanges.json.'))
 if 'mathlib:'+name not in have:baseline.append(dict(ref='mathlib:'+name,kind=row[2],module=row[3],line=int(row[4]),provides=row[5]+' Reuse the actual tensor, quotient or algebra-map API.',checked='Codex — codex-rtOQ9t read this statement at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 on2026-10-04.'))
p['baseline']['declarations']+=baseline;save('BaselineReading.json',reading)
sources=[]
for row in load('SourceReading.json')[:2]:sources.append(dict(id='conductor-cokernel-rtOQ9t-'+row['tag'],title='Tensor right exactness'if row['tag']=='00DF'else'Finite flat annihilator supplier context',authors='The Stacks Project authors',edition='Current primary displayed page; read4October2026',url=row['url'],sha256=row['sha256'],accessed=row['accessed'],readSections=[row['scope'],'The actual unit-image comparison is an authored conductor specialization; the generic finite-flat annihilator theorem stays at SF.0.']))
p['sources']+=sources
correction=load('SourceReading.json')[2]
findings=[dict(id=RID+'/ErtOQ9t00DF1',source='conductor-cokernel-rtOQ9t-00DF',kind='misprint',locator='Historical proof-reference fragment in the complete public correction patch aee70b2c90b64dc043aa7740e0d9c9346aa4323f; current Lemma10.12.10 page comments10136/10607. Patch SHA256 '+correction['sha256']+'. Only this patch and the complete current displayed lemma/comments were read, not the whole historical source version.',printed='Using the pullback property again',correction='Use the exactness characterization by Hom into every R-module P, citing Lemma10.10.1(1) for both uses; quantify over P explicitly.',reason='The actual current proof transfers the Hom exact sequence through tensor-Hom adjunction and tests it for every P. The authors correction patch explicitly replaces the old proof reference and adds that quantifier.',affects='the proof',known='Corrected24July2025 by Stacks authors commit aee70b2c90b64dc043aa7740e0d9c9346aa4323f, acknowledged in current page comment10607; no new error in the current statement is alleged.',searched=['Complete current Lemma10.12.10 page, its two comments and the entire linked authors correction patch '+correction['url']+'. Section comments and whole historical source were not read.'])]
p['sourceIssues']+=findings
frontier='Thirteen conductor-specific declarations now identify the actual F-linear scalar-extension cokernel, its representative and inverse formulas, algebra-image vanishing, full recomputed-conductor annihilator and naturality for actual algebra morphisms. Two native constructions reuse the existing unit spans, quotient carriers and tensor equivalence; no flatness, injectivity or finiteness is needed for these comparisons. SF.0 continues to own its already proven generic finite-flat annihilator/quotient exports. Explicit transport to the inherited right-oriented B⊗_A F conductor theorem and global ideal-sheaf flat recomputation remain open, together with generic Ferrand algebraic-space existence, the scheme affine-neighborhood criterion, P¹/Proj, projectivity/properness, coherent cohomology/genus, separate I₂ and later model/classification obligations. All18 gaps,23 requests,78 routes and seven partial stages remain; implementations stay unchecked. The full Tau-dependent suggested file remains UNCOMPILED.'
p['summary']+=' Conductor cokernel scalar-extension continuation:13 declarations(2 constructions,11 lemmas),10 API references and9 distinct typed tests(10 references). All696 incoming contracts remain;695 whole node objects are unchanged and one existing flat-conductor node gains appended prerequisites/proof steps. One known corrected historical Stacks proof-reference finding is appended with its narrow version scope.'
next(x for x in p['coverage']if x['stageId']==RID+':G.0')['remaining'].append(frontier)
next(x for x in road['stages']if x['key']=='G.0')['description']+=' '+frontier
plan=dict(newNames=[n['declarationName']for n in nodes],newNodes=[n['id']for n in nodes],newApi=[a for n in nodes for a in n['api']],newTests=list(tests.values()),newBaseline=baseline,newSources=sources,newSourceIssues=findings,newGaps=[],changedExisting={existing['id']:['prerequisites','proofSteps']},existingNativeNames=[],frontier=frontier)
for n,x in [('Candidate.json',p),(RID+'.json',p),('Candidate-roadmap.json',road),('NewNodes.json',nodes),('Plan.json',plan)]:save(n,x)
intro='# Actual scalar extension of the conductor cokernel\n\n'+frontier+'\n\nThe comparison uses F⊗_A B with its native F-algebra structure. Tensor right exactness, rather than flatness, identifies its quotient by the actual unit span. The actual F-linear equivalence compares annihilators of these two quotients, retaining the full ideals. It identifies the recomputed conductor but does not yet compare it with the extension of the original conductor. Import the generic SF.0 finite-module flat-annihilator export for that step, and explicitly account for the inherited theorem’s opposite tensor orientation. Global ideal-sheaf and restriction-map comparisons remain required.\n\nThe two constructions have10 consumed API references and9 distinct typed examples. A nonzero nilpotent diagonal quotient class over Z/4 becomes zero under the actual quotient algebra to Z/2, while the quotient comparison itself still exists. Naturality uses actual tensor-algebra morphisms on all elements, including the product projection.\n\nAll696 inherited contracts are preserved; only one flat-conductor node receives appended proof/dependency instructions. The current Stacks right-exactness proof is used. Its authors’ July2025 correction patch supplies a known historical proof-reference finding, scoped to the read fragment and current page comments; this is not a whole historical version or whole-paper correction audit. Own previous reading is reused only at its original unchanged controls, and incoming peer recovery supplies provenance without transferring personal reading.\n\n'
parts=[intro]
for n in nodes:
 parts+=['## '+n['title']+'\n\n','**'+n['declarationName']+'** — '+n['statement']+'\n\n','Hypotheses: '+' '.join(n['hypotheses'])+'\n\n','Prerequisites: '+', '.join(n['prerequisites'])+'.\n\n','Proof: '+' '.join(n['proofSteps'])+'\n\n']
 for label,key in [('Consumed API','api'),('Typed examples','tests')]:
  if n[key]:parts+=[label+':\n\n']+['- **'+x['name']+'**: '+x['statement']+'\n'for x in n[key]]+['\n']
parts+=['## Known corrected source reference\n\n'+findings[0]['locator']+'\n\n'+findings[0]['correction']+' '+findings[0]['known']+'\n\n']
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
"""Write measured conductor quotient comparison and an explicit next mathematical frontier."""
from pathlib import Path
import hashlib,json,re
S=Path(__file__).resolve().parent
def txt(n):return (S/n).read_text()
def data(n):return json.loads(txt(n))
sha=lambda b:hashlib.sha256(b).hexdigest()
def line(stem):
 r=data(stem+'.receipt.json');b=(S/(stem+'.lean')).read_bytes();assert r['exitStatus']==0
 return f"- {stem}.lean: {len(b.splitlines())} lines, {len(re.findall(r'^example\b',b.decode(),re.M))} examples, {r['warnings']} warnings, {r['axiomAudits']} axiom audits, exit0. Source SHA256 `{sha(b)}`; diagnostic SHA256 `{r['logSha256']}`. Serial run: {r['availableGiBBefore']}GiB available beforehand, {r['elapsedSeconds']}s, {r['maxRssKiB']}KiB maximum RSS.\n"
g=data('Graph.json');claim=data('ClaimReceipt.json');p=data('Candidate.json');plan=data('Plan.json')
h=f'''# Conductor cokernel scalar extension — checkpoint

Agent: Codex — codex-rtOQ9t. Refs #3378. The design remains partial and every implementation remains unchecked.

For any commutative A-algebras B and F, the native scalar extension of the actual unit-image submodule satisfies (span_A{{1_B}}).baseChange F=span_F{{1_(F⊗_A B)}}. The existing F-linear tensor quotient equivalence then supplies conductorCokernelBaseChange: F⊗_A(B/span_A{{1}}) ≃ (F⊗_A B)/span_F{{1}}. It sends s⊗[b] to [s⊗b], with the inverse representative formula, and sends every s⊗[algebraMap(a)] to zero. No flatness, finiteness, injectivity, faithful flatness, Noetherianity or reducedness is needed for these comparisons. Zero rings and independent universes are allowed.

Transport through this actual F-linear equivalence identifies Ann_F(F⊗_A(B/span_A{{1}})) with the full inverse image of the actual conductor of the image subring of algebraMap F (F⊗_A B). This computes the recomputed conductor; it does not yet prove equality with the extension to F of the original conductor. The native proof keeps nilpotent scalars. The inherited conductor_eq_annihilator header uses a common universe, so its elementary membership calculation is repeated inside this particular independent-universe specialization without adding a second generic conductor-annihilator node.

For an actual A-algebra morphism h:B→D, conductorCokernelMap uses the native mapQ between the two unit-span quotients. Its representative, identity, composition and surjectivity laws use the actual algebra map; injective h is not asserted to induce an injective cokernel map. The F-linear comparison is natural on every tensor for the actual tensor-algebra morphism id_F⊗h. The two paths are equal both pointwise and as actual F-linear maps. The carrier, quotient, baseChange, tensor equivalence and algebra-map APIs remain their native Mathlib ones.

Thirteen nodes(2 constructions,11 lemmas),10 consumed API references and9 distinct typed examples(10 references) are appended. All696 incoming contracts remain:695 whole node objects are unchanged, and the exact existing conductor-finite-flat-base-change node gains only appended prerequisites/proof steps. Its statement, hypotheses, sources and acceptance conditions stay unchanged. Nine baseline declarations are appended to500 inherited ones. All29 planets,18 gaps,23 requests,78 source routes and seven partial stages remain. All26 old source findings are unchanged and one known corrected historical Stacks proof-reference finding is appended.

The tests include tensor sums, the actual inverse comparison, algebra-image vanishing, identity and composition of actual cokernel maps, and all-element naturality for B×D→B. The class of (2,0) in (Z/4×Z/4)/span_(Z/4){{(1,1)}} is nonzero, even though2 is nilpotent. Under the actual quotient algebra Z/4→Z/2, the comparison sends1⊗[(2,0)] to zero. Thus the tensor quotient comparison survives this nonflat base change while tensoring can kill a nonzero original quotient class. This is not a proof that the old conductor commutation theorem holds for nonflat bases.

## Reading and ownership

The whole18717-character issue was read before claiming and after bot{claim['bot']} confirmed claim{claim['claim']}; the body SHA256 is `{claim['bodySha256']}` and both whole-read partitions are recorded in ClaimReceipt.json. WORKERS was reread, the blueprint unit-test/suggested-file and source-correction rules were freshly checked, and previous complete own continuous-session protocol/upstream readings retain their original scopes at unchanged controls.

The complete reviewed parentR11.1–R11.6 coverage row objects and reviewer metadata were freshly read before planning. There is no separate PartII row. The original own6030 full172-line historical review reading is authenticated and reused at its unchanged hash, without claiming a new full report audit. The exact reserved Ferrand node/API/tests, currentG0 coverage, flat-conductor node and whole first SF supplier request were freshly read. G1–6 and earlier source/upstream/touching-link obligations retain their authenticated original own scope. No manual whole696-node or full inherited-reader audit is claimed.

The current Scheme and Stack Foundations coverage and whole relevant finite-flat annihilator, element/generator, quotient/cokernel-annihilator, range-basechange, quotient-annihilator and quotient-square contracts were read. The generic finite-flat annihilator and generic tensor quotient adapters stay at SF.0. Its checkpoints describe their native proof evidence; this job does not independently replay all supplier proofs or duplicate their nodes. Our new code is the conductor-specific actual unit-image comparison and algebra-map naturality needed by the existing consumer. No request is closed by these narrower comparisons.

Incoming peer PR6060 at immutable head88266271c1d732728b08f4f066c1b90399e5ca9d was actually recovered over public HTTP. Its72 artifacts,10 archived/public-fence helpers and five final deliverables were authenticated. Both actual immutable verifiers reproduced their mathematical and publication reports byte-for-byte. The handoff mathematical narrative, recovery and helper code were read; this does not transfer the peer's personal source reading or constitute a fresh manual audit of all8790 native lines or all21 incoming proof bodies. All three exact Lean prefixes are bound to the incoming manifest.

Own6057's original reading and input guards, plus original own6044 and6030 reading records, were separately recovered and authenticated over public HTTP. OwnReadingReuse.json compares29 controls,23 unchanged and6 changed. Reuse is limited to those original scopes; matching hashes do not enlarge them. The changed five issue deliverables are bound to peer6060's actual recovery, and the changed SF0 supplier was freshly read at the explicit contract/frontier scope above. Reading.json records these limits.

BaselineReading.json enumerates the exact consumed declarations at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174, and BaselineRanges.json records actual bounded statement/ambient-binder readings and file hashes. NativePrefix's actual conductor definition/membership and inherited conductor-annihilator body were read before reuse. Exact conductorCokernel/conductorUnitSpan name searches in the stated pinned source directories returned no matches; this is not a general online absence survey.

Complete current displayed Stacks Lemmas10.12.10 and10.40.4 were read, including the page comments. The entire authors' July2025 correction patch aee70b2c90b64dc043aa7740e0d9c9346aa4323f was read and hashed. The known historical proof-reference finding is scoped to that patch fragment and current comments10136/10607: the corrected argument explicitly quantifies over all modules P and uses Hom exactness twice. No new error in the current statement is alleged. Section comments/history, whole historical source versions and an exhaustive whole-paper correction search were not read. SourceReading.json gives actual HTTP hashes/access times. Right exactness supplies context; the precise conductor specialization and Lean names are authored deductions. All26 earlier source findings retain their existing scopes, and the inherited F₂ block-matrix counterexample is independently checked by the verifier.

## Validation and limits

Native.lean preserves the entire authenticated8790-line prefix and appends13 native proof bodies,9 examples and13 axiom audits. The final whole native file passes the pin without errors, warnings or admissions; all584 audits contain only propext,Classical.choice and Quot.sound. The bounded Sketch preserves its exact5622-line prefix and adds the same13 headers and9 examples, with mathematical proofs admitted. Both concrete construction bodies are retained. Header comparisons bind the native and admitted declarations and examples exactly.

The full Tau-importing Canonical.lean/Suggested.lean is UNCOMPILED. Four explicit Mathlib imports precede its complete incoming prefix, then the13 new planning declarations and9 examples are appended. The fresh available-build probe records headcf386627e9176a3827c1a5fe804989fd94a4d216 rather than required Tau pinf790474821cf4256814db967cb154e7af3d0c369, with all five direct Tau compiled imports absent. The prescribed Tau source is pinned and tracked-clean. No Lake setup, cache download, library build or language server was used. Lean runs were serial with fresh memory≥20GiB, one thread,8GiB limit and1200-second timeout. Earlier prototype diagnostics were corrected; only the final successful prototype/native/sketch receipts are claimed.

'''+line('Native')+line('Sketch')+f'''
Suggested.lean equals Canonical.lean, SHA256 `{sha((S/'Canonical.lean').read_bytes())}`. The bounded Mathlib projection does not certify the full Tau-dependent file.

The actual indexed packet checker, source-issue and intake checks run from immutable mathematics base `{txt('base.txt').strip()}` and publication control `{txt('publication-base.txt').strip()}`. The packet has709 nodes,509 baseline declarations,439 raw API references,425 raw test references,29 planets,18 gaps,23 requests and27 source findings. All owned dependencies resolve; actual checker/intake outputs appear in Verification.json. Queue non-state contracts and all29 input guards are checked against their exact git blobs.

The actual atlas assembler yields stage {g['stageDAG']['vertices']}/{g['stageDAG']['edges']}, own {g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']} and scoped {g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']} vertices/edges, all acyclic. All{g['requiredPairs']} required supplier paths are reachable. Whole foreign roadmaps/stages and all stage edges match the publication control. The{g['otherPreexistingMissingRestructurePairs']} unrelated preexisting missing restructure paths stay unchanged. There are no owned skipped or pending links.

## Resume

Use conductorUnitSpan_baseChange, conductorCokernelBaseChange with its representative/inverse/scalar/annihilator formulas, and conductorCokernelMap with its actual identity/composition/surjectivity and tensor-algebra naturality. The left-oriented conductor cokernel comparison now has native evidence, including nonflat and nonreduced tests.

Next realize the exact existing right-oriented conductor_flat_baseChange header by importing SF.0's finite-module flat-annihilator export, proving the actual finite quotient instance and transporting the left-oriented comparison through native tensor-algebra commutativity to includeRight. Native flat tensor inclusion injectivity already exists at the prescribed pin; reuse it. Then compare recomputed conductor ideal sheaves under actual flat scheme base change, with the affine quotient/tensor charts and actual restriction maps. Generic Ferrand algebraic-space existence and the scheme affine-neighborhood criterion remain separate. P¹/Proj, properness/projectivity, coherent H0/H1 and genus, separate I₂ and later classification/model obligations remain open. Keep every gap, request, source route and reserved Ferrand/small-étale-site obligation; this checkpoint does not complete the roadmap.
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
assert len(old['nodes'])==696 and len(nodes)==len(p['nodes'])==709
assert [n['id']for n in p['nodes'][:696]]==[n['id']for n in old['nodes']]
assert p['nodes'][696:]==data('NewNodes.json')and [n['id']for n in p['nodes'][696:]]==plan['newNodes']
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
assert p['baseline']['declarations']==old['baseline']['declarations']+plan['newBaseline']and len(p['baseline']['declarations'])==509
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
for n in p['nodes'][696:]:assert n['statement']in txt('ReaderAddition.md')and n['declarationName']in txt('ReaderAddition.md')
for item in plan['newApi']+plan['newTests']:assert item['name']in txt('ReaderAddition.md')and item['statement']in txt('ReaderAddition.md')
assert len(plan['newApi'])==10 and len(plan['newTests'])==9
assert sum(len(n.get('tests',[]))for n in data('NewNodes.json'))==10
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
assert nh==headers(txt('NewAdmitted.lean'))and nt==headers(txt('TestsAdmitted.lean'))and len(nh)==13 and len(nt)==9
existing=[]
extra=txt('NewAdmitted.lean');prior=txt('CanonicalPrefix.lean')
assert txt('CanonicalAddition.lean')==extra+'\n'+txt('TestsAdmitted.lean')
assert txt('Canonical.lean')==txt('ImportAddition.lean')+prior+'\n'+txt('CanonicalAddition.lean')==txt('Suggested.lean')
assert txt('Native.lean')==txt('NativePrefix.lean')+'\n'+txt('NewProofs.lean')+'\n'+txt('NewTests.lean')+'\n'+txt('Audits.lean')
assert txt('Sketch.lean')==txt('SketchPrefix.lean')+'\n'+txt('NewAdmitted.lean')+'\n'+txt('TestsAdmitted.lean')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',txt('Native.lean'))
assert {t['name']for t in plan['newTests']}==set(re.findall(r'^-- test: (.+)$',txt('NewTests.lean'),re.M))
assert txt('Incoming.lean')==prior
im=data('IncomingManifest.json');ir=data('PreviousRecovery.json')
assert ir['head']=='88266271c1d732728b08f4f066c1b90399e5ca9d'and ir['artifactsVerified']==72 and ir['archivedHelpersVerified']==10
assert sha((S/'IncomingManifest.json').read_bytes())=='dde63f3028cfe79790175a6cbdc32d1bbd0ebb2902ed6151f9394641aa52f1d8'
for name,prefix in [('Native.lean','NativePrefix.lean'),('Sketch.lean','SketchPrefix.lean'),('Canonical.lean','CanonicalPrefix.lean')]:assert im[name]['sha256']==sha((S/prefix).read_bytes()),name
assert (S/'PreviousVerification.json').read_bytes()==(S/'IncomingPublicationVerification-replayed.json').read_bytes()
assert (S/'PreviousMathematicalVerification.json').read_bytes()==(S/'IncomingMathematicalVerification-replayed.json').read_bytes()
assert ir['publicHelperFencesVerified']==10
for path,n in zip(paths,['Incoming-roadmap.json','Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert ir['publicDeliverables'][path]==sha((S/n).read_bytes())

# Preserve own previous reading attribution at exact controls, without asserting fresh full reading.
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='152ccad4e07f1dc49a186703577c2567240999a978c187bb74905125d3d325d2'
om=data('OwnPreviousManifest.json')
for original,current in [('Reading.json','OwnPreviousReading.json'),('InputGuard.json','OwnPreviousInputGuard.json')]:assert om[original]['sha256']==sha((S/current).read_bytes())
og={g['path']:g['sha256']for g in data('OwnPreviousInputGuard.json')}
reuse=data('OwnReadingReuse.json');assert len(reuse)==29 and sum(g['unchanged']for g in reuse)==23
for g in reuse:
 assert sha(blob(MATH,g['path']))==g['after']
 assert og[g['path']]==g['before']
 assert g['unchanged']==(g['before']==g['after'])
for original,current in [('OwnPreviousReading.json','OwnOriginal6044Reading.json'),('OwnInheritedReading.json','OwnOriginal6030Reading.json')]:
 assert om[original]['sha256']==sha((S/current).read_bytes())
claim=data('ClaimReceipt.json');assert claim['issue']==3378 and claim['session']=='codex-rtOQ9t'
assert claim['claim']==5978420498 and claim['bot']==5978421446 and claim['beforeAfterEqual']
assert claim['characters']==18717 and claim['beforeReads']==[[0,13500],[13500,18717]] and claim['afterReads']==[[0,11000],[11000,18717]]
assert claim['bodySha256']=='518055d3920b403fce956f8b1f50def5fd3e13ca01eb40f0cd42b734a9fca979'
assert txt('ImportAddition.lean')=='import Mathlib.LinearAlgebra.TensorProduct.Quotient\nimport Mathlib.LinearAlgebra.TensorProduct.Tower\nimport Mathlib.RingTheory.TensorProduct.Maps\nimport Mathlib.Algebra.Algebra.Prod\n'

# Bind fresh displayed-source receipts to their actual archived HTTP bytes.
for row,name in zip(data('SourceReading.json'),['00DF.html','07T8.html','00DF-correction.patch']):
 assert row['sha256']==sha((S/name).read_bytes()),name
finding=plan['newSourceIssues'][0]
assert finding['printed'] in txt('00DF-correction.patch')
assert 'aee70b2c90b64dc043aa7740e0d9c9346aa4323f' in finding['known']
assert 'For every $R$-module $P$' in txt('00DF-correction.patch')
assert sha(Path(sys.argv[2]).read_bytes())=='86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1'

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
for stem,ex,want,audits in [('Native',313,0,584),('Sketch',332,820,20)]:
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
problems=[x for f,t in contents.items()for x in env['file_problems'](f,t)];refusals=env['auto_refusals'](job,paths,False,{'codex-rtOQ9t'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'NERON_VALIDATE_BASE':BASE}));assert graph['auditBase']==BASE
print(json.dumps(dict(mathematicalBase=MATH,publicationBase=BASE,preservedContracts=696,preservedWholeNodes=695,changedExisting=changed,newNodes=13,newApi=10,newTests=9,newTestReferences=10,baselineDeclarations=509,rawApi=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),matchedNativeHeaders=13,matchedExistingHeaders=0,matchedExamples=9,checker=checker,compilation=comp,canonicalSha256=sha(txt('Canonical.lean').encode()),fullCanonicalCompiled=False,incomingArchiveAuthenticated=72,guardsUnchanged=len(data('InputGuard.json'))-len(changes),publicationGuardChanges=list(changes.values()),indexSha256=sha(Path(sys.argv[2]).read_bytes()),intakeProblems=problems,intakeRefusals=refusals,sourceIssueErrors=issues,sourceVersionScope='All26 inherited findings retained whole; one known corrected historical Stacks00DF proof-reference finding added from complete correction patch and current page comments. Complete current displayed00DF/07T8 statements/proofs read, not their section comments/history or whole historical versions. Conductor quotient/naturality proofs are authored specializations.',graph=graph,LeanExecuted=False),indent=2))
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
BASE = os.environ.get('NERON_VALIDATE_BASE', 'f142d5038553b7fbe96b2cd62b612af9b32b930c')
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
NAMES='Incoming-roadmap.json Incoming.json IncomingReader.md Incoming.lean IncomingHandoff.md IncomingManifest.json\nIncomingPublicationVerification-replayed.json IncomingMathematicalVerification-replayed.json NativePrefix.lean SketchPrefix.lean CanonicalPrefix.lean\nNative.lean Native.log Native.receipt.json Sketch.lean Sketch.log Sketch.receipt.json Canonical.lean CanonicalAddition.lean ImportAddition.lean\nNewProofs.lean NewTests.lean NewAdmitted.lean TestsAdmitted.lean Audits.lean Prototype.lean Prototype.log Prototype.receipt.json\nCandidate-roadmap.json Candidate.json Reader.md ReaderAddition.md Suggested.lean Handoff.md HandoffBase.md\nClaimReceipt.json Reading.json SourceReading.json BaselineReading.json BaselineRanges.json OwnReadingReuse.json\nOwnPreviousReading.json OwnPreviousInputGuard.json OwnPreviousManifest.json OwnOriginal6044Reading.json OwnOriginal6030Reading.json\nInputGuard.json PublicationChanges.json Plan.json NewNodes.json PreviousHead.txt PreviousRecovery.json PreviousVerification.json PreviousMathematicalVerification.json Verification-mathematical.json Verification.json\nSourceGapCounterexample.json Search.json TauBuildScope.json Graph.json base.txt publication-base.txt 00DF.html 07T8.html 00DF-correction.patch\nassemble.py author.py projection.py write_handoff.py verify.py graph.py immutable.py compile.py runcheck.py package.py'.split()
if mode=='archive':
 meta={n:dict(sha256=sha((S/n).read_bytes()),bytes=len((S/n).read_bytes()),lines=len((S/n).read_bytes().splitlines()))for n in NAMES}
 mb=(json.dumps(meta,indent=2,sort_keys=True)+'\n').encode();(S/'artifact-manifest.json').write_bytes(mb)
 payload={n:dict(sha256=sha((S/n).read_bytes()),data=base64.b64encode(zlib.compress((S/n).read_bytes(),9)).decode())for n in NAMES+['artifact-manifest.json']}
 pb=(json.dumps(payload,sort_keys=True,separators=(',',':'))+'\n').encode();(S/'payload.json').write_bytes(pb)
 report=dict(artifacts=len(NAMES),helpers=sum(n.endswith('.py')for n in NAMES),manifestSha256=sha(mb),payloadSha256=sha(pb))
 (S/'package.json').write_text(json.dumps(report,indent=2)+'\n')
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED CONDUCTOR COKERNEL BASE CHANGE PAYLOAD\n'+pb+b'END ARCHIVED CONDUCTOR COKERNEL BASE CHANGE PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('roadmaps','Candidate-roadmap.json'),('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated conductor cokernel scalar extension evidence; never executes Lean."""
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
pb=raw.split('/- BEGIN ARCHIVED CONDUCTOR COKERNEL BASE CHANGE PAYLOAD\\n',1)[1].split('END ARCHIVED CONDUCTOR COKERNEL BASE CHANGE PAYLOAD -/',1)[0].encode()
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
"""Recover public authenticated conductor cokernel scalar extension evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='NeronModelsAndSemistableAbelianVarietiesPartII'
ARCHIVE='f838e772cc31031971ed61e2619db4155fe017ce'
MANIFEST_SHA='07b21109ed85d0cf1a7446b4365bb40e44e40a3c65d8e2235f3f02dc74b95aba'
PAYLOAD_SHA='b9e289f3fb4f9032fdd8743418210f51115dcb0fa11e599f6d2890f0a6924a6f'
EXPECTED={'roadmaps': '7df7f3895cffceeba51806a6ca6ba74c959a4d0d9ae7ce83db06d6b9d9ac491c', 'packets': 'c75df03d3c0cb12918ab86395c01971bec4168ba7d1fd100bd6ef89539dda616', 'readmes': 'f738b256dc0f0b1704126027fa56caef53101af5d0753f91bd5f92f1a052bd0a', 'suggested': 'ea972a89c82320e32abcef9f5b23dac5491f00156288409220793c711ff63cce'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED CONDUCTOR COKERNEL BASE CHANGE PAYLOAD\n',1)[1].split('END ARCHIVED CONDUCTOR COKERNEL BASE CHANGE PAYLOAD -/',1)[0].encode()
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
