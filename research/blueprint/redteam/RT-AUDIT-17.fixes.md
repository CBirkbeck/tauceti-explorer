# RT-AUDIT-17: fixes

Fixer: Claude Code, session `cc-f805bf`, 29 September 2026 (issue #4012, job FIX-RT-AUDIT-17).
- Findings: `RT-AUDIT-17.result.json`.
- Verdicts: `RT-AUDIT-17.review.json`.
- The red team made 44 findings. The review confirmed 41 and rejected 3. This job covers the 16 confirmed findings of high or medium severity: /1, /2, /7–/12, /17–/19, /26–/28, /37 and /38. The 25 confirmed low-severity findings are outside the fix job (PROTOCOL.md section 17), and the three rejected findings (/29, /36 and /40) are not applied.

Every change is in `research/blueprint/audit/AUDIT-17.result.json`; no other file changes. I read every declaration added or moved below at Mathlib 082e2d3 / Tau Ceti f790474, at the stated file and line, and each one resolves in the pinned `declarations.tsv` under the stated full name. Every target still has at most five `declarations`, the audit's cap. Where a finding adds more than the cap allows, the citations it displaces are named, with file and line, in the target's note. The file parses as JSON. The audit's `review` object and all verdicts are unchanged.

## RT-AUDIT-17/1 (medium, duplicate): consumer handoffs removed from `duplicates`

These 14 entries named downstream consumers, not layers that state the same targets. Removed:
- R03.1: LocalGaloisDeformationRings:R08.1.
- R03.2: LocalGaloisDeformationRings:R08.1, GlobalGaloisDeformations:R04.2 and R04.3.
- P8: PotentialAutomorphyInfrastructure:PA.4, GL2ModularityLifting:R22.3.
- P9: PotentialAutomorphyInfrastructure:PA.3, GL2ModularityLifting:R22.4.
- R03.4: PotentialModularityAndCompatibleSystems:R24.1 and R24.2. R03.4's `duplicates` is now empty.
- R03.5: GL2ModularityLifting:R22.3, PotentialAutomorphyInfrastructure:PA.4.
- R03.6: PotentialAutomorphyInfrastructure:PA.3, GL2ModularityLifting:R22.4.

The genuine overlaps and same-roadmap cross-references stay: IHG.2, DD.1, S.1, CC.2, R02.1, L5, R31.5, AdicSpacesPartII:R0, ModularCurves 7f and 4d, StablePeriodicCurved layer 7, P8↔R03.5 and P9↔R03.6. The audit schema gives a layer no note field, so the consumer relation is recorded here and not in the file. These layers consume this roadmap's abstract algebra; they are not rival owners.

## RT-AUDIT-17/2 (medium, missing): Krull dimension along integral maps (R03.3)

In the target "Depth and dimension formulas under the local maps used":
- **Citation added.** `TauCeti.ringKrullDim_eq_of_isIntegral_of_faithfulSMul` (TauCeti/RingTheory/KrullDimension/Integral.lean:76, related).
- **Citation displaced.** It takes the place of `IsLocalRing.maximalIdeal_height_eq_ringKrullDim`, which the note still names with its location.
- **Note.** It now says that Tau Ceti proves dim S ≤ dim R for every integral algebra (`ringKrullDim_le_of_isIntegral`, :57) and equality for injective ones (:76), with no Noetherian hypothesis. As the review asks, it says equality does not hold for arbitrary finite maps.
- **Library value.** The target stays `partial`.
- **Summary.** The roadmap summary's Tau Ceti list adds Krull dimension along integral extensions.

## RT-AUDIT-17/7 (high, library-claim): p-adic re-expansion uses evaluation, not substitution (HC.3)

In the target "p-adic re-expansion maps…":
- **Citations.** The declarations are now `PowerSeries.HasEval` (:61), `PowerSeries.aeval` (:211), `continuous_aeval` (:219) and `comp_aeval` (:241), all in Mathlib/RingTheory/PowerSeries/Evaluation.lean, followed by `PowerSeries.HasSubst`.
- **Note on HasSubst.** It is kept, with a note that it covers only the special case of an algebraically nilpotent constant term.
- **Citations displaced.** `substAlgHom`, `subst_comp_subst` and `IsTopologicallyNilpotent` are dropped. `HasEval` is by definition `IsTopologicallyNilpotent`.
- **Note.** It is rewritten as the finding asks. It cites Tau Ceti's `PowerSeries.aeval_subst`, `MvPowerSeries.hasEval_of_mem` and `eval₂_mem_pow`. Following the review, it says that `aeval_subst` compares the two APIs on the HasSubst domain and does not remove the nilpotence hypothesis. The completed coefficient rings, topological nilpotence in them, the re-expansions and the cocycle identity remain absent.
- **Summary.** The phrase "power-series substitution under topological nilpotence" now reads "power-series evaluation at topologically nilpotent elements of complete linearly topologised rings (PowerSeries.aeval)".

## RT-AUDIT-17/8 (medium, error): P_N is not monic (HC.2)

- **Note.** "each P_N is monic" is replaced. P_N has unit leading coefficient (−1)^N, so it is monic only for even N or in characteristic 2, the review's qualification. Its monic associate ∏(q^i − 1) = ∏∏Φ_d is monic and generates the same ideal, so the expansion divides by that. `%ₘ` returns its argument unchanged for a non-monic divisor, so it must not be applied to P_N itself. I did not repeat the finding's "identity for every odd N" without the characteristic-2 caveat.
- **Citation added.** `Polynomial.prod_cyclotomic_eq_X_pow_sub_one` (Cyclotomic/Basic.lean:338, related).

## RT-AUDIT-17/9 (medium, missing): Habiro's congruence (4.1) is in Mathlib (HC.4)

- **Adjacency target, citations.** Added `Polynomial.cyclotomic_mul_prime_pow_eq` (Cyclotomic/Expand.lean:156) and `cyclotomic_mul_prime_dvd_eq_pow` (:145), with fit `special case` as the finding proposes.
- **Adjacency target, displaced citations.** To stay within five, `eval_one_cyclotomic_not_prime_pow` (Eval.lean:137) and `IsPrimitiveRoot.norm_toInteger_sub_one_eq_one` (NumberField/Cyclotomic/Basic.lean:325) move into the note.
- **Adjacency target, note.** It now reads "N(ζ_n − 1) = p for prime powers n ≠ 2" and explains the transport from ℤ[q] by `map_cyclotomic`.
- **Comaximality target, citation.** Added `cyclotomic_mul_prime_pow_eq` (related).
- **Comaximality target, note.** It now says what is present and what is absent. Present: (4.1). Absent: (4.2) p ∈ (Φ_n, Φ_{p^e n}), Lemma 4.1(2), Res(Φ_m, Φ_n), Lemma 4.2, and comaximality in R[q]. As the review requires, it does not claim that (4.1) supplies the integral containment (4.2).

## RT-AUDIT-17/10 (medium, error): injectivity needs only S ≠ ∅ (HC.1)

- **Target text.** It is restated as "Injectivity of R[q] → R[q]^S for every commutative ring R and every nonempty S (it fails for S = ∅ when R ≠ 0)". The zero-ring boundary comes from the review.
- **Citations.** Added `Polynomial.Monic.natDegree_le_of_dvd` (Monic.lean:203), `Monic.natDegree_pow` (:198), `natDegree_cyclotomic` (Cyclotomic/Basic.lean:317) and `cyclotomic.monic` (:292). `UniformSpace.Completion.ker_coeRingHom` stays. `IsHausdorff` is dropped: it concerns HC.4's separation hypotheses, not this map.
- **Note.** It gives the ⋂_k(Φ_n^k) = 0 argument and the S = ∅ case (Habiro p. 1130). It says the result is stated in neither library, and that Habiro's hypotheses belong to the restriction maps of HC.4.
- **For the maintainer.** The HC.1 stage caution "Do not assert injectivity of the polynomial map for every coefficient ring" needs only S ≠ ∅. The review notes that the caution was not itself false, so I did not edit the stage text, which is not this job's file.

## RT-AUDIT-17/11 (medium, library-claim): generic module completion exists (HC.5)

- **Citations added.** `UniformSpace.Completion.instModule` (GroupCompletion.lean:194) and `ContinuousLinearMap.completion` (LinearMapCompletion.lean:44).
- **Note.** It is replaced as the finding asks. It also names `AbstractCompletion.prod` (AbstractCompletion.lean:340), so that, as the review asks, the finite-product topology is not called absent.
- **What stays absent.** The module structure over the completed ring R[q]^S, the packaged direct-sum equivalence, and the identification with lim M[q]/fM[q].

## RT-AUDIT-17/12 (medium, missing): the Taylor map via `liftRingHom` (HC.3)

- **Citation added.** `IsAdicComplete.liftRingHom` (AdicCompletion/RingHom.lean:48).
- **Note.** It now names the X-adic completeness instance for `PowerSeries R` (AdicCompletion/Completeness.lean:228), which is anonymous, so it is cited in the note and not as a declaration.
- **Construction.** The note uses the review's fixed-domain construction: project R[q]^S to R[q]/(Φ_d^n), then send q ↦ ζ + X modulo X^n, which is well defined since Φ_d(ζ + X) has zero constant term. It warns that a quotient R[q]/(f) with Φ_d^n ∤ f does not map to R[ζ][X]/(X^n).

## RT-AUDIT-17/17 (medium, library-claim): Tau Ceti's field-factor decomposition (HR.5, HR.7, summary)

- **HR.5 p.18-repair target, citations.** Added `AdjoinRoot.equivPiFactors` (TauCeti/RingTheory/AdjoinRoot/Factors.lean:105) and `AdjoinRoot.isSeparable_of_separable` (:91), both `related`. The finding proposed `more general` for equivPiFactors; the review keeps `related` for this composite target.
- **HR.5, displaced citations.** `CompleteOrthogonalIdempotents.bijective_pi` stays in the note with its location. `not_irreducible_cyclotomic_five_of_sq_eq_five` remains cited under HR.7.
- **HR.5, note.** It names `squarefree_cyclotomic` and `projFactor`. It says what is missing: lifting the idempotents to the ℓ-adic and cyclotomic completions, and the fracture argument with reassembly.
- **HR.7 Φ₅-over-𝔽₁₁ target.** Added `AdjoinRoot.equivPiFactors` (`more general`, since this is the isolated decomposition subtarget) and `Polynomial.Factors.linearEquivRoots` (TauCeti/RingTheory/Polynomial/Factors.lean:109, related). The note explains both.
- **Summary.** It now says that Tau Ceti supplies the field-factor decomposition of K[X]/(f) for squarefree f.

## RT-AUDIT-17/18 (medium, library-claim): convergence of the p-adic substitutions (HR.5)

- **Citations.** `PowerSeries.HasSubst` is replaced by `PowerSeries.eval₂Hom` (Evaluation.lean:158) and `hasSum_eval₂` (:177). The optional `TauCeti.rootsOfUnityEquivResidueField` (TauCeti/RingTheory/RootsOfUnity/Henselian.lean:80) is added, as the prime-to-p root choice. All three are `related`.
- **Note.** It is rewritten with the review's correction. The finding said p-torsion-freeness makes ζ_{pm} − ζ_m non-nilpotent, but p-torsion-free rings need not be reduced. The note therefore argues in "the intended reduced cyclotomic coefficient rings".
- **What stays absent.** The completed rings, topological nilpotence in them, compatible root choices and change-of-choice invariance. The library value stays `absent`.
- **Summary.** I also added power-series evaluation to the summary's list of Mathlib tools, for consistency.

## RT-AUDIT-17/19 (medium, duplicate): shared λ-ring/Adams interface (HR.1)

- **Change.** Added KTheoryLowDegrees:Z.3 and SchemeKTheoryOperations:S.6 to HR.1's `duplicates`.
- **Scope.** Following the review, the notes limit the overlap to the common abstract λ-ring/Adams-operation interface. Z.3 needs the general axioms, with torsion; HR.1 needs the torsion-free Adams characterisation. S.6's construction of higher operations on K-groups is not duplicated.
- **For the maintainer.** Name one owner (HR.1 or Z.3) of the generic λ-ring API, with the torsion-free Adams-operation comparison; the others import it. No roadmap needs to be created.

## RT-AUDIT-17/26 (medium, library-claim): class-number-one certificate (CN.2)

- **Citations added.** `RingOfIntegers.isPrincipalIdealRing_of_isPrincipal_of_pow_le_of_mem_primesOver_of_mem_Icc` (ClassNumber.lean:144), `…_of_lt_or_isPrincipal_of_mem_primesOver_of_mem_Icc` (:183) and `…_of_norm_le_of_isPrime` (:116), all `special case`.
- **Citations displaced.** `classNumber_adjoinRoot_sqrt_neg_twenty_one_eq_four`, `NumberField.classNumber_le_bound` and `IsCyclotomicExtension.Rat.three_pid` are cited in the note with their locations. The Minkowski-bound lemma and the h(ℚ(√−5)) = 2 example stay as declarations.
- **Note.** The last sentence is replaced as the finding asks. The library value stays `partial`.
- **Summary.** "the Minkowski bound" now reads "the Minkowski bound and the class-number-one certificate built on it".

## RT-AUDIT-17/27 (medium, missing): certified integral bases (CN.2)

The review asks for five representative citations.
- **Citations kept.** Tau Ceti's `discr_minpoly_eq_index_sq_mul_discr` and `not_dvd_index_of_squarefree_map` (both `exact`).
- **Citations added.** `NumberField.adjoin_gen_eq_top_of_mod_four_ne_one` (Quadratic/RingOfIntegers.lean:393, special case), `IsCyclotomicExtension.Rat.adjoin_singleton_eq_top` (NumberField/Cyclotomic/Basic.lean:770, special case) and `Algebra.discr_mul_isIntegral_mem_adjoin` (Discriminant.lean:253, related).
- **Named in the note instead.** The companion quadratic results (:289, :302, :406), the Eisenstein step (Eisenstein/IsIntegral.lean:367), and the displaced `NumberField.integralBasis`, `discr_eq_of_integralBasis` and `isMonogenic_iff_exists_index_eq_one`.
- **Note.** It is rewritten as the finding asks, and claims no general algorithm.
- **Duplicate note.** The NumberFieldArithmetic layer-7 note now says that its quadratic integral bases are already built in Tau Ceti.
- **Summary.** It adds integral bases of cyclotomic fields (Mathlib) and quadratic fields (Tau Ceti).

## RT-AUDIT-17/28 (medium, library-claim): A(S,2) is finite and contains the descent image (CN.3)

- **Citations added.** `WeierstrassCurve.Affine.finite_selmerGroupA` (SelmerGroupA.lean:149) and `range_μ_le_selmerGroupA` (:219).
- **Citation displaced.** `lutz_nagell` is cited in the note with its location.
- **Note.** It is rewritten with the hypotheses the review restores: a Dedekind base, the char ≠ 2 normal form, finite class groups and finitely generated unit groups of the factor rings, and a finitely generated Mordell–Weil group (`fg_point`) for the rank bound. It does not claim that the full Selmer group is finite.
- **Library value.** Stays `partial`.

## RT-AUDIT-17/37 (medium, missing): the chosen maximal curve exists (HopfRinow Layer 1)

- **J(p,v) target, citations.** Added `maximalIntegralCurve` (TauCeti/Geometry/Manifold/IntegralCurve/Maximal.lean:194), `isMIntegralCurveOn_maximalIntegralCurve` (:248) and `IsMIntegralCurveOn.eqOn_maximalIntegralCurve` (:228).
- **J(p,v) target, displaced citation.** `IsGeodesicCurveOnFrom.comp_mul_left` is cited in the note with its location.
- **J(p,v) target, note.** The sentence about "no chosen maximal geodesic" is replaced by the finding's text. It adds the review's smoothness and Hausdorff-tangent-bundle hypotheses. The target stays `partial`.
- **Exponential-map target.** Added `maximalIntegralCurve` and `isMIntegralCurveOn_maximalIntegralCurve`, with a note on where γ_{p,v} comes from. It stays `absent`: there is no exponential map, and the review says not to mark it built.
- **Summary.** "a chosen maximal geodesic" in the missing list is replaced by the identification of the spray's maximal integral curve with J(p,v) and the homogeneity identity. The list of what exists gains the chosen maximal integral curve of the spray.

## RT-AUDIT-17/38 (medium, missing): norm comparison and endpoint contradiction (HopfRinow Layer 3)

- **Citations added.** In the (c) ⇒ (d) target: `eventually_norm_trivializationAt_lt` (Mathlib/Topology/VectorBundle/Riemannian.lean:223), `eventually_norm_symmL_trivializationAt_lt` (:328) and `not_mapClusterPt_nhdsLT_maximalIntegralCurve` (Maximal.lean:264).
- **Named in the note instead.** The left-endpoint form `not_mapClusterPt_nhdsGT_maximalIntegralCurve` (:296), to respect the cap as the review asks.
- **Note.** It is extended as the finding asks, adding the identification with the chosen geodesic to what remains.
- **Library value.** Stays `absent`.

## Checks

- `research/blueprint/audit/AUDIT-17.result.json` parses. Every target has at most five declarations.
- Every declaration added or moved resolves in the pinned `declarations.tsv` as (library, name, file, line). The only unresolved citations in the file are pre-existing ones that the index omits: `PMF`, and the instances `complete_of_proper` and `proper_of_compact`, all present at the cited lines.
- Every textual substitution was asserted to match exactly once. The diff touches only the targets, duplicates and summaries named above.
- No Lean file is involved, so nothing was compiled.
