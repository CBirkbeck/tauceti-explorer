# BP-AlgebraicModuliForArithmeticGeometry--A0-extension: native local-object sheaf transport

Codex — codex-7e92bd · 3 October 2026 · Refs #672 · **partial**.

This checkpoint adds20 declarations (four constructions and16 lemmas),15 API items and12 typed tests for transport of the existing slice Hom sheaf between supplied local gerbe objects. At t:T→U, an isomorphism e:x≅x′ induces p ↦ F(t)(e⁻¹) ≫ p ≫ F(t)(X_U(e)). The native pullHom comparisons prove restriction naturality. Reversing e gives the actual inverse, and composition/identity hold as sheaf maps.

The strong-transformation restriction comparison identifies this sheaf map with the preceding fibre Isom transport. Its band-preserving independence proves equality for any two supplied connecting isomorphisms. The maps preserve the actual coefficient action and are natural in every native modification. They assemble into a natural isomorphism of sheaf-valued functors and then a functor from Mathlib’s existing Core(F(U)). Parallel core arrows have equal images; no local object or connecting isomorphism is selected. Coefficient universe w remains independent of the fibre-hom universe v′.

The12 parameterized tests cover automorphism-triviality, actual modification and inverse-modification squares, scalar compatibility, inverse round trips, empty section sets, choice independence, triple composition, actual Over-site restrictions, nonfaithfulness when distinct parallel arrows exist, and the native object/composition carriers. No fresh concrete geometric or nonconstant-site fixture was instantiated. Existing fibre transport and principal-sheaf comparison are reused; no generic core, torsor carrier or sheaf descent theory is replanned.

All510 incoming mathematical contracts are preserved.508 whole node objects are identical; only the prerequisites and proof outlines of the two existing torsor-comparison parents are appended. All10 gaps,22 requests,8 source issues,10 planets and8 partial stages remain. The20 additions are supporting gluing declarations, so no new planet is introduced. Every implementation status remains unchecked. The packet has530 nodes,484 raw API entries and492 raw test objects. The complete incoming reader and suggested-file text are retained, with the new Core import and appended admitted projection in the latter.

## Reading and provenance

