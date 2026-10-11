# PerfectoidSpaces final read — part 2

Snapshot reviewed: `/tmp/perfectoid-finalread-part2/README.md` (14,452 lines) and `Suggested.lean` (27,192 lines), copied before the review. All line numbers below refer to that snapshot unless explicitly marked as current sibling lines; locate repairs by declaration name.

Read README **8871–14452** (P4–P7, Downstream consumers and References), and supplier/ownership ranges **340–428, 455–488, 570–622, 643–659, 692–712**. Read Lean **13500–24160** in file order, with scoped declarations at **8444–8452, 25380–25406, 25672–25681, 26509–26515, 26565–26658, 27023–27037, 27169–27192** and their enclosing contexts. This covers **1,595 declaration commands: 518 theorems, 303 definitions, 50 abbreviations, 26 structures, 55 instances and 643 examples**. Supporting reads included the concrete residue/field and normed-colimit constructions at **26138–26460**, P2 analytic-pullback comparisons, and the current sibling declarations used below; these supporting declarations are not added to the scoped count.

The instances used include completed Q_p(p^(1/p^∞)) and its characteristic-p tilt; completed F_p((t^(1/p^∞))); Q_p and its nonperfectoid closed disc; proper rank-two plus rings; the empty space; zero rings/modules; singleton covers and constant diagrams; finite split and quadratic Galois covers; uncompleted filtered unions; and identity and relative Frobenius. Counts below assign one primary class to each finding. `IsLimit`/`IsColimit` proof witnesses themselves are not treated as unpinned data.

## Findings

