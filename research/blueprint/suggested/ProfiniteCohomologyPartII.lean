import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.UpperUnitriangular.Nilpotent
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Transvection
import Mathlib.Algebra.Module.LinearMap.Defs
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.Group.Conj

/-!
This file is not the roadmap and is not an exhaustive checklist. It suggests forms for
light definitions and milestones expressible with the pinned Mathlib and Tau Ceti carriers.
The companion README is definitive about targets, hypotheses, APIs, checks and source locators.
This file states, and does not develop, the proposed theory. Proof placeholders are intentional.

In particular it does not replace missing cochain, defining-system, filtered-block or arithmetic
Sha carriers with private encodings. Their exact targets and comparisons are in the README.

Index convention: matrices have indices 0,...,n. The paper's U^m is the existing
superdiagonalSubgroup (m+1). Commutators use xyx⁻¹y⁻¹.
-/

noncomputable section

namespace TauCeti.ContCohomology.Massey

open Matrix
open scoped commutatorElement

/-- M.3: the public linear support object underlying the existing subgroup filtration. -/
def superdiagonalSupport {R : Type*} [CommRing R] (n d : ℕ) :
    Submodule R (Matrix (Fin (n + 1)) (Fin (n + 1)) R) where
  carrier := {M | ∀ i j, j.val < i.val + d → M i j = 0}
  zero_mem' := by
    intro i j _
    rfl
  add_mem' := by
    intro M N hM hN i j hij
    change M i j + N i j = 0
    rw [hM i j hij, hN i j hij, add_zero]
  smul_mem' := by
    intro a M hM i j hij
    change a * M i j = 0
    rw [hM i j hij, mul_zero]

/-- A public bridge to the pinned subgroup, with exactly its indexing convention. -/
theorem mem_superdiagonal_iff_sub_one_mem_support
    {R : Type*} [CommRing R] {n r : ℕ}
    (g : upperUnitriangularGroup (Fin (n + 1)) R) :
    g ∈ UpperUnitriangularGroup.superdiagonalSubgroup (R := R) r ↔
      (((g : Matrix.GeneralLinearGroup (Fin (n + 1)) R) :
        Matrix (Fin (n + 1)) (Fin (n + 1)) R) - 1) ∈ superdiagonalSupport n r := by
  sorry

/-- M.3: the support estimate is a statement in the existing full matrix algebra. -/
theorem superdiagonalSupport_mul {R : Type*} [CommRing R] {n r s : ℕ}
    {M N : Matrix (Fin (n + 1)) (Fin (n + 1)) R}
    (hM : M ∈ superdiagonalSupport n r) (hN : N ∈ superdiagonalSupport n s) :
    M * N ∈ superdiagonalSupport n (r + s) := by
  sorry

-- One vanishing and one nonvanishing check for the retained support definition.
example : superdiagonalSupport (R := ZMod 3) 3 4 = ⊥ := by
  sorry

example : (1 : Matrix (Fin 4) (Fin 4) (ZMod 3)) ∉
    superdiagonalSupport 3 1 := by
  sorry

/-- M.1: the missing reverse inclusion, complementing the pinned forward inclusion. -/
theorem exact_superdiagonal_commutators {p n r s : ℕ} [Fact p.Prime]
    (hr : 1 ≤ r) (hs : 1 ≤ s) :
    ⁅UpperUnitriangularGroup.superdiagonalSubgroup (R := ZMod p) (n := n + 1) r,
      UpperUnitriangularGroup.superdiagonalSubgroup (R := ZMod p) (n := n + 1) s⁆ =
      UpperUnitriangularGroup.superdiagonalSubgroup (R := ZMod p) (n := n + 1) (r + s) := by
  sorry

/-- M.2: the commutator subgroup used in the stabilizer abelianization. -/
theorem derived_stabilizer_commutator {p n : ℕ} [Fact p.Prime] :
    ⁅UpperUnitriangularGroup.superdiagonalSubgroup (R := ZMod p) (n := n + 1) 2,
      UpperUnitriangularGroup.superdiagonalSubgroup (R := ZMod p) (n := n + 1) 2⁆ =
      UpperUnitriangularGroup.superdiagonalSubgroup (R := ZMod p) (n := n + 1) 4 := by
  sorry

/-- M.4 regression: in size five the derived stabilizer is already nonabelian.
The README witnesses this by [e₀₂(1), e₂₄(1)] = e₀₄(1). -/
example {p : ℕ} [Fact p.Prime] :
    ∃ g h : UpperUnitriangularGroup.superdiagonalSubgroup
      (R := ZMod p) (n := 5) 2, ⁅g, h⁆ ≠ 1 := by
  sorry

/-- M.3: the strict inequality is essential, in particular at p=3,n=6. -/
theorem derived_stabilizer_exponent_bound {p n m : ℕ} [Fact p.Prime]
    (hbound : n < 2 * p ^ m)
    (g : upperUnitriangularGroup (Fin (n + 1)) (ZMod p))
    (hg : g ∈ UpperUnitriangularGroup.superdiagonalSubgroup (R := ZMod p) 2) :
    g ^ (p ^ m) = 1 := by
  sorry

