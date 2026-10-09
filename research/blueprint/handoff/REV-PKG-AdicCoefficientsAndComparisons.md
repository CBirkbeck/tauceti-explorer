# REV-PKG-AdicCoefficientsAndComparisons handoff

Completed by Codex, session codex-sBLyQP, on 2026-10-09 for issue #7502.
The bot confirmed this session's claim; only this issue was claimed.
Branch: `codex-sBLyQP-review-adic-coefficients`.

## Result

All six package review requirements pass. The verdict is `accepted` in
`research/blueprint/packages/AdicCoefficientsAndComparisons/review.json`.
The independent report is
`research/blueprint/reviews/REV-PKG-AdicCoefficientsAndComparisons.md`.
No work remains for this review.

The full accepted plan and package were read. All 46 targets, 80 API items and
57 tests are retained. The README's form was compared with the upstream AdicSpaces
and AnalyticToricGeometry roadmaps, and its boundaries with the accepted packet,
library audit and relevant AdicSpaces links. The 22 baseline statements were read
at the protocol pins. The report gives the public source URLs, hashes and access
date; relevant passages were read in those versions. Huber's book is not cleared
and was not accessed. Imported Huber results were checked as supplier contracts.

## Changes

- Named the pullback and proper-support scalar-change transformations, and made
  `AdicSix.reduce` require their invertibility and that of their specified mates.
- Named the adic and scheme proper-support base-change transformations, and made
  the theorems require those maps to be isomorphisms. Updated the introductory
  support-base-change wrapper to derive its isomorphism from the named map.
- Explained these forms and the limits of other representative signatures in the
  README. Added missing page locators for Bhatt–Scholze, Česnavičius and de Jong;
  replaced an unlocated bibliography pointer with the analytic supplier layers
  and ECD comparison loci. The mathematical targets and metadata are unchanged.
- Added the independent review, verdict file and this handoff.

## Checks

`lean-check research/blueprint/packages/AdicCoefficientsAndComparisons/Suggested.lean`
exits 0: 423 declaration-uses-`sorry` warnings, no other diagnostics. Available
memory exceeded 20 GB before each sequential run. No language server or library
build was started.

The helper uses Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Its Tau Ceti
checkout is newer (`cf386627e9176a3827c1a5fe804989fd94a4d216`), but the sole imported
Tau Ceti module, `TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic`, is identical to
`f790474821cf4256814db967cb154e7af3d0c369` and imports no further Tau Ceti modules.
The report distinguishes this dependency verification from a whole-checkout pin.

`python3 scripts/check_blueprint.py research/blueprint/packets/AdicCoefficientsAndComparisons.json`
reports 0 errors and 0 warnings. Target/API/test inventories match; metadata is
exactly `topic = "math.AG"`; the README is below 200 KB and has no process tokens.
The local intake check reports 5 files and 0 problems, and `git diff --check` passes.

The accepted plan's eight construction/supplier obligations remain visible in
the mathematical specification. This review does not prove the signatures or
resolve the separate alteration-ownership decision. If future implementation
requires that decision, consult the accepted packet's `G-owners` and SF.4;
do not duplicate the alteration theory here.

The disposable source downloads and Lean logs are removed after submission.
All information needed to assess or repeat the review is in the report and the
permanent package files. This run stops after its one pull request.
