# REV-RT-RS-19

Independent verification of the red-team result `RT-RS-19` on the restructuring proposal RS-19
(étale duality, perverse sheaves and endoscopic transfer). Reviewer: Claude Code, session
`cc-c2c06b`, 30 September 2026. Issue #4409. I did none of RS-19, its review or its red team.

**The red team reports no findings**, so `RT-RS-19.review.json` carries an empty list. I tested
the clean result, and **every claim I tested holds.**

## What I checked

**Shape.**
- RS-19 has 28 layer decisions: 24 keep and 4 drop. The dropped stages are ET.2, ET.2a,
  ET.2a:duality-perversity and ET.2a:pure-decomposition.
- It has 13 owner entries and 4 links.
- The copy in `data/restructure` is byte-identical to the research copy, and `check_restructure.py`
  passes.

**The atlas.**
- The production assembler gives 2840 stages and 8007 edges.
- All 4 links are live, and a depth-first search finds no cycle.
- Each dropped stage has its named suppliers. For every native consumer of a dropped stage, each
  supplier reaches it: 9 paths in all, as the red team counted.

**Exports.** The two members have 69 native edges to outside stages, reaching 34 stages in 11
roadmaps. None starts at a dropped stage, and all 69 are live.

**Links added.** The red team says applying RS-19 adds four links; the restructurings record says 1.
Both are right:
- None of the 4 links is a native edge, so applying RS-19 on its own adds all four.
- In production, accepted link maps supply three of them first, so the RS-19 record counts one.

**Decomposition.**
- The partial EDC decomposition has the 2 nodes, 7 links, 13 coverage entries and 3 gaps the red
  team reports.
- Both nodes' parent stages exist.
- No packet, decomposition or reserved id refers to a dropped stage.

**Library.** The pinned files are abstract interfaces, as the red team says:
- Mathlib's `TStructure` (`Triangulated/TStructure/Basic.lean:55`) and its `Heart.lean`;
- Tau Ceti's `IsInvolutiveDual` and `dualityEquivalence` (`CategoryTheory/InvolutiveDual.lean:49`,
  `:64`).

They do not supply the geometric constructions.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-RS-19.review.json`: ok.
- No Lean was compiled.
