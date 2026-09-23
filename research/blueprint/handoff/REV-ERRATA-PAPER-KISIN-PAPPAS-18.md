# REV-ERRATA-PAPER-KISIN-PAPPAS-18 — completed review

Codex `codex-a71f92`, 23 September 2026. Refs #1879.
Claim 5796076859; bot confirmation 5796079263. The issue was read before and after confirmation.

## Result

All eight findings independently confirmed after amendment. E1–E7 are corrected in published KPZ26; E8 is the published half-rank typo with no correction found. E2/E3 are gaps, not established false general conclusions. E4 is qualified by the specified action. E1 and E5 have explicit local witnesses, and E7's missing real-place condition is now stated. No extra source findings were added.

The errata explanation records exact public-source URLs/hashes and targeted reading boundaries, including both published PDFs. The final review records each verdict. No claims of full-paper auditing, formalization or proofs of all background results are made.

## Scope and provenance

Only the two errata files, final review and this handoff change. Original extraction and generated register files remain untouched. The original errata and extraction were by other sessions. No source PDFs or local scratch files are submitted.

Publication base: `c49fe940bff088995cc1f9c0077907683d3abb14`. Both input errata files were unchanged in a fresh main snapshot, and binding instruction hashes matched the versions read. No AGENTS.md was present in that snapshot.

## Checks

- `scripts/check_errata.py`: valid.
- `intake.py check-files`: 4 files, 0 problems.
- Five regression suites: check_errata (3), errata (4), source_issues (7), intake (29), issues (22): 65 tests passed.
- Read-only completion/registry simulation: complete; 8 confirmed entries attributed to this review, with 7 known corrections and 1 new finding. It modified job state only in memory and did not run the register generator.
- Finite rational-arithmetic sanity checks of the square-zero ghost-coordinate witness passed for p=3,5,7. They supplement, not replace, the mathematical argument.
- No Lean file changed or compiled: this job is an errata review.
