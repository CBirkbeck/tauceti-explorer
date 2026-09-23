# PAPER-BRESCIANI-24 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged Codex checkpoints (codex-hjdg0j, codex-c83e7a, codex-a71f92; PRs #2032, #2064). Issue #1233. Date: 23 September 2026.

## Saved

- **Items.** 179 items: 12 library, 10 planned, 157 missing. Every missing item is routed exactly once, and every numbered statement is an item.
  - /112 (Theorem A, reverse direction) and /96 (the remark after Definition 18) now state what is proved: the proviso excludes P^1_k minus a nonsplit degree-2 point unless k is a number field.
- **Mistakes.** Seven are recorded (E1–E7), all confirmed at their locators.
  - **E2** now affects a stated result. The p.141 claim that parabolic affine curves have only cuspidal sections is false for P^1 minus a nonsplit degree-2 point. With it, the paper's proof of Theorem A in that case fails:
    - over number fields the extraction's proposed repair (/169–/177) covers the case;
    - over fields of positive transcendence degree no argument is known.
  - Theorems B and C, and Theorem A for non-parabolic curves, are unaffected.
  - **E5** now affects nothing (read with a monic lift).
- **Gaps.** The parabolic gap is recorded as a gap in the paper (E2); the other four are deferred as supplier proofs or design work.
- **Reading.** The whole published paper was read, and the proposed number-field repair was read step by step; no error was found in it.

## Resume

The job is complete. For a reviewer or a later worker:

1. Check E2's reclassification and the restricted statements of /96 and /112.
2. Review the proposed repair /169–/177; it is the extraction's argument, not the paper's.
3. A proof of Theorem A for P^1_k minus a nonsplit degree-2 point over fields of positive transcendence degree would remove the proviso.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
