import Mathlib.Analysis.Normed.Ring.Finite
import Mathlib.NumberTheory.Padics.Complex
import Mathlib.RingTheory.PowerSeries.Evaluation
import Mathlib.RingTheory.MvPowerSeries.LinearTopology
import Mathlib.RingTheory.RootsOfUnity.AlgebraicallyClosed
import Mathlib.Data.Nat.Choose.Dvd
import Mathlib.Analysis.Normed.Ring.Units
import Mathlib.Topology.LocallyConstant.Algebra
import Mathlib.Topology.Homeomorph.Lemmas
import Mathlib.Topology.Piecewise
import Mathlib.Algebra.Algebra.Operations
import Mathlib.Algebra.Group.Units.Hom
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.NumberTheory.Padics.Measure.AmiceTransform
import Mathlib.RingTheory.PowerSeries.Exp

/-!
# Suggested Lean forms: Amice moments and admissible pseudomeasure evaluation

This file is not the roadmap and it is not exhaustive. The roadmap document is definitive.
These signatures suggest names, coefficient hypotheses and tests. All new proofs use `sorry`;
nothing here is claimed formalised. Mathlib 082e2d3 and Tau Ceti f790474 are the baseline.

The algebraic declarations work with an explicit Dirac homomorphism `δ : G →* R` into a
commutative ring and its existing total quotient ring. The completed group algebra, topology,
continuous-character integral, and comparison with its augmentation kernel are separate inputs
of the roadmap. `IsFractionRing` does not assume that `R` is a domain. `Submodule.div`, not
the domain-specific inverse operation on fractional ideals, supplies the carrier.
-/

noncomputable section

open scoped AbstractMeasure PowerSeries

namespace AbstractMeasure

section Weight

variable {X Y R : Type*} [TopologicalSpace X] [CompactSpace X]
  [TopologicalSpace Y] [CompactSpace Y] [NormedCommRing R]

/-- Multiply an existing measure by a continuous test function; no new measure carrier. -/
def weight (g : C(X, R)) : D(X, R) →ₗ[R] D(X, R) := sorry

theorem weight_apply (g : C(X, R)) (μ : D(X, R)) (f : C(X, R)) :
    weight g μ f = μ (g * f) := sorry

theorem weight_one (μ : D(X, R)) : weight 1 μ = μ := sorry
theorem weight_zero (μ : D(X, R)) : weight 0 μ = 0 := sorry
theorem weight_mul (g h : C(X, R)) (μ : D(X, R)) :
    weight (g * h) μ = weight g (weight h μ) := sorry
theorem weight_const (r : R) (μ : D(X, R)) :
    weight (ContinuousMap.const X r) μ = r • μ := sorry
theorem weight_dirac (g : C(X, R)) (x : X) :
    weight g (dirac R x) = g x • dirac R x := sorry

theorem map_weight (h : C(X, Y)) (g : C(Y, R)) (μ : D(X, R)) :
    map h (weight (g.comp h) μ) = weight g (map h μ) := sorry

theorem iterate_weight_apply (g : C(X, R)) (μ : D(X, R)) (k : ℕ) (f : C(X, R)) :
    ((weight g)^[k] μ) f = μ (g ^ k * f) := sorry

end Weight
end AbstractMeasure

namespace PowerSeries

variable (R : Type*) [CommRing R]

/-- The Mahler derivation is a multiple of the existing formal derivative. -/
def mahlerDerivation : Derivation R R⟦X⟧ R⟦X⟧ := (1 + X : R⟦X⟧) • derivative R

theorem mahlerDerivation_apply (F : R⟦X⟧) :
    mahlerDerivation R F = (1 + X) * derivative R F := sorry

theorem coeff_mahlerDerivation (F : R⟦X⟧) (n : ℕ) :
    coeff n (mahlerDerivation R F) =
      (n + 1 : R) * coeff (n + 1) F + (n : R) * coeff n F := sorry

theorem mahlerDerivation_C (r : R) : mahlerDerivation R (C r) = 0 := sorry
theorem mahlerDerivation_X : mahlerDerivation R X = 1 + X := sorry
theorem mahlerDerivation_mul (F G : R⟦X⟧) :
    mahlerDerivation R (F * G) = F * mahlerDerivation R G + G * mahlerDerivation R F := sorry

theorem map_mahlerDerivation {S : Type*} [CommRing S] (f : R →+* S) (F : R⟦X⟧) :
    map f (mahlerDerivation R F) = mahlerDerivation S (map f F) := sorry

theorem map_iterate_mahlerDerivation {S : Type*} [CommRing S]
    (f : R →+* S) (F : R⟦X⟧) (k : ℕ) :
    map f ((mahlerDerivation R)^[k] F) = (mahlerDerivation S)^[k] (map f F) := sorry

variable [Algebra ℚ R]

theorem derivative_subst_exp_sub_one (F : R⟦X⟧) :
    derivative R (subst (exp R - 1) F) = subst (exp R - 1) (mahlerDerivation R F) := sorry

theorem iterate_derivative_subst_exp_sub_one (F : R⟦X⟧) (k : ℕ) :
    (derivative R)^[k] (subst (exp R - 1) F) =
      subst (exp R - 1) ((mahlerDerivation R)^[k] F) := sorry

theorem constantCoeff_iterate_mahlerDerivation (F : R⟦X⟧) (k : ℕ) :
    constantCoeff ((mahlerDerivation R)^[k] F) =
      (k.factorial : R) * coeff k (subst (exp R - 1) F) := sorry

end PowerSeries

namespace AbstractMeasure

variable {p : ℕ} [Fact p.Prime]

theorem id_mul_mahler (n : ℕ) :
    (ContinuousMap.id ℤ_[p]) * mahler n =
      (n + 1) • mahler (p := p) (n + 1) + n • mahler (p := p) n := sorry

theorem amiceTransform_weight_id (μ : D(ℤ_[p], ℤ_[p])) :
    (weight (ContinuousMap.id ℤ_[p]) μ).amiceTransform =
      PowerSeries.mahlerDerivation ℤ_[p] μ.amiceTransform := sorry

theorem amiceTransform_iterate_weight_id (μ : D(ℤ_[p], ℤ_[p])) (k : ℕ) :
    ((weight (ContinuousMap.id ℤ_[p]))^[k] μ).amiceTransform =
      (PowerSeries.mahlerDerivation ℤ_[p])^[k] μ.amiceTransform := sorry

theorem ordinaryMoment_eq_constantCoeff (μ : D(ℤ_[p], ℤ_[p])) (k : ℕ) :
    μ ((ContinuousMap.id ℤ_[p]) ^ k) =
      PowerSeries.constantCoeff ((PowerSeries.mahlerDerivation ℤ_[p])^[k] μ.amiceTransform) := sorry

/-- Embed the evaluated integral, not the measure; exp is purely formal over Q_p. -/
theorem ordinaryMoment_eq_factorial_coeff (μ : D(ℤ_[p], ℤ_[p])) (k : ℕ) :
    (μ ((ContinuousMap.id ℤ_[p]) ^ k) : ℚ_[p]) =
      (k.factorial : ℚ_[p]) * PowerSeries.coeff k
        (PowerSeries.subst (PowerSeries.exp ℚ_[p] - 1)
          (PowerSeries.map (algebraMap ℤ_[p] ℚ_[p]) μ.amiceTransform)) := sorry

end AbstractMeasure

namespace Iwasawa

variable {G R : Type*} [Group G] [CommRing R]
variable (δ : G →* R) (Q : Type*) [CommRing Q] [Algebra R Q] [IsFractionRing R Q]

/-- Fractions made integral by every Dirac difference. -/
def pseudomeasures : Submodule R Q :=
  (1 : Submodule R Q) /
    Submodule.span R (Set.range (fun g : G => algebraMap R Q (δ g - 1)))

theorem mem_pseudomeasures_iff (z : Q) :
    z ∈ pseudomeasures δ Q ↔
      ∀ g : G, ∃ r : R, algebraMap R Q r = algebraMap R Q (δ g - 1) * z := sorry

theorem pseudomeasures_eq_top_of_trivial (hδ : ∀ g, δ g = 1) :
    pseudomeasures δ Q = ⊤ := sorry

