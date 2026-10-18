import Mathlib.Analysis.Complex.Liouville
import Mathlib.Analysis.Complex.JensenFormula
import Mathlib.Analysis.Calculus.IteratedDeriv.Defs
import Mathlib.Analysis.SpecialFunctions.Complex.CircleMap
import Mathlib.FieldTheory.RatFunc.IntermediateField
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.LinearAlgebra.Vandermonde
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.RingTheory.PowerSeries.Substitution
import Mathlib.RingTheory.PowerSeries.WellKnown

/-!
# Arithmetic algebraization: selected target signatures

**This file is not the roadmap and is not exhaustive.** The definitive reader is
`DiophantineApproximationAndTranscendencePartII.md` in the sibling readmes directory.
These statements suggest Lean forms so contributors and reviewers can converge on
names and signatures. Discharging them finishes neither a layer nor the roadmap.

The binding roadmap shape keeps light real-bodied definitions, end theorems,
layer milestones and a few examples over carriers at the pins. The reader carries
the complete API and tests, the auxiliary construction, holonomic differential
modules and the capacity interfaces. Those theories are not developed here.

AA.2 states independence through all finite polynomial-power families; this is
equivalent to independence over Q(p), since p is a nonconstant rational germ.
Uniformizes is a germ relation, not global evaluation of a formal series.

The source's general-chi V bound and arbitrary-compact capacity formula have
explicit counterexamples in the reader. Neither false conclusion is asserted.
-/

noncomputable section

open Filter Metric
open scoped Topology BigOperators

namespace TauCeti.ArithmeticAlgebraization

/-! AA.0: arithmetic lattices and analytic germs. -/

/-- Coefficientwise membership in the integral power-series lattice. -/
def IntegralSeries (f : PowerSeries ℚ) : Prop :=
  ∀ n : ℕ, ∃ a : ℤ, PowerSeries.coeff n f = (a : ℚ)

/-- Variable scaling does not clear a nonintegral constant coefficient. -/
def IntegralAtScale (M : ℕ) (f : PowerSeries ℚ) : Prop :=
  ∀ n : ℕ, ∃ a : ℤ, (M : ℚ) ^ n * PowerSeries.coeff n f = (a : ℚ)

/-- The Taylor realization only lives near the initial point; g lives near the closed disc. -/
def Uniformizes (φ : ℂ → ℂ) (f : PowerSeries ℚ) (g : ℂ → ℂ) : Prop :=
  AnalyticOnNhd ℂ g (closedBall 0 1) ∧
  ∃ F : ℂ → ℂ, AnalyticAt ℂ F 0 ∧
    (∀ n : ℕ, ((PowerSeries.coeff n f : ℚ) : ℂ) =
      iteratedDeriv n F 0 / (n.factorial : ℂ)) ∧
    g =ᶠ[𝓝 0] F ∘ φ

/-- Normalized circle average; the cutoff makes the integrand continuous at zeros. -/
def positiveLogMean (g : ℂ → ℂ) : ℝ :=
  Real.circleAverage (fun z => Real.log (max 1 ‖g z‖)) 0 1

theorem IntegralAtScale.rescale (M : ℕ) (f : PowerSeries ℚ) :
    IntegralAtScale M f ↔ IntegralSeries (PowerSeries.rescale (M : ℚ) f) := by
  sorry

theorem IntegralAtScale.enlarge {M N : ℕ} (hM : 0 < M) (hN : 0 < N)
    (hMN : M ∣ N) {f : PowerSeries ℚ} (hf : IntegralAtScale M f) :
    IntegralAtScale N f := by
  sorry

theorem IntegralAtScale.constant (M : ℕ) (c : ℚ) :
    IntegralAtScale M (PowerSeries.C c) ↔ ∃ a : ℤ, c = (a : ℚ) := by
  sorry

theorem positiveLogMean.constant (c : ℂ) :
    positiveLogMean (fun _ => c) = Real.log (max 1 ‖c‖) := by
  sorry

