/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Codex
-/
import Mathlib.MeasureTheory.Measure.Prokhorov
import Mathlib.MeasureTheory.Measure.LevyProkhorovMetric
import Mathlib.MeasureTheory.Measure.Support
import Mathlib.MeasureTheory.Group.Convolution
import Mathlib.MeasureTheory.Integral.Prod
import Mathlib.Analysis.Complex.CauchyIntegral
import Mathlib.Data.EReal.Basic
import Mathlib.Analysis.SpecialFunctions.FrullaniIntegral
import Mathlib.Topology.ContinuousMap.StoneWeierstrass
import Mathlib.Combinatorics.Nullstellensatz
import Mathlib.RingTheory.Polynomial.Resultant.Basic
import Mathlib.RingTheory.Polynomial.Eisenstein.Basic
import Mathlib.Analysis.LocallyConvex.Separation
import Mathlib.Topology.TietzeExtension
import Mathlib.Topology.Instances.CantorSet
import TauCeti.Probability.Process.EmpiricalMeasure
import TauCeti.Analysis.SpecialFunctions.Trigonometric.Chebyshev.Measure
import TauCeti.Analysis.PDE.FundamentalSolution.Planar

/-!
# Suggested declarations: logarithmic potential theory and algebraic integers

This file is a roadmap prototype. Definitions, API lemmas and examples are proposals,
not implementations. Proofs use `sorry`; their statements fix the mathematical contracts.
The README gives hypotheses, proof routes, unit tests and supplier boundaries.
-/
noncomputable section
open MeasureTheory Set Filter Polynomial
open scoped ENNReal NNReal Topology BigOperators
namespace TauCeti.LogPotential

-- Native measures and their support are retained. These are notation helpers.
private def extIntegral {X : Type*} [MeasurableSpace X] (μ : Measure X)
    (f : X → EReal) : EReal :=
  (∫⁻ x, (f x).toENNReal ∂μ : EReal) - (∫⁻ x, (-f x).toENNReal ∂μ : EReal)
abbrev supported {X : Type*} [MeasurableSpace X] (μ : Measure X) (K : Set X) := μ Kᶜ = 0
abbrev compactSupport {X : Type*} [MeasurableSpace X] [TopologicalSpace X]
    (μ : Measure X) := IsCompact μ.support
abbrev realLift (μ : Measure ℝ) : Measure ℂ := μ.map Complex.ofReal
abbrev realPoly (p : ℤ[X]) : ℝ[X] := p.map (Int.castRingHom ℝ)
abbrev complexPoly (p : ℤ[X]) : ℂ[X] := p.map (Int.castRingHom ℂ)
abbrev rootsIn (p : ℤ[X]) (K : Set ℝ) :=
  ∀ z : ℂ, (complexPoly p).IsRoot z → ∃ x ∈ K, (x : ℂ) = z
abbrev integerPolynomial (p : ℝ[X]) := ∃ q : ℤ[X], realPoly q = p
abbrev evenCoeff (p : ℝ[X]) (k : ℕ) := ∃ z : ℤ, p.coeff k = 2 * (z : ℝ)
def CountableComponents (K : Set ℝ) : Prop := {S : Set ℝ | ∃ x ∈ K, S = connectedComponentIn K x}.Countable


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.0 / log-kernel — smith Definition 2.1, p.5; saff §1 (1.8), p.171 -/
def logKernel (z w : ℂ) : EReal :=
  if z = w then ⊤ else ((-Real.log ‖z - w‖ : ℝ) : EReal)


/-- The kernel is symmetric. -/
lemma logKernel_symm (z w : ℂ) : logKernel z w = logKernel w z := by
  sorry


/-- Off the diagonal the value is −log of the distance. -/
lemma logKernel_off_diagonal {z w : ℂ} (h : z ≠ w) : logKernel z w = ((-Real.log ‖z-w‖ : ℝ) : EReal) := by
  sorry


/-- Off the diagonal k is 2π times Tau Ceti’s planar kernel. -/
lemma logKernel_planar {z w : ℂ} (h : z ≠ w) : logKernel z w = ((2 * Real.pi * TauCeti.planarNewtonianKernel (z-w) : ℝ) : EReal) := by
  sorry


/-- Unit test `kernel_diagonal`: k(0,0)=+∞. -/
example  : logKernel 0 0 = ⊤ := by
  sorry


/-- Unit test `kernel_unit_distance`: k(0,1)=0. -/
example  : logKernel 0 1 = 0 := by
  sorry


/-- Unit test `kernel_distance_two`: k(0,2)=−log 2. -/
example  : logKernel 0 2 = ((-Real.log 2 : ℝ) : EReal) := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.0 / potential — smith Definition 2.1, p.5; saff §1 (1.8), p.171 -/
def logPotential (μ : Measure ℂ) (z : ℂ) : EReal := extIntegral μ (logKernel z)
abbrev realPotential (μ : Measure ℝ) (x : ℝ) : EReal := logPotential (realLift μ) (x : ℂ)


/-- A Dirac potential is its kernel. -/
lemma logPotential_dirac (a z : ℂ) : logPotential (Measure.dirac a) z = logKernel z a := by
  sorry


/-- On a compactly supported finite measure the potential is the increasing supremum of upper truncations. -/
lemma logPotential_truncation (μ : Measure ℂ) [IsFiniteMeasure μ] (h : compactSupport μ) (z : ℂ) : logPotential μ z = ⨆ n : ℕ, ((∫ w, (min (n : EReal) (logKernel z w)).toReal ∂μ : ℝ) : EReal) := by
  sorry


/-- Potentials add for compactly supported finite positive measures. -/
lemma logPotential_add (μ ν : Measure ℂ) [IsFiniteMeasure μ] [IsFiniteMeasure ν] (hμ : compactSupport μ) (hν : compactSupport ν) (z : ℂ) : logPotential (μ+ν) z = logPotential μ z + logPotential ν z := by
  sorry


/-- Unit test `potential_zero`: The zero measure has zero potential. -/
example (z : ℂ) : logPotential 0 z = 0 := by
  sorry


/-- Unit test `potential_atom`: A unit atom has infinite potential at its location. -/
example (a : ℂ) : logPotential (Measure.dirac a) a = ⊤ := by
  sorry


/-- Unit test `potential_two_atoms`: Two unit atoms at 0 and 1 give potential −log 2 at 2. -/
example  : logPotential (Measure.dirac 0 + Measure.dirac 1) 2 = ((-Real.log 2 : ℝ) : EReal) := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.0 / energy — smith Definition 2.1, p.5; saff §1 (1.9), p.171 -/
def logEnergy (μ : Measure ℂ) : EReal :=
  extIntegral (μ.prod μ) (fun zw => logKernel zw.1 zw.2)


/-- Energy equals the integral of the potential under compact support and finite mass. -/
lemma logEnergy_integral_potential (μ : Measure ℂ) [IsFiniteMeasure μ] (h : compactSupport μ) : logEnergy μ = extIntegral μ (logPotential μ) := by
  sorry


/-- Scaling mass by a finite nonnegative real scales energy quadratically. -/
lemma logEnergy_smul (μ : Measure ℂ) [IsFiniteMeasure μ] (h : compactSupport μ) (a : ℝ≥0) : logEnergy ((a : ℝ≥0∞) • μ) = (a : EReal)^2 * logEnergy μ := by
  sorry


/-- Compact support excludes negative infinite energy. -/
lemma logEnergy_not_bot (μ : Measure ℂ) [IsFiniteMeasure μ] (h : compactSupport μ) : logEnergy μ ≠ ⊥ := by
  sorry


/-- Unit test `energy_zero`: I(0)=0. -/
example  : logEnergy 0 = 0 := by
  sorry


/-- Unit test `energy_dirac`: I(δ0)=+∞, ruling out totalized Bochner energy. -/
example  : logEnergy (Measure.dirac 0) = ⊤ := by
  sorry


/-- Unit test `energy_uniform_unit_interval`: Uniform [0,1] has energy 3/2. -/
example : logEnergy (realLift (volume.restrict (Icc (0 : ℝ) 1))) = (3/2 : EReal) := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.0 / descent — saff Lemma 1.6, pp.171–172 -/
theorem potential_lowerSemicontinuous (μ : Measure ℂ) [IsFiniteMeasure μ]
    (h : compactSupport μ) : LowerSemicontinuous (logPotential μ) := by sorry

theorem energy_descent (K : Set ℂ) (hK : IsCompact K)
    (μ : ℕ → ProbabilityMeasure ℂ) (ν : ProbabilityMeasure ℂ)
    (hs : ∀ n, supported (μ n : Measure ℂ) K)
    (hlim : Tendsto μ atTop (𝓝 ν)) :
    logEnergy (ν : Measure ℂ) ≤ liminf (fun n => logEnergy (μ n : Measure ℂ)) atTop := by sorry

theorem potential_descent (K : Set ℂ) (hK : IsCompact K)
    (μ : ℕ → ProbabilityMeasure ℂ) (ν : ProbabilityMeasure ℂ)
    (hs : ∀ n, supported (μ n : Measure ℂ) K)
    (hlim : Tendsto μ atTop (𝓝 ν)) (z : ℂ) :
    logPotential (ν : Measure ℂ) z ≤ liminf (fun n => logPotential (μ n : Measure ℂ) z) atTop := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1 / capacity — saff Definition 1.8, p.172; Borel convention following Example 1.11, p.174 -/
def robinConstant (K : Set ℂ) : EReal :=
  sInf {r | ∃ μ : ProbabilityMeasure ℂ, supported (μ : Measure ℂ) K ∧ r = logEnergy (μ : Measure ℂ)}
def capacity (K : Set ℂ) : ℝ :=
  if robinConstant K = ⊤ then 0 else Real.exp (-(robinConstant K).toReal)
def innerCapacity (E : Set ℂ) : EReal :=
  sSup (insert 0 {r | ∃ L : Set ℂ, IsCompact L ∧ L ⊆ E ∧ r = (capacity L : EReal)})
abbrev realCapacity (K : Set ℝ) : ℝ := capacity (Complex.ofReal '' K)


/-- Capacity is monotone on compact sets. -/
lemma capacity_mono {K L : Set ℂ} (hK : IsCompact K) (hL : IsCompact L) (h : K ⊆ L) : capacity K ≤ capacity L := by
  sorry


/-- A nonzero complex affine map multiplies capacity by |a|. -/
lemma capacity_affine (K : Set ℂ) (hK : IsCompact K) (a b : ℂ) (ha : a ≠ 0) : capacity (Set.image (fun z => a*z+b) K) = ‖a‖ * capacity K := by
  sorry


/-- The Borel inner extension agrees with compact capacity. -/
lemma innerCapacity_compact (K : Set ℂ) (hK : IsCompact K) : innerCapacity K = capacity K := by
  sorry


/-- Unit test `capacity_singleton`: A singleton has capacity zero. -/
example (a : ℂ) : capacity {a} = 0 := by
  sorry


/-- Unit test `capacity_disk`: A closed disk of positive radius r has capacity r. -/
example (a : ℂ) (r : ℝ) (hr : 0 < r) : capacity (Metric.closedBall a r) = r := by
  sorry


/-- Unit test `capacity_interval`: A nondegenerate real interval has capacity (b−a)/4. -/
example (a b : ℝ) (h : a < b) : realCapacity (Icc a b) = (b-a)/4 := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1 / polar — saff Definition 1.8, p.172; quasi-everywhere convention, p.174; levenberg Proposition 2.4 and Corollary 2.5, pp.10–11 -/
def Polar (E : Set ℂ) : Prop := ∀ L : Set ℂ, IsCompact L → L ⊆ E → capacity L = 0
def QuasiEverywhere (K : Set ℂ) (P : ℂ → Prop) : Prop := Polar {z | z ∈ K ∧ ¬ P z}


/-- For Borel sets, polarity is exactly vanishing inner capacity. -/
lemma polar_iff_innerCapacity_zero (E : Set ℂ) (hE : MeasurableSet E) : Polar E ↔ innerCapacity E = 0 := by
  sorry


/-- Subsets of polar sets are polar. -/
lemma polar_subset {E F : Set ℂ} (h : E ⊆ F) (hp : Polar F) : Polar E := by
  sorry


/-- The exceptional set is inside the specified domain. -/
lemma quasiEverywhere_iff (K : Set ℂ) (P : ℂ → Prop) : QuasiEverywhere K P ↔ Polar {z | z ∈ K ∧ ¬ P z} := by
  sorry


