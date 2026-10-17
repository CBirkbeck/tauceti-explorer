import Mathlib

/-!
# K-theory of curves and elliptic curves: representative target signatures

The roadmap is `research/blueprint/readmes/EllipticKTheory.md`, with precise targets
and supplier contracts in its blueprint packet. This file is not exhaustive. It
records light definitions and theorem signatures statable over the pinned APIs.
The Frobenius predicate uses actual Weierstrass points and the q-power field map;
the rank-degree-point multiplication fixes the square-zero ideal convention.
-/

namespace TauCetiRoadmap.EllipticKTheory

noncomputable section
open WeierstrassCurve

/-! ## Layer 2: rank, degree and points -/

/-- Tensor-product multiplication in rank-degree-point coordinates, once the
K₀ and Picard comparisons have been supplied. The point carrier already exists. -/
def rankDegreePointMul {F : Type*} [Field F] [DecidableEq F]
    {W : WeierstrassCurve F} (a b : ℤ × ℤ × W.toAffine.Point) :
    ℤ × ℤ × W.toAffine.Point :=
  (a.1 * b.1, a.1 * b.2.1 + b.1 * a.2.1, a.1 • b.2.2 + b.1 • a.2.2)

/-- The rank-zero ideal has square zero, rather than coordinatewise multiplication. -/
theorem rank_zero_mul {F : Type*} [Field F] [DecidableEq F]
    {W : WeierstrassCurve F} (d e : ℤ) (P Q : W.toAffine.Point) :
    rankDegreePointMul (0, d, P) (0, e, Q) = (0, 0, 0) := by
  sorry

example {F : Type*} [Field F] [DecidableEq F] {W : WeierstrassCurve F}
    (a : ℤ × ℤ × W.toAffine.Point) : rankDegreePointMul (1, 0, 0) a = a := by
  sorry

example {F : Type*} [Field F] [DecidableEq F] {W : WeierstrassCurve F}
    (P : W.toAffine.Point) : rankDegreePointMul (0, 1, P) (0, 1, P) = (0, 0, 0) := by
  sorry

/-! ## Layer 5: twisted Frobenius points over a finite field -/

/-- Prime-to-p torsion satisfying q^i Frob_q(P)=P. This is a predicate on the
existing geometric point carrier; its bundled subgroup is a separate target. -/
def IsTwistedFrobeniusPoint {k : Type*} [Field k] [Fintype k]
    (W : WeierstrassCurve k) (L : Type*) [Field L] [DecidableEq L] [Algebra k L]
    (p i : ℕ) [CharP k p] (P : (W.baseChange L).toAffine.Point) : Prop :=
  (∃ m : ℕ, 0 < m ∧ Nat.Coprime m p ∧ m • P = 0) ∧
    Fintype.card k ^ i •
      Affine.Point.map (W' := W) (FiniteField.frobeniusAlgHom k L) P = P

/-- The geometric finite-order formula. Finiteness is explicit before Nat.card
is interpreted as an order; a=q+1−#E(k), and i is positive. -/
theorem twistedFrobenius_card {k L : Type*} [Field k] [Fintype k] [DecidableEq k]
    [Field L] [DecidableEq L] [Algebra k L] [IsAlgClosed L]
    (W : WeierstrassCurve k) [W.IsElliptic] (p i : ℕ) [CharP k p] (hi : 1 ≤ i) :
    Finite {P : (W.baseChange L).toAffine.Point // IsTwistedFrobeniusPoint W L p i P} ∧
      (Nat.card {P : (W.baseChange L).toAffine.Point //
        IsTwistedFrobeniusPoint W L p i P} : ℤ) =
        1 - ((Nat.card k : ℤ) + 1 - (Nat.card W.toAffine.Point : ℤ)) *
          (Fintype.card k : ℤ) ^ i + (Fintype.card k : ℤ) ^ (2 * i + 1) := by
  sorry

example {k L : Type*} [Field k] [Fintype k] [Field L] [DecidableEq L]
    [Algebra k L] (W : WeierstrassCurve k) (p i : ℕ) [CharP k p] :
    IsTwistedFrobeniusPoint W L p i 0 := by
  sorry

/-- A point killed by p cannot be a nonzero prime-to-p twisted point. -/
example {k L : Type*} [Field k] [Fintype k] [Field L] [DecidableEq L]
    [Algebra k L] (W : WeierstrassCurve k) (p i : ℕ) [CharP k p]
    (P : (W.baseChange L).toAffine.Point) (hp : p • P = 0)
    (hP : IsTwistedFrobeniusPoint W L p i P) : P = 0 := by
  sorry

/-- A nonsingular finite-field point count, including the origin at infinity. -/
example : Nat.card (⟨0, 0, 0, -1, 0⟩ : WeierstrassCurve (ZMod 5)).toAffine.Point = 8 := by
  sorry

/- Higher K-groups, localization and proper pushforward, Harder finiteness,
cohomological Frobenius descent, regular-model and vertical certificates require
the genuine supplier carriers specified by the roadmap. -/

end

end TauCetiRoadmap.EllipticKTheory
