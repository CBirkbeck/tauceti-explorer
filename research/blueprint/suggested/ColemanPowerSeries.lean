/-
Suggested declarations only. This file is not the complete roadmap and contains
no implementations: every construction, theorem, API item and test uses sorry.
The README is normative. Missing arithmetic and measure carriers are described
in comments, not replaced by unconstrained propositions or assumed conclusions.
-/
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.Data.ZMod.Basic

noncomputable section
open scoped BigOperators
namespace TauCetiRoadmap.Campaign.ColemanPowerSeries

variable {R S : Type*} [CommRing R] [CommRing S]

/-- RJW Definition 12.8, with the formal derivative and the inverse of a unit.
No analytic logarithm or choice of integration constant is involved. -/
def logDeriv (f : (PowerSeries R)ˣ) : PowerSeries R := sorry

lemma logDeriv_def (f : (PowerSeries R)ˣ) :
    logDeriv f = (1 + PowerSeries.X) * PowerSeries.derivative R (f : PowerSeries R) *
      ((f⁻¹ : (PowerSeries R)ˣ) : PowerSeries R) := sorry

lemma logDeriv_one : logDeriv (1 : (PowerSeries R)ˣ) = 0 := sorry

lemma logDeriv_mul (f g : (PowerSeries R)ˣ) :
    logDeriv (f * g) = logDeriv f + logDeriv g := sorry

lemma logDeriv_inv (f : (PowerSeries R)ˣ) :
    logDeriv f⁻¹ = -logDeriv f := sorry

lemma logDeriv_zpow (f : (PowerSeries R)ˣ) (n : ℤ) :
    logDeriv (f ^ n) = n • logDeriv f := sorry

lemma logDeriv_const (c : Rˣ) :
    logDeriv (Units.map PowerSeries.C.toMonoidHom c) = 0 := sorry

lemma logDeriv_eq_zero_iff [IsAddTorsionFree R] (f : (PowerSeries R)ˣ) :
    logDeriv f = 0 ↔
      (f : PowerSeries R) = PowerSeries.C (PowerSeries.constantCoeff (f : PowerSeries R)) := sorry

lemma logDeriv_map (ρ : R →+* S) (f : (PowerSeries R)ˣ) :
    logDeriv (Units.map (PowerSeries.map ρ).toMonoidHom f) =
      PowerSeries.map ρ (logDeriv f) := sorry

/-- The cross-multiplied chain rule avoids dividing by a nonunit. -/
lemma logDeriv_subst (f : (PowerSeries R)ˣ) (g : PowerSeries R)
    (hg : PowerSeries.HasSubst g) :
    (1 + g) * logDeriv (Units.map (PowerSeries.substAlgHom hg).toMonoidHom f) =
      (1 + PowerSeries.X) * PowerSeries.derivative R g *
        (logDeriv f).subst g := sorry

/-- Natural-power specialization of RJW (12-2); not yet the p-adic action. -/
lemma logDeriv_power_subst (f : (PowerSeries R)ˣ) (m : ℕ)
    (hg : PowerSeries.HasSubst ((1 + PowerSeries.X : PowerSeries R) ^ m - 1)) :
    logDeriv (Units.map (PowerSeries.substAlgHom hg).toMonoidHom f) =
      (m : R) • (logDeriv f).subst ((1 + PowerSeries.X : PowerSeries R) ^ m - 1) := sorry

/-- The positive-parameter local power series, not the global cyclotomic subgroup. -/
def cyclotomicSeries (a : ℕ) : PowerSeries R := sorry

lemma cyclotomicSeries_def (a : ℕ) :
    cyclotomicSeries (R := R) a =
      ∑ i ∈ Finset.range a, (1 + PowerSeries.X : PowerSeries R) ^ i := sorry

lemma cyclotomicSeries_zero : cyclotomicSeries (R := R) 0 = 0 := sorry

lemma cyclotomicSeries_one : cyclotomicSeries (R := R) 1 = 1 := sorry

