import Mathlib

/-!
# HabiroNumberFields: representative target signatures

The roadmap is README.md. This file records definitions and theorem signatures
statable against the pinned APIs and is not exhaustive. Finite products use
integer exponents; the hypergeometric sum is total, while its identity requires
nonvanishing denominators. The half shift uses the constant-one formal branch.
-/

namespace TauCetiRoadmap.HabiroNumberFields

open Finset

/-! ## Layer 0: finite Chern classes and ordinary units -/

/-! ## Layer 1: cyclic dilogarithms and finite regulators -/

section CyclicDilog

variable {R : Type*} [CommRing R]

/-- The integral cyclic dilogarithm, including its empty-product extension at order zero. -/
def cyclicDilog (n : ℕ) (ζ x : R) : R :=
  ∏ k ∈ range n, (1 - ζ ^ k * x) ^ k

/-- At order two the positive exponent fixes the orientation of the cyclic product. -/
example (x : R) : cyclicDilog 2 (-1 : R) x = 1 + x := by
  simp [cyclicDilog, Finset.prod_range_succ]

/-- The order-three product retains the asymmetric exponents of the two nontrivial roots. -/
example (ζ x : R) :
    cyclicDilog 3 ζ x = (1 - ζ * x) * (1 - ζ ^ 2 * x) ^ 2 := by
  simp [cyclicDilog, Finset.prod_range_succ]

end CyclicDilog

section FiniteIdentities

variable {K : Type*} [Field K]

/-- Quasi-periodicity in a form that remains meaningful when a factor vanishes. -/
theorem cyclicDilog_quasiPeriodicity (n s : ℕ) (ζ x : K)
    (hn : 0 < n) (hζ : IsPrimitiveRoot ζ n) (hs : s ≤ n) :
    (1 - x ^ n) ^ s * cyclicDilog n ζ (ζ ^ s * x) =
      cyclicDilog n ζ x * (∏ k ∈ range s, (1 - ζ ^ k * x)) ^ n := by
  sorry

/-- The phase-free value of the integral cyclic dilogarithm at one. -/
theorem cyclicDilog_one_pow_twentyFour (n : ℕ) (ζ : K)
    (hn : 0 < n) (hζ : IsPrimitiveRoot ζ n) (hnK : (n : K) ≠ 0) :
    cyclicDilog n ζ 1 ^ 24 = (n : K) ^ (12 * n) := by
  sorry

/-- The total finite cyclic hypergeometric sum; identities below exclude its singular inputs. -/
def cyclicHypergeom (n : ℕ) (ζ x y z : K) : K :=
  ∑ k ∈ range n,
    ((∏ j ∈ range k, (1 - ζ ^ (j + 1) * y)) /
      (∏ j ∈ range k, (1 - ζ ^ (j + 1) * x))) * z ^ k

/-- The order-two expression checks which Pochhammer product is in the denominator. -/
example (ζ x y z : K) :
    cyclicHypergeom 2 ζ x y z = 1 + (1 - ζ * y) / (1 - ζ * x) * z := by
  simp [cyclicHypergeom, Finset.sum_range_succ]

/-- A nonsingular value distinguishes the orientation of the cyclic hypergeometric sum. -/
example : cyclicHypergeom 2 (-1 : ℚ) 2 3 5 = 23 / 3 := by
  norm_num [cyclicHypergeom, Finset.sum_range_succ, Finset.prod_range_succ]

/-- The finite difference equation on the nonsingular cyclic hypersurface. -/
theorem cyclicHypergeom_shift (n : ℕ) (ζ x y z : K)
    (hn : 0 < n) (hζ : IsPrimitiveRoot ζ n)
    (hx : x ^ n ≠ 1) (hy : y ^ n ≠ 1)
    (hrel : (1 - y ^ n) * z ^ n = 1 - x ^ n) :
    (1 - z) * cyclicHypergeom n ζ x y z =
      (x - ζ * y * z) * cyclicHypergeom n ζ x y (ζ * z) := by
  sorry

/-- The odd-order Kashaev–Mangazeev–Stroganov identity with every denominator cleared. -/
theorem kms_odd (n : ℕ) (ζ x y z : K)
    (hn : 3 ≤ n) (hodd : Odd n) (hnK : (n : K) ≠ 0)
    (hζ : IsPrimitiveRoot ζ n) (hx : x ≠ 0) (hy : y ≠ 0) (hz : z ≠ 0)
    (hX : x ^ n ≠ 1) (hY : y ^ n ≠ 1) (hXY : x ^ n ≠ y ^ n)
    (hrel : (1 - y ^ n) * z ^ n = 1 - x ^ n) :
    cyclicHypergeom n ζ x y z ^ n *
        cyclicDilog n ζ x⁻¹ * cyclicDilog n ζ (ζ * y) * cyclicDilog n ζ (ζ / z) =
      (ζ * y) ^ (n * (n - 1) / 2) * cyclicDilog n ζ 1 *
        cyclicDilog n ζ (ζ * y / x) * cyclicDilog n ζ (x / (y * z)) := by
  sorry

end FiniteIdentities

/-! ## Layer 2: arithmetic Habiro rings -/

/-! ## Layer 3: local sections and global indexed lines -/

section HalfShift

variable {K : Type*} [Field K] [CharZero K]

/-- Linear logarithmic coefficient for a half-shifted, normalized Pochhammer factor. -/
def halfShiftLinearCoeff (z r : K) : K := -z / (24 * r * (1 - z))

/-- The half shift at minus one has a positive first coefficient. -/
example : halfShiftLinearCoeff (-1 : ℚ) 1 = 1 / 48 := by
  norm_num [halfShiftLinearCoeff]

/-- Reversing the local coordinate reverses the first coefficient. -/
example : halfShiftLinearCoeff (-1 : ℚ) (-1) = -1 / 48 := by
  norm_num [halfShiftLinearCoeff]

end HalfShift

/-
The README definitions absent here include excludedInteger, excludedIntegerPrime,
finiteChernRoot, chernUnitClass, the Kummer value P, finiteRegulator,
poweredRegulatorLifts, etaleBlochGroup, eta, the positive cyclic chains, bott,
localFiniteRegulator, localFiniteChern, epsilonClass, T_m and rootLine;
compatibleRoots, arithmeticCyclotomicAlgebra, unramifiedFrobenius,
coefficientFrobenius, cyclotomicFrobenius, arithmeticReexpand,
ArithmeticTaylorFamily, ArithmeticHabiroRing, ArithmeticHabiroRingAway,
LocalHabiroRing, localUntwist, the prime-to-p local chart, the p-chain
completion, multiplicativeTaylorCoordinates,
weighted jets, orderComponent and abelianScalarMap;
invertibleLocalSection, LocalIndexedModule, pDepletedPolylog,
normalizedPochhammer, GlobalIndexedFamily and its descended indexed line,
k3PicardMap, powerSubstitution, habiroInvolution, the involution pairing,
habiroFieldMap, indexedLine_fieldMap, indexedLine_galois,
localSectionNorm and indexedLine_transferNorm.
Their completion, K-theory, regulator and indexed-line carriers require the
supplier constructions and compatibility theorems stated there. Their milestones
include the Chern unit theorem, signed eta comparison, arithmetic classical
comparison, local freeness, effective global descent, tensor equivalences,
scalar equivalence and multiplicative transfer.
-/

end TauCetiRoadmap.HabiroNumberFields
