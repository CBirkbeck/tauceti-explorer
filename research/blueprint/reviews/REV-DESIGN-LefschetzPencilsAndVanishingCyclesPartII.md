# Independent review: prescribed finite-field points

Accepted with corrections, 19 October 2026. Reviewer: Codex, session `codex-dLdsPk`, job `REV-DESIGN-LefschetzPencilsAndVanishingCyclesPartII`, issue #3558. The design handoff identifies the author as session `codex-wuPx6G`; this reviewer did not write that design.

The packet is a complete target-level pass with six nodes: one definition, one construction, one lemma and three theorems. It has fifteen API items, eight unit tests, five planets and nineteen baseline declarations. FC.0 and FC.1 remain closed relative to the two exact shared foundation contracts. There are no local gaps, supplier requests, added nodes or removed baseline citations. Every implementation status remains unchecked.

## Mathematical review

All node statements, hypotheses, proof steps, prerequisites, uses and source matches were checked. The following table uses the suffixes of node ids under `LefschetzPencilsAndVanishingCyclesPartII:`.

| Node | Verdict | Check and correction |
| --- | --- | --- |
| `FC.0/polynomial-graph` | corrected | The real definition specializes the native evaluation homomorphism over any commutative ring. Zero-based coordinates give the first coordinate exactly T, including base zero. The six normalization and coefficient-change API items suffice. Corrected the evaluation locator and strengthened the suggested F₂ and zero-variable examples to express their discriminating conclusions. |
| `FC.0/bounded-support-coefficients` | corrected | Equal-length lists of bounded digits encode finite exponent vectors injectively, including the empty vector. Monomial evaluation and finite coefficient extraction give the coefficient identity over a commutative ring; neither a domain nor pointwise injectivity is needed. Corrected the monomial locator to include its full statement. |
| `FC.0/graph-surjective` | corrected | Every univariate polynomial has the preimage obtained by replacing its variable by coordinate zero. Positive coordinate count is essential; no bound on the base is needed. Corrected the variable-evaluation locator, which previously ended before the cited declaration. |
| `FC.0/avoiding-graph` | corrected | A maximum over the finite support gives a strictly larger base. Coefficient preservation gives nonvanishing; surjectivity gives a scheme closed immersion. Over a field its principal open is nonempty and dense, even when it has no rational point. Extended the closed-immersion locator through the complete declaration. |
| `FC.1/marked-etale-pullback` | corrected | Read both SF.0 supplier contracts. The affine pullback is finite type and étale over the affine line. Its marked connected component is open and closed, affine, smooth of dimension one and geometrically integral. The nonempty open image of its projection meets the nonzero-polynomial principal open, so the required inverse image is nonempty and dense. Base extension preserves this fixed component and its good open. Added the geometric-connectedness source anchor, corrected the openness locator, and distinguished the partial algebraic Lean examples from the full reader tests. |
| `FC.1/same-field-curve` | verified | Shrinking preserves density. Positive dimension uses the marked pullback. In dimension zero the integral finite-type étale chart is a finite separable field extension admitting a k-point, hence is Spec k; the constant map from the affine line gives a dimension-one source. The endpoint promises a curve morphism, with the original rational marked residue field. No immersion, properness, multipoint conclusion or rational point of the good open is needed. |

The definition has four tests and the construction has four tests. They detect incorrect weights, non-strict exponent bounds, a missing coordinate-count hypothesis, loss of the boundary mark, choosing all components, and choosing a component without consulting the mark. The F₃ disconnected example is valid: substituting the graph gives z²=(T+1)²; invertibility of z makes T+1 invertible, and the two factors are comaximal because 2(T+1) is a unit. The point (0,1) selects the plus branch. The full construction's nine API items cover its actual component, inclusion, projections, mark, structure, good open, identity-chart comparison and fixed-choice field extension.

There are three FC.0 planets and two FC.1 planets. All name the local definitions or central derived results, and no layer exceeds six. FC.0 precedes FC.1, whose only external mathematical supplier is SF.0. No smaller proof step needs promotion to a target-level node.

## Sources and version scope

Read the following public sources directly, including the statements and arguments at every node locator:

