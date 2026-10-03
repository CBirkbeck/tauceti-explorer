# BP-AlgebraicModuliForArithmeticGeometry--A0-extension: native Hom sheaf base change

Codex — codex-rtOQ9t · 3 October 2026 · Refs #672 · **partial**.

This checkpoint adds twelve declarations: two constructions and ten lemmas, with ten API items and seven typed tests. For a native band-preserving strong transformation X, supplied objects x in F(U), y in G(U), and f:V→U, the actual continuous slice pullback of the native Hom sheaf at U is isomorphic to the native Hom sheaf at V for F(f)x and G(f)y. Both directions are genuine sheaf maps with inverse laws, using the existing overMapCompPresheafHomIso rather than a new generic carrier.

At t:T→V, write k for the native flexible comparison G(t≫f)→G(t)G(f). The forward map sends p to k(y)⁻¹ ≫ p ≫ k(X_U(x)) ≫ G(t)(restrictionIso(X,f,x)). The inverse uses the inverse restriction comparison and the actual inverse native Hom comparison. Native naturality gives compatibility with every deeper Over-arrow. These maps assemble into an actual natural isomorphism of sheaf-valued functors, natural in all native modifications. Forward and inverse comparisons preserve the actual band action for the same coefficient a∈A(T); no coefficient is incorrectly restricted along f. The comparison commutes with local-object transport along e:x≅x′ and F(f)e, retaining every native comparison factor. Coefficient universe w remains independent of the fibre-hom universe v′.

The seven parameterized typed checks cover inverse round trips, empty Hom section sets, the unit coefficient, arbitrary deeper slice arrows, an inverse native modification, two composable native modifications, and the actual local-object transport square. No new concrete geometric, nonconstant-site or nonneutral fixture is instantiated. The inherited native examples remain intact. These comparisons do not establish descent or the self-equivalence/torsor equivalence.

All 530 incoming mathematical contracts are preserved; 528 whole node objects are identical. Only the prerequisites and one proof step of the two existing torsor-comparison parents are appended. All ten gaps, 22 requests, eight source issues, ten planets and eight partial stages remain unchanged. There are 542 nodes, 494 raw API objects and 499 raw test objects. All implementation statuses remain unchecked; no stage is closed. These supporting comparisons need no new planet. The entire incoming reader and complete Tau Ceti-import suggested file are retained verbatim, with the new reader section prepended and the new projection appended.

## Reading and provenance

