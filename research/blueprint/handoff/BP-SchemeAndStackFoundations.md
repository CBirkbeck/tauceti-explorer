# Affine inverse-image ideals — checkpoint

Agent: Codex — codex-7e92bd. Refs #642. Partial; all implementations remain unchecked.

Nine new declarations (eight lemmas and one construction), three API entries and five typed tests identify the full ideal of native inverse-image closed subschemes on affine charts. If U and f⁻¹U are affine, then (I.comap f)(f⁻¹U)=I(U).map(f.app U), for arbitrary f and native IdealSheafData I. Neither flatness nor finiteness is assumed. The affine-morphism specialization uses the native preimage-affineness instance. No second ideal-sheaf, quotient-ring or closed-subscheme carrier is planned.

The global affine proof uses native ofIdealTop, affine ideal determination, the comap/map adjunction and its unit. Restriction transports through the actual morphismRestrict square and the two canonical topIso maps. The quotient comparison composes native subschemeObjIso with quotEquivOfEq for the full ideal equality. Its inclusion square compares actual CommRingCat section morphisms; forward and inverse representative formulas fix the coordinates. Native comapIso already identifies the closed subscheme with the fiber product.

The tests check arbitrary affine composition, empty opens without global affineness, both quotient directions, the nonzero ideal(2) pulling back to zero under Spec(Z/2)→Spec(Z), and the nonzero square-zero quotient coordinate2 on Spec(Z/4). The last test rules out replacing a full ideal by its radical. The nonflat test concerns the image ideal, not an assertion of injectivity after module pullback.

All50 incoming whole nodes,17 old API entries,27 old raw tests,8 gaps,62 routed sources,12 confirmed findings,6 reserved-key boundaries and inherited source issueE1 are preserved. The seven stages retain their partial/not_read status and the five planet objects remain unchanged. Incoming PR6020 was recovered at immutable heada78ba006a573efbf792ecefc17ac132c9f2479fc:53 artifacts,8 helpers and4 final deliverables authenticated. Its actual immutable verifier replay matched the archived report byte for byte. The new quotient/cokernel native proofs and current handoff were read; historical claims retain their original attribution.

Fresh source readings cover the complete statements and displayed proofs of Stacks01JU,01HQ and01IN and the complete Definition01JV. SourceReading.json binds each fetched page by HTTP hash and access time; source HTML is not archived. These sources identify geometric inverse images and affine closed-subscheme quotients. The declaration-sized affine-section comparisons are authored deductions from the pinned native API. No whole-paper or fresh inherited-erratum audit is claimed. Bounded open Mathlib PR and archive name searches returned no matches; this is not an exhaustive absence claim and no external implementation was adopted.

Reading.json records the freshly read SF.0 reviewed library audit and exact native source ranges. Own6017 scope/protocol readings are reused only for unchanged guarded files. IncomingInputChanges.json records the four owned checkpoint files changed by6020. The publication control additionally includes the exact own PR6023 conductor packet, whose two generic SF.0 requests remain unchanged. Its conductor-specific formula remains owned by that consumer and does not import this new generic strand. No consumer request is closed wholesale.

## Validation

The entire Mathlib-only canonical suggested file was compiled at082e2d37e8b0463410cdb532e111cd43d5a66174 with Lean4.34.0-rc2. All runs were serial on the existing exact build after checking at least20GiB available, with timeout1200 seconds, one thread and8192MiB limit. No library setup, cache download, library build or language server was used. Native proofs have no admissions, errors or warnings; all30 native axiom closures use only propext,Classical.choice and Quot.sound. The canonical and its five inherited axiom-audit extension have only admission warnings. Nine declaration headers and five test headers match their admitted projections exactly, while the constructor body remains concrete.

- Native.lean: 639 lines,20 examples,exit0,0 warnings,30 axiom audits,36GiB available; elapsed6.46s,peak3183804KiB. Source SHA256 `c64a80091f22b41841f4019641da7ced023dea77471ec666ccb94225d9309a91`; diagnostic SHA256 `f50a0c98e88ff93eef2a2dbe9967e20633acf9f9e65614f1651e18e37430cb12`.
- Canonical.lean: 763 lines,41 examples,exit0,88 warnings,0 axiom audits,36GiB available; elapsed3.66s,peak3218092KiB. Source SHA256 `4cffbdda4cd2a18881f9e0888de9dbdfd0b8ff90c5cf3820555370684e4816e3`; diagnostic SHA256 `d5847a3c97dc83cb67a1fb115cc97e60344c79aab38a216f8401b9a8a0962ef2`.
- Sketch.lean: 769 lines,41 examples,exit0,88 warnings,5 axiom audits,36GiB available; elapsed3.66s,peak3220164KiB. Source SHA256 `9eafd730736cbb7cdb4a53bb5e15407d8dfb6543afbe4d23e7a4f0a7e5998847`; diagnostic SHA256 `f591ce1f4c00705a661c1265ec0437d55c70b5efb5a19d09bce9b0e8deb76255`.

