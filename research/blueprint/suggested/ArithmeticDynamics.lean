/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ArithmeticDynamics.md` is definitive. These
statements suggest Lean forms so contributors and reviewers converge on names
and signatures. No declaration here claims an implementation.

Assembled parent and accepted DY.2, DY.3 and DY.6 continuations.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Only light definitions with actual bodies over existing carriers, selected
milestones/end statements, and examples are declared. Rational-map and rooted-
tree infrastructures, Berkovich spaces, sphere Riesz measures, generic entropy,
projective dynatomic geometry, adelic metrics and arithmetic certificates are
README targets. Their full API and tests remain in the definitive document.
There are no placeholder data definitions or invented substitute carriers.
All theorem placeholders are deliberate. This is a plan, not formalization.
-/

import TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight
import Mathlib.Dynamics.PeriodicPts.Defs
import Mathlib.Logic.Function.Iterate
import Mathlib.NumberTheory.Height.NumberField
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.Data.Nat.Totient
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.RingTheory.Polynomial.Resultant.Basic
import Mathlib.FieldTheory.PolynomialGaloisGroup
import Mathlib.Tactic
import Mathlib.Topology.UniformSpace.Equicontinuity
import Mathlib.Topology.UniformSpace.Equiv
import Mathlib.Topology.UniformSpace.OfCompactT2
import Mathlib.Topology.Compactification.OnePoint.ProjectiveLine
import Mathlib.Analysis.Complex.Basic
import Mathlib.FieldTheory.FinTrdeg
import Mathlib.FieldTheory.PrimitiveElement
import Mathlib.FieldTheory.RatFunc.Basic
import Mathlib.FieldTheory.IntermediateField.Adjoin.Algebra
import Mathlib.RingTheory.AlgebraicIndependent.Adjoin
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.RingTheory.Localization.Integral
import Mathlib.RingTheory.Localization.Integer
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.Basic.Complex.Basic

set_option linter.unusedVariables false

open scoped Topology
open Polynomial

namespace TauCeti.ArithmeticDynamics

/-! DY.0. Orbits reuse native iteration and periodic-point predicates.
The rational-map, quotient-moduli and reduction constructions are README targets. -/

section DY0
variable {α β : Type*}

/-- DY.0/forward-orbit. -/
def forwardOrbit (f : α → α) (x : α) : Set α :=
  Set.range fun n : ℕ ↦ f^[n] x

/-- DY.0/preperiodic-point. -/
def IsPreperiodicPt (f : α → α) (x : α) : Prop :=
  ∃ m : ℕ, f^[m] x ∈ Function.periodicPts f

def preperiodicPts (f : α → α) : Set α := {x | IsPreperiodicPt f x}

/-- The forward-orbit characterization; no topology or field hypothesis. -/
theorem isPreperiodicPt_iff_finite_forwardOrbit {f : α → α} {x : α} :
    IsPreperiodicPt f x ↔ (forwardOrbit f x).Finite := sorry

/-- Positive iterate invariance; the zero iterate would make every point preperiodic. -/
theorem isPreperiodicPt_iterate_iff {f : α → α} {x : α} {k : ℕ} (hk : 0 < k) :
    IsPreperiodicPt f^[k] x ↔ IsPreperiodicPt f x := sorry

/-- Conjugate dynamics have the same preperiodicity predicate. -/
theorem isPreperiodicPt_map_iff_of_bijective {fa : α → α} {fb : β → β}
    {g : α → β} (h : Function.Semiconj g fa fb) (hg : Function.Bijective g) (x : α) :
    IsPreperiodicPt fb (g x) ↔ IsPreperiodicPt fa x := sorry

-- forwardOrbit_id
example (x : α) : forwardOrbit id x = {x} := sorry
-- forwardOrbit_sq_sub_one: a tail followed by a two-cycle.
example : forwardOrbit (fun z : ℤ ↦ z ^ 2 - 1) 1 = {1, 0, -1} := sorry
-- one_not_mem_forwardOrbit_succ_two: forward iteration is not a group orbit.
example : (1 : ℤ) ∉ forwardOrbit (fun n : ℤ ↦ n + 1) 2 := sorry
-- isPreperiodicPt_one_sq_sub_one
example : IsPreperiodicPt (fun z : ℤ ↦ z ^ 2 - 1) 1 ∧
    1 ∉ Function.periodicPts (fun z : ℤ ↦ z ^ 2 - 1) := sorry
-- isPreperiodicPt_succ: wandering points.
example : ¬ IsPreperiodicPt (fun n : ℕ ↦ n + 1) 0 := sorry
end DY0

/-! DY.1. The same Tate limit supplies the height constructions.
General varieties and rational maps remain in the README until their carriers exist. -/

section DY1
variable {S : Type*} {φ : S → S} {h : S → ℝ} {α : ℝ}

/-- DY.1/tate-limit. Convergence hypotheses belong to the theorem, not the data. -/
noncomputable def tateLimit (φ : S → S) (h : S → ℝ) (α : ℝ) (P : S) : ℝ :=
  Filter.limUnder Filter.atTop fun n : ℕ ↦ h (φ^[n] P) / α ^ n

/-- DY.1/tate-limit-tendsto. -/
theorem tendsto_tateLimit (hα : 1 < α)
    (hC : ∃ C, ∀ Q, |h (φ Q) - α * h Q| ≤ C) (P : S) :
    Filter.Tendsto (fun n : ℕ ↦ h (φ^[n] P) / α ^ n) Filter.atTop
      (𝓝 (tateLimit φ h α P)) := sorry

/-- DY.1/tate-limit-error-bound. -/
theorem abs_tateLimit_sub_le (hα : 1 < α) {C : ℝ}
    (hC : ∀ Q, |h (φ Q) - α * h Q| ≤ C) (P : S) :
    |tateLimit φ h α P - h P| ≤ C / (α - 1) := sorry

/-- DY.1/tate-limit-functional-equation. -/
theorem tateLimit_apply (hα : 1 < α)
    (hC : ∃ C, ∀ Q, |h (φ Q) - α * h Q| ≤ C) (P : S) :
    tateLimit φ h α (φ P) = α * tateLimit φ h α P := sorry

/-- DY.1/tate-limit-unique. -/
theorem eq_tateLimit_of_bounded (hα : 1 < α)
    (hC : ∃ C, ∀ Q, |h (φ Q) - α * h Q| ≤ C) {g : S → ℝ}
    (hg : ∃ B, ∀ P, |g P - h P| ≤ B) (hgφ : ∀ P, g (φ P) = α * g P) :
    g = tateLimit φ h α := sorry

/-- DY.1/zero-canonical-height-iff-preperiodic: generic Northcott form. -/
theorem tateLimit_eq_zero_iff (hα : 1 < α)
    (hC : ∃ C, ∀ Q, |h (φ Q) - α * h Q| ≤ C)
    {A : Set S} (hA : Set.MapsTo φ A A)
    (hN : ∀ B : ℝ, {Q | Q ∈ A ∧ h Q ≤ B}.Finite) {P : S} (hP : P ∈ A) :
    tateLimit φ h α P = 0 ↔ IsPreperiodicPt φ P := sorry

-- tateLimit_double
example (x : ℝ) : tateLimit (fun y : ℝ ↦ 2 * y) id 2 x = x := sorry
-- tateLimit_id
example (h : S → ℝ) (P : S) : tateLimit id h 2 P = 0 := sorry
-- not_tendsto_tateSeq_one: expansion factor > 1 is essential.
example (x : ℝ) : ¬ ∃ L, Filter.Tendsto
    (fun n : ℕ ↦ (fun y : ℝ ↦ y + 1)^[n] x / (1 : ℝ) ^ n)
    Filter.atTop (𝓝 L) := sorry

/-- DY.1/tate-limit-of-elliptic-doubling. The factor two is specific to f790474. -/
theorem tateLimit_elliptic_doubling {F : Type*} [Field F]
    [Height.AdmissibleAbsValues F] [DecidableEq F]
    (W : WeierstrassCurve F) [W.IsElliptic] (P : W.toAffine.Point) :
    tateLimit (fun Q : W.toAffine.Point ↦ 2 • Q)
      WeierstrassCurve.Affine.Point.naiveHeight 4 P = 2 * P.canonicalHeight := sorry
end DY1

/-! DY.2. Light predicates from the reviewed Julia/measure continuation.
OnePoint C supplies the sphere point set; the omission predicate on a generic
space is not a model of the Berkovich line. Its application to the native
analytic line, local dynamics, Riesz measures and entropy remain README targets. -/

section DY2
open Set Function


variable {X Y : Type*}

/-! ArithmeticDynamics:DY.2/exceptional-points -/

def backwardOrbit (f : X → X) (a : X) : Set X :=
  {x | ∃ n : ℕ, f^[n] x = a}

def exceptionalSet (f : X → X) : Set X :=
  {a | (backwardOrbit f a).Finite}

theorem mem_backwardOrbit (f : X → X) (a x : X) :
    x ∈ backwardOrbit f a ↔ ∃ n : ℕ, f^[n] x = a := by
  sorry

theorem self_mem_backwardOrbit (f : X → X) (a : X) :
    a ∈ backwardOrbit f a := by
  sorry

theorem mem_exceptionalSet (f : X → X) (a : X) :
    a ∈ exceptionalSet f ↔ (backwardOrbit f a).Finite := by
  sorry

theorem backwardOrbit_conjugate (f : X → X) (h : X ≃ Y) (a : X) :
    backwardOrbit (fun y ↦ h (f (h.symm y))) (h a) = h '' backwardOrbit f a ∧
      exceptionalSet (fun y ↦ h (f (h.symm y))) = h '' exceptionalSet f := by
  sorry

theorem exceptional_iff_finite_grandOrbit (f : X → X) (hf : Surjective f) (a : X) :
    a ∈ exceptionalSet f ↔
      ({x : X | ∃ m n : ℕ, f^[m] x = f^[n] a} : Set X).Finite := by
  sorry

theorem exceptional_iterate (f : X → X)
    (hf : ∀ a : X, (f ⁻¹' {a}).Finite) (m : ℕ) (hm : 0 < m) :
    exceptionalSet (f^[m]) = exceptionalSet f := by
  sorry

-- Exceptional.identity
example : exceptionalSet (id : X → X) = Set.univ := by
  sorry

-- Exceptional.integerTranslation
example : exceptionalSet (fun n : ℤ ↦ n + 1) = ∅ := by
  sorry

-- Exceptional.powerSphere: its affine specialization is also required by the test.
example (d : ℕ) (hd : 2 ≤ d) :
    exceptionalSet (fun z : ℂ ↦ z ^ d) = {0} := by
  sorry

example (d : ℕ) (hd : 2 ≤ d) :
    exceptionalSet (fun z : OnePoint ℂ ↦
      match z with
      | none => none
      | some a => some (a ^ d)) =
        {OnePoint.some (0 : ℂ), OnePoint.infty} := by
  sorry

/- Exceptional.frobenius is a README test on the native algebraic projective
line: for z^(p^r), E is P¹(overline(F_p)). Its finite-field/algebraic-closure
embedding and rational-map comparison are not fabricated in this file. -/

/-! ArithmeticDynamics:DY.2/classical-fatou-julia -/

section Classical
variable [UniformSpace X] [UniformSpace Y]

def classicalFatou (f : X → X) : Set X :=
  {x | ∃ U : Set X, IsOpen U ∧ x ∈ U ∧
    UniformEquicontinuousOn (fun n : ℕ ↦ f^[n]) U}

def classicalJulia (f : X → X) : Set X := (classicalFatou f)ᶜ

theorem mem_classicalFatou (f : X → X) (x : X) :
    x ∈ classicalFatou f ↔ ∃ U : Set X, IsOpen U ∧ x ∈ U ∧
      UniformEquicontinuousOn (fun n : ℕ ↦ f^[n]) U := by
  sorry

theorem classicalJulia_eq_compl (f : X → X) :
    classicalJulia f = (classicalFatou f)ᶜ := by
  sorry

theorem isOpen_classicalFatou (f : X → X) : IsOpen (classicalFatou f) := by
  sorry

theorem isClosed_classicalJulia (f : X → X) : IsClosed (classicalJulia f) := by
  sorry

theorem classicalFatou_uniformConjugate (f : X → X) (h : X ≃ᵤ Y) :
    classicalFatou (fun y ↦ h (f (h.symm y))) = h '' classicalFatou f ∧
      classicalJulia (fun y ↦ h (f (h.symm y))) = h '' classicalJulia f := by
  sorry

-- ClassicalFatou.identity
example : classicalFatou (id : X → X) = Set.univ := by
  sorry

-- ClassicalFatou.constant
example (a : X) : classicalFatou (fun _ : X ↦ a) = Set.univ := by
  sorry

-- ClassicalJulia.realDoubling
example : classicalJulia (fun x : ℝ ↦ 2 * x) = Set.univ := by
  sorry

end Classical

section ComplexSphere
-- Local compatible compact uniformity; OnePoint K is never the Berkovich line.
noncomputable local instance : UniformSpace (OnePoint ℂ) := uniformSpaceOfCompactR1

-- ClassicalJulia.complexPower
example (d : ℕ) (hd : 2 ≤ d) :
    classicalJulia (fun z : OnePoint ℂ ↦
      match z with
      | none => none
      | some a => some (a ^ d)) =
        OnePoint.some '' {z : ℂ | ‖z‖ = 1} := by
  sorry

end ComplexSphere

/- classicalFatou_complex_normal is a README compatibility target: meromorphic
normality uses the true sphere chart and analytic-function comparison from
BelyiAnalyticCovers (specified in current BelyiMaps §8.1), and spherical Montel.
Neither a normal-family predicate nor its equivalence is assumed as a field. -/

/-! ArithmeticDynamics:DY.2/berkovich-fatou-julia:
the generic omission predicates are statable, their analytic specialization is not. -/

section Omission
variable [TopologicalSpace X] [TopologicalSpace Y]

def forwardSaturation (f : X → X) (U : Set X) : Set X :=
  {y | ∃ n : ℕ, ∃ x ∈ U, f^[n] x = y}

def omissionFatou (f : X → X) : Set X :=
  {x | ∃ U : Set X, IsOpen U ∧ x ∈ U ∧ (forwardSaturation f U)ᶜ.Infinite}

def omissionJulia (f : X → X) : Set X := (omissionFatou f)ᶜ

theorem mem_forwardSaturation (f : X → X) (U : Set X) (y : X) :
    y ∈ forwardSaturation f U ↔ ∃ n : ℕ, ∃ x ∈ U, f^[n] x = y := by
  sorry

theorem subset_forwardSaturation (f : X → X) (U : Set X) :
    U ⊆ forwardSaturation f U := by
  sorry

theorem forwardSaturation_mono (f : X → X) : Monotone (forwardSaturation f) := by
  sorry

theorem mem_omissionFatou (f : X → X) (x : X) :
    x ∈ omissionFatou f ↔ ∃ U : Set X, IsOpen U ∧ x ∈ U ∧
      (forwardSaturation f U)ᶜ.Infinite := by
  sorry

theorem omissionJulia_eq_compl (f : X → X) :
    omissionJulia f = (omissionFatou f)ᶜ := by
  sorry

theorem isOpen_omissionFatou (f : X → X) :
    IsOpen (omissionFatou f) ∧ IsClosed (omissionJulia f) := by
  sorry

theorem omissionFatou_homeomorph (f : X → X) (h : X ≃ₜ Y) :
    omissionFatou (fun y ↦ h (f (h.symm y))) = h '' omissionFatou f ∧
      omissionJulia (fun y ↦ h (f (h.symm y))) = h '' omissionJulia f := by
  sorry

-- OmissionFatou.finiteCarrier
example [Finite X] (f : X → X) : omissionFatou f = ∅ := by
  sorry

-- OmissionFatou.realIdentity
example : omissionFatou (id : ℝ → ℝ) = Set.univ := by
  sorry

-- OmissionFatou.integerTranslation
example : omissionFatou (fun n : ℤ ↦ n + 1) = Set.univ := by
  sorry

end Omission

/- berkovichJulia_carrier and BerkovichJulia.goodReduction are README targets
on TB.0's native seminorm carrier. In particular the omitted test is
J_I(z²)=∅, J_Ber(z²)={ζ_G}; no type-II point is added to OnePoint K. -/

/-! All other packet targets stay in the README with their exact hypotheses:
exceptional-classification; classical-fatou-julia-properties;
nonarchimedean-disc-criterion; nonarchimedean-periodic-dichotomy;
classical-julia-good-reduction; classical-julia-inseparable;
berkovich-fatou-julia-properties; berkovich-classical-trace;
berkovich-finite-grand-orbit; berkovich-julia-good-reduction;
berkovich-preimage-equidistribution; canonical-support-contained-julia;
berkovich-blowing-up-minimality; canonical-measure-julia-support;
berkovich-julia-iterate; berkovich-julia-singleton-dichotomy;
complex-repelling-periodic-density; complex-julia-blowing-up;
complex-transfer-limit; archimedean-measure-identification;
complex-bowen-net-bound; complex-topological-entropy;
complex-canonical-measure-entropy;
complex-maximal-entropy-uniqueness; power-map-julia-measure-comparison;
zieve-weighted-coefficient-divisibility; zieve-jet-growth;
zieve-rational-cycle-adapter.
The density target has an explicit open proof gap; the Berkovich iterate law
uses canonical-measure support after that comparison is established.
These need native rational/analytic maps, degree/multiplicity, valued-field
interfaces, measures or entropy suppliers. They are not expressed as theorems
about an opaque function carrying its desired conclusion as a hypothesis.
-/


end DY2

/-! DY.3. Explicit rational formulas and arithmetic endpoints on existing carriers.
The projective models, genus comparisons, rays and exact runtime carrier are
README contracts; no replacement geometric data is introduced. -/
section DY3


/-- Morton 1992, §2 (17)–(24), pp.354–355. -/
def mortonThreeCycleEquation (t u : ℚ) : ℚ :=
  (t ^ 2 - 1) * u ^ 3 + (t ^ 3 - 2 * t ^ 2 - 9 * t + 2) * u ^ 2 -
    9 * (t ^ 2 - 1) * u - (t ^ 3 - 2 * t ^ 2 - 9 * t + 2)

def mortonThreeCycleParameter (c x : ℚ) : ℚ := 1 + 2 * c + 2 * x + 2 * x ^ 2

def mortonThreeCycleInversePoint (t : ℚ) : ℚ :=
  (t ^ 3 + t ^ 2 - t + 7) / (4 * (t ^ 2 - 1))

def mortonThreeCycleInverseCoefficient (t : ℚ) : ℚ :=
  -(t ^ 6 - 2 * t ^ 5 + 11 * t ^ 4 + 20 * t ^ 3 + 23 * t ^ 2 - 18 * t + 29) /
    (16 * (t ^ 2 - 1) ^ 2)

def mortonThreeCycleRotation (t : ℚ) : ℚ := (t + 3) / (1 - t)

def mortonCycleTrace (t : ℚ) : ℚ := (t ^ 3 - 9 * t) / (t ^ 2 - 1)

/-- Coordinates are used only on the nonzero-denominator domain in the statements. -/
def mortonEllipticCoordinates (t u : ℚ) : ℚ × ℚ :=
  ((t + u + 2) / (t + u),
   (t * u * (t + u - 2) - (3 * (t + u) + 2)) / (t + u) ^ 2)

-- Basic API for the kept light definitions; no auxiliary proof development.
theorem mortonThreeCycleEquation_swap (t u : ℚ) :
    mortonThreeCycleEquation t u = mortonThreeCycleEquation u t := by sorry

theorem mortonThreeCycleEquation_symmetric (t u : ℚ) :
    mortonThreeCycleEquation t u =
      (t * u) ^ 2 * (t + u - 2) - t * u * (6 * (t + u) + 4) -
        ((t + u) ^ 3 - 2 * (t + u) ^ 2 - 9 * (t + u) + 2) := by sorry

theorem mortonThreeCycleParameter_inverse (t : ℚ) (ht : t ^ 2 ≠ 1) :
    mortonThreeCycleParameter (mortonThreeCycleInverseCoefficient t)
      (mortonThreeCycleInversePoint t) = t := by sorry

theorem mortonThreeCycleRotation_compatibility (c x : ℚ)
    (hx : Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) x = 3) :
    mortonThreeCycleParameter c (x ^ 2 + c) =
      mortonThreeCycleRotation (mortonThreeCycleParameter c x) := by sorry

theorem mortonCycleTrace_relation (t : ℚ) (ht : t ^ 2 ≠ 1) :
    mortonThreeCycleInverseCoefficient t =
      -(mortonCycleTrace t ^ 2 - 2 * mortonCycleTrace t + 29) / 16 := by sorry

theorem mortonCycleTrace_rotation (t : ℚ) (ht : t ^ 2 ≠ 1) :
    mortonCycleTrace (mortonThreeCycleRotation t) = mortonCycleTrace t := by sorry

-- Morton Lemma6, p.363. This is the affine equation, not a constructed elliptic carrier.
theorem mortonEllipticEquation (t u : ℚ)
    (hH : mortonThreeCycleEquation t u = 0) (hζ : t + u ≠ 0) :
    (mortonEllipticCoordinates t u).2 ^ 2 =
      4 * (mortonEllipticCoordinates t u).1 ^ 3 -
        11 * (mortonEllipticCoordinates t u).1 ^ 2 +
          8 * (mortonEllipticCoordinates t u).1 := by sorry

theorem mortonEllipticCoordinates_swap (t u : ℚ) :
    mortonEllipticCoordinates t u = mortonEllipticCoordinates u t := by sorry

theorem mortonElliptic_inverse (t u : ℚ) (hζ : t + u ≠ 0) (hζ2 : t + u ≠ 2) :
    t + u = 2 / ((mortonEllipticCoordinates t u).1 - 1) ∧
      t * u = ((t + u) ^ 2 * (mortonEllipticCoordinates t u).2 +
        3 * (t + u) + 2) / (t + u - 2) := by sorry

theorem mortonExceptionalCoordinates (t u : ℚ)
    (hH : mortonThreeCycleEquation t u = 0) (hζ : t + u = 0 ∨ t + u = 2) :
    (t = 1 ∧ u = -1) ∨ (t = -1 ∧ u = 1) ∨ (t = 1 ∧ u = 1) := by sorry

theorem mortonElliptic_fibre (t u t' u' : ℚ)
    (hζ : t + u ≠ 0) (hζ2 : t + u ≠ 2)
    (hζ' : t' + u' ≠ 0) (hζ2' : t' + u' ≠ 2)
    (h : mortonEllipticCoordinates t u = mortonEllipticCoordinates t' u') :
    (t = t' ∧ u = u') ∨ (t = u' ∧ u = t') := by sorry

theorem distinctCycles_mortonEquation (c x y : ℚ)
    (hx : Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) x = 3)
    (hy : Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) y = 3)
    (hxy : y ≠ x ∧ y ≠ x ^ 2 + c ∧ y ≠ (x ^ 2 + c) ^ 2 + c) :
    mortonThreeCycleEquation (mortonThreeCycleParameter c x)
      (mortonThreeCycleParameter c y) = 0 ∧
      (mortonThreeCycleParameter c x) ^ 2 ≠ 1 ∧
        (mortonThreeCycleParameter c y) ^ 2 ≠ 1 := by sorry

/-- ED.3's exact affine list is consumed with the actual equation and coordinates. -/
theorem mortonRationalAffinePoints
    (hE : ∀ X Y : ℚ, Y ^ 2 = 4 * X ^ 3 - 11 * X ^ 2 + 8 * X →
      (X = 0 ∧ Y = 0) ∨ (X = 1 ∧ (Y = 1 ∨ Y = -1)) ∨
        (X = 2 ∧ (Y = 2 ∨ Y = -2)))
    (t u : ℚ) (hH : mortonThreeCycleEquation t u = 0) :
    (t = -1 ∨ t = 1) ∧ (u = -1 ∨ u = 1) := by sorry

/-- Morton Theorem3, p.346: every two exact rational period3 points share one cycle. -/
theorem atMostOneRationalThreeCycle (c x y : ℚ)
    (hx : Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) x = 3)
    (hy : Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) y = 3) :
    y = x ∨ y = x ^ 2 + c ∨ y = (x ^ 2 + c) ^ 2 + c := by sorry

-- Numeric abbreviations for the genus formula; no geometric genus carrier is fabricated.
noncomputable def quadraticNu (n : ℕ) : ℚ :=
  (∑ e ∈ n.divisors, (ArithmeticFunction.moebius (n / e) : ℚ) * 2 ^ e) / 2

noncomputable def quadraticEvenCorrection (n : ℕ) : ℚ :=
  (∑ r ∈ n.divisors.filter (fun r => Even r ∧ Odd (n / r)),
    (ArithmeticFunction.moebius (n / r) : ℚ) * 2 ^ (r / 2)) / (4 * n)

noncomputable def quadraticGenusOneExpression (n : ℕ) : ℚ :=
  1 + ((n : ℚ) - 3) * quadraticNu n / 2 -
    (∑ e ∈ n.divisors.filter (fun e => e < n),
      (e : ℚ) * quadraticNu e * Nat.totient (n / e)) / 2

noncomputable def quadraticGenusZeroExpression (n : ℕ) : ℚ :=
  1 + (1 / 2 - 3 / (2 * (n : ℚ))) * quadraticNu n -
    (∑ e ∈ n.divisors.filter (fun e => e < n),
      quadraticNu e * Nat.totient (n / e)) / 2 - quadraticEvenCorrection n

-- The formula-to-geometric-genus equalities are README targets on imported curve models.
example : quadraticGenusOneExpression 4 = 2 := by sorry
example : quadraticGenusZeroExpression 5 = 2 := by sorry
example : quadraticGenusZeroExpression 6 = 4 := by sorry

-- Field-degree normalization of the native pinned height, on affine representatives.
-- An absolute bound B (Mathlib height divided by [K:ℚ]) needs the radius exp([K:ℚ]·B).
theorem relativeHeightCandidateBound (K : Type*) [Field K] [NumberField K]
    (x : K) (B D : ℝ)
    (hB : Height.logHeight₁ x / (Module.finrank ℚ K : ℝ) ≤ B)
    (hD : Real.exp ((Module.finrank ℚ K : ℝ) * B) ≤ D) :
    Height.mulHeight₁ x ≤ D := by sorry

-- The inherited preperiodic bound is already native: no factor [K:ℚ] enters its radius.
theorem nativeHeightCandidateBound (K : Type*) [Field K] [NumberField K]
    (x : K) (B D : ℝ) (hB : Height.logHeight₁ x ≤ B) (hD : Real.exp B ≤ D) :
    Height.mulHeight₁ x ≤ D := by sorry

-- Unit tests of `morton-symmetric-three-cycle-curve` (packet names).
theorem morton_symmetric_three_cycle_curve_1 :
    mortonThreeCycleEquation 1 1 = 0 ∧ mortonThreeCycleEquation 1 (-1) = 0 ∧
      mortonThreeCycleEquation (-1) 1 = 0 ∧ mortonThreeCycleEquation (-1) (-1) = 0 := by
  norm_num [mortonThreeCycleEquation]

theorem morton_symmetric_three_cycle_curve_2 : mortonThreeCycleEquation 0 0 = -2 := by
  norm_num [mortonThreeCycleEquation]

/-- The cycle `5/4 ↦ -1/4 ↦ -7/4` of `z² - 29/16` has Morton coordinates `3, -3, 0`, all of
trace `η = 0`. -/
theorem morton_symmetric_three_cycle_curve_3 :
    mortonThreeCycleParameter (-29 / 16) (5 / 4) = 3 ∧
      mortonThreeCycleParameter (-29 / 16) (-1 / 4) = -3 ∧
      mortonThreeCycleParameter (-29 / 16) (-7 / 4) = 0 ∧
      mortonCycleTrace 3 = 0 ∧ mortonCycleTrace (-3) = 0 ∧ mortonCycleTrace 0 = 0 := by
  norm_num [mortonThreeCycleParameter, mortonCycleTrace]

-- Unit tests of `morton-elliptic-quotient-map` (packet names).
theorem morton_elliptic_quotient_map_1 : mortonEllipticCoordinates (-1) (-1) = (0, 0) := by
  norm_num [mortonEllipticCoordinates]

/-- `(1, -1)` lies on `H = 0` with `ζ = 0`, outside the affine domain. Lean's totalized division
sends it to `(0, 0)`, the genuine image of `(-1, -1)`: the guard `ζ ≠ 0` cannot be dropped. -/
theorem morton_elliptic_quotient_map_2 :
    mortonThreeCycleEquation 1 (-1) = 0 ∧ (1 : ℚ) + (-1) = 0 ∧
      mortonEllipticCoordinates 1 (-1) = mortonEllipticCoordinates (-1) (-1) := by
  norm_num [mortonThreeCycleEquation, mortonEllipticCoordinates]

theorem morton_elliptic_quotient_map_3 :
    (0 : ℚ) + 0 = 0 ∧ mortonThreeCycleEquation 0 0 ≠ 0 := by
  norm_num [mortonThreeCycleEquation]


end DY3

/-! DY.4. Adelic measures, metrics, pairings and the equidistribution endpoints
need the local analytic and global geometric carriers listed in the README.
They are not replaced here by records whose fields assume the target theorems. -/

/-! DY.5. A polynomial discriminant milestone on native polynomial carriers.
Rooted trees, compatible actions and the full arboreal representation remain
README targets, with their source hypotheses and discriminating examples. -/
section DY5
universe u v
/-- The discriminant recursion for iterates (Aitken–Hajir–Maire, corrected for a non-monic `f`):
for `f` of degree `d` with leading coefficient `a`, `d ≠ 0` in `K`, and the multiset `R` of
roots of `f'` in an algebraically closed `L`. -/
theorem discr_iterate_sub_succ {K : Type u} [Field K] (f : K[X]) (hd : (f.natDegree : K) ≠ 0)
    (α : K) (n : ℕ) {L : Type v} [Field L] [Algebra K L] [IsAlgClosed L] :
    algebraMap K L (f.comp^[n + 1] X - C α).discr =
      algebraMap K L ((-1) ^ (f.natDegree * (f.natDegree - 1) / 2) * (f.natDegree : K) ^ f.natDegree
          * f.leadingCoeff ^ (f.natDegree - 1)) ^ (f.natDegree ^ n) *
        algebraMap K L f.leadingCoeff ^ ((f.natDegree ^ n - 1) * (f.natDegree ^ (n + 1) + 1)) *
        algebraMap K L (f.comp^[n] X - C α).discr ^ f.natDegree *
        (((derivative f).map (algebraMap K L)).roots.map
          (fun r => aeval r (f.comp^[n + 1] X - C α))).prod := sorry