/-- M.3: the power action factors modulo p in lengths two through six. -/
theorem small_rank_power_conjugacy {p n a b : ℕ} [Fact p.Prime]
    (hn : 2 ≤ n ∧ n ≤ 6) (ha : a.Coprime p) (hb : b.Coprime p)
    (hab : a % p = b % p)
    (g : UpperUnitriangularGroup.superdiagonalSubgroup (R := ZMod p) (n := n + 1) 2) :
    IsConj (g ^ a) (g ^ b) := by
  sorry

/-- The characteristic-two case gives trivial action on conjugacy classes. -/
theorem small_rank_inverse_conjugacy {n : ℕ} (hn : 2 ≤ n ∧ n ≤ 6)
    (g : UpperUnitriangularGroup.superdiagonalSubgroup (R := ZMod 2) (n := n + 1) 2) :
    IsConj g g⁻¹ := by
  sorry

/-- M.5: pointwise scalar dependence is global scalar dependence, with no rank bound. -/
theorem pointwise_scalar {F V W : Type*} [Field F]
    [AddCommGroup V] [Module F V] [AddCommGroup W] [Module F W]
    (T T₀ : V →ₗ[F] W) (h : ∀ v, ∃ c : F, T v = c • T₀ v) :
    ∃ c : F, T = c • T₀ := by
  sorry

/-- M.6: generator matrix N_s in the ordered basis a,b,c,d,e. -/
def obstructionNs : Matrix (Fin 5) (Fin 5) (ZMod 2) :=
  fun i j => if (i = 3 ∧ j = 1) ∨ (i = 4 ∧ j = 1) ∨ (i = 4 ∧ j = 2)
    then 1 else 0

/-- M.6: generator matrix N_t in the same ordered basis. -/
def obstructionNt : Matrix (Fin 5) (Fin 5) (ZMod 2) :=
  fun i j => if (i = 3 ∧ j = 0) ∨ (i = 3 ∧ j = 1) ∨ (i = 4 ∧ j = 1)
    then 1 else 0

-- Two basis-entry checks for each of the two retained light matrices.
example : obstructionNs 3 1 = 1 ∧ obstructionNs 4 1 = 1 := by
  sorry

example : obstructionNs 4 2 = 1 ∧ obstructionNs 3 2 = 0 := by
  sorry

example : obstructionNt 3 0 = 1 ∧ obstructionNt 4 0 = 0 := by
  sorry

example : obstructionNt 3 1 = 1 ∧ obstructionNt 4 1 = 1 := by
  sorry

/-- These equations make the two generator actions commute and square to one. -/
theorem obstruction_nilpotent_relations :
    obstructionNs * obstructionNs = 0 ∧ obstructionNt * obstructionNt = 0 ∧
    obstructionNs * obstructionNt = 0 ∧ obstructionNt * obstructionNs = 0 := by
  sorry

/-- The t-action has order two, although the auxiliary cocycle needs a quartic generator. -/
theorem obstruction_generator_relations :
    (1 + obstructionNs) ^ 2 = 1 ∧ (1 + obstructionNt) ^ 2 = 1 ∧
    (1 + obstructionNs) * (1 + obstructionNt) =
      (1 + obstructionNt) * (1 + obstructionNs) := by
  sorry

/-!
README targets whose carriers must be developed through their existing owners before signatures
are added here:

M.0: continuousCochainDGA, its canonical continuous-cohomology comparison,
continuousDefiningSystem, and representative change, using DGAInfinity's generic carriers.
M.1: adjacentQuotient, cornerExtension, the fixed-system Dwyer correspondence and lift criteria.
M.2: derivedAbelianization, its explicit A-action, boundarySubmodule, sparse conjugation,
and reversalInvolution as an automorphism of the existing group.
M.3: outerExponent on existing ConjClasses, its minimality and the literal p=2 value one.
M.4: bogomolovKernel, cpExteriorSquare, character duality and endpoint collection.
M.5: cyclicH1, conjugacyPowerEvaluation, boundary and length-four/five fixed-class generation.
M.6: the length-six counterexample, the nonzero cyclic kernel, the full Q-representation,
its nonzero cyclically trivial beta class and quarticAuxiliaryCocycle (not just generator matrices).
M.7: twoBoundarySubgroup, twistedBoundarySequence, the finite connecting-cup comparison,
local obstruction cancellation, boundaryRetraction and retraction-stabilizer splitting.
M.8: the C2 perfect pairing, archimedean refined lifting and ordinary local Massey vanishing.
M.9: the continuous Hom dg-category, filteredAutomorphismGroup, twistedAdjacentCharacter,
twistedCornerExtension, fixed-cocycle Dwyer correspondence and rank-one boundary subgroup.
M.10: prime-to-p character descent and the rank-one twisted refined local lifting theorem.
M.11: cyclicEightModuleSequence, dual boundary, dualWangClass, the splitting-field power kernel,
invariant Sha coordinates, absence of a dual lift, second-Sha coefficient kernel, middleCharacter,
the local/global embedding gap and the defined nonvanishing Z/8 triple over Q.

These are mathematical targets with exact definitions, proof routes, API and discriminating
checks in the README; they are not axioms, opaque data definitions, or empty Prop fields here.
-/

end TauCeti.ContCohomology.Massey
