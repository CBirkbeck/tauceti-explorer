# PAPER-FU-24 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged Codex checkpoints (codex-c83e7a, #1659 and later). Issue #1083. Date: 23 September 2026.

## Saved

- **Source.** The published Annals text (NSF PAR copy, SHA-256 a6a15856…) was read in full and collated with arXiv v2. The numbering is identical, and the locators now refer to the published pages.
- **Items.** 137 items: 12 library, 11 planned, 114 missing. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** The checkpoint's S1–S7 are converted to the §18 form as E1–E7, with the old text kept in `previousForm`.
  - E5 (the separation gap in Theorem 5.7 at large radii) and E7 (Theorem 5.7 is false for non-integral characters) affect a stated result, Theorem 5.7.
  - The main Theorems 1.2–1.5 rest on Ardakov–Wadsley [AW14] and are unaffected.
- **Coverage.** Every item in `coverage.remaining` is resolved or deferred (`coverage.resolution`).

## Resume

The job is complete. For a reviewer or a later worker:

1. Check E3, E5 and E7 on pp. 145–147.
2. A proof of the separation condition D_r ∩ D_{r′}(p²∆ + λ0) = D_r(p²∆ + λ0) at the radii p^(−1/p^n) would restore the paper's own proof of Theorem 5.1.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
