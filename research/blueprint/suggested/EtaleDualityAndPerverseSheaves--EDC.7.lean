/-
Suggested Lean forms for EtaleDualityAndPerverseSheaves, layers EDC.7 (pure perverse sheaves,
weights and the decomposition theorem) and EDC.8 (cohomological correspondences, trace formulas
and the functional-equation interface).

This file is not the roadmap and is not exhaustive: the roadmap document
(research/blueprint/readmes/EtaleDualityAndPerverseSheaves--EDC.7.md) is definitive. The
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every proof is `sorry`. Abstract statements (semisimple objects, the splitting
lemma, graded Lefschetz objects, similitude linear algebra, graded Frobenius duality data) are
stated against Mathlib directly. Geometric carriers that other layers own (constructible and
mixed complexes, perverse sheaves, the six operations, Frobenius eigenvalues on stalks) appear
as stand-ins marked with their supplier; every predicate defined here has a real body.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. This file imports Mathlib only; the Tau Ceti
declarations it is compared with are cited in comments.
-/
import Mathlib.CategoryTheory.Abelian.Basic
import Mathlib.Algebra.Homology.ShortComplex.ShortExact
import Mathlib.CategoryTheory.Simple
import Mathlib.CategoryTheory.Subobject.ArtinianObject
import Mathlib.CategoryTheory.Subobject.NoetherianObject
import Mathlib.CategoryTheory.Subobject.Lattice
import Mathlib.CategoryTheory.Limits.Shapes.Biproducts
import Mathlib.CategoryTheory.Limits.Shapes.Kernels
import Mathlib.CategoryTheory.Triangulated.TStructure.Heart
import Mathlib.CategoryTheory.Triangulated.Pretriangulated
import Mathlib.CategoryTheory.Linear.Basic
import Mathlib.CategoryTheory.Comma.Over.Basic
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Category.ModuleCat.Biproducts
import Mathlib.RingTheory.SimpleModule.Basic
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.Charpoly.Coeff
import Mathlib.LinearAlgebra.Matrix.Permutation
import Mathlib.LinearAlgebra.Determinant
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.LinearAlgebra.PerfectPairing.Basic
import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.LinearAlgebra.Trace
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.FiniteType
import Mathlib.AlgebraicGeometry.Morphisms.Separated
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.AlgebraicGeometry.Morphisms.QuasiFinite
import Mathlib.AlgebraicGeometry.IdealSheaf.Functorial
import Mathlib.AlgebraicGeometry.ResidueField
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.Analysis.Complex.Basic

noncomputable section
set_option linter.unusedSectionVars false
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false
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

namespace TauCeti.EtaleDuality

section GradedLefschetz
variable {C : Type u} [Category.{v} C] [Abelian C] (T : C ⥤ C)

/-- The `n`-th power of the twist functor, with `(n + 1) = T ⋙ (n)`, so that
`(tw (n+1)).obj X = (tw n).obj (T.obj X)` definitionally. -/
def tw : ℕ → C ⥤ C
  | 0 => 𝟭 C
  | n + 1 => T ⋙ tw n

/-- Node `EDC.7/graded-lefschetz-object`, API `GradedLefschetz`: objects `L i` for `i : ℤ`, zero
outside `[-N, N]`, and `η i : L i ⟶ T (L (i + 2))`. -/
structure GradedLefschetz where
  L : ℤ → C
  bound : ℕ
  zero_outside : ∀ i : ℤ, (bound : ℤ) < |i| → IsZero (L i)
  eta : ∀ i : ℤ, L i ⟶ T.obj (L (i + 2))

namespace GradedLefschetz
variable {T} (G : GradedLefschetz T)

/-- API `GradedLefschetz.etaPow`: `η^r : L i ⟶ T^r (L (i + 2r))`. -/
def etaPow (i : ℤ) : (r : ℕ) → (G.L i ⟶ (tw T r).obj (G.L (i + 2 * r)))
  | 0 => eqToHom (by simp [tw])
  | r + 1 => etaPow i r ≫ (tw T r).map (G.eta (i + 2 * r)) ≫
      eqToHom (by
        show (tw T r).obj (T.obj (G.L (i + 2 * ↑r + 2))) = (tw T r).obj (T.obj (G.L (i + 2 * ↑(r + 1))))
        congr 3
        push_cast
        ring)

/-- API `GradedLefschetz.etaPow_zero`. -/
theorem etaPow_zero (i : ℤ) : G.etaPow i 0 = eqToHom (by simp [tw]) := sorry

/-- API `GradedLefschetz.etaPow_succ`. -/
theorem etaPow_succ (i : ℤ) (r : ℕ) :
    G.etaPow i (r + 1) = G.etaPow i r ≫ (tw T r).map (G.eta (i + 2 * r)) ≫
      eqToHom (by
        show (tw T r).obj (T.obj (G.L (i + 2 * ↑r + 2))) = (tw T r).obj (T.obj (G.L (i + 2 * ↑(r + 1))))
        congr 3
        push_cast
        ring) := sorry

/-- API `GradedLefschetz.HardLefschetz`: every `η^r : L (-r) ⟶ T^r (L r)` is an isomorphism. -/
def HardLefschetz : Prop := ∀ r : ℕ, IsIso (G.etaPow (-(r : ℤ)) r)

/-- API `GradedLefschetz.primitive`: `P^{-r} := ker (η^{r+1} : L (-r) ⟶ T^{r+1} L (r + 2))`. -/
def primitive (r : ℕ) : C := kernel (G.etaPow (-(r : ℤ)) (r + 1))

/-- The inclusion `P^{-r} ⟶ L (-r)`. -/
def primitiveι (r : ℕ) : G.primitive r ⟶ G.L (-(r : ℤ)) := kernel.ι _

/-- API `GradedLefschetz.primitive_eq_top`: if `L (r + 2) = 0` the primitive part is all of
`L (-r)`. -/
theorem primitive_eq_top (r : ℕ) (h : IsZero (G.L (-(r : ℤ) + 2 * ((r + 1 : ℕ) : ℤ)))) :
    IsIso (G.primitiveι r) := sorry

/-- Morphisms of graded Lefschetz objects. -/
structure Hom (G H : GradedLefschetz T) where
  f : ∀ i, G.L i ⟶ H.L i
  comm : ∀ i, G.eta i ≫ T.map (f (i + 2)) = f i ≫ H.eta i

/-- API `GradedLefschetz.map`: induced maps on primitive parts. -/
def map {G H : GradedLefschetz T} (φ : Hom G H) (r : ℕ) : G.primitive r ⟶ H.primitive r := sorry

/-- The map from the biproduct of primitive string columns into `L (-r)`: on the `a`-th summand,
`η^a` (twisted back) composed with the primitive inclusion. Its target is twisted by `T^a`; the
untwisting uses a chosen inverse autoequivalence, so the column map is stated after `T^a`. -/
def stringColumn (r a : ℕ) :
    G.primitive (r + 2 * a) ⟶ (tw T a).obj (G.L (-((r + 2 * a : ℕ) : ℤ) + 2 * a)) :=
  G.primitiveι (r + 2 * a) ≫ G.etaPow (-((r + 2 * a : ℕ) : ℤ)) a

/-- Node `EDC.7/abstract-primitive-decomposition`: under hard Lefschetz each `η` out of
`L (-r - 2)` is a monomorphism and `L (-r)` splits as the primitive part plus the image of `η`
(the full string decomposition follows by induction). -/
theorem abstract_primitive_decomposition (hG : G.HardLefschetz) (r : ℕ) :
    Mono (G.eta (-(r : ℤ) - 2)) ∧
      Nonempty (G.L (-(r : ℤ)) ≅ G.primitive r ⊞ G.L (-(r : ℤ) - 2)) := sorry

end GradedLefschetz

/-- Test `gradedLefschetz_zero_hardLefschetz`: the zero graded object satisfies hard Lefschetz. -/
example (Z : C) (hZ : IsZero Z) (hT : ∀ X, IsZero X → IsZero (T.obj X)) :
    (GradedLefschetz.mk (T := T) (fun _ => Z) 0 (fun _ _ => hZ)
      (fun _ => hZ.to_ _)).HardLefschetz := sorry

/-- Test `gradedLefschetz_zero_eta_not_HL`: `L (-1) = L 1 = X ≠ 0` with `η = 0` and `T = 𝟭` is not
hard Lefschetz. -/
example (X Z : C) (hX : ¬ IsZero X) (hZ : IsZero Z) :
    ¬ (GradedLefschetz.mk (T := 𝟭 C)
      (fun i => if i = -1 ∨ i = 1 then X else Z) 1 (fun i hi => by
        have : ¬ (i = -1 ∨ i = 1) := by
          rintro (h | h) <;> subst h <;> simp at hi
        simpa [this] using hZ)
      (fun _ => 0)).HardLefschetz := sorry

end GradedLefschetz

/-- Test `gradedLefschetz_projectiveSpace`: the cohomology of `ℙⁿ` with `η` the identity
(trivial twist, `L i = K` for `i ≡ n mod 2`, `|i| ≤ n`) satisfies hard Lefschetz and its only
nonzero primitive part is `P^{-n}`. Stated for `n = 1` with vector spaces. -/
example (K : Type u) [Field K] :
    (GradedLefschetz.mk (T := 𝟭 (ModuleCat.{u} K))
      (fun i => if i = -1 ∨ i = 1 then ModuleCat.of K K else ModuleCat.of K PUnit) 1
      (fun i hi => by
        have : ¬ (i = -1 ∨ i = 1) := by
          rintro (h | h) <;> subst h <;> simp at hi
        simp only [this, ↓reduceIte]
        exact ModuleCat.isZero_of_subsingleton _)
      (fun i => if h : i = -1 then eqToHom (by subst h; simp) else 0)).HardLefschetz := sorry

/-- Test `gradedLefschetz_vectorSpace_compat`: for vector spaces with trivial twist,
`HardLefschetz` is the bijectivity hypothesis of
DeligneWeightsAndPurity DWP.9/lefschetz-decomposition-of-a-graded-operator. -/
example (K : Type u) [Field K] (G : GradedLefschetz (𝟭 (ModuleCat.{u} K))) :
    G.HardLefschetz ↔ ∀ r : ℕ, Function.Bijective (G.etaPow (-(r : ℤ)) r).hom := sorry

end TauCeti.EtaleDuality

/-! ## EDC.8 — the functional-equation interface (linear algebra, stated against Mathlib) -/

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

