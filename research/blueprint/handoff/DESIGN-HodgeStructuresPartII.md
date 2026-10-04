# Actual categorical affine pullback towers — checkpoint

Codex — codex-7e92bd. Refs #3371. Partial; every implementation remains unchecked.

This checkpoint adds14 declaration nodes: three constructions and11 lemmas. The iterated functor is the actual composition of the existing pullback along m:R→S, pullback along n:S→T, and parameter equality transport from g(f(λ)) to h(λ). Equality transport keeps the same native module, additive operator and horizontal linear maps; only the Leibniz proof is rewritten. Its reflexivity and composition laws hold as actual functor equalities.

Native cancelBaseChange becomes the forward component of a natural isomorphism from that composed functor to direct pullback. Its inverse is the native tensor inverse and both directions are horizontal by the inherited affine tower proof and isoMk. Naturality reuses native LinearMap.baseChange_baseChange and inverse cancellation. It holds for every actual horizontal arrow. The corresponding two target connections have equivalent zero-curvature conditions; no source-curvature reflection follows. Common-universe native module carriers and the supplied scalar towers on forms are explicit. Arbitrary modules and arbitrary λ, including d₀λ≠0, are allowed without flatness, injectivity, basis or finite-generation assumptions.

All421 incoming nodes and242 baseline objects remain whole. Each new construction has at least three consumed APIs and three relevant tests:11 API references to11 distinct lemmas and9 test references to6 distinct typed examples. The examples preserve an arbitrary operator through inverse parameter transports, retain the derivative term for parameter x+0=x over Z[x], evaluate both naturality composites on double elementary tensors, evaluate the actual inverse and its forward roundtrip, extend a constructed horizontal zero arrow through the whole composed functor, and preserve the nonzero nilpotent coordinate2 over Z/4 with a nonzero scalar Higgs operator.

Strong monoidal scalar-extension packaging and categorical three-step/monoidal coherence remain open. So do universal exterior-power and finite-projective dual comparisons, genuine E1 sheaf tensor/restriction/equality detection/effective gluing, determinant/Tate/period adapters and arbitrary-Q tensor-valued shuffle. The reserved finite locally free integrable ringed-site key retains its relatively constant parameter requirement and is not this raw affine category. All149 routed obligations,35 omissions,five supplier requests,eleven whole gaps,six planets and the source issue/version envelope remain unchanged. H.0 stays partial; H.1–H.8 stay not_read. Earlier frontier prose is checkpoint history.

## Reading and incoming evidence

The whole22198-character issue was read before claim5977175108. Bot5977179819 confirmed that exact numeric claim; the whole unchanged body was then read again in two complete slices. ClaimReceipt.json binds its exact hash. Current reserved key, allfive supplier need texts, gap0 history and H.0 frontier were read. The incoming6046 handoff narrative/recovery, all30 new native declarations and8 tests, actual recovered verifier/helpers and consumed affine category/iso/curvature/pullback/tower-horizontal source blocks were read. No fresh whole421-node or full historical-reader audit is asserted.

Peer PR6046 at head7ca61195b2374a85530aee2bdb1143f5c227c29c, merged158fbe76f1196f015e2c59b7d85f65f6ca5a427b, was publicly recovered from archive7fb880e9dd6a9dd1f883536f7e2f152807e1fc0e. All60 artifacts,10 helpers and5 public files authenticated. Executing its actual recovered verifier from a repository checkout reproduced its Verification.json byte-for-byte. Incoming manifest SHA256afbe2a464ecde9d86cb9f11893e3adecb9d5fcb9247078d52531f5f5bb1a4c3d. Entire native and canonical prefixes are manifest-bound. Assembly preserves all prefix bytes in order, inserts an empty import separator, and appends the new proofs/tests or their admitted planning projection.

Own PR6041 reading is reused at its original recorded scope, authenticated by manifest3ecd87ad0a26b7cfee1ddd31913f5103047e13b2401e060343c9ec8894bf65e9. OwnReadingReuse.json compares all42 controls:37 external files are unchanged, while the five own deliverables changed. Governing protocols, parent readers, ownership/key/supplier and source-route readings retain their exact prior scope. WORKERS was freshly reread. Four parent Hodge reviewed verdict/target/duplicate projections were freshly read; no dedicated PartII audit row exists. No peer reading is relabelled as this worker's own. Reading.json records exact pinned native source ranges for functor composition, natural isomorphism construction, scalar-tower equality, cancelBaseChange and iterated baseChange. A bounded search found no matching specialized affine export in either pinned tree; this is not an exhaustive absence claim.

The complete currently displayed Stacks Section60.15, Lemma60.15.1 proof and both comments were read at https://stacks.math.columbia.edu/tag/07J5. SourceReading.json records exact HTTP bytes/hash/time. Only ordinary additive connection conventions are drawn from that page; the categorical tower construction is an authored deduction. No crystal theorem, full-paper/PDF reading, recursive citation closure or new erratum claim is made. The inherited source issue/version envelope is preserved verbatim with attribution.

## Validation

