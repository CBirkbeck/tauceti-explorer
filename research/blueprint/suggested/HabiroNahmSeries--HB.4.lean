import Mathlib.Analysis.SpecialFunctions.Log.Summable
import Mathlib.NumberTheory.ModularForms.DedekindEta
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.Analysis.Fourier.PoissonSummation
import Mathlib.Analysis.Matrix.PosDef
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.Asymptotics.Defs
import Mathlib.FieldTheory.IntermediateField.Adjoin.Defs
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.Algebra.MvPolynomial.Degrees
import Mathlib.MeasureTheory.Constructions.Pi
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.NumberTheory.BernoulliPolynomials

/-!
This file is not the roadmap and is not exhaustive. The definitive document is
research/blueprint/readmes/HabiroNahmSeries--HB.4.md. These statements suggest
Lean forms so that contributors and reviewers converge on names and signatures.
The admitted statements are planning placeholders; no implementation is claimed.

The accepted parent HB.4 declarations are imported mathematically by immutable
node id. Its q-symbol, Nahm-function and classical-polylogarithm definitions have
no compiled module at the pins. The explicit expressions in `Expressions` below
are notation adapters for those interfaces, not additional roadmap definitions.
The coherent fields are the one new construction of this continuation.

The formal Gaussian/psi series, Bloch and near-unit interfaces also have no
compiled types at the pins. Their exact target statements are recorded at the
end, without substitute structures or proposition-valued fields. The analytic
existence prototype does not claim that these arithmetic interfaces are proved.
-/

noncomputable section
open scoped BigOperators Topology
open Filter Asymptotics MeasureTheory

namespace TauCeti.Nahm.Radial

variable {N : ℕ}

namespace Expressions

-- Parent HB.4/q-pochhammer-symbols, finite quantum factorial convention.
def qFinite (q : ℂ) (n : ℕ) : ℂ := ∏ j ∈ Finset.range n, (1 - q ^ (j + 1))

def quadratic (A : Matrix (Fin N) (Fin N) ℝ) (x : Fin N → ℝ) : ℝ :=
  ∑ i, ∑ j, x i * A i j * x j

-- Parent HB.4/analytic-nahm-sum, restricted to real data for estimates.
def Qreal (A : Matrix (Fin N) (Fin N) ℝ) (B : Fin N → ℝ) (C : ℝ)
    (n : Fin N → ℕ) : ℝ :=
  quadratic A (fun i ↦ (n i : ℝ)) / 2 + (∑ i, B i * n i) + C

def phaseFreeTerm (A : Matrix (Fin N) (Fin N) ℝ) (B : Fin N → ℝ)
    (C : ℝ) (ζ : ℂ) (m : ℕ) (ε : ℝ) (n : Fin N → ℕ) : ℂ :=
  (Real.exp (-ε * Qreal A B C n / m) : ℂ) /
    ∏ i, qFinite (ζ * (Real.exp (-ε / m) : ℂ)) (n i)

def nahmFunction (A : Matrix (Fin N) (Fin N) ℝ) (B : Fin N → ℝ)
    (C : ℝ) (τ : ℂ) : ℂ :=
  ∑' n : Fin N → ℕ,
    Complex.exp (2 * Real.pi * Complex.I * τ * (Qreal A B C n : ℂ)) /
      ∏ i, qFinite (Complex.exp (2 * Real.pi * Complex.I * τ)) (n i)

-- Polylogarithms:P.1/classical-polylogarithm, real value on [0,1].
def li2Real (x : ℝ) : ℝ := ∑' k : ℕ, x ^ (k + 1) / (k + 1 : ℝ) ^ 2

def growth (z : Fin N → ℝ) : ℝ :=
  N * Real.pi ^ 2 / 6 - (∑ i, li2Real (z i)) -
    (∑ i, Real.log (z i) * Real.log (1 - z i)) / 2

def hessian (A : Matrix (Fin N) (Fin N) ℝ) (z : Fin N → ℝ) :
    Matrix (Fin N) (Fin N) ℝ :=
  A + Matrix.diagonal (fun i ↦ z i / (1 - z i))