theorem Uniformizes.ring {φ g h : ℂ → ℂ} {f k : PowerSeries ℚ}
    (hφ : AnalyticAt ℂ φ 0) (hφ0 : φ 0 = 0)
    (hf : Uniformizes φ f g) (hk : Uniformizes φ k h) :
    Uniformizes φ (f + k) (fun z => g z + h z) ∧
    Uniformizes φ (f * k) (fun z => g z * h z) := by
  sorry

/-- AA.0: the strict radius threshold forces an integral series to be a polynomial. -/
theorem integral_radius_polynomial (f : PowerSeries ℚ) (F : ℂ → ℂ) (R : ℝ)
    (hR : 1 < R) (hf : IntegralSeries f)
    (hF : AnalyticOnNhd ℂ F (ball 0 R))
    (ht : ∀ n : ℕ, ((PowerSeries.coeff n f : ℚ) : ℂ) =
      iteratedDeriv n F 0 / (n.factorial : ℂ)) :
    ∃ P : Polynomial ℤ, ∀ n : ℕ,
      PowerSeries.coeff n f = (P.coeff n : ℚ) := by
  sorry

/-- AA.0: qualitative Eisenstein theorem, retaining the scalar for the constant term. -/
theorem eisenstein_denominators (f : PowerSeries (AlgebraicClosure ℚ))
    (hf : ∃ P : MvPolynomial (Fin 2) (AlgebraicClosure ℚ), P ≠ 0 ∧
      MvPolynomial.eval₂Hom (algebraMap _ (PowerSeries (AlgebraicClosure ℚ)))
        (fun i => if i = 0 then PowerSeries.X else f) P = 0) :
    ∃ c M : ℕ, 0 < c ∧ 0 < M ∧ ∀ n : ℕ,
      IsIntegral ℤ ((c : AlgebraicClosure ℚ) * (M : AlgebraicClosure ℚ) ^ n *
        PowerSeries.coeff n f) := by
  sorry

/-- AA.0: normalized inverse denominators, uniformly in the integral pullback. -/
theorem inverse_denominators (p : PowerSeries ℚ)
    (hp : ∃ a b : Polynomial ℚ, b.coeff 0 ≠ 0 ∧
      (b : PowerSeries ℚ) * p = (a : PowerSeries ℚ))
    (hn : ∃ n : ℕ, 0 < n ∧ PowerSeries.coeff n p ≠ 0) :
    ∃ M : ℕ, 0 < M ∧ ∀ χ : PowerSeries ℚ,
      PowerSeries.coeff 0 χ = 0 → PowerSeries.coeff 1 χ = 1 →
      IntegralSeries (PowerSeries.subst χ p) →
      (∀ n : ℕ, 2 ≤ n → ∃ a : ℤ,
        (M : ℚ) ^ (n - 1) * PowerSeries.coeff n χ = (a : ℚ)) ∧
      ∀ f : PowerSeries ℚ, IntegralSeries (PowerSeries.subst χ f) →
        IntegralAtScale M f := by
  sorry

example : ¬ IntegralAtScale 2 (PowerSeries.C (1 / 2 : ℚ)) := by
  sorry

example : IntegralAtScale 4
    (PowerSeries.X + PowerSeries.C (1 / 4 : ℚ) * PowerSeries.X ^ 2) := by
  sorry

example : Uniformizes (fun z : ℂ => 2 * z) PowerSeries.X (fun z => 2 * z) := by
  sorry

example : positiveLogMean (fun z : ℂ => 2 * z) = Real.log 2 := by
  sorry

/-! AA.1–AA.2: the end rank estimate and its algebraicity consequence.
The auxiliary d-variable construction and the order of limits are reader targets.
-/

