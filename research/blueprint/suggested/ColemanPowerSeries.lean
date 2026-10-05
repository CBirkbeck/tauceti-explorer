/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These suggested names, signatures, API items and examples help
contributors and reviewers converge on Lean forms. All new constructions and
proofs are placeholders; no implementation is claimed.
-/
import Mathlib.Topology.Algebra.Module.FiniteDimension
import Mathlib.RingTheory.Norm.Transitivity
import Mathlib.Topology.Algebra.Valued.NormedValued
import Mathlib.RingTheory.Localization.Integral
import Mathlib.Analysis.Normed.Ring.Finite
import Mathlib.RingTheory.PowerSeries.Evaluation
import Mathlib.NumberTheory.Padics.Complex
import Mathlib.RingTheory.DiscreteValuationRing.TFAE
import Mathlib.RingTheory.Ideal.GoingUp
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.RingTheory.Polynomial.Eisenstein.IsIntegral
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RingTheory.Polynomial.GaussLemma
import Mathlib.NumberTheory.Cyclotomic.PrimitiveRoots
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.RingTheory.RootsOfUnity.AlgebraicallyClosed
import TauCeti.RingTheory.MvPowerSeries.Substitution
import Mathlib.LinearAlgebra.Vandermonde
import Mathlib.Data.Nat.Factorization.Basic
import Mathlib.Analysis.SpecificLimits.Normed
import Mathlib.Topology.Algebra.InfiniteSum.Nonarchimedean
import Mathlib.Algebra.DualNumber
import research.blueprint.suggested.PadicMeasuresIwasawaAlgebras
import research.blueprint.suggested.«DirichletPadicLFunctions--L1»
import Mathlib.Algebra.Polynomial.Taylor
import Mathlib.LinearAlgebra.Matrix.Charpoly.Coeff
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.Algebra.CharP.Reduced
import Mathlib.RingTheory.PowerSeries.Binomial
import Mathlib.NumberTheory.Padics.MahlerBasis
/-
Suggested declarations only. This file is not the complete roadmap and contains
no completed implementations: new constructions, theorems, API items and tests use sorry.
The README is normative. Missing arithmetic and measure carriers are described
in comments, not replaced by unconstrained propositions or assumed conclusions.
-/
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.Data.ZMod.Basic
import Mathlib.RingTheory.PowerSeries.PiTopology
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.NumberTheory.Padics.ProperSpace
import Mathlib.RingTheory.Norm.Defs
import Mathlib.RingTheory.Trace.Defs
import Mathlib.RingTheory.PowerSeries.Expand

set_option maxHeartbeats 2000000

noncomputable section
open scoped BigOperators PowerSeries.WithPiTopology
namespace TauCetiRoadmap.Campaign.ColemanPowerSeries

variable {R S : Type*} [CommRing R] [CommRing S]

/- q is only local notation for the exact transparent body of the imported proposed definition
DirichletPadic.smoothingDenominator (DirichletPadicLFunctions:L1/smoothing-denominator).
It introduces no declaration, carrier or second constructor. Once that proposed library declaration
is implemented, import its module and replace this notation with its name. The present file can
therefore elaborate on the actual baseline without pretending the proposed module is available. -/
local notation "q[" R ", " a "]" =>
  (PowerSeries.mk (fun n => ((Nat.choose (a : ℕ) (n + 1)) : R)))

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

/-- Finite-sum comparison for the imported Dirichlet denominator, not a new series definition. -/
lemma cyclotomicSeries_def (a : ℕ) :
    q[R, a] =
      ∑ i ∈ Finset.range a, (1 + PowerSeries.X : PowerSeries R) ^ i := sorry

lemma cyclotomicSeries_mul (a b : ℕ) :
    q[R, a * b] =
      q[R, a] *
        (q[R, b]).subst
          ((1 + PowerSeries.X : PowerSeries R) ^ a - 1) := sorry

/-- The inverse is the formal power-series inverse, not inversion of T. -/
def cyclotomicSeriesUnit (a : ℕ) (ha : IsUnit (a : R)) : (PowerSeries R)ˣ := sorry

lemma cyclotomicSeriesUnit_val (a : ℕ) (ha : IsUnit (a : R)) :
    (cyclotomicSeriesUnit a ha : PowerSeries R) = q[R, a] := sorry

lemma cyclotomicSeriesUnit_ext (a : ℕ) (ha : IsUnit (a : R))
    (u : (PowerSeries R)ˣ) (hu : (u : PowerSeries R) = q[R, a]) :
    u = cyclotomicSeriesUnit a ha := sorry

lemma cyclotomicSeriesUnit_map (ρ : R →+* S) (a : ℕ)
    (ha : IsUnit (a : R)) (hb : IsUnit (a : S)) :
    Units.map (PowerSeries.map ρ).toMonoidHom (cyclotomicSeriesUnit a ha) =
      cyclotomicSeriesUnit a hb := sorry

lemma cyclotomicSeriesUnit_inv (a : ℕ) (ha : IsUnit (a : R)) :
    q[R, a] *
      ((cyclotomicSeriesUnit a ha)⁻¹ : (PowerSeries R)ˣ) = 1 := sorry

lemma cyclotomicSeries_logDeriv_cleared (a : ℕ) (ha : IsUnit (a : R)) :
    PowerSeries.X * q[R, a] *
        logDeriv (cyclotomicSeriesUnit a ha) =
      (a : R) • (1 + PowerSeries.X : PowerSeries R) ^ a -
        (1 + PowerSeries.X) * q[R, a] := sorry

/-- F is the supplier's smoothed series, characterized without fractions by hF.
This proves the algebraic comparison, not its realization as a zeta measure. -/
theorem cyclotomicSeries_logDeriv_smoothed (a : ℕ) (ha : IsUnit (a : R))
    (F : PowerSeries R)
    (hF : PowerSeries.X * q[R, a] * F =
      q[R, a] - PowerSeries.C (a : R)) :
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
example : q[ℤ, 0] = 0 := sorry
-- test cyclotomicSeries_three
example : q[ℤ, 3] =
    3 + 3 * PowerSeries.X + PowerSeries.X ^ 2 := sorry
-- test cyclotomicSeries_nonunit_at_three
example : ¬IsUnit (q[ZMod 3, 3]) := sorry
-- test cyclotomicSeries_coefficient_reduction
example : PowerSeries.map (Int.castRingHom (ZMod 3)) (q[ℤ, 3]) =
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
    (hF : PowerSeries.X * q[ℚ, 3] * F =
      q[ℚ, 3] - 3) :
    PowerSeries.coeff 0 F = 1 ∧ PowerSeries.coeff 1 F = (-2 / 3 : ℚ) ∧
      logDeriv (cyclotomicSeriesUnit 3 h) = 2 - F := sorry
-- test power_subst_zero
example (u : (PowerSeries ℚ)ˣ) (h : PowerSeries.HasSubst (0 : PowerSeries ℚ)) :
    logDeriv (Units.map (PowerSeries.substAlgHom h).toMonoidHom u) = 0 := sorry
-- test negative_parameter_boundary
example (u : (PowerSeries ℚ)ˣ) (hu : (u : PowerSeries ℚ) = 1 + PowerSeries.X) :
    logDeriv (-u⁻¹) = -1 := sorry

/-!
L1 finite-free Frobenius algebra over Z_p. All prime p, including p=2.
The three algebra/norm/trace signatures below specialize existing pinned
constructions with the explicit Frobenius algebra. All mathematical proofs
and construction data remain placeholders. No bounded psi, arithmetic tower or interpolation map
is defined here.
-/
section FrobeniusAlgebra
variable (p : ℕ) [Fact p.Prime]
local notation "B" => PowerSeries (PadicInt p)
local notation "Y" => (1 + PowerSeries.X : B)
set_option quotPrecheck false in
local notation "Phi" => (PowerSeries.substAlgHom
  (PowerSeries.HasSubst.of_constantCoeff_zero' (by simp :
    PowerSeries.constantCoeff (Y ^ p - 1) = 0))).toRingHom

/-- Select the scalar algebra of the existing substitution ring homomorphism.
It must not be inferred as the ordinary self-algebra. -/
@[instance_reducible]
def phiScalarAlgebra : Algebra B B := sorry
local notation "PhiAlg" => phiScalarAlgebra p
set_option quotPrecheck false in
local notation "PhiMod" => @Algebra.toModule B B _ _ PhiAlg

lemma phiScalarAlgebra_map (f : B) :
    @algebraMap B B _ _ PhiAlg f = Phi f := sorry
lemma phiScalarAlgebra_smul (a x : B) :
    @SMul.smul B B (PhiMod).toSMul a x = Phi a * x := sorry
lemma phiScalarAlgebra_constant (c : PadicInt p) (x : B) :
    @SMul.smul B B (PhiMod).toSMul (PowerSeries.C c) x = PowerSeries.C c * x := sorry

theorem residueCoordinates_unique (h : PowerSeries (ZMod p)) :
    ∃! g : Fin p → PowerSeries (ZMod p), h =
      ∑ i : Fin p, (1 + PowerSeries.X : PowerSeries (ZMod p)) ^ i.val *
        PowerSeries.expand p (Fact.out : p.Prime).ne_zero (g i) := sorry

def phiAssemble : (Fin p → B) →ₗ[PadicInt p] B := sorry
lemma phiAssemble_apply (a : Fin p → B) :
    phiAssemble p a = ∑ i : Fin p, Y ^ i.val * Phi (a i) := sorry
lemma phiAssemble_single (i : Fin p) (a : B) :
    phiAssemble p (Pi.single i a) = Y ^ i.val * Phi a := sorry
lemma phiAssemble_phi_mul (a : B) (v : Fin p → B) :
    phiAssemble p (fun i => a * v i) = Phi a * phiAssemble p v := sorry
lemma phiAssemble_continuous : Continuous (phiAssemble p) := sorry
lemma phiAssemble_lift_mod (r : ℕ) (f : B) :
    ∃ (a : Fin p → B) (h : B), f = phiAssemble p a + (p : B)^r * h := sorry
lemma phiAssemble_dvd_iff (a : Fin p → B) (r : ℕ) :
    (p : B)^r ∣ phiAssemble p a ↔ ∀ i, (p : B)^r ∣ a i := sorry
lemma phiAssemble_injective : Function.Injective (phiAssemble p) := sorry
theorem phiAssemble_surjective : Function.Surjective (phiAssemble p) := sorry

/-- Explicit module argument: scalar a acts as Phi(a), not as a. -/
def phiBasis : @Module.Basis (Fin p) B B _ _ PhiMod := sorry
lemma phiBasis_apply (i : Fin p) : phiBasis p i = Y ^ i.val := sorry
-- Explicit repr avoids resynthesizing the ordinary self-module via field notation.
set_option quotPrecheck false in
local notation "coords" =>
  (@Module.Basis.repr (Fin p) B B _ _ PhiMod (phiBasis p)).toEquiv
lemma phiBasis_repr_sum (f : B) :
    f = ∑ i : Fin p, Phi (coords f i) * Y ^ i.val := sorry
lemma phiBasis_repr_phi_mul (a f : B) (i : Fin p) :
    coords (Phi a * f) i = a * coords f i := sorry
lemma phiBasis_rank : @Module.finrank B B _ _ PhiMod = p := sorry

set_option quotPrecheck false in
local notation "mulMatrix" =>
  (@AlgHom.toRingHom B B (Matrix (Fin p) (Fin p) B) _ _ _ PhiAlg _
    (@Algebra.leftMulMatrix B B _ _ PhiAlg (Fin p) _ _ (phiBasis p)))
lemma phiBasis_leftMulMatrix (f : B) (i j : Fin p) :
    mulMatrix f i j = ∑ k : Fin p,
      if i.val = (k.val + j.val) % p then
        coords f k * Y ^ ((k.val + j.val) / p) else 0 := sorry

/-- Existing norm specialized to the Frobenius scalar algebra. -/
def colemanNorm : B →* B := sorry
lemma colemanNorm_def : colemanNorm p = @Algebra.norm B B _ _ PhiAlg := sorry
lemma colemanNorm_matrix (f : B) : colemanNorm p f = Matrix.det (mulMatrix f) := sorry
lemma colemanNorm_one : colemanNorm p 1 = 1 := sorry
lemma colemanNorm_mul (f g : B) : colemanNorm p (f * g) = colemanNorm p f * colemanNorm p g := sorry
lemma colemanNorm_phi (a : B) : colemanNorm p (Phi a) = a ^ p := sorry
lemma colemanNorm_constant (c : PadicInt p) : colemanNorm p (PowerSeries.C c) = PowerSeries.C (c ^ p) := sorry
lemma colemanNorm_Y : colemanNorm p Y = (-1 : B) ^ (p - 1) * Y := sorry
lemma colemanNorm_X : colemanNorm p PowerSeries.X = (-1 : B) ^ (p - 1) * PowerSeries.X := sorry

/-- Existing trace, with its additive structure retained. -/
def colemanTrace : B →+ B := sorry
lemma colemanTrace_def :
    colemanTrace p = (@Algebra.trace B B _ _ PhiAlg).toAddMonoidHom := sorry
lemma colemanTrace_add (f g : B) : colemanTrace p (f + g) = colemanTrace p f + colemanTrace p g := sorry
lemma colemanTrace_phi_mul (a f : B) : colemanTrace p (Phi a * f) = a * colemanTrace p f := sorry
lemma colemanTrace_coordinates (f : B) :
    colemanTrace p f = (p : B) * coords f ⟨0, (Fact.out : p.Prime).pos⟩ := sorry
lemma colemanTrace_divisible (f : B) :
    ∃! g : B, colemanTrace p f = (p : B) * g := sorry

def normFixedUnits : Subgroup Bˣ := sorry
lemma mem_normFixedUnits (u : Bˣ) :
    u ∈ normFixedUnits p ↔ colemanNorm p (u : B) = (u : B) := sorry
lemma normFixedUnits_mk (u : Bˣ) (h : colemanNorm p (u : B) = (u : B)) :
    u ∈ normFixedUnits p := sorry
lemma normFixedUnits_ext (u v : normFixedUnits p) :
    u = v ↔ ((u : Bˣ) : B) = ((v : Bˣ) : B) := sorry
lemma normFixedUnits_constant (c : (PadicInt p)ˣ) :
    Units.map PowerSeries.C.toMonoidHom c ∈ normFixedUnits p ↔ c ^ (p - 1) = 1 := sorry
end FrobeniusAlgebra

section FrobeniusTests
local instance : Fact (Nat.Prime 2) := ⟨by decide⟩
local instance : Fact (Nat.Prime 3) := ⟨by decide⟩
local notation "B2" => PowerSeries (PadicInt 2)
local notation "B3" => PowerSeries (PadicInt 3)
set_option quotPrecheck false in
local notation "smul2" => @SMul.smul B2 B2 (@Algebra.toModule B2 B2 _ _ (phiScalarAlgebra 2)).toSMul
-- test phiScalar_zero
example : smul2 0 1 = 0 := sorry
-- test phiScalar_X_two
example : smul2 PowerSeries.X 1 = 2 * PowerSeries.X + PowerSeries.X ^ 2 := sorry
-- test phiScalar_not_self
example : smul2 PowerSeries.X 1 ≠ PowerSeries.X := sorry
-- test phiAssemble_zero
example : phiAssemble 3 0 = 0 := sorry
-- test phiAssemble_Y_three
example : phiAssemble 3 (Pi.single (1 : Fin 3) 1) = 1 + PowerSeries.X := sorry
-- test phiAssemble_not_ordinary
example : phiAssemble 2 (Pi.single (0 : Fin 2) PowerSeries.X) =
    2 * PowerSeries.X + PowerSeries.X ^ 2 ∧
    phiAssemble 2 (Pi.single (0 : Fin 2) PowerSeries.X) ≠ PowerSeries.X := sorry
-- test phiBasis_zero_two
example : phiBasis 2 (0 : Fin 2) = 1 := sorry
-- test phiBasis_one_three
example : phiBasis 3 (1 : Fin 3) = 1 + PowerSeries.X := sorry
-- test phiBasis_carry_two
example :
    ((@Module.Basis.repr (Fin 2) B2 B2 _ _
      (@Algebra.toModule B2 B2 _ _ (phiScalarAlgebra 2)) (phiBasis 2)).toEquiv
      ((1 + PowerSeries.X) ^ 2)) = Finsupp.single 0 (1 + PowerSeries.X) := sorry
