/-
Copyright (c) 2026 Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.Analysis.SpecialFunctions.Gamma.Deligne
import Mathlib.Analysis.Calculus.Deriv.Mul
import Mathlib.NumberTheory.NumberField.Units.Basic
import Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass
import TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.Regulator

/-!
# Gross–Zagier formulas and arithmetic heights — suggested declarations (GZ.0, first checkpoint)

This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. All proposed results are unproved prototypes at the pinned baseline
(Mathlib 082e2d3, Tau Ceti f790474); the file has not been compiled.

GZ.0 is the normalisation table. At the pin, Tau Ceti's `Point.canonicalHeight` is
`½ · lim h(x(2ⁿP))/4ⁿ`, the height attached to `(O)`; `neronTatePairing` is its halved polar
form; `regulator` is the Gram determinant of that pairing. The BSD regulator (Müller–Stoll,
LMFDB) is `2 ^ r` times `regulator`. This file names the x-height `ĥ_x`, the BSD pairing and
the BSD regulator so that no consumer has to guess.

The full real period of EllipticCurves Layer 7 is not yet in Tau Ceti; it appears below as a
marked placeholder named after that layer's plan.
-/

noncomputable section

open Filter Topology Height Matrix

/-! ## Gram determinants -/

namespace TauCeti.GrossZagier

/-- GZ.0/gram-determinant-rescaling. -/
theorem det_gram_smul {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M] {r : ℕ}
    (B : M →ₗ[R] M →ₗ[R] R) (c : R) (v : Fin r → M) :
    (Matrix.of fun i j ↦ (c • B) (v i) (v j)).det =
      c ^ r * (Matrix.of fun i j ↦ B (v i) (v j)).det := by
  sorry

end TauCeti.GrossZagier

namespace WeierstrassCurve.Affine

variable {F : Type*} [Field F] {W : Affine F} [AdmissibleAbsValues F] [DecidableEq F]

/-! ## The x-height and the BSD pairing -/

/-- GZ.0/x-height-canonical-height: `ĥ_x = lim h(x(2ⁿP))/4ⁿ = 2 · canonicalHeight`. -/
def Point.xCanonicalHeight (P : W.Point) : ℝ := 2 * P.canonicalHeight

theorem Point.xCanonicalHeight_eq_two_mul (P : W.Point) :
    P.xCanonicalHeight = 2 * P.canonicalHeight := rfl

theorem Point.tendsto_naiveHeight_div_four_pow [W.toAffine.IsElliptic] (P : W.Point) :
    Tendsto (fun n : ℕ ↦ ((2 ^ n) • P).naiveHeight / 4 ^ n) atTop (𝓝 P.xCanonicalHeight) := by
  sorry

@[simp] theorem Point.xCanonicalHeight_nsmul [W.toAffine.IsElliptic] (n : ℕ) (P : W.Point) :
    (n • P).xCanonicalHeight = n ^ 2 * P.xCanonicalHeight := by sorry

theorem Point.xCanonicalHeight_eq_zero_iff [W.toAffine.IsElliptic]
    [Northcott (fun P : W.Point ↦ P.canonicalHeight)] (P : W.Point) :
    P.xCanonicalHeight = 0 ↔ IsOfFinAddOrder P := by sorry

theorem Point.xCanonicalHeight_zero : (0 : W.Point).xCanonicalHeight = 0 := by sorry

theorem Point.xCanonicalHeight_ne_canonicalHeight [W.toAffine.IsElliptic] (P : W.Point)
    (hP : P.canonicalHeight ≠ 0) : P.xCanonicalHeight ≠ P.canonicalHeight := by sorry

theorem Point.xCanonicalHeight_two_nsmul [W.toAffine.IsElliptic] (P : W.Point) :
    ((2 : ℕ) • P).xCanonicalHeight = 4 * P.xCanonicalHeight := by sorry

theorem Point.xCanonicalHeight_eq_neronTatePairing [W.toAffine.IsElliptic] (P : W.Point) :
    P.xCanonicalHeight = 2 * neronTatePairing W P P := by sorry

