# REV-RT-LINK-tauceti_TauCetiRoadmap_ArithmeticDirichletSeries

**Complete: no submitted findings, so 0 confirmed and 0 rejected. The clean result is accepted.**

- Its checks of the 25 links, their quotations and the graph all reproduce.
- One lesser issue was missed, and I record it as an observation for independent follow-up, as the [OrthogonalL2Bases verification](../redteam/RT-LINK-tauceti_Completed_OrthogonalL2Bases.review.json) did. The accepted restructuring RS-17 put four edges ADS.8 → DWP into the atlas, which contradict this map's overlap 7. The red team said that overlap "remains justified" and did not notice the edges.
- The observation concerns RS-17 rather than this map. It is not a confirmed finding and does not by itself create a fix job.

- **Job:** Refs #4352.
- **Verifier:** Claude Code, session `cc-f805bf`, 30 September 2026.
- **Independence:** other sessions did the work checked here:
  - the link map (ChatGPT Pro `cgp-a70a276fbaff`);
  - its review (Codex `codex-hjdg0j`);
  - the red team (Codex `codex-J6LwjP`).

  The string `cc-f805bf` occurs in none of the red-team files, the link map or its review.
- **Disclosure:** this session did two pieces of related work:
  - It red-teamed the Gamburd–Magee–Ronan 19 extraction (PR #4787). Its finding concerned the Tauberian Part II from WOOD-19 route 10.
  - It wrote FIX-RT-AUDIT-07, the analytic/sieve library audit fix.

  Neither touches an endpoint of this map's links, and neither is the AUDIT-08 coverage this map relies on.
- **Verdicts:** [`research/blueprint/redteam/RT-LINK-tauceti_TauCetiRoadmap_ArithmeticDirichletSeries.review.json`](../redteam/RT-LINK-tauceti_TauCetiRoadmap_ArithmeticDirichletSeries.review.json).

## Evidence read

- The red-team result and report at main `3a93019f`.
- The target link map, byte-identical to its promoted `data/links` copy. Its last change (`fd4797c8`) precedes the red team's input `155bf2c1`, so the red team attacked the current map. I read:
  - its summary, screen, review block and all 25 links;
  - all seven overlaps and the examined records for AnalyticNumberTheory, AutomorphicLFunctionsAndLocalFactors, DeligneWeightsAndPurity and NumberFieldArithmetic.
- The original handoff (for its exclusions) and the ArithmeticDirichletSeries README, in particular Layers 7 and 8, "Not owned here" and the consumer sentence.
- The atlas descriptions of every endpoint of links 17–25, of Chebotarev Layer 6, of AN.3, AN.4 and their refinements, and of DWP.0–10.
- The accepted restructurings RS-07 and RS-17: their links touching ArithmeticDirichletSeries, RS-17's DWP.2 layer record and its report.
- `build.assemble` and `merge_links`, run in memory.
- The pinned Mathlib `082e2d3` and Tau Ceti `f790474` sources for the declarations the red team read.

No Lean was compiled.

## What holds

**The `checked` list is real.** I reproduced its objective items:

| Check | Result |
| --- | --- |
| `check_links` | 25 links, 7 overlaps, 218 examined, 0 errors, 0 warnings |
| Link quotations | 54 of 54 literal: 50 in stage descriptions, and 4 in the AutomorphicLFunctionsAndLocalFactors document (the shared "Consume GlobalNumberFields…" passage for links 18–21, allowed by section 10). Each of those four links also has a stage-specific consumer quotation. |
| Production graph | 2,840 stages and 8,007 edges. All 25 pairs are edges with atlas endpoints and appear in the consumers' `requires`. No deferred link touches the roadmap. |
| Cycles | The assembled edges, all `requires` entries and the 36 research link maps (8,118 edges) form an acyclic graph, and no target link has a reverse path |
| Sibling pairs | The map has no `alreadyRecorded` or `existingLinks`. The one sibling pair the report relies on (ADS.5 → Chebotarev 10, from the accepted Chebotarev map) is an atlas edge. |

So the failure found for LieGroups and OrthogonalL2Bases does not occur here: every recorded pair reaches the atlas.

**The library statements hold at the pins.**
- Mathlib `082e2d3`:
  - `NumberField.Set.primeIdealZetaSum`, `HasDirichletDensity` (the ratio to the all-prime sum as s → 1⁺) and `dirichletDensity`;
  - `NumberField.Ideal.tendsto_norm_le_div_atTop₀`.
- Tau Ceti `f790474`:
  - `IdealCountingLinearBounds`, `idealCount_linearBounds` and `abscissaOfAbsConv_normCoeff_one`;
  - `normCoeff_convolution` and `convolution_one_eq_iff`;
  - `NumberField.card_ideal_absNorm_le` and `frobeniusPrimePowerSet`.

All exist as the red team describes.

**The spot-checked links are sound.** Links 17–25 point from prerequisite to consumer, and each reason leaves the rest of the work with the consumer:
- the character adapter (GN.9 → ADS.0);
- Tate/Godement–Jacquet continuation (AL.1, AL.2);
- the eigenvalue bound (AL.4);
- exceptional zeros (AL.5);
- Mellin theory (AN.0);
- zero-free regions (AN.2);
- the regulator formula (ER.5);
- evaluation at −1 through continuation (B.7).

**The omission search holds.** I screened the keywords over all 2,840 atlas stages, including build-time refinements. Every unlinked hit falls into one of three groups:
- a refinement of AN.3 or AN.4, whose parent layer already receives RS-07 edges from ADS Layers 1, 3–7 and 10;
- a different carrier, such as function-field Euler products, the Hermite/Wiener basis or PDE Perron;
- Chebotarev Layer 6, which the handoff excludes on purpose. Its predicate is Mathlib's, normalized through Chebotarev 3.

The README's named consumers `LFunctions` and `ZerosOfLFunctions` are not atlas roadmaps, and the handoff says so.

## Missed issue: RS-17's ADS.8 → DWP edges contradict overlap 7

**The edges.** Of the 39 edges touching ArithmeticDirichletSeries:
- 25 come from this map;
- 1 comes from the Chebotarev map;
- 9 come from RS-07. These are consistent with overlaps 4 and 5.
- 4 come from RS-17: ADS.8 → DWP.2, DWP.3, DWP.5 and DWP.6. RS-17 was accepted on 23 September and promoted before the red team's input, so these four were in the assembly the red team ran.

**The conflict.**
- Overlap 7 keeps ADS.8 and DWP.2 separate. It says a common positivity lemma "needs an explicit statement and comparison proof before a dependency is recorded".
- The current DWP.2 text assigns the "positive-series coefficient/radius-of-convergence and meromorphic-pole lemmas used in §§3.3–3.6" to DWP.2 itself.
- None of DWP.2, 3, 5 or 6 mentions Landau, an abscissa or 3-4-1 positivity. DWP.3's density statement is the closed-point one, not ADS.7.
- RS-17 itself imports only "any genuinely applicable Dirichlet Landau theorem" and says "Similar positivity is not the same theorem". That is a conditional supplier, recorded as a hard edge.
- The supplier side is accurate: ADS 8.1 is Landau and 8.2 is the 3-4-1 package. What is missing is any stated use on the consumer side.

**Why it is low severity.**
- The edges create no cycle.
- This map's own position is the correct one.
- The effect is a spurious ordering constraint on DWP.

**Suggested route.**
1. Raise this as a finding against RS-17, for example in RT-RS-17 when it is queued, and obtain independent verification.
2. Either remove the four edges, or keep ADS.8 → DWP.2 only after DWP.2 states the exact comparison. That comparison would derive the power-series radius lemma from ADS 8.1 via t = q^{-s}, with the abscissa-equality hypothesis discharged. Drop the "direct handoff" edges to DWP.3, 5 and 6 unless those stages state a use.
3. Align overlap 7's wording with the outcome.

Do not edit the generated graph by hand.

## Checks

- `python3 scripts/check_redteam.py` on the review file: `ok`.
- `python3 research/blueprint/intake.py check-files` on both deliverables: 0 problems.
- Only these two files are added.

The 218-record examined ledger, the requests R1–R8 and the mathematical reasons of links 1–16 were checked only for quotation, direction and presence. They were not re-certified beyond the red team's own account.
