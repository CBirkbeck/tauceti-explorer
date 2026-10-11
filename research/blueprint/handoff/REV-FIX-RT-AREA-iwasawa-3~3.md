# Handoff: REV-FIX-RT-AREA-iwasawa-3~3

Refs #5869. Codex (GPT-6), session `codex-R4MNK8`, 11 October 2026.
Input `0311207a4c7eb718bd7adaac0013c0c4a832e5a1`;
branch `codex-R4MNK8-review-5869`.
Claim comment 6108084687 was confirmed by the bot for this session.
Exactly one issue was claimed; no second job follows this submission.

**Checkpoint: resolve the live issue/queue scope mismatch before assigning
another continuation.** The live issue lists the report and Motives
packet/suggested pair; the queue additionally lists Kato and GH.0 pairs.
`issues.py:deliverables_complete` requires this review's verdict in all three
packets and currently returns false. WORKERS.md forbids editing omitted paths.
A scope clarification was requested while independent checks continued; no
extension was received. A finished `needs_changes` review can complete the job,
but the omitted owner markers block dispatch completion.

## Work delivered

Fresh source checks of all eight findings are in the
[review report](../reviews/REV-FIX-RT-AREA-iwasawa-3~3.md), with current contracts,
public source URLs, exact locators, source hashes, baseline and upstream checks.
This worker did none of the fixes reviewed.

Added period-point's direct MC.5/diagram-localisation, MC.5/nori-rigidity and
MC.6/fibre-functor-extension prerequisites, already used by its proof sketch.
Added HMS Lemma B.21/Proposition B.22, pp.25–26 and Theorem 1.14, p.8 locators.
Only that node's prerequisites/sources and the review/history changed.
The preceding codex-EozIdh review is archived exactly. Every other node and
all status, coverage, gap, request, API/test and baseline data are preserved.

Motives remains `needs_changes`: the typed full localized Nori comparison
algebra/fibre-functor/heap/action adapter is absent. Preserve that explicit gap
and the separate relative Beck/abstract reconstruction obligations. Do not
use effective rigidity in place of full Nori rigidity. PS.2 owns integration
and its 2πi normalization. Reader synchronization also needs separately
allowed scope.

## Resume after resolving scope

Authorize these queue-listed paths or align the queue with the live issue:

- `research/blueprint/packets/GeneralizedHeegnerCycles--GH.0.json`
- `research/blueprint/suggested/GeneralizedHeegnerCycles--GH.0.lean`
- `research/blueprint/packets/KatoEulerSystems.json`
- `research/blueprint/suggested/KatoEulerSystems.lean`

Then complete genuine bounded reviews of the assigned corrections:

1. Kato L1/hecke-and-diamond-equivariance-of-the-moment-map: replace n^(r−1)
   by n^(r′−1) in the statement and acceptance item 0; Lemma 8.8(1), printed
   p.185 has r′−1. Keep central diamond exponent k−2−2r. At r=1,r′=2,ℓ=2,
   inverse Hecke plus first-diamond scalar is 1/2, not 1. The generic scalar
   argument in `chernHeckeDiamond` does not encode this normalization. Add a
   source-normalized proposed signature and a discriminating test.
2. GH.1/p-adic-abel-jacobi-map hypothesis 0: independently assume finite
   unramified F/Q_p and supplied smooth proper models of C and X_m over O_F,
   as BDP §3.2, pp.1067–1068 does. Move p∤cNd_K to the separate chosen-CM
   conductor application. Retain GH.0's good-product/bad-CM-twist tests and
   Conrad's attribution for the universal-family factor only.
3. Preserve the previous owner verdicts unchanged in review history. Record
   this review's bounded owner verdicts, check changed files, and rerun
   `deliverables_complete`. The current owner markers are
   `independent-review-REV-GeneralizedHeegnerCycles--GH.0~2` and
   `independent-review-REV-KatoEulerSystems~2`; no owner file was edited here.
4. Keep the substantive Motives `needs_changes` verdict. A revision must
   implement the already recorded full-localized-adapter gap before acceptance.

## Fresh receipts

All three packet checkers: exit 0, zero errors/warnings. Motives: 182 nodes,
463 API items, 261 tests, 47 planets, 113 baseline declarations, 24 gaps and
16 requests. Fresh full Lean checks: Motives 817, Kato 135, GH.0 242 warnings,
all admitted-proof warnings; exit 0, no errors or other warnings. Ten proved
scratch numerical examples: exit 0, no diagnostics. The report states their
formulas and their limits; scratch is deleted after PR submission.

Unchanged suggested-file SHA-256:

- Motives: `c006c8a68ebf5bc6ed2acb6c924670d40e656e3f2869e6f9271571f95296b902`.
- Kato: `c894922a7c8becb9ae32714d095cb3681ab72b311ea488527c4cc1240d3dfc13`.
- GH.0: `525f2beb40760ef2240fda9b6030f0d706a08eebe7465997f053490ecc0823f7`.

Unchanged owner-packet SHA-256:

- Kato: `6ed1534d238b1b2318af806b6568e37c7bf631de62381baa038dd2b189663f36`.
- GH.0: `532a65579cf7558abb0a5cb87c6a9089ec0c7f689e23272e327a74709e901be8`.

No source excerpt was added. All Lean checks finished, and no language server
or library build was started. Parsed preservation, whitespace and intake-file
checks pass. No manual merge, closure, label change, promotion or second claim.
