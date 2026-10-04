# Finite projective affine dual parameter connections — checkpoint

Codex — codex-7e92bd. Refs #3371. Partial; every implementation remains unchecked.

The existing actual affine preconnection D now has a same-parameter dual on the native module E∨ whenever E is finite projective. First construct the additive covector pairing B_D(φ)(e)=λd₀(φ(e))−lid((φ⊗id_W)D(e)). Its value is R-linear in e: the derivation and preconnection scalar corrections cancel. This first construction works for arbitrary E. Its scalar correction in φ is B_D(aφ)=aB_D(φ)+λφ.smulRight(d₀a). At parameter 0 it is the negative contraction.

For finite projective E, apply the inverse native dualTensorHomEquiv to B_D. This gives the actual additive operator D∨:E∨→E∨⊗W, and the proved correction gives its λ-Leibniz equation. The native tensor-Hom equivalence supplies the evaluation formula and uniqueness among same-λ preconnections. No basis is selected. Generic module dual, contraction, tensor-Hom equivalence and bidual equivalence are pinned Mathlib and are not replanned.

Native contraction E∨⊗E→R is horizontal from the actual tensor D∨⊗D to the actual unit λd. The proof uses native tensor induction, the inherited right commutor and inverse associator, and the covector evaluation formula. Apply the inherited curvature transport through contraction and the actual tensor/unit curvature formulas to obtain, for arbitrary λ,

κ_D∨(φ)(e)+φ(κ_D(e))=λ(d₀λ∧d₀(φ(e))).

The order d₀λ first is retained. Contractions here use the native tensor-Hom map and left unitor into the degree-two module Z. When d₀λ=0 the correction vanishes, giving the negative dual-curvature formula and preservation of flatness. Native dual maps of horizontal R-linear maps between finite projectives are horizontal in the contravariant direction. The native finite-projective bidual equivalence and its inverse are horizontal for arbitrary λ; curvature transport through it gives reflection of flatness when d₀λ=0.

The base rings k,R are commutative with the given k-algebra map; E,W,Z retain independent module universes. Ω is the existing supplied degree-zero/one/two calculus, with the actual derivation, additive exterior differential and alternating wedge. The inherited unit/curvature and inverse-horizontal APIs retain IsScalarTower k R W. No field, characteristic, reducedness, smoothness, global basis or flatness of the form modules is imposed. The finite-projective hypothesis is explicit only where native tensor-Hom/bidual equivalences are used. The raw dual and horizontal-map constructions allow variable λ; the global reserved finite locally free integrable key still requires relatively constant λ and actual ringed-site sheaf operations.

All 508 incoming node objects,256 baseline objects,149 routed obligations,35 omissions,five supplier requests,eleven gap objects,two source issues and six planets are preserved whole. The continuation adds 15 nodes:2 constructions and 13 lemmas,14 new baseline declarations,13 API references and 14 test references to12 distinct typed examples. Each construction has at least three API items and tests. The covector tests check linearity in e, additivity in φ and the zero-parameter scalar law. The dual tests check actual Leibniz, negative Higgs evaluation, horizontal pairing, the conditional obstruction to dropping a nonzero curvature correction, bidual roundtrip and zero-parameter flatness equivalence. Over Z[x] with λ=x and d₀x=1, D=λd and φ=x·id, both the covector pairing and dual evaluation at 1 equal x. Over Z/4 with zero calculus and D(r)=r⊗3, both values at the identity covector and 1 equal 1, distinct from 3;2 is nonzero and square-zero. The zero module Fin0→R has identically zero dual operator. These explicit fixtures are free modules; no projective-but-not-free fixture or concrete nonzero two-form correction is claimed.

Dual base-change comparison with the existing actual affine pullback, coevaluation/rigidity and universal exterior-power comparisons remain open, as do actual E1 sheaf tensor/restriction/equality detection/effective gluing. No generic sheaf/module construction is duplicated. H.0 remains partial and H.1–H.8 not_read; determinant/Tate/period, arbitrary-Q tensor-valued-shuffle, source-route and later-stage obligations remain. Earlier frontier prose is preserved checkpoint history.

## Reading and authenticated incoming evidence

The complete 22198-character issue was read before claim 5980850853 and again after exact numeric bot confirmation 5980852001, in the two intervals recorded in ClaimReceipt.json. Body SHA256 `43c656497ac194e02aa80ad85ad5579caf8bc5eb4d95cac4ff4c15e65eac3c69`. WORKERS was freshly read whole. PROTOCOL1–245 and365–575 were refreshed, and the original whole expansion-protocol/upstream-guide scopes are retained from this continuous loop.

Incoming peer PR #6071 at head 98cde59336113009e93a70a7842061d931064fba was actually recovered over public HTTP from archive bc576c97885270cd2af4f92d01863ce8b50ef0f2. Its 76 artifacts,10 helpers and five final public deliverables authenticated against manifest 9aad3a4726f76bf0546f26e905881332bd96984bb6b8a5a02a8bbbaa0b6516a5. Both actual original mathematical and publication verifier reports were reproduced byte-for-byte from the repository cwd. The complete peer 15 new proofs and seven new tests, mathematical handoff prefix through recovery instructions, recovery code and actual verification/immutable/graph helpers were personally read. The previous peer 6066 nineteen-proof block was not freshly manually audited; the entire incoming 5675-line native prefix is authenticated and its proofs replayed in the final whole-file run. The complete 7272-line canonical prefix is likewise preserved. No peer reading claim is adopted as personal reading.

Own PR #6062 manifest a457bc844e43bbdbcbe384ca2951ead0954d408c334363938a349261e9f26a79 authenticates Own6062Reading/InputGuard and its retained own 6053 and 6041 reading envelopes. All three complete own Reading records were personally reread. OwnReadingReuse.json records 37 unchanged controls and five advanced deliverables among 42 guarded files. Only original scopes on unchanged controls are reused; all 474 own6062 node objects remain whole in the current 508-node prefix.

Fresh scopes include all four complete reviewed parent Hodge AUDIT-02 rows L0–L3, review metadata and the whole REV-AUDIT-02 report; no PartII row exists. The complete reserved key and keydef entry, all five requests, full H.0 description, latest three remaining entries, all eleven gap objects and current intrinsic-dual/dual-curvature nodes were read. Structured touching-link scans across research links, data links and accepted restructures found zero touching entries; TouchingLinks.json is empty. Reading.json records consumed native-prefix ranges 1–185,319–435,630–766 and937–1055 and authenticates the original broader own supplier/source/upstream-reader scopes.

Fresh native source reading covers Contraction.lean 1–180,235–320; Dual/Defs.lean 72–102,107–141,202–238; Dual/Lemmas.lean 124–155,251–270; TensorProduct/Map.lean 145–169. BaselineReading.json binds all 15 consumed declarations,one already present and 14 added, to exact index rows and pinned source hashes. All 15 specialized proposed names had zero literal matches in bounded searches of both pinned source trees; this is not an exhaustive absence claim. The existing generic finite-projective equivalences and native reflexivity instance are reused.

