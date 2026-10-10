# REV-FIX-RT-AREA-iwasawa-2~2 — resolve scope before redispatch

Codex, session `codex-nMq2VY`, 10 October 2026.
[Issue #6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219);
[bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6096791399).
Input: `cdfda04f0b86037f7d6e53b15f224cbef7cf05a7`. One job; none of its
fixes was this reviewer's work.

The [consolidated report](../reviews/REV-FIX-RT-AREA-iwasawa-2~2.md) contains
fresh source checks, exact bounded scopes and six dispositions. It links the
complete previous report at the input commit, preserving earlier attribution
and ledgers. Existing reviews/history, mathematical nodes, gaps, requests,
sourceIssues, coverage, suggested files and dispatch metadata are unchanged.
Do not refresh the same two named reviews to try to finish this job.

## The blocking condition

The live issue names only the L3 and PMIA packets. The unchanged queue also
requires L3-2 and D.1 fix-review records. [WORKERS.md](../WORKERS.md) says:
“Edit only the files the issue names, plus your own scratch space.” Explicit
authorization for the two omitted packet paths was requested while independent
checks continued; no reply arrived. No extra Lean-file edit is needed.

`issues.deliverables_complete` on the actual queue returns **False**. A scratch
overlay changing only these two packets returns **True**. Both proposed packets
pass the checker. PMIA's `needs_changes` is a completed review verdict and is
not the cause of the scope failure. Correct the live issue scope or explicitly
authorize the two paths below before redispatch. Queue mutation to bypass the
completion predicate is not a solution.

## Concrete remaining edits after authorization

1. `packets/DirichletPadicLFunctions--L3-2.json`: in node
   `DirichletPadicLFunctions:L3/rjw2-fg-log-antidifference`, change the Zhao
   locator's E34 to `DirichletPadicLFunctions/E37`. Keep the strict endpoint,
   Gamma argument, proof and sourceIssue verdict unchanged. Install an
   accepted review by `independent-review-REV-FIX-RT-AREA-iwasawa-2~2`, dated
   on the continuation's day, explicitly bounded to the 29 root/derivative
   contracts in the report. Record the all-prime hypotheses, conductor term,
   dyadic normalization and separate nonvanishing suppliers. Preserve all
   five gaps, eight requests and the sourceIssue; archive any existing whole
   review before replacement.
2. `packets/PadicHodgeRegulators--D.1.json`: archive the current entire
   `independent-review-REV-PadicHodgeRegulators--D.1~2` in `reviewHistory`,
   including all 72 `checked` entries. Install an accepted review with this
   fix-review id, bounded to D.2 `log-syntomic-complex`,
   `fontaine-messing-kato-period-map`, `small-twist-comparison`,
   `syntomic-exponential`. Record the divided/undivided maps, factorial twist,
   exact small-weight and bounded undivided ranges, rational exponential
   scale/sign and external CS.0–CS.3 producers. Preserve 17 sourceIssues,
   nine gaps, twenty requests and eight planned stages. Do not imply a new
   complete regulator audit or producer closure.
3. Run all four packet checkers and intake checks. Load the unchanged job
   from `research/blueprint/queue.json`, import `research/blueprint/issues.py`
   and call `deliverables_complete(job)` against the real repository.
   Require True before calling the submission complete. Suggested files need
   no edit for these receipts. Their original checks in this run were PMIA
   1,075, L3-2 110 and D.1 307 `sorry` warnings only; L3 fails at local imports.

Scratch drafts and logs are removed after PR opening. These instructions and
the report reproduce the proposed edits without scratch dependencies. Review
notes in packet JSON should say “proof-placeholder warnings”: the checker
rejects the token used by Lean for admitted proofs in packet prose.

## Mathematical follow-up, distinct from this scope blocker

PMIA still needs coordinated reuse of current native Fitting and stable
transpose APIs. Migrate five generic L6 nodes, their direct consumers, both
StableReduction requests, L4 comparison, reader and suggested interfaces
together. The five ids and exact native contracts are in the report. Keep
matrix/kernel and finite-projective scalar/range adapters, order computations,
nonflat/deficient-relation controls and rank/nontriviality hypotheses. The
reader is outside this review scope, so retain `needs_changes` rather than
performing an inconsistent partial migration. CS producers and LAD's stronger
homotopy/solid inputs remain explicit gaps; RS-16's independent proof routes
remain separate. No mathematical owner was moved in this run.