-- test colemanNorm_one_three
example : colemanNorm 3 1 = 1 := sorry
-- test colemanNorm_two_three
example : colemanNorm 3 2 = 8 ∧ colemanNorm 3 2 ≠ 2 := sorry
-- test colemanNorm_Y_two
example : colemanNorm 2 (1 + PowerSeries.X) = -(1 + PowerSeries.X) ∧
    colemanNorm 2 (1 + PowerSeries.X) ≠ 1 + PowerSeries.X := sorry
-- test colemanNorm_X_three
example : colemanNorm 3 PowerSeries.X = PowerSeries.X := sorry
-- test colemanTrace_zero_three
example : colemanTrace 3 0 = 0 := sorry
-- test colemanTrace_one_three
example : colemanTrace 3 1 = 3 := sorry
-- test colemanTrace_Y_three
example : colemanTrace 3 (1 + PowerSeries.X) = 0 := sorry
-- test colemanTrace_phi_three
example : colemanTrace 3 ((1 + PowerSeries.X) ^ 3) = 3 * (1 + PowerSeries.X) := sorry
-- test normFixedUnits_one_three
example : (1 : B3ˣ) ∈ normFixedUnits 3 := sorry
-- test normFixedUnits_Y_three
example (u : B3ˣ) (hu : (u : B3) = 1 + PowerSeries.X) : u ∈ normFixedUnits 3 := sorry
-- test normFixedUnits_Y_two
example (u : B2ˣ) (hu : (u : B2) = 1 + PowerSeries.X) : u ∉ normFixedUnits 2 := sorry
-- test normFixedUnits_constant_two_three
example (u : (PadicInt 3)ˣ) (hu : (u : PadicInt 3) = 2) :
    Units.map PowerSeries.C.toMonoidHom u ∉ normFixedUnits 3 := sorry
end FrobeniusTests

/-
The actual norm-fixed subgroup is now specified above. Its arithmetic unit-tower
identification remains required. No cyclotomic field tower, bounded psi, unit
restriction, inverse derivative, Coleman measure map or zeta pseudomeasure is
postulated here. The natural-parameter chain rule is not p-adic equivariance.
-/
end TauCetiRoadmap.Campaign.ColemanPowerSeries


/-!
Suggested signed-integer interfaces on existing binomial series and the
imported Dirichlet denominator. This fragment follows the preceding Coleman
signatures; it is not a new definition of the denominator or a p-adic action.
-/
noncomputable section
namespace TauCetiRoadmap.Campaign.ColemanPowerSeries

variable {R : Type*} [CommRing R]

/- This local notation is the transparent body of the already planned
DirichletPadic.smoothingDenominator. Replace it by the supplier declaration
when available; it introduces no declaration or second constructor. -/
local notation "q[" R ", " a "]" =>
  (PowerSeries.mk (fun n => ((Nat.choose (a : ℕ) (n + 1)) : R)))

-- ColemanPowerSeries:L2/integer-binomial-weighted-derivative
lemma integerBinomial_weighted_derivative (n : ℤ) :
    (1 + PowerSeries.X) * PowerSeries.derivative R (PowerSeries.binomialSeries R n) =
      (n : R) • PowerSeries.binomialSeries R n := by sorry

-- ColemanPowerSeries:L2/logarithmic-derivative-integer-substitution
lemma logDeriv_integer_subst (f : (PowerSeries R)ˣ) (n : ℤ)
    (hg : PowerSeries.HasSubst (PowerSeries.binomialSeries R n - 1)) :
    logDeriv (Units.map (PowerSeries.substAlgHom hg).toMonoidHom f) =
      (n : R) • (logDeriv f).subst (PowerSeries.binomialSeries R n - 1) := by sorry

-- ColemanPowerSeries:L2/negative-cyclotomic-factorization
lemma negativeCyclotomicSeries_factorization (a : ℕ) :
    PowerSeries.X * (-PowerSeries.binomialSeries R (-(a : ℤ)) * q[R, a]) =
      PowerSeries.binomialSeries R (-(a : ℤ)) - 1 := by sorry

-- ColemanPowerSeries:L2/negative-cyclotomic-constant
lemma negativeCyclotomicSeries_constant (a : ℕ) :
    PowerSeries.constantCoeff (-PowerSeries.binomialSeries R (-(a : ℤ)) * q[R, a]) =
      -(a : R) := by sorry

-- ColemanPowerSeries:L2/negative-cyclotomic-unit
lemma negativeCyclotomicSeries_isUnit (a : ℕ) :
    IsUnit (-PowerSeries.binomialSeries R (-(a : ℤ)) * q[R, a]) ↔
      IsUnit (a : R) := by sorry

-- ColemanPowerSeries:L2/negative-cyclotomic-logarithmic-derivative
lemma negativeCyclotomicSeries_logDeriv (a : ℕ) (ha : IsUnit (a : R))
    (v : (PowerSeries R)ˣ)
    (hv : (v : PowerSeries R) = -PowerSeries.binomialSeries R (-(a : ℤ)) * q[R, a]) :
    logDeriv v = -PowerSeries.C (a : R) + logDeriv (cyclotomicSeriesUnit a ha) := by sorry

-- ColemanPowerSeries:L2/negative-smoothed-equation
lemma negativeCyclotomicSeries_smoothed_equation (a : ℕ) (F : PowerSeries R)
    (hF : PowerSeries.X * q[R, a] * F = q[R, a] - PowerSeries.C (a : R)) :
    PowerSeries.X * (-PowerSeries.binomialSeries R (-(a : ℤ)) * q[R, a]) *
        (F - PowerSeries.C (a : R)) =
      -PowerSeries.binomialSeries R (-(a : ℤ)) * q[R, a] + PowerSeries.C (a : R) := by sorry

-- ColemanPowerSeries:L2/negative-smoothed-comparison
lemma negativeCyclotomicSeries_logDeriv_smoothed (a : ℕ) (ha : IsUnit (a : R))
    (v : (PowerSeries R)ˣ)
    (hv : (v : PowerSeries R) = -PowerSeries.binomialSeries R (-(a : ℤ)) * q[R, a])
    (F : PowerSeries R)
    (hF : PowerSeries.X * q[R, a] * F = q[R, a] - PowerSeries.C (a : R)) :
    logDeriv v = -1 - F := by sorry

-- test negative_one_coefficients
example (n : ℕ) :
    PowerSeries.coeff n (-PowerSeries.binomialSeries ℤ (-1 : ℤ)) =
      (-1 : ℤ) ^ (n + 1) := by sorry

-- test negative_three_coefficients
example :
    let f : PowerSeries ℤ := -PowerSeries.binomialSeries ℤ (-3 : ℤ) * q[ℤ, 3]
    PowerSeries.coeff 0 f = -3 ∧ PowerSeries.coeff 1 f = 6 := by sorry

-- test negative_three_logDeriv
example (v : (PowerSeries ℚ)ˣ)
    (hv : (v : PowerSeries ℚ) = -PowerSeries.binomialSeries ℚ (-3 : ℤ) * q[ℚ, 3]) :
    PowerSeries.coeff 0 (logDeriv v) = -2 ∧
      PowerSeries.coeff 1 (logDeriv v) = (2 / 3 : ℚ) := by sorry

-- test integer_substitution_minus_one
example (u : (PowerSeries ℚ)ˣ) (hu : (u : PowerSeries ℚ) = 1 + PowerSeries.X)
    (hg : PowerSeries.HasSubst (PowerSeries.binomialSeries ℚ (-1 : ℤ) - 1)) :
    logDeriv (Units.map (PowerSeries.substAlgHom hg).toMonoidHom u) = -1 := by sorry

end TauCetiRoadmap.Campaign.ColemanPowerSeries

noncomputable section
namespace TauCetiRoadmap.Campaign.ColemanPowerSeries
variable {p : ℕ} [Fact p.Prime]

-- ColemanPowerSeries:L2/padic-binomial-weighted-derivative
lemma padicBinomial_weighted_derivative (a : ℤ_[p]) :
    (1 + PowerSeries.X) * PowerSeries.derivative ℤ_[p]
      (PowerSeries.binomialSeries ℤ_[p] a) =
      a • PowerSeries.binomialSeries ℤ_[p] a := by sorry

-- ColemanPowerSeries:L2/logarithmic-derivative-padic-substitution
lemma logDeriv_padic_subst (f : (PowerSeries ℤ_[p])ˣ) (a : ℤ_[p])
    (hg : PowerSeries.HasSubst (PowerSeries.binomialSeries ℤ_[p] a - 1)) :
    logDeriv (Units.map (PowerSeries.substAlgHom hg).toMonoidHom f) =
      a • (logDeriv f).subst (PowerSeries.binomialSeries ℤ_[p] a - 1) := by sorry

-- test padic_weighted_half
example (a : ℤ_[3]) (ha : 2 * a = 1) :
    4 * PowerSeries.coeff 1 ((1 + PowerSeries.X) * PowerSeries.derivative ℤ_[3]
      (PowerSeries.binomialSeries ℤ_[3] a)) = 1 := by sorry

-- test padic_logDeriv_zero_exponent
example (f : (PowerSeries ℤ_[p])ˣ)
    (hg : PowerSeries.HasSubst (PowerSeries.binomialSeries ℤ_[p] (0 : ℤ_[p]) - 1)) :
    logDeriv (Units.map (PowerSeries.substAlgHom hg).toMonoidHom f) = 0 := by sorry

-- test padic_logDeriv_half
example (a : ℤ_[3]) (ha : 2 * a = 1) (u : (PowerSeries ℤ_[3])ˣ)
    (hu : (u : PowerSeries ℤ_[3]) = 1 + PowerSeries.X)
    (hg : PowerSeries.HasSubst (PowerSeries.binomialSeries ℤ_[3] a - 1)) :
    2 * logDeriv (Units.map (PowerSeries.substAlgHom hg).toMonoidHom u) = 1 := by sorry

end TauCetiRoadmap.Campaign.ColemanPowerSeries

/-!
Integral L1 norm congruences. These are suggested signatures, not implementations.
The mathematical roadmap is definitive. N^[k] is function iteration; the norm
uses the inherited explicit Frobenius scalar algebra, including at p=2.
-/
noncomputable section
namespace TauCetiRoadmap.Campaign.ColemanPowerSeries
section NormCongruences
variable (p : ℕ) [Fact p.Prime]
local notation "B" => PowerSeries (PadicInt p)
local notation "Y" => (1 + PowerSeries.X : B)
set_option quotPrecheck false in
local notation "Phi" => (PowerSeries.substAlgHom
  (PowerSeries.HasSubst.of_constantCoeff_zero' (by simp :
    PowerSeries.constantCoeff (Y ^ p - 1) = 0))).toRingHom

-- ColemanPowerSeries:L1/residue-series-congruence
lemma map_toZMod_eq_iff (f g : B) :
    PowerSeries.map (PadicInt.toZMod : PadicInt p →+* ZMod p) f =
      PowerSeries.map (PadicInt.toZMod : PadicInt p →+* ZMod p) g ↔
    (p : B) ∣ f - g := sorry

-- ColemanPowerSeries:L1/frobenius-congruence-reflection
lemma phi_sub_one_dvd_iff (f : B) (k : ℕ) :
    (p : B) ^ k ∣ Phi f - 1 ↔ (p : B) ^ k ∣ f - 1 := sorry

-- ColemanPowerSeries:L1/coleman-norm-preserves-congruence
lemma colemanNorm_sub_dvd (f g : B) (k : ℕ)
    (h : (p : B) ^ k ∣ f - g) :
    (p : B) ^ k ∣ colemanNorm p f - colemanNorm p g := sorry

-- ColemanPowerSeries:L1/coleman-norm-residue-identity
lemma colemanNorm_sub_self_dvd (f : B) :
    (p : B) ∣ colemanNorm p f - f := sorry

-- ColemanPowerSeries:L1/coleman-norm-improves-one-congruence
lemma colemanNorm_sub_one_dvd (f : B) (k : ℕ) (hk : 1 ≤ k)
    (h : (p : B) ^ k ∣ f - 1) :
    (p : B) ^ (k + 1) ∣ colemanNorm p f - 1 := sorry

-- ColemanPowerSeries:L1/coleman-norm-iterated-improvement
lemma colemanNorm_iterate_sub_one_dvd (f : B) (k r : ℕ) (hk : 1 ≤ k)
    (h : (p : B) ^ k ∣ f - 1) :
    (p : B) ^ (k + r) ∣ (colemanNorm p)^[r] f - 1 := sorry

-- ColemanPowerSeries:L1/coleman-norm-iterate-congruence
theorem colemanNorm_iterate_sub_dvd (u : Bˣ) (k₁ k₂ : ℕ) (h : k₁ ≤ k₂) :
    (p : B) ^ (k₁ + 1) ∣
      (colemanNorm p)^[k₂] (u : B) - (colemanNorm p)^[k₁] (u : B) := sorry
end NormCongruences

section NormCongruenceTests
local instance : Fact (Nat.Prime 2) := ⟨by decide⟩
local instance : Fact (Nat.Prime 3) := ⟨by decide⟩
local notation "B2" => PowerSeries (PadicInt 2)
local notation "B3" => PowerSeries (PadicInt 3)
local notation "red3" => PowerSeries.map (PadicInt.toZMod : PadicInt 3 →+* ZMod 3)

-- test residue_series_three_control
example : red3 (1 + 3 * PowerSeries.X) = red3 1 ∧
    red3 (1 + PowerSeries.X) ≠ red3 1 := sorry

-- test phi_congruence_three_control
example : ¬ (3 : B3) ∣ (1 + PowerSeries.X) ^ 3 - 1 := sorry

-- test phi_freshman_two_difference
example : (1 + PowerSeries.X : B2) ^ 2 - 1 - PowerSeries.X ^ 2 = 2 * PowerSeries.X ∧
    (2 * PowerSeries.X : B2) ≠ 0 := sorry

-- test colemanNorm_constant_congruence_nine
example : colemanNorm 3 10 - colemanNorm 3 1 = 999 ∧
    (9 : B3) ∣ colemanNorm 3 10 - colemanNorm 3 1 := sorry

-- test colemanNorm_mod_three_sharp
example : (3 : B3) ∣ colemanNorm 3 2 - 2 ∧
    ¬ (9 : B3) ∣ colemanNorm 3 2 - 2 := sorry

-- test colemanNorm_improvement_three_sharp
example : colemanNorm 3 4 - 1 = 63 ∧
    (9 : B3) ∣ colemanNorm 3 4 - 1 ∧ ¬ (27 : B3) ∣ colemanNorm 3 4 - 1 := sorry

-- test colemanNorm_improvement_two
example : colemanNorm 2 3 - 1 = 8 ∧ (4 : B2) ∣ colemanNorm 2 3 - 1 := sorry

-- test colemanNorm_improvement_zero_precision
example : (1 : B3) ∣ 0 - 1 ∧ ¬ (3 : B3) ∣ colemanNorm 3 0 - 1 := sorry

-- test colemanNorm_twice_four
example : colemanNorm 3 (colemanNorm 3 4) = 262144 ∧
    (27 : B3) ∣ colemanNorm 3 (colemanNorm 3 4) - 1 := sorry

-- test colemanNorm_iteration_three_sharp
example : colemanNorm 3 (colemanNorm 3 2) - colemanNorm 3 2 = 504 ∧
    (9 : B3) ∣ colemanNorm 3 (colemanNorm 3 2) - colemanNorm 3 2 ∧
    ¬ (27 : B3) ∣ colemanNorm 3 (colemanNorm 3 2) - colemanNorm 3 2 := sorry

-- test colemanNorm_iteration_dyadic_sign
example : colemanNorm 2 (colemanNorm 2 (1 + PowerSeries.X)) =
      colemanNorm 2 (1 + PowerSeries.X) ∧
    colemanNorm 2 (1 + PowerSeries.X) = -(1 + PowerSeries.X) ∧
    colemanNorm 2 (1 + PowerSeries.X) - (1 + PowerSeries.X) =
      -2 * (1 + PowerSeries.X : B2) := sorry
end NormCongruenceTests
end TauCetiRoadmap.Campaign.ColemanPowerSeries

/-!
L1: coefficientwise continuity and the norm-iterate limit. The existing
Frobenius module is selected explicitly. These signatures are proposed forms;
the roadmap is definitive and no placeholder implements its theorem.
-/
noncomputable section
namespace TauCetiRoadmap.Campaign.ColemanPowerSeries
open Filter Topology
open scoped PowerSeries.WithPiTopology
variable (p : ℕ) [Fact p.Prime]
local notation "B" => PowerSeries (PadicInt p)
set_option quotPrecheck false in
local notation "PhiMod" => @Algebra.toModule B B _ _ (phiScalarAlgebra p)
set_option quotPrecheck false in
local notation "coords" =>
  (@Module.Basis.repr (Fin p) B B _ _ PhiMod (phiBasis p)).toEquiv

