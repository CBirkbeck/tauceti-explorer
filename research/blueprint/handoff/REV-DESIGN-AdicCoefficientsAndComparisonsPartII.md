# Handoff: REV-DESIGN-AdicCoefficientsAndComparisonsPartII

Independent review of the new roadmap *Adic coefficients and comparison with schemes, Part II: prime-to-degree
alterations* (issue #3486), by Claude (Opus 5.5), session claude-EzBIka, 2026-10-19. The design was done by
claude-ddRwUd (issue #3386, PR #10601).

## Done

- Verdict **accepted**. The packet's top-level `review` names `independent-review-REV-DESIGN-AdicCoefficientsAndComparisonsPartII`. Its per-node checks record 45 nodes verified, 18 corrected and none added.
- All corrections are recorded in `research/blueprint/reviews/REV-DESIGN-AdicCoefficientsAndComparisonsPartII.md`. They were made in place in the four reviewed files: packet, roadmap definition (review reading notes only), reader and suggested Lean file.
- Source issues: E1–E12 confirmed with verdicts. E2, E3 and E5 were rewritten in our own words. E13 was added (ILO X §2.6, a misprint in the chart ranks).
- Checks:
  - `check_blueprint.py` with the pinned index: 0 errors, 0 warnings.
  - `intake.py check-files`: 0 problems.
  - `lean-check`: exit 0, only admitted-proof warnings.
  - A dry atlas assembly adds 28 stages and 43 edges, with no skipped links.

## For the orchestrator and later jobs

- **Ownership.** PA.0 now owns finite-type flattening (Stacks 081R and 0815), the non-separated Chow lemma and universal resolvability in dimension ≤ 3 (Cossart–Jannsen–Saito Corollary 0.4, Cossart–Piltant). The `rescope` entry in the packet's `restructure` asks the SchemeAndStackFoundations Part II design (#3361) to import them or take them over. Other consumers should import from PA.0 meanwhile: PAPER-BHATT-ETAL-23 route 2, PAPER-BHATT-18 route 6 and the MotivesAndAlgebraicCycles flattening request.
- **Re-pointing.** Once this packet is promoted, two consumer gaps should point here:
  - HigherLocalFieldsAndHigherClassFieldTheory G13, to `PA.6/prime-to-ell-variety-alteration`;
  - LogicAndDefinabilityInNumberTheoryPartII G-ALT, to `PA.6/odd-degree-model-alteration`.
- **Gap G1** stays open: the global projectivity of the Cossart–Piltant resolution for non-affine schemes. The affine case is covered by Cossart–Piltant Remark 1.4.
- Tau Ceti `AffineInvariantQuotient`, cited through ModularCurves 0C, is in Tau Ceti main but not at the pin f790474.
