# Independent round-2 review of explicit K₀, Z.3–Z.6

**Verdict: needs_changes.** Codex, session `codex-5wpY0e`, reviewed revision round 2 independently for issue #6456 on 6 October 2026. The mathematical node inventory passes after the corrections below. The earlier reader assertion identifying the determinant of every virtual class with its top λ coefficient has been removed. A different, narrowly scoped source-attribution contradiction remains in the read-only reader’s errata appendix: E14 quotes Weibel’s author erratum with the wrong sign, and E13 calls its already recorded normalization correction new. Promotion copies that document verbatim. Reconcile those two entries with the corrected packet before accepting it.

The reader is not an authorized deliverable of this review. Its remaining defect is recorded here instead of edited. The verdict does **not** require implementing the recorded supplier gaps, proving the suggested file, or closing every stage before the next review.

## Counts and scope

| Item | Independently checked | Result |
| --- | ---: | --- |
| Nodes | 260 | 249 verified; 11 corrected; 0 added; 0 unverifiable |
| Pinned baseline citations | 375 | 217 Mathlib; 158 Tau Ceti; all confirmed; none removed |
| Distinct node source locator/excerpt pairs | 292 | Source text and surrounding hypotheses checked |
| Definitions and constructions | 72 | 19 definitions; 53 constructions |
| Their API entries / unit-test contracts | 450 / 280 | Reviewed, including plausible wrong-definition tests |
| All API entries / test contracts | 455 / 283 | Names represented in native forms or explicit planning comments |
| Source findings | 28 | 28 independently confirmed and attributed to this review |
| Planets | 18 | Z.3: 6; Z.4: 6; Z.5: 5; Z.6: 1 |
| Open gap groups / supplier requests | 3 / 16 | Retained explicitly |
| Native omission contracts | 31 | 30 omitted; 1 partial |

The packet remains a `complete` **planning pass**. Z.3, Z.5 and Z.6 remain `planned`; Z.4 remains `source_decomposed`. No stage is `closed`, and every node retains `implementationStatus: unchecked`. The remaining lists describe supplier and implementation work; the revision handoff’s statement that all remaining lists are empty is not an accurate description of the packet. It does not change the coverage verdict.

Every node has a fresh entry in `review.checked`, with the verdict, corrections where applicable, and checked source locators. Counts above concern mathematical contracts and source inspection, not executed Lean tests.

## What round 2 repaired

I read the previous independent report, revision handoff and revision audit, then checked the revised reader against the packet. Before this review’s edits, every node’s statement, hypothesis, proof step, acceptance example, API statement and test statement occurred in the reader. The determinant distinction is now correct throughout the affected mathematical sections: for an actual constant-rank projective P, its determinant is the Picard class of its top exterior line, whereas λ^r[P] is that line’s K₀ class. This does not extend to arbitrary virtual constant-rank classes. The rank-zero class [L]−[R] with nontrivial L has determinant [L] in Picard and λ⁰=1. The reader now includes this counterexample and preserves the distinction between the two carriers.

The extra planning signatures and test contracts for index ideals, pre-λ morphisms and quotients, weak line elements, and the composition/Newton polynomials are present. Their uniqueness assertions use injective elementary-symmetric substitution; Newton recursion does not divide by the index. The original blocker is resolved.

## Corrections made in this review

No new nodes or new generic owner constructions were needed.

| Existing node | Correction |
| --- | --- |
| Z.3/associated-projective-module | Specify that τ_P(det_i) is a K₀ class and its Picard class is det(P_i). |
| Z.4/index-ideal-eq-rel-norm | Replace obsolete clauses (v), (iii), (iv) with the explicit localisation, congruence and free-line index lemmas; add congruence/free-line direct prerequisites. |
| Z.4/ideal-restriction-determinant | Remove the obsolete clause (ii) reference. |
| Z.5/regular-curve-finite-resolution | Remove the obsolete clause (b) reference. |
| Z.5/skyscraper-class | Replace orphaned proof numbering with point-skyscraper-exact-sequence; correct the quoted formula’s page. |
| Z.5/principal-divisor-class-vanishes | Correct both source-match explanations to use [O/fI]−[O/I]=div(f), consistently with E27. |
| Z.6/ring-k-zero-pi-zero | Replace the free-matrix scalar-extension reference with Z.1/extend-scalars-projective-functor, whose actual statement supplies the additive functor on finite projectives. Split conflations give exactness. |
| Z.6/projective-line-rank-pic | Supply the omitted elementary γ computation and its direct exterior-filtration/pre-λ prerequisites. |
| Z.5/point-ideal-sheaf | Correct the quoted skyscraper formula to physical PDF p.155/book p.147. |
| Z.5/point-skyscraper-exact-sequence | Same page correction. |
| Z.5/point-divisor-line-inverse | Same page correction. |