| # | Lean line | Lean name | class (a)–(j) | Defect and concrete instance | Exact repair |
| --- | --- | --- | --- | --- | --- |
| 1 | 19706–19817 | `PerfectoidSpace.ScholzeAffinoidTower.isAffinoidProEtale_scholze2013` | (g) | P6.14 promises a comparison starting with U and V in the supplied classical ProEtaleSite (README 12278–12311), but neither that carrier nor its presentations occur in this theorem: completed perfectoid B j and an already étale diagram E are hypotheses. For a classical affinoid-perfectoid U and a finite-stage rational V, the missing step is precisely constructing the completed presentation and identifying the classical pullback; the theorem cannot be applied until that step has been supplied separately. | Add the realization/completion construction on the actual AdicEtaleGeometry.AdicSpace.ProEtaleSite affinoid presentations, its finite-stage rational/finite-étale pullback comparisons, and the comparison of the classical cofiltered pro-object with its completion, including morphisms. Keep the present completed-diagram theorem as a corollary; do not delete or narrow the classical target. |
| 2 | 17395–17409 | `Perfectoid.completedColimit_test_not_injective / completedColimit_proper_plus (anonymous examples); README 10820` | (a) | The shrinking-disc sentence still identifies the limit as Spa(K,K⁺), although its displayed stages have maximal plus ring O_K. For the rank-two field obtained from the completed perfection of F_p(x)((t)) with the residual x-adic refinement, the origin is Spa(K,K°), a singleton, whereas Spa(K,K⁺) has two points; the Lean examples already use the correct rank-one pair. | Replace Spa(K,K⁺) by Spa(K,K°) in README 10820, and explicitly retain the proper-plus-ring negative Check already at Lean 17404–17409. |
| 3 | 23411–23503 | `PerfectoidSpace.residueEtaleCohomologyDiagram / residueEtaleCohomologyCocone; *_map` | (c) | The Ext formulas quantify over an arbitrary natural coefficient comparison e and an arbitrary constant-Z isomorphism z; neither is normalized to the adjunction comparisons or to 1. Negating every cocone leg and replacing its z by −z preserves the cocone, colimit and all listed Checks, but for a constant geometric point, constant Z coefficients and degree zero sends 1 to −1 instead of the canonical pullback 1. | Choose coherent adjunction/composition comparisons, specify the constant-sheaf comparison by its value on 1, and use those fixed comparisons in the Ext formulas. Add a degree-zero equation for the actual cocone leg under Sheaf.H.equiv₀, including the constant one-point Z example. |
| 4 | 14082–14113 | `PerfectoidSpace.residueField_chart / residueField_chart_spec` | (c) | The chart isomorphism is constrained only by continuity and its plus ring, with no equation connecting it to residueFieldPoint or to the chart residue map. On Spa(K,K°) for K = F_p((t^(1/p^∞))) completed, composing the chart comparison with Frobenius changes t to t^p while preserving every stated condition. | Add the equation identifying pullback along residueFieldPoint, followed by residueField_chart, with the supplied chart residueMap on every ring element, and compatibility under chart restriction. Test the distinguished t, not only the underlying point or the plus ring. |
| 5 | 15141–15164 | `PerfectoidSpace.sumPullbackEquiv / sumPullbackEquiv_coordinates` | (c) | The two point-coordinate equations do not determine a point of an adic fibre product. Take K = completed F_3((t^(1/3^∞))), L its unramified quadratic extension, and Y = Z = Spa(L,L°) over Spa(K,K°): swapping the two points of the (1,2) fibre-product summand preserves both equations and the diagonal-image Check, but changes the claimed comparison. | Define the comparison from the categorical distributivity isomorphism and specify its inverse on the canonical morphism from each of the four pullbacks into the total pullback. Check one point in the off-diagonal quadratic-Galois summand. |
| 6 | 13778–13793 | `PerfectoidSpace.AffinoidField.valuationEquiv` | (c) | The equivalence never says that its valuation subring consists of the elements whose value at the input point is at most 1; closedPoint_spec and isOpen_iff pin only the topology and closed endpoint. For a Hahn residual valuation with value group the lexicographic direct sum of Q indexed by Q, shifting the indices permutes the coarsenings homeomorphically, fixes both endpoints, and gives a different equivalence satisfying these rules. | Add, for every point x and a : K, a membership iff between the output valuation subring and the supplied valuation relation at x (a ≤_x 1). Include a proper residual coarsening whose membership of a chosen Hahn monomial distinguishes it from the shifted coarsening. |
| 7 | 16683–16698; 16943–16961; 17146–17160; 23677–23692 | `CategoryTheory.FilteredTwoColimit.reindex / fullSubdiagram; CategoryTheory.fpModuleDiagram; PerfectoidSpace.affinoidFiniteEtaleDiagram` | (c) | The object and arrow functors are specified but mapId and mapComp are admitted with no equations tying them to restriction or scalar-extension coherence. For a one-object constant diagram of rational modules, multiplying the unit and composition isomorphisms by −1 gives another coherent pseudofunctor; for finite étale F_p-algebras the analogous natural Frobenius twist is detected on F_(p²), while the zero and split-pair Checks miss it. | Specify reindex/fullSubdiagram coherence as the transported coherence of F, and scalar-extension coherence by the tensor unit/associator formulas on pure tensors. Add the corresponding mapId/mapComp equations and a two-step generator Check; do not replace the pseudofunctors by their object assignments. |
| 8 | 16965–16970 | `CategoryTheory.FilteredTwoColimit.fullSubcategory` | (c) | This is a bare equivalence, without a formula on tagged objects, common-stage arrows, or a comparison with the inclusion into FilteredTwoColimit F. With a one-stage constant discrete Bool category and P = True, swapping false and true satisfies its type and the listed empty/whole/singleton tests. | Specify the functor on each tagged object and each common-stage morphism representative, or give the inclusion triangle with a coherent stagewise natural isomorphism. Add the Bool test that fixes false and true individually. |
| 9 | 18354–18358 | `PerfectoidSpace.ProEtaleOver.sliceEquivalence / AffinoidProEtale.sliceEquivalence` | (c) | Both declarations are arbitrary equivalences; no object, morphism, or forgetful-functor equation identifies slicing with composition of structural maps. For Y = X × Bool over an affinoid geometric point X, composing with pullback along the component swap changes the structural map of the component-zero object and still has the stated type. | Give the composition functor explicitly and pin its inverse by the induced map to Y, with natural isomorphisms commuting with the appropriate Over forgetful functors. Test the inclusion of component zero into Y. |
| 10 | 18447–18457; 18500–18505 | `PerfectoidSpace.prodProfinite.baseChange / tilt; fibreProdProfinite.baseChange` | (c) | Only the perfectoid-space projection is fixed; the S-coordinate is absent from all three comparison specifications. With S = Bool, postcomposing by the component swap preserves every displayed fst equation; the relative example is already obtained with S₀ a singleton. | Add the snd equation after base change, using pullback.snd, and the snd equation after tilt using the supplied tilting homeomorphism. Require both coordinates for the relative comparison and check the false component explicitly. |
| 11 | 18460–18468 | `PerfectoidSpace.prodProfinite.sectionsEquiv / plusEquiv` | (c) | sectionsEquiv is checked only on constant sections and plusEquiv has no evaluation equation. Reindexing C(Bool,K) and C(Bool,K⁺) by the component swap preserves constants and the current finite/empty/continuous-function tests, but takes the component-zero indicator to the component-one indicator. | For every s, identify evaluation of each comparison with global pullback along prodProfinite.pointSection s followed by the affinoid sections/plus comparison; make the two equivalences commute with plus inclusions. Add the actual indicator evaluation (1,0), including its integral version. |
| 12 | 19381–19426 | `PerfectoidSpace.geometricPointProfiniteEquivalence / geometricPointFiniteEquivalence and *_obj` | (c) | The objectwise Over isomorphisms are not natural in the profinite/finite set and no map equation is stated. Conjugating the functor on its two-point object by the swap leaves all three empty/singleton/pair Checks intact, while the singleton-to-component-zero map becomes the component-one map under the displayed object identifications. | Package *_obj as a natural isomorphism to the explicit product functor with maps prodProfinite.map, and add its naturality equation. Compute the singleton inclusion into the two-element set, not just the isomorphism type of that set. |
| 13 | 23203–23259 | `PerfectoidSpace.residueEtaleComparison / residueEtaleComparison_spec` | (c) | The specification gives a separately existential cartesian projection for each stage object, without naturality in the étale object or coherence between stages. Already for the constant geometric-point diagram, conjugating the comparison on a split two-sheeted cover preserves equivalence, finite objects, covering families and the equality-detection Check, while exchanging its two sections. | Choose the stage projections, prove their naturality on every finite-stage morphism, and prove their coherence with ιCompIso across transitions; equivalently construct the comparison using a specified coherent cocone and desc. Test the two distinguished sections of the split cover. |
| 14 | 23737–23746 | `PerfectoidSpace.GoodAffinoid.finiteEtaleEquiv` | (c) | The purported canonical scalar-extension inverse is specified only by existence of an object isomorphism separately for every B. For a constant good chart and B = K × K, conjugating the inverse equivalence at B by the factor swap preserves the whole conclusion but changes the two algebra projections under the unconnected comparisons. | Replace the family of objectwise Nonempty isomorphisms by stagewise natural isomorphisms to scalar extension, with transition coherence fixed on tensor generators. Add the component projections of K × K as a morphism Check. |
| 15 | 23854–23873 | `PerfectoidSites.vPrecoverage / vTopology; current DiamondsAndVStacks.Perfd.vPrecoverage / vTopology` | (d) | The current consumer still defines the same arbitrary-space-functor precoverage and its generated topology at DiamondsAndVStacks/Suggested.lean 4085 and 4155, even though README 14397–14401 calls these shared P7 inputs. The families, compact-open condition, universes and generated-topology construction coincide, including the empty-space and nonempty-point instances. | Keep the shared definition upstream in PerfectoidSpaces and replace the Diamonds definitions by abbreviations/exports of it, adjusting its supplier row. Do not create another shared definition in PerfectoidTowers. |
| 16 | 17921–17931 | `proFlatten_obj` | (d) | The named target is exactly the pair of generic Mathlib adjunction triangle identities; the proof directly invokes Adjunction.left_triangle_components and right_triangle_components, already listed in README 375. It computes no flattening map even for a nonconstant pro-system. | Keep these as an anonymous supplier Check and cite the existing Mathlib lemmas. For the flattening-map target, state the equation against each presentation projection (and, if needed, its compatibility with the chosen adjunction), with a nonconstant finite-set tower test. |
| 17 | 23604–23628 | `completed_tilt_identity_reduction / completed_tilt_zero_reduction / completed_tilt_swap_reduction (anonymous examples)` | (h) | None of these three Checks instantiates completed_tilt: they respectively state a property of tilt.equivOfCharP, uniqueness of a zero-ring quotient isomorphism, and a calculation in ZMod 2 × ZMod 2. The last Check would remain true if the theorem ignored α, β and hlift entirely. | Instantiate completed_tilt on the identity characteristic-p tower, a zero tower, and a two-component tower with component-swapping compatible reduction data. State equations for the resulting e and c, including e sending the first idempotent to the second in the swap case. |
| 18 | 22382–22428 (README 12579–12584) | `PerfectoidSpace.openChartImage / IsTildeLimit.toHuber; isTildeLimit_test_empty` | (f) | A Check bullet has been spliced into the middle of the sentence identifying the arbitrary-open density condition: the prose breaks after “specified by”, and openChartImage appears after the inserted bullet. The actual empty identity-cone Check exists, so this is a malformed correspondence rather than a missing theorem. | Move the complete isTildeLimit_test_empty bullet into the P7.2 Checks list and join the sentence directly to PerfectoidSpace.openChartImage; preserve its pointer to the actual global predicate example. |
| 19 | — (README 575; current PerfectoidTowers Lean 1183) | `finite_tower_over_perfectoid_tower` | (f) | The P4 supplier-use row still attributes a use to the unqualified finite_tower_over_perfectoid_tower, which no longer exists in this package. The declaration is now in PerfectoidTowers, a downstream importer; presenting it as a P4 use obscures the direction of the dependency. | Remove that use from the P4 supplier row and name/link PerfectoidTowers.PerfectoidSpace.finite_tower_over_perfectoid_tower in Downstream consumers using its actual enclosing namespace from the sibling source. |
| 20 | 22528 (README 13773) | `PerfectoidSpace.IsTildeLimit.finiteEtale_baseChange` | (j) | The citation describes the finite-étale tower argument in BHW, proof of Theorem 5.11, as being on manuscript p. 22. The local arXiv text puts that argument, beginning with the deduction of parts (2) and (3), on p. 23; p. 22 constructs the Frobenius-controlled tower and restricts it to an open. | Change this specific finite-étale locator to §5.2, proof of Theorem 5.11, p. 23. Keep p. 22 for the distinct Frobenius and open-restriction uses. |

