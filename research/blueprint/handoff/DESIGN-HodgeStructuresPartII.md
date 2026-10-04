# Monoidal three-step affine pullback comparisons — checkpoint

Codex — codex-rtOQ9t. Refs #3371. Partial; every implementation remains unchecked.

The actual existing pullbackTriple(p,n,m) now has the native Functor.Monoidal structure on its exact four-factor composite: pullback(m), pullback(n), pullback(p), and explicit final parameterChange from the nested scalar-map image of λ to its R→U image. The native composite construction retains the actual functor, additive operators, horizontal arrows and parameter equality. Its ε, μ, δ and η underlying U-linear maps are the corresponding three native rid/distribBaseChange maps, base-changed to U in the actual composition order. The final parameterChange maps are the existing identities. The construction does not redefine native monoidal interfaces.

The actual outer-first natural comparison satisfies whole categorical unit and tensor equations for this native composite structure and direct pullback. The unit proof evaluates both native cancellation maps on u⊗1⊗1⊗1 after horizontal-arrow/linear-map extensionality. The tensor proof cancels actual invertible δ by the native δμ law, then uses horizontal-arrow subtype extensionality, three native curry extensionalities and tensor extensionality. Native cancellation/distribution formulas prove the generator equation, and extensionality gives the complete horizontal-arrow equation. These are the two fields of native NatTrans.IsMonoidal for the actual outer forward transformation. Native inverse-isomorphism monoidality gives its actual inverse. The inherited equality of the actual outer and inner forward natural transformations proves inner forward monoidality for the same structures; its inverse is monoidal as well. The actual parameterChange/pullback natural isomorphism also satisfies native monoidality in both directions, with its explicit equality transport retained.

Commutative k,R,S,T,U and native module carriers share the native module universe; degree-one/two form modules retain independent universes, k-actions and degree-one scalar towers. Structure-map formulas require R/S/T and R/T/U scalar towers; the existing actual comparison paths also retain S/T/U and R/S/U towers. Calculus morphisms lie over the actual algebra maps. Arbitrary modules and λ, including d₀λ≠0, need no flatness, injectivity, finite generation, projectivity, basis, integrability or reducedness assumption. The raw affine category does not close the reserved global finite locally free integrable ringed-site key, whose relatively constant parameter and genuine sheaf interfaces remain required.

All 493 incoming node objects and all 256 baseline objects remain whole. This continuation adds15 nodes:1 construction,14 lemmas,6 API references and7 distinct typed tests. The construction has the four underlying map equations and both tensor generator formulas as its six API items. Tests calculate ε on arbitrary u, μ with six arbitrary scalar coefficients, δ on generators, and native monoidality of both directions of both actual comparisons. Over Z[x] with λ=x and d₀x=1 they evaluate the actual unit and outer monoidality. Over Z/4 with λ=2 and zero calculus, actual μ followed by the outer comparison at the tensor of unit objects and two native left-unit maps retains value2, nonzero and square-zero. Over Z/1, both actual ε and η send zero to zero.

Universal exterior-power and finite-projective dual comparisons, and genuine E1 sheaf tensor/restriction/equality detection/effective gluing remain open. All149 routed obligations,35 omissions,five requests,eleven whole gaps,six planets, determinant/Tate/period and arbitrary-Q tensor-valued-shuffle obligations remain. H.0 stays partial and H.1–H.8 not_read. Prior frontier paragraphs are attributed checkpoint history; none is silently rewritten. The inherited source issue is preserved and the acknowledged historical proof misprint below is appended narrowly.

## Reading and recovered incoming evidence

The complete 22198-character issue was read before claim 5979733540 and after exact numeric bot confirmation 5979734583; bodies were byte-equal. ClaimReceipt.json binds both whole read intervals and the body hash. The whole reserved key, allfive requests and complete H.0 coverage were freshly read. The lasttwo gap objects, relevant current first-gap/coherence fields and current node objects were freshly read in bounded displays. Earlier gap scopes reuse only unchanged authenticated own receipts. Allfour complete parent Hodge AUDIT-02 rows and metadata, and the whole REV-AUDIT-02 report, were freshly read. The initially truncated L1/L2 display was followed by complete bounded rereads. No PartII audit row exists; the reviewed parent is not replanned.

Incoming own PR #6066 at immutable head8a24348d630948e0bf3596f16069c3b66f259a76 was actually recovered over public HTTP from archive b99f1046f4591ae5ff944309c40414b6f146f05e. All65 artifacts,10 helpers and5 public deliverables authenticated against manifest f6ec0a378354ac2cb193eb524349ca6a5946b6648b89e416be9fd59d655449dd. Both actual original immutable verifier outputs were reproduced byte-for-byte. The complete previous19 new proofs,12 tests and all10 helper scripts were freshly read, together with the incoming handoff's first14000 characters and complete helper fences. NativePrefix4310–4600 supplies the actual parameter/two-step monoidal structures and comparisons. The full5239-line native and6987-line canonical prefixes are authenticated and preserved in order, with a harmless import-context comment and this continuation appended. Prefix reuse does not assert a fresh manual audit of every inherited line.

The current direct own6066 manifest binds its original Reading/InputGuard and retained own6059,6046,6032 and6001 reading envelopes. Its whole Reading.json was personally read. The42 guarded files have37 unchanged controls and5 advanced own deliverables. Reuse is limited to original scopes on unchanged files. WORKERS was read whole again; the complete930-line PROTOCOL was read earlier in this continuous loop, with300–460 refreshed here. Whole native Monoidal/NaturalTransformation.lean and the actual Functor Lax/Oplax composite formulas were freshly read. Native TensorProduct distribution/baseChange and linear-equivalence coercion statements were consumed in the bounded ranges recorded in Reading.json. All15 exact proposed specialized names were absent in bounded pinned Mathlib/Tau source searches; generic native APIs are reused. No exhaustive absence or peer-reading claim is made.

