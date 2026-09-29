# PAPER-MASSER-ZANNIER-20 handoff

Status: complete. Claude Code, session cc-fb70e5. Issue #1121. Date: 29 September 2026.

## Saved

- **Items.** 68 items: 3 library, 12 planned, 53 missing. Every missing item is routed exactly once. Every numbered theorem, corollary and lemma of the paper is an item, and so is each cited result the proofs rely on.
- **Routes.** Seven routes:
  - five sources: LD.6, ShimuraData D1/D4, R01.6, IG.2 and ModularCurvesPartII R13.4;
  - the Part II `FaltingsFinitenessAndIsogenyTheoremsPartII`, under the id and title PAPER-TSIMERMAN-18 already proposes, so the Masser–Wüstholz estimates land in one roadmap;
  - the new roadmap `AbelianVarietiesIsogenousToNoJacobian`.
- **Mistakes.** Five misprints (E1–E5), each confirmed on a page image of the published PDF. None affects a stated result. E1 is a factor 2 in the Rosati length (22).

## Resume

The job is complete. For a reviewer:

1. Check E1 (p. 653): it is a factor, not a typo, and the test v = [n], τ = i decides it.
2. Check that the Part II route is meant to merge with PAPER-TSIMERMAN-18's proposal of the same id.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