## Declarations found CORRECT and pinned

Names below are relative to `TauCetiRoadmap.PerfectoidSpaces`. A family is listed only for the actual names shown; the comparison-data and Check findings above remain separate.

- **PerfectoidSpace**: `pullback_points` (8444), `IsInjection_affinoid` (13547), `IsStronglyZariskiClosed_affinoid` (13615), `underlyingPoints` (13748), `pointMap` (13749), `AffinoidField` (13754), `fieldPoints` (13866), `fieldPoints_affinoidEquiv` (13879), `fieldPoints_affinoidEquiv_spa` (13882), `QuasiCompact` (13952), `QuasiSeparated` (13953), `IsImmersion` (13956).

- **PerfectoidSpace (continued)**: `IsOpenImmersion` (13958), `IsClosedImmersion` (13960), `IsSeparated` (13970), `quasiCompact_iff_affinoid` (13973), `quasiSeparated_iff_affinoid_inter` (13976), `quasiSeparated_iff_quasiSeparatedSpace` (13982), `isInjection_iff_affinoid_tests` (13994), `isInjection_affinoid_iff` (13997), `isGeneralizing` (14002), `openImmersion_iff_adic` (14006), `openImmersion_iff_preAdic` (14010), `quasiCompact_iff_adicCompactOpens` (14018).

- **PerfectoidSpace (continued)**: `diagonal_isImmersion` (14039), `isSeparated_iff_isClosed_range_diagonal` (14044), `isSeparated_iff_adicDiagonal` (14049), `isInjection_iff_universally_injective` (14067), `injectionPullbackHomeomorph` (14073), `injectionPullbackHomeomorph_apply` (14076), `injection_iff_fieldPoints` (14116), `injection_iff_geometricPoints` (14119), `injection_iff_residueFields` (14123), `injection_iff_continuous_lift` (14128), `fieldPoints_image` (14135), `isIso_iff_fieldPoints` (14141).

- **PerfectoidSpace (continued)**: `isIso_iff_geometricPoints` (14145), `isIso_iff_residueFields` (14150), `isIso_of_homeomorphism_residuePairs` (14158), `isIso_residueFieldPoint_of_uniqueClosed` (14164), `valuativeCriterion_separated` (14190), `valuativeCriterion_adicDiagonal` (14198), `separated_unique_extension` (14213), `zeroLocus` (14235), `IsZariskiClosed` (14238), `IsZariskiClosedImmersion` (14241), `IsStronglyZariskiClosed` (14247), `isClosed_zeroLocus` (14252).

- **PerfectoidSpace (continued)**: `zeroLocus_sup` (14254), `zeroLocus_mul` (14256), `zeroLocus_inf` (14258), `zeroLocus_closure` (14260), `zeroLocus_radical` (14262), `zeroLocus_eq_iInter_rational` (14264), `stableUnderGeneralization_zeroLocus` (14267), `stronglyZariskiClosed_iff_zariskiClosed` (14271), `zariskiClosed_isStronglyZariskiClosed` (14278), `stronglyZariskiClosed_isZariskiClosed` (14286), `stronglyZariskiClosed_affinoid_iff` (14291), `stronglyZariskiClosed_isClosed_ker` (14295).

- **PerfectoidSpace (continued)**: `zariskiClosedPair` (14301), `zariskiClosedMap` (14302), `zariskiClosedSubspace` (14303), `zariskiClosedPair_universal` (14308), `QuasiCompact_tilt_iff` (14455), `QuasiSeparated_tilt_iff` (14458), `IsImmersion_tilt_iff` (14461), `IsOpenImmersion_tilt_iff` (14464), `IsClosedImmersion_tilt_iff` (14467), `IsSeparated_tilt_iff` (14470), `injection_tilt_iff` (14473), `RationalSystem` (14523).

- **PerfectoidSpace (continued)**: `proRationalPair` (14568), `proRationalMap` (14569), `proRationalSubspace` (14570), `proRationalStage` (14598), `proRationalStage_base` (14600), `proRationalStage_comp` (14602), `proRationalStage_dense` (14605), `surjective_almostSurjective_plus` (14635), `stronglyZariskiClosed_iff_almostSurjective` (14640), `surjective_iff_tilt` (14649), `stronglyZariskiClosed_tilt_iff` (14654), `tilt_kernel_sharp` (14658).

- **PerfectoidSpace (continued)**: `rationalNeighborhoods` (14685), `residueFieldPoint_eq_proRationalSubspace` (14715), `residueFieldPoint_factor` (14721), `integralStalk` (14738), `integralStalkToResidue` (14741), `integralStalkToResidue_scalar` (14744), `integralStalkToResidue_dense` (14748), `integralStalkToResidue_kernel` (14751), `integralStalk_mod_equiv` (14756), `integralStalk_mod_equiv_apply` (14762), `PerfectoidQuotientIdeal` (14822), `ClosedPerfectTiltIdeal` (14827).

- **PerfectoidSpace (continued)**: `tiltIdealEquiv` (14830), `tiltIdealEquiv_kernel` (14832), `tiltIdealEquiv_symm` (14837), `stronglyZariskiClosed_quotient_comparison` (14859), `discPair` (14874), `discAnnulus` (14879), `annulusSystem` (14885), `unitAnnulus` (14892), `openUnitDisc` (14896), `gaussPoint` (14904), `gaussPoint_polynomial` (14907), `gaussPoint_support` (14914).

