import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Algebra.Ring.GeomSum
import Mathlib.Tactic.Ring
import Mathlib.Tactic.LinearCombination

/-!
# Conditional automorphy lifting for GL_n over arbitrary number fields — suggested Lean

**This file is not the roadmap and it is not exhaustive.** The roadmap document
`research/blueprint/readmes/AutomorphyLiftingBeyondTaylorWiles.md` is definitive. The statements
below suggest Lean forms, so that contributors and reviewers converge on names and signatures.
Everything is proved by `sorry` or by a short real proof; nothing here claims an implementation.

The arithmetic carriers of this roadmap (arithmetic quotients of `Res_{F/ℚ} PGL_n` and their Betti
cohomology, Taylor–Wiles levels, Galois groups with Frobenius elements, global and local
deformation rings, patched complexes, cuspidal automorphic representations) are not available at the
pinned Mathlib `082e2d3` and Tau Ceti `f790474`; they are targets of other roadmaps
(ArithmeticLocallySymmetricSpaces, IntegralHeckeAndGaloisDeterminants, GlobalGaloisDeformations,
LocalGaloisDeformationRings, DeformationAndDerivedPatchingAlgebra, AutomorphicFormsOnReductiveGroups).
This file types what the pins can state — the invariants `l₀`, `q₀`, the archimedean count, the
numerical coincidence, and the elementary algebra behind Lemma 9.6 and cuspidal recognition — and the
closing comment lists the statements that are not typed at the pins, grouped by the carriers they need.
-/

namespace BeyondTW

open NumberField NumberField.InfinitePlace

/-! ## The invariants `l₀` and `q₀` of `Res_{F/ℚ} PGL_n` (CG18 §8.4)

These are prototypes of the targets of AutomorphicFormsOnReductiveGroups AF.4/l0-q0-invariants
(`Automorphic.ell0`, `Automorphic.q0`), restated here only so that the numerical coincidence can be
typed; once those declarations exist, use them and delete these. -/

/-- The defect `l₀ = r₁ ⌊(n-1)/2⌋ + r₂ (n-1)` of `Res_{F/ℚ} PGL_n` for `F` of signature `(r₁, r₂)`. -/
def ell0 (r₁ r₂ n : ℕ) : ℕ := r₁ * ((n - 1) / 2) + r₂ * (n - 1)

/-- The real dimension `2q₀ + l₀` of the locally symmetric space of `Res_{F/ℚ} PGL_n`. -/
def dimY (r₁ r₂ n : ℕ) : ℕ := r₁ * (n ^ 2 - 1 - n * (n - 1) / 2) + r₂ * (n ^ 2 - 1)

/-- The lowest degree `q₀` of tempered cuspidal cohomology. -/
def q0 (r₁ r₂ n : ℕ) : ℕ := (dimY r₁ r₂ n - ell0 r₁ r₂ n) / 2

/-- `2 q₀ + l₀ = dim Y`: the difference `dim Y - l₀` is even. -/
theorem two_q0_add_ell0 (r₁ r₂ n : ℕ) : 2 * q0 r₁ r₂ n + ell0 r₁ r₂ n = dimY r₁ r₂ n := by
  sorry

/-- `l₀` for a number field, through Mathlib's counts of real and complex places. -/
noncomputable def ell0Field (K : Type*) [Field K] [NumberField K] (n : ℕ) : ℕ :=
  ell0 (nrRealPlaces K) (nrComplexPlaces K) n

/-- `q₀` for a number field. -/
noncomputable def q0Field (K : Type*) [Field K] [NumberField K] (n : ℕ) : ℕ :=
  q0 (nrRealPlaces K) (nrComplexPlaces K) n

-- Imaginary quadratic field, `n = 2`: `l₀ = q₀ = 1`, `dim Y = 3`.
example : ell0 0 1 2 = 1 := by decide
example : q0 0 1 2 = 1 := by decide
example : dimY 0 1 2 = 3 := by decide
-- `GL_3` over `ℚ`: `(q₀, l₀) = (2, 1)`, `dim Y = 5`.
example : ell0 1 0 3 = 1 := by decide
example : q0 1 0 3 = 2 := by decide
-- CM quartic field, `n = 2`: `(q₀, l₀) = (2, 2)`.
example : ell0 0 2 2 = 2 := by decide
example : q0 0 2 2 = 2 := by decide
-- `ℚ`, `n = 2`: defect zero, `q₀ = 1` (modular curves).
example : ell0 1 0 2 = 0 := by decide
example : q0 1 0 2 = 1 := by decide

