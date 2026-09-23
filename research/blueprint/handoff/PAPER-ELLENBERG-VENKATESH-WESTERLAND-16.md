# PAPER-ELLENBERG-VENKATESH-WESTERLAND-16 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged Codex checkpoints (codex-a71f92 #1843, codex-c83e7a). Issue #1184. Date: 23 September 2026.

## Saved

- **Items.** 137 items. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Nineteen findings, with `known` now "new" on all of them.
  - E11 now affects a stated result: Theorem 1.2's range. The paper proves it only along odd q prime to ℓ (item 109).
  - E9 now affects nothing.
  - The Annals paper has no correction; it was the sequel, arXiv 1212.0923, that was withdrawn.
- **Remaining work.** Each item of `remainingWork` has a status in `remainingWorkStatus`.

## Resume

The job is complete. For a reviewer: check E11 against §8.6 and Theorem 8.8.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
