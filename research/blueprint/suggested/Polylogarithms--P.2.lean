/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/Polylogarithms--P.2.md is definitive. The statements
suggest Lean forms so that contributors and reviewers converge on names and
signatures. They claim no implementation; implementationStatus is unchecked.

BP-Polylogarithms--P.2, Codex — codex-1MIcru.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
Independent signature review: REV-Polylogarithms--P.2, Codex — codex-bnNBAm.

The eight inherited P.2 nodes and P.1's D are references, not new declarations.
The local notation D below expands the canonical P.1 weight-two integral formula:
Li_2(z) = -integral_0^1 log(1-tz)/t dt, with the native principal log. On the
positive cut this is its lower-half-plane boundary value. Thus this file does
not assume an arbitrary function satisfies the identities. It uses the precise
P.1 expression without inventing another polylogarithm namespace or carrier.

The ideal-tetrahedron theorem is deliberately unstated as a Lean signature:
GeometricTopology's metric/volume and the requested early Part II region and
boundary interface have no pinned carrier. Its analytic sector integral is
stated below. No generic type with an assumed volume substitutes for it.
Likewise the exact Borel/Suslin scalar remains a gap, not an axiom or a Prop field.

All APIs and tests of the four new definitions/constructions appear below.
Test names are in docstrings. Proof bodies are planning placeholders.
-/
import Mathlib.Analysis.SpecialFunctions.Integrability.LogMeromorphic
import Mathlib.Analysis.SpecialFunctions.Integrals.LogTrigonometric
import Mathlib.Analysis.SpecialFunctions.Complex.Arg
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.Analysis.Complex.Norm
import Mathlib.Analysis.PSeries
import Mathlib.Topology.UniformSpace.UniformConvergence
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.Data.Rat.Cast.Order

open MeasureTheory Filter
open scoped BigOperators Real Interval

namespace TauCeti.Polylog

local notation "D" => (fun z : ℂ =>
  Complex.im (-∫ t in (0 : ℝ)..1, Complex.log (1 - (t : ℂ) * z) / (t : ℂ)) +
    Complex.arg (1 - z) * Real.log ‖z‖)

/-- P.2/lobachevsky-function: Milnor's normalization. -/
noncomputable def lobachevsky (θ : ℝ) : ℝ :=
  -∫ t in (0 : ℝ)..θ, Real.log |2 * Real.sin t|

theorem lobachevsky_integrand_intervalIntegrable (a b : ℝ) :
    IntervalIntegrable (fun t => Real.log |2 * Real.sin t|) volume a b := by sorry

@[simp] theorem lobachevsky_zero : lobachevsky 0 = 0 := by sorry
@[simp] theorem lobachevsky_pi_div_two : lobachevsky (π / 2) = 0 := by sorry

theorem lobachevsky_neg (θ : ℝ) : lobachevsky (-θ) = -lobachevsky θ := by sorry

theorem lobachevsky_add_pi (θ : ℝ) : lobachevsky (θ + π) = lobachevsky θ := by sorry

theorem lobachevsky_continuous : Continuous lobachevsky := by sorry

theorem lobachevsky_hasDerivAt {θ : ℝ} (hθ : Real.sin θ ≠ 0) :
    HasDerivAt lobachevsky (-Real.log |2 * Real.sin θ|) θ := by sorry

theorem lobachevsky_integral_compat :
    lobachevsky π = -(∫ t in (0 : ℝ)..π, Real.log (Real.sin t)) - π * Real.log 2 ∧
      lobachevsky π = 0 := by sorry

/-- Test `lobachevsky_zero`. -/
example : lobachevsky 0 = 0 := by sorry
/-- Test `lobachevsky_half_period`. -/
example : lobachevsky (π / 2) = 0 := by sorry
/-- Test `lobachevsky_catalan_half`: distinguishes Lambda from Cl_2(2 theta). -/
example : lobachevsky (π / 4) =
    (1 / 2 : ℝ) * ∑' k : ℕ, (-1 : ℝ) ^ k / (2 * (k : ℝ) + 1) ^ 2 := by sorry
