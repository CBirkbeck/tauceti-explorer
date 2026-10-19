import Mathlib

/-!
# Gross–Zagier formulas and arithmetic heights, Part II: representative target signatures

The authoritative roadmap is GrossZagierAndArithmeticHeightsPartII.md. This file records
light definitions and representative theorem signatures expressible using the pinned
Mathlib polynomial API; it is not exhaustive. The roadmap's formal moduli spaces,
supported intersection classes, Green currents and relative orbital integrals require
their own carriers and remain targets in that document.

The finite polynomial witnesses make the negative derivative convention, odd valuation
and two-component exotic normalization explicit. Rational parameters also allow algebraic
specializations at zero and one; these are not residue field cardinalities.
-/

namespace TauCetiRoadmap.GrossZagierAndArithmeticHeightsPartII

open scoped BigOperators

/-! ## Layer 0: Unramified special cycles and derived intersections -/

/-- The rank-one normalized unramified density polynomial from Li–Zhang Example 3.5.2.
Its geometric nonsplit interpretation requires odd nonnegative valuation. -/
noncomputable def rankOneDensity (a : ℕ) : Polynomial ℚ :=
  ∑ i ∈ Finset.range (a + 1), (-Polynomial.X) ^ i

/-- The local density derivative convention is minus the polynomial derivative at one. -/
noncomputable def densityDerivative (P : Polynomial ℚ) : ℚ :=
  -(P.derivative.eval 1)

/-- Valuation zero gives the constant polynomial one. -/
theorem rankOneDensity_zero : rankOneDensity 0 = 1 := by
  sorry

/-- Increasing the truncation adds its last monomial. -/
theorem rankOneDensity_succ (a : ℕ) :
    rankOneDensity (a + 1) = rankOneDensity a + (-Polynomial.X) ^ (a + 1) := by
  sorry

/-- At minus one, all terms have value one. -/
theorem rankOneDensity_eval_neg_one (a : ℕ) :
    (rankOneDensity a).eval (-1) = (a : ℚ) + 1 := by
  sorry

/-- Constants have zero normalized derivative. -/
theorem densityDerivative_C (c : ℚ) :
    densityDerivative (Polynomial.C c) = 0 := by
  sorry

/-- The derivative convention is additive. -/
theorem densityDerivative_add (P Q : Polynomial ℚ) :
    densityDerivative (P + Q) = densityDerivative P + densityDerivative Q := by
  sorry

/-- A monomial has negative normalized derivative equal to its exponent. -/
theorem densityDerivative_X_pow (a : ℕ) :
    densityDerivative ((Polynomial.X : Polynomial ℚ) ^ a) = -(a : ℚ) := by
  sorry

/-- For odd valuation 2b+1, the negative derivative is the rank-one intersection b+1. -/
theorem rankOne_odd_derivative (b : ℕ) :
    densityDerivative (rankOneDensity (2 * b + 1)) = (b : ℚ) + 1 := by
  sorry

/-- The even valuation zero is a polynomial boundary, outside the nonsplit geometric case. -/
example : densityDerivative (rankOneDensity 0) = 0 := by
  sorry

/-- The first odd valuation has intersection length one. -/
example : densityDerivative (rankOneDensity 1) = 1 := by
  sorry

/-- The next odd valuation has intersection length two. -/
example : densityDerivative (rankOneDensity 3) = 2 := by
  sorry

/-- A direct polynomial identity fixes the alternating sign. -/
example : rankOneDensity 1 = 1 - Polynomial.X := by
  sorry

/-- This monomial check detects replacing minus the derivative by the derivative. -/
example : densityDerivative ((Polynomial.X : Polynomial ℚ) ^ 2) = -2 := by
  sorry

/-! ## Layer 5: Exotic smooth ramified geometry -/

/-- The rank-two finite sum in Li–Liu II Proposition 2.44, with inner upper limit j.
For a geometric intersection q is an odd residue cardinality and b1 ≤ b2.
The outer factor two includes both connected components. -/
def exoticRankTwoCount (q : ℚ) (b1 b2 : ℕ) : ℚ :=
  2 * ∑ j ∈ Finset.range (b1 + 1),
    ((∑ i ∈ Finset.range (j + 1), q ^ i) + ((b2 : ℚ) - j) * q ^ j)

