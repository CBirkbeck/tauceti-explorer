# RT-AREA-arithmeticgeometry-2 — red team of Curves, abelian varieties and Shimura varieties, part 2 of 3

**Result: two findings, both medium, and both objects that no layer in the atlas names. One of them the atlas already knows about — its route is marked UNACCEPTED and asks for an ownership decision.**

Red team: Claude Code, session `cc-fb70e5`, 24 September 2026. Target: part 2 of 3, **7 roadmaps, 47 stages, 65 accepted paper routes**.

| roadmap | stages | routes | prereq | consumers | audit verdicts |
|---|---|---|---|---|---|
| `InverseGaloisAndArithmeticFundamentalGroups` | 7 | **30** | 3 | 2 | 1 partly, 5 not, 1 process |
| `HeightsRationalPointsAndObstructions` | 7 | 15 | 6 | 4 | 6 not, 1 process |
| `FaltingsFinitenessAndIsogenyTheorems` | 6 | 6 | 7 | 3 | 6 not |
| `NeronModelsAndSemistableAbelianVarieties` | 6 | 6 | 3 | 9 | 6 not |
| `AnabelianGeometryAndNonabelianChabauty` | 7 | 4 | 7 | 1 | 6 not, 1 process |
| `ArithmeticDynamics` | 7 | 2 | 5 | 1 | 2 partly, 5 not |
| `EffectiveDiophantineMethods` | 7 | 2 | 7 | 1 | 7 not |

**Eligibility measured:** none of the papers this session has reviewed routes into this part — unlike part 1, where `PAPER-VANHOFTEN-24` required a disclosure. No entanglement.

The routing is very uneven: `InverseGalois…` takes **30 of the 65 routes** across 7 stages (IG.0 10, IG.1 9, IG.2 6, IG.4 5, IG.3 4), which is the densest concentration I have seen in any area, and both findings are there.

## Attack 1 — a systematic scan for routes that record their own unmet need

This is the pattern that produced the sharpest findings in the Analytic area, so I ran it over all 65 reasons rather than reading only the hot stages: `UNACCEPTED`, "does not name", "does not own", "no owner", "ownership decision", "needs a separate", "not supplied by". **Three matched.** One is finding 2. The other two are ordinary disclaimers deferring to an owner that exists (`TSIMERMAN-18`: "LD.6 consumes this interface and does not own a second ordinary height construction") — and one was a lead that dissolved, below.

## Attack 2 — omissions. **Findings 1 and 2.**

### Finding 1, medium — the pro-étale fundamental group has no owner

`IG.0` constructs "the **profinite** automorphism group of the geometric fibre functor on **finite** étale covers … its equivalence to finite continuous sets". The pro-étale fundamental group is a different object: it classifies locally constant sheaves rather than finite covers, is prodiscrete rather than profinite, and carries its own hypotheses on the scheme.

`PAPER-CARAIANI-SCHOLZE-17` routes to IG.0 and says so itself:

> "This route **widens it** to the pro-étale fundamental group of Bhatt–Scholze for connected, locally topologically noetherian schemes, with the equivalence between J_b(Q_p)-torsors on S_proét and continuous homomorphisms π₁^proét(S, x̄) → J_b(Q_p), used in Proposition 1.13 and Remark 4.3.14."

**Nothing owns it**, checked under the descriptions it would travel under:

| search (both roadmap directories) | files |
|---|---|
| `pro-étale fundamental` / `proetale fundamental` (+ accented forms) | **0** |
| `geometrically unibranch`, `infinite Galois category` (its hypothesis and framework) | **0** |
| `pro-étale` | 18 — all the pro-étale **topology/site** in adic, prismatic and ring-stack roadmaps |
| `Bhatt–Scholze` | 6 — and the only citation of *The pro-étale topology for schemes* in a related context is `EnhancedDerivedSheaves`, for **§3's replete-topos results** ("exactness of inverse limits of surjections, convergence of derived Postnikov towers, and unbounded cohomological descent") |

That last row is the one that mattered: the atlas does cite the right paper, for a different part of it and a different purpose. Counting citations would have hidden the gap; reading them showed it.

