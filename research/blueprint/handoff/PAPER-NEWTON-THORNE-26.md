# PAPER-NEWTON-THORNE-26 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged ChatGPT Pro checkpoint (`cp-2109-planets01-f7c2`, #1386). Issue #1053. Date: 23 September 2026.

## Saved

- **Items.** 130 items: 3 library, 9 planned, 118 missing.
  - The checkpoint's 57 items are kept.
  - 73 items are new. They cover every numbered statement the checkpoint had not extracted (Lemmas 3.3–3.8, Propositions 3.9–3.14, Lemma 4.2, Corollary 4.3, Propositions 4.4–4.9, Lemmas 4.5, 4.7, 5.6, and Definition 2.5(1)), the deformation-theoretic constructions of §§3–4, and every result of another paper that the proofs cite.
  - Every missing item is routed exactly once, across 14 source routes to existing owners. No new roadmap is proposed.
- **Mistakes.** Two are recorded:
  - **E1:** Proposition 5.4, and the same step in Lemma 5.7, conclude pᵃ > M where only pᵃ ≥ M follows. The edge case is p = 2, M = 16, t₁ = 17. All uses need only ≥.
  - **E2:** two misprinted checks in the proof of Lemma 5.8.
- **Source.** arXiv v2 was read in full. The PDF and TeX SHA-256 are in the result and the report.

## Resume

The job is complete. For a reviewer or a later worker:

1. Check E1 and the statements of Propositions 3.10, 3.13 and 4.9.
2. Check the owners chosen for the cited inputs:
   - Tho15 and ANT20 at PA.3;
   - NT23 and NT21b at ML.5;
   - the local rings at R08.2–R08.5.
3. If the published Annals text becomes available, compare it with arXiv v2.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
