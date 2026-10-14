/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These suggested Lean forms help contributors and reviewers converge
on names and signatures; they are proposed targets, not formalised results. Proof placeholders are intentional. The README gives the full scope,
source locators, dependencies, analytic gaps, API and acceptance checks.

WORKERS.md's fixed shape is used: real-bodied light definitions on pinned
carriers, terminal statements and a few examples. No analytic ring, connection
category, isocrystal, quotient-cohomology or Frobenius-bundle carrier is invented
here. The predicate CyclicFor is only an adapter for the existing main packet's
cyclicity target. The natural-number basis input lets the finite candidate be
written without dependent indexing; the theorem pins its first n entries to a
finite basis.
-/
import Mathlib.RingTheory.Derivation.Basic
import Mathlib.LinearAlgebra.Basis.Defs
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Data.Nat.Factorial.Basic

noncomputable section

namespace TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD1

open scoped BigOperators

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]

/-- The explicit finite Katz candidate. Its body uses only pinned carriers. -/
def katzCandidate (D : V → V) (e : ℕ → V) (n : ℕ) (x : K) : V :=
  ∑ j ∈ Finset.range n,
    (x ^ j / (Nat.factorial j : K)) •
      ∑ k ∈ Finset.range (j + 1),
        (((-1 : K) ^ k) * (Nat.choose j k : K)) • (D^[k]) (e (j - k))

/-- A signature adapter to cyclicity, which the accepted main packet owns. -/
def CyclicFor (D : V → V) (n : ℕ) (v : V) : Prop :=
  ∃ b : Module.Basis (Fin n) K V, ∀ i, b i = (D^[i.val]) v

/-- The empty candidate tests the finite-sum convention. -/
example (D : V → V) (e : ℕ → V) (x : K) :
    katzCandidate D e 0 x = 0 := by
  sorry

/-- Rank one does not require a condition on x. -/
example (D : V → V) (e : ℕ → V) (x : K) :
    katzCandidate D e 1 x = e 0 := by
  sorry

/-- A horizontal rank-two basis fixes the sign of the Taylor correction. -/
example (D : V → V) (e : ℕ → V) (x : K)
    (h₀ : D (e 0) = 0) :
    katzCandidate D e 2 x = e 0 + x • e 1 := by
  sorry

/-- Naturality is one of the explicit candidate's API targets. -/
theorem katzCandidate_naturality {W : Type*} [AddCommGroup W] [Module K W]
    (D : V → V) (E : W → W) (f : V →ₗ[K] W) (e : ℕ → V)
    (n : ℕ) (x : K) (h : ∀ v, f (D v) = E (f v)) :
    f (katzCandidate D e n x) = katzCandidate E (fun i => f (e i)) n x := by
  sorry

section CharacteristicZero

variable [CharZero K] [Algebra ℚ K] [Module ℚ V] [IsScalarTower ℚ K V]

/-- Katz's field algorithm, restricted to the statable characteristic-zero case.
The D operator is rational-linear and satisfies the connection Leibniz rule. -/
theorem katz_cyclic_vector_algorithm
    (δ : Derivation ℚ K K) (D : V →ₗ[ℚ] V)
    (hD : ∀ (a : K) (v : V), D (a • v) = δ a • v + a • D v)
    (n : ℕ) (hn : 0 < n) (b : Module.Basis (Fin n) K V)
    (e : ℕ → V) (he : ∀ i : Fin n, e i.val = b i)
    (t : K) (ht : δ t = 1) :
    ∃ a : ℚ, CyclicFor (K := K) D n (katzCandidate D e n (t - algebraMap ℚ K a)) := by
  sorry

/-- Cyclicity is preserved when a nonzero field derivation is normalised.
This is an end comparison, not a chain developing differential-module theory. -/
theorem cyclic_rescaling
    (δ : Derivation ℚ K K) (D : V →ₗ[ℚ] V)
    (hD : ∀ (a : K) (v : V), D (a • v) = δ a • v + a • D v)
    (s : K) (hs : s ≠ 0) (n : ℕ) (v : V) :
    CyclicFor (K := K) (fun w => s⁻¹ • D w) n v ↔ CyclicFor (K := K) D n v := by
  sorry

end CharacteristicZero
end TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD1
