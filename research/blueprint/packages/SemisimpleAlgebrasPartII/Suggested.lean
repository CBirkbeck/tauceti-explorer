/-
This file is not the roadmap and is not exhaustive. The README is definitive.
The declarations suggest Lean forms so that contributors and reviewers converge
on names and signatures. Proofs are admitted with `sorry`.
-/
import TauCeti.Algebra.BrauerGroup.BaseChange
import TauCeti.Algebra.BrauerGroup.Division
import TauCeti.Algebra.BrauerGroup.Quaternion
import Mathlib.Analysis.Complex.Polynomial.Basic
import TauCeti.Algebra.CentralSimple.Index
import TauCeti.Algebra.CentralSimple.FiniteSeparable
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.RingTheory.Morita.Matrix
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.Algebra.Azumaya.Matrix
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.FieldTheory.PurelyInseparable.Basic
import TauCeti.FieldTheory.GaloisCohomology.Coefficients
import TauCeti.RepresentationTheory.Homological.ContCohomology.Corestriction

import Mathlib.LinearAlgebra.Matrix.Module
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.LinearAlgebra.Dimension.Free
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.RingTheory.Finiteness.Basic
import Mathlib.Algebra.Algebra.Tower
import Mathlib.Algebra.Polynomial.Monic
import Mathlib.Tactic.Ring

set_option maxHeartbeats 800000
universe u
namespace SemisimpleAlgebrasPartII
open scoped TensorProduct Quaternion Matrix.Module

noncomputable abbrev divisionColumnModule {K D L : Type*} [Field K] [DivisionRing D]
    [Field L] [Algebra K D] [Algebra K L] (n : ℕ)
    (ρ : D →ₐ[K] Matrix (Fin n) (Fin n) L) : Module D (Fin n → L) :=
  Module.compHom (Fin n → L) ρ.toRingHom

section FieldArithmetic
variable {K : Type u} [Field K]

theorem indexBrauerCongr {A B : CSA.{u,u} K} (h : IsBrauerEquivalent A B) :
    TauCeti.Algebra.index K A = TauCeti.Algebra.index K B := by
  sorry

noncomputable def classIndex (α : BrauerGroup.{u,u} K) : ℕ :=
  Quotient.lift (fun A : CSA.{u,u} K => TauCeti.Algebra.index K A)
    (fun _ _ h => indexBrauerCongr h) α

theorem classIndex_mk (A : CSA.{u,u} K) :
    classIndex (TauCeti.BrauerGroup.mk A) = TauCeti.Algebra.index K A := by
  sorry

theorem classIndex_pos (α : BrauerGroup.{u,u} K) : 0 < classIndex α := by
  sorry

theorem classIndex_eq_one_iff (α : BrauerGroup.{u,u} K) : classIndex α = 1 ↔ α = 1 := by
  sorry

-- matrix_identity
example (n : ℕ) [NeZero n] :
    classIndex (TauCeti.BrauerGroup.mk (TauCeti.CSA.of K (Matrix (Fin n) (Fin n) K))) = 1 := by
  sorry
-- finite_field
example [Finite K] (α : BrauerGroup.{u,u} K) : classIndex α = 1 := by
  sorry
-- division_representative
example (D : Type u) [DivisionRing D] [Algebra K D] [Algebra.IsCentral K D]
    [FiniteDimensional K D] :
    classIndex (TauCeti.BrauerGroup.mk (TauCeti.CSA.of K D)) = TauCeti.Algebra.deg K D := by
  sorry
-- zero_excluded
example (α : BrauerGroup.{u,u} K) : classIndex α ≠ 0 := by
  sorry

-- hamilton_period_index: concrete nonsplit class, not an arbitrary representative.
example : classIndex (TauCeti.BrauerGroup.mk (TauCeti.CSA.of ℝ ℍ[ℝ])) = 2 ∧
    orderOf (TauCeti.BrauerGroup.mk (TauCeti.CSA.of ℝ ℍ[ℝ])) = 2 := by
  sorry

-- complexification_lowers_index: the finite quadratic extension strictly lowers index.
example : classIndex (TauCeti.BrauerGroup.baseChange ℝ ℂ
    (TauCeti.BrauerGroup.mk (TauCeti.CSA.of ℝ ℍ[ℝ]))) = 1 ∧
    classIndex (TauCeti.BrauerGroup.mk (TauCeti.CSA.of ℝ ℍ[ℝ])) = 2 := by
  sorry

