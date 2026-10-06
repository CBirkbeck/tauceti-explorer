/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/Polylogarithms--P.6.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers converge on names and
signatures. They claim no implementation.

BP-Polylogarithms--P.6, Codex — codex-Omyv0N.
Independent review: REV-Polylogarithms--P.6, Codex — codex-PaORFX.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The three function signatures below reproduce supplier objects already planned
in the accepted base Polylogarithms packet. They are not new definitions in this
follow-up. On assembly import those declarations instead of these prototypes.
`polylog` has the principal branch and lower-side cut convention specified in
P.1/classical-polylogarithm; its implementation is not supplied here.

The shared strong-Leopoldt statement/map/defect is owned by IntegralIwasawaTheory
I.2. P.6's existing regulator matrix and equivalence remain in the base suggested
file; their completed-unit comparison cannot be stated against an invented
carrier. This file introduces no substitute proposition or assumed typeclass.
-/
import Mathlib.Analysis.Calculus.FDeriv.Basic
import Mathlib.Analysis.SpecialFunctions.Complex.LogDeriv
import Mathlib.NumberTheory.Bernoulli

noncomputable section

open Complex

namespace TauCeti.Polylog

/-- Supplier prototype: Polylogarithms:P.1/classical-polylogarithm. -/
def polylog (n : ℤ) (z : ℂ) : ℂ := sorry

/-- Supplier prototype: Polylogarithms:P.1/single-valued-polylogarithm.
The parity projection is inlined to avoid another supplier declaration. -/
def singleValuedPolylog (n : ℕ) (z : ℂ) : ℝ :=
  let s := ∑ k ∈ Finset.range n,
    ((2 ^ k * bernoulli k / k.factorial : ℚ) : ℂ) * polylog ((n - k : ℕ) : ℤ) z *
      (Real.log ‖z‖ : ℂ) ^ k
  if Odd n then s.re else s.im

/-- Supplier prototype: Polylogarithms:P.1/bloch-wigner-dilogarithm. -/
def blochWigner (z : ℂ) : ℝ :=
  (polylog 2 z).im + Complex.arg (1 - z) * Real.log ‖z‖

/-- P.6/single-valued-trilogarithm-differential, promoted API of P.1's `L_n`.
The differentiability conjunct is essential: `fderiv` alone is totalised.
`Im (v/z)` denotes the smooth angular one-form, including on the cut. -/
theorem singleValuedPolylog_three_differential {z : ℂ} (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    DifferentiableAt ℝ (singleValuedPolylog 3) z ∧
      ∀ v : ℂ, fderiv ℝ (singleValuedPolylog 3) z v =
        -blochWigner z * (v / z).im +
          (Real.log ‖z‖ / 3) *
            (Real.log ‖1 - z‖ * (v / z).re - Real.log ‖z‖ * (v / (z - 1)).re) := by
  sorry

/-- Test `trilog_diff_half`: the coefficient detects the Bernoulli normalisation. -/
example : DifferentiableAt ℝ (singleValuedPolylog 3) (1 / 2 : ℂ) ∧
    ∀ v : ℂ, fderiv ℝ (singleValuedPolylog 3) (1 / 2 : ℂ) v =
      (4 / 3 : ℝ) * (Real.log 2) ^ 2 * v.re := by
  sorry

/-- Test `trilog_diff_on_cut`: the principal cut does not restrict the theorem. -/
example : DifferentiableAt ℝ (singleValuedPolylog 3) (2 : ℂ) ∧
    ∀ v : ℂ, fderiv ℝ (singleValuedPolylog 3) (2 : ℂ) v =
      -(1 / 3 : ℝ) * (Real.log 2) ^ 2 * v.re := by
  sorry

/-- Test `trilog_diff_minus_one`: a zero derivative at a regular point. -/
example : DifferentiableAt ℝ (singleValuedPolylog 3) (-1 : ℂ) ∧
    fderiv ℝ (singleValuedPolylog 3) (-1 : ℂ) = 0 := by
  sorry

/-- Test `trilog_diff_unit_circle`: radial zero and the signed angular derivative. -/
example {z : ℂ} (hz : ‖z‖ = 1) (hz1 : z ≠ 1) :
    DifferentiableAt ℝ (singleValuedPolylog 3) z ∧
      fderiv ℝ (singleValuedPolylog 3) z z = 0 ∧
        fderiv ℝ (singleValuedPolylog 3) z (I * z) = -blochWigner z := by
  sorry

/-- Test `trilog_diff_i_sign`: `D(i)>0` imports the separate
P.1/bloch-wigner-positivity lemma. Its existing minimum-principle proof input
is recorded as an inherited gap in the packet; the derivative equalities
themselves do not require positivity. -/
example : DifferentiableAt ℝ (singleValuedPolylog 3) I ∧
    fderiv ℝ (singleValuedPolylog 3) I (-1) = -blochWigner I ∧
      fderiv ℝ (singleValuedPolylog 3) I (-1) < 0 ∧
        fderiv ℝ (singleValuedPolylog 3) I I = 0 := by
  sorry

end TauCeti.Polylog
