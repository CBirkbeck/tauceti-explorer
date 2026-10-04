import TauCeti.RepresentationTheory.Homological.TateCohomology.Periodic
import Mathlib.Algebra.Module.Torsion.Basic
import Mathlib.Algebra.Module.Submodule.Equiv
import Mathlib.Algebra.Group.Torsion
import TauCeti.RepresentationTheory.Homological.TateCohomology.LowDegree
import Mathlib.RepresentationTheory.Homological.FiniteCyclic
import Mathlib.Algebra.Colimit.Module
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Topology.Algebra.Category.ProfiniteGrp.Basic
import Mathlib.CategoryTheory.Category.Preorder
import Mathlib.RingTheory.WittVector.Compare
import Mathlib.RingTheory.WittVector.Teichmuller
import Mathlib.Algebra.Group.Pi.Units
import Mathlib.RepresentationTheory.Intertwining
import Mathlib.RingTheory.WittVector.DiscreteValuationRing
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.Algebra.Module.ZMod
import Mathlib.LinearAlgebra.Matrix.Module
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.RepresentationTheory.Basic
import Mathlib.Algebra.GCDMonoid.FinsetLemmas
import Mathlib.GroupTheory.FreeAbelianGroup
import Mathlib.FieldTheory.AlgebraicClosure
import Mathlib.FieldTheory.IntermediateField.Adjoin.Defs
import Mathlib.RingTheory.PowerSeries.Exp
import Mathlib.RingTheory.PowerSeries.Expand
import Mathlib.NumberTheory.Padics.MahlerBasis
import Mathlib.NumberTheory.Wilson
import Mathlib.RingTheory.RootsOfUnity.Lemmas
import Mathlib.Data.Nat.Digits.Lemmas
import Mathlib.NumberTheory.GaussSum
import Mathlib.Data.Nat.Digits.Defs
import Mathlib.Algebra.Order.ToIntervalMod
import Mathlib.Analysis.Calculus.IteratedDeriv.Lemmas
import Mathlib.Analysis.Calculus.Deriv.ZPow
import Mathlib.Analysis.Analytic.Composition
import Mathlib.Analysis.Normed.Algebra.Exponential
import Mathlib.Analysis.Calculus.Deriv.Mul
import Mathlib.Analysis.SpecificLimits.Normed
import Mathlib.Topology.Algebra.InfiniteSum.Ring
import Mathlib.Topology.Algebra.InfiniteSum.NatInt
import Mathlib.NumberTheory.DirichletCharacter.Bounds
import Mathlib.Analysis.Normed.Group.Ultra
import Mathlib.Algebra.BigOperators.Intervals
import TauCeti.NumberTheory.LocalField.Teichmuller
import Mathlib.NumberTheory.LegendreSymbol.ZModChar
import Mathlib.Algebra.Ring.Int.Units
import Mathlib.Analysis.Normed.Algebra.Basic
import Mathlib.Topology.Algebra.IntermediateField
import TauCeti.NumberTheory.ArithmeticFunction.TwistedDivisorSum
import Mathlib.RingTheory.Valuation.Extension
import Mathlib.RingTheory.PowerSeries.Restricted
import Mathlib.RingTheory.PowerSeries.Log
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.Topology.Algebra.ContinuousMonoidHom
import Mathlib.NumberTheory.LSeries.DirichletContinuation
import Mathlib.NumberTheory.BernoulliPolynomials
import Mathlib.Data.Nat.Choose.Vandermonde
import Mathlib.Topology.Algebra.Valued.NormedValued
import Mathlib.NumberTheory.DirichletCharacter.GaussSum
import Mathlib.RingTheory.PowerSeries.WellKnown
import Mathlib.Analysis.MellinTransform
import Mathlib.Analysis.SpecialFunctions.Gamma.Beta
import Mathlib.MeasureTheory.Integral.IntegralEqImproper
import Mathlib.Analysis.SpecialFunctions.Pow.Deriv
import Mathlib.RingTheory.PowerSeries.PiTopology
import Mathlib.Algebra.MonoidAlgebra.MapDomain
import Mathlib.Data.ZMod.Units
import TauCeti.NumberTheory.ModularForms.Degeneracy
import Mathlib.NumberTheory.ModularForms.EisensteinSeries.QExpansion
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import Mathlib.NumberTheory.PowModTotient
import research.blueprint.suggested.PadicMeasuresIwasawaAlgebras
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.Algebra.Polynomial.Coeff
import Mathlib.NumberTheory.Padics.Measure.AmiceTransform
import Mathlib.NumberTheory.Bernoulli
import Mathlib.NumberTheory.LSeries.HurwitzZetaValues
import Mathlib.RingTheory.PowerSeries.Substitution
import research.blueprint.suggested.«DirichletPadicLFunctions--L0»
import research.blueprint.suggested.«DirichletPadicLFunctions--L1»
import research.blueprint.suggested.«DirichletPadicLFunctions--L2»
import research.blueprint.suggested.«DirichletPadicLFunctions--L3»
import Mathlib.NumberTheory.Padics.Measure.Basic
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.NumberTheory.Padics.ProperSpace
import Mathlib.Topology.ContinuousMap.Compact
import Mathlib.Topology.Algebra.Group.Units


/-!
# Dirichlet L4: Eisenstein coefficient families

This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. The signatures and examples suggest names and types for review;
all implementation statuses remain unchecked.

The inherited L4 declarations are projected from the unchanged combined source.
The L0/L1/L2/L3 arithmetic prototypes are imported from their existing owners.
L1/L2 modules are currently absent; PMIA is an unchecked prototype dependency.
The inherited native Tau dependency closure is unavailable at the pinned build.
This full split file is NOT COMPILED. Separate bounded checks, if reported in
the handoff, certify only the exact files identified there.
-/
noncomputable section
open scoped PowerSeries AbstractMeasure

open PowerSeries

namespace DirichletPadic
section EisensteinCoefficients
variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

def positiveEisensteinMeasure (n : ℕ+) : D(Zˣ, Z) := sorry

theorem positiveEisensteinMeasure_eq_sum (n : ℕ+) :
    positiveEisensteinMeasure p n =
      ∑ d ∈ (n : ℕ).divisors, if hd : ¬ p ∣ d then
        AbstractMeasure.dirac Z
          (PadicInt.isUnit_iff.mpr (PadicInt.norm_natCast_eq_one_iff.mpr
            ((Fact.out : p.Prime).coprime_iff_not_dvd.mpr hd))).unit else 0 := sorry

theorem positiveEisensteinMeasure_apply (n : ℕ+) (f : C(Zˣ, Z)) :
    positiveEisensteinMeasure p n f =
      ∑ d ∈ (n : ℕ).divisors, if hd : ¬ p ∣ d then
        f (PadicInt.isUnit_iff.mpr (PadicInt.norm_natCast_eq_one_iff.mpr
          ((Fact.out : p.Prime).coprime_iff_not_dvd.mpr hd))).unit else 0 := sorry

theorem positiveEisensteinMeasure_moment (n : ℕ+) (e : ℕ) :
    positiveEisensteinMeasure p n ⟨fun u : Zˣ => (u : Z) ^ e, by fun_prop⟩ =
      ∑ d ∈ (n : ℕ).divisors with ¬ p ∣ d, (d : Z) ^ e := sorry

theorem positiveEisensteinMeasure_one :
    positiveEisensteinMeasure p 1 = AbstractMeasure.dirac Z 1 := sorry

theorem positiveEisensteinMeasure_prime_pow (r : ℕ) :
    positiveEisensteinMeasure p ⟨p ^ r, pow_pos (Fact.out : p.Prime).pos r⟩ =
      AbstractMeasure.dirac Z 1 := sorry

theorem positiveEisensteinMeasure_mul_p (n : ℕ+) :
    positiveEisensteinMeasure p
      ⟨p * (n : ℕ), Nat.mul_pos (Fact.out : p.Prime).pos n.pos⟩ =
        positiveEisensteinMeasure p n := sorry

theorem positiveEisensteinMeasure_mass (n : ℕ+) :
    positiveEisensteinMeasure p n 1 =
      (((n : ℕ).divisors.filter fun d => ¬ p ∣ d).card : Z) := sorry

theorem divisorSum_eulerDeletion (n : ℕ+) (e : ℕ) :
    (∑ d ∈ (n : ℕ).divisors with ¬ p ∣ d, (d : ℤ) ^ e) =
      (ArithmeticFunction.sigma e n : ℤ) -
        if p ∣ (n : ℕ) then (p : ℤ) ^ e *
          (ArithmeticFunction.sigma e ((n : ℕ) / p) : ℤ) else 0 := sorry

theorem positiveEisensteinMeasure_euler_moment (n : ℕ+) (e : ℕ) :
    positiveEisensteinMeasure p n ⟨fun u : Zˣ => (u : Z) ^ e, by fun_prop⟩ =
      (ArithmeticFunction.sigma e n : Z) -
        if p ∣ (n : ℕ) then (p : Z) ^ e *
          (ArithmeticFunction.sigma e ((n : ℕ) / p) : Z) else 0 := sorry

theorem positiveEisensteinMeasure_moment_congr (n : ℕ+) (r e e' : ℕ)
    (hr : 0 < r) (he : Nat.ModEq (p ^ (r - 1) * (p - 1)) e e') :
    (p : Z) ^ r ∣
      positiveEisensteinMeasure p n ⟨fun u : Zˣ => (u : Z) ^ e', by fun_prop⟩ -
        positiveEisensteinMeasure p n ⟨fun u : Zˣ => (u : Z) ^ e, by fun_prop⟩ := sorry

end EisensteinCoefficients

end DirichletPadic

namespace SuggestedEisensteinTests
open DirichletPadic

-- SuggestedEisensteinTests.first_coefficient
example : positiveEisensteinMeasure 3 1 = AbstractMeasure.dirac ℤ_[3] 1 := sorry

-- SuggestedEisensteinTests.prime_coefficient_survives
example : positiveEisensteinMeasure 3 3 = AbstractMeasure.dirac ℤ_[3] 1 := sorry

-- SuggestedEisensteinTests.dyadic_divisor_sum
example (h3 : IsUnit (3 : ℤ_[2])) :
    positiveEisensteinMeasure 2 6 = AbstractMeasure.dirac ℤ_[2] 1 +
      AbstractMeasure.dirac ℤ_[2] h3.unit := sorry

-- SuggestedEisensteinTests.mass_counts_divisors
example : positiveEisensteinMeasure 2 6 1 = (2 : ℤ_[2]) := sorry

-- SuggestedEisensteinTests.weight_four_dyadic
example : positiveEisensteinMeasure 2 6
    ⟨fun u : ℤ_[2]ˣ => (u : ℤ_[2]) ^ 3, by fun_prop⟩ = 28 := sorry

-- SuggestedEisensteinTests.dyadic_precision
example : (8 : ℤ_[2]) ∣
    positiveEisensteinMeasure 2 3 ⟨fun u : ℤ_[2]ˣ => (u : ℤ_[2]) ^ 5, by fun_prop⟩ -
      positiveEisensteinMeasure 2 3 ⟨fun u : ℤ_[2]ˣ => (u : ℤ_[2]), by fun_prop⟩ := sorry

-- SuggestedEisensteinTests.tame_component_not_enough_for_precision
example [Fact (Nat.Prime 5)] : ¬ (25 : ℤ_[5]) ∣
    positiveEisensteinMeasure 5 2 ⟨fun u : ℤ_[5]ˣ => (u : ℤ_[5]) ^ 7, by fun_prop⟩ -
      positiveEisensteinMeasure 5 2 ⟨fun u : ℤ_[5]ˣ => (u : ℤ_[5]) ^ 3, by fun_prop⟩ := sorry

end SuggestedEisensteinTests

namespace DirichletPadic
section ClassicalEisenstein
open scoped MatrixGroups

open CongruenceSubgroup Matrix.SpecialLinearGroup UpperHalfPlane

def normalizedEisenstein (k : ℕ) (hk : 4 ≤ k) : ModularForm 𝒮ℒ (k : ℤ) :=
  (-(bernoulli k : ℂ) / (2 * k)) • ModularForm.E (by omega : 3 ≤ k)

theorem normalizedEisenstein_eq_smul (k : ℕ) (hk : 4 ≤ k) :
    normalizedEisenstein k hk =
      (-(bernoulli k : ℂ) / (2*k)) • ModularForm.E (by omega : 3 ≤ k) := sorry

theorem normalizedEisenstein_apply (k : ℕ) (hk : 4 ≤ k) (z : ℍ) :
    normalizedEisenstein k hk z =
      (-(bernoulli k : ℂ) / (2*k)) * ModularForm.E (by omega : 3 ≤ k) z := sorry

theorem normalizedEisenstein_coeff (k : ℕ) (hk : 4 ≤ k) (he : Even k) (n : ℕ) :
    (qExpansion 1 (normalizedEisenstein k hk)).coeff n =
      if n = 0 then -(bernoulli k : ℂ) / (2*k)
      else (ArithmeticFunction.sigma (k-1) n : ℂ) := sorry

theorem normalizedEisenstein_constant_zeta (k : ℕ) (hk : 4 ≤ k) (he : Even k) :
    (qExpansion 1 (normalizedEisenstein k hk)).coeff 0 =
      riemannZeta (1 - (k : ℂ)) / 2 ∧
    (qExpansion 1 (normalizedEisenstein k hk)).coeff 0 =
      algebraMap ℚ ℂ (-bernoulli k / (2*k)) := sorry

variable (p : ℕ) [Fact p.Prime]

def pStabilizedEisenstein (k : ℕ) (hk : 4 ≤ k) :
    ModularForm ((Gamma0 p).map (mapGL ℝ)) (k : ℤ) :=
  ModularForm.ofLe (Subgroup.map_le_range _ _) (normalizedEisenstein k hk) -
    (p : ℂ) ^ (k - 1) • TauCeti.ModularForm.levelRaise p
      (by simpa using TauCeti.Gamma0_map_le_conjAct_scaleGL 1 p)
      (ModularForm.ofLe (Subgroup.map_le_range _ _) (normalizedEisenstein k hk))

theorem pStabilizedEisenstein_eq (k : ℕ) (hk : 4 ≤ k) :
    pStabilizedEisenstein p k hk =
      ModularForm.ofLe (Subgroup.map_le_range _ _) (normalizedEisenstein k hk) -
        (p : ℂ) ^ (k - 1) • TauCeti.ModularForm.levelRaise p
          (by simpa using TauCeti.Gamma0_map_le_conjAct_scaleGL 1 p)
          (ModularForm.ofLe (Subgroup.map_le_range _ _) (normalizedEisenstein k hk)) := sorry

theorem pStabilizedEisenstein_apply (k : ℕ) (hk : 4 ≤ k) (z : ℍ) :
    pStabilizedEisenstein p k hk z = normalizedEisenstein k hk z -
      (p : ℂ) ^ (k-1) * normalizedEisenstein k hk (TauCeti.scaleGL p • z) := sorry

theorem pStabilizedEisenstein_qExpansion (k : ℕ) (hk : 4 ≤ k) :
    qExpansion 1 (pStabilizedEisenstein p k hk) =
      qExpansion 1 (normalizedEisenstein k hk) - (p : ℂ) ^ (k-1) •
        (qExpansion 1 (normalizedEisenstein k hk)).expand p (NeZero.ne p) := sorry

theorem pStabilizedEisenstein_coeff_pos (k : ℕ) (hk : 4 ≤ k) (he : Even k) (n : ℕ+) :
    (qExpansion 1 (pStabilizedEisenstein p k hk)).coeff (n : ℕ) =
      ((∑ d ∈ (n : ℕ).divisors with ¬ p ∣ d, (d : ℤ) ^ (k-1)) : ℂ) := sorry

theorem pStabilizedEisenstein_constant_zeta (k : ℕ) (hk : 4 ≤ k) (he : Even k) :
    (qExpansion 1 (pStabilizedEisenstein p k hk)).coeff 0 =
      (1 - (p : ℂ) ^ (k-1)) * riemannZeta (1 - (k : ℂ)) / 2 ∧
    (qExpansion 1 (pStabilizedEisenstein p k hk)).coeff 0 =
      algebraMap ℚ ℂ (-(1-(p : ℚ)^(k-1))*bernoulli k/(2*k)) := sorry

theorem positiveEisensteinMeasure_modular_coeff (k : ℕ) (hk : 4 ≤ k) (he : Even k)
    (n : ℕ+) :
    ∃! S : ℤ,
      (qExpansion 1 (pStabilizedEisenstein p k hk)).coeff (n : ℕ) = (S : ℂ) ∧
      positiveEisensteinMeasure p n
        ⟨fun u : ℤ_[p]ˣ => (u : ℤ_[p]) ^ (k-1), by fun_prop⟩ = (S : ℤ_[p]) := sorry

end ClassicalEisenstein

end DirichletPadic

namespace SuggestedModularTests
open DirichletPadic UpperHalfPlane

-- SuggestedModularTests.weight_four_normalization
example : (qExpansion 1 (normalizedEisenstein 4 (by decide))).coeff 0 = (1/240 : ℂ) ∧
    (qExpansion 1 (normalizedEisenstein 4 (by decide))).coeff 1 = 1 := sorry

-- SuggestedModularTests.weight_six_sign
example : (qExpansion 1 (normalizedEisenstein 6 (by decide))).coeff 0 = (-1/504 : ℂ) ∧
    (qExpansion 1 (normalizedEisenstein 6 (by decide))).coeff 2 = 33 := sorry

-- SuggestedModularTests.native_constant_one_rejected
example : (qExpansion 1 (normalizedEisenstein 4 (by decide))).coeff 0 ≠ (1 : ℂ) := sorry

-- SuggestedModularTests.dyadic_stabilized_constant
example : (qExpansion 1 (pStabilizedEisenstein 2 4 (by decide))).coeff 0 = (-7/240 : ℂ) := sorry

-- SuggestedModularTests.coefficient_at_p_survives
example : (qExpansion 1 (pStabilizedEisenstein 2 4 (by decide))).coeff 2 = (1 : ℂ) ∧
    (qExpansion 1 (pStabilizedEisenstein 2 4 (by decide))).coeff 2 ≠ (0 : ℂ) := sorry

-- SuggestedModularTests.prime_to_p_index
example : (qExpansion 1 (pStabilizedEisenstein 3 4 (by decide))).coeff 2 = (9 : ℂ) := sorry

-- SuggestedModularTests.multiple_of_p_index
example : (qExpansion 1 (pStabilizedEisenstein 3 4 (by decide))).coeff 6 = (9 : ℂ) ∧
    (qExpansion 1 (pStabilizedEisenstein 3 4 (by decide))).coeff 6 =
      (qExpansion 1 (pStabilizedEisenstein 3 4 (by decide))).coeff 2 := sorry

end SuggestedModularTests

noncomputable section
namespace DirichletPadic
section FiniteEisenstein
variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

def positiveEisensteinFinite (n : ℕ+) (r s : ℕ) :
    MonoidAlgebra (ZMod (p ^ s)) (ZMod (p ^ r))ˣ := sorry

theorem positiveEisensteinFinite_eq_sum (n : ℕ+) (r s : ℕ) :
    positiveEisensteinFinite p n r s =
      ∑ d ∈ (n : ℕ).divisors, if hd : ¬ p ∣ d then
        MonoidAlgebra.single ((Units.map (PadicInt.toZModPow r).toMonoidHom) (PadicInt.isUnit_iff.mpr (PadicInt.norm_natCast_eq_one_iff.mpr
          ((Fact.out : p.Prime).coprime_iff_not_dvd.mpr hd))).unit) 1 else 0 := sorry

theorem positiveEisensteinFinite_coeff (n : ℕ+) (r s : ℕ) (a : (ZMod (p ^ r))ˣ) :
    (positiveEisensteinFinite p n r s).coeff a =
      ∑ d ∈ (n : ℕ).divisors, if hd : ¬ p ∣ d then
        (if (Units.map (PadicInt.toZModPow r).toMonoidHom) (PadicInt.isUnit_iff.mpr (PadicInt.norm_natCast_eq_one_iff.mpr
          ((Fact.out : p.Prime).coprime_iff_not_dvd.mpr hd))).unit = a then (1 : ZMod (p ^ s)) else 0) else 0 := sorry

theorem positiveEisensteinFinite_transition (n : ℕ+) {r r' s s' : ℕ}
    (hr : r' ≤ r) (hs : s' ≤ s) :
    MonoidAlgebra.mapDomainRingHom (ZMod (p ^ s')) (ZMod.unitsMap (pow_dvd_pow p hr))
      (MonoidAlgebra.mapRingHom _ (ZMod.castHom (pow_dvd_pow p hs) (ZMod (p ^ s')))
        (positiveEisensteinFinite p n r s)) = positiveEisensteinFinite p n r' s' := sorry

theorem positiveEisensteinFinite_apply (n : ℕ+) (r s : ℕ)
    (f : C(Zˣ, Z)) (g : (ZMod (p ^ r))ˣ → ZMod (p ^ s))
    (hfg : ∀ u : Zˣ, PadicInt.toZModPow s (f u) = g ((Units.map (PadicInt.toZModPow r).toMonoidHom) u)) :
    PadicInt.toZModPow s (positiveEisensteinMeasure p n f) =
      ∑ a, (positiveEisensteinFinite p n r s).coeff a * g a := sorry

theorem positiveEisensteinFinite_moment (n : ℕ+) {r s : ℕ} (h : s ≤ r) (e : ℕ) :
    ∑ a : (ZMod (p ^ r))ˣ, (positiveEisensteinFinite p n r s).coeff a *
      (ZMod.castHom (pow_dvd_pow p h) (ZMod (p ^ s)) (a : ZMod (p ^ r))) ^ e =
        PadicInt.toZModPow s (positiveEisensteinMeasure p n
          ⟨fun u : Zˣ => (u : Z) ^ e, by fun_prop⟩) := sorry

theorem positiveEisensteinFinite_one (r s : ℕ) :
    positiveEisensteinFinite p 1 r s = MonoidAlgebra.single 1 1 := sorry

theorem positiveEisensteinFinite_prime_pow (a r s : ℕ) :
    positiveEisensteinFinite p ⟨p ^ a, pow_pos (Fact.out : p.Prime).pos a⟩ r s =
      MonoidAlgebra.single 1 1 := sorry

theorem positiveEisensteinFinite_mul_p (n : ℕ+) (r s : ℕ) :
    positiveEisensteinFinite p ⟨p * (n : ℕ), Nat.mul_pos (Fact.out : p.Prime).pos n.pos⟩ r s =
      positiveEisensteinFinite p n r s := sorry

theorem positiveEisensteinFinite_coeff_zero (n : ℕ+) (r : ℕ) :
    positiveEisensteinFinite p n r 0 = 0 := sorry

-- FiniteCoefficientTests.dyadic_separated
example : positiveEisensteinFinite 2 6 2 3 =
    MonoidAlgebra.single 1 1 + MonoidAlgebra.single (-1) 1 := sorry

-- FiniteCoefficientTests.dyadic_collision
example : positiveEisensteinFinite 2 6 1 3 = MonoidAlgebra.single 1 2 := sorry

-- FiniteCoefficientTests.dyadic_cancellation
example : positiveEisensteinFinite 2 6 1 1 = 0 := sorry

-- FiniteCoefficientTests.prime_coefficient
example : positiveEisensteinFinite 3 3 2 2 = MonoidAlgebra.single 1 1 := sorry

-- FiniteCoefficientTests.trivial_group_mass
example : positiveEisensteinFinite 2 6 0 3 = MonoidAlgebra.single 1 2 := sorry

-- FiniteCoefficientTests.zero_coefficient_ring
example (n : ℕ+) (r : ℕ) : positiveEisensteinFinite p n r 0 = 0 := sorry

-- FiniteCoefficientTests.separate_precision_levels
example : positiveEisensteinFinite 2 6 2 1 ≠ 0 ∧ positiveEisensteinFinite 2 6 1 1 = 0 := sorry

end FiniteEisenstein

end DirichletPadic

namespace DirichletPadic
section PositiveSeries
open scoped PowerSeries.WithPiTopology

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

 theorem positiveEisensteinMeasure_norm_le (n : ℕ+) (f : C(Zˣ, Z)) :
    ‖positiveEisensteinMeasure p n f‖ ≤ ‖f‖ := sorry

def positiveEisensteinSeries : AbstractMeasure Zˣ Z (PowerSeries Z) := sorry

 theorem positiveEisensteinSeries_coeff (f : C(Zˣ, Z)) (n : ℕ) :
    (positiveEisensteinSeries p f).coeff n =
      if hn : 0 < n then positiveEisensteinMeasure p ⟨n, hn⟩ f else 0 := sorry

theorem positiveEisensteinSeries_coeff_zero (f : C(Zˣ, Z)) :
    (positiveEisensteinSeries p f).coeff 0 = 0 := sorry

theorem positiveEisensteinSeries_coeff_pos (f : C(Zˣ, Z)) (n : ℕ+) :
    (positiveEisensteinSeries p f).coeff (n : ℕ) = positiveEisensteinMeasure p n f := sorry

theorem positiveEisensteinSeries_zero : positiveEisensteinSeries p 0 = 0 := sorry

theorem positiveEisensteinSeries_add (f g : C(Zˣ, Z)) :
    positiveEisensteinSeries p (f + g) =
      positiveEisensteinSeries p f + positiveEisensteinSeries p g := sorry

theorem positiveEisensteinSeries_smul (a : Z) (f : C(Zˣ, Z)) :
    positiveEisensteinSeries p (a • f) = a • positiveEisensteinSeries p f := sorry

theorem positiveEisensteinSeries_continuous : Continuous (positiveEisensteinSeries p) := sorry

theorem positiveEisensteinSeries_unique (M : AbstractMeasure Zˣ Z (PowerSeries Z))
    (h0 : ∀ f, (M f).coeff 0 = 0)
    (hpos : ∀ f (n : ℕ+), (M f).coeff (n : ℕ) = positiveEisensteinMeasure p n f) :
    M = positiveEisensteinSeries p := sorry

 theorem positiveEisensteinSeries_coeff_norm_le (f : C(Zˣ, Z)) (n : ℕ) :
    ‖(positiveEisensteinSeries p f).coeff n‖ ≤ ‖f‖ := sorry

 theorem positiveEisensteinSeries_test_congr (f g : C(Zˣ, Z)) (r : ℕ)
    (h : ∀ u : Zˣ, (p : Z)^r ∣ f u - g u) :
    PowerSeries.C ((p : Z)^r) ∣ positiveEisensteinSeries p f - positiveEisensteinSeries p g := sorry

 theorem positiveEisensteinSeries_weight_congr (r e e' : ℕ)
    (hr : 0 < r) (he : Nat.ModEq (p^(r-1)*(p-1)) e e') :
    PowerSeries.C ((p : Z)^r) ∣
      positiveEisensteinSeries p ⟨fun u : Zˣ => (u : Z)^e', by fun_prop⟩ -
        positiveEisensteinSeries p ⟨fun u : Zˣ => (u : Z)^e, by fun_prop⟩ := sorry

 theorem positiveEisensteinSeries_coeff_mul_p (f : C(Zˣ, Z)) (n : ℕ) :
    (positiveEisensteinSeries p f).coeff (p*n) = (positiveEisensteinSeries p f).coeff n := sorry

open UpperHalfPlane in

 theorem positiveEisensteinSeries_modular (k : ℕ) (hk : 4 ≤ k) (he : Even k) :
    ∃! Q : PowerSeries ℤ,
      Q.map (Int.castRingHom ℂ) =
        qExpansion 1 (pStabilizedEisenstein p k hk) -
          PowerSeries.C ((qExpansion 1 (pStabilizedEisenstein p k hk)).coeff 0) ∧
      Q.map (Int.castRingHom Z) =
        positiveEisensteinSeries p ⟨fun u : Zˣ => (u : Z)^(k-1), by fun_prop⟩ := sorry

end PositiveSeries

end DirichletPadic

namespace SuggestedPositiveSeriesTests
open DirichletPadic

open scoped PowerSeries.WithPiTopology

-- SuggestedPositiveSeriesTests.zero_input
example : positiveEisensteinSeries 2 0 = 0 := sorry

-- SuggestedPositiveSeriesTests.constant_coefficient
example (f : C(ℤ_[2]ˣ, ℤ_[2])) : (positiveEisensteinSeries 2 f).coeff 0 = 0 := sorry

-- SuggestedPositiveSeriesTests.first_coefficient
example (f : C(ℤ_[3]ˣ, ℤ_[3])) : (positiveEisensteinSeries 3 f).coeff 1 = f 1 := sorry

-- SuggestedPositiveSeriesTests.prime_coefficient
example (f : C(ℤ_[3]ˣ, ℤ_[3])) : (positiveEisensteinSeries 3 f).coeff 3 = f 1 := sorry

-- SuggestedPositiveSeriesTests.dyadic_weight_four
example : (positiveEisensteinSeries 2
    ⟨fun u : ℤ_[2]ˣ => (u : ℤ_[2])^3, by fun_prop⟩).coeff 6 = 28 := sorry

-- SuggestedPositiveSeriesTests.dyadic_series_precision
example : PowerSeries.C (8 : ℤ_[2]) ∣
    positiveEisensteinSeries 2 ⟨fun u : ℤ_[2]ˣ => (u : ℤ_[2])^5, by fun_prop⟩ -
      positiveEisensteinSeries 2 ⟨fun u : ℤ_[2]ˣ => (u : ℤ_[2]), by fun_prop⟩ := sorry

-- SuggestedPositiveSeriesTests.tame_congruence_insufficient
example [Fact (Nat.Prime 5)] : ¬ PowerSeries.C (25 : ℤ_[5]) ∣
    positiveEisensteinSeries 5 ⟨fun u : ℤ_[5]ˣ => (u : ℤ_[5])^7, by fun_prop⟩ -
      positiveEisensteinSeries 5 ⟨fun u : ℤ_[5]ˣ => (u : ℤ_[5])^3, by fun_prop⟩ := sorry

-- SuggestedPositiveSeriesTests.omitted_constant_is_nonzero
example : (UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein 2 4 (by decide))).coeff 0 =
    (-7/240 : ℂ) ∧ (positiveEisensteinSeries 2
      ⟨fun u : ℤ_[2]ˣ => (u : ℤ_[2])^3, by fun_prop⟩).coeff 0 = 0 := sorry

end SuggestedPositiveSeriesTests

namespace DirichletPadic
open scoped AbstractMeasure

open AbstractMeasure

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => Zˣ

local notation "M" => D(U,Z)

local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))

local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)

local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }

local notation "Q" => FractionRing M

def eisensteinTwistedDenominator (u : U) : M := sorry

lemma eisensteinTwistedDenominator_def (u : U) :
    eisensteinTwistedDenominator p u = (u : Z) • dirac Z u-1 := sorry

lemma eisensteinTwistedDenominator_apply (u : U) (f : C(U,Z)) :
    eisensteinTwistedDenominator p u f = (u : Z)*f u-f 1 := sorry

lemma eisensteinTwistedDenominator_one : eisensteinTwistedDenominator p 1 = 0 := sorry

lemma eisensteinTwistedDenominator_moment (u : U) (k : ℕ) :
    eisensteinTwistedDenominator p u (j^k) = (u : Z)^(k+1)-1 := sorry

lemma eisensteinTwistedDenominator_double_regular (a : U)
    (ha : (a : Z)=(p+1 : ℕ)) :
    2*eisensteinTwistedDenominator p a ∈ nonZeroDivisors M := sorry

def eisensteinWeightedNumerator (u : U) : M := sorry

lemma eisensteinWeightedNumerator_def (u : U) :
    eisensteinWeightedNumerator p u = weight j (padicIntrinsicNumerator p u) := sorry

lemma eisensteinWeightedNumerator_apply (u : U) (f : C(U,Z)) :
    eisensteinWeightedNumerator p u f = padicIntrinsicNumerator p u (j*f) := sorry

lemma eisensteinWeightedNumerator_one : eisensteinWeightedNumerator p 1 = 0 := sorry

lemma eisensteinWeightedNumerator_neg_one : eisensteinWeightedNumerator p (-1) = 0 := sorry

lemma eisensteinWeightedNumerator_moment (u : U) (k : ℕ) :
    (eisensteinWeightedNumerator p u (j^k) : ℚ_[p]) =
      (1-(p : ℚ_[p])^k)*(1-(u : ℚ_[p])^(k+1))*
      algebraMap ℚ ℚ_[p] (bernoulli (k+1)/(k+1)) := sorry

def localizedEisensteinConstant : Q := sorry

lemma localizedEisensteinConstant_eq_fraction (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    localizedEisensteinConstant p =
      IsLocalization.mk' Q (eisensteinWeightedNumerator p a)
        ⟨2*eisensteinTwistedDenominator p a,
          eisensteinTwistedDenominator_double_regular p a ha⟩ := sorry

lemma localizedEisensteinConstant_clearing (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    (2 : Q)*algebraMap M Q (eisensteinTwistedDenominator p a)*
      localizedEisensteinConstant p = algebraMap M Q (eisensteinWeightedNumerator p a) := sorry

lemma localizedEisensteinConstant_unique (a : U) (ha : (a : Z)=(p+1 : ℕ)) (z : Q)
    (hz : (2 : Q)*algebraMap M Q (eisensteinTwistedDenominator p a)*z =
      algebraMap M Q (eisensteinWeightedNumerator p a)) :
    z=localizedEisensteinConstant p := sorry

lemma localizedEisensteinConstant_double_twist (T : M ≃+* M)
    (hT : ∀ μ : M, T μ=weight j μ) :
    (2 : Q)*localizedEisensteinConstant p =
      IsFractionRing.ringEquivOfRingEquiv (K := Q) (L := Q) T
        (kubotaLeopoldtPseudomeasure p : Q) := sorry

end DirichletPadic

namespace SuggestedLocalizedEisensteinTests
open scoped AbstractMeasure

open AbstractMeasure DirichletPadic

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => Zˣ

local notation "M" => D(U,Z)

local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))

local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)

local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }

local notation "Q" => FractionRing M

-- SuggestedLocalizedEisensteinTests.denominator_identity
example : eisensteinTwistedDenominator p 1 = 0 := sorry

-- SuggestedLocalizedEisensteinTests.denominator_zero_test
example (u : U) : eisensteinTwistedDenominator p u 0 = 0 := sorry

-- SuggestedLocalizedEisensteinTests.denominator_mass_shift
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    eisensteinTwistedDenominator p a 1 = (p : Z) := sorry

-- SuggestedLocalizedEisensteinTests.denominator_dyadic_first
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    eisensteinTwistedDenominator 2 a (⟨Units.val,Units.continuous_val⟩ : C((ℤ_[2])ˣ,ℤ_[2])) = 8 := sorry

-- SuggestedLocalizedEisensteinTests.denominator_dyadic_cubic
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    eisensteinTwistedDenominator 2 a
      ((⟨Units.val,Units.continuous_val⟩ : C((ℤ_[2])ˣ,ℤ_[2]))^3) = 80 := sorry

-- SuggestedLocalizedEisensteinTests.regular_dyadic_double
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    2*eisensteinTwistedDenominator 2 a ∈ nonZeroDivisors D((ℤ_[2])ˣ,ℤ_[2]) := sorry

-- SuggestedLocalizedEisensteinTests.regular_is_not_integral_division
example : ¬IsUnit (2 : ℤ_[2]) := sorry

-- SuggestedLocalizedEisensteinTests.numerator_identity
example : eisensteinWeightedNumerator p 1 = 0 := sorry

-- SuggestedLocalizedEisensteinTests.numerator_negative_identity
example : eisensteinWeightedNumerator p (-1) = 0 := sorry

-- SuggestedLocalizedEisensteinTests.numerator_all_tests
example (u : U) (f : C(U,Z)) :
    eisensteinWeightedNumerator p u f = padicIntrinsicNumerator p u (j*f) := sorry

-- SuggestedLocalizedEisensteinTests.numerator_mass_zero
example (u : U) : eisensteinWeightedNumerator p u 1 = 0 := sorry

-- SuggestedLocalizedEisensteinTests.numerator_dyadic_first
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    (eisensteinWeightedNumerator 2 a
      (⟨Units.val,Units.continuous_val⟩ : C((ℤ_[2])ˣ,ℤ_[2])) : ℚ_[2]) = 2/3 := sorry

-- SuggestedLocalizedEisensteinTests.numerator_dyadic_cubic
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    (eisensteinWeightedNumerator 2 a
      ((⟨Units.val,Units.continuous_val⟩ : C((ℤ_[2])ˣ,ℤ_[2]))^3) : ℚ_[2]) = -14/3 := sorry

-- SuggestedLocalizedEisensteinTests.constant_fraction_canonical
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    localizedEisensteinConstant p = IsLocalization.mk' Q (eisensteinWeightedNumerator p a)
      ⟨2*eisensteinTwistedDenominator p a,eisensteinTwistedDenominator_double_regular p a ha⟩ := sorry

-- SuggestedLocalizedEisensteinTests.constant_representative_independent
example (a b : U) (ha : (a : Z)=(p+1 : ℕ)) (hb : (b : Z)=(p+1 : ℕ)) :
    IsLocalization.mk' Q (eisensteinWeightedNumerator p a)
      ⟨2*eisensteinTwistedDenominator p a,eisensteinTwistedDenominator_double_regular p a ha⟩ =
    IsLocalization.mk' Q (eisensteinWeightedNumerator p b)
      ⟨2*eisensteinTwistedDenominator p b,eisensteinTwistedDenominator_double_regular p b hb⟩ := sorry

-- SuggestedLocalizedEisensteinTests.constant_clearing_unique
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) (z : Q)
    (hz : (2 : Q)*algebraMap M Q (eisensteinTwistedDenominator p a)*z =
      algebraMap M Q (eisensteinWeightedNumerator p a)) :
    z=localizedEisensteinConstant p := sorry

-- SuggestedLocalizedEisensteinTests.clearing_keeps_two
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    algebraMap M Q (2*eisensteinTwistedDenominator p a)*localizedEisensteinConstant p =
      algebraMap M Q (eisensteinWeightedNumerator p a) := sorry

-- SuggestedLocalizedEisensteinTests.conditional_twist_keeps_two
example (T : M ≃+* M) (hT : ∀ μ : M, T μ=weight j μ) :
    (2 : Q)*localizedEisensteinConstant p =
      IsFractionRing.ringEquivOfRingEquiv (K := Q) (L := Q) T
        (kubotaLeopoldtPseudomeasure p : Q) := sorry

end SuggestedLocalizedEisensteinTests

namespace DirichletPadic
open scoped AbstractMeasure

open AbstractMeasure

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => Zˣ

local notation "M" => D(U,Z)

local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))

