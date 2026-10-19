/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Claude (Anthropic), session claude-5sHW61; independent review by Codex, session codex-zwwmND
-/
import Mathlib.RepresentationTheory.Invariants
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.Algebra.GroupWithZero.Associated
import Mathlib.Data.ZMod.Basic

/-!
# Main conjectures for modular forms and their families: suggested forms

This file is not the roadmap and is not exhaustive. The roadmap document
(`research/blueprint/readmes/ModularIwasawaMainConjectures.md`) is definitive; the statements
below suggest Lean forms so that contributors and reviewers converge on names and signatures.
Nothing here claims an implementation.

Pins: Mathlib `082e2d3`, Tau Ceti `f790474`.

At these pins neither library has Galois cohomology of number fields with local conditions,
Iwasawa cohomology, characteristic ideals of `Λ`-modules, modular Galois representations,
p-adic L-functions or the Tate curve. The ordinary, cohomological and signed main conjectures,
the Selmer groups, the fundamental line, the p-adic L-functions and every arithmetic theorem
of the roadmap are therefore README targets, not declarations here. What is statable now:

* the residual hypotheses of the main theorems (`ModularIwasawaMainConjectures:L1/residual-hypothesis-predicates`),
  as predicates on a representation over a field restricted to decomposition and inertia subgroups;
* the rank-one quotient lemma (`L1/unipotent-rank-one-quotient`) for a unipotent endomorphism of `O²`;
* the algebraic core of the μ/λ comparison (`L5/mu-lambda-comparison`) in `O⟦X⟧`;
* small decidable checks of the worked examples.
-/

namespace ModularIwasawaMainConjectures

open Module

section ResidualHypotheses

variable {F G W : Type*} [Field F] [Group G] [AddCommGroup W] [Module F W]

/-- `(SU_q)`: the representation is ramified at the place whose inertia group is `I`,
i.e. some element of `I` acts nontrivially. The arithmetic condition `q ∥ N` is a separate
hypothesis on the level. -/
def IsRamifiedAt (ρ : Representation F G W) (I : Subgroup G) : Prop :=
  ∃ g ∈ I, ρ g ≠ LinearMap.id

/-- `(FW1.6_ℓ)` in Fouquet–Wan's cohomological normalisation: the inertia invariants form a
line and the decomposition-group invariants vanish. -/
def FWAuxiliaryCondition (ρ : Representation F G W) (D I : Subgroup G) : Prop :=
  finrank F (Representation.invariants (ρ.comp I.subtype)) = 1 ∧
    finrank F (Representation.invariants (ρ.comp D.subtype)) = 0

/-- `(dist)` for the characters of an ordinary filtration; in the reducible case it is also
Fouquet–Wan's scalar exclusion `(ρ̄|D_p)^ss ≠ χ̄ ⊕ χ̄`. -/
def DistinctCharacters {H : Type*} [Group H] (χ₁ χ₂ : H →* Fˣ) : Prop :=
  χ₁ ≠ χ₂

/-- `(LocExc_p)` for a reducible local representation with Jordan–Hölder characters `χ₁, χ₂`:
the pair is not `{χ, χ ω}` for the mod-`p` cyclotomic character `ω`. -/
def LocalExclusion {H : Type*} [Group H] (χ₁ χ₂ ω : H →* Fˣ) : Prop :=
  ∀ χ : H →* Fˣ, ¬ ((χ₁ = χ ∧ χ₂ = χ * ω) ∨ (χ₁ = χ * ω ∧ χ₂ = χ))