lemma phiBasis_coordinates_continuous :
    Continuous (fun f : B => fun i : Fin p => coords f i) := by sorry

lemma colemanNorm_continuous : Continuous (colemanNorm p) := by sorry

lemma colemanTrace_continuous : Continuous (colemanTrace p) := by sorry

lemma colemanNorm_iterate_coeff_cauchy (u : Bˣ) (n : ℕ) :
    CauchySeq (fun k : ℕ => PowerSeries.coeff n ((colemanNorm p)^[k] (u : B))) := by sorry

/-- The unique coefficientwise limit of iterated norm on an actual unit. -/
def normLimitSeries (u : Bˣ) : B := sorry

lemma normLimitSeries_tendsto (u : Bˣ) :
    Tendsto (fun k : ℕ => (colemanNorm p)^[k] (u : B)) atTop
      (𝓝 (normLimitSeries p u)) := by sorry

lemma normLimitSeries_sub_iterate_dvd (u : Bˣ) (k : ℕ) :
    (p : B) ^ (k + 1) ∣ normLimitSeries p u - (colemanNorm p)^[k] (u : B) := by sorry

theorem normLimitSeries_fixed (u : Bˣ) :
    colemanNorm p (normLimitSeries p u) = normLimitSeries p u := by sorry

lemma normLimitSeries_mul (u v : Bˣ) :
    normLimitSeries p (u * v) = normLimitSeries p u * normLimitSeries p v := by sorry

lemma normLimitSeries_of_fixed (u : Bˣ) (hu : colemanNorm p (u : B) = (u : B)) :
    normLimitSeries p u = (u : B) := by sorry

lemma normLimitSeries_isUnit (u : Bˣ) : IsUnit (normLimitSeries p u) := by sorry

lemma normLimitSeries_continuous : Continuous (normLimitSeries p) := by sorry

-- test normLimit_identity
example : normLimitSeries p 1 = 1 := by sorry
-- test normLimit_minus_one_two
example : normLimitSeries 2 (-1) = 1 := by sorry
-- test normLimit_Y_two
example (u : (PowerSeries (PadicInt 2))ˣ)
    (hu : (u : PowerSeries (PadicInt 2)) = 1 + PowerSeries.X) :
    normLimitSeries 2 u = -(1 + PowerSeries.X) := by sorry
-- test normLimit_Y_three
example (u : (PowerSeries (PadicInt 3))ˣ)
    (hu : (u : PowerSeries (PadicInt 3)) = 1 + PowerSeries.X) :
    normLimitSeries 3 u = 1 + PowerSeries.X := by sorry

end TauCetiRoadmap.Campaign.ColemanPowerSeries


/- The actual PMIA supplier suggested file is imported above. These comparisons use
its bounded psi and integral root translations; they define no replacement operator. -/
namespace TauCetiRoadmap.Campaign.ColemanPowerSeries
section TraceComparison
open scoped PowerSeries Valued
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => PadicInt p
local notation "B" => PowerSeries Z
local notation "Y" => (1 + PowerSeries.X : B)
local notation "b" => (Y ^ p - 1)

lemma colemanTrace_one_add_X_pow (n : ℕ) :
    colemanTrace p (Y ^ n) = if p ∣ n then (p : B) * Y ^ (n / p) else 0 := by sorry

lemma colemanTrace_eq_mul_psi_polynomial (P : Polynomial Z) :
    colemanTrace p (P : B) = (p : B) * AbstractMeasure.psiSeries p (P : B) := by sorry

/-- The trace for the Frobenius scalar algebra already takes values in the base B. -/
theorem colemanTrace_eq_mul_psi (F : B) :
    colemanTrace p F = (p : B) * AbstractMeasure.psiSeries p F := by sorry

set_option quotPrecheck false in
local notation "PhiMod" => @Algebra.toModule B B _ _ (phiScalarAlgebra p)
set_option quotPrecheck false in
local notation "coords" =>
  (@Module.Basis.repr (Fin p) B B _ _ PhiMod (phiBasis p)).toEquiv

theorem phiBasis_repr_zero_eq_psi (F : B) :
    coords F ⟨0, (Fact.out : p.Prime).pos⟩ = AbstractMeasure.psiSeries p F := by sorry

local notation "O" => 𝒪[ℂ_[p]]
/-- The embedded trace is the root sum in the existing receiving integer ring. -/
theorem colemanTrace_root_sum (ζ : O) (hζ : IsPrimitiveRoot ζ p) (F : B) :
    PowerSeries.map (IwasawaAveraging.integralCoefficientMap p)
      (PowerSeries.subst b (colemanTrace p F)) =
      ∑ i ∈ Finset.range p, IwasawaAveraging.rootTranslation p ζ hζ.pow_eq_one i F := by sorry

-- TraceComparisonTests.zero_three
example : colemanTrace 3 0 = (3 : PowerSeries (PadicInt 3)) *
    AbstractMeasure.psiSeries 3 0 := by sorry
-- TraceComparisonTests.one_three
example : colemanTrace 3 1 = 3 ∧ AbstractMeasure.psiSeries 3 1 = 1 := by sorry
-- TraceComparisonTests.variable_two
example : colemanTrace 2 PowerSeries.X = -2 ∧
    AbstractMeasure.psiSeries 2 PowerSeries.X = -1 := by sorry
-- TraceComparisonTests.cube_three
example : colemanTrace 3 ((1 + PowerSeries.X) ^ 3) = 3 * (1 + PowerSeries.X) := by sorry
-- TraceComparisonTests.square_two
example : colemanTrace 2 ((1 + PowerSeries.X) ^ 2) = 2 * (1 + PowerSeries.X) := by sorry
-- TraceComparisonTests.no_extra_frobenius_three
example : colemanTrace 3 ((1 + PowerSeries.X) ^ 3) ≠ 3 * (1 + PowerSeries.X) ^ 3 := by sorry
-- TraceComparisonTests.no_missing_prime_three
example : colemanTrace 3 1 ≠ AbstractMeasure.psiSeries 3 1 := by sorry
-- TraceComparisonTests.coordinate_three
example :
    (@Module.Basis.repr (Fin 3) (PowerSeries (PadicInt 3)) (PowerSeries (PadicInt 3)) _ _
      (@Algebra.toModule (PowerSeries (PadicInt 3)) (PowerSeries (PadicInt 3)) _ _
        (phiScalarAlgebra 3)) (phiBasis 3)).toEquiv
      ((1 + PowerSeries.X) ^ 3) 0 = 1 + PowerSeries.X := by sorry
-- TraceComparisonTests.root_sum_one
example (ζ : O) (hζ : IsPrimitiveRoot ζ p) :
    (∑ i ∈ Finset.range p, IwasawaAveraging.rootTranslation p ζ hζ.pow_eq_one i 1) = p := by sorry
-- TraceComparisonTests.root_sum_phi
example (ζ : O) (hζ : IsPrimitiveRoot ζ p) :
    (∑ i ∈ Finset.range p,
      IwasawaAveraging.rootTranslation p ζ hζ.pow_eq_one i (Y ^ p)) =
      (p : O⟦X⟧) * (1 + PowerSeries.X) ^ p := by sorry
end TraceComparison
end TauCetiRoadmap.Campaign.ColemanPowerSeries

/- Integral determinant/derivation comparison. All rings, units and fixed
submodules below are native or already supplied; no new bounded operator. -/
namespace TauCetiRoadmap.Campaign.ColemanPowerSeries

/-- Formal-derivation adapter to the existing first-order determinant formula. -/
theorem derivation_det_unit {R A n : Type*} [CommRing R] [CommRing A] [Algebra R A]
    [Fintype n] [DecidableEq n] (d : Derivation R A A) (M : (Matrix n n A)ˣ) :
    d (Matrix.det (M : Matrix n n A)) = Matrix.det (M : Matrix n n A) *
      Matrix.trace (((M⁻¹ : (Matrix n n A)ˣ) : Matrix n n A) *
        (M : Matrix n n A).map d) := by sorry

section NormLogDeriv
open scoped PowerSeries.WithPiTopology
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => PadicInt p
local notation "B" => PowerSeries Z
local notation "Y" => (1 + PowerSeries.X : B)
local notation "d" => PowerSeries.mahlerDerivation Z
set_option quotPrecheck false in
local notation "PhiMod" => @Algebra.toModule B B _ _ (phiScalarAlgebra p)
set_option quotPrecheck false in
local notation "coords" =>
  (@Module.Basis.repr (Fin p) B B _ _ PhiMod (phiBasis p)).toEquiv
set_option quotPrecheck false in
local notation "mulMatrix" =>
  (@AlgHom.toRingHom B B (Matrix (Fin p) (Fin p) B) _ _ _ (phiScalarAlgebra p) _
    (@Algebra.leftMulMatrix B B _ _ (phiScalarAlgebra p) (Fin p) _ _ (phiBasis p)))
set_option quotPrecheck false in
local notation "H" => Matrix.diagonal (fun i : Fin p => (i.val : B))

theorem phiBasis_repr_mahlerDerivation (F : B) (i : Fin p) :
    coords (d F) i = (p : B) * d (coords F i) + (i.val : B) * coords F i := by sorry

/-- The row index is the output coordinate; this fixes the commutator sign. -/
theorem phiBasis_mulMatrix_mahlerDerivation (F : B) :
    mulMatrix (d F) = (p : B) • (mulMatrix F).map d +
      H * mulMatrix F - mulMatrix F * H := by sorry

/-- A fully integral equality: multiplication by p is retained. -/
theorem colemanTrace_logDeriv (u : Bˣ) :
    colemanTrace p (logDeriv u) =
      (p : B) * logDeriv (Units.map (colemanNorm p) u) := by sorry

/-- The actual PMIA bounded psi is compared with the actual determinant norm. -/
theorem logDeriv_colemanNorm (u : Bˣ) :
    logDeriv (Units.map (colemanNorm p) u) =
      AbstractMeasure.psiSeries p (logDeriv u) := by sorry

theorem psi_logDeriv_normFixed (u : normFixedUnits p) :
    AbstractMeasure.psiSeries p (logDeriv (u : Bˣ)) = logDeriv (u : Bˣ) := by sorry

/-- The native kernel of psi-id is the fixed submodule; Multiplicative changes
only the additive/multiplicative convention for the group homomorphism. -/
def normFixedLogDeriv : normFixedUnits p →*
    Multiplicative (LinearMap.ker (AbstractMeasure.psiSeries p - LinearMap.id)) := by sorry

theorem normFixedLogDeriv_val (u : normFixedUnits p) :
    (Multiplicative.toAdd (normFixedLogDeriv p u)).1 = logDeriv (u : Bˣ) := by sorry
theorem normFixedLogDeriv_one : normFixedLogDeriv p 1 = 1 := by sorry
theorem normFixedLogDeriv_mul (u v : normFixedUnits p) :
    normFixedLogDeriv p (u*v) = normFixedLogDeriv p u * normFixedLogDeriv p v := by sorry

/-- Coefficientwise topology and the native Units/submodule topologies. -/
theorem continuous_normFixedLogDeriv : Continuous (normFixedLogDeriv p) := by sorry

/-- This is the kernel of the restricted logarithmic derivative, before the
subsequent Coleman-map factors; no surjectivity is assumed. -/
theorem normFixedLogDeriv_eq_one_iff (u : normFixedUnits p) :
    normFixedLogDeriv p u = 1 ↔ ∃ c : Zˣ,
      c ^ (p-1) = 1 ∧ Units.map PowerSeries.C.toMonoidHom c = (u : Bˣ) := by sorry

-- NormLogDerivTests.identity: zero in the additive fixed submodule.
example : normFixedLogDeriv p 1 = 1 := by sorry
-- NormLogDerivTests.constant: tests the constant-root kernel and its fixedness together.
example (c : Zˣ) (hc : c^(p-1) = 1) :
    ∃ h : Units.map PowerSeries.C.toMonoidHom c ∈ normFixedUnits p,
      normFixedLogDeriv p ⟨Units.map PowerSeries.C.toMonoidHom c, h⟩ = 1 := by sorry
-- NormLogDerivTests.dyadic_Y: -Y is fixed at p=2 and its logarithmic derivative is one.
example (u : (PowerSeries (PadicInt 2))ˣ)
    (hu : (u : PowerSeries (PadicInt 2)) = -(1 + PowerSeries.X)) :
    ∃ h : u ∈ normFixedUnits 2,
      (Multiplicative.toAdd (normFixedLogDeriv 2 ⟨u,h⟩)).1 = 1 := by sorry
-- NormLogDerivTests.dyadic_minus_one: kernel on all units is too large.
example : (-1 : (PowerSeries (PadicInt 2))ˣ) ∉ normFixedUnits 2 := by sorry

-- NormLogDerivTests.trace_factor: Δ(Y)=1, so the integral trace is p, not one.
example (u : Bˣ) (hu : (u : B) = Y) : colemanTrace p (logDeriv u) = p := by sorry
-- NormLogDerivTests.matrix_connection: the two-by-two companion matrix checks the sign.
example :
    let M : Matrix (Fin 2) (Fin 2) B := !![0,Y;1,0]
    let J : Matrix (Fin 2) (Fin 2) B := Matrix.diagonal (fun i => (i.val : B))
    (2 : B) • M.map d + J*M - M*J = M := by sorry
-- NormLogDerivTests.empty_determinant: no nonempty index hypothesis in the adapter.
example (D : Derivation Z B B) (M : (Matrix (Fin 0) (Fin 0) B)ˣ) :
    D (Matrix.det (M : Matrix (Fin 0) (Fin 0) B)) = 0 := by sorry
end NormLogDeriv
end TauCetiRoadmap.Campaign.ColemanPowerSeries

/- L3: the fixed-space Frobenius exact sequence. The carrier and bounded psi
are the existing native power series and the actual shared-measure operator. -/
namespace TauCetiRoadmap.Campaign.ColemanPowerSeries
open scoped PowerSeries.WithPiTopology BigOperators Topology
open Filter Topology
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]
local notation "B" => PowerSeries Z
local notation "Y" => (1 + PowerSeries.X : B)
set_option quotPrecheck false in
local notation "Φ" => PowerSeries.substAlgHom (R := Z)
  (PowerSeries.HasSubst.of_constantCoeff_zero' (by simp :
    PowerSeries.constantCoeff (Y^p-1) = 0))
local notation "W" => LinearMap.ker (AbstractMeasure.psiSeries p - LinearMap.id)
local notation "U" => LinearMap.ker (AbstractMeasure.psiSeries p)

/-- L3/frobenius-iterate-substitution. -/
theorem frobenius_iterate_substitution (F : B) (n : ℕ) :
    (Φ : B → B)^[n] F = PowerSeries.subst (Y^(p^n)-1) F := by sorry

/-- L3/frobenius-iterate-decay: coefficientwise p-adic topology. -/
theorem frobenius_iterate_tendsto_zero (F : B) (hF : F.constantCoeff = 0) :
    Tendsto (fun n : ℕ => (Φ : B → B)^[n] F) atTop (𝓝 0) := by sorry

/-- L3/frobenius-iterate-summability. -/
theorem frobenius_iterate_summable (F : B) (hF : F.constantCoeff = 0) :
    Summable (fun n : ℕ => (Φ : B → B)^[n] F) := by sorry

/-- L3/frobenius-sum: a sum on the actual zero-constant domain. -/
def frobeniusSum (F : B) (hF : F.constantCoeff = 0) : B := by sorry

/-- L3/frobenius-sum-has-sum: the defining convergent sum. -/
theorem frobeniusSum_hasSum (F : B) (hF : F.constantCoeff = 0) :
    HasSum (fun n : ℕ => (Φ : B → B)^[n] F) (frobeniusSum p F hF) := by sorry

theorem frobeniusSum_eq_tsum (F : B) (hF : F.constantCoeff = 0) :
    frobeniusSum p F hF = ∑' n : ℕ, (Φ : B → B)^[n] F := by sorry

theorem frobeniusSum_constantCoeff (F : B) (hF : F.constantCoeff = 0) :
    (frobeniusSum p F hF).constantCoeff = 0 := by sorry

theorem frobeniusSum_add (F G : B) (hF : F.constantCoeff = 0)
    (hG : G.constantCoeff = 0) (hFG : (F+G).constantCoeff = 0) :
    frobeniusSum p (F+G) hFG = frobeniusSum p F hF + frobeniusSum p G hG := by sorry

