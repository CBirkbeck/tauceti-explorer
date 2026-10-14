/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These signatures suggest Lean forms so that contributors and
reviewers converge on names and signatures. No implementation is claimed.

RS.2: coherent infinite roots and fpqc Kummer towers.
Mathlib 082e2d3; Tau Ceti f790474. This file only specializes existing carriers
and states milestones that can be typed at those pins. The geometric targets,
their complete APIs and discriminating tests are in the reader and packet.
Proof bodies are admissions. None of the data definitions is admitted.

Geometric omission ledger (all are required reader targets):
* transition-native: native finite root groupoids, tensor-power and section
  coherence, including arbitrary scheme pullback (RS2-JAC-A).
* coherent-roots-native: instantiate the supplied compatible-family carrier
  on that actual root pseudodiagram (RS2-LIMIT-TYPING).
* factorial-roots-native: objects, arrows, unit/counit, and pullback
  modifications of the groupoid equivalence, not a limit of sets.
* root-limit-descent-native and root-limit-base-change-native: effective
  fpqc descent and actual two-fibre-product comparisons.
* normalized-coframes and coframe-tower: represented LEFT coframe torsors,
  power transition, normalized root equations, and finite quotient maps.
* coframe-inverse-limit and coframe-fpqc-torsor: relative affine limits,
  faithful flatness, action square and every finite projection quotient
  (RS2-TOWER-AFF); these are not compatible sets of field-valued frames.
* coframe-evaluation and infinite-quotient-native: actual equivariant scheme
  morphisms and both inverse groupoid comparisons (RS2-ORDINARY-STACKS).
* dvr-uniformizer-native and dvr-residual-gerbe-native: intrinsic Cartier
  pair, full fibre, zero-section gerbe, and chosen normal-line frame.
* kummer-tower-native, kummer-iso-native, kummer-lift-native and
  kummer-classes-native: actual torsor towers and fpqc H1; finite Kummer
  identifications include wild exponents (RS2-KUMMER-FINITE).
* neutralization-change-native: signed comparison of Isom torsors; for a
  frame lambda' = v lambda the new coordinates multiply by [v].
* roots-two-fpqc-native: the represented roots-of-two limit is fpqc and
  has no section over any nonempty fppf Q-scheme.

The light Kummer coordinate specialization below is part of
kummer-coordinate-diagram. Its finiteTorsorClass API needs the missing
geometric H1 carrier and stays in the reader. Existence/uniqueness of its
transition is a statable milestone; this file does not develop that map.
The finite quotient examples are checks on dvr-residual-gerbe-native,
not replacements for the infinite stack. The cofiltered-section example
checks the exact existing ingredient used in kummer-iso-native.
-/

import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.RootsOfUnity.Basic
import Mathlib.CategoryTheory.CofilteredSystem
import Mathlib.Data.PNat.Basic
import Mathlib.Tactic.NormNum

noncomputable section

namespace TauCeti.AlgebraicGeometry.RootStack.RS2Suggested

universe u v w

/-- The existing quotient group, specialized to a positive Kummer degree. -/
abbrev KummerCoordinate (k : Type u) [Field k] (n : ℕ+) :=
  kˣ ⧸ (powMonoidHom (n : ℕ) : kˣ →* kˣ).range

/-- Its native quotient homomorphism. -/
abbrev ofUnit (k : Type u) [Field k] (n : ℕ+) : kˣ →* KummerCoordinate k n :=
  QuotientGroup.mk' _

theorem ofUnit_eq_one (k : Type u) [Field k] (n : ℕ+) (a : kˣ) :
    ofUnit k n a = 1 ↔ ∃ b : kˣ, b ^ (n : ℕ) = a := by
  sorry

theorem coordinate_hom_ext (k : Type u) [Field k] (n : ℕ+)
    (H : Type v) [CommGroup H] (F F' : KummerCoordinate k n →* H)
    (h : ∀ a : kˣ, F (ofUnit k n a) = F' (ofUnit k n a)) : F = F' := by
  sorry

theorem coordinate_transition_exists_unique (k : Type u) [Field k]
    (n m : ℕ+) (h : (n : ℕ) ∣ (m : ℕ)) :
    ∃! F : KummerCoordinate k m →* KummerCoordinate k n,
      ∀ a : kˣ, F (ofUnit k m a) = ofUnit k n a := by
  sorry

-- The coordinate transition preserves the representative, including 2.
example (F : KummerCoordinate ℚ 4 →* KummerCoordinate ℚ 2)
    (hF : ∀ a : ℚˣ, F (ofUnit ℚ 4 a) = ofUnit ℚ 2 a)
    (a : ℚˣ) (ha : (a : ℚ) = 2) : F (ofUnit ℚ 4 a) ≠ 1 := by
  sorry

example (k : Type u) [Field k] (x : KummerCoordinate k 1) : x = 1 := by
  sorry

example (a : ℚˣ) (ha : (a : ℚ) = 4) : ofUnit ℚ 2 a = 1 := by
  sorry

-- Finite chart checks: a nilpotent root is not forced to be zero.
example (k : Type u) [Field k] (n : ℕ+) :
    AdjoinRoot.root ((Polynomial.X : Polynomial k) ^ (n : ℕ)) ^ (n : ℕ) = 0 := by
  sorry

example (k : Type u) [Field k] (r : ℕ) :
    AdjoinRoot.root ((Polynomial.X : Polynomial k) ^ (r + 1)) ^ r ≠ 0 := by
  sorry

-- Field-valued roots do not detect wild group-scheme inertia.
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p]
    (ζ : rootsOfUnity p k) : (ζ : kˣ) = 1 := by
  sorry

-- A finite extension cannot contain roots of 2 of unbounded degree.
-- This is an imported parent milestone, recorded as a separating check.
example (K : Type u) [Field K] [Algebra ℚ K] [FiniteDimensional ℚ K]
    (n : ℕ+) (x : K) (hx : x ^ (n : ℕ) = 2) :
    (n : ℕ) ≤ Module.finrank ℚ K := by
  sorry

-- The pinned compactness ingredient requires no surjective transition maps.
example {J : Type u} [CategoryTheory.Category.{w} J]
    [CategoryTheory.IsCofilteredOrEmpty J]
    (F : CategoryTheory.Functor J (Type v))
    [∀ j, Finite (F.obj j)] [∀ j, Nonempty (F.obj j)] :
    F.sections.Nonempty := by
  sorry

end TauCeti.AlgebraicGeometry.RootStack.RS2Suggested
