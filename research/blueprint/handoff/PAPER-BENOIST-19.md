# PAPER-BENOIST-19 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged Codex checkpoints. Issue #1454. Date: 23 September 2026.

## Saved

- **Items.** 187 items. Every missing item is routed exactly once, and every numbered statement is an item.
  - New: Conjectures 0.9 and 0.11, as items 186 and 187.
- **Mistakes.** Nineteen, against the published Numdam PDF.
  - **E3 and E4.** They now affect a stated result: Propositions 4.4, 4.5 and 6.6 are not established when the evaluation [α̃]_0 is nonconstant on Ψ.
    - The main theorems use only Ψ = Θ through Proposition 6.7, where the evaluation is 0 and the checkpoint's repair applies.
  - **E1.** Unchanged: the §3.1 cover is not finite.
  - **Reclassified to affect nothing.** E6, E11, E12, E16 and E18.
- **Gaps.**
  - G2, G4, G5, G7, G8 and G12 are resolved.
  - G1, G4a, G4b, G6 and G9 are recorded as findings.
  - G10 and G11 are deferred.

## Resume

The job is complete. For a reviewer:

1. Check E3 on p. 84, the (a, b, c) ↦ (0, b + a[e]_1, …) step.
2. Check the claim that Proposition 6.7 applies Proposition 6.6 only with Ψ = Θ (p. 95).

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
