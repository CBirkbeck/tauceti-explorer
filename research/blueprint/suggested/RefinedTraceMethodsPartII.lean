import Mathlib.Algebra.Algebra.Unitization
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.Polynomial.Basic

/-!
# Suggested interfaces: henselian pairs and the cyclotomic trace

This file is a roadmap, not a completed formalisation. The proofs are placeholders.
The reader document gives the full statements, hypotheses, source locators, APIs,
unit tests and proof routes for HP.0–HP.9. This file states only the lightweight HP.0
interfaces expressible with the pinned libraries. The spectrum, cyclotomic,
functor-category, Witt-complex and quasisyntomic carriers are supplied by the
roadmaps named in that document; their targets are stated there.

The unitization and nonunital ring structures below are the existing Mathlib ones.
In particular, the product includes the product of the two nonunital components.
The henselian predicate is expressed using the existing predicate on its
unitization; `isHenselianNonUnital_iff_roots` states its intrinsic characterization.
-/

namespace TauCeti.HenselianTrace

open Polynomial

universe u v w

/-- HP.0: existence of a quasi-inverse, without asserting the unitization is local. -/
def IsLocalNonUnital (I : Type u) [NonUnitalCommRing I] : Prop :=
  ∀ x : I, ∃ y : I, x + y + x * y = 0

section UnitizationInterfaces

variable (R : Type u) (I : Type v) [CommRing R] [NonUnitalCommRing I]
  [Module R I] [SMulCommClass R I I] [IsScalarTower R I I]

/-- The existing augmentation homomorphism's kernel. -/
def augmentationIdeal : Ideal (Unitization R I) :=
  RingHom.ker (Unitization.fstHom R I).toRingHom

/-- The kernel identification is part of the augmented-equivalence interface. -/
theorem mem_augmentationIdeal (x : Unitization R I) :
    x ∈ augmentationIdeal R I ↔ x.fst = 0 := by
  sorry

theorem inr_mem_augmentationIdeal (x : I) :
    (Unitization.inr x : Unitization R I) ∈ augmentationIdeal R I := by
  sorry

theorem isLocalNonUnital_iff_jacobson :
    IsLocalNonUnital I ↔ augmentationIdeal R I ≤ Ideal.jacobson ⊥ := by
  sorry

theorem isLocalNonUnital_iff_isUnit :
    IsLocalNonUnital I ↔
      ∀ x : I, IsUnit (1 + (Unitization.inr x : Unitization R I)) := by
  sorry

-- The xy summand is essential for a general nonunital algebra.
example (r s : R) (x y : I) :
    (Unitization.mk (r, x) * Unitization.mk (s, y) : Unitization R I) =
      Unitization.mk (r * s, r • y + s • x + x * y) := by
  sorry

-- The square-zero test specializes the same existing multiplication.
example (h : ∀ x y : I, x * y = 0) (r s : R) (x y : I) :
    (Unitization.mk (r, x) * Unitization.mk (s, y) : Unitization R I) =
      Unitization.mk (r * s, r • y + s • x) := by
  sorry

example (x : I) :
    Unitization.fstHom R I (Unitization.inrNonUnitalAlgHom R I x) = 0 := by
  sorry

example (C : Type w) [CommRing C] [Algebra R C] (f : I →ₙₐ[R] C) (x : I) :
    Unitization.lift f (Unitization.inr x : Unitization R I) = f x := by
  sorry

end UnitizationInterfaces

section LocalInterfaces

variable {I : Type u} [NonUnitalCommRing I]

/-- The root operation is unique; no extra data structure is introduced. -/
theorem IsLocalNonUnital.quasiInverse_unique (h : IsLocalNonUnital I)
    (x y z : I) (hy : x + y + x * y = 0) (hz : x + z + x * z = 0) : y = z := by
  sorry

theorem IsLocalNonUnital.existsUnique (h : IsLocalNonUnital I) (x : I) :
    ∃! y : I, x + y + x * y = 0 := by
  sorry

theorem IsLocalNonUnital.map_quasiInverse {J : Type v} [NonUnitalCommRing J]
    (f : I →ₙ+* J) (x y : I) (h : x + y + x * y = 0) :
    f x + f y + f x * f y = 0 := by
  sorry

-- Degenerate test: the zero nonunital ring.
example [Subsingleton I] : IsLocalNonUnital I := by
  sorry

-- Square-zero test: the quasi-inverse is additive negation.
example (h : ∀ x y : I, x * y = 0) (x : I) : x + (-x) + x * (-x) = 0 := by
  sorry

example (h : ∀ x y : I, x * y = 0) : IsLocalNonUnital I := by
  sorry

-- Non-example: at x=1 the equation in Z would require 1+2y=0.
example : ¬ IsLocalNonUnital ℤ := by
  sorry

-- A non-square-zero unitization retains the original nonunital product.
example : (Unitization.inr (1 : ℤ) : Unitization ℤ ℤ) ^ 2 = Unitization.inr 1 := by
  sorry

end LocalInterfaces

/-- HP.0: the intrinsic henselian condition in its unitization formulation. -/
def IsHenselianNonUnital (I : Type u) [NonUnitalCommRing I] : Prop :=
  HenselianRing (Unitization ℤ I) (augmentationIdeal ℤ I)

section HenselianInterfaces

variable (I : Type u) [NonUnitalCommRing I]

/-- The root criterion uses polynomials whose coefficients lie in the ideal. -/
theorem isHenselianNonUnital_iff_roots :
    IsHenselianNonUnital I ↔
      ∀ (n : ℕ), 0 < n → ∀ g : Polynomial (Unitization ℤ I),
        (∀ k : ℕ, g.coeff k ∈ augmentationIdeal ℤ I) →
        ∃! x : I, (Polynomial.X * (1 + Polynomial.X) ^ (n - 1) + g).eval
          (Unitization.inr x : Unitization ℤ I) = 0 := by
  sorry

theorem IsHenselianNonUnital.isLocalNonUnital (h : IsHenselianNonUnital I) :
    IsLocalNonUnital I := by
  sorry

-- The zero object satisfies the full root criterion, including every degree n.
example [Subsingleton I] : IsHenselianNonUnital I := by
  sorry

-- Agreement with the existing henselian-pair predicate on a nilpotent ideal.
example (A : Type v) [CommRing A] (J : Ideal A) (hJ : IsNilpotent J) :
    HenselianRing A J := by
  sorry

-- n=1 and a constant coefficient -a give the root a.
example (a : I) :
    (Polynomial.X + Polynomial.C (-(Unitization.inr a : Unitization ℤ I))).eval
      (Unitization.inr a : Unitization ℤ I) = 0 := by
  sorry

end HenselianInterfaces

end TauCeti.HenselianTrace
