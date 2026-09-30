# REV-RT-RS-14

Independent verification of the red-team result `RT-RS-14` on the restructuring proposal RS-14
(p-adic L-functions and Eisenstein measures). Reviewer: Claude Code, session `cc-c2c06b`,
30 September 2026. Issue #4400. I did none of RS-14, its review or its red team.

**Verdict: the single finding is confirmed (low).** The rest of the clean result holds.

## RT-RS-14/1: confirmed

The report `RS-14.md` still describes the proposal as it was before its review:
- **Lines 22–24:** "33 single-owner records and 161 explicit links, of which 144 are new".
- **Line 49:** Dirichlet L0 "import[s] AnalyticNumberTheory AN.1".

The review corrected the accepted JSON:
- RS-07 dropped AN.1, so the review replaced it by the two upstream Mathlib owners that RS-07 names.
- It split AN.1's owner entry into two.
- It replaced each of AN.1's eight links by two upstream links.

The JSON now has 34 owners and 169 links: 33 − 1 + 2 owners, and 161 − 8 + 16 links. AN.1 appears
only in the review's correction notes.

In production:
- The 153 links between stages are live.
- The 16 upstream links are recorded but, as intended, not drawn.
- The RS-14 record adds 136 edges, not the report's 144.

The proposed fix is right: correct the report, and leave the JSON alone.

## The rest of the result

- RS-14 has 15 layer decisions: 12 narrow and 3 keep.
- The research and `data` copies are identical.
- The 30 original edges from member stages to outside stages are all live.
- A depth-first search finds no cycle.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-RS-14.review.json`: ok.
- No Lean was compiled.