For P¹, put z=[O]−[O(−1)]=[O(1)]−1, so z²=0 and the rank kernel is ℤz. The canonical exterior filtration makes the total λ assignment additive on exact vector-bundle sequences. Consequently λ_t(dz)=((1+[O(1)]t)/(1+t))^d=1+dz·t/(1+t), for every integer d. Substitution t/(1−t) gives γ_t(dz)=1+dz·t. All filtration generators of weight at least two vanish, so F²_γ=0; injective rank–determinant also gives SK₀=0. This elementary calculation needs no S.6/S.7 theorem and adds no such edge.

I refreshed all 375 baseline verification receipts and all 260 node verdicts. The public source versions actually acquired and checked in this run have dated hash receipts in `sourceVersions`; predecessor receipts remain historical. All 28 findings have fresh independent reasons and reviewer attribution. E13’s `known` status now identifies the existing author correction. E14’s locator now uses physical p.101, and its correction distinguishes the author’s positive exponential in the plus normalization from the valid optional negative exponential in the separately retained minus normalization. No new source finding was added.

In the suggested file I updated the review reference and compilation account, and removed two assertions of a completed Newton proof that could be misread as an elaboration claim. No native mathematical declaration was replaced with a surrogate.

## Sources and baseline

I checked cited excerpts and their local context, including hypotheses and conventions, in the public versions recorded in the packet. The deduplicated inventory has 292 locator/excerpt pairs. A normalized literal screen found 226; the remaining 66 required reading the actual PDF layout, formula glyphs or HTML rather than treating failed text matching as a mathematical discrepancy. All 66 received that contextual check. The skyscraper quotation page correction above is the concrete locator defect found.

