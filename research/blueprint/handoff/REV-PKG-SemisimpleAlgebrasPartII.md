# REV-PKG-SemisimpleAlgebrasPartII handoff

Completed independent review for issue #7609 on 2026-10-10 by Codex (GPT-6),
session `codex-qj2ht1`. The bot confirmed the claim. This session did none of
the original package work. Verdict: **needs_changes**. This review is complete.

Deliverables are the independent report, package `review.json`, and clear
corrections in README.md and Suggested.lean. The accepted packet is unchanged.
The arithmetic adapter now returns the actual column action induced by its
splitting, rather than an unspecified dimension-compatible module instance.
GS §4.4 now has its first-edition page range; the BB rank formula renders
correctly; a Lean progress comment was replaced by the coefficient contract.

Checks:

- The packet checker reports 0 errors, 0 warnings, 55 declarations, 30 API
  items and 31 tests.
- Independent `lean-check` before and after the signature correction exits 0
  with 66 `sorry` warnings, 0 errors and 0 other warnings. The only subsequent
  Lean edit is a comment. The shared build matches Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` for the inspected baseline files.
- Source hashes for the freshly read GS errata, Benoist, EG v4, published OV
  and BB v2 match the accepted receipts. The GS first-edition institutional
  book PDF timed out; detailed locators remain inherited, while §4.4's page
  range was checked against publisher contents. No alternate edition was used.
- Package size, JSON, metadata, coverage inventory and whitespace were checked.
- The intake file checker reports 5 files, 0 problems.

Resume a package revision at R1–R3 in
`research/blueprint/reviews/REV-PKG-SemisimpleAlgebrasPartII.md`. Its table
maps every target to the reader and suggested file. Missing are 23 target
signatures, 14 API signatures and 13 planned tests. SA.1 needs its all-class
normalized restriction square, the cohomology equation tying the native
corestriction to actual transfer, and embedding independence. SA.2–SA.3 need
the shared geometric carriers and their functors, invariants and examples.
SA.4 needs all seven relative Cartier signatures and an identified supplier
roadmap/layer. The relative class-vanishing statement must remain a theorem
target with the connection/Hitchin data, not an axiom in an input structure.

Current supplier prototypes do not eliminate these omissions: the shared
scheme-Brauer and general Higgs symmetric-action declarations remain
mathematical comments, and the requested generic projective-generator
tensor/Hom prototype was not found. Consult current upstream
AlgebraicVectorBundles and QuadraticFormInvariants 7B when supplying the
interfaces; preserve their ownership and crossed-product normalization.
No private replacement carrier or empty property field was introduced.

No work remains for this review job. A separate package revision and
independent review are required before acceptance. No second issue was claimed.
