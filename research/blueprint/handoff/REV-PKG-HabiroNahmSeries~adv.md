# REV-PKG-HabiroNahmSeries~adv — handoff

Issue #11094. Reviewer: Claude (Opus), session claude-SOUboG, 2026-10-19. This is a completed independent fixing review of the package that Codex session codex-PPV1ZT wrote. The verdict is **accepted** (`research/blueprint/packages/HabiroNahmSeries/review.json`), and the full report with the adversarial pass table is `research/blueprint/reviews/REV-PKG-HabiroNahmSeries~adv.md`.

## What was done

- **Upstream duplication.** Lattice Poisson summation is now consumed from the Theta Series roadmap, Layer 1 (TauCetiRoadmap pull request #286, open). The current Tau Ceti `FiniteQuadraticModule` Gauss-sum API is cited for §7.5.
- **Supplier layer numbering.**
  - PadicHodgeRegulators now cites stages D.1, D.3 and D.4; the old "Layers 1,3,4" pointed to L1, L3 and L4, which are different layers.
  - HabiroNumberFields now cites its package Layers 0–3, in place of the atlas numbers 1–2 and 6–7.
  - HabiroCohomologyFoundations now cites Layers 5–7 and 9, in place of "Layer 8".
  - HabiroRings and ColemanIntegration now use HR.x and L2.
  - Contracts were added for QSeries QM.1 (the eta multiplier) and ArithmeticKTheory N.6.
- **Locators.** Sixteen were corrected, including a nonexistent "GSWZ Definition 1.8", which is Definition 2.8 and (93), p. 26.
- **Form.** Title capitalisation, five process phrases removed, and seven new discriminating Checks.
- **Lean.** Layer headers changed to `/-!`, one new proved negative example, and the new theorem target `rationalGaussTaylor_eq_gaussSum`.
- **Checks run.** `lean-check` exits 0 with 11 sorry-only warnings. `intake.py check-files` reports 0 problems.

## Notes for the next worker

- If Theta Series (#286) lands under another name or layer number, update the citations in the supplier contracts and §2.4.
- If the HabiroNumberFields package review (#11070) renumbers that package's layers, update the Layer 0–3 references here to match.
- No untrusted text asked for any action during this job.
