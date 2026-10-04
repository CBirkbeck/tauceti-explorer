# Affine conductor topology — checkpoint

Agent: Codex — codex-7e92bd. Refs #3378. The design remains partial; every implementation remains unchecked.

For an injective integral ring map φ:A→B, set K=φ.range.conductor and I=K.comap φ. The actual underlying TopCat square formed by Spec(B/K), Spec B, Spec(A/I) and Spec A is IsPushout. Each arrow is Scheme.forgetToTop applied to its specified native Spec map. The proof constructs the actual continuous descent of any compatible pair of maps to an arbitrary topological target, with both triangles, uniqueness and continuous postcomposition. Targets can live in independent universes and need no separation axiom.

The fiber argument uses the full conductor. Outside K, multiplication by a conductor element distinguishes prime ideals with the same contraction. Inside K, the native quotient spectra and their injective closed inclusions identify the relevant fibers. The integral spectral map is closed, and injectivity supplies lying over, so the existing continuous quotient-map lift produces the descent. No module finiteness, Noetherianity, reducedness or nontriviality assumption is imposed. The first three algebraic/fiber lemmas need neither injectivity nor integrality.

Nine nodes(1construction8lemmas),4 API entries and6 typed examples are appended. All657 incoming node objects,457 baseline entries,29 planets,78 routes,18 gaps,23 requests and23 inherited source findings remain whole. Fifteen actual pinned declarations are added to the baseline. No generic spectrum, ideal, quotient-topology or pushout carrier is replanned. The conductor-specific construction has four consumed API entries and six tests. Seven stages remain partial.

The examples cover identity descent, both triangles simultaneously, the empty spectrum of the zero ring, uniqueness for arbitrary targets, failure of point-surjectivity for Spec Q→Spec Z, and the nonzero square-zero element2 in ZMod4 despite bijectivity on spectra after reduction. The last example is a boundary on interpreting topology: it does not claim that bijectivity of spectra is an isomorphism of schemes. The new IsPushout theorem is in TopCat, not Scheme.

## Reading and ownership

The whole issue was read and reread after bot5976420622 confirmed claim5976418984. Own6039 scopes for the protocol, reviewed REV-AUDIT-10 and R11.1–6 audit, stage/supplier/key controls are reused by exact hashes at23 unchanged controls. Six changed controls were separated: the five owned deliverables and SF.0. OwnPreviousReading.json preserves the original reading scope and OwnPreviousReadingGuard.json the29 comparisons. Hash equality is not a fresh full-file reading. The current G.0 frontier, reserved ferrand-pushouts node/API/tests, global-geometric contract, actual GeometricPushout definition and conductor-touching requests were freshly read. The current SF.0 presheaf/sheafification frontier was read; its generic ownership remains intact.

Incoming PR6044 at immutable head4e1eeb46480bb29175b1d412722c961e62b10f2f was publicly recovered:66 archived artifacts,10 helpers and5 final deliverables authenticated. Its actual recovered immutable verifier was executed and reproduced byte-for-byte. The handoff mathematical narrative and recovery script, all15 new proofs and6 tests, and actual verify/immutable/graph/projection/compile/runcheck helpers were read. This authenticates the incoming evidence without attributing its worker's other reading to this worker. All three inherited Lean prefixes are manifest-bound.

Fresh primary-source scope is the complete displayed Stacks15.6.1–2,37.14.1,37.67.1–9 and page comments, with separate HTTP hashes and access times in SourceReading.json. No HTML or PDF is retained. The affine conductor proof is an authored deduction from the existing conductor and pinned native APIs. Three current notation findings are appended: the last inverse image in37.67.2 has the wrong open;37.67.3 uses a product where its pushout is intended;37.67.7 twice names the pushout base inconsistently. Corrections noted in the current comments concern other locations. A bounded web correction search found no separate correction. These findings do not challenge the mathematical results. The existing37.14.1 pushforward-domain typo was re-observed; all23 inherited findings retain their prior attribution. The verifier independently rechecks the inherited32-element F₂ block-matrix counterexample and all1024 products. No recursive source closure, fresh full-paper audit or exhaustive erratum/online absence survey is claimed.

## Validation and limits

Native.lean contains the entire authenticated incoming proof prefix plus all nine new bodies and six tests. It compiles without errors, warnings or admissions, with539 axiom audits containing only propext,Classical.choice and Quot.sound. Sketch.lean preserves the entire incoming Mathlib projection and appends the exact admitted planning headers and examples; it compiles with751 admission warnings only and20 inherited clean axiom audits. All9 new declaration headers and6 example headers match exactly across native and admitted files. The actual noncomputable continuous-descent definition body is retained. A log sanitizer that mishandled a relative scratch path was fixed to resolve that path; both final compiler receipts come from fresh runs after this repair.

The full Tau-importing canonical suggested file is UNCOMPILED. It preserves the entire incoming canonical prefix after three explicit Mathlib imports, then appends the new exact planning declarations and examples. A fresh probe found the available Tau checkout at cf386627e9176a3827c1a5fe804989fd94a4d216 instead of required f790474821cf4256814db967cb154e7af3d0c369, and all five direct Tau import artifacts absent. TauBuildScope.json records this. No Lake setup, cache download, library build or language server was used. Direct Lean runs are serial, memory checked immediately beforehand, capped at8GiB and1200seconds, using the exact Mathlib pin and compiler.

