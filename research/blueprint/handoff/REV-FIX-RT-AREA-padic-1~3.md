# Handoff: REV-FIX-RT-AREA-padic-1~3

Codex, session `codex-i7wp9f`, 11 October 2026. Refs
[#5704](https://github.com/CBirkbeck/tauceti-explorer/issues/5704).
Input `3bb796f9d239e9568caaf90e1f4c18fe2bfcb2ab`;
branch `codex-i7wp9f-review-5704`.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6107074305).
No author fixes or earlier reviews were this session's work. One job claimed;
no second job.

**Blocked checkpoint.** The mathematical review is already recorded in the
[report](../reviews/REV-FIX-RT-AREA-padic-1~3.md). Fresh checks confirm that
#5704 still assigns seven outputs and three packets, while its queue entry
requires 47 outputs and 23 packets. #6519 likewise assigns seven outputs and
three packets but its queue requires 31 outputs and 15 packets. The live lists
match queues at `c69e5b6c9` and `888f12f5c9`; all queue outputs exist.

Stock completion is `[false, true]` for the live scopes and `[false, false]`
for the queue scopes. P0 and ASII current verdicts belong to #6519. Restoring
#5704's archived verdicts only in memory changes live completion to
`[true, false]`. No current verdict was overwritten. Repair paths are outside
this issue and fail `intake.ALLOWED`; no production repair was installed.

Fresh checks: all three packets pass the stock checker with zero errors and
warnings using the pinned index. The report's preserved generator cases pass
4/8 stock, 6/8 later-only and 8/8 two-site; all ten assessment-history checks
pass. Packet content excluding review metadata, and suggested-file bytes,
equal `331007b5e`. No Lean compiler or fresh mathematical source audit ran;
previous workers' evidence retains its attribution. Only the report and this
handoff changed.

Retained mathematical dispositions: P0 needs_changes for general-base almost
category comparisons, Cohen/tower supplier interfaces and omitted Lean tower
signatures/tests; AEG accepted for its constructed characteristic-p boundary;
ASII accepted for its pending 19-node sousperfectoid prefix. Q4/RS-05 and
stage/edge/reparenting installation remain maintainer actions. The report
preserves every finding's qualified disposition and runnable repair fixtures.

## Resume after maintainer repair

1. Restore both author/review scopes from the historical queues above and
   preserve issued outputs, prompts and prerequisites on regeneration.
2. Establish assessment-bound historical completion without replacing the
   current promotion reviews. Decide how assessed source and reader inputs
   are bound; legacy histories without evidence cannot simply count.
3. Verify both jobs simultaneously, including a later scoped review. Regenerate
   twice and check stable scopes, prompts, prerequisites and runtime state.
4. Arrange an authorized repair submission and issue synchronization for the
   excluded queue, generator, completion and prompt files. Workers must not
   change labels or close issues. Repeating the completed mathematical audit
   or replacing current reviews does not resolve this blocker.

The earlier draft [#8206](https://github.com/CBirkbeck/tauceti-explorer/pull/8206)
is documented in the preceding checkpoint; its queue-only proposal does not
address the current verdict collision. No disposable scratch file is needed
for resumption. The previous handoff is preserved at the input commit.
