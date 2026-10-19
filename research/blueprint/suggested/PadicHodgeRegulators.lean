/-
This file is not the roadmap and is not exhaustive. The roadmap document is
 definitive. These signatures suggest Lean forms so contributors and reviewers
 converge on names and interfaces. The mathematical specification is the document.

Mathlib 082e2d3; Tau Ceti f790474.
The README states the arithmetic headline theorems and all ten layers. The pins
have no completed K-theory, syntomic regulator, Wach/Iwasawa or general de Rham
Robba carriers. The first theorem is the actual finite-free Z_p algebra needed
at the end of the local K_3 proof, conditional on its arithmetic inputs. The
finite-constraint theorem is the algebraic milestone used for Coleman images;
its bounded analytic instance requires the README's evaluation/descent inputs.
No abstract type in this file is asserted to be one of those missing carriers.
-/

import Mathlib

noncomputable section
open scoped BigOperators
open Polynomial Matrix

namespace TauCeti.PadicHodgeRegulators

local instance : Fact (Nat.Prime 5) := ⟨by decide⟩
local instance : Fact (Nat.Prime 3) := ⟨by decide⟩

/-! Headline algebraic milestones. -/

/-- D.3: Nakayama plus equal finite rank. Arithmetic must supply the basis,
normalized integral regulator and spanning modulo p; none is assumed to follow
from the existence of an arbitrary linear map. -/
theorem unramified_regulator_algebraic_milestone
    (p : ℕ) [Fact p.Prime] {d : ℕ} {M : Type*}
    [AddCommGroup M] [Module ℤ_[p] M]
    (b : Module.Basis (Fin d) ℤ_[p] M)
    (r : M →ₗ[ℤ_[p]] (Fin d → ℤ_[p]))
    (hmodp : ∀ y, ∃ x z, y = r x + (p : ℤ_[p]) • z) :
    Function.Bijective r ∧
      ∀ y, (∃ x, (p : ℤ_[p]) ^ 2 • r x = y) ↔
        ∃ z : Fin d → ℤ_[p], (p : ℤ_[p]) ^ 2 • z = y := by
  sorry

/-- D.5: p-Frobenius versus q-Frobenius norm polynomial. This is over
Q_p-linear endomorphisms; the transported K-action is a separate README target. -/
theorem curve_frobenius_norm_milestone {R M : Type*} [CommRing R]
    [AddCommGroup M] [Module R M] (P : Module.End R M) (f : ℕ) :
    1 - P ^ f = (∑ j ∈ Finset.range f, P ^ j) * (1 - P) := by
  sorry

/-! D.3: a real finite-field definition and its discriminating values. -/

/-- Kontsevich's finite polylogarithm, including integral indices. -/
def finitePolylog (p : ℕ) [Fact p.Prime] (n : ℤ) : (ZMod p)[X] :=
  ∑ k ∈ Finset.Ico 1 p, C (((k : ZMod p) ^ n)⁻¹) * X ^ k

-- README test finitePolylog_five_two.
example : (finitePolylog 5 2).eval 2 = 1 := by
  norm_num [finitePolylog, Finset.sum_Ico_succ_top]
  have h4 : (4 : ZMod 5)⁻¹ = 4 := inv_eq_of_mul_eq_one_right (by decide +revert)
  have h9 : (9 : ZMod 5)⁻¹ = 4 := inv_eq_of_mul_eq_one_right (by clear h4; decide +revert)
  have h16 : (16 : ZMod 5)⁻¹ = 1 :=
    inv_eq_of_mul_eq_one_right (by clear h4 h9; decide +revert)
  rw [h4, h9, h16]
  clear h4 h9 h16
  decide +revert

-- README boundary test finitePolylog_three_non_example: p>3 is essential.
example : (finitePolylog 3 2).eval 1 = 2 := by
  norm_num [finitePolylog, Finset.sum_Ico_succ_top]
  have h4 : (4 : ZMod 3)⁻¹ = 1 := inv_eq_of_mul_eq_one_right (by decide +revert)
  rw [h4]
  clear h4
  decide +revert

theorem finitePolylog_two_double_zero (p : ℕ) [Fact p.Prime] (hp : 3 < p) :
    (X - 1) ^ 2 ∣ finitePolylog p 2 := by
  sorry

/-- The reduction of p^-2 D(ζ^p); the caller must exclude x=1. -/
def residueDilogValue (p : ℕ) [Fact p.Prime] {F : Type*} [Field F]
    [Algebra (ZMod p) F] (x : F) : F :=
  (finitePolylog p 2).aeval x / (x - 1) ^ p

-- The two further finite values and the excluded point are specified in README.
theorem residueDilogValue_five_values :
    residueDilogValue 5 (2 : ZMod 5) = 1 ∧
    residueDilogValue 5 (3 : ZMod 5) = 4 ∧
    residueDilogValue 5 (4 : ZMod 5) = 0 := by
  sorry

