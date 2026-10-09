# PKG-HeegnerPointEulerSystems

Job: #7490. Agent: Codex (GPT-6), session codex-1HFhwR. Date: 2026-10-09.
Status: complete package; ready for independent package review. No checkpoint.

## Deliverables

- `research/blueprint/packages/HeegnerPointEulerSystems/README.md`: mathematical roadmap with scope, conventions, existing library, precise supplier interfaces, ten ordered mathematical layers, all current targets, definition APIs and tests, target-level source locators and direct prerequisites.
- `research/blueprint/packages/HeegnerPointEulerSystems/Suggested.lean`: joined current interfaces, one standard header and one deduplicated import block, both namespaces, admitted definitions/theorems/API/examples, and explicit missing arithmetic conditions.
- `research/blueprint/packages/HeegnerPointEulerSystems/metadata.toml`: `topic = "math.NT"`.
- This handoff. No packets, aggregate readers, atlas data, generic supplier plans or source files changed.

## Inputs and reconciliation

Read the live issue after the bot confirmed this session's claim. Followed WORKERS.md, blueprint PROTOCOL.md including §20, expansion PROTOCOL.md and UPSTREAM_GUIDE.md. Read the complete upstream Multiquadratic and GlobalNumberFields roadmaps as form/ownership examples, and the Heegner entries of the reviewed library audit. The linked Zulip topic did not render through the public browser interface; its guidance in UPSTREAM_GUIDE.md was available.

The mathematical inputs are the currently accepted `HeegnerPointEulerSystems--HE.0.json` and `HeegnerPointEulerSystems--HE.7s.json`, together with their current part Suggested files. Their total is 140 targets, 15 definitions/constructions, 61 API items, 47 named tests and 54 designated planets. The aggregate reader is behind these inputs: it describes 138 targets, 60 API items and 45 tests, and its anticyclotomic status text predates the accepted revision. This package uses the current accepted statements; it does not revise the stale aggregate because that path is outside this job.

The package retains all source-backed corrections in the current parts: simultaneous finite solvability for the norm family with fixed bottom projections and auxiliary traces; homogeneous edge relations for differences of choices; the actual stabilized-point formula and separate first trace; class-number conductor shifts; the global χ change-of-group limitation; crystalline algebraic-Hecke hypotheses and nonzero BDP value for the split logarithm/control formulas; the p>3 scope of the exact-length route and integral BCK comparison; and the uniform arithmetic bound for a collection with one common p^t multiple, whose error is independent of t.

The legacy HE.8c nonvanishing target is included as mathematics in HE.8; HE.7s and the rest of the HE.8c labels do not become mathematical layers. Every target has a handoff mapping below, including the seven separately identified auxiliary/API targets in the anticyclotomic input. Local prerequisites are ordered topologically within each mathematical layer. Conditional main-conjecture implications are stated in HE.8 before HE.8b applies the independently proved split equalities; those implications do not assert the conjectures as previously established results.

The README spells out all three clauses of Zhang's Hypothesis ♥ and the two conductor sets, rather than asking a reader to recover them from an unspecified notation convention. I read the cleared Zhang article in place, especially Notations pp.200–203 and §3.1 pp.204–205; no source file or extracted passage was saved. Primary public Howard §2.3, BCGS §2.2, Castella–Sano §3.3 and the CV manuscript were checked at the sensitive norm, exact-length and local-condition interfaces. This is a package job, not a new exhaustive proof review of every source. Source editions and the existing acquisition/proof boundaries remain explicit.

## Validation

- Both input packets: `python3 scripts/check_blueprint.py` reports zero errors and zero warnings (78 and 62 targets respectively).
- Package coverage: all 140 targets appear with their named Lean interfaces; all 61 API items and 47 test labels occur in both README and Suggested; all direct prerequisites appear; every internal link resolves and anchors are unique. Shared promoted API targets intentionally reuse their existing API declarations.
- README: 190262 bytes, below the strict 200,000-byte limit. Mathematical toral “packet” terminology refers to torus orbits, not blueprint process. No job identifiers, review history, checkpoints or coverage status appear in the roadmap.
- Metadata parsed as TOML and checked for the exact arXiv topic. Imports are unique. No private/local paths or trailing whitespace in the package.
- Mathlib source statements were read in the existing build at `082e2d37e8b0463410cdb532e111cd43d5a66174`, including order/Picard operations, p-adic ideal/valuation statements, dihedral operations, linear maps, tensors and the two compactness inputs. Tau Ceti baseline remains `f790474821cf4256814db967cb154e7af3d0c369`; no Tau Ceti module is imported by this unbundled suggested file.
- `lean-check research/blueprint/packages/HeegnerPointEulerSystems/Suggested.lean`: successful elaboration, 234 warnings, all “declaration uses sorry”; no errors and no other warnings. Available memory was 111 GB before compilation. No language server, library build, update or cache download used.
- Submission path check and `git diff --check`: passed before commit.

## Mathematical limitations to preserve

This is a complete packaging of the accepted plan, not a claim that its external proofs or its arithmetic interfaces have been formalized. Nothing remains for this package writer. The independent reviewer should preserve these boundaries rather than treating a successful carrier elaboration as mathematical closure:

