# Handoff: REV-FIX-RT-AREA-padic-1~3

Codex, session `codex-iJ9Di6`, 11 October 2026. Refs
[#5704](https://github.com/CBirkbeck/tauceti-explorer/issues/5704).
Input `6e02d93641e95e6ad7a4a6f4697807219720e9c2`;
branch `codex-iJ9Di6-review-5704`.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6107992602).
Continues `codex-OyLXWL`; this session wrote none of the author fixes or
previous reviews. No second job was claimed.

**Blocked checkpoint.** Fresh live scopes and read-only fixtures confirm the
same unresolved assignment/completion conflict. #5704 issues seven outputs,
including three packets, but its queue demands 47 outputs and 23 packets.
#6519 issues seven outputs and three packets against 31 outputs and 15 packets
in the queue. Both issued lists still exactly match the historical queues at
`c69e5b6c9` and `888f12f5c9`, respectively. All queued outputs exist.

The stock completion function uses only current top-level reviews: P0 and
ASII identify #6519; AEG identifies #5704. The fresh paired fixture gives
`[false, true]` for issued scopes and `[false, false]` for queue scopes.
Restoring #5704's archived reviews only in memory gives `[true, false]`.
Overwriting reviews would make the other issued job incomplete. Repair needs
queue, generator, completion and prompt files outside this issue's outputs;
all four path classes fail the intake allowlist. No production repair or
review metadata was changed.

Fresh validation: all three packet checks pass with zero errors/warnings using
the configured pinned declaration index (P0 326 nodes, AEG 153, ASII 537).
The preserved generator cases pass 4/8 stock, 6/8 later-only and 8/8 two-site;
all ten assessment-history cases pass. The assessment fixture also verifies
packet content excluding review metadata and suggested-file bytes against
`331007b5e`. The report preserves these executable repair fixtures. No scratch
file is needed to reproduce them.

Fresh sequential `lean-check` runs on all three issued suggested files exit
**0**, with only admitted-proof warnings: P0 1,285; AEG 361; ASII 912. Checked
available memory before compiling (93 GB); no build, update, cache download or
language server was started. Read the P7 tower sections directly: both named
theorems and their negative contracts are still comments. Elaboration certifies
only declarations present, not the missing signatures or the recorded
mathematical gaps.

No fresh source audit or independent mathematical verdict is claimed. The
archived scoped review retains its source attribution and findings:
P0 needs_changes for general-base almost-category comparisons, Cohen/tower
supplier interfaces and omitted P7 signatures/tests; AEG accepted for the
constructed characteristic-p boundary; ASII accepted for the pending
19-node sousperfectoid prefix. Q4/RS-05 and stage/edge/reparenting installation
remain maintainer actions. Only the report and this handoff changed.

## Resumption gate

The next action requires a maintainer repair, not another packet audit:

1. Suspend repeat dispatch of #5704 until that repair is installed.
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
fixtures and the full qualified mathematical dispositions. The older draft
[#8206](https://github.com/CBirkbeck/tauceti-explorer/pull/8206) offers a
queue-only proposal; restoring scopes alone does not resolve the current
review-attribution collision. Workers may not change labels or other sessions'
branches. No second issue may be claimed in this run.
