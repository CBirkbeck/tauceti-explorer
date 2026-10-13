import Mathlib.Algebra.Group.Action.Defs
import Mathlib.Algebra.Group.Subgroup.Basic
import Mathlib.Algebra.Group.Int.TypeTags
import Mathlib.Algebra.Group.PUnit
import Mathlib.Data.Int.Basic
import Mathlib.Data.Set.Function

/-!
# Bad-prime quaternionic uniformisation: representative target signatures

This file is not the roadmap and is not exhaustive. The definitive mathematical statements,
hypotheses, proof routes, API outlines and worked checks are in the companion reader document.
Proving the statements here finishes neither R18.5 nor the roadmap.

Only light definitions on existing integer, set, group and action carriers are stated here.
There are no formal Drinfeld, special formal-module, PEL or tower carriers at the pinned baseline.
Those targets remain in the reader; arbitrary proposition fields cannot stand for them.
The height-label subgroup and chart-separation predicate are exact elementary interfaces to those targets,
not Lean statements of representability, algebraisation or uniformisation.

Mathlib pin: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti pin: f790474821cf4256814db967cb154e7af3d0c369; no Tau Ceti module is imported.
-/

namespace TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves.BadPrime

/-- BZ's paired half-height labels, not all of `ℤ × ℤ` and not just the diagonal.
It is Mathlib's additive subgroup of pairs with even sum, so the subgroup API applies directly. -/
def PelHeightLattice : AddSubgroup (ℤ × ℤ) where
  carrier := {p | (2 : ℤ) ∣ p.1 + p.2}
  zero_mem' := by
    change (2 : ℤ) ∣ 0 + 0
    omega
  add_mem' := by
    rintro ⟨a, b⟩ ⟨c, d⟩ h₁ h₂
    change (2 : ℤ) ∣ a + b at h₁
    change (2 : ℤ) ∣ c + d at h₂
    change (2 : ℤ) ∣ (a + c) + (b + d)
    omega
  neg_mem' := by
    rintro ⟨a, b⟩ h
    change (2 : ℤ) ∣ a + b at h
    change (2 : ℤ) ∣ -a + -b
    omega

namespace PelHeightLattice

theorem mem (p : ℤ × ℤ) : p ∈ PelHeightLattice ↔ (2 : ℤ) ∣ p.1 + p.2 := by
  sorry

theorem add :
    (0 : ℤ × ℤ) ∈ PelHeightLattice ∧
      (∀ a b : ℤ × ℤ, a ∈ PelHeightLattice → b ∈ PelHeightLattice →
        a + b ∈ PelHeightLattice) ∧
      (∀ a : ℤ × ℤ, a ∈ PelHeightLattice → -a ∈ PelHeightLattice) := by
  sorry

/-- The quaternionic subspace uses equal paired half-heights. -/
def diagonal (m : ℤ) : ℤ × ℤ := (m, m)

/-- Division is used only on permitted labels when interpreting the difference character. -/
def difference (p : ℤ × ℤ) : ℤ := (p.1 - p.2) / 2

