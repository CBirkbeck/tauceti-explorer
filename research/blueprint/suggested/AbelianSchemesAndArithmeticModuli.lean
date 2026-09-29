/-
Suggested Lean prototypes for the roadmap "Abelian Schemes And Arithmetic Moduli" (AbelianSchemesAndArithmeticModuli);
checkpoints 1–2 plan the field-level core of stage A6, its Weil restriction, and the Rosati involution of stage A2.

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/AbelianSchemesAndArithmeticModuli.md` is definitive. The statements below suggest Lean forms
so that contributors and reviewers converge on names and signatures. A planned result whose proof is not short is
`sorry`, and nothing here is claimed to be formalised (implementationStatus = unchecked). Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Only Mathlib is imported. The carrier of this stage is Tau Ceti's `TauCeti.AlgebraicGeometry.AbelianVariety K` (with
`End A`, `IsIsogeny`, `mulBy` and `prod`). It is not importable in the environment where this file was checked, so the
abelian-variety signatures are given in the comment block below, and the compiled part prototypes the algebra the
proofs rest on: uniqueness of the characteristic polynomial, the two lemmas behind its ℓ-independence, the
root-of-unity lemma, positive involutions and semisimplicity. Names are relative to
`TauCeti.AlgebraicGeometry.AbelianVariety` and agree with the packet's `api` and `tests`; unit tests are `example`s whose
docstring begins "Test `<name>`".

Planned signatures (Tau Ceti f790474 carrier; `g` is the dimension of `A`):

  noncomputable def Hom.deg {A B : AbelianVariety K} (α : A ⟶ B) : ℕ
  theorem deg_comp (α : A ⟶ B) (β : B ⟶ C) : Hom.deg (α ≫ β) = Hom.deg α * Hom.deg β
  theorem deg_mulBy (n : ℤ) : Hom.deg (mulBy A n) = n.natAbs ^ (2 * g)
  noncomputable def End.charpoly (α : End A) : ℤ[X]
  theorem End.charpoly_eval (α : End A) (r : ℤ) : (End.charpoly α).eval r = Hom.deg (End.toHom (α - r))
  theorem End.charpoly_monic (α : End A) : (End.charpoly α).Monic ∧ (End.charpoly α).natDegree = 2 * g
  noncomputable def End.trace (α : End A) : ℤ
  theorem Hom.module_free (A B : AbelianVariety K) : Module.Free ℤ (Additive (A ⟶ B))
  theorem Hom.finrank_le (A B) : Module.finrank ℤ (Additive (A ⟶ B)) ≤ 4 * dim A * dim B
  theorem End.isSemisimpleRing_tensorQ (A) : IsSemisimpleRing (End A ⊗[ℤ] ℚ)
  noncomputable def Polarization.rosati (λ : Polarization A) : End⁰ A ≃ₗ[ℚ] (End⁰ A)ᵐᵒᵖ
  theorem rosati_positive (λ : Polarization A) (α : End⁰ A) (hα : α ≠ 0) : 0 < trace (α * rosati λ α)
-/

import Mathlib.Algebra.Polynomial.Roots
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.NumberTheory.Padics.Complex
import Mathlib.RingTheory.IntegralClosure.IsIntegral.Basic
import Mathlib.RingTheory.SimpleModule.WedderburnArtin

open Polynomial

namespace TauCeti.AlgebraicGeometry.AbelianVariety

/-! ## Uniqueness of the characteristic polynomial
(`AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism`) -/

/-- Two rational polynomials that agree at every integer are equal: the uniqueness in Milne's Theorem 10.9. -/
theorem eq_of_eval_intCast {p q : ℚ[X]} (h : ∀ r : ℤ, p.eval (r : ℚ) = q.eval (r : ℚ)) : p = q := by
  apply Polynomial.eq_of_infinite_eval_eq p q
  exact Set.infinite_of_injective_forall_mem (f := fun r : ℤ => (r : ℚ)) Int.cast_injective h

/-! ## The two lemmas behind ℓ-independence (`…/polynomials-determined-by-l-adic-values`,
`…/multiplicative-polynomial-functions`) -/

/-- Milne, Lemma 10.21: monic polynomials of the same degree over `ℚ_ℓ` whose root multisets `a`, `b` give equal
ℓ-adic absolute values `|∏ F(aᵢ)|` for every `F ∈ ℤ[T]` are equal. -/
theorem multiset_eq_of_padicNorm_prod_eq (ℓ : ℕ) [Fact ℓ.Prime] (a b : Multiset (PadicAlgCl ℓ))
    (hcard : Multiset.card a = Multiset.card b)
    (h : ∀ F : ℤ[X], ‖(a.map fun x => aeval x F).prod‖ = ‖(b.map fun x => aeval x F).prod‖) : a = b := by
  sorry

/-- Milne, Lemma 10.22, for `E = Mₙ(K)` and `δ = det`: `det F(M) = ∏ F(aᵢ)` over the eigenvalues. -/
theorem det_aeval_eq_prod_roots {K : Type*} [Field K] [IsAlgClosed K] {n : ℕ} (M : Matrix (Fin n) (Fin n) K)
    (F : K[X]) : (aeval M F).det = (M.charpoly.roots.map fun a => F.eval a).prod := by
  sorry

/-! ## The root-of-unity lemma (`…/automorphisms-of-polarized-abelian-varieties`) -/

/-- Milne, Lemma 14.5: a root of unity of the form `1 + n π` with `π` an algebraic integer and `n ≥ 3` is `1`. -/
theorem eq_one_of_root_of_unity {K : Type*} [Field K] [CharZero K] {ζ π : K} (hπ : IsIntegral ℤ π) {n : ℤ}
    (hn : 3 ≤ n) (hζ : ζ = 1 + n * π) {m : ℕ} (hm : 0 < m) (hζm : ζ ^ m = 1) : ζ = 1 := by
  sorry

/-! ## Positive involutions (`AbelianSchemesAndArithmeticModuli:A2/rosati-involution`, `…:A6/rosati-positivity`) -/

/-- Test `rosati_product` (algebraic shape): on `M₂(ℚ)` the transpose is an anti-involution, `(xy)ᵀ = yᵀxᵀ`. -/
example (x y : Matrix (Fin 2) (Fin 2) ℚ) : (x * y).transpose = y.transpose * x.transpose :=
  Matrix.transpose_mul x y

/-- The trace form of the transpose involution is positive: `Tr(x xᵀ) > 0` for `x ≠ 0` (the shape of Rosati
positivity on `End⁰(E × E) = M₂(ℚ)`). -/
theorem trace_mul_transpose_pos {n : ℕ} (x : Matrix (Fin n) (Fin n) ℚ) (hx : x ≠ 0) :
    0 < (x * x.transpose).trace := by
  sorry

/-- Test `rosati_mulBy` (algebraic shape): scalars are fixed, `(n • 1)ᵀ = n • 1`. -/
example (n : ℚ) : (n • (1 : Matrix (Fin 2) (Fin 2) ℚ)).transpose = n • 1 := by
  simp

/-! ## Semisimplicity (`…/endomorphism-algebra-is-semisimple`) -/

/-- `End⁰(E × E′) = ℚ × ℚ` and `End⁰(E × E) = M₂(ℚ)` are semisimple, as the theorem predicts. -/
example : IsSemisimpleRing (ℚ × ℚ) := inferInstance

example : IsSemisimpleRing (Matrix (Fin 2) (Fin 2) ℚ) := inferInstance

/-! ## Weil restriction (`AbelianSchemesAndArithmeticModuli:A6/weil-restriction-functor`, …)

Suggested signatures (algebraic spaces are AlgebraicModuliForArithmeticGeometry R09.3's):

  def weilRestriction {S S' : Scheme} (f : S' ⟶ S) [IsFiniteLocallyFree f] (X : Over S') : AlgebraicSpace S
  theorem weilRestriction_isAbelianScheme [IsFinite f] [IsEtale f] (A : AbelianScheme S') :
      IsAbelianScheme (weilRestriction f A)
  theorem tateModule_weilRestriction (L K) [FiniteDimensional K L] [IsSeparable K L] (A : AbelianVariety L) :
      TateModule ℓ (Res L K A) ≃ Representation.ind (G_L ≤ G_K) (TateModule ℓ A)
-/

/-- Test `weilRestriction_affine_explicit` (Poonen, Example 4.6.2): substituting `x = y₁ + y₂√2` turns products in
`ℚ(√2)` into the two coordinate equations; the identity behind it. -/
example {R : Type*} [CommRing R] (s a b c d : R) (hs : s ^ 2 = 2) :
    (a + b * s) * (c + d * s) = (a * c + 2 * b * d) + (a * d + b * c) * s := by
  linear_combination (b * d) * hs

end TauCeti.AlgebraicGeometry.AbelianVariety