variable (W) in
/-- GZ.0/bsd-height-pairing: the polar form of `canonicalHeight`, `2 •` Tau Ceti's pairing. -/
def bsdHeightPairing [W.toAffine.IsElliptic] : LinearMap.BilinMap ℤ W.Point ℝ :=
  QuadraticMap.polarBilin (canonicalHeightQuadratic W)

theorem bsdHeightPairing_apply [W.toAffine.IsElliptic] (P Q : W.Point) :
    bsdHeightPairing W P Q = (P + Q).canonicalHeight - P.canonicalHeight - Q.canonicalHeight := by
  sorry

theorem bsdHeightPairing_eq_two_smul [W.toAffine.IsElliptic] :
    bsdHeightPairing W = 2 • neronTatePairing W := by sorry

@[simp] theorem bsdHeightPairing_self [W.toAffine.IsElliptic] (P : W.Point) :
    bsdHeightPairing W P P = P.xCanonicalHeight := by sorry

theorem bsdHeightPairing_comm [W.toAffine.IsElliptic] (P Q : W.Point) :
    bsdHeightPairing W P Q = bsdHeightPairing W Q P := by sorry

theorem bsdHeightPairing_eq_zero_of_isOfFinAddOrder_left [W.toAffine.IsElliptic] {P : W.Point}
    (hP : IsOfFinAddOrder P) (Q : W.Point) : bsdHeightPairing W P Q = 0 := by sorry

theorem bsdHeightPairing_self_zero [W.toAffine.IsElliptic] : bsdHeightPairing W 0 0 = 0 := by
  sorry

theorem bsdHeightPairing_ne_neronTatePairing [W.toAffine.IsElliptic] (P : W.Point)
    (hP : P.canonicalHeight ≠ 0) : bsdHeightPairing W P P ≠ neronTatePairing W P P := by sorry

theorem bsdHeightPairing_two_nsmul [W.toAffine.IsElliptic] (P : W.Point) :
    bsdHeightPairing W ((2 : ℕ) • P) P = 2 * P.xCanonicalHeight := by sorry

theorem bsdHeightPairing_self_eq_two_mul [W.toAffine.IsElliptic] (P : W.Point) :
    bsdHeightPairing W P P = 2 * P.canonicalHeight := by sorry

/-! ## The BSD regulator -/

variable (W) in
/-- GZ.0/bsd-regulator: the Gram determinant of the BSD pairing on a basis of `E(K)/tors`. -/
def bsdRegulator [W.toAffine.IsElliptic] [Module.Finite ℤ (PointModTorsion W)] : ℝ :=
  |((2 : ℝ) • neronTateGramMatrix W (Module.finBasis ℤ (PointModTorsion W))).det|

theorem bsdRegulator_eq_two_pow_mul_regulator [W.toAffine.IsElliptic]
    [Module.Finite ℤ (PointModTorsion W)] :
    bsdRegulator W = 2 ^ Module.finrank ℤ (PointModTorsion W) * regulator W := by sorry

theorem bsdRegulator_eq_abs_det [W.toAffine.IsElliptic] [Module.Finite ℤ (PointModTorsion W)]
    {ι : Type*} [Fintype ι] [DecidableEq ι] (b : Module.Basis ι ℤ (PointModTorsion W)) :
    bsdRegulator W = |((2 : ℝ) • neronTateGramMatrix W b).det| := by sorry

@[simp] theorem bsdRegulator_of_finrank_eq_zero [W.toAffine.IsElliptic]
    [Module.Finite ℤ (PointModTorsion W)] (h : Module.finrank ℤ (PointModTorsion W) = 0) :
    bsdRegulator W = 1 := by sorry

theorem bsdRegulator_of_finrank_eq_one [W.toAffine.IsElliptic]
    [Module.Finite ℤ (PointModTorsion W)] (b : Module.Basis (Fin 1) ℤ (PointModTorsion W))
    (P : W.Point) (hP : (QuotientAddGroup.mk P : PointModTorsion W) = b 0) :
    bsdRegulator W = P.xCanonicalHeight := by sorry

