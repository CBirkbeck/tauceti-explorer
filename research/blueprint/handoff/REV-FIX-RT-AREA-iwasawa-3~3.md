# Handoff: REV-FIX-RT-AREA-iwasawa-3~3

Refs #5869. Codex (GPT-6), session `codex-EozIdh`, 11 October 2026.
Input `1c06f95484a07926ea860dbcec1344dc75b9c275`;
branch `codex-EozIdh-review-5869`.
Claim comment 6107789204; bot confirmation 6107790396.
Exactly one issue claimed. No second job follows this submission.

**Checkpoint: repair the live issue/queue scope mismatch before dispatching
another continuation.** The bot-confirmed live issue lists only the report
and the Motives packet/suggested pair. The queue also lists the GH.0 and
Kato pairs. `issues.py:deliverables_complete` requires this review's genuine
verdict in all three packets and still returns false. WORKERS.md forbids
editing omitted paths. An explicit scope extension was requested and has
not been authorized. No omitted owner path or queue entry was changed.
A negative mathematical verdict can complete this review; scope is the
completion blocker.

## Work delivered

Fresh independent checks of all eight findings against their verified
evidence, third-round fix report, public HMS v5, published Kato and published
BDP are in the [review report](../reviews/REV-FIX-RT-AREA-iwasawa-3~3.md).
This session did none of the fixes being reviewed.

Corrected an inconsistency in MC.6/period-point's proof sketch. It applied
tensor-isomorphism representability at the effective stage despite its own
final warning. The new order constructs effective algebra evaluation,
transports it through the effective comparison, extends it by inverting the
nonzero Tate period, and only then uses the full neutral Tannakian category
for the torsor interpretation. Added exact HMS Lemmas 3.1–3.2, p.12 and
Theorem 3.3/Corollary 3.4, p.13 locators. No new definition or target is added.
The existing suggested file already separates those constructions and was
left unchanged.

The Motives verdict remains `needs_changes`: the typed full localized Nori
comparison/fibre-functor/heap/action adapter is still missing. Preserve that
explicit gap, the separate relative Beck adapter and abstract reconstruction
obligations. Use existing MC.5 localization and full rigidity; effective
rigidity cannot replace them. PS.2 retains integration/evaluation ownership.

The complete preceding codex-tpWtXb verdict is appended unchanged to
`reviewHistory`. Only this node's proofSteps and added source locator change
among mathematical fields. All 181 other nodes, prerequisites, API/tests,
baseline, gaps, requests, coverage, implementation statuses and earlier
histories are preserved. The preceding report and its older embedded
reports remain available at the input revision linked in the new report.

## Resume after resolving scope

Authorize these four queue-listed paths, or align the queue with the live
Motives-only review:

- `research/blueprint/packets/GeneralizedHeegnerCycles--GH.0.json`
- `research/blueprint/suggested/GeneralizedHeegnerCycles--GH.0.lean`
- `research/blueprint/packets/KatoEulerSystems.json`
- `research/blueprint/suggested/KatoEulerSystems.lean`

Then complete genuine bounded owner reviews, preserving previous verdicts
unchanged in history. Do not change markers solely to satisfy dispatch.

1. **Kato L1/hecke-and-diamond-equivariance-of-the-moment-map:** statement
   and acceptance item 0 use r−1; Lemma 8.8(1), printed p.185 uses r′−1.
   Correct both; keep the central diamond exponent k−2−2r. The inverse
   Hecke exponent and first diamond sum to −r. At r=1,r′=2,ℓ=2 the correct
   scalar is 1/2 while the incorrect one is 1. The generic
   `chernHeckeDiamond` scalar parameter alone does not test normalization;
   instantiate the source exponent and a discriminating regression.
2. **GH.1/p-adic-abel-jacobi-map hypothesis 0:** separately assume finite
   unramified F/Q_p and supplied smooth proper models of C and X_m over
   O_F, as BDP §3.2, pp.1067–1068 does. State p∤cNd_K separately as the
   chosen-CM conductor application; it cannot certify an arbitrary CM twist.
   Preserve the good-product/bad-twist tests and Conrad's attribution for
   the Kuga–Sato factor, pp.1139–1140.
3. Check changed owner packets and suggested signatures; record genuine
   bounded verdicts with this review's marker and rerun
   `deliverables_complete`. Its current failure is exactly the two owner
   markers, still `independent-review-REV-GeneralizedHeegnerCycles--GH.0~2`
   and `independent-review-REV-KatoEulerSystems~2`.
4. The full Motives adapter is separate revision work, precisely identified
   in the packet. Reader synchronization is also outside the live scope.

## Checks and reusable receipts

- All three packet checks: exit 0, zero errors and warnings. Final Motives
  check after the correction: 182 nodes, 463 API items, 261 tests, 47 planets,
  113 baseline entries, 24 gaps, 16 requests; no source-excerpt field.
- Fresh full `lean-check` runs: Motives 817, Kato 135, GH.0 242 warnings,
  every one an admitted-proof warning; exit 0, no errors or other warnings.
  Checks ran sequentially with sufficient memory. No library build or
  language server was started.
- Twelve proved scalar/model regressions: exit 0 with no diagnostics.
  Their formulas and limits are stated in the report; these are supporting
  checks, not formalization of the geometry or cohomology.
- Unchanged suggested-file SHA-256 receipts:
  Motives `c006c8a68ebf5bc6ed2acb6c924670d40e656e3f2869e6f9271571f95296b902`;
  Kato `c894922a7c8becb9ae32714d095cb3681ab72b311ea488527c4cc1240d3dfc13`;
  GH.0 `525f2beb40760ef2240fda9b6030f0d706a08eebe7465997f053490ecc0823f7`.
- Unchanged owner-packet SHA-256 receipts:
  Kato `6ed1534d238b1b2318af806b6568e37c7bf631de62381baa038dd2b189663f36`;
  GH.0 `532a65579cf7558abb0a5cb87c6a9089ec0c7f689e23272e327a74709e901be8`.
- Pinned Mathlib localization statements and the reviewed PS.2 audit were
  checked; current upstream ReductiveGroups/HodgeStructures and current
  known-Hopf Tannaka equivalence were inspected read-only. Exact commits,
  public source versions, hashes and locators are in the report.
- Parsed preservation, whitespace and submission-file checks pass.

All Lean checks finished. Scratch is removed after opening the PR; this note
and the report contain all resumption information. No manual merge, closure,
label change, promotion or second claim.
