import Mathlib
import TauCeti.Algebra.BrauerGroup.BaseChange
import TauCeti.Algebra.BrauerGroup.Division
import TauCeti.Algebra.BrauerGroup.Quaternion
import TauCeti.Algebra.CentralSimple.Index

/-!
# SemisimpleAlgebrasPartII: representative target signatures

The roadmap is README.md. This file records light definitions and theorem
signatures statable against the pinned APIs and is not exhaustive. Brauer groups
are multiplicative, splitting degrees include inseparable extensions, columns
carry the restricted matrix action, and characteristic polynomials use T id - u.
Geometric targets use the supplier contracts in the README.
-/

universe u

namespace TauCetiRoadmap.SemisimpleAlgebrasPartII

open scoped Quaternion Matrix.Module

/-! ## Layer 0: the index of a Brauer class -/

section FieldIndex
variable {K : Type u} [Field K]

/-- The algebra index evaluated on a chosen representative of the existing
Brauer quotient. The representative formula expresses its choice independence. -/
noncomputable def classIndex (α : BrauerGroup.{u,u} K) : ℕ :=
  let A : CSA.{u,u} K := Quotient.out α
  TauCeti.Algebra.index K A

/-- The class index agrees with the index of every central simple representative. -/
theorem classIndex_mk (A : CSA.{u,u} K) :
    classIndex (TauCeti.BrauerGroup.mk A) = TauCeti.Algebra.index K A := by
  sorry

/-- Every Brauer class has strictly positive index. -/
theorem classIndex_pos (α : BrauerGroup.{u,u} K) : 0 < classIndex α := by
  sorry

/-- Index one characterizes the trivial Brauer class. -/
theorem classIndex_eq_one_iff (α : BrauerGroup.{u,u} K) :
    classIndex α = 1 ↔ α = 1 := by
  sorry

/-- A positive matrix stabilization changes degree but has trivial class index. -/
example (n : ℕ) [NeZero n] :
    classIndex (TauCeti.BrauerGroup.mk
      (TauCeti.CSA.of K (Matrix (Fin n) (Fin n) K))) = 1 := by
  sorry

/-- The nonsplit Hamilton class has index and period two. -/
example : classIndex (TauCeti.BrauerGroup.mk (TauCeti.CSA.of ℝ ℍ[ℝ])) = 2 ∧
    orderOf (TauCeti.BrauerGroup.mk (TauCeti.CSA.of ℝ ℍ[ℝ])) = 2 := by
  sorry

/-- Degrees of all finite field extensions splitting the class; separability
is deliberately absent. -/
def splittingDegrees (α : BrauerGroup.{u,u} K) : Set ℕ :=
  {d | ∃ (L : Type u) (_ : Field L) (_ : Algebra K L),
    FiniteDimensional K L ∧ Module.finrank K L = d ∧
      TauCeti.BrauerGroup.baseChange K L α = 1}

/-- The identity class has the ground field as a degree-one splitter. -/
example : 1 ∈ splittingDegrees (1 : BrauerGroup.{u,u} K) := by
  sorry

/-- No extension field has degree zero. -/
example (α : BrauerGroup.{u,u} K) : 0 ∉ splittingDegrees α := by
  sorry

/-- Every finite splitting degree is divisible by the class index, including inseparable degrees. -/
theorem indexDividesSplittingDegree (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] (α : BrauerGroup.{u,u} K)
    (h : TauCeti.BrauerGroup.baseChange K L α = 1) :
    classIndex α ∣ Module.finrank K L := by
  sorry

/-- Every field extension lowers the class index by a divisor. -/
theorem classIndex_baseChange_dvd (L : Type u) [Field L] [Algebra K L]
    (α : BrauerGroup.{u,u} K) :
    classIndex (TauCeti.BrauerGroup.baseChange K L α) ∣ classIndex α := by
  sorry

