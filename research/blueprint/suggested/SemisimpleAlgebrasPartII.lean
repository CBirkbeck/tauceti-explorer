/-!
This file is a blueprint prototype, not a claim of formalisation. The admitted declarations
state the proposed library interfaces. Names and signatures may change during implementation.
The whole file has NOT been elaborated: the existing pinned build lacks the Tau Ceti oleans.
The marked affine signatures have been checked separately against the pinned Mathlib build.
Their earlier proof prototype is preserved at immutable commit3895cfa; its proof receipt
is distinct from this current admitted sketch. The roadmap document is definitive;
this nonexhaustive file suggests names and native signatures, not implementation.
Geometric carriers and the full H² transfer are unresolved supplier inputs; their precise
unrepresented signatures are listed in the packet and handoff, without proxy carriers.
-/
import TauCeti.Algebra.BrauerGroup.BaseChange
import TauCeti.Algebra.BrauerGroup.Division
import TauCeti.Algebra.CentralSimple.Index
import TauCeti.Algebra.CentralSimple.FiniteSeparable
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.RingTheory.Morita.Matrix
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.Algebra.Azumaya.Matrix
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.Data.ZMod.Basic

set_option maxHeartbeats 800000
universe u
namespace SemisimpleAlgebrasPartII
open scoped TensorProduct

section FieldArithmetic
variable {K : Type u} [Field K]

theorem indexBrauerCongr {A B : CSA.{u,u} K} (h : IsBrauerEquivalent A B) :
    TauCeti.Algebra.index K A = TauCeti.Algebra.index K B := by
  sorry

noncomputable def classIndex (α : BrauerGroup.{u,u} K) : ℕ := by
  sorry

theorem classIndex_mk (A : CSA.{u,u} K) :
    classIndex (TauCeti.BrauerGroup.mk A) = TauCeti.Algebra.index K A := by
  sorry

theorem classIndex_pos (α : BrauerGroup.{u,u} K) : 0 < classIndex α := by
  sorry

theorem classIndex_eq_one_iff (α : BrauerGroup.{u,u} K) : classIndex α = 1 ↔ α = 1 := by
  sorry

-- Class-index tests: positive matrix size, finite field, division representative, zero boundary.
example (n : ℕ) [NeZero n] :
    classIndex (TauCeti.BrauerGroup.mk (TauCeti.CSA.of K (Matrix (Fin n) (Fin n) K))) = 1 := by
  sorry
example [Finite K] (α : BrauerGroup.{u,u} K) : classIndex α = 1 := by
  sorry
example (D : Type u) [DivisionRing D] [Algebra K D] [Algebra.IsCentral K D]
    [FiniteDimensional K D] :
    classIndex (TauCeti.BrauerGroup.mk (TauCeti.CSA.of K D)) = TauCeti.Algebra.deg K D := by
  sorry
example (α : BrauerGroup.{u,u} K) : classIndex α ≠ 0 := by
  sorry

noncomputable def splittingDegrees (α : BrauerGroup.{u,u} K) : Set ℕ := by
  sorry

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

example : 1 ∈ splittingDegrees (1 : BrauerGroup.{u,u} K) := by
  sorry
example (α : BrauerGroup.{u,u} K) : 0 ∉ splittingDegrees α := by
  sorry
example (α : BrauerGroup.{u,u} K) (h : α ≠ 1) : 1 ∉ splittingDegrees α := by
  sorry
example (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L]
    (α : BrauerGroup.{u,u} K) (hdeg : Module.finrank K L = 2)
    (hsplit : TauCeti.BrauerGroup.baseChange K L α = 1) : 2 ∈ splittingDegrees α := by
  sorry

-- The left D-action is genuine instance data, not a predicate asserting the target arithmetic.
theorem divisionModuleDimension (D L : Type u) [DivisionRing D] [Field L]
    [Algebra K D] [Algebra.IsCentral K D] [FiniteDimensional K D]
    [Algebra K L] [FiniteDimensional K L]
    (e : (L ⊗[K] D) ≃ₐ[L]
      Matrix (Fin (TauCeti.Algebra.deg K D)) (Fin (TauCeti.Algebra.deg K D)) L) :
    ∃ s : Module D (Fin (TauCeti.Algebra.deg K D) → L),
      letI := s
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

