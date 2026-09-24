# REV-RT-AREA-arithmeticgeometry-3 — independent verification

Codex — codex-hjdg0j · 2026-09-24 · Refs #1486

Complete: the single finding, RT-AREA-arithmeticgeometry-3/1 (high), is **rejected**. Its snapshot observations are reproducible, but its claim about the atlas dependency graph overlooks accepted links already applied by the build. [Machine-readable verdict](../redteam/RT-AREA-arithmeticgeometry-3.review.json).

## Scope and independence

I did not write RT-AREA-arithmeticgeometry-3; its author is Claude Code / cc-fb70e5. Bot reply 5808492236 confirmed my claim comment 5808490787, and I reread the whole issue afterward. I have separately red-teamed AUDIT-10, which overlaps some mathematical subjects; this is not a claim of having had no previous contact with these roadmaps.

Explorer baseline: `c72bce3a772fed50643914ea4b4673f3d977f42c`. The programme's library pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. This finding concerns ownership, references and the build, and does not cite a Lean declaration as its evidence. I checked the original finding and report, the twelve cited roadmap records and relevant native passages, the upstream contracts, accepted integration data and the actual assembly code. This is not a repeat of the area's 111-stage audit.

## The snapshot is not the final dependency graph

The raw [ModularCurves extract](https://github.com/CBirkbeck/tauceti-explorer/blob/c72bce3a772fed50643914ea4b4673f3d977f42c/research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_ModularCurves.json) indeed has empty prerequisite and consumer lists. The twelve named campaign extracts omit its canonical ID from their prerequisites. Searching raw `data/atlas.json` likewise finds no stage or roadmap dependency edge incident to it. Those observations support the report's description of that particular input, not its conclusion that dependencies are recorded nowhere.

The distinction is documented. The [extract generator](https://github.com/CBirkbeck/tauceti-explorer/blob/c72bce3a772fed50643914ea4b4673f3d977f42c/research/blueprint/make_atlas_extracts.py#L46) reads `data/atlas.json` directly (applying retirements), while [the application build](https://github.com/CBirkbeck/tauceti-explorer/blob/c72bce3a772fed50643914ea4b4673f3d977f42c/scripts/build.py#L42) loads that snapshot, applies accepted restructurings, loads `data/links/*.json`, and merges the accepted packets. [`merge_links`](https://github.com/CBirkbeck/tauceti-explorer/blob/c72bce3a772fed50643914ea4b4673f3d977f42c/scripts/decompositions.py#L267) adds their stage prerequisites and evidence; [`merge_decompositions`](https://github.com/CBirkbeck/tauceti-explorer/blob/c72bce3a772fed50643914ea4b4673f3d977f42c/scripts/decompositions.py#L249) then recomputes roadmap prerequisite and consumer lists. The original snapshot is deliberately retained. [PROTOCOL §8](https://github.com/CBirkbeck/tauceti-explorer/blob/c72bce3a772fed50643914ea4b4673f3d977f42c/research/blueprint/PROTOCOL.md#L272) describes this promotion of accepted links into `data/links/`.

I executed `build.assemble(require_distances=False)` with bytecode disabled. It completed with its graph checks. At the reviewed snapshot the assembled ModularCurves record has **46 consumers**, including ModularCurvesPartII, and the Part II record contains `tauceti:TauCetiRoadmap/ModularCurves` among its prerequisites. All eleven genuine consumers in the submitted list already contain that prerequisite: ModularCurvesPartII, ShimuraVarieties, AbelianSchemesAndArithmeticModuli, ShimuraCompactifications, PerfectoidShimuraVarieties, PELModuli, FiniteFlatGroupsAndIntegralPadicHodgeTheory, EllipticCurveModularity, ArithmeticGaloisRepresentations, AlgebraicModuliForArithmeticGeometry and AlgebraicModularFormsAndSerreWeights. The twelfth case is discussed below. Disabling distance enforcement permits provisional layout distances; it does not bypass graph validation.

## Canonical, evidence-bearing imports already exist

The accepted [ModularCurves link packet](https://github.com/CBirkbeck/tauceti-explorer/blob/c72bce3a772fed50643914ea4b4673f3d977f42c/data/links/tauceti_TauCetiRoadmap_ModularCurves.json) has 43 links and an accepted independent review dated 2026-09-23. Its source endpoints are canonical IDs with exact stage anchors. In one-based link order:

| Entries | Existing import | What the consumer needs |
| --- | --- | --- |
| 12 | upstream 2E → R12.1 | Scheme-theoretic Weil pairing and normalization comparison |
| 13–14 | upstream 5C and 5B → R12.4 | Smooth twisted curve, conditional irreducibility reduction and fixed-pairing fibres |
| 16–17 | upstream Layer 10 and 9D → R13.4a | Restricted prime-level compactification comparison and affine coarse moduli |
| 22–36 | upstream stages → A1/A2/A5, R09.3, R01.6, R29.6, R07.5, M5, S5, C6 and V8 | The individual relative-scheme, quotient and modular-curve interfaces |

I read entries 12–14, 16–17 and the named consumer contracts, and checked all evidence strings of these twenty entries against the actual stage description or its roadmap document. In particular, entry 14 quotes R12.4's dependency on PR81's fixed-pairing/twisting and smoothness stages and pairs it with the canonical 5B endpoint. This is already a machine-readable resolution of the allegedly unresolvable reference. The [native Part II handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/c72bce3a772fed50643914ea4b4673f3d977f42c/content/campaign/ModularCurvesPartII/README.md#L280) also explicitly names ModularCurves PR81 and its source snapshot.

AlgebraicModularFormsAndSerreWeights receives upstream imports through accepted [RS-06](https://github.com/CBirkbeck/tauceti-explorer/blob/c72bce3a772fed50643914ea4b4673f3d977f42c/data/restructure/RS-06.result.json), including 0E and 5C → R15.1 and 7E → R15.3/R15.4. The build retains the precise stage endpoints; none of these is a requirement that every theorem of the whole upstream roadmap be finished first. The assembled graph, rather than a count of prose mentions, establishes the dependency facts at issue.

## The twelfth roadmap has the opposite role

[ComplexComparisonPartII C4](https://github.com/CBirkbeck/tauceti-explorer/blob/c72bce3a772fed50643914ea4b4673f3d977f42c/content/campaign/ComplexComparisonPartII/README.md#L57) **exports** the comparison of algebraic and analytic connectedness for finite-type smooth affine complex curves. Its projective-completion argument explicitly avoids the later modular-curve compactification and uniformization. [R12.4](https://github.com/CBirkbeck/tauceti-explorer/blob/c72bce3a772fed50643914ea4b4673f3d977f42c/content/campaign/ModularCurvesPartII/README.md#L54) consumes that export, together with the two other named statements needed to discharge the conditional upstream connectedness input. The assembled graph already includes `ComplexComparisonPartII:C4 → ModularCurvesPartII:R12.4`.

[Upstream 5C](https://github.com/CBirkbeck/tauceti-explorer/blob/c72bce3a772fed50643914ea4b4673f3d977f42c/content/tau-ceti/ModularCurves/README.md#L1304) constructs the smooth twisted curve and proves the irreducibility reduction **with connectedness as an explicit hypothesis**. It does not wait for the unconditional connectedness theorem. Thus C4's mention of PR81 is not evidence for an upstream-ModularCurves → C4 prerequisite, and the missing prerequisite in this twelfth record is not a defect established by the submitted evidence. Nor should one insert a return dependency from the eventual unconditional theorem into the conditional 5C construction.

The report's no-cycle assurance is also unsupported: an empty raw prerequisite array cannot certify acyclicity of a proposed amendment to the assembled stage graph. The actual build already gives ModularCurves incoming dependencies. Every proposed new stage edge needs its own scope and direction check.

## Disposition and validation

Do not apply the blanket repair to the twelve arrays, generated extracts or upstream text. Preserve the accepted stage imports and their evidence. Expanding bare PR references into clickable links could be a navigation improvement, but does not establish the submitted high-severity claim that the mathematics has no recorded supplier or that Part II is scheduled without Part I.

Only the two issue deliverables change. The red-team review checker and two-file intake checker pass. The assembly check and the twenty-entry evidence-substring check pass. All 39 input guards matched fresh main `2f82d0fe011aa6415b86bed59a089ff8bf277c67`; both output paths were absent, the finding ID matched exactly, and the bot-confirmed claim still belonged to this worker. No Lean source changed or Lean compilation ran. This verdict does not certify every existing link, every mathematical proof, or the red team's separate claims that other aspects of the area were clean.
