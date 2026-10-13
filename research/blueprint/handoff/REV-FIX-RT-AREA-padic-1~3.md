# Handoff: REV-FIX-RT-AREA-padic-1~3

Codex, session `codex-8XHE0J`, 13 October 2026. Refs
[#5704](https://github.com/CBirkbeck/tauceti-explorer/issues/5704).
Input `ff0f8208385bcd1c86322de5ab38810faa4a8e54`;
branch `codex-8XHE0J-review-5704`.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6155245045).
This session did none of the author fixes or earlier reviews. One issue claimed;
no second job.

**Blocked checkpoint.** Fresh post-confirmation issue bodies assign seven
outputs / three packets to each of #5704 and #6519. Current queue assignments
require 47 outputs / 23 packets and 21 outputs / 10 packets respectively.
#6519's queue is smaller than at the prior checkpoint but still conflicts with
its issued scope. Both ordered issued lists equal historical assignments at
`c69e5b6c9` and `888f12f5c9`; all queued outputs exist.

Read the stock completion function and reran the report's read-only collision
fixture. Issued scopes return `[false, true]`; restoring #5704's archived P0
and ASII verdicts only in memory returns `[true, false]`. Both queue scopes
remain incomplete. Current P0 and ASII verdicts name #6519; AEG names #5704.
Overwriting current verdicts cannot finish both reviews. No production review,
history or orchestration code changed.

Compared assigned packets excluding only top-level review metadata with
`331007b5e`: all mathematical content is unchanged; all suggested-file bytes
are identical. Fresh stock blueprint checks pass with zero errors and warnings:
P0 326 nodes, AEG 153, ASII 537. This is a structural validation and blocker
check, not a fresh source/baseline audit. No Lean compilation ran for this
documentation-only continuation. Prior successful elaborations and the omitted
P7 tower declarations retain their original attribution and qualifications.
Generator and assessment-candidate fixtures were not rerun. Only the current
checkpoint in the report and this handoff change.

## Required repair before resumption

1. Suspend repeat dispatch of #5704 until the repair is installed.
2. Reconcile both issued author/review scopes with historical assignments;
   preserve outputs, prompts and prerequisites through regeneration.
3. Support content-bound historical assessment completion while preserving
   current promotion reviews. Specify how source and reader inputs bind to
   assessments; unbound legacy history must not automatically count.
4. Test both jobs together, including a later scoped review. Regenerate twice
   and verify stable scopes, prompts, prerequisites and runtime state.
5. Submit the excluded paths through an authorized maintainer route. Redispatch
   this review only if assigned work remains.

Queue, generator, completion function and generated prompt are outside this
issue's deliverables and each fails `intake.ALLOWED`. Workers cannot change
labels or another session's branch. The older draft
[#8206](https://github.com/CBirkbeck/tauceti-explorer/pull/8206) proposes only a
queue repair; restoring scopes alone does not fix the later-review collision.
The report preserves executable fixtures and prior attribution. No scratch
artifact is needed for resumption.

Archived mathematical dispositions remain: P0 needs_changes for general-base
almost-category comparisons, Cohen/tower supplier interfaces and missing P7
signatures/tests; AEG accepted for its constructed characteristic-p boundary;
ASII accepted for the pending 19-node sousperfectoid prefix. Q4/RS-05 and
stage/edge/reparenting installation remain maintainer actions. The report
retains every finding's disposition and excluded-owner handoff.