end DY5

/-! DY.6. Finite unions of progressions and the reviewed field/iterate milestones.
Lech's marked-family and denominator conventions are preserved. Hybrid spaces,
Lattes quotient classifications and generic-family geometry remain README targets. -/
section DY6
/-- `DY.6/finite-union-of-arithmetic-progressions`. -/
def IsFiniteUnionAP (S : Set ℕ) : Prop :=
  ∃ A : Finset (ℕ × ℕ), S = ⋃ ab ∈ A, Set.range fun k : ℕ => ab.1 * k + ab.2

theorem isFiniteUnionAP_iff_eventually_periodic (S : Set ℕ) :
    IsFiniteUnionAP S ↔ ∃ N p : ℕ, 0 < p ∧ ∀ n ≥ N, (n ∈ S ↔ n + p ∈ S) := sorry

theorem IsFiniteUnionAP.union {S T : Set ℕ} (hS : IsFiniteUnionAP S) (hT : IsFiniteUnionAP T) :
    IsFiniteUnionAP (S ∪ T) := sorry

theorem IsFiniteUnionAP.inter {S T : Set ℕ} (hS : IsFiniteUnionAP S) (hT : IsFiniteUnionAP T) :
    IsFiniteUnionAP (S ∩ T) := sorry

theorem IsFiniteUnionAP.compl {S : Set ℕ} (hS : IsFiniteUnionAP S) : IsFiniteUnionAP Sᶜ := sorry

