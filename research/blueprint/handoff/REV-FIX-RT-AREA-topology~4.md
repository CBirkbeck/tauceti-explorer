# REV-FIX-RT-AREA-topology~4 handoff

Issue #6521; Codex (GPT-6), session `codex-In9gJI`; 10 October 2026.
Claim comment 6099886919 confirmed by bot comment 6099888178.
Branch `codex-In9gJI-review-topology`; base `0d2178b78`. Continues PR #8494.
This worker did none of the reviewed fix, original blueprints, red team or
verification. Only this job was claimed.

## Completed work

The three issue-listed bounded supplier reviews are complete: Polylogarithms
accepted, HabiroNahmSeries accepted, QSeriesPartitionsAndMockModularForms
needs_changes. All 27 findings have dispositions in the report. Prior full
reviews remain in history; this run does not discharge unrelated blueprint
objections. No statements, proof outlines, hypotheses, APIs, tests, planets,
coverage, gaps, requests or Lean declarations changed.

Added one Zagier author-hosted source and one support entry to
Polylogarithms:P.2/hyperbolic-volume: I.3 (5), p. 11, I.4 (7)–(9), pp. 13–14,
for the ordered cross-ratio, tetrahedron sign and manifold sum. Source URLs,
PDF hashes and fresh bounded reads are in the report. Prior Milnor/Goncharov
readings remain prior evidence, not fresh reads in this run.

Fresh packet checks pass with zero errors/warnings for all five inspected
packets; three issue-listed packets have 75/109/537 nodes. Fresh sequential
lean-check runs of their suggested files completed with only sorry warnings
(462/441/1469). Those files remain unchanged. Exact supplier/API/test contracts
were inspected; no claim of formalised proofs is made.

Read pinned Mathlib/Tau Ceti declarations and current upstream main
3c18d9fbfceed0dc5c1edb1070a3927152d19e28. Existing manifold forms/Stokes,
abstract corner boundaries and homogeneity stay with DifferentialGeometry.
No upstream files were edited and no Lake command ran there.

## Blocking scope mismatch

WORKERS.md says: “Edit only the files the issue names, plus your own scratch
space.” The issue names only the report, three base supplier packets and
three suggested files. Queue outputs additionally require:

- research/blueprint/packets/ArithmeticQuantumTopology.json
- research/blueprint/suggested/ArithmeticQuantumTopology.lean
- research/blueprint/packets/Polylogarithms--P.2.json
- research/blueprint/suggested/Polylogarithms--P.2.lean

The queue prompt is absent. issues.py:deliverables_complete requires this
reviewer's identity on all five packet outputs. The issue predicate passes;
the queue predicate fails. Scope authorization was requested during this run
and has not arrived. This is a checkpoint blocked on scope, not the time limit
or incomplete listed-supplier checks. Do not alter queue/completion logic to
make the job appear complete. Align the issue with the queue or authorize
those four paths before another audit.

## Concrete continuation after authorization

Finish bounded QT /1–/16 and P.2 /7 reviews, preserving prior full reviews in
history. Keep QT's eight gaps/nineteen requests and P.2's two gaps/three requests.

Add Polylogarithms:P.2/hyperbolic-volume to the prerequisites of
ArithmeticQuantumTopology:QT.5/volume-and-chern-simons. Its statement imports
that identity but its graph omits it. Keep G4/G5 and the geometric request.

Document vertex-order/orientation conversion: P.2 normalizes
(infinity,0,1,z) to z; QT normalizes (0,infinity,1,z) to z. For the same ordered
quadruple the raw cross-ratios are reciprocal; D(1/z)=-D(z), and swapping the
first two vertices reverses ordered volume. Neither convention is thereby
proved wrong; the import must translate them.

The QSeries reader separately needs the ninth additive-cocycle export near
2964, inverse eta multiplier near 2972, Taylor scaling c_n/(24^n n!) near
2818/2987, and replacement of the obsolete no-nodes QT.7 account near
4166–4168. Its first four Taylor coefficients are 1, 23/24, 1681/1152,
257543/82944. Reader edits are outside both issue and queue deliverables.
The trefoil qualification is already present. Preserve broader objections.

The report records all fresh evidence and inherited dispositions. No next
worker needs scratch files. This run stops after one pull request.
