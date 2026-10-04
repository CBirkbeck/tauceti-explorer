# The affine symmetric monoidal category — checkpoint

Codex — codex-rtOQ9t. Refs #3371. Partial; every implementation remains unchecked.

This checkpoint adds30 declaration nodes:15 specialized constructions and15 API lemmas. The existing affine preconnection category now has a native symmetric monoidal structure on its actual modules/operators. Its tensor object uses the existing balanced same-λ affine tensor. Tensoring arrows uses native TensorProduct.map with the existing horizontal witnesses. The unit carries λd₀; the associator, both unitors and swap are the actual native linear equivalences made into horizontal categorical isomorphisms. Their inverses are horizontal by the inherited isoMk constructor.

The faithful forgetful functor to native ModuleCat preserves this actual data with identity tensor/unit comparisons. Native Monoidal.induced gives all tensor functor laws, naturality, pentagon and triangle. Native BraidedCategory.ofFaithful and SymmetricCategory.ofFaithful give braiding naturality, both hexagons and symmetry. The selected forgetful functor itself is strong monoidal and braided. The code fixes a common universe for rings/module carriers and retains the supplied scalar tower on forms. Arbitrary modules and arbitrary λ including d₀λ≠0 are allowed. In particular this ambient unit is not asserted flat for nonconstant λ. No generic module, tensor or monoidal framework is replanned.

Strong monoidal scalar-extension pullback and categorical tower natural isomorphisms/coherence remain open. The reserved finite locally free integrable ringed-site key still requires relatively constant λ, actual sheaf calculus/tensor/restriction and effective gluing; it is not this raw affine carrier. Universal exterior-power and finite-projective dual comparisons, determinant/Tate/period adapters and arbitrary-Q tensor-valued shuffle remain open.

All391 incoming nodes remain whole, including every statement, API, test and implementation status. All232 incoming baseline objects remain. Each of15 new construction nodes has at least three consumed APIs and three relevant tests:46 API references to15 distinct lemmas and45 test references to8 distinct typed examples. The tests use actual categorical arrows/operators: tensor a horizontal zero map, evaluate both pentagon composites on a fourfold elementary tensor, retain scalar derivative terms under both unitors, evaluate the swap and its inverse, compare all four coherence maps with native ModuleCat, retain coordinate x for λ=x,dλ=1 over Z[x], distinguish the same tensor parameter2 from4 over Z[x], and retain2≠0 with2²=0 under swapping over Z/4. The last test uses an actual nonzero scalar Higgs operator, rather than a zero connection chosen to trivialize all maps.

All149 routed obligations,35 omissions,five requests,eleven whole gaps,six planets and the inherited source issue/version envelope remain unchanged. H.0 stays partial and H.1–H.8 stay not_read. Earlier frontier paragraphs are preserved as checkpoint history. No source route, global key or supplier is closed.

## Reading and incoming evidence

The entire22198-character issue was read before claim5976288173. Bot5976289125 confirmed that exact numeric claim. The whole issue was read again in slices0–9500,9500–19000,19000–22198; the before/after bodies were byte-equal. The current global reserved key, all five supplier requests and H.0 frontier paragraphs were read. The entire incoming98-line handoff, all23 new native declarations and9 typed tests were freshly read, together with the actual recovered verifier and consumed helpers. Existing native tensor-horizontal, associator/unitors/swap and actual category/forget/isoMk proof ranges were read. Reading.json records exact scope; no fresh complete391-node or historical-reader audit is claimed.

Incoming peer PR6041 at head aece26f442351ab9d328300122dd83d0070316e2 was recovered from public archive b747718bf53692db1ee21ac03c2b642b7f3f8ba1. All55 artifacts,10 helpers and5 public deliverables authenticated. Executing its actual recovered verifier reproduced Verification.json byte-for-byte. Manifest SHA2563ecd87ad0a26b7cfee1ddd31913f5103047e13b2401e060343c9ec8894bf65e9. The entire NativePrefix.lean and CanonicalPrefix.lean are manifest-bound. This continuation only inserts one explicit individual Mathlib symmetric-module import before each original first import and appends new data/signatures. Every original prefix byte remains in order.

Own PR6032 at head e7b340473eefe100d831ff2dd324f4d94e218fbc was separately publicly recovered, including all53 artifacts,9 helpers and5 deliverables. Its manifest is7879f608e81382d8f6c461193648ad4ed77f1c3f7972439e072197126fb7ecf1. Both original own Reading.json and inherited PriorOwnReading.json were read. Reuse their governing-protocol, parent-reader, ownership/key/supplier and route readings only at original scope:37 external controls are unchanged; five incoming deliverables changed. OwnPreviousReadingGuard.json lists each exact comparison. Fresh WORKERS, PROTOCOL3–4/12–15, four reviewed parent Hodge verdict/target/duplicate projections and the whole81-line accepted REV-AUDIT02 were read. No reviewed PartII row exists; no fresh full historical audit-evidence/citation reading is asserted. Native framework statements were read at their pinned source ranges before use. A bounded search in both pinned trees found no specialized AffineCategory or preconnection monoidal/symmetric export; this is not an exhaustive absence claim.

The complete currently displayed Stacks Section60.15, its Lemma60.15.1 proof and both comments were read at https://stacks.math.columbia.edu/tag/07J5. SourceReading.json records exact HTTP bytes/hash/time; no HTML/PDF is archived. This supplies ordinary additive connection/extension conventions only. The monoidal packaging is authored from established affine horizontality and native faithful-induction APIs. No crystal theorem, full-paper/PDF reading, recursive citation closure or exhaustive errata collation is claimed. The predecessor source issue/version envelope is preserved verbatim with attribution.

## Validation

The complete suggested file imports only individual Mathlib modules and compiles at082e2d37e8b0463410cdb532e111cd43d5a66174 with Lean4.34.0-rc2, commit6a10ac8c22beadecabdbb0919c2b50214762f91d. Both checks used the existing exact build serially, each with a fresh memory guard, one thread,8192MiB managed limit and1200-second timeout. No library build, Lake setup/cache download or language server was started. Every compiler process has finished.

- Native.lean: 3735 lines, 110 examples, exit0, 0 warnings, 204 axiom audits; 38GiB available, 101.42 seconds and peak3799108KiB. Source SHA256 `9f5ada7607705cbc6a074464fd980fbc22fcadd032daee712d28a55bda991eb0`; diagnostic SHA256 `e253bdef363e2846e7c501010ca6bb4905c3e52a88cbc32ba08ca60c07a6c535`.
- Canonical.lean: 5783 lines, 307 examples, exit0, 731 warnings, 0 axiom audits; 47GiB available, 49.13 seconds and peak3431708KiB. Source SHA256 `3a946a2d0878b2f764e2372f0302658ce063ca5af0794644a8e464a219b7112d`; diagnostic SHA256 `1600399cde1fa2366e12bc3a555ccbb077451460edb2bbb7676f5341c47ee8ee`.

