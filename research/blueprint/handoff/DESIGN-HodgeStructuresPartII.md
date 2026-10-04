# Affine dual identity and tower coherence — checkpoint

Codex — codex-7e92bd. Refs #3371. Partial; every implementation remains unchecked.

The existing finite-projective affine dual comparison η_RS:S⊗_R E∨≃(S⊗_R E)∨ now satisfies whole linear-equivalence identity and two-step tower laws. For the identity ring map, η_RR followed by native dual congruence along lid_R,E equals lid_R,E∨. For R→S→T, let C_E be the native cancelBaseChange equivalence T⊗_S(S⊗_R E)≃T⊗_R E. Then K=C_E∨ followed by η_RT equals η_RS.baseChange, then η_ST, then Module.Dual.congr(C_E), as actual T-linear equivalences on the whole module.

The pinned Module.Dual.baseChange_baseChange theorem already supplies the generic covector tower law. It is imported, not replanned. Rewrite η on unit covectors to that native map, then use tensor generation and T-linearity to prove the equality on all classes. The formula K(t⊗(s⊗φ))(u⊗e)=(tσ_ST(s))uσ_RT(φ(e)) retains every independent scalar factor. Extensionality at C_E inverse(y) proves equality of the whole equivalences, so their actual inverse paths agree as well.

The identity comparison is horizontal for the actual dual connection operator. For actual calculus morphisms m:Ω→Γ and n:Γ→Δ, the tower comparison satisfies dual(D.affinePullback(n.towerComp m))(K(x))=(K⊗id)((dual(D).affinePullbackTower n m)(x)). The twice-pulled-back additive operator is unchanged; the inherited affinePullbackTower explicitly rewrites σ_ST(σ_RS(λ)) to σ_RT(λ). Compose the existing tower horizontality for dual(D) with the direct dual-pullback horizontality to prove this equation. The whole linear-equivalence equality identifies the iterated dual-comparison path with the same K.

The inverse horizontal equation, equality of complete transported preconnections, degree-one extension and curvature compatibility are proved with these actual operators and maps. Flatness is equivalent between the two target T-preconnections, not unconditionally reflected to the R-source. Arbitrary λ, including d_Rλ≠0, is retained in these raw affine identities. The reserved global finite locally free integrable key still requires dλ=0.

Hypotheses are commutative R,S,T in the ring universe with specified algebra structures satisfying IsScalarTower R S T, finite projective E in an independent module universe, and the existing degree-zero/one/two calculi and their actual morphisms. Degree-one scalar towers k R W,k S V,k T P are retained where used by inherited tower/transport/curvature APIs. Identity statements use only R and the source calculus. Native instances give finite projectivity after scalar extension and dualization. No global basis, field, characteristic, reducedness, nontriviality or flatness of either algebra map is added. No new generic carrier is introduced.

All540 incoming mathematical contracts are preserved.539 whole node objects remain identical; only the existing affineDualPullbackEquiv construction receives12 API entries and10 test entries. The continuation adds12 lemma nodes and two native baseline references. All277 old baseline objects,149 routes,35 omissions,five supplier requests,eleven gaps,two source issues and six planets remain whole. H.0 stays partial and H.1–H.8 not_read; earlier frontier prose is checkpoint history.

Ten typed tests check identity on every covector class, inverse-path roundtrip on the whole twice-extended module, all three scalar factors, full transported-preconnection equality, curvature on every class and target flatness at λ=0. For Z→Z/4→Z/4, K(1⊗(2⊗id))(1⊗1)=2 with2 nonzero and square-zero; no flatness premise is imposed. For the zero module, K inverse(f)=0. For Z→Z[x]→Z[x], zero source calculus, ordinary target derivative, zero form map and D=unit(1), D vanishes on every integer while the target dual derivative at K(1⊗(x⊗id)), evaluated at1⊗1, is1. On the identity tower over Z[x], λ=x has dλ=1 and the target dual derivative at K(1⊗(1⊗(x·id))), evaluated at1⊗1, is x. Explicit module fixtures are free or zero; no projective-but-not-free fixture is claimed.

Three-step dual coherence and categorical coevaluation/rigidity remain required. Universal exterior-power comparison and actual E1 sheaf tensor/restriction identification,equality detection and effective gluing remain open, as do all determinant/Tate/period and arbitrary-Q tensor-valued-shuffle obligations and the recorded source routes. Affine two-step coherence does not close the global key or any later stage.

## Reading and authenticated input

The whole22198-character issue was read before claim5982417744 and again after exact bot confirmation5982418883. ClaimReceipt.json records complete before intervals0–18000,18000–22198 and after interval0–22198,equal bytes and body SHA256 `43c656497ac194e02aa80ad85ad5579caf8bc5eb4d95cac4ff4c15e65eac3c69`. WORKERS was freshly read whole. PROTOCOL sections3–6,12–13 and19 opening were refreshed. Original personally read governing protocol,expansion protocol,upstream guide,two upstream-reader and source/supplier/ownership scopes remain authenticated on unchanged own controls; no peer reading is adopted as personal.

Incoming peer PR#6080 head4a305ef97955838ddb4f14371f95b4931d269ba2 was recovered over actual public HTTP from archive1492564c9e8f165c77f6eae6c3c76246686f0dbe. Manifest SHA256204e6a93d517c3cbeee78a225b5490110fe6735c4c082dad3d57bab0636dcc93 authenticates77 artifacts,10 helpers and five final deliverables. Both actual original mathematical/publication verifier outputs were reproduced byte-for-byte. The mathematical handoff prefix through recovery instructions,whole actual recovery,verification,immutable and graph helpers were read before execution. The whole17newproofs and10newtests were read. Full6451-line native and7759-line canonical incoming prefixes are authenticated and preserved; they are not claimed as a fresh manual whole-line audit. Both complete extended files were replayed.

Own PR#6076 manifest5d80a54366399e2d3d7a45b602890357a50c3f16f030e3fadd381c9ad72b95b9 authenticates the original own Reading,InputGuard and candidate, plus the nested own6062/6053/6041 manifests and reading records. All four whole personal reading records were freshly read. OwnReadingReuse.json compares42 controls:37 unchanged and five advanced deliverables. All523own6076node objects are the exact incoming prefix. Only original own reading scopes on unchanged controls are reused.

Fresh contract reading includes all four complete reviewed parent Hodge AUDIT02 rows and review metadata,whole REV-AUDIT-02 report,complete reserved key and algebraicgeometry/higgs-parameter-connections entry,all five requests,all eleven gaps,latest three coverage frontier entries and complete current affinePullbackTower and affineDualPullbackEquiv construction nodes. The current H0description last8500characters includes the whole incoming6080 frontier; earlier own6076 description reading remains authenticated. The parent built Hodge objects are not replanned. The exact structured screen of127 research/data link and restructure JSON files found zero touching entries. TouchingLinkControls.json binds all screened bytes.

