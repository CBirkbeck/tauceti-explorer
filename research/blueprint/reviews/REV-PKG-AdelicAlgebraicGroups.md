# Independent package review: AdelicAlgebraicGroups

**Verdict: needs_changes.** Review job REV-PKG-AdelicAlgebraicGroups, issue #7501, completed by Codex, session codex-bqsds2, on 2026-10-09. The reviewer did not author the package. The reviewed checkout was c84c7f5a30d0a35cd86113bfe95e66fa94b35e86, including the package revisions submitted in #7750 and #7972.

The README represents the accepted plan and the corrected Lean file elaborates. Acceptance fails because the file leaves substantial required mathematical interfaces in a block comment. This is a completed review with corrections and an actionable revision list.

## Checks against the six requirements

| Requirement | Finding |
| --- | --- |
| 1. Upstream form, style, density and size | Pass. Compared with the complete ClassFieldTheory and RepresentationTheory/CompactGroups reference roadmaps and UPSTREAM_GUIDE.md. The introduction, boundaries, conventions, ordered layers, definition APIs, examples, prerequisites and edition-specific sources follow that form. README.md is 198,539 bytes, below 200,000. |
| 2. Fidelity and boundaries | Pass for the reader document. All 264 plan targets and all 231 API outlines occur. Of the target statements, 254 retain the plan wording; ten replace internal locators or process wording with mathematical references, or express the already corrected basis-ordering conclusion. Their mathematics is unchanged. Standing conventions supply the repeated number-field, finite-type and measure assumptions; local hypotheses retain the exceptional cases. The two additional GL₂ analytic comparison targets implement the required move down from ModularCurvesPartII described below. |
| 3. Own words and precise citations | Pass on the textual comparison and locator audit. No source passage or source-by-source section summary was found. Targets carry theorem/section/page locators and the bibliography distinguishes editions. In particular, the six plan citations without page numbers already have pages in the README. Direct primary-source checks are recorded below. |
| 4. No process in the reader document | Pass. No packet names, job IDs, review/checkpoint narrative or coverage status was found in README.md. Mathematical prerequisites and analytic inputs are stated as mathematical work. |
| 5. Suggested Lean file | **Fail overall.** The corrected file elaborates with exit code 0, no errors and 542 warnings, all `declaration uses sorry`. Its active declarations still do not state all required targets, APIs and tests: R1 and R2 below. |
| 6. Metadata | Pass. The file is exactly the single line `topic = "math.NT"` followed by a newline; number theory fits the roadmap. |

The audit used the accepted packet, its review history, the reviewed AA.0–AA.5 library audit, the relevant link maps and the upstream tier order. The CompactGroups layer-0 link supplies Haar probability on compact open factors; it does not define an ambient noncompact Haar measure by extending zero. The package makes this distinction. ReductiveGroupsPartII supplies the algebraic structures and lower-tier interfaces; the package replaces FoundationsAndLibraryIntegration and UPSTREAM references with their actual suppliers.

## R1 — Required declarations remain inside a comment

PROTOCOL.md §§13 and 20 require signatures for the definitions/constructions, named theorems, API lemmas and unit-test examples. The standard introductory note that Suggested.lean is not exhaustive does not override these package requirements. The final mathematical interface catalogue starts at line 4628 and ends inside the same block comment. A contract there has no declaration that Lean checks.

The following are **explicit omissions acknowledged by that catalogue**, counted against the 264 accepted targets. A target counted as having a native signature can still be incomplete, as in R2; these counts are therefore a lower bound on what needs revision.

| Layer | Definition/construction targets omitted | Lemma/theorem targets omitted | API items omitted | Tests omitted |
| --- | ---: | ---: | ---: | ---: |
| AA.0 | 0 | 0 | 0 | 0 |
| AA.1 | 1 | 3 | 4 | 3 |
| AA.2 | 3 | 16 | 17 | 12 |
| AA.3 | 8 | 42 | 37 | 25 |
| AA.4 | 2 | 26 | 8 | 9 |
| AA.5 | 0 | 0 | 0 | 0 |
| Total | 14 | 87 | 66 | 49 |

