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
  coherence, including arbitrary scheme pullback (RS2-JAC-A,
  RS2-FINITE-ROOT-STACKS).
* coherent-roots-native: instantiate the supplied compatible-family carrier
  on that actual root pseudodiagram (RS2-LIMIT-TYPING).
* factorial-roots-native: objects, arrows, unit/counit, and pullback
  modifications of the groupoid equivalence, not a limit of sets.
* root-limit-descent-native and root-limit-base-change-native: effective
  fpqc descent and actual two-fibre-product comparisons.
* flat-torsor-tower-limit: limits of towers of fppf torsors under finite
  locally free group schemes are fpqc torsors under the limit group; it
  needs group-scheme torsors over a scheme, which are not at the pins.
* normalized-coframes and coframe-tower: represented LEFT coframe torsors,
  power transition, normalized root equations, and finite quotient maps.
* coframe-inverse-limit and coframe-fpqc-torsor: relative affine limits,
  faithful flatness, action square and every finite projection quotient;
  these are not compatible sets of field-valued frames.
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

The Kummer coordinate group, its transitions and the group of compatible
families below are part of kummer-coordinate-diagram; they are light
definitions over Mathlib's quotient groups. Its finiteTorsorClass API needs
the missing geometric H1 carrier and stays in the reader. The finite
quotient examples are checks on dvr-residual-gerbe-native, not replacements
for the infinite stack. The cofiltered-section example checks the exact
existing ingredient used in kummer-iso-native.
-/

import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.RootsOfUnity.Basic
import Mathlib.CategoryTheory.CofilteredSystem
import Mathlib.Data.PNat.Basic
import Mathlib.Basic.Real.Basic
import Mathlib.Algebra.Field.ZMod
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.FieldTheory.RatFunc.AsPolynomial
import Mathlib.Tactic.NormNum

noncomputable section

namespace TauCeti.AlgebraicGeometry.RootStack

universe u v w

namespace RootKummer

/-- `K_n(k) = kˣ/(kˣ)^n`: Mathlib's quotient group at a positive Kummer degree. -/
abbrev coordinate (k : Type u) [Field k] (n : ℕ+) :=
  kˣ ⧸ (powMonoidHom (n : ℕ) : kˣ →* kˣ).range

/-- The class `[a]_n` of a unit. -/
abbrev ofUnit (k : Type u) [Field k] (n : ℕ+) : kˣ →* coordinate k n :=
  QuotientGroup.mk' _

theorem ofUnit_eq_one (k : Type u) [Field k] (n : ℕ+) (a : kˣ) :
    ofUnit k n a = 1 ↔ ∃ b : kˣ, b ^ (n : ℕ) = a := by
  sorry

/-- The coordinate transition `K_m(k) → K_n(k)` for `n ∣ m`, induced by the identity of `kˣ`,
so `[a]_m ↦ [a]_n`. It is not induced by raising to the power `m / n`. -/
def transition (k : Type u) [Field k] {n m : ℕ+} (h : (n : ℕ) ∣ (m : ℕ)) :
    coordinate k m →* coordinate k n :=
  QuotientGroup.map _ _ (MonoidHom.id kˣ) (by
    rintro _ ⟨b, rfl⟩
    obtain ⟨q, hq⟩ := h
    exact ⟨b ^ q, by simp [← pow_mul, hq, mul_comm]⟩)

@[simp]
theorem transition_ofUnit (k : Type u) [Field k] {n m : ℕ+} (h : (n : ℕ) ∣ (m : ℕ))
    (a : kˣ) : transition k h (ofUnit k m a) = ofUnit k n a :=
  rfl

@[simp]
theorem transition_id (k : Type u) [Field k] (n : ℕ+) :
    transition k (dvd_refl (n : ℕ)) = MonoidHom.id (coordinate k n) := by
  sorry

theorem transition_comp (k : Type u) [Field k] {n m l : ℕ+}
    (hnm : (n : ℕ) ∣ (m : ℕ)) (hml : (m : ℕ) ∣ (l : ℕ)) :
    (transition k hnm).comp (transition k hml) = transition k (hnm.trans hml) := by
  sorry

/-- `lim_n K_n(k)`: the families of Kummer coordinates compatible with every transition. -/
def compatibleFamilies (k : Type u) [Field k] : Subgroup ((n : ℕ+) → coordinate k n) where
  carrier := {c | ∀ (n m : ℕ+) (h : (n : ℕ) ∣ (m : ℕ)), transition k h (c m) = c n}
  one_mem' := fun n m h => by simp
  mul_mem' := fun {a b} ha hb n m h => by
    simp only [Pi.mul_apply, map_mul, ha n m h, hb n m h]
  inv_mem' := fun {a} ha n m h => by
    simp only [Pi.inv_apply, map_inv, ha n m h]

end RootKummer

open RootKummer

-- RootKummerTests.one: `K_1(k)` is trivial for every field.
example (k : Type u) [Field k] (x : coordinate k 1) : x = 1 := by
  sorry

-- RootKummerTests.two: the class of 2 in `K_2(ℚ)` is nontrivial; the class of 4 is trivial.
example (a : ℚˣ) (ha : (a : ℚ) = 2) : ofUnit ℚ 2 a ≠ 1 := by
  sorry

example (a : ℚˣ) (ha : (a : ℚ) = 4) : ofUnit ℚ 2 a = 1 := by
  sorry

-- RootKummerTests.transition: `K_4(ℚ) → K_2(ℚ)` keeps the representative 2;
-- squaring the representative would kill the class.
example (a : ℚˣ) (ha : (a : ℚ) = 2) :
    transition ℚ (show ((2 : ℕ+) : ℕ) ∣ ((4 : ℕ+) : ℕ) by decide) (ofUnit ℚ 4 a) ≠ 1 := by
  sorry

-- RootKummerTests.wild: over `𝔽_p(t)` the class of `t` in `K_p` is nontrivial,
-- although the only `p`-th root of unity in the field is 1.
example (p : ℕ) [hp : Fact p.Prime] :
    ofUnit (RatFunc (ZMod p)) ⟨p, hp.out.pos⟩
      (Units.mk0 RatFunc.X RatFunc.X_ne_zero) ≠ 1 := by
  sorry

-- RootKummerTests.realFamilies: over `ℝ` the compatible families are the trivial family and
-- `([-1]_n)_n`; over an algebraically closed field there is only the trivial family.
example : Nat.card (compatibleFamilies ℝ) = 2 := by
  sorry

example (k : Type u) [Field k] [IsAlgClosed k] (c : compatibleFamilies k) : c = 1 := by
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

end TauCeti.AlgebraicGeometry.RootStack
