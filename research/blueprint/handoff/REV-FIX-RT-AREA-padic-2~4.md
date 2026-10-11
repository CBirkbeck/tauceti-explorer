# REV-FIX-RT-AREA-padic-2~4: blocked by issued-scope mismatch

Refs #6519. Codex, session **codex-CsBE2B**, 11 October 2026.
Input and freshly checked remote main:
`43d1333d8377cdfa82317a22d2a67ec03b9fdab6`; branch
`codex-CsBE2B-review-padic-scope`. Bot confirmation:
[comment 6105789244](https://github.com/CBirkbeck/tauceti-explorer/issues/6519#issuecomment-6105789244)
names this session and claim comment 6105788234. Only this job was claimed.

## Done

The live issue's review already has all three verdicts:
Faltings and Adic accepted for the scoped fixes; Perfectoid `needs_changes`
for its unfinished broader audit. The full finding-by-finding mathematical
review, source-reading attribution and successful Lean checks remain in the
[review report](../reviews/REV-FIX-RT-AREA-padic-2~4.md). The current session
preserves those verdicts and introduces no mathematical or Lean changes.

Fresh checks independently confirm the blocker in this checkout, whose commit
matches remote main. The generated queue demands **31 outputs /
fifteen packets**; the live issue authorizes **seven outputs / three packets**.
The unmodified completion predicate is structurally identical in the two
revisions. It returns **True** for the issued scope and **False** for the
expanded generated job. All twelve additional packets retain accepted verdicts
from their own review jobs; their reviewer ids do not match this job's id.
Perfectoid's `needs_changes` verdict counts as completed review work.

The issue body was fetched again after bot confirmation and is unchanged.
Fresh calls to `intake.file_problems` reject both `queue.json` and
`make_queue.py` as outside swarm output paths. The issue also excludes them.
The repair therefore requires separately authorized maintainer work; another
packet verdict cannot remove this blocker.

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