The whole suggested file imports only individual Mathlib modules and compiles at082e2d37e8b0463410cdb532e111cd43d5a66174 with Lean4.34.0-rc2, commit6a10ac8c22beadecabdbb0919c2b50214762f91d. Existing exact source heads and tracked cleanliness were rechecked for both Mathlib and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Both elaborations used the existing Mathlib build serially, each with a fresh memory guard, one thread,8192MiB managed limit and1200-second timeout. No library build, Lake setup/cache download or language server was started. Every compiler process finished.

- Native.lean: 3979 lines, 116 examples, exit0, 0 warnings, 218 axiom audits; 53GiB available, 56.19 seconds and peak3831172KiB. Source SHA256 `46292e1e944fc1614265695335a71f60cbf8ddd62c1b0102cec9ab42ca3268fa`; diagnostic SHA256 `d52d590861a851c8d25771d042762dc9fd9c7b95390e86f44cb8b5d2ea93e8db`.
- Canonical.lean: 5994 lines, 313 examples, exit0, 748 warnings, 0 axiom audits; 53GiB available, 35.28 seconds and peak3465352KiB. Source SHA256 `ce1e3370de2131827ce2dbbc7f0b4b6839aa3bf218900357a4a7d455916660c6`; diagnostic SHA256 `4ee591c6fdaf0f7ad61f2fe5ebc22a925d52aa87b3be8132c5894a72287701b0`.

All218 native declaration axiom closures use only propext,Classical.choice and Quot.sound. The whole Native.lean has no admissions and compiled without warnings or errors. The entire Canonical.lean has748 admission warnings only. All14 new declaration headers and6 typed-example headers match their planning projection exactly. Three data definitions remain concrete, including proof fields; only11 lemma and6 example proofs are admitted in the new suggested slice. Existing admitted dependencies remain admitted in the preserved canonical prefix. Suggested.lean equals the entire compiled Canonical.lean, SHA256 `ce1e3370de2131827ce2dbbc7f0b4b6839aa3bf218900357a4a7d455916660c6`. These certificates concern the actual affine constructions, not global sheaf/source closure.

The indexed packet checker, actual immutable intake/file rules and source issue/version checks pass without errors or warnings. The packet has435 nodes,244 baseline declarations,438 raw API entries and403 raw test references. Publication stage DAG3022/8663, own declaration DAG435/844 and scoped DAG3452/9986 vertices/edges are acyclic. All21 required supplier pairs are reachable. No owned skipped/pending links exist. Every foreign roadmap/stage and stage-edge object matches the immutable control.

Mathematical base `2c64c585720332d602b66574a97cc5ce9e2361a6`; publication base `130fed55d6203cf67fdc0e1f9c0d68f401a66131`. All42 guarded inputs and the issue's mathematical contract are unchanged between bases. Declaration-index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Both verifier reports are actual immutable executions of the checker/intake/atlas assembler; verification itself does not run Lean or create a repository snapshot. Exact helper fences and actual public HTTP recovery plus both replay reports are checked before PR submission.

## Resume

Use the actual parameterChange, pullbackTower and pullbackTowerIso, together with the previous symmetric monoidal AffineCategory. Package scalar-extension tensor/unit comparisons as a native strong monoidal pullback functor. Verify categorical three-step and monoidal coherence for the actual tower natural isomorphisms, retaining explicit parameter equalities and comparison directions. Then continue universal exterior-power and finite-projective dual comparisons and genuine E1 sheaf tensor/restriction/equality detection/effective gluing before closing the global key. Preserve all149 source routes,35 omissions,five requests,eleven gaps and later obligations. No implementation or source/supplier closure is marked complete.


## Public recovery and replay

Archive commit `9380692130d2ebb34af43e1f83760efb1cd9df18` is an ancestor changing only this issue's suggested file. Its 58 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `f6ca1705c035aea5f4bb6cb2c6a35b915010f49edfff3463b1c07f0161c854df`; payload SHA256 `2aeb4d5d16d4d38bf1dac9dd17ed520d97f3e4b6cbe84ddc1fece8a64bf87c9f`. The final suggested file has no archive payload and equals the entire compiled Mathlib-only Canonical.lean.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set HODGE_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Canonical.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean and Suggested.lean are byte-equal and the whole file was compiled. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