/-- Totally real `F` of degree `d` and `n = 2`: defect zero and `q₀ = d` (Hilbert modular varieties). -/
theorem ell0_totallyReal_two (d : ℕ) : ell0 d 0 2 = 0 ∧ q0 d 0 2 = d := by
  sorry

/-- For `GL_1` (not `PGL_1`) the defect is the unit rank `r₁ + r₂ - 1` (CG18 §8.2). -/
theorem gl1_defect_eq_unitRank (K : Type*) [Field K] [NumberField K] :
    nrRealPlaces K + nrComplexPlaces K - 1 = Units.rank K := by
  rw [Units.rank, card_eq_nrRealPlaces_add_nrComplexPlaces]

/-! ## The archimedean count (CG18 §8.4, equation (1))

A numerical prototype of ArithmeticGaloisDuality R02.6/archimedean-adjoint-dimensions, which owns the
Galois-cohomological statement; only the arithmetic used by the numerical coincidence is typed. -/

/-- `h⁰(ℝ, ad⁰ V)` for a rank-`(a+b)` representation whose complex conjugation has eigenspaces of
dimensions `a` and `b`. -/
def realAdjointH0 (a b : ℕ) : ℕ := a ^ 2 + b ^ 2 - 1

/-- A balanced (odd) involution: `h⁰(ℝ, ad⁰) = n(n-1)/2 + ⌊(n-1)/2⌋`. -/
theorem realAdjointH0_balanced (n : ℕ) (hn : 1 ≤ n) :
    realAdjointH0 ((n + 1) / 2) (n / 2) = n * (n - 1) / 2 + (n - 1) / 2 := by
  sorry

/-- Summing over the archimedean places of an odd representation:
`Σ_{v|∞} h⁰(F_v, ad⁰) = [F:ℚ] n(n-1)/2 + l₀`. -/
theorem archimedean_count (r₁ r₂ n : ℕ) (hn : 1 ≤ n) :
    r₁ * realAdjointH0 ((n + 1) / 2) (n / 2) + r₂ * (n ^ 2 - 1) =
      (r₁ + 2 * r₂) * (n * (n - 1) / 2) + ell0 r₁ r₂ n := by
  sorry

example : realAdjointH0 1 1 = 1 := by decide
example : realAdjointH0 2 1 = 4 := by decide
-- An unbalanced involution (complex conjugation trivial, `n = 2`) is not odd: `h⁰ = 3`, not `1`.
example : realAdjointH0 2 0 = 3 := by decide

/-! ## The numerical coincidence (CG18 Proposition 8.5 and §9.5) -/

/-- The number `g = q + |T| - 1 - [F:ℚ] n(n-1)/2 - l₀` of variables of `R_∞` over the local ring. -/
def twVariables (q T d n l₀ : ℤ) : ℤ := q + T - 1 - d * (n * (n - 1) / 2) - l₀

/-- `dim R^1_loc + g = 1 + q + j - l₀` with `j = n²|T| - 1`: the patched ring has the dimension of
`S_∞ ⊗ O^□` minus `l₀`. -/
theorem patched_ring_dimension (q T d n l₀ : ℤ) :
    (1 + T * (n ^ 2 - 1) + d * (n * (n - 1) / 2)) + twVariables q T d n l₀ =
      1 + q + (n ^ 2 * T - 1) - l₀ := by
  unfold twVariables
  ring

-- `F = ℚ(i)`, `n = 2`, `T = S_p` with one place, `q = 3`: `g = 3 + 1 - 1 - 2 - 1 = 0`.
example : twVariables 3 1 2 2 1 = 0 := by decide

/-! ## The algebra behind Lemma 9.6 -/

/-- The Gram matrix `φ^∨ ∘ φ` of the two degeneracy maps at a Taylor–Wiles prime, written in the
Frobenius eigenvalues (`T_x = α + β`, `N(x) = αβ`): its determinant is `(α² - 1)(β² - 1)`. -/
theorem degeneracy_gram_det {R : Type*} [CommRing R] (α β : R) :
    Matrix.det !![α * β + 1, α + β; α + β, α * β + 1] = (α ^ 2 - 1) * (β ^ 2 - 1) := by
  rw [Matrix.det_fin_two_of]
  ring

