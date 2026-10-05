# Independent review: probabilistic, metric and ergodic number theory

**Verdict: accepted as a finished planning pass, with explicit gaps.** Reviewer: Codex — `codex-7e92bd`, 2026-10-05. Refs #548. The reviewer did not author the incoming packet. Claim comment 5986838745 was confirmed by bot comment 5986840060, then the issue was reread.

The review covers all 258 incoming nodes and the complete suggested file. It corrects 45 incoming nodes and promotes 42 API lemmas, reaching the 300-node budget; 213 incoming nodes retain their contracts. There are 29 definitions/constructions, 138 API entries, 98 definition/construction tests (132 tests in all), 32 planets, 181 baseline declarations, 23 gaps and 5 open requests. Every node remains `implementationStatus: unchecked`.

Five stages are planned through named inputs and gaps. PM.4 is **partial**: its Gauss system and metric continued-fraction targets have nodes, but the README's extension to homogeneous dynamics through GN.4 does not yet specify an acting group, quotient, measure, imported theorem or comparison. The continuation must choose that target before calling the stage planned. None of the six stages is closed.

## Corrections

- Equidistribution APIs now distinguish the general topological definition from the HasOuterApproxClosed/BorelSpace assumptions needed by frequency and uniqueness results. Fourier measure uniqueness uses density and measure extensionality. Total twisted criteria range over every positive modulus. Bilateral affine shifts, translated orbit cosets, the zero-dimensional torus and constant-polynomial cases are explicit. The negative irrationality test now uses two individually irrational but dependent coordinates.
- The subtorus constructor does not claim the unproved classification of all connected compact subgroups. Its matrix-column convention is corrected. A positive existence test supplements the three negative normality tests.
- Duffin–Schaeffer denominator indices are positive. Radius-convention transport is confined to almost-everywhere zero/full conclusions. GCD graph weights need individually finite values, not finite total mass; the edge-distribution lemma requires positive edge mass. The native convolution and summation convention are explicit.
- The mass-transference ball estimate retains the missing covering constants. Shrinking radii remain required. The arbitrary-gauge mass-distribution step is distinguished from the native power-gauge theorem. Birkhoff's nonnegative limsup remains extended-valued until integrability is established. One Gauss branch needs direct differentiation, not a finite-word continuant argument.
- The short-interval good-set theorem now states real multiplicativity, boundedness and its interval hypotheses. Logarithmic Chowla directly imports the corrected Elliott target. No qualitative mixing, finite Bernoulli comparison or random-model orthogonality is substituted for a stronger analytic theorem.

All 173 incoming baseline statements were independently read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` / Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Four `provides` descriptions were corrected: the two topological hypothesis contracts, prime-factor support at zero, and the scope of the Hausdorff-dimension definition. Eight authenticated references were added for finite Fourier inversion/phases, prime-power factorization and Hausdorff dimension. No citation was removed. Generated additive counterparts are supported by the pinned `to_additive` declarations.

The 42 API promotions have separate statements, proof outlines and direct dependencies. Four elementary API lemmas and the separately named data/constructor declarations are precisely listed at the budget boundary. Native Portmanteau, Fourier, pushforward and reduced-rational/circle comparisons still needing exact signatures are named gaps. Original Kolmogorov–Rogozin, Kubilius, Turán–Kubilius and Pollington–Vaughan proofs; growing-prime moment convergence; general gauge/tree interfaces; Gauss analytic closure; and the full modern correlation proofs remain openly recorded.

## Sources and source findings

Every incoming finding was rechecked: **35 confirmed and 2 rejected**. E23 incorrectly alleged a positive sign in Smyth's approximation-error formula, whose actual PDF already has the negative sign. E25 incorrectly alleged an error in using log(x): the preceding exercise approximates negative denominator growth, so taking the negative gives the stated positive limit. The historical allegations remain visible with explicit rejection verdicts.

Fifteen additional findings, E38–E52, are confirmed within their exact version scopes. They include the Granville–Soundararajan distinct-prime intermediate bound, a missing Möbius value at one, Koukoulopoulos–Maynard codomain/normalization/positivity defects, the false claim in Beresnevich–Velani Remark 2 that shrinking radii are redundant, Gauss-branch indexing, omitted recurrence/Oppenheim hypotheses, Kubilius example and normalization errors, two elementary quadratic-reciprocity slips in Elsholtz–Tao, and the missing real projection in the BSKK complex-root concentration proof. The register therefore retains **50 confirmed and 2 rejected** findings, not 52 asserted errors.

The published Koukoulopoulos–Maynard and Beresnevich–Velani papers were read in full. Other sources were read at the precise passages in SourceRead.json and the packet's independent version records; no whole-paper reading is claimed for them. The published Kubilius paper was located and collated, superseding the earlier preprint-only scope. GS's full publisher proof and BSKK's publisher proof were inaccessible; those findings are restricted to the acquired author/preprint copies. Correction searches were bounded primary-site searches, with no exhaustive novelty claim or author contact. Two primary PDFs were rendered specifically to reject the inherited false findings.

## Validation and ownership

The indexed packet checker, source-issue/version checks and actual intake checks pass. All API/test and planet counts are checked. Direct rational enumeration passes **39,816 assertions**, covering finite arithmetic sampling, CRT, signed moments, Gaussian comparison bounds, repeated-prime factors, endpoint conventions and selected source counterexamples. These calculations do not verify asymptotic theorems.

The **full suggested file did not compile**: the existing build lacks its Tau Ceti import artifacts. No library build, cache download or language server was started. The Mathlib-only continuation, extracted in the allowed suggested path and then restored, compiled against 3,023 authenticated pinned source modules: **155 declarations/examples, 141 expected admission warnings, zero errors and no other warnings**. It comprises the final 718-line section starting at line 2232, with the file's 54 Mathlib imports. Earlier sections were read but are not claimed compiled by this reviewer. The exact full-file and selected-section hashes, compiler identity, log and serial memory/time limits are retained.

The six reviewed AUDIT-07 rows and its review, the full RS-07 ownership report, and the Exchangeability and ArithmeticDirichletSeries upstream documents were read. The exact ES.0 lag-bound supplier and its 11-node recursive chain were checked; four analytic supplier-stage contracts were read. Open requests retain their averaging, conductor/height, modulus and error-range requirements. ES's finite lag bound does not supply the Liouville minor-arc estimate.

Read-only atlas assembly compares the candidate with a control, separately recording currently promoted suppliers and the proposed ES packet. Both the stage graph and recursive consumer graph are acyclic, with no pending links or removed edges and unchanged foreign semantic payloads. Checks are repeated against the mathematical base and a fresh publication base; the incoming packet, suggested file, historical reader and handoff remain authenticated inputs.

## Handoff

Continue the precisely listed proof and native-interface gaps, and select the missing GN.4 application. The historical author reader/handoff were outside this review's deliverables and remain unchanged; this report and reviewed packet supersede their old counts, blanket six-stage coverage claim and unreviewed source-error allegations. No promotion, supplier edit or campaign-data edit is included. The checked suggested signatures remain proposals with admitted proofs.

## Public recovery

Archive commit `073247c59cce68bae5690cf48c33a5066c524c7e` is an ancestor changing only the allowed suggested file. It contains 47 inert artifacts, including 6 replay helpers. Manifest SHA256 `aa64b1a6345af55d4e7c10f22439becd9f81b15c97c3644715e3e92b91421a8e`; payload SHA256 `e7c6ef5a0b5089d30787ac2cd729eefbbeae07d226e998de3446a0b0d8c8444b`. The final suggested file contains no archive payload.

The archive retains incoming/reviewed files; all node, baseline, source-finding, target and supplier checks; source/version acquisition receipts; exact partial-compilation hashes and logs; finite checks; both immutable repository verification reports; and the verifier, graph, finite-check, parameterized compilation and packaging helpers. PDFs and temporary extracted source texts are excluded. Source reading is a reviewer judgment with bounded locators, not something these scripts prove.

Save the final Python fence as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. Keep REPLAY_DIR outside a repository checkout. After inspecting the recovered helpers, run from an existing repository checkout: `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the pinned declarations.tsv, SHA256 `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`. Its output must equal Verification.json. Set ROOT_ACTION_VALIDATE_BASE to the commit in base.txt to reproduce MathematicalVerification.json; both recorded commits must exist locally.

