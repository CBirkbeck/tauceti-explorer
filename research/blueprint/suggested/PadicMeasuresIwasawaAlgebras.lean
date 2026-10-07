import Mathlib.Topology.Algebra.ContinuousMonoidHom
import Mathlib.Topology.Algebra.Module.ContinuousLinearMap.Extend
import Mathlib.Topology.ContinuousMap.LocallyConstant
import TauCeti.Topology.Algebra.Group.LocallyConstant
import Mathlib.Topology.Separation.DisjointCover
import Mathlib.NumberTheory.Padics.LocalField
import Mathlib.Topology.Instances.ZMod
import Mathlib.Data.ZMod.Units
import Mathlib.RingTheory.LocalRing.RingHom.Basic
import TauCeti.NumberTheory.LocalField.UnitFiltration.Basic
import Mathlib.GroupTheory.Perm.Basic
import Mathlib.Algebra.MonoidAlgebra.Module
import Mathlib.Algebra.MonoidAlgebra.MapDomain
import Mathlib.Algebra.BigOperators.Finsupp.Basic
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
import Mathlib.RingTheory.PowerSeries.WeierstrassPreparation
import Mathlib.RingTheory.PowerSeries.Ideal
import Mathlib.RingTheory.Length
import Mathlib.RingTheory.Ideal.Height
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.Algebra.Module.LocalizedModule.Basic
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.Algebra.CharP.Lemmas
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.Algebra.Module.Torsion.Basic
import Mathlib.RingTheory.LocalRing.ResidueField.Defs
import Mathlib.NumberTheory.Padics.PadicNorm
import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.RingTheory.HopfAlgebra.MonoidAlgebra
import Mathlib.RingTheory.HopfAlgebra.Convolution
import Mathlib.LinearAlgebra.ExteriorPower.Basis
import Mathlib.LinearAlgebra.Matrix.Adjugate
import Mathlib.Order.Hom.PowersetCard
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.RingTheory.IntegralDomain
import Mathlib.Algebra.Module.FinitePresentation
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.RingTheory.Spectrum.Prime.FreeLocus
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.LinearAlgebra.FreeModule.PID
import Mathlib.GroupTheory.Complement
import Mathlib.GroupTheory.Index
import TauCeti.Algebra.Module.AuslanderReiten.Transpose

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

/-! Convolution and finite algebra coordinates (L1).
The right-handed orientation and principal names follow the identified upstream
PR41961. Its module is absent from the fixed baseline. All mathematical proofs
and proposed constructions below are placeholders. Native structural fields
only fix the intended multiplication and identity for the Ring instance. -/
namespace AbstractMeasure
noncomputable section
open scoped AbstractMeasure
section Convolution
variable {G H R : Type*} [TopologicalSpace G] [Monoid G] [ContinuousMul G]
  [LocallyCompactSpace G] [TopologicalSpace H] [Monoid H] [ContinuousMul H]
  [LocallyCompactSpace H] [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]

def convolveFunRight : D(G,R) →ₗ[R] C(G,R) →ₗ[R] C(G,R) := sorry
lemma convolveFunRight_apply (ν : D(G,R)) (f : C(G,R)) (x : G) :
    convolveFunRight ν f x = ν ⟨fun y => f (x*y), by fun_prop⟩ := sorry
lemma convolveFunRight_dirac_apply (f : C(G,R)) (x y : G) :
    convolveFunRight (dirac R y) f x = f (x*y) := sorry
lemma convolveFunRight_apply_one (ν : D(G,R)) (f : C(G,R)) :
    convolveFunRight ν f 1 = ν f := sorry
lemma convolveFunRight_one (f : C(G,R)) :
    convolveFunRight (dirac R (1 : G)) f = f := sorry