/-- Node `EDC.8/graded-frobenius-duality-datum`, API `GradedFrobeniusDuality`: graded spaces
`H i` (zero above `2d`), Frobenius automorphisms `F i`, perfect pairings `H i × H j → E` for
`i + j = 2d`, similitude factor `q^d` and the Koszul sign `(-1)^i`. -/
structure GradedFrobeniusDuality (E : Type u) [Field E] where
  d : ℕ
  q : Eˣ
  H : ℕ → ModuleCat.{u} E
  finite : ∀ i, Module.Finite E (H i)
  vanish : ∀ i, 2 * d < i → Subsingleton (H i)
  F : ∀ i, H i ≃ₗ[E] H i
  pair : ∀ i j, i + j = 2 * d → H i →ₗ[E] H j →ₗ[E] E
  perfect : ∀ i j (h : i + j = 2 * d), (pair i j h).IsPerfPair
  similitude : ∀ i j (h : i + j = 2 * d) (x : H i) (y : H j),
    pair i j h (F i x) (F j y) = (q : E) ^ d * pair i j h x y
  koszul : ∀ i j (h : i + j = 2 * d) (h' : j + i = 2 * d) (x : H i) (y : H j),
    pair j i h' y x = (-1) ^ i * pair i j h x y

attribute [instance] GradedFrobeniusDuality.finite

namespace GradedFrobeniusDuality
variable {E : Type u} [Field E] (D : GradedFrobeniusDuality E)

/-- API `GradedFrobeniusDuality.betti`. -/
def betti (i : ℕ) : ℕ := Module.finrank E (D.H i)

/-- API `GradedFrobeniusDuality.eulerChar`. -/
def eulerChar : ℤ := ∑ i ∈ Finset.range (2 * D.d + 1), (-1) ^ i * (D.betti i : ℤ)

/-- API `GradedFrobeniusDuality.frobPoly`: `P_i(t) = det(1 - t F_i)`, the reverse of the
characteristic polynomial (`Matrix.reverse_charpoly`). -/
def frobPoly (i : ℕ) : Polynomial E := (LinearMap.charpoly (D.F i).toLinearMap).reverse

/-- API `GradedFrobeniusDuality.delta`: `Δ = ∏ det(F_i)^{(-1)^i}`. -/
def delta : Eˣ := ∏ i ∈ Finset.range (2 * D.d + 1), (LinearEquiv.det (D.F i)) ^ ((-1 : ℤ) ^ i)

/-- API `GradedFrobeniusDuality.betti_symm`. -/
theorem betti_symm (i : ℕ) (hi : i ≤ 2 * D.d) : D.betti i = D.betti (2 * D.d - i) := sorry

/-- API `GradedFrobeniusDuality.middle_symm`: the middle form is `(-1)^d`-symmetric. -/
theorem middle_symm (x y : D.H D.d) :
    D.pair D.d D.d (by ring) x y = (-1) ^ D.d * D.pair D.d D.d (by ring) y x := sorry

/-- Node `EDC.8/poincare-reciprocity-export` (b): reciprocity of characteristic polynomials. -/
theorem charpoly_reciprocity (i : ℕ) (hi : i ≤ 2 * D.d) :
    LinearMap.charpoly (D.F (2 * D.d - i)).toLinearMap =
      Polynomial.C ((-(D.q : E) ^ D.d) ^ D.betti i * (LinearMap.det (D.F i).toLinearMap)⁻¹) *
        (LinearMap.charpoly (D.F i).toLinearMap).reverse.comp
          (Polynomial.C ((D.q : E) ^ D.d)⁻¹ * Polynomial.X) := sorry

/-- Node `EDC.8/poincare-reciprocity-export` (c). -/
theorem det_mul_det (i : ℕ) (hi : i ≤ 2 * D.d) :
    LinearMap.det (D.F i).toLinearMap * LinearMap.det (D.F (2 * D.d - i)).toLinearMap =
      (D.q : E) ^ (D.d * D.betti i) := sorry

/-- Node `EDC.8/poincare-reciprocity-export` (d), `d` odd. -/
theorem det_middle_odd (hd : Odd D.d) :
    Even (D.betti D.d) ∧
      LinearMap.det (D.F D.d).toLinearMap = (D.q : E) ^ (D.d * D.betti D.d / 2) := sorry

/-- Node `EDC.8/poincare-reciprocity-export` (d), `d` even: the sign is `(-1)^{m₋}` with `m₋`
the algebraic multiplicity of `-q^{d/2}`. -/
theorem det_middle_even [CharZero E] (hd : Even D.d) :
    LinearMap.det (D.F D.d).toLinearMap =
      (-1) ^ Module.finrank E
          (Module.End.maxGenEigenspace (D.F D.d).toLinearMap (-((D.q : E) ^ (D.d / 2)))) *
        (D.q : E) ^ (D.d * D.betti D.d / 2) := sorry

/-- Node `EDC.8/poincare-reciprocity-export` (e): `Δ² = q^{dχ}` and `dχ` is even. -/
theorem delta_sq : D.delta ^ 2 = D.q ^ ((D.d : ℤ) * D.eulerChar) := sorry

theorem even_d_mul_eulerChar [CharZero E] : Even ((D.d : ℤ) * D.eulerChar) := sorry

/-- Test `TauCeti.GradedFrobeniusDuality.zero_dim_point`. -/
example (hd : D.d = 0) (h0 : D.betti 0 = 1) (hF : D.F 0 = LinearEquiv.refl E (D.H 0)) :
    D.eulerChar = 1 ∧ D.delta = 1 := sorry

/-- Test `TauCeti.GradedFrobeniusDuality.projectiveLine`. -/
example (hd : D.d = 1) (h0 : D.betti 0 = 1) (h1 : D.betti 1 = 0) (h2 : D.betti 2 = 1)
    (hF : D.F 0 = LinearEquiv.refl E (D.H 0)) :
    D.eulerChar = 2 ∧ D.delta = LinearEquiv.det (D.F 2) ∧ D.delta ^ 2 = D.q ^ (2 : ℤ) := sorry

/-- Test `TauCeti.GradedFrobeniusDuality.not_datum_wrong_factor`: with `F = id` on `E` and the
multiplication pairing, the similitude condition with factor `q ≠ 1` fails. -/
example (q : Eˣ) (hq : (q : E) ≠ 1) :
    ¬ ∀ x y : E, x * y = (q : E) ^ 1 * (x * y) := sorry

/-- Test `TauCeti.GradedFrobeniusDuality.curve_betti_even`. -/
example [CharZero E] (hd : D.d = 1) : Even (D.betti 1) := sorry

end GradedFrobeniusDuality

end TauCeti

/-! ## Geometric carriers

Stand-ins for objects owned by other layers: EDC.0–EDC.1 (constructible complexes and the six
operations), EDC.5 (the perverse t-structure, intermediate extension, intersection complexes),
EDC.6 (adic coefficients and base change), DeligneWeightsAndPurity DWP.8 (mixed complexes) and
CohomologicalPointCounting TraceFormula (Frobenius eigenvalues on stalks). They carry no
mathematical content of their own; every predicate below has a real body over them. -/

namespace TauCeti.EtaleDuality
open AlgebraicGeometry

section Carriers
variable (k : Type u) [Field k]

/-- Separated schemes of finite type over `k`, as objects over `Spec k`. -/
def finiteTypeSeparated : ObjectProperty (Over (Spec (CommRingCat.of k))) :=
  fun X => LocallyOfFiniteType X.hom ∧ QuasiCompact X.hom ∧ IsSeparated X.hom

/-- The base category of geometric objects. -/
abbrev Geo := (finiteTypeSeparated k).FullSubcategory

variable {k}
abbrev Geo.space (X : Geo k) : Scheme.{u} := X.obj.left
abbrev Geo.map {X Y : Geo k} (f : X ⟶ Y) : X.space ⟶ Y.space := f.hom.left

/-- Closed points of a scheme of finite type over `k`. -/
def ClosedPoint (X : Geo k) : Type u := {x : X.space // IsClosed ({x} : Set X.space)}

/-- The cardinality of the residue field at a closed point (finite over a finite field). -/
def residueCard {X : Geo k} (x : ClosedPoint X) : ℕ := Nat.card (X.space.residueField x.1)

/-- Stand-in (SchemeAndStackFoundations SF.0): extension of the base field. -/
def extendBase (k' : Type u) [Field k'] [Algebra k k'] (X : Geo k) : Geo k' := sorry

/-- Stand-in (SF.0): the point `Spec k`, and equalizers and products in `Geo k`. -/
def point (k : Type u) [Field k] : Geo k := sorry
def Geo.equalizer {X Y : Geo k} (f g : X ⟶ Y) : Geo k := sorry
def Geo.equalizerι {X Y : Geo k} (f g : X ⟶ Y) : Geo.equalizer f g ⟶ X := sorry
lemma Geo.equalizer_isLimit {X Y : Geo k} (f g : X ⟶ Y) :
    Nonempty ((Geo.equalizer f g).space ≅ Limits.equalizer (Geo.map f) (Geo.map g)) := sorry

variable (E : Type u) [Field E] [CharZero E]

/-- Stand-in (EDC.0, EDC.6): bounded constructible complexes with coefficients `E`. -/
def Dbc (E : Type u) [Field E] [CharZero E] (X : Geo k) : Type (u + 1) := sorry
instance (X : Geo k) : Category.{u} (Dbc E X) := sorry
instance (X : Geo k) : Preadditive (Dbc E X) := sorry
instance (X : Geo k) : Linear E (Dbc E X) := sorry
instance (X : Geo k) : HasZeroObject (Dbc E X) := sorry
instance (X : Geo k) : HasFiniteBiproducts (Dbc E X) := sorry
instance (X : Geo k) : HasShift (Dbc E X) ℤ := sorry
instance (X : Geo k) (n : ℤ) : (shiftFunctor (Dbc E X) n).Additive := sorry
instance (X : Geo k) : Pretriangulated (Dbc E X) := sorry

/-- Stand-in (EDC.5/middle-perverse-t-structure). -/
def perverseTStructure (X : Geo k) : Triangulated.TStructure (Dbc E X) := sorry

/-- Perverse sheaves: the heart of the perverse t-structure (EDC.5/perverse-sheaf-category). -/
abbrev PerverseSheaf (X : Geo k) := (perverseTStructure E X).heart.FullSubcategory
instance (X : Geo k) : Abelian (PerverseSheaf E X) := sorry
instance (X : Geo k) : HasFiniteBiproducts (PerverseSheaf E X) := sorry
instance (X : Geo k) : HasBinaryBiproducts (PerverseSheaf E X) := sorry

variable {E}
/-- Stand-ins (EDC.0–EDC.1, EDC.5): operations, Tate twist, duality, perverse cohomology. -/
def pullback {X Y : Geo k} (f : X ⟶ Y) : Dbc E Y ⥤ Dbc E X := sorry
def pushforward {X Y : Geo k} (f : X ⟶ Y) : Dbc E X ⥤ Dbc E Y := sorry
def lowerShriek {X Y : Geo k} (f : X ⟶ Y) : Dbc E X ⥤ Dbc E Y := sorry
def upperShriek {X Y : Geo k} (f : X ⟶ Y) : Dbc E Y ⥤ Dbc E X := sorry
def verdierDual (X : Geo k) : (Dbc E X)ᵒᵖ ⥤ Dbc E X := sorry
def tateTwist (X : Geo k) (r : ℤ) : Dbc E X ⥤ Dbc E X := sorry
def constantSheaf (X : Geo k) : Dbc E X := sorry
def perverseCohomology {X : Geo k} (n : ℤ) : Dbc E X ⥤ PerverseSheaf E X := sorry
def perverseTwist (X : Geo k) (r : ℤ) : PerverseSheaf E X ⥤ PerverseSheaf E X := sorry
def perverseDual (X : Geo k) : (PerverseSheaf E X)ᵒᵖ ⥤ PerverseSheaf E X := sorry
def intermediateExtension {U X : Geo k} (j : U ⟶ X) : PerverseSheaf E U ⥤ PerverseSheaf E X := sorry

/-- Stand-in (EDC.6): extension of scalars of the base field on constructible complexes and on
perverse sheaves. -/
def baseChangeFunctor (k' : Type u) [Field k'] [Algebra k k'] (X : Geo k) :
    Dbc E X ⥤ Dbc E (extendBase k' X) := sorry
def perverseBaseChange (k' : Type u) [Field k'] [Algebra k k'] (X : Geo k) :
    PerverseSheaf E X ⥤ PerverseSheaf E (extendBase k' X) := sorry

/-- Stand-in (EDC.0 geometric stalks with TraceFormula's geometric Frobenius): the eigenvalues,
with multiplicity, of the geometric Frobenius of `x` on `ℋ^i(K)_x̄`. -/
def frobEigenvalues {X : Geo k} (x : ClosedPoint X) (i : ℤ) (K : Dbc E X) : Multiset E := sorry

/-- An algebraic number all of whose complex conjugates `σ α` satisfy `|σ α|² ≤ N^w`. -/
def IsWeightAtMost (N : ℕ) (w : ℤ) (α : E) : Prop :=
  IsAlgebraic ℚ α ∧ ∀ σ : E →+* ℂ, ‖σ α‖ ^ 2 ≤ (N : ℝ) ^ w

variable (E)
/-- Stand-in (DeligneWeightsAndPurity DWP.8/mixed-complexes): the full triangulated
subcategory of mixed complexes, with its inclusion and duality. -/
def Dbm (E : Type u) [Field E] [CharZero E] (X : Geo k) : Type (u + 1) := sorry
instance (X : Geo k) : Category.{u} (Dbm E X) := sorry
instance (X : Geo k) : Preadditive (Dbm E X) := sorry
instance (X : Geo k) : HasZeroObject (Dbm E X) := sorry
instance (X : Geo k) : HasShift (Dbm E X) ℤ := sorry
instance (X : Geo k) (n : ℤ) : (shiftFunctor (Dbm E X) n).Additive := sorry
instance (X : Geo k) : Pretriangulated (Dbm E X) := sorry
def Dbm.incl (X : Geo k) : Dbm E X ⥤ Dbc E X := sorry
instance (X : Geo k) : (Dbm.incl E X).Full := sorry
instance (X : Geo k) : (Dbm.incl E X).Faithful := sorry
def Dbm.dual (X : Geo k) : (Dbm E X)ᵒᵖ ⥤ Dbm E X := sorry
variable {E}

/-- Weights `≤ w` (DWP.8): every Frobenius eigenvalue on `ℋ^i` at a closed point is an algebraic
number with all conjugates of absolute value at most `N(x)^{(w+i)/2}`. -/
def HasWeightsLE {X : Geo k} (K : Dbm E X) (w : ℤ) : Prop :=
  ∀ (x : ClosedPoint X) (i : ℤ), ∀ α ∈ frobEigenvalues x i ((Dbm.incl E X).obj K),
    IsWeightAtMost (residueCard x) (w + i) α

/-- Weights `≥ w`: the Verdier dual has weights `≤ -w`. -/
def HasWeightsGE {X : Geo k} (K : Dbm E X) (w : ℤ) : Prop :=
  HasWeightsLE ((Dbm.dual E X).obj (Opposite.op K)) (-w)

/-- Pure of weight `w`. -/
def IsPure {X : Geo k} (K : Dbm E X) (w : ℤ) : Prop := HasWeightsLE K w ∧ HasWeightsGE K w

end Carriers

/-! ## EDC.7 — mixed perverse sheaves and weights -/

section MixedPerverse
variable {k : Type u} [Field k] {E : Type u} [Field E] [CharZero E]
variable (E)

/-- Node `EDC.7/mixed-perverse-sheaves`, API `mixedTStructure`: the perverse t-structure restricted
to mixed complexes (stand-in for the restriction, whose existence is BBD 5.1.7(i)). -/
def mixedTStructure (X : Geo k) : Triangulated.TStructure (Dbm E X) := by
  exact sorry

/-- API `MixedPerverseSheaf`: the heart of `mixedTStructure`. -/
abbrev MixedPerverseSheaf (X : Geo k) := (mixedTStructure E X).heart.FullSubcategory

variable {E}
/-- API `MixedPerverseSheaf.abelian`. -/
instance MixedPerverseSheaf.abelian (X : Geo k) : Abelian (MixedPerverseSheaf E X) := sorry

/-- The underlying perverse sheaf (exact, fully faithful). -/
def MixedPerverseSheaf.toPerverse (X : Geo k) : MixedPerverseSheaf E X ⥤ PerverseSheaf E X := sorry

/-- The underlying mixed complex. -/
def MixedPerverseSheaf.toDbm (X : Geo k) : MixedPerverseSheaf E X ⥤ Dbm E X :=
  (mixedTStructure E X).heart.ι

/-- API `MixedPerverseSheaf.HasWeightsLE`. -/
def MixedPerverseSheaf.HasWeightsLE {X : Geo k} (F : MixedPerverseSheaf E X) (w : ℤ) : Prop :=
  TauCeti.EtaleDuality.HasWeightsLE ((MixedPerverseSheaf.toDbm X).obj F) w

/-- API `MixedPerverseSheaf.IsPure`. -/
def MixedPerverseSheaf.IsPure {X : Geo k} (F : MixedPerverseSheaf E X) (w : ℤ) : Prop :=
  TauCeti.EtaleDuality.IsPure ((MixedPerverseSheaf.toDbm X).obj F) w

/-- API `MixedPerverseSheaf.of_subquotient` (BBD 5.1.7(ii)): a subobject in `Perv(X₀)` of a mixed
perverse sheaf is mixed (quotients likewise). -/
theorem MixedPerverseSheaf.of_subquotient {X : Geo k} (F : MixedPerverseSheaf E X)
    {A : PerverseSheaf E X} (f : A ⟶ (MixedPerverseSheaf.toPerverse X).obj F) [Mono f] :
    ∃ A' : MixedPerverseSheaf E X, Nonempty ((MixedPerverseSheaf.toPerverse X).obj A' ≅ A) := sorry

/-- API `MixedPerverseSheaf.of_extension`. -/
theorem MixedPerverseSheaf.of_extension {X : Geo k} (S : ShortComplex (PerverseSheaf E X))
    (hS : S.ShortExact) (A C : MixedPerverseSheaf E X)
    (hA : Nonempty ((MixedPerverseSheaf.toPerverse X).obj A ≅ S.X₁))
    (hC : Nonempty ((MixedPerverseSheaf.toPerverse X).obj C ≅ S.X₃)) :
    ∃ B : MixedPerverseSheaf E X, Nonempty ((MixedPerverseSheaf.toPerverse X).obj B ≅ S.X₂) := sorry

/-- API `perverseCohomology_mixed`: perverse cohomology of a mixed complex is mixed. -/
theorem perverseCohomology_mixed {X : Geo k} (K : Dbm E X) (n : ℤ) :
    ∃ F : MixedPerverseSheaf E X, Nonempty ((MixedPerverseSheaf.toPerverse X).obj F ≅
      (perverseCohomology n).obj ((Dbm.incl E X).obj K)) := sorry

/-- API `MixedPerverseSheaf.isPure_dual`: duality exchanges pure of weight `w` and `-w`. -/
theorem MixedPerverseSheaf.isPure_dual {X : Geo k} (K : Dbm E X) (w : ℤ)
    (h : TauCeti.EtaleDuality.IsPure K w) :
    TauCeti.EtaleDuality.IsPure ((Dbm.dual E X).obj (Opposite.op K)) (-w) := sorry

/-- API `MixedPerverseSheaf.isPure_twist`: a Tate twist `(r)` lowers weights by `2r`
(stated on the underlying complexes through the twist of `Dbc`). -/
theorem MixedPerverseSheaf.isPure_twist {X : Geo k} (K K' : Dbm E X) (w r : ℤ)
    (hK' : Nonempty ((Dbm.incl E X).obj K' ≅ (tateTwist X r).obj ((Dbm.incl E X).obj K)))
    (h : TauCeti.EtaleDuality.IsPure K w) : TauCeti.EtaleDuality.IsPure K' (w - 2 * r) := sorry

/-- Test `constantShift_isPure`: for `X₀` smooth of pure dimension `d`, `ℚ̄_ℓ[d]` is mixed perverse and
pure of weight `d`. -/
example {X : Geo k} (d : ℕ) [SmoothOfRelativeDimension d X.obj.hom] (K : Dbm E X)
    (hK : Nonempty ((Dbm.incl E X).obj K ≅ (constantSheaf X)⟦(d : ℤ)⟧)) : IsPure K d := sorry

/-- Test `zero_isPure_all`: a zero object is pure of every weight. -/
example {X : Geo k} (K : Dbm E X) (hK : IsZero ((Dbm.incl E X).obj K)) (w : ℤ) : IsPure K w := sorry

/-- Test `mixedPerverse_point_iff`: on a point over a finite field a mixed object has all
Frobenius eigenvalues algebraic Weil numbers of some integer weight. -/
example (E₀ : Type) [Field E₀] [CharZero E₀] (p a : ℕ) [Fact p.Prime]
    (K : Dbm E₀ (point (GaloisField p a))) (x : ClosedPoint (point (GaloisField p a))) (i : ℤ) :
    ∀ α : E₀, α ∈ frobEigenvalues x i ((Dbm.incl E₀ _).obj K) → IsAlgebraic ℚ α ∧
      ∃ w : ℤ, ∀ σ : E₀ →+* ℂ, ‖σ α‖ ^ 2 = (residueCard x : ℝ) ^ w := sorry

/-- Test `not_mixed_of_nonWeil_eigenvalue`: `1 + √2` is not a Weil number of any weight, since its
conjugate `1 - √2` has a different absolute value. -/
example : ¬ ∃ w : ℤ, (|1 + Real.sqrt 2| : ℝ) ^ 2 = 2 ^ w ∧ (|1 - Real.sqrt 2| : ℝ) ^ 2 = 2 ^ w := sorry

end MixedPerverse
end TauCeti.EtaleDuality

namespace TauCeti.EtaleDuality
open AlgebraicGeometry

/-! ## EDC.7 — the weight filtration, geometric semisimplicity and the decomposition theorem -/

section WeightFiltration
variable {k : Type u} [Field k] {E : Type u} [Field E] [CharZero E] {X : Geo k}

/-- Node `EDC.7/weight-filtration`, API `weightFiltration`: `W_i F₀ ⊆ F₀` (construction by BBD
5.3.5 from `exists_unique_torsion_subobject`). -/
def weightFiltration (F : MixedPerverseSheaf E X) (i : ℤ) : Subobject F := sorry

/-- API `weightFiltration_mono`. -/
theorem weightFiltration_mono (F : MixedPerverseSheaf E X) (i : ℤ) :
    weightFiltration F (i - 1) ≤ weightFiltration F i := sorry

/-- The graded piece `Gr^W_i F₀ = W_i / W_{i-1}`. -/
def weightGraded (F : MixedPerverseSheaf E X) (i : ℤ) : MixedPerverseSheaf E X :=
  cokernel (Subobject.ofLE _ _ (weightFiltration_mono F i))

/-- API `weightFiltration_eq_bot`: the filtration is finite. -/
theorem weightFiltration_eq_bot (F : MixedPerverseSheaf E X) :
    ∃ N : ℕ, (∀ i : ℤ, i < -N → weightFiltration F i = ⊥) ∧
      (∀ i : ℤ, (N : ℤ) < i → weightFiltration F i = ⊤) := sorry

/-- API `weightGraded_isPure`. -/
theorem weightGraded_isPure (F : MixedPerverseSheaf E X) (i : ℤ) :
    (weightGraded F i).IsPure i := sorry

/-- API `weightFiltration_unique`. -/
theorem weightFiltration_unique (F : MixedPerverseSheaf E X) (W : ℤ → Subobject F)
    (hmono : ∀ i, W (i - 1) ≤ W i)
    (hfin : ∃ N : ℕ, (∀ i : ℤ, i < -N → W i = ⊥) ∧ (∀ i : ℤ, (N : ℤ) < i → W i = ⊤))
    (hpure : ∀ i, (cokernel (Subobject.ofLE _ _ (hmono i)) : MixedPerverseSheaf E X).IsPure i) :
    W = weightFiltration F := sorry

/-- API `weightFiltration_strict`: `f(W_i F) = f(F) ∩ W_i G`. -/
theorem weightFiltration_strict {F G : MixedPerverseSheaf E X} (f : F ⟶ G) (i : ℤ) :
    imageSubobject ((weightFiltration F i).arrow ≫ f) =
      imageSubobject f ⊓ weightFiltration G i := sorry

/-- API `weightFiltration_eq_largest`: `W_i F` is the largest subobject with weights `≤ i`. -/
theorem weightFiltration_eq_largest (F : MixedPerverseSheaf E X) (i : ℤ) (A : Subobject F)
    (hA : (A : MixedPerverseSheaf E X).HasWeightsLE i) : A ≤ weightFiltration F i := sorry

variable (X) in
/-- Stand-in (EDC.5/perverse-verdier-self-duality restricted to mixed objects): duality on `Perv_m`. -/
def MixedPerverseSheaf.dual : (MixedPerverseSheaf E X)ᵒᵖ ⥤ MixedPerverseSheaf E X := sorry

/-- API `weightFiltration_dual`: `D(W_i F) ≅ D F / W_{-i-1}(D F)`. -/
theorem weightFiltration_dual (F : MixedPerverseSheaf E X) (i : ℤ) :
    Nonempty ((MixedPerverseSheaf.dual X).obj
        (Opposite.op (weightFiltration F i : MixedPerverseSheaf E X)) ≅
      cokernel (weightFiltration ((MixedPerverseSheaf.dual X).obj (Opposite.op F)) (-i - 1)).arrow) :=
  sorry

/-- Test `weightFiltration_pure`. -/
example (F : MixedPerverseSheaf E X) (w : ℤ) (hF : F.IsPure w) :
    (∀ i, i < w → weightFiltration F i = ⊥) ∧ (∀ i, w ≤ i → weightFiltration F i = ⊤) := sorry

/-- Test `weightFiltration_jstar_Gm`: for `F₀ = Rj_*ℚ̄_ℓ[1]` with `j : 𝔾_m ↪ 𝔸¹` over `𝔽_q`, the
graded pieces are pure of weights 1 and 2 and all others vanish. -/
example (F : MixedPerverseSheaf E X) (U Z : Geo k) (j : U ⟶ X) (i : Z ⟶ X)
    [IsOpenImmersion (Geo.map j)] [IsClosedImmersion (Geo.map i)]
    (hjF : Nonempty ((MixedPerverseSheaf.toPerverse X).obj F ≅
      (perverseCohomology 0).obj ((pushforward j).obj ((constantSheaf U)⟦(1 : ℤ)⟧)))) :
    (weightGraded F 1).IsPure 1 ∧ (weightGraded F 2).IsPure 2 ∧
      ∀ n, n ≠ 1 → n ≠ 2 → IsZero (weightGraded F n) := sorry

/-- Test `weightFiltration_point`: on a point, `W_i` is the sum of generalized Frobenius
eigenspaces of weight `≤ i` (DWP.8/punctual-weight-filtration-3-4-1-ii). -/
example (F : MixedPerverseSheaf E (point k)) (i : ℤ) :
    (weightFiltration F i : MixedPerverseSheaf E (point k)).HasWeightsLE i := sorry

/-- Test `weightFiltration_not_split_geometrically_trivial`: the weight filtration is not split in
general: for the sheaf of the previous test, `W_1 ↪ F` has no retraction. -/
example (F : MixedPerverseSheaf E X) (U Z : Geo k) (j : U ⟶ X) (i : Z ⟶ X)
    [IsOpenImmersion (Geo.map j)] [IsClosedImmersion (Geo.map i)]
    (hjF : Nonempty ((MixedPerverseSheaf.toPerverse X).obj F ≅
      (perverseCohomology 0).obj ((pushforward j).obj ((constantSheaf U)⟦(1 : ℤ)⟧)))) :
    ¬ ∃ r : F ⟶ (weightFiltration F 1 : MixedPerverseSheaf E X),
      (weightFiltration F 1).arrow ≫ r = 𝟙 _ := sorry

end WeightFiltration

section GeometricSemisimplicity
variable {k : Type u} [Field k] {E : Type u} [Field E] [CharZero E]

/-- API `IsGeometricallySemisimple`: the pullback to `k̄` is a semisimple perverse sheaf. -/
def IsGeometricallySemisimple {X : Geo k} (F : PerverseSheaf E X) : Prop :=
  IsSemisimpleObject ((perverseBaseChange (AlgebraicClosure k) X).obj F)

/-- API `IsGeometricallySplitSemisimple`: over `k̄`, `K ≅ ⊕ pH^i(K)[-i]` (finite) with semisimple
`pH^i(K)`. -/
def IsGeometricallySplitSemisimple {X : Geo k} (K : Dbc E X) : Prop :=
  ∃ (a : ℤ) (n : ℕ),
    (∀ i : ℤ, (i < a ∨ a + n ≤ i) →
      IsZero ((perverseCohomology i).obj ((baseChangeFunctor (AlgebraicClosure k) X).obj K))) ∧
    Nonempty ((baseChangeFunctor (AlgebraicClosure k) X).obj K ≅
      ⨁ (fun j : Fin n => ((perverseTStructure E _).heart.ι.obj ((perverseCohomology (a + j)).obj
        ((baseChangeFunctor (AlgebraicClosure k) X).obj K)))⟦-(a + (j : ℤ))⟧)) ∧
    ∀ i : ℤ, IsSemisimpleObject
      ((perverseCohomology i).obj ((baseChangeFunctor (AlgebraicClosure k) X).obj K))

/-- Stand-in (EDC.0): lisse sheaves, their perverse shift on a smooth scheme, base change. -/
def Lisse (E : Type u) [Field E] [CharZero E] (X : Geo k) : Type (u + 1) := sorry
instance (X : Geo k) : Category.{u} (Lisse E X) := sorry
instance (X : Geo k) : Abelian (Lisse E X) := sorry
instance (X : Geo k) : HasFiniteBiproducts (Lisse E X) := Abelian.hasFiniteBiproducts
def lisseShift (X : Geo k) (d : ℕ) : Lisse E X ⥤ PerverseSheaf E X := sorry
def lisseBaseChange (X : Geo k) : Lisse E X ⥤ Lisse E (extendBase (AlgebraicClosure k) X) := sorry

/-- API `isGeometricallySemisimple_lisse_iff`: compatibility with DWP.8/geometric-semisimplicity. -/
theorem isGeometricallySemisimple_lisse_iff {X : Geo k} (d : ℕ)
    [SmoothOfRelativeDimension d X.obj.hom] (L : Lisse E X) :
    IsGeometricallySemisimple ((lisseShift X d).obj L) ↔
      IsSemisimpleObject ((lisseBaseChange X).obj L) := sorry

/-- API `IsGeometricallySemisimple.baseChange`: invariance under finite extension of the base. -/
theorem IsGeometricallySemisimple.baseChange {X : Geo k} (k' : Type u) [Field k'] [Algebra k k']
    [FiniteDimensional k k'] (F : PerverseSheaf E X) :
    IsGeometricallySemisimple F ↔ IsGeometricallySemisimple ((perverseBaseChange k' X).obj F) :=
  sorry

/-- Node `EDC.7/pure-perverse-geometric-semisimplicity` (BBD 5.3.8). -/
theorem isGeometricallySemisimple_of_isPure {X : Geo k} (F : MixedPerverseSheaf E X) (w : ℤ)
    (hF : F.IsPure w) : IsGeometricallySemisimple ((MixedPerverseSheaf.toPerverse X).obj F) := sorry

/-- Node `EDC.7/pure-complex-geometric-splitting` (BBD 5.4.5–5.4.6). -/
theorem isGeometricallySplitSemisimple_of_isPure {X : Geo k} (K : Dbm E X) (w : ℤ)
    (hK : IsPure K w) : IsGeometricallySplitSemisimple ((Dbm.incl E X).obj K) := sorry

/-- Node `EDC.7/decomposition-theorem`: for `f` proper and `K` pure, `Rf_*K` is pure and
geometrically split-semisimple. -/
theorem decomposition_theorem {X Y : Geo k} (f : X ⟶ Y) [IsProper (Geo.map f)] (K : Dbm E X)
    (w : ℤ) (hK : IsPure K w) (K' : Dbm E Y)
    (hK' : Nonempty ((Dbm.incl E Y).obj K' ≅ (pushforward f).obj ((Dbm.incl E X).obj K))) :
    IsPure K' w ∧ IsGeometricallySplitSemisimple ((Dbm.incl E Y).obj K') := sorry

end GeometricSemisimplicity

/-- Test `E2_isGeometricallySemisimple`: on `Spec 𝔽_q` there is a perverse sheaf (the unipotent
`E₂`) which is geometrically semisimple but not semisimple. -/
example (E₀ : Type) [Field E₀] [CharZero E₀] (p a : ℕ) [Fact p.Prime] :
    ∃ F : PerverseSheaf E₀ (point (GaloisField p a)),
      IsGeometricallySemisimple F ∧ ¬ IsSemisimpleObject F := sorry

/-! ## EDC.7 — hard Lefschetz -/

section HardLefschetz
variable {k : Type u} [Field k] {E : Type u} [Field E] [CharZero E]


/-- Stand-in (SF.0): the projective space `ℙ^d × Y` over `Y` with its projection. -/
def projectiveSpaceOver (Y : Geo k) (d : ℕ) : Geo k := sorry
def projectiveSpaceOver.proj (Y : Geo k) (d : ℕ) : projectiveSpaceOver Y d ⟶ Y := sorry

/-- A projective factorization `X ↪ ℙ^d × Y → Y` of `f`; `η` is then `c₁(𝒪(1))`. BBD 5.4.10 reduces
an arbitrary relatively ample class to this case locally on `Y`. -/
structure ProjectiveFactorization {X Y : Geo k} (f : X ⟶ Y) where
  d : ℕ
  emb : X ⟶ projectiveSpaceOver Y d
  closed : IsClosedImmersion (Geo.map emb)
  comm : emb ≫ projectiveSpaceOver.proj Y d = f

/-- Stand-in (EDC.3/chern-classes in its adic form, EDC.6): cup product with `η = c₁(𝒪(1))`,
a morphism `K ⟶ K(1)[2]`. -/
def hyperplaneCup {X Y : Geo k} {f : X ⟶ Y} (P : ProjectiveFactorization f) (K : Dbc E X) :
    K ⟶ ((tateTwist X 1).obj K)⟦(2 : ℤ)⟧ := sorry

/-- The graded Lefschetz object `(pH^i(Rf_*F), η)` in `Perv(Y)` with the Tate twist (stand-in for
the identification `pH^i(K(1)[2]) = pH^{i+2}(K)(1)`). -/
def relativeLefschetz {X Y : Geo k} {f : X ⟶ Y} (P : ProjectiveFactorization f)
    (F : PerverseSheaf E X) : GradedLefschetz (perverseTwist (E := E) Y 1) := sorry

theorem relativeLefschetz_L {X Y : Geo k} {f : X ⟶ Y} (P : ProjectiveFactorization f)
    (F : PerverseSheaf E X) (i : ℤ) :
    (relativeLefschetz P F).L i =
      (perverseCohomology i).obj ((pushforward f).obj ((perverseTStructure E X).heart.ι.obj F)) :=
  sorry

/-- Node `EDC.7/relative-hard-lefschetz-theorem` (BBD 5.4.10): for `F` pure perverse,
`η^i : pH^{-i}(Rf_*F) ≅ pH^i(Rf_*F)(i)`. -/
theorem relative_hard_lefschetz {X Y : Geo k} {f : X ⟶ Y} (P : ProjectiveFactorization f)
    (F : MixedPerverseSheaf E X) (w : ℤ) (hF : F.IsPure w) :
    (relativeLefschetz P ((MixedPerverseSheaf.toPerverse X).obj F)).HardLefschetz := sorry

/-- Node `EDC.7/relative-lefschetz-primitive-decomposition`. -/
theorem relative_primitive_decomposition {X Y : Geo k} {f : X ⟶ Y}
    (P : ProjectiveFactorization f) (F : MixedPerverseSheaf E X) (w : ℤ) (hF : F.IsPure w)
    (r : ℕ) :
    Nonempty ((relativeLefschetz P ((MixedPerverseSheaf.toPerverse X).obj F)).L (-(r : ℤ)) ≅
      (relativeLefschetz P ((MixedPerverseSheaf.toPerverse X).obj F)).primitive r ⊞
      (relativeLefschetz P ((MixedPerverseSheaf.toPerverse X).obj F)).L (-(r : ℤ) - 2)) := sorry

/-- Node `EDC.7/semismall-decomposition`: for `f` proper surjective semismall from a smooth
`n`-dimensional source, `Rf_*ℚ̄_ℓ[n]` is perverse and pure of weight `n`; the summands are
`IC(R^{2d_S} f_*ℚ̄_ℓ|_S)` over the relevant strata (README). -/
theorem semismall_pushforward_pure {X Y : Geo k} (f : X ⟶ Y) [IsProper (Geo.map f)]
    (n : ℕ) [SmoothOfRelativeDimension n X.obj.hom] (K : Dbm E Y)
    (hK : Nonempty ((Dbm.incl E Y).obj K ≅ (pushforward f).obj ((constantSheaf X)⟦(n : ℤ)⟧)))
    (hsemi : ∀ i : ℤ, i ≠ 0 → IsZero ((perverseCohomology i).obj ((Dbm.incl E Y).obj K))) :
    IsPure K n ∧ IsGeometricallySplitSemisimple ((Dbm.incl E Y).obj K) := sorry

end HardLefschetz

/-! ## EDC.7 — from finite fields to `ℂ` (BBD §6) -/

section CharacteristicZero
variable {E : Type} [Field E] [CharZero E]

/-- Stand-in (EDC.6/SF.2): integral constructible complexes `D^b_c(X, ℤ_ℓ)` and the Jordan–Hölder
constituents of residual cohomology sheaves on a stratum. -/
def DbcInt (ℓ : ℕ) {k : Type} [Field k] (X : Geo k) : Type 1 := sorry
instance (ℓ : ℕ) {k : Type} [Field k] (X : Geo k) : Category.{0} (DbcInt ℓ X) := sorry
def ResidualLocalSystem (ℓ : ℕ) {k : Type} [Field k] (Y : Geo k) : Type := sorry

/-- A finite stratification: strata with their immersions (smoothness and connectedness of the
strata are part of the README specification). -/
structure Stratification {k : Type} [Field k] (X : Geo k) where
  n : ℕ
  stratum : Fin n → Geo k
  incl : ∀ i, stratum i ⟶ X

def residualConstituents (ℓ : ℕ) {k : Type} [Field k] {X : Geo k} (T : Stratification X)
    (K : DbcInt ℓ X) (s : Fin T.n) (q : ℤ) : Multiset (ResidualLocalSystem ℓ (T.stratum s)) := sorry

/-- Node `EDC.7/restricted-constructible-categories`, API `RestrictedCategory`: residual
constituents on each stratum lie in the chosen finite families. -/
def RestrictedCategory (ℓ : ℕ) {k : Type} [Field k] {X : Geo k} (T : Stratification X)
    (L : ∀ s : Fin T.n, Set (ResidualLocalSystem ℓ (T.stratum s))) : ObjectProperty (DbcInt ℓ X) :=
  fun K => ∀ (s : Fin T.n) (q : ℤ), ∀ c ∈ residualConstituents ℓ T K s q, c ∈ L s

/-- API `RestrictedCategory.mem_iff`. -/
theorem RestrictedCategory.mem_iff (ℓ : ℕ) {k : Type} [Field k] {X : Geo k} (T : Stratification X)
    (L : ∀ s : Fin T.n, Set (ResidualLocalSystem ℓ (T.stratum s))) (K : DbcInt ℓ X) :
    RestrictedCategory ℓ T L K ↔
      ∀ (s : Fin T.n) (q : ℤ), ∀ c ∈ residualConstituents ℓ T K s q, c ∈ L s := Iff.rfl

/-- API `RestrictedCategory.triangulated`: closed under isomorphism (shifts and cones likewise). -/
theorem RestrictedCategory.triangulated (ℓ : ℕ) {k : Type} [Field k] {X : Geo k}
    (T : Stratification X) (L : ∀ s : Fin T.n, Set (ResidualLocalSystem ℓ (T.stratum s)))
    {K K' : DbcInt ℓ X} (e : K ≅ K') (hK : RestrictedCategory ℓ T L K) :
    RestrictedCategory ℓ T L K' := sorry

/-- API `GoodModel`: a finitely generated `ℤ`-subalgebra `A ⊆ ℂ` with a model of `X` over it. -/
structure GoodModel (X : Geo ℂ) where
  A : Subalgebra ℤ ℂ
  fg : A.FG
  model : Over (Spec (CommRingCat.of A))
  iso : Limits.pullback model.hom (Spec.map (CommRingCat.ofHom (algebraMap A ℂ))) ≅ X.space

/-- API `specializationEquiv` (BBD 6.1.9–6.1.10): for a good model and a strictly henselian trait
with residue field `k̄₀`, an equivalence between the restricted categories on `X` and on the
special fibre `X_s̄` (whose data are inputs). -/
def specializationEquiv (ℓ : ℕ) {X : Geo ℂ} (M : GoodModel X) (T : Stratification X)
    (L : ∀ s : Fin T.n, Set (ResidualLocalSystem ℓ (T.stratum s)))
    {k₀ : Type} [Field k₀] (Xs : Geo k₀) (Ts : Stratification Xs)
    (Ls : ∀ s : Fin Ts.n, Set (ResidualLocalSystem ℓ (Ts.stratum s))) :
    (RestrictedCategory ℓ T L).FullSubcategory ≌ (RestrictedCategory ℓ Ts Ls).FullSubcategory :=
  sorry

/-- API `specializationEquiv_perverse`, `specializationEquiv_comm`, `specializationEquiv_rational`
are the t-exactness, operation-compatibility and coefficient-extension statements of the README;
the first is suggested here as preservation of a chosen perverse condition. -/
theorem specializationEquiv_perverse (ℓ : ℕ) {X : Geo ℂ} (M : GoodModel X) (T : Stratification X)
    (L : ∀ s : Fin T.n, Set (ResidualLocalSystem ℓ (T.stratum s)))
    {k₀ : Type} [Field k₀] (Xs : Geo k₀) (Ts : Stratification Xs)
    (Ls : ∀ s : Fin Ts.n, Set (ResidualLocalSystem ℓ (Ts.stratum s)))
    (Pv : ObjectProperty (DbcInt ℓ X)) (Pvs : ObjectProperty (DbcInt ℓ Xs))
    (K : (RestrictedCategory ℓ T L).FullSubcategory) :
    Pv K.obj ↔ Pvs ((specializationEquiv ℓ M T L Xs Ts Ls).functor.obj K).obj := sorry

/-- Stand-in (EDC.0 operations on integral complexes): the integral pushforward. -/
def intPushforward (ℓ : ℕ) {k : Type} [Field k] {X Y : Geo k} (f : X ⟶ Y) :
    DbcInt ℓ X ⥤ DbcInt ℓ Y := sorry

/-- API `specializationEquiv_comm` (first half of BBD 6.1.10): after refining the target data an
operation maps restricted objects to restricted objects; the equivalences then commute with it
after shrinking the model (README). -/
theorem specializationEquiv_comm (ℓ : ℕ) {k : Type} [Field k] {X Y : Geo k} (f : X ⟶ Y)
    (T : Stratification X) (L : ∀ s : Fin T.n, Set (ResidualLocalSystem ℓ (T.stratum s))) :
    ∃ (T₂ : Stratification Y) (L₂ : ∀ s : Fin T₂.n, Set (ResidualLocalSystem ℓ (T₂.stratum s))),
      ∀ K, RestrictedCategory ℓ T L K →
        RestrictedCategory ℓ T₂ L₂ ((intPushforward ℓ f).obj K) := sorry

/-- Stand-in (EDC.6): rationalization `D^b_c(X, ℤ_ℓ) → D^b_c(X, E)`. -/
def rationalize (ℓ : ℕ) {k : Type} [Field k] (X : Geo k) : DbcInt ℓ X ⥤ Dbc E X := sorry

/-- Rational restricted objects: rationalizations of restricted integral objects. -/
def RestrictedCategoryRat (ℓ : ℕ) {k : Type} [Field k] {X : Geo k} (T : Stratification X)
    (L : ∀ s : Fin T.n, Set (ResidualLocalSystem ℓ (T.stratum s))) : ObjectProperty (Dbc E X) :=
  fun K => ∃ K₀, RestrictedCategory ℓ T L K₀ ∧ Nonempty ((rationalize ℓ X).obj K₀ ≅ K)

/-- API `specializationEquiv_rational`: the equivalences extend to rational coefficients. -/
def specializationEquiv_rational (ℓ : ℕ) {X : Geo ℂ} (M : GoodModel X) (T : Stratification X)
    (L : ∀ s : Fin T.n, Set (ResidualLocalSystem ℓ (T.stratum s)))
    {k₀ : Type} [Field k₀] (Xs : Geo k₀) (Ts : Stratification Xs)
    (Ls : ∀ s : Fin Ts.n, Set (ResidualLocalSystem ℓ (Ts.stratum s))) :
    (RestrictedCategoryRat (E := E) ℓ T L).FullSubcategory ≌
      (RestrictedCategoryRat (E := E) ℓ Ts Ls).FullSubcategory := sorry

/-- Test `restrictedCategory_univ`: with every residual class allowed, every object is
restricted. -/
example (ℓ : ℕ) {k : Type} [Field k] {X : Geo k} (T : Stratification X) (K : DbcInt ℓ X) :
    RestrictedCategory ℓ T (fun _ => Set.univ) K := sorry

/-- Test `restrictedCategory_empty_L`: with all families empty, an object is restricted iff it has
no residual constituents. -/
example (ℓ : ℕ) {k : Type} [Field k] {X : Geo k} (T : Stratification X) (K : DbcInt ℓ X) :
    RestrictedCategory ℓ T (fun _ => ∅) K ↔ ∀ s q, residualConstituents ℓ T K s q = 0 := sorry

/-- Test `restrictedCategory_mono`: enlarging the families enlarges the restricted category. -/
example (ℓ : ℕ) {k : Type} [Field k] {X : Geo k} (T : Stratification X)
    (L L' : ∀ s : Fin T.n, Set (ResidualLocalSystem ℓ (T.stratum s))) (h : ∀ s, L s ⊆ L' s)
    (K : DbcInt ℓ X) (hK : RestrictedCategory ℓ T L K) : RestrictedCategory ℓ T L' K := sorry

/-- A simple constituent `S` of `P`: a simple subquotient `B / A` isomorphic to `S`. -/
def IsConstituent {C : Type*} [Category C] [Abelian C] (S P : C) : Prop :=
  Simple S ∧ ∃ (A B : Subobject P) (h : A ≤ B), Nonempty (cokernel (Subobject.ofLE A B h) ≅ S)

/-- Stand-in (EDC.0): derived tensor product and internal Hom on `Dbc`. -/
def derivedTensor {k : Type} [Field k] (X : Geo k) : Dbc E X → Dbc E X → Dbc E X := sorry
def derivedHom {k : Type} [Field k] (X : Geo k) : Dbc E X → Dbc E X → Dbc E X := sorry

/-- Node `EDC.7/geometric-origin-class`, API `GeometricOrigin` (BBD 6.2.4): the least class of
simple perverse sheaves on schemes of finite type over `ℂ` containing the constant sheaf on a point
and closed under simple constituents of perverse cohomology of `f_*, f_!, f^*, f^!, ⊗, RHom`. -/
inductive GeometricOrigin : {X : Geo ℂ} → PerverseSheaf E X → Prop
  | const_point (P : PerverseSheaf E (point ℂ))
      (h : Nonempty ((perverseTStructure E _).heart.ι.obj P ≅ constantSheaf (point ℂ))) :
      GeometricOrigin P
  | of_constituent {X Y : Geo ℂ} (T : Dbc E X ⥤ Dbc E Y)
      (hT : (∃ f : X ⟶ Y, T = pushforward f ∨ T = lowerShriek f) ∨
        (∃ g : Y ⟶ X, T = pullback g ∨ T = upperShriek g))
      (F : PerverseSheaf E X) (hF : GeometricOrigin F) (n : ℤ) (S : PerverseSheaf E Y)
      (hS : IsConstituent S ((perverseCohomology n).obj (T.obj ((perverseTStructure E X).heart.ι.obj F)))) :
      GeometricOrigin S
  | of_tensor {X : Geo ℂ} (F G : PerverseSheaf E X) (hF : GeometricOrigin F)
      (hG : GeometricOrigin G) (n : ℤ) (S : PerverseSheaf E X)
      (hS : IsConstituent S ((perverseCohomology n).obj (derivedTensor X
        ((perverseTStructure E X).heart.ι.obj F) ((perverseTStructure E X).heart.ι.obj G)))) :
      GeometricOrigin S
  | of_hom {X : Geo ℂ} (F G : PerverseSheaf E X) (hF : GeometricOrigin F)
      (hG : GeometricOrigin G) (n : ℤ) (S : PerverseSheaf E X)
      (hS : IsConstituent S ((perverseCohomology n).obj (derivedHom X
        ((perverseTStructure E X).heart.ι.obj F) ((perverseTStructure E X).heart.ι.obj G)))) :
      GeometricOrigin S

/-- API `GeometricOrigin.simple`. -/
theorem GeometricOrigin.simple {X : Geo ℂ} {P : PerverseSheaf E X} (h : GeometricOrigin P) :
    Simple P := sorry

/-- API `IsSemisimpleGeometricOrigin`: `K ≅ ⊕ pH^i(K)[-i]` (finite) and each `pH^i(K)` is a finite
biproduct of simple perverse sheaves of geometric origin. -/
def IsSemisimpleGeometricOrigin {X : Geo ℂ} (K : Dbc E X) : Prop :=
  ∃ (a : ℤ) (n : ℕ),
    (∀ i : ℤ, (i < a ∨ a + n ≤ i) → IsZero ((perverseCohomology i).obj K)) ∧
    Nonempty (K ≅ ⨁ (fun j : Fin n =>
      ((perverseTStructure E X).heart.ι.obj ((perverseCohomology (a + j)).obj K))⟦-(a + (j : ℤ))⟧)) ∧
    ∀ i : ℤ, ∃ (m : ℕ) (S : Fin m → PerverseSheaf E X), (∀ t, GeometricOrigin (S t)) ∧
      Nonempty ((perverseCohomology i).obj K ≅ ⨁ S)

/-- API `IsSemisimpleGeometricOrigin.shift`. -/
theorem IsSemisimpleGeometricOrigin.shift {X : Geo ℂ} (K : Dbc E X) (m : ℤ)
    (h : IsSemisimpleGeometricOrigin K) : IsSemisimpleGeometricOrigin (K⟦m⟧) := sorry

/-- API `IsSemisimpleGeometricOrigin.ic_finite_monodromy`: `j_!*(L[d])` is semisimple of geometric
origin when `L[d]` is a direct summand of `π_*E[d]` for a finite étale `π`. -/
theorem IsSemisimpleGeometricOrigin.ic_finite_monodromy {U V X : Geo ℂ} (j : U ⟶ X)
    [IsOpenImmersion (Geo.map j)] (π : V ⟶ U) [IsFinite (Geo.map π)] [Etale (Geo.map π)] (d : ℤ)
    (L : PerverseSheaf E U) (s : (perverseTStructure E U).heart.ι.obj L ⟶
      (pushforward π).obj ((constantSheaf V)⟦d⟧))
    (r : (pushforward π).obj ((constantSheaf V)⟦d⟧) ⟶ (perverseTStructure E U).heart.ι.obj L)
    (hsr : s ≫ r = 𝟙 _) :
    IsSemisimpleGeometricOrigin
      ((perverseTStructure E X).heart.ι.obj ((intermediateExtension j).obj L)) := sorry

/-- Test `geometricOrigin_constant_smooth`. -/
example {X : Geo ℂ} (d : ℕ) [SmoothOfRelativeDimension d X.obj.hom] (P : PerverseSheaf E X)
    (hP : Nonempty ((perverseTStructure E X).heart.ι.obj P ≅ (constantSheaf X)⟦(d : ℤ)⟧))
    (hsimple : Simple P) : GeometricOrigin P := sorry

/-- Test `isSemisimpleGeometricOrigin_zero`. -/
example {X : Geo ℂ} (K : Dbc E X) (hK : IsZero K) : IsSemisimpleGeometricOrigin K := sorry

/-- Test `not_isSemisimpleGeometricOrigin_jstar`: for `j : ℂ^× ↪ ℂ`, `Rj_*ℂ[1]` is not semisimple of
geometric origin. -/
example {U X : Geo ℂ} (j : U ⟶ X) [IsOpenImmersion (Geo.map j)]
    (hU : Nonempty (U.space ≅ Spec (CommRingCat.of (LaurentPolynomial ℂ))))
    (hX : Nonempty (X.space ≅ Spec (CommRingCat.of (Polynomial ℂ)))) :
    ¬ IsSemisimpleGeometricOrigin ((pushforward (E := E) j).obj ((constantSheaf U)⟦(1 : ℤ)⟧)) :=
  sorry

/-- Node `EDC.7/decomposition-theorem-complex` (BBD 6.2.5). -/
theorem decomposition_theorem_complex {X Y : Geo ℂ} (f : X ⟶ Y) [IsProper (Geo.map f)]
    (K : Dbc E X) (hK : IsSemisimpleGeometricOrigin K) :
    IsSemisimpleGeometricOrigin ((pushforward f).obj K) := sorry

end CharacteristicZero

end TauCeti.EtaleDuality

/-! ## EDC.8 — correspondences, trace maps and trace formulas -/

namespace TauCeti.EtaleDuality
open AlgebraicGeometry

section Correspondences
variable {k : Type u} [Field k] {E : Type u} [Field E] [CharZero E]

/-- Node `EDC.8/scheme-correspondence`, API `Correspondence`: `c = (c₁, c₂) : C → X₁ × X₂`. -/
structure Correspondence (X₁ X₂ : Geo k) where
  C : Geo k
  c₁ : C ⟶ X₁
  c₂ : C ⟶ X₂

namespace Correspondence

/-- API `Correspondence.Hom`: `(f₁, f♮, f₂)` with both squares commuting. -/
structure Hom {X₁ X₂ Y₁ Y₂ : Geo k} (c : Correspondence X₁ X₂) (b : Correspondence Y₁ Y₂) where
  f₁ : X₁ ⟶ Y₁
  fn : c.C ⟶ b.C
  f₂ : X₂ ⟶ Y₂
  comm₁ : fn ≫ b.c₁ = c.c₁ ≫ f₁
  comm₂ : fn ≫ b.c₂ = c.c₂ ≫ f₂

/-- API `Correspondence.Hom.IsProper`. -/
def Hom.IsProper {X₁ X₂ Y₁ Y₂ : Geo k} {c : Correspondence X₁ X₂} {b : Correspondence Y₁ Y₂}
    (h : c.Hom b) : Prop :=
  AlgebraicGeometry.IsProper (Geo.map h.f₁) ∧ AlgebraicGeometry.IsProper (Geo.map h.fn) ∧
    AlgebraicGeometry.IsProper (Geo.map h.f₂)

/-- API `Correspondence.Hom.comp`. -/
def Hom.comp {X₁ X₂ Y₁ Y₂ Z₁ Z₂ : Geo k} {c : Correspondence X₁ X₂} {b : Correspondence Y₁ Y₂}
    {a : Correspondence Z₁ Z₂} (h : c.Hom b) (h' : b.Hom a) : c.Hom a where
  f₁ := h.f₁ ≫ h'.f₁
  fn := h.fn ≫ h'.fn
  f₂ := h.f₂ ≫ h'.f₂
  comm₁ := by rw [Category.assoc, h'.comm₁, ← Category.assoc, h.comm₁, Category.assoc]
  comm₂ := by rw [Category.assoc, h'.comm₂, ← Category.assoc, h.comm₂, Category.assoc]

/-- The identity correspondence of `X`. -/
def id (X : Geo k) : Correspondence X X := ⟨X, 𝟙 X, 𝟙 X⟩

/-- API `Correspondence.graph`: the graph-type correspondence `(g, id)`. -/
def graph {X : Geo k} (g : X ⟶ X) : Correspondence X X := ⟨X, g, 𝟙 X⟩

/-- The transpose `(c₂, c₁)`. -/
def transpose {X₁ X₂ : Geo k} (c : Correspondence X₁ X₂) : Correspondence X₂ X₁ := ⟨c.C, c.c₂, c.c₁⟩

/-- API `Correspondence.fix`: `Fix(c) = C ×_{X × X} X`, the equalizer of the two legs. -/
def fix {X : Geo k} (c : Correspondence X X) : Geo k := Geo.equalizer c.c₁ c.c₂

/-- API `Correspondence.fix_graph`. -/
theorem fix_graph {X : Geo k} (g : X ⟶ X) :
    Nonempty ((graph g).fix.space ≅ Limits.equalizer (Geo.map g) (Geo.map (𝟙 X))) :=
  Geo.equalizer_isLimit _ _

/-- Restriction to an open (or any) subscheme of the support. -/
def restrictSupport {X₁ X₂ : Geo k} (c : Correspondence X₁ X₂) {W : Geo k} (j : W ⟶ c.C) :
    Correspondence X₁ X₂ := ⟨W, j ≫ c.c₁, j ≫ c.c₂⟩

end Correspondence

/-- Test `fix_graph_id_point`. -/
example : Nonempty ((Correspondence.graph (𝟙 (point k))).fix.space ≅
    Limits.equalizer (Geo.map (𝟙 (point k))) (Geo.map (𝟙 (point k)))) :=
  Correspondence.fix_graph _

/-- Stand-in (TraceFormula FrobeniusGeometry): the geometric Frobenius endomorphism of
`X₀ ⊗ 𝔽̄_q`, and (SF.0) the affine line with translation by one. -/
def geometricFrobenius {p a : ℕ} [Fact p.Prime] (X₀ : Geo (GaloisField p a)) :
    extendBase (AlgebraicClosure (GaloisField p a)) X₀ ⟶
      extendBase (AlgebraicClosure (GaloisField p a)) X₀ := sorry
def affineLine (k : Type u) [Field k] : Geo k := sorry
def translateOne (k : Type u) [Field k] : affineLine k ⟶ affineLine k := sorry

/-- Test `fix_graph_frobenius_count`: the fixed points of Frobenius are the `𝔽_q`-points. -/
example (p a : ℕ) [Fact p.Prime] (X₀ : Geo (GaloisField p a)) :
    Nat.card (ClosedPoint (Correspondence.graph (geometricFrobenius X₀)).fix) =
      Nat.card {x : ClosedPoint X₀ // residueCard x = p ^ a} := sorry

/-- Test `fix_transpose`. -/
example {X : Geo k} (c : Correspondence X X) : Nonempty (c.transpose.fix.space ≅ c.fix.space) := sorry

/-- Test `fix_graph_affine_line_translation`: translation by one has no fixed points. -/
example : IsEmpty (Correspondence.graph (translateOne k)).fix.space := sorry

/-- Node `EDC.8/cohomological-correspondence-lifting`, API `CohCorr`: `u : c₁^*F₁ ⟶ c₂^!F₂`. -/
abbrev CohCorr {X₁ X₂ : Geo k} (c : Correspondence X₁ X₂) (F₁ : Dbc E X₁) (F₂ : Dbc E X₂) : Type u :=
  (pullback c.c₁).obj F₁ ⟶ (upperShriek c.c₂).obj F₂

namespace CohCorr

/-- API `CohCorr.module`: the `E`-module structure of the Hom space. -/
theorem module {X₁ X₂ : Geo k} (c : Correspondence X₁ X₂) (F₁ : Dbc E X₁) (F₂ : Dbc E X₂) :
    Nonempty (Module E (CohCorr c F₁ F₂)) := ⟨inferInstance⟩

/-- API `CohCorr.adjointEquiv`: `Hom(c₁^*F₁, c₂^!F₂) ≃ Hom(c₂!c₁^*F₁, F₂)` (EDC.1 adjunction). -/
def adjointEquiv {X₁ X₂ : Geo k} (c : Correspondence X₁ X₂) (F₁ : Dbc E X₁) (F₂ : Dbc E X₂) :
    CohCorr c F₁ F₂ ≃ ((lowerShriek c.c₂).obj ((pullback c.c₁).obj F₁) ⟶ F₂) := sorry

/-- API `CohCorr.ofId`. -/
def ofId (X : Geo k) (F₁ F₂ : Dbc E X) : CohCorr (Correspondence.id X) F₁ F₂ ≃ (F₁ ⟶ F₂) := sorry

/-- API `CohCorr.ofGraph`: for `(g, id)`, cohomological correspondences are maps `g^*F ⟶ F`. -/
def ofGraph {X : Geo k} (g : X ⟶ X) (F : Dbc E X) :
    CohCorr (Correspondence.graph g) F F ≃ ((pullback g).obj F ⟶ F) := sorry

/-- API `CohCorr.transport`: along an isomorphism of supports compatible with both legs. -/
def transport {X₁ X₂ : Geo k} {c c' : Correspondence X₁ X₂} (e : c.C ≅ c'.C)
    (h₁ : e.hom ≫ c'.c₁ = c.c₁) (h₂ : e.hom ≫ c'.c₂ = c.c₂) (F₁ : Dbc E X₁) (F₂ : Dbc E X₂) :
    CohCorr c F₁ F₂ ≃ CohCorr c' F₁ F₂ := sorry

/-- Change of the complexes along isomorphisms (a real definition). -/
def congr {X₁ X₂ : Geo k} (c : Correspondence X₁ X₂) {F₁ F₁' : Dbc E X₁} {F₂ F₂' : Dbc E X₂}
    (e₁ : F₁ ≅ F₁') (e₂ : F₂ ≅ F₂') : CohCorr c F₁ F₂ ≃ CohCorr c F₁' F₂' where
  toFun u := (pullback c.c₁).map e₁.inv ≫ u ≫ (upperShriek c.c₂).map e₂.hom
  invFun u := (pullback c.c₁).map e₁.hom ≫ u ≫ (upperShriek c.c₂).map e₂.inv
  left_inv u := by
    simp only [Category.assoc, ← Functor.map_comp, Iso.hom_inv_id, Functor.map_id, Category.comp_id]
    simp only [← Category.assoc, ← Functor.map_comp, Iso.hom_inv_id, Functor.map_id, Category.id_comp]
    simp
  right_inv u := by
    simp only [Category.assoc, ← Functor.map_comp, Iso.inv_hom_id, Functor.map_id, Category.comp_id]
    simp only [← Category.assoc, ← Functor.map_comp, Iso.inv_hom_id, Functor.map_id, Category.id_comp]
    simp

end CohCorr

/-- Test `cohCorr_point`. -/
example (F₁ F₂ : Dbc E (point k)) :
    Nonempty (CohCorr (Correspondence.id (point k)) F₁ F₂ ≃ (F₁ ⟶ F₂)) := ⟨CohCorr.ofId _ _ _⟩

/-- Test `cohCorr_graph_weil`: every Weil structure `g^*F ≅ F` is a cohomological correspondence
for the graph of `g`. -/
example {X : Geo k} (g : X ⟶ X) (F : Dbc E X) (φ : (pullback g).obj F ≅ F) :
    ∃ u : CohCorr (Correspondence.graph g) F F, CohCorr.ofGraph g F u = φ.hom :=
  ⟨(CohCorr.ofGraph g F).symm φ.hom, by simp⟩

/-- Test `cohCorr_adjoint_compat`: `adjointEquiv` is natural in `F₂`. -/
example {X₁ X₂ : Geo k} (c : Correspondence X₁ X₂) (F₁ : Dbc E X₁) {F₂ F₂' : Dbc E X₂}
    (u : CohCorr c F₁ F₂) (φ : F₂ ⟶ F₂') :
    CohCorr.adjointEquiv c F₁ F₂' (show CohCorr c F₁ F₂' from u ≫ (upperShriek c.c₂).map φ) =
      CohCorr.adjointEquiv c F₁ F₂ u ≫ φ := sorry

/-- Test `cohCorr_not_pushforward_of_endomorphism`: for the transposed graph `(id, g)` a
cohomological correspondence is a map `F ⟶ g^!F`, not `g^*F ⟶ F`. -/
example {X : Geo k} (g : X ⟶ X) (F : Dbc E X) :
    Nonempty (CohCorr (Correspondence.graph g).transpose F F ≃ (F ⟶ (upperShriek g).obj F)) := sorry

/-! ### Pushforward, pullback, restriction and composition -/

namespace Correspondence
/-- The three admissibility conditions of Varshavsky 1.1.6 for pushforward. -/
def Hom.Admissible {X₁ X₂ Y₁ Y₂ : Geo k} {c : Correspondence X₁ X₂} {b : Correspondence Y₁ Y₂}
    (h : c.Hom b) : Prop :=
  IsPullback (Geo.map h.fn) (Geo.map c.c₁) (Geo.map b.c₁) (Geo.map h.f₁) ∨
    (AlgebraicGeometry.IsProper (Geo.map h.f₁) ∧ AlgebraicGeometry.IsProper (Geo.map h.fn)) ∨
    (AlgebraicGeometry.IsProper (Geo.map c.c₁) ∧ AlgebraicGeometry.IsProper (Geo.map b.c₁))
end Correspondence

/-- Stand-in (SF.0): the structure map to the point, and the identification `(𝟙)_! ≅ id`. -/
def toPoint (X : Geo k) : X ⟶ point k := sorry
def lowerShriekId (X : Geo k) (F : Dbc E X) : (lowerShriek (𝟙 X)).obj F ≅ F := sorry

namespace CohCorr

/-- API `CohCorr.pushforward` (Varshavsky 1.1.6). -/
def pushforward {X₁ X₂ Y₁ Y₂ : Geo k} {c : Correspondence X₁ X₂} {b : Correspondence Y₁ Y₂}
    (h : c.Hom b) (hh : h.Admissible) {F₁ : Dbc E X₁} {F₂ : Dbc E X₂} :
    CohCorr c F₁ F₂ → CohCorr b ((lowerShriek h.f₁).obj F₁) ((lowerShriek h.f₂).obj F₂) := sorry

/-- API `CohCorr.pushforward_id`. -/
theorem pushforward_id {X₁ X₂ : Geo k} (c : Correspondence X₁ X₂)
    (h : c.Hom c) (hf₁ : h.f₁ = 𝟙 X₁) (hfn : h.fn = 𝟙 c.C) (hf₂ : h.f₂ = 𝟙 X₂)
    (hh : h.Admissible) {F₁ : Dbc E X₁} {F₂ : Dbc E X₂} (u : CohCorr c F₁ F₂) :
    ∃ (e₁ : (lowerShriek h.f₁).obj F₁ ≅ F₁) (e₂ : (lowerShriek h.f₂).obj F₂ ≅ F₂),
      congr c e₁ e₂ (pushforward h hh u) = u := sorry

/-- API `CohCorr.pushforward_comp`. -/
theorem pushforward_comp {X₁ X₂ Y₁ Y₂ Z₁ Z₂ : Geo k} {c : Correspondence X₁ X₂}
    {b : Correspondence Y₁ Y₂} {a : Correspondence Z₁ Z₂} (h : c.Hom b) (h' : b.Hom a)
    (hh : h.Admissible) (hh' : h'.Admissible) (hc : (h.comp h').Admissible)
    {F₁ : Dbc E X₁} {F₂ : Dbc E X₂} (u : CohCorr c F₁ F₂) :
    ∃ (e₁ : (lowerShriek (h.comp h').f₁).obj F₁ ≅ (lowerShriek h'.f₁).obj ((lowerShriek h.f₁).obj F₁))
      (e₂ : (lowerShriek (h.comp h').f₂).obj F₂ ≅ (lowerShriek h'.f₂).obj ((lowerShriek h.f₂).obj F₂)),
      congr a e₁ e₂ (pushforward (h.comp h') hc u) = pushforward h' hh' (pushforward h hh u) := sorry

/-- API `CohCorr.rgammac` (Varshavsky 1.1.7): for `c₁` proper, `RΓ_c(u)`. -/
def rgammac {X₁ X₂ : Geo k} {c : Correspondence X₁ X₂} [AlgebraicGeometry.IsProper (Geo.map c.c₁)]
    {F₁ : Dbc E X₁} {F₂ : Dbc E X₂} (u : CohCorr c F₁ F₂) :
    (lowerShriek (toPoint X₁)).obj F₁ ⟶ (lowerShriek (toPoint X₂)).obj F₂ := sorry

/-- API `CohCorr.rgammac_compactification`: `RΓ_c(u)` is unchanged by extension by zero to a
compactification (open embedding `j` into a proper correspondence), up to the canonical
identifications of compactly supported cohomology. -/
theorem rgammac_compactification {X₁ X₂ Y₁ Y₂ : Geo k} {c : Correspondence X₁ X₂}
    {cb : Correspondence Y₁ Y₂} (j : c.Hom cb) (hj : j.Admissible)
    [AlgebraicGeometry.IsProper (Geo.map c.c₁)] [AlgebraicGeometry.IsProper (Geo.map cb.c₁)]
    [IsOpenImmersion (Geo.map j.f₁)] [IsOpenImmersion (Geo.map j.fn)] [IsOpenImmersion (Geo.map j.f₂)]
    {F₁ : Dbc E X₁} {F₂ : Dbc E X₂} (u : CohCorr c F₁ F₂) :
    ∃ (e₁ : (lowerShriek (toPoint Y₁)).obj ((lowerShriek j.f₁).obj F₁) ≅
        (lowerShriek (toPoint X₁)).obj F₁)
      (e₂ : (lowerShriek (toPoint Y₂)).obj ((lowerShriek j.f₂).obj F₂) ≅
        (lowerShriek (toPoint X₂)).obj F₂),
      e₁.inv ≫ rgammac (pushforward j hj u) ≫ e₂.hom = rgammac u := sorry

/-- API `CohCorr.rgammac_graph`: for the graph of a proper `g`, `RΓ_c(u)` is `u ∘ g^*`. -/
theorem rgammac_graph {X : Geo k} (g : X ⟶ X)
    [AlgebraicGeometry.IsProper (Geo.map (Correspondence.graph g).c₁)]
    (F : Dbc E X) (u : CohCorr (Correspondence.graph g) F F) :
    ∃ gstar : (lowerShriek (toPoint X)).obj F ⟶ (lowerShriek (toPoint X)).obj ((pullback g).obj F),
      rgammac u = gstar ≫ (lowerShriek (toPoint X)).map (ofGraph g F u) := sorry

end CohCorr

/-- Test `pushforward_trivial`: pushing forward along the identity of the trivial
correspondence over a point is the identity. -/
example (F₁ F₂ : Dbc E (point k)) (h : (Correspondence.id (point k)).Hom (Correspondence.id (point k)))
    (hf₁ : h.f₁ = 𝟙 _) (hfn : h.fn = 𝟙 _) (hf₂ : h.f₂ = 𝟙 _) (hh : h.Admissible)
    (u : CohCorr (Correspondence.id (point k)) F₁ F₂) :
    ∃ e₁ e₂, CohCorr.congr _ e₁ e₂ (CohCorr.pushforward h hh u) = u :=
  CohCorr.pushforward_id _ h hf₁ hfn hf₂ hh u

/-- Test `rgammac_graph_finite_set`: on a finite étale `X = ⊔_I Spec k` with `F` constant of fibre
`M`, `RΓ(u)` is `(x_i) ↦ (u_i(x_{σ i}))`; its trace is Tau Ceti's `LinearMap.trace_pi_of_apply_eq`. -/
example {ι : Type} [Fintype ι] [DecidableEq ι] (M : Type) [AddCommGroup M] [Module ℚ M] [FiniteDimensional ℚ M]
    (σ : ι → ι) (f : ι → M →ₗ[ℚ] M) (T : (ι → M) →ₗ[ℚ] (ι → M)) (hT : ∀ x i, T x i = f i (x (σ i))) :
    LinearMap.trace ℚ (ι → M) T =
      ∑ i, if σ i = i then LinearMap.trace ℚ M (f i) else 0 := by
  sorry

/-- Test `rgammac_frobenius_compat`: for the graph of Frobenius and a Weil structure `u`, `RΓ_c(u)`
is the geometric Frobenius on compactly supported cohomology used by TraceFormula (stand-in). -/
def compactFrobenius {p a : ℕ} [Fact p.Prime] {E₀ : Type} [Field E₀] [CharZero E₀]
    (X₀ : Geo (GaloisField p a)) (F : Dbc E₀ (extendBase (AlgebraicClosure (GaloisField p a)) X₀)) :
    (lowerShriek (toPoint _)).obj F ⟶ (lowerShriek (toPoint _)).obj F := sorry

example {p a : ℕ} [Fact p.Prime] {E₀ : Type} [Field E₀] [CharZero E₀] (X₀ : Geo (GaloisField p a))
    [AlgebraicGeometry.IsProper (Geo.map (Correspondence.graph (geometricFrobenius X₀)).c₁)]
    (F : Dbc E₀ (extendBase (AlgebraicClosure (GaloisField p a)) X₀))
    (u : CohCorr (Correspondence.graph (geometricFrobenius X₀)) F F) :
    CohCorr.rgammac u = compactFrobenius X₀ F := sorry

namespace Correspondence
/-- API `Correspondence.IsInvariant`: `Z` closed and `c₁(c₂⁻¹(Z)) ⊆ Z`. -/
def IsInvariant {X : Geo k} (c : Correspondence X X) (Z : Set X.space) : Prop :=
  IsClosed Z ∧ (Geo.map c.c₁).base '' ((Geo.map c.c₂).base ⁻¹' Z) ⊆ Z

/-- API `Correspondence.IsLocallyInvariant` (Varshavsky 1.5.1(c)). -/
def IsLocallyInvariant {X : Geo k} (c : Correspondence X X) (Z : Set X.space) : Prop :=
  IsClosed Z ∧ ∀ z ∈ Z, ∃ U : Set X.space, IsOpen U ∧ z ∈ U ∧
    (Geo.map c.c₁).base '' ((Geo.map c.c₂).base ⁻¹' (Z ∩ U)) ⊆ Z ∪ Uᶜ

/-- API `Correspondence.isLocallyInvariant_of_isInvariant`. -/
theorem isLocallyInvariant_of_isInvariant {X : Geo k} (c : Correspondence X X) (Z : Set X.space)
    (h : c.IsInvariant Z) : c.IsLocallyInvariant Z := sorry

/-- Stand-ins (SF.0): restriction of a self-correspondence to an open and to an invariant closed
subscheme. -/
def restrictOpen {X U : Geo k} (c : Correspondence X X) (j : U ⟶ X) : Correspondence U U := sorry
def restrictClosed {X Z : Geo k} (c : Correspondence X X) (i : Z ⟶ X) : Correspondence Z Z := sorry
end Correspondence

namespace CohCorr

/-- API `CohCorr.pullbackAlong` (Varshavsky 1.1.8). -/
def pullbackAlong {X₁ X₂ Y₁ Y₂ : Geo k} {c : Correspondence X₁ X₂} {b : Correspondence Y₁ Y₂}
    (h : c.Hom b) (hcart : IsPullback (Geo.map h.fn) (Geo.map c.c₂) (Geo.map b.c₂) (Geo.map h.f₂) ∨
      (Etale (Geo.map h.fn) ∧ Etale (Geo.map h.f₂))) {F₁ : Dbc E Y₁} {F₂ : Dbc E Y₂} :
    CohCorr b F₁ F₂ → CohCorr c ((pullback h.f₁).obj F₁) ((pullback h.f₂).obj F₂) := sorry

/-- API `CohCorr.restrictOpen` (Varshavsky 1.1.9). -/
def restrictOpen {X U : Geo k} {c : Correspondence X X} (j : U ⟶ X) [IsOpenImmersion (Geo.map j)]
    {F : Dbc E X} : CohCorr c F F →
      CohCorr (c.restrictOpen j) ((pullback j).obj F) ((pullback j).obj F) := sorry

/-- API `CohCorr.restrictClosed` (Varshavsky 1.5.6). -/
def restrictClosed {X Z : Geo k} {c : Correspondence X X} (i : Z ⟶ X)
    [IsClosedImmersion (Geo.map i)] (hinv : c.IsInvariant (Set.range (Geo.map i).base))
    {F : Dbc E X} : CohCorr c F F →
      CohCorr (c.restrictClosed i) ((pullback i).obj F) ((pullback i).obj F) := sorry

/-- API `CohCorr.naiveLocalTerm` (Varshavsky 1.5.7): for `c₂` quasi-finite and a fixed point `y`
over a closed point, the trace of `u_y` on the stalk. -/
def naiveLocalTerm {X : Geo k} {c : Correspondence X X} [LocallyQuasiFinite (Geo.map c.c₂)]
    {F : Dbc E X} (u : CohCorr c F F) (y : ClosedPoint c.fix) : E := sorry

end CohCorr

/-- Test `restrictOpen_univ`: restricting to `U = X` changes nothing. -/
example {X : Geo k} (c : Correspondence X X) :
    Nonempty ((c.restrictOpen (𝟙 X)).C.space ≅ c.C.space) := sorry

/-- Test `isInvariant_point_of_finite_fibre` (Varshavsky Example 1.5.2). -/
example {X : Geo k} (c : Correspondence X X) (x : X.space) (hx : IsClosed ({x} : Set X.space))
    (hfin : ((Geo.map c.c₂).base ⁻¹' {x}).Finite) : c.IsLocallyInvariant {x} := sorry

/-- Test `restrictClosed_graph_compat`: for the graph of `g`, `Z` is invariant iff `g(Z) ⊆ Z`. -/
example {X : Geo k} (g : X ⟶ X) (Z : Set X.space) (hZ : IsClosed Z) :
    (Correspondence.graph g).IsInvariant Z ↔ (Geo.map g).base '' Z ⊆ Z := sorry

/-- Test `not_isInvariant_translation`. -/
example (x : (affineLine k).space) (hx : IsClosed ({x} : Set (affineLine k).space)) :
    ¬ (Correspondence.graph (translateOne k)).IsInvariant {x} := sorry

/-- Stand-in (SF.0): fibre products in `Geo k`, products, and the external product of complexes. -/
def Geo.fiberProduct {X Y Z : Geo k} (f : X ⟶ Z) (g : Y ⟶ Z) : Geo k := sorry
def Geo.fiberFst {X Y Z : Geo k} (f : X ⟶ Z) (g : Y ⟶ Z) : Geo.fiberProduct f g ⟶ X := sorry
def Geo.fiberSnd {X Y Z : Geo k} (f : X ⟶ Z) (g : Y ⟶ Z) : Geo.fiberProduct f g ⟶ Y := sorry
def Geo.prod (X Y : Geo k) : Geo k := sorry
def Geo.prodMap {X Y X' Y' : Geo k} (f : X ⟶ X') (g : Y ⟶ Y') : Geo.prod X Y ⟶ Geo.prod X' Y' := sorry
def boxProduct {X Y : Geo k} (F : Dbc E X) (G : Dbc E Y) : Dbc E (Geo.prod X Y) := sorry

namespace Correspondence
/-- Composite of correspondences on `C ×_Y D`. -/
def comp {X Y Z : Geo k} (c : Correspondence X Y) (d : Correspondence Y Z) : Correspondence X Z :=
  ⟨Geo.fiberProduct c.c₂ d.c₁, Geo.fiberFst c.c₂ d.c₁ ≫ c.c₁, Geo.fiberSnd c.c₂ d.c₁ ≫ d.c₂⟩

def prod {X₁ X₂ Y₁ Y₂ : Geo k} (c : Correspondence X₁ X₂) (c' : Correspondence Y₁ Y₂) :
    Correspondence (Geo.prod X₁ Y₁) (Geo.prod X₂ Y₂) :=
  ⟨Geo.prod c.C c'.C, Geo.prodMap c.c₁ c'.c₁, Geo.prodMap c.c₂ c'.c₂⟩
end Correspondence

namespace CohCorr

/-- API `CohCorr.comp` (Lu–Zheng Construction 2.6). -/
def comp {X Y Z : Geo k} {c : Correspondence X Y} {d : Correspondence Y Z} {L : Dbc E X}
    {M : Dbc E Y} {N : Dbc E Z} (u : CohCorr c L M) (v : CohCorr d M N) :
    CohCorr (c.comp d) L N := sorry

/-- API `CohCorr.comp_assoc`: associativity up to the canonical isomorphism of supports. -/
theorem comp_assoc {X Y Z W : Geo k} {c : Correspondence X Y} {d : Correspondence Y Z}
    {d' : Correspondence Z W} {L : Dbc E X} {M : Dbc E Y} {N : Dbc E Z} {P : Dbc E W}
    (u : CohCorr c L M) (v : CohCorr d M N) (w : CohCorr d' N P) :
    ∃ (e : ((c.comp d).comp d').C ≅ (c.comp (d.comp d')).C)
      (h₁ : e.hom ≫ (c.comp (d.comp d')).c₁ = ((c.comp d).comp d').c₁)
      (h₂ : e.hom ≫ (c.comp (d.comp d')).c₂ = ((c.comp d).comp d').c₂),
      transport e h₁ h₂ L P (comp (comp u v) w) = comp u (comp v w) := sorry

/-- API `CohCorr.id_comp`. -/
theorem id_comp {X Y : Geo k} {c : Correspondence X Y} {L : Dbc E X} {M : Dbc E Y}
    (u : CohCorr c L M) :
    ∃ (e : ((Correspondence.id X).comp c).C ≅ c.C)
      (h₁ : e.hom ≫ c.c₁ = ((Correspondence.id X).comp c).c₁)
      (h₂ : e.hom ≫ c.c₂ = ((Correspondence.id X).comp c).c₂),
      transport e h₁ h₂ L M (comp ((ofId X L L).symm (𝟙 L)) u) = u := sorry

/-- API `CohCorr.rgammac_comp`. -/
theorem rgammac_comp {X Y Z : Geo k} {c : Correspondence X Y} {d : Correspondence Y Z}
    [AlgebraicGeometry.IsProper (Geo.map c.c₁)] [AlgebraicGeometry.IsProper (Geo.map d.c₁)]
    [AlgebraicGeometry.IsProper (Geo.map (c.comp d).c₁)] {L : Dbc E X} {M : Dbc E Y}
    {N : Dbc E Z} (u : CohCorr c L M) (v : CohCorr d M N) :
    rgammac (comp u v) = rgammac u ≫ rgammac v := sorry

/-- API `CohCorr.boxProduct`. -/
def boxProduct {X₁ X₂ Y₁ Y₂ : Geo k} {c : Correspondence X₁ X₂} {c' : Correspondence Y₁ Y₂}
    {F₁ : Dbc E X₁} {F₂ : Dbc E X₂} {G₁ : Dbc E Y₁} {G₂ : Dbc E Y₂}
    (u : CohCorr c F₁ F₂) (u' : CohCorr c' G₁ G₂) :
    CohCorr (c.prod c') (TauCeti.EtaleDuality.boxProduct F₁ G₁)
      (TauCeti.EtaleDuality.boxProduct F₂ G₂) := sorry

end CohCorr

/-- Test `comp_graph`: the composite of the graphs of `g` and `h` is the graph of `h ≫ g` (support
`X`, legs `h ≫ g` and `id`). -/
example {X : Geo k} (g h : X ⟶ X) :
    ∃ e : ((Correspondence.graph g).comp (Correspondence.graph h)).C ≅ X,
      e.hom ≫ (h ≫ g) = ((Correspondence.graph g).comp (Correspondence.graph h)).c₁ ∧
      e.hom ≫ 𝟙 X = ((Correspondence.graph g).comp (Correspondence.graph h)).c₂ := sorry

/-- Test `comp_id`. -/
example {X Y : Geo k} {c : Correspondence X Y} {L : Dbc E X} {M : Dbc E Y} (u : CohCorr c L M) :
    ∃ (e : ((Correspondence.id X).comp c).C ≅ c.C)
      (h₁ : e.hom ≫ c.c₁ = ((Correspondence.id X).comp c).c₁)
      (h₂ : e.hom ≫ c.c₂ = ((Correspondence.id X).comp c).c₂),
      CohCorr.transport e h₁ h₂ L M (CohCorr.comp ((CohCorr.ofId X L L).symm (𝟙 L)) u) = u :=
  CohCorr.id_comp u

/-- Test `comp_point_compat`: over a point composition is composition of morphisms. -/
example (L M N : Dbc E (point k))
    (u : CohCorr (Correspondence.id (point k)) L M) (v : CohCorr (Correspondence.id (point k)) M N) :
    ∃ (e : ((Correspondence.id (point k)).comp (Correspondence.id (point k))).C ≅ (point k))
      (h₁ : e.hom ≫ (Correspondence.id (point k)).c₁ =
        ((Correspondence.id (point k)).comp (Correspondence.id (point k))).c₁)
      (h₂ : e.hom ≫ (Correspondence.id (point k)).c₂ =
        ((Correspondence.id (point k)).comp (Correspondence.id (point k))).c₂),
      CohCorr.ofId _ L N (CohCorr.transport (c' := Correspondence.id (point k)) e h₁ h₂ L N
        (CohCorr.comp u v)) = CohCorr.ofId _ L M u ≫ CohCorr.ofId _ M N v := sorry

/-- Test `comp_assoc_up_to_iso`. -/
example {X Y Z W : Geo k} {c : Correspondence X Y} {d : Correspondence Y Z}
    {d' : Correspondence Z W} {L : Dbc E X} {M : Dbc E Y} {N : Dbc E Z} {P : Dbc E W}
    (u : CohCorr c L M) (v : CohCorr d M N) (w : CohCorr d' N P) :
    ∃ (e : ((c.comp d).comp d').C ≅ (c.comp (d.comp d')).C)
      (h₁ : e.hom ≫ (c.comp (d.comp d')).c₁ = ((c.comp d).comp d').c₁)
      (h₂ : e.hom ≫ (c.comp (d.comp d')).c₂ = ((c.comp d).comp d').c₂),
      CohCorr.transport e h₁ h₂ L P (CohCorr.comp (CohCorr.comp u v) w) =
        CohCorr.comp u (CohCorr.comp v w) := CohCorr.comp_assoc u v w

end Correspondences

end TauCeti.EtaleDuality

namespace TauCeti.EtaleDuality
open AlgebraicGeometry

section Traces
variable {k : Type u} [Field k] {E : Type u} [Field E] [CharZero E]

/-- Stand-ins (EDC.1/dualizing-complex, EDC.0): `H⁰(Y, K_Y)` with restriction to open subschemes,
the proper integration map, and the perfect-complex trace over a point (TraceFormula Layer 2). -/
def dualizingH0 (E : Type u) [Field E] [CharZero E] (Y : Geo k) : ModuleCat.{u} E := sorry
def dualizingRestrict {V Y : Geo k} (j : V ⟶ Y) : dualizingH0 E Y ⟶ dualizingH0 E V := sorry
def integrate (Y : Geo k) [AlgebraicGeometry.IsProper (Geo.map (toPoint Y))] :
    dualizingH0 E Y →ₗ[E] E := sorry
def perfectTrace (F : Dbc E (point k)) : (F ⟶ F) →ₗ[E] E := sorry
def pullbackConst {X Y : Geo k} (f : X ⟶ Y) :
    (pullback f).obj (constantSheaf Y) ≅ (constantSheaf X : Dbc E X) := sorry

namespace CohCorr

/-- API `CohCorr.traceMap` (Varshavsky 1.2.2): `Tr_c : Hom(c₂!c₁^*F, F) → H⁰(Fix(c), K)`. -/
def traceMap {X : Geo k} (c : Correspondence X X) (F : Dbc E X) :
    CohCorr c F F →ₗ[E] dualizingH0 E c.fix := sorry

/-- API `CohCorr.traceMap_linear`. -/
theorem traceMap_linear {X : Geo k} (c : Correspondence X X) (F : Dbc E X)
    (u v : CohCorr c F F) (a : E) :
    traceMap c F (a • u + v) = a • traceMap c F u + traceMap c F v := by
  rw [map_add, map_smul]

/-- API `CohCorr.traceOn`: restriction of the trace class to an open `β ⊆ Fix(c)`. -/
def traceOn {X : Geo k} (c : Correspondence X X) (F : Dbc E X) {β : Geo k} (j : β ⟶ c.fix)
    (u : CohCorr c F F) : dualizingH0 E β :=
  (dualizingRestrict j).hom (traceMap c F u)

/-- API `CohCorr.localTerm`: for `β` open in `Fix(c)` and proper over `k`, `LT_β(u)`. -/
def localTerm {X : Geo k} (c : Correspondence X X) (F : Dbc E X) {β : Geo k} (j : β ⟶ c.fix)
    [AlgebraicGeometry.IsProper (Geo.map (toPoint β))] (u : CohCorr c F F) : E :=
  integrate β (traceOn c F j u)

/-- API `CohCorr.localTerm_sum`: for a finite partition of a proper `Fix(c)` into open pieces,
the integrated trace class is the sum of the local terms. -/
theorem localTerm_sum {X : Geo k} (c : Correspondence X X) (F : Dbc E X)
    [AlgebraicGeometry.IsProper (Geo.map (toPoint c.fix))] {n : ℕ} (β : Fin n → Geo k)
    (j : ∀ i, β i ⟶ c.fix) [∀ i, IsOpenImmersion (Geo.map (j i))]
    [∀ i, AlgebraicGeometry.IsProper (Geo.map (toPoint (β i)))]
    (hpart : ∀ x : c.fix.space, ∃! i, x ∈ Set.range (Geo.map (j i)).base) (u : CohCorr c F F) :
    integrate c.fix (traceMap c F u) = ∑ i, localTerm c F (j i) u := sorry

/-- API `CohCorr.traceMap_trivial`: over a point the trace map is the perfect-complex trace. -/
theorem traceMap_trivial (F : Dbc E (point k))
    [AlgebraicGeometry.IsProper (Geo.map (toPoint (Correspondence.id (point k)).fix))]
    (u : CohCorr (Correspondence.id (point k)) F F) :
    integrate _ (traceMap (Correspondence.id (point k)) F u) = perfectTrace F (ofId _ F F u) := sorry

/-- API `CohCorr.traceMap_restrictOpen`: trace maps commute with open restriction (stand-in for
the induced open immersion of fixed-point schemes). -/
def fixRestrict {X U : Geo k} (c : Correspondence X X) (j : U ⟶ X) :
    (c.restrictOpen j).fix ⟶ c.fix := sorry

theorem traceMap_restrictOpen {X U : Geo k} (c : Correspondence X X) (j : U ⟶ X)
    [IsOpenImmersion (Geo.map j)] (F : Dbc E X) (u : CohCorr c F F) :
    (dualizingRestrict (fixRestrict c j)).hom (traceMap c F u) =
      traceMap (c.restrictOpen j) ((pullback j).obj F) (restrictOpen j u) := sorry

end CohCorr

/-- Test `traceMap_point`: the trace of the identity of `E[n]` over a point is `(-1)^n`. -/
example (n : ℤ) :
    perfectTrace ((constantSheaf (point k))⟦n⟧ : Dbc E (point k)) (𝟙 _) = (-1) ^ n.natAbs := sorry

/-- Test `localTerm_isolated_identity` (Varshavsky 2020, Corollaries 4.11 and 5.6): at an isolated
fixed point of an automorphism of order `m` invertible in `k`, the local term of `id_E` is `1`. -/
example {X : Geo k} (g : X ⟶ X) (m : ℕ) (hm : (m : k) ≠ 0) (hg : ((show End X from g) ^ m : End X) = (1 : End X))
    {β : Geo k} (j : β ⟶ (Correspondence.graph g).fix) [IsOpenImmersion (Geo.map j)]
    [AlgebraicGeometry.IsProper (Geo.map (toPoint β))] (hβ : Nonempty (β.space ≅ (point k).space))
    (u : CohCorr (Correspondence.graph g) (constantSheaf (E := E) X) (constantSheaf X))
    (hu : CohCorr.ofGraph g _ u = (pullbackConst g).hom) :
    CohCorr.localTerm _ _ j u = (1 : E) := sorry

/-- Test `localTerm_naive_compat` (Varshavsky 1.5.7): for `c₂` quasi-finite and an isolated fixed
point `y`, the local term is the naive trace on the stalk. -/
example {X : Geo k} (c : Correspondence X X) [LocallyQuasiFinite (Geo.map c.c₂)] (F : Dbc E X)
    {β : Geo k} (j : β ⟶ c.fix) [IsOpenImmersion (Geo.map j)]
    [AlgebraicGeometry.IsProper (Geo.map (toPoint β))] (y : ClosedPoint c.fix)
    (hβ : Set.range (Geo.map j).base = {y.1}) (hinv : c.IsLocallyInvariant {(Geo.map c.c₂).base
      ((Geo.map (Geo.equalizerι c.c₁ c.c₂)).base y.1)}) (u : CohCorr c F F) :
    CohCorr.localTerm c F j u = CohCorr.naiveLocalTerm u y := sorry

/-- Stand-in (EDC.2): the ℓ-adic Euler characteristic of a proper scheme. -/
def eulerCharacteristic (X : Geo k) : ℤ := sorry

/-- Test `localTerm_not_naive_identity_curve`: for the identity correspondence of a smooth proper
curve, `Fix = X` is not isolated and its local term is `χ(X) = 2 - 2g`, not a sum of `1`s. -/
example {X : Geo k} [SmoothOfRelativeDimension 1 X.obj.hom]
    [AlgebraicGeometry.IsProper (Geo.map (toPoint X))]
    [AlgebraicGeometry.IsProper (Geo.map (toPoint (Correspondence.id X).fix))] :
    integrate _ (CohCorr.traceMap (Correspondence.id X) (constantSheaf X)
      ((CohCorr.ofId X _ _).symm (𝟙 _))) = (eulerCharacteristic X : E) := sorry

/-- Node `EDC.8/trace-pushforward-compatibility` (Varshavsky 1.2.5), stated for the structure
morphism to the point: node `EDC.8/lefschetz-verdier-trace-formula` (Varshavsky 1.2.6). -/
theorem lefschetz_verdier {X : Geo k} (c : Correspondence X X)
    [AlgebraicGeometry.IsProper (Geo.map c.c₁)] [AlgebraicGeometry.IsProper (Geo.map (toPoint X))]
    [AlgebraicGeometry.IsProper (Geo.map (toPoint c.fix))] (F : Dbc E X) (u : CohCorr c F F) :
    perfectTrace _ (CohCorr.rgammac u) = integrate c.fix (CohCorr.traceMap c F u) := sorry

end Traces

/-! ### Specialisation and contracting correspondences -/

section Contracting
variable {k : Type u} [Field k] {E : Type u} [Field E] [CharZero E]

/-- Node `EDC.8/correspondence-specialization`, API `Lift`: a lift of `X` over a trait
`Spec R` (`R` a discrete valuation ring over `k` with residue field `k`), with total space over
`Spec R` and special fibre in `Geo k`. -/
structure Lift (X : Geo k) (R : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    [Algebra k R] where
  total : Over (Spec (CommRingCat.of R))
  special : Geo k
  specialMap : special.space ⟶ total.left

namespace Lift
variable {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R] [Algebra k R]

/-- API `Lift.sp`: `F ↦ Ψ(ϕ_η^*F_η)` (nearby cycles, LefschetzPencilsAndVanishingCycles LPV.0). -/
def sp {X : Geo k} (L : Lift X R) : Dbc E X ⥤ Dbc E L.special := sorry

/-- The constant lift `X × Spec R`, with special fibre `X`. -/
def const (X : Geo k) (R : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    [Algebra k R] : Lift X R := ⟨sorry, X, sorry⟩

/-- API `Lift.sp_const`. -/
theorem sp_const (X : Geo k) : Nonempty ((const X R).sp ≅ (𝟭 (Dbc E X))) := sorry

/-- API `Lift.bcLowerShriek`: the base-change map `f̃_s! sp → sp f_!`. -/
def bcLowerShriek {X Y : Geo k} (LX : Lift X R) (LY : Lift Y R) (f : X ⟶ Y)
    (fs : LX.special ⟶ LY.special) :
    LX.sp ⋙ lowerShriek (E := E) fs ⟶ lowerShriek f ⋙ LY.sp := sorry

end Lift

/-- A lift of a self-correspondence: a lift of `X` and the special correspondence. -/
structure CorrLift {X : Geo k} (c : Correspondence X X) (R : Type u) [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [Algebra k R] where
  liftX : Lift X R
  special : Correspondence liftX.special liftX.special

namespace CohCorr
variable {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R] [Algebra k R]

/-- API `CohCorr.sp` (Varshavsky 1.3.4). -/
def sp {X : Geo k} {c : Correspondence X X} (cl : CorrLift c R) {F : Dbc E X}
    (u : CohCorr c F F) : CohCorr cl.special (cl.liftX.sp.obj F) (cl.liftX.sp.obj F) := sorry

/-- Stand-in: the specialisation map on `H⁰(Fix, K)`. -/
def spFix {X : Geo k} {c : Correspondence X X} (cl : CorrLift c R) :
    dualizingH0 E c.fix ⟶ dualizingH0 E cl.special.fix := sorry

/-- API `CohCorr.traceMap_sp` (Varshavsky 1.3.5). -/
theorem traceMap_sp {X : Geo k} {c : Correspondence X X} (cl : CorrLift c R) (F : Dbc E X)
    (u : CohCorr c F F) :
    (spFix cl).hom (traceMap c F u) = traceMap cl.special (cl.liftX.sp.obj F) (sp cl u) := sorry

end CohCorr

/-- Test `sp_const_trivial`. -/
example (R : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R] [Algebra k R] :
    Nonempty ((Lift.const (point k) R).sp ≅ (𝟭 (Dbc E (point k)))) := Lift.sp_const _

/-- Stand-in (LPV.0): nearby cycles of a lift, and the generic pullback. -/
def nearbyCycles {X : Geo k} {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    [Algebra k R] (L : Lift X R) : Dbc E X ⥤ Dbc E L.special := sorry

/-- Test `sp_nearby_compat`: `sp` is the nearby-cycles functor of the lift. -/
example {X : Geo k} (R : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    [Algebra k R] (L : Lift X R) : Nonempty (L.sp ≅ nearbyCycles (E := E) L) := sorry

/-- Stand-in (Varshavsky 1.4.1): the deformation to the normal cone of `Z ↪ X`, a lift of `X` whose
special fibre is the normal cone, with its zero section. -/
def normalConeLift {X Z : Geo k} (i : Z ⟶ X) (R : Type u) [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [Algebra k R] : Lift X R := sorry
def zeroSection {X Z : Geo k} (i : Z ⟶ X) (R : Type u) [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [Algebra k R] : Z ⟶ (normalConeLift i R).special := sorry

/-- Test `sp_normalCone_point`: for `Z = X = Spec k` the deformation is constant. -/
example (R : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R] [Algebra k R] :
    Nonempty ((normalConeLift (𝟙 (point k)) R).special.space ≅ (point k).space) := sorry

/-- Test `sp_normalCone_zeroSection` (Verdier, Varshavsky Proposition 1.4.2): restricting `sp F` to
the zero section recovers `F|_Z`. -/
example {X Z : Geo k} (i : Z ⟶ X) (R : Type u) [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [Algebra k R] (F : Dbc E X) :
    Nonempty ((pullback (zeroSection i R)).obj ((normalConeLift i R).sp.obj F) ≅
      (pullback i).obj F) := sorry

namespace Correspondence

/-- The ideal sheaf of `Z` pulled back along the two legs. -/
abbrev leg₁Ideal {X : Geo k} (c : Correspondence X X) (I : X.space.IdealSheafData) :
    c.C.space.IdealSheafData := I.comap (Geo.map c.c₁)
abbrev leg₂Ideal {X : Geo k} (c : Correspondence X X) (I : X.space.IdealSheafData) :
    c.C.space.IdealSheafData := I.comap (Geo.map c.c₂)

/-- API `Correspondence.Stabilizes` (Varshavsky 2.1.1(a)): `c₁·I_Z ⊆ c₂·I_Z·O_C`. -/
def Stabilizes {X : Geo k} (c : Correspondence X X) (I : X.space.IdealSheafData) : Prop :=
  c.leg₁Ideal I ≤ c.leg₂Ideal I

/-- API `Correspondence.IsContractingNear` (Varshavsky 2.1.1(b)). -/
def IsContractingNear {X : Geo k} (c : Correspondence X X) (I : X.space.IdealSheafData) : Prop :=
  c.Stabilizes I ∧ ∃ n : ℕ, 1 ≤ n ∧ c.leg₁Ideal I ^ n ≤ c.leg₂Ideal I ^ (n + 1)

/-- API `Correspondence.IsContractingNearFix` (Varshavsky 2.1.1(c)). -/
def IsContractingNearFix {X : Geo k} (c : Correspondence X X) (I : X.space.IdealSheafData) : Prop :=
  ∃ (W : Geo k) (j : W ⟶ c.C), IsOpenImmersion (Geo.map j) ∧
    Set.range (Geo.map (Geo.equalizerι c.c₁ c.c₂)).base ⊆ Set.range (Geo.map j).base ∧
    (c.restrictSupport j).IsContractingNear I

/-- API `Correspondence.frobeniusTwist` (Varshavsky 2.2.1): `c^{(n)} = (Frⁿ ∘ c₁, c₂)`. -/
def frobeniusTwist {X : Geo k} (c : Correspondence X X) (Fr : X ⟶ X) (n : ℕ) :
    Correspondence X X :=
  ⟨c.C, c.c₁ ≫ (show X ⟶ X from ((show End X from Fr) ^ n : End X)), c.c₂⟩

/-- API `Correspondence.Stabilizes.isInvariant` (Varshavsky 2.1.2(a)). -/
theorem Stabilizes.isInvariant {X : Geo k} {c : Correspondence X X} {I : X.space.IdealSheafData}
    (h : c.Stabilizes I) : c.IsInvariant (I.support : Set X.space) := sorry

/-- Stand-in (Varshavsky 1.4.1, 1.4.3): the normal cone of `I`, its zero section, and the map of
normal cones induced by the deformed correspondence. -/
def normalCone {Y : Scheme.{u}} (I : Y.IdealSheafData) : Scheme.{u} := sorry
def normalConeZero {Y : Scheme.{u}} (I : Y.IdealSheafData) : I.subscheme ⟶ normalCone I := sorry
def normalConeMap {X : Geo k} (c : Correspondence X X) (I : X.space.IdealSheafData) :
    normalCone (c.leg₂Ideal I) ⟶ normalCone I := sorry

/-- API `Correspondence.isContractingNear_iff_normalCone` (Varshavsky 2.1.2(b)). -/
theorem isContractingNear_iff_normalCone {X : Geo k} (c : Correspondence X X)
    (I : X.space.IdealSheafData) :
    c.IsContractingNear I ↔ c.Stabilizes I ∧
      Set.range (normalConeMap c I).base ⊆ Set.range (normalConeZero I).base := sorry

end Correspondence

/-- API `ramification` (Varshavsky 2.2.2): the least `m` with `(√J)^m ⊆ J` on every affine open,
`J` the pullback of `I`. -/
noncomputable def ramification {X Y : Geo k} (f : X ⟶ Y) (I : Y.space.IdealSheafData) : ℕ :=
  sInf {m : ℕ | ∀ U : X.space.affineOpens,
    (Ideal.radical ((I.comap (Geo.map f)).ideal U)) ^ m ≤ (I.comap (Geo.map f)).ideal U}

/-- Test `frobenius_isContractingNear_point`: the graph of Frobenius contracts near the ideal of an
`𝔽_q`-rational point (stand-in for the point's ideal sheaf). -/
def rationalPointIdeal {p a : ℕ} [Fact p.Prime] {X₀ : Geo (GaloisField p a)}
    (x : ClosedPoint X₀) :
    (extendBase (AlgebraicClosure (GaloisField p a)) X₀).space.IdealSheafData := sorry

example {p a : ℕ} [Fact p.Prime] (X₀ : Geo (GaloisField p a)) (x : ClosedPoint X₀)
    (hx : residueCard x = p ^ a) :
    (Correspondence.graph (geometricFrobenius X₀)).IsContractingNear (rationalPointIdeal x) := sorry

/-- Test `identity_not_contracting`. -/
example {X : Geo k} (I : X.space.IdealSheafData) (hne : (I.support : Set X.space).Nonempty)
    (hnopen : ¬ IsOpen (I.support : Set X.space)) :
    ¬ (Correspondence.id X).IsContractingNear I := sorry

/-- Test `isContractingNear_empty`. -/
example {X : Geo k} (c : Correspondence X X) :
    c.IsContractingNear ⊤ ∧ c.IsContractingNear ⊥ := sorry

/-- Test `ramification_etale`: for `f` étale and `I` radical with nonempty support, `ram = 1`. -/
example {X Y : Geo k} (f : X ⟶ Y) [Etale (Geo.map f)] (I : Y.space.IdealSheafData)
    (hrad : ∀ U, Ideal.radical (I.ideal U) = I.ideal U)
    (hne : ((I.comap (Geo.map f)).support : Set X.space).Nonempty) :
    ramification f I = 1 := sorry

/-- Node `EDC.8/contracting-local-terms` (Varshavsky 2.1.3(b)). -/
theorem contracting_localTerm {X Z : Geo k} (c : Correspondence X X) (i : Z ⟶ X)
    [IsClosedImmersion (Geo.map i)] (I : X.space.IdealSheafData)
    (hI : (I.support : Set X.space) = Set.range (Geo.map i).base) (hc : c.IsContractingNearFix I)
    (hinv : c.IsInvariant (Set.range (Geo.map i).base)) (F : Dbc E X) {β : Geo k}
    (jβ : β ⟶ c.fix) [IsOpenImmersion (Geo.map jβ)] [AlgebraicGeometry.IsProper (Geo.map (toPoint β))]
    (jβZ : β ⟶ (c.restrictClosed i).fix) [IsOpenImmersion (Geo.map jβZ)] (u : CohCorr c F F) :
    CohCorr.localTerm c F jβ u =
      CohCorr.localTerm (c.restrictClosed i) _ jβZ (CohCorr.restrictClosed i hinv u) := sorry

/-- Node `EDC.8/fujiwara-varshavsky-trace-formula` (Varshavsky 2.3.2): for a correspondence
defined over `𝔽_q` with `c₁` proper over `U`, `c₂` quasi-finite over `U` and `X ∖ U` locally
invariant, for `qⁿ` large the trace of `RΓ_c(u)` is the sum of naive local terms over fixed points
in `c₂⁻¹(U)`. Stated here with `c₁` proper and `c₂` quasi-finite globally (the README states the
version over `U`), and with `F` vanishing on `X ∖ U`. -/
theorem fujiwara_varshavsky {p a : ℕ} [Fact p.Prime] {E₀ : Type} [Field E₀] [CharZero E₀]
    (X₀ : Geo (GaloisField p a)) (c : Correspondence (extendBase (AlgebraicClosure (GaloisField p a)) X₀)
      (extendBase (AlgebraicClosure (GaloisField p a)) X₀))
    (U : Set (extendBase (AlgebraicClosure (GaloisField p a)) X₀).space) (hU : IsOpen U)
    (hloc : c.IsLocallyInvariant Uᶜ) {Z : Geo (AlgebraicClosure (GaloisField p a))}
    (iZ : Z ⟶ extendBase (AlgebraicClosure (GaloisField p a)) X₀) [IsClosedImmersion (Geo.map iZ)]
    (hZ : Set.range (Geo.map iZ).base = Uᶜ) :
    ∃ d : ℕ, ∀ n : ℕ, d < (p ^ a) ^ n →
      ∀ (F : Dbc E₀ (extendBase (AlgebraicClosure (GaloisField p a)) X₀))
        (hF : IsZero ((pullback iZ).obj F))
        [AlgebraicGeometry.IsProper (Geo.map (c.frobeniusTwist (geometricFrobenius X₀) n).c₁)]
        [LocallyQuasiFinite (Geo.map (c.frobeniusTwist (geometricFrobenius X₀) n).c₂)]
        (u : CohCorr (c.frobeniusTwist (geometricFrobenius X₀) n) F F),
        perfectTrace _ (CohCorr.rgammac u) =
          ∑ᶠ (y : ClosedPoint (c.frobeniusTwist (geometricFrobenius X₀) n).fix)
            (_ : (Geo.map c.c₂).base ((Geo.map (Geo.equalizerι
              (c.frobeniusTwist (geometricFrobenius X₀) n).c₁ c.c₂)).base y.1) ∈ U),
            CohCorr.naiveLocalTerm u y := sorry

/-- Node `EDC.8/finite-order-local-terms` (Varshavsky 2020, 4.11 and 5.3–5.6): for an automorphism
of order `m` invertible in `k` and an isolated fixed point, the true local term is naive. -/
theorem finite_order_local_term {X : Geo k} (g : X ⟶ X) (m : ℕ) (hm : (m : k) ≠ 0)
    (hg : ((show End X from g) ^ m : End X) = (1 : End X)) [LocallyQuasiFinite (Geo.map (Correspondence.graph g).c₂)]
    (F : Dbc E X) {β : Geo k} (j : β ⟶ (Correspondence.graph g).fix) [IsOpenImmersion (Geo.map j)]
    [AlgebraicGeometry.IsProper (Geo.map (toPoint β))] (y : ClosedPoint (Correspondence.graph g).fix)
    (hβ : Set.range (Geo.map j).base = {y.1}) (u : CohCorr (Correspondence.graph g) F F) :
    CohCorr.localTerm _ F j u = CohCorr.naiveLocalTerm u y := sorry

end Contracting
end TauCeti.EtaleDuality

namespace TauCeti
/-- API `GradedFrobeniusDuality.ofSmoothProper`: the datum of a smooth proper `X₀` of pure dimension
`d` over `𝔽_q`, built from EDC.2's Poincaré duality (stand-in for that construction). -/
def GradedFrobeniusDuality.ofSmoothProper {p a : ℕ} [Fact p.Prime] (E : Type) [Field E]
    [CharZero E] (X₀ : TauCeti.EtaleDuality.Geo (GaloisField p a)) (d : ℕ)
    [AlgebraicGeometry.SmoothOfRelativeDimension d X₀.obj.hom]
    [AlgebraicGeometry.IsProper X₀.obj.hom] : GradedFrobeniusDuality E := sorry
end TauCeti
