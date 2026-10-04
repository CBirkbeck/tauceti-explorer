# Monoidal identity and tower comparisons — checkpoint

Codex — codex-7e92bd. Refs #3371. Partial; every implementation remains unchecked.

The existing identity and tower pullback natural isomorphisms now satisfy native NatTrans.IsMonoidal in both directions for the actual strong monoidal structures. ParameterChange along an equality λ=μ has a native Monoidal instance whose four structure maps have identity underlying linear maps. The tower is the actual composite of two pullbacks and this parameter transport, not a replacement functor. Its unit is the composite of the two inverse rid maps, its tensorator uses successive inverse distribBaseChange maps, and its inverse tensorator reverses those maps. The existing cancelBaseChange natural isomorphism preserves these actual unit and tensorator maps.

The actual affine pullback also carries native Functor.Braided extending the existing strong monoidal structure. Its braiding equation is an equality of actual horizontal categorical arrows. Cancelling the invertible tensorator reduces the equation to native heterobasic tensor extensionality. The restricted scalar action in this proof is Module.compHom; the tower comparison uses the existing native scalar towers. The unit and tensor equations for the identity and tower comparisons are proved separately, and their inverse transformations use Mathlib's native inverse-monoidal-isomorphism instance.

Commutative k,R,S,T and the module carriers share the native module universe; degree-one and degree-two form modules keep independent universes. Calculus maps lie over actual algebra maps, with IsScalarTower R S T for the tower. Modules and λ are arbitrary. No flatness, injectivity, basis, finite generation, projectivity, reducedness, integrability or d₀λ=0 is added. This raw affine category remains separate from the reserved global finite locally free integrable ringed-site key, which retains relatively constant λ and actual sheaf tensor/calculus requirements.

All 455 incoming declaration objects and 248 baseline objects remain whole. This continuation adds 19 nodes: three constructions and16 lemmas, 12 API references to 12 distinct declarations, and 12 test references to11 distinct typed examples. Two API references reuse existing actual unit/tensor maps. Every construction has at least three APIs and three relevant tests. Examples evaluate arbitrary parameter-equality maps and their roundtrip on arbitrary tensors; identity unit/tensor maps; actual braiding; actual tower unit/tensor maps and inverse monoidal compatibility; polynomial parameter x with d₀x=1; the nonzero square-zero value2 over Z/4 through actual tower maps; and the actual tensorator over the zero ring.

Categorical three-step coherence, universal exterior-power and finite-projective dual comparisons remain open. Genuine E1 sheaf tensor/restriction/equality detection/effective gluing, determinant/Tate/period adapters and arbitrary-Q tensor-valued shuffle remain open. All149 routed obligations,35 omissions,five supplier requests,eleven whole gaps,six planets and the source issue/version envelope are preserved with prior attribution. H.0 stays partial; H.1–H.8 stay not_read. Older frontier paragraphs are checkpoint history; the latest appended frontier states the current scope.

## Reading and incoming evidence

The entire 22198-character issue was read before claim5978291493 and after exact bot confirmation5978292301; bodies were byte-equal. ClaimReceipt.json records the complete read intervals and body hash. The whole current reserved key, allfive requests, currentH.0 stage description/frontier, whole gap0 and lasttwo gaps were read. Allfour complete reviewed parent Hodge audit objects and their review metadata were freshly read; no PartII row exists. They are not replanned. No fresh whole455-node or full historical-reader audit is claimed.

Peer PR6059 at immutable head5406fde91d42276ed6a7fb682542d53c555eae09 was actually recovered over public HTTP from archive8656073b303dcc1cf7ec7106a6a127653ca07a75. All60 artifacts,10 archived helpers and5 public files authenticated against manifest1409fad87dc87ba6dba7c6f04305c8a1821078fa6d4fa30b3a17913050ddf3d0. Both actual recovered publication and mathematical verifiers reproduced their reports byte-for-byte. Its current handoff narrative through recovery, all20 new proof declarations and6 typed tests, every consumed helper, and native ranges3120–3255 and3710–3870 were freshly read. The full4335-line native and6294-line canonical prefixes are authenticated and preserved byte-for-byte in order, with an explicit new import inserted and this continuation appended. This is authenticated compiled prefix reuse, not a claim to have manually reread every inherited line.

Own PR6053 evidence retained from this same worker binds Reading.json and42 controls to manifestf6ca1705c035aea5f4bb6cb2c6a35b915010f49edfff3463b1c07f0161c854df. Its nested own6041 reading and input hashes authenticate through manifest3ecd87ad0a26b7cfee1ddd31913f5103047e13b2401e060343c9ec8894bf65e9. Both own reading receipts were personally read whole. Exactly37 unchanged external controls reuse only their originally recorded bounded scopes; the five advanced deliverables were separately consumed as above. No peer reading is relabelled as this worker's. WORKERS was freshly read here; exact governing protocol and upstream-reader scopes from this continuous worker loop remain recorded in Reading.json. Fresh pinned native source ranges and bounded searches for all19 specialized names are listed there; no matching exports were found, without an exhaustive absence claim.

The complete displayed Stacks Section60.15 statement/proof and both comments were freshly read from direct public HTML after a browser timeout. SourceReading.json binds bytes, hash and retrieval time. Only ordinary connection/exterior conventions are used. The native monoidal comparison and braided package is an authored deduction from inherited actual affine constructions and pinned Mathlib APIs. No crystal equivalence, fresh whole-paper/PDF audit, recursive citation closure or new erratum claim is made. The inherited issue/version envelope is preserved exactly.

## Validation

The entire suggested file is Mathlib-only and compiled at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 with Lean4.34.0-rc2, compiler6a10ac8c22beadecabdbb0919c2b50214762f91d. Both exact source pins, including Tau Ceti f790474821cf4256814db967cb154e7af3d0c369, and tracked cleanliness were rechecked. Each serial elaboration used the existing pinned build, exact compiled dependencies, a fresh available-memory≥20GiB check, one thread,8192MiB managed limit and1200-second timeout. No second compiler, Lean-file edit or rebase ran during this worker's compilations. No Lake setup, library rebuild, download or language server was started. A disposable prefix object was used only for prototype checks; the final certificate replays the entire native source.