instance convolutionMul : Mul D(G,R) where
  mul μ ν := map ⟨fun z : G×G => z.1*z.2, continuous_fst.mul continuous_snd⟩ (prodMk' μ ν)
lemma mul_def (μ ν : D(G,R)) : μ*ν =
    map ⟨fun z : G×G => z.1*z.2, continuous_fst.mul continuous_snd⟩ (prodMk' μ ν) := sorry
lemma mul_apply (μ ν : D(G,R)) (f : C(G,R)) :
    (μ*ν) f = μ (convolveFunRight ν f) := sorry
lemma dirac_mul_dirac (x y : G) : dirac R x * dirac R y = dirac R (x*y) := sorry
lemma convolveFunRight_mul (μ ν : D(G,R)) (f : C(G,R)) :
    convolveFunRight (μ*ν) f = convolveFunRight μ (convolveFunRight ν f) := sorry

instance : One D(G,R) := ⟨dirac R 1⟩
instance : NonUnitalNonAssocRing D(G,R) where
  zero_mul := sorry
  mul_zero := sorry
  left_distrib := sorry
  right_distrib := sorry
instance convolutionRing : Ring D(G,R) where
  mul_assoc := sorry
  one_mul := sorry
  mul_one := sorry
instance convolutionAlgebra : Algebra R D(G,R) := Algebra.ofModule (by sorry) (by sorry)
lemma one_def : (1 : D(G,R)) = dirac R 1 := sorry
lemma one_apply (f : C(G,R)) : (1 : D(G,R)) f = f 1 := sorry
lemma algebraMap_apply (r : R) (f : C(G,R)) :
    algebraMap R D(G,R) r f = r * f 1 := sorry
lemma map_mul (h : G →* H) (hh : Continuous h) (μ ν : D(G,R)) :
    map ⟨h,hh⟩ (μ*ν) = map ⟨h,hh⟩ μ * map ⟨h,hh⟩ ν := sorry
lemma mul_totalMass (μ ν : D(G,R)) :
    (μ*ν) (ContinuousMap.const G 1) =
      μ (ContinuousMap.const G 1) * ν (ContinuousMap.const G 1) := sorry

-- ConvolutionTests.function_right_dirac
example (f : C(G,R)) (x y : G) : convolveFunRight (dirac R y) f x = f (x*y) := sorry
-- ConvolutionTests.function_identity
example (f : C(G,R)) : convolveFunRight (dirac R (1 : G)) f = f := sorry
-- ConvolutionTests.function_constant
example (ν : D(G,R)) (c : R) : convolveFunRight ν (ContinuousMap.const G c) =
    ContinuousMap.const G (c * ν (ContinuousMap.const G 1)) := sorry
-- ConvolutionTests.product_dirac
example (x y : G) : dirac R x * dirac R y = dirac R (x*y) := sorry
-- ConvolutionTests.product_zero
example (μ : D(G,R)) : 0 * μ = 0 := sorry
-- ConvolutionTests.algebra_right_unit
example (μ : D(G,R)) : μ * dirac R 1 = μ := sorry
-- ConvolutionTests.algebra_left_unit
example (μ : D(G,R)) : dirac R 1 * μ = μ := sorry
-- ConvolutionTests.algebra_scalar
example (r : R) : algebraMap R D(G,R) r = r • dirac R 1 := sorry
end Convolution

section CommutativeConvolution
variable {G R : Type*} [TopologicalSpace G] [CommMonoid G] [ContinuousMul G]
  [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]
  [CommRing R] [TopologicalSpace R] [IsTopologicalRing R] [T0Space R]
lemma mul_comm_of_commMonoid (μ ν : D(G,R)) : μ*ν = ν*μ := sorry
end CommutativeConvolution

section FiniteAlgebra
variable {G A R : Type*} [TopologicalSpace G] [Monoid G] [ContinuousMul G]
  [LocallyCompactSpace G] [TopologicalSpace A] [Monoid A] [Fintype A] [DecidableEq A]
  [DiscreteTopology A] [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]
lemma finiteProjection_map (q : C(G,A)) (μ : D(G,R)) :
    finiteProjection (.id A) (map q μ) = finiteProjection q μ := sorry
lemma finite_convolution_expansion (μ ν : D(A,R)) :
    μ*ν = ∑ a, ∑ b, (finiteProjection (.id A) μ a * finiteProjection (.id A) ν b) •
      dirac R (a*b) := sorry
lemma finiteProjection_mul (q : G →* A) (hq : Continuous q) (μ ν : D(G,R)) :
    MonoidAlgebra.ofCoeff (finiteProjection ⟨q,hq⟩ (μ*ν)) =
      MonoidAlgebra.ofCoeff (finiteProjection ⟨q,hq⟩ μ) *
        MonoidAlgebra.ofCoeff (finiteProjection ⟨q,hq⟩ ν) := sorry
def finiteProjectionAlgHom (q : G →* A) (hq : Continuous q) :
    D(G,R) →ₐ[R] MonoidAlgebra R A := sorry
lemma finiteProjectionAlgHom_apply (q : G →* A) (hq : Continuous q) (μ : D(G,R)) :
    finiteProjectionAlgHom q hq μ = MonoidAlgebra.ofCoeff (finiteProjection ⟨q,hq⟩ μ) := sorry
lemma finiteProjectionAlgHom_coeff (q : G →* A) (hq : Continuous q) (μ : D(G,R)) (a : A) :
    (finiteProjectionAlgHom q hq μ).coeff a = finiteProjection ⟨q,hq⟩ μ a := sorry
lemma finiteProjectionAlgHom_dirac (q : G →* A) (hq : Continuous q) (x : G) :
    finiteProjectionAlgHom (R := R) q hq (dirac R x) = MonoidAlgebra.single (q x) 1 := sorry

def finiteProjectionAlgEquiv : D(A,R) ≃ₐ[R] MonoidAlgebra R A := sorry
lemma finiteProjectionAlgEquiv_apply (μ : D(A,R)) :
    finiteProjectionAlgEquiv μ = finiteProjectionAlgHom (MonoidHom.id A) continuous_id μ := sorry
lemma finiteProjectionAlgEquiv_symm_apply (c : MonoidAlgebra R A) :
    finiteProjectionAlgEquiv.symm c = ∑ a, c.coeff a • dirac R a := sorry
lemma finiteProjectionAlgEquiv_symm_single (a : A) (r : R) :
    finiteProjectionAlgEquiv.symm (MonoidAlgebra.single a r) = r • dirac R a := sorry
-- ConvolutionTests.finite_algebra_one
example (q : G →* A) (hq : Continuous q) :
    finiteProjectionAlgHom (R := R) q hq 1 = 1 := sorry
-- ConvolutionTests.finite_algebra_atoms
example (q : G →* A) (hq : Continuous q) (x y : G) :
    finiteProjectionAlgHom (R := R) q hq (dirac R x * dirac R y) =
      MonoidAlgebra.single (q x * q y) 1 := sorry
-- ConvolutionTests.finite_equiv_atom
example (a : A) : finiteProjectionAlgEquiv (dirac R a) = MonoidAlgebra.single a 1 := sorry
-- ConvolutionTests.finite_equiv_inverse_zero
example : (finiteProjectionAlgEquiv (R := R) (A := A)).symm 0 = 0 := sorry
-- ConvolutionTests.finite_equiv_inverse_product
example (a b : A) (r s : R) :
    finiteProjectionAlgEquiv.symm (MonoidAlgebra.single a r * MonoidAlgebra.single b s) =
      (r*s) • dirac R (a*b) := sorry

variable (p : ℕ) [Fact p.Prime]
lemma jointFiniteProjection_mul (r : ℕ) (q : G →* A) (hq : Continuous q)
    (μ ν : D(G,ℤ_[p])) :
    MonoidAlgebra.ofCoeff (jointFiniteProjection p r ⟨q,hq⟩ (μ*ν)) =
      MonoidAlgebra.ofCoeff (jointFiniteProjection p r ⟨q,hq⟩ μ) *
        MonoidAlgebra.ofCoeff (jointFiniteProjection p r ⟨q,hq⟩ ν) := sorry
def jointFiniteProjectionRingHom (r : ℕ) (q : G →* A) (hq : Continuous q) :
    D(G,ℤ_[p]) →+* MonoidAlgebra (ZMod (p^r)) A := sorry
lemma jointFiniteProjectionRingHom_apply (r : ℕ) (q : G →* A) (hq : Continuous q)
    (μ : D(G,ℤ_[p])) : jointFiniteProjectionRingHom p r q hq μ =
      MonoidAlgebra.ofCoeff (jointFiniteProjection p r ⟨q,hq⟩ μ) := sorry
lemma jointFiniteProjectionRingHom_dirac (r : ℕ) (q : G →* A) (hq : Continuous q) (x : G) :
    jointFiniteProjectionRingHom p r q hq (dirac ℤ_[p] x) = MonoidAlgebra.single (q x) 1 := sorry
lemma jointFiniteProjectionRingHom_zero_precision (q : G →* A) (hq : Continuous q)
    (μ : D(G,ℤ_[p])) : jointFiniteProjectionRingHom p 0 q hq μ = 0 := sorry
end FiniteAlgebra

-- ConvolutionTests.ordered_permutations
example :
    letI : TopologicalSpace (Equiv.Perm (Fin 3)) := ⊥
    letI : DiscreteTopology (Equiv.Perm (Fin 3)) := ⟨rfl⟩
    dirac ℤ (Equiv.swap (0 : Fin 3) 1) * dirac ℤ (Equiv.swap (1 : Fin 3) 2) ≠
      dirac ℤ (Equiv.swap (1 : Fin 3) 2) * dirac ℤ (Equiv.swap (0 : Fin 3) 1) := sorry
-- ConvolutionTests.finite_algebra_collapse
example {A : Type*} [Group A] [Fintype A] [DecidableEq A] [TopologicalSpace A]
    [DiscreteTopology A] (x y : A) :
    letI : TopologicalSpace PUnit := ⊥
    finiteProjectionAlgHom (R := ℤ) (1 : A →* PUnit) (by fun_prop)
      ((2 : ℤ) • dirac ℤ x + (3 : ℤ) • dirac ℤ y) =
        MonoidAlgebra.single 1 5 := sorry
-- ConvolutionTests.joint_ring_one
example :
    letI : TopologicalSpace PUnit := ⊥
    jointFiniteProjectionRingHom 2 2 (MonoidHom.id PUnit) continuous_id
      (1 : D(PUnit,ℤ_[2])) = MonoidAlgebra.single 1 1 := sorry
-- ConvolutionTests.joint_ring_zero_precision
example :
    letI : TopologicalSpace PUnit := ⊥
    jointFiniteProjectionRingHom 2 0 (MonoidHom.id PUnit) continuous_id
      (1 : D(PUnit,ℤ_[2])) = 0 := sorry
-- ConvolutionTests.joint_ring_product
example :
    letI : TopologicalSpace PUnit := ⊥
    jointFiniteProjectionRingHom 2 3 (MonoidHom.id PUnit) continuous_id
      (((2 : ℤ_[2]) • dirac ℤ_[2] (1 : PUnit)) * ((3 : ℤ_[2]) • dirac ℤ_[2] 1)) =
        MonoidAlgebra.single 1 6 := sorry
end
end AbstractMeasure

/-! ## Concrete finite quotients of p-adic units
The local-field unit filtration is imported from the pinned Tau Ceti library.
These signatures compare it with the actual modular-unit reductions.
-/
namespace PadicInt
open Filter Topology ValuativeRel IsNonarchimedeanLocalField
variable (p : ℕ) [Fact p.Prime]

/-- The canonical homomorphism on units induced by the native ring reduction. -/
def unitToZModPow (n : ℕ) : (ℤ_[p])ˣ →* (ZMod (p^n))ˣ := sorry
lemma unitToZModPow_val (n : ℕ) (u : (ℤ_[p])ˣ) :
    (unitToZModPow p n u : ZMod (p^n)) = toZModPow n (u : ℤ_[p]) := sorry
lemma unitToZModPow_one (n : ℕ) : unitToZModPow p n 1 = 1 := sorry
lemma unitToZModPow_mul (n : ℕ) (u v : (ℤ_[p])ˣ) :
    unitToZModPow p n (u*v) = unitToZModPow p n u * unitToZModPow p n v := sorry
lemma unitToZModPow_zero (u : (ℤ_[p])ˣ) : unitToZModPow p 0 u = 1 := sorry
lemma unitToZModPow_surjective (n : ℕ) : Function.Surjective (unitToZModPow p n) := sorry
lemma unitToZModPow_refinement (m n : ℕ) (h : m ≤ n) :
    (ZMod.unitsMap (pow_dvd_pow p h)).comp (unitToZModPow p n) = unitToZModPow p m := sorry
lemma unitToZModPow_mem_ker (n : ℕ) (u : (ℤ_[p])ˣ) :
    u ∈ (unitToZModPow p n).ker ↔ (u : ℤ_[p])-1 ∈ Ideal.span {(p : ℤ_[p])^n} := sorry
lemma toZModPow_eq_iff_norm_sub_le (n : ℕ) (x y : ℤ_[p]) :
    toZModPow n x = toZModPow n y ↔ ‖x-y‖ ≤ (p:ℝ)^(-(n:ℤ)) := sorry
lemma continuous_toZModPow (n : ℕ) : Continuous (toZModPow (p := p) n) := sorry
lemma continuous_unitToZModPow (n : ℕ) : Continuous (unitToZModPow p n) := sorry
lemma localFieldIntegers_eq_subring : 𝒪[ℚ_[p]] = subring p := sorry
lemma unitToZModPow_ker_eq_unitFiltration (n : ℕ) :
    (unitToZModPow p n).ker = (TauCeti.unitFiltration ℚ_[p] n).comap
      (Units.map (Coe.ringHom (p := p)).toMonoidHom) := sorry
lemma isOpen_ker_unitToZModPow (n : ℕ) :
    IsOpen ((unitToZModPow p n).ker : Set (ℤ_[p])ˣ) := sorry
lemma hasBasis_ker_unitToZModPow :
    (𝓝 (1 : (ℤ_[p])ˣ)).HasBasis (fun _ : ℕ => True)
      (fun n => ((unitToZModPow p n).ker : Set (ℤ_[p])ˣ)) := sorry
theorem exists_ker_unitToZModPow_le (H : OpenSubgroup (ℤ_[p])ˣ) :
    ∃ n, (unitToZModPow p n).ker ≤ H.toSubgroup := sorry
lemma unitToZModPow_ext (u v : (ℤ_[p])ˣ)
    (h : ∀ n, unitToZModPow p n u = unitToZModPow p n v) : u = v := sorry

def unitToZModPowQuotient (n : ℕ) :
    (ℤ_[p])ˣ ⧸ (unitToZModPow p n).ker ≃* (ZMod (p^n))ˣ := sorry
lemma unitToZModPowQuotient_mk (n : ℕ) (u : (ℤ_[p])ˣ) :
    unitToZModPowQuotient p n (QuotientGroup.mk u) = unitToZModPow p n u := sorry
lemma unitToZModPowQuotient_symm_apply (n : ℕ) (u : (ℤ_[p])ˣ) :
    (unitToZModPowQuotient p n).symm (unitToZModPow p n u) = QuotientGroup.mk u := sorry
lemma unitToZModPowQuotient_eq_native (n : ℕ) :
    unitToZModPowQuotient p n = QuotientGroup.quotientKerEquivOfSurjective
      (unitToZModPow p n) (unitToZModPow_surjective p n) := sorry

theorem exists_unitToZModPow_factor {A : Type*} [Group A] [TopologicalSpace A]
    [DiscreteTopology A] (q : (ℤ_[p])ˣ →* A) (hq : Continuous q) :
    ∃ n, ∃ t : (ZMod (p^n))ˣ →* A, t.comp (unitToZModPow p n) = q := sorry
lemma unitToZModPow_factor_unique {A : Type*} [Monoid A] (n : ℕ)
    (t t' : (ZMod (p^n))ˣ →* A)
    (h : t.comp (unitToZModPow p n) = t'.comp (unitToZModPow p n)) : t=t' := sorry
end PadicInt

namespace UnitReductionTests
-- UnitReductionTests.coefficient_agreement
example (u : (ℤ_[3])ˣ) : (PadicInt.unitToZModPow 3 2 u : ZMod (3^2)) =
    PadicInt.toZModPow 2 (u : ℤ_[3]) := sorry
-- UnitReductionTests.zero_level
example (u : (ℤ_[2])ˣ) : PadicInt.unitToZModPow 2 0 u = 1 := sorry
-- UnitReductionTests.dyadic_first_level
example : PadicInt.unitToZModPow 2 1 (-1) = PadicInt.unitToZModPow 2 1 1 := sorry
-- UnitReductionTests.dyadic_second_level
example : PadicInt.unitToZModPow 2 2 (-1) ≠ PadicInt.unitToZModPow 2 2 1 := sorry
-- UnitReductionTests.odd_sign
example : (PadicInt.unitToZModPow 3 2 (-1) : ZMod (3^2)) = 8 := sorry
-- UnitReductionTests.quotient_zero
example (u : (ℤ_[3])ˣ) :
    PadicInt.unitToZModPowQuotient 3 0 (QuotientGroup.mk u) = 1 := sorry
-- UnitReductionTests.quotient_representative
example (u : (ℤ_[3])ˣ) : PadicInt.unitToZModPowQuotient 3 2 (QuotientGroup.mk u) =
    PadicInt.unitToZModPow 3 2 u := sorry
-- UnitReductionTests.quotient_dyadic_sign
example : PadicInt.unitToZModPowQuotient 2 2 (QuotientGroup.mk (-1)) ≠
    PadicInt.unitToZModPowQuotient 2 2 (QuotientGroup.mk 1) := sorry
-- UnitReductionTests.actual_unit_dirac_coordinate
example (u : (ℤ_[2])ˣ) :
    AbstractMeasure.jointFiniteProjectionRingHom 2 3 (PadicInt.unitToZModPow 2 2)
      (PadicInt.continuous_unitToZModPow 2 2) (AbstractMeasure.dirac ℤ_[2] u) =
      MonoidAlgebra.single (PadicInt.unitToZModPow 2 2 u) 1 := sorry
-- UnitReductionTests.actual_unit_zero_precision
example (u : (ℤ_[2])ˣ) :
    AbstractMeasure.jointFiniteProjectionRingHom 2 0 (PadicInt.unitToZModPow 2 2)
      (PadicInt.continuous_unitToZModPow 2 2) (AbstractMeasure.dirac ℤ_[2] u) = 0 := sorry
end UnitReductionTests


/-! Concrete locally constant tests and measure separation on p-adic units.
Native uniform local constancy is imported from Tau Ceti. All bodies below are
planning placeholders. The source-grounded proof outlines are in the roadmap;
the additional scratch proof experiment is unconfirmed. The compatible-family
inverse remains a stated gap. -/

noncomputable section
open scoped AbstractMeasure
variable (p : ℕ) [Fact p.Prime]

lemma PadicInt.unitToZModPow_function_factor_iff {A : Type*} (n : ℕ) (f : (ℤ_[p])ˣ → A) :
    (∃ g : (ZMod (p^n))ˣ → A, g ∘ PadicInt.unitToZModPow p n = f) ↔
      (PadicInt.unitToZModPow p n).ker ≤ TauCeti.rightTranslationStabilizer f := sorry

lemma PadicInt.exists_unitToZModPow_locallyConstant_factor {A : Type*} (f : (ℤ_[p])ˣ → A)
    (hf : IsLocallyConstant f) :
    ∃ n, ∃ g : (ZMod (p^n))ˣ → A, g ∘ PadicInt.unitToZModPow p n = f := sorry

lemma PadicInt.isLocallyConstant_iff_unitToZModPow_factor {A : Type*} (f : (ℤ_[p])ˣ → A) :
    IsLocallyConstant f ↔ ∃ n, ∃ g : (ZMod (p^n))ˣ → A,
      g ∘ PadicInt.unitToZModPow p n = f := sorry

lemma PadicInt.unitToZModPow_function_factor_unique {A : Type*} (n : ℕ)
    (g h : (ZMod (p^n))ˣ → A)
    (heq : g ∘ PadicInt.unitToZModPow p n = h ∘ PadicInt.unitToZModPow p n) : g = h := sorry

lemma PadicInt.unitToZModPow_function_factor_refinement {A : Type*} (m n : ℕ) (hmn : m ≤ n)
    (f : (ℤ_[p])ˣ → A) (g : (ZMod (p^m))ˣ → A)
    (hg : g ∘ PadicInt.unitToZModPow p m = f) :
    (g ∘ ZMod.unitsMap (pow_dvd_pow p hmn)) ∘ PadicInt.unitToZModPow p n = f := sorry

lemma PadicInt.exists_unitToZModPow_continuous_factor {A : Type*} [TopologicalSpace A] [DiscreteTopology A]
    (f : (ℤ_[p])ˣ → A) (hf : Continuous f) :
    ∃ n, ∃ g : (ZMod (p^n))ˣ → A, g ∘ PadicInt.unitToZModPow p n = f := sorry

lemma PadicInt.unitToZModPow_zero_factor_iff {A : Type*} (f : (ℤ_[p])ˣ → A) :
    (∃ g : (ZMod (p^0))ˣ → A, g ∘ PadicInt.unitToZModPow p 0 = f) ↔
      ∀ x, f x = f 1 := sorry

lemma PadicInt.dense_unitToZModPow_tests {R : Type*} [MetricSpace R] :
    Dense {f : C((ℤ_[p])ˣ,R) | ∃ n, ∃ g : (ZMod (p^n))ˣ → R,
      g ∘ PadicInt.unitToZModPow p n = f} := sorry

lemma AbstractMeasure.unitToZModPow_ext {R : Type*} [NormedCommRing R]
    (μ ν : D((ℤ_[p])ˣ,R))
    (h : ∀ n, AbstractMeasure.finiteProjection ⟨PadicInt.unitToZModPow p n, PadicInt.continuous_unitToZModPow p n⟩ μ =
      AbstractMeasure.finiteProjection ⟨PadicInt.unitToZModPow p n, PadicInt.continuous_unitToZModPow p n⟩ ν) : μ = ν := sorry

lemma AbstractMeasure.jointUnitToZModPow_ext (μ ν : D((ℤ_[p])ˣ,ℤ_[p]))
    (h : ∀ r n, AbstractMeasure.jointFiniteProjection p r ⟨PadicInt.unitToZModPow p n, PadicInt.continuous_unitToZModPow p n⟩ μ =
      AbstractMeasure.jointFiniteProjection p r ⟨PadicInt.unitToZModPow p n, PadicInt.continuous_unitToZModPow p n⟩ ν) : μ = ν := sorry

lemma AbstractMeasure.diagonalUnitToZModPow_ext (μ ν : D((ℤ_[p])ˣ,ℤ_[p]))
    (h : ∀ n, AbstractMeasure.jointFiniteProjection p n ⟨PadicInt.unitToZModPow p n, PadicInt.continuous_unitToZModPow p n⟩ μ =
      AbstractMeasure.jointFiniteProjection p n ⟨PadicInt.unitToZModPow p n, PadicInt.continuous_unitToZModPow p n⟩ ν) : μ = ν := sorry

namespace UnitDescentTests
-- UnitDescentTests.zero_level_constant
example (c : ℤ) : ∃ g : (ZMod (3^0))ˣ → ℤ,
    g ∘ PadicInt.unitToZModPow 3 0 = fun _ => c := sorry
-- UnitDescentTests.dyadic_depth_one_insufficient
example : ¬ ∃ g : (ZMod (2^1))ˣ → (ZMod (2^2))ˣ,
    g ∘ PadicInt.unitToZModPow 2 1 = PadicInt.unitToZModPow 2 2 := sorry
-- UnitDescentTests.joint_zero_precision
example (μ : D((ℤ_[2])ˣ,ℤ_[2])) :
    AbstractMeasure.jointFiniteProjection 2 0
      ⟨PadicInt.unitToZModPow 2 2, PadicInt.continuous_unitToZModPow 2 2⟩ μ = 0 := sorry
-- UnitDescentTests.dyadic_joint_dirac
example : AbstractMeasure.jointFiniteProjection 2 2
    ⟨PadicInt.unitToZModPow 2 2, PadicInt.continuous_unitToZModPow 2 2⟩
    (AbstractMeasure.dirac ℤ_[2] (1 : (ℤ_[2])ˣ)) =
      Finsupp.single (PadicInt.unitToZModPow 2 2 1) 1 := sorry
end UnitDescentTests
end

/-! ## Ordinary moments over coefficient algebras

The coordinate is the existing pointwise scalar action on the constant-one test.
Only continuous scalar action is needed here. Formal exponential substitution
additionally requires a rational algebra; it is not imposed on the p-adic integers.
-/
namespace AbstractMeasure
section AlgebraMoments
variable {p : ℕ} [Fact p.Prime]
variable {R : Type*} [NormedCommRing R] [Algebra ℤ_[p] R]
  [ContinuousSMul ℤ_[p] R]
local notation "xR" => ((ContinuousMap.id ℤ_[p]) • (1 : C(ℤ_[p], R)))

theorem id_mul_mahler_algebra (n : ℕ) :
    xR * ((mahler n : C(ℤ_[p], ℤ_[p])) • (1 : C(ℤ_[p], R))) =
      (n + 1) • ((mahler (n + 1) : C(ℤ_[p], ℤ_[p])) • (1 : C(ℤ_[p], R))) +
        n • ((mahler n : C(ℤ_[p], ℤ_[p])) • (1 : C(ℤ_[p], R))) := by sorry

theorem constantCoeff_amiceTransform (μ : D(ℤ_[p], R)) :
    PowerSeries.constantCoeff μ.amiceTransform = μ 1 := by sorry

theorem amiceTransform_weight_id_algebra (μ : D(ℤ_[p], R)) :
    (weight xR μ).amiceTransform =
      PowerSeries.mahlerDerivation R μ.amiceTransform := by sorry

theorem amiceTransform_iterate_weight_id_algebra (μ : D(ℤ_[p], R)) (k : ℕ) :
    ((weight xR)^[k] μ).amiceTransform =
      (PowerSeries.mahlerDerivation R)^[k] μ.amiceTransform := by sorry

theorem ordinaryMoment_eq_constantCoeff_algebra (μ : D(ℤ_[p], R)) (k : ℕ) :
    μ (xR ^ k) =
      PowerSeries.constantCoeff ((PowerSeries.mahlerDerivation R)^[k] μ.amiceTransform) := by sorry

theorem ordinaryMoment_eq_factorial_coeff_algebra [Algebra ℚ R]
    (μ : D(ℤ_[p], R)) (k : ℕ) :
    μ (xR ^ k) = (k.factorial : R) * PowerSeries.coeff k
      (PowerSeries.subst (PowerSeries.exp R - 1) μ.amiceTransform) := by sorry
end AlgebraMoments
end AbstractMeasure

namespace SuggestedTests.AlgebraMoments
open AbstractMeasure PowerSeries
-- Same standard norm-action instance used by the earlier rational-coefficient tests.
local instance (p : ℕ) [Fact p.Prime] : IsBoundedSMul ℤ_[p] ℚ_[p] :=
  IsBoundedSMul.of_norm_smul_le (by sorry)
-- AlgebraMomentTests.integral_coordinate: exactly the preceding integral test function.
example {p : ℕ} [Fact p.Prime] :
    (ContinuousMap.id ℤ_[p]) • (1 : C(ℤ_[p], ℤ_[p])) = ContinuousMap.id ℤ_[p] := by sorry
-- AlgebraMomentTests.zeroth_mass: degree zero retains the atom at zero.
example :
    let xQ : C(ℤ_[2],ℚ_[2]) := (ContinuousMap.id ℤ_[2]) • 1
    (dirac ℚ_[2] (0 : ℤ_[2])) (xQ ^ 0) = 1 := by sorry
-- AlgebraMomentTests.zero_measure: any degree and any coefficient algebra.
example {p : ℕ} [Fact p.Prime] {R : Type*} [NormedCommRing R]
    [Algebra ℤ_[p] R] [ContinuousSMul ℤ_[p] R] (k : ℕ) :
    constantCoeff ((mahlerDerivation R)^[k] (0 : D(ℤ_[p],R)).amiceTransform) = 0 := by sorry
-- AlgebraMomentTests.scaled_atom: arbitrary coefficient-field scalar.
example {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
    [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] (c : K) (a : ℤ_[p]) (k : ℕ) :
    constantCoeff ((mahlerDerivation K)^[k] (c • dirac K a).amiceTransform) =
      c * (algebraMap ℤ_[p] K a) ^ k := by sorry
-- AlgebraMomentTests.dyadic_second: ordinary and binomial moments differ.
example :
    let μ := dirac ℚ_[2] (2 : ℤ_[2])
    constantCoeff ((mahlerDerivation ℚ_[2])^[2] μ.amiceTransform) = 4 ∧
      coeff 2 μ.amiceTransform = 1 := by sorry
-- AlgebraMomentTests.nonintegral_third: the measure need not take values in Z_3.
example :
    let μ : D(ℤ_[3],ℚ_[3]) := (1 / 3 : ℚ_[3]) • dirac ℚ_[3] (2 : ℤ_[3])
    constantCoeff ((mahlerDerivation ℚ_[3])^[3] μ.amiceTransform) = 8 / 3 ∧
      coeff 3 μ.amiceTransform = 0 := by sorry
-- AlgebraMomentTests.factorial: omitting 3! changes 8/3 into 4/9.
example :
    let μ : D(ℤ_[3],ℚ_[3]) := (1 / 3 : ℚ_[3]) • dirac ℚ_[3] (2 : ℤ_[3])
    coeff 3 (subst (exp ℚ_[3] - 1) μ.amiceTransform) = 4 / 9 := by sorry
-- AlgebraMomentTests.weight_zero_atom: multiplication by the coordinate is not injective.
example :
    let xQ : C(ℤ_[2],ℚ_[2]) := (ContinuousMap.id ℤ_[2]) • 1
    weight xQ (dirac ℚ_[2] (0 : ℤ_[2])) = 0 := by sorry
end SuggestedTests.AlgebraMoments

/-! Reconstruction of integral unit measures from compatible finite coefficients.
The input is an explicit family and its transition law. This is not a new
completed group-algebra carrier. -/
noncomputable section
open scoped AbstractMeasure
namespace AbstractMeasure
variable (p : ℕ) [Fact p.Prime]
variable (c : ∀ n : ℕ, (ZMod (p^n))ˣ →₀ ℤ_[p])
variable (hc : ∀ {m n : ℕ} (h : m ≤ n),
  Finsupp.mapDomain (ZMod.unitsMap (pow_dvd_pow p h)) (c n) = c m)

include hc in
lemma unitCoordinate_pairing_refinement (m n : ℕ) (h : m ≤ n)
    (g : (ZMod (p^m))ˣ → ℤ_[p]) :
    ∑ a, g a * c m a =
      ∑ b, g (ZMod.unitsMap (pow_dvd_pow p h) b) * c n b := by sorry
include hc in
lemma unitCoordinate_pairing_independent (m n : ℕ)
    (g : (ZMod (p^m))ˣ → ℤ_[p]) (h : (ZMod (p^n))ˣ → ℤ_[p])
    (heq : g ∘ PadicInt.unitToZModPow p m = h ∘ PadicInt.unitToZModPow p n) :
    ∑ a, g a * c m a = ∑ b, h b * c n b := by sorry

def unitCoordinateIntegral (c : ∀ n : ℕ, (ZMod (p^n))ˣ →₀ ℤ_[p])
    (hc : ∀ {m n : ℕ} (h : m ≤ n),
      Finsupp.mapDomain (ZMod.unitsMap (pow_dvd_pow p h)) (c n) = c m) : LocallyConstant (ℤ_[p])ˣ ℤ_[p] →ₗ[ℤ_[p]] ℤ_[p] := by sorry
lemma unitCoordinateIntegral_factor (f : LocallyConstant (ℤ_[p])ˣ ℤ_[p])
    (n : ℕ) (g : (ZMod (p^n))ˣ → ℤ_[p])
    (hg : g ∘ PadicInt.unitToZModPow p n = f) :
    unitCoordinateIntegral p c hc f = ∑ a, g a * c n a := by sorry
lemma unitCoordinateIntegral_norm_le (f : LocallyConstant (ℤ_[p])ˣ ℤ_[p]) :
    ‖unitCoordinateIntegral p c hc f‖ ≤ ‖f.toContinuousMap‖ := by sorry
lemma unitCoordinateIntegral_zero : unitCoordinateIntegral p c hc 0 = 0 := by sorry
lemma unitCoordinateIntegral_add (f g : LocallyConstant (ℤ_[p])ˣ ℤ_[p]) :
    unitCoordinateIntegral p c hc (f+g) =
      unitCoordinateIntegral p c hc f + unitCoordinateIntegral p c hc g := by sorry
lemma unitCoordinateIntegral_smul (a : ℤ_[p]) (f : LocallyConstant (ℤ_[p])ˣ ℤ_[p]) :
    unitCoordinateIntegral p c hc (a • f) = a * unitCoordinateIntegral p c hc f := by sorry

def ofUnitCoordinates (c : ∀ n : ℕ, (ZMod (p^n))ˣ →₀ ℤ_[p])
    (hc : ∀ {m n : ℕ} (h : m ≤ n),
      Finsupp.mapDomain (ZMod.unitsMap (pow_dvd_pow p h)) (c n) = c m) : D((ℤ_[p])ˣ,ℤ_[p]) := by sorry
lemma ofUnitCoordinates_locallyConstant (f : LocallyConstant (ℤ_[p])ˣ ℤ_[p]) :
    ofUnitCoordinates p c hc f.toContinuousMap = unitCoordinateIntegral p c hc f := by sorry
lemma ofUnitCoordinates_norm_le (f : C((ℤ_[p])ˣ,ℤ_[p])) :
    ‖ofUnitCoordinates p c hc f‖ ≤ ‖f‖ := by sorry
lemma finiteProjection_ofUnitCoordinates (n : ℕ) :
    finiteProjection ⟨PadicInt.unitToZModPow p n, PadicInt.continuous_unitToZModPow p n⟩
      (ofUnitCoordinates p c hc) = c n := by sorry
lemma ofUnitCoordinates_mass :
    ofUnitCoordinates p c hc (ContinuousMap.const _ 1) = c 0 1 := by sorry
lemma ofUnitCoordinates_zero
    (h0 : ∀ {m n : ℕ} (h : m ≤ n),
      Finsupp.mapDomain (ZMod.unitsMap (pow_dvd_pow p h)) (0 : (ZMod (p^n))ˣ →₀ ℤ_[p]) = 0) :
    ofUnitCoordinates p (fun _ => 0) h0 = 0 := by sorry
lemma ofUnitCoordinates_add
    (d : ∀ n : ℕ, (ZMod (p^n))ˣ →₀ ℤ_[p])
    (hd : ∀ {m n : ℕ} (h : m ≤ n),
      Finsupp.mapDomain (ZMod.unitsMap (pow_dvd_pow p h)) (d n) = d m)
    (hcd : ∀ {m n : ℕ} (h : m ≤ n),
      Finsupp.mapDomain (ZMod.unitsMap (pow_dvd_pow p h)) (c n+d n) = c m+d m) :
    ofUnitCoordinates p (fun n => c n+d n) hcd =
      ofUnitCoordinates p c hc + ofUnitCoordinates p d hd := by sorry
lemma ofUnitCoordinates_smul (a : ℤ_[p])
    (hac : ∀ {m n : ℕ} (h : m ≤ n),
      Finsupp.mapDomain (ZMod.unitsMap (pow_dvd_pow p h)) (a • c n) = a • c m) :
    ofUnitCoordinates p (fun n => a • c n) hac = a • ofUnitCoordinates p c hc := by sorry

include hc in
theorem existsUnique_ofUnitCoordinates : ∃! μ : D((ℤ_[p])ˣ,ℤ_[p]),
    ∀ n, finiteProjection
      ⟨PadicInt.unitToZModPow p n, PadicInt.continuous_unitToZModPow p n⟩ μ = c n := by sorry

lemma unitCoordinates_compatible (μ : D((ℤ_[p])ˣ,ℤ_[p])) {m n : ℕ} (h : m ≤ n) :
    Finsupp.mapDomain (ZMod.unitsMap (pow_dvd_pow p h))
      (finiteProjection ⟨PadicInt.unitToZModPow p n, PadicInt.continuous_unitToZModPow p n⟩ μ) =
      finiteProjection ⟨PadicInt.unitToZModPow p m, PadicInt.continuous_unitToZModPow p m⟩ μ := by sorry
lemma ofUnitCoordinates_finiteProjection (μ : D((ℤ_[p])ˣ,ℤ_[p])) :
    ofUnitCoordinates p
      (fun n => finiteProjection ⟨PadicInt.unitToZModPow p n, PadicInt.continuous_unitToZModPow p n⟩ μ)
      (fun h => unitCoordinates_compatible p μ h) = μ := by sorry
end AbstractMeasure

namespace UnitCoordinateTests
open AbstractMeasure
variable (p : ℕ) [Fact p.Prime]
variable (c : ∀ n : ℕ, (ZMod (p^n))ˣ →₀ ℤ_[p])
variable (hc : ∀ {m n : ℕ} (h : m ≤ n),
  Finsupp.mapDomain (ZMod.unitsMap (pow_dvd_pow p h)) (c n) = c m)
-- UnitCoordinateTests.lc_zero: even nonzero coordinates annihilate the zero test.
example : unitCoordinateIntegral p c hc 0 = 0 := by sorry
-- UnitCoordinateTests.lc_constant: the zero group level records total mass.
example (a : ℤ_[p]) : unitCoordinateIntegral p c hc (LocallyConstant.const _ a) = a * c 0 1 := by sorry
-- UnitCoordinateTests.lc_dirac: no averaging factor appears.
example (u : (ℤ_[p])ˣ) (a : ℤ_[p])
    (hca : ∀ n, c n = Finsupp.single (PadicInt.unitToZModPow p n u) a)
    (f : LocallyConstant (ℤ_[p])ˣ ℤ_[p]) : unitCoordinateIntegral p c hc f = a * f u := by sorry
-- UnitCoordinateTests.zero: a zero family gives the zero actual measure.
example (hcz : ∀ n, c n = 0) : ofUnitCoordinates p c hc = 0 := by sorry
-- UnitCoordinateTests.dirac: actual native Dirac compatibility, with arbitrary integral mass.
example (u : (ℤ_[p])ˣ) (a : ℤ_[p])
    (hca : ∀ n, c n = Finsupp.single (PadicInt.unitToZModPow p n u) a) :
    ofUnitCoordinates p c hc = a • dirac ℤ_[p] u := by sorry
-- UnitCoordinateTests.mass_not_average: two atoms contribute the sum of their masses.
example (u v : (ℤ_[p])ˣ)
    (hca : ∀ n, c n = 2 • Finsupp.single (PadicInt.unitToZModPow p n u) 1 +
      3 • Finsupp.single (PadicInt.unitToZModPow p n v) 1) :
    ofUnitCoordinates p c hc (ContinuousMap.const _ 1) = 5 := by sorry
-- UnitCoordinateTests.dyadic_first_depth: shallow group quotients do not determine a measure.
example : finiteProjection
    ⟨PadicInt.unitToZModPow 2 1, PadicInt.continuous_unitToZModPow 2 1⟩
    (dirac ℤ_[2] (1 : (ℤ_[2])ˣ)-dirac ℤ_[2] (-1)) = 0 := by sorry
-- UnitCoordinateTests.dyadic_second_depth: both integral signs survive at depth two.
example : finiteProjection
    ⟨PadicInt.unitToZModPow 2 2, PadicInt.continuous_unitToZModPow 2 2⟩
    (dirac ℤ_[2] (1 : (ℤ_[2])ˣ)-dirac ℤ_[2] (-1)) ≠ 0 := by sorry
end UnitCoordinateTests
end

/-! Weak topology from actual finite unit coordinates. These are adapters on
native measures and function products, not a second completed group algebra. -/
noncomputable section
open scoped AbstractMeasure Topology
namespace AbstractMeasure
variable (p : ℕ) [Fact p.Prime]
local notation "M" => D((ℤ_[p])ˣ,ℤ_[p])
local notation "Q" => fun n : ℕ =>
  (ContinuousMap.mk (PadicInt.unitToZModPow p n) (PadicInt.continuous_unitToZModPow p n) :
    C((ℤ_[p])ˣ,(ZMod (p^n))ˣ))

theorem compactSpace_unitMeasures_weak :
    letI : TopologicalSpace M := WeakTopology
    CompactSpace M := by sorry

theorem isClosedEmbedding_unitCoordinates_weak :
    letI : TopologicalSpace M := WeakTopology
    Topology.IsClosedEmbedding (fun μ : M => fun (n : ℕ) (a : (ZMod (p^n))ˣ) =>
      finiteProjection (Q n) μ a) := by sorry

theorem range_unitCoordinates :
    Set.range (fun μ : M => fun (n : ℕ) (a : (ZMod (p^n))ˣ) => finiteProjection (Q n) μ a) =
      {c : ∀ n : ℕ, (ZMod (p^n))ˣ → ℤ_[p] |
        ∀ {m n : ℕ} (h : m ≤ n),
          Finsupp.mapDomain (ZMod.unitsMap (pow_dvd_pow p h))
            (Finsupp.equivFunOnFinite.symm (c n)) = Finsupp.equivFunOnFinite.symm (c m)} := by sorry

theorem continuous_ofUnitCoordinates {X : Type*} [TopologicalSpace X]
    (c : X → ∀ n : ℕ, (ZMod (p^n))ˣ →₀ ℤ_[p])
    (hc : ∀ x, ∀ {m n : ℕ} (h : m ≤ n),
      Finsupp.mapDomain (ZMod.unitsMap (pow_dvd_pow p h)) (c x n) = c x m)
    (hcont : ∀ n a, Continuous (fun x => c x n a)) :
    letI : TopologicalSpace M := WeakTopology
    Continuous (fun x => ofUnitCoordinates p (c x) (hc x)) := by sorry

theorem isClosedEmbedding_jointUnitCoordinates_weak :
    letI : TopologicalSpace M := WeakTopology
    Topology.IsClosedEmbedding (fun μ : M => fun (r n : ℕ) (a : (ZMod (p^n))ˣ) =>
      jointFiniteProjection p r (Q n) μ a) := by sorry

theorem tendsto_unitMeasures_weak_iff_joint {ι : Type*} (l : Filter ι)
    (μ : ι → M) (ν : M) :
    letI : TopologicalSpace M := WeakTopology
    Filter.Tendsto μ l (𝓝 ν) ↔ ∀ r n, ∀ᶠ i in l,
      jointFiniteProjection p r (Q n) (μ i) = jointFiniteProjection p r (Q n) ν := by sorry

lemma hasBasis_unitMeasures_weak_zero :
    letI : TopologicalSpace M := WeakTopology
    (𝓝 (0 : M)).HasBasis (fun _ : ℕ × ℕ => True)
      (fun k => {μ : M | jointFiniteProjection p k.1 (Q k.2) μ = 0}) := by sorry

lemma hasBasis_unitMeasures_weak_zero_diagonal :
    letI : TopologicalSpace M := WeakTopology
    (𝓝 (0 : M)).HasBasis (fun _ : ℕ => True)
      (fun k => {μ : M | jointFiniteProjection p k (Q k) μ = 0}) := by sorry

lemma unitMeasures_isTopologicalRing_weak :
    letI : TopologicalSpace M := WeakTopology
    IsTopologicalRing M := by sorry

lemma unitMeasures_isLinearTopology_weak :
    letI : TopologicalSpace M := WeakTopology
    IsLinearTopology M M := by sorry
end AbstractMeasure

namespace UnitCoordinateTopologyTests
open AbstractMeasure
-- UnitCoordinateTopologyTests.scaled_atoms: coefficient precision is topological data.
example (p : ℕ) [Fact p.Prime] :
    letI : TopologicalSpace D((ℤ_[p])ˣ,ℤ_[p]) := WeakTopology
    Filter.Tendsto (fun k : ℕ => (p : ℤ_[p])^k • dirac ℤ_[p] (1 : (ℤ_[p])ˣ))
      Filter.atTop (𝓝 0) := by sorry
-- UnitCoordinateTopologyTests.constant_atom: depth without coefficient precision is insufficient.
example :
    letI : TopologicalSpace D((ℤ_[2])ˣ,ℤ_[2]) := WeakTopology
    ¬ Filter.Tendsto (fun _ : ℕ => dirac ℤ_[2] (1 : (ℤ_[2])ˣ)) Filter.atTop (𝓝 0) := by sorry
-- UnitCoordinateTopologyTests.incompatible_mass: the ambient coordinate product is larger than the image.
example (p : ℕ) [Fact p.Prime] :
    ¬ ∃ μ : D((ℤ_[p])ˣ,ℤ_[p]),
      finiteProjection ⟨PadicInt.unitToZModPow p 0, PadicInt.continuous_unitToZModPow p 0⟩ μ =
        Finsupp.single 1 1 ∧
      finiteProjection ⟨PadicInt.unitToZModPow p 1, PadicInt.continuous_unitToZModPow p 1⟩ μ = 0 := by sorry
-- UnitCoordinateTopologyTests.independent_precisions: either shallow axis loses information.
example :
    let μ := (2 : ℤ_[2]) • (dirac ℤ_[2] (1 : (ℤ_[2])ˣ)-dirac ℤ_[2] (-1))
    jointFiniteProjection 2 1 ⟨PadicInt.unitToZModPow 2 2, PadicInt.continuous_unitToZModPow 2 2⟩ μ = 0 ∧
    jointFiniteProjection 2 2 ⟨PadicInt.unitToZModPow 2 1, PadicInt.continuous_unitToZModPow 2 1⟩ μ = 0 ∧
    jointFiniteProjection 2 2 ⟨PadicInt.unitToZModPow 2 2, PadicInt.continuous_unitToZModPow 2 2⟩ μ ≠ 0 := by sorry
-- UnitCoordinateTopologyTests.zero_precision: a basis member may be the whole space.
example (p : ℕ) [Fact p.Prime] (n : ℕ) :
    {μ : D((ℤ_[p])ˣ,ℤ_[p]) | jointFiniteProjection p 0
      ⟨PadicInt.unitToZModPow p n, PadicInt.continuous_unitToZModPow p n⟩ μ = 0} = Set.univ := by sorry
-- UnitCoordinateTopologyTests.dirac_parameter: the inverse coordinate topology agrees with native Dirac.
example (p : ℕ) [Fact p.Prime] :
    letI : TopologicalSpace D((ℤ_[p])ˣ,ℤ_[p]) := WeakTopology
    Continuous (dirac ℤ_[p] : (ℤ_[p])ˣ → D((ℤ_[p])ˣ,ℤ_[p])) := by sorry
-- UnitCoordinateTopologyTests.convolution_limits: joint weak continuity, not only separate continuity.
example (p : ℕ) [Fact p.Prime] :
    letI : TopologicalSpace D((ℤ_[p])ˣ,ℤ_[p]) := WeakTopology
    Continuous (fun z : D((ℤ_[p])ˣ,ℤ_[p]) × D((ℤ_[p])ˣ,ℤ_[p]) => z.1*z.2) := by sorry
-- UnitCoordinateTopologyTests.dyadic_square: integral signs do not split into eigenspaces.
example :
    let μ := dirac ℤ_[2] (-1 : (ℤ_[2])ˣ)-dirac ℤ_[2] 1
    μ*μ = (-2 : ℤ_[2]) • μ := by sorry
end UnitCoordinateTopologyTests
end

/-! Continuous-character integration and positive moments on actual unit measures.
No completed group algebra or total-fraction-ring character extension is assumed.
All new mathematical signatures are unchecked proof plans. -/
namespace AbstractMeasure
noncomputable section
open scoped AbstractMeasure
section CharacterIntegration
variable {G R : Type*} [TopologicalSpace G] [Monoid G] [ContinuousMul G]
  [LocallyCompactSpace G] [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]

-- This spelling follows the identified post-baseline Mathlib PR41961.
def diracHom : G →* D(G,R) := sorry
lemma diracHom_apply (g : G) : diracHom (R := R) g = dirac R g := sorry
lemma diracHom_pow (g : G) (k : ℕ) : diracHom (R := R) (g^k) = (dirac R g)^k := sorry
lemma diracHom_map {H : Type*} [TopologicalSpace H] [Monoid H]
    (h : ContinuousMonoidHom G H) (g : G) :
    map h.toContinuousMap (diracHom (R := R) g) = dirac R (h g) := sorry

def characterIntegralAlgHom (κ : ContinuousMonoidHom G R) : D(G,R) →ₐ[R] R := sorry
lemma characterIntegralAlgHom_apply (κ : ContinuousMonoidHom G R) (μ : D(G,R)) :
    characterIntegralAlgHom κ μ = μ κ.toContinuousMap := sorry
lemma characterIntegralAlgHom_dirac (κ : ContinuousMonoidHom G R) (g : G) :
    characterIntegralAlgHom κ (dirac R g) = κ g := sorry
lemma characterIntegralAlgHom_one_character (μ : D(G,R)) :
    characterIntegralAlgHom (1 : ContinuousMonoidHom G R) μ = μ 1 := sorry
lemma characterIntegralAlgHom_diracHom (κ : ContinuousMonoidHom G R) :
    (characterIntegralAlgHom κ).toMonoidHom.comp (diracHom (R := R)) = κ.toMonoidHom := sorry

-- UnitMomentTests.dirac_hom_one
example : diracHom (G := G) (R := R) 1 = 1 := sorry
-- UnitMomentTests.dirac_hom_zero_coefficients
example (g : G) : diracHom (R := ZMod 1) g = 0 := sorry
-- UnitMomentTests.dirac_hom_product
example (g h : G) : diracHom (R := R) (g*h) = dirac R g * dirac R h := sorry
-- UnitMomentTests.character_zero
example (κ : ContinuousMonoidHom G R) : characterIntegralAlgHom κ 0 = 0 := sorry
-- UnitMomentTests.character_identity_mass
example (κ : ContinuousMonoidHom G R) : characterIntegralAlgHom κ 1 = 1 := sorry
-- UnitMomentTests.character_scalar_atom
example (κ : ContinuousMonoidHom G R) (c : R) (g : G) :
    characterIntegralAlgHom κ (c • dirac R g) = c * κ g := sorry
end CharacterIntegration

section PositiveMoments
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]
local notation "U" => Zˣ
local notation "M" => D(U,Z)
local notation "uTest" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))
local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))

