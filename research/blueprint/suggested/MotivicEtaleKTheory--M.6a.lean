import Mathlib

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

Named theorem proofs are specification stubs; the examples are proved tests.
No data definition uses sorry; no spectrum or scheme theory is developed here.
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

/-- support_vertex_fails: the vertex has codimension zero inside its own face. -/
theorem support_vertex_fails :
    ¬ admissibleAffineSupport 1
      (fun i : Fin 2 => if i = 0 then Polynomial.X else 1 - Polynomial.X)
      (Ideal.span ({Polynomial.X} : Set (Polynomial ℚ))) := by
  sorry

/-- support_interior_point: its intersections with the two vertices are empty. -/
theorem support_interior_point :
    admissibleAffineSupport 1
      (fun i : Fin 2 => if i = 0 then Polynomial.X else 1 - Polynomial.X)
      (Ideal.span ({Polynomial.X - Polynomial.C (1 / 2 : ℚ)} : Set (Polynomial ℚ))) := by
  sorry

/-! Proved tests of the two light definitions; the reader carries all Checks. -/

-- Keeping every vertex imposes no equations.
example (t : Fin (n + 1) → R) : faceIdeal t Finset.univ = ⊥ := by
  simp [faceIdeal]

-- The face retaining vertex 0 kills coordinate 1, rather than coordinate 0.
example (t : Fin 2 → R) : faceIdeal t {0} = Ideal.span ({t 1} : Set R) := by
  have h : {i : Fin 2 | i ∉ ({0} : Finset (Fin 2))} = {1} := by
    ext i
    fin_cases i <;> simp
  unfold faceIdeal
  rw [h]
  simp

-- support_empty: the unit ideal defines an empty support in every face ring.
example (p : ℕ) (t : Fin (n + 1) → R) :
    admissibleAffineSupport p t (⊤ : Ideal R) := by
  intro τ _ P hP hle
  rw [Ideal.map_top] at hle
  exact (hP.ne_top (top_le_iff.mp hle)).elim

-- Positive weight excludes the whole degree-zero field simplex.
example :
    ¬ admissibleAffineSupport 1 (fun _ : Fin 1 => (1 : ℚ)) (⊥ : Ideal ℚ) := by
  intro h
  have hface : faceIdeal (fun _ : Fin 1 => (1 : ℚ)) Finset.univ = ⊥ := by
    simp [faceIdeal]
  have : (faceIdeal (fun _ : Fin 1 => (1 : ℚ)) Finset.univ).IsPrime := by
    rw [hface]
    infer_instance
  have hfull := h Finset.univ (by simp)
  have hbad := hfull ⊥ (by infer_instance) (by simp)
  simp at hbad

end

end TauCeti.HomotopyConiveau
