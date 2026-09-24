# RT-LINK-tauceti_TauCetiRoadmap_AdicSpaces — red team of the adic-spaces link map

**Result: one finding, low severity. Four of the five attacks came back clean.**

Red team: Claude Code, session `cc-fb70e5`, 24 September 2026. Target: `LINK-tauceti_TauCetiRoadmap_AdicSpaces` (Foundations of adic spaces), file `research/blueprint/links/tauceti_TauCetiRoadmap_AdicSpaces.json` — **33 directed links** (27 explicit, 6 inferred), **8 overlaps**, **218 examined** roadmaps, status `complete`, already reviewed and accepted. `cc-fb70e5` wrote neither the link map nor its review.

## Attack 1 — do both endpoints of all 33 links exist? **Yes, all 33.**

Every `source` is an AdicSpaces layer id and resolves; every `target` resolves. Sources by layer: layer 5 supplies 8 links, layer 2 seven, layer 4 six, layers 0 and 3 four each, layers 1 and 6 two each. **No link targets a stage inside AdicSpaces**, so the map is acyclic through the focal roadmap by construction.

**Two false alarms of my own, recorded because the next red team will hit them too.** `SolidAnalyticRings:SA.3` and `:SA.4` first appeared absent from the atlas. Two reasons, both mine:

1. There are **two** roadmap directories — `research/blueprint/atlas/roadmaps/` and `research/blueprint/roadmaps/` — and I had indexed only the first. `SolidAnalyticRings` lives in the second.
2. Even then the ids did not match, because that file stores stage ids **bare** (`SA.3`) while the atlas roadmaps store them **fully qualified** (`ModularityAndLanglandsExtensions:ML.0`).

Indexing both directories and both id forms resolves them, and the targets are apt: SA.3 is "Solid finite-type algebras, **discrete Huber pairs** and dis…", SA.4 is "**Solid Huber rings**, bounded and Gelfand rings, and normed…".

## Attack 2 — is every evidence quote real, and is it where the map says? **All 90 real. 18 mis-attributed.**

Each link carries `evidence` entries of the form `{stageId, quote}`; there are 90. I checked each against the cited stage's own text, then against the whole target roadmap, then against that roadmap's README.

| | count |
|---|---|
| verbatim in the cited stage | **72** |
| verbatim in the target roadmap, but in roadmap-level prose, not that stage | **16** |
| in the roadmap's `content/campaign/<id>/README.md`, not in the roadmap JSON at all | **2** |
| **not found anywhere** | **0** |

**No quote is fabricated or paraphrased** — that is the important half of this attack, and the map passes it cleanly. The 18 exceptions are all scope-and-dependency sentences stored at roadmap level and cited against several stages of that one roadmap. This is the finding, below.

## Attack 3 — the overlaps. Clean.

All 8 overlaps resolve on both sides, with recommendations `rescope` (7) and `keep` (1):

| AdicSpaces layer | partner stage | recommendation |
|---|---|---|
| layer 5, adic spaces and elementary geometry | `AdicSpacesPartII:R0` | rescope |
| layer 5 | `AdicEtaleGeometry:A2` | rescope |
| layer 5 | `PerfectoidSpaces:P4` | rescope |
| layer 6, the adic Fargues–Fontaine curve | `FarguesFontaineDiamonds:F2` | rescope |
| layer 6 | `RelativeFarguesFontaine:RF1` | **keep** |
| layer 6 | `AInfCohomology:AI.0` | rescope |
| layer 1, valuation spectra and continuous valuations | `DiamondsAndVStacks:D0` | rescope |
| layer 3, rational localisation and the structure presheaf | `SolidAnalyticRings:SA.3` | rescope |

## Attack 4 — is the 218-entry `examined` record consistent with what the map reports? **Yes.**

Results break down as `overlap` 1, `links` 13, `none` 204. Every one of the **12** distinct link-target roadmaps is marked `links` or `overlap`, and all **8** overlap partners appear — seven as `links`, and `AInfCohomology` as `overlap`, which is exactly the case that value distinguishes (an overlap carrying no link). The apparent discrepancy between 13 `links` and 12 link targets resolves to the focal roadmap itself, `tauceti:TauCetiRoadmap/AdicSpaces`, whose entry reads "Focal roadmap. Full document and all seven layer descriptions read… Layer inputs are Mathlib only, so no inward link was found."

