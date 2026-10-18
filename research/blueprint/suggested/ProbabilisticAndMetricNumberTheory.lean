/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The Tau Ceti Atlas contributors, Codex (codex-fbcDyN)
-/
import Mathlib.Algebra.BigOperators.Associated
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Algebra.ContinuedFractions.Basic
import Mathlib.Algebra.ContinuedFractions.Computation.Approximations
import Mathlib.Algebra.ContinuedFractions.Computation.Basic
import Mathlib.Algebra.ContinuedFractions.Computation.TerminatesIffRat
import Mathlib.Algebra.ContinuedFractions.ContinuantsRecurrence
import Mathlib.Algebra.GCDMonoid.FinsetLemmas
import Mathlib.Algebra.Order.Antidiag.FinsuppEquiv
import Mathlib.Algebra.Order.BigOperators.Ring.Finset
import Mathlib.Algebra.Order.Floor.Semiring
import Mathlib.Algebra.Ring.Periodic
import Mathlib.Analysis.Calculus.ContDiff.Deriv
import Mathlib.Analysis.Calculus.FDeriv.Extend
import Mathlib.Analysis.Calculus.SmoothSeries
import Mathlib.Analysis.Complex.Exponential
import Mathlib.Analysis.Fourier.AddCircleMulti
import Mathlib.Analysis.PSeries
import Mathlib.Analysis.Real.OfDigits
import Mathlib.Analysis.Real.Sqrt
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Data.Finset.Powerset
import Mathlib.Data.Fintype.Perm
import Mathlib.Data.Int.CardIntervalMod
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Nat.Choose.Multinomial
import Mathlib.Data.Nat.Choose.Sum
import Mathlib.Data.Nat.Factorization.Basic
import Mathlib.Data.Nat.GCD.Basic
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Data.Nat.Totient
import Mathlib.Data.ZMod.QuotientRing
import Mathlib.Dynamics.BirkhoffSum.Average
import Mathlib.Dynamics.Ergodic.AddCircle
import Mathlib.Dynamics.Ergodic.Ergodic
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.MeasureTheory.Function.ConditionalExpectation.Basic
import Mathlib.MeasureTheory.Function.Jacobian
import Mathlib.MeasureTheory.Integral.DominatedConvergence
import Mathlib.MeasureTheory.MeasurableSpace.Invariants
import Mathlib.MeasureTheory.Measure.DiracProba
import Mathlib.MeasureTheory.Measure.Hausdorff
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic
import Mathlib.MeasureTheory.Measure.LevyConvergence
import Mathlib.MeasureTheory.Measure.Portmanteau
import Mathlib.MeasureTheory.Measure.ProbabilityMeasure
import Mathlib.MeasureTheory.Measure.WithDensity
import Mathlib.NumberTheory.ArithmeticFunction.Defs
import Mathlib.NumberTheory.ArithmeticFunction.Liouville
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import Mathlib.NumberTheory.PrimeCounting
import Mathlib.NumberTheory.Real.Irrational
import Mathlib.NumberTheory.WellApproximable
import Mathlib.NumberTheory.ZetaValues
import Mathlib.Order.LiminfLimsup
import Mathlib.Probability.CDF
import Mathlib.Probability.Distributions.Gaussian.Real
import Mathlib.Probability.Distributions.Geometric
import Mathlib.Probability.Distributions.Uniform
import Mathlib.Probability.Independence.Basic
import Mathlib.Probability.Martingale.Convergence
import Mathlib.Topology.Algebra.Group.Quotient
import Mathlib.Topology.Algebra.InfiniteSum.ENNReal
import Mathlib.Topology.EMetricSpace.BoundedVariation
import Mathlib.Topology.Instances.Matrix
import Mathlib.Topology.MetricSpace.HausdorffDimension
import TauCeti.MeasureTheory.Function.ConditionalExpectation
import TauCeti.Probability.Distributions.Gaussian.Moments
import TauCeti.Probability.Martingale.Convergence
import TauCeti.Probability.Process.EmpiricalMeasure

/-!
# Probabilistic, metric and ergodic number theory

Suggested statements, not a formalization or an exhaustive file plan. The reader
and the two reviewed packets retain every target, API, Check and worked example.
This compact file selects light definitions on native carriers, end theorems,
layer milestones and a few discriminating examples. Heavy subtori, GCD graphs,
Cantor constructions, greedy orbit colorings and filtrations stay reader targets.
No new abstract probability, continued-fraction or homogeneous-space carrier is used.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
The nonempty arithmetic sample is 1,...,m+1. Empirical sequence laws use n+1
terms. Gauss digits use gaussDigit x n with n=0 the first digit. The open and
half-open Lebesgue restrictions used below agree as measures by endpoint nullity.
-/

noncomputable section
open MeasureTheory Filter Set
open scoped BigOperators Topology NNReal ENNReal Classical

namespace TauCeti.Probability.Arithmetic

local notation "uLaw" =>
  (fun m : ℕ => (TauCeti.Probability.empiricalMeasure (fun k : ℕ => k + 1) m : Measure ℕ))

-- PM.0: arithmetic comparison in the existing ArithmeticFunction carrier.
def primeDivisibilitySum (P : Finset ℕ) (a : ℕ → ℝ) : ArithmeticFunction ℝ where
  toFun n := if n = 0 then 0 else ∑ p ∈ P, if p ∣ n then a p else 0
  map_zero' := by simp

theorem primeDivisibilitySum_apply (P : Finset ℕ) (a : ℕ → ℝ)
    {n : ℕ} (hn : 0 < n) :
    primeDivisibilitySum P a n = ∑ p ∈ P, if p ∣ n then a p else 0 := by
  sorry