- Kisin–Zhou, [arXiv:2103.09945v2](https://arxiv.org/pdf/2103.09945v2), 7 October 2024: Proposition 5.2.3 and Remark 5.2.4, pp. 49–52; Corollary 5.2.7 and its proof, pp. 52–53; Proposition 5.3.5 and its proof, p. 54. The singular local-model construction is outside this roadmap; the two smooth-chart curve uses motivate its endpoint.
- Poonen, [author PDF dated 31 August 2004](https://math.mit.edu/~poonen/papers/bertini.pdf), §3.3, Theorem 3.3, surrounding remarks and Corollary 3.4, p. 10. The corollary assumes a smooth projective geometrically integral ambient variety. It is a hypothesis comparison, not an input to the graph proof.
- Stacks [054L](https://stacks.math.columbia.edu/tag/054L), Lemma 29.37.21, smooth local coordinates; [0CDW](https://stacks.math.columbia.edu/tag/0CDW), Lemma 33.25.10, geometric integrality of a variety with a smooth rational point; and [04KV](https://stacks.math.columbia.edu/tag/04KV), Lemma 33.7.14, geometric connectedness from a rational point on a connected scheme. These online statements and proofs are unpaginated.
- The exact pinned Mathlib declarations inventoried below, including surrounding hypotheses and namespaces.

The graph and coefficient argument are identified as derived specializations. No claim is made that Kisin–Zhou print this proof. No source passage or section-by-section source summary was added; no `excerpt` field remains.

Confirmed source issue `LefschetzPencilsAndVanishingCyclesPartII/E1` with an independent review record. In the inspected Kisin–Zhou preprint, the two smooth-atlas uses of Poonen Corollary 3.4 do not supply its projective ambient hypothesis. This is a missing justification at the citation, not a false endpoint or an error in Poonen's corollary. The local graph construction supplies the particular one-point curve morphism required here.

Added the issue's source id, explicit `sourceVersions`, PDF hashes and the bounded correction search. The [arXiv history](https://arxiv.org/abs/2103.09945) lists v2 as its latest version. The [Annals metadata](https://annals.math.princeton.edu/2025/202-3/p03) was read, but the full-article DOI redirected to a Project Euclid access challenge. The published article text was not read or compared. The finding is expressly confined to arXiv v2; this review makes no claim that it persists in the version of record or that it is new. The inspected PDF hashes are recorded in the packet and Poonen's hash is also in both source catalogues.

## Baseline and ownership

All nineteen baseline entries exist at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Each statement and its hypotheses were read, rather than inferred from its name. Paths in the table are relative to Mathlib; line numbers are at that commit.

| Declaration | Module and starting line | Sufficiency |
| --- | --- | --- |
| `MvPolynomial.eval₂Hom` | `Algebra/MvPolynomial/Eval.lean:158` | Native coefficient-preserving evaluation ring map; semiring hypotheses permit the commutative-ring specialization. |
| `MvPolynomial.eval₂Hom_C` | `Algebra/MvPolynomial/Eval.lean:181` | Constant formula. |
| `MvPolynomial.eval₂Hom_X'` | `Algebra/MvPolynomial/Eval.lean:185` | Coordinate formula. |
| `MvPolynomial.eval₂Hom_monomial` | `Algebra/MvPolynomial/Eval.lean:203` | Coefficient times the finite product of coordinate powers. |
| `MvPolynomial.comp_eval₂Hom` | `Algebra/MvPolynomial/Eval.lean:189` | Evaluation composition, used for zero specialization and coefficient change. |
| `Nat.ofDigits_inj_of_len_eq` | `Data/Nat/Digits/Defs.lean:312` | Requires base greater than one, equal list lengths and individually bounded entries, exactly as used. |
| `Nat.ofDigits_eq_sum_mapIdx` | `Data/Nat/Digits/Lemmas.lean:37` | Identifies the digit value with its positional sum. |
| `AlgebraicGeometry.IsClosedImmersion.spec_of_surjective` | `AlgebraicGeometry/Morphisms/ClosedImmersion.lean:98` | Surjective ring map gives the contravariant spectrum closed immersion. |
| `AlgebraicGeometry.Etale.etale_isStableUnderBaseChange` | `AlgebraicGeometry/Morphisms/Etale.lean:72` | Applies to the actual scheme pullback. |
| `AlgebraicGeometry.Etale.iff_smoothOfRelativeDimension_zero` | `AlgebraicGeometry/Morphisms/Etale.lean:106` | Étale projection has smooth relative dimension zero. |
| `AlgebraicGeometry.SmoothOfRelativeDimension` | `AlgebraicGeometry/Morphisms/Smooth.lean:130` | Native relative-dimension predicate. |
| `AlgebraicGeometry.smoothOfRelativeDimension_comp` | `AlgebraicGeometry/Morphisms/Smooth.lean:192` | Adds the projection's zero and affine line's one. |
| `AlgebraicGeometry.Flat.generalizingMap` | `AlgebraicGeometry/Morphisms/UniversallyOpen.lean:131` | Étale supplies flatness. |
| `AlgebraicGeometry.isOpenMap_of_generalizingMap` | `AlgebraicGeometry/Morphisms/UniversallyOpen.lean:107` | Étale supplies the locally finite presentation hypothesis. |
| `AlgebraicGeometry.Scheme.Hom.isOpenMap` | `AlgebraicGeometry/Morphisms/UniversallyOpen.lean:45` | Consumes universal openness; the flat and locally finite presentation instance supplies it. |
| `AlgebraicGeometry.GeometricallyIntegral` | `AlgebraicGeometry/Geometrically/Integral.lean:40` | Native field-base-change integrality predicate; its module also supplies base-change stability. |
| `Algebra.SubmersivePresentation.isStandardSmoothOfRelativeDimension` | `RingTheory/Smooth/StandardSmooth.lean:93` | Finite generators and relations; the affine line has one generator and no relations. |
| `IsOpen.dense` | `Topology/Irreducible.lean:201` | Needs a nonempty open and preirreducible target, both proved before use. |
| `IsOpenMap.denseRange_of_isPreirreducibleSpace` | `Topology/Irreducible.lean:205` | Needs nonempty source, open map and preirreducible target. |

No citation needed replacement or removal. Corrected narrow source line ranges for evaluation, monomial evaluation, coordinate evaluation and closed immersion. The source catalogue's old openness range omitted `Flat.generalizingMap` and `isOpenMap_of_generalizingMap`; it now includes both declarations. The packet and roadmap source catalogues agree.

Read `SchemeAndStackFoundations:SF.0/etale-coordinates`, specifically (b) the integral affine chart translated to zero and (c) the lower-dimensional boundary-image closure, and `SchemeAndStackFoundations:SF.0/rational-point-component`, specifically its smooth rational component contract. They suffice without importing the supplier's entire stage as an unexplained proof step. The enclosing SF.0 packet's wider `needs_changes` verdict remains disclosed. This acceptance does not approve or implement that supplier packet.

Read the reviewed LPV.3 audit in `data/library-coverage.json`, its full stage description and the relevant atlas edges and link records. It owns projective pencils and permits finite extension of the field; this does not duplicate the local same-field supplier. The local proof has no inertia or vanishing-cycle dependency.

The duplication screen used current read-only TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27`, including the additions absent from the atlas snapshot, and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read the nearby AlgebraicCurves and StableReduction documents for scope, carriers and component conventions. Current Tau Ceti's `TauCeti.AlgebraicGeometry.Smooth.geometricallyIntegral` already supplies geometric integrality from smoothness and geometric connectedness; its statement was read and the reader now identifies it as shared component input. It is not a new local target or a claim about the older pin. No existing roadmap or library theorem providing the specific graph-avoidance or marked curve-existence targets was found.

## Corrections and suggested-file scope

The mathematical targets and six node ids are unchanged. Corrections are the precise source locators, added geometric-connectedness anchor, source-issue review and version records, current-library ownership clarification, actual inline-math delimiters in the reader, and stronger suggested examples.

The F₂ example now includes both nonvanishing after nonlinear substitution and polynomial vanishing along every rational parametrized line. The zero-variable example includes nonsurjectivity over a nontrivial coefficient ring. The boundary example includes evaluation at the marked zero, the F₃ example factors the actual pullback equation and distinguishes its branches at the mark, and an origin example states the dense principal open in characteristic two. These are signature checks with unimplemented proofs.

Following WORKERS.md's current roadmap shape, the single light definition has a real body; the end theorem and milestones use existing polynomial and scheme carriers. The full marked-component construction, its nine API items, the localization and component identifications in the tests remain targets in the reader. The native pullback and polynomial examples are explicitly identified as parts of those full tests. No sorry-backed data definition, substitute curve carrier or auxiliary theory development was introduced.

## Validation and orchestrator decisions

- `python3 scripts/check_blueprint.py research/blueprint/packets/LefschetzPencilsAndVanishingCyclesPartII.json`: zero errors and warnings.
- `lean-check research/blueprint/suggested/LefschetzPencilsAndVanishingCyclesPartII.lean`: exit zero at the pinned shared build. The 193-line file emits twenty-one warnings, all for unimplemented proofs; there are no other warnings or errors.
- Source-issue and source-version schema checks: passed. All six node ids occur exactly once in the accepted review, and both stage coverage records remain closed.
- JSON parsing, allowed-deliverable inventory, source/reader consistency, absence of excerpts and private paths, and `git diff --check`: passed.

The original design issue #3359 explicitly permits planning its first independent direction and proposing the rest as a split. The first route is realized by FC.0–FC.1. The packet and original design handoff preserve the other routes: one combined `UniversalHypersurfaceMonodromy` owner for Browning–Sawin and Schiffmann, and `SemistablePotentialMaps` for the Liu et al. route. The maintainer still applies that allocation; the split proposal is not an assertion that those roadmaps are planned. No new request or upstream edit is needed for the accepted local plan.
