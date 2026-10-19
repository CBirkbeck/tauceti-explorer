import Mathlib.GroupTheory.DoubleCoset
import TauCeti.GroupTheory.DoubleCoset.Basic

/-!
Elementary statements for the affine Deligne–Lusztig roadmap.

This file is not the roadmap and is not exhaustive. The reader document is
definitive. The statements suggest Lean forms so contributors and reviewers
can converge on names and signatures. Geometric targets whose carriers are
absent at the pins remain in that document.

Only the point condition on the existing group/coset carriers is defined here.
These are left cosets of an arbitrary subgroup; no normality hypothesis is
imposed. The declarations below are statements to prove, not implementations.
-/

namespace AffineDeligneLusztig

variable {G : Type*} [Group G]

/-- Relative Frobenius with the framing element on the left of Frobenius. -/
def relativeFrobenius (σ : G ≃* G) (b g : G) : G :=
  g⁻¹ * b * σ g

/-- The point locus, using a representative of an existing left-coset carrier. -/
def points (I : Subgroup G) (σ : G ≃* G) (b w : G) : Set (G ⧸ I) :=
  {q | ∃ g : G, (QuotientGroup.mk g : G ⧸ I) = q ∧
    relativeFrobenius σ b g ∈ DoubleCoset.doubleCoset w (I : Set G) I}

/-- The identity used to descend the condition through right multiplication. -/
theorem relativeFrobenius_mul (σ : G ≃* G) (b g i : G) :
    relativeFrobenius σ b (g * i) =
      i⁻¹ * relativeFrobenius σ b g * σ i := by
  sorry

/-- Frobenius stability of the level gives the representative criterion. -/
theorem mem_points_mk (I : Subgroup G) (σ : G ≃* G)
    (hσ : ∀ i ∈ I, σ i ∈ I) (b w g : G) :
    (QuotientGroup.mk g : G ⧸ I) ∈ points I σ b w ↔
      relativeFrobenius σ b g ∈ DoubleCoset.doubleCoset w (I : Set G) I := by
  sorry

/-- The double coset, rather than its chosen label, determines the locus. -/
theorem points_doubleCoset (I : Subgroup G) (σ : G ≃* G) (b w v : G)
    (h : DoubleCoset.doubleCoset w (I : Set G) I =
      DoubleCoset.doubleCoset v (I : Set G) I) :
    points I σ b w = points I σ b v := by
  sorry

/-- Change of framing identifies the two point conditions. -/
theorem framing_transport (I : Subgroup G) (σ : G ≃* G)
    (hσ : ∀ i ∈ I, σ i ∈ I) (b w h g : G) :
    (QuotientGroup.mk (h * g) : G ⧸ I) ∈
        points I σ (h * b * (σ h)⁻¹) w ↔
      (QuotientGroup.mk g : G ⧸ I) ∈ points I σ b w := by
  sorry

/-- A sigma-centralizer element preserves the locus. -/
theorem centralizer_transport (I : Subgroup G) (σ : G ≃* G)
    (hσ : ∀ i ∈ I, σ i ∈ I) (b w j g : G)
    (hj : j * b * (σ j)⁻¹ = b) :
    (QuotientGroup.mk (j * g) : G ⧸ I) ∈ points I σ b w ↔
      (QuotientGroup.mk g : G ⧸ I) ∈ points I σ b w := by
  sorry

/-- The top subgroup gives the unique coset, for any framing and label. -/
example (σ : G ≃* G) (b w : G) :
    points (⊤ : Subgroup G) σ b w = Set.univ := by
  sorry

/-- With trivial level, identity framing and Frobenius, every point occurs. -/
example : points (⊥ : Subgroup G) (MulEquiv.refl G) 1 1 = Set.univ := by
  sorry

/-- A different label at trivial level makes that same condition empty. -/
example (w : G) (hw : w ≠ 1) :
    points (⊥ : Subgroup G) (MulEquiv.refl G) 1 w = ∅ := by
  sorry

/-- In a commutative group the condition is independent of the coset point. -/
example {A : Type*} [CommGroup A] (I : Subgroup A) (b w : A) :
    points I (MulEquiv.refl A) b w = Set.univ ↔
      b ∈ DoubleCoset.doubleCoset w (I : Set A) I := by
  sorry

/-- Noncommutative conjugation changes the correct label at trivial level. -/
example (b g : G) :
    (QuotientGroup.mk g : G ⧸ (⊥ : Subgroup G)) ∈
      points ⊥ (MulEquiv.refl G) b (g⁻¹ * b * g) := by
  sorry

end AffineDeligneLusztig
