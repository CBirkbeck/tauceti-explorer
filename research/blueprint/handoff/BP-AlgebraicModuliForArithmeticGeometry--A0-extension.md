# BP-AlgebraicModuliForArithmeticGeometry--A0-extension: general base-change coherence

Codex — codex-7e92bd · 4 October 2026 · Refs #672 · **partial**.

Six new lemmas complete the unit and composition API of the existing general F→G Hom-sheaf base-change comparison. The identity law compares along 𝟙_U, then transports the two endpoints along the separate F.mapId(x) and G.mapId(y). The result is the component of native overMapPullbackId at H_U(x,y;X). The composition law starts at g⁎f⁎H_U: use native overMapPullbackComp(g,f), comparison along g≫f, then endpoint transport along F.mapComp(f,g)(x) and G.mapComp(f,g)(y). This equals g⁎ of comparison along f followed by comparison along g at F(f)x,G(f)y. Both are equalities of actual sheaf isomorphisms; neither endpoint nor the Over comparison is erased.

The proofs expand actual native section maps, use the strong-transformation identity/composition equations to cancel the F comparison factors, and apply the native G unit/associativity identities. The equality-transport 2-cells are combined with map₂_comp and map₂_id. The composition proof finishes with naturality of G.mapComp(g,t) at the actual restriction isomorphism. It does not use self-gerbe independence or assume strict pseudofunctors. Strictness used for the source LocallyDiscrete bicategory leaves all F/G comparison data present.

Both laws lift to equalities of natural isomorphisms on the actual HomCategory(bF,bG), retaining every modification, functor associator, right unitor and whiskering map. Two inverse lemmas reverse all factors. The coefficient sheaf has independent universe w. There is no terminal-object, global-section, neutrality or nonempty-section assumption.

Eight parameterized typed checks cover: inverse unit order on actual sections; round trip using all three inverse composition factors; arbitrary modification naturality through the iterated comparison; the same coefficient a∈A(T) under two restrictions; equality after a third native pullback; an unbalanced target-endpoint non-example; empty iterated section spaces; and exact specialization to the existing self-gerbe composition law. The non-example proves that adding an independently chosen target automorphism that stays nonidentity under G(t) changes every supplied section after the correctly adjusted unit comparison. Third-pullback stability is not a claim of the full descent pentagon. No concrete nonconstant-site or nonneutral geometric fixture is constructed.

All 566 incoming mathematical contracts are preserved. Exactly two existing comparison nodes receive appended API/tests; all other fields and old entries remain unchanged, and 564 complete node objects are equal. There are 572 nodes,522 raw API entries and522 raw tests. All ten gaps,22 requests,eight source issues,ten planets and eight partial stages remain. Every implementation status is unchecked; no stage closes. The entire incoming reader and full Tau Ceti-import suggested file remain verbatim prefixes (reader addition prepended). Earlier open-coherence statements remain as historical checkpoints; this addition resolves only their named general unit/composition portion.

## Reading and provenance

