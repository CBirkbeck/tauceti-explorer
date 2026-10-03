# DESIGN-NeronModelsAndSemistableAbelianVarietiesPartII: actual conductor sheaf checkpoint

Codex — codex-7e92bd · 3 October 2026 · Refs #3378 · **partial**.

The checkpoint proves the actual affine restriction law needed by the existing conductorIdealSheaf definition. It adds11 declaration-sized lemmas,7 API items and6 typed tests. The exact old ofIdeals construction and its mem_affine, greatest and affine_compat signatures are preserved. Their native proofs now establish that the construction has every advertised affine component, rather than merely a compatible subfamily of them.

For any finite scheme morphism, the actual section map on a principal affine open is identified with the native away-localized ring map followed by the canonical identification of source opens. Transport of the contracted conductor under this ring equivalence gives basic-open compatibility. Scheme-theoretic dominance is not needed for that identity. The existing finite, schematically dominant conductor definition then agrees with the compatible native IdealSheafData family by ofIdeals_ideal. The additional APIs give arbitrary affine restriction, section restriction and composition, the identity unit ideal, the exact native ΓSpecIso comparison, and the annihilator of the actual quotient of affine section modules by span{1}.

This affine module quotient is not a constructed sheaf cokernel. The identity's native closed subscheme is checked empty. Tests also cover the empty affine open, D(0), nested actual restrictions and the canonical affine ring comparison. The actual diagonal Z/4→Z/4×Z/4 test proves its Spec map finite and schematically dominant, then proves that the section corresponding to2 is outside its conductor. It retains the nonreduced rings; it does not assume the example's morphism instances. The old cusp and finite-field-extension test contracts are preserved, not declared all discharged by these six tests.

All571 incoming node contracts are retained. Exactly the existing conductor-definition node receives appended prerequisites, proof detail, API and tests; the other570 old whole node objects are unchanged. All17 gaps,23 supplier requests,29 planets,78 source routes,21 source issues and seven partial stages are retained. The reserved Ferrand key-definition contract and incoming recomputedConductorContinuation metadata are unchanged. All582 declarations remain unchecked. The complete incoming reader and incoming canonical declaration text are preserved as prefixes; the incoming inert archive is authenticated and recoverable separately.

## Reading, provenance and ownership

Fresh readings cover the whole issue before and after the bot confirmation, full WORKERS, the incoming handoff and all seven replay helpers, seven owned stage contracts, the full parent R11 campaign README, all six reviewed R11 audit rows and complete REV-AUDIT-10, both full Ferrand survey entries and the reserved/owner records, the complete conductor-definition and finite-localization nodes, the SF.0 stage contract, all17 gap objects and requests0,1,2,20,21,22. The other17 request names were screened and their entire objects are retained. All links were mechanically searched for this roadmap, with no touching files found. Other governing protocols and the full AlgebraicCurves/JacobianChallenge readings are reused from this continuous session under byte guards; no fresh repeated whole-document reading is claimed. Reading.json records the precise scope.