Recovery authenticates every artifact and the three final public deliverables. Verification checks the complete review ledger, API promotions, rejected findings, exact full/partial signature and log hashes, input guards, finite calculations and immutable packet/source-issue/intake/atlas checks. It does not execute Lean or verify admitted proofs. Public HTTP recovery and byte-identical replay of both reports were exercised before opening the PR.

## Script: recover.py

```python
"""Recover authenticated review evidence; do not run Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='ProbabilisticAndMetricNumberTheory'
ARCHIVE='073247c59cce68bae5690cf48c33a5066c524c7e'
MANIFEST_SHA='aa64b1a6345af55d4e7c10f22439becd9f81b15c97c3644715e3e92b91421a8e'
PAYLOAD_SHA='e7c6ef5a0b5089d30787ac2cd729eefbbeae07d226e998de3446a0b0d8c8444b'
EXPECTED={'packets': 'c281a61e13ec7f433532aa0ecef0848a7951f3cb467e8a815b482b492f0412ab', 'suggested': '25a8ae2a45a86ae1d8c8d6fdd370d3f3a8f5de592cb909d752f44b7206a54060'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=40)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.rsplit('/- BEGIN ARCHIVED REVIEW EVIDENCE\n',1)[1].split('END ARCHIVED REVIEW EVIDENCE -/',1)[0].encode()
assert sha(pb)==PAYLOAD_SHA;payload=json.loads(pb)
def unpack(name):
 b=zlib.decompress(base64.b64decode(payload[name]['data']));assert sha(b)==payload[name]['sha256'],name
 return b
mb=unpack('artifact-manifest.json');assert sha(mb)==MANIFEST_SHA;meta=json.loads(mb);assert set(payload)==set(meta)|{'artifact-manifest.json'}
for name,m in meta.items():
 assert Path(name).name==name and name not in {'.','..'}
 b=unpack(name);assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],name
 (S/name).write_bytes(b)
(S/'artifact-manifest.json').write_bytes(mb);public={}
for folder,ext,name in [('packets','json','Candidate.json'),('suggested','lean','Suggested.lean'),('reviews','md','PublicReport.md')]:
 path='research/blueprint/'+folder+'/'+('REV-'if folder=='reviews'else'')+RID+'.'+ext;b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder]and b==(S/name).read_bytes(),path
 (S/name).write_bytes(b);public[path]=sha(b)
report=(S/'PublicReport.md').read_text();assert report.startswith((S/'ReportBase.md').read_text())
tag='\n## Script: recover.py\n\n'+chr(96)*3+'python\n';a=report.rindex(tag)+len(tag);b=report.index('\n'+chr(96)*3,a);code=report[a:b]+'\n'
assert code==Path(__file__).read_text();(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
