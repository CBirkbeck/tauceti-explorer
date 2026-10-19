import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.Basic.Complex.Basic
import Mathlib.NumberTheory.LSeries.Nonvanishing
import Mathlib.RingTheory.LinearDisjoint

/-!
This file is not the roadmap and is not exhaustive. The definitive roadmap is
research/blueprint/readmes/NonordinaryCMSpecialValues.md. These signatures suggest
Lean forms so that contributors and reviewers converge on names and interfaces.

Baseline: Tau Ceti f790474821cf4256814db967cb154e7af3d0c369;
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

Only light definitions over existing carriers and a few algebraic milestones are
included. The actual CM period lattice, normalized integral zeta class, semilocal
regulator, torsion fields, root numbers, Finis specialization and CM nonvanishing
are fully specified in the README. Their absent carriers are not replaced by
propositions or structures containing the desired theorems. The local proof of
linear disjointness and canonical coefficient-field descent also remain README
targets; the algebraic example below checks precisely the map they must supply.

Every implementation status in the blueprint remains unchecked.
-/

noncomputable section

open scoped TensorProduct

namespace TauCeti.NonordinaryCMSpecialValues

namespace CMPeriod

/-- The scalar quotient of a supplied nonzero period and a supplied complex value.
The native CM curve and its proved period/Galois comparison are README targets.
-/
def normalizedCentralValue (Ω : ℂˣ) (L : ℂ) : ℂ := (Ω : ℂ)⁻¹ * L

theorem value_nonzero (Ω : ℂˣ) (L : ℂ) :
    normalizedCentralValue Ω L ≠ 0 ↔ L ≠ 0 := by
  simp [normalizedCentralValue]

/-- Changing the scalar period alone scales the quotient inversely.
Changing a Néron differential also changes its de Rham generator and Betti map;
that distinction is part of NCM.1/period-change in the README.
-/
theorem scale_period (u Ω : ℂˣ) (L : ℂ) :
    normalizedCentralValue (u * Ω) L =
      (u : ℂ)⁻¹ * normalizedCentralValue Ω L := by
  simp [normalizedCentralValue, mul_comm, mul_left_comm]

example (Ω : ℂˣ) : normalizedCentralValue Ω 0 = 0 := by
  simp [normalizedCentralValue]

example (L : ℂ) : normalizedCentralValue 1 L = L := by
  simp [normalizedCentralValue]

example : normalizedCentralValue (Units.mk0 (2 : ℂ) (by norm_num)) 6 = 3 := by
  norm_num [normalizedCentralValue]

example : normalizedCentralValue (Units.mk0 Complex.I Complex.I_ne_zero) 1 ≠ 0 := by
  exact (value_nonzero _ _).2 one_ne_zero

end CMPeriod

section DirectEvaluation

variable {G : Type*} [Monoid G]

/-- NCM.0/auxiliary-characters uses this existing universal property with ν itself.
This is an import check, not a replacement definition of a Hecke character.
-/
example (χ : G →* ℂ) (g : G) :
    MonoidAlgebra.lift ℂ ℂ G χ (MonoidAlgebra.single g 1) = χ g := by
  simp

example :
    MonoidAlgebra.lift ℂ ℂ ℂ (MonoidHom.id ℂ)
      (MonoidAlgebra.single Complex.I 1) = Complex.I := by
  simp

/-- A direct evaluation and an inverse evaluation differ in this small test. -/
example :
    MonoidAlgebra.lift ℂ ℂ ℂ (MonoidHom.id ℂ)
      (MonoidAlgebra.single Complex.I 1) ≠ (Complex.I : ℂ)⁻¹ := by
  intro h
  have hi := congrArg Complex.im h
  norm_num at hi

end DirectEvaluation

section TensorComparison

variable {R S : Type*} [CommSemiring R] [CommSemiring S] [Algebra R S]
variable {A B : Subalgebra R S}

/-- NCM.5/scalar-tensor-character-comparison: the genuine multiplication map is
injective once the local-field targets have supplied linear disjointness.
No unrestricted ramified-coefficient version is asserted.
-/
example (h : A.LinearDisjoint B) (x : A ⊗[R] B) :
    A.mulMap B x = 0 ↔ x = 0 := by
  sorry

/-- Literal weighted tensors, rather than just their scalar values, are tested.
The character values must belong to A; NCM.2 supplies that field containment.
-/
example {ι : Type*} (s : Finset ι) (χ : ι → A) (x : ι → A ⊗[R] B)
    (h : A.LinearDisjoint B) :
    A.mulMap B (∑ i ∈ s, (χ i ⊗ₜ[R] (1 : B)) * x i) = 0 ↔
      (∑ i ∈ s, (χ i ⊗ₜ[R] (1 : B)) * x i) = 0 := by
  sorry

end TensorComparison

/-- The nonzero quadratic main term in NCM.5 is already a library theorem.
The CM Galois-average estimate is a separate README target.
-/
example {N : ℕ} [NeZero N] (κ : DirichletCharacter ℂ N) (hκ : κ ≠ 1) :
    DirichletCharacter.LFunction κ 1 ≠ 0 := by
  exact DirichletCharacter.LFunction_apply_one_ne_zero hκ

end TauCeti.NonordinaryCMSpecialValues
