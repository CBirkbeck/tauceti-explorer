import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.LinearAlgebra.QuadraticForm.Basic
import Mathlib.LinearAlgebra.QuadraticForm.Radical
import Mathlib.LinearAlgebra.QuadraticForm.Dual
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.FieldTheory.ChevalleyWarning
import TauCeti.LinearAlgebra.QuadraticForm.Representation

/-!
This file is not the roadmap and is not exhaustive. The definitive roadmap is
research/blueprint/readmes/QuadraticFormInvariantsPartII.md. These signatures
suggest names and statements; the proofs are unchecked. Baseline: Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369.

Only the binary polynomial and the C_i predicate are light new definitions over
existing carriers. Witt modules, all-characteristic tensor scalar extension,
quadric fields and higher cohomology are README targets: their missing carriers
are not simulated here. In particular no diagonal characteristic-two Witt ring
or characteristic-two mu_2 cohomology substitutes for those targets.
-/

noncomputable section
namespace TauCeti.QuadraticFormInvariantsPartII

variable {F : Type*} [Field F]

/-- Q2.0/binary: the nonsingular binary block [a,b]. -/
def binary (a b : F) : QuadraticForm F (Fin 2 → F) :=
  a • QuadraticMap.proj 0 0 + QuadraticMap.proj 0 1 + b • QuadraticMap.proj 1 1

theorem binary_apply (a b : F) (x : Fin 2 → F) :
    binary a b x = a * x 0 ^ 2 + x 0 * x 1 + b * x 1 ^ 2 := by
  sorry

theorem binary_polar (a b : F) (x y : Fin 2 → F) :
    (binary a b).polarBilin x y =
      2 * a * x 0 * y 0 + x 0 * y 1 + x 1 * y 0 + 2 * b * x 1 * y 1 := by
  sorry

/-- Nondegeneracy here agrees with the even-dimensional polar criterion. -/
theorem binary_nondegenerate_iff (a b : F) :
    (binary a b).Nondegenerate ↔ 1 - 4 * a * b ≠ 0 := by
  sorry

example (a b : F) : binary a b ![1, 0] = a := by sorry
example : binary (0 : F) 0 ![1, 1] = 1 := by sorry
example : (binary (1 : ZMod 2) 1).Anisotropic := by sorry
example : ¬ (binary (1 : ZMod 2) 0).Anisotropic := by sorry
example : (binary (1 : ZMod 2) 1).polarBilin ![1, 0] ![0, 1] = 1 := by sorry

/-- Q2.5/ci: strict variable bound, positive homogeneous degree. -/
def IsCi (F : Type*) [Field F] (i : ℕ) : Prop :=
  ∀ (d n : ℕ), 0 < d → d ^ i < n →
    ∀ f : MvPolynomial (Fin n) F, f.IsHomogeneous d →
      ∃ x : Fin n → F, x ≠ 0 ∧ MvPolynomial.eval x f = 0

theorem IsCi.zero [IsAlgClosed F] : IsCi F 0 := by sorry

theorem IsCi.mono {i j : ℕ} (h : i ≤ j) (hF : IsCi F i) : IsCi F j := by
  sorry

/-- Finite fields, by Chevalley–Warning, not by dimension alone. -/
theorem IsCi.finite [Finite F] : IsCi F 1 := by sorry

example : IsCi (ZMod 2) 1 := by sorry
example : ¬ IsCi (ZMod 2) 0 := by sorry
example [IsAlgClosed F] : IsCi F 0 := by sorry

/-- A C_i field has no anisotropic homogeneous quadratic polynomial above 2^i variables. -/
theorem quadratic_zero_of_isCi {i n : ℕ} (hF : IsCi F i) (hn : 2 ^ i < n)
    (q : MvPolynomial (Fin n) F) (hq : q.IsHomogeneous 2) :
    ∃ x : Fin n → F, x ≠ 0 ∧ MvPolynomial.eval x q = 0 := by
  sorry

end TauCeti.QuadraticFormInvariantsPartII