def deviation (z : Fin N → ℝ) (ε : ℝ) (n : Fin N → ℕ) (i : Fin N) : ℝ :=
  Real.sqrt ε * ((n i : ℝ) + Real.log (z i) / ε)

def sqSize (x : Fin N → ℝ) : ℝ := ∑ i, x i ^ 2

-- Parent Bernoulli/polylogarithm log-product interface, explicit finite truncation.
def liSeries (r : ℤ) (w : ℂ) : ℂ :=
  ∑' l : ℕ, w ^ (l + 1) * (l + 1 : ℂ) ^ (-r)

def logProduct (ζ : ℂ) (m : ℕ) (w : ℂ) (ν ε : ℝ) : ℂ :=
  ∑' j : ℕ, Complex.log (1 - ζ ^ (j + 1) * w *
    (Real.exp (-((j + 1 : ℝ) + ν) * ε / m) : ℂ))

def bernoulliTrunc (ζ : ℂ) (m : ℕ) (w : ℂ) (ν ε : ℝ) (J : ℕ) : ℂ :=
  - ∑ r ∈ Finset.range (J + 1), ∑ t ∈ Finset.range m,
    (Polynomial.bernoulli r).eval₂ (algebraMap ℚ ℂ)
        (1 - (((t + 1 : ℕ) : ℂ) + (ν : ℂ)) / (m : ℂ)) *
      liSeries (2 - (r : ℤ)) (ζ ^ (t + 1) * w) *
      (ε : ℂ) ^ ((r : ℤ) - 1) / (r.factorial : ℂ)

end Expressions

open Expressions

/-- New construction: coherent coefficient base Q(z_i^(1/d),ζ). -/
def radialBaseField (d : ℕ) (z : Fin N → ℝ) (ζ : ℂ) : IntermediateField ℚ ℂ := by
  sorry

/-- New construction: Q(z_i^(1/d),ζ,z_i^(1/(dm))). -/
def radialKummerField (d m : ℕ) (z : Fin N → ℝ) (ζ : ℂ) :
    IntermediateField ℚ ℂ := by
  sorry

-- These characterizations pin the construction to the existing field API.
lemma radialBaseField_eq_adjoin (d : ℕ) (z : Fin N → ℝ) (ζ : ℂ) :
    radialBaseField d z ζ = IntermediateField.adjoin ℚ
      (Set.range (fun i ↦ (Real.rpow (z i) (1 / (d : ℝ)) : ℂ)) ∪ {ζ}) := by
  sorry

lemma radialKummerField_eq_adjoin (d m : ℕ) (z : Fin N → ℝ) (ζ : ℂ) :
    radialKummerField d m z ζ = IntermediateField.adjoin ℚ
      (Set.range (fun i ↦ (Real.rpow (z i) (1 / (d : ℝ)) : ℂ)) ∪ {ζ} ∪
        Set.range (fun i ↦ (Real.rpow (z i) (1 / ((d * m : ℕ) : ℝ)) : ℂ))) := by
  sorry

-- The projection and compatibility part of the packet API.
lemma radialBaseField.root_mem (d : ℕ) (z : Fin N → ℝ) (ζ : ℂ) :
    (∀ i, (Real.rpow (z i) (1 / (d : ℝ)) : ℂ) ∈ radialBaseField d z ζ) ∧
      ζ ∈ radialBaseField d z ζ := by
  sorry

lemma radialKummerField.base_le (d m : ℕ) (z : Fin N → ℝ) (ζ : ℂ) :
    radialBaseField d z ζ ≤ radialKummerField d m z ζ := by
  sorry

lemma radialKummerField.radical_mem (d m : ℕ) (z : Fin N → ℝ) (ζ : ℂ) (i : Fin N) :
    (Real.rpow (z i) (1 / ((d * m : ℕ) : ℝ)) : ℂ) ∈
      radialKummerField d m z ζ := by
  sorry

lemma radialKummerField.theta_mem (d m : ℕ) (hd : 0 < d) (hm : 0 < m)
    (z : Fin N → ℝ) (hz : ∀ i, 0 < z i) (ζ : ℂ) (i : Fin N) :
    (Real.rpow (z i) (1 / (m : ℝ)) : ℂ) ∈ radialKummerField d m z ζ := by
  sorry