/-- AA.2: the integrated arithmetic rank bound, on native series and analytic carriers. -/
theorem mean_rank_bound (m : ℕ) (hm : 0 < m)
    (p χ : PowerSeries ℚ) (f : Fin m → PowerSeries ℚ)
    (φ g : ℂ → ℂ) (gF : Fin m → ℂ → ℂ)
    (hp : ∃ a b : Polynomial ℚ, b.coeff 0 ≠ 0 ∧
      (b : PowerSeries ℚ) * p = (a : PowerSeries ℚ))
    (hn : ∃ n : ℕ, 0 < n ∧ PowerSeries.coeff n p ≠ 0)
    (hχ0 : PowerSeries.coeff 0 χ = 0) (hχ1 : PowerSeries.coeff 1 χ = 1)
    (hpχ : IntegralSeries (PowerSeries.subst χ p))
    (hfχ : ∀ i, IntegralSeries (PowerSeries.subst χ (f i)))
    (hli : ∀ D : ℕ, LinearIndependent ℚ
      (fun ik : Fin m × Fin D => p ^ (ik.2 : ℕ) * f ik.1))
    (hφ : AnalyticOnNhd ℂ φ (closedBall 0 1)) (hφ0 : φ 0 = 0)
    (h_deriv : 1 < ‖deriv φ 0‖) (hpg : Uniformizes φ p g)
    (hfg : ∀ i, Uniformizes φ (f i) (gF i)) :
    (m : ℝ) ≤ Real.exp 1 * positiveLogMean g / Real.log ‖deriv φ 0‖ := by
  sorry

/-- AA.2: algebraicity follows by applying the rank bound to arbitrarily many powers. -/
theorem arithmetic_algebraization (p χ f : PowerSeries ℚ) (φ g h : ℂ → ℂ)
    (hp : ∃ a b : Polynomial ℚ, b.coeff 0 ≠ 0 ∧
      (b : PowerSeries ℚ) * p = (a : PowerSeries ℚ))
    (hn : ∃ n : ℕ, 0 < n ∧ PowerSeries.coeff n p ≠ 0)
    (hχ0 : PowerSeries.coeff 0 χ = 0) (hχ1 : PowerSeries.coeff 1 χ = 1)
    (hpχ : IntegralSeries (PowerSeries.subst χ p))
    (hfχ : IntegralSeries (PowerSeries.subst χ f))
    (hφ : AnalyticOnNhd ℂ φ (closedBall 0 1)) (hφ0 : φ 0 = 0)
    (h_deriv : 1 < ‖deriv φ 0‖) (hpg : Uniformizes φ p g) (hfh : Uniformizes φ f h) :
    ∃ P : MvPolynomial (Fin 2) ℚ, P ≠ 0 ∧
      MvPolynomial.eval₂Hom (algebraMap ℚ (PowerSeries ℚ))
        (fun i => if i = 0 then PowerSeries.X else f) P = 0 := by
  sorry

/-- AA.2: the open-disc criterion is obtained by shrinking the parameter disc. -/
theorem andre_criterion (f : PowerSeries ℚ) (φ g F : ℂ → ℂ)
    (hf : IntegralSeries f) (hφ : AnalyticOnNhd ℂ φ (ball 0 1))
    (hg : AnalyticOnNhd ℂ g (ball 0 1)) (hφ0 : φ 0 = 0)
    (h_deriv : 1 < ‖deriv φ 0‖) (hF : AnalyticAt ℂ F 0)
    (ht : ∀ n : ℕ, ((PowerSeries.coeff n f : ℚ) : ℂ) =
      iteratedDeriv n F 0 / (n.factorial : ℂ))
    (heq : g =ᶠ[𝓝 0] F ∘ φ) :
    ∃ P : MvPolynomial (Fin 2) ℚ, P ≠ 0 ∧
      MvPolynomial.eval₂Hom (algebraMap ℚ (PowerSeries ℚ))
        (fun i => if i = 0 then PowerSeries.X else f) P = 0 := by
  sorry

/-! AA.3: the circular adapter and the two determinant milestones.
Angles are measured in turns, not radians. The empty convention is totalization
only; every arithmetic damping application assumes d > 0.
-/

/-- Circular discrepancy of a finite indexed population in angle coordinates. -/
def circleDiscrepancy {d : ℕ} (θ : Fin d → ℝ) : ℝ :=
  if d = 0 then 0 else
    sSup {v : ℝ | ∃ a ℓ : ℝ, ℓ ∈ Set.Icc 0 1 ∧
      v = |((Finset.univ.filter (fun i => Int.fract (θ i - a) < ℓ)).card : ℝ) /
        (d : ℝ) - ℓ|}

theorem circleDiscrepancy.bounds {d : ℕ} (hd : 0 < d) (θ : Fin d → ℝ) :
    1 / (d : ℝ) ≤ circleDiscrepancy θ ∧ circleDiscrepancy θ ≤ 1 := by
  sorry

theorem circleDiscrepancy.reindex {d : ℕ} (θ : Fin d → ℝ) (e : Fin d ≃ Fin d) :
    circleDiscrepancy (θ ∘ e) = circleDiscrepancy θ := by
  sorry

theorem circleDiscrepancy.rotation {d : ℕ} (θ : Fin d → ℝ) (a : ℝ) :
    circleDiscrepancy (fun i => θ i + a) = circleDiscrepancy θ := by
  sorry

example : circleDiscrepancy (fun _ : Fin 1 => (0 : ℝ)) = 1 := by
  sorry

example : circleDiscrepancy (fun i : Fin 2 => (i : ℝ) / 2) = 1 / 2 := by
  sorry

example : circleDiscrepancy (fun _ : Fin 3 => (1 / 7 : ℝ)) = 1 := by
  sorry

/-- AA.3: Fekete's extremal value; the reader specifies the full equality case. -/
theorem fekete_circle (d : ℕ) (hd : 0 < d) (z : Fin d → ℂ)
    (hz : ∀ i, ‖z i‖ = 1) :
    ‖(Matrix.vandermonde z).det‖ ≤ (d : ℝ) ^ ((d : ℝ) / 2) := by
  sorry

/-- AA.3: exponential loss for tuples a fixed positive discrepancy away from Haar. -/
theorem vandermonde_discrepancy_gap (ε : ℝ) (hε0 : 0 < ε) (hε1 : ε ≤ 1) :
    ∃ c : ℝ, 0 < c ∧ ∃ d₀ : ℕ, 0 < d₀ ∧ ∀ d : ℕ, d₀ ≤ d →
      ∀ θ : Fin d → ℝ, ε ≤ circleDiscrepancy θ →
      ‖(Matrix.vandermonde (fun i => circleMap 0 1 (2 * Real.pi * θ i))).det‖ <
        Real.exp (-c * (d : ℝ) ^ 2) := by
  sorry

/-! AA.4–AA.5: elementary data in the two source counterexamples.
H, W, V, their full APIs and the corrected field-rank theorems stay in the reader:
the meromorphic differential-module interfaces are supplied by other roadmaps.
-/

/-- AA.4: the scalar extension alone already contradicts the printed bound. -/
theorem scalar_span_counterexample :
    let p : RatFunc ℚ := RatFunc.X + RatFunc.X ^ 4 / 32
    Module.finrank (IntermediateField.adjoin ℚ {p}) (RatFunc ℚ) = 4 ∧
      Real.exp 1 * Real.log (5 / 2) / Real.log 2 < 4 := by
  sorry

/-- AA.5: the sampling disc can miss the growth at the distinguished origin. -/
theorem compact_capacity_counterexample :
    deriv (fun z : ℂ => 8 * z * Complex.exp (-20 * z)) 0 = 8 ∧
    0 < Real.log 8 + Real.log (1 / 4) ∧
    ∀ z : ℂ, z ∈ closedBall (1 / 2) (1 / 4) →
      ‖8 * z * Complex.exp (-20 * z)‖ < 1 := by
  sorry

end TauCeti.ArithmeticAlgebraization
