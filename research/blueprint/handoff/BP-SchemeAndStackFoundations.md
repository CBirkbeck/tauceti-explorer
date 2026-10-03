# BP-SchemeAndStackFoundations: generic flat-annihilator checkpoint

Codex — codex-7e92bd · 3 October 2026 · Refs #642 · **partial**.

This continuation supplies the generic finite-module flat-annihilator equality requested by Neron Models Part II: for flat R→S and finitely generated M, the extension of Ann_R(M) equals Ann_S(S⊗_R M). Eight new declaration-sized steps use native ideals, modules, quotient maps and tensor products. They also establish the arbitrary-element formula, the unconditional forward inclusion and preservation of finite ideal intersections. The element formula needs no finite generation of M; the ideal-intersection formula needs no finite generation of its ideals and includes the empty family.

The proof identifies extension of an ideal with a native tensor image. The existing flat-kernel theorem transports membership into a vanishing condition. The action map on a spanning family has the module annihilator as its kernel; the pinned finite-product tensor equivalence compares those kernels after base change. Module.Finite.exists_fin supplies the finite family. This imports the generic kernel/product machinery instead of planning it again. All ring and module universes are independent, and zero rings are allowed.

Seven typed tests cover empty intersections, identity extension, the zero module and zero element, and nonzero nilpotent annihilators in Z/4 and its actual flat diagonal extension to Z/4×Z/4. For the actual quotient algebra Z/4→Z/2, the annihilator of the element2 extends to zero, whereas its tensor image has unit annihilator; these ideals differ. This counterexample concerns the element formula. It does not claim failure of the whole finite-module formula in that example.

All29 incoming node objects,14 API items,12 definition tests,8 gaps,62 source routes,12 unimplemented confirmed findings,6 reserved-key boundaries and inherited source issue E1 are preserved. The packet has37 nodes,19 raw test objects and4 planets, with zero closed stages; all implementations remain unchecked. SF.0 is partial and the other six stage statuses retain not_read. The complete incoming399-line canonical text is retained between new imports and appended declarations. The reader retains its entire incoming text after the new strand, with historical attribution intact.

## Reading and ownership

Freshly read the complete issue before claiming, then checked the winning bot confirmation and identical full issue body; full WORKERS; full incoming handoff and suggested file; all29 old node contracts and the three API/test-bearing objects; all eight gaps, coverage and baseline boundaries, source/version/E1 records, key and ownership boundaries. The entire old reader is preserved, not claimed freshly read end-to-end. Other governing protocols were fully read earlier in this continuous session and are byte-guarded.

Read all seven owned reviewed AUDIT-01 entries and its review; all seven own RS25 layer decisions, its roadmap decision and touching link records; seven atlas stages and38 stage-edge pairs; all six owned algebraic-geometry survey entries and owner/reserved records. The research and data survey files are byte-identical. Read all twelve applicable finding claim/evidence/fix entries; verifier confirmations retain inherited attribution rather than a fresh read claim. Read four touching research link entries from ModularCurves and AlgebraicCurves. Earlier full AlgebraicCurves/JacobianChallenge readings are reused under hashes. No fresh whole ModularCurves, StableReduction or RS25 family-report read is claimed.