- Native.lean: 4778 lines, 133 examples, exit0, 0 warnings and 257 axiom audits; 44GiB available, 77.8 seconds, peak3933012KiB. Source SHA256 `7e1ac5f1897a3e8b3f791f50ae4218981715297982f8f3daa60e060a56a8ac61`; diagnostic SHA256 `ba2fc4435174f939a472ae559f6128ab104dca715b85044d95ed7b4225874c19`.
- Canonical.lean: 6586 lines, 330 examples, exit0, 797 warnings and 0 axiom audits; 44GiB available, 43.98 seconds, peak3538784KiB. Source SHA256 `68288286b288df601e59b1c1cca826907da917bf0b509e5a4813d949f822cf31`; diagnostic SHA256 `0c3747fe8a3fc4fdb213d3d4c864e6dc64e2430ec2ee3e8dfbe0a24a1d10766e`.

All257 native axiom closures use only propext,Classical.choice and Quot.sound, without warnings, errors or admissions. The entire canonical file has797 admission warnings only. All19 declaration headers and11 typed-example headers match the admitted planning projection exactly. The three new constructions remain concrete;16 lemma proofs and11 test proofs are admitted only in the suggested planning slice. Its preserved canonical prefix retains its earlier admitted dependencies. Suggested.lean and the entire compiled Canonical.lean are byte-equal, SHA256 `68288286b288df601e59b1c1cca826907da917bf0b509e5a4813d949f822cf31`. These are actual affine certificates; global sheaf and source closure remain open.

The actual indexed checker, immutable intake/file rules, source issue/version checks and atlas assembler pass without errors or warnings. The packet contains 474 nodes,255 baseline declarations,466 raw API entries and427 raw test references. Publication stage DAG 3022/8663, own declaration DAG 474/906, and scoped DAG 3491/10087 vertices/edges are acyclic. All21 required supplier pairs are reachable, with no own skipped or pending links. Every foreign roadmap/stage and stage-edge object matches the immutable control.

Mathematical base `4ae85ec4bf15b17e66fe8b22db9b7e1cb5cc25f4`; publication base `9b2fe3f7a420597dfaf6a6ca3880e95d282e7b21`. All42 guarded input hashes and the issue's mathematical contract agree between bases. Declaration-index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Both verifier reports execute actual immutable checker/intake/atlas code, without Lean or a repository snapshot. Actual final public HTTP recovery authenticates all helper fences and both recovered verifier outputs byte-for-byte before submission.

## Resume

Use the existing pullbackIdentityIso and pullbackTowerIso with their actual IsMonoidal instances, parameterChangeMonoidal, pullbackTowerMonoidal and pullbackBraided. Prove categorical three-step coherence with the existing module-level associativity comparison, keeping parameter transports and comparison directions explicit. Then continue universal exterior-power and finite-projective dual comparisons and genuine E1 sheaf tensor/restriction/equality detection/effective gluing before closing the global key. Preserve all149 routed items,35 omissions,five requests,eleven gaps and later-stage/source obligations.

## Public recovery and replay

Archive commit `b239659bb7c5d05fbe545baeab78d877644f0033` is an ancestor changing only this issue's suggested file. Its 63 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `a457bc844e43bbdbcbe384ca2951ead0954d408c334363938a349261e9f26a79`; payload SHA256 `a51ed62ad746c8956a9406ab591dff6f399a9ec0f00954d0b57bd48f1ada6819`. The final suggested file has no archive payload and equals the entire compiled Mathlib-only Canonical.lean.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set HODGE_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Canonical.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean and Suggested.lean are byte-equal and the whole file was compiled. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

