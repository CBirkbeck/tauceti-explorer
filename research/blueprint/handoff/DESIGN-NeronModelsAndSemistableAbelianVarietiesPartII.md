# Full source-conductor ideals and quotient coordinates — checkpoint

Agent: Codex — codex-7e92bd. Refs #3378. The design remains partial and every implementation remains unchecked.

The exact full ideal equality (I_f.comap f)(f⁻¹U)=c(im(f.app U),Γ(Y,f⁻¹U)) is supplied for every affine U and finite schematically dominant f. Thirteen new declarations (one construction and twelve lemmas), four API entries and three typed tests give the native affine adjunction proof, restriction of both ideal data, exact topIso coordinate transport, the canonical source B/K chart and the actual inclusion/conductor-map quotient formulas. The existing conductor_affine_quotients header now has a native proof without changing its statement. All596 incoming mathematical contracts remain; only that existing node gains appended prerequisites and proof detail. The other595 whole nodes and all17 gaps,23 requests,29 planets,78 routes,21 source issues and seven partial stages remain.

On affine schemes, the native comap/map adjunction bounds the source ideal by the full conductor datum; elementwise lifting supplies the reverse inclusion. Restriction and the two actual topIso maps prove the result on any affine open of an arbitrary target. This conductor-specific deduction uses existing native generic APIs; it does not replan a tensor-quotient carrier or the SF.0 finite-module flat-annihilator theorem. The latter's conductor and sheaf consumers remain required. The all-open structure-sheaf sequence and geometric/categorical pushout are still separate obligations.

The actual finite schematically dominant diagonal Z/4→Z/4×Z/4 has zero conductor. Its source section corresponding to(2,2) is nonzero with square zero, and the actual source-conductor restriction retains a nonzero square-zero coordinate. A radical replacement fails this test. Empty opens and the actual inverse image of every quotient representative are checked.

Fresh source reading covers the complete Stacks Lemma53.10.5 proof and Example53.10.6 at https://stacks.math.columbia.edu/tag/0C6L. The general comparisons are authored deductions from pinned native APIs; the proper-curve source is not claimed to have their broader hypotheses. SourceReading.json records the HTTP hash and access time without archiving source HTML. No fresh full-paper or erratum collation is claimed. The inherited source-issue validation uses the same derived errata-v1 envelope. A bounded open Mathlib PR search and two archive web searches identified no relevant separate scheme-conductor implementation; this is not an exhaustive absence claim and no external code was adopted.

Incoming PR6018 was publicly recovered at immutable heade97b88c45ac93795b83d13641cebbecf0087aec1:52 artifacts,7 helpers and5 final deliverables authenticated. Its actual immutable verification exactly matched its archived report. All three incoming Lean prefixes are manifest-bound. Reading.json records fresh reviewed audit, current contracts and proof readings, and reuse of own6015 readings only for unchanged exact inputs. It is not a fresh manual audit of every historical declaration.

## Validation and limits

Native.lean compiles with no admissions, errors or warnings. Sketch.lean is the complete incoming Mathlib projection plus the exact new admitted headers and tests; it compiles with admission warnings only. The full Tau-importing canonical suggested file remains UNCOMPILED: the available Tau build is cf386627e9176a3827c1a5fe804989fd94a4d216 rather than f790474821cf4256814db967cb154e7af3d0c369. All five direct Tau-import oleans are absent at the available build's standard artifact paths; the required LongExactSequence artifact is also absent. TauBuildScope.json records the probe. No library setup, cache download, library build or language server was used.

- Native.lean: 7026 lines,254 examples,exit0,0 warnings,482 axiom audits,37GiB available before the serial run. Source SHA256 `396506ba972ea032610201571844b3b43b021db5167cf305fee555dd2da8293d`; diagnostic SHA256 `21af6572ff9eeb5e1f50eaed2d96d5a6bb04c284c51e58909f6ea5117bd56c86`.
- Sketch.lean: 4498 lines,273 examples,exit0,675 warnings,20 axiom audits,37GiB available before the serial run. Source SHA256 `a295ccab50429eddde14c14d5cedc8d393d15f6fa5d1cbf883af76deb6cc6a61`; diagnostic SHA256 `a22aa17762b5f128178f50e1e325e535a391946ea632c27db06e02e79f647947`.

All482 native axiom closures contain only propext,Classical.choice and Quot.sound. All14 mathematical declaration headers and3 example headers match their admitted projections; one declaration is the unchanged existing conductor_affine_quotients header. The local restriction-dominance instance directly applies the pinned flat-base-change theorem and is also audited. The final suggested file equals Canonical.lean, SHA256 `6ed90dc7306c2842cad89cf4bb9e197c384e43c1a5a2ff3a0295c959d3d18c60`. The two Mathlib artifacts do not certify that full file or the remaining geometric comparisons.

