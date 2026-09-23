# PAPER-HARPAZ-WITTENBERG-20 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged Codex checkpoints (codex-c83e7a, then codex-a71f92, #1665). Issue #1426. Date: 23 September 2026.

## Saved

- **Items.** 150 items: 7 library, 12 planned, 131 missing. Every missing item is routed exactly once.
  - Item 75 (Remark 4.5), the only unrouted item, now states the remark with "X rationally connected" added. It is routed with Theorem 4.2 to HeightsRationalPointsPartIIHomogeneousMassey.
- **Mistakes.** Two are recorded, the first `sourceIssues` for this paper:
  - **E1:** the justification of Remark 4.5 applies Theorem 4.2(i) outside the rationally connected setting of §4.
  - **E2:** the quaternion range m ≥ 1 on p. 4 should be m ≥ 3.
- **Reading.** The author manuscript was read in full; Crossref and the author's page show no correction.

## Resume

The job is complete. For a reviewer or a later worker:

1. Check E1 and the corrected item 75.
2. If Skorobogatov 1990 becomes available, check whether its Theorem 1 gives Remark 4.5 without rational connectedness.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
