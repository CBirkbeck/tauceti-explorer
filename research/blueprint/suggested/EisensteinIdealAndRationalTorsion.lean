import Mathlib

/-!
# EisensteinIdealAndRationalTorsion: representative target signatures

The roadmap is the accompanying README. This file records definitions and theorem signatures
statable against the pinned APIs and is not exhaustive. It fixes the positive cuspidal index,
uses nonsingular points on elliptic Weierstrass curves for rational torsion, and uses the native
additive order, whose value zero means infinite order. The integral modular and Néron objects
and their comparisons are targets of the README.
-/

namespace TauCetiRoadmap.EisensteinIdealAndRationalTorsion

/-! ## Layer 0: Integral Eisenstein arithmetic -/

/-- At prime level `P`, the numerator of `(P - 1) / 12` in lowest terms. -/
def cuspidalIndex (P : ℕ) : ℕ :=
  (P - 1) / Nat.gcd (P - 1) 12

/-- The cuspidal index is positive at every prime level, including the genus-zero levels. -/
theorem cuspidalIndex_pos (P : ℕ) (hP : P.Prime) : 0 < cuspidalIndex P := by
  sorry

/-- The integer formula agrees with the positive numerator of the rational fraction. -/
theorem cuspidalIndex_num (P : ℕ) (hP : P.Prime) :
    cuspidalIndex P = (((P : ℚ) - 1) / 12).num.natAbs := by
  sorry

/-- Gcd reduction gives the exact factorization, without discarding the dyadic part. -/
theorem cuspidalIndex_dvd (P : ℕ) (hP : P.Prime) :
    cuspidalIndex P ∣ P - 1 ∧ P - 1 = cuspidalIndex P * Nat.gcd (P - 1) 12 := by
  sorry

/-- Exactly the five genus-zero prime levels have index one. -/
theorem cuspidalIndex_eq_one (P : ℕ) (hP : P.Prime) :
    cuspidalIndex P = 1 ↔ P = 2 ∨ P = 3 ∨ P = 5 ∨ P = 7 ∨ P = 13 := by
  sorry

example : cuspidalIndex 11 = 5 := by
  norm_num [cuspidalIndex, Nat.gcd]

example : cuspidalIndex 17 = 4 := by
  norm_num [cuspidalIndex, Nat.gcd]

/-! ## Layer 1: Cusps, components and the Shimura subgroup -/

/-! ## Layer 2: Eisenstein kernels and abelian quotients -/

/-! ## Layer 3: Odd Eisenstein torsion and multiplicity one -/

/-! ## Layer 4: Dyadic torsion and winding homomorphisms -/

/-! ## Layer 5: Ogg’s rational torsion theorem -/

/-! ## Layer 6: Global descent and the Eisenstein quotient -/

/-! ## Layer 7: Cusp moduli and prime-torsion descent -/

/-- The positive-genus descent excludes a rational point of prime order outside the five
genus-zero levels. This includes order eleven. Mazur 1977, III §5, pp. 157–160. -/
theorem isogeny_iteration (P : ℕ) (hP : P.Prime)
    (hLevel : P ≠ 2 ∧ P ≠ 3 ∧ P ≠ 5 ∧ P ≠ 7 ∧ P ≠ 13)
    (W : WeierstrassCurve ℚ) [W.IsElliptic] (Q : W.toAffine.Point) :
    addOrderOf Q ≠ P := by
  sorry

/-! ## Layer 8: Level thirteen and all prime orders -/

/-- The separate genus-two descent excludes rational order thirteen.
Mazur–Tate 1973, §§2–4, pp. 43–48. -/
theorem order_thirteen_exclusion (W : WeierstrassCurve ℚ) [W.IsElliptic]
    (Q : W.toAffine.Point) : addOrderOf Q ≠ 13 := by
  sorry

/-- Each of the four allowed prime orders occurs on an elliptic curve over the rationals. -/
theorem occurring_small_primes (P : ℕ) (hP : P = 2 ∨ P = 3 ∨ P = 5 ∨ P = 7) :
    ∃ W : WeierstrassCurve ℚ, W.IsElliptic ∧ ∃ Q : W.toAffine.Point, addOrderOf Q = P := by
  sorry

/-- The all-prime rational torsion conclusion uses the genuine nonsingular point group
and retains the ellipticity hypothesis. -/
theorem all_prime_torsion (P : ℕ) (hP : P.Prime) (W : WeierstrassCurve ℚ)
    [W.IsElliptic] (Q : W.toAffine.Point) (hOrder : addOrderOf Q = P) :
    P = 2 ∨ P = 3 ∨ P = 5 ∨ P = 7 := by
  sorry

/- The full and cuspidal Eisenstein ideals, the integral subgroup schemes, the Eisenstein
abelian quotient, multiplicity one, winding maps, the Néron component calculation and the
level-thirteen isogeny descent are specified in the README. -/

end TauCetiRoadmap.EisensteinIdealAndRationalTorsion
