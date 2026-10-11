# Handoff: REV-FIX-RT-AREA-iwasawa-3~3

Refs #5869. Codex (GPT-6), `codex-OXZ9ou`, 11 October 2026.
Input `001b8e8a977259a9b71681d54eb865d91b29b26c`;
branch `codex-OXZ9ou-review-5869`.
Claim comment 6106928178; bot confirmation comment 6106929254. Exactly one job claimed.

**Blocked checkpoint: align the live issue and queue before reassigning.**
The issue authorizes only the report and Motives packet/Lean pair.
The queue and `issues.py:deliverables_complete` also require independently
reviewing the GH.0 and Kato packets. [WORKERS.md](../WORKERS.md) says
“Edit only the files the issue names, plus your own scratch space.”
An explicit scope extension was requested but has not been received.
No arithmetic owner file, owner review marker or queue entry was edited.
A negative mathematical verdict can complete a review; missing authorized
owner paths are the dispatch blocker.

## Work delivered

The [review report](../reviews/REV-FIX-RT-AREA-iwasawa-3~3.md) gives fresh
source-checked dispositions of all eight findings and exact arithmetic
corrections. It identifies and corrects a further permitted prototype
error: generic tensor-isomorphism representability and heap construction
omitted HMS Lemma 3.2's neutral Tannakian hypotheses.

`Diagram.Rep.TannakianPair` now supplies actual typed unitality, unit rank,
rigidity and extension-field tensor comparison data. Generic `represents`,
`heap`, `iso_torsor` and their isomorphism/inverse tests consume it.
`periodPoint` is effective evaluation, without invoking unsupported
isomorphism representability; `periodPoint.formal` extends evaluation across
Tate localization. Effective heap/action signatures and the heap example
are explicitly conditional on the separate context, which has not been
supplied for the effective good pairs.

The two new proved polynomial/localization examples distinguish a unital
zero-evaluation point of Q[t] from the localized ring, whose Tate coordinate
has nonzero image in Q. They are ring-model tests, not a calculation of all
Nori Tate motives. Exact pinned polynomial evaluation/localized-unit APIs
are cited. Four node objects change: comparison-algebra, tensor-iso-scheme,
iso-torsor and period-point. All 182 node ids are retained. Only tensor-iso-scheme
adds two baseline prerequisites. Previous histories, all prior 23 gaps and
all 16 requests remain; the entire preceding codex-dM5x45 review is archived
unchanged. Partial status, implementation statuses and existing closures remain.

A new precise gap and MC.6 remaining item records the absent typed full
localized comparison/fibre-functor/heap/action adapter. The previous
canonical finite-dual localization-map repair, shared Künneth signs,
comparison edge/unit/product laws and rank-one Tate conditions remain.
The independent relative Beck adapter and abstract reconstruction carriers,
fifteen API and four theorem obligations remain separate revision work.
Top-level Motives verdict stays `needs_changes` for those explicit reasons.
No implementation or proof closure is claimed.

## Resume only after scope is resolved

1. Authorize these four additional files or align the queue with the intended
   Motives-only review:
   `research/blueprint/packets/GeneralizedHeegnerCycles--GH.0.json`,
   `research/blueprint/suggested/GeneralizedHeegnerCycles--GH.0.lean`,
   `research/blueprint/packets/KatoEulerSystems.json`,
   `research/blueprint/suggested/KatoEulerSystems.lean`.
2. Complete the bounded arithmetic-owner review, preserving preceding owner
   reviews unchanged in history. In Kato
   L1/hecke-and-diamond-equivariance-of-the-moment-map change the Hecke
   exponent r−1 to r′−1 in the statement and acceptance item 0; retain
   central diamond k−2−2r. Source: Lemma 8.8, p.185. Add the scalar derivation
   −(r′−1)+(r′−1−r)=−r and the k=4,r=1,r′=2,ℓ=2 comparison: correct 1/2,
   incorrect 1. The generic `chernHeckeDiamond` parameter alone does not
   check the source normalization. These exact algebraic checks freshly
   elaborated in scratch with exit 0 and no warnings.
3. In GH.1/p-adic-abel-jacobi-map hypothesis 0, independently require finite
   unramified F/Q_p and models of C and X_m. Put p∤cNd_K in a separate
   canonical conductor-application condition, without claiming it controls
   arbitrary CM twists. Preserve both positive and bad-twist checks and
   Conrad's attribution for W_m. Sources: BDP §2.2 p.1060, §3.2 p.1067,
   appendix pp.1139–1140.
4. Check each owner packet and its full suggested file; record genuine verdicts
   with this job's marker. Re-run `deliverables_complete`; do not set markers
   on unreviewed files or drop queue outputs to manufacture completion.
5. Separate revision work should supply the new typed localized adapter using
   MC.5's canonical localization and full Nori rigidity, not effective
   rigidity. The full torsor target remains mathematically correct; its
   effective heap/action prototypes alone do not state its application.
   The reader refresh needs separate authorization: synchronize this new
   context/effective/full distinction along with the preceding canonical
   coefficient maps, both signs, typed comparison, Tate inputs and negative
   reconstruction verdict.

## Checks and source receipts

- Pinned-index packet check: exit 0; zero errors and warnings. 182 nodes,
  463 counted API items, 261 tests, 47 planets, 113 baseline declarations,
  24 gaps and 16 requests; no closed stage.
- Full final suggested-file `lean-check`: exit 0; 817 warnings, all
  `declaration uses sorry`, no other diagnostics. Mathlib commit
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. Suggested SHA-256:
  `c006c8a68ebf5bc6ed2acb6c924670d40e656e3f2869e6f9271571f95296b902`.
  The file imports individual Mathlib modules; no Tau Ceti build was run.
- The report gives public URLs, download hashes and exact theorem/page
  locators. Source results were restated in the worker's own words; no
  restricted source was needed and no passage or excerpt field was added.
- Current upstream/library boundaries were inspected read-only. No new
  reconstruction or Hodge target duplicates their existing work.
- Parsed preservation passes: only the four named node objects change; prior
  review/history, every prior gap/request and all implementation statuses remain.
  Only tensor-iso-scheme adds the two exact baseline prerequisites.
- `git diff --check` passes; `intake.py check-files` reports four files and
  zero problems.
- Dispatch predicate remains false: GH.0 still names
  `independent-review-REV-GeneralizedHeegnerCycles--GH.0~2`; Kato still names
  `independent-review-REV-KatoEulerSystems~2`. Both owner packets are byte-identical
  to the input. The live issue was re-read immediately before submission and
  still omits their four paths.
- Fetched current origin/main before submission; no intervening commit changed
  any of this job’s four edited files.

All compilation finishes before submission. Scratch is removed when the PR
opens; this note and the report contain the necessary resumption information.
No manual merge, label change, issue closure, promotion or second claim.