local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)

local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }

local notation "Q" => FractionRing M

local notation "d" => (fun a : U => 2*eisensteinTwistedDenominator p a)

local notation "S" => (fun a : U => Localization.Away (d a))

def eisensteinMomentHom (k : ℕ) : M →+* ℚ_[p] := sorry

lemma eisensteinMomentHom_def (k : ℕ) :
    eisensteinMomentHom p k = (algebraMap Z ℚ_[p]).comp
      (characterIntegralAlgHom
        (primePowerArithmeticCharacter p 0 (1 : DirichletCharacter Z (p^0)) k)).toRingHom := sorry

lemma eisensteinMomentHom_apply (k : ℕ) (μ : M) :
    eisensteinMomentHom p k μ = (μ (j^k) : ℚ_[p]) := sorry

lemma eisensteinMomentHom_dirac (k : ℕ) (u : U) :
    eisensteinMomentHom p k (dirac Z u) = (u : ℚ_[p])^k := sorry

lemma eisensteinMomentHom_zero_weight (μ : M) :
    eisensteinMomentHom p 0 μ = (μ 1 : ℚ_[p]) := sorry

lemma eisensteinMomentHom_denominator_ne_zero (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ) :
    eisensteinMomentHom p k (d a) ≠ 0 := sorry

def eisensteinAwayConstant (a : U) : S a := sorry

lemma eisensteinAwayConstant_def (a : U) :
    eisensteinAwayConstant p a = IsLocalization.mk' (S a)
      (eisensteinWeightedNumerator p a) ⟨d a,Submonoid.mem_powers (d a)⟩ := sorry

lemma eisensteinAwayConstant_clearing (a : U) :
    algebraMap M (S a) (d a)*eisensteinAwayConstant p a =
      algebraMap M (S a) (eisensteinWeightedNumerator p a) := sorry

lemma eisensteinAwayConstant_unique (a : U) (z : S a)
    (hz : algebraMap M (S a) (d a)*z = algebraMap M (S a) (eisensteinWeightedNumerator p a)) :
    z=eisensteinAwayConstant p a := sorry

def eisensteinAwayToFraction (a : U) (ha : (a : Z)=(p+1 : ℕ)) : S a →+* Q := sorry

lemma eisensteinAwayToFraction_def (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    eisensteinAwayToFraction p a ha = IsLocalization.Away.lift (d a)
      (IsLocalization.map_units Q
        (⟨d a,eisensteinTwistedDenominator_double_regular p a ha⟩ : nonZeroDivisors M)) := sorry

lemma eisensteinAwayToFraction_algebraMap (a : U) (ha : (a : Z)=(p+1 : ℕ)) (μ : M) :
    eisensteinAwayToFraction p a ha (algebraMap M (S a) μ) = algebraMap M Q μ := sorry

lemma eisensteinAwayToFraction_injective (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    Function.Injective (eisensteinAwayToFraction p a ha) := sorry

lemma eisensteinAwayToFraction_constant (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    eisensteinAwayToFraction p a ha (eisensteinAwayConstant p a) = localizedEisensteinConstant p := sorry

def eisensteinAwayMoment (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ) : S a →+* ℚ_[p] := sorry

lemma eisensteinAwayMoment_def (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ) :
    eisensteinAwayMoment p a ha k = IsLocalization.Away.lift (d a)
      (isUnit_iff_ne_zero.mpr (eisensteinMomentHom_denominator_ne_zero p a ha k)) := sorry

lemma eisensteinAwayMoment_algebraMap (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ) (μ : M) :
    eisensteinAwayMoment p a ha k (algebraMap M (S a) μ) = (μ (j^k) : ℚ_[p]) := sorry

lemma eisensteinAwayMoment_unique (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ)
    (F : S a →+* ℚ_[p]) (hF : ∀ μ : M, F (algebraMap M (S a) μ)=eisensteinMomentHom p k μ) :
    F=eisensteinAwayMoment p a ha k := sorry

lemma eisensteinAwayMoment_constant (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ) :
    eisensteinAwayMoment p a ha k (eisensteinAwayConstant p a) =
      algebraMap ℚ ℚ_[p] (-(1-(p : ℚ)^k)*bernoulli (k+1)/(2*(k+1))) := sorry

theorem eisensteinAwayConstant_classical (a : U) (ha : (a : Z)=(p+1 : ℕ))
    (k : ℕ) (hk : 4 ≤ k) (he : Even k) :
    let c : ℚ := -(1-(p : ℚ)^(k-1))*bernoulli k/(2*k)
    eisensteinAwayMoment p a ha (k-1) (eisensteinAwayConstant p a) = algebraMap ℚ ℚ_[p] c ∧
      (UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein p k hk)).coeff 0 = algebraMap ℚ ℂ c := sorry

end DirichletPadic

namespace SuggestedEisensteinAwayTests
open scoped AbstractMeasure

open AbstractMeasure DirichletPadic

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => Zˣ

local notation "M" => D(U,Z)

local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))

local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)

local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }

local notation "Q" => FractionRing M

local notation "d" => (fun a : U => 2*eisensteinTwistedDenominator p a)

local notation "S" => (fun a : U => Localization.Away (d a))

-- SuggestedEisensteinAwayTests.moment_zero_is_mass
example (μ : M) : eisensteinMomentHom p 0 μ = (μ 1 : ℚ_[p]) := sorry

-- SuggestedEisensteinAwayTests.moment_identity_atom
example (k : ℕ) : eisensteinMomentHom p k (dirac Z (1 : U)) = 1 := sorry

-- SuggestedEisensteinAwayTests.moment_sign_atom
example (k : ℕ) : eisensteinMomentHom p k (dirac Z (-1 : U)) = (-1 : ℚ_[p])^k := sorry

-- SuggestedEisensteinAwayTests.moment_arbitrary_integral_test
example (k : ℕ) (μ : M) : eisensteinMomentHom p k μ = (μ (j^k) : ℚ_[p]) := sorry

-- SuggestedEisensteinAwayTests.denominator_mass_nonzero
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) : eisensteinMomentHom p 0 (d a) = 2*(p : ℚ_[p]) := sorry

-- SuggestedEisensteinAwayTests.denominator_dyadic_fourth_weight
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    eisensteinMomentHom 2 3 (2*eisensteinTwistedDenominator 2 a) = 160 := sorry

-- SuggestedEisensteinAwayTests.away_fraction_definition
example (a : U) : eisensteinAwayConstant p a = IsLocalization.mk' (S a)
    (eisensteinWeightedNumerator p a) ⟨d a,Submonoid.mem_powers (d a)⟩ := sorry

-- SuggestedEisensteinAwayTests.away_clearing_characterizes
example (a : U) (z : S a) (hz : algebraMap M (S a) (d a)*z =
    algebraMap M (S a) (eisensteinWeightedNumerator p a)) : z=eisensteinAwayConstant p a := sorry

-- SuggestedEisensteinAwayTests.identity_parameter_collapses_localization
example : (0 : S (1 : U)) = 1 := sorry

-- SuggestedEisensteinAwayTests.inclusion_integral_numerator
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    eisensteinAwayToFraction p a ha (algebraMap M (S a) (eisensteinWeightedNumerator p a)) =
      algebraMap M Q (eisensteinWeightedNumerator p a) := sorry

-- SuggestedEisensteinAwayTests.inclusion_detects_equality
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) (x y : S a) :
    eisensteinAwayToFraction p a ha x=eisensteinAwayToFraction p a ha y ↔ x=y := sorry

-- SuggestedEisensteinAwayTests.inclusion_unit
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) : eisensteinAwayToFraction p a ha 1=1 := sorry

-- SuggestedEisensteinAwayTests.inclusion_is_actual_constant
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    eisensteinAwayToFraction p a ha (eisensteinAwayConstant p a)=localizedEisensteinConstant p := sorry

-- SuggestedEisensteinAwayTests.evaluator_integral_measure
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ) (μ : M) :
    eisensteinAwayMoment p a ha k (algebraMap M (S a) μ)=(μ (j^k) : ℚ_[p]) := sorry

-- SuggestedEisensteinAwayTests.evaluator_unit
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ) : eisensteinAwayMoment p a ha k 1=1 := sorry

-- SuggestedEisensteinAwayTests.evaluator_unique_extension
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ) (F : S a →+* ℚ_[p])
    (hF : ∀ μ : M, F (algebraMap M (S a) μ)=eisensteinMomentHom p k μ) :
    F=eisensteinAwayMoment p a ha k := sorry

-- SuggestedEisensteinAwayTests.constant_zero_exponent
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    eisensteinAwayMoment p a ha 0 (eisensteinAwayConstant p a)=0 := sorry

-- SuggestedEisensteinAwayTests.constant_dyadic_weight_four
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    eisensteinAwayMoment 2 a ha 3 (eisensteinAwayConstant 2 a)= -7/240 := sorry

-- SuggestedEisensteinAwayTests.constant_odd_weight_three
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    eisensteinAwayMoment p a ha 2 (eisensteinAwayConstant p a)=0 := sorry

-- SuggestedEisensteinAwayTests.common_dyadic_classical_constant
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    eisensteinAwayMoment 2 a ha 3 (eisensteinAwayConstant 2 a)=(-7/240 : ℚ_[2]) ∧
      (UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein 2 4 (by decide))).coeff 0=(-7/240 : ℂ) := sorry

-- SuggestedEisensteinAwayTests.common_ternary_classical_constant
example (a : (ℤ_[3])ˣ) (ha : (a : ℤ_[3])=4) :
    eisensteinAwayMoment 3 a ha 3 (eisensteinAwayConstant 3 a)=(-13/120 : ℚ_[3]) ∧
      (UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein 3 4 (by decide))).coeff 0=(-13/120 : ℂ) := sorry

end SuggestedEisensteinAwayTests

namespace DirichletPadic
open scoped AbstractMeasure PowerSeries.WithPiTopology

open AbstractMeasure

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => Zˣ

local notation "M" => D(U,Z)

local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))

local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)

local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }

local notation "Q" => FractionRing M

local notation "S" => (fun a : U => Localization.Away (2*eisensteinTwistedDenominator p a))

def eisensteinAwaySeries (a : U) : PowerSeries (S a) := sorry

lemma eisensteinAwaySeries_coeff (a : U) (n : ℕ) :
    (eisensteinAwaySeries p a).coeff n = if hn : 0<n then
      algebraMap M (S a) (positiveEisensteinMeasure p ⟨n,hn⟩) else eisensteinAwayConstant p a := sorry

lemma eisensteinAwaySeries_coeff_zero (a : U) :
    (eisensteinAwaySeries p a).coeff 0=eisensteinAwayConstant p a := sorry

lemma eisensteinAwaySeries_coeff_pos (a : U) (n : ℕ+) :
    (eisensteinAwaySeries p a).coeff (n : ℕ)=algebraMap M (S a) (positiveEisensteinMeasure p n) := sorry

lemma eisensteinAwaySeries_unique (a : U) (F : PowerSeries (S a))
    (h0 : F.coeff 0=eisensteinAwayConstant p a)
    (hp : ∀ n : ℕ+, F.coeff (n : ℕ)=algebraMap M (S a) (positiveEisensteinMeasure p n)) :
    F=eisensteinAwaySeries p a := sorry

def totalEisensteinSeries : PowerSeries Q := sorry

lemma totalEisensteinSeries_coeff (n : ℕ) :
    (totalEisensteinSeries p).coeff n = if hn : 0<n then
      algebraMap M Q (positiveEisensteinMeasure p ⟨n,hn⟩) else localizedEisensteinConstant p := sorry

lemma totalEisensteinSeries_coeff_zero :
    (totalEisensteinSeries p).coeff 0=localizedEisensteinConstant p := sorry

lemma totalEisensteinSeries_coeff_pos (n : ℕ+) :
    (totalEisensteinSeries p).coeff (n : ℕ)=algebraMap M Q (positiveEisensteinMeasure p n) := sorry

lemma totalEisensteinSeries_unique (F : PowerSeries Q)
    (h0 : F.coeff 0=localizedEisensteinConstant p)
    (hp : ∀ n : ℕ+, F.coeff (n : ℕ)=algebraMap M Q (positiveEisensteinMeasure p n)) :
    F=totalEisensteinSeries p := sorry

lemma eisensteinAwaySeries_toFraction (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    (eisensteinAwaySeries p a).map (eisensteinAwayToFraction p a ha)=totalEisensteinSeries p := sorry

lemma eisensteinAwaySeries_specialize (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ) :
    (eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha k) =
      PowerSeries.C (eisensteinAwayMoment p a ha k (eisensteinAwayConstant p a))+
        (positiveEisensteinSeries p (j^k)).map (algebraMap Z ℚ_[p]) := sorry

theorem eisensteinSeries_common (a : U) (ha : (a : Z)=(p+1 : ℕ))
    (k : ℕ) (hk : 4≤k) (he : Even k) :
    ∃! F : PowerSeries ℚ,
      F.map (algebraMap ℚ ℂ)=UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein p k hk) ∧
      F.map (algebraMap ℚ ℚ_[p])=
        (eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha (k-1)) := sorry

lemma eisensteinAwaySeries_coeff_mul_p (a : U) (n : ℕ) :
    (eisensteinAwaySeries p a).coeff (p*n)=(eisensteinAwaySeries p a).coeff n := sorry

end DirichletPadic

namespace SuggestedFullEisensteinTests
open scoped AbstractMeasure PowerSeries.WithPiTopology

open AbstractMeasure DirichletPadic

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => Zˣ

local notation "M" => D(U,Z)

local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))

local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)

local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }

local notation "Q" => FractionRing M

local notation "S" => (fun a : U => Localization.Away (2*eisensteinTwistedDenominator p a))

-- SuggestedFullEisensteinTests.integral_coefficient_evaluator
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ) (μ : M) :
    eisensteinAwayMoment p a ha k (algebraMap M (S a) μ)=(μ (j^k) : ℚ_[p]) := sorry

-- SuggestedFullEisensteinTests.away_constant_coefficient
example (a : U) : (eisensteinAwaySeries p a).coeff 0=eisensteinAwayConstant p a := sorry

-- SuggestedFullEisensteinTests.away_first_coefficient
example (a : U) : (eisensteinAwaySeries p a).coeff 1=1 := sorry

-- SuggestedFullEisensteinTests.away_positive_coefficient
example (a : U) (n : ℕ+) : (eisensteinAwaySeries p a).coeff (n : ℕ)=
    algebraMap M (S a) (positiveEisensteinMeasure p n) := sorry

-- SuggestedFullEisensteinTests.coefficient_zero_formula
example (a : U) : (eisensteinAwaySeries p a).coeff 0=eisensteinAwayConstant p a := sorry

-- SuggestedFullEisensteinTests.total_constant_coefficient
example : (totalEisensteinSeries p).coeff 0=localizedEisensteinConstant p := sorry

-- SuggestedFullEisensteinTests.total_first_coefficient
example : (totalEisensteinSeries p).coeff 1=1 := sorry

-- SuggestedFullEisensteinTests.total_unique_coefficients
example (F : PowerSeries Q) (h0 : F.coeff 0=localizedEisensteinConstant p)
    (hp : ∀ n : ℕ+, F.coeff (n : ℕ)=algebraMap M Q (positiveEisensteinMeasure p n)) :
    F=totalEisensteinSeries p := sorry

-- SuggestedFullEisensteinTests.image_is_full_total_series
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    (eisensteinAwaySeries p a).map (eisensteinAwayToFraction p a ha)=totalEisensteinSeries p := sorry

-- SuggestedFullEisensteinTests.specialization_retains_constant
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    ((eisensteinAwaySeries 2 a).map (eisensteinAwayMoment 2 a ha 3)).coeff 0=(-7/240 : ℚ_[2]) := sorry

-- SuggestedFullEisensteinTests.specialization_prime_coefficient_survives
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    ((eisensteinAwaySeries 2 a).map (eisensteinAwayMoment 2 a ha 3)).coeff 2=1 := sorry

-- SuggestedFullEisensteinTests.specialization_dyadic_sixth_coefficient
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    ((eisensteinAwaySeries 2 a).map (eisensteinAwayMoment 2 a ha 3)).coeff 6=28 := sorry

-- SuggestedFullEisensteinTests.common_whole_dyadic_series
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    ∃! F : PowerSeries ℚ,
      F.map (algebraMap ℚ ℂ)=UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein 2 4 (by decide)) ∧
      F.map (algebraMap ℚ ℚ_[2])=
        (eisensteinAwaySeries 2 a).map (eisensteinAwayMoment 2 a ha 3) := sorry

-- SuggestedFullEisensteinTests.common_whole_ternary_series
example (a : (ℤ_[3])ˣ) (ha : (a : ℤ_[3])=4) :
    ∃! F : PowerSeries ℚ,
      F.map (algebraMap ℚ ℂ)=UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein 3 4 (by decide)) ∧
      F.map (algebraMap ℚ ℚ_[3])=
        (eisensteinAwaySeries 3 a).map (eisensteinAwayMoment 3 a ha 3) := sorry

-- SuggestedFullEisensteinTests.index_invariance_includes_zero
example (a : U) : (eisensteinAwaySeries p a).coeff (p*0)=(eisensteinAwaySeries p a).coeff 0 := sorry

-- SuggestedFullEisensteinTests.prime_power_coefficient_survives
example (a : U) (r : ℕ) : (eisensteinAwaySeries p a).coeff (p^r)=1 := sorry

end SuggestedFullEisensteinTests

namespace DirichletPadic
open scoped AbstractMeasure PowerSeries.WithPiTopology

open AbstractMeasure

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => Zˣ

local notation "M" => D(U,Z)

local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))

local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)

local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }

local notation "Q" => FractionRing M

local notation "Δ" => (fun a : U => 2*eisensteinTwistedDenominator p a)

local notation "S" => (fun a : U => Localization.Away (Δ a))

def clearedEisensteinSeries (a : U) : PowerSeries M := sorry

lemma clearedEisensteinSeries_coeff (a : U) (n : ℕ) :
    (clearedEisensteinSeries p a).coeff n = if hn : 0<n then
      Δ a * positiveEisensteinMeasure p ⟨n,hn⟩ else eisensteinWeightedNumerator p a := sorry

lemma clearedEisensteinSeries_coeff_zero (a : U) :
    (clearedEisensteinSeries p a).coeff 0=eisensteinWeightedNumerator p a := sorry

lemma clearedEisensteinSeries_coeff_pos (a : U) (n : ℕ+) :
    (clearedEisensteinSeries p a).coeff (n : ℕ)=Δ a * positiveEisensteinMeasure p n := sorry

lemma clearedEisensteinSeries_unique_coefficients (a : U) (F : PowerSeries M)
    (h0 : F.coeff 0=eisensteinWeightedNumerator p a)
    (hp : ∀ n : ℕ+, F.coeff (n : ℕ)=Δ a * positiveEisensteinMeasure p n) :
    F=clearedEisensteinSeries p a := sorry

lemma clearedEisensteinSeries_toAway (a : U) :
    (clearedEisensteinSeries p a).map (algebraMap M (S a)) =
      PowerSeries.C (algebraMap M (S a) (Δ a))*eisensteinAwaySeries p a := sorry

lemma clearedEisensteinSeries_toFraction (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    (clearedEisensteinSeries p a).map (algebraMap M Q) =
      PowerSeries.C (algebraMap M Q (Δ a))*totalEisensteinSeries p := sorry

lemma clearedEisensteinSeries_unique (a : U) (ha : (a : Z)=(p+1 : ℕ))
    (F : PowerSeries M)
    (hF : F.map (algebraMap M Q)=
      PowerSeries.C (algebraMap M Q (Δ a))*totalEisensteinSeries p) :
    F=clearedEisensteinSeries p a := sorry

def integralClearedEisensteinMoment (a : U) (k : ℕ) : PowerSeries Z := sorry

lemma integralClearedEisensteinMoment_def (a : U) (k : ℕ) :
    integralClearedEisensteinMoment p a k = (clearedEisensteinSeries p a).map
      (characterIntegralAlgHom
        (primePowerArithmeticCharacter p 0 (1 : DirichletCharacter Z (p^0)) k)).toRingHom := sorry

lemma integralClearedEisensteinMoment_coeff (a : U) (k n : ℕ) :
    (integralClearedEisensteinMoment p a k).coeff n =
      (clearedEisensteinSeries p a).coeff n (j^k) := sorry

lemma integralClearedEisensteinMoment_coeff_zero (a : U) (k : ℕ) :
    (integralClearedEisensteinMoment p a k).coeff 0 = eisensteinWeightedNumerator p a (j^k) := sorry

lemma integralClearedEisensteinMoment_coeff_pos (a : U) (k : ℕ) (n : ℕ+) :
    (integralClearedEisensteinMoment p a k).coeff (n : ℕ) =
      2*((a : Z)^(k+1)-1)*positiveEisensteinMeasure p n (j^k) := sorry

lemma integralClearedEisensteinMoment_unique (a : U) (k : ℕ) (F : PowerSeries Z)
    (hF : ∀ n : ℕ, F.coeff n=(clearedEisensteinSeries p a).coeff n (j^k)) :
    F=integralClearedEisensteinMoment p a k := sorry

theorem integralClearedEisensteinMoment_specialize (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ) :
    (integralClearedEisensteinMoment p a k).map (algebraMap Z ℚ_[p]) =
      PowerSeries.C (2*((a : ℚ_[p])^(k+1)-1))*
        (eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha k) := sorry

end DirichletPadic

namespace SuggestedEisensteinClearingTests
open scoped AbstractMeasure PowerSeries.WithPiTopology

open AbstractMeasure DirichletPadic

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => Zˣ

local notation "M" => D(U,Z)

local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))

local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)

local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }

local notation "Q" => FractionRing M

local notation "Δ" => (fun a : U => 2*eisensteinTwistedDenominator p a)

local notation "S" => (fun a : U => Localization.Away (Δ a))

-- SuggestedEisensteinClearingTests.away_constant_clearing_all_parameters
example (a : U) : algebraMap M (S a) (Δ a)*eisensteinAwayConstant p a =
    algebraMap M (S a) (eisensteinWeightedNumerator p a) := sorry

-- SuggestedEisensteinClearingTests.integral_cleared_constant
example (a : U) : (clearedEisensteinSeries p a).coeff 0=eisensteinWeightedNumerator p a := sorry