noncomputable def splittingDegrees (α : BrauerGroup.{u,u} K) : Set ℕ :=
  {d | ∃ (L : Type u) (_ : Field L) (_ : Algebra K L),
    FiniteDimensional K L ∧ Module.finrank K L = d ∧
      TauCeti.BrauerGroup.baseChange K L α = 1}

theorem mem_splittingDegrees (α : BrauerGroup.{u,u} K) (d : ℕ) :
    d ∈ splittingDegrees α ↔ ∃ (L : Type u) (_ : Field L) (_ : Algebra K L),
      FiniteDimensional K L ∧ Module.finrank K L = d ∧
        TauCeti.BrauerGroup.baseChange K L α = 1 := by
  sorry

theorem one_mem_splittingDegrees_iff (α : BrauerGroup.{u,u} K) :
    1 ∈ splittingDegrees α ↔ α = 1 := by
  sorry

theorem splittingDegrees_nonempty (α : BrauerGroup.{u,u} K) :
    (splittingDegrees α).Nonempty := by
  sorry

theorem splittingDegrees_positive (α : BrauerGroup.{u,u} K) {d : ℕ}
    (h : d ∈ splittingDegrees α) : 0 < d := by
  sorry

theorem classIndex_mem_splittingDegrees (α : BrauerGroup.{u,u} K) :
    classIndex α ∈ splittingDegrees α := by
  sorry

-- identity_degree_one
example : 1 ∈ splittingDegrees (1 : BrauerGroup.{u,u} K) := by
  sorry
-- zero_degree
example (α : BrauerGroup.{u,u} K) : 0 ∉ splittingDegrees α := by
  sorry
-- nontrivial_no_degree_one
example (α : BrauerGroup.{u,u} K) (h : α ≠ 1) : 1 ∉ splittingDegrees α := by
  sorry
-- quaternion_degree_two: the Hamilton division class is split over the quadratic extension ℂ/ℝ.
example : 2 ∈ splittingDegrees
    (TauCeti.BrauerGroup.mk (TauCeti.CSA.of ℝ ℍ[ℝ])) := by
  sorry

-- The left D-action is genuine instance data, not a predicate asserting the target arithmetic.
theorem divisionModuleDimension (D L : Type u) [DivisionRing D] [Field L]
    [Algebra K D] [Algebra.IsCentral K D] [FiniteDimensional K D]
    [Algebra K L] [FiniteDimensional K L]
    (e : (L ⊗[K] D) ≃ₐ[L]
      Matrix (Fin (TauCeti.Algebra.deg K D)) (Fin (TauCeti.Algebra.deg K D)) L) :
    let ρ : D →ₐ[K]
        Matrix (Fin (TauCeti.Algebra.deg K D)) (Fin (TauCeti.Algebra.deg K D)) L :=
      (e.restrictScalars K).toAlgHom.comp Algebra.TensorProduct.includeRight
    ∃ s : Module D (Fin (TauCeti.Algebra.deg K D) → L),
      letI := s
      s = divisionColumnModule (TauCeti.Algebra.deg K D) ρ ∧
      IsScalarTower K D (Fin (TauCeti.Algebra.deg K D) → L) ∧
      Module.Finite D (Fin (TauCeti.Algebra.deg K D) → L) ∧
      Module.finrank K (Fin (TauCeti.Algebra.deg K D) → L) =
        (TauCeti.Algebra.deg K D)^2 *
          Module.finrank D (Fin (TauCeti.Algebra.deg K D) → L) := by
  sorry

theorem indexDividesSplittingDegree (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] (α : BrauerGroup.{u,u} K)
    (h : TauCeti.BrauerGroup.baseChange K L α = 1) :
    classIndex α ∣ Module.finrank K L := by
  sorry

theorem classIndex_baseChange_dvd (L : Type u) [Field L] [Algebra K L]
    (α : BrauerGroup.{u,u} K) :
    classIndex (TauCeti.BrauerGroup.baseChange K L α) ∣ classIndex α := by
  sorry

theorem indexDividesDegreeIndex (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] (α : BrauerGroup.{u,u} K) :
    classIndex α ∣ Module.finrank K L *
      classIndex (TauCeti.BrauerGroup.baseChange K L α) := by
  sorry

