/-
EDC.7 / EDC.8: native-baseline statement suggestions, independently reviewed 2026-10-13.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369.

The reader document states all 57 targets, exact hypotheses, sources, APIs and diagnostic tests.
This file follows WORKERS.md's 2026-10-12 shape rule: no substitute sheaf categories,
no unproved data constructions, and no development of the geometric theory. Perverse sheaves,
weights, filtered six operations, normal-cone specialization and the coherent categorical
Lefschetz construction are reader targets until their carriers exist at the pins.
The two unresolved mathematical/ownership gaps are recorded in the reader and review.

Below are light predicates and end statements over native category-theoretic and
finite-dimensional linear-algebra carriers. Proof holes do not claim implementation.
-/
import Mathlib.CategoryTheory.Abelian.Basic
import Mathlib.Algebra.Homology.ShortComplex.ShortExact
import Mathlib.CategoryTheory.Simple
import Mathlib.CategoryTheory.Subobject.ArtinianObject
import Mathlib.CategoryTheory.Subobject.NoetherianObject
import Mathlib.CategoryTheory.Subobject.Lattice
import Mathlib.CategoryTheory.Limits.Shapes.Biproducts
import Mathlib.CategoryTheory.Limits.Shapes.Kernels
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Category.ModuleCat.Biproducts
import Mathlib.RingTheory.SimpleModule.Basic
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.Charpoly.Coeff
import Mathlib.LinearAlgebra.Determinant
import Mathlib.LinearAlgebra.Eigenspace.Triangularizable
import Mathlib.LinearAlgebra.Eigenspace.Zero
import Mathlib.LinearAlgebra.PerfectPairing.Basic
import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.Data.Int.Interval

noncomputable section
set_option linter.unusedSectionVars false
set_option linter.unusedVariables false
open CategoryTheory CategoryTheory.Limits
universe u v

namespace TauCeti.EtaleDuality

/-! ## EDC.7 — abstract category theory -/

section Semisimple
variable {C : Type u} [Category.{v} C] [Preadditive C] [HasFiniteBiproducts C]

/-- Node `EDC.7/geometrically-semisimple-perverse-sheaf`, API `IsSemisimpleObject`:
`X` is isomorphic to a finite biproduct of simple objects. -/
def IsSemisimpleObject (X : C) : Prop :=
  ∃ (n : ℕ) (S : Fin n → C), (∀ i, Simple (S i)) ∧ Nonempty (X ≅ ⨁ S)

/-- API `IsSemisimpleObject.biprod`. -/
theorem IsSemisimpleObject.biprod [HasBinaryBiproducts C] {X Y : C} (hX : IsSemisimpleObject X)
    (hY : IsSemisimpleObject Y) : IsSemisimpleObject (X ⊞ Y) := sorry

end Semisimple

section SemisimpleAbelian
variable {C : Type u} [Category.{v} C] [Abelian C]
attribute [local instance] Abelian.hasFiniteBiproducts

/-- API `IsSemisimpleObject.of_mono`: in a finite-length abelian category, a subobject of a
semisimple object is semisimple. -/
theorem IsSemisimpleObject.of_mono {X Y : C} (f : X ⟶ Y) [Mono f] [IsArtinianObject Y]
    [IsNoetherianObject Y] (hY : IsSemisimpleObject Y) : IsSemisimpleObject X := sorry

/-- API `isSemisimpleObject_iff_socle`: a finite-length object is semisimple iff every subobject
has a complement in the subobject lattice (equivalently it is the sum of its simple subobjects). -/
theorem isSemisimpleObject_iff_socle (X : C) [IsArtinianObject X] [IsNoetherianObject X] :
    IsSemisimpleObject X ↔ ∀ A : Subobject X, ∃ B : Subobject X, A ⊓ B = ⊥ ∧ A ⊔ B = ⊤ := sorry

end SemisimpleAbelian

