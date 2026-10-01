# REV-RT-RS-20~3

Independent verification of the red team RT-RS-20~3 (Codex, session `codex-rtOQ9t`, PR #5359) on the accepted
restructuring RS-20~3 (Fargues–Fontaine curves), for issue #5111.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the restructuring RS-20~3 (`cc-39fac3`, PR #3971);
- its review REV-RS-20~3 (`cc-58621d`, PR #4672);
- the red team.

**Disclosure.** My round-2 fix FIX-RT-AREA-padic-1~2 (PR #5269) applied area findings to other blueprints. Its report
listed BP-RelativeFarguesFontaine--RF0 as the owner of RT-AREA-padic-1/17 and /20, and it did not edit RF0 or RS-20.
Findings /2 and /3 here revalidate those area findings.

**Result: all three findings confirmed.** /1 is high, /2 and /3 medium.

## What I read

- **Fargues–Scholze, *Geometrization of the local Langlands correspondence*.** The author PDF
  (<https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf>), SHA-256 `9ab9efbd…ae905`, equal to the red team's.
  I read printed pp. 48 (proof of Proposition II.1.1) and 56 (Proposition II.1.21 and its proof).
- **RS-20.** `research/blueprint/restructure/RS-20.result.json`, specifically the layers RF0:integral-Y and
  RF2:untilts and all 79 links.
- **The node RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness**, in `data/decompositions/RelativeFarguesFontaine.json`
  and in the RF0 packet.
- **R06.1's node bdr-plus-of-perfectoid-affinoid-algebras**, in `data/decompositions/PadicHodgeTheory.json`.
- **The earlier verdicts:** RT-AREA-padic-1/17 and /20, and RT-AREA-padic-2/21.
- **Mathlib** `Mathlib/RingTheory/Perfectoid/BDeRham.lean` at 082e2d3.
- **The assembled stage graph:** `data/atlas.json` requires and stageEdges, plus RS-20's links. RF2:untilts has 67
  ancestors there.

## /1 (high, error): the root extension in the integral chart. Confirmed.

**The source (p. 48)** gives A⁺₀ = (W_{O_E}(R⁺) ⊗̂ O_{E_∞})[(π/[ϖ])^{1/p^∞}]^∧, with the roots taken of the whole
quotient, and t₁^♯ = π/[ϖ].

**The node** has two defects:
- its proof step 3 adjoins π^{1/p^m}/[ϖ], although its own next relation π^{1/p^m} = [ϖ]^{1/p^m} t₁^{1/p^m} needs
  π^{1/p^m}/[ϖ]^{1/p^m};
- its last step has the reciprocal [ϖ]/π.

**Why the printed generators fail.** On the chart |π| ≤ |[ϖ]| ≠ 0, at a point with |π| = |[ϖ]| = c < 1, the printed
generator has absolute value c^{1/p^m − 1} > 1. So it is not in A⁺, and its p-th powers are not compatible.

**What RS-20 corrects.** Its accepted reason orders only the reciprocal corrected. The fix must also correct step 3.

## /2 (medium, missing): Div¹ properness and smoothness. Confirmed.

RF2:untilts keeps "source-qualified Div^1 properness/smoothness obligations". Proposition II.1.21's proof uses
[Sch17a, Prop. 24.5] for cohomological smoothness and [Sch17a, Prop. 18.3] for properness. Neither
DiamondEtaleCohomology:C4 nor DiamondSixOperations:S5 is an ancestor of RF2:untilts.

This is RT-AREA-padic-1/17, confirmed, whose fix proposed a late stage RF2:div1-properness. RS-20~3 does not carry it.
Make the fix once, with the /17 fix.

## /3 (medium, duplicate): reuse of R06.1's affinoid period rings. Confirmed.

RF2:untilts is supplied only by P1 and RF2:integral-divisors, and R06.1 is not an ancestor. R06.1's node constructs
A_inf, B_dR⁺ and B_dR for perfectoid affinoid (K, K⁺)-algebras over any perfectoid K of characteristic 0, not only C_p.

Mathlib's BDeRhamPlus and BDeRham are carrier definitions; they do not carry those theorems. This is the scoped gap of
RT-AREA-padic-1/20 and RT-AREA-padic-2/21. The fix keeps RF2's all-E, integral and equal-characteristic work, as the
/21 verdict asked.
