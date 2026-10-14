import Mathlib.Logic.Function.Iterate
import Mathlib.Topology.UniformSpace.Equicontinuity
import Mathlib.Topology.UniformSpace.Equiv
import Mathlib.Topology.UniformSpace.OfCompactT2
import Mathlib.Topology.Compactification.OnePoint.ProjectiveLine
import Mathlib.Analysis.Complex.Basic

/-!
This file is not the roadmap and is not exhaustive. The accompanying README is
definitive. These statements suggest Lean names and signatures so contributors
and reviewers can converge on them. Proofs are not implementations.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Only light predicates on existing carriers and their abstract API are declared.
The genuine Berkovich analytic line, rational-map carrier, sphere Laplacian and
Kolmogorov–Sinai entropy have no typed replacement here. Their exact targets,
hypotheses, tests and supplier boundaries are in the README. No placeholder
structures, assumed conclusions or data definitions with missing bodies occur.
-/

open Set Function

namespace TauCeti.ArithmeticDynamics

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

end TauCeti.ArithmeticDynamics
