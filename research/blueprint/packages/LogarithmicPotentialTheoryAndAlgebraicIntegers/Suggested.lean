import Mathlib
import TauCeti.Probability.Process.EmpiricalMeasure
import TauCeti.Analysis.SpecialFunctions.Trigonometric.Chebyshev.Measure
import TauCeti.Analysis.PDE.FundamentalSolution.Planar

/-!
# LogarithmicPotentialTheoryAndAlgebraicIntegers: representative target signatures

The roadmap is README.md. This file records light definitions and representative
milestones statable against the pinned APIs; it is not exhaustive. Measures,
polynomials and probability topology are native. Singular logarithms use EReal,
root laws count multiplicities, integer squarefreeness is over ℚ, and heavy
minimizing or auxiliary polynomial choices remain in the README.
-/

noncomputable section
open MeasureTheory Set Filter Polynomial
open scoped ENNReal NNReal Topology BigOperators

namespace TauCetiRoadmap.LogarithmicPotentialTheoryAndAlgebraicIntegers

/-- Positive-part minus negative-part integration, used only with one finite part. -/
private def extIntegral {X : Type*} [MeasurableSpace X] (μ : Measure X)
    (f : X → EReal) : EReal :=
  (∫⁻ x, (f x).toENNReal ∂μ : EReal) - (∫⁻ x, (-f x).toENNReal ∂μ : EReal)

/-- Support and coefficient notation specialize existing native objects. -/
private abbrev supported {X : Type*} [MeasurableSpace X] (μ : Measure X) (K : Set X) :=
  μ Kᶜ = 0
private abbrev compactSupport {X : Type*} [MeasurableSpace X] [TopologicalSpace X]
    (μ : Measure X) := IsCompact μ.support
private abbrev realLift (μ : Measure ℝ) : Measure ℂ := μ.map Complex.ofReal
private abbrev realPoly (p : ℤ[X]) : ℝ[X] := p.map (Int.castRingHom ℝ)
private abbrev complexPoly (p : ℤ[X]) : ℂ[X] := p.map (Int.castRingHom ℂ)
private abbrev rootsIn (p : ℤ[X]) (K : Set ℝ) :=
  ∀ z : ℂ, (complexPoly p).IsRoot z → ∃ x ∈ K, (x : ℂ) = z

/-! ## Layer 0: Singular potentials and logarithmic energy -/

/-- The pole is +∞; off the diagonal this is −log distance. -/
def logKernel (z w : ℂ) : EReal :=
  if z = w then ⊤ else ((-Real.log ‖z - w‖ : ℝ) : EReal)

/-- Potential has finite negative part for a finite compactly supported measure. -/
def logPotential (μ : Measure ℂ) (z : ℂ) : EReal := extIntegral μ (logKernel z)

/-- The complex potential of the real pushforward, restricted to the real line. -/
def realPotential (μ : Measure ℝ) (x : ℝ) : EReal :=
  logPotential (realLift μ) (x : ℂ)

/-- Energy includes the diagonal contribution of atoms. -/
def logEnergy (μ : Measure ℂ) : EReal :=
  extIntegral (μ.prod μ) (fun zw => logKernel zw.1 zw.2)

example : logKernel 0 0 = ⊤ := by sorry
example : logKernel 0 2 = ((-Real.log 2 : ℝ) : EReal) := by sorry
example (a : ℂ) : logPotential (Measure.dirac a) a = ⊤ := by sorry
example : logPotential (Measure.dirac 0 + Measure.dirac 1) 2 =
    ((-Real.log 2 : ℝ) : EReal) := by sorry
example : realPotential (Measure.dirac 0) 0 = ⊤ := by sorry
example : realPotential (Measure.dirac 0) 1 = 0 := by sorry
example : logEnergy (Measure.dirac 0) = ⊤ := by sorry
example : logEnergy (realLift (volume.restrict (Icc (0 : ℝ) 1))) =
    (3 / 2 : EReal) := by sorry

/-- The normalization agrees with the existing harmonic kernel only off its pole. -/
example (z w : ℂ) (h : z ≠ w) : logKernel z w =
    ((2 * Real.pi * TauCeti.planarNewtonianKernel (z - w) : ℝ) : EReal) := by sorry