theorem minimumSplittingDegree (α : BrauerGroup.{u,u} K) :
    IsLeast (splittingDegrees α) (classIndex α) := by
  sorry

theorem gcdSplittingDegrees (α : BrauerGroup.{u,u} K) (n : ℕ) :
    (∀ d ∈ splittingDegrees α, n ∣ d) ↔ n ∣ classIndex α := by
  sorry

theorem sameCyclicIndex (α β : BrauerGroup.{u,u} K)
    (h : Subgroup.zpowers α = Subgroup.zpowers β) : classIndex α = classIndex β := by
  sorry

-- The field homomorphism uses the normalized full comparison described in SA.1.
-- Its cohomology equation uses the chosen closure and coefficient identifications.
noncomputable def brauerCorestriction (K L : Type u) [Field K] [Field L]
    [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L] :
    BrauerGroup.{u,u} L →* BrauerGroup.{u,u} K := by
  sorry

theorem brauerCorestriction_res (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] (α : BrauerGroup.{u,u} K) :
    brauerCorestriction K L (TauCeti.BrauerGroup.baseChange K L α) =
      α ^ Module.finrank K L := by
  sorry

theorem corestrictionRestrictionDegree (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] (α : BrauerGroup.{u,u} K) :
    brauerCorestriction K L (TauCeti.BrauerGroup.baseChange K L α) =
      α ^ Module.finrank K L := by
  sorry

theorem brauerCorestriction_comp (L E : Type u) [Field L] [Field E]
    [Algebra K L] [Algebra L E] [Algebra K E] [IsScalarTower K L E]
    [FiniteDimensional K L] [FiniteDimensional L E] [FiniteDimensional K E]
    [Algebra.IsSeparable K L] [Algebra.IsSeparable L E] [Algebra.IsSeparable K E] :
    brauerCorestriction K E =
      (brauerCorestriction K L).comp (brauerCorestriction L E) := by
  sorry

theorem brauerCorestriction_self :
    brauerCorestriction K K = MonoidHom.id (BrauerGroup.{u,u} K) := by
  sorry

-- identity_extension
example (α : BrauerGroup.{u,u} K) : brauerCorestriction K K α = α := by
  sorry

-- trivial_class
example (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L] : brauerCorestriction K L 1 = 1 := by
  sorry

-- quadratic_restriction
example (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L] (hdeg : Module.finrank K L = 2)
    (α : BrauerGroup.{u,u} K) :
    brauerCorestriction K L (TauCeti.BrauerGroup.baseChange K L α) = α ^ 2 := by
  sorry

-- inseparable_boundary
example (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L]
    [IsPurelyInseparable K L] (hdeg : 1 < Module.finrank K L) :
    ¬ Algebra.IsSeparable K L := by
  sorry

