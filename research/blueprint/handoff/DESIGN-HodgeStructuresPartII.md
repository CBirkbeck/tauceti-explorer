# The affine preconnection category and scalar-extension functor — checkpoint

Codex — codex-7e92bd. Refs #3371. Partial; every implementation remains unchecked.

This checkpoint adds23 declaration nodes: one affine object definition, five categorical constructions and17 API lemmas. Objects are native R-modules with the existing actual additive λ-preconnection; arrows are the subtype of actual horizontal R-linear maps. Native identity and composition give a category, and forgetting gives a faithful functor to ModuleCat. A horizontal linear equivalence constructs an actual categorical isomorphism including its inverse-horizontal proof. Such an isomorphism preserves and reflects actual zero curvature over the same calculus.

For a supplied calculus map along R→S, the actual balanced scalar-extension operator on S⊗_R M and native baseChange of horizontal arrows form a functor. Its target parameter is f(λ). For the identity calculus map, the actual native left-unitor gives a natural isomorphism to the identity functor. The naturality square is proved on elementary tensors using R-linearity. Arbitrary modules and arbitrary λ, including dλ≠0, are allowed; no flatness or scalar-extension faithfulness is assumed. The code fixes a common universe for rings and module carriers, without a mathematical finiteness condition.

These are affine categorical objects, not the reserved global finite locally free integrable ringed-site key. The global key still has its relatively constant parameter, sheaf calculus and actual tensor/restriction requirements. No generic native module carrier or scalar-extension implementation is replanned. The full monoidal category, strong monoidal pullback and categorical tower-coherence package remain open, together with universal exterior powers, duals, actual E1 sheaf restriction/equality detection/gluing, determinant/Tate/period adapters and arbitrary-Q tensor-valued shuffle.

All368 incoming nodes remain whole, with no changes to their mathematical statements, API, tests or statuses. All227 incoming baseline objects remain. The six new definitions/constructions each have at least three API entries and three relevant tests:20 API references to17 distinct lemmas and18 test references to9 distinct typed examples. The tests construct horizontal zero arrows; check composition and faithful detection; check actual coordinate-transport inverse identities and actual curvature reflection; evaluate identity naturality; rule out multiplication by x as a horizontal endomorphism of the ordinary unit connection over Z[x]; retain coordinate x for the λ=x,dλ=1 identity-pulled operator; and retain2≠0,2²=0 over Z/4 through the actual identity-pullback operator and isomorphism. The last test also checks the inverse component at2. No nonflat scalar-extension counterexample is added by this checkpoint.

All149 routed obligations,35 omissions, five requests, eleven whole gaps, six planets and the source issue/version envelope are unchanged. H.0 remains partial and H.1–H.8 remain not_read. Earlier frontier statements remain attributed checkpoint history; no source route or supplier is closed.

## Reading and incoming evidence

The whole22198-character issue was read before claim5975539821. Bot5975540744 confirmed that exact numeric claim; the post-confirmation whole body was unchanged. The complete incoming handoff and all9 incoming new proof declarations/3 examples were freshly read, as were the consumed current global key, intrinsic affine carrier, connection-morphism contract, all five supplier need texts and the entire gap0 history. Existing native definitions and horizontal/transport/pullback proof ranges were read as recorded in Reading.json. No fresh reading of the whole368-node packet or historical reader is claimed.

Incoming peer PR6032 at head e7b340473eefe100d831ff2dd324f4d94e218fbc was recovered from its immutable public archive031eeb98882bd5a594173ff9ee7648b4e92251de. All53 artifacts,9 helpers and5 public deliverables authenticated. Its actual recovered verifier reproduced its report byte-for-byte. The incoming manifest SHA256 is7879f608e81382d8f6c461193648ad4ed77f1c3f7972439e072197126fb7ecf1. Both entire incoming native/canonical prefixes are manifest-bound; the only prefix modification is insertion of the explicit native Mathlib module-category import before the original first import. All original text is retained in order, followed by this continuation.

Own6027 governing-protocol, parent Hodge/Jacobian reader, four reviewed parent-audit row/REV-AUDIT02, ownership/key and supplier/route readings are reused only at unchanged exact hashes and original scope; all37 external controls still match. No reviewed PartII audit row exists. WORKERS was freshly read again, and PROTOCOL4/12 were reread in the preceding6039 job at the same exact hashes. This is not a new full source closure. Bounded name searches in both pinned library trees found no matching AffineCategory or specialized preconnection-category export. Existing ModuleCat, native scalar extension, Faithful and NatIso.ofComponents were read at their exact pinned source statements and reused. Reading.json records actual ranges and hashes, and BaselineReading.json records each consumed declaration.

The complete current displayed Stacks Section60.15, Lemma60.15.1 proof and both public comments were read at https://stacks.math.columbia.edu/tag/07J5. SourceReading.json records the exact HTTP bytes/hash/time; no HTML is archived. This supplies ordinary connection/extension conventions only. The parameter category and functor deductions are authored from existing affine identities. No crystal comparison, full-paper/PDF reading, recursive citation closure or exhaustive errata collation is claimed. The inherited source issue and its version envelope retain predecessor attribution.

## Validation