/-- The canonical integral inclusion, with its linear structure inherited from the total quotient. -/
def integral : R →ₗ[R] pseudomeasures δ Q := sorry

theorem coe_integral (r : R) : (integral δ Q r : Q) = algebraMap R Q r := sorry

theorem integral_zero : integral δ Q 0 = 0 := sorry

theorem integral_injective : Function.Injective (integral δ Q) := sorry

theorem pseudomeasure_ext (x y : pseudomeasures δ Q) (h : (x : Q) = (y : Q)) : x = y := sorry

/-- The unique integral numerator after multiplication by `δ g - 1`. -/
def numerator (g : G) : pseudomeasures δ Q →ₗ[R] R := sorry

theorem algebraMap_numerator (g : G) (z : pseudomeasures δ Q) :
    algebraMap R Q (numerator δ Q g z) = algebraMap R Q (δ g - 1) * (z : Q) := sorry

theorem numerator_unique (g : G) (z : pseudomeasures δ Q) (r : R)
    (hr : algebraMap R Q r = algebraMap R Q (δ g - 1) * (z : Q)) :
    numerator δ Q g z = r := sorry

theorem numerator_integral (g : G) (r : R) :
    numerator δ Q g (integral δ Q r) = (δ g - 1) * r := sorry

theorem numerator_one (z : pseudomeasures δ Q) : numerator δ Q 1 z = 0 := sorry

theorem numerator_cross (g h : G) (z : pseudomeasures δ Q) :
    (δ h - 1) * numerator δ Q g z = (δ g - 1) * numerator δ Q h z := sorry

variable (A : Type*) [CommRing A] [Algebra R A]

/-- Evaluation is defined only for a clearing factor with unit image. -/
def evalAt (g : G) (hg : IsUnit (algebraMap R A (δ g - 1))) :
    pseudomeasures δ Q →ₗ[R] A := sorry

theorem evalAt_spec (g : G) (hg : IsUnit (algebraMap R A (δ g - 1)))
    (z : pseudomeasures δ Q) :
    algebraMap R A (δ g - 1) * evalAt δ Q A g hg z =
      algebraMap R A (numerator δ Q g z) := sorry

theorem evalAt_eq (g h : G) (hg : IsUnit (algebraMap R A (δ g - 1)))
    (hh : IsUnit (algebraMap R A (δ h - 1))) :
    evalAt δ Q A g hg = evalAt δ Q A h hh := sorry

theorem evalAt_integral (g : G) (hg : IsUnit (algebraMap R A (δ g - 1))) (r : R) :
    evalAt δ Q A g hg (integral δ Q r) = algebraMap R A r := sorry

theorem evalAt_unique (g : G) (hg : IsUnit (algebraMap R A (δ g - 1)))
    (L : pseudomeasures δ Q →ₗ[R] A)
    (hL : ∀ r : R, L (integral δ Q r) = algebraMap R A r) :
    L = evalAt δ Q A g hg := sorry

theorem evalAt_map {B : Type*} [CommRing B] [Algebra R B] (f : A →ₐ[R] B)
    (g : G) (hg : IsUnit (algebraMap R A (δ g - 1)))
    (hgB : IsUnit (algebraMap R B (δ g - 1))) (z : pseudomeasures δ Q) :
    f (evalAt δ Q A g hg z) = evalAt δ Q B g hgB z := sorry

/-- A ring homomorphism cannot kill a regular element and extend to the total quotient ring. -/
theorem no_fraction_extension {R Q A : Type*} [CommRing R] [CommRing Q] [Algebra R Q]
    [IsFractionRing R Q] [CommRing A] [Nontrivial A] (f : R →+* A)
    (s : R) (hs : s ∈ nonZeroDivisors R) (hfs : f s = 0) :
    ¬ ∃ F : Q →+* A, F.comp (algebraMap R Q) = f := sorry

end Iwasawa

namespace SuggestedTests

open PowerSeries AbstractMeasure

-- SuggestedTests.weight_zero_atom: weighting by x is not injective on all Z_p measures.
example : weight (ContinuousMap.id ℤ_[3]) (dirac ℤ_[3] 0) = 0 ∧
    dirac ℤ_[3] 0 ≠ 0 := sorry
-- SuggestedTests.weight_one_atom
example : weight (ContinuousMap.id ℤ_[3]) (dirac ℤ_[3] 1) = dirac ℤ_[3] 1 := sorry
-- SuggestedTests.weight_two_atom
example : weight (ContinuousMap.id ℤ_[3]) (dirac ℤ_[3] 2) =
    (2 : ℤ_[3]) • dirac ℤ_[3] 2 := sorry

-- SuggestedTests.mahler_constant
example : mahlerDerivation ℤ (C 7) = 0 := sorry
-- SuggestedTests.mahler_X: distinguishes (1+T)D from D and TD.
example : mahlerDerivation ℤ X = 1 + X := sorry
-- SuggestedTests.mahler_square
example : mahlerDerivation ℤ ((1 + X) ^ 2) = C 2 * (1 + X) ^ 2 := sorry
-- SuggestedTests.mahler_char_three: no characteristic-zero injectivity assertion.
example : mahlerDerivation (ZMod 3) (X ^ 3) = 0 ∧
    (X ^ 3 : PowerSeries (ZMod 3)) ≠ 0 := sorry

-- Explicit subst notation and the paper-style dotted notation agree.
example (F : PowerSeries ℚ) : F.subst (exp ℚ - 1) = subst (exp ℚ - 1) F := rfl

-- SuggestedTests.ordinary_zero: the zero-th moment of delta_0 is 1, not 0.
example : PowerSeries.constantCoeff
    ((mahlerDerivation ℤ_[3])^[0] (dirac ℤ_[3] (0 : ℤ_[3])).amiceTransform) = 1 := sorry
-- SuggestedTests.ordinary_two_third: ordinary third moment is 8, not a Mahler coefficient.
example : (dirac ℤ_[3] 2) ((ContinuousMap.id ℤ_[3]) ^ 3) = 8 ∧
    coeff 3 ((dirac ℤ_[3] (2 : ℤ_[3])).amiceTransform) = 0 := sorry
-- SuggestedTests.exp_factorial: coefficient is 8/3! = 4/3, not 8.
example : coeff 3 (subst (exp ℚ - 1) ((1 + X : PowerSeries ℚ) ^ 2)) = 4 / 3 := sorry

-- Carrier: the trivial Dirac map imposes no integrality condition, even on 1/2.
-- SuggestedTests.trivial_half
example : (1 / 2 : ℚ) ∈ Iwasawa.pseudomeasures (1 : PUnit →* ℤ) ℚ := sorry

-- Carrier: agreement with integral scalars.
-- SuggestedTests.integer_three
example : (3 : ℚ) ∈ Iwasawa.pseudomeasures (Units.coeHom ℤ) ℚ := sorry

-- Carrier: it is a module, not generally a subring. The differences generate (2) in this example.
-- SuggestedTests.half_not_quarter
example : (1 / 2 : ℚ) ∈ Iwasawa.pseudomeasures (Units.coeHom ℤ) ℚ ∧
    (1 / 4 : ℚ) ∉ Iwasawa.pseudomeasures (Units.coeHom ℤ) ℚ := sorry

-- Integral inclusion: computed values, zero and injectivity reject a collapsed embedding.
-- SuggestedTests.integral_three
example : (Iwasawa.integral (Units.coeHom ℤ) ℚ 3 : ℚ) = 3 := sorry
-- SuggestedTests.integral_zero
example : (Iwasawa.integral (Units.coeHom ℤ) ℚ 0 : ℚ) = 0 := sorry
-- SuggestedTests.integral_one_ne_zero
example : Iwasawa.integral (Units.coeHom ℤ) ℚ 1 ≠
    Iwasawa.integral (Units.coeHom ℤ) ℚ 0 := sorry

-- Numerator: the identity element has zero difference.
-- SuggestedTests.numerator_identity
example (z : Iwasawa.pseudomeasures (Units.coeHom ℤ) ℚ) :
    Iwasawa.numerator (Units.coeHom ℤ) ℚ 1 z = 0 := sorry

