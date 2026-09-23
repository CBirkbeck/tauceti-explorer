# PAPER-BROWNING-LEBOUDEC-SAWIN-23 handoff

Status: complete for arXiv v1. Claude Code, session cc-442dc5, continuing the merged Codex checkpoint (codex-a71f92, PR #1920). Issue #1095. Date: 23 September 2026.

## Saved

- **Items.** 129 items: 5 library, 4 planned, 120 missing. Every missing item is routed exactly once.
  - Seven items are new: five cited inputs (Schmidt Lemma 6, Davenport's reduced basis, Broberg–Salberger, Browning–Matthiesen's Hensel lemma, Bhargava's plane cubics) and two repairs (the grid-zero bound for E5, and the Euclidean-ball local density for E19).
  - Bhargava's result opens a new source route to ArithmeticStatistics:ST.4.
- **Mistakes.** Nineteen are recorded; all have `known: new`.
  - **E1–E13:** the checkpoint's findings, each confirmed again. E11 and E13 are reclassified as affecting nothing.
  - **E14:** the dyadic ranges in (3.25) and in the proof of Lemma 3.24 need min{Z, s3}, not max.
  - **E15:** Lemma 3.4's constant also depends on the number of bands.
  - **E16:** the constant 1/4 in the proof of Lemma 4.4 is false for d = 2 (ratio 30/173).
  - **E17:** the gradient bounds in (5.34) are off by a factor 2.
  - **E18:** the partial summation in (4.71) goes below Lemma 4.7's range; the lemma's proof covers it.
  - **E19:** (1.3) cites Poonen–Voloch's sup-norm box density for the paper's Euclidean ordering.
- **Gaps.** G2, G4, G6, G8 and G9 are resolved. G1 is unavailable: the published text is subscription-only and not posted. G3, G5, G7 and G10 are deferred as supplier proofs or design work.

## Resume

The job is complete. For a reviewer or a later worker:

1. Check E16, E18 and E19, and the reclassifications of E11 and E13.
2. If the published Annals text becomes available, compare it with v1 at every finding's locator and update `known`.
3. The design job should read the cited suppliers (G3, G5) in the order the report lists them.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Both arithmetic certificates in the report run with the outputs shown. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