local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)

-- The inherited ring operations are unchanged; use the existing commutativity theorem locally.
local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }

lemma polynomial_apply_eq_zero_of_positive_moments (μ : D(Z,Z))
    (hμ : ∀ k : ℕ, 0 < k → μ ((ContinuousMap.id Z)^k) = 0)
    (f : Polynomial Z) (hf : f.coeff 0 = 0) :
    μ ⟨fun x => f.eval x, by fun_prop⟩ = 0 := sorry
lemma mahler_apply_eq_zero_of_positive_moments (μ : D(Z,Z))
    (hμ : ∀ k : ℕ, 0 < k → μ ((ContinuousMap.id Z)^k) = 0)
    (n : ℕ) (hn : 0 < n) : μ (mahler n) = 0 := sorry
lemma amice_eq_constant_of_positive_moments (μ : D(Z,Z))
    (hμ : ∀ k : ℕ, 0 < k → μ ((ContinuousMap.id Z)^k) = 0) :
    μ.amiceTransform = PowerSeries.C (μ 1) := sorry

theorem units_eq_zero_of_positive_moments (μ : M)
    (hμ : ∀ k : ℕ, 0 < k → μ (uTest^k) = 0) : μ = 0 := sorry
lemma units_mul_moment (μ ν : M) (k : ℕ) :
    (μ*ν) (uTest^k) = μ (uTest^k) * ν (uTest^k) := sorry