/-- The Fouquet–Wan auxiliary condition implies ramification (Skinner–Urban's condition). -/
theorem FWAuxiliaryCondition.isRamifiedAt [FiniteDimensional F W] (ρ : Representation F G W)
    (D I : Subgroup G) (hW : finrank F W = 2) (h : FWAuxiliaryCondition ρ D I) :
    IsRamifiedAt ρ I := by
  sorry

/-- With `ω = 1` the local exclusion is exactly `(dist)`: the two characters differ. -/
theorem localExclusion_one_iff {H : Type*} [Group H] (χ₁ χ₂ : H →* Fˣ) :
    LocalExclusion χ₁ χ₂ 1 ↔ DistinctCharacters χ₁ χ₂ := by
  sorry

end ResidualHypotheses

section RankOneImage

variable {O T : Type*} [CommRing O] [AddCommGroup T] [Module O T]

/-- `(Im)` for one endomorphism: the coinvariants `T/(σ - 1)T` are free of rank one. -/
def HasRankOneCoinvariants (σ : T →ₗ[O] T) : Prop :=
  Nonempty ((T ⧸ LinearMap.range (σ - LinearMap.id)) ≃ₗ[O] O)

/-- `(Im)` for a representation and a subgroup (for the arithmetic application, the image of
`G_{ℚ(μ_{p^∞})}`): some element has free rank-one coinvariants. -/
def HasRankOneImage {G : Type*} [Group G] (ρ : Representation O G T) (H : Subgroup G) : Prop :=
  ∃ h ∈ H, HasRankOneCoinvariants (ρ h)

/-- `ModularIwasawaMainConjectures:L1/unipotent-rank-one-quotient`, algebraic core: a unipotent
endomorphism of `O²` that is nontrivial modulo the maximal ideal has free rank-one
coinvariants. -/
theorem hasRankOneCoinvariants_of_unipotent [IsDomain O] [IsDiscreteValuationRing O]
    (u : (Fin 2 → O) →ₗ[O] (Fin 2 → O))
    (hu : (u - LinearMap.id) ∘ₗ (u - LinearMap.id) = 0)
    (hnt : ¬ LinearMap.range (u - LinearMap.id) ≤
      (IsLocalRing.maximalIdeal O) • (⊤ : Submodule O (Fin 2 → O))) :
    HasRankOneCoinvariants u := by
  sorry

/-- The standard unipotent matrix has free rank-one coinvariants. -/
example [IsDomain O] [IsDiscreteValuationRing O] :
    HasRankOneCoinvariants (Matrix.toLin' !![(1 : O), 1; 0, 1]) := by
  sorry

/-- Non-example: `[[1, ϖ], [0, 1]]` is unipotent but trivial modulo `ϖ`; its coinvariants are
`O/ϖ ⊕ O`, not free of rank one. -/
example [IsDomain O] [IsDiscreteValuationRing O] (ϖ : O) (hϖ : Irreducible ϖ) :
    ¬ HasRankOneCoinvariants (Matrix.toLin' !![(1 : O), ϖ; 0, 1]) := by
  sorry

/-- Degenerate case: the identity has coinvariants `O²`, not free of rank one. -/
example [IsDomain O] [IsDiscreteValuationRing O] :
    ¬ HasRankOneCoinvariants (LinearMap.id : (Fin 2 → O) →ₗ[O] (Fin 2 → O)) := by
  sorry

/-- Residual unipotence alone does not imply an actual unipotent lift: this determinant-one
matrix reduces to `[[1,1],[0,1]]` modulo `7`, but `det (g - 1) = -7`.
This is the matrix obstruction in source issue E4, not a Galois-image counterexample. -/
example : Matrix.det !![(1 : ℤ), 1; 7, 8] = 1 ∧
    Matrix.det (!![(1 : ℤ), 1; 7, 8] - (1 : Matrix (Fin 2) (Fin 2) ℤ)) = -7 := by
  decide

end RankOneImage

section MuLambda

/-- `ModularIwasawaMainConjectures:L5/mu-lambda-comparison`, algebraic core: two nonzero power
series over a discrete valuation ring that generate the same ideal after inverting `ϖ`
(encoded as `ϖ^m f = ϖ^n u g` for a unit `u`) and have the same `μ`-invariant are associated.
This is how a rational main conjecture plus equality of `μ`-invariants gives the integral one. -/
theorem associated_of_eq_away_of_mu_eq {O : Type*} [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] (ϖ : O) (hϖ : Irreducible ϖ) (f g : PowerSeries O)
    (hf : f ≠ 0) (hg : g ≠ 0)
    (haway : ∃ (m n : ℕ) (u : (PowerSeries O)ˣ),
      PowerSeries.C ϖ ^ m * f = PowerSeries.C ϖ ^ n * g * u)
    (hmu : ∀ k : ℕ, PowerSeries.C ϖ ^ k ∣ f ↔ PowerSeries.C ϖ ^ k ∣ g) :
    Associated f g := by
  sorry

/-- The `μ`-hypothesis is necessary: `ϖ` and `1` agree after inverting `ϖ` but are not
associated. -/
example {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] (ϖ : O)
    (hϖ : Irreducible ϖ) : ¬ Associated (PowerSeries.C ϖ) (1 : PowerSeries O) := by
  sorry

end MuLambda

section Examples

/-! Decidable checks behind `ModularIwasawaMainConjectures:L5/weight-two-examples` and
`L5/higher-weight-example`. -/

/-- 11a1 at `p = 7`: `a_7 = -2` is a unit, and `ā_7² ≠ 1`, so `(LocExc_7)` holds. -/
example : ((-2 : ZMod 7) ≠ 0) ∧ ((-2 : ZMod 7) ^ 2 ≠ 1) := by decide

/-- 11a1: `ord_11 Δ = 5` is prime to `7`, so `ρ̄_7` is ramified at `11`. -/
example : ¬ (7 ∣ 5) := by decide

/-- 14a1 at `p = 13`: `ord_2 Δ = 6` is prime to `13` and `a_13 = -4` is a unit. -/
example : ¬ (13 ∣ 6) ∧ ((-4 : ZMod 13) ≠ 0) := by decide

/-- Ordinary curves at `p = 3` never satisfy `(LocExc_3)`: every unit of `𝔽₃` squares to one. -/
example : ∀ a : ZMod 3, a ≠ 0 → a ^ 2 = 1 := by decide

/-- `η(z)⁴η(5z)⁴` at `p = 7`: `a_7 = 6` is a unit and the inertia-invariant line has Frobenius
eigenvalue `μ(5)·5⁻¹ = -5⁻¹ = 4 ≠ 1` modulo `7` (that is, `5 · 4 = -1`). -/
example : ((6 : ZMod 7) ≠ 0) ∧ ((5 : ZMod 7) * 4 = -1) ∧ ((4 : ZMod 7) ≠ 1) := by decide

/-- The Frobenius polynomial at `2` of the higher-weight example has nonsquare discriminant
`a₂² - 4 * 2³ = -16 = 5` modulo `7`, certifying irreducibility over `𝔽₇`. -/
example : ((-4 : ZMod 7) ^ 2 - 4 * 2 ^ 3 = 5) ∧
    (∀ x : ZMod 7, x ^ 2 ≠ 5) := by decide

/-- Diagnostic only, not a reducibility certificate: `η(z)⁴η(5z)⁴` at `p = 13` has `a_2 = -4 ≡ 1 + 2³` and `13 ∣ 5⁴ - 1`. -/
example : ((-4 : ZMod 13) = 1 + 2 ^ 3) ∧ (13 ∣ 5 ^ 4 - 1) := by decide

end Examples

end ModularIwasawaMainConjectures
