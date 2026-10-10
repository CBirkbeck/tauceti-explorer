# Revision 3 independent review: excursion operators and the spectral action

Verdict: **needs_changes**. This completes `REV-ExcursionOperatorsAndSpectralAction--ES0~3`, issue #7953. Reviewer: Codex, session `codex-dtxIEe`, 2026-10-10. This session authored none of the blueprint revisions under review. This is a finished review, not a checkpoint.

The new generic flat support-comparison signature is mathematically sound. The earlier mathematical corrections remain in place. The remaining acceptance failure is PROTOCOL §13: **34 proposed node names, 16 API names and 18 definition-test labels have no executable signature**. Some present names state only ordinary observations. The enhanced center, coherent action classifications, animated Perf approximation and geometric comparisons cannot be certified by the file's commented statement register. Its successful elaboration verifies the declarations that are present; it does not verify those absent statements.

The packet remains honestly partial: all eight stages are planned, none closed, with four gaps and fifteen open supplier contracts. The sixteenth contract records a supplied upstream import. Open target-level refinements are permitted; those refinements alone are not the reason for this verdict. No proof or implementation is certified.

The inventory is unchanged: 42 nodes (7 definitions, 3 constructions, 29 theorems, 3 comparisons), 38 API items, 31 proposed definition tests, 26 planets and 34 baseline declarations. This review has 40 verified and 2 corrected node records, no added or unverifiable nodes. “Verified” below refers to the mathematical specification, its source match and its honest dependency statement, not to full Lean coverage.

## Corrections and the preceding review

The [revision 2 review](REV-ExcursionOperatorsAndSpectralAction--ES0~2.md) and revision 3 blueprint handoff were checked against the current files. All eight previous corrections persist: the named VS4 stratum adjunction; the separate center-order input from GS4; integral comparisons through ES3 approximation and LP4 bundles; enhanced finite-wild quotient descent; the distinction between the D(R) triangle test and the compact Perf(k) nilpotent test; compact lisse VS5 duality; normalized general multi-leg HS3 comparison with pro-p and trace-index qualifications; and the separation of supplied mathematical contracts from missing executable types. The revision before these also removed the unsupported enhanced/ordinary-center isomorphism and the false cartesian reindexing requirement. Neither has reappeared.

Two small corrections were made in place and synchronized with the reader:

1. Classical-center proof and coverage wording now import the **already supplied** upstream SR.0/SR.1 ordinary smooth-center and Hecke-corner targets. The outstanding work is the enhanced stratum/heart comparison and field-transport dictionary. The supplied contract was already correctly recorded by revision 3; its stale coverage sentence should not request that ordinary theory again.
2. The duality citation is **Proposition VII.7.6**, pp. 274–275, rather than “Theorem VII.7.6”. Its compact lisse hypothesis and conclusion are unchanged.

The current review replaces the top-level verdict while preserving the revision 2 verdict in `reviewHistory`. All 34 baseline receipts were independently refreshed. Source issue E1 has a fresh verdict by this review, preserving its preceding verdicts and version limits. The suggested file's review comments are updated; its executable content is unchanged.

## The new flat support comparison

For a central action a on X, evaluation at the identity is the R-linear map

`R → End(X), r ↦ r • id_X`.

Its kernel is the defined annihilator. Tensor the exact kernel-inclusion/evaluation pair with S. Flatness gives exactness at `S ⊗_R R`, identified with S; the image of the tensor kernel is the extended ideal. The supplied S-linear equivalence `S ⊗_R End(X) ≃ End(Y)` carries the tensor identity to `id_Y`, so scalar compatibility identifies the tensor evaluation with `s ↦ b(s)_Y`. Consequently its kernel is exactly `Ideal.map (algebraMap R S) Ann(X)`. The existing inverse-image zero-locus formula gives the claimed support equality. This uses neither a presumed annihilator equality nor a presumed support equality.

