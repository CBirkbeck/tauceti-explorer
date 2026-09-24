# RT-AREA-automorphic-2 — red team of Modular and automorphic forms, part 2 of 2

**Result: one finding, medium. Four apparent findings dissolved on calibration — one of them a phantom created by my own indexer — and the bookkeeping heads are clean.**

Red team: Claude Code, session `cc-fb70e5`, 24 September 2026. Target: part 2 of 2, **8 roadmaps, 79 stages, 20 accepted paper routes**.

| roadmap | stages | routes | prereq | consumers | audit verdicts |
|---|---|---|---|---|---|
| `tauceti:…/ModularForms` | 16 | 0 | 1 | 6 | 1 built, 8 partly, 7 not |
| `HilbertModularVarietiesAndShimuraCurves` | 13 | 4 | 11 | 13 | 12 not, 1 process |
| `HabiroNahmSeries` | 11 | 0 | 4 | 1 | 1 partly, 6 not, **4 unaudited** |
| `AutomorphicBundles` | 9 | 3 | 5 | 7 | 1 partly, 8 not |
| `OverconvergentAutomorphicForms` | 9 | 1 | 10 | 0 | 9 not |
| `PadicFamilies` | 8 | 4 | 10 | 11 | 1 partly, 7 not |
| `QSeriesPartitionsAndMockModularForms` | 7 | 4 | 7 | 0 | 1 partly, 6 not |
| `AlgebraicModularFormsAndSerreWeights` | 6 | 4 | 4 | 3 | 6 not |

## A job I declined, and why