-- Numerator: integral compatibility.
-- SuggestedTests.numerator_integral_two
example : Iwasawa.numerator (Units.coeHom ℤ) ℚ (-1)
    (Iwasawa.integral (Units.coeHom ℤ) ℚ 2) = -4 := sorry

-- Numerator: nonintegral pseudomeasure, integral cleared numerator.
-- SuggestedTests.numerator_half
example (h : (1 / 2 : ℚ) ∈ Iwasawa.pseudomeasures (Units.coeHom ℤ) ℚ) :
    Iwasawa.numerator (Units.coeHom ℤ) ℚ (-1) ⟨1 / 2, h⟩ = -1 := sorry

-- Evaluation: zero, integral agreement and the nonintegral half are distinct checks.
-- SuggestedTests.evaluation_zero
example (hu : IsUnit (algebraMap ℤ ℚ (Units.coeHom ℤ (-1) - 1))) :
    Iwasawa.evalAt (Units.coeHom ℤ) ℚ ℚ (-1) hu 0 = 0 := sorry

-- SuggestedTests.evaluation_integral_three
example (hu : IsUnit (algebraMap ℤ ℚ (Units.coeHom ℤ (-1) - 1))) :
    Iwasawa.evalAt (Units.coeHom ℤ) ℚ ℚ (-1) hu
      (Iwasawa.integral (Units.coeHom ℤ) ℚ 3) = 3 := sorry

-- SuggestedTests.evaluation_half
example (h : (1 / 2 : ℚ) ∈ Iwasawa.pseudomeasures (Units.coeHom ℤ) ℚ)
    (hu : IsUnit (algebraMap ℤ ℚ (Units.coeHom ℤ (-1) - 1))) :
    Iwasawa.evalAt (Units.coeHom ℤ) ℚ ℚ (-1) hu ⟨1 / 2, h⟩ = 1 / 2 := sorry

-- A nonzero denominator is insufficient over a general target ring: 2 is not a unit in ℤ.
-- SuggestedTests.nonzero_not_unit
example : (2 : ℤ) ≠ 0 ∧ ¬ IsUnit (2 : ℤ) := sorry

-- Augmentation cannot extend to the full fraction ring because it kills X.
-- SuggestedTests.augmentation_obstruction
example : ¬ ∃ F : FractionRing (Polynomial ℚ) →+* ℚ,
    F.comp (algebraMap (Polynomial ℚ) (FractionRing (Polynomial ℚ))) =
      Polynomial.evalRingHom (0 : ℚ) := sorry

-- The same obstruction occurs away from the augmentation point: evaluation at 3 kills X-3.
-- SuggestedTests.nontrivial_point_obstruction
example : ¬ ∃ F : FractionRing (Polynomial ℚ) →+* ℚ,
    F.comp (algebraMap (Polynomial ℚ) (FractionRing (Polynomial ℚ))) =
      Polynomial.evalRingHom (3 : ℚ) := sorry

end SuggestedTests


namespace AbstractMeasure

section BoundedOperators

open scoped Classical

variable (p : ℕ) [Fact p.Prime]

/-- The subset p Z_p is clopen in Z_p. -/
theorem isClopen_pMultiples : IsClopen {x : ℤ_[p] | (p : ℤ_[p]) ∣ x} := sorry

/-- Exact division on p Z_p, extended by zero; no division of measure values. -/
def divideByP : C(ℤ_[p], ℤ_[p]) := sorry

theorem divideByP_mul (x : ℤ_[p]) : divideByP p ((p : ℤ_[p]) * x) = x := sorry
theorem mul_divideByP (x : ℤ_[p]) (hx : (p : ℤ_[p]) ∣ x) :
    (p : ℤ_[p]) * divideByP p x = x := sorry
theorem divideByP_of_not_dvd (x : ℤ_[p]) (hx : ¬ (p : ℤ_[p]) ∣ x) :
    divideByP p x = 0 := sorry

variable (R : Type*) [NormedCommRing R]

local notation "χ" => LocallyConstant.toContinuousMap (LocallyConstant.charFn R (isClopen_pMultiples p))
local notation "mₚ" => (ContinuousMap.mk (fun x : ℤ_[p] => (p : ℤ_[p]) * x)
  (Continuous.mul continuous_const continuous_id))

def restrictMultiples : D(ℤ_[p], R) →ₗ[R] D(ℤ_[p], R) := sorry

theorem restrictMultiples_eq_weight : restrictMultiples p R = weight χ := sorry
theorem restrictMultiples_apply (μ : D(ℤ_[p], R)) (f : C(ℤ_[p], R)) :
    restrictMultiples p R μ f = μ (χ * f) := sorry
theorem restrictMultiples_dirac (x : ℤ_[p]) :
    restrictMultiples p R (dirac R x) = if (p : ℤ_[p]) ∣ x then dirac R x else 0 := by
  classical
  sorry
theorem restrictMultiples_idem (μ : D(ℤ_[p], R)) :
    restrictMultiples p R (restrictMultiples p R μ) = restrictMultiples p R μ := sorry

def phiMeasure : D(ℤ_[p], R) →ₗ[R] D(ℤ_[p], R) := sorry

theorem phiMeasure_eq_map : phiMeasure p R = map mₚ := sorry
theorem phiMeasure_apply (μ : D(ℤ_[p], R)) (f : C(ℤ_[p], R)) :
    phiMeasure p R μ f = μ (f.comp mₚ) := sorry
theorem phiMeasure_dirac (x : ℤ_[p]) :
    phiMeasure p R (dirac R x) = dirac R ((p : ℤ_[p]) * x) := sorry
theorem phiMeasure_injective : Function.Injective (phiMeasure p R) := sorry

def psiMeasure : D(ℤ_[p], R) →ₗ[R] D(ℤ_[p], R) := sorry

theorem psiMeasure_eq_map_restrict : psiMeasure p R =
    (map (divideByP p)).comp (restrictMultiples p R) := sorry
theorem psiMeasure_apply (μ : D(ℤ_[p], R)) (f : C(ℤ_[p], R)) :
    psiMeasure p R μ f = μ (χ * f.comp (divideByP p)) := sorry
theorem psiMeasure_dirac (x : ℤ_[p]) :
    psiMeasure p R (dirac R x) =
      if (p : ℤ_[p]) ∣ x then dirac R (divideByP p x) else 0 := by
  classical
  sorry
theorem psiMeasure_phiMeasure (μ : D(ℤ_[p], R)) :
    psiMeasure p R (phiMeasure p R μ) = μ := sorry
theorem phiMeasure_psiMeasure (μ : D(ℤ_[p], R)) :
    phiMeasure p R (psiMeasure p R μ) = restrictMultiples p R μ := sorry

def unitRestriction : D(ℤ_[p], R) →ₗ[R] D(ℤ_[p], R) := sorry

theorem unitRestriction_eq_sub : unitRestriction p R =
    LinearMap.id - restrictMultiples p R := sorry
theorem unitRestriction_apply (μ : D(ℤ_[p], R)) (f : C(ℤ_[p], R)) :
    unitRestriction p R μ f = μ ((1 - χ) * f) := sorry
theorem unitRestriction_dirac (x : ℤ_[p]) :
    unitRestriction p R (dirac R x) = if IsUnit x then dirac R x else 0 := by
  classical
  sorry
theorem unitRestriction_idem (μ : D(ℤ_[p], R)) :
    unitRestriction p R (unitRestriction p R μ) = unitRestriction p R μ := sorry
theorem unitRestriction_eq_self_iff (μ : D(ℤ_[p], R)) :
    unitRestriction p R μ = μ ↔ ∀ f : C(ℤ_[p], R), μ (χ * f) = 0 := sorry
theorem unitRestriction_eq_self_iff_psi_eq_zero (μ : D(ℤ_[p], R)) :
    unitRestriction p R μ = μ ↔ psiMeasure p R μ = 0 := sorry
theorem psiMeasure_unitRestriction (μ : D(ℤ_[p], R)) :
    psiMeasure p R (unitRestriction p R μ) = 0 := sorry