- **PerfectoidSpace (continued)**: `gaussPoint_rankOne` (14917), `unitAnnulus_laurent` (15024), `annulusBoundaryPlus` (15041), `ordinaryAnnulus` (15079), `rootAnnulus` (15091), `rootAnnulus_isPerfectoid` (15097), `ordinaryAnnulus_not_perfectoid` (15099), `sumSpaceEquiv` (15129), `sumSpaceEquiv_inl` (15132), `sumSpaceEquiv_inr` (15134), `isSeparated_sum_iff` (15137), `rationalResidueMap_base` (15200).

- **PerfectoidSpace (continued)**: `rationalResidueMap_integral` (15210), `integralStalkToResidue_stage` (15219), `isSeparated_eq_diagonal` (15267), `diagonalMultiplication` (15285), `diagonalMultiplication_inclusions` (15288), `diagonalMultiplication_strong` (15292), `gaussRationalField` (15335), `gaussRationalValuation` (15338), `gaussRationalValuation_polynomial` (15340), `gaussCompletion` (15344), `residueField_gauss_completion` (15346), `IsAdicClosedImmersion` (15389).

- **PerfectoidSpace (continued)**: `isAdicClosedImmersion_iff_adicCharts` (15401), `isAdicClosedImmersion_iff_locally_strong` (15417), `isAdicClosedImmersion_iff_strong` (15426), `glueSelf` (15445), `discAnnulusOpen` (15474), `discScalar` (15479), `DerivedPComplete` (15509), `SemiperfectoidRing` (15513), `semiperfectoidPerfectoidization` (15523), `semiperfectoidPerfectoidization_universal` (15531), `semiperfectoidPerfectoidization_surjective` (15535), `semiperfectoidPerfectoidization_kernel` (15537).

- **PerfectoidSpace (continued)**: `semiperfectoidPerfectoidization_tensor` (15540), `completedIntegralQuotient` (15577), `completedIntegralQuotientMap` (15584), `zariskiClosedPair_from_perfectoidization` (15593), `cofilteredLimit` (15990), `integral_sections_adicComplete` (16058), `finiteStage_faithfulness` (16066), `finiteStage_surjectivity` (16076), `finiteStage_isomorphism` (16086), `finiteStage_separatedness` (16094), `finiteStage_essentialSurjectivity` (16103), `toAdicSpace` (16201).

- **PerfectoidSpace (continued)**: `toAdicSpace_spec` (16210), `qcqsEtale` (16226), `qcSeparatedEtale` (16248), `finiteStageFiniteEtaleDiagram` (16257), `finiteStageFiniteEtaleDiagram_mapId_hom_app` (16274), `finiteStageFiniteEtaleDiagram_mapComp_hom_app` (16280), `finiteStageFiniteEtaleEquiv` (16306), `finiteStageFiniteEtaleEquiv_ι` (16309), `qcqsEtaleBaseChange` (16315), `finiteStageQcqsDiagram` (16323), `finiteStageQcqsDiagram_mapId_hom_app` (16340), `finiteStageQcqsDiagram_mapComp_hom_app` (16346).

- **PerfectoidSpace (continued)**: `finiteStageQcqsEquiv` (16373), `finiteStageQcqsEquiv_ι` (16376), `qcSeparatedEtaleBaseChange` (16382), `finiteStageSeparatedDiagram` (16391), `finiteStageSeparatedDiagram_mapId_hom_app` (16408), `finiteStageSeparatedDiagram_mapComp_hom_app` (16414), `finiteStageSeparatedEquiv` (16438), `finiteStageSeparatedEquiv_ι` (16441), `sectionsDiagram` (17033), `plusSectionsDiagram` (17039), `countableSubringLimitIso` (17098), `countableSubringLimitIso_π` (17102).

- **PerfectoidSpace (continued)**: `TateColimitModel` (17295), `tateColimit_spectrum` (17310), `integral_sections_completion_extension` (17435), `globalPlusQuotientDiagram` (17474), `cofilteredLimit_prodProfinite` (17556), `continuousFunctionSpaceHomeomorph` (17562), `continuousFunctionSpaceHomeomorph_eval` (17669), `cofilteredLimit_prodProfinite_π` (17675), `integral_sections_localization_extension` (17848), `ProKappa` (17971), `IsKappaSmall_affinoid` (18013), `isKappaSmall_affinoid_subsingleton_iff` (18033).

- **PerfectoidSpace (continued)**: `not_isKappaSmall_affinoid_of_le_one` (18038), `IsKappaSmall` (18115), `IsUniformlyKappaSmall` (18122), `KappaSmall` (18126), `isKappaSmall_affinoid_iff` (18138), `isUniformlyKappaSmall_iff_exists_lt` (18142), `isUniformlyKappaSmall_affinoid_iff` (18160), `uniform_of_cover` (18187), `AffinoidEtale` (18203), `ProEtalePresentation` (18210), `IsAffinoidProEtale` (18223), `AffinoidProEtale` (18226).

- **PerfectoidSpace (continued)**: `IsProEtale` (18236), `ProEtaleOver` (18242), `KappaSmallProEtaleOver` (18245), `prodLocallyProfinite` (18390), `prodProfinite` (18421), `affinoidEtale_size_bound` (18516), `CanonicalEtaleIndex` (18523), `canonicalEtaleIndex_essentiallySmall` (18527), `canonicalEtaleIndex_cofiltered` (18531), `canonicalSmallIndex` (18538), `canonicalSmallEquivalence` (18548), `canonicalDiagram` (18552).

- **PerfectoidSpace (continued)**: `canonicalCone` (18556), `canonicalCone_pt` (18558), `canonicalCone_π` (18560), `canonicalDiagram_affinoid` (18564), `canonicalMap` (18567), `isAffinoidProEtale_iff_canonical` (18572), `maps_to_etale_factor` (18596), `affinoidEtaleSmall` (18611), `affinoidEtaleSmallEquivalence` (18619), `proEtaleEquivalence` (18626), `proEtaleKappaEquivalence` (18645), `isKappaSmall_iff_bounded_presentation` (18652).

- **PerfectoidSpace (continued)**: `KappaSubpairs` (18662), `kappaSubpairs_directed` (18671), `kappaSubpairs_uniform_bound` (18675), `kappaSubpairs_union` (18682), `GaussPerfectoidField` (18860), `gaussPerfectoidField` (18874), `gaussPerfectoidField_card` (18876), `sigmaPoints` (18901), `sigmaPoints_ι` (18904), `not_isKappaSmall_gaussDisc_sigma` (18930), `not_isKappaSmall_gaussField_fibreProduct` (18963), `not_isKappaSmall_gaussField_cofilteredLimit` (18997).