/-- The reverse divisibility bound for every finite field extension. -/
theorem indexDividesDegreeIndex (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] (α : BrauerGroup.{u,u} K) :
    classIndex α ∣ Module.finrank K L *
      classIndex (TauCeti.BrauerGroup.baseChange K L α) := by
  sorry

/-- The positive index is the attained least finite splitting degree. -/
theorem minimumSplittingDegree (α : BrauerGroup.{u,u} K) :
    IsLeast (splittingDegrees α) (classIndex α) := by
  sorry

/-- The index has the universal common-divisor property for all finite splitting degrees. -/
theorem gcdSplittingDegrees (α : BrauerGroup.{u,u} K) (n : ℕ) :
    (∀ d ∈ splittingDegrees α, n ∣ d) ↔ n ∣ classIndex α := by
  sorry

/-- Classes generating the same cyclic Brauer subgroup have equal indices. -/
theorem sameCyclicIndex (α β : BrauerGroup.{u,u} K)
    (h : Subgroup.zpowers α = Subgroup.zpowers β) : classIndex α = classIndex β := by
  sorry

end FieldIndex

section DivisionColumns

/-- The standard matrix column module restricted along the specified algebra map. -/
noncomputable abbrev divisionColumnModule {K D L : Type*} [Field K] [DivisionRing D]
    [Field L] [Algebra K D] [Algebra K L] (n : ℕ)
    (ρ : D →ₐ[K] Matrix (Fin n) (Fin n) L) : Module D (Fin n → L) :=
  Module.compHom (Fin n → L) ρ.toRingHom

/-- The action is row-by-column, with both summands in the first coordinate. -/
example {K D L : Type*} [Field K] [DivisionRing D] [Field L]
    [Algebra K D] [Algebra K L] (ρ : D →ₐ[K] Matrix (Fin 2) (Fin 2) L)
    (a : D) (v : Fin 2 → L) :
    letI := divisionColumnModule 2 ρ
    (a • v) 0 = ρ a 0 0 * v 0 + ρ a 0 1 * v 1 := by
  sorry

/-- Degree three cannot split a division algebra of degree two. -/
example {K D L : Type*} [Field K] [DivisionRing D] [Field L]
    [Algebra K D] [Algebra K L] [Module.Finite K D] [Module.Finite K L]
    (ρ : D →ₐ[K] Matrix (Fin 2) (Fin 2) L)
    (hD : Module.finrank K D = 4) (hL : Module.finrank K L = 3) : False := by
  sorry

end DivisionColumns

/-! ## Layer 1: period, restriction and corestriction -/

section PeriodIndex
variable {K : Type u} [Field K]