theorem primeDivisibilitySum_secondMoment_error (m : ℕ) (P : Finset ℕ)
    (a : ℕ → ℝ) (hP : ∀ p ∈ P, Nat.Prime p) :
    let A : ℝ := ∑ p ∈ P, a p / (p : ℝ)
    let L : ℝ := ∑ p ∈ P, |a p|
    let V : ℝ := ∑ p ∈ P, (a p) ^ 2 * (1 / (p : ℝ) - 1 / (p : ℝ) ^ 2)
    |(∫ n, (primeDivisibilitySum P a n - A) ^ 2 ∂(uLaw m)) - V| ≤
      2 * L ^ 2 / ((m + 1 : ℕ) : ℝ) := by
  sorry

theorem primeDivisibilitySum_secondMoment_completePeriod (m : ℕ) (P : Finset ℕ)
    (a : ℕ → ℝ) (hP : ∀ p ∈ P, Nat.Prime p)
    (hperiod : (∏ p ∈ P, p) ∣ m + 1) :
    (∫ n, (primeDivisibilitySum P a n - ∑ p ∈ P, a p / (p : ℝ)) ^ 2 ∂(uLaw m)) =
      ∑ p ∈ P, (a p) ^ 2 * (1 / (p : ℝ) - 1 / (p : ℝ) ^ 2) := by
  sorry

theorem divisibility_pattern_summed_error (m : ℕ) (P : Finset ℕ)
    (hP : ∀ p ∈ P, Nat.Prime p) :
    (∑ S ∈ P.powerset,
      |((uLaw m) {n : ℕ | (∀ p ∈ S, p ∣ n) ∧ (∀ q ∈ P \ S, ¬ q ∣ n)}).toReal -
        (∏ p ∈ S, 1 / (p : ℝ)) * (∏ q ∈ P \ S, (1 - 1 / (q : ℝ)))|) ≤
      (3 : ℝ) ^ P.card / ((m + 1 : ℕ) : ℝ) := by
  sorry

theorem crt_complete_period_law {ι : Type*} [Fintype ι] [DecidableEq ι] (m : ℕ)
    (q : ι → ℕ) [∀ i, NeZero (q i)]
    (hcop : Pairwise (fun i j => Nat.Coprime (q i) (q j)))
    (hperiod : (∏ i, q i) ∣ m + 1) (a : ∀ i, ZMod (q i)) :
    ((uLaw m) {n : ℕ | ∀ i, (n : ZMod (q i)) = a i}).toReal =
      ∏ i, 1 / (q i : ℝ) := by sorry

theorem crt_statistic_error {ι : Type*} [Fintype ι] [DecidableEq ι] (m : ℕ)
    (q : ι → ℕ) [∀ i, NeZero (q i)]
    (hcop : Pairwise (fun i j => Nat.Coprime (q i) (q j)))
    (F : (∀ i, ZMod (q i)) → ℝ) (L U : ℝ) (hLU : L ≤ U)
    (hF : ∀ a, L ≤ F a ∧ F a ≤ U) :
    |(∫ n : ℕ, F (fun i => (n : ZMod (q i))) ∂uLaw m) -
      (∏ i, 1 / (q i : ℝ)) * ∑ a, F a| ≤
      (U - L) * ((m + 1) % (∏ i, q i) : ℕ) *
        (((∏ i, q i : ℕ) : ℝ) - ((m + 1) % (∏ i, q i) : ℕ)) /
        ((m + 1 : ℕ) * ((∏ i, q i : ℕ) : ℝ)) := by sorry

theorem arithmetic_levy_criterion (f : ℕ → ℕ → ℝ)
    (ν : Measure ℝ) [IsProbabilityMeasure ν] :
    TendstoInDistribution f atTop (fun x : ℝ => x) uLaw ν ↔
      ∀ t : ℝ, Tendsto (fun m =>
        (∑ k ∈ Finset.range (m+1), Complex.exp
          (((t * f m (k+1) : ℝ) : ℂ) * Complex.I)) / (m+1 : ℕ))
        atTop (𝓝 (charFun ν t)) := by sorry

local notation "factorExcess" => (fun n : ℕ =>
  (ArithmeticFunction.cardFactors n : ℝ) - ArithmeticFunction.cardDistinctFactors n)

theorem excess_exponential_mean (m : ℕ) :
    (∫ n : ℕ, Real.exp (Real.log (3/2)*factorExcess n) ∂uLaw m) ≤
      Real.exp 2 := by sorry

theorem excess_all_moments (m k : ℕ) :
    (∫ n : ℕ, |factorExcess n|^k ∂uLaw m) ≤
      Real.exp 2 * (k.factorial : ℝ) / (Real.log (3/2))^k := by sorry

theorem excess_exponential_tail (m : ℕ) (t : ℝ) :
    ((uLaw m) {n : ℕ | t ≤ factorExcess n}).toReal ≤
      Real.exp (2 - Real.log (3/2)*t) := by sorry

theorem excess_distribution_transfer (b s : ℕ → ℝ) (hs : Tendsto s atTop atTop)
    (ν : Measure ℝ) [IsProbabilityMeasure ν] :
    TendstoInDistribution
      (fun m n => ((ArithmeticFunction.cardDistinctFactors n : ℝ)-b m)/s m)
      atTop (fun x : ℝ => x) uLaw ν ↔
    TendstoInDistribution
      (fun m n => ((ArithmeticFunction.cardFactors n : ℝ)-b m)/s m)
      atTop (fun x : ℝ => x) uLaw ν := by sorry