- **PerfectoidSpace (continued)**: `zeroMonoidPresentation` (19090), `finiteFourier` (19133), `finiteFourier_single` (19141), `RankTwoGeometricPoint` (19233), `rankTwoGeometricPoint` (19244), `kappaSmallSliceTilt` (19284), `kappaSmallSliceTilt_obj` (19299), `kappaSmallSliceTilt_map` (19306), `isAffinoidProEtale_cofilteredLimit` (19337), `cofilteredLimit_uniform_card` (19345), `cardinal_spa_le_relations` (19429), `affine_diagonal_proEtale` (19433).

- **PerfectoidSpace (continued)**: `graph_proEtale` (19437), `isProEtale_local_shrinking` (19444), `exists_small_closed_perfectoid_subpair` (19501), `tilt_cardinality` (19510), `finiteStage_affinoid` (19542), `finiteStage_affinoid_model_iso` (19553), `finiteStage_relative` (19570), `twoPointEtale` (19866), `twoPointTransition` (19872), `twoPointPresentation` (19883), `bounded_subdiagram_approximation` (19946), `bounded_subdiagram_approximation_not_full` (19968).

- **PerfectoidSpace (continued)**: `rationalLocalization_cardinality` (20015), `finiteAlgebra_cardinality` (20022), `completedTensor_cardinality` (20026), `affinoidEtale_objects_cardinality` (20039), `affinoidEtale_hom_cardinality` (20043), `affinoidEtale_isKappaSmall` (20047), `proEtaleKappaEquivalence_forget` (20052), `isProEtale_iff_exists_rational` (20060), `CompositionModel` (20079), `pPowerRoots` (20164), `pPowerCharacter` (20167), `pPowerCharacter_apply` (20169).

- **PerfectoidSpace (continued)**: `CharacterCompletion` (20175), `characterCompletion` (20185), `IsTildeLimit_affinoid` (20279), `IsCompletedColimitOfTower` (20307), `LevelFamily` (20429), `CofinalityWitness` (20436), `IsTildeLimit` (20887), `GoodAffinoid` (21036), `IsResidueFieldTildeLimit` (21142), `strongPlus` (21196), `strongParameter` (21197), `strongRing` (21198).

- **PerfectoidSpace (continued)**: `strong_nhds_zero` (21216), `strongCompletionPair` (21223), `strongCompletionPair_indep` (21234), `IsPreperfectoid` (21244), `strongCompletion` (21274), `CompactOpenSubgroup` (21749), `openChartImage` (22382), `exists_tildeLimit_of_open_cover` (22558), `isTildeLimit_iff_open_cover` (22574), `exists_limit_of_affinoid_transitions` (22612), `analyticQcqsEtale` (22955), `analyticEtalePullback` (22972).

- **PerfectoidSpace (continued)**: `analyticEtalePullback_spec` (22981), `analyticEtalePullback_map` (22986), `analyticEtalePullbackProjection_exists` (23008), `analyticEtalePullbackProjection` (23018), `analyticEtalePullbackProjection_isPullback` (23023), `analyticEtalePullbackProjection_naturality` (23029), `analyticEtalePullbackIdIso_exists` (23050), `analyticEtalePullbackIdIso` (23055), `analyticEtalePullbackIdIso_projection` (23059), `analyticEtalePullbackCompIso_exists` (23084), `analyticEtalePullbackCompIso` (23093), `analyticEtalePullbackCompIso_projection` (23098).

- **PerfectoidSpace (continued)**: `residueEtaleDiagram` (23147), `residueEtaleDiagram_mapId_hom_app` (23165), `residueEtaleDiagram_mapComp_hom_app` (23170), `residueEtaleComparison_isEquivalence` (23213), `residueEtaleComparison_finite` (23217), `residueEtaleComparison_cover` (23233), `residueEtalePrecoverage` (23275), `residueEtaleTopology` (23284), `residueEtaleTopology_eq` (23289), `residueEtaleSheafPullback` (23353), `residueEtaleSheafPullback_universal` (23357), `residueEtaleLimitSheaf` (23370).

- **PerfectoidSpace (continued)**: `residueEtaleLimitSheaf_universal` (23374).

- **PerfectoidSpace.IsStronglyZariskiClosed_affinoid**: `baseChange` (13661).

- **PerfectoidSpace.zariskiClosedSubspace**: `presentation_affinoid` (13697), `ι` (14305), `range_ι` (14312), `lift` (14315), `isZariskiClosedImmersion` (14318), `surjective` (14320), `denseRange` (14322), `ker_eq` (14324), `congr` (14327), `universal` (14333), `baseChange` (14339).

- **PerfectoidSpace.AffinoidField**: `toPair` (13766), `toPairCat` (13767), `ofRankOne` (13771), `exists_algebraicallyClosed` (14171), `rigidity` (14178), `rankOneMap` (14184).

- **PerfectoidSpace.fieldPoints**: `map` (13868), `restrict` (13871), `closedPointImage` (13875).

- **PerfectoidSpace.QuasiCompact**: `comp` (13985), `baseChange` (13989).

- **PerfectoidSpace.QuasiSeparated**: `comp` (13987), `baseChange` (13991).

- **PerfectoidSpace.IsImmersion**: `ext` (14026), `stableUnderGeneralization_range` (14030), `comp` (14390), `baseChange` (14392), `isInjection` (15624).

- **PerfectoidSpace.IsClosedImmersion**: `quasiCompact` (14034), `comp` (14400), `baseChange` (14402).

- **PerfectoidSpace.IsSeparated**: `quasiSeparated` (14056), `of_affinoid` (14059), `of_isInjection` (14062), `comp` (14405), `baseChange` (14407).

- **PerfectoidSpace.IsOpenImmersion**: `comp` (14395), `baseChange` (14397), `of_isOpen` (15627).

- **Perfectoid**: `perfectoid_of_almost_frobenius` (14487), `exists_compatible_pseudouniformizer_plus` (15727), `adicCompletion_mem_nonZeroDivisors` (15741), `adicCompletion_isIntegrallyClosedIn` (15747), `isAdicComplete_colimit_of_alephOneFiltered` (15783), `plusDiagram` (15819), `completedColimitPlus` (15827), `completedColimitPlus_isRingOfIntegralElements` (15835), `completedColimitPlus_isBounded` (15839), `completedColimitPair` (15843), `adicCompletion_kernel_divisible` (15957), `adicCompletion_separatedQuotient` (15962).