theorem frobeniusSum_smul (c : Z) (F : B) (hF : F.constantCoeff = 0)
    (hcF : (c • F).constantCoeff = 0) :
    frobeniusSum p (c • F) hcF = c • frobeniusSum p F hF := by sorry

/-- L3/frobenius-sum-telescoping. -/
theorem frobeniusSum_sub_phi (F : B) (hF : F.constantCoeff = 0) :
    frobeniusSum p F hF - Φ (frobeniusSum p F hF) = F := by sorry

/-- L3/frobenius-sum-psi-fixed. -/
theorem psi_frobeniusSum (F : B) (hF : F.constantCoeff = 0)
    (hpsi : AbstractMeasure.psiSeries p F = 0) :
    AbstractMeasure.psiSeries p (frobeniusSum p F hF) = frobeniusSum p F hF := by sorry

-- Test frobenius_sum_zero.
example (hz : (0 : B).constantCoeff = 0) : frobeniusSum p 0 hz = 0 := by sorry
-- Test frobenius_sum_telescope: the ordinary variable is recovered, not an arbitrary constant.
example (hf : (PowerSeries.X - Φ PowerSeries.X : B).constantCoeff = 0) :
    frobeniusSum p (PowerSeries.X - Φ PowerSeries.X) hf = PowerSeries.X := by sorry
-- Test frobenius_sum_dyadic: an actual zero-mass unit-supported polynomial.
example (hf : ((1+PowerSeries.X : PowerSeries ℤ_[2]) - (1+PowerSeries.X)^3).constantCoeff = 0) :
    let F : PowerSeries ℤ_[2] := (1+PowerSeries.X) - (1+PowerSeries.X)^3
    PowerSeries.coeff 1 (frobeniusSum 2 F hf) = 2 ∧
      3 * PowerSeries.coeff 2 (frobeniusSum 2 F hf) = 1 := by sorry

/-- L3/frobenius-leading-coefficient; corrected p^r factor of source finding E12. -/
theorem frobenius_leading_coefficient (F : B) (r : ℕ) (hr : 0 < r)
    (hbelow : ∀ k, 0 < k → k < r → PowerSeries.coeff k F = 0) :
    PowerSeries.coeff r (Φ F) = (p : Z)^r * PowerSeries.coeff r F := by sorry

/-- L3/frobenius-fixed-constants. -/
theorem frobenius_fixed_iff_constant (F : B) :
    Φ F = F ↔ F = PowerSeries.C F.constantCoeff := by sorry

/-- L3/psi-fixed-boundary: restrict 1-phi to the actual fixed submodule. -/
def psiFixedBoundary : W →ₗ[Z] U := by sorry

theorem psiFixedBoundary_val (F : W) :
    (psiFixedBoundary p F : B) = (F : B) - Φ (F : B) := by sorry

theorem psiFixedBoundary_add (F G : W) :
    psiFixedBoundary p (F+G) = psiFixedBoundary p F + psiFixedBoundary p G := by sorry

theorem psiFixedBoundary_smul (c : Z) (F : W) :
    psiFixedBoundary p (c • F) = c • psiFixedBoundary p F := by sorry

theorem psiFixedBoundary_unitRestriction (F : W) :
    (psiFixedBoundary p F : B) = (F : B) - Φ (AbstractMeasure.psiSeries p (F : B)) := by sorry

-- Test psi_fixed_boundary_zero.
example : psiFixedBoundary p 0 = 0 := by sorry
-- Test psi_fixed_boundary_constant: every integral constant is killed.
example (c : Z) (F : W) (hF : (F : B) = PowerSeries.C c) :
    psiFixedBoundary p F = 0 := by sorry
-- Test psi_fixed_boundary_projection: compare the already supplied unit restriction.
example (F : W) : (psiFixedBoundary p F : B) =
    (F : B) - Φ (AbstractMeasure.psiSeries p (F : B)) := by sorry

/-- L3/psi-fixed-boundary-kernel. -/
theorem psiFixedBoundary_eq_zero_iff (F : W) :
    psiFixedBoundary p F = 0 ↔ ∃ c : Z, (F : B) = PowerSeries.C c := by sorry

/-- L3/psi-fixed-boundary-range; this is the exact evaluation obstruction. -/
theorem psiFixedBoundary_range : LinearMap.range (psiFixedBoundary p) =
    LinearMap.ker ((PowerSeries.coeff 0).comp (U).subtype) := by sorry

/-- L3/psi-kernel-evaluation-surjective. The section is c*(1+T). -/
theorem psiKernel_eval_surjective :
    Function.Surjective ((PowerSeries.coeff 0).comp (U).subtype : U →ₗ[Z] Z) := by sorry

/-- L3/psi-fixed-boundary-topology: continuous maps with the correct closed image. -/
theorem psiFixedBoundary_topology :
    Topology.IsClosedEmbedding (PowerSeries.C (R := Z)) ∧
    Continuous (psiFixedBoundary p) ∧
    IsClosed (Set.range (psiFixedBoundary p)) ∧
    IsQuotientMap (psiFixedBoundary p).rangeRestrict ∧
    IsQuotientMap ((PowerSeries.coeff 0).comp (U).subtype : U →ₗ[Z] Z) ∧
    Continuous ((PowerSeries.coeff 0).comp (U).subtype : U →ₗ[Z] Z) := by sorry

-- Test frobenius_leading_square: the printed coefficient p is wrong at r=2.
example : PowerSeries.coeff 2 (((1+PowerSeries.X : PowerSeries ℤ_[2])^2-1)^2) = 4 ∧
    PowerSeries.coeff 2 (((1+PowerSeries.X : PowerSeries ℤ_[2])^2-1)^2) ≠ 2 := by sorry

-- Test frobenius_nonzero_constant: the summation construction cannot admit a nonzero constant.
example : ¬ Summable (fun n : ℕ => (Φ : B → B)^[n] (1 : B)) := by sorry
-- Test boundary_evaluation_obstruction: the last map is necessary; Y has psi zero and nonzero evaluation.
example (hY : AbstractMeasure.psiSeries p Y = 0) :
    ¬ ∃ F : W, (psiFixedBoundary p F : B) = Y := by sorry
end TauCetiRoadmap.Campaign.ColemanPowerSeries

/-! ## Compact lifting for the logarithmic-derivative image

The mod-p image hypothesis remains explicit. No characteristic-p image
calculation or arithmetic interpolation theorem is assumed implicitly.
-/
namespace TauCetiRoadmap.Campaign.ColemanPowerSeries
open Filter Topology
open scoped PowerSeries.WithPiTopology
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]
local notation "B" => PowerSeries Z
local notation "B₀" => PowerSeries (ZMod p)
local notation "ρ" => PowerSeries.map (PadicInt.toZMod : Z →+* ZMod p)
local notation "Ψ" => AbstractMeasure.psiSeries p

theorem compactSpace_normFixedUnits : CompactSpace (normFixedUnits p) := by sorry

theorem isClosed_range_normFixedLogDeriv :
    IsClosed (Set.range (fun u : normFixedUnits p => logDeriv (u : Bˣ))) := by sorry

theorem psi_p_pow_fixed_iff (n : ℕ) (F : B) :
    Ψ ((p : B)^n * F) = (p : B)^n * F ↔ Ψ F = F := by sorry

theorem tendsto_of_p_pow_dvd_sub (f : ℕ → B) (F : B)
    (h : ∀ n, (p : B)^n ∣ f n - F) : Tendsto f atTop (𝓝 F) := by sorry

theorem logDeriv_precision_step (u v : normFixedUnits p) (F H : B) (n : ℕ)
    (hu : logDeriv (u : Bˣ) - F = (p : B)^n * H)
    (hv : (p : B) ∣ logDeriv (v : Bˣ) - H) :
    (p : B)^(n+1) ∣
      logDeriv ((u * v ^ (-((p^n : ℕ) : ℤ)) : normFixedUnits p) : Bˣ) - F := by sorry

theorem logDeriv_approximate_mod_p_pow
    (hres : ∀ F : B, Ψ F = F → ∃ u : normFixedUnits p,
      ρ (logDeriv (u : Bˣ)) = ρ F)
    (F : B) (hF : Ψ F = F) (n : ℕ) :
    ∃ u : normFixedUnits p, (p : B)^n ∣ logDeriv (u : Bˣ) - F := by sorry

theorem normFixedLogDeriv_surjective_of_mod_p
    (hres : ∀ F : B, Ψ F = F → ∃ u : normFixedUnits p,
      ρ (logDeriv (u : Bˣ)) = ρ F) :
    Function.Surjective (normFixedLogDeriv p) := by sorry

theorem residue_normFixedUnits_surjective :
    Function.Surjective (fun u : normFixedUnits p => Units.map (ρ).toMonoidHom (u : Bˣ)) := by sorry

theorem normFixedLogDeriv_surjective_iff_residue_logDeriv :
    Function.Surjective (normFixedLogDeriv p) ↔
      ∀ F : B, Ψ F = F → ∃ v : B₀ˣ, logDeriv v = ρ F := by sorry

-- LogImageTests.zero_precision
example (F : B) : (p : B)^0 ∣ logDeriv (1 : Bˣ) - F := by sorry
-- LogImageTests.dyadic_unit_lift
example (v : (PowerSeries (ZMod 2))ˣ) :
    ∃ u : normFixedUnits 2,
      Units.map (PowerSeries.map (PadicInt.toZMod : ℤ_[2] →+* ZMod 2)).toMonoidHom
        (u : (PowerSeries ℤ_[2])ˣ) = v := by sorry
-- LogImageTests.varying_quotient_decay
example (q : ℕ → B) : Tendsto (fun n => (p : B)^n * q n) atTop (𝓝 0) := by sorry
-- LogImageTests.p_saturation
example (F : B) : Ψ ((p : B) * F) = (p : B) * F ↔ Ψ F = F := by sorry
-- LogImageTests.odd_constant_kernel
example : (-1 : (PowerSeries ℤ_[3])ˣ) ∈ normFixedUnits 3 ∧
    logDeriv (-1 : (PowerSeries ℤ_[3])ˣ) = 0 ∧
    (-1 : ℤ_[3])^3 ≠ 1 := by sorry
end TauCetiRoadmap.Campaign.ColemanPowerSeries

/-! ## Characteristic-p logarithmic image
The residue averaging operator is the actual PMIA supplier. Euler products use the
native power-series product topology; no Laurent-series action is assumed.
-/
namespace TauCetiRoadmap.Campaign.ColemanPowerSeries
noncomputable section
open PowerSeries Filter Topology
open scoped PowerSeries.WithPiTopology BigOperators
variable (p : ℕ) [Fact p.Prime]
local notation "k" => ZMod p
local notation "B₀" => PowerSeries k
local notation "η[" u "]" =>
  (X * PowerSeries.derivative k (u : B₀) * ((u⁻¹ : B₀ˣ) : B₀))
local notation "φ₀" => PowerSeries.expand p (Nat.Prime.ne_zero (Fact.out : p.Prime))
local instance : TopologicalSpace (ZMod p) := ⊥
local instance : DiscreteTopology (ZMod p) := ⟨rfl⟩

theorem residuePsi_logDeriv (u : B₀ˣ) :
    IwasawaResidue.residuePsi p (logDeriv u) = logDeriv u := by sorry

theorem frobenius_coefficient_completion (a : B₀) (ha : a.constantCoeff = 0) :
    ∃ h H : B₀, h.constantCoeff = 0 ∧
      (∀ n, h.coeff (p*n) = h.coeff n) ∧
      (∀ n, ¬ p ∣ n → h.coeff n = a.coeff n) ∧
      a - h = X^p * φ₀ H := by sorry

theorem euler_factor_logarithmic_coeff (m : ℕ) (hm : 0 < m) (a : k)
    (u : B₀ˣ) (hu : (u : B₀) = 1 - monomial m a) (n : ℕ) :
    (η[u]).coeff n = if 0 < n ∧ m ∣ n then -(m : k) * a^(n/m) else 0 := by sorry

theorem euler_factor_frobenius_coeff (m : ℕ) (hm : 0 < m) (a : k)
    (u : B₀ˣ) (hu : (u : B₀) = 1 - monomial m a) (n : ℕ) :
    (η[u]).coeff (p*n) = (η[u]).coeff n := by sorry

theorem euler_correction_step (h : B₀) (m : ℕ) (hm : 0 < m)
    (hfixed : ∀ n, h.coeff (p*n) = h.coeff n)
    (hvanish : ∀ n < m, h.coeff n = 0) :
    ∃ a : k, ∃ u : B₀ˣ, (u : B₀) = 1 - monomial m a ∧
      (p ∣ m → a = 0) ∧
      (∀ n ≤ m, (h - η[u]).coeff n = 0) ∧
      (∀ n, (h - η[u]).coeff (p*n) = (h - η[u]).coeff n) := by sorry

theorem euler_correction_sequence (h : B₀) (hzero : h.constantCoeff = 0)
    (hfixed : ∀ n, h.coeff (p*n) = h.coeff n) :
    ∃ a : ℕ → k, ∃ u : ℕ → B₀ˣ, a 0 = 0 ∧
      (∀ m, p ∣ m → a m = 0) ∧
      (∀ N, (u N : B₀) = ∏ i ∈ Finset.range N, (1 - monomial (i+1) (a (i+1)))) ∧
      (∀ N n, n ≤ N → (η[u N]).coeff n = h.coeff n) := by sorry

theorem euler_product_unit_limit (a : ℕ → k) :
    ∃ u : B₀ˣ, (u : B₀).constantCoeff = 1 ∧
      (u : B₀) = ∏' i : ℕ, (1 - monomial (i+1) (a (i+1))) ∧
      (∀ N n, n ≤ N → (u : B₀).coeff n =
        (∏ i ∈ Finset.range N, (1 - monomial (i+1) (a (i+1))) : B₀).coeff n) := by sorry

theorem radial_logarithmic_coeff_congr (u v : B₀ˣ) (N : ℕ)
    (h : ∀ n ≤ N, (u : B₀).coeff n = (v : B₀).coeff n) :
    ∀ n ≤ N, (η[u]).coeff n = (η[v]).coeff n := by sorry

theorem frobenius_fixed_logarithmic_primitive (h : B₀)
    (hzero : h.constantCoeff = 0) (hfixed : ∀ n, h.coeff (p*n) = h.coeff n) :
    ∃ u : B₀ˣ, (u : B₀).constantCoeff = 1 ∧ η[u] = h := by sorry

theorem residue_logarithmic_decomposition (g : B₀) :
    ∃ u : B₀ˣ, ∃ H : B₀,
      g = logDeriv u + (1+X)*X^(p-1)*φ₀ H := by sorry

theorem residuePsi_fixed_logarithmic_image (g : B₀)
    (hg : IwasawaResidue.residuePsi p g = g) :
    ∃ u : B₀ˣ, logDeriv u = g := by sorry

theorem normFixedLogDeriv_surjective :
    Function.Surjective (normFixedLogDeriv p) := by sorry

-- ResidueImageTests.empty_product: degree zero of every Euler product is one.
example (a : ℕ → k) :
    (∏' i : ℕ, (1 - monomial (i+1) (a (i+1))) : B₀).constantCoeff = 1 := by sorry
-- ResidueImageTests.ternary_first_factor: the sign in the correction is essential.
example (u : (PowerSeries (ZMod 3))ˣ)
    (hu : (u : PowerSeries (ZMod 3)) = 1 - monomial 1 (2 : ZMod 3)) :
    (X * derivative (ZMod 3) (u : PowerSeries (ZMod 3)) *
      ((u⁻¹ : (PowerSeries (ZMod 3))ˣ) : PowerSeries (ZMod 3))).coeff 1 = 1 := by sorry
-- ResidueImageTests.characteristic_kernel: a nonconstant pth-power factor has zero derivative.
example (u : B₀ˣ) (hu : (u : B₀) = 1 - monomial p (1 : k)) :
    logDeriv u = 0 := by sorry
-- ResidueImageTests.dyadic_image: the image theorem includes p=2.
example (g : PowerSeries (ZMod 2)) (hg : IwasawaResidue.residuePsi 2 g = g) :
    ∃ u : (PowerSeries (ZMod 2))ˣ, logDeriv u = g := by sorry
-- ResidueImageTests.zero_primitive: normalize the constant coefficient, not the whole char-p kernel.
example : (1 : B₀ˣ).val.constantCoeff = 1 ∧ η[(1 : B₀ˣ)] = 0 := by sorry
end
end TauCetiRoadmap.Campaign.ColemanPowerSeries

/-! ## Determinant norm and the product of integral root translations
The actual Frobenius scalar algebra and the PMIA translations are reused.
The Vandermonde determinant is nonzero in the receiving domain; it need not
be a unit in the integral coefficient ring. -/
namespace TauCetiRoadmap.Campaign.ColemanPowerSeries
noncomputable section
open scoped PowerSeries Valued BigOperators
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => PadicInt p
local notation "B" => PowerSeries Z
local notation "O" => 𝒪[ℂ_[p]]
local notation "Y" => (1 + PowerSeries.X : B)
local notation "YO" => (1 + PowerSeries.X : PowerSeries O)
set_option quotPrecheck false in
local notation "Phi" => (PowerSeries.substAlgHom
  (PowerSeries.HasSubst.of_constantCoeff_zero' (by simp :
    PowerSeries.constantCoeff (Y ^ p - 1) = 0))).toRingHom
