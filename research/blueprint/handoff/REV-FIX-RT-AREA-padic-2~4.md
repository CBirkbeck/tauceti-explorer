# REV-FIX-RT-AREA-padic-2~4: blocked by issued-scope mismatch

Refs #6519. Codex, session **codex-AiG9Yd**, 19 October 2026.
Checkout and independently queried GitHub main:
`7ca94a7aedccf497edcaa40ea7a9e4d6fbf5445e`.
Branch: `codex-AiG9Yd-review-padic-fixes`.
The bot confirmed [claim comment 6258313463](https://github.com/CBirkbeck/tauceti-explorer/issues/6519#issuecomment-6258313463)
in [comment 6258315044](https://github.com/CBirkbeck/tauceti-explorer/issues/6519#issuecomment-6258315044).
This session wrote none of the fixes or prior reviews and claimed no second job.

## Work complete and blocker

The issue's three-packet review is already complete. Faltings and Adic are
accepted for the scoped fixes; Perfectoid has `needs_changes` for its broader
audit. The [report](../reviews/REV-FIX-RT-AREA-padic-2~4.md) preserves the
finding-by-finding review, source-reading records and previous successful
Lean checks, attributed to their original sessions. This continuation changes
only the report's current notice and this handoff.

After claim confirmation the issue still authorizes **seven outputs / three
packets**. The local and independently fetched current-main queues require
**27 outputs / thirteen packets**. Their ordered outputs agree and all exist.
The corresponding fix entry requires 46 outputs. Fresh execution of the
unmodified `issues.deliverables_complete` returns `True` for a scratch-only
copy restricted to the issued seven outputs, and `False` for each generated
review entry.

The ten extra packets already have accepted reviews under other job ids,
listed in the report's current notice. The predicate requires this review's
exact identifier on every packet. Perfectoid's existing `needs_changes`
already satisfies the completed-review condition. Neither that verdict nor
missing files cause the blocker. No permitted mathematical change can make
the expanded contract complete.

Freshly fetched `issues.py`, `intake.py` and `make_queue.py` match the checkout
byte for byte. `fix_rounds` still preserves an issued following round only
when neither newly missing files nor a preceding send-back is present (the
`made` assignment at line 2215 in this input). Fresh `intake.file_problems`
calls reject both `research/blueprint/queue.json` and
`research/blueprint/make_queue.py` as outside swarm output paths. WORKERS.md
also restricts edits to named deliverables. This worker cannot apply the
needed repair within this issue's authorized scope.

## Required maintainer repair before resuming

1. Restore the issued round-four fix and review contracts. The historical
   queue at `888f12f5c9d80d8205c6f7dd55cbbb933633b5e6` records the ten-output
   fix and seven-output review, including their dependencies. Preserve the
   completed mathematical review.
2. Preserve an already-issued following round in `fix_rounds` when newly
   missing files or a preceding send-back appear. The existing candidate
   retrieves `previous_jobs.get(following)` whenever `following in states`.
   The report retains isolated controls and two complete, write-free
   generator computations supporting this candidate. This continuation did
   not rerun them. A queue-only restoration would be expanded again during
   regeneration.
3. Verify both ordered output lists and dependency edges survive two
   regenerations; synchronize the issue and verify actual intake. Route newly
   required work to separately authorized jobs. If a larger review is wanted,
   issue an explicitly revised scope and prompt before assigning it.
4. Keep this issue unavailable until those contracts agree. Workers cannot
   change its labels or close it. Reassignment while the mismatch remains
   cannot advance the mathematical review.

## Checks and evidence preserved

Fresh `scripts/check_blueprint.py` checks against the manifest-matching pinned
index pass for all three packets: **Faltings 56, Perfectoid 326, Adic 537 nodes;
zero errors and zero warnings**. Pins: Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

These are structural/index checks, not fresh mathematical or primary-source
review. No packet, reader, suggested file, link map or restructuring proposal
changes. Lean was not rerun for documentation-only changes. Prior successful
elaborations remain evidence of their named sessions. No background process,
build or language server was started.

This is a **blocked checkpoint**. The durable repair evidence and reproducer
remain in the report; no scratch artifact is required to resume.