/-- Distinct residual eigenvalues with product `1` are not `±1`; so `U_{x²} - 1` is a unit on the
`α`-part and the Gram matrix is invertible (CG18 Lemma 9.6). -/
theorem sq_ne_one_of_mul_eq_one_of_ne {K : Type*} [Field K] (α β : K) (h : α * β = 1)
    (hne : α ≠ β) : α ^ 2 ≠ 1 := by
  sorry

/-- Unit Gram determinant at a Taylor–Wiles prime. -/
theorem degeneracy_gram_isUnit {R : Type*} [CommRing R] (α β : R) (hα : IsUnit (α ^ 2 - 1))
    (hβ : IsUnit (β ^ 2 - 1)) : IsUnit (Matrix.det !![α * β + 1, α + β; α + β, α * β + 1]) := by
  rw [degeneracy_gram_det]
  exact hα.mul hβ

-- Over `𝔽₇` with `α = 2`, `β = 4` (`αβ = 1`): the determinant is `3 · 15 = 3 ≠ 0`.
example : ((2 : ZMod 7) ^ 2 - 1) * ((4 : ZMod 7) ^ 2 - 1) = 3 := by decide

/-! ## The congruence behind cuspidal recognition -/

/-- If `q ≡ 1` modulo an ideal `I`, then `c q^j ≡ c`: the roots `c, cq, …, cq^{k-1}` of a residual
(Speh) Hecke polynomial at a prime `λ` with `N(λ) ≡ 1 mod p` coincide modulo `p`, so every residual
eigenvalue has multiplicity at least `k` (BT.5/cuspidal-recognition). -/
theorem mul_pow_sub_mem_of_sub_one_mem {A : Type*} [CommRing A] (I : Ideal A) (q c : A)
    (hq : q - 1 ∈ I) (j : ℕ) : c * q ^ j - c ∈ I := by
  obtain ⟨d, hd⟩ := sub_one_dvd_pow_sub_one q j
  have : c * q ^ j - c = c * d * (q - 1) := by
    rw [mul_assoc, mul_comm d, ← hd]; ring
  rw [this]
  exact I.mul_mem_left _ hq

end BeyondTW

/-!
## Statements not typed at the pins

The following packet targets need carriers that the pinned libraries do not have. They are listed
under the names the packet gives them, grouped by layer and by the carriers each layer needs; the
roadmap document states each one precisely.

### BT.0 — needs arithmetic quotients Y(K) of Res_{F/ℚ} PGL_n at Iwahori and Taylor–Wiles levels, their Betti cohomology with local systems, and Hecke correspondences (ArithmeticLocallySymmetricSpaces ALS.0–ALS.3; IntegralHeckeAndGaloisDeterminants IHG.2–IHG.3)