/-- A finite separable splitting degree annihilates the original Brauer class. -/
theorem separableSplittingAnnihilates (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (α : BrauerGroup.{u,u} K) (h : TauCeti.BrauerGroup.baseChange K L α = 1) :
    α ^ Module.finrank K L = 1 := by
  sorry

/-- Raising any field Brauer class to its index gives the identity. -/
theorem classPowerIndex (α : BrauerGroup.{u,u} K) : α ^ classIndex α = 1 := by
  sorry

/-- Every field Brauer class has finite order. -/
theorem brauerFiniteOrder (α : BrauerGroup.{u,u} K) : IsOfFinOrder α := by
  sorry

/-- The period divides the index; it need not equal the index. -/
theorem periodDividesIndex (α : BrauerGroup.{u,u} K) : orderOf α ∣ classIndex α := by
  sorry

/-- A prime not dividing the period admits a prime-to-that-prime finite separable splitter. -/
theorem primeToPSplitting (α : BrauerGroup.{u,u} K) (p : ℕ)
    (hp : p.Prime) (h : ¬p ∣ orderOf α) :
    ∃ (L : Type u) (_ : Field L) (_ : Algebra K L),
      FiniteDimensional K L ∧ Algebra.IsSeparable K L ∧
      ¬p ∣ Module.finrank K L ∧ TauCeti.BrauerGroup.baseChange K L α = 1 := by
  sorry

/-- For every prime, divisibility of period and index is equivalent. -/
theorem samePrimeDivisors (α : BrauerGroup.{u,u} K) (p : ℕ) (hp : p.Prime) :
    p ∣ orderOf α ↔ p ∣ classIndex α := by
  sorry

/-- A nontrivial purely inseparable extension is outside the transfer domain. -/
example (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L]
    [IsPurelyInseparable K L] (hdeg : 1 < Module.finrank K L) :
    ¬ Algebra.IsSeparable K L := by
  sorry

end PeriodIndex

/-! ## Layer 2: geometric Morita theory and exact support -/

section AnnihilatorChecks
variable {R : Type*} [CommRing R] {M : Type*} [AddCommGroup M] [Module R M]

/-- The affine column check uses the library's product-annihilator formula. -/
example (I : Ideal R) : I ≤ Module.annihilator R (Fin 2 → M) ↔
    I ≤ Module.annihilator R M := by
  sorry

/-- Empty columns lose faithfulness: their annihilator is the unit ideal. -/
example : Module.annihilator R (Fin 0 → M) = ⊤ := by
  sorry

/-- Topological support does not detect annihilation by a nilpotent ideal. -/
example : (2 : ZMod 4) ^ 2 = 0 ∧
    ¬(2 : ZMod 4) ∈ Module.annihilator (ZMod 4) (ZMod 4) := by
  sorry

end AnnihilatorChecks

/-! ## Layer 3: Morita characteristic coefficients -/

/-- The characteristic-two dual numbers, using the existing square-zero extension. -/
abbrev DualNumbers := TrivSqZeroExt (ZMod 2) (ZMod 2)

/-- The specified nonzero square-zero element of the dual numbers. -/
def epsilon : DualNumbers := TrivSqZeroExt.inr (1 : ZMod 2)

/-- The chosen coefficient is nonzero even though its square vanishes. -/
example : epsilon ≠ 0 ∧ epsilon ^ 2 = 0 := by
  sorry

open Polynomial

/-- Distinct monic polynomials can have equal Frobenius powers over a
nonreduced base. Coefficient descent must use the actual module action. -/
example : (X : Polynomial DualNumbers) ≠ X + C epsilon ∧
    (X : Polynomial DualNumbers).Monic ∧ (X + C epsilon).Monic ∧
    (X : Polynomial DualNumbers) ^ 2 = (X + C epsilon) ^ 2 := by
  sorry

/-- The rank-one scalar convention is T - b. -/
example {R : Type*} [CommRing R] (b : R) :
    (Matrix.diagonal (fun _ : Fin 1 => b)).charpoly = X - C b := by
  sorry

/-- The empty determinant gives the characteristic polynomial one. -/
example {R : Type*} [CommRing R] :
    (0 : Matrix (Fin 0) (Fin 0) R).charpoly = 1 := by
  sorry

/-! ## Layer 4: relative Cartier and Brauer comparison -/

/-
The README also states the targets whose supplier carriers are absent at the
pins: comparisonBaseChangeUnits, brauerCorestriction and its normalized
cohomology, embedding, tower and identity equations; sheafMorita,
coherentMorita, sheafSupportMorita; splittingTransitionLine, charpolyLineTwist,
moritaCharpoly and its API; finitePushforwardMorita, spectralLineTrivialization,
finitePushforwardLineInvariant, moritaHiggsOverlap, moritaHiggsInvariant and
its API; cartierMiddleImage,
cartierBoundaryAdditivity, cartierBoundaryNaturality, cartierBrauerComparison,
relativeClassVanishingInput, relativeBrauerEquality and relativeMoritaRefinement.
Their full statements, hypotheses and Checks remain in the README.
-/

end TauCetiRoadmap.SemisimpleAlgebrasPartII