The omitted definitions include Weil-restriction comparisons, parabolic modulus, central-character L², Artin convergence factors, relative parabolic/chamber data, admissible compacts, Iwasawa logarithms, Siegel sets, the simply connected image and the residual quotient. They are prerequisites for many of the omitted theorem targets, rather than dispensable alternative examples. The full omission index below identifies the next revision's work without relying on this worker's scratch files.

**Required revision:** introduce or consume the genuine structural supplier interfaces, then state the affected definitions, API lemmas, tests and theorems as active Lean. Keep the accepted hypotheses. An arbitrary proposition, topology, representation or equivalence would erase the mathematical content and cannot replace the missing structure. Re-run the complete file after this work.

## R2 — Some active interfaces cover only part of their target

1. **AA.2/left-right-quotient-inversion.** `QuotientMeasure.inversionHomeomorph` and its value on representatives specify the topological inversion map. Neither states preservation of the correspondingly normalized fundamental-domain quotient measures or the transport of the unfolding formula. The catalogue itself says that this remains a contract. Add the measure-transport theorem with unimodularity, discrete countable subgroup, Haar normalization and the actual quotient measures.
2. **AA.5/gl2-congruence-component-groups** and **AA.5/gl2-level-riemann-surfaces.** The active arithmetic subgroup, finite-index, continuous-map and homeomorphism declarations are useful. A continuous map or homeomorphism does not state the coarse Riemann-surface structure, independence of the chosen representatives, holomorphy of level maps or biholomorphy of translations. These portions occur only in docstrings and in the final two catalogue entries. Use the FuchsianOrbifolds layers 0–1, 4 and 5 interfaces and state these portions explicitly.
3. **AA.2/split-centre.** `SplitComponent` has the type of a subgroup; its active API specifies centrality, placement at infinity and the logarithmic decomposition. The identification with the identity component of the real points of the largest ℚ-split central torus of the Weil restriction is only in its docstring. Connect this carrier to the RG2.0a/RG2.1 algebraic construction. The abstract properties alone do not specify the planned algebraic owner.

These are additional obligations; the omission totals in R1 must not be read as a certificate that every remaining target is fully expressed.

## Clear defects corrected in this review

The fixes below change Suggested.lean only. The corresponding README mathematics was already correct.

- **Quotient integration in stages.** The former `QuotientMeasure.lintegral_trans` integrated a function on G over G, then inserted both an H₂ Haar integral and an H₁ Haar integral. For G = H₁ = H₂ = C₂ with counting Haar and constant function 1, its first asserted equality gives 2 = 4. The corrected signature integrates a function on H₁\G through H₂\G and H₁\H₂. It transports the H₁ Haar measure through the canonical subgroup-in-subgroup homeomorphism. Arthur §1, p. 9, gives this quotient-in-stages normalization.
- **Projection covolume.** `Approximation.exists_finite_invariant_measure_projection` now uses the canonical Borel quotient spaces and requires regularity of the input finite invariant measure; its output is also regular. Previously arbitrary measurable-space instances and the absence of regularity failed to express the lattice/Radon hypotheses. The continuous equivariant projection is the finite-covolume step of Rapinchuk §2.6, pp. 16–17; the measure regularity is part of the accepted target.
- **Arithmetic quotient volume.** `Reduction.arithmeticQuotient_finite_volume` now asks for a nonzero finite regular measure invariant under the actual right translations. The earlier existence of an arbitrary nonzero finite measure could be satisfied by a Dirac measure on any nonempty quotient and did not assert finite invariant covolume. The canonical Borel structure is retained. See Borel Theorems 5.6 and 5.8, pp. 21–22, and the target's lattice convention.
- **Hecke index.** `LevelMaps.card_doubleCoset_cosets` now assumes that U ∩ gUg⁻¹ has finite index **inside U**, through `subgroupOf U`. The former instance required finite index in the whole ambient G. Compact open levels in an adelic group generally have infinite ambient index, so that hypothesis excluded the intended application. The conclusion remains the relative-index formula of the accepted AA.4 target.
- **Quaternion parameters.** The local, real and global reduced-norm signatures now require both rational Hilbert parameters to be nonzero. With a = b = 0 the displayed norm is the square of the real coordinate; the real/global statement formerly asserted that −1 was represented, and the local statement over ℚ₃ falsely represented 2. Nonzero parameters express the quaternion-algebra scope already in the README. Khayutin §2.3, arXiv v3 pp. 15–16, works with a quaternion algebra and gives the local/global norm images.

