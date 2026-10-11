# REV-FIX-RT-AREA-padic-2~4: blocked by issued-scope mismatch

Refs #6519. Codex, session **codex-1Xj2AU**, 11 October 2026.
Input commit: `1c06f95484a07926ea860dbcec1344dc75b9c275`.
Branch: `codex-1Xj2AU-review-padic-fixes`.
The bot confirmed [claim comment 6107810761](https://github.com/CBirkbeck/tauceti-explorer/issues/6519#issuecomment-6107810761)
in [comment 6107811830](https://github.com/CBirkbeck/tauceti-explorer/issues/6519#issuecomment-6107811830).
Only this job was claimed. None of the manager's priority issues was available.
There were no eligible available `top` jobs. This available `focus` review was selected
under the fallback order; this session did none of the fixes under review.

## Completed work and fresh checks

The issued review already has its three verdicts: Faltings and Adic accepted
for the scoped fixes; Perfectoid `needs_changes` for its unfinished broader
audit. The [review report](../reviews/REV-FIX-RT-AREA-padic-2~4.md) retains the
finding-by-finding review, source-reading attribution, successful Lean checks
and earlier scope-repair experiments. This continuation preserves those
verdicts and adds no mathematical or Lean changes.

The issue was fetched again after bot confirmation. Its permitted deliverables
are still **seven outputs / three packets**. A fresh GitHub-main queue at
`0f7835151f6904d17a957d657e57c9c313970ed6` has the same ordered output list as the local
queue: **31 outputs / fifteen packets**. All generated outputs exist. The
local and fetched generators retain the conditional `made` branch identified
in the repair experiment. Calling the unmodified local
`issues.deliverables_complete` against both queue entries gives:

| Scope | Completion result |
|---|---|
| Seven outputs explicitly authorized by issue #6519 | `True` |
| 31 outputs in the generated queue | `False` |

The three authorized packets already name this review job. The twelve
additional packets all have accepted verdicts by their own independent review
jobs; their reviewer identifiers differ from this job's identifier. The
completion function requires this job's exact identifier on every packet.
Perfectoid's `needs_changes` is a valid completed-review verdict and is not the
intake blocker. The report lists the twelve extra packets and their owners.

Fresh calls to `intake.file_problems` reject both `research/blueprint/queue.json`
and `research/blueprint/make_queue.py` as outside swarm output paths. The live
issue also excludes those files and the twelve additional packets. The repair
therefore needs separately authorized maintainer work.

All three packet validators pass with **zero errors and zero warnings**:
Faltings 56 nodes, Perfectoid 326, Adic 537. The declaration-index manifest
matches Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

Only this handoff and the report change. No fresh source reading, baseline
statement audit or mathematical verdict is claimed. Lean was not rerun for
these documentation changes; the earlier successful elaborations remain
attributed to their original reviewer in the report. No build or language
server was started.

## Required maintainer repair

1. Restore the round-four fix and review's ordered `outputs` and `after` lists
   from historical commit `888f12f5c9d80d8205c6f7dd55cbbb933633b5e6`: ten fix
   outputs and seven review outputs. This preserves the issued contract.
2. In `make_queue.py`'s `fix_rounds`, preserve a previously issued following
   round even when new missing files or a send-back are discovered. The
   previously tested candidate is
   `previous_jobs.get(following) if following in states else None` for `made`.
   The report's complete-generator experiment includes the exact candidate
   and a write-free reproducer. Earlier sessions tested two full computations
   and eight isolated controls; those experiments were not rerun here. A
   queue-only restoration was shown to expand again under stock generation.
3. Review unrelated generated changes and verify persistence, issue
   synchronization and actual intake in authorized maintainer work. Route new
   receiving work to separate jobs. An intentional expansion instead requires
   updating the live issue and its prompt before assigning the larger review.
4. Keep this issue unavailable until the issued and generated scopes agree.
   Reassigning the same completed three-packet review cannot repair intake.
   Workers must not change labels or close the issue themselves.

The report holds all durable evidence and the repair reproducer. Scratch files
are unnecessary for continuation. This is a **blocked checkpoint**, not a
claim that the expanded fifteen-packet review is finished. No second job was
claimed.
