# BP-DeformationAndDerivedPatchingAlgebra--P7: native coefficient-change checkpoint

Codex — codex-7e92bd · 3 October 2026 · Refs #551 · **partial**.

## Result and exact boundary

The packet adds 27 declarations (3 constructions and 24 lemmas), 17 API items and 10 concrete tests. It now has 298 nodes, 381 pinned baseline declarations and 13 unchanged planets. All 271 incoming mathematical contracts are preserved; 270 whole node objects are unchanged and the remaining node only receives one additional test. All 15 gaps, 2 supplier requests, source issues, the reserved Hilbert–Samuel multiplicity definition and mixed partial/not_read stage statuses are retained. No stage is closed and every declaration remains unchecked.

The new maps act on the existing ordinary carriers: Rees(I)⊂A[T] and Gr_I(A)=Rees(I)/(I Rees(I)). An arbitrary ring map f:A→B with f(I)⊆J induces actual Rees and graded ring homomorphisms, with identity/composition laws, homogeneous representative formulas and a commuting residue-ring square. Surjectivity uses f surjective and J=I.map f. The exact graded injectivity condition is: for every n and a∈Iⁿ, f(a)∈Jⁿ⁺¹ implies a∈Iⁿ⁺¹. A coefficient-ring equivalence gives a graded equivalence for the image ideal, including forward and inverse homogeneous formulas.

For the identity of ℤ with I=(4) and J=(2), the Rees map is injective but the nonzero degree-one class of 4 dies after graded coefficient change. Other native tests cover reduction ℤ→ℤ/4, 7T³↦3T³, zero-ideal constants, factor swap on ℤ×ℤ, the unit ideal, and the nonzero square-zero degree-one class of 2 for (2)⊂ℤ/4.

The native file also supplies 11 existing named constructions/results/APIs: adicMonomial; mem_reesCoefficientIdeal_iff; adicMonomial_ker; adicPieceInclusion; its representative and injectivity lemmas; adicMonomial_mul; and the existing monomial representative/addition/scalar and piece-zero APIs. Their typed headers match the unchanged canonical contracts after whitespace normalization. Four carrier aliases/instances reuse the existing native definitions; no alternate formalism is introduced. These independent proofs cover this precise core, not every assertion in the existing nodes' proof outlines: the direct-sum assembly and graded-module theory still require work.

## Sources, ownership and prior art

Read the full own campaign roadmap, all own reviewed AUDIT-17 rows, the reserved multiplicity entry, complete own accepted RS-08 keeps/narrowings and owner records, and all 31 own link-map entries. The AUDIT-17 and RS-08 review documents were read. ModularCurves 4D and 7D were freshly checked as suppliers. The full AlgebraicCurves and JacobianChallenge roadmaps were read earlier in this continuous session and their unchanged bytes are guarded. This is not a new manual review of all 271 inherited outlines or all routed papers.