The entire suggested file imports only Mathlib and compiles at082e2d37e8b0463410cdb532e111cd43d5a66174 with Lean4.34.0-rc2, commit6a10ac8c22beadecabdbb0919c2b50214762f91d. Both Lean checks used the existing exact build serially with the memory guard, one thread,8192MiB managed limit and1200-second timeout. No Lake setup, cache download, library build or language server was started. Every compiler process has finished.

- Native.lean: 3397 lines, 102 examples, exit0, 0 warnings, 174 axiom audits; 51GiB available, 47.28 seconds and peak3753048KiB. Source SHA256 `65686c2c136e7f39d5336da3736ed8c45be16d96a5d7922fcd552f0ab9679d68`; diagnostic SHA256 `21b59367a3c300fc8ac734009d28ac867ab526403ee9c571e7a8f2a6ee152cde`.
- Canonical.lean: 5507 lines, 299 examples, exit0, 708 warnings, 0 axiom audits; 51GiB available, 30.88 seconds and peak3401956KiB. Source SHA256 `cf6a74b3d84a8a77608d542c57948447879f5f4e0746bbab57d0226d552f5666`; diagnostic SHA256 `678cce1f2649eee60fe3f5d8fd7cf55311b3b4cad44bda2749e2b17dd08cad9a`.

All174 native declaration axiom closures use only propext,Classical.choice and Quot.sound; the entire Native.lean contains no admissions and compiled without warnings or errors. The complete Canonical.lean has708 admission warnings only. All23 new declaration headers and9 typed-example headers match their planning projections exactly; concrete definitions remain concrete, while the17 lemma and9 example proofs are admitted in the suggested planning file. The final suggested file is byte-equal to Canonical.lean, SHA256 `cf6a74b3d84a8a77608d542c57948447879f5f4e0746bbab57d0226d552f5666`.

The indexed packet checker, actual intake/file rules and source issue/version checks pass without errors or warnings. The packet has391 nodes, 232 baseline declarations, 381 raw API entries and 349 raw test references. Verification.json records checker-recognized counts and actual graph results. The publication graph has stage3022/8663, own391/768 and scoped3408/9866 vertices/edges, all acyclic. All21 required supplier pairs are reachable. No owned skipped/pending link exists; every foreign roadmap/stage and every stage-edge object matches its control.

Mathematical base `a370bdfc20a2dce561235f634642452348f4d386`; publication base `f487d0a5eaa3bba4e58ded4210c0fe8c32c458c7`. All42 guarded inputs including the five incoming deliverables are unchanged between these bases, and the issue contract is unchanged. Declaration-index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Both Verification-mathematical.json and Verification.json come from execution of the actual immutable verifier, which does not run Lean or create a repository snapshot.

## Resume

Use AffineCategory.category, forget, isoMk, pullback and pullbackIdentityIso as the actual affine categorical entry points. Package the existing same-λ tensor, native associator/unitors/symmetry and horizontal proofs as a monoidal category; then package actual scalar-extension comparisons as a strong monoidal functor. Construct natural categorical tower comparisons and verify their coherence using the existing operator equalities. Continue universal exterior-power and finite-projective dual comparisons. Supply actual E1 sheaf tensor/restriction identifications, equality detection and effective gluing before claiming the general finite locally free integrable ringed-site key. Preserve all149 routed obligations,35 omissions, five requests, eleven gaps and later-source obligations. No implementation, source closure or supplier is marked complete.


## Public recovery and replay

Archive commit `b747718bf53692db1ee21ac03c2b642b7f3f8ba1` is an ancestor changing only this issue's suggested file. Its 55 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `3ecd87ad0a26b7cfee1ddd31913f5103047e13b2401e060343c9ec8894bf65e9`; payload SHA256 `0f1d4d11274bc4561c22daaac08b6254275360ac09332302392a94a0761e9bb8`. The final suggested file has no archive payload and equals the entire compiled Mathlib-only Canonical.lean.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set HODGE_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Canonical.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean and Suggested.lean are byte-equal and the whole file was compiled. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

```python
"""Recover public authenticated affine preconnection-category evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='HodgeStructuresPartII'
ARCHIVE='b747718bf53692db1ee21ac03c2b642b7f3f8ba1'
MANIFEST_SHA='3ecd87ad0a26b7cfee1ddd31913f5103047e13b2401e060343c9ec8894bf65e9'
PAYLOAD_SHA='0f1d4d11274bc4561c22daaac08b6254275360ac09332302392a94a0761e9bb8'
EXPECTED={'roadmaps': '18b1c1bac659fe670ab56d6ca1c713e17a64c48914ce3c68d563306b4066c7e5', 'packets': 'cb6f582b5545065182b5a45052b0eed9b34ce5eb8761f90dcfd907899c249d99', 'readmes': 'd6bd7051723a4da32726099bc68a17bba114419b33898ea993be1128b9b2781e', 'suggested': 'cf6a74b3d84a8a77608d542c57948447879f5f4e0746bbab57d0226d552f5666'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED AFFINE PRECONNECTION CATEGORY PAYLOAD\n',1)[1].split('END ARCHIVED AFFINE PRECONNECTION CATEGORY PAYLOAD -/',1)[0].encode()
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