* The local systems O(ψ) of Iwahori characters (`BT.0/iwahori-character-local-system`): `BeyondTW.iwahoriCharLocalSystem`, `BeyondTW.iwahoriCharLocalSystem_one`, `BeyondTW.iwahoriCharLocalSystem_mod_varpi`, `BeyondTW.iwahoriCharLocalSystem_dual`, `BeyondTW.iwahoriCharLocalSystem_pullback`, `iwahoriChar_trivial`, `iwahoriChar_needs_congruence`, `iwahoriChar_product_condition`, `iwahoriChar_residual`.
* Hecke operators T_{α,k}, V_x and diamond operators at Taylor–Wiles level (`BT.0/tw-hecke-operators`): `BeyondTW.heckeOp`, `BeyondTW.heckeOp_comm`, `BeyondTW.diamond`, `BeyondTW.heckeOp_unit_eq_diamond`, `BeyondTW.heckeOp_central`, `BeyondTW.heckeOp_pullback`, `heckeOp_unnormalized_n2`, `heckeOp_identity`, `heckeOp_diamond_trivial_Q_empty`, `heckeOp_not_normalized`.
* The Hecke algebras T^an_{Q,ψ} and T_{Q,ψ} (Definition 9.1) (`BT.0/tw-hecke-algebra`): `BeyondTW.heckeAlgebra`, `BeyondTW.heckeAlgebraFull`, `BeyondTW.heckeAlgebra_finite`, `BeyondTW.heckeAlgebra_localization_prod`, `BeyondTW.heckeAlgebra_restrict`, `BeyondTW.SameGaloisRep`, `BeyondTW.heckeAlgebra_empty`, `heckeAlgebra_level_one_Q`, `heckeAlgebra_finite_O`, `heckeAlgebra_not_flat`, `heckeAlgebra_intermediate_needed`.
* The Taylor–Wiles maximal ideal m_Q and projector e_Q (`BT.0/tw-maximal-ideal-and-projector`): `BeyondTW.twMaximalIdeal`, `BeyondTW.twProjector`, `BeyondTW.twProjector_isIdempotent`, `BeyondTW.twProjector_range`, `BeyondTW.twProjector_indep`, `BeyondTW.twProjector_comm_diamond`, `twProjector_empty`, `twProjector_n2`, `twProjector_toy_operator`, `twProjector_needs_simple_root`.
* Residual independence of the Iwahori character and the dual local system (`BT.0/residual-character-independence`): `BeyondTW.residual_character_independence`.
* Serre modular of minimal level (`BT.0/serre-modular-minimal-level`): `BeyondTW.SerreModularMinimal`, `BeyondTW.SerreModularMinimal.maximalIdeal`, `BeyondTW.SerreModularMinimal.iff_cohomology`, `BeyondTW.SerreModularMinimal.extendScalars`, `serreModular_GL2_Q_weight2`, `serreModular_reducible_excluded`, `serreModular_unramified_level`, `serreModular_characteristic_zero_not_required`.

### BT.1 — needs absolute Galois groups of number fields with decomposition and inertia groups and Frobenius elements, continuous representations, and local and global deformation rings (ArithmeticGaloisRepresentations; LocalGaloisDeformationRings; GlobalGaloisDeformations)

* Standing residual data with an Ihara-avoidance set (`BT.1/ihara-avoidance-data`): `BeyondTW.StandingData`, `BeyondTW.StandingData.S`, `BeyondTW.StandingData.framedPlaces`, `BeyondTW.StandingData.psi`, `BeyondTW.StandingData.unramified_outside`, `BeyondTW.StandingData.extendScalars`, `standingData_R_empty`, `standingData_tate_curve`, `standingData_nonscalar_excluded`, `standingData_chi_distinct`.
* The local deformation rings R^1_loc and R^χ_loc (`BT.1/cg-local-rings`): `BeyondTW.flLocalRing`, `BeyondTW.unipotentLocalRing`, `BeyondTW.chiLocalRing`, `BeyondTW.localRing`, `BeyondTW.localRing_mod_varpi`, `BeyondTW.unipotentLocalRing_reg_smooth`, `BeyondTW.localRing_point_criterion`, `localRing_R_empty_smooth`, `localRing_n2_steinberg`, `localRing_unipotent_not_flat`, `localRing_mod_varpi_equal`.
* Lemma 8.2 in corrected form: the local rings for Ihara avoidance (`BT.1/local-ring-properties`): `BeyondTW.localRing_properties`.
* The global deformation data S_Q and S^χ_Q (`BT.1/cg-global-deformation-data`): `BeyondTW.globalData`, `BeyondTW.globalRing`, `BeyondTW.framedGlobalRing`, `BeyondTW.globalRing_deltaAlgebra`, `BeyondTW.globalRing_augmentation`, `BeyondTW.globalRing_mod_varpi`, `BeyondTW.globalRing_traces`, `globalData_Q_empty`, `globalData_n2_TW_ring`, `globalData_deltaAction_trivial_unramified`, `globalData_unrestricted_not_TW`.
* Framing and presentation over the local rings (Lemma 8.3, Proposition 8.4) (`BT.1/framing-and-presentation`): `BeyondTW.framed_presentation`.
* The numerical coincidence (Proposition 8.5) (`BT.1/numerical-coincidence`): `BeyondTW.numerical_coincidence`.
* Lifts satisfying the hypotheses of Theorem 5.16 have type S (`BT.1/lift-has-type-s`): `BeyondTW.lift_isTypeS`.
* The case GL_1: defect l_0 = r_1 + r_2 − 1 and class field theory (`BT.1/gl1-defect-example`): `BeyondTW.gl1_unramified_classGroup`.

### BT.2 — needs the Hecke algebras of BT.0 together with Galois representations valued in them (both carriers above)

