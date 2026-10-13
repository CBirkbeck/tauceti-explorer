/-
Suggested statements for DT.2, extending the parent roadmap.
The reader document carries the complete mathematics, source locators and open inputs.
Only the two light definitions below have real bodies. Heavy height, Chow and adelic
objects remain reader targets. Admitted theorems are proposals, not implementations.
-/
import Mathlib.Algebra.Algebra.Subalgebra.Pi
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Analysis.SpecialFunctions.Exp
import Mathlib.Data.Set.Card
import Mathlib.Data.Setoid.Basic
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.NumberTheory.Height.NumberField
import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import TauCeti.RingTheory.DedekindDomain.SInteger.Unit

noncomputable section

open scoped BigOperators NumberField Polynomial
open IsDedekindDomain

namespace TauCeti.DiophantineApproximation.DT2

section LogarithmicSpace

variable {ι V : Type*} [Fintype ι] [AddCommGroup V] [Module ℝ V]

/-- Half the sum of the absolute values of a finite family of real linear forms. -/
def symmetricLogSeminorm (g : ι → V →ₗ[ℝ] ℝ) (x : V) : ℝ :=
  (∑ j, |g j x|) / 2

theorem symmetricLogSeminorm_nonneg (g : ι → V →ₗ[ℝ] ℝ) (x : V) :
    0 ≤ symmetricLogSeminorm g x := by
  sorry

theorem symmetricLogSeminorm_smul (g : ι → V →ₗ[ℝ] ℝ) (a : ℝ) (x : V) :
    symmetricLogSeminorm g (a • x) = |a| * symmetricLogSeminorm g x := by
  sorry

theorem symmetricLogSeminorm_add (g : ι → V →ₗ[ℝ] ℝ) (x y : V) :
    symmetricLogSeminorm g (x + y) ≤
      symmetricLogSeminorm g x + symmetricLogSeminorm g y := by
  sorry

theorem symmetricLogSeminorm_eq_zero (g : ι → V →ₗ[ℝ] ℝ) (x : V) :
    symmetricLogSeminorm g x = 0 ↔ ∀ j, g j x = 0 := by
  sorry

-- test_symmetric_log_seminorm_1: the factor 1/2 is essential.
example (x : ℝ) :
    symmetricLogSeminorm ![LinearMap.id, -LinearMap.id] x = |x| := by
  sorry

-- test_symmetric_log_seminorm_2: the empty family gives zero.
example (x : V) : symmetricLogSeminorm (fun j : Fin 0 => Fin.elim0 j) x = 0 := by
  sorry

-- test_symmetric_log_seminorm_3: a common kernel prevents positive definiteness.
example (g : Fin 2 → (Fin 2 → ℝ) →ₗ[ℝ] ℝ)
    (hg : ∀ j x, g j x = if j = 0 then x 0 else -x 0) :
    symmetricLogSeminorm g ![0, 1] = 0 := by
  sorry

end LogarithmicSpace

section BlockAlgebra

variable {ι F : Type*} [Field F]

/-- The pointwise subalgebra of functions constant on the classes of a setoid. -/
def blockConstantAlgebra (P : Setoid ι) : Subalgebra F (ι → F) where
  carrier := {f | ∀ i j, P.r i j → f i = f j}
  algebraMap_mem' := by
    intro a i j h
    rfl
  zero_mem' := by
    intro i j h
    rfl
  one_mem' := by
    intro i j h
    rfl
  add_mem' := by
    intro f g hf hg i j h
    exact congrArg₂ (fun a b : F => a + b) (hf i j h) (hg i j h)
  mul_mem' := by
    intro f g hf hg i j h
    exact congrArg₂ (fun a b : F => a * b) (hf i j h) (hg i j h)

theorem mem_blockConstantAlgebra (P : Setoid ι) (f : ι → F) :
    f ∈ blockConstantAlgebra P ↔ ∀ i j, P.r i j → f i = f j := by
  rfl

theorem blockConstantAlgebra_antitone (P Q : Setoid ι) (h : P ≤ Q) :
    blockConstantAlgebra (F := F) Q ≤ blockConstantAlgebra P := by
  sorry

theorem blockConstantAlgebra_quotient [Fintype ι] (P : Setoid ι) :
    Nonempty (blockConstantAlgebra (F := F) P ≃ₐ[F] (Quotient P → F)) := by
  sorry

theorem blockConstantAlgebra_inf (P Q : Setoid ι) :
    blockConstantAlgebra (F := F) P ⊓ blockConstantAlgebra Q =
      blockConstantAlgebra (P ⊔ Q) := by
  sorry

theorem blockConstantAlgebra_ext (P : Setoid ι)
    (f g : blockConstantAlgebra (F := F) P) (h : ∀ i, f.val i = g.val i) :
    f = g := by
  sorry

theorem blockConstantAlgebra_isUnit_iff (P : Setoid ι)
    (f : blockConstantAlgebra (F := F) P) :
    IsUnit f ↔ ∀ i, f.val i ≠ 0 := by
  sorry

