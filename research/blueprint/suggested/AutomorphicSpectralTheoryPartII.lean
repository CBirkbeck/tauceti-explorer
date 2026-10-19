import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.Complex.Exponential
import Mathlib.Analysis.Calculus.FDeriv.Defs
import Mathlib.Topology.Algebra.InfiniteSum.Defs
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Algebra.Ring.CentroidHom

/-!
This file is not the roadmap and is not exhaustive. The companion roadmap document
is definitive. These statements suggest Lean forms so contributors and reviewers
can converge on names and signatures. They are statements, not implementations.

Only light definitions over carriers present at Mathlib 082e2d3 / Tau Ceti f790474
are included. Root-strip data, real reductive Schwartz algebras, weighted adelic
quotients and spectral components are fully specified in the reader. Their absent
carriers are not replaced by placeholder data or unconstrained proposition fields.

SM.0 below isolates the one-dimensional predicates and interpolation milestones.
The final section uses the existing algebraic centroid, adding continuity and
complex linearity as predicates rather than introducing a second carrier.
-/

noncomputable section

namespace TauCeti.AutomorphicSchwartz

/-- The zero of a set is omitted from the reciprocal-power sum. -/
def hasRankBound (Λ : Set ℂ) (p : ℕ) : Prop :=
  Λ.Countable ∧ Summable (fun z : {z : ℂ // z ∈ Λ ∧ z ≠ 0} =>
    (1 : ℝ) / ‖z.1‖ ^ (p + 1))

/-- Existence of an inverse-power summability bound on the set, without multiplicity. -/
def hasFiniteRank (Λ : Set ℂ) : Prop := ∃ p : ℕ, hasRankBound Λ p

/-- A finite entire order bound, with an integral exponent chosen larger if necessary. -/
def hasFiniteEntireOrder (f : ℂ → ℂ) : Prop :=
  Differentiable ℂ f ∧ ∃ d : ℕ, 0 < d ∧ ∃ C : ℝ, 0 < C ∧
    ∀ z : ℂ, ‖f z‖ ≤ Real.exp (C * (1 + ‖z‖) ^ d)

/-- The exponent can depend on the strip, but not on its point. -/
def verticalModerate (f : ℂ → ℂ) : Prop :=
  Differentiable ℂ f ∧ ∀ M : ℝ, 0 < M → ∃ N : ℕ, ∃ C : ℝ, 0 < C ∧
    ∀ z : ℂ, |z.re| ≤ M → ‖f z‖ ≤ C * (1 + ‖z‖) ^ N

/-- Every polynomial weight is allowed on each fixed vertical strip. -/
def verticalRapid (f : ℂ → ℂ) : Prop :=
  Differentiable ℂ f ∧ ∀ M : ℝ, 0 < M → ∀ r : ℕ, ∃ C : ℝ, 0 < C ∧
    ∀ z : ℂ, |z.re| ≤ M → (1 + ‖z‖) ^ r * ‖f z‖ ≤ C

/-! SM.0: rank-bound API and its discriminating examples. -/

theorem hasRankBound_mono {Λ Λ' : Set ℂ} {p : ℕ}
    (h : Λ' ⊆ Λ) (hp : hasRankBound Λ p) : hasRankBound Λ' p := by
  sorry

theorem hasRankBound_of_le {Λ : Set ℂ} {p q : ℕ}
    (hp : hasRankBound Λ p) (hpq : p ≤ q) : hasRankBound Λ q := by
  sorry

example : hasRankBound (∅ : Set ℂ) 0 := by
  sorry

example : hasRankBound (Set.range (fun n : ℤ => (n : ℂ))) 1 := by
  sorry

example : ¬hasRankBound (Set.range (fun n : ℤ => (n : ℂ))) 0 := by
  sorry

example : ¬hasFiniteRank (Set.range (fun n : ℕ => (1 : ℂ) / ((n : ℂ) + 1))) := by
  sorry

/-! Entire-product and vertical-interpolation milestones, BPLZZ 2.2 and 2.4–2.7. -/

theorem exists_entire_exact_zero_set {Λ : Set ℂ} (hΛ : hasFiniteRank Λ) :
    ∃ f : ℂ → ℂ, hasFiniteEntireOrder f ∧ ∀ z : ℂ, f z = 0 ↔ z ∈ Λ := by
  sorry

theorem exists_rapid_polynomial_zero_set {ψ : ℂ → ℂ}
    (hψ : hasFiniteEntireOrder ψ) (q : Polynomial ℂ) :
    ∃ ν : ℂ → ℂ, verticalRapid ν ∧ ∀ z : ℂ, ν z = 0 ↔ ψ (q.eval z) = 0 := by
  sorry

theorem exists_lattice_interpolation (A : Finset ℂ) :
    ∃ ν : ℂ → ℂ, verticalModerate ν ∧
      (∀ z : ℂ, z ∈ A → ν z ≠ 0) ∧
      (∀ n : ℤ, (n : ℂ) ∉ A → ν (n : ℂ) = 0) := by
  sorry

theorem verticalRapid_to_moderate {f : ℂ → ℂ} (hf : verticalRapid f) :
    verticalModerate f := by
  sorry

theorem verticalModerate_mul {f g : ℂ → ℂ}
    (hf : verticalModerate f) (hg : verticalModerate g) :
    verticalModerate (fun z => f z * g z) := by
  sorry

theorem verticalRapid_moderate_mul {f g : ℂ → ℂ}
    (hf : verticalRapid f) (hg : verticalModerate g) :
    verticalRapid (fun z => f z * g z) := by
  sorry

example : verticalModerate Complex.exp := by
  sorry

example : verticalRapid (fun z : ℂ => Complex.exp (z ^ 2)) := by
  sorry

example : ¬verticalModerate (fun z : ℂ => Complex.exp (-(z ^ 2))) := by
  sorry

example : ¬verticalRapid (fun _ : ℂ => (1 : ℂ)) := by
  sorry

example : hasFiniteEntireOrder (fun z : ℂ => z * (z - 1)) := by
  sorry

example : verticalRapid (fun _ : ℂ => (0 : ℂ)) := by
  sorry

/-! SM.1: the continuous, complex-linear refinement of an existing centroid.
The real Schwartz multiplier theorem itself requires its README-only carrier.
-/

def isContinuousComplexMultiplier {A : Type*} [NonUnitalNonAssocSemiring A]
    [TopologicalSpace A] [Module ℂ A] (T : CentroidHom A) : Prop :=
  Continuous (fun a : A => T a) ∧ ∀ (c : ℂ) (a : A), T (c • a) = c • T a

theorem continuousComplexMultiplier_continuous {A : Type*}
    [NonUnitalNonAssocSemiring A] [TopologicalSpace A] [Module ℂ A]
    {T : CentroidHom A} (hT : isContinuousComplexMultiplier T) :
    Continuous (fun a : A => T a) := by
  sorry

theorem continuousComplexMultiplier_smul {A : Type*}
    [NonUnitalNonAssocSemiring A] [TopologicalSpace A] [Module ℂ A]
    {T : CentroidHom A} (hT : isContinuousComplexMultiplier T) (c : ℂ) (a : A) :
    T (c • a) = c • T a := by
  sorry

/-- On the scalar algebra, this is the expected scalar action. -/
example (c : ℂ) : ∃ T : CentroidHom ℂ,
    isContinuousComplexMultiplier T ∧ ∀ z : ℂ, T z = c * z := by
  sorry

/-- On a unital scalar algebra, evaluation at the identity determines the centroid. -/
example (T : CentroidHom ℂ) : ∀ z : ℂ, T z = T 1 * z := by
  sorry

/-- Zero multiplication gives a test that detects the complex-linearity requirement. -/
example {A : Type*} [NonUnitalNonAssocSemiring A] [TopologicalSpace A] [Module ℂ A]
    (T : CentroidHom A) (a : A) (h : T (Complex.I • a) ≠ Complex.I • T a) :
    ¬isContinuousComplexMultiplier T := by
  sorry

end TauCeti.AutomorphicSchwartz