example : primeDivisibilitySum {2, 3} (fun p => (p : ℝ)) 12 = 5 := by
  sorry

/-- zero_extension: an unguarded sum would give 5. -/
example : primeDivisibilitySum {2, 3} (fun p => (p : ℝ)) 0 = 0 := by
  sorry


end TauCeti.Probability.Arithmetic

namespace TauCeti.Probability.MetricNumberTheory

-- PM.0–PM.1: additive functions and the distributional end theorems.
def IsAdditive {R : Type*} [AddCommMonoid R] (f : ArithmeticFunction R) : Prop :=
  f 1 = 0 ∧ ∀ m n : ℕ, 0 < m → 0 < n → m.Coprime n → f (m*n) = f m + f n

def IsStronglyAdditive {R : Type*} [AddCommMonoid R] (f : ArithmeticFunction R) : Prop :=
  IsAdditive f ∧ ∀ p k : ℕ, p.Prime → 0 < k → f (p^k) = f p

def concentration (ν : ProbabilityMeasure ℝ) (δ : ℝ) : ℝ :=
  sSup {v : ℝ | ∃ u : ℝ, v = (ν : Measure ℝ).real (Set.Ioo (u-δ) (u+δ))}

theorem kolmogorov_rogozin : ∃ C : ℝ, 0 < C ∧
    ∀ (Ω : Type*) [MeasurableSpace Ω] (μ : ProbabilityMeasure Ω) (k : ℕ) (X : Fin k → Ω → ℝ)
      (hX : ∀ j, AEMeasurable (X j) (μ : Measure Ω))
      (hi : ProbabilityTheory.iIndepFun X (μ : Measure Ω)) (δ : ℝ) (hδ : 0 < δ),
      let D := ∑ j, (1 - concentration (μ.map (X j)) δ)
      0 < D → concentration (μ.map (fun ω => ∑ j, X j ω)) δ ≤ C / Real.sqrt D := by sorry

theorem cdf_weak_criterion (νs : ℕ → ProbabilityMeasure ℝ) (ν : ProbabilityMeasure ℝ) :
    Tendsto νs atTop (𝓝 ν) ↔
      ∀ x : ℝ, ContinuousAt (ProbabilityTheory.cdf (ν : Measure ℝ)) x →
        Tendsto (fun m => ProbabilityTheory.cdf (νs m : Measure ℝ) x) atTop
          (𝓝 (ProbabilityTheory.cdf (ν : Measure ℝ) x)) := by sorry

theorem kubilius_small_prime_model (β : ℕ → ℝ)
    (hβ : ∀ N, 0 < β N) (hβinf : Tendsto β atTop atTop)
    (ν : (N : ℕ) → ProbabilityMeasure
      ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ))
    (hν : ∀ (N : ℕ) (v : ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ)), (ν N : Measure ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ)).real {v} =
      ∏ p : {p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊},
        (1-1/(p:ℝ)) / (p:ℝ)^(v p)) :
    ∃ C δ : ℝ, 0 < C ∧ 0 < δ ∧ ∀ᶠ N : ℕ in atTop,
      (1/2:ℝ) * ∑' v : ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ),
        |(((Finset.Icc 1 N).filter (fun n => ∀ p, n.factorization p = v p)).card : ℝ)/(N:ℝ) -
          (ν N : Measure ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ)).real {v}| ≤ C*Real.exp (-δ*β N) := by sorry

theorem turan_kubilius (f : ArithmeticFunction ℝ) (hf : IsAdditive f) (N : ℕ) (hN : 2 ≤ N) :
    let A := ∑ p ∈ Nat.primesLE N, ∑ k ∈ Finset.Icc 1 N,
      if p^k ≤ N then f (p^k)/(p^k : ℕ) else 0
    let B := ∑ p ∈ Nat.primesLE N, ∑ k ∈ Finset.Icc 1 N,
      if p^k ≤ N then (f (p^k))^2/(p^k : ℕ) else 0
    ∑ n ∈ Finset.Icc 1 N, (f n-A)^2 ≤ 30*(N:ℝ)*B := by sorry

theorem hardy_ramanujan (ε : ℝ) (hε : 0 < ε) :
    Tendsto (fun N : ℕ =>
      ((Finset.Icc 1 N).filter (fun n =>
        ε * Real.log (Real.log N) < |(ArithmeticFunction.cardDistinctFactors n : ℝ) - Real.log (Real.log N)|)).card / (N : ℝ))
      atTop (𝓝 0) ∧
    Tendsto (fun N : ℕ =>
      ((Finset.Icc 1 N).filter (fun n =>
        ε * Real.log (Real.log N) < |(ArithmeticFunction.cardFactors n : ℝ) - Real.log (Real.log N)|)).card / (N : ℝ))
      atTop (𝓝 0) := by sorry

theorem erdos_kac (x : ℝ) :
    Tendsto (fun N : ℕ =>
      ((Finset.Icc 1 N).filter (fun n =>
        ((ArithmeticFunction.cardDistinctFactors n : ℝ)-Real.log (Real.log N)) /
          Real.sqrt (Real.log (Real.log N)) ≤ x)).card / (N:ℝ))
      atTop (𝓝 (ProbabilityTheory.cdf (ProbabilityTheory.gaussianReal 0 1) x)) ∧
    Tendsto (fun N : ℕ =>
      ((Finset.Icc 1 N).filter (fun n =>
        ((ArithmeticFunction.cardFactors n : ℝ)-Real.log (Real.log N)) /
          Real.sqrt (Real.log (Real.log N)) ≤ x)).card / (N:ℝ))
      atTop (𝓝 (ProbabilityTheory.cdf (ProbabilityTheory.gaussianReal 0 1) x)) := by sorry