-- SuggestedEisensteinClearingTests.integral_cleared_first
example (a : U) : (clearedEisensteinSeries p a).coeff 1=Δ a := sorry

-- SuggestedEisensteinClearingTests.identity_parameter_zero_series
example : clearedEisensteinSeries p 1=0 := sorry

-- SuggestedEisensteinClearingTests.cleared_all_index_formula
example (a : U) (n : ℕ+) : (clearedEisensteinSeries p a).coeff (n : ℕ)=
    Δ a * positiveEisensteinMeasure p n := sorry

-- SuggestedEisensteinClearingTests.whole_away_clearing
example (a : U) : (clearedEisensteinSeries p a).map (algebraMap M (S a)) =
    PowerSeries.C (algebraMap M (S a) (Δ a))*eisensteinAwaySeries p a := sorry

-- SuggestedEisensteinClearingTests.whole_total_quotient_clearing
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    (clearedEisensteinSeries p a).map (algebraMap M Q) =
      PowerSeries.C (algebraMap M Q (Δ a))*totalEisensteinSeries p := sorry

-- SuggestedEisensteinClearingTests.integral_lift_unique
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) (F : PowerSeries M)
    (hF : F.map (algebraMap M Q)=
      PowerSeries.C (algebraMap M Q (Δ a))*totalEisensteinSeries p) :
    F=clearedEisensteinSeries p a := sorry

-- SuggestedEisensteinClearingTests.integral_moment_zero_exponent
example (a : U) : (integralClearedEisensteinMoment p a 0).coeff 1=2*((a : Z)-1) := sorry

-- SuggestedEisensteinClearingTests.integral_moment_dyadic_constant
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    3*(integralClearedEisensteinMoment 2 a 3).coeff 0=(-14 : ℤ_[2]) := sorry

-- SuggestedEisensteinClearingTests.integral_moment_dyadic_first
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    (integralClearedEisensteinMoment 2 a 3).coeff 1=160 := sorry

-- SuggestedEisensteinClearingTests.integral_moment_retains_double
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    (integralClearedEisensteinMoment 2 a 3).coeff 1≠80 := sorry

-- SuggestedEisensteinClearingTests.integral_moment_every_coefficient
example (a : U) (k n : ℕ) : (integralClearedEisensteinMoment p a k).coeff n =
    (clearedEisensteinSeries p a).coeff n (j^k) := sorry

-- SuggestedEisensteinClearingTests.field_specialization_dyadic_four
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    (integralClearedEisensteinMoment 2 a 3).map (algebraMap ℤ_[2] ℚ_[2]) =
      PowerSeries.C 160*(eisensteinAwaySeries 2 a).map (eisensteinAwayMoment 2 a ha 3) := sorry

-- SuggestedEisensteinClearingTests.field_specialization_zero_exponent
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    (integralClearedEisensteinMoment p a 0).map (algebraMap Z ℚ_[p]) =
      PowerSeries.C (2*(p : ℚ_[p]))*
        (eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha 0) := sorry

-- SuggestedEisensteinClearingTests.field_specialization_prime_index_survives
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    (integralClearedEisensteinMoment 2 a 3).coeff 2=160 := sorry

end SuggestedEisensteinClearingTests

namespace DirichletPadic
open scoped AbstractMeasure PowerSeries.WithPiTopology

open AbstractMeasure

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => Zˣ

local notation "M" => D(U,Z)

local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))

local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)

local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }

lemma clearedEisensteinCoefficient_test_congr (a : U) (n r : ℕ) (f g : C(U,Z))
    (hfg : ∀ u, (p : Z)^r ∣ f u-g u) :
    (p : Z)^r ∣ (clearedEisensteinSeries p a).coeff n f-
      (clearedEisensteinSeries p a).coeff n g := sorry

def clearedEisensteinEvaluation (a : U) : AbstractMeasure U Z (PowerSeries Z) := sorry

lemma clearedEisensteinEvaluation_coeff (a : U) (f : C(U,Z)) (n : ℕ) :
    (clearedEisensteinEvaluation p a f).coeff n=(clearedEisensteinSeries p a).coeff n f := sorry

lemma clearedEisensteinEvaluation_zero (a : U) : clearedEisensteinEvaluation p a 0=0 := sorry

lemma clearedEisensteinEvaluation_add (a : U) (f g : C(U,Z)) :
    clearedEisensteinEvaluation p a (f+g)=
      clearedEisensteinEvaluation p a f+clearedEisensteinEvaluation p a g := sorry

lemma clearedEisensteinEvaluation_smul (a : U) (c : Z) (f : C(U,Z)) :
    clearedEisensteinEvaluation p a (c • f)=c • clearedEisensteinEvaluation p a f := sorry

lemma clearedEisensteinEvaluation_continuous (a : U) :
    Continuous (clearedEisensteinEvaluation p a) := sorry

lemma clearedEisensteinEvaluation_unique (a : U) (F : AbstractMeasure U Z (PowerSeries Z))
    (hF : ∀ f n, (F f).coeff n=(clearedEisensteinSeries p a).coeff n f) :
    F=clearedEisensteinEvaluation p a := sorry

lemma clearedEisensteinEvaluation_moment (a : U) (k : ℕ) :
    clearedEisensteinEvaluation p a (j^k)=integralClearedEisensteinMoment p a k := sorry

lemma clearedEisensteinEvaluation_test_congr (a : U) (r : ℕ) (f g : C(U,Z))
    (hfg : ∀ u, (p : Z)^r ∣ f u-g u) :
    PowerSeries.C ((p : Z)^r) ∣ clearedEisensteinEvaluation p a f-clearedEisensteinEvaluation p a g := sorry

theorem integralClearedEisensteinMoment_weight_congr (a : U) (r e e' : ℕ) (hr : 0<r)
    (he : Nat.ModEq (p^(r-1)*(p-1)) e e') :
    PowerSeries.C ((p : Z)^r) ∣
      integralClearedEisensteinMoment p a e'-integralClearedEisensteinMoment p a e := sorry

theorem eisensteinAwaySeries_cleared_weight_congr (a : U) (ha : (a : Z)=(p+1 : ℕ))
    (r e e' : ℕ) (hr : 0<r) (he : Nat.ModEq (p^(r-1)*(p-1)) e e') (n : ℕ) :
    ‖2*((a : ℚ_[p])^(e'+1)-1)*
        ((eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha e')).coeff n-
      2*((a : ℚ_[p])^(e+1)-1)*
        ((eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha e)).coeff n‖ ≤
      (p : ℝ)^(-(r : ℤ)) := sorry

end DirichletPadic

namespace SuggestedEisensteinCongruenceTests
open scoped AbstractMeasure PowerSeries.WithPiTopology

open AbstractMeasure DirichletPadic

local instance : Fact (Nat.Prime 5) := ⟨by decide⟩

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => Zˣ

local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))

-- SuggestedEisensteinCongruenceTests.integral_constant_test_congruence
example (a : U) (r : ℕ) (f g : C(U,Z)) (hfg : ∀ u, (p : Z)^r ∣ f u-g u) :
    (p : Z)^r ∣ (clearedEisensteinSeries p a).coeff 0 f-
      (clearedEisensteinSeries p a).coeff 0 g := sorry

-- SuggestedEisensteinCongruenceTests.cleared_evaluation_zero
example (a : U) : clearedEisensteinEvaluation p a 0=0 := sorry

-- SuggestedEisensteinCongruenceTests.cleared_evaluation_constant
example (a : U) (f : C(U,Z)) :
    (clearedEisensteinEvaluation p a f).coeff 0=eisensteinWeightedNumerator p a f := sorry

-- SuggestedEisensteinCongruenceTests.cleared_evaluation_first
example (a : U) (f : C(U,Z)) :
    (clearedEisensteinEvaluation p a f).coeff 1=2*((a : Z)*f a-f 1) := sorry

-- SuggestedEisensteinCongruenceTests.cleared_evaluation_dyadic_cubic
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    (clearedEisensteinEvaluation 2 a
      ((ContinuousMap.mk Units.val Units.continuous_val : C((ℤ_[2])ˣ,ℤ_[2]))^3)).coeff 1=160 := sorry

-- SuggestedEisensteinCongruenceTests.full_coefficient_evaluation
example (a : U) (f : C(U,Z)) (n : ℕ) :
    (clearedEisensteinEvaluation p a f).coeff n=(clearedEisensteinSeries p a).coeff n f := sorry

-- SuggestedEisensteinCongruenceTests.moment_evaluation_comparison
example (a : U) (e : ℕ) :
    clearedEisensteinEvaluation p a (j^e)=integralClearedEisensteinMoment p a e := sorry

-- SuggestedEisensteinCongruenceTests.precision_zero_allowed
example (a : U) (f g : C(U,Z)) :
    PowerSeries.C (1 : Z) ∣ clearedEisensteinEvaluation p a f-clearedEisensteinEvaluation p a g := sorry

-- SuggestedEisensteinCongruenceTests.uniform_eight_test_precision
example (a : (ℤ_[2])ˣ) (f g : C((ℤ_[2])ˣ,ℤ_[2])) (h : ∀ u, (8 : ℤ_[2]) ∣ f u-g u) :
    PowerSeries.C (8 : ℤ_[2]) ∣ clearedEisensteinEvaluation 2 a f-clearedEisensteinEvaluation 2 a g := sorry

-- SuggestedEisensteinCongruenceTests.dyadic_full_weight_precision
example (a : (ℤ_[2])ˣ) : PowerSeries.C (8 : ℤ_[2]) ∣
    integralClearedEisensteinMoment 2 a 7-integralClearedEisensteinMoment 2 a 3 := sorry

-- SuggestedEisensteinCongruenceTests.quinary_full_weight_precision
example (a : (ℤ_[5])ˣ) : PowerSeries.C (25 : ℤ_[5]) ∣
    integralClearedEisensteinMoment 5 a 23-integralClearedEisensteinMoment 5 a 3 := sorry

-- SuggestedEisensteinCongruenceTests.tame_component_not_full_precision
example (a : (ℤ_[5])ˣ) (ha : (a : ℤ_[5])=6) :
    ¬ PowerSeries.C (25 : ℤ_[5]) ∣
      integralClearedEisensteinMoment 5 a 7-integralClearedEisensteinMoment 5 a 3 := sorry

-- SuggestedEisensteinCongruenceTests.cleared_constant_dyadic_precision
example : ‖(-10400/3 : ℚ_[2])‖ ≤ (1/8 : ℝ) := sorry

-- SuggestedEisensteinCongruenceTests.uncleared_constant_precision_loss
example : ‖(-113/480 : ℚ_[2])‖=32 := sorry

end SuggestedEisensteinCongruenceTests

namespace DirichletPadic
open scoped AbstractMeasure PowerSeries.WithPiTopology

open AbstractMeasure

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => Zˣ

local notation "D" => (fun (a : U) (e : ℕ) => 2*((a : ℚ_[p])^(e+1)-1))

lemma eisensteinAwaySeries_coeff_eq_integral_div (a : U) (ha : (a : Z)=(p+1 : ℕ)) (e n : ℕ) :
    ((eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha e)).coeff n =
      ((integralClearedEisensteinMoment p a e).coeff n : ℚ_[p])/D a e := sorry

lemma eisensteinDenominator_weight_congr (a : U) (r e e' : ℕ) (hr : 0<r)
    (he : Nat.ModEq (p^(r-1)*(p-1)) e e') :
    ‖D a e'-D a e‖≤(p : ℝ)^(-(r : ℤ)) := sorry

lemma eisensteinAwaySeries_coeff_norm_le (a : U) (ha : (a : Z)=(p+1 : ℕ)) (e n : ℕ) :
    ‖((eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha e)).coeff n‖≤
      1/‖D a e‖ := sorry

theorem eisensteinAwaySeries_weight_precision (a : U) (ha : (a : Z)=(p+1 : ℕ))
    (r e e' : ℕ) (hr : 0<r) (he : Nat.ModEq (p^(r-1)*(p-1)) e e') (n : ℕ) :
    ‖((eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha e')).coeff n-
      ((eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha e)).coeff n‖ ≤
      (p : ℝ)^(-(r : ℤ))/(‖D a e‖*‖D a e'‖) := sorry

lemma eisensteinDenominator_norm_eq (a : U) (r e e' : ℕ) (hr : 0<r)
    (he : Nat.ModEq (p^(r-1)*(p-1)) e e')
    (hsmall : (p : ℝ)^(-(r : ℤ))<‖D a e‖) : ‖D a e'‖=‖D a e‖ := sorry

theorem eisensteinAwaySeries_local_weight_precision (a : U) (ha : (a : Z)=(p+1 : ℕ))
    (r e e' : ℕ) (hr : 0<r) (he : Nat.ModEq (p^(r-1)*(p-1)) e e')
    (hsmall : (p : ℝ)^(-(r : ℤ))<‖D a e‖) (n : ℕ) :
    ‖((eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha e')).coeff n-
      ((eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha e)).coeff n‖ ≤
      (p : ℝ)^(-(r : ℤ))/‖D a e‖^2 := sorry

theorem rationalEisensteinSeries_weight_precision (a : U) (ha : (a : Z)=(p+1 : ℕ))
    (r w w' : ℕ) (hr : 0<r) (hw : 4≤w) (hw' : 4≤w') (hew : Even w) (hew' : Even w')
    (he : Nat.ModEq (p^(r-1)*(p-1)) (w-1) (w'-1))
    (F G : PowerSeries ℚ)
    (hF : F.map (algebraMap ℚ ℂ)=UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein p w hw))
    (hG : G.map (algebraMap ℚ ℂ)=UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein p w' hw'))
    (n : ℕ) :
    ‖algebraMap ℚ ℚ_[p] (G.coeff n-F.coeff n)‖ ≤
      (p : ℝ)^(-(r : ℤ))/(‖2*((a : ℚ_[p])^w-1)‖*‖2*((a : ℚ_[p])^w'-1)‖) := sorry

end DirichletPadic

namespace SuggestedEisensteinPrecisionTests
open scoped PowerSeries.WithPiTopology

open DirichletPadic

-- SuggestedEisensteinPrecisionTests.full_coefficient_quotient
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) (n : ℕ) :
    ((eisensteinAwaySeries 2 a).map (eisensteinAwayMoment 2 a ha 3)).coeff n =
      ((integralClearedEisensteinMoment 2 a 3).coeff n : ℚ_[2])/160 := sorry

-- SuggestedEisensteinPrecisionTests.denominator_dyadic_variation
example : ‖(13120-160 : ℚ_[2])‖≤(1/8 : ℝ) := sorry

-- SuggestedEisensteinPrecisionTests.uniform_dyadic_bound
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) (n : ℕ) :
    ‖((eisensteinAwaySeries 2 a).map (eisensteinAwayMoment 2 a ha 3)).coeff n‖≤32 := sorry

-- SuggestedEisensteinPrecisionTests.dyadic_quotient_precision
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) (n : ℕ) :
    ‖((eisensteinAwaySeries 2 a).map (eisensteinAwayMoment 2 a ha 7)).coeff n-
      ((eisensteinAwaySeries 2 a).map (eisensteinAwayMoment 2 a ha 3)).coeff n‖≤256 := sorry

-- SuggestedEisensteinPrecisionTests.distinct_denominator_norms
example : ‖(160 : ℚ_[2])‖=1/32 ∧ ‖(13120 : ℚ_[2])‖=1/64 := sorry

-- SuggestedEisensteinPrecisionTests.stable_ternary_denominator
example : ‖(2*(4^10-1) : ℚ_[3])‖=‖(2*(4^4-1) : ℚ_[3])‖ := sorry

-- SuggestedEisensteinPrecisionTests.strict_neighborhood_required
example : ‖(126 : ℚ_[3])‖≠‖(6 : ℚ_[3])‖ := sorry

-- SuggestedEisensteinPrecisionTests.local_ternary_precision
example (a : (ℤ_[3])ˣ) (ha : (a : ℤ_[3])=4) (n : ℕ) :
    ‖((eisensteinAwaySeries 3 a).map (eisensteinAwayMoment 3 a ha 57)).coeff n-
      ((eisensteinAwaySeries 3 a).map (eisensteinAwayMoment 3 a ha 3)).coeff n‖≤(1/9 : ℝ) := sorry

-- SuggestedEisensteinPrecisionTests.classical_rational_precision
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) (F G : PowerSeries ℚ)
    (hF : F.map (algebraMap ℚ ℂ)=UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein 2 4 (by decide)))
    (hG : G.map (algebraMap ℚ ℂ)=UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein 2 8 (by decide)))
    (n : ℕ) : ‖algebraMap ℚ ℚ_[2] (G.coeff n-F.coeff n)‖≤256 := sorry

end SuggestedEisensteinPrecisionTests

namespace DirichletPadic
open scoped AbstractMeasure PowerSeries.WithPiTopology

open AbstractMeasure

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

local notation "Δ" => (fun u : U => 2*eisensteinTwistedDenominator p u)

local notation "S" => (fun u : U => Localization.Away (Δ u))

lemma eisensteinWeightedNumerator_cross (u v : U) :
    eisensteinTwistedDenominator p v*eisensteinWeightedNumerator p u =
      eisensteinTwistedDenominator p u*eisensteinWeightedNumerator p v := sorry

lemma localizedEisensteinConstant_clearing_all (u : U) :
    algebraMap M Q (Δ u)*localizedEisensteinConstant p =
      algebraMap M Q (eisensteinWeightedNumerator p u) := sorry

lemma localizedEisensteinConstant_regular_fraction (u : U) (hu : Δ u ∈ nonZeroDivisors M) :
    IsLocalization.mk' Q (eisensteinWeightedNumerator p u) ⟨Δ u,hu⟩ =
      localizedEisensteinConstant p := sorry

lemma clearedEisensteinSeries_toFraction_all (u : U) :
    (clearedEisensteinSeries p u).map (algebraMap M Q) =
      PowerSeries.C (algebraMap M Q (Δ u))*totalEisensteinSeries p := sorry

def regularEisensteinAwayToFraction (u : U) (hu : Δ u ∈ nonZeroDivisors M) : S u →+* Q := sorry

lemma regularEisensteinAwayToFraction_def (u : U) (hu : Δ u ∈ nonZeroDivisors M) :
    regularEisensteinAwayToFraction p u hu = IsLocalization.Away.lift (Δ u)
      (IsLocalization.map_units Q (⟨Δ u,hu⟩ : nonZeroDivisors M)) := sorry

lemma regularEisensteinAwayToFraction_algebraMap (u : U) (hu : Δ u ∈ nonZeroDivisors M) (μ : M) :
    regularEisensteinAwayToFraction p u hu (algebraMap M (S u) μ)=algebraMap M Q μ := sorry

lemma regularEisensteinAwayToFraction_injective (u : U) (hu : Δ u ∈ nonZeroDivisors M) :
    Function.Injective (regularEisensteinAwayToFraction p u hu) := sorry

lemma regularEisensteinAwayToFraction_canonical (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    regularEisensteinAwayToFraction p a (eisensteinTwistedDenominator_double_regular p a ha)=
      eisensteinAwayToFraction p a ha := sorry

lemma regularEisensteinAwayToFraction_constant (u : U) (hu : Δ u ∈ nonZeroDivisors M) :
    regularEisensteinAwayToFraction p u hu (eisensteinAwayConstant p u)=localizedEisensteinConstant p := sorry

lemma regularEisensteinAwaySeries_toFraction (u : U) (hu : Δ u ∈ nonZeroDivisors M) :
    (eisensteinAwaySeries p u).map (regularEisensteinAwayToFraction p u hu)=totalEisensteinSeries p := sorry

end DirichletPadic

namespace SuggestedEisensteinParameterTests
open scoped AbstractMeasure PowerSeries.WithPiTopology

open AbstractMeasure DirichletPadic

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

local notation "Δ" => (fun u : U => 2*eisensteinTwistedDenominator p u)

local notation "S" => (fun u : U => Localization.Away (Δ u))

-- SuggestedEisensteinParameterTests.shifted_cross_orientation
example (u v : U) :
    eisensteinTwistedDenominator p v*eisensteinWeightedNumerator p u =
      eisensteinTwistedDenominator p u*eisensteinWeightedNumerator p v := sorry

-- SuggestedEisensteinParameterTests.all_parameter_identity_clearing
example : algebraMap M Q (Δ 1)*localizedEisensteinConstant p=0 := sorry

-- SuggestedEisensteinParameterTests.torsion_parameter_annihilates_constant
example : algebraMap M Q (Δ (-1))*localizedEisensteinConstant p=0 := sorry

-- SuggestedEisensteinParameterTests.canonical_fraction_comparison
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    IsLocalization.mk' Q (eisensteinWeightedNumerator p a)
      ⟨Δ a,eisensteinTwistedDenominator_double_regular p a ha⟩=localizedEisensteinConstant p := sorry

-- SuggestedEisensteinParameterTests.all_parameter_full_clearing
example (u : U) : (clearedEisensteinSeries p u).map (algebraMap M Q) =
    PowerSeries.C (algebraMap M Q (Δ u))*totalEisensteinSeries p := sorry

-- SuggestedEisensteinParameterTests.regular_map_integral_coefficients
example (u : U) (hu : Δ u ∈ nonZeroDivisors M) (μ : M) :
    regularEisensteinAwayToFraction p u hu (algebraMap M (S u) μ)=algebraMap M Q μ := sorry

-- SuggestedEisensteinParameterTests.regular_map_preserves_one
example (u : U) (hu : Δ u ∈ nonZeroDivisors M) : regularEisensteinAwayToFraction p u hu 1=1 := sorry

-- SuggestedEisensteinParameterTests.regular_map_canonical_compatibility
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    regularEisensteinAwayToFraction p a (eisensteinTwistedDenominator_double_regular p a ha)=
      eisensteinAwayToFraction p a ha := sorry

-- SuggestedEisensteinParameterTests.regular_constant_image
example (u : U) (hu : Δ u ∈ nonZeroDivisors M) :
    regularEisensteinAwayToFraction p u hu (eisensteinAwayConstant p u)=localizedEisensteinConstant p := sorry

-- SuggestedEisensteinParameterTests.regular_full_family_image
example (u : U) (hu : Δ u ∈ nonZeroDivisors M) :
    (eisensteinAwaySeries p u).map (regularEisensteinAwayToFraction p u hu)=totalEisensteinSeries p := sorry

end SuggestedEisensteinParameterTests

namespace DirichletPadic
open scoped AbstractMeasure

open AbstractMeasure

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => Zˣ

local notation "M" => D(U,Z)

local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))

local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)

local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }

local notation "d" => (fun u : U => 2*eisensteinTwistedDenominator p u)

local notation "S" => (fun u : U => Localization.Away (d u))

lemma eisensteinMomentHom_denominator (u : U) (e : ℕ) :
    eisensteinMomentHom p e (d u)=2*((u : ℚ_[p])^(e+1)-1) := sorry

def admissibleEisensteinAwayMoment (u : U) (e : ℕ)
    (h : 2*((u : ℚ_[p])^(e+1)-1)≠0) : S u →+* ℚ_[p] := sorry

lemma admissibleEisensteinAwayMoment_def (u : U) (e : ℕ)
    (h : 2*((u : ℚ_[p])^(e+1)-1)≠0) :
    admissibleEisensteinAwayMoment p u e h = IsLocalization.Away.lift (d u)
      (isUnit_iff_ne_zero.mpr (by rw [eisensteinMomentHom_denominator]; exact h)) := sorry

lemma admissibleEisensteinAwayMoment_algebraMap (u : U) (e : ℕ)
    (h : 2*((u : ℚ_[p])^(e+1)-1)≠0) (μ : M) :
    admissibleEisensteinAwayMoment p u e h (algebraMap M (S u) μ)=(μ (j^e) : ℚ_[p]) := sorry

lemma admissibleEisensteinAwayMoment_unique (u : U) (e : ℕ)
    (h : 2*((u : ℚ_[p])^(e+1)-1)≠0) (F : S u →+* ℚ_[p])
    (hF : ∀ μ : M, F (algebraMap M (S u) μ)=eisensteinMomentHom p e μ) :
    F=admissibleEisensteinAwayMoment p u e h := sorry

lemma admissibleEisensteinAwayMoment_canonical (a : U) (ha : (a : Z)=(p+1 : ℕ))
    (e : ℕ) (h : 2*((a : ℚ_[p])^(e+1)-1)≠0) :
    admissibleEisensteinAwayMoment p a e h=eisensteinAwayMoment p a ha e := sorry

lemma admissibleEisensteinAwayMoment_constant (u : U) (e : ℕ)
    (h : 2*((u : ℚ_[p])^(e+1)-1)≠0) :
    admissibleEisensteinAwayMoment p u e h (eisensteinAwayConstant p u)=
      algebraMap ℚ ℚ_[p] (-(1-(p : ℚ)^e)*bernoulli (e+1)/(2*(e+1))) := sorry

lemma admissibleEisensteinSeries_canonical (u : U) (e : ℕ)
    (h : 2*((u : ℚ_[p])^(e+1)-1)≠0) (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    (eisensteinAwaySeries p u).map (admissibleEisensteinAwayMoment p u e h)=
      (eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha e) := sorry

lemma admissibleEisensteinSeries_independent (u v : U) (e : ℕ)
    (hu : 2*((u : ℚ_[p])^(e+1)-1)≠0) (hv : 2*((v : ℚ_[p])^(e+1)-1)≠0) :
    (eisensteinAwaySeries p u).map (admissibleEisensteinAwayMoment p u e hu)=
      (eisensteinAwaySeries p v).map (admissibleEisensteinAwayMoment p v e hv) := sorry

theorem admissibleEisensteinSeries_common (u : U) (w : ℕ) (hw : 4≤w) (he : Even w)
    (h : 2*((u : ℚ_[p])^((w-1)+1)-1)≠0) :
    ∃! F : PowerSeries ℚ,
      F.map (algebraMap ℚ ℂ)=UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein p w hw) ∧
      F.map (algebraMap ℚ ℚ_[p])=
        (eisensteinAwaySeries p u).map (admissibleEisensteinAwayMoment p u (w-1) h) := sorry

end DirichletPadic

namespace SuggestedAdmissibleEisensteinTests
open scoped AbstractMeasure

open AbstractMeasure DirichletPadic

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => Zˣ

local notation "M" => D(U,Z)

local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))

local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)

local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }

local notation "d" => (fun u : U => 2*eisensteinTwistedDenominator p u)

local notation "S" => (fun u : U => Localization.Away (d u))

-- SuggestedAdmissibleEisensteinTests.identity_is_never_admissible
example (e : ℕ) : eisensteinMomentHom p e (d 1)=0 := sorry

-- SuggestedAdmissibleEisensteinTests.negative_parameter_even_exponent
example (e : ℕ) (he : Even e) : eisensteinMomentHom p e (d (-1))= -4 := sorry

-- SuggestedAdmissibleEisensteinTests.negative_parameter_odd_exponent
example (e : ℕ) (he : Odd e) : eisensteinMomentHom p e (d (-1))=0 := sorry

-- SuggestedAdmissibleEisensteinTests.noncanonical_ternary_denominator
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3])=2) :
    eisensteinMomentHom 3 1 (2*eisensteinTwistedDenominator 3 u)=6 := sorry

-- SuggestedAdmissibleEisensteinTests.admissible_evaluator_one
example (u : U) (e : ℕ) (h : 2*((u : ℚ_[p])^(e+1)-1)≠0) :
    admissibleEisensteinAwayMoment p u e h 1=1 := sorry

-- SuggestedAdmissibleEisensteinTests.admissible_evaluator_integral_agreement
example (u : U) (e : ℕ) (h : 2*((u : ℚ_[p])^(e+1)-1)≠0) (μ : M) :
    admissibleEisensteinAwayMoment p u e h (algebraMap M (S u) μ)=(μ (j^e) : ℚ_[p]) := sorry

-- SuggestedAdmissibleEisensteinTests.admissible_evaluator_unique_extension
example (u : U) (e : ℕ) (h : 2*((u : ℚ_[p])^(e+1)-1)≠0) (F : S u →+* ℚ_[p])
    (hF : ∀ μ : M, F (algebraMap M (S u) μ)=eisensteinMomentHom p e μ) :
    F=admissibleEisensteinAwayMoment p u e h := sorry

-- SuggestedAdmissibleEisensteinTests.admissible_evaluator_canonical
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) (e : ℕ)
    (h : 2*((a : ℚ_[p])^(e+1)-1)≠0) :
    admissibleEisensteinAwayMoment p a e h=eisensteinAwayMoment p a ha e := sorry

-- SuggestedAdmissibleEisensteinTests.admissible_integral_dirac
example (u v : U) (e : ℕ) (h : 2*((u : ℚ_[p])^(e+1)-1)≠0) :
    admissibleEisensteinAwayMoment p u e h (algebraMap M (S u) (dirac Z v))=(v : ℚ_[p])^e := sorry

-- SuggestedAdmissibleEisensteinTests.noncanonical_ternary_constant
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3])=2) (h : 2*((u : ℚ_[3])^2-1)≠0) :
    admissibleEisensteinAwayMoment 3 u 1 h (eisensteinAwayConstant 3 u)=1/12 := sorry

-- SuggestedAdmissibleEisensteinTests.noncanonical_dyadic_constant
example (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2])=5) (h : 2*((u : ℚ_[2])^4-1)≠0) :
    admissibleEisensteinAwayMoment 2 u 3 h (eisensteinAwayConstant 2 u)= -7/240 := sorry

-- SuggestedAdmissibleEisensteinTests.admissible_torsion_zero_constant
example (h : 2*(((-1 : U) : ℚ_[p])^3-1)≠0) :
    admissibleEisensteinAwayMoment p (-1) 2 h (eisensteinAwayConstant p (-1))=0 := sorry

-- SuggestedAdmissibleEisensteinTests.admissible_full_canonical_comparison
example (u : U) (e : ℕ) (h : 2*((u : ℚ_[p])^(e+1)-1)≠0)
    (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    (eisensteinAwaySeries p u).map (admissibleEisensteinAwayMoment p u e h)=
      (eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha e) := sorry

-- SuggestedAdmissibleEisensteinTests.admissible_full_parameter_independence
example (u v : U) (e : ℕ)
    (hu : 2*((u : ℚ_[p])^(e+1)-1)≠0) (hv : 2*((v : ℚ_[p])^(e+1)-1)≠0) :
    (eisensteinAwaySeries p u).map (admissibleEisensteinAwayMoment p u e hu)=
      (eisensteinAwaySeries p v).map (admissibleEisensteinAwayMoment p v e hv) := sorry

-- SuggestedAdmissibleEisensteinTests.noncanonical_common_dyadic_series
example (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2])=5) (h : 2*((u : ℚ_[2])^4-1)≠0) :
    ∃! F : PowerSeries ℚ,
      F.map (algebraMap ℚ ℂ)=UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein 2 4 (by decide)) ∧
      F.map (algebraMap ℚ ℚ_[2])=
        (eisensteinAwaySeries 2 u).map (admissibleEisensteinAwayMoment 2 u 3 h) := sorry

