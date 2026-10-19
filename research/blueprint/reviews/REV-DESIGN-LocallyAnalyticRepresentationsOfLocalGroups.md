# Independent review: locally analytic representations of local groups

Reviewer: Codex, session `codex-KEodk8`. Date: 2026-10-19. Job: [#3565](https://github.com/CBirkbeck/tauceti-explorer/issues/3565). The input was the design by Claude, session `claude-TZhCcp`, for #3411; this session did not contribute to that design.

**Verdict: accepted as partial.** Every original node has been verified or corrected, and the one added target has a source-based proof plan. All nine baseline declarations are confirmed. The corrected statements have no unresolved internal contradiction. Acceptance covers the specification and its explicitly conditional contracts; it does not assert proof closure across the ten recorded gaps. The review itself is finished.

The deliverables are the corrected [packet](../packets/LocallyAnalyticRepresentationsOfLocalGroups.json), [roadmap definition](../roadmaps/LocallyAnalyticRepresentationsOfLocalGroups.json), [reader](../readmes/LocallyAnalyticRepresentationsOfLocalGroups.md) and [suggested Lean file](../suggested/LocallyAnalyticRepresentationsOfLocalGroups.lean). The packet's `review.checked` is the exhaustive per-node ledger.

## Counts and coverage

| Item | Result |
| --- | ---: |
| Nodes before / after | 82 / 83 |
| Theorems / definitions / constructions | 42 / 16 / 25 |
| Verified / corrected / added / unverifiable | 23 / 59 / 1 / 0 |
| API items / discriminating unit tests | 255 / 176 |
| Named planets / baseline declarations | 40 / 9 |
| Gaps / supplier requests | 10 / 16 |
| Reviewed source findings | 14: 13 confirmed, 1 rejected |

LR.0, LR.2, LR.3, LR.4, LR.5, LR.6 and LR.7 are partial. LR.1, LR.8 and LR.9 are planned relative to their explicit prerequisite contracts; their `remaining` entries name inherited supplier obligations. No stage is closed and the packet is partial. The local graph is acyclic, with no prerequisite in a later local stage.

I read all 82 original nodes, including every API item and test, checked all 40 planet selections, and checked scope, ownership, requests and coverage against the current suppliers. Forty-one definition/construction nodes each retain at least three tests. Tests now include failures of plausible alternative definitions, rather than only dimension arithmetic: central-character inversion, noninvolutory permutation labels, averaged Hecke action, scalar extension, tensor equivariance and the first tensor-filtration kernel.

## Sources and baseline

The locators of every node were checked in the public texts listed in `sources` and `sourceVersions`. The 22 public source downloads match the recorded SHA-256 values; the final Ding arXiv v2 was checked separately against the published text at the affected locators. Version records identify the actual texts read. The maintainer-cleared Schneider book was read in place; no file or passage was copied. Bibliographic titles and mathematical notation aside, statements, source matches and findings are paraphrases. No source excerpt field is retained.

Important locator corrections are Schneider, *p-Adic Lie Groups*, Corollary 4.5 p. 24, Proposition 6.4 pp. 42–43, Corollary 13.3 p. 90, §14 Exercise ii p. 101 and Corollaries 18.18–18.19 p. 153; Dospinescu–Le Bras, Lemme 5.10 p. 29; Ding (2019), Lemma 2.26 p. 29; and Schraen, Théorème 4.10 pp. 82–83. The analytic inverse theorem, rather than just a topological implicit-function statement, supplies the rational-point charts. The detailed matches distinguish a source's statement from a proof obligation it leaves open.

All baseline entries were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti's baseline remains `f790474821cf4256814db967cb154e7af3d0c369`. **No baseline citation was removed or replaced.** Their scope was checked as follows:

| Declaration | Pinned file | Scope checked |
| --- | --- | --- |
| `CategoryTheory.Abelian.Ext` | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean` | Requires `HasExt`; supplies abstract Ext, not admissible extension closure. |
| `DualNumber` | `Mathlib/Algebra/DualNumber.lean` | Dual-number coefficient algebra. |
| `GroupLieAlgebra` | `Mathlib/Geometry/Manifold/GroupLieAlgebra.lean` | Manifold/differentiability assumptions, including `minSmoothness 𝕜 3`. |
| `LieGroup` | `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean` | Analytic group operations on a supplied manifold. |
| `ModuleCat` | `Mathlib/Algebra/Category/ModuleCat/Basic.lean` | Abstract modules; no topological extension theorem. |
| `TopModuleCat` | `Mathlib/Algebra/Category/ModuleCat/Topology/Basic.lean` | Topological module carrier. |
| `UniversalEnvelopingAlgebra` | `Mathlib/Algebra/Lie/UniversalEnveloping.lean` | Enveloping algebra with its Lie-algebra hypotheses. |
| `UniversalEnvelopingAlgebra.lift` | `Mathlib/Algebra/Lie/UniversalEnveloping.lean` | Extends a Lie action once the differentiated action is established. |
| `continuousCohomology` | `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean` | Continuous `TopRep` cochains; no locally analytic acyclicity assertion. |

The reviewed audit was checked before revising the plan. The current duplication screen used TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the nine roadmaps newer than the atlas snapshot. I read the nearby LieHighestWeight and ReductiveGroups roadmaps and the relevant SmoothRepresentationsOfLocalGroups targets, and screened the newer roadmaps and current library. No existing locally analytic representation, Orlik–Strauch or Emerton-Jacquet target was duplicated. LieHighestWeight's algebraically closed-field/semisimple hypotheses and the smooth roadmap's complex coefficients do not directly give the finite-E contracts needed here; those are now explicit requests.

## Mathematical corrections

The corrections fall into the following connected groups. The per-node inventory below records the individual edits.

- Analytic foundations now use charts compatible with the algebraic group. Topology and group law alone do not determine an L-analytic structure. Orbit derivatives are constructed before distribution integration, eliminating a circular proof. Integration uses BH subspaces; matrix-coefficient continuity is checked on compact cosets. The global tensor and reflexivity shortcuts were removed.
- Compact-type tensor products use analytic-vector tensor compatibility and strict exactness, rather than density. The added `LR.1/admissible-external-tensor` proves admissibility for the product group using compatible distribution-algebra Banach steps, finite presentations, flat transitions and nuclear inverse limits. It is marked `addedBy: REV-DESIGN-LocallyAnalyticRepresentationsOfLocalGroups`. It makes no assertion about diagonal restriction and removes the earlier forward use of admissibility in LR.0.
- Coadmissible nuclearity is justified specifically for distribution algebras. Finite-generation/presentation closure is over compact-open D(H,E). Ext uses the inverse central character on contragredient duals. Breuil's Banach-step/inverse-limit proof replaces an unsupported extension-closure shortcut, and tautological pushouts retain their actual classifying map when it has a kernel.
- Analytic vectors have the correct compact-open base-change algebra, radius/basis conventions and compact-group cohomology scope. The solid constructions retain p-adic coefficients, extend functions from ℚ_p to E before tensoring, use the residual right action once, and start integrability with a completed enveloping-algebra module on a group germ. Stage-level solid foundations and the classical/solid derived comparison remain conditional.
- Induction has its completed dual and the equivariant tensor identity. Unipotent homology uses the topological complex with Hausdorff hypotheses. Kostant homology is dualised from cohomology with the chosen radical; the GL₂ weights and smooth-vanishing examples were corrected. Schraen's spectral sequence is restricted to its locally algebraic input and FIN/Tor argument. Orlik–Strauch dual completion, separate exactness proofs, residue-characteristic bounds and the L-analytic/trivial-input scope of full faithfulness are preserved.
- Emerton's Hecke action includes the inverse index. For GL₂, the trivial representation distinguishes the average 1 from the unaveraged sum p. The finite-slope universal property has its stable BH condition; canonical lifts have M₀N₀-equivariance; the closed-induction Jacquet equality is restricted to the quasi-split Borel case. Breuil's adjunction is converted from the raw Hecke action to the average, with the opposite inducing parabolic and the inverse modulus twist. The proof uses bounded polynomial generation, not an identification of the intermediate representation with its closed induction.
- Ding's subset labels are inverse images, inducing weights are positive while the category-O weights remain negative, and Weyl transition maps have the direction of the source's commutative diagrams. Finite-amalgam quotients use composition multiplicity one. Singleton Levi characters follow the filtration order independently of positional weights. The tensor-extension kernel has one B-factor and all other A-factors, and its map to the product of B-factors is stated explicitly. Endpoint statements require n≥2. These changes are propagated through the reader, roadmap descriptions, examples, source matches and tests.

### Per-node change inventory

A short id below refers to the corresponding full node id in the packet. Nodes not listed as corrected or added are recorded as verified in `review.checked`.

| Node | Correction |
| --- | --- |
| `LR.0/rational-points-analytic-group` (corrected) | Replaced false uniqueness from topology by algebraic compatibility; used local smooth presentations and the analytic inverse theorem; corrected book pages. |
| `LR.0/locally-analytic-representation` (corrected) | Replaced an additive map incorrectly used as a one-dimensional character by a multiplicative character. |
| `LR.0/derived-lie-action` (corrected) | Removed the hidden circular proof through the distribution action; construct derivatives directly before integrating them. |
| `LR.0/distribution-algebra` (corrected) | Distinguished left and right cosets in the free-module decomposition. |
| `LR.0/distribution-module-structure` (corrected) | Replaced an unjustified global tensor identity by integration of orbit maps in BH subspaces. |
| `LR.0/matrix-coefficient-continuity` (corrected) | Localised the reflexivity argument to compact cosets, avoiding compact-type/reflexivity claims for noncompact G. |
| `LR.0/weak-sequential-convergence` (corrected) | Removed the unproved weak-compactness-to-compactoid implication and isolated the precise Schur-property proof gap. |
| `LR.0/completed-external-tensor` (corrected) | Replaced the false density proof, kept compact-type hypotheses, and moved admissibility to LR.1 to respect the dependency order. |
| `LR.1/admissible-representation` (corrected) | Made the strict closed-quotient argument in strong admissibility explicit. |
| `LR.1/admissible-anti-equivalence` (corrected) | Supplied the distribution-specific nuclearity input rather than treating it as a general Fréchet–Stein fact. |
| `LR.1/admissible-abelian-category` (corrected) | Restricted finite-generation/presentation closure to compact distribution algebras. |
| `LR.1/admissible-external-tensor` (added) | Added the external-admissibility theorem at the layer where coadmissibility is available; product Banach presentations give its proof. |
| `LR.1/ext-groups` (corrected) | Inverted the fixed central character on contragredient dual modules and added a discriminating test. |
| `LR.1/ext1-extensions` (corrected) | Replaced the incomplete extension-closure sketch by Banach flatness and the inverse-limit diagram argument. |
| `LR.1/self-extension-dual-numbers` (corrected) | Corrected pushout functoriality when the induced map on extension classes has a kernel. |
| `LR.2/analytic-vectors` (corrected) | Specified tensor scalars, corrected basis independence of norms and the n ≥ 1 Lie bound. |
| `LR.2/admissible-banach-analytic-vectors` (corrected) | Corrected the compact-open base-change algebra in the noncompact dual formula. |
| `LR.2/derived-analytic-vectors` (corrected) | Removed a false identification of analytic functions with continuous coinduction in the finite-dimensional acyclicity check. |
| `LR.2/admissible-la-acyclic` (corrected) | Restricted the RJRC cohomology comparison to compact groups and recorded the missing quantitative filtration and cochain comparison contracts. |
| `LR.3/solid-analytic-group-representation` (corrected) | Corrected the field of rational points, removed algebraisation of all finite-dimensional analytic actions, and restricted the distribution-module functor to its justified faithful property. |
| `LR.3/banach-analytic-comparison` (corrected) | Restored the strongly inaccessible cardinal hypothesis in the solid conventions. |
| `LR.3/solid-group-representation` (corrected) | Restored the strongly inaccessible cardinal hypothesis in the solid conventions. |
| `LR.3/solid-smooth-representation` (corrected) | Replaced discrete coefficient spaces by the finest locally convex topology; the group-discretisation equivalence remains intact. |
| `LR.3/solid-smooth-discrete-comparison` (corrected) | Made explicit that the equivalence discretises the acting group and preserves solid topological coefficients. |
| `LR.3/solid-smooth-grothendieck` (corrected) | Removed the impossible discrete E coefficient comparison from the generator check. |
| `LR.3/solid-analytic-vectors` (corrected) | Inserted the coefficient extension from ℚ_p to E and removed the duplicated action from evaluation equivariance. Made the scalar extension in the solid invariants formula explicit at every occurrence. |
| `LR.3/integrable-lb-lie-representation` (corrected) | Restored the completed enveloping algebra and stagewise group-germ scope; corrected integration APIs and the Verma comparison. |
| `LR.4/locally-analytic-induction` (corrected) | Corrected compact-type justification, Levi inflation in admissibility, tensor identity, and completed dual; added an equivariance test. |
| `LR.4/unipotent-homology` (corrected) | Restored the topological bar complex and Hausdorff restriction, separated homology from cohomology, and fixed the GL₂ weight and smooth-vanishing checks. |
| `LR.4/schraen-spectral-sequence` (corrected) | Restored the locally algebraic inducing hypothesis and FIN/Tor proof, and distinguished Hausdorff compact type from admissibility. |
| `LR.5/ext-vanishing-long-weyl` (corrected) | Fixed the radical convention in Kostant’s calculation and made the Hom-vanishing and finite-length dévissage inputs explicit. |
| `LR.5/orlik-strauch-functor` (corrected) | Retained the completion and closed relations in the dual description rather than replacing a dense image by an isomorphism. |
| `LR.5/orlik-strauch-exactness` (corrected) | Replaced a blanket flatness shortcut by the source’s separate arguments in the two variables. |
| `LR.5/orlik-strauch-irreducibility` (corrected) | Separated Breuil’s ℚ_p-analytic residue-characteristic assumptions from the sharper original L-analytic theorem. |
| `LR.5/orlik-strauch-jordan-holder` (corrected) | Corrected the full-faithfulness locator and scope, and required finite smooth length for a Jordan–Hölder series. |
| `LR.5/orlik-strauch-products` (corrected) | Removed the forward LR.6 dependency and false pure-tensor generation argument; products of simple objects and exactness supply the LR.5 extension. |
| `LR.6/character-variety` (corrected) | Recorded the conditional rigid/adic bridge, corrected torsion-character descent, and supplied noetherian/flat exhaustion requirements. Declared the compact character-space geometry’s PMIA owner explicitly; the noncompact ℤ^r extension is the new construction here. |
| `LR.6/essentially-admissible` (corrected) | Corrected dual support by inversion and replaced an invalid non-finite-generation argument with the discrete-rank-one counterexample. |
| `LR.6/finite-slope-part` (corrected) | Restored the zla/BH condition in the universal property and specialised the finite-dimensional Fitting check to a single-generator monoid. |
| `LR.6/jacquet-emerton-functor` (corrected) | Inserted the essential inverse-index Hecke factor, specified canonical-lift equivariance and added the trivial GL₂ test. Corrected the inducing weight to the dual of the negative category-O weight; checked by the GL₂ central character. |
| `LR.6/jacquet-emerton-properties` (corrected) | Corrected the source match from algebraic coinvariants to invariants and declared the adjunction prerequisite used by part (3). |
| `LR.6/closed-induction` (corrected) | Restored the Borel restriction of the Jacquet equality and corrected the nondominant GL₂ example and its weight sign. Corrected the inducing weight to the dual of the negative category-O weight; checked by the GL₂ central character. |
| `LR.6/balanced-map` (corrected) | Used dot-antidominance rather than a boundary weight for the simple-Verma test. |
| `LR.6/orlik-strauch-jacquet-adjunction` (corrected) | Reconciled Breuil’s unaveraged and Emerton’s averaged Hecke conventions, corrected opposite-parabolic and modulus twists, and used the source’s bounded polynomial-generation proof. Distinguished the weight-preserving BGG dual from the ordinary contragredient dual in the adjunction formula. |
| `LR.7/principal-series-constituents` (corrected) | Removed the invalid use of L-analytic full faithfulness for a ℚ_p-analytic functor with smooth argument; recorded the precise missing proof contract for the second socle layer. |
| `LR.7/constituent-labels` (corrected) | Corrected the inducing weight to the dual of the negative category-O weight; checked by the GL₂ central character. Used inverse images to label left Weyl cosets, in accordance with w(φ)_j=φ_{w^{-1}(j)}. Added a noninvolutory permutation check and a central-character check for the two source corrections. Added the light inverse-image indexing form used by the suggested Lean cycle checks. |
| `LR.7/constituent-jacquet` (corrected) | Corrected the inducing weight to the dual of the negative category-O weight; checked by the GL₂ central character. Used inverse images to label left Weyl cosets, in accordance with w(φ)_j=φ_{w^{-1}(j)}. |
| `LR.7/ps1-and-pi1` (corrected) | Justified the largest disjoint subrepresentation using finite length and multiplicity one of the common socle, and cited the compatibility needed to collapse repeated constituents. |
| `LR.7/self-extensions` (corrected) | Corrected the direction of the Weyl transition map to the commutative square (3.5), (3.18) or (3.30). |
| `LR.7/constituent-ext-lines` (corrected) | Corrected the inducing weight to the dual of the negative category-O weight; checked by the GL₂ central character. |
| `LR.7/finite-slope-amalgam` (corrected) | Supplied the multiplicity-one hypothesis and finite-length argument behind existence and uniqueness of the common-socle quotient. |
| `LR.7/ext-filtration` (corrected) | Corrected the direction of the Weyl transition map to the commutative square (3.5), (3.18) or (3.30). |
| `LR.8/parabolic-levi-data` (corrected) | Distinguished the singleton’s positional weight from its smooth character in an arbitrary filtration, and replaced W_P by the compatible left coset. |
| `LR.8/parabolic-constituents` (corrected) | Corrected the inducing weight to the dual of the negative category-O weight; checked by the GL₂ central character. Used inverse images to label left Weyl cosets, in accordance with w(φ)_j=φ_{w^{-1}(j)}. |
| `LR.8/zeta-fp` (corrected) | Corrected the swapped first tensor-filtration kernel, stated its pushout map and linearity, and added one-factor and three-factor tests. |
| `LR.8/zeta-fp-bijective` (corrected) | Corrected the direction of the Weyl transition map to the commutative square (3.5), (3.18) or (3.30). |
| `LR.8/endpoint-amalgamation` (corrected) | Required n≥2 for the endpoint parabolics. |
| `LR.9/sigma-analytic-representation` (corrected) | Corrected the non-example to a multiplicative character of L^×. |
| `LR.9/pi1-sigma` (corrected) | Corrected the inducing weight to the dual of the negative category-O weight; checked by the GL₂ central character. |
| `LR.9/sigma-amalgamation` (corrected) | Required n≥2 for the endpoint parabolics. |

## Source findings

All eleven original findings have independent verdicts. E1–E4 and E6–E11 are confirmed. **E5 is rejected**: the positive inducing weight on Ding's p. 44 is correct; contravariance changes the negative category-O weight to a positive inducing weight. A GL₂ central-character calculation detects the rejected correction.

Three findings were added and confirmed against the published text and the corresponding final preprint:

| Finding | Locator in Ding (2025) | Corrected convention |
| --- | --- | --- |
| E12 | §3.1.2, paragraph after Proposition 3.1(4), p. 34 | Left Weyl cosets label inverse images of the initial subset. A 3-cycle detects the error. |
| E13 | (3.1), Lemma 3.2, (3.8)–(3.9), pp. 34–37; Lemma 3.10 proof p. 40 | The inducing weight is +s·λ; the simple category-O module has weight −s·λ. |
| E14 | §3.1.3, between (3.25) and (3.26), p. 42 | For 0→Bᵢ→Xᵢ→Aᵢ→0, the first tensor-filtration kernel is ⊕ᵢ Bᵢ⊠⊗̂ⱼ≠ᵢAⱼ. |

E14 affects the displayed proof construction, whose corrected pushout is supplied. E12–E13 are convention errors with the intended results unchanged. The final preprint was checked at the corresponding §3.1 locators; no correction was located by the recorded journal/arXiv searches. This is not a claim that no correction exists.

The Dospinescu–Le Bras finding E10 distinguishes the distribution norm from its valuation weight: at radius p^(−1/p^h), the norm of log(1+b) is p^(h−1), so its valuation weight is h−1, up to basis constants. The BCGP radius typo E11 was checked in the cited v1. The rejected allegation remains visibly rejected wherever the reader presents the findings.

## Remaining contracts and questions for the orchestrator

The packet gives exact consumers and requests. These are follow-up inputs; this review does not edit their owners.

1. **Category O, Verma layers and dualised Kostant formulas (owner LieHighestWeightPartIICompletedCategoryO, not designed).** The Orlik–Strauch layers and Ding's computations need, for g ⊗_{ℚ_p} E = ∏_σ g_σ with g split reductive: (a) the categories O and O^p_alg (finitely generated U(g ⊗ E)-modules, semisimple algebraic over l_P ⊗ E, locally finite over n_P ⊗ E; Orlik–Strauch §2.5, Breuil socle I §2 (i)–(iii)), abelian and artinian, closed under subobjects and quotients, O^q_alg ⊆ O^p_alg for q ⊇ p; (b) generalised Verma modules U(g) ⊗_{U(p)} W, their unique simple quotients, the maximal parabolic of a simple object and the classification of simple objects by highest weight (Humphreys §§9.3–9.4, Theorem 1.3); (c) for gl_n: the composition factors of the Verma module M^-(−λ), λ dominant, are the L^-(−u·λ), u ∈ W, with multiplicity one when lg(u) ≤ 1, the second radical layer is ⊕_{lg(u)=1} L^-(−u·λ), and multiplicity one of L^-(−s_{i,σ}·λ) in the parabolic Verma modules U(g) ⊗_{U(p)} (−λ) used in Ding's Lemma 3.10 (Humphreys Chapters 4–6, 8–9); (d) Kostant cohomology with the chosen positive roots, and homology obtained by H_q(n_P,W)=H^q(n_P,W∨)∨. The radical, dual and root twists must be fixed explicitly; the unadjusted cohomological w·λ formula is not a homology formula (Schraen Théorème 4.10, pp. 82–83). Upstream LieHighestWeight excludes full category O; the accepted LieHighestWeightPartII packet proposes the split-off roadmap LieHighestWeightPartIICompletedCategoryO as its owner (restructure, 'one algebraic completion owner and one category-O consumer'), which has no design job yet. Until it exists these statements are imported as this contract; no node of this roadmap plans them. Also supply the restricted BGG dual associated to a root-reversing anti-involution fixing the Cartan, with exactness, involutivity and preservation of simple highest-weight modules (BR15 pp. 14–15). This dual is distinct from the ordinary contragredient.
2. **Solid functional analysis (owner LocallyAnalyticDistributionsPartIIQuasiAbelianFunctionalAnalysis, not designed).** BCGP §2.2 rests on solid functional analysis recalled from Rodrigues Jacinto–Rodríguez Camargo: Banach, Smith, Fréchet, LB and LS spaces as solid E-vector spaces and their equivalence with the classical notions (BCGP Proposition 2.2.9, RJRC22 Theorem 3.40), Banach–Smith duality and Hom(W, V) = W^∨ ⊗ V for W Smith and V Banach (RJRC22 Corollary 3.17), trace-class and compact maps and compact-type objects (BCGP Definitions 2.2.10–2.2.12, Proposition 2.2.13), flatness (BCGP Lemma 2.2.14). The accepted LocallyAnalyticDistributionsPartII packet proposes the owner LocallyAnalyticDistributionsPartIIQuasiAbelianFunctionalAnalysis (its restructure entry 1), which has no design job yet. LR.3 imports these statements as this contract.
3. **Proof of Dospinescu–Le Bras, Lemme 5.10.** DLB17 Lemme 5.10, p. 29, states that weakly null sequences in a Hausdorff locally convex space over a spherically complete field are null, without a proof. After passage to seminormed quotients, the missing input is the nonarchimedean Schur property for normed spaces. The existing compactoid supplier does not by itself show that the weakly compact sequence together with 0 is compactoid. Supply a complete proof or a cleared, exact published locator; the earlier suggested compactoid argument is withdrawn. No uncleared book was read.
4. **Breuil–Qian: Ext^1(C(I, s_{i,σ}), π_alg) is one-dimensional.** Ding's Lemma 3.5(1) quotes from Breuil–Qian (Splitting and expliciting the de Rham complex of the Drinfeld space, arXiv 2024, Proposition 5.1.14 with Lemma 3.2.4(ii)) that Ext^1(C(I, s_{i,σ}), π_alg(φ, h)) is one-dimensional, and proves only the other direction Ext^1(π_alg, C(I, s_{i,σ})) by Schraen's spectral sequence. No target of this roadmap or of its consumers' contracts uses the first direction; the paper was not read. The direction is stated in LR.7/constituent-ext-lines as an imported statement.
5. **Derived analytic vectors: analytic-radius comparison and compact-group cohomology.** Pan Theorem 2.2.3, pp. 13–14, uses the Colmez–Dospinescu C^(m) filtration and its quantitative comparison with G_n-analytic norms to make the cohomology transition maps zero. The packet supplies no source-located target for that comparison. A follow-up must state the two-sided filtration bounds, the radius shifts and their tensor compatibility for B ⊗̂ M, and prove them from the cited Colmez–Dospinescu result. Separately realise the continuous cochain/solid derived comparison of RJRC22 Theorem 1.5 and Corollary 1.6 for compact G. The source statements of the acyclicity and compact comparison targets are verified; their proof closure remains partial.
6. **Rigid character-space carrier comparison.** The supplier LocallyAnalyticDistributions L3/mellin-adic-comparison explicitly conditions its adic realisation on a rigid/adic bridge. LR.6’s noncompact character-space construction is source-verified in EM17 Propositions 6.4.1–6.4.6, pp. 124–127, but the supplier carrier comparison must be discharged before those rigid function spaces can be identified with the adic quasi-Stein interface used in the packet. The compact character space remains owned by its supplier.
7. **First two socle layers for the ℚ_p-analytic Orlik–Strauch functor.** Ding Proposition 3.1(3), p. 34, states the second socle layer used here, but its cited OR19 Theorem 1, p. 2, is a locally L-analytic full-faithfulness theorem with trivial smooth argument. Establish the needed restricted consequence for the ℚ_p-analytic functor with generic finite-length smooth principal-series argument: the first two radical layers of M^−(−λ) give exactly soc(PS) and soc(PS/π_alg), with no additional simple subobjects. BR16 Corollary 2.5 proves the first socle; it does not by itself supply the second. This is an open proof contract, not a claimed general full-faithfulness extension.
8. **Finite-E smooth principal-series supplier refinements.** The current upstream SmoothRepresentationsOfLocalGroups targets principal-series-jacquet, finite-length and generic-irreducibility were read in SR.2.2 and SR.3.1. They use ℂ; generic-irreducibility asserts an unspecified nonempty Zariski-open set. They do not state the E-valued GL_n ratio criterion, all-permutation isomorphisms or the unnormalised Jacquet decompositions needed by Ding §3.1.2. These source-verified consumer statements remain conditional on the three exact requests. They are owned by the smooth supplier, rather than re-planned in LR.7.
9. **Split finite-E highest-weight and Harish–Chandra interfaces.** Current LieHighestWeight layers 3, 4 and 7 are stated over an algebraically closed characteristic-zero field with their semisimple hypotheses. LR.1 and LR.7 use split reductive algebras ∏_σ gl_n over finite E/ℚ_p. Refine the supplier to construct E-rational highest-weight modules, their absolute irreducibility and classification, PBW/Verma interfaces and the Harish–Chandra centre with dot action, proving extension/descent from an algebraic closure and treating the reductive centre. No algebraically closed-field theorem is silently applied to finite E.
10. **Solid analytic foundational supplier contracts.** SolidAnalyticRings SA.1, SA.2 and SA.4 are stage-level plans, with no target-level packet available in this checkout. The three existing requests specify the strongly-inaccessible/light-condensed conventions, solid E_■-modules, analytic affinoid base change and profinite group rings used by BCGP §§2.2.1–2.2.8. These are planned supplier contracts, not checked implementations or established target-level closure. The separate solid functional-analysis gap supplies Banach/Smith/LB compatibility and flatness.

Please route the category-O and solid functional-analysis contracts to their designated Part II owners, and route the finite-E refinements to the existing LieHighestWeight and SmoothRepresentationsOfLocalGroups owners. PMIA L0a supplies compact character geometry, and LR.6 only adds the discrete ℤʳ factor. No ownership move or edit to another roadmap was made. The unused reverse Breuil–Qian Ext direction may be removed in a later scope decision instead of expanding the reading solely for an unused statement; its current status is explicitly imported and unread.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/LocallyAnalyticRepresentationsOfLocalGroups.json`: 0 errors, 0 warnings; counts as above.
- The source-issue validator and source-version validator used by `check_errata.py` pass on the packet's 14 findings. The standalone errata CLI requires an `errata-v1` file and is not a packet validator.
- A separate graph traversal checked all 83 nodes for cycles and later-stage local edges. The review ledger covers every node exactly once.
- Reader/packet parity checked every statement, hypothesis, acceptance example, proof step, prerequisite, API statement and unit test. Both JSON deliverables parse, and `git diff --check` passes.
- `lean-check research/blueprint/suggested/LocallyAnalyticRepresentationsOfLocalGroups.lean` elaborated successfully at the pinned Mathlib commit, with only `declaration uses sorry` warnings. Memory availability was checked before compilation. The new inverse-image definition and three examples elaborate without sorry. No heavy representation carrier or sorry-backed data definition was added.

The [handoff](../handoff/REV-DESIGN-LocallyAnalyticRepresentationsOfLocalGroups.md) identifies the follow-up boundaries. No source file, source passage, local filesystem path or scratch artifact is part of the submission.
