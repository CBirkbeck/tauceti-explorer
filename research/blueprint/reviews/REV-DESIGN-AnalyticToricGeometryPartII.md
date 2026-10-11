# Independent review: Analytic toric geometry, Part II

Issue: [#4591](https://github.com/CBirkbeck/tauceti-explorer/issues/4591). Reviewer: Codex, session `codex-y9u2mW`. Date: 2026-10-11. The design was written by the different session `codex-BtPquw` in [#4583](https://github.com/CBirkbeck/tauceti-explorer/issues/4583), submitted in [#8682](https://github.com/CBirkbeck/tauceti-explorer/pull/8682).

**Verdict: needs changes before publication.** The authorised packet, roadmap definition and suggested file have been corrected. All 29 nodes are now justified at target level. The existing [reader](../readmes/AnalyticToricGeometryPartII.md) still contains the mathematical errors corrected here, and promotion copies that reader without regenerating it. Issue #4591 lists only the definition, packet, suggested file and this report as deliverables; WORKERS.md requires editing only those files and the worker's handoff. The reader was therefore inspected but not changed. Publishing it alongside the corrected packet would leave a contradictory roadmap. This is the sole reason the corrected packet is not accepted.

| Item | Result |
|---|---:|
| Nodes checked | 29 |
| Verified / corrected / added / unverifiable | 17 / 12 / 0 / 0 |
| Definitions and constructions | 12 |
| API items | 61 (9 added) |
| Discriminating tests | 39 (3 added; 1 corrected) |
| Planets | 28; at most 6 per stage |
| Baseline citations | 8 confirmed; 2 records corrected; 0 removed |
| Supplier requests | 8; the C0 property export was strengthened |
| Stage coverage | 7 planned, 0 closed |

All implementation statuses remain `unchecked`. The eight supplier requests and the explicit geometric prototype limitations are honest planning boundaries, and do not themselves justify returning the plan. No new mathematical target node was necessary. The per-node verdicts and evidence are in the packet's `review.checked` array.

## Mathematical corrections

1. **Projection line test.** The former claim that the tilted algebraic line never equals the projection-preimage is false in characteristic p, where sharp is additive under the tilt identification. The corrected mixed-characteristic test uses residue characteristic 2: the tilted point [1:1:0] satisfies the line equation, whereas its sharp image does not, since 2 is nonzero in K. The characteristic-p additive control is a fourth projection test. Both coordinate portions appear in the suggested file; the full projective fixtures still require the declared supplier types. See Scholze's discussion following Theorem 1.13, pp. 249–250, and Theorem 8.5, p. 305.

2. **Convolution API.** The native c₀ carrier has a pointwise multiplication, which is not character multiplication. Added singleton constructors, convergent coefficient convolution, monomial multiplication and submultiplicative Gauss-norm signatures for the perfected sections and graded divisor algebra. On P¹, weights 0 and 1 in O(D₋) multiply to weight 1 in O(2D₋); their disjoint coefficient supports would have zero pointwise product. For D=0, degrees 1 and −1 multiply to degree zero. These tests supplement the original c₀ and grading tests. The construction remains the coefficient completion used in Proposition 8.7, p. 306.

3. **Nonzero approximation.** Added the necessary nonzero input condition. At a coarse threshold the generic homogeneous approximation can be zero. Apply the same supplier estimate at a finer c′≥c, with |ϖ|^{c′}<‖f‖ at the Gauss valuation. Its relative error is then strictly smaller than ‖f‖, forcing g≠0, while still implying the estimate at the original threshold. Finite-support perturbation retains a selected nonzero coefficient using an error below both that coefficient's norm and the domain threshold. The Lean coefficient approximation now explicitly concludes g≠0. Denominator clearing gives a section of O(p^N D), using the independently confirmed extraction correction `PAPER-SCHOLZE-12/E11`; it is not a global function on the proper variety. See Lemma 6.5 and Remark 6.6, pp. 288–290, and Proposition 8.7, p. 306.

4. **Field of definition and reduction.** The old proof reduced after base change and then asserted that the reduced scheme remained defined over an arbitrary, possibly imperfect k₀. That implication fails. For instance, x^p−t gives a reduced scheme over F_p(t), but after passing to a perfect extension its geometric reduction is the point x=t^{1/p}, whose reduced closed scheme does not descend to F_p(t). This checks the reduction step; it is not offered as a dense-field instance of the approximation theorem. The corrected endpoint retains a closed model Z₀ over the prescribed dense subfield, and states dimension and analytic containment for Z₀×K♭ and its geometric reduced support. Reducing Z₀ is permitted, but its base change need not be reduced. Over perfect k₀ it is geometrically reduced. This preserves the geometric content used in Scholze's Corollary 8.8, p. 307, without adding a reduced-scheme descent assertion to its proof. The relevant general distinction is in [Stacks §33.6](https://stacks.math.columbia.edu/tag/035U), Lemmas 33.6.3 and 33.6.4, tags 020I and 035X. A consumer requiring the stronger reduced field-of-definition statement must supply a separate argument.

5. **Closure and imports.** C0's arbitrary-ring chart node does not by itself assert normality of field fibres. Expanded the existing C0 request to export normal geometrically integral field fibres and the distinct codimension-one ray orbit closures, as well as smoothness and properness. Added the native sheaf's codimension-one DVR hypotheses to its baseline record and the field-fibre comparison proof. Added finer existing SF.0 dimension/Cohen–Macaulay, SF.5 Chow/Chern/refined-intersection/degree/ample and H0 ordinary-cohomology dependencies. The remaining finite-orbit duality, positivity, valuation-ring base change and cup functoriality are still precise supplier requests, not claims that those suppliers have closed their stages.

6. **Integral plus ring and current API.** Added the multiplicative Gauss-norm argument that identifies K°⟨Pσ⟩ with the power-bounded, integrally closed coefficient subring. Current Tau Ceti now has `TauCeti.AdicSpace` and native open restriction in `PreAdicSpace/Adic.lean`. The packet requires reuse of that carrier when strengthening the toric signatures. The module is absent at the historical pin; its absence only explains the pinned TopCat prototypes, and must not be interpreted as a current-main planning gap.

The roadmap introduction and NT.6 description agree with these corrections. The distinction between a unit disc and full affine-line analytification, complete versus projective fans, relative versus absolute Frobenius, and invertibility versus identity on torsion cohomology was already correct and was independently checked.

## Source and baseline evidence

The three source PDFs were independently fetched from the public URLs in the packet and their SHA-256 hashes matched. No private book was used, and no source excerpt or source file is included in this submission.

- Scholze, *Perfectoid spaces*, published IHÉS 116 (2012): Theorem 1.5, p. 247; Theorem 1.13 and its discussion, pp. 249–250; Lemma 1.16, p. 251; Proposition 5.20, p. 280; Lemma 6.5 and Remark 6.6, pp. 288–290; the limit results of §7, pp. 302–303; and §8, pp. 303–307. All node locators use published pagination. The existing confirmed E11 is incorporated; `sourceIssues: []` records that no additional source error was found.
- Fulton–Sturmfels, *Intersection theory on toric varieties*, arXiv:alg-geom/9403002v1: Proposition 1.1, p. 4; the degree map, p. 5; Proposition 1.4 and Theorem 2.1, p. 6; Corollary 2.4, p. 7; Proposition 3.1, p. 10; Theorem 3.2, p. 11, with proof pp. 12–13. The wall sign uses the negative of the local section-generator weight; the displacement index is computed in the quotient by the output cone. Refined support is needed for the excess-intersection application.
- Fujino–Sato, *On non-projective complete toric varieties*, author version 0.27: Example 4.1, pp. 7–8. Its complete regular nonprojective fan tests the absence of a projectivity hypothesis before NT.6.
- Stacks §33.6: the two numbered lemmas cited above support the added reducedness distinction.

All eight baseline declarations were read at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` or Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, with their surrounding hypotheses. `IsToricCone` is a structure, and its metadata is corrected. `SchemeWeilDivisor.sheaf` requires codimension-one stalk DVR instances as well as integrality and local noetherianity; its corrected record states those conditions. The remaining six citations supply the native fan, primitive generator, Weil carrier, order system, additive monoid algebra and c₀ carrier as claimed.

Duplication and ownership checks used the reviewed library coverage, accepted RS-32 boundary, current AnalyticToricGeometry README and Suggested.lean, current AdicSpaces README, and the relevant current library sources. Current snapshots are TauCetiRoadmap `070dc2becd74419e76303ede84b465ed4a69461f` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The parent supplies the finite-fan combinatorics and complex geometry; C0 supplies the arbitrary-base schemes. Neither is re-planned here. The read-only trees were not built or modified.

## Validation and orchestrator action

`python3 scripts/check_blueprint.py research/blueprint/packets/AnalyticToricGeometryPartII.json` reports **0 errors and 0 warnings**. `lean-check research/blueprint/suggested/AnalyticToricGeometryPartII.lean` succeeds with 110 declaration-uses-`sorry` warnings and no other warnings or errors. The shared build's five imported Tau Ceti source files match the pinned source bytes. A separate name audit finds all 29 target declarations, 61 API names and 39 test labels, at least three tests for each definition/construction, and no implementation-status change. Elaboration validates the signature forms, not proofs or the omitted geometric conditions.

The orchestrator must authorise and synchronise the reader before acceptance. In the current reader, update the introduction (sharp and geometric reduction), `NT.0/divisor-sections`, `NT.1/unit-toric-space`, `NT.2/perfected-divisor-sections`, `NT.2/graded-divisor-algebra`, `NT.3/projection`, `NT.5/dense-field-approximation`, and `NT.6/complete-intersection-approximation`. Synchronise the changed prerequisites, the expanded C0 request, the current-main carrier note and the added Stacks source as well. The corrected packet and roadmap definition provide the exact replacement statements, APIs, tests and proof steps. In particular, the existing reader's projection test around line 469 and its reduced k₀-defined endpoint around lines 681–687 must not go upstream unchanged.

No additional question about the mathematical packet remains. Once an authorised edit makes the reader agree, the review can be accepted with the same supplier and prototype boundaries; no second design pass is required by the mathematical corrections.
