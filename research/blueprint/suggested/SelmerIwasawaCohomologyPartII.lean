import Mathlib.Algebra.Module.LinearMap.End
import Mathlib.LinearAlgebra.Prod
import Mathlib.Algebra.Module.Submodule.Lattice

/-!
Suggested statements for SelmerIwasawaCohomologyPartII.

This file is a roadmap of signatures, not an implementation. The reader document
is definitive for every target, hypothesis, source locator, API and Check.
Only milestones readily stated on carriers present at the pinned baseline appear
here. In particular, geometric cycle mixed extensions and supported syntomic
period diagrams remain reader targets; this file introduces no substitute carriers.

HP.4/finite-filtration-annihilation: the native linear algebra substatement of the
weight-filtration argument in Disegni–Liu, Lemma B.10, published p. 344.
-/

namespace TauCeti.Selmer.Height

variable {R M : Type*} [Semiring R] [AddCommMonoid M] [Module R M]

/-- An endomorphism lowering an exhaustive filtration of length m is killed by
its m-th power. The ideal-power and varying-support versions are reader targets. -/
theorem pow_eq_zero_of_lowers_filtration
    (f : Module.End R M) (F : ℕ → Submodule R M) (m : ℕ)
    (hmono : Monotone F) (hzero : F 0 = ⊥) (hexhaustive : F m = ⊤)
    (hlower : ∀ i < m, ∀ x ∈ F (i + 1), f x ∈ F i) : f ^ m = 0 := by
  sorry

/-- Zero-length filtration forces the ambient module to be zero. -/
example (F : ℕ → Submodule R M) (hzero : F 0 = ⊥)
    (hexhaustive : F 0 = ⊤) : ∀ x : M, x = 0 := by
  sorry

/-- A single lowering step on a one-step filtration forces the map itself to vanish. -/
example (f : Module.End R M) (F : ℕ → Submodule R M)
    (hmono : Monotone F) (hzero : F 0 = ⊥) (hexhaustive : F 1 = ⊤)
    (hlower : ∀ x ∈ F 1, f x ∈ F 0) : f = 0 := by
  sorry

/-- The two-dimensional Jordan block needs two factors: it need not vanish after one. -/
example [Nontrivial R] :
    let f : Module.End R (R × R) := (LinearMap.snd R R R).prod 0
    f ^ 2 = 0 ∧ f (0, 1) = (1, 0) ∧ f ≠ 0 := by
  sorry

/-- The 4d−1 graded pieces in B.10 fit in the uniform exponent 4n−5. -/
example (d n : ℕ) (hd : 1 ≤ d) (hdn : d < n) :
    4 * d - 1 ≤ 4 * n - 5 := by
  sorry

end TauCeti.Selmer.Height
