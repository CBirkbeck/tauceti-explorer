# REV-FIX-RT-AREA-iwasawa-2~2 — blocked checkpoint

Codex (GPT-6), session `codex-066pQU`, 10 October 2026. Refs #6219.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6097972417).
Base `cd3293a621c3b3fc1ae0c3168bd61ad2b6fc41f0`; branch
`codex-066pQU-review-iwasawa`. One job claimed; no second job.

The [review report](../reviews/REV-FIX-RT-AREA-iwasawa-2~2.md) records fresh
bounded checks of all six findings, public source URLs/versions/locators,
pinned/current native statements, API/tests and validation. L3's authorized
receipt is `accepted`; PMIA's is `needs_changes`. Both preceding top reviews
are preserved whole and unchanged in `reviewHistory`. No packet mathematics,
coverage, gap, request, source issue or Lean file changed.

## Resolve the live issue's scope before redispatch

The job cannot finish under the live file list. The unchanged queue requires
fix-review receipts in two additional packets, but the live issue omits them.
[WORKERS.md](../WORKERS.md) says: “Edit only the files the issue names, plus your
own scratch space.” Scope authorization was requested and has not arrived.
Neither omitted packet nor queue was edited. The actual
`issues.deliverables_complete(job)` is False; replacing only the two omitted
reviewer receipts in memory makes it True. PMIA's negative verdict is accepted
by that predicate and is not the dispatch blocker.

Authorize these paths or reconcile the live issue and queue through the
maintainer before sending another worker the same unchanged job:

1. `research/blueprint/packets/DirichletPadicLFunctions--L3-2.json`.
   Archive its entire then-current top review, including all 79 checked entries
   of `independent-review-REV-DirichletPadicLFunctions--L3-2`, in `reviewHistory`.
   Install the report's bounded accepted fix receipt with the continuing
   reviewer's attribution/date. Keep the latest strict antidifference,
   normalization/uniqueness, coefficient-limit differentiation and quartic
   control. E34 has already been corrected to E37; do not restore older math.
   Keep the five gaps, eight requests, source issue and coverage.
2. `research/blueprint/packets/PadicHodgeRegulators--D.1.json`.
   Archive its entire then-current
   `independent-review-REV-PadicHodgeRegulators--D.1~2` review, including all 72
   checked entries. Install the report's bounded accepted receipt for the four
   D.2 consumers. Keep the seventeen source issues, nine gaps, twenty requests
   and eight planned stages. CS.0–CS.3 remain proposed external producers.
3. Run all four packet checkers, `intake.py check-files` for changed paths and
   the real `issues.deliverables_complete(job)`. Require True before describing
   the review job as complete. Never change the queue to bypass the predicate.

Fresh checks: four packet checkers, zero errors; L3 has 26 inherited short-API
warnings, the others none. Sequential `lean-check`: PMIA 1,075, L3-2 111 and
D.1 307 proof-placeholder warnings only; no other warnings/errors. L3 stops at
its unavailable repository-local `research` import before elaborating its body.
Finite controls passed for Gamma signs/precision, count and permutation
filtrations, exact quartic count correction, nonflat/deficient Fitting examples,
compound preimage and rational boundary scaling. No compile from this session remains running.
Scratch is removed after PR opening; the report contains every pending receipt
and source/version reference needed to resume. Another exhaustive audit is not
needed just to install the two receipts after scope is corrected.

## Separate mathematical PMIA revision

Keep `needs_changes`. Current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` supplies generic higher Fitting
ideals, finite-free presentation independence, arbitrary algebra base change
and arbitrary projective-presentation stable transpose comparison. Current
roadmap main checked: `670582c502e1d4497d9ccd492b36c67028ef6666`.

Migrate `higher-fitting-ideal`, `relation-minors-add-generator`,
`higher-fitting-independence`, `higher-fitting-base-change` and
`transpose-stable-equivalence` with direct consumers, both StableReduction
requests, L4 comparison, reader and suggested interfaces. Retain matrix/kernel
adapters, order calculations, finite-projective scalar/range transport and
nonflat/deficient-relation/rank/nontriviality controls. The reader is outside
this review's live scope. A partial migration would leave inconsistent
interfaces. No mathematical ownership or programme baseline pin was changed.
