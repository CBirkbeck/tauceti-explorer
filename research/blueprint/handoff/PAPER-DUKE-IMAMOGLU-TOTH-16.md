# PAPER-DUKE-IMAMOGLU-TOTH-16 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged checkpoints of codex-a71f92, cc-fb70e5 and codex-c83e7a (latest #2085). Issue #1170. Date: 23 September 2026.

## Saved

- **Items.** 188 items: 22 library, 6 planned, 160 missing. Every missing item is routed exactly once.
- **Mistakes.** Sixteen are recorded; all fourteen inherited findings were confirmed at their locators.
  - **E6 now affects a stated result.** Proposition 2's (6.6) is printed for ⟨φ,φ⟩⁻¹φ with a(1) = 1, where only a bound with cosh²(πr/4) follows. The paper's own example at r ≈ 13.78 has Weyl ≈ 1.9×10⁹. Items /150 and /152 state what holds, and Theorem 2 is unaffected.
  - **E15, E16:** two small misprints in (5.1) and (5.4).
- **Gates.** S1–S8 are deferred as supplier proofs; `gateStatus` in the JSON records each.
- **Reading.** The full published paper was read, with page images where the text layer garbles formulas. E5's family was recomputed exactly, and the p.967 examples were recomputed from Table 2.

## Resume

The job is complete. For a reviewer or a later worker:

1. Check E6's reclassification.
2. The design job should close the supplier gates S1–S8 in the order the report lists them.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
