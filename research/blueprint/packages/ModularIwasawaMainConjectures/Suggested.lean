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
rank-one coinvariant condition and the distinction between rational and integral association.
Definitions have real bodies. Examples are proved tests of those definitions; named
theorems with `sorry` are mathematical targets, including the boundary tests listed in the README.
-/

namespace TauCetiRoadmap.ModularIwasawaMainConjectures

open Module

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


/-- Scalar multiplication by units detects ramification on the full subgroup. -/
example : IsRamifiedAt (F := ZMod 7)
    (Representation.ofDistribMulAction (ZMod 7) (ZMod 7)ˣ (ZMod 7)) ⊤ := by
  refine ⟨Units.mk0 (2 : ZMod 7) (by decide), Subgroup.mem_top _, ?_⟩
  intro h
  have h1 := LinearMap.congr_fun h 1
  norm_num [Representation.ofDistribMulAction_apply_apply] at h1
  revert h1
  decide

/-- The trivial representation is unramified on every subgroup. -/
example (I : Subgroup G) : ¬ IsRamifiedAt (Representation.trivial F G W) I := by
  rintro ⟨g, _, hg⟩
  apply hg
  ext v
  rfl

/-- Distinct characters reject an equal pair. -/
example {H : Type*} [Group H] (χ : H →* Fˣ) : ¬ DistinctCharacters χ χ := by
  exact fun h => h rfl

/-- The trivial and tautological characters on `𝔽₇ˣ` are distinct. -/
example : DistinctCharacters (F := ZMod 7) (1 : (ZMod 7)ˣ →* (ZMod 7)ˣ)
    (MonoidHom.id _) := by
  intro h
  have h2 := congrArg (fun χ => ((χ (Units.mk0 (2 : ZMod 7) (by decide))) : ZMod 7)) h
  norm_num at h2
  revert h2
  decide

/-- The exceptional pair fails the exclusion. -/
example {H : Type*} [Group H] (ω : H →* Fˣ) : ¬ LocalExclusion 1 ω ω := by
  intro h
  exact h 1 (Or.inl ⟨rfl, (one_mul ω).symm⟩)

/-- The nonadjacent pair `1, ω²` passes the exclusion on `𝔽₇ˣ`. -/
example : LocalExclusion (F := ZMod 7) (1 : (ZMod 7)ˣ →* (ZMod 7)ˣ)
    ((MonoidHom.id _) ^ 2) (MonoidHom.id _) := by
  intro χ h
  rcases h with ⟨rfl, h⟩ | ⟨h, rfl⟩
  · have h2 := congrArg (fun ψ => ((ψ (Units.mk0 (3 : ZMod 7) (by decide))) : ZMod 7)) h
    norm_num at h2
    revert h2
    decide
  · have h2 := congrArg (fun ψ => ((ψ (Units.mk0 (3 : ZMod 7) (by decide))) : ZMod 7)) h
    norm_num at h2
    revert h2
    decide

/-- A decomposition group equal to inertia cannot have both required dimensions. -/
example [FiniteDimensional F W] (ρ : Representation F G W) (I : Subgroup G) :
    ¬ FWAuxiliaryCondition ρ I I := by
  rintro ⟨h1, h0⟩
  omega

/-- Positive boundary target: independent unit characters have an inertia-invariant line
but no decomposition invariants. See the diagonal test in README §1.1. -/
theorem fwAuxiliary_independentCharacters : FWAuxiliaryCondition (F := ZMod 7)
    (Representation.prod
      ((Representation.ofDistribMulAction (ZMod 7) (ZMod 7)ˣ (ZMod 7)).comp
        (MonoidHom.fst (ZMod 7)ˣ (ZMod 7)ˣ))
      ((Representation.ofDistribMulAction (ZMod 7) (ZMod 7)ˣ (ZMod 7)).comp
        (MonoidHom.snd (ZMod 7)ˣ (ZMod 7)ˣ)))
    ⊤ (MonoidHom.fst (ZMod 7)ˣ (ZMod 7)ˣ).ker := by
  sorry

/-- Boundary target: trivial inertia in dimension two fails the line condition. -/
theorem not_fwAuxiliary_bot [FiniteDimensional F W] (ρ : Representation F G W)
    (D : Subgroup G) (hW : finrank F W = 2) : ¬ FWAuxiliaryCondition ρ D ⊥ := by
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