theorem units_regular_of_positive_moments (μ : M)
    (hμ : ∀ k : ℕ, 0 < k → μ (uTest^k) ≠ 0) : μ ∈ nonZeroDivisors M := sorry
lemma exists_one_add_prime_unit : ∃ a : U, (a : Z) = (p+1 : ℕ) := sorry
lemma one_add_prime_unit_pow_ne_one (a : U) (ha : (a : Z) = (p+1 : ℕ))
    (k : ℕ) (hk : 0 < k) : (a : Z)^k ≠ 1 := sorry
theorem dirac_sub_one_regular (a : U) (ha : ∀ k : ℕ, 0 < k → (a : Z)^k ≠ 1) :
    dirac Z a - 1 ∈ nonZeroDivisors M := sorry
theorem one_add_prime_dirac_sub_one_regular (a : U) (ha : (a : Z) = (p+1 : ℕ)) :
    dirac Z a - 1 ∈ nonZeroDivisors M := sorry

local notation "Q" => FractionRing M
local notation "PM" => Iwasawa.pseudomeasures (diracHom (G := U) (R := Z)) Q

def positivePseudoMoment (k : ℕ) (hk : 0 < k) : PM → ℚ_[p] := sorry
lemma positivePseudoMoment_eq (k : ℕ) (hk : 0 < k) (a : U)
    (ha : (a : Z) = (p+1 : ℕ)) (z : PM) :
    positivePseudoMoment p k hk z =
      ((Iwasawa.numerator (diracHom (G := U) (R := Z)) Q a z) (uTest^k) : ℚ_[p]) /
        ((a : Z)^k-1 : Z) := sorry
lemma positivePseudoMoment_integral (k : ℕ) (hk : 0 < k) (μ : M) :
    positivePseudoMoment p k hk (Iwasawa.integral (diracHom (G := U) (R := Z)) Q μ) =
      (μ (uTest^k) : ℚ_[p]) := sorry
lemma positivePseudoMoment_add (k : ℕ) (hk : 0 < k) (z η : PM) :
    positivePseudoMoment p k hk (z+η) =
      positivePseudoMoment p k hk z + positivePseudoMoment p k hk η := sorry
lemma positivePseudoMoment_smul (k : ℕ) (hk : 0 < k) (μ : M) (z : PM) :
    positivePseudoMoment p k hk (μ • z) =
      (μ (uTest^k) : ℚ_[p]) * positivePseudoMoment p k hk z := sorry
lemma positivePseudoMoment_numerator (k : ℕ) (hk : 0 < k) (g : U) (z : PM) :
    ((Iwasawa.numerator (diracHom (G := U) (R := Z)) Q g z) (uTest^k) : ℚ_[p]) =
      (((g : Z)^k-1 : Z) : ℚ_[p]) * positivePseudoMoment p k hk z := sorry
theorem pseudomeasure_eq_zero_of_positive_moments (z : PM)
    (hz : ∀ (k : ℕ) (hk : 0 < k), positivePseudoMoment p k hk z = 0) : z = 0 := sorry

theorem no_totalMass_fraction_extension :
    ¬ ∃ F : Q →+* Z, F.comp (algebraMap M Q) =
      (characterIntegralAlgHom (1 : ContinuousMonoidHom U Z)).toRingHom := sorry

-- UnitMomentTests.ambient_zero_atom
example : (∀ k : ℕ, 0 < k → dirac Z (0 : Z) ((ContinuousMap.id Z)^k) = 0) ∧
    dirac Z (0 : Z) ≠ 0 := sorry
-- UnitMomentTests.even_moments_insufficient
example : (∀ k : ℕ, (dirac Z (1 : U)-dirac Z (-1 : U)) (uTest^(2*k)) = 0) ∧
    dirac Z (1 : U)-dirac Z (-1 : U) ≠ 0 := sorry
-- UnitMomentTests.torsion_difference
example : (dirac Z (-1 : U)-1) * (dirac Z (-1 : U)+1) = 0 ∧
    dirac Z (-1 : U)+1 ≠ 0 := sorry
-- UnitMomentTests.regular_identity
example : (1 : M) ∈ nonZeroDivisors M := sorry
-- UnitMomentTests.pseudomoment_zero
example (k : ℕ) (hk : 0 < k) : positivePseudoMoment p k hk 0 = 0 := sorry
-- UnitMomentTests.pseudomoment_one
example (k : ℕ) (hk : 0 < k) : positivePseudoMoment p k hk
    (Iwasawa.integral (diracHom (G := U) (R := Z)) Q 1) = 1 := sorry
-- UnitMomentTests.pseudomoment_sign
example (k : ℕ) (hk : 0 < k) : positivePseudoMoment p k hk
    (Iwasawa.integral (diracHom (G := U) (R := Z)) Q (dirac Z (-1 : U))) = (-1 : ℚ_[p])^k := sorry
end PositiveMoments
end
end AbstractMeasure

namespace AbstractMeasure
noncomputable section
open scoped AbstractMeasure
section UnitCharacterEvaluation
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]
local notation "U" => Zˣ
local notation "M" => D(U,Z)
local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)
local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }
local notation "Q" => FractionRing M
local notation "δ" => (diracHom (G := U) (R := Z))
local notation "PM" => Iwasawa.pseudomeasures δ Q
local notation "uTest" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))

/-- The actual integral-character specialization, on the pseudomeasure module only. -/
def unitCharacterEval (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) : PM →+ ℚ_[p] := sorry
lemma unitCharacterEval_eq (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1)
    (g : U) (hg : κ g ≠ 1) (z : PM) :
    unitCharacterEval p κ hκ z =
      ((Iwasawa.numerator δ Q g z) κ.toContinuousMap : ℚ_[p]) / ((κ g-1 : Z) : ℚ_[p]) := sorry
