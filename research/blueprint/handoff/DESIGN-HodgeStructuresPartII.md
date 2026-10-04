# Categorical three-step affine pullback coherence — checkpoint

Codex — codex-rtOQ9t. Refs #3371. Partial; every implementation remains unchecked.

The actual three-step pullback functor is the composite of three existing affine pullbacks and explicit parameterChange from the nested algebra-map image of λ to its R→U image. Its operator is the actual three successive affinePullback operators, and its arrow map is the actual three successive native base changes. Two natural isomorphisms compare this functor with direct pullback. The outer-first path applies the existing p/n tower comparison at the first pulled object, transports its parameter, and then applies the existing (p∘n)/m comparison. The inner-first path first moves the R/S/T parameter equality through pullback(p), then applies pullback(p) to the existing n/m comparison, and finally the p/(n∘m) comparison with the final parameter transport.

The parameterChange/pullback comparison is an actual natural isomorphism on the scalar-extension module with identity underlying maps. Its horizontality proof eliminates the given parameter equality; it cannot be replaced by an informal identification of the two parameter values. Both triple comparisons are assembled from the existing actual tower isomorphisms. Their underlying U-linear maps are respectively cancel(R,S,U) after cancel(S,T,U), and cancel(R,T,U) after U-base change of cancel(R,S,T). Native cancellation associativity proves equality of their forward natural transformations after natural-transformation and horizontal-arrow extensionality. The inverse transformations and the actual natural isomorphisms consequently agree. Naturality is for arbitrary horizontal arrows and arbitrary compatible calculus maps.

Commutative k,R,S,T,U and native module carriers share the native module universe; degree-one/two form modules retain independent universes. All required algebra structures and scalar towers are explicit. Modules and λ are arbitrary, including d₀λ≠0. No flatness, injectivity, finite generation, projectivity, basis, integrability or reducedness is assumed. This raw affine category does not close the reserved global finite locally free integrable ringed-site key, whose relatively constant parameter and genuine sheaf interfaces remain required.

All 474 incoming declaration objects and255 baseline objects remain whole. This continuation adds 19 nodes:4 constructions, 15 lemmas, 12 API references to 12 declarations, and18 test references to 12 distinct typed examples. Each construction has at least 3 API items and 3 relevant tests. Tests evaluate the parameter comparison and inverse roundtrip on arbitrary tensors, a polynomial parameter x with derivative 1, actual triple operators and arrow maps, both comparison formulas on arbitrary scalars, both inverse roundtrips on arbitrary elements, arbitrary-arrow naturality, and full forward/inverse/isomorphism coherence. Over Z/4 they retain the nonzero square-zero value 2 through both actual triple maps; over ℤ/1 they test the zero tensor and actual categorical equality.

Monoidal packaging of these new triple comparison paths, universal exterior-power and finite-projective dual comparisons, and actual E1 sheaf tensor/restriction/equality detection/effective gluing remain open. The existing monoidal identity/two-step comparisons and braided pullback are preserved. All 149 routed obligations,35 omissions,five requests,eleven whole gaps,six planets, determinant/Tate/period and arbitrary-Q tensor-valued-shuffle obligations are preserved. H.0 stays partial; H.1–H.8 stay not_read. Prior frontier paragraphs remain attributed checkpoint history. The source issue and version envelope are unchanged.

## Reading and incoming evidence

The entire 22198-character issue was read before claim 5978697772 and after exact numeric bot confirmation 5978698997; bodies were byte-equal. ClaimReceipt.json binds both complete read intervals and the body hash. The whole reserved key, all five requests and whole H.0 coverage were freshly read. Current stage frontier and relevant gap/coherence fields were consumed in bounded displays; earlier gap scopes reuse only unchanged authenticated own receipts. All four complete reviewed parent Hodge audit objects and metadata were freshly read; no PartII audit row exists. The pure/mixed Hodge parent is not replanned. No fresh full 474-node or historical reader audit is asserted.

Incoming peer PR #6062 at immutable head 56c0eece583061466e6c5af87153ca96e72c2584 was actually recovered by public HTTP from archive b239659bb7c5d05fbe545baeab78d877644f0033. All63 artifacts,10 helpers and 5 public deliverables authenticated against manifest a457bc844e43bbdbcbe384ca2951ead0954d408c334363938a349261e9f26a79. Both actual recovered mathematical and publication verifiers reproduced their original reports byte-for-byte. The current handoff first 12000 characters, complete 19 new proofs, 11 tests and all 10 helpers were freshly read. NativePrefix ranges3140–3235,3730–3875 and2650–2775 cover the actual category comparison, parameter/tower functors and module associativity. The full 4778-line native and 6586-line canonical prefixes are authenticated and preserved in order, with a harmless new import-context comment inserted and this continuation appended. This is compiled prefix reuse, not a manual audit of every inherited line.

Own PR #6059 was separately authenticated again over public HTTP, including all 60 artifacts, 10 helpers and 5 files, manifest 1409fad87dc87ba6dba7c6f04305c8a1821078fa6d4fa30b3a17913050ddf3d0 and the original Reading/InputGuard receipts. Its original own #6046,#6032 and #6001 reading scopes are retained with their authenticated manifests. All original reading receipts were personally read whole here. 42 guarded controls have 37 unchanged external files and 5 advanced job deliverables. Only original scopes are reused for unchanged files; no peer reading is relabelled as this worker's. WORKERS was read whole here; the whole 930-line PROTOCOL was freshly read earlier in this continuous loop, with330–458 refreshed here. Exact source-range hashes, bounded absence searches, claim and audited scopes are in Reading.json. No exhaustive absence claim is made; native category/monoidal/whiskering and scalar-extension APIs are reused.