## Attack 5 — omissions. Clean.

I screened every roadmap in both directories whose title or summary mentions adic-foundational vocabulary — valuation, spectral space, topological ring, Huber, Tate algebra, affinoid, Berkovich, rigid analytic, formal scheme — which gives 20. The three that look like plausible missing links are each already justified in the `examined` notes, and the justifications are good:

- **`ClassicalAdicEtaleCohomology`** (mentions Huber, marked `none`): "Explicitly says AdicSpaces does not supply these étale cohomology theorems and that rational acyclicity of 𝒪 is not étale vanishing. Adic carriers arrive through AdicEtaleGeometry A1/A2." The dependency is routed through `AdicEtaleGeometry`, which *is* a link target — so the absence is correct rather than an omission.
- **`TropicalAndBerkovichArithmetic`** (marked `links`): the specific link L2 → TB.0 is recorded, with the note that "TB does not name AdicSpaces" and "TB.1–TB.7 are Berkovich and tropical, which AdicSpaces excludes."
- **`tauceti:TauCetiRoadmap/LocalFieldsRamification`** (marked `none`): "The discretely valued local-field theory neither supplies nor uses Huber rings, Spa or rank-one perfect fields." Correct — that material sits below the adic layer.

## The finding

**RT-LINK-…AdicSpaces/1 — `error`, low severity.** 18 of the 90 evidence entries attribute their quote to a `stageId` when the quoted sentence is not in that stage's text. In each case the quote is **genuine** and verbatim in the target roadmap's roadmap-level prose, and the same sentence is cited against several stages of that one roadmap:

| quote | actually stored in | cited against |
|---|---|---|
| "This is a successor to AdicSpaces, not another construction of valuation spectra…" | `AdicSpacesPartII.json` → `summary` | `F0`, `R2`, `R3` |
| "Its starting point is AdicSpaces, not a pre-existing tilting or almost…" | `PerfectoidSpaces.json` → `summary` | `P1`, `P2` |
| "This component starts at the actual endpoint of AdicSpaces Layers 0–5." | `AdicEtaleGeometry.json` → `summary` | `A0`, `A4` |
| "Dependencies: upstream AdicSpaces and LocalFieldsRamification; …" | `RelativeFarguesFontaine` roadmap prose | `RF0:integral-Y`, `RF0:annuli`, `RF1` |
| "AdicSpaces for rigid/adic analytic domains and gluing" | `ColemanIntegration` roadmap prose | `L1` |
| "The principal categories are analytic locally strongly noetherian adic…" | `content/campaign/AdicSpacesPartII/README.md` | `R0` |
| "Cohomology statements refer to the same structure sheaves as AdicSpaces…" | `content/campaign/PerfectoidSpaces/README.md` | `P2` |

The links these quotes support are sound, and the quotes do justify them — "This is a successor to AdicSpaces, not another construction of valuation spectra" is precisely the right evidence that `AdicSpacesPartII` depends on `AdicSpaces`. What is wrong is only the provenance pointer. It is worth fixing rather than shrugging, because a verifier who follows `stageId` to check a quote will not find it there: that is what happened to me on this job, and it cost real time before I thought to search the roadmap summaries.

**Fix.** Re-point the 18 entries at the level the quote comes from, leaving all 33 link verdicts unchanged. Either add a roadmap-level evidence form beside the stage-level one (`{roadmapId, quote, source: "summary" | "prerequisites" | "readme"}`), or keep `stageId` and record the roadmap-level quote as a separate entry. If `links-v1` is not to change, the minimum fix is to replace each of the 18 quotes with a sentence from the cited stage's own description carrying the same force.

## What this red team did not do

I did not re-derive the mathematics of any layer, and I did not attempt to judge whether each of the 204 roadmaps marked `none` was correctly excluded — I screened them by adic-foundational vocabulary and read the notes of the three plausible candidates. Omissions were therefore checked at roadmap granularity, not stage by stage. The map's scope is links *outgoing* from AdicSpaces, so I did not treat absent inward links as omissions; the focal entry's claim that "Layer inputs are Mathlib only" was not independently verified against Mathlib.
