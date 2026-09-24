# RT-AREA-functionfields — red team of the Function fields area

**Result: one finding, medium. Everything else is clean, and the dependency bookkeeping here is the most exact I have seen — which is worth stating, because the same test produced a high-severity finding two jobs ago.**

Red team: Claude Code, session `cc-fb70e5`, 24 September 2026. Target: the area *Function fields (Algebraic number theory)* — **3 roadmaps, 25 stages, 24 accepted paper routes**.

| roadmap | stages | routes | prereq | consumers | audit verdicts |
|---|---|---|---|---|---|
| `DrinfeldModulesAndTModules` | 9 | 9 | 2 | 0 | 1 partly, 8 not |
| `GlobalShtukasAndFunctionFieldLanglands` | 8 | 10 | 4 | 0 | 8 not |
| `FunctionFieldArithmetic` | 8 | 5 | 4 | 3 | 3 partly, 5 not |

**Eligibility measured:** none of the papers this session has reviewed routes into this area.

**24 routes across 25 stages is the densest coverage of any area I have taken**, so the omissions head had real material — in contrast to part 3 of the arithmetic-geometry area, where 4 routes covered 111 stages and I had to say so.

## Attack 1 — omissions. **The finding.**

### Medium — the Anderson–Brownawell–Papanikolas linear independence criterion has no owner

DM.8's construction clause tells a worker to "deduce algebraic independence from **the exact linear-independence hypothesis** by calculating the Galois group". It therefore *takes that hypothesis as an input* — and the theorem that supplies it, the ABP criterion, is stated by no layer. DM.8's source route names one paper: "Papanikolas arXiv:math/0506078, Tannakian/difference-group and Carlitz-logarithm theorems."

**Three of the nine routes into this roadmap rely on the criterion at DM.8, and one states the gap outright:**

> "DM.8 plans the Tannakian difference-Galois theory of rigid analytically trivial t-motives after Papanikolas, which is built on the **Anderson–Brownawell–Papanikolas linear independence criterion**; **the layer does not state the criterion itself.** This paper uses it in the form quoted as its Theorem 2.2" — `IM-KIM-LE-ETAL-24`

> "80 is **the actual ABP lifting criterion** (DM.8)" — `WEI-26`

> "Generic coefficient twists, Tate/entire analytic interfaces, denominator descent and **ABP lifting** support period/logarithm theory and every higher-depth consumer." — `NGODAC-21`

**Nothing owns it:**

| search (both roadmap directories) | files |
|---|---|
| `Anderson–Brownawell–Papanikolas` | **0** |
| `ABP` (whole word) | **0** |
| `linear independence criterion` | **0** |
| `Papanikolas` | 1 — `DrinfeldModulesAndTModules` itself, i.e. DM.8's own source-route citation of the *Tannakian* paper, which builds on the criterion rather than proving it |

`NGODAC-21`'s route also settles where the owner belongs: it asks for ABP lifting to sit in this shared owner rather than being re-planned downstream ("do not re-plan these inside Part II").

## Attack 2 — a false clean of my own making, and the method note

I ran a systematic scan of all 24 route reasons for the pattern that produced the Analytic area's sharpest findings — `UNACCEPTED`, "does not name/own/supply/assign/cover", "no owner", "ownership decision", "needs a separate", "not supplied by", "no layer", "absent from". **It returned nothing.**

That was wrong, and the finding above is why: the route states it as "the layer **does not state** the criterion itself", and my pattern did not include "state". **Reading the reasons caught what the scan missed.** The signal phrase varies, so the scan narrows the reading rather than replacing it — and a clean scan is not evidence of a clean area.

## Attack 3 — dependency bookkeeping. **Exact, and worth recording precisely.**

Two jobs ago I filed a high-severity finding because a 58-stage roadmap with twelve dependents declared `consumers: []`. Here the same test comes out perfect, which is the right contrast to draw:

| roadmap | cited by | declares |
|---|---|---|
| `DrinfeldModulesAndTModules` | exactly its **2** prerequisites (`SchemeAndStackFoundations`, `FunctionFieldArithmetic`) | `consumers: []` ✓ genuine sink |
| `GlobalShtukasAndFunctionFieldLanglands` | exactly its **4** prerequisites | `consumers: []` ✓ genuine sink |
| `FunctionFieldArithmetic` | **7** — its 4 prerequisites plus `DrinfeldModulesAndTModules`, `GlobalShtukas…`, `ExcursionOperatorsAndSpectralAction` | `consumers` = **exactly those 3** ✓ |

For all three, the cross-roadmap stage `requires` edges are contained in the declared prerequisites. I also applied the **opaque-handle test** that produced the part-3 finding as a generalisable check: **no roadmap here references another by a bare `#NN` pull-request number**, so every cross-roadmap reference resolves to a roadmap id.

## Attack 4 — scope, from two independent directions. Clean.

`PAPER-LAFFORGUE-18`'s route is the strongest evidence the GlobalShtukas roadmap is correctly scoped rather than merely plausible — the paper is the roadmap's own named source *stage by stage*, and the route quotes the source routes back: GS.0's "V. Lafforgue global bundle/level setup", GS.1's "V. Lafforgue geometric Satake input", GS.2's "V. Lafforgue shtuka construction", GS.3's "V. Lafforgue Hecke-finite cohomology construction", GS.4's "V. Lafforgue Drinfeld-lemma". A roadmap whose eight stages each name the right part of the one paper that proves the theorem is not planning blind.

And `PAPER-FENG-24`'s route is worth recording because a red team should notice when a source adds nothing: "Sections 2 and 5.1 are a careful, self-contained account of **exactly what these layers plan**, and the paper is a good source for them **even though everything it says there is already planned**." That is the opposite of an omission, confirming GS.1–GS.5 from an independent direction.

Several other routes disclaim duplication in the same register — `SHENDE-TSIMERMAN-17` calls its PGL₂ correspondence "an acceptance instance, not a second moduli owner"; `CIUBOTARU-HARRIS-26` supplies refinements "not a second automorphic foundation"; `YU-23` says "do not duplicate the upstream curve/function-field dictionary".

## Attack 5 — the library boundary. Little to find, and the reason.

**21 of 25 stages are audited `not built`**, including all eight of `GlobalShtukasAndFunctionFieldLanglands`. The four partly-built stages are one in `DrinfeldModulesAndTModules` and three in `FunctionFieldArithmetic`, the foundational end. Frontier material, so almost nothing for a stage to duplicate, and no stage instructs construction of something an audit records as built.

## What this red team did not do

I did not re-derive the mathematics of any stage, and in particular I did not verify that the ABP criterion is stated correctly in the routed papers — the finding rests on three accepted extractions agreeing that DM.8 needs it and on the criterion being absent from the atlas, not on my reading of the criterion itself. I did not verify the audit's four partly-built verdicts declaration by declaration. Duplication was checked within the area and against the roadmaps its members declare as prerequisites, by scope sentences and route disclaimers rather than by comparing all 25 stage texts pairwise against the rest of the atlas. "Targets out of date with the literature" was checked only where a route reason raises it. Every library number here comes from a full Mathlib checkout of 8556 `.lean` files and the Tau Ceti tree of 5268, with the file count printed beside each result.
