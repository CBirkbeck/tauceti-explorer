import Mathlib.Analysis.LocallyConvex.Bounded
import Mathlib.RepresentationTheory.Basic
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.LinearAlgebra.Basis.Defs

/-!
These are suggested forms, not an exhaustive checklist. The README is the
specification. This file states milestones expressible using carriers at the
pinned libraries; it does not develop the missing Drinfeld, Robba, coadmissible
or integral-family theory. Proof placeholders do not establish these results.

GR.4: CDN20 §2.2.1, author p. 25; Lemma 2.18, author pp. 29–30.
-/

namespace TauCeti.PadicLanglands.Drinfeld

section BoundedOrbits

variable {L G E : Type*} [NontriviallyNormedField L] [Group G]
variable [AddCommGroup E] [TopologicalSpace E] [Module L E]

/-- The action orbit is von Neumann bounded. In a Fréchet space the bound
may depend on the defining seminorm. -/
def OrbitBounded (ρ : Representation L G E) (v : E) : Prop :=
  Bornology.IsVonNBounded L (Set.range fun g : G => ρ g v)

end BoundedOrbits

section NormedOrbits

variable {L G E F : Type*} [NontriviallyNormedField L] [Group G]
variable [NormedAddCommGroup E] [NormedSpace L E]
variable [NormedAddCommGroup F] [NormedSpace L F]
variable (ρ : Representation L G E)

/-- Agreement with the pinned norm-bound criterion, not a bound on a
chosen metric for a general Fréchet space. -/
theorem OrbitBounded.normCriterion (v : E) :
    OrbitBounded ρ v ↔ ∃ C : ℝ, ∀ g : G, ‖ρ g v‖ ≤ C := by
  sorry

theorem OrbitBounded.zero : OrbitBounded ρ 0 := by
  sorry

theorem OrbitBounded.add {v w : E}
    (hv : OrbitBounded ρ v) (hw : OrbitBounded ρ w) :
    OrbitBounded ρ (v + w) := by
  sorry

theorem OrbitBounded.smul (a : L) {v : E} (hv : OrbitBounded ρ v) :
    OrbitBounded ρ (a • v) := by
  sorry

theorem OrbitBounded.translate (h : G) {v : E} (hv : OrbitBounded ρ v) :
    OrbitBounded ρ (ρ h v) := by
  sorry

theorem OrbitBounded.map (σ : Representation L G F) (f : E →L[L] F)
    (hf : ∀ g v, f (ρ g v) = σ g (f v))
    {v : E} (hv : OrbitBounded ρ v) : OrbitBounded σ (f v) := by
  sorry

theorem OrbitBounded.of_isometric (hρ : ∀ g : G, Isometry (ρ g)) (v : E) :
    OrbitBounded ρ v := by
  sorry

-- A singleton orbit is bounded without a finite-dimensional hypothesis.
example (v : E) : OrbitBounded (Representation.trivial L G E) v := by
  sorry

-- The constant depends on the vector; this is the unitary norm comparison.
example (hρ : ∀ g : G, Isometry (ρ g)) (v : E) :
    ∀ g : G, ‖ρ g v‖ ≤ ‖v‖ := by
  sorry

-- An unbounded sequence inside an orbit disproves orbit boundedness.
example (v : E) (h : ∀ C : ℝ, ∃ g : G, C < ‖ρ g v‖) :
    ¬ OrbitBounded ρ v := by
  sorry

-- Distinguishes the zero vector from the nonzero dilation test in the README.
example (g : G) : ρ g (0 : E) = 0 := by
  sorry

end NormedOrbits

section PartialOperator

variable {L E : Type*} [Field L] [AddCommGroup E] [Module L E]
variable [FiniteDimensional L E]

/-- CDN20 Lemma 2.18, with the invariant-subspace hypothesis explicit.
The companion-matrix proof must use alternating characteristic coefficients;
no assertion that the proof gap recorded as G11 has been discharged is made. -/
theorem partialOperator_prescribedEigenbasis
    (S : Submodule L E) (A : S →ₗ[L] E)
    (hA : ∀ T : Submodule L E, T ≤ S →
      (∀ x : S, (x : E) ∈ T → A x ∈ T) → T = ⊥)
    (eigenvalues : Fin (Module.finrank L E) → L) (hEigen : Function.Injective eigenvalues) :
    ∃ (B : E →ₗ[L] E) (b : Module.Basis (Fin (Module.finrank L E)) L E),
      (∀ x : S, B x = A x) ∧ ∀ i, B (b i) = eigenvalues i • b i := by
  sorry

end PartialOperator

end TauCeti.PadicLanglands.Drinfeld