The complete current displayed Stacks07J5 Section60.15 definitions, Lemma60.15.1 proof and both public comments were freshly read, as was the complete authors correction patch d90e73b0eb86c47faa4724d04a3f06a810a83d36 linked there. SourceReading.json binds both actual HTTP byte streams, hashes, times and scopes. The patch changes one historical proof reference from Delta to i, the defined diagonal T→T′. This acknowledged, already corrected30August2019 misprint is recorded as affecting the proof, with no stated-result error or whole historical crystalline.tex/full-paper version collation claimed. Ordinary connection conventions supply context only; the monoidal interfaces are authored deductions from inherited actual affine constructions and pinned native Mathlib APIs. No recursive source closure or crystal-equivalence conclusion is made. [Current section](https://stacks.math.columbia.edu/tag/07J5), [authors correction](https://github.com/stacks/stacks-project/commit/d90e73b0eb86c47faa4724d04a3f06a810a83d36).

## Validation

The entire suggested file is Mathlib-only and compiled at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 using Lean4.34.0-rc2, compiler6a10ac8c22beadecabdbb0919c2b50214762f91d. The runner checks exact pins and existing compiled dependencies, tracked cleanliness, fresh available memory≥20GiB, one thread,8192MiB managed-memory limit and1200-second timeout. Every compilation finished before another compiler, Lean-file edit or rebase began. The disposable own Context object accelerated prototypes only; the final Native run elaborates the entire source. No Lake setup, library build/cache download or language server was started.

- Native.lean: 5675 lines, 152 examples, exit0, 0 warnings, 291 axiom audits; 41GiB available before compilation, 114.92 seconds, peak 4059688 KiB. Source SHA256 `a1b031e0bdbb1ee93ad83a3a1bfd2bb5829a108259767d0d697006843b3884d7`; diagnostic SHA256 `ff487eabf404982371b72296a198859c52c44e95238f9e50f9707e069c82978f`.
- Canonical.lean: 7272 lines, 349 examples, exit0, 845 warnings, 0 axiom audits; 41GiB available before compilation, 60.29 seconds, peak 3629860 KiB. Source SHA256 `5d46f02889de49b018f96035395edc36d76a44597917d2f8aa05ba74699ec375`; diagnostic SHA256 `7e2b3f9cf9fa83a30e1b3d62ce9eac73893f7e3f270d4c7598a4a5bfce4a6975`.

All291 native audits use only propext,Classical.choice and Quot.sound; no warning, error, admission or sorryAx occurs. The entire Canonical file has845 admission warnings only. All15 declaration and7 example headers match the admitted projection. The one native composite construction remains concrete;14 lemma and7 example proofs are admitted only in the planning projection. Suggested.lean equals the entire compiled Canonical.lean byte-for-byte, SHA256 `5d46f02889de49b018f96035395edc36d76a44597917d2f8aa05ba74699ec375`. These are affine proof artifacts; global sheaf and source closure remain open.

The actual indexed checker, immutable intake/file rules, source-issue checks and atlas assembler pass without errors or warnings. Packet:508 nodes,256 baseline declarations,484 raw API references,452 raw test references. Stage DAG 3022/8663, own declaration DAG 508/967, scoped DAG 3525/10182 vertices/edges are acyclic. All21 required supplier pairs are reachable, with no own skipped/pending link. Every foreign roadmap/stage/stage-edge object equals its immutable control.

Mathematical base `941c41a45ad4fec5d3d9ba464e6ea0f3fee8f188`; publication base `dc553a27b51de533edcae948497fca82891e9a8b`. All42 guard hashes and the issue's mathematical contract agree between bases. Index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Both verifier reports execute actual immutable checker/intake/atlas code without Lean or a repository snapshot. Actual final public recovery and both recovered verifier outputs must authenticate byte-for-byte before opening the PR.

## Resume

Use the actual native composite triple monoidal structure, its four explicit whole maps and both comparison paths' forward/inverse monoidality. Continue universal exterior-power and finite-projective dual comparisons, then genuine E1 sheaf tensor/restriction/equality detection/effective gluing. Preserve all149 routes,35 omissions,five requests,eleven gaps, later-stage/source obligations and the relatively constant parameter in the reserved global key.

## Public recovery and replay

Archive commit `bc576c97885270cd2af4f92d01863ce8b50ef0f2` is an ancestor changing only this issue's suggested file. Its 76 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `9aad3a4726f76bf0546f26e905881332bd96984bb6b8a5a02a8bbbaa0b6516a5`; payload SHA256 `385b846a324a83596234ffd351d7830eb37503f7a68e3da8d76c9ed4f2f57943`. The final suggested file has no archive payload and equals the entire compiled Mathlib-only Canonical.lean.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set HODGE_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Canonical.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean and Suggested.lean are byte-equal and the whole file was compiled. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

```python
"""Recover public authenticated affine triple monoidal comparison evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='HodgeStructuresPartII'
ARCHIVE='bc576c97885270cd2af4f92d01863ce8b50ef0f2'
MANIFEST_SHA='9aad3a4726f76bf0546f26e905881332bd96984bb6b8a5a02a8bbbaa0b6516a5'
PAYLOAD_SHA='385b846a324a83596234ffd351d7830eb37503f7a68e3da8d76c9ed4f2f57943'
EXPECTED={'roadmaps': 'd26e649475bca1cf6456ad5f40c33711397fae60a079b796c458935c0fc6e5a4', 'packets': '39348599f7944e7865f920d9f51d669a8bb11b14c8fc3d501a09f72b4a757dff', 'readmes': 'e4d8d187bfebedfbead5de7a8f892392d05a76922b73438e9a5954bb5cd6e080', 'suggested': '5d46f02889de49b018f96035395edc36d76a44597917d2f8aa05ba74699ec375'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED AFFINE TRIPLE MONOIDAL PAYLOAD\n',1)[1].split('END ARCHIVED AFFINE TRIPLE MONOIDAL PAYLOAD -/',1)[0].encode()
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
"""Append actual monoidal triple comparison interfaces; preserve every incoming node."""
from pathlib import Path
import copy,json,re
S=Path(__file__).resolve().parent;RID='HodgeStructuresPartII';NS='TauCeti.Hodge.ParameterConnection.Intrinsic'
load=lambda n:json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
old=load('Incoming.json');p=copy.deepcopy(old);road=load('Incoming-roadmap.json')
existing={n.get('declaration'):n['id']for n in old['nodes']}
specs=[
('pullbackParameterChangeIso_isMonoidal','Monoidal parameter/pullback comparison','For an explicit h:λ=μ and a calculus map m:R→S, the forward natural transformation of the actual pullbackParameterChangeIso(h,m) satisfies native NatTrans.IsMonoidal for the existing composite monoidal structures.',['AffineCategory.pullbackParameterChangeIso','AffineCategory.parameterChangeMonoidal','AffineCategory.pullbackMonoidal','mathlib:CategoryTheory.NatTrans.IsMonoidal','mathlib:LinearMap.baseChange_id','mathlib:TensorProduct.map_id'],'Eliminate h only for the proof. Prove the native unit and tensor equations by horizontal-arrow subtype extensionality; the tensor equation is equality of base-changed identity and native tensor of identities on every tensor element.'),
('pullbackParameterChangeIso_inv_isMonoidal','Monoidal inverse parameter comparison','The inverse natural transformation of the same actual pullbackParameterChangeIso(h,m) is monoidal for the same existing structures.',['pullbackParameterChangeIso_isMonoidal','mathlib:CategoryTheory.NatTrans.IsMonoidal'],'Use the native inverse-isomorphism monoidality instance after the actual forward proof.'),
('pullbackTripleMonoidal','Actual composite monoidal triple pullback','Give the existing pullbackTriple(p,n,m) its native Functor.Monoidal structure obtained by composing the existing monoidal pullback(m), pullback(n), pullback(p), and the explicit final parameterChange. Preserve the actual functor, parameter equality, additive operators and horizontal arrows.',['AffineCategory.pullbackTriple','AffineCategory.pullbackMonoidal','AffineCategory.parameterChangeMonoidal','mathlib:CategoryTheory.Functor.Monoidal','mathlib:CategoryTheory.Functor.LaxMonoidal.comp','mathlib:CategoryTheory.Functor.OplaxMonoidal.comp'],'Reuse the native monoidal structure on the exact four-factor composite through inferInstanceAs. The given triple functor unfolds to that same composite; no new generic monoidal class or transport along a different functor is introduced.'),
('pullbackTripleMonoidal_unit','Triple unit structure map','The underlying U-linear map of ε for the actual monoidal pullbackTriple is the U-base change of the T-base change of rid(R,S).symm, after the U-base change of rid(S,T).symm, after rid(T,U).symm.',['pullbackTripleMonoidal','AffineCategory.parameterChangeMonoidal_unit'],'Unfold the native composite unit; remove the final actual parameterChange unit using its existing identity-map formula.'),
('pullbackTripleMonoidal_tensor','Triple tensor structure map','For actual X,Y, the underlying U-linear map of μ is the U-base change of the T-base change of distribBaseChange(R,S).symm, after the U-base change of distribBaseChange(S,T).symm, after distribBaseChange(T,U).symm, on the actual nested scalar-extension modules.',['pullbackTripleMonoidal','AffineCategory.parameterChangeMonoidal_tensor'],'Unfold the native composite μ and remove the final parameterChange identity tensor map. Retain the explicit native modules and composition order.'),
('pullbackTripleMonoidal_cotensor','Triple reverse tensor structure map','For actual X,Y, the underlying U-linear map of δ is distribBaseChange(T,U), after the U-base change of distribBaseChange(S,T), after the U-base change of the T-base change of distribBaseChange(R,S).',['pullbackTripleMonoidal','AffineCategory.parameterChangeMonoidal_cotensor'],'Unfold the native oplax composite δ and remove the final parameterChange identity cotensor map.'),
('pullbackTripleMonoidal_counit','Triple reverse unit structure map','The underlying U-linear map of η is rid(T,U), after the U-base change of rid(S,T), after the U-base change of the T-base change of rid(R,S).',['pullbackTripleMonoidal','AffineCategory.parameterChangeMonoidal_counit'],'Unfold the native composite counit and remove the final parameterChange identity counit map.'),
('pullbackTripleOuterIso_unit','Outer comparison unit equation','ε(triple) followed by the actual outer comparison at the unit object equals ε(direct pullback along (p.towerComp n).towerComp m), as actual horizontal categorical arrows.',['pullbackTripleMonoidal_unit','AffineCategory.pullbackTripleOuterIso_hom','mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange_tmul'],'Apply horizontal-arrow and linear-map extensionality. Evaluate the actual two cancellation maps on u⊗1⊗1⊗1 to obtain u⊗1.'),
('pullbackTripleOuterIso_tensor','Outer comparison tensor equation','μ(triple,X,Y) followed by the actual outer comparison at X⊗Y equals the tensor of the actual outer comparisons at X and Y followed by μ(direct,X,Y), as actual horizontal arrows for arbitrary objects.',['pullbackTripleMonoidal_cotensor','AffineCategory.pullbackTripleOuterIso_hom','AffineCategory.pullbackMonoidal','mathlib:CategoryTheory.Functor.Monoidal','mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange_symm_tmul'],'Cancel the actual invertible triple δ using the native δμ law. Apply horizontal-arrow subtype extensionality, three native curry extensionalities and tensor extensionality. Native distribution and cancellation formulas prove the equation on generators; extensionality proves the whole-arrow equation.'),
('pullbackTripleOuterIso_isMonoidal','Outer comparison is monoidal','The forward natural transformation of the existing actual outer-first triple comparison satisfies native NatTrans.IsMonoidal for the actual composite triple and direct pullback structures.',['pullbackTripleOuterIso_unit','pullbackTripleOuterIso_tensor','mathlib:CategoryTheory.NatTrans.IsMonoidal'],'Package the proved whole categorical unit and tensor equations in the native class.'),
('pullbackTripleOuterIso_inv_isMonoidal','Outer inverse is monoidal','The inverse natural transformation of the same actual outer-first triple comparison satisfies native NatTrans.IsMonoidal.',['pullbackTripleOuterIso_isMonoidal','mathlib:CategoryTheory.NatTrans.IsMonoidal'],'Use native inverse-isomorphism monoidality, preserving the actual two functors and structures.'),
('pullbackTripleInnerIso_isMonoidal','Inner comparison is monoidal','The forward natural transformation of the existing actual inner-first triple comparison satisfies native NatTrans.IsMonoidal for the same actual triple structure and the definitionally associated direct calculus map.',['pullbackTripleOuterIso_isMonoidal','AffineCategory.pullbackTriple_coherence_hom','mathlib:CategoryTheory.NatTrans.IsMonoidal'],'Rewrite by the inherited equality of actual forward natural transformations; reuse the outer monoidality proof.'),
('pullbackTripleInnerIso_inv_isMonoidal','Inner inverse is monoidal','The inverse natural transformation of the actual inner-first triple comparison satisfies native NatTrans.IsMonoidal.',['pullbackTripleInnerIso_isMonoidal','mathlib:CategoryTheory.NatTrans.IsMonoidal'],'Use the native inverse-isomorphism monoidality instance.'),
('pullbackTripleMonoidal_tensor_tmul','Triple tensor generator formula','For arbitrary u,v:U, t,r:T, s,q:S and x:X,y:Y, actual μ(triple) sends (u⊗(t⊗(s⊗x)))⊗(v⊗(r⊗(q⊗y))) to (uv)⊗((tr)⊗((sq)⊗(x⊗y))).',['pullbackTripleMonoidal_tensor','mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange_symm_tmul'],'Apply the whole structure-map equation, native baseChange_tmul and distribution inverse formulas, normalizing linear-equivalence coercions.'),
('pullbackTripleMonoidal_cotensor_tmul','Triple reverse tensor generator formula','For arbitrary u:U,t:T,s:S,x:X,y:Y, actual δ(triple) sends u⊗(t⊗(s⊗(x⊗y))) to (u⊗(t⊗(s⊗x)))⊗(1⊗(1⊗(1⊗y))).',['pullbackTripleMonoidal_cotensor','mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange_tmul'],'Apply the whole structure-map equation, native baseChange_tmul and distribution formulas, normalizing linear-equivalence coercions.')]
ids={n:RID+':H.0/affine-triple-monoidal-'+re.sub(r'(?<!^)(?=[A-Z])','-',n.removeprefix('pullback')).replace('_','-').lower()for n,*_ in specs}
sid='Stacks-affine-triple-monoidal-07J5-codex-rtOQ9t'
hyp=['Commutative k,R,S,T,U and module carriers in the native common module universe; independent form-module universes and the explicit k-actions and degree-one scalar towers. Calculus morphisms lie over the actual algebra maps. Parameter equalities are retained. The triple structure/map formulas require R/S/T and R/T/U towers; the actual comparison paths also retain S/T/U and R/S/U towers.','Arbitrary modules and λ, including d₀λ≠0; no flatness, injectivity, finite generation, projectivity, basis, integrability or reducedness assumption. The reserved global finite locally free integrable key retains relatively constant λ and actual ringed-site sheaf interfaces.']
new=[]
for n,title,stmt,deps,proof in specs:
 new.append(dict(id=ids[n],parentStageId=RID+':H.0',realises=[RID+':H.0'],kind='construction'if n=='pullbackTripleMonoidal'else'lemma',title=title,declaration='AffineCategory.'+n,statement=stmt,hypotheses=hyp,prerequisites=[x if ':'in x else ids[x]if x in ids else existing[x]for x in deps],proofSteps=[proof],acceptance=[stmt,'Use the actual inherited category and native monoidal structures; preserve explicit parameter transports and every inherited contract. No global sheaf descent or source closure is concluded.'],library=dict(module='TauCeti/Geometry/Hodge/Higgs/ParameterConnection',namespace=NS),sources=[dict(sourceId=sid,locator='Displayed Section60.15 ordinary connection convention; authored actual monoidal triple deduction',excerpt='connection',match='Ordinary-connection context only. These monoidal interfaces are authored from the inherited actual affine functors and pinned native category and scalar-extension APIs.')],implementationStatus='unchecked'))
by={n['declaration'].split('.')[-1]:n for n in new};c=by['pullbackTripleMonoidal']
c['api']=[dict(name='AffineCategory.pullbackTripleMonoidal_'+a,role='compatibility',statement=by['pullbackTripleMonoidal_'+a]['statement'])for a in ['unit','tensor','cotensor','counit','tensor_tmul','cotensor_tmul']]
ti=[('unit_value','computation','For arbitrary u:U, the actual triple ε sends u to u⊗1⊗1⊗1.'),('tensor_value','computation','For six arbitrary scalar coefficients and actual X,Y, triple μ multiplies corresponding scalar factors and retains x⊗y, exactly as the stated generator formula.'),('cotensor_value','computation','The actual triple δ on u⊗t⊗s⊗(x⊗y) gives (u⊗t⊗s⊗x)⊗(1⊗1⊗1⊗y).'),('comparisons','compatibility','The actual outer and inner comparison forward and inverse natural transformations all satisfy native NatTrans.IsMonoidal for the same actual triple composite.'),('nonconstant_parameter','computation','Over Z[x] with d₀x=1 and λ=x, the actual triple ε sends x to x⊗1⊗1⊗1 and the actual outer comparison is monoidal.'),('nonreduced_tensor','computation','Over Z/4 with zero calculus and λ=2, actual triple μ on a=1⊗1⊗1⊗2 and b=1⊗1⊗1⊗1, followed by the actual outer comparison at the tensor of unit objects and two native left-unit maps, has value2, nonzero and square-zero.'),('zero_ring','degenerate','Over Z/1 with zero calculus and λ=0, the actual triple ε and η both send zero to zero.')]
c['tests']=[dict(name='AffineTripleMonoidalTests.'+n,kind=k,statement=t)for n,k,t in ti]
c['uses']=[dict(where=ids['pullbackTripleOuterIso_isMonoidal'],how='Compare the actual triple composite with direct pullback in the native monoidal category. The equal inner route inherits the same compatibility; this precedes exterior-power/dual comparisons and global sheaf restriction/descent.')]
p['nodes']+=new;save('BaselineReading.json',[])
src=load('SourceReading.json');p['sources'].append(dict(id=sid,title='Ordinary connections and authored monoidal triple comparison interfaces',authors='The Stacks Project authors; deductions by Codex — codex-rtOQ9t',edition='Displayed Section60.15 read4October2026',url=src[0]['url'],sha256=src[0]['sha256'],accessed=src[0]['accessedUTC'],readSections=[x['scope']for x in src]))
finding=dict(id=RID+'/ErtOQ9t07J5Delta',source=sid,locator='Historical crystalline.tex proof fragment at line2714, visible in the complete authors correction patch d90e73b0eb86c47faa4724d04a3f06a810a83d36; current tag07J5 comments4172 and4373.',kind='misprint',printed='pulling back by $\\Delta$',correction='Use i, the previously defined diagonal closed immersion T→T′, in that proof reference.',reason='The displayed current proof names the diagonal i. The complete authors patch changes precisely this reference from Delta to i, confirming the acknowledged historical notation mismatch.',affects='the proof',known='Already reported in tag07J5 comment4172 and fixed by the authors in commit d90e73b0eb86c47faa4724d04a3f06a810a83d36 on30August2019; current comment4373 acknowledges the correction.',searched=[src[0]['url'],src[1]['url'],'Complete current displayed section and both comments; complete one-line correction patch. No whole historical crystalline.tex or full-paper version collation.'])
p['sourceIssues'].append(finding)
frontier='The actual triple pullback now carries the native monoidal structure on the existing four-factor composite. All four underlying structure maps are explicit native base-change/distribution compositions. Both actual outer-first and inner-first comparison forward and inverse natural transformations are monoidal for this structure, and the parameterChange/pullback natural isomorphism is monoidal in both directions. Native whole categorical unit/tensor equations, together with inherited equality of the actual paths, prove these statements. Generator computations retain arbitrary coefficients, a nonconstant polynomial parameter with derivative1, nonreduced Z/4 and the zero ring. Universal exterior-power and finite-projective dual comparisons, and actual E1 sheaf tensor/restriction/equality detection/effective gluing remain open. The reserved global finite locally free integrable key retains relatively constant λ. All149 routes,35 omissions,five requests,eleven gaps,six planets and later determinant/Tate/period and arbitrary-Q tensor-valued-shuffle obligations remain. H.0 stays partial and H.1–H.8 not_read; earlier frontier prose remains checkpoint history.'
p['summary']+=' Monoidal triple continuation:15 nodes(1 construction,14 lemmas),6 API references and7 distinct typed tests; acknowledged historical diagonal-reference correction recorded narrowly.'
p['coverage'][0]['remaining'].append(frontier);road['stages'][0]['description']+=' '+frontier
p['verification']=dict(previousCheckpoint=old['verification'],worker='Codex — codex-rtOQ9t',date='2026-10-04',issue=3371,mathematicalBase=(S/'base.txt').read_text().strip(),compilation={n.lower():load(n+'.receipt.json')for n in ['Native','Canonical']},newNodes=15,newAPIReferences=6,newDistinctAPI=6,newTestReferences=7,newDistinctTests=7,implementation='unchecked; actual affine proof artifacts only; global sheaf and source closure remain open',publicReplay='Actual public HTTP recovery and both immutable verifier reports required before submission.')
plan=dict(newNames=[n['declaration']for n in new],newNodes=[n['id']for n in new],apiAdditions={},testAdditions={},newBaseline=[],newBaselineRefs=[],frontier=frontier,apiReferences=6,distinctAPI=6,testReferences=7,distinctTests=7,newSourceIssues=[finding])
for n,x in [('Candidate.json',p),(RID+'.json',p),('Candidate-roadmap.json',road),('NewNodes.json',new),('Plan.json',plan)]:save(n,x)
parts=['# Monoidal three-step affine pullback comparisons\n\nThe existing actual three-step pullback now carries the native composite monoidal structure. Its unit, tensor, reverse tensor and counit maps retain their actual native scalar-extension modules and parameter transport. The outer-first comparison satisfies whole categorical unit and tensor equations. The inherited equality of the actual forward comparison transformations gives inner-first monoidality; native inverse-isomorphism monoidality proves both inverse directions. The actual parameterChange/pullback comparison is also monoidal in both directions.\n\n'+frontier+' Every implementation remains unchecked.\n\n## Declarations and tests\n\n']
for n in new:
 parts.append('### '+n['title']+'\n\n`'+n['declaration']+'` — '+n['statement']+'\n\nProof plan: '+' '.join(n['proofSteps'])+'\n\n')
 for field in ['api','tests']:
  if n.get(field):parts.append(field.upper()+':\n\n'+''.join('- `'+x['name']+'`: '+x['statement']+'\n'for x in n[field])+'\n')
parts.append('## Historical source correction\n\nThe complete current Stacks07J5 display and its two public comments, together with the complete authors correction patch linked there, show an acknowledged historical diagonal-reference misprint. The patch replaces Delta by i in one proof reference. This is recorded as an already corrected proof misprint; no stated-result error or whole historical-version collation is claimed. [Current section](https://stacks.math.columbia.edu/tag/07J5), [authors correction](https://github.com/stacks/stacks-project/commit/d90e73b0eb86c47faa4724d04a3f06a810a83d36).\n\n## Earlier checkpoint reader (preserved verbatim)\n\n')
a=''.join(parts);(S/'ReaderAddition.md').write_text(a);(S/'Reader.md').write_text(a+(S/'IncomingReader.md').read_text())
print(json.dumps(dict(nodes=len(p['nodes']),baseline=len(p['baseline']['declarations']),newNodes=15,APIReferences=6,testReferences=7,sourceIssues=len(p['sourceIssues']))))
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
"""Render the scoped monoidal checkpoint, authenticated own reading and actual checks."""
from pathlib import Path
import hashlib,json,re
S=Path(__file__).resolve().parent
t=lambda n:(S/n).read_text();j=lambda n:json.loads(t(n));sha=lambda b:hashlib.sha256(b).hexdigest()
p=j('Candidate.json');old=j('Incoming.json');plan=j('Plan.json');g=j('Graph.json');c=j('ClaimReceipt.json')
def compile_line(n):
 r=j(n+'.receipt.json');b=(S/(n+'.lean')).read_bytes();assert r['exitStatus']==0
 return f"- {n}.lean: {len(b.splitlines())} lines, {len(re.findall(r'^example\b',b.decode(),re.M))} examples, exit0, {r['warnings']} warnings, {r['axiomAudits']} axiom audits; {r['availableGiBBefore']}GiB available before compilation, {r['elapsedSeconds']} seconds, peak {r['maxRssKiB']} KiB. Source SHA256 `{sha(b)}`; diagnostic SHA256 `{r['logSha256']}`.\n"
h=f'''# Monoidal three-step affine pullback comparisons — checkpoint

Codex — codex-rtOQ9t. Refs #3371. Partial; every implementation remains unchecked.

The actual existing pullbackTriple(p,n,m) now has the native Functor.Monoidal structure on its exact four-factor composite: pullback(m), pullback(n), pullback(p), and explicit final parameterChange from the nested scalar-map image of λ to its R→U image. The native composite construction retains the actual functor, additive operators, horizontal arrows and parameter equality. Its ε, μ, δ and η underlying U-linear maps are the corresponding three native rid/distribBaseChange maps, base-changed to U in the actual composition order. The final parameterChange maps are the existing identities. The construction does not redefine native monoidal interfaces.

The actual outer-first natural comparison satisfies whole categorical unit and tensor equations for this native composite structure and direct pullback. The unit proof evaluates both native cancellation maps on u⊗1⊗1⊗1 after horizontal-arrow/linear-map extensionality. The tensor proof cancels actual invertible δ by the native δμ law, then uses horizontal-arrow subtype extensionality, three native curry extensionalities and tensor extensionality. Native cancellation/distribution formulas prove the generator equation, and extensionality gives the complete horizontal-arrow equation. These are the two fields of native NatTrans.IsMonoidal for the actual outer forward transformation. Native inverse-isomorphism monoidality gives its actual inverse. The inherited equality of the actual outer and inner forward natural transformations proves inner forward monoidality for the same structures; its inverse is monoidal as well. The actual parameterChange/pullback natural isomorphism also satisfies native monoidality in both directions, with its explicit equality transport retained.

Commutative k,R,S,T,U and native module carriers share the native module universe; degree-one/two form modules retain independent universes, k-actions and degree-one scalar towers. Structure-map formulas require R/S/T and R/T/U scalar towers; the existing actual comparison paths also retain S/T/U and R/S/U towers. Calculus morphisms lie over the actual algebra maps. Arbitrary modules and λ, including d₀λ≠0, need no flatness, injectivity, finite generation, projectivity, basis, integrability or reducedness assumption. The raw affine category does not close the reserved global finite locally free integrable ringed-site key, whose relatively constant parameter and genuine sheaf interfaces remain required.

All {len(old['nodes'])} incoming node objects and all {len(old['baseline']['declarations'])} baseline objects remain whole. This continuation adds15 nodes:1 construction,14 lemmas,6 API references and7 distinct typed tests. The construction has the four underlying map equations and both tensor generator formulas as its six API items. Tests calculate ε on arbitrary u, μ with six arbitrary scalar coefficients, δ on generators, and native monoidality of both directions of both actual comparisons. Over Z[x] with λ=x and d₀x=1 they evaluate the actual unit and outer monoidality. Over Z/4 with λ=2 and zero calculus, actual μ followed by the outer comparison at the tensor of unit objects and two native left-unit maps retains value2, nonzero and square-zero. Over Z/1, both actual ε and η send zero to zero.

Universal exterior-power and finite-projective dual comparisons, and genuine E1 sheaf tensor/restriction/equality detection/effective gluing remain open. All149 routed obligations,35 omissions,five requests,eleven whole gaps,six planets, determinant/Tate/period and arbitrary-Q tensor-valued-shuffle obligations remain. H.0 stays partial and H.1–H.8 not_read. Prior frontier paragraphs are attributed checkpoint history; none is silently rewritten. The inherited source issue is preserved and the acknowledged historical proof misprint below is appended narrowly.

## Reading and recovered incoming evidence

The complete {c['characters']}-character issue was read before claim {c['claim']} and after exact numeric bot confirmation {c['bot']}; bodies were byte-equal. ClaimReceipt.json binds both whole read intervals and the body hash. The whole reserved key, allfive requests and complete H.0 coverage were freshly read. The lasttwo gap objects, relevant current first-gap/coherence fields and current node objects were freshly read in bounded displays. Earlier gap scopes reuse only unchanged authenticated own receipts. Allfour complete parent Hodge AUDIT-02 rows and metadata, and the whole REV-AUDIT-02 report, were freshly read. The initially truncated L1/L2 display was followed by complete bounded rereads. No PartII audit row exists; the reviewed parent is not replanned.

Incoming own PR #6066 at immutable head8a24348d630948e0bf3596f16069c3b66f259a76 was actually recovered over public HTTP from archive b99f1046f4591ae5ff944309c40414b6f146f05e. All65 artifacts,10 helpers and5 public deliverables authenticated against manifest f6ec0a378354ac2cb193eb524349ca6a5946b6648b89e416be9fd59d655449dd. Both actual original immutable verifier outputs were reproduced byte-for-byte. The complete previous19 new proofs,12 tests and all10 helper scripts were freshly read, together with the incoming handoff's first14000 characters and complete helper fences. NativePrefix4310–4600 supplies the actual parameter/two-step monoidal structures and comparisons. The full5239-line native and6987-line canonical prefixes are authenticated and preserved in order, with a harmless import-context comment and this continuation appended. Prefix reuse does not assert a fresh manual audit of every inherited line.

The current direct own6066 manifest binds its original Reading/InputGuard and retained own6059,6046,6032 and6001 reading envelopes. Its whole Reading.json was personally read. The42 guarded files have37 unchanged controls and5 advanced own deliverables. Reuse is limited to original scopes on unchanged files. WORKERS was read whole again; the complete930-line PROTOCOL was read earlier in this continuous loop, with300–460 refreshed here. Whole native Monoidal/NaturalTransformation.lean and the actual Functor Lax/Oplax composite formulas were freshly read. Native TensorProduct distribution/baseChange and linear-equivalence coercion statements were consumed in the bounded ranges recorded in Reading.json. All15 exact proposed specialized names were absent in bounded pinned Mathlib/Tau source searches; generic native APIs are reused. No exhaustive absence or peer-reading claim is made.

The complete current displayed Stacks07J5 Section60.15 definitions, Lemma60.15.1 proof and both public comments were freshly read, as was the complete authors correction patch d90e73b0eb86c47faa4724d04a3f06a810a83d36 linked there. SourceReading.json binds both actual HTTP byte streams, hashes, times and scopes. The patch changes one historical proof reference from Delta to i, the defined diagonal T→T′. This acknowledged, already corrected30August2019 misprint is recorded as affecting the proof, with no stated-result error or whole historical crystalline.tex/full-paper version collation claimed. Ordinary connection conventions supply context only; the monoidal interfaces are authored deductions from inherited actual affine constructions and pinned native Mathlib APIs. No recursive source closure or crystal-equivalence conclusion is made. [Current section](https://stacks.math.columbia.edu/tag/07J5), [authors correction](https://github.com/stacks/stacks-project/commit/d90e73b0eb86c47faa4724d04a3f06a810a83d36).

## Validation

The entire suggested file is Mathlib-only and compiled at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 using Lean4.34.0-rc2, compiler6a10ac8c22beadecabdbb0919c2b50214762f91d. The runner checks exact pins and existing compiled dependencies, tracked cleanliness, fresh available memory≥20GiB, one thread,8192MiB managed-memory limit and1200-second timeout. Every compilation finished before another compiler, Lean-file edit or rebase began. The disposable own Context object accelerated prototypes only; the final Native run elaborates the entire source. No Lake setup, library build/cache download or language server was started.

'''+compile_line('Native')+compile_line('Canonical')+f'''
All291 native audits use only propext,Classical.choice and Quot.sound; no warning, error, admission or sorryAx occurs. The entire Canonical file has845 admission warnings only. All15 declaration and7 example headers match the admitted projection. The one native composite construction remains concrete;14 lemma and7 example proofs are admitted only in the planning projection. Suggested.lean equals the entire compiled Canonical.lean byte-for-byte, SHA256 `{sha((S/'Canonical.lean').read_bytes())}`. These are affine proof artifacts; global sheaf and source closure remain open.

The actual indexed checker, immutable intake/file rules, source-issue checks and atlas assembler pass without errors or warnings. Packet:{len(p['nodes'])} nodes,{len(p['baseline']['declarations'])} baseline declarations,{sum(len(n.get('api',[]))for n in p['nodes'])} raw API references,{sum(len(n.get('tests',[]))for n in p['nodes'])} raw test references. Stage DAG {g['stageDAG']['vertices']}/{g['stageDAG']['edges']}, own declaration DAG {g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']}, scoped DAG {g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']} vertices/edges are acyclic. All{g['requiredPairs']} required supplier pairs are reachable, with no own skipped/pending link. Every foreign roadmap/stage/stage-edge object equals its immutable control.

Mathematical base `{t('base.txt').strip()}`; publication base `{t('publication-base.txt').strip()}`. All42 guard hashes and the issue's mathematical contract agree between bases. Index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Both verifier reports execute actual immutable checker/intake/atlas code without Lean or a repository snapshot. Actual final public recovery and both recovered verifier outputs must authenticate byte-for-byte before opening the PR.

## Resume

Use the actual native composite triple monoidal structure, its four explicit whole maps and both comparison paths' forward/inverse monoidality. Continue universal exterior-power and finite-projective dual comparisons, then genuine E1 sheaf tensor/restriction/equality detection/effective gluing. Preserve all149 routes,35 omissions,five requests,eleven gaps, later-stage/source obligations and the relatively constant parameter in the reserved global key.

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
assert len(old['nodes'])==493 and len(p['nodes'])==508
assert p['nodes'][493:]==data('NewNodes.json')and set(p)==set(old)
for before,after in zip(old['nodes'],p['nodes']):
 expected=json.loads(json.dumps(before));nid=before['id']
 if nid in plan['apiAdditions']:expected['api']+=plan['apiAdditions'][nid]
 if nid in plan['testAdditions']:expected['tests']+=plan['testAdditions'][nid]
 assert after==expected,nid
assert sum(a==b for a,b in zip(old['nodes'],p['nodes']))==493
for k in old:
 if k not in ['nodes','summary','sources','coverage','gaps','verification','baseline','sourceIssues']:assert p[k]==old[k],k
assert p['baseline']['declarations']==old['baseline']['declarations']+plan['newBaseline']
assert {k:v for k,v in p['baseline'].items()if k!='declarations'}=={k:v for k,v in old['baseline'].items()if k!='declarations'}
assert [x['ref']for x in p['baseline']['declarations'][256:]]==plan['newBaselineRefs']
assert p['sources'][:-1]==old['sources']and p['summary'].startswith(old['summary'])
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
assert incoming['head']=='8a24348d630948e0bf3596f16069c3b66f259a76'and incoming['artifactsVerified']==65 and incoming['archivedHelpersVerified']==10
assert sha((S/'IncomingManifest.json').read_bytes())=='f6ec0a378354ac2cb193eb524349ca6a5946b6648b89e416be9fd59d655449dd'
assert (S/'PreviousVerification.json').read_bytes()==(S/'IncomingPublicationVerification-replayed.json').read_bytes()
for name,prefix in [('Native.lean','NativePrefix.lean'),('Canonical.lean','CanonicalPrefix.lean')]:assert im[name]['sha256']==sha((S/prefix).read_bytes())
for path,n in zip(paths,['Incoming-roadmap.json','Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert sha((S/n).read_bytes())==incoming['publicDeliverables'][path]
assert text('Incoming.lean')==text('CanonicalPrefix.lean')
own=data('OwnReadingReuse.json');assert len(own)==42 and sum(g['unchanged']for g in own)==37
om=data('OwnPreviousManifest.json')
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='f6ec0a378354ac2cb193eb524349ca6a5946b6648b89e416be9fd59d655449dd'
assert text('OwnPreviousManifest.json')==text('IncomingManifest.json')
for n,orig in [('OwnPreviousReading.json','Reading.json'),('OwnPreviousInputGuard.json','InputGuard.json'),('OwnIntermediateReading.json','OwnPreviousReading.json'),('OwnIntermediateInputGuard.json','OwnPreviousInputGuard.json'),('OwnIntermediateManifest.json','OwnPreviousManifest.json'),('OwnInheritedReading.json','OwnInheritedReading.json'),('OwnInheritedInputGuard.json','OwnInheritedInputGuard.json'),('OwnInheritedManifest.json','OwnInheritedManifest.json'),('OwnOriginalReading.json','OwnOriginalReading.json'),('OwnEarlierReading.json','OwnEarlierReading.json')]:assert sha((S/n).read_bytes())==om[orig]['sha256'],n
assert [{'path':g['path'],'sha256':g['previousSha256']}for g in own]==data('OwnPreviousInputGuard.json')
for g in own:
 assert sha(blob(MATH,g['path']))==g['currentSha256']
 assert g['unchanged']==(g['previousSha256']==g['currentSha256'])
assert (S/'PreviousMathematicalVerification.json').read_bytes()==(S/'IncomingMathematicalVerification-replayed.json').read_bytes()
src=data('SourceReading.json')
for row,name in zip(src,['07J5.html','07J5-correction.patch']):assert sha((S/name).read_bytes())==row['sha256']
patch=text('07J5-correction.patch')
assert '-$p_1^*' in patch and '+$p_1^*' in patch and 'pulling back by $\\Delta$' in patch and 'pulling back by $i$' in patch
assert len(plan['newSourceIssues'])==1 and plan['newSourceIssues'][0]['affects']=='the proof'
claim=data('ClaimReceipt.json');assert claim['claim']==5979733540 and claim['bot']==5979734583 and claim['beforeAfterEqual']
assert text('Native.lean')==with_imports(text('NativePrefix.lean'))+'\n'+text('NewProofs.lean')+'\n'+text('NewTests.lean')+'\n'+text('Audits.lean')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',text('Native.lean'))
from projection import project
assert text('NewAdmitted.lean')==project(text('NewProofs.lean')+'\n'+text('NewTests.lean'))
assert len(re.findall(r'\bsorry\b',text('NewAdmitted.lean')))==21
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
assert {**nh,**nt}==ch and len(nh)==15 and len(nt)==7
assert set(plan['newNames'])==set(nh)=={n['declaration']for n in p['nodes'][493:]}
new=p['nodes'][493:]
assert {t['name']for n in new for t in n.get('tests',[])}==set(re.findall(r'^-- test: (.+)$',text('NewTests.lean'),re.M))
assert sum(len(n.get('api',[]))for n in new)==6 and len({x['name']for n in new for x in n.get('api',[])})==6
assert sum(len(n.get('tests',[]))for n in new)==7
for n in new:
 assert n['declaration']in text('Reader.md')and n['statement']in text('Reader.md')
 if n['kind']in ['definition','construction']:
  assert len(n['api'])>=3 and len(n['tests'])>=3 and n['uses']
 for k in ['api','tests']:
  for x in n.get(k,[]):assert x['name']in text('Reader.md')and x['statement']in text('Reader.md')
assert text('Audits.lean')=='\n'.join('#print axioms TauCeti.Hodge.ParameterConnection.Intrinsic.'+n for n in plan['newNames'])+'\n'
for name,warnings,examples,audits in [('Native.lean',0,152,291),('Canonical.lean',845,349,0)]:
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
if BASE==text('publication-base.txt').strip():assert graph==data('Graph.json')
print(json.dumps(dict(checker=summary,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,wholeIncomingNodesUnchanged=493,preservedMathematicalContracts=493,newNodes=15,newAPIReferences=6,newDistinctAPI=6,newTestReferences=7,newDistinctTests=7,matchedNewHeaders=len(ch),rawAPIItems=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),compilation=p['verification']['compilation'],inputGuards=len(data('InputGuard.json')),indexSha256=sha(Path(sys.argv[2]).read_bytes()),mathematicalBase=MATH,immutableBase=BASE,graph=graph,fullCanonicalCompiled=True,sourceScope='Whole current Stacks07J5 display/comments and whole authors correction patch; inherited source issue preserved and narrowly appended acknowledged historical proof misprint. No whole historical crystalline.tex/full-paper collation.',LeanExecuted=False),indent=2))
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
result=subprocess.run(['/usr/bin/time','-v','timeout','1200',str(lean),'-j','1','-M','8192']+extra+[str(out/name)],env=env)
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
 if 'error:' in line:print(line.rstrip(),flush=True)
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
OwnIntermediateManifest.json OwnIntermediateReading.json OwnIntermediateInputGuard.json 07J5.html 07J5-correction.patch Prototype.lean Prototype.log Prototype.receipt.json Context.lean Context.log Context.receipt.json
ClaimReceipt.json Reading.json SourceReading.json BaselineReading.json OwnPreviousReading.json OwnInheritedReading.json OwnInheritedInputGuard.json OwnInheritedManifest.json
OwnReadingReuse.json OwnOriginalReading.json OwnEarlierReading.json OwnPreviousManifest.json OwnPreviousInputGuard.json
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
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED AFFINE TRIPLE MONOIDAL PAYLOAD\n'+pb+b'END ARCHIVED AFFINE TRIPLE MONOIDAL PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('roadmaps','Candidate-roadmap.json'),('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated affine triple monoidal comparison evidence; never executes Lean."""
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
pb=raw.split('/- BEGIN ARCHIVED AFFINE TRIPLE MONOIDAL PAYLOAD\\n',1)[1].split('END ARCHIVED AFFINE TRIPLE MONOIDAL PAYLOAD -/',1)[0].encode()
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