theorem separableSplittingAnnihilates (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (α : BrauerGroup.{u,u} K) (h : TauCeti.BrauerGroup.baseChange K L α = 1) :
    α ^ Module.finrank K L = 1 := by
  sorry

theorem classPowerIndex (α : BrauerGroup.{u,u} K) : α ^ classIndex α = 1 := by
  sorry

theorem brauerFiniteOrder (α : BrauerGroup.{u,u} K) : IsOfFinOrder α := by
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

-- BEGIN AFFINE EXTRACTION: exact native Mathlib section, checked separately.
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

example : ¬(2 : ZMod 4) ∈ Module.annihilator (ZMod 4) (ZMod 4) := by
  sorry

example : (2 : ZMod 4) ^ 2 = 0 := by
  sorry
-- END AFFINE EXTRACTION
end SemisimpleAlgebrasPartII

/- Native coverage ledger (unrepresented inputs remain mathematical gaps):
SemisimpleAlgebrasPartII:SA.1/comparison-basechange-units — unrepresented; Requires the actual unresolved supplier carrier or maps; no proposition-valued substitute is introduced.
SemisimpleAlgebrasPartII:SA.1/brauer-corestriction — unrepresented; Requires the actual unresolved supplier carrier or maps; no proposition-valued substitute is introduced.
API: brauerCorestriction_res, brauerCorestriction_comp, brauerCorestriction_self, brauerCorestriction_embedding
Tests: identity_extension, trivial_class, quadratic_restriction, inseparable_boundary
SemisimpleAlgebrasPartII:SA.1/corestriction-restriction-degree — unrepresented; Requires the actual unresolved supplier carrier or maps; no proposition-valued substitute is introduced.
SemisimpleAlgebrasPartII:SA.2/nilpotent-support-boundary — partial-native-examples; The concrete ZMod4 / pure TrivSqZeroExt ring computations are checked; the global support / polynomial conclusions are not separate compiled declarations.
SemisimpleAlgebrasPartII:SA.2/sheaf-morita — unrepresented; Requires the actual unresolved supplier carrier or maps; no proposition-valued substitute is introduced.
API: sheafMorita_unit, sheafMorita_counit, sheafMorita_restrict, sheafMorita_matrix
Tests: rank_one, matrix_rank_two, disconnected_rank, nongenerator
SemisimpleAlgebrasPartII:SA.2/coherent-morita — unrepresented; Requires the actual unresolved supplier carrier or maps; no proposition-valued substitute is introduced.
SemisimpleAlgebrasPartII:SA.2/sheaf-support-morita — unrepresented; Requires the actual unresolved supplier carrier or maps; no proposition-valued substitute is introduced.
SemisimpleAlgebrasPartII:SA.3/splitting-transition-line — unrepresented; Requires the actual unresolved supplier carrier or maps; no proposition-valued substitute is introduced.
SemisimpleAlgebrasPartII:SA.3/charpoly-line-twist — unrepresented; Requires the actual unresolved supplier carrier or maps; no proposition-valued substitute is introduced.
SemisimpleAlgebrasPartII:SA.3/morita-characteristic-polynomial — unrepresented; Requires the actual unresolved supplier carrier or maps; no proposition-valued substitute is introduced.
API: moritaCharpoly_matrix, moritaCharpoly_changeSplitting, moritaCharpoly_baseChange, moritaCharpoly_degree
Tests: rank_one_scalar, zero_rank, nonreduced_scalar, line_twist
SemisimpleAlgebrasPartII:SA.3/frobenius-root-boundary — partial-native-examples; The concrete ZMod4 / pure TrivSqZeroExt ring computations are checked; the global support / polynomial conclusions are not separate compiled declarations.
SemisimpleAlgebrasPartII:SA.4/cartier-brauer-comparison — unrepresented; Requires the actual unresolved supplier carrier or maps; no proposition-valued substitute is introduced.
SemisimpleAlgebrasPartII:SA.4/relative-brauer-equality — unrepresented; Requires the actual unresolved supplier carrier or maps; no proposition-valued substitute is introduced.
-/