theorem restricted_squarefree_window : ∃ C : ℝ, 0 < C ∧ ∃ N₀ : ℕ, ∀ N ≥ N₀,
    ∀ (D : Finset ℕ)
      (hD : ∀ n, n ∈ D ↔ 0 < n ∧ n < N ∧ Squarefree n ∧
        ∀ p ∈ n.primeFactors, p % 4 = 1 ∨ p % 4 = 2),
    ((D.filter (fun n => Real.rpow (Real.log (Real.log N)) (2/3) ≤
      |(ArithmeticFunction.cardDistinctFactors n : ℝ) - (1/2)*Real.log (Real.log N)|)).card : ℝ) ≤
      C * D.card / Real.rpow (Real.log (Real.log N)) (1/100) := by sorry

end TauCeti.Probability.MetricNumberTheory

namespace TauCeti.Equidistribution

-- PM.2: native empirical laws, Haar probability and Fourier milestones.
def AsympEquidistributed {X : Type*} [TopologicalSpace X] [MeasurableSpace X]
    [OpensMeasurableSpace X] (x : ℕ → X) (μ : ProbabilityMeasure X) : Prop :=
  Tendsto (TauCeti.Probability.empiricalMeasure x) atTop (𝓝 μ)

def TotallyAsympEquidistributed {X : Type*} [TopologicalSpace X] [MeasurableSpace X]
    [OpensMeasurableSpace X] (x : ℕ → X) (μ : ProbabilityMeasure X) : Prop :=
  ∀ q r : ℕ, 0 < q → AsympEquidistributed (fun n => x (q * n + r)) μ

def circleHaar : ProbabilityMeasure UnitAddCircle :=
  ⟨AddCircle.haarAddCircle, inferInstance⟩

def torusHaar (d : Type*) [Fintype d] : ProbabilityMeasure (UnitAddTorus d) :=
  ⟨Measure.pi (fun _ : d => AddCircle.haarAddCircle), by sorry⟩

variable {d : Type*} [Fintype d]

def TorusIrrational (α : UnitAddTorus d) : Prop :=
  ∀ k : d → ℤ, k ≠ 0 → ∑ i, k i • α i ≠ 0

theorem weyl_criterion (x : ℕ → UnitAddTorus d) :
    AsympEquidistributed x (torusHaar d) ↔ ∀ k : d → ℤ, k ≠ 0 →
      Tendsto (fun n : ℕ => ((n + 1 : ℕ) : ℂ)⁻¹ *
        ∑ i ∈ Finset.range (n + 1), UnitAddTorus.mFourier k (x i)) atTop (𝓝 0) := by
  sorry

theorem linear_equidistribution_tfae (α β : UnitAddTorus d) :
    List.TFAE [AsympEquidistributed (fun n : ℕ => n • α + β) (torusHaar d),
      TotallyAsympEquidistributed (fun n : ℕ => n • α + β) (torusHaar d),
      TorusIrrational α] := by
  sorry

theorem weyl_polynomial (s : ℕ) (hs : 1 ≤ s) (α : ℕ → UnitAddTorus d)
    (hα : TorusIrrational (α s)) :
    AsympEquidistributed (fun n : ℕ => ∑ j ∈ Finset.range (s + 1), (n ^ j) • α j)
      (torusHaar d) := by
  sorry

theorem uniformDistribution_mod_one_tfae (u : ℕ → ℝ) :
    List.TFAE [AsympEquidistributed (fun n => (u n : UnitAddCircle)) circleHaar,
      ∀ a b : ℝ, 0 ≤ a → a ≤ b → b ≤ 1 →
        Tendsto (fun n : ℕ => (((Finset.range (n + 1)).filter
          (fun i => Int.fract (u i) ∈ Set.Ico a b)).card : ℝ) / (n + 1)) atTop (𝓝 (b - a)),
      ∀ k : ℤ, k ≠ 0 → Tendsto (fun n : ℕ => ((n + 1 : ℕ) : ℂ)⁻¹ *
        ∑ i ∈ Finset.range (n + 1), fourier k (u i : UnitAddCircle)) atTop (𝓝 0)] := by
  sorry

example : ¬ AsympEquidistributed (fun _ : ℕ => (0 : UnitAddCircle)) circleHaar := by sorry

end TauCeti.Equidistribution

namespace TauCeti.Probability.MetricNumberTheory

-- PM.2: discrepancy and canonical base digits.
def starDiscrepancy {N : ℕ} (x : Fin N → ℝ) : ℝ :=
  if N = 0 then 0 else sSup {v : ℝ | ∃ t ∈ Set.Icc (0:ℝ) 1,
    v = |((Finset.univ.filter (fun j => x j < t)).card : ℝ)/(N:ℝ)-t|}

theorem erdos_turan {N H : ℕ} (hN : 0 < N) (hH : 0 < H) (x : Fin N → ℝ)
    (hx : ∀ j, x j ∈ Set.Ico (0:ℝ) 1) :
    starDiscrepancy x ≤ 3 / ((H:ℝ)+1) +
      3 * ∑ h ∈ Finset.Icc 1 H,
        ‖(∑ j : Fin N, Complex.exp (2*Real.pi*Complex.I*(h:ℂ)*(x j:ℂ))) / (N:ℂ)‖ / (h:ℝ) := by sorry

