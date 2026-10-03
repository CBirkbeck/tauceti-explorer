# Handoff: DESIGN-NeronModelsAndSemistableAbelianVarietiesPartII

Worker **Codex — codex-7e92bd**; Refs #3378. Partial checkpoint; claim comment5969163580 was confirmed by bot5969164531. All seven stages remain partial and all implementation statuses remain unchecked.

## Result and precise boundary

The actual common-ideal comparison c:A→B×_(B/map_f(I))(A/I) has kernel ker(f)∩I and is surjective exactly when the generated ideal map_f(I) equals the set image f(I). With that image condition, the original native CommRingCat square is IsPullback exactly when the kernel intersection vanishes. The reconstruction ring equivalence retains the specified two projections and their inverse/uniqueness laws. The actual additive difference d(b,α)=[b]−q(α) is always surjective; middle exactness is equivalent to the image condition, while initial injectivity is equivalent to the separate kernel condition.

The contracted conductor of any subring extends and maps setwise to the entire ambient conductor, giving the original native conductor square. For any A-algebra B, including noninjective structure maps, the contracted conductor is Ann_A(B/(A·1)). An A-algebra equivalence preserves that full ideal. This applies to the actual all-open algebra equivalence between the two-chart normalization and the native absolute normalization from the incoming checkpoint, including the empty open and inseparable cases.

The new native examples distinguish exactness from initial injectivity, generated ideals from set images, and reconstructed elements from arbitrary representatives. They also check the minus sign, nonreduced identity algebras, the cusp and the characteristic-two empty open.

This closes six previously planned proof nodes, including nine existing named signatures and four existing tests. It adds18 declarations (2 constructions,16 lemmas),8 API items and11 tests. There are562 nodes,368 exact indexed baseline entries,340 required API items,295 required tests and337 raw tests. All544 existing mathematical contracts are preserved;540 whole node objects are unchanged. Four old objects receive only the documented prerequisite/proof-step/test appends. All29 planets,23 requests,17 gaps,78 route rows and21 source issues are retained.

Resume with the native conductor IdealSheafData and principal-affine localization compatibility, then its actual quotient subschemes and structure-sheaf sequence. A section-ring quotient is not being identified with sections of a sheaf cokernel. Finite-pushforward H0/H1, the native P¹ and Proj identifications, projectivity/properness and independent I₂ geometry remain open, as do the inherited classification and family obligations. The full reserved Ferrand scheme/algebraic-space contract and the SF.0 generic flat-annihilator/cohomology boundaries are unchanged.

## Reading and provenance