lemma radialKummerField.eq_theta_adjoin (d m : ℕ) (hd : 0 < d) (hm : 0 < m)
    (hcop : Nat.Coprime d m) (z : Fin N → ℝ) (hz : ∀ i, 0 < z i) (ζ : ℂ) :
    radialKummerField d m z ζ = IntermediateField.adjoin ℚ
      (Set.range (fun i ↦ (Real.rpow (z i) (1 / (d : ℝ)) : ℂ)) ∪ {ζ} ∪
        Set.range (fun i ↦ (Real.rpow (z i) (1 / (m : ℝ)) : ℂ))) := by
  sorry

-- Minimality permits using the fields without unfolding either construction.
lemma radialBaseField_le_iff (d : ℕ) (z : Fin N → ℝ) (ζ : ℂ)
    (L : IntermediateField ℚ ℂ) :
    radialBaseField d z ζ ≤ L ↔
      (∀ i, (Real.rpow (z i) (1 / (d : ℝ)) : ℂ) ∈ L) ∧ ζ ∈ L := by
  sorry

lemma radialKummerField_le_iff (d m : ℕ) (z : Fin N → ℝ) (ζ : ℂ)
    (L : IntermediateField ℚ ℂ) :
    radialKummerField d m z ζ ≤ L ↔ radialBaseField d z ζ ≤ L ∧
      ∀ i, (Real.rpow (z i) (1 / ((d * m : ℕ) : ℝ)) : ℂ) ∈ L := by
  sorry

lemma radialKummerField.radical_pow (d m : ℕ) (hd : 0 < d) (hm : 0 < m)
    (z : Fin N → ℝ) (hz : ∀ i, 0 < z i) (i : Fin N) :
    (Real.rpow (z i) (1 / ((d * m : ℕ) : ℝ)) : ℂ) ^ m =
        (Real.rpow (z i) (1 / (d : ℝ)) : ℂ) ∧
      (Real.rpow (z i) (1 / ((d * m : ℕ) : ℝ)) : ℂ) ^ d =
        (Real.rpow (z i) (1 / (m : ℝ)) : ℂ) := by
  sorry

lemma radialKummerField.finite_galois (d m : ℕ) (hd : 0 < d) (hm : 0 < m)
    (z : Fin N → ℝ) (hz : ∀ i, 0 < z i) (ζ : ℂ) (hζ : IsPrimitiveRoot ζ m) :
    let E := radialBaseField d z ζ
    let H := radialKummerField d m z ζ
    letI : Algebra E H :=
      (IntermediateField.inclusion (radialKummerField.base_le d m z ζ)).toRingHom.toAlgebra
    FiniteDimensional E H ∧ IsGalois E H := by
  sorry

lemma radialKummerField.automorphism_radical (d m : ℕ) (hd : 0 < d) (hm : 0 < m)
    (z : Fin N → ℝ) (hz : ∀ i, 0 < z i) (ζ : ℂ) (hζ : IsPrimitiveRoot ζ m)
    (σ : radialKummerField d m z ζ ≃+* radialKummerField d m z ζ)
    (hfix : ∀ x : radialKummerField d m z ζ,
      (x : ℂ) ∈ radialBaseField d z ζ → σ x = x) :
    ∀ (i : Fin N) (x : radialKummerField d m z ζ),
      (x : ℂ) = (Real.rpow (z i) (1 / ((d * m : ℕ) : ℝ)) : ℂ) →
      ∃ s : Fin m, (σ x : ℂ) = ζ ^ (s : ℕ) * (x : ℂ) := by
  sorry

-- radialFields_order_one (degenerate).
example (d : ℕ) (hd : 0 < d) (z : Fin N → ℝ) :
    radialKummerField d 1 z 1 = radialBaseField d z 1 := by
  sorry

