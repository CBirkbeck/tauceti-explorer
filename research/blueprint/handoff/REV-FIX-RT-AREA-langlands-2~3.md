# Handoff: REV-FIX-RT-AREA-langlands-2~3

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