1. The arithmetic global χ action/localization square still needs its exact continuous change-of-group supplier. A local automorphism cannot simply be applied to global G_K cocycles. This obligation feeds both the finite and Λ-adic corrected systems.
2. GN11/CFT12/CFT13 and R18 need typed order, field, level, canonical-point and model exports. Fixed quotient degrees, Hodge/cusp denominators, finite cyclic factors, class-number shifts and nonunit Euler factors are not removed. No general order, class-field or cohomology theory is recreated here.
3. Zhang's independent period identity is the fine-grained `RankZeroOneBSD:BSD.3a/definite-congruence-period` input. It needs geometric, not ℚ_ℓ-rational, component factors and the nonsquarefree proof extension. The final Heegner-index BSD formula must not supply its own prerequisite. The auxiliary rank-zero formula uses Skinner's irreducible/free-coinvariant integral route for g and g_K, retaining p∤D_K; residual SL₂ alone does not imply the required integral image at small primes/ramified coefficient rings.
4. Exceptional-prime and RM applications require the uniform actual Tate-image/evaluation, component and integral two-prime exports, with cofinal principal exponents. These narrower non-torsion-trace statements do not discharge the weak-torsion BCGS bound without an analytic-rank assumption. The classical square-index cardinality result requires its original generic proof input; Nekovář's exponent bound is insufficient. Open-image Part II routing through R28.4 does not certify all small-prime/GL₂-type exports.
5. General-F CV nonvanishing requires a genuine S-arithmetic SL₂(F_P) twisted-diagonal/commensurability input at `GeometryOfNumbersAndQuadraticArithmetic:GN.4`. Current real Ratner statements do not supply it. The directly referenced ℚ_p case and the general-F_P acquisition requirement remain distinct. Conclusions are existence within each sufficiently large admissible primitive stratum, not nonvanishing for every character.
6. Family reciprocity, the distinguished integral lattice, strict/unrestricted JSW control and all-p strict ordinary determinant specialization need their exact owner extensions. The BCGS split crystalline and CS continuous unramified character branches have separate hypotheses and local-condition dictionaries. The p=3 generic exact-length and weak-torsion integral formulation extensions are not asserted. Rational comparisons cannot certify an integral unit or determinant basis.
7. The independent Eisenstein theorem from `RankZeroOneBSD:BSD.7a` needs the imaginary-quadratic elliptic-unit/μ suppliers and integral Wüthrich/Kato input. It may use early HE.8 geometry, not late BCGS/CS applications or HE.8b equality. The direct CM descent of HE.7 is separate. BCS reverse divisibility uses early L5a/L5w comparison, not completed L5b cyclotomic return.
8. BCGS assertions use arXiv v2 and the checked author collation, without certifying publisher wording. CS is a preprint. The original Kolyvagin size proof and the exact general-F_P theorem remain acquisition boundaries from the inputs. No new claim to have read these missing proofs is made.

The 31 gap records and 93 supplier requests of the two inputs remain the authoritative detailed contracts. The README presents their mathematical boundaries and target-level owner identifiers without repeating their programme history. They were not marked closed or silently converted to implemented declarations.

## Target correspondence

Each row identifies its README anchor and qualified Suggested declaration. This map is a review aid; it is deliberately confined to the handoff rather than the timeless roadmap.

