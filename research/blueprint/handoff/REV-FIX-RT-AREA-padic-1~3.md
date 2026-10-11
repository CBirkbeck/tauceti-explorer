# Handoff: REV-FIX-RT-AREA-padic-1~3

Codex, session `codex-vbTYkD`, 11 October 2026. Refs
[#5704](https://github.com/CBirkbeck/tauceti-explorer/issues/5704).
Input `84cf000b0608a871fc237a43474ab6d3cdcd675a`;
branch `codex-vbTYkD-review-5704`.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6107503012).
This session did none of the author fixes or earlier reviews. One issue
claimed; no second job.

**Blocked checkpoint.** The assigned mathematical review is already recorded
in the [report](../reviews/REV-FIX-RT-AREA-padic-1~3.md). Fresh checks confirm
that #5704 assigns seven outputs and three packets while its queue requires
47 outputs and 23 packets. #6519 assigns seven outputs and three packets while
its queue requires 31 outputs and 15 packets. The live lists equal historical
queues at `c69e5b6c9` and `888f12f5c9`; all current queue outputs exist.

Stock completion is `[false, true]` for live scopes and `[false, false]` for
queue scopes. P0 and ASII current verdicts belong to #6519. Restoring #5704's
archived verdicts in memory produces `[true, false]`; replacing current reviews
cannot complete both jobs. Repair paths are outside the issue and fail
`intake.ALLOWED`. Expanded repair scope was requested but not granted.
No production repair was installed or verdict overwritten.

Fresh checks: all three packets pass the stock checker with zero errors and
warnings using the shared pinned index. The preserved generator cases
pass 4/8 stock, 6/8 later-only and 8/8 two-site; all ten assessment-history
assertions pass. Packet content excluding review metadata and suggested-file
bytes equal `331007b5e`. No Lean compiler or fresh source audit ran. Earlier
workers' evidence remains attributed to them. Only the report and handoff
changed; their runnable fixtures preserve everything needed from scratch.

Retained mathematical dispositions: P0 needs_changes for general-base almost
category comparisons, Cohen/tower supplier interfaces and omitted Lean tower
signatures/tests; AEG accepted for its constructed characteristic-p boundary;
ASII accepted for its pending 19-node sousperfectoid prefix. Q4/RS-05 and
stage/edge/reparenting installation remain maintainer actions. The report
preserves each finding's qualified disposition.

## Resume after maintainer repair

1. Restore both author/review scopes from the historical queues above and
   preserve issued outputs, prompts and prerequisites on regeneration.
2. Establish assessment-bound historical completion without replacing current
   promotion reviews. Decide how assessed source and reader inputs are bound;
   legacy histories without evidence cannot simply count.
3. Verify both jobs simultaneously, including a later scoped review. Regenerate
   twice and check stable scopes, prompts, prerequisites and runtime state.
4. Arrange an authorized repair submission and issue synchronization for the
   excluded queue, generator, completion and prompt files. Workers must not
   change labels or close issues. Repeating the existing mathematical audit
   or replacing current reviews cannot resolve this blocker; redispatch alone
   repeats checkpoints.

The earlier draft [#8206](https://github.com/CBirkbeck/tauceti-explorer/pull/8206)
is documented in the report; its queue-only proposal does not resolve the
current verdict collision. No disposable scratch file is needed to resume.
