/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Claude (Anthropic); Codex (OpenAI)
-/
import Mathlib

/-!
# ModularIwasawaMainConjectures: representative target signatures

The roadmap is README.md. This file records representative definitions and theorem signatures
statable against the pinned APIs and is not exhaustive. The arithmetic objects and comparisons
are specified in the README. These signatures fix the invariant-subspace tests, the integral
rank-one coinvariant condition, the inverse direction of coordinate change and the distinction
between rational and integral association. Definitions have real bodies; theorem proofs remain
mathematical targets.
-/

namespace TauCetiRoadmap.ModularIwasawaMainConjectures

open Module

/-! ## Layer 0: the three cyclotomic formulations -/


/-- A contragredient representation dual inverts the scalar (the scalar Λ-module dual
uses precomposition without this inversion): `2` on a line gives `4` on its dual over `𝔽₇`. -/
example : (2 : ZMod 7) * 4 = 1 ∧ (4 : ZMod 7) ≠ 2 := by decide

/-- A two-term complex with equal degree-one zeta quotient and degree-two torsion
has zero difference of lengths; reversing only one sign would give four. -/
example : (2 : ℤ) - 2 = 0 ∧ (2 : ℤ) + 2 = 4 := by decide

/-- The unequal-length cases fix the overall sign of the inverse determinant divisor. -/
example : (2 : ℤ) - 0 = 2 ∧ (0 : ℤ) - 2 = -2 := by decide

/-- At successive critical integers the complex factors are `−2πi` and `−4π²`. -/
example : (-2 * Real.pi * Complex.I : ℂ) * 1 = -(2 * Real.pi) * Complex.I ∧
    (-2 * Real.pi * Complex.I : ℂ) ^ 2 * 1 = -4 * (Real.pi : ℂ) ^ 2 := by
  sorry

/-- Removing a dual Euler factor divides the partial zeta value by that factor. -/
example : (2 : ℚ)⁻¹ * 2 = 1 ∧ (2 : ℚ) * 2 ≠ 1 := by norm_num

/-- The local Euler factor uses the inverse group-ring argument in the scalar-dual convention. -/
example : (1 - (11 : ℚ)⁻¹ * 2⁻¹ = 21 / 22) ∧
    (1 - (11 : ℚ)⁻¹ * 2 = 9 / 11) := by norm_num

/-- The first coefficients of the two cyclotomic coordinates have opposite signs. -/
example (a : ℚ) : PowerSeries.coeff 1
    (PowerSeries.C a * PowerSeries.X : PowerSeries ℚ) = a ∧
    PowerSeries.coeff 1 (-PowerSeries.C a * PowerSeries.X : PowerSeries ℚ) = -a := by
  simp

/-! ## Layer 1: ordinary theorems and residual hypotheses -/

section ResidualHypotheses

local instance : Fact (Nat.Prime 7) := ⟨by decide⟩

variable {F G W : Type*} [Field F] [Group G] [AddCommGroup W] [Module F W]

/-- `(SU_q)`: the representation is ramified at the place whose inertia group is `I`,
i.e. some element of `I` acts nontrivially. The arithmetic condition `q ∥ N` is a separate
hypothesis on the level. -/
def IsRamifiedAt (ρ : Representation F G W) (I : Subgroup G) : Prop :=
  ∃ g ∈ I, ρ g ≠ LinearMap.id

/-- `(FW1.6_ℓ)` in Fouquet–Wan's cohomological normalisation: the inertia invariants form a
line and the decomposition-group invariants vanish. -/
def FWAuxiliaryCondition [FiniteDimensional F W] (ρ : Representation F G W) (D I : Subgroup G) : Prop :=
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


/-- Scalar multiplication by units is ramified for the full unit subgroup of `𝔽₇`. -/
example : IsRamifiedAt (F := ZMod 7)
    (Representation.ofDistribMulAction (ZMod 7) (ZMod 7)ˣ (ZMod 7)) ⊤ := by
  sorry