/-- Unit test `polar_empty`: The empty set is polar. -/
example  : Polar ∅ := by
  sorry


/-- Unit test `polar_countable`: Every countable set is polar, even with accumulation points. -/
example (E : Set ℂ) (h : E.Countable) : Polar E := by
  sorry


/-- Unit test `interval_not_polar`: The real interval [0,1] is not polar despite having area zero. -/
example  : ¬ Polar (Set.image Complex.ofReal (Icc (0 : ℝ) 1)) := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1 / polar-null — levenberg Proposition 2.4 and Corollary 2.5, pp.10–11 -/
theorem polar_measure_zero (μ : Measure ℂ) [IsFiniteMeasure μ]
    (hμ : compactSupport μ) (hI : logEnergy μ < ⊤)
    (E : Set ℂ) (hE : MeasurableSet E) (hp : Polar E) : μ E = 0 := by sorry

theorem polar_iUnion (E : ℕ → Set ℂ) (hE : ∀ n, MeasurableSet (E n))
    (hp : ∀ n, Polar (E n)) : Polar (⋃ n, E n) := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1 / equilibrium — saff Lemma 1.7, p.172; levenberg Proposition 2.1 and Corollary 2.2, pp.8–9 -/
def equilibrium (K : Set ℂ) : ProbabilityMeasure ℂ := by sorry


/-- The equilibrium measure is supported on K under compactness and positive capacity. -/
lemma equilibrium_supported (K : Set ℂ) (hK : IsCompact K) (hc : 0 < capacity K) : supported (equilibrium K : Measure ℂ) K := by
  sorry


/-- Its energy is the Robin constant. -/
lemma equilibrium_energy (K : Set ℂ) (hK : IsCompact K) (hc : 0 < capacity K) : logEnergy (equilibrium K : Measure ℂ) = robinConstant K := by
  sorry


/-- A supported probability with minimal energy equals the equilibrium measure. -/
lemma equilibrium_unique (K : Set ℂ) (hK : IsCompact K) (hc : 0 < capacity K) (μ : ProbabilityMeasure ℂ) (hs : supported (μ : Measure ℂ) K) (he : logEnergy (μ : Measure ℂ) = robinConstant K) : μ = equilibrium K := by
  sorry


/-- Unit test `equilibrium_unit_disk`: The equilibrium potential of the unit disk is zero at its centre. -/
example  : logPotential (equilibrium (Metric.closedBall (0 : ℂ) 1) : Measure ℂ) 0 = 0 := by
  sorry


/-- Unit test `equilibrium_polar_addition`: Adding a disjoint singleton to a positive-capacity compact set changes neither capacity nor equilibrium. -/
example (K : Set ℂ) (hK : IsCompact K) (hc : 0 < capacity K) (a : ℂ) : equilibrium (insert a K) = equilibrium K := by
  sorry


/-- Unit test `equilibrium_not_dirac`: The equilibrium law of [−2,2] is not a Dirac law. -/
example  : (equilibrium (Set.image Complex.ofReal (Icc (-2 : ℝ) 2)) : Measure ℂ) ≠ Measure.dirac 0 := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1 / frostman — levenberg Theorem 2.6, pp.11–12; Proposition 1.4, p.6; saff Theorem 1.12, p.174 -/
theorem frostman (K : Set ℂ) (hK : IsCompact K) (hc : 0 < capacity K) :
    (∀ z, logPotential (equilibrium K : Measure ℂ) z ≤ robinConstant K) ∧
    QuasiEverywhere K (fun z => logPotential (equilibrium K : Measure ℂ) z = robinConstant K) := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1 / domination — saff Theorem 2.8, p.182 -/
