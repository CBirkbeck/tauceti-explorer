# BP-AlgebraicModuliForArithmeticGeometry--R09.7a

Job #673 completed by **Codex — codex-dtTm52**, 2026-10-11. This is a complete target-level planning pass for R09.7a–d, submitted for independent review. It is not a checkpoint or a formalization claim. All four stages are **planned**, none closed; all proposed implementations remain unchecked.

The deliverables are the [packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7a.json), [reader](../readmes/AlgebraicModuliForArithmeticGeometry--R09.7a.md) and [suggested Lean file](../suggested/AlgebraicModuliForArithmeticGeometry--R09.7a.lean).

## Ownership and completed scope

The accepted [aggregate R09.7 packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7.json) already owns the forty core targets, including arbitrary-scheme Cartier separation. The new packet's `importedTargets` maps each of those owners to R09.7a–d. It does not reproduce their nodes. The aggregate's accepted review corrections constrain the new signatures and are explained in the reader: certificate/actual-diagram distinction, strict Samuel derivative bound, centre containment, distinguished exceptional-test point, closed-point/Jacobson passage and incomparable maximal Hilbert–Samuel strata.

The unmerged earlier attempt in PR #8005 was inspected and its valid mathematics retained through those accepted owners. Its duplicate forty-node decomposition is not submitted again. This run did not alter or close that pull request. The aggregate reader predates its accepted review: assembly must synchronize it from the accepted packet and review report rather than treat its older wording as authoritative. Those files are outside this job's editable paths.

| Stage | Supplemental targets | Status |
|---|---|---|
| R09.7a | Finite native blowup towers and marked-transform towers | planned |
| R09.7b | Regular-to-completed coefficient comparison with actual derivative/restriction maps | planned |
| R09.7c | Native principalization and reduced embedded-resolution output certificates | planned |
| R09.7d | Branch-stratum refinement, finite-cover compactification, full monomial boundary charts, meridian lattice map, geometric meridian comparison and conditional stable-curve application | planned |

There are **11 new nodes**: 3 definitions, 5 constructions, 2 theorems and 1 application; **32 API items**, **24 definition/construction test groups**, **9 planets**, **10 pinned declaration references**, **8 supplier requests** and **0 mathematical gaps**. The 9 new planets are distributed 2/1/2/4 across a/b/c/d. Together with the imported core planets assigned through the ownership map, the combined counts are 4/3/3/5, within six per layer.

Ordinary blowups remain StableReduction Layer 4 under accepted RS-27. Stable pointed moduli remain StableReductionPartII MC.2, exposed by R09.4. General stacks and descent remain SchemeAndStackFoundations. Current upstream StableReduction and AlgebraicVectorBundles were read. Current Tau Ceti's arbitrary-scheme effective-Cartier ideal, affine blowup API and regular-fan analytic boundary normal form are reuse inputs beyond the pin; their locations and declarations are in `upstreamNotes`. No upstream checkout was edited or built. No mathematics moved upward or was duplicated from the nine newer roadmaps.

## Supplier and prototype boundaries

The eight explicit requests are to StableReduction Layer 4, SF.0, SF.3, R09.3, A0-extension, R09.4, R09.5 and SF.1. They specify ordinary blowup comparisons; actual completion maps and faithful-flat reflection; Cartier/monomial factorization; branch-centre descent; finite normalization and analytification; stable node-smoothing charts; finite étale scheme covers and coarse-model comparison; and stack descent/effective realization. The aggregate's own requests remain in force. Assembly should reconcile compatible requests, preserving each comparison map and hypothesis. No upper-tier GAGA or mapping-class-group dependency is introduced.

The suggested file uses actual Mathlib schemes, ideal sheaves, ideal pullbacks, kernel ideals, Proj, power series, paths and fundamental groups. `Imported` provides explicit signature adapters for existing owners whose packaged declarations are absent at the pin. Packaging must replace those adapters with supplier imports, particularly the current effective-Cartier definition; it must not create a second ordinary blowup or SNC definition.