/-- The trivial representation is unramified on every subgroup. -/
example (I : Subgroup G) : ¬ IsRamifiedAt (Representation.trivial F G W) I := by
  sorry

/-- The trivial inertia subgroup fixes every vector. -/
example (ρ : Representation F G W) : ¬ IsRamifiedAt ρ ⊥ := by
  sorry

/-- Distinct characters must reject an equal pair, including the trivial character. -/
example {H : Type*} [Group H] (χ : H →* Fˣ) : ¬ DistinctCharacters χ χ := by
  sorry

/-- The trivial character and the tautological character on `𝔽₇ˣ` are distinct. -/
example : DistinctCharacters (F := ZMod 7) (1 : (ZMod 7)ˣ →* (ZMod 7)ˣ) (MonoidHom.id _) := by
  sorry

/-- Distinctness is independent of the order of the two characters. -/
example {H : Type*} [Group H] (χ₁ χ₂ : H →* Fˣ) :
    DistinctCharacters χ₁ χ₂ ↔ DistinctCharacters χ₂ χ₁ := by
  sorry

/-- The pair `1, ω` fails the exceptional-pair exclusion. -/
example {H : Type*} [Group H] (ω : H →* Fˣ) : ¬ LocalExclusion 1 ω ω := by
  sorry

/-- Reversing the exceptional pair does not restore the exclusion. -/
example {H : Type*} [Group H] (ω : H →* Fˣ) : ¬ LocalExclusion ω 1 ω := by
  sorry

/-- On `𝔽₇ˣ`, the pair `1, ω²` is outside the two excluded adjacent-character pairs. -/
example : LocalExclusion (F := ZMod 7) (1 : (ZMod 7)ˣ →* (ZMod 7)ˣ)
    ((MonoidHom.id _) ^ 2) (MonoidHom.id _) := by
  sorry

/-- The diagonal action of two independent unit characters is an existing product
representation. Inertia `ker fst` fixes the first coordinate only. -/
example : FWAuxiliaryCondition (F := ZMod 7)
    (Representation.prod
      ((Representation.ofDistribMulAction (ZMod 7) (ZMod 7)ˣ (ZMod 7)).comp
        (MonoidHom.fst (ZMod 7)ˣ (ZMod 7)ˣ))
      ((Representation.ofDistribMulAction (ZMod 7) (ZMod 7)ˣ (ZMod 7)).comp
        (MonoidHom.snd (ZMod 7)ˣ (ZMod 7)ˣ)))
    ⊤ (MonoidHom.fst (ZMod 7)ˣ (ZMod 7)ˣ).ker := by
  sorry

/-- Trivial inertia in dimension two gives two invariants, so it fails the line condition. -/
example [FiniteDimensional F W] (ρ : Representation F G W)
    (D : Subgroup G) (hW : finrank F W = 2) : ¬ FWAuxiliaryCondition ρ D ⊥ := by
  sorry

/-- If decomposition equals inertia, the invariant space cannot have both dimensions
one and zero. For the diagonal example with `I = ker fst`, only the second condition fails. -/
example [FiniteDimensional F W] (ρ : Representation F G W)
    (I : Subgroup G) : ¬ FWAuxiliaryCondition ρ I I := by
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

/-- A unipotent
endomorphism, algebraic form of the rank-one quotient theorem: a unipotent
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
It fixes the distinction between residual and characteristic-zero unipotence. -/
example : Matrix.det !![(1 : ℤ), 1; 7, 8] = 1 ∧
    Matrix.det (!![(1 : ℤ), 1; 7, 8] - (1 : Matrix (Fin 2) (Fin 2) ℤ)) = -7 := by
  decide


/-- The natural action of all linear automorphisms contains the standard unipotent. -/
example [IsDomain O] [IsDiscreteValuationRing O] : HasRankOneImage
    (Representation.ofDistribMulAction O
      ((Fin 2 → O) ≃ₗ[O] (Fin 2 → O)) (Fin 2 → O)) ⊤ := by
  sorry