theorem unitRestriction_phiMeasure (μ : D(ℤ_[p], R)) :
    unitRestriction p R (phiMeasure p R μ) = 0 := sorry

end BoundedOperators

section AmiceOperators

variable (p : ℕ) [Fact p.Prime]
open PowerSeries
local notation "B" => ℤ_[p]⟦X⟧
local notation "b" => ((1 + X : B) ^ p - 1)

/-- Finite Mahler expansion of the dilation x ↦ p x. -/
theorem mahler_mul_prime (n : ℕ) (x : ℤ_[p]) :
    mahler n ((p : ℤ_[p]) * x) =
      ∑ k ∈ Finset.range (n + 1), coeff n (b ^ k) * mahler k x := sorry

theorem amiceTransform_phiMeasure (μ : D(ℤ_[p], ℤ_[p])) :
    (phiMeasure p ℤ_[p] μ).amiceTransform = subst b μ.amiceTransform := sorry

/-- Transport of the integral bounded-measure psi along the existing Amice equivalence. -/
def psiSeries : B →ₗ[ℤ_[p]] B := sorry

theorem psiSeries_eq_transport : psiSeries p =
    (amiceTransformEquiv (p := p)).toLinearMap.comp
      ((psiMeasure p ℤ_[p]).comp (amiceTransformEquiv (p := p)).symm.toLinearMap) := sorry
theorem psiSeries_amiceTransform (μ : D(ℤ_[p], ℤ_[p])) :
    psiSeries p μ.amiceTransform = (psiMeasure p ℤ_[p] μ).amiceTransform := sorry
theorem psiSeries_phi (F : B) : psiSeries p (subst b F) = F := sorry
theorem psiSeries_one : psiSeries p 1 = 1 := sorry
theorem psiSeries_one_add_X : psiSeries p (1 + X) = 0 := sorry
theorem amiceTransform_unitRestriction (μ : D(ℤ_[p], ℤ_[p])) :
    (unitRestriction p ℤ_[p] μ).amiceTransform =
      μ.amiceTransform - subst b (psiSeries p μ.amiceTransform) := sorry

end AmiceOperators
end AbstractMeasure

namespace SuggestedTests
open AbstractMeasure PowerSeries

-- SuggestedTests.divide_zero
example : divideByP 3 0 = 0 := sorry
-- SuggestedTests.divide_six
example : divideByP 3 6 = 2 := sorry
-- SuggestedTests.divide_unit
example : divideByP 3 1 = 0 := sorry
-- SuggestedTests.divide_dyadic
example : divideByP 2 6 = 3 := sorry

-- SuggestedTests.restrict_zero_atom: zero is in p Z_p.
example : restrictMultiples 3 ℤ_[3] (dirac ℤ_[3] 0) = dirac ℤ_[3] 0 := sorry
-- SuggestedTests.restrict_unit_atom
example : restrictMultiples 3 ℤ_[3] (dirac ℤ_[3] 1) = 0 := sorry
-- SuggestedTests.restrict_three_atom
example : restrictMultiples 3 ℤ_[3] (dirac ℤ_[3] 3) = dirac ℤ_[3] 3 := sorry

-- SuggestedTests.phi_zero
example : phiMeasure 3 ℤ_[3] 0 = 0 := sorry
-- SuggestedTests.phi_two_atom
example : phiMeasure 3 ℤ_[3] (dirac ℤ_[3] 2) = dirac ℤ_[3] 6 := sorry
-- SuggestedTests.phi_mass
example (μ : D(ℤ_[3], ℤ_[3])) : phiMeasure 3 ℤ_[3] μ 1 = μ 1 := sorry

-- SuggestedTests.psi_zero_atom
example : psiMeasure 3 ℤ_[3] (dirac ℤ_[3] 0) = dirac ℤ_[3] 0 := sorry
-- SuggestedTests.psi_six_atom
example : psiMeasure 3 ℤ_[3] (dirac ℤ_[3] 6) = dirac ℤ_[3] 2 := sorry
-- SuggestedTests.psi_unit_atom
example : psiMeasure 3 ℤ_[3] (dirac ℤ_[3] 1) = 0 := sorry
-- SuggestedTests.psi_dyadic
example : psiMeasure 2 ℤ_[2] (dirac ℤ_[2] 6) = dirac ℤ_[2] 3 := sorry

-- SuggestedTests.unit_one_atom
example : unitRestriction 3 ℤ_[3] (dirac ℤ_[3] 1) = dirac ℤ_[3] 1 := sorry
-- SuggestedTests.unit_zero_atom
example : unitRestriction 3 ℤ_[3] (dirac ℤ_[3] 0) = 0 := sorry
-- SuggestedTests.unit_three_atom
example : unitRestriction 3 ℤ_[3] (dirac ℤ_[3] 3) = 0 := sorry

-- SuggestedTests.psi_series_zero
example : psiSeries 3 0 = 0 := sorry
-- SuggestedTests.psi_series_one
example : psiSeries 3 1 = 1 := sorry
-- SuggestedTests.psi_series_unit
example : psiSeries 3 (1 + X) = 0 := sorry
-- SuggestedTests.psi_series_cube
example : psiSeries 3 ((1 + X) ^ 3) = 1 + X := sorry
-- SuggestedTests.psi_series_dyadic
example : psiSeries 2 ((1 + X) ^ 2) = 1 + X := sorry

-- The source-label error changes a numerical integral, not the valid psi-phi theorem.
-- SuggestedTests.source_measure_label
example : phiMeasure 3 ℤ_[3] (dirac ℤ_[3] 1) (ContinuousMap.id ℤ_[3]) = 3 ∧
    dirac ℤ_[3] (1 : ℤ_[3]) (ContinuousMap.id ℤ_[3]) = 1 := sorry
-- SuggestedTests.mahler_prime_second
example (x : ℤ_[3]) : mahler 2 (3 * x) = 3 * mahler 1 x + 9 * mahler 2 x := sorry
-- SuggestedTests.psi_not_multiplicative
example : psiSeries 2 (1 + X) * psiSeries 2 (1 + X) ≠
    psiSeries 2 ((1 + X) * (1 + X)) := sorry
end SuggestedTests


namespace PadicInt
variable {p : ℕ} [Fact p.Prime]

/-- Identify two existing unit-inverse functions; neither function is redefined. -/
theorem inv_eq_ringInverse (x : ℤ_[p]) : x.inv = Ring.inverse x := sorry

theorem continuous_inv : Continuous (PadicInt.inv (p := p)) := sorry
end PadicInt

namespace AbstractMeasure
section UnitInverse
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]
local notation "ι" => (ContinuousMap.mk PadicInt.inv PadicInt.continuous_inv : C(Z, Z))
local notation "x" => (ContinuousMap.id Z)

/-- Weight by the existing unit inverse extended by zero, on the existing integral measure. -/
def inverseWeight : D(Z, Z) →ₗ[Z] D(Z, Z) := weight ι

theorem inverseWeight_eq_weight : inverseWeight p = weight ι := sorry
theorem inverseWeight_apply (μ : D(Z, Z)) (f : C(Z, Z)) :
    inverseWeight p μ f = μ (ι * f) := sorry
theorem inverseWeight_dirac (a : Z) :
    inverseWeight p (dirac Z a) = a.inv • dirac Z a := sorry

theorem inverseWeight_unitRestriction (μ : D(Z, Z)) :
    inverseWeight p (unitRestriction p Z μ) = inverseWeight p μ ∧
      unitRestriction p Z (inverseWeight p μ) = inverseWeight p μ := sorry

theorem weight_id_inverseWeight (μ : D(Z, Z)) :
    weight x (inverseWeight p μ) = unitRestriction p Z μ := sorry

theorem inverseWeight_weight_id (μ : D(Z, Z)) :
    inverseWeight p (weight x μ) = unitRestriction p Z μ := sorry

theorem inverseWeight_unique (μ : D(Z, Z)) (hμ : psiMeasure p Z μ = 0) :
    ∃! ν : D(Z, Z), psiMeasure p Z ν = 0 ∧ weight x ν = μ := sorry