Read the complete44034-character issue before claiming, and checked the exact same body after bot confirmation of comment5971828999 by5971830470. Read the whole incoming handoff. Authenticated [PR6011](https://github.com/CBirkbeck/tauceti-explorer/pull/6011), head17f8f3cee9e30e23caac1c030c812a549156fc68, archive88f47760c97bbdfcb5bf63a81bf32ff3d5a1e510:40 artifacts,6 helpers and4 final deliverables. Its actual immutable verifier was executed and reproduced its published publication-base report. All four incoming final deliverables match this job’s mathematical base.

Freshly read all preceding28 sheaf-assembly proofs, the consumed self-transport and restriction-comparison proof blocks, all10 current gaps, torsor-related requests, existing principal-sheaf comparison nodes, and D0/D3 carrier boundaries. The whole inherited native prefix was recompiled without admissions; this is not a claim of fresh line-by-line review of every historical proof, every one of the510 old declarations, or every inherited paper. The predecessor’s six helpers have been read; only the adapted seven helpers named in this checkpoint are required for replay.

The same continuous session’s earlier required control readings for [PR6002](https://github.com/CBirkbeck/tauceti-explorer/pull/6002) are reused with their exact scopes:12 own reviewed audit rows and REV-AUDIT01, campaign reader, accepted RS27 owned decisions/28owners/relevant links and complete repair review, all34 own touching links, reserved gerbe and survey/API, nine prescribed red-team records, complete AlgebraicCurves/JacobianChallenge readings and the specified ModularCurves supplier paragraphs. All52 controls matched at the mathematical base. At publication51 remain whole-file identical; own merged PR6017 changes SF.0 in the supplier packet. SFBoundary.json verifies unchanged complete SF.1 node/coverage objects and all supplier requests/sourceWorklist entries. SF.1 remains not_read. No new supplier closure is inferred.

Fresh primary-source text readings: [Olsson, printed122–123](https://stacky.net/files/written/Stacks/Stacks.pdf), including Definition31.1, Remark31.2, complete31.3/31.4 proofs and Remark31.5, plus only the visible beginning/incompleteness warning of31.6; [GWZ20, Definition2.6 and §2.2.1, printed514–515](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), through the automorphism-groupoid/torsor/transgression discussion. No rendered-page inspection or complete31.6 proof is claimed. SourceReading.json records fresh successful HTTP byte hashes without archiving the PDFs. The exact formulas and native coherence proofs are authored deductions. Inherited source-issue metadata remains attributed and unchanged; the new record uses the correct GWZ20 URL and exact Mathlib pin.

Fresh pinned source ranges and hashes are in Reading.json: IsPrestack.lean20–180, Bicategory/Functor/Cat.lean24–100 and Core.lean1–95. The native Hom sheaf, pullHom and flexible composition comparisons are reused. The two added baseline declarations are Core and CoreHom. Bounded exact-name searches of current packets and pinned Mathlib/TauCeti found no matching selfHomSheafTransport/selfHomSheafObjectFunctor export. Earlier PR/Zulip observations are inherited context, not a fresh comprehensive online search or library-absence certificate.

## Validation

Required pins: Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and TauCeti f790474821cf4256814db967cb154e7af3d0c369. The complete Tau Ceti-import Suggested.lean is **UNCOMPILED**. The available Tau Ceti checkout is cf386627e9176a3827c1a5fe804989fd94a4d216 and has no imported LongExactSequence olean. Canonical.lean in the evidence archive means the entire inherited **Mathlib-only projection**, not the complete final suggested file.

Both checks ran serially in the existing exact Mathlib build with38GiB available, one Lean thread,8GiB limit and1200-second timeout. No Lake setup, cache download, library build or language server was used. No process from these checks remains running.

- Native.lean: 2022 lines,86 examples,exit0;0 warnings, all admission warnings where present;123 axiom audits; peak RSS2203356KiB. Source SHA256 `e7dbc0b7f329aa63d376a3bdabf16e6d2f706f2b28e1b21a77eec2fa23a27aab`; log SHA256 `5050594da2773e075b6a19af7e11e20ee1adaf5c43769a0a62aea648be5d4703`.
- Canonical.lean: 5972 lines,347 examples,exit0;771 warnings, all admission warnings where present;0 axiom audits; peak RSS3705316KiB. Source SHA256 `92d02bdd405cbbb54344d96088253de482b8ed18491b64163c079de57ef8f381`; log SHA256 `22dcd39c7c26c8cd74f91f5386ecbc43878082b71d7ef6ae8489dccb61a91ce2`.

Native.lean includes the exact predecessor proof text after the new import, followed by the20 new declarations,12 tests and20 new axiom audits. All123 audited axiom closures use only propext, Classical.choice and Quot.sound, with no sorryAx. The proof-free new suggested projection retains concrete carrier/map data and admits theorem/test bodies and proof fields. Its34 textual admissions cause32 declaration warnings; with739 inherited warnings, the whole Mathlib projection has771 admission warnings and no other warnings. Every new declaration header and projected body is checked mechanically against the native source. All implementation statuses remain unchecked.

The actual indexed checker reports530 nodes,476 API items,459 definition tests,211 baseline references,10 planets and zero closed stages, without errors or warnings. Source-issue/version and actual intake/file checks pass. Real immutable atlas assembly yields acyclic stage3017/8655, own declaration530/1115 and scoped3540/10368 vertex/edge counts. All24 own required pairs and40 touching accepted restructure pairs are reachable. There are no unresolved leaves or own skipped/pending links. Every stage edge and every foreign roadmap/stage object remains unchanged; existing sibling parts are retained by the assembler.

Mathematical base `631e9fcb88488b4326b2833e3e9edb8de127c020`; publication control `a7da8ba667e0bc42e50b6a3f6006dec3cd04b06b`. Verification-math.json and Verification.json record their actual checks. Declaration-index SHA256 `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`. The final complete suggested file SHA256 is `6d6055d9d52cae197e2b5f76435d65d9f46406b63e686edda967f4c2286243a1`.

## Resume

Use R09.4/sheaf-transport/object-functor, object-functor-parallel, equivariant and transport-comparison as the next gluing inputs. Supply actual local object covers and overlap refinements, descend the sheaves/actions/maps for the nonneutral gerbe, and package them in D0’s supplied torsor groupoid. The existing generic D0 carrier/comparison obligations remain requested; do not replace them by Prop-valued records assuming the conclusion. Prove full faithfulness and the coherent inverse/unit/counit before claiming equivalence with torsors. The already planned principal-sheaf comparison should be imported, not duplicated.

Instantiate these parameterized checks on the existing nonconstant fixtures as further validation. Preserve empty-section behavior and the actual coefficient restrictions. All inherited SF1 descended-band comparison, nonneutral O(1) root example, derived H2, compatible fpqc limits, source issues and other stage obligations remain open. This is a partial planning checkpoint.

## Public recovery and replay

Archive commit `d8f47ec6478a201d1a30552d5201b508479c03dc` is an ancestor touching only this issue’s suggested file. Its40 inert artifacts include all8 authoring, projection, handoff, verifier, graph and compiler helpers. Manifest SHA256 `e1d5b8444ae1fa05938805fda7026ae1bd40afb8d9108418e5479929dbef7c90`; payload SHA256 `cffc9d6f20839a903e075c4fe1090c71b2b6dafe63623f1d0d2803be1b84e1f0`. The final suggested file has no archive payload and retains the complete Tau Ceti-import planning text.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and four final deliverables, authenticates hashes, sizes and line counts, binds this handoff’s mathematical prefix, and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the prescribed pinned declarations.tsv and put REPLAY_DIR outside the checkout. The verifier executes the actual immutable checker, intake and atlas assembler without running Lean or creating a repository snapshot. Its result should equal Verification.json.

Optional serial proof replay, using only an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, then the corresponding Canonical.lean command after it finishes. The runner checks pins, tracked cleanliness, dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean here is the Mathlib-only projection; Suggested.lean is the complete, uncompiled Tau Ceti-import file. Diagnostic hashes authenticate the recorded runs; elapsed times and resource statistics vary on replay.

Public HTTP recovery and verifier replay at the final immutable head are checked before opening the PR. Disposable scratch is removed after submission; only this handoff’s replay evidence is retained.

## Script: recover.py

```python
"""Recover public hash-authenticated native sheaf-transport evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='AlgebraicModuliForArithmeticGeometry--A0-extension'
ARCHIVE='d8f47ec6478a201d1a30552d5201b508479c03dc'
MANIFEST_SHA='e1d5b8444ae1fa05938805fda7026ae1bd40afb8d9108418e5479929dbef7c90'
PAYLOAD_SHA='cffc9d6f20839a903e075c4fe1090c71b2b6dafe63623f1d0d2803be1b84e1f0'
EXPECTED={'packets': 'd57142209eb28970d008387560ab0ff007626819a2c94388da3f3bf950e68703', 'readmes': '383040455852daa238ee5dea85bf6beacc84b343c37e5cc3f4e0ae238d145ccb', 'suggested': '6d6055d9d52cae197e2b5f76435d65d9f46406b63e686edda967f4c2286243a1'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=(raw.split('/- BEGIN ARCHIVED SHEAF TRANSPORT PAYLOAD\n',1)[1].split('END ARCHIVED SHEAF TRANSPORT PAYLOAD -/',1)[0]).encode()
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
fence=chr(96)*3;handoff=(S/'Handoff.md').read_text()
assert handoff.startswith((S/'HandoffBase.md').read_text())
code=handoff.split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from current public handoff.'
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=8,publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