/-- Test `isSemisimpleObject_zero`. -/
example {C : Type u} [Category.{v} C] [Preadditive C] [HasFiniteBiproducts C] (X : C)
    (hX : IsZero X) : IsSemisimpleObject X := sorry

/-- Test `isSemisimpleObject_moduleCat_field`: finite-dimensional vector spaces are semisimple
objects of `ModuleCat K`, agreeing with Mathlib's `IsSemisimpleModule`. -/
example (K : Type u) [Field K] (V : ModuleCat.{u} K) [FiniteDimensional K V] :
    IsSemisimpleObject V ∧ IsSemisimpleModule K V := sorry

/-- Test `not_isSemisimpleObject_unipotent`: the `ℚ[X]`-module `ℚ[X]/(X - 1)²` (one unipotent
Jordan block) is not a semisimple object. -/
example : ¬ IsSemisimpleObject
    (ModuleCat.of (Polynomial ℚ)
      (Polynomial ℚ ⧸ Ideal.span {(Polynomial.X - 1 : Polynomial ℚ) ^ 2})) := sorry

section SplittingLemma
variable {C : Type u} [Category.{v} C] [Abelian C]

/-- The simple subquotients of `X` all satisfy `P`: for subobjects `A ≤ B` with `B / A` simple,
`P (B / A)`. -/
def SimpleSubquotientsIn (P : C → Prop) (X : C) : Prop :=
  ∀ (A B : Subobject X) (h : A ≤ B), Simple (cokernel (Subobject.ofLE A B h)) →
    P (cokernel (Subobject.ofLE A B h))

/-- Node `EDC.7/torsion-theory-splitting-lemma` (BBD Lemme 5.3.6): for a partition of the simple
objects into `P` and `¬ P` with every extension of a `¬ P`-simple by a `P`-simple split, every
finite-length object has a unique subobject with all simple subquotients in `¬ P` and quotient
with all simple subquotients in `P`. -/
theorem exists_unique_torsion_subobject (P : C → Prop)
    (hP : ∀ {X Y : C}, Nonempty (X ≅ Y) → (P X ↔ P Y))
    (hsplit : ∀ S : ShortComplex C, S.ShortExact → Simple S.X₁ → Simple S.X₃ → P S.X₁ →
      ¬ P S.X₃ → Nonempty S.Splitting)
    (F : C) [IsArtinianObject F] [IsNoetherianObject F] :
    ∃! W : Subobject F, SimpleSubquotientsIn (fun Z => ¬ P Z) (W : C) ∧
      SimpleSubquotientsIn P (cokernel W.arrow) := sorry

end SplittingLemma

end TauCeti.EtaleDuality

namespace TauCeti

section Similitude
variable {F : Type u} [Field F] {V W : Type v} [AddCommGroup V] [Module F V] [FiniteDimensional F V]
  [AddCommGroup W] [Module F W] [FiniteDimensional F W]

/-- Node `EDC.8/similitude-charpoly-reciprocity`: if `⟨φ v, ψ w⟩ = c ⟨v, w⟩` for a perfect pairing,
then `ψ = c (φ^∨)⁻¹` and `charpoly ψ = det(φ)⁻¹ (-c)^b · reverse(charpoly φ)(X / c)`; equivalently
`det(1 - tψ) = det(φ)⁻¹ det(φ - ct)`. No semisimplicity is assumed. Compare
`Matrix.charpoly_transpose`, `LinearMap.det_dualMap` and `Matrix.charpoly_inv`. -/
theorem similitude_charpoly_reciprocity (B : V →ₗ[F] W →ₗ[F] F) [B.IsPerfPair]
    (φ : V →ₗ[F] V) (ψ : W →ₗ[F] W) (c : F) (hc : c ≠ 0) (hφ : LinearMap.det φ ≠ 0)
    (h : ∀ v w, B (φ v) (ψ w) = c * B v w) :
    LinearMap.charpoly ψ =
      Polynomial.C ((-c) ^ Module.finrank F V * (LinearMap.det φ)⁻¹) *
        (LinearMap.charpoly φ).reverse.comp (Polynomial.C c⁻¹ * Polynomial.X) := sorry

