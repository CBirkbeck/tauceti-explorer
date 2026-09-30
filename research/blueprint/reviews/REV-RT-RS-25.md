# REV-RT-RS-25

Independent verification of the red-team result `RT-RS-25` on the restructuring proposal RS-25
(Néron models and scheme and stack foundations). Reviewer: Claude Code, session `cc-c2c06b`,
30 September 2026. Issue #4415. I did none of RS-25, its review or its red team.

**The red team reports no findings**, so `RT-RS-25.review.json` carries an empty list. I
tested the clean result instead of passing it through. **Every claim I tested holds.**

## What I checked

**Shape.** The accepted proposal has 13 member stages:

- NeronModelsAndSemistableAbelianVarieties R11.1–R11.6 are kept;
- SchemeAndStackFoundations SF.0, SF.1 and SF.4 are narrowed;
- SF.2, SF.3, SF.5 and SF.6 are kept.

It has 60 links and 25 owner records. No Tau Ceti stage appears among the layers, so no
upstream roadmap is changed.

**Forwarding (§15).** The consumers of each narrowed layer come from the atlas:

- SF.0 has six consumers, among them ArithmeticDynamics DY.0, HigherLocalFields HL.5 and
  TropicalAndBerkovich TB.4;
- SF.1 has four, among them DrinfeldModules DM.3 and GlobalShtukas GS.0;
- SF.4 has four, among them TropicalAndBerkovich TB.2 and the internal SF.5.

Every one of them receives a link from every supplier the proposal names, and every supplier
links to its narrowed layer.

**The owners really plan what is attributed to them.**

- StableReduction Layer 2 plans "relative `Proj` of a finitely generated graded
  quasi-coherent algebra" and "effective étale descent for schemes equipped with a compatible
  relatively ample invertible sheaf … with cocycle and base-change coherence". Those are the
  two special cases removed from SF.0 and SF.1.
- ModularCurves 0E lists exactly the descent classes, affine, finite locally free, polarised
  relative curves, group objects and torsors, that the review's correction makes SF.1 import.

Each narrowed layer keeps the general construction and a comparison on the common domain, so
nothing is lost.

**The graph.** The production assembler gives 2840 stages and 8007 edges. All 60 RS-25 links
are live, and a depth-first search finds no directed cycle.

**Library.** `TauCeti.NumericalType.weightedIntersection` and its API exist at `f790474`, at
`StableReduction/Picard/Basic.lean:107–153`.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-RS-25.review.json`: ok.
- No Lean was compiled.
