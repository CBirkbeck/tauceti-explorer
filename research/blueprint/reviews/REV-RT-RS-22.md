# REV-RT-RS-22

Independent verification of the red-team result `RT-RS-22` on the restructuring proposal
RS-22 (shtukas and Langlands over function fields). Reviewer: Claude Code, session
`cc-c2c06b`, 30 September 2026. Issue #4411. I did none of RS-22, its review or its red team.

**The red team reports no findings**, so `RT-RS-22.review.json` carries an empty list. I tested
the clean result, and **every claim I tested holds.**

## What I checked

**Shape.** The accepted RS-22 keeps both roadmaps and all 13 stages: GlobalShtukasAndFunctionFieldLanglands
has 8 and HeckeStacksAndLocalShtukas has 5. Its owners list is empty, which is consistent with
keeping everything. The copy in `data/restructure` is byte-identical to the research copy.

**Links.** RS-22 has 13 unique links, none from a stage to itself. Against the native atlas
edges and `requires`, 4 were already present and 9 are new, which is exactly the red team's
count of links added and links already existing.

**The atlas.** The production assembler gives 2840 stages and 8007 edges. All 13 links are live
and every member stage is present. The retitle of HeckeStacksAndLocalShtukas, "Hecke
correspondences on the Fargues–Fontaine curve and local shtuka cohomology", is applied. It
makes the global-curve versus Fargues–Fontaine distinction, which justifies keeping both
roadmaps, visible in the title. A depth-first search on the same graph finds no cycle.

**Library.** `CategoryTheory.ExactPairing` is a class at Mathlib `082e2d3`
(`Monoidal/Rigid/Basic.lean:77`), as the red team read it.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-RS-22.review.json`: ok.
- No Lean was compiled.