**Part 1 of this area (#1491) is not eligible for me.** `PAPER-LE-LEHUNG-LEVIN-ETAL-23` routes to three of its eight roadmaps, and I **authored** content in that extraction — its proofSteps, and the A71–A73 continuation — rather than merely reviewing it. Since §17's omissions head would have used my own extraction's route reasons as evidence, I skipped it and took part 2, whose eight roadmaps receive no route from any paper I have written or reviewed.

**20 routes across 79 stages is thin** — a quarter of the density of the Function fields area — so the omissions head had much less to work with here. I say that rather than present a thin pass as a clean one.

## Attack 1 — omissions. **The finding.**

### Medium — Shimura's bounded-denominators theorem is stated by no node

`R15.2` plans the integral q-expansion principle and the finite generation of spaces of forms. The route that needs the companion statement records the gap precisely:

> "R15.2 plans the integral q-expansion principle and the finite generation of spaces of forms. **Shimura's bounded-denominators theorem** [Shi71, Theorem 3.52] is the companion statement at every prime. **The R15 decomposition imports it without a node**, and it also **closes the finite-freeness gap recorded there** for the Deligne–Serre module." — `CALEGARI-DIMITROV-TANG-25`

**A second roadmap records the same absence from its own side**, which is what lifts this above a one-paper naming point:

> "This includes Hilbert modular Eisenstein series, their algebraic Fourier coefficients, q-expansion principles, the relevant congruences and **the distribution/bounded-denominator theorem**. These general Hilbert modular constructions **must be imported from a verified supplier or implemented as the Iwasawa proof's explicit prerequisite**; weight-two quaternionic forms alone do not supply them." — `IntegralIwasawaTheory`

**Nothing owns it**, and the near-miss is worth stating because it would have dissolved the finding:

| search | result |
|---|---|
| `bounded denominator` (any spelling) | 2 files, **neither this theorem** — `HeegnerPointEulerSystems` uses "bounded-denominator derivative classes" in Kolyvagin's Euler-system sense; `IntegralIwasawaTheory` is the roadmap quoted above, recording the need |
| `Shi71` | **0** |
| Shimura Theorem 3.52 | 1 file — `tauceti:…/ModularForms`, but for a **different statement** |

That last row nearly settled it the other way. `ModularForms` cites "Shimura Thm 3.48/3.51/3.52; Miyake §4.5" as *source support* for its own target that the coefficient field of a newform is a number field, proved via the integral Hecke algebra being a finitely generated ℤ-module — and it even instructs "cite the section, not a single theorem number". A source citation for a neighbouring statement is not a node stating bounded denominators, so the finding stands; but a reader who matched on the theorem number alone would have concluded the opposite.

## Attack 2 — a phantom of my own making, and how it collapsed

Two roadmaps here have stage `requires` entries not in their prerequisites: `HabiroNahmSeries:HB.5a` requires `UPSTREAM:ModularForms-finite-index-subgroups`, and `QSeriesPartitions…:QM.6` requires `UPSTREAM:RepresentationTheory`. Neither is a resolvable stage id.

**Calibration dissolves it.** `UPSTREAM:` is an atlas-wide convention for an upstream dependency that is not an atlas stage — **29 roadmap files, 25+ distinct targets** (`UPSTREAM:ECD` 48 times, `UPSTREAM:CohomologicalPointCounting` 42) — and in both cases the roadmap declares the corresponding roadmap at prerequisite level.

Then a broader sweep appeared to show **85 `requires` targets resolving to no stage**, including `MordellLawrenceVenkatesh:LV.0`–`LV.5` (26 references) and `AnalyticStacks:AS.4`. That would have been a serious dangling-reference finding. **It was my indexer.** Those files store stage keys *bare* (`key: 'LV.0'`, `id: null`) while references use the *qualified* form — exactly the trap I recorded when red-teaming the AdicSpaces link map. Indexing both forms (8610 identifiers) leaves **zero** non-`UPSTREAM` requires targets unresolved: **the atlas's stage-edge graph resolves completely.**

This is the fifth phantom my own tooling produced in this session, and the one I came closest to filing.

## Attack 3 — the opaque-handle test. Clean, and it refines the earlier finding.

I promoted this to a standing check after it produced a high-severity finding in part 3 of the arithmetic-geometry area. `ModularForms` contains fourteen `#NN` references and `AlgebraicModularFormsAndSerreWeights` one — but **reading them shows they are not roadmap references**: ModularForms' are its own **internal item numbers** ("Eisenstein series with character (#37)", "The coefficient field … of a newform (#34)", "Hecke characteristic polynomials (#35)", "Satake parameters and angles (#32)", "Inner twists (#42)", "Labels (#33, #13)", "Bad primes (#54)"), and its one genuine cross-roadmap reference names the roadmap as well as the number — "the consumer is the **automorphic-representations roadmap, TauCetiRoadmap PR #120**".

The single `#81` sits inside a stageEdge title inherited from `ModularCurvesPartII` ("Integral coarse spaces and comparison with #81"), so it is the defect already filed in `RT-AREA-arithmeticgeometry-3`, not a new one — and that roadmap does declare `ModularCurvesPartII` as a prerequisite.

**This does refine the earlier finding:** `#NN` in the atlas is ambiguous between an internal item number and a pull-request number, which is part of why the `ModularCurves` dependency was hard to see.

## Attack 4 — bookkeeping and audit coverage. Clean.

**Sink checks, one per roadmap declaring no consumers, all correct:** `OverconvergentAutomorphicForms` is cited by exactly the ten roadmaps it declares as prerequisites; `QSeriesPartitions…` by exactly its seven; and `HabiroNahmSeries` is cited by five, of which the one non-prerequisite is `ArithmeticQuantumTopology` — precisely what it declares as its single consumer. For every roadmap the cross-roadmap stage edges are contained in the declared prerequisites.

**Audit coverage**: `HabiroNahmSeries` has 4 of 11 stages absent from the accepted audit. Within norms and not a finding — **1316 of 1962 atlas stages are audited (67%)**, and of 210 roadmaps 125 are fully audited, 21 partially and **64 not at all**. Audits are separate jobs.

**Library boundary**: 61 of 79 stages `not built`; the built and partly-built stages concentrate in `ModularForms`, the classical end, which is explicit about consuming what exists — it marks material already in the library as such, noting of the coefficient field that "This is already constructed and proved in AINTLIB".

## Attack 5 — two gap-shaped phrasings that are not gaps, and four proposals already in the queue

`CALEGARI-GERAGHTY-20`'s route says its Lemma 8.14 "uses such a formula **without citation**" — but that formula is one R15.3 is already instructed to construct, so the missing citation is the paper's, not the atlas's. `DASGUPTA-KAKDE-VENTULLO-18` routes "three facts about Hida families … that the paper uses without proof" to L5, which owns the Hida control theorem over totally real fields, so they land inside a stated target.

`CALEGARI-DIMITROV-TANG-25` also carries **four `part-ii` routes** raising unowned material through the programme's own mechanism: noncongruence modular forms extending `ModularForms`' finite-index-subgroup theory, "which no roadmap develops further"; the λ-covering ℍ/Γ(2) ≅ ℂ∖{0,1}, "planned here because no layer plans it"; arithmetic algebraization, which "DT.0–DT.5 do not cover"; and a `ConformalMapping` Part II. These are proposals under review, so filing them would duplicate work already queued — as with `BRESCIANI-24`'s ProfiniteProPGroups Part II in part 2 of the arithmetic-geometry area.

## What this red team did not do

The omissions head is weak here for want of material — 20 routes across 79 stages — so an omission the routes do not raise would not have surfaced. I did not read all 16 `ModularForms` stages in full; I read its layer structure, its scope and the passages the `#NN` and Shimura checks turned on. I did not verify the audit's 12 partly-built verdicts declaration by declaration, and I could not run the library-boundary head at all on `HabiroNahmSeries`' four unaudited stages. Duplication was checked within the area and against the roadmaps its members declare as prerequisites, by scope and route disclaimers rather than by comparing all 79 stage texts pairwise. "Targets out of date with the literature" was checked only where a route raises it. Every library number here comes from a full Mathlib checkout of 8556 `.lean` files and the Tau Ceti tree of 5268.