/-- Cardinality statement on the correct domain F_q^× minus {1}, not on F_q. -/
theorem residueDilogValue_spans (p s : ℕ) [Fact p.Prime]
    (hp : 3 < p) (hs : 0 < s) :
    Submodule.span (ZMod p)
      {y : GaloisField p s | ∃ x : GaloisField p s,
        x ≠ 0 ∧ x ≠ 1 ∧ residueDilogValue p x = y} = ⊤ ∧
    Submodule.span (ZMod p)
      {y : GaloisField p s | ∃ x x' : GaloisField p s,
        x ≠ 0 ∧ x ≠ 1 ∧ x' ≠ 0 ∧ x' ≠ 1 ∧
        residueDilogValue p x - residueDilogValue p x' = y} = ⊤ := by
  sorry

/-! L4: finite evaluation constraints on actual algebras. -/

section Constraints
variable {E R : Type*} [Field E] [CommRing R] [Algebra E R] {d m : ℕ}

/-- Rows whose specializations lie in prescribed E-subspaces. -/
def evaluationConstraints (J : Finset (Fin m)) (ev : Fin m → R →ₐ[E] E)
    (V : Fin m → Submodule E (Fin d → E)) : Submodule R (Fin d → R) where
  carrier := {F | ∀ j ∈ J, (fun k => ev j (F k)) ∈ V j}
  zero_mem' := by
    intro j hj
    convert (V j).zero_mem using 1
    ext k
    simp
  add_mem' := by
    intro F G hF hG j hj
    convert (V j).add_mem (hF j hj) (hG j hj) using 1
    ext k
    simp
  smul_mem' := by
    intro a F hF j hj
    convert (V j).smul_mem (ev j a) (hF j hj) using 1
    ext k
    simp

-- Empty constraints impose no condition, even on the zero-dimensional module.
example (ev : Fin 0 → R →ₐ[E] E) (V : Fin 0 → Submodule E (Fin d → E)) :
    evaluationConstraints Finset.univ ev V = ⊤ := by
  ext F
  simp [evaluationConstraints]

-- A constant fails the zero-at-zero condition whereas X satisfies it.
example :
    (fun _ : Fin 1 => (1 : ℚ[X])) ∉
      evaluationConstraints {0} (fun _ : Fin 1 => Polynomial.aeval (0 : ℚ))
        (fun _ => (⊥ : Submodule ℚ (Fin 1 → ℚ))) ∧
    (fun _ : Fin 1 => (X : ℚ[X])) ∈
      evaluationConstraints {0} (fun _ : Fin 1 => Polynomial.aeval (0 : ℚ))
        (fun _ => (⊥ : Submodule ℚ (Fin 1 → ℚ))) := by
  simp [evaluationConstraints, funext_iff]

/-- L4 headline: existence and determinant ideal, with evaluation kernels
specified. Equality after analytic scalar extension alone is insufficient. -/
theorem constraint_basis_and_determinant [IsDomain R]
    (J : Finset (Fin m)) (t : R) (x : Fin m → E)
    (ev : Fin m → R →ₐ[E] E) (V : Fin m → Submodule E (Fin d → E))
    (hx : Function.Injective x) (hev : ∀ j, ev j t = x j)
    (hq : ∀ j, t - algebraMap E R (x j) ≠ 0)
    (hker : ∀ j f, ev j f = 0 ↔ t - algebraMap E R (x j) ∣ f) :
    ∃ b : Module.Basis (Fin d) R (evaluationConstraints J ev V),
      Associated (Matrix.det (fun i k => (b i : Fin d → R) k))
        (∏ j ∈ J, (t - algebraMap E R (x j)) ^ (d - Module.finrank E (V j))) := by
  sorry

end Constraints

/-- L3: the singular Euler relation asks for a lift, not a total inverse. -/
theorem singular_euler_lift_criterion {E D : Type*} [Field E]
    [AddCommGroup D] [Module E D] (A B : Module.End E D) (b : D) :
    (∃ v, B v = A b) ↔ A b ∈ LinearMap.range B := by
  sorry

/-- L4: row-coordinate change under n'=U n, with a possibly different
period basis ν'=B ν. The scalar extension is explicit. -/
theorem coleman_row_covariance {R A : Type*} [CommRing R] [CommRing A]
    (ι : R →+* A) {d : ℕ} (c : Fin d → R)
    (U : (Matrix (Fin d) (Fin d) R)ˣ)
    (M : Matrix (Fin d) (Fin d) A) (B : (Matrix (Fin d) (Fin d) A)ˣ) :
    (fun k => ι ((c ᵥ* (↑U⁻¹ : Matrix (Fin d) (Fin d) R)) k)) ᵥ*
        ((↑U : Matrix (Fin d) (Fin d) R).map ι * M *
          (↑B⁻¹ : Matrix (Fin d) (Fin d) A)) =
      ((fun k => ι (c k)) ᵥ* M) ᵥ* (↑B⁻¹ : Matrix (Fin d) (Fin d) A) := by
  sorry

/-- Integral image changes require a unit determinant. -/
def shearMatrix {R : Type*} [CommRing R] (e₁ e₂ : R) : Matrix (Fin 2) (Fin 2) R :=
  !![1, e₂; e₁, 1]

example : (shearMatrix (2 : ℤ) 3).det = -5 := by
  norm_num [shearMatrix, Matrix.det_fin_two]

-- Nonzero is insufficient over the integral ring.
example : (shearMatrix (1 : ℤ) (-4)).det = 5 ∧ ¬ IsUnit (5 : ℤ) := by
  norm_num [shearMatrix, Matrix.det_fin_two, Int.isUnit_iff]

theorem shearMatrix_unit {R : Type*} [CommRing R] (e₁ e₂ : R)
    (h : IsUnit (1 - e₁ * e₂)) : IsUnit (shearMatrix e₁ e₂) := by
  sorry

end TauCeti.PadicHodgeRegulators