/-- Test `lobachevsky_native_integral`. -/
example : lobachevsky π = -(∫ t in (0 : ℝ)..π, Real.log (Real.sin t)) - π * Real.log 2 ∧
    lobachevsky π = 0 := by sorry

/-- P.2/lobachevsky-fourier: n begins at 1, and the convergence is uniform in theta. -/
theorem lobachevsky_fourier :
    (∀ θ : ℝ, Summable
      (fun k : ℕ => |Real.sin (2 * ((k + 1 : ℕ) : ℝ) * θ) /
        (2 * (((k + 1 : ℕ) : ℝ) ^ 2))|)) ∧
    (∀ θ : ℝ, HasSum
      (fun k : ℕ => Real.sin (2 * ((k + 1 : ℕ) : ℝ) * θ) /
        (2 * (((k + 1 : ℕ) : ℝ) ^ 2))) (lobachevsky θ)) ∧
    TendstoUniformly
      (fun N θ => ∑ k ∈ Finset.range N,
        Real.sin (2 * ((k + 1 : ℕ) : ℝ) * θ) / (2 * (((k + 1 : ℕ) : ℝ) ^ 2)))
      lobachevsky atTop := by sorry

/-- P.2/lobachevsky-duplication. -/
theorem lobachevsky_duplication (θ : ℝ) :
    lobachevsky (2 * θ) = 2 * lobachevsky θ + 2 * lobachevsky (θ + π / 2) := by sorry

/-- P.2/unit-circle-fourier, on the canonical P.1 expression. -/
theorem blochWigner_unit_fourier {w : ℂ} (hw : ‖w‖ = 1) :
    Summable (fun k : ℕ => |(w ^ (k + 1)).im / (((k + 1 : ℕ) : ℝ) ^ 2)|) ∧
    HasSum (fun k : ℕ => (w ^ (k + 1)).im / (((k + 1 : ℕ) : ℝ) ^ 2)) (D w) := by sorry

/-- P.2/unit-circle-fourier-tail; includes w = 1. -/
theorem blochWigner_unit_fourier_tail {w : ℂ} (hw : ‖w‖ = 1)
    {N : ℕ} (hN : 1 ≤ N) :
    |D w - ∑ k ∈ Finset.range N, (w ^ (k + 1)).im / (((k + 1 : ℕ) : ℝ) ^ 2)| ≤
      1 / (N : ℝ) := by sorry

