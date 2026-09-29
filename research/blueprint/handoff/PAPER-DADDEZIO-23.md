# PAPER-DADDEZIO-23 handoff

Status: complete. Claude Code, session cc-fb70e5. Issue #1097. Date: 29 September 2026.

## Saved

- **Items.** 70 items: 7 planned, 63 missing. Every missing item is routed exactly once, and every numbered theorem, proposition, lemma, corollary and definition of arXiv v4 is an item; Remarks 4.4.4 and 5.2.3, which only compare with other work, are not.
- **Routes.** Six routes:
  - the new Part II `PadicDifferentialEquationsPartIIMonodromyGroups`;
  - coalesced Part IIs `PadicDifferentialEquationsPartIIMinimalSlope` (PAPER-TSUZUKI-23) and `GlobalShtukasPartIICrystallineCompanions` (PAPER-ABE-18), with those papers' ids, titles, parents and areas;
  - sources RD.1–RD.3, R07.2 and AN.4.
- **Mistakes.** Nine.
  - E5 is a gap in the proof of Proposition 4.2.12, with a rank-one counterexample to its norm bound. The theorem it serves is independently in Tsuzuki.
  - The rest are misprints.

## Resume

The job is complete. For a reviewer:

1. Check E5 at p. 17 with the example A_n ⊂ W⟨u⟩.
2. Check the split between the two Part IIs: the higher-dimensional MS theorem sits in the monodromy Part II, to avoid a roadmap cycle.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