These signatures still use `sorry` as required for planning. Compilation validates their Lean forms, not their mathematical proofs.

## Source and ownership checks

Direct source checks covered Borel Theorems 5.6 and 5.8, pp. 21–22; Arthur §1, pp. 7–9 (quotient measures and transitivity); Bekka–de la Harpe–Valette Appendix B.1, Theorems B.1.1–B.1.2, Lemma B.1.3 and Corollary B.1.7, pp. 340–350 (Haar and quotient measure conditions); Conrad Theorem 3.6 and its proof, preprint pp. 6–9 (adelic point comparisons); Milne Proposition 4.1, pp. 42–43, Lemma 5.13, pp. 57–58, the right-translation map on p. 58, and the component calculation on p. 63; Rapinchuk §2.6, pp. 16–17 (the ℚ single-isotropic-prime argument); Lipnowski–Tsimerman §3.2, pp. 11–16 (lattice stabilizers and level-counting context); and Khayutin §2.3, pp. 15–16 (quaternion norm images). The mass identity is a finite orbit–stabilizer derivation, as the README says; it is not attributed as a displayed theorem of Lipnowski–Tsimerman. Likewise the general native-field and anisotropic arithmetic steps are distinguished from Rapinchuk's special-case argument. This review does not certify proofs of those larger recorded inputs by citing the special case.

**The README AA.5.2 targets fully replace the old R12.2 request** for the analytic Γ(N)/Γ₀/Γ₁ quotient identifications as analytic spaces with functorial action. They specify the complex structures, standard-level identifications, level maps and translations. The next packet revision can drop `requests[].supplier = ModularCurvesPartII:R12.2` for this need. This answers the maintainer's 2026-10-09 note on #7501; the active Lean complex-analytic portions remain incomplete as recorded in R2.

**Ownership move to retain:** AA.5 owns the analytic congruence-component identification and its change-of-level complex maps. The accepted plan's `AA.5/gl2-upper-half-plane-component` still cites `ModularCurvesPartII:R12.2`, an upward tier dependency. WORKERS.md requires the relevant notion to move down. The package's two extra analytic targets implement that move, with FuchsianOrbifolds as supplier. Algebraic modular-curve uniformization remains in ModularCurvesPartII. Its higher-tier plan should import the analytic results from AA.5; the package review does not edit either plan.

## Verification