The principal public texts read were Weibel’s [Chapter I](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.I.pdf), [Chapter II](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf) and [29 August 2013 combined author draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Serre’s published 1968 paper](https://www.numdam.org/item/PMIHES_1968__34__37_0.pdf), read in full; Soulé’s [published article download](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Cohen’s public manuscript](https://www.math.utoronto.ca/~ila/Cohen%20--%20Advanced%20topics%20in%20computational%20number%20theory.pdf); [Milne’s ANT notes](https://www.jmilne.org/math/CourseNotes/ANT.pdf); [Totaro’s public preprint](https://arxiv.org/pdf/math/0207210); [Bhatt–Scholze arXiv v3](https://arxiv.org/pdf/1507.06490v3); and the cited Stacks chapter PDFs and tags. For the dynamic Soulé download, the newly recorded hash differs from the historical receipt; conclusions are scoped to the version actually read. The 2013 K-book draft and Cohen manuscript are not falsely represented as collations with separately published editions.

I reread the source contexts of all 28 errata findings and checked their mathematical reasons. These include the split-field issue for ℚ[C₃], the k=1 Adams boundary, rank-zero Steinitz, the nonzero ideal boundary, the false transfer composite for ℚ→ℚ×ℚ, the nonfree pseudo-basis complement, the finite-free-stalks counterexample ∏F₂/finite-support ideal, the hyperplane ideal sign, valuations without a centre on an affine curve, and the P⁰ Picard exception. The Serre and BS17 proof gaps are recorded as missing arguments, not false conclusions. The Stacks principal-divisor cycle sign is checked on a DVR.

Before refreshing novelty claims I checked the author pages and relevant Stacks comments, and decoded/read all three pages of [Cohen’s public errata DVI](https://www.math.u-bordeaux.fr/~hecohen/errataadv1.dvi). Direct retrieval of the [Weibel errata PDF](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf) failed. Its search-indexed opening page was available and read; it already records the plus normalization and positive exponential. That is enough to correct E13/E14 attribution. It is not a claim to have acquired a fresh complete errata PDF or collated the entire printed book.

I read all 375 cited declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, including surrounding scopes and the relevant structure fields, then checked their consumers. Particular scope checks include BinomialRing’s additive torsion-freeness, the sum-to-one condition on complete orthogonal idempotents, invertible-module evaluation, right-comodule conventions, finite local bases for invertible sheaves, and projectivity in Euler-class independence. No baseline citation had to be removed or replaced. The scalar-extension correction is to a blueprint supplier citation, not a pinned-library citation.

## Closure, ownership and geometry

The full-node pass covered the abstract λ/γ algebra, universal symmetric polynomials, exterior filtrations, rank fibres, tensor/exterior determinants, Picard and Steinitz interfaces, localization and norms, vector-bundle exact K₀, regular curves, integral comodule Euler reductions and formal characters, product GL coordinate algebras, graded Picard signs and coherent determinant/support comparisons. Definitions have usable API outlines and at least three tests, including zero/empty/disconnected cases and counterexamples to tempting wrong definitions. The 18 planets satisfy the six-per-stage bound and name central mathematical objects and results.

I read the four relevant rows of the reviewed library audit, the accepted RS-18 ownership proposal, both supplied red-team findings, the actual statements and hypotheses of the direct external supplier nodes, and the requested stage descriptions. I also read the upstream GrothendieckEulerForms and SchurWeyl roadmap documents in full. Existing SplitK0, ExactK0, the categorical Cartan map, module Euler class, Pic/ClassGroup comparison, relative norm and scheme divisor constructions are reused. New nodes provide the missing comparisons and arguments rather than parallel presentations.

The integral Serre comparison requires a free coefficient coalgebra for its finite-hull argument, not merely the flatness obtained by localization. Fibre-product Euler proofs do not assume projectivity in the comodule category, and residue specialization uses derived Euler reduction rather than a false arbitrary exact tensor functor. Single-factor GL coefficient interfaces and their finite-product square do not themselves prove exact-category/K₀ transport, integral freeness or equality of arbitrary-field character images. ClassicalGroups supplies only the complex comparison. These boundaries are explicit.

For schemes, vector bundles use the exact, not automatically split, K₀. Finite local bases exclude unbounded-rank and merely stalkwise-free sheaves. Pullback preserves the short exact vector-bundle sequences by local splitting even when the scheme map is not flat. In dimension at most one, the affine-diagonal theorem and the regular resolution argument remove an unnecessary separatedness hypothesis; the general perfect/vector-bundle comparison still retains its actual resolution-property hypothesis. The divisor point normalization is positive O(y), with ideal O(−y). No rational origin or rational point is silently inferred.

**RT-AREA-ktheory-1/31:** the doubled line is not the failed K/G example. It is a valid nonseparated regular-curve test with K₀(Vect X)≅ℤ² and Pic(X)≅ℤ. The doubled plane, whose vector-bundle and coherent/perfect degree-zero groups differ, is the obstruction used by the relevant supplier. The packet and reader preserve that distinction.

**RT-AREA-ktheory-2/41:** Z.5 imports early Z.3 algebra and the necessary S.2/S.3 comparisons, not S.6; Z.6 imports S.2/S.5, not S.7. The new P¹ calculation above keeps that correction intact. Generic tensor products, spectra, support K and descent are requested from their owners. No edge to MotivicEtaleKTheory M.4 is added.

Three gap groups remain: general Picard duality/pullback from JacobianChallenge A; integral GL freeness and arbitrary-field character comparison; and homotopy-coherent determinant/perfect v-site/support interfaces. The stronger SF.1 and H.5 requirements exceed their present text and remain requests, including smooth approximation/continuity for the arbitrary regular BS17 case. The graded Picard groupoid retains units as automorphisms and Koszul self-braiding; forgetting grade gives an E₁/space splitting, not a symmetric spectrum splitting. The Witt determinant uniqueness is in the natural coherent mapping space, not uniqueness of an arbitrary objectwise π₀ map.

## Validation and exact remaining action

`python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryLowDegrees--Z.3.json` reports **0 errors, 0 warnings**. The source-issue and source-version validators used by the errata checker also pass when applied to the packet’s respective fields. The standalone errata-job CLI requires `errata-v1` and an errata filename; applying it to a blueprint packet is not the correct validation mode. JSON parsing, review inventory completeness, the definition/construction test bound, omission-contract agreement and `git diff --check` are included in final validation.

`lean-check research/blueprint/suggested/KTheoryLowDegrees--Z.3.lean` was attempted after checking memory. It exited at the missing prebuilt `TauCeti.Algebra.AlgebraicGroup.GeneralLinear.DiagonalTorus.Basic` import before elaborating the suggested declarations. The shared build matches the Mathlib pin but not the Tau Ceti pin; no available prebuilt checkout matches both. No library build, cache fetch, Lake project or language server was started. Static inspection covers the entire suggested source and all 31 explicit omission contracts, but does not establish that any signature elaborates or any test executes.

For the orchestrator/revision worker: reconcile the read-only reader’s E13/E14 at its errata appendix (currently lines 11193–11194) with the corrected packet. E13 is already known from the author’s errata. E14 must attribute the **positive** exponential to that erratum’s plus normalization; the negative exponential may be retained only as the separate minus-normalized alternative. Remove the incorrect verbatim attribution and fix its combined-draft page to 101. Also carry over the eleven local clarification/reference changes above when regenerating the reader, and retain its already repaired determinant counterexample. No new owner decision is needed to resolve this review verdict.
