/-
P-adic Hodge theory and geometric comparison: statements on existing carriers.

The full target list, definition APIs, tests and source locators are in
../readmes/PadicHodgeTheory--P7.md. This companion deliberately states only
milestones expressible at the pins. It neither constructs the missing analytic
rings, Galois representations, period sheaves nor their categories.

Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174
Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369

The two light definitions below are formulas on coefficient families, not an
analytic annulus ring. Their convergence hypotheses are essential when using
a real supremum. All planned proofs are sorry; the definitions have real bodies.
-/

import Mathlib.Topology.Algebra.InfiniteSum.DiscreteConvolution
import Mathlib.Topology.MetricSpace.Ultra.Basic
import Mathlib.Analysis.Normed.Field.Basic
import Mathlib.NumberTheory.Padics.Complex
import Mathlib.RingTheory.Perfectoid.BDeRham
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import TauCeti.RingTheory.Huber.Restricted.TwoSidedSeries.Convolution

noncomputable section

open Filter
open scoped Topology DiscreteConvolution

namespace TauCeti.PadicHodge

section AnalyticCoefficients

variable {K : Type*} [NormedField K]

/-- The coefficient convergence condition for analytic Laurent series on I. -/
def laurentConvergesOn (I : Set ℝ) (a : ℤ → K) : Prop :=
  ∀ ρ ∈ I, Tendsto (fun n : ℤ => ‖a n‖ * ρ ^ n) cofinite (𝓝 0)

/-- The real Gauss supremum; its norm properties require convergence and ρ > 0. -/
def gaussNorm (ρ : ℝ) (a : ℤ → K) : ℝ := ⨆ n : ℤ, ‖a n‖ * ρ ^ n

/-- Annulus-foundations/gauss-norm: Cauchy's coefficient bound. -/
theorem norm_coeff_mul_le_gaussNorm {I : Set ℝ} {a : ℤ → K}
    (ha : laurentConvergesOn I a) {ρ : ℝ} (hρ : 0 < ρ) (hρI : ρ ∈ I) (n : ℤ) :
    ‖a n‖ * ρ ^ n ≤ gaussNorm ρ a := by
  sorry

/-- Annulus-foundations/gauss-norm: definiteness on convergent coefficients. -/
theorem gaussNorm_eq_zero_iff {I : Set ℝ} {a : ℤ → K}
    (ha : laurentConvergesOn I a) {ρ : ℝ} (hρ : 0 < ρ) (hρI : ρ ∈ I) :
    gaussNorm ρ a = 0 ↔ a = 0 := by
  sorry

/-- Compatibility with the existing two-sided restricted-series submodule at radius one. -/
theorem laurentConvergesOn_singleton_one (a : ℤ → K) :
    laurentConvergesOn {1} a ↔ a ∈ TauCeti.Huber.twoSidedRestrictedSubmodule K K := by
  sorry

/-- Test: finite Laurent support converges on every set of positive radii. -/
example (I : Set ℝ) (m : ℤ) (c : K) :
    laurentConvergesOn I (fun n => if n = m then c else 0) := by
  sorry

/-- Test: geometric series converges strictly inside the unit circle. -/
example {ρ : ℝ} (hρ : 0 < ρ) (hρ1 : ρ < 1) :
    laurentConvergesOn {ρ} (fun n : ℤ => if 0 ≤ n then (1 : K) else 0) := by
  sorry

/-- Test: the same coefficients fail the unit-circle convergence condition. -/
example : ¬ laurentConvergesOn {1} (fun n : ℤ => if 0 ≤ n then (1 : K) else 0) := by
  sorry

/-- Test gaussNorm.test_one_add_T. -/
example {ρ : ℝ} (hρ : 0 < ρ) :
    gaussNorm ρ (fun n : ℤ => if n = 0 ∨ n = 1 then (1 : K) else 0) = max 1 ρ := by
  sorry

