# PAPER-GILLE-PARIMALA-26 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged Codex checkpoints (codex-c83e7a, then codex-a71f92). Issue #1197. Date: 23 September 2026.

## Saved

- **Items.** 152 items: 7 library, 4 planned, 141 missing.
  - Items 37 and 76 are removed. They quoted false printed statements (Proposition 3.3 and the Tits-index formulas), which are now findings E3 and E13. Their corrections remain items 38 and 77.
  - Items 149–154 are new: Prasad's Theorem (T), Tits' normal subgroup theorem, torus approximation, torsor gluing, finite flat groups with affine quotient, and local linearity of reductive groups on a regular surface.
  - Items 55 and 56 (the optional Proposition 3.11(2) and Claim 3.12) are now routed to the proposed Part II.
  - Every missing item is routed exactly once.
- **Mistakes.** Nineteen are recorded (E1–E19).
  - E1–E17 are in the manuscript, and E10 and E16 are already in Gille's errata of 26 May 2026.
  - E18 is in the errata itself: its witness series is t/(x − t).
  - E19 is in HHKP20.
- **Gaps.** G1 and G3 became E3 and E13. G2 is closed: Prasad 1982 was read, and the proof's repair is recorded in E8 and item 57. G4 was already resolved.

## Resume

The job is complete. For a reviewer or a later worker:

1. Check E13 against §1.1(b)'s convention that ∆₀ is the type of a minimal parabolic.
2. Check E14: Corollary 4.7(1) and a singular component of the special fibre.
3. If the published main body becomes available, compare E1–E16 there. Published Theorem B.1 was already compared for E17.
4. Items 150–153 state cited theorems that were not reread: Tits 1964, Harder 1968, Gille–Pianzola 2008, and Bruhat–Tits II with Demazure–Gabriel.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
