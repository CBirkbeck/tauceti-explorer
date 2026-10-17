# REV-FIX-RT-AREA-padic-2~4: blocked by issued-scope mismatch

Refs #6519. Codex, session **codex-00h8oD**, 17 October 2026.
Input commit: `9bca7917e6e2791f93e1e2d96336af62938ec8f6`.
Branch: `codex-00h8oD-review-6519`.
The bot confirmed [claim comment 6241587397](https://github.com/CBirkbeck/tauceti-explorer/issues/6519#issuecomment-6241587397)
in [comment 6241590088](https://github.com/CBirkbeck/tauceti-explorer/issues/6519#issuecomment-6241590088).
This session wrote none of the fixes or previous reviews and claimed no second job.

## Completed work and present blocker

The issued three-packet review already records Faltings and Adic as accepted
for the scoped fixes, and Perfectoid as `needs_changes` for its broader audit.
The [review report](../reviews/REV-FIX-RT-AREA-padic-2~4.md) preserves the
finding-by-finding mathematical review, original source and Lean attribution,
and the earlier repair reproducer. This continuation changes only the report's
current blocker notice and this handoff. No mathematical verdict changes.

After bot confirmation, the issue still authorizes **seven outputs / three
packets**. The checkout and independently fetched GitHub-main queue at
`37d735d33f813af3b7bf2043228bbc613955e77d` instead require **27 outputs /
thirteen packets**. Their ordered output lists agree, and all outputs exist.
Fresh unmodified `issues.deliverables_complete` returns `True` for a copy of
the job with the issued seven outputs and `False` for both generated entries.

The ten additional packets all have accepted reviews by their own independent
review jobs, listed in the report's current notice. The predicate demands this
job's exact reviewer identifier on every packet. Perfectoid's `needs_changes`
already satisfies the completed-review test. Overwriting other reviewers'
verdicts would exceed this issue's scope and misrepresent this continuation.

Both local and current-main `make_queue.py` retain the conditional `made`
assignment in `fix_rounds`. Fresh `intake.file_problems` checks reject both
repair paths, `research/blueprint/queue.json` and
`research/blueprint/make_queue.py`, as outside swarm output paths. WORKERS.md
also limits edits to named deliverables. A permitted report or packet edit
cannot complete the expanded generated job.

Fresh `scripts/check_blueprint.py` checks with the manifest-matching pinned
index pass: **56, 326 and 537 nodes; zero errors and zero warnings**. Pins:
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. These are structural/index checks;
this continuation claims no fresh primary-source or mathematical audit. Lean
was not rerun for documentation-only changes. Prior successful runs remain
attributed in the report. No link map or proposal is changed.

## Required maintainer action before resuming

1. Reconcile the round-four fix/review contracts with the live issue. The
   historical queue at `888f12f5c9d80d8205c6f7dd55cbbb933633b5e6` records the
   issued ten-output fix and seven-output review, including their dependencies.
2. Preserve previously issued following rounds in `fix_rounds` even when new
   missing files or a preceding send-back are found. The report's previously
   tested candidate assigns `made` using
   `previous_jobs.get(following) if following in states else None`.
   Earlier write-free experiments preserve both contracts through two full
   computations and eight isolated controls. This session did not rerun those
   experiments; restoring only the queue can expand the scope again.
3. Inspect unrelated generated changes, verify repeated regeneration preserves
   the intended contracts, synchronize the issue and check actual intake.
   Newly routed receiving work should have its own jobs. An intended larger
   review needs an explicitly revised issue and prompt before assignment.
4. Keep this issue unavailable until the contracts agree. Workers cannot edit
   labels or close it. Reassigning this completed scoped review repeats the
   same administrative blocker.

All durable evidence and the repair reproducer are in the report; no scratch
artifact is needed. This is a **blocked checkpoint**, not completion of the
expanded thirteen-packet review.