The entire 44,034-character issue was read in five slices before claiming. Claim5976080766 won according to bot5976081585; the issue body was unchanged after confirmation, SHA25676b4b208fdc2daf287aff24fff621ad30741280c84a8c35c7f6ac34c2ea459af. The current complete handoff narrative and public recovery helper were read. [Peer PR6038](https://github.com/CBirkbeck/tauceti-explorer/pull/6038), head05cf027fbb5945e485bd6d37f01466fff54c59a7 and archive1e6463e2f7d9a63877bbd18cdcd827b109d30f2c, was recovered over public HTTP:54 authenticated artifacts,nine helpers and four deliverables. Its actual recovered immutable verifier reproduced Verification.json byte for byte. IncomingManifest.json binds that evidence with SHA256daf905c2872086cdf1ef35a52041279c7c84c583ae4e38c4681703fb0c0d3d15.

Own continuous-session readings from [PR6034](https://github.com/CBirkbeck/tauceti-explorer/pull/6034) are reused at all51 unchanged external controls: protocols,twelve reviewed audit rows,campaign reader,accepted restructure and red-team decisions,reserved ownership,consumed upstream readers and touching links. OwnPreviousReading.json preserves their exact earlier scope; PriorOwnReading.json records before/after hashes. OwnPreviousManifest.json authenticates those records. Whole-file equality does not imply a new whole-file manual reading. Peer6038 reading claims are provenance, not this worker’s reading claims.

Fresh readings include all16 incoming new proofs and nine tests, the consumed native restriction/section/base-change/coherence blocks recorded by range in Reading.json, the current reserved gerbe contract/API/tests, two comparison parents, latest R09.4 frontier, all eight current source-issue objects and version envelope. Other inherited proofs are authenticated and recompiled, not newly reviewed line by line. Current gaps,requests and other top-level contracts were compared to own6034 and are retained. SFBoundary.json binds the unchanged SF.1 nodes,coverage,requests and sourceWorklist; SF.1 remains not_read. The current peer verifier, immutable helper, graph, projection, assembly and compilation helpers were read before reuse.

Fresh primary source reading covers the complete displayed [Stacks Section8.11, tag06NY](https://stacks.math.columbia.edu/tag/06NY): definitions,Lemmas8.11.2–8.11.8 with proofs and diagrams,and both comments. SourceReading.json records the retrieved bytes’ hash and time; no HTML snapshot is retained. This supplies gerbe conventions and local compatibility context. The exact native coherence equations and proofs are authored deductions. The inherited projection-label correction E6 remains visible and is retained; no new source error is asserted. The omitted general base-compatibility argument does not close the SF1 obligation. No exhaustive source or errata closure is claimed.

Reading.json records exact pinned native source hashes and consumed ranges. Nine new baseline entries import four pseudofunctor unit equations,two associativity equations,Cat.Hom₂.comp_app and the existing PrelaxFunctor and Bicategory.Strict data. Generated component/reassociated equations and structure fields are attributed to their actual indexed parent declarations. Generic native machinery is reused rather than introduced as new roadmap nodes. Bounded exact-name searches in pinned Mathlib,Tau Ceti and current packets found no proposed coherence names; this is not a comprehensive online PR/Zulip absence survey.

## Validation and limits

Pins: Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and TauCeti f790474821cf4256814db967cb154e7af3d0c369. Both pinned source checkouts were freshly verified tracked-clean. The full Tau-dependent Suggested.lean is **UNCOMPILED**. No complete exact-pin Tau build is available; the alternate TauCeti-adic build is at cf386627e9176a3827c1a5fe804989fd94a4d216 and lacks required imported oleans. Canonical.lean is the inherited Mathlib-only projection plus the new admitted lemma/test projection, not the full Tau-dependent suggested file.

Native and Canonical checks ran serially against the existing exact Mathlib build with one thread,8GiB limit and1200-second timeout. The runner verifies the pin,tracked cleanliness,existing compiled dependencies,Lean version and at least20GiB immediately before each run. No Lake setup,cache download,library build or language server was used. Neither compiler remains running.

- Native.lean: 3335 lines,116 examples,exit0,0 warnings (0 admission warnings),165 axiom audits; 51GiB available immediately before compilation,elapsed18.67 seconds,peakRSS2327212KiB. Source SHA256 `fbbf227cc48abf55fbeeaecb3cd195f1d95d778c864a36d13cb0619a826f1ff5`; log SHA256 `7a482c0feaa5c7558d615b8a32c9aee42be92a964a39657da7d26996bccba418`.

- Canonical.lean: 6898 lines,377 examples,exit0,839 warnings (839 admission warnings),0 axiom audits; 51GiB available immediately before compilation,elapsed26.57 seconds,peakRSS3784608KiB. Source SHA256 `8c22a9177da7c222d9e0179e84e468eab59294ba04c4fb19f6381121e2e7c0c0`; log SHA256 `0699fd6153a9ff8297a19e99c5e153b3c662847e867f1f9ac132bfd745913eb7`.

The native file retains the complete2996-line peer prefix,then adds six proved lemmas,eight typed checks and six audits. It has no admissions or declared axioms. All165 audited closures use only propext,Classical.choice and Quot.sound,with no sorryAx. The planning projection preserves every new statement and admits exactly six lemma and eight test bodies. Its14 new warnings join825 inherited warnings for839,with no other warning. Projection equality,incoming prefix hashes,all14 new headers,examples,audit closures and source/log receipts are checked mechanically. Compilation does not change the planning implementation statuses.

The actual indexed checker passes with572 nodes,514 API items,489 definition tests and228 baseline references; zero closed stages and no errors or warnings. Source-issue/version and actual intake checks pass. The immutable atlas is acyclic:stage 3017/8655,own declarations 572/1229,scoped 3582/10524 vertices/edges. All 24 required pairs and 40 accepted touching restructure pairs are reachable; no unresolved leaves or own skipped/pending links. Stage edges,foreign roadmaps/stages and sibling parts are unchanged. All61 controls match at both recorded bases,including the four incoming deliverables. The complete SF.1 boundary is preserved.

Mathematical base `ae66be0f71cd22be2804f8b420121e95e8640285`; publication control `06a7eaba33d1e9bb44a16665e05c71f29782d8cc`. Verification-math.json and Verification.json record the actual immutable checks. Declaration-index SHA256 `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`. Full suggested-file SHA256 `ede4c983c7bc3907cec01c71e213837002c65e90ff4c603a3161830ed0fee327`.

## Resume

Continue from R09.4/general-base-coherence and the existing endpoint-transport/sheaf-base-change families. Supply actual local-object covers,overlap refinements and gluing of sheaves,actions and maps. Package using D0’s supplied torsor groupoid,prove full faithfulness and construct a coherent inverse/unit/counit before claiming the global fixed-band morphism or self-equivalence/torsor equivalence. Do not replace supplier obligations by records that assume the desired conclusion.

Instantiate these comparisons on nonconstant-site and nonneutral geometric fixtures,retaining empty-section behavior and the independent coefficient universe. The intrinsic descended-band/SF1,nonneutral root-gerbe,derivedH²,compatible fpqc-limit,source-issue and other-stage obligations remain. The packet remains partial.

## Public recovery and replay

Archive commit `f6452553c43f8af669c4ed21790ca66be47c9976` is an ancestor changing only this issue's suggested file. Its 56 inert artifacts include all 11 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `bc24350852864995d87a1f842319f87e5882547ce4e9ab3e7a8e10f7ad2608af`; payload SHA256 `08b95e4a9f3f66372350bca15a01d5ecb6b2b2e060db18a22b04792f85dac16f`. The final suggested file has no archive payload and preserves the complete Tau Ceti-import planning text.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and four final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set MODULI_VALIDATE_BASE to the mathematical base to reproduce Verification-math.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Canonical.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean is the Mathlib-only projection; Suggested.lean is the complete uncompiled Tau Ceti-import file. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

```python
"""Recover public authenticated general Hom-sheaf coherence evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='AlgebraicModuliForArithmeticGeometry--A0-extension'
ARCHIVE='f6452553c43f8af669c4ed21790ca66be47c9976'
MANIFEST_SHA='bc24350852864995d87a1f842319f87e5882547ce4e9ab3e7a8e10f7ad2608af'
PAYLOAD_SHA='08b95e4a9f3f66372350bca15a01d5ecb6b2b2e060db18a22b04792f85dac16f'
EXPECTED={'packets': 'c61b13484bff774f8d0534a304281654721cb90c849608a71d804273383f79ec', 'readmes': '8657b8bcda294c833d245349632edd266b56ca6bc5e1abff07b9fd4f43c00660', 'suggested': 'ede4c983c7bc3907cec01c71e213837002c65e90ff4c603a3161830ed0fee327'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED GENERAL HOM SHEAF COHERENCE PAYLOAD\n',1)[1].split('END ARCHIVED GENERAL HOM SHEAF COHERENCE PAYLOAD -/',1)[0].encode()
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
for folder,ext,name in [('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','PublicHandoff.md')]:
 path='research/blueprint/'+folder+'/'+('BP-'if folder=='handoff'else'')+RID+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder]and b==(S/name).read_bytes(),path
 (S/name).write_bytes(b);public[path]=sha(b)
fence=chr(96)*3;handoff=(S/'PublicHandoff.md').read_text()
assert handoff.startswith((S/'HandoffBase.md').read_text())
code=handoff.split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from public handoff.'
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