/-- The standard unipotent has coinvariants given by the second coordinate, over any
commutative ring. This checks freeness rather than only the residual dimension. -/
example : HasRankOneCoinvariants (Matrix.toLin' !![(1 : O), 1; 0, 1]) := by
  let q : (Fin 2 → O) →ₗ[O] O := LinearMap.proj 1
  have hr : LinearMap.range (Matrix.toLin' !![(1 : O), 1; 0, 1] - LinearMap.id) =
      LinearMap.ker q := by
    ext x
    constructor
    · rintro ⟨y, rfl⟩
      simp [q, Matrix.toLin'_apply, dotProduct, Fin.sum_univ_two, Matrix.vecHead, Matrix.vecTail]
    · intro hx
      have hx1 : x 1 = 0 := hx
      refine ⟨![0, x 0], ?_⟩
      ext i
      fin_cases i <;>
        simp [Matrix.toLin'_apply, hx1]
  refine ⟨(Submodule.quotEquivOfEq _ _ hr).trans (q.quotKerEquivOfSurjective ?_)⟩
  intro a
  exact ⟨![0, a], rfl⟩

/-- Identity coinvariants on a rank-two lattice are not a free rank-one module. -/
example [Nontrivial O] [StrongRankCondition O] :
    ¬ HasRankOneCoinvariants (LinearMap.id : (Fin 2 → O) →ₗ[O] (Fin 2 → O)) := by
  rintro ⟨e⟩
  have h := ((Submodule.quotEquivOfEqBot _ (by simp)).symm.trans e).finrank_eq
  simp at h

/-- Boundary target: a nonunit upper-right entry leaves torsion in the coinvariants. -/
theorem not_rankOneCoinvariants_uniformizer [IsDomain O] [IsDiscreteValuationRing O]
    (ϖ : O) (hϖ : Irreducible ϖ) :
    ¬ HasRankOneCoinvariants (Matrix.toLin' !![(1 : O), ϖ; 0, 1]) := by
  sorry

/-- Positive image boundary target: the full automorphism group contains a unipotent
with free rank-one coinvariants. -/
theorem hasRankOneImage_fullAutomorphismGroup [IsDomain O] [IsDiscreteValuationRing O] :
    HasRankOneImage (Representation.ofDistribMulAction O
      ((Fin 2 → O) ≃ₗ[O] (Fin 2 → O)) (Fin 2 → O)) ⊤ := by
  sorry

/-- The identity subgroup supplies no witness, regardless of the ambient image. -/
example [Nontrivial O] [StrongRankCondition O] {G : Type*} [Group G]
    (ρ : Representation O G (Fin 2 → O)) : ¬ HasRankOneImage ρ ⊥ := by
  rintro ⟨g, hg, ⟨e⟩⟩
  have hg1 : g = 1 := hg
  subst g
  rw [map_one] at e
  change ((Fin 2 → O) ⧸ LinearMap.range
    ((LinearMap.id : (Fin 2 → O) →ₗ[O] (Fin 2 → O)) - LinearMap.id)) ≃ₗ[O] O at e
  have h := ((Submodule.quotEquivOfEqBot _ (by simp)).symm.trans e).finrank_eq
  simp at h

end RankOneImage

/-! ## Layer 5: specialization -/

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

end MuLambda

/-
The README also specifies the arithmetic objects unavailable as carriers here:
ModularIwasawaDatum; OrdinarySelmer and its dual; ordinaryPadicL;
iwasawaH1, iwasawaH2, fundamentalLine and its zeta trivialization;
IMC and IMC_rational; KMC and KMC_rational; SignedSelmer and its local condition;
SMC and SMC_rational; residual irreducibility, ScalarExclusion and the twisted-Steinberg
extension predicate; mazurSwinnertonDyerL; MazurMC and MazurMC_rational;
tateLInvariant; MTT and MTT_p with their arithmetic height input.
The family also requires the supplier construction universalDeformationZeta.
The ordinary, pointwise, elliptic, family and signed arithmetic theorems and all branch
comparison maps are README targets. They are not expressed using unspecified carriers.
-/

end TauCetiRoadmap.ModularIwasawaMainConjectures
