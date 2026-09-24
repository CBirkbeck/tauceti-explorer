# REV-RT-AUDIT-21 — independent verification

Codex — codex-hjdg0j · 2026-09-24 · Refs #1591

Complete: RT-AUDIT-21/1, the sole finding (medium), is confirmed. [Machine-readable verdict](../redteam/RT-AUDIT-21.review.json).

## Scope and independence

I did none of AUDIT-21, REV-AUDIT-21 or RT-AUDIT-21. The red-team author is Codex / codex-c83e7a, a different session. Bot reply 5808161119 confirmed claim comment 5808159849; the complete issue was reread afterward.

Explorer baseline: `4d4a8f20e431e921c5c7fad9fa2260248890472f`. Library pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. I independently read the affected audit records, reviewed coverage projection, roadmap contracts, and the pinned declarations with their fields, bodies and section hypotheses. This verifies the finding, not the red team's other 181-target checks.

## Evidence and applicability

[AUDIT-21](https://github.com/CBirkbeck/tauceti-explorer/blob/4d4a8f20e431e921c5c7fad9fa2260248890472f/research/blueprint/audit/AUDIT-21.result.json) labels HS3 target index 2 `absent` and VS4 target index 0 `partial`, with both layers `not built`. Both notes claim smooth representations of the relevant topological groups are undefined; the VS summary repeats that claim. The reviewed coverage projection repeats the notes. Those blanket claims are false even though the labels need not change.

[`TauCeti.IsSmoothDiscrete`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean#L254) requires a discrete underlying module and an open stabilizer for every vector of `X : TopRep R G`. Its definition assumes a topological ring carrier with `[Ring R] [TopologicalSpace R]` and a topological monoid carrier `G`; no profiniteness or compactness is required. For a topological **group**, [`isSmoothDiscrete_iff_continuousSMul`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean#L324) proves that, on a discrete module, this condition is equivalent to continuity of the group action. The source explicitly distinguishes it from having continuous operators for each fixed group element: those alone do not impose continuity in the group variable.

[`SmoothDiscreteTopRep`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean#L537) is the full subcategory on this predicate. [`DiscreteRep`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean#L550) separately bundles a discrete module, a distributive group action commuting with scalar multiplication, and continuous scalar and group actions. Its [category instance](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean#L581) uses equivariant linear maps, not morphisms transported from the target category. The [forward functor](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean#L610) and [inverse functor](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean#L649) yield

```text
TauCeti.discreteRepEquivSmoothTopRep :
  DiscreteRep R G ≌ SmoothDiscreteTopRep R G
```

at [line 678](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean#L678). The enclosing variables are `[Ring R] [TopologicalSpace R]`, `[Group G] [TopologicalSpace G] [IsTopologicalGroup G]`. The equivalence is therefore available for locally pro-p topological groups without a global compactness assumption. Its unit and counit are identity maps on the underlying modules; this is an actual categorical dictionary, not just an object constructor.

The [VS3–VS4 contract](https://github.com/CBirkbeck/tauceti-explorer/blob/4d4a8f20e431e921c5c7fad9fa2260248890472f/content/campaign/VStackSheavesAndLisseCategories/README.md#L65) uses discrete coefficients, with prime-to-p torsion coefficients for the VS4 comparison. When both the coefficient ring and module are discrete, their product is discrete, so scalar multiplication is continuous. This checks the potentially restrictive `ContinuousSMul R V` field; discreteness of the module alone would not justify that field for an arbitrary topology on the coefficient ring.

VS4 asks for an **enhanced derived** category and an equivalence with sheaves on `[*/H]` constructed through continuous torsor descent. [HS3](https://github.com/CBirkbeck/tauceti-explorer/blob/4d4a8f20e431e921c5c7fad9fa2260248890472f/content/campaign/HeckeStacksAndLocalShtukas/README.md#L67) consumes that comparison to relate local-shtuka cohomology to Hecke functors. The ordinary dictionary supplies neither comparison. Moreover, the source's [roadmap paragraph](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean#L82) explicitly leaves closure under finite products, subobjects and quotients unfinished because the necessary `TopRep` API is missing there. An abelian or derived-category implementation cannot be inferred from this equivalence.

## Required repair

Replace both blanket absence notes and the VS summary sentence with the existing smooth discrete foundation and the remaining enhanced/geometric gap. Add `TauCeti.IsSmoothDiscrete`, `TauCeti.SmoothDiscreteTopRep` and `TauCeti.discreteRepEquivSmoothTopRep`, from `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean`, lines 254, 537 and 678, as `related` evidence for VS4 target 0. `TauCeti.DiscreteRep`, line 550, is also useful. The same coefficient input may be recorded for HS3 target 2.

Keep HS3 target 2 `absent`, VS4 target 0 `partial` and both layer verdicts `not built`. Do not infer compact induction, admissibility, derived enhancements or v-stack descent from the dictionary. This correction imports existing foundations rather than commissioning their reconstruction; it does not establish any of the larger endpoints.

## Validation

The independently computed Git blob of `SmoothDiscrete.lean` is `456ca497a722465b26ceca5a35cbea2009bf9e09`, matching the Tau Ceti pinned tree and the finding. Declaration locators and all hypotheses above were checked directly in that file.

`scripts/check_redteam.py` passed for the review and red-team result; `research/blueprint/intake.py check-files` passed for the two deliverables (0 problems). All 13 guarded input files matched fresh main `ca1afaab5ed1a662e8e4f8d33b1746395f3825ea` before publication. Only the two authorized deliverables change. No Lean file was changed or compiled; this review makes no new formalization claim.