### Finding 2, medium — finitely generated closed normal subgroups of absolute Galois groups

The atlas already records this gap. `PAPER-SCHMIDT-STIX-16`'s route to IG.2:

> "**UNACCEPTED candidate:** IG.2 owns ordinary Hilbert irreducibility. The substantially stronger assertion about finitely generated closed normal subgroups of absolute Galois groups needs a source-level derivation, its exact field hypotheses and **an ownership decision**. The checked number-field argument uses FJ08 16.11.6 and Weissauer's theorem; **another extraction's planned tag does not establish this contract** (G2)."

The final clause is worth weight: a second extraction has tagged this as planned, and this one records that the tag does not establish the contract — so the gap has been noticed twice, from opposite directions, and remains unowned. `closed normal subgroup` returns 4 files and none is this statement (profinite quotients and relator-generated subgroups in `ProfiniteProPGroups`; topologically characteristic subgroups in `BelyiMaps`; Hochschild–Serre in `ArithmeticGaloisDuality`; subgroups of SL₂ and of symplectic products in `MordellLawrenceVenkatesh`).

IG.2 is the wrong home as scoped — the statement is about absolute Galois groups, not Hilbert sets, and Hilbert irreducibility does not imply it — so the fix is the ownership decision the route asks for, plus reconciling the other extraction's planned tag.

## Attack 3 — a lead that dissolved, because another red team got there first

`PAPER-BRESCIANI-24`'s route says the geometric application "imports the generic split-completion theorem from the **proposed** ProfiniteProPGroups Part II; this source route does not own that generic theorem". No such roadmap exists in either directory, and `split-completion` returns **0** files across all roadmap records — which reads as a dependency on something absent.

**It is not a finding.** The paper extraction itself *proposes* a new roadmap, `ProfiniteProPGroupsPartIISplitCompletion` with 7 items, which is the programme's mechanism for exactly this. And `RT-AREA-grouptheory` has already examined that proposal, recording in its `checked` list that its title "is an exact prefix extension of the parent's atlas title". The need is both raised and already reviewed; filing it here would duplicate accepted work.

## Attack 4 — bookkeeping and the library boundary. Clean.

**Bookkeeping:** for every one of the seven roadmaps, the set of roadmaps reached by a cross-roadmap stage `requires` edge is contained in its declared `prerequisites` — no stage edge unrecorded. Declared prerequisites run 3–7 and consumers 1–9, so no roadmap here has the empty-`consumers` shape that needed a sink check in the Analytic and part-1 areas.

**Library boundary:** 44 of 47 stages are audited `not built`, including all of `EffectiveDiophantineMethods` (7/7), `FaltingsFinitenessAndIsogenyTheorems` (6/6) and `NeronModels…` (6/6). Frontier material, so there is almost nothing for a stage to duplicate — the same situation as part 1 and the opposite of the Elementary area.

## A cross-area observation, recorded rather than filed

`PAPER-SCHMIDT-STIX-16` now has **two UNACCEPTED routes in two different areas**, each blocked for want of an owner: finding 2 here, and its `AnalyticNumberTheory:AN.4` route, which `RT-AREA-analytic` filed because the arithmetic-scheme form of Chebotarev density has no owner. One paper generating two ownership gaps in different areas suggests its remaining content deserves a deliberate ownership pass rather than route-by-route triage. That is a programme-level observation, not a finding about this area, so it sits here and in `checked` rather than among the findings.

## What this red team did not do

I did not re-derive the mathematics of any stage. Omissions were tested against the 65 routed papers and the roadmaps' own targets, so an omission no routed paper needs would not surface — the line I also drew in the Analytic area for Davenport–Heilbronn. Duplication was checked within this part and against the part-1 roadmaps I read for `RT-AREA-arithmeticgeometry-1`, by scope sentences rather than by comparing all 47 stage texts pairwise. The library boundary was spot-checked on the 3 stages that are not `not built`; the other 44 cannot duplicate anything. "Targets out of date with the literature" was checked only where a route reason raises it. Every library number here comes from a full Mathlib checkout of 8556 `.lean` files and the Tau Ceti tree of 5268, with the file count printed beside each result.
