# DESIGN-VectorBundlesAndIsocrystalsPartII — handoff

Issue: #3446. Worker: Codex, GPT-6; session `codex-cjQ18M`. Date: 2026-10-19.

This is a complete target-level design pass, ready for independent review, rather than a proof-closed roadmap. The packet has `status: complete`, `part: null`, and covers all seven layers. Every implementation status remains `unchecked`. No mathematical implementation is claimed.

## Deliverables and counts

The roadmap definition, packet, reader and compact suggested file share the stem `VectorBundlesAndIsocrystalsPartII` in their respective blueprint directories. The reader carries the mathematical specifications; no temporary extraction or generator is needed to use or review them.

- 44 nodes: 9 definitions, 22 theorems, 6 constructions, 5 comparisons and 2 lemmas.
- 59 API items, 48 mathematical unit tests, 25 planets and 6 pinned baseline declarations.
- 11 named proof obligations, 10 dependency requests, 5 routing-only supplier refinements and 4 split proposals.
- Every definition and construction has uses, an API and at least three tests.
- All 293 routed extraction items occur exactly once: 22 imports, 10 imports needing refinement, 52 planned items and 209 items assigned to independent continuations.

## Coverage and exact resumption points

| Layer | Status | What proof-level refinement must establish |
| --- | --- | --- |
| AC.0 | planned | G-GENERAL: general-base Sen rigidity, algebraic-closure density and twist-invariant vanishing; verify the coefficient-field refinement with P7. Finite-K Fontaine full faithfulness is already in PHT R06.2 and is imported. |
| AC.1 | planned | G-FUNDAMENTAL: the independent analytic correspondence lemma; G-ANALYTIC: functorial equivariant analytic realization and presentation independence. Check the twisted generalized-invariant complex and framed period extension normalization. |
| TVS.0 | planned | G-TVS: boundedness and exactness on localized left-heart objects; G-TENSOR: completion, C-evaluation and injective base change. Algebraic quotients must retain non-strict injections. |
| TVS.1 | planned | G-DISC: completed Kummer-tower uniformity, the normed cohomological descent/decompletion comparison, and the corrected p=2 tower with its character/norm comparison. The additive-character primitive input was read in Colmez02. |
| TVS.2 | planned | G-TENSOR, G-FRECHET, G-COMPACT and G-SEPARABILITY: prove the precise tensor/limit and compact-type supplier hypotheses and separate the separable proof from the broader printed B_m scope. Pair full faithfulness here concerns Hom, not arbitrary Ext. |
| QBC.0 | planned | Discharge the inherited TVS and reasonable-Pair obligations and the L1 dual-topology contract. Verify intrinsic positive/negative filtration universal properties and morphism preservation. No qBC splitting or general abelianness theorem is asserted. |
| H.0 | planned | G-VS: transport sheaf/condensed Ext and filtered-colimit results into the specified sympathetic VS category; G-HOM: inherited parent bounded-period factorization. Prove the nonzero connecting class before declaring the lattice Ext transition zero. |

No layer is closed. AC.0→AC.1 and TVS.0→TVS.1→TVS.2→QBC.0 are separate chains. H.0 starts independently with the parent BC/period inputs and the derived-limit contract. The correction in the general height formula is essential: for C/Q_p the height is −1, the period Hom rank is zero and the period Ext rank is one.

The packet's gaps name the affected node ids and the exact missing assertions. Its requests are specifications at existing owners; no other worker or maintainer was messaged.

## Supplier contracts

1. **PadicHodgeTheory R06.1:** topological sympathetic period functors, uniform torsion, completed-balanced-tensor behavior, topological basis lifts, cyclotomic torsion correction and arbitrary-base density/invariants.
2. **PadicHodgeTheory P7:** the E-linear algebraic-Sen-weight refinement, with actual coefficient-field hypotheses, and general-base scalar rigidity.
3. **PadicHodgeTheory R06.2:** explicit finite-period presentations of extensions of C by finite-dimensional representations; its almost C category alone does not prove the analytic fundamental lemma.
4. **ArithmeticGaloisDuality R02.2:** topological cyclotomic Hochschild–Serre descent and the two-operator complex comparison.
5. **ArithmeticGaloisDuality R02.1:** the actual topological Mittag–Leffler/Milnor hypotheses for the Fréchet and period towers.
6. **PerfectoidSpaces P6:** the completed disc-specific pro-étale presentation with translations.
7. **PerfectoidSpaces P9:** normed H¹ descent, rationalization/decompletion, O versus completed O and the p=2 correction.
8. **LocallyAnalyticDistributions L0:** the nonspherically-complete C tensor/separation and compact-type extension results, Fréchet passage and finite-dimensional Q_p projectivity in the left heart.
9. **LocallyAnalyticDistributions L1:** the LA→C dual exact sequence and the precise topology on distributions modulo measures.
10. **Parent VB3:general-BC:** the inherited bounded-Hom and geometric-heart obligations, with the required VS/sheaf Ext transport.

Routing-only records RR1–RR5 request general filtered-semistable period BC realization, the BC subobject lattice-rank bound, syntomic BC realization, Weinstein/Drinfeld quotient fundamental groups, and the arbitrary-classical-point negative-twist cohomology formula. They are outside the seven-layer dependency graph. In particular the higher VStackSheavesAndLisseCategories roadmap is a destination, not an input to this continuation.

