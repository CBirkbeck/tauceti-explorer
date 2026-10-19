import Mathlib.LinearAlgebra.BilinearForm.Basic
import Mathlib.Data.Rat.Cast.Defs

/-!
# K3 surfaces, Mukai moduli and holomorphic symplectic boundedness

This file gives suggested forms, not an exhaustive checklist. The companion
README is definitive: alternative formulations serving its mathematical
requirements are welcome. Only light definitions over existing carriers and
statements directly expressible at the pins appear here. In particular, the
geometric K3, sheaf-moduli, period and integral-model targets belong to the
README; no abstract proposition is used as a stand-in for their carriers.

These rational-coordinate identities specify the signs and normalization of
K3.1 and K3.8. They do not construct an integral Mukai lattice or assert that
translation preserves its integral carrier. Integral geometry uses the native
TauCeti.IntegralLattice interface, as described in the README.

Sources: Charles, Annals 184 (2016), Definition 2.1, pp.492–493 and
Theorem 2.10 proof, p.503; Lieblich–Maulik–Snowden, Ann. Sci. ENS 47
(2014), §3.3, pp.296–297. The geometric targets and open proof obligations
remain in the README; these signatures only record rational identities.
-/

namespace TauCeti.K3.Suggested

variable {V : Type*} [AddCommGroup V] [Module ℚ V]

/-- Rational Mukai pairing on the existing product carrier. -/
def mukaiPair (b : LinearMap.BilinForm ℚ V) (x y : ℚ × V × ℚ) : ℚ :=
  b x.2.1 y.2.1 - x.1 * y.2.2 - y.1 * x.2.2

/-- Rational B-field action with the positive-exponential convention. -/
def bFieldTranslate (b : LinearMap.BilinForm ℚ V) (β : V)
    (x : ℚ × V × ℚ) : ℚ × V × ℚ :=
  (x.1, x.2.1 + x.1 • β, x.2.2 + b β x.2.1 + x.1 * b β β / 2)

theorem mukaiPair_symm (b : LinearMap.BilinForm ℚ V)
    (hb : ∀ u v, b u v = b v u) (x y : ℚ × V × ℚ) :
    mukaiPair b x y = mukaiPair b y x := by
  sorry

theorem mukaiPair_self (b : LinearMap.BilinForm ℚ V) (x : ℚ × V × ℚ) :
    mukaiPair b x x = b x.2.1 x.2.1 - 2 * x.1 * x.2.2 := by
  sorry

theorem mukaiPair_ns (b : LinearMap.BilinForm ℚ V) (u v : V) :
    mukaiPair b (0, u, 0) (0, v, 0) = b u v := by
  sorry

-- The rank/top summand is a hyperbolic plane with cross pairing -1.
example (b : LinearMap.BilinForm ℚ V) :
    mukaiPair b (1, 0, 0) (0, 0, 1) = -1 := by
  sorry

-- The length-two ideal-sheaf vector has square two.
example (b : LinearMap.BilinForm ℚ V) :
    mukaiPair b (1, 0, -1) (1, 0, -1) = 2 := by
  sorry

-- The structure-sheaf vector has the opposite square.
example (b : LinearMap.BilinForm ℚ V) :
    mukaiPair b (1, 0, 1) (1, 0, 1) = -2 := by
  sorry

theorem bFieldTranslate_zero (b : LinearMap.BilinForm ℚ V)
    (x : ℚ × V × ℚ) : bFieldTranslate b 0 x = x := by
  sorry

theorem bFieldTranslate_add (b : LinearMap.BilinForm ℚ V)
    (hb : ∀ u v, b u v = b v u) (β γ : V) (x : ℚ × V × ℚ) :
    bFieldTranslate b (β + γ) x =
      bFieldTranslate b β (bFieldTranslate b γ x) := by
  sorry

theorem bFieldTranslate_inverse (b : LinearMap.BilinForm ℚ V)
    (hb : ∀ u v, b u v = b v u) (β : V) (x : ℚ × V × ℚ) :
    bFieldTranslate b (-β) (bFieldTranslate b β x) = x := by
  sorry

/-- The rational isometry milestone; integral preservation is a separate target. -/
theorem bFieldTranslate_isometry (b : LinearMap.BilinForm ℚ V)
    (hb : ∀ u v, b u v = b v u) (β : V) (x y : ℚ × V × ℚ) :
    mukaiPair b (bFieldTranslate b β x) (bFieldTranslate b β y) =
      mukaiPair b x y := by
  sorry

example (b : LinearMap.BilinForm ℚ V) (β : V) :
    bFieldTranslate b β (0, 0, 1) = (0, 0, 1) := by
  sorry

example (b : LinearMap.BilinForm ℚ V) (β : V) :
    bFieldTranslate b β (1, 0, 0) = (1, β, b β β / 2) := by
  sorry

example (b : LinearMap.BilinForm ℚ V) (β u : V) :
    bFieldTranslate b β (0, u, 0) = (0, u, b β u) := by
  sorry

-- The primitive norm-two plane used in K3.3 has this determinant.
theorem zarhin_plane_determinant (d k : ℚ) :
    2 * (2 * d * k ^ 2) - 1 * 1 = 4 * d * k ^ 2 - 1 := by
  sorry

-- Integral multipliers in the discriminant formula would fail this example.
example : (2 : ℚ) / (2 : ℚ) ^ 2 = 1 / 2 := by
  sorry

end TauCeti.K3.Suggested
