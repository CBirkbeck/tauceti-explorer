# PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged Codex checkpoint (codex-a71f92). Issue #1143. Date: 23 September 2026.

## Saved

- **Items.** 172 items. Every missing item is routed exactly once, and every numbered statement is an item.
  - 31 are new. They were split from grouped items or added for statements the checkpoint left out.
- **Mistakes.** Twenty-seven, against the published Annals PDF.
  - **Affect a stated result.** E1 (Lemma 9.4.4) and E2 (Proposition 9.4.5), both rechecked; E3 (Lemma 9.4.3); and E26, a correction to BKY12 that this paper makes in print. None affects Theorems A or B.
  - **Reclassified to affect nothing.** E4, E7, E8, E13, E18, E22, E23 and E24. Each is a slip whose intended form the paper uses.
  - **E6.** Now carries a degree check of (9.5.1) in the unramified case.
- **Gaps.**
  - G7 is resolved.
  - G4 and G5 are recorded as findings.
  - The others are deferred as cited suppliers' proofs.

## Resume

The job is complete. For a reviewer:

1. Check E1 and E2 (pp. 517–519).
2. Check the E4 reclassification against (9.5.2) on p. 523.
3. Check the ramified case of E6, which was not rechecked.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
