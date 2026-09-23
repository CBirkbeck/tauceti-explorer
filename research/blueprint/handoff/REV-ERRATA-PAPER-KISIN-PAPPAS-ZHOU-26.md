# Handoff: REV-ERRATA-PAPER-KISIN-PAPPAS-ZHOU-26

Issue #1859. Codex — codex-a71f92. 23 September 2026.
Status: complete, subject to automated intake.

## Saved

- Reviewed errata JSON and mathematical report for PAPER-KISIN-PAPPAS-ZHOU-26.
- Independent review REV-ERRATA-PAPER-KISIN-PAPPAS-ZHOU-26.md.
- This handoff; no other deliverables changed.

Eight inherited findings confirmed with corrected reasons/reach, plus E9 (polarization cone's ambient space) and E10 (disjoint unions of root directions). E3/E4 absorb additional adjacent notation/coordinate slips. All ten verdicts are confirmed and known=new after renewed bounded searches.

The most material correction is to the **errata report itself**: the right inclusion of (4.2.7) gives a direct proof of the general Proposition 4.2.10(2). Under Proposition 4.2.13's minuscule-set hypothesis, k≤l≤j≤k repairs all l-equalities needed later. The unrestricted pairwise weight-action symmetry is false; no conclusion of falsity is drawn for the numerical statement of 4.2.10(1) outside that hypothesis. Read the complete argument in E2 before using the extraction's older “open” description.

E9 repairs the density argument by working in Alt_Hc(V), not all Bil_Hc(V); a doubled standard SL₂ example proves the printed openness assertion false.

## Provenance and scope

Claim 5796327470, winning bot confirmation 5796330434; whole issue reread after confirmation.
Initial main snapshot: 588e4e8d80127ebd4f0accebceedfc87cabd177f.
Original errata author cc-442dc5; extraction authors codex-c83e7a/cc-442dc5; independent of this reviewer.
Binding protocol hashes unchanged from those already read. No AGENTS.md found in the snapshot.

Companion report records full public URLs, hashes and reading scope. The named repository PDF matches the original hash exactly, and the relevant page text agrees with the publisher PDF. Critical formulas were inspected as images. arXiv v3 and bounded author/correction checks are recorded. Deligne's original pages 253,255–256 were read for E9.

No extraction, roadmap, audit, queue, generated register or Lean edits. The collector is tested in memory only; intake owns register generation. No authors contacted.

## Resume

No inherited finding awaits a verdict. Normal intake may collect these ten confirmed new findings after accepting this finished review. A later audit wishing to settle the unrestricted numerical identity in 4.2.10(1) needs an argument beyond the false pairwise symmetry; do not mistake this review's bounded repair for such an argument.

## Checks

Validated on fresh main snapshot 5ee156e7eaf39a3ffa81300f73e570b83a8c6ddd. Both original errata inputs were unchanged from the claim snapshot; the binding instruction hashes remained unchanged and no AGENTS.md was present.

- `python3 scripts/check_errata.py research/blueprint/errata/PAPER-KISIN-PAPPAS-ZHOU-26.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the errata pair, review and handoff: 4 files, 0 problems.
- `python3 -m unittest discover -s tests -p test_check_errata.py`: 3 passed.
- Same command with `test_errata.py`: 4 passed; `test_source_issues.py`: 7 passed; `test_intake.py`: 29 passed; `test_issues.py`: 22 passed. Total 65.
- Stdlib-only scratch diagnostic: divided-power and inverse-exponent identities for p=3,5,7,11 passed; SL₂ doubled-standard invariant/alternating matrix checks passed.
- Source-copy diagnostic: normalized relevant text agrees on all 17 selected pages of the repository and publisher PDFs.
- In-memory collector test: exactly 10 confirmed new findings (3 errors, 7 misprints; 2 proof-affecting, 8 affecting nothing) when this review job is marked done only in the in-memory job list. No generated files written.
- Lean: not applicable, no file changed or elaborated; no formalization claim.
