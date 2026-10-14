# Independent review REV-K2SymbolsBrauer--T.1-2

Verdict: **accepted after corrections**. Issue #9263. Reviewer: Codex, session `codex-b4F9IN`, 14 October 2026. The input was written by another session, `codex-N3kPM4`; this reviewer did not write or previously review it.

The reviewed scope is the follow-up of T.1, not the predecessor's T.2 work. Acceptance means the planning arguments are correct under their recorded supplier contracts. It does not certify implementations of Steinberg groups, plus spaces, Hurewicz or K-spaces.

## Counts and changes

There are eight nodes: four constructions and four theorems. Five nodes are verified and three corrected, each with an individual `review.checked` verdict. The corrected packet has **28 API items, 19 discriminating tests, three planets, 25 baseline declarations, zero internal gaps and two supplier requests**. T.1 remains **planned**, with its two precise remaining supplier obligations. No node was added, no baseline citation was removed or replaced, and no source issue was added or rejected. Both inherited source issues were independently confirmed.

1. **Row API:** added `Steinberg.rowRoot_zero` and `Steinberg.rowRoot_neg`, making the identity and inverse simplifications explicit alongside the additive homomorphism law. The construction, hypotheses and four tests are unchanged.
2. **Compatibility of finite sections:** the imported perfect-extension rigidity theorem requires a surjective central *source extension*. The finite map St_m→St need not be surjective, so applying that theorem directly to the two lifts into Y was unjustified. For 5≤m≤n, both lifts give sections of Y×_St St_m→St_m. Apply rigidity from the identity extension of the perfect group St_m to this central pullback, then project to Y. The existing pullback prerequisite already supplies everything needed; no auxiliary node is appropriate at target granularity.
3. **Carrier-aligned K₂ comparison:** α lands in group homology of E, while the homology map induced by BE→BE⁺ starts in space homology. Named the imported natural comparison γ in the group-to-space direction and inserted it into β, the proof sketch, cover compatibility API, regression test and worked example. The composite is now α, γ, plus homology, inverse Hurewicz, then the cover map on π₂. Group and space homology are distinguished explicitly. The proof uses the constant integral coefficient specialization of H.1, and the early K.2:plus request supplies based ring-map comparisons; H.3's free-homotopy statement alone does not supply them.

The reader was synchronized throughout, including its review status and API count. All 25 baseline `checked` records now name this independent reconfirmation. The compact suggested file needed no signature change: the corrected heavy constructions are README targets because their carriers are absent at the pins.

## Sources and mathematical checks

