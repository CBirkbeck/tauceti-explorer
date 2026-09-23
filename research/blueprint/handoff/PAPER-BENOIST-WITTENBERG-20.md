# PAPER-BENOIST-WITTENBERG-20 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged Codex checkpoints. Issue #1296. Date: 23 September 2026.

## Saved

- **Items.** 193 items. Every missing item is routed exactly once, and every numbered statement is an item.
  - New: Questions 2.1, 2.6, 2.16 and 4.9, as statement-only items.
- **Mistakes.** Ten, against the author-hosted published PDF.
  - **Affect a stated result.** E1 (Theorem A(ii)/3.16(ii) for curves with a real point) and E3 (Example 4.4), both rechecked, and the new E10 (Remarks 5.10 are announced without proof).
  - **Reclassified to affect nothing.** E4.
- **Gaps.**
  - GAP-DIMENSION is resolved.
  - GAP-CAMPEDELLI and GAP-QUARTIC are recorded as findings.
  - The rest are deferred as supplier proofs or design work.

## Resume

The job is complete. For a reviewer:

1. Check E1 (pp. 4 and 55).
2. Check E3 (p. 59), the T² = −1 computation on Λ_2.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
