import Mathlib

/-!
# Arithmetic statistics, Part V: representative target signatures

The accompanying README is the full specification, with source locators and exact
supplier contracts. This file gives light definitions and selected milestones on
the pinned carriers. Counts retain the specified cutoffs and denominators; orbit,
moduli, covering and arithmetic probability constructions remain README targets.
-/

noncomputable section
open scoped BigOperators Topology
open Polynomial Filter
set_option autoImplicit false
set_option linter.unusedVariables false

namespace TauCetiRoadmap.ArithmeticStatisticsPartV

/-! ## Layer 3: Fields and class-group statistics -/

namespace FieldStatistics

/-- Root dilation in descending monic coefficients, with weights 1,…,n. -/
def weightedDilation {n : ℕ} (Y : ℝ) (a : Fin n → ℝ) : Fin n → ℝ :=
  fun i => Y ^ (i.val + 1) * a i

/-- The same separation constants are used for every normalized root tuple in the region. -/
def separatedRoots {n : ℕ} (c C : ℝ) (z : Fin n → ℂ) : Prop :=
  (∀ i, ‖z i‖ ≤ C) ∧ ∀ i j, i ≠ j → c ≤ ‖z i - z j‖

/-- Weighted coefficient dilations compose multiplicatively. -/
theorem weightedDilation_mul {n : ℕ} (U Y : ℝ) (a : Fin n → ℝ) :
    weightedDilation U (weightedDilation Y a) = weightedDilation (U * Y) a := by sorry

/-- Uniform inverse-Vandermonde estimate underlying the full-region generator fibre bound. -/
theorem separated_generator_coefficients (n : ℕ) (hn : 2 ≤ n)
    (c C : ℝ) (hc : 0 < c) (hC : 0 ≤ C) :
    ∃ K : ℝ, 0 < K ∧ ∀ (Y : ℝ), 1 ≤ Y → ∀ z : Fin n → ℂ,
      separatedRoots c C z → ∀ m : Fin n → ℤ,
      (∀ j, ‖∑ i : Fin n, (m i : ℂ) * ((Y : ℂ) * z j) ^ i.val‖ ≤ C * Y) →
      ∀ i, |(m i : ℝ)| * Y ^ i.val ≤ K * Y := by sorry

/-- Integrality makes all coefficients of degree at least two vanish for large Y. -/
theorem separated_generator_high_coefficients (n : ℕ) (hn : 2 ≤ n)
    (c C : ℝ) (hc : 0 < c) (hC : 0 ≤ C) :
    ∃ Y₀ : ℝ, 1 ≤ Y₀ ∧ ∀ (Y : ℝ), Y₀ < Y → ∀ z : Fin n → ℂ,
      separatedRoots c C z → ∀ m : Fin n → ℤ,
      (∀ j, ‖∑ i : Fin n, (m i : ℂ) * ((Y : ℂ) * z j) ^ i.val‖ ≤ C * Y) →
      ∀ i, 2 ≤ i.val → m i = 0 := by sorry

example : weightedDilation 2 (![1,2] : Fin 2 → ℝ) = ![2,8] := by sorry
example : weightedDilation 3 (weightedDilation 2 (![1,2] : Fin 2 → ℝ)) =
    ![6,72] := by sorry
example (a : Fin 2 → ℝ) : weightedDilation 1 a = a ∧
    weightedDilation 0 a = 0 := by sorry
example : separatedRoots 2 1 (![-1,1] : Fin 2 → ℂ) := by sorry
example : separatedRoots 2 1 (![-Complex.I,Complex.I] : Fin 2 → ℂ) := by sorry
example (c : ℝ) (hc : 0 < c) :
    ¬ separatedRoots c 1 (0 : Fin 2 → ℂ) := by sorry
example : weightedDilation 2 (0 : Fin 0 → ℝ) = 0 ∧
    separatedRoots 1 (-1) (0 : Fin 0 → ℂ) := by sorry
example : separatedRoots 1 0 (0 : Fin 1 → ℂ) ∧
    ¬ separatedRoots 1 (-1) (0 : Fin 1 → ℂ) := by sorry

/-- Zero separation permits a singular evaluation matrix and nonzero invisible coefficients. -/
example : separatedRoots 0 0 (0 : Fin 3 → ℂ) ∧
    ∃ m : Fin 3 → ℤ, m ≠ 0 ∧
      ∀ j : Fin 3, ∑ i : Fin 3, (m i : ℂ) *
        ((0 : Fin 3 → ℂ) j) ^ i.val = 0 := by sorry