theorem separableSplittingAnnihilates (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (α : BrauerGroup.{u,u} K) (h : TauCeti.BrauerGroup.baseChange K L α = 1) :
    α ^ Module.finrank K L = 1 := by
  sorry

theorem classPowerIndex (α : BrauerGroup.{u,u} K) : α ^ classIndex α = 1 := by
  sorry

theorem brauerFiniteOrder (α : BrauerGroup.{u,u} K) : IsOfFinOrder α := by
  sorry

theorem brauerOrder_pos (α : BrauerGroup.{u,u} K) : 0 < orderOf α := by
  sorry

theorem periodDividesIndex (α : BrauerGroup.{u,u} K) : orderOf α ∣ classIndex α := by
  sorry

theorem primeToPSplitting (α : BrauerGroup.{u,u} K) (p : ℕ)
    (hp : p.Prime) (h : ¬p ∣ orderOf α) :
    ∃ (L : Type u) (_ : Field L) (_ : Algebra K L),
      FiniteDimensional K L ∧ Algebra.IsSeparable K L ∧
      ¬p ∣ Module.finrank K L ∧ TauCeti.BrauerGroup.baseChange K L α = 1 := by
  sorry

theorem indexPrimeDividesPeriod (α : BrauerGroup.{u,u} K) (p : ℕ)
    (hp : p.Prime) (h : p ∣ classIndex α) : p ∣ orderOf α := by
  sorry

theorem samePrimeDivisors (α : BrauerGroup.{u,u} K) (p : ℕ) (hp : p.Prime) :
    p ∣ orderOf α ↔ p ∣ classIndex α := by
  sorry

end FieldArithmetic

section UnitsTransfer
variable (K L : Type u) [Field K] [Field L]
    [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (U : Subgroup (TauCeti.AbsoluteGaloisGroup K)) [U.FiniteIndex]
    (hU : IsOpen (U : Set (TauCeti.AbsoluteGaloisGroup K)))
    (cK : Additive (BrauerGroup.{u,u} K) ≃+
      TauCeti.ContCohomology.H2 (TauCeti.AbsoluteGaloisGroup K) (TauCeti.UnitsCoeff K))
    (cLU : Additive (BrauerGroup.{u,u} L) ≃+
      TauCeti.ContCohomology.H2 U (TauCeti.UnitsCoeff K))

/-- Transport of the native degree-two transfer along specified full comparisons.
The lower comparison already incorporates the closure and coefficient identification. -/
noncomputable def transportedCorestriction :
    BrauerGroup.{u,u} L →* BrauerGroup.{u,u} K where
  toFun β := Additive.toMul (cK.symm
    (TauCeti.ContCohomology.explicitCor2
      (TauCeti.AbsoluteGaloisGroup K) (TauCeti.UnitsCoeff K) U hU
        (cLU (Additive.ofMul β))))
  map_one' := by sorry
  map_mul' := by sorry

theorem transportedCorestriction_cohomology (β : BrauerGroup.{u,u} L) :
    cK (Additive.ofMul (transportedCorestriction K L U hU cK cLU β)) =
      TauCeti.ContCohomology.explicitCor2
        (TauCeti.AbsoluteGaloisGroup K) (TauCeti.UnitsCoeff K) U hU
          (cLU (Additive.ofMul β)) := by
  sorry

theorem transportedCorestriction_res
    (hindex : U.index = Module.finrank K L)
    (hres : ∀ α : BrauerGroup.{u,u} K,
      cLU (Additive.ofMul (TauCeti.BrauerGroup.baseChange K L α)) =
        TauCeti.ContCohomology.explicitRes2
          (TauCeti.AbsoluteGaloisGroup K) (TauCeti.UnitsCoeff K) U
            (cK (Additive.ofMul α)))
    (α : BrauerGroup.{u,u} K) :
    transportedCorestriction K L U hU cK cLU
      (TauCeti.BrauerGroup.baseChange K L α) = α ^ Module.finrank K L := by
  sorry

end UnitsTransfer

-- Affine annihilators and the nilpotent boundary (SA.2).
variable {R : Type*} [CommRing R] {M : Type*} [AddCommGroup M] [Module R M]
variable {ι : Type*} [Nonempty ι]
theorem matrixSupport (I : Ideal R) :
    I ≤ Module.annihilator R (ι → M) ↔ I ≤ Module.annihilator R M := by
  sorry

example (I : Ideal R) : I ≤ Module.annihilator R (Fin 2 → M) ↔
    I ≤ Module.annihilator R M := by
  sorry
example : Module.annihilator R (Fin 0 → M) = ⊤ := by
  sorry

example (I : Ideal R) : I ≤ Module.annihilator R (Fin 1 → M) ↔
    I ≤ Module.annihilator R M := by
  sorry
example : (TrivSqZeroExt.inr (1 : ZMod 2) : TrivSqZeroExt (ZMod 2) (ZMod 2)) ≠ 0 := by
  sorry

example : (TrivSqZeroExt.inr (1 : ZMod 2) : TrivSqZeroExt (ZMod 2) (ZMod 2)) ^ 2 = 0 := by
  sorry

theorem nilpotentSupportBoundary :
    (2 : ZMod 4) ^ 2 = 0 ∧
      ¬(2 : ZMod 4) ∈ Module.annihilator (ZMod 4) (ZMod 4) := by
  sorry

-- Restricted matrix-column action and polynomial boundary (SA.0, SA.3).
theorem divisionColumnAction {K D L : Type*} [Field K] [DivisionRing D]
    [Field L] [Algebra K D] [Algebra K L] (n : ℕ)
    (ρ : D →ₐ[K] Matrix (Fin n) (Fin n) L) (a : D) (v : Fin n → L) (i : Fin n) :
    letI := divisionColumnModule n ρ
    (a • v) i = ∑ j, ρ a i j * v j := by
  rfl

theorem divisionColumnTower {K D L : Type*} [Field K] [DivisionRing D]
    [Field L] [Algebra K D] [Algebra K L] (n : ℕ)
    (ρ : D →ₐ[K] Matrix (Fin n) (Fin n) L) :
    let := divisionColumnModule n ρ
    IsScalarTower K D (Fin n → L) := by
  sorry

theorem divisionColumnFinite {K D L : Type*} [Field K] [DivisionRing D]
    [Field L] [Algebra K D] [Algebra K L] [Module.Finite K L] (n : ℕ)
    (ρ : D →ₐ[K] Matrix (Fin n) (Fin n) L) :
    let := divisionColumnModule n ρ
    Module.Finite D (Fin n → L) := by
  sorry

theorem divisionColumnDimension {K D L : Type*} [Field K] [DivisionRing D]
    [Field L] [Algebra K D] [Algebra K L] [Module.Finite K D] [Module.Finite K L]
    (n : ℕ) (ρ : D →ₐ[K] Matrix (Fin n) (Fin n) L) :
    let := divisionColumnModule n ρ
    Module.finrank K (Fin n → L) = Module.finrank K D * Module.finrank D (Fin n → L) := by
  sorry

theorem splittingDegreeDvd {K D L : Type*} [Field K] [DivisionRing D]
    [Field L] [Algebra K D] [Algebra K L] [Module.Finite K D] [Module.Finite K L]
    (n : ℕ) (hn : 0 < n) (hdim : Module.finrank K D = n ^ 2)
    (ρ : D →ₐ[K] Matrix (Fin n) (Fin n) L) : n ∣ Module.finrank K L := by
  sorry

-- column_rank_one
example {K D L : Type*} [Field K] [DivisionRing D] [Field L]
    [Algebra K D] [Algebra K L] (ρ : D →ₐ[K] Matrix (Fin 1) (Fin 1) L)
    (a : D) (v : Fin 1 → L) :
    letI := divisionColumnModule 1 ρ
    (a • v) 0 = ρ a 0 0 * v 0 := by
  sorry

-- column_empty
example {K D L : Type*} [Field K] [DivisionRing D] [Field L]
    [Algebra K D] [Algebra K L] [Module.Finite K L]
    (ρ : D →ₐ[K] Matrix (Fin 0) (Fin 0) L) :
    letI := divisionColumnModule 0 ρ
    Module.Finite D (Fin 0 → L) := by
  sorry

-- column_degree_boundary
example {K D L : Type*} [Field K] [DivisionRing D] [Field L]
    [Algebra K D] [Algebra K L] [Module.Finite K D] [Module.Finite K L]
    (ρ : D →ₐ[K] Matrix (Fin 2) (Fin 2) L)
    (hD : Module.finrank K D = 4) (hL : Module.finrank K L = 3) : False := by
  sorry

-- column_rank_two
example {K D L : Type*} [Field K] [DivisionRing D] [Field L]
    [Algebra K D] [Algebra K L] (ρ : D →ₐ[K] Matrix (Fin 2) (Fin 2) L)
    (a : D) (v : Fin 2 → L) :
    letI := divisionColumnModule 2 ρ
    (a • v) 0 = ρ a 0 0 * v 0 + ρ a 0 1 * v 1 := by
  sorry

example {K : Type*} [Field K] :
    Module.finrank K (Fin 0 → K) = 0 := by
  sorry

abbrev DualNumbers := TrivSqZeroExt (ZMod 2) (ZMod 2)

def epsilon : DualNumbers := TrivSqZeroExt.inr (1 : ZMod 2)

theorem epsilon_ne_zero : epsilon ≠ 0 := by
  sorry

theorem epsilon_sq : epsilon ^ 2 = 0 := by
  sorry

theorem two_epsilon : (2 : DualNumbers) * epsilon = 0 := by
  sorry

open Polynomial

theorem distinctMonicFrobeniusRoots :
    (X : Polynomial DualNumbers) ≠ X + C epsilon ∧
      (X : Polynomial DualNumbers).Monic ∧ (X + C epsilon).Monic ∧
      (X : Polynomial DualNumbers) ^ 2 = (X + C epsilon) ^ 2 := by
  sorry

end SemisimpleAlgebrasPartII
