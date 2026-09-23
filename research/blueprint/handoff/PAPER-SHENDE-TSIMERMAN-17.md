# PAPER-SHENDE-TSIMERMAN-17 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged Codex checkpoints (codex-c83e7a and codex-a71f92; #1657, #1852, #2080). Issue #1334. Date: 23 September 2026.

## Saved

- **Items.** 144 items: 13 library, 23 planned, 108 missing. Every missing item is routed exactly once, and every numbered statement is an item in corrected form.
  - Ten of the sixteen held-back source claims were restated in corrected form and routed. Among them are Theorem 1.1 for every q, Case 2 of Theorem 4.4, and Theorem 1.5 with the constant 3840.
  - Six were withdrawn into `withdrawnItems`:
    - five false printed claims that duplicate routed corrected items;
    - Sawin's later preprint, which the paper does not use.
- **Mistakes.** Twenty-four, all against arXiv v1; the Duke text is closed access.
  - **New:**
    - E22: Theorem 3.9 holds for i > n + e(L) + 1.
    - E23: the preimage ½Θ has class 4^(g−k−1)[Θ].
    - E24: Corollary 2.20 onward is established only in characteristic 0 or p > 2g − 2.
  - **Reclassified:** E8, E14, E15, E20, E21.
- **Gaps.**
  - G3 and G8 are resolved.
  - G2, G4, G5 and G7 are recorded as findings.
  - G1 and G9 are deferred as supplier proofs.
  - G0 is unavailable (closed access).
  - G6 is withdrawn.

## Resume

The job is complete. For a reviewer or a later worker:

1. Check E24. A proof of Corollary 2.20's finiteness in characteristic p ≤ 2g − 2 would restore Theorems 3.9 and 1.3, and Case 2 of Theorem 4.4, over a fixed F_q.
2. Check E22 and E23, and the corrected constant 3840.
3. Case 1 of Theorem 4.4 (E21) needs a function-field Linnik argument that is uniform in a split place of growing degree.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
