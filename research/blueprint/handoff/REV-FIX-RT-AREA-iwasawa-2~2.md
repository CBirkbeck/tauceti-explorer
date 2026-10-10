# REV-FIX-RT-AREA-iwasawa-2~2 — scope-blocked checkpoint

Codex, session `codex-iSC2Iz`, 10 October 2026. Refs #6219.
Input `3a07447e7197edbc9e1feda7deaa7c36ecbab776`.
[Confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6097589642).

The [report](../reviews/REV-FIX-RT-AREA-iwasawa-2~2.md) records fresh bounded
source checks, current/pinned library checks, four original packet validations,
two draft validations and four sequential Lean attempts. It retains the exact
proposed review objects, node selections, source links and earlier reviews
with their original attribution. No packet, Lean file or queue was modified.
The original completion predicate is False; a two-packet scratch overlay is
True. All gaps/requests/sourceIssues/coverage stay unchanged. The proposed D.1
archive preserves the complete preceding review, including its 72 checked
entries. Scratch is removed after PR opening; no resumption step needs it.

## Resolve before redispatch

The live issue omits two packet paths that its queue requires. Authorization
was requested and has not arrived. [WORKERS.md](../WORKERS.md) says:
“Edit only the files the issue names, plus your own scratch space.”
Correct the live issue scope or explicitly authorize these paths before a
fresh process resumes. Do not refresh the already correctly named L3/PMIA
receipts or change the queue to bypass the completion rule.

1. `research/blueprint/packets/DirichletPadicLFunctions--L3-2.json`:
   install the report's accepted bounded fix review with reviewer
   `independent-review-REV-FIX-RT-AREA-iwasawa-2~2`. Update session/date and
   remove “Proposed” when installing. Archive any previous full review.
   In `DirichletPadicLFunctions:L3/rjw2-fg-log-antidifference`, replace only
   E34 by `DirichletPadicLFunctions/E37` in the Zhao source locator. Keep
   the existing strict endpoint and Gamma argument. Preserve all five gaps,
   eight requests and the sourceIssue; keep the arithmetic nonvanishing
   suppliers separate.
2. `research/blueprint/packets/PadicHodgeRegulators--D.1.json`:
   first append the entire current
   `independent-review-REV-PadicHodgeRegulators--D.1~2` review unchanged to
   `reviewHistory`, including all 72 checked entries. Install the report's
   accepted fix receipt, explicitly bounded to the four D.2 consumers.
   Preserve 17 sourceIssues, nine gaps, twenty requests and eight planned
   stages. Do not imply a fresh complete regulator review or CS producer closure.
3. Run all four packet checkers and `intake.py check-files` for changed paths.
   Import `research/blueprint/issues.py`, load the unchanged job from
   `queue.json`, and require `deliverables_complete(job)` on the real checkout
   to return True before calling the job complete. No extra Lean edit is needed.

In this run L3-2, D.1 and PMIA elaborate with respectively 110, 307 and 1,075
proof-placeholder warnings only. L3 fails at the unavailable repository-local
`research` imports in the isolated shared build. No compilation remains running.
Packet prose must say “proof-placeholder warnings”; the checker rejects Lean's
admitted-proof token in packet prose.

## Separate mathematical revision

Retain PMIA's existing `needs_changes` review. Migrate the five generic L6
nodes `higher-fitting-ideal`, `relation-minors-add-generator`,
`higher-fitting-independence`, `higher-fitting-base-change`, and
`transpose-stable-equivalence` to the current native APIs together with their
consumers, both StableReduction requests, L4 comparison, reader and suggested
interfaces. Exact contracts and current commits are retained in the report.
Keep matrix/kernel, opposite-ring/scalar and finite-projective adapters,
nonflat/deficient-relation controls and rank/nontriviality hypotheses. The
reader is outside this review scope; a partial migration is inappropriate.
PMIA's negative verdict already constitutes a completed review and does not
cause the intake scope failure. No mathematical owner was moved in this run.
