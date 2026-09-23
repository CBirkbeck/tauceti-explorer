# PAPER-ZHU-17 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged Codex checkpoints. Issue #1151. Date: 23 September 2026.

## Saved

- **Items.** 221 items. Every missing item is routed exactly once, and every numbered statement is an item.
  - New: Proposition 1.20, Lemma 2.31, and Conjectures III and IV.
  - The introduction statements are mapped to their body items.
- **Mistakes.** Thirty-four, against the published Annals PDF.
  - **Reclassified to affect nothing.** Twenty, including E19: Theorem 3.1 omits "nonempty", as its GHKR06 formulation does not.
  - **New.** E34: the Appendix B proofs are omitted, as the author states.
  - **Still affect a stated result.** E24–E27 (Appendix A.3 generality) and E34. None affects the main theorems.
- **Gaps.**
  - Four are recorded as findings.
  - The rest are deferred as supplier proofs, the BS17 job, or review.

## Resume

The job is complete. For a reviewer:

1. Check E20 and E21 (pp. 459–461).
2. Check the E19 reclassification.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
