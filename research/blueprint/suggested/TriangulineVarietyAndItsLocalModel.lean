import Mathlib

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers
can converge on names and signatures.

Baseline: Mathlib 082e2d3 and Tau Ceti f790474. This compact file states only
the native linear-algebra and arithmetic adapters of Layers 12 and 13.
The period categories, Robba modules, rigid deformation spaces and analytic
representations needed by the other targets have no adequate carriers at
these pins. Their full statements, APIs and tests are in the roadmap document.
The arithmetic predicate below records supplied rational slopes; it does not
construct characters, valuations or a noncritical triangulation.
-/

namespace TauCetiRoadmap.TriangulineVarietyAndItsLocalModel

/-! Layer 12: the signed common-preimage relation. -/
namespace MatchedRelation

variable {E U V W : Type*} [Field E]
  [AddCommGroup U] [Module E U]
  [AddCommGroup V] [Module E V]
  [AddCommGroup W] [Module E W]

/-- The two coordinates must come from the same element, with opposite signs. -/
noncomputable def range (f : U →ₗ[E] V) (g : U →ₗ[E] W) : Submodule E (V × W) :=
  LinearMap.range (f.prod (-g))

theorem mem_iff (f : U →ₗ[E] V) (g : U →ₗ[E] W) (v : V) (w : W) :
    (v, w) ∈ range f g ↔ ∃ u, f u = v ∧ -g u = w := by
  sorry

theorem scale (f : U →ₗ[E] V) (g : U →ₗ[E] W) (a : E) (ha : a ≠ 0) :
    range (a • f) (a • g) = range f g := by
  sorry

theorem projections (f : U →ₗ[E] V) (g : U →ₗ[E] W) (v : V) (w : W)
    (h : (v, w) ∈ range f g) : v ∈ LinearMap.range f ∧ w ∈ LinearMap.range g := by
  sorry

/-- Rank-nullity for the actual common-preimage map, rather than two images. -/
theorem finrank_relation [FiniteDimensional E U] (f : U →ₗ[E] V) (g : U →ₗ[E] W) :
    Module.finrank E (range f g) + Module.finrank E (LinearMap.ker (f.prod (-g))) =
      Module.finrank E U := by
  sorry

example : range (0 : ℚ →ₗ[ℚ] ℚ) (0 : ℚ →ₗ[ℚ] ℚ) = ⊥ := by
  sorry

example : ((1 : ℚ), (-1 : ℚ)) ∈ range (LinearMap.id : ℚ →ₗ[ℚ] ℚ) LinearMap.id := by
  sorry

example : ((1 : ℚ), (1 : ℚ)) ∉ range (LinearMap.id : ℚ →ₗ[ℚ] ℚ) LinearMap.id := by
  sorry

/-- Both coordinate ranges are full, yet independent preimages are insufficient. -/
example : ((1 : ℚ), (0 : ℚ)) ∉ range (LinearMap.id : ℚ →ₗ[ℚ] ℚ) LinearMap.id := by
  sorry

example : range ((2 : ℚ) • (LinearMap.id : ℚ →ₗ[ℚ] ℚ))
    ((2 : ℚ) • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) = range LinearMap.id LinearMap.id := by
  sorry

end MatchedRelation

/-! Layer 13: the native arithmetic part of numerical noncriticality. -/
namespace NumericalNoncritical

/-- Slopes are those of prefix products. The last slope entry is unused. -/
def nativeBounds {Emb : Type*} {n : ℕ} (weights : Emb → Fin n → ℤ)
    (slopes : Fin n → ℚ) : Prop :=
  (∀ τ, StrictMono (weights τ)) ∧
    ∀ (τ : Emb) (i j : Fin n), j.val = i.val + 1 →
      slopes i < ((weights τ j - weights τ i : ℤ) : ℚ)

theorem weights {Emb : Type*} {n : ℕ} (k : Emb → Fin n → ℤ) (s : Fin n → ℚ)
    (h : nativeBounds k s) (τ : Emb) : StrictMono (k τ) := by
  sorry

theorem prefixBound {Emb : Type*} {n : ℕ} (k : Emb → Fin n → ℤ) (s : Fin n → ℚ)
    (h : nativeBounds k s) (τ : Emb) (i j : Fin n) (hij : j.val = i.val + 1) :
    s i < ((k τ j - k τ i : ℤ) : ℚ) := by
  sorry

theorem rankOne {Emb : Type*} (k : Emb → Fin 1 → ℤ) (s : Fin 1 → ℚ) :
    nativeBounds k s := by
  sorry

example : nativeBounds (fun (_ : Fin 1) (i : Fin 2) => 3 * (i.val : ℤ))
    (fun _ => (2 : ℚ)) := by
  sorry

example : ¬nativeBounds (fun (_ : Fin 1) (i : Fin 2) => 3 * (i.val : ℤ))
    (fun _ => (3 : ℚ)) := by
  sorry

example : ¬nativeBounds
    (fun (τ : Fin 2) (i : Fin 2) => (if τ.val = 0 then 3 else 1) * (i.val : ℤ))
    (fun _ => (2 : ℚ)) := by
  sorry

example : nativeBounds (fun (_ : Fin 1) (_ : Fin 1) => (-7 : ℤ))
    (fun _ => (100 : ℚ)) := by
  sorry

end NumericalNoncritical
end TauCetiRoadmap.TriangulineVarietyAndItsLocalModel