-- test_block_constant_algebra_1: the two-block relation gives (a,a,b).
example (P : Setoid (Fin 3))
    (hP : ∀ i j, P.r i j ↔ (i = 2 ↔ j = 2)) (a b : ℚ) :
    ![a, a, b] ∈ blockConstantAlgebra P := by
  sorry

-- test_block_constant_algebra_2: equality gives the full product algebra.
example (f : Fin 3 → ℚ) : f ∈ blockConstantAlgebra (⊥ : Setoid (Fin 3)) := by
  sorry

example (f : Fin 3 → ℚ) :
    f ∈ blockConstantAlgebra (⊤ : Setoid (Fin 3)) ↔ ∀ i, f i = f 0 := by
  sorry

-- test_block_constant_algebra_3: unequal values in one block are excluded.
example (P : Setoid (Fin 3))
    (hP : ∀ i j, P.r i j ↔ (i = 2 ↔ j = 2)) :
    ![(1 : ℚ), 2, 0] ∉ blockConstantAlgebra P := by
  sorry

-- The empty index set is allowed; its function algebra is the zero ring.
example (f : Fin 0 → ℚ) : f ∈ blockConstantAlgebra (⊤ : Setoid (Fin 0)) := by
  sorry

end BlockAlgebra

section ArithmeticMilestones

variable {K : Type*} [Field K] [CharZero K]

/-- The finitely generated specialization of the stronger finite-rank README target. -/
theorem nondegenerate_unit_count (n : ℕ) (hn : 2 ≤ n)
    (Γ : Subgroup (Fin n → Kˣ)) [Group.FG Γ] (a : Fin n → Kˣ) :
    let X : Set Γ := {x |
      (∑ i, (a i : K) * ((x.val i : Kˣ) : K)) = 1 ∧
      ∀ s : Finset (Fin n), s.Nonempty →
        (∑ i ∈ s, (a i : K) * ((x.val i : Kˣ) : K)) ≠ 0}
    X.Finite ∧ X.ncard ≤
      (8 * n) ^ (4 * n ^ 4 * (n + Module.finrank ℤ (Additive Γ) + 1)) := by
  sorry

/-- The S-unit carrier and its finite-generation instance are native at the pin. -/
theorem s_unit_equation_finite [NumberField K]
    (S : Finset (HeightOneSpectrum (𝓞 K))) (n : ℕ) (a : Fin n → Kˣ) :
    {x : Fin n → ((S : Set (HeightOneSpectrum (𝓞 K))).unit K) |
      (∑ i, (a i : K) * (((x i).val : Kˣ) : K)) = 1 ∧
      ∀ s : Finset (Fin n), s.Nonempty →
        (∑ i ∈ s, (a i : K) * (((x i).val : Kˣ) : K)) ≠ 0}.Finite := by
  sorry

/-- Elementary height-zero input used by the logarithmic-space norm proof. -/
theorem height_zero_iff_finite_order [NumberField K] (u : Kˣ) :
    Height.logHeight₁ (u : K) = 0 ↔ IsOfFinOrder u := by
  sorry

/-- Nondegenerate repeated-root sequences: the polynomial factors are essential. -/
theorem polynomial_exponential_zeros (k a : ℕ) (hk : 2 ≤ k) (ha : 1 ≤ a)
    (α : Fin k → Kˣ) (P : Fin k → K[X])
    (hP : ∀ i, P i ≠ 0 ∧ (P i).natDegree < a)
    (hα : ∀ i j, i ≠ j → ¬ IsOfFinOrder (α i / α j)) :
    let Z : Set ℤ := {z | (∑ i, (P i).eval (z : K) * (α i : K) ^ z) = 0}
    Z.Finite ∧ Z.ncard ≤ (8 * k ^ a) ^ (8 * k ^ (6 * a)) := by
  sorry

/-- The singleton-root case is handled separately from the logarithmic bound. -/
theorem one_root_zero_count (α : Kˣ) (P : K[X]) (hP : P ≠ 0) :
    {z : ℤ | P.eval (z : K) * (α : K) ^ z = 0}.Finite ∧
      {z : ℤ | P.eval (z : K) * (α : K) ^ z = 0}.ncard ≤ P.natDegree := by
  sorry

/-- General two-sided zero sets, with independent moduli and modulus zero for singletons. -/
theorem polynomial_exponential_progressions (k : ℕ) (α : Fin k → Kˣ)
    (P : Fin k → K[X]) (hP : ∀ i, P i ≠ 0) (hk : 0 < k)
    (hα : Function.Injective α) :
    let t := ∑ i, ((P i).natDegree + 1)
    ∃ C : Finset (ℤ × ℤ),
        (C.card : ℝ) ≤ Real.exp (Real.exp (70 * (t : ℝ))) ∧
        (∀ z : ℤ, (∑ i, (P i).eval (z : K) * (α i : K) ^ z) = 0 ↔
          ∃ c ∈ C, ∃ q : ℤ, z = c.1 + c.2 * q) := by
  sorry

example : {z : ℤ | ((z : ℚ) - 3) * (2 : ℚ) ^ z = 0} = {3} := by
  sorry

end ArithmeticMilestones

end TauCeti.DiophantineApproximation.DT2
