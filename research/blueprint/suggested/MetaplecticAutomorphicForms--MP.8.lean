/-
This file is not the roadmap and is not exhaustive. The roadmap document is
 definitive. These statements suggest Lean forms so contributors and reviewers
can converge on names and signatures. Proof placeholders are not implementations.
Pinned baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
-/
import Mathlib.LinearAlgebra.QuadraticForm.Basis
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.Data.Int.ModEq

namespace TauCeti.Jacobi.GenusTwo

-- Native integral quadratic forms encode half-integral symmetric matrices.
-- No new Fourier-index structure, analytic coefficient or Jacobi-form type.
local notation "V" => Fin 2 → ℤ
local notation "FData" => QuadraticForm ℤ V × V

/-- Integral shift from BFH (2.9), with a=m/N and c=N^(1-j). -/
def fourierShift (a c : ℤ) (l : V) (p : FData) : FData :=
  (p.1 + c • (a • QuadraticMap.linMulLin (dotProductBilin ℤ ℤ l)
      (dotProductBilin ℤ ℤ l) -
    QuadraticMap.linMulLin (dotProductBilin ℤ ℤ p.2)
      (dotProductBilin ℤ ℤ l)),
   p.2 - (2 * a) • l)

lemma fourierShift_fst_apply (a c : ℤ) (l : V) (p : FData) (x : V) :
    (fourierShift a c l p).1 x =
      p.1 x + c * (a * (l ⬝ᵥ x)^2 - (p.2 ⬝ᵥ x) * (l ⬝ᵥ x)) := by sorry

lemma fourierShift_snd (a c : ℤ) (l : V) (p : FData) :
    (fourierShift a c l p).2 = p.2 - (2 * a) • l := by sorry

lemma fourierShift_zero (a c : ℤ) (p : FData) :
    fourierShift a c 0 p = p := by sorry

lemma fourierShift_add (a c : ℤ) (l k : V) (p : FData) :
    fourierShift a c (l + k) p = fourierShift a c k (fourierShift a c l p) := by sorry

lemma fourierShift_neg (a c : ℤ) (l : V) (p : FData) :
    fourierShift a c (-l) (fourierShift a c l p) = p := by sorry

-- Test: fourierShift_zero_data; j=0 at level N=8 and a=1.
example : fourierShift 1 8 ![1,0] (0,0) =
    (8 • QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, ![-2,0]) := by sorry

-- Test: fourierShift_other_cusp; the same shift at j=1 has c=1.
example : fourierShift 1 1 ![1,0] (0,0) =
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, ![-2,0]) := by sorry

-- Test: fourierShift_mixed_term; integral x₀x₁ has half-integral matrix entries.
example : fourierShift 1 1 ![0,1]
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 1, ![1,0]) =
    (QuadraticMap.proj (R := ℤ) (1 : Fin 2) 1, ![1,-2]) := by sorry

/-- The quadratic form represented by BFH's matrix U divided by N. -/
def fourierDiscriminant (a c : ℤ) (p : FData) : QuadraticForm ℤ V :=
  (4 * a) • p.1 - c • QuadraticMap.linMulLin
    (dotProductBilin ℤ ℤ p.2) (dotProductBilin ℤ ℤ p.2)

lemma fourierDiscriminant_apply (a c : ℤ) (p : FData) (x : V) :
    fourierDiscriminant a c p x = 4 * a * p.1 x - c * (p.2 ⬝ᵥ x)^2 := by sorry

lemma fourierDiscriminant_zero (a c : ℤ) :
    fourierDiscriminant a c (0,0) = 0 := by sorry

lemma fourierDiscriminant_zero_vector (a c : ℤ) (Q : QuadraticForm ℤ V) :
    fourierDiscriminant a c (Q,0) = (4 * a) • Q := by sorry

-- Test: fourierDiscriminant_mixed; detects the factor 4 and off-diagonal convention.
example : fourierDiscriminant 1 1
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 1, 0) ![1,1] = 4 := by sorry

-- Test: fourierDiscriminant_negative; no positivity condition on Fourier data.
example : fourierDiscriminant 1 8 (0, ![1,0]) ![1,0] = -8 := by sorry

-- Test: fourierDiscriminant_zero_index; a=0 forgets the quadratic form.
example : fourierDiscriminant 0 1
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, 0) =
    fourierDiscriminant 0 1 (0,0) := by sorry

lemma fourierDiscriminant_shift (a c : ℤ) (l : V) (p : FData) :
    fourierDiscriminant a c (fourierShift a c l p) =
      fourierDiscriminant a c p := by sorry

lemma fourierShift_modEq (a c : ℤ) (l : V) (p : FData) (i : Fin 2) :
    Int.ModEq (2 * a) ((fourierShift a c l p).2 i) (p.2 i) := by sorry

lemma eq_of_fourierDiscriminant_eq (a c : ℤ) (ha : a ≠ 0)
    (p q : FData) (hR : p.2 = q.2)
    (hD : fourierDiscriminant a c p = fourierDiscriminant a c q) :
    p = q := by sorry

lemma fourierShift_injective (a c : ℤ) (ha : a ≠ 0) (p : FData) :
    Function.Injective (fun l : V => fourierShift a c l p) := by sorry

theorem exists_fourierShift_iff (a c : ℤ) (ha : a ≠ 0) (p q : FData) :
    (∃ l : V, fourierShift a c l p = q) ↔
    fourierDiscriminant a c p = fourierDiscriminant a c q ∧
      ∀ i, Int.ModEq (2 * a) (p.2 i) (q.2 i) := by sorry

theorem existsUnique_fourierRepresentative (a c : ℤ) (ha : a ≠ 0)
    (p : FData) (nu : V) (hnu : ∀ i, Int.ModEq (2 * a) (p.2 i) (nu i)) :
    ∃! Q : QuadraticForm ℤ V,
      fourierDiscriminant a c (Q,nu) = fourierDiscriminant a c p := by sorry

lemma coefficient_eq_of_fourierInvariants {A : Type*} (a c : ℤ) (ha : a ≠ 0)
    (B : FData → A) (hB : ∀ (l : V) (p : FData), B (fourierShift a c l p) = B p)
    (p q : FData) (hD : fourierDiscriminant a c p = fourierDiscriminant a c q)
    (hR : ∀ i, Int.ModEq (2 * a) (p.2 i) (q.2 i)) : B p = B q := by sorry

-- Acceptance: arbitrary integral c, including zero and negative values.
example (p : FData) (l : V) :
    fourierDiscriminant (-1) 0 (fourierShift (-1) 0 l p) =
      fourierDiscriminant (-1) 0 p := by sorry

-- Acceptance: identical residue does not suffice without discriminant equality.
example : ¬ ∃ l : V, fourierShift 1 1 l (0,0) =
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, 0) := by sorry

-- Acceptance: at a=0 the orbit criterion is false, even with equal vector data.
example : ¬ ∃ l : V, fourierShift 0 1 l (0,0) =
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, 0) := by sorry

-- Acceptance: discriminant equality alone cannot distinguish residue classes.
example : fourierDiscriminant 2 1 (0, ![1,0]) =
    fourierDiscriminant 2 1 (0, ![-1,0]) ∧
    ¬ ∃ l : V, fourierShift 2 1 l (0, ![1,0]) = (0, ![-1,0]) := by sorry

#check QuadraticMap.linMulLin
#check QuadraticMap.toQuadraticMap_toBilin
#check Int.modEq_iff_dvd

end TauCeti.Jacobi.GenusTwo
