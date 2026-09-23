# PAPER-ANGLES-NGODAC-TAVARESRIBEIRO-22 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged Codex checkpoint (codex-a71f92, #1981). Issue #1268. Date: 23 September 2026.

## Saved

- **Items.** 103 items: 2 library, 9 planned, 92 missing. Every missing item is routed exactly once, and every numbered statement is an item.
  - Items 58, 74, 76, 77 and 96 now carry complete arguments:
    - the Gauss-limit step of Theorem 4.3;
    - the congruence form of Proposition 5.3 with its descent;
    - the Jacobian input of Lemma 5.4;
    - the motive carrier of Theorem 6.3.
  - Item 100's note justifies Corollary 6.5's principality.
- **Mistakes.** Fifteen, recorded against HAL v2 (the version of record is closed access). None affects a stated result.
  - `known` is now "new" on every finding. The previous text would have been read as "corrected in print".
  - E1–E3 and E8 now affect nothing.
  - E10 and E12 are now misprints.
  - E15 is new: Theorem 4.3, Step 1 asserts the stabilization and the membership in Ã without the reasons, which are supplied.
- **Gaps.**
  - G3, G5 and G7 are resolved.
  - G2, G4, G6 and G8 are deferred as supplier proofs or design adapters.
  - G1 is unavailable.

## Resume

The job is complete. For a reviewer or a later worker:

1. Check E15 and item 58.
2. Check the reclassification of E10 and E12 as misprints against the proofs of Proposition 5.3 and Theorem 6.3.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
