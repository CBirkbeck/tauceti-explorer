# REV-ShimuraData~3 — completed review handoff

Issue [#7554](https://github.com/CBirkbeck/tauceti-explorer/issues/7554). Codex, session **codex-rE68AX**, 2026-10-09. One completed independent review; **needs_changes**, not a checkpoint. See the [permanent report](../reviews/REV-ShimuraData~3.md), [packet](../packets/ShimuraData.json), [reader](../readmes/ShimuraData.md) and [suggested file](../suggested/ShimuraData.lean).

## Done

Every one of the 123 nodes, 45 pinned baseline declarations, 26 supplier requests, 142 named API interfaces, 132 tests, 27 planets and 17 source findings was reviewed. All nine preceding D5 defects are repaired. E17's quadratic-unit counterexample and strengthened all-places hypothesis are independently confirmed. The current E15 verdict is scoped to the local proof repair; its older overstatement remains unaltered in historical review data.

Nine clear node corrections are installed: exact evidence for three Mumford–Tate nodes; Hodge-genericity and Schubert locators; integral-polarization pairing definition; actual GL₂ determinant datum morphism; torus reflex automorphism equivalence; CM-torus image specialness for an arbitrary datum morphism. Four baseline line anchors and the native integral nondegeneracy description are corrected. All reader changes match the packet. Added published Milne's public SVH chapter with URL, hash and exact pp.494–495, bringing the source register to 12 versions. Each of the original eleven source files matched its recorded hash.

All previous review objects are preserved exactly in history before the new independent review. Node IDs and implementation statuses are preserved. Counts: 109 verified, nine corrected, five unverifiable, zero added; 19 definitions, 25 constructions, 53 lemmas, 26 theorems; 11 gaps, all six stages planned, none closed, all implementations unchecked. No supplier/native roadmap or atlas data file was edited.

## Resume at the five D0 signatures

The only unresolved review contradictions are in the five opening suggested signatures. Their packet statements remain definitive:

1. `delignePointsTopology`: actual S(ℝ) topological comparison, complex splitting and conjugation; the current arbitrary topological isomorphism/continuity fact is insufficient.
2. `deligneLiePoints`: actual analytic comparison, Lie identification and norm/diagonal differentials; a scalar identity alone is insufficient.
3. `hilbertRealPoints`: actual Res_F GL₂ analytic point comparison and common-determinant G* locus, preserving both signs.
4. `hilbertAdelicPoints`: actual rational/F finite adeles, topological point comparison, G* determinant locus, compact opens and rational diagonals.
5. `datumMapPoints`: maps induced by a rational Hopf morphism, continuous local/adelic and analytic real points, with diagonal/projection/S/Hilbert compatibility; do not merely assume an abstract commuting square.

The new gap and individual review notes give the exact missing conclusions. Introduce named point/atlas sketches using the existing Hopf, manifold and finite-adele carriers, reuse RG2.0a's S and Weil restriction, and state the actual results. PROTOCOL §13 allows unavailable hypotheses to remain explicitly omitted; no supplier proof implementation is required for this repair. Avoid arbitrary equivalences that assume the comparison and conclusions replaced by unrelated calculations. Follow the existing D5 corrected determinant interface as a model for retaining the actual rational objects.

The programme's usual three-round limit has been reached, so the maintainer must choose how to route this remaining scoped repair. This worker has not queued or claimed another job. Existing open proof leaves remain precisely recorded and do not alone justify another rejection.

## Reproducible evidence

E17: F=ℚ(√2), u=7+5√2=(1+√2)³, uu′=−1. At the two places above 7, √2 reduces to 3 and 4, so u reduces to 1 and −1. The scalar uI₄ lies in Iw₁ at the first place and full integral level elsewhere, but the faithful rational representation on F⁴ has eigenvalues u,u′ generating −1. Similitude u² is totally positive. Require every place over one rational ℓ>5, all absolutely unramified, to bound the entire rational local spectrum. No matching corrigendum was located in the source-ledger searches; none was contacted or claimed to be absent globally.

Independent exact computations verified the BP cyclic minimal-left criterion for genera 1–4 against inverse images of positive Levi roots, with counts 2,4,8,16. Sequences were distinct and matched coordinate-subspace intersection dimensions at Weyl representatives. Root half-sums agreed in ranks 1–6. CG lengths 0–3, longest Levi/full lengths 1/4 and reversal were checked on coordinate bases. Pilloni parity-character/half-integral-dual bases paired to the identity. The permanent suggested file gives all formulas; these finite checks can be repeated with ordinary exact integer/rational arithmetic without retained scratch.

Baseline pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Read full cited declarations with surrounding variables, not just name-search hits. Corrected anchors are `FGComoduleCat.ofHom` 172, `Hodge.IsPolarization` 70, `FiniteAdeleRing` 94 and `Matrix.unitaryGroup` 60. No declaration was removed or replaced.

## Validation and limitations

- Packet checker against the exact pinned declaration index: **0 errors, 0 warnings**.
- Source-issue/version checker via an errata-v1 scratch wrapper: **0 errors**; all 17 findings independently confirmed.
- Structural audit: 123 named targets, 142 APIs and 132 labeled actual examples present; every packet statement, hypothesis, proof step, API/test statement and acceptance paragraph present in the reader. Node IDs and old review histories compared exactly with the input.
- Individual import source paths at the exact pins, JSON, whitespace and authorized five-file scope checked.
- **Lean was not compiled by this review.** The available shared build has exact Mathlib but Tau Ceti cf386627e9176a3827c1a5fe804989fd94a4d216, not f790474. The author's earlier eight-interface Mathlib-only check is historical, not a reviewer or full-file compile. No build/update/cache operation, language server or background task was started. Newly corrected Tau Ceti signatures remain uncompiled and unproved.

Scratch contains only reproducible working notes, public-source downloads and arithmetic/structural checks; it is removed after submission. Everything another worker needs is in this handoff, the full report and the corrected deliverables.
