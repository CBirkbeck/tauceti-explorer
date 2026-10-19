import Mathlib.RingTheory.Ideal.Height
import Mathlib.RingTheory.Ideal.Quotient.Defs
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.Algebra.Polynomial.Basic

/-!
This file is not the roadmap and is not exhaustive. The reader document
MotivicEtaleKTheory--M.6a.md is definitive. These statements suggest Lean forms
so contributors and reviewers can converge on names and signatures.

M.6a constructs a tower on actual K-theory spectra and identifies its layers.
Those spectra, support diagrams, derived realisations and coherent-sheaf models
are not available at the pinned libraries. Their definitions, API, Checks and
milestones are therefore in the reader document, without replacement carriers
here. The fixed compact Suggested.lean shape in WORKERS.md applies.

The light affine test below uses existing ideals, quotient rings and heights.
In its geometric use R is an affine coordinate ring of X × Δⁿ and t are its
simplex coordinates (whose sum is one). The predicate is meaningful for any
coordinate family, so its definition does not assume an equation it does not
use. It checks prime heights in each face ring, not heights in R.

Theorem proofs and examples are specification stubs. No data definition uses
sorry; no spectrum or scheme theory is developed in this file.
-/

namespace TauCeti.HomotopyConiveau

noncomputable section

variable {R : Type*} [CommRing R] {n : ℕ}

/-- Ideal defining the face with surviving vertices τ. -/
def faceIdeal (t : Fin (n + 1) → R) (τ : Finset (Fin (n + 1))) : Ideal R :=
  Ideal.span (t '' {i | i ∉ τ})

/-- The affine facewise codimension condition on the closed support V(J). -/
def admissibleAffineSupport (p : ℕ) (t : Fin (n + 1) → R) (J : Ideal R) : Prop :=
  ∀ τ : Finset (Fin (n + 1)), τ.Nonempty →
    ∀ P : Ideal (R ⧸ faceIdeal t τ), P.IsPrime →
      Ideal.map (Ideal.Quotient.mk (faceIdeal t τ)) J ≤ P →
        (p : ℕ∞) ≤ P.height

/-- The full simplex face imposes no equations. -/
theorem faceIdeal_eq_bot_of_univ (t : Fin (n + 1) → R) :
    faceIdeal t Finset.univ = ⊥ := by
  sorry

/-- Weight zero includes every closed support. -/
theorem admissibleAffineSupport_zero (t : Fin (n + 1) → R) (J : Ideal R) :
    admissibleAffineSupport 0 t J := by
  sorry

/-- The unit ideal defines the empty support. -/
theorem admissibleAffineSupport_unit (p : ℕ) (t : Fin (n + 1) → R) :
    admissibleAffineSupport p t (⊤ : Ideal R) := by
  sorry

/-- The criterion depends only on the underlying closed subset. -/
theorem admissibleAffineSupport_radical (p : ℕ) (t : Fin (n + 1) → R)
    (J : Ideal R) :
    admissibleAffineSupport p t J.radical ↔ admissibleAffineSupport p t J := by
  sorry

/-! A few Checks on real affine simplex rings; the reader carries all Checks. -/

-- support_empty: V(⊤) is empty in every face.
example (p : ℕ) (t : Fin (n + 1) → R) :
    admissibleAffineSupport p t (⊤ : Ideal R) := by
  sorry

-- support_vertex_fails: the vertex has codimension zero inside its own face.
example :
    ¬ admissibleAffineSupport 1
      (fun i : Fin 2 => if i = 0 then Polynomial.X else 1 - Polynomial.X)
      (Ideal.span ({Polynomial.X} : Set (Polynomial ℚ))) := by
  sorry

-- support_interior_point: its intersections with the two vertices are empty.
example :
    admissibleAffineSupport 1
      (fun i : Fin 2 => if i = 0 then Polynomial.X else 1 - Polynomial.X)
      (Ideal.span ({Polynomial.X - Polynomial.C (1 / 2 : ℚ)} : Set (Polynomial ℚ))) := by
  sorry

-- The degree-zero field simplex has no nonempty positive-codimension support.
example :
    ¬ admissibleAffineSupport 1 (fun _ : Fin 1 => (1 : ℚ)) (⊥ : Ideal ℚ) := by
  sorry

end

end TauCeti.HomotopyConiveau