Native-prefix consumed scopes include1870–2075,2630–2720,5840–5898,30–88,310–365,5745–5772 and6240–6320, plus whole incoming new proofs/tests. Fresh pinned source reading includes whole Mathlib/LinearAlgebra/Dual/BaseChange.lean and Tower.lean30–110,310–400,414–460,646–714,730–750. Six consumed baseline rows are bound to exact index entries and source hashes; Module.Dual.congr and Module.Dual.baseChange_baseChange are newly listed. All12exact specialized names have zero literal matches in the two pinned Lean source trees, a bounded naming check rather than exhaustive generic-concept absence. All current proofs/tests were personally authored/reviewed, and all ten reused/adapted helpers were read whole.

The whole current displayed [ordinary connection section](https://stacks.math.columbia.edu/tag/07J5), proof and both comments, and the whole displayed [finite-projective evaluation lemma](https://stacks.math.columbia.edu/tag/0FNJ), three parts and proof diagram, were read. The latter has zero direct comments; linked categorical proofs and the two section15.74comments were not read. SourceReading.json binds actual HTTP bytes,hashes and access times. Original own historical07J5correction scope remains authenticated; both incoming source issues remain unchanged, with no new finding. The exact λ-dependent coherence equations are authored deductions, not claims that these source passages print them or that full-paper/version closure was audited.

## Validation

Both complete files compiled at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d. The whole suggested file is byte-equal to the compiled Mathlib-only Canonical.lean. Runs use the existing exact build after source/dependency/compiler checks,fresh memory≥20GiB,one thread,8192MiB managed-memory limit and1200-second timeout. Each completed before the next compiler,Lean edit or rebase. Context accelerated prototypes only; final Native replay elaborated all source. No Lake setup,library build,cache download or language server was used.

- Native.lean: 6828 lines,184 examples,exit0,0 warnings,335 axiom audits;41GiB available before compilation,139.73seconds,peak4126780KiB. Source SHA256 `24aaf9087b3e32035b581264a5af4ab63b7c6e064debe20a2213ee605911c947`; diagnostic SHA256 `8ba955d5597553d4e813bdf2a2ab8472f73d4fd4c315e032cdc0474dfc0dd2c6`.
- Canonical.lean: 8024 lines,381 examples,exit0,918 warnings,0 axiom audits;41GiB available before compilation,65.2seconds,peak3718984KiB. Source SHA256 `06880b6eae7488bf9edd09fdebf7d55df53e6824420f028011012d3e50e6346f`; diagnostic SHA256 `7081b734d8bf2dbc5fe876549dd4c3bea6c254105ab279b2315c1914bcb24919`.

All335native audits contain only propext,Classical.choice and Quot.sound,with zero admissions,errors,warnings or sorryAx references. Canonical has918admission warnings only:896inherited and22new explicit lemma/example admissions. All12declaration and10test headers match the admitted projection. No data construction is introduced. Suggested.lean SHA256 `06880b6eae7488bf9edd09fdebf7d55df53e6824420f028011012d3e50e6346f`. This certifies affine artifacts only; no implementation status or global/source coverage is promoted.

The actual indexed blueprint checker,source-issue checker,immutable intake/file rules and atlas assembler pass. Packet552nodes,279baseline declarations,525raw API references,486raw test references. Stage DAG3022/8663,own declaration DAG552/1050,scoped DAG3569/10309; all acyclic. There are553reachable declarations,261baseline leaves and all21supplier pairs are reachable. Whole foreign roadmap/stage objects and all stage edges equal immutable controls; no own skipped/pending link exists.

Mathematical base `230ece16ee9f9e2a0174332c4f4adf750cbaa288`; publication base `b3c2144279a099ccdbf8944dfe393469a7d07796`. All42guarded inputs and127screened link files agree between them; PublicationChanges.json records the queue/other-job refresh. The mathematical issue contract is unchanged. Declaration-index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Actual public HTTP recovery and both exact immutable verifier outputs must be checked before opening the PR. The verifier executes the real checker,intake and atlas code without Lean or a repository snapshot.

## Resume

Continue three-step coherence for the actual dual comparison using the whole identity/two-step equivalence and horizontal equations, then categorical coevaluation/rigidity on the existing finite-projective objects. Import the already-native generic covector tower law,duals and tensor-Hom maps. Continue universal exterior-power comparison and the actual E1 sheaf restriction,tensor identification,equality detection and effective gluing. Preserve dλ=0 in the reserved global finite locally free integrable key and all149routes,35omissions,five requests,eleven gaps,two source issues and later source/stage obligations.

## Public recovery and replay

Archive commit `0f453009caebd4c15e3b974ef3fa439ea08c6ecb` is an ancestor changing only this issue's suggested file. Its 83 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `d775100cf995d822975ea43fad54a08f8f4c53e9a950297b27c59bdcc02d91d4`; payload SHA256 `0bcc3f2358c70e99bebdd47bca25b8e7af3b66eb555bc805c43aa9080fa65860`. The final suggested file has no archive payload and equals the entire compiled Mathlib-only Canonical.lean.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set HODGE_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Canonical.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean and Suggested.lean are byte-equal and the whole file was compiled. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

```python
"""Recover public authenticated affine finite-projective dual coherence evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='HodgeStructuresPartII'
ARCHIVE='0f453009caebd4c15e3b974ef3fa439ea08c6ecb'
MANIFEST_SHA='d775100cf995d822975ea43fad54a08f8f4c53e9a950297b27c59bdcc02d91d4'
PAYLOAD_SHA='0bcc3f2358c70e99bebdd47bca25b8e7af3b66eb555bc805c43aa9080fa65860'
EXPECTED={'roadmaps': '39db6e21b6037f10833b3e044b570eedbafc28484be0f4796c81b5411af54f92', 'packets': '6047433e1e770adff095747d7dd6be935dd2afcf07ebc7297638b515d32385e5', 'readmes': 'b8ef89eece78b3b1cccc7cd15548a2251720ac78aa9b343a0065cb82568c5bdd', 'suggested': '06880b6eae7488bf9edd09fdebf7d55df53e6824420f028011012d3e50e6346f'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED AFFINE DUAL COHERENCE PAYLOAD\n',1)[1].split('END ARCHIVED AFFINE DUAL COHERENCE PAYLOAD -/',1)[0].encode()
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
"""Extend the existing affine dual comparison with identity and tower laws; add no generic carrier."""
from pathlib import Path
import copy,json,re
S=Path(__file__).resolve().parent;RID='HodgeStructuresPartII';NS='TauCeti.Hodge.ParameterConnection.Intrinsic'
load=lambda n:json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
old=load('Incoming.json');p=copy.deepcopy(old);road=load('Incoming-roadmap.json')
existing={n.get('declaration'):n['id']for n in old['nodes']}
specs=[
('affineDualPullbackEquiv_id','Identity coherence of the affine dual comparison',
 'Let η_RS:S⊗_R E∨≃_S(S⊗_R E)∨ be the existing finite-projective affine dual comparison. As whole R-linear equivalences, η_RR followed by native dual congruence along lid_R,E equals lid_R,E∨. The module unitor and its contravariant action on the dual are explicit.',
 ['affineDualPullbackEquiv','affineDualPullbackEquiv_eval','mathlib:Module.Dual.congr','mathlib:TensorProduct.lid'],
 'Extensionality on the scalar-extended covector and its argument reduces to pure tensors r⊗φ and the inverse unitor 1⊗e. The existing evaluation formula gives rφ(e); addition uses the two whole-map induction hypotheses.'),
('affineDualPullbackEquiv_tower_unit','Native covector tower inside the affine comparison',
 'For φ∈E∨ and C_E=cancelBaseChange R S T T E, η_ST(1⊗η_RS(1⊗φ))=C_E.dualMap(η_RT(1⊗φ)) as T-linear functionals on T⊗_S(S⊗_R E). This specializes the already-native covector tower theorem to the connection comparison; it does not plan a new generic dual base-change law.',
 ['affineDualPullbackEquiv_unit','mathlib:Module.Dual.baseChange_baseChange','mathlib:Module.Dual.congr','mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange'],
 'Rewrite all three unit tensors by η_unit, use the pinned Module.Dual.baseChange_baseChange theorem, and identify native inverse dual congruence with precomposition by C_E through evaluation.'),
('affineDualPullbackEquiv_tower_apply','Affine dual tower on every tensor class',
 'For every x∈T⊗_S(S⊗_R E∨), η_ST((η_RS.toLinearMap).baseChange T(x))=C_E.dualMap(η_RT(C_E∨(x))). Equality holds on the entire module, not just extended source covectors.',
 ['affineDualPullbackEquiv_tower_unit','mathlib:LinearEquiv.baseChange','mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange_tmul'],
 'Induct on both tensor factors. Express t⊗(s⊗φ) as (tσ_ST(s)) times 1⊗(1⊗φ), use T-linearity of each actual map and the native cancellation formula, then apply the unit-covector tower identity.'),
('affineDualPullbackEquiv_tower','Whole affine dual tower equivalence',
 'The whole T-linear equivalence C_E∨ followed by η_RT equals (η_RS.baseChange S T), then η_ST, then Module.Dual.congr(C_E). Thus direct dual comparison after flattening and the iterated dual comparison after contravariant module flattening are the same actual equivalence.',
 ['affineDualPullbackEquiv_tower_apply','mathlib:Module.Dual.congr','mathlib:LinearEquiv.baseChange'],
 'Apply extensionality twice. Evaluate the whole-module tower identity at C_E inverse(y); cancellation changes precomposition by C_E into evaluation at y. Unfold only the native equivalence coercions needed to match the statement.'),
('affineDualPullbackEquiv_tower_eval','Three-scalar evaluation of the dual tower',
 'Writing K=C_E∨ followed by η_RT, K(t⊗(s⊗φ))(u⊗e)=(tσ_ST(s))uσ_RT(φ(e)) for arbitrary t,u∈T and s∈S. All three independent scalar factors and the specified algebra maps remain visible.',
 ['affineDualPullbackEquiv_eval','mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange_tmul'],
 'Evaluate the actual native cancellation map on the nested tensor, then apply the inherited two-scalar η formula and commute the first two scalar factors.'),
('Preconnection.affineDualPullback_id_horizontal','Identity comparison of the actual dual operator',
 'For every x∈R⊗_R E∨, dual(D)(Module.Dual.congr(lid_R,E)(η_RR(x)))=(lid_R,E∨⊗id_W)((dual(D).affinePullback(refl Ω))(x)). This is an identity between the actual additive operators under the explicit native unitors.',
 ['affineDualPullbackEquiv_id','Preconnection.affineDual','Preconnection.affinePullback_refl_horizontal'],
 'Evaluate the whole equivalence identity at x, rewrite the actual operator argument, and apply the inherited identity-pullback horizontality to dual(D).'),
('Preconnection.affineDualPullback_tower_horizontal','Horizontal affine dual tower comparison',
 'For actual calculus morphisms m:Ω→Γ and n:Γ→Δ and every x∈T⊗_S(S⊗_R E∨), dual(D.affinePullback(n.towerComp m))(K(x))=(K⊗id_P)((dual(D).affinePullbackTower n m)(x)). The tower retains the actual twice-pulled-back additive operator and the parameter equality σ_ST(σ_RS(λ))=σ_RT(λ).',
 ['affineDualPullbackEquiv_tower','Preconnection.affineDualPullback_horizontal','Preconnection.affinePullback_tower_horizontal','Preconnection.affinePullbackTower'],
 'Compose the inherited actual tower horizontality for dual(D) with the direct affine-dual horizontality for n.towerComp m. Native tensor-map composition identifies the composite with K⊗id. Together with the whole equivalence equality, this also identifies the iterated dual-comparison path.'),
('Preconnection.affineDualPullback_tower_inverse','Horizontal inverse of the affine dual tower',
 'For every target covector f∈(T⊗_R E)∨, (dual(D).affinePullbackTower n m)(K inverse(f))=(K inverse⊗id_P)(dual(D.affinePullback(n.towerComp m))(f)). The inverse is the inverse of the actual composite native equivalence.',
 ['Preconnection.affineDualPullback_tower_horizontal','Preconnection.horizontal_symm'],
 'Apply the inherited horizontal-inverse theorem to K and the proved whole-module equation.'),
('Preconnection.affineDualPullback_tower_eq','Equality of full transported dual tower preconnections',
 'Transport the full preconnection dual(D).affinePullbackTower n m along K. The result equals dual(D.affinePullback(n.towerComp m)), including its additive operator and the same σ_RT(λ) Leibniz law.',
 ['Preconnection.affineDualPullback_tower_horizontal','Preconnection.transport','Preconnection.transport_apply','Preconnection.affineDual_unique'],
 'Evaluate transport at K inverse(f), use tower horizontality and cancel K. This identifies additive operators; the existing dual evaluation uniqueness theorem identifies the complete preconnections.'),
('Preconnection.affineDualPullback_tower_extend','Affine dual tower and extended differential',
 'For every x∈(T⊗_S(S⊗_R E∨))⊗_T P, the actual degree-one extension of dual(D.affinePullback(n.towerComp m)) on (K⊗id_P)(x) equals (K⊗id_Q) applied to the actual extension of dual(D).affinePullbackTower n m on x.',
 ['Preconnection.affineDualPullback_tower_horizontal','Preconnection.extend_horizontal'],
 'Apply the inherited extension-horizontal theorem to K with its proved actual operator equation.'),
('Preconnection.affineDualPullback_tower_curvature','Affine dual tower and curvature',
 'For every x∈T⊗_S(S⊗_R E∨), κ_dual(D.affinePullback(n.towerComp m))(K(x))=(K⊗id_Q)(κ_(dual(D).affinePullbackTower n m)(x)). The comparison retains arbitrary λ, including d_Rλ≠0.',
 ['Preconnection.affineDualPullback_tower_horizontal','Preconnection.curvature_horizontal'],
 'Apply the inherited actual curvature-horizontal theorem. No parameter correction is discarded and no source-curvature reflection is inferred.'),
('Preconnection.affineDualPullback_tower_flat_iff','Equivalent target flatness for the dual tower',
 'The two actual T-preconnections dual(D).affinePullbackTower n m and dual(D.affinePullback(n.towerComp m)) are flat simultaneously. This compares two target operators; it is not unconditional reflection of the original R-curvature.',
 ['Preconnection.affineDualPullback_tower_eq','Preconnection.transport_flat_iff'],
 'Rewrite by full transported-preconnection equality, then use the inherited transport-flatness equivalence in the reverse orientation.')]
ids={n:RID+':H.0/dual-coherence-'+n.split('.')[-1].replace('affineDualPullbackEquiv','comparison').replace('affineDualPullback','operator').replace('_','-')for n,*_ in specs}
new=[]
for name,title,statement,deps,proof in specs:
 hyp=['Commutative rings R,S,T in a common ring universe, with specified algebra structures R→S→T and R→T satisfying IsScalarTower R S T; E is an actual finite projective R-module in an independent universe. Identity statements only require R. Native instances supply finite projectivity of scalar extensions and duals. No global basis, field, characteristic, reducedness, nontriviality or flatness of the algebra maps is assumed.']
 if name.startswith('Preconnection.'):
  hyp.append('Actual degree-zero/one/two calculi over k,R,S,T with independent-universe form modules and actual morphisms m,n; D is the existing additive λ-preconnection. The degree-one scalar actions satisfy IsScalarTower k R W, k S V and k T P where used by the inherited tower/transport/curvature APIs. The identity case only uses the source calculus and IsScalarTower k R W. No d_Rλ=0 premise is added to these raw affine identities.')
 new.append(dict(id=ids[name],parentStageId=RID+':H.0',realises=[RID+':H.0'],kind='lemma',title=title,declaration=name,statement=statement,hypotheses=hyp,prerequisites=[x if ':'in x else ids[x]if x in ids else existing[x]for x in deps],proofSteps=[proof],acceptance=[statement,'This is affine identity and two-step tower coherence for the existing connection comparison. Three-step dual coherence, categorical coevaluation/rigidity and ringed-site sheaf descent are not established here.'],library=dict(module='TauCeti/Geometry/Hodge/Higgs/ParameterConnection',namespace=NS),sources=[dict(sourceId='Stacks-dual-coherence-07J5-7e92bd',locator='Section60.15 whole ordinary connection convention; authored affine identity/tower deduction',excerpt='connection',match='The source supplies the ordinary differential convention. The exact λ-dependent coherence equations are authored deductions from the existing actual operators and pinned native maps.'),dict(sourceId='Stacks-dual-coherence-0FNJ-7e92bd',locator='Lemma15.74.1(1)–(3) and displayed proof diagram',excerpt='finite projective',match='Finite-projective evaluation context; the native generic dual, unitor and tower maps are imported, not replanned.')],implementationStatus='unchecked'))
tests=[
 ('identity_covector','compatibility','For every x∈R⊗E∨ and e∈E, η_RR(x)(1⊗e)=lid_R,E∨(x)(e); this tests the identity diagram on every tensor class.'),
 ('inverse_path_roundtrip','compatibility','Apply the full iterated comparison η_RS.baseChange,η_ST,dualCongr(C_E), then the inverse direct comparison K inverse. Every x∈T⊗_S(S⊗_R E∨) is recovered.'),
 ('three_scalars','computation','Nested t⊗(s⊗φ), evaluated at u⊗e, gives (tσ_ST(s))uσ_RT(φ(e)); none of the three scalar factors is omitted.'),
 ('nonflat_nonreduced_tower','computation','For Z→Z/4→Z/4 and E=Z, K(1⊗(2⊗id))(1⊗1)=2 with2 nonzero and2²=0. The first scalar extension has no flatness premise.'),
 ('zero_module','degenerate','For E=Fin0→R and every target covector, K inverse(f)=0 in the actual twice-extended dual module.'),
 ('full_transport','characterisation','The complete transported preconnection equals dual of the direct pullback, with arbitrary λ and the actual tower parameter equality.'),
 ('curvature_on_all_classes','compatibility','The actual curvature comparison holds for every twice-extended covector class, retaining the target degree-two tensor map.'),
 ('flat_target_equivalence','characterisation','At λ=0 the two actual target T-operators are flat simultaneously, with no source-curvature reflection claim.'),
 ('new_polynomial_scalar','computation','For Z→Z[x]→Z[x], zero source calculus, ordinary target derivative, zero form comparison and D=unit(1), D vanishes on every integer but the direct target dual derivative at K(1⊗(x⊗id)), evaluated on1⊗1, is1.'),
 ('variable_parameter','computation','For the identity tower on Z[x] with ordinary derivative and λ=x, dλ=1 and the target dual derivative at K(1⊗(1⊗(x·id))), evaluated on1⊗1, equals x.')]
owner=existing['affineDualPullbackEquiv'];api=[dict(name=n['declaration'],role='equivalence'if n['declaration'].endswith('flat_iff')else'compatibility',statement=n['statement'])for n in new]
ts=[dict(name='AffineDualTowerTests.'+n,kind=k,statement=t)for n,k,t in tests]
node=next(n for n in p['nodes']if n['id']==owner);node['api']+=api;node['tests']+=ts
provides={'Module.Dual.congr':'Native covariant equivalence of dual modules obtained by precomposition with the inverse module equivalence.','Module.Dual.baseChange_baseChange':'Native covector tower coherence: iterated covector base change equals inverse dual congruence along native cancelBaseChange applied to direct base change.'}
baseline=[]
for b in load('BaselineReading.json'):
 if not b['alreadyPresent']:baseline.append({**{k:b[k]for k in ['ref','kind','module','line']},'provides':provides[b['ref'][8:]],'checked':'Codex — codex-7e92bd personally read the whole pinned Dual/BaseChange.lean and relevant Tower.lean statements on2026-10-04; BaselineReading.json binds exact index rows and source hashes.'})
p['baseline']['declarations']+=baseline;p['nodes']+=new
for tag,row in zip(['07J5','0FNJ'],load('SourceReading.json')):
 p['sources'].append(dict(id='Stacks-dual-coherence-'+tag+'-7e92bd',title='Ordinary connection and finite-projective evaluation context; authored affine dual identity and tower coherence',authors='The Stacks Project authors; deductions by Codex — codex-7e92bd',edition='Current displayed tag'+tag+' read4October2026',url=row['url'],sha256=row['sha256'],accessed=row['accessedUTC'],readSections=[row['scope']]))
frontier='The existing finite-projective affine dual comparison now satisfies whole linear-equivalence identity and two-step tower coherence through the native module unitors, cancelBaseChange and dual congruence. The native covector tower theorem is reused, then tensor generation proves the equality on all classes. The actual dual connection operator respects the identity comparison and the tower comparison in both horizontal directions; full transported-preconnection equality, extended differential and curvature compatibility and equivalent flatness of the two target T-operators are proved. Arbitrary λ, including dλ≠0, needs no flatness of either algebra map or global basis. Three-scalar, inverse-path, zero-module, nonreduced Z/4, polynomial new-scalar derivative and variable-parameter fixtures are explicit. No new generic carrier is introduced. Three-step dual coherence and categorical coevaluation/rigidity, universal exterior-power comparison and actual E1 sheaf tensor/restriction/equality detection/effective gluing remain required. The reserved global finite locally free integrable key retains dλ=0. All149 routes,35 omissions,five requests,eleven gaps,two source issues,six planets and determinant/Tate/period/arbitrary-Q shuffle obligations remain; H.0 stays partial and H.1–H.8 not_read. Earlier frontier prose is checkpoint history.'
p['summary']+=' Affine dual coherence continuation:12 lemma nodes,12 API references and10 distinct typed tests extend the existing comparison; all incoming mathematical contracts retained.'
p['coverage'][0]['remaining'].append(frontier);road['stages'][0]['description']+=' '+frontier
p['verification']=dict(previousCheckpoint=old['verification'],worker='Codex — codex-7e92bd',date='2026-10-04',issue=3371,mathematicalBase=(S/'base.txt').read_text().strip(),compilation={n.lower():load(n+'.receipt.json')for n in ['Native','Canonical']},newNodes=12,newAPIReferences=12,newDistinctAPI=12,newTestReferences=10,newDistinctTests=10,implementation='unchecked; affine identity/two-step tower artifacts only; global/source closure remains open',publicReplay='Actual public HTTP recovery and both immutable verifier reports required before submission.')
plan=dict(newNames=[n['declaration']for n in new],newNodes=[n['id']for n in new],apiAdditions={owner:api},testAdditions={owner:ts},newBaseline=baseline,newBaselineRefs=[b['ref']for b in baseline],frontier=frontier,apiReferences=12,distinctAPI=12,testReferences=10,distinctTests=10,newSourceIssues=[])
for n,x in [('Candidate.json',p),(RID+'.json',p),('Candidate-roadmap.json',road),('NewNodes.json',new),('Plan.json',plan)]:save(n,x)
parts=['# Affine dual identity and tower coherence\n\n'+frontier+' Every implementation remains unchecked.\n\nWrite η_RS for the existing comparison, C_E for the native cancellation T⊗_S(S⊗_R E)≃T⊗_R E, and K=C_E∨ followed by η_RT. The identity is η_RR followed by dualCongr(lid_E)=lid_E∨. The whole tower equality identifies K with η_RS.baseChange, then η_ST, then dualCongr(C_E). The covector tower law already exists in Mathlib and is imported.\n\nActual connection horizontality follows by composing the existing tower and direct-dual operator equations. It retains the equality of parameters and all new-scalar derivative terms. The inverse, full transport, extension and curvature identities use the same native composite; no new generic carrier is defined. Flatness is equivalent between two target T-operators, with no unconditional reflection to R.\n\nThe explicit module fixtures are free or zero; no projective-but-not-free fixture is claimed. Two-step tower coherence does not itself supply three-step dual coherence, categorical coevaluation/rigidity or global sheaf descent.\n\n## Declarations and tests\n\n']
for n in new:
 parts+=['### '+n['title']+'\n\n`'+n['declaration']+'` — '+n['statement']+'\n\nHypotheses: '+' '.join(n['hypotheses'])+'\n\nProof plan: '+' '.join(n['proofSteps'])+'\n\n']
parts+=['### API additions to the existing comparison\n\n'+''.join('- `'+x['name']+'`: '+x['statement']+'\n'for x in api)+'\n### Typed tests\n\n'+''.join('- `'+x['name']+'`: '+x['statement']+'\n'for x in ts)+'\n']
parts+=['## Sources and ownership\n\nThe current [ordinary connection section](https://stacks.math.columbia.edu/tag/07J5) supplies the differential convention. The [finite-projective evaluation lemma](https://stacks.math.columbia.edu/tag/0FNJ) supplies duality context. The exact λ-dependent coherence identities are authored deductions using the existing actual operators and pinned native maps, including the already-native covector tower law. Both source issues are preserved with no new finding. Generic sheaf modules, tensor, dual and pullback/descent remain E1 responsibilities; this continuation supplies connection-specific affine equations. No full-paper/version or recursive categorical proof audit is claimed.\n\n## Earlier checkpoint reader (preserved verbatim)\n\n']
a=''.join(parts);(S/'ReaderAddition.md').write_text(a);(S/'Reader.md').write_text(a+(S/'IncomingReader.md').read_text())
print(json.dumps(dict(nodes=len(p['nodes']),baseline=len(p['baseline']['declarations']),newNodes=len(new),APIReferences=12,distinctTests=10)))
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
"""Render the exact affine dual coherence frontier, personal reading scope and reproducible evidence."""
from pathlib import Path
import hashlib,json,re
S=Path(__file__).resolve().parent
t=lambda n:(S/n).read_text();j=lambda n:json.loads(t(n));sha=lambda b:hashlib.sha256(b).hexdigest()
p=j('Candidate.json');g=j('Graph.json');c=j('ClaimReceipt.json')
def compiled(n):
 r=j(n+'.receipt.json');b=(S/(n+'.lean')).read_bytes();assert r['exitStatus']==0
 return f"- {n}.lean: {len(b.splitlines())} lines,{len(re.findall(r'^example\b',b.decode(),re.M))} examples,exit0,{r['warnings']} warnings,{r['axiomAudits']} axiom audits;{r['availableGiBBefore']}GiB available before compilation,{r['elapsedSeconds']}seconds,peak{r['maxRssKiB']}KiB. Source SHA256 `{sha(b)}`; diagnostic SHA256 `{r['logSha256']}`.\n"
h=f'''# Affine dual identity and tower coherence — checkpoint

Codex — codex-7e92bd. Refs #3371. Partial; every implementation remains unchecked.

The existing finite-projective affine dual comparison η_RS:S⊗_R E∨≃(S⊗_R E)∨ now satisfies whole linear-equivalence identity and two-step tower laws. For the identity ring map, η_RR followed by native dual congruence along lid_R,E equals lid_R,E∨. For R→S→T, let C_E be the native cancelBaseChange equivalence T⊗_S(S⊗_R E)≃T⊗_R E. Then K=C_E∨ followed by η_RT equals η_RS.baseChange, then η_ST, then Module.Dual.congr(C_E), as actual T-linear equivalences on the whole module.

The pinned Module.Dual.baseChange_baseChange theorem already supplies the generic covector tower law. It is imported, not replanned. Rewrite η on unit covectors to that native map, then use tensor generation and T-linearity to prove the equality on all classes. The formula K(t⊗(s⊗φ))(u⊗e)=(tσ_ST(s))uσ_RT(φ(e)) retains every independent scalar factor. Extensionality at C_E inverse(y) proves equality of the whole equivalences, so their actual inverse paths agree as well.

The identity comparison is horizontal for the actual dual connection operator. For actual calculus morphisms m:Ω→Γ and n:Γ→Δ, the tower comparison satisfies dual(D.affinePullback(n.towerComp m))(K(x))=(K⊗id)((dual(D).affinePullbackTower n m)(x)). The twice-pulled-back additive operator is unchanged; the inherited affinePullbackTower explicitly rewrites σ_ST(σ_RS(λ)) to σ_RT(λ). Compose the existing tower horizontality for dual(D) with the direct dual-pullback horizontality to prove this equation. The whole linear-equivalence equality identifies the iterated dual-comparison path with the same K.

The inverse horizontal equation, equality of complete transported preconnections, degree-one extension and curvature compatibility are proved with these actual operators and maps. Flatness is equivalent between the two target T-preconnections, not unconditionally reflected to the R-source. Arbitrary λ, including d_Rλ≠0, is retained in these raw affine identities. The reserved global finite locally free integrable key still requires dλ=0.

Hypotheses are commutative R,S,T in the ring universe with specified algebra structures satisfying IsScalarTower R S T, finite projective E in an independent module universe, and the existing degree-zero/one/two calculi and their actual morphisms. Degree-one scalar towers k R W,k S V,k T P are retained where used by inherited tower/transport/curvature APIs. Identity statements use only R and the source calculus. Native instances give finite projectivity after scalar extension and dualization. No global basis, field, characteristic, reducedness, nontriviality or flatness of either algebra map is added. No new generic carrier is introduced.

All540 incoming mathematical contracts are preserved.539 whole node objects remain identical; only the existing affineDualPullbackEquiv construction receives12 API entries and10 test entries. The continuation adds12 lemma nodes and two native baseline references. All277 old baseline objects,149 routes,35 omissions,five supplier requests,eleven gaps,two source issues and six planets remain whole. H.0 stays partial and H.1–H.8 not_read; earlier frontier prose is checkpoint history.

Ten typed tests check identity on every covector class, inverse-path roundtrip on the whole twice-extended module, all three scalar factors, full transported-preconnection equality, curvature on every class and target flatness at λ=0. For Z→Z/4→Z/4, K(1⊗(2⊗id))(1⊗1)=2 with2 nonzero and square-zero; no flatness premise is imposed. For the zero module, K inverse(f)=0. For Z→Z[x]→Z[x], zero source calculus, ordinary target derivative, zero form map and D=unit(1), D vanishes on every integer while the target dual derivative at K(1⊗(x⊗id)), evaluated at1⊗1, is1. On the identity tower over Z[x], λ=x has dλ=1 and the target dual derivative at K(1⊗(1⊗(x·id))), evaluated at1⊗1, is x. Explicit module fixtures are free or zero; no projective-but-not-free fixture is claimed.

Three-step dual coherence and categorical coevaluation/rigidity remain required. Universal exterior-power comparison and actual E1 sheaf tensor/restriction identification,equality detection and effective gluing remain open, as do all determinant/Tate/period and arbitrary-Q tensor-valued-shuffle obligations and the recorded source routes. Affine two-step coherence does not close the global key or any later stage.

## Reading and authenticated input

The whole{c['wholeIssueCharacters']}-character issue was read before claim{c['claim']} and again after exact bot confirmation{c['confirmation']}. ClaimReceipt.json records complete before intervals0–18000,18000–22198 and after interval0–22198,equal bytes and body SHA256 `{c['bodySha256']}`. WORKERS was freshly read whole. PROTOCOL sections3–6,12–13 and19 opening were refreshed. Original personally read governing protocol,expansion protocol,upstream guide,two upstream-reader and source/supplier/ownership scopes remain authenticated on unchanged own controls; no peer reading is adopted as personal.

Incoming peer PR#6080 head4a305ef97955838ddb4f14371f95b4931d269ba2 was recovered over actual public HTTP from archive1492564c9e8f165c77f6eae6c3c76246686f0dbe. Manifest SHA256204e6a93d517c3cbeee78a225b5490110fe6735c4c082dad3d57bab0636dcc93 authenticates77 artifacts,10 helpers and five final deliverables. Both actual original mathematical/publication verifier outputs were reproduced byte-for-byte. The mathematical handoff prefix through recovery instructions,whole actual recovery,verification,immutable and graph helpers were read before execution. The whole17newproofs and10newtests were read. Full6451-line native and7759-line canonical incoming prefixes are authenticated and preserved; they are not claimed as a fresh manual whole-line audit. Both complete extended files were replayed.

Own PR#6076 manifest5d80a54366399e2d3d7a45b602890357a50c3f16f030e3fadd381c9ad72b95b9 authenticates the original own Reading,InputGuard and candidate, plus the nested own6062/6053/6041 manifests and reading records. All four whole personal reading records were freshly read. OwnReadingReuse.json compares42 controls:37 unchanged and five advanced deliverables. All523own6076node objects are the exact incoming prefix. Only original own reading scopes on unchanged controls are reused.

Fresh contract reading includes all four complete reviewed parent Hodge AUDIT02 rows and review metadata,whole REV-AUDIT-02 report,complete reserved key and algebraicgeometry/higgs-parameter-connections entry,all five requests,all eleven gaps,latest three coverage frontier entries and complete current affinePullbackTower and affineDualPullbackEquiv construction nodes. The current H0description last8500characters includes the whole incoming6080 frontier; earlier own6076 description reading remains authenticated. The parent built Hodge objects are not replanned. The exact structured screen of127 research/data link and restructure JSON files found zero touching entries. TouchingLinkControls.json binds all screened bytes.

Native-prefix consumed scopes include1870–2075,2630–2720,5840–5898,30–88,310–365,5745–5772 and6240–6320, plus whole incoming new proofs/tests. Fresh pinned source reading includes whole Mathlib/LinearAlgebra/Dual/BaseChange.lean and Tower.lean30–110,310–400,414–460,646–714,730–750. Six consumed baseline rows are bound to exact index entries and source hashes; Module.Dual.congr and Module.Dual.baseChange_baseChange are newly listed. All12exact specialized names have zero literal matches in the two pinned Lean source trees, a bounded naming check rather than exhaustive generic-concept absence. All current proofs/tests were personally authored/reviewed, and all ten reused/adapted helpers were read whole.

The whole current displayed [ordinary connection section](https://stacks.math.columbia.edu/tag/07J5), proof and both comments, and the whole displayed [finite-projective evaluation lemma](https://stacks.math.columbia.edu/tag/0FNJ), three parts and proof diagram, were read. The latter has zero direct comments; linked categorical proofs and the two section15.74comments were not read. SourceReading.json binds actual HTTP bytes,hashes and access times. Original own historical07J5correction scope remains authenticated; both incoming source issues remain unchanged, with no new finding. The exact λ-dependent coherence equations are authored deductions, not claims that these source passages print them or that full-paper/version closure was audited.

## Validation

Both complete files compiled at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d. The whole suggested file is byte-equal to the compiled Mathlib-only Canonical.lean. Runs use the existing exact build after source/dependency/compiler checks,fresh memory≥20GiB,one thread,8192MiB managed-memory limit and1200-second timeout. Each completed before the next compiler,Lean edit or rebase. Context accelerated prototypes only; final Native replay elaborated all source. No Lake setup,library build,cache download or language server was used.

'''+compiled('Native')+compiled('Canonical')+f'''
All335native audits contain only propext,Classical.choice and Quot.sound,with zero admissions,errors,warnings or sorryAx references. Canonical has918admission warnings only:896inherited and22new explicit lemma/example admissions. All12declaration and10test headers match the admitted projection. No data construction is introduced. Suggested.lean SHA256 `{sha((S/'Suggested.lean').read_bytes())}`. This certifies affine artifacts only; no implementation status or global/source coverage is promoted.

The actual indexed blueprint checker,source-issue checker,immutable intake/file rules and atlas assembler pass. Packet552nodes,279baseline declarations,{sum(len(n.get('api',[]))for n in p['nodes'])}raw API references,{sum(len(n.get('tests',[]))for n in p['nodes'])}raw test references. Stage DAG{g['stageDAG']['vertices']}/{g['stageDAG']['edges']},own declaration DAG{g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']},scoped DAG{g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']}; all acyclic. There are{g['reachableDeclarations']}reachable declarations,{g['baselineLeaves']}baseline leaves and all{g['requiredPairs']}supplier pairs are reachable. Whole foreign roadmap/stage objects and all stage edges equal immutable controls; no own skipped/pending link exists.

Mathematical base `{t('base.txt').strip()}`; publication base `{t('publication-base.txt').strip()}`. All42guarded inputs and127screened link files agree between them; PublicationChanges.json records the queue/other-job refresh. The mathematical issue contract is unchanged. Declaration-index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Actual public HTTP recovery and both exact immutable verifier outputs must be checked before opening the PR. The verifier executes the real checker,intake and atlas code without Lean or a repository snapshot.

## Resume

Continue three-step coherence for the actual dual comparison using the whole identity/two-step equivalence and horizontal equations, then categorical coevaluation/rigidity on the existing finite-projective objects. Import the already-native generic covector tower law,duals and tensor-Hom maps. Continue universal exterior-power comparison and the actual E1 sheaf restriction,tensor identification,equality detection and effective gluing. Preserve dλ=0 in the reserved global finite locally free integrable key and all149routes,35omissions,five requests,eleven gaps,two source issues and later source/stage obligations.
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
assert len(old['nodes'])==540 and len(p['nodes'])==552
assert p['nodes'][540:]==data('NewNodes.json')and set(p)==set(old)
for before,after in zip(old['nodes'],p['nodes']):
 expected=json.loads(json.dumps(before));nid=before['id']
 if nid in plan['apiAdditions']:expected['api']+=plan['apiAdditions'][nid]
 if nid in plan['testAdditions']:expected['tests']+=plan['testAdditions'][nid]
 assert after==expected,nid
assert sum(a==b for a,b in zip(old['nodes'],p['nodes']))==539
for k in old:
 if k not in ['nodes','summary','sources','coverage','gaps','verification','baseline','sourceIssues']:assert p[k]==old[k],k
assert p['baseline']['declarations']==old['baseline']['declarations']+plan['newBaseline']
assert {k:v for k,v in p['baseline'].items()if k!='declarations'}=={k:v for k,v in old['baseline'].items()if k!='declarations'}
assert [x['ref']for x in p['baseline']['declarations'][277:]]==plan['newBaselineRefs']
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
assert incoming['head']=='4a305ef97955838ddb4f14371f95b4931d269ba2'and incoming['artifactsVerified']==77 and incoming['archivedHelpersVerified']==10
assert sha((S/'IncomingManifest.json').read_bytes())=='204e6a93d517c3cbeee78a225b5490110fe6735c4c082dad3d57bab0636dcc93'
assert (S/'PreviousVerification.json').read_bytes()==(S/'IncomingPublicationVerification-replayed.json').read_bytes()
for name,prefix in [('Native.lean','NativePrefix.lean'),('Canonical.lean','CanonicalPrefix.lean')]:assert im[name]['sha256']==sha((S/prefix).read_bytes())
for path,n in zip(paths,['Incoming-roadmap.json','Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert sha((S/n).read_bytes())==incoming['publicDeliverables'][path]
assert text('Incoming.lean')==text('CanonicalPrefix.lean')
own=data('OwnReadingReuse.json');assert len(own)==42 and sum(g['unchanged']for g in own)==37
om=data('OwnPreviousManifest.json')
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='5d80a54366399e2d3d7a45b602890357a50c3f16f030e3fadd381c9ad72b95b9'
for n,orig in [('OwnPreviousReading.json','Reading.json'),('OwnPreviousInputGuard.json','InputGuard.json'),('OwnPreviousCandidate.json','Candidate.json')]:assert sha((S/n).read_bytes())==om[orig]['sha256'],n
for n in om:
 if n.startswith('Own6062'):assert sha((S/n).read_bytes())==om[n]['sha256'],n
assert old['nodes'][:523]==data('OwnPreviousCandidate.json')['nodes']
assert [{'path':g['path'],'sha256':g['previousSha256']}for g in own]==data('OwnPreviousInputGuard.json')
receipt=data('IncomingReceipt.json')
assert receipt['publicRecovery']==incoming and receipt['bothActualVerifiersMatchRecordedExactly'] and receipt['fiveMathematicalBaseFilesMatchPublicHead']
assert receipt['publicationVerificationSha256']==sha((S/'PreviousVerification.json').read_bytes())
assert receipt['mathematicalVerificationSha256']==sha((S/'PreviousMathematicalVerification.json').read_bytes())
for g in own:
 assert sha(blob(MATH,g['path']))==g['currentSha256']
 assert g['unchanged']==(g['previousSha256']==g['currentSha256'])
assert (S/'PreviousMathematicalVerification.json').read_bytes()==(S/'IncomingMathematicalVerification-replayed.json').read_bytes()
src=data('SourceReading.json')
for row,name in zip(src,['07J5.html','0FNJ.html']):assert sha((S/name).read_bytes())==row['sha256']
assert not plan['newSourceIssues']
claim=data('ClaimReceipt.json');assert claim['claim']==5982417744 and claim['confirmation']==5982418883
assert claim['wholeIssueCharacters']==22198 and claim['readBefore']==[[0,18000],[18000,22198]] and claim['readAfter']==[[0,22198]] and claim['beforeAfterEqual']
assert claim['bodySha256']=='43c656497ac194e02aa80ad85ad5579caf8bc5eb4d95cac4ff4c15e65eac3c69'
assert len(data('AbsenceSearch.json'))==12 and all(x['exactLiteralMatches']==0 for x in data('AbsenceSearch.json'))
assert [x['ref']for x in data('BaselineReading.json')if not x['alreadyPresent']]==plan['newBaselineRefs']
assert text('Native.lean')==with_imports(text('NativePrefix.lean'))+'\n'+text('NewProofs.lean')+'\n'+text('NewTests.lean')+'\n'+text('Audits.lean')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',text('Native.lean'))
from projection import project
assert text('NewAdmitted.lean')==project(text('NewProofs.lean')+'\n'+text('NewTests.lean'))
assert len(re.findall(r'\bsorry\b',text('NewAdmitted.lean')))==22
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
assert {**nh,**nt}==ch and len(nh)==12 and len(nt)==10
assert set(plan['newNames'])==set(nh)=={n['declaration']for n in p['nodes'][540:]}
new=p['nodes'][540:]
added_api=[x for xs in plan['apiAdditions'].values()for x in xs]
added_tests=[x for xs in plan['testAdditions'].values()for x in xs]
assert {t['name']for t in added_tests}==set(re.findall(r'^-- test: (.+)$',text('NewTests.lean'),re.M))
assert len(added_api)==len({x['name']for x in added_api})==12 and len(added_tests)==10
assert {x['name']for x in added_api}==set(plan['newNames'])
for x in added_api+added_tests:assert x['name']in text('Reader.md')and x['statement']in text('Reader.md')
assert data('TouchingLinks.json')==[] and len(data('TouchingLinkControls.json'))==127
for g in data('TouchingLinkControls.json'):assert sha(blob(MATH,g['path']))==g['sha256']==sha(blob(BASE,g['path'])),g['path']
for n in new:
 assert n['declaration']in text('Reader.md')and n['statement']in text('Reader.md')
 if n['kind']in ['definition','construction']:
  assert len(n['api'])>=3 and len(n['tests'])>=3 and n['uses']
 for k in ['api','tests']:
  for x in n.get(k,[]):assert x['name']in text('Reader.md')and x['statement']in text('Reader.md')
assert text('Audits.lean')=='\n'.join('#print axioms TauCeti.Hodge.ParameterConnection.Intrinsic.'+n for n in plan['newNames'])+'\n'
for name,warnings,examples,audits in [('Native.lean',0,184,335),('Canonical.lean',918,381,0)]:
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
print(json.dumps(dict(checker=summary,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,wholeIncomingNodesUnchanged=539,preservedMathematicalContracts=540,newNodes=12,newAPIReferences=12,newDistinctAPI=12,newTestReferences=10,newDistinctTests=10,matchedNewHeaders=len(ch),rawAPIItems=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),compilation=p['verification']['compilation'],inputGuards=len(data('InputGuard.json')),indexSha256=sha(Path(sys.argv[2]).read_bytes()),mathematicalBase=MATH,immutableBase=BASE,graph=graph,fullCanonicalCompiled=True,sourceScope='Whole current Stacks07J5 section/proof/comments and0FNJ lemma/proof; linked categorical proofs and section15.74 comments not recursively read. Both inherited source issues preserved. Authored affine dual identity/two-step tower deductions; no whole-paper/version closure.',LeanExecuted=False),indent=2))
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
result=subprocess.run(['/usr/bin/time','-v','timeout','1200',str(lean),'-j','1','-M','8192']+extra+[str(out/name)],env=env,cwd=out)
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
IncomingPublicationVerification-replayed.json PreviousMathematicalVerification.json IncomingMathematicalVerification-replayed.json NativePrefix.lean CanonicalPrefix.lean
Native.lean Native.log Native.receipt.json Canonical.lean Canonical.log Canonical.receipt.json
NewImports.lean NewProofs.lean NewTests.lean NewAdmitted.lean Audits.lean Candidate-roadmap.json Candidate.json Reader.md ReaderAddition.md Suggested.lean Handoff.md HandoffBase.md
07J5.html 0FNJ.html Prototype.lean Prototype.log Prototype.receipt.json Context.lean Context.log Context.receipt.json
ClaimReceipt.json Reading.json SourceReading.json BaselineReading.json AbsenceSearch.json Worklist.json
OwnPreviousManifest.json OwnPreviousReading.json OwnPreviousInputGuard.json OwnPreviousCandidate.json Own6062InputGuard.json Own6062Manifest.json Own6062OwnInheritedInputGuard.json Own6062OwnInheritedManifest.json Own6062OwnInheritedReading.json Own6062OwnPreviousInputGuard.json Own6062OwnPreviousManifest.json Own6062OwnPreviousReading.json Own6062Reading.json OwnReadingReuse.json IncomingReceipt.json AuditRows.json TouchingLinkControls.json
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
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED AFFINE DUAL COHERENCE PAYLOAD\n'+pb+b'END ARCHIVED AFFINE DUAL COHERENCE PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('roadmaps','Candidate-roadmap.json'),('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated affine finite-projective dual coherence evidence; never executes Lean."""
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
pb=raw.split('/- BEGIN ARCHIVED AFFINE DUAL COHERENCE PAYLOAD\\n',1)[1].split('END ARCHIVED AFFINE DUAL COHERENCE PAYLOAD -/',1)[0].encode()
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

Serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Canonical.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean and Suggested.lean are byte-equal and the whole file was compiled. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

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
