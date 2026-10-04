# BP-AlgebraicModuliForArithmeticGeometry--A0-extension: self-Hom sheaf coherence

Codex — codex-7e92bd · 3 October 2026 · Refs #672 · **partial**.

This checkpoint adds eight lemmas, eight API entries and six typed checks. The general F→G section-transport formula identifies the existing sheaf base-change map with inverse source comparison, transported section and the image under X of the target comparison. For a fixed-band self transformation X:F→F, this is precisely the existing self-transport action. Its independence of the connecting isomorphism provides a useful arbitrary-choice version and a comparison for equal base arrows using the actual Over.homMk identity map.

The identity law is equality of actual sheaf isomorphisms: compare along 𝟙_U, then transport the local object along F.mapId(x); the result is the component of the native overMapPullbackId at H_U(x,x;X). The composition law starts at g⁎f⁎H_U: apply the native overMapPullbackComp(g,f), comparison along g≫f and object transport along F.mapComp(f,g)(x). This equals g⁎ of comparison along f followed by comparison along g at F(f)x. Neither the Over comparison nor the object comparison is suppressed. The proof identifies both section maps through actual fibre isomorphisms and uses abelian-band self-transport independence. It does not assume a strict pseudofunctor.

Both laws lift to equalities of native natural isomorphisms on HomCategory(b,b), retaining every actual modification, functor associator, right unitor and whiskering map. These self-gerbe laws do not yet give general F→G two-object endpoint coherence. The coefficient sheaf lives in independent universe w; no terminal object, neutrality, chosen global section or global nonemptiness is assumed.

The six parameterized checks cover the real inverse identity and composition arrows, arbitrary replacement of the target connecting isomorphism, native modification naturality, preservation of the same coefficient in A(T) under two comparisons, and preservation of the composition equality after a third arbitrary native pullback. The last is stability under third pullback, not a new proof of the full descent pentagon. No concrete nonconstant-site or nonneutral geometric fixture is added.

All 542 incoming mathematical contracts are retained; 538 complete node objects are byte-for-byte equal as JSON values. Two torsor-comparison parents receive prerequisites and a proof step. The existing base-change construction and natural-isomorphism nodes receive appended API and test entries, with their old entries and every other field unchanged. There are 550 nodes, 502 raw API entries and 505 raw tests. All ten gaps,22 requests,eight source issues,ten planets and eight partial stages remain; every implementation status is unchecked and no stage is closed. The complete incoming reader and Tau Ceti-import suggested file are retained verbatim, with the reader addition prepended and new planning projection appended.

## Reading and provenance

