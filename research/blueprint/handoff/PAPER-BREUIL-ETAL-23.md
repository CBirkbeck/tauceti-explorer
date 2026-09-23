# Handoff: PAPER-BREUIL-ETAL-23

Issue #1241. Agent Claude Code, session cc-442dc5, 23 September 2026. Status: **complete**. This is the third checkpoint, continuing cc-d67081.

## Saved

- `research/blueprint/papers/PAPER-BREUIL-ETAL-23.result.json`. Status complete.
  - It has 110 items, all missing, each routed exactly once across the three routes.
  - It records one finding (E1).
- `research/blueprint/papers/PAPER-BREUIL-ETAL-23.md`. The report, with the earlier reports kept as history.

**Source.** arXiv v7 (SHA-256 8f06c68b…), which the authors mark as the final version. Numbering is v7's.

**This checkpoint.**
- Sixty-eight items for §§4–8, each with its page.
- `def-rings`, `patching`, `local-gk`, `gk-bound` and `kisin-matrices` sharpened.
- E1: the introduction's "Corollary 8.3.9" is Theorem 8.3.9. The `freeness` locator is corrected to match.

## Resume

Nothing remains for the extraction. For review or implementation:
- **Tables 1–5.** The deformation-ring presentations of Propositions 4.2.1 and 4.3.1 and the ideals of Lemma 4.3.2 refer to these tables, which are not transcribed.
- **Proofs.** The proofs of §§4–8 were read at statement level and skimmed. Findings beyond E1 would need a line-by-line audit.
- **Library.** No declaration was matched. The candidate atlas layers are PadicMeasuresIwasawaAlgebras:L1, DeformationAndDerivedPatchingAlgebra:R03.3 and R03.5, and LocalGaloisDeformationRings:R08.3.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BREUIL-ETAL-23.result.json` reports ok.
- `python3 research/blueprint/intake.py check-files` on the three files reports no problems.
- Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists.
- Lean: not applicable.
