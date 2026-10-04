# Natural quotient-to-kernel comparison — checkpoint

Agent: Codex — codex-7e92bd. Refs #642. Partial; all117 nodes remain unchecked.

For arbitrary f:X→Y, native ideal datum I on Y and affine U⊆Y, set V=f⁻¹U, J=I.comap f, E=I(U).map(f.app U), and K=ker(J.ι.app V). The existing inclusion E≤K gives the actual identity-induced ring map Γ(X,V)/E→Γ(X,V)/K. It is always surjective; composing with the injective allOpenToClosed component gives the existing quotientToClosed map exactly. Consequently the new comparison is injective precisely when that existing closed-section map is injective. A single affine inverse image guarantees bijectivity.

Actual restriction compatibility packages the comparison as a native natural transformation from the affine-indexed quotientPresheaf to the reindexed allOpenQuotient. Its composite with allOpenToClosed equals quotientToClosedNatTrans as actual natural transformations. The same natural equality holds through the native sheafification unit and allOpenSheafComparison. For affine f, the new natural transformation is an isomorphism. No flatness, quasi-compactness, Noetherianity, finite-presentation, reducedness or nontriviality assumption is imposed.

Twelve nodes(2constructions10lemmas),10 API entries and7 distinct typed tests are appended. All105 incoming node objects,128 baseline entries,54 old API entries,61 raw old tests,eight gaps,62 source routes,twelve confirmed findings,six reserved-key boundaries,five planets and inherited source issueE1 remain whole. Four native quotient/categorical APIs are added to the baseline. Both constructions have at least three API entries and three tests. All seven stages retain their partial/not_read status; no stage or mathematical implementation is claimed complete.

The tests cover an affine inverse roundtrip, unit ideal, empty base open, a strict-kernel witness to noninjectivity and nonaffineness, two-step restriction, preservation of the nonzero square-zero class2 on Spec(ZMod4), and the full sheaf factorization on every quotient class. The strict-kernel test is parameterized by an actual witness; it does not construct a new concrete nonaffine counterexample. Surjectivity between these quotient rings does not imply surjectivity of the following closed-section map or that either naive quotient presheaf is a sheaf.

## Reading and ownership

The entire55077-character issue was read before claim5976716954 and reread after bot5976717803 confirmed it. The unchanged body SHA256 is c08c1d0eb0edc9fd4ce94b778e1dfbe34aa995c8d47c6cdced5961d3ef21e439; ClaimReceipt.json records complete ranges. Current handoff mathematical narrative and recovery, all eight gap contracts, full SF.0 frontier and both complete Neron consumer SF.0 request objects were freshly read. The complete current SF.0 reviewed AUDIT-01 row and REV-AUDIT-01 metadata were read before planning. Other unchanged protocol/audit/upstream/link/source scopes retain own6035 attribution and its own6025/6017 chain, restricted to the27 unchanged external controls among32; four owned inputs and the consumer packet changed. Hash equality is not a fresh full-file reading.

Peer6040 at immutable head1113e077d95c6ee51f700b43994f9503613a639b was publicly recovered:57 artifacts,10 helpers and4 final deliverables. Its actual recovered immutable verifier reproduced the archived report byte-for-byte. All four mathematical input files match that public head. The20 new declarations and9 tests, consumed quotientPresheaf/comapObjNatIso and extendedIdeal_le_ker/quotientToClosed blocks, and actual verify/immutable/graph/projection/compile/runcheck helpers were freshly read. The complete1447-line native prefix is authenticated and recompiled; no fresh whole-prefix or105-node manual proof audit is claimed. Peer reading attribution is not borrowed.

Fresh primary reading covers the complete current displayed mathematical statements, proofs and page comments of Stacks01IN,01IQ and01JU. SourceReading.json records actual HTTP hashes/access times without retaining source HTML or PDFs. These sources establish the closed-immersion kernel and image-ideal pullback context; the twelve precise comparison formulas are authored deductions from pinned native APIs and the existing actual constructions. No new finding was identified in that bounded reading. Historical route/finding/source scopes and E1 retain their attribution; no fresh inherited erratum/history, whole-paper or recursive citation closure is claimed. Search.json records bounded exact-name scans across both complete pinned source trees and current packets, not semantic or online-work absence certification.

## Validation