/-- Weak descent on a common compact support (Saff, Lemma 1.6, pp.171–172). -/
theorem energy_descent (K : Set ℂ) (hK : IsCompact K)
    (μ : ℕ → ProbabilityMeasure ℂ) (ν : ProbabilityMeasure ℂ)
    (hs : ∀ n, supported (μ n : Measure ℂ) K) (hlim : Tendsto μ atTop (𝓝 ν)) :
    logEnergy (ν : Measure ℂ) ≤ liminf (fun n => logEnergy (μ n : Measure ℂ)) atTop := by
  sorry

/-- Equal-mass finite-energy differences have strictly positive energy unless zero. -/
theorem strict_energy (μ ν : Measure ℂ) [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    (hcμ : compactSupport μ) (hcν : compactSupport ν) (hm : μ univ = ν univ)
    (hμ : logEnergy μ < ⊤) (hν : logEnergy ν < ⊤) :
    let J := extIntegral (μ.prod ν) (fun zw => logKernel zw.1 zw.2)
    J ≠ ⊤ ∧ J ≠ ⊥ ∧ 0 ≤ logEnergy μ + logEnergy ν - 2 * J ∧
      (logEnergy μ + logEnergy ν - 2 * J = 0 ↔ μ = ν) := by
  sorry

/-! ## Layer 1: Capacity, equilibrium and domination -/

/-- The compact Robin constant; an empty supported-probability set has infimum +∞. -/
def robinConstant (K : Set ℂ) : EReal :=
  sInf {r | ∃ μ : ProbabilityMeasure ℂ,
    supported (μ : Measure ℂ) K ∧ r = logEnergy (μ : Measure ℂ)}

/-- Compact logarithmic capacity; the infinite-energy branch is zero. -/
def capacity (K : Set ℂ) : ℝ :=
  if robinConstant K = ⊤ then 0 else Real.exp (-(robinConstant K).toReal)

/-- The Borel inner extension may be infinite on unbounded sets. -/
def innerCapacity (E : Set ℂ) : EReal :=
  sSup (insert 0 {r | ∃ L : Set ℂ,
    IsCompact L ∧ L ⊆ E ∧ r = (capacity L : EReal)})

/-- Capacity of the complex image of a real set. -/
def realCapacity (K : Set ℝ) : ℝ := capacity (Complex.ofReal '' K)

/-- Every compact subset has zero logarithmic capacity. -/
def Polar (E : Set ℂ) : Prop :=
  ∀ L : Set ℂ, IsCompact L → L ⊆ E → capacity L = 0

/-- The exceptional set is relative to the stated domain. -/
def QuasiEverywhere (K : Set ℂ) (P : ℂ → Prop) : Prop :=
  Polar {z | z ∈ K ∧ ¬ P z}

example : robinConstant ∅ = ⊤ := by sorry
example : robinConstant (Metric.closedBall (0 : ℂ) 1) = 0 := by sorry
example (a : ℂ) : capacity {a} = 0 := by sorry
example : capacity (Metric.closedBall (0 : ℂ) 2) = 2 := by sorry
example : innerCapacity ∅ = 0 := by sorry
example : innerCapacity (univ : Set ℂ) = ⊤ := by sorry
example : realCapacity (Icc (-1 : ℝ) 1) = 1 / 2 := by sorry
example : realCapacity (Icc (-2 : ℝ) 2) = 1 := by sorry
example (E : Set ℂ) (h : E.Countable) : Polar E := by sorry
example : ¬ Polar (Complex.ofReal '' Icc (0 : ℝ) 1) := by sorry
example : QuasiEverywhere ∅ (fun _ : ℂ => False) := by sorry
example : ¬ QuasiEverywhere (Complex.ofReal '' Icc (0 : ℝ) 1) (fun _ => False) := by sorry

/-- Ordinary equilibrium existence and uniqueness, without a chosen heavy minimizer. -/
theorem equilibrium_exists_unique (K : Set ℂ) (hK : IsCompact K) (hc : 0 < capacity K) :
    ∃! μ : ProbabilityMeasure ℂ,
      supported (μ : Measure ℂ) K ∧ logEnergy (μ : Measure ℂ) = robinConstant K := by
  sorry

/-- Full domination allows atomic comparison measures (Saff, Theorem 2.8, p.182). -/
theorem domination (μ ν : Measure ℂ) [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    (hcμ : compactSupport μ) (hcν : compactSupport ν) (hm : 0 < μ univ)
    (hn : ν univ ≤ μ univ) (hI : logEnergy μ < ⊤) (c : ℝ)
    (h : ∀ᵐ z ∂μ, logPotential μ z ≤ logPotential ν z + (c : EReal)) :
    ∀ z : ℂ, logPotential μ z ≤ logPotential ν z + (c : EReal) := by
  sorry

/-! ## Layer 2: External fields and weighted equilibrium -/

/-- Admissibility is lower semicontinuity, a finite lower bound and nonpolar finite locus. -/
def AdmissibleField (K : Set ℂ) (Q : ℂ → EReal) : Prop :=
  LowerSemicontinuousOn Q K ∧ (∃ c : ℝ, ∀ z ∈ K, (c : EReal) ≤ Q z) ∧
    ¬ Polar {z | z ∈ K ∧ Q z ≠ ⊤}

/-- Field weights vanish at +∞ and have exp(−Q) at finite values. -/
def fieldWeight (Q : ℂ → EReal) (z : ℂ) : ℝ :=
  if Q z = ⊤ then 0 else Real.exp (-(Q z).toReal)

/-- The field integral occurs twice in weighted energy. -/
def weightedEnergy (μ : Measure ℂ) (Q : ℂ → EReal) : EReal :=
  logEnergy μ + 2 * extIntegral μ Q

/-- Real exponents allow the fixed negative shifts used by interior quantiles. -/
def weightedNorm (K : Set ℝ) (w : ℝ → ℝ) (t : ℝ) (p : ℝ[X]) : ℝ :=
  sSup (insert 0 {v | ∃ x ∈ K, v = Real.rpow (w x) t * |p.eval x|})

/-- Hölder measures have finite potentials, so this positive real weight is faithful. -/
def potentialWeight (μ : Measure ℝ) (x : ℝ) : ℝ :=
  Real.exp (realPotential μ x).toReal

/-- Polynomial norm at the potential weight, for any real exponent. -/
def nNorm (K : Set ℝ) (μ : Measure ℝ) (t : ℝ) (p : ℝ[X]) : ℝ :=
  weightedNorm K (potentialWeight μ) t p

example (K : Set ℂ) : ¬ AdmissibleField K (fun _ => ⊤) := by sorry
example : ¬ AdmissibleField ({0} : Set ℂ) (fun _ => 0) := by sorry
example : fieldWeight (fun _ => ⊤) 0 = 0 := by sorry
example : fieldWeight (fun _ => 0) 0 = 1 := by sorry
example : weightedEnergy 0 (fun _ => 0) = 0 := by sorry
example : weightedEnergy (Measure.dirac (0 : ℂ)) (fun _ => 1) = ⊤ := by sorry
example (w : ℝ → ℝ) (t : ℝ) (p : ℝ[X]) : weightedNorm ∅ w t p = 0 := by sorry
example : weightedNorm (Icc (0 : ℝ) 1) (fun _ => 2) 3 1 = 8 := by sorry
example : potentialWeight 0 0 = 1 := by sorry
example : potentialWeight (volume.restrict (Icc (0 : ℝ) 1)) 0 = Real.exp 1 := by sorry
example (μ : Measure ℝ) (t : ℝ) (p : ℝ[X]) : nNorm ∅ μ t p = 0 := by sorry
example (μ : Measure ℝ) (K : Set ℝ) (p : ℝ[X]) :
    nNorm K μ 0 p = weightedNorm K (fun _ => 1) 0 p := by sorry

/-- An admissible compact weighted problem attains a finite minimum. -/
theorem weightedEnergy_minimum_exists (K : Set ℂ) (hK : IsCompact K)
    (Q : ℂ → EReal) (hQ : AdmissibleField K Q) :
    ∃ μ : ProbabilityMeasure ℂ, supported (μ : Measure ℂ) K ∧
      weightedEnergy (μ : Measure ℂ) Q < ⊤ ∧
      ∀ ν : ProbabilityMeasure ℂ, supported (ν : Measure ℂ) K →
        weightedEnergy (μ : Measure ℂ) Q ≤ weightedEnergy (ν : Measure ℂ) Q := by
  sorry

/-! ## Layer 3: Real Hölder laws and polynomial roots -/

/-- Interval-mass Hölder control, with a strictly positive exponent and constant. -/
def HolderMeasure (μ : Measure ℝ) (η : ℝ) : Prop :=
  0 < η ∧ ∃ C : ℝ, 0 < C ∧ ∀ x y : ℝ, x ≤ y →
    μ (Icc x y) ≤ ENNReal.ofReal (C * Real.rpow (y - x) η)

/-- Existence of a positive interval-mass Hölder exponent. -/
def IsHolder (μ : Measure ℝ) : Prop := ∃ η : ℝ, HolderMeasure μ η

/-- Nonempty ordered unions of nondegenerate compact real intervals. -/
def FiniteIntervals (K : Set ℝ) : Prop :=
  ∃ m : ℕ, 0 < m ∧ ∃ a b : Fin m → ℝ,
    (∀ i, a i < b i) ∧ (∀ i j, i < j → b i < a j) ∧ K = ⋃ i, Icc (a i) (b i)

/-- Countable components include singleton components with accumulation points. -/
def CountableComponents (K : Set ℝ) : Prop :=
  {S : Set ℝ | ∃ x ∈ K, S = connectedComponentIn K x}.Countable

/-- Normalize the native interval orthogonality measure and push it forward affinely. -/
def intervalEquilibriumMeasure (a b : ℝ) : Measure ℝ :=
  if a < b then (ENNReal.ofReal (Real.pi⁻¹) • Polynomial.Chebyshev.measureT).map
    (fun t => (a + b) / 2 + (b - a) * t / 2) else 0

/-- The finite empirical law of the real roots multiset; no-real-root default is δ0. -/
def polynomialRootLaw (p : ℝ[X]) : ProbabilityMeasure ℝ :=
  let r := p.roots.toList
  if r.length = 0 then ⟨Measure.dirac 0, inferInstance⟩ else
    TauCeti.Probability.empiricalMeasure (fun i => r[i]?.getD 0) (r.length - 1)

example (η : ℝ) (hη : 0 < η) : HolderMeasure 0 η := by sorry
example (a : ℝ) (η : ℝ) : ¬ HolderMeasure (Measure.dirac a) η := by sorry
example : IsHolder (volume.restrict (Icc (0 : ℝ) 1)) := by sorry
example (a : ℝ) : ¬ IsHolder (Measure.dirac a) := by sorry
example : FiniteIntervals (Icc (0 : ℝ) 1) := by sorry
example : ¬ FiniteIntervals (insert (3 : ℝ) (Icc (0 : ℝ) 1)) := by sorry
example : CountableComponents (∅ : Set ℝ) := by sorry
example : ¬ CountableComponents cantorSet := by sorry
example : intervalEquilibriumMeasure (-1) 1 univ = 1 := by sorry
example (a : ℝ) : intervalEquilibriumMeasure a a = 0 := by sorry
example : (polynomialRootLaw ((X - C (1 : ℝ)) ^ 2 * (X - C 2)) : Measure ℝ) =
    ENNReal.ofReal (2 / 3 : ℝ) • Measure.dirac 1 +
    ENNReal.ofReal (1 / 3 : ℝ) • Measure.dirac 2 := by sorry
example : (polynomialRootLaw ((X : ℝ[X]) ^ 2 + 1) : Measure ℝ) = Measure.dirac 0 := by
  sorry

/-- Hölder potentials are finite and continuous, with a real η-Hölder bound. -/
theorem holder_potential (μ : Measure ℝ) [IsFiniteMeasure μ]
    (hc : compactSupport μ) (η : ℝ) (h : HolderMeasure μ η) (hη : η < 1) :
    (∀ z : ℂ, logPotential (realLift μ) z ≠ ⊤) ∧
    Continuous (fun z : ℂ => (logPotential (realLift μ) z).toReal) ∧
    ∃ C : ℝ, 0 < C ∧ ∀ x y : ℝ,
      |(realPotential μ x).toReal - (realPotential μ y).toReal| ≤ C * Real.rpow |x - y| η := by
  sorry

/-- Asymptotically extremal real-rooted polynomials have the prescribed law. -/
theorem weighted_zero_limit (K : Set ℝ) (hK : IsCompact K)
    (μ : ProbabilityMeasure ℝ) (hs : supported (μ : Measure ℝ) K)
    (hh : IsHolder (μ : Measure ℝ)) (P : ℕ → ℝ[X])
    (hP : ∀ i, (P i).Monic ∧ (P i).Splits ∧ 0 < (P i).natDegree ∧
      ∀ x ∈ (P i).roots, x ∈ K)
    (hd : Tendsto (fun i => (P i).natDegree) atTop atTop)
    (hn : Tendsto (fun i => Real.rpow (nNorm K (μ : Measure ℝ) (P i).natDegree (P i))
      (1 / (P i).natDegree : ℝ)) atTop (𝓝 1)) :
    Tendsto (fun i => polynomialRootLaw (P i)) atTop (𝓝 μ) := by
  sorry

/-! ## Layer 4: Logarithmic moments and quantile approximation -/

/-- The extended logarithm has value −∞ at a polynomial zero. -/
def logAbs (x : ℝ) : EReal := if x = 0 then ⊥ else ((Real.log |x| : ℝ) : EReal)

/-- Integer-polynomial logarithmic moment with finite positive part on compact support. -/
def logMoment (μ : Measure ℝ) (Q : ℤ[X]) : EReal :=
  extIntegral μ (fun x => logAbs ((realPoly Q).eval x))

/-- Admissibility does not itself impose mass one or compact support. -/
def ArithmeticAdmissible (μ : Measure ℝ) : Prop :=
  ∀ Q : ℤ[X], Q ≠ 0 → 0 ≤ logMoment μ Q

example : logAbs 0 = ⊥ := by sorry
example : logAbs (-2) = ((Real.log 2 : ℝ) : EReal) := by sorry
example : logMoment (Measure.dirac 0) X = ⊥ := by sorry
example : logMoment (Measure.dirac 2) X = ((Real.log 2 : ℝ) : EReal) := by sorry
example : ArithmeticAdmissible 0 := by sorry
example (a : ℤ) : ¬ ArithmeticAdmissible (Measure.dirac (a : ℝ)) := by sorry

/-- The moment semicontinuity direction is opposite to the energy direction. -/
theorem logMoment_upperSemicontinuous (K : Set ℝ) (hK : IsCompact K)
    (μ : ℕ → ProbabilityMeasure ℝ) (ν : ProbabilityMeasure ℝ)
    (hs : ∀ n, supported (μ n : Measure ℝ) K) (hlim : Tendsto μ atTop (𝓝 ν))
    (Q : ℤ[X]) (hQ : Q ≠ 0) :
    limsup (fun n => logMoment (μ n : Measure ℝ) Q) atTop ≤ logMoment (ν : Measure ℝ) Q := by
  sorry

/-- Quantiles give real extremizers in every positive degree. -/
theorem holder_extremizers (K : Set ℝ) (hK : IsCompact K)
    (μ : ProbabilityMeasure ℝ) (hs : supported (μ : Measure ℝ) K)
    (hh : IsHolder (μ : Measure ℝ)) :
    ∃ P : ℕ → ℝ[X],
      (∀ n, (P n).Monic ∧ (P n).natDegree = n + 1 ∧ (P n).Splits ∧
        ∀ x ∈ (P n).roots, x ∈ K) ∧
      Tendsto (fun n => Real.rpow (nNorm K (μ : Measure ℝ) (n + 1 : ℕ) (P n))
        (1 / (n + 1 : ℕ) : ℝ)) atTop (𝓝 1) := by
  sorry

/-! ## Layer 5: Integer approximation from convex-body geometry -/

/-- Small squarefree integer polynomials; content, monicity and root location are unrestricted. -/
theorem small_squarefree (K : Set ℝ) (hK : IsCompact K)
    (μ : ProbabilityMeasure ℝ) (hs : supported (μ : Measure ℝ) K)
    (hh : IsHolder (μ : Measure ℝ)) (ha : ArithmeticAdmissible (μ : Measure ℝ)) :
    ∃ C : ℝ, 0 < C ∧ ∀ n : ℕ, 2 ≤ n → ∃ R : ℤ[X],
      R.natDegree = n ∧ Squarefree (R.map (algebraMap ℤ ℚ)) ∧
      nNorm K (μ : Measure ℝ) n (realPoly R) ≤ Real.rpow n (C * Real.sqrt n) := by
  sorry

/-- Negative control for the coefficient-ring distinction. -/
example : Squarefree ((C (4 : ℤ) * (X + 1)).map (algebraMap ℤ ℚ)) ∧
    ¬ Squarefree (C (4 : ℤ) * (X + 1)) := by sorry

/-! ## Layer 6: Chebyshev pruning and complementary polynomials -/

/-- The unit-weight norm includes the zero value on an empty set. -/
def uniformNorm (K : Set ℝ) (P : ℝ[X]) : ℝ := weightedNorm K (fun _ => 1) 0 P

example : uniformNorm ∅ 1 = 0 := by sorry
example : uniformNorm (Icc (-1 : ℝ) 1) (X ^ 2 - C (1 / 2)) = 1 / 2 := by sorry

/-- Finite-gap monic minimizers have a degree-independent capacity upper bound. -/
theorem chebyshev_finite_gap_bound (K : Set ℝ) (hK : FiniteIntervals K) :
    ∃ C : ℝ, 0 < C ∧ ∀ r : ℕ, 0 < r → ∃ T : ℝ[X],
      T.Monic ∧ T.natDegree = r ∧ T.Splits ∧ Squarefree T ∧
      (∀ P : ℝ[X], P.Monic → P.natDegree = r → uniformNorm K T ≤ uniformNorm K P) ∧
      Real.rpow (realCapacity K) r ≤ uniformNorm K T ∧
      uniformNorm K T ≤ C * Real.rpow (realCapacity K) r := by
  sorry

/-! ## Layer 7: Real roots with integer rounding margins -/

/-- Real monic polynomials have high even coefficients and disjoint protected root brackets. -/
theorem real_polynomial_rounding_margins (K : Set ℝ) (hK : FiniteIntervals K)
    (hc : 1 < realCapacity K) (μ : ProbabilityMeasure ℝ)
    (hs : supported (μ : Measure ℝ) K) (hh : IsHolder (μ : Measure ℝ)) (B : ℝ) (hB : 0 < B) :
    ∃ C : ℝ, 3 < C ∧ ∀ n : ℕ, C < n →
      let m := Nat.floor (B * Real.sqrt n * Real.log n)
      m < n ∧ ∃ P : ℝ[X], ∃ α x y : Fin n → ℝ,
        P.Monic ∧ P.natDegree = n ∧ P.Splits ∧ Squarefree P ∧
        P.roots = (Finset.univ.val.map α) ∧ StrictMono α ∧
        nNorm K (μ : Measure ℝ) (n - m : ℕ) P ≤
          Real.rpow n C * Real.rpow (realCapacity K) m ∧
        (∀ k : ℕ, n - m ≤ k → k < n → ∃ z : ℤ, P.coeff k = 2 * (z : ℝ)) ∧
        (∀ i, x i < α i ∧ α i < y i ∧ Icc (x i) (y i) ⊆ K ∧
          Real.rpow n (-C) * Real.rpow (realCapacity K) m ≤
            Real.rpow (potentialWeight (μ : Measure ℝ) (x i)) (n - m : ℕ) * |P.eval (x i)| ∧
          Real.rpow n (-C) * Real.rpow (realCapacity K) m ≤
            Real.rpow (potentialWeight (μ : Measure ℝ) (y i)) (n - m : ℕ) * |P.eval (y i)|) ∧
        (∀ i j, i < j → y i < x j) := by
  sorry

/-! ## Layer 8: Smoothing and removal of Hölder hypotheses -/

/-- Finite energy follows from admissibility, without Hölder or component assumptions. -/
theorem admissible_energy_nonpositive (μ : ProbabilityMeasure ℝ)
    (hc : compactSupport (μ : Measure ℝ)) (ha : ArithmeticAdmissible (μ : Measure ℝ)) :
    logEnergy (realLift (μ : Measure ℝ)) ≤ 0 := by
  sorry

/-- Support-preserving approximation by admissible Hölder laws on finite interval unions. -/
theorem holder_reduction (K : Set ℝ) (hK : IsCompact K) (hcpt : CountableComponents K)
    (hcap : 1 < realCapacity K) (μ : ProbabilityMeasure ℝ)
    (hs : supported (μ : Measure ℝ) K) (ha : ArithmeticAdmissible (μ : Measure ℝ)) :
    ∃ K' : ℕ → Set ℝ, ∃ μ' : ℕ → ProbabilityMeasure ℝ,
      (∀ j, FiniteIntervals (K' j) ∧ K' j ⊆ K ∧ 1 < realCapacity (K' j) ∧
        supported (μ' j : Measure ℝ) (K' j) ∧ IsHolder (μ' j : Measure ℝ) ∧
        ArithmeticAdmissible (μ' j : Measure ℝ)) ∧ Tendsto μ' atTop (𝓝 μ) := by
  sorry

/-! ## Layer 9: Realization by integer conjugates -/

/-- Exact realization for countable-component compact real sets of capacity strictly above one. -/
theorem integer_conjugate_realization (K : Set ℝ) (hK : IsCompact K)
    (hcpt : CountableComponents K) (hcap : 1 < realCapacity K)
    (μ : ProbabilityMeasure ℝ) (hs : supported (μ : Measure ℝ) K) :
    ArithmeticAdmissible (μ : Measure ℝ) ↔ ∃ P : ℕ → ℤ[X],
      Function.Injective P ∧
      (∀ n, (P n).Monic ∧ Irreducible (P n) ∧ 0 < (P n).natDegree ∧ rootsIn (P n) K) ∧
      Tendsto (fun n => polynomialRootLaw (realPoly (P n))) atTop (𝓝 μ) := by
  sorry

/-! ## Layer 10: Cofinite optimization and auxiliary completeness -/

/-- Minimal polynomials count conjugacy classes once. -/
def algebraicPolynomials (S : Set ℝ) : Set ℤ[X] :=
  {P | P.Monic ∧ Irreducible P ∧ 0 < P.natDegree ∧ rootsIn P S}

/-- Mean of a continuous objective over the roots multiset of a splitting minimal polynomial. -/
def conjugateMean (P : ℤ[X]) (F : ℝ → ℝ) : ℝ :=
  ∫ x, F x ∂(polynomialRootLaw (realPoly P) : Measure ℝ)

/-- Supremum of real lower thresholds with only finitely many exceptional minimal polynomials. -/
def cofiniteMean (S : Set ℝ) (F : ℝ → ℝ) : EReal :=
  sSup {c | ∃ r : ℝ, c = (r : EReal) ∧
    {P | P ∈ algebraicPolynomials S ∧ conjugateMean P F < r}.Finite}

/-- All auxiliaries are nonzero and all coefficients positive; an empty family is allowed. -/
def HasAuxiliaryCertificate (S : Set ℝ) (F : ℝ → ℝ) (c : ℝ) : Prop :=
  ∃ N : ℕ, ∃ Q : Fin N → ℤ[X], ∃ a : Fin N → ℝ,
    (∀ i, Q i ≠ 0 ∧ 0 < a i) ∧ ∀ x ∈ S,
      (c : EReal) + ∑ i, (a i : EReal) * logAbs ((realPoly (Q i)).eval x) ≤ (F x : EReal)

/-- Extended supremum of auxiliary certificate values, finite under completeness hypotheses. -/
def auxiliarySup (S : Set ℝ) (F : ℝ → ℝ) : EReal :=
  sSup {c | ∃ r : ℝ, c = (r : EReal) ∧ HasAuxiliaryCertificate S F r}

example : algebraicPolynomials ∅ = ∅ := by sorry
example : algebraicPolynomials ({2} : Set ℝ) = {X - C 2} := by sorry
example : conjugateMean (X - C (2 : ℤ)) id = 2 := by sorry
example : conjugateMean (X - C (2 : ℤ)) (fun _ => 3) = 3 := by sorry
example (F : ℝ → ℝ) : cofiniteMean ∅ F = ⊤ := by sorry
example : cofiniteMean ({2} : Set ℝ) id = ⊤ := by sorry
example (S : Set ℝ) : HasAuxiliaryCertificate S (fun _ => 3) 3 := by sorry
example : ¬ HasAuxiliaryCertificate univ (fun _ => 0) 1 := by sorry
example : auxiliarySup univ (fun _ => 0) = 0 := by sorry
example : auxiliarySup ∅ (fun _ => 0) = ⊤ := by sorry

/-- Auxiliary optimization equals the attained admissible-law minimum and cofinite mean. -/
theorem auxiliary_completeness (S : Set ℝ) (hS : IsClosed S) (hcpt : CountableComponents S)
    (hcap : ∃ L : Set ℝ, IsCompact L ∧ L ⊆ S ∧ 1 < realCapacity L)
    (F : ℝ → ℝ) (hF : ContinuousOn F S)
    (hg : ∀ A : ℝ, ∃ R : ℝ, 1 < R ∧ ∀ x ∈ S, R < |x| → A < F x / Real.log |x|) :
    cofiniteMean S F = auxiliarySup S F ∧ ∃ μ : ProbabilityMeasure ℝ,
      compactSupport (μ : Measure ℝ) ∧ supported (μ : Measure ℝ) S ∧
      ArithmeticAdmissible (μ : Measure ℝ) ∧
      cofiniteMean S F = ((∫ x, F x ∂(μ : Measure ℝ) : ℝ) : EReal) ∧
      ∀ ν : ProbabilityMeasure ℝ, compactSupport (ν : Measure ℝ) →
        supported (ν : Measure ℝ) S → ArithmeticAdmissible (ν : Measure ℝ) →
        (∫ x, F x ∂(μ : Measure ℝ)) ≤ ∫ x, F x ∂(ν : Measure ℝ) := by
  sorry

/-! ## Layer 11: Trace witnesses and optimal support -/

/-- Exact rational parameters have the certified signs and trace enclosure. -/
theorem serre_witness_numerics :
    let a : ℝ := 87353 / 1000000
    let b : ℝ := 4411076 / 1000000
    let γ : ℝ := 215485 / 1000000
    let u := (a + b + 2 * Real.sqrt (a * b)) / 4
    let m := γ * Real.sqrt (a * b) + (1 - γ) * (a + b) / 2;
    -Real.log ((b - a) / 4) + γ * Real.log u < 0 ∧
      0 < (1 - 2 * γ) * Real.log u + γ * Real.log (a * b) ∧
      (1898303 / 1000000 : ℝ) < m ∧ m < (1898304 / 1000000 : ℝ) := by
  sorry

/-- CA.6 identifies this cofinite trace quantity with its classical λSSS. -/
theorem trace_constant_bound :
    cofiniteMean (Ici (0 : ℝ)) id < ((189831 / 100000 : ℝ) : EReal) := by
  sorry

/-! ## Layer 12: Simple abelian varieties and point counts -/

/-
README-only definitions and constructions:
  equilibrium; feketeDiameter; transfiniteDiameter;
  weightedEquilibrium; weightedRobin;
  quantilePolynomial; nearestQuantile;
  monicChebyshev; IsPruned; complementDegreeFactor; complementaryPolynomial;
  inverseIntervalMeasure; sweetened; serreMeasure.

The remaining analytic and arithmetic targets, including Frostman, weighted
variation, Remez, root removal, finite-gap density and the exact supplier
adapters, are in README.md. Layer 12's real Weil bridge, point-count optimization,
square-field asymptotics and explicit point-count bounds require the native F3
simple-isogeny-class, positive natural dimension and finite-point interfaces.
-/

end TauCetiRoadmap.LogarithmicPotentialTheoryAndAlgebraicIntegers
