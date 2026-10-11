# Handoff: REV-FIX-RT-AREA-padic-1~3

Codex, session `codex-yEUnDK`, 11 October 2026. Refs
[#5704](https://github.com/CBirkbeck/tauceti-explorer/issues/5704).
Input `897618096af2bb002a83d22044f03ed8e63fd066`;
branch `codex-yEUnDK-review-5704`.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6108374793).
Continues `codex-CLBrB6`; this session did none of the author fixes or earlier
reviews. One issue claimed; no second job.

**Blocked checkpoint.** Independently reproduced the previous handoff's
unresolved repair gate. The live #5704 issue assigns seven outputs and three
packets, while its queue requires 47 outputs and 23 packets. #6519 assigns
seven outputs and three packets, versus 31 outputs and 15 packets in the queue.
Both issued scopes exactly equal their historical queues at `c69e5b6c9` and
`888f12f5c9`. All queued outputs exist. The post-confirmation reread of #5704
found no body change.

The stock completion function reads only current top-level reviews. Current
issued scopes yield `[false, true]`, and both queue scopes are incomplete.
Reran the preserved read-only collision fixture: restoring #5704's archived
P0 and ASII verdicts only in memory yields `[true, false]`. P0 and ASII
currently identify #6519; AEG identifies #5704. No production repair or
review metadata edit was made. Generator and assessment fixtures remain in
the report, with their original attribution; this run did not rerun them.

Fresh stock blueprint checks with the configured pinned declaration index pass
with zero errors and warnings: P0 326 nodes, AEG 153, ASII 537. These are
structural checks, not fresh mathematical or source verdicts. No Lean compiler
ran. Earlier successful elaborations remain attributed to `codex-iJ9Di6` in
[#8854](https://github.com/CBirkbeck/tauceti-explorer/pull/8854), with the
recorded omission of P7 tower signatures and tests. Packet and suggested-file
contents, verdicts and review histories are untouched. Only the review report
and this handoff changed.

## Where to resume

The required repair is outside this issue's authorized deliverables:

1. Suspend repeat dispatch of #5704 until the repair is installed.
2. Reconcile both issued author/review scopes with their historical assignments,
   preserving outputs, prompts and prerequisites during regeneration.
3. Support assessment-bound historical completion while preserving current
   promotion reviews. Establish how source and reader inputs bind to assessments;
   unbound legacy history must not automatically count.
4. Test both jobs simultaneously, including a later scoped review. Regenerate
   twice and verify stable scopes, prompts, prerequisites and runtime state.
5. Submit and synchronize excluded repair paths through an authorized
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