-- radialFields_integral_case (compatibility).
example (z : Fin N → ℝ) :
    radialBaseField 1 z 1 = IntermediateField.adjoin ℚ
      (Set.range (fun i ↦ (z i : ℂ))) ∧
    radialKummerField 1 1 z 1 = IntermediateField.adjoin ℚ
      (Set.range (fun i ↦ (z i : ℂ))) := by
  sorry

-- radialFields_trivial_coordinates (computation).
example (d m : ℕ) (hd : 0 < d) (hm : 0 < m) (ζ : ℂ) :
    radialBaseField d (fun _ : Fin N ↦ 1) ζ = IntermediateField.adjoin ℚ {ζ} ∧
    radialKummerField d m (fun _ : Fin N ↦ 1) ζ = IntermediateField.adjoin ℚ {ζ} := by
  sorry

-- radialFields_nontrivial_radical (non-example).
example :
    radialBaseField 2 (fun _ : Fin 1 ↦ (1 / 4 : ℝ))
        (Complex.exp (2 * Real.pi * Complex.I / 3)) <
      radialKummerField 2 3 (fun _ : Fin 1 ↦ (1 / 4 : ℝ))
        (Complex.exp (2 * Real.pi * Complex.I / 3)) := by
  sorry

-- analytic-convergence-and-branch-comparison: product component.
theorem analytic_product_convergence (w q : ℂ) (hq : ‖q‖ < 1) :
    Multipliable (fun j : ℕ ↦ 1 - w * q ^ j) ∧
      ((∏' j : ℕ, (1 - w * q ^ j)) ≠ 0 ↔ ∀ j : ℕ, 1 - w * q ^ j ≠ 0) := by
  sorry

theorem analytic_nahm_convergence (A : Matrix (Fin N) (Fin N) ℝ) (hA : A.PosDef)
    (B : Fin N → ℝ) (C : ℝ) (τ : ℂ) (hτ : 0 < τ.im) :
    Summable (fun n : Fin N → ℕ ↦
      Complex.exp (2 * Real.pi * Complex.I * τ * (Qreal A B C n : ℂ)) /
        ∏ i, qFinite (Complex.exp (2 * Real.pi * Complex.I * τ)) (n i)) := by
  sorry

theorem analytic_nahm_holomorphic (A : Matrix (Fin N) (Fin N) ℝ) (hA : A.PosDef)
    (B : Fin N → ℝ) (C : ℝ) :
    DifferentiableOn ℂ (nahmFunction A B C) {τ : ℂ | 0 < τ.im} := by
  sorry

theorem nahm_C_shift (A : Matrix (Fin N) (Fin N) ℝ) (B : Fin N → ℝ)
    (C : ℝ) (τ : ℂ) :
    nahmFunction A B C τ = Complex.exp (2 * Real.pi * Complex.I * C * τ) *
      nahmFunction A B 0 τ := by
  sorry

-- compact-pochhammer-remainder: the guard keeps every factor away from zero.
theorem compact_pochhammer_remainder (m : ℕ) (hm : 0 < m) (ζ : ℂ)
    (hζ : IsPrimitiveRoot ζ m) (ρ : ℝ) (hρ : 0 < ρ) (hρ1 : ρ < 1)
    (J : ℕ) (hJ : 1 ≤ J) :
    ∃ C ε₀ : ℝ, 0 < C ∧ 0 < ε₀ ∧ ∀ ε : ℝ, 0 < ε → ε < ε₀ →
      ∀ (w : ℂ) (ν : ℝ), ‖w‖ ≤ ρ → |ν| * ε / m ≤ -Real.log ρ / 2 →
        ‖logProduct ζ m w ν ε - bernoulliTrunc ζ m w ν ε J‖ ≤
          C / ε * (ε * (1 + |ν|)) ^ (J + 1) := by
  sorry

-- finite-product-modulus-estimate: its all-n statement includes n=0.
theorem finite_product_modulus_estimate (m : ℕ) (hm : 0 < m) (ζ : ℂ)
    (hζ : IsPrimitiveRoot ζ m) :
    ∃ C ε₀ : ℝ, 0 < C ∧ 0 < ε₀ ∧ ∀ ε : ℝ, 0 < ε → ε < ε₀ → ∀ n : ℕ,
      |Real.log ‖qFinite (ζ * (Real.exp (-ε / m) : ℂ)) n‖ -
          (li2Real (Real.exp (-ε * n)) - Real.pi ^ 2 / 6) / (m * ε)| ≤
        C * (1 + |Real.log ε|) := by
  sorry

-- saddlepoint-global-domination: actual concrete Nahm equations are hypotheses.
theorem saddlepoint_global_domination (A : Matrix (Fin N) (Fin N) ℝ)
    (hA : A.PosDef) (B : Fin N → ℝ) (C : ℝ) (z : Fin N → ℝ)
    (hz : ∀ i, 0 < z i ∧ z i < 1)
    (hNahm : ∀ i, 1 - z i = ∏ j, Real.rpow (z j) (A i j))
    (m : ℕ) (hm : 0 < m) (ζ : ℂ) (hζ : IsPrimitiveRoot ζ m) :
    (hessian A z).PosDef ∧ 0 < Matrix.det (hessian A z) ∧
    ∃ c M L ε₀ : ℝ, 0 < c ∧ 0 < M ∧ 0 < L ∧ 0 < ε₀ ∧
      ∀ ε : ℝ, 0 < ε → ε < ε₀ → ∀ n : Fin N → ℕ,
        ‖(Real.exp (-growth z / (m * ε)) : ℂ) * phaseFreeTerm A B C ζ m ε n‖ ≤
          M * Real.rpow ε (-L) * Real.exp (-c * sqSize (deviation z ε n)) := by
  sorry

-- poisson-covolume-comparison: uniform in the lattice shift, absolute error.
theorem poisson_covolume_comparison (H : Matrix (Fin N) (Fin N) ℝ) (hH : H.PosDef)
    (m : ℕ) (hm : 0 < m) (P : MvPolynomial (Fin N) ℂ) (K : ℕ) :
    ∃ C ε₀ : ℝ, 0 < C ∧ 0 < ε₀ ∧ ∀ ε : ℝ, 0 < ε → ε < ε₀ →
      ∀ b : Fin N → ℝ,
        ‖((m : ℝ) * Real.sqrt ε) ^ N *
            (∑' v : Fin N → ℤ,
              MvPolynomial.eval (fun i ↦ ((b i + m * Real.sqrt ε * v i : ℝ) : ℂ)) P *
                (Real.exp (-quadratic H (fun i ↦ b i + m * Real.sqrt ε * v i) /
                  (2 * m)) : ℂ)) -
          (∫ x : Fin N → ℝ, MvPolynomial.eval (fun i ↦ (x i : ℂ)) P *
            (Real.exp (-quadratic H x / (2 * m)) : ℂ))‖ ≤ C * ε ^ K := by
  sorry

-- The parent CRT subsums have concrete signatures even before its carrier API exists.
theorem cancellation_safe_congruence_remainder (A : Matrix (Fin N) (Fin N) ℚ)
    (hA : (A.map (fun x ↦ (x : ℝ))).PosDef) (B : Fin N → ℚ)
    (z : Fin N → ℝ) (hz : ∀ i, 0 < z i ∧ z i < 1)
    (hNahm : ∀ i, 1 - z i = ∏ j, Real.rpow (z j) (A i j : ℝ))
    (d m D : ℕ) (hd : 0 < d) (hm : 0 < m) (hD : 0 < D)
    (hodd : Odd m) (hcop : Nat.Coprime m D) (hdD : d ∣ D)
    (hden : ∀ v : Fin N → ℤ,
      ∃ r : ℤ, (d : ℚ) * ((∑ i, ∑ j, (v i : ℚ) * A i j * v j) / 2 +
        ∑ i, B i * v i) = r)
    (ζ : ℂ) (hζ : IsPrimitiveRoot ζ m)
    (k : Fin N → Fin m) (k' : Fin N → Fin D) (K : ℕ) :
    (fun ε : ℝ ↦ (Real.exp (-growth z / (m * ε)) : ℂ) *
      ((∑' n : Fin N → ℕ,
          if (∀ i, n i % m = (k i : ℕ)) ∧ (∀ i, n i % D = (k' i : ℕ)) then
            phaseFreeTerm (A.map (fun x ↦ (x : ℝ))) (fun i ↦ (B i : ℝ)) 0 ζ m ε n
          else 0) - (D : ℂ)⁻¹ ^ N *
        (∑' n : Fin N → ℕ,
          if ∀ i, n i % m = (k i : ℕ) then
            phaseFreeTerm (A.map (fun x ↦ (x : ℝ))) (fun i ↦ (B i : ℝ)) 0 ζ m ε n
          else 0))) =O[𝓝[>] (0 : ℝ)] (fun ε : ℝ ↦ ε ^ K) := by
  sorry

-- radial-analytic-remainder-comparison: existence part of the analytic target.
-- The exact chi*c*G*S coefficient identification is specified below, rather
-- than replacing the missing formal Gaussian series by unconstrained data.
theorem radial_analytic_remainder (A : Matrix (Fin N) (Fin N) ℚ)
    (hA : (A.map (fun x ↦ (x : ℝ))).PosDef) (B : Fin N → ℚ)
    (z : Fin N → ℝ) (hz : ∀ i, 0 < z i ∧ z i < 1)
    (hNahm : ∀ i, 1 - z i = ∏ j, Real.rpow (z j) (A i j : ℝ))
    (d m : ℕ) (hd : 0 < d) (hm : 0 < m) (hodd : Odd m)
    (hcop : Nat.Coprime d m)
    (hden : ∀ v : Fin N → ℤ,
      ∃ r : ℤ, (d : ℚ) * ((∑ i, ∑ j, (v i : ℚ) * A i j * v j) / 2 +
        ∑ i, B i * v i) = r)
    (a : ℤ) (hprim : IsPrimitiveRoot (Complex.exp (2 * Real.pi * Complex.I * a / m)) m) :
    ∃ c : ℕ → ℂ, ∀ K : ℕ,
      (fun ε : ℝ ↦ (Real.exp (-growth z / (m * ε)) : ℂ) *
        nahmFunction (A.map (fun x ↦ (x : ℝ))) (fun i ↦ (B i : ℝ)) 0
          ((a : ℂ) / m + Complex.I * (ε : ℂ) / (2 * Real.pi * m)) -
        ∑ j ∈ Finset.range K, c j * (ε : ℂ) ^ j) =O[𝓝[>] (0 : ℝ)]
          (fun ε : ℝ ↦ ε ^ K) := by
  sorry

-- nonzero-unit-series-descent-comparison: coefficientwise root recursion.
theorem nonzero_unit_series_descent (K : IntermediateField ℚ ℂ) (m : ℕ) (hm : 0 < m)
    (Φ : PowerSeries ℂ) (hΦ : PowerSeries.coeff 0 Φ ≠ 0)
    (hpow : ∀ j, PowerSeries.coeff j (Φ ^ m) ∈ K) :
    ∀ j, PowerSeries.coeff j
      (PowerSeries.C (PowerSeries.coeff 0 Φ)⁻¹ * Φ) ∈ K := by
  sorry

-- Concrete analytic acceptance cases.
example : 1 - (Real.sqrt 5 - 1) / 2 = ((Real.sqrt 5 - 1) / 2) ^ 2 := by
  sorry

example :
    (fun ε : ℝ ↦ (Real.exp (-Real.pi ^ 2 / (15 * ε)) : ℂ) *
      nahmFunction (fun _ _ : Fin 1 ↦ 2) (fun _ ↦ 0) 0
        (Complex.I * (ε : ℂ) / (2 * Real.pi)) -
      ((Real.rpow ((2 + ((Real.sqrt 5 - 1) / 2) /
          (1 - (Real.sqrt 5 - 1) / 2)) * (1 - (Real.sqrt 5 - 1) / 2)) (-1 / 2) : ℂ) *
        (1 - (ε : ℂ) / 60))) =O[𝓝[>] (0 : ℝ)] (fun ε : ℝ ↦ ε ^ 2) := by
  sorry

/-!
Remaining named interfaces; their unavailable supplier types are not replaced.

compact-pochhammer-remainder / compact_pochhammer_remainder:
For |w|<=rho<1, |nu|epsilon/m<=-log(rho)/2, the r<=J Bernoulli
log-product truncation has error <=C epsilon^(-1)[epsilon(1+|nu|)]^(J+1).
The factorwise logs and the parent psi supply the truncation function.

uniform-local-saddle-remainder / uniform_local_saddle_remainder:
R_k(x,t)=exp[-B.x*t/m-(C+N/24)t^2/m+sum_i psi_i(x_i/t,t^2)].
Its t^p coefficient has degree<=3p and parity p. On |x_i|<=epsilon^(-1/12),
J=12(K+1), P=4(K+1) give an absolute polynomial-Gaussian error whose
lattice-scaled sum is O(epsilon^K); odd p vanishes under the parent bracket.

cancellation-safe-congruence-remainder / cancellation_safe_congruence_remainder:
The signature above states the flat difference for the concrete restricted tsums.
Its estimate is independent of the strong-denominator phase used later in CRT;
the full congruence carrier and Gauss-sum API remain the parent's construction.

radial-analytic-remainder-comparison / radial_analytic_remainder:
The coefficients in the existence signature above equal those of
chi^N m^(-N/2)c(Q)G(Q,a/m)S(Q,zeta,epsilon), with the exact corrected
integrand and factorwise-log root convention in the reader. Multiplying by
exp(2*pi*i*a*C/m)exp(-C epsilon/m) gives the general C statement.

coefficientwise-kummer-descent-interface / coefficientwise_kummer_descent:
With E=Q(y,zeta), H_rad=E(eta), eta_i=z_i^(1/(dm)), theta_i=eta_i^d,
C(theta)=product_i D_zeta(zeta theta_i), prove coefficientwise
sigma(C(theta)^(-1)T(eta,epsilon)^m)=C(theta)^(-1)T(eta,epsilon)^m
for every actual E-automorphism. sigma(eta_i)=zeta^s_i eta_i and
sigma(theta_i)=zeta^(d*s_i)theta_i. This is the recorded proof gap; the
source states descent but does not prove this formal Gaussian identity.

cgz-normalization-and-field-comparison / cgz_normalization_and_field_comparison:
omega=m^(-N/2)det(H)^(-1/2)product(1-z_i)^(1/2)>0;
Phi=G product(theta_i^B_i (1-z_i)^(-1/m))S; mu=chi^N.
Then the radial formula is mu*omega*exp(Lambda/(m epsilon))*(Phi+O).
Conditional on the missing automorphism identity, Phi^m has coefficients
in Q(y,zeta,zeta_D). The constant near-unit class and eigenspace need the
exact arithmetic compatibility described in the packet: F_G=Q(y,zeta_D),
K=F_G(zeta), H_G=K(eta), and the cyclotomic character of Aut_{F_G}(K).
The constant class is formed in H_G^*/H_G^{*m}; its descended class, when
proved, must be in the inverse-character eigenspace of K^*/K^{*m}.

nonzero-unit-series-descent-comparison / nonzero_unit_series_descent:
The compiled signature states the recursion component. Given the actual
near-unit representative epsilon_beta and a compatible root with
root(epsilon_beta)*Phi_0 in K, its product with Phi also has coefficients
in K. The nonzero constant, representative and arithmetic supplier
conditions, including gcd(m,w_F)=1 for the base F before adjoining zeta
(F=F_G in the Gauss-enlarged application), must all be retained.

andrews-gordon-owner-and-acceptance-comparison / andrews_gordon_owner_comparison:
For odd n=2r+3, A_ij=2min(i,j), B=0, import the existing QM.0 identities:
product classes exclude 0,±(r+1) mod n. The positive solution has coordinates
1-[sin(pi/n)/sin(pi*j/n)]^2 for j=2,...,r+1, in that order.
The Rogers supplier gives Lambda=(n-3)pi^2/(6n). The parent supplies the
radial constant exp(2*pi*i*(n/24-1/8+1/(12n)-1/(4n^2))).
These q-series and Rogers objects are not redefined here.
-/

end TauCeti.Nahm.Radial
