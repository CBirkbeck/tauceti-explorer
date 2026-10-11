# Handoff: REV-FIX-RT-AREA-padic-1~3

Codex, session `codex-CLBrB6`, 11 October 2026. Refs
[#5704](https://github.com/CBirkbeck/tauceti-explorer/issues/5704).
Input `9ed13b38327bb8500c9e4c307e8f08979a7a04d1`;
branch `codex-CLBrB6-review-5704`.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6108234434).
Continues `codex-SvKnTK`; this session did none of the author fixes or prior
reviews. One issue claimed; no second job.

**Blocked checkpoint.** The previous handoff's resumption gate is unmet.
Fresh live issue bodies confirm #5704 assigns seven outputs and three packets,
while the queue requires 47 outputs and 23 packets. #6519 assigns seven
outputs and three packets, versus 31 outputs and 15 packets in the queue.
Both issued lists exactly match their historical queues at `c69e5b6c9` and
`888f12f5c9`. Every queued output exists.

The stock completion function reads only current top-level reviews. It returns
`[false, true]` for the paired issued scopes and false for both queue scopes.
Restoring #5704's archived reviews in memory returns `[true, false]`, moving
the failure to #6519. All ten preserved assessment-history assertions pass.
They also confirm packet mathematics excluding review metadata and all three
suggested-file bytes equal `331007b5e`. No production repair or metadata edit
was made. Runnable collision, scope-preservation and assessment-history
fixtures remain in the review report and need no retained scratch files.

Fresh stock blueprint checks using the configured pinned declaration index
pass with zero errors and warnings: P0 326 nodes, AEG 153, ASII 537.
No fresh source audit, mathematical verdict or Lean compiler run is claimed.
The unchanged files' last fresh sequential elaborations are attributed to
`codex-iJ9Di6` in [#8854](https://github.com/CBirkbeck/tauceti-explorer/pull/8854):
exit 0 with only admitted-proof warnings for each file. Compilation does not
validate the omitted P7 tower signatures/tests. Current verdicts and review
histories are untouched; the archived scoped review retains its attribution.
Only the report and this handoff changed.

## Where to resume

The next action is a maintainer repair outside this issue's deliverables:

1. Suspend repeat dispatch of #5704 until the repair is installed.
2. Reconcile both issued author/review scopes with their historical assignments,
   preserving outputs, prompts and prerequisites during regeneration.
3. Support assessment-bound historical completion while preserving current
   promotion reviews. Establish how source and reader inputs bind to assessments;
   unbound legacy history must not automatically count.
4. Test both jobs simultaneously, including a later scoped review. Regenerate
   twice and verify stable scopes, prompts, prerequisites and runtime state.
5. Submit and synchronize the excluded repair paths through an authorized
   maintainer route. Redispatch this review only if assigned work remains.

Queue, generator, completion-function and generated-prompt edits are outside
this assignment and fail `intake.ALLOWED`. Workers may not change labels or
other sessions' branches. The older draft
[#8206](https://github.com/CBirkbeck/tauceti-explorer/pull/8206) offers a
queue-only proposal; restoring scopes alone does not resolve the later-review
collision. The report's assessment fixture is a candidate, not an installed
or fully validated migration.

The archived mathematical dispositions remain: P0 needs_changes for general-base
almost-category comparisons, Cohen/tower supplier interfaces and missing P7
signatures/tests; AEG accepted for its constructed characteristic-p boundary;
ASII accepted for the pending 19-node sousperfectoid prefix. Q4/RS-05 and
stage/edge/reparenting installation remain maintainer actions. The report
retains per-finding reasons and excluded-owner handoffs.
