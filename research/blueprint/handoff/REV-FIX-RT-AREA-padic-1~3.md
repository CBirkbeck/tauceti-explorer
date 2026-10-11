# Handoff: REV-FIX-RT-AREA-padic-1~3

Codex, session `codex-SvKnTK`, 11 October 2026. Refs
[#5704](https://github.com/CBirkbeck/tauceti-explorer/issues/5704).
Input `b3576ca2efde68ac43a54554771352510420790b`;
branch `codex-SvKnTK-review-5704`.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6108143835).
Continues `codex-iJ9Di6`; this session wrote none of the author fixes or
previous reviews. One issue was claimed; no second job.

**Blocked checkpoint.** The assignment/completion conflict remains unchanged.
Fresh live issue bodies give #5704 seven outputs and three packets, versus
47 outputs and 23 packets in the queue. #6519 gives seven outputs and three
packets, versus 31 outputs and 15 packets. Both issued lists exactly match
their historical queues at `c69e5b6c9` and `888f12f5c9`. All queue outputs
exist; the blocker is not missing files.

The stock completion function checks only current top-level reviews. P0 and
ASII identify #6519; AEG identifies #5704. For the issued scopes the paired
fixture returns `[false, true]`; restoring #5704's archived reviews only in
memory gives `[true, false]`. Both queue scopes return false. Replacing
reviews cannot finish both assignments. The queue, generator, completion and
prompt repair paths are outside this issue and fail `intake.ALLOWED`.
No production repair or review metadata changed.

Fresh validation: all three packet checks pass with zero errors/warnings
using the configured pinned declaration index: P0 326 nodes, AEG 153, ASII
537. Reran the preserved generator fixture: 4/8 stock, 6/8 later-only, 8/8
two-site. All ten assessment-history assertions pass. That fixture confirms
packet content excluding review metadata and every suggested-file byte
against `331007b5e`. Runnable fixtures remain in the report and require no
scratch file. Candidate repairs run only in memory.

No fresh source audit, mathematical verdict or Lean compiler run is claimed.
The unchanged files' last fresh elaborations are those of `codex-iJ9Di6` in
[#8854](https://github.com/CBirkbeck/tauceti-explorer/pull/8854): all three
exit 0 with only admitted-proof warnings. Elaboration does not validate the
P7 tower targets still left in comments.

The archived scoped review retains its attribution and per-finding reasons:
P0 needs_changes for general-base almost-category comparisons, Cohen/tower
supplier interfaces and missing P7 signatures/tests; AEG accepted for its
constructed characteristic-p boundary; ASII accepted for the pending
19-node sousperfectoid prefix. Q4/RS-05 and stage/edge/reparenting installation
remain maintainer actions. Only the report and this handoff changed.

## Resumption gate

The next action requires a maintainer repair, not another packet audit:

1. Suspend repeat dispatch of #5704 until the repair is installed.
2. Reconcile both issued author/review scopes with their historical assignments,
   preserving outputs, prompts and prerequisites during regeneration.
3. Support assessment-bound historical completion while preserving current
   promotion reviews. Establish the source/reader-input binding policy;
   unbound legacy history must not simply count.
4. Test both jobs simultaneously, including a later scoped review. Regenerate
   twice and verify stable scopes, prompts, prerequisites and runtime state.
5. Use an authorized submission and issue-synchronization route for excluded
   repair files. Redispatch this review only if assigned work remains.

The report contains the collision, scope-preservation and assessment-history
fixtures and the qualified mathematical dispositions. The older draft
[#8206](https://github.com/CBirkbeck/tauceti-explorer/pull/8206) offers a
queue-only proposal; restoring scopes alone does not resolve the current
review-attribution collision. Workers may not change labels or other sessions'
branches. No second issue may be claimed in this run.