Fresh primary readings are the complete statements and displayed proofs of [Stacks Lemma10.40.4](https://stacks.math.columbia.edu/tag/07T8) and [Lemma10.39.2](https://stacks.math.columbia.edu/tag/0BBY). SourceReading.json records exact HTTP byte hashes and access times without storing HTML. The finite ideal-extension form is an authored extension of the binary kernel argument; the arbitrary-flat-module IM formulation is not asserted. The native image, membership and generator adapters are explicit proof decompositions. Seven inherited source-version records and E1 remain unchanged, with two fresh lemma records appended. No fresh inherited-erratum or full-paper audit is claimed.

Reading.json records exact pinned source ranges and hashes. Twelve added baseline references resolve in the prescribed index, including the full indexed name TensorProduct.AlgebraTensorModule.rid_tmul. Bounded source and packet searches are leads, not a whole-library absence certificate. A current open Mathlib PR title search for annihilator returned no hits; no comprehensive PR/Zulip survey is claimed. The two complete Neron Part II SF.0 requests were read and remain byte-equivalent objects across the mathematical/publication bases. The generic result is owned here; the consumer still has to compare its actual quotient and conductor/sheaf maps. No new stage edge or consumer request is created.

Incoming [PR5785](https://github.com/CBirkbeck/tauceti-explorer/pull/5785), head e639ea3872b5de2626f712d9f9fe632b8979d2ea, was authenticated from immutable public raw URLs. All four incoming deliverables match the mathematical base. No private predecessor helper or finite-model script is required; IncomingReceipt.json records this provenance.

## Validation

Required pins: Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and TauCeti f790474821cf4256814db967cb154e7af3d0c369. All three checked files import only Mathlib. The entire final canonical suggested file compiles at the exact Mathlib pin; there is no Tau Ceti import or combined-build claim. Checks ran serially in the existing pinned build with38GiB available, one Lean thread,8GiB memory limit and1200-second timeout. No Lake setup, cache download, library build or language server was used.

- Native.lean: 231 lines,7 examples,exit0;0 warnings (0 admission warnings),8 axiom audits,peak RSS2330640KiB. Source SHA256 `f95239ee975c46211b9e3c7aac509c42c07d23e3ac5f1c7ce7aec31238cecaeb`; log SHA256 `11f761f0b85bbf449f1686cdf2ba0e0c71650022e44af7e9a5efff6ec57aa81d`.
- Canonical.lean: 508 lines,28 examples,exit0;55 warnings (55 admission warnings),0 axiom audits,peak RSS2889232KiB. Source SHA256 `1a0739cfa2b6336e17b365da7b0a27606e4b6406cd73ca3dccb2426880e54a10`; log SHA256 `28c9736e35b9fc98a2b2becfa1111fd298099b66f0d1005c6c72eca991bb6f58`.
- Sketch.lean: 514 lines,28 examples,exit0;55 warnings (55 admission warnings),5 axiom audits,peak RSS2890244KiB. Source SHA256 `872aeb0a21b69a8ca215a54b55995f093a3db630755f4e299788e145bd9b09df`; log SHA256 `4b7e69ed0b48d0cc560a9c74284920c934741702eecc5e2b020a4e05e4900ef7`.

Native.lean proves the eight new statements and seven tests with no admissions or warnings. Its eight named theorem axiom closures use only propext, Classical.choice and Quot.sound. Sketch.lean is the exact canonical file plus five audits of the inherited etale-section/lift-uniqueness proofs; those closures also have no admitted dependency. Canonical.lean has55 expected admitted-declaration warnings, including the40 inherited ones; the planning file is not an implementation claim. All eight new declaration and seven test headers match their admitted projections exactly.

The real indexed packet checker reports37 nodes,14 API items,12 definition tests,69 baseline references,4 planets and zero closed stages, without errors or warnings. The raw test-object count is19 because the seven new tests belong to a theorem. Actual source-issue/version and intake authorization/file checks pass. The real immutable atlas assembly has acyclic stage3011/8642, own declaration37/72 and scoped3044/8749 vertex/edge counts. All six inherited own required pairs and27 touching accepted restructure pairs are reachable. There are no unresolved leaves or own skipped/pending links. The new theorem adds one own planet stage. All stage edges and all foreign roadmap/stage objects remain unchanged. The45 unrelated pre-existing missing restructure paths are recorded, not claimed fixed.

Mathematical base `626583deb292902c5cb8b8749e908f9d342426b2`; publication control `631e9fcb88488b4326b2833e3e9edb8de127c020`. All27 guarded inputs and both consumer-request objects agree between the bases. The pinned declaration-index SHA256 is `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`. Verification.json records the complete results.

## Resume

The generic flat-annihilator supplier now has eight declaration-sized nodes and seven typed boundary tests. Native proofs establish the finite-module identity, arbitrary-element identity, unconditional inclusion and finite ideal-intersection comparison using the pinned kernel and tensor APIs. The Neron Part II consumer must still identify the actual base-changed quotient algebra/module and conductor/sheaf maps; its multi-part SF.0 request remains open. All existing henselization, reserved-key, source-route and other-stage obligations remain unchanged.

For the immediate consumer, import SF.0/flat-annihilator and SF.0/flat-finite-ideal-intersections. First identify the actual base-changed finite quotient module with the quotient used to compute the conductor, then transport the full annihilator ideal. Do not replace a conductor by its radical or support, and keep empty and nonreduced boundaries. The general source theorem does not itself supply those canonical quotient identifications or a sheaf exact sequence.

For this roadmap, resume the existing henselization strand at lifted residue-selector quotient/localization coherence and the source etale criterion/universal cocone. The four finite-data adapter admissions, five unplanned reserved keys, all62 routed-paper decompositions, other stages and the conflicting alteration-owner recommendations remain open. The PerfectoidSpaces general-pair ownership consolidation remains unaccepted. This checkpoint closes none of those obligations.

## Public recovery and replay

Archive commit `65fc75c0e954ff6fc61225dcf452131c9d272f6c` is an ancestor touching only this issue’s suggested file. Its41 inert evidence artifacts include all8 authoring, projection, verifier, graph and compiler helpers. Manifest SHA256 `117c9a6f8907d8586f212cceb10bca2a69dd0881e7f7bf97064b1d377ffbce9d`; payload SHA256 `6eedda3e3dedd8733339c64396efb17ab2bf08466fa8bcd520ad1c2ae259eddb`. The final suggested file is exactly the compiled Canonical.lean, without the archive payload.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and all four final deliverables, authenticates artifact hashes and sizes, binds this handoff’s mathematical prefix, and checks its own code against the public handoff. Inspect the recovered scripts. From an existing repository checkout containing the two bases above, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX` with the prescribed pinned declarations.tsv. REPLAY_DIR must be outside the checkout. The verifier runs actual immutable checker, intake and graph code without running Lean or creating a repository snapshot. Its report should equal Verification.json.

Optional serial compilation replay, only in an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, then the corresponding Canonical.lean and Sketch.lean runs, waiting for each to finish before starting the next. The runner checks the Mathlib and dependency pins, tracked cleanliness, compiler version, free memory≥20GiB and timeout. Unlike a partial sketch alone, Canonical.lean is the entire final suggested file. Diagnostic hashes describe the recorded runs; elapsed time and resource statistics vary on replay.

Public HTTP recovery and verification at the final immutable head are checked before submission. Disposable scratch is removed after the PR opens; only handoff-linked replay evidence is retained.

## Script: recover.py

```python
"""Recover public hash-authenticated flat-annihilator evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='SchemeAndStackFoundations'
ARCHIVE='65fc75c0e954ff6fc61225dcf452131c9d272f6c'
MANIFEST_SHA='117c9a6f8907d8586f212cceb10bca2a69dd0881e7f7bf97064b1d377ffbce9d'
PAYLOAD_SHA='6eedda3e3dedd8733339c64396efb17ab2bf08466fa8bcd520ad1c2ae259eddb'
EXPECTED={'packets': '58f5ecc0c460ac5552c9f36fe7063f9a74d2f5620c35e4f936505558d501942d', 'readmes': 'dd39691d1264d96c1987934ce4959ede0f008bfee8437603dfdfecd5111bfbb3', 'suggested': '1a0739cfa2b6336e17b365da7b0a27606e4b6406cd73ca3dccb2426880e54a10'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=(raw.split('/- BEGIN ARCHIVED FLAT ANNIHILATOR PAYLOAD\n',1)[1].split('END ARCHIVED FLAT ANNIHILATOR PAYLOAD -/',1)[0]).encode()
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
for folder,ext,name in [('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','Handoff.md')]:
 path='research/blueprint/'+folder+'/'+('BP-'if folder=='handoff'else'')+RID+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder],path
 (S/name).write_bytes(b);public[path]=sha(b)
(S/(RID+'.json')).write_bytes((S/'Candidate.json').read_bytes())
assert (S/'Suggested.lean').read_bytes()==(S/'Canonical.lean').read_bytes()
fence=chr(96)*3;handoff=(S/'Handoff.md').read_text()
assert handoff.startswith((S/'HandoffBase.md').read_text())
code=handoff.split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from current public handoff.'
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=8,publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