All eight nodes' locators and their `match` claims were checked in [Weibel's combined author draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), dated 29 August 2013. The downloaded bytes match the recorded SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`. Statements below and in the deliverables are paraphrases.

| Use | Source locator | Printed / combined PDF pages |
| --- | --- | --- |
| Matrix convention and elementary image | III.1.2 | 180 / 188 |
| Steinberg presentation, stable map and centre | III.5.1–5.2.1 | 217–218 / 225–226 |
| Central extensions and universal-extension recognition | III.5.3–5.5 | 218–220 / 226–228 |
| Normalized lifts and finite splitting | III.5.5.1 | 220–221 / 228–229 |
| Column subgroup and special commutator calculation | Exercises III.5.2–5.3 | 228 / 236 |
| Plus homology, universal-cover case and K₂ comparison | IV.1.5–1.8.1 | 263–265 / 271–273 |
| Comparison conventions and naturality | IV.1.10; Exercises IV.1.8 and IV.1.11 | 266, 274 / 274, 282 |

The fresh-column and fresh-row arguments recover parameters from actual matrix entries. Stable faithfulness uses the injective GL tower, without assuming injectivity of Steinberg transitions. Choosing a fresh index outside both the finite kernel word and the tested root makes the conjugation arguments valid. Each root then factors as a commutator of those two faithful families. Surjectivity and the imported trivial centre of E give the converse inclusion.

For normalized lifts, central twists leave the commutator unchanged. A spare fifth index gives *exact* commuting lifts for non-chaining root pairs. The four-root word-reordering argument uses its stated commutations, rather than an unrestricted Jacobi identity. Intermediate-index independence, additivity and the reverse product −ba were checked with that convention. As an additional finite sanity check, all 2,064 qualifying triples in S₄ satisfy the compact file's four-root identity; the mathematical justification is the word calculation, not this finite check. Over M₂(ℤ), E₁₂E₂₁=E₁₁ while E₂₁E₁₂=E₂₂, distinguishing both column order and the row negative sign.

Finite splitting is stated only for n≥5. Perfectness supplies uniqueness; splitting does not establish centrality of St_n→E_n. The packet correctly retains that separate hypothesis for finite universality. Stable splitting uses the cofinal tail, compatible pullbacks and the genuine directed group colimit, followed by the predecessor's UCE recognition.

Both source issues were checked on the rendered combined-draft page 236 and [separate chapter III](https://www.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), PDF page 45. The separate file matches SHA-256 `ba1bc2d25680ab25c4baadc5ab28e39d1077dc66bb12ca4e2174b6cb55f81307`.

- `E-column-domain` is confirmed: the image has n−1 parameters. This is a domain misprint with no change to the intended construction.
- `E-triangular-orientation` is confirmed: the elementary image is upper unitriangular. The image of x₁₂(1) over ℤ rules out lower triangularity, and every generated diagonal entry is 1.

The [author's book page](https://sites.math.rutgers.edu/~weibel/Kbook.html), its linked official errata and an exercise-specific search were checked. Both `www` and `sites` errata URLs returned 404 on the review date. Whether these slips have a published correction remains unknown; no claim is made about the unconsulted published edition.

## Baseline and dependency closure

Every declaration's actual statement and surrounding hypotheses was read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The seven cited files in the shared pinned build were also compared byte-for-byte with the corresponding git objects.

| Cited module | Declarations checked |
| --- | ---: |
| Mathlib/Order/DirectedInverseSystem.lean | 9 |
| Mathlib/Algebra/Colimit/DirectLimit.lean | 4 |
| Mathlib/Algebra/Group/Commutator.lean | 1 |
| Mathlib/GroupTheory/Commutator/Basic.lean | 2 |
| TauCeti/GroupTheory/GroupExtension/FactorSetOfSection.lean | 5 |
| TauCeti/GroupTheory/GroupExtension/Cohomology.lean | 3 |
| TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean | 1 |

The colimit Group instance needs a nonempty directed index and homomorphic transitions; it does not need transition injectivity. The separately cited `mk_injective` is used only for GL. Commutators are xyx⁻¹y⁻¹, and the expansion and inverse identities have the needed orientation. Extension classification fixes an abelian kernel, quotient and action; centrality implies the specified trivial action through the existing bridge. Section normalization, factor-set realization and equality-of-class classification supply the predecessor boundary without a new classification construction. The commutative-ring restriction of `TauCeti.transvectionUnit` was independently checked for the compatibility tests; it is not used to justify the general associative-ring construction.

Read the relevant accepted predecessor statements, U.1's matrix and stable-group suppliers, H.1's bar/classifying comparison, H.3's plus homology, uniqueness, cover and induced-map contracts, and the current GeneralAlgebraicKTheory K.2:plus stage. The H=P cover case here is simply connected and does not invoke H.3's unrestricted nonabelian-target uniqueness gap. Constant coefficients do not require H.1's unresolved general local-coefficient cellular comparison. Absolute degree-two Hurewicz and its naturality are consumed from the existing AlgebraicTopology stage 8. The two stage requests correctly name the actual carriers and based-map compatibility still needed.

The reviewed library audit's eight T.1 targets are all accounted for in `targetCoverage`. Its low-degree-comparison overlap is resolved by ownership: this packet owns the classical comparison; GeneralAlgebraicKTheory's later low-degree stage consumes it. Only the earlier K-space stage is an input, avoiding that cycle. No Foundation bookkeeping or duplicate topology construction is introduced.

Current upstream main `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were screened independently. The nine roadmaps newer than the atlas snapshot, including the nested OperatorTheory suggested files, and the four named Completed roadmaps contain no competing Steinberg/K₂ target. Current library Steinberg occurrences concern representations, Lie maps or other relations, rather than this group presentation. The existing topology roadmap and pinned algebraic APIs are imported. SemisimpleAlgebras and QuiverRepresentations supplied the upstream roadmap models for the review.

## Validation and handoff

`lean-check research/blueprint/suggested/K2SymbolsBrauer--T.1-2.lean` exited 0 at the pins with exactly seven `sorry` warnings and no other warnings. This checks signatures, not proofs. The file has 109 lines, no placeholder data definitions and no substitute heavy carriers.

`python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauer--T.1-2.json` reports **0 errors and 0 warnings**, with the available pinned declaration index. All eight review entries and both source-issue verdicts are present. The four constructions retain respectively five, four, five and five tests. The three planet names identify mathematical constructions. The submission file check and `git diff --check` pass.

No question blocks acceptance. The orchestrator should retain the two precise supplier requests and the planned status during packaging, and keep the later GeneralAlgebraicKTheory low-degree comparison as a consumer. Nothing outside this job's packet, reader, report and handoff was changed.