lemma X_mul_cyclotomicSeries (a : ℕ) :
    PowerSeries.X * cyclotomicSeries (R := R) a =
      (1 + PowerSeries.X : PowerSeries R) ^ a - 1 := sorry

lemma constantCoeff_cyclotomicSeries (a : ℕ) :
    PowerSeries.constantCoeff (cyclotomicSeries (R := R) a) = (a : R) := sorry

lemma isUnit_cyclotomicSeries_iff (a : ℕ) :
    IsUnit (cyclotomicSeries (R := R) a) ↔ IsUnit (a : R) := sorry

lemma cyclotomicSeries_map (ρ : R →+* S) (a : ℕ) :
    PowerSeries.map ρ (cyclotomicSeries (R := R) a) = cyclotomicSeries (R := S) a := sorry

lemma cyclotomicSeries_mul (a b : ℕ) :
    cyclotomicSeries (R := R) (a * b) =
      cyclotomicSeries (R := R) a *
        (cyclotomicSeries (R := R) b).subst
          ((1 + PowerSeries.X : PowerSeries R) ^ a - 1) := sorry

/-- The inverse is the formal power-series inverse, not inversion of T. -/
def cyclotomicSeriesUnit (a : ℕ) (ha : IsUnit (a : R)) : (PowerSeries R)ˣ := sorry

lemma cyclotomicSeriesUnit_val (a : ℕ) (ha : IsUnit (a : R)) :
    (cyclotomicSeriesUnit a ha : PowerSeries R) = cyclotomicSeries (R := R) a := sorry

lemma cyclotomicSeriesUnit_ext (a : ℕ) (ha : IsUnit (a : R))
    (u : (PowerSeries R)ˣ) (hu : (u : PowerSeries R) = cyclotomicSeries (R := R) a) :
    u = cyclotomicSeriesUnit a ha := sorry

lemma cyclotomicSeriesUnit_map (ρ : R →+* S) (a : ℕ)
    (ha : IsUnit (a : R)) (hb : IsUnit (a : S)) :
    Units.map (PowerSeries.map ρ).toMonoidHom (cyclotomicSeriesUnit a ha) =
      cyclotomicSeriesUnit a hb := sorry

lemma cyclotomicSeriesUnit_inv (a : ℕ) (ha : IsUnit (a : R)) :
    cyclotomicSeries (R := R) a *
      ((cyclotomicSeriesUnit a ha)⁻¹ : (PowerSeries R)ˣ) = 1 := sorry

lemma cyclotomicSeries_logDeriv_cleared (a : ℕ) (ha : IsUnit (a : R)) :
    PowerSeries.X * cyclotomicSeries (R := R) a *
        logDeriv (cyclotomicSeriesUnit a ha) =
      (a : R) • (1 + PowerSeries.X : PowerSeries R) ^ a -
        (1 + PowerSeries.X) * cyclotomicSeries (R := R) a := sorry

/-- F is the supplier's smoothed series, characterized without fractions by hF.
This proves the algebraic comparison, not its realization as a zeta measure. -/
theorem cyclotomicSeries_logDeriv_smoothed (a : ℕ) (ha : IsUnit (a : R))
    (F : PowerSeries R)
    (hF : PowerSeries.X * cyclotomicSeries (R := R) a * F =
      cyclotomicSeries (R := R) a - PowerSeries.C (a : R)) :
    logDeriv (cyclotomicSeriesUnit a ha) = PowerSeries.C ((a : R) - 1) - F := sorry

-- logDeriv tests: no private unit carrier is introduced.
section LogDerivTests
-- test logDeriv_identity
example : logDeriv (1 : (PowerSeries ℚ)ˣ) = 0 := sorry
-- test logDeriv_one_add_X
example (u : (PowerSeries ℚ)ˣ) (hu : (u : PowerSeries ℚ) = 1 + PowerSeries.X) :
    logDeriv u = 1 := sorry
-- test logDeriv_inverse_one_add_X
example (u : (PowerSeries ℚ)ˣ) (hu : (u : PowerSeries ℚ) = 1 + PowerSeries.X) :
    logDeriv u⁻¹ = -1 := sorry
