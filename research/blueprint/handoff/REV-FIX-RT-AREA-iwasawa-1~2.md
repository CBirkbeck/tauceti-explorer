# Handoff: #6217 needs a scheduling scope decision

Refs #6217. Job `REV-FIX-RT-AREA-iwasawa-1~2`.
Codex — **codex-O9Ld0I**, 19 October 2026.
Branch: `codex-O9Ld0I-review-iwasawa-fixes`.
Input: `76759b9a5dfee0c94b309d597c4515bc9a0bdd65`.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/6217#issuecomment-6257699351).
Submission: **blocked checkpoint**. No second job was claimed.

## Completed in this run

The HE.0 fixes already have an accepted independent review. Their verdict,
mathematics, Lean signatures and source receipts remain unchanged and
attributed to the original reviewers. No new source audit is claimed.

The issue still assigns one packet and three outputs. The local and fresh
live-main queues agree on ten packets and 21 review outputs. The actual
completion function returns false for that queue entry and true when given
only the three issued outputs. The associated fix record has expanded to
35 outputs; older counts in earlier handoffs are superseded.

New evidence beyond previous checkpoints:

- A **full generator replay**, with actual input discovery and templates,
  confirms that restoring the historical four/three arrays alone is undone.
  The one-line selector repair preserves their exact contents and generates
  a distinct next round. All writes were intercepted; the repository queue,
  prompts and generator were never changed.
- Measured wider effects: 48 existing generated records change and 22 jobs
  are added, with none removed, relative to the unmodified-selector replay.
  These effects need maintainer review before a general generator change.
- Existing queue/issue/follow-up tests against the candidate module:
  59 run, one skipped, no failures.
- Fresh HE.0 packet validation: zero errors and warnings; 78 nodes,
  24 API items, 18 tests, 13 baseline declarations, 21 gaps, 63 requests and
  eight planned stages. Source-issue/schema-version functions also pass.
- Fresh `lean-check`: exit 0; 114 warnings, all admission warnings. Memory
  availability was checked first. No implementation claim is made.

## Resume here after a scope decision

The [review report](../reviews/REV-FIX-RT-AREA-iwasawa-1~2.md) gives the exact
repair, historical provenance, full-replay method, measurements and limits:

1. Restore **only** the `outputs` arrays for the fix and review round two
   from queue commit `88f9bcd44` (four and three paths respectively).
2. In `make_queue.py`'s `fix_rounds`, select an existing next round using
   `made = previous_jobs.get(following)`. Review the wider effects; do not
   replace the whole queue with either experimental regeneration.
3. Reconcile and publish any newly generated rounds as distinct assignments.

Alternatively publish an expanded review scope identifying the additional
fixes to examine. The existing accepted markers on other packets are not
this job's verdicts. Do not repeat the completed HE.0 mathematical review
merely to reproduce the scheduling failure.

WORKERS.md restricts edits to issue-named files and scratch. Queue and
generator are not issue deliverables and are also outside intake's swarm
output paths. A user scope question was sent, but no answer authorizing the
repair had arrived at checkpoint preparation. This is a scope restriction,
not an automatic approval-review rejection. Only this handoff and the
review report change. No primary source passages or private paths are
recorded. Scratch files are disposable; no process is left running.
