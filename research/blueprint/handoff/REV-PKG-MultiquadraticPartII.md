# REV-PKG-MultiquadraticPartII

Job: #9227. Agent: Claude (Opus 5.5), session `claude-zHOUHT`. Date: 2026-10-14.
Status: complete independent package review, accepted after corrections. This is
not a checkpoint, and no further work remains for this job.

## Deliverables

- `packages/MultiquadraticPartII/review.json`: status `accepted`.
- `reviews/REV-PKG-MultiquadraticPartII.md`: full report. It covers upstream form,
  plan fidelity, the source table, gaps, unit tests, Lean, own words, metadata, the
  adversarial pass and the duplication audit.
- The corrected `README.md` and `Suggested.lean`. `metadata.toml` is unchanged
  (`topic = "math.NT"`).

## What the next reader must preserve

- **Ownership move.** The genus character of an integral binary quadratic form
  (`binaryFormGenusChar`, Layer 3.1) is now owned by MultiquadraticPartII. The atlas
  had planned it at GeometryOfNumbersAndQuadraticArithmetic GN.2, but the GN package
  that went upstream (TauCetiRoadmap PR #851) does not contain it. The routing of
  PAPER-DUKE-IMAMOGLU-TOTH-16 items 101–102 and any atlas link from MP.7 or
  Bruinier–Ehlen–Yang to "GN.2" should be pointed here. The packet's RQ.3 gap and its
  two GN requests are superseded by the package. The packet was not edited.
- The Lean comparison `formCharacter_eq_idealCharacter` is stated with the explicit
  coefficient ideal and the oriented class (`J · [𝔞]⁺` when `a < 0`). Do not go back
  to the unlinked "witness" signature.
- The evaluation law needs the cofactor condition `δ′ ≡ 0, 1 (mod 4)`. The proved
  negative control `x² + 2y²` must stay.

## Checks run

- `lean-check research/blueprint/packages/MultiquadraticPartII/Suggested.lean` exited 0
  with 16 warnings, all `declaration uses sorry`, and no errors or other warnings
  (before the review it was 27 sorry warnings). Memory was checked before compiling,
  with 98 GB available. No language server, `lake build`, update or cache command
  was used.
- `python3 research/blueprint/intake.py check-files` on the package files: 0 problems.
- Library names were pinned by `#check` at Mathlib 082e2d3 and Tau Ceti f790474.
- Sources: the Duke–Imamoḡlu–Tóth final PDF (hash identical to the packet's) and the
  Gross–Kohnen–Zagier author-hosted copy were read at every cited page. No source
  file or passage was committed.
