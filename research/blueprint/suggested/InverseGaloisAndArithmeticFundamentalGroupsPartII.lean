import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Algebra.Group.Conj
import Mathlib.Algebra.Group.Subgroup.Lattice
import Mathlib.CategoryTheory.GradedObject
import Mathlib.GroupTheory.Coset.Defs
import Mathlib.GroupTheory.Sylow
import TauCeti.GroupTheory.SpecificGroups.Braid

/-!
# Hurwitz homological stability: suggested statements

This file is not the roadmap and is not exhaustive. The companion reader document
states every target, hypothesis, API and discriminating check. Names and forms
here are suggestions for the eventual implementation.

Only light definitions over carriers available at the pinned libraries appear
here. In particular, there is no substitute structure for the parent Hurwitz
spaces, graded noncommutative Tor, the K-complex, smooth arc isotopy classes or
semisimplicial realization. Their definitions and milestones stay in the reader.

Sources: Ellenberg–Venkatesh–Westerland, Annals 183 (2016), Definition 3.1 and
Lemma 3.2, p. 743; Proposition 4.13, p. 754; §5.2, p. 756. The reader records
the positive-slope correction and the truncation in the last two locators.
-/

universe u v

namespace TauCeti.HurwitzStability

section Conjugacy

variable {G : Type u} [Group G]

/-- A whole, nonempty conjugacy class, using native conjugacy. -/
def IsSingleConjugacyClass (c : Set G) : Prop :=
  ∃ g : G, c = {h | IsConj g h}

/-- Nonsplitting includes generation and conjugacy inside every subgroup. -/
def IsNonsplitting (c : Set G) : Prop :=
  IsSingleConjugacyClass c ∧ Subgroup.closure c = ⊤ ∧
    ∀ (H : Subgroup G) (g h : G),
      g ∈ c → h ∈ c → g ∈ H → h ∈ H →
        ∃ x : G, x ∈ H ∧ x * g * x⁻¹ = h

/-- The pairwise condition recovers whole conjugacy classes on subgroups. -/
theorem nonsplitting_iff (c : Set G) :
    IsNonsplitting c ↔
      IsSingleConjugacyClass c ∧ Subgroup.closure c = ⊤ ∧
        ∀ H : Subgroup G,
          ({h : H | (h : G) ∈ c} = ∅ ∨
            IsSingleConjugacyClass {h : H | (h : G) ∈ c}) := by
  sorry

/-- Restriction needs the intersection to generate the subgroup. -/
theorem nonsplitting_subgroup (c : Set G) (hc : IsNonsplitting c)
    (H : Subgroup G) (hne : ({h : H | (h : G) ∈ c}).Nonempty)
    (hgen : Subgroup.closure {h : H | (h : G) ∈ c} = ⊤) :
    IsNonsplitting {h : H | (h : G) ∈ c} := by
  sorry

/-- Sylow conjugacy supplies the involution class. -/
theorem involutions_single [Fintype G] (s : ℕ)
    (hcard : Fintype.card G = 2 * s) (hs : Odd s) :
    IsSingleConjugacyClass {g : G | orderOf g = 2} := by
  sorry

/-- The order hypothesis alone does not imply generation. -/
theorem involutions_nonsplitting [Fintype G] (s : ℕ)
    (hcard : Fintype.card G = 2 * s) (hs : Odd s)
    (hgen : Subgroup.closure {g : G | orderOf g = 2} = ⊤) :
    IsNonsplitting {g : G | orderOf g = 2} := by
  sorry

-- Whole classes and subgroup generation are separate requirements.
example : IsSingleConjugacyClass ({1} : Set (Equiv.Perm (Fin 0))) := by
  sorry

example : IsSingleConjugacyClass
    {g : Equiv.Perm (Fin 3) | orderOf g = 2} := by
  sorry

example : ¬ IsSingleConjugacyClass (∅ : Set (Equiv.Perm (Fin 3))) := by
  sorry

example : IsNonsplitting ({1} : Set (Equiv.Perm (Fin 0))) := by
  sorry

example : IsNonsplitting {g : Equiv.Perm (Fin 3) | orderOf g = 2} := by
  sorry

-- The commuting transpositions (12), (34) witness the failed intersection.
example : ¬ IsNonsplitting
    {g : Equiv.Perm (Fin 4) | ∃ i j : Fin 4, i ≠ j ∧ g = Equiv.swap i j} := by
  sorry

end Conjugacy

section Support

variable {k : Type u} [Field k]

/-- Finite support bound on a native family of modules; no degree arithmetic
with infinity is needed in the suggested statements. -/
def SupportedLE (V : CategoryTheory.GradedObject ℕ (ModuleCat.{v} k))
    (d : ℕ) : Prop :=
  ∀ n : ℕ, d < n → Subsingleton (V n)

-- Native zero vector spaces and single-degree vector spaces test the cutoff.
example : SupportedLE (fun _ => ModuleCat.of k (Fin 0 → k)) 0 := by
  sorry

example (q : ℕ) :
    SupportedLE (fun n => ModuleCat.of k (Fin (if n = q then 1 else 0) → k)) q := by
  sorry

example (q : ℕ) :
    ¬ SupportedLE
      (fun n => ModuleCat.of k (Fin (if n = q + 1 then 1 else 0) → k)) q := by
  sorry

/-- The numerical inequality needed for the repaired Proposition 4.13.
The reader gives the graded-module statement; those carriers are supplier work. -/
theorem positive_slope_bound (A₁ i j : ℕ) (hA : 1 ≤ A₁) :
    j + A₁ * i ≤ A₁ * (i + j) := by
  sorry

example : ¬ (3 + 0 * 0 ≤ 0 * (0 + 3)) := by
  sorry

end Support

section Cosets

/-- Classical generators σ_(q+2),...,σ_(n-1), with native zero-based indices. -/
def tailSubgroup (n q : ℕ) : Subgroup (TauCeti.BraidGroup n) :=
  Subgroup.closure {b | ∃ i : Fin (n - 1), q + 1 ≤ i.val ∧
    TauCeti.BraidGroup.sigma i = b}

/-- The actual coset family, truncated before degree n. Faces and realization
are specified in the reader, without a placeholder structure in this file. -/
def ArcCells (n q : ℕ) : Type :=
  if q < n then TauCeti.BraidGroup n ⧸ tailSubgroup n q else PEmpty

theorem tailSubgroup_eq_bot (n q : ℕ) (h : n ≤ q + 2) :
    tailSubgroup n q = ⊥ := by
  sorry

theorem arcCells_empty (n q : ℕ) (h : n ≤ q) : IsEmpty (ArcCells n q) := by
  sorry

theorem arcCells_nonempty (n q : ℕ) (h : q < n) : Nonempty (ArcCells n q) := by
  sorry

-- σ_2 is native index 1; it is the whole nontrivial tail at n=3,q=0.
example : TauCeti.BraidGroup.sigma (n := 3) ⟨1, by decide⟩ ∈
    tailSubgroup 3 0 := by
  sorry

example : tailSubgroup 3 1 = ⊥ := by
  sorry

example : tailSubgroup 1 0 = ⊥ := by
  sorry

example (q : ℕ) : IsEmpty (ArcCells 0 q) := by
  sorry

example : Nonempty (ArcCells 1 0) := by
  sorry

example : IsEmpty (ArcCells 1 1) := by
  sorry

end Cosets

end TauCeti.HurwitzStability
