# Review #6217: scope repair verified; maintainer decision required

Refs #6217. Job `REV-FIX-RT-AREA-iwasawa-1~2`.
Codex — **codex-IAcdd4**, 19 October 2026.
Input commit `474bd10b3e20d05f17fe2108bd67c895dec94385`.
[Bot confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/6217#issuecomment-6260906172)
confirms claim comment 6260904114. This session wrote none of the fixes
or their mathematical reviews. No second job was claimed.

**Blocked checkpoint, submitted as a draft for maintainer review.** The
issued assignment permits the HE.0 packet, its suggested file and this
report. That packet already carries this job's accepted, attributed
mathematical verdict. The checked-in queue requires thirteen packets and
27 outputs, so its completion predicate cannot finish this job from the
issued assignment. The narrow repair below is tested but unapplied.
No mathematical verdict, queue entry, packet or Lean file was changed.

[WORKERS.md](../WORKERS.md), “Doing the work”, requires:
“Edit only the files the issue names, plus your own scratch space.”
Repairing the mismatch requires `queue.json` and `make_queue.py`, neither
of which the issue permits. The normal intake path also rejects both.
Authorization for this concrete two-file repair and maintainer intake was
requested through the session clarification interface; no answer had
arrived when this checkpoint was prepared. This is a scope restriction,
not an automatic approval-review rejection.

A draft keeps this unresolved decision attached to an open submission.
It does not ask normal intake to merge another checkpoint and release the
same unchanged scope mismatch to a fresh worker.

## Accepted mathematics preserved

The packet's accepted review by **codex-kEnFR2**, dated 10 October, remains
unchanged. Its source-based findings and attribution are preserved in the
[accepted HE.0 review record](https://github.com/CBirkbeck/tauceti-explorer/blob/508e89592/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-1~2.md).
The current packet retains 78 nodes, 21 gaps, 63 requests and eight planned
stages, with implementation status unchecked.

| Finding | Existing accepted correction preserved |
| --- | --- |
| /2 | Exact-level raising is an imported supplier obligation, distinct from rational Jacquet–Langlands and integral transports. |
| /8 | Zhang's rank-zero input, period comparison and transfer imports retain their corrected hypotheses and explicit supplier requests. |
| /9 | General image theorems belong to the Faltings Part II; HE.7 keeps their applications and records the missing exports. |
| /10 | The generic self-dual descent engine belongs to the Euler-system roadmap; HE verifies its arithmetic hypotheses and applies it. |

This continuation read the published issue, current packet review, the
four findings and their verification, round-two fix report, previous
report and handoff. It did not repeat the primary-source mathematical
audit or assign verdicts to the twelve additional queue packets.

## Fresh checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/HeegnerPointEulerSystems--HE.0.json`:
  zero errors and warnings; 78 nodes, 24 API items, 18 tests and thirteen
  baseline declarations.
- `python3 -m unittest tests.test_redteam_queue tests.test_issues tests.test_followups`:
  59 tests, one skipped, no failures. Temporary files stayed in on-disk scratch.
- The actual `issues.deliverables_complete` returns **false** for the
  checked-in queue record and **true** for an in-memory copy restored to
  the published three outputs. Restoring the historical fix/review output
  arrays changes no state, verdict or other queue field.
- Both repair paths fail `intake.file_problems` as outside swarm output
  paths, and neither belongs to this job's `intake.own_files`.
- Five focused tests execute the actual nested `fix_rounds` function:
  new blueprints preserve pending, external and running round scopes;
  newly ready work after a finished round gets a separate round and an
  independent review; a revision retains its rejected-review dependency;
  a newly created round still receives all missing blueprints; and the
  current selector reproduces the unwanted scope expansion. All pass.
- Lean was not rerun because no Lean or mathematical statement changed.
  The attributed mathematical review records exit 0 with 114 admission
  warnings; that is historical evidence, not a new compilation claim.

## Full generator replay and regeneration stability

The read-only replay runs the real generator against the input tree.
Only the two historical output arrays from `88f9bcd44` are restored in
memory. The candidate changes the following-round selector to
`made = previous_jobs.get(following)`. Repository writes are prohibited;
queue reads, lock creation and dry-run results are redirected in memory
or to scratch. No generated queue or prompt was installed.

| Selector | Generated jobs | Fix-round-two outputs | Review-round-two outputs |
| --- | ---: | ---: | ---: |
| Current | 6,427 | 34 | 19 |
| Candidate | 6,451 | 4 | 3 |
| Candidate, regenerated from its own result | 6,451 | 4 | 3 |

The first candidate replay preserves 50 issued assignments: only their
output arrays differ from the current-selector replay, and each candidate
array equals its input array. It adds twelve fix/review pairs, removes
none, and gives each new review the correct fix dependency and independence
requirement. Iwasawa round three receives all the newly routed work that
the current selector would instead have added to round two.

**New stability check:** feeding the candidate result back into the real
generator produces exactly the same job IDs. Every fix/review retains its
outputs, dependencies and independence requirements. This tests that a
subsequent queue refresh does not undo the repair or create further rounds
for the same work. These checks validate routing behavior, not the newly
assigned mathematics.

## Resume at the scope decision

The [handoff](../handoff/REV-FIX-RT-AREA-iwasawa-1~2.md) preserves the exact
unapplied two-file patch, a complete read-only generator reproducer with
the second-generation check, and the five focused behavioral tests.

The maintainer must authorize and apply/review the narrow repair through
maintainer intake, or publish an explicitly expanded mathematical
assignment. Do not install the whole regenerated queue, give verdicts to
unreviewed packets, or repeat the accepted HE.0 source audit to satisfy
the expanded queue. Resolve the scope decision before another continuation.
