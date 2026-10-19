import Mathlib.RingTheory.Ideal.Operations
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Basis.Defs
import Mathlib.RingTheory.WittVector.Identities
import Mathlib.Data.ZMod.Basic

/-!
# Tensor displays and ordinary lifts: representative native-carrier signatures

This file is not the roadmap and is not an exhaustive list of its declarations.
The accompanying README states every target, hypothesis, API, test and source locator.
These small definitions have actual bodies over carriers at the pinned libraries.
Frames, displays, parahoric tensor torsors and p-divisible deformation spaces are
README targets: they are not represented here by placeholder data or axioms.

The first-order ideal is used in TD.1/constant-first-order and TD.2/horizontal-tensors.
The matrix fragment records the comparison of TD.0/tilde-frobenius-map and the
nonuniqueness check in TD.1/connection-comparison. The family predicate records
only the underlying linear-algebra condition in TD.2/horizontal-tensors; it is
not a replacement for the planned mixed-tensor or group-torsor constructions.
-/

namespace TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII

set_option autoImplicit false

noncomputable section

variable {R : Type*} [CommRing R]

/-- The same formula applies to p and to the reflex uniformizer. -/
def firstOrderIdeal (m : Ideal R) (π : R) : Ideal R :=
  m ^ 2 ⊔ Ideal.span {π}

theorem square_le_firstOrderIdeal (m : Ideal R) (π : R) :
    m ^ 2 ≤ firstOrderIdeal m π := by
  sorry

theorem parameter_mem_firstOrderIdeal (m : Ideal R) (π : R) :
    π ∈ firstOrderIdeal m π := by
  sorry

example (m : Ideal R) : firstOrderIdeal m 0 = m ^ 2 := by
  sorry

example (m : Ideal R) : firstOrderIdeal m 1 = ⊤ := by
  sorry

/-- Normal-coordinate matrix of the tilde-to-Frobenius comparison. -/
def scaledComparison (q : R) : Matrix (Fin 2) (Fin 2) R :=
  !![1, 0; 0, q]

theorem scaledComparison_det (q : R) :
    Matrix.det (scaledComparison q) = q := by
  sorry

theorem scaledComparison_injective_iff (q : R) :
    Function.Injective (Matrix.mulVec (scaledComparison q)) ↔
      ∀ x : R, q * x = 0 → x = 0 := by
  sorry

example : ¬ Function.Injective
    (Matrix.mulVec (scaledComparison (3 : ZMod 3))) := by
  sorry

/-- A commuting square with the comparison does not determine its other edge. -/
example : ∃ c : Matrix (Fin 2) (Fin 2) (ZMod 3),
    c ≠ 1 ∧ scaledComparison 0 * c = scaledComparison 0 := by
  sorry

variable {M N P : Type*}
variable [AddCommGroup M] [Module R M]
variable [AddCommGroup N] [Module R N]
variable [AddCommGroup P] [Module R P]
variable {ι : Type*}

/-- Transport equality for a specified family in an existing module carrier. -/
def CarriesFamily (e : M ≃ₗ[R] N) (s : ι → M) (t : ι → N) : Prop :=
  ∀ i, e (s i) = t i

theorem carriesFamily_symm (e : M ≃ₗ[R] N) (s : ι → M) (t : ι → N) :
    CarriesFamily e s t ↔ CarriesFamily e.symm t s := by
  sorry

theorem carriesFamily_trans (e : M ≃ₗ[R] N) (f : N ≃ₗ[R] P)
    (s : ι → M) (t : ι → N) (u : ι → P)
    (he : CarriesFamily e s t) (hf : CarriesFamily f t u) :
    CarriesFamily (e.trans f) s u := by
  sorry

example (s : ι → M) : CarriesFamily (LinearEquiv.refl R M) s s := by
  sorry

example (e : M ≃ₗ[R] N) (s : Empty → M) (t : Empty → N) :
    CarriesFamily e s t := by
  sorry

/-- This is a check against the existing Witt identity, not a new planned theorem. -/
example {p : ℕ} [Fact p.Prime] (x : WittVector p R) :
    WittVector.frobenius (WittVector.verschiebung x) = x * p := by
  sorry

end

end TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII
