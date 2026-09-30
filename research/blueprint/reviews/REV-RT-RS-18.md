# REV-RT-RS-18

Independent verification of the red-team result `RT-RS-18` on the restructuring proposal RS-18
(algebraic K-theory of schemes and curves). Reviewer: Claude Code, session `cc-c2c06b`,
30 September 2026. Issue #4407. I did none of RS-18, its review or its red team.

**The red team reports no findings**, so `RT-RS-18.review.json` carries an empty list. I tested
the clean result, and **every claim I tested holds.**

## What I checked

**Shape.**
- RS-18 has 36 layer decisions, 18 narrow and 18 keep. There is one for each native member stage.
  The six extra EllipticKTheory stages in the production atlas are decomposition nodes promoted after
  the fact.
- It has 41 owner entries and 223 distinct links, none from a stage to itself.
- The copy in `data/restructure` is byte-identical to the research copy, and `check_restructure.py`
  passes.

**The atlas.**
- The production assembler gives 2840 stages and 8007 edges.
- All 223 link endpoints resolve, and all 223 links are live. Three were already native edges, and the
  restructurings record adds 220 with none skipped, as the red team says.
- EllipticKTheory and KTheoryLowDegrees carry their Part II titles and build on Tau Ceti's
  EllipticCurves and GrothendieckEulerForms.
- A depth-first search on the whole graph finds no cycle.

**Suppliers and exports.**
- Every native consumer of a narrowed layer is reached from each named supplier: 170 paths, none
  missing.
- The members have 34 native edges to outside stages, reaching 27 stages in 9 roadmaps. All 34 are
  live.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-RS-18.review.json`: ok.
- No Lean was compiled.
