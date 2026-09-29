# PAPER-BHARGAVA-25 handoff

Status: complete. Claude Code, session cc-fb70e5. Issue #1059. Date: 29 September 2026.

## Saved

- **Items.** 74 items: 11 library, 3 planned, 60 missing. Every missing item is routed exactly once. Every numbered statement of arXiv v3 is an item, and so is each cited input the proofs rely on.
- **Routes.** Four routes:
  - the new Part II `PolynomialGaloisGroupsPartIICountingByGaloisGroup` of the Tau Ceti roadmap Galois groups of polynomials;
  - sources ST.3, IG.2 and SF.5.
- **Mistakes.** Fifteen, against arXiv v3; the published PDF is subscription-only.
  - **Affect a stated result:**
    - E15: Corollary 6 is false for n = 2 and unproved when 2 or 3 divides n;
    - E13: Corollary 3(a)'s threshold 53 is proved only from 56;
    - E11: Theorem 2's log exponent.
  - **Affect the proof:** E5, E6, E9, E10, E12.
  - The rest are misprints.

## Resume

The job is complete. For a reviewer:

1. Check E15 and E13 (pp. 4–5, 29). The exact exponents are in each finding's reason.
2. Check E11. The b < c claim fails for AGL(2, 3), n = 9.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