set_option quotPrecheck false in
local notation "PhiAlg" => phiScalarAlgebra p
set_option quotPrecheck false in
local notation "PhiMod" => @Algebra.toModule B B _ _ PhiAlg
set_option quotPrecheck false in
local notation "coords" =>
  (@Module.Basis.repr (Fin p) B B _ _ PhiMod (phiBasis p)).toEquiv
set_option quotPrecheck false in
local notation "mulMatrix" =>
  (@AlgHom.toRingHom B B (Matrix (Fin p) (Fin p) B) _ _ _ PhiAlg _
    (@Algebra.leftMulMatrix B B _ _ PhiAlg (Fin p) _ _ (phiBasis p)))
local notation "j" => IwasawaAveraging.integralCoefficientMap p
local notation "ι" => PowerSeries.map j

/-- L1/root-translation-frobenius-scalars: comparison for the Coleman scalar algebra. -/
theorem rootTranslation_phiScalar (ζ : O) (hζ : ζ^p=1) (i : ℕ) (a : B) :
    IwasawaAveraging.rootTranslation p ζ hζ i (@algebraMap B B _ _ PhiAlg a) =
      ι (Phi a) := by sorry

/-- L1/root-translated-frobenius-coordinates. -/
theorem rootTranslation_phiBasis_repr (ζ : O) (hζ : ζ^p=1) (i : ℕ) (F : B) :
    IwasawaAveraging.rootTranslation p ζ hζ i F =
      ∑ k : Fin p, ι (Phi (coords F k)) *
        (PowerSeries.C (ζ^i) * YO)^k.val := by sorry

/-- L1/root-evaluation-vandermonde-nonzero. -/
theorem phiBasis_root_vandermonde_det_ne_zero (ζ : O) (hζ : IsPrimitiveRoot ζ p) :
    Matrix.det (Matrix.vandermonde
      (fun i : Fin p => PowerSeries.C (ζ^i.val) * YO)) ≠ 0 := by sorry

/-- L1/root-translation-multiplication-matrix. -/
theorem phiBasis_root_matrix_intertwines (ζ : O) (hζ : IsPrimitiveRoot ζ p) (F : B) :
    Matrix.vandermonde (fun i : Fin p => PowerSeries.C (ζ^i.val) * YO) *
      (mulMatrix F).map (fun a => ι (Phi a)) =
    Matrix.diagonal (fun i : Fin p =>
        IwasawaAveraging.rootTranslation p ζ hζ.pow_eq_one i.val F) *
      Matrix.vandermonde (fun i : Fin p => PowerSeries.C (ζ^i.val) * YO) := by sorry

/-- L1/coleman-norm-root-product: integral receiving ring, actual determinant norm. -/
theorem colemanNorm_root_product (ζ : O) (hζ : IsPrimitiveRoot ζ p) (F : B) :
    ι (Phi (colemanNorm p F)) =
      ∏ i : Fin p, IwasawaAveraging.rootTranslation p ζ hζ.pow_eq_one i.val F := by sorry

/-- L1/coleman-norm-root-product-unique. -/
theorem colemanNorm_root_product_iff (ζ : O) (hζ : IsPrimitiveRoot ζ p) (F G : B) :
    ι (Phi G) =
      (∏ i : Fin p, IwasawaAveraging.rootTranslation p ζ hζ.pow_eq_one i.val F) ↔
        G = colemanNorm p F := by sorry

-- NormRootTests.one: all primes, and the empty/zero confusion is excluded.
example (ζ : O) (hζ : IsPrimitiveRoot ζ p) :
    (∏ i : Fin p, IwasawaAveraging.rootTranslation p ζ hζ.pow_eq_one i.val 1) = 1 := by sorry
-- NormRootTests.constant: a constant is raised to the degree p.
example (ζ : O) (hζ : IsPrimitiveRoot ζ p) (c : Z) :
    (∏ i : Fin p, IwasawaAveraging.rootTranslation p ζ hζ.pow_eq_one i.val
      (PowerSeries.C c)) = PowerSeries.C (j (c^p)) := by sorry
-- NormRootTests.variable: the dyadic sign is retained.
example (ζ : O) (hζ : IsPrimitiveRoot ζ p) :
    (∏ i : Fin p, IwasawaAveraging.rootTranslation p ζ hζ.pow_eq_one i.val
      PowerSeries.X) = (-1 : PowerSeries O)^(p-1) * (YO^p-1) := by sorry
-- NormRootTests.translated_power: source and receiving variables are different.
example (ζ : O) (hζ : IsPrimitiveRoot ζ p) :
    (∏ i : Fin p, IwasawaAveraging.rootTranslation p ζ hζ.pow_eq_one i.val Y) =
      (-1 : PowerSeries O)^(p-1) * YO^p := by sorry
-- NormRootTests.root_choice: the finite product is independent of the primitive root.
example (ζ ξ : O) (hζ : IsPrimitiveRoot ζ p) (hξ : IsPrimitiveRoot ξ p) (F : B) :
    (∏ i : Fin p, IwasawaAveraging.rootTranslation p ζ hζ.pow_eq_one i.val F) =
      ∏ i : Fin p, IwasawaAveraging.rootTranslation p ξ hξ.pow_eq_one i.val F := by sorry
end
end TauCetiRoadmap.Campaign.ColemanPowerSeries

/- Local cyclotomic algebraic tower. Suggested signatures only; the reader is
normative. n is source level n+1. No local topology or ramification is assumed. -/
noncomputable section
namespace ColemanCyclotomic
set_option synthInstance.maxHeartbeats 100000
open Polynomial
variable (p : ℕ) [Fact p.Prime]
local notation "Ω" => AlgebraicClosure ℚ_[p]
local notation "E" => fun (n : ℕ) => Polynomial.comp (cyclotomic (p^(n+1)) ℤ_[p]) (X+1)

lemma shifted_const (n : ℕ) : (E n).coeff 0 = (p : ℤ_[p]) := sorry
lemma shifted_eisenstein (n : ℕ) :
    (E n).IsEisensteinAt (Ideal.span {(p : ℤ_[p])}) := sorry
theorem local_cyclotomic_irreducible (n : ℕ) :
    Irreducible (cyclotomic (p^(n+1)) ℚ_[p]) := sorry
lemma primitive_lift {L : Type*} [Field L] {n : ℕ} {z w : L}
    (hz : IsPrimitiveRoot z (p^(n+1))) (hw : w^p=z) :
    IsPrimitiveRoot w (p^(n+2)) := sorry

def roots (n : ℕ) : Ω := sorry
lemma roots_def (n : ℕ) : roots p n =
    (fun z : Ω => (IsAlgClosed.exists_pow_nat_eq z (Fact.out : p.Prime).pos).choose)^[n]
      (HasEnoughRootsOfUnity.exists_primitiveRoot Ω p).choose := sorry
lemma roots_succ (n : ℕ) : roots p (n+1)^p = roots p n := sorry
lemma roots_primitive (n : ℕ) : IsPrimitiveRoot (roots p n) (p^(n+1)) := sorry

def level (n : ℕ) : IntermediateField ℚ_[p] Ω := sorry
lemma level_def (n : ℕ) : level p n = IntermediateField.adjoin ℚ_[p] {roots p n} := sorry
lemma root_mem (n : ℕ) : roots p n ∈ level p n := sorry
instance level_cyclotomic (n : ℕ) :
    IsCyclotomicExtension {p^(n+1)} ℚ_[p] (level p n) := sorry
instance level_finite (n : ℕ) : FiniteDimensional ℚ_[p] (level p n) := sorry
def zeta (n : ℕ) : level p n := sorry
lemma zeta_val (n : ℕ) : (zeta p n).val = roots p n := sorry
lemma zeta_primitive (n : ℕ) : IsPrimitiveRoot (zeta p n) (p^(n+1)) := sorry
lemma level_mono (n : ℕ) : level p n ≤ level p (n+1) := sorry
instance level_step_algebra (n : ℕ) : Algebra (level p n) (level p (n+1)) :=
  (IntermediateField.inclusion (level_mono p n)).toAlgebra
instance level_step_tower (n : ℕ) : IsScalarTower ℚ_[p] (level p n) (level p (n+1)) := sorry
instance level_step_finite (n : ℕ) :
    @FiniteDimensional (level p n) (level p (n+1)) _ _
      (@Algebra.toModule _ _ _ _ (level_step_algebra p n)) := sorry
lemma zeta_step (n : ℕ) : zeta p (n+1)^p = algebraMap (level p n) (level p (n+1)) (zeta p n) := sorry
lemma level_degree (n : ℕ) : Module.finrank ℚ_[p] (level p n) = p^n*(p-1) := sorry
lemma level_relative_degree (n : ℕ) : Module.finrank (level p n) (level p (n+1)) = p := sorry

def relativeBasis (n : ℕ) : PowerBasis (level p n) (level p (n+1)) := sorry
lemma relativeBasis_gen (n : ℕ) : (relativeBasis p n).gen = zeta p (n+1) := sorry
lemma relativeBasis_dim (n : ℕ) : (relativeBasis p n).dim = p := sorry
lemma relativeBasis_entry (n : ℕ) (i : Fin (relativeBasis p n).dim) :
    (relativeBasis p n).basis i = zeta p (n+1)^i.val := sorry
lemma relative_minpoly (n : ℕ) : minpoly (level p n) (zeta p (n+1)) = X^p-C (zeta p n) := sorry
lemma relative_norm_root (n : ℕ) : Algebra.norm (level p n) (zeta p (n+1)) =
    (-1 : level p n)^(p+1)*zeta p n := sorry
lemma relative_norm_difference (n : ℕ) : Algebra.norm (level p n) (zeta p (n+1)-1) =
    (-1 : level p n)^(p+1)*(zeta p n-1) := sorry

-- SuggestedCyclotomicTests.root_initial_order
example : IsPrimitiveRoot (roots p 0) p := sorry
-- SuggestedCyclotomicTests.root_first_transition
example : roots p 1^p = roots p 0 := sorry
-- SuggestedCyclotomicTests.dyadic_initial_root
example : roots 2 0 = -1 := sorry
-- SuggestedCyclotomicTests.initial_degree
example : Module.finrank ℚ_[p] (level p 0) = p-1 := sorry
-- SuggestedCyclotomicTests.dyadic_initial_degree
example : Module.finrank ℚ_[2] (level 2 0) = 1 := sorry
-- SuggestedCyclotomicTests.distinguished_generator
example (n : ℕ) : (zeta p n).val = roots p n := sorry
-- SuggestedCyclotomicTests.basis_generator
example (n : ℕ) : (relativeBasis p n).gen = zeta p (n+1) := sorry
-- SuggestedCyclotomicTests.basis_initial_dimension
example : (relativeBasis p 0).dim = p := sorry
-- SuggestedCyclotomicTests.basis_zero
example (n : ℕ) (h : 0 < (relativeBasis p n).dim) :
    (relativeBasis p n).basis ⟨0,h⟩ = 1 := sorry
-- SuggestedCyclotomicTests.dyadic_difference_norm
example : Algebra.norm (level 2 0) (zeta 2 1-1) = 2 := sorry
-- SuggestedCyclotomicTests.odd_difference_norm
example (n : ℕ) (hp : Odd p) :
    Algebra.norm (level p n) (zeta p (n+1)-1) = zeta p n-1 := sorry
end ColemanCyclotomic
end

/- Algebraic integral closure at each cyclotomic level. This section does not
install a valuation or identify its quotient with a valuative residue field. -/
noncomputable section
namespace ColemanCyclotomic
open Polynomial
variable (p : ℕ) [Fact p.Prime]

-- Canonical scalar restriction through the already specified Q_p-algebra.
instance level_integer_algebra (n : ℕ) : Algebra ℤ_[p] (level p n) :=
  ((algebraMap ℚ_[p] (level p n)).comp (algebraMap ℤ_[p] ℚ_[p])).toAlgebra
instance level_integer_tower (n : ℕ) : IsScalarTower ℤ_[p] ℚ_[p] (level p n) := sorry

local notation "O" => fun n => integralClosure ℤ_[p] (level p n)
local notation "E" => fun n => Polynomial.comp (cyclotomic (p^(n+1)) ℤ_[p]) (X+1)

lemma zeta_integral (n : ℕ) : IsIntegral ℤ_[p] (zeta p n) := sorry
lemma difference_minpoly (n : ℕ) :
    minpoly ℤ_[p] (zeta p n-1) = E n := sorry
lemma p_power_denominator (n : ℕ) (x : level p n) :
    ∃ k : ℕ, (p : ℤ_[p])^k • x ∈ Algebra.adjoin ℤ_[p] {zeta p n-1} := sorry
theorem integralClosure_eq_adjoin (n : ℕ) :
    integralClosure ℤ_[p] (level p n) = Algebra.adjoin ℤ_[p] {zeta p n-1} := sorry

def integralZeta (n : ℕ) : O n := sorry
lemma integralZeta_val (n : ℕ) : (integralZeta p n).val = zeta p n := sorry
lemma integralZeta_primitive (n : ℕ) :
    IsPrimitiveRoot (integralZeta p n) (p^(n+1)) := sorry
lemma integralZeta_difference_val (n : ℕ) :
    (integralZeta p n-1 : O n).val = zeta p n-1 := sorry

def integralBasis (n : ℕ) : PowerBasis ℤ_[p] (O n) := sorry
lemma integralBasis_gen (n : ℕ) : (integralBasis p n).gen = integralZeta p n-1 := sorry
lemma integralBasis_dim (n : ℕ) : (integralBasis p n).dim = p^n*(p-1) := sorry
lemma integralBasis_entry (n : ℕ) (i : Fin (integralBasis p n).dim) :
    (integralBasis p n).basis i = (integralZeta p n-1)^i.val := sorry
lemma integral_difference_minpoly (n : ℕ) :
    minpoly ℤ_[p] (integralZeta p n-1) = E n := sorry
lemma prime_mem_differenceIdeal (n : ℕ) :
    (p : O n) ∈ Ideal.span {integralZeta p n-1} := sorry

def reduction (n : ℕ) : O n →+* ZMod p := sorry
lemma reduction_scalar (n : ℕ) (a : ℤ_[p]) :
    reduction p n (algebraMap ℤ_[p] (O n) a) = PadicInt.toZMod a := sorry
lemma reduction_zeta (n : ℕ) : reduction p n (integralZeta p n) = 1 := sorry
lemma reduction_aeval (n : ℕ) (f : ℤ_[p][X]) :
    reduction p n (aeval (integralZeta p n-1) f) = PadicInt.toZMod (f.coeff 0) := sorry
lemma reduction_unique (n : ℕ) (f : O n →+* ZMod p)
    (hs : ∀ a : ℤ_[p], f (algebraMap ℤ_[p] (O n) a) = PadicInt.toZMod a)
    (hz : f (integralZeta p n) = 1) : f = reduction p n := sorry
theorem reduction_ker (n : ℕ) :
    RingHom.ker (reduction p n) = Ideal.span {integralZeta p n-1} := sorry

def differenceQuotientEquiv (n : ℕ) :
    (O n ⧸ Ideal.span {integralZeta p n-1}) ≃+* ZMod p := sorry
lemma differenceQuotientEquiv_mk (n : ℕ) (x : O n) :
    differenceQuotientEquiv p n (Ideal.Quotient.mk _ x) = reduction p n x := sorry
lemma differenceQuotientEquiv_scalar (n : ℕ) (a : ℤ_[p]) :
    differenceQuotientEquiv p n (Ideal.Quotient.mk _ (algebraMap ℤ_[p] (O n) a)) =
      PadicInt.toZMod a := sorry