theorem Set.Finite.isFiniteUnionAP {S : Set ℕ} (hS : S.Finite) : IsFiniteUnionAP S := sorry

theorem IsFiniteUnionAP.exists_infinite_ap {S : Set ℕ} (hS : IsFiniteUnionAP S) (hinf : S.Infinite) :
    ∃ a b : ℕ, 1 ≤ a ∧ ∀ k : ℕ, a * k + b ∈ S := sorry

theorem isFiniteUnionAP_preimage_affine (S : Set ℕ) (N : ℕ) (hN : 1 ≤ N) :
    IsFiniteUnionAP S ↔ ∀ j < N, IsFiniteUnionAP {k : ℕ | N * k + j ∈ S} := sorry

/-- Unit test `isFiniteUnionAP_evens_union`: `{1} ∪ 2ℕ` is a finite union of arithmetic
progressions. -/
example : IsFiniteUnionAP ({1} ∪ {n | Even n}) := sorry

/-- Unit test `isFiniteUnionAP_empty_univ`: `∅`, finite sets and `ℕ` qualify. -/
example : IsFiniteUnionAP ∅ ∧ IsFiniteUnionAP Set.univ ∧ IsFiniteUnionAP {3, 7} := sorry

/-- Unit test `isFiniteUnionAP_iff_eventuallyPeriodic`: equivalence with eventual periodicity. -/
example (S : Set ℕ) :
    IsFiniteUnionAP S ↔ ∃ N p : ℕ, 0 < p ∧ ∀ n ≥ N, (n ∈ S ↔ n + p ∈ S) :=
  isFiniteUnionAP_iff_eventually_periodic S