The complete displayed Stacks07J5 Section60.15 definitions, Lemma60.15.1 proof and both public comments were freshly read. SourceReading.json binds actual HTTP bytes, hash and retrieval time. Ordinary connection conventions supply context only. The categorical triple comparison is an authored deduction from inherited actual affine constructions and pinned native Mathlib APIs. No full-paper/PDF, historical-version, recursive citation closure, crystal equivalence or new erratum claim is made; the inherited issue/version envelope remains whole.

## Validation

The entire suggested file is Mathlib-only and compiled at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 with Lean 4.34.0-rc2, compiler 6a10ac8c22beadecabdbb0919c2b50214762f91d. The runner checks the exact Mathlib/compiler/compiled dependency pins and tracked cleanliness, fresh available memory≥20GiB, one thread,8192MiB managed-memory limit and 1200-second timeout. Each compilation finished before another compiler or Lean-file edit started. The disposable Context object accelerated prototypes only; the final Native run elaborates the entire source. No Lake setup, library build, download or language server was started.

- Native.lean: 5239 lines, 145 examples, exit0, 0 warnings, 276 axiom audits; 41GiB available before compilation, 103.62 seconds, peak 4001960 KiB. Source SHA256 `79b02b87e2ac17c5baac9a8e390819bedf8f92ee2d43aa1cf3e0d8b51cb07249`; diagnostic SHA256 `725187d9071057b1a8190993a7a6235a693fd9b3f99bf1e4791f48dc175fbf5e`.
- Canonical.lean: 6987 lines, 342 examples, exit0, 824 warnings, 0 axiom audits; 24GiB available before compilation, 59.9 seconds, peak 3629280 KiB. Source SHA256 `41602b52f42f08098e82202dd9a7cb94c61f79d2e4c8e078d00ee64dc9052e11`; diagnostic SHA256 `0687d093406910dde157227c7312504e41109713ac17f520864af5328db38776`.

All 276 native axiom audits use only propext,Classical.choice and Quot.sound; no warning, error, admission or sorryAx occurs. The whole Canonical file has 824 admission warnings only. All 19 declaration and 12 typed-example headers match the admitted projection. The 4 constructions remain concrete ; 15 lemma and 12 example proofs are admitted only in the planning projection. Suggested.lean and the whole compiled Canonical.lean are byte-equal, SHA256 `41602b52f42f08098e82202dd9a7cb94c61f79d2e4c8e078d00ee64dc9052e11`. These are affine proof artifacts; global sheaf and source closure remain open.

The actual indexed checker, immutable intake/file rules, source issue/version checks and atlas assembler pass without errors or warnings. Packet:493 nodes,256 baseline declarations,478 raw API references,445 raw test references. Publication stage DAG 3022/8663, own declaration DAG 493/939, scoped DAG 3510/10139 vertices/edges are acyclic. All 21 required supplier pairs are reachable, with no own skipped or pending link. Every foreign roadmap/stage/stage-edge object matches the immutable control.

Mathematical base `156be4fe5c33da24d10259243acfb66c20acbd42`; publication base `8ca5eca6799a0e61a281db73ec0ef74a804c7b8b`. All 42 guards and the issue's mathematical contract agree between bases. Index SHA256 86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Both verifier reports execute actual immutable checker/intake/atlas code without Lean or a repository snapshot. Final actual public recovery and both recovered verifier outputs must authenticate byte-for-byte before submission.

## Resume

Use the actual parameterChange/pullback comparison and both triple natural isomorphisms with their proved forward/inverse coherence. Continue their monoidal packaging using the existing actual monoidal two-step comparisons and native whiskering; then universal exterior-power and finite-projective dual comparisons and genuine E1 sheaf tensor/restriction/equality detection/effective gluing. Preserve all 149 routes,35 omissions,five requests,eleven gaps and later-stage/source obligations. The reserved global key remains open.

## Public recovery and replay

Archive commit `b99f1046f4591ae5ff944309c40414b6f146f05e` is an ancestor changing only this issue's suggested file. Its 65 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `f6ec0a378354ac2cb193eb524349ca6a5946b6648b89e416be9fd59d655449dd`; payload SHA256 `06f57162393cc7a01f35728422365dbafea43493ce09ecd754f385fea42ed1a2`. The final suggested file has no archive payload and equals the entire compiled Mathlib-only Canonical.lean.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set HODGE_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Canonical.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean and Suggested.lean are byte-equal and the whole file was compiled. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

