# REV-FIX-RT-AREA-padic-2~4: blocked by issued-scope mismatch

Refs #6519. Codex (GPT-6), session **codex-v3nsk3**, 11 October 2026.
Input `9e77d5c183d3c758c5971353e4069181095b2b2c`; branch
`codex-v3nsk3-review-padic-fixes`. Bot confirmation:
[comment 6104756560](https://github.com/CBirkbeck/tauceti-explorer/issues/6519#issuecomment-6104756560).

## Done

The live issue's review already has all three verdicts:
Faltings and Adic accepted for the scoped fixes; Perfectoid `needs_changes`
for its unfinished broader audit. The full finding-by-finding mathematical
review, source-reading attribution and successful Lean checks remain in the
[review report](../reviews/REV-FIX-RT-AREA-padic-2~4.md). The current session
preserves those verdicts and introduces no mathematical or Lean changes.

Fresh checks independently confirm the blocker in this checkout and GitHub
main at `b061836721f295b25db6dd43d2fb96ca78830e78`. Both generated queues demand **31 outputs /
fifteen packets**; the live issue authorizes **seven outputs / three packets**.
The unmodified completion predicate is structurally identical in the two
revisions. It returns **True** for the issued scope and **False** for the
expanded generated job. All twelve additional packets retain accepted verdicts
from their own review jobs; their reviewer ids do not match this job's id.
Perfectoid's `needs_changes` verdict counts as completed review work.

Pinned-index packet validation passes with **56, 326 and 537 nodes, zero errors
and zero warnings**. The index manifest matches Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Only this handoff and the review
report change. Lean was not rerun for documentation-only work; the earlier
successful elaborations remain attributed in the report.

## What remains and where to resume

**Maintainer scope repair is required to finish intake.** The live issue's
explicit permitted files exclude the queue, generator and twelve additional
packets. Repeating the bounded review or changing Perfectoid's verdict cannot
repair that mismatch.

1. Restore the round-four fix and review's ordered `outputs` and `after` lists
   from historical commit `888f12f5c9d80d8205c6f7dd55cbbb933633b5e6`:
   ten fix outputs and seven review outputs. This preserves the issued contract.
2. In `make_queue.py`'s `fix_rounds`, retain an already issued following round
   when new missing files or a send-back are discovered. The proposed expression
   is `previous_jobs.get(following) if following in states else None`.
   The report's
   [complete-generator experiment](../reviews/REV-FIX-RT-AREA-padic-2~4.md#continuation-real-queue-regeneration-preserves-the-proposed-repair-twice)
   supplies the exact candidate and a write-free reproducer. Earlier sessions
   verified two full computations and eight isolated controls. Those experiments
   are inherited evidence, not rerun in this session. A queue-only restoration
   was shown to expand again under stock generation.
3. Inspect unrelated generated changes and verify persistence, issue
   synchronization and intake in authorized maintainer work. Route genuinely new
   receiving work to separately authorized jobs. An intentional scope expansion
   instead requires updating the live issue and its prompt before another worker
   attempts it.
4. Keep the issue unavailable until its issued and generated contracts agree,
   to prevent another claim of this already completed bounded review. Workers
   must not change labels or close the issue themselves.

The report contains all durable evidence and the repair reproducer. No scratch
artifact is needed to resume. This is a blocked checkpoint, not a claim that the
expanded fifteen-packet review is finished. No second job was claimed.
