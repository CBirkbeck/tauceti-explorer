import Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass
import Mathlib.Algebra.Module.LinearMap.Basic

/-!
# Suggested signatures for CM rank-zero converses and twist nonvanishing

This file is not the roadmap and is not exhaustive. The reader document
`research/blueprint/readmes/CMRankZeroConverse.md` is definitive. These signatures
suggest Lean forms so that contributors and reviewers can converge on names and
interfaces. The proof placeholders make no implementation claim.

Only light definitions on carriers present at the pinned libraries are stated
here. The actual analytic L-function, continuous Bloch–Kato Selmer, cyclotomic
Iwasawa complex, completed-character evaluation and Kato zeta-map carriers are
supplier targets. Consequently pConverse, centralPrime, centralZeta, EvenGoldfeld
and their APIs/tests, together with the main converse and density theorems, are
README targets. They are not replaced by abstract predicates or mock modules.

The pointed projective cubic isomorphism in cubeSumModel_cubic_iso is also a
README target: its two explicit linear coordinate maps are specified there.
-/

namespace TauCeti.CMRankZeroConverse

/-! ## C.0: the central sign -/

/-- Total sign function; arithmetic applications require even weight at least two. -/
def centralSign (k : ℕ) : ℤ := (-1) ^ (k / 2 - 1)

lemma centralSign_sq (k : ℕ) : centralSign k ^ 2 = 1 := by
  sorry

lemma centralSign_mul_halfWeight (k : ℕ) (hk : 2 ≤ k) (heven : Even k) :
    centralSign k * (-1 : ℤ) ^ (k / 2) = -1 := by
  sorry

lemma centralSign_add_four (k : ℕ) (hk : 2 ≤ k) :
    centralSign (k + 4) = centralSign k := by
  sorry

/-- The displayed projection lands in the correctly signed eigenspace. -/
lemma centralSign_projection {E V : Type*} [Field E] [CharZero E]
    [AddCommGroup V] [Module E V] (c : V →ₗ[E] V)
    (hc : c.comp c = LinearMap.id) (k : ℕ) (v : V) :
    (c ((2 : E)⁻¹ • (v + (centralSign k : E) • c v)) =
      (centralSign k : E) • ((2 : E)⁻¹ • (v + (centralSign k : E) • c v))) ∧
    (c v = (centralSign k : E) • v →
      (2 : E)⁻¹ • (v + (centralSign k : E) • c v) = v) := by
  sorry

-- centralSign_weight_two
example : centralSign 2 = 1 := by
  sorry

-- centralSign_weight_four
example : centralSign 4 = -1 ∧ centralSign 6 = 1 := by
  sorry

-- centralSign_domain: the total definition does not broaden arithmetic hypotheses.
example : centralSign 0 = 1 ∧ ¬ (2 ≤ (0 : ℕ) ∧ Even (0 : ℕ)) ∧
    ¬ (2 ≤ (3 : ℕ) ∧ Even (3 : ℕ)) := by
  sorry

/-! ## C.6: the cube-sum model on the existing Weierstrass carrier -/

/-- The fixed scale compatible with the pointed cubic x³+y³=2n. -/
def cubeSumModel (n : ℤ) : WeierstrassCurve ℚ where
  a₁ := 0
  a₂ := 0
  a₃ := 0
  a₄ := 0
  a₆ := -27 * (n : ℚ) ^ 2

lemma cubeSumModel_coefficients (n : ℤ) :
    (cubeSumModel n).a₁ = 0 ∧ (cubeSumModel n).a₂ = 0 ∧
    (cubeSumModel n).a₃ = 0 ∧ (cubeSumModel n).a₄ = 0 ∧
    (cubeSumModel n).a₆ = -27 * (n : ℚ) ^ 2 := by
  sorry

lemma cubeSumModel_discriminant (n : ℤ) :
    (cubeSumModel n).Δ = -(2 : ℚ) ^ 4 * 3 ^ 9 * (n : ℚ) ^ 4 := by
  sorry

lemma cubeSumModel_isElliptic_iff (n : ℤ) :
    (cubeSumModel n).IsElliptic ↔ n ≠ 0 := by
  sorry

lemma cubeSumModel_neg (n : ℤ) : cubeSumModel (-n) = cubeSumModel n := by
  sorry

lemma cubeSumModel_j (n : ℤ) [(cubeSumModel n).IsElliptic] :
    (cubeSumModel n).j = 0 := by
  sorry

lemma cubeSumModel_map {F : Type*} [CommRing F] (f : ℚ →+* F) (n : ℤ) :
    (cubeSumModel n).map f =
      (⟨0, 0, 0, 0, -27 * (n : F) ^ 2⟩ : WeierstrassCurve F) := by
  sorry

-- cubeSumModel_one: includes the forward coordinate substitution of (1,1).
example : (cubeSumModel 1).a₆ = -27 ∧ (cubeSumModel 1).Δ = -314928 ∧
    (6 : ℚ) / (1 + 1) = 3 ∧ (9 : ℚ) * (1 - 1) / (1 + 1) = 0 := by
  sorry

-- cubeSumModel_zero
example : (cubeSumModel 0).Δ = 0 ∧ ¬ (cubeSumModel 0).IsElliptic := by
  sorry

-- cubeSumModel_negative: includes the forward substitution of (-1,-1).
example : cubeSumModel (-1) = cubeSumModel 1 ∧
    (6 : ℚ) * (-1) / ((-1) + (-1)) = 3 ∧
    (9 : ℚ) * (-1) * ((-1) - (-1)) / ((-1) + (-1)) = 0 := by
  sorry

-- cubeSumModel_three
example : (cubeSumModel 3).a₆ = -243 ∧ (cubeSumModel 3).Δ = -314928 * 81 := by
  sorry

end TauCeti.CMRankZeroConverse
