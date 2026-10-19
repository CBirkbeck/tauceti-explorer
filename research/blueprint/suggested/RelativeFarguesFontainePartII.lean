import Mathlib.RingTheory.Bezout
import Mathlib.RingTheory.Perfectoid.BDeRham
import Mathlib.Analysis.Normed.Operator.Banach
import Mathlib.Analysis.Normed.Algebra.Basic
import TauCeti.AlgebraicGeometry.WeilDivisor.Basic

/-!
# Relative Fargues–Fontaine function theory, Part II

This file is not the roadmap and is not exhaustive. The companion reader document is
definitive. These statements suggest Lean forms so that contributors and reviewers
converge on names and signatures. They claim no implementation.

This compact file uses only carriers present at Tau Ceti f790474 and Mathlib 082e2d3.
The ramified Witt, interval-ring, primitive-point, interval-bundle and general-field
curve carriers are README targets supplied by the roadmaps named there. In particular,
none is replaced here by an abstract field, an empty type, or a proposition standing
for its missing data. Their full definitions, APIs and discriminating tests are in the
reader document, rather than an artificial development before the end statements.

The two new milestones below are the generic degree argument used at HF7 and the
corrected Banach factorization statement used at HF9. The examples check compatibility
with existing finite divisors, p-typical theta and the norm-bounded section interface.
-/

namespace TauCeti.RelativeFarguesFontainePartII

/-! ## HF7: the degree argument for a geometric Be chart

FF17 Préface note 8, p. 3. Nonnegativity is encoded by the natural-number codomain.
No assertion about the degree of zero is required. Applied to Be this uses the
separately planned fact that its units are exactly Eˣ. It does not assert principality
of the general-field Dedekind chart, whose ideal class group can be nontrivial.
-/

theorem isPrincipalIdealRing_of_multiplicative_degree
    {R : Type*} [CommRing R] [IsDomain R] [IsBezout R]
    (degree : R → ℕ)
    (degree_mul : ∀ a b, a ≠ 0 → b ≠ 0 → degree (a * b) = degree a + degree b)
    (degree_zero_iff : ∀ a, a ≠ 0 → (degree a = 0 ↔ IsUnit a)) :
    IsPrincipalIdealRing R := by
  sorry

/-! ## HF9: local matrix factorization

FF17 Lemmas 11.2.10–11.2.11, pp. 372–373, with the conjugated tangent map assumed
surjective. The ambient algebra can itself be a matrix algebra. The neighborhood
may depend on Z. This statement does not fill the moving-neighborhood gap G-MATRIX
in the subsequent interval-gluing application.
-/

section Factorization

variable {𝕜 A : Type*} [NontriviallyNormedField 𝕜] [CompleteSpace 𝕜]
    [NormedRing A] [NormedAlgebra 𝕜 A] [CompleteSpace A]
    (B₁ B₂ : Subalgebra 𝕜 A) [CompleteSpace B₁] [CompleteSpace B₂]

theorem exists_factorization_near_one
    (Z : Aˣ) (tangent : (B₁ × B₂) →L[𝕜] A)
    (tangent_apply : ∀ x, tangent x = (x.1 : A) + (Z : A) * (x.2 : A) * (↑(Z⁻¹) : A))
    (tangent_surjective : Function.Surjective tangent) :
    ∃ ε : ℝ, 0 < ε ∧ ∀ a : A, ‖a - 1‖ < ε →
      ∃ u : B₁, ∃ v : B₂, IsUnit u ∧ IsUnit v ∧
        a = (u : A) * (Z : A) * (v : A) * (↑(Z⁻¹) : A) := by
  sorry

end Factorization

/-! ## HF3/HF6: finite-divisor carrier comparisons

The locally finite refinement on annuli and the finite Frobenius-orbit point type
are README definitions. Once the latter type and its degree weight exist, the finite
sum and point-divisor operations below are the existing WeilDivisor API, not new
constructions. Weights are primitive degrees, not dimensions of residue fields over E.
-/

open AlgebraicGeometry AlgebraicGeometry.WeilDivisor

example {X : Type*} (w : X → ℤ) (x : X) :
    weightedDegree w (ofPoint x) = w x := by
  sorry

example {X : Type*} (w : X → ℤ) :
    weightedDegree w (0 : WeilDivisor X) = 0 := by
  sorry

example : weightedDegree (fun b : Bool => if b then (3 : ℤ) else 2)
    (ofPoint true + ofPoint false) = 5 := by
  sorry

/-! ## HF2: the existing p-typical Fontaine map

The ramified Q-compatible construction must specialize to these declarations.
BDeRhamPlus already exists as a completion after inverting p; it is not redefined.
-/

section FontaineComparison

variable (R : Type*) [CommRing R] (p : ℕ) [Fact p.Prime]
    [Fact ¬IsUnit (p : R)] [IsAdicComplete (Ideal.span {(p : R)}) R]

example (x : PreTilt R p) :
    WittVector.fontaineTheta R p (WittVector.teichmuller p x) = x.untilt := by
  sorry

example (hF : Function.Surjective (frobenius (ModP R p) p)) :
    Function.Surjective (WittVector.fontaineTheta R p) := by
  sorry

example : (0 : BDeRhamPlus R p) + 1 = 1 := by
  sorry

end FontaineComparison

/-! ## HF9: the existing nonlinear section suffices

A bounded nonlinear section is enough for the quadratic correction argument.
There is no assumption that this section is continuous or linear.
-/

section BoundedSection

variable {𝕜 V W : Type*} [NontriviallyNormedField 𝕜]
    [NormedAddCommGroup V] [NormedSpace 𝕜 V]
    [NormedAddCommGroup W] [NormedSpace 𝕜 W]
    (f : V →L[𝕜] W)

example (s : ContinuousLinearMap.NonlinearRightInverse f) (y : W) : f (s y) = y := by
  sorry

example (s : ContinuousLinearMap.NonlinearRightInverse f) (y : W) :
    ‖s y‖ ≤ s.nnnorm * ‖y‖ := by
  sorry

end BoundedSection

end TauCeti.RelativeFarguesFontainePartII
