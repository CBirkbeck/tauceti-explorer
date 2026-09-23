# PAPER-DITTMANN-POP-23 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged Codex checkpoints (latest #1935). Issue #1099. Date: 23 September 2026.

## Saved

- **Items.** 154 items: 29 library, 6 planned, 119 missing.
  - The checkpoint's 152 item ids are kept. niceness-definability and function-field-fundamental-equality are new.
  - Every missing item is routed exactly once across seven routes:
    - Part IIs of LogicAndDefinabilityInNumberTheory (finitely generated field definability), of Tau Ceti's QuadraticFormInvariants (higher Pfister forms) and of AdicCoefficientsAndComparisons (prime-to-degree alterations);
    - source routes for LogicAndDefinabilityInNumberTheory, HigherLocalFieldsAndHigherClassFieldTheory, AlgebraicModuliForArithmeticGeometry and AutomorphicCongruences.
- **Mistakes.** Seventeen are recorded (E1–E4, E6–E18).
  - The checkpoint's thirteen were rechecked against the TeX source; E6, E7 and E8 have revised reasons.
  - E15–E18 are new. E17 concerns the first-order definition of niceness and E18 the low dimensions of Theorem 1.2; both come with repairs.
- **Gaps.** The checkpoint's gaps G1–G7 now carry a status and a resolution in the result.
- **Prerequisites.** Kerz–Saito, Gabber/ILO, Cossart–Piltant and Kato 1986 were added.
- **Spacing.** Stripped spaces are restored.

## Resume

The job is complete. For a reviewer or a later worker:

1. Check E17 and niceness-definability. The real-place clause uses the Positivstellensatz with sums of four squares, and the finite places use Rumely's definable valuation rings.
2. Check E18: Theorem 1.2 in Kronecker dimensions one and two.
3. Check the route of function-field-fundamental-equality, to A0-extension. Tau Ceti has only the separable fundamental identity.
4. If the typeset Annals text becomes available, map the v2 locators to it.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
