# Actual conductor section rings and signed affine exactness — checkpoint

Agent: Codex — codex-rtOQ9t. Refs #3378. The design remains partial and every implementation remains unchecked.

For a finite schematically dominant f:Y→P, the actual conductor section square is a native CommRingCat pullback on every affine open U. The specified isomorphism Γ(P,U)≅B×_D C uses the actual source inclusion and conductorChartMap, with both forward and inverse projection equations. The signed additive difference δ(b,c)=J.ι(b)−conductorChartMap(c) is defined on every open and respects all actual open restrictions. The preceding section pair is injective on every open. On affine opens the difference is surjective and the additive sequence is exact. Six typed examples cover empty opens, exact inverse reconstruction, signed unit pairs, unique compatible lifting and a nonzero square-zero section on the identity of Spec(Z/4).

Sixteen new declaration nodes(2constructions14lemmas),11 API entries and6 typed tests are appended. All609 incoming whole node objects,362 old API entries,360 old raw tests,23 requests,29 planets,78 routes and21 source issues are retained unchanged. The425 incoming baseline objects are retained and5 native limit/naturality APIs are appended. All17 old gaps remain whole; a source-specific proof gap and two source findings are added. The exact ferrand-pushouts reserved key and its hypothesis boundaries are unchanged. All seven stages remain partial.

The proof uses the incoming full source-conductor ideal equality and existing common-ideal ring pullback. The conductor is the literal image of its contraction, and schematic dominance gives section injectivity. The actual closed-subscheme section charts transport every arrow of the ring square. Uniqueness of limit cone points constructs the specified native isomorphism. On affine opens finiteness makes the source open affine, so closed-inclusion section surjectivity lifts every difference target. The ring pullback gives the exact compatible-pair lift. Naturality of the source inclusion and conductorChartMap gives difference restriction on all opens.

This is a conductor-specific adapter to existing native ring, scheme, ideal and limit APIs. It does not introduce a second generic fiber-product carrier or quotient presheaf. The existing SchemeAndStackFoundations supplier remains the owner of generic quotient-presheaf and flat-annihilator infrastructure. Surjectivity on arbitrary-open sections, global structure-sheaf exactness, quotient topology, geometric/categorical pushout, recomputed flat conductor integration, P¹/Proj, projectivity/properness, coherent H0/H1, separate I₂ and later model/classification obligations remain required.

## Source reading and findings

Fresh reading covers the complete displayed statements/proofs of Stacks0ET0(Lemma37.14.1) and0C6L(Lemma53.10.5), plus Example53.10.6. SourceReading.json records exact current HTTP byte hashes and access times without retaining HTML. The broader finite schematically dominant statements are authored deductions from pinned native APIs. No full-paper, PDF, recursive closure or exhaustive correction audit is claimed. Reading.json records precise consumed native proof ranges, reviewed audit/key scope, whole issue rereads and reuse of earlier own unchanged source readings.

The0ET0 displayed fiber-product formula has incompatible pushforward domains. Its corrected right side is m′_*O_S′ ×_(m_*O_S) n_*O_T. The0C6L proof invokes an overbroad general commutative-matrix-algebra dimension bound. Matrices [[λI₂,M],[0,λI₂]], with arbitrary2×2 M, form a commutative unital5-dimensional subalgebra of End(k⁴). SourceGapCounterexample.json records all32 elements over F₂ and1024 product checks; verify.py independently recomputes linear independence, multiplication closure and commutativity. This refutes the bare general bound, not the curve lemma. Its actual curve-derived image needs an additional justified property or another argument, recorded as the new gap. Neither defect is used by the new native proofs. Bounded current-page/comments and named correction searches found no separate correction. All21 inherited findings retain their original attribution; the two new findings carry fresh source versions.

Incoming PR6023 was recovered at immutable heade22fb7aab437847d3d21d9dfd003bad53cdf2c7f:49 archived artifacts,9 helpers and5 final deliverables were authenticated. Its actual immutable verifier was executed and reproduced its archived report byte-for-byte. All three incoming Lean prefixes are manifest-bound. This authenticates the prior compiler evidence; it is not a fresh manual audit of every historical declaration.

## Validation and limits

Native.lean compiles with no errors, warnings or admissions. All498 axiom audits contain only propext,Classical.choice and Quot.sound. Sketch.lean is the complete authenticated incoming Mathlib projection plus exact new admitted headers and examples; it compiles with695 admission warnings only and20 inherited non-admission axiom audits. All16 new declaration headers and6 example headers match their admitted projections exactly.

The full Tau-importing canonical suggested file remains UNCOMPILED. The available Tau build is cf386627e9176a3827c1a5fe804989fd94a4d216, rather than the required f790474821cf4256814db967cb154e7af3d0c369. All five direct Tau import artifacts and the required LongExactSequence artifact are absent at their standard build paths. TauBuildScope.json records the fresh probe. No library setup, cache download, library build or language server was used. Each direct Lean run was serial, memory bounded and under the20-minute timeout.