lemma unitCharacterEval_integral (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (μ : M) :
    unitCharacterEval p κ hκ (Iwasawa.integral δ Q μ) = (μ κ.toContinuousMap : ℚ_[p]) := sorry
lemma unitCharacterEval_smul (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (μ : M) (z : PM) :
    unitCharacterEval p κ hκ (μ • z) =
      (μ κ.toContinuousMap : ℚ_[p]) * unitCharacterEval p κ hκ z := sorry
lemma unitCharacterEval_dirac (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (g : U) :
    unitCharacterEval p κ hκ (Iwasawa.integral δ Q (dirac Z g)) = (κ g : ℚ_[p]) := sorry
lemma unitCharacterEval_numerator (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1)
    (g : U) (z : PM) :
    ((Iwasawa.numerator δ Q g z) κ.toContinuousMap : ℚ_[p]) =
      ((κ g-1 : Z) : ℚ_[p]) * unitCharacterEval p κ hκ z := sorry

theorem unitCharacterEval_unique (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1)
    (L : PM →+ ℚ_[p])
    (hL : ∀ (μ : M) (z : PM), L (μ • z) = (μ κ.toContinuousMap : ℚ_[p]) * L z)
    (hI : ∀ μ : M, L (Iwasawa.integral δ Q μ) = (μ κ.toContinuousMap : ℚ_[p])) :
    L = unitCharacterEval p κ hκ := sorry
lemma unitCharacterEval_eq_positivePseudoMoment (κ : ContinuousMonoidHom U Z)
    (hκ : κ ≠ 1) (k : ℕ) (hk : 0 < k) (hpow : ∀ g : U, κ g = (g : Z)^k) (z : PM) :
    unitCharacterEval p κ hκ z = positivePseudoMoment p k hk z := sorry
theorem unitCharacterEval_ext (z η : PM)
    (h : ∀ (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1),
      unitCharacterEval p κ hκ z = unitCharacterEval p κ hκ η) : z = η := sorry
lemma unitCharacterEval_norm_le (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1)
    (g : U) (hg : κ g ≠ 1) (z : PM) :
    ‖unitCharacterEval p κ hκ z‖ ≤ ‖κ g-1‖⁻¹ := sorry

variable {S : Type*} [TopologicalSpace S]
lemma continuous_unitCharacterIntegral (κ : S → ContinuousMonoidHom U Z)
    (hκ : Continuous (fun s => (κ s).toContinuousMap)) (μ : M) :
    Continuous (fun s => (μ (κ s).toContinuousMap : ℚ_[p])) := sorry
lemma isOpen_unitCharacterClearing (κ : S → ContinuousMonoidHom U Z)
    (hκ : Continuous (fun s => (κ s).toContinuousMap)) (g : U) :
    IsOpen {s : S | κ s g ≠ 1} := sorry
lemma continuousOn_unitCharacterClearing (κ : S → ContinuousMonoidHom U Z)
    (hκ : Continuous (fun s => (κ s).toContinuousMap)) (g : U) (z : PM) :
    ContinuousOn (fun s => ((Iwasawa.numerator δ Q g z) (κ s).toContinuousMap : ℚ_[p]) /
      ((κ s g-1 : Z) : ℚ_[p])) {s : S | κ s g ≠ 1} := sorry
theorem continuous_unitCharacterEval (κ : S → ContinuousMonoidHom U Z)
    (hκ : Continuous (fun s => (κ s).toContinuousMap)) (z : PM) :
    Continuous (fun s : {s : S // κ s ≠ 1} => unitCharacterEval p (κ s.val) s.property z) := sorry

-- UnitCharacterTests.zero
example (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) : unitCharacterEval p κ hκ 0 = 0 := sorry
-- UnitCharacterTests.one
example (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) :
    unitCharacterEval p κ hκ (Iwasawa.integral δ Q 1) = 1 := sorry
-- UnitCharacterTests.scalar_atom
example (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (c : Z) (g : U) :
    unitCharacterEval p κ hκ (Iwasawa.integral δ Q (c • dirac Z g)) = (c*κ g : Z) := sorry
-- UnitCharacterTests.trivial_character_no_patch
example (g : U) : (1 : ContinuousMonoidHom U Z) g-1 = 0 := sorry
-- UnitCharacterTests.torsion_clearing_allowed
example (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (hs : κ (-1) = -1) (z : PM) :
    unitCharacterEval p κ hκ z =
      ((Iwasawa.numerator δ Q (-1) z) κ.toContinuousMap : ℚ_[p]) / (-2) := sorry
-- UnitCharacterTests.kernel_numerator
example (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (g : U) (hg : κ g = 1) (z : PM) :
    ((Iwasawa.numerator δ Q g z) κ.toContinuousMap : ℚ_[p]) = 0 := sorry
-- UnitCharacterTests.dyadic_denominator_not_integral_unit
example : (-2 : ℚ_[2]) ≠ 0 ∧ ¬ IsUnit (-2 : ℤ_[2]) := sorry
-- UnitCharacterTests.constant_family
example (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (z : PM) :
    Continuous (fun _s : S => unitCharacterEval p κ hκ z) := sorry
-- UnitCharacterTests.power_sign
example (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (k : ℕ)
    (hpow : ∀ g : U, κ g = (g : Z)^k) :
    unitCharacterEval p κ hκ (Iwasawa.integral δ Q (dirac Z (-1))) = (-1 : ℚ_[p])^k := sorry
end UnitCharacterEvaluation
end
end AbstractMeasure

/-! Residue-class restrictions on the existing bounded measure carrier.
No Fourier averaging or coefficient-field extension is implicit in these signatures. -/
namespace PadicInt
variable {p : ℕ} [Fact p.Prime]

lemma isClopen_toZModPow_fiber (n : ℕ) (a : ZMod (p ^ n)) :
    IsClopen {x : ℤ_[p] | toZModPow n x = a} := sorry

lemma toZModPow_eq_iff_sub_dvd (n : ℕ) (x b : ℤ_[p]) :
    toZModPow n x = toZModPow n b ↔ (p : ℤ_[p]) ^ n ∣ x - b := sorry
end PadicInt

namespace AbstractMeasure
section ResidueRestriction
variable (p : ℕ) [Fact p.Prime] (R : Type*) [NormedCommRing R]
local notation "Z" => ℤ_[p]
local notation "ρ" => PadicInt.toZModPow (p := p)
local notation "χ" => (fun (n : ℕ) (a : ZMod (p ^ n)) =>
  LocallyConstant.toContinuousMap (LocallyConstant.charFn R (PadicInt.isClopen_toZModPow_fiber n a)))

/-- Ambient restriction; intrinsic measures on the fiber use the existing restrictClopen. -/
def restrictResidue (n : ℕ) (a : ZMod (p ^ n)) : D(Z, R) →ₗ[R] D(Z, R) :=
  weight (χ n a)

lemma restrictResidue_apply (n : ℕ) (a : ZMod (p ^ n))
    (μ : D(Z, R)) (f : C(Z, R)) : restrictResidue p R n a μ f = μ (χ n a * f) := sorry

lemma restrictResidue_dirac (n : ℕ) (a : ZMod (p ^ n)) (x : Z) :
    restrictResidue p R n a (dirac R x) = if ρ n x = a then dirac R x else 0 := sorry

lemma restrictResidue_comp (n : ℕ) (a b : ZMod (p ^ n)) (μ : D(Z, R)) :
    restrictResidue p R n a (restrictResidue p R n b μ) =
      if a = b then restrictResidue p R n a μ else 0 := sorry

lemma sum_restrictResidue (n : ℕ) (μ : D(Z, R)) :
    ∑ a : ZMod (p ^ n), restrictResidue p R n a μ = μ := sorry

lemma restrictResidue_zero_depth (a : ZMod (p ^ 0)) (μ : D(Z, R)) :
    restrictResidue p R 0 a μ = μ := sorry

lemma restrictResidue_refinement (m n : ℕ) (h : m ≤ n)
    (a : ZMod (p ^ m)) (μ : D(Z, R)) :
    restrictResidue p R m a μ =
      ∑ b : ZMod (p ^ n), if ZMod.castHom (pow_dvd_pow p h) (ZMod (p ^ m)) b = a
        then restrictResidue p R n b μ else 0 := sorry

lemma restrictResidue_mass (n : ℕ) (a : ZMod (p ^ n)) (μ : D(Z, R)) :
    restrictResidue p R n a μ 1 =
      finiteProjection ⟨ρ n, PadicInt.continuous_toZModPow p n⟩ μ a := sorry

lemma finiteProjection_restrictResidue (n : ℕ) (a : ZMod (p ^ n)) (μ : D(Z, R)) :
    finiteProjection ⟨ρ n, PadicInt.continuous_toZModPow p n⟩ (restrictResidue p R n a μ) =
      Finsupp.single a (finiteProjection ⟨ρ n, PadicInt.continuous_toZModPow p n⟩ μ a) := sorry

lemma restrictResidue_map_add (n : ℕ) (a : ZMod (p ^ n)) (b : Z) (μ : D(Z, R)) :
    restrictResidue p R n a (map ⟨fun x : Z => x + b, by fun_prop⟩ μ) =
      map ⟨fun x : Z => x + b, by fun_prop⟩ (restrictResidue p R n (a - ρ n b) μ) := sorry

lemma restrictResidue_eq_map_restrictClopen (n : ℕ) (a : ZMod (p ^ n)) (μ : D(Z, R)) :
    let s : TopologicalSpace.Clopens Z := ⟨{x | ρ n x = a}, PadicInt.isClopen_toZModPow_fiber n a⟩
    restrictResidue p R n a μ = map (ContinuousMap.subtypeVal s) (restrictClopen s R μ) := sorry

lemma continuous_restrictResidue_weak (n : ℕ) (a : ZMod (p ^ n)) :
    letI : TopologicalSpace D(Z, R) := WeakTopology
    Continuous (restrictResidue p R n a) := sorry

lemma restrictResidue_one_zero (μ : D(Z, R)) :
    restrictResidue p R 1 0 μ = restrictMultiples p R μ := sorry

variable [Algebra ℤ_[p] R] [ContinuousSMul ℤ_[p] R]
lemma coeff_amiceTransform_restrictResidue (n : ℕ) (a : ZMod (p ^ n))
    (μ : D(Z, R)) (k : ℕ) :
    PowerSeries.coeff k (restrictResidue p R n a μ).amiceTransform =
      μ (χ n a * ((mahler k : C(Z, Z)) • (1 : C(Z, R)))) := sorry
end ResidueRestriction

section ResidueRestrictionTests
-- ResidueRestrictionTests.depth_zero
example (μ : D(ℤ_[2], ℤ)) : restrictResidue 2 ℤ 0 0 μ = μ := sorry
-- ResidueRestrictionTests.dyadic_inside
example : restrictResidue 2 ℤ 2 1 (dirac ℤ (5 : ℤ_[2])) = dirac ℤ 5 := sorry
-- ResidueRestrictionTests.dyadic_outside
example : restrictResidue 2 ℤ 2 1 (dirac ℤ (3 : ℤ_[2])) = 0 := sorry
-- ResidueRestrictionTests.signed_atoms
example : restrictResidue 3 ℤ 2 1
    ((2 : ℤ) • dirac ℤ (1 : ℤ_[3]) - (3 : ℤ) • dirac ℤ 10 + dirac ℤ 2) =
      (2 : ℤ) • dirac ℤ 1 - (3 : ℤ) • dirac ℤ 10 := sorry
-- ResidueRestrictionTests.two_distinct_fibers
example (μ : D(ℤ_[2], ℤ)) :
    restrictResidue 2 ℤ 2 1 (restrictResidue 2 ℤ 2 3 μ) = 0 := sorry
-- ResidueRestrictionTests.refine_odd
example (μ : D(ℤ_[2], ℤ)) : restrictResidue 2 ℤ 1 1 μ =
    restrictResidue 2 ℤ 2 1 μ + restrictResidue 2 ℤ 2 3 μ := sorry
-- ResidueRestrictionTests.translation_sign
example : restrictResidue 3 ℤ 1 0
    (map ⟨fun x : ℤ_[3] => x + 2, by fun_prop⟩ (dirac ℤ 1)) = dirac ℤ 3 := sorry
-- ResidueRestrictionTests.first_moment
example : PowerSeries.coeff 1 (restrictResidue 2 ℤ_[2] 2 1 (dirac ℤ_[2] 5)).amiceTransform = 5 := sorry
end ResidueRestrictionTests
end AbstractMeasure

/-! ## L4: Weierstrass theory and the structure of Iwasawa modules (checkpoint L4-1)

Signatures for NSW V §§1, 3 and RJW §13.1. Mathlib already supplies Weierstrass division and preparation
(`PowerSeries.exists_isWeierstrassFactorization`, `PowerSeries.IsWeierstrassFactorization.unique`), noetherianity of
`R⟦X⟧` and factoriality of `R⟦X⟧` for a principal ideal domain `R`; nothing here restates them. -/

namespace TauCeti.Iwasawa

open Polynomial

section PseudoNull

variable (A : Type*) [CommRing A] (M : Type*) [AddCommGroup M] [Module A M]

/-- `L4/pseudo-null`: a finitely generated module is pseudo-null if it vanishes at every prime of height at most
one (NSW (5.1.4)). -/
def IsPseudoNull : Prop :=
  Module.Finite A M ∧
    ∀ 𝔭 : PrimeSpectrum A, 𝔭.asIdeal.height ≤ 1 → Subsingleton (LocalizedModule 𝔭.asIdeal.primeCompl M)

/-- `L4/pseudo-null`: pseudo-null modules are torsion (NSW (5.1.4), Remark 2). -/
theorem IsPseudoNull.isTorsion [IsDomain A] (h : IsPseudoNull A M) : Module.IsTorsion A M := sorry

/-- `L4/pseudo-null`: over a two-dimensional noetherian integrally closed local domain with finite residue field,
pseudo-null means finite (NSW (5.1.4), Remark 4). -/
theorem isPseudoNull_iff_finite [IsDomain A] [IsNoetherianRing A] [IsIntegrallyClosed A] [IsLocalRing A]
    [Finite (IsLocalRing.ResidueField A)] (hdim : ringKrullDim A = 2) [Module.Finite A M] :
    IsPseudoNull A M ↔ Finite M := sorry

variable {A M} {N : Type*} [AddCommGroup N] [Module A N]

/-- `L4/pseudo-isomorphism`: kernel and cokernel are pseudo-null (NSW (5.1.5)). -/
def IsPseudoIsomorphism (f : M →ₗ[A] N) : Prop :=
  IsPseudoNull A (LinearMap.ker f) ∧ IsPseudoNull A (N ⧸ LinearMap.range f)

end PseudoNull

section CharacteristicIdeal

variable (A : Type*) [CommRing A] [IsDomain A] [IsNoetherianRing A] [IsIntegrallyClosed A]
  (M : Type*) [AddCommGroup M] [Module A M]

/-- `L4/characteristic-ideal`: the divisor of a finitely generated torsion module, `𝔭 ↦ length_{A_𝔭} M_𝔭` at the
height-one primes (zero elsewhere). -/
noncomputable def charDivisor [Module.Finite A M]
    (hM : Module.IsTorsion A M) : PrimeSpectrum A →₀ ℕ := sorry

/-- The finite-support and finite-length inputs are review gaps, not consequences of a name search. -/
theorem charDivisor_spec [Module.Finite A M] (hM : Module.IsTorsion A M)
    (𝔭 : PrimeSpectrum A) :
    charDivisor A M hM 𝔭 =
      if 𝔭.asIdeal.height = 1 then
        (Module.length (Localization.AtPrime 𝔭.asIdeal)
          (LocalizedModule 𝔭.asIdeal.primeCompl M)).toNat
      else 0 := sorry

/-- `L4/characteristic-ideal`: over a unique factorisation domain the divisor is principal; `charIdeal` is the
ideal it generates. -/
noncomputable def charIdeal [UniqueFactorizationMonoid A] (M : Type*) [AddCommGroup M]
    [Module A M] [Module.Finite A M] (hM : Module.IsTorsion A M) : Ideal A :=
  sorry

/-- `L4/characteristic-ideal`: the value on a cyclic module. -/
theorem charIdeal_quotient_span [UniqueFactorizationMonoid A] (f : A) (hf : f ≠ 0) :
    charIdeal A (A ⧸ Ideal.span {f}) (by sorry) = Ideal.span {f} := sorry

/-- `L4/characteristic-ideal`: finite modules over a two-dimensional local ring have unit characteristic ideal. -/
theorem charIdeal_eq_top_of_isPseudoNull [UniqueFactorizationMonoid A]
    [Module.Finite A M] (h : IsPseudoNull A M) :
    charIdeal A M (h.isTorsion) = ⊤ := sorry

end CharacteristicIdeal

section IwasawaInvariants

variable (p : ℕ) [Fact p.Prime] (M : Type*) [AddCommGroup M] [Module (PowerSeries ℤ_[p]) M]
  [Module.Finite (PowerSeries ℤ_[p]) M]

/-- `L4/iwasawa-invariants`: the μ-invariant (NSW (5.3.9)). -/
noncomputable def muInvariant (M : Type*) [AddCommGroup M]
    [Module (PowerSeries ℤ_[p]) M] [Module.Finite (PowerSeries ℤ_[p]) M] : ℕ := sorry

/-- `L4/iwasawa-invariants`: the λ-invariant (NSW (5.3.9)). -/
noncomputable def lambdaInvariant (M : Type*) [AddCommGroup M]
    [Module (PowerSeries ℤ_[p]) M] [Module.Finite (PowerSeries ℤ_[p]) M] : ℕ := sorry

/-- `L4/iwasawa-invariants`: the characteristic polynomial `F_{M,γ}`, a product of irreducible distinguished
polynomials (NSW (5.3.9)). -/
noncomputable def charPoly (M : Type*) [AddCommGroup M]
    [Module (PowerSeries ℤ_[p]) M] [Module.Finite (PowerSeries ℤ_[p]) M] : ℤ_[p][X] := sorry

theorem charPoly_isDistinguishedAt :
    (charPoly p M).IsDistinguishedAt (IsLocalRing.maximalIdeal ℤ_[p]) := sorry

/-- `L4/iwasawa-invariants`: a finitely generated torsion module is finite iff `μ = λ = 0` (NSW (5.3.9), Remark 2). -/
theorem finite_iff_mu_lambda (hM : Module.IsTorsion (PowerSeries ℤ_[p]) M) :
    Finite M ↔ muInvariant p M = 0 ∧ lambdaInvariant p M = 0 := sorry

end IwasawaInvariants

/-! ### L4 arithmetic controls

These examples test the displayed identities. They do not test the missing module interfaces,
and the independent review has not freshly elaborated this file. -/

namespace L4Tests

/-- `L4/cyclotomic-weierstrass-polynomials`: `ξ₁ = 1 + (1+T) + (1+T)² = T² + 3T + 3` for `p = 3`, a distinguished
polynomial. -/
example : (1 + (1 + X) + (1 + X) ^ 2 : ℤ[X]) = X ^ 2 + 3 * X + 3 := by ring

/-- `L4/cyclotomic-weierstrass-polynomials`: `ω₁ = (1+T)² − 1 = T² + 2T` for `p = 2`. -/
example : ((1 + X) ^ 2 - 1 : ℤ[X]) = X ^ 2 + 2 * X := by ring

/-- `L4/cyclotomic-weierstrass-polynomials`: modulo `p`, `ω_n ≡ T^{p^n}` (here `p = 2`, `n = 2`). -/
example : ((1 + X) ^ 4 - 1 : (ZMod 2)[X]) = X ^ 4 := by
  have h := add_pow_char_pow (R := (ZMod 2)[X]) (p := 2) (n := 2) (1 : (ZMod 2)[X]) X
  norm_num at h
  rw [h]
  ring

/-- `L4/iwasawa-growth-formula` (Lemma 5.3.18, `λ = 1`): on `Λ/(T − 3)` (γ acting by `4`), `ξ₂ = Σ_{i<3} γ^{3i}` acts by
`1 + 4³ + 4⁶ = 3 · 1387` with `3 ∤ 1387`, so `ξ₂ M = 3M`. -/
example : (1 + 4 ^ 3 + 4 ^ 6 : ℤ) = 3 * 1387 ∧ ¬ (3 : ℤ) ∣ 1387 := by decide

/-- `L4/finite-coinvariants-euler-characteristic`: for `M = Λ/(T − p)` and `n = 0`, `#M_Γ = p` and `M^Γ = 0`, and the
formula's right side is `|F(0)|_p = |−p|_p = 1/p` (here `p = 3`). -/
example : padicNorm 3 (-3 : ℚ) = 1 / 3 := by
  have h := padicNorm.padicNorm_p (p := 3) (by norm_num)
  rw [padicNorm.neg]
  norm_num at h ⊢
  exact h

/-- `L4/iwasawa-invariants` (non-example): the characteristic polynomial depends on γ. For `M = Λ/(T − p)`
(γ acting by `1 + p`), for odd prime p the generator `γ²` acts by `(1 + p)² = 1 + (2p + p²)`, so `F_{M,γ²} = T − (2p + p²)`. -/
example (p : ℤ) : (1 + p) ^ 2 - 1 = 2 * p + p ^ 2 := by ring

/-- `L4/character-decomposition` (`|H| = 2`, `p` odd): `e_± = (1 ± h)/2` are orthogonal idempotents. -/
example (h : ℚ) (hh : h ^ 2 = 1) :
    ((1 + h) / 2) ^ 2 = (1 + h) / 2 ∧ ((1 + h) / 2) * ((1 - h) / 2) = 0 ∧ (1 + h) / 2 + (1 - h) / 2 = 1 := by
  refine ⟨?_, ?_, ?_⟩
  · linear_combination (1 / 4 : ℚ) * hh
  · linear_combination (-1 / 4 : ℚ) * hh
  · ring

/-- `L4/weierstrass-adapter`: Mathlib's preparation theorem is the adapter's source. -/
example {A : Type*} [CommRing A] [IsLocalRing A] [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    {g : PowerSeries A} (hg : g.map (IsLocalRing.residue A) ≠ 0) :
    ∃ f h, g.IsWeierstrassFactorization f h :=
  PowerSeries.exists_isWeierstrassFactorization hg

end L4Tests

end TauCeti.Iwasawa

/-!
# PadicMeasuresIwasawaAlgebras L6: character group rings, quadratic presentations, compound
# matrices and transposes (FIX-RT-AREA-iwasawa-2~2, finding RT-AREA-iwasawa-2/4)

These declarations suggest Lean forms for the Dasgupta–Kakde ring theory that L6 owns
(arXiv:2010.00657v3, §§2.2–2.3, Lemma 3.9, §6.1, Remark A.7 and (171)). They are signatures and
tests only: every proof is `sorry`, and nothing is claimed formalised.

* `TauCeti.Module.fittingIdeal` stands for the Fitting ideals of a finitely generated module, which
  this roadmap requests from the Tau Ceti roadmap StableReduction, Layer 1 (accepted RS-16). It
  is written out by minors of relations, exactly as in `AdicSpacesPartII.lean`, so that the
  statements below can be stated; L6 does not own it.
* The transpose of a presentation reuses the pinned `TauCeti.AuslanderReitenTranspose`
  (`TauCeti/Algebra/Module/AuslanderReiten/Transpose.lean`, Tau Ceti f790474).
* Characters are group homomorphisms `G →* Oˣ`; `ψ(x)` for `x ∈ O[G]` is `charEval ψ x`. The
  coefficient hypotheses of Dasgupta–Kakde (odd `p`, `O` the valuation ring of a finite extension
  of `ℚ_p` containing all character values) are carried as hypotheses where a statement needs
  them: `[IsDomain O] [CharZero O]`, a finite residue field, and `HasEnoughCharacters O G`
  (written `Nat.card (G →* Oˣ) = Nat.card G`).
-/

section L6

noncomputable section

open scoped Pointwise

namespace TauCeti

/-! ## PadicMeasuresIwasawaAlgebras:L6/character-evaluation (construction) -/

section CharacterEvaluation

variable {O G : Type*} [CommRing O] [CommGroup G]

/-- `L6/character-evaluation`: the evaluation `ev_ψ : O[G] → O`, `Σ a_g g ↦ Σ a_g ψ(g)`, of the
group ring at a character `ψ : G →* Oˣ`; the lift of `g ↦ ψ g` through `MonoidAlgebra.lift`. -/
def charEval (ψ : G →* Oˣ) : MonoidAlgebra O G →ₐ[O] O :=
  MonoidAlgebra.lift O O G ((Units.coeHom O).comp ψ)

/-- `ev_ψ(a • g) = a ψ(g)`. -/
@[simp] theorem charEval_single (ψ : G →* Oˣ) (g : G) (a : O) :
    charEval ψ (MonoidAlgebra.single g a) = a * ψ g := sorry

/-- `ev_ψ(g) = ψ(g)`. -/
@[simp] theorem charEval_of (ψ : G →* Oˣ) (g : G) :
    charEval ψ (MonoidAlgebra.of O G g) = ψ g := sorry

/-- The trivial character evaluates by the augmentation `Σ a_g g ↦ Σ a_g`. -/
theorem charEval_one (g : G) (a : O) :
    charEval (1 : G →* Oˣ) (MonoidAlgebra.single g a) = a := sorry

/-- Orthogonality: over a domain, a nontrivial character sums to zero over a finite group, so
`ev_ψ(N_G) = 0`. -/
theorem charEval_sum_eq_zero [IsDomain O] [Fintype G] (ψ : G →* Oˣ) (hψ : ψ ≠ 1) :
    charEval ψ (∑ g : G, MonoidAlgebra.of O G g) = 0 := sorry

/-- `ev_ψ` is the `MonoidAlgebra.lift` of `ψ` followed by the inclusion of units. -/
theorem charEval_eq_lift (ψ : G →* Oˣ) :
    charEval ψ = MonoidAlgebra.lift O O G ((Units.coeHom O).comp ψ) := rfl

/-- `L6/character-evaluation`: the joint evaluation `ev_Ψ : O[G] → ∏_{ψ ∈ Ψ} O`. -/
def jointEval (Ψ : Set (G →* Oˣ)) : MonoidAlgebra O G →ₐ[O] (Ψ → O) :=
  AlgHom.pi (fun ψ : Ψ => charEval ψ.1)

@[simp] theorem jointEval_apply (Ψ : Set (G →* Oˣ)) (x : MonoidAlgebra O G) (ψ : Ψ) :
    jointEval Ψ x ψ = charEval ψ.1 x := rfl

/-- Joint evaluation at all characters is injective when `#G ≠ 0` in the domain `O` and `O` has
`#G` characters. -/
theorem jointEval_injective [IsDomain O] [Fintype G] (hG : (Fintype.card G : O) ≠ 0)
    (hchar : Nat.card (G →* Oˣ) = Fintype.card G) :
    Function.Injective (jointEval (Set.univ : Set (G →* Oˣ))) := sorry

-- test charEval_sign (computation) [L6/character-evaluation]
example [IsDomain O] (h : G) (hh : h ≠ 1) (hh2 : h * h = 1) (ψ : G →* Oˣ)
    (hψ : (ψ h : O) = -1) :
    charEval ψ (MonoidAlgebra.of O G 1 + MonoidAlgebra.of O G h) = 0 ∧
      charEval ψ (MonoidAlgebra.of O G 1 - MonoidAlgebra.of O G h) = 2 := sorry

-- test charEval_trivialGroup (degenerate) [L6/character-evaluation]
example [Subsingleton G] : Function.Bijective (charEval (1 : G →* Oˣ)) := sorry

-- test charEval_not_injective (non-example) [L6/character-evaluation]
example [Nontrivial O] (h : G) (hh : h ≠ 1) (ψ : G →* Oˣ) :
    ¬ Function.Injective (charEval ψ) := sorry

-- test charEval_lift (compatibility) [L6/character-evaluation]
example (ψ : G →* Oˣ) (g : G) :
    charEval ψ (MonoidAlgebra.of O G g) =
      MonoidAlgebra.lift O O G ((Units.coeHom O).comp ψ) (MonoidAlgebra.of O G g) := rfl

end CharacterEvaluation

/-! ## PadicMeasuresIwasawaAlgebras:L6/character-group-ring (definition) -/

section CharacterGroupRing

variable {O G : Type*} [CommRing O] [CommGroup G]

/-- `L6/character-group-ring`: the character group ring `R_Ψ`, the image of
`ev_Ψ : O[G] → ∏_{ψ ∈ Ψ} O` (Dasgupta–Kakde §2.2). It is in general a proper, non-maximal
order in the product and is never replaced by it. -/
def charGroupRing (Ψ : Set (G →* Oˣ)) : Subalgebra O (Ψ → O) := (jointEval Ψ).range

namespace charGroupRing

/-- The canonical surjection `α_Ψ : O[G] ↠ R_Ψ`. -/
def proj (Ψ : Set (G →* Oˣ)) : MonoidAlgebra O G →ₐ[O] charGroupRing Ψ :=
  (jointEval Ψ).rangeRestrict

theorem proj_surjective (Ψ : Set (G →* Oˣ)) : Function.Surjective (proj Ψ) :=
  AlgHom.rangeRestrict_surjective _

/-- `ker α_Ψ = ⋂_{ψ ∈ Ψ} ker ev_ψ`. -/
theorem ker_proj (Ψ : Set (G →* Oˣ)) (x : MonoidAlgebra O G) :
    proj Ψ x = 0 ↔ ∀ ψ ∈ Ψ, charEval ψ x = 0 := sorry

/-- The `ψ`-coordinate of `α_Ψ(x)` is `ψ(x)`. -/
@[simp] theorem coord_proj (Ψ : Set (G →* Oˣ)) (x : MonoidAlgebra O G) (ψ : Ψ) :
    ((proj Ψ x : charGroupRing Ψ) : Ψ → O) ψ = charEval ψ.1 x := rfl

/-- Elements of `R_Ψ` are equal when all their character values are. -/
theorem ext {Ψ : Set (G →* Oˣ)} {y z : charGroupRing Ψ}
    (h : ∀ ψ : Ψ, (y : Ψ → O) ψ = (z : Ψ → O) ψ) : y = z := Subtype.ext (funext h)

/-- For `Ψ ⊆ Ψ'`, restriction of coordinates `R_{Ψ'} ↠ R_Ψ`. -/
def restrict {Ψ Ψ' : Set (G →* Oˣ)} (h : Ψ ⊆ Ψ') : charGroupRing Ψ' →ₐ[O] charGroupRing Ψ :=
  sorry

@[simp] theorem restrict_proj {Ψ Ψ' : Set (G →* Oˣ)} (h : Ψ ⊆ Ψ') (x : MonoidAlgebra O G) :
    restrict h (proj Ψ' x) = proj Ψ x := sorry

theorem restrict_id (Ψ : Set (G →* Oˣ)) :
    restrict (subset_refl Ψ) = AlgHom.id O (charGroupRing Ψ) := sorry

theorem restrict_comp {Ψ Ψ' Ψ'' : Set (G →* Oˣ)} (h : Ψ ⊆ Ψ') (h' : Ψ' ⊆ Ψ'') :
    (restrict h).comp (restrict h') = restrict (h.trans h') := sorry

/-- `O[G] ≅ R_Ĝ` when joint evaluation at all characters is injective. -/
def equivGroupRing [IsDomain O] [Fintype G] (hG : (Fintype.card G : O) ≠ 0)
    (hchar : Nat.card (G →* Oˣ) = Fintype.card G) :
    MonoidAlgebra O G ≃ₐ[O] charGroupRing (Set.univ : Set (G →* Oˣ)) := sorry

/-- `R_∅` is the zero ring. -/
theorem subsingleton_empty : Subsingleton (charGroupRing (∅ : Set (G →* Oˣ))) := sorry

/-- `R_{1} ≅ O` through the augmentation. -/
def equivOfSingletonOne : charGroupRing ({1} : Set (G →* Oˣ)) ≃ₐ[O] O := sorry

/-- `α_Ψ(Σ_g ψ(g)⁻¹ g) = #G · δ_ψ`, so `#G · ∏_{ψ ∈ Ψ} O ⊆ R_Ψ`. -/
theorem card_smul_single_mem [IsDomain O] [Fintype G] [DecidableEq (G →* Oˣ)]
    (Ψ : Set (G →* Oˣ)) (ψ : Ψ) :
    (Fintype.card G : O) • (Pi.single ψ 1 : Ψ → O) ∈ charGroupRing Ψ := sorry

end charGroupRing

-- test charGroupRing_cyclic_proper (non-example) [L6/character-group-ring]
example [IsDomain O] [Fintype G] [DecidableEq (G →* Oˣ)] (p : ℕ) [Fact p.Prime]
    (hG : Fintype.card G = p) (hp : ¬ IsUnit (p : O)) (hchar : Nat.card (G →* Oˣ) = p)
    (ψ : G →* Oˣ) :
    (Pi.single ⟨ψ, Set.mem_univ ψ⟩ 1 : ↥(Set.univ : Set (G →* Oˣ)) → O) ∉
      charGroupRing (Set.univ : Set (G →* Oˣ)) := sorry

-- test charGroupRing_not_gorenstein (non-example) [L6/character-group-ring]
/- For `G = ⟨g⟩ × ⟨h⟩ ≅ C_p × C_p`, `O = ℤ_p[ζ_p]`, `λ = ζ_p - 1` and `Ψ = {1, ψ₁, ψ₂}` with
`ψ₁(g) = ζ_p, ψ₁(h) = 1, ψ₂(g) = 1, ψ₂(h) = ζ_p`, the maximal ideal of `R_Ψ/λR_Ψ` squares to zero
and is not principal; stated for any `O` with a primitive `p`-th root of unity. -/
example [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime] (ζ : O) (hζ : IsPrimitiveRoot ζ p)
    (hlam : IsLocalRing.maximalIdeal O = Ideal.span {ζ - 1}) (g h : G) (ψ₁ ψ₂ : G →* Oˣ) (h₁g : (ψ₁ g : O) = ζ) (h₁h : (ψ₁ h : O) = 1)
    (h₂g : (ψ₂ g : O) = 1) (h₂h : (ψ₂ h : O) = ζ) (hgen : ∀ x : G, ∃ i j : ℕ, x = g ^ i * h ^ j) :
    let Ψ : Set (G →* Oˣ) := {1, ψ₁, ψ₂}
    let I : Ideal (charGroupRing Ψ) := Ideal.span {algebraMap O (charGroupRing Ψ) (ζ - 1)}
    ∀ [IsLocalRing (charGroupRing Ψ ⧸ I)],
      (IsLocalRing.maximalIdeal (charGroupRing Ψ ⧸ I)) ^ 2 = ⊥ ∧
        ¬ (IsLocalRing.maximalIdeal (charGroupRing Ψ ⧸ I)).IsPrincipal := sorry

-- test charGroupRing_empty (degenerate) [L6/character-group-ring]
example : Subsingleton (charGroupRing (∅ : Set (G →* Oˣ))) := charGroupRing.subsingleton_empty

-- test charGroupRing_trivial (degenerate) [L6/character-group-ring]
example (g : G) (a : O) :
    charGroupRing.equivOfSingletonOne (charGroupRing.proj {1} (MonoidAlgebra.single g a)) = a :=
  sorry

-- test charGroupRing_full (compatibility) [L6/character-group-ring]
example [IsDomain O] [Fintype G] (hG : (Fintype.card G : O) ≠ 0)
    (hchar : Nat.card (G →* Oˣ) = Fintype.card G) :
    Function.Bijective (charGroupRing.proj (Set.univ : Set (G →* Oˣ))) := sorry

end CharacterGroupRing

/-! ## Theorems on character group rings: L6/character-group-ring-lattice,
L6/character-group-ring-nonzerodivisor, L6/norm-element-kernel, L6/component-character-group-ring,
L6/component-norm-quotient, L6/character-group-ring-unit-criterion,
L6/character-group-ring-local and L6/character-group-ring-index -/

section CharacterGroupRingTheory

variable {O G : Type*} [CommRing O] [IsDomain O] [CharZero O] [CommGroup G] [Fintype G]

/-- `L6/character-group-ring-lattice` (ii): `R_Ψ` is free over `O` of rank `#Ψ` when `O` is a
principal ideal domain. -/
theorem charGroupRing.free [IsPrincipalIdealRing O] (Ψ : Set (G →* Oˣ)) [Finite Ψ] :
    Module.Free O (charGroupRing Ψ) ∧ Module.finrank O (charGroupRing Ψ) = Nat.card Ψ := sorry

/-- `L6/character-group-ring-lattice` (ii): the index of `R_Ψ` in `∏_{ψ ∈ Ψ} O` is finite when the
residue rings `O/(n)` are finite. -/
theorem charGroupRing.finite_quotient (Ψ : Set (G →* Oˣ)) [Finite Ψ]
    (hfin : ∀ n : ℕ, n ≠ 0 → Finite (O ⧸ Ideal.span {(n : O)})) :
    Finite ((Ψ → O) ⧸ Subalgebra.toSubmodule (charGroupRing Ψ)) := sorry

/-- `L6/character-group-ring-nonzerodivisor`: `x ∈ R_Ψ` is a non-zerodivisor iff every value
`ψ(x)` is nonzero. -/
theorem charGroupRing.mem_nonZeroDivisors_iff (Ψ : Set (G →* Oˣ)) (x : charGroupRing Ψ) :
    x ∈ nonZeroDivisors (charGroupRing Ψ) ↔ ∀ ψ : Ψ, (x : Ψ → O) ψ ≠ 0 := sorry

/-- `L6/norm-element-kernel` (Dasgupta–Kakde Lemma 2.2): for a subgroup `I` and
`Ψ = {ψ : ψ(I) ≠ 1}`, the kernel of `α_Ψ` is the principal ideal generated by `N_I`. -/
theorem charGroupRing.ker_proj_eq_span_norm (I : Subgroup G) [Fintype I]
    (hG : (Fintype.card G : O) ≠ 0) (hchar : Nat.card (G →* Oˣ) = Fintype.card G) :
    RingHom.ker (charGroupRing.proj {ψ : G →* Oˣ | ¬ ∀ σ ∈ I, ψ σ = 1}).toRingHom =
      Ideal.span {∑ σ : I, MonoidAlgebra.of O G σ} := sorry

/-- `L6/component-character-group-ring`: for a subgroup `G'` of order invertible in `O`, a
character `χ` of `G'` with idempotent `e_χ = #G'⁻¹ Σ_a χ(a)⁻¹ a` (the L4 character idempotent)
and `Ψ_χ` the characters restricting to `χ`, the kernel of `α_{Ψ_χ}` is generated by `1 - e_χ`,
so `R_{Ψ_χ} ≅ e_χ O[G] = R_χ`. -/
theorem charGroupRing.ker_proj_component (G' : Subgroup G) [Fintype G'] (u : Oˣ)
    (hu : (u : O) = Fintype.card G') (χ : G' →* Oˣ)
    (hG : (Fintype.card G : O) ≠ 0) (hchar : Nat.card (G →* Oˣ) = Fintype.card G) :
    let e : MonoidAlgebra O G :=
      ((u⁻¹ : Oˣ) : O) • ∑ a : G', ((χ a⁻¹ : Oˣ) : O) • MonoidAlgebra.of O G a
    RingHom.ker (charGroupRing.proj {ψ : G →* Oˣ | ψ.comp G'.subtype = χ}).toRingHom =
      Ideal.span {1 - e} := sorry

/-- `L6/component-character-group-ring`: with a complement `Gp` of `G'` (`G = Gp × G'`),
`R_{Ψ_χ}` is the group ring `O[Gp]` with `g = g' gp` acting by `χ(g') gp` (`O[G_p]_χ`). -/
def charGroupRing.componentEquiv (G' Gp : Subgroup G) [Fintype G'] (hcompl : G'.IsComplement' Gp)
    (hG' : IsUnit (Fintype.card G' : O)) (χ : G' →* Oˣ) (hG : (Fintype.card G : O) ≠ 0)
    (hchar : Nat.card (G →* Oˣ) = Fintype.card G) :
    charGroupRing {ψ : G →* Oˣ | ψ.comp G'.subtype = χ} ≃ₐ[O] MonoidAlgebra O Gp := sorry

/-- `L6/component-norm-quotient` (Dasgupta–Kakde Corollary 2.3): with `e_χ` and `Ψ_χ` as above
and a subgroup `I`, the kernel of `α_Ψ` for `Ψ = {ψ ∈ Ψ_χ : ψ(I) ≠ 1}` is generated by `1 - e_χ`
and `N_I`, so `R_χ/N_I R_χ ≅ R_Ψ`. -/
theorem charGroupRing.ker_proj_component_norm (G' : Subgroup G) [Fintype G'] (u : Oˣ)
    (hu : (u : O) = Fintype.card G') (χ : G' →* Oˣ) (I : Subgroup G) [Fintype I]
    (hG : (Fintype.card G : O) ≠ 0) (hchar : Nat.card (G →* Oˣ) = Fintype.card G) :
    let e : MonoidAlgebra O G :=
      ((u⁻¹ : Oˣ) : O) • ∑ a : G', ((χ a⁻¹ : Oˣ) : O) • MonoidAlgebra.of O G a
    RingHom.ker (charGroupRing.proj
        {ψ : G →* Oˣ | ψ.comp G'.subtype = χ ∧ ¬ ∀ σ ∈ I, ψ σ = 1}).toRingHom =
      Ideal.span {1 - e, ∑ σ : I, MonoidAlgebra.of O G σ} := sorry

/-- `L6/character-group-ring-unit-criterion`: `x ∈ R_Ψ` is a unit iff every value `ψ(x)` is a
unit of `O` (`R_Ψ ⊆ ∏ O` is an integral extension). -/
theorem charGroupRing.isUnit_iff (Ψ : Set (G →* Oˣ)) [Finite Ψ]
    (x : charGroupRing Ψ) : IsUnit x ↔ ∀ ψ : Ψ, IsUnit ((x : Ψ → O) ψ) := sorry

/-- `L6/character-group-ring-unit-criterion`: for characters that belong to one `χ` (pairwise
quotients of `p`-power order, `O` local with residue characteristic `p`), one unit value suffices. -/
theorem charGroupRing.isUnit_iff_exists [IsLocalRing O] (p : ℕ)
    [Fact p.Prime] [CharP (IsLocalRing.ResidueField O) p] (Ψ : Set (G →* Oˣ)) [Finite Ψ]
    (hΨ : ∀ ψ ∈ Ψ, ∀ ψ' ∈ Ψ, ∃ n : ℕ, (ψ' / ψ) ^ (p ^ n) = 1) (x : charGroupRing Ψ) :
    IsUnit x ↔ ∃ ψ : Ψ, IsUnit ((x : Ψ → O) ψ) := sorry

/-- `L6/character-group-ring-local`: for nonempty `Ψ` belonging to one `χ`, `R_Ψ` is local. -/
theorem charGroupRing.isLocalRing [IsLocalRing O] (p : ℕ) [Fact p.Prime]
    [CharP (IsLocalRing.ResidueField O) p] (Ψ : Set (G →* Oˣ)) [Finite Ψ] (hne : Ψ.Nonempty)
    (hΨ : ∀ ψ ∈ Ψ, ∀ ψ' ∈ Ψ, ∃ n : ℕ, (ψ' / ψ) ^ (p ^ n) = 1) :
    IsLocalRing (charGroupRing Ψ) := sorry

/-- `L6/character-group-ring-local`: completeness, when `O` is complete. -/
theorem charGroupRing.isAdicComplete [IsLocalRing O] [IsNoetherianRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] (p : ℕ) [Fact p.Prime]
    [CharP (IsLocalRing.ResidueField O) p] (Ψ : Set (G →* Oˣ)) [Finite Ψ] (hne : Ψ.Nonempty)
    (hΨ : ∀ ψ ∈ Ψ, ∀ ψ' ∈ Ψ, ∃ n : ℕ, (ψ' / ψ) ^ (p ^ n) = 1) [IsLocalRing (charGroupRing Ψ)] :
    IsAdicComplete (IsLocalRing.maximalIdeal (charGroupRing Ψ)) (charGroupRing Ψ) := sorry

/-- `L6/character-group-ring-index` (Dasgupta–Kakde Lemma 2.5):
`#(R_Ψ/(x)) = #(O/(∏_{ψ ∈ Ψ} ψ(x)))` for a non-zerodivisor `x`. -/
theorem charGroupRing.card_quotient_span [IsPrincipalIdealRing O] (Ψ : Set (G →* Oˣ))
    [Fintype Ψ] (hfin : ∀ a : O, a ≠ 0 → Finite (O ⧸ Ideal.span {a}))
    (x : charGroupRing Ψ) (hx : x ∈ nonZeroDivisors (charGroupRing Ψ)) :
    Nat.card (charGroupRing Ψ ⧸ Ideal.span {x}) =
      Nat.card (O ⧸ Ideal.span {∏ ψ : Ψ, (x : Ψ → O) ψ}) := sorry

end CharacterGroupRingTheory

/-! ## PadicMeasuresIwasawaAlgebras:L6/sharp-involution (construction) -/

section Sharp

variable {O G : Type*} [CommRing O] [CommGroup G]

/-- `L6/sharp-involution`: the involution `#` of `O[G]`, `g ↦ g⁻¹`; the antipode of the
commutative Hopf algebra `O[G]`. -/
def sharp : MonoidAlgebra O G →ₐ[O] MonoidAlgebra O G :=
  HopfAlgebra.antipodeAlgHom O (MonoidAlgebra O G)

@[simp] theorem sharp_of (g : G) : sharp (MonoidAlgebra.of O G g) = MonoidAlgebra.of O G g⁻¹ :=
  sorry

@[simp] theorem sharp_sharp (x : MonoidAlgebra O G) : sharp (sharp x) = x := sorry

/-- `#` as a self-inverse `O`-algebra automorphism of `O[G]`. -/
def sharpAlgEquiv : MonoidAlgebra O G ≃ₐ[O] MonoidAlgebra O G :=
  AlgEquiv.ofAlgHom sharp sharp (by ext; simp) (by ext; simp)

/-- `ψ(x^#) = ψ⁻¹(x)`. -/
theorem charEval_sharp (ψ : G →* Oˣ) (x : MonoidAlgebra O G) :
    charEval ψ (sharp x) = charEval ψ⁻¹ x := sorry

/-- `#` is also the map of group rings induced by inversion. -/
theorem sharp_eq_mapDomain :
    (sharp : MonoidAlgebra O G →ₐ[O] MonoidAlgebra O G) =
      MonoidAlgebra.mapDomainAlgHom O O (invMonoidHom : G →* G) := sorry

/-- `L6/sharp-involution`: `#` induces `R_Ψ ≅ R_{Ψ⁻¹}` (`R^# = R_{Ψ^#}`). -/
def charGroupRing.sharpEquiv (Ψ : Set (G →* Oˣ)) :
    charGroupRing Ψ ≃ₐ[O] charGroupRing (Ψ⁻¹) := sorry

@[simp] theorem charGroupRing.sharpEquiv_proj (Ψ : Set (G →* Oˣ)) (x : MonoidAlgebra O G) :
    charGroupRing.sharpEquiv Ψ (charGroupRing.proj Ψ x) = charGroupRing.proj (Ψ⁻¹) (sharp x) :=
  sorry

/-- On coordinates, `(# y)(ψ⁻¹) = y(ψ)`. -/
theorem charGroupRing.coord_sharpEquiv (Ψ : Set (G →* Oˣ)) (y : charGroupRing Ψ) (ψ : Ψ) :
    ((charGroupRing.sharpEquiv Ψ y : charGroupRing (Ψ⁻¹)) : ↥(Ψ⁻¹) → O)
        ⟨ψ.1⁻¹, Set.inv_mem_inv.mpr ψ.2⟩ = (y : Ψ → O) ψ := sorry

/-- Principal ideals transport: `#(x R) = x^# R^#`. -/
theorem charGroupRing.map_sharp_span (Ψ : Set (G →* Oˣ)) (x : charGroupRing Ψ) :
    Ideal.map (charGroupRing.sharpEquiv Ψ) (Ideal.span {x}) =
      Ideal.span {charGroupRing.sharpEquiv Ψ x} := sorry

-- test sharp_component (computation) [L6/sharp-involution]
example [IsDomain O] (τ : G) (ψ : G →* Oˣ) (ζ : O) (hζ : IsPrimitiveRoot ζ 3)
    (hψ : (ψ τ : O) = ζ) :
    charEval ψ (sharp (MonoidAlgebra.of O G τ)) = ζ ^ 2 := sorry

-- test sharp_not_endomorphism (non-example) [L6/sharp-involution]
example [IsDomain O] [CharZero O] (τ : G) (ψ : G →* Oˣ) (ζ : O) (hζ : IsPrimitiveRoot ζ 3)
    (hψ : (ψ τ : O) = ζ) :
    charGroupRing.proj {ψ} (MonoidAlgebra.of O G τ - algebraMap O _ ζ) = 0 ∧
      charGroupRing.proj {ψ} (sharp (MonoidAlgebra.of O G τ - algebraMap O _ ζ)) ≠ 0 := sorry

-- test sharp_trivialGroup (degenerate) [L6/sharp-involution]
example [Subsingleton G] (x : MonoidAlgebra O G) : sharp x = x := sorry

-- test sharp_full (compatibility) [L6/sharp-involution]
example : (Set.univ : Set (G →* Oˣ))⁻¹ = Set.univ := Set.inv_univ

end Sharp

/-! ## PadicMeasuresIwasawaAlgebras:L6/contragredient-dual (construction) -/

section Contragredient

variable {R S M N P : Type*} [CommRing R] [CommRing S] [AddCommGroup M] [Module R M]
  [AddCommGroup N] [Module R N] [AddCommGroup P] [Module R P]

/-- `L6/contragredient-dual`: `M^* = Hom_R(M, R)` as an `S`-module along a ring isomorphism
`σ : S ≃+* R`, `(s · φ)(x) = φ(σ(s) · x)`. For `R = R_Ψ`, `S = R^#` and `σ = #`, this is
Dasgupta–Kakde (80). -/
def ContragredientDual (_σ : S ≃+* R) (M : Type*) [AddCommGroup M] [Module R M] : Type _ :=
  Module.Dual R M

namespace ContragredientDual

variable (σ : S ≃+* R)

instance : AddCommGroup (ContragredientDual σ M) := inferInstanceAs (AddCommGroup (Module.Dual R M))

instance : Module S (ContragredientDual σ M) :=
  Module.compHom (Module.Dual R M) σ.toRingHom

/-- The underlying functional. -/
def toDual : ContragredientDual σ M ≃+ Module.Dual R M := AddEquiv.refl _

@[simp] theorem smul_apply (s : S) (φ : ContragredientDual σ M) (x : M) :
    toDual σ (s • φ) x = toDual σ φ (σ s • x) := sorry

/-- A linear map induces the `S`-linear precomposition `f^* : N^* → M^*`. -/
def map (f : M →ₗ[R] N) : ContragredientDual σ N →ₗ[S] ContragredientDual σ M := sorry

theorem map_id : map σ (LinearMap.id : M →ₗ[R] M) = LinearMap.id := sorry

theorem map_comp (f : M →ₗ[R] N) (g : N →ₗ[R] P) :
    map σ (g ∘ₗ f) = map σ f ∘ₗ map σ g := sorry

/-- For `M = R^m` the contragredient dual is free over `S` on the dual basis. -/
def equivPi (m : ℕ) : ContragredientDual σ (Fin m → R) ≃ₗ[S] (Fin m → S) := sorry

end ContragredientDual

-- test contragredient_smul_group (computation) [L6/contragredient-dual]
example {O G : Type*} [CommRing O] [CommGroup G] (g : G) :
    let σ : MonoidAlgebra O G ≃+* MonoidAlgebra O G := (sharpAlgEquiv (O := O) (G := G)).toRingEquiv
    ContragredientDual.toDual σ (MonoidAlgebra.of O G g •
        (ContragredientDual.toDual σ).symm LinearMap.id) 1 = MonoidAlgebra.of O G g⁻¹ := sorry

-- test contragredient_trivial (degenerate) [L6/contragredient-dual]
example (s : R) (φ : ContragredientDual (RingEquiv.refl R) M) (x : M) :
    ContragredientDual.toDual _ (s • φ) x = s • ContragredientDual.toDual _ φ x := sorry

-- test contragredient_not_ordinary (non-example) [L6/contragredient-dual]
example {O G : Type*} [CommRing O] [Nontrivial O] [CommGroup G] (g : G) (hg : g⁻¹ ≠ g) :
    let σ : MonoidAlgebra O G ≃+* MonoidAlgebra O G := (sharpAlgEquiv (O := O) (G := G)).toRingEquiv
    ContragredientDual.toDual σ (MonoidAlgebra.of O G g •
        (ContragredientDual.toDual σ).symm LinearMap.id) 1 ≠ MonoidAlgebra.of O G g := sorry

end Contragredient

/-! ## The Fitting ideal requested from StableReduction, Layer 1 (stand-in, not an L6 node) -/

/-- Stand-in for the Fitting ideals of the Tau Ceti roadmap StableReduction, Layer 1 (requested
by this roadmap; RS-16): for a finite `A`-module `M` with chosen generators `x₁, …, x_n`,
`Fitt_r(M)` is generated by the `(n - r) × (n - r)` minors of all matrices whose columns are
relations among the `xᵢ`; it is `A` when `n ≤ r`. Same form as in `AdicSpacesPartII.lean`. -/
def Module.fittingIdeal (A M : Type*) [CommRing A] [AddCommGroup M] [Module A M]
    [Module.Finite A M] (r : ℕ) : Ideal A :=
  let n := (Module.Finite.exists_fin (R := A) (M := M)).choose
  let x : Fin n → M := (Module.Finite.exists_fin (R := A) (M := M)).choose_spec.choose
  Ideal.span {a | ∃ φ : Matrix (Fin n) (Fin (n - r)) A, (∀ j, ∑ i, φ i j • x i = 0) ∧
    ∃ f : Fin (n - r) → Fin n, a = (φ.submatrix f id).det}

/-! ## PadicMeasuresIwasawaAlgebras:L6/quadratic-presentation (definition) and
L6/fitting-quadratic (theorem) -/

section Quadratic

variable {R R' N N' : Type*} [CommRing R] [CommRing R'] [Algebra R R'] [AddCommGroup N]
  [Module R N] [AddCommGroup N'] [Module R N']

/-- `L6/quadratic-presentation`: a quadratic presentation `R^m →φ R^m → N → 0`, `m ≥ 1`
(Dasgupta–Kakde §2.3). -/
structure QuadraticPresentation (R N : Type*) [CommRing R] [AddCommGroup N] [Module R N] where
  /-- the common number `m ≥ 1` of generators and relations -/
  size : ℕ
  size_pos : 0 < size
  /-- the square relation matrix `φ` -/
  rel : Matrix (Fin size) (Fin size) R
  /-- the generators `π : R^m ↠ N` -/
  gen : (Fin size → R) →ₗ[R] N
  gen_surjective : Function.Surjective gen
  range_rel_eq_ker : LinearMap.range (Matrix.toLin' rel) = LinearMap.ker gen

/-- `N` is quadratically presented over `R`. -/
def IsQuadraticallyPresented (R N : Type*) [CommRing R] [AddCommGroup N] [Module R N] : Prop :=
  Nonempty (QuadraticPresentation R N)

namespace QuadraticPresentation

/-- A quadratically presented module is finitely presented. -/
theorem finitePresentation (P : QuadraticPresentation R N) : Module.FinitePresentation R N :=
  sorry

/-- Transport along `N ≅ N'`. -/
def ofLinearEquiv (P : QuadraticPresentation R N) (e : N ≃ₗ[R] N') :
    QuadraticPresentation R N' := sorry

/-- The cokernel of a square matrix of size `m ≥ 1` is quadratically presented. -/
def cokernel {m : ℕ} (hm : 0 < m) (φ : Matrix (Fin m) (Fin m) R) :
    QuadraticPresentation R ((Fin m → R) ⧸ LinearMap.range (Matrix.toLin' φ)) := sorry

/-- Base change `N ⊗_R R'` is presented by the image of the matrix. -/
def baseChange (P : QuadraticPresentation R N) :
    QuadraticPresentation R' (TensorProduct R R' N) := sorry

theorem baseChange_size (P : QuadraticPresentation R N) :
    (P.baseChange (R' := R')).size = P.size := sorry

theorem baseChange_rel (P : QuadraticPresentation R N) :
    (P.baseChange (R' := R')).rel = (P.rel.map (algebraMap R R')).submatrix
      (Fin.cast P.baseChange_size) (Fin.cast P.baseChange_size) := sorry

/-- Direct sums: block-diagonal relation matrix. -/
def prod (P : QuadraticPresentation R N) (P' : QuadraticPresentation R N') :
    QuadraticPresentation R (N × N') := sorry

/-- The zero module, presented by `R →(1) R`. -/
def zero : QuadraticPresentation R PUnit := sorry

/-- `R/(a)`, presented by `R →(a) R`. -/
def cyclic (a : R) : QuadraticPresentation R (R ⧸ Ideal.span {a}) := sorry

theorem cyclic_det (a : R) : (cyclic a).rel.det = a := sorry

/-- `L6/fitting-quadratic`: `Fitt_R(N) = (det φ)` (Dasgupta–Kakde §2.3). -/
theorem fittingIdeal_eq (P : QuadraticPresentation R N) [Module.Finite R N] :
    Module.fittingIdeal R N 0 = Ideal.span {P.rel.det} := sorry

end QuadraticPresentation

-- test quadratic_cyclic (computation) [L6/quadratic-presentation]
example (a : R) : (QuadraticPresentation.cyclic a).size = 1 ∧
    (QuadraticPresentation.cyclic a).rel.det = a := sorry

-- test quadratic_zero (degenerate) [L6/quadratic-presentation]
example : IsQuadraticallyPresented R PUnit := ⟨QuadraticPresentation.zero⟩

-- test quadratic_free (degenerate) [L6/quadratic-presentation]
example (m : ℕ) (hm : 0 < m) : ∃ P : QuadraticPresentation R (Fin m → R), P.rel = 0 := sorry

-- test not_quadratic_residue_field (non-example) [L6/quadratic-presentation]
example (p : ℕ) [Fact p.Prime] :
    ¬ IsQuadraticallyPresented (PowerSeries (PadicInt p))
      (PowerSeries (PadicInt p) ⧸ (Ideal.span {(p : PowerSeries (PadicInt p)),
        PowerSeries.X})) := sorry

-- test quadratic_baseChange (compatibility) [L6/quadratic-presentation]
example (a : R) : IsQuadraticallyPresented R' (TensorProduct R R' (R ⧸ Ideal.span {a})) :=
  ⟨(QuadraticPresentation.cyclic a).baseChange⟩

end Quadratic

/-! ## PadicMeasuresIwasawaAlgebras:L6/locally-quadratic-presentation (definition) -/

section LocallyQuadratic

variable {R M P₀ P₁ : Type*} [CommRing R] [AddCommGroup M] [Module R M]
  [AddCommGroup P₀] [Module R P₀] [AddCommGroup P₁] [Module R P₁]

/-- `L6/locally-quadratic-presentation`: `P₁ →f P₀ →π M → 0` exact, with `P₀, P₁` finitely
generated projective of the same constant rank (Dasgupta–Kakde Lemma A.5, Remark A.7). -/
structure IsLocallyQuadraticPresentation (f : P₁ →ₗ[R] P₀) (π : P₀ →ₗ[R] M) : Prop where
  projective₀ : Module.Projective R P₀
  projective₁ : Module.Projective R P₁
  finite₀ : Module.Finite R P₀
  finite₁ : Module.Finite R P₁
  surjective : Function.Surjective π
  exact : LinearMap.range f = LinearMap.ker π
  rank_eq : ∃ r : ℕ, ∀ 𝔭 : PrimeSpectrum R,
    Module.rankAtStalk P₀ 𝔭 = r ∧ Module.rankAtStalk P₁ 𝔭 = r

/-- A quadratic presentation is locally quadratic. -/
theorem QuadraticPresentation.isLocallyQuadraticPresentation (P : QuadraticPresentation R M) :
    IsLocallyQuadraticPresentation (Matrix.toLin' P.rel) P.gen := sorry

/-- Over a local ring (and hence factorwise over a finite product of local rings), a locally
quadratic presentation gives a quadratic one. -/
theorem IsLocallyQuadraticPresentation.isQuadraticallyPresented [IsLocalRing R]
    {f : P₁ →ₗ[R] P₀} {π : P₀ →ₗ[R] M} (h : IsLocallyQuadraticPresentation f π) :
    IsQuadraticallyPresented R M := sorry

/-- Finite products of local rings: factorwise freeness. -/
theorem IsLocallyQuadraticPresentation.isQuadraticallyPresented_pi {ι : Type*} [Fintype ι]
    {A : ι → Type*} [∀ i, CommRing (A i)] [∀ i, IsLocalRing (A i)] {M P₀ P₁ : Type*}
    [AddCommGroup M] [Module (∀ i, A i) M] [AddCommGroup P₀] [Module (∀ i, A i) P₀]
    [AddCommGroup P₁] [Module (∀ i, A i) P₁]
    {f : P₁ →ₗ[∀ i, A i] P₀} {π : P₀ →ₗ[∀ i, A i] M} (h : IsLocallyQuadraticPresentation f π) :
    IsQuadraticallyPresented (∀ i, A i) M := sorry

-- test lq_quadratic (compatibility) [L6/locally-quadratic-presentation]
example (P : QuadraticPresentation R M) :
    IsLocallyQuadraticPresentation (Matrix.toLin' P.rel) P.gen :=
  P.isLocallyQuadraticPresentation

-- test lq_unequal_rank (non-example) [L6/locally-quadratic-presentation]
/- Over `R = ℤ_p × ℤ_p`, the inclusion of the ideal `I = ℤ_p × 0` presents `R/I ≅ 0 × ℤ_p` by
projectives of ranks `(1, 0)` and `(1, 1)` at the two primes: not locally quadratic. -/
example (p : ℕ) [Fact p.Prime] :
    let I : Ideal (PadicInt p × PadicInt p) := Ideal.span {((1 : PadicInt p), (0 : PadicInt p))}
    ¬ IsLocallyQuadraticPresentation I.subtype I.mkQ := sorry

-- test lq_rank_zero (degenerate) [L6/locally-quadratic-presentation]
example : IsLocallyQuadraticPresentation (0 : PUnit →ₗ[R] PUnit) (0 : PUnit →ₗ[R] PUnit) := sorry

end LocallyQuadratic

/-! ## Fitting ideals of extensions: L6/fitting-extension, L6/fitting-fibre-product and
L6/quadratic-cardinality -/

section FittingExtension

variable {R A B C A' B' : Type*} [CommRing R] [AddCommGroup A] [Module R A] [AddCommGroup B]
  [Module R B] [AddCommGroup C] [Module R C] [AddCommGroup A'] [Module R A'] [AddCommGroup B']
  [Module R B']

/-- `L6/fitting-extension` (Dasgupta–Kakde Lemma 2.6, first part): for `0 → A → B → C → 0` exact
with `C` quadratically presented and `A` finitely generated, `Fitt(B) = Fitt(A) Fitt(C)`. -/
theorem fittingIdeal_eq_mul_of_exact [Module.Finite R A] [Module.Finite R B] [Module.Finite R C]
    {i : A →ₗ[R] B} {q : B →ₗ[R] C} (hi : Function.Injective i) (hq : Function.Surjective q)
    (hex : Function.Exact i q) (hC : IsQuadraticallyPresented R C) :
    Module.fittingIdeal R B 0 = Module.fittingIdeal R A 0 * Module.fittingIdeal R C 0 := sorry

/-- `L6/fitting-extension` (Lemma 2.6, second part): extensions of quadratically presented
modules are quadratically presented (block upper-triangular relation matrix). -/
theorem isQuadraticallyPresented_of_exact {i : A →ₗ[R] B} {q : B →ₗ[R] C}
    (hi : Function.Injective i) (hq : Function.Surjective q) (hex : Function.Exact i q)
    (hA : IsQuadraticallyPresented R A) (hC : IsQuadraticallyPresented R C) :
    IsQuadraticallyPresented R B := sorry

/-- `L6/fitting-fibre-product` (Dasgupta–Kakde Lemma 2.7). -/
theorem fittingIdeal_mul_comm_of_exact [Module.Finite R A] [Module.Finite R B]
    [Module.Finite R A'] [Module.Finite R B'] {i : A →ₗ[R] B} {q : B →ₗ[R] C} {i' : A' →ₗ[R] B'}
    {q' : B' →ₗ[R] C} (hi : Function.Injective i) (hq : Function.Surjective q)
    (hex : Function.Exact i q) (hi' : Function.Injective i') (hq' : Function.Surjective q')
    (hex' : Function.Exact i' q') (hB : IsQuadraticallyPresented R B)
    (hB' : IsQuadraticallyPresented R B') :
    Module.fittingIdeal R A 0 * Module.fittingIdeal R B' 0 =
      Module.fittingIdeal R A' 0 * Module.fittingIdeal R B 0 := sorry

/-- `L6/quadratic-cardinality` (Dasgupta–Kakde Lemma 2.4): `B` a subring of finite index of a
finite product of characteristic-zero PIDs, `N` quadratically presented with `Fitt(N) = (x)`,
`x` a non-zerodivisor and `B/(x)` finite: `N` is finite and `#N = #(B/(x))`. -/
theorem QuadraticPresentation.card_eq {ι : Type*} [Fintype ι] {D : ι → Type*}
    [∀ i, CommRing (D i)] [∀ i, IsDomain (D i)] [∀ i, IsPrincipalIdealRing (D i)]
    [∀ i, CharZero (D i)] (S : Subring (∀ i, D i)) [S.toAddSubgroup.FiniteIndex]
    {N : Type*} [AddCommGroup N] [Module S N] [Module.Finite S N] (P : QuadraticPresentation S N)
    (x : S) (hx : x ∈ nonZeroDivisors S) (hfitt : Module.fittingIdeal S N 0 = Ideal.span {x})
    (hfin : Finite (S ⧸ Ideal.span {x})) :
    Finite N ∧ Nat.card N = Nat.card (S ⧸ Ideal.span {x}) := sorry

end FittingExtension

end TauCeti

/-! ## PadicMeasuresIwasawaAlgebras:L6/compound-matrix and L6/higher-adjugate (constructions) -/

section Compound

open Set.powersetCard

variable {R : Type*} [CommRing R]

namespace Matrix

/-- `L6/compound-matrix`: the `r`-th compound matrix `C_r(A)`, whose `(S, T)` entry is the minor of
`A` on the rows `S` and columns `T` (both in increasing order). -/
def compound {ι κ : Type*} [LinearOrder ι] [LinearOrder κ] (A : Matrix ι κ R) (r : ℕ) :
    Matrix (Set.powersetCard ι r) (Set.powersetCard κ r) R :=
  fun S T => (A.submatrix (ofFinEmbEquiv.symm S) (ofFinEmbEquiv.symm T)).det

variable {ι κ ν : Type*} [LinearOrder ι] [LinearOrder κ] [LinearOrder ν]
  [Fintype ι] [Fintype κ] [Fintype ν] [DecidableEq κ] [DecidableEq ν]

/-- `C_r(A)` is the matrix of `⋀^r A` in the exterior-power bases of the standard bases. -/
theorem compound_eq_toMatrix (A : Matrix ι κ R) (r : ℕ) :
    LinearMap.toMatrix (Module.Basis.exteriorPower r (Pi.basisFun R κ))
      (Module.Basis.exteriorPower r (Pi.basisFun R ι)) (exteriorPower.map r (Matrix.toLin' A)) =
      A.compound r := sorry

/-- Cauchy–Binet: `C_r(AB) = C_r(A) C_r(B)`. -/
theorem compound_mul (A : Matrix ι κ R) (B : Matrix κ ν R) (r : ℕ) :
    (A * B).compound r = A.compound r * B.compound r := sorry

theorem compound_one [DecidableEq ι] (r : ℕ) : (1 : Matrix ι ι R).compound r = 1 := sorry

/-- `C_1(A)` is `A` under `ι ≃ powersetCard ι 1`. -/
theorem compound_one_eq (A : Matrix ι κ R) (i : ι) (k : κ) :
    A.compound 1 (ofSingleton i) (ofSingleton k) = A i k := sorry

/-- Restriction to the columns `J`: `C_r(A) ∘ ι_J = C_r(A_J)` on `r`-subsets of `J`. -/
theorem compound_submatrix_col (A : Matrix ι κ R) {J : Type*} [LinearOrder J] (e : J ↪o κ)
    (r : ℕ) (S : Set.powersetCard ι r) (T : Set.powersetCard J r) :
    (A.submatrix id e).compound r S T = A.compound r S (Set.powersetCard.map r e.toEmbedding T) :=
  sorry

/-- For square `A` of size `m`, `C_m(A)` is the `1 × 1` matrix `(det A)`. -/
theorem compound_card {m : ℕ} (A : Matrix (Fin m) (Fin m) R) (S T : Set.powersetCard (Fin m) m) :
    A.compound m S T = A.det := sorry

/-- `L6/higher-adjugate`: the `r`-th higher adjugate of a square matrix, with
`adj_r(A)_{T,S} = (-1)^{ΣS + ΣT} det A[Sᶜ, Tᶜ]`. -/
def higherAdjugate {m : ℕ} (A : Matrix (Fin m) (Fin m) R) (r : ℕ) (hr : r ≤ m) :
    Matrix (Set.powersetCard (Fin m) r) (Set.powersetCard (Fin m) r) R :=
  fun T S => (-1) ^ (∑ i ∈ (S : Finset (Fin m)), (i : ℕ) + ∑ j ∈ (T : Finset (Fin m)), (j : ℕ)) *
    (A.submatrix (ofFinEmbEquiv.symm (compl (m := m - r) (by simp; omega) S))
      (ofFinEmbEquiv.symm (compl (m := m - r) (by simp; omega) T))).det

/-- The right-sided identity used for Lemma 3.9: `C_r(A) adj_r(A) = det(A) I`. -/
theorem compound_mul_higherAdjugate {m : ℕ} (A : Matrix (Fin m) (Fin m) R) (r : ℕ) (hr : r ≤ m) :
    A.compound r * A.higherAdjugate r hr = A.det • (1 : Matrix _ _ R) := sorry

/-- The left-sided identity: `adj_r(A) C_r(A) = det(A) I`. -/
theorem higherAdjugate_mul_compound {m : ℕ} (A : Matrix (Fin m) (Fin m) R) (r : ℕ)
    (hr : r ≤ m) : A.higherAdjugate r hr * A.compound r = A.det • (1 : Matrix _ _ R) := sorry

/-- `adj_1` is the adjugate. -/
theorem higherAdjugate_one_eq {m : ℕ} (A : Matrix (Fin m) (Fin m) R) (hm : 1 ≤ m) (i j : Fin m) :
    A.higherAdjugate 1 hm (ofSingleton j) (ofSingleton i) = A.adjugate j i := sorry

/-- `adj_m(A) = (1)`. -/
theorem higherAdjugate_self {m : ℕ} (A : Matrix (Fin m) (Fin m) R)
    (S T : Set.powersetCard (Fin m) m) : A.higherAdjugate m le_rfl T S = 1 := sorry

end Matrix

-- test compound_one_by_one (degenerate) [L6/compound-matrix]
example (A : Matrix (Fin 2) (Fin 3) R) (i : Fin 2) (k : Fin 3) :
    A.compound 1 (Set.powersetCard.ofSingleton i) (Set.powersetCard.ofSingleton k) = A i k :=
  Matrix.compound_one_eq A i k

-- test compound_two_by_two (computation) [L6/compound-matrix]
example (a b c d : R) (S T : Set.powersetCard (Fin 2) 2) :
    (!![a, b; c, d] : Matrix (Fin 2) (Fin 2) R).compound 2 S T = a * d - b * c := sorry

-- test compound_too_large (degenerate) [L6/compound-matrix]
example (A : Matrix (Fin 2) (Fin 3) R) : IsEmpty (Set.powersetCard (Fin 2) 3) := sorry

-- test compound_not_additive (non-example) [L6/compound-matrix]
example : ∃ A B : Matrix (Fin 2) (Fin 2) ℤ,
    (A + B).compound 2 ≠ A.compound 2 + B.compound 2 := sorry

-- test higherAdjugate_one (compatibility) [L6/higher-adjugate]
example (A : Matrix (Fin 3) (Fin 3) R) (i j : Fin 3) :
    A.higherAdjugate 1 (by omega) (Set.powersetCard.ofSingleton j)
      (Set.powersetCard.ofSingleton i) = A.adjugate j i := A.higherAdjugate_one_eq (by omega) i j

-- test higherAdjugate_top (degenerate) [L6/higher-adjugate]
example (A : Matrix (Fin 3) (Fin 3) R) (S T : Set.powersetCard (Fin 3) 3) :
    A.higherAdjugate 3 le_rfl T S = 1 := A.higherAdjugate_self S T

-- test higherAdjugate_identity (computation) [L6/higher-adjugate]
example (r : ℕ) (hr : r ≤ 3) :
    (1 : Matrix (Fin 3) (Fin 3) R).higherAdjugate r hr = 1 := sorry

-- test higherAdjugate_not_compound (non-example) [L6/higher-adjugate]
example : ∃ A : Matrix (Fin 3) (Fin 3) ℤ, A.higherAdjugate 1 (by omega) ≠ A.compound 1 := sorry

end Compound

namespace TauCeti

/-! ## PadicMeasuresIwasawaAlgebras:L6/exterior-cokernel-annihilator (theorem) -/

section ExteriorCokernel

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

/-- `L6/exterior-cokernel-annihilator` (Dasgupta–Kakde Lemma 3.9, proof corrected by
`PadicMeasuresIwasawaAlgebras/E17`): for `N ⊆ M` with `N` finitely generated and `M` finitely
presented, `Fitt(M/N)` annihilates the cokernel of `⋀^r N → ⋀^r M` for every `r ≥ 1`. -/
theorem fittingIdeal_le_annihilator_exteriorPower_cokernel (N : Submodule R M)
    [Module.FinitePresentation R M] [Module.Finite R N] [Module.Finite R (M ⧸ N)] (r : ℕ)
    (hr : 1 ≤ r) :
    Module.fittingIdeal R (M ⧸ N) 0 ≤
      Module.annihilator R (↥(⋀[R]^r M) ⧸ LinearMap.range (exteriorPower.map r N.subtype)) :=
  sorry

/-- The free core: for an `m × n` matrix `A` and an `m × m` column submatrix `A_J`, `det(A_J) x`
lies in the image of `C_r(A)` for every `x`, via `C_r(A) ι_J(adj_r(A_J) x)`. -/
theorem _root_.Matrix.det_smul_mem_range_compound {m n : ℕ} (A : Matrix (Fin m) (Fin n) R)
    (e : Fin m ↪o Fin n) (r : ℕ) (hr : r ≤ m)
    (x : Set.powersetCard (Fin m) r → R) :
    (A.submatrix id e).det • x ∈ LinearMap.range (Matrix.toLin' (A.compound r)) := sorry

end ExteriorCokernel

/-! ## PadicMeasuresIwasawaAlgebras:L6/presentation-transpose (construction),
L6/transpose-stable-equivalence, L6/transpose-fitting and L6/transpose-higher-fitting -/

section Transpose

variable {R S M P₀ P₁ : Type*} [CommRing R] [CommRing S] [AddCommGroup M] [Module R M]
  [AddCommGroup P₀] [Module R P₀] [AddCommGroup P₁] [Module R P₁]

/-- `L6/presentation-transpose`: the transpose `coker(f^* : P₀^* → P₁^*)` of a presentation
`P₁ →f P₀ → M → 0`, as an `S`-module along `σ : S ≃+* R` (for `R = R_Ψ`, `S = R^#`, `σ = #`).
The carrier is the pinned `TauCeti.AuslanderReitenTranspose f`. -/
def PresentationTranspose (_σ : S ≃+* R) (f : P₁ →ₗ[R] P₀) : Type _ :=
  AuslanderReitenTranspose f

namespace PresentationTranspose

variable (σ : S ≃+* R) (f : P₁ →ₗ[R] P₀)

instance : AddCommGroup (PresentationTranspose σ f) :=
  inferInstanceAs (AddCommGroup (AuslanderReitenTranspose f))

instance : Module S (PresentationTranspose σ f) :=
  Module.compHom (AuslanderReitenTranspose f)
    ((RingEquiv.toOpposite R).toRingHom.comp σ.toRingHom)

/-- The quotient map from `P₁^*`. -/
def mk : ContragredientDual σ P₁ →ₗ[S] PresentationTranspose σ f := sorry

theorem mk_eq_zero_iff (φ : Module.Dual R P₁) :
    mk σ f ((ContragredientDual.toDual σ).symm φ) = 0 ↔
      φ ∈ LinearMap.range (f.lcomp Rᵐᵒᵖ R) := sorry

/-- The underlying additive group is the Auslander–Reiten transpose. -/
def toARTranspose : PresentationTranspose σ f ≃+ AuslanderReitenTranspose f := AddEquiv.refl _

/-- Isomorphic presentations have isomorphic transposes (reuses
`AuslanderReitenTranspose.linearEquiv`). -/
def equivOfIso {Q₀ Q₁ : Type*} [AddCommGroup Q₀] [Module R Q₀] [AddCommGroup Q₁] [Module R Q₁]
    {g : Q₁ →ₗ[R] Q₀} (e₀ : P₀ ≃ₗ[R] Q₀) (e₁ : P₁ ≃ₗ[R] Q₁)
    (hsq : e₀.toLinearMap ∘ₗ f = g ∘ₗ e₁.toLinearMap) :
    PresentationTranspose σ f ≃ₗ[S] PresentationTranspose σ g := sorry

/-- Adding an identity summand `Q →id Q` does not change the transpose. -/
def equivAddId (Q : Type*) [AddCommGroup Q] [Module R Q] :
    PresentationTranspose σ (f.prodMap (LinearMap.id : Q →ₗ[R] Q)) ≃ₗ[S]
      PresentationTranspose σ f := sorry

/-- Adding a summand `Q → 0` to the relations adds `Q^*` to the transpose. -/
def equivAddZero (Q : Type*) [AddCommGroup Q] [Module R Q] :
    PresentationTranspose σ (f.coprod (0 : Q →ₗ[R] P₀)) ≃ₗ[S]
      PresentationTranspose σ f × ContragredientDual σ Q := sorry

/-- For a square matrix presentation, the transpose is the cokernel of the `#`-transposed
matrix over `S`. -/
def quadraticPresentation (P : QuadraticPresentation R M) :
    QuadraticPresentation S (PresentationTranspose σ (Matrix.toLin' P.rel)) := sorry

theorem quadraticPresentation_size (P : QuadraticPresentation R M) :
    (quadraticPresentation σ P).size = P.size := sorry

/-- The relation matrix of the transpose is `(a_ji^#)`. -/
theorem quadraticPresentation_rel (P : QuadraticPresentation R M) :
    (quadraticPresentation σ P).rel = (Matrix.transpose (P.rel.map σ.symm)).submatrix
      (Fin.cast (quadraticPresentation_size σ P)) (Fin.cast (quadraticPresentation_size σ P)) :=
  sorry

end PresentationTranspose

/-- `L6/transpose-stable-equivalence` (Dasgupta–Kakde §6.1, after Jannsen): transposes of two
finite projective presentations of `M` agree after adding finitely generated projective
summands. -/
theorem PresentationTranspose.stableEquiv (σ : S ≃+* R) {Q₀ Q₁ : Type*} [AddCommGroup Q₀]
    [Module R Q₀] [AddCommGroup Q₁] [Module R Q₁] [Module.Projective R P₀]
    [Module.Projective R P₁] [Module.Projective R Q₀] [Module.Projective R Q₁]
    [Module.Finite R P₀] [Module.Finite R P₁] [Module.Finite R Q₀] [Module.Finite R Q₁]
    (f : P₁ →ₗ[R] P₀) (π : P₀ →ₗ[R] M) (g : Q₁ →ₗ[R] Q₀) (ρ : Q₀ →ₗ[R] M)
    (hπ : Function.Surjective π) (hf : LinearMap.range f = LinearMap.ker π)
    (hρ : Function.Surjective ρ) (hg : LinearMap.range g = LinearMap.ker ρ) :
    Nonempty (PresentationTranspose σ f × ContragredientDual σ (Q₁ × P₀) ≃ₗ[S]
      PresentationTranspose σ g × ContragredientDual σ (P₁ × Q₀)) := sorry

/-- `L6/transpose-fitting` (Dasgupta–Kakde Lemma 6.1): the transpose attached to a quadratic
presentation is quadratically presented over `S = R^#` and `Fitt_S(M^tr) = σ⁻¹(Fitt_R(M))`. -/
theorem PresentationTranspose.fittingIdeal_eq (σ : S ≃+* R) (P : QuadraticPresentation R M)
    [Module.Finite R M] [Module.Finite S (PresentationTranspose σ (Matrix.toLin' P.rel))] :
    Module.fittingIdeal S (PresentationTranspose σ (Matrix.toLin' P.rel)) 0 =
      Ideal.map σ.symm (Module.fittingIdeal R M 0) := sorry

/-- `L6/transpose-higher-fitting` (Dasgupta–Kakde (171)): for a free presentation
`R^t → R^{t+s} → M → 0`, `Fitt⁰_S(M^tr) = σ⁻¹(Fitt^s_R(M))`. -/
theorem PresentationTranspose.fittingIdeal_eq_excess (σ : S ≃+* R) {t s : ℕ}
    (A : Matrix (Fin (t + s)) (Fin t) R) (π : (Fin (t + s) → R) →ₗ[R] M)
    (hπ : Function.Surjective π) (hA : LinearMap.range (Matrix.toLin' A) = LinearMap.ker π)
    [Module.Finite R M] [Module.Finite S (PresentationTranspose σ (Matrix.toLin' A))] :
    Module.fittingIdeal S (PresentationTranspose σ (Matrix.toLin' A)) 0 =
      Ideal.map σ.symm (Module.fittingIdeal R M s) := sorry

-- test transpose_iso_presentation (degenerate) [L6/presentation-transpose]
example (σ : S ≃+* R) : Subsingleton
    (PresentationTranspose σ (LinearMap.id : (Fin 1 → R) →ₗ[R] (Fin 1 → R))) := sorry

-- test transpose_depends_on_presentation (non-example) [L6/presentation-transpose]
example [Nontrivial R] (σ : S ≃+* R) :
    Nonempty (PresentationTranspose σ (LinearMap.fst R R R) ≃ₗ[S] S) := sorry

-- test transpose_cyclic (computation) [L6/presentation-transpose]
example (σ : S ≃+* R) (a : R) :
    Nonempty (PresentationTranspose σ (Matrix.toLin' (!![a] : Matrix (Fin 1) (Fin 1) R)) ≃ₗ[S]
      S ⧸ Ideal.span {σ.symm a}) := sorry

-- test transpose_reuses_AR (compatibility) [L6/presentation-transpose]
example (σ : S ≃+* R) (f : P₁ →ₗ[R] P₀) :
    PresentationTranspose σ f = AuslanderReitenTranspose f := rfl

end Transpose

end TauCeti

end

end L6

/-!
Independent review REV-PadicMeasuresIwasawaAlgebras: needs_changes.
The packet has 436 declaration records after 67 required L4 splits. All implementation statuses
remain unchecked; no proof has been formalised. Historical elaboration applies to the inherited
file only. No suitable existing build of both pinned Tau Ceti imports was available for a fresh
full-file elaboration; no project or cache was set up.

The review report lists every declaration/API name absent from this file. In particular the
common fraction-vector-space embeddings for dual intersections, completed-algebra comparisons,
finite formal characteristic divisor support, integral character projectors, native exact
resolutions, delta/cyclotomic submodules, growth and Euler determinant interfaces remain gaps.
The characteristic divisor now has the native finitely supported natural-valued carrier with
explicit finite-generation and torsion inputs. Its finite-support/length proof is still admitted.
The invariant definitions retain their actual Z_p coefficient scope, while the packet requires
general complete DVR coefficients; this mismatch is a blocking finding. The packet uses
continuous homology H_0=coinvariants and H_1=invariants in all three minimal-resolution ranks.
Do not replace these absent interfaces with untyped propositions or new duplicate carriers.
-/