The whole 44,034-character issue was read before claiming. Claim 5974480006 won according to bot 5974480925; the re-fetched issue body is byte-identical, SHA256 76b4b208fdc2daf287aff24fff621ad30741280c84a8c35c7f6ac34c2ea459af. The complete incoming handoff and public recovery script were read. [Peer PR6026](https://github.com/CBirkbeck/tauceti-explorer/pull/6026), head 050f614e9b816bb060dbde8421112d672f6b820d and archive 98b2dde6025c92ff5040d09687752aaf63fdca97, was publicly recovered: 45 artifacts, nine helpers and four final deliverables. Its actual recovered immutable verifier reproduced Verification.json byte for byte. The four incoming deliverables match the recorded mathematical base.

Own continuous-session readings from [PR6019](https://github.com/CBirkbeck/tauceti-explorer/pull/6019) are reused at all 51 unchanged controls: governing protocols,twelve reviewed audit rows,the campaign reader,accepted RS27 decisions/reviews,prescribed red-team repairs,reserved ownership,consumed upstream readers and touching links. PriorOwnReading.json records both hashes and exact equality; Reading.json distinguishes inherited scopes from fresh work. Whole-file hashes do not claim fresh whole-file reading. Peer6026's reading claims are preserved as provenance, not attributed to this worker.

Fresh readings include peer6026's complete twelve new proofs and seven tests, the consumed earlier restriction identity/composition/naturality and section/object transport declarations, all ten current gap contracts and torsor-related requests. All 22 requests are preserved. Other inherited proofs are authenticated and recompiled, not newly reviewed line by line. SFBoundary.json binds the complete current SF.1 nodes,coverage,requests and sourceWorklist, unchanged from peer6026's boundary; SF.1 remains not_read.

Fresh primary source readings are the complete mathematical [Stacks definition of a gerbe,06NZ](https://stacks.math.columbia.edu/tag/06NZ), and text of [Olsson’s notes](https://stacky.net/files/written/Stacks/Stacks.pdf), Definition31.1,Remark31.2, complete displayed Lemmas31.3/31.4 and proofs,Remark31.5 and the displayed31.6 argument including its explicit incompleteness warning, printed122–124. No rendered-page or full classification-source reading is claimed; the warned argument is not repaired here. SourceReading.json records the freshly fetched PDF hash and access time; no PDF is retained. Exact native coherence equations and proofs are authored deductions motivated by local compatibility, not quoted source theorems.

Reading.json records exact pinned files and consumed line ranges. Native Hom sheaves,slice pullbacks and their comparison isomorphisms,Over arrows,strong transformations,modifications,action carriers,whiskering and functor unitors/associators are imported rather than replanned. Six new baseline references name overMapPullbackId,overMapPullbackComp,isoWhiskerLeft,isoWhiskerRight,rightUnitor and associator; Over.homMk was already audited in the incoming baseline. Search.json records bounded exact-name searches in current packets,pinned Mathlib CategoryTheory and pinned Tau Ceti AlgebraicGeometry, with no new-name matches. This is not a comprehensive absence certificate or a fresh online PR/Zulip survey.

## Validation and limits

Pins: Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and TauCeti f790474821cf4256814db967cb154e7af3d0c369. The full Tau Ceti-import Suggested.lean is **UNCOMPILED**: the available Tau Ceti checkout has different HEAD cf386627e9176a3827c1a5fe804989fd94a4d216 and lacks the required imported oleans. Canonical.lean below is the full inherited **Mathlib-only projection**, not the complete Tau Ceti suggested file.

Both Lean checks ran serially using the existing exact Mathlib build,one thread, 8GiB memory limit and 1200-second timeout. No Lake setup,cache download,library build or language server was used. Neither check remains running.

- Native.lean: 2683 lines,99 examples,exit0,0 warnings (0 admission warnings),143 axiom audits; 41GiB available immediately before compilation,elapsed14.26 seconds,peakRSS2266348KiB. Source SHA256 `187ba91dab2a7f3e357490bbea662b146b62067cd9967790f33b2d731a56e98f`; log SHA256 `161dbed50e15af4b46f6c6a5e3fe9dc45ec035717d336181f229b805dd116302`.

- Canonical.lean: 6427 lines,360 examples,exit0,803 warnings (803 admission warnings),0 axiom audits; 41GiB available immediately before compilation,elapsed24.87 seconds,peakRSS3741648KiB. Source SHA256 `694e2cbd9eeea1ba5086ddc89da5286363019e021e69514183922e328a5d8b6d`; log SHA256 `f0d0eecfad39e9df403ff73a614c85ab34c52e7d753271be842d7fd91913d6eb`.

The native file retains the complete 2370-line incoming proof prefix,then appends eight proved lemmas,six checks and eight axiom audits. It contains no admission or declared axiom; all 143 audited closures use only propext,Classical.choice and Quot.sound,with no sorryAx. The new planning projection preserves every statement and admits eight lemma bodies and six test bodies. The 14 new admission warnings join 789 inherited warnings for 803,with no other warning. Projection equality,exact incoming prefixes,all new declaration headers,example counts and source/log receipts are mechanically checked. These results do not change planning implementation statuses.

The actual indexed checker passes:550 nodes,494 API items,472 definition tests,219 baseline references,zero closed stages; no errors or warnings. Actual source-issue/version and intake checks pass. Immutable atlas assembly is acyclic:stage 3017/8655,own declarations 550/1175,scoped 3560/10448 vertices/edges. All 24 required pairs and 40 accepted touching restructure pairs are reachable,with no unresolved leaves or own skipped/pending links. All stage edges,foreign roadmap/stage objects and sibling parts remain unchanged. All 51 control hashes match at both recorded bases; the complete SF.1 boundary is preserved.

Mathematical base `330194a0035ea095988b27958b13bb62d368823f`; publication control `8da7bfc6382725e4efa40e1435bee348f848f97c`. Verification-math.json and Verification.json record the actual immutable checks. Declaration-index SHA256 `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`. Full suggested-file SHA256 `ae8882038dfd4e013f91cf3b332e0edfdb136129024d9bfc7eda8e837aef77db`.

## Resume

Continue from R09.4/sheaf-coherence/unit,composition,natural-unit,natural-composition and the existing sheaf-base-change family. Supply general two-gerbe endpoint transport and its coherence where required. For the self-gerbe comparison,supply actual local-object covers,overlap refinements and gluing of sheaves,actions and maps. Package using D0's supplied torsor groupoid,prove full faithfulness and construct a coherent inverse/unit/counit before claiming the self-equivalence/torsor equivalence. Import the existing principal-sheaf comparison; do not replace supplier obligations by records assuming the desired conclusion.

Instantiate the comparisons on nonconstant-site and nonneutral geometric fixtures,retaining empty-section behavior and the independent coefficient universe. All intrinsic descended-band/SF1,nonneutral root-gerbe,derivedH²,compatible fpqc-limit,source-issue and other-stage obligations remain. Historical frontier entries are preserved; the new self-gerbe laws discharge only the precise bounded portion stated here.

## Public recovery and replay

Archive commit `7105445eba84506b94b06374c6451ea9c5ed7384` is an ancestor changing only this issue's suggested file. Its 50 inert artifacts include all 9 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `0da64cee8207b3b41326c932723ddd8d610a247b1d82e83269a12eff214c4e59`; payload SHA256 `8550f1aaf8e198261c69940ae6ad5f9b031e7dfdba306cf43c8af63ccf58b65d`. The final suggested file has no archive payload and preserves the complete Tau Ceti-import planning text.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and four final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set MODULI_VALIDATE_BASE to the mathematical base to reproduce Verification-math.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Canonical.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean is the Mathlib-only projection; Suggested.lean is the complete uncompiled Tau Ceti-import file. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

```python
"""Recover public authenticated Self-Hom sheaf coherence evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='AlgebraicModuliForArithmeticGeometry--A0-extension'
ARCHIVE='7105445eba84506b94b06374c6451ea9c5ed7384'
MANIFEST_SHA='0da64cee8207b3b41326c932723ddd8d610a247b1d82e83269a12eff214c4e59'
PAYLOAD_SHA='8550f1aaf8e198261c69940ae6ad5f9b031e7dfdba306cf43c8af63ccf58b65d'
EXPECTED={'packets': 'd8e867db3cb9dcf19907e9b537e37bb225eabdd6a4d74284735090f0fa88ea0d', 'readmes': 'abc618e55ed850dac68f84af81a5093c2127dcb5d6f0b5399b67dc36cf96c594', 'suggested': 'ae8882038dfd4e013f91cf3b332e0edfdb136129024d9bfc7eda8e837aef77db'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED SELF HOM SHEAF COHERENCE PAYLOAD\n',1)[1].split('END ARCHIVED SELF HOM SHEAF COHERENCE PAYLOAD -/',1)[0].encode()
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