The proof ingredients are native pinned Mathlib declarations, particularly `Module.Flat.lTensor_exact`, `LinearMap.toSpanSingleton`, `Ideal.map`, `PrimeSpectrum.preimage_comap_zeroLocus` and `PrimeSpectrum.zeroLocus_span`. [Stacks Definition 10.39.1 and the kernel argument in Lemma 10.39.2](https://stacks.math.columbia.edu/tag/00H9) support the flat exactness step. The theorem is an elementary deduction attached to the roadmap's central-support definition; it is not assigned an invented Fargues–Scholze theorem number.

Both additional acceptance examples work:

- For the flat identity map on Z, the scalar module Z has zero annihilator and the zero module has unit annihilator. The additive zero functor is compatible with scalar actions, but cannot supply the identity-preserving End equivalence. Compatibility and flatness alone therefore do not imply equality.
- For Z→Z/2, the scalar Q-object has zero annihilator and the zero Z/2-object has unit annihilator. Multiplication by 2 on End(Q) is invertible, so its tensor with Z/2 vanishes; this gives the stated End equivalence to End(0), including the identity condition. Z/2 is not flat over Z, and the annihilator equality fails. Thus the comparison alone does not replace flatness.

The unconditional compatible-functor statement has the correct direction: the extended old annihilator is contained in the new annihilator, hence new support is contained in the inverse image of old support. These computations take place in ModuleCat. They do not identify ModuleCat with Perf or establish a geometric endomorphism base-change theorem.

## Source and version checks

Every node's cited source passage and supporting local argument were opened. The primary text is the [author-hosted Fargues–Scholze manuscript](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), 356 pages, SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`; PDF and printed page numbers agree. The packet's `reviewReading` records the inspected ranges and distinguishes imported VIII.5 generation statements from their supplier-owned proof development. Extra comparisons and the elementary support arguments are identified as roadmap deductions. The source's conjectural categorical LLC and packet equivalences are not turned into action-existence theorems. Its I.9.5 entry records that manuscript's conjecture rather than a claim about the status of all subsequent literature.

E1 is independently **confirmed only for this author copy**, at p. 292 in the proof of VIII.4.1. With trivial dual/quotient groups, W=C2 and a trivial tensor family, the two-leg fold restricts functions along the diagonal. Over F2 the pullback has eight elements and the scalar source has two. A function supported on one off-diagonal pair, with scalar zero, gives a witness outside the source image. Thus the diagram commutes but need not be cartesian; fusion uses commutativity. The current LP2 supplier already uses the corrected relation.

The [Astérisque 466 publisher page](https://smf.emath.fr/publications/geometrisation-de-la-correspondance-de-langlands-locale) and its ten-page public sample, [arXiv version record](https://arxiv.org/abs/2102.13459), and both authors' publication pages were checked afresh. No correction to this passage was found. The published proof was unavailable; no equality of preprint and author-copy bytes is assumed. A targeted search also found a cartesian-diagram correction in [Hamann, p. 26 footnote 2](https://web.math.princeton.edu/~lhamann/Unitary_Groups.pdf), but that concerns IX.6.1 and does not identify or correct this VIII.4.1 square. No new source issue was added. No source passages or library books were copied into the repository.

## Baseline and ownership

The baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and TauCeti `f790474821cf4256814db967cb154e7af3d0c369`. All 34 cited declaration statements were read at the exact Mathlib pin. The ordinary center, its ring/evaluation/naturality API, ideal zero loci and flat tensor exactness are existing inputs. No direct TauCeti declaration is imported by the suggested file.

The independently checked declaration register is:

| Module | Declarations read |
| --- | --- |
| `Mathlib/CategoryTheory/Center/Basic.lean` | `CategoryTheory.CatCenter`, `CategoryTheory.CatCenter.app`, `CategoryTheory.CatCenter.naturality`, `CategoryTheory.CatCenter.ext` |
| `Mathlib/CategoryTheory/Center/Linear.lean` | `CategoryTheory.Linear.toCatCenter` |
| `Mathlib/CategoryTheory/Functor/Basic.lean` | `CategoryTheory.Functor` |
| `Mathlib/CategoryTheory/NatTrans.lean` | `CategoryTheory.NatTrans` |
| `Mathlib/CategoryTheory/Preadditive/Basic.lean` | `CategoryTheory.Preadditive` |
| `Mathlib/RingTheory/Ideal/Defs.lean` | `Ideal` |
| `Mathlib/RingTheory/Spectrum/Prime/Defs.lean` | `PrimeSpectrum` |
| `Mathlib/RingTheory/Spectrum/Prime/Basic.lean` | `PrimeSpectrum.zeroLocus`, `PrimeSpectrum.mem_zeroLocus`, `PrimeSpectrum.zeroLocus_radical`, `PrimeSpectrum.zeroLocus_inf`, `PrimeSpectrum.zeroLocus_mul`, `PrimeSpectrum.zeroLocus_subset_zeroLocus_iff`, `PrimeSpectrum.zeroLocus_span` |
| `Mathlib/RingTheory/Ideal/Maps.lean` | `RingHom.ker`, `RingHom.mem_ker`, `Ideal.map` |
| `Mathlib/CategoryTheory/Triangulated/Basic.lean` | `CategoryTheory.Pretriangulated.Triangle` |
| `Mathlib/CategoryTheory/Triangulated/Pretriangulated.lean` | `CategoryTheory.Pretriangulated`, `CategoryTheory.Pretriangulated.Triangle.yoneda_exact₂` |
| `Mathlib/CategoryTheory/Shift/Basic.lean` | `CategoryTheory.shiftFunctor` |
| `Mathlib/CategoryTheory/Limits/Shapes/BinaryBiproducts.lean` | `CategoryTheory.Limits.biprod` |
| `Mathlib/RingTheory/Spectrum/Prime/RingHom.lean` | `PrimeSpectrum.comap`, `PrimeSpectrum.preimage_comap_zeroLocus` |
| `Mathlib/Algebra/Category/ModuleCat/Basic.lean` | `ModuleCat.of` |
| `Mathlib/Algebra/DualNumber.lean` | `DualNumber` |
| `Mathlib/Algebra/TrivSqZeroExt/Basic.lean` | `TrivSqZeroExt.fstHom` |
| `Mathlib/RingTheory/Flat/Basic.lean` | `Module.Flat`, `Module.Flat.lTensor_exact` |
| `Mathlib/LinearAlgebra/Span/Basic.lean` | `LinearMap.toSpanSingleton` |
| `Mathlib/Data/ZMod/Defs.lean` | `ZMod` |

The eight reviewed AUDIT-20 stage entries agree with these ordinary foundations. Their older LP4 action-ownership lead is superseded by the assigned red-team verifier's primary fix: ES2/ES3 own Chapter X classification and approximation, LP4 owns VIII.5.1 generation/module comparison. The current accepted LP2, HS, VS and ES7 node contracts were read; their exact hypotheses, rather than vague stage names, support the imported mathematics. Stage-only inputs have precise request consumers. The internal 42-node prerequisite graph is acyclic. All scoped stages have target coverage, but open requests and gaps prevent a proof-closure claim.

Current upstream was read at `dea8191cc6047d6142a65872ebce6eeeb841a29b`, and current TauCeti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, strictly read-only. SemisimpleAlgebras and InductionRestriction readers were read in full as density examples. Relevant SmoothRepresentationsOfLocalGroups scope and SR.0/SR.1/SR.2 passages and its SmoothRep/SmoothCentre signatures were inspected. Upstream already specifies the ordinary smooth center, cofinal invertible-pro-order corner dictionary and separatedness. Its ordinary `CatCenter` signature supplies no enhanced geometric comparison. Closed-subgroup compact induction also remains SR-owned; ES constructs its geometric Whittaker extension, not induction theory again.

The nine newer upstream directions were screened for relevant enhanced/action declarations. Current TauCeti's DG Hom-complex data is not a condensed stable-infinity-category/action interface; its Frobenius projective stable category is an ordinary quotient, and its graded linear quiver has no composition. These near misses do not justify substituting ordinary objects for the requested E5/HS/LP types. No upstream-owned target is replanned and no supplier file is edited.

Assigned findings /5, /6, /7, /9 and /34 retain the intended ownership: LP2 abstract excursions, ES Chapter X, HS/VS geometric inputs, SR ordinary centers and ES7 general parabolic/stratum returns. Rejected finding /35 does not remove the enhanced-center construction. Proposed restructuring or link changes outside this part are not applied.

## API, tests, planets and executable coverage

All ten definitions/constructions have usage-derived APIs and at least three discriminating proposed tests. The distinctions checked include the zero category and Perf(A) center; nonidentity creation–annihilation and nonsplit excursions; Hecke-compatible versus arbitrary central elements; objectwise versus global cutoff; unit/fusion/free-loop evaluation; approximation versus actual Perf; enhanced quotient descent; regular torus Whittaker induction; nilpotent reduced support; and semisimple algebraic ellipticity. The 26 planet names describe mathematical objects/results, obey the 60-character and six-per-stage limits, and are preserved. Node IDs and unchecked implementation statuses are preserved.

A nested-comment-aware inventory finds eight proposed node names and 22 proposed API names in executable declarations, and 17 executable examples carrying 13 proposed test labels. Two coefficient-hypothesis labels are additional examples. Name/label presence is an upper bound on full coverage: the generic support theorems are genuine degree-zero statements, while several other forms lack the enhanced relationship their names suggest. The coordinate product-switch example and finite abstract quotient observation do not formalize their full categorical or algebraic-group tests.

Exact missing names remain in `suggestedLean.inventory` and are repeated here to make the required revision reviewable.

Missing nodes:

`enhancedCenter`; `enhanced_to_homotopy_center`; `excursion_algebra_to_bernstein_center`; `continuity_of_excursion_evaluations`; `discretisation_of_the_weil_group`; `map_to_the_classical_bernstein_center`; `complex_block_comparison`; `uniform_wild_subgroup`; `component_decomposition`; `center_on_finite_wild_pieces`; `spectral_to_geometric_center_map`; `center_change_of_data`; `excursion_algebra_without_the_coefficient_condition`; `universal_action_theorem`; `mapping_stack_commutes_with_sifted_colimits`; `pushout_of_affine_quotients`; `spectral_action_rational`; `degree_zero_center_agreement`; `perfApprox`; `integral_universal_action`; `approximation_commutes_with_colimits`; `free_group_case`; `discrete_group_presentation`; `discrete_integral_spectral_action`; `integral_spectral_action`; `action_change_of_data`; `derived_reduction_and_rationalization`; `finiteWildCategory`; `central_localization`; `duality_and_the_chevalley_involution`; `local_shtuka_excursion_compatibility`; `ellipticParameter`; `elliptic_parameter_component`; `basic_decomposition_of_an_elliptic_component`.

Missing APIs:

`enhancedCenter_ind`; `bunExcursionOperator_function`; `bunExcursionOperator_fusion`; `compactAction_finite_sum`; `universalHecke_unit`; `universalHecke_fusion`; `perfApprox_finite`; `perfApprox_compare`; `perfApprox_lift`; `perfApprox_evaluation`; `finiteWild_stable`; `whittakerSheaf_support`; `whittakerSheaf_ind_action`; `ellipticParameter_iff`; `ellipticParameter_conjugate`; `ellipticParameter_central_twist`.

Missing proposed definition tests:

`center_zero_category`; `center_module_category`; `excursion_two_leg_trace`; `excursion_nonsplit`; `compactAction_zero`; `compactAction_unbounded_family`; `universalHecke_empty`; `universalHecke_free_loop`; `perfApprox_empty`; `perfApprox_point`; `perfApprox_rational`; `finiteWild_zero`; `finiteWild_tensor_generator`; `finiteWild_regular_action`; `whittakerSheaf_torus`; `whittakerSheaf_trivial_group`; `ellipticParameter_GL2_trivial`; `ellipticParameter_GLn_irreducible`.

## Node-by-node findings

The common `ExcursionOperatorsAndSpectralAction:` prefix is omitted. These are conformance findings on the roadmap targets, not a section-by-section synopsis of the source.

| Node | Verdict | Check |
| --- | --- | --- |
| `ES0/bernstein-center-of-a-category` | verified | IX.0.2 (pp. 318–319), IX.1 (pp. 320–321) and IX.5 (p. 328) support the enhanced identity endomorphisms. The E2 and Ind inputs are explicitly requested; the Perf(A) test concerns degree-zero Hochschild cohomology. Ordinary CatCenter is an import. |
| `ES0/enhanced-to-homotopy-center` | verified | IX.5 (p. 328) gives object evaluation into the homotopy-category center. The comparison preserves scalars and naturality; it makes no general injectivity, surjectivity or equivalence claim. |
| `ES0/excursion-datum-and-operator` | verified | VIII.4.2 (pp. 291–292) and IX.2 (pp. 321–324) give the creation–Weil–annihilation composite for the actual normalized family. Arbitrary diagonal-invariant arrows need not compose to the identity. LP2 retains the abstract relations and function independence. |
| `ES0/excursion-algebra-to-bernstein-center` | verified | VIII.4.1 (pp. 291–293) and IX.5 (p. 328) produce the enhanced degree-zero algebra map without a good-prime restriction. Coherent identifications yield equality of classes, rather than strict equality of higher functors; E1 does not alter the corrected commutative relation. |
| `ES0/continuity-of-excursion-evaluations` | verified | IX.1.2 (pp. 320–321), VIII.3.7 (pp. 288–290) and IX.5.1 (pp. 327–328) justify continuous evaluation through the full Weil group and relatively discrete compact Hom. The universal flat-target qualification is retained. |
| `ES0/discretisation-of-the-weil-group` | verified | VIII.3.7 (pp. 288–290) supplies the canonical torsion-free excursion comparison; rational or good-prime coefficients supply the stronger identification. The intrinsic cocycle comparison is imported from LP0 and is not a new discretization construction. |
| `ES0:classical-center/map-to-the-classical-bernstein-center` | corrected | VII.7.2 (pp. 272–273) and IX.5 (p. 329) support fully faithful stratum restriction followed by the smooth heart. Corrected the proof/coverage wording to import the existing upstream ordinary smooth-center and Hecke-corner dictionary; enhanced restriction remains the ES target. |
| `ES0:classical-center/complex-block-comparison` | verified | IX.5 (p. 329) motivates ordinary center transport. A chosen abstract field isomorphism carries the smooth category and center; SR3 supplies the complex block description. This comparison transports neither condensed topology nor an ell-independent parameter construction. |
| `ES1/spectral-and-geometric-centers` | verified | IX.0.2 (pp. 318–319) and IX.5.2 (p. 329) distinguish spectral functions from geometric and Hecke-compatible centers. The scalar, composition and product-switch checks detect compatibility beyond ordinary centrality. |
| `ES1:finite-ramification/uniform-wild-subgroup` | verified | IX.5.1 (pp. 327–328) has one eligible wild subgroup for each compact object, simultaneously for every leg set and representation. Tensor generation and the pro-p/pro-ell argument do not give a cutoff uniform over all Ind objects. |
| `ES1:finite-ramification/component-decomposition` | verified | IX.5 (pp. 328–329) uses clopen idempotents to give finite component support on compacts, a compact direct sum and the Ind product. The universal homeomorphism suffices for components without an unrestricted integral coordinate-ring isomorphism. |
| `ES1:finite-ramification/center-on-finite-wild-pieces` | verified | VIII.3.7 (pp. 288–290) and IX.5 (pp. 328–329) yield compatible evaluations after refining finite-wild pieces. Enhanced quotient descent is explicit; invariant-coordinate identifications retain their separate coefficient qualifications. |
| `ES1:spectral-center/spectral-to-geometric-center-map` | verified | IX.5.2 (p. 329) requires invertibility of the order of pi_0 Z(G). GS4 supplies the dual-root-datum relation; this condition is not silently replaced by the separate integral actual-Perf generation condition. |
| `ES1:spectral-center/center-change-of-data` | verified | VIII.4.2 (pp. 291–293) and IX.5.2 (p. 329) provide the common construction for these additional comparison squares. The required kernel and coordinate comparison maps are explicit inputs; invariant base change is not asserted for arbitrary rings. |
| `ES1:spectral-center/excursion-algebra-without-the-coefficient-condition` | verified | IX.6 opening (p. 330) retains the excursion route when invariant-coordinate comparison is unavailable. Component idempotents require only the weaker universal homeomorphism. Semisimple parameter assignment remains downstream ES5 work. |
| `ES2/compactly-supported-actions` | verified | Chapter X opening (p. 339) defines objectwise factorization of each orbit functor through a finite-wild piece. Refinement handles finite sums; the unbounded-family test excludes a single cutoff for the whole category. The ordinary functor prototype is weaker. |
| `ES2/universal-parameter-hecke-family` | verified | X.1.1 (pp. 341–342) constructs universal representation evaluation with finite-set coherence. The point, empty-leg and free-loop tests distinguish the intended stacky family from mere functor composition. Its enhanced signature is still absent. |
| `ES2/universal-action-theorem` | verified | X.1.1 (pp. 341–342) classifies coherent action anima under the characteristic-zero hypotheses. Both inverse coherences are required; a bijection of sets of actions would not state this theorem. |
| `ES2/mapping-stack-commutes-with-sifted-colimits` | verified | X.1.2 (pp. 342–343) preserves sifted colimits in stable categories and all colimits with symmetric monoidal structure. Rational pro-reductive representation theory and the affine-quotient comparison are named prerequisites, not implicit integral claims. |
| `ES2/pushout-of-affine-quotients` | verified | The proof of X.1.2 (p. 343) uses derived affine fiber products, rational exact invariants and relative tensor products of Perf categories. The node includes the required Ind-module and compact-object comparisons; no underived pushout theorem is substituted. |
| `ES2/spectral-action-rational` | verified | X.1.3 (p. 343) applies the coherent family and uniform wild cutoff to the rational Bun_G action for every ell distinct from p. Neither categorical full faithfulness nor an excluded-prime integral extension follows from it. |
| `ES2/degree-zero-center-agreement` | verified | X.1.3 (p. 343) and IX.5.2 (p. 329) agree on the same excursion matrix coefficients. This is correctly marked as an additional roadmap comparison, with normalization and the center-map coefficient range explicit. |
| `ES3/sifted-colimit-approximation` | verified | X.3 opening (pp. 348–349) replaces the integral mapping-stack construction by its animated finite-set approximation. Its four APIs and three tests distinguish the comparison map from an unconditional integral equality with actual Perf. |
| `ES3/integral-universal-action` | verified | X.3.1 (pp. 348–349) classifies actions of the approximation before good-prime generation. The finite-set coherent data and Rep(Q)-linearity are retained; characteristic-zero universality is not used as an integral premise. |
| `ES3/approximation-commutes-with-colimits` | verified | X.3.2 (p. 349) uses a DVR highest-weight tensor comparison. The LP3 request and explicit filtration gap identify this nonroutine proof input; field semisimplicity alone does not discharge it. |
| `ES3/free-group-case` | verified | X.3.3 (pp. 349–350) treats twisted conjugation on the free-group quotient, including rank zero. Full faithfulness has representation-generated image; surjectivity onto all perfect complexes requires the separate generation input. |
| `ES3/discrete-group-presentation` | verified | X.3.4 (p. 350) uses the animated sifted free-group resolution and equivariant coordinate-algebra colimit. E5 animation and the compact Ind-module comparison are explicit. Degree-zero invariants alone are insufficient. |
| `ES3/discrete-integral-spectral-action` | verified | X.0.2 (p. 340), VIII.5.1 (p. 293) and the end of X.3 (p. 350) give the discrete actual-Perf comparison at the stated dual fundamental-group good primes. LP4 owns generation, which ES imports. |
| `ES3/integral-spectral-action` | verified | X.0.1 (pp. 339–340) and IX.5.1 (pp. 327–328) pass from eligible discrete data to the continuous compactly supported action. DVR, good-prime and relatively discrete mapping hypotheses remain explicit; rational coefficients have their separate unrestricted range. |
| `ES3/action-change-of-data` | verified | X.0.1 (pp. 339–340) and X.3.1 (pp. 348–349) justify the integral comparison through ES3 approximation and LP4 universal bundles. Both endpoints and actual coefficient comparison functors are required; the rational-only ES2 family is not a premise. |
| `ES3/derived-reduction-and-rationalization` | verified | X.0.1 (pp. 339–340) supplies the eligible action, while the geometric Perf and D_lis scalar-extension equivalences are additional conditional inputs. The precise derived-reduction range remains a declared gap rather than an arbitrary-coefficient theorem. |
| `ES1:finite-ramification/finite-wild-Hecke-category` | verified | IX.5.1 (pp. 327–328) concerns full enhanced quotient-equivariant descent simultaneously for all Hecke images. HS1 pullback full faithfulness is requested. Ordinary pointwise triviality on P does not state this category or its stability API. |
| `ES2/whittaker-sheaf` | verified | X.1 (pp. 343–344), X.3.5 (p. 350) and VII.7.2 (pp. 272–273) construct closed-unipotent compact induction and open-stratum extension. The torus test uses regular compactly supported functions; neither compactness nor categorical LLC is presumed. |
| `ES4/finite-wild-central-support` | verified | IX.5 (pp. 328–329) provides the central action; the evaluated kernel and zero locus use pinned Mathlib. This is reduced central annihilator support, distinct from singular support. The compact nilpotent test is in Perf(k) with the dual-number ring acting through its residue field. |
| `ES4/support-exact-operations` | verified | The displayed elementary proof uses actual distinguished-triangle Hom exactness to factor the middle endomorphism, then annihilator-product containment. Shift compatibility, biproducts, retracts and rotation give the complete generic theorem. The D(R) test does not claim its residue-field endpoints are compact. |
| `ES4/support-coefficient-change` | verified | The new signature is sound: flat tensor exactness preserves the kernel of evaluation at the identity; the S-linear End comparison preserving that identity identifies the new evaluation map. Ideal.map and zero-locus inverse image give equality. The two ModuleCat counterexamples distinguish flatness from the End comparison; geometric instantiation remains conditional. |
| `ES4/central-localization` | verified | The principal-support criterion uses the pinned radical/zero-locus equivalence. The enhanced telescope additionally needs Ind and compact Hom commuting with the filtered colimit to turn vanishing into a finite power. The declared ideal criterion does not construct that localization. |
| `ES4/duality-and-the-chevalley-involution` | corrected | IX.5.3 (pp. 329–330) and VI.12.1 (pp. 239–241) retain conjugation by rho-hat(-1) before quotienting. VS5 supplies compact lisse BZ duality. Corrected the source label to Proposition VII.7.6 (pp. 274–275); the statement and compactness range are unchanged. |
| `ES4/local-shtuka-excursion-compatibility` | verified | IX.3.2 (pp. 326–327) and I.9 (pp. 35–36) compare normalized general multi-leg shtuka complexes. The named HS3 contracts retain pro-p compactness, separate level/tower domains and trace index normalization, without a tower-wide compact cutoff. |
| `ES4/elliptic-parameters-and-components` | verified | Definition X.2.1 (p. 346) requires semisimplicity and a finite algebraic centralizer quotient by the fixed center. The torus, trivial GL2 and irreducible GLn tests distinguish these conditions; finite abstract point groups alone would be too weak. |
| `ES4/elliptic-parameter-component` | verified | X.2 (pp. 346–347), including its deformation footnote, identifies the unramified-twist component. LP1 supplies the deformation complex, but the H0/H1/H2 calculation remains an explicit refinement. The residual stabilizer is retained; finite fixed center gives BS_phi, not a trivial stack. |
| `ES4/basic-decomposition-of-an-elliptic-component` | verified | X.2 (pp. 346–348) gives nonbasic vanishing and the basic/supercuspidal compact decomposition through imported ES7 parabolic compatibility and SR Ext results. The finite-fixed-center specialization is qualified. The Irr(S_phi) packet equivalence of X.2.2 is recorded as conjectural in this source, not deduced from the action. |

## Required revision and validation

The next blueprint revision must state the missing targets, APIs and definition tests with real supplier-owned types and replace the weaker ordinary projections where full enhanced signatures are required. E5 must supply stable linear categories, mapping objects, coherent functor/action anima, animation, Ind/relative tensor and localization interfaces. HS supplies continuous coherent Hecke data and quotient descent; LP supplies derived quotient-stack Perf and its universal representation, approximation and module-comparison interfaces. Already supplied VS4/VS5/HS3 mathematical contracts should not be requested again, but their executable types are still needed. Ordinary upstream smooth-center imports should stay imports. Arbitrary Prop fields, empty aliases or hypotheses asserting the intended conclusion cannot fill the deficit.

The four refinement gaps remain: enhanced signatures; DVR highest-weight tensor input for X.3.2; the exact geometric derived scalar-extension range; and the elliptic-component deformation calculation. This review does not ask another reviewer to finish any of its checks. It asks for a further blueprint revision addressing §13, followed by a fresh independent review.

Validation: `python3 scripts/check_blueprint.py research/blueprint/packets/ExcursionOperatorsAndSpectralAction--ES0.json` reports zero errors and zero warnings. `lean-check research/blueprint/suggested/ExcursionOperatorsAndSpectralAction--ES0.lean` exits 0 with 52 declaration-uses-sorry warnings and no other diagnostics, using the exact pinned Mathlib; no TauCeti imports occur. Executable inventory, reader synchronization, internal acyclicity, per-node review coverage, API/test counts and planet limits were checked. `git diff --check` passes. The independent finite E1 computation yields eight pullback elements and two source images. Only this job's permitted deliverables and its handoff are changed.