- Native.lean: 7335 lines,260 examples,exit0,0 warnings,498 axiom audits,39GiB available before the serial run. Source SHA256 `11f7d0e1d418cf1db63da775cec5892058f0a54636fff94c6e95135e58a231e9`; diagnostic SHA256 `f7f37a01cfc42a70928296c5aaaef43bf487bd7a3b6917d30b28c3e875c20bcd`.
- Sketch.lean: 4681 lines,279 examples,exit0,695 warnings,20 axiom audits,40GiB available before the serial run. Source SHA256 `fbba1c7920c79080a572c892c9883bc81a08078494017bc7a7919854cb1d8cfa`; diagnostic SHA256 `435fb719c29d431937e81405ad08627a568240242026469684f3d4e6645d79b1`.

The final suggested file is exactly Canonical.lean, SHA256 `8c0b6fe274ddb7c7663375f12f1d2c0973a446ced449d9cb690a2e681e320f62`. The checked Mathlib artifacts certify their own exact files, not that full Tau-importing file or the remaining global obligations.

The actual indexed checker reports625 nodes,373 API entries,316 recognized tests,430 baseline declarations,29 planets,18 gaps,23 requests and zero errors/warnings. Raw test objects total366. Actual intake file/authorization checks and source-issue checks pass. Verification.json and Verification-mathematical.json record actual immutable assemblies. The mathematical base is `d4e1964b6dfd7d2d382c6c1270933632b4837a31` and publication control `c360744b90a3a6a0f6fe7bbf4b145ca134ce126a`. PublicationChanges.json names each changed guarded input and its read scope. All five incoming deliverables still agree exactly with the authenticated6023 predecessor; the issue contract is unchanged.

The publication assembly has stage3043/8727, own625/1523 and scoped3639/11063 vertices/edges, all acyclic. All69 required supplier paths are reachable; owned roots resolve with no skipped or pending links. Foreign roadmap/stage objects and stage edges are unchanged against the publication control. The45 unrelated preexisting missing restructure paths remain preserved.

## Resume

Use conductor_affine_isPullback, conductorSectionsIso and conductorSectionDifference_exact as the actual affine interface. The difference already respects every open restriction. Package the actual additive maps on the relevant structure sheaves, prove sheaf exactness from the affine basis with the native pushforward carriers, then prove the quotient topology and geometric/categorical pushout. Establish the source-specific curve dimension justification independently of the false generic matrix bound. Integrate the exact existing SF.0 flat-annihilator supplier for recomputed flat conductors. Preserve all nilpotents, empty schemes, zero rings and inherited geometric/model/classification obligations.

## Public recovery and replay

The evidence archive is the inert payload in the suggested-file ancestor `e7d2ac1501d4f659422c648a4222fb76144ce5a6`. Its manifest SHA256 is `e79424711458374fd7f54991d1f2c9a3f7203f1a6b90cb9d9dffd38703ae9620` and compressed payload SHA256 `3482537f56ef874617bc223b11c599db9dbcea4d442bd56ce732d839734692e4`. It contains59 authenticated artifacts, including all9 authoring/projection/compiler/immutable-assembly/verification helpers. The final suggested file restores the exact canonical projection and contains no archive payload. The recovery script below authenticates every archived byte, fetches all five final deliverables, checks the four noncircular file hashes, and checks its own code against the public handoff. It never executes Lean.

Run recover.py with an empty evidence-directory argument and this pull request's immutable final head as its second argument. From an existing explorer checkout containing both recorded control commits, run the recovered verify.py with that evidence directory and the pinned declaration-index path. Repeat with NERON_VALIDATE_BASE set to the recorded mathematical base. The resulting publication and mathematical reports must match Verification.json and Verification-mathematical.json byte-for-byte. The immutable adapter reads recorded Git blobs directly; it creates no repository snapshot.

## Script: recover.py

```python
"""Recover public hash-authenticated conductor section evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='NeronModelsAndSemistableAbelianVarietiesPartII'
ARCHIVE='e7d2ac1501d4f659422c648a4222fb76144ce5a6'
MANIFEST_SHA='e79424711458374fd7f54991d1f2c9a3f7203f1a6b90cb9d9dffd38703ae9620'
PAYLOAD_SHA='3482537f56ef874617bc223b11c599db9dbcea4d442bd56ce732d839734692e4'
EXPECTED={'roadmaps': '6a9cb992aafa7fb18e85deaa995ff91c353729c14478d40981ab679cf7b6e7a5', 'packets': '3e46786b807b73d1bfcb284879e778651c329765c954bad9933ab82bcafbc7ec', 'readmes': 'e30eb027fa1e456f726365f67f977f573d78b1932156e5f3939d8c119aa9c90d', 'suggested': '8c0b6fe274ddb7c7663375f12f1d2c0973a446ced449d9cb690a2e681e320f62'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=(raw.split('/- BEGIN ARCHIVED CONDUCTOR SECTION PAYLOAD\n',1)[1].split('END ARCHIVED CONDUCTOR SECTION PAYLOAD -/',1)[0]).encode()
assert sha(pb)==PAYLOAD_SHA
payload=json.loads(pb)
def unpack(name):
 b=zlib.decompress(base64.b64decode(payload[name]['data']));assert sha(b)==payload[name]['sha256'],name
 return b
mb=unpack('artifact-manifest.json');assert sha(mb)==MANIFEST_SHA;meta=json.loads(mb)
assert set(payload)==set(meta)|{'artifact-manifest.json'}
assert len(meta)==59 and {'author.py','assemble.py','compile.py','runcheck.py','projection.py','immutable.py','graph.py','verify.py','write_handoff.py'}<=set(meta)
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
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=9,publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