/-- With the first index zero, the count is independent of q. -/
theorem exoticRankTwoCount_zero_left (q : ℚ) (b2 : ℕ) :
    exoticRankTwoCount q 0 b2 = 2 * ((b2 : ℚ) + 1) := by
  sorry

/-- The first nontrivial diagonal has value twice q+3. -/
theorem exoticRankTwoCount_one_one (q : ℚ) :
    exoticRankTwoCount q 1 1 = 2 * (q + 3) := by
  sorry

/-- Algebraic evaluation at zero tests the finite-sum bounds, without a geometric claim. -/
theorem exoticRankTwoCount_at_zero (b1 b2 : ℕ) :
    exoticRankTwoCount 0 b1 b2 = 2 * ((b1 : ℚ) + b2 + 1) := by
  sorry

/-- Algebraic evaluation at one also tests the inner summation limit. -/
theorem exoticRankTwoCount_at_one (b1 b2 : ℕ) :
    exoticRankTwoCount 1 b1 b2 = 2 * ((b1 : ℚ) + 1) * ((b2 : ℚ) + 1) := by
  sorry

/-- Both components contribute to the minimal rank-two intersection. -/
example : exoticRankTwoCount 3 0 0 = 2 := by
  sorry

/-- Raising just the second invariant gives four. -/
example : exoticRankTwoCount 3 0 1 = 4 := by
  sorry

/-- The first diagonal at q=3 gives twelve. -/
example : exoticRankTwoCount 3 1 1 = 12 := by
  sorry

end TauCetiRoadmap.GrossZagierAndArithmeticHeightsPartII

/-
Additional targets stated in the authoritative roadmap document follow in layer order.
Their formal-moduli, supported-K, cohomological, arithmetic-current and relative-integral
carriers are not supplied by the pinned APIs used in this file.

Layer 0:
  homConventions — Special Hom convention comparison
  specialCycles — Unramified Kudla–Rapoport cycles
  cartierDifference — Cartier and difference divisors
  derivedCycle — Derived KR class and Euler intersection
  basisProperness — Basis independence and finite support
  selfdualCancellation — Self-dual cancellation
  rankOne — Unramified rank-one normalization

Layer 1:
  unitaryDl — Unitary Deligne–Lusztig varieties
  vertices — Odd-type vertex cycles
  horizontalSplitting — Horizontal and vertical classes
  primitiveHorizontal — Primitive horizontal cycles
  tateLifting — Special Tate-module lifting criteria
  lowRankVertical — Low-rank vertical multiplicities

Layer 2:
  coxeterCohomology — Unitary Coxeter cohomology input
  tateGeneration — Tate classes generated by strata
  numericalCurves — Numerical reduction to curves
  curveFunction — Unramified curve intersection function
  verticalFourier — Geometric vertical Fourier identity
  chernQuotient — Cycle-class quotient and corrected Chern character
  higherLocalModularity — Higher local modularity

Layer 3:
  densityInterface — Unramified density and Whittaker normalization
  analyticSplit — Unramified analytic horizontal and vertical functions
  horizontalIdentity — Unramified horizontal identity
  analyticFourier — Analytic regularity and restricted Fourier vanishing
  uncertainty — Hermitian uncertainty principle
  differenceInduction — Difference induction and unramified KR identity

Layer 4:
  almostdualCycles — Original and auxiliary almost self-dual cycles
  comparisonModel — Almost self-dual comparison model
  auxiliaryFormula — Auxiliary almost self-dual identity
  divisorComparison — Pullback of Y-divisors
  originalFormula — Almost self-dual Y identity
  localConsumer — Li–Liu local identity interface

Layer 5:
  exoticCycles — Exotic smooth special cycles
  exoticLine — Exotic modular line and zero complex
  exoticLinear — Exotic Cartierness and linear invariance
  exoticVertices — Exotic trace-dual strata
  exoticTate — Exotic Tate reduction and modular line degree
  exoticRankTwo — Exotic rank-two intersection
  exoticCancellation — Exotic cancellation and component symmetry