The indexed packet checker reports59 nodes,20 API items,25 recognized tests,101 baseline declarations and5 planets, with no errors or warnings. Raw tests total32. Actual intake authorization/file checks and inherited raw source-version/errata checks pass. Actual immutable assembly has stage3012/8643, own59/94 and scoped3066/8794 vertices/edges, all acyclic. All6 required supplier pairs and27 owned restructure pairs are reachable. There are no unresolved leaves or owned skipped/pending links. Whole foreign roadmap/stage objects and all stage-edge objects agree with the publication control;45 unrelated missing restructure paths remain unchanged.

Mathematical base `a17d8595de0eab8536d39433922d2e76a3367c1a`; publication control `3c0655be1ec51eacb75f07bffc3135262ad7fb50`. All32 inputs are hash-guarded. One changed input, the own PR6023 conductor packet, is explicitly reviewed and authenticated; all other guards agree. All four incoming deliverables and the issue contract are verified against the mathematical base. Verification.json records these checks and the immutable publication assembly. The suggested file equals Canonical.lean, SHA256 `4cffbdda4cd2a18881f9e0888de9dbdfd0b8ff90c5cf3820555370684e4816e3`.

## Resume

Use ideal_comap_affineOpen for arbitrary maps with affine source/target opens, or ideal_comap_of_isAffineHom for affine morphisms. Use comapObjIso and its inclusion square when comparing actual closed-subscheme section maps. Integrate this generic supplier into consumer plans without duplicating their conductor definitions. Prove the remaining overlap and all-open structure-sheaf comparisons and recomputed flat-conductor results separately.

All eight existing gaps remain explicit: henselization coequalizer/scalar-tower coherence, lifted selectors, outstanding source leaves, remaining henselization API, five other reserved key definitions, alteration ownership conflict, seven-stage/source-route closure and the overlap with PerfectoidSpaces pair henselization. This continuation does not close those obligations or the six reserved-key boundaries. The complete roadmap still requires source extraction and planning beyond this native API strand.

## Public evidence and replay

The47 evidence artifacts and9 helper scripts are in an inert compressed comment at ancestor commit [d96ef29afbee0b86732ac7020dec7bf40f2c7968](https://github.com/CBirkbeck/tauceti-explorer/blob/d96ef29afbee0b86732ac7020dec7bf40f2c7968/research/blueprint/suggested/SchemeAndStackFoundations.lean). The final suggested file contains only the checked canonical planning file. Archive manifest SHA256 `0723318bda90ba549673ad82c3e51addb72e73944c1843e1afd9cff753b47858`; payload SHA256 `b5b65dc6a2fc23a2c0e5b63e7110a17a4a38b84fa85502e969424bd26003a2ac`; recovery script SHA256 `c75836d86a6d74d249f68bfba65aa56ab1f8f1c4979e52723df58f37a604ecec`. The manifest binds every proof, diagnostic, receipt, projection, verifier and handoff prefix. The recovery script authenticates the four final public deliverables and verifies that its executed source is exactly the script in that head's handoff.

Save the script below as recover.py and choose a persistent on-disk EVIDENCE directory. Pass the full immutable final pull-request head, not the archive commit:

```sh
python3 recover.py EVIDENCE FINAL_HEAD
python3 EVIDENCE/verify.py EVIDENCE DECLARATIONS_INDEX > EVIDENCE/ReplayedVerification.json
cmp EVIDENCE/ReplayedVerification.json EVIDENCE/Verification.json
```

Run verification from the repository root. The index SHA256 must be `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`. The helper reads mathematical and publication controls by immutable git blobs; it creates no repository snapshot and executes no Lean. It invokes the actual indexed checker, source-issue validators, intake checks and assembly routines. Missing artifacts or failed comparisons stop replay.

For an optional fresh serial Lean run, the existing exact build and executable are arguments to runcheck.py. Follow WORKERS.md memory and time guards; never prepare a project or download/build dependencies. Run one file at a time and keep no process running at job end. The archived diagnostics are the original checked runs, not a promise about a different environment.

## Script: recover.py

```python
"""Recover public hash-authenticated affine ideal pullback evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='SchemeAndStackFoundations'
ARCHIVE='d96ef29afbee0b86732ac7020dec7bf40f2c7968'
MANIFEST_SHA='0723318bda90ba549673ad82c3e51addb72e73944c1843e1afd9cff753b47858'
PAYLOAD_SHA='b5b65dc6a2fc23a2c0e5b63e7110a17a4a38b84fa85502e969424bd26003a2ac'
EXPECTED={'packets': '674df90c195cd0cb2566674c4de43b018cc3d92d3617d7ac54dba54746ff4dfd', 'readmes': 'c0b224e00f46b66486dd659366c403a0692196b070b9cf3c6649fb731cc125c8', 'suggested': '4cffbdda4cd2a18881f9e0888de9dbdfd0b8ff90c5cf3820555370684e4816e3'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=(raw.split('/- BEGIN ARCHIVED AFFINE IDEAL PULLBACK PAYLOAD\n',1)[1].split('END ARCHIVED AFFINE IDEAL PULLBACK PAYLOAD -/',1)[0]).encode()
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
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=9,publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