/-- The map is raw pushforward along a unit dilation, with its direction explicit. -/
theorem inverseWeight_map_unit (a : Zˣ) (μ : D(Z, Z)) :
    inverseWeight p (map ⟨fun z : Z => (a : Z) * z,
      continuous_const.mul continuous_id⟩ μ) =
    (a⁻¹ : Zˣ) • map ⟨fun z : Z => (a : Z) * z,
      continuous_const.mul continuous_id⟩ (inverseWeight p μ) := sorry

open PowerSeries
local notation "B" => Z⟦X⟧
local notation "b" => ((1 + X : B) ^ p - 1)

/-- Transport through the existing integral Amice equivalence. -/
def inverseMahler : B →ₗ[Z] B :=
    (amiceTransformEquiv (p := p)).toLinearMap.comp
      ((inverseWeight p).comp (amiceTransformEquiv (p := p)).symm.toLinearMap)

theorem inverseMahler_eq_transport : inverseMahler p =
    (amiceTransformEquiv (p := p)).toLinearMap.comp
      ((inverseWeight p).comp (amiceTransformEquiv (p := p)).symm.toLinearMap) := sorry

theorem inverseMahler_amiceTransform (μ : D(Z, Z)) :
    inverseMahler p μ.amiceTransform = (inverseWeight p μ).amiceTransform := sorry

theorem psiSeries_inverseMahler (F : B) : psiSeries p (inverseMahler p F) = 0 := sorry

theorem mahlerDerivation_inverseMahler (F : B) :
    mahlerDerivation Z (inverseMahler p F) = F - subst b (psiSeries p F) := sorry

theorem inverseMahler_mahlerDerivation (F : B) :
    inverseMahler p (mahlerDerivation Z F) = F - subst b (psiSeries p F) := sorry

theorem inverseMahler_unique (F : B) (hF : psiSeries p F = 0) :
    ∃! G : B, psiSeries p G = 0 ∧ mahlerDerivation Z G = F := sorry
end UnitInverse
end AbstractMeasure

namespace SuggestedTests
open scoped AbstractMeasure
open AbstractMeasure PowerSeries
-- SuggestedTests.inverse_weight_zero_atom
example : inverseWeight 3 (dirac ℤ_[3] 0) = 0 := sorry
-- SuggestedTests.inverse_weight_unit_atom
example : inverseWeight 3 (dirac ℤ_[3] 1) = dirac ℤ_[3] 1 := sorry
-- SuggestedTests.inverse_weight_two_atom
example : (2 : ℤ_[3]) • inverseWeight 3 (dirac ℤ_[3] 2) = dirac ℤ_[3] 2 := sorry
-- SuggestedTests.inverse_weight_nonunit_atom
example : inverseWeight 3 (dirac ℤ_[3] 3) = 0 := sorry
-- SuggestedTests.inverse_weight_dyadic_atom
example : (3 : ℤ_[2]) • inverseWeight 2 (dirac ℤ_[2] 3) = dirac ℤ_[2] 3 := sorry
-- SuggestedTests.inverse_weight_dilation_factor
example : (2 : ℤ_[3]) • inverseWeight 3
    (map ⟨fun z : ℤ_[3] => 2 * z, continuous_const.mul continuous_id⟩
      (dirac ℤ_[3] 1)) = dirac ℤ_[3] 2 := sorry
-- SuggestedTests.inverse_mahler_constant
example : inverseMahler 3 (1 : ℤ_[3]⟦X⟧) = 0 := sorry
-- SuggestedTests.inverse_mahler_unit
example : inverseMahler 3 (1 + X) = 1 + X := sorry
-- SuggestedTests.inverse_mahler_square
example : (2 : ℤ_[3]) • inverseMahler 3 ((1 + X) ^ 2) = (1 + X) ^ 2 := sorry
-- SuggestedTests.inverse_mahler_nonunit
example : inverseMahler 3 ((1 + X) ^ 3) = 0 := sorry
-- SuggestedTests.inverse_mahler_dyadic
example : (3 : ℤ_[2]) • inverseMahler 2 ((1 + X) ^ 3) = (1 + X) ^ 3 := sorry
end SuggestedTests

/-! ## Integral topological root averaging

The receiving ring is the existing valuation integer ring of C_p, with its
induced topology. The topology on power series is the coefficientwise p-adic
product topology. Topological evaluation, not formal substitution at a nonzero
constant, defines root translation. The operator psiSeries is the preceding one.
-/

namespace IwasawaAveraging
open Filter Topology PowerSeries
open scoped PowerSeries.WithPiTopology Valued NNReal Classical

variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]
local notation "O" => 𝒪[ℂ_[p]]
local notation "B" => Z⟦X⟧
local notation "b" => ((1 + X : B) ^ p - 1)
local notation "j₀" => (RingHom.comp (algebraMap ℚ_[p] ℂ_[p]) (algebraMap Z ℚ_[p]))

-- The complete-space instance is the pinned closed-subspace theorem.
local instance : CompleteSpace O :=
  (Valued.isClosed_integer ℂ_[p]).isComplete.completeSpace_coe

/-- Small valuation balls give an ideal basis on the existing integer ring. -/
theorem integerRing_linearTopology : IsLinearTopology O O := by sorry
local instance : IsLinearTopology O O := integerRing_linearTopology p

/-- The canonical coefficient map, the existing composite lifted into its unit ball. -/
def integralCoefficientMap : Z →+* O := sorry

theorem integralCoefficientMap_coe (x : Z) :
    ((integralCoefficientMap p x : O) : ℂ_[p]) = j₀ x := by sorry

theorem integralCoefficientMap_continuous : Continuous (integralCoefficientMap p) := by sorry

theorem integralCoefficientMap_injective : Function.Injective (integralCoefficientMap p) := by sorry

theorem primeRoot_sub_one_norm {ζ : ℂ_[p]} (hζ : ζ ^ p = 1) : ‖ζ - 1‖ < 1 := by sorry

theorem integerRoot_sub_one_topologicallyNilpotent {ζ : O} (hζ : ζ ^ p = 1) :
    IsTopologicallyNilpotent (ζ - 1) := by sorry

theorem invTransform_uniform_tail (f : C(Z, Z)) (ε : ℝ) (hε : 0 < ε) :
    ∃ N : ℕ, ∀ F : B, ∀ n : ℕ, N ≤ n →
      ‖AbstractMeasure.invTransform F f -
        ∑ k ∈ Finset.range n, PadicInt.mahlerEquiv Z f k * F.coeff k‖ < ε := by sorry

/-- Integral Amice evaluation is continuous for the coefficientwise topology. -/
theorem continuous_invTransform_apply (f : C(Z, Z)) :
    Continuous (fun F : B => AbstractMeasure.invTransform F f) := by sorry

theorem continuous_psiSeries : Continuous (AbstractMeasure.psiSeries p) := by sorry

theorem continuous_phi_psiSeries :
    Continuous (fun F : B => subst b (AbstractMeasure.psiSeries p F)) := by sorry

theorem amiceTransform_dirac_nat (n : ℕ) :
    (AbstractMeasure.dirac Z (n : Z)).amiceTransform = (1 + X : B) ^ n := by sorry

theorem phi_psiSeries_one_add_X_pow (n : ℕ) :
    subst b (AbstractMeasure.psiSeries p ((1 + X : B) ^ n)) =
      if p ∣ n then (1 + X : B) ^ n else 0 := by sorry

theorem rootTranslation_hasEval (ζ : O) (hζ : ζ ^ p = 1) (i : ℕ) :
    PowerSeries.HasEval (C (ζ ^ i) * (1 + X : O⟦X⟧) - 1) := by sorry

/-- Only integral input coefficients are evaluated; the target has its genuine topology. -/
def rootTranslation (ζ : O) (hζ : ζ ^ p = 1) (i : ℕ) : B →+* O⟦X⟧ := sorry

theorem rootTranslation_eq_eval (ζ : O) (hζ : ζ ^ p = 1) (i : ℕ) (F : B) :
    rootTranslation p ζ hζ i F =
      PowerSeries.eval₂ ((PowerSeries.C : O →+* O⟦X⟧).comp (integralCoefficientMap p))
        (C (ζ ^ i) * (1 + X) - 1) F := by sorry

