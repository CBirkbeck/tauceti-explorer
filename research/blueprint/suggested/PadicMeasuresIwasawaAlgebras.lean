import Mathlib.RingTheory.PowerSeries.Binomial
import Mathlib.LinearAlgebra.Finsupp.Defs
import Mathlib.RingTheory.PowerSeries.Expand
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.Topology.MetricSpace.Ultra.TotallySeparated
import Mathlib.NumberTheory.Padics.ProperSpace
import Mathlib.Topology.Sequences
import Mathlib.Analysis.Normed.Module.WeakDual
import Mathlib.NumberTheory.Padics.Measure.Topology
import Mathlib.Topology.Algebra.Module.Spaces.WeakDual
import Mathlib.Topology.Algebra.Group.Units
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


/-! Clopen restriction and the intrinsic unit-group carrier (RJW Remarks 3.31 and 3.33). -/
namespace ContinuousMap
open TopologicalSpace
variable {X : Type*} [TopologicalSpace X] [CompactSpace X]
variable (s : Clopens X) (R : Type*) [NormedCommRing R]

/-- Extend a test function by zero across the complementary clopen. -/
def zeroExtendClopen : C(s, R) →L[R] C(X, R) := sorry

theorem zeroExtendClopen_apply_mem (f : C(s, R)) (x : s) :
    zeroExtendClopen s R f x = f x := sorry

theorem zeroExtendClopen_apply_not_mem (f : C(s, R)) (x : X) (hx : x ∉ s) :
    zeroExtendClopen s R f x = 0 := sorry

theorem norm_zeroExtendClopen (f : C(s, R)) :
    letI : CompactSpace s := isCompact_iff_compactSpace.mp s.isClosed.isCompact
    ‖zeroExtendClopen s R f‖ = ‖f‖ := sorry

theorem restrict_zeroExtendClopen (f : C(s, R)) :
    (zeroExtendClopen s R f).restrict s = f := sorry

theorem zeroExtendClopen_restrict (f : C(X, R)) :
    zeroExtendClopen s R (f.restrict s) =
      (LocallyConstant.charFn R s.isClopen).toContinuousMap * f := sorry
end ContinuousMap

namespace AbstractMeasure
open TopologicalSpace
section Clopen
variable {X Y : Type*} [TopologicalSpace X] [CompactSpace X]
  [TopologicalSpace Y] [CompactSpace Y]
variable (s : Clopens X) (R : Type*) [NormedCommRing R]

/-- Restriction to the native measure carrier on the clopen subtype. -/
def restrictClopen : D(X, R) →ₗ[R] D(s, R) := sorry

theorem restrictClopen_apply (μ : D(X, R)) (f : C(s, R)) :
    restrictClopen s R μ f = μ (ContinuousMap.zeroExtendClopen s R f) := sorry

theorem restrictClopen_map_subtype (ν : D(s, R)) :
    restrictClopen s R (map (ContinuousMap.subtypeVal s) ν) = ν := sorry

theorem map_subtype_restrictClopen_apply (μ : D(X, R)) (f : C(X, R)) :
    map (ContinuousMap.subtypeVal s) (restrictClopen s R μ) f =
      μ ((LocallyConstant.charFn R s.isClopen).toContinuousMap * f) := sorry

theorem existsUnique_map_subtype_iff (μ : D(X, R)) :
    (∃! ν : D(s, R), map (ContinuousMap.subtypeVal s) ν = μ) ↔
      ∀ f : C(X, R), (∀ x : s, f x = 0) → μ f = 0 := sorry

theorem map_subtype_restrictClopen_add_compl (μ : D(X, R)) :
    map (ContinuousMap.subtypeVal s) (restrictClopen s R μ) +
      map (ContinuousMap.subtypeVal (sᶜ : Clopens X)) (restrictClopen (sᶜ : Clopens X) R μ) = μ := sorry

/-- The two complementary restrictions, inverse to the sum of native pushforwards. -/
def clopenDecomposition : D(X, R) ≃ₗ[R] D(s, R) × D((sᶜ : Clopens X), R) := sorry

theorem clopenDecomposition_apply (μ : D(X, R)) :
    clopenDecomposition s R μ = (restrictClopen s R μ, restrictClopen (sᶜ : Clopens X) R μ) := sorry

theorem clopenDecomposition_symm_apply (ν : D(s, R)) (η : D((sᶜ : Clopens X), R)) :
    (clopenDecomposition s R).symm (ν, η) =
      map (ContinuousMap.subtypeVal s) ν + map (ContinuousMap.subtypeVal (sᶜ : Clopens X)) η := sorry

theorem restrictClopen_dirac_mem (x : s) :
    restrictClopen s R (dirac R (x : X)) = dirac R x := sorry

theorem restrictClopen_dirac_not_mem (x : X) (hx : x ∉ s) :
    restrictClopen s R (dirac R x) = 0 := sorry

