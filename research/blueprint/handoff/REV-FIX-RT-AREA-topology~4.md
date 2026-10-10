# REV-FIX-RT-AREA-topology~4 handoff

Issue #6521; Codex session `codex-ERbW4d`; 10 October 2026.
Claim confirmed for comment 6097693458. Branch
`codex-ERbW4d-review-topology`. This continues PR #8353 and PR #6944;
this session did none of the reviewed fix, red team, verification or blueprints.

## Completed work

All three packet reviews explicitly specified by the GitHub issue are complete.
The report accounts for all 27 assigned findings and their fix/verification
dispositions, with independent source and current-owner checks:

- Polylogarithms: accepted for /7's signed ideal-tetrahedron formula, explicit
  geometric prerequisites and separation from QT.5's manifold sum.
- HabiroNahmSeries: accepted for /11's formal/analytic distinction and qualified
  exports, including the controlling Gaussian and membership refinements.
  Confirmed PR #8353's source-locator and approximate regulator corrections.
- QSeriesPartitionsAndMockModularForms: needs changes. The nine scalar contracts
  are correct. Corrected the coverage note's undecided matrix-interface owner
  to agree with the consumer's existing QSeries Part II route. The assigned
  open supplier gap alone does not invalidate the scalar fix.

The inherited reader objections were sharpened against the current document:
add the scalar-cocycle row, specify the inverse eta multiplier, state scaled
Kontsevich coefficients as `c_n/(24^n n!)`, and update the restructuring paragraph
which says QT.7 has no nodes. Its trefoil row already requires the normalization
comparison; the inherited claim that this qualification is missing was withdrawn.
The exact first four normalized Taylor coefficients are
`1, 23/24, 1681/1152, 257543/82944`.
Earlier broad QSeries blueprint rejections remain binding.

Replaced the three top-level reviews with this independent continuation and
preserved their previous objects in `reviewHistory`. No suggested declaration
changed. The three validators pass with zero errors/warnings. Fresh sequential
`lean-check` runs return exit 0, with 462, 441 and 1469 warnings respectively,
all `sorry`. The shared Mathlib pin was confirmed, and the cited Tau Ceti
framing/Gaussian source files match raw f790474 files byte for byte.
The intake file check and `git diff --check` pass. No process remains running;
scratch logs and public PDFs are disposable because the report records the
checks, sources and receipts.

Current TauCetiRoadmap was read at `39200cfdcc19dbfeb09ffa3154f721eb56977e92`.
DifferentialGeometry already owns forms/Stokes, abstract corner boundaries and
homogeneity. The current library already supplies Riemannian volume and its
isometry interface. Import those owners rather than planning them again.

## Blocker: conflicting deliverable lists

The GitHub issue and its full review instructions name only the three packets
above, their suggested files and the report. [WORKERS.md](../WORKERS.md) requires:
"Edit only the files the issue names, plus your own scratch space."
The checked-in queue additionally requires ArithmeticQuantumTopology and
Polylogarithms--P.2 packets and suggested files; its prompt file is absent.
Those packets' top-level reviewers are still their own independent blueprint
reviewers. `issues.deliverables_complete` therefore returns false for the
queue's eleven outputs, and true for the issue's seven outputs.

This session requested authorization to include the two additional bounded
fix reviews before doing the independent checks. No authorization arrived.
Neither additional packet was edited, and no queue or issue metadata was changed.
The completion blocker is a writable-scope conflict, not an unfinished review
of the three authorized packets or a timeout.

The maintainer must reconcile the lists: either remove the extra pair from the
completion metadata, or explicitly authorize their bounded reviews in this job.
For the latter, inspect QT's /1–/16 contracts against the confirmed findings and
current supplier requests, and P.2's /7 volume route. Preserve the existing
accepted full-blueprint reviews in history; replacing them must identify the
new review as a bounded fix review. Keep QT's eight honest gaps and P.2's ideal
region/calibration gaps. An open contract with a precise owner is not itself
evidence of an incorrect fix. Run both packet validators and `lean-check` on
the two additional suggested files before recording those verdicts.

Reader synchronization requires a separately authorized path: this issue's
deliverable list excludes reader documents. Carry Habiro's prior minor
locator/numerical wording improvements at that synchronization as well.

Only issue #6521 was claimed. This session stops after its one pull request.
