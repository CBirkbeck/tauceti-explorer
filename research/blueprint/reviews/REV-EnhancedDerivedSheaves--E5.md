# Independent review of EnhancedDerivedSheaves E5

Accepted on 11 October 2026 by Codex, session `codex-OMk0OV`, for issue #397. This reviewer did not write the blueprint or its earlier checkpoints. The verdict accepts a complete **target-level planning pass**, as PROTOCOL §0 permits. It does not assert proof closure or implementation: all six stages remain `planned`, all 44 nodes remain `unchecked`, and the four gaps, seven supplier requests and six signature-omission records remain explicit.

The reviewed files are [the packet](../packets/EnhancedDerivedSheaves--E5.json) and [the suggested file](../suggested/EnhancedDerivedSheaves--E5.lean). The packet's `review.checked` contains an individual finding for every node: **31 verified, 13 corrected, none added or unverifiable**. It has 11 definitions, 13 constructions, 17 theorems and three comparisons; 80 API items, 72 packet tests, 74 Lean examples and 19 planets. Every definition/construction has at least three discriminating tests. Planet counts by leaf stage are 6, 6, 4, 2 and 1; names satisfy the six-per-layer and 60-character limits.

## Corrections made

| Node suffix | Correction and evidence |
|---|---|
| `symmetric-monoidal-infinity-category` | An ordinary weak monoidal category needs its finite-list operadic construction and coherence. The cited strict Grothendieck construction alone does not produce a split operadic fibration. The prototype now reuses Mathlib's existing homotopy-category carrier and induced functor. |
| `monoidal-categories-over-an-operad` | Added HA Definition 2.1.3.7, p. 185, for the distinction between strong and lax maps. |
| `algebra-objects` | A general cuts composite is a diagram in the total operadic category. A product-valued Segal object in the underlying category requires cartesian tensor. Restricted its test to cartesian sets and included the terminal zero level. Added the general relative section constructor and colourwise evaluation; the existing symmetric-monoidal signature is explicitly a pullback specialization. Added the unnumbered cuts construction in NS Appendix B, p. 140, before Proposition B.1. |
| `module-objects` | Required realizations in both the tensor category and its module category, preserved separately by tensor and action. Added HA Definition 4.2.1.19, p. 508, to the LM-module and bar construction citations. |
| `monoidal-envelope` | Arity counts isomorphism classes. The Lean test now uses their quotient, matching the packet's existing test; no chosen skeleton is assumed. |
| `module-descent-and-functoriality` | Corrected the Mathew locator types: 3.21 is a corollary, 3.26 a definition. Proposition 3.25 tests descendability in a finite limit of categories. |
| `formal-tensor-inversion` | Added Robalo Remark 4.23, p. 91, which transfers the telescope argument to presentable categories. The cyclic permutation hypothesis remains essential. |
| `universal-property-of-ind` | Restricted finite-colimit-preserving inputs yielding all-colimit-preserving extensions to ω-Ind and presentable targets. For larger κ the corresponding accessible criterion uses κ-small colimits. Added HTT Proposition 5.5.1.9, printed pp. 461–462, and HA Corollary 4.8.1.14(2), pp. 711–712. |
| `limits-of-presentable-categories` | Corrected Diamonds Lemma 17.1 to p. 96. Its uncompleted category is distinguished from the completion in Proposition 26.2. |
| `neeman-compactness-criterion` | Extended Diamonds Proposition 23.7 to its proof on p. 145, where compact generation and the adjoint argument occur. |
| `rigid-presentable-categories` | Required a **colimit-preserving strong symmetric monoidal** input. Its right adjoint is linear over the source category and preserves colimits. Added RamziRigid v2 Observation 4.51, pp. 34–35; the prototype now takes an object of the corresponding functor category. |
| `sifted-colimits` | Replaced a broad locator with HTT Definition 5.5.8.1, Warning 5.5.8.2, Example 5.5.8.3, Lemma 5.5.8.4, Propositions 5.5.8.6–7 and Lemma 5.5.8.11, printed pp. 506–508. |
| `derived-witt-adapter` | Made the coordinate comparison a pointed-homotopy-set identification, additive in positive degrees. Its degree-zero ring is W(π₀A) with Witt addition, rather than coordinatewise addition. The Lean equivalence already used underlying types; its comment now states this limit. |

These source checks use the packet's pinned public copies of [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), [Nikolaus–Scholze](https://people.mpim-bonn.mpg.de/scholze/CyclotomicSpectra.pdf), [Mathew](https://arxiv.org/pdf/1404.2156), [Robalo](https://arxiv.org/pdf/1206.3645), [Ramzi v2](https://arxiv.org/pdf/2410.21524v2) and [Bhatt–Scholze](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf). The packet records every URL, version, hash and node locator. All 13 downloaded PDF hashes match its source pins. Statements and proof sketches were checked at the cited locations; no source passage was inserted into the repository.