- **Perfectoid (continued)**: `adicCompletion_rootClosed` (15969), `cantorDigitFunction` (17223), `contractingDiscDiagram` (17361), `contractingDiscDiagram_scalar` (17369), `contractingDiscDiagram_root` (17374), `countableSubring_powerBounded` (17419), `profiniteFunctionDiagram` (17524), `profiniteFunctionDiagram_map` (17532), `adicCompletion_localized_density` (17600), `continuousFunctionEval` (17641), `profiniteProjectionMap` (17654), `profiniteProjectionMap_apply` (17660).

- **Perfectoid (continued)**: `IntegralTower` (20474), `FrobeniusTower` (20569).

- **PerfectoidSpace.RationalSystem**: `intersection` (14528), `singleton` (14531), `plusDiagram` (14541), `scalar` (14550), `scalar_stage` (14553), `spaceDiagram` (14690).

- **PerfectoidSpace.proRationalSubspace**: `integralCompletion_isIntegralPerfectoid` (14560), `ι` (14572), `integralCompletion` (14575), `range_ι` (14583), `lift` (14587), `isInjection` (14591), `congr` (14593), `cone` (14696), `isLimit` (14702), `isPerfectoid` (14705), `plus_mod_pow` (14708), `annulusClosure_plus` (15048).

- **PerfectoidSpace.proRationalSubspace (continued)**: `localization` (15261), `proconstructible` (15271), `generalizations` (15274), `almost_plus` (15278).

- **PerfectoidSpace.IsAdicClosedImmersion**: `isClosedImmersion` (15423).

- **PerfectoidSpace.glueSelf**: `fold` (15448), `openCharts` (15451), `overlap` (15457).

- **PerfectoidSpace.semiperfectoidPerfectoidization**: `ι` (15524).

- **PerfectoidSpace.IsZariskiClosedImmersion**: `isClosedImmersion` (15631).

- **Perfectoid.completedColimit**: `ι` (15850), `ι_comp` (15855), `uniformizer` (15860), `plusCompletionEquiv` (15863), `plusCompletionEquiv_ι` (15867), `hasBasis_nhds_zero` (15873), `lift` (15879), `lift_comp_ι` (15886), `hom_ext` (15893), `denseRange_ι` (15897), `equivOfInitial` (15905), `equivOfInitial_ι` (15909).

- **Perfectoid.completedColimit (continued)**: `colimitEquiv_of_isCardinalFiltered` (15916), `quotientDiagram` (16982), `plusQuotientEquiv` (16992), `plusQuotientEquiv_ι` (17001), `integralPerfectoid` (17456).

- **PerfectoidSpace.cofilteredLimit**: `π` (15994), `π_comp` (15996), `cone` (15999), `isLimit` (16003), `lift` (16005), `lift_π` (16008), `hom_ext` (16012), `isAffinoid` (16016), `homeomorph` (16021), `homeomorph_apply` (16025), `isoOfInitial` (16028), `isoOfInitial_π` (16032).

- **PerfectoidSpace.cofilteredLimit (continued)**: `pairIso` (16887), `pairIso_π` (16893), `globalSections_of_isCardinalFiltered` (17048), `globalSections_of_isCardinalFiltered_ι` (17052), `globalPlus_of_isCardinalFiltered` (17058), `globalPlus_of_isCardinalFiltered_ι` (17062), `baseChangeHomeomorph_apply` (17068), `rational_descent` (17428), `plusQuotient` (17484), `plusQuotient_ι` (17494), `finite_qcOpen_cover` (17855).

- **CategoryTheory.FilteredTwoColimit**: `ι_map` (16920), `ιCompIso_id` (16926), `ιCompIso_comp` (16930), `ιCompDescIso_coherence` (16935), `homEquiv_symm_mk` (17115), `equivConst_ι` (17445).

- **CategoryTheory**: `fpModules` (17137).

- **CategoryTheory.fpModules**: `baseChange` (17140).

- **(root namespace)**: `completion_cardinality_bound` (17888).

- **PerfectoidSpace.HasKappaSmallPresentation**: `of_diagram` (17975).

- **PerfectoidSpace.IsKappaSmall**: `mono_affinoid` (18026), `mono` (18128), `of_iso` (18132), `empty` (18135), `isOpen` (18166), `of_cover` (18181), `tilt_iff` (18195), `finite_sigma` (19521).

- **PerfectoidSpace.IsUniformlyKappaSmall**: `isKappaSmall` (18146), `of_isKappaSmall_of_compactSpace` (18151), `of_isRegular` (18156), `isOpen` (18169), `fibreProduct` (18173), `tilt_iff` (18198), `sigma` (19515).

- **PerfectoidSpace.IsAffinoidProEtale**: `of_presentation` (18248), `of_isEtale` (18263), `id` (18268), `comp` (18273), `baseChange` (18279), `of_comp` (18285), `section` (18291), `zariskiClosed` (18319), `restrict` (18340), `baseChange_points` (19591), `isProConstructible_range` (19960).

- **PerfectoidSpace.ProEtalePresentation**: `constant` (18252), `π` (18365), `π_comp` (18368), `homeomorphLimit` (18370), `homeomorphLimit_apply` (18374), `range_eq_iInter` (18377), `canonicalFunctor` (18578), `canonicalFunctor_obj` (18584), `canonicalFunctor_map` (18587), `homStage` (19193), `homDiagram` (19200), `homEquiv` (19209).

- **PerfectoidSpace.ProEtalePresentation (continued)**: `homEquiv_stage` (19211), `plusModEquiv` (19358), `plusModEquiv_ι` (19367).

- **PerfectoidSpace.IsProEtale**: `of_isAffinoidProEtale` (18295), `of_isEtale` (18298), `comp` (18303), `baseChange` (18306), `of_comp` (18309), `diagonal` (18314), `of_sourceOpenCover` (18323), `of_openCover` (18329), `restrict` (18335).

- **PerfectoidSpace.AffinoidProEtale**: `hasLimits` (18349), `preservesLimits` (18351).

- **PerfectoidSpace.prodLocallyProfinite**: `fst` (18396), `snd` (18398), `homEquiv` (18400), `homEquiv_apply` (18403), `homeomorph` (18406), `homeomorph_apply` (18409), `isProEtale` (18412), `isAffinoid_iff` (18414).

- **PerfectoidSpace.prodProfinite**: `fst` (18425), `snd` (18426), `homeomorph` (18427), `isAffinoidProEtale` (18429), `isEtale` (18433), `map` (18435), `map_fst` (18439), `map_id` (18442), `map_comp` (18444), `pointSection` (19041), `pointSection_fst` (19045), `pointSection_snd` (19048).

