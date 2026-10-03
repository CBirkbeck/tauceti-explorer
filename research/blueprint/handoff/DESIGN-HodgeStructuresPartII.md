# DESIGN-HodgeStructuresPartII — balanced affine pullback checkpoint

Worker Codex — codex-7e92bd; issue [#3371](https://github.com/CBirkbeck/tauceti-explorer/issues/3371). Claim5970104904 was confirmed by bot5970106152; the complete22198-character issue was reread unchanged. This is a partial checkpoint, not library implementation or closure of the reserved key.

## Result and mathematical boundary

Sixteen new affine declarations construct the actual balanced additive lift on S⊗_R E, prove its single-f(λ) Leibniz rule, horizontal unit, uniqueness, curvature on the unit and every generating tensor, all-target flatness, reflection with explicit degree-two injectivity, and preservation of horizontal maps by native LinearMap.baseChange. The three constructions have14 consumed API items and14 typed tests. No basis, projectivity, flatness, field or characteristic hypothesis is imposed. Module universes remain independent.

The formula is D_S(s⊗e)=s(η⊗β₁)D(e)+f(λ)η(e)⊗dΓ,₀s. Balancing uses the source Leibniz and target derivation rules plus dΓ,₀f(a)=β₁dΩ,₀a. Target flatness uses dΩ,₀λ=0, its transported target equation, curvature linearity and tensor generation. It never uses surjectivity of η. Reflection requires injectivity of η⊗β₂ itself.

A constructed ℤ→ℤ[x] example starts with D=unit(2)=0 over the zero source derivation and obtains the nonzero derivative 2((1⊗1)⊗1) at x⊗1. The actual target curvature is zero everywhere. Native right unitors prove the value is nonzero. A second example proves η is not surjective by coefficient-one extraction. The other12 tests cover balancing, additivity, the parameter, uniqueness, flatness and horizontal maps.

Still required: monoidal/exterior-power and iterated-base-change coherence for this operator; genuine E1 sheaf tensor/restriction identification, equality detection and effective descent; arbitrary-Q tensor-valued shuffle; determinant/Tate/period adapters; and the general finite locally free ringed-site key. All149 routed paper obligations,35 typed omissions, five supplier requests,11 gaps, one EG20/E10 source issue and H.1–H.8 remain. H.0 stays partial; all321 implementationStatus fields remain unchecked. The two modified parent nodes retain their entire mathematical contracts, with one prerequisite and one proof step appended each.

## Reading and preservation

The authenticated incoming native file and all five incoming deliverables are retained byte for byte. Prior checkpoint [#6001](https://github.com/CBirkbeck/tauceti-explorer/pull/6001), head9ab43b82ec711cc15b4d62fff6696fe47b54c1dd, supplied the semilinear calculus comparisons. Its full handoff is retained as Incoming-handoff.md in the archive, with its original evidence and recovery script; its reader remains the exact suffix of this reader.

The current issue, governing instructions, parent HodgeStructures reader, four reviewed audit rows and REV-AUDIT-02, all9 proposed stages, five supplier requests and their stages, reserved key/survey/ownership records and exact pinned tensor declarations were read to the extents in reading-receipt.json. This does not claim a fresh complete review of all inherited305 node proofs or every historical source. All305 incoming mathematical contracts are mechanically preserved;303 node objects are wholly unchanged.

Esnault–Groechenig's author44-page copy was reread at author pp23–24, including the full printed Lemma4.9 proof. SHA256 0bfa00b7dbae7a59c193d3523028df826741f15d3e88cb50526f8656a7fb8e35. The complete Stacks07J5 section and Lemma60.15.1 proof were reread; HTML SHA256 f76cdf52eac191ad0baa040bc0160491838ec725db3579837fac2e60d874ceea. These are authored deductions from the Leibniz/extension equations, not source claims about arbitrary-ring pullback. No new published-version collation or rendered-image inspection is claimed. The inherited version records and EG20/E10 finding remain unchanged. Bounded pinned searches and current open-PR/Zulip checks are recorded without claiming exhaustive absence.

## Validation

Mathlib is pinned at082e2d37e8b0463410cdb532e111cd43d5a66174; the planning baseline also records Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Both experiments use only Mathlib imports in an existing exact tracked-clean build. No project setup, package update, cache operation or library build occurred. One compiler ran at a time, with the free-memory check immediately before each invocation and a1200-second timeout.

- Native.lean:1879 lines,63 examples,104 clean axiom audits, no admissions, errors or warnings;37GiB available before the final run. SHA256 e7fcfaee1258cd99fd66d79656b9e3316e40cbcfcbb169f6cae9c5a1ed454161. All audited axioms are among propext, Classical.choice and Quot.sound.
- Canonical.lean: the entire4330-line suggested file,260 examples,607 admission-only warnings, no errors or other warnings;36GiB available. SHA256 a740f6d4acd5350defe6c1cfc826c554074062648103c0d4a5bbd5dc040952ee. Its incoming prefix is unchanged. The projection preserves all30 new declaration/example signatures and the three concrete constructions; it admits only the new lemma/example proof leaves.
- Actual indexed checker:321 nodes,219 baseline declarations,316 deduplicated API items/324 raw,286 deduplicated tests/301 raw, six planets, no errors or warnings. Actual source-issue/version checks and extracted real intake rules pass.
- Actual immutable atlas assembly:3022 stage vertices/8663 edges; own321 declarations/631 edges; scoped3338 vertices/9659 edges, all acyclic. All21 supplier paths exist. The one external declaration is ColemanPowerSeries:L1/derivation-determinant-unit. No unresolved references, own skipped links or pending links. Stage edges and whole foreign roadmap/stage objects match the unmodified assembly.
- Mathematical base f68f2769c60a6d1761f2cac677d1c71619049a43; publication base f6213b8004ec27a5c3f7f45b1947112569e1cb0c. All29 guarded inputs and all five incoming owned files were unchanged. The verifier independently checks both immutable trees, the preservation equations, recorded hashes, source issues, intake and graph.

## Public evidence and replay

The38 evidence artifacts and six helper scripts are stored in the inert archive comment at ancestor [191e40325102922ad0c8a7057de6e38967b34885](https://github.com/CBirkbeck/tauceti-explorer/blob/191e40325102922ad0c8a7057de6e38967b34885/research/blueprint/suggested/HodgeStructuresPartII.lean). The final suggested file is exactly Canonical.lean and omits this new archival wrapper. Manifest SHA256 dfe6f7cf8258697a04369b2c62d906cf22d61e1d636b90bf972ae3c777c97805. No PDF or extracted source text is committed.

Save the exact recover.py below, then run it with an empty output directory and the40-character PR head. It downloads only public GitHub bytes, authenticates the manifest and every artifact, checks all five deliverables and its own public script. Recovery does not run Lean.

```bash
python3 recover.py recovered PR_HEAD_40_HEX
# From an existing atlas checkout containing the two recorded commits:
python3 recovered/verify.py recovered DECLARATIONS_TSV
# Optional, one at a time, in an existing exact Mathlib build:
python3 recovered/run-lean.py Native.lean EXISTING_BUILD native-replay
python3 recovered/run-lean.py Canonical.lean EXISTING_BUILD canonical-replay
```

The declaration index must be the real pinned TSV, SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. The verifier defaults to the immutable publication base. Set HODGE_VALIDATE_BASE to the mathematical base to replay that tree. The optional compiler helper enforces the Mathlib pin, tracked cleanliness,20GiB available memory and the timeout; do not overlap the runs. Full logs and memory/RSS receipts are in the archive.

## Script: recover.py

```python
"""Recover public, hash-authenticated affine-pullback evidence; never runs Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='HodgeStructuresPartII'
ARCHIVE='191e40325102922ad0c8a7057de6e38967b34885'
MANIFEST_SHA='dfe6f7cf8258697a04369b2c62d906cf22d61e1d636b90bf972ae3c777c97805'
EXPECTED={'roadmaps': '26684292caf032654e4fadfa5a4ec960d7f5a9bf670f83c307f416f29192ae0e', 'packets': 'efabc5fce1c962c5d8421db76f5ac716673b725dbaeabb07a540ac9d4aa56938', 'readmes': '6593b13a9a7204672b25382ee5ba5639bde24a2e70b6bc17aaf49d92e252afdc', 'suggested': 'a740f6d4acd5350defe6c1cfc826c554074062648103c0d4a5bbd5dc040952ee'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=60)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
payload=json.loads(raw.split('/- BEGIN ARCHIVED HODGE AFFINE PULLBACK PAYLOAD\n',1)[1].split('\nEND ARCHIVED HODGE AFFINE PULLBACK PAYLOAD -/',1)[0])
def unpack(name):
 b=zlib.decompress(base64.b64decode(payload[name]['data']));assert sha(b)==payload[name]['sha256'],name
 return b
mb=unpack('artifact-manifest.json');assert sha(mb)==MANIFEST_SHA;meta=json.loads(mb)
assert set(payload)==set(meta)|{'artifact-manifest.json'}
for name,m in meta.items():
 assert Path(name).name==name
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
code=handoff.split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from current public handoff.'
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=6,publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