| Input target | README anchor | Lean declaration |
| --- | --- | --- |
| `HeegnerPointEulerSystems:HE.0/local-toral-order` | [he-0-1](../packages/HeegnerPointEulerSystems/README.md#he-0-1) | `TauCeti.Heegner.local_toral_order` |
| `HeegnerPointEulerSystems:HE.0/transported-global-order` | [he-0-2](../packages/HeegnerPointEulerSystems/README.md#he-0-2) | `TauCeti.Heegner.transported_global_order` |
| `HeegnerPointEulerSystems:HE.0/idele-ideal-class-comparison` | [he-0-3](../packages/HeegnerPointEulerSystems/README.md#he-0-3) | `TauCeti.Heegner.idele_ideal_class_comparison` |
| `HeegnerPointEulerSystems:HE.0/conductor-change-kernel` | [he-0-4](../packages/HeegnerPointEulerSystems/README.md#he-0-4) | `TauCeti.Heegner.conductor_change_kernel` |
| `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients` | [he-0-5](../packages/HeegnerPointEulerSystems/README.md#he-0-5) | `TauCeti.Heegner.ring_class_tower_quotients` |
| `HeegnerPointEulerSystems:HE.0/dihedral-conjugation` | [he-0-6](../packages/HeegnerPointEulerSystems/README.md#he-0-6) | `TauCeti.Heegner.dihedral_conjugation` |
| `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower` | [he-0-7](../packages/HeegnerPointEulerSystems/README.md#he-0-7) | `TauCeti.Heegner.relative_cm_conductor_tower` |
| `HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility` | [he-0-8](../packages/HeegnerPointEulerSystems/README.md#he-0-8) | `TauCeti.Heegner.norm_reciprocity_level_compatibility` |
| `HeegnerPointEulerSystems:HE.0/local-different-discriminant` | [he-0-9](../packages/HeegnerPointEulerSystems/README.md#he-0-9) | `TauCeti.Heegner.local_different_discriminant` |
| `HeegnerPointEulerSystems:HE.1/cm-cyclic-isogeny-pair` | [he-1-1](../packages/HeegnerPointEulerSystems/README.md#he-1-1) | `TauCeti.Heegner.cm_cyclic_isogeny_pair` |
| `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points` | [he-1-2](../packages/HeegnerPointEulerSystems/README.md#he-1-2) | `TauCeti.Heegner.optimal_embedding_cm_points` |
| `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent` | [he-1-3](../packages/HeegnerPointEulerSystems/README.md#he-1-3) | `TauCeti.Heegner.canonical_model_cm_descent` |
| `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators` | [he-1-4](../packages/HeegnerPointEulerSystems/README.md#he-1-4) | `TauCeti.Heegner.jacobian_basepoint_denominators` |
| `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation` | [he-1-5](../packages/HeegnerPointEulerSystems/README.md#he-1-5) | `TauCeti.Heegner.conductorPoint` |
| `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree` | [he-1-6](../packages/HeegnerPointEulerSystems/README.md#he-1-6) | `TauCeti.Heegner.parameter_choice_and_degree` |
| `HeegnerPointEulerSystems:HE.2/cm-hecke-conductor-classification` | [he-2-1](../packages/HeegnerPointEulerSystems/README.md#he-2-1) | `TauCeti.Heegner.cm_hecke_conductor_classification` |
| `HeegnerPointEulerSystems:HE.2/norm-relation-and-reduction-congruence` | [he-2-2](../packages/HeegnerPointEulerSystems/README.md#he-2-2) | `TauCeti.Heegner.norm_relation_and_reduction_congruence` |
| `HeegnerPointEulerSystems:HE.2/split-ramified-first-step-recurrence` | [he-2-3](../packages/HeegnerPointEulerSystems/README.md#he-2-3) | `TauCeti.Heegner.split_ramified_first_step_recurrence` |
| `HeegnerPointEulerSystems:HE.2/repeated-conductor-predecessor-recurrence` | [he-2-4](../packages/HeegnerPointEulerSystems/README.md#he-2-4) | `TauCeti.Heegner.repeated_conductor_predecessor_recurrence` |
| `HeegnerPointEulerSystems:HE.2/nonmaximal-level-distribution` | [he-2-5](../packages/HeegnerPointEulerSystems/README.md#he-2-5) | `TauCeti.Heegner.nonmaximal_level_distribution` |
| `HeegnerPointEulerSystems:HE.2/inert-reduction-frobenius-congruence` | [he-2-6](../packages/HeegnerPointEulerSystems/README.md#he-2-6) | `TauCeti.Heegner.inert_reduction_frobenius_congruence` |
| `HeegnerPointEulerSystems:HE.2/quaternionic-reduction-specialization` | [he-2-7](../packages/HeegnerPointEulerSystems/README.md#he-2-7) | `TauCeti.Heegner.quaternionic_reduction_specialization` |
| `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions` | [he-3-1](../packages/HeegnerPointEulerSystems/README.md#he-3-1) | `TauCeti.Heegner.kummer_classes_and_the_modified_selmer_conditions` |
| `HeegnerPointEulerSystems:HE.3/good-place-kummer-unramified` | [he-3-2](../packages/HeegnerPointEulerSystems/README.md#he-3-2) | `TauCeti.Heegner.good_place_kummer_unramified` |
| `HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction` | [he-3-3](../packages/HeegnerPointEulerSystems/README.md#he-3-3) | `TauCeti.Heegner.bad_place_component_obstruction` |
| `HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition` | [he-3-4](../packages/HeegnerPointEulerSystems/README.md#he-3-4) | `TauCeti.Heegner.coefficient_prime_local_condition` |
| `HeegnerPointEulerSystems:HE.3/saturated-integral-kummer-lattice` | [he-3-5](../packages/HeegnerPointEulerSystems/README.md#he-3-5) | `TauCeti.Heegner.saturated_integral_kummer_lattice` |
| `HeegnerPointEulerSystems:HE.3/archimedean-tate-correction` | [he-3-6](../packages/HeegnerPointEulerSystems/README.md#he-3-6) | `TauCeti.Heegner.archimedean_tate_correction` |
| `HeegnerPointEulerSystems:HE.4/heegner-coefficient-ideal` | [he-4-1](../packages/HeegnerPointEulerSystems/README.md#he-4-1) | `TauCeti.Heegner.coefficientIdeal` |
| `HeegnerPointEulerSystems:HE.4/differentiated-point-invariance` | [he-4-2](../packages/HeegnerPointEulerSystems/README.md#he-4-2) | `TauCeti.Heegner.differentiated_point_invariance` |
| `HeegnerPointEulerSystems:HE.4/ring-class-torsion-invariants` | [he-4-3](../packages/HeegnerPointEulerSystems/README.md#he-4-3) | `TauCeti.Heegner.ring_class_torsion_invariants` |
| `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K` | [he-4-4](../packages/HeegnerPointEulerSystems/README.md#he-4-4) | `TauCeti.Heegner.descendedClass` |
| `HeegnerPointEulerSystems:HE.4/explicit-cocycle-divisibility` | [he-4-5](../packages/HeegnerPointEulerSystems/README.md#he-4-5) | `TauCeti.Heegner.explicit_cocycle_divisibility` |
| `HeegnerPointEulerSystems:HE.4/bottom-trace-class` | [he-4-6](../packages/HeegnerPointEulerSystems/README.md#he-4-6) | `TauCeti.Heegner.bottom_trace_class` |
| `HeegnerPointEulerSystems:HE.4/generator-tensor-choice-independence` | [he-4-7](../packages/HeegnerPointEulerSystems/README.md#he-4-7) | `TauCeti.Heegner.generator_tensor_choice_independence` |
| `HeegnerPointEulerSystems:HE.4/coefficient-and-prime-set-compatibility` | [he-4-8](../packages/HeegnerPointEulerSystems/README.md#he-4-8) | `TauCeti.Heegner.coefficient_and_prime_set_compatibility` |
| `HeegnerPointEulerSystems:HE.4/complex-conjugation-parity` | [he-4-9](../packages/HeegnerPointEulerSystems/README.md#he-4-9) | `TauCeti.Heegner.complex_conjugation_parity` |
| `HeegnerPointEulerSystems:HE.5/heegner-transverse-local-condition` | [he-5-1](../packages/HeegnerPointEulerSystems/README.md#he-5-1) | `TauCeti.Heegner.heegner_transverse_local_condition` |
| `HeegnerPointEulerSystems:HE.5/local-heegner-chi-automorphism` | [he-5-2](../packages/HeegnerPointEulerSystems/README.md#he-5-2) | `TauCeti.Heegner.local_heegner_chi_automorphism` |
| `HeegnerPointEulerSystems:HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system` | [he-5-3](../packages/HeegnerPointEulerSystems/README.md#he-5-3) | `TauCeti.Heegner.correctedClass` |
| `HeegnerPointEulerSystems:HE.5/actual-tate-hypotheses-h0-h2` | [he-5-4](../packages/HeegnerPointEulerSystems/README.md#he-5-4) | `TauCeti.Heegner.actual_tate_hypotheses_h0_h2` |
| `HeegnerPointEulerSystems:HE.5/actual-local-hypotheses-h3-h5` | [he-5-5](../packages/HeegnerPointEulerSystems/README.md#he-5-5) | `TauCeti.Heegner.actual_local_hypotheses_h3_h5` |
| `HeegnerPointEulerSystems:HE.5/residual-kummer-field-pairing` | [he-5-6](../packages/HeegnerPointEulerSystems/README.md#he-5-6) | `TauCeti.Heegner.residual_kummer_field_pairing` |
| `HeegnerPointEulerSystems:HE.5/chebotarev-heegner-class-detection` | [he-5-7](../packages/HeegnerPointEulerSystems/README.md#he-5-7) | `TauCeti.Heegner.chebotarev_heegner_class_detection` |
| `HeegnerPointEulerSystems:HE.5/arithmetic-local-error-comparison` | [he-5-8](../packages/HeegnerPointEulerSystems/README.md#he-5-8) | `TauCeti.Heegner.arithmetic_local_error_comparison` |
| `HeegnerPointEulerSystems:HE.5/tamagawa-and-local-torsion-tests` | [he-5-9](../packages/HeegnerPointEulerSystems/README.md#he-5-9) | `TauCeti.Heegner.tamagawa_and_local_torsion_tests` |
| `HeegnerPointEulerSystems:HE.6/clean-rank-one-descent-theorem-A` | [he-6-1](../packages/HeegnerPointEulerSystems/README.md#he-6-1) | `TauCeti.Heegner.clean_rank_one_descent_theorem_A` |
| `HeegnerPointEulerSystems:HE.6/gross-opposite-eigenspace-vanishing` | [he-6-3](../packages/HeegnerPointEulerSystems/README.md#he-6-3) | `TauCeti.Heegner.gross_opposite_eigenspace_vanishing` |
| `HeegnerPointEulerSystems:HE.6/gross-same-eigenspace-generation` | [he-6-4](../packages/HeegnerPointEulerSystems/README.md#he-6-4) | `TauCeti.Heegner.gross_same_eigenspace_generation` |
| `HeegnerPointEulerSystems:HE.6/gross-clean-mod-p-descent` | [he-6-2](../packages/HeegnerPointEulerSystems/README.md#he-6-2) | `TauCeti.Heegner.gross_clean_mod_p_descent` |
| `HeegnerPointEulerSystems:HE.6/sha-square-index-bound` | [he-6-5](../packages/HeegnerPointEulerSystems/README.md#he-6-5) | `TauCeti.Heegner.sha_square_index_bound` |
| `HeegnerPointEulerSystems:HE.6/primitivity-versus-nonzero` | [he-6-6](../packages/HeegnerPointEulerSystems/README.md#he-6-6) | `TauCeti.Heegner.primitivity_versus_nonzero` |
| `HeegnerPointEulerSystems:HE.6/zhang-cohomological-congruence` | [he-6-7](../packages/HeegnerPointEulerSystems/README.md#he-6-7) | `TauCeti.Heegner.zhang_cohomological_congruence` |
| `HeegnerPointEulerSystems:HE.6/zhang-local-conditions-rank-lowering` | [he-6-8](../packages/HeegnerPointEulerSystems/README.md#he-6-8) | `TauCeti.Heegner.zhang_local_conditions_rank_lowering` |
| `HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K` | [he-6-9](../packages/HeegnerPointEulerSystems/README.md#he-6-9) | `TauCeti.Heegner.zhang_rank_zero_over_K` |
| `HeegnerPointEulerSystems:HE.6/zhang-jochnowitz-special-value` | [he-6-10](../packages/HeegnerPointEulerSystems/README.md#he-6-10) | `TauCeti.Heegner.zhang_jochnowitz_special_value` |
| `HeegnerPointEulerSystems:HE.6/ribet-takahashi-tamagawa-comparison` | [he-6-11](../packages/HeegnerPointEulerSystems/README.md#he-6-11) | `TauCeti.Heegner.ribet_takahashi_tamagawa_comparison` |
| `HeegnerPointEulerSystems:HE.6/heegner-vanishing-order` | [he-6-14](../packages/HeegnerPointEulerSystems/README.md#he-6-14) | `TauCeti.Heegner.vanishingOrder` |
| `HeegnerPointEulerSystems:HE.6/heegner-base-locus` | [he-6-15](../packages/HeegnerPointEulerSystems/README.md#he-6-15) | `TauCeti.Heegner.baseLocus` |
| `HeegnerPointEulerSystems:HE.6/zhang-residual-local-pairing` | [he-6-16](../packages/HeegnerPointEulerSystems/README.md#he-6-16) | `TauCeti.Heegner.zhang_residual_local_pairing` |
| `HeegnerPointEulerSystems:HE.6/zhang-residual-heegner-relations` | [he-6-17](../packages/HeegnerPointEulerSystems/README.md#he-6-17) | `TauCeti.Heegner.zhang_residual_heegner_relations` |
| `HeegnerPointEulerSystems:HE.6/zhang-two-class-prime-detection` | [he-6-18](../packages/HeegnerPointEulerSystems/README.md#he-6-18) | `TauCeti.Heegner.zhang_two_class_prime_detection` |
| `HeegnerPointEulerSystems:HE.6/zhang-prescribed-ramification-class` | [he-6-19](../packages/HeegnerPointEulerSystems/README.md#he-6-19) | `TauCeti.Heegner.zhang_prescribed_ramification_class` |
| `HeegnerPointEulerSystems:HE.6/zhang-triangular-selmer-basis` | [he-6-12](../packages/HeegnerPointEulerSystems/README.md#he-6-12) | `TauCeti.Heegner.zhang_triangular_selmer_basis` |
| `HeegnerPointEulerSystems:HE.6/zhang-indivisibility` | [he-6-13](../packages/HeegnerPointEulerSystems/README.md#he-6-13) | `TauCeti.Heegner.zhang_indivisibility` |
| `HeegnerPointEulerSystems:HE.7/non-torsion-point-prime-divisibility` | [he-7-1](../packages/HeegnerPointEulerSystems/README.md#he-7-1) | `TauCeti.Heegner.non_torsion_point_prime_divisibility` |
| `HeegnerPointEulerSystems:HE.7/non-cm-open-image-application` | [he-7-2](../packages/HeegnerPointEulerSystems/README.md#he-7-2) | `TauCeti.Heegner.non_cm_open_image_application` |
| `HeegnerPointEulerSystems:HE.7/integral-tate-image-errors` | [he-7-10](../packages/HeegnerPointEulerSystems/README.md#he-7-10) | `TauCeti.Heegner.integral_tate_image_errors` |
| `HeegnerPointEulerSystems:HE.7/integral-cm-prime-detection` | [he-7-11](../packages/HeegnerPointEulerSystems/README.md#he-7-11) | `TauCeti.Heegner.integral_cm_prime_detection` |
| `HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators` | [he-7-4](../packages/HeegnerPointEulerSystems/README.md#he-7-4) | `TauCeti.Heegner.bounded_arithmetic_derivative_denominators` |
| `HeegnerPointEulerSystems:HE.7/dyadic-integral-conjugation-descent` | [he-7-5](../packages/HeegnerPointEulerSystems/README.md#he-7-5) | `TauCeti.Heegner.dyadic_integral_conjugation_descent` |
| `HeegnerPointEulerSystems:HE.7/exceptional-primary-sha-bound` | [he-7-7](../packages/HeegnerPointEulerSystems/README.md#he-7-7) | `TauCeti.Heegner.exceptional_primary_sha_bound` |
| `HeegnerPointEulerSystems:HE.7/cm-heegner-field-disjointness` | [he-7-12](../packages/HeegnerPointEulerSystems/README.md#he-7-12) | `TauCeti.Heegner.cm_heegner_field_disjointness` |
| `HeegnerPointEulerSystems:HE.7/cm-character-error-descent` | [he-7-6](../packages/HeegnerPointEulerSystems/README.md#he-7-6) | `TauCeti.Heegner.cm_character_error_descent` |
| `HeegnerPointEulerSystems:HE.7/almost-all-primary-sha-vanishing` | [he-7-3](../packages/HeegnerPointEulerSystems/README.md#he-7-3) | `TauCeti.Heegner.almost_all_primary_sha_vanishing` |
| `HeegnerPointEulerSystems:HE.7/classical-full-sha-finiteness` | [he-7-8](../packages/HeegnerPointEulerSystems/README.md#he-7-8) | `TauCeti.Heegner.classical_full_sha_finiteness` |
| `HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev` | [he-7-9](../packages/HeegnerPointEulerSystems/README.md#he-7-9) | `TauCeti.Heegner.admissible_rm_kolyvagin_logachev` |
| `HeegnerPointEulerSystems:HE.7/classical-square-index-error-bound` | [he-7-13](../packages/HeegnerPointEulerSystems/README.md#he-7-13) | `TauCeti.Heegner.classical_square_index_error_bound` |
| `HeegnerPointEulerSystems:HE.8/initial-euler-factor` | [he-8-1](../packages/HeegnerPointEulerSystems/README.md#he-8-1) | `TauCeti.Heegner.Anticyclotomic.initialFactor` |
| `HeegnerPointEulerSystems:HE.8/ordinary-stabilized-point` | [he-8-2](../packages/HeegnerPointEulerSystems/README.md#he-8-2) | `TauCeti.Heegner.Anticyclotomic.stabilizedPoint` |
| `HeegnerPointEulerSystems:HE.8/stabilized-corestriction` | [he-8-3](../packages/HeegnerPointEulerSystems/README.md#he-8-3) | `TauCeti.Heegner.Anticyclotomic.stabilized_corestriction` |
| `HeegnerPointEulerSystems:HE.8/compact-universal-norm-lift` | [he-8-4](../packages/HeegnerPointEulerSystems/README.md#he-8-4) | `TauCeti.Heegner.Anticyclotomic.universalNormFamily_exists` |
| `HeegnerPointEulerSystems:HE.8/universal-norm-heegner-family` | [he-8-5](../packages/HeegnerPointEulerSystems/README.md#he-8-5) | `TauCeti.Heegner.Anticyclotomic.universalNormFamily` |
| `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class` | [he-8-6](../packages/HeegnerPointEulerSystems/README.md#he-8-6) | `TauCeti.Heegner.Anticyclotomic.heegnerIwasawaClass` |
| `HeegnerPointEulerSystems:HE.8/cm-character-stratum` | [he-8-7](../packages/HeegnerPointEulerSystems/README.md#he-8-7) | `TauCeti.Heegner.Anticyclotomic.cmCharacterStratum` |
| `HeegnerPointEulerSystems:HE.8/cm-generic-root-number` | [he-8-8](../packages/HeegnerPointEulerSystems/README.md#he-8-8) | `TauCeti.Heegner.Anticyclotomic.cm_generic_root_number` |
| `HeegnerPointEulerSystems:HE.8/joint-cm-equidistribution` | [he-8-9](../packages/HeegnerPointEulerSystems/README.md#he-8-9) | `TauCeti.Heegner.Anticyclotomic.joint_cm_equidistribution` |
| `HeegnerPointEulerSystems:HE.8/joint-cm-orbit-surjectivity` | [he-8-10](../packages/HeegnerPointEulerSystems/README.md#he-8-10) | `TauCeti.Heegner.Anticyclotomic.joint_cm_orbit_surjectivity` |
| `HeegnerPointEulerSystems:HE.8/definite-cm-character-period` | [he-8-12](../packages/HeegnerPointEulerSystems/README.md#he-8-12) | `TauCeti.Heegner.Anticyclotomic.definite_cm_character_period` |
| `HeegnerPointEulerSystems:HE.8/definite-rankin-nonvanishing` | [he-8-13](../packages/HeegnerPointEulerSystems/README.md#he-8-13) | `TauCeti.Heegner.Anticyclotomic.definite_rankin_nonvanishing` |
| `HeegnerPointEulerSystems:HE.8/howard-stabilization-unit-comparison` | [he-8-20](../packages/HeegnerPointEulerSystems/README.md#he-8-20) | `TauCeti.Heegner.Anticyclotomic.howard_stabilization_unit_comparison` |
| `HeegnerPointEulerSystems:HE.8/crystalline-near-trivial-character` | [he-8-23](../packages/HeegnerPointEulerSystems/README.md#he-8-23) | `TauCeti.Heegner.Anticyclotomic.nearTrivialCharacter` |
| `HeegnerPointEulerSystems:HE.8/heegner-divisibility-profile` | [he-8-26](../packages/HeegnerPointEulerSystems/README.md#he-8-26) | `TauCeti.Heegner.Anticyclotomic.heegnerDivisibilityProfile` |
| `HeegnerPointEulerSystems:HE.8/optimal-lattice-isogeny-comparison` | [he-8-27](../packages/HeegnerPointEulerSystems/README.md#he-8-27) | `TauCeti.Heegner.Anticyclotomic.optimal_lattice_isogeny_comparison` |
| `HeegnerPointEulerSystems:HE.8/near-trivial-tamagawa-stability` | [he-8-30](../packages/HeegnerPointEulerSystems/README.md#he-8-30) | `TauCeti.Heegner.Anticyclotomic.near_trivial_tamagawa_stability` |
| `HeegnerPointEulerSystems:HE.8/strict-ordinary-selmer-complex` | [he-8-36](../packages/HeegnerPointEulerSystems/README.md#he-8-36) | `TauCeti.Heegner.Anticyclotomic.strict_ordinary_selmer_complex` |
| `HeegnerPointEulerSystems:HE.8/ordinary-local-specialization-defect` | [he-8-39](../packages/HeegnerPointEulerSystems/README.md#he-8-39) | `TauCeti.Heegner.Anticyclotomic.ordinary_local_specialization_defect` |
| `HeegnerPointEulerSystems:HE.8/universal-norm-level-zero` | [he-8-43](../packages/HeegnerPointEulerSystems/README.md#he-8-43) | `TauCeti.Heegner.Anticyclotomic.universalNormFamily_level_zero` |
| `HeegnerPointEulerSystems:HE.8/iwasawa-heegner-level-projection` | [he-8-44](../packages/HeegnerPointEulerSystems/README.md#he-8-44) | `TauCeti.Heegner.Anticyclotomic.heegnerIwasawaClass_level` |
| `HeegnerPointEulerSystems:HE.8/near-trivial-character-congruence` | [he-8-46](../packages/HeegnerPointEulerSystems/README.md#he-8-46) | `TauCeti.Heegner.Anticyclotomic.nearTrivialCharacter_congruent` |
| `HeegnerPointEulerSystems:HE.8/relative-ring-class-tower-torsion-finite` | [he-8-48](../packages/HeegnerPointEulerSystems/README.md#he-8-48) | `TauCeti.Heegner.Anticyclotomic.relative_ring_class_tower_torsion_finite` |
| `HeegnerPointEulerSystems:HE.8/indefinite-cm-character-point` | [he-8-11](../packages/HeegnerPointEulerSystems/README.md#he-8-11) | `TauCeti.Heegner.Anticyclotomic.indefinite_cm_character_point` |
| `HeegnerPointEulerSystems:HE.8c/cornut-vatsal-nonvanishing-with-its-exact-hypotheses` | [he-8-14](../packages/HeegnerPointEulerSystems/README.md#he-8-14) | `TauCeti.Heegner.Anticyclotomic.cornut_vatsal_indefinite_nonvanishing` |
| `HeegnerPointEulerSystems:HE.8/cornut-tower-trace-nontorsion` | [he-8-15](../packages/HeegnerPointEulerSystems/README.md#he-8-15) | `TauCeti.Heegner.Anticyclotomic.cornut_tower_trace_nontorsion` |
| `HeegnerPointEulerSystems:HE.8/lambda-bottom-class-nontorsion` | [he-8-16](../packages/HeegnerPointEulerSystems/README.md#he-8-16) | `TauCeti.Heegner.Anticyclotomic.lambda_bottom_class_nontorsion` |
| `HeegnerPointEulerSystems:HE.8/near-trivial-bottom-nonvanishing` | [he-8-25](../packages/HeegnerPointEulerSystems/README.md#he-8-25) | `TauCeti.Heegner.Anticyclotomic.near_trivial_bottom_nonvanishing` |
| `HeegnerPointEulerSystems:HE.8/twisted-logarithm-index-formula` | [he-8-28](../packages/HeegnerPointEulerSystems/README.md#he-8-28) | `TauCeti.Heegner.Anticyclotomic.twisted_logarithm_index_formula` |
| `HeegnerPointEulerSystems:HE.8/twisted-anticyclotomic-control` | [he-8-29](../packages/HeegnerPointEulerSystems/README.md#he-8-29) | `TauCeti.Heegner.Anticyclotomic.twisted_anticyclotomic_control` |
| `HeegnerPointEulerSystems:HE.8/integral-main-conjecture-index-square` | [he-8-33](../packages/HeegnerPointEulerSystems/README.md#he-8-33) | `TauCeti.Heegner.Anticyclotomic.integral_main_conjecture_index_square` |
| `HeegnerPointEulerSystems:HE.8/determinantal-heegner-element` | [he-8-37](../packages/HeegnerPointEulerSystems/README.md#he-8-37) | `TauCeti.Heegner.Anticyclotomic.determinantalHeegnerElement` |
| `HeegnerPointEulerSystems:HE.8/determinantal-heegner-image` | [he-8-47](../packages/HeegnerPointEulerSystems/README.md#he-8-47) | `TauCeti.Heegner.Anticyclotomic.determinantalHeegnerElement_image` |
| `HeegnerPointEulerSystems:HE.8/determinant-characteristic-ideal-comparison` | [he-8-38](../packages/HeegnerPointEulerSystems/README.md#he-8-38) | `TauCeti.Heegner.Anticyclotomic.determinant_characteristic_ideal_comparison` |
| `HeegnerPointEulerSystems:HE.8/determinant-specialization-lattice` | [he-8-40](../packages/HeegnerPointEulerSystems/README.md#he-8-40) | `TauCeti.Heegner.Anticyclotomic.determinant_specialization_lattice` |
| `HeegnerPointEulerSystems:HE.8/universal-norm-auxiliary-trace` | [he-8-49](../packages/HeegnerPointEulerSystems/README.md#he-8-49) | `TauCeti.Heegner.Anticyclotomic.universalNormFamily_trace` |
| `HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class` | [he-8-17](../packages/HeegnerPointEulerSystems/README.md#he-8-17) | `TauCeti.Heegner.Anticyclotomic.lambdaDerivativeClass` |
| `HeegnerPointEulerSystems:HE.8/lambda-derivative-restriction` | [he-8-45](../packages/HeegnerPointEulerSystems/README.md#he-8-45) | `TauCeti.Heegner.Anticyclotomic.lambdaDerivativeClass_restrict` |
| `HeegnerPointEulerSystems:HE.8/lambda-heegner-local-conditions` | [he-8-18](../packages/HeegnerPointEulerSystems/README.md#he-8-18) | `TauCeti.Heegner.Anticyclotomic.lambda_heegner_local_conditions` |
| `HeegnerPointEulerSystems:HE.8/lambda-finite-singular-relation` | [he-8-19](../packages/HeegnerPointEulerSystems/README.md#he-8-19) | `TauCeti.Heegner.Anticyclotomic.lambda_finite_singular_relation` |
| `HeegnerPointEulerSystems:HE.8/lambda-adic-heegner-kolyvagin-system-and-theorem-B` | [he-8-21](../packages/HeegnerPointEulerSystems/README.md#he-8-21) | `TauCeti.Heegner.Anticyclotomic.lambda_adic_heegner_kolyvagin_system_and_theorem_B` |
| `HeegnerPointEulerSystems:HE.8/weak-torsion-localized-divisibility` | [he-8-22](../packages/HeegnerPointEulerSystems/README.md#he-8-22) | `TauCeti.Heegner.Anticyclotomic.weak_torsion_localized_divisibility` |
| `HeegnerPointEulerSystems:HE.8/near-trivial-heegner-specialization` | [he-8-24](../packages/HeegnerPointEulerSystems/README.md#he-8-24) | `TauCeti.Heegner.Anticyclotomic.near_trivial_heegner_specialization` |
| `HeegnerPointEulerSystems:HE.8/arithmetic-rescaled-kolyvagin-bound` | [he-8-31](../packages/HeegnerPointEulerSystems/README.md#he-8-31) | `TauCeti.Heegner.Anticyclotomic.arithmetic_rescaled_kolyvagin_bound` |
| `HeegnerPointEulerSystems:HE.8/heegner-exact-sha-length` | [he-8-32](../packages/HeegnerPointEulerSystems/README.md#he-8-32) | `TauCeti.Heegner.Anticyclotomic.heegner_exact_sha_length` |
| `HeegnerPointEulerSystems:HE.8/bcgs-conditional-kolyvagin-nonvanishing` | [he-8-34](../packages/HeegnerPointEulerSystems/README.md#he-8-34) | `TauCeti.Heegner.Anticyclotomic.bcgs_conditional_kolyvagin_nonvanishing` |
| `HeegnerPointEulerSystems:HE.8/bcgs-conditional-refined-divisibility` | [he-8-35](../packages/HeegnerPointEulerSystems/README.md#he-8-35) | `TauCeti.Heegner.Anticyclotomic.bcgs_conditional_refined_divisibility` |
| `HeegnerPointEulerSystems:HE.8/determinantal-twisted-index-square` | [he-8-41](../packages/HeegnerPointEulerSystems/README.md#he-8-41) | `TauCeti.Heegner.Anticyclotomic.determinantal_twisted_index_square` |
| `HeegnerPointEulerSystems:HE.8/castella-sano-refined-equivalence` | [he-8-42](../packages/HeegnerPointEulerSystems/README.md#he-8-42) | `TauCeti.Heegner.Anticyclotomic.castella_sano_refined_equivalence` |
| `HeegnerPointEulerSystems:HE.8b/bdp-function-convention-comparison` | [he-8b-1](../packages/HeegnerPointEulerSystems/README.md#he-8b-1) | `TauCeti.Heegner.Anticyclotomic.bdp_function_convention_comparison` |
| `HeegnerPointEulerSystems:HE.8b/anticyclotomic-formulation-comparison` | [he-8b-2](../packages/HeegnerPointEulerSystems/README.md#he-8b-2) | `TauCeti.Heegner.Anticyclotomic.anticyclotomic_formulation_comparison` |
| `HeegnerPointEulerSystems:HE.8b/auxiliary-quadratic-field-verification` | [he-8b-3](../packages/HeegnerPointEulerSystems/README.md#he-8b-3) | `TauCeti.Heegner.Anticyclotomic.auxiliary_quadratic_field_verification` |
| `HeegnerPointEulerSystems:HE.8b/anticyclotomic-euler-system-divisibility` | [he-8b-4](../packages/HeegnerPointEulerSystems/README.md#he-8b-4) | `TauCeti.Heegner.Anticyclotomic.anticyclotomic_euler_system_divisibility` |
| `HeegnerPointEulerSystems:HE.8b/anticyclotomic-reverse-product-divisibility` | [he-8b-5](../packages/HeegnerPointEulerSystems/README.md#he-8b-5) | `TauCeti.Heegner.Anticyclotomic.anticyclotomic_reverse_product_divisibility` |
| `HeegnerPointEulerSystems:HE.8b/rational-heegner-main-conjecture` | [he-8b-6](../packages/HeegnerPointEulerSystems/README.md#he-8b-6) | `TauCeti.Heegner.Anticyclotomic.rational_heegner_main_conjecture` |
| `HeegnerPointEulerSystems:HE.8b/integral-heegner-main-conjecture` | [he-8b-7](../packages/HeegnerPointEulerSystems/README.md#he-8b-7) | `TauCeti.Heegner.Anticyclotomic.integral_heegner_main_conjecture` |
| `HeegnerPointEulerSystems:HE.8b/rational-greenberg-bdp-main-conjecture` | [he-8b-8](../packages/HeegnerPointEulerSystems/README.md#he-8b-8) | `TauCeti.Heegner.Anticyclotomic.rational_greenberg_bdp_main_conjecture` |
| `HeegnerPointEulerSystems:HE.8b/integral-greenberg-bdp-main-conjecture` | [he-8b-9](../packages/HeegnerPointEulerSystems/README.md#he-8b-9) | `TauCeti.Heegner.Anticyclotomic.integral_greenberg_bdp_main_conjecture` |
| `HeegnerPointEulerSystems:HE.8b/eisenstein-main-conjecture-adapter` | [he-8b-10](../packages/HeegnerPointEulerSystems/README.md#he-8b-10) | `TauCeti.Heegner.Anticyclotomic.eisenstein_main_conjecture_adapter` |
| `HeegnerPointEulerSystems:HE.8b/split-kolyvagin-nonvanishing-branches` | [he-8b-11](../packages/HeegnerPointEulerSystems/README.md#he-8b-11) | `TauCeti.Heegner.Anticyclotomic.split_kolyvagin_nonvanishing_branches` |
| `HeegnerPointEulerSystems:HE.8b/split-refined-kolyvagin-divisibility` | [he-8b-12](../packages/HeegnerPointEulerSystems/README.md#he-8b-12) | `TauCeti.Heegner.Anticyclotomic.split_refined_kolyvagin_divisibility` |
| `HeegnerPointEulerSystems:HE.8b/split-determinantal-heegner-main-conjecture` | [he-8b-13](../packages/HeegnerPointEulerSystems/README.md#he-8b-13) | `TauCeti.Heegner.Anticyclotomic.split_determinantal_heegner_main_conjecture` |

## Resume / review

Resume at the package files and target correspondence above. No worker scratch is needed; it is removed when the PR opens. An independent package reviewer can rerun `lean-check`, check the source-sensitive interfaces above, and assess density and faithfulness against the two current accepted inputs. No second job is claimed in this run.
