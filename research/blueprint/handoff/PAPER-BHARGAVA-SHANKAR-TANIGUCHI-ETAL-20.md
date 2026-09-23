# PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged checkpoints. Issue #1420. Date: 23 September 2026.

## Saved

- **Items.** 152 items. Every missing item is routed exactly once. The seven previously unrouted items now carry corrected statements.
- **Mistakes.** Eleven.
  - **E8.** The index-two genus step. It is repaired by the squared bound, and Theorem 1.1 holds.
  - **E9.** Theorem 1.3 is false with Disc(K) (the congruent-number curves) and holds with Disc(C).
  - **E10.** Sedunova's bound is not uniform in q.
  - **E11.** Theorem 7.1's second assertion is not established.
  - **Reclassified to affect nothing.** E1–E4.
- **Gaps.**
  - G2, G5 and G9 are recorded as findings.
  - G0 is unavailable.
  - The rest are deferred.

## Resume

The job is complete. For a reviewer:

1. Check E9's counterexample.
2. Check E11 (p. 12).
3. If the JAMS text becomes available, collate E8, E9 and E11 against it.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
