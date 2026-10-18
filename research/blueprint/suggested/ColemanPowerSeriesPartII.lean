/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.Span.Defs
import TauCeti.AlgebraicGeometry.EllipticCurve.FormalGroup.Point.Range

/-!
# Suggested signatures: signed anticyclotomic local units

This file is not the roadmap and is not exhaustive. The roadmap document is definitive:
it carries every target, hypothesis, source locator, API and discriminating unit test.
These statements suggest Lean forms so contributors and reviewers converge on names
and signatures. Elaboration does not constitute implementation of any roadmap target.

Only light definitions over existing pinned carriers occur here. `coatesWilesAtZero`
is the coefficient expression in AU.1/coates-wiles, before the future Coleman map.
The two kernel definitions are the algebraic part of AU.3/signed-units for a given
conductor-indexed derivative family. They do not replace the missing character,
tower or local-unit carriers. `augmentation_unit_generation` is the conditional
algebraic milestone of AU.9 after AU.8 has identified the free quotient with Λ.
The complete Rubin theorem and Wiles reciprocity are README targets since their
actual carriers are not at the pins. They are not encoded as assumed Prop fields.

The formal-point examples reuse the actual pinned Dedekind-completion homomorphism.
The README supplies the chosen ring-class completion presentations before using it.
The p ≥ 5, unramified quadratic, π = -p and conductor-sign conventions are fixed there.
-/

noncomputable section

namespace ColemanPowerSeriesPartII

section DerivativeAtZero

variable {R : Type*} [CommRing R]

/-- The constant logarithmic derivative of a unit series. AU.1/coates-wiles. -/
def coatesWilesAtZero (u : (PowerSeries R)ˣ) : R :=
  (u : PowerSeries R).coeff 1 * (↑u⁻¹ : PowerSeries R).constantCoeff

/-- Logarithmic differentiation turns multiplication into addition. -/
theorem coatesWilesAtZero_mul (u v : (PowerSeries R)ˣ) :
    coatesWilesAtZero (u * v) = coatesWilesAtZero u + coatesWilesAtZero v := by
  sorry

/-- Agreement with the existing formal derivative at the origin. -/
theorem coatesWilesAtZero_derivative (u : (PowerSeries R)ˣ) :
    coatesWilesAtZero u =
      (PowerSeries.derivative R (u : PowerSeries R) * (↑u⁻¹ : PowerSeries R)).constantCoeff := by
  sorry

example : coatesWilesAtZero (1 : (PowerSeries ℚ)ˣ) = 0 := by
  sorry

example (a : ℚˣ) :
    coatesWilesAtZero (Units.map (PowerSeries.C : ℚ →+* PowerSeries ℚ).toMonoidHom a) = 0 := by
  sorry

/-- A nonconstant test: a unit with coefficients 1,1 has derivative 1 at zero. -/
example (u : (PowerSeries ℚ)ˣ)
    (h₀ : (u : PowerSeries ℚ).constantCoeff = 1)
    (h₁ : (u : PowerSeries ℚ).coeff 1 = 1) :
    coatesWilesAtZero u = 1 := by
  sorry

end DerivativeAtZero

section SignedKernels

variable {R M N ι : Type*} [CommRing R]
  [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]

/-- Plus units kill odd conductor exponents, not even ones. AU.3/signed-units. -/
def plusDerivativeKernel (c : ι → ℕ) (δ : ι → M →ₗ[R] N) : Submodule R M :=
  ⨅ (χ : ι) (_ : Odd (c χ)), (δ χ).ker

/-- Minus units kill even conductor exponents, including zero. AU.3/signed-units. -/
def minusDerivativeKernel (c : ι → ℕ) (δ : ι → M →ₗ[R] N) : Submodule R M :=
  ⨅ (χ : ι) (_ : Even (c χ)), (δ χ).ker

theorem mem_plusDerivativeKernel (c : ι → ℕ) (δ : ι → M →ₗ[R] N) (x : M) :
    x ∈ plusDerivativeKernel c δ ↔ ∀ χ, Odd (c χ) → δ χ x = 0 := by
  sorry

