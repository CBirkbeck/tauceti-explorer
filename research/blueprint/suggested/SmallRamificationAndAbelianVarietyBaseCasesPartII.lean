import Mathlib.RepresentationTheory.Invariants
import TauCeti.Geometry.Hodge.Tate.Basic

/-!
This file is not the roadmap and is not exhaustive. The companion reader document
SmallRamificationAndAbelianVarietyBaseCasesPartII.md is definitive. These statements
suggest Lean forms so contributors and reviewers can converge on names and signatures.
There is no implementation claim: the theorem bodies below are deliberately `sorry`.

Only LH.2/cyclotomic-filtration has its carriers at the atlas pins. The other targets,
including the actual scheme-model predicate, crystalline category, valuation quotient
and filtered-Hom functor, remain fully specified in the reader. They are not replaced
by abstract predicates or sorry-valued data. The two definitions here are light
expressions in Mathlib's existing representation and submodule interfaces.

Source: Fontaine, Schémas propres et lisses sur Z (1993), author scan §2.1, printed
p. 4, and §2.2, p. 5. HT(χ)=+1. The finite index is the source's descending index:
U₄=0, Uᵢ=stepᵢ(Uᵢ₊₁). There is no assertion of exhaustiveness for arbitrary ρ.
-/

namespace TauCeti.SmallRamification.LowDegreeHodge

universe u v w z

variable {R : Type u} {G : Type v} {M : Type w}
variable [CommRing R] [Group G] [AddCommGroup M] [Module R M]

/-- Preimage of the χ^i-eigenspace modulo N when N is stable. The formula itself
also makes sense without stability. -/
def characterStep (ρ : Representation R G M) (χ : G →* Rˣ)
    (i : ℕ) (N : Submodule R M) : Submodule R M :=
  ⨅ g : G, N.comap (ρ g - ((χ g : R) ^ i) • LinearMap.id)

/-- The four successive character steps in the prescribed order 3,2,1,0. -/
def cyclotomicFiltration (ρ : Representation R G M) (χ : G →* Rˣ)
    (i : Fin 5) : Submodule R M :=
  match i.val with
  | 0 => characterStep ρ χ 0 (characterStep ρ χ 1
      (characterStep ρ χ 2 (characterStep ρ χ 3 ⊥)))
  | 1 => characterStep ρ χ 1 (characterStep ρ χ 2 (characterStep ρ χ 3 ⊥))
  | 2 => characterStep ρ χ 2 (characterStep ρ χ 3 ⊥)
  | 3 => characterStep ρ χ 3 ⊥
  | _ => ⊥

variable (ρ : Representation R G M) (χ : G →* Rˣ)

/-- Characterisation API: all action errors lie in the next term. -/
theorem characterStep_mem (i : ℕ) (N : Submodule R M) (x : M) :
    x ∈ characterStep ρ χ i N ↔ ∀ g : G, ρ g x - (χ g : R) ^ i • x ∈ N := by
  sorry

/-- Monotonicity in the submodule. -/
theorem characterStep_mono (i : ℕ) {N N' : Submodule R M} (h : N ≤ N') :
    characterStep ρ χ i N ≤ characterStep ρ χ i N' := by
  sorry

