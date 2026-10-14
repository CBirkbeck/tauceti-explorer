# BP-K2SymbolsBrauer--T.1-2

Prepared by Codex (GPT-6), session `codex-N3kPM4`, for issue #9305, on 14 October 2026. The bot confirmed this session's claim. This is the completed target-level planning pass, ready for independent review; it is not a checkpoint or an implementation.

## Delivered and retained

The packet has `part: T.1-2`, scope exactly `K2SymbolsBrauer:T.1`, status `complete`, and one coverage record, with T.1 `planned`. Its eight new nodes comprise four constructions and four theorems, with 26 API items, 19 discriminating unit tests, three planets and 25 pinned baseline declarations. There are zero recorded gaps in these refinements and two open supplier requests. The reader gives the retained definitions, conventions, complete new APIs, worked checks and proof arguments.

The accepted [T.1 predecessor](../packets/K2SymbolsBrauer--T.1.json) is imported unchanged. Its accepted review is `independent-review-REV-FIX-RT-AREA-ktheory-1~2`, dated 10 October 2026; its older coverage wording about awaiting review is superseded by that verdict. The packet's target inventory accounts for all eight audited T.1 targets. No T.2 symbol or Milnor computation is replanned.

The fresh column and row subgroup maps have parameter recovery and sided conjugation formulas. These prove stable kernel centrality without assuming injectivity of Steinberg transitions. The central-extension argument spells out exact commuting lifts, the four-root triple identity, independence of the intermediate index, arbitrary products and additivity. Perfect-source rigidity then makes finite sections compatible on the cofinal rank tail and gives the stable universal extension. The comparisons specify the Hopf kernel map and the based cover/Hurewicz composite, with their ring-map naturality.

The associative matrix calculus and stable elementary-group centre are owned by the accepted `KTheoryLowDegrees--U.1` packet. The pinned directed colimit already has its group structure and representative API. The fixed trivial-action classification bridge is already supplied by Tau Ceti's `inducesAction_iff_smul_eq_self`, normalized-section and factor-set/cohomology APIs; the packet records their consumption rather than adding classification nodes.

## Exact remaining contracts

1. `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`: consume the existing absolute degree-two Hurewicz equivalence on the simply connected CW-type BE⁺ and its naturality in the implemented integral-homology carriers. This roadmap already owns Hurewicz, so there is no development request here.
2. `GeneralAlgebraicKTheory:K.2:plus`: supply the early ring K-space, a based equivalence of its zero component with BGL(R)⁺, ring-map compatibility and based comparison homotopies. Free-homotopy comparisons require its H-space/trivial π₁-action interface. The later low-degree-comparisons stage is a consumer, not a prerequisite.

The accepted H.3 cover, homology and naturality interfaces are imported. Only the H=P=E case of its universal-cover comparison is used; the general H/P nonabelian-target boundary is not needed. H.1 supplies the constant integral group/classifying-space homology comparison. These imports are supplier contracts, not a new verification of every supplier proof. Packaging must use their actual carriers and discharge the two requests before declaring T.1 closed. No ownership move or restructuring is proposed.

Independent review should check the coordinate recovery over an arbitrary associative ring, the four-root word-reordering calculation, all lifted presentation relations, finite-section compatibility and both comparison squares with their basepoints. Retain the predecessor's source finding E2: finite splitting does not establish centrality of Stₙ→Eₙ. Finite universality still needs that separate hypothesis.

## Sources and version boundaries

The public mathematical source read was Weibel's [author-hosted combined K-book draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), dated 29 August 2013, SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`. Locators use printed draft pages; PDF pages are eight higher. Read III.1.2, printed p. 180/PDF p. 188; III.5.1–5.5.1, printed pp. 217–221/PDF pp. 225–229; Exercises III.5.2–5.3, printed p. 228/PDF p. 236; IV.1.5–1.8.1, printed pp. 263–266/PDF pp. 271–274; and Exercises IV.1.8 and IV.1.11, printed p. 274/PDF p. 282. Every repository account is in the worker's own words.

Two misprints in Exercise III.5.2 are recorded without review verdicts: `K2SymbolsBrauer/E-column-domain` corrects the parameter space of the image subgroup to R^(n−1); `K2SymbolsBrauer/E-triangular-orientation` corrects the final matrix assertion to upper unitriangular. The rendered combined-draft page was inspected. Both slips also occur in the [separate author-hosted chapter III](https://www.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), Exercise III.5.2 at PDF p. 45, SHA-256 `ba1bc2d25680ab25c4baadc5ab28e39d1077dc66bb12ca4e2174b6cb55f81307`, whose PDF metadata is dated 10 October 2012. That copy was checked only for these corrections.

The author's official errata link returned HTTP 404 on both Rutgers hosts on 14 October 2026. A search-engine entry exists, but no correction for these slips was readable; whether the errata corrects them remains unresolved. The findings are scoped to the checked author draft, not the published edition, which was not consulted. No restricted reference was read, copied or newly certified. The predecessor's uncleared homological-algebra source remains an inherited citation, not a source verified by this pass.

## Library audit and checks

The recorded baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Actual cited declarations and their enclosing hypotheses were read; all 25 names were checked against the pinned declaration index. The reviewed `data/library-coverage.json` T.1 entry was read before planning. SemisimpleAlgebras and QuiverRepresentations were read for upstream form and density.

Current upstream roadmaps were screened read-only at commit `0d144d044dacebca17b654695b6f1ad58f159b27`, including the nine additions and four Completed roadmaps absent from the atlas snapshot. The relevant AlgebraicTopology stage 8 was read. Current Tau Ceti was screened at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; the Steinberg representations/Lie maps and LocalGaloisGroups profinite extensions are different objects. No upstream build was run.

The packet checker with the pinned declaration index reports zero errors and zero warnings. The source-issue schema and source-version checks pass. The deliverable-path/private-path check, compact-file data check and whitespace check pass.

The 109-line [suggested file](../suggested/K2SymbolsBrauer--T.1-2.lean) compiled using `lean-check` at the shared pinned build, exit status zero, with exactly seven warnings, all for proposed proofs/examples using `sorry`. Its three lifted-relation milestones use existing group carriers. Its examples check central twists, zero lifts, the existing colimit group instance, the fixed-action/normalization interfaces and the two different matrix-unit product orders. Following the newer WORKERS.md shape rule, there are no substitute Steinberg/topological carriers, heavy constructions or data definitions with missing bodies. The full carrier-dependent API and tests are reader targets. Compilation validates these signatures, not their proofs.