* Conjecture B, residual and integral Galois representations (hypothesis) (`BT.2/conj-b-galois-type`): `BeyondTW.ConjB.GaloisType`, `BeyondTW.ConjB.GaloisType.residual`, `BeyondTW.ConjB.GaloisType.lift`, `BeyondTW.ConjB.IsNonEisenstein`, `BeyondTW.ConjB.GaloisType.det`, `conjBGal_eisenstein_GL2`, `conjBGal_classical`, `conjBGal_unnormalized`, `conjBGal_unique`.
* Conjecture B(1)–(3) and the Taylor–Wiles compatibility (6) (hypothesis) (`BT.2/conj-b-local-global`): `BeyondTW.ConjB.LocalGlobal`, `BeyondTW.ConjB.LocalGlobal.atP`, `BeyondTW.ConjB.LocalGlobal.atQ`, `BeyondTW.ConjB.LocalGlobal.atR`, `BeyondTW.ConjB.LocalGlobal.diamond`, `BeyondTW.ConjB.LocalGlobal.empty`, `conjBLgc_Q_empty`, `conjBLgc_psi_trivial_unipotent`, `conjBLgc_diamond_needed`, `conjBLgc_GL2_Q`.
* Conjecture B(4): vanishing outside [q_0, q_0 + l_0] and on the boundary (hypothesis) (`BT.2/conj-b-vanishing`): `BeyondTW.ConjB.Vanishing`, `BeyondTW.ConjB.Vanishing.range`, `BeyondTW.ConjB.Vanishing.boundary`, `BeyondTW.ConjB.Vanishing.compact_eq`, `BeyondTW.ConjB.Vanishing.dual`, `conjBVan_defect_zero`, `conjBVan_imag_quad`, `conjBVan_eisenstein_fails`, `conjBVan_numerics`.
* Conjecture B(5): no new cohomology at Taylor–Wiles level (hypothesis) (`BT.2/conj-b-tw-comparison`): `BeyondTW.ConjB.TWComparison`, `BeyondTW.ConjB.TWComparison.map`, `BeyondTW.ConjB.TWComparison.empty`, `BeyondTW.ConjB.TWComparison.mono`, `conjBTw_empty`, `conjBTw_n2`, `conjBTw_without_projector`, `conjBTw_toy`.
* Conjecture B for a standing datum (the hypothesis bundle) (`BT.2/conjecture-b`): `BeyondTW.ConjB`, `BeyondTW.ConjB.forField`, `BeyondTW.ConjB.withoutVanishing`, `BeyondTW.ConjB.mk`, `BeyondTW.ConjB.mono_Q`, `conjB_empty_clauses`, `conjB_GL2_Q`, `conjB_not_trivially_true`, `conjB_withoutVanishing_weaker`.
* Dévissage for Conjecture B(4) and (5) (`BT.2/conj-b-devissage`): `BeyondTW.ConjB.devissage`.
* Conjecture B gives R_{S_Q} ↠ T^an_{Q,ψ,m} as O[Δ_Q]-algebras (`BT.2/conj-b-type-s-surjection`): `BeyondTW.ConjB.globalRing_surj_hecke`.
* Conjecture B(4)(a) in small rank (Remark 9.3) (`BT.2/conj-b-small-rank`): `BeyondTW.ConjB.vanishing_small_rank`.

### BT.3 — needs S-arithmetic subgroups of PSL_2, their group cohomology and the Bruhat–Tits tree (ReductiveGroupsPartII RG2.2; ModularCurvesPartII R14.4), and smooth representations of GL_n(F_x) (SmoothRepresentationsOfLocalGroups SR.5)