/-- Unit test `not_isFiniteUnionAP_powers`: the powers of `p ≥ 2` are not a finite union of
arithmetic progressions. -/
example (p : ℕ) (hp : 2 ≤ p) : ¬ IsFiniteUnionAP (Set.range fun k : ℕ => p ^ k) := sorry



open Polynomial

/-! Integral presentation: the coefficient denominator lies in Z[T], and the
marked family is independent of a field-generating family. The existential
fraction-field embedding gives L its scalar structure inside the statement;
no new presentation carrier or data-valued placeholder is introduced. -/

/-- followup-integral-primitive-presentation, including a common denominator. -/
theorem integralPrimitivePresentation (L : Type*) [Field L] [Algebra ℚ L]
    [Algebra.EssFiniteType ℚ L] {I : Type*} [Finite I] (s : I → L) :
    ∃ (n : ℕ) (t : Fin n → L)
      (e : FractionRing (MvPolynomial (Fin n) ℤ) →+* L),
      AlgebraicIndependent ℚ t ∧
      (∀ a : MvPolynomial (Fin n) ℤ,
        e (algebraMap _ (FractionRing (MvPolynomial (Fin n) ℤ)) a) =
          MvPolynomial.eval₂ (Int.castRingHom L) t a) ∧
      (letI := e.toAlgebra
       ∃ (y : L) (H : Polynomial (MvPolynomial (Fin n) ℤ))
         (c : FractionRing (MvPolynomial (Fin n) ℤ)),
         c ≠ 0 ∧
         IntermediateField.adjoin (FractionRing (MvPolynomial (Fin n) ℤ)) {y} = ⊤ ∧
         0 < H.natDegree ∧
         H.map (algebraMap _ (FractionRing (MvPolynomial (Fin n) ℤ))) =
           C c * minpoly (FractionRing (MvPolynomial (Fin n) ℤ)) y ∧
         Irreducible (H.map (algebraMap _ (FractionRing (MvPolynomial (Fin n) ℤ)))) ∧
         (H.map (algebraMap _ (FractionRing (MvPolynomial (Fin n) ℤ)))).Separable ∧
         H.eval₂ (MvPolynomial.eval₂Hom (Int.castRingHom L) t) y = 0 ∧
         ∃ (U : I → Polynomial (MvPolynomial (Fin n) ℤ))
           (V : MvPolynomial (Fin n) ℤ),
           V ≠ 0 ∧ ∀ i,
             (U i).degree < H.degree ∧
             s i = (U i).eval₂ (MvPolynomial.eval₂Hom (Int.castRingHom L) t) y /
               MvPolynomial.eval₂ (Int.castRingHom L) t V) := sorry

