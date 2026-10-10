# Handoff: #6217 blocked checkpoint; completion repair verified

Codex — **codex-gp4K8h**, 10 October 2026.
Branch: `codex-gp4K8h-review-6217`. Input commit: `24b730041bcdca9936c22add6fd444b4f0354b90`.
Claim confirmed in [comment 6100250146](https://github.com/CBirkbeck/tauceti-explorer/issues/6217#issuecomment-6100250146).
**Blocked checkpoint.** This session claimed only #6217.

The HE.0 fix review is already accepted. Its packet and suggested file are
unchanged. Completion remains false because the issue authorizes one packet
and three review outputs, while the queue requires eleven packets and 23
outputs. Ten additional packets retain their own jobs' reviewer markers.

## Ready repair

The [review report](../reviews/REV-FIX-RT-AREA-iwasawa-1~2.md) contains the exact
Python guard, historical four/three output lists and two self-contained
regression scripts. Apply the guard to `make_queue.py::fix_rounds` and restore
only `outputs` of `FIX-RT-AREA-iwasawa-1~2` and
`REV-FIX-RT-AREA-iwasawa-1~2` from commit `88f9bcd44` (PR #6753).
The canonical GitHub merge commit
`05036608ddb23c6603c1d2721487d87027616106` records the same historical lists,
and the live PR #6753 file list confirms its four-file fix scope.
Preserve states and all other fields. Applying the guard alone would retain
the already incorrect historical scope.

This session prepared the minimal 5,821-byte repair and verified it without
changing those repository files. All seven focused regression cases pass.
Two full generator replays preserve round two's four/three lists and route
new work to round three's thirty/seventeen lists. The generated comparison
changes 36 existing jobs, adds twenty and removes none, in memory only.
No prompts, queue generation, issue synchronization or promotion was run.
The real completion predicate returns true after only the output restoration.

## Resume

Explicit authorization for these two paths and a maintainer-handled PR was
requested during this run and has not been received. WORKERS.md restricts worker edits
to issue-named paths; local `intake.file_problems` also rejects generator and
queue paths. Do not modify intake or replace other packets' reviewer markers.
The maintainer should apply the repair, inspect subsequent routing and
publish matching instructions for new rounds. All repair instructions are
in the report, so no scratch artifact is needed to resume.

Fresh HE.0 validation: zero errors and warnings, 78 nodes, 24 API items,
eighteen tests, 21 gaps and 63 requests. This session's pinned `lean-check`
exits 0 with 114 warnings, all admissions, and no errors. Suggested SHA-256:
`9e4fa52693e51e06ea4f6147f430ddf021a845d22b892bec0e8524f478dc546b`.
No new mathematical or source-reading verdict is claimed. No Lean process
remains. Delete scratch after the PR opens.
