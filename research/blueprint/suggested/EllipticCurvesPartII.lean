import TauCeti.AlgebraicGeometry.EllipticCurve.PointCount
import TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist
import Mathlib.Data.ZMod.Basic
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.Tactic.NormNum

/-!
This file is not the roadmap and is not exhaustive. The definitive document is
research/blueprint/readmes/EllipticCurvesPartII.md. Suggested statements help
contributors and reviewers agree on names and signatures; they do not implement
the roadmap. Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

This identifier is an import index for EllipticLegendreCharacterInterfaces,
whose accepted packet owns all 37 declarations, 33 API items and 27 tests.
Its suggested file is research/blueprint/suggested/EllipticLegendreCharacterInterfaces.lean.
No definition or theorem is redeclared here. In particular, compiling the
examples below does not certify elaboration of that owner's suggested file.

Stage correspondence (same LG.n keys on the owner):
LG.0: legendre, scaledLegendre, legendreParameters, scaledLegendreTwoTorsion;
LG.1: good-prime units and odd primitive-character conductor divisibility;
LG.2: scaledLegendreCrt, scaledLegendreSquareclassEquiv, readings of native μ;
LG.3: minusOneOrderFour, two-by-four subgroup and exact two-adic count;
LG.4: twistHalvingPoint, its double, order and third descent class;
LG.5: symmetric-cubic trace zero and the BSD.0 twist-trace specialization.
The owner's missing character/conductor carriers remain README targets.

These anonymous examples check concrete acceptance data on existing carriers.
They introduce no competing Legendre definitions or claimed general results.
-/

namespace EllipticCurvesPartIIAcceptance

-- LG.0: coefficient/discriminant conventions, including singular endpoints.
example : (⟨0, 0, 0, -1, 0⟩ : WeierstrassCurve ℚ).Δ = 64 := by
  norm_num [WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
    WeierstrassCurve.b₆, WeierstrassCurve.b₈]

example : (⟨0, -3, 0, 2, 0⟩ : WeierstrassCurve ℚ).Δ = 64 := by
  norm_num [WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
    WeierstrassCurve.b₆, WeierstrassCurve.b₈]

example : (⟨0, -(1 + 1 / 2), 0, 1 / 2, 0⟩ : WeierstrassCurve ℚ).Δ = 1 := by
  norm_num [WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
    WeierstrassCurve.b₆, WeierstrassCurve.b₈]

example : (⟨0, -1, 0, 0, 0⟩ : WeierstrassCurve ℚ).Δ = 0 := by
  norm_num [WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
    WeierstrassCurve.b₆, WeierstrassCurve.b₈]

-- The scalar-two model is the native twist at (0,-1/2), not (0,-2).
example : (⟨0, -(1 + 1 / 2), 0, 1 / 2, 0⟩ : WeierstrassCurve ℚ).quadraticTwistOf
    0 (-1 / 2) = ⟨0, -3, 0, 2, 0⟩ := by
  ext <;> norm_num [WeierstrassCurve.quadraticTwistOf]

-- Keep the six labels even where values coincide.
example : ([(-1 : ℚ), 1 / (-1), 1 - (-1), 1 / (1 - (-1)),
    (-1) / ((-1) - 1), ((-1) - 1) / (-1)] : List ℚ) =
    [-1, -1, 2, 1 / 2, 1 / 2, 2] := by norm_num

example : ([(3 : ℚ), 1 / 3, 1 - 3, 1 / (1 - 3), 3 / (3 - 1),
    (3 - 1) / 3] : List ℚ) = [3, 1 / 3, -2, -1 / 2, 3 / 2, 2 / 3] := by norm_num

-- LG.3: the two choices of i at p=5 give the stated halves of (0,0).
example : (⟨0, 0, 0, -1, 0⟩ : WeierstrassCurve (ZMod 5)).toAffine.Equation 2 4 := by
  rw [WeierstrassCurve.Affine.equation_iff]
  decide

example : (⟨0, 0, 0, -1, 0⟩ : WeierstrassCurve (ZMod 5)).toAffine.Equation 3 3 := by
  rw [WeierstrassCurve.Affine.equation_iff]
  decide

-- LG.4: λ=3, d=2, t=v=2, i=3 in F₅; corrected coordinates (4,3).
example : (⟨0, 2, 0, 2, 0⟩ : WeierstrassCurve (ZMod 5)).toAffine.Equation 4 3 := by
  rw [WeierstrassCurve.Affine.equation_iff]
  decide

-- Existing source finding EllipticLegendreCharacterInterfaces/E1:
-- the printed local pair (4,4) fails the equation.
example : ¬ (⟨0, 2, 0, 2, 0⟩ : WeierstrassCurve (ZMod 5)).toAffine.Equation 4 4 := by
  rw [WeierstrassCurve.Affine.equation_iff]
  decide

example : (8 * 3 * 2 * 2 * (2 + 3 * 2) : ZMod 5) = 3 ∧
    (2 * (2 * 2 ^ 2) + 4 * 3 * 2 * 2 : ZMod 5) = 4 := by decide

-- Native trace includes the point at infinity and is integer-valued.
local instance : Fact (Nat.Prime 7) := ⟨by decide⟩

example (W : WeierstrassCurve (ZMod 7)) :
    W.frobeniusTrace = (8 : ℤ) - W.pointCount := by
  rw [WeierstrassCurve.frobeniusTrace_def]
  norm_num [Nat.card_eq_fintype_card]

end EllipticCurvesPartIIAcceptance
