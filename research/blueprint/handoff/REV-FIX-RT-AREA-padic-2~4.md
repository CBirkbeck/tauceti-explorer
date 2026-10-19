# REV-FIX-RT-AREA-padic-2~4: blocked by issued-scope mismatch

Refs #6519. Codex, session **codex-ARcNcm**, 19 October 2026.
Checkout: `aa25a7628b6c4669d079914c1e80256680b0dee3`.
Independently fetched GitHub main: `55c7c50b621f89c1ab2a1d2680a8ad733df8b2c2`.
Branch: `codex-ARcNcm-padic-fix-review`.
The bot confirmed [claim comment 6262889248](https://github.com/CBirkbeck/tauceti-explorer/issues/6519#issuecomment-6262889248)
in [comment 6262892127](https://github.com/CBirkbeck/tauceti-explorer/issues/6519#issuecomment-6262892127).
This session wrote none of the fixes or prior reviews and claimed no second job.

## Work complete and blocker

The issue's three-packet review is already complete. Faltings and Adic are
accepted for the scoped fixes; Perfectoid has `needs_changes` for its broader
audit. The [report](../reviews/REV-FIX-RT-AREA-padic-2~4.md) preserves the
finding-by-finding review, source-reading records and previous successful
Lean checks, attributed to their original sessions. This continuation changes
only its current notice and this handoff. No new mathematical review or
source-reading claim is made.

After claim confirmation the issue still authorizes **seven outputs / three
packets**. Local and independently fetched current-main queues require
**27 outputs / thirteen packets**; their ordered output lists agree. Every
output exists. The corresponding generated fix requires 46 outputs.
The actual `issues.deliverables_complete` returns `True` for the issued
seven-output scope and `False` for the generated job. Each extra packet has
an accepted review by a different job. The exact reviewer-id condition is the
blocker; Perfectoid's existing `needs_changes` already counts as completed.

No permitted mathematical change can make this expanded contract complete.
The `made` assignment in `make_queue.py`'s `fix_rounds` still excludes
`missing` and `sent_back` cases. Actual `intake.file_problems` calls reject
`research/blueprint/queue.json` and `research/blueprint/make_queue.py`.
WORKERS.md and the live issue also restrict this worker's edits. The
out-of-scope repair remains unapplied.

## Concrete repair and fresh verification

1. Restore `outputs` and `after` for `FIX-RT-AREA-padic-2~4` and
   `REV-FIX-RT-AREA-padic-2~4` from the historical queue at
   `888f12f5c9d80d8205c6f7dd55cbbb933633b5e6`. It records the ten-output fix
   and seven-output review issued in the live issues.
2. In `fix_rounds`, preserve an existing following round whenever it is in
   `states`: retrieve `previous_jobs.get(following)` without the
   `not (missing or sent_back)` condition. This preserves both scope and
   dependency ordering while genuinely new rounds can receive new work.
3. Regenerate twice and compare both ordered output lists and dependency
   lists to the historical contracts; verify the actual completion predicate
   without replacing unrelated independent review objects. Synchronize the
   issue and verify actual intake under maintainer authorization.
4. Keep this issue unavailable until the contracts agree. Workers cannot
   change its labels or close it. Reassignment while the mismatch remains
   cannot advance the completed mathematical review.

The candidate and queue restoration were prepared in scratch, never applied.
Eight isolated stock/candidate controls independently reproduce scope and
dependency mutation when missing suppliers or a preceding send-back appears.
Two complete write-free candidate generations preserve both issued contracts
exactly and make the actual completion predicate return `True`. A control
with the stock generator expands the restored scope to **53 fix outputs /
31 review outputs** and returns `False`. The current report records the full
table. Its existing self-contained generator reproducer survives scratch
cleanup; do not depend on scratch scripts or the prepared patch.

The write-free harness rejects text/byte writes, suppresses directory creation,
uses `--dry-run`, and returns before locking and persistence. These checks do
not validate actual queue persistence, GitHub synchronization or intake.
Those require the authorized repair and remain the maintainer's next action.

## Packet validation and unchanged evidence

Fresh `scripts/check_blueprint.py` checks at the manifest-matching pinned
index pass: **Faltings 56, Perfectoid 326, Adic 537 nodes; zero errors and zero
warnings**. Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

These are structural/index checks. No packet, reader, suggested file, link map
or restructuring proposal changes. Lean was not rerun for documentation-only
edits. Prior successful elaborations and source audits retain their original
authorship. No build, language server or background process was started.

This is a **blocked checkpoint**. The report and this handoff contain all
resume evidence; no scratch artifact is required.