theorem restrictClopen_map_preimage (q : C(X, Y)) (t : Clopens Y) (μ : D(X, R)) :
    restrictClopen t R (map q μ) =
      map (q.restrictPreimage t)
        (restrictClopen ⟨q ⁻¹' (t : Set Y), t.isClopen.preimage q.continuous⟩ R μ) := sorry
end Clopen
end AbstractMeasure

namespace PadicInt
open TopologicalSpace
variable (p : ℕ) [Fact p.Prime]

theorem isClopen_isUnit : IsClopen {x : ℤ_[p] | IsUnit x} := sorry

/-- Identify native units, with their native topology, with the clopen unit locus. -/
def unitsHomeomorphIsUnit : (ℤ_[p])ˣ ≃ₜ {x : ℤ_[p] // IsUnit x} := sorry

theorem unitsHomeomorphIsUnit_apply (u : (ℤ_[p])ˣ) :
    (unitsHomeomorphIsUnit p u).val = (u : ℤ_[p]) := sorry

theorem unitsHomeomorphIsUnit_symm_apply (x : {x : ℤ_[p] // IsUnit x}) :
    ((unitsHomeomorphIsUnit p).symm x : ℤ_[p]) = x.val := sorry
end PadicInt

namespace AbstractMeasure
section IntrinsicUnits
variable (p : ℕ) [Fact p.Prime] (R : Type*) [NormedCommRing R]
local notation "uMap" => (ContinuousMap.mk Units.val Units.continuous_val : C((ℤ_[p])ˣ, ℤ_[p]))
local notation "uClopen" => (TopologicalSpace.Clopens.mk (fun x : ℤ_[p] => IsUnit x) (PadicInt.isClopen_isUnit p) :
  TopologicalSpace.Clopens ℤ_[p])

/-- Restrict to the unit locus and transport to the existing units type. -/
def restrictUnits : D(ℤ_[p], R) →ₗ[R] D((ℤ_[p])ˣ, R) := sorry

theorem restrictUnits_eq_transport (μ : D(ℤ_[p], R)) :
    restrictUnits p R μ = arrowCongrLeft (PadicInt.unitsHomeomorphIsUnit p).symm
      (restrictClopen uClopen R μ) := sorry

theorem restrictUnits_apply (μ : D(ℤ_[p], R)) (f : C((ℤ_[p])ˣ, R)) :
    restrictUnits p R μ f = μ (ContinuousMap.zeroExtendClopen uClopen R
      (f.comp ⟨(PadicInt.unitsHomeomorphIsUnit p).symm, (PadicInt.unitsHomeomorphIsUnit p).symm.continuous⟩)) := sorry

theorem restrictUnits_map_val (ν : D((ℤ_[p])ˣ, R)) :
    restrictUnits p R (map uMap ν) = ν := sorry

theorem map_val_restrictUnits (μ : D(ℤ_[p], R)) :
    map uMap (restrictUnits p R μ) = unitRestriction p R μ := sorry

/-- A linear equivalence: the multiplicative and additive convolutions are distinct. -/
def unitsMeasureEquivKerPsi : D((ℤ_[p])ˣ, R) ≃ₗ[R] LinearMap.ker (psiMeasure p R) := sorry

theorem unitsMeasureEquivKerPsi_apply (ν : D((ℤ_[p])ˣ, R)) :
    (unitsMeasureEquivKerPsi p R ν).val = map uMap ν := sorry

theorem unitsMeasureEquivKerPsi_symm_apply (μ : LinearMap.ker (psiMeasure p R)) :
    (unitsMeasureEquivKerPsi p R).symm μ = restrictUnits p R μ.val := sorry

theorem restrictUnits_dirac (u : (ℤ_[p])ˣ) :
    restrictUnits p R (dirac R (u : ℤ_[p])) = dirac R u := sorry

theorem restrictUnits_dirac_nonunit (x : ℤ_[p]) (hx : ¬ IsUnit x) :
    restrictUnits p R (dirac R x) = 0 := sorry
end IntrinsicUnits

/-- Integral unit measures identify with the kernel of the already planned bounded series ψ. -/
def unitsMeasureAmiceEquiv (p : ℕ) [Fact p.Prime] :
    D((ℤ_[p])ˣ, ℤ_[p]) ≃ₗ[ℤ_[p]] LinearMap.ker (psiSeries p) := sorry

theorem unitsMeasureAmiceEquiv_apply (p : ℕ) [Fact p.Prime]
    (ν : D((ℤ_[p])ˣ, ℤ_[p])) :
    (unitsMeasureAmiceEquiv p ν).val =
      (map (ContinuousMap.mk Units.val Units.continuous_val : C((ℤ_[p])ˣ, ℤ_[p])) ν).amiceTransform := sorry

theorem unitsMeasureAmiceEquiv_symm_apply (p : ℕ) [Fact p.Prime]
    (F : LinearMap.ker (psiSeries p)) :
    (unitsMeasureAmiceEquiv p).symm F =
      restrictUnits p ℤ_[p] ((amiceTransformEquiv (p := p)).symm F.val) := sorry
end AbstractMeasure


namespace SuggestedTests.Clopen
open AbstractMeasure ContinuousMap TopologicalSpace PowerSeries
local notation "S" => (Clopens.mk (Set.singleton (0 : Fin 2)) (isClopen_discrete _) : Clopens (Fin 2))

-- clopen_zero_extension_inside
example : zeroExtendClopen S ℤ (ContinuousMap.const S 7) 0 = 7 := sorry
-- clopen_zero_extension_outside
example : zeroExtendClopen S ℤ (ContinuousMap.const S 7) 1 = 0 := sorry
-- clopen_zero_extension_empty
example : zeroExtendClopen (⊥ : Clopens (Fin 2)) ℤ 0 = 0 := sorry
-- clopen_zero_extension_full
example : zeroExtendClopen (⊤ : Clopens (Fin 2)) ℤ
    (ContinuousMap.const (⊤ : Clopens (Fin 2)) 7) = ContinuousMap.const (Fin 2) 7 := sorry

-- clopen_restriction_signed_atoms
example : restrictClopen S ℤ ((2 : ℤ) • dirac ℤ (0 : Fin 2) - (3 : ℤ) • dirac ℤ (1 : Fin 2)) =
    (2 : ℤ) • dirac ℤ (⟨0, by change (0 : Fin 2) = 0; rfl⟩ : S) := sorry
-- clopen_restriction_outside
example : restrictClopen S ℤ (dirac ℤ (1 : Fin 2)) = 0 := sorry
-- clopen_restriction_empty
example (μ : D(Fin 2, ℤ)) : restrictClopen (⊥ : Clopens (Fin 2)) ℤ μ = 0 := sorry
-- clopen_restriction_section
example (ν : D(S, ℤ)) : restrictClopen S ℤ (map (ContinuousMap.subtypeVal S) ν) = ν := sorry

-- clopen_decomposition_signed_atoms
example : clopenDecomposition S ℤ
    ((2 : ℤ) • dirac ℤ (0 : Fin 2) - (3 : ℤ) • dirac ℤ (1 : Fin 2)) =
      ((2 : ℤ) • dirac ℤ (⟨0, by change (0 : Fin 2) = 0; rfl⟩ : S),
       (-3 : ℤ) • dirac ℤ (⟨1, by change ¬ (1 : Fin 2) = 0; decide⟩ : (Sᶜ : Clopens (Fin 2)))) := sorry
-- clopen_decomposition_inverse
example : (clopenDecomposition S ℤ).symm
    (dirac ℤ (⟨0, by change (0 : Fin 2) = 0; rfl⟩ : S), dirac ℤ (⟨1, by change ¬ (1 : Fin 2) = 0; decide⟩ : (Sᶜ : Clopens (Fin 2)))) =
      dirac ℤ (0 : Fin 2) + dirac ℤ (1 : Fin 2) := sorry
-- clopen_decomposition_zero
example : clopenDecomposition S ℤ 0 = (0, 0) := sorry

-- units_homeomorph_one
example : (PadicInt.unitsHomeomorphIsUnit 3 (1 : (ℤ_[3])ˣ)).val = 1 := sorry
-- units_homeomorph_dyadic_sign
example : (PadicInt.unitsHomeomorphIsUnit 2 (-1 : (ℤ_[2])ˣ)).val = -1 := sorry
-- units_homeomorph_inverse
example : (PadicInt.unitsHomeomorphIsUnit 2).symm ⟨1, isUnit_one⟩ = 1 := sorry
-- units_homeomorph_excludes_zero
example (u : (ℤ_[3])ˣ) : (PadicInt.unitsHomeomorphIsUnit 3 u).val ≠ 0 := sorry

-- intrinsic_units_mixed_atoms
example : restrictUnits 3 ℤ_[3] (dirac ℤ_[3] 1 + (2 : ℤ_[3]) • dirac ℤ_[3] 3) =
    dirac ℤ_[3] (1 : (ℤ_[3])ˣ) := sorry
-- intrinsic_units_zero_atom
example : restrictUnits 3 ℤ_[3] (dirac ℤ_[3] 0) = 0 := sorry
-- intrinsic_units_nonzero_nonunit
example : restrictUnits 3 ℤ_[3] (dirac ℤ_[3] 3) = 0 := sorry
-- intrinsic_units_dyadic_sign
example : restrictUnits 2 ℤ_[2] (dirac ℤ_[2] (-1) - dirac ℤ_[2] 0) =
    dirac ℤ_[2] (-1 : (ℤ_[2])ˣ) := sorry

-- units_kernel_zero
example : unitsMeasureEquivKerPsi 3 ℤ_[3] 0 = 0 := sorry
-- units_kernel_atom
example : (unitsMeasureEquivKerPsi 3 ℤ_[3] (dirac ℤ_[3] (1 : (ℤ_[3])ˣ))).val =
    dirac ℤ_[3] 1 := sorry
-- units_kernel_dyadic_sign
example : (unitsMeasureEquivKerPsi 2 ℤ_[2] (dirac ℤ_[2] (-1 : (ℤ_[2])ˣ))).val =
    dirac ℤ_[2] (-1) := sorry

-- units_amice_zero
example : unitsMeasureAmiceEquiv 3 0 = 0 := sorry
-- units_amice_one_atom
example : (unitsMeasureAmiceEquiv 3 (dirac ℤ_[3] (1 : (ℤ_[3])ˣ))).val = 1 + X := sorry
-- units_amice_dyadic_first_moment
example : coeff 1
    (unitsMeasureAmiceEquiv 2 (dirac ℤ_[2] (-1 : (ℤ_[2])ˣ))).val = -1 := sorry
-- units_amice_two_atoms_mass
example : coeff 0 (unitsMeasureAmiceEquiv 3
    (dirac ℤ_[3] (1 : (ℤ_[3])ˣ) + dirac ℤ_[3] (-1 : (ℤ_[3])ˣ))).val = 2 := sorry
-- units_kernel_different_convolutions
example :
    map (⟨fun z : ℤ_[2] × ℤ_[2] => z.1 + z.2, continuous_fst.add continuous_snd⟩)
      (prodMk (dirac ℤ_[2] 1) (dirac ℤ_[2] 1)) ≠
    map (⟨Units.val, Units.continuous_val⟩ : C((ℤ_[2])ˣ, ℤ_[2]))
      (map (⟨fun z : (ℤ_[2])ˣ × (ℤ_[2])ˣ => z.1 * z.2,
        continuous_fst.mul continuous_snd⟩)
        (prodMk (dirac ℤ_[2] (1 : (ℤ_[2])ˣ)) (dirac ℤ_[2] (1 : (ℤ_[2])ˣ)))) := sorry
end SuggestedTests.Clopen

/-! Topologies on the existing measure carrier. The native definitions are
selected locally; neither one is installed as a global instance. -/
namespace AbstractMeasure
open TopologicalSpace

section WeakClopen
variable {X Y R : Type*} [TopologicalSpace X] [TopologicalSpace Y]
  [CompactSpace X] [CompactSpace Y] [NormedCommRing R]

theorem continuous_map_weak (q : C(X,Y)) :
    letI : TopologicalSpace D(X,R) := WeakTopology
    letI : TopologicalSpace D(Y,R) := WeakTopology
    Continuous (map (R := R) (E := R) q) := by sorry

theorem continuous_restrictClopen_weak (s : Clopens X) :
    letI : TopologicalSpace D(X,R) := WeakTopology
    letI : TopologicalSpace D(s,R) := WeakTopology
    Continuous (restrictClopen s R) := by sorry

theorem isClosedEmbedding_map_subtype_weak (s : Clopens X) :
    letI : TopologicalSpace D(X,R) := WeakTopology
    letI : TopologicalSpace D(s,R) := WeakTopology
    Topology.IsClosedEmbedding (map (R := R) (E := R) (ContinuousMap.subtypeVal (s : Set X))) := by sorry

theorem isHomeomorph_clopenDecomposition_weak (s : Clopens X) :
    letI : TopologicalSpace D(X,R) := WeakTopology
    letI : TopologicalSpace D(s,R) := WeakTopology
    letI : TopologicalSpace D((sᶜ : Clopens X),R) := WeakTopology
    IsHomeomorph (clopenDecomposition s R) := by sorry
end WeakClopen

section StrongClopen
variable {X Y K : Type*} [TopologicalSpace X] [TopologicalSpace Y]
  [CompactSpace X] [CompactSpace Y] [NontriviallyNormedField K]

theorem norm_map_le (q : C(X,Y)) (μ : D(X,K)) :
    ‖toCLMEquiv (map q μ)‖ ≤ ‖toCLMEquiv μ‖ := by sorry

theorem norm_restrictClopen_le (s : Clopens X) (μ : D(X,K)) :
    letI : CompactSpace s := isCompact_iff_compactSpace.mp s.isClosed.isCompact
    ‖toCLMEquiv (restrictClopen s K μ)‖ ≤ ‖toCLMEquiv μ‖ := by sorry

theorem norm_map_subtype (s : Clopens X) (ν : D(s,K)) :
    letI : CompactSpace s := isCompact_iff_compactSpace.mp s.isClosed.isCompact
    ‖toCLMEquiv (map (R := K) (E := K) (ContinuousMap.subtypeVal (s : Set X)) ν)‖ = ‖toCLMEquiv ν‖ := by sorry

theorem isClosedEmbedding_map_subtype_strong (s : Clopens X) :
    letI : CompactSpace s := isCompact_iff_compactSpace.mp s.isClosed.isCompact
    letI : TopologicalSpace D(X,K) := StrongTopology
    letI : TopologicalSpace D(s,K) := StrongTopology
    Topology.IsClosedEmbedding (map (R := K) (E := K) (ContinuousMap.subtypeVal (s : Set X))) := by sorry

theorem isHomeomorph_clopenDecomposition_strong (s : Clopens X) :
    letI : CompactSpace s := isCompact_iff_compactSpace.mp s.isClosed.isCompact
    letI : CompactSpace (sᶜ : Clopens X) := isCompact_iff_compactSpace.mp s.isClopen.compl.isClosed.isCompact
    letI : TopologicalSpace D(X,K) := StrongTopology
    letI : TopologicalSpace D(s,K) := StrongTopology
    letI : TopologicalSpace D((sᶜ : Clopens X),K) := StrongTopology
    IsHomeomorph (clopenDecomposition s K) := by sorry
end StrongClopen

section WeakUnits
variable (p : ℕ) [Fact p.Prime] (R : Type*) [NormedCommRing R]

theorem continuous_restrictUnits_weak :
    letI : TopologicalSpace D(ℤ_[p],R) := WeakTopology
    letI : TopologicalSpace D((ℤ_[p])ˣ,R) := WeakTopology
    Continuous (restrictUnits p R) := by sorry

theorem isHomeomorph_unitsMeasureEquivKerPsi_weak :
    letI : TopologicalSpace D(ℤ_[p],R) := WeakTopology
    letI : TopologicalSpace D((ℤ_[p])ˣ,R) := WeakTopology
    IsHomeomorph (unitsMeasureEquivKerPsi p R) := by sorry
end WeakUnits

section IntegralAmiceTopology
open scoped PowerSeries.WithPiTopology
variable (p : ℕ) [Fact p.Prime]

theorem isHomeomorph_amiceTransformEquiv_weak :
    letI : TopologicalSpace D(ℤ_[p],ℤ_[p]) := WeakTopology
    IsHomeomorph (amiceTransformEquiv (p := p)) := by sorry

theorem isHomeomorph_unitsMeasureAmiceEquiv_weak :
    letI : TopologicalSpace D((ℤ_[p])ˣ,ℤ_[p]) := WeakTopology
    IsHomeomorph (unitsMeasureAmiceEquiv p) := by sorry
end IntegralAmiceTopology

section StrongUnits
variable (p : ℕ) [Fact p.Prime] (K : Type*) [NontriviallyNormedField K]
local notation "uMap" => (ContinuousMap.mk Units.val Units.continuous_val : C((ℤ_[p])ˣ, ℤ_[p]))

theorem norm_map_units_val (ν : D((ℤ_[p])ˣ,K)) :
    ‖toCLMEquiv (map uMap ν)‖ = ‖toCLMEquiv ν‖ := by sorry

theorem isHomeomorph_unitsMeasureEquivKerPsi_strong :
    letI : TopologicalSpace D(ℤ_[p],K) := StrongTopology
    letI : TopologicalSpace D((ℤ_[p])ˣ,K) := StrongTopology
    IsHomeomorph (unitsMeasureEquivKerPsi p K) := by sorry
end StrongUnits
end AbstractMeasure

namespace SuggestedTests.ClopenTopology
open AbstractMeasure TopologicalSpace Filter
open scoped Topology PowerSeries.WithPiTopology

-- ClopenTopologyTests.weak_scaled_dirac: convergence can be tested pointwise.
example (q : C(ℤ_[3], ℤ_[3])) :
    letI : TopologicalSpace D(ℤ_[3],ℤ_[3]) := WeakTopology
    Tendsto (fun n : ℕ => map q ((3 : ℤ_[3])^n • dirac ℤ_[3] 1)) atTop
      (𝓝 (0 : D(ℤ_[3],ℤ_[3]))) := by sorry
-- ClopenTopologyTests.empty_restriction: empty restriction has norm zero.
example (μ : D(ℤ_[3],ℚ_[3])) :
    let s : Clopens ℤ_[3] := ⊥
    letI : CompactSpace s := isCompact_iff_compactSpace.mp s.isClosed.isCompact
    ‖toCLMEquiv (restrictClopen s ℚ_[3] μ)‖ = 0 := by sorry
-- ClopenTopologyTests.full_inclusion: the full clopen preserves norm.
example (ν : D((⊤ : Clopens ℤ_[3]),ℚ_[3])) :
    letI : CompactSpace (⊤ : Clopens ℤ_[3]) :=
      isCompact_iff_compactSpace.mp (⊤ : Clopens ℤ_[3]).isClosed.isCompact
    ‖toCLMEquiv (map (R := ℚ_[3]) (E := ℚ_[3]) (ContinuousMap.subtypeVal ((⊤ : Clopens ℤ_[3]) : Set ℤ_[3])) ν)‖ =
      ‖toCLMEquiv ν‖ := by sorry
-- ClopenTopologyTests.dropped_atom: restriction need not preserve norm.
example :
    let s : Clopens ℤ_[3] := ⊥
    letI : CompactSpace s := isCompact_iff_compactSpace.mp s.isClosed.isCompact
    ‖toCLMEquiv (restrictClopen s ℚ_[3] (dirac ℚ_[3] 0))‖ <
      ‖toCLMEquiv (dirac ℚ_[3] (0 : ℤ_[3]))‖ := by sorry
-- ClopenTopologyTests.unit_atom_norm: no missing normalization on inclusion.
example :
    ‖toCLMEquiv (map (ContinuousMap.mk Units.val Units.continuous_val : C((ℤ_[2])ˣ,ℤ_[2]))
      (dirac ℚ_[2] (1 : (ℤ_[2])ˣ)))‖ = 1 := by sorry
-- ClopenTopologyTests.amice_monomials: weak convergence is coefficientwise.
example :
    letI : TopologicalSpace D(ℤ_[3],ℤ_[3]) := WeakTopology
    Tendsto (fun n : ℕ => (amiceTransformEquiv (p := 3)).symm
      ((PowerSeries.X : PowerSeries ℤ_[3])^n)) atTop (𝓝 0) := by sorry
-- ClopenTopologyTests.dyadic_unit_kernel: both directions use the native units group.
example :
    letI : TopologicalSpace D((ℤ_[2])ˣ,ℤ_[2]) := WeakTopology
    Continuous (unitsMeasureAmiceEquiv 2).symm := by sorry
end SuggestedTests.ClopenTopology

/-! ## Bounded Amice norm and the rational integral lattice

Every norm below is on the existing field-valued continuous dual via
`toCLMEquiv`. No norm instance is added to integral AbstractMeasure.
-/
namespace AbstractMeasure
open scoped BoundedContinuousFunction
section FieldAmice
variable {p : ℕ} [Fact p.Prime]
variable {K : Type*} [NontriviallyNormedField K] [Algebra ℤ_[p] K]
  [IsBoundedSMul ℤ_[p] K]

theorem norm_coeff_amiceTransform_le (μ : D(ℤ_[p], K)) (n : ℕ) :
    ‖μ.amiceTransform.coeff n‖ ≤ ‖toCLMEquiv μ‖ := by sorry

/-- The existing Amice coefficients, bundled in the native bounded sequence space. -/
def boundedAmiceCoefficients : D(ℤ_[p], K) →ₗ[K] (ℕ →ᵇ K) := by sorry

theorem boundedAmiceCoefficients_apply (μ : D(ℤ_[p], K)) (n : ℕ) :
    boundedAmiceCoefficients μ n = μ.amiceTransform.coeff n := by sorry

theorem boundedAmiceCoefficients_zero :
    boundedAmiceCoefficients (p := p) (K := K) 0 = 0 := by sorry

theorem boundedAmiceCoefficients_add (μ ν : D(ℤ_[p], K)) :
    boundedAmiceCoefficients (μ + ν) =
      boundedAmiceCoefficients μ + boundedAmiceCoefficients ν := by sorry

theorem boundedAmiceCoefficients_smul (a : K) (μ : D(ℤ_[p], K)) :
    boundedAmiceCoefficients (a • μ) = a • boundedAmiceCoefficients μ := by sorry

theorem boundedAmiceCoefficients_norm_le (μ : D(ℤ_[p], K)) :
    ‖boundedAmiceCoefficients μ‖ ≤ ‖toCLMEquiv μ‖ := by sorry

variable [IsUltrametricDist K] [CompleteSpace K]

theorem norm_boundedInvTransform (c : ℕ →ᵇ K) :
    ‖toCLMEquiv (boundedInvTransform (p := p) c)‖ = ‖c‖ := by sorry

theorem boundedInvTransform_boundedAmiceCoefficients (μ : D(ℤ_[p], K)) :
    boundedInvTransform (boundedAmiceCoefficients μ) = μ := by sorry

/-- The strong continuous-dual model is isometric to bounded Amice sequences. -/
def boundedAmiceEquiv : (C(ℤ_[p], K) →L[K] K) ≃ₗᵢ[K] (ℕ →ᵇ K) := by sorry

theorem boundedAmiceEquiv_apply (μ : D(ℤ_[p], K)) :
    boundedAmiceEquiv (toCLMEquiv μ) = boundedAmiceCoefficients μ := by sorry

theorem boundedAmiceEquiv_symm_apply (c : ℕ →ᵇ K) :
    (boundedAmiceEquiv (p := p)).symm c =
      toCLMEquiv (boundedInvTransform c) := by sorry

theorem boundedAmiceCoefficients_norm (μ : D(ℤ_[p], K)) :
    ‖boundedAmiceCoefficients μ‖ = ‖toCLMEquiv μ‖ := by sorry

theorem mem_range_amiceTransform_iff (F : K⟦X⟧) :
    (∃ μ : D(ℤ_[p], K), μ.amiceTransform = F) ↔
      ∃ C : ℝ, 0 ≤ C ∧ ∀ n, ‖F.coeff n‖ ≤ C := by sorry
end FieldAmice

section RationalIntegralLattice
variable {p : ℕ} [Fact p.Prime] [IsBoundedSMul ℤ_[p] ℚ_[p]]

theorem extendIntegralCoefficients_injective :
    Function.Injective (extendIntegralCoefficients (p := p) (R := ℚ_[p])) := by sorry

theorem norm_extendIntegralCoefficients (μ : D(ℤ_[p], ℤ_[p])) :
    ‖toCLMEquiv (extendIntegralCoefficients (R := ℚ_[p]) μ)‖ =
      ‖integralAmiceCoefficients (R := ℚ_[p]) μ‖ := by sorry

theorem integral_extension_iff_norm_le_one (ν : D(ℤ_[p], ℚ_[p])) :
    (∃! μ : D(ℤ_[p], ℤ_[p]), extendIntegralCoefficients (R := ℚ_[p]) μ = ν) ↔
      ‖toCLMEquiv ν‖ ≤ 1 := by sorry

theorem isClosed_range_integral_extension :
    IsClosed (Set.range (fun μ : D(ℤ_[p], ℤ_[p]) =>
      toCLMEquiv (extendIntegralCoefficients (R := ℚ_[p]) μ))) := by sorry

theorem exists_integral_power_scaling (ν : D(ℤ_[p], ℚ_[p])) :
    ∃ n : ℕ, ∃ μ : D(ℤ_[p], ℤ_[p]),
      ν = (((p : ℚ_[p]) ^ n)⁻¹) • extendIntegralCoefficients μ := by sorry
end RationalIntegralLattice
end AbstractMeasure

namespace SuggestedTests.BoundedAmiceNorm
open AbstractMeasure
open scoped BoundedContinuousFunction
local instance (p : ℕ) [Fact p.Prime] : IsBoundedSMul ℤ_[p] ℚ_[p] :=
  IsBoundedSMul.of_norm_smul_le (by sorry)

-- bounded_coefficients_dirac_zero
example : boundedAmiceCoefficients (dirac ℚ_[3] (0 : ℤ_[3])) 0 = 1 ∧
    boundedAmiceCoefficients (dirac ℚ_[3] (0 : ℤ_[3])) 1 = 0 := by sorry
-- bounded_coefficients_nonintegral
example : boundedAmiceCoefficients ((1 / 3 : ℚ_[3]) • dirac ℚ_[3] (0 : ℤ_[3])) 0 =
    1 / 3 := by sorry
-- bounded_coefficients_zero
example : boundedAmiceCoefficients (p := 2) (K := ℚ_[2]) 0 = 0 := by sorry
-- bounded_isometry_dirac
example : ‖boundedAmiceEquiv (toCLMEquiv (dirac ℚ_[2] (1 : ℤ_[2])))‖ = 1 := by sorry
-- bounded_isometry_nonintegral
example : ‖boundedAmiceEquiv (toCLMEquiv
    ((1 / 3 : ℚ_[3]) • dirac ℚ_[3] (0 : ℤ_[3])))‖ = 3 := by sorry
-- bounded_isometry_constant_inverse
example : (boundedAmiceEquiv (p := 3)).symm
    (BoundedContinuousFunction.const ℕ (1 / 3 : ℚ_[3])) (1 : C(ℤ_[3], ℚ_[3])) =
    1 / 3 := by sorry
-- unit_ball_excludes_nonintegral_dirac
example : ¬ ∃ μ : D(ℤ_[3], ℤ_[3]), extendIntegralCoefficients (R := ℚ_[3]) μ =
    (1 / 3 : ℚ_[3]) • dirac ℚ_[3] (0 : ℤ_[3]) := by sorry
-- dyadic_integral_scaling
example : (1 / 2 : ℚ_[2]) • dirac ℚ_[2] (1 : ℤ_[2]) =
    ((2 : ℚ_[2]) ^ 1)⁻¹ • extendIntegralCoefficients (dirac ℤ_[2] (1 : ℤ_[2])) := by sorry
end SuggestedTests.BoundedAmiceNorm

/-! Weak/norm topology continuation on native measure carriers. -/
namespace AbstractMeasure
open Filter Topology
section DiracTopology
variable {X R : Type*} [TopologicalSpace X] [NormedCommRing R]

theorem continuous_dirac_weak :
    @Continuous X D(X,R) _ WeakTopology (dirac R) := by sorry

variable {K : Type*} [NontriviallyNormedField K] [CompactSpace X]
theorem norm_dirac (x : X) : ‖toCLMEquiv (dirac K x)‖ = 1 := by sorry

theorem norm_dirac_sub (hK : ∀ a b : K, ‖a+b‖ ≤ max ‖a‖ ‖b‖)
    [TotallySeparatedSpace X] {x y : X} (hxy : x ≠ y) :
    ‖toCLMEquiv (dirac K x - dirac K y)‖ = 1 := by sorry

theorem not_isCompact_measure_unitBall [Infinite X] [TotallySeparatedSpace X]
    (hK : ∀ a b : K, ‖a+b‖ ≤ max ‖a‖ ‖b‖) :
    ¬ IsCompact {L : C(X,K) →L[K] K | ‖L‖ ≤ 1} := by sorry
end DiracTopology

section PrimePowerTopology
variable (p : ℕ) [Fact p.Prime]

theorem tendsto_dirac_prime_powers_weak (R : Type*) [NormedCommRing R] :
    letI : TopologicalSpace D(ℤ_[p],R) := WeakTopology
    Tendsto (fun n : ℕ => dirac R ((p : ℤ_[p])^n))
      atTop (𝓝 (dirac R 0)) := by sorry

theorem norm_dirac_prime_powers_sub_zero (n : ℕ) :
    ‖toCLMEquiv (dirac ℚ_[p] ((p : ℤ_[p])^n) - dirac ℚ_[p] 0)‖ = 1 := by sorry

theorem not_tendsto_dirac_prime_powers_strong :
    ¬ Tendsto (fun n : ℕ => toCLMEquiv (dirac ℚ_[p] ((p : ℤ_[p])^n)))
      atTop (𝓝 (toCLMEquiv (dirac ℚ_[p] 0))) := by sorry
end PrimePowerTopology
end AbstractMeasure

namespace ContinuousMap
variable {X : Type*} [TopologicalSpace X] [CompactSpace X]
variable (p : ℕ) [Fact p.Prime]

theorem exists_integral_test_scaling (f : C(X,ℚ_[p])) :
    ∃ n : ℕ, ∃ g : C(X,ℤ_[p]), ∀ x, (g x : ℚ_[p]) = (p : ℚ_[p])^n * f x := by sorry
end ContinuousMap

namespace AbstractMeasure
open Topology
open scoped PowerSeries.WithPiTopology
variable (p : ℕ) [Fact p.Prime]

theorem compactSpace_integralMeasures_weak :
    letI : TopologicalSpace D(ℤ_[p],ℤ_[p]) := WeakTopology
    CompactSpace D(ℤ_[p],ℤ_[p]) := by sorry

variable [IsBoundedSMul ℤ_[p] ℚ_[p]]
theorem continuous_extendIntegralCoefficients_weak :
    @Continuous D(ℤ_[p],ℤ_[p]) D(ℤ_[p],ℚ_[p]) WeakTopology WeakTopology
      (extendIntegralCoefficients (p := p) (R := ℚ_[p])) := by sorry

theorem isClosedEmbedding_extendIntegralCoefficients_weak :
    letI : TopologicalSpace D(ℤ_[p],ℤ_[p]) := WeakTopology
    letI : TopologicalSpace D(ℤ_[p],ℚ_[p]) := WeakTopology
    IsClosedEmbedding (extendIntegralCoefficients (p := p) (R := ℚ_[p])) := by sorry
end AbstractMeasure

namespace WeakNormTests
open AbstractMeasure Filter Topology
local instance (p : ℕ) [Fact p.Prime] : IsBoundedSMul ℤ_[p] ℚ_[p] :=
  IsBoundedSMul.of_norm_smul_le (by sorry)

-- WeakNormTests.dyadic_dirac_difference
example : ‖toCLMEquiv (dirac ℚ_[2] (0 : ℤ_[2]) - dirac ℚ_[2] 1)‖ = 1 := by sorry
-- WeakNormTests.equal_dirac_points
example : ‖toCLMEquiv (dirac ℚ_[3] (0 : ℤ_[3]) - dirac ℚ_[3] 0)‖ = 0 := by sorry
-- WeakNormTests.integral_dyadic_weak_limit
example :
    letI : TopologicalSpace D(ℤ_[2],ℤ_[2]) := WeakTopology
    Tendsto (fun n : ℕ => dirac ℤ_[2] ((2 : ℤ_[2])^n)) atTop (𝓝 (dirac ℤ_[2] 0)) := by sorry
-- WeakNormTests.ternary_weak_not_strong
example :
    (letI : TopologicalSpace D(ℤ_[3],ℚ_[3]) := WeakTopology;
      Tendsto (fun n : ℕ => dirac ℚ_[3] ((3 : ℤ_[3])^n)) atTop (𝓝 (dirac ℚ_[3] 0))) ∧
    ¬ Tendsto (fun n : ℕ => toCLMEquiv (dirac ℚ_[3] ((3 : ℤ_[3])^n)))
      atTop (𝓝 (toCLMEquiv (dirac ℚ_[3] 0))) := by sorry
-- WeakNormTests.nonintegral_constant_scaling
example :
    (∀ x : ℤ_[3], ((ContinuousMap.const ℤ_[3] (1 : ℤ_[3])) x : ℚ_[3]) =
      (3 : ℚ_[3]) * (ContinuousMap.const ℤ_[3] (1/3 : ℚ_[3])) x) ∧
    ¬ ∃ g : C(ℤ_[3],ℤ_[3]), ∀ x, (g x : ℚ_[3]) = (1/3 : ℚ_[3]) := by sorry
-- WeakNormTests.dyadic_integral_weak_embedding
example :
    letI : TopologicalSpace D(ℤ_[2],ℤ_[2]) := WeakTopology
    letI : TopologicalSpace D(ℤ_[2],ℚ_[2]) := WeakTopology
    IsClosedEmbedding (extendIntegralCoefficients (p := 2) (R := ℚ_[2])) := by sorry
-- WeakNormTests.amice_monomial_norm
example (n : ℕ) :
    ‖toCLMEquiv (extendIntegralCoefficients (R := ℚ_[3])
      ((amiceTransformEquiv (p := 3)).symm (PowerSeries.X ^ n)))‖ = 1 := by sorry
end WeakNormTests

/-! ## Integral coefficient extension on the native unit domain

The norm is always that of the rational native continuous dual. The integral
carrier receives no new norm or topology instance in this specification.
-/
namespace AbstractMeasure
section UnitIntegralCoefficients
variable {p : ℕ} [Fact p.Prime] {R : Type*}
  [NormedCommRing R] [Algebra ℤ_[p] R] [IsUltrametricDist R]
  [CompleteSpace R] [IsBoundedSMul ℤ_[p] R]
local notation "U" => (ℤ_[p])ˣ
local notation "uMap" => (ContinuousMap.mk Units.val Units.continuous_val : C(U, ℤ_[p]))

theorem extendIntegralCoefficients_unitRestriction (μ : D(ℤ_[p], ℤ_[p])) :
    extendIntegralCoefficients (R := R) (unitRestriction p ℤ_[p] μ) =
      unitRestriction p R (extendIntegralCoefficients μ) := by sorry

def extendIntegralUnitCoefficients (μ : D(U, ℤ_[p])) : D(U, R) := sorry

theorem extendIntegralUnitCoefficients_eq (μ : D(U, ℤ_[p])) :
    extendIntegralUnitCoefficients (R := R) μ =
      restrictUnits p R (extendIntegralCoefficients (map uMap μ)) := by sorry
theorem extendIntegralUnitCoefficients_zero :
    extendIntegralUnitCoefficients (p := p) (R := R) 0 = 0 := by sorry
theorem extendIntegralUnitCoefficients_add (μ ν : D(U, ℤ_[p])) :
    extendIntegralUnitCoefficients (R := R) (μ + ν) =
      extendIntegralUnitCoefficients μ + extendIntegralUnitCoefficients ν := by sorry
theorem extendIntegralUnitCoefficients_smul (a : ℤ_[p]) (μ : D(U, ℤ_[p])) :
    extendIntegralUnitCoefficients (R := R) (a • μ) =
      algebraMap ℤ_[p] R a • extendIntegralUnitCoefficients μ := by sorry
theorem extendIntegralUnitCoefficients_self (μ : D(U, ℤ_[p])) :
    extendIntegralUnitCoefficients (R := ℤ_[p]) μ = μ := by sorry
theorem extendIntegralUnitCoefficients_dirac (u : U) :
    extendIntegralUnitCoefficients (R := R) (dirac ℤ_[p] u) = dirac R u := by sorry

theorem map_val_extendIntegralUnitCoefficients (μ : D(U, ℤ_[p])) :
    map uMap (extendIntegralUnitCoefficients (R := R) μ) =
      extendIntegralCoefficients (map uMap μ) := by sorry

theorem extendIntegralUnitCoefficients_test (μ : D(U, ℤ_[p])) (f : C(U, ℤ_[p])) :
    extendIntegralUnitCoefficients (R := R) μ (f • (1 : C(U, R))) =
      algebraMap ℤ_[p] R (μ f) := by sorry

theorem extendIntegralUnitCoefficients_unique (μ : D(U, ℤ_[p])) (ν : D(U, R))
    (hν : ∀ f : C(U, ℤ_[p]),
      ν (f • (1 : C(U, R))) = algebraMap ℤ_[p] R (μ f)) :
    ν = extendIntegralUnitCoefficients μ := by sorry

theorem extendIntegralUnitCoefficients_restrict (μ : D(ℤ_[p], ℤ_[p])) :
    extendIntegralUnitCoefficients (R := R) (restrictUnits p ℤ_[p] μ) =
      restrictUnits p R (extendIntegralCoefficients μ) := by sorry
end UnitIntegralCoefficients

section RationalUnitLattice
variable {p : ℕ} [Fact p.Prime] [IsBoundedSMul ℤ_[p] ℚ_[p]]
local notation "U" => (ℤ_[p])ˣ
local notation "uMap" => (ContinuousMap.mk Units.val Units.continuous_val : C(U, ℤ_[p]))

theorem extendIntegralUnitCoefficients_injective :
    Function.Injective (extendIntegralUnitCoefficients (p := p) (R := ℚ_[p])) := by sorry

theorem norm_extendIntegralUnitCoefficients (μ : D(U, ℤ_[p])) :
    ‖toCLMEquiv (extendIntegralUnitCoefficients (R := ℚ_[p]) μ)‖ =
      ‖integralAmiceCoefficients (R := ℚ_[p]) (map uMap μ)‖ := by sorry

theorem unit_integral_extension_iff_norm_le_one (ν : D(U, ℚ_[p])) :
    (∃! μ : D(U, ℤ_[p]), extendIntegralUnitCoefficients (R := ℚ_[p]) μ = ν) ↔
      ‖toCLMEquiv ν‖ ≤ 1 := by sorry

theorem isClosed_range_unit_integral_extension :
    IsClosed (Set.range (fun μ : D(U, ℤ_[p]) =>
      toCLMEquiv (extendIntegralUnitCoefficients (R := ℚ_[p]) μ))) := by sorry

theorem exists_unit_integral_power_scaling (ν : D(U, ℚ_[p])) :
    ∃ n : ℕ, ∃ μ : D(U, ℤ_[p]),
      ν = (((p : ℚ_[p]) ^ n)⁻¹) • extendIntegralUnitCoefficients μ := by sorry

theorem norm_extendIntegral_restrictUnits_le (μ : D(ℤ_[p], ℤ_[p])) :
    ‖toCLMEquiv (extendIntegralUnitCoefficients (R := ℚ_[p]) (restrictUnits p ℤ_[p] μ))‖ ≤
      ‖toCLMEquiv (extendIntegralCoefficients (R := ℚ_[p]) μ)‖ := by sorry
end RationalUnitLattice
end AbstractMeasure

namespace SuggestedTests.UnitIntegralLattice
open AbstractMeasure
variable {p : ℕ} [Fact p.Prime] [IsBoundedSMul ℤ_[p] ℚ_[p]]

-- UnitIntegralTests.zero
example : extendIntegralUnitCoefficients (p := p) (R := ℚ_[p]) 0 = 0 := by sorry
-- UnitIntegralTests.dirac_one
example : extendIntegralUnitCoefficients (p := p) (R := ℚ_[p])
    (dirac ℤ_[p] (1 : (ℤ_[p])ˣ)) = dirac ℚ_[p] (1 : (ℤ_[p])ˣ) := by sorry
-- UnitIntegralTests.native_self
example (μ : D((ℤ_[p])ˣ, ℤ_[p])) : extendIntegralUnitCoefficients (R := ℤ_[p]) μ = μ := by sorry
-- UnitIntegralTests.mixed_restriction
example : extendIntegralUnitCoefficients (R := ℚ_[p])
    (restrictUnits p ℤ_[p] (dirac ℤ_[p] (1 : ℤ_[p]) + dirac ℤ_[p] (p : ℤ_[p]))) =
      dirac ℚ_[p] (1 : (ℤ_[p])ˣ) := by sorry
-- UnitIntegralTests.nonintegral_atom
example : ¬ ∃ μ : D((ℤ_[p])ˣ, ℤ_[p]),
    extendIntegralUnitCoefficients (R := ℚ_[p]) μ =
      (p : ℚ_[p])⁻¹ • dirac ℚ_[p] (1 : (ℤ_[p])ˣ) := by sorry
-- UnitIntegralTests.supported_norm
example (μ : D((ℤ_[p])ˣ, ℤ_[p])) :
    ‖toCLMEquiv (extendIntegralUnitCoefficients (R := ℚ_[p]) μ)‖ =
    ‖toCLMEquiv (extendIntegralCoefficients (R := ℚ_[p])
      (map (ContinuousMap.mk Units.val Units.continuous_val : C((ℤ_[p])ˣ, ℤ_[p])) μ))‖ := by sorry
-- UnitIntegralTests.nonunit_restriction
example : extendIntegralUnitCoefficients (R := ℚ_[p])
    (restrictUnits p ℤ_[p] (dirac ℤ_[p] (p : ℤ_[p]))) = 0 := by sorry
end SuggestedTests.UnitIntegralLattice

/-!
## Residue of the actual integral averaging operator

Native ZMod p and native power series are used. The general Cartier extractor belongs to
ClassicalArithmeticCompletion:CA.2/cartier-operators. Only q=p>0 and 0≤i<p are consumed.
The direct finite coefficient formula prototypes the weighted combination without importing a
planned supplier. Its semilinearity uses that supplier's valid finite-field specialization.
The previous AbstractMeasure.psiMeasure_dirac signature is promoted, not declared twice.
-/
namespace IwasawaResidue
open PowerSeries
open scoped PowerSeries.WithPiTopology
variable (p : ℕ) [Fact p.Prime]
local notation "B" => ℤ_[p]⟦X⟧
local notation "B₀" => (ZMod p)⟦X⟧
local notation "ρ" => PowerSeries.map (PadicInt.toZMod (p := p))
local notation "φ₀" => PowerSeries.expand p (Nat.Prime.ne_zero (Fact.out : p.Prime))
local instance : TopologicalSpace (ZMod p) := ⊥
local instance : DiscreteTopology (ZMod p) := ⟨rfl⟩

theorem isLocallyConstant_toZMod : IsLocallyConstant (PadicInt.toZMod (p := p)) := sorry

theorem continuous_residue_map : Continuous (ρ : B → B₀) := sorry

theorem psiSeries_one_add_X_pow (n : ℕ) :
    AbstractMeasure.psiSeries p ((1+X : B)^n) =
      if p ∣ n then (1+X : B)^(n/p) else 0 := sorry

/-- The finite weighted sum Σ (-1)^i Λ_i of the existing Cartier restrictions. -/
def residuePsi : B₀ →ₗ[ZMod p] B₀ := sorry

theorem coeff_residuePsi (F : B₀) (n : ℕ) :
    (residuePsi p F).coeff n =
      ∑ i ∈ Finset.range p, (-1 : ZMod p)^i * F.coeff (p*n+i) := sorry

theorem residuePsi_zero : residuePsi p 0 = 0 := sorry

theorem residuePsi_add (F G : B₀) : residuePsi p (F+G) = residuePsi p F + residuePsi p G := sorry

theorem residuePsi_smul (a : ZMod p) (F : B₀) : residuePsi p (a • F) = a • residuePsi p F := sorry

theorem residuePsi_monomial (n : ℕ) (a : ZMod p) :
    residuePsi p (monomial n a) = monomial (n/p) ((-1 : ZMod p)^(n%p) * a) := sorry

theorem residuePsi_one : residuePsi p 1 = 1 := sorry

/-- Characterization with the exact power-series coefficient interface of the supplier. -/
theorem residuePsi_eq_sum_cartier
    (C : ℕ → B₀ →ₗ[ZMod p] B₀)
    (hcoeff : ∀ i < p, ∀ F n, (C i F).coeff n = F.coeff (p*n+i)) (F : B₀) :
    residuePsi p F = ∑ i ∈ Finset.range p, (-1 : ZMod p)^i • C i F := sorry

theorem continuous_residuePsi : Continuous (residuePsi p) := sorry

theorem residuePsi_expand_mul (F G : B₀) :
    residuePsi p (φ₀ F * G) = F * residuePsi p G := sorry

theorem residuePsi_one_add_X_pow_lt (r : ℕ) (hr : r < p) :
    residuePsi p ((1+X : B₀)^r) = if r=0 then 1 else 0 := sorry

theorem residuePsi_one_add_X_pow (n : ℕ) :
    residuePsi p ((1+X : B₀)^n) =
      if p ∣ n then (1+X : B₀)^(n/p) else 0 := sorry

theorem residue_psiSeries_polynomial (P : Polynomial ℤ_[p]) :
    ρ (AbstractMeasure.psiSeries p (P : B)) = residuePsi p (ρ (P : B)) := sorry

theorem residue_psiSeries (F : B) :
    ρ (AbstractMeasure.psiSeries p F) = residuePsi p (ρ F) := sorry

theorem residuePsi_expand (F : B₀) : residuePsi p (φ₀ F) = F := sorry

theorem residuePsi_pole_basis :
    residuePsi p ((1+X : B₀)*X^(p-1)) = (1+X : B₀) := sorry

theorem residuePsi_pole_cancelled (H : B₀) :
    residuePsi p ((1+X)*X^(p-1)*φ₀ H) = (1+X)*H := sorry

theorem shifted_expand_fixed_zero (H : B₀) (h : X^(p-1)*φ₀ H = H) : H=0 := sorry

theorem pole_error_fixed_zero (H : B₀)
    (h : residuePsi p ((1+X)*X^(p-1)*φ₀ H) = (1+X)*X^(p-1)*φ₀ H) : H=0 := sorry

-- ResiduePsiTests.zero: degenerate value.
example : residuePsi 3 0 = 0 := sorry
-- ResiduePsiTests.ternary_X: distinguishes weighted extraction from Λ_0.
example : residuePsi 3 (X : (ZMod 3)⟦X⟧) = -1 := sorry
-- ResiduePsiTests.dyadic_X: no odd-prime restriction.
example : residuePsi 2 (X : (ZMod 2)⟦X⟧) = 1 := sorry
-- ResiduePsiTests.native_monomial: compatibility with the native coefficient carrier.
example : residuePsi 3 (monomial 7 (2 : ZMod 3)) = monomial 2 (1 : ZMod 3) := sorry
-- ResiduePsiTests.nonmultiplicative: linear averaging is not a ring map.
example : residuePsi 2 ((1+X : (ZMod 2)⟦X⟧)^2) ≠
    (residuePsi 2 (1+X : (ZMod 2)⟦X⟧))^2 := sorry
-- ResiduePsiTests.integral_ternary: actual integral operator before reduction.
example : AbstractMeasure.psiSeries 3 ((1+X : ℤ_[3]⟦X⟧)^6) = (1+X)^2 := sorry
-- ResiduePsiTests.actual_reduction: exact comparison on an arbitrary series.
example (F : ℤ_[2]⟦X⟧) : PowerSeries.map PadicInt.toZMod (AbstractMeasure.psiSeries 2 F) =
    residuePsi 2 (PowerSeries.map PadicInt.toZMod F) := sorry
-- ResiduePsiTests.pole_polynomial: the dyadic formula stays inside power series.
example : residuePsi 2 ((1+X : (ZMod 2)⟦X⟧)*X) = 1+X := sorry
-- ResiduePsiTests.nonzero_error: H=1 does not give a fixed error term.
example : residuePsi 3 ((1+X : (ZMod 3)⟦X⟧)*X^2) ≠ (1+X)*X^2 := sorry
end IwasawaResidue

/-! Finite measure coefficients and joint p-power precision (L1).
These signatures are plans. The completed group-algebra carrier remains
owned by ProfiniteProPGroups Layer9. -/
namespace AbstractMeasure
noncomputable section
open scoped AbstractMeasure
section FiniteCoefficients
variable {X A B R : Type*} [TopologicalSpace X]
  [Fintype A] [DecidableEq A] [TopologicalSpace A] [DiscreteTopology A]
  [Fintype B] [DecidableEq B] [TopologicalSpace B] [DiscreteTopology B]
  [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]

def finiteProjection (q : C(X,A)) : D(X,R) →ₗ[R] (A →₀ R) := sorry
lemma finiteProjection_zero (q : C(X,A)) : finiteProjection (R := R) q 0 = 0 := sorry
lemma finiteProjection_add (q : C(X,A)) (μ ν : D(X,R)) :
    finiteProjection q (μ+ν) = finiteProjection q μ + finiteProjection q ν := sorry
lemma finiteProjection_smul (q : C(X,A)) (c : R) (μ : D(X,R)) :
    finiteProjection q (c • μ) = c • finiteProjection q μ := sorry
lemma finiteProjection_apply (q : C(X,A)) (μ : D(X,R)) (a : A) :
    finiteProjection q μ a = μ ((ContinuousMap.equivFnOfDiscrete.symm
      (Function.update (fun _ => 0) a 1)).comp q) := sorry
lemma finiteProjection_pairing (q : C(X,A)) (μ : D(X,R)) (h : A → R) :
    μ ((ContinuousMap.equivFnOfDiscrete.symm h).comp q) =
      ∑ a, h a * finiteProjection q μ a := sorry
lemma finiteProjection_dirac (q : C(X,A)) (x : X) :
    finiteProjection q (dirac R x) = Finsupp.single (q x) 1 := sorry
lemma finiteProjection_refinement (q : C(X,A)) (h : C(A,B)) (μ : D(X,R)) :
    finiteProjection (h.comp q) μ = Finsupp.mapDomain h (finiteProjection q μ) := sorry
lemma finiteProjection_totalMass (q : C(X,A)) (μ : D(X,R)) :
    ∑ a, finiteProjection q μ a = μ (ContinuousMap.const X 1) := sorry
lemma finiteProjection_reconstruct (μ : D(A,R)) :
    μ = ∑ a, finiteProjection (ContinuousMap.id A) μ a • dirac R a := sorry
lemma finiteProjection_bijective :
    Function.Bijective (finiteProjection (R := R) (ContinuousMap.id A)) := sorry
end FiniteCoefficients

section FiniteTopology
variable {X A R : Type*} [TopologicalSpace X]
  [Fintype A] [DecidableEq A] [TopologicalSpace A] [DiscreteTopology A]
  [NormedCommRing R]
lemma continuous_finiteProjection_coeff (q : C(X,A)) (a : A) :
    letI := WeakTopology (X := X) (R := R) (E := R)
    Continuous (fun μ : D(X,R) => finiteProjection q μ a) := sorry
variable [CompactSpace X] [T2Space X] [TotallyDisconnectedSpace X]
theorem finiteProjection_ext (μ ν : D(X,R))
    (h : ∀ (n : ℕ) (q : C(X,Fin n)), finiteProjection q μ = finiteProjection q ν) :
    μ = ν := sorry
end FiniteTopology

section JointFinite
variable {X A B : Type*} [TopologicalSpace X]
  [Fintype A] [DecidableEq A] [TopologicalSpace A] [DiscreteTopology A]
  [Fintype B] [DecidableEq B] [TopologicalSpace B] [DiscreteTopology B]
variable (p : ℕ) [Fact p.Prime]
def jointFiniteProjection (r : ℕ) (q : C(X,A)) :
    D(X,ℤ_[p]) →+ (A →₀ ZMod (p^r)) := sorry
lemma jointFiniteProjection_zero (r : ℕ) (q : C(X,A)) :
    jointFiniteProjection p r q 0 = 0 := sorry
lemma jointFiniteProjection_add (r : ℕ) (q : C(X,A)) (μ ν : D(X,ℤ_[p])) :
    jointFiniteProjection p r q (μ+ν) =
      jointFiniteProjection p r q μ + jointFiniteProjection p r q ν := sorry
lemma jointFiniteProjection_zero_precision (q : C(X,A)) (μ : D(X,ℤ_[p])) :
    jointFiniteProjection p 0 q μ = 0 := sorry
lemma jointFiniteProjection_apply (r : ℕ) (q : C(X,A)) (μ : D(X,ℤ_[p])) (a : A) :
    jointFiniteProjection p r q μ a = PadicInt.toZModPow r (finiteProjection q μ a) := sorry
lemma jointFiniteProjection_precision (r s : ℕ) (hrs : r ≤ s)
    (q : C(X,A)) (μ : D(X,ℤ_[p])) :
    Finsupp.mapRange (ZMod.castHom (pow_dvd_pow p hrs) (ZMod (p^r))) (map_zero _)
      (jointFiniteProjection p s q μ) = jointFiniteProjection p r q μ := sorry
lemma jointFiniteProjection_refinement (r : ℕ) (q : C(X,A)) (h : C(A,B))
    (μ : D(X,ℤ_[p])) :
    jointFiniteProjection p r (h.comp q) μ =
      Finsupp.mapDomain h (jointFiniteProjection p r q μ) := sorry
lemma jointFiniteProjection_dirac (r : ℕ) (q : C(X,A)) (x : X) :
    jointFiniteProjection p r q (dirac ℤ_[p] x) = Finsupp.single (q x) 1 := sorry
variable [CompactSpace X] [T2Space X] [TotallyDisconnectedSpace X]
theorem jointFiniteProjection_ext (μ ν : D(X,ℤ_[p]))
    (h : ∀ (r n : ℕ) (q : C(X,Fin n)),
      jointFiniteProjection p r q μ = jointFiniteProjection p r q ν) : μ = ν := sorry
end JointFinite
end
end AbstractMeasure

namespace FiniteProjectionTests
open scoped AbstractMeasure
open AbstractMeasure
-- FiniteProjectionTests.dirac_identity
example : finiteProjection (ContinuousMap.id (Fin 2)) (dirac ℤ (0 : Fin 2)) =
    Finsupp.single 0 1 := sorry
-- FiniteProjectionTests.collapse_sums
example : finiteProjection (ContinuousMap.const (Fin 2) (0 : Fin 1))
    ((2 : ℤ) • dirac ℤ (0 : Fin 2) + (3 : ℤ) • dirac ℤ (1 : Fin 2)) 0 = 5 := sorry
-- FiniteProjectionTests.empty_fiber
example : finiteProjection (ContinuousMap.const (Fin 1) (0 : Fin 2))
    (dirac ℤ (0 : Fin 1)) 1 = 0 := sorry
-- FiniteProjectionTests.joint_dirac
example : jointFiniteProjection 2 2 (ContinuousMap.id (Fin 1))
    (dirac ℤ_[2] (0 : Fin 1)) = Finsupp.single 0 1 := sorry
-- FiniteProjectionTests.zero_precision
example : jointFiniteProjection 2 0 (ContinuousMap.id (Fin 1))
    (dirac ℤ_[2] (0 : Fin 1)) = 0 := sorry
-- FiniteProjectionTests.precision_matters
example :
    jointFiniteProjection 2 1 (ContinuousMap.id (Fin 1))
      ((2 : ℤ_[2]) • dirac ℤ_[2] (0 : Fin 1)) = 0 ∧
    jointFiniteProjection 2 2 (ContinuousMap.id (Fin 1))
      ((2 : ℤ_[2]) • dirac ℤ_[2] (0 : Fin 1)) 0 = 2 ∧
    jointFiniteProjection 2 2 (ContinuousMap.id (Fin 1))
      ((2 : ℤ_[2]) • dirac ℤ_[2] (0 : Fin 1)) ≠ 0 := sorry
end FiniteProjectionTests

/-! ## Dilation pushforward and the native formal binomial substitution
These signatures compare existing maps. They introduce no arithmetic Galois action. -/
namespace AbstractMeasure
noncomputable section
open scoped BigOperators PowerSeries.WithPiTopology
open PowerSeries
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => PadicInt p
local notation "B" => PowerSeries Z
local notation "ba" a => (binomialSeries Z a - 1)
set_option quotPrecheck false in
local notation "dil" a => (⟨fun x : Z => a*x,
  continuous_const.mul continuous_id⟩ : C(Z,Z))

/-- L2/mahler-dilation-natural. -/
theorem mahler_mul_padic_nat (a : Z) (m n : ℕ) :
    mahler n (a * (m : Z)) =
      ∑ k ∈ Finset.range (n+1), coeff n ((ba a)^k) * mahler k (m : Z) := by sorry
/-- L2/mahler-dilation. -/
theorem mahler_mul_padic (a : Z) (n : ℕ) (x : Z) :
    mahler n (a*x) =
      ∑ k ∈ Finset.range (n+1), coeff n ((ba a)^k) * mahler k x := by sorry
/-- L2/amice-dilation. -/
theorem amiceTransform_map_mul (a : Z) (μ : D(Z,Z)) :
    (map (dil a) μ).amiceTransform = subst (ba a) μ.amiceTransform := by sorry
/-- L2/unit-restriction-dilation. -/
theorem unitRestriction_map_unit (R : Type*) [NormedCommRing R]
    (a : Zˣ) (μ : D(Z,R)) :
    unitRestriction p R (map (dil (a : Z)) μ) =
      map (dil (a : Z)) (unitRestriction p R μ) := by sorry
/-- L2/unit-dilation-psi-kernel. -/
theorem psiSeries_subst_binomial_eq_zero (a : Zˣ) (F : B)
    (hF : psiSeries p F = 0) :
    psiSeries p (subst (ba (a : Z)) F) = 0 := by sorry
/-- L2/inverse-mahler-dilation. -/
theorem inverseMahler_subst_binomial_unit (a : Zˣ) (F : B) :
    inverseMahler p (subst (ba (a : Z)) F) =
      (↑(a⁻¹) : Z) • subst (ba (a : Z)) (inverseMahler p F) := by sorry
/-- L2/binomial-substitution-coefficient-continuity. -/
theorem continuous_subst_binomial (a : Z) :
    Continuous (fun F : B => subst (ba a) F) := by sorry

-- DilationTests.zero_scalar: collapse to the mass, including nonzero measures.
example (μ : D(Z,Z)) :
    (map (dil (0 : Z)) μ).amiceTransform = C (μ 1) := by sorry
-- DilationTests.identity_scalar.
example (F : B) : subst (ba (1 : Z)) F = F := by sorry
-- DilationTests.negative_scalar: binomial substitution is not coefficient dilation.
example : coeff 2 ((map (dil (-1 : Z)) (dirac Z (2 : Z))).amiceTransform) = 3 := by sorry
-- DilationTests.prime_scalar: agreement with the already planned Frobenius map.
example (μ : D(Z,Z)) : (map (dil (p : Z)) μ).amiceTransform =
    (phiMeasure p Z μ).amiceTransform := by sorry
end

-- DilationTests.inverse_factor: the coefficient is the inverse unit.
example : (2 : PadicInt 3) • inverseMahler 3
    (PowerSeries.subst (PowerSeries.binomialSeries (PadicInt 3) (2 : PadicInt 3) - 1)
      (1 + PowerSeries.X : PowerSeries (PadicInt 3))) =
      (1 + PowerSeries.X : PowerSeries (PadicInt 3))^2 := by sorry
-- DilationTests.dyadic_inverse_factor.
example : (3 : PadicInt 2) • inverseMahler 2
    (PowerSeries.subst (PowerSeries.binomialSeries (PadicInt 2) (3 : PadicInt 2) - 1)
      (1 + PowerSeries.X : PowerSeries (PadicInt 2))) =
      (1 + PowerSeries.X : PowerSeries (PadicInt 2))^3 := by sorry
-- DilationTests.nonunit_kernel_control.
example : psiSeries 3 (1 + PowerSeries.X) = 0 ∧
    psiSeries 3 (PowerSeries.subst (0 : PowerSeries (PadicInt 3))
      (1 + PowerSeries.X : PowerSeries (PadicInt 3))) ≠ 0 := by sorry
end AbstractMeasure
