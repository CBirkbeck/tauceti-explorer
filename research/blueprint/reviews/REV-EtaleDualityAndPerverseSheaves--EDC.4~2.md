# Independent review: EDC.4–EDC.8, revision 2

Job `REV-EtaleDualityAndPerverseSheaves--EDC.4~2`, [issue #7045](https://github.com/CBirkbeck/tauceti-explorer/issues/7045). Reviewer: Codex — codex-VOPIeM, 2026-10-08. The reviewer wrote neither incoming plan. The [first review](REV-EtaleDualityAndPerverseSheaves--EDC.4.md) and both planning handoffs were read.

**Verdict: needs_changes.** This independent review is finished; it is not a checkpoint. The revision fixes most first-review failures, but its unrestricted bounded tensor/RHom/reduction interfaces contradict the coefficient categories it claims to model. The perverse descent signature omits transition compatibility, and two central general targets still have different or special-case active forms. Three precise gaps now identify this work. External supplier requests and the seven inherited gaps are not, by themselves, reasons for rejection.

## Scope and counts

All 117 nodes were checked: 89 verified, 11 corrected, 17 unverifiable and zero added. All 62 incoming first-plan IDs remain. There are 46 theorem, 48 lemma, ten construction, ten definition, two comparison and one application nodes; 126 API entries; 72 required definition/construction tests plus twelve other named tests; 21 planets; eleven baseline declarations; twenty public source copies; seventeen supplier requests; ten gaps; and five planned stages. No stage is closed and every implementation status is unchecked. The node budget is 300.

Complete records a finished target-level pass. Planned records target coverage with explicit prerequisites, owner requests or named gaps; the three new gaps make the remaining local interface work explicit. Those statuses do not override the current negative review. No routine proof lemmas or exhaustive theorem variants were demanded. Each definition/construction has at least three use-driven API entries and three discriminating active examples. The reader presents every node’s statement, hypotheses, proof plan, prerequisites, source support, API, tests, uses, acceptance checks, active names and independent disposition.

## Remaining defects and mathematical witnesses

1. **Ambient coefficient operations.** `Dbc` explicitly contains bounded constructible objects without finite Tor dimension. Nevertheless `derivedTensor`, `derivedInternalHom`, `levelReduction`, and analytic analogues have universally bounded codomains. At a separably closed point let Λ=Z/ell² and M=Λ/ell. The infinite free resolution with every differential multiplication by ell is exact; tensoring with M or applying Hom(-,M) makes all differentials zero. Thus Tor_i(M,M) and Ext^i(M,M) equal M in every nonnegative degree. Their derived objects are unbounded. `HasFiniteTorAmplitude` and `AdicSystem.IsNormalized` currently test bounds using those already-bounded operations. The repair must use the existing ambient unbounded EDC.0/E1 operations, establish bounds there, and corestrict only afterwards. General-ring bounded Verdier duality also needs its coefficient restrictions. BBD 2.2.14, p.71 explicitly imposes finite Tor for bounded coefficient transition; the EDC.0 constructible/ctf supplier explicitly includes M in Dbc but excludes it from ctf. Replacing Dbc by perfect objects would destroy the promised DVR-quotient point heart. The common-category repair remains rather than a guessed rewrite.

2. **Perverse object descent.** BBD 3.2.4, pp.86–87 requires common bounds and negative-Ext vanishing for ordinary derived descent data. The SF.2 request was narrowed accordingly and the perverse proof now explains why those gates hold. The active conclusion still provides only a global P with componentwise isomorphisms. It does not require those isomorphisms to induce the datum’s supplied transitions on overlaps. Expose the transitions and cocycle data and state that compatibility; gluing objects with arbitrary component identifications is a weaker assertion. The Hom-sheaf API is separately verified.

3. **General named signatures.** The planned recollement target is the pair of general five-term sequences for a perverse K in BBD 1.4.19, pp.51–53. `perverse_recollement_five_term` instead gives the affine-open comparison of pj!A and pj*A. The general semismall target acts on adapted-stratification perverse inputs; `semismall_pushforward_perverse` handles only smooth-source constant field coefficients. The latter special case is useful, but it does not represent the named general theorem. The étale proof now names compact-support localization and the 2dim bound on locally closed fibre strata. MV 4.3, pp.14–15 is a complex-topological source, so the scheme version is explicitly a derived argument. Missing optional local-system variants of the small-map prototype and bundled routine Ext/triangle variants of the abelian-heart theorem are not additional rejection grounds.

## Corrections made in this review

- Narrowed the finite `PerverseContext` branch to finite fields, while retaining the separate DVR-quotient branch. This agrees with the reader and excludes arbitrary finite nongorenstein rings.
- Added native `fiberProduct_isPullback` for the chosen projection maps. An abstract support-object isomorphism alone did not identify the actual correspondence legs. The SF.0 request and common convention now retain that universal property.
- Added active quasi-finite affine perverse t-exactness and both one-sided residue-reduction forms, using the existing native morphism and quotient types. Both new forms belong to their existing target nodes; no additional node is required.
- Restricted the derived-descent supplier request and supplied its BBD locator and conditional argument. Recorded the remaining transition-compatible signature gap.
- Corrected the general-field simple-curve example, the graph-correspondence L/M orientation, and equal outer maps in self-correspondence trace pushforward. Added the zero-dimensional boundary-fibre step to the small-map proof.
- Replaced the primitive-decomposition citation of BBD 5.4.9 with an explicit split-kernel argument from hard Lefschetz (5.4.10, p.144). The former theorem is local invariant cycles. Added finite-length and strict-weight Ext dependencies for the weight-flag constructor’s existence claim.
- Replaced the relative-Lefschetz fibrewise proof sketch with universal hyperplanes, smooth full faithfulness, amplitude, the arbitrary-K projective-bundle formula and geometric semisimplicity (BBD 5.4.11–5.4.15, pp.145–147). Added the direct dependencies and projection-formula request; removed the unsupported absolute-HL proof dependencies without changing DWP.9’s ownership.
- Corrected the Hochschild–Serre attribution to BBD 5.1.2.5, p.124 and the adjacent invariants/coinvariants in the Ext argument. Added the precise constructible-derived SF.2 request; the lisse-only DWP.8 Ext node does not provide that input.
- Corrected SGA 4 XIV Corollaire 3.2 to printed p.160 and expanded source-reading ranges where proof pages were actually checked. Updated all eleven baseline receipts and clarified positive homogeneous degree and abelian-subcategory hypotheses.
- Replaced the current review object with all 117 independent records, synchronized the reader, added three precise gaps and their coverage entries, and corrected introductory claims about exact imported signatures. Historical review/report and both earlier planning handoffs were left unchanged.

The packet node fields changed in this review are listed below. The added native pullback interface is a supplier constraint; it does not introduce a duplicate geometry node. No nodes or baseline citations were removed.

- `EtaleDualityAndPerverseSheaves:EDC.4/affine-vanishing-hypercohomology`
- `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaves`
- `EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves`
- `EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing`
- `EtaleDualityAndPerverseSheaves:EDC.5/semismall-pushforward-perverse`
- `EtaleDualityAndPerverseSheaves:EDC.5/small-map-intersection-complex`
- `EtaleDualityAndPerverseSheaves:EDC.5/integral-perverse-torsion-pair`
- `EtaleDualityAndPerverseSheaves:EDC.7/ext-vanishing-weights`
- `EtaleDualityAndPerverseSheaves:EDC.7/relative-hard-lefschetz`
- `EtaleDualityAndPerverseSheaves:EDC.8/cohomological-correspondence`
- `EtaleDualityAndPerverseSheaves:EDC.8/lefschetz-verdier-formula`
- `EtaleDualityAndPerverseSheaves:EDC.7/perverse-weight-filtration-data`
- `EtaleDualityAndPerverseSheaves:EDC.7/categorical-primitive-decomposition`

## Disposition of the first review

Every historical node appears in the current table below. The seven explicitly listed signature demands of the first report have these dispositions.

| First-review demand | Current disposition |
| --- | --- |
| Common geometric base and genuine coefficients | Native finite-type separated Over(Spec k), complete DVR/fraction-field data and BBD base conditions are present. The finite branch was corrected here; ambient bounded operations remain the new defect above. |
| Actual shifted lisse IC input and geometric map data | Present, including same-local-system shrinking, finite-birational extension data and dense generic finite-étale square. |
| Chosen relative polarization, Chern operator, twists and actual primitive kernels | Present; the relative proof closure and primitive source were corrected here. |
| Simultaneous full decomposition, semisimplicity and finite strict weight flag | Present. Added direct finite-length/Ext inputs for the flag constructor. |
| Correspondence u under canonical support equivalence; arbitrary stalk action | Present in SupportEquiv, composition, pushforward and the fixed-point test. Added the native projection universal property. |
| Proper local-term integration, scheme automorphism order and geometric Frobenius | Present. Their finite-Tor predicate still needs the ambient-operation correction. |
| Active counterexamples, natural homology comparison and genuine missing-adjoint test | Present, including quadric non-splitting, skyscraper truncation, canonical heart/homology isomorphism and the missing-adjoint recollement counterexample. |

The earlier mathematical corrections were also checked: integral high complete-intersection generators and degree-unit splitting; specified blow-up columns with negative exceptional restriction; two-sided t-cohomology detection; strict IC boundary characterization; Rc-star recovery rather than strong c-star duality; stable-lattice rational analytic image; geometric rather than arithmetic finiteness/semisimplicity; restricted specialization; simple geometric origin; tame local terms rather than contraction; and Delta²=q^(-dχ). These repairs are retained. The general recollement and semismall signature claims in the revision handoff are too strong, as explained above.

## Pinned baseline, audit and supplier closure

All eleven baseline declarations and their surrounding assumptions were independently read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The Tau Ceti pin remains `f790474821cf4256814db967cb154e7af3d0c369`. No Tau Ceti declaration is cited or imported. The available shared build has the exact Mathlib revision but another Tau Ceti head; the latter contributes no imports to this file. No citation was removed or renamed.

| Declaration at the pin | Contribution and limit |
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

The reviewed `data/library-coverage.json` entries for EDC.0–EDC.8 were checked. EDC.4 and EDC.6–EDC.8 target theories are absent; EDC.5 has partial native t-structure foundations. The heart theorem still needs admissibility, so planning it does not duplicate the existing heart predicate. EDC.0/E1 supply the unbounded operations; their scope is what the bounded stand-ins must respect. EDC.3 supplies the existing finite-coefficient Chern/Gysin/projective-bundle theory; EDC.4 adds its refinements and integral/rational uses. Nearby upstream AdicSpaces and AnalyticToricGeometry documents were read for density and ownership; neither was edited.

All 58 fine supplier statements in the incoming dependency inventory were inspected (all 55 still referenced after corrections are included), including their coefficient and geometry gates. Their identifiers are recorded below as the inspection inventory. L2/L3 recovery, L4 proper geometry and L6 constructible comparisons are not interchangeable; H5 provides the owned Huber statement without a fresh book reading. E4 reconstruction supplies coherent enhanced systems and does not prove the bounded constructible restriction. DWP.8 supplies directional weights; DWP.9 supplies the absolute/vector-space theory rather than categorical primitive kernels. The revised local graph is acyclic, and added direct edges express the specific proof inputs.

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
- `DeligneWeightsAndPurity:DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4`
- `DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity-theorem-3-4-1-iii`
- `DeligneWeightsAndPurity:DWP.8/mixed-complexes`
- `DeligneWeightsAndPurity:DWP.8/proper-direct-image-preserves-purity-6-2-6`
- `DeligneWeightsAndPurity:DWP.8/pure-complexes`
- `DeligneWeightsAndPurity:DWP.8/six-operations-preserve-mixedness-6-1-11`
- `DeligneWeightsAndPurity:DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5`
- `DeligneWeightsAndPurity:DWP.9/hard-lefschetz-4-1-1`
- `DeligneWeightsAndPurity:DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13`
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

The seventeen stage requests concern missing owner interfaces, including normalized constructibility, orientation, native geometry, good restricted models, origin witnesses, strong diamond duality, conditional descent and constructible Hochschild–Serre. They retain geometry, coefficient and map compatibility conditions. The graph counts do not assert that these requests are implemented.

## Handed red-team findings

| Finding | Independent disposition |
| --- | --- |
| RT-AREA-etale/3 | Correct. Scheme perversity/IC/decomposition/traces cannot supply stack consumers. The Artin/DM Part II includes GS.1, GS.3, ET.2b, Yun–Zhang/Lafforgue items, ShtukaSpecialCyclesAndHigherSiegelWeil and RamifiedGeometricClassFieldTheory. |
| RT-AREA-etale/16 | Correct. Perfect/equivariant/Braden inputs and HKW perfect local terms go to the proposed Part II. Zhu finite-model perverse/IC/decomposition remains here, and Witt-Grassmannian stalk parity goes to Satake. E14/E15 now qualify the perfect-space trace orientation. |
| RT-AREA-etale/17 | Correct. L3→EDC.6 is proposed; exact fine L3 nodes are imported. L4 and H5 already occur transitively and are not alleged missing edges. |
| RT-AREA-geomlanglands/18 | Correct. Drop EDC.4→GS1, retain EDC.5→GS1, add L1/L3→GS1, and drop VS3→GS2 correspondences/GS3 fusion. Absolute scheme perversity does not supply relative perversity or ULA. |

The original findings and their verifier records were read. These remain orchestrator proposals; no atlas edge, campaign file, other owner packet or red-team ledger was changed.

## Sources and source issues

All nineteen incoming public copies were independently fetched and their hashes matched. The twentieth copy is Zhu’s Annals version of record. The selected ranges below were read in text with surrounding arguments; BBD pp.71,112,129 and Zhu v3 p.55 were also checked as page images. Source statements are recorded in our own words. This is not a claim to have read entire books or to have compared every arXiv copy with its published version. Huber and Faltings–Chai were neither fetched nor read.

| Public copy | Selected reading | SHA-256 |
| --- | --- | --- |
| [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf) | 1.3.6–1.3.17, pp.29–38; 1.4.3–1.4.26, pp.43–55; 2.1.3–2.1.23, pp.57–65; 2.2.10–2.2.18, pp.69–73; 3.3.4 and 4.0–4.3.1, pp.98–113; 5.1.14–5.1.15, pp.128–129; 5.3.1–5.4.10, pp.134–144; 6.1.2–6.1.10, pp.149–159; 6.2.4–6.2.10, pp.162–165; 3.2.2–3.2.4, pp.86–87; 3.2.17–3.2.18, pp.95–96; 5.1.2.3–5.1.2.5, pp.123–124; 5.4.11–5.4.15, pp.145–147 | `b1e10440e13cb6bf307f74030b577e0cf5056e41b35ca56640dc2f0d2109b9e0` |
| [Deligne-WeilII-1980](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf) | 4.1.1–4.1.6, pp.217–219; 4.2.2, p.219; 4.3.1–4.3.3, pp.222–223 | `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71` |
| [Deligne-WeilI-1974](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf) | 2.3–2.6, pp.281–282; 5.1–5.8, pp.289–292; 7.1–7.3, pp.298–301 | `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5` |
| [Milne-LEC-v2.21](https://www.jmilne.org/math/CourseNotes/LEC.pdf) | 16.4 and complete-intersection discussion, pp.109–110; 23.2, pp.139–140; 27.12–27.13, pp.158–159; 33.2 and proof, pp.193–194 | `ac4f122f371d38a44c58c296b7dbf88081d89d2de2334070bff3606771c01077` |
| [SGA4-XIV](https://www.normalesup.org/~forgogozo/SGA4/14/14.pdf) | 1.1, printed p.145; 3.1–3.4 and start of §4, printed pp.159–162 (margin pagination; Corollaire 3.2 is p.160) | `491af30c246e3aedfc717e1dd957cc634c6befba469e980c4ef7e01412bb0f94` |
| [SGA4-XVI](https://www.normalesup.org/~forgogozo/SGA4/16/16.pdf) | 4.1, pp.233–234 | `d93c3cee9212b35a031559fdf2b9556f96678522791fa7ca836710fc921af96a` |
| [Stacks-Morphisms](https://stacks.math.columbia.edu/download/morphisms.pdf) | Tag 0EKE, Lemma 44.18, p.106 in the fetched PDF; Tag 01VH, p.83 in the fetched PDF | `0bebe1d93baa7e4e99cb4f36fe50c7bcb6094772b8a2f760885a492892eca75f` |
| [Varshavsky-LV-2007](https://arxiv.org/pdf/math/0505564v2) | 1.1.1–1.1.9, pp.6–8; 1.2.1–1.2.6, pp.8–10; 1.5.1–1.5.3, p.14; 1.5.6–1.5.10, p.16 | `8b4cb7ee9b1726cc998fc4d952a2542576e85ebe21e70b0f5c9f31c4682b8ac6` |
| [Varshavsky-LocalTerms-2020](https://arxiv.org/pdf/2003.06815v3) | 4.10–4.11 and 5.1–5.11, pp.10–12 | `6a2c74173b5cbd164d28eb5a7669af5102d0ecb570d108eb71969e7c10e0ed8e` |
| [Hansen-Kaletha-Weinstein-2022](https://arxiv.org/pdf/1709.06651v4) | 5.6.2 and proof context, pp.61–62 | `d37e986ef599420a8e206dc289e18965422b03ec923184737fbcead2abc0bd5c` |
| [Lu-Zheng-2022](https://arxiv.org/pdf/2005.08522v4) | 2.1–2.10, pp.11–14 | `be71f418bdc0a5524e50aff00f2105313efc4759575276e252821b721a56db98` |
| [Caraiani-Scholze-2017](https://arxiv.org/pdf/1511.02418v1) | Corollary 6.1.4 and perverse concentration discussion, pp.87–88 | `aa93df3947e57ab78b070a82d638e70c25ae2ae15aeb60346575e74fdf85b349` |
| [Mirkovic-Vilonen-2007](https://arxiv.org/pdf/math/0401222v5) | 4.3–4.4, pp.14–15 | `b3fa89de4f2aeefadaba248aba2e942a20fc0895b8a218dfcab93322b4140e21` |
| [deCataldo-Migliorini-2009](https://arxiv.org/pdf/0712.0349v2) | 4.2.1–4.2.7, pp.55–57; 4.2.2 Springer examples, pp.59–61 | `171415a41c8e6aaf90e227b4003de9611c249a88b94a93550d7500ead6996e5f` |
| [Yun-Zhang-2019](https://math.mit.edu/~zyun/GZW_ramified_published.pdf) | 5.5(3)–(4), pp.467–468; 7.1, pp.506–507 | `700e0b09f2320912b75f5a16968c5aa3f96a0ad74e3ca375aacedec7e85d296c` |
| [Liu-Tian-Xiao-Zhang-Zhu-2022](https://arxiv.org/pdf/1912.11942v3) | 5.11.3 and proof, pp.97–99 | `84dc7c8369298314bd4e7ece5a45e5e096f39bd376f08c4c489950873c46fe86` |
| [Zhu-2017](https://arxiv.org/pdf/1407.8519v3) | 2.11 and proof, pp.25–27; A.3.1–A.3.3, pp.54–56, including visual check of the IC shift in A.3.1, p.55 | `2c23e397d21e84812daec2c637e2a763eec54ef0d784748eb74e3b2093de1e5b` |
| [Bhatt-Scholze-proetale-2015](https://arxiv.org/pdf/1309.1198v2) | 5.5.1–5.5.4, p.40; 6.5.1–6.5.6, p.49; 6.6.11, 6.7.1–6.7.2, 6.8.14–6.8.15, pp.55–62 | `ae0960a28f0f25300211569cd350def057d6c0f781f635694182868e766d3c84` |
| [Scholze-ECD-2026](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf) | 27.1–27.7 with proof, pp.163–168 | `4ce3d1232a6e9e186d1a36da5cc659616569ac8dd2bb263510247c07995a26c1` |
| [Zhu-2017-published](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf) | A.1.2, p.465 (perfect-field convention); A.3.1–A.3.3, pp.478–480 | `5d50b415048f3a5ad14bccf1c8da83fc5a680fcf13b60911ca269daa474431a7` |

All five source issues have current **confirmed** independent records. E11’s reversed BBD stalk/costalk inequalities are real, but the previous degree-zero skyscraper witness did not detect them; Λ_x[1] does. E12 is the coefficient-bar misprint in BBD’s chosen section convention. E13’s IC/dualizing normalization error persists in the published Zhu p.478. E14/E15 are the already verified PAPER-ZHU-17/E26/E27: irreducibility needs geometric components, and the model trace scales under finite relative Frobenius. Their reach is the perfect-space extension; ordinary scheme trace and finite-type analytic orientation remain valid. The source-version receipt and perfect-space boundary now record this.

Official SMF metadata advertises errata/addenda in the 2018 BBD edition; those were not collated, and the issues are not called newly discovered author errata. Annals metadata and title/correction searches located no separate Zhu correction during this check; no exhaustive absence claim is made. Existing atlas verification was compared after independently reading the public locators.

## Per-node independent record

| Node | Verdict | Check or remaining defect |
| --- | --- | --- |
| `EDC.4/affine-vanishing-hypercohomology` | corrected | SGA 4 XIV 3.2 p.160 and the bounded spectral sequence give the support-sensitive total bound. Nonzero-sheaf hypothesis and genuine coefficients now appear in the active form. |
| `EDC.4/compact-support-vanishing-smooth-affine` | verified | Weil II 4.1.6 pp.218–219 and derived smooth duality give the low compact range. The integral Hom/Ext-one degrees and finite-free lisse input are correct. |
| `EDC.4/weak-lefschetz` | verified | Weil II 4.1.6 p.218 permits a singular hyperplane section. Localization on the affine complement gives the stated bijective/injective range with lisse input. |
| `EDC.4/weak-lefschetz-gysin` | verified | The smooth-section dual Gysin range, including middle surjectivity, follows from compact localization and purity; no high integral hyperplane generator is assumed. |
| `EDC.4/weak-lefschetz-integral` | verified | The universal-coefficient sequence gives the claimed torsion-free low groups and saturated middle cokernel. Its adic category is an explicit supplier request. |
| `EDC.4/ample-divisor-weak-lefschetz` | verified | Stacks Tag 0EKE p.106 supplies affineness of the section complement under properness. The actual line, section, zero scheme and Veronese bridge are requested from their owners. |
| `EDC.4/complete-intersection-cohomology` | verified | Successive weak Lefschetz and duality give low hyperplane generators and high dual generators. Degree-unit splitting and the conic mod-two diagnostic repair the earlier false integral basis. |
| `EDC.4/projective-bundle-decomposition` | verified | Milne 23.2 pp.139–140 and EDC.3 supply the specified cup-power columns. Line convention, plus-sign Chern relation, lower integration zeros and Frobenius twists agree. |
| `EDC.4/blowup-direct-images` | verified | Proper base change checks the specified unit/Gysin map on every fibre. Exceptional self-intersection gives minus zeta, matching the active columns and the normal-bundle request. |
| `EDC.4/blowup-formula` | verified | The full cohomological split is induced by the actual derived columns. The unit column has the proper trace inverse and the exceptional twists are retained. |
| `EDC.4/pencil-axis-blowup` | verified | This is the codimension-two blow-up calculation, with n≥2. Pencil incidence geometry remains LPV.3 rather than a duplicate EDC construction. |
| `EDC.4/pullback-injective-blowup-bundle` | verified | Ordinary, compact and closed-support splits use the proper bundle/blow-up retractions and all nonzero extra summands; the low-degree bound is consistent. |
| `EDC.4/vanishing-and-restriction-subspaces` | verified | Actual image/kernel submodules and Gysin adjunction give orthogonality. The quadric F₂ example correctly excludes an automatic direct sum. |
| `EDC.5/t-structure-heart-abelian` | verified | BBD 1.3.6 pp.29–30 and native AbelianSubcategory.abelian provide the route after proving admissibility. The heart definition alone is not credited with Abelian. |
| `EDC.5/t-cohomology-functor` | verified | BBD 1.3.6–1.3.17 pp.29–38 supports the heart-valued shifted functors, long exactness and two-sided bounded detection. The canonical-heart equivalence uses native derived homology. |
| `EDC.5/t-exact-functor` | verified | The computed aisle predicates, adjoint direction, composition and finite limit/colimit conclusions agree with BBD 1.3.16–1.3.17 pp.36–38. |
| `EDC.5/recollement-data` | verified | BBD 1.4.3 pp.43–44 supplies all six functors, four adjunctions, full faithfulness and actual unit/counit triangles. The missing-adjoint nonexample is discriminating. |
| `EDC.5/glued-t-structure` | verified | BBD 1.4.10–1.4.13 pp.46–49 gives the two glued aisles and directional exactness; boundedness is conditional on the input bounds. |
| `EDC.5/abstract-intermediate-extension` | verified | The actual image, restriction, no closed subobject/quotient, uniqueness and simple classification match BBD 1.4.22–1.4.26 pp.53–55. |
| `EDC.5/perverse-t-structure` | corrected | Stalk/costalk signs, closure dimensions and the BBD field finiteness convention check out against 2.2.12–2.2.17 and 4.0. Narrowed the finite-ring branch to finite fields; DVR quotients remain a separate branch. |
| `EDC.5/perverse-sheaves` | unverifiable | The point category and Hom-sheaf target are correct. Restricted the ordinary-derived supplier request using BBD 3.2.4, but the active descent conclusion still lacks compatibility with transitions; see the descent gap. |
| `EDC.5/lisse-shift-is-perverse` | verified | BBD 2.2.5–2.2.6 pp.68–69 gives L[d] on smooth pure-dimension strata. The revised active theorem handles an actual lisse input. |
| `EDC.5/perverse-recollement` | unverifiable | BBD 1.4.19 pp.51–53 gives the two planned general five-term sequences. The active affine-open pj!A→pj*A sequence is a different statement; the general named target is not yet represented. |
| `EDC.5/intermediate-extension` | verified | BBD 2.1.11 pp.59–60 and 2.2.17 pp.72–73 give image, strict boundary inequalities and transitivity. The ordinary truncation formula keeps its source bound and smooth boundary. |
| `EDC.5/intersection-complex` | verified | IC uses the same dense-open lisse object shifted by dimension, not an arbitrary perverse input. Shrinking and finite-birational comparisons retain the needed extension of the local system. |
| `EDC.5/simple-perverse-sheaves` | corrected | BBD 4.3.1 p.112 gives finite length and the full IC classification. Corrected the curve acceptance example to account for closed-point Galois representations over a general base. |
| `EDC.5/verdier-duality-perverse` | verified | BBD 2.2.18 p.73 and 4.3.1 support field-coefficient self-duality and IC duality with the dimension Tate twist. Integral p/p-plus remain separate. |
| `EDC.5/affine-perverse-artin-vanishing` | corrected | BBD 4.1.1–4.1.4 pp.102–103 supports the two directions and geometric vanishing. Added the missing active quasi-finite affine t-exactness form. |
| `EDC.5/perverse-amplitude-estimates` | verified | BBD 4.2.4–4.2.6 pp.109–111 gives all four fibre bounds, smooth shifts, connected-fibre full faithfulness and finite exactness. Native geometric fibres are used. |
| `EDC.5/generic-degree-concentration` | verified | BBD 4.1.5 p.104 gives concentration at the generic geometric point of a maximal support component, including the equality degree. |
| `EDC.5/semismall-pushforward-perverse` | unverifiable | The étale dimension argument needs proper base change and compact-support bounds on adapted strata; these are now explicit. The active form still treats only smooth-source constants, rather than the planned general stratified target. |
| `EDC.5/small-map-intersection-complex` | corrected | Smallness plus a dense finite-étale locus gives the strict boundary IC characterization, as in de Cataldo–Migliorini 4.2.4 p.56 and Yun–Zhang §7.1 p.507. Added the zero-dimensional boundary-fibre step; the main constant-input signature is present. |
| `EDC.5/integral-perverse-torsion-pair` | corrected | BBD 3.3.4 pp.99–100 supports the actual scalar torsion pair and dual tilt. Added both one-sided residue-reduction forms; rationalization from both t-structures was already active. |
| `EDC.6/scheme-adic-diamond-operation-comparisons-index` | unverifiable | Exact L2/L3/L4/L6/H5 suppliers and ECD 27.1–27.4 pp.163–165 support the recovery direction and unbounded Rc-star codomain. The bounded RHom stand-in used as input still needs the ambient-operation repair. |
| `EDC.6/classical-and-proetale-adic-categories` | unverifiable | Bhatt–Scholze 6.6.11 and 6.8.14–6.8.15 pp.55–62 supports the stated normalized constructible comparison, not a bare unrestricted inverse limit. The current all-input bounded levelReduction makes its suggested model invalid. |
| `EDC.6/adic-transport-of-duality-and-classes` | verified | BBD 6.1.3–6.1.4 pp.150–153 and the named SF.2 supplier support geometric finiteness, derived coefficient exact sequences and trace/class compatibilities in the stated integral regime. |
| `EDC.6/rational-perverse-coefficient-extension` | verified | BBD 6.1.2 p.150 supports exact finite field extension, Hom base change, IC/j-middle compatibility and faithfulness. The actual rational coefficient data are retained. |
| `EDC.6/complex-analytic-comparison` | unverifiable | SGA 4 XVI 4.1 pp.233–234, BBD 6.1.2 and Bhatt–Scholze support finite/integral comparison and rational stable-lattice essential image. Its unrestricted bounded analytic tensor/RHom forms remain invalid over quotient coefficients. |
| `EDC.6/trace-orientation-comparison` | verified | Milne 27.13 pp.158–159 and the chosen positive analytic orientation fix the degree-one trace. This finite-type comparison does not repair model-dependent perfect-space orientation. |
| `EDC.6/complete-intersection-betti-comparison` | verified | Smooth proper specialization and the connected multidegree parameter family give every outside-middle rank and the middle rank. The hypersurface Euler-characteristic formula is still an honestly recorded external gap. |
| `EDC.6/diamond-transport-of-duality` | unverifiable | The revised recovery through Rc-star agrees with ECD 27.1–27.4; strong c-star duality transport remains a separate gap. Its bounded scheme RHom input still needs the same ambient-category correction. |
| `EDC.7/weights-and-perverse-truncation` | verified | BBD 5.4.1 p.142 and DWP.8 give both perverse-cohomology criteria, shifts/twists and all four directional estimates. Purity is not replaced by singular stalkwise purity. |
| `EDC.7/ext-vanishing-weights` | corrected | Corrected the Hochschild–Serre attribution and both adjacent geometric groups using BBD 5.1.2.5 p.124 and 5.1.15 p.129. Added the precise constructible-derived supplier request; the lisse-only Ext node was insufficient. |
| `EDC.7/mixed-perverse-weight-filtration` | verified | BBD 5.3.5–5.3.6 pp.135–136 gives the finite arithmetic flag, unique pure cokernel grades and strict morphisms. Its owner construction now directly requests finite length and Ext ordering. |
| `EDC.7/ic-purity` | verified | BBD 5.3.1 pp.134–135 proves purity of the actual intermediate extension; the dimension shift and arbitrary lisse normalization agree with the active IC form. |
| `EDC.7/geometric-semisimplicity` | verified | BBD 5.3.8 p.138 gives semisimplicity after the specified geometric base change. Arithmetic unipotence and geometric elliptic Ext tests distinguish the two categories. |
| `EDC.7/pure-complex-decomposition` | verified | BBD 5.4.5 p.142 gives one simultaneous finite sum of all shifted perverse cohomology, with vanishing outside the support. The active full biproduct and semisimple summands repair the old retract-only form. |
| `EDC.7/proper-direct-image-decomposition` | verified | BBD 5.4.6 p.143 combines proper purity preservation with full geometric decomposition and semisimplicity. Projectivity is reserved for the later Chern-operator theorem. |
| `EDC.7/relative-hard-lefschetz` | corrected | Replaced the unsupported fibrewise proof sketch by BBD 5.4.11–5.4.15 pp.145–147 and added the amplitude, geometric semisimplicity, projective-bundle and projection-formula dependencies. The actual chosen Chern powers and equal weight w-r are correct. |
| `EDC.7/relative-primitive-decomposition` | verified | Actual eta kernels and primitive string columns reduce to the categorical decomposition, not DWP.9’s vector-space theorem. Twists and a full finite degreewise split are represented. |
| `EDC.7/spreading-out-to-finite-fields` | verified | BBD 6.1.8–6.1.10 pp.155–159 supplies selected residual extension categories and genuine trait squares. The revised request keeps generator Ext/base-change and Rqj-star closure gates rather than asserting all-category equivalence. |
| `EDC.7/characteristic-zero-decomposition` | verified | BBD 6.2.4–6.2.10 pp.162–165 supports the chosen complex/Qbar-ell geometric-origin theorem via pure arithmetic specialization. Full decomposition and chosen-class relative Lefschetz are present; broader coefficient descent remains a gap. |
| `EDC.8/cohomological-correspondence` | corrected | Lu–Zheng 2.6 p.13 and Varshavsky 1.1.4 p.7 fix the adjoint convention. Corrected the graph example; SupportEquiv and proper-support maps retain the actual u. |
| `EDC.8/correspondence-pushforward` | verified | Varshavsky 1.1.6 pp.7–8 gives the three admissibility alternatives and the exchange/adjunction composite. Revised identity/composition compare the actual morphism after coefficient transports. |
| `EDC.8/correspondence-restriction` | verified | Varshavsky 1.1.6–1.1.8 pp.8–9 gives the invariant directions, reduced closed support and complementary open support. The fixed-point endomorphism is arbitrary, not only identity. |
| `EDC.8/correspondence-composition` | unverifiable | The specified fibre-product mate and u-sensitive coherence are correct in the ambient formalism; added a native IsPullback constraint on its projections. The unrestricted bounded external tensor product still prevents acceptance of the active model. |
| `EDC.8/correspondence-trace` | unverifiable | Varshavsky 1.2.1–1.2.4 pp.9–10 supports the evaluation/Künneth trace and proper component integration. H-zero uses the unbounded dualizing object, but input tensor/RHom and the finite-Tor predicate still use the invalid bounded stand-ins. |
| `EDC.8/lefschetz-verdier-formula` | unverifiable | Varshavsky 1.2.5–1.2.6 p.10 gives trace-class pushforward and the numerical formula. Corrected the two outer maps to be equal; the active finite-Tor predicate still requires the ambient-category repair. |
| `EDC.8/local-terms-finite-order` | unverifiable | Varshavsky local-terms Corollaries 4.10–4.11 p.10 gives equality with the arbitrary stalk endomorphism trace for isolated fixed components. Actual scheme order is now correct; its finite-Tor input remains the defective predicate. |
| `EDC.8/similitude-reciprocal-charpoly` | verified | Weil II 4.3.2 pp.222–223 gives reciprocal eigenvalues. The active determinant polynomial and generalized multiplicities do not assume semisimplicity; native transpose/determinant identities suffice. |
| `EDC.8/middle-degree-determinant` | verified | Weil II 4.3.2–4.3.3 pp.222–223 and symplectic linear algebra give the symmetric sign and alternating determinant. Generalized eigenspaces and the characteristic assumptions are retained. |
| `EDC.8/poincare-pairing-reciprocity-export` | verified | Weil II 4.3.1–4.3.3 pp.222–223 gives actual geometric Frobenius similitude and the determinant export. The exponent in Delta² is -dχ, and the active geometric base change is explicit. |
| `EDC.6/normalized-adic-system` | unverifiable | Uniform ordinary/Tor bounds and common finite strata are the correct extra conditions beyond E4 reconstruction. The current derived reduction and Tor tests are defined through already-bounded operations; their model is not verified. |
| `EDC.7/perverse-weight-filtration-data` | corrected | The actual Subobject flag and cokernel grades are appropriate. Added finite length and strict-order Ext dependencies for the constructor’s non-routine existence claim; BBD 5.3.5 p.136 supplies it. |
| `EDC.7/categorical-graded-lefschetz` | verified | The actual graded objects, Tate powers, hard-Lefschetz isomorphism predicate, primitive kernels and cup-power columns have coherent sources/targets. Boundedness is part of the data. |
| `EDC.7/categorical-primitive-decomposition` | corrected | Corrected the false BBD 5.4.9 attribution to a formal deduction from 5.4.10 p.144. Recorded the explicit split-kernel argument and bounded iteration producing the specified full columns. |
| `EDC.7/geometric-origin` | verified | BBD 6.2.4–6.2.5 pp.162–163 supports simple constituents and the closure operations. Arbitrary constituents are not silently declared simple; semisimple-origin complexes use finite perverse constituents. |
| `EDC.7/restricted-residual-constructibility` | verified | BBD 6.1.3–6.1.4 and 6.1.8–6.1.10 pp.150–159 supports selected residual extension classes and the Rqj-star closure gate. Actual generators, reductions and trait maps are retained. |
| `EDC.7/geometric-origin-pure-specialization` | verified | BBD 6.2.6–6.2.9 pp.163–164 gives a separate pure, geometrically simple arithmetic specialization. The spread witness does not assume its purity conclusion and uses the stated chosen coefficient identification. |
| `EDC.5/api-t-structure-homology-zero-is-homological` | verified | The truncation construction sends each distinguished triangle to the actual heart-valued exact sequence (BBD 1.3.6). |
| `EDC.5/api-t-structure-is-zero-of-homology-is-zero` | verified | Two-sided boundedness excludes degenerate invisible objects; successive truncation triangles prove zero detection. |
| `EDC.5/api-t-structure-is-l-e-iff-homology` | verified | Under the stated boundedness, high heart cohomology detects the upper aisle; the one-sided-bound nonexample is valid. |
| `EDC.5/api-functor--is-right-t-exact-comp` | verified | Composition preserves the computed upper-aisle condition by applying it twice. |
| `EDC.5/api-functor--is-left-t-exact-comp` | verified | Composition preserves the computed lower-aisle condition by applying it twice. |
| `EDC.5/api-functor-is-right-t-exact-iff-is-left-t-exact-of-adjunction` | verified | Adjunction and aisle orthogonality give the stated opposing exactness directions. |
| `EDC.5/api-functor-heart-functor-preserves-finite-colimits` | verified | The induced heart functor from the stated right-exact input preserves finite cokernels and coproducts, with the native assumptions retained. |
| `EDC.5/api-functor-heart-functor-preserves-finite-limits` | verified | The induced heart functor from the stated left-exact input preserves finite kernels and products, with the native assumptions retained. |
| `EDC.5/api-recollement-triangle-lower-shriek-distinguished` | verified | This is the actual counit/unit localization triangle included in Recollement, not an arbitrary triangle. |
| `EDC.5/api-recollement-triangle-upper-shriek-distinguished` | verified | The second adjunction triangle is actual and distinguished by the recollement data. |
| `EDC.5/api-recollement-upper-star-lower-shriek-eq-zero` | verified | The closed pullback of open extension by zero vanishes by the localization identities. |
| `EDC.5/api-recollement-upper-star-intermediate-extension` | verified | Exact open restriction sends the defining image to the input; full faithfulness gives the canonical isomorphism. |
| `EDC.5/api-recollement-intermediate-extension-no-sub-quotient` | verified | The image lies between the open shriek/star extensions and has neither a closed subobject nor closed quotient. |
| `EDC.5/api-recollement-intermediate-extension-unique` | verified | The no-closed-subobject/quotient characterization forces the two extension maps to be isomorphisms. |
| `EDC.5/api-recollement-intermediate-extension-fully-faithful` | verified | Open restriction and the no-closed-subquotient property identify Hom, giving full faithfulness. |
| `EDC.5/api-recollement-simple-classification` | verified | BBD 1.4.26 separates closed simple images from open simple intermediate extensions; the actual object isomorphisms are present. |
| `EDC.5/api-perverse-t-structure-le-iff` | verified | The computed native geometric-stalk cutoff has the correct greater-than vanishing sign. |
| `EDC.5/api-perverse-t-structure-ge-iff-verdier-dual` | verified | The dual reformulation is restricted to field coefficients; it does not incorrectly identify integral p with its dual. |
| `EDC.5/api-perverse-t-structure-bounded` | verified | Finite ordinary amplitude and finite-dimensional support give both perverse bounds. |
| `EDC.5/api-perverse-t-structure-glue` | verified | The stalk/costalk construction satisfies the actual closed/open glued-aisle characterizations. |
| `EDC.5/api-perverse-sheaf-hom-is-sheaf` | verified | Negative Ext between local perverse objects makes the actual étale Hom presheaf a sheaf; object effectivity is a separate remaining issue. |
| `EDC.5/api-intermediate-extension-eq-image` | verified | The active map is the actual perverse j!→j* comparison, whose native image defines j-middle. |
| `EDC.5/api-restrict-intermediate-extension` | verified | Open restriction of that image is canonically the original perverse object. |
| `EDC.5/api-intermediate-extension-stalk-bound` | verified | No closed quotient gives strict upper boundary stalk inequality. |
| `EDC.5/api-intermediate-extension-costalk-bound` | verified | No closed subobject gives strict lower boundary costalk inequality. |
| `EDC.5/api-intermediate-extension-comp` | verified | The unique no-boundary-subquotient extension commutes with successive locally closed extensions. |
| `EDC.5/api-intersection-complex-restrict` | verified | The restriction is the same lisse object L[d], including its actual shift. |
| `EDC.5/api-intersection-complex-simple` | verified | An irreducible lisse object has a simple intermediate extension by the BBD simple-object classification. |
| `EDC.6/api-normalized-system-reduction` | unverifiable | The mathematical reduction comparison is right, but the levelReduction stand-in assumes bounded output for all inputs; repair it in the ambient category. |
| `EDC.6/api-normalized-system-uniform-bounds` | unverifiable | The claimed Tor bound is currently tested after a universally bounded tensor stand-in, so the active predicate does not encode the needed ambient Tor condition. |
| `EDC.6/api-normalized-system-common-strata` | unverifiable | The intended common-stratum condition is explicit, but this lemma’s NormalizedSystem carrier still depends on the invalid reduction/Tor model. |
| `EDC.7/api-weight-filtration-unique` | verified | Strict-order Hom vanishing forces equality of the finite pure-graded Subobject flags (BBD 5.3.5). |
| `EDC.7/api-weight-filtration-strict` | verified | Applying weight ordering to image and cokernel identifies the image/intersection flags for any morphism (BBD 5.3.6). |
| `EDC.7/api-graded-tate-lefschetz-eta-power-succ` | verified | The eta recursion agrees with the actual shift-and-Tate composition of the specified graded operator. |
| `EDC.7/api-graded-tate-lefschetz-primitive-kernel` | verified | The primitive object is the native kernel of eta^(r+1), including its actual inclusion. |
| `EDC.7/api-graded-tate-lefschetz-primitive-column-formula` | verified | Each string column is eta^a after that kernel inclusion with the correct Tate twist. |
| `EDC.7/api-geometric-origin-simple` | verified | The GeometricOrigin constructor retains simplicity, rather than permitting arbitrary origin objects to be called simple. |
| `EDC.7/api-geometric-origin-constituent` | verified | The closure operation extracts an actual simple constituent through subobject/quotient data (BBD 6.2.4). |
| `EDC.7/api-restricted-by-iso` | verified | Residual membership is invariant under an actual isomorphism because reductions preserve it. |
| `EDC.7/api-restricted-by-constituents` | verified | The selected extension-closed residual category contains the actual simple constituents after finite-level reduction. |
| `EDC.8/api-coh-corr-proper-support-map-id` | verified | Unit/counit identities make the actual proper-support map preserve u under the identity. |
| `EDC.8/api-coh-corr-proper-support-map-comp` | verified | Adjunction pseudofunctor coherence compares the actual u after composable proper support maps. |
| `EDC.8/api-coh-corr-pushforward-morphism` | verified | The active formula records the exchange/adjunction composite, rather than only identifying the support. |
| `EDC.8/api-coh-corr-pushforward-comp` | verified | The active SupportEquiv includes equality of transported u for two successive pushforwards. |
| `EDC.8/api-coh-corr-restrict-closed-support` | verified | The reduced closed support uses the correct preimage and invariant containment direction. |
| `EDC.8/api-coh-corr-restrict-open-support` | verified | The complementary open restriction is the actual support open after removing the source boundary. |
| `EDC.8/api-coh-corr-trace-restrict-open` | unverifiable | Open trace restriction is correct in the source formalism, but the current trace construction still depends on the invalid bounded tensor/RHom model. |
| `EDC.8/api-coh-corr-local-term-sum` | unverifiable | Linearity and proper integration give finite additivity mathematically; the active trace domain still uses the defective finite-Tor predicate. |

## Validation and questions for the orchestrator

`python3 scripts/check_blueprint.py research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.4.json` reports zero errors and zero warnings. The final suggested file elaborates through `lean-check` at the pinned Mathlib: exit zero, 576 declaration-uses-sorry warnings, no errors and no other warnings. Available memory was 111 GB before that single run. No language server, library build/update or cache download was used, and no compile remains running. Elaboration checks typing; the negative mathematical verdict is unchanged.

Suggested-file SHA-256: `e16fc3eb1a886696ae1993df760890af226aa50e0178d6d02ac49b6d188f2b04`. The final consistency audit and whitespace check are recorded in the handoff. The permitted changes are the packet, suggested file, reader, this report and this job’s handoff. No atlas promotion or modifications to historical reports were made.

The next revision should use the existing unbounded supplier interfaces for tensor/RHom/reduction and their genuine bounded restrictions, expose compatible descent data, and supply the general recollement/semismall forms. The maintainer can retain complete/planned target coverage with these named gaps while requiring these contradictions to be fixed before acceptance. Ownership of the additional ambient restriction interface stays with EDC.0/E1/SF.2; it should not become a second derived-category theory here. The four handed restructuring proposals can be applied by the orchestrator under its own workflow once accepted; this review does not implement them.
