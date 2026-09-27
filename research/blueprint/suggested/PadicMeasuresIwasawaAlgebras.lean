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