All204 native declaration axiom closures use only propext,Classical.choice and Quot.sound. The whole Native.lean has no admissions and compiled without warnings or errors. The complete Canonical.lean has731 admission warnings only. All30 new declaration headers and8 typed-example headers match the planning projection exactly. The15 data definitions remain concrete, including their proof fields; only15 lemma and8 example proofs are admitted in the new suggested slice. Existing admitted dependencies remain admitted in the preserved canonical prefix. The proof certificate tests these exact affine constructions, not global sheaf/source closure. Final Suggested.lean equals the complete Canonical.lean, SHA256 `3a946a2d0878b2f764e2372f0302658ce063ca5af0794644a8e464a219b7112d`.

The indexed packet checker, actual immutable intake/file rules and source issue/version checks pass without errors or warnings. The packet has421 nodes,242 baseline declarations,427 raw API entries and394 raw test references. Verification.json records recognized counts and the executed atlas graph. Publication stage DAG3022/8663, own declaration DAG421/824 and scoped DAG3438/9952 vertices/edges are all acyclic. All21 required supplier pairs are reachable. No owned skipped/pending links exist. Every foreign roadmap/stage and every stage-edge object matches its immutable control.

Mathematical base `06a7eaba33d1e9bb44a16665e05c71f29782d8cc`; publication base `b779b00cf8004c65aa4833360f77cb104abbb3c8`. All42 guarded inputs, including five incoming deliverables, and the issue's mathematical contract are unchanged between bases. Declaration-index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Both Verification-mathematical.json and Verification.json are actual immutable verifier outputs; the verifier does not execute Lean or create a repository snapshot. Helper source fences are exact archived bytes, and actual public recovery plus both verifier replays is required before submission.

## Resume

Use AffineCategory.monoidal/symmetric and the actual tensor/unit/coherence maps. Package the existing scalar-extension tensor and unit comparisons as a native strong monoidal AffineCategory.pullback functor, including naturality/associativity/unitality. Build categorical tower natural isomorphisms on the actual cancelBaseChange maps and verify their three-step and monoidal coherence, handling target parameter equalities explicitly. Continue universal exterior-power and finite-projective dual comparisons. Supply actual E1 sheaf restriction/tensor identification, equality detection and effective gluing before claiming the global finite locally free integrable key. Preserve all149 source routes,35 omissions,five requests,eleven gaps and later obligations. No implementation or source/supplier closure is marked complete.


## Public recovery and replay

Archive commit `7fb880e9dd6a9dd1f883536f7e2f152807e1fc0e` is an ancestor changing only this issue's suggested file. Its 60 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `afbe2a464ecde9d86cb9f11893e3adecb9d5fcb9247078d52531f5f5bb1a4c3d`; payload SHA256 `d997dc8f58156735b371cb3c92fd019afba1cf5b81ec2cc38133271f978e9624`. The final suggested file has no archive payload and equals the entire compiled Mathlib-only Canonical.lean.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set HODGE_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Canonical.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean and Suggested.lean are byte-equal and the whole file was compiled. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

