/-
This file is not the roadmap and is not exhaustive. The roadmap document
ClassicalAdicEtaleCohomologyPartII.md is definitive. These statements suggest Lean
forms so contributors and reviewers converge on names and signatures.

Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.

The analytic, formal, almost and derived carriers required by the roadmap are
README targets. This file contains only algebraic compatibility examples for
PD.3–PD.5. It introduces no replacement carriers
for the missing geometric theory. Elaboration checks types, not these proofs.
-/
import Mathlib.GroupTheory.PGroup
import Mathlib.RepresentationTheory.Invariants
import Mathlib.LinearAlgebra.PerfectPairing.Basic
import Mathlib.Data.ZMod.Basic

namespace TauCeti.AdicDuality.FiniteAlgebraChecks

/-- PD.5/local-system-duality: compatibility example for the fixed-vector input
to the unipotent filtration (Zavyalov v3, Theorem 5.4.5, pp. 80–81).
Current Tau Ceti already supplies the stronger theorem
`Representation.exists_common_fixed_vector_of_isPGroup` in
`TauCeti.RepresentationTheory.Unipotent.PowerOrder`; this example does not
allocate a new theorem. At the pins, apply the existing p-group fixed-point
theorem to the finite additive set V, with zero as the first fixed point. -/
example (p : ℕ) [Fact p.Prime]
    (G : Type*) [Group G] [Finite G] (hG : IsPGroup p G)
    (V : Type*) [AddCommGroup V] [Module (ZMod p) V]
    [Finite V] [Nontrivial V] (ρ : Representation (ZMod p) G V) :
    ∃ v : V, v ≠ 0 ∧ v ∈ ρ.invariants := by
  sorry

/-- PD.4: the ordinary degree-zero specialization uses Mathlib's invariants. -/
example (R G V : Type*) [CommRing R] [Group G] [AddCommGroup V] [Module R V]
    (ρ : Representation R G V) (v : V) :
    v ∈ ρ.invariants ↔ ∀ g : G, ρ g v = v := by
  rfl

/-- PD.4: field-valued underived perfection means both adjoints are bijective. -/
example (K M N : Type*) [Field K] [AddCommGroup M] [AddCommGroup N]
    [Module K M] [Module K N] (b : M →ₗ[K] N →ₗ[K] K) :
    b.IsPerfPair ↔ Function.Bijective b ∧ Function.Bijective b.flip := by
  constructor
  · rintro ⟨h, h'⟩
    exact ⟨h, h'⟩
  · rintro ⟨h, h'⟩
    exact ⟨h, h'⟩

/-- PD.3/character-decomposition: opposite nodal weights multiply by a nonunit
parameter, so that line multiplication is not surjective (source issue E13). -/
example (R : Type*) [CommRing R] (a : R) (ha : ¬ IsUnit a) :
    ¬ Function.Surjective (fun x : R => a * x) := by
  sorry

end TauCeti.AdicDuality.FiniteAlgebraChecks
