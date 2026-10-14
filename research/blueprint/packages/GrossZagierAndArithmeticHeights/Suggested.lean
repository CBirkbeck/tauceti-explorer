import Mathlib

/-!
# GrossZagierAndArithmeticHeights: representative target signatures

The roadmap is `README.md`: it specifies the arithmetic objects, hypotheses,
comparisons and source locators. This file records the light algebraic interfaces
and milestone signatures whose carriers already exist in Mathlib and Tau Ceti; it
is not exhaustive. Design choices made explicit here: characters act through the
inverse-character eigenspace (`chiIsotypic`), finite CM sums are weighted by the
character (`heegnerFinite`) and averaged with the inverse group order
(`heegnerAverage`), and the central-value function is a normalization unit times
the square of a supplied linear root (`bdpLFunction`). A finite representation
does not construct a CM orbit, and a power series does not construct its CM
moment measure. The geometric height and kernel milestones stay in the README.
-/

noncomputable section
open scoped BigOperators
open Filter Topology

namespace TauCetiRoadmap.GrossZagierAndArithmeticHeights

/-! ## Layer 0: normalization and character conventions -/

/-- Half the root-of-unity count, used for imaginary quadratic CM stabilizers. -/
def unitIndex (K : Type*) [Field K] [NumberField K] : ℚ :=
  (NumberField.Units.torsionOrder K : ℚ) / 2

example (K : Type*) [Field K] [NumberField K]
    (h : NumberField.Units.torsionOrder K = 6) : unitIndex K = 3 := by sorry
example (K : Type*) [Field K] [NumberField K]
    (h : NumberField.Units.torsionOrder K = 4) : unitIndex K = 2 := by sorry
example (K : Type*) [Field K] [NumberField K] :
    2 * unitIndex K = (NumberField.Units.torsionOrder K : ℚ) := by sorry

/-- Differentiating the completed weight-two function at a central zero. -/
theorem completed_derivative_at_central_zero (N : ℝ) (hN : 0 < N)
    (L : ℂ → ℂ) (d : ℂ) (hL : HasDerivAt L d 1) (hzero : L 1 = 0) :
    HasDerivAt (fun s : ℂ => (N : ℂ) ^ (s / 2) * Complex.Gammaℂ s * L s)
      ((Real.sqrt N / Real.pi : ℝ) * d) 1 := by sorry

/-! ## Layer 8: global Gross–Zagier formulas -/

section Characters
variable {L G V : Type*} [Field L] [CommGroup G] [Fintype G]
  [AddCommGroup V] [Module L V]

/-- The inverse-character eigenspace of a finite representation. -/
def chiIsotypic (ρ : Representation L G V) (χ : G →* Lˣ) : Submodule L V :=
  ⨅ g : G, LinearMap.ker (ρ g - (χ g : L)⁻¹ • LinearMap.id)

example (ρ : Representation L G V) (χ : G →* Lˣ) (x : V) :
    x ∈ chiIsotypic ρ χ ↔ ∀ g, ρ g x = (χ g : L)⁻¹ • x := by sorry
example (ρ : Representation L G V) (χ : G →* Lˣ) (g : G) (x : V)
    (hx : x ≠ 0) (hfix : ρ g x = x) (hχ : χ g ≠ 1) :
    x ∉ chiIsotypic ρ χ := by sorry

/-- The character-weighted finite orbit sum, in the inverse-character convention. -/
def heegnerFinite (ρ : Representation L G V) (χ : G →* Lˣ) (x : V) : V :=
  ∑ g : G, (χ g : L) • ρ g x

example (ρ : Representation L G V) (χ : G →* Lˣ) (x : V)
    (hfix : ∀ g, ρ g x = x) (hχ : χ ≠ 1) : heegnerFinite ρ χ x = 0 := by sorry
example (ρ : Representation L G V) (x : V) :
    heegnerFinite ρ 1 x = ∑ g : G, ρ g x := by sorry

/-- The probability average of the finite character sum. -/
def heegnerAverage (ρ : Representation L G V) (χ : G →* Lˣ) (x : V) : V :=
  (Fintype.card G : L)⁻¹ • heegnerFinite ρ χ x

example (ρ : Representation L G V) (x : V)
    (hcard : (Fintype.card G : L) ≠ 0) (hfix : ∀ g, ρ g x = x) :
    heegnerAverage ρ 1 x = x := by sorry
example (x : ZMod 3) :
    heegnerAverage
      (Representation.trivial (ZMod 3) (Multiplicative (ZMod 3)) (ZMod 3)) 1 x = 0 := by
  sorry

/-- The probability average lies in the inverse-character eigenspace, including characteristic dividing the group order, where it is zero. -/
theorem heegnerAverage_isotypic (ρ : Representation L G V) (χ : G →* Lˣ) (x : V) :
    heegnerAverage ρ χ x ∈ chiIsotypic ρ χ := by sorry