/-- Terminal elementary contract: the quotient by diagonal labels is one copy of `ℤ`. -/
theorem difference_contract :
    (∀ a b : ℤ × ℤ, a ∈ PelHeightLattice → b ∈ PelHeightLattice →
      difference (a + b) = difference a + difference b) ∧
      Function.Surjective (fun p : {p : ℤ × ℤ // p ∈ PelHeightLattice} => difference p.1) ∧
      (∀ p : ℤ × ℤ, p ∈ PelHeightLattice → (difference p = 0 ↔ p.1 = p.2)) ∧
      (∀ m : ℤ, diagonal m ∈ PelHeightLattice) ∧ Function.Injective diagonal ∧
      (∀ m n : ℤ, diagonal (m + n) = diagonal m + diagonal n) := by
  sorry

-- PelHeightLattice.oddPair: excludes an unconstrained product of integer labels.
example : (1, 0) ∉ PelHeightLattice := by
  sorry

-- PelHeightLattice.oppositePair: excludes using only the diagonal.
example : (1, -1) ∈ PelHeightLattice ∧ difference (1, -1) = 1 := by
  sorry

-- PelHeightLattice.negativeDiagonal: excludes a nonnegative-height convention.
example : diagonal (-1) ∈ PelHeightLattice ∧ difference (diagonal (-1)) = 0 := by
  sorry

-- PelHeightLattice.translation: the corrected PEL descent translates both labels.
example : (2, 0) ∈ PelHeightLattice ∧ difference (2, 0) = difference (1, -1) ∧
    (2, -1) ∉ PelHeightLattice := by
  sorry

end PelHeightLattice

/-- Strict separation of vertex-chart neighbourhoods.
`move` is the actual action map in geometric applications, and `d` is tree edge distance.
Keeping the map explicit permits concrete integer-line checks without building a new action. -/
def VeryFreeChartAction {G V : Type*} [Group G]
    (move : G → V → V) (d : V → V → ℕ) : Prop :=
  ∀ g : G, g ≠ 1 → ∀ v : V, 2 < d v (move g v)

namespace VeryFreeChartAction

theorem distance {G V : Type*} [Group G] [MulAction G V] (d : V → V → ℕ) :
    VeryFreeChartAction (fun (g : G) (v : V) => g • v) d ↔
      ∀ g : G, g ≠ 1 → ∀ v : V, 2 < d v (g • v) := by
  sorry

theorem free {G V : Type*} [Group G] (move : G → V → V) (d : V → V → ℕ)
    (hd : ∀ v, d v v = 0) (h : VeryFreeChartAction move d) :
    ∀ g v, move g v = v → g = 1 := by
  sorry

theorem subgroup {G V : Type*} [Group G] (move : G → V → V) (d : V → V → ℕ)
    (h : VeryFreeChartAction move d) (H : Subgroup G) :
    VeryFreeChartAction (fun g : H => move g.1) d := by
  sorry

theorem conjugation {G V W : Type*} [Group G]
    (moveV : G → V → V) (moveW : G → W → W)
    (dV : V → V → ℕ) (dW : W → W → ℕ) (e : V ≃ W)
    (he : ∀ g v, e (moveV g v) = moveW g (e v))
    (hd : ∀ v w, dW (e v) (e w) = dV v w) :
    VeryFreeChartAction moveV dV ↔ VeryFreeChartAction moveW dW := by
  sorry

-- VeryFreeChartAction.trivialGroup: the identity is excluded from the displacement condition.
example : VeryFreeChartAction (fun (_ : PUnit) (v : ℤ) => v)
    (fun v w => (v - w).natAbs) := by
  sorry

-- VeryFreeChartAction.translationThree: a genuine translation action on the integer line.
example : VeryFreeChartAction (fun (n : Multiplicative ℤ) (v : ℤ) => v + 3 * n.toAdd)
    (fun v w => (v - w).natAbs) := by
  sorry

-- VeryFreeChartAction.translationTwo: free vertex action alone does not separate these charts.
example : ¬ VeryFreeChartAction (fun (n : Multiplicative ℤ) (v : ℤ) => v + 2 * n.toAdd)
    (fun v w => (v - w).natAbs) := by
  sorry

-- VeryFreeChartAction.fixedVertex: nonidentity elements fix every vertex in this action.
example : ¬ VeryFreeChartAction (fun (_ : Multiplicative ℤ) (v : ℤ) => v)
    (fun v w => (v - w).natAbs) := by
  sorry

end VeryFreeChartAction

/-!
The reader targets VeryFreeChartAction.smallTameLevel, VeryFreeDrinfeldQuotient,
AuxiliaryPelLocalFactors, QuaternionicPelUniformisationTransfer, SplitPlaceDescentBoundary,
DrinfeldLevelStructureComparison and WeightedArithmeticQuotientGraph require unavailable
tree, adelic, formal, moduli or tower carriers. They are not encoded as propositions about an arbitrary type.
The twelve imported targets retain their original ownership in the accepted R18.2 packet.
R18.6 is an export index and has no new declaration here.
-/

end TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves.BadPrime