theorem koksma {N : ℕ} (hN : 0 < N) (x : Fin N → ℝ)
    (hx : ∀ j, x j ∈ Set.Ico (0:ℝ) 1) (f : ℝ → ℝ) (hf : BoundedVariationOn f (Set.Icc 0 1)) :
    |(∑ j, f (x j))/(N:ℝ) - ∫ t in Set.Icc (0:ℝ) 1, f t| ≤
      (eVariationOn f (Set.Icc 0 1)).toReal * starDiscrepancy x := by sorry

def IsNormalBase (b : ℕ) [NeZero b] (x : ℝ) : Prop :=
  2 ≤ b ∧ x ∈ Set.Ico (0:ℝ) 1 ∧ ∀ k : ℕ, ∀ w : Fin k → Fin b,
    Tendsto (fun N : ℕ => ((Finset.range N).filter (fun j =>
      ∀ i : Fin k, Real.digits x b (j+i) = w i)).card / (N:ℝ)) atTop (𝓝 ((b:ℝ)^k)⁻¹)

theorem borel_normal {b : ℕ} [NeZero b] (hb : 2 ≤ b) :
    ∀ᵐ x ∂(volume.restrict (Set.Ico (0:ℝ) 1)), IsNormalBase b x := by sorry

theorem borel_normal_all_bases : ∀ᵐ x ∂(volume.restrict (Set.Ico (0:ℝ) 1)),
    ∀ b : ℕ, ∀ hb : 2 ≤ b, @IsNormalBase b ⟨by omega⟩ x := by sorry

end TauCeti.Probability.MetricNumberTheory

namespace TauCeti.DuffinSchaeffer

-- PM.3: reduced and unrestricted approximation sets have different numerators.
def dsSet (ψ : ℕ → ℝ) (q : ℕ) : Set ℝ :=
  Set.Icc 0 1 ∩ ⋃ a ∈ (Finset.Icc 1 q).filter (fun a => Nat.Coprime a q),
    Set.Icc ((a : ℝ) / q - ψ q / q) ((a : ℝ) / q + ψ q / q)

/-- PM.3/duffin-schaeffer-sets, data: `𝒜 = limsup 𝒜_q` (1.4). -/
def dsLimsup (ψ : ℕ → ℝ) : Set ℝ :=
  limsup (dsSet ψ) atTop

/-- PM.3/duffin-schaeffer-sets, data: Khinchin's `𝒦_q` of (1.2), with every `0 ≤ a ≤ q`. -/
def khinchinSet (ψ : ℕ → ℝ) (q : ℕ) : Set ℝ :=
  Set.Icc 0 1 ∩ ⋃ a ∈ Finset.range (q + 1),
    Set.Icc ((a : ℝ) / q - ψ q / q) ((a : ℝ) / q + ψ q / q)

/-- PM.3/duffin-schaeffer-sets, data: `𝒦 = limsup 𝒦_q`. -/
def khinchinLimsup (ψ : ℕ → ℝ) : Set ℝ :=
  limsup (khinchinSet ψ) atTop

theorem volume_dsLimsup_eq_zero (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q)
    (hsum : Summable fun q : ℕ => (q.totient : ℝ) * ψ q / q) : volume (dsLimsup ψ) = 0 := by
  sorry

theorem volume_dsLimsup_eq_one (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q)
    (hdiv : ¬ Summable fun q : ℕ => (q.totient : ℝ) * ψ q / q) : volume (dsLimsup ψ) = 1 := by
  sorry

