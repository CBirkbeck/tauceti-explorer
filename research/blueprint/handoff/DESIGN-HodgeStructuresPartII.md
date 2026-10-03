# Hodge Structures Part II — common-parameter tensor and affine pullback

Codex — codex-7e92bd · 3 October 2026 · Refs #3371 · **partial**.

Fourteen new lemma-sized steps identify the actual pullback of the tensor of two common-λ preconnections with the tensor of their actual pullbacks. The underlying module equivalence is Mathlib’s existing distribBaseChange. The unit comparison uses its existing right-unitor S⊗_R R≅S and retains the actual operator f(λ)dΓ. No new tensor/module/calculus carrier is introduced.

The proof tensors actual semilinearly horizontal maps, compares scalar units under tensor distribution, and uses uniqueness of affine pullback to obtain equality of preconnection structures. Both directions of the native equivalences are horizontal. Extended differentials and curvature commute with them, and the two S-connections have equivalent flatness. The comparisons need no d₀λ=0, flatness, bases, projectivity or finite generation. This is an affine tensor/unit comparison, not a complete categorical monoidal functor or a reflection of curvature from S to R. Universal exterior-power comparisons remain open.

Ten new API entries are consumed by the existing affine-pullback and semilinear-horizontal definitions. Eight typed tests include six parameterized checks and two concrete computations. For the actual ℤ→ℤ[x] calculus map, D=unit(2) is zero over ℤ, while the tensor of two pullbacks on (x⊗1)⊗(1⊗1) evaluates to2 under native unit/multiplication identifications, with2≠4. For the actual nonflat quotient ℤ→ℤ/2 and source Higgs scalar operator1 on each line, the tensor operator evaluates to2 over ℤ and the tensor of pullbacks to0 over ℤ/2. This is operator-value erasure, not a curvature-reflection counterexample. The separate flat-factor test explicitly assumes dΩλ=0.

All335 incoming mathematical contracts are preserved;331 whole node objects are identical. Two old objects receive only appended API/tests, and the two existing global tensor/pullback parents receive only appended prerequisites/proof steps. The reserved general finite-locally-free ringed-site key is unchanged. The packet retains all149 routed items,35 typed omissions, five supplier requests, eleven gaps, six planets and the EG20/E10 source issue/version envelope. H.0 is partial, H.1–H.8 remain not_read, and every implementation status is unchecked. No new planet is needed for these supporting affine comparisons. The reader retains its entire incoming text after the new continuation.

## Reading and provenance

