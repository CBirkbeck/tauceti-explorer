# REV-FIX-RT-AREA-padic-2~4: blocked on generated scope

Refs #6519. Codex (GPT-6), session **codex-cynHRP**, 10 October 2026.
Input `5c7a10b3eff42cc6f49f8f8bd9245141714dd1e7`; branch
`codex-cynHRP-padic-review`. Bot confirmation:
[comment 6102788377](https://github.com/CBirkbeck/tauceti-explorer/issues/6519#issuecomment-6102788377).

## Done

The live issue's three-packet review is complete. Its original mathematical
review, finding-by-finding dispositions, source-reading attribution and Lean
results are preserved in the
[review report](../reviews/REV-FIX-RT-AREA-padic-2~4.md). Faltings and Adic are
accepted for the scoped fixes; Perfectoid remains `needs_changes` for its
unfinished broader audit. Those verdicts already name this job and are not
replaced.

This session re-read the issue after claiming and independently checked the
current local and freshly fetched GitHub-main queues and the stock completion
predicate. Both queues still require **31 review outputs / fifteen packets** versus
the issue's **seven outputs / three packets**. The associated fix has 55 outputs.
All generated outputs exist. Completion is **True** for the authorized scope
and **False** for the generated job. All twelve additional packets retain
accepted reviews under other independent job identifiers.

Fresh pinned-index packet checks pass with **56, 326 and 537 nodes, zero errors
and warnings**. The index manifest matches Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Only the report and this handoff
change; Lean was not rerun for documentation-only work. Prior successful
elaborations remain attributed in the report.

## What remains and where to resume

**Maintainer scope repair is required before another worker can finish intake.**
Queue and generator edits are outside this issue's explicit permitted files.
Repeating the finished mathematical review or changing Perfectoid's verdict
does not resolve this administrative blocker.

1. Restore `outputs` and `after` for `FIX-RT-AREA-padic-2~4` and its review from
   historical commit `888f12f5c9d80d8205c6f7dd55cbbb933633b5e6`: ten fix outputs
   and seven review outputs.
2. In `make_queue.py`'s `fix_rounds`, preserve an already issued following round
   regardless of `missing` or `sent_back`. The report's
   [complete-generation experiment](../reviews/REV-FIX-RT-AREA-padic-2~4.md#continuation-real-queue-regeneration-preserves-the-proposed-repair-twice)
   contains the exact one-line candidate and a self-contained write-free
   reproducer. That earlier experiment preserved both jobs' ordered output
   and dependency lists through two computations, and passed eight isolated
   controls for existing and genuinely new rounds. This session freshly reran
   the complete generator experiment against its input, preserving both ordered
   contracts through two computations. Stock
   generation expands a restored seed to 35 fix outputs and 19 review outputs
   and changes the fix dependency. Candidate generation retains ten fix outputs
   and seven review outputs, with completion True. The eight isolated controls
   remain inherited evidence, not rerun in this session.
3. Inspect unrelated generated changes, apply the repair in authorized
   maintainer work, and verify actual persistence, issue synchronization and
   intake. Those side effects have not been tested by the write-free experiment.
   Newly routed receiving work needs separate authorized jobs.
4. Keep this issue unavailable until repaired to prevent repeated claims of
   the completed bounded review. Workers may not change its labels themselves.

No scratch artifact is needed to resume: all substantive evidence is in the
report. No new mathematical review or primary-source reading is claimed here;
no second job was claimed.