Fresh primary passages: the complete [Stacks Lemma10.40.4](https://stacks.math.columbia.edu/tag/07T8) proof and [Lemma53.10.5–Example53.10.6](https://stacks.math.columbia.edu/tag/0C6L), especially the conductor paragraph. HTTP hashes and access times are archived without source HTML. The general actual-map adapters are authored deductions; the proper-curve source is not claimed to state these more general contracts. The earlier own5993 Ferrand pp554–557 reading and prior-art body/head receipts are retained with their original attribution. The fresh bounded conductor PR search returned eight titles; no new PR code was adopted. No fresh full-paper or erratum collation is claimed. The source-issue check uses the inherited derived errata-v1 envelope; all incoming source-version records remain unchanged.

Read the pinned native IdealSheafData constructor, basic-open law, affine restriction and extensionality APIs; actual affine-scheme basic-open localization maps; finite and dominant morphism statements; native ΓSpecIso naturality; kernel and empty-subscheme comparisons. The five added baseline references resolve in the pinned index. The exact source ranges and file hashes are in Reading.json. Bounded source/name searches are not a whole-library absence certificate. Subring.conductor is incoming authored code, not a claimed pinned Mathlib declaration. Generic sheaf, ideal, affine-scheme and localization machinery is imported. The generic flat-annihilator request stays with SF.0.

Incoming [PR6008](https://github.com/CBirkbeck/tauceti-explorer/pull/6008), immutable head1811486553aaa6c29df216b37b82d35fbd02f5a0, was recovered from public GitHub:70 artifacts,7 helpers and5 deliverables authenticated; all five matched the mathematical base. Its verifier and actual immutable graph assembly were rerun. The entire incoming admission-free Native source is recompiled as the exact prefix. Selected consumed proofs were manually read; recompiling it is not a claim to freshly audit all6092 inherited lines.

## Validation and limits

Required pins: Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and TauCeti f790474821cf4256814db967cb154e7af3d0c369. Native.lean and Sketch.lean import only Mathlib and preserve the incoming exact consumed Tau excerpt. They were compiled serially in an existing exact Mathlib build with37GiB available before each run, single-threaded Lean,8GiB limit and1200-second timeout. No project setup, cache fetch, library build or language server was used.

**The entire Tau-importing canonical suggested file remains uncompiled.** The available Tau build is cf386627e9176a3827c1a5fe804989fd94a4d216 rather than the required pin, and the required LongExactSequence olean is absent. Passing the Mathlib-only proof file and sketch does not remove that limitation.

- Native.lean: 6389 lines,244 examples,exit0;0 warnings (0 admitted-declaration warnings),449 axiom audits,peak RSS7286200KiB. Source SHA256 `0ff9a5638f8a81eb9fadeca47f527e64ecf8cf01ce0d9fb87aca516b8825b7d3`; log SHA256 `9a97c800015129fe7ec789d74fd99d41971810285ab897edd8a18cd2d945d7b1`.
- Sketch.lean: 4152 lines,263 examples,exit0;637 warnings (637 admitted-declaration warnings),20 axiom audits,peak RSS7102408KiB. Source SHA256 `28fce09182e1ff980b370e78cfe1aea0994f2cfd6d213e10c35af4ec4c8c1c0f`; log SHA256 `d276760f8460868c116c23f63355bcba37fee80ec99f8a6a4e953cac0856d09c`.
- Native has no admissions or warnings. All449 audits use only propext,Classical.choice and Quot.sound. The15 new native declaration headers (including the exact existing definition and three APIs) and6 tests match their planning projections; the four old canonical headers and concrete constructor body are unchanged.
- The actual indexed packet checker reports582 nodes,347 API items,301 recognized tests,398 baseline references,29 planets and zero closed stages, with no errors or warnings. Raw test objects total351. Actual intake file/authorization checks and source-issue checks have no problems.
- Actual immutable assembly gives acyclic stage3043/8727, own582/1456 and scoped3596/10953 vertex/edge counts. All69 own required stage pairs are reachable. All roots resolve; own skipped/pending links are empty. Whole foreign roadmap/stage objects and all stage edges are unchanged. The45 unrelated inherited missing restructure paths are explicitly preserved, not hidden or claimed fixed.

Mathematical base `0182c59cdc6f1dcf2455d12762969f68ff2a114e`; publication control `626583deb292902c5cb8b8749e908f9d342426b2`. All29 guarded input files agree between them;3 unrelated atlas inputs changed and the actual graph was rerun at the publication base. The declaration index SHA256 is `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`. Full canonical SHA256 `989a92b3dc57e8e8924dd6810c721c3037ed5fd946477e563381026be8e986c3`. Verification.json contains the complete report.

## Resume

The actual conductor family now satisfies the native basic-open compatibility law; ofIdeals preserves every prescribed affine ideal. Native proofs establish the old membership, greatest-ideal and affine ofIdealTop contracts, arbitrary affine restriction and composition, identity and empty-open boundaries, the canonical ΓSpecIso comparison, and the affine quotient-module annihilator formula. The native closed subscheme is available, with the identity case checked empty. Still construct and compare the conductor quotient-square maps, the all-open structure-sheaf exact sequence and categorical geometric pushout, the recomputed flat base-change comparison, projectivity/properness/cohomology and the remaining I2 and other routed-paper targets. The generic flat-annihilator supplier request remains open. The full Tau-importing canonical file remains uncompiled; no whole-stage completion is claimed.

Start with the authenticated actual affine-component and restriction proofs. Construct the native conductor quotient-square maps and compare their affine ring descriptions, then build the all-open structure-sheaf sequence and geometric categorical pushout. Keep the full ideals, zero/empty cases and nonreduced examples. Preserve every supplier boundary and all remaining projectivity, cohomology and later-stage obligations.

## Public recovery and replay

Archive commit `0b7d4b693f55c70c930f3b8653c759f31bfcebe7` is an ancestor touching only this issue's suggested file. Its53 inert evidence artifacts include all7 current replay/compiler/authoring helpers. Manifest SHA256 `afa8a871a8ac6ead89261cea3872fdf35941b18dcc819419763fe16391421c9c`; payload SHA256 `c253a79d1dcfdf2b3fbc58128b20c8f5886d8ceb869b7923e8ba70aa217c3b66`. The final suggested file is exactly Canonical.lean, without the archive payload.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and all five final deliverables, authenticates artifact hashes and sizes, binds this handoff's mathematical prefix, and checks its own code against the public handoff. Inspect the recovered scripts. From an existing repository checkout containing the two bases above, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX` with the prescribed pinned declarations.tsv. REPLAY_DIR must be outside the checkout. The verifier runs actual immutable checker, intake and graph code without running Lean or creating a repository snapshot; its report should equal Verification.json.

Optional serial proof replay, only in an already existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, then wait for it to finish before the analogous Sketch.lean run. The runner checks the Mathlib and dependency pins, tracked cleanliness, compiler version, free memory≥20GiB and timeout. The complete Tau-importing canonical file is not covered by these two replay commands. Diagnostic hashes describe the recorded runs; elapsed-time and resource statistics will vary on replay.

Public HTTP recovery and verification against the final immutable head are checked before submission. Disposable scratch is removed after the PR opens; only handoff-linked replay evidence is retained.

## Script: recover.py

```python
"""Recover public hash-authenticated conductor-sheaf evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='NeronModelsAndSemistableAbelianVarietiesPartII'
ARCHIVE='0b7d4b693f55c70c930f3b8653c759f31bfcebe7'
MANIFEST_SHA='afa8a871a8ac6ead89261cea3872fdf35941b18dcc819419763fe16391421c9c'
PAYLOAD_SHA='c253a79d1dcfdf2b3fbc58128b20c8f5886d8ceb869b7923e8ba70aa217c3b66'
EXPECTED={'roadmaps': '75be1d9e6c511bbfe2f96902f4676fad0894c05e0e41202329f053e96f615689', 'packets': '8bd87bf7101785d164509d1369966c1b41c6638eafdbb168d93a4c98fd300e1a', 'readmes': 'e5e91b760592d495c3d4be84b0584f298dfc5e8e5cc61910b73a3e7c4596606f', 'suggested': '989a92b3dc57e8e8924dd6810c721c3037ed5fd946477e563381026be8e986c3'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=60)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=(raw.split('/- BEGIN ARCHIVED CONDUCTOR SHEAF PAYLOAD\n',1)[1].split('END ARCHIVED CONDUCTOR SHEAF PAYLOAD -/',1)[0]).encode()
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
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=7,publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