- `lean-check research/blueprint/packages/AdelicAlgebraicGroups/Suggested.lean`: exit 0 after corrections; zero errors, 542 warnings, all uses of `sorry`. Run in the supplied shared build; Mathlib pin 082e2d37e8b0463410cdb532e111cd43d5a66174, Tau Ceti pin f790474821cf4256814db967cb154e7af3d0c369 as specified by the worker build.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AdelicAlgebraicGroups.json`: zero errors and zero warnings. The accepted packet is unchanged.
- Reader size, exact metadata, review JSON schema, deliverable-only paths and whitespace checked before submission.
- SHA-256 of the Lean file checked: `f212d7ad0867b57bd65457d6df9c1d02c33c0da1addee55b82561309ff20754c`.

## Complete omission index

IDs below omit the common `AdelicAlgebraicGroups:` prefix. They are the catalogue's explicitly absent native declarations, not quotations from the mathematical sources.

### Definition/construction targets

- **AA.1**: `AA.1/base-change-adelic`.
- **AA.2**: `AA.2/central-character-l2`, `AA.2/convergence-factors`, `AA.2/modulus-character`.
- **AA.3**: `AA.3/H-P`, `AA.3/adelic-siegel-set`, `AA.3/good-maximal-compact`, `AA.3/horospherical-decomposition`, `AA.3/minimal-parabolic-data`, `AA.3/positive-root-coordinates`, `AA.3/real-siegel-set`, `AA.3/relative-chamber`.
- **AA.4**: `AA.4/plus-subgroup`, `AA.4/residual-quotient`.

### Lemma/theorem targets

- **AA.1**: `AA.1/base-change-local-factors`, `AA.1/weil-restriction-naturality`, `AA.1/weyl-orbit-product-central`.
- **AA.2**: `AA.2/artin-factor-induction`, `AA.2/central-associated-line`, `AA.2/central-character-extension-twist`, `AA.2/central-l2-completeness`, `AA.2/central-measurable-section`, `AA.2/central-product-closed`, `AA.2/central-quotient-change`, `AA.2/gauge-form-restriction-discriminant`, `AA.2/modular-function-parabolic`, `AA.2/rational-characters-free`, `AA.2/restriction-finite-jacobian`, `AA.2/restriction-global-jacobian`, `AA.2/restriction-infinite-jacobian`, `AA.2/tamagawa-convergence`, `AA.2/tamagawa-restriction-scalars`, `AA.2/weil-volume-formula`.
- **AA.3**: `AA.3/adelic-iwasawa`, `AA.3/adelic-iwasawa-factorization`, `AA.3/cartan-subgroup-criterion`, `AA.3/closed-orbit-finiteness`, `AA.3/closed-orbit-lattice-finite`, `AA.3/closed-orbit-realization`, `AA.3/closed-orbit-weight-bound`, `AA.3/compactness-anisotropic`, `AA.3/containment-compact-factors`, `AA.3/containment-finite-root-cones`, `AA.3/containment-parabolic-torus`, `AA.3/containment-weyl-representatives`, `AA.3/cusp-separation`, `AA.3/deep-cusp-stabilizer`, `AA.3/deep-distinct-parabolics`, `AA.3/finite-part-denominator-bound`, `AA.3/finitely-many-cusps`, `AA.3/gln-adelic-covering`, `AA.3/gln-real-overlap`, `AA.3/height-siegel-estimate`, `AA.3/incompatible-morphism-obstruction`, `AA.3/iwasawa-integration-compact`, `AA.3/local-height-polynomial`, `AA.3/orbit-map-siegel-image`, `AA.3/orbit-map-siegel-preimage`, `AA.3/orr-schnell-containment`, `AA.3/parabolic-double-cosets-finite`, `AA.3/parabolic-haar-jacobian`, `AA.3/positive-root-cone-integral`, `AA.3/rational-siegel-pullback`, `AA.3/real-siegel-finite-cover`, `AA.3/real-siegel-finite-overlap`, `AA.3/real-siegel-translation`, `AA.3/reduction-siegel-dictionary`, `AA.3/s-arithmetic-lattice`, `AA.3/self-adjoint-reduction`, `AA.3/semidirect-class-number`, `AA.3/siegel-convention-comparison`, `AA.3/siegel-covering-adelic`, `AA.3/siegel-finiteness-adelic`, `AA.3/siegel-set-finite-measure`, `AA.3/simultaneous-self-adjointness`.
- **AA.4**: `AA.4/abelianization-adelic-surjective`, `AA.4/abelianization-integral-lifts`, `AA.4/arithmetic-finite-index-elimination`, `AA.4/arithmetic-finite-product-openness`, `AA.4/arithmetic-native-lie-closure`, `AA.4/borel-density`, `AA.4/class-set-abelianization`, `AA.4/cover-integral-image`, `AA.4/diagonal-coset-limit`, `AA.4/hasse-principle-simply-connected`, `AA.4/isotropic-almost-everywhere`, `AA.4/isotropic-place-closure`, `AA.4/kneser-local-torsor`, `AA.4/level-map-fibre-mass`, `AA.4/level-volume-index`, `AA.4/quotient-volume-decomposition`, `AA.4/reduced-norm-components`, `AA.4/residual-joint-limit`, `AA.4/s-arithmetic-nondiscrete`, `AA.4/strong-approximation-finite-places`, `AA.4/strong-approximation-necessity`, `AA.4/strong-approximation-sufficiency`, `AA.4/strong-approximation-theorem`, `AA.4/torus-image-residual`, `AA.4/weak-approximation-simply-connected`, `AA.4/zariski-dense-closure-open`.

### API items

- `AA.1/base-change-adelic`: `AdelicPoints.resEquiv`, `AdelicPoints.resEquiv_diagonal`, `AdelicPoints.resEquiv_natural`, `AdelicPoints.resEquiv_trans`.
- `AA.2/central-character-l2`: `CentralCharL2`, `CentralCharL2.rightReg`, `CentralCharL2.rightReg_central`, `CentralCharL2.inner_def`, `CentralCharL2.continuous_rightReg`.
- `AA.2/convergence-factors`: `Tamagawa.localFactor`, `Tamagawa.localFactor_trivial`, `Tamagawa.leadingCoeff`, `Tamagawa.leadingCoeff_split`.
- `AA.2/modulus-character`: `Parabolic.modulus`, `Parabolic.modulus_apply_local`, `Parabolic.modulus_rational`, `Parabolic.modulus_unipotent`, `Parabolic.modulus_eq_exp_rho`.
- `AA.2/tamagawa-measure`: `Tamagawa.measure_eq_product`, `Tamagawa.measure_res`.
- `AA.2/tamagawa-number`: `Tamagawa.number_res`.
- `AA.3/H-P`: `Reduction.HP`, `Reduction.HP_nmk`, `Reduction.HP_left_P`, `Reduction.continuous_HP`, `Reduction.HP_rational`.
- `AA.3/adelic-siegel-set`: `Reduction.siegelSet`, `Reduction.mem_siegelSet`, `Reduction.siegelSet_mono`, `Reduction.siegelSet_mul_K`, `Reduction.siegelSet_center`.
- `AA.3/good-maximal-compact`: `Reduction.AdmissibleCompact`, `Reduction.AdmissibleCompact.toSubgroup`, `Reduction.AdmissibleCompact.isCompact`, `Reduction.AdmissibleCompact.exists`.
- `AA.3/horospherical-decomposition`: `RealSiegel.HoroData`, `RealSiegel.horoDecomp_left_mul`, `RealSiegel.horoDecomp_conj`, `RealSiegel.horoDecomp_change_K`.
- `AA.3/minimal-parabolic-data`: `Reduction.MinimalParabolic`, `Reduction.StandardParabolic`, `Reduction.standardParabolic_equiv_subsets`, `Reduction.exists_unique_standard_conj`, `Reduction.StandardParabolic.le_iff`.
- `AA.3/positive-root-coordinates`: `RealSiegel.HoroData.simpleRoots`, `RealSiegel.truncatedTorus`, `RealSiegel.cornerCoord`, `RealSiegel.cornerCoord_truncated`.
- `AA.3/real-siegel-set`: `RealSiegel.siegelSet`, `RealSiegel.mem_siegelSet`, `RealSiegel.siegelSet_mono`, `RealSiegel.siegelSet_quotient`.
- `AA.3/relative-chamber`: `Reduction.aP`, `Reduction.aPProjection`, `Reduction.aP_decomp`, `Reduction.rho`, `Reduction.simpleRoots`, `Reduction.positiveChamber`.
- `AA.4/plus-subgroup`: `Approximation.plusSubgroup`, `Approximation.plusSubgroup_normal`, `Approximation.commutator_le_plusSubgroup`, `Approximation.plusSubgroup_gln`.
- `AA.4/residual-quotient`: `Approximation.residualQuotient`, `Approximation.residualQuotient.commGroup`, `Approximation.residualQuotient.piPlus`, `Approximation.residualQuotient.piPlus_rational`.

### Unit tests

- `AA.1/base-change-adelic`: `AdelicPoints.resEquiv_gm`, `AdelicPoints.resEquiv_self`, `AdelicPoints.res_not_base_change`.
- `AA.2/central-character-l2`: `CentralCharL2.trivial_X`, `CentralCharL2.gl1_dim`, `CentralCharL2.nontrivial_on_rational`.
- `AA.2/convergence-factors`: `Tamagawa.localFactor_gm`, `Tamagawa.localFactor_semisimple`, `Tamagawa.localFactor_res_gm`.
- `AA.2/invariant-top-form`: `GaugeForm.borel_not_biinvariant`.
- `AA.2/modulus-character`: `Parabolic.modulus_borel_gl2`, `Parabolic.modulus_top`, `Parabolic.modulus_not_det`.
- `AA.2/rational-characters`: `RationalCharacter.res_norm`.
- `AA.2/real-character-space`: `RealCharacterSpace.res_gm_rank`.
- `AA.3/H-P`: `Reduction.HP_gl2_borel`, `Reduction.HP_top`, `Reduction.HP_not_homomorphism`.
- `AA.3/adelic-siegel-set`: `Reduction.siegelSet_sl2`, `Reduction.siegelSet_anisotropic`, `Reduction.siegelSet_not_fundamental_domain`.
- `AA.3/good-maximal-compact`: `Reduction.AdmissibleCompact.gln`, `Reduction.AdmissibleCompact.anisotropic`, `Reduction.AdmissibleCompact.not_all_places_iwahori`.
- `AA.3/horospherical-decomposition`: `RealSiegel.horoDecomp_sl2`, `RealSiegel.horoDecomp_trivial_parabolic`, `RealSiegel.horoDecomp_not_right_action`, `RealSiegel.horoDecomp_change_K_sl2`.
- `AA.3/minimal-parabolic-data`: `Reduction.standardParabolic_gl3_card`, `Reduction.standardParabolic_anisotropic`, `Reduction.standardParabolic_not_all_parabolics`.
- `AA.3/positive-root-coordinates`: `RealSiegel.simpleRoots_sl2`, `RealSiegel.simpleRoots_minimal_rank`, `RealSiegel.simpleRoots_not_all_roots`.
- `AA.3/real-siegel-set`: `RealSiegel.siegelSet_sl2`, `RealSiegel.siegelSet_anisotropic`, `RealSiegel.siegelSet_needs_fixed_K`.
- `AA.3/relative-chamber`: `Reduction.rho_gl2`, `Reduction.aP_top`, `Reduction.positiveChamber_not_cone_of_all_roots`.
- `AA.4/hecke-correspondence`: `LevelMaps.hecke_not_symmetric`.
- `AA.4/level-quotient-groupoid`: `LevelMaps.levelGroupoid_sl2_i`, `LevelMaps.levelGroupoid_not_space`.
- `AA.4/plus-subgroup`: `Approximation.plusSubgroup_sln`, `Approximation.plusSubgroup_pgl2_quotient`, `Approximation.plusSubgroup_not_derived_points`.
- `AA.4/residual-quotient`: `Approximation.residualQuotient_sl2`, `Approximation.residualQuotient_pgl2`, `Approximation.residualQuotient_not_G_mod_plus`.

## Public source records

All PDF copies listed here were accessed on 2026-10-09 for this review. SHA-256 identifies the checked edition; the files themselves are not submitted. No passage from a source is reproduced in the package or this report.

- [arthur](https://www.claymath.org/library/cw/arthur/pdf/62.pdf): `2b6623010ce5d854732458dfb5e61600a4e6cc7288629a72cb63d5f7530ac510`.
- [bhv](https://perso.univ-rennes1.fr/bachir.bekka/KazhdanTotal.pdf): `0281823290dfb42efc0542705b4f232f9e3d9186e945914ffb65b59db790c889`.
- [conrad](https://math.stanford.edu/~conrad/papers/adelictop.pdf): `fe4a9193aff4ef575665b40971f3da32f850a74d87b3f2d0fa28bba26b9cbabb`.
- [milne](https://www.jmilne.org/math/xnotes/svi.pdf): `f637e61735ff9cf9730c43d978d8f05185685a37d5e1920fc3347061c83d7c7e`.
- [rapinchuk](https://arxiv.org/pdf/1207.4425): `43f6a45ceb9e51e1ca959c0d0574474cb1c20ea5a4e13852eee1886aceadab97`.
- [lt](https://arxiv.org/pdf/1511.02212v1): `5ceed8168ce37b75da67699189e7e8730527c31f3339dce979a1a1901243f81a`.
- [khayutin](https://arxiv.org/pdf/1710.04557v3): `f740c4200434b0989bb6f728e4a385769b669320eec94ee8ace0e34279a53eb9`.
- [borel](https://www.numdam.org/item/PMIHES_1963__16__5_0.pdf): `678a378a947a25edd682942539cc9d22de47e8e141db0a19dd124e5138d2fedc`.