```python
"""Recover public authenticated affine categorical triple comparison evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='HodgeStructuresPartII'
ARCHIVE='b99f1046f4591ae5ff944309c40414b6f146f05e'
MANIFEST_SHA='f6ec0a378354ac2cb193eb524349ca6a5946b6648b89e416be9fd59d655449dd'
PAYLOAD_SHA='06f57162393cc7a01f35728422365dbafea43493ce09ecd754f385fea42ed1a2'
EXPECTED={'roadmaps': 'd8034c6c766d8d0537f5ca0b71686d02c17f1c8298520e3b78ad2165391edcf7', 'packets': 'ea322059583c8e948083776beee9e79b69bce5fe0b0a4f71a2c65611cd592d93', 'readmes': '2114957033d20e16c1e0d26e84484126ec500e68d3fdb61ffd0cba4a25819eca', 'suggested': '41602b52f42f08098e82202dd9a7cb94c61f79d2e4c8e078d00ee64dc9052e11'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED AFFINE CATEGORICAL TRIPLE PAYLOAD\n',1)[1].split('END ARCHIVED AFFINE CATEGORICAL TRIPLE PAYLOAD -/',1)[0].encode()
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
"""Append actual three-step categorical pullback coherence; preserve incoming contracts."""
from pathlib import Path
import copy,csv,json,re,sys
S=Path(__file__).resolve().parent;RID='HodgeStructuresPartII';NS='TauCeti.Hodge.ParameterConnection.Intrinsic'
load=lambda n:json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
old=load('Incoming.json');p=copy.deepcopy(old);road=load('Incoming-roadmap.json')
existing={n.get('declaration'):n['id']for n in old['nodes']}
specs=[
('pullbackParameterChangeIso','Pullback commutes with parameter transport','For h:λ=μ and a calculus morphism m over R→S, construct a natural isomorphism parameterChange(h)⋙pullback(m) ≅ pullback(m)⋙parameterChange(congrArg(algebraMap R S,h)). Both components have identity underlying S-linear maps.',['AffineCategory.parameterChange','AffineCategory.pullback','mathlib:CategoryTheory.NatIso.ofComponents'],'Use the identity linear equivalence on the actual S⊗R X. Eliminate the given parameter equality only for horizontality and prove actual arbitrary-arrow naturality.'),
('pullbackParameterChangeIso_hom','Parameter comparison forward map','The forward component of the actual pullbackParameterChangeIso is the identity S-linear map on S⊗R X.',['pullbackParameterChangeIso'],'Reduce the actual isoMk forward component at every element; no pure-tensor restriction.'),
('pullbackParameterChangeIso_inv','Parameter comparison inverse map','The inverse component of the actual pullbackParameterChangeIso is the identity S-linear map on S⊗R X.',['pullbackParameterChangeIso'],'Reduce the actual identity linear-equivalence inverse at every element; no pure-tensor restriction.'),
('pullbackParameterChangeIso_naturality','Parameter comparison naturality','Every actual horizontal arrow f commutes with the forward components of the parameter-change/pullback comparison between the two stated functor composites.',['pullbackParameterChangeIso'],'Use the naturality field of the actual natural isomorphism.'),
('pullbackTriple','Actual three-step pullback functor','For compatible m:R→S, n:S→T, p:T→U, compose three actual pullback functors and then parameterChange along the explicit composite scalar-tower equality from the nested image of λ to algebraMap R U λ.',['AffineCategory.pullback','AffineCategory.parameterChange','mathlib:IsScalarTower.algebraMap_apply'],'Compose the actual functors; form the final parameter equality by congrArg(algebraMap T U) applied to the R/S/T equality, followed by the R/T/U equality.'),
('pullbackTriple_operator','Three-step additive operator','The additive operator on pullbackTriple(p,n,m)(X) is the actual three successive affinePullback operators on X; parameterChange retains that operator.',['pullbackTriple','AffineCategory.parameterChange_operator'],'Reduce the composed functor objects and the actual parameter transport.'),
('pullbackTriple_map','Three-step horizontal map','The underlying U-linear map on an actual horizontal f is its successive native S-, T-, and U-base changes.',['pullbackTriple','AffineCategory.parameterChange_map'],'Reduce the actual composed functor maps.'),
('pullbackTriple_map_tmul','Three-step map on generators','The actual three-step map sends u⊗(t⊗(s⊗x)) to u⊗(t⊗(s⊗f(x))) for arbitrary horizontal f and scalars.',['pullbackTriple_map'],'Evaluate the three native base changes on elementary tensors.'),
('pullbackTripleOuterIso','Outer-first categorical comparison','Construct a natural isomorphism from the actual pullbackTriple to direct pullback along (p.towerComp n).towerComp m. At X, apply the existing p/n tower comparison to pullback(m)(X), transport its parameter to the R→U image, and compose with the existing (p∘n)/m tower comparison.',['pullbackTriple','AffineCategory.pullbackTowerIso','AffineCategory.parameterChange','mathlib:CategoryTheory.NatIso.ofComponents','mathlib:LinearMap.baseChange_baseChange'],'Compose those actual object isomorphisms and prove arbitrary-arrow naturality using native baseChange_baseChange and cancelBaseChange, retaining each equality transport.'),
('pullbackTripleInnerIso','Inner-first categorical comparison','Construct a natural isomorphism from the same actual pullbackTriple to direct pullback along p.towerComp(n.towerComp m). First invert the parameter-change/pullback comparison, then apply pullback(p) to the existing n/m tower comparison, then the existing p/(n∘m) tower comparison, retaining the final parameter transport.',['pullbackTriple','pullbackParameterChangeIso','AffineCategory.pullbackTowerIso','AffineCategory.affinePullback_cancel_assoc','mathlib:CategoryTheory.NatIso.ofComponents'],'Use the three stated actual isomorphisms. The parameter comparison contributes identity on the carrier. Prove naturality after the existing module associativity equation and base-change naturality.'),
('pullbackTripleOuterIso_hom','Outer route underlying map','The actual outer-first component has underlying U-linear map cancelBaseChange(R,S,U) composed with cancelBaseChange(S,T,U) on S⊗R X.',['pullbackTripleOuterIso'],'Reduce the existing tower component, mapIso and actual parameterChange map.'),
('pullbackTripleOuterIso_naturality','Outer route arbitrary-arrow naturality','For every horizontal f, the actual three-step functor map followed by the outer comparison equals the outer comparison followed by direct pullback of f.',['pullbackTripleOuterIso'],'Use the naturality field of the constructed natural isomorphism.'),
('pullbackTripleOuterIso_tmul','Outer route tensor value','The actual outer component sends u⊗(t⊗(s⊗x)) to (s acting on (t acting on u))⊗x.',['pullbackTripleOuterIso_hom','mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange_tmul'],'Apply the two native cancellation formulas in their actual order.'),
('pullbackTripleInnerIso_hom','Inner route underlying map','The actual inner-first component has underlying U-linear map cancelBaseChange(R,T,U) composed with the U-base change of cancelBaseChange(R,S,T).',['pullbackTripleInnerIso','pullbackParameterChangeIso_inv'],'Reduce the explicit three isomorphism factors and the identity parameter comparison.'),
('pullbackTripleInnerIso_naturality','Inner route arbitrary-arrow naturality','For every horizontal f, the actual three-step map followed by the inner comparison equals the inner comparison followed by direct pullback of f.',['pullbackTripleInnerIso'],'Use its actual naturality field.'),
('pullbackTripleInnerIso_tmul','Inner route tensor value','The actual inner component sends u⊗(t⊗(s⊗x)) to ((s acting on t) acting on u)⊗x.',['pullbackTripleInnerIso_hom','mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange_tmul'],'Apply native baseChange_tmul and cancellation on the actual threefold tensor.'),
('pullbackTriple_coherence_hom','Three-step natural-transformation coherence','The forward natural transformations of the actual outer-first and inner-first comparisons are equal. Their targets agree via the existing actual calculus towerComp associativity; equality includes arbitrary components and horizontal arrows.',['pullbackTripleOuterIso_hom','pullbackTripleInnerIso_hom','affinePullback_cancel_assoc','TwoForms.Morphism.towerComp_assoc'],'Use natural-transformation extensionality and horizontal-arrow subtype extensionality; apply the inherited module cancellation associativity equation in the required direction.'),
('pullbackTriple_coherence_inv','Three-step inverse coherence','The inverse natural transformations of the actual outer-first and inner-first comparisons are equal between the same actual direct and three-step functors.',['pullbackTriple_coherence_hom','mathlib:CategoryTheory.Iso.inv_eq_inv'],'Use the native equivalence of inverse equality and forward equality for the two actual natural isomorphisms.'),
('pullbackTriple_coherence','Equality of the two natural isomorphisms','The actual outer-first and inner-first natural isomorphisms are equal, including both directions and all naturality data, with the same source and definitionally associated direct calculus target.',['pullbackTriple_coherence_hom','pullbackTriple_coherence_inv'],'Apply native isomorphism extensionality to the actual forward natural-transformation equality.')]
# The inherited module equation is a namespace-level declaration, never a new plan.
specs=[(n,t,s,['affinePullback_cancel_assoc'if x=='AffineCategory.affinePullback_cancel_assoc'else x for x in ds],pf)for n,t,s,ds,pf in specs]
construct={'pullbackParameterChangeIso','pullbackTriple','pullbackTripleOuterIso','pullbackTripleInnerIso'}
apis={n:[n+q for q in qs]for n,qs in [('pullbackParameterChangeIso',['_hom','_inv','_naturality']),('pullbackTriple',['_operator','_map','_map_tmul']),('pullbackTripleOuterIso',['_hom','_naturality','_tmul']),('pullbackTripleInnerIso',['_hom','_naturality','_tmul'])]}
ti=[('parameter_values','computation','Both directions of parameter-change/pullback comparison fix every element of S⊗R X.'),('parameter_roundtrip','compatibility','The inverse component after the forward component fixes every element, including non-pure tensors.'),('parameter_nonconstant','computation','Over Z[x], with λ=x+0 transported to x and d₀x=1, the actual forward comparison on the pulled unit fixes 1⊗x.'),('triple_generators','computation','Both actual comparison routes send arbitrary u⊗(t⊗(s⊗x)) to their stated scalar-tower products times x; the values agree.'),('triple_operator','compatibility','On an arbitrary threefold tensor element, the actual triple object has exactly the three successive affinePullback additive operators.'),('triple_arrows','computation','The actual triple functor sends every horizontal f on arbitrary threefold elementary tensors to the nested tensor with f(x).'),('outer_inverse','compatibility','The actual outer comparison inverse after its forward component fixes every element of the triple-pullback object.'),('inner_inverse','compatibility','The actual inner comparison inverse after its forward component fixes every element of the triple-pullback object.'),('naturality','compatibility','Both actual comparisons satisfy naturality for arbitrary horizontal f, without identity-calculus assumptions.'),('coherence','compatibility','The actual forward transformations, inverse transformations and natural isomorphisms all agree.'),('nonreduced','computation','Over Z/4 with zero calculus, both actual triple comparisons carry 1⊗(1⊗(1⊗2)) to the same value whose native lid is2, nonzero and square-zero.'),('zero_ring','degenerate','Over Z/1 with zero calculus, the actual triple comparison sends the zero elementary tensor to zero and the two natural isomorphisms agree.')]
tr={'pullbackParameterChangeIso':['parameter_values','parameter_roundtrip','parameter_nonconstant'],'pullbackTriple':['triple_generators','triple_operator','triple_arrows'],'pullbackTripleOuterIso':['triple_generators','outer_inverse','naturality','coherence','nonreduced','zero_ring'],'pullbackTripleInnerIso':['triple_generators','inner_inverse','naturality','coherence','nonreduced','zero_ring']}
ids={n:RID+':H.0/affine-triple-'+re.sub(r'(?<!^)(?=[A-Z])','-',n.removeprefix('pullback')).replace('_','-').lower()for n,*_ in specs}
sid='Stacks-affine-categorical-triple-07J5-codex-rtOQ9t'
hyp=['Commutative k,R,S,T,U and module carriers in the common native module universe; independent form-module universes. Algebra structures and IsScalarTower R S T, S T U, R S U, R T U are explicit. Degree-one form modules retain their k actions and scalar towers. Calculus morphisms lie over the actual algebra maps. Parameter equalities are explicit.','Arbitrary modules and λ, including d₀λ≠0; no flatness, injectivity, finite generation, projectivity, basis, integrability or reducedness assumption. The reserved global finite locally free integrable key retains relatively constant λ and genuine sheaf interfaces.']
new=[]
for n,title,stmt,deps,proof in specs:
 new.append(dict(id=ids[n],parentStageId=RID+':H.0',realises=[RID+':H.0'],kind='construction'if n in construct else'lemma',title=title,declaration='AffineCategory.'+n,statement=stmt,hypotheses=hyp,prerequisites=[x if ':'in x else ids[x]if x in ids else existing[x]for x in deps],proofSteps=[proof],acceptance=[stmt,'Retain actual native modules, additive operators, horizontal categorical arrows and parameter transports; no source-curvature reflection, sheaf descent or source-closure conclusion.'],library=dict(module='TauCeti/Geometry/Hodge/Higgs/ParameterConnection',namespace=NS),sources=[dict(sourceId=sid,locator='Section60.15 ordinary connection convention; authored actual categorical triple comparison',excerpt='connection',match='Context only. The categorical comparison is an authored deduction from inherited actual affine maps and pinned native category/scalar-extension APIs.')],implementationStatus='unchecked'))
by={n['declaration'].split('.')[-1]:n for n in new};tests={n:dict(name='AffineTripleTests.'+n,kind=k,statement=t)for n,k,t in ti}
for n in construct:
 by[n]['api']=[dict(name='AffineCategory.'+a,role='compatibility',statement=by[a]['statement'])for a in apis[n]]
 by[n]['tests']=[tests[t]for t in tr[n]]
 by[n]['uses']=[dict(where=ids['pullbackTriple_coherence'],how='Compare the two actual categorical three-step paths before universal exterior-power/dual comparisons and global restriction/descent; no module-only substitute for the natural transformations.')]
p['nodes']+=new
base=[];reads=[];idx=list(csv.reader(Path(sys.argv[1]).read_text().splitlines(),delimiter='\t'))
for n in ['CategoryTheory.Iso.inv_eq_inv']:
 assert 'mathlib:'+n not in {x['ref']for x in old['baseline']['declarations']}
 row=next(x for x in idx if x[0]=='mathlib'and x[1]==n)
 base.append(dict(ref='mathlib:'+n,kind=row[2],module=row[3],line=int(row[4]),provides='Equality of inverse arrows of two actual isomorphisms is equivalent to equality of their forward arrows.',checked='Codex — codex-rtOQ9t read the complete pinned statement/proof, Iso.lean190–207, at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on2026-10-04.'))
 reads.append(dict(name=n,file=row[3],line=int(row[4]),statementLead=row[5]))
p['baseline']['declarations']+=base;save('BaselineReading.json',reads)
src=load('SourceReading.json')[0]
p['sources'].append(dict(id=sid,title='Ordinary connections and authored categorical triple pullback coherence',authors='The Stacks Project authors; deductions by Codex — codex-rtOQ9t',edition='Displayed Section60.15 read4October2026',url=src['url'],sha256=src['sha256'],accessed=src['accessedUTC'],readSections=[src['scope']]))
frontier='The actual three-step affine pullback functor now has outer-first and inner-first natural-isomorphism comparisons to direct pullback. Their forward transformations, inverse transformations and natural isomorphisms agree. A concrete parameterChange/pullback natural isomorphism retains the equality transport through the third pullback; both its underlying maps are identities. Triple operators/maps and both generator formulas are explicit, with arbitrary-horizontal-arrow naturality. Arbitrary modules and λ, including d₀λ≠0, require no flatness or injectivity. Monoidal packaging of these new three-step comparison paths, universal exterior-power and finite-projective dual comparisons, and genuine E1 sheaf tensor/restriction/equality detection/effective gluing remain open. The reserved global finite locally free integrable key retains relatively constant λ. All 149 routes,35 omissions,five requests,eleven gaps,six planets, determinant/Tate/period and arbitrary-Q tensor-valued-shuffle obligations remain. H.0 stays partial and H.1–H.8 not_read; earlier frontier prose is checkpoint history.'
ar=sum(len(n.get('api',[]))for n in new);dr=len({x['name']for n in new for x in n.get('api',[])});tt=sum(len(n.get('tests',[]))for n in new)
p['summary']+=f' Categorical triple pullback continuation:{len(new)} nodes(4 constructions, 15 lemmas),{ar} API references,{tt} test references to 12 distinct typed examples.'
p['coverage'][0]['remaining'].append(frontier);road['stages'][0]['description']+=' '+frontier
p['verification']=dict(previousCheckpoint=old['verification'],worker='Codex — codex-rtOQ9t',date='2026-10-04',issue=3371,mathematicalBase=(S/'base.txt').read_text().strip(),compilation={n.lower():load(n+'.receipt.json')for n in ['Native','Canonical']},newNodes=len(new),newAPIReferences=ar,newDistinctAPI=dr,newTestReferences=tt,newDistinctTests=12,implementation='unchecked; actual affine proof artifacts only; global sheaf and source closure remain open',publicReplay='Actual public recovery and both immutable verifier reports required before submission.')
plan=dict(newNames=[n['declaration']for n in new],newNodes=[n['id']for n in new],apiAdditions={},testAdditions={},newBaseline=base,newBaselineRefs=[x['ref']for x in base],frontier=frontier,apiReferences=ar,distinctAPI=dr,testReferences=tt,distinctTests=12)
for n,x in [('Candidate.json',p),(RID+'.json',p),('Candidate-roadmap.json',road),('NewNodes.json',new),('Plan.json',plan)]:save(n,x)
intro='# Categorical three-step pullback coherence\n\nThe actual three-step affine pullback now has two natural-isomorphism comparisons to direct pullback. The outer-first path compares the last two pullbacks and then the first. The inner-first path moves the intermediate parameter equality through the final pullback, compares the first two pullbacks, and then the last. Their forward and inverse natural transformations, and therefore the natural isomorphisms, agree. Both are assembled from the actual existing two-step comparisons; the underlying module associativity equation proves their equality after horizontal-arrow extensionality.\n\nAll parameter transports are explicit. The new parameterChange/pullback comparison uses the two actual horizontal identity maps on the scalar-extension module, with horizontality proved by eliminating the parameter equality. Triple operators, horizontal-arrow maps, generator values, arbitrary-arrow naturality and inverse roundtrips use the actual category. Rings and module carriers share the native universe; form modules retain independent universes. Arbitrary modules and λ, including d₀λ≠0, require no flatness, injectivity, basis, integrability or reducedness.\n\n'+frontier+' Every implementation remains unchecked.\n\n## Declarations and tests\n\n'
parts=[intro]
for n in new:
 parts.append('### '+n['title']+'\n\n`'+n['declaration']+'` — '+n['statement']+'\n\nProof plan: '+' '.join(n['proofSteps'])+'\n\n')
 for field in ['api','tests']:
  if n.get(field):parts.append(field.upper()+':\n\n'+''.join('- `'+x['name']+'`: '+x['statement']+'\n'for x in n[field])+'\n')
parts.append('## Earlier checkpoint reader (preserved verbatim)\n\n');a=''.join(parts)
(S/'ReaderAddition.md').write_text(a);(S/'Reader.md').write_text(a+(S/'IncomingReader.md').read_text())
print(json.dumps(dict(nodes=len(p['nodes']),baseline=len(p['baseline']['declarations']),newNodes=len(new),APIReferences=ar,distinctAPI=dr,testReferences=tt,distinctTests=12)))
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
"""Render scoped mathematical checkpoint, original reading provenance and actual receipts."""
from pathlib import Path
import hashlib,json,re
S=Path(__file__).resolve().parent
t=lambda n:(S/n).read_text()
j=lambda n:json.loads(t(n))
sha=lambda b:hashlib.sha256(b).hexdigest()
p=j('Candidate.json');old=j('Incoming.json');plan=j('Plan.json');g=j('Graph.json');c=j('ClaimReceipt.json')
def compile_line(n):
 r=j(n+'.receipt.json');b=(S/(n+'.lean')).read_bytes();assert r['exitStatus']==0
 return f"- {n}.lean: {len(b.splitlines())} lines, {len(re.findall(r'^example\b',b.decode(),re.M))} examples, exit0, {r['warnings']} warnings, {r['axiomAudits']} axiom audits; {r['availableGiBBefore']}GiB available before compilation, {r['elapsedSeconds']} seconds, peak {r['maxRssKiB']} KiB. Source SHA256 `{sha(b)}`; diagnostic SHA256 `{r['logSha256']}`.\n"
h=f'''# Categorical three-step affine pullback coherence — checkpoint

Codex — codex-rtOQ9t. Refs #3371. Partial; every implementation remains unchecked.

The actual three-step pullback functor is the composite of three existing affine pullbacks and explicit parameterChange from the nested algebra-map image of λ to its R→U image. Its operator is the actual three successive affinePullback operators, and its arrow map is the actual three successive native base changes. Two natural isomorphisms compare this functor with direct pullback. The outer-first path applies the existing p/n tower comparison at the first pulled object, transports its parameter, and then applies the existing (p∘n)/m comparison. The inner-first path first moves the R/S/T parameter equality through pullback(p), then applies pullback(p) to the existing n/m comparison, and finally the p/(n∘m) comparison with the final parameter transport.

The parameterChange/pullback comparison is an actual natural isomorphism on the scalar-extension module with identity underlying maps. Its horizontality proof eliminates the given parameter equality; it cannot be replaced by an informal identification of the two parameter values. Both triple comparisons are assembled from the existing actual tower isomorphisms. Their underlying U-linear maps are respectively cancel(R,S,U) after cancel(S,T,U), and cancel(R,T,U) after U-base change of cancel(R,S,T). Native cancellation associativity proves equality of their forward natural transformations after natural-transformation and horizontal-arrow extensionality. The inverse transformations and the actual natural isomorphisms consequently agree. Naturality is for arbitrary horizontal arrows and arbitrary compatible calculus maps.

Commutative k,R,S,T,U and native module carriers share the native module universe; degree-one/two form modules retain independent universes. All required algebra structures and scalar towers are explicit. Modules and λ are arbitrary, including d₀λ≠0. No flatness, injectivity, finite generation, projectivity, basis, integrability or reducedness is assumed. This raw affine category does not close the reserved global finite locally free integrable ringed-site key, whose relatively constant parameter and genuine sheaf interfaces remain required.

All {len(old['nodes'])} incoming declaration objects and{len(old['baseline']['declarations'])} baseline objects remain whole. This continuation adds 19 nodes:4 constructions, 15 lemmas, {plan['apiReferences']} API references to {plan['distinctAPI']} declarations, and{plan['testReferences']} test references to 12 distinct typed examples. Each construction has at least 3 API items and 3 relevant tests. Tests evaluate the parameter comparison and inverse roundtrip on arbitrary tensors, a polynomial parameter x with derivative 1, actual triple operators and arrow maps, both comparison formulas on arbitrary scalars, both inverse roundtrips on arbitrary elements, arbitrary-arrow naturality, and full forward/inverse/isomorphism coherence. Over Z/4 they retain the nonzero square-zero value 2 through both actual triple maps; over ℤ/1 they test the zero tensor and actual categorical equality.

Monoidal packaging of these new triple comparison paths, universal exterior-power and finite-projective dual comparisons, and actual E1 sheaf tensor/restriction/equality detection/effective gluing remain open. The existing monoidal identity/two-step comparisons and braided pullback are preserved. All 149 routed obligations,35 omissions,five requests,eleven whole gaps,six planets, determinant/Tate/period and arbitrary-Q tensor-valued-shuffle obligations are preserved. H.0 stays partial; H.1–H.8 stay not_read. Prior frontier paragraphs remain attributed checkpoint history. The source issue and version envelope are unchanged.

## Reading and incoming evidence

The entire {c['characters']}-character issue was read before claim {c['claim']} and after exact numeric bot confirmation {c['bot']}; bodies were byte-equal. ClaimReceipt.json binds both complete read intervals and the body hash. The whole reserved key, all five requests and whole H.0 coverage were freshly read. Current stage frontier and relevant gap/coherence fields were consumed in bounded displays; earlier gap scopes reuse only unchanged authenticated own receipts. All four complete reviewed parent Hodge audit objects and metadata were freshly read; no PartII audit row exists. The pure/mixed Hodge parent is not replanned. No fresh full 474-node or historical reader audit is asserted.

Incoming peer PR #6062 at immutable head 56c0eece583061466e6c5af87153ca96e72c2584 was actually recovered by public HTTP from archive b239659bb7c5d05fbe545baeab78d877644f0033. All63 artifacts,10 helpers and 5 public deliverables authenticated against manifest a457bc844e43bbdbcbe384ca2951ead0954d408c334363938a349261e9f26a79. Both actual recovered mathematical and publication verifiers reproduced their original reports byte-for-byte. The current handoff first 12000 characters, complete 19 new proofs, 11 tests and all 10 helpers were freshly read. NativePrefix ranges3140–3235,3730–3875 and2650–2775 cover the actual category comparison, parameter/tower functors and module associativity. The full 4778-line native and 6586-line canonical prefixes are authenticated and preserved in order, with a harmless new import-context comment inserted and this continuation appended. This is compiled prefix reuse, not a manual audit of every inherited line.

Own PR #6059 was separately authenticated again over public HTTP, including all 60 artifacts, 10 helpers and 5 files, manifest 1409fad87dc87ba6dba7c6f04305c8a1821078fa6d4fa30b3a17913050ddf3d0 and the original Reading/InputGuard receipts. Its original own #6046,#6032 and #6001 reading scopes are retained with their authenticated manifests. All original reading receipts were personally read whole here. 42 guarded controls have 37 unchanged external files and 5 advanced job deliverables. Only original scopes are reused for unchanged files; no peer reading is relabelled as this worker's. WORKERS was read whole here; the whole 930-line PROTOCOL was freshly read earlier in this continuous loop, with330–458 refreshed here. Exact source-range hashes, bounded absence searches, claim and audited scopes are in Reading.json. No exhaustive absence claim is made; native category/monoidal/whiskering and scalar-extension APIs are reused.

The complete displayed Stacks07J5 Section60.15 definitions, Lemma60.15.1 proof and both public comments were freshly read. SourceReading.json binds actual HTTP bytes, hash and retrieval time. Ordinary connection conventions supply context only. The categorical triple comparison is an authored deduction from inherited actual affine constructions and pinned native Mathlib APIs. No full-paper/PDF, historical-version, recursive citation closure, crystal equivalence or new erratum claim is made; the inherited issue/version envelope remains whole.

## Validation

The entire suggested file is Mathlib-only and compiled at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 with Lean 4.34.0-rc2, compiler 6a10ac8c22beadecabdbb0919c2b50214762f91d. The runner checks the exact Mathlib/compiler/compiled dependency pins and tracked cleanliness, fresh available memory≥20GiB, one thread,8192MiB managed-memory limit and 1200-second timeout. Each compilation finished before another compiler or Lean-file edit started. The disposable Context object accelerated prototypes only; the final Native run elaborates the entire source. No Lake setup, library build, download or language server was started.

'''+compile_line('Native')+compile_line('Canonical')+f'''
All 276 native axiom audits use only propext,Classical.choice and Quot.sound; no warning, error, admission or sorryAx occurs. The whole Canonical file has 824 admission warnings only. All 19 declaration and 12 typed-example headers match the admitted projection. The 4 constructions remain concrete ; 15 lemma and 12 example proofs are admitted only in the planning projection. Suggested.lean and the whole compiled Canonical.lean are byte-equal, SHA256 `{sha((S/'Canonical.lean').read_bytes())}`. These are affine proof artifacts; global sheaf and source closure remain open.

The actual indexed checker, immutable intake/file rules, source issue/version checks and atlas assembler pass without errors or warnings. Packet:{len(p['nodes'])} nodes,{len(p['baseline']['declarations'])} baseline declarations,{sum(len(n.get('api',[]))for n in p['nodes'])} raw API references,{sum(len(n.get('tests',[]))for n in p['nodes'])} raw test references. Publication stage DAG {g['stageDAG']['vertices']}/{g['stageDAG']['edges']}, own declaration DAG {g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']}, scoped DAG {g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']} vertices/edges are acyclic. All {g['requiredPairs']} required supplier pairs are reachable, with no own skipped or pending link. Every foreign roadmap/stage/stage-edge object matches the immutable control.

Mathematical base `{t('base.txt').strip()}`; publication base `{t('publication-base.txt').strip()}`. All 42 guards and the issue's mathematical contract agree between bases. Index SHA256 86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Both verifier reports execute actual immutable checker/intake/atlas code without Lean or a repository snapshot. Final actual public recovery and both recovered verifier outputs must authenticate byte-for-byte before submission.

## Resume

Use the actual parameterChange/pullback comparison and both triple natural isomorphisms with their proved forward/inverse coherence. Continue their monoidal packaging using the existing actual monoidal two-step comparisons and native whiskering; then universal exterior-power and finite-projective dual comparisons and genuine E1 sheaf tensor/restriction/equality detection/effective gluing. Preserve all 149 routes,35 omissions,five requests,eleven gaps and later-stage/source obligations. The reserved global key remains open.

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
assert len(old['nodes'])==474 and len(p['nodes'])==493
assert p['nodes'][474:]==data('NewNodes.json')and set(p)==set(old)
for before,after in zip(old['nodes'],p['nodes']):
 expected=json.loads(json.dumps(before));nid=before['id']
 if nid in plan['apiAdditions']:expected['api']+=plan['apiAdditions'][nid]
 if nid in plan['testAdditions']:expected['tests']+=plan['testAdditions'][nid]
 assert after==expected,nid
assert sum(a==b for a,b in zip(old['nodes'],p['nodes']))==474
for k in old:
 if k not in ['nodes','summary','sources','coverage','gaps','verification','baseline']:assert p[k]==old[k],k
assert p['baseline']['declarations']==old['baseline']['declarations']+plan['newBaseline']
assert {k:v for k,v in p['baseline'].items()if k!='declarations'}=={k:v for k,v in old['baseline'].items()if k!='declarations'}
assert [x['ref']for x in p['baseline']['declarations'][255:]]==plan['newBaselineRefs']
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
assert incoming['head']=='56c0eece583061466e6c5af87153ca96e72c2584'and incoming['artifactsVerified']==63 and incoming['archivedHelpersVerified']==10
assert sha((S/'IncomingManifest.json').read_bytes())=='a457bc844e43bbdbcbe384ca2951ead0954d408c334363938a349261e9f26a79'
assert (S/'PreviousVerification.json').read_bytes()==(S/'IncomingPublicationVerification-replayed.json').read_bytes()
for name,prefix in [('Native.lean','NativePrefix.lean'),('Canonical.lean','CanonicalPrefix.lean')]:assert im[name]['sha256']==sha((S/prefix).read_bytes())
for path,n in zip(paths,['Incoming-roadmap.json','Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert sha((S/n).read_bytes())==incoming['publicDeliverables'][path]
assert text('Incoming.lean')==text('CanonicalPrefix.lean')
own=data('OwnReadingReuse.json');assert len(own)==42 and sum(g['unchanged']for g in own)==37
om=data('OwnPreviousManifest.json')
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='1409fad87dc87ba6dba7c6f04305c8a1821078fa6d4fa30b3a17913050ddf3d0'
for n,orig in [('OwnPreviousReading.json','Reading.json'),('OwnPreviousInputGuard.json','InputGuard.json'),('OwnInheritedReading.json','PriorOwnReading.json'),('OwnInheritedInputGuard.json','OwnPreviousInputGuard.json'),('OwnInheritedManifest.json','OwnPreviousManifest.json')]:assert sha((S/n).read_bytes())==om[orig]['sha256']
imown=data('OwnInheritedManifest.json')
assert sha((S/'OwnInheritedManifest.json').read_bytes())=='afbe2a464ecde9d86cb9f11893e3adecb9d5fcb9247078d52531f5f5bb1a4c3d'
for n,orig in [('OwnInheritedReading.json','Reading.json'),('OwnInheritedInputGuard.json','InputGuard.json')]:assert sha((S/n).read_bytes())==imown[orig]['sha256']
assert [{'path':g['path'],'sha256':g['previousSha256']}for g in own]==data('OwnPreviousInputGuard.json')
for g in own:
 assert sha(blob(MATH,g['path']))==g['currentSha256']
 assert g['unchanged']==(g['previousSha256']==g['currentSha256'])
assert (S/'PreviousMathematicalVerification.json').read_bytes()==(S/'IncomingMathematicalVerification-replayed.json').read_bytes()
claim=data('ClaimReceipt.json');assert claim['claim']==5978697772 and claim['bot']==5978698997 and claim['beforeAfterEqual']
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
assert {**nh,**nt}==ch and len(nh)==19 and len(nt)==12
assert set(plan['newNames'])==set(nh)=={n['declaration']for n in p['nodes'][474:]}
new=p['nodes'][474:]
assert {t['name']for n in new for t in n.get('tests',[])}==set(re.findall(r'^-- test: (.+)$',text('NewTests.lean'),re.M))
assert sum(len(n.get('api',[]))for n in new)==12 and len({x['name']for n in new for x in n.get('api',[])})==12
assert sum(len(n.get('tests',[]))for n in new)==18
for n in new:
 assert n['declaration']in text('Reader.md')and n['statement']in text('Reader.md')
 if n['kind']in ['definition','construction']:
  assert len(n['api'])>=3 and len(n['tests'])>=3 and n['uses']
 for k in ['api','tests']:
  for x in n.get(k,[]):assert x['name']in text('Reader.md')and x['statement']in text('Reader.md')
assert text('Audits.lean')=='\n'.join('#print axioms TauCeti.Hodge.ParameterConnection.Intrinsic.'+n for n in plan['newNames'])+'\n'
for name,warnings,examples,audits in [('Native.lean',0,145,276),('Canonical.lean',824,342,0)]:
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
print(json.dumps(dict(checker=summary,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,wholeIncomingNodesUnchanged=474,preservedMathematicalContracts=474,newNodes=19,newAPIReferences=12,newDistinctAPI=12,newTestReferences=18,newDistinctTests=12,matchedNewHeaders=len(ch),rawAPIItems=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),compilation=p['verification']['compilation'],inputGuards=len(data('InputGuard.json')),indexSha256=sha(Path(sys.argv[2]).read_bytes()),mathematicalBase=MATH,immutableBase=BASE,graph=graph,fullCanonicalCompiled=True,sourceScope='Bounded current Stacks07J5 reading; whole inherited source/version envelope retained with prior attribution; no fresh complete-paper or erratum collation.',LeanExecuted=False),indent=2))
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
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED AFFINE CATEGORICAL TRIPLE PAYLOAD\n'+pb+b'END ARCHIVED AFFINE CATEGORICAL TRIPLE PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('roadmaps','Candidate-roadmap.json'),('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated affine categorical triple comparison evidence; never executes Lean."""
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
pb=raw.split('/- BEGIN ARCHIVED AFFINE CATEGORICAL TRIPLE PAYLOAD\\n',1)[1].split('END ARCHIVED AFFINE CATEGORICAL TRIPLE PAYLOAD -/',1)[0].encode()
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