- **PerfectoidSpace.prodProfinite (continued)**: `finiteIso` (19527), `finiteIso_ι` (19530).

- **PerfectoidSpace.fibreProdProfinite**: `fst` (18477), `snd` (18479), `condition` (18481), `homEquiv` (18484), `homEquiv_apply` (18488), `homeomorph` (18491), `homeomorph_apply` (18494), `isAffinoidProEtale` (18497).

- **PerfectoidSpace.AffinoidEtale**: `essentiallySmall` (18510), `hasFiniteLimits` (20035).

- **PerfectoidSpace.proEtaleEquivalence**: `cone` (18630), `cone_pt` (18634), `isLimit` (18640).

- **PerfectoidSpace.RankTwoGeometricPoint**: `generizationPairMap` (19249), `generization_rational` (19253).

- **PerfectoidSpace.KappaSubpairs**: `pair` (19456), `inclusion` (19458), `inclusion_spec` (19461), `map` (19467), `map_inclusion` (19469), `diagram` (19472), `cone` (19478), `isLimit` (19482), `plusDiagram` (19486), `plusCocone` (19492), `plusIsColimit` (19496).

- **PerfectoidSpace.ScholzeAffinoidTower**: `realization` (19735), `ι` (19737), `map` (19741), `map_stage` (19744), `map_id` (19748), `rational_baseChange` (19752), `finiteEtale_baseChange` (19761).

- **PerfectoidSpace.CompositionModel**: `Hom` (20091), `diagram` (20109), `cone` (20117), `cofiltered` (20125), `essentiallySmall` (20128), `isLimit` (20131).

- **PerfectoidSpace.CharacterCompletion**: `fourier` (20191), `fourier_single` (20193), `fourier_surjective` (20196), `fourier_kernel_nontrivial` (20198).

- **PerfectoidSpace.CofinalityWitness**: `not_nonempty_of_common_element` (20442), `initial` (21759), `mono` (21762), `ofDecreasing` (21767), `openNormal` (21774), `conj` (21779), `principalCongruence` (21785), `principalCongruence_closed` (21794), `isTildeLimit_iff` (22471).

- **Perfectoid.IntegralTower**: `quotient` (20489), `quotientMap` (20491), `quotientMap_mk` (20498), `diagram` (20503), `diagram_step` (20509), `colimitRing` (20512), `toColimit` (20513), `colimitParameter` (20514), `completedPlus` (20516), `toCompleted` (20517), `completedParameter` (20519), `completed` (20520).

- **Perfectoid.IntegralTower (continued)**: `completed_nhds_zero` (20532), `completedPair` (20536), `toCompleted_parameter` (20540), `toCompleted_transition` (20543), `completedPlus_torsionFree` (20546), `completedPlus_quotient` (20550), `completedPlus_quotient_mk` (20554), `completedPlus_lift` (20560), `genericRing` (21487), `generic_nhds_zero` (21497), `genericFibre` (21501), `genericTransition` (21505).

- **Perfectoid.IntegralTower (continued)**: `genericTransition_map` (21507), `genericToCompleted` (21511), `genericToCompleted_map` (21513), `genericDiagram` (21518), `genericDiagram_obj` (21520), `genericDiagram_objIso` (21523), `genericDiagram_step` (21526), `genericCone` (21534), `genericMap` (22752), `quotientDiagram` (22756), `quotientColimit` (22764), `quotientColimit_mk` (22768).

- **Perfectoid.FrobeniusTower**: `completedPlus` (20586), `completed` (20587), `completedPair` (20588), `toCompleted` (20589), `completed_isTateRing` (20591), `frobMod` (20595), `Hom` (20601), `shift` (20630), `constPerfectoid` (20646), `constCompletedEquiv` (20668), `constCompletedEquiv_map` (20673), `completed_frobenius_bijective` (20679).

- **Perfectoid.FrobeniusTower (continued)**: `completed_isPerfectoid` (20683), `completed_map` (20686), `completed_map_stage` (20689), `completed_shift` (20692), `completed_shift_stage` (20694), `genericFibre` (21548), `frobenius_colimit_bijective` (21551), `uniformity_bound` (21558), `isTildeLimit` (21565), `completed_map_id` (21570), `completed_map_comp` (21572), `discIntegral` (21576).

- **Perfectoid.FrobeniusTower (continued)**: `discPolynomial` (21579), `discPower` (21582), `discPower_polynomial` (21584), `disc` (21589), `discPowerHom` (21648), `relativeTwist` (21861), `relativeTwistLeft` (21873), `relativeTwistRight` (21885), `relativeTwistLeft_bijective` (21898), `ofRelativeFrobenius` (21905), `inverseFrobeniusIterate` (22007), `perfectionStage` (22011).

- **Perfectoid.FrobeniusTower (continued)**: `perfectionTensor` (22018), `perfectionTransition` (22023), `perfectionTransition_tensor` (22025), `perfection` (22040), `perfection_lift_tensor` (22056), `discCompletionEquiv` (22186), `discCompletionEquiv_monomial` (22190), `isCompletedDirectLimit` (22779), `completedPlus_quotient` (22787), `completedPlus_quotient_stage` (22792), `perfectoidDiagram` (22831), `completed_tilt` (23561).

- **Perfectoid.FrobeniusTower.Hom**: `id` (20615), `comp` (20622).

- **AdicSpace**: `affinoidPoints` (20739), `affinoidPoints_naturality` (20741), `IsHonest` (20747), `Qcqs` (20764), `chartImage` (20772), `HasDenseCharts` (20782), `IsTildeLimit` (20791), `singletonCone` (20844), `IsLocallyNoetherianAnalytic` (21093), `residueRestriction` (21099), `residueRestriction_map` (21104), `residueRestriction_continuous` (21110).

- **AdicSpace (continued)**: `residueImage` (21118).

- **AdicSpace.IsTildeLimit**: `ofAdicSpace_iff` (20806), `homeomorph` (20835), `homeomorph_apply` (20839), `const` (20849), `ofIso` (20852), `reindex` (20855).

- **PerfectoidSpace.IsCompletedColimitOfTower**: `isTildeLimit_affinoid` (20898), `isTildeLimit` (20956).

- **PerfectoidSpace.IsTildeLimit_affinoid**: `isTildeLimit` (20944).

- **PerfectoidSpace.IsTildeLimit**: `lift` (20999), `lift_uniform` (21005), `uniqueIso` (21014), `iff_goodCover` (21059), `toHuber` (22411), `dense` (22430), `const` (22455), `ofIso` (22458), `reindex` (22463), `etale_baseChange` (22513), `finiteEtale_baseChange` (22528), `open_baseChange` (22544).

