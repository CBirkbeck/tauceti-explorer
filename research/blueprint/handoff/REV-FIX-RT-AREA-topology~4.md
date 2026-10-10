# REV-FIX-RT-AREA-topology~4 handoff

Issue #6521; Codex (GPT-6), session `codex-UkVFGL`; 10 October 2026.
Claim comment 6100455348 confirmed by bot comment 6100456483.
Branch `codex-UkVFGL-review-topology`; base `ab8350eab`.
Continues checkpoint PR #8533. This worker did none of the fix or the original
work under review. No second job was claimed.

## Done in this continuation

Read the live issue again after bot confirmation, WORKERS, both protocols,
the upstream guide, queue entry, predecessor handoff/report and fix material.
Verified the scope/completion mismatch directly using
`research/blueprint/issues.py:deliverables_complete`: actual queue entry
returns False; the same entry restricted to issue outputs returns True.
The queue prompt is absent. The three permitted supplier packets already
have this job's review identity and completed bounded verdicts. A negative
QSeries verdict is permitted by the completion predicate.

Fresh checks on those three packets pass with zero errors/warnings:
Polylogarithms 75 nodes, HabiroNahmSeries 109, QSeries 537.
Fresh source spot checks and current upstream ownership checks are recorded
in the report's new opening. The preceding report remains attributed prior
evidence, including all 27 findings and successful Lean elaboration checks.
No packet or Lean file changed; unchanged Lean checks were not repeated.

## Blocking scope mismatch

WORKERS.md says: “Edit only the files the issue names, plus your own scratch
space.” The live issue names this report, three base supplier packets and
three suggested files. Its queue entry additionally requires:

- research/blueprint/packets/ArithmeticQuantumTopology.json
- research/blueprint/suggested/ArithmeticQuantumTopology.lean
- research/blueprint/packets/Polylogarithms--P.2.json
- research/blueprint/suggested/Polylogarithms--P.2.lean

Authorization was requested during this run and has not arrived. Neither
queue/completion logic nor unauthorized paths were changed. This checkpoint
is caused by the scope blocker, not the time limit. Resolve the issue/queue
scope before assigning another repetition of the completed supplier checks.

## Resume after authorization

Finish the two additional bounded reviews: QT findings /1–/16 and P.2 /7.
Preserve earlier full reviews as history and retain QT's eight gaps/nineteen
requests and P.2's two gaps/three requests.

Add Polylogarithms:P.2/hyperbolic-volume to the prerequisites of
ArithmeticQuantumTopology:QT.5/volume-and-chern-simons; its statement imports
that exact supplier but its graph omits it. Retain G4/G5 and the geometric
comparison request. Transport the vertex order, orientation and incidence
signs together: P.2 normalizes (infinity,0,1,z); QT normalizes
(0,infinity,1,z). For a fixed ordered quadruple rQ = 1/rP and
D(1/z) = -D(z); swapping the first two vertices reverses signed volume.
Name the geometric carrier comparison and avoid introducing a second sign.

QSeries' reader requires separate authorization for four changes: the ninth
QM.5 additive-cocycle export, inverse eta multiplier on the lower branch,
Taylor scaling c_n/(24^n n!), and replacement of its obsolete no-nodes QT.7
account. Its first coefficients are 1, 23/24, 1681/1152, 257543/82944.
The trefoil qualification is already present. Keep broader objections intact.
A needs_changes verdict completes that bounded review without unauthorized
reader edits. No continuation needs scratch files.