/-- followup-primitive-root-transport. The root equation is over the embedded
parameter field, without an irreducibility assumption over the target field. -/
theorem primitiveRootTransport (F L E : Type*) [Field F] [Field L] [Field E]
    [Algebra F L] (y : L) (hy : IsIntegral F y)
    (hgen : IntermediateField.adjoin F {y} = ⊤)
    (e : F →+* E) (η : E) (hη : (minpoly F y).eval₂ e η = 0) :
    ∃! σ : L →+* E, (∀ a : F, σ (algebraMap F L a) = e a) ∧ σ y = η := sorry

/-- The marked-expression evaluation identity is an API consequence of the
whole-field embedding, with a denominator in the parameter ring. -/
theorem markedExpression_transport {A L E : Type*} [CommRing A] [Field L] [Field E]
    (j : A →+* L) (e : A →+* E) (σ : L →+* E)
    (hσ : ∀ a, σ (j a) = e a) (y x : L) (η : E) (hy : σ y = η)
    (U : Polynomial A) (V : A) (hV : j V ≠ 0)
    (hx : x = U.eval₂ j y / j V) :
    σ x = U.eval₂ e η / e V ∧ e V ≠ 0 := sorry

/-- followup-lech-integral-assembly. This is a verification adapter for the
inherited endpoint, not a second atlas node for Lech's theorem. -/
theorem lechIntegralAssembly (L : Type*) [Field L] [Algebra ℚ L]
    [Algebra.EssFiniteType ℚ L] (s : Finset L) (N : ℕ) :
    ∃ p : ℕ, N < p ∧ ∃ _ : Fact p.Prime, ∃ σ : L →+* ℚ_[p],
      ∀ x ∈ s, ‖σ x‖ ≤ 1 := sorry

