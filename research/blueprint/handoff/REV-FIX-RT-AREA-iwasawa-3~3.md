# Handoff: REV-FIX-RT-AREA-iwasawa-3~3

Refs #5869. Codex (GPT-6), session `codex-BIjxwP`, 11 October 2026.
Branch `codex-BIjxwP-review-5869`; input revision
`df91fe32260d17ef3558ec5fd610ca2a56f047cb`.
Claim comment 6108456249 was confirmed by bot comment 6108457119.
This worker did none of FIX-RT-AREA-iwasawa-3~3.

## Checkpoint reason

The bounded Motives review is finished, including a new hypothesis repair,
but intake is blocked by the unchanged issue/queue scope mismatch. A
negative verdict itself is a completed review outcome.

The live issue permits only the review report and Motives packet/suggested
pair. WORKERS.md's named-file restriction prevents editing the four extra
GH.0/Kato paths listed by the queue. An explicit scope extension was requested;
none was received. `issues.py:deliverables_complete` is false with all seven
queue outputs, true with the three live outputs substituted only in memory.
All files exist. No queue, generator or arithmetic owner path was edited.
Resolve this before sending another worker into the same restricted job.

## Work saved

The report gives a fresh bounded verdict on each of the eight confirmed
findings, public URLs, printed theorem/section/page locators, source hashes,
pinned-library declarations and current upstream boundaries.

Corrected MC.6/period-point hypothesis 0: comparison on all effective pairs
is natural, respects both edge types, unit and product pairings; graded
multiplicativity is asserted after restricting to good pairs with supplied
ProductCompatible structures. HMS Definition 1.1, p.4; Theorem 1.6, pp.4–5;
Definition B.14, pp.20–21 support this. The Lean contracts already express
that distinction, so no suggested-file change was needed.

Preserved the previous codex-R4MNK8 review exactly in reviewHistory and linked
its full report at the immutable input revision. Older histories and all
other node fields, coverage, status, gaps, requests, API/tests and baseline
data are unchanged. The only mathematical changes are that hypothesis and
one added source annotation.

Motives remains `needs_changes`. `FormalPeriods.localizeComparison` reaches
only the localization of the effective comparison algebra. The typed
identification with the full Nori comparison algebra, extended fibre
functors, heap and actions is still absent. The conditional effective
TannakianPair signatures do not provide it. Preserve this existing gap and
the separate relative Beck and abstract reconstruction obligations. PS.2
owns integration and its 2πi normalization; do not duplicate it. Reader
synchronization of the corrected hypothesis requires separately allowed
reader-file scope.

## Resume after scope resolution

Authorize these four queue-listed paths, or align dispatch with the live
Motives-only issue:

- `research/blueprint/packets/GeneralizedHeegnerCycles--GH.0.json`
- `research/blueprint/suggested/GeneralizedHeegnerCycles--GH.0.lean`
- `research/blueprint/packets/KatoEulerSystems.json`
- `research/blueprint/suggested/KatoEulerSystems.lean`

If the four paths are authorized, finish their genuine bounded reviews:

1. In Kato L1/hecke-and-diamond-equivariance-of-the-moment-map, change
   n^(r−1) to n^(r′−1) in its statement and acceptance item 0. Kato Lemma
   8.8(1), printed p.185 has r′−1, independently checked on the page image.
   Keep central diamond exponent k−2−2r. For r=1,r′=2,ℓ=2, inverse Hecke
   times first-diamond scalar is 1/2, whereas the wrong exponent gives 1.
   `chernHeckeDiamond` currently takes an arbitrary scalar: add a
   source-normalized proposed signature and a discriminating regression.
2. In GH.1/p-adic-abel-jacobi-map hypothesis 0, separate the finite
   unramified F/Q_p and supplied smooth proper models of C and X_r over O_F
   from the selected-CM conductor application p∤cNd_K. BDP §3.2,
   pp.1067–1068 uses the model assumptions directly. Preserve GH.0's
   good-product/bad-CM-twist tests; Conrad's appendix, pp.1139–1140 supplies
   only the universal-family compactification, not an arbitrary CM model.
3. Preserve previous owner verdicts in their histories, then record genuine
   bounded verdicts and run the changed-packet checkers and serial Lean
   checks. Current markers are
   `independent-review-REV-GeneralizedHeegnerCycles--GH.0~2` and
   `independent-review-REV-KatoEulerSystems~2`. Rerun stock completion;
   do not replace markers merely to satisfy intake.
4. Keep the Motives substantive `needs_changes` verdict until the already
   recorded full-localized-adapter obligation is supplied in a revision.

## Fresh verification receipts

All three packet checkers exit 0, zero errors/warnings. Final Motives counts:
182 nodes, 463 API items, 261 tests, 47 planets, 113 baseline declarations,
24 gaps, 16 requests. The changed Motives packet is checked again after the
prose repair. Parsed preservation, whitespace and intake-file checks pass.

A fresh full Motives `lean-check` exits 0 with 817 admitted-proof-only
warnings, no errors or other warnings. Kato and GH.0 were inspected read-only
but not freshly elaborated in this session; preceding receipts are in the
input-revision report. No compile or language server remains running, and
no library build/update/cache command was started. Scratch sources and logs
are deleted after submission; all needed evidence is in the report.

Unchanged suggested-file SHA-256:

- Motives: `c006c8a68ebf5bc6ed2acb6c924670d40e656e3f2869e6f9271571f95296b902`.
- Kato: `c894922a7c8becb9ae32714d095cb3681ab72b311ea488527c4cc1240d3dfc13`.
- GH.0: `525f2beb40760ef2240fda9b6030f0d706a08eebe7465997f053490ecc0823f7`.

Unchanged arithmetic owner-packet SHA-256:

- Kato: `6ed1534d238b1b2318af806b6568e37c7bf631de62381baa038dd2b189663f36`.
- GH.0: `532a65579cf7558abb0a5cb87c6a9089ec0c7f689e23272e327a74709e901be8`.

No source passage was added. No manual merge, closure, label change,
promotion or second claim was performed.
