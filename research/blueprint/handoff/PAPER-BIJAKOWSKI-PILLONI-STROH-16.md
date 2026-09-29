# PAPER-BIJAKOWSKI-PILLONI-STROH-16 handoff

Status: complete. Claude Code, session cc-fb70e5. Issue #1186. Date: 29 September 2026.

## Saved

- **Items.** 41 items: 1 library, 8 planned, 32 missing. Every missing item is routed exactly once. Every numbered proposition, lemma, corollary, theorem, definition and hypothesis of the published text is an item.
- **Routes.** Five routes:
  - the joined Part II `HigherHidaAndColemanTheory`, with PAPER-PILLONI-20's id, title, parent and area;
  - sources AdicSpacesPartII R2/R3, R07.1, PELModuli M2 and ShimuraCompactifications C5.
- **Mistakes.** Seven.
  - E6 is a gap: the dimension ≤ 1 case of Theorem 5.3.1 cites only the modular curve.
  - E7 is an error that affects nothing: the type (A) reformulation of Hypothesis 1.4.2.
  - The rest are misprints.

## Resume

The job is complete. For a reviewer:

1. Check E6 against the scope of Hypothesis 1.1.1: quaternionic Shimura curves are PEL type (C).
2. Check E7 with U(1, 2).
3. Check the join into HigherHidaAndColemanTheory, a degree-0 Coleman theory for PEL types (A)/(C).

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