/-! Discriminating presentation tests. These test the denominator convention
and degenerate fields, rather than manufacturing a private model of a field. -/

/-- The zero-parameter case represents 1/6 with an integral denominator. -/
example : (C (1 : ℤ)).eval₂ (Int.castRingHom ℚ) 0 / (6 : ℚ) = 1 / 6 := sorry

/-- Degree one includes the trivial algebraic extension. -/
example : (X : Polynomial ℤ).natDegree = 1 ∧
    (X : Polynomial ℤ).eval₂ (Int.castRingHom ℚ) 0 = 0 := sorry

/-- Zero marks require no invertibility assumption on the mark. -/
example (L : Type*) [Field L] (y : L) :
    (0 : Polynomial ℤ).eval₂ (Int.castRingHom L) y / (1 : L) = 0 := sorry

/-- In a quadratic extension, the inverse can have a parameter-only denominator. -/
example {L : Type*} [Field L] (t y : L) (hy : y ^ 2 = t)
    (hden : t ^ 2 - t ≠ 0) :
    (y + t)⁻¹ = (t - y) / (t ^ 2 - t) := sorry

/-- Injectivity of the parameter evaluation is essential for fraction transport. -/
example (e : RatFunc ℚ →+* ℚ) :
    e (algebraMap ℚ[X] (RatFunc ℚ) X) ≠ 0 := sorry

