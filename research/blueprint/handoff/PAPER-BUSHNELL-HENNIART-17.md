# PAPER-BUSHNELL-HENNIART-17 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged Codex checkpoints (codex-c83e7a, codex-a71f92). Issue #1153. Date: 23 September 2026.

## Saved

- **Items.** 149 items. Every missing item is routed exactly once, and every labelled statement is an item.
  - New: the §1.1 Lemma, the §2.3 Proposition and Corollary, and the §2.4 Basic connection.
- **Mistakes.** Seventeen, against the published Annals PDF.
  - **Affect a stated result.** E5, E7, E12 and E13, of which E5, E12 and E13 were rechecked. None affects the main theorems.
  - **Reclassified to affect nothing.** E4, E6 and E9.
  - **E14 and E15.** These keep `known` values: this paper acknowledges them as corrections to BH14 and BH03.
- **Gaps.**
  - G5 and G9 are recorded as findings.
  - The others are deferred as supplier proofs or design work.

## Resume

The job is complete. For a reviewer:

1. Check E5 (p. 939).
2. Check E12 and E13 (pp. 952–953).

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