end SuggestedAdmissibleEisensteinTests

namespace DirichletPadic
open scoped AbstractMeasure

open AbstractMeasure

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => Zˣ

local notation "M" => D(U,Z)

local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))

local notation "t" => (ContinuousMap.mk (fun u : U => (u : ℚ_[p])) (by fun_prop) : C(U,ℚ_[p]))

local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)

local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }

local notation "Q" => FractionRing M

local notation "i" => algebraMap M Q

local notation "δ" => (diracHom (G := U) (R := Z))

lemma eisensteinAwayMoment_double_constant (a : U) (ha : (a : Z)=(p+1 : ℕ)) (e : ℕ) :
    2*eisensteinAwayMoment p a ha e (eisensteinAwayConstant p a)=
      positivePseudoMoment p (e+1) (by omega) (kubotaLeopoldtPseudomeasure p) := sorry

lemma localizedEisensteinConstant_clearing_candidate (g : U) (μ : M)
    (hμ : i μ=i (dirac Z g-1)*localizedEisensteinConstant p)
    (a : U) (ha : (a : Z)=(p+1 : ℕ)) (e : ℕ) :
    (μ (j^e) : ℚ_[p])=((g : ℚ_[p])^e-1)*
      eisensteinAwayMoment p a ha e (eisensteinAwayConstant p a) := sorry

lemma localizedEisensteinConstant_sign_candidate (μ : M)
    (hμ : i μ=i (dirac Z (-1 : U)-1)*localizedEisensteinConstant p)
    (k : ℕ) (hk : 0<k) :
    (μ (j^(2*k-1)) : ℚ_[p])=
      -positivePseudoMoment p (2*k) (by omega) (kubotaLeopoldtPseudomeasure p) := sorry

theorem localizedEisensteinConstant_sign_not_integral :
    i (dirac Z (-1 : U)-1)*localizedEisensteinConstant p ∉ Set.range i := sorry

theorem localizedEisensteinConstant_not_pseudomeasure :
    localizedEisensteinConstant p ∉ Iwasawa.pseudomeasures δ Q := sorry

theorem localizedEisensteinConstant_not_integral :
    localizedEisensteinConstant p ∉ Set.range i := sorry

theorem eisensteinAwayConstant_no_field_measure (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    ¬∃ μ : D(U,ℚ_[p]), ∀ e : ℕ,
      μ (t^e)=eisensteinAwayMoment p a ha e (eisensteinAwayConstant p a) := sorry

end DirichletPadic

namespace SuggestedEisensteinObstructionTests
open scoped AbstractMeasure

open AbstractMeasure DirichletPadic

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => Zˣ

local notation "M" => D(U,Z)

local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))

local notation "t" => (ContinuousMap.mk (fun u : U => (u : ℚ_[p])) (by fun_prop) : C(U,ℚ_[p]))

local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)

local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }

local notation "Q" => FractionRing M

local notation "i" => algebraMap M Q

local notation "δ" => (diracHom (G := U) (R := Z))

-- SuggestedEisensteinObstructionTests.double_constant_dyadic
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    2*eisensteinAwayMoment 2 a ha 3 (eisensteinAwayConstant 2 a)= -7/120 := sorry

-- SuggestedEisensteinObstructionTests.double_constant_ternary
example (a : (ℤ_[3])ˣ) (ha : (a : ℤ_[3])=4) :
    2*eisensteinAwayMoment 3 a ha 1 (eisensteinAwayConstant 3 a)=1/6 := sorry

-- SuggestedEisensteinObstructionTests.double_constant_zero_exponent
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    2*eisensteinAwayMoment p a ha 0 (eisensteinAwayConstant p a)=0 := sorry

-- SuggestedEisensteinObstructionTests.identity_clearing_candidate_moments
example (μ : M) (hμ : i μ=i (dirac Z (1 : U)-1)*localizedEisensteinConstant p) (e : ℕ) :
    (μ (j^e) : ℚ_[p])=0 := sorry

-- SuggestedEisensteinObstructionTests.arbitrary_clearing_candidate_moments
example (g : U) (μ : M) (hμ : i μ=i (dirac Z g-1)*localizedEisensteinConstant p)
    (a : U) (ha : (a : Z)=(p+1 : ℕ)) (e : ℕ) :
    (μ (j^e) : ℚ_[p])=((g : ℚ_[p])^e-1)*
      eisensteinAwayMoment p a ha e (eisensteinAwayConstant p a) := sorry

-- SuggestedEisensteinObstructionTests.sign_candidate_second_shift
example (μ : M) (hμ : i μ=i (dirac Z (-1 : U)-1)*localizedEisensteinConstant p) :
    (μ j : ℚ_[p])= -positivePseudoMoment p 2 (by omega) (kubotaLeopoldtPseudomeasure p) := sorry

-- SuggestedEisensteinObstructionTests.sign_candidate_even_test_zero
example (μ : M) (hμ : i μ=i (dirac Z (-1 : U)-1)*localizedEisensteinConstant p)
    (e : ℕ) (he : Even e) : (μ (j^e) : ℚ_[p])=0 := sorry

-- SuggestedEisensteinObstructionTests.sign_clearing_dyadic_not_integral
example : algebraMap D((ℤ_[2])ˣ,ℤ_[2]) (FractionRing D((ℤ_[2])ˣ,ℤ_[2]))
    (dirac ℤ_[2] (-1 : (ℤ_[2])ˣ)-1)*localizedEisensteinConstant 2 ∉
      Set.range (algebraMap D((ℤ_[2])ˣ,ℤ_[2]) (FractionRing D((ℤ_[2])ˣ,ℤ_[2]))) := sorry

-- SuggestedEisensteinObstructionTests.sign_clearing_ternary_not_integral
example : algebraMap D((ℤ_[3])ˣ,ℤ_[3]) (FractionRing D((ℤ_[3])ˣ,ℤ_[3]))
    (dirac ℤ_[3] (-1 : (ℤ_[3])ˣ)-1)*localizedEisensteinConstant 3 ∉
      Set.range (algebraMap D((ℤ_[3])ˣ,ℤ_[3]) (FractionRing D((ℤ_[3])ˣ,ℤ_[3]))) := sorry

-- SuggestedEisensteinObstructionTests.dyadic_not_ordinary_pseudomeasure
example : localizedEisensteinConstant 2 ∉
    Iwasawa.pseudomeasures (diracHom (G := (ℤ_[2])ˣ) (R := ℤ_[2]))
      (FractionRing D((ℤ_[2])ˣ,ℤ_[2])) := sorry

-- SuggestedEisensteinObstructionTests.ternary_not_ordinary_pseudomeasure
example : localizedEisensteinConstant 3 ∉
    Iwasawa.pseudomeasures (diracHom (G := (ℤ_[3])ˣ) (R := ℤ_[3]))
      (FractionRing D((ℤ_[3])ˣ,ℤ_[3])) := sorry

-- SuggestedEisensteinObstructionTests.constant_not_any_integral_image
example (μ : M) : i μ≠localizedEisensteinConstant p := sorry

-- SuggestedEisensteinObstructionTests.field_measure_fails_some_exponent
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) (μ : D(U,ℚ_[p])) :
    ∃ e : ℕ, μ (t^e)≠eisensteinAwayMoment p a ha e (eisensteinAwayConstant p a) := sorry

-- SuggestedEisensteinObstructionTests.dyadic_identity_atom_fails
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    dirac ℚ_[2] (1 : (ℤ_[2])ˣ)
      (⟨fun u : (ℤ_[2])ˣ => (u : ℚ_[2]),by fun_prop⟩ : C((ℤ_[2])ˣ,ℚ_[2]))≠
        eisensteinAwayMoment 2 a ha 1 (eisensteinAwayConstant 2 a) := sorry

end SuggestedEisensteinObstructionTests

namespace DirichletPadic
open scoped AbstractMeasure

open AbstractMeasure

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

local notation "S" => (fun u : U => Localization.Away (2*eisensteinTwistedDenominator p u))

def eisensteinInverseCharacter : ContinuousMonoidHom U Z := sorry

lemma eisensteinInverseCharacter_def :
    eisensteinInverseCharacter p =
      (primePowerArithmeticCharacter p 0 (1 : DirichletCharacter Z (p^0)) 1).comp
        (ContinuousMonoidHom.inv U) := sorry

lemma eisensteinInverseCharacter_apply (u : U) :
    eisensteinInverseCharacter p u=(↑(u⁻¹) : Z) := sorry

lemma eisensteinInverseCharacter_mul (u : U) :
    (u : Z)*eisensteinInverseCharacter p u=1 := sorry

lemma eisensteinInverseCharacter_ne_one : eisensteinInverseCharacter p≠1 := sorry

def eisensteinInverseMomentHom : M →+* ℚ_[p] := sorry

lemma eisensteinInverseMomentHom_def :
    eisensteinInverseMomentHom p=(algebraMap Z ℚ_[p]).comp
      (characterIntegralAlgHom (eisensteinInverseCharacter p)).toRingHom := sorry

lemma eisensteinInverseMomentHom_apply (μ : M) :
    eisensteinInverseMomentHom p μ=(μ (eisensteinInverseCharacter p).toContinuousMap : ℚ_[p]) := sorry

lemma eisensteinInverseMomentHom_dirac (u : U) :
    eisensteinInverseMomentHom p (dirac Z u)=((↑(u⁻¹) : Z) : ℚ_[p]) := sorry

lemma eisensteinInverseMomentHom_denominator (u : U) :
    eisensteinInverseMomentHom p (2*eisensteinTwistedDenominator p u)=0 := sorry

theorem eisensteinInverseMomentHom_no_away_extension (u : U) :
    ¬∃ F : S u →+* ℚ_[p], ∀ μ : M,
      F (algebraMap M (S u) μ)=eisensteinInverseMomentHom p μ := sorry

theorem eisensteinInverseMomentHom_no_fraction_extension :
    ¬∃ F : Q →+* ℚ_[p], ∀ μ : M,
      F (algebraMap M Q μ)=eisensteinInverseMomentHom p μ := sorry

end DirichletPadic

namespace SuggestedInverseCharacterTests
open scoped AbstractMeasure

open AbstractMeasure DirichletPadic

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => Zˣ

local notation "M" => D(U,Z)

local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)

local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }

local notation "S" => (fun u : U => Localization.Away (2*eisensteinTwistedDenominator p u))

-- SuggestedInverseCharacterTests.inverse_character_identity
example : eisensteinInverseCharacter p 1=1 := sorry

-- SuggestedInverseCharacterTests.inverse_character_negative_identity
example : eisensteinInverseCharacter p (-1)= -1 := sorry

-- SuggestedInverseCharacterTests.inverse_character_nontrivial
example : eisensteinInverseCharacter p≠1 := sorry

-- SuggestedInverseCharacterTests.inverse_character_ternary_two
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3])=2) :
    2*eisensteinInverseCharacter 3 u=1 := sorry

-- SuggestedInverseCharacterTests.inverse_moment_unit
example : eisensteinInverseMomentHom p 1=1 := sorry

-- SuggestedInverseCharacterTests.inverse_moment_sign_atom
example : eisensteinInverseMomentHom p (dirac Z (-1 : U))= -1 := sorry

-- SuggestedInverseCharacterTests.inverse_moment_ordinary_factor
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3])=4) :
    eisensteinInverseMomentHom 3 (dirac ℤ_[3] u-1)= -3/4 := sorry

-- SuggestedInverseCharacterTests.inverse_moment_all_integral_measures
example (μ : M) : eisensteinInverseMomentHom p μ=
    (μ (eisensteinInverseCharacter p).toContinuousMap : ℚ_[p]) := sorry

-- SuggestedInverseCharacterTests.inverse_shifted_identity_zero
example : eisensteinInverseMomentHom p (2*eisensteinTwistedDenominator p 1)=0 := sorry

-- SuggestedInverseCharacterTests.inverse_shifted_dyadic_canonical_zero
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    eisensteinInverseMomentHom 2 (2*eisensteinTwistedDenominator 2 a)=0 := sorry

-- SuggestedInverseCharacterTests.inverse_no_parameter_away_extension
example (u : U) : ¬∃ F : S u →+* ℚ_[p], ∀ μ : M,
    F (algebraMap M (S u) μ)=eisensteinInverseMomentHom p μ := sorry

-- SuggestedInverseCharacterTests.inverse_no_dyadic_total_extension
example : ¬∃ F : FractionRing D((ℤ_[2])ˣ,ℤ_[2]) →+* ℚ_[2],
    ∀ μ : D((ℤ_[2])ˣ,ℤ_[2]), F (algebraMap _ _ μ)=eisensteinInverseMomentHom 2 μ := sorry

-- SuggestedInverseCharacterTests.inverse_no_ternary_total_extension
example : ¬∃ F : FractionRing D((ℤ_[3])ˣ,ℤ_[3]) →+* ℚ_[3],
    ∀ μ : D((ℤ_[3])ˣ,ℤ_[3]), F (algebraMap _ _ μ)=eisensteinInverseMomentHom 3 μ := sorry

end SuggestedInverseCharacterTests

namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure BigOperators

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => Zˣ

section Coefficients
variable {R : Type*} [NormedCommRing R] {D E : ℕ}

def twistedPositiveEisensteinMeasure (ψ : DirichletCharacter R D)
    (φ : DirichletCharacter R E) (n : ℕ+) : D(U,R) := sorry

lemma twistedPositiveEisensteinMeasure_eq_sum (ψ : DirichletCharacter R D)
    (φ : DirichletCharacter R E) (n : ℕ+) :
    twistedPositiveEisensteinMeasure p ψ φ n=
      ∑ d∈(n : ℕ).divisors, if hd : ¬p∣d then
        (ψ ((n : ℕ)/d)*φ d) • AbstractMeasure.dirac R
          (PadicInt.isUnit_iff.mpr (PadicInt.norm_natCast_eq_one_iff.mpr
            ((Fact.out : p.Prime).coprime_iff_not_dvd.mpr hd))).unit else 0 := sorry

lemma twistedPositiveEisensteinMeasure_apply (ψ : DirichletCharacter R D)
    (φ : DirichletCharacter R E) (n : ℕ+) (f : C(U,R)) :
    twistedPositiveEisensteinMeasure p ψ φ n f=
      ∑ d∈(n : ℕ).divisors, if hd : ¬p∣d then
        ψ ((n : ℕ)/d)*φ d*f
          (PadicInt.isUnit_iff.mpr (PadicInt.norm_natCast_eq_one_iff.mpr
            ((Fact.out : p.Prime).coprime_iff_not_dvd.mpr hd))).unit else 0 := sorry

lemma twistedPositiveEisensteinMeasure_one (ψ : DirichletCharacter R D)
    (φ : DirichletCharacter R E) :
    twistedPositiveEisensteinMeasure p ψ φ 1=AbstractMeasure.dirac R 1 := sorry

lemma twistedPositiveEisensteinMeasure_prime_pow (ψ : DirichletCharacter R D)
    (φ : DirichletCharacter R E) (r : ℕ) :
    twistedPositiveEisensteinMeasure p ψ φ ⟨p^r,pow_pos (Fact.out : p.Prime).pos r⟩=
      (ψ p)^r • AbstractMeasure.dirac R 1 := sorry

theorem twistedPositiveEisensteinMeasure_mul_p (ψ : DirichletCharacter R D)
    (φ : DirichletCharacter R E) (n : ℕ+) :
    twistedPositiveEisensteinMeasure p ψ φ ⟨p*(n : ℕ),mul_pos (Fact.out : p.Prime).pos n.pos⟩=
      ψ p • twistedPositiveEisensteinMeasure p ψ φ n := sorry

lemma twistedPositiveEisensteinMeasure_mass (ψ : DirichletCharacter R D)
    (φ : DirichletCharacter R E) (n : ℕ+) :
    twistedPositiveEisensteinMeasure p ψ φ n 1=
      ∑ d∈(n : ℕ).divisors, if ¬p∣d then ψ ((n : ℕ)/d)*φ d else 0 := sorry

variable [Algebra ℤ_[p] R] [ContinuousSMul ℤ_[p] R]

theorem twistedPositiveEisensteinMeasure_moment (ψ : DirichletCharacter R D)
    (φ : DirichletCharacter R E) (n : ℕ+) (e : ℕ) :
    twistedPositiveEisensteinMeasure p ψ φ n
      (⟨fun u : U => (algebraMap Z R (u : Z))^e, by fun_prop⟩ : C(U,R))=
      ∑ d∈(n : ℕ).divisors, if ¬p∣d then ψ ((n : ℕ)/d)*φ d*(d : R)^e else 0 := sorry

end Coefficients

lemma twistedPositiveEisensteinMeasure_modOne (n : ℕ+) :
    twistedPositiveEisensteinMeasure p (1 : DirichletCharacter Z 1)
      (1 : DirichletCharacter Z 1) n=positiveEisensteinMeasure p n := sorry

theorem twistedPositiveEisensteinMeasure_test_bound {K : Type*} [NormedField K]
    [IsUltrametricDist K] {D E : ℕ} (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (n : ℕ+) (f g : C(U,K)) :
    ‖twistedPositiveEisensteinMeasure p ψ φ n f-twistedPositiveEisensteinMeasure p ψ φ n g‖≤
      ‖f-g‖ := sorry

end

end DirichletPadic

namespace SuggestedTwistedEisensteinTests
noncomputable section
open scoped AbstractMeasure

open DirichletPadic AbstractMeasure

section General
variable {p : ℕ} [Fact p.Prime] {R : Type*} [NormedCommRing R] {D E : ℕ}

-- SuggestedTwistedEisensteinTests.first_twisted_coefficient
example (ψ : DirichletCharacter R D) (φ : DirichletCharacter R E) :
    twistedPositiveEisensteinMeasure p ψ φ 1=dirac R 1 := sorry

-- SuggestedTwistedEisensteinTests.level_one_integral_comparison
example (n : ℕ+) : twistedPositiveEisensteinMeasure p (1 : DirichletCharacter ℤ_[p] 1)
    (1 : DirichletCharacter ℤ_[p] 1) n=positiveEisensteinMeasure p n := sorry

-- SuggestedTwistedEisensteinTests.bad_left_character_annihilation
example (ψ : DirichletCharacter R D) (φ : DirichletCharacter R E) (hψ : ψ p=0) (n : ℕ+) :
    twistedPositiveEisensteinMeasure p ψ φ ⟨p*(n : ℕ),mul_pos (Fact.out : p.Prime).pos n.pos⟩=0 := sorry

end General

section Dyadic
variable (χ : DirichletCharacter ℚ_[2] 3) (hχ : χ 2=-1)

include hχ

-- SuggestedTwistedEisensteinTests.dyadic_prime_sign
example : twistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 2=
    -dirac ℚ_[2] 1 := sorry

-- SuggestedTwistedEisensteinTests.dyadic_square_sign
example : twistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 4=
    dirac ℚ_[2] 1 := sorry

-- SuggestedTwistedEisensteinTests.character_positions_left
example (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2])=5) :
    twistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5=
      -dirac ℚ_[2] 1+dirac ℚ_[2] u := sorry

-- SuggestedTwistedEisensteinTests.character_positions_right
example (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2])=5) :
    twistedPositiveEisensteinMeasure 2 (1 : DirichletCharacter ℚ_[2] 1) χ 5=
      dirac ℚ_[2] 1-dirac ℚ_[2] u := sorry

-- SuggestedTwistedEisensteinTests.left_character_p_scaling
example : twistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 10=
    -twistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5 := sorry

variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

-- SuggestedTwistedEisensteinTests.dyadic_weight_two_left
example : twistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5
    (⟨fun u : (ℤ_[2])ˣ => algebraMap ℤ_[2] ℚ_[2] (u : ℤ_[2]), by fun_prop⟩ : C((ℤ_[2])ˣ,ℚ_[2]))=4 := sorry

-- SuggestedTwistedEisensteinTests.dyadic_weight_two_right
example : twistedPositiveEisensteinMeasure 2 (1 : DirichletCharacter ℚ_[2] 1) χ 5
    (⟨fun u : (ℤ_[2])ˣ => algebraMap ℤ_[2] ℚ_[2] (u : ℤ_[2]), by fun_prop⟩ : C((ℤ_[2])ˣ,ℚ_[2]))=-4 := sorry

end Dyadic

section Bounds
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NormedField K] [IsUltrametricDist K]
  {D E : ℕ} (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)

-- SuggestedTwistedEisensteinTests.uniform_single_test_bound
example (n : ℕ+) (f : C((ℤ_[p])ˣ,K)) :
    ‖twistedPositiveEisensteinMeasure p ψ φ n f‖≤‖f‖ := sorry

-- SuggestedTwistedEisensteinTests.close_tests_close_coefficients
example (n : ℕ+) (f g : C((ℤ_[p])ˣ,K)) (b : ℝ) (h : ‖f-g‖≤b) :
    ‖twistedPositiveEisensteinMeasure p ψ φ n f-twistedPositiveEisensteinMeasure p ψ φ n g‖≤b := sorry

end Bounds

end

end SuggestedTwistedEisensteinTests

namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure BigOperators

variable (p : ℕ) [Fact p.Prime]

variable {K : Type*} [NormedField K] [IsUltrametricDist K] {D E : ℕ}

local notation "U" => (ℤ_[p])ˣ

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "iMap" => (ContinuousMap.mk Subtype.val continuous_subtype_val : C(O,K))