/-- Field-count and discriminant exponents include the loss of one translation parameter. -/
example : ((3 * (3 + 1) / 2 : ℚ) - 1) / (3 * (3 - 1)) = 5/6 ∧
    ((4 + 1 : ℚ) / (2 * 4 - 2)) = 5/6 ∧
    (1/2 + 1/4 : ℚ) = 3/4 := by sorry

/-- Signature and squarefreeness controls for the alternating-extension transfer. -/
example : (X ^ 3 - X - 1 : ℤ[X]).discr = -23 := by sorry
example : (X ^ 3 - 4 * X + 1 : ℤ[X]).discr = 229 := by sorry
example : (X ^ 3 - 2 : ℤ[X]).discr = -108 := by sorry

/-- The fixed-degree quartic discriminant uses the same sign as the binary-form convention. -/
example : (X ^ 4 - 1 : ℤ[X]).discr = -256 := by sorry

/-- In degree two on three-torsion, extension must be normalized by the inverse degree. -/
example (x : ZMod 3) : 2 * (2 * x) = x := by sorry

/-- This irreducible cubic reduction gives nontrivial decomposition with trivial inertia at 2. -/
example : ∀ x : ZMod 2, (X ^ 3 + X + 1 : (ZMod 2)[X]).eval x ≠ 0 := by sorry

/-- The subgroup-size input needs nonabelian simplicity; its smallest positive case is A₅. -/
example : (1 : ℕ) ^ 2 < 2 ∧ (60 : ℕ) < 12 ^ 2 := by sorry

/-- Quadratic generator reflection fixes a trace-zero model, so dividing its orbit size by 2 fails. -/
example (a : ℤ) : (X ^ 2 + C a : ℤ[X]).comp (-X) = X ^ 2 + C a := by sorry

/-- The degree-two real transporter obstruction: xy is fixed by the split diagonal torus. -/
example (u : ℝ) (hu : u ≠ 0) :
    (MvPolynomial.C u * MvPolynomial.X (0 : Fin 2)) *
      (MvPolynomial.C u⁻¹ * MvPolynomial.X (1 : Fin 2)) =
        MvPolynomial.X (0 : Fin 2) * MvPolynomial.X (1 : Fin 2) := by sorry


end FieldStatistics

/-
The README also specifies cubicSplittingSymbol, splittingTypeSet,
maximalNotTotallyRamifiedSet, maximalTotallyRamifiedSet, notFundamentalSet;
CubicLocalSpecification with its acceptable and strongly acceptable predicates,
standard specifications, localMass, archimedeanMass and p-adic densities;
cohenLenstraMomentPrediction; malleIndex, malleIndexGroup, malleA, malleB,
malleStrong and malleWeak; the dyadic remainder E_n and local products γ_j.

The arithmetic interfaces FieldStatistics.RigidField, rigidFieldCount,
relativeNarrowClassGroup and its norm kernel, OutsideInvolutions,
IsAdmissibleType, IsGoodType, typeAutStabilizer, transportType,
outsideClassCount, rigidQuadraticMoment, unrigidQuadraticMoment,
GoodTypeMomentPrediction, BadTypeMomentPrediction,
RefinedGoodTypeMomentPrediction, quotientGraphType, catalogueRow,
eligibleA4Kernel, eligibleA4Kernels and a4SampleEstimator remain in the README.

The supporting theorems doublePointInterpolation, polynomialMap_finiteFibres,
simpleGroup_largeProperSubgroup and IsMinkowskiReducedGram_exists, and
RankGrid.geometricZero are specified in the README, the last with its coefficient
growth and vanishing-order hypotheses in the README. The remaining definitions
are IsRankGoverningField; pellRadicands,
negativePellRadicands, pellRadicandsBelow, pellFourRankSlice, pellDiscriminant;
monicOrderGram, binaryOrderGram, IsMinkowskiReducedGram, IsMonicQuasiReduced,
IsBinaryQuasiReduced, IsStrongReducedGram; regular monic and binary regions,
the trace-zero volume and monogenic asymptotic predicates;
tameOutsideLocalMass, localModelLogExponent and LogarithmicMomentPrediction.
They use the arithmetic orbit, extension, order and moment interfaces specified
there. Only the weighted-dilation and separated-root interfaces are declared here.
-/

end TauCetiRoadmap.ArithmeticStatisticsPartV
