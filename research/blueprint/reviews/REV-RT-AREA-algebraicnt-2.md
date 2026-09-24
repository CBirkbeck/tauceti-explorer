# REV-RT-AREA-algebraicnt-2

Independent verifier: **Codex — codex-hjdg0j**. Issue [#1480](https://github.com/CBirkbeck/tauceti-explorer/issues/1480). Claim [5807094828](https://github.com/CBirkbeck/tauceti-explorer/issues/1480#issuecomment-5807094828) was confirmed by [the bot](https://github.com/CBirkbeck/tauceti-explorer/issues/1480#issuecomment-5807096154); the full issue was reread before work. I did not author RT-AREA-algebraicnt-2 (Claude Code — cc-fb70e5).

Reviewed atlas revision: `04f16aefbba9a011245937c20c0057df14ba10ac`. Library pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Scope is the single finding, not a fresh red team of all 65 layers.

**Result: 0 confirmed, 1 rejected.** The stated mathematical dependencies are correct, but all three are already present in reviewed link inputs and in the assembled atlas. The proposed fix would duplicate recorded dependencies. The empty arrays belong to exports of the original snapshot, which omit these reviewed overlays.

## Finding RT-AREA-algebraicnt-2/1 — rejected

I read the [result](https://github.com/CBirkbeck/tauceti-explorer/blob/04f16aefbba9a011245937c20c0057df14ba10ac/research/blueprint/redteam/RT-AREA-algebraicnt-2.result.json) and [report](https://github.com/CBirkbeck/tauceti-explorer/blob/04f16aefbba9a011245937c20c0057df14ba10ac/research/blueprint/redteam/RT-AREA-algebraicnt-2.md), inspected all seven named roadmap metadata records, opened the cited consumer passages and corresponding supplier passages, then traced both the snapshot extractor and the actual build. The final build check is decisive; counting empty fields in the snapshot alone is insufficient.

### The prose dependencies are real

The graph direction is prerequisite → consumer, as specified by [PROTOCOL §10](https://github.com/CBirkbeck/tauceti-explorer/blob/04f16aefbba9a011245937c20c0057df14ba10ac/research/blueprint/PROTOCOL.md#L347-L389).

| Dependency | Consumer evidence read | Supplier evidence read |
| --- | --- | --- |
| LocalFieldsRamification → QuadraticFormInvariants | [6A, lines 1124–1135](https://github.com/CBirkbeck/tauceti-explorer/blob/04f16aefbba9a011245937c20c0057df14ba10ac/content/tau-ceti/QuadraticFormInvariants/README.md#L1124-L1135 names the normalized valuation, unit filtration, cast valuation, power classes and unramified norm groups as supplied local arithmetic. | [Layer 0, lines 69–124](https://github.com/CBirkbeck/tauceti-explorer/blob/04f16aefbba9a011245937c20c0057df14ba10ac/content/tau-ceti/LocalFieldsRamification/README.md#L69-L124) supplies normalized valuation and finite-extension structures; [Layer 1, lines 203–243](https://github.com/CBirkbeck/tauceti-explorer/blob/04f16aefbba9a011245937c20c0057df14ba10ac/content/tau-ceti/LocalFieldsRamification/README.md#L203-L243) supplies the filtration and graded pieces. |
| LocalFieldsRamification → NumberFieldArithmetic | [Layer 5, lines 1353–1382](https://github.com/CBirkbeck/tauceti-explorer/blob/04f16aefbba9a011245937c20c0057df14ba10ac/content/tau-ceti/NumberFieldArithmetic/README.md#L1353-L1382) applies the local API through the canonical completion's `ValuativeExtension`. | The same Layer 0 finite-extension contract supplies the local API; [Layer 3, lines 589–594](https://github.com/CBirkbeck/tauceti-explorer/blob/04f16aefbba9a011245937c20c0057df14ba10ac/content/tau-ceti/LocalFieldsRamification/README.md#L589-L594) explicitly names NumberFieldArithmetic as a consumer after completion. This is not a reverse dependency. |
| NumberFieldArithmetic → GlobalNumberFields | [Layer 2, lines 282–285](https://github.com/CBirkbeck/tauceti-explorer/blob/04f16aefbba9a011245937c20c0057df14ba10ac/content/tau-ceti/GlobalNumberFields/README.md#L282-L285) takes `idealsPrimeTo` and `integralIdealsPrimeTo` as abbreviations of the away-from-support carriers. | [NumberFieldArithmetic §2.5, lines 715–755](https://github.com/CBirkbeck/tauceti-explorer/blob/04f16aefbba9a011245937c20c0057df14ba10ac/content/tau-ceti/NumberFieldArithmetic/README.md#L715-L755) supplies those fractional and integral carriers. |

The export of `hilbertSymbol_productFormula` [to GlobalQuadraticForms](https://github.com/CBirkbeck/tauceti-explorer/blob/04f16aefbba9a011245937c20c0057df14ba10ac/content/tau-ceti/QuadraticFormInvariants/README.md#L1586-L1603) is likewise not an input dependency of QuadraticFormInvariants. None of these directional readings establishes that the other four roadmaps have no prerequisites.

### Those dependencies are already integrated

The two relevant promoted link packets both have `review.status = accepted`, dated 2026-09-23, with named independent reviewers. These are active `links` entries, not merely examined-pair notes or archived rejected links.

| Existing input | Exact relevant entries, zero-based | Reproduced roadmap edge |
| --- | --- | --- |
| [LocalFieldsRamification link packet](https://github.com/CBirkbeck/tauceti-explorer/blob/04f16aefbba9a011245937c20c0057df14ba10ac/data/links/tauceti_TauCetiRoadmap_LocalFieldsRamification.json#L39-L99) ([acceptance](https://github.com/CBirkbeck/tauceti-explorer/blob/04f16aefbba9a011245937c20c0057df14ba10ac/data/links/tauceti_TauCetiRoadmap_LocalFieldsRamification.json#L2420-L2424)) | `links[2]`, `[3]`, `[4]`: local Layers 0, 1, 2 → QuadraticFormInvariants 6A; further links supply 6B/6C. | LocalFieldsRamification → QuadraticFormInvariants; `kind: stage_supported`, `stageCount: 7`. |
| [NumberFieldArithmetic link packet](https://github.com/CBirkbeck/tauceti-explorer/blob/04f16aefbba9a011245937c20c0057df14ba10ac/data/links/tauceti_TauCetiRoadmap_NumberFieldArithmetic.json#L43-L60) ([acceptance](https://github.com/CBirkbeck/tauceti-explorer/blob/04f16aefbba9a011245937c20c0057df14ba10ac/data/links/tauceti_TauCetiRoadmap_NumberFieldArithmetic.json#L2309-L2313)) | `links[2]`: local Layer 0 → NumberFieldArithmetic Layer 5; other scoped entries supply local Frobenius and ramification. | LocalFieldsRamification → NumberFieldArithmetic; `kind: stage_supported`, `stageCount: 5`. |
| [Same packet, carrier link](https://github.com/CBirkbeck/tauceti-explorer/blob/04f16aefbba9a011245937c20c0057df14ba10ac/data/links/tauceti_TauCetiRoadmap_NumberFieldArithmetic.json#L834-L850) | `links[45]`: NumberFieldArithmetic Layer 2 → GlobalNumberFields Layer 2, explicitly for the two carriers cited by the finding. | NumberFieldArithmetic → GlobalNumberFields; `kind: stage_supported`, `stageCount: 6`. |

The build [preserves the snapshot and loads reviewed links](https://github.com/CBirkbeck/tauceti-explorer/blob/04f16aefbba9a011245937c20c0057df14ba10ac/scripts/build.py#L61-L78). [`merge_links`](https://github.com/CBirkbeck/tauceti-explorer/blob/04f16aefbba9a011245937c20c0057df14ba10ac/scripts/decompositions.py#L268-L311) attaches the evidence and updates stage dependencies; the [roadmap aggregation](https://github.com/CBirkbeck/tauceti-explorer/blob/04f16aefbba9a011245937c20c0057df14ba10ac/scripts/decompositions.py#L238-L260) and [`refresh_roadmap_links`](https://github.com/CBirkbeck/tauceti-explorer/blob/04f16aefbba9a011245937c20c0057df14ba10ac/scripts/blueprints.py#L39-L67) derive prerequisites and consumers. I ran the actual assembly function, rather than assuming a packet would eventually be promoted:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 - <<'PYTHON'
import sys
sys.path.insert(0, 'scripts')
from build import assemble
atlas, _ = assemble(require_distances=False)
prefix = 'tauceti:TauCetiRoadmap/'
pairs = [('LocalFieldsRamification', 'QuadraticFormInvariants'),
         ('LocalFieldsRamification', 'NumberFieldArithmetic'),
         ('NumberFieldArithmetic', 'GlobalNumberFields')]
roadmaps = {r['id']: r for r in atlas['roadmaps']}
edges = {(e['source'], e['target']): e for e in atlas['edges']}
for supplier, consumer in pairs:
    source, target = prefix + supplier, prefix + consumer
    assert source in roadmaps[target]['prerequisites']
    print(edges[source, target])
PYTHON
```

Assembly succeeded with 211 roadmaps, 2,608 stages and 1,610 roadmap edges. The three outputs have the stage counts above. `require_distances=False` permits a provisional layout distance; it does not bypass link merging or manufacture dependency edges.

All seven assembled roadmaps have nonempty prerequisites. The immediate lists, abbreviating the common `tauceti:TauCetiRoadmap/` prefix, are:

| Roadmap | Assembled prerequisites |
| --- | --- |
| GlobalNumberFields | LocalFieldsRamification; NumberFieldArithmetic |
| GlobalQuadraticForms | NumberFieldArithmetic |
| LocalFieldsRamification | ProfiniteProPGroups |
| Multiquadratic | `tauceti:Completed/EffectiveBounds`; ClassFieldTheory |
| NumberFieldArithmetic | `tauceti:Completed/EffectiveBounds`; LocalFieldsRamification |
| PolynomialGaloisGroups | NumberFieldArithmetic |
| QuadraticFormInvariants | ClassFieldTheory; LocalFieldsRamification; Multiquadratic; RepresentationTheory/SemisimpleAlgebras; RepresentationTheory/SpinRepresentations |

This table reports assembly output; it is not an independent acceptance of every unrelated edge. I make no claim that the entire roadmap graph is acyclic or complete.

### Why the snapshot observation does not justify the fix

[`make_atlas_extracts.py`](https://github.com/CBirkbeck/tauceti-explorer/blob/04f16aefbba9a011245937c20c0057df14ba10ac/research/blueprint/make_atlas_extracts.py#L40-L75) reads `data/atlas.json` directly and copies its prerequisite lists. The [extracts README](https://github.com/CBirkbeck/tauceti-explorer/blob/04f16aefbba9a011245937c20c0057df14ba10ac/research/blueprint/atlas/README.md#L1-L16) says these are generated files and must not be edited by hand. The seven exported arrays and the original snapshot arrays really are empty. That does not describe the graph produced by the build. Even the original snapshot's `meta.repositoryDependencyScope` says local prose has not received a complete dependency audit; absence of an edge is not a certificate of independence.

The current raw snapshot has 162 of 212 nonempty roadmap prerequisite lists, rather than the report's 161 of 211. The broad proportion remains about 76 percent, but this statistic does not establish a missing edge in the assembled graph. I did not reconstruct the historical state at the report's creation and do not claim it was already repaired at that time.

**Disposition:** do not add duplicate links, edit generated arrays, or change the immutable snapshot for this finding. If workers need current dependencies in the browser extracts, a separately scoped exporter/documentation change could expose assembled links and distinguish them from the original snapshot. That potential usability improvement is not the claimed absent mathematical dependency or the proposed three-array edit. This review changes only its two authorized deliverables.

### Pinned implementation boundary and limits

I also read the actual declarations at the complete pins. Tau Ceti's [away-from-support carriers](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Ideal/Away.lean#L48-L64) define `TauCeti.NumberFieldArithmetic.idealsAway` under `[Field K] [NumberField K]`; [lines 117–124](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Ideal/Away.lean#L117-L124) define `integralIdealsAway`. The [ray-class modulus file](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean#L439-L472) already makes `idealsPrimeTo` and `integralIdealsPrimeTo` abbreviations of those carriers. This supports the direction, but defeats the implication that the needed carrier must still be built or that all of NumberFieldArithmetic must finish before any GlobalNumberFields work can elaborate.

[Mathlib's `ValuativeExtension`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Valuation/ValuativeRel/Basic.lean#L1232-L1237) already expresses preservation and reflection of the valuative relation by the algebra map. The roadmap dependency concerns the local-field API and compatible completion adapters, not a new definition of that class. Local source reads used trees whose full Lean-file Git blob hashes were checked against the pinned GitHub trees (8,482 Mathlib and 5,477 Tau Ceti files).

This verdict does not accept the red team's broad library-boundary or paper-routing clean claims. They are outside the single finding, and the report itself qualifies its library probe as using an unpinned copy. I did not perform a fresh absence audit of Hasse–Minkowski, Witt theory, Hilbert symbols or paper routes, nor reread every one of the area's 65 stages. No Lean file was changed or compiled, and no formalization is claimed.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AREA-algebraicnt-2.result.json research/blueprint/redteam/RT-AREA-algebraicnt-2.review.json`.
- `python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-AREA-algebraicnt-2.review.json research/blueprint/reviews/REV-RT-AREA-algebraicnt-2.md`.
- Exact one-to-one coverage of the single finding; only the two issue deliverables changed.
- Read-only assembly with explicit assertions that all three dependencies are in both roadmap edges and consumer prerequisite lists; no atlas data were mutated.
