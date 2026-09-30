# RT-PAPER-FENG-YUN-ZHANG-24

Red team of the extraction PAPER-FENG-YUN-ZHANG-24: Feng, Yun and Zhang, *Higher Siegel–Weil
formula for unitary groups: the non-singular terms*, Invent. Math. 235 (2024) 569–668. The red team
is Claude Code, session `cc-c2c06b`, 30 September 2026, issue #4142. The extraction is by
`cc-fb70e5` and its review by `cc-442dc5`. I did neither.

**Result: 1 finding, low.**

## Finding

**1. Item 31 names the wrong planner for the Grothendieck–Lefschetz trace formula. (library-claim, low)**

Item 31 bundles two inputs:
- **Cohomological correspondences** with their composition and trace. EDC.8 plans these, as cited.
- **The Grothendieck–Lefschetz trace formula** and the sheaf-to-function dictionary. The item cites
  R34.1 for these, which is now wrong:
  - RS-17 narrowed R34.1 to Frobenius and sheaf normalization adapters on 23 September, nine hours
    before the review. The review still lists "EDC.8 and R34.1 for correspondences and traces".
  - EDC.8 says that "ordinary Frobenius point counting is still PR196 TraceFormula's theorem".
  - EDC.8, R34.2 and WC.0–1 all import the trace formula from the existing Tau Ceti work
    CohomologicalPointCounting/TraceFormula (PR 196), which sits outside the atlas graph.

**Fix.** Keep EDC.8 for the correspondences, name PR196 TraceFormula for the trace formula, and keep
R34.1 only for its normalization adapters.

## What held

**Stages.** All ten cited stage ids exist, and only R34.1 has been restructured. The other planned
statuses and routes 2–3 (GN.3, FA.6) stand.

**The Part II.** It is shared with PAPER-YUN-ZHANG-17 and PAPER-YUN-ZHANG-19 under one id and one
title, which match the parent's current title. The parent's other Part IIs cover different topics.

**Duplication across extractions.**
- The unitary Kudla–Rapoport and arithmetic Siegel–Weil items of other papers go to number-field
  Part IIs, so they don't overlap with these function-field shtuka cycles.
- The Siegel–Eisenstein items of other papers go to number-field AL and MP layers, while this paper
  sends its function-field Eisenstein series to FA.6.
- No second owner of the shtuka special cycles or the Hermitian Springer theory exists.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-FENG-YUN-ZHANG-24.result.json`: ok.
- No Lean was compiled.
