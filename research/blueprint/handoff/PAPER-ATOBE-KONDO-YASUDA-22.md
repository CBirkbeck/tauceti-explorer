# PAPER-ATOBE-KONDO-YASUDA-22 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged Codex checkpoints (codex-a71f92 #1814, codex-c83e7a). Issue #1395. Date: 23 September 2026.

## Saved

- **Items.** 161 items. Every missing item is routed exactly once, and every numbered statement is an item.
  - The Speh-case targets carry notes pointing to E19: `main-one`, `main-lex`, `speh-l1`, `speh-main` and `levi-separation`.
- **Mistakes.** Nineteen, with `known` now "new" on all of them.
  - **E1.** Theorem 9.1's uniqueness is false, rechecked with the explicit equivariance failure.
  - **E3.** Lemma 8.10 is false at repeated parameters.
  - **E19 (new).** The paper does not establish Theorem 2.1 for Sp(π, m) with L(s, π) = 1 and n, m ≥ 2. Propositions 9.5 and 9.6 rest on the failed step. No counterexample to Theorem 2.1 is known.
  - E4 now affects nothing.
- **Gaps.** G1 and G4 are recorded as findings; the others are deferred as supplier proofs or design work.

## Resume

The job is complete. For a reviewer or a later worker:

1. Check E1 and E19 (pp. 48–54).
2. A new proof of Corollary 9.4, and of σ^{K(c_π)} ≠ 0, for Speh representations with L(s, π) = 1 would close E19.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