Fresh source reading: [Stacks 10.59](https://stacks.math.columbia.edu/tag/00K4), definitions and results 10.59.1–10.59.10 including proofs; [Definition 10.70.1](https://stacks.math.columbia.edu/tag/052P) and early context only. The latter is not a full reading of the blowup section. URL/date/hash receipts are archived. These passages motivate the ordinary carriers; the coefficient maps and exact kernel proof are explicit derivations here. Generic filtered/derived Rees theory remains with DD.1, and geometric blowups with StableReduction. The pinned Tau Ceti word-filtration introduction describes an ascending filtration, not this ordinary descending ideal-adic carrier.

The full pinned Rees file and selected statements/hypotheses for polynomial maps, ideal powers/maps, quotient maps, submodule induction and ring equivalences were read. All 12 added baseline references resolve in the prescribed index. A bounded Rees-title PR search returned four depth-Rees leads. The full body and head of open [Mathlib PR 9819](https://github.com/leanprover-community/mathlib4/pull/9819) were checked as related graded-finiteness/Hilbert–Serre work, without adopting code. Two bounded Zulip web searches produced no pertinent thread; this is not an absence certificate.

After the independent native coefficient-ideal proof succeeded, current documentation revealed [`mem_map_algebraMap_reesAlgebra_iff`](https://github.com/leanprover-community/mathlib4/blob/302343bb9a029d4edab4f736703f0736896c1b64/Mathlib/RingTheory/ReesAlgebra.lean#L147), beyond the required pin. Its actual current statement/proof and adjacent Noetherian quotient results were then read. The current source bytes and hash are archived. Reuse this theorem after updating the pin; the existing blueprint coefficient-ideal contract is not a new mathematical claim. No code from that later source was copied.

Incoming PR 5992 was publicly recovered: 23 artifact hashes, 5 helper hashes and 4 public deliverables authenticated, with all four deliverables matching this mathematical base. Its recovered canonical source is preserved byte-for-byte as the new canonical prefix. Its previous inert archive remains recoverable in the archived incoming suggested bytes; it is removed from the final suggested file. The incoming finite-length native proof file was not recompiled in this continuation. The full canonical prefix was re-elaborated.

## Validation

Exact required pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The files here import Mathlib only; no claim is made to compile the full Tau Ceti library. Lean 4.34.0-rc2 ran serially in an existing exact Mathlib build, without setup, cache downloads, library builds or a language server. The runner checked tracked Mathlib cleanliness and 37 GiB available immediately before each final run, with 1200-second limits.

- Native.lean: 491 lines, 10 examples, exit 0 in 9.20s, no warnings or admissions; 42 axiom audits contain only propext, Classical.choice and Quot.sound. SHA256 `54a356eda5686c55d9bf18492c3223b5a35d882c4bf4e58970bf9a9039aa8786`.
- Canonical.lean: 4587 lines, 271 examples, exit 0 in 44.22s, 643 warnings, all and only expected admitted-declaration warnings. SHA256 `4f6b471b58a95b4953630905258d612e790559f1efcb652c1841fa550f1d7201`.
- The 27 new declaration headers, 11 existing named contracts and 10 test headers match the native/canonical forms. Definitions use the actual Rees quotient; proposed lemma/example bodies remain admitted in the canonical planning artifact.
- Actual indexed checker: zero errors/warnings; actual intake functions: zero problems/refusals; actual source-issue and version-envelope checks: zero errors. No new source error is claimed.
- Actual immutable atlas assembler: stage DAG 3003/8623, own DAG 298/498, scoped DAG 3289/9420 vertices/edges, all acyclic. All 298 declarations resolve. The R03.6 sibling part is retained, giving 351 total roadmap declarations. Whole foreign roadmap/stage objects and all stage edges match the incoming control. Own skipped/pending links remain empty.
- All 65 own accepted restructure paths hold. Of 13 required stage pairs, 12 are reachable; the existing LocalFieldsRamification layer 0→R03.4 gap is unchanged and remains explicitly recorded. This is not a claim that every required atlas path is present.

## Resume

1. Recover this checkpoint and use the native coefficient ideal/monomial/piece proofs as the starting point for the existing full ring-grading decomposition and its degree-one generation proof. Do not assume the old admitted adicExpansion_bijective or graded-module structure is now proved.
2. Prove graded-module finiteness and the general Hilbert–Serre induction on the actual ordinary module carrier, then connect the cumulative polynomial, support-degree theorem and full reserved intrinsic/ambient multiplicity interfaces. Keep zero-module, zero/unit ideal and nonreduced branches separate.
3. Preserve every existing support/dimension, completion, Artin–Rees, localization-length, associativity, P7/P8/P9, coefficient-category and routed-paper obligation. The concrete coefficient-change equivalence is not a flat-base-change length or multiplicity theorem.

## Immutable recovery

Mathematical base: `f657d46ef5fc38701e8d557af899fe173038a6d7`. Publication control base: `daf5fe58be0122cf332a06b472715f01b0e7be5c`. All 24 guarded input files match at both. The archive commit `f2e52b896348051534523cfde04f189fabcd54b8` is an ancestor changing only this issue's suggested file. The final suggested file is restored to the exact canonical planning source.

Save the following Python fence as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the public archive and four final deliverables, authenticates 38 archived artifacts and their manifest, and recovers the five verifier/compiler helpers. Inspect the scripts. From an existing repository checkout containing both immutable base commits, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX` with the prescribed pinned declarations.tsv. REPLAY_DIR must be outside that checkout. This runs the actual indexed checker, intake/source validators and immutable atlas assembler, verifies source/log hashes and contracts, and does not execute Lean or copy the repository.

For optional compilation in an already available exact Mathlib build: `python3 REPLAY_DIR/run-lean.py Native.lean EXISTING_BUILD native-replay`. Wait until it finishes before `python3 REPLAY_DIR/run-lean.py Canonical.lean EXISTING_BUILD canonical-replay`. The runner checks the pin, tracked cleanliness, free memory≥20GiB and a 1200-second timeout. It never sets up or builds a project. Disposable scratch is deleted after submission; only the evidence and public replay/check receipts named here are retained.

Manifest SHA256: `ed651de3a625b75b60e5c25387f1dd3ad9e96a6e786335bc5970c71f5789910e`. Recovery script SHA256: `a335be6d26f16705ae29140cc2bb5c06134711acfba180f853536882b3e8868a`. The 38-artifact manifest binds all five verification/compiler helpers. Both immutable-base verifier runs returned zero checker warnings/errors, intake problems/refusals and source-issue/version errors.

## Script: recover.py

```python
"""Recover and authenticate this checkpoint's inert public evidence. Does not run Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD),'Pass the full immutable PR head SHA.'
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='DeformationAndDerivedPatchingAlgebra--P7'
ARCHIVE='f2e52b896348051534523cfde04f189fabcd54b8'
MANIFEST_SHA='ed651de3a625b75b60e5c25387f1dd3ad9e96a6e786335bc5970c71f5789910e'
EXPECTED={'research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--P7.json': '7073596bdcec8f914dd42e135f5c1be7d182e773168f9f461f2a01a45b54dbb9', 'research/blueprint/readmes/DeformationAndDerivedPatchingAlgebra--P7.md': 'd6a385996c005a492cdd7e33a2522bf8a54da2a208c1f714b93789ee7c45b876', 'research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean': '4f6b471b58a95b4953630905258d612e790559f1efcb652c1841fa550f1d7201'}
h=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=60) as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
payload=json.loads(raw.split('/- BEGIN ARCHIVED ADIC COEFFICIENT PAYLOAD\n',1)[1].split('\nEND ARCHIVED ADIC COEFFICIENT PAYLOAD -/',1)[0])
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
for folder,ext in [('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]:
 path='research/blueprint/'+folder+'/'+('BP-' if folder=='handoff' else '')+RID+'.'+ext
 data=fetch(HEAD,path)
 if path in EXPECTED:assert h(data)==EXPECTED[path],path
 dst=S/'proposal'/path;dst.parent.mkdir(parents=True,exist_ok=True);dst.write_bytes(data);public[path]=h(data)
assert (S/'Canonical.lean').read_bytes()==(S/'proposal'/('research/blueprint/suggested/'+RID+'.lean')).read_bytes()
handoff=(S/'proposal'/('research/blueprint/handoff/BP-'+RID+'.md')).read_text()
fence=chr(96)*3
code=handoff.split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
assert code==Path(__file__).read_text(),'The current public recovery script must match the script being executed.'
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),publicDeliverables=public,helperHashesVerified=5,recoverySha256=h(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