The complete current displayed [Stacks07J5](https://stacks.math.columbia.edu/tag/07J5) section, displayed proof and both public comments, and [Stacks0FNJ](https://stacks.math.columbia.edu/tag/0FNJ) Lemma15.74.1, all three parts and complete displayed proof diagram, were read. The latter has zero lemma comments; it links to two section-level comments that were not read. SourceReading.json binds both actual HTTP byte streams, hashes and access times. Linked categorical proofs and whole paper/version histories were not recursively read. The incoming authenticated07J5 historical correction patch was personally read; both inherited source issues remain unchanged, with no new source finding. These sources provide ordinary-connection and finite-projective evaluation context; the arbitrary-λ affine identities and correction are authored deductions from the existing actual constructions and pinned native APIs.

## Validation

The full suggested file equals the whole Mathlib-only Canonical.lean compiled at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, Lean 4.34.0-rc2 commit 6a10ac8c22beadecabdbb0919c2b50214762f91d. The runner checks exact library/compiler/dependency pins, tracked cleanliness, fresh free memory≥20GiB, one thread,8192MiB managed-memory bound and 1200-second timeout. Each compile completed before another compiler, source edit or rebase. The own Context object accelerated prototypes only; the final Native replay elaborates the entire source. No Lake setup/cache/library build or language server was used. One command with a mistyped compiler path failed before invoking Lean, then the correct existing compiler was used.

- Native.lean: 6055 lines, 164 examples, exit0, 0 warnings, 306 axiom audits; 39GiB available before compilation, 123.52 seconds, peak 4071280KiB. Source SHA256 `a417d8f16534f93d0aaeaa3fc835c2f631998e408ac145ba6a26672722e948c8`; diagnostic SHA256 `099611b588744b7195ff134bb1825894283be374e4889e6e2d16ff5a61b09700`.
- Canonical.lean: 7494 lines, 361 examples, exit0, 870 warnings, 0 axiom audits; 39GiB available before compilation, 61.19 seconds, peak 3667272KiB. Source SHA256 `aa19f00b68d7bcf32ae25c8ae4fe4678c627ffa8570733f4ac9689b6708a78d6`; diagnostic SHA256 `1c601728f64ab6fccc043896e3ed982d9c0bab48e3f4b389f7a9953e7994fbe6`.

All 306 native audits contain only propext,Classical.choice and Quot.sound, with zero warnings,errors,admissions or sorryAx references. Canonical has 870 admission warnings only: 845 inherited and 25 new explicit lemma/example admissions. Both new data constructions remain concrete. All 15 new declaration and 12 example headers agree exactly with the admitted projection. Suggested.lean is the entire compiled Canonical.lean, SHA256 `aa19f00b68d7bcf32ae25c8ae4fe4678c627ffa8570733f4ac9689b6708a78d6`. This validates the affine artifacts only; no implementation status or global coverage is promoted.

The actual indexed blueprint checker, source-issue checker, immutable intake/file rules and atlas assembler pass without errors or warnings. The packet has 523 nodes,270 baseline declarations,497 raw API references and466 raw test references. The stage DAG has 3022 vertices/8663 edges; the own declaration DAG has 523/992; the scoped DAG has 3540/10222. All are acyclic, with524 reachable declarations,252 baseline leaves and all 21 supplier pairs reachable. Every foreign roadmap/stage and all stage-edge objects equal their immutable controls; no own skipped/pending link exists.

Mathematical base `2c13f576bc3ed3f140fe8cabbc530c91d8cb151e`; publication base `859c166d237f3ffaaefb10e6d59b9cf0fce89671`. All 42 input guards and the issue's mathematical contract agree between bases. The publication refresh only advanced other-job files and queue state; PublicationChanges.json records it. Declaration-index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Both verifier reports execute actual immutable checker/intake/atlas code without Lean or a repository snapshot. Actual public HTTP recovery and both recovered reports must authenticate byte-for-byte before opening the PR.

## Resume

Continue the connection-specific dual base-change comparison: identify S⊗E∨ with (S⊗E)∨ using native finite-projective Hom/base-change APIs, then prove the actual comparison horizontal for the existing calculus morphism and affinePullback operator, including derivatives of new S-scalars. Prove compatibility with evaluation and both bidual maps before packaging categorical duality. Keep coevaluation/rigidity and universal exterior-power comparisons explicit, and continue genuine E1 sheaf restriction/descent without duplicating its supplier objects. Preserve all149 routes,35 omissions,five requests,eleven gaps,two source issues,later-source obligations and the relatively constant parameter in the global key.

## Public recovery and replay

Archive commit `c6b742eca1ad8312e6c1fe1eee535c5f6f89b1b5` is an ancestor changing only this issue's suggested file. Its 76 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `5d80a54366399e2d3d7a45b602890357a50c3f16f030e3fadd381c9ad72b95b9`; payload SHA256 `5f764f33195a48690d3a9afa697af792ea289537a75cda2749cb7bc80b15e2d7`. The final suggested file has no archive payload and equals the entire compiled Mathlib-only Canonical.lean.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set HODGE_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Canonical.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean and Suggested.lean are byte-equal and the whole file was compiled. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

```python
"""Recover public authenticated affine finite-projective dual evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='HodgeStructuresPartII'
ARCHIVE='c6b742eca1ad8312e6c1fe1eee535c5f6f89b1b5'
MANIFEST_SHA='5d80a54366399e2d3d7a45b602890357a50c3f16f030e3fadd381c9ad72b95b9'
PAYLOAD_SHA='5f764f33195a48690d3a9afa697af792ea289537a75cda2749cb7bc80b15e2d7'
EXPECTED={'roadmaps': '17cd8ca38bffe00977e4f7e624d00cdb6c3274051ee5ac06673a60ffd6bf47f3', 'packets': '6eaf1b0488cd12d6126cd5c292b34878dfc851de1555b420456eb50a15cb7e56', 'readmes': 'ed9315634c72be1319fd951864826ec63e08d7343e30bd1cc9deeae1e7411656', 'suggested': 'aa19f00b68d7bcf32ae25c8ae4fe4678c627ffa8570733f4ac9689b6708a78d6'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED AFFINE FINITE PROJECTIVE DUAL PAYLOAD\n',1)[1].split('END ARCHIVED AFFINE FINITE PROJECTIVE DUAL PAYLOAD -/',1)[0].encode()
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
helpers=[n for n in meta if n.endswith('.py')]
for name in helpers:
 c=handoff.split('## Script: '+name+'\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
 assert c==(S/name).read_text(),name
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```

## Script: assemble.py

```python
"""Preserve full incoming files; insert explicit Mathlib imports and append new signatures."""
from pathlib import Path
import re
from projection import project
S=Path(__file__).resolve().parent
t=lambda n:(S/n).read_text()
def imports(text):
 i=text.index('import ')
 return text[:i]+t('NewImports.lean')+'\n'+text[i:]
(S/'NewAdmitted.lean').write_text(project(t('NewProofs.lean')+'\n'+t('NewTests.lean')))
names=re.findall(r'^(?:def|lemma) ([\w.]+)',t('NewProofs.lean'),re.M)
(S/'Audits.lean').write_text('\n'.join('#print axioms TauCeti.Hodge.ParameterConnection.Intrinsic.'+n for n in names)+'\n')
(S/'Native.lean').write_text(imports(t('NativePrefix.lean'))+'\n'+t('NewProofs.lean')+'\n'+t('NewTests.lean')+'\n'+t('Audits.lean'))
(S/'Canonical.lean').write_text(imports(t('CanonicalPrefix.lean'))+'\n'+t('NewAdmitted.lean'))
(S/'Suggested.lean').write_text(t('Canonical.lean'))
```

## Script: author.py

```python
"""Append one declaration per affine dual interface; preserve incoming contracts whole."""
from pathlib import Path
import copy,json,re
S=Path(__file__).resolve().parent;RID='HodgeStructuresPartII';NS='TauCeti.Hodge.ParameterConnection.Intrinsic'
load=lambda n:json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
old=load('Incoming.json');p=copy.deepcopy(old);road=load('Incoming-roadmap.json');existing={n.get('declaration'):n['id']for n in old['nodes']}
specs=[
('dualPair','Covector derivative pairing','Construct the additive map dualPair(D):E∨→Hom_R(E,W) with dualPair(D)(φ)(e)=λd₀(φ(e))−lid((φ⊗id_W)D(e)). The result is R-linear in e even when d₀λ is nonzero; it is additive in φ.',['Preconnection','mathlib:Derivation.leibniz','mathlib:TensorProduct.lid','mathlib:TensorProduct.map_add_left'],'For scalar multiplication in e, expand the derivation and D Leibniz rules; their matching λφ(e)d₀a terms cancel. Additivity follows from the native tensor-map sum formula.'),
('dualPair_apply','Covector derivative evaluation','For arbitrary φ,e, dualPair(D)(φ)(e)=λd₀(φ(e))−lid((φ⊗id_W)D(e)).',['dualPair'],'Unfold the actual additive map and its linear-map value.'),
('dualPair_smul','Covector derivative scalar correction','For a∈R and φ∈E∨, dualPair(D)(aφ)=a dualPair(D)(φ)+λ(φ.smulRight(d₀a)), as actual R-linear maps E→W.',['dualPair_apply','mathlib:TensorProduct.map_smul_left'],'Evaluate both maps on e, use the derivation Leibniz rule and tensor-map scalar formula, and cancel terms.'),
('dualPair_zero_parameter','Zero-parameter covector sign','For D with parameter0, dualPair(D)(φ)(e)=−lid((φ⊗id_W)D(e)). No projectivity hypothesis is needed.',['dualPair_apply'],'Set λ=0 in the evaluation formula.'),
('affineDual','Finite projective affine dual connection','Construct the same-λ additive preconnection D∨ on the native dual E∨. Its additive operator is the inverse of the native finite-projective dualTensorHomEquiv applied to dualPair(D). Its λ-Leibniz equation is proved, not supplied as extra data.',['dualPair','dualPair_smul','mathlib:dualTensorHomEquiv','mathlib:dualTensorHomEquiv_tmul'],'Apply the inverse native linear equivalence to the additive pairing. Check the Leibniz equation after the injective forward equivalence, using the scalar correction and its pure-tensor evaluation formula.'),
('affineDual_eval','Dual connection evaluation','For every φ∈E∨ and e∈E, dualTensorHom(D∨φ)(e)=λd₀(φ(e))−lid((φ⊗id_W)D(e)).',['affineDual','dualPair_apply','mathlib:dualTensorHom','mathlib:dualTensorHom_dualTensorHomEquiv_symm'],'Use the native inverse/forward tensor-Hom identity on dualPair(D).'),
('affineDual_unique','Dual connection uniqueness','If C is a same-λ preconnection on E∨ satisfying the displayed dual evaluation equation for all φ,e, then C=D∨ as full preconnection structures.',['affineDual_eval','mathlib:dualTensorHomEquiv'],'The native tensor-Hom equivalence and linear-map extensionality identify each operator value; additive-map extensionality and proof irrelevance identify the structures.'),
('affineDual_evaluation','Horizontal evaluation pairing','For every x∈E∨⊗_R E, unit(Ω,λ)(contractLeft(x))=(contractLeft⊗id_W)((D∨⊗_λ D)(x)). This is horizontality of the actual native evaluation map.',['affineDual_eval','mathlib:dualTensorHom_apply','mathlib:TensorProduct.induction_on','Preconnection.affineTensor_tmul',RID+':H.0/unit-connection','mathlib:contractLeft','mathlib:contractLeft_apply'],'Induct on the native tensor x. For φ⊗e, contract the actual right-commutor and inverse-associator terms by tensor induction, substitute the dual evaluation formula and cancel.'),
('affineDual_curvature_pair','Dual curvature with parameter correction','For every φ,e, dualTensorHom(κ_D∨(φ))(e)+lid((φ⊗id_Z)κ_D(e))=λ(d₀λ∧d₀(φ(e))). Keep the order d₀λ first. The formula holds for arbitrary λ.',['affineDual_evaluation','Preconnection.curvature_horizontal','Preconnection.unit_curvature','Preconnection.affineTensor_curvature_tmul','mathlib:contractLeft_apply'],'Apply curvature transport through the actual horizontal evaluation map to φ⊗e. Substitute the inherited tensor and unit curvature formulas, then contract both summands by native tensor induction.'),
('affineDual_curvature','Relatively constant dual curvature','Assume d₀λ=0. Then dualTensorHom(κ_D∨(φ))(e)=−lid((φ⊗id_Z)κ_D(e)) for every φ,e.',['affineDual_curvature_pair'],'The explicit correction vanishes. Move the second term to the other side.'),
('affineDual_flat','Dual preserves flatness','If d₀λ=0 and κ_D(e)=0 for every e, then κ_D∨(φ)=0 for every φ.',['affineDual_curvature','mathlib:dualTensorHomEquiv'],'Test dual curvature through the injective native equivalence for coefficient module Z; every evaluation is zero.'),
('affineDual_horizontal','Contravariant horizontal dual maps','Let E,F be finite projective and f:E→F an actual R-linear map horizontal from D to C. Then f∨:F∨→E∨ is horizontal from C∨ to D∨: D∨(f∨φ)=(f∨⊗id_W)C∨(φ).',['affineDual_eval','mathlib:dualTensorHomEquiv','mathlib:LinearMap.dualMap','mathlib:TensorProduct.map_map','mathlib:TensorProduct.induction_on'],'Apply the injective tensor-Hom equivalence. Tensor induction identifies evaluation of the mapped covector tensor with evaluation at f(e). Substitute both dual formulas and the horizontal equation for f.'),
('affineDual_bidual','Horizontal native bidual evaluation','For every e, (D∨)∨(evalEquiv(e))=(evalEquiv⊗id_W)D(e), using the native finite-projective bidual equivalence E≃E∨∨. No d₀λ=0 assumption is required.',['affineDual_eval','mathlib:Module.evalEquiv','mathlib:Module.evalEquiv_apply','mathlib:Module.Dual.eval_apply','mathlib:Module.dual_finite','mathlib:Module.dual_projective','mathlib:dualTensorHomEquiv'],'Apply the injective tensor-Hom equivalence for E∨. Native tensor induction identifies both evaluation contractions. Substitute the dual formula twice; the two λd₀(φ(e)) terms cancel.'),
('affineDual_bidual_inverse','Horizontal inverse bidual evaluation','The inverse native bidual equivalence is horizontal from (D∨)∨ to D, on every element of E∨∨.',['affineDual_bidual','Preconnection.horizontal_symm'],'Apply the inherited horizontal-inverse theorem to the actual native bidual equivalence.'),
('affineDual_flat_iff','Dual detects flatness','If d₀λ=0, D∨ is flat if and only if D is flat.',['affineDual_flat','affineDual_bidual','Preconnection.curvature_horizontal','mathlib:Module.evalEquiv'],'One direction is preservation. For reflection, dualize the flat dual, transport its zero curvature through the horizontal bidual equivalence and use injectivity of its native tensor equivalence.')]
ids={n:RID+':H.0/affine-dual-'+re.sub(r'(?<!^)(?=[A-Z])','-',n).replace('_','-').lower()for n,*_ in specs}
common=['Commutative rings k,R with an actual k-algebra structure on R; independent module universes for E,W,Z. The supplied existing TwoForms calculus has d₀:Derivation k R W, additive d₁:W→Z, alternating R-bilinear wedge, d₁(aω)=d₀a∧ω+a d₁ω and d₁d₀=0. All modules have additive commutative groups; W has its specified k-action.','D:E→E⊗_R W is the actual additive preconnection with parameter λ∈R. No field, characteristic, smoothness, reducedness, flatness of W or Z, basis or integrability assumption is built into the construction.']
finite='E is finite projective over R; a global basis is neither chosen nor assumed. The native dual is also finite projective. The pairing construction alone does not require these hypotheses.'
tower={'affineDual_evaluation','affineDual_curvature_pair','affineDual_curvature','affineDual_flat','affineDual_bidual_inverse','affineDual_flat_iff'}
new=[]
for n,title,stmt,deps,proof in specs:
 hyp=common[:]
 if n.startswith('affineDual'):hyp.append(finite)
 if n in tower:hyp.append('The degree-one actions satisfy IsScalarTower k R W, as required by the inherited unit/curvature/horizontal transport APIs.')
 if n in {'affineDual_curvature','affineDual_flat','affineDual_flat_iff'}:hyp.append('The explicit relatively constant parameter equation d₀λ=0 is required.')
 if n=='affineDual_horizontal':hyp.append('F is also a finite projective R-module and C has the same supplied calculus and parameter.')
 new.append(dict(id=ids[n],parentStageId=RID+':H.0',realises=[RID+':H.0'],kind='construction'if n in ['dualPair','affineDual']else'lemma',title=title,declaration='Preconnection.'+n,statement=stmt,hypotheses=hyp,prerequisites=[x if ':'in x else ids[x]if x in ids else existing[x]for x in deps],proofSteps=[proof],acceptance=[stmt,'This actual affine component supports the existing global dual plan. Its native module operations are reused; global sheaf descent, dual base change and the reserved finite locally free integrable key remain open.'],library=dict(module='TauCeti/Geometry/Hodge/Higgs/ParameterConnection',namespace=NS),sources=[dict(sourceId='Stacks-dual-07J5-codex-7e92bd',locator='Section60.15 ordinary connection and exterior-extension convention; authored affine λ-dual deduction',excerpt='connection',match='Ordinary parameter-one convention only. The displayed λ-dependent affine construction and its correction are authored deductions from the existing intrinsic operator and native tensor/Hom APIs.'),dict(sourceId='Stacks-dual-0FNJ-codex-7e92bd',locator='Lemma15.74.1(1)–(3), whole displayed proof',excerpt='finite projective',match='Explains the native finite-projective dual and evaluation convention. No categorical coevaluation or rigidity theorem is constructed here; linked categorical proofs were not recursively read.')],implementationStatus='unchecked'))
by={n['declaration'].split('.')[-1]:n for n in new}
for c,api in [('dualPair',['dualPair_apply','dualPair_smul','dualPair_zero_parameter']),('affineDual',[n for n,*_ in specs if n.startswith('affineDual_')])]:
 by[c]['api']=[dict(name='Preconnection.'+a,role='characterisation'if a.endswith('unique')else'compatibility',statement=by[a]['statement'])for a in api]
 by[c]['uses']=[dict(where=RID+':H.0/intrinsic-dual',how='Supply the actual affine operator/evaluation needed by the existing intrinsic finite locally free dual construction, without duplicating generic module duality or the E1 sheaf supplier.'),dict(where=RID+':H.0/dual-curvature',how='Supply the actual affine curvature sign and flatness reflection; retain the explicit parameter correction before imposing d₀λ=0.')]
tests=[('linear_evaluation','compatibility','For arbitrary E, the covector pairing is R-linear in its E argument; this detects failure to cancel the two Leibniz corrections.'),('add_functionals','compatibility','For arbitrary E, evaluating dualPair(D) at φ+ψ gives the sum of its values at φ and ψ.'),('zero_parameter_linear','degenerate','For parameter0 and arbitrary E, dualPair(D)(aφ)=a dualPair(D)(φ); the scalar derivative correction is exactly zero.'),('leibniz','compatibility','The actual finite-projective dual operator satisfies D∨(aφ)=aD∨(φ)+λ(φ⊗d₀a) as equality in E∨⊗W.'),('higgs_sign','computation','For parameter0, evaluation of the actual dual Higgs operator is the negative of contraction with D(e).'),('pairing','compatibility','On φ⊗e, applying actual tensor connection and contraction equals λ(1⊗d₀(φ(e))).'),('variable_curvature_correction','non-example','If λ(d₀λ∧d₀(φ(e))) is nonzero, dual curvature evaluation cannot equal the negative primal curvature contraction. This is a conditional general test, not a constructed nonzero two-form fixture.'),('bidual_roundtrip','compatibility','Applying the inverse bidual tensor map to the double-dual operator at evalEquiv(e) recovers D(e), for arbitrary λ.'),('flat_equivalence','characterisation','For parameter0, the actual dual Higgs preconnection is flat if and only if the original is flat.'),('nonconstant_unit','computation','Over Z[x], use d₀=derivative, zero two-forms and λ=x. For D=λd and φ=x·id_R, both dualPair(D)(φ)(1) and evaluation of D∨φ at1 are x, while d₀λ=1.'),('nonreduced_sign','computation','Over Z/4 with zero calculus, λ=0 and actual D(r)=r⊗3, take φ=id_R. Both dualPair(D)(φ)(1) and evaluation of D∨φ at1 are1, distinct from3; the base retains2≠0 and2²=0.'),('zero_module','degenerate','For E=Fin0→R, the actual dual operator vanishes on every covector for arbitrary calculus and λ.')]
tmap={n:dict(name='AffineDualTests.'+n,kind=k,statement=t)for n,k,t in tests}
by['dualPair']['tests']=[tmap[n]for n in ['linear_evaluation','add_functionals','zero_parameter_linear','nonconstant_unit','nonreduced_sign']]
by['affineDual']['tests']=[tmap[n]for n,_,_ in tests if n not in ['linear_evaluation','add_functionals','zero_parameter_linear']]
provides=['Native linear map E∨⊗W→Hom_R(E,W), evaluating φ⊗ω on e as φ(e)ω.','Native tensor-Hom linear equivalence for finite projective E and arbitrary W.','Forward tensor-Hom map cancels the inverse equivalence on every linear map E→W.','Native evaluation contraction E∨⊗E→R.','Evaluation contraction on φ⊗e equals φ(e).','The dual of a finite projective module is finite.','The dual of a finite projective module is projective.','Native bidual linear equivalence for a reflexive module; the pinned finite-projective reflexivity instance in Dual/Lemmas.lean supplies the hypothesis.','Native bidual evaluation at e sends φ to φ(e).','The native bidual equivalence evaluates by the native bidual evaluation map.','Tensor map is additive in its first linear-map argument.','Tensor map is linear in its first linear-map argument.','Native contravariant map on module duals, by precomposition.','Native tensor-Hom pure-tensor evaluation φ(e)ω.','Finite-projective tensor-Hom equivalence has the same pure-tensor evaluation.']
baseline=[]
for x,description in zip(load('BaselineReading.json'),provides):
 if not x['alreadyPresent']:baseline.append({**{k:x[k]for k in ['ref','kind','module','line']},'provides':description,'checked':'Codex — codex-7e92bd read the actual declaration and contextual hypotheses at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 on2026-10-04. Exact ranges and hashes are retained in Reading.json and BaselineReading.json.'})
p['baseline']['declarations']+=baseline;p['nodes']+=new
for tag,row in zip(['07J5','0FNJ'],load('SourceReading.json')):
 p['sources'].append(dict(id='Stacks-dual-'+tag+'-codex-7e92bd',title='Ordinary connections and finite-projective duality; authored affine parameter deductions',authors='The Stacks Project authors; deductions by Codex — codex-7e92bd',edition='Current displayed tag'+tag+' read4October2026',url=row['url'],sha256=row['sha256'],accessed=row['accessed'],readSections=[row['scope']]))
frontier='The actual affine dual now exists for finite projective E, arbitrary form modules and arbitrary λ, using the native tensor-Hom equivalence and no global basis. The covector pairing is R-linear in e by Leibniz cancellation and gives the same-λ dual operator. Its evaluation characterization is unique; native contraction is horizontal; curvature evaluation includes the exact λ(d₀λ∧d₀(φ(e))) correction. For d₀λ=0 the usual negative dual curvature formula holds and flatness is preserved and reflected. Native dual maps of horizontal maps and both directions of the native bidual equivalence are horizontal. Polynomial λ=x, nonreduced Z/4 sign and zero-module tests are explicit. Dual base-change comparison with the existing actual affine pullback, coevaluation/rigidity, universal exterior-power comparisons, and genuine E1 sheaf tensor/restriction/equality detection/effective gluing remain open. The global finite locally free integrable key still requires relatively constant λ. All149 routed obligations,35 omissions,five requests,eleven gaps,six planets and later determinant/Tate/period and arbitrary-Q tensor-valued-shuffle obligations remain; H.0 stays partial and H.1–H.8 not_read. Earlier frontier prose is checkpoint history.'
p['summary']+=' Finite-projective affine dual continuation:15 nodes(2 constructions,13 lemmas),13 API references and14 test references to12 distinct typed tests; native dual and bidual interfaces reused.'
p['coverage'][0]['remaining'].append(frontier);road['stages'][0]['description']+=' '+frontier
p['verification']=dict(previousCheckpoint=old['verification'],worker='Codex — codex-7e92bd',date='2026-10-04',issue=3371,mathematicalBase=(S/'base.txt').read_text().strip(),compilation={n.lower():load(n+'.receipt.json')for n in ['Native','Canonical']},newNodes=15,newAPIReferences=13,newDistinctAPI=13,newTestReferences=14,newDistinctTests=12,implementation='unchecked; actual affine proof artifacts only; global sheaf and source closure remain open',publicReplay='Actual public HTTP recovery and both immutable verifier reports required before submission.')
plan=dict(newNames=[n['declaration']for n in new],newNodes=[n['id']for n in new],apiAdditions={},testAdditions={},newBaseline=baseline,newBaselineRefs=[b['ref']for b in baseline],frontier=frontier,apiReferences=13,distinctAPI=13,testReferences=14,distinctTests=12,newSourceIssues=[])
for n,x in [('Candidate.json',p),(RID+'.json',p),('Candidate-roadmap.json',road),('NewNodes.json',new),('Plan.json',plan)]:save(n,x)
parts=['# Finite projective dual parameter connections\n\n'+frontier+' Every implementation remains unchecked.\n\nThe covector pairing is defined before imposing finite projectivity. Its derivative and contraction terms separately have scalar corrections in e, which cancel. The inverse native tensor-Hom equivalence then produces an additive operator on the dual. It retains the same parameter, including its derivative when the parameter varies. The curvature proof uses the inherited tensor formula and horizontal contraction into the actual unit connection; this exposes the parameter correction without assuming it away. Bidual evaluation gives flatness reflection.\n\nThe generic tensor-Hom equivalence, module dual, contraction and bidual equivalence are already Mathlib and are not planned again. The explicit fixtures use free modules; the construction itself assumes only finite projectivity. No example of a projective module without a global basis or a nonzero two-form correction is constructed in this checkpoint.\n\n## Declarations and tests\n\n']
for n in new:
 parts+=['### '+n['title']+'\n\n`'+n['declaration']+'` — '+n['statement']+'\n\nHypotheses: '+' '.join(n['hypotheses'])+'\n\nProof plan: '+' '.join(n['proofSteps'])+'\n\n']
 for field in ['api','tests']:
  if n.get(field):parts+= [field.upper()+':\n\n'+''.join('- `'+x['name']+'`: '+x['statement']+'\n'for x in n[field])+'\n']
parts+=['## Sources and ownership\n\nThe complete current [ordinary connection section](https://stacks.math.columbia.edu/tag/07J5) fixes the ordinary convention. The complete current [finite-projective duality lemma](https://stacks.math.columbia.edu/tag/0FNJ) fixes the evaluation convention and finite-projective context. These affine parameter identities are authored deductions, not quotations of a printed λ-duality theorem. Linked categorical proofs and whole-paper versions were not recursively read. Both incoming source issues are preserved with no new finding. The existing E1 supplier retains generic sheaf modules, tensor, restriction and descent; this checkpoint supplies only the connection-specific affine component.\n\n## Earlier checkpoint reader (preserved verbatim)\n\n']
a=''.join(parts);(S/'ReaderAddition.md').write_text(a);(S/'Reader.md').write_text(a+(S/'IncomingReader.md').read_text())
print(json.dumps(dict(nodes=len(p['nodes']),baseline=len(p['baseline']['declarations']),newNodes=len(new),APIReferences=13,testReferences=14,distinctTests=12)))
```

## Script: projection.py

```python
"""Project the new proof-only continuation into admitted planning signatures."""
import re

def project(text):
 lines=text.splitlines(keepends=True);out=[];i=0
 while i<len(lines):
  if re.match(r'^lemma |^example\b',lines[i]):
   j=i+1
   while j<len(lines)and(not lines[j].strip()or lines[j][0].isspace()):j+=1
   block=''.join(lines[i:j]);depth=0;pos=None
   for k,c in enumerate(block):
    if c in '([{':depth+=1
    elif c in ')]}':depth-=1
    if block[k:k+2]==':='and depth==0 and not re.match(r'\s*let(?:I)?\b',block[:k].rsplit('\n',1)[-1]):pos=k;break
   assert pos is not None
   out.append(block[:pos]+':= by\n  sorry\n\n');i=j
  else:out.append(lines[i]);i+=1
 return ''.join(out)
```

## Script: write_handoff.py

```python
"""Render the scoped affine dual checkpoint and exact authenticated replay instructions."""
from pathlib import Path
import hashlib,json,re
S=Path(__file__).resolve().parent
t=lambda n:(S/n).read_text();j=lambda n:json.loads(t(n));sha=lambda b:hashlib.sha256(b).hexdigest()
p=j('Candidate.json');old=j('Incoming.json');g=j('Graph.json');c=j('ClaimReceipt.json')
def compile_line(n):
 r=j(n+'.receipt.json');b=(S/(n+'.lean')).read_bytes();assert r['exitStatus']==0
 return f"- {n}.lean: {len(b.splitlines())} lines, {len(re.findall(r'^example\b',b.decode(),re.M))} examples, exit0, {r['warnings']} warnings, {r['axiomAudits']} axiom audits; {r['availableGiBBefore']}GiB available before compilation, {r['elapsedSeconds']} seconds, peak {r['maxRssKiB']}KiB. Source SHA256 `{sha(b)}`; diagnostic SHA256 `{r['logSha256']}`.\n"
h=f'''# Finite projective affine dual parameter connections — checkpoint

Codex — codex-7e92bd. Refs #3371. Partial; every implementation remains unchecked.

The existing actual affine preconnection D now has a same-parameter dual on the native module E∨ whenever E is finite projective. First construct the additive covector pairing B_D(φ)(e)=λd₀(φ(e))−lid((φ⊗id_W)D(e)). Its value is R-linear in e: the derivation and preconnection scalar corrections cancel. This first construction works for arbitrary E. Its scalar correction in φ is B_D(aφ)=aB_D(φ)+λφ.smulRight(d₀a). At parameter 0 it is the negative contraction.

For finite projective E, apply the inverse native dualTensorHomEquiv to B_D. This gives the actual additive operator D∨:E∨→E∨⊗W, and the proved correction gives its λ-Leibniz equation. The native tensor-Hom equivalence supplies the evaluation formula and uniqueness among same-λ preconnections. No basis is selected. Generic module dual, contraction, tensor-Hom equivalence and bidual equivalence are pinned Mathlib and are not replanned.

Native contraction E∨⊗E→R is horizontal from the actual tensor D∨⊗D to the actual unit λd. The proof uses native tensor induction, the inherited right commutor and inverse associator, and the covector evaluation formula. Apply the inherited curvature transport through contraction and the actual tensor/unit curvature formulas to obtain, for arbitrary λ,

κ_D∨(φ)(e)+φ(κ_D(e))=λ(d₀λ∧d₀(φ(e))).

The order d₀λ first is retained. Contractions here use the native tensor-Hom map and left unitor into the degree-two module Z. When d₀λ=0 the correction vanishes, giving the negative dual-curvature formula and preservation of flatness. Native dual maps of horizontal R-linear maps between finite projectives are horizontal in the contravariant direction. The native finite-projective bidual equivalence and its inverse are horizontal for arbitrary λ; curvature transport through it gives reflection of flatness when d₀λ=0.

The base rings k,R are commutative with the given k-algebra map; E,W,Z retain independent module universes. Ω is the existing supplied degree-zero/one/two calculus, with the actual derivation, additive exterior differential and alternating wedge. The inherited unit/curvature and inverse-horizontal APIs retain IsScalarTower k R W. No field, characteristic, reducedness, smoothness, global basis or flatness of the form modules is imposed. The finite-projective hypothesis is explicit only where native tensor-Hom/bidual equivalences are used. The raw dual and horizontal-map constructions allow variable λ; the global reserved finite locally free integrable key still requires relatively constant λ and actual ringed-site sheaf operations.

All 508 incoming node objects,256 baseline objects,149 routed obligations,35 omissions,five supplier requests,eleven gap objects,two source issues and six planets are preserved whole. The continuation adds 15 nodes:2 constructions and 13 lemmas,14 new baseline declarations,13 API references and 14 test references to12 distinct typed examples. Each construction has at least three API items and tests. The covector tests check linearity in e, additivity in φ and the zero-parameter scalar law. The dual tests check actual Leibniz, negative Higgs evaluation, horizontal pairing, the conditional obstruction to dropping a nonzero curvature correction, bidual roundtrip and zero-parameter flatness equivalence. Over Z[x] with λ=x and d₀x=1, D=λd and φ=x·id, both the covector pairing and dual evaluation at 1 equal x. Over Z/4 with zero calculus and D(r)=r⊗3, both values at the identity covector and 1 equal 1, distinct from 3;2 is nonzero and square-zero. The zero module Fin0→R has identically zero dual operator. These explicit fixtures are free modules; no projective-but-not-free fixture or concrete nonzero two-form correction is claimed.

Dual base-change comparison with the existing actual affine pullback, coevaluation/rigidity and universal exterior-power comparisons remain open, as do actual E1 sheaf tensor/restriction/equality detection/effective gluing. No generic sheaf/module construction is duplicated. H.0 remains partial and H.1–H.8 not_read; determinant/Tate/period, arbitrary-Q tensor-valued-shuffle, source-route and later-stage obligations remain. Earlier frontier prose is preserved checkpoint history.

## Reading and authenticated incoming evidence

The complete {c['wholeIssueCharacters']}-character issue was read before claim {c['claim']} and again after exact numeric bot confirmation {c['confirmation']}, in the two intervals recorded in ClaimReceipt.json. Body SHA256 `{c['bodySha256']}`. WORKERS was freshly read whole. PROTOCOL1–245 and365–575 were refreshed, and the original whole expansion-protocol/upstream-guide scopes are retained from this continuous loop.

Incoming peer PR #6071 at head 98cde59336113009e93a70a7842061d931064fba was actually recovered over public HTTP from archive bc576c97885270cd2af4f92d01863ce8b50ef0f2. Its 76 artifacts,10 helpers and five final public deliverables authenticated against manifest 9aad3a4726f76bf0546f26e905881332bd96984bb6b8a5a02a8bbbaa0b6516a5. Both actual original mathematical and publication verifier reports were reproduced byte-for-byte from the repository cwd. The complete peer 15 new proofs and seven new tests, mathematical handoff prefix through recovery instructions, recovery code and actual verification/immutable/graph helpers were personally read. The previous peer 6066 nineteen-proof block was not freshly manually audited; the entire incoming 5675-line native prefix is authenticated and its proofs replayed in the final whole-file run. The complete 7272-line canonical prefix is likewise preserved. No peer reading claim is adopted as personal reading.

Own PR #6062 manifest a457bc844e43bbdbcbe384ca2951ead0954d408c334363938a349261e9f26a79 authenticates Own6062Reading/InputGuard and its retained own 6053 and 6041 reading envelopes. All three complete own Reading records were personally reread. OwnReadingReuse.json records 37 unchanged controls and five advanced deliverables among 42 guarded files. Only original scopes on unchanged controls are reused; all 474 own6062 node objects remain whole in the current 508-node prefix.

Fresh scopes include all four complete reviewed parent Hodge AUDIT-02 rows L0–L3, review metadata and the whole REV-AUDIT-02 report; no PartII row exists. The complete reserved key and keydef entry, all five requests, full H.0 description, latest three remaining entries, all eleven gap objects and current intrinsic-dual/dual-curvature nodes were read. Structured touching-link scans across research links, data links and accepted restructures found zero touching entries; TouchingLinks.json is empty. Reading.json records consumed native-prefix ranges 1–185,319–435,630–766 and937–1055 and authenticates the original broader own supplier/source/upstream-reader scopes.

Fresh native source reading covers Contraction.lean 1–180,235–320; Dual/Defs.lean 72–102,107–141,202–238; Dual/Lemmas.lean 124–155,251–270; TensorProduct/Map.lean 145–169. BaselineReading.json binds all 15 consumed declarations,one already present and 14 added, to exact index rows and pinned source hashes. All 15 specialized proposed names had zero literal matches in bounded searches of both pinned source trees; this is not an exhaustive absence claim. The existing generic finite-projective equivalences and native reflexivity instance are reused.

The complete current displayed [Stacks07J5](https://stacks.math.columbia.edu/tag/07J5) section, displayed proof and both public comments, and [Stacks0FNJ](https://stacks.math.columbia.edu/tag/0FNJ) Lemma15.74.1, all three parts and complete displayed proof diagram, were read. The latter has zero lemma comments; it links to two section-level comments that were not read. SourceReading.json binds both actual HTTP byte streams, hashes and access times. Linked categorical proofs and whole paper/version histories were not recursively read. The incoming authenticated07J5 historical correction patch was personally read; both inherited source issues remain unchanged, with no new source finding. These sources provide ordinary-connection and finite-projective evaluation context; the arbitrary-λ affine identities and correction are authored deductions from the existing actual constructions and pinned native APIs.

## Validation

The full suggested file equals the whole Mathlib-only Canonical.lean compiled at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, Lean 4.34.0-rc2 commit 6a10ac8c22beadecabdbb0919c2b50214762f91d. The runner checks exact library/compiler/dependency pins, tracked cleanliness, fresh free memory≥20GiB, one thread,8192MiB managed-memory bound and 1200-second timeout. Each compile completed before another compiler, source edit or rebase. The own Context object accelerated prototypes only; the final Native replay elaborates the entire source. No Lake setup/cache/library build or language server was used. One command with a mistyped compiler path failed before invoking Lean, then the correct existing compiler was used.

'''+compile_line('Native')+compile_line('Canonical')+f'''
All 306 native audits contain only propext,Classical.choice and Quot.sound, with zero warnings,errors,admissions or sorryAx references. Canonical has 870 admission warnings only: 845 inherited and 25 new explicit lemma/example admissions. Both new data constructions remain concrete. All 15 new declaration and 12 example headers agree exactly with the admitted projection. Suggested.lean is the entire compiled Canonical.lean, SHA256 `{sha((S/'Canonical.lean').read_bytes())}`. This validates the affine artifacts only; no implementation status or global coverage is promoted.

The actual indexed blueprint checker, source-issue checker, immutable intake/file rules and atlas assembler pass without errors or warnings. The packet has {len(p['nodes'])} nodes,{len(p['baseline']['declarations'])} baseline declarations,{sum(len(n.get('api',[]))for n in p['nodes'])} raw API references and{sum(len(n.get('tests',[]))for n in p['nodes'])} raw test references. The stage DAG has {g['stageDAG']['vertices']} vertices/{g['stageDAG']['edges']} edges; the own declaration DAG has {g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']}; the scoped DAG has {g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']}. All are acyclic, with{g['reachableDeclarations']} reachable declarations,{g['baselineLeaves']} baseline leaves and all {g['requiredPairs']} supplier pairs reachable. Every foreign roadmap/stage and all stage-edge objects equal their immutable controls; no own skipped/pending link exists.

Mathematical base `{t('base.txt').strip()}`; publication base `{t('publication-base.txt').strip()}`. All 42 input guards and the issue's mathematical contract agree between bases. The publication refresh only advanced other-job files and queue state; PublicationChanges.json records it. Declaration-index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Both verifier reports execute actual immutable checker/intake/atlas code without Lean or a repository snapshot. Actual public HTTP recovery and both recovered reports must authenticate byte-for-byte before opening the PR.

## Resume

Continue the connection-specific dual base-change comparison: identify S⊗E∨ with (S⊗E)∨ using native finite-projective Hom/base-change APIs, then prove the actual comparison horizontal for the existing calculus morphism and affinePullback operator, including derivatives of new S-scalars. Prove compatibility with evaluation and both bidual maps before packaging categorical duality. Keep coevaluation/rigidity and universal exterior-power comparisons explicit, and continue genuine E1 sheaf restriction/descent without duplicating its supplier objects. Preserve all149 routes,35 omissions,five requests,eleven gaps,two source issues,later-source obligations and the relatively constant parameter in the global key.

'''
h=h.rstrip()+'\n';(S/'HandoffBase.md').write_text(h);(S/'Handoff.md').write_text(h)
```

## Script: verify.py

```python
"""Verify this continuation against exact immutable Git blobs and actual intake/atlas code."""
from pathlib import Path
import ast,hashlib,json,os,re,subprocess,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd().resolve();RID='HodgeStructuresPartII';sys.path.insert(0,str(S))
sha=lambda b:hashlib.sha256(b).hexdigest()
def text(n):return (S/n).read_text()
def data(n):return json.loads(text(n))
MATH=text('base.txt').strip();BASE=os.environ.get('HODGE_VALIDATE_BASE',text('publication-base.txt').strip())
def blob(ref,p):return subprocess.check_output(['git','show',ref+':'+p],cwd=R)
paths=['research/blueprint/'+f+'/'+('DESIGN-'if f=='handoff'else'')+RID+'.'+e for f,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
contents={p:text(n) for p,n in zip(paths,['Candidate-roadmap.json','Candidate.json','Reader.md','Suggested.lean','Handoff.md'])}
if (S/'PublicHandoff.md').exists():
 assert text('PublicHandoff.md').startswith(text('HandoffBase.md'))
 contents[paths[-1]]=text('PublicHandoff.md')
 fence=chr(96)*3
 recovered=text('PublicHandoff.md').split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
 assert recovered==text('recover.py')
 for name in ['assemble.py','author.py','projection.py','write_handoff.py','verify.py','graph.py','immutable.py','compile.py','runcheck.py','package.py']:
  c=text('PublicHandoff.md').split('## Script: '+name+'\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
  assert c==text(name),name
for p,n in zip(paths,['Incoming-roadmap.json','Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):
 assert blob(MATH,p)==(S/n).read_bytes()==blob(BASE,p),p
p=data('Candidate.json');old=data('Incoming.json');road=data('Candidate-roadmap.json');oldroad=data('Incoming-roadmap.json');plan=data('Plan.json')
assert len(old['nodes'])==508 and len(p['nodes'])==523
assert p['nodes'][508:]==data('NewNodes.json')and set(p)==set(old)
for before,after in zip(old['nodes'],p['nodes']):
 expected=json.loads(json.dumps(before));nid=before['id']
 if nid in plan['apiAdditions']:expected['api']+=plan['apiAdditions'][nid]
 if nid in plan['testAdditions']:expected['tests']+=plan['testAdditions'][nid]
 assert after==expected,nid
assert sum(a==b for a,b in zip(old['nodes'],p['nodes']))==508
for k in old:
 if k not in ['nodes','summary','sources','coverage','gaps','verification','baseline','sourceIssues']:assert p[k]==old[k],k
assert p['baseline']['declarations']==old['baseline']['declarations']+plan['newBaseline']
assert {k:v for k,v in p['baseline'].items()if k!='declarations'}=={k:v for k,v in old['baseline'].items()if k!='declarations'}
assert [x['ref']for x in p['baseline']['declarations'][256:]]==plan['newBaselineRefs']
assert p['sources'][:-2]==old['sources']and p['summary'].startswith(old['summary'])
assert p['coverage'][1:]==old['coverage'][1:]and p['coverage'][0]['remaining'][:-1]==old['coverage'][0]['remaining']
assert {k:v for k,v in p['coverage'][0].items()if k!='remaining'}=={k:v for k,v in old['coverage'][0].items()if k!='remaining'}
assert p['gaps']==old['gaps']
assert p['sourceIssues']==old['sourceIssues']+plan['newSourceIssues']
assert p['verification']['previousCheckpoint']==old['verification']
assert p['status']=='partial'and all(n['implementationStatus']=='unchecked'for n in p['nodes'])
assert len(p['requests'])==5 and len(p['gaps'])==11 and len(p['sourceIssues'])==2
assert sum(len(r['items'])for m in p['routeManifest']for r in m['inputRoutes'])==149
assert {k:v for k,v in road.items()if k not in ['summary','stages']}=={k:v for k,v in oldroad.items()if k not in ['summary','stages']}
assert road['stages'][1:]==oldroad['stages'][1:]and road['stages'][0]['description'].startswith(oldroad['stages'][0]['description'])
assert {k:v for k,v in road['stages'][0].items()if k!='description'}=={k:v for k,v in oldroad['stages'][0].items()if k!='description'}
assert text('Reader.md')==text('ReaderAddition.md')+text('IncomingReader.md')
def with_imports(t):
 i=t.index('import ');return t[:i]+text('NewImports.lean')+'\n'+t[i:]
assert text('Canonical.lean')==with_imports(text('CanonicalPrefix.lean'))+'\n'+text('NewAdmitted.lean')
assert text('Suggested.lean')==text('Canonical.lean')
incoming=data('PreviousRecovery.json');im=data('IncomingManifest.json')
assert incoming['head']=='98cde59336113009e93a70a7842061d931064fba'and incoming['artifactsVerified']==76 and incoming['archivedHelpersVerified']==10
assert sha((S/'IncomingManifest.json').read_bytes())=='9aad3a4726f76bf0546f26e905881332bd96984bb6b8a5a02a8bbbaa0b6516a5'
assert (S/'PreviousVerification.json').read_bytes()==(S/'IncomingPublicationVerification-replayed.json').read_bytes()
for name,prefix in [('Native.lean','NativePrefix.lean'),('Canonical.lean','CanonicalPrefix.lean')]:assert im[name]['sha256']==sha((S/prefix).read_bytes())
for path,n in zip(paths,['Incoming-roadmap.json','Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert sha((S/n).read_bytes())==incoming['publicDeliverables'][path]
assert text('Incoming.lean')==text('CanonicalPrefix.lean')
own=data('OwnReadingReuse.json');assert len(own)==42 and sum(g['unchanged']for g in own)==37
om=data('Own6062Manifest.json')
assert sha((S/'Own6062Manifest.json').read_bytes())=='a457bc844e43bbdbcbe384ca2951ead0954d408c334363938a349261e9f26a79'
for n,orig in [('Own6062Reading.json','Reading.json'),('Own6062InputGuard.json','InputGuard.json'),('Own6062OwnPreviousReading.json','OwnPreviousReading.json'),('Own6062OwnPreviousInputGuard.json','OwnPreviousInputGuard.json'),('Own6062OwnPreviousManifest.json','OwnPreviousManifest.json'),('Own6062OwnInheritedReading.json','OwnInheritedReading.json'),('Own6062OwnInheritedInputGuard.json','OwnInheritedInputGuard.json'),('Own6062OwnInheritedManifest.json','OwnInheritedManifest.json')]:assert sha((S/n).read_bytes())==om[orig]['sha256'],n
assert [{'path':g['path'],'sha256':g['previousSha256']}for g in own]==data('Own6062InputGuard.json')
for g in own:
 assert sha(blob(MATH,g['path']))==g['currentSha256']
 assert g['unchanged']==(g['previousSha256']==g['currentSha256'])
assert (S/'PreviousMathematicalVerification.json').read_bytes()==(S/'IncomingMathematicalVerification-replayed.json').read_bytes()
src=data('SourceReading.json')
for row,name in zip(src,['07J5.html','0FNJ.html']):assert sha((S/name).read_bytes())==row['sha256']
assert not plan['newSourceIssues']
claim=data('ClaimReceipt.json');assert claim['claim']==5980850853 and claim['confirmation']==5980852001
assert claim['wholeIssueCharacters']==22198 and claim['wholeReadsBeforeAndAfter']==[[0,16000],[16000,22198]]
assert claim['bodySha256']=='43c656497ac194e02aa80ad85ad5579caf8bc5eb4d95cac4ff4c15e65eac3c69'
assert len(data('AbsenceSearch.json'))==15 and all(x['exactLiteralMatches']==0 for x in data('AbsenceSearch.json'))
assert [x['ref']for x in data('BaselineReading.json')if not x['alreadyPresent']]==plan['newBaselineRefs']
assert text('Native.lean')==with_imports(text('NativePrefix.lean'))+'\n'+text('NewProofs.lean')+'\n'+text('NewTests.lean')+'\n'+text('Audits.lean')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',text('Native.lean'))
from projection import project
assert text('NewAdmitted.lean')==project(text('NewProofs.lean')+'\n'+text('NewTests.lean'))
assert len(re.findall(r'\bsorry\b',text('NewAdmitted.lean')))==25
def headers(t):
 found={}
 for match in re.finditer(r'^(def|lemma|example)\b(?: ([\w.]+))?',t,re.M):
  depth=0;end=None
  for i in range(match.start(),len(t)):
   c=t[i]
   if c in '([{':depth+=1
   elif c in ')]}':depth-=1
   if depth==0 and(t.startswith(':=',i)or t.startswith('where',i))and not re.match(r'\s*let(?:I)?\b',t[match.start():i].rsplit('\n',1)[-1]):end=i;break
  assert end is not None
  label=match.group(2)if match.group(1)!='example'else'example#'+str(sum(x.startswith('example#')for x in found))
  assert label not in found;found[label]=' '.join(t[match.start():end].split())
 return found
nh=headers(text('NewProofs.lean'));nt=headers(text('NewTests.lean'));ch=headers(text('NewAdmitted.lean'))
assert {**nh,**nt}==ch and len(nh)==15 and len(nt)==12
assert set(plan['newNames'])==set(nh)=={n['declaration']for n in p['nodes'][508:]}
new=p['nodes'][508:]
assert {t['name']for n in new for t in n.get('tests',[])}==set(re.findall(r'^-- test: (.+)$',text('NewTests.lean'),re.M))
assert sum(len(n.get('api',[]))for n in new)==13 and len({x['name']for n in new for x in n.get('api',[])})==13
assert sum(len(n.get('tests',[]))for n in new)==14
for n in new:
 assert n['declaration']in text('Reader.md')and n['statement']in text('Reader.md')
 if n['kind']in ['definition','construction']:
  assert len(n['api'])>=3 and len(n['tests'])>=3 and n['uses']
 for k in ['api','tests']:
  for x in n.get(k,[]):assert x['name']in text('Reader.md')and x['statement']in text('Reader.md')
assert text('Audits.lean')=='\n'.join('#print axioms TauCeti.Hodge.ParameterConnection.Intrinsic.'+n for n in plan['newNames'])+'\n'
for name,warnings,examples,audits in [('Native.lean',0,164,306),('Canonical.lean',870,361,0)]:
 rec=data(name[:-5]+'.receipt.json');log=text(name[:-5]+'.log')
 assert rec['exitStatus']==0 and rec['availableGiBBefore']>=20 and rec['elapsedSeconds']<1200
 assert rec['sourceSha256']==sha((S/name).read_bytes())and rec['logSha256']==sha(log.encode())
 assert ': error'not in log and log.count('warning:')==log.count('warning: declaration uses '+chr(96)+'sorry'+chr(96))==warnings
 assert len(re.findall(r'^example\b',text(name),re.M))==examples
 a=re.findall(r'depends on axioms:\s*\[([^]]*)\]',log);assert len(a)==audits
 if audits:assert 'sorryAx'not in log and all(set(v.strip()for v in x.replace('\n',' ').split(','))<={'propext','Classical.choice','Quot.sound'}for x in a)
 assert '-j 1 -M 8192' in log
assert p['verification']['compilation']=={'native':data('Native.receipt.json'),'canonical':data('Canonical.receipt.json')}
for g in data('InputGuard.json'):assert sha(blob(MATH,g['path']))==g['sha256']==sha(blob(BASE,g['path'])),g['path']
contracts=[]
for ref in [MATH,BASE]:
 job=next(j for j in json.loads(blob(ref,'research/blueprint/queue.json'))['jobs']if j['id']=='DESIGN-'+RID)
 contracts.append({k:v for k,v in job.items()if k not in ['state','note']})
assert contracts[0]==contracts[1]
if (S/'artifact-manifest.json').exists():
 for n,m in data('artifact-manifest.json').items():
  b=(S/n).read_bytes();assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],n
for path,t in contents.items():
 assert not re.search(r'/(?:home|tmp|Users)/|file'+'://',t),path
 assert not re.search(r'[ \t]+$',t,re.M),path
os.environ['HODGE_VALIDATE_BASE']=BASE
import immutable;assert immutable.BASE==BASE;immutable.install();sys.path.insert(0,str(R/'scripts'))
import check_blueprint,source_issues,check_errata
index=check_blueprint.load_index(Path(sys.argv[2]));assert index[0]is not None
errors,warnings,summary=check_blueprint.check(S/(RID+'.json'),index,check_blueprint.world());assert not errors and not warnings,(errors,warnings)
summary['packet']=paths[1]
issues=source_issues.check_issues(p['sourceIssues'],RID)+check_errata.versions_checked(p,p['sourceIssues']);assert not issues,issues
tree=ast.parse((R/'research/blueprint/intake.py').read_text());wanted={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id in {'ALLOWED','PRIVATE'}for t in n.targets)or isinstance(n,ast.FunctionDef)and n.name in wanted]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs']if j['id']=='DESIGN-'+RID)
problems=[x for f in paths for x in env['file_problems'](f,contents[f])];refusals=env['auto_refusals'](job,paths,False,{'codex-7e92bd'},set())
assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'HODGE_VALIDATE_BASE':BASE}))
assert graph['immutableBase']==BASE
if BASE==text('publication-base.txt').strip():assert graph==data('Graph.json')
print(json.dumps(dict(checker=summary,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,wholeIncomingNodesUnchanged=508,preservedMathematicalContracts=508,newNodes=15,newAPIReferences=13,newDistinctAPI=13,newTestReferences=14,newDistinctTests=12,matchedNewHeaders=len(ch),rawAPIItems=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),compilation=p['verification']['compilation'],inputGuards=len(data('InputGuard.json')),indexSha256=sha(Path(sys.argv[2]).read_bytes()),mathematicalBase=MATH,immutableBase=BASE,graph=graph,fullCanonicalCompiled=True,sourceScope='Whole current Stacks07J5 section/proof/comments and0FNJ lemma/proof; linked categorical proofs and section15.74 comments not recursively read. Both inherited source issues preserved. Authored affine parameter-dual deductions; no whole-paper/version closure.',LeanExecuted=False),indent=2))
```

## Script: graph.py

```python
from pathlib import Path
import os,sys,json,collections,copy
R=Path.cwd();S=Path(sys.argv[1]);RID='HodgeStructuresPartII';STEM=RID
sys.path.insert(0,str(R/'scripts'))
p=json.loads((S/'Candidate.json').read_text())
old=json.loads((S/'Incoming.json').read_text())
nodes={n['id']:n for n in p['nodes']}
import immutable
immutable.install()
import check_blueprint
import build,blueprints
packets,documents,definitions=blueprints.load_promoted(R)
keep=[x for x in packets if x[0]!=STEM];documents[STEM]='research/blueprint/readmes/'+STEM+'.md'
own_definition=json.loads((S/'Candidate-roadmap.json').read_text())
old_definition=json.loads((S/'Incoming-roadmap.json').read_text())
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
assert se=={(e['source'],e['target']) for e in b['stageEdges']}
assert a['stageEdges']==b['stageEdges']
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
 rspairs|={(x['source'],x['target']) for x in q.get('links',[]) if x.get('source','').startswith(RID+':') or x.get('target','').startswith(RID+':')}
assert all(reachable(s,t) for s,t in pairs|rspairs),sorted((s,t) for s,t in pairs|rspairs if not reachable(s,t))
ar={r['id']:r for r in a['roadmaps']};br={r['id']:r for r in b['roadmaps']}
assert ar[RID]['blueprint']['declarations']==len(nodes)
assert not ar[RID]['blueprint']['skippedLinks'] and not ar[RID].get('pendingLinks',[])
def skips(r):return r.get('blueprint',{}).get('skippedLinks',[]),r.get('pendingLinks',[])
assert all(skips(ar[x])==skips(br[x]) for x in br if x!=RID)
assert {k:v for k,v in ar.items() if k!=RID}=={k:v for k,v in br.items() if k!=RID}
astages={x['id']:x for x in a['stages']};bstages={x['id']:x for x in b['stages']}
assert {k:v for k,v in astages.items() if not k.startswith(RID+':')}=={k:v for k,v in bstages.items() if not k.startswith(RID+':')}
summary={'stageDAG':dag(listedstageids,se),'ownDeclarationDAG':dag(nodes,ownedges),'scopedDAG':dag(listedstageids|seen,se|de),'reachableDeclarations':len(seen),'externalDeclarations':sorted(seen-set(nodes)),'baselineLeaves':len(baseref),'requiredPairs':len(pairs),'restructurePairs':len(rspairs),'unresolved':sorted(unresolved),'ownSkippedLinks':[],'ownPendingLinks':[],'otherSkipsMatch':True,'stageEdgesUnchanged':True,'wholeForeignRoadmapsUnchanged':True,'wholeForeignStagesUnchanged':True}
summary['immutableBase']=immutable.BASE
summary['immutableReadPaths']=len(immutable.READS)
import hashlib
summary['immutableReadPathSha256']=hashlib.sha256(json.dumps(sorted(immutable.READS)).encode()).hexdigest()
print(json.dumps(summary,indent=2))
```

## Script: immutable.py

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
BASE = os.environ.get('HODGE_VALIDATE_BASE', (Path(__file__).resolve().parent / 'publication-base.txt').read_text().strip())
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
result=subprocess.run(['/usr/bin/time','-v','stdbuf','-oL','-eL','timeout','1200',str(lean),'-j','1','-M','8192']+extra+[str(out/name)],env=env)
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
 if 'error:' in line:print(line.replace(str(S),'<SCRATCH>').rstrip(),flush=True)
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
 print('\n'.join(x for x in log.splitlines() if 'error' in x or 'warning' in x))
sys.exit(r.returncode)
```

## Script: package.py

```python
"""Archive only named job evidence in an inert comment; write final public recovery."""
from pathlib import Path
import base64,hashlib,json,re,sys,zlib
S=Path(sys.argv[1]).resolve();R=Path.cwd();mode=sys.argv[2]
STEM='HodgeStructuresPartII'
suggested=R/'research/blueprint/suggested'/(STEM+'.lean')
sha=lambda b:hashlib.sha256(b).hexdigest()
NAMES='''Incoming-roadmap.json Incoming.json IncomingReader.md Incoming.lean IncomingHandoff.md IncomingManifest.json
IncomingPublicationVerification-replayed.json PreviousMathematicalVerification.json IncomingMathematicalVerification-replayed.json NativePrefix.lean CanonicalPrefix.lean
Native.lean Native.log Native.receipt.json Canonical.lean Canonical.log Canonical.receipt.json
NewImports.lean NewProofs.lean NewTests.lean NewAdmitted.lean Audits.lean Candidate-roadmap.json Candidate.json Reader.md ReaderAddition.md Suggested.lean Handoff.md HandoffBase.md
07J5.html 0FNJ.html Prototype.lean Prototype.log Prototype.receipt.json Context.lean Context.log Context.receipt.json
ClaimReceipt.json Reading.json SourceReading.json BaselineReading.json AbsenceSearch.json Worklist.json
Own6062Manifest.json Own6062Reading.json Own6062InputGuard.json Own6062OwnPreviousManifest.json Own6062OwnPreviousReading.json Own6062OwnPreviousInputGuard.json Own6062OwnInheritedManifest.json Own6062OwnInheritedReading.json Own6062OwnInheritedInputGuard.json OwnReadingReuse.json
InputGuard.json PublicationChanges.json Plan.json NewNodes.json PreviousHead.txt PreviousRecovery.json PreviousVerification.json Verification-mathematical.json Verification.json
TouchingLinks.json Graph.json base.txt publication-base.txt
assemble.py author.py projection.py write_handoff.py verify.py graph.py immutable.py compile.py runcheck.py package.py'''.split()
if mode=='archive':
 meta={n:dict(sha256=sha((S/n).read_bytes()),bytes=len((S/n).read_bytes()),lines=len((S/n).read_bytes().splitlines()))for n in NAMES}
 mb=(json.dumps(meta,indent=2,sort_keys=True)+'\n').encode();(S/'artifact-manifest.json').write_bytes(mb)
 payload={n:dict(sha256=sha((S/n).read_bytes()),data=base64.b64encode(zlib.compress((S/n).read_bytes(),9)).decode())for n in NAMES+['artifact-manifest.json']}
 pb=(json.dumps(payload,sort_keys=True,separators=(',',':'))+'\n').encode();(S/'payload.json').write_bytes(pb)
 report=dict(artifacts=len(NAMES),helpers=sum(n.endswith('.py')for n in NAMES),manifestSha256=sha(mb),payloadSha256=sha(pb))
 (S/'package.json').write_text(json.dumps(report,indent=2)+'\n')
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED AFFINE FINITE PROJECTIVE DUAL PAYLOAD\n'+pb+b'END ARCHIVED AFFINE FINITE PROJECTIVE DUAL PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('roadmaps','Candidate-roadmap.json'),('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated affine finite-projective dual evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='HodgeStructuresPartII'
ARCHIVE=__ARCHIVE__
MANIFEST_SHA=__MANIFEST__
PAYLOAD_SHA=__PAYLOAD__
EXPECTED=__EXPECTED__
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED AFFINE FINITE PROJECTIVE DUAL PAYLOAD\\n',1)[1].split('END ARCHIVED AFFINE FINITE PROJECTIVE DUAL PAYLOAD -/',1)[0].encode()
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
helpers=[n for n in meta if n.endswith('.py')]
for name in helpers:
 c=handoff.split('## Script: '+name+'\\n\\n'+fence+'python\\n',1)[1].split('\\n'+fence+'\\n',1)[0]+'\\n'
 assert c==(S/name).read_text(),name
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\\n');print(json.dumps(receipt,indent=2))
'''
 for key,val in [('__ARCHIVE__',archive),('__MANIFEST__',p['manifestSha256']),('__PAYLOAD__',p['payloadSha256']),('__EXPECTED__',expected)]:code=code.replace(key,repr(val))
 compile(code,'recover.py','exec');(S/'recover.py').write_text(code)
 prose=f'''
## Public recovery and replay

Archive commit `{archive}` is an ancestor changing only this issue's suggested file. Its {p['artifacts']} inert artifacts include all {p['helpers']} authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `{p['manifestSha256']}`; payload SHA256 `{p['payloadSha256']}`. The final suggested file has no archive payload and equals the entire compiled Mathlib-only Canonical.lean.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set HODGE_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Canonical.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean and Suggested.lean are byte-equal and the whole file was compiled. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

'''
 text=(S/'HandoffBase.md').read_text()+prose+'```python\n'+code+'```\n'
 for name in [n for n in NAMES if n.endswith('.py')]:
  text+='\n## Script: '+name+'\n\n```python\n'+(S/name).read_text()+'```\n'
 (S/'PublicHandoff.md').write_text(text)
 (R/'research/blueprint/handoff'/('DESIGN-'+STEM+'.md')).write_text(text)
 suggested.write_bytes((S/'Suggested.lean').read_bytes())
 print(json.dumps(dict(archive=archive,recoverySha256=sha(code.encode()),finalHandoffSha256=sha(text.encode())),indent=2))
else:raise ValueError(mode)
```