Read the complete22198-character issue and checked exact whole-body equality after bot5972178498 confirmed claim5972177529. The whole incoming handoff was read. Authenticated [PR6014](https://github.com/CBirkbeck/tauceti-explorer/pull/6014), head7352a5e66f62da6d0ada30db7fd82032c6822c6f, through anonymous public raw URLs:74 evidence artifacts plus manifest and five deliverables. All five incoming files match the mathematical input. Its actual immutable verifier was executed and equals the published publication-validation.json. No private predecessor helper is needed for this checkpoint’s replay.

Fresh native reading covered the full14-declaration tower continuation and the consumed TwoForms, Preconnection, affine tensor, semilinear horizontal, affine pullback, module transport, extended-differential and curvature blocks. The complete inherited native prefix is authenticated and recompiled; that does not claim a fresh line-by-line audit of every historical proof. Read all five current supplier requests, the full reserved key, intrinsic tensor/pullback contracts and the existing API/test objects receiving additions. Historical coverage/gap collections were initially truncated; only displayed current frontier/status material is claimed freshly read, not the complete historical prose.

Own [PR6005](https://github.com/CBirkbeck/tauceti-explorer/pull/6005) control readings from this continuous session are reused at unchanged hashes: governing protocols, complete parent Hodge and Jacobian readers, four reviewed audit rows and REV-AUDIT02, key/survey/ownership records, nine original stage descriptions and five supplier descriptions. All29 own guards match. The predecessor’s37 input guards, including the actual checker/intake/assembler code, also match both current mathematical and publication inputs. Reading.json and PriorOwnReading.json distinguish fresh work from reuse and execution from manual review.

Fresh primary-source text: [Esnault–Groechenig, author printed23–24](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf), the parameter definition and complete printed Lemma4.9 proof; [Stacks §60.15](https://stacks.math.columbia.edu/tag/07J5), the complete section and Lemma60.15.1 proof. No rendered-page inspection, full-paper audit or new published-version collation was performed. Fresh source hashes are recorded without archiving source texts. The new arbitrary-ring formulas are authored deductions on the existing supplied calculus, not source-attributed theorems or crystal comparisons.

Pinned native tensor map, distribution and unitor definitions/evaluations were read. The only new baseline entry is the precise indexed AlgebraTensorModule.rid_symm_apply; existing tensor distribution, native semilinear map and tensor induction are reused. Bounded exact-name searches found no matching planned/pinned export. The existing λ=0 affineTensorField_baseChange is positive prior art. A current open-PR query for connection tensor returned only42744, whose complexification title is outside this construction; no exhaustive PR/Zulip or whole-library absence claim is made.

## Validation

Exact pins: Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; TauCeti f790474821cf4256814db967cb154e7af3d0c369. Both checked files import only Mathlib; the complete final suggested file equals Canonical.lean and compiles at the exact Mathlib pin. No combined Tau Ceti build is claimed or required by these imports. The old inert archive is recoverable at PR6014’s exact public head; it is not repeated in the final suggested text.

Checks ran serially in the existing pinned build, each with37GiB available, one Lean thread,8GiB managed-memory limit and1200-second timeout. No Lake setup/update/cache/library build or language server was started. These compilation processes have finished.

- Native.lean: 2599 lines,84 examples,exit0;0 warnings (0 admission warnings),132 axiom audits,peak RSS3643620KiB. Source SHA256 `8b4f294e90e7fc580f5648dc11e304219b2fc2a6484215f8a56bbc3d021012a0`; log SHA256 `738d7a07b01b02fdb86b3703fae1bba3a6334ca7d95243c5b1bb947073d72a67`.
- Canonical.lean: 4895 lines,281 examples,exit0;654 warnings (654 admission warnings),0 axiom audits,peak RSS3331632KiB. Source SHA256 `c47a98b8ac54de6692ace98ade41ede79a060e7f940037b92b31766ee3a49b57`; log SHA256 `7735d12653dda57891fa168dbb12d7adebfbb1f35e1001523d3ba927c3887e27`.

Native.lean retains the exact incoming native proof prefix after the new ZMod import and adds the14 proofs,eight examples and14 audits. All132 axiom closures use only propext, Classical.choice and Quot.sound; there are no admissions or warnings. Canonical.lean retains the entire incoming canonical planning text, adds the ZMod import and exact admitted projection of the22 new declaration/test headers, and has654 admission warnings only. No data/carrier definitions are admitted by the new projection. Every new header and projection is checked mechanically.

The actual indexed checker reports349 nodes (14 definitions,47 constructions,18 theorems,265 lemmas,5 comparisons),336 API items,307 definition tests,225 baseline entries,six planets and zero closed stages, with no errors/warnings. Raw counts are344 API entries and322 test objects. Source-issue/version and actual intake/file checks pass. Real immutable atlas assembly has acyclic stage3022/8663, own declaration349/693 and scoped3366/9749 vertex/edge counts. All21 required supplier paths hold; there are no touching accepted restructure pairs. No own unresolved prerequisite, skipped link or pending link remains. Every stage edge and every foreign roadmap/stage object is unchanged.

Mathematical input `d7e89e4714f7b70f6875565bd56a3a58a9d9ed71`; publication input `e3b7c8fd331e88b7ea0eea295395c7eac5495921`. All37 guarded inputs and all five incoming deliverables agree between them. The declaration-index SHA256 is `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`. Verification-math.json and Verification.json record actual results.

## Resume

Use the new affine-pullback-tensor-equality/horizontal/extension/curvature/flatness nodes and affine-pullback-unit-connection-equality/horizontal nodes. These supply the tensor/unit compatibility missing after the tower checkpoint, for arbitrary actual modules and parameter. Tensoring actual semilinearly horizontal maps is available independently of scalar extension.

Still supply universal exterior-power base-change and dual comparisons, identity and three-step categorical pullback coherence, then genuine E1 sheaf tensor/pullback restriction identifications, equality detection and effective gluing. Do not identify a sheaf tensor’s sections with a tensor of global sections or infer source curvature from nonfaithful scalar extension. The reserved general ringed-site key and all149 routed obligations,35 omissions, five requests, eleven gaps, determinant/Tate/period adapters, arbitrary-Q tensor-valued shuffle and H.1–H.8 remain open. Previous frontier prose is checkpoint history. No supplier is replanned or marked implemented here.

## Public recovery and replay

Archive commit `9db7fc26d846fb1f8d8db8d49feeb622c7d3f8be` is an ancestor touching only this issue’s suggested file. It stores42 inert evidence artifacts, including all8 authoring, projection, handoff, verifier, graph and compiler helpers. Manifest SHA256 `c6c71a5ea094f4dd0497e0780237df020e4591d96ec696b15a462b0323c62dfb`; payload SHA256 `c738d7e7ab0d426c10f9d6d56df52d65c0ab80b9e5edc620d650155d936eb836`. The final suggested file equals the compiled Canonical.lean and contains no archive payload.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It retrieves the immutable public archive and all five final deliverables, authenticates hashes, sizes and line counts, binds this handoff’s mathematical prefix, and checks its own code against the public handoff. Inspect the recovered helpers. From an existing checkout containing the two recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`, with the prescribed pinned declarations.tsv and REPLAY_DIR outside the checkout. The actual immutable checker, intake and atlas assembler run without Lean or a repository snapshot. The resulting report should equal Verification.json.

Optional serial compilation replay in an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, then the Canonical.lean command after it finishes. The runner checks pins, dependencies, tracked cleanliness, compiler version, memory≥20GiB and timeout. Diagnostic hashes authenticate the recorded runs; elapsed times and resource figures vary on replay. Canonical.lean is the entire final suggested file here.

Public HTTP recovery and recovered-verifier replay at the exact final head are checked before submission. Disposable scratch is removed once the PR opens, retaining only handoff-linked replay evidence.

## Script: recover.py

```python
"""Recover public hash-authenticated affine monoidal pullback evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='HodgeStructuresPartII'
ARCHIVE='9db7fc26d846fb1f8d8db8d49feeb622c7d3f8be'
MANIFEST_SHA='c6c71a5ea094f4dd0497e0780237df020e4591d96ec696b15a462b0323c62dfb'
PAYLOAD_SHA='c738d7e7ab0d426c10f9d6d56df52d65c0ab80b9e5edc620d650155d936eb836'
EXPECTED={'roadmaps': '0cb22cf6fb0fe56077e5dcc02fcff0c1ee5f55e64406c106e82fbc57cb87bf1d', 'packets': '4960830424326e7f978bb680246ddad0cb17caefd311f26b4e3ab207ed6c9bc3', 'readmes': 'a9ba324de179ff6397f816543168752745e8bb1b7fc09a1930eb872e182140f3', 'suggested': 'c47a98b8ac54de6692ace98ade41ede79a060e7f940037b92b31766ee3a49b57'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=(raw.split('/- BEGIN ARCHIVED MONOIDAL PULLBACK PAYLOAD\n',1)[1].split('END ARCHIVED MONOIDAL PULLBACK PAYLOAD -/',1)[0]).encode()
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
for folder,ext,name in [('roadmaps','json','Candidate-roadmap.json'),('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','Handoff.md')]:
 path='research/blueprint/'+folder+'/'+('DESIGN-'if folder=='handoff'else'')+RID+'.'+ext
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