lemma differenceQuotientEquiv_symm_nat (n a : ℕ) :
    (differenceQuotientEquiv p n).symm (a : ZMod p) = Ideal.Quotient.mk _ (a : O n) := sorry

-- IntegralTowerTests.root_order
example (n : ℕ) : (integralZeta p n)^(p^(n+1)) = 1 := sorry
-- IntegralTowerTests.dyadic_root
example : integralZeta 2 0 = -1 := sorry
-- IntegralTowerTests.root_inclusion
example (n : ℕ) : ((integralZeta p n).val).val = roots p n := sorry
-- IntegralTowerTests.basis_zero
example (n : ℕ) (h : 0 < (integralBasis p n).dim) :
    (integralBasis p n).basis ⟨0,h⟩ = 1 := sorry
-- IntegralTowerTests.dyadic_basis_dimension
example : (integralBasis 2 0).dim = 1 := sorry
-- IntegralTowerTests.ternary_basis_dimension
example : (integralBasis 3 0).dim = 2 := sorry
-- IntegralTowerTests.dyadic_difference
example : integralZeta 2 0-1 = -2 := sorry
-- IntegralTowerTests.reduction_polynomial
example (n : ℕ) : reduction p n ((integralZeta p n-1)^2+2*(integralZeta p n-1)+3) = 3 := sorry
-- IntegralTowerTests.reduction_prime
example (n : ℕ) : reduction p n (p : O n) = 0 := sorry
-- IntegralTowerTests.reduction_root
example (n : ℕ) : reduction p n (integralZeta p n) = 1 := sorry
-- IntegralTowerTests.quotient_difference
example (n : ℕ) : differenceQuotientEquiv p n
    (Ideal.Quotient.mk _ (integralZeta p n-1)) = 0 := sorry
-- IntegralTowerTests.quotient_one
example (n : ℕ) : differenceQuotientEquiv p n (Ideal.Quotient.mk _ (1 : O n)) = 1 := sorry
-- IntegralTowerTests.dyadic_quotient
example : Nat.card (integralClosure ℤ_[2] (level 2 0) ⧸
    Ideal.span {integralZeta 2 0-1}) = 2 := sorry
end ColemanCyclotomic
end

/-! The algebraic cyclotomic integral closure is a local DVR.
The canonical residue field here is that of the native algebraic local ring.
Comparison with a topological local field and its valuation ring remains separate.
All signatures are unchecked proof plans. -/
noncomputable section
namespace ColemanCyclotomic
open Polynomial
variable (p : ℕ) [Fact p.Prime]
local notation "O" => fun n => integralClosure ℤ_[p] (level p n)
local notation "d" => fun n => p^n*(p-1)
local notation "ϖ" => fun n => integralZeta p n-1

lemma difference_pow_mem_primeIdeal (n : ℕ) :
    (ϖ n)^(d n) ∈ Ideal.span {(p : O n)} := sorry
lemma differenceIdeal_isMaximal (n : ℕ) :
    (Ideal.span {ϖ n}).IsMaximal := sorry
lemma maximal_ideal_eq_differenceIdeal (n : ℕ) (M : Ideal (O n)) [M.IsMaximal] :
    M = Ideal.span {ϖ n} := sorry
instance integers_local (n : ℕ) : IsLocalRing (O n) := sorry
lemma integers_maximalIdeal (n : ℕ) :
    IsLocalRing.maximalIdeal (O n) = Ideal.span {ϖ n} := sorry
instance integers_finite (n : ℕ) : Module.Finite ℤ_[p] (O n) := sorry
instance integers_noetherian (n : ℕ) : IsNoetherianRing (O n) := sorry
instance integers_dvr (n : ℕ) : IsDiscreteValuationRing (O n) := sorry
lemma integral_difference_irreducible (n : ℕ) : Irreducible (ϖ n) := sorry

def residueFieldEquiv (n : ℕ) : IsLocalRing.ResidueField (O n) ≃+* ZMod p := sorry
lemma residueFieldEquiv_residue (n : ℕ) (x : O n) :
    residueFieldEquiv p n (IsLocalRing.residue (O n) x) = reduction p n x := sorry
lemma residueFieldEquiv_scalar (n : ℕ) (a : ℤ_[p]) :
    residueFieldEquiv p n (IsLocalRing.residue (O n) (algebraMap ℤ_[p] (O n) a)) =
      PadicInt.toZMod a := sorry
lemma residueFieldEquiv_unique (n : ℕ) (f : IsLocalRing.ResidueField (O n) →+* ZMod p)
    (hf : f.comp (IsLocalRing.residue (O n)) = reduction p n) :
    f = (residueFieldEquiv p n).toRingHom := sorry
lemma integers_isUnit_iff_reduction_ne_zero (n : ℕ) (x : O n) :
    IsUnit x ↔ reduction p n x ≠ 0 := sorry
lemma isUnit_aeval_difference_iff (n : ℕ) (f : ℤ_[p][X]) :
    IsUnit (Polynomial.aeval (ϖ n) f) ↔ IsUnit (f.coeff 0) := sorry
lemma exists_unit_polynomial_lift (n : ℕ) (u : (O n)ˣ) :
    ∃ f : ℤ_[p][X], f.natDegree < d n ∧
      Polynomial.aeval (ϖ n) f = (u : O n) ∧ IsUnit (f.coeff 0) := sorry
lemma exists_unit_series_polynomial_lift (n : ℕ) (u : (O n)ˣ) :
    ∃ f : ℤ_[p][X], f.natDegree < d n ∧
      Polynomial.aeval (ϖ n) f = (u : O n) ∧ IsUnit (f : PowerSeries ℤ_[p]) := sorry

-- LocalCyclotomicTests.residue_difference
example (n : ℕ) : residueFieldEquiv p n
    (IsLocalRing.residue (O n) (ϖ n)) = 0 := sorry
-- LocalCyclotomicTests.residue_root
example (n : ℕ) : residueFieldEquiv p n
    (IsLocalRing.residue (O n) (integralZeta p n)) = 1 := sorry
-- LocalCyclotomicTests.residue_scalar
example (n : ℕ) (a : ℤ_[p]) : residueFieldEquiv p n
    (IsLocalRing.residue (O n) (algebraMap ℤ_[p] (O n) a)) = PadicInt.toZMod a := sorry
-- LocalCyclotomicTests.dyadic_residue
example : Nat.card (IsLocalRing.ResidueField (integralClosure ℤ_[2] (level 2 0))) = 2 := sorry
-- LocalCyclotomicTests.dyadic_uniformizer
example : Irreducible (-2 : integralClosure ℤ_[2] (level 2 0)) := sorry
-- LocalCyclotomicTests.nonunit_difference
example (n : ℕ) : ¬ IsUnit (ϖ n) := sorry
-- LocalCyclotomicTests.unit_root_polynomial
example (n : ℕ) : IsUnit (Polynomial.aeval (ϖ n) (X+1 : ℤ_[p][X])) := sorry
-- LocalCyclotomicTests.nonunit_constant_prime
example (n : ℕ) : ¬ IsUnit (Polynomial.aeval (ϖ n) (X+C (p : ℤ_[p]))) := sorry
-- LocalCyclotomicTests.ternary_unit_constant
example : IsUnit (Polynomial.aeval (integralZeta 3 0-1) (X+2 : ℤ_[3][X])) := sorry
-- LocalCyclotomicTests.dyadic_linear_zero
example : Polynomial.aeval (integralZeta 2 0-1) (X+2 : ℤ_[2][X]) = 0 := sorry
-- LocalCyclotomicTests.dyadic_constant_lift
example (u : (integralClosure ℤ_[2] (level 2 0))ˣ) :
    ∃ a : ℤ_[2], algebraMap ℤ_[2] (integralClosure ℤ_[2] (level 2 0)) a = u ∧ IsUnit a := sorry
end ColemanCyclotomic
end

/-! The inherited spectral norm and finite-level evaluation on the actual
cyclotomic integral closure. General local-field valuation comparisons remain
separate. Every new mathematical declaration is an unchecked suggested form. -/
noncomputable section
namespace ColemanCyclotomic
open scoped BigOperators PowerSeries.WithPiTopology
variable (p : ℕ) [Fact p.Prime]
local notation "O" => fun n => integralClosure ℤ_[p] (level p n)
local notation "d" => fun n => p^n*(p-1)
local notation "ϖ" => fun n => integralZeta p n-1

lemma integers_scalar_norm (n : ℕ) (a : ℤ_[p]) :
    ‖algebraMap ℤ_[p] (O n) a‖ = ‖a‖ := sorry
lemma integers_norm_le_one (n : ℕ) (x : O n) : ‖x‖ ≤ 1 := sorry
instance integers_compact (n : ℕ) : CompactSpace (O n) := sorry
lemma integers_unit_norm (n : ℕ) (u : (O n)ˣ) : ‖(u : O n)‖ = 1 := sorry
lemma difference_pow_eq_prime_mul_unit (n : ℕ) :
    ∃ u : (O n)ˣ, (ϖ n)^(d n) = (p : O n)*(u : O n) := sorry
lemma difference_norm_pow (n : ℕ) : ‖ϖ n‖^(d n) = (p : ℝ)⁻¹ := sorry
lemma difference_norm_lt_one (n : ℕ) : ‖ϖ n‖ < 1 := sorry
instance integers_linearTopology (n : ℕ) : IsLinearTopology (O n) (O n) := sorry

def seriesEvaluation (n : ℕ) : PowerSeries ℤ_[p] →+* O n := sorry
lemma seriesEvaluation_eq_eval₂ (n : ℕ) :
    ⇑(seriesEvaluation p n) = PowerSeries.eval₂ (algebraMap ℤ_[p] (O n)) (ϖ n) := sorry
lemma seriesEvaluation_C (n : ℕ) (a : ℤ_[p]) :
    seriesEvaluation p n (PowerSeries.C a) = algebraMap ℤ_[p] (O n) a := sorry
lemma seriesEvaluation_X (n : ℕ) :
    seriesEvaluation p n PowerSeries.X = ϖ n := sorry
lemma seriesEvaluation_polynomial (n : ℕ) (f : Polynomial ℤ_[p]) :
    seriesEvaluation p n (f : PowerSeries ℤ_[p]) = Polynomial.aeval (ϖ n) f := sorry
lemma continuous_seriesEvaluation (n : ℕ) : Continuous (seriesEvaluation p n) := sorry
lemma hasSum_seriesEvaluation (n : ℕ) (F : PowerSeries ℤ_[p]) :
    HasSum (fun k : ℕ => algebraMap ℤ_[p] (O n) (PowerSeries.coeff k F)*(ϖ n)^k)
      (seriesEvaluation p n F) := sorry
lemma seriesEvaluation_unique (n : ℕ) (ε : PowerSeries ℤ_[p] →+* O n)
    (hc : Continuous ε)
    (hf : ∀ f : Polynomial ℤ_[p], ε (f : PowerSeries ℤ_[p]) = Polynomial.aeval (ϖ n) f) :
    ε = seriesEvaluation p n := sorry
lemma isUnit_seriesEvaluation (n : ℕ) (F : PowerSeries ℤ_[p]) (hF : IsUnit F) :
    IsUnit (seriesEvaluation p n F) := sorry

theorem exists_unit_series_evaluation_lift (n : ℕ) (u : (O n)ˣ) :
    ∃ f : Polynomial ℤ_[p], f.natDegree < d n ∧
      IsUnit (f : PowerSeries ℤ_[p]) ∧ seriesEvaluation p n (f : PowerSeries ℤ_[p]) = (u : O n) := sorry

-- CyclotomicTopologyTests.dyadic_difference_norm
example : ‖integralZeta 2 0-1‖ = (1/2 : ℝ) := sorry
-- CyclotomicTopologyTests.ternary_difference_norm_square
example : ‖integralZeta 3 0-1‖^2 = (1/3 : ℝ) := sorry
-- CyclotomicTopologyTests.root_norm
example (n : ℕ) : ‖integralZeta p n‖ = 1 := sorry
-- CyclotomicTopologyTests.eval_root
example (n : ℕ) : seriesEvaluation p n (PowerSeries.X+1) = integralZeta p n := sorry
-- CyclotomicTopologyTests.eval_dyadic_zero
example : seriesEvaluation 2 0 (PowerSeries.X+2) = 0 := sorry
-- CyclotomicTopologyTests.eval_prime_nonunit
example (n : ℕ) : ¬ IsUnit (seriesEvaluation p n (PowerSeries.C (p : ℤ_[p]))) := sorry
-- CyclotomicTopologyTests.eval_geometric
example (n : ℕ) :
    seriesEvaluation p n (PowerSeries.mk (fun _ => (1 : ℤ_[p])))*(2-integralZeta p n) = 1 := sorry
-- CyclotomicTopologyTests.dyadic_constant_evaluation_lift
example (u : (integralClosure ℤ_[2] (level 2 0))ˣ) :
    ∃ a : ℤ_[2], IsUnit a ∧ seriesEvaluation 2 0 (PowerSeries.C a) = u := sorry
end ColemanCyclotomic
end

/-! Cyclotomic comparison with the native norm valuation.
All results concern the existing spectral norm and integral closure. The owner’s
normalized local-field valuation and ramification interface remain separate. -/
noncomputable section
namespace ColemanCyclotomic
open scoped Topology
variable (p : ℕ) [Fact p.Prime]
local notation "O" => fun n => integralClosure ℤ_[p] (level p n)
local notation "ϖ" => fun n => integralZeta p n-1
local notation "m" => fun n => IsLocalRing.maximalIdeal (O n)
local notation "v" => fun n => NormedField.valuation (K := level p n)

lemma norm_unit_mul_zpow (n : ℕ) (u : (O n)ˣ) (k : ℤ) :
    ‖algebraMap (O n) (level p n) (u : O n) *
      (zeta p n-1)^k‖ = ‖ϖ n‖^k := sorry

theorem norm_value_group (n : ℕ) (x : level p n) (hx : x ≠ 0) :
    ∃! k : ℤ, ‖x‖ = ‖ϖ n‖^k := sorry

theorem isIntegral_iff_norm_le_one (n : ℕ) (x : level p n) :
    IsIntegral ℤ_[p] x ↔ ‖x‖ ≤ 1 := sorry

theorem integers_norm_valuation (n : ℕ) : (v n).Integers (O n) := sorry

theorem integralClosure_eq_norm_integer (n : ℕ) :
    (O n).toSubring = (v n).integer := sorry

lemma integers_isUnit_iff_norm_eq_one (n : ℕ) (x : O n) :
    IsUnit x ↔ ‖x‖ = 1 := sorry

lemma mem_maximalIdeal_iff_norm_lt_one (n : ℕ) (x : O n) :
    x ∈ m n ↔ ‖x‖ < 1 := sorry

lemma reduction_eq_zero_iff_norm_lt_one (n : ℕ) (x : O n) :
    reduction p n x = 0 ↔ ‖x‖ < 1 := sorry

lemma mem_maximalIdeal_pow_iff_norm_le (n r : ℕ) (x : O n) :
    x ∈ (m n)^r ↔ ‖x‖ ≤ ‖ϖ n‖^r := sorry

lemma primeIdeal_eq_maximalIdeal_pow (n : ℕ) :
    Ideal.span {(p : O n)} = (m n)^(p^n*(p-1)) := sorry

theorem maximalIdeal_pow_nhds_basis (n : ℕ) :
    (𝓝 (0 : O n)).HasBasis (fun _ : ℕ => True)
      (fun r => (↑((m n)^r : Ideal (O n)) : Set (O n))) := sorry

-- CyclotomicValuationTests.zero_integral
example (n : ℕ) : IsIntegral ℤ_[p] (0 : level p n) := sorry
-- CyclotomicValuationTests.inverse_difference_nonintegral
example (n : ℕ) : ¬ IsIntegral ℤ_[p] ((zeta p n-1)⁻¹) := sorry
-- CyclotomicValuationTests.dyadic_signed_norm
example (k : ℤ) : ‖(zeta 2 0-1)^k‖ = (1/2 : ℝ)^k := sorry
-- CyclotomicValuationTests.native_valuation_root
example (n : ℕ) : zeta p n ∈ (v n).integer := sorry
-- CyclotomicValuationTests.ternary_inverse_prime
example : ¬ IsIntegral ℤ_[3] ((3 : level 3 0)⁻¹) := sorry
-- CyclotomicValuationTests.residue_difference
example (n : ℕ) (x y : O n) :
    reduction p n x = reduction p n y ↔ ‖x-y‖ < 1 := sorry