Fresh source reading: Ferrand, published pp554–557, the introduction and §§1.1–1.4 including the proofs and both1.3 examples, as parsed text from the [Numdam PDF](https://www.numdam.org/item/BSMF_2003__131_4_553_0.pdf). Download SHA2564f1f2438ad6d757d67d2ecf154b1bc920d210d8abd54c02e6acd020805629d91 (699315 bytes). No fresh whole-paper or visual reading is claimed. The [Stacks0E25](https://stacks.math.columbia.edu/tag/0E25) proof was read as global context; its theorem is not newly implemented here. The explicit image criterion, additive maps and all-open transport are authored deductions. Earlier source records and21 findings remain attributed to their previous workers.

All six R11 audit rows and full REV-AUDIT-10, the governing protocols, reserved Ferrand key, relevant current nodes and supplier contracts were read. The relevant statements and ambient assumptions of the12 new baseline citations were read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; consumed Tau Ceti source is pinned at f790474821cf4256814db967cb154e7af3d0c369. Function.Exact and additive projections are generated from the indexed to_additive originals, recorded explicitly. The previously completely read AlgebraicCurves and JacobianChallenge documents were hash-guarded unchanged. All exact-roadmap entries in the immutable link-map scan are reported; none occur.

A bounded Mathlib conductor-title search returned8 entries. Bodies and immutable heads of closed PR29173 and25316 were read; no code was adopted. The complete historical Zulip pushforward/pullback-of-sheaves thread was read as a lead, not current absence evidence. See the archived reading receipt and three prior-art receipts. This is not a complete pending-PR or source survey.

Incoming PR5988 archive27204ea4ae6d6264798a56ebbd9e60703a642b7c was publicly recovered:21 artifact hashes,5 current deliverables and4 helper hashes checked. Its full native and admitted source prefixes are archived here and recompiled. That does not constitute a new manual review of all544 inherited outlines.

## Validation and compilation

The actual indexed checker, actual intake functions and actual inherited-erratum validation envelope are exercised by verify.py. The actual atlas assembler uses immutable git blobs and compares the candidate against its incoming control. All three graphs are acyclic: stage3043/8727, own declaration562/1424 and scoped3576/10901 vertices/edges. All562 declarations resolve. All69 required stage paths hold. The3658 accepted restructure pairs include no own pair;45 unrelated preexisting missing paths remain unchanged. Whole foreign roadmap/stage objects and all stage edges match the control. Own skipped/pending links and unresolved declarations are empty.

Native.lean:5730 lines,230 examples,424 axiom audits, exit0 with43GiB available,63.03 seconds, no warnings or admissions. Every printed dependency uses only propext, Classical.choice and Quot.sound. SHA2566523362bfd9030ba7737c1ce489f3354794d2f6420409d22855a0ce2ac0b0988.

Sketch.lean:3808 lines,249 examples, exit0 with41GiB available,65.33 seconds;599 admission warnings are its only warnings. SHA256978965206ce1cd5f8b0214dceb6b886c49c2ebf02f669db7e14a64581c3d72ec. New native/admitted headers match mechanically, including the local typed lets.

**The full canonical suggested file was not compiled:**5130 lines,326 examples, SHA2562f8bd6c35ce6c6deed9bf5ab248e72abd6327f109e2cb1355453c579a649e605. The available Tau Ceti root build cf386627e9176a3827c1a5fe804989fd94a4d216 differs from the prescribed pin and lacks the RationalFunctions compiled artifact. The bounded checks preserve the incoming Mathlib-only harness and exact consumed pinned source excerpt, with only its module/import/public envelope and redundant universe declaration adapted. They do not certify the full Tau Ceti import graph. No setup, cache download, library build or language server was run. Both checks were serial and capped at1200 seconds. Diagnostic logs normalize only the artifact-directory prefix.

## Immutable recovery

Mathematical base:4c47f9957d8a4e9776f4890d87e2e802fdc13ee3. Publication control base:4f33449e57302cc0fcdd2a5b150d15de6a7d6a53. All24 guarded inputs match at both. The source archive is ce89a1deb59ca5209c1618d530d6f1c624597a8f, an ancestor commit changing only this issue's suggested file; the final suggested file is restored to the canonical planning artifact.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches only the public archive and the five final deliverables, authenticates every archived artifact, and recovers the verification helpers. Inspect the recovered scripts. From an existing repository checkout containing both immutable base commits, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`, using the prescribed pinned declarations.tsv. REPLAY_DIR must be outside the repository. The verifier checks source/header and diagnostics hashes, preserved contracts, the24 input guards, real indexed checker/intake/erratum validator and real atlas assembly. It does not execute Lean or copy a repository.

For optional proof replay only in an already available exact Mathlib build: `python3 REPLAY_DIR/run-lean.py Native.lean EXISTING_BUILD native-replay`; wait for completion before running it for Sketch.lean. The runner verifies the Mathlib pin and tracked cleanliness, checks free memory, refuses below20GiB and enforces1200 seconds. It never sets up or builds libraries and does not certify the full Tau Ceti import graph. The retained local evidence set for this PR contains only the artifacts and recovery/check receipts named here; disposable scratch and the source PDF are removed after submission.

The archive contains42 authenticated artifacts plus their manifest. The manifest SHA256 is `5d741203f63d939ef0b5dcf35a3472122e3a0cddd63d87fe3740f104f503cf25`. The five verification/compiler helper hashes are bound by that manifest. The recovery script SHA256 is `6a989add211adcba74339032c61251bebc4ae350a7095630b1bf71be197fa5a1`. Both immutable-base verifier runs returned zero checker errors/warnings, intake problems/refusals and erratum-envelope errors.

## Script: recover.py

```python
"""Recover and authenticate this checkpoint's inert public evidence. Does not run Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD),'Pass the full immutable PR head SHA.'
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='NeronModelsAndSemistableAbelianVarietiesPartII'
ARCHIVE='ce89a1deb59ca5209c1618d530d6f1c624597a8f'
MANIFEST_SHA='5d741203f63d939ef0b5dcf35a3472122e3a0cddd63d87fe3740f104f503cf25'
EXPECTED={'research/blueprint/roadmaps/NeronModelsAndSemistableAbelianVarietiesPartII.json': '194dec63a4aa3d82dd5c621395f3ce93d2db221961a610bec04ca9e991def801', 'research/blueprint/packets/NeronModelsAndSemistableAbelianVarietiesPartII.json': 'c4b26575adad3a1ebba1ea1e2e6980a4a893cf52ec05141cab68080817a8146e', 'research/blueprint/readmes/NeronModelsAndSemistableAbelianVarietiesPartII.md': '74bf80fc08694c6c166f00661a3449c9aa5cb5c9f411936db66668af0bcd8b09', 'research/blueprint/suggested/NeronModelsAndSemistableAbelianVarietiesPartII.lean': '2f8bd6c35ce6c6deed9bf5ab248e72abd6327f109e2cb1355453c579a649e605'}
h=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=60) as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
payload=json.loads(raw.split('/- BEGIN ARCHIVED COMMON IDEAL PAYLOAD\n',1)[1].split('\nEND ARCHIVED COMMON IDEAL PAYLOAD -/',1)[0])
def unpack(name):
 data=zlib.decompress(base64.b64decode(payload[name]['data']));assert h(data)==payload[name]['sha256'],name
 return data
mb=unpack('artifact-manifest.json');assert h(mb)==MANIFEST_SHA;meta=json.loads(mb)
assert set(payload)==set(meta)|{'artifact-manifest.json'}
for name,m in meta.items():
 assert Path(name).name==name
 data=unpack(name);assert h(data)==m['sha256'] and len(data)==m['bytes'] and len(data.splitlines())==m['lines'],name
 (S/name).write_bytes(data)
(S/'artifact-manifest.json').write_bytes(mb)
public={}
for folder,ext in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]:
 path='research/blueprint/'+folder+'/'+('DESIGN-' if folder=='handoff' else '')+RID+'.'+ext
 data=fetch(HEAD,path)
 if path in EXPECTED:assert h(data)==EXPECTED[path],path
 dst=S/'proposal'/path;dst.parent.mkdir(parents=True,exist_ok=True);dst.write_bytes(data);public[path]=h(data)
assert (S/'Canonical.lean').read_bytes()==(S/'proposal'/('research/blueprint/suggested/'+RID+'.lean')).read_bytes()
handoff=(S/'proposal'/('research/blueprint/handoff/DESIGN-'+RID+'.md')).read_text()
fence=chr(96)*3
code=handoff.split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
assert code==Path(__file__).read_text(),'The current public recovery script must match the script being executed.'
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),publicDeliverables=public,helperHashesVerified=5,recoverySha256=h(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