-- test logDeriv_characteristic_three
example (u : (PowerSeries (ZMod 3))ˣ)
    (hu : (u : PowerSeries (ZMod 3)) = 1 + PowerSeries.X ^ 3) :
    logDeriv u = 0 ∧
      (u : PowerSeries (ZMod 3)) ≠ PowerSeries.C (PowerSeries.constantCoeff (u : PowerSeries (ZMod 3))) := sorry
end LogDerivTests

section CyclotomicSeriesTests
-- test cyclotomicSeries_empty
example : cyclotomicSeries (R := ℤ) 0 = 0 := sorry
-- test cyclotomicSeries_three
example : cyclotomicSeries (R := ℤ) 3 =
    3 + 3 * PowerSeries.X + PowerSeries.X ^ 2 := sorry
-- test cyclotomicSeries_nonunit_at_three
example : ¬IsUnit (cyclotomicSeries (R := ZMod 3) 3) := sorry
-- test cyclotomicSeries_coefficient_reduction
example : PowerSeries.map (Int.castRingHom (ZMod 3)) (cyclotomicSeries (R := ℤ) 3) =
    PowerSeries.X ^ 2 := sorry
end CyclotomicSeriesTests

section CyclotomicUnitTests
-- test cyclotomicSeriesUnit_one
example (h : IsUnit (1 : ℚ)) : cyclotomicSeriesUnit 1 h = 1 := sorry
-- test cyclotomicSeriesUnit_three_value
example (h : IsUnit (3 : ℚ)) :
    (cyclotomicSeriesUnit 3 h : PowerSeries ℚ) =
      3 + 3 * PowerSeries.X + PowerSeries.X ^ 2 := sorry
-- test cyclotomicSeriesUnit_three_inverse
example (h : IsUnit (3 : ℚ)) :
    PowerSeries.constantCoeff (((cyclotomicSeriesUnit 3 h)⁻¹ : (PowerSeries ℚ)ˣ) : PowerSeries ℚ) =
      (1 / 3 : ℚ) := sorry
-- test cyclotomicSeriesUnit_three_logDeriv
example (h : IsUnit (3 : ℚ)) :
    PowerSeries.coeff 0 (logDeriv (cyclotomicSeriesUnit 3 h)) = 1 ∧
      PowerSeries.coeff 1 (logDeriv (cyclotomicSeriesUnit 3 h)) = (2 / 3 : ℚ) := sorry
end CyclotomicUnitTests

-- Extra sign and substitution controls, not definitions of missing measure carriers.
-- test smoothed_three_sign
example (h : IsUnit (3 : ℚ)) (F : PowerSeries ℚ)
    (hF : PowerSeries.X * cyclotomicSeries (R := ℚ) 3 * F =
      cyclotomicSeries (R := ℚ) 3 - 3) :
    PowerSeries.coeff 0 F = 1 ∧ PowerSeries.coeff 1 F = (-2 / 3 : ℚ) ∧
      logDeriv (cyclotomicSeriesUnit 3 h) = 2 - F := sorry
-- test power_subst_zero
example (u : (PowerSeries ℚ)ˣ) (h : PowerSeries.HasSubst (0 : PowerSeries ℚ)) :
    logDeriv (Units.map (PowerSeries.substAlgHom h).toMonoidHom u) = 0 := sorry
-- test negative_parameter_boundary
example (u : (PowerSeries ℚ)ˣ) (hu : (u : PowerSeries ℚ) = 1 + PowerSeries.X) :
    logDeriv (-u⁻¹) = -1 := sorry

/-
No carrier for the cyclotomic field tower, norm-fixed series, bounded unit
restriction, inverse derivative or zeta pseudomeasure is invented in this seed.
The requests in the packet identify the exact owners. In particular Col0 and
Col = -Col0 require actual maps, and L3 requires the full topological sequence.
The natural-parameter chain rule is not p-adic-exponent equivariance.
-/
end TauCetiRoadmap.Campaign.ColemanPowerSeries

