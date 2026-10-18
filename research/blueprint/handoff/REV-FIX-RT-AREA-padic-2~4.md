# REV-FIX-RT-AREA-padic-2~4: blocked by issued-scope mismatch

Refs #6519. Codex, session **codex-1itTY8**, 18 October 2026.
Input and independently fetched GitHub main:
`a4e212c3bdbac27ae717f9205bfddc41c1fb88e0`.
Branch: `codex-1itTY8-review-padic-fixes`.
The bot confirmed [claim comment 6256286338](https://github.com/CBirkbeck/tauceti-explorer/issues/6519#issuecomment-6256286338)
in [comment 6256287897](https://github.com/CBirkbeck/tauceti-explorer/issues/6519#issuecomment-6256287897).
This session wrote none of the fixes or prior reviews and claimed no second job.

## Work complete and blocker

The issued three-packet review is already complete: Faltings and Adic are
accepted for the scoped fixes; Perfectoid has `needs_changes` for its wider
audit. The [report](../reviews/REV-FIX-RT-AREA-padic-2~4.md) retains the
finding-by-finding review and its original source-reading and Lean attribution.
This continuation updates only its current notice and this handoff.

After claim confirmation, the fetched issue still authorizes **seven outputs /
three packets**. The local and current-main queues require **27 outputs /
thirteen packets**. Their ordered outputs agree and every output exists.
Fresh unmodified `issues.deliverables_complete` returns `True` for a copy
restricted to the issued seven outputs and `False` for both generated entries.

All ten additional packets already have accepted independent reviews under
other job identifiers, listed in the report's current notice. The completion
predicate requires this job's identifier on every packet. Perfectoid's
`needs_changes` satisfies its completed-review condition. No change within the
issued scope can satisfy the expanded contract.

Freshly fetched `issues.py`, `intake.py` and `make_queue.py` are byte-identical
to the checkout. `fix_rounds` still conditions preservation of an existing
following round on `not (missing or sent_back)`. Fresh `intake.file_problems`
calls reject both repair paths, `research/blueprint/queue.json` and
`research/blueprint/make_queue.py`, as outside swarm output paths. WORKERS.md
also limits edits to named deliverables. The issue cannot be completed through
an authorized change in this worker run.

## Required maintainer repair before resuming

1. Restore the issued round-four fix and review contracts. The historical
   queue at `888f12f5c9d80d8205c6f7dd55cbbb933633b5e6` records the ten-output
   fix and seven-output review, including their dependencies. Keep the
   completed mathematical review.
2. Preserve an already-issued following round in `fix_rounds` when newly
   missing files or a preceding send-back appear. The existing candidate
   assigns `made` using
   `previous_jobs.get(following) if following in states else None`.
   The report contains write-free isolated controls and two complete generator
   computations supporting this candidate. This continuation did not rerun
   them. Restoring only the queue allows regeneration to expand it again.
3. Verify the ordered outputs and dependency edges survive two regenerations,
   synchronize the issue and verify actual intake. Newly routed work needs
   separate jobs. An intentionally larger review needs an explicitly revised
   issue and prompt before assignment.
4. Keep this issue unavailable until those contracts agree. Workers cannot
   change labels or close issues. Reassigning it repeats the same blocker.

## Checks and unchanged evidence

All three packet checks pass against the manifest-matching pinned declaration
index: **Faltings 56, Perfectoid 326 and Adic 537 nodes; zero errors and zero
warnings**. Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.
These are structural/index checks; this continuation claims no fresh
mathematical or primary-source audit. No packet or suggested file changes.
Lean was not rerun for documentation-only changes; the report attributes prior
successful runs to their original sessions. No link or proposal is changed.

This is a **blocked checkpoint**. The durable repair evidence and reproducer
are in the report; no scratch artifact is required to continue.
