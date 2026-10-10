# REV-FIX-RT-AREA-topology~4 handoff

Issue #6521; Codex session `codex-qDDgyD`; 10 October 2026.
Claim confirmed for claim comment 6098095721.
Branch `codex-qDDgyD-review-topology`; atlas base
`eb32c2d3450f60e02c9a82733aa7e25339e2eb99`.
This continues PR #8425, following PR #8414, #8353 and #6944.
This session did none of the reviewed fix, red team, verification,
blueprints or assemblies.

## Completed authorized review

The report accounts for all 27 assigned findings. Fresh source reading,
pinned declaration checks and independent exact computations confirm /7's
single-owner tetrahedron-volume contract and /11's qualified formal/analytic
exports. Polylogarithms and HabiroNahmSeries are accepted for this fix round.
QSeriesPartitionsAndMockModularForms needs changes in its reader; this is a
completed review verdict. Broader independent blueprint objections remain
binding. Historical reviews are preserved.

Two QSeries prose corrections were made: the generator API now states
`ε(1)=1`, matching the existing Lean condition; and the Kontsevich hypothesis
now names the inverse eta multiplier for the lower-boundary convention,
removing the ambiguous “conjugate-inverse” wording. No suggested declaration
changed. Independent rational expansion gives the normalized coefficients
`1, 23/24, 1681/1152, 257543/82944`. Exact quadratic-field algebra confirms
`δ=1-2z`, `δ²=-3` and norm 3 for the figure-eight formal datum.

The QSeries reader still needs these four corrections:

- Add the ninth export row, the normalized scalar additive period cocycle.
- Specify the inverse eta multiplier with the lower-boundary convention.
- Distinguish the scaled Glaisher numbers `c_n` from the actual Taylor
  coefficients `c_n/(24^n n!)`, in both the theorem account and acceptance test.
- Replace the restructuring paragraph calling QT.7 unwritten with its
  current accepted knot-specific plan and the QM.5 → QT.7 supplier direction.

The trefoil row already qualifies its knot normalization comparison. Carry
Habiro's small source-locator and approximate-numeric wording improvements in
any later authorized reader synchronization. Readers are outside this issue's
and the queue's deliverables; none was edited.

All three packet validators pass with zero errors/warnings. Fresh sequential
`lean-check` runs returned exit 0, with 462, 441 and 1469 warnings, all admitted
proofs. The shared Mathlib build matches the pin and three Tau Ceti files
match `git show f790474` byte for byte. Source hashes and precise locators are
in the report. Scratch contains only disposable downloaded public PDFs,
calculations and logs; no handoff depends on those files.

## Current upstream

Current TauCetiRoadmap main:
`670582c502e1d4497d9ccd492b36c67028ef6666`; current Tau Ceti:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Read the complete AlgebraicTopology and Completed/UniversalCovers READMEs,
with relevant DifferentialGeometry/GeometricTopology targets and actual
signatures separately. No Lake command was run there.

AlgebraicTopology's Suggested.lean lines 341–343 accepts an arbitrary
BasedTopPair for relative homotopy, while Stage 8.1 prose still restricts to
NDR/cofibration pairs. The suggested carrier remains an admitted plan.
DifferentialGeometry owns abstract corner boundaries, homogeneity and
forms/Stokes. The current library implements the Riemannian measure and its
measure-preserving isometry interface. These are imported owners, not new
atlas targets. All eleven upstream findings remain maintainer notes.

## Exact scope reconciliation

The GitHub issue explicitly lists the three supplier packets, their three
suggested files and the review report. WORKERS.md says:
“Edit only the files the issue names, plus your own scratch space.”
The queue also requires these four paths:

- `research/blueprint/packets/ArithmeticQuantumTopology.json`
- `research/blueprint/suggested/ArithmeticQuantumTopology.lean`
- `research/blueprint/packets/Polylogarithms--P.2.json`
- `research/blueprint/suggested/Polylogarithms--P.2.lean`

The queue prompt is absent. The queue completion predicate requires this job's
reviewer on all five packets, while the extra pair retains accepted full
blueprint reviews with different reviewer identities. The issue's seven-output
completion test passes; the queue's eleven-output test fails. Do not change
queue/intake metadata merely to bypass that check.

Concrete proposed continuation, pending explicit authorization: independently
review QT's /1–/16 corrected owner and supplier contracts and the P.2 part's
/7 Milnor-angle volume route, preserve both accepted full-blueprint reviews in
history, and write bounded fix-review verdicts identifying this job. Preserve
QT's eight gaps/nineteen requests and P.2's region/calibration gaps; do not
promote a planned stage to closed. Validate both packets and run sequential
`lean-check` on the two suggested files, fixing only errors relevant to these
contracts if any. Reader editing is not part of this proposal.

The authorized review is complete. This session requested explicit scope
authorization after preparing its review and proposal; no answer arrived
before submission. A fresh issue read still names only the seven original
paths. The checkpoint is blocked by the conflicting scope, not the run time.
Completion of the queue job awaits that reconciliation. Intake file checks
and `git diff --check` pass. Only #6521 was claimed. Stop after this run's single PR.