## Independent directions and nonduplication

The issue explicitly permits planning the first coherent direction and giving precise restructuring briefs for the others. Each split lists every assigned extraction id, stage boundaries, imported carriers and acceptance examples. These are design briefs, not purported complete proof plans for 209 additional items.

- `ClassicalBanachColmezCorrespondences`, CCB.0–CCB.2: constructive analytic correspondences, the Colmez skew field and the spectral-model comparison. Its independent analytic fundamental lemma is an explicit open input to AC.1; it must not be deduced circularly from AC.1.
- `AlgebraicVectorBundlesPartII`, HN.0–HN.1: generic degree–rank exact-category HN theory with boundedness/attainment and its instances. Reuse the parent geometric FF HN instances and current upstream finite locally free sheaves; do not create another sheaf or geometric bundle category.
- `VectorBundlesAndIsocrystalsPartIII`, SFB.0–SFB.3: complete schematic curves, generalized Riemann spheres and coefficient towers, the extra schematic/geometric interfaces and perfect-F Galois descent.
- `VectorBundlesAndIsocrystalsPartIV`, PPF.0–PPF.2: positive-period Frobenius modules and reduction/classification, curve/origin-adjoined/Fréchet/Robba comparisons and radius/crystalline variants.

The current upstream AlgebraicVectorBundles README and Suggested file, AlgebraicCurves Layer 12, AdicSpaces, LocalGaloisGroups and relevant OperatorTheory boundaries were checked. Current upstream roadmaps are imported as plans, including those at newer pins; they are not called existing pinned declarations. The complete FF curve need not be finite type over E, so the finite-type function-field/curve dictionary is insufficient for SFB.0. Parent geometric classification, coefficient-field covers, standard BC invariants and the punctured finite-projective Robba equivalence remain imports.

The current Tau Ceti library and the pinned f790474 source were searched for the dedicated period/BC/isocrystal carriers. No such implementation was found. The six baseline declarations are actual pinned functor, topological-module, Banach open-mapping/preimage-bound, linear-map and scalar-torsion declarations, with their limits recorded. No library or upstream files were changed.

## Sources and version limits

The packet and reader give public URLs, SHA-256 hashes, read date, theorem/section/page locators and read scopes for all eight sources:

- Colmez–Nizioł, CN5 author preprint dated 24 November 2024: §§2–4, Corollary 3.18 and Appendix A.
- Fargues–Fontaine, author copy dated 16 April 2017: preface §§2.2–2.4; §5.5.1 for the generic HN boundary. The remaining inventory is routing, not a claim to have read every split proof.
- Fontaine, Documenta Mathematica 2003: introduction, generalized-invariant comparison, full-faithfulness and almost C Ext proof routes.
- Colmez, author-hosted Espaces de Banach de dimension finie: disc translations and the additive-character primitive/estimate.
- Schneiders, Mémoires SMF 76: the correct injective two-term left-heart localization statement.
- Le Bras 2018, Theorem 4.1: sheaf Hom/Ext table, retaining the missing comparison to VS.
- Anschütz–Le Bras, JEMS 2025, §3.1: derived Hom, pseudocoherence and the curve-perfect-complex realization.
- Colmez–Nizioł, Topological Vector Spaces, author PDF dated 21 November 2025: the enriched condensed category and derived/nuclear comparisons. This is a different presentation and does not automatically close G-TVS or G-VS.

The Duke publication metadata was checked, but the version-of-record PDF was not accessible; the 61-page CN5 author text was not collated against the 99-page published article. The SMF full published volume was not obtained or collated against the 2017 author copy. No uncleared book copy was used. All repository statements are original paraphrases with locators; no source passage or section-by-section digest is deposited.

Seventeen source findings are scoped to the bytes actually read. They include the corrected U_d Ext¹ vanishing, missing Euler signs/wrong cohomological degree range, the analytic cocycle indices and sign, the p=2 exponential issue, and scope gaps for completed models and Fréchet/separability arguments. Each finding records its correction, reason, reach and correction searches. These require independent verification; they are not claims of adjudicated journal errata.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/VectorBundlesAndIsocrystalsPartII.json`: **0 errors, 0 warnings**.
- Intake `check-files` on the five deliverables: valid paths/content and JSON, no local filesystem paths.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/VectorBundlesAndIsocrystalsPartII.lean`: passed; no placeholder data definitions.
- The source-version validator passed; custom consistency checks confirmed an acyclic internal graph, 293 unique routed ids matching the two routed inventories, complete definition/construction APIs and tests, and valid proposed areas.
- `git diff --check`: passed.
- **Lean compiled:** `lean-check research/blueprint/suggested/VectorBundlesAndIsocrystalsPartII.lean` returned exit 0 in the shared pinned Mathlib environment. Available memory was above 20 GB. The only diagnostics were the six intended proof-placeholder warnings.

The 63-line suggested file has one native linear-map signature for the inverse cyclotomic scalar, two special-case examples and three native scalar-torsion compatibility examples. It constructs no missing period, left-heart or qBC carrier. Heavy definitions and their complete mathematical API/tests remain reader targets, as the current roadmap-shape rule requires.

The next programme action is independent review of this completed design. Review should first check the source corrections and the precise VS/TVS/sheaf comparison boundaries, then the normed p=2 disc argument and the four split assignments. Proof-level follow-ups resolve the named obligations at their owners; no second job was claimed in this run.