```python
"""Recover public authenticated affine monoidal comparison evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='HodgeStructuresPartII'
ARCHIVE='b239659bb7c5d05fbe545baeab78d877644f0033'
MANIFEST_SHA='a457bc844e43bbdbcbe384ca2951ead0954d408c334363938a349261e9f26a79'
PAYLOAD_SHA='a51ed62ad746c8956a9406ab591dff6f399a9ec0f00954d0b57bd48f1ada6819'
EXPECTED={'roadmaps': '757775a0ae11ceb03ad00786ac0deaf3787415d0843c59923c68d2b83c968744', 'packets': '27c081568cf2c80fdd97e63a31d34bd69f479c29a034425865c448b02e4ecd5e', 'readmes': 'c4f3bcce8039235dffe6bd9104c1458b6c0ac2994196723f0c1726afbd0e8288', 'suggested': '68288286b288df601e59b1c1cca826907da917bf0b509e5a4813d949f822cf31'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED AFFINE MONOIDAL COMPARISONS PAYLOAD\n',1)[1].split('END ARCHIVED AFFINE MONOIDAL COMPARISONS PAYLOAD -/',1)[0].encode()
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
"""Append native strong monoidal affine pullback plans; preserve every incoming contract."""
from pathlib import Path
import copy,csv,json,re,sys
S=Path(__file__).resolve().parent;RID='HodgeStructuresPartII';P=RID+':H.0/';NS='TauCeti.Hodge.ParameterConnection.Intrinsic'
def load(n):return json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
old=load('Incoming.json');p=copy.deepcopy(old);road=load('Incoming-roadmap.json')
existing={n.get('declaration'):n['id']for n in old['nodes']}
"""Declaration-sized specifications for actual monoidal comparison maps."""
specs=[
('parameterChangeMonoidal','Monoidal transport of the connection parameter','For an equality h:λ=μ in R, equip the actual parameterChange(h) functor from affine λ-connections to affine μ-connections with native strong monoidal structure. Its four structure maps have identity underlying linear maps.',['AffineCategory.parameterChange','mathlib:CategoryTheory.Functor.Monoidal'],'Eliminate h and use the native monoidal identity functor; actual operators and horizontal arrows are retained.'),
('parameterChangeMonoidal_tensor','Parameter transport tensorator','The actual lax tensor map of parameterChange(h) at X,Y is the identity R-linear map on their underlying tensor product.',['parameterChangeMonoidal'],'Eliminate the parameter equality and reduce the native identity tensorator.'),
('parameterChangeMonoidal_unit','Parameter transport unit','The actual lax unit map of parameterChange(h) is the identity R-linear map on R.',['parameterChangeMonoidal'],'Eliminate the parameter equality and reduce the native identity unit map.'),
('parameterChangeMonoidal_cotensor','Parameter transport inverse tensorator','The actual oplax tensor map of parameterChange(h) at X,Y is the identity R-linear map.',['parameterChangeMonoidal'],'Eliminate the parameter equality and reduce the native inverse tensorator.'),
('parameterChangeMonoidal_counit','Parameter transport counit','The actual oplax unit map of parameterChange(h) is the identity R-linear map on R.',['parameterChangeMonoidal'],'Eliminate the parameter equality and reduce the native counit.'),
('pullbackIdentityIso_unit','Identity comparison preserves the unit','The unit comparison for pullback along the identity calculus morphism followed by the unit component of the existing pullbackIdentityIso equals the native identity functor unit map, as actual horizontal arrows.',['AffineCategory.pullbackMonoidal','AffineCategory.pullbackIdentityIso','mathlib:TensorProduct.lid','mathlib:TensorProduct.AlgebraTensorModule.rid'],'Use subtype extensionality and evaluate the actual composite lid after rid inverse at r; it gives r·1=r.'),
('pullbackIdentityIso_tensor','Identity comparison preserves tensor products','For actual X,Y, the identity-pullback tensorator followed by the component of pullbackIdentityIso at X⊗Y equals the tensor of its components followed by the identity functor tensorator.',['AffineCategory.pullbackMonoidal','AffineCategory.pullbackIdentityIso','AffineCategory.pullbackTensorIso','mathlib:TensorProduct.AlgebraTensorModule.curry_injective','mathlib:TensorProduct.smul_tmul\''],'Precompose with the invertible tensorator inverse; use horizontal-arrow extensionality and native heterobasic tensor extensionality. Both maps take r⊗(x⊗y) to (r·x)⊗y.'),
('pullbackIdentityIso_isMonoidal','Monoidal identity natural isomorphism','The hom natural transformation of the existing pullbackIdentityIso satisfies native NatTrans.IsMonoidal for the actual pullback monoidal structure and native identity monoidal structure.',['pullbackIdentityIso_unit','pullbackIdentityIso_tensor','mathlib:CategoryTheory.NatTrans.IsMonoidal'],'Package the proved unit and tensor equations; install the resulting proposition as an instance.'),
('pullbackIdentityIso_inv_isMonoidal','Inverse identity comparison is monoidal','The inverse natural transformation of pullbackIdentityIso satisfies native NatTrans.IsMonoidal for those same structures.',['pullbackIdentityIso_isMonoidal','mathlib:CategoryTheory.NatTrans.IsMonoidal'],'Apply the pinned native inverse-natural-isomorphism instance, whose proof cancels the hom components in the unit and tensor equations.'),
('pullback_braiding','Affine pullback preserves braiding','For actual X,Y, the pullback tensorator followed by pullback of the source braiding equals the target braiding followed by the tensorator with X,Y interchanged, as actual horizontal arrows.',['AffineCategory.pullbackTensorIso','AffineCategory.braided','mathlib:TensorProduct.AlgebraTensorModule.curry_injective','mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange_symm_tmul','mathlib:Module.compHom','mathlib:IsScalarTower.of_compHom'],'Cancel the invertible tensorator; restrict the target module action by the actual algebra map and use native tensor extensionality. The inverse tensorator sends (1⊗y)⊗(s⊗x) to s⊗(y⊗x).'),
('pullbackBraided','Native braided affine pullback','Equip the actual affine pullback functor along m with native Functor.Braided, extending its existing strong monoidal structure and preserving the existing native braidings.',['AffineCategory.pullbackMonoidal','pullback_braiding','mathlib:CategoryTheory.Functor.Braided'],'Retain the existing monoidal structure and supply the proved actual braiding equation.'),
('pullbackTowerMonoidal','Monoidal structure on the actual pullback tower','For compatible calculus morphisms m over R→S and n over S→T with IsScalarTower R S T, equip the existing pullbackTower(n,m) with the composite native strong monoidal structure, including its final parameterChange along the scalar-tower equality.',['AffineCategory.pullbackTower','AffineCategory.pullbackMonoidal','parameterChangeMonoidal','mathlib:CategoryTheory.Functor.Monoidal','mathlib:CategoryTheory.Functor.LaxMonoidal.comp','mathlib:CategoryTheory.Functor.OplaxMonoidal.comp'],'Use the native monoidal composition instance on pullback(m), pullback(n), and the actual equality-transport functor; do not replace the transported target parameter by an informal equality.'),
('pullbackTowerMonoidal_unit','Actual tower unit formula','The underlying T-linear unit map of pullbackTower is the inverse rid for S→T followed by the T-base change of inverse rid for R→S. The parameter-transport unit contributes the identity.',['pullbackTowerMonoidal','parameterChangeMonoidal_unit','mathlib:CategoryTheory.Functor.LaxMonoidal.comp'],'Reduce the native composite unit formula and rewrite the actual parameter-change unit map.'),
('pullbackTowerMonoidal_tensor','Actual tower tensorator formula','The underlying T-linear tensorator of pullbackTower at X,Y is inverse distribBaseChange for S→T on S⊗R X,S⊗R Y, followed by the T-base change of inverse distribBaseChange for R→S on X,Y.',['pullbackTowerMonoidal','parameterChangeMonoidal_tensor','mathlib:CategoryTheory.Functor.LaxMonoidal.comp'],'Reduce the native composite tensorator and rewrite the parameter-change tensorator at the actual twice-pulled objects.'),
('pullbackTowerMonoidal_cotensor','Actual tower inverse tensorator formula','The underlying T-linear inverse tensorator is the T-base change of distribBaseChange for R→S, followed by distribBaseChange for S→T.',['pullbackTowerMonoidal','parameterChangeMonoidal_cotensor','mathlib:CategoryTheory.Functor.OplaxMonoidal.comp'],'Reduce the native composite oplax tensor map and rewrite the actual parameter-change inverse tensorator.'),
('pullbackTowerIso_unit','Tower comparison preserves the unit','The actual tower unit followed by the unit component of the existing pullbackTowerIso(n,m) equals the direct-pullback unit for n.towerComp(m), as actual horizontal arrows.',['pullbackTowerMonoidal_unit','AffineCategory.pullbackTowerIso','AffineCategory.pullbackMonoidal','mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange_tmul'],'Use horizontal-arrow extensionality and the actual unit formula; cancelBaseChange sends t⊗(1⊗1) to t⊗1.'),
('pullbackTowerIso_tensor','Tower comparison preserves tensor products','For actual X,Y, the tower tensorator followed by the existing tower comparison at X⊗Y equals the tensor of the two comparison components followed by the direct-pullback tensorator.',['pullbackTowerMonoidal_cotensor','AffineCategory.pullbackTowerIso','AffineCategory.pullbackMonoidal','mathlib:CategoryTheory.Functor.Monoidal','mathlib:TensorProduct.AlgebraTensorModule.curry_injective','mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange_tmul','mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange_symm_tmul'],'Precompose with the actual invertible tower inverse tensorator. Twice apply native heterobasic tensor extensionality, then ordinary tensor extensionality. On t⊗(s⊗(x⊗y)), both sides are (s·t)⊗(x⊗y); retain the native existing scalar towers.'),
('pullbackTowerIso_isMonoidal','Monoidal tower natural isomorphism','The hom natural transformation of the existing pullbackTowerIso(n,m) satisfies native NatTrans.IsMonoidal between the actual tower structure and direct-pullback structure.',['pullbackTowerIso_unit','pullbackTowerIso_tensor','mathlib:CategoryTheory.NatTrans.IsMonoidal'],'Package the unit and tensor equations and install the resulting proposition as an instance.'),
('pullbackTowerIso_inv_isMonoidal','Inverse tower comparison is monoidal','The inverse natural transformation of pullbackTowerIso(n,m) satisfies native NatTrans.IsMonoidal for the direct and iterated pullback structures.',['pullbackTowerIso_isMonoidal','mathlib:CategoryTheory.NatTrans.IsMonoidal'],'Use the native monoidal inverse-natural-isomorphism instance; the actual inverse remains the existing cancelBaseChange inverse.')]
construct={'parameterChangeMonoidal','pullbackBraided','pullbackTowerMonoidal'}
apis={'parameterChangeMonoidal':['parameterChangeMonoidal_tensor','parameterChangeMonoidal_unit','parameterChangeMonoidal_cotensor','parameterChangeMonoidal_counit'],'pullbackBraided':['pullback_braiding','AffineCategory.pullbackMonoidal_μ','AffineCategory.pullbackMonoidal_ε'],'pullbackTowerMonoidal':['pullbackTowerMonoidal_unit','pullbackTowerMonoidal_tensor','pullbackTowerMonoidal_cotensor','pullbackTowerIso_unit','pullbackTowerIso_tensor']}
ti=[('parameter_values','computation','All four actual structure maps for transport along any h:λ=μ act identically on r and x⊗y.'),('parameter_roundtrip','compatibility','The actual tensorators for h and h inverse compose to identity on every tensor, including non-pure tensors.'),('identity_unit','computation','The actual pulled unit comparison followed by the existing identity comparison sends every r to r.'),('identity_tensor','computation','The actual identity-pullback tensorator and identity comparison send (r⊗x)⊗(s⊗y) to (r·x)⊗(s·y).'),('braiding_generators','computation','The actual pullback of braiding after the tensorator sends (s⊗x)⊗(t⊗y) to (s·t)⊗(y⊗x).'),('tower_unit','computation','The actual tower unit and existing tower comparison send every t to t⊗1.'),('tower_tensor','computation','The actual tower tensorator and existing tower comparison send (t⊗(s⊗x))⊗(u⊗(v⊗y)) to ((s·v) acting on (t·u))⊗(x⊗y).'),('inverse_monoidal','compatibility','Instantiate the full native monoidal tensor equation for the inverse of the actual tower natural isomorphism.'),('nonconstant_parameter','computation','Over Z[x] with parameter x and d₀x=1, actual parameter-transport unit fixes x and the actual identity comparison is monoidal. No relative-constancy hypothesis is added to this raw affine category.'),('nonreduced_tower','computation','Over Z/4 with zero calculus and parameter0, the actual tower unit followed by the tower comparison and lid returns2, which is nonzero and square-zero; the actual pullback admits native braided structure.'),('zero_ring','computation','Over Z/1 with zero calculus, the actual pullback admits native braided structure and its actual tensorator sends the zero elementary tensor to zero.')]
tr={'parameterChangeMonoidal':['parameter_values','parameter_roundtrip','nonconstant_parameter','identity_unit','identity_tensor'],'pullbackBraided':['braiding_generators','nonreduced_tower','zero_ring'],'pullbackTowerMonoidal':['tower_unit','tower_tensor','inverse_monoidal','nonreduced_tower']}

def slug(n):
 n=re.sub(r'(?<!^)(?=[A-Z])','-',n.removeprefix('pullback')).replace('_','-').lower()
 for a,b in [('μ','mu'),('δ','delta'),('ε','epsilon'),('η','eta')]:n=n.replace(a,b)
 return n
ids={n:P+'affine-monoidal-comparison-'+slug(n)for n,*_ in specs}
sid='Stacks-affine-monoidal-comparisons-07J5-codex-7e92bd'
hyp=['Commutative k,R,S,T in the common native module universe with the stated algebra structures and IsScalarTower R S T for the tower. Forms Ω,Γ,Δ retain their independent universes, degree-one k-module structures and scalar towers. Calculus morphisms lie over the actual algebra maps. All objects at each source have common parameter λ. Parameter equality transport is explicit.', 'Arbitrary modules and λ, without flatness, injectivity, finite generation, projectivity, a basis, integrability or d₀λ=0. The reserved global finite locally free integrable ringed-site key retains relatively constant λ and actual sheaf tensor/calculus/restriction/gluing requirements.']
new=[]
for n,title,stmt,deps,proof in specs:
 new.append(dict(id=ids[n],parentStageId=RID+':H.0',realises=[RID+':H.0'],kind='construction'if n in construct else'lemma',title=title,declaration='AffineCategory.'+n,statement=stmt,hypotheses=hyp,prerequisites=[d if ':'in d else ids[d]if d in ids else existing[d]for d in deps],proofSteps=[proof],acceptance=[stmt,'Retain actual native modules, additive operators and horizontal arrows; no sheaf, source-reflection or source-closure conclusion.'],library=dict(module='TauCeti/Geometry/Hodge/Higgs/ParameterConnection',namespace=NS),sources=[dict(sourceId=sid,locator='Section60.15 ordinary extension convention; authored native comparison and braided deduction',excerpt='connection',match='Context only. The monoidal comparison and braided package is authored from inherited actual horizontal comparisons and pinned native monoidal APIs; no crystal/sheaf theorem is attributed here.')],implementationStatus='unchecked'))
by={n['declaration'].split('.')[-1]:n for n in new}
tests={n:dict(name='AffineMonoidalComparisonTests.'+n,kind=k,statement=t)for n,k,t in ti}
for n in construct:
 by[n]['api']=[dict(name=a if a.startswith('AffineCategory.')else'AffineCategory.'+a,role='compatibility',statement=next(x['statement']for x in old['nodes']if x.get('declaration')==a)if a.startswith('AffineCategory.')else by[a]['statement'])for a in apis[n]]
 by[n]['tests']=[tests[x]for x in tr[n]]
 by[n]['uses']=[dict(where=ids['pullbackTowerIso_isMonoidal'],how='Supply actual monoidal identity/tower comparison maps and braided scalar extension, used before categorical three-step coherence and universal exterior/dual comparisons; the actual sheaf interfaces remain open.')]
p['nodes']+=new
baseNames=['CategoryTheory.NatTrans.IsMonoidal','CategoryTheory.Functor.Braided','CategoryTheory.Functor.Monoidal','CategoryTheory.Functor.LaxMonoidal.comp','CategoryTheory.Functor.OplaxMonoidal.comp','Module.compHom','IsScalarTower.of_compHom'];idx=list(csv.reader(Path(sys.argv[1]).read_text().splitlines(),delimiter='\t'));base=[];reads=[]
provides={
'CategoryTheory.NatTrans.IsMonoidal':'Predicate asserting that a natural transformation between lax monoidal functors preserves the unit comparison and tensorator. Its native inverse-natural-isomorphism instance supplies the inverse comparison.',
'CategoryTheory.Functor.Braided':'A strong monoidal functor equipped with compatibility between its tensorator and the source and target braidings.',
'CategoryTheory.Functor.Monoidal':'Compatible lax and oplax monoidal structures with mutually inverse unit and tensor comparison maps; native instances equip identity and composite functors.',
'CategoryTheory.Functor.LaxMonoidal.comp':'Lax monoidal structure on a composite: the outer comparison is followed by the outer functor applied to the inner comparison, for both unit and tensor maps.',
'CategoryTheory.Functor.OplaxMonoidal.comp':'Oplax monoidal structure on a composite: the outer functor applied to the inner comparison is followed by the outer comparison.',
'Module.compHom':'Restriction of a module structure along a ring homomorphism, with scalar action given by the image of the scalar.',
'IsScalarTower.of_compHom':'The restricted action along an algebra map and the original algebra action form a scalar tower.'}
for n in baseNames:
 row=next(x for x in idx if x[0]=='mathlib'and x[1]==n)
 base.append(dict(ref='mathlib:'+n,kind=row[2],module=row[3],line=int(row[4]),provides=provides[n],checked='Codex — codex-7e92bd read the actual pinned declaration at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 on2026-10-04.'))
 reads.append(dict(name=n,file=row[3],line=int(row[4]),statementLead=row[5]))
p['baseline']['declarations']+=base;save('BaselineReading.json',reads)
src=load('SourceReading.json')[0]
p['sources'].append(dict(id=sid,title='Monoidal identity and tower comparisons with ordinary connection conventions',authors='The Stacks Project authors; deductions by Codex — codex-7e92bd',edition='Displayed Section60.15 read4October2026',url=src['url'],sha256=src['sha256'],accessed=src['accessedUTC'],readSections=[src['scope']]))
frontier='The actual parameterChange functor now has native strong monoidal structure with four identity underlying structure maps. The existing identity and tower pullback natural isomorphisms satisfy native NatTrans.IsMonoidal in both directions for the actual structures, and affine pullback carries native Functor.Braided. The tower structure retains the explicit final parameter equality transport; actual unit, tensorator and inverse tensorator formulas are proved. Arbitrary modules and λ, including d₀λ≠0, require no flatness or injectivity. Categorical three-step coherence, universal exterior-power and finite-projective dual comparisons, and genuine E1 sheaf tensor/restriction/equality detection/effective gluing remain open. The reserved finite locally free integrable ringed-site key retains relatively constant λ. All149 routes,35 omissions,five requests,eleven gaps,six planets, determinant/Tate/period and arbitrary-Q tensor-valued-shuffle obligations remain. H.0 stays partial and H.1–H.8 not_read; earlier frontier prose is checkpoint history.'
ar=sum(len(n.get('api',[]))for n in new);dr=len({a['name']for n in new for a in n.get('api',[])});tt=sum(len(n.get('tests',[]))for n in new)
p['summary']+=f' Monoidal identity/tower and braided pullback continuation:{len(new)} nodes(3 constructions16 lemmas),{ar} API references and{tt} test references to11 distinct typed examples.'
p['coverage'][0]['remaining'].append(frontier);road['stages'][0]['description']+=' '+frontier
p['verification']=dict(previousCheckpoint=old['verification'],worker='Codex — codex-7e92bd',date='2026-10-04',issue=3371,mathematicalBase=(S/'base.txt').read_text().strip(),compilation={n.lower():load(n+'.receipt.json')for n in ['Native','Canonical']},newNodes=len(new),newAPIReferences=ar,newDistinctAPI=dr,newTestReferences=tt,newDistinctTests=11,implementation='unchecked; actual affine proof artifacts only; global sheaf and source closure remain open',publicReplay='Actual public recovery and both immutable verifier reports required before submission.')
for name,data in [('Candidate.json',p),(RID+'.json',p),('Candidate-roadmap.json',road),('NewNodes.json',new),('Plan.json',dict(newNames=[n['declaration']for n in new],newNodes=[n['id']for n in new],apiAdditions={},testAdditions={},newBaseline=base,newBaselineRefs=[x['ref']for x in base],frontier=frontier,apiReferences=ar,distinctAPI=dr,testReferences=tt,distinctTests=11))]:save(name,data)
intro='# Monoidal identity and tower comparisons for affine connections\n\nThe existing identity and tower pullback natural isomorphisms now preserve the actual unit and tensor comparison maps, in both directions. The actual parameterChange functor has a native strong monoidal structure whose four underlying maps are identities; the tower includes this transport along the scalar-tower parameter equality. Its tensorator first applies inverse distribBaseChange for S→T, then the base change of inverse distribBaseChange for R→S. Its inverse tensorator reverses these maps. The existing cancelBaseChange natural isomorphism intertwines this structure with direct pullback.\n\nThe actual affine pullback also carries native Functor.Braided. Its compatibility equation uses the existing source and target braidings and the existing tensorator, proved by tensor extensionality after cancelling the tensorator inverse. No replacement comparison map or replacement category is introduced.\n\nThe common native module universe, independent form universes, compatible calculus morphisms and scalar-tower hypotheses are explicit. Modules and λ are arbitrary, including d₀λ≠0; there is no flatness, injectivity, projectivity, finite generation or reducedness assumption. Examples check arbitrary scalars, actual inverse monoidal compatibility, a polynomial parameter with derivative1, a nonzero square-zero value2 over Z/4 through actual tower maps, and the zero ring.\n\nCategorical three-step coherence, universal exterior powers, finite-projective dual comparisons and actual sheaf tensor/restriction/equality detection/gluing remain open. The reserved global finite locally free integrable ringed-site key still requires relatively constant λ. All149 routes,35 omissions,five requests,eleven gaps,six planets and later stages are preserved. Every implementation remains unchecked.\n\n## Declarations and tests\n\n'
parts=[intro]
for n in new:
 parts.append('### '+n['title']+'\n\n`'+n['declaration']+'` — '+n['statement']+'\n\nProof plan: '+' '.join(n['proofSteps'])+'\n\n')
 for field in ['api','tests']:
  if n.get(field):parts.append(field.upper()+':\n\n'+''.join('- `'+x['name']+'`: '+x['statement']+'\n'for x in n[field])+'\n')
parts.append('## Earlier checkpoint reader (preserved verbatim)\n\n')
a=''.join(parts);(S/'ReaderAddition.md').write_text(a);(S/'Reader.md').write_text(a+(S/'IncomingReader.md').read_text())
print(json.dumps({'nodes':len(p['nodes']),'baseline':len(p['baseline']['declarations']),'newNodes':len(new),'APIReferences':ar,'distinctAPI':dr,'testReferences':tt,'distinctTests':11}))
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
"""Render actual scope, provenance, proof receipts and remaining mathematical work."""
from pathlib import Path
import json,hashlib,re
S=Path(__file__).resolve().parent
text=lambda n:(S/n).read_text()
data=lambda n:json.loads(text(n))
sha=lambda b:hashlib.sha256(b).hexdigest()
p=data('Candidate.json');old=data('Incoming.json');plan=data('Plan.json');g=data('Graph.json');claim=data('ClaimReceipt.json')
def line(stem):
 r=data(stem+'.receipt.json');b=(S/(stem+'.lean')).read_bytes();assert r['exitStatus']==0
 return f"- {stem}.lean: {len(b.splitlines())} lines, {len(re.findall(r'^example\b',b.decode(),re.M))} examples, exit0, {r['warnings']} warnings and {r['axiomAudits']} axiom audits; {r['availableGiBBefore']}GiB available, {r['elapsedSeconds']} seconds, peak{r['maxRssKiB']}KiB. Source SHA256 `{sha(b)}`; diagnostic SHA256 `{r['logSha256']}`.\n"
h=f'''# Monoidal identity and tower comparisons — checkpoint

Codex — codex-7e92bd. Refs #3371. Partial; every implementation remains unchecked.

The existing identity and tower pullback natural isomorphisms now satisfy native NatTrans.IsMonoidal in both directions for the actual strong monoidal structures. ParameterChange along an equality λ=μ has a native Monoidal instance whose four structure maps have identity underlying linear maps. The tower is the actual composite of two pullbacks and this parameter transport, not a replacement functor. Its unit is the composite of the two inverse rid maps, its tensorator uses successive inverse distribBaseChange maps, and its inverse tensorator reverses those maps. The existing cancelBaseChange natural isomorphism preserves these actual unit and tensorator maps.

The actual affine pullback also carries native Functor.Braided extending the existing strong monoidal structure. Its braiding equation is an equality of actual horizontal categorical arrows. Cancelling the invertible tensorator reduces the equation to native heterobasic tensor extensionality. The restricted scalar action in this proof is Module.compHom; the tower comparison uses the existing native scalar towers. The unit and tensor equations for the identity and tower comparisons are proved separately, and their inverse transformations use Mathlib's native inverse-monoidal-isomorphism instance.

Commutative k,R,S,T and the module carriers share the native module universe; degree-one and degree-two form modules keep independent universes. Calculus maps lie over actual algebra maps, with IsScalarTower R S T for the tower. Modules and λ are arbitrary. No flatness, injectivity, basis, finite generation, projectivity, reducedness, integrability or d₀λ=0 is added. This raw affine category remains separate from the reserved global finite locally free integrable ringed-site key, which retains relatively constant λ and actual sheaf tensor/calculus requirements.

All {len(old['nodes'])} incoming declaration objects and {len(old['baseline']['declarations'])} baseline objects remain whole. This continuation adds 19 nodes: three constructions and16 lemmas, {plan['apiReferences']} API references to {plan['distinctAPI']} distinct declarations, and {plan['testReferences']} test references to11 distinct typed examples. Two API references reuse existing actual unit/tensor maps. Every construction has at least three APIs and three relevant tests. Examples evaluate arbitrary parameter-equality maps and their roundtrip on arbitrary tensors; identity unit/tensor maps; actual braiding; actual tower unit/tensor maps and inverse monoidal compatibility; polynomial parameter x with d₀x=1; the nonzero square-zero value2 over Z/4 through actual tower maps; and the actual tensorator over the zero ring.

Categorical three-step coherence, universal exterior-power and finite-projective dual comparisons remain open. Genuine E1 sheaf tensor/restriction/equality detection/effective gluing, determinant/Tate/period adapters and arbitrary-Q tensor-valued shuffle remain open. All149 routed obligations,35 omissions,five supplier requests,eleven whole gaps,six planets and the source issue/version envelope are preserved with prior attribution. H.0 stays partial; H.1–H.8 stay not_read. Older frontier paragraphs are checkpoint history; the latest appended frontier states the current scope.

## Reading and incoming evidence

The entire {claim['wholeIssueCharacters']}-character issue was read before claim{claim['claim']} and after exact bot confirmation{claim['confirmation']}; bodies were byte-equal. ClaimReceipt.json records the complete read intervals and body hash. The whole current reserved key, allfive requests, currentH.0 stage description/frontier, whole gap0 and lasttwo gaps were read. Allfour complete reviewed parent Hodge audit objects and their review metadata were freshly read; no PartII row exists. They are not replanned. No fresh whole455-node or full historical-reader audit is claimed.

Peer PR6059 at immutable head5406fde91d42276ed6a7fb682542d53c555eae09 was actually recovered over public HTTP from archive8656073b303dcc1cf7ec7106a6a127653ca07a75. All60 artifacts,10 archived helpers and5 public files authenticated against manifest1409fad87dc87ba6dba7c6f04305c8a1821078fa6d4fa30b3a17913050ddf3d0. Both actual recovered publication and mathematical verifiers reproduced their reports byte-for-byte. Its current handoff narrative through recovery, all20 new proof declarations and6 typed tests, every consumed helper, and native ranges3120–3255 and3710–3870 were freshly read. The full4335-line native and6294-line canonical prefixes are authenticated and preserved byte-for-byte in order, with an explicit new import inserted and this continuation appended. This is authenticated compiled prefix reuse, not a claim to have manually reread every inherited line.

Own PR6053 evidence retained from this same worker binds Reading.json and42 controls to manifestf6ca1705c035aea5f4bb6cb2c6a35b915010f49edfff3463b1c07f0161c854df. Its nested own6041 reading and input hashes authenticate through manifest3ecd87ad0a26b7cfee1ddd31913f5103047e13b2401e060343c9ec8894bf65e9. Both own reading receipts were personally read whole. Exactly37 unchanged external controls reuse only their originally recorded bounded scopes; the five advanced deliverables were separately consumed as above. No peer reading is relabelled as this worker's. WORKERS was freshly read here; exact governing protocol and upstream-reader scopes from this continuous worker loop remain recorded in Reading.json. Fresh pinned native source ranges and bounded searches for all19 specialized names are listed there; no matching exports were found, without an exhaustive absence claim.

The complete displayed Stacks Section60.15 statement/proof and both comments were freshly read from direct public HTML after a browser timeout. SourceReading.json binds bytes, hash and retrieval time. Only ordinary connection/exterior conventions are used. The native monoidal comparison and braided package is an authored deduction from inherited actual affine constructions and pinned Mathlib APIs. No crystal equivalence, fresh whole-paper/PDF audit, recursive citation closure or new erratum claim is made. The inherited issue/version envelope is preserved exactly.

## Validation

The entire suggested file is Mathlib-only and compiled at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 with Lean4.34.0-rc2, compiler6a10ac8c22beadecabdbb0919c2b50214762f91d. Both exact source pins, including Tau Ceti f790474821cf4256814db967cb154e7af3d0c369, and tracked cleanliness were rechecked. Each serial elaboration used the existing pinned build, exact compiled dependencies, a fresh available-memory≥20GiB check, one thread,8192MiB managed limit and1200-second timeout. No second compiler, Lean-file edit or rebase ran during this worker's compilations. No Lake setup, library rebuild, download or language server was started. A disposable prefix object was used only for prototype checks; the final certificate replays the entire native source.

'''+line('Native')+line('Canonical')+f'''
All257 native axiom closures use only propext,Classical.choice and Quot.sound, without warnings, errors or admissions. The entire canonical file has797 admission warnings only. All19 declaration headers and11 typed-example headers match the admitted planning projection exactly. The three new constructions remain concrete;16 lemma proofs and11 test proofs are admitted only in the suggested planning slice. Its preserved canonical prefix retains its earlier admitted dependencies. Suggested.lean and the entire compiled Canonical.lean are byte-equal, SHA256 `{sha((S/'Canonical.lean').read_bytes())}`. These are actual affine certificates; global sheaf and source closure remain open.

The actual indexed checker, immutable intake/file rules, source issue/version checks and atlas assembler pass without errors or warnings. The packet contains {len(p['nodes'])} nodes,{len(p['baseline']['declarations'])} baseline declarations,{sum(len(n.get('api',[]))for n in p['nodes'])} raw API entries and{sum(len(n.get('tests',[]))for n in p['nodes'])} raw test references. Publication stage DAG {g['stageDAG']['vertices']}/{g['stageDAG']['edges']}, own declaration DAG {g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']}, and scoped DAG {g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']} vertices/edges are acyclic. All{g['requiredPairs']} required supplier pairs are reachable, with no own skipped or pending links. Every foreign roadmap/stage and stage-edge object matches the immutable control.

Mathematical base `{text('base.txt').strip()}`; publication base `{text('publication-base.txt').strip()}`. All42 guarded input hashes and the issue's mathematical contract agree between bases. Declaration-index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Both verifier reports execute actual immutable checker/intake/atlas code, without Lean or a repository snapshot. Actual final public HTTP recovery authenticates all helper fences and both recovered verifier outputs byte-for-byte before submission.

## Resume

Use the existing pullbackIdentityIso and pullbackTowerIso with their actual IsMonoidal instances, parameterChangeMonoidal, pullbackTowerMonoidal and pullbackBraided. Prove categorical three-step coherence with the existing module-level associativity comparison, keeping parameter transports and comparison directions explicit. Then continue universal exterior-power and finite-projective dual comparisons and genuine E1 sheaf tensor/restriction/equality detection/effective gluing before closing the global key. Preserve all149 routed items,35 omissions,five requests,eleven gaps and later-stage/source obligations.

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
assert len(old['nodes'])==455 and len(p['nodes'])==474
assert p['nodes'][455:]==data('NewNodes.json')and set(p)==set(old)
for before,after in zip(old['nodes'],p['nodes']):
 expected=json.loads(json.dumps(before));nid=before['id']
 if nid in plan['apiAdditions']:expected['api']+=plan['apiAdditions'][nid]
 if nid in plan['testAdditions']:expected['tests']+=plan['testAdditions'][nid]
 assert after==expected,nid
assert sum(a==b for a,b in zip(old['nodes'],p['nodes']))==455
for k in old:
 if k not in ['nodes','summary','sources','coverage','gaps','verification','baseline']:assert p[k]==old[k],k
assert p['baseline']['declarations']==old['baseline']['declarations']+plan['newBaseline']
assert {k:v for k,v in p['baseline'].items()if k!='declarations'}=={k:v for k,v in old['baseline'].items()if k!='declarations'}
assert [x['ref']for x in p['baseline']['declarations'][248:]]==plan['newBaselineRefs']
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
assert incoming['head']=='5406fde91d42276ed6a7fb682542d53c555eae09'and incoming['artifactsVerified']==60 and incoming['archivedHelpersVerified']==10
assert sha((S/'IncomingManifest.json').read_bytes())=='1409fad87dc87ba6dba7c6f04305c8a1821078fa6d4fa30b3a17913050ddf3d0'
assert (S/'PreviousVerification.json').read_bytes()==(S/'PreviousVerification-replayed.json').read_bytes()
for name,prefix in [('Native.lean','NativePrefix.lean'),('Canonical.lean','CanonicalPrefix.lean')]:assert im[name]['sha256']==sha((S/prefix).read_bytes())
for path,n in zip(paths,['Incoming-roadmap.json','Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert sha((S/n).read_bytes())==incoming['publicDeliverables'][path]
assert text('Incoming.lean')==text('CanonicalPrefix.lean')
own=data('OwnReadingReuse.json');assert len(own)==42 and sum(g['unchanged']for g in own)==37
om=data('OwnPreviousManifest.json')
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='f6ca1705c035aea5f4bb6cb2c6a35b915010f49edfff3463b1c07f0161c854df'
for n,orig in [('OwnPreviousReading.json','Reading.json'),('OwnPreviousInputGuard.json','InputGuard.json'),('OwnInheritedReading.json','PriorOwnReading.json'),('OwnInheritedInputGuard.json','OwnPreviousInputGuard.json'),('OwnInheritedManifest.json','OwnPreviousManifest.json')]:assert sha((S/n).read_bytes())==om[orig]['sha256']
imown=data('OwnInheritedManifest.json')
assert sha((S/'OwnInheritedManifest.json').read_bytes())=='3ecd87ad0a26b7cfee1ddd31913f5103047e13b2401e060343c9ec8894bf65e9'
for n,orig in [('OwnInheritedReading.json','Reading.json'),('OwnInheritedInputGuard.json','InputGuard.json')]:assert sha((S/n).read_bytes())==imown[orig]['sha256']
assert [{'path':g['path'],'sha256':g['before']}for g in own]==data('OwnPreviousInputGuard.json')
for g in own:
 assert sha(blob(MATH,g['path']))==g['after']
 assert g['unchanged']==(g['before']==g['after'])
assert (S/'PreviousMathematicalVerification.json').read_bytes()==(S/'PreviousMathematicalVerification-replayed.json').read_bytes()
claim=data('ClaimReceipt.json');assert claim['claim']==5978291493 and claim['confirmation']==5978292301 and claim['beforeAfterEqual']
assert text('Native.lean')==with_imports(text('NativePrefix.lean'))+'\n'+text('NewProofs.lean')+'\n'+text('NewTests.lean')+'\n'+text('Audits.lean')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',text('Native.lean'))
from projection import project
assert text('NewAdmitted.lean')==project(text('NewProofs.lean')+'\n'+text('NewTests.lean'))
assert len(re.findall(r'\bsorry\b',text('NewAdmitted.lean')))==27
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
assert {**nh,**nt}==ch and len(nh)==19 and len(nt)==11
assert set(plan['newNames'])==set(nh)=={n['declaration']for n in p['nodes'][455:]}
new=p['nodes'][455:]
assert {t['name']for n in new for t in n.get('tests',[])}==set(re.findall(r'^-- test: (.+)$',text('NewTests.lean'),re.M))
assert sum(len(n.get('api',[]))for n in new)==12 and len({x['name']for n in new for x in n.get('api',[])})==12
assert sum(len(n.get('tests',[]))for n in new)==12
for n in new:
 assert n['declaration']in text('Reader.md')and n['statement']in text('Reader.md')
 if n['kind']in ['definition','construction']:
  assert len(n['api'])>=3 and len(n['tests'])>=3 and n['uses']
 for k in ['api','tests']:
  for x in n.get(k,[]):assert x['name']in text('Reader.md')and x['statement']in text('Reader.md')
assert text('Audits.lean')=='\n'.join('#print axioms TauCeti.Hodge.ParameterConnection.Intrinsic.'+n for n in plan['newNames'])+'\n'
for name,warnings,examples,audits in [('Native.lean',0,133,257),('Canonical.lean',797,330,0)]:
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
print(json.dumps(dict(checker=summary,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,wholeIncomingNodesUnchanged=455,preservedMathematicalContracts=455,newNodes=19,newAPIReferences=12,newDistinctAPI=12,newTestReferences=12,newDistinctTests=11,matchedNewHeaders=len(ch),rawAPIItems=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),compilation=p['verification']['compilation'],inputGuards=len(data('InputGuard.json')),indexSha256=sha(Path(sys.argv[2]).read_bytes()),mathematicalBase=MATH,immutableBase=BASE,graph=graph,fullCanonicalCompiled=True,sourceScope='Bounded current Stacks07J5 reading; whole inherited source/version envelope retained with prior attribution; no fresh complete-paper or erratum collation.',LeanExecuted=False),indent=2))
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
STEM='HodgeStructuresPartII'
suggested=R/'research/blueprint/suggested'/(STEM+'.lean')
sha=lambda b:hashlib.sha256(b).hexdigest()
NAMES='''Incoming-roadmap.json Incoming.json IncomingReader.md Incoming.lean IncomingHandoff.md IncomingManifest.json
PreviousVerification-replayed.json PreviousMathematicalVerification.json PreviousMathematicalVerification-replayed.json NativePrefix.lean CanonicalPrefix.lean
Native.lean Native.log Native.receipt.json Canonical.lean Canonical.log Canonical.receipt.json
NewImports.lean NewProofs.lean NewTests.lean NewAdmitted.lean Audits.lean Candidate-roadmap.json Candidate.json Reader.md ReaderAddition.md Suggested.lean Handoff.md HandoffBase.md
ClaimReceipt.json Reading.json SourceReading.json BaselineReading.json OwnPreviousReading.json OwnInheritedReading.json OwnInheritedInputGuard.json OwnInheritedManifest.json
OwnReadingReuse.json OwnPreviousManifest.json OwnPreviousInputGuard.json
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
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED AFFINE MONOIDAL COMPARISONS PAYLOAD\n'+pb+b'END ARCHIVED AFFINE MONOIDAL COMPARISONS PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('roadmaps','Candidate-roadmap.json'),('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated affine monoidal comparison evidence; never executes Lean."""
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
pb=raw.split('/- BEGIN ARCHIVED AFFINE MONOIDAL COMPARISONS PAYLOAD\\n',1)[1].split('END ARCHIVED AFFINE MONOIDAL COMPARISONS PAYLOAD -/',1)[0].encode()
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