-- CyclotomicValuationTests.power_zero
example (n : ℕ) (x : O n) : x ∈ (m n)^0 := sorry
-- CyclotomicValuationTests.uniformizer_boundary
example (n r : ℕ) : (ϖ n)^r ∈ (m n)^r ∧ (ϖ n)^r ∉ (m n)^(r+1) := sorry
-- CyclotomicValuationTests.dyadic_primeIdeal
example : Ideal.span {(2 : integralClosure ℤ_[2] (level 2 0))} =
    IsLocalRing.maximalIdeal (integralClosure ℤ_[2] (level 2 0)) := sorry
-- CyclotomicValuationTests.ternary_primeIdeal
example : Ideal.span {(3 : integralClosure ℤ_[3] (level 3 0))} =
    (IsLocalRing.maximalIdeal (integralClosure ℤ_[3] (level 3 0)))^2 := sorry
end ColemanCyclotomic
end

/-! Actual continuous norm transitions and the arithmetic evaluation square.
All carriers are the existing cyclotomic fields, integral closures and units. -/
noncomputable section
namespace ColemanCyclotomic
open scoped BigOperators PowerSeries.WithPiTopology
open TauCetiRoadmap.Campaign.ColemanPowerSeries
variable (p : ℕ) [Fact p.Prime]
local notation "K" => fun n => level p n
local notation "O" => fun n => integralClosure ℤ_[p] (K n)
local notation "B" => PowerSeries ℤ_[p]
local notation "Y" => (1+PowerSeries.X : B)
local notation "ϖ" => fun n => integralZeta p n-1
set_option quotPrecheck false in
local notation "Phi" => (PowerSeries.substAlgHom
  (PowerSeries.HasSubst.of_constantCoeff_zero' (by simp : PowerSeries.constantCoeff (Y^p-1)=0))).toRingHom
local notation "PhiAlg" => phiScalarAlgebra p
set_option quotPrecheck false in
local notation "PhiMod" => @Algebra.toModule B B _ _ PhiAlg
set_option quotPrecheck false in
local notation "coords" => (@Module.Basis.repr (Fin p) B B _ _ PhiMod (phiBasis p)).toEquiv
set_option quotPrecheck false in
local notation "mulMatrix" => (@AlgHom.toRingHom B B (Matrix (Fin p) (Fin p) B) _ _ _ PhiAlg _
  (@Algebra.leftMulMatrix B B _ _ PhiAlg (Fin p) _ _ (phiBasis p)))

lemma continuous_relative_coordinate (n : ℕ) (i : Fin (relativeBasis p n).dim) :
    Continuous (fun x : K (n+1) => (relativeBasis p n).basis.repr x i) := sorry
lemma continuous_relative_norm (n : ℕ) :
    Continuous (Algebra.norm (K n) : K (n+1) → K n) := sorry

def integralNorm (n : ℕ) : O (n+1) →* O n := sorry
lemma integralNorm_zero (n : ℕ) : integralNorm p n 0 = 0 := sorry
lemma integralNorm_scalar (n : ℕ) (a : ℤ_[p]) :
    integralNorm p n (algebraMap ℤ_[p] (O (n+1)) a) = algebraMap ℤ_[p] (O n) (a^p) := sorry
lemma integralNorm_difference (n : ℕ) :
    integralNorm p n (ϖ (n+1)) = (-1 : O n)^(p+1)*(ϖ n) := sorry
lemma integralNorm_field (n : ℕ) (x : O (n+1)) :
    algebraMap (O n) (K n) (integralNorm p n x) =
      Algebra.norm (K n) (algebraMap (O (n+1)) (K (n+1)) x) := sorry
lemma continuous_integralNorm (n : ℕ) : Continuous (integralNorm p n) := sorry

def unitsNorm (n : ℕ) : ContinuousMonoidHom (O (n+1))ˣ (O n)ˣ := sorry
lemma unitsNorm_coe (n : ℕ) (u : (O (n+1))ˣ) :
    (unitsNorm p n u : O n) = integralNorm p n (u : O (n+1)) := sorry
lemma unitsNorm_inv (n : ℕ) (u : (O (n+1))ˣ) :
    unitsNorm p n u⁻¹ = (unitsNorm p n u)⁻¹ := sorry
lemma unitsNorm_scalar (n : ℕ) (a : ℤ_[p]ˣ) :
    unitsNorm p n (Units.map (algebraMap ℤ_[p] (O (n+1))).toMonoidHom a) =
      Units.map (algebraMap ℤ_[p] (O n)).toMonoidHom (a^p) := sorry

lemma seriesEvaluation_phi_field (n : ℕ) (F : B) :
    algebraMap (O (n+1)) (K (n+1)) (seriesEvaluation p (n+1) (Phi F)) =
      algebraMap (K n) (K (n+1)) (algebraMap (O n) (K n) (seriesEvaluation p n F)) := sorry
lemma seriesEvaluation_phiBasis_coordinates (n : ℕ) (F : B) (i : Fin p) :
    let b := (relativeBasis p n).basis.reindex (finCongr (relativeBasis_dim p n))
    b.repr (algebraMap (O (n+1)) (K (n+1)) (seriesEvaluation p (n+1) F)) i =
      algebraMap (O n) (K n) (seriesEvaluation p n (coords F i)) := sorry
lemma seriesEvaluation_mulMatrix (n : ℕ) (F : B) :
    let b := (relativeBasis p n).basis.reindex (finCongr (relativeBasis_dim p n))
    Algebra.leftMulMatrix b (algebraMap (O (n+1)) (K (n+1)) (seriesEvaluation p (n+1) F)) =
      (mulMatrix F).map ((algebraMap (O n) (K n)).comp (seriesEvaluation p n)) := sorry

theorem integralNorm_seriesEvaluation (n : ℕ) (F : B) :
    integralNorm p n (seriesEvaluation p (n+1) F) =
      seriesEvaluation p n (colemanNorm p F) := sorry
lemma unitsNorm_seriesEvaluation (n : ℕ) (F : Bˣ) :
    unitsNorm p n (Units.map (seriesEvaluation p (n+1)).toMonoidHom F) =
      Units.map (seriesEvaluation p n).toMonoidHom (Units.map (colemanNorm p) F) := sorry
lemma reduction_seriesEvaluation (n : ℕ) (F : B) :
    reduction p n (seriesEvaluation p n F) = PadicInt.toZMod (PowerSeries.constantCoeff F) := sorry
lemma reduction_unitsNorm (n : ℕ) (u : (O (n+1))ˣ) :
    reduction p n (unitsNorm p n u : O n) = reduction p (n+1) (u : O (n+1)) := sorry
lemma normFixedUnits_evaluation_compatible (n : ℕ) (F : normFixedUnits p) :
    unitsNorm p n (Units.map (seriesEvaluation p (n+1)).toMonoidHom (F : Bˣ)) =
      Units.map (seriesEvaluation p n).toMonoidHom (F : Bˣ) := sorry

-- RelativeNormTests.integral_zero
example (n : ℕ) : integralNorm p n 0 = 0 := sorry
-- RelativeNormTests.integral_prime
example (n : ℕ) : integralNorm p n (p : O (n+1)) = (p : O n)^p := sorry
-- RelativeNormTests.dyadic_difference
example : integralNorm 2 0 (integralZeta 2 1-1) = 2 := sorry
-- RelativeNormTests.unit_identity
example (n : ℕ) : unitsNorm p n 1 = 1 := sorry
-- RelativeNormTests.unit_minus_one
example (n : ℕ) : unitsNorm p n (-1) = (-1 : (O n)ˣ)^p := sorry
-- RelativeNormTests.unit_root
example (n : ℕ) (u : (O (n+1))ˣ) (hu : (u : O (n+1)) = integralZeta p (n+1)) :
    (unitsNorm p n u : O n) = (-1 : O n)^(p+1)*integralZeta p n := sorry
-- RelativeNormTests.evaluate_constant
example (n : ℕ) (a : ℤ_[p]) :
    integralNorm p n (seriesEvaluation p (n+1) (PowerSeries.C a)) =
      algebraMap ℤ_[p] (O n) (a^p) := sorry
-- RelativeNormTests.dyadic_variable
example : integralNorm 2 0 (seriesEvaluation 2 1 PowerSeries.X) =
    -seriesEvaluation 2 0 PowerSeries.X := sorry
-- RelativeNormTests.principal_unit
example (n : ℕ) (u : (O (n+1))ˣ) (hu : reduction p (n+1) (u : O (n+1)) = 1) :
    reduction p n (unitsNorm p n u : O n) = 1 := sorry
end ColemanCyclotomic
end

/-! Actual compatible unit towers with their native product/subtype topology. -/
noncomputable section
namespace ColemanCyclotomic
open scoped PowerSeries.WithPiTopology
open TauCetiRoadmap.Campaign.ColemanPowerSeries
variable (p : ℕ) [Fact p.Prime]
local notation "O" => fun n => integralClosure ℤ_[p] (level p n)
local notation "B" => PowerSeries ℤ_[p]
set_option quotPrecheck false in
local notation "V" => ((n : ℕ) → (O n)ˣ)

lemma continuous_reduction (n : ℕ) : Continuous (reduction p n) := sorry

def normCompatibleUnits : Subgroup V := sorry
lemma mem_normCompatibleUnits (u : V) :
    u ∈ normCompatibleUnits p ↔ ∀ n, unitsNorm p n (u (n+1)) = u n := sorry
lemma normCompatibleUnits_ext (u v : normCompatibleUnits p) (h : ∀ n, u.val n = v.val n) :
    u = v := sorry
lemma continuous_normCompatibleUnits_eval (n : ℕ) :
    Continuous (fun u : normCompatibleUnits p => u.val n) := sorry
lemma normCompatibleUnits_lift_unique {H : Type*} [TopologicalSpace H] [Monoid H]
    (f : ContinuousMonoidHom H V) (hf : ∀ h n, unitsNorm p n (f h (n+1)) = f h n) :
    ∃! L : ContinuousMonoidHom H (normCompatibleUnits p), ∀ h n, (L h).val n = f h n := sorry
lemma isClosed_normCompatibleUnits : IsClosed (normCompatibleUnits p : Set V) := sorry
instance compact_normCompatibleUnits : CompactSpace (normCompatibleUnits p) := sorry
lemma normCompatibleUnits_residue_constant (u : normCompatibleUnits p) (n : ℕ) :
    reduction p n (u.val n : O n) = reduction p 0 (u.val 0 : O 0) := sorry

def normLimitResidue : ContinuousMonoidHom (normCompatibleUnits p) (ZMod p)ˣ := sorry
lemma normLimitResidue_eq (u : normCompatibleUnits p) (n : ℕ) :
    normLimitResidue p u = Units.map (reduction p n).toMonoidHom (u.val n) := sorry
lemma normLimitResidue_coe (u : normCompatibleUnits p) :
    (normLimitResidue p u : ZMod p) = reduction p 0 (u.val 0 : O 0) := sorry
lemma normLimitResidue_inv (u : normCompatibleUnits p) :
    normLimitResidue p u⁻¹ = (normLimitResidue p u)⁻¹ := sorry

def principalNormCompatibleUnits : Subgroup (normCompatibleUnits p) := sorry
lemma mem_principalNormCompatibleUnits (u : normCompatibleUnits p) :
    u ∈ principalNormCompatibleUnits p ↔ ∀ n, reduction p n (u.val n : O n) = 1 := sorry
lemma principalNormCompatibleUnits_ext (u v : principalNormCompatibleUnits p)
    (h : ∀ n, u.val.val n = v.val.val n) : u = v := sorry
lemma principalNormCompatibleUnits_coe_mul (u v : principalNormCompatibleUnits p) (n : ℕ) :
    (u*v).val.val n = u.val.val n*v.val.val n := sorry
instance compact_principalNormCompatibleUnits : CompactSpace (principalNormCompatibleUnits p) := sorry

def normFixedEvaluation : ContinuousMonoidHom (normFixedUnits p) (normCompatibleUnits p) := sorry
lemma normFixedEvaluation_apply (F : normFixedUnits p) (n : ℕ) :
    (normFixedEvaluation p F).val n = Units.map (seriesEvaluation p n).toMonoidHom (F : Bˣ) := sorry
lemma normFixedEvaluation_mul (F G : normFixedUnits p) :
    normFixedEvaluation p (F*G) = normFixedEvaluation p F*normFixedEvaluation p G := sorry
lemma normFixedEvaluation_inv (F : normFixedUnits p) :
    normFixedEvaluation p F⁻¹ = (normFixedEvaluation p F)⁻¹ := sorry
lemma normFixedEvaluation_residue (F : normFixedUnits p) :
    (normLimitResidue p (normFixedEvaluation p F) : ZMod p) =
      PadicInt.toZMod (PowerSeries.constantCoeff (F : Bˣ).val) := sorry
lemma normFixedEvaluation_principal_iff (F : normFixedUnits p) :
    normFixedEvaluation p F ∈ principalNormCompatibleUnits p ↔
      PadicInt.toZMod (PowerSeries.constantCoeff (F : Bˣ).val) = 1 := sorry
theorem isClosed_range_normFixedEvaluation : IsClosed (Set.range (normFixedEvaluation p)) := sorry

-- NormLimitTests.identity_family
example : (fun n => (1 : (O n)ˣ)) ∈ normCompatibleUnits p := sorry
-- NormLimitTests.inverse_family
example (u : V) (hu : ∀ n, unitsNorm p n (u (n+1)) = u n) :
    (fun n => (u n)⁻¹) ∈ normCompatibleUnits p := sorry
-- NormLimitTests.dyadic_minus_one_incompatible
example : (fun n => (-1 : (integralClosure ℤ_[2] (level 2 n))ˣ)) ∉ normCompatibleUnits 2 := sorry
-- NormLimitTests.residue_identity
example : normLimitResidue p 1 = 1 := sorry
-- NormLimitTests.residue_inverse
example (u : normCompatibleUnits p) : normLimitResidue p (u*u⁻¹) = 1 := sorry
-- NormLimitTests.dyadic_residue
example (u : normCompatibleUnits 2) : normLimitResidue 2 u = 1 := sorry
-- NormLimitTests.principal_identity
example : (1 : normCompatibleUnits p) ∈ principalNormCompatibleUnits p := sorry
-- NormLimitTests.principal_product
example (u v : principalNormCompatibleUnits p) (n : ℕ) :
    reduction p n ((u*v).val.val n : O n) = 1 := sorry
-- NormLimitTests.dyadic_principal_all
example : principalNormCompatibleUnits 2 = ⊤ := sorry
-- NormLimitTests.evaluation_identity
example (n : ℕ) : (normFixedEvaluation p 1).val n = 1 := sorry
-- NormLimitTests.evaluation_inverse
example (F : normFixedUnits p) (n : ℕ) :
    (normFixedEvaluation p F⁻¹).val n = ((normFixedEvaluation p F).val n)⁻¹ := sorry
-- NormLimitTests.ternary_constant_evaluation
example (F : normFixedUnits 3) (hF : (F : (PowerSeries ℤ_[3])ˣ) = -1) (n : ℕ) :
    (normFixedEvaluation 3 F).val n = -1 := sorry
end ColemanCyclotomic
end

/-! Arithmetic interpolation and the actual Coleman composite.
The new signatures below have not been elaborated in this run: the available
shared build lacks a prebuilt native import. All proofs and constructors remain
placeholders. No module structure on the full unit tower is asserted. -/
noncomputable section
namespace ColemanCyclotomic
open scoped AbstractMeasure PowerSeries.WithPiTopology
open TauCetiRoadmap.Campaign.ColemanPowerSeries AbstractMeasure
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]
local notation "B" => PowerSeries Z
local notation "O" => fun n => integralClosure Z (level p n)
local notation "U" => normCompatibleUnits p
local notation "M" => D(Zˣ, Z)
local instance : TopologicalSpace M := AbstractMeasure.WeakTopology
local notation "A" => unitsMeasureAmiceEquiv p

lemma polynomial_evaluation_ne_zero (n : ℕ) (P : Polynomial Z)
    (hP : P ≠ 0) (hdeg : P.natDegree < p^n*(p-1)) :
    aeval (integralZeta p n-1) P ≠ 0 := sorry
lemma seriesEvaluation_eventually_ne_zero (F : B) (hF : F ≠ 0) :
    ∃ N, ∀ n ≥ N, seriesEvaluation p n F ≠ 0 := sorry
theorem seriesEvaluation_ext (F G : B)
    (h : ∀ n, seriesEvaluation p n F = seriesEvaluation p n G) : F = G := sorry
theorem normFixedEvaluation_injective : Function.Injective (normFixedEvaluation p) := sorry
lemma seriesEvaluation_norm_sub_le (n r : ℕ) (F G : B)
    (h : (p : B)^r ∣ F-G) :
    ‖seriesEvaluation p n F-seriesEvaluation p n G‖ ≤ (p : ℝ)^(-(r : ℤ)) := sorry
lemma iterate_norm_evaluation (u : U) (m n : ℕ) (h : n ≤ m) (f : Bˣ)
    (hf : Units.map (seriesEvaluation p m).toMonoidHom f = u.val m) :
    Units.map (seriesEvaluation p n).toMonoidHom
      ((Units.map (colemanNorm p))^[m-n] f) = u.val n := sorry
lemma exists_normFixed_approximation (u : U) (k : ℕ) :
    ∃ F : normFixedUnits p, ∀ n ≤ k,
      ‖seriesEvaluation p n (F : Bˣ).val-(u.val n : O n)‖ ≤
        (p : ℝ)^(-((k+1 : ℕ) : ℤ)) := sorry
lemma interpolation_fibers (u : U) :
    let S := fun k : ℕ => {F : normFixedUnits p | ∀ n ≤ k,
      ‖seriesEvaluation p n (F : Bˣ).val-(u.val n : O n)‖ ≤
        (p : ℝ)^(-((k+1 : ℕ) : ℤ))}
    (∀ k, (S k).Nonempty ∧ IsClosed (S k) ∧ IsCompact (S k)) ∧ Antitone S := sorry
theorem normFixedEvaluation_surjective : Function.Surjective (normFixedEvaluation p) := sorry

def colemanEquiv : U ≃* normFixedUnits p := sorry
lemma colemanEquiv_evaluation (u : U) (n : ℕ) :
    Units.map (seriesEvaluation p n).toMonoidHom (colemanEquiv p u : Bˣ) = u.val n := sorry
lemma colemanEquiv_inverse (u : U) : normFixedEvaluation p (colemanEquiv p u) = u := sorry
lemma colemanEquiv_unique (f : U → normFixedUnits p)
    (hf : ∀ u n, Units.map (seriesEvaluation p n).toMonoidHom (f u : Bˣ) = u.val n) :
    f = colemanEquiv p := sorry
lemma colemanEquiv_mul (u v : U) : colemanEquiv p (u*v) = colemanEquiv p u*colemanEquiv p v := sorry
theorem continuous_colemanEquiv : Continuous (colemanEquiv p) ∧
    Continuous (colemanEquiv p).symm := sorry
-- ColemanInterpolationTests.identity
example : colemanEquiv p 1 = 1 := sorry
-- ColemanInterpolationTests.product
example (u v : U) (n : ℕ) :
    Units.map (seriesEvaluation p n).toMonoidHom (colemanEquiv p (u*v) : Bˣ) =
      u.val n*v.val n := sorry
-- ColemanInterpolationTests.constant_minus_one_three
example (F : normFixedUnits 3) (hF : (F : (PowerSeries ℤ_[3])ˣ) = -1) :
    (colemanEquiv 3 (normFixedEvaluation 3 F) : (PowerSeries ℤ_[3])ˣ) = -1 := sorry

lemma relative_power_minpoly (n a : ℕ) (ha : ¬ p ∣ a) :
    minpoly (level p n) (zeta p (n+1)^a) = Polynomial.X^p-Polynomial.C (zeta p n^a) := sorry
lemma norm_power_difference (n a : ℕ) (ha : ¬ p ∣ a) :
    Algebra.norm (level p n) (zeta p (n+1)^a-1) =
      (-1 : level p n)^(p+1)*(zeta p n^a-1) := sorry
lemma unitsNorm_cyclotomicSeriesUnit (n a : ℕ) (ha : IsUnit (a : Z)) :
    unitsNorm p n (Units.map (seriesEvaluation p (n+1)).toMonoidHom (cyclotomicSeriesUnit a ha)) =
      Units.map (seriesEvaluation p n).toMonoidHom (cyclotomicSeriesUnit a ha) := sorry
lemma cyclotomicSeriesUnit_normFixed (a : ℕ) (ha : IsUnit (a : Z)) :
    cyclotomicSeriesUnit a ha ∈ normFixedUnits p := sorry

def cyclotomicTower (a : ℕ) (ha : IsUnit (a : Z)) : U := sorry
lemma cyclotomicTower_apply (a : ℕ) (ha : IsUnit (a : Z)) (n : ℕ) :
    algebraMap (O n) (level p n) ((cyclotomicTower p a ha).val n : O n) =
      (zeta p n^a-1)/(zeta p n-1) := sorry
lemma colemanEquiv_cyclotomicTower (a : ℕ) (ha : IsUnit (a : Z)) :
    (colemanEquiv p (cyclotomicTower p a ha) : Bˣ) = cyclotomicSeriesUnit a ha := sorry
lemma cyclotomicTower_one (ha : IsUnit (1 : Z)) : cyclotomicTower p 1 ha = 1 := sorry
-- CyclotomicTowerTests.one
example (ha : IsUnit (1 : Z)) : cyclotomicTower p 1 ha = 1 := sorry
-- CyclotomicTowerTests.ternary_two
example (ha : IsUnit (2 : ℤ_[3])) :
    algebraMap (integralClosure ℤ_[3] (level 3 0)) (level 3 0)
      ((cyclotomicTower 3 2 ha).val 0 : integralClosure ℤ_[3] (level 3 0)) = 1+zeta 3 0 := sorry
-- CyclotomicTowerTests.ternary_three_excluded
example : seriesEvaluation 3 0 (3+3*PowerSeries.X+(PowerSeries.X : PowerSeries ℤ_[3])^2) = 0 ∧
    ¬ IsUnit (3 : ℤ_[3]) := sorry

/-- The actual multiplicative homomorphism to the additive measure group. -/
def rawColeman : U →* Multiplicative M := sorry
lemma rawColeman_amice (u : U) :
    (A (Multiplicative.toAdd (rawColeman p u))).val =
      inverseMahler p (logDeriv (colemanEquiv p u : Bˣ)-
        PowerSeries.subst ((1+PowerSeries.X : B)^p-1) (logDeriv (colemanEquiv p u : Bˣ))) := sorry
lemma rawColeman_mul (u v : U) :
    Multiplicative.toAdd (rawColeman p (u*v)) =
      Multiplicative.toAdd (rawColeman p u)+Multiplicative.toAdd (rawColeman p v) := sorry
lemma rawColeman_inv (u : U) :
    Multiplicative.toAdd (rawColeman p u⁻¹) = -Multiplicative.toAdd (rawColeman p u) := sorry
lemma rawColeman_ext (u v : U)
    (h : A (Multiplicative.toAdd (rawColeman p u)) = A (Multiplicative.toAdd (rawColeman p v))) :
    rawColeman p u = rawColeman p v := sorry
lemma continuous_rawColeman : Continuous (rawColeman p) := sorry

def colemanMap : U →* Multiplicative M := sorry
lemma colemanMap_eq_neg_raw (u : U) :
    Multiplicative.toAdd (colemanMap p u) = -Multiplicative.toAdd (rawColeman p u) := sorry
lemma colemanMap_mul (u v : U) :
    Multiplicative.toAdd (colemanMap p (u*v)) =
      Multiplicative.toAdd (colemanMap p u)+Multiplicative.toAdd (colemanMap p v) := sorry
lemma colemanMap_kernel (u : U) : colemanMap p u = 1 ↔ rawColeman p u = 1 := sorry
theorem rawColeman_cyclotomicTower (a : ℕ) (ha : IsUnit (a : Z))
    (aUnit : Zˣ) (hval : (aUnit : Z) = a) :
    Multiplicative.toAdd (rawColeman p (cyclotomicTower p a ha)) =
      -DirichletPadic.padicIntrinsicNumerator p aUnit ∧
    Multiplicative.toAdd (colemanMap p (cyclotomicTower p a ha)) =
      DirichletPadic.padicIntrinsicNumerator p aUnit := sorry
-- ColemanMapTests.raw_identity
example : Multiplicative.toAdd (rawColeman p 1) = 0 := sorry
-- ColemanMapTests.raw_inverse
example (u : U) : Multiplicative.toAdd (rawColeman p u)+
    Multiplicative.toAdd (rawColeman p u⁻¹) = 0 := sorry
-- ColemanMapTests.raw_constant_three
example (F : normFixedUnits 3) (hF : (F : (PowerSeries ℤ_[3])ˣ) = -1) :
    Multiplicative.toAdd (rawColeman 3 (normFixedEvaluation 3 F)) = 0 := sorry
-- ColemanMapTests.normalized_identity
example : Multiplicative.toAdd (colemanMap p 1) = 0 := sorry
-- ColemanMapTests.normalized_inverse
example (u : U) : Multiplicative.toAdd (colemanMap p u⁻¹) =
    -Multiplicative.toAdd (colemanMap p u) := sorry
-- ColemanMapTests.sign_relation
example (u : U) : Multiplicative.toAdd (colemanMap p u)+
    Multiplicative.toAdd (rawColeman p u) = 0 := sorry

/-- Oddness is retained as an explicit parameter of the arithmetic binomial inclusion. -/
def binomialNormFixed (hp : Odd p) : Multiplicative Z →* normFixedUnits p := sorry
lemma binomialNormFixed_val (hp : Odd p) (a : Z) :
    (binomialNormFixed p hp (Multiplicative.ofAdd a) : Bˣ).val = PowerSeries.binomialSeries Z a := sorry
lemma binomialNormFixed_add (hp : Odd p) (a b : Z) :
    binomialNormFixed p hp (Multiplicative.ofAdd (a+b)) =
      binomialNormFixed p hp (Multiplicative.ofAdd a)*binomialNormFixed p hp (Multiplicative.ofAdd b) := sorry
lemma binomialNormFixed_continuous (hp : Odd p) : Continuous (binomialNormFixed p hp) := sorry
lemma logDeriv_binomialNormFixed (hp : Odd p) (a : Z) :
    logDeriv (binomialNormFixed p hp (Multiplicative.ofAdd a) : Bˣ) = PowerSeries.C a := sorry

def tateTower (hp : Odd p) : Multiplicative Z →* U := sorry
lemma tateTower_apply (hp : Odd p) (a : Z) (n : ℕ) :
    algebraMap (O n) (level p n) ((tateTower p hp (Multiplicative.ofAdd a)).val n : O n) =
      zeta p n^((PadicInt.toZModPow (n+1) a).val) := sorry
lemma tateTower_injective (hp : Odd p) : Function.Injective (tateTower p hp) := sorry
lemma tateTower_principal (hp : Odd p) (a : Z) :
    tateTower p hp (Multiplicative.ofAdd a) ∈ principalNormCompatibleUnits p := sorry
lemma tateTower_continuous (hp : Odd p) : Continuous (tateTower p hp) := sorry
-- TateTests.zero_series
example (hp : Odd p) : binomialNormFixed p hp (Multiplicative.ofAdd 0) = 1 := sorry
-- TateTests.one_series_three
example : (binomialNormFixed 3 (by decide) (Multiplicative.ofAdd 1) :
    (PowerSeries ℤ_[3])ˣ).val = 1+PowerSeries.X := sorry
-- TateTests.dyadic_unsigned_excluded
example (u : (PowerSeries ℤ_[2])ˣ) (hu : u.val = 1+PowerSeries.X) :
    u ∉ normFixedUnits 2 := sorry
-- TateTests.zero_tower
example (hp : Odd p) : tateTower p hp (Multiplicative.ofAdd 0) = 1 := sorry
-- TateTests.one_tower
example (hp : Odd p) (n : ℕ) :
    algebraMap (O n) (level p n) ((tateTower p hp (Multiplicative.ofAdd 1)).val n : O n) =
      zeta p n := sorry
-- TateTests.ternary_first_power
example :
    algebraMap (integralClosure ℤ_[3] (level 3 0)) (level 3 0)
      ((tateTower 3 (by decide) (Multiplicative.ofAdd 3)).val 0 :
        integralClosure ℤ_[3] (level 3 0)) = 1 ∧
    algebraMap (integralClosure ℤ_[3] (level 3 1)) (level 3 1)
      ((tateTower 3 (by decide) (Multiplicative.ofAdd 3)).val 1 :
        integralClosure ℤ_[3] (level 3 1)) = algebraMap (level 3 0) (level 3 1) (zeta 3 0) := sorry

theorem normFixedEvaluation_binomialNormFixed (hp : Odd p) (a : Z) :
    normFixedEvaluation p (binomialNormFixed p hp (Multiplicative.ofAdd a)) =
      tateTower p hp (Multiplicative.ofAdd a) := sorry

theorem rawColeman_kernel (hp : Odd p) (u : U) :
    rawColeman p u = 1 ↔ ∃! q : Zˣ×Z, q.1^(p-1)=1 ∧
      (colemanEquiv p u : Bˣ).val = PowerSeries.C (q.1 : Z)*PowerSeries.binomialSeries Z q.2 := sorry

def cyclotomicMoment : M →ₗ[Z] Z := sorry
lemma cyclotomicMoment_apply (μ : M) :
    cyclotomicMoment p μ = μ (⟨Units.val, Units.continuous_val⟩ : C(Zˣ,Z)) := sorry
lemma cyclotomicMoment_amice (μ : M) : cyclotomicMoment p μ = PowerSeries.coeff 1 (A μ).val := sorry
lemma cyclotomicMoment_dirac (a : Zˣ) : cyclotomicMoment p (dirac Z a) = (a : Z) := sorry
lemma cyclotomicMoment_continuous : Continuous (cyclotomicMoment p) := sorry
lemma cyclotomicMoment_surjective : Function.Surjective (cyclotomicMoment p) := sorry
-- MomentTests.one_atom
example : cyclotomicMoment p (dirac Z (1 : Zˣ)) = 1 := sorry
-- MomentTests.minus_one_atom
example : cyclotomicMoment p (dirac Z (-1 : Zˣ)) = -1 := sorry
-- MomentTests.not_mass_three
example : cyclotomicMoment 3 (dirac ℤ_[3] (1 : ℤ_[3]ˣ)-dirac ℤ_[3] (-1 : ℤ_[3]ˣ)) = 2 ∧
    (dirac ℤ_[3] (1 : ℤ_[3]ˣ)-dirac ℤ_[3] (-1 : ℤ_[3]ˣ))
      (ContinuousMap.const ℤ_[3]ˣ (1 : ℤ_[3])) = 0 := sorry

theorem rawColeman_range (hp : Odd p) :
    Set.range (fun u : U => Multiplicative.toAdd (rawColeman p u)) =
      (LinearMap.ker (cyclotomicMoment p) : Set M) := sorry
/-- Exactness of the actual maps and the closed/quotient topology on the middle
and final images. The kernel inclusion is the closed embedding of the actual
constant/binomial product characterized by rawColeman_kernel. Equivariance,
completed-module and tensor comparisons remain continuation work. -/
theorem colemanSequence_topology (hp : Odd p) :
    let torsion := {c : Zˣ // c^(p-1)=1}
    let ι : torsion × Multiplicative Z → U := fun q =>
      (colemanEquiv p).symm ⟨Units.map PowerSeries.C.toMonoidHom q.1.val *
        (binomialNormFixed p hp q.2 : Bˣ), by sorry⟩
    Topology.IsClosedEmbedding ι ∧ Function.Injective ι ∧
    Set.range ι = {u : U | rawColeman p u = 1} ∧
    (∀ u : U, rawColeman p u = 1 ↔ ∃! q : Zˣ×Z, q.1^(p-1)=1 ∧
      (colemanEquiv p u : Bˣ).val = PowerSeries.C (q.1 : Z)*PowerSeries.binomialSeries Z q.2) ∧
    Set.range (fun u : U => Multiplicative.toAdd (rawColeman p u)) =
      (LinearMap.ker (cyclotomicMoment p) : Set M) ∧
    Function.Surjective (cyclotomicMoment p) ∧
    IsClosed (Set.range (fun u : U => Multiplicative.toAdd (rawColeman p u))) ∧
    IsClosed {u : U | rawColeman p u = 1} ∧
    IsQuotientMap (fun u : U =>
      (⟨Multiplicative.toAdd (rawColeman p u), ⟨u,rfl⟩⟩ :
        Set.range (fun v : U => Multiplicative.toAdd (rawColeman p v)))) ∧
    IsQuotientMap (cyclotomicMoment p) := sorry
end ColemanCyclotomic
end
