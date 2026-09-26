import Mathlib.RingTheory.Ideal.AssociatedPrime.Finiteness
import Mathlib.Data.ZMod.Basic

/-!
# Suggested forms for the baseline prime-filtration strand of part P7

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/DeformationAndDerivedPatchingAlgebra--P7.md` is definitive.
These forms let contributors and reviewers converge on names and signatures.
They introduce no new prime-filtration carrier, theorem or implementation claim.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
This file has not been compiled in this browser worker's environment.
The examples are limited to the baseline strand, not the eight-stage part.
-/

#check Submodule.IsQuotientEquivQuotientPrime
#check Submodule.isQuotientEquivQuotientPrime_iff
#check IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime
#check IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime
#check associatedPrimes.finite

universe u v

section BaselineReuse

variable (R : Type u) [CommRing R] [IsNoetherianRing R]
variable (M : Type v) [AddCommGroup M] [Module R M] [Module.Finite R M]

/-- Direct use of the existing filtration; this is not a replacement definition. -/
example :
    ∃ s : RelSeries {(N₁, N₂) |
        Submodule.IsQuotientEquivQuotientPrime (A := R) (M := M) N₁ N₂},
      s.head = ⊥ ∧ s.last = ⊤ := by
  exact IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime R M

/-- The quotient in a step is taken inside the upper submodule. -/
example {N₁ N₂ : Submodule R M}
    (h : N₁.IsQuotientEquivQuotientPrime N₂) :
    N₁ ≤ N₂ ∧ ∃ p : PrimeSpectrum R,
      Nonempty ((↥N₂ ⧸ N₁.submoduleOf N₂) ≃ₗ[R] R ⧸ p.1) := by
  exact h

/-- The actual induction interface. The motive is a hypothesis supplied by a
consumer, not an opaque mathematical definition. -/
example
    {motive : (N : Type v) → [AddCommGroup N] → [Module R N] →
      [Module.Finite R N] → Prop}
    (hzero : (N : Type v) → [AddCommGroup N] → [Module R N] →
      [Module.Finite R N] → [Subsingleton N] → motive N)
    (hprime : (N : Type v) → [AddCommGroup N] → [Module R N] →
      [Module.Finite R N] → (p : PrimeSpectrum R) →
      (N ≃ₗ[R] R ⧸ p.1) → motive N)
    (hext : (N₁ : Type v) → [AddCommGroup N₁] → [Module R N₁] →
      [Module.Finite R N₁] →
      (N₂ : Type v) → [AddCommGroup N₂] → [Module R N₂] →
      [Module.Finite R N₂] →
      (N₃ : Type v) → [AddCommGroup N₃] → [Module R N₃] →
      [Module.Finite R N₃] →
      (f : N₁ →ₗ[R] N₂) → (g : N₂ →ₗ[R] N₃) →
      Function.Injective f → Function.Surjective g → Function.Exact f g →
      motive N₁ → motive N₃ → motive N₂) : motive M := by
  exact IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime R
    (inferInstance : Module.Finite R M) hzero hprime hext

end BaselineReuse

/-! ## Regression examples using actual module carriers -/

-- Zero module: no prime need be chosen before the zero case.
example :
    ∃ s : RelSeries {(N₁, N₂) |
        Submodule.IsQuotientEquivQuotientPrime
          (A := ℤ) (M := Fin 0 → ℤ) N₁ N₂},
      s.head = ⊥ ∧ s.last = ⊤ := by
  exact IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime
    ℤ (Fin 0 → ℤ)

-- Finite generation is not finiteness of the underlying set or finite length.
example :
    ∃ s : RelSeries {(N₁, N₂) |
        Submodule.IsQuotientEquivQuotientPrime (A := ℤ) (M := ℤ) N₁ N₂},
      s.head = ⊥ ∧ s.last = ⊤ := by
  exact IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime ℤ ℤ

-- Repeated residue-characteristic factors are allowed.
example :
    ∃ s : RelSeries {(N₁, N₂) |
        Submodule.IsQuotientEquivQuotientPrime (A := ℤ) (M := ZMod 4) N₁ N₂},
      s.head = ⊥ ∧ s.last = ⊤ := by
  exact IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime ℤ (ZMod 4)

-- Two explicit steps in the nonsplit Z/4 filtration.
example :
    Submodule.IsQuotientEquivQuotientPrime
      (⊥ : Submodule ℤ (ZMod 4))
      (Submodule.span ℤ ({2} : Set (ZMod 4))) := by
  sorry

example :
    Submodule.IsQuotientEquivQuotientPrime
      (Submodule.span ℤ ({2} : Set (ZMod 4)))
      (⊤ : Submodule ℤ (ZMod 4)) := by
  sorry

-- No homomorphism from Z/2 can lift the nonzero residue class to an odd element.
-- This rules out a linear splitting of the canonical projection Z/4 -> Z/2.
example (f : ZMod 2 →ₗ[ℤ] ZMod 4) : f 1 ≠ 1 ∧ f 1 ≠ 3 := by
  sorry

-- The zero ring is permitted; every finite free module over it is zero.
example :
    ∃ s : RelSeries {(N₁, N₂) |
        Submodule.IsQuotientEquivQuotientPrime
          (A := ZMod 1) (M := Fin 2 → ZMod 1) N₁ N₂},
      s.head = ⊥ ∧ s.last = ⊤ := by
  exact IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime
    (ZMod 1) (Fin 2 → ZMod 1)