theorem rootTranslation_continuous (ζ : O) (hζ : ζ ^ p = 1) (i : ℕ) :
    Continuous (rootTranslation p ζ hζ i) := by sorry

theorem rootTranslation_polynomial (ζ : O) (hζ : ζ ^ p = 1) (i : ℕ) (P : Polynomial Z) :
    rootTranslation p ζ hζ i (P : B) =
      P.eval₂ ((PowerSeries.C : O →+* O⟦X⟧).comp (integralCoefficientMap p))
        (C (ζ ^ i) * (1 + X) - 1) := by sorry

theorem rootTranslation_one_add_X_pow (ζ : O) (hζ : ζ ^ p = 1) (i n : ℕ) :
    rootTranslation p ζ hζ i ((1 + X : B) ^ n) = C (ζ ^ (i * n)) * (1 + X) ^ n := by sorry

theorem rootTranslation_hasSum (ζ : O) (hζ : ζ ^ p = 1) (i : ℕ) (F : B) :
    HasSum (fun n => C (integralCoefficientMap p (F.coeff n)) *
      (C (ζ ^ i) * (1 + X : O⟦X⟧) - 1) ^ n) (rootTranslation p ζ hζ i F) := by sorry

theorem rootTranslation_zeroth (ζ : O) (hζ : ζ ^ p = 1) (F : B) :
    rootTranslation p ζ hζ 0 F = PowerSeries.map (integralCoefficientMap p) F := by sorry

theorem primitiveRoot_power_sum {R : Type*} [CommRing R] [IsDomain R]
    {ζ : R} (hζ : IsPrimitiveRoot ζ p) (n : ℕ) :
    (∑ i ∈ Finset.range p, ζ ^ (i * n)) = if p ∣ n then (p : R) else 0 := by sorry

theorem root_average_polynomial (ζ : O) (hζ : IsPrimitiveRoot ζ p) (P : Polynomial Z) :
    (p : O⟦X⟧) * PowerSeries.map (integralCoefficientMap p)
      (subst b (AbstractMeasure.psiSeries p (P : B))) =
      ∑ i ∈ Finset.range p, rootTranslation p ζ hζ.pow_eq_one i (P : B) := by sorry

theorem root_average (ζ : O) (hζ : IsPrimitiveRoot ζ p) (F : B) :
    (p : O⟦X⟧) * PowerSeries.map (integralCoefficientMap p)
      (subst b (AbstractMeasure.psiSeries p F)) =
      ∑ i ∈ Finset.range p, rootTranslation p ζ hζ.pow_eq_one i F := by sorry

theorem root_average_integral_descent (ζ : O) (hζ : IsPrimitiveRoot ζ p) (F : B) :
    ∃! G : B, (p : O⟦X⟧) * PowerSeries.map (integralCoefficientMap p) (subst b G) =
      ∑ i ∈ Finset.range p, rootTranslation p ζ hζ.pow_eq_one i F := by sorry

section Fractions
local notation "CPS" => ℂ_[p]⟦X⟧
local notation "Q" => FractionRing CPS
local notation "J" => RingHom.comp (algebraMap CPS Q) (PowerSeries.map j₀)
local notation "Y" => ((algebraMap CPS Q) (1 + X))
local notation "c" => (RingHom.comp (algebraMap CPS Q) (PowerSeries.C : ℂ_[p] →+* CPS))

/-- Polynomial affine substitution has no zero denominator for nonzero Q. -/
theorem translated_polynomial_ne_zero (ζ : ℂ_[p]) (hζ : ζ ≠ 0)
    (P : Polynomial Z) (hP : P ≠ 0) :
    P.eval₂ (RingHom.comp c j₀) (c ζ * Y - 1) ≠ 0 := by sorry

theorem rootTranslation_rational (ζ : O) (hζ : ζ ^ p = 1) (i : ℕ)
    (P Q₀ : Polynomial Z) (hQ : IsUnit (Q₀.coeff 0)) (F : B)
    (hF : (Q₀ : B) * F = (P : B)) :
    (algebraMap CPS Q) (PowerSeries.map (Valued.integer ℂ_[p]).subtype
      (rootTranslation p ζ hζ i F)) =
      P.eval₂ (RingHom.comp c j₀) (c ((ζ : ℂ_[p]) ^ i) * Y - 1) /
        Q₀.eval₂ (RingHom.comp c j₀) (c ((ζ : ℂ_[p]) ^ i) * Y - 1) := by sorry

theorem rational_root_average (ζ : ℂ_[p]) (hζ : IsPrimitiveRoot ζ p)
    (P Q₀ : Polynomial Z) (hQ : IsUnit (Q₀.coeff 0)) (F : B)
    (hF : (Q₀ : B) * F = (P : B)) :
    (p : Q) * J (subst b (AbstractMeasure.psiSeries p F)) =
      ∑ i ∈ Finset.range p,
        P.eval₂ (RingHom.comp c j₀) (c (ζ ^ i) * Y - 1) /
          Q₀.eval₂ (RingHom.comp c j₀) (c (ζ ^ i) * Y - 1) := by sorry
end Fractions

section AlgebraicFractions
variable {K : Type*} [Field K] [CharZero K]

theorem root_denominator_ne_zero {ζ y : K} (hζ : IsPrimitiveRoot ζ p)
    (hy : y ^ p ≠ 1) (i : ℕ) : ζ ^ i * y - 1 ≠ 0 := by sorry

theorem root_partial_fractions {ζ y : K} (hζ : IsPrimitiveRoot ζ p)
    (hy : y ^ p ≠ 1) :
    (∑ i ∈ Finset.range p, 1 / (ζ ^ i * y - 1)) = (p : K) / (y ^ p - 1) := by sorry

theorem translated_polynomial_descent_ne_zero (j : Z →+* K) (e : K →+* ℂ_[p])
    (he : e.comp j = j₀) (ζ : K) (hζ : ζ ≠ 0)
    (P : Polynomial Z) (hP : P ≠ 0) :
    let ι := algebraMap (PowerSeries K) (FractionRing (PowerSeries K))
    let c := ι.comp (PowerSeries.C : K →+* PowerSeries K)
    P.eval₂ (RingHom.comp c j) (c ζ * ι (1 + X) - 1) ≠ 0 := by sorry

/-- The receiving field can be the actual finite cyclotomic subfield of C_p. -/
theorem rational_root_average_descent (j : Z →+* K) (e : K →+* ℂ_[p])
    (he : e.comp j = j₀) (ζ : K) (hζ : IsPrimitiveRoot ζ p)
    (P Q₀ : Polynomial Z) (hQ : IsUnit (Q₀.coeff 0)) (F : B)
    (hF : (Q₀ : B) * F = (P : B)) :
    let ι := algebraMap (PowerSeries K) (FractionRing (PowerSeries K))
    let J := ι.comp (PowerSeries.map j)
    let c := ι.comp (PowerSeries.C : K →+* PowerSeries K)
    let Y := ι (1 + X)
    (p : FractionRing (PowerSeries K)) * J (subst b (AbstractMeasure.psiSeries p F)) =
      ∑ i ∈ Finset.range p,
        P.eval₂ (RingHom.comp c j) (c (ζ ^ i) * Y - 1) /
          Q₀.eval₂ (RingHom.comp c j) (c (ζ ^ i) * Y - 1) := by sorry
end AlgebraicFractions

-- IwasawaAveraging.Tests.coefficient_zero
example : integralCoefficientMap p 0 = 0 := by sorry
-- IwasawaAveraging.Tests.coefficient_one
example : integralCoefficientMap p 1 = 1 := by sorry
-- IwasawaAveraging.Tests.coefficient_agreement
example (x : Z) : ((integralCoefficientMap p x : O) : ℂ_[p]) = j₀ x := by sorry

-- IwasawaAveraging.Tests.translation_zero
example (h : (-1 : 𝒪[ℂ_[2]]) ^ 2 = 1) :
    rootTranslation 2 (-1) h 1 0 = 0 := by sorry
-- IwasawaAveraging.Tests.translation_variable
example (h : (-1 : 𝒪[ℂ_[2]]) ^ 2 = 1) :
    rootTranslation 2 (-1) h 1 X = -2 - X := by sorry