The complete Mathlib-only suggested file equals Canonical.lean and compiles at exact Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 with Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d. Native.lean recompiles the whole authenticated incoming proof prefix, all new bodies and tests, and all88 audits. It has no errors, warnings or admissions; every audit uses only propext,Classical.choice and Quot.sound. Canonical has176 admission warnings only. All12 new declaration headers and7 example headers match their admitted projections, while actual quotient carriers, identity-induced maps, natural-transformation components and restriction data remain intact.

The existing exact build was reused; no Lake setup/update/cache/library build or language server was used. Runs were serial, guarded by available memory≥20GiB immediately beforehand, capped at8192MiB and1200seconds. The log runner resolves scratch paths before sanitizing them. No Lean process remains running at submission.

- Native.lean: 1661 lines, 53 examples, exit0, 0 warnings, 88 axiom audits; 53GiB available, 19.87s, peak3247992KiB. Source SHA256 `d48b5735a359e61be72b03cde9c3e395a7c9bd706f1bb350af74eb56ab2934f4`; diagnostic SHA256 `328474a6fe93251b8763b033b6edf0b4f5a27d925edb0142eebd7902be31795f`.
- Canonical.lean: 1451 lines, 74 examples, exit0, 176 warnings, 0 axiom audits; 53GiB available, 7.46s, peak3259260KiB. Source SHA256 `331dfbf7e204237d099b563f45995fc4b249af0666dc0b02aefa1e509f4e79c2`; diagnostic SHA256 `c9ef27541f5bd7a9e485b0baf75c100966da662d1c4ac2ca248b914f01f33fdd`.

The actual indexed checker reports117 nodes(1definition15constructions95lemmas6theorems),64 API entries,61 recognized tests(68raw),132 baseline declarations and5 planets, with zero errors/warnings. Actual intake and source/errata functions pass. Immutable atlas assembly has stage3012/8643, own117/181 and scoped3124/8939 vertices/edges, all acyclic. All6 required supplier and27 owned accepted-restructure pairs are reachable, with no unresolved or owned skipped/pending links. Whole foreign roadmap/stage objects and whole existing stage-edge objects match each control;45 unrelated preexisting missing restructure paths retain their hash.

Mathematical base `3ea89b8d146577c439d728bbd073e88a2ccb3f7f`; publication control `075c0335ac68e4e2af7a24c80e8a72f2bb4508cf`. Both actual immutable reports are archived. All32 input guards agree except1 reviewed consumer-packet change recorded in InputChanges.json. At publication both complete SF.0 request objects were freshly reread and remain exactly equal. The changed consumer is own6047, whose public evidence was verified in this session; no fresh whole666-node manual audit is asserted. No new outgoing request is added. Both incoming consumer requests remain open.

## Retained findings and reserved definitions

The following block is inherited whole from the incoming6040 handoff with its original attribution. It records ownership and unfinished work, not new implementation or a fresh historical review:

The following exact ownership boundaries are retained from peer PR #6035 with their original attribution; this continuation does not claim their implementation.

- RT-AREA-algebraicgeometry/1: unimplemented. General spaces/stacks belong here; R09 receives the exported interface.
- RT-AREA-algebraicgeometry/8: unimplemented. NS and Picard number remain with A2, not duplicate generic SF.3 theory.
- RT-AREA-algebraicgeometry/11: unimplemented. Weil restriction follows MC0F → RG2.0a → R09.3; import that owner.
- RT-AREA-algebraicgeometry/15: unimplemented. Use genuine SF.3/R09.1/coherent-duality prerequisites and remove spurious reduction paths through the eventual reviewed link changes.
- RT-AREA-algebraicgeometry/16: unimplemented. Recommends SF.4 as single alteration supplier to L5; conflicts with etale/21.
- RT-AREA-algebraicgeometry/17: unimplemented. Use pointed-curve moduli R09.4/R09.5 as alteration inputs, not an SR object theorem.
- RT-AREA-algebraicgeometry/18: unimplemented. General coherent duality extends the curve-scoped SR2 contract.
- RT-AREA-algebraicgeometry/31: unimplemented. Import ComplexComparison C5 for the arithmetic cohomology comparison.
- RT-AREA-etale/2: unimplemented. Absolute purity belongs to EtaleDualityAbsolutePurityPartII; split early SF.2 site foundation from late comparison to prevent a cycle.
- RT-AREA-etale/21: unimplemented. Recommends new L5:alterations as supplier to SF.4; conflicts with algebraicgeometry/16.
- RT-AREA-ktheory-2/38: unimplemented. General Nisnevich site and henselian point foundation must be supplied here.
- RT-AREA-geomlanglands/15: unimplemented. Single positivity/Keel supplier here; GS consumes the result.