* Reduction from PGL_2 to PSL_2 arithmetic groups (`BT.3/psl2-reduction`): `BeyondTW.psl2_reduction`.
* The S-arithmetic amalgam G = Γ^1 ∗_{Γ^1_0(x)} Γ^1 (`BT.3/global-ihara-amalgam`): `BeyondTW.iharaAmalgam`, `BeyondTW.iharaAmalgam.isPushout`, `BeyondTW.iharaAmalgam.isCongruence`, `BeyondTW.iharaAmalgam.mem_g`, `iharaAmalgam_Q`, `iharaAmalgam_edge_quotient`, `iharaAmalgam_not_PGL2`, `iharaAmalgam_degenerate_index`.
* The operator U_{x²} on Γ^1_0(x)-cohomology (`BT.3/u-x-squared`): `BeyondTW.Ux2`, `BeyondTW.Ux2_on_amalgam`, `BeyondTW.Ux2_eq_sq`, `BeyondTW.Ux2_indep_scalar`, `Ux2_old_eigenvalues`, `Ux2_on_G_trivial`, `Ux2_unnormalized`, `Ux2_mod_p`.
* The Hecke-equivariant Lyndon sequence of the amalgam (`BT.3/lyndon-hecke-equivariance`): `BeyondTW.lyndon_hecke_equivariant`.
* Lemma 9.6: condition (5) of Conjecture B for n = 2 (`BT.3/lemma-9-6`): `BeyondTW.lemma_9_6`.
* No new cohomology at primes with distinct Frobenius eigenvalues (§9.4) (`BT.3/distinct-eigenvalue-comparison`): `BeyondTW.distinct_eigenvalue_comparison`.

### BT.4 — needs perfect complexes over completed group rings with derived Hecke actions (DeformationAndDerivedPatchingAlgebra P7–P8) on the Betti complexes of BT.0

* The minimal complexes D̃_N and D̃^χ_N (`BT.4/localized-tw-complexes`): `BeyondTW.twComplex`, `BeyondTW.twComplex_degrees`, `BeyondTW.twComplex_minimal`, `BeyondTW.twComplex_homology`, `BeyondTW.twComplex_residual_rank`, `BeyondTW.twComplex_hecke`, `twComplex_defect_zero`, `twComplex_ranks_constant`, `twComplex_without_vanishing`, `twComplex_imag_quad_length`.
* The two patching data of the proof of Theorem 9.19 (`BT.4/patching-input-data`): `BeyondTW.patchingDatum`, `BeyondTW.patchingDatum.dim`, `BeyondTW.patchingDatum.residualComplex`, `BeyondTW.patchingDatum.surjection`, `BeyondTW.patchingDatum.modVarpi`, `BeyondTW.patchingDatum.top`, `patchingDatum_l0_zero`, `patchingDatum_reflection`, `patchingDatum_shift_wrong`, `patchingDatum_incompatible_choice`.
* Comparisons of the two data modulo ϖ (`BT.4/mod-varpi-comparisons`): `BeyondTW.patchingDatum_modVarpi`.
* Verification of the hypotheses of the two-datum patching theorem (`BT.4/patching-hypotheses-verified`): `BeyondTW.patching_hypotheses`.

### BT.5 — needs patched complexes and near faithfulness (DeformationAndDerivedPatchingAlgebra P8, P9, R03.6) and cuspidal automorphic representations of GL_n(𝔸_F) (AutomorphicFormsOnReductiveGroups; AutomorphicSpectralTheory)

* The patched complexes P^{1,□}_∞ and P^{2,□}_∞ (`BT.5/patched-complexes`): `BeyondTW.patched_complexes`.
* Near faithfulness on the χ side (`BT.5/chi-side-nearly-faithful`): `BeyondTW.chi_side_nearlyFaithful`.
* Transfer to the unipotent side and descent to R_S (`BT.5/unipotent-side-nearly-faithful`): `BeyondTW.unipotent_side_nearlyFaithful`.
* Theorem 9.19: near faithfulness of H^{q_0}(Y, K/O)^∨_m over R_S (`BT.5/theorem-9-19`): `BeyondTW.theorem_9_19`.
* Minimal R = T and freeness when the local rings are smooth (`BT.5/minimal-r-equals-t`): `BeyondTW.minimal_R_eq_T`.
* Cuspidal recognition of the support of H^{q_0}(Y)_m (`BT.5/cuspidal-recognition`): `BeyondTW.cuspidal_recognition`.
* The maximal ideal m from hypothesis (8) (`BT.5/maximal-ideal-from-hypothesis-8`): `BeyondTW.maximalIdeal_of_hyp8`.
* Theorem 5.16: conditional modularity lifting for GL_n over any number field (`BT.5/theorem-5-16`): `BeyondTW.theorem_5_16`.
* The case n = 2 over an imaginary quadratic field (`BT.5/imaginary-quadratic-case`): `BeyondTW.imagQuad_case`.
* Defect zero: n = 2 over a totally real field (`BT.5/defect-zero-case`): `BeyondTW.defectZero_case`.

-/
