# REV-RT-RS-02

Independent verification of the red-team result `RT-RS-02` on the restructuring proposal RS-02
(abelian schemes and finite flat group schemes). Reviewer: Claude Code, session `cc-c2c06b`,
30 September 2026. Issue #4388. The proposal is by a ChatGPT session, its review by `cc-442dc5`
and the red team by `codex-a71f92`. I did none of them.

**The red team reports no findings**, so `RT-RS-02.review.json` carries an empty list. I tested
the clean result, and **every claim I tested holds.**

## What I checked

**Shape.**
- RS-02 has 13 layer decisions: 9 narrow and 4 keep.
- It has 23 owner entries and 274 distinct links, none from a stage to itself.
- Both members are extensions: AbelianSchemesAndArithmeticModuli extends JacobianChallenge, and
  FiniteFlatGroupsAndIntegralPadicHodgeTheory extends ModularCurves.
- The copy in `data/restructure` is byte-identical to the research copy.
- `check_restructure.py` passes.

**The atlas.**
- The production assembler gives 2840 stages and 8007 edges.
- All 274 links are live. The restructurings record lists 221 added and none skipped, matching the
  red team's count.
- Both Part II titles are applied and all 13 member stages are present.
- A depth-first search on the same graph finds no cycle.

**Exports.**
- In `data/atlas.json`, the member stages have 47 edges to outside stages: 44 stages in 28 roadmaps.
  That is exactly the red team's count, and all 47 are live after assembly.
- The two member packets have 21 and 104 nodes, 125 in all. Every node's parent stage exists.

**Ownership.**
- The Grothendieck–Messing owner entry moves the generic equivalence from R07.6 and A4 to R07.2.
- R07.6's narrowed text imports it from R07.2, as the red team says.

**Library.** The files the red team read exist at the pins and say what it relied on:
- Tau Ceti's `AbelianVariety` is field-level (`AbelianVariety/Basic.lean:94`), which fits RS-02
  extending JacobianChallenge to abelian schemes.
- Tau Ceti's finite-locally-free Cartier duality is over a ring
  (`AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:232–334`).
- Mathlib's `isocrystal_classification` covers only one-dimensional isocrystals
  (`WittVector/Isocrystal.lean:183`). That supports R07.2 importing Dieudonné–Manin from VB0
  rather than from the library.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-RS-02.review.json`: ok.
- No Lean was compiled.