- **PerfectoidSpace.IsTildeLimit (continued)**: `spectralSpace` (22622).

- **PerfectoidSpace.IsResidueFieldTildeLimit**: `of_isTildeLimit` (21158), `spectralSpace` (21165), `etale_baseChange` (22596), `homeomorph` (22626), `homeomorph_apply` (22631), `level_isAnalytic` (23139), `of_bijective` (25380), `reindex` (25398).

- **PerfectoidSpace.strongCompletionPair**: `toCompletion` (21228), `toCompletion_plus` (21230).

- **PerfectoidSpace.IsPreperfectoid**: `of_isPerfectoid` (21264), `openSubspace` (21267), `closedSubspace` (22931), `baseChange` (24118).

- **PerfectoidSpace.strongCompletion**: `ι` (21276), `homeomorph` (21279), `homeomorph_apply` (21282), `lift` (21286), `map` (21290), `map_ι` (21294), `map_id` (21299), `map_comp` (21302), `of_perfectoid` (21308), `affinoid` (21312), `affinoid_ι` (21316), `isTildeLimit` (22129).

- **RegularTower**: `CohenDVR` (21372), `cohen_equalCharacteristic` (21387), `cohen_unramified` (21392), `cohen_ramified` (21398), `powerSeries_regular_field` (21407), `powerSeries_regular_cohen` (21410), `ramified_quotient_regular` (21414), `regular_normal` (21421), `powerSeries_finite_flat` (21425), `exists_residueTower` (21437), `exists_perfectoidTower` (21456), `coefficient_extension` (22676).

- **RegularTower (continued)**: `powerSeriesDiagram` (22688), `powerSeries_colimit_field` (22697), `powerSeries_colimit_cohen` (22710), `exists_residueTower_primePower` (22728), `powerSeries_colimit_regular` (22887), `ramified_colimit_completion` (22893).

- **PerfectoidSpace.LevelFamily**: `functor` (21755).

- **PerfectoidSpace.GoodAffinoid**: `raise` (22638), `raise_spec` (22642), `homeomorph` (23645), `rationalSubset` (23656), `isUniformCompletion` (23730).

- **PerfectoidSpace.TowerGeometry**: `IsFinite` (23815), `IsOverZp` (23828).

- **PerfectoidSpace.VQuotient**: `adicVFunctor` (23921), `adicVFunctor_perfectoid` (23932), `tildeLimit_represented_comparison` (23960), `tildeLimit_represented_of_adic` (23972), `represented_limit_homeomorph` (23991), `represented_limit_affinoid_basis` (23999), `represented_limit_quasicompact_open` (24011), `represented_limit_rational_subset` (24024), `completed_colimit_uniformization_comparison` (24047), `represented_uniformization_density_iff` (24075).

The positive list includes the rewritten `FrobeniusTower.ofRelativeFrobenius` and `perfection_lift_tensor`: their coefficient/tensor formulas distinguish inverse coefficient Frobenius from forward Frobenius, including characteristic two and nilpotent reduction classes. It also includes the actual `completed_tilt` statement: the compatible finite-stage reductions and all integral root sequences constrain the resulting isomorphism; finding 17 concerns its advertised Checks. The repaired rank-two contracting-disc Lean examples are consistent with the maximal-plus-ring construction; finding 2 is the stale prose.

The examples `rank_group_not_integer`, the three `constantPseudofunctor_*` examples, `cofiltered_empty_index`, `cofiltered_two_terms`, `finiteStage_rank_zero`, `finiteStage_rank_one`, `finiteStage_iso_not_unique`, `profinite_two_terms`, `cofilteredLimit_test_notPerfectoidTower`, `pullback_galois_points`, and `isTildeLimit_test_perfectoidTorus` were also checked. The torus example supplies coefficient and coordinate-power conditions and the root formula for the completed-ring comparison.

## Supplier and source verification

A scratch-only probe, `lake env lean /tmp/perfectoid-finalread-part2/Suppliers.lean`, run from the project root, exited **0**, with no warnings or errors. It checks the current Part II `Chart`, `HomChart`, `IsFinite`, `Etale`, `Smooth` and valuative-criterion supplier, Part IV's completed-affinoid and base-change tilde-limit suppliers, AEG's classical-site forgetful functor, both affinoid étale finite-stage suppliers, its uniformization equivalence and affinoid point comparison, and the two Mathlib adjunction triangle lemmas. Current sibling sources were read as well as the olean probe. No obsolete private AEG chart/étale/smooth/finite supplier name was found in the scoped supplier rows. This was not a build or an elaboration of the entire snapshot.

Local source checks used bounded PDF extractions, without reproducing passages in this report: ECD §§4–8 and Example 11.12; Sch12 §§6–7, especially Definition 7.14, Proposition 7.16, Theorem 7.17 and Corollaries 7.18–7.19; Sch13 Definition 4.3 and Lemmas 4.5–4.6; Berkeley Example 2.3.8, Theorem 7.4.8 and its corollary, §§8.2–8.3 and the remark after Definition 17.4.2; KL15 §§1.2–1.3, §2.6 and Proposition 2.8.16; BMS Lemmas 3.10 and 3.21; Bhatt–Scholze §7 (Corollary 7.3, Theorem 7.4, Remark 7.5); Torsion §II.2 and Definition III.2.18/Corollary III.2.19; SW13 §§2.3–2.4; Huber96 §2.4, printed pp. 125–129; and the cited CHJ, BHW and Hansen–Johansson passages. GR, KL16 and Hansen–Kedlaya are present in the library but have no separate P4–P7 claim in the scoped references beyond their retained bibliography entries. The Stacks [05N7](https://stacks.math.columbia.edu/tag/05N7) and [05GG](https://stacks.math.columbia.edu/tag/05GG) locators were checked directly against their primary pages.

Unavailable in the local library and therefore not source-verified: **[Bhatt] 2017 perfectoid lecture notes; [AWS] Kedlaya's 2017 notes; [Sch13E] the erratum; [Survey] Scholze's 2013 survey; [Čes] Purity for the Brauer group**. Retained bibliography entries **[KBF], [SGA1] and [Illusie]** were likewise unavailable; they are outside the mathematical P4–P7 source claims. Missing-source locators have not been counted as confirmed locator defects. In particular, the Česnavičius locators for the regular-tower results remain unchecked.

Primary finding counts: (a) 1, (b) 0, (c) 12, (d) 2, (e) 0, (f) 2, (g) 1, (h) 1, (i) 0, (j) 1; **20 findings**.
