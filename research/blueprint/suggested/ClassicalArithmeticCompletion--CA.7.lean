import TauCeti.CategoryTheory.GrothendieckGroup.Split
import TauCeti.Algebra.Category.ModuleCat.CartanMap
import Mathlib.RingTheory.Finiteness.Projective
import Mathlib.RingTheory.ClassGroup.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.NumberTheory.GaussSum

/-!
# Classical arithmetic: CA.7 continuation

Suggested statements only. Proofs are deliberately omitted using `sorry`.
The README is the full target-level specification. Heavy constructions whose
carriers are absent at the pins are specified there, not introduced here as
uninterpreted types, placeholder propositions, or sorry'd data definitions.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
Namespaces and names are suggestions, not claims of implementation.
-/

open CategoryTheory
open scoped nonZeroDivisors TensorProduct

namespace TauCeti.ClassicalArithmetic.CA7Continuation

universe u

section StableEquality

variable (R : Type u) [Ring R]

/-- The existing finite-projective category; no replacement K₀ carrier. -/
abbrev FPModuleCat := (TauCeti.finiteProjectiveModules.{u} R).FullSubcategory

abbrev ProjectiveK0 := TauCeti.SplitK0.{u} (FPModuleCat R)

variable (P Q : Type u) [AddCommGroup P] [Module R P]
  [AddCommGroup Q] [Module R Q]

/-- A common finite free summand, with its size retained in the witness. -/
def StableEquivalent : Prop :=
  ∃ n : ℕ, Nonempty ((P × (Fin n → R)) ≃ₗ[R] (Q × (Fin n → R)))

theorem StableEquivalent.refl : StableEquivalent R P P := by sorry

theorem StableEquivalent.symm (h : StableEquivalent R P Q) :
    StableEquivalent R Q P := by sorry

theorem StableEquivalent.trans
    (T : Type u) [AddCommGroup T] [Module R T]
    (hPQ : StableEquivalent R P Q) (hQT : StableEquivalent R Q T) :
    StableEquivalent R P T := by sorry

theorem StableEquivalent.of_equiv (e : P ≃ₗ[R] Q) :
    StableEquivalent R P Q := by sorry