- Native.lean: 8109 lines, 281 examples, 0 warnings, 539 axiom audits, exit0; source SHA256 `c50ac1d4b66bb617fa0b9280c61814dff90aca8d1c23b20f032cd4f629b986dd`, diagnostic SHA256 `44372409c14e0cb20b723f240b7616222f4f0838c0755f71c113e32c8d7814d3`. Serial run: 51GiB available beforehand, 124.32s, 7289084KiB maximum RSS.
- Sketch.lean: 5172 lines, 300 examples, 751 warnings, 20 axiom audits, exit0; source SHA256 `5637c4685130a181a183ba20d87b19fad2728d898590d31880d2fea02764d8b8`, diagnostic SHA256 `ac13fc8b439cb424f8710ebbaf002d10a4de1ee7f93854915e22a43035345db0`. Serial run: 35GiB available beforehand, 84.1s, 7105624KiB maximum RSS.

Suggested.lean equals Canonical.lean exactly, SHA256 `a7f867682cfa63591a5bede1f53ba987aff7f27e9aef8b9cb30c9c8d4e8ca893`. The bounded Mathlib checks do not certify the full Tau file or the remaining geometric obligations.

The actual indexed checker reports666 nodes,407 API entries,340 recognized tests,472 baseline declarations,29 planets,18 gaps and23 requests without errors or warnings. There are390 raw test objects and26 source findings. Actual intake file/authorization and source-issue checks pass. Verification.json and Verification-mathematical.json record actual immutable checker/intake/atlas runs at mathematical base `06a7eaba33d1e9bb44a16665e05c71f29782d8cc` and publication control `3ea89b8d146577c439d728bbd073e88a2ccb3f7f`. All29 guarded inputs and the queue's non-state issue contract are unchanged between those bases; PublicationChanges.json is empty.

The publication graph has stage3043/8727, own666/1593 and scoped3680/11174 vertices/edges, all acyclic. All69 required supplier paths are reachable. Owned dependencies resolve with no skipped or pending links; whole foreign roadmap/stage objects and all stage edges match the publication control. The45 unrelated preexisting missing restructure paths remain unchanged.

## Resume

Use conductorSpecDesc, its four API lemmas and conductorSpec_isPushout as the affine topological interfaces. Transport this result through the canonical affine section identifications, then prove the global finite schematically dominant conductor topology by compatible affine restrictions and gluing. Combine that topology with the inherited actual structure-sheaf pullback and additive sheaf ShortExact theorem to establish the geometric/categorical Scheme pushout. Do not infer arbitrary-open section surjectivity or a scheme universal property merely from the affine topological result.

The global topology/Scheme and algebraic-space pushout, recomputed flat-conductor integration with the SF.0 annihilator supplier, P¹/Proj identifications, projectivity/properness, coherent H0/H1 and genus, separate I₂ and all later model/classification obligations remain required. The source-specific curve-image dimension justification remains a gap. Preserve zero rings, empty schemes, nilpotents and all inherited contracts and source obligations.


## Public recovery and replay

Archive commit `ed2a49a694ad63657aeccb7783c3aec0f849cb04` is an ancestor changing only this issue's suggested file. Its 65 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `af53c0e7832697f2ae98fcadf053bd18e3c8181cbad8ba49bedc59552397e26e`; payload SHA256 `c253120c8742e78994d3c84a3300408d397957d7a210e1439b142699ebe1c38b`. The final suggested file has no archive payload and equals Canonical.lean, whose full Tau-importing file remains UNCOMPILED.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set NERON_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Sketch.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. The full Tau-importing Canonical.lean/Suggested.lean is not covered by these checks and remains UNCOMPILED. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

```python
"""Recover public authenticated affine conductor topology evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='NeronModelsAndSemistableAbelianVarietiesPartII'
ARCHIVE='ed2a49a694ad63657aeccb7783c3aec0f849cb04'
MANIFEST_SHA='af53c0e7832697f2ae98fcadf053bd18e3c8181cbad8ba49bedc59552397e26e'
PAYLOAD_SHA='c253120c8742e78994d3c84a3300408d397957d7a210e1439b142699ebe1c38b'
EXPECTED={'roadmaps': 'd5f243efb3e1d4b2d68184868f5253de4a80a56c1824ea515e424ecc1e19b06a', 'packets': '97bf9b4f61ecac6693ea5d86bcd3cc6f7dd26ed445465d0b86d8864500adc188', 'readmes': 'c4fa094ff3a83c72a770cf7cc9b6c9b8be5e677beb37b67e00c0e798c19fbdb0', 'suggested': 'a7f867682cfa63591a5bede1f53ba987aff7f27e9aef8b9cb30c9c8d4e8ca893'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED AFFINE CONDUCTOR TOPOLOGY PAYLOAD\n',1)[1].split('END ARCHIVED AFFINE CONDUCTOR TOPOLOGY PAYLOAD -/',1)[0].encode()
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