The actual indexed checker reports609 nodes,362 API items,310 recognized tests,425 baseline declarations and29 planets, with no errors or warnings. Raw test objects total360. Actual intake authorization/file checks and inherited derived source-issue checks pass. Actual immutable assembly has stage3043/8727, own609/1496 and scoped3623/11020 vertices/edges; all graphs are acyclic. All69 required supplier paths are reachable. Owned roots resolve and have no skipped or pending links. Whole foreign roadmap/stage objects and stage edges remain unchanged against the publication control. The45 unrelated preexisting missing restructure paths remain preserved.

Mathematical base `a17d8595de0eab8536d39433922d2e76a3367c1a`; publication control `a17d8595de0eab8536d39433922d2e76a3367c1a`. All29 guarded inputs, all five incoming deliverables and the issue contract agree across these controls. Verification.json records the actual immutable publication assembly. The declared source-ideal gap is resolved by the new exact comparison; the generic SF.0 request is not closed wholesale.

## Resume

Use conductor_affine_quotients and conductorChartMap_ambient_quotient as the actual affine chart interface. Combine with the existing common-ideal ring reconstruction, prove compatibility of the section comparison on overlaps and the all-open structure-sheaf exact sequence, then the topological and categorical geometric pushout. Integrate the exact SF.0/flat-annihilator supplier for recomputed flat conductors. Preserve nilpotents, empty schemes and zero rings, and all P¹/Proj, projectivity/properness, H0/H1, I2, later-model and classification obligations.

## Public replay

Archive commit `4ca16bd36e344b7e2f166ed77087a130d03b276e` is an ancestor touching only this issue's suggested file. Its49 authenticated artifacts include all9 current authoring, projection, verifier, immutable-graph, compiler and handoff helpers. Manifest SHA256 `5ce941dd25050eb04d1e6d3ca19f13b6de84740f4ec289d7f692a6bb045f4fb1`; payload SHA256 `1b1520693c32a2262547202c28a79c4083901ff4f8a538bc755353a1a500f052`. The final suggested file is exactly Canonical.lean, without the archive payload.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It recovers the public immutable archive and five final deliverables, checks every artifact hash and size, and binds this handoff's mathematical prefix and its recovery code. Inspect the recovered scripts. From an existing repository checkout containing the recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX` with the exact pinned declarations.tsv. REPLAY_DIR must be outside the checkout. The actual immutable checker, intake and graph report should equal Verification.json. The mathematical and publication controls coincide for this checkpoint. These commands neither run Lean nor create a repository snapshot.

Optional serial compiler replay, only with an existing exact pinned Mathlib build: run `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, wait for completion, then run the corresponding Sketch.lean command. The runner checks pins, compiler version, tracked cleanliness and free memory≥20GiB, with one thread, an8GiB limit and1200-second timeout. The complete Tau-importing canonical file is outside this compiler scope. Recorded elapsed time and resource statistics vary on replay.

Public HTTP recovery and actual verification against the final immutable pushed head are checked before submission. Disposable own scratch is deleted after opening the PR.

## Script: recover.py

```python
"""Recover public hash-authenticated source-conductor evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='NeronModelsAndSemistableAbelianVarietiesPartII'
ARCHIVE='4ca16bd36e344b7e2f166ed77087a130d03b276e'
MANIFEST_SHA='5ce941dd25050eb04d1e6d3ca19f13b6de84740f4ec289d7f692a6bb045f4fb1'
PAYLOAD_SHA='1b1520693c32a2262547202c28a79c4083901ff4f8a538bc755353a1a500f052'
EXPECTED={'roadmaps': 'e2f6b8eb5cc94e9139343bbc5390420825e43f9f3fa6f753e3f955a78fd715f2', 'packets': '9e0dc178e2b820e068f018c8e90467ebd1659b8fbf77feb46f06ab5c3f2bb16d', 'readmes': 'd5e9424a513737e23eb119136834039225eef6e60fe975d47f79571792a821fc', 'suggested': '6ed90dc7306c2842cad89cf4bb9e197c384e43c1a5a2ff3a0295c959d3d18c60'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=60)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=(raw.split('/- BEGIN ARCHIVED SOURCE CONDUCTOR PAYLOAD\n',1)[1].split('END ARCHIVED SOURCE CONDUCTOR PAYLOAD -/',1)[0]).encode()
assert sha(pb)==PAYLOAD_SHA
payload=json.loads(pb)
def unpack(name):
 b=zlib.decompress(base64.b64decode(payload[name]['data']));assert sha(b)==payload[name]['sha256'],name
 return b
mb=unpack('artifact-manifest.json');assert sha(mb)==MANIFEST_SHA;meta=json.loads(mb)
assert set(payload)==set(meta)|{'artifact-manifest.json'}
assert len(meta)==49 and {'author.py','assemble.py','compile.py','runcheck.py','projection.py','immutable.py','graph.py','verify.py','write_handoff.py'}<=set(meta)
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