/-- The determinant part: `det ψ = c^b det(φ)⁻¹`. -/
theorem similitude_det (B : V →ₗ[F] W →ₗ[F] F) [B.IsPerfPair]
    (φ : V →ₗ[F] V) (ψ : W →ₗ[F] W) (c : F) (hφ : LinearMap.det φ ≠ 0)
    (h : ∀ v w, B (φ v) (ψ w) = c * B v w) :
    LinearMap.det ψ = c ^ Module.finrank F V * (LinearMap.det φ)⁻¹ := sorry

/-- Acceptance (rank one): `φ = α`, `ψ = c/α` on `F` with the multiplication pairing. -/
example (α c : F) (hα : α ≠ 0) (hc : c ≠ 0) :
    LinearMap.charpoly ((c / α) • (LinearMap.id : F →ₗ[F] F)) =
      Polynomial.C ((-c) * α⁻¹) *
        (Polynomial.X - Polynomial.C α).reverse.comp (Polynomial.C c⁻¹ * Polynomial.X) := sorry

end Similitude

section FormSimilitude
variable {F : Type u} [Field F] {V : Type v} [AddCommGroup V] [Module F V] [FiniteDimensional F V]

/-- Node `EDC.8/form-similitude-determinant` (b): `det(φ)² = c^b` for a similitude of a
nondegenerate bilinear form. The case `c = 1` is Tau Ceti's
`TauCeti.BilinForm.IsIsometry.det_sq_mul_det_toMatrix_self`. -/
theorem form_similitude_det_sq (B : LinearMap.BilinForm F V) (hB : B.Nondegenerate)
    (φ : V →ₗ[F] V) (c : F) (h : ∀ x y, B (φ x) (φ y) = c * B x y) :
    LinearMap.det φ ^ 2 = c ^ Module.finrank F V := sorry

/-- Node `EDC.8/form-similitude-determinant` (c): alternating case, `char F ≠ 2`: `b` is even and
`det φ = c^(b/2)`; the rank-two case is Tau Ceti's
`LinearMap.det_eq_of_compl₁₂_self_eq_smul`. -/
theorem form_similitude_det_alt (h2 : (2 : F) ≠ 0) (B : LinearMap.BilinForm F V)
    (hB : B.Nondegenerate) (halt : B.IsAlt) (φ : V →ₗ[F] V) (c : F)
    (h : ∀ x y, B (φ x) (φ y) = c * B x y) :
    Even (Module.finrank F V) ∧ LinearMap.det φ = c ^ (Module.finrank F V / 2) := sorry

/-- Node `EDC.8/form-similitude-determinant` (d): symmetric case with `s² = c` in `F`:
`det φ = (-1)^{m₋} s^b`, `m₋` the dimension of the generalized `(-s)`-eigenspace. -/
theorem form_similitude_det_symm (h2 : (2 : F) ≠ 0) (B : LinearMap.BilinForm F V)
    (hB : B.Nondegenerate) (hsymm : B.IsSymm) (φ : V →ₗ[F] V) (c s : F) (hs : s * s = c)
    (h : ∀ x y, B (φ x) (φ y) = c * B x y) :
    LinearMap.det φ =
      (-1) ^ Module.finrank F (Module.End.maxGenEigenspace φ (-s)) * s ^ Module.finrank F V := sorry

/-- Acceptance: symmetric rank one, `φ = -s` with `⟨x, y⟩ = xy`: `det φ = -s`. -/
example (s : F) : LinearMap.det ((-s) • (LinearMap.id : F →ₗ[F] F)) = -s := sorry

end FormSimilitude