Layer 6:
  exoticDensity — Exotic normalized density interface
  exoticSplit — Exotic horizontal and vertical functions
  exoticExtensionCount — Ramified lattice-extension cancellation
  exoticAnalyticFourier — Exotic analytic Fourier support
  exoticCurveFourier — Exotic geometric local modularity
  exoticHorizontal — Exotic horizontal identity
  exoticSpecialInduction — Exotic special two-overlattice induction
  exoticMain — Exotic smooth Kudla–Rapoport identity
  relativeCycle — Relative and absolute exotic cycle comparison

Layer 7:
  kramerCycles — Krämer special cycles and exceptionals
  symplecticIncidence — Symplectic incidence resolution
  kramerStrata — Krämer vertex strata
  kramerDeformation — Krämer stratum deformation
  kramerHorizontal — Krämer horizontal lattices and primitive cycles
  modifiedHorizontal — Modified Krämer horizontal and vertical classes
  kramerCancellation — Parity-corrected Krämer cancellation
  kramerGeometricFourier — Krämer geometric Fourier bounds

Layer 8:
  modifiedDensity — Modified Krämer density derivative
  primitiveDensity — Primitive Krämer density formula
  kramerAnalyticSplit — Krämer analytic horizontal and vertical functions
  kramerAnalyticBound — Corrected Krämer analytic partial-integral bound
  kramerHorizontal — Krämer horizontal identity
  kramerMain — Krämer Kudla–Rapoport identity and isolated odd-top obligation

Layer 9:
  groupIntersection — Group AFL intersection
  semilieIntersection — Derived fixed locus and semi-Lie intersection
  analyticAflInterface — AFL orbital-integral normalization
  cayleyGraph — Relative Cayley graph comparison
  aflRankReduction — AFL rank and norm-unit reduction
  aflLocalConstancy — Local constancy and compact support
  maximalOrder — Maximal-order AFL input

Layer 10:
  globalCycles — Global unitary special cycles
  globalKClass — Integral cycle K-classes
  globalUniformization — Formal special-cycle uniformization
  localDegree — Local arithmetic degrees

Layer 11:
  cmOrder — CM order and fat CM moduli
  cmProper — Fat CM finiteness and properness
  heckeCharacteristic — Hecke fixed loci and characteristic decomposition
  cmVirtualCycle — Virtual one-cycle from derived CM
  cmUniformization — Formal Hecke and CM uniformization

Layer 12:
  chowSeries — Chow-valued unitary divisor series
  complexOrbits — Complex uniformization and CM fixed point
  kudlaGreen — Kudla Green function and metric convention
  arithmeticSeries — Arithmetic divisor series and Green correction
  modularity — Scoped divisor and Green modularity
  cmPairing — Normalized CM intersection series
  pairingModular — CM intersection modularity
  finiteOrbits — Finite local CM–KR orbit formula
  archimedeanOrbits — Refined CM invariant and archimedean orbit formula

Layer 13:
  siegelSeries — Unitary Siegel Eisenstein specialization
  incoherence — Incoherent Diff set and coefficient derivative
  modelAdmissibility — Admissible RSZ global models
  siegelWeilInput — Coherent theta integral comparison input
  semiglobal — Semi-global and inert global identities
  greenStarDegree — Green star products and arithmetic degrees
  archimedeanAsw — Archimedean arithmetic Siegel–Weil coefficient
  unramifiedAsw — Unramified arithmetic Siegel–Weil formula
  modifiedEisenstein — Modified ramified Eisenstein derivative
  ramifiedAsw — Modified arithmetic Siegel–Weil target

Layer 14:
  relativeAnalyticInput — Relative trace and Gaussian inputs
  holomorphicDerivative — Corrected holomorphic derivative
  fourierVanishing — Fourier vanishing criterion
  globalComparison — Conditional global arithmetic comparison
  orbitIsolation — Orbitwise semi-Lie AFL from global comparison
  strongAfl — Strongly regular AFL target over Q_p
  generalAflConjecture — General regular-semisimple AFL boundary
-/
