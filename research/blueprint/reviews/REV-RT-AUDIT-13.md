# Review: RT-AUDIT-13 (red team of the library audit AUDIT-13)

Job `REV-RT-AUDIT-13` (issue #1575), by Claude Code, session `cc-39fac3`, 24 September 2026.

**Independence.** The verifier did none of AUDIT-13, REV-AUDIT-13 or RT-AUDIT-13. The red team was written by session cc-2aeb03, and the audit by the 17 September swarm lanes.

**Method.** Three verifiers split the 54 findings by roadmap:
- AdelicAlgebraicGroups and AlgebraicModularFormsAndSerreWeights (1–19);
- ArithmeticLocallySymmetricSpaces and AutomorphicBundles (20–40);
- AutomorphicFormsOnReductiveGroups (41–54).

Each checked every finding at its evidence: the declaration at Mathlib 082e2d3 or Tau Ceti f790474, the atlas stage text, the audit entry, and the accepted restructurings, link maps and audits that might already settle it.

## Verdicts

**52 confirmed and 2 rejected** out of 54. The confirmed high and medium findings go to the fix job: 1, 2, 4, 5, 6, 11, 12, 20, 21, 22, 23, 24, 32, 33, 34, 41, 43, 44.

| Finding | Kind | Severity | Verdict |
| --- | --- | --- | --- |
| 1 | library-claim | high | confirmed |
| 2 | library-claim | medium | confirmed |
| 3 | library-claim | low | confirmed |
| 4 | duplicate | medium | confirmed |
| 5 | duplicate | medium | confirmed |
| 6 | duplicate | medium | confirmed |
| 7 | duplicate | low | confirmed |
| 8 | other | low | confirmed |
| 9 | other | low | confirmed |
| 10 | error | low | confirmed |
| 11 | library-claim | medium | confirmed |
| 12 | duplicate | medium | confirmed |
| 13 | duplicate | low | confirmed |
| 14 | duplicate | low | rejected |
| 15 | library-claim | low | confirmed |
| 16 | library-claim | low | confirmed |
| 17 | library-claim | low | confirmed |
| 18 | library-claim | low | confirmed |
| 19 | library-claim | low | confirmed |
| 20 | library-claim | medium | confirmed |
| 21 | library-claim | medium | confirmed |
| 22 | missing | medium | confirmed |
| 23 | missing | medium | confirmed |
| 24 | duplicate | medium | confirmed |
| 25 | missing | low | confirmed |
| 26 | missing | low | confirmed |
| 27 | missing | low | confirmed |
| 28 | missing | low | confirmed |
| 29 | missing | low | confirmed |
| 30 | duplicate | low | confirmed |
| 31 | other | low | confirmed |
| 32 | missing | medium | confirmed |
| 33 | duplicate | medium | confirmed |
| 34 | duplicate | medium | confirmed |
| 35 | library-claim | low | confirmed |
| 36 | missing | low | confirmed |
| 37 | missing | low | confirmed |
| 38 | missing | low | confirmed |
| 39 | missing | low | confirmed |
| 40 | other | low | confirmed |
| 41 | library-claim | medium | confirmed |
| 42 | duplicate | medium | rejected |
| 43 | library-claim | medium | confirmed |
| 44 | error | medium | confirmed |
| 45 | missing | low | confirmed |
| 46 | missing | low | confirmed |
| 47 | missing | low | confirmed |
| 48 | library-claim | low | confirmed |
| 49 | missing | low | confirmed |
| 50 | missing | low | confirmed |
| 51 | missing | low | confirmed |
| 52 | duplicate | low | confirmed |
| 53 | duplicate | low | confirmed |
| 54 | duplicate | low | confirmed |

### Points the fix job should note

- **Finding 1 (high)** is confirmed. Mathlib topologizes the points of affine schemes over 𝔸 (`Mathlib/Algebra/Category/Ring/Topology.lean:50`), and GL_n(𝔸), SL_n(𝔸) and 𝔸ˣ are topological groups. The fix should cite the anonymous instances by file and line, since they are not in the declaration index. For the same reason, finding 44's new note must not say that G(𝔸) has no topology.
- **Rejected:**
  - 14: accepted RS-06 and AUDIT-31 already route the tame character through R01.2 to LocalFieldsRamification layer 4.
  - 42: the accepted LieGroups link map already records LieGroups layers 5 and 9 as suppliers of AF.0/AF.1a. A supplier is not a duplicate.
- **Fixes the verifiers corrected:**
  - fit labels 'related', not 'special case': findings 20, 26, 47;
  - record stages as suppliers rather than duplicates: 12, 52;
  - add B5: 6;
  - qualifiers for corestriction and the cup product: 48;
  - scope: 29 claims too much;
  - optional listing: 34;
  - boundary collars, not corner collars: 24;
  - full theorem name: 38;
  - cross-references: 40.

## Reasons, finding by finding

### 1. library-claim, high: **confirmed**

All evidence checks out at 082e2d3. Mathlib/Algebra/Category/Ring/Topology.lean:50 is the scoped TopologicalSpace (A ⟶ R) instance, induced from A → R. The same file has continuous_precomp :64, isClosedEmbedding_precomp_of_surjective :94 [T1Space R], isClosedEmbedding_hom :128, the T2Space and CompactSpace instances :141/:144, and isEmbedding_pushout :151. Mathlib/Topology/Algebra/Constructions.lean:101 puts the embedProduct topology on Mˣ. Topology/Algebra/Group/Units.lean:102 makes Mˣ a topological group when M has ContinuousMul, so GL n 𝔸 and 𝔸ˣ are topological groups; IdeleGroup is the abbrev 𝔸[R,K]ˣ at NumberField/AdeleRing.lean:93. Topology/Algebra/Group/Matrix.lean has isTopologicalGroup for SL at :125, isClosedEmbedding_toGL [T0Space] at :159, continuous_det at :60 and the functoriality lemmas at :41/:55/:94. So the AA.1 notes 'Missing: any topology on G(𝔸)' and 'G(𝔸) carries no topology in either library', and the summary's 'with no topology', are false as stated. The standard topology on the points of an affine scheme over 𝔸 exists, and GL_n(𝔸), SL_n(𝔸) and 𝔸ˣ are topological groups. Without the correction AA.1 would plan to rebuild what exists, so high is justified. Tau Ceti's pointsFunctor (PointsFunctor.lean:104) and pointsMulEquiv (GeneralLinear/FunctorOfPoints.lean:232) are as stated. The fix is right with one correction. The instances at Ring/Topology.lean:50 and Units.lean:102 are anonymous and absent from the pinned declaration index, so 'CommRingCat.HomTopology' is a namespace, not a citable declaration. The fixer must cite them by file:line with their generated instance names, or cite the named neighbours CommRingCat.HomTopology.isEmbedding_hom (:59) and isClosedEmbedding_hom (:128).

### 2. library-claim, medium: **confirmed**

Every cited declaration exists at the pins and says what the finding claims. Mathlib/NumberTheory/Modular.lean has fd :367, exists_smul_mem_fd :426, three_le_four_mul_im_sq_of_mem_fd :400, exists_max_im :278, cases_of_mem_fd_smul_mem_fd :695 and isCompact_truncatedFundamentalDomain :960. ModularForms/Cusps.lean:204 has the Finite (CuspOrbits 𝒢) instance for arithmetic 𝒢, and UpperHalfPlane/Measure.lean:89 has SMulInvariantMeasure (GL (Fin 2) ℝ) ℍ volume. Tau Ceti NumberTheory/Modular.lean has volume_fd_lt_top :112, isFundamentalDomain_fdo :230 and isFundamentalDomain_iUnion_out_inv_smul_fdo :257. None of these names occurs in AUDIT-13.result.json. AA.3 plans the general-G versions (atlas AA.3 text). The audit itself upgraded AA.4's strong approximation to partial on the SL₂/ℚ congruence case and marked AA.2's product formula partial on GL₁ alone. Leaving the SL₂(ℤ) reduction-theory and finite-volume results uncited under 'absent' is therefore inconsistent. The fix is right.

### 3. library-claim, low: **confirmed**

Tau Ceti f790474 RayClass/Finite.lean:154 is instance finite_rayClassGroup (𝔪 : Modulus K). NarrowClassGroup/Finite.lean:38 is NumberField.NarrowClassGroup.instFinite. So the GL₁ case holds at every level, not only at level Ô^× as the AA.3 note ('Only the GL_1 shadow ... ideal class group') suggests. The target's `absent` label is inconsistent with AA.2's product-formula target, which is `partial` on GL₁ citations alone. Mathlib DirichletTheorem.lean:374 instZLattice_unitLattice (with :361 discreteness) is a fair `related` citation for the anisotropic norm-one torus. The fix is right. Low.

### 4. duplicate, medium: **confirmed**

AF.0's atlas text plans 'height functions from faithful embeddings ... polynomial comparability ... independence of the moderate-growth condition'. That is AA.3's 'moderate-growth estimates under changes of faithful representation'. AUDIT-13 already records AF.0 → AA.3 ('the growth-estimate targets overlap') but not the reverse. GN.3 plans 'reduction domains and arithmetic quotients', and the accepted AUDIT-02 records GN.3 → AA.3. AA.3's duplicates list only V0, R.1, AF.3 and GlobalNumberFields layer 6. No accepted restructuring settles either pair: RS-04 has no review, and RS-06 touches only AA.5. The fix is right. AF.0 already requires AA.3, so its note should say 'consumer that restates the estimates'.

### 5. duplicate, medium: **confirmed**

Each omission is recorded from the other side by an accepted audit. AUDIT-09 has RP.2 → AA.1, and RP.2 plans 'restricted adelic point spaces' without depending on AA. AUDIT-04 has GlobalNumberFields layer 8 → AA.1: layer 8 plans adeleBaseChangeEquiv : 𝔸_K ⊗_K L ≃A[𝔸_K] 𝔸_L, so the audit's base-change note ('no ... identification 𝔸_E ≅ E ⊗_F 𝔸_F') omits a planned owner. AUDIT-04 also has GlobalNumberFields layer 5 → AA.1 for discreteness of K in 𝔸_K. AA.1's duplicates list only D0 and RG2.0a (AUDIT-13 AA.1). No accepted RS settles these, since RS-04 is unreviewed. The fix is right.

### 6. duplicate, medium: **confirmed**

Verified in the atlas and the accepted audits. V1 plans level maps, neat-level coverings and the K∩gKg⁻¹ Hecke correspondence, and AUDIT-11 records V1 → AA.4. ALS.3 plans the finite-level maps with stabilizer factors, and AUDIT-13 itself records ALS.3 → AA.4. CC.0 plans the covering correspondences and stabilizer models, and AUDIT-14 records CC.0 → AA.4. D5 'Define[s] neatness'. GlobalNumberFields layer 1 is weakApproximation_denseRange, which AA.4 cites, and AUDIT-04 records layer 1 → AA.4. AA.4's duplicates list only V0 and GlobalNumberFields layer 6. The fix is right. D5 is better recorded as the supplier of the neatness definition than as a duplicate. The fixer should also add AutomorphicBundles:B5, which AUDIT-13 records as B5 → AA.4 with no reverse entry.

### 7. duplicate, low: **confirmed**

AUDIT-13 AF.5's duplicates contain AA.5 ('the same two validation comparisons'), but AA.5's duplicates (R12.2, V0, GlobalNumberFields layer 6) do not contain AF.5. The atlas AF.5 requires AF.3, AF.4 and ModularCurvesPartII:R12.5, not AA.5, and plans the GL₁ and GL₂/ℚ dictionaries. The fix is right. Low.

### 8. other, low: **confirmed**

Checked Mathlib RestrictedProduct/TopologicalSpace.lean at 082e2d3. (a) isOpen_forall_mem at :368 is only {f | ∀ i, f i ∈ A i}, so the note's 'C i = A i cofinitely' misstates it. (b) continuous_rng_of_principal_iff_forall at :228 is stated for Πʳ[R i, A i]_[𝓟 S] only. (c) isTopologicalRing at :610 needs Ring and SubringClass, so it is not 'more general' than the group statement. The fix is right. For (a), a more direct route than isOpenEmbedding_inclusion_principal is isOpen_forall_imp_mem (:362), which gives openness off a finite set, intersected with preimages under continuous_eval (:158) at the finitely many exceptional places; the note may name either route. Low.

### 9. other, low: **confirmed**

Mathlib 082e2d3 NumberTheory/HeckeRing/Defs.lean defines IsHeckeTriple (:75) and HeckeRing (:189) for an arbitrary group G (variable {G} [Group G]), following Shimura Ch. 3. Tau Ceti HeckeRing/Associativity.lean:485 is HeckeCosetModule.instRingHeckeRing under [IsHeckeTriple Δ H H], and the GL2 and GLn instances live in subdirectories. So 'a classical Hecke ring for GL_2 and GL_n double cosets' understates it, and AUDIT-13's own ALS.3 entry already cites IsHeckeTriple. The other citations are also as claimed: FundamentalDomain.lean:232 iUnion_mul_smul_of_transversal, and Mathlib CategoryTheory/Action.lean ActionCategory :48, its Groupoid instance :144 and stabilizerIsoEnd :103. The fix is right. Low.

### 10. error, low: **confirmed**

Case-insensitive `git grep 'modularcurve|modular curve'` returns nothing in Mathlib 082e2d3 and in Tau Ceti f790474 .lean files. The only orbit quotients of ℍ are by SL(2, ℤ) (TauCeti/NumberTheory/Modular/Orbits.lean:62 exists_rep_mem_fd, and Stabilizer.lean). So the AA.5 note's 'modular curves at level Γ(N)' is false. FundamentalDomain.lean:128 subgroup_iUnion_out_inv_smul is the [G : H]-fold tiling as claimed. The analytic modular curve exists only as a planned stage (ModularForms#10a, routed to AA.5 by RS-06). The fix is right. Low.

### 11. library-claim, medium: **confirmed**

Verified at f790474. CharacterLattice/Basic.lean:67 has geometricCharacterGroup = GroupLike k̄ (k̄ ⊗[k] H). Functoriality.lean:212 has geometricCharacterFunctor : CommHopfAlgCat k ⥤ Rep ℤ (Field.absoluteGaloisGroup k); the representation is at :152, not :151. Continuous.lean:135 has the continuity instance. CartierDuality/BaseChange.lean has baseChangeFunctor :93 and coordinateHopfAlgebraBaseChangeNatIso :150, and FiniteLocallyFree.lean has the category :129 and cartierDuality :232. For finite commutative G, the group-like elements of k̄ ⊗ O(G) are G^D(k̄). Cartier duality is an equivalence, so 'ρ̄|G_ℚ₂ ≅ X*(G_ℚ₂) for some G in FiniteLocallyFreeCommAffineGroupSchemeCat ℤ₂' states the finite-flat condition with existing carriers. Hence the note's 'cannot be stated' is false. The summary's 'two carriers' omits this one. Target stays absent. The fix is right. Medium is justified, because the false claim invites rebuilding a Galois-module functor that already exists.

### 12. duplicate, medium: **confirmed**

ModularForms layer 8 names Deligne–Serre 1974 Prop 2.7, 'the integral-q-expansions-at-all-cusps lattice argument', as the 8W route. Its text contains no lift, mod-p, residual or eigensystem statement. R19.1 requires R15.5 and only 'Construct[s] the weight-one Artin representation in the Deligne–Serre setting'. ML.1 'Organize[s] Deligne-Serre Artin representations'. No atlas stage other than R15.5 plans the lifting lemma. The accepted RS-06 agrees: R15.5 'Own[s] Deligne–Serre Lemme 6.11', and 'Prop. 2.7/anchor 8W constructs the integral weight-one lattice; Lemme 6.11 is a distinct general lifting argument'. RS-06 lists layer 8 in R15.5's suppliedBy. So the three duplicates are wrong as stated. Refinement to the fix: reword the layer-8 entry as a supplier (per RS-06) rather than just deleting it, and reword R19.1 and ML.1 as consumers or weight-one overlaps, as the finding proposes.

### 13. duplicate, low: **confirmed**

AUDIT-13 records B4 → R15.1 ('constructs geometric weight-k forms as sections of a power of the Hodge bundle') and B5 → R15.2 ('q-expansion principle at all cusps'). R15.1's duplicates are R12.5, H5, R35.2 and C2, and R15.2's are R13.3, L0, ModularForms layer 8 and L3, so neither lists the reverse. The atlas B4 text includes the GL₂ Hodge-line comparison, and B5 includes the expansion principle and composition against the abstract Hecke algebra. No accepted RS covers AutomorphicBundles against R15: RS-06's members exclude AutomorphicBundles. The fix is right. Low.

### 14. duplicate, low: **rejected**

The facts are right: LocalFieldsRamification layer 4 plans the tame character I_K/P_K ≅ Ẑ^{(p')}(1). But accepted work already settles the ownership. The accepted RS-06 narrows R15.4 so that 'Local tame characters ... are supplier results', supplied by R07.5, R01.2 and R07.1, so R15.4 no longer plans the tame character. R15.4's audit entry already names R01.2 as the stage that 'Constructs tame characters and the fundamental characters'. The accepted AUDIT-31 records R01.2 → LocalFieldsRamification layer 4 ('the tame character I_K/P_K = Z^(p')(1) ... the tame and fundamental characters asked for here'). The link is recorded one step upstream, where the mathematics is owned. Adding it to R15.4 would list as a duplicate a stage that R15.4 does not plan.

### 15. library-claim, low: **confirmed**

Verified at f790474. Affine/RelativeFrobenius.lean:88 is relativeFrobenius : (W.map (frobenius R p)).CoordinateRing →ₐ[R] W.CoordinateRing, over any commutative ring of exponential characteristic p. Isogeny/RelativeFrobenius.lean has relativeFrobeniusIsogeny : Isogeny W (W.map (frobenius F p)) at :150 and degree = p at :213, and its docstring (:82) says 'Verschiebung remain[s]'. The R15.3 note cites only the finite-field Frobenius isogeny. One caveat: Isogeny/Frobenius/Differential.lean:45 pullbackDifferential_frobeniusIsogeny is stated only over a finite field ([Finite F]), and the optional citation should say so. Otherwise the fix is right. Library stays absent. Low.

### 16. library-claim, low: **confirmed**

Mathlib 082e2d3 RamanujanFormula.lean has serreDerivative_E₄ = -3⁻¹•E₆ (:59), serreDerivative_E₆ = -2⁻¹•E₄² (:64), serreDerivative_E₂ (:124) and normalizedDerivOfComplex_E₄ (:135). EisensteinSeries/E2/Summable.lean:107 has hasSum_qExpansion_E2. None of these is cited in AUDIT-13. They are the characteristic-zero inputs to Serre and Swinnerton-Dyer's θ computations, so `related` citations are apt. The fix is right. Libraries stay absent. Low.

### 17. library-claim, low: **confirmed**

Tau Ceti HeckeSlash/Nebentypus/CoefficientFormula.lean:86 proves the full divisor-sum formula a_m(T_n F) = Σ_{d|gcd(m,n)} χ(d) d^{k−1} a_{mn/d²}(F) for m, n ≠ 0, and :114 is the cusp-form version. Nebentypus/Action.lean:293 has heckeRingHomCharSpace : 𝕋 (Delta0 N) (Γ₀Q(N)) ℤ →+* Module.End ℂ (modFormCharSpace k χ). R15.2 cites only the coprime case (Composite.lean:69). The fix's names match the pinned declaration index. Low.

### 18. library-claim, low: **confirmed**

Mathlib 082e2d3 EllipticCurve/VariableChange.lean has variableChange_c₄ :210, variableChange_c₆ :214 and variableChange_Δ :218, over any CommRing, with factors u⁻⁴, u⁻⁶ and u⁻¹². Weierstrass.lean has map_c₄ :263 and map_Δ :273, and Tau Ceti Affine/InvariantDifferential.lean:105 has invariantDifferential over a field. These are the weight laws of level-one forms on Weierstrass models, and R15.1's note does not mention them. The fix is right (related citation, library absent). Low.

### 19. library-claim, low: **confirmed**

Tau Ceti ModularForms/Parity.lean at f790474 proves χ(−1) = (−1)^k: for nonzero forms at :100 (modular) and :110 (cusp), and as the vanishing of mismatched-parity spaces at :119/:125. The R15.4 parity note is just 'Absent.' with no citation, and nothing in AUDIT-13 cites Parity.lean. A `related` citation with the note 'automorphic side only' is apt, also under R15.6. The fix is right. Low.

### 20. library-claim, medium: **confirmed**

All cited declarations exist as quoted at the pinned commits: MulAction.properSMul_of_proper_orbitMap (Mathlib/Topology/Algebra/ProperAction/Basic.lean:291, transitive action + proper orbit map gives ProperSMul), the closed-subgroup ProperSMul instance (Basic.lean:166), properlyDiscontinuousSMul_iff_properSMul (ProperAction/CompactlyGenerated.lean:99, discrete G), UpperHalfPlane.instProperSMul (UpperHalfPlane/ProperAction.lean:122) and the cited instProperlyDiscontinuousSL2RSubgroup, whose proof (:128-132) is exactly isClosed_of_discrete + the iff + infer_instance; isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul (Topology/Covering/Quotient.lean:244), MulAction.instChartedSpaceQuotient (Geometry/Manifold/Instances/Quotient.lean:48), IsQuotientCoveringMap.fundamentalGroupEquiv (Topology/Homotopy/Lifting.lean:690); Tau Ceti TauCeti.isOpen_freeLocus and TauCeti.isQuotientCoveringMap_quotientMk_freeLocus (Topology/Algebra/GroupAction/FreeLocus.lean:62,:76), IsQuotientCoveringMap.isEilenbergMacLaneSpaceOne (AlgebraicTopology/EilenbergMacLane/Covering.lean:149). The ALS.0 target note (AUDIT-13 ALS.0, target 5) describes the free-locus results without citing them and omits the general reduction, so a worker would not see that only properness of the G(F_inf)-action (compact K_inf) and discreteness are missing. Fix is right, with one correction: Subgroup.instIsCyclicStabilizer (Fuchsian/Stabilizer.lean:45) should be fit 'related', not 'special case' (cyclic stabilizers are neither proper discontinuity nor freeness); the special-case citation for the rank-one statement is the Tau Ceti PSL(2,R) instance at TauCeti/Analysis/Complex/Fuchsian/ProperAction.lean:33 (anonymous instance, not in the pinned declaration index). Library value stays partial.

### 21. library-claim, medium: **confirmed**

Checked at the pinned commits: TauCeti.LocalCoefficientSystem R X is FundamentalGroupoid X ⥤ ModuleCat R (TauCeti/AlgebraicTopology/LocalCoefficient.lean:41); TauCeti.Groupoid.singleObjEquivalence : SingleObj (End x₀) ≌ C for a groupoid with morphisms from x₀ to every object (TauCeti/CategoryTheory/Groupoid/SingleObj.lean:108); FundamentalGroup X x := End (mk x) (Mathlib/AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:35); Action.functorCategoryEquivalence (Mathlib/CategoryTheory/Action/Basic.lean:227); Rep.repIsoAction : Rep k G ≌ Action (ModuleCat k) G, stated under [Ring k] (Mathlib/RepresentationTheory/Rep/Basic.lean:508), so it applies to the Ring R of LocalCoefficientSystem. Tau Ceti already composes the same first two equivalences for the Type-valued case (fiberActionEquivalence, UniversalCover/Classification/FundamentalGroupAction.lean:157, docstring states the route). So the ALS.1 target-1 note's 'Missing: the inverse construction of a module-valued local system from a π₁-representation' is wrong in substance: for path-connected X it is a three-step composition, only not packaged as one declaration. Fix is right as stated (keep partial; the equivalence needs path-connectedness, so on the possibly disconnected X_K it holds per component).

### 22. missing, medium: **confirmed**

IsQuotientCoveringMap.isCoveringMap_of_comp (TauCeti/Topology/Covering/Quotient.lean:185: an intermediate quotient of a quotient covering is a covering) and HeckeCoset.degree_eq_relIndex (TauCeti/NumberTheory/HeckeRing/Basic.lean:530: deg(H₁gH₂) = [H₁ : H₁ ∩ gH₂g⁻¹]) exist as quoted, and AUDIT-13 cites both, fit 'related', under AdelicAlgebraicGroups:AA.4 target 'Finite covering maps for nested compact opens at neat levels' (library 'absent'). ALS.3 target 1 says 'no space X_K, hence no covering maps', which contradicts that AA.4 entry for the same maps X_{K∩gKg⁻¹} → X_K. Fix is right. The library value should stay 'absent', consistent with AA.4, which records the same two declarations as 'absent'/related.

### 23. missing, medium: **confirmed**

The stage ArithmeticLocallySymmetricSpaces:ALS.5 in research/blueprint/atlas/roadmaps/ArithmeticLocallySymmetricSpaces.json has, beyond the prefix text, the paragraph 'The later full ALS.5 compares Betti, de Rham and relative Lie algebra cohomology in characteristic zero via local systems, using AF.1a. It consumes AS.5 only for the further comparison with automorphic forms', and requires AutomorphicFormsOnReductiveGroups:AF.1a and AutomorphicSpectralTheory:AS.5, which the prefix ALS.5:finite-level-duality (requires ALS.1, ALS.4, EnhancedDerivedSheaves:E1) does not. The README acceptance line (content/campaign/ArithmeticLocallySymmetricSpaces/README.md:50) requires 'the three cohomology theories'. AUDIT-13 gives ALS.5 only the six prefix targets and its duplicates entry says the lists coincide. Library check: no de Rham cohomology of manifolds in either tree (Mathlib's only 'DeRham' hits are the period rings in RingTheory/Perfectoid/BDeRham.lean); extDeriv (Mathlib/Analysis/Calculus/DifferentialForm/Basic.lean:73) and LieAlgebra.twoCocycle (Mathlib/Algebra/Lie/Cochain.lean:155, TODO 'coboundaries, cohomology' at :24-25) are correct nearest material. Fix is right; verdict stays not built.

### 24. duplicate, medium: **confirmed**

The atlas stage tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group plans the boundary as a manifold (half-space model, corners afterwards), collar neighbourhoods and gluing 'in the corners category from the start'; ALS.2 needs the manifold-with-corners structure, gluing and the interior homotopy equivalence, and AUDIT-13's ALS.2 duplicates (BorelRegulators:R.1, AutomorphicPadicLFunctions:L1, ShimuraCompactifications:C3) omit it, although the review added the analogous prerequisite AlgebraicTopology stages elsewhere. No accepted RS settles this (RS-09, which touches ALS.2, has no review). The note 'boundary/interior lemmas' understates Tau Ceti: TauCeti.isManifold_boundary (TauCeti/Geometry/Manifold/Boundary/Charts.lean:342, half-space model), isSmoothEmbedding_subtypeVal_boundary (:395), IsCollar (Boundary/Collar/Global.lean:40, data only) and IsProductCollarChart (Collar/Local.lean, whose docstring :23 says the global half is not done). Fix is right, with one caution for the duplicates note: GT layer 1 owns boundary collars for the half-space model, not corner collars, so say it supplies the general corners/collar machinery the Borel–Serre interior homotopy equivalence builds on, not that equivalence itself.

### 25. missing, low: **confirmed**

Verified: TauCeti.PosDefMatrix (TauCeti/MeasureTheory/Measure/SymmetricMatrix/PosDef.lean:42, open at :47), Matrix.GeneralLinearGroup.symmetricCongruence A ↦ C A Cᵀ on symmetric matrices (SymmetricMatrix/Congruence.lean:298, action law symmetricCongruence_mul :334), TauCeti.choleskyHomeomorph : PosDefMatrix p ≃ₜ PosDiagLowerTriangular p (LinearAlgebra/Matrix/Cholesky/Topology.lean:133), TauCeti.Matrix.isCompact_unitaryGroup for RCLike 𝕜 (Topology/Algebra/UnitaryGroup.lean:80), and the compact SO instance TauCeti.QuadraticMap.instCompactSpaceSpecialOrthogonalGroupRealCliffordForm (Topology/Algebra/QuadraticForm/RealSpecialOrthogonal.lean:128); Mathlib has no compactness of the unitary group. The ALS.0 note 'Only the rank-one example is present' is overstated, since the GL_p positive-definite cone model is there, although not as G/K. Both targets stay absent. Fix is right (low).

### 26. missing, low: **confirmed**

Verified in Mathlib 082e2d3: IsCusp (Mathlib/NumberTheory/ModularForms/Cusps.lean:58), CuspOrbits (:168), the instance Finite (CuspOrbits 𝒢) for arithmetic 𝒢 (:204, anonymous, so absent from the pinned declaration index; surjective_cosetToCuspOrbit :195 is the named lemma behind it), Subgroup.strictWidthInfty (:321); Tau Ceti AddCircle.isEilenbergMacLaneSpaceOne_pi (TauCeti/AlgebraicTopology/UniversalCover/Torus/EilenbergMacLane.lean:46). The ALS.2 notes leave out this GL2/Q material, and 'no nilmanifold in either library' ignores circles and tori. Confirmed with fit corrections: IsCusp and the finiteness instance should be 'related', not 'special case'. A cusp is a boundary point of ℙ¹(ℝ), not the Borel–Serre boundary component e(P) ≅ N(ℝ). AddCircle.isEilenbergMacLaneSpaceOne_pi is a fibre, not a fibration, so it is also 'related'. Library values unchanged.

### 27. missing, low: **confirmed**

Verified: TauCeti.ContCohomology.explicitCor1 (TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction.lean:457), explicitCor1_comp_res1 cor¹∘res¹ = index (:496), explicitCor2 (:850), explicitCor2_comp_res2 (:893), for a finite-index (open) subgroup; groupCohomology.resNatTrans in every degree (Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean:543); CategoryTheory.Functor.IsMittagLeffler (Mathlib/CategoryTheory/CofilteredSystem.lean:137). The ALS.5/ALS.6 notes cite no corestriction and say only degree-one inflation–restriction exists, which omits this. One inaccuracy in the claim: Mathlib's groupHomology.coresNatTrans (GroupHomology/Functoriality.lean:851) is the map induced by a group homomorphism on homology, not a transfer, and carries no cor∘res identity. The fix correctly does not cite it. Fix is right as stated (low).

### 28. missing, low: **confirmed**

HeckeRing.GLn.polynomialRingEquivTwo (TauCeti/NumberTheory/HeckeRing/GLn/PolynomialRing/Injective.lean:684: MvPolynomial (Fin 2) ℤ ≃+* pLocalSubring 2 p, Shimura Thm 3.20 for n = 2, module docstring :25-26 also names n = 1) and the GL₂(𝔽_q) principal series described as parabolic induction (TauCeti/RepresentationTheory/CharacterTable/GL2/PrincipalSeries/Basic.lean:19) exist. No 'satake' occurs in either tree, so the ALS.4 target stays absent. It is still right to cite the local Hecke ring structure theorem as nearest material. Fix is right (low).

### 29. missing, low: **confirmed**

content/campaign/ArithmeticLocallySymmetricSpaces/README.md:52-66 ('Completion contracts added on 2026-09-15', applies to ALS.1–ALS.4 and ALS.5:finite-level-duality) lists required constructions and acceptance tests. The audit's COMMON instructions say to read the document, although these contracts are not in the stage extract. No equivariant CW structure exists in either tree (grep). The claim 'None of their constructions is an audit target' is overstated. Several contract items already sit near existing targets: the finite-projective/perfect contract near ALS.1 'Bounded finite projective chain models…' and 'Perfect coefficient complexes…', Hecke adjoints near ALS.5 'Restriction/corestriction and Hecke adjoint formulas', and non-neat stabilizers near ALS.5 'Stabilizer hypotheses…'. Right fix: fold those into the existing notes. Add as new absent targets only the Γ-equivariant cell decomposition refined for a correspondence, with homotopy independence and the double-coset identity (ALS.3, related Topology.RelCWComplex, Mathlib/Topology/CWComplex/Classical/Basic.lean:99), the parabolic incidence maps and fibre orientation system in the boundary spectral sequence (ALS.2), and the three acceptance tests (ALS.5:finite-level-duality). Low.

### 30. duplicate, low: **confirmed**

The three atlas stages exist and plan what the finding says. tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action items 3–5 plan proper discontinuity for discrete Γ ≤ PSL(2,R), finite cyclic stabilizers, and an open free locus with covering quotient. Tau Ceti has these at TauCeti/Analysis/Complex/Fuchsian/ProperAction.lean:33, Fuchsian/Stabilizer.lean:45 and Topology/Algebra/GroupAction/FreeLocus.lean:62/:76. tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields plans the Hecke action on modular symbols. tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces builds the compactified quotient. None is retired, and none is among the ALS.0/ALS.3/ALS.6 duplicates, while the audit does list comparable special-case owners (ShimuraData:D2, ModularCurvesPartII:R14.1). Fix is right (low). The ALS.6 entry is a supplier for the modular-curve test rather than a restatement, and its note should say so.

### 31. other, low: **confirmed**

The ALS summary does list 'cup product' unqualified and describes the proper-discontinuity infrastructure only through instances on ℍ. Tau Ceti's continuous cup products (TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/Product.lean, degrees ≤ 2) are recorded elsewhere in AUDIT-13 itself. Findings 20, 21, 22, 23 and 25, confirmed here, change the ALS notes, so the summary has to follow. Fix is right (low): apply it after those fixes and qualify 'cup product' as 'cup product on cochains of spaces'.

### 32. missing, medium: **confirmed**

Checked at the pinned commits. Mathlib has AlgebraicGeometry.Scheme.Modules.pullback/pushforward (Mathlib/AlgebraicGeometry/Modules/Sheaf.lean:182/:165), SheafOfModules.IsLocallyFree (Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean:61), VectorBundle.pullback (Mathlib/Topology/VectorBundle/Constructions.lean:204), Bundle.ContinuousLinearMap.vectorBundle (Topology/VectorBundle/Hom.lean:226), Bundle.ContinuousAlternatingMap.instVectorBundle (ContinuousAlternatingMap.lean:295) and ContMDiffVectorBundle.pullback (Geometry/Manifold/VectorBundle/Pullback.lean:39). Tau Ceti has AlgebraicGeometry.Scheme.Modules.tensorProduct (TauCeti/AlgebraicGeometry/Modules/TensorProduct.lean:44) and TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct (LineBundle/TensorProduct.lean:57), with a CommMonoid on classes (LineBundle/Class.lean:91), and its docstring (:19) confirms that duals are missing. The vector-bundle directories have no tensor-product bundle; the 'tensor' hits there are tensoriality lemmas. B0[0]'s note leaves out all of this, while B0 must import these operations. Fix is right.

### 33. duplicate, medium: **confirmed**

The atlas stage tauceti:TauCetiRoadmap/ModularForms#10c--modular-forms-as-section-spaces-and-the-dimension-formulas plans the weight-k automorphy invertible sheaf on the coarse compact X(Γ) by explicit local descent at elliptic points and cusps. It also identifies M_k(Γ), S_k(Γ) with section spaces and S_2(Γ) ≅ H⁰(X(Γ), Ω¹). That is the analytic GL₂ case of B4 'forms as sections…' and the GL₂ Hodge-line target, and it descends through finite stabilizers, which is B0's coarse-quotient descent target. B4's duplicates (R12.5, H5, O8, R15.1) and B0's (D3, O1, LieGroups layer 8) omit it. ModularForms is not retired, and no accepted RS (RS-02, RS-14, RS-32) touches B0/B4 duplicates. The audit already lists analytic counterparts as duplicates (e.g. ShimuraData:D3 under B2), so this entry is consistent. Fix is right. The optional ComplexComparisonPartII:C6 entry is also apt: its text names AutomorphicBundles as a consumer and compares f(q)dq/q with the weight-two Hodge section.

### 34. duplicate, medium: **confirmed**

ModularCurvesPartII:R14.1 plans algebraic Hecke correspondences with composition, double-coset and adjoint formulas, and trace 'rather than a naive division by the degree'. That is the GL₂ case of B5 targets 1–3, and AUDIT-13 already lists R14.1 as the GL₂ owner under ALS.3. tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra owns the GL₂ ring homomorphism from the abstract Hecke ring and the T_p normalization lemma. The audit itself cites that layer's output, HeckeRing.GL2.heckeRingHomCharSpace (TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Action.lean:293), under B5[1]. B5's duplicates list (AA.4, ALS.3, L4, R15.2) omits both. RS-14 (accepted) only reassigns expansion ownership to B5 and does not settle this. Confirmed for the two main entries. Among the 'lesser' ones, AutomorphicPadicLFunctions:L3 (Hilbert integral q-expansion principle) and ModularCurvesPartII:R13.3 fit. OverconvergentAutomorphicForms:O6 requires B5 and only compares with it, so it is a consumer, not an owner. Add it only if the audit keeps its convention of listing restating consumers (as with O8/O1).

### 35. library-claim, low: **confirmed**

ModularForm.mem_range_ofLeₗ_iff (TauCeti/NumberTheory/ModularForms/Basic.lean:335) takes [Γ.HasDetOne] [Γ'.HasDetOne] and hc : ∀ c, IsCusp c Γ → IsCusp c Γ'. The docstring of ofSlashInvariant (:316-321) says that without it 'enlarging the invariance group can create cusps at which nothing is known'. So the B0[5] note's paraphrase drops a real hypothesis. The other cited material exists: ModularForm.slash_scalar (Basic.lean:217, factor u^(k−2)), ModularForm.slash_neg_one (:165), TauCeti.char_neg_one_of_mem_modFormCharSpace (NumberTheory/ModularForms/Parity.lean:100) and modFormCharSpace_eq_bot_of_char_neg_one_ne (:119), UpperHalfPlane.smul_eq_self_of_mem_center and UpperHalfPlane.instMulActionPSL2 (Analysis/Complex/UpperHalfPlane/PSLAction.lean:103,:128), Subgroup.instIsCyclicStabilizer (Fuchsian/Stabilizer.lean:45), and Matrix.ProjectiveSpecialLinearGroup.smulDeriv/smulDeriv_mul (UpperHalfPlane/SmulDeriv.lean:73,:105). Fix is right (low).

### 36. missing, low: **confirmed**

Verified: WeierstrassCurve.Affine.invariantDifferential (TauCeti/AlgebraicGeometry/EllipticCurve/Affine/InvariantDifferential.lean:105) and invariantDifferentialBasis (:137), for one curve over a field; WeierstrassCurve.variableChange_c₄/_c₆/_Δ with u⁻⁴, u⁻⁶, u⁻¹² (Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean:210,:214,:218); UpperHalfPlane.hasStrictDerivAt_smul with derivative det g / denom g τ² (Mathlib/Analysis/Complex/UpperHalfPlane/Manifold.lean:174); TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace (TauCeti/AlgebraicGeometry/AbelianVariety/TangentSpace.lean:85) and finrank_tangentSpace_eq_finrank_cotangentSpace (:183). B4[3] cites nothing and B4[5] cites only schurFunctor. These are the right fibre-level nearest material, and both targets stay absent. Fix is right (low).

### 37. missing, low: **confirmed**

TauCeti.GL2Borel.quotientEquivOnePoint : GL (Fin 2) F ⧸ GL2Borel F ≃ OnePoint F over any field (TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/ProjectiveLine.lean:158, equivariance :177, stabilizer_infty :142) exists, so B0[4]'s bare 'no compact dual' should be qualified for GL₂ on points. TauCeti.GaloisDescent.span_invariants_eq_top (RepresentationTheory/GaloisDescent/Span.lean:38, finite automorphism group, no Galois hypothesis) and liftBaseChange_injective_of_invariant (GaloisDescent/Injective.lean:42, finite Galois; docstring :17-21: together they identify a semilinear representation with the scalar extension of its invariants, with no invertibility of the group order) exist next to the cited Range.lean criterion. B0[3]'s note describes only the range criterion. Fix is right (low).

### 38. missing, low: **confirmed**

Verified: ModularForm.trace (Mathlib/NumberTheory/ModularForms/NormTrace.lean:82, from SlashInvariantForm.trace :55, a sum over ℋ ⧸ 𝒢.subgroupOf ℋ with no division by the index); the divisor-sum formula (TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/CoefficientFormula.lean:114); TauCeti.ModularForm.sturm_bound_finiteIndex (TauCeti/NumberTheory/ModularForms/SturmBound.lean:79) with eq_of_sturm_bound (:102). The B5 notes omit them, and they are the closest analytic GL₂ material. Fix is right (low), with one name correction: the divisor-sum theorem's full name is HeckeRing.GL2.qExpansion_coeff_heckeRingHomCuspCharSpace_heckeTCompositeGamma0.

### 39. missing, low: **confirmed**

Verified: NumberField.IsCMField (Mathlib/NumberTheory/NumberField/CMField.lean:71), BDeRhamPlus/BDeRham (Mathlib/RingTheory/Perfectoid/BDeRham.lean:77,:90), CovariantDerivative (Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/Basic.lean:366, docstring :23: any nontrivially normed field), no curvature or flat connection under Mathlib/Geometry or Mathlib/Topology (grep), and TauCeti.AlgebraicGeometry.AbelianVariety.End (TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean:83). These are uncited nearby inputs for B1[1], B1[3] and B2[2]. No library value changes. Fix is right (low).

### 40. other, low: **confirmed**

The AB summary does say 'B0–B3 and the three general-data interfaces are untouched', although B0 target 'Equivariant-function description of sections' is library 'partial' (SlashInvariantForm, special case). It also denies a compact dual and a Hermitian symmetric domain without the GL₂ qualification (Mathlib ℍ; TauCeti.GL2Borel.quotientEquivOnePoint, TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/ProjectiveLine.lean:158). Its list of Tau Ceti inputs omits the material confirmed in findings 32, 36, 37 and 39. Fix is right (low). The finding's internal cross-reference '(see findings 1, 5 and 8)' is wrong and should point to RT-AUDIT-13/32, /36, /37 and /39.

### 41. library-claim, medium: **confirmed**

Every cited declaration is at the pin and says what the finding claims. Mathlib 082e2d3: GroupLieAlgebra (Mathlib/Geometry/Manifold/GroupLieAlgebra.lean:56) with instLieAlgebraGroupLieAlgebra (:262); LieAlgebra.ExtendScalars.instLieAlgebra : LieAlgebra A (A ⊗[R] L) (Mathlib/Algebra/Lie/BaseChange.lean:114, namespace LieAlgebra.ExtendScalars); structure ContRepresentation (Mathlib/RepresentationTheory/Continuous/Basic.lean:54). Tau Ceti f790474: lieExp (TauCeti/Geometry/Lie/Exponential/Basic.lean:139); TauCeti.Lie.Ad as a Lie equivalence (Adjoint/Derivation.lean:62); continuousAdjointRepresentation (Adjoint/Representation/Basic.lean:80) with mfderiv_continuousAdjointRepresentation_one (Differential.lean:126); lieSubalgebraOfSubgroup (Subgroup/LieAlgebra.lean:270), where mem_lieSubalgebraOfSubgroup (:293) needs IsClosed K; the affine-group-scheme Lie algebra instLieAlgebraCounitAlgebra (AlgebraicGroup/Tangent/Lie/Basic.lean:222); adRepresentation (Tangent/Adjoint.lean:174). The AF.1 (g,K) note attributes continuous representations to Tau Ceti, but Tau Ceti's Continuous/Character.lean only adds TauCeti.ContRepresentation.character (:86) on top of Mathlib's structure. The AF.1 U(g_C) note lists 'the complexified algebra for a real reductive group' as missing, yet ℂ ⊗[ℝ] GroupLieAlgebra I G is a Lie algebra over ℂ through ExtendScalars. Library values stay unchanged. The fix is right; when citing Lie(K), state that the exp-characterisation holds for closed K.

### 42. duplicate, medium: **rejected**

The accepted LieGroups link map already settles how LieGroups relates to AF (research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_LieGroups.json, review accepted 2026-09-23). Its examined entry for AutomorphicFormsOnReductiveGroups reads AF.0, AF.1 and AF.1a. It records three supplier links: layer 3 → AF.1, layer 5 → AF.0 (U(𝔤) as differential operators), and layer 9 → AF.1a (links[13], also review.added): 'the K × p diffeomorphism identifies K\G with p … AF.1a still constructs the cochain comparisons…'. So layer 9 supplies AF.1a; it does not state AF.1a's targets (invariant forms, contracting homotopy, van Est). Layer 9 also takes K as given ('For a real reductive G with maximal compact subgroup K') and does not own it. Supplier relations do not belong in `duplicates` (cf. RT-AUDIT-18/35). Layer 5 builds its centre and Casimir from LieHighestWeight, which AF.1.duplicates already lists as owner of the centre. The same link map's overlap entry rescopes layer 5's scalar-central-action claim to complex finite-dimensional irreducibles. The proposed layer-7 note ('maximal compactness') repeats wording that this link map flags as false for noncompact G (overlap LieGroups layer 7 / ShimuraData:D2, rescope). The Lie-algebra complexification is Mathlib's ExtendScalars (finding 41), not something planned twice. No change is needed.

### 43. library-claim, medium: **confirmed**

The AF.0 test-function note (AUDIT-13.result.json) says 'there is no space of smooth functions on a Lie group or a locally profinite group … in either library'. That is false at 082e2d3. ContMDiffMap is at Mathlib/Geometry/Manifold/ContMDiffMap.lean:38, with the C^n⟮I, M; I', M'⟯ notation at :42, and ContMDiffMap.algebra is at Mathlib/Geometry/Manifold/Algebra/SmoothFunctions.lean:285. Together they give the algebra of smooth functions on any manifold, Lie groups included. LocallyConstant (Mathlib/Topology/LocallyConstant/Basic.lean:203), which the note already cites, is the smooth-function space of a locally profinite group. TestFunction (Mathlib/Analysis/Distribution/TestFunction.lean:67) lives only on an open Ω of a normed space. Neither tree has compactly supported locally constant functions as a space (searched HasCompactSupport with LocallyConstant in both). Keep 'partial'. The replacement note and the ContMDiffMap citation (fit related) are correct.

### 44. error, medium: **confirmed**

The AF.2 note 'Absent: there is no adelic quotient of a reductive group in either library' is false for GL₁. It also contradicts the audit's own AA.5 entry, which cites NumberField.IdeleClassGroup as a special case with the note 'The idele class group 𝔸ˣ/Kˣ is defined in Mathlib'. At 082e2d3 there are IdeleGroup := 𝔸[R, K]ˣ (Mathlib/NumberTheory/NumberField/AdeleRing.lean:93) and IdeleClassGroup := IdeleGroup R K ⧸ principalSubgroup (:119). TauCeti.HopfAlgebra.pointsFunctor is at TauCeti/Algebra/AlgebraicGroup/PointsFunctor.lean:104. The target stays absent. One correction to the fix: the replacement note must not say G(𝔸) has 'no topology'. Mathlib topologizes Hom(A, R) for a topological ring R through the scoped CommRingCat.HomTopology (Mathlib/Algebra/Category/Ring/Topology.lean:50). Units of a topological monoid form a topological group (Mathlib/Topology/Algebra/Group/Units.lean:102), so the idele group is a topological group (see RT-AUDIT-13/1). Say instead: 'no group topology on G(𝔸) for a general G identified with the restricted product, no quotient G(F)\G(𝔸), and no space of functions on it'. Add IdeleClassGroup (fit special case).

### 45. missing, low: **confirmed**

TauCeti/NumberTheory/NumberField/Global/Adeles/Discrete.lean at f790474 has three declarations in namespace TauCeti.GlobalNumberFields. They are the instance discreteTopology_principalSubgroup (:64), isClosed_principalSubgroup (:89) and the instance t3Space_quotient_principalSubgroup (:95), whose docstring says 'Hausdorff, and indeed regular'. The AF.3 compactness note cites only a docstring, and the constant-term note says 'there is no unipotent adelic quotient'. Compactness of 𝔸_K/K is absent from both trees (no CompactSpace instance on the quotient). Both targets stay absent. The fix is correct.

### 46. missing, low: **confirmed**

Mathlib 082e2d3 has the following. ModularForm.isCuspForm_iff_coeffZero_eq_zero (Mathlib/NumberTheory/ModularForms/CuspFormSubmodule.lean:142, for ModularForm 𝒮ℒ k inside section SL2Z) says IsCuspForm f ↔ (qExpansion 1 f).coeff 0 = 0. CuspFormClass.qExpansion_coeff_zero is at QExpansion.lean:436. CuspFormClass.petersson_bounded_left (Bounds.lean:189) and CuspFormClass.exists_bound (:213) hold for any [Γ.IsArithmetic]. In Tau Ceti f790474, UpperHalfPlane.integrableOn_petersson_fd_left (Petersson/Basic.lean:209) proves integrability over fd from petersson_bounded_left. CuspForm.peterssonInnerCosets_definite (Petersson/FiniteIndex.lean:191) gives a positive-definite pairing summed over the coset translates of 𝒟. The AF.3 square-integrability target has declarations [] and the note 'Absent.'; the cuspidality target cites only CuspForm. Both stay absent. The fix is correct. The fits match the audit's own use of exp_decay_atImInfty as a special case.

### 47. missing, low: **confirmed**

The declarations are real. ModularFormClass.exists_bound is at Mathlib/NumberTheory/ModularForms/Bounds.lean:227 and needs 0 ≤ k and [Γ.IsArithmetic]. HeckeRing.GL2.heckeRingHomCharSpace and heckeRingHomCuspCharSpace are ring homomorphisms from the integral Γ₀(N) Hecke ring into End of M_k(N,χ) and S_k(N,χ) (TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Action.lean:293, :393). HeckeRing.GLn.commSemiringHeckeRing (HeckeRing/GLn/TransposeAntiInvolution.lean:125) has the docstring 'Shimura's Proposition 3.8 for GL_n'. The four targets have no such citations. Correct the proposed fits. ModularFormClass.exists_bound is a growth bound, not a case of 'independence of the moderate-growth condition from the chosen height', so cite it as 'related'. On the AF.2 Hecke × (g,K) target the Hecke maps are 'related', since nothing (g,K) is there. Keep 'special case' only on the AF.0 Hecke-preservation target, and only for its Hecke clause. commSemiringHeckeRing as 'related' is right: it is the global GL_n(ℤ) Hecke ring, not the local spherical algebra. Library values stay absent.

### 48. library-claim, low: **confirmed**

TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:120-127 defines C1 and C2 for any topological space G and any topological additive group M. H1EquivOfSmulEqSelf (:840) identifies H¹ with continuous homomorphisms for any topological monoid acting trivially (variables at :826-834). DiscreteTopology is required only in LongExact.lean (:135-139). Shapiro.lean (:166-167) requires a compact G and a discrete A. So 'with discrete coefficients' misdescribes the explicit model. In the replacement note, qualify corestriction as along an open finite-index subgroup: Corestriction.lean needs [U.FiniteIndex] (:111) and hU : IsOpen U (:399), not discreteness. Also say that the cup product needs a jointly continuous pairing (Cup/Product.lean docstring). Otherwise the fix and the related H1EquivOfSmulEqSelf citation are correct.

### 49. missing, low: **confirmed**

At f790474 the following hold. TauCeti.representativeSubmodule is the span of matrix coefficients (RepresentationTheory/Continuous/Representative.lean:123). TauCeti.dense_representativeSubmodule proves it uniformly dense in C(G, 𝕜) for a compact topological group (Compact/RepresentativeDensity.lean:117). ContRepresentation.isotypicProjector (Compact/Character/IsotypicProjection.lean:145) has range equal to Mathlib's isotypicComponent by range_isotypicProjector (:394), which needs rho unitary and sigma irreducible. The AF.1 K-type target cites only the Peter–Weyl basis. The fix is correct, including its restriction to finite-dimensional representations.

### 50. missing, low: **confirmed**

TauCeti.weylVector ('The Weyl vector ρ: the half-sum of the positive roots of a base') is at TauCeti/LinearAlgebra/RootSystem/Weyl/Vector.lean:151. The difference between C-algebraic and L-algebraic weights, and the half-root twist in the AF.4 stage text, are shifts by ρ. The audit's own AF.4 infinitesimal-character note uses ρ through the Casimir value ⟨λ+ρ,λ+ρ⟩−⟨ρ,ρ⟩. The note's grep for 'algebraic' cannot find this ingredient. Keep 'absent' and cite weylVector as 'related', as the fix says.

### 51. missing, low: **confirmed**

TauCeti.GlobalNumberFields.Modulus has a nonzero integral finite part and a finset of real places (TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean:88). RayClassGroup 𝔪 is at RayClass/Basic.lean:180. Neither tree has rayClassQuotient or HeckeCharacter (grep). The GlobalNumberFields layer 9 text constructs HeckeCharacter.ofRayClassCharacter 'as pullback along rayClassQuotient' against RayClassGroup 𝔪. The AF.5 GL₁ note cites only ideal weights and IdeleClassGroup. Keep 'absent'. The fix is correct.

### 52. duplicate, low: **confirmed**

The omission is real. The AF.5 restriction-of-scalars target says only that no Weil restriction exists, and AF.5.duplicates names neither owner. RG2.0a's stage text says 'Own restriction of scalars … adelic restriction-of-scalars comparisons import this construction'. AA.1 constructs 'base change and restriction-of-scalars equivalences' and product compatibility on adelic points. AF.5's requires ([AF.3, AF.4, ModularCurvesPartII:R12.5]) and the stage-edge list contain neither, and no link map records them. The fix is wrong, though: both stages are suppliers of AF.5's automorphic-level compatibility and do not state that target, so they do not belong in `duplicates` (the field is 'layers that state the same targets'; cf. RT-AUDIT-18/35, RT-AUDIT-04/23). Put this in the target's note instead: 'Weil restriction is owned by ReductiveGroupsPartII:RG2.0a and the adelic restriction-of-scalars and product equivalences by AdelicAlgebraicGroups:AA.1; AF.5 imports them.'

### 53. duplicate, low: **confirmed**

The stage tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields plans the modular-symbol module 𝕄 N k as a finite ℤ-module, the integral Hecke action, and coefficient fields as number fields through that integral structure. That is the GL₂/ℚ case of AF.4's rationality target and of its integral-cohomology Hecke target. ModularForms is a prerequisite of this roadmap. At f790474 no .lean file mentions modular symbols or Eichler (git grep). AF.4.duplicates lists only AG2.0, ALS.1 and B2. The special-case-owner convention matches the audit's other entries, e.g. AF.3 → GlobalNumberFields layer 5. The fix is correct. Consider also naming ModularForms#layer-8g-galois-stability-the-character-field-and-rationality, which owns the rationality statements (charpoly over ℚ(χ), Galois conjugate newforms).

### 54. duplicate, low: **confirmed**

AL.0's stage text reads 'Construct local Schwartz–Bruhat spaces at finite and infinite places … and the restricted tensor-product adelic space', which uses Schwartz functions at the archimedean places. AF.0 asks for 'archimedean C∞ compactly supported functions'. REV-AUDIT-13.md:153-154 replaced SchwartzMap with TestFunction for exactly this reason ('Schwartz functions are not compactly supported'). The current AF.0 duplicate note ('the same adelic test-function space') is therefore inaccurate. The two spaces share the finite-place factor and the restricted-tensor construction. No accepted restructuring touches this. The reworded note is correct.