/-- A bilinear pairing of probability averages scales by the inverse square of the orbit cardinality. -/
theorem heegnerAverage_pairing {W : Type*} [AddCommGroup W] [Module L W]
    (ρ : Representation L G V) (ρ' : Representation L G W)
    (χ : G →* Lˣ) (x : V) (y : W) (B : V →ₗ[L] W →ₗ[L] L)
    (hcard : (Fintype.card G : L) ≠ 0) :
    B (heegnerAverage ρ χ x) (heegnerAverage ρ' χ⁻¹ y) =
      ((Fintype.card G : L) ^ 2)⁻¹ * B (heegnerFinite ρ χ x) (heegnerFinite ρ' χ⁻¹ y) := by
  sorry
end Characters

/-! ## Layer 9: weight-two anticyclotomic functions and logarithms -/

section CentralValue
variable {R : Type*} [CommRing R]

/-- The central-value square adapter for an already supplied bounded linear root and a specified normalization unit. -/
def bdpLFunction (root : PowerSeries R) (normalization : (PowerSeries R)ˣ) :
    PowerSeries R := (normalization : PowerSeries R) * root ^ 2

example (root : PowerSeries R) (normalization : (PowerSeries R)ˣ) :
    PowerSeries.constantCoeff (bdpLFunction root normalization) =
      PowerSeries.constantCoeff (normalization : PowerSeries R) *
        (PowerSeries.constantCoeff root) ^ 2 := by sorry
example (root : PowerSeries R) (normalization : (PowerSeries R)ˣ) :
    bdpLFunction (2 * root) normalization = 4 * bdpLFunction root normalization := by sorry
example : bdpLFunction (1 + PowerSeries.X : PowerSeries ℤ) 1 =
    1 + 2 * PowerSeries.X + PowerSeries.X ^ 2 := by sorry

/-- The imprimitive series obtained by multiplying finitely many supplied local factors. -/
def bdpIncomplete (centralValue : PowerSeries R) {ι : Type*}
    (S : Finset ι) (localFactor : ι → PowerSeries R) : PowerSeries R :=
  centralValue * ∏ w ∈ S, localFactor w

example (centralValue : PowerSeries R) {ι : Type*} (localFactor : ι → PowerSeries R) :
    bdpIncomplete centralValue (∅ : Finset ι) localFactor = centralValue := by sorry
example (centralValue : PowerSeries R) {ι : Type*} [DecidableEq ι]
    (w : ι) (localFactor : ι → PowerSeries R) (hzero : localFactor w = 0) :
    bdpIncomplete centralValue {w} localFactor = 0 := by sorry

/-- A character-evaluation ring map preserves the normalized square. -/
theorem bdpLFunction_evaluation {S : Type*} [CommRing S]
    (ev : PowerSeries R →+* S) (root : PowerSeries R)
    (normalization : (PowerSeries R)ˣ) :
    ev (bdpLFunction root normalization) =
      ev (normalization : PowerSeries R) * ev root ^ 2 := by sorry
end CentralValue

/-- The rational good-prime weight-two Euler factor. -/
def bdpEulerFactor (p a : ℚ) : ℚ := (1 + p - a) / p

example : bdpEulerFactor 5 1 = 1 := by sorry
example : bdpEulerFactor 5 (-4) = 2 := by sorry

/-- Under the Hasse bound `|a| ≤ 2√p` the good-prime Euler factor is nonzero for `p > 1`,
since `1 + p - a ≥ (√p - 1)² > 0`. At `p = 1, a = 2` the numerator vanishes, so `1 < p` is
needed. -/
theorem bdpEulerFactor_ne_zero (p a : ℚ) (hp : 1 < p)
    (ha : |(a : ℝ)| ≤ 2 * Real.sqrt (p : ℝ)) : bdpEulerFactor p a ≠ 0 := by sorry

end TauCetiRoadmap.GrossZagierAndArithmeticHeights

-- README definitions with geometric or analytic carriers:
-- canonicalHeightRat, poincareHeight, coefficientHeight.
-- characterHeight, arithmeticIntersection, admissibleExtension.
-- weaklyAdmissibleExtension, weaklyAdmissibleExtension_normalize.
-- normalizedHodgeClass, rationalXiRealization, compositionPairing.
-- maninConstant, toricHom, normalizedToricForm.
-- admissibleToricOrder, specialCorrespondenceCycle, cmDegreeZeroClass.
-- picardGeneratingSeries, arithmeticHeightKernel, degenerateSchwartz.
-- arakelovMeasure, admissibleMetric, admissibleGreen.
-- arakelovGreen, arakelovDualizingMetric, graphAdmissibleMeasure.
-- realAdmissibleMetric, pseudoTheta, mixedThetaEisenstein.
-- normalizedWhittaker, cmOrbitAverage, localDerivativeCorrection.
-- colmezTestFunction, normShell, modifiedSelfIntersection.
-- regularizedCmGreen, cmLocalMultiplicity, residueAdjunctionLine.
-- twoSplitDegeneracy, archDerivativeKernel, partialRankin.
-- classicalComplexHeight, markedModularGreen.
-- heckeGreen, cmKernelInvariant, cmArchimedeanHeightSum.
-- cmTangentHeight, etaCMTangent, diagonalHeckeGreen.
-- inertOrderModel, halfHomCount, newCMHom.
-- cmSelfIntersection, cmPrimeHeightSum, inertCMHomLattice.
-- inertNormIdeals, ramifiedOrderModel, classicalRankinKernel.
-- genusEisensteinCombination, rankinGenusSign, signedDivisorSums.
-- cmModifiedIntersection, coeffPairing, IsAdmissibleOrder.
-- peterssonRatio, quaternionicBDP.
