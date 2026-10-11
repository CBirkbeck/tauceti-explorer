# Handoff: REV-FIX-RT-AREA-padic-1~3

Codex, session `codex-OyLXWL`, 11 October 2026. Refs
[#5704](https://github.com/CBirkbeck/tauceti-explorer/issues/5704).
Input `517d1829d0fc041f39f5b88fd54e5ba8459ba55c`;
branch `codex-OyLXWL-review-5704`.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6107928215).
Continues the `codex-XBKxEG` handoff; this session wrote none of the author
fixes or prior reviews. No second job was claimed.

**Blocked checkpoint.** The assigned mathematical review is recorded in the
[report](../reviews/REV-FIX-RT-AREA-padic-1~3.md), together with runnable
repair fixtures. The live issue still assigns seven outputs and three packets,
while its queue requires 47 outputs and 23 packets. #6519 likewise assigns
seven outputs and three packets, against 31 outputs and 15 packets in its
queue. Fresh live scopes exactly match historical queues at `c69e5b6c9` and
`888f12f5c9`; every current queue output exists.

Stock completion is `[false, true]` for live scopes and `[false, false]` for
queue scopes. P0 and ASII currently identify #6519. Restoring #5704's archived
verdicts only in memory yields `[true, false]`. Overwriting reviews cannot
finish both jobs. Queue, generator, completion-function and generated-prompt
repair paths are outside the issued scope and fail the intake allowlist.

Fresh checks: all three packets pass the stock checker with zero errors and
warnings using its configured pinned declaration index. The preserved generator
cases pass 4/8 stock, 6/8 later-only and 8/8 two-site; all ten assessment-history
cases pass. Packet content excluding review metadata and all three suggested
files match `331007b5e`. No Lean compiler or fresh source audit ran. Earlier
workers' mathematical evidence and elaboration remain attributed to them.
Only the report and handoff changed; no scratch file is needed to resume.

Retained mathematical dispositions: P0 needs_changes for general-base almost
category comparisons, Cohen/tower supplier interfaces and omitted Lean tower
signatures/tests; AEG accepted for its constructed characteristic-p boundary;
ASII accepted for its pending 19-node sousperfectoid prefix. Q4/RS-05 and
stage/edge/reparenting installation remain maintainer actions. The report
preserves every finding's qualified disposition.

## Maintainer repair and resumption gate

1. Remove #5704 from worker selection until the external repair is installed.
   Workers may not change labels; repeated review dispatch cannot resolve it.
2. Restore both issued author/review scopes from the historical queues above,
   preserving outputs, prompts and prerequisites during regeneration.
3. Establish assessment-bound historical completion without replacing current
   promotion reviews. Decide how assessed sources and reader inputs are bound;
   legacy histories without evidence cannot simply count.
4. Verify both jobs simultaneously, including a later scoped review. Regenerate
   twice and check stable scopes, prompts, prerequisites and runtime state.
5. Arrange an authorized repair submission and issue synchronization for the
   excluded queue, generator, completion-function and generated-prompt files.
   Then redispatch this review only if assigned work remains.

The earlier draft [#8206](https://github.com/CBirkbeck/tauceti-explorer/pull/8206)
is documented in the report; its queue-only proposal does not resolve the
current verdict collision. The report's runnable fixtures remain the repair's
starting evidence, subject to the assessment-policy qualification above.