theorem bsdRegulator_rank_zero [W.toAffine.IsElliptic] [Module.Finite ℤ (PointModTorsion W)]
    (h : Module.finrank ℤ (PointModTorsion W) = 0) : bsdRegulator W = regulator W := by sorry

theorem bsdRegulator_rank_one [W.toAffine.IsElliptic] [Module.Finite ℤ (PointModTorsion W)]
    (h : Module.finrank ℤ (PointModTorsion W) = 1) : bsdRegulator W = 2 * regulator W := by sorry

theorem bsdRegulator_ne_regulator [W.toAffine.IsElliptic] [Module.Finite ℤ (PointModTorsion W)]
    (h : 0 < Module.finrank ℤ (PointModTorsion W)) (hreg : regulator W ≠ 0) :
    bsdRegulator W ≠ regulator W := by sorry

theorem bsdRegulator_eq_xCanonicalHeight [W.toAffine.IsElliptic]
    [Module.Finite ℤ (PointModTorsion W)] (h : Module.finrank ℤ (PointModTorsion W) = 1)
    (P : W.Point) (hP : ∀ Q : W.Point, ∃ n : ℤ, IsOfFinAddOrder (Q - n • P)) :
    bsdRegulator W = P.xCanonicalHeight := by sorry

/-! ## The canonical height on `E(K) ⊗ ℚ` -/

open TensorProduct in
variable (W) in
/-- GZ.0/canonical-height-rational. -/
def canonicalHeightRat [W.toAffine.IsElliptic] : QuadraticMap ℚ (W.Point ⊗[ℤ] ℚ) ℝ := sorry

open TensorProduct

@[simp] theorem canonicalHeightRat_tmul [W.toAffine.IsElliptic] (P : W.Point) (q : ℚ) :
    canonicalHeightRat W (P ⊗ₜ q) = (q : ℝ) ^ 2 * P.canonicalHeight := by sorry

theorem canonicalHeightRat_unique [W.toAffine.IsElliptic]
    (Q : QuadraticMap ℚ (W.Point ⊗[ℤ] ℚ) ℝ) (hQ : ∀ P : W.Point, Q (P ⊗ₜ 1) = P.canonicalHeight) :
    Q = canonicalHeightRat W := by sorry

theorem canonicalHeightRat_nonneg [W.toAffine.IsElliptic] (x : W.Point ⊗[ℤ] ℚ) :
    0 ≤ canonicalHeightRat W x := by sorry

theorem canonicalHeightRat_inv_nat [W.toAffine.IsElliptic] (P : W.Point) (m : ℕ) :
    canonicalHeightRat W (P ⊗ₜ (1 / m : ℚ)) = P.canonicalHeight / m ^ 2 := by sorry

theorem canonicalHeightRat_torsion [W.toAffine.IsElliptic] {P : W.Point}
    (hP : IsOfFinAddOrder P) : canonicalHeightRat W (P ⊗ₜ 1) = 0 := by sorry

theorem canonicalHeightRat_one [W.toAffine.IsElliptic] (P : W.Point) :
    canonicalHeightRat W (P ⊗ₜ 1) = P.canonicalHeight := by sorry

theorem canonicalHeightRat_not_linear [W.toAffine.IsElliptic] (P : W.Point)
    (hP : P.canonicalHeight ≠ 0) : canonicalHeightRat W (P ⊗ₜ 2) ≠ 2 * P.canonicalHeight := by
  sorry

/-- GZ.0/trace-versus-average: the average of `h` points is their sum over `h`. -/
theorem canonicalHeightRat_average [W.toAffine.IsElliptic] {h : ℕ} (P : Fin h → W.Point) :
    canonicalHeightRat W ((∑ i, P i) ⊗ₜ (1 / h : ℚ)) = (∑ i, P i).canonicalHeight / h ^ 2 := by
  sorry

end WeierstrassCurve.Affine

/-! ## Centres, CM constants and conventions -/

namespace TauCeti.GrossZagier

open Complex

