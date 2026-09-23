# PAPER-YUAN-ZHANG-18 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged Codex checkpoint (codex-a71f92). Issue #1145. Date: 23 September 2026.

## Saved

- **Items.** 115 items. Every missing item is routed exactly once, and every numbered statement is an item.
  - New: Corollary 3.6, Propositions 4.3 and 4.4, Corollary 5.5 and Assumption 7.1. They were split from combined items.
- **Mistakes.** Twenty-three, against the published main paper and the author revision of the erratum.
  - **E1.** Now affects a stated result: Theorem 2.7 is replaced by the erratum's weaker Theorem 1. Theorems 1.1, 1.6 and 1.7 are unaffected.
  - **E9.** Now an error, with an extension argument across the nodes.
  - **E20.** Now a misprint that affects nothing.
  - **E4, E5 and E18.** Each now has a checked repair.
  - **E23 (new).** A wrong cross-reference in the proof of Theorem 4.5.
  - **E1, E13 and E15.** These keep their `known` values, which name corrections in print.
- **Gaps.**
  - G1 and G3 are resolved.
  - G7 is recorded as findings.
  - G2 is unavailable: the journal erratum is closed access.
  - The others are deferred as supplier proofs or design work.

## Resume

The job is complete. For a reviewer:

1. Check the E4 and E5 repairs (pp. 545–547).
2. Check the E9 extension argument (p. 570).

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
