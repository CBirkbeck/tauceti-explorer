import Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Finset.Card
import TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist

/-!
# Suggested signatures for the Eisenstein-prime converse

This file is not the roadmap and is not exhaustive. The reader document
`research/blueprint/readmes/RankZeroOneBSDPartII.md` is definitive. These signatures
suggest names and interfaces for contributors and reviewers. Proof placeholders
make no implementation claim.

Only a light definition over the pinned Weierstrass carrier is given here.
EisensteinConverseData and admissibleTwists require the actual isogeny, conductor,
reduction, Galois-character and arithmetic-family suppliers specified in EC.0 and
EC.4. Their APIs and tests are README targets. The converse, ordinary Selmer
specialization, Heegner point and density targets also require supplier carriers
absent at the pins. They are not represented by arbitrary predicates or modules.

The four model examples below state the numerical/tangent parts of the EC.5 unit
tests. Connecting the tangent to order three and reduction to the local twist
family uses the named upstream suppliers in the reader.
-/

namespace TauCeti.RankZeroOneBSDPartII

/-! ## EC.5: the diagnostic model on the existing carrier -/

/-- The model y²+y=x³+x²+x used in CGLS Remark 5.2.4. -/
def nineteenA3 : WeierstrassCurve ℚ where
  a₁ := 0
  a₂ := 1
  a₃ := 1
  a₄ := 1
  a₆ := 0

lemma nineteenA3_coefficients :
    nineteenA3.a₁ = 0 ∧ nineteenA3.a₂ = 1 ∧ nineteenA3.a₃ = 1 ∧
    nineteenA3.a₄ = 1 ∧ nineteenA3.a₆ = 0 := by
  sorry

lemma nineteenA3_invariants :
    nineteenA3.Δ = -19 ∧ nineteenA3.c₄ = -32 ∧ nineteenA3.c₆ = 8 := by
  sorry

lemma nineteenA3_isElliptic : nineteenA3.IsElliptic := by
  sorry

lemma nineteenA3_j [nineteenA3.IsElliptic] : nineteenA3.j = 32768 / 19 := by
  sorry

lemma nineteenA3_map {F : Type*} [CommRing F] (f : ℚ →+* F) :
    nineteenA3.map f = (⟨0, 1, 1, 1, 0⟩ : WeierstrassCurve F) := by
  sorry

-- nineteenA3_discriminant_test
example : nineteenA3.Δ = -19 ∧ nineteenA3.Δ ≠ 19 ∧ nineteenA3.Δ ≠ -(19 : ℚ) ^ 2 := by
  sorry

-- nineteenA3_residue_three_test: five affine points and one point at infinity.
example :
    (Finset.univ.filter fun z : ZMod 3 × ZMod 3 =>
      z.2 ^ 2 + z.2 = z.1 ^ 3 + z.1 ^ 2 + z.1).card = 5 ∧
    (3 + 1 - (5 + 1) : ℤ) = -2 := by
  sorry

-- nineteenA3_twist_parameter_test: t²-4n=8 represents the squareclass of 2.
example : (nineteenA3.quadraticTwistOf 0 (-2)).Δ = -19 * (8 : ℚ) ^ 6 := by
  sorry

-- nineteenA3_origin_tangent_test: substituting y=x leaves the triple root x=0.
example : ∀ x : ℚ, (x ^ 2 + x) - (x ^ 3 + x ^ 2 + x) = -x ^ 3 := by
  sorry

-- EC.5/no-good-three-twist: numerical invariants of y²+xy+3y=x³.
example :
    (⟨1, 0, 3, 0, 0⟩ : WeierstrassCurve ℚ).Δ = -2160 ∧
    (⟨1, 0, 3, 0, 0⟩ : WeierstrassCurve ℚ).c₄ = -71 ∧
    (-71 : ℚ) ^ 3 / (-2160) = 357911 / 2160 := by
  sorry

end TauCeti.RankZeroOneBSDPartII
