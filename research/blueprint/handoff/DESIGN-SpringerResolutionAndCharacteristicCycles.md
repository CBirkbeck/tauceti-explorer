# DESIGN-SpringerResolutionAndCharacteristicCycles

Complete target-level planning pass for issue #3471 by Codex (GPT-6), session codex-cd8S6C. This is a complete design submission for independent review, with explicit input gaps; it is not a closure claim or an implementation. The claim bot confirmed comment 6256164696 in comment 6256166171. Only the five authorised deliverables are changed.

The packet contains 69 nodes: 23 constructions, 5 definitions, 40 theorems and 1 comparison; 113 API items; 84 discriminating definition/construction tests; 60 planets; and 14 baseline declarations. All 28 definitions/constructions have uses, at least three API items and at least three tests. Every other node has a target-specific acceptance check. All 31 routed BHS items are accounted for: 28 as targets or imported criteria and 3 as landscape. The internal prerequisite graph is acyclic. No definition or result is claimed formalised; every implementation status remains unchecked.

| Layer | Nodes | Coverage | Direct input gaps |
| --- | ---: | --- | --- |
| F — Flag schemes and relative position | 5 | planned | AG-geometry, VB-upstream |
| G — Grothendieck resolution | 3 | planned | AG-geometry, Lie-invariants, VB-upstream |
| I — Incidence components | 9 | planned | AG-geometry |
| C — CM and Cartan flatness | 4 | planned | AG-geometry, BR-input, CM-spreading |
| N — Normality | 4 | planned | Lie-invariants |
| S — Springer and Steinberg geometry | 6 | planned | AG-geometry, Lie-invariants, Steinberg-reduced, VB-upstream |
| Y — Top cycles and zero fibres | 4 | planned | Inherited inputs only |
| D — Differential operators and cycles | 6 | planned | AG-geometry, VB-upstream |
| H — Holonomicity and equivariance | 9 | planned | D-homological, D-regular, VB-upstream |
| L — Localisation and induction | 4 | planned | AG-geometry, BB-sections, CategoryO-elementary, D-regular |
| K — Three characteristic-cycle bases | 4 | planned | BR-input, CategoryO-KL |
| P — Parabolic invariance | 2 | planned | CategoryO-elementary |
| T — Cartan graphs and tangents | 5 | planned | AG-geometry |
| E — Completed cycles | 4 | planned | AG-geometry |

No layer is closed. Each coverage record also enumerates its transitive gap ids and supplier stages. The reader is definitive and contains every target, hypothesis, proof sketch, API item, worked test and source locator. The roadmap JSON carries the same targets and stage dependencies.

## Boundaries checked

Read current upstream ReductiveGroups and RepresentationTheory/LieHighestWeight documents in full, and AlgebraicVectorBundles in full with its relevant L0–L2 suggested declarations. Current upstream roadmap commit: 0d144d044dacebca17b654695b6f1ad58f159b27. Current Tau Ceti library commit: a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Those checkouts were consulted read-only; no build ran there. The current finite locally free, dual/rank/pullback and relative-differential sources were read. AlgebraicVectorBundles already owns sheaf symmetric algebras, relative Spec and total spaces; its absent atlas registration is a gap, not permission to replan it.

The reviewed library audit has no entry for this new roadmap. The actual sources and hypotheses of all 14 cited baseline declarations were checked at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Existing scheme, pullback, sheaf-module, derived-category, algebraic-cycle, module-length, adic-completion and linear-algebra carriers are reused. Their existence is not treated as availability of the missing geometric or D-module theorems.

There are nine precise supplier requests in the packet: ReductiveGroups Layers 2, 3, 7, 8 and 9; LieHighestWeight Layers 3, 4 and 7; and SchemeAndStackFoundations SF.0. Exact existing local-algebra and completion nodes from DeformationAndDerivedPatchingAlgebra R03.1/R03.3 are imported directly. The requests are records for coordination; no new supplier issue or message was sent.

Two rescoping proposals are recorded. LieHighestWeightPartIICompletedCategoryO must put elementary strict principal category O before this roadmap's L layer, and its KL theorem after D/H/L but before K/E. The supplier is routed but not registered, so its two exact missing boundaries are gaps rather than invented stage ids. The remaining reductive Lie invariant/Jordan/centralizer inputs belong to an extension in the ReductiveGroups Part II direction. No upstream file is edited. No dependency on a higher-tier local-model roadmap is introduced.

## Sources and corrections

The packet records exact editions, public URLs, download hashes, reading ranges and per-node theorem/section/page locators. All mathematical statements are in our own words, with no source excerpts or source-section summaries.

