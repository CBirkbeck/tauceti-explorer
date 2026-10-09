# Independent review: EDC.4–EDC.8, revision 3

Job `REV-EtaleDualityAndPerverseSheaves--EDC.4~3`, [issue #7546](https://github.com/CBirkbeck/tauceti-explorer/issues/7546). Reviewer: Codex — codex-plXW3i, 2026-10-09. This session wrote none of the three incoming plans. The [revision-two report](REV-EtaleDualityAndPerverseSheaves--EDC.4~2.md), incoming planning handoff, binding protocols and two nearby upstream roadmaps were read.

**Verdict: needs_changes.** The review is finished, not a checkpoint. The ambient-operation, transition-compatible descent and general recollement defects from the preceding review are repaired. Clear further corrections are applied in the packet, reader and suggested file. The proposed general stratified semismall theorem still lacks a justified costalk proof under its exact hypotheses. Its separate smooth-source constant-field specialization and small-map consequence are verified.

## Counts and coverage

All 117 nodes have an independent disposition: 96 verified, 20 corrected, one unverifiable and zero added. There are 46 theorem, 48 lemma, ten construction, ten definition, two comparison and one application nodes; 128 API entries; 74 tests on definitions/constructions and thirteen further named tests, totaling 87; 21 planets; eleven baseline declarations; twenty public source copies; seventeen supplier requests; and eight gaps. Every implementation status is unchecked. All incoming node IDs are retained.

EDC.4, EDC.6, EDC.7 and EDC.8 retain planned coverage. EDC.5 is partial, with the general semismall costalk target identified precisely in its remaining list. No stage is closed. The packet status is partial because its 117 nodes are below the 300-node budget and a stage still lacks a justified target. The validator rejects complete with partial coverage in this situation. This status describes the reviewed plan; it does not mean the independent review job is unfinished. Named external requests, the seven inherited gaps and Part II transports are not independent rejection grounds.

The pass stays at target granularity. Every definition/construction has at least three use-driven API entries and three active mathematical tests. No routine proof lemmas or exhaustive variants were demanded. The reader contains every node statement, proof step, source locator, API statement and test name and agrees with the corrected packet.

## Remaining mathematical defect

The general `semismall_pushforward_perverse` now accepts an arbitrary perverse K and finite smooth equidimensional source/target strata. `IsAdapted` asserts lisse ordinary cohomology of the restrictions to source strata. `StratifiedLocalTriviality` supplies separate product charts for each source-stratum intersection above a target stratum, over a common étale cover. These charts preserve the projection, but do not assert simultaneous local triviality of the stratified pair or compatibility of local coefficients and normal geometry.

The upper bound can use proper base change, compact-support localization on locally closed fibre pieces and the numerical dimension inequality. The lower bound is not established. The claim that the product charts identify all cohomology restrictions with locally constant objects does not account for arbitrary lisse coefficient variation or costalks. BBD 4.2.8, printed p.112, uses both i_s^*K and i_s^!K with lisse cohomology when testing perverse bounds on a smooth stratification. The current input has only the first condition. Over fields, applying the same upper-bound argument to D K requires proving its adaptation; that is absent. Over O, merely naming an Ext-one term supplies neither the exact indices nor their vanishing, and p is not self-dual.

Mirković–Vilonen §4, Lemma 4.3, pp.14–15, is a complex-topological statement about locally trivial stratified maps with its own compatibility and properness conditions. It does not prove the proposed scheme statement with these separate fibre-piece charts. A scheme proof must provide precise coefficient-adapted local geometry and an actual costalk/localization estimate, including the integral p range, or cite an étale theorem with matching hypotheses. The report does not assert a counterexample to the proposed general theorem. It records an unverified non-routine proof step, not a missing optional variant.

The separately typed smooth-source constant-field theorem is justified by the dimension-bound/duality argument of de Cataldo–Migliorini 4.2.1, p.56. The small-map IC uses that specialization and strict boundary inequalities, including the zero-dimensional boundary case; it does not need the unverified arbitrary-input extension. The new eighth gap, the inline reader notice and the suggested-file comment make this distinction explicit.

## Corrections applied

- **Correct coefficient carriers.** The Hom-presheaf previously evaluated arbitrary O/E perverse inputs through ordinary small-étale constant-coefficient realization. It now restricts the fully faithful coefficient realization into the appropriate coefficient-derived category on every small-étale object V. The module-sheaf carrier accepts native schemes, so arbitrary V need not be falsely assumed finite type. For O/E the carrier uses pro-étale completed O_V/E_V modules. The ordinary finite coefficient comparison remains separate. Bhatt–Scholze 6.8.1–6.8.2, p.58 and 6.8.15, p.62 are the coefficient gates.
- **Adic dualizing cohomology.** Correspondence traces previously landed in H0 of an ordinary small-étale dualizing object even for O/E. The target now uses the realized relative dualizing object and cohomology in the same coefficient category as the correspondence. The finite scheme/diamond comparison remains finite-coefficient theory.
- **Actual trace construction.** Replaced the unsupported restriction/exchange expression involving Δ′^*c^! with the construction in Varshavsky 1.2.2(b), formula (1.4), p.9. Diagonal adjunction gives D L ⊠ L → Δ_*K_X; apply c^! and proper base change to obtain Δ′_*K_Fix(c), then take H0. Added the direct SF.2 and adic-transport inputs. The active linear trace signature is preserved with its corrected carrier.
- **Smooth full faithfulness.** Added surjectivity to the packet/reader smooth connected-fibre statement, matching the existing active form and BBD 4.2.5, pp.108–109. Without it, an empty source could erase a nonzero target category.
- **Finite Tor gates.** Made the finite-coefficient D_ctf input explicit in the finite-order local-term theorem. Aligned the external-product API with the active bounded external-product receipts by specifying finite-Tor hypotheses on both source and target pairs.
- **Direct dependency.** Added perverse amplitude estimates to the affine Artin node, whose quasi-finite proof explicitly uses the zero-dimensional fibre estimate.
- **Source support.** Expanded abstract intermediate-extension and its five API locators to BBD 1.4.22–1.4.26, pp.54–55, and supplied its full-faithfulness argument from the characterization. Expanded Zhu A.3.1 to pp.54–55, with the normalization display on p.55, in IC and its two API nodes. Added BBD 6.2.10, p.165 for complex relative hard Lefschetz. Expanded invariant restriction and its two APIs to Varshavsky 1.1.9, p.8 and 1.5.6, p.16. Expanded E15's preprint locator to pp.55–56.
- **Independent records and boundaries.** Replaced all 117 node dispositions, all eleven baseline receipts and all five source-issue review records with this session's checks. Added the precise semismall gap and partial coverage, and synchronized the reader. Retained the red-team verifier's ambient Artin-stack and G_m-monodromic qualifications in the proposed Part IIs. Normalized the published Zhu receipt’s source-version kind to the protocol value `published`. No node or baseline citation was removed, and none was added.

The concrete node-field edits are:

- `EtaleDualityAndPerverseSheaves:EDC.5/abstract-intermediate-extension`: proofSteps, sources.
- `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaves`: proofSteps, api.
- `EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex`: sources.
- `EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing`: prerequisites.
- `EtaleDualityAndPerverseSheaves:EDC.5/perverse-amplitude-estimates`: statement, proofSteps, sources.
- `EtaleDualityAndPerverseSheaves:EDC.7/characteristic-zero-decomposition`: sources.
- `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-restriction`: sources.
- `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-composition`: api.
- `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-trace`: statement, proofSteps, prerequisites, api.
- `EtaleDualityAndPerverseSheaves:EDC.8/local-terms-finite-order`: statement.
- `EtaleDualityAndPerverseSheaves:EDC.5/api-recollement-upper-star-intermediate-extension`: sources.
- `EtaleDualityAndPerverseSheaves:EDC.5/api-recollement-intermediate-extension-no-sub-quotient`: sources.
- `EtaleDualityAndPerverseSheaves:EDC.5/api-recollement-intermediate-extension-unique`: sources.
- `EtaleDualityAndPerverseSheaves:EDC.5/api-recollement-intermediate-extension-fully-faithful`: sources.
- `EtaleDualityAndPerverseSheaves:EDC.5/api-recollement-simple-classification`: sources.
- `EtaleDualityAndPerverseSheaves:EDC.5/api-intersection-complex-restrict`: sources.
- `EtaleDualityAndPerverseSheaves:EDC.5/api-intersection-complex-simple`: sources.
- `EtaleDualityAndPerverseSheaves:EDC.8/api-coh-corr-restrict-closed-support`: sources.
- `EtaleDualityAndPerverseSheaves:EDC.8/api-coh-corr-restrict-open-support`: sources.

## Revision-two requests independently reassessed

| Previous defect | Current finding |
| --- | --- |
| Universally bounded tensor/RHom/reduction | Repaired. Operations have ambient unbounded coefficient-category types. Bounds are tested using the native standard t-structure, including all degree-zero sheaves. Bounded results are corestricted through actual essential-image receipts. Dbc still contains nonperfect objects. The Z/ell² residue test computes all Tor and Ext degrees. |
| Componentwise descent without transition compatibility | Repaired. Double-intersection transitions, diagonal identity and triple cocycle are explicit. CompatibleTrivialization requires the supplied transitions to be recovered from the global object's local identifications. Common bounds and negative-Ext gates remain in the conditional BBD 3.2.4 supplier. The residual adic Hom-carrier leak was corrected here. |
| General recollement replaced by affine comparison | Repaired. The active theorem gives both BBD 1.4.19 general five-term sequences for arbitrary perverse K. The affine-open comparison remains separately named. The surface/closed-point test prevents an amplitude-one assumption. |
| General semismall target replaced by smooth constants | The requested arbitrary-input signature is now present. Its stated geometry and coefficient adaptation do not yet justify the costalk proof. The smooth-source specialization remains valid; the exact new defect is recorded above. |

Earlier repaired results were rechecked: dual high complete-intersection generators and degree-unit splitting; specified blow-up columns with negative exceptional restriction; two-sided t-homology detection; shifted lisse IC and strict boundary bounds; right-adjoint diamond recovery; stable-lattice analytic image; geometric semisimplicity and actual finite weight flags; restricted good-model specialization; actual relative Chern powers and primitive kernels; correspondence SupportEquiv preserving u; proper component integration; tame order as a scheme-automorphism equality; and Delta²=q^(-d chi).

## Pinned baseline and library audit

All eleven exact declarations and their surrounding assumptions were read independently at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. No baseline citation was removed or renamed. The Tau Ceti pin is `f790474821cf4256814db967cb154e7af3d0c369`; this suggested file cites and imports no Tau Ceti declarations. The shared build uses the exact Mathlib pin. Its different Tau Ceti head contributes no imports and is not presented as the Tau Ceti pin.

| Declaration | Contribution and limit independently confirmed |
| --- | --- |
| [mathlib:AlgebraicGeometry.isClosedImmersion_iff_isAffineHom](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean#L364) | A morphism is a closed immersion iff it is affine and surjective on sections over affine opens; used to see that a closed subscheme of an affine scheme maps to it by an affine morphism. |
| [mathlib:AlgebraicGeometry.isAffine_of_isAffineHom](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Affine.lean#L185) | Given an affine morphism f : X → Y and an affine Y, X is affine. For the Lefschetz complement, first express U as a closed subscheme of the affine projective basic open; this lemma does not assert that arbitrary open subschemes are affine. |
| [mathlib:AlgebraicGeometry.Proj.basicOpenIsoSpec](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Basic.lean#L161) | For a homogeneous element of positive degree, the native basic open D_+(f) is isomorphic to Spec of the degree-zero localization. With the graded projective-space bridge this gives the affine hyperplane complement; it does not supply that geometric bridge by itself. |
| [mathlib:CategoryTheory.Triangulated.TStructure](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean#L55) | t-structures on a pretriangulated category, given by the predicates le n and ge n with shift, orthogonality and truncation-triangle axioms; the carrier of every t-structure in EDC.5. |
| [mathlib:CategoryTheory.Triangulated.TStructure.heart](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Triangulated/TStructure/Heart.lean#L44) | The heart t.le 0 ⊓ t.ge 0 of a t-structure as an object property; the Heart class identifies a category with it. |
| [mathlib:CategoryTheory.Triangulated.AbelianSubcategory.abelian](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Triangulated/TStructure/AbelianSubcategory.lean#L301) | An additive fully faithful inclusion into a triangulated category, with additive shifts, vanishing negative shifted Hom and admissibility of every morphism, equips the included category with Abelian. The heart must first satisfy these hypotheses; Heart.lean does not supply its abelian instance at the pin. |
| [mathlib:CategoryTheory.Functor.IsHomological](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Triangulated/HomologicalFunctor.lean#L82) | A functor from a pretriangulated to an abelian category is homological if it sends distinguished triangles to exact sequences; the property of H⁰_t. |
| [mathlib:DerivedCategory.TStructure.t](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/TStructure.lean#L35) | The canonical t-structure on the derived category D(C) of an abelian category; the comparison object of the unit tests of EDC.5. |
| [mathlib:CategoryTheory.Functor.IsTriangulated](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Triangulated/Functor.lean#L184) | Triangulated functors (sending distinguished triangles to distinguished triangles); the six functors of a recollement are triangulated. |
| [mathlib:Matrix.charpoly_transpose](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean#L167) | charpoly(Mᵀ) = charpoly(M); used for the reciprocity of characteristic polynomials of a pairing similitude. |
| [mathlib:LinearMap.det_dualMap](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Determinant.lean#L790) | The determinant of the dual map of an endomorphism of a finite free module equals its determinant. |

The reviewed library audit for EDC.0–EDC.8 was read. EDC.5 reuses native t-structure/heart scaffolding and plans the missing abelian/admissibility and perverse theory; other target theories are absent. EDC.0/E1 own ambient derived operations and EDC.3 owns finite Chern/Gysin/projective-bundle theory. SF.0/2/3/5 are owner specifications and precise requests, not claimed theorem-level suppliers. AdicSpaces and AnalyticToricGeometry were read for density and ownership; no upstream document was edited.

## Supplier closure, APIs, tests and planets

All 55 distinct consumed fine supplier statements were inspected with their coefficient/geometry conditions. The inventory below names the actual imports; reading a stage title was not treated as theorem support. The seventeen requests specify the still-missing owner interfaces, notably normalized constructibility, conditional descent, good-model/residual specialization, actual line/bundle geometry, derived-Hom Hochschild–Serre and strong diamond essential-image preservation. The local prerequisite graph remains acyclic after the new direct edges.

- `AdicCoefficientsAndComparisons:L2/coefficient-and-unbounded-extension`
- `AdicCoefficientsAndComparisons:L2/scheme-support-extension`
- `AdicCoefficientsAndComparisons:L3/commutation-and-adjoints-27-1-27-3`
- `AdicCoefficientsAndComparisons:L3/full-faithfulness-27-2`
- `AdicCoefficientsAndComparisons:L3/internal-Hom-right-adjoint`
- `AdicCoefficientsAndComparisons:L3/pushforward-right-adjoint`
- `AdicCoefficientsAndComparisons:L3/rf-shriek-comparison-27-4`
- `AdicCoefficientsAndComparisons:L4/analytic-test-space`
- `AdicCoefficientsAndComparisons:L4/proper-support-comparison-27-5`
- `AdicCoefficientsAndComparisons:L6/constructible-direct-image-comparison-27-6`
- `AdicCoefficientsAndComparisons:L6/constructible-full-faithfulness-27-7`
- `AdicCoefficientsAndComparisons:L6/semistable-boundary-induction`
- `AdicCoefficientsAndComparisons:L6/trait-open-comparison`
- `ClassicalAdicEtaleCohomology:H5/comparison-over-nonarchimedean-fields-3-8-1`
- `ClassicalAdicEtaleCohomology:H5/proper-comparison-3-7-2`
- `DeligneWeightsAndPurity:DWP.8/compact-support-direct-image-upper-weights-6-2-3`
- `DeligneWeightsAndPurity:DWP.8/directional-weight-estimates`
- `DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity-theorem-3-4-1-iii`
- `DeligneWeightsAndPurity:DWP.8/mixed-complexes`
- `DeligneWeightsAndPurity:DWP.8/proper-direct-image-preserves-purity-6-2-6`
- `DeligneWeightsAndPurity:DWP.8/pure-complexes`
- `DeligneWeightsAndPurity:DWP.8/six-operations-preserve-mixedness-6-1-11`
- `DeligneWeightsAndPurity:DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5`
- `EnhancedDerivedSheaves:E4/coefficient-system-reconstruction`
- `EnhancedDerivedSheaves:E4/inverse-limit-reconstruction`
- `EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`
- `EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`
- `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`
- `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`
- `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps`
- `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/dualizing-complex`
- `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image`
- `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/sheafified-adjunction`
- `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/upper-shriek-pseudofunctor`
- `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual`
- `EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`
- `EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`
- `EtaleDualityAndPerverseSheaves:EDC.1:biduality/dualizing-complex-of-smooth-scheme`
- `EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`
- `EtaleDualityAndPerverseSheaves:EDC.1:biduality/relative-and-geometric-duality`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion`
- `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity`
- `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/top-degree-compact-cohomology`
- `EtaleDualityAndPerverseSheaves:EDC.3/chern-classes`
- `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`
- `EtaleDualityAndPerverseSheaves:EDC.3/fundamental-class`
- `EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`
- `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`
- `EtaleDualityAndPerverseSheaves:EDC.3/projective-bundle-freeness`
- `EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`
- `EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula`
- `EtaleDualityAndPerverseSheaves:EDC.3/smooth-pair-purity`

The 128 API entries were checked against native carriers and actual maps, including t-exact adjoints, heart images, strict IC inequalities, coefficient reductions with associators, subobject weight flags, primitive kernels/columns and correspondence mates. All 87 named tests are present as active declarations/examples, with genuinely discriminating inputs: shift direction and degenerate t-structure, missing adjoint, nonperfect periodic resolution, nontrivial cocycle compatibility, nodal IC, integral p/p-plus, unipotent arithmetic purity, nonunit analytic monodromy, nonzero genus-one geometric Ext, actual arbitrary u, negative-degree trace and nonsplit quadric sign. These are admitted planning statements, not proved test executions. The 21 planets name central definitions/constructions and named theorems; none claims source-location trivia or formalization.

## Handed red-team findings

The original four findings and their independent verifier records were read, together with the packet proposals and reader dispositions.

| Finding | Disposition |
| --- | --- |
| RT-AREA-etale/3 | Correct shared stack Part II routing for GS.1/GS.3, ET.2b, Yun–Zhang/Lafforgue and the two other Part IIs. Added the verifier's unbounded Artin-stack and separate representability/stabilizer/support gates; no blanket D_c^b preservation is promised. |
| RT-AREA-etale/16 | Correct perfect/equivariant/hyperbolic localization Part II ownership, reusing the perfect-space carrier and perfection invariance. Added the monodromic gate. Finite-model IC/decomposition remain here and Witt-Grassmannian parity belongs to Satake; E14/E15 qualify trace normalization. |
| RT-AREA-etale/17 | Correct L3→EDC.6 stage-edge proposal, with actual fine L3 imports already identified. L4/H5 transitively supplied inputs are not replanned. |
| RT-AREA-geomlanglands/18 | Correct EDC.5 replacement for misplaced EDC.4 perversity, L1/L3→GS1 and removal of unexplained VS3 correspondence/fusion edges. Relative perversity/ULA remain outside this absolute scheme packet. |

These remain proposals for the orchestrator and maintainer. No atlas edge, campaign data, supplier packet or red-team ledger was edited.

## Public sources and source issues

All twenty public copies were independently fetched; their SHA-256 values match the incoming packet. Each node's locator and its surrounding argument were checked. This is a target-directed reading, not a section-by-section extraction or a claim to have read entire books. Public URLs and hashes are retained in the packet and reader. Huber's theorem is consumed from the inspected H5 supplier; its book was not independently acquired or read. No library-cleared book was needed for this job. Source descriptions and mathematical objections are in the reviewer's own words; no source passage is reproduced.

| Public copy | Node-locator reading in this review |
| --- | --- |
| [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf) | Théorème 1.3.6, p. 31; 1.3.16, p. 36; 1.4.3 (1.4.3.1)–(1.4.3.2), p. 44; Théorème 1.4.10, p. 48; Définition 1.4.22, Propositions 1.4.23 and 1.4.26, Corollaires 1.4.24–1.4.25, pp.54–55; 4.0, (4.0.1)–(4.0.2), p. 102; Proposition 2.1.3, p. 57; 2.2.14, p.71, and 4.0, p.101; Corollaire 2.1.23, p. 65; 2.2.19, p. 74; 3.2.2–3.2.4, pp. 86–87; proof 3.2.17–3.2.18, pp. 95–96; 4.0 (Exemples), p. 102; Proposition 1.4.16, pp.51–52; Lemma 1.4.19, p.52; Proposition 2.1.9, p. 59; Théorème 4.3.1 (ii), p. 112; 4.0 (autodualité), p. 102; Corollaire 4.1.3, p. 103; 4.2.4–4.2.6, pp.108–110, especially 4.2.5, pp.108–109; 4.0 (a), p. 101, with 3.3.4, p. 99–100; 2.2.18, p. 73; 6.1.2(A′)–(C′), pp. 149–150; 6.1.2 (B′), p. 149; Théorème 5.4.1, p. 141 (with Stabilités 5.1.14, p. 128); Proposition 5.1.15, p. 129; 5.1.2.3–5.1.2.5, pp. 123–124; Théorème 5.3.5, p. 136; Corollaire 5.3.2, p. 135; Théorème 5.3.8, p. 138; Théorème 5.4.5, p. 142; Théorème 5.4.10 and proof 5.4.11–5.4.15, pp. 144–147; Théorème 5.4.10, p. 144; 6.1.8–6.1.10, pp. 155–159; 6.2.4–6.2.6, pp. 162–164; Théorème 6.2.5, p.163, and 6.2.10, p.165; 2.2.14, p.71; Formal abelian-category consequence of 5.4.10, p. 144; 6.2.4, p.162; 6.2.6–6.2.9, pp.163–164 |
| [Deligne-WeilII-1980](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf) | §4, (4.1.6), p. 218; §4, (4.1.6), p. 219; §4, (4.1.6), p. 218–219; §4.3, before Lemme (4.3.2), p. 222 |
| [Deligne-WeilI-1974](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf) | §7, p. 299; §7, p. 300; §5, (5.7), p. 292; §7, proof of Lemme (7.1), p. 299; (2.6), p. 282 |
| [Milne-LEC-v2.21](https://www.jmilne.org/math/CourseNotes/LEC.pdf) | §16 (aside on complete intersections), p. 110; §23, Theorem 23.2, p. 139; §33, proof of Lemma 33.2, p. 194; §33, Lemma 33.2 and proof, p. 193–194; §16, p. 110; Remark 27.13, p. 159 |
| [SGA4-XIV](https://www.normalesup.org/~forgogozo/SGA4/14/14.pdf) | XIV, Corollaire 3.2, LNM 305 pp. 160 |
| [SGA4-XVI](https://www.normalesup.org/~forgogozo/SGA4/16/16.pdf) |  |
| [Stacks-Morphisms](https://stacks.math.columbia.edu/download/morphisms.pdf) | Morphisms of Schemes, Lemma 44.18, Tag 0EKE |
| [Varshavsky-LV-2007](https://arxiv.org/pdf/math/0505564v2) | Definition 1.1.4 and Remark 1.1.5, p. 7 (arXiv v2); 1.1.6(a), p. 7 (arXiv v2); 1.1.9, p.8; Definition 1.5.1(a), p.14; 1.5.6, p.16 (arXiv v2); 1.2.2(b), formula (1.4), p. 9 (arXiv v2); Corollary 1.2.6, p. 10 (arXiv v2) |
| [Varshavsky-LocalTerms-2020](https://arxiv.org/pdf/2003.06815v3) | Example 5.3, Corollary 5.4(b), Corollary 5.6 and Corollary 4.11, pp. 10–11 (arXiv v3) |
| [Hansen-Kaletha-Weinstein-2022](https://arxiv.org/pdf/1709.06651v4) | Proposition 5.6.2, p. 61 (arXiv v4) |
| [Lu-Zheng-2022](https://arxiv.org/pdf/2005.08522v4) | §2.2, Construction 2.6, p. 13 (arXiv v4) |
| [Caraiani-Scholze-2017](https://arxiv.org/pdf/1511.02418v1) | discussion after Corollary 6.1.4, p. 87 (arXiv v1) |
| [Mirkovic-Vilonen-2007](https://arxiv.org/pdf/math/0401222v5) | §4, Lemma 4.3, p. 14 (arXiv v5) |
| [deCataldo-Migliorini-2009](https://arxiv.org/pdf/0712.0349v2) | §4.2, Proposition 4.2.1, p. 56 (arXiv v2); §4.2, Remark 4.2.4, p. 56 (arXiv v2) |
| [Yun-Zhang-2019](https://math.mit.edu/~zyun/GZW_ramified_published.pdf) | §7.1, proof of Proposition 7.1(1), published p. 507 |
| [Liu-Tian-Xiao-Zhang-Zhu-2022](https://arxiv.org/pdf/1912.11942v3) | §5.11, Lemma 5.11.3(3), p. 98 (arXiv v3) |
| [Zhu-2017](https://arxiv.org/pdf/1407.8519v3) | Appendix A.3.1, pp.54–55 (arXiv v3; IC normalization display on p.55); proof of Lemma 2.11, p. 26 (arXiv v3) |
| [Bhatt-Scholze-proetale-2015](https://arxiv.org/pdf/1309.1198v2) | §§6.5–6.8, especially Proposition 6.6.11, Theorem 6.7.1 and Lemma 6.7.2, Proposition 6.8.14 and Remark 6.8.15, pp. 49–62 (arXiv v2); Remark 6.8.15, p. 62 (arXiv v2) |
| [Scholze-ECD-2026](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf) | §27, Proposition 27.2, p. 163; §27, Proposition 27.4, p. 165 |
| [Zhu-2017-published](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf) | A.1.2, p.465; A.3.1–A.3.3, pp.478–480, for E13–E15 |

All five source issues are independently **confirmed** with this job ID. E11 was checked on the BBD p.71 image against the defining inequalities; a shifted closed-point skyscraper detects the error. E12 was checked on the p.112 image against §4.0's chosen algebraic-closure coefficients; it is a label error in that section, not a rejection of finite-E classification. E13's smooth dualizing normalization was read in Zhu v3 p.55 and published p.478; IC must restrict with shift dim. E14's perfect-field convention was checked in published A.1.2, p.465: Spec F_(q²) over F_q has two geometric top components. E15 was checked in published p.480 and v3 pp.55–56: relative Frobenius on P¹ multiplies the ordinary trace normalization by p, while its perfection is an automorphism. Neither a geometric-component scalar nor a model-independent ordinary trace can be inferred without the recorded qualifications. Historical corrigendum searches remain historical; no author-endorsed correction or exhaustive absence of one is asserted.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.4.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/EtaleDualityAndPerverseSheaves--EDC.4.lean`: **exit 0**, 610 warnings, all declaration uses of `sorry`; no other warnings or errors. Available memory was over 110 GiB before compilation. The first attempt exposed adjacent documentation comments introduced by this review; their duplication was removed and the corrected file passed.
- Source-issue checks: `versions_checked` and `check_issues` from the repository validators pass with the packet’s roadmap identity. The standalone `check_errata.py` CLI expects an `errata-v1` file, so its envelope check is inapplicable to this blueprint packet. Its version-kind check exposed the inherited Zhu `version of record` value, now normalized to `published`.
- Packet/reader synchronization check: all 117 statements, hypotheses, proof steps, source locators and 128 API statements are present; all 87 test names occur in the active suggested file. Review checked IDs equal the node IDs exactly, with no duplicates.
- `python3 research/blueprint/intake.py check-files` on the five deliverables: **0 problems**.
- `git diff --check`: passed. Only the three reviewed files, this report and this job's handoff are changed.

Elaboration checks that the admitted planning signatures typecheck at the Mathlib pin. It does not establish their mathematical truth; in particular it does not resolve the explicitly unverified semismall theorem.

## Questions for the orchestrator

1. Revision three still cannot be accepted at the general semismall node. Decide how to route its precise remaining costalk/local-geometry work after the programme's three-round limit; do not infer acceptance from the successful Lean elaboration or four planned stages.
2. Apply the already recorded stack/perfect Part II and coarse dependency proposals through their own jobs. They are not authorized edits in this review.

## Per-node independent record

| Node | Verdict | Evidence or remaining defect |
| --- | --- | --- |
| `EDC.4/affine-vanishing-hypercohomology` | verified | SGA 4 XIV 3.2, p.160 and the bounded hypercohomology spectral sequence give the support-sensitive bound. The active form bounds only nonzero ordinary cohomology sheaves. |
| `EDC.4/compact-support-vanishing-smooth-affine` | verified | Weil II 4.1.6, pp.218–219 and EDC.2 derived duality give the low compact range. The integral Hom and Ext-one indices and finite-free lisse hypothesis are retained. |
| `EDC.4/weak-lefschetz` | verified | Weil II 4.1.6, pp.218–219 allows a singular section. Compact localization on the smooth affine complement gives precisely the bijective and injective ranges. |
| `EDC.4/weak-lefschetz-gysin` | verified | Purity and compact localization give the high Gysin range, including middle surjectivity, without assuming an integral high hyperplane-power basis. |
| `EDC.4/weak-lefschetz-integral` | verified | The integral universal-coefficient calculation gives torsion-free low groups and saturated middle cokernel. The adic finiteness input is an explicit SF.2 request. |
| `EDC.4/ample-divisor-weak-lefschetz` | verified | Stacks Tag 0EKE, Lemma 44.18, p.106 supplies the affine complement under properness. Actual line/section/zero-scheme and Veronese bridges are requested, not assumed supplied by native Proj alone. |
| `EDC.4/complete-intersection-cohomology` | verified | Successive weak Lefschetz and duality identify low hyperplane powers and high dual generators. The degree-unit splitting and mod-two conic test exclude a false integral basis. |
| `EDC.4/projective-bundle-decomposition` | verified | Milne 23.2, pp.139–140 and the EDC.3 supplier justify actual cup-power columns, the line convention and plus-sign Chern relation. Integration zeros and Frobenius twists match. |
| `EDC.4/blowup-direct-images` | verified | Milne 33.2, pp.193–194, proper base change and the supplied exceptional self-intersection identify the specified unit/Gysin isomorphism, with minus-zeta exceptional restrictions. |
| `EDC.4/blowup-formula` | verified | The actual derived columns induce the ordinary and compact splits; proper trace retracts the unit column. All exceptional degrees and twists agree with the fibre computation. |
| `EDC.4/pencil-axis-blowup` | verified | Weil I 7.1, p.299 and Milne 33.2, pp.193–194 identify the codimension-two axis blow-up terms. The dimension gate is explicit; pencil incidence remains owned by LPV.3. |
| `EDC.4/pullback-injective-blowup-bundle` | verified | The proper bundle/blow-up splittings give ordinary, compact and closed-support retractions and the full cokernel. LTXZZ 5.11.3, p.98 supports the intended low-range application. |
| `EDC.4/vanishing-and-restriction-subspaces` | verified | Weil II §4.3, pp.222–223 and EDC.3 adjunction justify actual image/kernel submodules and orthogonality. The quadric F₂ witness correctly excludes automatic complementary summands. |
| `EDC.5/t-structure-heart-abelian` | verified | BBD 1.3.6, pp.31–32 and native AbelianSubcategory.abelian supply abelianness after admissibility. The heart predicate is not mistaken for an existing abelian instance. |
| `EDC.5/t-cohomology-functor` | verified | BBD 1.3.6–1.3.7, pp.31–33 gives heart-valued homology and detection under two-sided bounds. Canonical derived homology is compared by a natural isomorphism. |
| `EDC.5/t-exact-functor` | verified | BBD 1.3.16–1.3.17, pp.36–38 agrees with the computed aisle predicates, adjoint direction and finite limit/colimit consequences. Shift tests distinguish the two directions. |
| `EDC.5/recollement-data` | verified | BBD 1.4.3, pp.43–44 supplies the six functors, four adjunctions, fully faithful embeddings and actual localization triangles. The missing-right-adjoint test is a mathematical nonexample. |
| `EDC.5/glued-t-structure` | verified | BBD 1.4.10–1.4.13, pp.48–50 gives the glued aisles and directional exactness. Boundedness is conditional on the two supplied bounds. |
| `EDC.5/abstract-intermediate-extension` | corrected | Expanded the citation to BBD 1.4.22–1.4.26, pp.54–55 and supplied the full-faithfulness argument from the no-closed-subobject/quotient characterization; the definition alone did not support the entire API. |
| `EDC.5/perverse-t-structure` | verified | BBD 2.2.12–2.2.18, pp.71–73 and 4.0, pp.101–102 support the corrected stalk/costalk signs, closure dimensions and coefficient gates. Integral p is kept distinct from its dual tilt. |
| `EDC.5/perverse-sheaves` | corrected | The explicit cocycle and CompatibleTrivialization now satisfy BBD 3.2.4, pp.86–87 with common bounds and negative-Ext vanishing. Corrected the Hom-presheaf carrier to use completed pro-étale coefficients for O/E on every small-étale object. |
| `EDC.5/lisse-shift-is-perverse` | verified | BBD 2.2.5–2.2.6, pp.68–69 and smooth purity give arbitrary lisse L[d] in the heart. Actual lisse input and pure dimension occur in the active form. |
| `EDC.5/perverse-recollement` | verified | Both general five-term sequences for arbitrary perverse K now match BBD 1.4.19, p.52. The separate affine-open comparison is retained without imposing boundary amplitude one. |
| `EDC.5/intermediate-extension` | verified | BBD 2.1.9–2.1.11, pp.59–60 and 2.2.17, pp.72–73 justify image, strict boundary bounds and transitivity. The standard truncation formula retains its input bound and smooth boundary. |
| `EDC.5/intersection-complex` | corrected | The shifted dense-open lisse input and same-local-system shrinking are correct. Expanded Zhu A.3.1 to pp.54–55, locating its normalization display on p.55; BBD 4.3.1, p.112 supplies classification. |
| `EDC.5/simple-perverse-sheaves` | verified | BBD 4.3.1, p.112 supplies finite length and IC classification; the quotient case follows the finite scalar-torsion filtration. Closed-point Galois representations are retained over a general base. |
| `EDC.5/verdier-duality-perverse` | verified | BBD 2.2.18, p.73 and 4.0, pp.101–102 give field-coefficient p self-duality and the dimension twist for IC duals. Integral coefficients use p/p-plus instead. |
| `EDC.5/affine-perverse-artin-vanishing` | corrected | Added the direct perverse-amplitude prerequisite used for the quasi-finite direction. BBD 4.1.1–4.1.4, pp.102–103 supports the affine estimates and geometric cohomology vanishing. |
| `EDC.5/perverse-amplitude-estimates` | corrected | Added surjectivity to the smooth connected-fibre full-faithfulness claim, matching its active signature and BBD 4.2.5, pp.108–109. The four fibre bounds, finite exactness and smooth shifts are correct. |
| `EDC.5/generic-degree-concentration` | verified | BBD 4.1.5, p.104 proves generic concentration on a maximal-dimensional support component; Caraiani–Scholze after 6.1.4, p.87 is the stated application. |
| `EDC.5/semismall-pushforward-perverse` | unverifiable | The general signature is now present, but IsAdapted controls stalk cohomology only. Separate fibre-piece product charts do not establish costalk adaptation or the integral lower estimate. BBD 4.2.8, p.112 requires both restrictions and exceptional restrictions lisse; MV 4.3, pp.14–15 has stronger stratified topological geometry. The smooth-source field specialization is separately verified. |
| `EDC.5/small-map-intersection-complex` | verified | The strict boundary estimate and actual dense finite-étale square identify the small-map IC, including zero-dimensional boundary fibres, as in de Cataldo–Migliorini 4.2.4, p.56 and Yun–Zhang 7.1, p.507. It uses the separately justified smooth-source result. |
| `EDC.5/integral-perverse-torsion-pair` | verified | BBD 3.3.4, pp.99–100 gives the scalar torsion pair and dual tilt. The point torsion/free tests and both one-sided residue-reduction forms have the correct signs. |
| `EDC.6/scheme-adic-diamond-operation-comparisons-index` | verified | The exact L2/L3/L4/L6/H5 suppliers and ECD 27.1–27.4, pp.163–165 distinguish recovery from strong pullback transport. Ambient tensor/RHom inputs are now genuinely unbounded; the stronger result remains a separate gap. |
| `EDC.6/classical-and-proetale-adic-categories` | verified | Bhatt–Scholze 6.6.11, p.54 and 6.8.14–6.8.15, pp.61–62 justify normalized constructible comparison with common strata/bounds. Level reductions now have ambient codomains and actual restriction receipts. |
| `EDC.6/adic-transport-of-duality-and-classes` | verified | BBD 6.1.3–6.1.4, pp.150–153, Bhatt–Scholze 6.7, pp.55–58 and the precise SF.2 request support integral duality, trace/classes and coefficient compatibility, with geometric finiteness. |
| `EDC.6/rational-perverse-coefficient-extension` | verified | BBD 6.1.2, pp.149–150 supports finite faithful rational coefficient extension, Hom base change and IC/j-middle compatibility. The field data and rank/faithfulness tests are explicit. |
| `EDC.6/complex-analytic-comparison` | verified | SGA 4 XVI 4.1, pp.233–234 and BBD 6.1.2, pp.149–150 support finite comparison and the stable-lattice adic essential image. Analytic tensor/RHom are now ambient operations with qualified bounded restrictions. |
| `EDC.6/trace-orientation-comparison` | verified | BBD 6.1.2(B′), p.149 and the positive analytic Chern orientation identify the degree-one trace. This finite-type comparison does not claim a model-independent orientation on perfections. |
| `EDC.6/complete-intersection-betti-comparison` | verified | Milne §16, p.110 and the smooth proper family request give outside-middle and middle Betti independence. The Euler-characteristic formula remains an honestly separate gap. |
| `EDC.6/diamond-transport-of-duality` | verified | ECD 27.2–27.4, pp.163–165 gives the right-adjoint dualizing/RHom recovery exactly as typed. Full faithfulness is not used to invert an arbitrary counit; strong c-star transport remains separately requested. |
| `EDC.7/weights-and-perverse-truncation` | verified | BBD 5.4.1, pp.141–142 and the DWP.8 directional supplier give both weight criteria, shifted/twisted perverse homology and the four estimates. Purity is not replaced by singular stalkwise purity. |
| `EDC.7/ext-vanishing-weights` | verified | BBD 5.1.2.5, p.124 and 5.1.15, p.129 give the adjacent invariants/coinvariants sequence and strict weight Ext vanishing. The SF.2 constructible-Hom request is distinct from lisse Ext-one. |
| `EDC.7/mixed-perverse-weight-filtration` | verified | BBD 5.3.5–5.3.6, pp.135–136 gives the finite arithmetic weight flag, pure cokernel grades, uniqueness and strictness. Finite length and strict weight ordering are direct prerequisites. |
| `EDC.7/ic-purity` | verified | BBD 5.3.1–5.3.2, pp.134–135 gives purity of intermediate extension. The ordinary lisse weight plus dimension and the active IC normalization agree. |
| `EDC.7/geometric-semisimplicity` | verified | BBD 5.3.8, p.138 gives geometric semisimplicity after the specified base change. Arithmetic unipotence and nonzero geometric genus-one Ext tests distinguish the relevant claims. |
| `EDC.7/pure-complex-decomposition` | verified | BBD 5.4.5–5.4.6, pp.142–143 gives the full finite perverse-homology split with simultaneous vanishing outside support. The splitting is not claimed canonical or reduced to an arbitrary retract. |
| `EDC.7/proper-direct-image-decomposition` | verified | BBD 5.4.5, p.142 and directional proper-weight stability give the full semisimple geometric direct-image decomposition. Zhu 2.11, p.26 is a use on finite-type models, not an imported perfect-space theorem. |
| `EDC.7/relative-hard-lefschetz` | verified | BBD 5.4.10–5.4.15, pp.144–147 supplies the universal-hyperplane proof, smooth full faithfulness, amplitude and projective-bundle/projection-formula inputs. The chosen ample line supplies the actual twisted Chern operator. |
| `EDC.7/relative-primitive-decomposition` | verified | The primitive strings follow from the separately planned categorical split-kernel argument and relative hard Lefschetz. Primitive columns are powers of the actual eta and preserve Tate twists. |
| `EDC.7/spreading-out-to-finite-fields` | verified | BBD 6.1.8–6.1.10, pp.155–159 and 6.2.4–6.2.6, pp.162–164 justify selected good-model categories, trait squares and allowed shrinking. No equivalence of all constructible categories is asserted. |
| `EDC.7/characteristic-zero-decomposition` | corrected | Expanded the locator to include BBD 6.2.10, p.165 for relative hard Lefschetz, alongside 6.2.5, p.163 for decomposition. Complex coefficients and chosen origin specialization witnesses are explicit. |
| `EDC.8/cohomological-correspondence` | verified | Varshavsky 1.1.4–1.1.6, p.7 and Lu–Zheng 2.6, p.13 justify the adjoint orientation and proper-support mate. SupportEquiv preserves the actual u and both legs; graph and arbitrary-u tests agree. |
| `EDC.8/correspondence-pushforward` | verified | Varshavsky 1.1.6, p.7 gives the proper/Cartesian pushforward mate and functoriality. Equal outer maps are explicit when transporting a self-correspondence trace. |
| `EDC.8/correspondence-restriction` | corrected | Expanded the source locator to Varshavsky 1.1.9, p.8 and 1.5.6, p.16. Closed and complementary-open invariance orientations, reduced closed support and intersection open support are correct. |
| `EDC.8/correspondence-composition` | corrected | Lu–Zheng 2.6, p.13 and the six-operation exchange maps give the actual fibre-product composite. Associativity/unit comparisons transport u and the native projection pullback square is required. Aligned the external-product API with its active bounded receipts by stating finite-Tor hypotheses on both source and target pairs. |
| `EDC.8/correspondence-trace` | corrected | Corrected the trace construction to c^! applied to the diagonal-adjoint evaluation followed by proper base change (Varshavsky 1.2.2(b), p.9). Corrected dualizing H0 to use the same finite/completed-adic coefficient category as L, and added its supplier prerequisites. |
| `EDC.8/lefschetz-verdier-formula` | verified | Varshavsky 1.2.5–1.2.6, p.10 gives proper trace pushforward and proper clopen-component integration. Finite-Tor finite inputs and all integer cohomological degrees are retained. |
| `EDC.8/local-terms-finite-order` | corrected | Made the finite-coefficient D_ctf restriction explicit in the statement. Varshavsky Local terms 5.3–5.6 and 4.11, pp.10–11 give the normal-cone tame-order argument; HKW 5.6.2, p.61 is kept in the perfect-space transport boundary. |
| `EDC.8/similitude-reciprocal-charpoly` | verified | Weil I 2.6, p.282 and transpose/dual determinant identities give reciprocal characteristic polynomials for an arbitrary pairing similitude; nonsemisimple input is allowed. |
| `EDC.8/middle-degree-determinant` | verified | Milne 27.13, p.159 and the symmetric/alternating determinant calculation retain the even-dimensional sign and eliminate it in the alternating case. The nonsplit quadric test detects the sign. |
| `EDC.8/poincare-pairing-reciprocity-export` | verified | Pairing reciprocity degree by degree and Poincaré Betti symmetry give Delta²=q^(-d chi). Negative signs and the P¹ check agree with geometric Frobenius and E(1) conventions. |
| `EDC.6/normalized-adic-system` | verified | Bhatt–Scholze §§6.5–6.8, pp.49–62 and enhanced E4 reconstruction justify the proposed normalized carrier with ambient reduction, identity/triple coherence and uniform ordinary/Tor bounds. The nonperfect Z/ell² test rules out a bounded ambient substitute. |
| `EDC.7/perverse-weight-filtration-data` | verified | BBD 5.3.5–5.3.6, pp.135–136 supplies an actual finite filtration by subobjects with pure cokernel grades. The zero, two-weight and arithmetic-unipotent tests constrain the intended object. |
| `EDC.7/categorical-graded-lefschetz` | verified | BBD 5.4.10, p.144 motivates finite graded Tate-shifted eta data; iterates use the specified associator and kernels are native abelian kernels. The active one-string and zero-operator tests discriminate hard Lefschetz. |
| `EDC.7/categorical-primitive-decomposition` | verified | The finite primitive split follows from the hard-Lefschetz kernel/retraction argument in an abelian category, without claiming BBD 5.4.9 proves it. All summands and actual eta-power columns occur. |
| `EDC.7/geometric-origin` | verified | BBD 6.2.4, p.162 defines the least closure of simple objects under the specified operations. Origin-simple and constituent APIs agree; semisimple complexes retain full finite perverse support. |
| `EDC.7/restricted-residual-constructibility` | verified | BBD 6.1.8–6.1.10, pp.155–159 gives the residual extension-class predicate on chosen smooth strata and generators. Empty-generator and excluded-constituent tests distinguish actual restrictions from nominal labels. |
| `EDC.7/geometric-origin-pure-specialization` | verified | BBD 6.2.6–6.2.9, pp.163–164 proves pure specialization from the supplied finite origin witness, coefficient identification and good model. Purity and geometric simplicity are conclusions, not witness assumptions. |
| `EDC.5/api-t-structure-homology-zero-is-homological` | verified | BBD 1.3.6, pp.31–32: heart-valued H0 sends every distinguished triangle to an exact sequence; this is the native IsHomological property. |
| `EDC.5/api-t-structure-is-zero-of-homology-is-zero` | verified | BBD 1.3.7, pp.32–33: two-sided boundedness lets vanishing of all t-homology detect the zero object; the one-sided counterexample remains active. |
| `EDC.5/api-t-structure-is-l-e-iff-homology` | verified | BBD 1.3.7, pp.32–33: under the stated two-sided bound, aisle membership is equivalent to homology vanishing above the cutoff. |
| `EDC.5/api-functor--is-right-t-exact-comp` | verified | BBD 1.3.16–1.3.17, pp.36–38: the composite preserves the upper aisle because both functors do. |
| `EDC.5/api-functor--is-left-t-exact-comp` | verified | BBD 1.3.16–1.3.17, pp.36–38: the composite preserves the lower aisle because both functors do. |
| `EDC.5/api-functor-is-right-t-exact-iff-is-left-t-exact-of-adjunction` | verified | BBD 1.3.17, pp.37–38: the upper-aisle preservation condition on a left adjoint is equivalent to lower-aisle preservation by its right adjoint. |
| `EDC.5/api-functor-heart-functor-preserves-finite-colimits` | verified | BBD 1.3.17, pp.37–38: a right t-exact triangulated functor induces a right-exact heart functor, hence preserves finite colimits. |
| `EDC.5/api-functor-heart-functor-preserves-finite-limits` | verified | BBD 1.3.17, pp.37–38: a left t-exact triangulated functor induces a left-exact heart functor, hence preserves finite limits. |
| `EDC.5/api-recollement-triangle-lower-shriek-distinguished` | verified | BBD 1.4.3, pp.43–44: the stated lower-shriek triangle is the actual adjunction localization triangle, with distinguishedness as recollement data. |
| `EDC.5/api-recollement-triangle-upper-shriek-distinguished` | verified | BBD 1.4.3, pp.43–44: the stated upper-shriek triangle is the other actual adjunction localization triangle. |
| `EDC.5/api-recollement-upper-star-lower-shriek-eq-zero` | verified | BBD 1.4.3, pp.43–44: the vanishing composite follows from the specified adjunctions and localization, not from unidentified functors. |
| `EDC.5/api-recollement-upper-star-intermediate-extension` | corrected | Expanded to BBD 1.4.22–1.4.25, pp.54–55: exact open restriction carries the canonical image to the original heart object. |
| `EDC.5/api-recollement-intermediate-extension-no-sub-quotient` | corrected | Expanded to BBD 1.4.24–1.4.25, p.55 for the no-closed-subobject/quotient characterization; the definition alone was insufficient source support. |
| `EDC.5/api-recollement-intermediate-extension-unique` | corrected | Expanded to BBD 1.4.24–1.4.25, p.55: uniqueness retains the prescribed open restriction identification. |
| `EDC.5/api-recollement-intermediate-extension-fully-faithful` | corrected | Expanded to BBD 1.4.25, p.55: functorial images extend open maps and the no-closed-subobject/quotient property gives faithfulness and uniqueness. |
| `EDC.5/api-recollement-simple-classification` | corrected | Expanded to BBD 1.4.26, p.55 for the full simple-object classification into closed-supported and intermediate-extension cases. |
| `EDC.5/api-perverse-t-structure-le-iff` | verified | BBD 2.2.12–2.2.14, p.71 and 4.0.1, p.102: the upper aisle uses stalk vanishing strictly above minus closure dimension. |
| `EDC.5/api-perverse-t-structure-ge-iff-verdier-dual` | verified | BBD 2.2.18, p.73 and 4.0, pp.101–102: field-coefficient Verdier duality interchanges the two perverse aisles. Integral p is not included. |
| `EDC.5/api-perverse-t-structure-bounded` | verified | BBD 2.2.14–2.2.16, pp.71–72: finite constructible strata and the coefficient bounds give two-sided perverse boundedness. |
| `EDC.5/api-perverse-t-structure-glue` | verified | BBD 2.2.16, p.72: the absolute perverse t-structure agrees with gluing across the actual closed/open localization recollement. |
| `EDC.5/api-perverse-sheaf-hom-is-sheaf` | corrected | BBD 2.1.21–2.1.23, pp.64–65 and 2.2.19, p.74 give morphism descent. Its actual Hom-presheaf now uses coefficientDerivedRestriction and the correct completed adic carrier. |
| `EDC.5/api-intermediate-extension-eq-image` | verified | BBD 2.1.9, p.59 and 1.4.22, p.54: intermediate extension is the actual image of the canonical map in the abelian heart. |
| `EDC.5/api-restrict-intermediate-extension` | verified | BBD 2.1.9–2.1.11, pp.59–60: exact open restriction identifies the image with the original perverse input. |
| `EDC.5/api-intermediate-extension-stalk-bound` | verified | BBD 2.2.17, pp.72–73: the boundary stalk inequality is strict, excluding closed-supported quotients. |
| `EDC.5/api-intermediate-extension-costalk-bound` | verified | BBD 2.2.17, pp.72–73: the boundary costalk inequality is strict, excluding closed-supported subobjects. |
| `EDC.5/api-intermediate-extension-comp` | verified | BBD 2.1.11, pp.59–60: iterated intermediate extension has the same prescribed restriction and strict boundary characterization. |
| `EDC.5/api-intersection-complex-restrict` | corrected | Expanded Zhu A.3.1 to pp.54–55: IC restricts to the same lisse object shifted by dimension, rather than to the dualizing shift. |
| `EDC.5/api-intersection-complex-simple` | corrected | Expanded Zhu A.3.1 to pp.54–55; BBD 4.3.1, p.112: an irreducible dense-open lisse input gives simple IC. |
| `EDC.6/api-normalized-system-reduction` | verified | Bhatt–Scholze §6.5, pp.49–52 and enhanced E4: reduction is the specified ambient derived base change identified with its bounded level by a receipt. |
| `EDC.6/api-normalized-system-uniform-bounds` | verified | Bhatt–Scholze 6.6.11, p.54: uniform ordinary and Tor intervals are real fields of IsNormalized, not boundedness tested in an already bounded category. |
| `EDC.6/api-normalized-system-common-strata` | verified | Bhatt–Scholze 6.6.11, p.54: one finite algebraic stratification works at every level; the API exposes that common stratification. |
| `EDC.7/api-weight-filtration-unique` | verified | BBD 5.3.5, pp.135–136: weight separation identifies each filtered subobject uniquely. |
| `EDC.7/api-weight-filtration-strict` | verified | BBD 5.3.5–5.3.6, pp.135–136: morphisms of mixed perverse objects are strict for the actual subobject weight flags. |
| `EDC.7/api-graded-tate-lefschetz-eta-power-succ` | verified | BBD 5.4.10, p.144 motivates the graded operator; the successor formula is the actual eta iteration with Tate/shift coherence. |
| `EDC.7/api-graded-tate-lefschetz-primitive-kernel` | verified | The primitive object is the native kernel of the indicated eta power; its inclusion has precisely the kernel universal property in the abelian category. |
| `EDC.7/api-graded-tate-lefschetz-primitive-column-formula` | verified | The primitive columns are powers of the actual eta applied to native kernel inclusions, with specified twists; they are not arbitrary splitting maps. |
| `EDC.7/api-geometric-origin-simple` | verified | BBD 6.2.4, p.162: geometric-origin perverse inputs are simple by the inductive definition, with the zero complex handled separately. |
| `EDC.7/api-geometric-origin-constituent` | verified | BBD 6.2.4, p.162: simple perverse constituents of the specified permitted operations are in the least geometric-origin closure. |
| `EDC.7/api-restricted-by-iso` | verified | BBD 6.1.8–6.1.10, pp.155–159: actual residual restrictions and their extension-class membership are invariant under isomorphism. |
| `EDC.7/api-restricted-by-constituents` | verified | BBD 6.1.8–6.1.10, pp.155–159: the RestrictedBy condition is exactly membership of all actual residual cohomology constituents in the chosen classes. |
| `EDC.8/api-coh-corr-proper-support-map-id` | verified | Varshavsky 1.1.6, p.7: identity units/counits make the proper-support identity map preserve u, after the canonical support transport. |
| `EDC.8/api-coh-corr-proper-support-map-comp` | verified | Varshavsky 1.1.6, p.7: composition of proper-support units/counits gives the composite mate, including u and both legs. |
| `EDC.8/api-coh-corr-pushforward-morphism` | verified | Varshavsky 1.1.6, p.7: the target morphism is the actual outer-pushforward base-change mate with the correct adjunction orientation. |
| `EDC.8/api-coh-corr-pushforward-comp` | verified | Varshavsky 1.1.6, p.7: coherent outer pushforward and adjunction composition identify successive and composite pushforward, including u. |
| `EDC.8/api-coh-corr-restrict-closed-support` | corrected | Expanded to Varshavsky 1.1.9, p.8 and 1.5.6, p.16: the reduced right inverse image is the closed support and carries the actual restricted u. |
| `EDC.8/api-coh-corr-restrict-open-support` | corrected | Expanded to Varshavsky 1.1.9, p.8 and 1.5.6, p.16: both inverse images determine open support, reduced to the left inverse image by complementary invariance. |
| `EDC.8/api-coh-corr-trace-restrict-open` | verified | Varshavsky 1.2.2, p.9: evaluation, proper diagonal base change and H0 commute with support-open restriction in the corrected coefficient category. |
| `EDC.8/api-coh-corr-local-term-sum` | verified | Varshavsky 1.2.2, p.9 and proper dualizing integration: a finite clopen partition decomposes the full trace class and integration is additive. |