/-! EDC.8/poincare-reciprocity-export, stated using families of native vector spaces.
The geometric construction of this family and the full GradedFrobeniusDuality API are reader
specifications. The definitions below are only the two finite numerical expressions. -/

section GradedDeterminants
variable {E : Type u} [Field E]

/-- The bounded Euler sum uses integer degrees, with no truncated natural subtraction. -/
def gradedEulerChar (d : ℕ) (b : ℤ → ℕ) : ℤ :=
  ∑ i ∈ Finset.Icc (0 : ℤ) (2 * (d : ℤ)), (-1 : ℤ) ^ i.toNat * (b i : ℤ)

variable (H : ℤ → Type v) [∀ i, AddCommGroup (H i)] [∀ i, Module E (H i)]
  [∀ i, FiniteDimensional E (H i)]

/-- The alternating product of Frobenius determinants, in the unit group. -/
def gradedDelta (d : ℕ) (F : ∀ i, H i ≃ₗ[E] H i) : Eˣ :=
  ∏ i ∈ Finset.Icc (0 : ℤ) (2 * (d : ℤ)), LinearEquiv.det (F i) ^ ((-1 : ℤ) ^ i.toNat)

/-- End determinant identity: perfect complementary pairings and factor q^d imply Δ²=q^(dχ).
No Frobenius semisimplicity is assumed. -/
theorem graded_delta_sq (d : ℕ) (q : Eˣ) (F : ∀ i, H i ≃ₗ[E] H i)
    (B : ∀ i, H i →ₗ[E] H (2 * (d : ℤ) - i) →ₗ[E] E)
    (hB : ∀ i, (B i).IsPerfPair)
    (hsim : ∀ i (x : H i) (y : H (2 * (d : ℤ) - i)),
      B i (F i x) (F (2 * (d : ℤ) - i) y) = (q : E) ^ d * B i x y) :
    gradedDelta H d F ^ 2 = q ^ ((d : ℤ) * gradedEulerChar d (fun i => Module.finrank E (H i))) := sorry

/-- Even-dimensional middle cohomology: the magnitude is q^((d/2)·b), valid also for odd b. -/
theorem even_middle_det [CharZero E] (d : ℕ) (hd : Even d) (q : Eˣ)
    (B : LinearMap.BilinForm E (H d)) (hB : B.Nondegenerate) (hsymm : B.IsSymm)
    (F : H d ≃ₗ[E] H d)
    (hsim : ∀ x y, B (F x) (F y) = (q : E) ^ d * B x y) :
    LinearMap.det F.toLinearMap =
      (-1) ^ Module.finrank E (Module.End.maxGenEigenspace F.toLinearMap (-((q : E) ^ (d / 2)))) *
        (q : E) ^ ((d / 2) * Module.finrank E (H d)) := sorry

/-- Odd-dimensional middle cohomology: Koszul antisymmetry gives an alternating perfect form. -/
theorem odd_middle_det [CharZero E] (d : ℕ) (hd : Odd d) (q : Eˣ)
    (B : LinearMap.BilinForm E (H d)) (hB : B.Nondegenerate)
    (hskew : ∀ x y, B y x = (-1 : E) ^ d * B x y)
    (F : H d ≃ₗ[E] H d)
    (hsim : ∀ x y, B (F x) (F y) = (q : E) ^ d * B x y) :
    Even (Module.finrank E (H d)) ∧
      LinearMap.det F.toLinearMap = (q : E) ^ (d * Module.finrank E (H d) / 2) := sorry

end GradedDeterminants

/-- Diagnostic Euler computation for projective-line Betti numbers. -/
example : gradedEulerChar 1 (fun i => if i = 0 ∨ i = 2 then 1 else 0) = 2 := sorry

/-- Diagnostic odd-rank magnitude: dimension one must retain s rather than c^(1/2 truncated). -/
example (s : ℚ) : s ^ (1 : ℕ) = s := by simp

end TauCeti