theorem domination (μ ν : Measure ℂ) [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    (hμ : compactSupport μ) (hν : compactSupport ν) (hpos : 0 < μ univ)
    (hm : ν univ ≤ μ univ) (hI : logEnergy μ < ⊤) (c : ℝ)
    (h : ∀ᵐ z ∂μ, logPotential μ z ≤ logPotential ν z + (c : EReal)) :
    ∀ z, logPotential μ z ≤ logPotential ν z + (c : EReal) := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1 / capacity-continuity — smith Proposition 2.5 proof, pp.36–37; levenberg §2 Exercise 3, p.13; Proposition 2.4, pp.10–11 -/
theorem innerCapacity_iUnion (E : ℕ → Set ℂ) (hE : ∀ n, MeasurableSet (E n))
    (hm : Monotone E) (hb : Bornology.IsBounded (⋃ n, E n)) :
    innerCapacity (⋃ n, E n) = ⨆ n, innerCapacity (E n) := by sorry

theorem capacity_iInter (K : ℕ → Set ℂ) (hK : ∀ n, IsCompact (K n))
    (hn : ∀ n, (K n).Nonempty) (hm : Antitone K) :
    capacity (⋂ n, K n) = ⨅ n, capacity (K n) := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.2 / external-field — levenberg §5, p.23; saff §6, p.196 -/
def AdmissibleField (K : Set ℂ) (Q : ℂ → EReal) : Prop :=
  LowerSemicontinuousOn Q K ∧ (∃ c : ℝ, ∀ z ∈ K, (c : EReal) ≤ Q z) ∧
    ¬ Polar {z | z ∈ K ∧ Q z ≠ ⊤}
def fieldWeight (Q : ℂ → EReal) (z : ℂ) : ℝ :=
  if Q z = ⊤ then 0 else Real.exp (-(Q z).toReal)


/-- A finite constant field is admissible exactly when K is nonpolar. -/
lemma admissibleField_const (K : Set ℂ) (hK : IsCompact K) (c : ℝ) (hp : ¬ Polar K) : AdmissibleField K (fun _ => (c : EReal)) := by
  sorry


/-- Infinite field means zero weight. -/
lemma fieldWeight_top (Q : ℂ → EReal) (z : ℂ) (h : Q z = ⊤) : fieldWeight Q z = 0 := by
  sorry


/-- At a finite field value c the weight is exp(−c). -/
lemma fieldWeight_finite (Q : ℂ → EReal) (z : ℂ) (c : ℝ) (h : Q z = (c : EReal)) : fieldWeight Q z = Real.exp (-c) := by
  sorry


/-- Unit test `zero_field_weight`: The zero field has unit weight. -/
example  : fieldWeight (fun _ => 0) 0 = 1 := by
  sorry


/-- Unit test `infinite_field_not_admissible`: The field identically +∞ is never admissible. -/
example (K : Set ℂ) : ¬ AdmissibleField K (fun _ => ⊤) := by
  sorry


/-- Unit test `singleton_field_not_admissible`: A finite field on a singleton still fails the nonpolar condition. -/
example  : ¬ AdmissibleField ({0} : Set ℂ) (fun _ => 0) := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.2 / weighted-energy — levenberg §5, p.23, weighted energy definition -/
def weightedEnergy (μ : Measure ℂ) (Q : ℂ → EReal) : EReal :=
  logEnergy μ + 2 * extIntegral μ Q


/-- Zero field gives ordinary energy. -/
lemma weightedEnergy_zero_field (μ : Measure ℂ) [IsFiniteMeasure μ] (h : compactSupport μ) : weightedEnergy μ (fun _ => 0) = logEnergy μ := by
  sorry


/-- A constant c shifts the energy of a probability by 2c. -/
lemma weightedEnergy_const (μ : ProbabilityMeasure ℂ) (h : compactSupport (μ : Measure ℂ)) (c : ℝ) : weightedEnergy (μ : Measure ℂ) (fun _ => (c : EReal)) = logEnergy (μ : Measure ℂ) + (2*c : ℝ) := by
  sorry


/-- Admissible compact weighted problems attain a finite minimum. -/
lemma weightedEnergy_minimum_exists (K : Set ℂ) (hK : IsCompact K) (Q : ℂ → EReal) (hQ : AdmissibleField K Q) : ∃ μ : ProbabilityMeasure ℂ, supported (μ : Measure ℂ) K ∧ weightedEnergy (μ : Measure ℂ) Q < ⊤ ∧ ∀ ν : ProbabilityMeasure ℂ, supported (ν : Measure ℂ) K → weightedEnergy (μ : Measure ℂ) Q ≤ weightedEnergy (ν : Measure ℂ) Q := by
  sorry


/-- Unit test `weighted_energy_zero`: Zero measure in zero field has energy zero. -/
example  : weightedEnergy 0 (fun _ => 0) = 0 := by
  sorry


/-- Unit test `weighted_energy_atom`: A finite external field cannot remove atomic infinite energy. -/
example  : weightedEnergy (Measure.dirac (0 : ℂ)) (fun _ => 1) = ⊤ := by
  sorry


/-- Unit test `weighted_energy_factor_two`: At field 1 the unit disk equilibrium has weighted energy 2. -/
example  : weightedEnergy (equilibrium (Metric.closedBall (0 : ℂ) 1) : Measure ℂ) (fun _ => 1) = 2 := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.2 / weighted-equilibrium — saff §6 (6.2), pp.196–198; levenberg §5 and Proposition 5.1, pp.23–24 -/
def weightedEquilibrium (K : Set ℂ) (Q : ℂ → EReal) : ProbabilityMeasure ℂ := by sorry
def weightedRobin (K : Set ℂ) (Q : ℂ → EReal) : ℝ :=
  (weightedEnergy (weightedEquilibrium K Q : Measure ℂ) Q).toReal
    - (extIntegral (weightedEquilibrium K Q : Measure ℂ) Q).toReal


/-- Weighted equilibrium minimizes against every supported probability. -/
lemma weightedEquilibrium_minimizes (K : Set ℂ) (hK : IsCompact K) (Q : ℂ → EReal) (hQ : AdmissibleField K Q) (ν : ProbabilityMeasure ℂ) (hs : supported (ν : Measure ℂ) K) : weightedEnergy (weightedEquilibrium K Q : Measure ℂ) Q ≤ weightedEnergy (ν : Measure ℂ) Q := by
  sorry


/-- The zero-field construction agrees with the ordinary minimizer. -/
lemma weightedEquilibrium_zero_field (K : Set ℂ) (hK : IsCompact K) (hc : 0 < capacity K) : weightedEquilibrium K (fun _ => 0) = equilibrium K := by
  sorry


/-- A finite constant field c leaves the minimizer unchanged and shifts F by c. -/
lemma weightedRobin_const (K : Set ℂ) (hK : IsCompact K) (hc : 0 < capacity K) (c : ℝ) : weightedRobin K (fun _ => (c : EReal)) = -Real.log (capacity K) + c := by
  sorry


/-- Unit test `weighted_robin_unit_disk`: For the unit disk and field 1, F=1 rather than V=2. -/
example  : weightedRobin (Metric.closedBall (0 : ℂ) 1) (fun _ => 1) = 1 := by
  sorry


/-- Unit test `weighted_eq_const`: The constant-field equilibrium equals the ordinary unit disk law. -/
example  : weightedEquilibrium (Metric.closedBall (0 : ℂ) 1) (fun _ => 1) = equilibrium (Metric.closedBall (0 : ℂ) 1) := by
  sorry


/-- Unit test `weighted_robin_interval`: On [−1,1] in zero field, F=log 2. -/
example  : weightedRobin (Set.image Complex.ofReal (Icc (-1 : ℝ) 1)) (fun _ => 0) = Real.log 2 := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.2 / weighted-variational — saff §6 (6.2), pp.197–198; levenberg Proposition 5.1, p.24 -/
theorem weighted_variational (K : Set ℂ) (hK : IsCompact K)
    (Q : ℂ → EReal) (hQ : AdmissibleField K Q) :
    let μ := (weightedEquilibrium K Q : Measure ℂ)
    logEnergy μ < ⊤ ∧ supported μ K ∧
    QuasiEverywhere K (fun z => (weightedRobin K Q : EReal) ≤ logPotential μ z + Q z) ∧
    (∀ᵐ z ∂μ, logPotential μ z + Q z = (weightedRobin K Q : EReal)) := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.2 / weighted-norm — smith Definition 2.6, p.7; Lemma 4.9, p.29 -/
def weightedNorm (K : Set ℝ) (w : ℝ → ℝ) (t : ℝ) (p : ℝ[X]) : ℝ :=
  sSup (insert 0 {v | ∃ x ∈ K, v = Real.rpow (w x) t * |p.eval x|})
def potentialWeight (μ : Measure ℝ) (x : ℝ) : ℝ := Real.exp (realPotential μ x).toReal
abbrev nNorm (K : Set ℝ) (μ : Measure ℝ) (t : ℝ) (p : ℝ[X]) :=
  weightedNorm K (potentialWeight μ) t p


/-- The zero polynomial has norm zero on compact K with continuous positive weight. -/
lemma weightedNorm_zero (K : Set ℝ) (hK : IsCompact K) (w : ℝ → ℝ) (hw : ContinuousOn w K) (hp : ∀ x ∈ K, 0 < w x) (t : ℝ) : weightedNorm K w t 0 = 0 := by
  sorry


/-- The norm is at most C iff every weighted value is at most C, for C≥0 and bounded weighted values. -/
lemma weightedNorm_bound (K : Set ℝ) (hK : IsCompact K) (w : ℝ → ℝ) (hw : ContinuousOn w K) (hp : ∀ x ∈ K, 0 < w x) (t : ℝ) (p : ℝ[X]) (C : ℝ) (hC : 0 ≤ C) : weightedNorm K w t p ≤ C ↔ ∀ x ∈ K, Real.rpow (w x) t * |p.eval x| ≤ C := by
  sorry


/-- Products satisfy the norm inequality when the exponents add. -/
lemma weightedNorm_mul (K : Set ℝ) (hK : IsCompact K) (w : ℝ → ℝ) (hw : ContinuousOn w K) (hp : ∀ x ∈ K, 0 < w x) (s t : ℝ) (p q : ℝ[X]) : weightedNorm K w (s+t) (p*q) ≤ weightedNorm K w s p * weightedNorm K w t q := by
  sorry


/-- Unit test `norm_empty`: The supremum on the empty set is zero. -/
example (w : ℝ → ℝ) (t : ℝ) (p : ℝ[X]) : weightedNorm ∅ w t p = 0 := by
  sorry


/-- Unit test `norm_unit_interval`: X on [−1,1] at unit weight has norm 1. -/
example  : weightedNorm (Icc (-1 : ℝ) 1) (fun _ => 1) 3 X = 1 := by
  sorry


/-- Unit test `norm_constant_weight`: Weight 2 and exponent 3 give norm 8 to the constant polynomial 1 on [0,1]. -/
example  : weightedNorm (Icc (0 : ℝ) 1) (fun _ => 2) 3 1 = 8 := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.2 / weighted-extremal — Smith Lemma 2.7 proof, pp.7–8; Saff Theorem 6.1, p.197; Levenberg Proposition 5.2, pp.24–25 -/



/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.3 / holder — smith Definition 2.2, p.5 -/
def HolderMeasure (μ : Measure ℝ) (η : ℝ) : Prop :=
  0 < η ∧ ∃ C : ℝ, 0 < C ∧ ∀ x y : ℝ, x ≤ y →
    μ (Icc x y) ≤ ENNReal.ofReal (C * Real.rpow (y-x) η)
def IsHolder (μ : Measure ℝ) : Prop := ∃ η : ℝ, HolderMeasure μ η


/-- A positive Hölder exponent forces every singleton to have zero mass. -/
lemma holder_no_atoms (μ : Measure ℝ) (η : ℝ) (h : HolderMeasure μ η) (x : ℝ) : μ {x} = 0 := by
  sorry


/-- Finite nonnegative scalar multiplication preserves the exponent. -/
lemma holder_smul (μ : Measure ℝ) (η : ℝ) (h : HolderMeasure μ η) (a : ℝ≥0) : HolderMeasure ((a : ℝ≥0∞) • μ) η := by
  sorry


/-- Restriction to any measurable set preserves the mass bound and exponent. -/
lemma holder_restrict (μ : Measure ℝ) (η : ℝ) (h : HolderMeasure μ η) (E : Set ℝ) : HolderMeasure (μ.restrict E) η := by
  sorry


/-- Unit test `holder_zero`: The zero measure is η-Hölder for every positive η. -/
example (η : ℝ) (hη : 0 < η) : HolderMeasure 0 η := by
  sorry


/-- Unit test `dirac_not_holder`: A unit atom is not Hölder. -/
example (a : ℝ) (η : ℝ) : ¬ HolderMeasure (Measure.dirac a) η := by
  sorry


/-- Unit test `uniform_holder`: Restricted volume on [0,1] is 1-Hölder. -/
example  : HolderMeasure (volume.restrict (Icc (0 : ℝ) 1)) 1 := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.3 / intervals — smith Definition 2.4, p.7 -/
def FiniteIntervals (K : Set ℝ) : Prop :=
  ∃ m : ℕ, 0 < m ∧ ∃ a b : Fin m → ℝ,
    (∀ i, a i < b i) ∧ (∀ i j, i < j → b i < a j) ∧
    K = ⋃ i, Icc (a i) (b i)


/-- A finite interval set is compact. -/
lemma finiteIntervals_compact (K : Set ℝ) (h : FiniteIntervals K) : IsCompact K := by
  sorry


/-- The nonempty condition is part of the carrier. -/
lemma finiteIntervals_nonempty (K : Set ℝ) (h : FiniteIntervals K) : K.Nonempty := by
  sorry


/-- A nonzero real affine map preserves finite interval sets, reversing the witness order when needed. -/
lemma finiteIntervals_affine (K : Set ℝ) (h : FiniteIntervals K) (a b : ℝ) (ha : a ≠ 0) : FiniteIntervals (Set.image (fun x => a*x+b) K) := by
  sorry


/-- Unit test `one_interval`: A single positive-length interval is allowed. -/
example  : FiniteIntervals (Icc (0 : ℝ) 1) := by
  sorry


/-- Unit test `intervals_with_gap`: Two separated nondegenerate intervals are allowed. -/
example  : FiniteIntervals (Icc (-3 : ℝ) (-1) ∪ Icc (1 : ℝ) 3) := by
  sorry


/-- Unit test `interval_and_isolated_point`: A singleton disjoint from a positive-length interval is forbidden. -/
example  : ¬ FiniteIntervals (insert (3 : ℝ) (Icc (0 : ℝ) 1)) := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.3 / holder-potential — smith Lemma 2.3, p.6; levenberg Proposition 1.4, p.6 -/
theorem holder_potential (μ : Measure ℝ) [IsFiniteMeasure μ]
    (hc : compactSupport μ) (η : ℝ) (h : HolderMeasure μ η) (hη : η < 1) :
    (∀ z : ℂ, logPotential (realLift μ) z ≠ ⊤) ∧
    Continuous (fun z : ℂ => (logPotential (realLift μ) z).toReal) ∧
    ∃ C : ℝ, 0 < C ∧ ∀ x y : ℝ,
      |(realPotential μ x).toReal - (realPotential μ y).toReal| ≤ C * Real.rpow |x-y| η := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.3 / potential-field — smith Lemma 2.7 proof, pp.7–8; levenberg Proposition 5.1, p.24 -/
theorem potential_field_equilibrium (K : Set ℝ) (hK : IsCompact K)
    (μ : ProbabilityMeasure ℝ) (hs : supported (μ : Measure ℝ) K)
    (hH : IsHolder (μ : Measure ℝ)) :
    weightedEquilibrium (Complex.ofReal '' K) (fun z => -logPotential (realLift (μ : Measure ℝ)) z) =
      (⟨realLift (μ : Measure ℝ), by sorry⟩ : ProbabilityMeasure ℂ) ∧
    weightedRobin (Complex.ofReal '' K) (fun z => -logPotential (realLift (μ : Measure ℝ)) z) = 0 := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.3 / polynomial-root-law — smith Lemma 2.7, p.7; normalized root measures in §1, p.4 -/
def polynomialRootLaw (p : ℝ[X]) : ProbabilityMeasure ℝ := by sorry


/-- For a positive-degree splitting polynomial, the underlying law is the normalized native multiset sum of Dirac measures. -/
lemma polynomialRootLaw_measure (p : ℝ[X]) (hd : 0 < p.natDegree) (hs : p.Splits) : (polynomialRootLaw p : Measure ℝ) = ((p.natDegree : ℝ≥0∞)⁻¹) • (p.roots.map Measure.dirac).sum := by
  sorry


/-- Integration is the average over roots with multiplicity. -/
lemma polynomialRootLaw_integral (p : ℝ[X]) (hd : 0 < p.natDegree) (hs : p.Splits) (F : ℝ → ℝ) (hF : Measurable F) : ∫ x, F x ∂(polynomialRootLaw p : Measure ℝ) = (p.natDegree : ℝ)⁻¹ * (p.roots.map F).sum := by
  sorry


/-- Numbering the multiset recovers the imported empirical law, including repeated roots. -/
lemma polynomialRootLaw_empirical (n : ℕ) (r : Fin (n+1) → ℝ) (p : ℝ[X]) (hp : p = ∏ i, (X-C (r i))) : polynomialRootLaw p = TauCeti.Probability.empiricalMeasureOfFintype r := by
  sorry


/-- Unit test `root_law_linear`: X−2 has law δ2. -/
example  : (polynomialRootLaw (X-C (2 : ℝ)) : Measure ℝ) = Measure.dirac 2 := by
  sorry


/-- Unit test `root_law_repeated`: (X−1)² has the same law as X−1, retaining multiplicity. -/
example  : polynomialRootLaw ((X-C (1 : ℝ))^2) = polynomialRootLaw (X-C 1) := by
  sorry


/-- Unit test `root_law_no_real_roots`: X²+1 uses the explicit zero-real-root default δ0, and is excluded by the splitting hypotheses. -/
example  : (polynomialRootLaw ((X : ℝ[X])^2+1) : Measure ℝ) = Measure.dirac 0 := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.3 / weighted-zero-limit — smith Lemma 2.7, pp.7–8 -/
theorem weighted_zero_limit (K : Set ℝ) (hK : IsCompact K)
    (μ : ProbabilityMeasure ℝ) (hs : supported (μ : Measure ℝ) K) (hH : IsHolder (μ : Measure ℝ))
    (P : ℕ → ℝ[X]) (hP : ∀ i, (P i).Monic ∧ (P i).Splits ∧
      0 < (P i).natDegree ∧ ∀ x ∈ (P i).roots, x ∈ K)
    (hd : Tendsto (fun i => (P i).natDegree) atTop atTop)
    (hn : Tendsto (fun i => Real.rpow (nNorm K (μ : Measure ℝ) (P i).natDegree (P i))
      (1/(P i).natDegree : ℝ)) atTop (𝓝 1)) :
    Tendsto (fun i => polynomialRootLaw (P i)) atTop (𝓝 μ) := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.3 / remez — smith Lemma 2.8 proof, p.8 (special case of Erdélyi Theorem 1) -/
theorem remez (m : ℕ) (hm : 1 ≤ m) (P : ℂ[X]) (hd : P.natDegree ≤ m)
    (E : Set ℝ) (hE : MeasurableSet E) (hsub : E ⊆ Icc (-1 : ℝ) 1)
    (hvol : ENNReal.ofReal (2 - (m : ℝ)⁻¹^2) ≤ volume E) :
    sSup (insert 0 {v | ∃ x ∈ Icc (-1 : ℝ) 1, v = ‖P.eval (x : ℂ)‖}) ≤
      Real.exp 5 * sSup (insert 0 {v | ∃ x ∈ E, v = ‖P.eval (x : ℂ)‖}) := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.3 / root-removal — smith Lemma 2.8, p.8, (2.4) -/


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.4 / integer-log-moment — smith Theorem 1.5 condition (1), p.4; Definition 2.1, p.5 -/
def logAbs (x : ℝ) : EReal := if x = 0 then ⊥ else ((Real.log |x| : ℝ) : EReal)
def logMoment (μ : Measure ℝ) (Q : ℤ[X]) : EReal := extIntegral μ (fun x => logAbs ((realPoly Q).eval x))


/-- Nonzero polynomial products have additive logarithmic moments for compact finite measures. -/
lemma logMoment_mul (μ : Measure ℝ) [IsFiniteMeasure μ] (h : compactSupport μ) (P Q : ℤ[X]) (hP : P ≠ 0) (hQ : Q ≠ 0) : logMoment μ (P*Q) = logMoment μ P + logMoment μ Q := by
  sorry


/-- Dirac moments evaluate the extended logarithm. -/
lemma logMoment_dirac (a : ℝ) (Q : ℤ[X]) : logMoment (Measure.dirac a) Q = logAbs ((realPoly Q).eval a) := by
  sorry


/-- For a probability and nonzero integer c, the constant moment is log|c|. -/
lemma logMoment_const (μ : ProbabilityMeasure ℝ) (c : ℤ) (hc : c ≠ 0) : logMoment (μ : Measure ℝ) (C c) = ((Real.log |(c : ℝ)| : ℝ) : EReal) := by
  sorry


/-- Unit test `log_moment_unit`: The constant polynomial 1 has moment zero. -/
example (μ : ProbabilityMeasure ℝ) : logMoment (μ : Measure ℝ) 1 = 0 := by
  sorry


/-- Unit test `log_moment_root_atom`: At δ0 the polynomial X has moment −∞. -/
example  : logMoment (Measure.dirac 0) X = ⊥ := by
  sorry


/-- Unit test `log_moment_integer_value`: At δ2 the polynomial X has moment log 2. -/
example  : logMoment (Measure.dirac 2) X = ((Real.log 2 : ℝ) : EReal) := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.4 / admissible-measure — smith Theorem 1.5 (1), p.4 -/
def ArithmeticAdmissible (μ : Measure ℝ) : Prop := ∀ Q : ℤ[X], Q ≠ 0 → 0 ≤ logMoment μ Q


/-- Every nonzero integer polynomial has nonnegative moment. -/
lemma admissible_moment (μ : Measure ℝ) (h : ArithmeticAdmissible μ) (Q : ℤ[X]) (hQ : Q ≠ 0) : 0 ≤ logMoment μ Q := by
  sorry


/-- Convex mixtures of compactly supported admissible probabilities remain admissible. -/
lemma admissible_convex (μ ν : ProbabilityMeasure ℝ) (hcμ : compactSupport (μ : Measure ℝ)) (hcν : compactSupport (ν : Measure ℝ)) (hμ : ArithmeticAdmissible (μ : Measure ℝ)) (hν : ArithmeticAdmissible (ν : Measure ℝ)) (t : ℝ) (ht : 0 ≤ t) (ht1 : t ≤ 1) : ArithmeticAdmissible (ENNReal.ofReal t • (μ : Measure ℝ) + ENNReal.ofReal (1-t) • (ν : Measure ℝ)) := by
  sorry


/-- Translation by an integer and reflection preserve admissibility in both directions. -/
lemma admissible_integer_affine (μ : Measure ℝ) [IsFiniteMeasure μ] (hc : compactSupport μ) (b : ℤ) (s : ℤ) (hs : s = 1 ∨ s = -1) : ArithmeticAdmissible (μ.map (fun x => (s : ℝ)*x+(b : ℝ))) ↔ ArithmeticAdmissible μ := by
  sorry


/-- Unit test `admissible_zero`: Zero mass satisfies the inequalities; probability is not baked into this predicate. -/
example  : ArithmeticAdmissible 0 := by
  sorry


/-- Unit test `integer_dirac_not_admissible`: An integer atom is excluded by X−a. -/
example (a : ℤ) : ¬ ArithmeticAdmissible (Measure.dirac (a : ℝ)) := by
  sorry


/-- Unit test `admissible_reflection`: Reflection of a compactly supported admissible measure stays admissible. -/
example (μ : Measure ℝ) [IsFiniteMeasure μ] (hc : compactSupport μ) (h : ArithmeticAdmissible μ) : ArithmeticAdmissible (μ.map (fun x => -x)) := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.4 / quantile-polynomial — smith Definition 2.11, pp.9–10, (2.6) -/
def quantile (K : Set ℝ) (μ : ProbabilityMeasure ℝ) (n : ℕ) (i : Fin n) : ℝ := by sorry
def quantilePolynomial (K : Set ℝ) (μ : ProbabilityMeasure ℝ) (n : ℕ) : ℝ[X] :=
  ∏ i : Fin n, (X-C (quantile K μ n i))
abbrev nearestQuantile (K : Set ℝ) (μ : ProbabilityMeasure ℝ) (n : ℕ) (x : ℝ) : ℝ :=
  sInf {r | ∃ i : Fin n, r = |x - quantile K μ n i|}


/-- A chosen quantile belongs to K, has the specified cumulative mass, and is the least such point. -/
lemma quantile_spec (K : Set ℝ) (hK : IsCompact K) (μ : ProbabilityMeasure ℝ) (hs : supported (μ : Measure ℝ) K) (hh : IsHolder (μ : Measure ℝ)) (n : ℕ) (i : Fin n) : quantile K μ n i ∈ K ∧ (μ : Measure ℝ) (Iic (quantile K μ n i)) = ENNReal.ofReal ((i.val+1 : ℕ)/(n : ℝ)) ∧ ∀ x ∈ K, (μ : Measure ℝ) (Iic x) = ENNReal.ofReal ((i.val+1 : ℕ)/(n : ℝ)) → quantile K μ n i ≤ x := by
  sorry


/-- The quantile product is monic of degree n, including n=0. -/
lemma quantilePolynomial_degree (K : Set ℝ) (μ : ProbabilityMeasure ℝ) (n : ℕ) : (quantilePolynomial K μ n).Monic ∧ (quantilePolynomial K μ n).natDegree = n := by
  sorry


/-- Closed interval frequencies differ from μ by at most 1/n. -/
lemma quantile_discrepancy (K : Set ℝ) (hK : IsCompact K) (μ : ProbabilityMeasure ℝ) (hs : supported (μ : Measure ℝ) K) (hh : IsHolder (μ : Measure ℝ)) (n : ℕ) (hn : 0 < n) (a b : ℝ) : |((polynomialRootLaw (quantilePolynomial K μ n) : Measure ℝ) (Icc a b)).toReal - ((μ : Measure ℝ) (Icc a b)).toReal| ≤ (n : ℝ)⁻¹ := by
  sorry


/-- Unit test `quantile_degree_zero`: The empty product is 1 and carries no quantile evaluation. -/
example (K : Set ℝ) (μ : ProbabilityMeasure ℝ) : quantilePolynomial K μ 0 = 1 := by
  sorry


/-- Unit test `quantile_uniform_one`: The degree-one uniform-[0,1] quantile polynomial is X−1, fixing right-endpoint indexing. -/
example (μ : ProbabilityMeasure ℝ) (hμ : (μ : Measure ℝ) = volume.restrict (Icc (0 : ℝ) 1)) : quantilePolynomial (Icc 0 1) μ 1 = X-C 1 := by
  sorry


/-- Unit test `quantile_uniform_two`: The degree-two uniform-[0,1] quantile polynomial has roots 1/2 and 1. -/
example (μ : ProbabilityMeasure ℝ) (hμ : (μ : Measure ℝ) = volume.restrict (Icc (0 : ℝ) 1)) : quantilePolynomial (Icc 0 1) μ 2 = (X-C (1/2))*(X-C 1) := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.4 / quantile-estimates — smith Proposition 2.12, pp.10–12, (2.7)–(2.8) -/
theorem quantile_estimates (K : Set ℝ) (hK : IsCompact K)
    (μ : ProbabilityMeasure ℝ) (hs : supported (μ : Measure ℝ) K) (hh : IsHolder (μ : Measure ℝ)) :
    ∃ C : ℝ, 0 < C ∧ ∀ n : ℕ, 2 ≤ n →
      (∏ i : Fin n, ∏ j ∈ Finset.univ.filter (fun j : Fin n => i < j),
        |quantile K μ n i - quantile K μ n j|) ≥
          Real.rpow n (-C*n) * Real.exp (-(n : ℝ)^2 * (logEnergy (realLift (μ : Measure ℝ))).toReal/2) ∧
      ∀ x ∈ K, Real.rpow n (-C) * nearestQuantile K μ n x ≤
          (potentialWeight (μ : Measure ℝ) x)^n * |(quantilePolynomial K μ n).eval x| ∧
        (potentialWeight (μ : Measure ℝ) x)^n * |(quantilePolynomial K μ n).eval x| ≤
          Real.rpow n C * nearestQuantile K μ n x := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.5 / norm-product-lower — smith Proposition 3.5, pp.15–16 -/
theorem norm_product_lower (K : Set ℝ) (hK : IsCompact K)
    (μ : ProbabilityMeasure ℝ) (hs : supported (μ : Measure ℝ) K) (hh : IsHolder (μ : Measure ℝ))
    (m n : ℕ) (Q : Fin (m+1) → ℤ[X])
    (hdeg : ∀ i, (Q i).natDegree ≤ m) (hli : LinearIndependent ℝ (fun i => realPoly (Q i)))
    (R : ℤ[X]) (hR : R ≠ 0) (hm : 0 ≤ logMoment (μ : Measure ℝ) R) :
    Real.exp (((m : ℝ)*n-(m : ℝ)^2/2+n-(m : ℝ)/2)*
      (logEnergy (realLift (μ : Measure ℝ))).toReal)/(Nat.factorial (m+1) : ℝ) ≤
    ∏ i, nNorm K (μ : Measure ℝ) n (realPoly (Q i * R)) := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.5 / norm-product-upper — smith Proposition 3.6, pp.16–17, (3.4) -/
theorem norm_product_upper (K : Set ℝ) (hK : FiniteIntervals K)
    (μ : ProbabilityMeasure ℝ) (hs : supported (μ : Measure ℝ) K) (hh : IsHolder (μ : Measure ℝ)) :
    ∃ C : ℝ, 0 < C ∧ ∀ n : ℕ, 2 ≤ n → ∃ Q : Fin (n+1) → ℤ[X],
      (∀ i, (Q i).natDegree ≤ n) ∧ LinearIndependent ℝ (fun i => realPoly (Q i)) ∧
      (∏ i, nNorm K (μ : Measure ℝ) n (realPoly (Q i))) ≤
        Real.rpow n (C*n) * Real.exp ((n : ℝ)^2 * (logEnergy (realLift (μ : Measure ℝ))).toReal/2) := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.5 / holder-energy-nonpositive — smith Corollary 3.7, p.17 -/
theorem holder_energy_nonpositive (μ : ProbabilityMeasure ℝ)
    (hc : compactSupport (μ : Measure ℝ)) (hh : IsHolder (μ : Measure ℝ))
    (ha : ArithmeticAdmissible (μ : Measure ℝ)) : logEnergy (realLift (μ : Measure ℝ)) ≤ 0 := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.5 / integer-approximation — smith Corollary 3.3, pp.13–14 -/
theorem integer_approximation (K : Set ℝ) (hK : FiniteIntervals K)
    (μ : ProbabilityMeasure ℝ) (hs : supported (μ : Measure ℝ) K) (hh : IsHolder (μ : Measure ℝ)) :
    ∃ C : ℝ, 0 < C ∧ ∀ n : ℕ, 2 ≤ n → ∀ Q : ℤ[X], Squarefree Q → Q.natDegree = n →
      ∀ P : ℝ[X], P.natDegree ≤ n-1 → ∃ R : ℤ[X], R.natDegree ≤ n-1 ∧
        nNorm K (μ : Measure ℝ) n (P-realPoly R) ≤ Real.rpow n C * nNorm K (μ : Measure ℝ) n (realPoly Q) := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.5 / gcd-norm-bound — smith Lemma 3.8, pp.17–19, (3.8) -/


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.5 / small-squarefree — smith Theorem 3.1, p.12; proof pp.19–21 -/
theorem small_squarefree (K : Set ℝ) (hK : IsCompact K)
    (μ : ProbabilityMeasure ℝ) (hs : supported (μ : Measure ℝ) K)
    (hh : IsHolder (μ : Measure ℝ)) (ha : ArithmeticAdmissible (μ : Measure ℝ)) :
    ∃ C : ℝ, 0 < C ∧ ∀ n : ℕ, 2 ≤ n → ∃ R : ℤ[X],
      Squarefree R ∧ R.natDegree = n ∧ nNorm K (μ : Measure ℝ) n (realPoly R) ≤
        Real.rpow n (C*Real.sqrt n) := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.6 / chebyshev — smith Lemma 4.2, p.23; csz Theorem 1.1, pp.218–219; Theorem 1.4, p.222 and §4 proof, pp.236–237 -/
def monicChebyshev (K : Set ℝ) (r : ℕ) : ℝ[X] := by sorry
abbrev uniformNorm (K : Set ℝ) (p : ℝ[X]) := weightedNorm K (fun _ => 1) 0 p


/-- A positive-degree minimizer is monic and minimizes among all monic polynomials of that degree. -/
lemma monicChebyshev_minimizes (K : Set ℝ) (hK : IsCompact K) (hc : 0 < realCapacity K) (r : ℕ) (hr : 0 < r) : (monicChebyshev K r).Monic ∧ (monicChebyshev K r).natDegree = r ∧ ∀ P : ℝ[X], P.Monic → P.natDegree = r → uniformNorm K (monicChebyshev K r) ≤ uniformNorm K P := by
  sorry


/-- All roots are simple real roots in the convex hull, rather than necessarily in K. -/
lemma monicChebyshev_roots (K : Set ℝ) (hK : IsCompact K) (hc : 0 < realCapacity K) (r : ℕ) (hr : 0 < r) : (monicChebyshev K r).Splits ∧ Squarefree (monicChebyshev K r) ∧ ∀ x ∈ (monicChebyshev K r).roots, x ∈ convexHull ℝ K := by
  sorry


/-- Finite interval sets have a uniform multiplicative capacity bound. -/
lemma monicChebyshev_finite_gap_bound (K : Set ℝ) (hK : FiniteIntervals K) : ∃ C : ℝ, 0 < C ∧ ∀ r : ℕ, 1 ≤ r → Real.rpow (realCapacity K) r ≤ uniformNorm K (monicChebyshev K r) ∧ uniformNorm K (monicChebyshev K r) ≤ C * Real.rpow (realCapacity K) r := by
  sorry


/-- Unit test `chebyshev_degree_one`: On [−1,1] the degree-one minimizer is X. -/
example  : monicChebyshev (Icc (-1 : ℝ) 1) 1 = X := by
  sorry


/-- Unit test `chebyshev_degree_two`: On [−1,1] the monic degree-two minimizer is X²−1/2. -/
example  : monicChebyshev (Icc (-1 : ℝ) 1) 2 = X^2-C (1/2) := by
  sorry


/-- Unit test `chebyshev_gap_root`: On [−3,−1]∪[1,3] the degree-one minimizer is X and its root lies in the gap. -/
example  : monicChebyshev (Icc (-3 : ℝ) (-1) ∪ Icc (1 : ℝ) 3) 1 = X ∧ (0 : ℝ) ∉ Icc (-3 : ℝ) (-1) ∪ Icc (1 : ℝ) 3 := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.6 / pruned — smith Definition 4.3, p.22 -/
def IsPruned (K : Set ℝ) (P T : ℝ[X]) : Prop :=
  ∃ S : Finset ℝ, T = ∏ x ∈ S, (X-C x) ∧ ∀ x ∈ S,
    x ∈ P.roots ∧ x ∈ K ∧ ∃ a b : ℝ, a ∈ P.roots ∧ b ∈ P.roots ∧ a < x ∧ x < b ∧ Icc a b ⊆ K


/-- Every retained-root product is monic. -/
lemma pruned_monic (K : Set ℝ) (P T : ℝ[X]) (h : IsPruned K P T) : T.Monic := by
  sorry


/-- Every retained-root product is squarefree, splits, and has all roots in K. -/
lemma pruned_simple_roots (K : Set ℝ) (P T : ℝ[X]) (h : IsPruned K P T) : Squarefree T ∧ T.Splits ∧ ∀ x ∈ T.roots, x ∈ K := by
  sorry


/-- For a simple splitting parent, the pruned product divides it. -/
lemma pruned_divides (K : Set ℝ) (P T : ℝ[X]) (hp : P.Splits) (hq : Squarefree P) (h : IsPruned K P T) : T ∣ P := by
  sorry


/-- Unit test `pruned_empty`: The empty retained set always gives the polynomial 1. -/
example (K : Set ℝ) (P : ℝ[X]) : IsPruned K P 1 := by
  sorry


/-- Unit test `pruned_middle_root`: Only the middle root is retained from (X+1)X(X−1) on [−1,1]. -/
example  : IsPruned (Icc (-1 : ℝ) 1) ((X+1)*X*(X-1)) X := by
  sorry


/-- Unit test `pruned_endpoint_forbidden`: The endpoint root cannot be retained from X(X−1) on [0,1]. -/
example  : ¬ IsPruned (Icc (0 : ℝ) 1) (X*(X-1)) X := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.6 / pruned-chebyshev — smith Lemma 4.4, pp.23–24 -/


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.6 / coefficient-adjustment — smith Lemma 4.5, pp.24–25 -/


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.6 / complementary — smith Definition 4.6, pp.25–26 -/


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.6 / complementary-roots — smith Lemma 4.7, pp.26–28 -/


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.6 / complementary-bounds — smith Lemma 4.8, pp.28–29 -/


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.7 / interior-quantile — smith Lemma 4.9, pp.29–30 -/
theorem interior_quantiles (K : Set ℝ) (hK : FiniteIntervals K)
    (μ : ProbabilityMeasure ℝ) (hs : supported (μ : Measure ℝ) K) (hh : IsHolder (μ : Measure ℝ)) (d : ℤ) :
    ∃ C : ℝ, 0 < C ∧ ∀ n : ℕ, 2 ≤ n → ∃ P : ℝ[X],
      P.Monic ∧ P.natDegree = n ∧ P.Splits ∧ Squarefree P ∧
      (∀ α ∈ P.roots, Icc (α-Real.rpow n (-C)) (α+Real.rpow n (-C)) ⊆ K ∧
        ∀ β ∈ P.roots, β ∈ Icc (α-Real.rpow n (-C)) (α+Real.rpow n (-C)) → β = α) ∧
      (∀ x ∈ K, Real.rpow n (-C) * sInf {v | ∃ α ∈ P.roots, v = |x-α|} ≤
        Real.rpow (potentialWeight (μ : Measure ℝ) x) ((n : ℝ)+d) * |P.eval x|) ∧
      nNorm K (μ : Measure ℝ) ((n : ℝ)+d) P ≤ Real.rpow n C := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.7 / real-construction — smith Proposition 4.1, pp.21–22; proof pp.30–31 -/


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.8 / inverse-interval — smith Notation 5.1 and Lemma 5.2, pp.31–33; Example 5.16 mean, p.43 -/
def inverseIntervalMeasure (a b : ℝ) : Measure ℝ :=
  if 0 < a ∧ a < b then volume.withDensity (fun t =>
    ENNReal.ofReal (if a < t ∧ t < b then Real.sqrt (a*b)/(Real.pi*t*Real.sqrt ((b-t)*(t-a))) else 0)) else 0


/-- The density has total mass one for 0<a<b. -/
lemma inverseInterval_probability (a b : ℝ) (ha : 0 < a) (hab : a < b) : IsProbabilityMeasure (inverseIntervalMeasure a b) := by
  sorry


/-- The kernel is 1/2-Hölder despite endpoint density singularities. -/
lemma inverseInterval_holder (a b : ℝ) (ha : 0 < a) (hab : a < b) : HolderMeasure (inverseIntervalMeasure a b) (1/2) := by
  sorry


/-- Its mean is sqrt(ab). -/
lemma inverseInterval_mean (a b : ℝ) (ha : 0 < a) (hab : a < b) : ∫ t, t ∂inverseIntervalMeasure a b = Real.sqrt (a*b) := by
  sorry


/-- Unit test `inverse_interval_invalid`: At a=0 the totalized construction is zero, not a probability. -/
example (b : ℝ) : inverseIntervalMeasure 0 b = 0 := by
  sorry


/-- Unit test `inverse_interval_mean_one_four`: ν[1,4] has mean 2. -/
example  : ∫ t, t ∂inverseIntervalMeasure 1 4 = 2 := by
  sorry


/-- Unit test `inverse_interval_atom_free`: The measure on [1,4] gives no mass to either endpoint. -/
example  : inverseIntervalMeasure 1 4 {1} = 0 ∧ inverseIntervalMeasure 1 4 {4} = 0 := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.8 / inverse-interval-potential — smith Lemma 5.2, pp.32–33 -/
theorem inverseInterval_potential (a b : ℝ) (ha : 0 < a) (hab : a < b) :
    (∀ z : ℂ, logPotential (realLift (inverseIntervalMeasure a b)) z +
      (if z = 0 then ⊥ else ((Real.log ‖z‖ : ℝ) : EReal)) ≤
        ((Real.log ((a+2*Real.sqrt (a*b)+b)/(b-a)) : ℝ) : EReal)) ∧
    (∀ x ∈ Icc a b, logPotential (realLift (inverseIntervalMeasure a b)) (x : ℂ) +
      ((Real.log |x| : ℝ) : EReal) = ((Real.log ((a+2*Real.sqrt (a*b)+b)/(b-a)) : ℝ) : EReal)) ∧
    logPotential (realLift (inverseIntervalMeasure a b)) 0 =
      ((Real.log ((a+2*Real.sqrt (a*b)+b)/(4*a*b)) : ℝ) : EReal) := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.8 / smoothing — smith Notation 5.3 and Lemma 5.4, pp.33–34 -/
theorem smoothing_potential (μ : Measure ℝ) [IsFiniteMeasure μ] (hc : compactSupport μ)
    (ε : ℝ) (hε : 0 < ε) (hε1 : ε < 1/2) :
    HolderMeasure (μ ∗ inverseIntervalMeasure (ε^2) ε) (1/2) ∧
    ∀ z : ℂ, logPotential (realLift (μ ∗ inverseIntervalMeasure (ε^2) ε)) z ≤
      logPotential (realLift μ) z + (((μ univ).toReal *
        Real.log ((ε^2+2*Real.rpow ε (3/2)+ε)/(ε-ε^2)) : ℝ) : EReal) := by sorry

theorem smoothing_tendsto (μ : Measure ℝ) [IsFiniteMeasure μ] (hc : compactSupport μ)
    (f : BoundedContinuousFunction ℝ ℝ) :
    Tendsto (fun ε : ℝ => ∫ x, f x ∂(μ ∗ inverseIntervalMeasure (ε^2) ε))
      (𝓝[>] 0) (𝓝 (∫ x, f x ∂μ)) := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.8 / sweetening — smith Notation 5.5 and Proposition 5.6, pp.34–35 -/
def sweetened (K : Set ℝ) (ν : Measure ℝ) (B : ℝ) : Measure ℝ :=
  let γ := 1-(ν univ).toReal
  let β := B/(B+Real.log (realCapacity K))
  ENNReal.ofReal (β+γ-β*γ) • ((equilibrium (Complex.ofReal '' K) : Measure ℂ).map Complex.re) +
    ENNReal.ofReal (1-β) • ν


/-- The sweetened measure has total mass one when ν is a subprobability and B≥0. -/
lemma sweetened_probability (K : Set ℝ) (hK : IsCompact K) (hc : 1 < realCapacity K) (ν : Measure ℝ) [IsFiniteMeasure ν] (hm : ν univ ≤ 1) (B : ℝ) (hB : 0 ≤ B) : IsProbabilityMeasure (sweetened K ν B) := by
  sorry


/-- Sweetening preserves K-support if ν is supported there. -/
lemma sweetened_supported (K : Set ℝ) (hK : IsCompact K) (hc : 1 < realCapacity K) (ν : Measure ℝ) (hs : supported ν K) (B : ℝ) : supported (sweetened K ν B) K := by
  sorry


/-- A pointwise bound by B gives the sweetening potential inequality. -/
lemma sweetened_potential (K : Set ℝ) (hK : IsCompact K) (hc : 1 < realCapacity K) (μ : ProbabilityMeasure ℝ) (hs : supported (μ : Measure ℝ) K) (ν : Measure ℝ) [IsFiniteMeasure ν] (hn : compactSupport ν) (hm : ν univ ≤ 1) (B : ℝ) (hB : 0 ≤ B) (hb : ∀ z : ℂ, logPotential (realLift (μ : Measure ℝ)) z ≠ ⊤ → logPotential (realLift ν) z + ((1-(ν univ).toReal : ℝ) : EReal) * logPotential (equilibrium (Set.image Complex.ofReal K) : Measure ℂ) z - logPotential (realLift (μ : Measure ℝ)) z ≤ (B : EReal)) : ∀ z : ℂ, logPotential (realLift (sweetened K ν B)) z ≤ ((1-B/(B+Real.log (realCapacity K)) : ℝ) : EReal) * logPotential (realLift (μ : Measure ℝ)) z := by
  sorry


/-- Unit test `sweetening_no_loss`: When ν has mass one and B=0, sweetening leaves ν unchanged. -/
example (K : Set ℝ) (ν : ProbabilityMeasure ℝ) : sweetened K (ν : Measure ℝ) 0 = (ν : Measure ℝ) := by
  sorry


/-- Unit test `sweetening_zero_mass`: For ν=0, γ=1, and κ>1, all mass is equilibrium mass. -/
example (K : Set ℝ) (hc : 1 < realCapacity K) (B : ℝ) (hB : 0 ≤ B) : sweetened K 0 B = (equilibrium (Set.image Complex.ofReal K) : Measure ℂ).map Complex.re := by
  sorry


/-- Unit test `sweetening_threshold`: At capacity 1 and B=0 the denominator vanishes, explaining the strict threshold. -/
example  : realCapacity (Icc (-2 : ℝ) 2) = 1 ∧ (0 : ℝ)+Real.log (realCapacity (Icc (-2 : ℝ) 2)) = 0 := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.8 / energy-nonpositive — smith Corollary 5.7, pp.35–36 -/
theorem admissible_energy_nonpositive (μ : ProbabilityMeasure ℝ)
    (hc : compactSupport (μ : Measure ℝ)) (ha : ArithmeticAdmissible (μ : Measure ℝ)) :
    logEnergy (realLift (μ : Measure ℝ)) ≤ 0 := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.8 / holder-reduction — smith Proposition 2.5, p.7; proof pp.36–37 -/

theorem holder_reduction (K : Set ℝ) (hK : IsCompact K) (hcpt : CountableComponents K)
    (hcap : 1 < realCapacity K) (μ : ProbabilityMeasure ℝ)
    (hs : supported (μ : Measure ℝ) K) (ha : ArithmeticAdmissible (μ : Measure ℝ)) :
    ∃ K' : ℕ → Set ℝ, ∃ μ' : ℕ → ProbabilityMeasure ℝ,
      (∀ j, FiniteIntervals (K' j) ∧ K' j ⊆ K ∧ 1 < realCapacity (K' j) ∧
        supported (μ' j : Measure ℝ) (K' j) ∧ IsHolder (μ' j : Measure ℝ) ∧ ArithmeticAdmissible (μ' j : Measure ℝ)) ∧
      Tendsto μ' atTop (𝓝 μ) := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.9 / realization — smith Theorem 1.5, p.4; §4.1 proof, p.22 -/
theorem integer_conjugate_realization (K : Set ℝ) (hK : IsCompact K)
    (hcpt : CountableComponents K) (hcap : 1 < realCapacity K)
    (μ : ProbabilityMeasure ℝ) (hs : supported (μ : Measure ℝ) K) :
    ArithmeticAdmissible (μ : Measure ℝ) ↔ ∃ P : ℕ → ℤ[X],
      Function.Injective P ∧ (∀ n, (P n).Monic ∧ Irreducible (P n) ∧ 0 < (P n).natDegree ∧ rootsIn (P n) K) ∧
      Tendsto (fun n => polynomialRootLaw (realPoly (P n))) atTop (𝓝 μ) := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.10 / optimization — smith Notation 5.8, p.37; Theorem 5.11, p.39 -/
def algebraicPolynomials (SigmaSet : Set ℝ) : Set ℤ[X] := {P | P.Monic ∧ Irreducible P ∧ 0 < P.natDegree ∧ rootsIn P SigmaSet}
def conjugateMean (P : ℤ[X]) (F : ℝ → ℝ) : ℝ := ∫ x, F x ∂(polynomialRootLaw (realPoly P) : Measure ℝ)
def cofiniteMean (SigmaSet : Set ℝ) (F : ℝ → ℝ) : EReal :=
  sSup {c | ∃ r : ℝ, c = (r : EReal) ∧ {P | P ∈ algebraicPolynomials SigmaSet ∧ conjugateMean P F < r}.Finite}
def HasAuxiliaryCertificate (SigmaSet : Set ℝ) (F : ℝ → ℝ) (c : ℝ) : Prop :=
  ∃ N : ℕ, ∃ Q : Fin N → ℤ[X], ∃ a : Fin N → ℝ,
    (∀ i, Q i ≠ 0 ∧ 0 < a i) ∧ ∀ x ∈ SigmaSet,
      (c : EReal) + ∑ i, (a i : EReal) * logAbs ((realPoly (Q i)).eval x) ≤ (F x : EReal)
def auxiliarySup (SigmaSet : Set ℝ) (F : ℝ → ℝ) : EReal :=
  sSup {c | ∃ r : ℝ, c = (r : EReal) ∧ HasAuxiliaryCertificate SigmaSet F r}


/-- If ISigmaSet is infinite, a constant F=c has cofinite mean c. -/
lemma cofiniteMean_const (SigmaSet : Set ℝ) (hi : (algebraicPolynomials SigmaSet).Infinite) (c : ℝ) : cofiniteMean SigmaSet (fun _ => c) = (c : EReal) := by
  sorry


/-- A certificate bounds all but finitely many irreducible conjugate averages. -/
lemma auxiliary_certificate_cofinite_bound (SigmaSet : Set ℝ) (F : ℝ → ℝ) (c : ℝ) (h : HasAuxiliaryCertificate SigmaSet F c) : {P | P ∈ algebraicPolynomials SigmaSet ∧ conjugateMean P F < c}.Finite := by
  sorry


/-- A pointwise constant lower bound supplies the empty certificate. -/
lemma empty_auxiliary_certificate (SigmaSet : Set ℝ) (F : ℝ → ℝ) (c : ℝ) (h : ∀ x ∈ SigmaSet, c ≤ F x) : HasAuxiliaryCertificate SigmaSet F c := by
  sorry


/-- Unit test `empty_polynomial_population`: For SigmaSet=∅ the cofinite mean is +∞, so infinitude cannot be omitted from constant-mean formulas. -/
example (F : ℝ → ℝ) : cofiniteMean ∅ F = ⊤ := by
  sorry


/-- Unit test `constant_empty_certificate`: F=3 admits the empty certificate with value 3 on every SigmaSet. -/
example (SigmaSet : Set ℝ) : HasAuxiliaryCertificate SigmaSet (fun _ => 3) 3 := by
  sorry


/-- Unit test `positive_auxiliary_no_constant_gain`: Nonzero integer auxiliaries cannot raise F=0 on all of ℝ to 1. -/
example : ¬ HasAuxiliaryCertificate Set.univ (fun _ => 0) 1 := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.10 / compact-reduction — smith Lemma 5.10, pp.37–39 -/
theorem compact_optimization_reduction (SigmaSet : Set ℝ) (hSigmaSet : IsClosed SigmaSet)
    (hcpt : CountableComponents SigmaSet) (hcap : ∃ L : Set ℝ, IsCompact L ∧ L ⊆ SigmaSet ∧ 1 < realCapacity L)
    (F : ℝ → ℝ) (hF : ContinuousOn F SigmaSet)
    (hg : ∀ A : ℝ, ∃ R : ℝ, 1 < R ∧ ∀ x ∈ SigmaSet, R < |x| → A < F x/Real.log |x|) :
    ∃ K : Set ℝ, IsCompact K ∧ K ⊆ SigmaSet ∧ 1 < realCapacity K ∧
      ∀ μ : ProbabilityMeasure ℝ, compactSupport (μ : Measure ℝ) → supported (μ : Measure ℝ) SigmaSet →
        ¬ supported (μ : Measure ℝ) K → ∃ ν : ProbabilityMeasure ℝ,
          supported (ν : Measure ℝ) K ∧ (∫ x, F x ∂(ν : Measure ℝ)) < ∫ x, F x ∂(μ : Measure ℝ) ∧
          ∀ Q : ℤ[X], Q ≠ 0 → 0 ≤ logMoment (μ : Measure ℝ) Q → 0 ≤ logMoment (ν : Measure ℝ) Q := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.10 / auxiliary-completeness — smith Theorem 5.11, pp.39–40 -/
theorem auxiliary_completeness (SigmaSet : Set ℝ) (hSigmaSet : IsClosed SigmaSet) (hcpt : CountableComponents SigmaSet)
    (hcap : ∃ L : Set ℝ, IsCompact L ∧ L ⊆ SigmaSet ∧ 1 < realCapacity L)
    (F : ℝ → ℝ) (hF : ContinuousOn F SigmaSet)
    (hg : ∀ A : ℝ, ∃ R : ℝ, 1 < R ∧ ∀ x ∈ SigmaSet, R < |x| → A < F x/Real.log |x|) :
    cofiniteMean SigmaSet F = auxiliarySup SigmaSet F ∧ ∃ μ : ProbabilityMeasure ℝ,
      compactSupport (μ : Measure ℝ) ∧ supported (μ : Measure ℝ) SigmaSet ∧ ArithmeticAdmissible (μ : Measure ℝ) ∧
      cofiniteMean SigmaSet F = ((∫ x, F x ∂(μ : Measure ℝ) : ℝ) : EReal) ∧
      ∀ ν : ProbabilityMeasure ℝ, compactSupport (ν : Measure ℝ) → supported (ν : Measure ℝ) SigmaSet →
        ArithmeticAdmissible (ν : Measure ℝ) → (∫ x, F x ∂(μ : Measure ℝ)) ≤ ∫ x, F x ∂(ν : Measure ℝ) := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.11 / majorant — smith Proposition 5.15, pp.41–42 -/
theorem potential_majorant_admissible (μ : ProbabilityMeasure ℝ) (hc : compactSupport (μ : Measure ℝ))
    (N : ℕ) (Q : Fin N → ℤ[X]) (a : Fin N → ℝ)
    (hQ : ∀ i, (Q i).IsPrimitive ∧ Irreducible (Q i) ∧ 0 < (Q i).natDegree)
    (hinj : Function.Injective Q) (ha : ∀ i, 0 < a i)
    (hd : ∑ i, a i*(Q i).natDegree ≤ 1)
    (hU : ∀ z : ℂ, logPotential (realLift (μ : Measure ℝ)) z ≤
      -∑ i, (a i : EReal)*(if (complexPoly (Q i)).eval z = 0 then ⊥ else
        ((Real.log ‖(complexPoly (Q i)).eval z‖ : ℝ) : EReal)))
    (hm : ∀ i, 0 ≤ logMoment (μ : Measure ℝ) (Q i)) : ArithmeticAdmissible (μ : Measure ℝ) := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.11 / serre-witness — smith Example 5.16, pp.42–43 -/
def serreMeasure : Measure ℝ :=
  let a : ℝ := 87353/1000000
  let b : ℝ := 4411076/1000000
  let γ : ℝ := 215485/1000000
  ENNReal.ofReal γ • inverseIntervalMeasure a b +
    ENNReal.ofReal (1-γ) • ((equilibrium (Complex.ofReal '' Icc a b) : Measure ℂ).map Complex.re)


/-- The exact mixture is a probability. -/
lemma serreMeasure_probability  : IsProbabilityMeasure serreMeasure := by
  sorry


/-- The majorant and positive X moment certify all integer moments. -/
lemma serreMeasure_admissible  : ArithmeticAdmissible serreMeasure := by
  sorry


/-- The exact mean has the displayed rational-parameter expression. -/
lemma serreMeasure_mean  : ∫ x, x ∂serreMeasure = (215485/1000000 : ℝ)*Real.sqrt ((87353/1000000)*(4411076/1000000)) + (1-215485/1000000)*((87353/1000000)+(4411076/1000000))/2 := by
  sorry


/-- Unit test `serre_mean_interval`: The mean is certified in the strict interval (1.898303,1.898304). -/
example  : (1898303/1000000 : ℝ) < (∫ x, x ∂serreMeasure) ∧ (∫ x, x ∂serreMeasure) < (1898304/1000000 : ℝ) := by
  sorry


/-- Unit test `serre_positive_x_moment`: The X logarithmic moment is strictly positive. -/
example  : 0 < logMoment serreMeasure X := by
  sorry


/-- Unit test `serre_threshold_capacity`: The witness interval has capacity greater than 1. -/
example  : 1 < realCapacity (Icc (87353/1000000 : ℝ) (4411076/1000000)) := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.11 / trace-bound — smith Theorem 1.1, p.1; Example 5.16, pp.42–43 -/
theorem trace_constant_bound : cofiniteMean (Ici (0 : ℝ)) id < ((189831/100000 : ℝ) : EReal) := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.11 / optimal-support — smith Proposition 5.17, pp.43–45 -/
theorem optimal_polynomial_support (SigmaSet : Set ℝ) (hSigmaSet : IsClosed SigmaSet) (hcpt : CountableComponents SigmaSet)
    (hcap : ∃ L : Set ℝ, IsCompact L ∧ L ⊆ SigmaSet ∧ 1 < realCapacity L)
    (F : ℝ → ℝ) (hF : ContinuousOn F SigmaSet)
    (hg : ∀ A : ℝ, ∃ R : ℝ, 1 < R ∧ ∀ x ∈ SigmaSet, R < |x| → A < F x/Real.log |x|)
    (μ : ProbabilityMeasure ℝ) (hc : compactSupport (μ : Measure ℝ)) (hs : supported (μ : Measure ℝ) SigmaSet)
    (ha : ArithmeticAdmissible (μ : Measure ℝ))
    (hopt : cofiniteMean SigmaSet F = ((∫ x, F x ∂(μ : Measure ℝ) : ℝ) : EReal))
    (P : ℤ[X]) (hP : P ∈ algebraicPolynomials (interior SigmaSet))
    (hl : ((conjugateMean P F : ℝ) : EReal) < cofiniteMean SigmaSet F) :
    logMoment (μ : Measure ℝ) P = 0 ∧ ∀ x ∈ (realPoly P).roots, x ∉ (μ : Measure ℝ).support := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.12 / real-weil-bridge — smith §5.12 discussion and Corollary 5.12, pp.40–41 -/


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.12 / point-count-optimization — smith Corollary 5.12, pp.40–41 -/


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.12 / point-count-asymptotics — smith Corollary 5.13, p.41 -/


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.12 / point-count-explicit — smith Corollary 1.3, p.2; deduction from Corollary 5.13, p.41 -/


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.0 / strict-energy — levenberg Proposition 2.1, p.8 -/
theorem strict_energy (μ ν : ProbabilityMeasure ℂ)
    (hcμ : compactSupport (μ : Measure ℂ)) (hcν : compactSupport (ν : Measure ℂ))
    (hμ : logEnergy (μ : Measure ℂ) < ⊤) (hν : logEnergy (ν : Measure ℂ) < ⊤) :
    let J := extIntegral ((μ : Measure ℂ).prod (ν : Measure ℂ)) (fun zw => logKernel zw.1 zw.2)
    J ≠ ⊤ ∧ J ≠ ⊥ ∧ 0 ≤ logEnergy (μ : Measure ℂ)+logEnergy (ν : Measure ℂ)-2*J ∧
      (logEnergy (μ : Measure ℂ)+logEnergy (ν : Measure ℂ)-2*J = 0 ↔ μ = ν) := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1 / transfinite-diameter — saff Definition 1.9, pp.172–173; levenberg Proposition 2.3, pp.9–10 -/
def feketeDiameter (K : Set ℂ) (n : ℕ) : ℝ :=
  sSup (insert 0 {r | ∃ z : Fin (n+2) → ℂ, (∀ i, z i ∈ K) ∧
    r = Real.rpow (∏ i : Fin (n+2), ∏ j ∈ Finset.univ.filter (fun j : Fin (n+2) => i < j),
      ‖z i-z j‖) (2/(((n+2 : ℕ) : ℝ)*((n+1 : ℕ) : ℝ)))})
def transfiniteDiameter (K : Set ℂ) : ℝ := ⨅ n : ℕ, feketeDiameter K n


/-- The finite diameters decrease with the number of points. -/
lemma feketeDiameter_antitone (K : Set ℂ) (hK : IsCompact K) : Antitone (feketeDiameter K) := by
  sorry


/-- On a nonempty compact K the Vandermonde maximum is attained, including coincident zero-product tuples. -/
lemma feketeDiameter_attained (K : Set ℂ) (hK : IsCompact K) (hne : K.Nonempty) (n : ℕ) : ∃ z : Fin (n+2) → ℂ, (∀ i, z i ∈ K) ∧ feketeDiameter K n = Real.rpow (∏ i : Fin (n+2), ∏ j ∈ Finset.univ.filter (fun j : Fin (n+2) => i < j), ‖z i-z j‖) (2/(((n+2 : ℕ) : ℝ)*((n+1 : ℕ) : ℝ))) := by
  sorry


/-- Nonzero affine scaling multiplies diameter by |a|. -/
lemma transfiniteDiameter_affine (K : Set ℂ) (hK : IsCompact K) (a b : ℂ) (ha : a ≠ 0) : transfiniteDiameter (Set.image (fun z => a*z+b) K) = ‖a‖*transfiniteDiameter K := by
  sorry


/-- Unit test `fekete_singleton`: Every finite diameter of a singleton is zero. -/
example (a : ℂ) (n : ℕ) : feketeDiameter {a} n = 0 := by
  sorry


/-- Unit test `fekete_two_point_distance`: The two-point diameter of {0,2} is 2. -/
example  : feketeDiameter ({0,2} : Set ℂ) 0 = 2 := by
  sorry


/-- Unit test `transfinite_finite_set`: The transfinite diameter of {0,2} is 0 despite its ordinary diameter 2. -/
example  : transfiniteDiameter ({0,2} : Set ℂ) = 0 := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1 / diameter-capacity — saff Theorem 1.18, pp.176–177; levenberg Proposition 2.3, pp.9–10 -/
theorem diameter_capacity (K : Set ℂ) (hK : IsCompact K) : capacity K = transfiniteDiameter K := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.3 / interval-equilibrium-adapter — saff Example 1.11, p.174; smith Example 5.16, p.43 -/
def intervalEquilibriumMeasure (a b : ℝ) : Measure ℝ :=
  if a < b then (ENNReal.ofReal (Real.pi⁻¹) • Polynomial.Chebyshev.measureT).map
    (fun t => (a+b)/2+(b-a)*t/2) else 0


/-- For a<b the normalized affine law is a probability. -/
lemma intervalEquilibrium_probability (a b : ℝ) (h : a < b) : IsProbabilityMeasure (intervalEquilibriumMeasure a b) := by
  sorry


/-- Its complex pushforward is the native equilibrium of the real interval. -/
lemma intervalEquilibrium_eq (a b : ℝ) (h : a < b) : realLift (intervalEquilibriumMeasure a b) = (equilibrium (Set.image Complex.ofReal (Icc a b)) : Measure ℂ) := by
  sorry


/-- The mean is the midpoint. -/
lemma intervalEquilibrium_mean (a b : ℝ) (h : a < b) : ∫ x, x ∂intervalEquilibriumMeasure a b = (a+b)/2 := by
  sorry


/-- Unit test `interval_equilibrium_invalid`: At equal endpoints the adapter is zero; no probability is claimed on a polar set. -/
example (a : ℝ) : intervalEquilibriumMeasure a a = 0 := by
  sorry


/-- Unit test `interval_equilibrium_symmetric_mean`: The mean on [−2,2] is 0. -/
example  : ∫ x, x ∂intervalEquilibriumMeasure (-2) 2 = 0 := by
  sorry


/-- Unit test `interval_equilibrium_normalization`: On [−1,1] its mass is 1 rather than the native Chebyshev mass π. -/
example  : intervalEquilibriumMeasure (-1) 1 univ = 1 := by
  sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.3 / finite-interval-equilibrium — smith Remark after Proposition 5.6, p.35; csz Theorem 2.6(d), p.230 and §2 proof, pp.228–232; saff Example 1.11, p.174 -/
theorem finite_interval_equilibrium_holder (K : Set ℝ) (hK : FiniteIntervals K) :
    HolderMeasure ((equilibrium (Set.image Complex.ofReal K) : Measure ℂ).map Complex.re) (1/2) := by sorry

theorem interval_equilibrium_potential_zero (a b : ℝ) (ha : 0 < a) (hab : a < b) :
    logPotential (realLift (intervalEquilibriumMeasure a b)) 0 =
      ((-Real.log ((a+b+2*Real.sqrt (a*b))/4) : ℝ) : EReal) := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.4 / log-moment-upper-semicontinuity — smith §1 following Theorem 1.5, p.4; Theorem 5.11 proof, p.40 -/
theorem logMoment_upperSemicontinuous (K : Set ℝ) (hK : IsCompact K)
    (μ : ℕ → ProbabilityMeasure ℝ) (ν : ProbabilityMeasure ℝ)
    (hs : ∀ n, supported (μ n : Measure ℝ) K) (hlim : Tendsto μ atTop (𝓝 ν))
    (Q : ℤ[X]) (hQ : Q ≠ 0) :
    limsup (fun n => logMoment (μ n : Measure ℝ) Q) atTop ≤ logMoment (ν : Measure ℝ) Q := by sorry


/-! Quantitative contracts for the real polynomial construction. -/
theorem pruned_chebyshev_bounds (K : Set ℝ) (hK : FiniteIntervals K)
    (k₀ : ℕ) (a b : Fin k₀ → ℝ) (ha : ∀ i, a i < b i)
    (hab : ∀ i j, i < j → b i < a j) (hrep : K = ⋃ i, Icc (a i) (b i)) :
    ∃ C : ℝ, 2 ≤ C ∧ ∀ r : ℕ, 2 ≤ r → ∃ S : ℝ[X], ∃ k₁ : ℕ,
      ∃ y : Fin (r+k₁) → ℝ,
      IsPruned K (monicChebyshev K (r+3*k₀)) S ∧ S.natDegree = r ∧ k₁ ≤ k₀ ∧
      uniformNorm K S ≤ Real.rpow r C * Real.rpow (realCapacity K) r ∧
      StrictMono y ∧ (∀ i, y i ∈ K ∧ C⁻¹*Real.rpow (realCapacity K) r ≤ |S.eval (y i)|) ∧
      (∀ α ∈ S.roots, ∃ i j, y i < α ∧ α < y j) ∧
      (∀ i j : Fin (r+k₁), j.val = i.val+1 →
        (¬ Ioo (y i) (y j) ⊆ K ∧ ∀ α ∈ S.roots, α ∉ Ioo (y i) (y j)) ∨
        (Ioo (y i) (y j) ⊆ K ∧ ∃! α : ℝ, α ∈ S.roots ∧ α ∈ Ioo (y i) (y j))) := by sorry

theorem even_coefficient_adjustment (K : Set ℝ) (hK : FiniteIntervals K) (hc : 1 < realCapacity K) :
    ∃ C₁ : ℝ, 2 ≤ C₁ ∧ ∃ D : ℕ, D = Nat.ceil (4*C₁^2/(realCapacity K-1)) ∧ 0 < D ∧
      ∀ P : ℝ[X], P.Monic → ∀ r : ℕ, 2 ≤ r →
      ∃ S T : ℝ[X], ∃ k₁ : ℕ, ∃ y : Fin (r+k₁) → ℝ,
      S.Monic ∧ S.natDegree = r ∧ T.Monic ∧ T.natDegree = r ∧ StrictMono y ∧
      (∀ i, y i ∈ K ∧ C₁⁻¹*Real.rpow (realCapacity K) r ≤ |S.eval (y i)| ∧
        1/2 ≤ T.eval (y i)/S.eval (y i)) ∧
      (∀ α ∈ T.roots, α ∈ K) ∧ T.Splits ∧ Squarefree T ∧
      (∀ k : ℕ, (D-1)*r+P.natDegree ≤ k → k < D*r+P.natDegree → evenCoeff (T^D*P) k) ∧
      uniformNorm K T ≤ Real.rpow r C₁ * Real.rpow (realCapacity K) r +
        2*C₁*r*Real.rpow (realCapacity K) r := by sorry

def complementDegreeFactor (K : Set ℝ) : ℕ := by sorry

def complementaryPolynomial (K : Set ℝ) (P : ℝ[X]) (r : ℕ) : ℝ[X] := by sorry

lemma complementary_monic_degree (K : Set ℝ) (hK : FiniteIntervals K) (hc : 1 < realCapacity K)
    (P : ℝ[X]) (hP : P.Monic) (r : ℕ) (hr : 2 ≤ r) :
    0 < complementDegreeFactor K ∧ (complementaryPolynomial K P r).Monic ∧
      (complementaryPolynomial K P r).natDegree = complementDegreeFactor K*r := by sorry

lemma complementary_even_coefficients (K : Set ℝ) (hK : FiniteIntervals K) (hc : 1 < realCapacity K)
    (P : ℝ[X]) (hP : P.Monic) (r : ℕ) (hr : 2 ≤ r) :
    ∀ k : ℕ, P.natDegree+1 ≤ k → k < P.natDegree+complementDegreeFactor K*r →
      evenCoeff (complementaryPolynomial K P r*P) k := by sorry

lemma complementary_avoids_parent (K : Set ℝ) (hK : FiniteIntervals K) (hc : 1 < realCapacity K) :
    ∃ C₂ : ℝ, 0 < C₂ ∧ ∀ P : ℝ[X], P.Monic → 0 < P.natDegree → ∀ r : ℕ, 2 ≤ r →
      ∀ z : ℂ, (P.map (algebraMap ℝ ℂ)).IsRoot z →
      Real.rpow (realCapacity K) (complementDegreeFactor K*r)/((P.natDegree : ℝ)*C₂) ≤
        ‖((complementaryPolynomial K P r).map (algebraMap ℝ ℂ)).eval z‖ := by sorry

/-- Unit test `complementary_zero_degree_parameter`: the outside-domain r=0 branch is 1. -/
example (K : Set ℝ) (P : ℝ[X]) : complementaryPolynomial K P 0 = 1 := by sorry

/-- Unit test `complementary_parent_X`: for P=X the complementary constant term is nonzero. -/
example (K : Set ℝ) (hK : FiniteIntervals K) (hc : 1 < realCapacity K) (r : ℕ) (hr : 2 ≤ r) :
    (complementaryPolynomial K X r).eval 0 ≠ 0 := by sorry

/-- Unit test `complementary_parent_one`: a degree-zero parent has no avoidance division by zero. -/
example (K : Set ℝ) (hK : FiniteIntervals K) (hc : 1 < realCapacity K) (r : ℕ) (hr : 2 ≤ r) :
    (complementaryPolynomial K 1 r).natDegree = complementDegreeFactor K*r ∧
      ∀ k : ℕ, 1 ≤ k → k < complementDegreeFactor K*r → evenCoeff (complementaryPolynomial K 1 r) k := by sorry

theorem complementary_roots (K : Set ℝ) (hK : FiniteIntervals K) (hc : 1 < realCapacity K) :
    ∃ C : ℝ, 1 < C ∧ ∀ P : ℝ[X], P.Monic → ∀ r : ℕ, C ≤ r →
      let Q := complementaryPolynomial K P r
      Q.Splits ∧ Squarefree Q ∧ (∀ α ∈ Q.roots, α ∈ K) ∧
      ∀ β ∈ Q.roots, ∃ x y : ℝ, x < β ∧ β < y ∧ Icc x y ⊆ K ∧
        (∀ α ∈ Q.roots, α ∈ Icc x y → α = β) ∧
        C⁻¹*Real.rpow (realCapacity K) (complementDegreeFactor K*r) ≤ |Q.eval x| ∧
        C⁻¹*Real.rpow (realCapacity K) (complementDegreeFactor K*r) ≤ |Q.eval y| := by sorry

theorem complementary_bounds (K : Set ℝ) (hK : FiniteIntervals K) (hc : 1 < realCapacity K) :
    ∃ C : ℝ, 1 < C ∧ ∀ P : ℝ[X], P.Monic → ∀ r : ℕ, C ≤ r →
      let Q := complementaryPolynomial K P r
      uniformNorm K Q ≤ Real.rpow r C * Real.rpow (realCapacity K) (complementDegreeFactor K*r) ∧
      uniformNorm K Q.derivative ≤ Real.rpow r C * Real.rpow (realCapacity K) (complementDegreeFactor K*r) ∧
      ∀ β ∈ Q.roots, Icc (β-Real.rpow r (-C)) (β+Real.rpow r (-C)) ⊆ K ∧
        ∀ x ∈ Icc (β-Real.rpow r (-C)) (β+Real.rpow r (-C)),
          C⁻¹*Real.rpow (realCapacity K) (complementDegreeFactor K*r)*|x-β| ≤ |Q.eval x| := by sorry

theorem real_polynomial_rounding_margins (K : Set ℝ) (hK : FiniteIntervals K) (hc : 1 < realCapacity K)
    (μ : ProbabilityMeasure ℝ) (hs : supported (μ : Measure ℝ) K) (hh : IsHolder (μ : Measure ℝ))
    (B : ℝ) (hB : 0 < B) :
    ∃ C : ℝ, 3 < C ∧ ∀ n : ℕ, C < n →
      let m := Nat.floor (B*Real.sqrt n*Real.log n)
      m < n ∧ ∃ P : ℝ[X], ∃ α x y : Fin n → ℝ,
        P.Monic ∧ P.natDegree = n ∧ P.Splits ∧ Squarefree P ∧
        P.roots = (Finset.univ.val.map α) ∧ StrictMono α ∧
        nNorm K (μ : Measure ℝ) (n-m : ℕ) P ≤ Real.rpow n C*Real.rpow (realCapacity K) m ∧
        (∀ k : ℕ, n-m ≤ k → k < n → evenCoeff P k) ∧
        (∀ i, x i < α i ∧ α i < y i ∧ Icc (x i) (y i) ⊆ K ∧
          Real.rpow n (-C)*Real.rpow (realCapacity K) m ≤
            Real.rpow (potentialWeight (μ : Measure ℝ) (x i)) (n-m : ℕ)*|P.eval (x i)| ∧
          Real.rpow n (-C)*Real.rpow (realCapacity K) m ≤
            Real.rpow (potentialWeight (μ : Measure ℝ) (y i)) (n-m : ℕ)*|P.eval (y i)|) ∧
        (∀ i j, i < j → y i < x j) := by sorry

theorem gcd_norm_bound (K : Set ℝ) (hK : FiniteIntervals K)
    (μ : ProbabilityMeasure ℝ) (hs : supported (μ : Measure ℝ) K) (hh : IsHolder (μ : Measure ℝ)) :
    ∃ C : ℝ, 0 < C ∧ ∀ n m k : ℕ, 2 ≤ n → k ≤ m → m ≤ n →
      ∀ Q H : Fin (m+1) → ℤ[X], ∀ G : ℤ[X],
      LinearIndependent ℝ (fun i => realPoly (Q i)) → (∀ i, (Q i).natDegree ≤ n) →
      (∀ i j, i ≤ j → nNorm K (μ : Measure ℝ) n (realPoly (Q i)) ≤ nNorm K (μ : Measure ℝ) n (realPoly (Q j))) →
      G = (Finset.univ.filter (fun i : Fin (m+1) => i.val ≤ k)).gcd Q →
      (∀ i, i.val ≤ k → G*H i = Q i ∧ (H i).natDegree ≤ m) →
      (∃ i, i.val ≤ k ∧ (H i).natDegree = m) → 0 ≤ logMoment (μ : Measure ℝ) G →
      Real.rpow n (-C*n)*Real.exp (((m : ℝ)*n-(m : ℝ)^2/2)*
        (logEnergy (realLift (μ : Measure ℝ))).toReal) ≤
        ∏ i, nNorm K (μ : Measure ℝ) n (realPoly (Q i)) := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.3 / countable-components — smith Theorem 1.5, p.4; Notation 5.8, p.37 -/


/-- Every finite interval set has countably many components. -/
lemma finiteIntervals_countableComponents (K : Set ℝ) (h : FiniteIntervals K) : CountableComponents K := by
  sorry


/-- Every countable real set has countably many components. -/
lemma countableSet_countableComponents (K : Set ℝ) (h : K.Countable) : CountableComponents K := by
  sorry


/-- A nonzero real affine map preserves and reflects component countability. -/
lemma countableComponents_affine (K : Set ℝ) (a b : ℝ) (ha : a ≠ 0) : CountableComponents (Set.image (fun x => a*x+b) K) ↔ CountableComponents K := by
  sorry


/-- Unit test `components_empty`: The empty set qualifies. -/
example  : CountableComponents (∅ : Set ℝ) := by
  sorry


/-- Unit test `components_integer_points`: The nonnegative integer points give infinitely many countable components. -/
example  : CountableComponents (Set.range (fun n : ℕ => (n : ℝ))) := by
  sorry


/-- Unit test `components_cantor`: The Cantor set has uncountably many one-point components. -/
example  : ¬ CountableComponents cantorSet := by
  sorry


theorem holder_extremizers (K : Set ℝ) (hK : IsCompact K)
    (μ : ProbabilityMeasure ℝ) (hs : supported (μ : Measure ℝ) K) (hh : IsHolder (μ : Measure ℝ)) :
    ∃ P : ℕ → ℝ[X], (∀ n, (P n).Monic ∧ (P n).natDegree = n+1 ∧ (P n).Splits ∧
      ∀ x ∈ (P n).roots, x ∈ K) ∧
      Tendsto (fun n => Real.rpow (nNorm K (μ : Measure ℝ) (n+1 : ℕ) (P n))
        (1/((n+1 : ℕ) : ℝ))) atTop (𝓝 1) := by sorry

theorem root_removal (K : Set ℝ) (hK : FiniteIntervals K)
    (μ : ProbabilityMeasure ℝ) (hs : supported (μ : Measure ℝ) K) (hh : IsHolder (μ : Measure ℝ)) :
    ∃ C : ℝ, 0 < C ∧ ∀ n : ℕ, ∀ P : ℝ[X], 0 < P.natDegree → ∀ α : ℂ,
      (P.map (algebraMap ℝ ℂ)).IsRoot α →
      sSup (insert 0 {v | ∃ x ∈ K, v = (potentialWeight (μ : Measure ℝ) x)^n *
        ‖((P.map (algebraMap ℝ ℂ))/(X-Polynomial.C α)).eval (x : ℂ)‖}) ≤
        Real.rpow (2*(max n P.natDegree) : ℕ) C * nNorm K (μ : Measure ℝ) n P := by sorry

lemma monicChebyshev_zero (K : Set ℝ) : monicChebyshev K 0 = 1 := by sorry

lemma weightedEquilibrium_supported (K : Set ℂ) (hK : IsCompact K)
    (Q : ℂ → EReal) (hQ : AdmissibleField K Q) : supported (weightedEquilibrium K Q : Measure ℂ) K := by sorry

lemma weightedEquilibrium_unique (K : Set ℂ) (hK : IsCompact K)
    (Q : ℂ → EReal) (hQ : AdmissibleField K Q) (μ : ProbabilityMeasure ℂ)
    (hs : supported (μ : Measure ℂ) K)
    (he : weightedEnergy (μ : Measure ℂ) Q = weightedEnergy (weightedEquilibrium K Q : Measure ℂ) Q) :
    μ = weightedEquilibrium K Q := by sorry

lemma weightedRobin_identity (K : Set ℂ) (hK : IsCompact K)
    (Q : ℂ → EReal) (hQ : AdmissibleField K Q) :
    let μ := (weightedEquilibrium K Q : Measure ℂ)
    (weightedRobin K Q : EReal) = logEnergy μ + extIntegral μ Q := by sorry

theorem weighted_variational_converse (K : Set ℂ) (hK : IsCompact K)
    (Q : ℂ → EReal) (hQ : AdmissibleField K Q) (μ : ProbabilityMeasure ℂ)
    (hs : supported (μ : Measure ℂ) K) (hI : logEnergy (μ : Measure ℂ) < ⊤)
    (hQint : extIntegral (μ : Measure ℂ) Q < ⊤) (F : ℝ)
    (hl : QuasiEverywhere K (fun z => (F : EReal) ≤ logPotential (μ : Measure ℂ) z + Q z))
    (he : ∀ᵐ z ∂(μ : Measure ℂ), logPotential (μ : Measure ℂ) z + Q z = (F : EReal)) :
    μ = weightedEquilibrium K Q ∧ F = weightedRobin K Q := by sorry

theorem weighted_variational_regular (K : Set ℂ) (hK : IsCompact K) (hc : 0 < capacity K)
    (hreg : ∀ z ∈ K, logPotential (equilibrium K : Measure ℂ) z = robinConstant K)
    (q : ℂ → ℝ) (hq : ContinuousOn q K) :
    (∀ z ∈ K, (weightedRobin K (fun z => (q z : EReal)) : EReal) ≤
      logPotential (weightedEquilibrium K (fun z => (q z : EReal)) : Measure ℂ) z + (q z : EReal)) ∧
    (∀ z ∈ (weightedEquilibrium K (fun z => (q z : EReal)) : Measure ℂ).support,
      logPotential (weightedEquilibrium K (fun z => (q z : EReal)) : Measure ℂ) z + (q z : EReal) =
        (weightedRobin K (fun z => (q z : EReal)) : EReal)) := by sorry


/-! LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.4 / holder-extremizers — smith Lemma 2.7 proof, pp.7–8; Proposition 2.12, pp.10–12 -/


lemma admissibleField_weight (K : Set ℂ) (Q : ℂ → EReal) :
    AdmissibleField K Q ↔ (∃ c : ℝ, ∀ z ∈ K, (c : EReal) ≤ Q z) ∧
      UpperSemicontinuousOn (fieldWeight Q) K ∧ ¬ Polar {z | z ∈ K ∧ 0 < fieldWeight Q z} := by sorry

/-- Unit test `upward_field_jump_not_admissible`: An upward field jump fails the convention. -/
example : ¬ AdmissibleField (Metric.closedBall (0 : ℂ) 1) (fun z => if z = 0 then 1 else 0) := by sorry

end TauCeti.LogPotential