/-- The functorial part of the same API, stated without building a new category. -/
theorem characterStep_map {M' : Type z} [AddCommGroup M'] [Module R M']
    (ρ' : Representation R G M') (f : M →ₗ[R] M')
    (hf : ∀ g x, f (ρ g x) = ρ' g (f x)) (i : ℕ)
    (N : Submodule R M) (N' : Submodule R M') (hN : N ≤ N'.comap f) :
    characterStep ρ χ i N ≤ (characterStep ρ' χ i N').comap f := by
  sorry

/-- Stability and the inclusion needed to form the graded quotient. -/
theorem characterStep_stable (i : ℕ) (N : Submodule R M)
    (hN : ∀ g x, x ∈ N → ρ g x ∈ N) :
    (∀ g x, x ∈ characterStep ρ χ i N → ρ g x ∈ characterStep ρ χ i N) ∧
      N ≤ characterStep ρ χ i N := by
  sorry

/-- The quotient-eigenspace description, using Mathlib's actual quotient map. -/
theorem characterStep_quotient (i : ℕ) (N : Submodule R M) (x : M) :
    x ∈ characterStep ρ χ i N ↔
      ∀ g : G, N.mkQ (ρ g x) = (χ g : R) ^ i • N.mkQ x := by
  sorry

/-- Boundary and recursion, with exactly the source's descending indices. -/
theorem cyclotomicFiltration_rec :
    cyclotomicFiltration ρ χ 4 = ⊥ ∧
      ∀ i : Fin 4, cyclotomicFiltration ρ χ i.castSucc =
        characterStep ρ χ i.val (cyclotomicFiltration ρ χ i.succ) := by
  sorry

/-- No basis choices enter transport by an equivariant linear isomorphism. -/
theorem cyclotomicFiltration_iso {M' : Type z} [AddCommGroup M'] [Module R M']
    (ρ' : Representation R G M') (e : M ≃ₗ[R] M')
    (he : ∀ g x, e (ρ g x) = ρ' g (e x)) (i : Fin 5) :
    (cyclotomicFiltration ρ χ i).map e.toLinearMap =
      cyclotomicFiltration ρ' χ i := by
  sorry

-- LH.2/cyclotomic-filtration test 1: invariants and the maximal submodule.
example : characterStep ρ (1 : G →* Rˣ) 0 ⊥ = ρ.invariants := by
  sorry

example (i : ℕ) : characterStep ρ χ i ⊤ = ⊤ := by
  sorry

-- A genuinely trivial action exhausts at the bottom, not at the zero top term.
example : cyclotomicFiltration (Representation.trivial R G M) (1 : G →* Rˣ) 0 = ⊤ := by
  sorry

example : cyclotomicFiltration ρ χ 4 = ⊥ := by
  sorry

-- LH.2/cyclotomic-filtration test 2: a pure character over a field.
-- Distinctness is indispensable; this statement does not use formal symbols
-- for Tate objects in place of the actual scalar action.
example {k : Type u} [Field k] {V : Type w} [AddCommGroup V] [Module k V]
    (σ : Representation k G V) (ψ : G →* kˣ) (j : Fin 4)
    (hσ : ∀ g x, σ g x = (ψ g : k) ^ j.val • x)
    (hψ : ∀ a b : Fin 4, a ≠ b → ∃ g : G, (ψ g : k) ^ a.val ≠ (ψ g : k) ^ b.val)
    (i : Fin 5) :
    cyclotomicFiltration σ ψ i = if i.val ≤ j.val then ⊤ else ⊥ := by
  sorry

-- LH.2/cyclotomic-filtration test 3: the prescribed order sees a nonsplit
-- character-by-trivial extension. Starting with ordinary invariants sees zero.
example {k : Type u} [Field k] {V : Type w} [AddCommGroup V] [Module k V]
    [FiniteDimensional k V] (σ : Representation k G V) (ψ : G →* kˣ)
    (N : Submodule k V) (hV : Module.finrank k V = 2) (hN : Module.finrank k N = 1)
    (hsub : ∀ g x, x ∈ N → σ g x = (ψ g : k) ^ 3 • x)
    (hquot : ∀ g x, σ g x - x ∈ N)
    (hdistinct : ∃ g : G, (ψ g : k) ^ 3 ≠ 1)
    (hnonsplit : ¬ ∃ W : Submodule k V,
      IsCompl N W ∧ ∀ g x, x ∈ W → σ g x ∈ W) :
    cyclotomicFiltration σ ψ 3 = N ∧ cyclotomicFiltration σ ψ 0 = ⊤ ∧
      σ.invariants = ⊥ := by
  sorry

-- Sign calibration against an existing Tau Ceti Hodge structure; this does
-- not pretend that abstract Hodge structures supply scheme Hodge cohomology.
example : (TauCeti.Hodge.tate (-1)).piece 1 = ⊤ := by
  sorry

example : (TauCeti.Hodge.tate (-1)).piece 0 = ⊥ := by
  sorry

end TauCeti.SmallRamification.LowDegreeHodge