/-- A trivial representation on a rank-two lattice has no rank-one coinvariant witness. -/
example [IsDomain O] [IsDiscreteValuationRing O] {G : Type*} [Group G]
    (H : Subgroup G) : ¬ HasRankOneImage (Representation.trivial O G (Fin 2 → O)) H := by
  sorry

/-- The identity subgroup supplies no witness in a rank-two representation. -/
example [IsDomain O] [IsDiscreteValuationRing O] {G : Type*} [Group G]
    (ρ : Representation O G (Fin 2 → O)) : ¬ HasRankOneImage ρ ⊥ := by
  sorry

end RankOneImage

/-! ## Layer 2: the pointwise cohomological theorem -/

/-! ## Layer 3: ordinary elliptic curves -/

/-! ## Layer 4: families and signed consequences -/

/-- A two-coordinate basis change uses the inverse matrix on the coordinate column. -/
example : Matrix.mulVec (!![(1 : ℚ), 0; -1, 1]) ![1, 0] = ![1, -1] := by
  ext i
  fin_cases i <;> norm_num [Matrix.mulVec, dotProduct, Fin.sum_univ_two]

/-! ## Layer 5: specialization, leading terms and arithmetic examples -/

section MuLambda

/-- The algebraic core of the μ comparison: two nonzero power
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

/-! Arithmetic checks for the weight-two and higher-weight examples. -/

/-- 11a1 at `p = 7`: `a_7 = -2` is a unit, and `ā_7² ≠ 1`, so `(LocExc_7)` holds. -/
example : ((-2 : ZMod 7) ≠ 0) ∧ ((-2 : ZMod 7) ^ 2 ≠ 1) := by decide

/-- 11a1: `ord_11 Δ = 5` is prime to `7`, so `ρ̄_7` is ramified at `11`. -/
example : ¬ (7 ∣ 5) := by decide

/-- 14a1 at `p = 13`: `ord_2 Δ = 6` is prime to `13` and `a_13 = -4` is a unit. -/
example : ¬ (13 ∣ 6) ∧ ((-4 : ZMod 13) ≠ 0) := by decide

/-- Point counts give a nonsquare Frobenius discriminant for 11a1 at `p = 7`. -/
example : ((-2 : ZMod 7) ^ 2 - 4 * 2 = 3) ∧
    (∀ x : ZMod 7, x ^ 2 ≠ 3) := by decide

/-- The Frobenius at `3` certifies irreducibility of 14a1 at `p = 5`. -/
example : ((-2 : ZMod 5) ^ 2 - 4 * 3 = 2) ∧
    (∀ x : ZMod 5, x ^ 2 ≠ 2) := by decide

/-- The same Frobenius certifies irreducibility of 14a1 at `p = 13`. -/
example : ((-2 : ZMod 13) ^ 2 - 4 * 3 = 5) ∧
    (∀ x : ZMod 13, x ^ 2 ≠ 5) := by decide

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

/-! ## Layer 6: comparison with other arithmetic branches -/

/-
The README also specifies the arithmetic objects unavailable as carriers here:
ModularIwasawaDatum; OrdinarySelmer and its dual; ordinaryPadicL;
iwasawaH1, iwasawaH2, fundamentalLine and its zeta trivialization;
IMC and IMC_rational; KMC and KMC_rational; SignedSelmer and its local condition;
SMC and SMC_rational; residual irreducibility, ScalarExclusion and the twisted-Steinberg
extension predicate; mazurSwinnertonDyerL; MazurMC and MazurMC_rational;
tateLInvariant; MTT and MTT_p with their arithmetic height input.
The ordinary, pointwise, elliptic, family and signed arithmetic theorems and all branch
comparison maps are README targets. They are not expressed using unspecified carriers.
-/

end TauCetiRoadmap.ModularIwasawaMainConjectures