theorem StableEquivalent.prod
    (P' Q' : Type u) [AddCommGroup P'] [Module R P']
    [AddCommGroup Q'] [Module R Q']
    (h : StableEquivalent R P Q) (h' : StableEquivalent R P' Q') :
    StableEquivalent R (P × P') (Q × Q') := by sorry

-- finite-projective-free-complement
theorem finiteProjective_free_complement [Module.Finite R P] [Module.Projective R P] :
    ∃ (n : ℕ) (N : Submodule R (Fin n → R)),
      Module.Finite R N ∧ Module.Projective R N ∧
      Nonempty ((P × N) ≃ₗ[R] (Fin n → R)) := by sorry

-- split-k0-stable-equality
theorem splitK0_of_eq_iff (X Y : FPModuleCat R) :
    TauCeti.SplitK0.of.{u} X = TauCeti.SplitK0.of.{u} Y ↔
      StableEquivalent R X.obj Y.obj := by sorry

example : StableEquivalent ℤ ℤ ℤ := by sorry

example : StableEquivalent ℤ (Fin 0 → ℤ) (Fin 0 → ℤ) := by sorry

example : ¬ StableEquivalent ℤ (Fin 0 → ℤ) ℤ := by sorry

example (X : FPModuleCat R) :
    TauCeti.SplitK0.of.{u} X = TauCeti.SplitK0.of.{u} X ↔
      StableEquivalent R X.obj X.obj := by sorry

end StableEquality

section Restriction

variable {R S : Type u} [Ring R] [Ring S]

-- finite-projective-scalar-change: the restriction half.
-- The arbitrary-ring extension functor requires a balanced tensor carrier;
-- the README specifies it and its induced SplitK0 map.
theorem restrictScalars_finite_projective (f : R →+* S)
    (hS : letI := f.toModule; Module.Finite R S ∧ Module.Projective R S)
    (X : ModuleCat S) [Module.Finite S X] [Module.Projective S X] :
    Module.Finite R ((ModuleCat.restrictScalars f).obj X) ∧
      Module.Projective R ((ModuleCat.restrictScalars f).obj X) := by sorry

end Restriction

section Dedekind

variable (A K : Type u) [CommRing A] [IsDedekindDomain A]
  [Field K] [Algebra A K] [IsFractionRing A K]

-- steinitz-ideal-product
theorem steinitz_ideal_product (I J : (FractionalIdeal A⁰ K)ˣ) :
    Nonempty ((↥((I : FractionalIdeal A⁰ K) : Submodule A K) × ↥((J : FractionalIdeal A⁰ K) : Submodule A K)) ≃ₗ[A]
      (A × ↥(((I : FractionalIdeal A⁰ K) * (J : FractionalIdeal A⁰ K)) : Submodule A K))) := by sorry

-- dedekind-projective-steinitz
theorem dedekind_steinitz
    (M : Type u) [AddCommGroup M] [Module A M] [Module.Finite A M]
    [Module.Projective A M] (h : 0 < Module.finrank K (K ⊗[A] M)) :
    ∃ I : (FractionalIdeal A⁰ K)ˣ,
      Nonempty ((M) ≃ₗ[A]
        ((Fin (Module.finrank K (K ⊗[A] M) - 1) → A) ×
          ↥((I : FractionalIdeal A⁰ K) : Submodule A K))) := by sorry

-- finite-dedekind-torsionfree-projective
theorem dedekind_finite_torsionfree_projective
    (M : Type u) [AddCommGroup M] [Module A M] [Module.Finite A M]
    [Module.IsTorsionFree A M] : Module.Projective A M := by sorry

example (I : (FractionalIdeal A⁰ K)ˣ) :
    Nonempty ((↥((I : FractionalIdeal A⁰ K) : Submodule A K) ×
      ↥((I⁻¹ : FractionalIdeal A⁰ K) : Submodule A K)) ≃ₗ[A] (A × A)) := by sorry

example : Subsingleton (ClassGroup ℤ) := by sorry

end Dedekind

section ProjectiveNorm

variable (A G M : Type u) [CommRing A] [Group G] [Fintype G]
  [AddCommGroup M] [Module (MonoidAlgebra A G) M]

-- projective-group-norm-surjectivity
theorem projective_group_norm_surjective [Module.Projective (MonoidAlgebra A G) M]
    (m : M) (hm : ∀ g : G, MonoidAlgebra.single g (1 : A) • m = m) :
    ∃ x : M, (∑ g : G, MonoidAlgebra.single g (1 : A) • x) = m := by sorry

end ProjectiveNorm

section FiniteGaussProducts

variable (F : Type u) [Field F] [Fintype F]

-- finite-gauss-product: uses Mathlib's sum, including its g(1) = -1 convention.
theorem hasseDavenport_product (χ η : MulChar F ℂ) (ψ : AddChar F ℂ)
    (hψ : ψ ≠ 1) (n : ℕ) (hn : 0 < n)
    (hdiv : n ∣ Fintype.card F - 1) (horder : orderOf η = n) :
    gaussSum (χ ^ n) ψ *
        (∏ j ∈ Finset.range (n - 1), gaussSum (η ^ (j + 1)) ψ) =
      χ (n : F) ^ n *
        (∏ j ∈ Finset.range n, gaussSum (χ * η ^ j) ψ) := by sorry

example (ψ : AddChar F ℂ) (hψ : ψ ≠ 1) :
    gaussSum (1 : MulChar F ℂ) ψ = -1 := by sorry

example (χ : MulChar F ℂ) (hχ : χ ≠ 1) :
    gaussSum χ (1 : AddChar F ℂ) = 0 := by sorry

-- The n = 1 product law retains the same sum and contributes no extra sign.
example (χ : MulChar F ℂ) (ψ : AddChar F ℂ) :
    gaussSum (χ ^ 1) ψ *
        (∏ j ∈ Finset.range 0, gaussSum ((1 : MulChar F ℂ) ^ (j + 1)) ψ) =
      χ (1 : F) ^ 1 *
        (∏ j ∈ Finset.range 1, gaussSum (χ * (1 : MulChar F ℂ) ^ j) ψ) := by sorry

end FiniteGaussProducts

/-!
README-only targets: balanced extension on arbitrary rings and its scalar maps;
Steinitz class and K₀ comparison; order ideles, reduced norms and genus
classification; the Eichler predicate and Jacobinski cancellation; determinant
character homomorphisms, positive Hom quotients and Fröhlich's comparison;
tame local Gauss sums, Artin signs and the root-number class; the integral
group logarithm, determinant descent and the Fröhlich–Taylor equality.

These depend on absent order, character-ring, or noncommutative completion
carriers. Their precise statements, APIs, tests and proof boundaries are in
the paired README and packet. No substitute carrier is asserted here.
-/

end TauCeti.ClassicalArithmetic.CA7Continuation