theorem mem_minusDerivativeKernel (c : ι → ℕ) (δ : ι → M →ₗ[R] N) (x : M) :
    x ∈ minusDerivativeKernel c δ ↔ ∀ χ, Even (c χ) → δ χ x = 0 := by
  sorry

example : plusDerivativeKernel (fun _ : Unit ↦ 0)
    (fun _ ↦ (0 : ℚ →ₗ[ℚ] ℚ)) = ⊤ := by
  sorry

/-- The trivial character imposes no plus-unit equation. -/
example : plusDerivativeKernel (fun _ : Unit ↦ 0)
    (fun _ ↦ (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) = ⊤ := by
  sorry

/-- A conductor-three equation is imposed on plus units. -/
example : plusDerivativeKernel (fun _ : Unit ↦ 3)
    (fun _ ↦ (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) = ⊥ := by
  sorry

example : minusDerivativeKernel (fun _ : Unit ↦ 0)
    (fun _ ↦ (0 : ℚ →ₗ[ℚ] ℚ)) = ⊤ := by
  sorry

/-- The trivial character does impose a minus-unit equation. -/
example : minusDerivativeKernel (fun _ : Unit ↦ 0)
    (fun _ ↦ (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) = ⊥ := by
  sorry

example : minusDerivativeKernel (fun _ : Unit ↦ 3)
    (fun _ ↦ (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) = ⊤ := by
  sorry

end SignedKernels

section AugmentationMilestone

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module (PowerSeries R) M]

/-- Once the minus quotient is identified with Λ, a plus element whose augmentation
is a unit generates that quotient integrally. AU.9/augmentation-unit-generation.
Here q is that quotient coordinate, not an assumed direct-sum decomposition. -/
theorem augmentation_unit_generation
    (q : M →ₗ[PowerSeries R] PowerSeries R) (P : Submodule (PowerSeries R) M)
    (hP : Disjoint P q.ker) (x : M) (hx : x ∈ P)
    (hu : IsUnit ((q x).constantCoeff)) :
    IsCompl P q.ker ∧ P = Submodule.span (PowerSeries R) {x} := by
  sorry

end AugmentationMilestone

section GeneratorMilestone

variable {A K M : Type*} [CommRing A] [Field K] [AddCommGroup M] [Module A M]

/-- The scalar-evaluation part of AU.9/generator-nonvanishing. The README first proves
that the actual δχ is nonzero on the matching sign, using the full Kummer pairing. -/
theorem generator_derivative_nonzero (ev : A →+* K) (δ : M →ₛₗ[ev] K)
    (v : M) (hv : Submodule.span A {v} = ⊤) (hδ : δ ≠ 0) : δ v ≠ 0 := by
  sorry

end GeneratorMilestone

section ExistingCompletionMap

open IsDedekindDomain Classical

variable {A K : Type*} [CommRing A] [IsDedekindDomain A]
  [Field K] [Algebra A K] [IsFractionRing A K]
  (v : HeightOneSpectrum A)
  (E : WeierstrassCurve (v.adicCompletionIntegers K))
  [(E.baseChange (v.adicCompletion K)).IsElliptic]

local instance : IsLinearTopology (v.adicCompletionIntegers K)
    (v.adicCompletionIntegers K) :=
  v.isAdic_maximalIdeal_adicCompletionIntegers (K := K) ▸
    Ideal.isLinearTopology (IsLocalRing.maximalIdeal (v.adicCompletionIntegers K))

local instance : Fact (IsAdic (IsLocalRing.maximalIdeal (v.adicCompletionIntegers K))) :=
  ⟨v.isAdic_maximalIdeal_adicCompletionIntegers (K := K)⟩

/-- AU.6 transports the chosen fields to exactly this existing carrier. -/
example (P Q : WeierstrassCurve.FormalGroupPoint E
    (IsLocalRing.maximalIdeal (v.adicCompletionIntegers K))) :
    E.formalPointHomAdicCompletion v (P + Q) =
      E.formalPointHomAdicCompletion v P + E.formalPointHomAdicCompletion v Q := by
  sorry

example : Function.Injective (E.formalPointHomAdicCompletion v) := by
  sorry

end ExistingCompletionMap

end ColemanPowerSeriesPartII