-- IwasawaAveraging.Tests.translation_odd_power
example (h : (-1 : 𝒪[ℂ_[2]]) ^ 2 = 1) :
    rootTranslation 2 (-1) h 1 ((1 + X) ^ 3) = -(1 + X) ^ 3 := by sorry

-- IwasawaAveraging.Tests.average_variable_two
example (h : IsPrimitiveRoot (-1 : 𝒪[ℂ_[2]]) 2) :
    (∑ i ∈ Finset.range 2, rootTranslation 2 (-1) h.pow_eq_one i X) = -2 := by sorry
-- IwasawaAveraging.Tests.partial_fractions_two
example : (∑ i ∈ Finset.range 2, 1 / (((-1 : ℚ) ^ i) * 2 - 1)) = 2 / 3 := by sorry

end IwasawaAveraging

/-! ## Bounded Mahler coefficients and extension of integral measures

The domain of the inverse is the existing bounded continuous sequence type.
The codomain is the existing AbstractMeasure. The coefficient action is bounded;
the target norm need not be multiplicative. This section gives the Z_p-domain
case of coefficient extension, with genuine continuity and convergence.
-/

open scoped BoundedContinuousFunction
namespace AbstractMeasure
section BoundedCoefficients
variable {p : ℕ} [Fact p.Prime]
variable {R : Type*} [NormedCommRing R] [Algebra ℤ_[p] R]
  [hU : IsUltrametricDist R] [hC : CompleteSpace R] [hB : IsBoundedSMul ℤ_[p] R]

include hU hC hB in
theorem boundedMahler_summable (c : ℕ →ᵇ R) (f : C(ℤ_[p], R)) :
    Summable (fun n => PadicInt.mahlerEquiv R f n * c n) := sorry

/-- Pair a continuous function's vanishing Mahler coefficients with a bounded sequence. -/
def boundedMahlerPairing {p : ℕ} [Fact p.Prime] {R : Type*}
    [NormedCommRing R] [Algebra ℤ_[p] R] [IsUltrametricDist R]
    [CompleteSpace R] [IsBoundedSMul ℤ_[p] R]
    (c : ℕ →ᵇ R) : C(ℤ_[p], R) →ₗ[R] R := sorry

theorem boundedMahlerPairing_apply (c : ℕ →ᵇ R) (f : C(ℤ_[p], R)) :
    boundedMahlerPairing c f = ∑' n, PadicInt.mahlerEquiv R f n * c n := sorry
theorem boundedMahlerPairing_add (c : ℕ →ᵇ R) (f g : C(ℤ_[p], R)) :
    boundedMahlerPairing c (f + g) = boundedMahlerPairing c f + boundedMahlerPairing c g := sorry
theorem boundedMahlerPairing_smul (c : ℕ →ᵇ R) (r : R) (f : C(ℤ_[p], R)) :
    boundedMahlerPairing c (r • f) = r * boundedMahlerPairing c f := sorry
theorem boundedMahlerPairing_bound (c : ℕ →ᵇ R) (f : C(ℤ_[p], R)) :
    ‖boundedMahlerPairing c f‖ ≤ ‖c‖ * ‖f‖ := sorry
theorem boundedMahlerPairing_integral (F : ℤ_[p]⟦X⟧) (c : ℕ →ᵇ ℤ_[p])
    (hc : ∀ n, c n = F.coeff n) (f : C(ℤ_[p], ℤ_[p])) :
    boundedMahlerPairing c f = invTransform F f := sorry

/-- The actual continuous functional; boundedness is part of the input type. -/
def boundedInvTransform {p : ℕ} [Fact p.Prime] {R : Type*}
    [NormedCommRing R] [Algebra ℤ_[p] R] [IsUltrametricDist R]
    [CompleteSpace R] [IsBoundedSMul ℤ_[p] R] : (ℕ →ᵇ R) →ₗ[R] D(ℤ_[p], R) := sorry

theorem boundedInvTransform_apply (c : ℕ →ᵇ R) (f : C(ℤ_[p], R)) :
    boundedInvTransform c f = boundedMahlerPairing c f := sorry
theorem boundedInvTransform_mahler (c : ℕ →ᵇ R) (n : ℕ) :
    boundedInvTransform c ((mahler n : C(ℤ_[p], ℤ_[p])) • (1 : C(ℤ_[p], R))) = c n := sorry
theorem amiceTransform_boundedInvTransform (c : ℕ →ᵇ R) :
    (boundedInvTransform (p := p) c).amiceTransform = PowerSeries.mk c := sorry
theorem boundedInvTransform_unique (c : ℕ →ᵇ R) (μ : D(ℤ_[p], R))
    (h : μ.amiceTransform = PowerSeries.mk c) : μ = boundedInvTransform c := sorry
theorem boundedInvTransform_zero : boundedInvTransform (p := p) (R := R) 0 = 0 := sorry
theorem boundedInvTransform_add (c d : ℕ →ᵇ R) :
    boundedInvTransform (p := p) (c + d) = boundedInvTransform c + boundedInvTransform d := sorry
theorem boundedInvTransform_smul (r : R) (c : ℕ →ᵇ R) :
    boundedInvTransform (p := p) (r • c) = r • boundedInvTransform c := sorry
theorem boundedInvTransform_integral (F : ℤ_[p]⟦X⟧) (c : ℕ →ᵇ ℤ_[p])
    (hc : ∀ n, c n = F.coeff n) : boundedInvTransform c = invTransform F := sorry
theorem boundedInvTransform_bound (c : ℕ →ᵇ R) (f : C(ℤ_[p], R)) :
    ‖boundedInvTransform c f‖ ≤ ‖c‖ * ‖f‖ := sorry

omit [IsUltrametricDist R] [CompleteSpace R] in
include hB in
theorem integralCoefficient_norm_le (z : ℤ_[p]) :
    ‖algebraMap ℤ_[p] R z‖ ≤ ‖(1 : R)‖ := sorry

omit [IsUltrametricDist R] [CompleteSpace R] in
/-- The mapped Amice coefficients, bounded by the norm of the target unit. -/
def integralAmiceCoefficients {p : ℕ} [Fact p.Prime] {R : Type*}
    [NormedCommRing R] [Algebra ℤ_[p] R] [IsBoundedSMul ℤ_[p] R]
    (μ : D(ℤ_[p], ℤ_[p])) : ℕ →ᵇ R := sorry

omit [IsUltrametricDist R] [CompleteSpace R] in
theorem integralAmiceCoefficients_apply (μ : D(ℤ_[p], ℤ_[p])) (n : ℕ) :
    integralAmiceCoefficients (R := R) μ n = algebraMap ℤ_[p] R (μ.amiceTransform.coeff n) := sorry
omit [IsUltrametricDist R] [CompleteSpace R] in
theorem integralAmiceCoefficients_norm (μ : D(ℤ_[p], ℤ_[p])) :
    ‖integralAmiceCoefficients (R := R) μ‖ ≤ ‖(1 : R)‖ := sorry
omit [IsUltrametricDist R] [CompleteSpace R] in
theorem integralAmiceCoefficients_zero : integralAmiceCoefficients (p := p) (R := R) 0 = 0 := sorry
omit [IsUltrametricDist R] [CompleteSpace R] in
theorem integralAmiceCoefficients_add (μ ν : D(ℤ_[p], ℤ_[p])) :
    integralAmiceCoefficients (R := R) (μ + ν) =
      integralAmiceCoefficients μ + integralAmiceCoefficients ν := sorry
omit [IsUltrametricDist R] [CompleteSpace R] in
theorem integralAmiceCoefficients_smul (a : ℤ_[p]) (μ : D(ℤ_[p], ℤ_[p])) :
    integralAmiceCoefficients (R := R) (a • μ) =
      algebraMap ℤ_[p] R a • integralAmiceCoefficients μ := sorry
theorem integralAmiceCoefficients_self (μ : D(ℤ_[p], ℤ_[p])) (n : ℕ) :
    integralAmiceCoefficients (R := ℤ_[p]) μ n = μ.amiceTransform.coeff n := sorry

