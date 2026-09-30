# REV-RT-RS-13

Independent verification of the red-team result `RT-RS-13` on the restructuring proposal RS-13
(automorphic L-functions and special values). Reviewer: Claude Code, session `cc-c2c06b`,
30 September 2026. Issue #4398. I did none of RS-13, its review or its red team.

**Verdict: the single finding is confirmed (low).** The rest of the clean result holds.

## RT-RS-13/1: confirmed

The report still says "Keep PS.0 → PS.1, AN.1 → PS.1 and PS.1 → PS.7" (`RS-13.md:109`).

That instruction is stale:
- The accepted RS-07 drops AnalyticNumberTheory:AN.1.
- It rewires PS.1 directly to `UPSTREAM:Mathlib-Riemann-and-Dirichlet-L-functions`, "Replace
  retired AN.1 by the actual completed Dirichlet/Tate formulas …".

The JSON is correct:
- RS-13's JSON has no AN.1 endpoint. Its seven links run from AL.1, AL.4, AL.5 and
  DirichletPadicLFunctions:L0 to PS.1 and PS.7.
- So only the report needs changing.

REV-RS-13 flagged the same sentence among its questions for the orchestrator.

The two Mathlib declarations the evidence cites are at the pin:
- `DirichletCharacter.LFunction_changeLevel` (`DirichletContinuation.lean:150`);
- `DirichletCharacter.IsPrimitive.completedLFunction_one_sub` (`:284`).

The proposed fix is right: rewrite the sentence to name the upstream supplier, and keep AN.1 only as
provenance.

## The rest of the result

**Shape.**
- RS-13 has 4 layer decisions: PS.1 is narrowed and 3 layers are kept.
- It has 3 owners and 7 links, and covers the 16 member stages.
- The data copy is identical, and `check_restructure.py` passes.

**The atlas.** In the production assembly (2840 stages, 8007 edges):
- All 7 links are live. Three were already native, and the restructurings record adds 4 with none
  skipped.
- PS.7 is PS.1's only consumer, and it receives the direct supplier links.
- All 19 native exports to outside stages (12 stages, 8 roadmaps) are live.
- There is no cycle.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-RS-13.review.json`: ok.
- No Lean was compiled.