The exact reserved-key boundaries remain:

- SchemeAndStackFoundations:key/excellent-schemes: unplanned. Exact reserved ID retained as unfinished work, not falsely supplied by a placeholder node.
- SchemeAndStackFoundations:key/scheme-brauer: unplanned. Exact reserved ID retained as unfinished work, not falsely supplied by a placeholder node.
- SchemeAndStackFoundations:key/coherent-duality: unplanned. Exact reserved ID retained as unfinished work, not falsely supplied by a placeholder node.
- SchemeAndStackFoundations:key/henselization: planned_with_gaps. Twenty-nine-node strand, including six functorial-map declarations, four finite-data adapters and four actual-section adapters. Universal-property proof leaves and other sample API comparisons remain open; PerfectoidSpaces overlap is explicit.
- SchemeAndStackFoundations:key/equivariant-sheaf-cohomology: unplanned. Exact reserved ID retained as unfinished work, not falsely supplied by a placeholder node.
- SchemeAndStackFoundations:key/galois-gerbs: unplanned. Exact reserved ID retained as unfinished work, not falsely supplied by a placeholder node.



## Resume

Use quotientToKernel, quotientToKernelNatTrans and their natural/sheaf factorization laws as the actual bridge between image-ideal and immersion-kernel quotients. For an affine morphism the transformation is an isomorphism. A useful next general contract is compatibility with composition of scheme morphisms and the canonical ideal pullback comparison, retaining actual inverse-image functors and maps; for arbitrary inverse images keep the injectivity criterion explicit. Do not infer a global section-surjectivity or sheaf condition from this componentwise surjective bridge.

All eight existing gaps remain. Complete the henselization lifted-selector quotient/localization and source/universal-property leaves, remaining sample API and carrier consolidation with PerfectoidSpaces; plan the five other reserved keys from their complete briefs. Preserve all62 routed sources and the unresolved alteration ownership conflict. Conductor identification, scheme pushout and recomputed flat conductors remain with the Neron consumer. Generic Proj, coherent and other-stage obligations retain their scopes. No source, stage or roadmap is certified complete.


## Public recovery and replay

Archive commit `4d37e818f19143883857e5c0e66cf306d280019e` is an ancestor changing only this issue's suggested file. Its 59 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `74840cf3b0c894b9cafc3e9a7cec6cadc3637e32ce6fa64ca9a24ab6bca01ac3`; payload SHA256 `d65fcb8bdfe8971bf42507753b32fb3010a085ee5749100d34975ae805d1f1c6`. The final suggested file has no archive payload and equals Canonical.lean, whose complete Mathlib-only file was compiled.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and four final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set SCHEME_VALIDATE_BASE to the mathematical base to reproduce MathematicalVerification.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Canonical.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. The complete Mathlib-only Canonical.lean/Suggested.lean is covered by the second check. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

```python
"""Recover public authenticated quotient-to-kernel comparison evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='SchemeAndStackFoundations'
ARCHIVE='4d37e818f19143883857e5c0e66cf306d280019e'
MANIFEST_SHA='74840cf3b0c894b9cafc3e9a7cec6cadc3637e32ce6fa64ca9a24ab6bca01ac3'
PAYLOAD_SHA='d65fcb8bdfe8971bf42507753b32fb3010a085ee5749100d34975ae805d1f1c6'
EXPECTED={'packets': '5045fb13b6e96f4e7315fc3c82047a385f5b82f4b0098dc64235c343daeb993b', 'readmes': '6c36d9bc6217cdf3e522b5ce508763fad03ee3a98078e66b65460896d60f8a34', 'suggested': '331dfbf7e204237d099b563f45995fc4b249af0666dc0b02aefa1e509f4e79c2'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED QUOTIENT KERNEL COMPARISON PAYLOAD\n',1)[1].split('END ARCHIVED QUOTIENT KERNEL COMPARISON PAYLOAD -/',1)[0].encode()
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
(S/(RID+'.json')).write_bytes((S/'Candidate.json').read_bytes())
fence=chr(96)*3;handoff=(S/'PublicHandoff.md').read_text()
assert handoff.startswith((S/'HandoffBase.md').read_text())
code=handoff.split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from public handoff.'
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
