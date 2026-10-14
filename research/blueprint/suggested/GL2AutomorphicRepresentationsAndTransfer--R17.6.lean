import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Projective
import Mathlib.LinearAlgebra.Matrix.Charpoly.Coeff
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.Data.ZMod.Basic
import TauCeti.RepresentationTheory.Induction.Mackey.LinearCharacter

/-!
# Characteristic-two soluble cases and transfer interfaces

This file is not the roadmap and is not exhaustive. The definitive specification
is the reader document, including its checks and open proof inputs.

Contributors: Codex (codex-PrYXzU); independent review by Codex (codex-oIRXsf).

Target statements over carriers at Mathlib 082e2d3 and Tau Ceti f790474.
The reader document owns all modular-form, integral cohomology, Katz and
compatible-system targets: their required carriers are not at these pins.
No replacement carriers or assumed propositions are introduced here.

The determinant statements support the retained determinant-untwist target.
The restriction statements support its two irreducibility interfaces; the
index-two statement is an application of the general R01 owner, not a new
induction construction. Its proof must use the two eigenlines, because the
pinned Mackey theorem requires characteristic zero.

The matrix examples check the Frobenius power rule, the auxiliary-prime
companion matrix, and the nonsemisimple dyadic reflection.
-/

set_option autoImplicit false

namespace TauCeti.GL2DyadicPlan

open scoped MatrixGroups
open Polynomial

section Determinant
variable {k G : Type*} [Field k] [IsAlgClosed k] [CharP k 2] [Group G]

/-- In characteristic two, a scalar character has a unique square-root character. -/
theorem square_root_character (δ : G →* kˣ) :
    ∃! ξ : G →* kˣ, ∀ g, ξ g ^ 2 = δ g := by
  sorry

/-- The scalar twist by the inverse square root of the determinant has determinant one. -/
theorem determinant_untwist (r : G →* GL (Fin 2) k) (ξ : G →* kˣ)
    (hξ : ∀ g, ξ g ^ 2 = Matrix.GeneralLinearGroup.det (r g)) :
    ∀ g, Matrix.GeneralLinearGroup.det
      (Matrix.GeneralLinearGroup.scalar (Fin 2) (ξ g)⁻¹ * r g) = 1 := by
  sorry

/-- There are no nonidentity scalar matrices of determinant one in rank two. -/
theorem scalar_det_one (a : kˣ)
    (ha : Matrix.GeneralLinearGroup.det
      (Matrix.GeneralLinearGroup.scalar (Fin 2) a) = 1) : a = 1 := by
  sorry

/-- An order-dividing-two matrix in characteristic two has determinant one. -/
theorem involution_det_one (A : GL (Fin 2) k) (hA : A ^ 2 = 1) :
    Matrix.GeneralLinearGroup.det A = 1 := by
  sorry

/-- Determinant-normalized representations have exactly their projective kernel. -/
theorem kernel_eq_projective_kernel (r : G →* GL (Fin 2) k)
    (hr : ∀ g, Matrix.GeneralLinearGroup.det (r g) = 1) :
    r.ker = (Matrix.ProjGenLinGroup.mk.comp r).ker := by
  sorry

end Determinant

section Restriction
variable {k G V : Type*} [Field k] [Group G] [AddCommGroup V] [Module k V]

/-- Equal operator images give identical invariant-subspace conditions. -/
theorem irreducible_restriction_of_range (ρ : Representation k G V) (H : Subgroup G)
    (hH : Set.range (ρ.comp H.subtype) = Set.range ρ) :
    Representation.IsIrreducible (ρ.comp H.subtype) ↔ Representation.IsIrreducible ρ := by
  sorry

end Restriction

section QuadraticInduction
universe u
variable {k G : Type u} [Field k] [Group G] [Finite G] [IsAlgClosed k] [CharP k 2]
variable {N : Subgroup G} [N.Normal]

/-- For index two, distinct conjugate characters suffice without Maschke. -/
theorem simple_quadratic_induction (χ : N →* kˣ) (hN : Nat.card (G ⧸ N) = 2) :
    CategoryTheory.Simple (TauCeti.indFDRep (FDRep.ofLinearCharacter (k := k) χ)) ↔
      ∀ s ∉ N, ∃ x : N, χ (MulAut.conjNormal s x) ≠ χ x := by
  sorry

end QuadraticInduction

section MatrixChecks
variable {k : Type*} [CommRing k]

/-- A local residue degree raises each Satake root separately. -/
example (α β : k) (d : ℕ) :
    Matrix.charpoly ((Matrix.diagonal ![α, β]) ^ d) =
      (X - C (α ^ d)) * (X - C (β ^ d)) := by
  sorry

/-- The first three oldforms have a zero U-eigenvalue, including repeated-root cases. -/
example (a b : k) :
    Matrix.charpoly (!![a, 1, 0; -b, 0, 1; 0, 0, 0] : Matrix (Fin 3) (Fin 3) k) =
      X * (X ^ 2 - C a * X + C b) := by
  sorry

example : Matrix.trace ((!![2, 0; 0, 3] : Matrix (Fin 2) (Fin 2) ℚ) ^ 2) = 13 := by
  sorry

example : Matrix.det ((!![2, 0; 0, 3] : Matrix (Fin 2) (Fin 2) ℚ) ^ 2) = 36 := by
  sorry

example : Matrix.trace ((!![2, 0; 0, 3] : Matrix (Fin 2) (Fin 2) ℚ) ^ 2) ≠
    Matrix.trace (!![2, 0; 0, 3] : Matrix (Fin 2) (Fin 2) ℚ) ^ 2 := by
  sorry

/-- Reduction does not turn a reflection into the identity matrix. -/
example : (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) (ZMod 2)) ^ 2 = 1 := by
  sorry

example : (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) (ZMod 2)) ≠ 1 := by
  sorry

/-- A nonzero nilpotent companion operator still has a zero eigenvector. -/
example : ( !![0, 1, 0; 0, 0, 1; 0, 0, 0] : Matrix (Fin 3) (Fin 3) (ZMod 2)) ≠ 0 := by
  sorry

/-- The companion operator has nilpotency index exactly three. -/
example : ( !![0, 1, 0; 0, 0, 1; 0, 0, 0] : Matrix (Fin 3) (Fin 3) (ZMod 2)) ^ 3 = 0 := by
  sorry

example : ( !![0, 1, 0; 0, 0, 1; 0, 0, 0] : Matrix (Fin 3) (Fin 3) (ZMod 2)) ^ 2 ≠ 0 := by
  sorry

end MatrixChecks
end TauCeti.GL2DyadicPlan