/-- Test gaussNorm.test_constant. -/
example {ρ : ℝ} (hρ : 0 < ρ) (c : K) :
    gaussNorm ρ (fun n : ℤ => if n = 0 then c else 0) = ‖c‖ := by
  sorry

/-- Test gaussNorm.test_not_pointwise: vanishing at T = c does not kill the norm. -/
example (c : K) (hc : c ≠ 0) :
    gaussNorm ‖c‖ (fun n : ℤ => if n = 0 then c else if n = 1 then -1 else 0) = ‖c‖ := by
  sorry

variable [CompleteSpace K] [IsUltrametricDist K]

/-- Annulus-foundations/multiplication: convergence of the genuine discrete convolution. -/
theorem laurentConvergesOn_convolution {I : Set ℝ} (hI : ∀ ρ ∈ I, 0 < ρ)
    {a b : ℤ → K} (ha : laurentConvergesOn I a) (hb : laurentConvergesOn I b) :
    laurentConvergesOn I (a ⋆ᵣ₊ b) := by
  sorry

/-- Annulus-foundations/gauss-norm-multiplicative. -/
theorem gaussNorm_convolution {I : Set ℝ} {a b : ℤ → K}
    (ha : laurentConvergesOn I a) (hb : laurentConvergesOn I b)
    {ρ : ℝ} (hρ : 0 < ρ) (hρI : ρ ∈ I) :
    gaussNorm ρ (a ⋆ᵣ₊ b) = gaussNorm ρ a * gaussNorm ρ b := by
  sorry

end AnalyticCoefficients

section GeometricPeriodRing

variable (p : ℕ) [Fact p.Prime]

/-- R06.1/cp-integers-p-adically-complete, nonunit assertion. -/
theorem cpIntegers_p_not_unit : ¬ IsUnit (p : PadicComplexInt p) := by
  sorry

/-- R06.1/cp-integers-p-adically-complete, completeness assertion. -/
theorem cpIntegers_complete :
    IsAdicComplete (Ideal.span {(p : PadicComplexInt p)}) (PadicComplexInt p) := by
  sorry

/-- R06.1/cp-integers-p-adically-complete, Frobenius assertion. -/
theorem cpIntegers_frobenius_surjective : Function.Surjective
    (fun x : (PadicComplexInt p) ⧸ Ideal.span {(p : PadicComplexInt p)} => x ^ p) := by
  sorry

-- Instances are explicit hypotheses here: no instance is manufactured with a sorry body.
variable [Fact (¬ IsUnit (p : PadicComplexInt p))]
    [IsAdicComplete (Ideal.span {(p : PadicComplexInt p)}) (PadicComplexInt p)]

/-- R06.1/bdr-plus-complete-dvr at C_p, on Mathlib's actual period-ring carrier.
The reader states the full theorem for arbitrary algebraically closed complete C. -/
theorem bdrPlus_complete_dvr :
    ∃ h : IsDomain (BDeRhamPlus (PadicComplexInt p) p),
      @IsDiscreteValuationRing (BDeRhamPlus (PadicComplexInt p) p) inferInstance h := by
  sorry

/-- R06.1/de-rham-period-ring: the completed theta map is surjective. -/
theorem bdrPlus_exists_theta :
    ∃ θ : BDeRhamPlus (PadicComplexInt p) p →+* PadicComplex p,
      Function.Surjective θ := by
  sorry

end GeometricPeriodRing

-- P7: the ramified field-of-norms carriers, Sen module, D_dif and B-pair category
-- are README constructions. Their proofs cannot be stated by replacing them
-- with arbitrary vector spaces, formal LaurentSeries or unstructured functions.
-- P8: corrected structural period sheaves, primitive comparisons, local systems
-- and the pro-etale Poincare lemma require the requested sites and sheaf carriers.
-- R06.2--R06.4: period functors, weak admissibility, Colmez--Fontaine, the
-- monodromy bridge, Weil--Deligne recipe and ordinary criteria remain full reader
-- targets until the Galois and filtered-module carriers exist at the pins.

end TauCeti.PadicHodge