The reader and `prototypeOmissions` state the exact remaining refinements:

- MarkedTower specializes the full marked-presentation carrier to a smooth ambient scheme. Full test-equivalence, history and maximal-contact policies remain aggregate imports.
- The completion theorem states the algebra calculation under compatible maps over the base field, allowing a larger residue coefficient field. Actual completion existence, coordinate/derivation compatibility and faithfully flat reflection come from SF.0.
- PrincipalizationTower's global exponent per birth label uses the refinement of a smooth centre into its finitely many disjoint connected components. The aggregate retains canonical grouped years and supplies their comparison.
- EmbeddedTower states the reduced, empty-initial-boundary specialization with native strict closure and the smooth preserved open. The full resolved-pair and canonical whole-tower comparisons are imported.
- BoundaryRefinement gives a native output tower and an actual étale endpoint pullback. The normalization-based global original-stratum algorithm predicate and full year/label descent comparison are specified in the reader, but omitted from the prototype until their carriers exist. The finite algorithm descends by original branch ranks and never restarts on newly created strata.
- Finite-cover tests use native projective-line ideal pullbacks and the actual singular quadratic-cone spectrum. The cone's identification with finite normalization is an A0 supplier obligation. Resolving the normalization produces a proper dominant extension, with no assertion that it remains finite or flat.
- The stable-stack construction signature is omitted until the suppliers provide its actual carrier and maps. Its precise conditional consequence is stated on native fundamental groups and an arbitrary group representation. The topological consumer supplies the node-meridian/Dehn-twist identifications. No unspecified proposition field substitutes for a stack or a missing comparison.

These are specified implementation and supplier obligations, not unexamined source arguments or mathematical gaps. The independent reviewer should particularly check the branch-stratum descent proof, component-refined principalization witness, nonflat Cartier factorization, normalization/scheme-cover hypotheses and positive meridian orientation/composition.

## Source finding and editions

One new source finding, **AlgebraicModuliForArithmeticGeometry/E1903**, records a proof gap in the accessed **LL24 arXiv v4**, proof of Lemma 8.3.3, pp. 40–41. Finite normalization of a strict-SNC compactification can be singular: the cover z²=xy of the two-dimensional torus normalizes the affine plane in the singular normal quadratic cone. Resolution and boundary principalization preserving the cover fill the missing compactification step. Full-chart units then justify the added boundary meridian formula. The finding concerns that proof step, not a counterexample to the integrality result. The journal full text was not inspected; the finding is explicitly scoped to the accessed preprint. Version history, publisher article page and correction/title searches found no existing correction. Independent review must confirm or reject it. The aggregate's two confirmed BM97 source findings remain imports.

Public source URLs, accessed versions, dates and PDF SHA-256 hashes are recorded in the packet. BM97 uses the full published pagination; LL24 uses v4 author pagination; LLSS23 is Li–Litt–Salter–Srinivasan, Mathematische Annalen 386 (2023), author pagination; BP26 and BKT20 use the identified author copies. Stacks locators use stable tags, including 0CBR and 0AVK. All descriptions are authored statements, with theorem/section/page locators. No source files or passages are part of the submission. Sources routed to R09.4–R09.6 or A0 remain with their owners.

## Validation and next action

- `python3 scripts/check_blueprint.py research/blueprint/packets/AlgebraicModuliForArithmeticGeometry--R09.7a.json`: **0 errors, 0 warnings**, including source-finding validation and pinned declaration-index checks.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: **0 problems**.
- `git diff --cached --check`: passed.
- `lean-check research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--R09.7a.lean`: **exit 0**, at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; only 120 `declaration uses sorry` warnings, no errors or other warnings. Memory was checked before compiling; one compile ran at a time and none remains running. This checks signatures and example statements only.

The next action is independent review of this supplemental packet, reader, suggested file and E1903. After acceptance, assembly combines its eleven targets with the forty core owners and reconciles supplier contracts without changing ownership. No further job was claimed by this worker.
