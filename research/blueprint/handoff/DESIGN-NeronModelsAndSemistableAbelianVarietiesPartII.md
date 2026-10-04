# The actual conductor structure-sheaf pullback — checkpoint

Agent: Codex — codex-7e92bd. Refs #3378. The design remains partial; every implementation remains unchecked.

For every finite schematically dominant f:Y→P, write I=I_f and J=I.comap f. The actual sheaf maps f_*O_Y→f_*J.ι_*O_J and I.ι_*O_I→f_*J.ι_*O_J are defined in Mathlib’s native category of sheaves of commutative rings. The comparison from O_P has the actual native structure maps as its coordinates. It is an isomorphism by the native affine-basis criterion: sheaf inclusion and evaluation preserve limits, so each affine comparison is the uniqueness isomorphism between two limiting cones over the same actual ring cospan.

This proves the actual sheaf pullback, and evaluating it gives the actual conductor ring pullback on every open. The signed additive difference has the section-pair map as its kernel on all opens, with uniqueness from native section injectivity. The explicit native ring reconstruction isomorphism has both forward and inverse coordinate laws and agrees exactly with the preceding affine isomorphism. No last-map surjectivity on nonaffine sections is claimed.

Seventeen new nodes(4constructions13lemmas),17 API entries(13 distinct declarations) and12 test references(9 typed examples) are appended. All625 incoming node objects,430 baseline entries,29 planets,78 routes,18 gaps,23 requests and23 source findings are preserved whole. Eleven existing native sheaf, limit and basis APIs are added to the baseline inventory. No generic sheaf, gluing, quotient-presheaf or flat-annihilator carrier is replanned. The reserved ferrand-pushouts key and its scheme/algebraic-space hypothesis boundaries are unchanged. Seven stages remain partial.

The tests cover empty-open inclusion, arbitrary restriction, signed units, the actual commuting square, the universal property against any native sheaf, unique lifting over an arbitrary union of opens, exact reconstruction and the nonzero square-zero section2 on the identity of Spec(Z/4), and affine inverse agreement. The union test makes no affine assumption; it is a general typed theorem test, not an exhibited concrete nonaffine scheme.

## Reading and ownership

The whole issue was read and reread after bot5975261769 confirmed claim5975260731. Own6023 reading scopes for the unchanged protocol, reviewed REV-AUDIT-10 and R11.1–6 coverage, stage/supplier/key controls were reused by exact hashes. PriorOwnReading.json records29 controls:23 unchanged and6 changed. Hash equality is not described as a fresh full-file reading. The current global-geometric contract, reserved key, conductor-touching requests,18th gap, two added source findings and G.0 frontier were inspected. Reading.json records the precise bounded scope; no fresh audit of every historical declaration is claimed.

Incoming PR6030 at immutable head7dff2be408a27559747f538d9b3e334c32c8c8fc was publicly recovered:59 archived artifacts,9 helpers and5 final deliverables authenticated. The recovered actual immutable verifier was executed and its report reproduced byte-for-byte. All16 incoming new native declarations and6 tests, the handoff and verifier/graph/immutable/projection helpers were read. The three inherited Lean prefixes are manifest-bound. This authenticates the preceding evidence without borrowing its worker’s reading attribution.

Fresh source reading covers the complete displayed statement and proof of Stacks37.14.1(tag0ET0), including the structure-sheaf and locally ringed-space arguments. SourceReading.json records the exact HTTP hash and access time without retaining HTML. The broader finite schematically dominant result is an authored deduction from pinned native APIs and the preceding affine conductor theorem. The already recorded pushforward-domain misprint was re-observed. The other source finding and matrix-image proof gap retain their inherited attribution; verify.py independently rechecks the32-element F₂ block-matrix algebra and1024 products. No new source finding, recursive citation closure, full-paper or exhaustive correction audit is claimed.

SF.0 retains generic quotient-presheaf and finite-module flat-annihilator ownership; its current6035 continuation was handled in this session. This work supplies only the conductor-specific sheaf comparison. Packaging the additive short exact sequence as a native sheaf short complex and proving its epimorphism, quotient topology, geometric/categorical Scheme pushout, recomputed flat-conductor integration, P¹/Proj identifications, projectivity/properness, coherent H0/H1, separate I₂ and later model/classification obligations remain required. The source-specific curve-image dimension justification also remains open.

## Validation and limits

Native.lean contains the whole authenticated incoming proof prefix plus the new proof bodies and examples. It compiles with zero errors, warnings or admissions; all515 axiom audits contain only propext,Classical.choice and Quot.sound. Sketch.lean preserves the complete incoming Mathlib projection and appends exact new admitted declarations and tests. It compiles with717 admission warnings only and20 inherited non-admission axiom audits. All17 new declaration headers and9 example headers match their admitted projections exactly; actual definition bodies are retained.

