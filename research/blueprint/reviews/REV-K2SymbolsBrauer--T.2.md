# Independent review: K₂ field presentation

**Verdict: accepted.** Reviewer: Codex (GPT-6), session `codex-TGsPvS`, job `REV-K2SymbolsBrauer--T.2`, issue #9266. Date: 2026-10-14. The input was produced in a different session, `codex-8jRUHv`, in PR #9555; this reviewer did not write it.

This is acceptance of a complete target-level planning pass. T.2 remains **planned**, with explicit supplier obligations; it is not closed or formalized. The packet, reader and compact suggested file agree after the corrections below.

| Inventory | Reviewed result |
| --- | --- |
| Targets | 27: 17 verified, 9 corrected, 1 added |
| Kinds | 1 definition, 8 constructions, 17 theorems, 1 comparison |
| Definition/construction API entries | 49, including 6 added entries |
| Unit-test specifications | 30; every definition/construction has at least 3 |
| Atlas planets | 6; definitions, central constructions and named theorems |
| Baseline declarations | 17 confirmed: 13 original, 4 added |
| Source issues | 3 confirmed: 2 original, 1 added |
| Coverage | 1 planned stage, 0 closed stages; 3 gaps and 3 requests |

Every node has an individual verdict and evidence in `review.checked`. The new node carries `addedBy: REV-K2SymbolsBrauer--T.2`. All implementation statuses remain `unchecked`.

## Mathematical corrections

The original local-action target asserted all type-A Steinberg relations after checking the rank-one action and Weyl braids. The detecting homomorphism from Stₙ needs the separate root-lifting argument. The corrected order is local action relations, exactness of the global extension, Steinberg root lifts, then injectivity of the symbol comparison.

Added `symbol-extension-root-lifts`. Once E_c is an exact central extension of SLₙ(F), commutators of arbitrary lifts depend only on their quotient elements. The coroot commutator constructs root sections; torus rescaling kills the central errors in commutativity, additivity and the chain commutator formulas. This is the root-lifting part of [Steinberg, §7, Theorem 10 proof](https://www.math.utah.edu/~ptrapa/math-library/steinberg/steinberg-yale-notes.pdf), steps (1)–(9), printed pp. 79–82, and Corollary 1, p. 82. Infinity supplies the necessary scalar choices, so no small finite field is included in this argument. The theorem's universal-central-extension conclusion is not imported.

The root lifts must realize the prescribed coefficient map, not merely give some central extension. The explicit rank-one word calculation at the end of [Matsumoto's Lemma 6.8(a) proof](https://www.numdam.org/article/ASENS_1969_4_2_1_1_0.pdf), printed p. 47, identifies the root-word torus with the embedded torus. Lemmas 6.10(a) and 6.11(d), pp. 42–43, preserve its cocycle in the global extension. The added target therefore supplies the actual detecting map and its positive-overlap symbol equation. `infinite-symbol-injectivity` now depends on it. No injectivity of every stabilization map, compatibility of extension groups across ranks, or finite-rank universality is assumed.

The finite-field proof is independently valid: cyclicity and the nonsquare counting argument kill the universal pairing, then stable symbol generation kills classical K₂. It covers F₂, F₃ and F₄. Integral skew-symmetry is kept distinct from alternation; the real sign detector retains the nonzero diagonal class of order two. The +1 Cartan overlap gives the positive toral defect, while adjacent simple roots give its inverse.

## Baseline and API corrections

Read every original declaration at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, including its surrounding hypotheses and relevant evaluation formulas. All 13 original citations are valid; none was removed. In particular, `Submodule.liftQ` requires the relation submodule to lie in the map's kernel, `RingCon.mk'` works for the noncommutative quotient, and the reverse transvection formula has parameter -(dc).

The proposed raw tensor-word projection was unnecessary: Mathlib already has the direct-sum tensor-power equivalence. Added the following checked baseline references and reused them in homogeneity, low-degree components and the degree-two comparison:

- `TensorAlgebra.equivDirectSum`, in `Mathlib/LinearAlgebra/TensorAlgebra/ToTensorPower.lean`;
- `TensorPower.mulEquiv`, in `Mathlib/LinearAlgebra/TensorPower/Basic.lean`;
- `PiTensorProduct.isEmptyEquiv` and `PiTensorProduct.subsingletonEquiv`, in `Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean`.

Their commutative-semiring/module hypotheses specialize to ℤ and U without a basis or freeness assumption. The new target remains the Milnor quotient comparison, not another tensor-algebra decomposition.

Added `pairing_one_right`, torus multiplication and projection evaluation, and monomial conjugation, homomorphism extensionality and presentation lifting. These entries support actual downstream use of the extensions without unfolding their construction. The existing tests check the Steinberg relation, generator orientation, finite degenerations and survival of the real coefficient. Heavy extension and Milnor carriers remain reader targets; the suggested file contains light definitions on existing carriers and honest theorem placeholders.

## Sources, ownership and remaining work

Downloaded the four public source versions listed in the packet and checked their SHA-256 hashes against the original inventory. Read every cited node location and checked its hypotheses and match. The statements and proof plans are in our own words. No source excerpts were added.

Confirmed the repeated Bruhat cell in Rehmann, p. 7, and the inverse-defect discrepancy in the public Weibel chapter, Exercise III.5.9, p. 46. The latter is scoped to that author PDF; it makes no assertion about an uninspected published edition. Added the visible repeated condition label in Matsumoto, Lemma 5.6, printed p. 28: its intended list includes (S2). Raster inspection confirms that this is not an OCR error. Searches found no correction; no novelty claim is made. Added review verdicts and source-version records. Corrected the Steinberg Theorem 10 statement locator from printed p. 76 to p. 78, with its proof and PDF offsets given separately.

Read the current upstream ReductiveGroups and RepresentationTheory/RootSystems reader documents and relevant suggested signatures. Also checked current Tau Ceti and the reviewed `data/library-coverage.json` audit. The field presentation is not already implemented. Ordinary Bruhat/BN-pairs and Coxeter braid invariance retain their existing owners. The specific unique-middle root-coordinate and minimal-parabolic-coset interfaces are refinements of those owners' targets, not already displayed upstream signatures. Requests now state their hypotheses, conventions and consuming nodes, and `G-T2-upstream-refinements` records this remaining work.

The other two obligations remain unchanged: `G-T2-stable-imports` tracks the predecessor's stable representatives and centrality, and `G-T2-product-symbol` tracks the companion's exact Quillen product-symbol square. This review does not turn an abstract Matsumoto equivalence into that product equality. Coverage stays planned under PROTOCOL section 0.

For the orchestrator: route the two precise interface requests to the existing upstream owners, and retain the predecessor and graded-map obligations during assembly. No reviewer question prevents acceptance; these are recorded dependency refinements, not hidden claims of closure.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauer--T.2.json`: 0 errors, 0 warnings.
- `lean-check research/blueprint/suggested/K2SymbolsBrauer--T.2.lean`: exit 0 at the pinned shared build; 25 warnings, all for `sorry`. The final file is 161 lines and contains no sorry-filled data definition.
- Intake file validation and `git diff --check`: passed.

The reader includes every corrected target, the added root-lifting target, the additional library interfaces, the source corrections and the explicit remaining obligations. The suggested file imports the existing tensor-power interface and names the new reader targets without inventing absent carriers.