```python
"""Recover public authenticated affine categorical tower evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='HodgeStructuresPartII'
ARCHIVE='9380692130d2ebb34af43e1f83760efb1cd9df18'
MANIFEST_SHA='f6ca1705c035aea5f4bb6cb2c6a35b915010f49edfff3463b1c07f0161c854df'
PAYLOAD_SHA='2aeb4d5d16d4d38bf1dac9dd17ed520d97f3e4b6cbe84ddc1fece8a64bf87c9f'
EXPECTED={'roadmaps': '0a0d4697530c03449d303de2bb56fa12e567010287418588c4d6d7e16cbaffab', 'packets': 'b3cb90d8b00b2197c7479a67b15153130fe84a791d6ae80907548abfd530b891', 'readmes': '01f4541c528f9bc584bf1cdcf886cd20bed236822b4ccd15ec157f4e83699334', 'suggested': 'ce1e3370de2131827ce2dbbc7f0b4b6839aa3bf218900357a4a7d455916660c6'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED AFFINE CATEGORICAL TOWER PAYLOAD\n',1)[1].split('END ARCHIVED AFFINE CATEGORICAL TOWER PAYLOAD -/',1)[0].encode()
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
"""Append actual categorical tower data; preserve every inherited contract."""
from pathlib import Path
import copy,csv,json,re,sys
S=Path(__file__).resolve().parent;RID='HodgeStructuresPartII';P=RID+':H.0/';NS='TauCeti.Hodge.ParameterConnection.Intrinsic'
def load(n):return json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
old=load('Incoming.json');p=copy.deepcopy(old);road=load('Incoming-roadmap.json')
existing={n.get('declaration'):n['id']for n in old['nodes']}
specs=[
('parameterChange','Equality transport of the affine parameter','For an equality h:λ=μ in R, construct the functor AffineCategory Ω λ→AffineCategory Ω μ that keeps the actual native module, additive operator and horizontal linear map unchanged. Only the Leibniz parameter proof is rewritten.',['AffineCategory','AffineCategory.category'],'Keep the same data and rewrite h in the existing Leibniz equality; identities and composition are definitionally the same.'),
('parameterChange_operator','Equality transport retains the additive operator','For h:λ=μ and X, the additive map of parameterChange(h)(X) is exactly X.connection.toAddHom.',['parameterChange'],'Reduce the explicit data-preserving construction.'),
('parameterChange_map','Equality transport retains each horizontal map','For h:λ=μ and an actual horizontal f:X→Y, the native linear map of parameterChange(h).map(f) is f.val.',['parameterChange'],'Reduce the map field; its horizontal witness uses the unchanged operators.'),
('parameterChange_refl','Identity parameter transport as a functor','Transport along λ=λ is equal to the actual identity functor on AffineCategory Ω λ.',['parameterChange'],'Use definitional equality, including proof irrelevance for the Leibniz witness.'),
('parameterChange_trans','Composition of parameter transports','For h:λ=μ and j:μ=ν, parameterChange(h) followed by parameterChange(j) equals parameterChange(h.trans j) as actual functors.',['parameterChange','mathlib:CategoryTheory.Functor.comp'],'Both sides retain the same module, additive map and horizontal arrows; proof fields are irrelevant.'),
('pullbackTower','The actual composed affine pullback functor','For compatible calculus maps m:Ω_R→Γ_S and n:Γ_S→Δ_T over R→S→T, compose pullback(m), pullback(n), then parameterChange along g(f(λ))=h(λ). Its target is AffineCategory Δ (h(λ)) and its object module is T⊗_S(S⊗_R E).',['parameterChange','AffineCategory.pullback','mathlib:CategoryTheory.Functor.comp','mathlib:IsScalarTower.algebraMap_apply'],'Use the existing functors and the reversed native scalar-tower parameter equality. This is actual functor composition, not a new independently chosen operator.'),
('pullbackTower_operator','Operator of the composed functor','For every X, the additive operator of pullbackTower(n,m)(X) is exactly (X.connection.affinePullback(m)).affinePullback(n).toAddHom.',['pullbackTower'],'Reduce both pullback functors and data-preserving parameterChange.'),
('pullbackTower_map','Arrow of the composed functor','For horizontal f:X→X′, the linear map of pullbackTower(n,m).map(f) is exactly (f.val.baseChange S).baseChange T.',['pullbackTower'],'Reduce native functor composition; equality transport changes no linear map.'),
('pullbackTower_map_tmul','Composed pullback on double elementary tensors','For f:X→X′, t∈T,s∈S,x∈X, pullbackTower(n,m).map(f) sends t⊗(s⊗x) to t⊗(s⊗f(x)).',['pullbackTower'],'Reduce the two native baseChange maps.'),
('pullbackTowerIso','Natural isomorphism from iterated to direct pullback','Construct pullbackTower(n,m)≅pullback(n.towerComp m). Its forward component is native cancelBaseChange R S T T E, its inverse is the native inverse, and both are horizontal for the actual twice-pulled and direct operators. Verify naturality for every actual horizontal arrow.',['pullbackTower','TwoForms.Morphism.towerComp','AffineCategory.isoMk','Preconnection.affinePullback_tower_horizontal','mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange','mathlib:CategoryTheory.NatIso.ofComponents','mathlib:LinearMap.baseChange_baseChange'],'Apply isoMk to the existing tower-horizontal proof. The native baseChange_baseChange conjugation equation and inverse cancellation prove naturality; on t⊗(s⊗x) both composites are (s•t)⊗f(x). NatIso.ofComponents supplies the inverse naturality and inverse laws.'),
('pullbackTowerIso_hom','Forward component of the tower isomorphism','For every X, the native linear map of pullbackTowerIso(n,m).hom.app(X) is exactly cancelBaseChange R S T T X.module.',['pullbackTowerIso'],'Reduce NatIso.ofComponents and isoMk.'),
('pullbackTowerIso_inv','Inverse component of the tower isomorphism','For every X, the native linear map of pullbackTowerIso(n,m).inv.app(X) is the inverse of cancelBaseChange; it sends t⊗x to t⊗(1⊗x).',['pullbackTowerIso'],'Reduce the actual inverse component chosen by isoMk.'),
('pullbackTowerIso_naturality','Naturality as horizontal categorical arrows','For horizontal f:X→X′, pullbackTower(f) followed by comparison at X′ equals comparison at X followed by directPullback(f), as actual arrows in AffineCategory Δ h(λ).',['pullbackTowerIso'],'Project the naturality law of the constructed natural isomorphism.'),
('pullbackTowerIso_flat_iff','Flatness equivalence between the two target objects','For every X, the direct T-pullback has zero curvature at every element if and only if the composed T-pullback does. This compares two target objects and does not reflect zero curvature back to the source over R.',['pullbackTowerIso','AffineCategory.isoMk_flat_iff'],'Use isoMk_flat_iff with the actual native cancelBaseChange and established tower-horizontal witness.')]
ids={n:P+'categorical-tower-'+re.sub(r'(?<!^)(?=[A-Z])','-',n).lower().replace('_','-')for n,*_ in specs}
construct={'parameterChange','pullbackTower','pullbackTowerIso'};sid='Stacks-categorical-tower-07J5-codex-7e92bd'
hyp=['For parameter equality transport: commutative k→R, supplied TwoForms Ω, and an actual equality λ=μ. For tower statements: commutative R→S→T, compatible direct R→T algebra structure with IsScalarTower R S T, supplied k-algebra structures and calculus morphisms m,n. Degree-one forms retain the k/R, k/S and k/T scalar towers where horizontal inverses or curvature are used. Ring and native module carriers use the same chosen universe.','Arbitrary λ and arbitrary modules; no field, reducedness, injectivity, finite generation, projectivity, flat scalar extension, integrability or d₀λ=0 hypothesis. The global reserved finite locally free integrable ringed-site key remains separate and still requires relatively constant λ and actual sheaf calculus/restriction/gluing.']
new=[]
for n,title,stmt,deps,proof in specs:
 new.append(dict(id=ids[n],parentStageId=RID+':H.0',realises=[RID+':H.0'],kind='construction'if n in construct else'lemma',title=title,declaration='AffineCategory.'+n,statement=stmt,hypotheses=hyp,prerequisites=[d if ':'in d else ids[d]if d in ids else existing[d]for d in deps],proofSteps=[proof],acceptance=[stmt,'Use the existing actual native modules/operators and categorical composition. Preserve all global key, sheaf and source-closure obligations.'],library=dict(module='TauCeti/Geometry/Hodge/Higgs/ParameterConnection',namespace=NS),sources=[dict(sourceId=sid,locator='Section60.15 ordinary connection convention; authored affine categorical tower deduction',excerpt='connection',match='Context for the additive connection convention only. The specialized categorical tower natural isomorphism is an authored deduction from inherited horizontality and native tensor/category APIs; no crystal or sheaf theorem is attributed here.')],implementationStatus='unchecked'))
by={n['declaration'].split('.')[-1]:n for n in new}
apis={'parameterChange':['parameterChange_operator','parameterChange_map','parameterChange_refl','parameterChange_trans'],'pullbackTower':['pullbackTower_operator','pullbackTower_map','pullbackTower_map_tmul'],'pullbackTowerIso':['pullbackTowerIso_hom','pullbackTowerIso_inv','pullbackTowerIso_naturality','pullbackTowerIso_flat_iff']}
ti=[('parameter_roundtrip','compatibility','Transport an arbitrary actual operator along h and h.symm; the operator is retained at each element and the composed functor is the actual identity.'),('parameter_nonconstant','computation','Over Z[x], rewrite the parameter x+0 to x while d₀x=1. The actual transported unit operator at x has tensor coordinate x, preserving its nonconstant parameter and derivative term.'),('naturality_generator','compatibility','Evaluate both actual categorical naturality composites on t⊗(s⊗x) for arbitrary horizontal f. Both are (s•t)⊗f(x), fixing the scalar action and comparison direction.'),('inverse_generator','characterisation','The actual inverse natural component sends t⊗x to t⊗(1⊗x), and applying its forward component returns t⊗x.'),('zero_arrow','degenerate','Construct an actual horizontal zero arrow, extend it twice and rewrite its parameter. Both its twice-extended map and its composite with the actual comparison are zero.'),('nonreduced_operator','computation','Over Z/4 with a nonzero scalar Higgs operator, compare the actual double tensor1⊗(1⊗2) through the categorical tower isomorphism. Its final coordinate2 is nonzero with square zero, and the original operator on2 is nonzero.')]
tests={n:dict(name='AffineTowerTests.'+n,kind=k,statement=t)for n,k,t in ti}
tr={'parameterChange':['parameter_roundtrip','parameter_nonconstant','zero_arrow'],'pullbackTower':['naturality_generator','zero_arrow','nonreduced_operator'],'pullbackTowerIso':['naturality_generator','inverse_generator','nonreduced_operator']}
for n in construct:
 by[n]['api']=[dict(name='AffineCategory.'+a,role='compatibility',statement=by[a]['statement'])for a in apis[n]]
 by[n]['tests']=[tests[x]for x in tr[n]]
 by[n]['uses']=[dict(where=ids['pullbackTowerIso']if n!='pullbackTowerIso'else P+'intrinsic-pullback',how='Supply actual categorical iterated scalar extension for subsequent three-step and monoidal coherence. No sheaf tensor identification or global descent is supplied.')]
p['nodes']+=new
baseNames=['CategoryTheory.Functor.comp','LinearMap.baseChange_baseChange'];idx=list(csv.reader(Path(sys.argv[1]).read_text().splitlines(),delimiter='\t'));base=[];reads=[]
for n in baseNames:
 row=next(x for x in idx if x[0]=='mathlib'and x[1]==n)
 base.append(dict(ref='mathlib:'+n,kind=row[2],module=row[3],line=int(row[4]),provides=row[5]+' Compose the actual existing pullback and parameter-transport functors.',checked='Codex — codex-7e92bd read the actual declaration at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 on2026-10-04.'))
 reads.append(dict(name=n,file=row[3],line=int(row[4]),statementLead=row[5]))
p['baseline']['declarations']+=base;save('BaselineReading.json',reads)
src=load('SourceReading.json')[0]
p['sources'].append(dict(id=sid,title='Actual categorical affine pullback tower with ordinary connection conventions',authors='The Stacks Project authors; deductions by Codex — codex-7e92bd',edition='Displayed Section60.15 read4October2026',url=src['url'],sha256=src['sha256'],accessed=src['accessed'],readSections=[src['readScope']]))
frontier='The actual composition of affine pullback functors, with data-preserving equality transport of the target parameter, is now naturally isomorphic to direct pullback through native cancelBaseChange. Forward/inverse components, arbitrary-horizontal-arrow naturality and equivalence of the two target flatness conditions have native proofs. No source-curvature reflection is inferred. Strong monoidal scalar-extension packaging, categorical three-step and monoidal coherence, universal exterior-power and finite-projective dual comparisons, E1 actual sheaf tensor/restriction/equality detection/effective gluing remain open. The reserved finite locally free integrable ringed-site key still requires relatively constant λ. All149 routed obligations,35 omissions,five requests,eleven gaps,six planets and determinant/Tate/period/arbitrary-Q tensor-valued-shuffle requirements are preserved. H.0 stays partial; H.1–H.8 stay not_read. Earlier frontier prose is checkpoint history.'
ar=sum(len(n.get('api',[]))for n in new);dr=len({a['name']for n in new for a in n.get('api',[])});tt=sum(len(n.get('tests',[]))for n in new)
p['summary']+=f' Categorical tower continuation:14 nodes(3 constructions11 lemmas),{ar} API references to{dr} distinct lemmas and{tt} test references to6 distinct typed examples.'
p['coverage'][0]['remaining'].append(frontier);road['stages'][0]['description']+=' '+frontier
p['verification']=dict(previousCheckpoint=old['verification'],worker='Codex — codex-7e92bd',date='2026-10-04',issue=3371,mathematicalBase=(S/'base.txt').read_text().strip(),compilation={n.lower():load(n+'.receipt.json')for n in ['Native','Canonical']},newNodes=14,newAPIReferences=ar,newDistinctAPI=dr,newTestReferences=tt,newDistinctTests=6,implementation='unchecked; actual affine proof artifacts only; global sheaf and source closure remain open',publicReplay='Actual public recovery and both immutable verifier reports required before submission.')
for name,data in [('Candidate.json',p),(RID+'.json',p),('Candidate-roadmap.json',road),('NewNodes.json',new),('Plan.json',dict(newNames=[n['declaration']for n in new],newNodes=[n['id']for n in new],apiAdditions={},testAdditions={},newBaseline=base,newBaselineRefs=[x['ref']for x in base],frontier=frontier,apiReferences=ar,distinctAPI=dr,testReferences=tt,distinctTests=6))]:save(name,data)
intro='''# Actual categorical affine pullback towers

The iterated functor is the composition of the two existing affine pullbacks, followed by equality transport of the target parameter from g(f(λ)) to h(λ). This transport retains the native module, actual additive operator and horizontal linear maps. Its reflexivity and composition laws hold as equalities of functors.

The inherited horizontal cancelBaseChange comparison now gives a natural isomorphism from that actual composed functor to direct pullback. Its inverse is the native tensor inverse, and naturality holds for every horizontal arrow. The two target connections have equivalent zero-curvature conditions. These statements allow arbitrary modules and arbitrary λ, including d₀λ≠0; no flatness or injectivity of scalar extension is assumed or inferred.

Strong monoidal pullback packaging and categorical three-step/monoidal coherence remain open. The global finite locally free integrable ringed-site key still requires relatively constant λ and actual sheaf restriction/tensor/gluing. All149 source routes,35 omissions,five supplier requests,eleven gaps,six planets and later stages are preserved. This is a partial planning checkpoint with every implementation unchecked.

## Declarations and tests in this continuation

'''
parts=[intro]
for n in new:
 parts.append('### '+n['title']+'\n\n`'+n['declaration']+'` — '+n['statement']+'\n\nProof plan: '+' '.join(n['proofSteps'])+'\n\n')
 for field in ['api','tests']:
  if n.get(field):parts.append(field.upper()+':\n\n'+''.join('- `'+x['name']+'`: '+x['statement']+'\n'for x in n[field])+'\n')
parts.append('## Earlier checkpoint reader (preserved verbatim)\n\n')
a=''.join(parts);(S/'ReaderAddition.md').write_text(a);(S/'Reader.md').write_text(a+(S/'IncomingReader.md').read_text())
print(json.dumps({'nodes':len(p['nodes']),'baseline':len(p['baseline']['declarations']),'newNodes':len(new),'APIReferences':ar,'distinctAPI':dr,'testReferences':tt,'distinctTests':6}))
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
"""Render concrete scope, provenance, proof receipts and remaining obligations."""
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
h='''# Actual categorical affine pullback towers — checkpoint

Codex — codex-7e92bd. Refs #3371. Partial; every implementation remains unchecked.

This checkpoint adds14 declaration nodes: three constructions and11 lemmas. The iterated functor is the actual composition of the existing pullback along m:R→S, pullback along n:S→T, and parameter equality transport from g(f(λ)) to h(λ). Equality transport keeps the same native module, additive operator and horizontal linear maps; only the Leibniz proof is rewritten. Its reflexivity and composition laws hold as actual functor equalities.

Native cancelBaseChange becomes the forward component of a natural isomorphism from that composed functor to direct pullback. Its inverse is the native tensor inverse and both directions are horizontal by the inherited affine tower proof and isoMk. Naturality reuses native LinearMap.baseChange_baseChange and inverse cancellation. It holds for every actual horizontal arrow. The corresponding two target connections have equivalent zero-curvature conditions; no source-curvature reflection follows. Common-universe native module carriers and the supplied scalar towers on forms are explicit. Arbitrary modules and arbitrary λ, including d₀λ≠0, are allowed without flatness, injectivity, basis or finite-generation assumptions.

All421 incoming nodes and242 baseline objects remain whole. Each new construction has at least three consumed APIs and three relevant tests:11 API references to11 distinct lemmas and9 test references to6 distinct typed examples. The examples preserve an arbitrary operator through inverse parameter transports, retain the derivative term for parameter x+0=x over Z[x], evaluate both naturality composites on double elementary tensors, evaluate the actual inverse and its forward roundtrip, extend a constructed horizontal zero arrow through the whole composed functor, and preserve the nonzero nilpotent coordinate2 over Z/4 with a nonzero scalar Higgs operator.

Strong monoidal scalar-extension packaging and categorical three-step/monoidal coherence remain open. So do universal exterior-power and finite-projective dual comparisons, genuine E1 sheaf tensor/restriction/equality detection/effective gluing, determinant/Tate/period adapters and arbitrary-Q tensor-valued shuffle. The reserved finite locally free integrable ringed-site key retains its relatively constant parameter requirement and is not this raw affine category. All149 routed obligations,35 omissions,five supplier requests,eleven whole gaps,six planets and the source issue/version envelope remain unchanged. H.0 stays partial; H.1–H.8 stay not_read. Earlier frontier prose is checkpoint history.

## Reading and incoming evidence

The whole22198-character issue was read before claim5977175108. Bot5977179819 confirmed that exact numeric claim; the whole unchanged body was then read again in two complete slices. ClaimReceipt.json binds its exact hash. Current reserved key, allfive supplier need texts, gap0 history and H.0 frontier were read. The incoming6046 handoff narrative/recovery, all30 new native declarations and8 tests, actual recovered verifier/helpers and consumed affine category/iso/curvature/pullback/tower-horizontal source blocks were read. No fresh whole421-node or full historical-reader audit is asserted.

Peer PR6046 at head7ca61195b2374a85530aee2bdb1143f5c227c29c, merged158fbe76f1196f015e2c59b7d85f65f6ca5a427b, was publicly recovered from archive7fb880e9dd6a9dd1f883536f7e2f152807e1fc0e. All60 artifacts,10 helpers and5 public files authenticated. Executing its actual recovered verifier from a repository checkout reproduced its Verification.json byte-for-byte. Incoming manifest SHA256afbe2a464ecde9d86cb9f11893e3adecb9d5fcb9247078d52531f5f5bb1a4c3d. Entire native and canonical prefixes are manifest-bound. Assembly preserves all prefix bytes in order, inserts an empty import separator, and appends the new proofs/tests or their admitted planning projection.

Own PR6041 reading is reused at its original recorded scope, authenticated by manifest3ecd87ad0a26b7cfee1ddd31913f5103047e13b2401e060343c9ec8894bf65e9. OwnReadingReuse.json compares all42 controls:37 external files are unchanged, while the five own deliverables changed. Governing protocols, parent readers, ownership/key/supplier and source-route readings retain their exact prior scope. WORKERS was freshly reread. Four parent Hodge reviewed verdict/target/duplicate projections were freshly read; no dedicated PartII audit row exists. No peer reading is relabelled as this worker's own. Reading.json records exact pinned native source ranges for functor composition, natural isomorphism construction, scalar-tower equality, cancelBaseChange and iterated baseChange. A bounded search found no matching specialized affine export in either pinned tree; this is not an exhaustive absence claim.

The complete currently displayed Stacks Section60.15, Lemma60.15.1 proof and both comments were read at https://stacks.math.columbia.edu/tag/07J5. SourceReading.json records exact HTTP bytes/hash/time. Only ordinary additive connection conventions are drawn from that page; the categorical tower construction is an authored deduction. No crystal theorem, full-paper/PDF reading, recursive citation closure or new erratum claim is made. The inherited source issue/version envelope is preserved verbatim with attribution.

## Validation

The whole suggested file imports only individual Mathlib modules and compiles at082e2d37e8b0463410cdb532e111cd43d5a66174 with Lean4.34.0-rc2, commit6a10ac8c22beadecabdbb0919c2b50214762f91d. Existing exact source heads and tracked cleanliness were rechecked for both Mathlib and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Both elaborations used the existing Mathlib build serially, each with a fresh memory guard, one thread,8192MiB managed limit and1200-second timeout. No library build, Lake setup/cache download or language server was started. Every compiler process finished.

'''+line('Native')+line('Canonical')+f'''
All218 native declaration axiom closures use only propext,Classical.choice and Quot.sound. The whole Native.lean has no admissions and compiled without warnings or errors. The entire Canonical.lean has748 admission warnings only. All14 new declaration headers and6 typed-example headers match their planning projection exactly. Three data definitions remain concrete, including proof fields; only11 lemma and6 example proofs are admitted in the new suggested slice. Existing admitted dependencies remain admitted in the preserved canonical prefix. Suggested.lean equals the entire compiled Canonical.lean, SHA256 `{sha((S/'Canonical.lean').read_bytes())}`. These certificates concern the actual affine constructions, not global sheaf/source closure.

The indexed packet checker, actual immutable intake/file rules and source issue/version checks pass without errors or warnings. The packet has435 nodes,244 baseline declarations,{sum(len(n.get('api',[]))for n in p['nodes'])} raw API entries and{sum(len(n.get('tests',[]))for n in p['nodes'])} raw test references. Publication stage DAG{g['stageDAG']['vertices']}/{g['stageDAG']['edges']}, own declaration DAG{g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']} and scoped DAG{g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']} vertices/edges are acyclic. All{g['requiredPairs']} required supplier pairs are reachable. No owned skipped/pending links exist. Every foreign roadmap/stage and stage-edge object matches the immutable control.

Mathematical base `{text('base.txt').strip()}`; publication base `{text('publication-base.txt').strip()}`. All42 guarded inputs and the issue's mathematical contract are unchanged between bases. Declaration-index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Both verifier reports are actual immutable executions of the checker/intake/atlas assembler; verification itself does not run Lean or create a repository snapshot. Exact helper fences and actual public HTTP recovery plus both replay reports are checked before PR submission.

## Resume

Use the actual parameterChange, pullbackTower and pullbackTowerIso, together with the previous symmetric monoidal AffineCategory. Package scalar-extension tensor/unit comparisons as a native strong monoidal pullback functor. Verify categorical three-step and monoidal coherence for the actual tower natural isomorphisms, retaining explicit parameter equalities and comparison directions. Then continue universal exterior-power and finite-projective dual comparisons and genuine E1 sheaf tensor/restriction/equality detection/effective gluing before closing the global key. Preserve all149 source routes,35 omissions,five requests,eleven gaps and later obligations. No implementation or source/supplier closure is marked complete.

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
assert len(old['nodes'])==421 and len(p['nodes'])==435
assert p['nodes'][421:]==data('NewNodes.json')and set(p)==set(old)
for before,after in zip(old['nodes'],p['nodes']):
 expected=json.loads(json.dumps(before));nid=before['id']
 if nid in plan['apiAdditions']:expected['api']+=plan['apiAdditions'][nid]
 if nid in plan['testAdditions']:expected['tests']+=plan['testAdditions'][nid]
 assert after==expected,nid
assert sum(a==b for a,b in zip(old['nodes'],p['nodes']))==421
for k in old:
 if k not in ['nodes','summary','sources','coverage','gaps','verification','baseline']:assert p[k]==old[k],k
assert p['baseline']['declarations']==old['baseline']['declarations']+plan['newBaseline']
assert {k:v for k,v in p['baseline'].items()if k!='declarations'}=={k:v for k,v in old['baseline'].items()if k!='declarations'}
assert [x['ref']for x in p['baseline']['declarations'][242:]]==plan['newBaselineRefs']
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
assert incoming['head']=='7ca61195b2374a85530aee2bdb1143f5c227c29c'and incoming['artifactsVerified']==60 and incoming['archivedHelpersVerified']==10
assert sha((S/'IncomingManifest.json').read_bytes())=='afbe2a464ecde9d86cb9f11893e3adecb9d5fcb9247078d52531f5f5bb1a4c3d'
assert (S/'PreviousVerification.json').read_bytes()==(S/'PreviousVerification-replayed.json').read_bytes()
for name,prefix in [('Native.lean','NativePrefix.lean'),('Canonical.lean','CanonicalPrefix.lean')]:assert im[name]['sha256']==sha((S/prefix).read_bytes())
for path,n in zip(paths,['Incoming-roadmap.json','Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert sha((S/n).read_bytes())==incoming['publicDeliverables'][path]
assert text('Incoming.lean')==text('CanonicalPrefix.lean')
own=data('OwnReadingReuse.json');assert len(own)==42 and sum(g['unchanged']for g in own)==37
om=data('OwnPreviousManifest.json')
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='3ecd87ad0a26b7cfee1ddd31913f5103047e13b2401e060343c9ec8894bf65e9'
for n,orig in [('PriorOwnReading.json','Reading.json'),('OwnPreviousInputGuard.json','InputGuard.json')]:assert sha((S/n).read_bytes())==om[orig]['sha256']
assert [{k:g[k]for k in ['path','sha256']}for g in own]==data('OwnPreviousInputGuard.json')
for g in own:
 assert sha(blob(MATH,g['path']))==g['currentSha256']
 assert g['unchanged']==(g['sha256']==g['currentSha256'])
claim=data('ClaimReceipt.json');assert claim['claim']==5977175108 and claim['bot']==5977179819 and claim['rereadAfterConfirmation']
assert text('Native.lean')==with_imports(text('NativePrefix.lean'))+'\n'+text('NewProofs.lean')+'\n'+text('NewTests.lean')+'\n'+text('Audits.lean')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',text('Native.lean'))
from projection import project
assert text('NewAdmitted.lean')==project(text('NewProofs.lean')+'\n'+text('NewTests.lean'))
assert len(re.findall(r'\bsorry\b',text('NewAdmitted.lean')))==17
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
assert {**nh,**nt}==ch and len(nh)==14 and len(nt)==6
assert set(plan['newNames'])==set(nh)=={n['declaration']for n in p['nodes'][421:]}
new=p['nodes'][421:]
assert {t['name']for n in new for t in n.get('tests',[])}==set(re.findall(r'^-- test: (.+)$',text('NewTests.lean'),re.M))
assert sum(len(n.get('api',[]))for n in new)==11 and len({x['name']for n in new for x in n.get('api',[])})==11
assert sum(len(n.get('tests',[]))for n in new)==9
for n in new:
 assert n['declaration']in text('Reader.md')and n['statement']in text('Reader.md')
 if n['kind']in ['definition','construction']:
  assert len(n['api'])>=3 and len(n['tests'])>=3 and n['uses']
 for k in ['api','tests']:
  for x in n.get(k,[]):assert x['name']in text('Reader.md')and x['statement']in text('Reader.md')
assert text('Audits.lean')=='\n'.join('#print axioms TauCeti.Hodge.ParameterConnection.Intrinsic.'+n for n in plan['newNames'])+'\n'
for name,warnings,examples,audits in [('Native.lean',0,116,218),('Canonical.lean',748,313,0)]:
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
print(json.dumps(dict(checker=summary,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,wholeIncomingNodesUnchanged=421,preservedMathematicalContracts=421,newNodes=14,newAPIReferences=11,newDistinctAPI=11,newTestReferences=9,newDistinctTests=6,matchedNewHeaders=len(ch),rawAPIItems=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),compilation=p['verification']['compilation'],inputGuards=len(data('InputGuard.json')),indexSha256=sha(Path(sys.argv[2]).read_bytes()),mathematicalBase=MATH,immutableBase=BASE,graph=graph,fullCanonicalCompiled=True,sourceScope='Bounded current Stacks07J5 reading; whole inherited source/version envelope retained with prior attribution; no fresh complete-paper or erratum collation.',LeanExecuted=False),indent=2))
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
PreviousVerification-replayed.json NativePrefix.lean CanonicalPrefix.lean
Native.lean Native.log Native.receipt.json Canonical.lean Canonical.log Canonical.receipt.json
NewImports.lean NewProofs.lean NewTests.lean NewAdmitted.lean Audits.lean Candidate-roadmap.json Candidate.json Reader.md ReaderAddition.md Suggested.lean Handoff.md HandoffBase.md
ClaimReceipt.json Reading.json SourceReading.json BaselineReading.json PriorOwnReading.json
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
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED AFFINE CATEGORICAL TOWER PAYLOAD\n'+pb+b'END ARCHIVED AFFINE CATEGORICAL TOWER PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('roadmaps','Candidate-roadmap.json'),('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated affine categorical tower evidence; never executes Lean."""
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
pb=raw.split('/- BEGIN ARCHIVED AFFINE CATEGORICAL TOWER PAYLOAD\\n',1)[1].split('END ARCHIVED AFFINE CATEGORICAL TOWER PAYLOAD -/',1)[0].encode()
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
