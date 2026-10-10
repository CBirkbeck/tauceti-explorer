# REV-FIX-RT-AREA-topology~4 handoff

Issue #6521; Codex session `codex-RtLe8Y`; 10 October 2026.
Claim confirmed for comment 6096384719. Branch
`codex-RtLe8Y-review-topology`.

## Completed work

All three reviews explicitly specified by the GitHub issue are finished,
including all 27 assigned findings and their verification/fix dispositions:

- Polylogarithms: accepted for /7's owner split and geometric prerequisites.
- HabiroNahmSeries: accepted for /11's formal/analytic distinction and qualified
  exports. The prior material reader objections were resolved by assembly.
  Corrected the GSWZ knot-matrix locator, approximate figure-eight regulator
  wording and suggested interface comments.
- QSeriesPartitionsAndMockModularForms: needs changes. Corrected the Poincaré
  locator and contradictory QT.7 restructuring detail. Reader exports and the
  generic matrix-cocycle request remain, together with the broad independent
  blueprint obligations.

All previous top-level verdicts were preserved in reviewHistory. The new
reviews use `independent-review-REV-FIX-RT-AREA-topology~4`, dated 2026-10-10.
The full report records every finding, public source URLs and PDF hashes,
current owner checks and the exact remaining contracts. Current
DifferentialGeometry already supplies forms/Stokes, abstract corner boundaries
and homogeneity: do not create another supplier for those old handoff items.

The three packet validators pass with zero errors/warnings. Sequential
`lean-check` runs at Mathlib 082e2d3 / Tau Ceti f790474 all returned exit 0:
462, 441 and 1469 warnings respectively, all for admitted proofs. Only comments
changed after the Habiro check. No declaration or test was added. No process
remains running; scratch logs are disposable because the results and source
receipts are recorded in the review.
The intake file checker reports zero problems for all six changed files;
`git diff --check` passes.

## Blocker: conflicting deliverable lists

This is a checkpoint only because the issue and the current queue disagree,
not because the specified mathematical review is unfinished or timed out.

The GitHub issue lists three packets and their suggested files, confirmed again
before submission. [WORKERS.md](../WORKERS.md) requires: "Edit only the files
the issue names, plus your own scratch space." The checked-in queue additionally lists
`packets/ArithmeticQuantumTopology.json`, `packets/Polylogarithms--P.2.json`,
and their suggested files; the queue's prompt file does not exist. The two
additional packets have other independent reviewers. `issues.deliverables_complete`
therefore returns false for the queue's eleven outputs, but true for the
issue's seven outputs. A scope clarification was requested; additional files
were not overwritten without it.

The maintainer should reconcile the issue and queue. If the issue's three-file
review is authoritative, correct the job metadata so the already completed
reviews count. If the expanded queue scope is intended, explicitly include the
two additional packet/Lean reviews in the issue, then resume those bounded fix
reviews; preserve their accepted blueprint histories and recheck only the
relevant /1–/16 consumer and /7 part contracts. The report already records the
current consumer interfaces read for the handoffs.

Reader follow-up: synchronize QSeries' eight-row table with its nine precise
exports and current QT.7 consumer; preserve the canonical scalar/matrix
distinction. Carry Habiro's small locator/numerical wording improvements at the
next authorized reader synchronization. Honest supplier gaps alone are not a
reason to reject an otherwise correct completed planning pass.

Only issue #6521 was claimed. This session stops after its one pull request.