/-- Extend integral coefficients on Z_p by the bounded inverse, in the existing measure type. -/
def extendIntegralCoefficients {p : ℕ} [Fact p.Prime] {R : Type*}
    [NormedCommRing R] [Algebra ℤ_[p] R] [IsUltrametricDist R]
    [CompleteSpace R] [IsBoundedSMul ℤ_[p] R]
    (μ : D(ℤ_[p], ℤ_[p])) : D(ℤ_[p], R) := sorry

theorem extendIntegralCoefficients_apply (μ : D(ℤ_[p], ℤ_[p])) (f : C(ℤ_[p], R)) :
    extendIntegralCoefficients μ f =
      ∑' n, PadicInt.mahlerEquiv R f n * algebraMap ℤ_[p] R (μ.amiceTransform.coeff n) := sorry
theorem amiceTransform_extendIntegralCoefficients (μ : D(ℤ_[p], ℤ_[p])) :
    (extendIntegralCoefficients (R := R) μ).amiceTransform =
      μ.amiceTransform.map (algebraMap ℤ_[p] R) := sorry
theorem extendIntegralCoefficients_test (μ : D(ℤ_[p], ℤ_[p])) (f : C(ℤ_[p], ℤ_[p])) :
    extendIntegralCoefficients (R := R) μ (f • (1 : C(ℤ_[p], R))) =
      algebraMap ℤ_[p] R (μ f) := sorry
theorem extendIntegralCoefficients_unique (μ : D(ℤ_[p], ℤ_[p])) (ν : D(ℤ_[p], R))
    (hν : ∀ f : C(ℤ_[p], ℤ_[p]),
      ν (f • (1 : C(ℤ_[p], R))) = algebraMap ℤ_[p] R (μ f)) :
    ν = extendIntegralCoefficients μ := sorry
theorem extendIntegralCoefficients_zero :
    extendIntegralCoefficients (p := p) (R := R) 0 = 0 := sorry
theorem extendIntegralCoefficients_add (μ ν : D(ℤ_[p], ℤ_[p])) :
    extendIntegralCoefficients (R := R) (μ + ν) =
      extendIntegralCoefficients μ + extendIntegralCoefficients ν := sorry
theorem extendIntegralCoefficients_smul (a : ℤ_[p]) (μ : D(ℤ_[p], ℤ_[p])) :
    extendIntegralCoefficients (R := R) (a • μ) =
      algebraMap ℤ_[p] R a • extendIntegralCoefficients μ := sorry
theorem extendIntegralCoefficients_self (μ : D(ℤ_[p], ℤ_[p])) :
    extendIntegralCoefficients (R := ℤ_[p]) μ = μ := sorry
theorem extendIntegralCoefficients_bound (μ : D(ℤ_[p], ℤ_[p])) (f : C(ℤ_[p], R)) :
    ‖extendIntegralCoefficients (R := R) μ f‖ ≤ ‖(1 : R)‖ * ‖f‖ := sorry
theorem extendIntegralCoefficients_dirac (x : ℤ_[p]) :
    extendIntegralCoefficients (R := R) (dirac ℤ_[p] x) = dirac R x := sorry
theorem extendIntegralCoefficients_map (μ : D(ℤ_[p], ℤ_[p])) (g : C(ℤ_[p], ℤ_[p])) :
    extendIntegralCoefficients (R := R) (map g μ) = map g (extendIntegralCoefficients μ) := sorry
theorem extendIntegralCoefficients_weight (μ : D(ℤ_[p], ℤ_[p])) (g : C(ℤ_[p], ℤ_[p])) :
    extendIntegralCoefficients (R := R) (weight g μ) =
      weight (g • (1 : C(ℤ_[p], R))) (extendIntegralCoefficients μ) := sorry
end BoundedCoefficients
end AbstractMeasure

namespace SuggestedTests.BoundedCoefficients
open AbstractMeasure
open scoped BoundedContinuousFunction

-- Assemble the pinned norm-bound constructor with the existing subtype norm.
-- The scratch regression checks this small receiving-instance proof completely.
local instance (p : ℕ) [Fact p.Prime] : IsBoundedSMul ℤ_[p] ℚ_[p] :=
  IsBoundedSMul.of_norm_smul_le (by sorry)

-- boundedMahlerPairing_constant
example : boundedMahlerPairing (p := 3)
    (BoundedContinuousFunction.const ℕ (1 / 3 : ℚ_[3])) (1 : C(ℤ_[3], ℚ_[3])) = 1 / 3 := sorry
-- boundedMahlerPairing_zero
example (f : C(ℤ_[3], ℚ_[3])) : boundedMahlerPairing (0 : ℕ →ᵇ ℚ_[3]) f = 0 := sorry
-- boundedMahlerPairing_integral
example (F : ℤ_[3]⟦X⟧) (c : ℕ →ᵇ ℤ_[3]) (hc : ∀ n, c n = F.coeff n)
    (f : C(ℤ_[3], ℤ_[3])) : boundedMahlerPairing c f = invTransform F f := sorry
-- boundedInvTransform_nonintegral
example : boundedInvTransform (p := 3)
    (BoundedContinuousFunction.const ℕ (1 / 3 : ℚ_[3])) (1 : C(ℤ_[3], ℚ_[3])) = 1 / 3 := sorry
-- boundedInvTransform_zero
example : boundedInvTransform (p := 3) (R := ℚ_[3]) 0 = 0 := sorry
-- boundedInvTransform_integral
example (F : ℤ_[3]⟦X⟧) (c : ℕ →ᵇ ℤ_[3]) (hc : ∀ n, c n = F.coeff n) :
    boundedInvTransform c = invTransform F := sorry
-- boundedInvTransform_unbounded (the excluded sequence cannot be packaged)
example : ¬ ∃ c : ℕ →ᵇ ℚ_[3], ∀ n, c n = ((3 : ℚ_[3]) ^ n)⁻¹ := sorry
-- The corresponding putative pairing has terms identically one, so it diverges.
example : ¬ Summable (fun n : ℕ => (3 : ℚ_[3]) ^ n * ((3 : ℚ_[3]) ^ n)⁻¹) := sorry
-- integralAmiceCoefficients_dirac_zero
example : integralAmiceCoefficients (R := ℚ_[3]) (dirac ℤ_[3] 0) 0 = 1 ∧
    integralAmiceCoefficients (R := ℚ_[3]) (dirac ℤ_[3] 0) 1 = 0 := sorry
-- integralAmiceCoefficients_zero
example (n : ℕ) : integralAmiceCoefficients (p := 3) (R := ℚ_[3]) 0 n = 0 := sorry
-- integralAmiceCoefficients_self
example (μ : D(ℤ_[3], ℤ_[3])) (n : ℕ) :
    integralAmiceCoefficients (R := ℤ_[3]) μ n = μ.amiceTransform.coeff n := sorry
-- extendIntegralCoefficients_square
example : extendIntegralCoefficients (R := ℚ_[3]) (dirac ℤ_[3] 2)
    ⟨fun x : ℤ_[3] => algebraMap ℤ_[3] ℚ_[3] (x ^ 2),
      (continuous_algebraMap _ _).comp (continuous_id.pow 2)⟩ = 4 := sorry
-- extendIntegralCoefficients_zero
example : extendIntegralCoefficients (p := 3) (R := ℚ_[3]) 0 = 0 := sorry
-- extendIntegralCoefficients_self
example (μ : D(ℤ_[3], ℤ_[3])) : extendIntegralCoefficients (R := ℤ_[3]) μ = μ := sorry
-- extendIntegralCoefficients_pushforward
example : extendIntegralCoefficients (R := ℚ_[3])
    (map ⟨fun x : ℤ_[3] => 2 * x, continuous_const.mul continuous_id⟩ (dirac ℤ_[3] 1)) =
      dirac ℚ_[3] 2 := sorry
-- extendIntegralCoefficients_weight
example : extendIntegralCoefficients (R := ℚ_[2])
    (weight (ContinuousMap.id ℤ_[2]) (dirac ℤ_[2] 3)) = (3 : ℚ_[2]) • dirac ℚ_[2] 3 := sorry
end SuggestedTests.BoundedCoefficients
