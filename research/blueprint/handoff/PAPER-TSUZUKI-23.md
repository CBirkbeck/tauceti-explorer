# PAPER-TSUZUKI-23 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged Codex checkpoint (codex-a71f92). Issue #1258. Date: 23 September 2026.

## Saved

- **Items.** 164 items. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Twenty-four, against arXiv v3 (the Inventiones version is closed access).
  - `known` is now "new" on all of them.
  - E2, E7, E8 and E9 are reclassified as misprints that affect nothing, and E20 as an error that affects nothing. Each has a clear intended form that the paper's arguments use.
  - E12 (the circular proof of Lemma 3.31) now has a repair: bounded quotients commute with the finite étale generic extension, by the argument of Proposition 3.14.
- **Gaps.**
  - G2 is resolved.
  - G6 is recorded as E17 and E22.
  - G1 is unavailable.
  - The others are deferred as supplier proofs or design work.

## Resume

The job is complete. For a reviewer: check the reclassifications and the E12 repair.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