```python
"""Recover public authenticated affine symmetric monoidal evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='HodgeStructuresPartII'
ARCHIVE='7fb880e9dd6a9dd1f883536f7e2f152807e1fc0e'
MANIFEST_SHA='afbe2a464ecde9d86cb9f11893e3adecb9d5fcb9247078d52531f5f5bb1a4c3d'
PAYLOAD_SHA='d997dc8f58156735b371cb3c92fd019afba1cf5b81ec2cc38133271f978e9624'
EXPECTED={'roadmaps': '7d8068711f61e2cdefb90b2031a57451c60472a17ff29b1abb212b11d4d70910', 'packets': '76c67e773ae23366f365c9ea9aba3ec86dd05e03e9ded22f5d5526d698df6cdb', 'readmes': '74685a3f6372a4b1f581cf0d17dbbed14dd41f3e9c66ab59469bf689ae307b84', 'suggested': '3a946a2d0878b2f764e2372f0302658ce063ca5af0794644a8e464a219b7112d'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED AFFINE SYMMETRIC MONOIDAL PAYLOAD\n',1)[1].split('END ARCHIVED AFFINE SYMMETRIC MONOIDAL PAYLOAD -/',1)[0].encode()
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
"""Append specialized affine symmetric monoidal data; preserve all incoming contracts."""
from pathlib import Path
import copy,csv,json,re,sys
S=Path(__file__).resolve().parent;RID='HodgeStructuresPartII';P=RID+':H.0/';NS='TauCeti.Hodge.ParameterConnection.Intrinsic'
def load(n):return json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
old=load('Incoming.json');p=copy.deepcopy(old);road=load('Incoming-roadmap.json')
existing={n.get('declaration'):n['id']for n in old['nodes']}
existing['Preconnection.unit']=P+'affine-unit-curvature'
# Unit implementation is an inherited proof helper; its existing unit-curvature node fixes it.
specs=[
('tensorObj','Affine tensor of categorical objects','For X=(M,D) and Y=(N,C) at the same arbitrary λ, construct X⊗Y=(ModuleCat.of R (M⊗_R N),D.affineTensor C). Use the existing balanced additive operator, with parameter λ retained once.',['AffineCategory','Preconnection.affineTensor'],'Use the existing dependent pair carrier and the balanced affine tensor operator.'),
('tensorMap','Tensor of horizontal categorical arrows','For horizontal h:X→X′ and j:Y→Y′, construct the horizontal arrow X⊗Y→X′⊗Y′ whose native linear map is TensorProduct.map h.val j.val.',['tensorObj','AffineCategory.category','Preconnection.affineTensor_horizontal'],'Apply the existing tensor-horizontal theorem to the two subtype witnesses.'),
('tensorUnit','The actual affine tensor unit','At the same arbitrary λ, construct the affine object (R,Uλ), where Uλ(a)=λ(1⊗d₀a) is the existing unit preconnection. No zero-curvature or d₀λ=0 premise is inserted in this ambient category.',['AffineCategory','Preconnection.unit'],'Reuse the inherited actual unit operator on ModuleCat.of R R. Its curvature may be nonzero for nonconstant λ.'),
('associator','Horizontal native tensor associator','Construct (X⊗Y)⊗T≅X⊗(Y⊗T) from native TensorProduct.assoc and the existing same-λ horizontal equation. The inverse is its native inverse and is horizontal by isoMk.',['tensorObj','AffineCategory.isoMk','Preconnection.affineTensor_assoc'],'Use isoMk with the actual associator-horizontal proof; do not choose an abstract existence witness.'),
('leftUnitor','Horizontal native left unitor','Construct Uλ⊗X≅X from native TensorProduct.lid and the existing same-λ horizontal identity. In particular the derivative of the scalar in r⊗x is retained.',['tensorObj','tensorUnit','AffineCategory.isoMk','Preconnection.affineTensor_lid'],'Use isoMk on the native left unitor and the actual affine left-unit horizontality proof.'),
('rightUnitor','Horizontal native right unitor','Construct X⊗Uλ≅X from native TensorProduct.rid and the existing same-λ horizontal identity, including its derived horizontal inverse.',['tensorObj','tensorUnit','AffineCategory.isoMk','Preconnection.affineTensor_rid'],'Use isoMk on the native right unitor and the actual right-unit equation.'),
('monoidalStruct','Affine monoidal data on the existing category','Supply native MonoidalCategoryStruct on AffineCategory Ω λ with the actual tensor object/map/unit/associator/unitors just constructed. Left and right whiskering are tensorMap with the categorical identity.',['tensorObj','tensorMap','tensorUnit','associator','leftUnitor','rightUnitor','mathlib:CategoryTheory.MonoidalCategoryStruct'],'Populate the existing data class with these specialized horizontal maps; no new generic monoidal framework.'),
('inducingData','Forgetful preservation of actual monoidal data','Supply native Monoidal.InducingFunctorData for the existing forgetful functor. Both tensor and unit comparisons are identity isomorphisms on the identical native ModuleCat objects. Verify the six preservation equations for whiskering, tensor maps, associator and both unitors.',['monoidalStruct','AffineCategory.forget','mathlib:ModuleCat.MonoidalCategory.instMonoidalCategoryStruct','mathlib:CategoryTheory.Monoidal.InducingFunctorData'],'Identity comparisons remove no connection data; prove the associator and unitor equations by native tensor extensionality.'),
('monoidal','Lawful affine monoidal category','Equip the actual AffineCategory Ω λ with native MonoidalCategory using its actual data and faithful forgetful functor. All tensor functor laws, naturality, pentagon and triangle are inherited via native Monoidal.induced.',['inducingData','AffineCategory.forget_faithful','mathlib:ModuleCat.monoidalCategory','mathlib:CategoryTheory.Monoidal.induced'],'Apply the existing faithful induction theorem after its specialized preservation equations are established.'),
('forgetCoreMonoidal','Core monoidal data for affine forgetting','Supply the native CoreMonoidal structure on AffineCategory.forget using fromInducedCoreMonoidal. Its tensor and unit isomorphisms are the actual identity comparisons, with the required naturality and coherence equations.',['monoidal','mathlib:CategoryTheory.Monoidal.fromInducedCoreMonoidal'],'Reuse the core monoidal data from the same inducingData, avoiding any second tensorator.'),
('forgetMonoidal','Strong monoidal affine forgetful functor','Equip the existing faithful forgetful functor with native Functor.Monoidal by CoreMonoidal.toMonoidal. The forward and inverse tensor/unit comparisons are identities on native modules. This is affine forgetting, not scalar-extension pullback.',['forgetCoreMonoidal','mathlib:CategoryTheory.Functor.CoreMonoidal.toMonoidal'],'Use the existing core-to-monoidal constructor and register this chosen structure.'),
('braiding','The actual horizontal tensor symmetry','Construct X⊗Y≅Y⊗X from native TensorProduct.comm and the existing same-λ affine tensor horizontal identity; both forward and inverse maps are the native swaps.',['monoidal','AffineCategory.isoMk','Preconnection.affineTensor_comm'],'Use isoMk on comm with the existing affine comm-horizontal proof.'),
('braided','Affine braiding with native hexagon coherence','Equip the existing affine monoidal category with native BraidedCategory, using the actual horizontal comm isomorphism. Its image under forget satisfies the native ModuleCat braiding equation with the chosen identity tensorator. Native ofFaithful supplies naturality and both hexagons.',['braiding','forgetMonoidal','AffineCategory.forget_faithful','mathlib:CategoryTheory.BraidedCategory.ofFaithful','mathlib:ModuleCat.MonoidalCategory.symmetricCategory'],'Check the forgetful braiding square by tensor extensionality on elementary tensors; reuse the native faithful constructor.'),
('forgetBraided','Braided compatibility of affine forgetting','Equip the chosen affine forgetful monoidal functor with native Functor.Braided by proving μ(X,Y)≫forget(βXY)=β(forget X,forget Y)≫μ(Y,X), for the actual swap and identity comparisons.',['braided','forgetMonoidal'],'Prove the specialized native preservation square on pure tensors; retain the chosen monoidal structure.'),
('symmetric','Affine symmetric monoidal category','Equip AffineCategory Ω λ with native SymmetricCategory through its faithful braided forgetful functor to native symmetric ModuleCat. Thus βXY≫βYX is the identity as an actual horizontal arrow.',['forgetBraided','AffineCategory.forget_faithful','mathlib:CategoryTheory.SymmetricCategory.ofFaithful','mathlib:ModuleCat.MonoidalCategory.symmetricCategory'],'Apply native SymmetricCategory.ofFaithful; no field, reducedness, integrability or constant-parameter hypothesis.'),
('tensor_connection','Actual operator in the categorical tensor','For every affine X,Y, (X⊗Y).connection equals exactly X.connection.affineTensor Y.connection.',['monoidal'],'Definitional reduction of the selected native monoidal data.'),
('tensorMap_tmul','Tensor arrow on elementary tensors','For actual horizontal h,j and x,y, (h⊗ₘj).val(x⊗y)=h.val(x)⊗j.val(y).',['monoidal'],'Reduce the chosen tensorMap to native TensorProduct.map.'),
('unit_connection','Actual operator in the monoidal unit','The affine monoidal unit has exactly the inherited additive operator Preconnection.unit Ω λ on R.',['monoidal'],'Definitional reduction; do not replace λd₀ with the zero operator.'),
('associator_linear','Linear map of the affine associator','For X,Y,T, the linear map of (α_X,Y,T).hom is exactly native TensorProduct.assoc R X.1 Y.1 T.1.',['monoidal'],'Reduce the selected associator and isoMk.'),
('leftUnitor_linear','Linear map of the affine left unitor','For X, the linear map of (λ_X).hom is native TensorProduct.lid R X.1.',['monoidal'],'Reduce the selected unitor and isoMk.'),
('rightUnitor_linear','Linear map of the affine right unitor','For X, the linear map of (ρ_X).hom is native TensorProduct.rid R X.1.',['monoidal'],'Reduce the selected unitor and isoMk.'),
('braiding_linear','Linear map of the affine braiding','For X,Y, the linear map of (β_X,Y).hom is native TensorProduct.comm R X.1 Y.1.',['braided'],'Reduce the chosen braiding and isoMk.'),
('forget_tensor_map','Forgetting the categorical tensor of arrows','For actual h,j, forget.map(h⊗ₘj)=forget.map(h)⊗ₘforget.map(j) as native ModuleCat arrows.',['monoidal','AffineCategory.forget'],'Definitional equality of the selected tensor maps.'),
('forget_tensor_comparison','The actual forgetful tensorator','For X,Y, native Functor.LaxMonoidal.μ forget X Y is exactly the identity on their native tensor module, for the chosen forgetMonoidal structure.',['forgetMonoidal'],'Reduce the chosen inducingData and core monoidal constructor.'),
('forget_unit_comparison','The actual forgetful unit comparison','Native Functor.LaxMonoidal.ε forget is exactly the identity on R, for the chosen forgetMonoidal structure.',['forgetMonoidal'],'Reduce the chosen inducingData and core monoidal constructor.'),
('tensor_id','Tensor identities as horizontal arrows','For X,Y, id_X⊗ₘid_Y=id_(X⊗Y) in the actual affine category.',['monoidal'],'Use the id_tensorHom_id law of the induced native structure.'),
('tensor_comp','Tensor composition as horizontal arrows','For h:X→X′,h′:X′→X″,j:Y→Y′,j′:Y′→Y″, (h⊗j)≫(h′⊗j′)=(h≫h′)⊗(j≫j′) in categorical order.',['monoidal'],'Use the native tensorHom_comp_tensorHom law of the induced structure.'),
('pentagon','The affine horizontal pentagon','For A,B,C,D, (αABC▷D)≫αA,(B⊗C),D≫(A◁αBCD)=α(A⊗B),C,D≫αA,B,(C⊗D) as actual horizontal arrows.',['monoidal'],'Project the native pentagon law inherited through the faithful functor.'),
('triangle','The affine horizontal triangle','For X,Y, αX,Uλ,Y≫(X◁λY)=ρX▷Y as actual horizontal arrows from (X⊗Uλ)⊗Y to X⊗Y.',['monoidal'],'Project the native triangle law inherited through the faithful functor.'),
('symmetry','Involutivity as actual horizontal arrows','For X,Y, βXY≫βYX=id_(X⊗Y) as actual arrows in the affine category.',['symmetric'],'Project the symmetry law of the native faithful symmetric structure.')]
ids={n:P+'affine-monoidal-'+re.sub(r'(?<!^)(?=[A-Z])','-',n).lower().replace('_','-')for n,*_ in specs}
construct={n for n,*_ in specs[:15]};sid='Stacks-affine-monoidal-07J5-codex-rtOQ9t'
hyp=['Commutative k→R and an existing supplied TwoForms Ω; arbitrary λ∈R. Native module objects and rings lie in the same selected universe. Degree-one forms retain their supplied k/R scalar tower. No field, basis, finite generation, projectivity, flatness, integrability or d₀λ=0 assumption.','The affine ambient category is distinct from the reserved finite locally free integrable ringed-site LambdaBundle, whose relatively constant parameter and actual sheaf restrictions/tensors/gluing remain required. Scalar-extension strong monoidal and categorical tower comparisons are later work.']
new=[]
for n,title,stmt,deps,proof in specs:
 new.append(dict(id=ids[n],parentStageId=RID+':H.0',realises=[RID+':H.0'],kind='construction'if n in construct else'lemma',title=title,declaration='AffineCategory.'+n,statement=stmt,hypotheses=hyp,prerequisites=[d if ':'in d else ids[d]if d in ids else existing[d]for d in deps],proofSteps=[proof],acceptance=[stmt,'Reuse the existing native module and monoidal APIs; compare the actual connection operators. All global key, sheaf and source closure requirements remain open.'],library=dict(module='TauCeti/Geometry/Hodge/Higgs/ParameterConnection',namespace=NS),sources=[dict(sourceId=sid,locator='Section60.15 connection/extension conventions; authored affine symmetric monoidal deductions',excerpt='connection',match='Ordinary additive convention context only. Faithful native monoidal and braiding induction and the specialized affine horizontality are authored deductions; no crystal or global sheaf theorem is attributed to this section.')],implementationStatus='unchecked'))
by={n['declaration'].split('.')[-1]:n for n in new}
api={
 'tensorObj':['tensor_connection','tensorMap_tmul','tensor_id'],
 'tensorMap':['tensorMap_tmul','tensor_id','tensor_comp'],
 'tensorUnit':['unit_connection','leftUnitor_linear','rightUnitor_linear'],
 'associator':['associator_linear','pentagon','triangle'],
 'leftUnitor':['leftUnitor_linear','triangle','unit_connection'],
 'rightUnitor':['rightUnitor_linear','triangle','unit_connection'],
 'monoidalStruct':['tensor_connection','tensorMap_tmul','unit_connection'],
 'inducingData':['forget_tensor_map','forget_tensor_comparison','forget_unit_comparison'],
 'monoidal':['tensor_id','tensor_comp','pentagon','triangle'],
 'forgetCoreMonoidal':['forget_tensor_map','forget_tensor_comparison','forget_unit_comparison'],
 'forgetMonoidal':['forget_tensor_map','forget_tensor_comparison','forget_unit_comparison'],
 'braiding':['braiding_linear','symmetry','tensor_connection'],
 'braided':['braiding_linear','symmetry','forget_tensor_map'],
 'forgetBraided':['braiding_linear','forget_tensor_comparison','forget_tensor_map'],
 'symmetric':['braiding_linear','symmetry','pentagon']}
ti=[
('tensor_zero_map','degenerate','Construct an actual horizontal zero arrow h and tensor it with arbitrary horizontal j; the resulting arrow sends every elementary tensor to zero.'),
('coherence_generators','compatibility','Evaluate both actual horizontal pentagon composites on ((a⊗b)⊗c)⊗d; both give a⊗(b⊗(c⊗d)), fixing the native direction and whiskering.'),
('unit_derivative','characterisation','Apply the actual tensor connection and each categorical unitor to r⊗x and x⊗r. Both give rD(x)+λ(x⊗d₀r), retaining the derivative term.'),
('braiding_generator','computation','The actual categorical braiding sends x⊗y to y⊗x and its second swap returns x⊗y.'),
('forget_native_data','compatibility','Forgetting the actual associator, both unitors and braiding yields exactly the four corresponding native ModuleCat morphisms.'),
('nonconstant_parameter_unit','computation','Over Z[x] with λ=x and d₀x=1, the actual categorical unit tensor and left-unitor transport of its operator at x⊗1 has coordinate x. The category permits d₀λ≠0.'),
('parameter_not_doubled','non-example','Over Z[x] with λ=2 and formal derivative, the actual categorical unit tensor and left-unitor transport at x⊗1 has coordinate2, unequal to4. Tensor retains the same parameter once.'),
('nonreduced_braiding','computation','For the scalar Higgs operator1 over Z/4, the actual braiding sends2⊗1 to1⊗2 with coordinate2≠0, square zero, and swapping twice returns the actual tensor.')]
tests={n:dict(name='AffineMonoidalTests.'+n,kind=k,statement=t)for n,k,t in ti}
tr={
 'tensorObj':['tensor_zero_map','nonconstant_parameter_unit','parameter_not_doubled'],
 'tensorMap':['tensor_zero_map','coherence_generators','braiding_generator'],
 'tensorUnit':['unit_derivative','nonconstant_parameter_unit','parameter_not_doubled'],
 'associator':['coherence_generators','forget_native_data','nonconstant_parameter_unit'],
 'leftUnitor':['unit_derivative','forget_native_data','parameter_not_doubled'],
 'rightUnitor':['unit_derivative','forget_native_data','nonconstant_parameter_unit'],
 'monoidalStruct':['coherence_generators','unit_derivative','forget_native_data'],
 'inducingData':['coherence_generators','forget_native_data','braiding_generator'],
 'monoidal':['coherence_generators','unit_derivative','parameter_not_doubled'],
 'forgetCoreMonoidal':['forget_native_data','coherence_generators','unit_derivative'],
 'forgetMonoidal':['forget_native_data','coherence_generators','nonconstant_parameter_unit'],
 'braiding':['braiding_generator','forget_native_data','nonreduced_braiding'],
 'braided':['braiding_generator','forget_native_data','nonreduced_braiding'],
 'forgetBraided':['braiding_generator','forget_native_data','nonreduced_braiding'],
 'symmetric':['braiding_generator','nonreduced_braiding','coherence_generators']}
for n in construct:
 by[n]['api']=[dict(name='AffineCategory.'+a,role='compatibility',statement=by[a]['statement'])for a in api[n]]
 by[n]['tests']=[tests[x]for x in tr[n]]
 by[n]['uses']=[dict(where=ids['symmetric']if n!='symmetric'else P+'intrinsic-pullback',how='Supply actual horizontal tensor coherence for parameter objects and subsequent strong monoidal affine pullback. This does not supply sheaf tensor descent or the reserved integrable global key.')]
p['nodes']+=new
baseNames=['CategoryTheory.MonoidalCategoryStruct','ModuleCat.MonoidalCategory.instMonoidalCategoryStruct','ModuleCat.monoidalCategory','ModuleCat.MonoidalCategory.symmetricCategory','CategoryTheory.Monoidal.InducingFunctorData','CategoryTheory.Monoidal.induced','CategoryTheory.Monoidal.fromInducedCoreMonoidal','CategoryTheory.Functor.CoreMonoidal.toMonoidal','CategoryTheory.BraidedCategory.ofFaithful','CategoryTheory.SymmetricCategory.ofFaithful']
idx=list(csv.reader(Path(sys.argv[1]).read_text().splitlines(),delimiter='\t'));base=[];reads=[]
for n in baseNames:
 row=next(x for x in idx if x[0]=='mathlib'and x[1]==n)
 base.append(dict(ref='mathlib:'+n,kind=row[2],module=row[3],line=int(row[4]),provides=row[5]+' Reuse the native framework with specialized actual affine data.',checked='Codex — codex-rtOQ9t read the actual statement at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 on2026-10-04.'))
 reads.append(dict(name=n,file=row[3],line=int(row[4]),statementLead=row[5]))
p['baseline']['declarations']+=base;save('BaselineReading.json',reads)
src=load('SourceReading.json')[0]
p['sources'].append(dict(id=sid,title='Affine symmetric monoidal deductions with ordinary connection conventions',authors='The Stacks Project authors; deductions by Codex — codex-rtOQ9t',edition='Displayed Section60.15 read4October2026',url=src['url'],sha256=src['sha256'],accessed=src['accessed'],readSections=[src['readScope']]))
frontier='The actual affine preconnection category now has a native symmetric monoidal structure: balanced same-λ tensor objects and horizontal tensor maps, actual unit/associator/unitors/swap, faithful forgetful preservation with identity comparisons, and native tensor/naturality/pentagon/triangle/hexagon/symmetry laws. Arbitrary λ including d₀λ≠0 and arbitrary modules remain allowed. Still package actual scalar-extension comparisons as a strong monoidal pullback functor and construct categorical tower natural isomorphisms/coherence; supply universal exterior-power and finite-projective dual comparisons. E1 actual sheaf tensor/restriction identification, equality detection and effective gluing remain open. The reserved finite locally free integrable ringed-site key retains relatively constant λ and is not the raw affine carrier. All149 routed obligations,35 omissions,five requests,eleven gaps,six planets and determinant/Tate/period/arbitrary-Q tensor-valued-shuffle requirements remain unchanged. H.0 stays partial; H.1–H.8 stay not_read. Earlier frontier prose is checkpoint history.'
ar=sum(len(n.get('api',[]))for n in new);dr=len({a['name']for n in new for a in n.get('api',[])});tt=sum(len(n.get('tests',[]))for n in new)
p['summary']+=f' Affine symmetric monoidal continuation:30 nodes(15 constructions15 lemmas),{ar} API references to{dr} distinct lemmas and{tt} test references to8 distinct typed examples.'
p['coverage'][0]['remaining'].append(frontier);road['stages'][0]['description']+=' '+frontier
p['verification']=dict(previousCheckpoint=old['verification'],worker='Codex — codex-rtOQ9t',date='2026-10-04',issue=3371,mathematicalBase=(S/'base.txt').read_text().strip(),compilation={n.lower():load(n+'.receipt.json')for n in ['Native','Canonical']},newNodes=30,newAPIReferences=ar,newDistinctAPI=dr,newTestReferences=tt,newDistinctTests=8,implementation='unchecked; actual affine proof artifacts only; global sheaf and source closure remain open',publicReplay='Actual public recovery and both immutable verifier reports required before submission.')
for name,data in [('Candidate.json',p),(RID+'.json',p),('Candidate-roadmap.json',road),('NewNodes.json',new),('Plan.json',dict(newNames=[n['declaration']for n in new],newNodes=[n['id']for n in new],apiAdditions={},testAdditions={},newBaseline=base,newBaselineRefs=[x['ref']for x in base],frontier=frontier,apiReferences=ar,distinctAPI=dr,testReferences=tt,distinctTests=8))]:save(name,data)
intro='''# The affine symmetric monoidal category

The existing affine category now tensors actual native modules with the existing balanced additive same-parameter connection. Tensoring horizontal arrows uses the native tensor map and its established horizontal equation. The unit carries λd₀, and the native associator, both unitors and swap are made into horizontal categorical isomorphisms by the existing inverse-horizontal constructor.

Forgetting to native ModuleCat preserves these data with identity tensor and unit comparisons. Native faithful induction gives the actual monoidal laws, including naturality, pentagon and triangle; native faithful braiding induction gives both hexagons and symmetry. The selected forgetful functor is strong monoidal and braided. These constructions use the same actual connection operators throughout. The ambient category permits arbitrary λ including d₀λ≠0, so its unit need not be flat. No generic tensor-module or monoidal framework is introduced.

Strong monoidal scalar-extension pullback and categorical tower comparisons remain open. The global reserved finite locally free integrable ringed-site key still requires relatively constant λ and actual sheaf restriction/tensor/gluing. All149 source routes,35 omissions,five supplier requests,eleven whole gaps,six planets and later stages are preserved. This is a partial planning checkpoint with every implementation unchecked; earlier frontier prose is history.

## Declarations and tests in this continuation

'''
parts=[intro]
for n in new:
 parts.append('### '+n['title']+'\n\n`'+n['declaration']+'` — '+n['statement']+'\n\nProof plan: '+' '.join(n['proofSteps'])+'\n\n')
 for field in ['api','tests']:
  if n.get(field):parts.append(field.upper()+':\n\n'+''.join('- `'+x['name']+'`: '+x['statement']+'\n'for x in n[field])+'\n')
parts.append('## Earlier checkpoint reader (preserved verbatim)\n\n')
a=''.join(parts);(S/'ReaderAddition.md').write_text(a);(S/'Reader.md').write_text(a+(S/'IncomingReader.md').read_text())
print(json.dumps({'nodes':len(p['nodes']),'baseline':len(p['baseline']['declarations']),'newNodes':len(new),'APIReferences':ar,'distinctAPI':dr,'testReferences':tt,'distinctTests':8}))
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
"""Render exact checkpoint boundaries, reading attribution and public validation receipts."""
from pathlib import Path
import json,hashlib,re
S=Path(__file__).resolve().parent
text=lambda n:(S/n).read_text()
data=lambda n:json.loads(text(n))
sha=lambda b:hashlib.sha256(b).hexdigest()
p=data('Candidate.json');g=data('Graph.json')
def line(stem):
 r=data(stem+'.receipt.json');b=(S/(stem+'.lean')).read_bytes();assert r['exitStatus']==0
 return f"- {stem}.lean: {len(b.splitlines())} lines, {len(re.findall(r'^example\b',b.decode(),re.M))} examples, exit0, {r['warnings']} warnings, {r['axiomAudits']} axiom audits; {r['availableGiBBefore']}GiB available, {r['elapsedSeconds']} seconds and peak{r['maxRssKiB']}KiB. Source SHA256 `{sha(b)}`; diagnostic SHA256 `{r['logSha256']}`.\n"
h='''# The affine symmetric monoidal category — checkpoint

Codex — codex-rtOQ9t. Refs #3371. Partial; every implementation remains unchecked.

This checkpoint adds30 declaration nodes:15 specialized constructions and15 API lemmas. The existing affine preconnection category now has a native symmetric monoidal structure on its actual modules/operators. Its tensor object uses the existing balanced same-λ affine tensor. Tensoring arrows uses native TensorProduct.map with the existing horizontal witnesses. The unit carries λd₀; the associator, both unitors and swap are the actual native linear equivalences made into horizontal categorical isomorphisms. Their inverses are horizontal by the inherited isoMk constructor.

The faithful forgetful functor to native ModuleCat preserves this actual data with identity tensor/unit comparisons. Native Monoidal.induced gives all tensor functor laws, naturality, pentagon and triangle. Native BraidedCategory.ofFaithful and SymmetricCategory.ofFaithful give braiding naturality, both hexagons and symmetry. The selected forgetful functor itself is strong monoidal and braided. The code fixes a common universe for rings/module carriers and retains the supplied scalar tower on forms. Arbitrary modules and arbitrary λ including d₀λ≠0 are allowed. In particular this ambient unit is not asserted flat for nonconstant λ. No generic module, tensor or monoidal framework is replanned.

Strong monoidal scalar-extension pullback and categorical tower natural isomorphisms/coherence remain open. The reserved finite locally free integrable ringed-site key still requires relatively constant λ, actual sheaf calculus/tensor/restriction and effective gluing; it is not this raw affine carrier. Universal exterior-power and finite-projective dual comparisons, determinant/Tate/period adapters and arbitrary-Q tensor-valued shuffle remain open.

All391 incoming nodes remain whole, including every statement, API, test and implementation status. All232 incoming baseline objects remain. Each of15 new construction nodes has at least three consumed APIs and three relevant tests:46 API references to15 distinct lemmas and45 test references to8 distinct typed examples. The tests use actual categorical arrows/operators: tensor a horizontal zero map, evaluate both pentagon composites on a fourfold elementary tensor, retain scalar derivative terms under both unitors, evaluate the swap and its inverse, compare all four coherence maps with native ModuleCat, retain coordinate x for λ=x,dλ=1 over Z[x], distinguish the same tensor parameter2 from4 over Z[x], and retain2≠0 with2²=0 under swapping over Z/4. The last test uses an actual nonzero scalar Higgs operator, rather than a zero connection chosen to trivialize all maps.

All149 routed obligations,35 omissions,five requests,eleven whole gaps,six planets and the inherited source issue/version envelope remain unchanged. H.0 stays partial and H.1–H.8 stay not_read. Earlier frontier paragraphs are preserved as checkpoint history. No source route, global key or supplier is closed.

## Reading and incoming evidence

The entire22198-character issue was read before claim5976288173. Bot5976289125 confirmed that exact numeric claim. The whole issue was read again in slices0–9500,9500–19000,19000–22198; the before/after bodies were byte-equal. The current global reserved key, all five supplier requests and H.0 frontier paragraphs were read. The entire incoming98-line handoff, all23 new native declarations and9 typed tests were freshly read, together with the actual recovered verifier and consumed helpers. Existing native tensor-horizontal, associator/unitors/swap and actual category/forget/isoMk proof ranges were read. Reading.json records exact scope; no fresh complete391-node or historical-reader audit is claimed.

Incoming peer PR6041 at head aece26f442351ab9d328300122dd83d0070316e2 was recovered from public archive b747718bf53692db1ee21ac03c2b642b7f3f8ba1. All55 artifacts,10 helpers and5 public deliverables authenticated. Executing its actual recovered verifier reproduced Verification.json byte-for-byte. Manifest SHA2563ecd87ad0a26b7cfee1ddd31913f5103047e13b2401e060343c9ec8894bf65e9. The entire NativePrefix.lean and CanonicalPrefix.lean are manifest-bound. This continuation only inserts one explicit individual Mathlib symmetric-module import before each original first import and appends new data/signatures. Every original prefix byte remains in order.

Own PR6032 at head e7b340473eefe100d831ff2dd324f4d94e218fbc was separately publicly recovered, including all53 artifacts,9 helpers and5 deliverables. Its manifest is7879f608e81382d8f6c461193648ad4ed77f1c3f7972439e072197126fb7ecf1. Both original own Reading.json and inherited PriorOwnReading.json were read. Reuse their governing-protocol, parent-reader, ownership/key/supplier and route readings only at original scope:37 external controls are unchanged; five incoming deliverables changed. OwnPreviousReadingGuard.json lists each exact comparison. Fresh WORKERS, PROTOCOL3–4/12–15, four reviewed parent Hodge verdict/target/duplicate projections and the whole81-line accepted REV-AUDIT02 were read. No reviewed PartII row exists; no fresh full historical audit-evidence/citation reading is asserted. Native framework statements were read at their pinned source ranges before use. A bounded search in both pinned trees found no specialized AffineCategory or preconnection monoidal/symmetric export; this is not an exhaustive absence claim.

The complete currently displayed Stacks Section60.15, its Lemma60.15.1 proof and both comments were read at https://stacks.math.columbia.edu/tag/07J5. SourceReading.json records exact HTTP bytes/hash/time; no HTML/PDF is archived. This supplies ordinary additive connection/extension conventions only. The monoidal packaging is authored from established affine horizontality and native faithful-induction APIs. No crystal theorem, full-paper/PDF reading, recursive citation closure or exhaustive errata collation is claimed. The predecessor source issue/version envelope is preserved verbatim with attribution.

## Validation

The complete suggested file imports only individual Mathlib modules and compiles at082e2d37e8b0463410cdb532e111cd43d5a66174 with Lean4.34.0-rc2, commit6a10ac8c22beadecabdbb0919c2b50214762f91d. Both checks used the existing exact build serially, each with a fresh memory guard, one thread,8192MiB managed limit and1200-second timeout. No library build, Lake setup/cache download or language server was started. Every compiler process has finished.

'''+line('Native')+line('Canonical')+f'''
All204 native declaration axiom closures use only propext,Classical.choice and Quot.sound. The whole Native.lean has no admissions and compiled without warnings or errors. The complete Canonical.lean has731 admission warnings only. All30 new declaration headers and8 typed-example headers match the planning projection exactly. The15 data definitions remain concrete, including their proof fields; only15 lemma and8 example proofs are admitted in the new suggested slice. Existing admitted dependencies remain admitted in the preserved canonical prefix. The proof certificate tests these exact affine constructions, not global sheaf/source closure. Final Suggested.lean equals the complete Canonical.lean, SHA256 `{sha((S/'Canonical.lean').read_bytes())}`.

The indexed packet checker, actual immutable intake/file rules and source issue/version checks pass without errors or warnings. The packet has421 nodes,242 baseline declarations,{sum(len(n.get('api',[]))for n in p['nodes'])} raw API entries and{sum(len(n.get('tests',[]))for n in p['nodes'])} raw test references. Verification.json records recognized counts and the executed atlas graph. Publication stage DAG{g['stageDAG']['vertices']}/{g['stageDAG']['edges']}, own declaration DAG{g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']} and scoped DAG{g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']} vertices/edges are all acyclic. All{g['requiredPairs']} required supplier pairs are reachable. No owned skipped/pending links exist. Every foreign roadmap/stage and every stage-edge object matches its immutable control.

Mathematical base `{text('base.txt').strip()}`; publication base `{text('publication-base.txt').strip()}`. All42 guarded inputs, including five incoming deliverables, and the issue's mathematical contract are unchanged between bases. Declaration-index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Both Verification-mathematical.json and Verification.json are actual immutable verifier outputs; the verifier does not execute Lean or create a repository snapshot. Helper source fences are exact archived bytes, and actual public recovery plus both verifier replays is required before submission.

## Resume

Use AffineCategory.monoidal/symmetric and the actual tensor/unit/coherence maps. Package the existing scalar-extension tensor and unit comparisons as a native strong monoidal AffineCategory.pullback functor, including naturality/associativity/unitality. Build categorical tower natural isomorphisms on the actual cancelBaseChange maps and verify their three-step and monoidal coherence, handling target parameter equalities explicitly. Continue universal exterior-power and finite-projective dual comparisons. Supply actual E1 sheaf restriction/tensor identification, equality detection and effective gluing before claiming the global finite locally free integrable key. Preserve all149 source routes,35 omissions,five requests,eleven gaps and later obligations. No implementation or source/supplier closure is marked complete.

'''
(S/'HandoffBase.md').write_text(h);(S/'Handoff.md').write_text(h)
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
assert len(old['nodes'])==391 and len(p['nodes'])==421
assert p['nodes'][391:]==data('NewNodes.json')and set(p)==set(old)
for before,after in zip(old['nodes'],p['nodes']):
 expected=json.loads(json.dumps(before));nid=before['id']
 if nid in plan['apiAdditions']:expected['api']+=plan['apiAdditions'][nid]
 if nid in plan['testAdditions']:expected['tests']+=plan['testAdditions'][nid]
 assert after==expected,nid
assert sum(a==b for a,b in zip(old['nodes'],p['nodes']))==391
for k in old:
 if k not in ['nodes','summary','sources','coverage','gaps','verification','baseline']:assert p[k]==old[k],k
assert p['baseline']['declarations']==old['baseline']['declarations']+plan['newBaseline']
assert {k:v for k,v in p['baseline'].items()if k!='declarations'}=={k:v for k,v in old['baseline'].items()if k!='declarations'}
assert [x['ref']for x in p['baseline']['declarations'][232:]]==plan['newBaselineRefs']
assert p['sources'][:-1]==old['sources']and p['summary'].startswith(old['summary'])
assert p['coverage'][1:]==old['coverage'][1:]and p['coverage'][0]['remaining'][:-1]==old['coverage'][0]['remaining']
assert {k:v for k,v in p['coverage'][0].items()if k!='remaining'}=={k:v for k,v in old['coverage'][0].items()if k!='remaining'}
assert p['gaps']==old['gaps']
assert p['verification']['previousCheckpoint']==old['verification']
assert p['status']=='partial'and all(n['implementationStatus']=='unchecked'for n in p['nodes'])
assert len(p['requests'])==5 and len(p['gaps'])==11 and len(p['sourceIssues'])==1
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
assert incoming['head']=='aece26f442351ab9d328300122dd83d0070316e2'and incoming['artifactsVerified']==55 and incoming['archivedHelpersVerified']==10
assert sha((S/'IncomingManifest.json').read_bytes())=='3ecd87ad0a26b7cfee1ddd31913f5103047e13b2401e060343c9ec8894bf65e9'
assert (S/'PreviousVerification.json').read_bytes()==(S/'PreviousVerification-replayed.json').read_bytes()
for name,prefix in [('Native.lean','NativePrefix.lean'),('Canonical.lean','CanonicalPrefix.lean')]:assert im[name]['sha256']==sha((S/prefix).read_bytes())
for path,n in zip(paths,['Incoming-roadmap.json','Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert sha((S/n).read_bytes())==incoming['publicDeliverables'][path]
assert text('Incoming.lean')==text('CanonicalPrefix.lean')
own=data('OwnPreviousReadingGuard.json')
assert len(own['unchanged'])==37 and len(own['changed'])==5
for g in own['unchanged']:
 assert sha(blob(MATH,g['path']))==g['before']==g['after'],g['path']
assert data('ClaimReceipt.json')['claimComment']==5976288173 and data('ClaimReceipt.json')['confirmationComment']==5976289125
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='7879f608e81382d8f6c461193648ad4ed77f1c3f7972439e072197126fb7ecf1'
o=data('OwnPreviousRecovery.json');assert o['head']=='e7b340473eefe100d831ff2dd324f4d94e218fbc' and o['artifactsVerified']==53 and o['archivedHelpersVerified']==9
assert sha((S/'OwnPreviousPublicHandoff.md').read_bytes())==o['publicDeliverables'][paths[-1]]
assert text('Native.lean')==with_imports(text('NativePrefix.lean'))+'\n'+text('NewProofs.lean')+'\n'+text('NewTests.lean')+'\n'+text('Audits.lean')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',text('Native.lean'))
from projection import project
assert text('NewAdmitted.lean')==project(text('NewProofs.lean')+'\n'+text('NewTests.lean'))
assert len(re.findall(r'\bsorry\b',text('NewAdmitted.lean')))==23
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
assert {**nh,**nt}==ch and len(nh)==30 and len(nt)==8
assert set(plan['newNames'])==set(nh)=={n['declaration']for n in p['nodes'][391:]}
new=p['nodes'][391:]
assert {t['name']for n in new for t in n.get('tests',[])}==set(re.findall(r'^-- test: (.+)$',text('NewTests.lean'),re.M))
assert sum(len(n.get('api',[]))for n in new)==46 and len({x['name']for n in new for x in n.get('api',[])})==15
assert sum(len(n.get('tests',[]))for n in new)==45
for n in new:
 assert n['declaration']in text('Reader.md')and n['statement']in text('Reader.md')
 if n['kind']in ['definition','construction']:
  assert len(n['api'])>=3 and len(n['tests'])>=3 and n['uses']
 for k in ['api','tests']:
  for x in n.get(k,[]):assert x['name']in text('Reader.md')and x['statement']in text('Reader.md')
assert text('Audits.lean')=='\n'.join('#print axioms TauCeti.Hodge.ParameterConnection.Intrinsic.'+n for n in plan['newNames'])+'\n'
for name,warnings,examples,audits in [('Native.lean',0,110,204),('Canonical.lean',731,307,0)]:
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
problems=[x for f in paths for x in env['file_problems'](f,contents[f])];refusals=env['auto_refusals'](job,paths,False,{'codex-rtOQ9t'},set())
assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'HODGE_VALIDATE_BASE':BASE}))
assert graph['immutableBase']==BASE
print(json.dumps(dict(checker=summary,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,wholeIncomingNodesUnchanged=391,preservedMathematicalContracts=391,newNodes=30,newAPIReferences=46,newDistinctAPI=15,newTestReferences=45,newDistinctTests=8,matchedNewHeaders=len(ch),rawAPIItems=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),compilation=p['verification']['compilation'],inputGuards=len(data('InputGuard.json')),indexSha256=sha(Path(sys.argv[2]).read_bytes()),mathematicalBase=MATH,immutableBase=BASE,graph=graph,fullCanonicalCompiled=True,sourceScope='Bounded current Stacks07J5 reading; whole inherited source/version envelope retained with prior attribution; no fresh complete-paper or erratum collation.',LeanExecuted=False),indent=2))
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

## Script: runcheck.py

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
PreviousVerification-replayed.json NativePrefix.lean CanonicalPrefix.lean
Native.lean Native.log Native.receipt.json Canonical.lean Canonical.log Canonical.receipt.json
NewImports.lean NewProofs.lean NewTests.lean NewAdmitted.lean Audits.lean Candidate-roadmap.json Candidate.json Reader.md ReaderAddition.md Suggested.lean Handoff.md HandoffBase.md
ClaimReceipt.json Reading.json SourceReading.json BaselineReading.json PriorOwnReading.json
OwnPreviousReadingGuard.json OwnPreviousManifest.json OwnPreviousRecovery.json OwnPreviousInheritedReading.json OwnPreviousPublicHandoff.md
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
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED AFFINE SYMMETRIC MONOIDAL PAYLOAD\n'+pb+b'END ARCHIVED AFFINE SYMMETRIC MONOIDAL PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('roadmaps','Candidate-roadmap.json'),('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated affine symmetric monoidal evidence; never executes Lean."""
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
pb=raw.split('/- BEGIN ARCHIVED AFFINE SYMMETRIC MONOIDAL PAYLOAD\\n',1)[1].split('END ARCHIVED AFFINE SYMMETRIC MONOIDAL PAYLOAD -/',1)[0].encode()
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