Read the whole 44,034-character issue before claim and again after bot confirmation that claim comment 5973291589 won; confirmation 5973293316. The before/after issue body SHA256 is 76b4b208fdc2daf287aff24fff621ad30741280c84a8c35c7f6ac34c2ea459af. Read the entire incoming handoff. Authenticated [PR6019](https://github.com/CBirkbeck/tauceti-explorer/pull/6019), head 35e3221b5e40228e04f77739b21c82955ca5a78c, archive d8f47ec6478a201d1a30552d5201b508479c03dc: 40 artifacts, eight helpers and all four final deliverables. Executed its actual immutable verifier and reproduced its published report byte for byte. All four incoming deliverables match this checkpoint's mathematical base.

Fresh readings include all twelve own reviewed library-audit rows, the complete campaign reader, all 34 touching link entries, the reserved gerbe survey/API, consumed accepted RS27 ownership decisions for R09.4/R09.5/R09.6/A0-extension, and red-team 1. The same continuous session's earlier complete control readings for [PR5995](https://github.com/CBirkbeck/tauceti-explorer/pull/5995) are reused at 20 unchanged guards: binding protocols, accepted RS27 and relevant reviews, the prescribed red-team records, and the AdicSpaces, ModularCurves and StableReduction upstream reader scopes. Reading.json and OwnControlReuse.json distinguish fresh passages from these reused readings. Whole-file hashes do not assert fresh whole-file reading. Existing nine prescribed red-team repairs and owner boundaries are retained, not newly certified closed.

Freshly read the consumed native restrictionIso, modification, naturality, identity and composition declarations, the preceding sheaf assembly and all twenty local-object sheaf-transport declarations; all ten current gap contracts, all torsor-related requests and the D0/SF1 supplier boundaries. The exact inherited native prefix was recompiled, but this is not a fresh line-by-line audit of every historical proof, all 530 old declarations, or every inherited paper. The current SF packet has changed since the predecessor's mathematical base; SFBoundary.json verifies unchanged complete SF.1 nodes, coverage, requests and sourceWorklist. SF.1 remains not_read; no new supplier closure follows.

Fresh primary-source text: the complete mathematical [Stacks definition of a gerbe, Tag06NZ](https://stacks.math.columbia.edu/tag/06NZ), and [Olsson, printed122–123](https://stacky.net/files/written/Stacks/Stacks.pdf), complete Lemmas31.3/31.4 and Remark31.5, with only the beginning and incompleteness warning of31.6. No rendered-page inspection or full classification proof is claimed. SourceReading.json records the freshly fetched Olsson PDF byte hash and access time; the PDF is not retained. The new exact formulas and native proofs are authored deductions motivated by the local sheaf comparison, not quotations of a claimed source theorem. All inherited source-issue metadata remains attributed and unchanged.

Fresh pinned statements and file hashes are recorded in Reading.json: IsPrestack.lean20–180, Over.lean410–450, Continuous.lean348–378, Iso.lean212–232 and Bicategory/Functor/Cat.lean33–100. The native Hom sheaf, flexible composition comparison and slice pullback are reused. The two added baseline references are sheafPushforwardContinuous and Iso.homToEquiv. Bounded exact-name searches of current packets, pinned Mathlib CategoryTheory and pinned Tau Ceti AlgebraicGeometry found no matching new exports. This is not a comprehensive absence certificate or a new online PR/Zulip survey.

## Validation and limits

Required pins are Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and TauCeti f790474821cf4256814db967cb154e7af3d0c369. The complete Tau Ceti-import Suggested.lean is **UNCOMPILED**: the available Tau Ceti checkout is cf386627e9176a3827c1a5fe804989fd94a4d216 and lacks the imported LongExactSequence olean. Canonical.lean means the entire inherited **Mathlib-only projection**, not the complete final suggested file.

Both Lean checks completed serially in the existing exact Mathlib build, with one thread, an 8GiB limit and a 1200-second timeout. No Lake setup, cache download, library build or language server was used. No compiler from these checks remains running.

- Native.lean: 2370 lines, 93 examples, exit 0, 0 warnings (0 admission warnings), 135 axiom audits; 36GiB available before compilation, peak RSS 2238136KiB. Source SHA256 `e14a91f3256b468b719d85e7e03518fe2b75f2bbb22ea83b82cf96f05c42fead`; log SHA256 `8efed9246bbac76bc4c35361a54b5ccab604bfc14f84f7d1f4f0af94a98d7425`.

- Canonical.lean: 6212 lines, 354 examples, exit 0, 789 warnings (789 admission warnings), 0 axiom audits; 36GiB available before compilation, peak RSS 3724216KiB. Source SHA256 `7fce3cdcb6af7017322d3c58b4123573fa842fc5bb413896896ed1f6c592691e`; log SHA256 `4707c9552b740257cf6046b1da5b8368962144ca8277152eaa47a995908cee17`.

Native.lean contains the exact 2022-line predecessor source, followed by the twelve new declarations, seven tests and twelve new axiom audits. All 135 audited axiom closures use only propext, Classical.choice and Quot.sound; no sorryAx occurs. The native file contains no admission or declared axiom. The new projection retains concrete carrier/map data and admits ten lemma bodies, seven test bodies and three construction proof fields. Its twenty textual admissions cause eighteen declaration warnings, which together with the inherited 771 give 789 admission warnings and no others. All new declaration headers, complete appended projections, example counts and receipts are mechanically compared with the native source. All planning implementation statuses remain unchecked.

The actual indexed checker passes with 542 nodes, 486 API items, 466 definition tests, 213 baseline references and zero closed stages, with no errors or warnings. Actual source-issue/version and intake checks pass. Immutable atlas assembly has acyclic stage 3017/8655, own declaration 542/1146 and scoped 3552/10411 vertex/edge counts. All 24 required pairs and 40 accepted touching restructure pairs are reachable, with no unresolved leaves or own skipped/pending links. Every stage edge and every foreign roadmap/stage object is unchanged; sibling parts and all other roadmaps' skipped/pending links are retained. 51 complete control file hashes match at both bases, and the complete SF.1 boundary is preserved.

Mathematical base `3c0655be1ec51eacb75f07bffc3135262ad7fb50`; publication control `c415e6e4947177420ea19f73f2493708c0e44bc9`. Verification-math.json and Verification.json record the actual immutable checks. Declaration-index SHA256 `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`. Complete final suggested-file SHA256 `22ba2e3d1e2f632254967d872e3f275798cb407ceaf4b21436ea5b7c377e5d4e`.

## Resume

Start from R09.4/sheaf-base-change/iso, nat-iso, equivariant, inv-equivariant and object-square. Prove unit/composition coherence for the whole base-change family, including the existing native Over pullback comparison isomorphisms and object endpoint comparisons. Supply actual local-object covers and overlap refinements, glue sheaves/actions/maps, and package the comparison using D0's supplied torsor groupoid. Prove full faithfulness and the coherent inverse/unit/counit before claiming equivalence with torsors. Import the existing principal-sheaf comparison; do not duplicate it or replace generic D0 obligations by Prop-valued records assuming the conclusion.

Instantiate the parameterized comparisons on the nonconstant and nonneutral geometric fixtures. Preserve empty-section behavior and the independent coefficient universe. All inherited intrinsic SF1 descended-band comparison, nonneutral root example, derived H2, compatible fpqc limits, source issues and other stage obligations remain open. This is a partial planning checkpoint.

## Public recovery and replay

Archive commit `98b2dde6025c92ff5040d09687752aaf63fdca97` is an ancestor changing only this issue's suggested file. Its 45 inert artifacts include all 9 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `b3c4f6e016de24fc491309837a2b253427cb20ec8246eb34f15449d127d441c0`; payload SHA256 `1a7e59f95c39e6dcaf6a84fd0b9cdd4f2288ba71e2f36c7ec1ef497a0450e9ef`. The final suggested file has no archive payload and preserves the complete Tau Ceti-import planning text.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and four final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set MODULI_VALIDATE_BASE to the mathematical base to reproduce Verification-math.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Canonical.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean is the Mathlib-only projection; Suggested.lean is the complete uncompiled Tau Ceti-import file. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

```python
"""Recover public authenticated Hom sheaf base-change evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='AlgebraicModuliForArithmeticGeometry--A0-extension'
ARCHIVE='98b2dde6025c92ff5040d09687752aaf63fdca97'
MANIFEST_SHA='b3c4f6e016de24fc491309837a2b253427cb20ec8246eb34f15449d127d441c0'
PAYLOAD_SHA='1a7e59f95c39e6dcaf6a84fd0b9cdd4f2288ba71e2f36c7ec1ef497a0450e9ef'
EXPECTED={'packets': '43d6c04307a58feef5447c20b94697a7d3b536987b199f00f7447a5bf84e709d', 'readmes': 'cef888d246cc9e5e4e14f6e209e346368be08dbf7efe9de1c652c41e13b6b912', 'suggested': '22ba2e3d1e2f632254967d872e3f275798cb407ceaf4b21436ea5b7c377e5d4e'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED HOM SHEAF BASE CHANGE PAYLOAD\n',1)[1].split('END ARCHIVED HOM SHEAF BASE CHANGE PAYLOAD -/',1)[0].encode()
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
fence=chr(96)*3;handoff=(S/'PublicHandoff.md').read_text()
assert handoff.startswith((S/'HandoffBase.md').read_text())
code=handoff.split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from public handoff.'
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
