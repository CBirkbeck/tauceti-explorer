# PAPER-QIAN-23 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged Codex checkpoint (codex-a71f92). Issue #1252. Date: 23 September 2026.

## Saved

- **Items.** 112 items. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Thirteen findings.
  - E2 now affects a stated result. Theorem 1.4 uses ACC+ Theorem 6.1.2, whose condition (4) requires p > n; this holds in ACC+ arXiv v1 and v2. So the theorem is established only for l > n (item 010).
  - E1 (Lemma 3.12 needs v(t) < 0) was confirmed.
- **Gaps.** S8 and S9 are recorded as findings; the others are deferred as supplier proofs or design work.

## Resume

The job is complete. For a reviewer: check E2 against ACC+ Theorem 6.1.2(4). A lifting theorem for odd l ≤ n would restore the full range.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