/-- GZ.0/unitary-and-motivic-centres: at a zero of `L`, `Λ′(1) = N^{1/2} Γ_ℂ(1) L′(1)`, and
`Γ_ℂ(1) = 1/π`. -/
theorem deriv_completed_at_one_of_eq_zero (L : ℂ → ℂ) (N : ℕ) (hL : DifferentiableAt ℂ L 1)
    (h0 : L 1 = 0) :
    deriv (fun s ↦ (N : ℂ) ^ (s / 2) * Gammaℂ s * L s) 1 = (N : ℂ) ^ (1 / 2 : ℂ) / π * deriv L 1 ∧
    deriv (fun s ↦ L (s + 1 / 2)) (1 / 2) = deriv L 1 := by sorry

/-- GZ.0/heegner-unit-index: `u(K) = #μ(K)/2`. -/
def unitIndex (K : Type*) [Field K] [NumberField K] : ℕ := NumberField.Units.torsionOrder K / 2

theorem two_mul_unitIndex (K : Type*) [Field K] [NumberField K]
    (hK : NumberField.InfinitePlace.nrRealPlaces K = 0) :
    2 * unitIndex K = NumberField.Units.torsionOrder K := by sorry

theorem unitIndex_eq_one_iff (K : Type*) [Field K] [NumberField K]
    (hK : Module.finrank ℚ K = 2) (hc : NumberField.InfinitePlace.nrRealPlaces K = 0) :
    unitIndex K = 1 ↔ NumberField.Units.torsionOrder K = 2 := by sorry

theorem unitIndex_gaussian : unitIndex (CyclotomicField 4 ℚ) = 2 := by sorry

theorem unitIndex_eisenstein : unitIndex (CyclotomicField 3 ℚ) = 3 := by sorry

theorem unitIndex_sqrt_neg_seven (K : Type*) [Field K] [NumberField K]
    (hK : Module.finrank ℚ K = 2) (hc : NumberField.InfinitePlace.nrRealPlaces K = 0)
    (h : NumberField.discr K = -7) : unitIndex K = 1 := by sorry

theorem unitIndex_ne_torsionOrder (K : Type*) [Field K] [NumberField K]
    (hc : NumberField.InfinitePlace.nrRealPlaces K = 0) :
    unitIndex K ≠ NumberField.Units.torsionOrder K := by sorry

/-- GZ.0/artin-map-convention: changing the reciprocity convention replaces a character by its
inverse. -/
theorem artinConvention {A G : Type*} [CommGroup A] [Group G] (art : A →* G) (χ : G →* ℂˣ)
    (a : A) : χ ((art a)⁻¹) = (χ (art a))⁻¹ := map_inv χ (art a)

/-- EllipticCurves Layer 7 (planned there): the full real period `∫_{E(ℝ)} |ω|`. -/
def fullRealPeriod (W : WeierstrassCurve ℚ) : ℝ := sorry

/-- The least positive real period, `∫_{E(ℝ)⁰} |ω|`. -/
def leastRealPeriod (W : WeierstrassCurve ℚ) : ℝ := sorry

/-- GZ.0/real-period-components: `Ω = c∞ · Ω⁰`, with `c∞ = 2` exactly when `Δ > 0`. -/
theorem realPeriod_eq_card_components_mul (W : WeierstrassCurve ℚ) [W.IsElliptic] :
    fullRealPeriod W = (if 0 < W.Δ then 2 else 1) * leastRealPeriod W := by sorry

/-- GZ.0/height-convention-dictionary, collected. -/
theorem heightConventions {F : Type*} [Field F] {W : WeierstrassCurve.Affine F}
    [AdmissibleAbsValues F] [DecidableEq F] [W.toAffine.IsElliptic]
    [Module.Finite ℤ (WeierstrassCurve.Affine.PointModTorsion W)] :
    (∀ P : W.Point, P.xCanonicalHeight = 2 * P.canonicalHeight) ∧
    WeierstrassCurve.Affine.bsdHeightPairing W = 2 • WeierstrassCurve.Affine.neronTatePairing W ∧
    WeierstrassCurve.Affine.bsdRegulator W =
      2 ^ Module.finrank ℤ (WeierstrassCurve.Affine.PointModTorsion W) *
        WeierstrassCurve.Affine.regulator W := by sorry

end TauCeti.GrossZagier