Read the published Breuil–Hellmann–Schraen article, PMIHÉS 130 (2019), §2.1–2.5, pp. 309–328, including proofs. Read Bezrukavnikov–Riche, ASENS 45 (2012), the coadjoint conventions in §1.1, Theorem 2.2.1 and its remarks, the §2.10–2.11 proof structure/base-change remark and Proposition 2.14.2 with its proof, pp. 538–539, 557–558, 570–572 and 574–575. Read the relevant free Mustață Winter 2023 notes on operators, filtrations, transfer, Kashiwara, Bernstein, finite length, cycles, intermediate extension and regularity; the exact ranges are in the bibliography. Read all three available pages, 15–17, of the author-hosted Beilinson–Bernstein scan, including its proof and algebraic subgroup compatibility. Read the indicated Ginzburg author-note passages, pp. 4–6, 23–24 and 60–61.

Missing source/proof boundaries are explicit: the BB scan lacks p. 18; Mustață's regularity-stability theorem points to HTT for its proof; BR's deep positive-characteristic localisation/convolution package and the remaining filtered homological/functor-stability machinery have not been fully back-chained. HTT, Chriss–Ginzburg and Humphreys's category O book are not cleared in the library index, and no other copy of them was read. Freely accessible author papers and notes were used instead. No restricted library file or passage is copied.

Twelve source issues are recorded, with locators, corrections, reasons and correction-search provenance. E1–E4 and E6 concern the BHS local flatness hypothesis and four index/ambient-space/citation misprints; E5 corrects the reduced-rank multiplicity wording of the Ginzburg notes; E7–E11 record small Mustață proof misprints; E12 identifies the missing special-to-generic CM argument. Known extraction findings are distinguished from newly observed, unreviewed findings. Targeted publication/version/author-page searches found no linked correction addressing these items; this is not a universal claim about errata. Rendered pages were inspected where glyphs or omitted hypotheses mattered. The main targets use the corrected forms.

## What the review and follow-up must resolve

All 11 gaps have exact statements and direct consumers in the packet. In dependency order:

1. Register/import current AlgebraicVectorBundles, and check its associated-bundle descent theorem. Supply the named native scheme/dimension/CM/excellence/Serre-vanishing inputs through SF.0. None is replaced by a synthetic carrier.
2. Supply the stated reductive Lie inputs through the proposed Part II extension. Translate BR's coadjoint and inverse-label conventions, establish its published CM/base-change boundary and verify the scaling/DVR proof of characteristic-zero CM. Flatness uses the local dimension equality, avoiding the false unrestricted global-dimension criterion.
3. Prove radicality of the raw Springer fibre-product incidence ideal or resolve its source's variety convention. This is isolated in S/raw-fibre-product-comparison; the cycle route uses the reduced Steinberg variety and does not depend on this comparison.
4. Supply the bounded derived sheaf/filtered homological package, regularity stability and field comparison, and the filtered global-section proof of BB. The closed-immersion inverse is Li* shifted by minus codimension; abelian smooth pullback and noncharacteristic fibre restriction have their shifts fixed explicitly.
5. Register the elementary category O supplier and its separate post-localisation KL theorem. Finish the BR Verma-cycle/top-homology and arbitrary-characteristic-zero comparison. Then discharge the remaining geometric completion comparisons to close the cycle identities.

Pay particular attention to the inverse Weyl coordinate; the non-birational full Grothendieck map versus birational component projections; generic length rather than reduced rank; strict rather than generalized central reduction; both longest-element prefixes in the KL coefficients; the signed cotangent embedding; first-flag parabolic invariance in the ambient incidence space; and all branches of a completed component. Torus, SL₂, a non-involutive GL₃ Weyl element, the double delta module and an irreducible nodal curve distinguish these choices.

## Suggested Lean and validation

The 141-line suggested file follows the current WORKERS.md shape, which supersedes the older exhaustive-prototype wording of the issue. It has two light real-bodied definitions on native finitely supported integer cycles, seven named theorem signatures and seven examples. Missing geometric and D-module carriers remain reader targets. Its two definitions are the algebraic specialisations of E/completion-cycle-map and E/completed-simple-cycles after their component images are supplied. The other signatures state the inverse Cartan convention, toral tangent constraint, integral unitriangular basis consequence and completed-cycle transport identity.

The suggested file compiled successfully with lean-check at the pinned shared build: exit status 0, no errors, and exactly 14 expected proof-placeholder warnings. Neither data definition has a placeholder body. Memory was checked before the single compile, with 78 GB available. No Lean language server or library build/update/cache command was used, and no compile remains running.

Validation: the blueprint checker with the pinned declaration index reports 0 errors and 0 warnings. The packet/reader/roadmap agreement, all routed items, target-specific checks, stage and node acyclicity, planet counts/lengths, definition API/test counts, baseline links, private-path exclusions and authorised path set were checked. The submission file checker and whitespace check are run on the final five deliverables before push. The PR must reference #3471 without closing it; independent review, supplier registration and closure work remain after this complete planning pass.
