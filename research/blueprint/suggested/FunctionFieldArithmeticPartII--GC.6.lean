import Mathlib.Algebra.Group.Subgroup.Ker
import Mathlib.LinearAlgebra.PiTensorProduct.Finite
import Mathlib.LinearAlgebra.Trace
import Mathlib.Logic.Equiv.Fin.Rotate
import TauCeti.FieldTheory.FunctionField.Place.Approximation

/-!
# Ramified norms and quadratic traces: GC.6 target signatures

This file is not the roadmap and is not exhaustive. The definitive specification is
`research/blueprint/readmes/FunctionFieldArithmeticPartII--GC.6.md`.
These are suggested signatures, not implementation claims. The only new data
definition is a subgroup of the existing product of unit groups.

The geometric root Picard stack, its norm and section spaces, torsor homotopy
fibres and lisse Frobenius stalks require the suppliers named in the README.
Their targets are not encoded by arbitrary propositions or substitute carriers.
The native tensor calculation below is the linear-algebra input to the geometric
closed-point comparison, not a definition of that comparison.
-/

namespace TauCeti.RamifiedClassField.GC6

open scoped TensorProduct

universe u v

section RootUnits

variable {A : Type u} {B : Type v} [CommRing A] [CommRing B]

/-- Coordinates for sections of the root multiplicative sheaf on a framed chart. -/
def rootUnitCoordinates (r : A →+* B) : Subgroup (Aˣ × Bˣ) :=
  ((Units.map r.toMonoidHom).comp (MonoidHom.fst Aˣ Bˣ)).eqLocus
    ((powMonoidHom 2).comp (MonoidHom.snd Aˣ Bˣ))

theorem mem_rootUnitCoordinates (r : A →+* B) (u : Aˣ) (v : Bˣ) :
    (u, v) ∈ rootUnitCoordinates r ↔ Units.map r.toMonoidHom u = v ^ 2 :=
  sorry

theorem rootUnitCoordinates_ext (r : A →+* B)
    (x y : rootUnitCoordinates r) (h₁ : x.1.1 = y.1.1) (h₂ : x.1.2 = y.1.2) :
    x = y :=
  sorry

theorem rootUnitCoordinates_fst_kernel (r : A →+* B) (v : Bˣ) :
    (1, v) ∈ rootUnitCoordinates r ↔ v ^ 2 = 1 :=
  sorry

/-- Compatibility with ordinary units when the residue ring has one element. -/
theorem rootUnitCoordinates_empty_residue (r : A →+* B) [Subsingleton B] :
    rootUnitCoordinates r = ⊤ :=
  sorry

/-- Both residue roots are retained, even when the ordinary unit is fixed. -/
example : ((1 : ℤˣ), (-1 : ℤˣ)) ∈ rootUnitCoordinates (RingHom.id ℤ) :=
  sorry

example : ((1 : ℤˣ), (1 : ℤˣ)) ≠ ((1 : ℤˣ), (-1 : ℤˣ)) :=
  sorry

/-- Root compatibility is stronger than being an arbitrary pair of units. -/
example : ((-1 : ℤˣ), (1 : ℤˣ)) ∉ rootUnitCoordinates (RingHom.id ℤ) :=
  sorry

end RootUnits

section Approximation

variable {k : Type u} {F : Type v} [Field k] [Field F] [Algebra k F]

/-- Nonzero simultaneous residue prescriptions, including an empty index set.
The weak approximation theorem itself is already in Tau Ceti. -/
theorem exists_unit_with_residues {ι : Type*} [Finite ι]
    (P : ι → TauCeti.Place k F) (hP : Function.Injective P)
    (y : ∀ i, (P i).ResidueFieldˣ) :
    ∃ g : Fˣ, ∃ hg : ∀ i, (g : F) ∈ (P i).integers,
      ∀ i, IsLocalRing.residue (P i).integers ⟨(g : F), hg i⟩ = (y i : (P i).ResidueField) :=
  sorry

example : ∃ g : Fˣ, (g : F) = 1 :=
  sorry

end Approximation

section CyclicTrace

variable {E : Type*} [Field E]
variable {V : Type*} [AddCommGroup V] [Module E V] [FiniteDimensional E V]

/-- One Frobenius is applied during the whole cycle. In dimension one, the
trace is the local scalar, independently of the closed-point degree. -/
theorem rankOne_cyclicTensor_trace (n : ℕ) (hV : Module.finrank E V = 1)
    (a : E) :
    LinearMap.trace E (⨂[E] _ : Fin (n + 1), V)
      ((PiTensorProduct.map (fun i : Fin (n + 1) =>
          if i = Fin.last n then a • (LinearMap.id : V →ₗ[E] V) else LinearMap.id)).comp
        (PiTensorProduct.reindex E (fun _ : Fin (n + 1) => V)
          (finRotate (n + 1)).symm).toLinearMap) = a :=
  sorry

/-- Degree two and inert scalar: raising the scalar to the degree would fail. -/
example :
    LinearMap.trace ℚ (⨂[ℚ] _ : Fin 2, ℚ)
      ((PiTensorProduct.map (fun i : Fin 2 =>
          if i = Fin.last 1 then (-1 : ℚ) • (LinearMap.id : ℚ →ₗ[ℚ] ℚ) else LinearMap.id)).comp
        (PiTensorProduct.reindex ℚ (fun _ : Fin 2 => ℚ)
          (finRotate 2).symm).toLinearMap) = -1 :=
  sorry

/-- A nonquadratic scalar checks that the cyclic identity is linear algebra. -/
example :
    LinearMap.trace ℚ (⨂[ℚ] _ : Fin 3, ℚ)
      ((PiTensorProduct.map (fun i : Fin 3 =>
          if i = Fin.last 2 then (2 : ℚ) • (LinearMap.id : ℚ →ₗ[ℚ] ℚ) else LinearMap.id)).comp
        (PiTensorProduct.reindex ℚ (fun _ : Fin 3 => ℚ)
          (finRotate 3).symm).toLinearMap) = 2 :=
  sorry

end CyclicTrace

end TauCeti.RamifiedClassField.GC6
