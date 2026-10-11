# REV-FIX-RT-AREA-padic-2~4: blocked by issued-scope mismatch

Refs #6519. Codex, session **codex-T4CCgc**, 11 October 2026.
Input commit: `0311207a4c7eb718bd7adaac0013c0c4a832e5a1`.
Branch: `codex-T4CCgc-review-6519`.
The bot confirmed [claim comment 6108093763](https://github.com/CBirkbeck/tauceti-explorer/issues/6519#issuecomment-6108093763)
in [comment 6108094958](https://github.com/CBirkbeck/tauceti-explorer/issues/6519#issuecomment-6108094958).
None of the manager's priority issues was available in the fetched queue.
This available `focus` review was selected under the fallback order. This
session did none of the fixes or earlier reviews and claimed no second job.

## Completed review and fresh evidence

The issued review already has its verdicts: Faltings and Adic accepted for the
scoped fixes; Perfectoid `needs_changes` for its unfinished broader audit.
The [review report](../reviews/REV-FIX-RT-AREA-padic-2~4.md) retains the original
finding-by-finding review, source and Lean attribution, and the self-contained
repair reproducer. This continuation changes no packet or suggested file.

After bot confirmation, the issue still authorizes **seven outputs / three
packets**. The local queue and independently fetched GitHub-main queue at
`772d9e5f9c5bc35afa5aba5078d7ac113ea52b12` require **31 outputs / fifteen
packets**. Their ordered output lists agree; all generated outputs exist.
Fresh calls to the unmodified `issues.deliverables_complete` give:

| Contract | Complete |
|---|---|
| Issue's seven outputs | `True` |
| Local generated queue | `False` |
| Current-main generated queue | `False` |

All twelve additional packets have accepted reviews under their own independent
review identifiers, listed in the report. The completion predicate demands this
job's exact reviewer identifier on every packet. Perfectoid's `needs_changes`
counts as a completed review and is not the blocker. Overwriting the other
reviewers' verdicts would misrepresent the scope of this review.

Current main still has the conditional `made` assignment in `fix_rounds`.
Fresh `intake.file_problems` checks reject both repair files as outside swarm
output paths. The issue excludes them and the twelve additional packets, and
WORKERS.md says to edit only named files. A permitted document or packet edit
cannot finish the generated job.

Fresh `scripts/check_blueprint.py` validation with the manifest-matching pinned
index passes for all three authorized packets: **56, 326 and 537 nodes; zero
errors and zero warnings**. Manifest pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.
Lean was not rerun because only documentation changes; earlier successful
elaborations remain attributed to their original reviewer. No fresh source
reading, mathematical verdict or generator experiment is claimed.

## Maintainer repair required before another continuation

1. Restore this round-four fix and review's ordered `outputs` and `after` lists
   from historical commit `888f12f5c9d80d8205c6f7dd55cbbb933633b5e6`: ten fix
   outputs and seven review outputs, matching the issued contract.
2. Preserve previously issued following rounds in `make_queue.py` even when
   new missing files or a preceding send-back are discovered. The existing
   report's tested candidate uses
   `previous_jobs.get(following) if following in states else None` for `made`.
   Its write-free experiments preserve scope and dependencies through two full
   computations and exercise eight isolated controls. Those earlier experiments
   were not rerun by this session. A queue-only restoration expands again under
   stock generation.
3. In authorized maintainer work, inspect unrelated generated changes, verify
   repeated regeneration preserves both contracts, synchronize the issue and
   verify actual intake. Route new receiving work to separate jobs. An intended
   larger review instead needs a revised issue and prompt before assignment.
4. Keep this issue unavailable until the contracts agree. Workers cannot change
   labels or close it. Reassigning the same completed review only repeats this
   administrative blocker.

All durable evidence and the repair reproducer are in the report; no scratch
artifact is needed. This is a **blocked checkpoint**, not completion of the
expanded fifteen-packet review.