## Baseline and ownership

All **19 original baseline declarations** were opened at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` as applicable. None was removed. The `CategoryTheory.Grothendieck` description was narrowed to the strict functor that its actual signature accepts. Ordinary `Ind`, `Karoubi`, siftedness, `DerivedCategory` and the naive cotangent kernel remain comparison inputs; they are not presented as the missing higher objects.

Three checked Mathlib citations were added:

| Declaration | Pinned module | Use |
|---|---|---|
| `SSet.HomotopyCategory` | `Mathlib/AlgebraicTopology/SimplicialSet/HomotopyCat.lean` | Existing homotopy-category carrier and category instance. |
| `SSet.mapHomotopyCategory` | Same module | Existing induced functor, used directly by `onHCat`. |
| `CategoryTheory.isIsomorphicSetoid` | `Mathlib/CategoryTheory/IsomorphismClasses.lean` | Quotient for the envelope arity test. |

The reviewed AUDIT-22 inventory was checked. Current upstream ownership was also inspected at TauCetiRoadmap `070dc2becd74419e76303ede84b465ed4a69461f` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`: DGAInfinity, StablePeriodicCurved, ProfiniteCohomology, the nine roadmaps newer than the atlas snapshot, and relevant library source. E5 does not rebuild the concrete DG/A∞ or ordinary triangulated quotients of the first two roadmaps. ProfiniteCohomology Layers 0 and 10 supply the coefficient dictionary and the all-degree system with M^U and inflation-and-inclusion transitions; E5 imports those instead of planning another cochain theory.

The exact E0, E1, E3, DD.0 and H.5 supplier statements were read. DD.0 owns the cotangent complex and derived exterior powers. H.5 owns the concrete spectra and module-spectrum models. Elementary stability and the cochain sign comparison remain in E0. Every stage target is realized by the packet's nodes, existing supplier interfaces, precise requests or recorded gaps. The packet's own graph is acyclic.

## Remaining inputs and source issue

The following do not prevent acceptance under the planning-pass standard, but must be resolved before claiming closure:

1. Refine E3's abstract Kan-extension and adjoint interfaces. Its current dependencies on whole E1/E2 stages and E5 presentability introduce cross-part cycles. E0 must expose the operadic base shapes and coherent mapping/transformation interfaces named in its request.
2. Supply E2's bar/partial-totalization pro-comparison and multiplicative finite-cohomological-dimension filtration. BS17 Lemma 11.22 gives the sequential argument; the general proof remains an explicitly identified input.
3. Construct the coherent p-nullhomotopy on the derived Witt fibre. Positive-homotopy p-torsion alone does not establish this map-level assertion.
4. Specify a continuity model for any profinite categorical action beyond a coherent finite-quotient factorization. The continuous coefficient adapter has a separate precise upstream cohomology contract.

The packet's one `sourceIssues` entry is **confirmed**, with reviewer attribution. BS17 Remark 11.24, p. 45, cites Mathew for an algebra-generator bound; Mathew Corollary 3.33, p. 24, also bounds relations. This is a gap in the cited hypothesis justification. It neither establishes falsity of the countable-generation statement nor supplies a counterexample. The packet uses the verified countable-presentation range and preserves its existing paper-extraction attribution.

The recorded Lean omissions remain material: homotopy-category equivalences are weaker than infinity-equivalences; the data carriers omit unavailable cocartesian, coherence, preservation, accessibility and internal-linearity conditions. Compact-map prototypes use ordinary filtered shapes and homotopy-category fillers. Compilation validates these suggested signatures, not the full mathematical statements or proofs.

## Validation and assembly handoff

`python3 scripts/check_blueprint.py research/blueprint/packets/EnhancedDerivedSheaves--E5.json` reports **0 errors and 0 warnings**. `lean-check research/blueprint/suggested/EnhancedDerivedSheaves--E5.lean` exits **0** at the pinned Mathlib commit: **347 warnings, all declaration uses `sorry`**. Every packet API/test name occurs in the prototype; each node keeps `implementationStatus: unchecked`. Submission path validation and whitespace checks pass.

The reader document is not an editable deliverable of issue #397. Assembly must apply this correction table to its parallel statements, API and tests, using the reviewed packet as authority. In particular, its generic Segal claim, Ind colimit range, Witt coordinate wording and rigid-map hypotheses must be synchronized. The report and [handoff](../handoff/REV-EnhancedDerivedSheaves--E5.md) carry everything needed after scratch deletion.

There is no verdict-blocking question. The orchestrator must select the accepted bundle/tier order for packaging and assign the recorded E0/E2/E3 refinements before treating the combined roadmap as closed. No new source, errata or second worker job is claimed by this review.
