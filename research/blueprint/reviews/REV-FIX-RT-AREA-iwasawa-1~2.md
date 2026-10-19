# Review #6217: issued scope and queue still disagree

Refs #6217. Job `REV-FIX-RT-AREA-iwasawa-1~2`.
Codex — **codex-NvosJ5**, 19 October 2026.
Input commit `9efd39b7c7a372a1aae5b57765d15a1120ce2071`.
[Bot confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/6217#issuecomment-6260047584)
identifies this session's claim comment 6260045962. This session did not
write the fixes or their earlier mathematical reviews.

**Blocked checkpoint.** The issue permits the HE.0 packet, its suggested
file and this report. That packet already has this job's accepted,
attributed mathematical verdict. The checked-in queue requires thirteen
packets and 27 outputs. Its completion predicate therefore cannot finish
this job from the issued assignment. No new mathematical verdict is
claimed, and no queue state, review, packet or Lean file was changed.

[WORKERS.md](../WORKERS.md), “Doing the work”, explicitly requires:
“Edit only the files the issue names, plus your own scratch space.”
The concrete repair changes `queue.json` and `make_queue.py`, neither of
which the issue permits. Both also fail intake's output-path gate.
Authorization to apply the already specified repair was requested through
the session clarification interface; no answer had arrived when this
checkpoint was prepared. This is an unresolved scope restriction, not an
automatic approval-review rejection.

## Mathematical work preserved

The current packet's accepted review of findings /2, /8, /9 and /10 is
unchanged. Those concern level raising, Zhang's transfer/period and
rank-zero inputs, open-image ownership, and Howard's self-dual theory.
It retains 78 nodes, 21 gaps, 63 requests and eight planned stages;
implementation status remains unchecked. No verdict is assigned to the
other twelve packets in the queue.

The [source-based review](https://github.com/CBirkbeck/tauceti-explorer/blob/508e89592/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-1~2.md)
and [previous checkpoint](https://github.com/CBirkbeck/tauceti-explorer/blob/2432b6dd277d7824449e26d8e7815aaef5ac2cb4/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-1~2.md)
retain the earlier evidence and attribution. This continuation read the
issue, confirmed findings /2, /8, /9 and /10 and their verification,
round-two fix report, current packet's verdict and earlier handoff. It did
not repeat the primary-source mathematical audit.

## Fresh checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/HeegnerPointEulerSystems--HE.0.json`:
  zero errors and warnings; 78 nodes, 24 API items, 18 tests,
  thirteen baseline declarations and eight planned stages.
- `TMPDIR=<scratch> python3 -m unittest tests.test_redteam_queue tests.test_issues tests.test_followups`:
  59 tests, one skipped, no failures. Temporary directories stayed in scratch.
- The real `issues.deliverables_complete` returns **false** for the current
  queue record and **true** for an in-memory copy restored to the published
  three outputs. Only the issued fix and review output arrays are restored;
  every other queue field is asserted unchanged.
- The repair's two paths fail `intake.file_problems` as outside swarm
  output paths, and neither belongs to this review's `intake.own_files`.
- Four additional scratch checks execute the actual `fix_rounds` function
  extracted from the generator: a new blueprint goes to a new round;
  an already issued pending round keeps its output list; a round issued
  after a rejection keeps its review dependency; and a newly created
  round still receives missing blueprints. All four pass. The first
  reproduces the expansion with the current selector.
- Lean was not rerun: no mathematical or Lean statement changed. The
  attributed previous review records successful elaboration with 114
  admission warnings; that remains historical evidence only.

## Full generator replay

Both replays ran the actual generator against the input tree, restoring
only the two historical output arrays in memory from `88f9bcd44`.
The candidate replaces the following-round selector with
`made = previous_jobs.get(following)`. Repository writes were prohibited,
queue reads intercepted, directory creation suppressed, and the queue
lock redirected to scratch. The actual dry-run return exposed its merged
jobs and prompts for assertions. Nothing generated was installed.

| Selector | Generated jobs | Fix-round-two outputs | Review-round-two outputs |
| --- | ---: | ---: | ---: |
| Current | 6,360 | 34 | 19 |
| Candidate | 6,384 | 4 | 3 |

Compared with the current-selector replay, the candidate preserves 50
existing assignments: only their output arrays differ, and every candidate
array equals its input array. It adds 24 jobs and removes none. Each added
review depends on its fix and names that fix under `independentOf`.
The new Iwasawa round three follows the completed round-two fix and
receives every newly routed output that the current selector instead
added to round two; the old report is replaced by the round-three report.

This last assertion compares the **freshly routed** outputs from the two
replays, rather than the already stale expanded queue arrays: the current
routing also reconciles assembled documents and their source parts.
It does not certify that the newly assigned mathematics is correct.

The twelve fix/review pairs are automorphic-1 round 7; combinatorics,
etale, geomlanglands, iwasawa-1, ktheory-1 and ktheory-2 round 3;
iwasawa-3 round 5; langlands-1 round 3; langlands-2 round 5; padic-1 and
padic-2 round 5. These twelve pairs and all 50 preserved assignments agree with the
previous checkpoint. The larger generated-job totals reflect newer inputs;
no additional review verdict was assigned by this continuation.

## Resume condition

The [handoff](../handoff/REV-FIX-RT-AREA-iwasawa-1~2.md) retains the exact
unapplied patch and a standalone read-only reproducer. The maintainer must
authorize and apply/review the narrow repair through maintainer intake,
or replace the published issue with an explicit expanded mathematical
assignment. Reconcile the issue and queue after that decision.
Do not install the whole regenerated queue or repeat the accepted HE.0
review to try to satisfy unrelated packet requirements. The next worker
should begin with the scope decision, rather than another mathematical
audit. The packet and Lean file were not changed in this continuation.