def integralTwistedPositiveEisensteinMeasure (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (n : ℕ+) : D(U,O) := sorry

lemma integralTwistedPositiveEisensteinMeasure_eq_sum (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (n : ℕ+) :
    integralTwistedPositiveEisensteinMeasure p ψ φ n=
      ∑ d∈(n : ℕ).divisors, if hd : ¬p∣d then
        (⟨ψ ((n : ℕ)/d)*φ d, by
          rw [Valuation.mem_integer_iff, NormedField.valuation_apply]
          have hb : ‖ψ ((n : ℕ)/d)*φ d‖≤1 := by
            rw [norm_mul]
            calc
              _ ≤ 1*1 := mul_le_mul (ψ.norm_le_one _) (φ.norm_le_one _)
                (norm_nonneg _) zero_le_one
              _ = 1 := one_mul _
          exact_mod_cast hb⟩ : O) • AbstractMeasure.dirac O
          (PadicInt.isUnit_iff.mpr (PadicInt.norm_natCast_eq_one_iff.mpr
            ((Fact.out : p.Prime).coprime_iff_not_dvd.mpr hd))).unit else 0 := sorry

lemma integralTwistedPositiveEisensteinMeasure_apply (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (n : ℕ+) (f : C(U,O)) :
    integralTwistedPositiveEisensteinMeasure p ψ φ n f=
      ∑ d∈(n : ℕ).divisors, if hd : ¬p∣d then
        (⟨ψ ((n : ℕ)/d)*φ d, by
          rw [Valuation.mem_integer_iff, NormedField.valuation_apply]
          have hb : ‖ψ ((n : ℕ)/d)*φ d‖≤1 := by
            rw [norm_mul]
            calc
              _ ≤ 1*1 := mul_le_mul (ψ.norm_le_one _) (φ.norm_le_one _)
                (norm_nonneg _) zero_le_one
              _ = 1 := one_mul _
          exact_mod_cast hb⟩ : O) * f
          (PadicInt.isUnit_iff.mpr (PadicInt.norm_natCast_eq_one_iff.mpr
            ((Fact.out : p.Prime).coprime_iff_not_dvd.mpr hd))).unit else 0 := sorry

theorem coe_integralTwistedPositiveEisensteinMeasure_apply
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (n : ℕ+) (f : C(U,O)) :
    (integralTwistedPositiveEisensteinMeasure p ψ φ n f : K)=
      twistedPositiveEisensteinMeasure p ψ φ n ((iMap).comp f) := sorry

lemma integralTwistedPositiveEisensteinMeasure_one (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) :
    integralTwistedPositiveEisensteinMeasure p ψ φ 1=AbstractMeasure.dirac O 1 := sorry

lemma integralTwistedPositiveEisensteinMeasure_unique_coefficient
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+)
    (ν : D(U,O)) (hν : ∀ f : C(U,O), (ν f : K)=
      twistedPositiveEisensteinMeasure p ψ φ n ((iMap).comp f)) :
    ν=integralTwistedPositiveEisensteinMeasure p ψ φ n := sorry

lemma integralTwistedPositiveEisensteinMeasure_bound (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (n : ℕ+) (f : C(U,O)) :
    ‖integralTwistedPositiveEisensteinMeasure p ψ φ n f‖≤‖f‖ := sorry

theorem integralTwistedPositiveEisensteinMeasure_test_congruence
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+)
    (f g : C(U,O)) (b : O) (h : ∀ u : U, b∣g u-f u) :
    b∣integralTwistedPositiveEisensteinMeasure p ψ φ n g-
      integralTwistedPositiveEisensteinMeasure p ψ φ n f := sorry

variable [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

theorem integralTwistedPositiveEisensteinMeasure_moment
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) (e : ℕ) :
    (integralTwistedPositiveEisensteinMeasure p ψ φ n
      (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap : K)=
      ∑ d∈(n : ℕ).divisors, if ¬p∣d then ψ ((n : ℕ)/d)*φ d*(d : K)^e else 0 := sorry

theorem integralTwistedPositiveEisensteinMeasure_weight_congruence
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (n : ℕ+) (r e e' : ℕ) (hr : 0<r) (he : Nat.ModEq (p^(r-1)*(p-1)) e e') :
    (p : O)^r∣
      integralTwistedPositiveEisensteinMeasure p ψ φ n
        (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e').toContinuousMap-
      integralTwistedPositiveEisensteinMeasure p ψ φ n
        (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap := sorry

end

end DirichletPadic

namespace SuggestedIntegralTwistedEisensteinTests
noncomputable section
open scoped AbstractMeasure

open DirichletPadic AbstractMeasure

section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NormedField K]
  [IsUltrametricDist K] {D E : ℕ}

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

-- SuggestedIntegralTwistedEisensteinTests.first_integral_coefficient
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) :
    integralTwistedPositiveEisensteinMeasure p ψ φ 1=dirac O 1 := sorry

-- SuggestedIntegralTwistedEisensteinTests.zero_integral_test
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) :
    integralTwistedPositiveEisensteinMeasure p ψ φ n 0=0 := sorry

-- SuggestedIntegralTwistedEisensteinTests.exact_coefficient_inclusion
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (n : ℕ+) (f : C(U,O)) :
    (integralTwistedPositiveEisensteinMeasure p ψ φ n f : K)=
      twistedPositiveEisensteinMeasure p ψ φ n
        ((ContinuousMap.mk Subtype.val continuous_subtype_val).comp f) := sorry

-- SuggestedIntegralTwistedEisensteinTests.pointwise_ideal_transfer
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (n : ℕ+) (f g : C(U,O)) (b : O) (h : ∀ u : U, b∣g u-f u) :
    b∣integralTwistedPositiveEisensteinMeasure p ψ φ n g-
      integralTwistedPositiveEisensteinMeasure p ψ φ n f := sorry

-- SuggestedIntegralTwistedEisensteinTests.zero_modulus_is_equality
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (n : ℕ+) (f g : C(U,O)) (h : ∀ u : U, (0 : O)∣g u-f u) :
    integralTwistedPositiveEisensteinMeasure p ψ φ n g=
      integralTwistedPositiveEisensteinMeasure p ψ φ n f := sorry

end General

section Dyadic
variable (χ : DirichletCharacter ℚ_[2] 3) (hχ : χ 2=-1)

include hχ

local notation "O2" => Valuation.integer (NormedField.valuation (K := ℚ_[2]))

-- SuggestedIntegralTwistedEisensteinTests.dyadic_integral_sign
example : integralTwistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 2=
    -dirac O2 1 := sorry

variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

-- SuggestedIntegralTwistedEisensteinTests.dyadic_integral_left_moment
example : integralTwistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5
    (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap=4 := sorry

-- SuggestedIntegralTwistedEisensteinTests.dyadic_integral_right_moment
example : integralTwistedPositiveEisensteinMeasure 2 (1 : DirichletCharacter ℚ_[2] 1) χ 5
    (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap=-4 := sorry

-- SuggestedIntegralTwistedEisensteinTests.dyadic_actual_moment_difference
example : integralTwistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5
    (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 5).toContinuousMap-
    integralTwistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap=3120 := sorry

-- SuggestedIntegralTwistedEisensteinTests.dyadic_weight_congruence
example : (8 : O2)∣
    integralTwistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 5).toContinuousMap-
    integralTwistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap := sorry

end Dyadic

section OddCounterexample
local instance : Fact (Nat.Prime 5) := ⟨by decide⟩

variable [IsBoundedSMul ℤ_[5] ℚ_[5]]

variable (χ : DirichletCharacter ℚ_[5] 3) (hχ : χ 2=-1)

include hχ

local notation "O5" => Valuation.integer (NormedField.valuation (K := ℚ_[5]))

-- SuggestedIntegralTwistedEisensteinTests.tame_component_is_not_full_precision
example : ¬(25 : O5)∣
    integralTwistedPositiveEisensteinMeasure 5 χ (1 : DirichletCharacter ℚ_[5] 1) 2
      (integralPrimePowerArithmeticCharacter 5 0 (1 : DirichletCharacter ℚ_[5] (5^0)) 7).toContinuousMap-
    integralTwistedPositiveEisensteinMeasure 5 χ (1 : DirichletCharacter ℚ_[5] 1) 2
      (integralPrimePowerArithmeticCharacter 5 0 (1 : DirichletCharacter ℚ_[5] (5^0)) 3).toContinuousMap := sorry

end OddCounterexample

end

end SuggestedIntegralTwistedEisensteinTests

namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure BigOperators

variable (p : ℕ) [Fact p.Prime]

variable {K : Type*} [NormedField K] [IsUltrametricDist K] {D E : ℕ}

local notation "U" => (ℤ_[p])ˣ

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

def integralTwistedEisensteinFinite (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (n : ℕ+) (r : ℕ) :
    MonoidAlgebra O (ZMod (p^r))ˣ := sorry

lemma integralTwistedEisensteinFinite_eq_projection (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (n : ℕ+) (r : ℕ) :
    integralTwistedEisensteinFinite p ψ φ n r=
      MonoidAlgebra.ofCoeff (AbstractMeasure.finiteProjection
        (ContinuousMap.mk (PadicInt.unitToZModPow p r) (PadicInt.continuous_unitToZModPow p r))
        (integralTwistedPositiveEisensteinMeasure p ψ φ n)) := sorry

lemma integralTwistedEisensteinFinite_eq_sum (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (n : ℕ+) (r : ℕ) :
    integralTwistedEisensteinFinite p ψ φ n r=
      ∑ d∈(n : ℕ).divisors, if hd : ¬p∣d then
        MonoidAlgebra.single (PadicInt.unitToZModPow p r
          (PadicInt.isUnit_iff.mpr (PadicInt.norm_natCast_eq_one_iff.mpr
            ((Fact.out : p.Prime).coprime_iff_not_dvd.mpr hd))).unit)
          (⟨ψ ((n : ℕ)/d)*φ d, by
            rw [Valuation.mem_integer_iff, NormedField.valuation_apply]
            have hb : ‖ψ ((n : ℕ)/d)*φ d‖≤1 := by
              rw [norm_mul]
              calc
                _ ≤ 1*1 := mul_le_mul (ψ.norm_le_one _) (φ.norm_le_one _)
                  (norm_nonneg _) zero_le_one
                _ = 1 := one_mul _
            exact_mod_cast hb⟩ : O) else 0 := sorry

lemma integralTwistedEisensteinFinite_coeff (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (n : ℕ+) (r : ℕ) (a : (ZMod (p^r))ˣ) :
    (integralTwistedEisensteinFinite p ψ φ n r).coeff a=
      ∑ d∈(n : ℕ).divisors, if hd : ¬p∣d then
        if PadicInt.unitToZModPow p r
          (PadicInt.isUnit_iff.mpr (PadicInt.norm_natCast_eq_one_iff.mpr
            ((Fact.out : p.Prime).coprime_iff_not_dvd.mpr hd))).unit=a then
          (⟨ψ ((n : ℕ)/d)*φ d, by
            rw [Valuation.mem_integer_iff, NormedField.valuation_apply]
            have hb : ‖ψ ((n : ℕ)/d)*φ d‖≤1 := by
              rw [norm_mul]
              calc
                _ ≤ 1*1 := mul_le_mul (ψ.norm_le_one _) (φ.norm_le_one _)
                  (norm_nonneg _) zero_le_one
                _ = 1 := one_mul _
            exact_mod_cast hb⟩ : O) else 0 else 0 := sorry

theorem integralTwistedEisensteinFinite_transition (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (n : ℕ+) {r r' : ℕ} (hr : r'≤r) :
    MonoidAlgebra.mapDomainRingHom O (ZMod.unitsMap (pow_dvd_pow p hr))
      (integralTwistedEisensteinFinite p ψ φ n r)=
        integralTwistedEisensteinFinite p ψ φ n r' := sorry

theorem integralTwistedEisensteinFinite_apply {R : Type*} [CommRing R]
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (n : ℕ+) (r : ℕ) (c : O →+* R) (f : C(U,O)) (g : (ZMod (p^r))ˣ → R)
    (hfg : ∀ u : U, c (f u)=g (PadicInt.unitToZModPow p r u)) :
    c (integralTwistedPositiveEisensteinMeasure p ψ φ n f)=
      ∑ a, c ((integralTwistedEisensteinFinite p ψ φ n r).coeff a)*g a := sorry

lemma integralTwistedEisensteinFinite_one (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (r : ℕ) :
    integralTwistedEisensteinFinite p ψ φ 1 r=MonoidAlgebra.single 1 1 := sorry

lemma integralTwistedEisensteinFinite_zero_level (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (n : ℕ+) :
    integralTwistedEisensteinFinite p ψ φ n 0=
      MonoidAlgebra.single 1 (integralTwistedPositiveEisensteinMeasure p ψ φ n 1) := sorry

variable [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

theorem integralTwistedEisensteinFinite_moment_precision
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) (r e : ℕ) :
    (p : O)^r∣integralTwistedPositiveEisensteinMeasure p ψ φ n
      (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap-
      ∑ a : (ZMod (p^r))ˣ, (integralTwistedEisensteinFinite p ψ φ n r).coeff a*
        ((a : ZMod (p^r)).val : O)^e := sorry

lemma integralTwistedEisensteinFinite_moment_mod
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (n : ℕ+) (r s e : ℕ) (h : s≤r) :
    Ideal.Quotient.mk (Ideal.span {(p : O)^s})
      (integralTwistedPositiveEisensteinMeasure p ψ φ n
        (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap)=
      ∑ a : (ZMod (p^r))ˣ,
        Ideal.Quotient.mk (Ideal.span {(p : O)^s})
          ((integralTwistedEisensteinFinite p ψ φ n r).coeff a)*
        ((a : ZMod (p^r)).val : O ⧸ Ideal.span {(p : O)^s})^e := sorry

end

end DirichletPadic

namespace SuggestedTwistedFiniteTests
noncomputable section
open scoped AbstractMeasure BigOperators

open DirichletPadic

section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NormedField K]
  [IsUltrametricDist K] {D E : ℕ}

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

-- SuggestedTwistedFiniteTests.first_finite_coefficient
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (r : ℕ) :
    integralTwistedEisensteinFinite p ψ φ 1 r=MonoidAlgebra.single 1 1 := sorry

-- SuggestedTwistedFiniteTests.actual_integral_projection
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) (r : ℕ) :
    (integralTwistedEisensteinFinite p ψ φ n r).coeff=
      AbstractMeasure.finiteProjection
        (ContinuousMap.mk (PadicInt.unitToZModPow p r) (PadicInt.continuous_unitToZModPow p r))
        (integralTwistedPositiveEisensteinMeasure p ψ φ n) := sorry

-- SuggestedTwistedFiniteTests.trivial_group_remembers_mass
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) :
    (integralTwistedEisensteinFinite p ψ φ n 0).coeff 1=
      integralTwistedPositiveEisensteinMeasure p ψ φ n 1 := sorry

-- SuggestedTwistedFiniteTests.zero_coefficient_precision
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) (r : ℕ) :
    MonoidAlgebra.mapRingHom (ZMod (p^r))ˣ (Ideal.Quotient.mk (Ideal.span {(p : O)^0}))
      (integralTwistedEisensteinFinite p ψ φ n r)=0 := sorry

-- SuggestedTwistedFiniteTests.compatible_group_refinement
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) :
    MonoidAlgebra.mapDomainRingHom O (ZMod.unitsMap (pow_dvd_pow p (show 1≤2 by decide)))
      (integralTwistedEisensteinFinite p ψ φ n 2)=integralTwistedEisensteinFinite p ψ φ n 1 := sorry

end General

section Dyadic
variable (χ : DirichletCharacter ℚ_[2] 3) (hχ : χ 2=-1)

include hχ

local notation "O2" => Valuation.integer (NormedField.valuation (K := ℚ_[2]))

-- SuggestedTwistedFiniteTests.dyadic_signed_separation
example : integralTwistedEisensteinFinite 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5 3=
    -MonoidAlgebra.single 1 1+
      MonoidAlgebra.single (ZMod.unitOfCoprime 5 (by decide) : (ZMod (2^3))ˣ) 1 := sorry

-- SuggestedTwistedFiniteTests.dyadic_signed_collision
example : integralTwistedEisensteinFinite 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5 2=0 := sorry

-- SuggestedTwistedFiniteTests.dyadic_prime_coefficient_survives
example : integralTwistedEisensteinFinite 2 χ (1 : DirichletCharacter ℚ_[2] 1) 2 3=
    -MonoidAlgebra.single 1 1 := sorry

-- SuggestedTwistedFiniteTests.dyadic_distinct_levels
example : integralTwistedEisensteinFinite 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5 3≠0 ∧
    integralTwistedEisensteinFinite 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5 2=0 := sorry

-- SuggestedTwistedFiniteTests.dyadic_residue_representative_moment
example : (∑ a : (ZMod (2^3))ˣ,
    (integralTwistedEisensteinFinite 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5 3).coeff a*
      ((a : ZMod (2^3)).val : O2))=4 := sorry

variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

-- SuggestedTwistedFiniteTests.dyadic_sufficient_precision
example : Ideal.Quotient.mk (Ideal.span {(4 : O2)})
    (integralTwistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap)=0 := sorry

-- SuggestedTwistedFiniteTests.dyadic_insufficient_group_level
example : Ideal.Quotient.mk (Ideal.span {(8 : O2)})
    (integralTwistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap)≠0 := sorry

end Dyadic

end

end SuggestedTwistedFiniteTests

namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure BigOperators PowerSeries.WithPiTopology

variable (p : ℕ) [Fact p.Prime]

variable {K : Type*} [NormedField K] [IsUltrametricDist K] {D E : ℕ}

local notation "U" => (ℤ_[p])ˣ

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "iMap" => (ContinuousMap.mk Subtype.val continuous_subtype_val : C(O,K))

def integralTwistedPositiveEisensteinSeries (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) : AbstractMeasure U O (PowerSeries O) := sorry

theorem integralTwistedPositiveEisensteinSeries_coeff (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (f : C(U,O)) (n : ℕ) :
    PowerSeries.coeff n (integralTwistedPositiveEisensteinSeries p ψ φ f)=
      if hn : 0<n then integralTwistedPositiveEisensteinMeasure p ψ φ ⟨n,hn⟩ f else 0 := sorry

lemma integralTwistedPositiveEisensteinSeries_coeff_zero (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (f : C(U,O)) :
    PowerSeries.coeff 0 (integralTwistedPositiveEisensteinSeries p ψ φ f)=0 := sorry

lemma integralTwistedPositiveEisensteinSeries_coeff_pos (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (f : C(U,O)) (n : ℕ+) :
    PowerSeries.coeff (n : ℕ) (integralTwistedPositiveEisensteinSeries p ψ φ f)=
      integralTwistedPositiveEisensteinMeasure p ψ φ n f := sorry

lemma integralTwistedPositiveEisensteinSeries_zero (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) : integralTwistedPositiveEisensteinSeries p ψ φ 0=0 := sorry

lemma integralTwistedPositiveEisensteinSeries_add (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (f g : C(U,O)) :
    integralTwistedPositiveEisensteinSeries p ψ φ (f+g)=
      integralTwistedPositiveEisensteinSeries p ψ φ f+
        integralTwistedPositiveEisensteinSeries p ψ φ g := sorry

lemma integralTwistedPositiveEisensteinSeries_smul (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (a : O) (f : C(U,O)) :
    integralTwistedPositiveEisensteinSeries p ψ φ (a • f)=
      a • integralTwistedPositiveEisensteinSeries p ψ φ f := sorry

lemma integralTwistedPositiveEisensteinSeries_continuous (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) :
    Continuous (integralTwistedPositiveEisensteinSeries p ψ φ) := sorry

lemma integralTwistedPositiveEisensteinSeries_unique (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (M : AbstractMeasure U O (PowerSeries O))
    (h0 : ∀ f, PowerSeries.coeff 0 (M f)=0)
    (hpos : ∀ f (n : ℕ+), PowerSeries.coeff (n : ℕ) (M f)=
      integralTwistedPositiveEisensteinMeasure p ψ φ n f) :
    M=integralTwistedPositiveEisensteinSeries p ψ φ := sorry

lemma integralTwistedPositiveEisensteinSeries_coeff_norm_le (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (f : C(U,O)) (n : ℕ) :
    ‖PowerSeries.coeff n (integralTwistedPositiveEisensteinSeries p ψ φ f)‖≤‖f‖ := sorry

theorem coe_integralTwistedPositiveEisensteinSeries_apply (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (f : C(U,O)) :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
      (integralTwistedPositiveEisensteinSeries p ψ φ f)=
        PowerSeries.mk (fun n => if hn : 0<n then
          twistedPositiveEisensteinMeasure p ψ φ ⟨n,hn⟩ ((iMap).comp f) else 0) := sorry

theorem integralTwistedPositiveEisensteinSeries_test_congr (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (f g : C(U,O)) (b : O) (h : ∀ u : U, b∣g u-f u) :
    PowerSeries.C b∣integralTwistedPositiveEisensteinSeries p ψ φ g-
      integralTwistedPositiveEisensteinSeries p ψ φ f := sorry

theorem integralTwistedPositiveEisensteinSeries_coeff_mul_p (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (f : C(U,O)) (n : ℕ) :
    (PowerSeries.coeff (R := O) (p*n) (integralTwistedPositiveEisensteinSeries p ψ φ f) : K)=
      ψ p*(PowerSeries.coeff (R := O) n (integralTwistedPositiveEisensteinSeries p ψ φ f) : K) := sorry

variable [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

theorem integralTwistedPositiveEisensteinSeries_weight_congr
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (r e e' : ℕ) (hr : 0<r) (he : Nat.ModEq (p^(r-1)*(p-1)) e e') :
    PowerSeries.C ((p : O)^r)∣
      integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e').toContinuousMap-
      integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap := sorry

theorem integralTwistedPositiveEisensteinSeries_finite_moment_mod
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (r s e : ℕ) (h : s≤r) :
    PowerSeries.map (Ideal.Quotient.mk (Ideal.span {(p : O)^s}))
      (integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap)=
      PowerSeries.mk (fun n => if hn : 0<n then
        ∑ a : (ZMod (p^r))ˣ,
          Ideal.Quotient.mk (Ideal.span {(p : O)^s})
            ((integralTwistedEisensteinFinite p ψ φ ⟨n,hn⟩ r).coeff a)*
          ((a : ZMod (p^r)).val : O ⧸ Ideal.span {(p : O)^s})^e else 0) := sorry

end

end DirichletPadic

namespace SuggestedTwistedSeriesTests
noncomputable section
open scoped AbstractMeasure PowerSeries.WithPiTopology

open DirichletPadic

section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NormedField K]
  [IsUltrametricDist K] {D E : ℕ}

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

-- SuggestedTwistedSeriesTests.zero_test_series
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) :
    integralTwistedPositiveEisensteinSeries p ψ φ 0=0 := sorry

-- SuggestedTwistedSeriesTests.positive_truncation_constant
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (f : C(U,O)) :
    PowerSeries.constantCoeff (integralTwistedPositiveEisensteinSeries p ψ φ f)=0 := sorry

-- SuggestedTwistedSeriesTests.first_series_coefficient
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (f : C(U,O)) :
    PowerSeries.coeff 1 (integralTwistedPositiveEisensteinSeries p ψ φ f)=f 1 := sorry

-- SuggestedTwistedSeriesTests.actual_positive_coefficient
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (f : C(U,O)) (n : ℕ+) :
    PowerSeries.coeff (n : ℕ) (integralTwistedPositiveEisensteinSeries p ψ φ f)=
      integralTwistedPositiveEisensteinMeasure p ψ φ n f := sorry

-- SuggestedTwistedSeriesTests.zero_ideal_series_equality
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (f g : C(U,O)) (h : ∀ u : U, (0 : O)∣g u-f u) :
    integralTwistedPositiveEisensteinSeries p ψ φ g=
      integralTwistedPositiveEisensteinSeries p ψ φ f := sorry

end General

section LevelOne
variable {p : ℕ} [Fact p.Prime]

local notation "Op" => Valuation.integer (NormedField.valuation (K := ℚ_[p]))

-- SuggestedTwistedSeriesTests.level_one_mass_series
example :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[p]))).subtype
      (integralTwistedPositiveEisensteinSeries p
        (1 : DirichletCharacter ℚ_[p] 1) (1 : DirichletCharacter ℚ_[p] 1) 1)=
      PowerSeries.map PadicInt.Coe.ringHom
        (positiveEisensteinSeries p (1 : C((ℤ_[p])ˣ,ℤ_[p]))) := sorry

end LevelOne

section Dyadic
variable (χ : DirichletCharacter ℚ_[2] 3) (hχ : χ 2=-1)

include hχ

local notation "O2" => Valuation.integer (NormedField.valuation (K := ℚ_[2]))

-- SuggestedTwistedSeriesTests.dyadic_series_prime_sign
example : PowerSeries.coeff 2
    (integralTwistedPositiveEisensteinSeries 2 χ (1 : DirichletCharacter ℚ_[2] 1) 1)=-1 := sorry

-- SuggestedTwistedSeriesTests.dyadic_series_index_sign
example (f : C((ℤ_[2])ˣ,O2)) : PowerSeries.coeff 10
    (integralTwistedPositiveEisensteinSeries 2 χ (1 : DirichletCharacter ℚ_[2] 1) f)=
      -PowerSeries.coeff 5
        (integralTwistedPositiveEisensteinSeries 2 χ (1 : DirichletCharacter ℚ_[2] 1) f) := sorry

variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

-- SuggestedTwistedSeriesTests.dyadic_series_fifth_moment
example : PowerSeries.coeff 5
    (integralTwistedPositiveEisensteinSeries 2 χ (1 : DirichletCharacter ℚ_[2] 1)
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap)=4 := sorry

-- SuggestedTwistedSeriesTests.dyadic_whole_series_congruence
example : PowerSeries.C (8 : O2)∣
    integralTwistedPositiveEisensteinSeries 2 χ (1 : DirichletCharacter ℚ_[2] 1)
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 5).toContinuousMap-
    integralTwistedPositiveEisensteinSeries 2 χ (1 : DirichletCharacter ℚ_[2] 1)
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap := sorry

-- SuggestedTwistedSeriesTests.insufficient_group_level_in_series
example : integralTwistedEisensteinFinite 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5 2=0 ∧
    PowerSeries.coeff 5 (PowerSeries.map (Ideal.Quotient.mk (Ideal.span {(8 : O2)}))
      (integralTwistedPositiveEisensteinSeries 2 χ (1 : DirichletCharacter ℚ_[2] 1)
        (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap))≠0 := sorry

end Dyadic

section OddCounterexample
local instance : Fact (Nat.Prime 5) := ⟨by decide⟩

variable [IsBoundedSMul ℤ_[5] ℚ_[5]]

variable (χ : DirichletCharacter ℚ_[5] 3) (hχ : χ 2=-1)

include hχ

local notation "O5" => Valuation.integer (NormedField.valuation (K := ℚ_[5]))

-- SuggestedTwistedSeriesTests.tame_only_whole_series_failure
example : ¬PowerSeries.C (25 : O5)∣
    integralTwistedPositiveEisensteinSeries 5 χ (1 : DirichletCharacter ℚ_[5] 1)
      (integralPrimePowerArithmeticCharacter 5 0 (1 : DirichletCharacter ℚ_[5] (5^0)) 7).toContinuousMap-
    integralTwistedPositiveEisensteinSeries 5 χ (1 : DirichletCharacter ℚ_[5] 1)
      (integralPrimePowerArithmeticCharacter 5 0 (1 : DirichletCharacter ℚ_[5] (5^0)) 3).toContinuousMap := sorry

end OddCounterexample

end

end SuggestedTwistedSeriesTests

namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure BigOperators PowerSeries.WithPiTopology

variable (p : ℕ) [Fact p.Prime]

variable {K : Type*} [NormedField K] [IsUltrametricDist K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] {D E : ℕ}

local notation "U" => (ℤ_[p])ˣ

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

theorem integralTwistedPositiveEisensteinMeasure_character_twist
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (n : ℕ+) (f : C(U,O)) :
    integralTwistedPositiveEisensteinMeasure p ψ φ n
      ((integralPrimePowerArithmeticCharacter p t χ 0).toContinuousMap*f)=
    integralTwistedPositiveEisensteinMeasure p ψ (φ.mul χ) n f := sorry

theorem integralTwistedPositiveEisensteinMeasure_arithmetic_moment
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (n : ℕ+) (e : ℕ) :
    (integralTwistedPositiveEisensteinMeasure p ψ φ n
      (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap : K)=
      ∑ d∈(n : ℕ).divisors, if ¬p∣d then
        ψ ((n : ℕ)/d)*φ d*χ d*(d : K)^e else 0 := sorry

theorem integralTwistedPositiveEisensteinSeries_character_twist
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (f : C(U,O)) :
    integralTwistedPositiveEisensteinSeries p ψ φ
      ((integralPrimePowerArithmeticCharacter p t χ 0).toContinuousMap*f)=
    integralTwistedPositiveEisensteinSeries p ψ (φ.mul χ) f := sorry

theorem integralTwistedPositiveEisensteinSeries_arithmetic_twist
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (e : ℕ) :
    integralTwistedPositiveEisensteinSeries p ψ φ
      (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap=
    integralTwistedPositiveEisensteinSeries p ψ (φ.mul χ)
      (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap := sorry

theorem integralTwistedPositiveEisensteinSeries_arithmetic_moment
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (e : ℕ) :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
      (integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap)=
      PowerSeries.mk (fun n => if 0<n then
        ∑ d∈n.divisors, if ¬p∣d then ψ (n/d)*φ d*χ d*(d : K)^e else 0 else 0) := sorry

theorem integralTwistedPositiveEisensteinSeries_character_weight_congr
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t))
    (r e e' : ℕ) (hr : 0<r) (he : Nat.ModEq (p^(r-1)*(p-1)) e e') :
    PowerSeries.C ((p : O)^r)∣
      integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p t χ e').toContinuousMap-
      integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap := sorry

theorem integralTwistedPositiveEisensteinSeries_character_finite_moment_mod
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t))
    (r s e : ℕ) (h : s≤r) :
    PowerSeries.map (Ideal.Quotient.mk (Ideal.span {(p : O)^s}))
      (integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap)=
      PowerSeries.mk (fun n => if hn : 0<n then
        ∑ a : (ZMod (p^r))ˣ,
          Ideal.Quotient.mk (Ideal.span {(p : O)^s})
            ((integralTwistedEisensteinFinite p ψ (φ.mul χ) ⟨n,hn⟩ r).coeff a)*
          ((a : ZMod (p^r)).val : O ⧸ Ideal.span {(p : O)^s})^e else 0) := sorry

end

end DirichletPadic

namespace SuggestedWildEisensteinTests
noncomputable section
open scoped AbstractMeasure BigOperators PowerSeries.WithPiTopology

open DirichletPadic

section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] {D E : ℕ}

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

-- SuggestedWildEisensteinTests.first_arithmetic_coefficient
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (e : ℕ) :
    integralTwistedPositiveEisensteinMeasure p ψ φ 1
      (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap=1 := sorry

-- SuggestedWildEisensteinTests.principal_character_preserves_moment
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t e : ℕ) (n : ℕ+) :
    integralTwistedPositiveEisensteinMeasure p ψ φ n
      (integralPrimePowerArithmeticCharacter p t (1 : DirichletCharacter K (p^t)) e).toContinuousMap=
    integralTwistedPositiveEisensteinMeasure p ψ φ n
      (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap := sorry

-- SuggestedWildEisensteinTests.coefficient_twist_identity_atom
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (f : C(U,O)) :
    integralTwistedPositiveEisensteinMeasure p ψ φ 1
      ((integralPrimePowerArithmeticCharacter p t χ 0).toContinuousMap*f)=f 1 := sorry

-- SuggestedWildEisensteinTests.actual_series_character_specialization
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (f : C(U,O)) (n : ℕ+) :
    PowerSeries.coeff (n : ℕ) (integralTwistedPositiveEisensteinSeries p ψ φ
      ((integralPrimePowerArithmeticCharacter p t χ 0).toContinuousMap*f))=
    integralTwistedPositiveEisensteinMeasure p ψ (φ.mul χ) n f := sorry

-- SuggestedWildEisensteinTests.principal_character_preserves_series
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (t e : ℕ) :
    integralTwistedPositiveEisensteinSeries p ψ φ
      (integralPrimePowerArithmeticCharacter p t (1 : DirichletCharacter K (p^t)) e).toContinuousMap=
    integralTwistedPositiveEisensteinSeries p ψ φ
      (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap := sorry

-- SuggestedWildEisensteinTests.character_series_constant_zero
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (e : ℕ) :
    PowerSeries.coeff 0 (integralTwistedPositiveEisensteinSeries p ψ φ
      (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap)=0 := sorry

end General

section Dyadic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

variable (χ : DirichletCharacter ℚ_[2] 4) (hχ : χ 3=-1)

include hχ

local notation "O2" => Valuation.integer (NormedField.valuation (K := ℚ_[2]))

-- SuggestedWildEisensteinTests.wild_prime_coefficient_survives
example (e : ℕ) : PowerSeries.coeff 2
    (integralTwistedPositiveEisensteinSeries 2
      (1 : DirichletCharacter ℚ_[2] 1) (1 : DirichletCharacter ℚ_[2] 1)
      (integralPrimePowerArithmeticCharacter 2 2 χ e).toContinuousMap)=1 := sorry

-- SuggestedWildEisensteinTests.wild_right_third_moment
example : PowerSeries.coeff 3
    (integralTwistedPositiveEisensteinSeries 2
      (1 : DirichletCharacter ℚ_[2] 1) (1 : DirichletCharacter ℚ_[2] 1)
      (integralPrimePowerArithmeticCharacter 2 2 χ 1).toContinuousMap)=-2 := sorry

-- SuggestedWildEisensteinTests.wrong_left_third_moment
example : integralTwistedPositiveEisensteinMeasure 2 χ
    (1 : DirichletCharacter ℚ_[2] 1) 3
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap=2 := sorry

-- SuggestedWildEisensteinTests.wild_whole_weight_congruence
example : PowerSeries.C (8 : O2)∣
    integralTwistedPositiveEisensteinSeries 2
      (1 : DirichletCharacter ℚ_[2] 1) (1 : DirichletCharacter ℚ_[2] 1)
      (integralPrimePowerArithmeticCharacter 2 2 χ 5).toContinuousMap-
    integralTwistedPositiveEisensteinSeries 2
      (1 : DirichletCharacter ℚ_[2] 1) (1 : DirichletCharacter ℚ_[2] 1)
      (integralPrimePowerArithmeticCharacter 2 2 χ 1).toContinuousMap := sorry

-- SuggestedWildEisensteinTests.character_inserted_before_coarse_projection
example : integralTwistedEisensteinFinite 2 (1 : DirichletCharacter ℚ_[2] 1)
    ((1 : DirichletCharacter ℚ_[2] 1).mul χ) 3 1=0 := sorry

-- SuggestedWildEisensteinTests.coarse_after_twist_moment_precision
example : Ideal.Quotient.mk (Ideal.span {(2 : O2)})
    (integralTwistedPositiveEisensteinMeasure 2
      (1 : DirichletCharacter ℚ_[2] 1) (1 : DirichletCharacter ℚ_[2] 1) 3
      (integralPrimePowerArithmeticCharacter 2 2 χ 1).toContinuousMap)=0 := sorry

-- SuggestedWildEisensteinTests.untwisted_coarse_coordinate_loses_character
example : integralTwistedEisensteinFinite 2
    (1 : DirichletCharacter ℚ_[2] 1) (1 : DirichletCharacter ℚ_[2] 1) 3 1≠
    integralTwistedEisensteinFinite 2 (1 : DirichletCharacter ℚ_[2] 1)
      ((1 : DirichletCharacter ℚ_[2] 1).mul χ) 3 1 := sorry

end Dyadic

end

end SuggestedWildEisensteinTests

namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure PowerSeries.WithPiTopology

variable (p : ℕ) [Fact p.Prime]

variable {K L : Type*} [NormedField K] [NormedField L]
  [IsUltrametricDist K] [IsUltrametricDist L] [Algebra K L] [ContinuousSMul K L]
  [Valuation.HasExtension (NormedField.valuation (K := K)) (NormedField.valuation (K := L))]
  {D E : ℕ}

local notation "OK" => Valuation.integer (NormedField.valuation (K := K))

local notation "OL" => Valuation.integer (NormedField.valuation (K := L))

local notation "U" => (ℤ_[p])ˣ

local notation "jMap" => (ContinuousMap.mk (algebraMap OK OL)
  (Continuous.subtype_mk (Continuous.comp (continuous_algebraMap K L) continuous_subtype_val) _) : C(OK,OL))

theorem integralTwistedPositiveEisensteinMeasure_baseChange
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) (f : C(U,OK)) :
    algebraMap OK OL (integralTwistedPositiveEisensteinMeasure p ψ φ n f)=
      integralTwistedPositiveEisensteinMeasure p
        (ψ.ringHomComp (algebraMap K L)) (φ.ringHomComp (algebraMap K L)) n
        ((jMap).comp f) := sorry

theorem integralTwistedEisensteinFinite_baseChange
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) (r : ℕ) :
    MonoidAlgebra.mapRingHom (ZMod (p^r))ˣ (algebraMap OK OL)
      (integralTwistedEisensteinFinite p ψ φ n r)=
      integralTwistedEisensteinFinite p
        (ψ.ringHomComp (algebraMap K L)) (φ.ringHomComp (algebraMap K L)) n r := sorry

theorem integralTwistedPositiveEisensteinSeries_baseChange
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (f : C(U,OK)) :
    PowerSeries.map (algebraMap OK OL) (integralTwistedPositiveEisensteinSeries p ψ φ f)=
      integralTwistedPositiveEisensteinSeries p
        (ψ.ringHomComp (algebraMap K L)) (φ.ringHomComp (algebraMap K L))
        ((jMap).comp f) := sorry

theorem integralTwistedPositiveEisensteinSeries_baseChange_eq_iff
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (f g : C(U,OK)) :
    integralTwistedPositiveEisensteinSeries p
        (ψ.ringHomComp (algebraMap K L)) (φ.ringHomComp (algebraMap K L)) ((jMap).comp f)=
      integralTwistedPositiveEisensteinSeries p
        (ψ.ringHomComp (algebraMap K L)) (φ.ringHomComp (algebraMap K L)) ((jMap).comp g) ↔
      integralTwistedPositiveEisensteinSeries p ψ φ f=
        integralTwistedPositiveEisensteinSeries p ψ φ g := sorry

theorem integralTwistedPositiveEisensteinSeries_baseChange_dvd_iff
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (f g : C(U,OK)) (b : OK) :
    PowerSeries.C (algebraMap OK OL b)∣
      integralTwistedPositiveEisensteinSeries p
        (ψ.ringHomComp (algebraMap K L)) (φ.ringHomComp (algebraMap K L)) ((jMap).comp g)-
      integralTwistedPositiveEisensteinSeries p
        (ψ.ringHomComp (algebraMap K L)) (φ.ringHomComp (algebraMap K L)) ((jMap).comp f) ↔
      PowerSeries.C b∣integralTwistedPositiveEisensteinSeries p ψ φ g-
        integralTwistedPositiveEisensteinSeries p ψ φ f := sorry

variable [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [Algebra ℤ_[p] L] [IsBoundedSMul ℤ_[p] L]

theorem integralTwistedPositiveEisensteinMeasure_arithmetic_baseChange
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (n : ℕ+) (e : ℕ) :
    algebraMap OK OL (integralTwistedPositiveEisensteinMeasure p ψ φ n
      (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap)=
    integralTwistedPositiveEisensteinMeasure p
      (ψ.ringHomComp (algebraMap K L)) (φ.ringHomComp (algebraMap K L)) n
      (integralPrimePowerArithmeticCharacter p t (χ.ringHomComp (algebraMap K L)) e).toContinuousMap := sorry

theorem integralTwistedPositiveEisensteinSeries_arithmetic_baseChange
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (e : ℕ) :
    PowerSeries.map (algebraMap OK OL) (integralTwistedPositiveEisensteinSeries p ψ φ
      (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap)=
    integralTwistedPositiveEisensteinSeries p
      (ψ.ringHomComp (algebraMap K L)) (φ.ringHomComp (algebraMap K L))
      (integralPrimePowerArithmeticCharacter p t (χ.ringHomComp (algebraMap K L)) e).toContinuousMap := sorry

end

end DirichletPadic

namespace SuggestedEisensteinCoefficientChangeTests
noncomputable section
open scoped AbstractMeasure PowerSeries.WithPiTopology

open DirichletPadic

section General
variable {p : ℕ} [Fact p.Prime]

variable {K L : Type*} [NormedField K] [NormedField L]
  [IsUltrametricDist K] [IsUltrametricDist L] [Algebra K L] [ContinuousSMul K L]
  [Valuation.HasExtension (NormedField.valuation (K := K)) (NormedField.valuation (K := L))]
  {D E : ℕ}

local notation "OK" => Valuation.integer (NormedField.valuation (K := K))

local notation "OL" => Valuation.integer (NormedField.valuation (K := L))

local notation "U" => (ℤ_[p])ˣ

local notation "jMap" => (ContinuousMap.mk (algebraMap OK OL)
  (Continuous.subtype_mk (Continuous.comp (continuous_algebraMap K L) continuous_subtype_val) _) : C(OK,OL))

-- SuggestedEisensteinCoefficientChangeTests.first_coefficient_base_change
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (f : C(U,OK)) :
    integralTwistedPositiveEisensteinMeasure p
      (ψ.ringHomComp (algebraMap K L)) (φ.ringHomComp (algebraMap K L)) 1
      ((jMap).comp f)=algebraMap OK OL (f 1) := sorry

-- SuggestedEisensteinCoefficientChangeTests.identity_coefficient_change
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) (f : C(U,OK)) :
    algebraMap OK OK (integralTwistedPositiveEisensteinMeasure p ψ φ n f)=
      integralTwistedPositiveEisensteinMeasure p ψ φ n f := sorry

-- SuggestedEisensteinCoefficientChangeTests.finite_first_atom_base_change
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (r : ℕ) :
    MonoidAlgebra.mapRingHom (ZMod (p^r))ˣ (algebraMap OK OL)
      (integralTwistedEisensteinFinite p ψ φ 1 r)=MonoidAlgebra.single 1 1 := sorry

-- SuggestedEisensteinCoefficientChangeTests.identity_series_change
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (f : C(U,OK)) :
    PowerSeries.map (algebraMap OK OK) (integralTwistedPositiveEisensteinSeries p ψ φ f)=
      integralTwistedPositiveEisensteinSeries p ψ φ f := sorry

-- SuggestedEisensteinCoefficientChangeTests.extension_preserves_zero_constant
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (f : C(U,OK)) :
    PowerSeries.coeff 0 (PowerSeries.map (algebraMap OK OL)
      (integralTwistedPositiveEisensteinSeries p ψ φ f))=0 := sorry

-- SuggestedEisensteinCoefficientChangeTests.zero_series_descends
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (f : C(U,OK))
    (h : integralTwistedPositiveEisensteinSeries p
      (ψ.ringHomComp (algebraMap K L)) (φ.ringHomComp (algebraMap K L)) ((jMap).comp f)=0) :
    integralTwistedPositiveEisensteinSeries p ψ φ f=0 := sorry

-- SuggestedEisensteinCoefficientChangeTests.zero_modulus_reflects_equality
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (f g : C(U,OK))
    (h : PowerSeries.C (0 : OL)∣PowerSeries.map (algebraMap OK OL)
      (integralTwistedPositiveEisensteinSeries p ψ φ g-
        integralTwistedPositiveEisensteinSeries p ψ φ f)) :
    integralTwistedPositiveEisensteinSeries p ψ φ g=
      integralTwistedPositiveEisensteinSeries p ψ φ f := sorry

variable [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [Algebra ℤ_[p] L] [IsBoundedSMul ℤ_[p] L]

-- SuggestedEisensteinCoefficientChangeTests.first_arithmetic_coefficient_base_change
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (e : ℕ) :
    algebraMap OK OL (integralTwistedPositiveEisensteinMeasure p ψ φ 1
      (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap)=1 := sorry

end General

section Tower
variable {p : ℕ} [Fact p.Prime] {K L M : Type*}
  [NormedField K] [NormedField L] [NormedField M]
  [IsUltrametricDist K] [IsUltrametricDist L] [IsUltrametricDist M]
  [Algebra K L] [Algebra L M] [Algebra K M] [IsScalarTower K L M]
  [Valuation.HasExtension (NormedField.valuation (K := K)) (NormedField.valuation (K := L))]
  [Valuation.HasExtension (NormedField.valuation (K := L)) (NormedField.valuation (K := M))]
  [Valuation.HasExtension (NormedField.valuation (K := K)) (NormedField.valuation (K := M))]
  {D E : ℕ}

local notation "OK" => Valuation.integer (NormedField.valuation (K := K))

local notation "OL" => Valuation.integer (NormedField.valuation (K := L))

local notation "OM" => Valuation.integer (NormedField.valuation (K := M))

-- SuggestedEisensteinCoefficientChangeTests.series_change_composes
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (f : C((ℤ_[p])ˣ,OK)) :
    PowerSeries.map (algebraMap OL OM) (PowerSeries.map (algebraMap OK OL)
      (integralTwistedPositiveEisensteinSeries p ψ φ f))=
    PowerSeries.map (algebraMap OK OM) (integralTwistedPositiveEisensteinSeries p ψ φ f) := sorry

-- SuggestedEisensteinCoefficientChangeTests.finite_coordinate_change_composes
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) (r : ℕ) :
    MonoidAlgebra.mapRingHom (ZMod (p^r))ˣ (algebraMap OL OM)
      (MonoidAlgebra.mapRingHom (ZMod (p^r))ˣ (algebraMap OK OL)
        (integralTwistedEisensteinFinite p ψ φ n r))=
    MonoidAlgebra.mapRingHom (ZMod (p^r))ˣ (algebraMap OK OM)
      (integralTwistedEisensteinFinite p ψ φ n r) := sorry

end Tower

section Ramification
local instance : Fact (Nat.Prime 3) := ⟨by decide⟩

variable {L : Type*} [NormedField L] [IsUltrametricDist L] [Algebra ℚ_[3] L]
  [Valuation.HasExtension (NormedField.valuation (K := ℚ_[3])) (NormedField.valuation (K := L))]

local notation "OL" => Valuation.integer (NormedField.valuation (K := L))

-- SuggestedEisensteinCoefficientChangeTests.ramified_parameter_does_not_change_p_precision
example (π : OL) (hπ : π^2=3) : ¬(9 : OL)∣π^2 := sorry

-- SuggestedEisensteinCoefficientChangeTests.field_divisibility_is_not_integral_precision
example : (9 : L)∣3 ∧ ¬(9 : OL)∣3 := sorry

end Ramification

end

end SuggestedEisensteinCoefficientChangeTests

namespace DirichletPadic
noncomputable section
open scoped BigOperators AbstractMeasure PowerSeries.WithPiTopology

variable (p : ℕ) [Fact p.Prime]

theorem twistedDivisorSum_euler_deletion {R : Type*} [CommRing R] {D E : ℕ}
    (ψ : DirichletCharacter R D) (φ : DirichletCharacter R E) (n e : ℕ) :
    (∑ d∈n.divisors, if ¬p∣d then ψ (n/d)*φ d*(d : R)^e else 0)=
      DirichletCharacter.twistedDivisorSum e ψ φ n-
        if p∣n then φ p*(p : R)^e*DirichletCharacter.twistedDivisorSum e ψ φ (n/p)
        else 0 := sorry

variable {K : Type*} [NormedField K] [IsUltrametricDist K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] {D E : ℕ}

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

theorem integralTwistedPositiveEisensteinMeasure_native_moment
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) (e : ℕ) :
    (integralTwistedPositiveEisensteinMeasure p ψ φ n
      (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap : K)=
      DirichletCharacter.twistedDivisorSum e ψ φ (n : ℕ)-
        if p∣(n : ℕ) then φ p*(p : K)^e*
          DirichletCharacter.twistedDivisorSum e ψ φ ((n : ℕ)/p) else 0 := sorry

theorem integralTwistedPositiveEisensteinSeries_native_moment
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (e : ℕ) :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
      (integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap)=
      PowerSeries.mk (fun n => DirichletCharacter.twistedDivisorSum e ψ φ n)-
        PowerSeries.C (φ p*(p : K)^e)*
          PowerSeries.expand p (Fact.out : p.Prime).ne_zero
            (PowerSeries.mk (fun n => DirichletCharacter.twistedDivisorSum e ψ φ n)) := sorry

theorem integralTwistedPositiveEisensteinSeries_native_arithmetic_moment
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (e : ℕ) :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
      (integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap)=
      PowerSeries.mk (fun n => DirichletCharacter.twistedDivisorSum e ψ (φ.mul χ) n)-
        PowerSeries.C ((φ.mul χ) p*(p : K)^e)*
          PowerSeries.expand p (Fact.out : p.Prime).ne_zero
            (PowerSeries.mk (fun n => DirichletCharacter.twistedDivisorSum e ψ (φ.mul χ) n)) := sorry

theorem integralTwistedPositiveEisensteinSeries_native_bad_right_level
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (h : p∣E) (e : ℕ) :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
      (integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap)=
      PowerSeries.mk (fun n => DirichletCharacter.twistedDivisorSum e ψ φ n) := sorry

end

end DirichletPadic

namespace SuggestedTwistedEulerTests
noncomputable section
open scoped BigOperators AbstractMeasure PowerSeries.WithPiTopology

open DirichletPadic

section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] {D E : ℕ}

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

-- SuggestedTwistedEulerTests.native_zero_index
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (e : ℕ) :
    DirichletCharacter.twistedDivisorSum e ψ φ 0-
      φ p*(p : K)^e*DirichletCharacter.twistedDivisorSum e ψ φ (0/p)=0 := sorry

-- SuggestedTwistedEulerTests.exponent_zero_keeps_right_factor
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) :
    DirichletCharacter.twistedDivisorSum 0 ψ φ p-
      φ p*DirichletCharacter.twistedDivisorSum 0 ψ φ 1=ψ p := sorry

-- SuggestedTwistedEulerTests.away_index_equals_native
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (n : ℕ+) (hn : ¬p∣(n : ℕ)) (e : ℕ) :
    (integralTwistedPositiveEisensteinMeasure p ψ φ n
      (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap : K)=
      DirichletCharacter.twistedDivisorSum e ψ φ (n : ℕ) := sorry

-- SuggestedTwistedEulerTests.principal_levels_recover_sigma
example (ψ φ : DirichletCharacter K 1) (e : ℕ) :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
      (integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap)=
      PowerSeries.mk (fun n => (ArithmeticFunction.sigma e : ArithmeticFunction K) n)-
        PowerSeries.C ((p : K)^e)*PowerSeries.expand p (Fact.out : p.Prime).ne_zero
          (PowerSeries.mk (fun n => (ArithmeticFunction.sigma e : ArithmeticFunction K) n)) := sorry

-- SuggestedTwistedEulerTests.native_comparison_zero_constant
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (e : ℕ) :
    PowerSeries.coeff 0 (PowerSeries.mk (fun n => DirichletCharacter.twistedDivisorSum e ψ φ n)-
      PowerSeries.C (φ p*(p : K)^e)*PowerSeries.expand p (Fact.out : p.Prime).ne_zero
        (PowerSeries.mk (fun n => DirichletCharacter.twistedDivisorSum e ψ φ n)))=0 := sorry

-- SuggestedTwistedEulerTests.positive_wild_level_removes_euler_correction
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (ht : 0<t) (χ : DirichletCharacter K (p^t)) (e : ℕ) :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
      (integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap)=
      PowerSeries.mk (fun n => DirichletCharacter.twistedDivisorSum e ψ (φ.mul χ) n) := sorry

-- SuggestedTwistedEulerTests.zero_level_wild_character_recovers_principal
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (χ : DirichletCharacter K (p^0)) (e n : ℕ) :
    DirichletCharacter.twistedDivisorSum e ψ (φ.mul χ) n=
      DirichletCharacter.twistedDivisorSum e ψ φ n := sorry

end General

section DyadicLeft
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

variable (ψ : DirichletCharacter ℚ_[2] 3) (hψ : ψ 2=-1)

include hψ

-- SuggestedTwistedEulerTests.left_character_prime_coefficient
example : (integralTwistedPositiveEisensteinMeasure 2 ψ (1 : DirichletCharacter ℚ_[2] 1) 2
    (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap : ℚ_[2])=-1 := sorry

-- SuggestedTwistedEulerTests.left_factor_would_be_wrong
example : DirichletCharacter.twistedDivisorSum 1 ψ (1 : DirichletCharacter ℚ_[2] 1) 2-
    ψ 2*2*DirichletCharacter.twistedDivisorSum 1 ψ (1 : DirichletCharacter ℚ_[2] 1) 1≠(-1 : ℚ_[2]) := sorry

-- SuggestedTwistedEulerTests.divisible_index_is_not_deleted
example : (integralTwistedPositiveEisensteinMeasure 2 ψ (1 : DirichletCharacter ℚ_[2] 1) 10
    (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap : ℚ_[2])=-4 := sorry

end DyadicLeft

section DyadicBadLevel
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

-- SuggestedTwistedEulerTests.right_bad_level_prime_survives
example (φ : DirichletCharacter ℚ_[2] 4) (e : ℕ) :
    (integralTwistedPositiveEisensteinMeasure 2 (1 : DirichletCharacter ℚ_[2] 1) φ 2
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) e).toContinuousMap : ℚ_[2])=1 := sorry

-- SuggestedTwistedEulerTests.left_bad_level_prime_vanishes
example (ψ : DirichletCharacter ℚ_[2] 4) (e : ℕ) :
    (integralTwistedPositiveEisensteinMeasure 2 ψ (1 : DirichletCharacter ℚ_[2] 1) 2
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) e).toContinuousMap : ℚ_[2])=0 := sorry

end DyadicBadLevel

end

end SuggestedTwistedEulerTests

namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure MatrixGroups ModularForm PowerSeries.WithPiTopology

open Matrix.SpecialLinearGroup CongruenceSubgroup UpperHalfPlane

theorem twistedDivisorSum_ringHomComp {R S : Type*} [CommRing R] [CommRing S]
    (j : R →+* S) {D E : ℕ} (ψ : DirichletCharacter R D) (φ : DirichletCharacter R E)
    (e n : ℕ) :
    j (DirichletCharacter.twistedDivisorSum e ψ φ n)=
      DirichletCharacter.twistedDivisorSum e (ψ.ringHomComp j) (φ.ringHomComp j) n := sorry

variable (p : ℕ) [Fact p.Prime]

variable {F K : Type*} [Field F] [NormedField K] [IsUltrametricDist K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

variable (ιC : F →+* ℂ) (ιK : F →+* K) {D E N : ℕ} [NeZero N]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

theorem integralTwistedPositiveEisensteinSeries_classical_positive
    (ψ : DirichletCharacter F D) (φ : DirichletCharacter F E) (k : ℕ)
    (f : ModularForm ((Gamma1 N).map (mapGL ℝ)) (k : ℤ))
    (hf : ∀ n : ℕ+, (qExpansion 1 f).coeff (n : ℕ)=
      ιC (DirichletCharacter.twistedDivisorSum (k-1) ψ φ (n : ℕ))) :
    let g : ModularForm ((Gamma1 (p*N)).map (mapGL ℝ)) (k : ℤ) :=
      ModularForm.ofLe (Gamma1_map_le_Gamma1_map_of_dvd (dvd_mul_left N p)) f-
        ιC (φ p*(p : F)^(k-1)) •
          TauCeti.ModularForm.levelRaise p (TauCeti.Gamma1_map_le_conjAct_scaleGL N p) f
    ∃! Q : PowerSeries F,
      PowerSeries.map ιC Q=qExpansion 1 g-PowerSeries.C ((qExpansion 1 g).coeff 0) ∧
      PowerSeries.map ιK Q=
        PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
          (integralTwistedPositiveEisensteinSeries p (ψ.ringHomComp ιK) (φ.ringHomComp ιK)
            (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) (k-1)).toContinuousMap) := sorry

theorem integralTwistedPositiveEisensteinSeries_classical_full
    (ψ : DirichletCharacter F D) (φ : DirichletCharacter F E) (k : ℕ)
    (f : ModularForm ((Gamma1 N).map (mapGL ℝ)) (k : ℤ))
    (hf : ∀ n : ℕ+, (qExpansion 1 f).coeff (n : ℕ)=
      ιC (DirichletCharacter.twistedDivisorSum (k-1) ψ φ (n : ℕ)))
    (c : F) (h0 : (qExpansion 1 f).coeff 0=ιC c) :
    let g : ModularForm ((Gamma1 (p*N)).map (mapGL ℝ)) (k : ℤ) :=
      ModularForm.ofLe (Gamma1_map_le_Gamma1_map_of_dvd (dvd_mul_left N p)) f-
        ιC (φ p*(p : F)^(k-1)) •
          TauCeti.ModularForm.levelRaise p (TauCeti.Gamma1_map_le_conjAct_scaleGL N p) f
    ∃! Q : PowerSeries F,
      PowerSeries.map ιC Q=qExpansion 1 g ∧
      PowerSeries.map ιK Q=PowerSeries.C (ιK ((1-φ p*(p : F)^(k-1))*c))+
        PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
          (integralTwistedPositiveEisensteinSeries p (ψ.ringHomComp ιK) (φ.ringHomComp ιK)
            (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) (k-1)).toContinuousMap) := sorry

end

end DirichletPadic

namespace SuggestedClassicalTwistedTests
noncomputable section
open scoped AbstractMeasure MatrixGroups ModularForm PowerSeries.WithPiTopology

open Matrix.SpecialLinearGroup CongruenceSubgroup UpperHalfPlane DirichletPadic

section Algebra
variable {F K : Type*} [Field F] [NormedField K] [IsUltrametricDist K]

variable (ιK : F →+* K) {D E : ℕ}

-- SuggestedClassicalTwistedTests.identity_preserves_native_divisor_sum
example (ψ : DirichletCharacter F D) (φ : DirichletCharacter F E) (e n : ℕ) :
    DirichletCharacter.twistedDivisorSum e (ψ.ringHomComp (RingHom.id F))
      (φ.ringHomComp (RingHom.id F)) n=DirichletCharacter.twistedDivisorSum e ψ φ n := sorry

-- SuggestedClassicalTwistedTests.embedding_preserves_native_zero
example (ψ : DirichletCharacter F D) (φ : DirichletCharacter F E) (e : ℕ) :
    ιK (DirichletCharacter.twistedDivisorSum e ψ φ 0)=0 := sorry

-- SuggestedClassicalTwistedTests.nonreal_prime_value_survives_embedding
example [Algebra ℤ_[2] K] [IsBoundedSMul ℤ_[2] K]
    (i : F) (hi : i^2=-1) (ψ : DirichletCharacter F 5) (hψ : ψ 2=i) :
    (integralTwistedPositiveEisensteinMeasure 2 (ψ.ringHomComp ιK)
      ((1 : DirichletCharacter F 1).ringHomComp ιK) 2
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter K (2^0)) 2).toContinuousMap : K)=ιK i := sorry

end Algebra

section Common
variable {p : ℕ} [Fact p.Prime] {F K : Type*} [Field F] [NormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

variable (ιC : F →+* ℂ) (ιK : F →+* K) {D E N : ℕ} [NeZero N]

-- SuggestedClassicalTwistedTests.common_positive_zero_constant
example (Q : PowerSeries F) (k : ℕ)
    (g : ModularForm ((Gamma1 N).map (mapGL ℝ)) (k : ℤ))
    (hQ : PowerSeries.map ιC Q=qExpansion 1 g-PowerSeries.C ((qExpansion 1 g).coeff 0)) :
    Q.coeff 0=0 := sorry

-- SuggestedClassicalTwistedTests.common_positive_first_coefficient
example (ψ : DirichletCharacter F D) (φ : DirichletCharacter F E) (e : ℕ)
    (Q : PowerSeries F)
    (hQ : PowerSeries.map ιK Q=
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
        (integralTwistedPositiveEisensteinSeries p (ψ.ringHomComp ιK) (φ.ringHomComp ιK)
          (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap)) :
    Q.coeff 1=1 := sorry

-- SuggestedClassicalTwistedTests.one_embedding_already_determines_common_series
example (Q Q' : PowerSeries F) (h : PowerSeries.map ιC Q=PowerSeries.map ιC Q') : Q=Q' := sorry

-- SuggestedClassicalTwistedTests.supplied_constant_has_euler_factor
example (ψ : DirichletCharacter F D) (φ : DirichletCharacter F E) (e : ℕ)
    (c : F) (Q : PowerSeries F)
    (hQ : PowerSeries.map ιK Q=PowerSeries.C (ιK ((1-φ p*(p : F)^e)*c))+
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
        (integralTwistedPositiveEisensteinSeries p (ψ.ringHomComp ιK) (φ.ringHomComp ιK)
          (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap)) :
    Q.coeff 0=(1-φ p*(p : F)^e)*c := sorry

end Common

-- SuggestedClassicalTwistedTests.fixed_weight_constant_can_be_nonintegral
example : ‖(-7/240 : ℚ_[2])‖>1 := sorry

-- SuggestedClassicalTwistedTests.zero_truncation_cannot_supply_full_constant
example (Q : PowerSeries ℚ) (hQ : Q.coeff 0=(-7/240 : ℚ)) :
    Q≠Q-PowerSeries.C (Q.coeff 0) := sorry

end

end SuggestedClassicalTwistedTests

namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure BigOperators PowerSeries.WithPiTopology

variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

local notation "iMap" => (ContinuousMap.mk Subtype.val continuous_subtype_val : C(O,K))

local notation "xO" => ContinuousMonoidHom.toContinuousMap
  (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) 1)

local notation "xK" => ContinuousMonoidHom.toContinuousMap
  (primePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) 1)

def integralDoubledTameEisensteinSeries (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    AbstractMeasure U O (PowerSeries O) := sorry

lemma integralDoubledTameEisensteinSeries_apply (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (f : C(U,O)) :
    integralDoubledTameEisensteinSeries η hD hpD f=
      PowerSeries.C (intrinsicIntegralTameZetaMeasure η hD hpD (xO*f))+
        (2 : O) • integralTwistedPositiveEisensteinSeries p
          (1 : DirichletCharacter K 1) η f := sorry

lemma integralDoubledTameEisensteinSeries_zero (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    integralDoubledTameEisensteinSeries η hD hpD 0=0 := sorry

lemma integralDoubledTameEisensteinSeries_add (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (f g : C(U,O)) :
    integralDoubledTameEisensteinSeries η hD hpD (f+g)=
      integralDoubledTameEisensteinSeries η hD hpD f+
        integralDoubledTameEisensteinSeries η hD hpD g := sorry

lemma integralDoubledTameEisensteinSeries_smul (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (a : O) (f : C(U,O)) :
    integralDoubledTameEisensteinSeries η hD hpD (a • f)=
      a • integralDoubledTameEisensteinSeries η hD hpD f := sorry

lemma integralDoubledTameEisensteinSeries_continuous (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    Continuous (integralDoubledTameEisensteinSeries η hD hpD) := sorry

lemma integralDoubledTameEisensteinSeries_one_level (η : DirichletCharacter K 1)
    (hD : IsUnit ((1 : ℕ) : K)) (hpD : ¬p∣1) :
    integralDoubledTameEisensteinSeries η hD hpD=
      (2 : O) • integralTwistedPositiveEisensteinSeries p
        (1 : DirichletCharacter K 1) η := sorry

theorem integralDoubledTameEisensteinSeries_coeff (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (f : C(U,O)) (n : ℕ) :
    PowerSeries.coeff n (integralDoubledTameEisensteinSeries η hD hpD f)=
      if hn : 0<n then (2 : O)*integralTwistedPositiveEisensteinMeasure p
        (1 : DirichletCharacter K 1) η ⟨n,hn⟩ f
      else intrinsicIntegralTameZetaMeasure η hD hpD (xO*f) := sorry

lemma integralDoubledTameEisensteinSeries_unique (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (M : AbstractMeasure U O (PowerSeries O))
    (h0 : ∀ f, PowerSeries.coeff 0 (M f)=
      intrinsicIntegralTameZetaMeasure η hD hpD (xO*f))
    (hpos : ∀ f (n : ℕ+), PowerSeries.coeff (n : ℕ) (M f)=
      (2 : O)*integralTwistedPositiveEisensteinMeasure p
        (1 : DirichletCharacter K 1) η n f) :
    M=integralDoubledTameEisensteinSeries η hD hpD := sorry

theorem integralDoubledTameEisensteinSeries_coeff_norm_le (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (f : C(U,O)) (n : ℕ) :
    ‖PowerSeries.coeff n (integralDoubledTameEisensteinSeries η hD hpD f)‖≤‖f‖ := sorry

theorem integralDoubledTameEisensteinSeries_normalize [CharZero K]
    (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (f : C(U,O)) :
    (2 : K)⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
      (integralDoubledTameEisensteinSeries η hD hpD f)=
    PowerSeries.C ((2 : K)⁻¹*intrinsicTameZetaMeasure η hD hpD (xK*((iMap).comp f)))+
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
        (integralTwistedPositiveEisensteinSeries p (1 : DirichletCharacter K 1) η f) := sorry

theorem integralDoubledTameEisensteinSeries_common_constant [CharZero K] [Algebra ℚ K]
    {E : Type*} [Field E] [CharZero E] [Algebra ℚ E]
    (n : ℕ) (χ : DirichletCharacter E (p^n)) (η : DirichletCharacter E D) (hη : η≠1)
    (ιC : E →+* ℂ) (ιK : E →+* K) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (e : ℕ) :
    let θ : DirichletCharacter E (D*p^n) :=
      η.changeLevel (D.dvd_mul_right (p^n)) * χ.changeLevel ((p^n).dvd_mul_left D)
    let b : E := (1-θ (p : ZMod (D*p^n))*(p : E)^e) *
      (-((D*p^n : ℕ) : E)^e/(e+1) * ∑ a : ZMod (D*p^n), θ a *
        algebraMap ℚ E ((Polynomial.bernoulli (e+1)).eval (a.val/(D*p^n) : ℚ)))
    ιC b = (1-(θ.ringHomComp ιC) (p : ZMod (D*p^n))*(p : ℂ)^e) *
      DirichletCharacter.LFunction (θ.ringHomComp ιC) (-(e : ℂ)) ∧
    ιK b = (PowerSeries.coeff (R := O) 0
      (integralDoubledTameEisensteinSeries (η.ringHomComp ιK) hD hpD
        (integralPrimePowerArithmeticCharacter p n (χ.ringHomComp ιK) e).toContinuousMap) : K) := sorry

end

end DirichletPadic

namespace SuggestedTameFullSeriesTests
noncomputable section
open scoped PowerSeries.WithPiTopology

open DirichletPadic

section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

-- SuggestedTameFullSeriesTests.zero_test
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    integralDoubledTameEisensteinSeries η hD hpD 0=0 := sorry

-- SuggestedTameFullSeriesTests.first_positive_coefficient
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    PowerSeries.coeff 1 (integralDoubledTameEisensteinSeries η hD hpD 1)=(2 : O) := sorry

-- SuggestedTameFullSeriesTests.level_one_positive_only
example (η : DirichletCharacter K 1) (hD : IsUnit ((1 : ℕ) : K)) (hpD : ¬p∣1) :
    integralDoubledTameEisensteinSeries η hD hpD=
      (2 : O) • integralTwistedPositiveEisensteinSeries p
        (1 : DirichletCharacter K 1) η := sorry

-- SuggestedTameFullSeriesTests.level_one_constant_zero
example (η : DirichletCharacter K 1) (hD : IsUnit ((1 : ℕ) : K)) (hpD : ¬p∣1)
    (f : C(U,O)) :
    PowerSeries.coeff 0 (integralDoubledTameEisensteinSeries η hD hpD f)=0 := sorry

-- SuggestedTameFullSeriesTests.all_coefficients_bounded
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (f : C(U,O)) (n : ℕ) :
    ‖PowerSeries.coeff n (integralDoubledTameEisensteinSeries η hD hpD f)‖≤‖f‖ := sorry

-- SuggestedTameFullSeriesTests.normalized_positive_coefficient
example [CharZero K] (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (f : C(U,O)) (n : ℕ+) :
    PowerSeries.coeff (n : ℕ)
      ((2 : K)⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
        (integralDoubledTameEisensteinSeries η hD hpD f))=
      (integralTwistedPositiveEisensteinMeasure p (1 : DirichletCharacter K 1) η n f : K) := sorry

end General

section Dyadic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

variable (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
  (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2∣3)

local notation "O2" => Valuation.integer (NormedField.valuation (K := ℚ_[2]))

include hη

-- SuggestedTameFullSeriesTests.dyadic_constant_at_exponent_zero
example : (PowerSeries.coeff (R := O2) 0 (integralDoubledTameEisensteinSeries η hD hpD
    (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 0).toContinuousMap)
      : ℚ_[2])=2/3 := sorry

-- SuggestedTameFullSeriesTests.dyadic_constant_at_exponent_one
example : PowerSeries.coeff 0 (integralDoubledTameEisensteinSeries η hD hpD
    (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap)=0 := sorry

-- SuggestedTameFullSeriesTests.dyadic_constant_at_exponent_two
example : (PowerSeries.coeff (R := O2) 0 (integralDoubledTameEisensteinSeries η hD hpD
    (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 2).toContinuousMap)
      : ℚ_[2])=-10/9 := sorry

-- SuggestedTameFullSeriesTests.dyadic_normalized_constant
example : PowerSeries.coeff 0 ((2 : ℚ_[2])⁻¹ • PowerSeries.map
    (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
    (integralDoubledTameEisensteinSeries η hD hpD
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 0).toContinuousMap))=1/3 := sorry

-- SuggestedTameFullSeriesTests.dyadic_wild_constant
example (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) :
    (PowerSeries.coeff (R := O2) 0 (integralDoubledTameEisensteinSeries η hD hpD
      (integralPrimePowerArithmeticCharacter 2 2 χ 1).toContinuousMap) : ℚ_[2])=-2 := sorry

-- SuggestedTameFullSeriesTests.dyadic_prime_coefficient_survives
example : PowerSeries.coeff 2 (integralDoubledTameEisensteinSeries η hD hpD
    (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap)
      =(2 : O2) := sorry

end Dyadic

end

end SuggestedTameFullSeriesTests

namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure BigOperators PowerSeries.WithPiTopology

open AbstractMeasure

variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

local notation "iMap" => (ContinuousMap.mk Subtype.val continuous_subtype_val : C(O,K))

theorem integralDoubledTameEisensteinSeries_constant_restriction
    (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (f : C(U,O)) :
    (PowerSeries.coeff (R := O) 0 (integralDoubledTameEisensteinSeries η hD hpD f) : K)=
      restrictUnits p K (tameMeasure η hD hpD) ((iMap).comp f) := sorry

theorem integralDoubledTameEisensteinSeries_constant_residue [CharZero K]
    (η : DirichletCharacter K D) (hη : η≠1) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (n : ℕ) (hn : 1≤n) (a : ZMod (p^n)) (ha : IsUnit a) :
    let q : C(U,ZMod (p^n)) := ⟨fun u => PadicInt.toZModPow n (u : ℤ_[p]),
      (PadicInt.continuous_toZModPow p n).comp Units.continuous_val⟩
    let f : C(U,O) := (ContinuousMap.equivFnOfDiscrete.symm
      (Function.update (fun _ : ZMod (p^n) => (0 : O)) a 1)).comp q
    (PowerSeries.coeff (R := O) 0 (integralDoubledTameEisensteinSeries η hD hpD f) : K)=
      -(↑hD.unit⁻¹ : K)*∑ j : ZMod D,
        η ((a.val+p^n*j.val : ℕ) : ZMod D)*(j.val : K) := sorry

end

end DirichletPadic

namespace DirichletPadic
noncomputable section
open scoped PowerSeries.WithPiTopology

variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

local notation "O2" => Valuation.integer (NormedField.valuation (K := ℚ_[2]))

local notation "U2" => (ℤ_[2])ˣ

local notation "q4" => (ContinuousMap.mk (fun u : U2 => PadicInt.toZModPow 2 (u : ℤ_[2]))
  (Continuous.comp (PadicInt.continuous_toZModPow 2 2) Units.continuous_val) : C(U2,ZMod (2^2)))

local notation "f4" => ContinuousMap.comp (ContinuousMap.equivFnOfDiscrete.symm
  (Function.update (fun _ : ZMod (2^2) => (0 : O2)) 1 1)) q4

theorem integralDoubledTameEisensteinSeries_dyadic_normalized_norm
    (η : DirichletCharacter ℚ_[2] 3) (hη : η 2=-1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2∣3) :
    ‖PowerSeries.coeff 0 ((2 : ℚ_[2])⁻¹ • PowerSeries.map
      (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
      (integralDoubledTameEisensteinSeries η hD hpD f4))‖=2 := sorry

theorem integralDoubledTameEisensteinSeries_no_integral_normalization
    (η : DirichletCharacter ℚ_[2] 3) (hη : η 2=-1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2∣3) :
    ¬ ∃ M : AbstractMeasure U2 O2 (PowerSeries O2),
      ∀ f : C(U2,O2), PowerSeries.map
        (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype (M f)=
        (2 : ℚ_[2])⁻¹ • PowerSeries.map
          (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
          (integralDoubledTameEisensteinSeries η hD hpD f) := sorry

end

end DirichletPadic

namespace SuggestedTameResidueTests
noncomputable section
open scoped PowerSeries.WithPiTopology

open DirichletPadic AbstractMeasure

section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

-- SuggestedTameResidueTests.constant_zero_test
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    (PowerSeries.coeff (R := O) 0 (integralDoubledTameEisensteinSeries η hD hpD 0) : K)=0 := sorry

-- SuggestedTameResidueTests.constant_mass_is_unit_mass
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    (PowerSeries.coeff (R := O) 0 (integralDoubledTameEisensteinSeries η hD hpD 1) : K)=
      restrictUnits p K (tameMeasure η hD hpD) 1 := sorry

end General

section Dyadic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

variable (η : DirichletCharacter ℚ_[2] 3) (hη : η 2=-1)
  (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2∣3)

local notation "O2" => Valuation.integer (NormedField.valuation (K := ℚ_[2]))

local notation "U2" => (ℤ_[2])ˣ

local notation "q4" => (ContinuousMap.mk (fun u : U2 => PadicInt.toZModPow 2 (u : ℤ_[2]))
  (Continuous.comp (PadicInt.continuous_toZModPow 2 2) Units.continuous_val) : C(U2,ZMod (2^2)))

local notation "f4" => ContinuousMap.comp (ContinuousMap.equivFnOfDiscrete.symm
  (Function.update (fun _ : ZMod (2^2) => (0 : O2)) 1 1)) q4

include hη

-- SuggestedTameResidueTests.dyadic_one_mod_four
example : (PowerSeries.coeff (R := O2) 0
    (integralDoubledTameEisensteinSeries η hD hpD f4) : ℚ_[2])=1/3 := sorry

-- SuggestedTameResidueTests.level_zero_residue_boundary
example : (PowerSeries.coeff (R := O2) 0
    (integralDoubledTameEisensteinSeries η hD hpD 1) : ℚ_[2])≠tameMeasure η hD hpD 1 := sorry

-- SuggestedTameResidueTests.nonunit_residue_boundary
example :
    let g : C(U2,O2) := (ContinuousMap.equivFnOfDiscrete.symm
      (Function.update (fun _ : ZMod (2^2) => (0 : O2)) 0 1)).comp q4
    (PowerSeries.coeff (R := O2) 0 (integralDoubledTameEisensteinSeries η hD hpD g) : ℚ_[2])≠
      finiteProjection (⟨PadicInt.toZModPow 2, PadicInt.continuous_toZModPow 2 2⟩ :
        C(ℤ_[2],ZMod (2^2))) (tameMeasure η hD hpD) 0 := sorry

-- SuggestedTameResidueTests.dyadic_normalized_one_mod_four
example : PowerSeries.coeff 0 ((2 : ℚ_[2])⁻¹ • PowerSeries.map
    (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
    (integralDoubledTameEisensteinSeries η hD hpD f4))=1/6 := sorry

-- SuggestedTameResidueTests.dyadic_normalized_norm_two
example : ‖PowerSeries.coeff 0 ((2 : ℚ_[2])⁻¹ • PowerSeries.map
    (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
    (integralDoubledTameEisensteinSeries η hD hpD f4))‖>1 := sorry

-- SuggestedTameResidueTests.dyadic_normalized_positive_first
example : PowerSeries.coeff 1 ((2 : ℚ_[2])⁻¹ • PowerSeries.map
    (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
    (integralDoubledTameEisensteinSeries η hD hpD f4))=1 := sorry

-- SuggestedTameResidueTests.no_integral_series_at_residue_test
example : ¬ ∃ H : PowerSeries O2,
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype H=
      (2 : ℚ_[2])⁻¹ • PowerSeries.map
        (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
        (integralDoubledTameEisensteinSeries η hD hpD f4) := sorry

-- SuggestedTameResidueTests.doubling_recovers_an_integral_series
example : ∃ H : PowerSeries O2,
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype H=
      (2 : ℚ_[2]) • ((2 : ℚ_[2])⁻¹ • PowerSeries.map
        (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
        (integralDoubledTameEisensteinSeries η hD hpD f4)) := sorry

end Dyadic

end

end SuggestedTameResidueTests

namespace DirichletPadic
noncomputable section
open scoped PowerSeries.WithPiTopology

variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

variable [CompleteSpace K] {D : ℕ} [NeZero D]

theorem integralDoubledTameEisensteinSeries_test_congruence
    (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (f g : C(U,O)) (b : O) (h : ∀ u, b∣g u-f u) :
    PowerSeries.C b ∣ integralDoubledTameEisensteinSeries η hD hpD g-
      integralDoubledTameEisensteinSeries η hD hpD f := sorry

theorem integralDoubledTameEisensteinSeries_weight_congruence
    (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (t r e e' : ℕ) (χ : DirichletCharacter K (p^t)) (hr : 1≤r)
    (he : Nat.ModEq (p^(r-1)*(p-1)) e e') :
    PowerSeries.C ((p : O)^r) ∣
      integralDoubledTameEisensteinSeries η hD hpD
        (integralPrimePowerArithmeticCharacter p t χ e').toContinuousMap-
      integralDoubledTameEisensteinSeries η hD hpD
        (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap := sorry

theorem integralDoubledTameEisensteinSeries_normalized_congruence [CharZero K]
    (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (f g : C(U,O)) (a : O) (h : ∀ u, 2*a∣g u-f u) :
    ∃ H : PowerSeries O,
      (2 : K)⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
        (integralDoubledTameEisensteinSeries η hD hpD g)-
      (2 : K)⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
        (integralDoubledTameEisensteinSeries η hD hpD f)=
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
        (PowerSeries.C a*H) := sorry

end

end DirichletPadic

namespace SuggestedTameCongruenceTests
noncomputable section
open DirichletPadic

open scoped PowerSeries.WithPiTopology

section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

variable (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)

-- SuggestedTameCongruenceTests.zero_modulus
example (f g : C(U,O)) (h : ∀ u, (0 : O)∣g u-f u) :
    integralDoubledTameEisensteinSeries η hD hpD g=
      integralDoubledTameEisensteinSeries η hD hpD f := sorry

-- SuggestedTameCongruenceTests.identical_tests
example (f : C(U,O)) (b : O) : PowerSeries.C b ∣
    integralDoubledTameEisensteinSeries η hD hpD f-
      integralDoubledTameEisensteinSeries η hD hpD f := sorry

-- SuggestedTameCongruenceTests.constant_included
example (f g : C(U,O)) (b : O) (h : ∀ u, b∣g u-f u) :
    b∣PowerSeries.coeff 0 (integralDoubledTameEisensteinSeries η hD hpD g)-
      PowerSeries.coeff 0 (integralDoubledTameEisensteinSeries η hD hpD f) := sorry

-- SuggestedTameCongruenceTests.normalized_zero_modulus
example [CharZero K] (f g : C(U,O)) (h : ∀ u, (0 : O)∣g u-f u) :
    (2 : K)⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
      (integralDoubledTameEisensteinSeries η hD hpD g)-
    (2 : K)⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
      (integralDoubledTameEisensteinSeries η hD hpD f)=0 := sorry

end General

section Dyadic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

local notation "O2" => Valuation.integer (NormedField.valuation (K := ℚ_[2]))

local notation "U2" => (ℤ_[2])ˣ

local notation "q4" => (ContinuousMap.mk (fun u : U2 => PadicInt.toZModPow 2 (u : ℤ_[2]))
  (Continuous.comp (PadicInt.continuous_toZModPow 2 2) Units.continuous_val) : C(U2,ZMod (2^2)))

local notation "f4" => ContinuousMap.comp (ContinuousMap.equivFnOfDiscrete.symm
  (Function.update (fun _ : ZMod (2^2) => (0 : O2)) 1 1)) q4

variable (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2∣3)

-- SuggestedTameCongruenceTests.dyadic_whole_eight
example (χ : DirichletCharacter ℚ_[2] (2^2)) :
    PowerSeries.C (8 : O2)∣integralDoubledTameEisensteinSeries η hD hpD
      (integralPrimePowerArithmeticCharacter 2 2 χ 5).toContinuousMap-
    integralDoubledTameEisensteinSeries η hD hpD
      (integralPrimePowerArithmeticCharacter 2 2 χ 1).toContinuousMap := sorry

-- SuggestedTameCongruenceTests.dyadic_constant_eight
example : (8 : O2)∣PowerSeries.coeff 0 (integralDoubledTameEisensteinSeries η hD hpD
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 4).toContinuousMap)-
    PowerSeries.coeff 0 (integralDoubledTameEisensteinSeries η hD hpD
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 0).toContinuousMap) := sorry

-- SuggestedTameCongruenceTests.wild_full_level_above_precision
example (χ : DirichletCharacter ℚ_[2] (2^3)) :
    PowerSeries.C (2 : O2)∣integralDoubledTameEisensteinSeries η hD hpD
      (integralPrimePowerArithmeticCharacter 2 3 χ 1).toContinuousMap-
    integralDoubledTameEisensteinSeries η hD hpD
      (integralPrimePowerArithmeticCharacter 2 3 χ 0).toContinuousMap := sorry

-- SuggestedTameCongruenceTests.dyadic_scaled_exact_precision
example (hη : η 2=-1) (s : ℕ) :
    ‖PowerSeries.coeff 0 ((2 : ℚ_[2])⁻¹ • PowerSeries.map
      (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
      (integralDoubledTameEisensteinSeries η hD hpD ((2 : O2)^(s+1) • f4)))‖=
      (2 : ℝ)^(-(s : ℤ)) := sorry

-- SuggestedTameCongruenceTests.dyadic_missing_factor_two
example (hη : η 2=-1) : ¬ ∃ H : PowerSeries O2,
    (2 : ℚ_[2])⁻¹ • PowerSeries.map
      (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
      (integralDoubledTameEisensteinSeries η hD hpD ((2 : O2) • f4))=
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
      (PowerSeries.C (2 : O2)*H) := sorry

end Dyadic

end

end SuggestedTameCongruenceTests

namespace DirichletPadic
noncomputable section
open scoped PowerSeries.WithPiTopology

variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

local notation "xO" => ContinuousMonoidHom.toContinuousMap
  (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) 1)

def integralTameEisensteinSeries (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (h2 : IsUnit (2 : O)) :
    AbstractMeasure U O (PowerSeries O) := sorry

lemma integralTameEisensteinSeries_apply (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (h2 : IsUnit (2 : O)) (f : C(U,O)) :
    integralTameEisensteinSeries η hD hpD h2 f=
      (↑h2.unit⁻¹ : O) • integralDoubledTameEisensteinSeries η hD hpD f := sorry

lemma integralTameEisensteinSeries_zero (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (h2 : IsUnit (2 : O)) :
    integralTameEisensteinSeries η hD hpD h2 0=0 := sorry

lemma integralTameEisensteinSeries_add (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (h2 : IsUnit (2 : O)) (f g : C(U,O)) :
    integralTameEisensteinSeries η hD hpD h2 (f+g)=
      integralTameEisensteinSeries η hD hpD h2 f+
        integralTameEisensteinSeries η hD hpD h2 g := sorry

lemma integralTameEisensteinSeries_smul (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (h2 : IsUnit (2 : O)) (a : O) (f : C(U,O)) :
    integralTameEisensteinSeries η hD hpD h2 (a • f)=
      a • integralTameEisensteinSeries η hD hpD h2 f := sorry

lemma integralTameEisensteinSeries_continuous (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (h2 : IsUnit (2 : O)) :
    Continuous (integralTameEisensteinSeries η hD hpD h2) := sorry

lemma integralTameEisensteinSeries_double (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (h2 : IsUnit (2 : O)) :
    (2 : O) • integralTameEisensteinSeries η hD hpD h2=
      integralDoubledTameEisensteinSeries η hD hpD := sorry

lemma integralTameEisensteinSeries_coeff (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (h2 : IsUnit (2 : O)) (f : C(U,O)) (n : ℕ) :
    PowerSeries.coeff n (integralTameEisensteinSeries η hD hpD h2 f)=
      if hn : 0<n then integralTwistedPositiveEisensteinMeasure p
        (1 : DirichletCharacter K 1) η ⟨n,hn⟩ f
      else (↑h2.unit⁻¹ : O)*intrinsicIntegralTameZetaMeasure η hD hpD (xO*f) := sorry

lemma integralTameEisensteinSeries_certificate_independent (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (h2 h2' : IsUnit (2 : O)) :
    integralTameEisensteinSeries η hD hpD h2=integralTameEisensteinSeries η hD hpD h2' := sorry

lemma integralTameEisensteinSeries_one_level (η : DirichletCharacter K 1)
    (hD : IsUnit ((1 : ℕ) : K)) (hpD : ¬p∣1) (h2 : IsUnit (2 : O)) :
    integralTameEisensteinSeries η hD hpD h2=
      integralTwistedPositiveEisensteinSeries p (1 : DirichletCharacter K 1) η := sorry

lemma integralTameEisensteinSeries_unique (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (h2 : IsUnit (2 : O))
    (M : AbstractMeasure U O (PowerSeries O))
    (hM : (2 : O) • M=integralDoubledTameEisensteinSeries η hD hpD) :
    M=integralTameEisensteinSeries η hD hpD h2 := sorry

theorem integralTameEisensteinSeries_map (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (h2 : IsUnit (2 : O)) (f : C(U,O)) :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
      (integralTameEisensteinSeries η hD hpD h2 f)=
      (2 : K)⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
        (integralDoubledTameEisensteinSeries η hD hpD f) := sorry

theorem integralTameEisensteinSeries_coeff_norm_le (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (h2 : IsUnit (2 : O)) (f : C(U,O)) (n : ℕ) :
    ‖PowerSeries.coeff n (integralTameEisensteinSeries η hD hpD h2 f)‖≤‖f‖ := sorry

theorem integralTameEisensteinSeries_test_congruence (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (h2 : IsUnit (2 : O))
    (f g : C(U,O)) (b : O) (h : ∀ u, b∣g u-f u) :
    PowerSeries.C b∣integralTameEisensteinSeries η hD hpD h2 g-
      integralTameEisensteinSeries η hD hpD h2 f := sorry

theorem integralTameEisensteinSeries_weight_congruence (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (h2 : IsUnit (2 : O))
    (t r e e' : ℕ) (χ : DirichletCharacter K (p^t)) (hr : 1≤r)
    (he : Nat.ModEq (p^(r-1)*(p-1)) e e') :
    PowerSeries.C ((p : O)^r)∣integralTameEisensteinSeries η hD hpD h2
        (integralPrimePowerArithmeticCharacter p t χ e').toContinuousMap-
      integralTameEisensteinSeries η hD hpD h2
        (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap := sorry

end

end DirichletPadic

namespace SuggestedTameNormalizationTests
noncomputable section
open DirichletPadic

open scoped PowerSeries.WithPiTopology

section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

variable (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
  (h2 : IsUnit (2 : O))

-- SuggestedTameNormalizationTests.odd_prime_certificate
example (hp : p≠2) : IsUnit (2 : O) := sorry

-- SuggestedTameNormalizationTests.normalized_zero
example : integralTameEisensteinSeries η hD hpD h2 0=0 := sorry

-- SuggestedTameNormalizationTests.normalized_one_level
example (η1 : DirichletCharacter K 1) (h1 : IsUnit ((1 : ℕ) : K)) (hp1 : ¬p∣1) :
    integralTameEisensteinSeries η1 h1 hp1 h2=
      integralTwistedPositiveEisensteinSeries p (1 : DirichletCharacter K 1) η1 := sorry

-- SuggestedTameNormalizationTests.positive_first
example (f : C(U,O)) : PowerSeries.coeff 1 (integralTameEisensteinSeries η hD hpD h2 f)=f 1 := sorry

-- SuggestedTameNormalizationTests.map_double
example (f : C(U,O)) :
    (2 : K) • PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
      (integralTameEisensteinSeries η hD hpD h2 f)=
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
      (integralDoubledTameEisensteinSeries η hD hpD f) := sorry

-- SuggestedTameNormalizationTests.map_zero
example : PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
    (integralTameEisensteinSeries η hD hpD h2 0)=0 := sorry

-- SuggestedTameNormalizationTests.constant_norm_bound
example (f : C(U,O)) : ‖PowerSeries.coeff 0 (integralTameEisensteinSeries η hD hpD h2 f)‖≤‖f‖ := sorry

-- SuggestedTameNormalizationTests.one_test_bound
example (n : ℕ) : ‖PowerSeries.coeff n (integralTameEisensteinSeries η hD hpD h2 1)‖≤1 := sorry

-- SuggestedTameNormalizationTests.zero_modulus
example (f g : C(U,O)) (h : ∀ u, (0 : O)∣g u-f u) :
    integralTameEisensteinSeries η hD hpD h2 g=integralTameEisensteinSeries η hD hpD h2 f := sorry

-- SuggestedTameNormalizationTests.normalized_constant_congruence
example (f g : C(U,O)) (b : O) (h : ∀ u, b∣g u-f u) :
    b∣PowerSeries.coeff 0 (integralTameEisensteinSeries η hD hpD h2 g)-
      PowerSeries.coeff 0 (integralTameEisensteinSeries η hD hpD h2 f) := sorry

-- SuggestedTameNormalizationTests.equal_weights
example (t e r : ℕ) (χ : DirichletCharacter K (p^t)) :
    PowerSeries.C ((p : O)^r)∣integralTameEisensteinSeries η hD hpD h2
      (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap-
    integralTameEisensteinSeries η hD hpD h2
      (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap := sorry

end General

section Triadic
variable [IsBoundedSMul ℤ_[3] ℚ_[3]]

local notation "O3" => Valuation.integer (NormedField.valuation (K := ℚ_[3]))

variable (η : DirichletCharacter ℚ_[3] 4) (hD : IsUnit (4 : ℚ_[3]))
  (hpD : ¬3∣4) (h2 : IsUnit (2 : O3))

-- SuggestedTameNormalizationTests.triadic_constant_half
example (hη : η 3=-1) :
    (PowerSeries.coeff (R := O3) 0 (integralTameEisensteinSeries η hD hpD h2 1) : ℚ_[3])=1/2 := sorry

-- SuggestedTameNormalizationTests.triadic_weights_mod_nine
example (χ : DirichletCharacter ℚ_[3] (3^3)) :
    PowerSeries.C (9 : O3)∣integralTameEisensteinSeries η hD hpD h2
      (integralPrimePowerArithmeticCharacter 3 3 χ 7).toContinuousMap-
    integralTameEisensteinSeries η hD hpD h2
      (integralPrimePowerArithmeticCharacter 3 3 χ 1).toContinuousMap := sorry

end Triadic

-- SuggestedTameNormalizationTests.dyadic_two_not_unit
example : ¬IsUnit (2 : Valuation.integer (NormedField.valuation (K := ℚ_[2]))) := sorry

end

end SuggestedTameNormalizationTests

namespace DirichletPadic
noncomputable section
open scoped PowerSeries.WithPiTopology

variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] [CharZero K] {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

theorem integralDoubledTameEisensteinSeries_unit_constant_witness
    (η : DirichletCharacter K D) (hη : η≠1) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (n : ℕ) (hn : 1≤n) (hlarge : 2*D≤p^n) :
    let q : C(U,ZMod (p^n)) := ⟨fun u => PadicInt.toZModPow n (u : ℤ_[p]),
      (PadicInt.continuous_toZModPow p n).comp Units.continuous_val⟩
    let e : ZMod (p^n) → C(U,O) := fun a =>
      (ContinuousMap.equivFnOfDiscrete.symm
        (Function.update (fun _ : ZMod (p^n) => (0 : O)) a 1)).comp q
    ∃ b : ZMod (p^n), IsUnit b ∧
      (PowerSeries.coeff (R := O) 0
        (integralDoubledTameEisensteinSeries η hD hpD (e b-e 1)) : K)=-1 := sorry

theorem integralDoubledTameEisensteinSeries_scalar_lift_iff
    (η : DirichletCharacter K D) (hη : η≠1) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (s : K) :
    (∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype (M f)=
        s • PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
          (integralDoubledTameEisensteinSeries η hD hpD f)) ↔ ‖s‖≤1 := sorry

end

end DirichletPadic

namespace DirichletPadic
noncomputable section
open scoped PowerSeries.WithPiTopology

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K]
  [Algebra ℤ_[2] K] [IsBoundedSMul ℤ_[2] K] [CompleteSpace K] [CharZero K]
  {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[2])ˣ

theorem integralDoubledTameEisensteinSeries_dyadic_no_normalization
    (η : DirichletCharacter K D) (hη : η≠1) (hD : IsUnit (D : K)) (hpD : ¬2∣D) :
    ¬ ∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype (M f)=
        (2 : K)⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
          (integralDoubledTameEisensteinSeries η hD hpD f) := sorry

end

end DirichletPadic

namespace SuggestedTameScalarTests
noncomputable section
open DirichletPadic AbstractMeasure

open scoped PowerSeries.WithPiTopology

section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] [CharZero K] {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

variable (η : DirichletCharacter K D) (hη : η≠1) (hD : IsUnit (D : K)) (hpD : ¬p∣D)

include hη in

-- SuggestedTameScalarTests.actual_test_witness
example : ∃ f : C(U,O),
    (PowerSeries.coeff (R := O) 0 (integralDoubledTameEisensteinSeries η hD hpD f) : K)=-1 := sorry

-- SuggestedTameScalarTests.scalar_zero
example : ∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype (M f)=
      (0 : K) • PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
        (integralDoubledTameEisensteinSeries η hD hpD f) := sorry

-- SuggestedTameScalarTests.scalar_negative_one
example : ∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype (M f)=
      (-1 : K) • PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
        (integralDoubledTameEisensteinSeries η hD hpD f) := sorry

-- SuggestedTameScalarTests.principal_one_level_exception
example (η1 : DirichletCharacter K 1) (h1 : IsUnit ((1 : ℕ) : K)) (hp1 : ¬p∣1) :
    ∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype (M f)=
        (2 : K)⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
          (integralDoubledTameEisensteinSeries η1 h1 hp1 f) := sorry

end General

section Dyadic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

local notation "O2" => Valuation.integer (NormedField.valuation (K := ℚ_[2]))

local notation "U2" => (ℤ_[2])ˣ

-- SuggestedTameScalarTests.modulus_five_unit_witness
example (η : DirichletCharacter ℚ_[2] 5) (hη : η 2=-1)
    (hD : IsUnit (5 : ℚ_[2])) (hpD : ¬2∣5) :
    let q : C(U2,ZMod (2^4)) := ⟨fun u => PadicInt.toZModPow 4 (u : ℤ_[2]),
      (PadicInt.continuous_toZModPow 2 4).comp Units.continuous_val⟩
    let e : ZMod (2^4) → C(U2,O2) := fun a => (ContinuousMap.equivFnOfDiscrete.symm
      (Function.update (fun _ : ZMod (2^4) => (0 : O2)) a 1)).comp q
    (PowerSeries.coeff (R := O2) 0 (integralDoubledTameEisensteinSeries η hD hpD (e 7-e 1)) : ℚ_[2])=-1 := sorry

-- SuggestedTameScalarTests.modulus_five_no_normalization
example (η : DirichletCharacter ℚ_[2] 5) (hη : η 2=-1)
    (hD : IsUnit (5 : ℚ_[2])) (hpD : ¬2∣5) :
    ¬ ∃ M : AbstractMeasure U2 O2 (PowerSeries O2), ∀ f : C(U2,O2),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype (M f)=
        (2 : ℚ_[2])⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
          (integralDoubledTameEisensteinSeries η hD hpD f) := sorry

-- SuggestedTameScalarTests.imprimitive_nine_no_normalization
example (χ : DirichletCharacter ℚ_[2] 3) (hχ : χ 2=-1)
    (hD : IsUnit (9 : ℚ_[2])) (hpD : ¬2∣9) :
    ¬ ∃ M : AbstractMeasure U2 O2 (PowerSeries O2), ∀ f : C(U2,O2),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype (M f)=
        (2 : ℚ_[2])⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
          (integralDoubledTameEisensteinSeries
            (χ.changeLevel (by decide : 3∣9)) hD hpD f) := sorry

end Dyadic

end

end SuggestedTameScalarTests

namespace DirichletPadic
noncomputable section
open scoped PowerSeries.WithPiTopology

variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

theorem integralDoubledTameEisensteinSeries_character_bound
    (η0 η1 : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (B : ℝ) (hB : 0≤B) (hη : ∀ a, ‖η0 a-η1 a‖≤B) (f : C(U,O)) (n : ℕ) :
    ‖(PowerSeries.coeff (R := O) n (integralDoubledTameEisensteinSeries η0 hD hpD f) : K)-
      (PowerSeries.coeff (R := O) n (integralDoubledTameEisensteinSeries η1 hD hpD f) : K)‖≤B*‖f‖ := sorry

theorem integralDoubledTameEisensteinSeries_near_scalar_lift_iff [CharZero K]
    (η0 η1 : DirichletCharacter K D) (hη1 : η1≠1)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (B : ℝ) (hB : 0≤B) (hsmall : B<1)
    (hη : ∀ a, ‖η0 a-η1 a‖≤B) (s : K) :
    (∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype (M f)=
        s • PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
          (integralDoubledTameEisensteinSeries η0 hD hpD f)) ↔ ‖s‖≤1 := sorry

end

end DirichletPadic

namespace SuggestedTameVariationTests
noncomputable section
open DirichletPadic AbstractMeasure

open scoped PowerSeries.WithPiTopology

section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

variable (η0 η1 : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)

-- SuggestedTameVariationTests.constant_variation
example (B : ℝ) (hB : 0≤B) (hη : ∀ a, ‖η0 a-η1 a‖≤B) (f : C(U,O)) :
    ‖(PowerSeries.coeff (R := O) 0 (integralDoubledTameEisensteinSeries η0 hD hpD f) : K)-
      (PowerSeries.coeff (R := O) 0 (integralDoubledTameEisensteinSeries η1 hD hpD f) : K)‖≤B*‖f‖ := sorry

-- SuggestedTameVariationTests.first_coefficient_independent
example (f : C(U,O)) :
    PowerSeries.coeff 1 (integralDoubledTameEisensteinSeries η0 hD hpD f)=
      PowerSeries.coeff 1 (integralDoubledTameEisensteinSeries η1 hD hpD f) := sorry

-- SuggestedTameVariationTests.zero_test
example (n : ℕ) : PowerSeries.coeff n (integralDoubledTameEisensteinSeries η0 hD hpD 0)-
    PowerSeries.coeff n (integralDoubledTameEisensteinSeries η1 hD hpD 0)=0 := sorry

-- SuggestedTameVariationTests.stable_unit_constant
example [CharZero K] (hη1 : η1≠1) (B : ℝ) (hB : 0≤B) (hsmall : B<1)
    (hη : ∀ a, ‖η0 a-η1 a‖≤B) : ∃ f : C(U,O),
    ‖(PowerSeries.coeff (R := O) 0 (integralDoubledTameEisensteinSeries η0 hD hpD f) : K)‖=1 := sorry

-- SuggestedTameVariationTests.radius_one_not_enough
example : ‖(0 : K)-(-1)‖≤1 ∧ ‖(0 : K)‖≠‖(-1 : K)‖ := sorry

end General

section Dyadic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

local notation "O2" => Valuation.integer (NormedField.valuation (K := ℚ_[2]))

local notation "U2" => (ℤ_[2])ˣ

-- SuggestedTameVariationTests.principal_three_scalar_criterion
example (χ : DirichletCharacter ℚ_[2] 3) (hχ : χ 2=-1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2∣3) (s : ℚ_[2]) :
    (∃ M : AbstractMeasure U2 O2 (PowerSeries O2), ∀ f : C(U2,O2),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype (M f)=
        s • PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
          (integralDoubledTameEisensteinSeries (1 : DirichletCharacter ℚ_[2] 3) hD hpD f)) ↔ ‖s‖≤1 := sorry

-- SuggestedTameVariationTests.principal_three_no_half
example (χ : DirichletCharacter ℚ_[2] 3) (hχ : χ 2=-1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2∣3) :
    ¬ ∃ M : AbstractMeasure U2 O2 (PowerSeries O2), ∀ f : C(U2,O2),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype (M f)=
        (2 : ℚ_[2])⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
          (integralDoubledTameEisensteinSeries (1 : DirichletCharacter ℚ_[2] 3) hD hpD f) := sorry

end Dyadic

end

end SuggestedTameVariationTests

namespace DirichletPadic
noncomputable section
open scoped PowerSeries.WithPiTopology

section Dyadic
variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CharZero K]
  [Algebra ℤ_[2] K] [IsBoundedSMul ℤ_[2] K] [CompleteSpace K]
  {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[2])ˣ

theorem integralDoubledTameEisensteinSeries_dyadic_scalar_lift_iff
    (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬2∣D)
    (hD1 : D≠1) (s : K) :
    (∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype (M f)=
        s • PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
          (integralDoubledTameEisensteinSeries η hD hpD f)) ↔ ‖s‖≤1 := sorry

end Dyadic

section OneLevel
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [CompleteSpace K]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

theorem integralDoubledTameEisensteinSeries_one_level_scalar_lift_iff
    (η : DirichletCharacter K 1) (hD : IsUnit ((1 : ℕ) : K)) (hpD : ¬p∣1) (s : K) :
    (∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype (M f)=
        s • PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
          (integralDoubledTameEisensteinSeries η hD hpD f)) ↔ ‖(2 : K)*s‖≤1 := sorry

end OneLevel

section Half
variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CharZero K]
  [Algebra ℤ_[2] K] [IsBoundedSMul ℤ_[2] K] [CompleteSpace K]
  {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[2])ˣ

theorem integralDoubledTameEisensteinSeries_dyadic_half_lift_iff
    (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬2∣D) :
    (∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype (M f)=
        (2 : K)⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
          (integralDoubledTameEisensteinSeries η hD hpD f)) ↔ D=1 := sorry

end Half

end

end DirichletPadic

namespace SuggestedDyadicClassificationTests
noncomputable section
open DirichletPadic

open scoped PowerSeries.WithPiTopology

section Dyadic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

local notation "O" => Valuation.integer (NormedField.valuation (K := ℚ_[2]))

local notation "U" => (ℤ_[2])ˣ

-- SuggestedDyadicClassificationTests.principal_three_unconditional
example (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2∣3) (s : ℚ_[2]) :
    (∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype (M f)=
        s • PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
          (integralDoubledTameEisensteinSeries (1 : DirichletCharacter ℚ_[2] 3) hD hpD f)) ↔ ‖s‖≤1 := sorry

-- SuggestedDyadicClassificationTests.principal_nine_unconditional
example (hD : IsUnit (9 : ℚ_[2])) (hpD : ¬2∣9) (s : ℚ_[2]) :
    (∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype (M f)=
        s • PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
          (integralDoubledTameEisensteinSeries (1 : DirichletCharacter ℚ_[2] 9) hD hpD f)) ↔ ‖s‖≤1 := sorry

-- SuggestedDyadicClassificationTests.arbitrary_character_zero_scalar
example {D : ℕ} [NeZero D] (η : DirichletCharacter ℚ_[2] D)
    (hD : IsUnit (D : ℚ_[2])) (hpD : ¬2∣D) :
    ∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype (M f)=
        (0 : ℚ_[2]) • PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
          (integralDoubledTameEisensteinSeries η hD hpD f) := sorry

-- SuggestedDyadicClassificationTests.one_half_lift
example (η : DirichletCharacter ℚ_[2] 1) (hD : IsUnit ((1 : ℕ) : ℚ_[2])) (hpD : ¬2∣1) :
    ∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype (M f)=
        (2 : ℚ_[2])⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
          (integralDoubledTameEisensteinSeries η hD hpD f) := sorry

-- SuggestedDyadicClassificationTests.one_quarter_no_lift
example (η : DirichletCharacter ℚ_[2] 1) (hD : IsUnit ((1 : ℕ) : ℚ_[2])) (hpD : ¬2∣1) :
    ¬∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype (M f)=
        (4 : ℚ_[2])⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
          (integralDoubledTameEisensteinSeries η hD hpD f) := sorry

-- SuggestedDyadicClassificationTests.one_half_scalar_is_not_integral
example : 1<‖(2 : ℚ_[2])⁻¹‖ ∧ ‖(2 : ℚ_[2])*(2 : ℚ_[2])⁻¹‖≤1 := sorry

-- SuggestedDyadicClassificationTests.principal_five_no_half
example (hD : IsUnit (5 : ℚ_[2])) (hpD : ¬2∣5) :
    ¬∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype (M f)=
        (2 : ℚ_[2])⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
          (integralDoubledTameEisensteinSeries (1 : DirichletCharacter ℚ_[2] 5) hD hpD f) := sorry

-- SuggestedDyadicClassificationTests.every_fifteen_no_half
example (η : DirichletCharacter ℚ_[2] 15) (hD : IsUnit (15 : ℚ_[2])) (hpD : ¬2∣15) :
    ¬∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype (M f)=
        (2 : ℚ_[2])⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
          (integralDoubledTameEisensteinSeries η hD hpD f) := sorry

end Dyadic

end

end SuggestedDyadicClassificationTests

namespace DirichletPadic
noncomputable section
open scoped PowerSeries.WithPiTopology

variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

theorem integralTameEisensteinSeries_scalar_lift_iff
    (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (h2 : IsUnit (2 : O)) (s : K) :
    (∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype (M f)=
        s • PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
          (integralTameEisensteinSeries η hD hpD h2 f)) ↔ ‖s‖≤1 := sorry

theorem integralDoubledTameEisensteinSeries_all_prime_scalar_lift_iff [CharZero K]
    (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) (s : K) :
    (∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype (M f)=
        s • PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
          (integralDoubledTameEisensteinSeries η hD hpD f)) ↔
      (if D=1 then ‖(2 : K)*s‖≤1 else ‖s‖≤1) := sorry

theorem integralDoubledTameEisensteinSeries_half_lift_iff [CharZero K]
    (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    (∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype (M f)=
        (2 : K)⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
          (integralDoubledTameEisensteinSeries η hD hpD f)) ↔ (p≠2 ∨ D=1) := sorry

end

end DirichletPadic

namespace SuggestedAllPrimeScalarTests
noncomputable section
open DirichletPadic

open scoped PowerSeries.WithPiTopology

section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

variable (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)

-- SuggestedAllPrimeScalarTests.normalized_first_unit
example (h2 : IsUnit (2 : O)) :
    PowerSeries.coeff 1 (integralTameEisensteinSeries η hD hpD h2 1)=1 := sorry

-- SuggestedAllPrimeScalarTests.normalized_zero_scalar
example (h2 : IsUnit (2 : O)) :
    ∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype (M f)=
        (0 : K) • PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
          (integralTameEisensteinSeries η hD hpD h2 f) := sorry

-- SuggestedAllPrimeScalarTests.nontrivial_level_half_iff_odd
example [CharZero K] (hD1 : D≠1) :
    (∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype (M f)=
        (2 : K)⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
          (integralDoubledTameEisensteinSeries η hD hpD f)) ↔ p≠2 := sorry

end General

section Triadic
variable [IsBoundedSMul ℤ_[3] ℚ_[3]]

local notation "O" => Valuation.integer (NormedField.valuation (K := ℚ_[3]))

local notation "U" => (ℤ_[3])ˣ

-- SuggestedAllPrimeScalarTests.normalized_third_no_lift
example (hD : IsUnit (4 : ℚ_[3])) (hpD : ¬3∣4) (h2 : IsUnit (2 : O)) :
    ¬∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[3]))).subtype (M f)=
        (3 : ℚ_[3])⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[3]))).subtype
          (integralTameEisensteinSeries (1 : DirichletCharacter ℚ_[3] 4) hD hpD h2 f) := sorry

-- SuggestedAllPrimeScalarTests.triadic_principal_scalar
example (hD : IsUnit (4 : ℚ_[3])) (hpD : ¬3∣4) (s : ℚ_[3]) :
    (∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[3]))).subtype (M f)=
        s • PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[3]))).subtype
          (integralDoubledTameEisensteinSeries (1 : DirichletCharacter ℚ_[3] 4) hD hpD f)) ↔ ‖s‖≤1 := sorry

-- SuggestedAllPrimeScalarTests.triadic_one_level_scalar
example (η : DirichletCharacter ℚ_[3] 1) (hD : IsUnit ((1 : ℕ) : ℚ_[3])) (hpD : ¬3∣1) (s : ℚ_[3]) :
    (∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[3]))).subtype (M f)=
        s • PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[3]))).subtype
          (integralDoubledTameEisensteinSeries η hD hpD f)) ↔ ‖s‖≤1 := sorry

-- SuggestedAllPrimeScalarTests.triadic_half_exists
example (η : DirichletCharacter ℚ_[3] 4) (hD : IsUnit (4 : ℚ_[3])) (hpD : ¬3∣4) :
    ∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[3]))).subtype (M f)=
        (2 : ℚ_[3])⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[3]))).subtype
          (integralDoubledTameEisensteinSeries η hD hpD f) := sorry

end Triadic

section Quintic
local instance : Fact (Nat.Prime 5) := ⟨by decide⟩

variable [IsBoundedSMul ℤ_[5] ℚ_[5]]

local notation "O" => Valuation.integer (NormedField.valuation (K := ℚ_[5]))

local notation "U" => (ℤ_[5])ˣ

-- SuggestedAllPrimeScalarTests.quintic_any_character_scalar
example (η : DirichletCharacter ℚ_[5] 6) (hD : IsUnit (6 : ℚ_[5])) (hpD : ¬5∣6) (s : ℚ_[5]) :
    (∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[5]))).subtype (M f)=
        s • PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[5]))).subtype
          (integralDoubledTameEisensteinSeries η hD hpD f)) ↔ ‖s‖≤1 := sorry

end Quintic

section Dyadic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

local notation "O" => Valuation.integer (NormedField.valuation (K := ℚ_[2]))

local notation "U" => (ℤ_[2])ˣ

-- SuggestedAllPrimeScalarTests.dyadic_one_half_exists
example (η : DirichletCharacter ℚ_[2] 1) (hD : IsUnit ((1 : ℕ) : ℚ_[2])) (hpD : ¬2∣1) :
    ∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype (M f)=
        (2 : ℚ_[2])⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
          (integralDoubledTameEisensteinSeries η hD hpD f) := sorry

-- SuggestedAllPrimeScalarTests.dyadic_three_half_fails
example (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2∣3) :
    ¬∃ M : AbstractMeasure U O (PowerSeries O), ∀ f : C(U,O),
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype (M f)=
        (2 : ℚ_[2])⁻¹ • PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype
          (integralDoubledTameEisensteinSeries (1 : DirichletCharacter ℚ_[2] 3) hD hpD f) := sorry

end Dyadic

end

end SuggestedAllPrimeScalarTests

namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure BigOperators MatrixGroups ModularForm PowerSeries.WithPiTopology

open Matrix.SpecialLinearGroup CongruenceSubgroup UpperHalfPlane

variable (p : ℕ) [Fact p.Prime] {F K : Type*} [Field F] [CharZero F] [Algebra ℚ F]
  [NontriviallyNormedField K] [CharZero K] [Algebra ℚ K] [IsUltrametricDist K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [CompleteSpace K]
  {D : ℕ} [NeZero D] (t : ℕ) (χ : DirichletCharacter F (p^t))
  (η : DirichletCharacter F D) (hη : η≠1) (ιC : F →+* ℂ) (ιK : F →+* K)
  (hD : IsUnit (D : K)) (hpD : ¬p∣D) (e : ℕ)

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "θ" => (DirichletCharacter.changeLevel (Nat.dvd_mul_right D (p^t)) η *
  DirichletCharacter.changeLevel (Nat.dvd_mul_left (p^t) D) χ)

local notation "c" => (-((D*p^t : ℕ) : F)^e/(2*((e+1 : ℕ) : F)) *
  ∑ a : ZMod (D*p^t), θ a *
    algebraMap ℚ F (Polynomial.eval ((ZMod.val a : ℚ)/(D*p^t))
      (Polynomial.bernoulli (e+1))))

local notation "Qplus" => (PowerSeries.mk (fun m : ℕ =>
  ∑ d ∈ Nat.divisors m, ite (p∣d) (0 : F) (θ (d : ZMod (D*p^t))*(d : F)^e)))

local notation "G" => (integralDoubledTameEisensteinSeries
  (MulChar.ringHomComp η ιK) hD hpD
  (ContinuousMonoidHom.toContinuousMap
    (integralPrimePowerArithmeticCharacter p t (MulChar.ringHomComp χ ιK) e)))

include hη ιC

theorem integralDoubledTameEisensteinSeries_common_series :
    PowerSeries.map ιK
      (PowerSeries.C ((1-θ (p : ZMod (D*p^t))*(p : F)^e)*c)+Qplus)=
      (2 : K)⁻¹ • PowerSeries.map (O).subtype G := sorry

theorem integralDoubledTameEisensteinSeries_classical_full
    {M : ℕ} [NeZero M]
    (f : ModularForm ((Gamma1 M).map (mapGL ℝ)) ((e+1 : ℕ) : ℤ))
    (hf : ∀ m : ℕ+, (qExpansion 1 f).coeff (m : ℕ)=
      ιC (∑ d ∈ (m : ℕ).divisors, θ (d : ZMod (D*p^t))*(d : F)^e))
    (h0 : (qExpansion 1 f).coeff 0=ιC c) :
    let g : ModularForm ((Gamma1 (p*M)).map (mapGL ℝ)) ((e+1 : ℕ) : ℤ) :=
      ModularForm.ofLe (Gamma1_map_le_Gamma1_map_of_dvd (dvd_mul_left M p)) f-
        ιC (θ (p : ZMod (D*p^t))*(p : F)^e) •
          TauCeti.ModularForm.levelRaise p (TauCeti.Gamma1_map_le_conjAct_scaleGL M p) f
    ∃! Q : PowerSeries F,
      PowerSeries.map ιC Q=qExpansion 1 g ∧
      PowerSeries.map ιK Q=(2 : K)⁻¹ • PowerSeries.map (O).subtype G := sorry

end

end DirichletPadic

namespace SuggestedFullTameComparisonTests
noncomputable section
open scoped BigOperators PowerSeries.WithPiTopology

section Algebra
variable {F : Type*} [Field F] [CharZero F] {p N : ℕ}

-- SuggestedFullTameComparisonTests.retained_series_has_zero_constant
example (θ : DirichletCharacter F N) (e : ℕ) :
    PowerSeries.coeff 0 (PowerSeries.mk (fun m : ℕ =>
      ∑ d ∈ m.divisors, if p∣d then (0 : F) else θ (d : ZMod N)*(d : F)^e))=0 := sorry

-- SuggestedFullTameComparisonTests.constant_retains_euler_factor
example (θ : DirichletCharacter F N) (e : ℕ) (c : F) :
    PowerSeries.coeff 0 (PowerSeries.C ((1-θ p*(p : F)^e)*c)+
      PowerSeries.mk (fun m : ℕ => ∑ d ∈ m.divisors,
        if p∣d then (0 : F) else θ (d : ZMod N)*(d : F)^e))=
      (1-θ p*(p : F)^e)*c := sorry

-- SuggestedFullTameComparisonTests.common_series_uniqueness_uses_one_embedding
example (ιC : F →+* ℂ) (Q R : PowerSeries F)
    (h : PowerSeries.map ιC Q=PowerSeries.map ιC R) : Q=R := sorry

-- SuggestedFullTameComparisonTests.first_retained_coefficient_is_one
example [Fact p.Prime] (θ : DirichletCharacter F N) (e : ℕ) :
    PowerSeries.coeff 1 (PowerSeries.mk (fun m : ℕ =>
      ∑ d ∈ m.divisors, if p∣d then (0 : F) else θ (d : ZMod N)*(d : F)^e))=1 := sorry

-- SuggestedFullTameComparisonTests.dyadic_tame_cubic_constant
example : (1-(-1 : ℚ)*2^2)*(-1/9)=-5/9 := sorry

end Algebra

end

end SuggestedFullTameComparisonTests


/- DirichletPadicLFunctions:L4/positive-eisenstein-completed-coordinates
Planned declaration: DirichletPadic.positiveEisenstein_completed_projection.
The actual PadicMeasuresIwasawaAlgebras:L1 completed carrier, integral measure equivalence,
Dirac comparison and separated joint finite projections are not supplied yet. Once those
native APIs exist, its statement is: projection at (r,s) of the image of
positiveEisensteinMeasure p n equals positiveEisensteinFinite p n r s.
No replacement carrier or theorem assuming that coordinate identity is introduced here. -/


open Filter
open scoped Topology

namespace DirichletPadic
variable (p : ℕ) [Fact p.Prime]

theorem unitPower_totient_precision (k n : ℕ) :
    ‖(⟨fun u : (ℤ_[p])ˣ => ((u : ℤ_[p]) : ℚ_[p]) ^
        (k + (p - 1) * p ^ n), by fun_prop⟩ : C((ℤ_[p])ˣ, ℚ_[p])) -
      ⟨fun u : (ℤ_[p])ˣ => ((u : ℤ_[p]) : ℚ_[p]) ^ k, by fun_prop⟩‖ ≤
      (p : ℝ) ^ (-(n + 1 : ℕ) : ℤ) := by sorry

theorem unitPower_sequence_tendsto (k : ℕ) :
    Tendsto (fun n : ℕ =>
      (⟨fun u : (ℤ_[p])ˣ => ((u : ℤ_[p]) : ℚ_[p]) ^
        (k + (p - 1) * p ^ n), by fun_prop⟩ : C((ℤ_[p])ˣ, ℚ_[p])))
      atTop (𝓝 ⟨fun u : (ℤ_[p])ˣ => ((u : ℤ_[p]) : ℚ_[p]) ^ k,
        by fun_prop⟩) := by sorry

theorem not_exists_primePower_moments :
    ¬ ∃ μ : AbstractMeasure (ℤ_[p])ˣ ℚ_[p] ℚ_[p], ∀ e : ℕ,
      μ ⟨fun u : (ℤ_[p])ˣ => ((u : ℤ_[p]) : ℚ_[p]) ^ e,
        by fun_prop⟩ = (p : ℚ_[p]) ^ e := by sorry
end DirichletPadic

namespace SuggestedEisensteinTargetTests
-- dyadic_uniform_precision
example :
    ‖(⟨fun u : (ℤ_[2])ˣ => ((u : ℤ_[2]) : ℚ_[2]) ^ 4 - 1,
      by fun_prop⟩ : C((ℤ_[2])ˣ, ℚ_[2]))‖ ≤ (1 / 8 : ℝ) := by sorry
-- odd_torsion_retained
example : (-1 : ℚ_[3]) ^ 18 - 1 = 0 := by sorry
-- wrong_component_fails
example : ¬ Tendsto (fun n : ℕ => (-1 : ℚ_[3]) ^ (3 ^ n))
    atTop (𝓝 1) := by sorry
end SuggestedEisensteinTargetTests

/-! New L4 arithmetic signatures. These depend on the owned inherited prototypes. -/
namespace DirichletPadic
noncomputable section
open AbstractMeasure
open scoped AbstractMeasure BigOperators MatrixGroups ModularForm
open Matrix.SpecialLinearGroup CongruenceSubgroup UpperHalfPlane
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]
local notation "U" => Zˣ
local notation "M" => AbstractMeasure U Z Z
local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)
local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }
local notation "S" => (fun a : U => Localization.Away (2 * eisensteinTwistedDenominator p a))

def principalTameEisensteinAwaySeries (a : U) (D : ℕ) (hD : 0 < D) (hpD : ¬ p ∣ D) :
    PowerSeries (S a) := by sorry

theorem principalTameEisensteinAwaySeries_def (a : U) (D : ℕ)
    (hD : 0 < D) (hpD : ¬ p ∣ D) (v : ℕ → U)
    (hv : ∀ d : ℕ, ¬ p ∣ d → (v d : Z) = d) :
    principalTameEisensteinAwaySeries p a D hD hpD =
      ∑ T ∈ D.primeFactors.powerset,
        let d := ∏ l ∈ T, l
        if hd : d ≠ 0 then
          (-1 : PowerSeries (S a)) ^ T.card *
            PowerSeries.C (algebraMap M (S a) (AbstractMeasure.dirac Z (v d))) *
              PowerSeries.expand d hd (eisensteinAwaySeries p a)
        else 0 := by sorry

theorem principalTameEisensteinAwaySeries_one (a : U) :
    principalTameEisensteinAwaySeries p a 1 (by omega)
      (Nat.Prime.not_dvd_one (Fact.out : p.Prime)) = eisensteinAwaySeries p a := by sorry

theorem principalTameEisensteinAwaySeries_primeFactors (a : U) (D E : ℕ)
    (hD : 0 < D) (hpD : ¬ p ∣ D) (hE : 0 < E) (hpE : ¬ p ∣ E)
    (h : D.primeFactors = E.primeFactors) :
    principalTameEisensteinAwaySeries p a D hD hpD =
      principalTameEisensteinAwaySeries p a E hE hpE := by sorry

theorem principalTameEisensteinAwaySeries_coeff_pos (a : U) (D : ℕ)
    (hD : 0 < D) (hpD : ¬ p ∣ D) (v : ℕ → U)
    (hv : ∀ d : ℕ, ¬ p ∣ d → (v d : Z) = d) (n : ℕ+) :
    (principalTameEisensteinAwaySeries p a D hD hpD).coeff (n : ℕ) =
      algebraMap M (S a)
        (∑ d ∈ (n : ℕ).divisors with Nat.Coprime d (p * D),
          AbstractMeasure.dirac Z (v d)) := by sorry

theorem principalTameEisensteinAwaySeries_constant (a : U) (D : ℕ)
    (hD : 0 < D) (hpD : ¬ p ∣ D) (v : ℕ → U)
    (hv : ∀ d : ℕ, ¬ p ∣ d → (v d : Z) = d) :
    (principalTameEisensteinAwaySeries p a D hD hpD).coeff 0 =
      (∏ l ∈ D.primeFactors, (1 - algebraMap M (S a) (AbstractMeasure.dirac Z (v l)))) *
        eisensteinAwayConstant p a := by sorry

theorem principalTameEisensteinAwaySeries_constant_moment (a : U)
    (ha : (a : Z) = (p + 1 : ℕ)) (D : ℕ) (hD : 0 < D) (hpD : ¬ p ∣ D) (e : ℕ) :
    eisensteinAwayMoment p a ha e
      ((principalTameEisensteinAwaySeries p a D hD hpD).coeff 0) =
        algebraMap ℚ ℚ_[p] (-(1 - (p : ℚ)^e) * bernoulli (e+1) / (2 * (e+1))) *
          ∏ l ∈ D.primeFactors, (1 - (l : ℚ_[p])^e) := by sorry

theorem principalTameEisensteinAwaySeries_classical (a : U)
    (ha : (a : Z) = (p + 1 : ℕ)) (D : ℕ) (hD : 0 < D) (hpD : ¬ p ∣ D)
    (w : ℕ) (hw : 4 ≤ w) (he : Even w) :
    ∃ g : ModularForm ((Gamma0 (p*D)).map (mapGL ℝ)) (w : ℤ),
      (∀ z : ℍ, g z = ∑ T ∈ D.primeFactors.powerset,
        let d := ∏ l ∈ T, l
        if hd : d ≠ 0 then
          letI : NeZero d := ⟨hd⟩
          (-1 : ℂ)^T.card * (d : ℂ)^(w-1) *
            pStabilizedEisenstein p w hw (TauCeti.scaleGL d • z)
        else 0) ∧
      ∃! F : PowerSeries ℚ,
        F.map (algebraMap ℚ ℂ) = qExpansion 1 g ∧
        F.map (algebraMap ℚ ℚ_[p]) =
          (principalTameEisensteinAwaySeries p a D hD hpD).map
            (eisensteinAwayMoment p a ha (w-1)) := by sorry

theorem principalTameEisensteinAwaySeries_cleared_congr (a : U)
    (ha : (a : Z) = (p + 1 : ℕ)) (D : ℕ) (hD : 0 < D) (hpD : ¬ p ∣ D)
    (r e e' n : ℕ) (hr : 0 < r) (he : Nat.ModEq (p^(r-1)*(p-1)) e e') :
    ‖(2 * (((a : Z) : ℚ_[p])^(e'+1)-1)) *
        ((principalTameEisensteinAwaySeries p a D hD hpD).map
          (eisensteinAwayMoment p a ha e')).coeff n -
      (2 * (((a : Z) : ℚ_[p])^(e+1)-1)) *
        ((principalTameEisensteinAwaySeries p a D hD hpD).map
          (eisensteinAwayMoment p a ha e)).coeff n‖ ≤
      (p : ℝ)^(-(r : ℤ)) := by sorry

section NontrivialLeft
variable {F K : Type*} [Field F] [CharZero F] [NontriviallyNormedField K]
  [IsUltrametricDist K] [CharZero K] [CompleteSpace K]
  [Algebra Z K] [IsBoundedSMul Z K]
variable (ιC : F →+* ℂ) (ιK : F →+* K) {D E : ℕ} [NeZero D] [NeZero E]
local notation "O" => Valuation.integer (NormedField.valuation (K := K))

theorem integralTwistedPositiveEisensteinSeries_nontrivial_left_full
    (ψ : DirichletCharacter F D) (φ : DirichletCharacter F E)
    (hψ : ψ.IsPrimitive) (hφ : φ.IsPrimitive) (hD : 1 < D)
    (hpD : ¬ p ∣ D) (hpE : ¬ p ∣ E) (w : ℕ) (hw : 3 ≤ w)
    (hparity : ψ (-1) * φ (-1) = (-1 : F)^w) :
    ∃ f : ModularForm ((Gamma1 (D*E)).map (mapGL ℝ)) (w : ℤ),
      (qExpansion 1 f).coeff 0 = 0 ∧
      (∀ n : ℕ+, (qExpansion 1 f).coeff (n : ℕ) =
        ιC (DirichletCharacter.twistedDivisorSum (w-1) ψ φ (n : ℕ))) ∧
      let g : ModularForm ((Gamma1 (p*(D*E))).map (mapGL ℝ)) (w : ℤ) :=
        ModularForm.ofLe (Gamma1_map_le_Gamma1_map_of_dvd (dvd_mul_left (D*E) p)) f -
          ιC (φ p*(p : F)^(w-1)) •
            TauCeti.ModularForm.levelRaise p (TauCeti.Gamma1_map_le_conjAct_scaleGL (D*E) p) f
      ∃! Q : PowerSeries F,
        Q.map ιC = qExpansion 1 g ∧
        Q.map ιK = (integralTwistedPositiveEisensteinSeries p
          (ψ.ringHomComp ιK) (φ.ringHomComp ιK)
          (integralPrimePowerArithmeticCharacter p 0
            (1 : DirichletCharacter K (p^0)) (w-1)).toContinuousMap).map O.subtype := by sorry
end NontrivialLeft
end
end DirichletPadic

namespace SuggestedEisensteinTargetTests
noncomputable section
open DirichletPadic AbstractMeasure
open scoped AbstractMeasure BigOperators
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]
local notation "U" => Zˣ
-- principal_level_one_keeps_constant
example (a : U) :
    principalTameEisensteinAwaySeries p a 1 (by omega)
      (Nat.Prime.not_dvd_one (Fact.out : p.Prime)) = eisensteinAwaySeries p a := by sorry
-- principal_repeated_prime
example (a : (ℤ_[2])ˣ) :
    principalTameEisensteinAwaySeries 2 a 3 (by decide) (by decide) =
      principalTameEisensteinAwaySeries 2 a 9 (by decide) (by decide) := by sorry
-- principal_first_coefficient
example (a : U) (D : ℕ) (hD : 0 < D) (hpD : ¬ p ∣ D) :
    (principalTameEisensteinAwaySeries p a D hD hpD).coeff 1 = 1 := by sorry
-- principal_dyadic_cubic_constant
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2]) = 3) :
    eisensteinAwayMoment 2 a ha 3
      ((principalTameEisensteinAwaySeries 2 a 3 (by decide) (by decide)).coeff 0) =
        (91 / 120 : ℚ_[2]) := by sorry
-- nontrivial_left_zero_constant
example {K : Type*} [NormedField K] [IsUltrametricDist K] {D E : ℕ}
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (f : C(U, Valuation.integer (NormedField.valuation (K := K)))) :
    (integralTwistedPositiveEisensteinSeries p ψ φ f).coeff 0 = 0 := by sorry
end
end SuggestedEisensteinTargetTests
