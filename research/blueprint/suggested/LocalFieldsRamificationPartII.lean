import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.LinearDisjoint
import Mathlib.FieldTheory.Perfect
import Mathlib.FieldTheory.PurelyInseparable.Tower
import Mathlib.RingTheory.Valuation.ValuationSubring
import Mathlib.RingTheory.Valuation.RankOne
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.Analysis.Normed.Field.Krasner
import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup

/-!
# Local fields and ramification, Part II: general valued fields

This file is not the roadmap and is not exhaustive. The roadmap document is
 definitive; these statements suggest Lean forms so contributors and reviewers
 converge on names and signatures. They assert no implementation.

As WORKERS.md's fixed shape requires, only light definitions over existing
carriers and selected milestones appear here. Valued-field henselizations,
ramification towers, maximal wild fields and composed-valuation constructions
are README targets with their full API and tests. They are not represented by
placeholder data or undeveloped carriers here. In particular the full tameness
endpoint needs that README theory before it is expressible at the pins.
-/

noncomputable section

namespace TauCeti.GeneralRamification

universe u v

/-- A positive integer with prime divisors in P. GF.0/prime-supported-degree. -/
def IsPNumber (P : Set ℕ) (n : ℕ) : Prop :=
  0 < n ∧ ∀ q : ℕ, q.Prime → q ∣ n → q ∈ P

namespace IsPNumber

 theorem one (P : Set ℕ) : IsPNumber P 1 := by
  sorry

 theorem mul_iff (P : Set ℕ) {a b : ℕ} (ha : 0 < a) (hb : 0 < b) :
    IsPNumber P (a * b) ↔ IsPNumber P a ∧ IsPNumber P b := by
  sorry

 theorem mono {P Q : Set ℕ} (hPQ : P ⊆ Q) {n : ℕ}
    (hn : IsPNumber P n) : IsPNumber Q n := by
  sorry

 theorem singleton_iff {p n : ℕ} (hp : p.Prime) :
    IsPNumber {p} n ↔ ∃ r : ℕ, n = p ^ r := by
  sorry

end IsPNumber

variable (K : Type u) (L : Type v) [Field K] [Field L] [Algebra K L]

/-- Every finite intermediate field has P-supported degree. GF.0/p-extensions. -/
def IsPExtension (P : Set ℕ) : Prop :=
  Algebra.IsAlgebraic K L ∧
    ∀ E : IntermediateField K L, FiniteDimensional K E →
      IsPNumber P (Module.finrank K E)

/-- Full closedness includes inseparable extensions. GF.0/p-closed. -/
def IsPClosed (P : Set ℕ) : Prop :=
  ∀ E : IntermediateField K (AlgebraicClosure K),
    FiniteDimensional K E → IsPNumber P (Module.finrank K E) → E = ⊥

/-- Separable closedness imposes no perfection hypothesis. GF.0/separably-p-closed. -/
def SeparablyPClosed (P : Set ℕ) : Prop :=
  ∀ E : IntermediateField K (AlgebraicClosure K),
    FiniteDimensional K E → Algebra.IsSeparable K E →
      IsPNumber P (Module.finrank K E) → E = ⊥

/-- A complement uses linear disjointness and the compositum, not intersection. -/
def SplitTower (M : IntermediateField K L) : Prop :=
  ∃ E : IntermediateField K L, E.LinearDisjoint M ∧ E ⊔ M = ⊤

namespace IsPExtension

 theorem finite_iff (P : Set ℕ) [FiniteDimensional K L] :
    IsPExtension K L P ↔ IsPNumber P (Module.finrank K L) := by
  sorry

end IsPExtension

namespace IsPClosed

 theorem antitone {P Q : Set ℕ} (hPQ : P ⊆ Q) (hQ : IsPClosed K Q) :
    IsPClosed K P := by
  sorry

/-- The field-theoretic perfectness input to GF.6. -/
 theorem perfect {p : ℕ} [Fact p.Prime] [CharP K p]
    (hK : IsPClosed K {p}) : PerfectRing K p := by
  sorry

end IsPClosed

namespace SeparablyPClosed

 theorem of_pClosed {P : Set ℕ} (hK : IsPClosed K P) :
    SeparablyPClosed K P := by
  sorry

 theorem antitone {P Q : Set ℕ} (hPQ : P ⊆ Q)
    (hQ : SeparablyPClosed K Q) : SeparablyPClosed K P := by
  sorry

end SeparablyPClosed

/-- A statable GF.6 descent milestone: relatively closed subfields retain p-closedness.
The hypotheses state relative algebraic closure intrinsically at the existing carriers. -/
theorem pClosed_of_relativelyAlgebraicallyClosed (P : Set ℕ)
    [PerfectField K] [PerfectField L] (hL : IsPClosed L P)
    (hrel : ∀ x : L, IsAlgebraic K x → x ∈ Set.range (algebraMap K L)) :
    IsPClosed K P := by
  sorry

/-! Discriminating GF.0 tests, without building the heavy valued-field carriers. -/

-- pNumber_empty
example (n : ℕ) : IsPNumber ∅ n ↔ n = 1 := by
  sorry

-- pNumber_zero
example (P : Set ℕ) : ¬ IsPNumber P 0 := by
  sorry

-- pNumber_six
example : IsPNumber ({2, 3} : Set ℕ) 6 ∧ ¬ IsPNumber ({3} : Set ℕ) 6 := by
  sorry

-- pExtension_identity
example (P : Set ℕ) : IsPExtension K K P := by
  sorry

-- pClosed_empty
example : IsPClosed K ∅ := by
  sorry

-- pClosed_algClosed
example (P : Set ℕ) [IsAlgClosed K] : IsPClosed K P := by
  sorry

-- separable_closed_empty
example : SeparablyPClosed K ∅ := by
  sorry

-- split_identity, with M = L inside the ambient L
example : SplitTower K L (⊤ : IntermediateField K L) := by
  sorry

end TauCeti.GeneralRamification
