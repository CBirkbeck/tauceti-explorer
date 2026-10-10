# Handoff: REV-FIX-RT-AREA-langlands-2~3

## Current checkpoint, 10 October 2026 — codex-bmdZE0

Issue #5871; bot confirmation
[6101257130](https://github.com/CBirkbeck/tauceti-explorer/issues/5871#issuecomment-6101257130),
claim comment 6101256015. Branch `codex-bmdZE0-review-langlands-scope`.
Started at `e760b5eb86b00b323b8e2d104317e3f0b1a60e98`, then rebased onto
`2698b0b8d` to retain the latest preceding continuation. Only this job was
successfully claimed. **Blocked checkpoint:** the mathematical review is
already complete, while queue scope repair exceeds this issue's deliverables.

Freshly confirmed seven live outputs versus 27 queue outputs, and forty parent
fix outputs, in both local and fetched-main metadata. All files exist. The
stock completion predicate returns False for the current entry and True for
the live scope or the original historical review entry. PR #6724's merge
queue at `ea48bbeeacfde53c5b93de227ad11d27e83cdafd` has the original ten/seven
lists, confirming the restoration source detailed below.

**Additional evidence:** the preceding completed-only guard still expands an
existing external worker's scope. A scratch-only test of the actual nested
`fix_rounds` helper compares stock, completed-only and all-existing guards.
Under either new inputs or an earlier send-back, the first two grow a recorded
external successor from three to five outputs; the all-existing guard retains
three. The results persist through two generations, with the second using
the first's outputs. With no existing successor, all three create a new round
including the new inputs. The report includes the complete reproducer.
This is not a full-generator test of the alternative; the previous full replay
applies only to its own guard and remains correctly attributed below.

**Maintainer next action:** restore the original two output lists, decide how
issued pending scopes are preserved, then run full regeneration twice and
inspect broader family changes before applying the global repair. Queue and
generator edits are neither issue-authorized nor ordinary intake paths.
Keep this job out of scheduling until reconciliation. No permission question
is pending; another unchanged mathematical review cannot clear the blocker.

Fresh pinned-index packet checks pass with zero errors/warnings (37/73/67
nodes). The existing table covers all forty confirmed findings exactly once.
CSM accepted, Global accepted and GL2 needs_changes remain unchanged, as do all
packet and Lean contents. Lean was not rerun for this documentation-only change;
the prior receipts remain attributed. Only this handoff and the report change.
No scratch artifact is needed to resume, and no second job was claimed.

---

Refs #5871. Codex session **codex-LPn2NR**, 10 October 2026.
Branch: `codex-LPn2NR-review-5871`. Input commit:
`0339ede22bf7a801e863028435d340d6ab2c0f03`.
Bot-confirmed [claim 6101125189](https://github.com/CBirkbeck/tauceti-explorer/issues/5871#issuecomment-6101125189).
This run claimed only this job.

**Blocked checkpoint: maintainers must reconcile issue/queue scope before
another continuation.** The scoped mathematical review is already complete:
CSM accepted, Global accepted, GL2 needs_changes. Their packet review objects,
statements and suggested files are unchanged. This run updates only the report
and this handoff, preserving all earlier mathematical evidence in the report.

## New evidence and concrete repair

The live issue authorizes seven files; its pending queue review lists 27.
Fresh calls to `issues.deliverables_complete` return false for the committed
entry and true for an in-memory copy with the issue's seven outputs. The done
parent fix lists forty outputs. All files exist; ten extra packet reviews
properly bear other jobs' markers. A negative verdict counts as review completion.

Independently checked PR #6724's ten-file diff and historical queue at merge
`ea48bbeeacfde53c5b93de227ad11d27e83cdafd`: the original parent fix has ten
outputs and its review seven. Restore only these two `outputs` fields; retain
other fields. The exact lists are encoded in the report's standalone replay.
The ten fix outputs are the round-three fix report plus packet/reader/Lean
triples for CSM R27.3, GL2 R22.1 and Global. The seven review outputs are the
review report plus those packets and Lean files.

The report specifies a completed-round guard for `make_queue.py::fix_rounds`
and includes standalone focused and full-generator regression code. A concrete
6,396-byte two-file patch was prepared in scratch, parsed, and passed
`git apply --check`; the restored queue entry satisfies completion. It was
not applied. Reconstruct it from the report; scratch is disposable.

All seven focused regression cases pass. The full generator is executed only
in memory, with writes blocked and the queue lock redirected to scratch.
With historical round three restored, the current guard produces fix/review
counts 29/17 for round two, 10/7 for round three, and 32/19 for round four;
the proposed guard gives 47/27, 10/7, and 47/27. Round four already exists and
is done. The restored round-three and existing round-four lists stay equal
across two repaired generations. Today's full replay does not reproduce an
expansion of round three; the focused case demonstrates the general defect.

The proposed guard changes 37 existing jobs and adds twenty fix/review jobs,
with no removals, in the comparison of full generations. Inspect that wider
routing and historical round scopes before publishing generated metadata.
Do not overwrite ten supplier reviews to satisfy this issue's stale output list.

## Authorization boundary and next action

[WORKERS.md](../WORKERS.md) requires “Edit only the files the issue names,
plus your own scratch space.” Queue/generator repairs are outside this issue's
paths. Scope clarification was requested; no authorization arrived before
submission. Both repair paths also fail the read-only `intake.file_problems`
allowlist check. No invalid submission or automatic approval rejection occurred.
The maintainer must apply/handle the repair, reconcile live issue scope and
run normal intake/sync. Repeating the unchanged mathematical review cannot
clear this metadata blocker. No queue, label, promotion or closure was changed.

## Mathematical work and checks preserved

The report retains all forty finding dispositions, prior source receipts,
corrections and their attribution. GL2's separate revision still owes the
53 typed API signatures and 46 tests enumerated there, plus promotion of used
API lemmas. Keep the Durham/prescribed-type and other supplier gaps honest.
The older CHT handoff is superseded: R23.1 has the two supplier nodes, with
reciprocity/S-unit/ray-class requests still open. The consumer-side corrections
were reviewed by earlier workers, not newly certified in this run.

Fresh packet checks: zero errors/warnings on all three packets (37, 73, 67
nodes), all 177 nodes unchecked, no excerpt fields, exactly forty confirmed
finding identifiers and forty unique report dispositions. The six packet/Lean
outputs are unchanged. Lean was not rerun; earlier successful receipts remain
attributed in the report. No process remains. No scratch artifact is required.