/-- P.2/kummer-unit-reduction. No cut or half-plane restriction. -/
theorem blochWigner_kummer {z : ℂ} (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    let w₀ := z / starRingEnd ℂ z
    let w₁ := (1 / (1 - z)) / starRingEnd ℂ (1 / (1 - z))
    let w₂ := (1 - 1 / z) / starRingEnd ℂ (1 - 1 / z)
    (‖w₀‖ = 1 ∧ ‖w₁‖ = 1 ∧ ‖w₂‖ = 1) ∧
      D z = (D w₀ + D w₁ + D w₂) / 2 := by sorry

/-- P.2/rational-unit-shapes. All helpers are local rational formulas. -/
def rationalUnitShapes (z : ℚ × ℚ) : Fin 3 → ℚ × ℚ :=
  if z = (0, 0) ∨ z = (1, 0) then fun _ => (1, 0)
  else
    let ρ : ℚ → ℚ → ℚ × ℚ := fun x y =>
      ((x ^ 2 - y ^ 2) / (x ^ 2 + y ^ 2), 2 * x * y / (x ^ 2 + y ^ 2))
    let w₀ := ρ z.1 z.2
    let w₂ := ρ (z.1 - 1) z.2
    fun j => match j.val with
      | 0 => w₀
      | 1 => ρ (1 - z.1) z.2
      | _ => (w₂.1 * w₀.1 + w₂.2 * w₀.2, -w₂.1 * w₀.2 + w₂.2 * w₀.1)

local notation "ι" => (fun z : ℚ × ℚ => ((((Prod.fst z) : ℚ) : ℂ) + (((Prod.snd z) : ℚ) : ℂ) * Complex.I))

@[simp] theorem rationalUnitShapes_zero (j : Fin 3) :
    rationalUnitShapes (0, 0) j = (1, 0) := by sorry
@[simp] theorem rationalUnitShapes_one (j : Fin 3) :
    rationalUnitShapes (1, 0) j = (1, 0) := by sorry

theorem rationalUnitShapes_conj (a b : ℚ) (j : Fin 3) :
    rationalUnitShapes (a, -b) j =
      ((rationalUnitShapes (a, b) j).1, -(rationalUnitShapes (a, b) j).2) := by sorry

theorem rationalUnitShapes_real (a : ℚ) (j : Fin 3) :
    rationalUnitShapes (a, 0) j = (1, 0) := by sorry

/-- P.2/rational-unit-shapes-correct; promoted compatibility API. -/
theorem rationalUnitShapes_correct {q : ℚ × ℚ} (h0 : q ≠ (0, 0)) (h1 : q ≠ (1, 0)) :
    (∀ j : Fin 3, ‖ι (rationalUnitShapes q j)‖ = 1) ∧
    (∀ j : Fin 3, ι (rationalUnitShapes q j) =
      match j.val with
      | 0 => ι q / starRingEnd ℂ (ι q)
      | 1 => (1 / (1 - ι q)) / starRingEnd ℂ (1 / (1 - ι q))
      | _ => (1 - 1 / ι q) / starRingEnd ℂ (1 - 1 / ι q)) := by sorry

/-- Test `unit_shapes_i`. -/
example : rationalUnitShapes (0, 1) 0 = (-1, 0) ∧
    rationalUnitShapes (0, 1) 1 = (0, 1) ∧ rationalUnitShapes (0, 1) 2 = (0, 1) := by sorry
/-- Test `unit_shapes_exceptional`. -/
example (j : Fin 3) : rationalUnitShapes (0, 0) j = (1, 0) ∧
    rationalUnitShapes (1, 0) j = (1, 0) := by sorry
/-- Test `unit_shapes_real_two`. -/
example (j : Fin 3) : rationalUnitShapes (2, 0) j = (1, 0) := by sorry
/-- Test `unit_shapes_native_norm`. -/
example {q : ℚ × ℚ} (h0 : q ≠ (0, 0)) (h1 : q ≠ (1, 0)) (j : Fin 3) :
    ‖ι (rationalUnitShapes q j)‖ = 1 := by sorry

/-- P.2/rational-fourier-sum. The recurrence computes genuine rational powers. -/
def rationalFourierSum (w : ℚ × ℚ) (N : ℕ) : ℚ :=
  let power : ℕ → ℚ × ℚ := fun n =>
    Nat.rec (1, 0) (fun _ q => (q.1 * w.1 - q.2 * w.2, q.1 * w.2 + q.2 * w.1)) n
  ∑ k ∈ Finset.range N, (power (k + 1)).2 / (((k + 1 : ℕ) : ℚ) ^ 2)

@[simp] theorem rationalFourierSum_zero (w : ℚ × ℚ) : rationalFourierSum w 0 = 0 := by sorry
@[simp] theorem rationalFourierSum_one (N : ℕ) : rationalFourierSum (1, 0) N = 0 := by sorry

theorem rationalFourierSum_conj (a b : ℚ) (N : ℕ) :
    rationalFourierSum (a, -b) N = -rationalFourierSum (a, b) N := by sorry

theorem rationalFourierSum_succ (w : ℚ × ℚ) (N : ℕ) :
    (rationalFourierSum w (N + 1) : ℝ) = (rationalFourierSum w N : ℝ) +
      (ι w ^ (N + 1)).im / (((N + 1 : ℕ) : ℝ) ^ 2) := by sorry

/-- P.2/rational-fourier-compatibility; promoted API. -/
theorem rationalFourierSum_coe (w : ℚ × ℚ) (N : ℕ) :
    (rationalFourierSum w N : ℝ) =
      ∑ k ∈ Finset.range N, (ι w ^ (k + 1)).im / (((k + 1 : ℕ) : ℝ) ^ 2) := by sorry

/-- Test `fourier_sum_i_three`. -/
example : rationalFourierSum (0, 1) 3 = 8 / 9 := by sorry
/-- Test `fourier_sum_empty`. -/
example : rationalFourierSum (2, 3) 0 = 0 := by sorry
/-- Test `fourier_sum_one`. -/
example : rationalFourierSum (1, 0) 7 = 0 := by sorry
/-- Test `fourier_sum_native_powers`. -/
example (w : ℚ × ℚ) (N : ℕ) : (rationalFourierSum w N : ℝ) =
    ∑ k ∈ Finset.range N, (ι w ^ (k + 1)).im / (((k + 1 : ℕ) : ℝ) ^ 2) := by sorry

/-- P.2/rational-fourier-approximation; 3*2^p terms per circle. -/
def blochWignerFourierApprox (z : ℚ × ℚ) (p : ℕ) : ℚ :=
  (∑ j : Fin 3, rationalFourierSum (rationalUnitShapes z j) (3 * 2 ^ p)) / 2

theorem blochWignerFourierApprox_formula (z : ℚ × ℚ) (p : ℕ) :
    blochWignerFourierApprox z p =
      (∑ j : Fin 3, rationalFourierSum (rationalUnitShapes z j) (3 * 2 ^ p)) / 2 := by sorry

@[simp] theorem blochWignerFourierApprox_zero (p : ℕ) :
    blochWignerFourierApprox (0, 0) p = 0 := by sorry
@[simp] theorem blochWignerFourierApprox_one (p : ℕ) :
    blochWignerFourierApprox (1, 0) p = 0 := by sorry

theorem blochWignerFourierApprox_real (a : ℚ) (p : ℕ) :
    blochWignerFourierApprox (a, 0) p = 0 := by sorry

theorem blochWignerFourierApprox_conj (a b : ℚ) (p : ℕ) :
    blochWignerFourierApprox (a, -b) p = -blochWignerFourierApprox (a, b) p := by sorry

/-- P.2/rational-fourier-error; promoted compatibility API with the stronger bound. -/
theorem blochWignerFourierApprox_error {z : ℚ × ℚ}
    (h0 : z ≠ (0, 0)) (h1 : z ≠ (1, 0)) (p : ℕ) :
    |(blochWignerFourierApprox z p : ℝ) - D (ι z)| ≤ 1 / (2 * (2 : ℝ) ^ p) ∧
    |(blochWignerFourierApprox z p : ℝ) - D (ι z)| ≤ 1 / (2 : ℝ) ^ p := by sorry

/-- Strict sign consequence, never merely a nonzero numerical output. -/
theorem blochWignerFourierApprox_pos {z : ℚ × ℚ}
    (h0 : z ≠ (0, 0)) (h1 : z ≠ (1, 0)) (p : ℕ)
    (h : (1 : ℚ) / 2 ^ p < blochWignerFourierApprox z p) : 0 < D (ι z) := by sorry

theorem blochWignerFourierApprox_neg {z : ℚ × ℚ}
    (h0 : z ≠ (0, 0)) (h1 : z ≠ (1, 0)) (p : ℕ)
    (h : blochWignerFourierApprox z p < -(1 : ℚ) / 2 ^ p) : D (ι z) < 0 := by sorry

theorem blochWignerFourierApprox_ne_zero {z : ℚ × ℚ}
    (h0 : z ≠ (0, 0)) (h1 : z ≠ (1, 0)) (p : ℕ)
    (h : (1 : ℚ) / 2 ^ p < |blochWignerFourierApprox z p|) : D (ι z) ≠ 0 := by sorry

/-- Finite sums carry weighted error radii; Bloch boundary membership is a separate supplier. -/
theorem blochWignerFourierApprox_sum_error {I : Type*} (s : Finset I)
    (z : I → ℚ × ℚ) (n : I → ℤ) (p : I → ℕ)
    (h0 : ∀ i ∈ s, z i ≠ (0, 0)) (h1 : ∀ i ∈ s, z i ≠ (1, 0)) :
    |(∑ i ∈ s, (n i : ℝ) * (blochWignerFourierApprox (z i) (p i) : ℝ)) -
      ∑ i ∈ s, (n i : ℝ) * D (ι (z i))| ≤
        ∑ i ∈ s, |(n i : ℝ)| / (2 : ℝ) ^ p i := by sorry

/-- Test `approx_i_precision_zero`. -/
example : blochWignerFourierApprox (0, 1) 0 = 8 / 9 := by sorry
/-- Test `approx_i_precision_one`. -/
example : blochWignerFourierApprox (0, 1) 1 = 209 / 225 := by sorry
/-- Test `approx_exceptional`. -/
example (p : ℕ) : blochWignerFourierApprox (0, 0) p = 0 ∧
    blochWignerFourierApprox (1, 0) p = 0 := by sorry
/-- Test `approx_real_two`. -/
example (p : ℕ) : blochWignerFourierApprox (2, 0) p = 0 := by sorry
/-- Test `approx_conjugate`. -/
example : blochWignerFourierApprox (0, -1) 0 = -8 / 9 := by sorry

-- idealTetrahedron_volume_eq_lobachevsky: not stated; requires the canonical
-- curvature -1 metric/volume from GeometricTopology layers 7–8 and early Part II
-- ideal boundary, measurable tetrahedron regions and ordered orientation.
-- The inherited idealTetrahedron_volume_eq_blochWigner uses the same supplier.

/-- Analytic sector integral in the proof of P.2/milnor-angle-volume. -/
theorem milnor_sector_integral {a : ℝ} (ha : 0 < a) (ha' : a < π / 2) :
    (∫ x in (0 : ℝ)..Real.cos a,
      ∫ y in (0 : ℝ)..(x * Real.tan a), 1 / (2 * (1 - x ^ 2 - y ^ 2))) =
        lobachevsky a / 2 := by sorry

/-- P.2/goncharov-elementary-calibration. Here e12,e21,e22 use indices 0,1. -/
theorem goncharov_weightTwo_elementaryCalibration :
    let X : Matrix (Fin 2) (Fin 2) ℂ := fun i j => if i = 0 ∧ j = 1 then 1 else 0
    let Y : Matrix (Fin 2) (Fin 2) ℂ := fun i j => if i = 1 ∧ j = 0 then 1 else 0
    let Z : Matrix (Fin 2) (Fin 2) ℂ := fun i j => if i = 1 ∧ j = 1 then 1 else 0
    let alt := Matrix.trace (X * Y * Z) + Matrix.trace (Y * Z * X) +
      Matrix.trace (Z * X * Y) - Matrix.trace (X * Z * Y) -
      Matrix.trace (Z * Y * X) - Matrix.trace (Y * X * Z)
    alt = -3 ∧ (1 / 2 : ℂ) * alt = -3 / 2 ∧ (-1 / 6 : ℂ) * alt = 1 / 2 := by sorry

-- Exact borel-comparison: not stated. Recompute the failed source calibration,
-- compare beta_DR with AF.1a and R.4's Burgos class, divide by the fixed Tate
-- generator 2*pi*i, and compare the natural V.4 Suslin/Hurewicz maps.
-- R.7/weight-two-bloch-wigner is a consumer of this P.2 result, not a premise.

end TauCeti.Polylog
