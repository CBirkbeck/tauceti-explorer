# Revision 2 checkpoint: Excursion operators and spectral action, ES0–ES4

Job `BP-ExcursionOperatorsAndSpectralAction--ES0~2`, issue #6960. Codex, session `codex-urAc32`, 9 October 2026. **Partial checkpoint, blocked on actual supplier interfaces.** The independent `needs_changes` review is preserved unchanged. This revision is not complete and must not be sent onward as accepted.

The bot confirmed the sole claim in [issue comment 6077220383](https://github.com/CBirkbeck/tauceti-explorer/issues/6960#issuecomment-6077220383). Only the issue’s packet, reader, suggested Lean file and this handoff were changed. No supplier, atlas, review or queue files were edited.

The work branch is `codex-urAc32-excursion-es0-revision`, based on `a8d6ec82325bea51ee19a692d2f8f5f9568c1178`. Continue in the existing [packet](../packets/ExcursionOperatorsAndSpectralAction--ES0.json), [reader](../readmes/ExcursionOperatorsAndSpectralAction--ES0.md) and [suggested file](../suggested/ExcursionOperatorsAndSpectralAction--ES0.lean).

## What changed

All 42 node identifiers, 26 planets and unchecked implementation statuses remain. Mathematical target coverage is still eight stages planned and none closed. The packet status is now partial because the suggested file does not satisfy PROTOCOL section 13. Its inventory distinguishes actual declarations and ordinary observations from the unavailable full signatures.

The four reviewer corrections were checked and synchronized into the reader: the excursion-definition locator is VIII.4.2 pp. 291–292; coherent enhanced comparisons give equality of classes in pi_0 and commutative reindexing; the nilpotent support test uses k compact in Perf(k), with the dual-number action through its projection to k; quotienting S_phi by the fixed center removes central stabilizers from the finiteness test while unramified central twists still vary the parameter. The older excerpt field was removed under the worker’s standing paraphrase rule rather than retained. No source passage was copied into the deliverables.

The current LP2 invariant-function-and-independence node already has the corrected commutative square, Theta.reindex API and replacement tests. The stale supplier request and its gap were therefore removed and recorded as resolved at the planning-interface level. Source issue E1 remains independently confirmed and scoped to the hash-identified author copy. The input packet actually had six gaps and twenty requests, despite the old review report’s twenty-one-request count; this checkpoint has five gaps and nineteen open requests.

The weak ideal-containment statement previously called support_exact_operations is now support_of_annihilator_product. The named target support_exact_operations takes an actual pretriangulated category, distinguished triangles, a central ring action, additive shifts with explicit suspension compatibility and biproducts. It states shifts, biproduct unions, retract containment and all three cyclic triangle support inclusions. Separate signatures state the distinguished-triangle Hom factorization and endpoint-annihilator product containment. The proof outline cites the existing Pretriangulated.Triangle.yoneda_exact₂, rather than assuming the desired ideal inclusion.

Additional signatures state compatible-functor support containment and the principal radical/power criterion. These do not construct a flat End tensor comparison or an Ind telescope. Concrete ModuleCat examples now compute the annihilator and support of the rank-one scalar module and of k under k[epsilon]/epsilon² -> k. They observe degree-zero parts of the Perf tests; ModuleCat is not identified with Perf. A zero-endpoint example uses an actual distinguished triangle.

Nine existing Mathlib declarations were added to the baseline, bringing it to 27. Four Chapter X locators were tightened: the universal family and theorem are X.1.1 pp. 341–342 (with X.1.2 pp. 342–343 for the argument); the rational action is X.1.3 p. 343; the degree-zero compatibility obligation uses that page and IX.5.2 p. 329.

## Why this run stops with a checkpoint

The pinned libraries and current E5 packet do not supply Lean types for Lambda-linear stable infinity categories, enhanced exact functor mapping objects, E_2 endomorphisms and pi_0, compact/Ind mapping-object comparisons or coherent finite-set action anima. E5 is partial and has no Lean declarationName exports for these interfaces. LP’s derived stacky Perf, equivariant descent and animated relative tensor interfaces are likewise not supplied as Lean types. Implementing those foundations belongs to their supplier roadmaps and is outside this issue’s four authorized paths.

PROTOCOL section 13 requires conditions that cannot be stated to be omitted, not replaced by arbitrary proposition fields. Merely renaming ordinary categories, treating an assumed ring as the enhanced center, or inserting assumed conclusions would conceal the defect. All feasible support signatures and reader/source corrections are complete here; full revision 2 depends on those external interfaces.

## Coverage and where to resume

| Stage | Nodes | Coverage | Required next interface or refinement |
| --- | ---: | --- | --- |
| ES0 | 6 | planned; not closed | E5/HS1 enhanced center and coherent relation signatures; preserve the qualified comparison to ordinary CatCenter. |
| ES0:classical-center | 2 | planned; not closed | SR.1 abelian ring-valued center/Hecke-corner export and SR.3 field-transport block dictionary. |
| ES1 | 1 | planned; not closed | Complete the supplier enhanced center and finite-wild coordinate interfaces. |
| ES1:finite-ramification | 4 | planned; not closed | HS1 relatively discrete Hom and quotient-equivariant full faithfulness, and E5 Ind sum/product comparison. |
| ES1:spectral-center | 3 | planned; not closed | LP and HS coefficient/pinned-quotient comparison interfaces; retain the exact center-order condition. |
| ES2 | 8 | planned; not closed | E5 action anima/relative tensor constructions and LP derived quotient descent; inspect the full higher inverse comparisons. |
| ES3 | 9 | planned; not closed | LP3 DVR highest-weight filtration, E5 animated free-group resolution, and qualified LP/VS/HS derived scalar-extension comparisons. |
| ES4 | 9 | planned; not closed | Lisse VS5 duality, full multi-leg HS3 comparison, elliptic deformation proof refinement and qualified endomorphism base-change. |

The immediate continuation is the enhanced-signatures gap. First establish which actual E5/HS/LP Lean exports are now available; use their genuine types without duplicating supplier foundations. Then replace each omitted or weaker ordinary form in the existing suggested file, preserving names, target hypotheses and the review object. Validate the action equivalences as equivalences of coherent-data anima, not just object-level identifications. The four missing full definitions are enhancedCenter, perfApprox, finiteWildCategory and ellipticParameter.

The exact missing node names are:

- `enhancedCenter`
- `enhanced_to_homotopy_center`
- `excursion_algebra_to_bernstein_center`
- `continuity_of_excursion_evaluations`
- `discretisation_of_the_weil_group`
- `map_to_the_classical_bernstein_center`
- `complex_block_comparison`
- `uniform_wild_subgroup`
- `component_decomposition`
- `center_on_finite_wild_pieces`
- `spectral_to_geometric_center_map`
- `center_change_of_data`
- `excursion_algebra_without_the_coefficient_condition`
- `universal_action_theorem`
- `mapping_stack_commutes_with_sifted_colimits`
- `pushout_of_affine_quotients`
- `spectral_action_rational`
- `degree_zero_center_agreement`
- `perfApprox`
- `integral_universal_action`
- `approximation_commutes_with_colimits`
- `free_group_case`
- `discrete_group_presentation`
- `discrete_integral_spectral_action`
- `integral_spectral_action`
- `action_change_of_data`
- `derived_reduction_and_rationalization`
- `finiteWildCategory`
- `support_coefficient_change`
- `central_localization`
- `duality_and_the_chevalley_involution`
- `local_shtuka_excursion_compatibility`
- `ellipticParameter`
- `elliptic_parameter_component`
- `basic_decomposition_of_an_elliptic_component`

The exact missing API names are:

- `enhancedCenter_ind`
- `bunExcursionOperator_function`
- `bunExcursionOperator_fusion`
- `compactAction_finite_sum`
- `universalHecke_unit`
- `universalHecke_fusion`
- `perfApprox_finite`
- `perfApprox_compare`
- `perfApprox_lift`
- `perfApprox_evaluation`
- `finiteWild_stable`
- `whittakerSheaf_support`
- `whittakerSheaf_ind_action`
- `ellipticParameter_iff`
- `ellipticParameter_conjugate`
- `ellipticParameter_central_twist`

The test labels without any executable example are:

- `center_zero_category`
- `center_module_category`
- `excursion_two_leg_trace`
- `excursion_nonsplit`
- `compactAction_zero`
- `compactAction_unbounded_family`
- `universalHecke_empty`
- `universalHecke_free_loop`
- `perfApprox_empty`
- `perfApprox_point`
- `perfApprox_rational`
- `finiteWild_zero`
- `finiteWild_tensor_generator`
- `finiteWild_regular_action`
- `whittakerSheaf_torus`
- `whittakerSheaf_trivial_group`
- `ellipticParameter_GL2_trivial`
- `ellipticParameter_GLn_irreducible`

There are seven proposed node names and 22 API names declared, with 15 executable examples carrying 13 of 31 proposed test labels. These counts are upper bounds on full coverage. The six named node forms besides the generic support theorem remain ordinary observations; the generic theorem’s actual enhanced Bun_G instantiation remains missing too. Each node’s signatureStatus records this. In particular, the quotient-by-itself elliptic example does not supply a semisimple twisted algebraic parameter, and the identity-functor universal-family example does not test a derived mapping stack.

The remaining five mathematical/interface gaps and nineteen supplier contracts are stated in the packet and reader. Preserve the coefficient-order conditions, all-field rational range, DVR good-prime restriction at the actual-Perf comparison step, qualified derived scalar extension and separation from nilpotent singular support. Do not turn X.1/X.2/X.3 conjectures into acceptance targets.

Ownership remains as reviewed: LP2 owns abstract excursions; ES2/ES3 own Chapter X universality under the verified primary RT finding 6; LP4 supplies VIII.5.1 generation/module comparison; SR1 owns the abelian ring-valued smooth center; ES7 owns general stratum composites. RT findings 5, 6, 7, 9 and 34 and rejected finding 35 are retained as handled. No second abstract relation owner was added.

## Reading and validation evidence

The primary source was the [author-hosted manuscript](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`. Printed and PDF pages agree. Revision reading ranges are recorded separately from the original review receipt in revisionReading. They include I.9.5/I.10.2; VI.12 pp. 239–241; VII.7 pp. 271–276; VIII.3.5–VIII.4 pp. 288–293; IX.1–IX.3 pp. 320–327; IX.5 pp. 327–329; and X.0–X.3 pp. 339–350. No imported VIII.5 proof interior or full published edition is claimed read in this revision. No private reference-library item was used.

The reviewed in-scope AUDIT-20 entries, atlas stage edges, relevant link screen, supplier contracts and both upstream ReductiveGroups and SemisimpleAlgebras READMEs were read. All 27 Mathlib baseline declaration statements were checked at `082e2d37e8b0463410cdb532e111cd43d5a66174`, including the nine new support/test inputs. TauCeti’s packet pin is `f790474821cf4256814db967cb154e7af3d0c369`; the source/index search did not identify the missing enhanced interfaces.

Checks completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ExcursionOperatorsAndSpectralAction--ES0.json`, with the pinned declaration index: exit 0, zero errors, zero warnings. Counts: 42 nodes (7 definitions, 3 constructions, 29 theorems, 3 comparisons), 38 APIs, 31 proposed tests, 26 planets, 27 baseline declarations, five gaps, nineteen requests, eight planned stages, none closed.
- `lean-check research/blueprint/suggested/ExcursionOperatorsAndSpectralAction--ES0.lean`: exit 0, 48 warnings, all declaration-uses-sorry warnings; no other warnings or errors. The shared build has the exact Mathlib pin. Its TauCeti checkout is `cf386627e9176a3827c1a5fe804989fd94a4d216`, different from the packet pin, but the suggested file imports only Mathlib. No unpinned TauCeti declaration was used. Available memory before checking was 114 GB.
- Nested-comment-aware executable inventory, reader/register synchronization, unchanged review/source finding/node IDs/planets/unchecked statuses, removal of all excerpt fields and absence of local paths checked.
- `git diff --check`: clean.

Lean elaboration validates types, not proofs. All mathematical targets remain unchecked. The next worker should start from the packet’s suggestedLean inventory and the enhanced-signatures gap, not from the original complete-status claim. Scratch sources and logs are discarded after submission; all continuation information is in these deliverables.