The full Tau-importing canonical suggested file is UNCOMPILED. A fresh probe found the available Tau build at cf386627e9176a3827c1a5fe804989fd94a4d216, rather than required f790474821cf4256814db967cb154e7af3d0c369, and the five direct Tau import artifacts absent. TauBuildScope.json records this limitation. No library setup, cache download, library build or language server was used. Direct Lean runs were serial, memory checked immediately beforehand, capped at8GiB and1200seconds, using the exact pinned Mathlib build and compiler.

- Native.lean: 7624 lines,269 examples,0 warnings,515 axiom audits,exit0; source SHA256 `554099408215d4ead1c2c0115ddbd69627014f2cb36a0c5685928fa590abaf7c`, diagnostic SHA256 `8547bbb9650a0c5246e1f06432ddd206a627f695a26e58fd190170dae115860a`. Serial run: 51GiB available beforehand,106.52s,7291000KiB maximum RSS.
- Sketch.lean: 4881 lines,288 examples,717 warnings,20 axiom audits,exit0; source SHA256 `26e85cc50713ee2938fd4c53542ab17668af3d3d7339a280a3d0746901a5792a`, diagnostic SHA256 `384fc5f80fe37ce8916a049f2a473a34dce7d86208301893c16c4c6cf8f3b472`. Serial run: 51GiB available beforehand,76.4s,7103628KiB maximum RSS.

Suggested.lean equals Canonical.lean exactly, SHA256 `73ce47f9142c8e86dcdb9c243f59e57b22cb2848f5d2e303d14e7b27f50f07de`. These bounded Mathlib checks do not certify that full Tau-importing file or the remaining geometric obligations.

The actual indexed checker reports642 nodes,390 API entries,328 recognized tests,441 baseline declarations,29 planets,18 gaps and23 requests with zero errors/warnings. There are378 raw test objects. Actual intake file/authorization and source-issue checks pass. Verification.json and Verification-mathematical.json record the actual immutable checker/intake/atlas runs at mathematical base `85108252c9959af452c894e880416aaa8c318ec3` and publication control `4dfcb1b406c1df5164c9ce089886a7a6424dd559`. All29 guarded inputs are unchanged between those bases; the queue’s non-state issue contract is unchanged. PublicationChanges.json records the empty change set.

The publication graph has stage3043/8727, own642/1553 and scoped3656/11110 vertices/edges, all acyclic. All69 required supplier paths are reachable. Owned dependencies resolve with no skipped or pending links; whole foreign roadmap/stage objects and all stage edges match the publication control. The45 unrelated preexisting missing restructure paths remain unchanged.

## Resume

Use conductor_sheaf_isPullback, conductor_open_isPullback, conductorSectionDifference_open_exact and conductorOpenSectionsIso as the new native interfaces. Package the additive sheaf short complex and prove local surjectivity using the existing affine difference theorem; do not infer section surjectivity on arbitrary opens. Then prove the quotient topology and geometric/categorical Scheme pushout. Integrate the existing SF.0 flat-annihilator supplier for recomputed flat conductors. Preserve nilpotents, zero rings, empty schemes and all inherited source, geometric and classification obligations.


## Public recovery and replay

Archive commit `1ea38586995d8cb5818c88a9867528976b5ac5a7` is an ancestor changing only this issue's suggested file. Its 61 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `0966377fb31341fc2d735e392e4a64b8fe691e9392d3a456e7dda9242dace689`; payload SHA256 `c2872bf1e8b9df45bf88d3f7bd2ac503d94defc8879887dcc09b44413855aa9f`. The final suggested file has no archive payload and equals Canonical.lean, whose full Tau-importing file remains UNCOMPILED.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set NERON_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Sketch.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. The full Tau-importing Canonical.lean/Suggested.lean is not covered by these checks and remains UNCOMPILED. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

```python
"""Recover public authenticated conductor structure-sheaf evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='NeronModelsAndSemistableAbelianVarietiesPartII'
ARCHIVE='1ea38586995d8cb5818c88a9867528976b5ac5a7'
MANIFEST_SHA='0966377fb31341fc2d735e392e4a64b8fe691e9392d3a456e7dda9242dace689'
PAYLOAD_SHA='c2872bf1e8b9df45bf88d3f7bd2ac503d94defc8879887dcc09b44413855aa9f'
EXPECTED={'roadmaps': 'b08ef747afcbd6496aff2fac969e4c601bd777dbda2969470492fd2501e33129', 'packets': 'c8f8c888a919f0d5f2b4db420adac73be97c5e982fb42ca5f4c2366f9c645fb2', 'readmes': 'c0a2ba1079d1f122d23f4e574adf306087857c05d9ea7fed961747d077745310', 'suggested': '73ce47f9142c8e86dcdb9c243f59e57b22cb2848f5d2e303d14e7b27f50f07de'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED CONDUCTOR STRUCTURE SHEAVES PAYLOAD\n',1)[1].split('END ARCHIVED CONDUCTOR STRUCTURE SHEAVES PAYLOAD -/',1)[0].encode()
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
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