/-! Other follow-up end statements statable at the pins. The reader document
states all hypotheses of the remaining targets; no height, torus quotient or
hybrid-measure carrier is replaced by an abstract proposition here. -/

/-- followup-ritt-common-iterate. The iterate is composition, and the support
condition explicitly handles s=0 as the monomial case. -/
theorem rittCommonIterate (F G : Polynomial ℂ) (hd : 1 < F.natDegree)
    (n : ℕ) (hn : 0 < n) :
    (fun z : ℂ => F.eval z)^[n] = (fun z : ℂ => G.eval z)^[n] ↔
      ∃ (β γ : ℂ) (H : Polynomial ℂ) (r s : ℕ),
        γ ≠ 0 ∧
        (∀ k, H.coeff k ≠ 0 → ∃ m : ℕ, k = r + s * m) ∧
        F = C (-β) + C γ * H.comp (X + C β) ∧
        G = C (-β) + H.comp (X + C β) ∧
        γ ^ s = 1 ∧ γ ^ (∑ k ∈ Finset.range n, F.natDegree ^ k) = 1 := sorry

/-- The order-one iterate has no root-of-unity ambiguity. -/
example (F G : Polynomial ℂ) :
    (fun z : ℂ => F.eval z)^[1] = (fun z : ℂ => G.eval z)^[1] ↔ F = G := sorry

/-- Odd degree admits a nontrivial equal-iterate pair. -/
example : (fun z : ℂ => -(z ^ 3))^[2] = (fun z : ℂ => z ^ 3)^[2] := sorry

/-- Even degree with multiplier -1 does not satisfy the same condition. -/
example (n : ℕ) (hn : 0 < n) :
    (fun z : ℂ => -(z ^ 2))^[n] ≠ (fun z : ℂ => z ^ 2)^[n] := sorry

/-- The complex specialization of followup-linear-synchronized-intersection.
The reader states the characteristic-zero form and its field reduction. -/
theorem linearSynchronizedIntersection (a b c e x₀ y₀ : ℂ)
    (ha : a ≠ 0) (hc : c ≠ 0)
    (hcommon : Set.Infinite {z : ℂ | ∃ n : ℕ,
      (fun w => a * w + b)^[n] x₀ = z ∧ (fun w => c * w + e)^[n] y₀ = z}) :
    ∃ m : ℕ, 0 < m ∧
      (fun w : ℂ => a * w + b)^[m] = (fun w : ℂ => c * w + e)^[m] := sorry


end DY6

end TauCeti.ArithmeticDynamics
