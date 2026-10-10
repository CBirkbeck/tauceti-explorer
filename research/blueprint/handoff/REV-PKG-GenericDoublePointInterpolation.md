# REV-PKG-GenericDoublePointInterpolation handoff

Completed by Codex (GPT-6), session `codex-ERTaA7`, 10 October 2026, for #7604.
Claim confirmed by the bot in issue comment 6098764747. Branch:
`codex-ERTaA7-review-generic-double-points`.

## Done and verdict

Accepted all six package checks. The full report is
[REV-PKG-GenericDoublePointInterpolation.md](../reviews/REV-PKG-GenericDoublePointInterpolation.md);
the machine-readable verdict is
[review.json](../packages/GenericDoublePointInterpolation/review.json).
Only README corrections were needed: explicit Proposition 5.4 base support
counts and the length-two trace, plus spacing in the quartic base statement.
All 77 targets, 42 API entries and 42 tests remain present. README: 94,920 bytes.
Suggested.lean and metadata.toml are unchanged. No work remains for this job.

## Check receipts and reproduction

- `lean-check research/blueprint/packages/GenericDoublePointInterpolation/Suggested.lean`
  exited 0 with **141 declaration-uses-sorry warnings**, no errors or other
  warnings. It ran at pinned Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` after checking available memory.
  The checked file SHA256 is
  `bf75e532feee49b241bace512f746f13ccb103bb430e7c2cdd2f97fe860a732e`.
  This is admitted-signature elaboration, not a proof replay.
- The plan checker returned 0 errors, 0 warnings for the accepted packet.
  Intake file checks returned 6 files, 0 problems; `git diff --check` passed.
- Recovery instructions in
  [DESIGN-GenericDoublePointInterpolation.md](DESIGN-GenericDoublePointInterpolation.md)
  authenticated **39** artifacts. Run its recovered `verify_certificates.py`
  and `arithmetic_check.py` in a scratch directory: all **22** matrices and
  the collinear rank 11 passed; the arithmetic sweep passed **2,585** critical
  pairs and four quartic cases. Run the Fraction helper from
  [PKG-GenericDoublePointInterpolation.md](PKG-GenericDoublePointInterpolation.md)
  alongside the fixtures: **430** incidence/transversality checks and all
  rational frame ranks passed. No new copy of those artifacts is needed.
- Source PDFs read: BO arXiv math/0701409v2, SHA256
  `7d3dd9e6268431f4be53740bbf57ebf46d9a76b13c3472d6911d7f6deb530aa7`,
  and Couveignes's published Annals PDF, SHA256
  `8d63bd3a14f0d61f421695f1d93559d18fb674240c6dee872c23bf5902e1a104`.
  Public links and exact sections/pages are in the report and package. No
  restricted book was needed; no source passage is preserved here.
- The native total-degree module exists in current Tau Ceti at `a91d3aaf`,
  but not at pin `f790474`. Keep the current-library citation; do not add an
  unavailable pinned import. Geometric omissions in the Lean suggestion
  remain explicitly inventoried, with full mathematical contracts in README.

The package README SHA256 after corrections is
`cae94da6f8c381ef8fe8f77544d4f209b98006dc7ba8279e3ece6b4a7f333848`.
The ten formal implementation refinements and four supplier requests in the
accepted plan are unchanged. Package acceptance does not certify their proofs.
No second job was claimed. Temporary source texts, recovery files and logs
are removed after submission; the existing handoffs retain reproducible
finite evidence and this note retains the new check receipt.