theorem catlin (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q) :
    let ψstar : ℕ → ℝ≥0∞ := fun q =>
      (q.totient : ℝ≥0∞) * ⨆ n : ℕ, ⨆ (_ : 0 < n ∧ q ∣ n), ENNReal.ofReal (ψ n / n)
    ((∑' q, ψstar q) < ∞ → volume (khinchinLimsup ψ) = 0) ∧
      ((∑' q, ψstar q) = ∞ → volume (khinchinLimsup ψ) = 1) := by
  sorry

theorem khinchin (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q)
    (hmono : ∀ q r : ℕ, 1 ≤ q → q ≤ r → (r : ℝ) * ψ r ≤ q * ψ q) :
    (Summable ψ → volume (khinchinLimsup ψ) = 0) ∧
      (¬ Summable ψ → volume (khinchinLimsup ψ) = 1) := by
  sorry

example : dsSet (fun _ => 1 / 2) 1 = Set.Icc (1 / 2) 1 := by sorry

end TauCeti.DuffinSchaeffer

namespace TauCeti.Probability.MetricNumberTheory

-- PM.3: dimension gauges and Hausdorff consequences.
def IsDimensionGauge (f : ℝ≥0 → ℝ≥0) : Prop :=
  f 0 = 0 ∧ (∀ r, 0 < r → 0 < f r) ∧ Monotone f ∧ Continuous f

theorem mass_transference_power (s : ℝ) (hs : 0 < s) (hs1 : s < 1)
    (c r : ℕ → ℝ) (hr : ∀ i, 0 < r i) (hr0 : Tendsto r atTop (𝓝 0))
    (hfull : ∀ x : ℝ, ∀ R : ℝ, 0 < R →
      volume (Metric.ball x R \ (limsup (fun i => Metric.closedBall (c i) (Real.rpow (r i) s)) atTop)) = 0) :
    ∀ x : ℝ, ∀ R : ℝ, 0 < R →
      Measure.hausdorffMeasure s (Metric.ball x R ∩ limsup (fun i => Metric.closedBall (c i) (r i)) atTop) = ∞ := by sorry

theorem duffin_schaeffer_dimension (ψ : ℕ → ℝ)
    (hψ : ∀ q, 0 ≤ ψ q ∧ ψ q ≤ 1/2) :
    dimH (limsup (fun q : ℕ => Set.Icc (0:ℝ) 1 ∩
      ⋃ a ∈ (Finset.Icc 1 q).filter (fun a => Nat.Coprime a q),
        Set.Icc ((a:ℝ)/q-ψ q/q) ((a:ℝ)/q+ψ q/q)) atTop) =
      min (sInf {b : ℝ≥0∞ | ∃ t : ℝ, 0 ≤ t ∧ b = ENNReal.ofReal t ∧
        Summable (fun q : ℕ => (q.totient:ℝ)*Real.rpow (ψ q/q) t)}) 1 := by sorry

end TauCeti.Probability.MetricNumberTheory

namespace TauCeti.Probability.MetricNumberTheory

-- PM.4: one pointwise theorem, one Gauss system, one digit convention.
theorem birkhoff_pointwise {Ω : Type*} [MeasurableSpace Ω] (μ : ProbabilityMeasure Ω)
    (T : Ω → Ω) (hT : MeasurePreserving T (μ : Measure Ω) (μ : Measure Ω))
    (f : Ω → ℝ) (hf : Integrable f (μ : Measure Ω)) :
    ∀ᵐ x ∂(μ : Measure Ω), Tendsto (fun N => birkhoffAverage ℝ T f N x) atTop
      (𝓝 (MeasureTheory.condExp (MeasurableSpace.invariants T) (μ : Measure Ω) f x)) := by sorry

theorem birkhoff_pointwise_ergodic {Ω : Type*} [MeasurableSpace Ω] (μ : ProbabilityMeasure Ω)
    (T : Ω → Ω) (hT : Ergodic T (μ : Measure Ω)) (f : Ω → ℝ) (hf : Integrable f (μ : Measure Ω)) :
    ∀ᵐ x ∂(μ : Measure Ω), Tendsto (fun N => birkhoffAverage ℝ T f N x) atTop (𝓝 (∫ y, f y ∂(μ : Measure Ω))) := by sorry

def gaussMap (x : ℝ) : ℝ := Int.fract x⁻¹

def gaussMeasure : Measure ℝ :=
  (volume.restrict (Set.Ioc (0:ℝ) 1)).withDensity (fun x => ENNReal.ofReal (1 / ((1+x)*Real.log 2)))
instance gaussMeasure_probability : IsProbabilityMeasure gaussMeasure := by sorry

def gaussDigit (x : ℝ) (n : ℕ) : ℕ := ⌊((gaussMap^[n]) x)⁻¹⌋₊

def IsStrongMixing {Ω : Type*} [MeasurableSpace Ω] (T : Ω → Ω) (μ : ProbabilityMeasure Ω) : Prop :=
  MeasurePreserving T (μ : Measure Ω) (μ : Measure Ω) ∧
    ∀ A B : Set Ω, MeasurableSet A → MeasurableSet B →
      Tendsto (fun n : ℕ => (μ : Measure Ω).real (A ∩ (T^[n]) ⁻¹' B)) atTop
        (𝓝 ((μ : Measure Ω).real A * (μ : Measure Ω).real B))


def IsExact {Ω : Type*} [m : MeasurableSpace Ω] (T : Ω → Ω) (μ : ProbabilityMeasure Ω) : Prop :=
  MeasurePreserving T (μ : Measure Ω) (μ : Measure Ω) ∧
    ∀ A : Set Ω, MeasurableSet[⨅ n : ℕ, MeasurableSpace.comap (T^[n]) m] A →
      (μ : Measure Ω) A = 0 ∨ (μ : Measure Ω) Aᶜ = 0

def khinchinConstant : ℝ := Real.exp (∑' k : ℕ,
  Real.log ((k:ℝ)+1) * Real.log (1 + 1/(((k:ℝ)+1)*((k:ℝ)+3))) / Real.log 2)

theorem gauss_invariant : MeasurePreserving gaussMap gaussMeasure gaussMeasure := by sorry

theorem gauss_exact : IsExact gaussMap (⟨gaussMeasure, gaussMeasure_probability⟩ : ProbabilityMeasure ℝ) := by sorry

theorem gauss_mixing : IsStrongMixing gaussMap (⟨gaussMeasure, gaussMeasure_probability⟩ : ProbabilityMeasure ℝ) := by sorry

theorem gauss_ergodic : Ergodic gaussMap gaussMeasure := by sorry

theorem gauss_digit_frequency : ∀ᵐ x ∂(volume.restrict (Set.Ioo (0:ℝ) 1)),
    ∀ a : ℕ, 0 < a → Tendsto (fun N : ℕ =>
      ((Finset.range N).filter (fun j => gaussDigit x j = a)).card / (N:ℝ)) atTop
      (𝓝 (Real.log (((a:ℝ)+1)^2 / ((a:ℝ)*((a:ℝ)+2))) / Real.log 2)) := by sorry

theorem gauss_word_frequency : ∀ᵐ x ∂(volume.restrict (Set.Ioo (0:ℝ) 1)),
    ∀ k : ℕ, 0 < k → ∀ w : Fin k → ℕ, (∀ i, 0 < w i) →
      Tendsto (fun N : ℕ => ((Finset.range N).filter (fun j =>
        ∀ i : Fin k, gaussDigit x (j+i) = w i)).card / (N:ℝ)) atTop
        (𝓝 (gaussMeasure.real {y | y ∈ Set.Ioo (0:ℝ) 1 ∧ ∀ i : Fin k, gaussDigit y i = w i})) := by sorry

theorem khinchin_geometric_mean : ∀ᵐ x ∂(volume.restrict (Set.Ioo (0:ℝ) 1)),
    Tendsto (fun N : ℕ => Real.rpow (∏ j ∈ Finset.range N, (gaussDigit x j : ℝ)) ((N:ℝ)⁻¹))
      atTop (𝓝 khinchinConstant) := by sorry

theorem levy_denominator : ∀ᵐ x ∂(volume.restrict (Set.Ioo (0:ℝ) 1)),
    Tendsto (fun N : ℕ => Real.log ((GenContFract.of x).dens N)/(N:ℝ)) atTop
      (𝓝 (Real.pi^2/(12*Real.log 2))) := by sorry

theorem gauss_kuzmin : ∃ C ρ : ℝ, 0 < C ∧ 0 < ρ ∧ ρ < 1 ∧
    ∀ a : ℕ, 0 < a → ∀ n : ℕ,
      |(volume.restrict (Set.Ioc (0:ℝ) 1)).real {x | gaussDigit x n = a} -
        Real.log (((a:ℝ)+1)^2/((a:ℝ)*((a:ℝ)+2)))/Real.log 2| ≤ C*ρ^n := by sorry

example : gaussDigit (1/2) 0 = 2 ∧ gaussDigit (1/2) 1 = 0 := by sorry

-- PM.4 continuation: light native word data and quantitative milestones.
local notation "I" => Icc (0 : ℝ) 1
local notation "D" => (Set.ofPred (fun x : ℝ => x ∈ Ioo (0 : ℝ) 1 ∧ Irrational x))
local notation "m" => volume.restrict (Ioo (0 : ℝ) 1)

def gaussCylinder (w : List ℕ) : Set ℝ :=
  {x | x ∈ D ∧ ∀ j : Fin w.length, gaussDigit x j = w[j]}

def inverseWord (w : List ℕ) : ℝ → ℝ :=
  w.foldr (fun a v y => 1 / ((a : ℝ) + v y)) id

def wordMatrix (w : List ℕ) : Matrix (Fin 2) (Fin 2) ℝ :=
  (w.map (fun a => !![0,1;1,(a : ℝ)])).prod

def gaussDensityTransfer (f : ℝ → ℝ) (x : ℝ) : ℝ :=
  ∑' k : ℕ, f (1 / ((k : ℝ) + 1 + x)) / ((k : ℝ) + 1 + x)^2

def normalizedGaussTransfer (g : ℝ → ℝ) (x : ℝ) : ℝ :=
  ∑' k : ℕ, (1+x) / (((k : ℝ)+1+x)*((k : ℝ)+2+x)) *
    g (1 / ((k : ℝ)+1+x))

lemma wordMatrix_native {w : List ℕ} {x : ℝ} (hx : x ∈ gaussCylinder w)
    (hn : 1 ≤ w.length) :
    wordMatrix w = !![(GenContFract.of x).nums (w.length-1), (GenContFract.of x).nums w.length;
      (GenContFract.of x).dens (w.length-1), (GenContFract.of x).dens w.length] := sorry

lemma orbit_product_identity {x : ℝ} (hx : x ∈ D) (N : ℕ) :
    (∏ j ∈ Finset.range N, (gaussMap^[j]) x)⁻¹ =
      (GenContFract.of x).dens N +
        (if N = 0 then 0 else (GenContFract.of x).dens (N-1)) *
          (gaussMap^[N]) x := sorry

lemma transfer_derivative_contraction {g : ℝ → ℝ} (hg : ContDiffOn ℝ 1 g I)
    {M : ℝ} (hM : 0 ≤ M) (hb : ∀ x ∈ I, |derivWithin g I x| ≤ M) :
    ∀ x ∈ I, |derivWithin (normalizedGaussTransfer g) I x| ≤ (9 / 10 : ℝ) * M := sorry

theorem density_uniform_error (n : ℕ) {x : ℝ} (hx : x ∈ I) :
    |(gaussDensityTransfer^[n]) (fun _ => 1) x - 1 / ((1 + x) * Real.log 2)| ≤
      (9 / 10 : ℝ) ^ n := sorry

lemma digit_marginal_error {a : ℕ} (ha : 1 ≤ a) (n : ℕ) :
    |(m).real {x | gaussDigit x n = a} -
      Real.log (((a : ℝ) + 1) ^ 2 / ((a : ℝ) * ((a : ℝ) + 2))) / Real.log 2| ≤
      (9 / 10 : ℝ) ^ n := sorry

example : inverseWord [1,2] 0 = 2/3 ∧ inverseWord [2,1] 0 = 1/3 := by sorry

example : wordMatrix [1,2] = !![(1 : ℝ),2;1,3] := by sorry

section HomogeneousConsumers
local notation "G" => Matrix.SpecialLinearGroup (Fin 2) ℝ
local notation "Γ" => MonoidHom.range (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) :
  Matrix.SpecialLinearGroup (Fin 2) ℤ →* G)
local instance : TopologicalSpace G :=
  inferInstanceAs (TopologicalSpace {A : Matrix (Fin 2) (Fin 2) ℝ // A.det = 1})
local notation "X" => G ⧸ Γ
local instance : MeasurableSpace X := borel X

variable (a u : ℝ → G)
variable (ha : ∀ t : ℝ, (a t : Matrix (Fin 2) (Fin 2) ℝ) =
  !![Real.exp t, 0; 0, Real.exp (-t)])
variable (hu : ∀ x : ℝ, (u x : Matrix (Fin 2) (Fin 2) ℝ) = !![1, x; 0, 1])

theorem homogeneous_birkhoff (μ : Measure X) [IsProbabilityMeasure μ]
    (hHaar : ∀ g : G, MeasurePreserving (fun z : X => g • z) μ μ)
    (hGN4 : IsStrongMixing (fun z : X => a 1 • z) ⟨μ, inferInstance⟩)
    {f : X → ℝ} (hf : Integrable f μ) :
    ∀ᵐ z ∂μ, Tendsto (fun N : ℕ => birkhoffAverage ℝ (fun w : X => a 1 • w) f N z)
      atTop (𝓝 (∫ w, f w ∂μ)) := sorry

-- One-sided orbit and compact closure, with all matrix conventions visible.
include ha hu
theorem bounded_digits_compact_orbit {x : ℝ} (hx : x ∈ D) :
    (∃ B : ℕ, ∀ n : ℕ, gaussDigit x n ≤ B) ↔
      IsCompact (closure {z : X | ∃ t : ℝ, 0 ≤ t ∧ z = QuotientGroup.mk (a t * u x)}) := sorry
theorem typical_unbounded_semiorbit : ∀ᵐ x ∂m,
    ¬ IsCompact (closure {z : X | ∃ t : ℝ, 0 ≤ t ∧ z = QuotientGroup.mk (a t * u x)}) := sorry

end HomogeneousConsumers

-- PM.5: interval endpoints, logarithmic weights and separate random models.
def shortMean (f : ArithmeticFunction ℝ) (x h : ℕ) : ℝ :=
  (∑ n ∈ Finset.Icc x (x+h), f n)/(h:ℝ)

def logCorrelation (f g : ArithmeticFunction ℂ) (a₁ a₂ : ℕ) (b₁ b₂ : ℤ) (x w : ℝ) : ℂ :=
  (∑ n ∈ Finset.Ioc ⌊x/w⌋₊ ⌊x⌋₊,
    f (((a₁:ℤ)*(n:ℤ)+b₁).toNat) * g (((a₂:ℤ)*(n:ℤ)+b₂).toNat) / (n:ℂ)) / (Real.log w : ℂ)

def rademacherModel {Ω : Type*} (ξ : ℕ → Ω → ℝ) (ω : Ω) : ArithmeticFunction ℝ where
  toFun n := if Squarefree n then ∏ p ∈ n.primeFactors, ξ p ω else 0
  map_zero' := by simp

def steinhausModel {Ω : Type*} (ζ : ℕ → Ω → ℂ) (ω : Ω) : ArithmeticFunction ℂ where
  toFun n := if n = 0 then 0 else ∏ p ∈ n.primeFactors, (ζ p ω)^n.factorization p
  map_zero' := by simp

theorem matomaki_radziwill : ∃ C C' : ℝ, 1 < C ∧ 1 < C' ∧
    ∀ (f : ArithmeticFunction ℝ) (hf : f.IsMultiplicative)
      (hb : ∀ n : ℕ, 0 < n → |f n| ≤ 1) (h X : ℕ) (hh : 2 ≤ h) (hX : h ≤ X)
      (δ : ℝ) (hδ : 0 < δ),
      (((Finset.Icc X (2*X)).filter (fun x =>
        δ+C'*Real.log (Real.log h)/Real.log h < |shortMean f x h-shortMean f X X|)).card : ℝ) ≤
      C*(X:ℝ)*(Real.rpow (Real.log h) (1/3)/(δ^2*Real.rpow h (δ/25)) +
        1/(δ^2*Real.rpow (Real.log X) (1/50))) := by sorry

theorem logarithmic_chowla (a₁ a₂ : ℕ) (ha₁ : 0 < a₁) (ha₂ : 0 < a₂) (b₁ b₂ : ℤ)
    (hd : (a₁:ℤ)*b₂-(a₂:ℤ)*b₁ ≠ 0) (w : ℝ → ℝ)
    (hw1 : ∀ᶠ x in atTop, 1 ≤ w x) (hwx : ∀ᶠ x in atTop, w x ≤ x) (hw : Tendsto w atTop atTop) :
    Tendsto (fun x : ℝ => logCorrelation (ArithmeticFunction.liouville : ArithmeticFunction ℂ)
      (ArithmeticFunction.liouville : ArithmeticFunction ℂ) a₁ a₂ b₁ b₂ x (w x)) atTop (𝓝 0) := by sorry

theorem liouville_two_point_nontrivial (h : ℕ) (hh : 0 < h) :
    ∃ δ : ℝ, 0 < δ ∧ ∃ X₀ : ℕ, ∀ X ≥ X₀,
      |∑ n ∈ Finset.Icc 1 X, (ArithmeticFunction.liouville n : ℝ) * (ArithmeticFunction.liouville (n+h) : ℝ)| ≤
        (1-δ)*(X:ℝ) := by sorry

example (f : ArithmeticFunction ℝ) (x : ℕ) : shortMean f x 1 = f x + f (x+1) := by sorry

example {Ω : Type*} (ξ : ℕ → Ω → ℝ) (ω : Ω) : rademacherModel ξ ω 4 = 0 := by sorry

example {Ω : Type*} (ζ : ℕ → Ω → ℂ) (ω : Ω) : steinhausModel ζ ω 4 = (ζ 2 ω)^2 := by sorry

end TauCeti.Probability.MetricNumberTheory
