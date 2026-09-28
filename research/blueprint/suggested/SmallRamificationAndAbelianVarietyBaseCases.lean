/-
Copyright (c) 2026 Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.NumberTheory.NumberField.Discriminant.Basic
import Mathlib.NumberTheory.NumberField.Discriminant.Different
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.NumberTheory.Harmonic.EulerMascheroni
import Mathlib.Analysis.Complex.Trigonometric
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Arctan
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.Real.Pi.Bounds
import Mathlib.Analysis.Convolution
import Mathlib.MeasureTheory.Integral.IntegralEqImproper
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.GroupTheory.PGroup
import Mathlib.GroupTheory.SpecificGroups.Dihedral
import Mathlib.Topology.Algebra.ContinuousMonoidHom
import TauCeti.Analysis.PositiveDefinite.AddGroup
import TauCeti.Analysis.Bochner.BochnerTheorem
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.FiniteLocallyFree
import TauCeti.AlgebraicGeometry.AbelianVariety.Basic
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.NumberTheory.ModularForms.LevelOne.DimensionFormula

/-!
# Small ramification and the base cases of Serre's conjecture — suggested declarations

This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. All proposed results are unproved prototypes at the pinned baseline
(Mathlib 082e2d3, Tau Ceti f790474); the file has not been compiled.

Layers covered: R25.1 (explicit discriminant bounds: the local root-discriminant exponent,
the 2-adic and 3-adic bounds, Minkowski thresholds, the Odlyzko–Poitou bound) and R25.2
(Tate's theorem, Serre's mod-3 theorem, the combined base case), R25.3 (Fontaine's theorem,
through finite flat 2-group schemes over `ℤ`), R25.4 (Schoof's theorem for
`l ∈ {2, 3, 5, 7, 13}`), R25.5 (GL₂-type realisation and the terminal weights) and R25.6 (the
base-case table).

Objects imported from other roadmaps appear as placeholders named after their owners'
planned declarations:

* `differentExponent`, `ramificationIndex`, `inertiaSubgroup`, `wildInertiaSubgroup`,
  `principalUnits` — Tau Ceti LocalFieldsRamification, Layers 1, 3 and 4;
* `IsCompletionAbove` — Tau Ceti NumberFieldArithmetic, Layers 5–6;
* `IsAbsolutelyIrreducible`, `IsOdd`, `IsUnramifiedAt`, `wildInertiaImage` —
  ArithmeticGaloisRepresentations R01.1–R01.2;
* `IsIrreducibleSubgroup` — ArithmeticGaloisRepresentations R01.4 (Dickson);
* `IsSimpleGroupScheme`, `zModTwoScheme`, `muTwoScheme`, `IsConstantGroupScheme`,
  `IsDiagonalizableGroupScheme`, `Ext1Vanishes` — FiniteFlatGroupsAndIntegralPadicHodgeTheory
  R07.1, on Tau Ceti's `FiniteLocallyFreeCommAffineGroupSchemeCat`;
* `HasGoodReductionEverywhere` — NeronModelsAndSemistableAbelianVarieties R11.1.

The explicit formula for the discriminant (AnalyticNumberTheory AN.3) and local class field
theory (Tau Ceti ClassFieldTheory, Layer 7) enter only through proofs, so they have no
placeholder here.
-/

noncomputable section

open NumberField NumberField.InfinitePlace Module Polynomial MeasureTheory Set
open scoped Real

namespace TauCeti.SmallRamification

/-! ## Imported objects (placeholders; owned elsewhere) -/

section Placeholders

variable (p : ℕ) [Fact p.Prime] (E : Type*) [Field E] [Algebra ℚ_[p] E]
  [FiniteDimensional ℚ_[p] E]

/-- LocalFieldsRamification Layer 3: `d(E/ℚ_p) = v_E(𝔡_{E/ℚ_p})`. -/
def differentExponent : ℕ := sorry

/-- LocalFieldsRamification Layer 3: the ramification index `e(E/ℚ_p) ≥ 1`. -/
def ramificationIndex : ℕ := sorry

/-- LocalFieldsRamification Layer 3: the discriminant exponent `f · d`. -/
def discriminantExponent : ℕ := sorry

/-- LocalFieldsRamification Layers 3–4: the inertia subgroup `G_0`. -/
def inertiaSubgroup : Subgroup (E ≃ₐ[ℚ_[p]] E) := sorry

/-- LocalFieldsRamification Layers 3–4: the wild inertia subgroup `G_1`, a `p`-group. -/
def wildInertiaSubgroup : Subgroup (E ≃ₐ[ℚ_[p]] E) := sorry

/-- LocalFieldsRamification Layer 1: the principal units `U^{(i)} = 1 + 𝔪^i`. -/
def principalUnits (i : ℕ) : Subgroup Eˣ := sorry

end Placeholders

/-- NumberFieldArithmetic Layers 5–6: `E` is the completion of `K` at a prime above `p`. -/
def IsCompletionAbove (K : Type*) [Field K] [NumberField K] (p : ℕ) [Fact p.Prime]
    (E : Type*) [Field E] [Algebra ℚ_[p] E] : Prop := sorry

section ResidualPlaceholders

variable {F : Type*} [Field F] [Fintype F] [TopologicalSpace F] [DiscreteTopology F]

/-- A residual representation: a continuous homomorphism `G_ℚ → GL₂(F)`. -/
abbrev ResidualRep (F : Type*) [Field F] [TopologicalSpace F] :=
  ContinuousMonoidHom (Field.absoluteGaloisGroup ℚ) (GL (Fin 2) F)

/-- R01.1: irreducible after extension of scalars to an algebraic closure. -/
def IsAbsolutelyIrreducible (ρ : ResidualRep F) : Prop := sorry

/-- R01.2: `det ρ(c) = -1` for a complex conjugation `c`. -/
def IsOdd (ρ : ResidualRep F) : Prop := sorry

/-- R01.2: `ρ` is trivial on the inertia subgroups above the prime `ℓ`. -/
def IsUnramifiedAt (ℓ : ℕ) (ρ : ResidualRep F) : Prop := sorry

/-- R01.2: the image of the wild inertia subgroup at `p`. -/
def wildInertiaImage (p : ℕ) (ρ : ResidualRep F) : Subgroup (GL (Fin 2) F) := sorry

end ResidualPlaceholders

/-- R01.4: a subgroup of `GL₂(K)` with no invariant line in `K²`. -/
def IsIrreducibleSubgroup {K : Type*} [Field K] (G : Subgroup (GL (Fin 2) K)) : Prop := sorry

/-! ## R25.1 — the local root-discriminant exponent -/

section Local

variable (p : ℕ) [Fact p.Prime] (E : Type*) [Field E] [Algebra ℚ_[p] E]
  [FiniteDimensional ℚ_[p] E]

/-- `δ(E) = d(E/ℚ_p)/e(E/ℚ_p)`, the different normalised by `v_p(p) = 1`. -/
def localRootDiscrExp : ℚ :=
  (differentExponent p E : ℚ) / ramificationIndex p E

theorem localRootDiscrExp_eq_discriminantExponent_div :
    localRootDiscrExp p E = (discriminantExponent p E : ℚ) / finrank ℚ_[p] E := sorry

theorem localRootDiscrExp_eq_zero_iff :
    localRootDiscrExp p E = 0 ↔ ramificationIndex p E = 1 := sorry

theorem localRootDiscrExp_of_tame (h : ¬ p ∣ ramificationIndex p E) :
    localRootDiscrExp p E = 1 - 1 / (ramificationIndex p E : ℚ) := sorry

theorem localRootDiscrExp_of_isUnramified (E' : Type*) [Field E'] [Algebra ℚ_[p] E']
    [FiniteDimensional ℚ_[p] E'] [Algebra E E'] [IsScalarTower ℚ_[p] E E']
    (h : ramificationIndex p E' = ramificationIndex p E) :
    localRootDiscrExp p E' = localRootDiscrExp p E := sorry

theorem localRootDiscrExp_congr (E' : Type*) [Field E'] [Algebra ℚ_[p] E']
    [FiniteDimensional ℚ_[p] E'] (e : E ≃ₐ[ℚ_[p]] E') :
    localRootDiscrExp p E' = localRootDiscrExp p E := sorry

end Local

/-- Unit test: `δ(ℚ₂(√−1)) = 1`. -/
example (E : Type*) [Field E] [Algebra ℚ_[2] E] [FiniteDimensional ℚ_[2] E]
    [IsSplittingField ℚ_[2] E (X ^ 2 + 1)] : localRootDiscrExp 2 E = 1 := sorry

/-- Unit test: `δ(ℚ₂(√2)) = 3/2`; neither `d = 3` nor the discriminant exponent `3` is it. -/
example (E : Type*) [Field E] [Algebra ℚ_[2] E] [FiniteDimensional ℚ_[2] E]
    [IsSplittingField ℚ_[2] E (X ^ 2 - 2)] : localRootDiscrExp 2 E = 3 / 2 := sorry

/-- Unit test: `δ(ℚ₃(ζ₃, ∛3)) = 11/6`, the sharp case of the 3-adic bound. -/
example (E : Type*) [Field E] [Algebra ℚ_[3] E] [FiniteDimensional ℚ_[3] E]
    [IsSplittingField ℚ_[3] E (X ^ 3 - 3)] : localRootDiscrExp 3 E = 11 / 6 := sorry

/-- Unit test (degenerate): `δ(ℚ_p) = 0`. -/
example (p : ℕ) [Fact p.Prime] : localRootDiscrExp p ℚ_[p] = 0 := sorry

/-- The root discriminant of a Galois field unramified outside `p` is `p ^ δ(K_𝔭)`. -/
theorem rootDiscr_eq_prod_rpow_localRootDiscrExp (K : Type*) [Field K] [NumberField K]
    [IsGalois ℚ K] (p : ℕ) [Fact p.Prime]
    (hK : ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ p → ¬ (ℓ : ℤ) ∣ discr K)
    (E : Type*) [Field E] [Algebra ℚ_[p] E] [FiniteDimensional ℚ_[p] E]
    (hE : IsCompletionAbove K p E) :
    rootDiscr K = (p : ℝ) ^ (localRootDiscrExp p E : ℝ) := sorry

/-- Local abelian quotients of order prime to `p` have inertia image of exponent dividing
`q − 1`, stated here over `ℚ_p` (`q = p`); the node allows any finite `K/ℚ_p`. -/
theorem orderOf_map_inertia_dvd_card_residueField_sub_one (p : ℕ) [Fact p.Prime] (E : Type*)
    [Field E] [Algebra ℚ_[p] E] [FiniteDimensional ℚ_[p] E] [IsGalois ℚ_[p] E]
    {B : Type*} [CommGroup B] [Finite B] (hB : Nat.Coprime (Nat.card B) p)
    (ψ : (E ≃ₐ[ℚ_[p]] E) →* B) {σ : E ≃ₐ[ℚ_[p]] E} (hσ : σ ∈ inertiaSubgroup p E) :
    orderOf (ψ σ) ∣ p - 1 := sorry

/-- Part (a): over an unramified extension of `ℚ₂`, `U^{(3)} ⊆ (U^{(1)})²`. -/
theorem principalUnits_pow_subset (E : Type*) [Field E] [Algebra ℚ_[2] E]
    [FiniteDimensional ℚ_[2] E] (hE : ramificationIndex 2 E = 1) :
    principalUnits E 3 ≤ (principalUnits E 1).map (powMonoidHom 2) := sorry

/-- Tate's 2-adic bound. -/
theorem localRootDiscrExp_le_two_of_char_two (E : Type*) [Field E] [Algebra ℚ_[2] E]
    [FiniteDimensional ℚ_[2] E] [IsGalois ℚ_[2] E] {F : Type*} [Field F] [Fintype F]
    [CharP F 2] (ι : (E ≃ₐ[ℚ_[2]] E) →* GL (Fin 2) F) (hι : Function.Injective ι) :
    localRootDiscrExp 2 E ≤ 2 := sorry

/-- The dihedral refinement: `δ ≤ 3/2` when the wild inertia has order at most `2`. -/
theorem localRootDiscrExp_le_three_halves_of_char_two (E : Type*) [Field E]
    [Algebra ℚ_[2] E] [FiniteDimensional ℚ_[2] E] [IsGalois ℚ_[2] E] {F : Type*} [Field F]
    [Fintype F] [CharP F 2] (ι : (E ≃ₐ[ℚ_[2]] E) →* GL (Fin 2) F)
    (hι : Function.Injective ι) (hP : Nat.card (wildInertiaSubgroup 2 E) ≤ 2) :
    localRootDiscrExp 2 E ≤ 3 / 2 := sorry

/-- The 3-adic bound `δ ≤ 13/6 − 1/|P|` for wild `E`. -/
theorem localRootDiscrExp_le_of_char_three (E : Type*) [Field E] [Algebra ℚ_[3] E]
    [FiniteDimensional ℚ_[3] E] [IsGalois ℚ_[3] E] {F : Type*} [Field F] [Fintype F]
    [CharP F 3] (ι : (E ≃ₐ[ℚ_[3]] E) →* GL (Fin 2) F) (hι : Function.Injective ι)
    (hP : wildInertiaSubgroup 3 E ≠ ⊥) :
    localRootDiscrExp 3 E ≤ 13 / 6 - 1 / (Nat.card (wildInertiaSubgroup 3 E) : ℚ) := sorry

/-! ## R25.1 — global lower bounds -/

section Minkowski

variable (K : Type*) [Field K] [NumberField K]

theorem two_lt_rootDiscr (h : 3 ≤ finrank ℚ K) : 2 < rootDiscr K := sorry

theorem three_lt_rootDiscr (h : 6 ≤ finrank ℚ K) : 3 < rootDiscr K := sorry

theorem four_lt_rootDiscr (h : 12 ≤ finrank ℚ K) : 4 < rootDiscr K := sorry

end Minkowski

/-- The kernel `g(x) = (1 − |x|) cos πx + sin π|x| / π` on `[−1, 1]`, zero outside. -/
def odlyzkoKernel (x : ℝ) : ℝ :=
  if |x| ≤ 1 then (1 - |x|) * Real.cos (π * x) + Real.sin (π * |x|) / π else 0

theorem odlyzkoKernel_eq_two_mul_convolution :
    odlyzkoKernel = 2 • MeasureTheory.convolution
      (Set.indicator (Set.Icc (-(1 / 2)) (1 / 2)) fun y => Real.cos (π * y))
      (Set.indicator (Set.Icc (-(1 / 2)) (1 / 2)) fun y => Real.cos (π * y))
      (ContinuousLinearMap.mul ℝ ℝ) volume := sorry

theorem odlyzkoKernel_nonneg (x : ℝ) : 0 ≤ odlyzkoKernel x := sorry

@[simp] theorem odlyzkoKernel_zero : odlyzkoKernel 0 = 1 := sorry

@[simp] theorem odlyzkoKernel_neg (x : ℝ) : odlyzkoKernel (-x) = odlyzkoKernel x := sorry

theorem odlyzkoKernel_eq_zero_of_one_le_abs {x : ℝ} (hx : 1 ≤ |x|) :
    odlyzkoKernel x = 0 := sorry

theorem isPositiveDefiniteSub_odlyzkoKernel :
    TauCeti.IsPositiveDefiniteSub fun x : ℝ => (odlyzkoKernel x : ℂ) := sorry

theorem contDiff_odlyzkoKernel : ContDiff ℝ 1 odlyzkoKernel := sorry

theorem integral_odlyzkoKernel_Ioi : ∫ x in Ioi (0 : ℝ), odlyzkoKernel x = 4 / π ^ 2 := sorry

/-- Unit test: `g(1/2) = 1/π`. -/
example : odlyzkoKernel (1 / 2) = 1 / π := sorry

/-- Unit test: `g(3/4) > 0`; the variant without the sine term is negative there. -/
example : 0 < odlyzkoKernel (3 / 4) := sorry

/-- Unit test (degenerate): the support is `[−1, 1]`. -/
example : odlyzkoKernel 1 = 0 ∧ odlyzkoKernel 2 = 0 := sorry

/-- Positivity of `F = f/cosh(x/2)` on the critical strip. -/
theorem re_poitouTransform_nonneg (f : ℝ → ℝ) (hf_even : ∀ x, f (-x) = f x)
    (hf_cont : Continuous f) (hf_supp : HasCompactSupport f) (hf_nonneg : ∀ x, 0 ≤ f x)
    (hf_pd : TauCeti.IsPositiveDefiniteSub fun x => (f x : ℂ)) {s : ℂ}
    (hs₀ : 0 ≤ s.re) (hs₁ : s.re ≤ 1) :
    0 ≤ (∫ x : ℝ, ((f x / Real.cosh (x / 2) : ℝ) : ℂ) * Complex.exp ((s - 1 / 2) * x)).re :=
  sorry

/-- The test function `F_b(x) = g(x/b)/cosh(x/2)`. -/
def poitouTestFunction (b x : ℝ) : ℝ := odlyzkoKernel (x / b) / Real.cosh (x / 2)

/-- `P(n, r₁, b)`: the explicit-formula lower bound with the zero and prime sums removed. -/
def poitouLowerBound (n r₁ : ℕ) (b : ℝ) : ℝ :=
  r₁ * π / 2 + n * (Real.eulerMascheroniConstant + Real.log (8 * π))
    - n * ∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2))
    - r₁ * ∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.cosh (x / 2))
    - 16 * b / π ^ 2

theorem integrableOn_poitouIntegrand_sinh {b : ℝ} (hb : 0 < b) :
    IntegrableOn (fun x => (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2)))
      (Ioi 0) := sorry

theorem poitouIntegral_sinh_eq {b : ℝ} (hb : 0 < b) :
    ∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2)) =
      (∫ x in (0 : ℝ)..b, (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2)))
        - Real.log (Real.tanh (b / 4)) := sorry

theorem poitouLowerBound_div_mono {b : ℝ} (hb : 0 < b) {n m : ℕ} (hn : 0 < n)
    (hnm : n ≤ m) : poitouLowerBound n 0 b / n ≤ poitouLowerBound m 0 b / m := sorry

/-- Unit test: for `ℚ` the bound is nonpositive. -/
example : poitouLowerBound 1 1 1 ≤ 0 := sorry

/-- Unit test: `ℚ(√−3)` has `|d| = 3`; the reversed pole sign would violate this. -/
example : poitouLowerBound 2 0 1 ≤ Real.log 3 := sorry

/-- Unit test: `ℚ(√5)` has `|d| = 5`; this checks the `r₁` terms. -/
example : poitouLowerBound 2 2 (3 / 2) ≤ Real.log 5 := sorry

/-- The Odlyzko–Poitou unconditional bound. -/
theorem poitouLowerBound_le_log_abs_discr (K : Type*) [Field K] [NumberField K] {b : ℝ}
    (hb : 0 < b) :
    poitouLowerBound (finrank ℚ K) (nrRealPlaces K) b ≤ Real.log |(discr K : ℝ)| := sorry

theorem ten_lt_rootDiscr_of_isTotallyComplex (K : Type*) [Field K] [NumberField K]
    [IsTotallyComplex K] (h : 24 ≤ finrank ℚ K) : 10 < rootDiscr K := sorry

theorem twelve_lt_rootDiscr_of_isTotallyComplex (K : Type*) [Field K] [NumberField K]
    [IsTotallyComplex K] (h : 36 ≤ finrank ℚ K) : 12 < rootDiscr K := sorry

/-! ## R25.2 — the Tate–Serre base case -/

section Residual

variable {F : Type*} [Field F] [Fintype F] [TopologicalSpace F] [DiscreteTopology F]

/-- Level one: absolutely irreducible, odd, unramified outside `p`. -/
def IsLevelOneResidual (p : ℕ) (ρ : ResidualRep F) : Prop :=
  IsAbsolutelyIrreducible ρ ∧ IsOdd ρ ∧ ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ p → IsUnramifiedAt ℓ ρ

theorem isOdd_of_ringChar_two (h : ringChar F = 2) (ρ : ResidualRep F) : IsOdd ρ := sorry

theorem IsLevelOneResidual.conj {p : ℕ} {ρ ρ' : ResidualRep F} (g : GL (Fin 2) F)
    (hconj : ∀ σ, ρ' σ = g * ρ σ * g⁻¹) (hρ : IsLevelOneResidual p ρ) :
    IsLevelOneResidual p ρ' := sorry

theorem det_eq_one_of_char_two [CharP F 2] (ρ : ResidualRep F)
    (hρ : ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 2 → IsUnramifiedAt ℓ ρ) (σ : Field.absoluteGaloisGroup ℚ) :
    Matrix.det ((ρ σ : GL (Fin 2) F) : Matrix (Fin 2) (Fin 2) F) = 1 := sorry

theorem not_isAbsolutelyIrreducible_of_tame {p : ℕ} (hp : p = 2 ∨ p = 3) [CharP F p]
    (ρ : ResidualRep F) (hρ : ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ p → IsUnramifiedAt ℓ ρ)
    (htame : wildInertiaImage p ρ = ⊥) : ¬ IsAbsolutelyIrreducible ρ := sorry

/-- Tate's theorem. -/
theorem tate_no_levelOne_char_two [CharP F 2] (ρ : ResidualRep F)
    (hρ : ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 2 → IsUnramifiedAt ℓ ρ) : ¬ IsAbsolutelyIrreducible ρ :=
  sorry

/-- Serre's mod-3 theorem. -/
theorem serre_no_levelOne_char_three [CharP F 3] (ρ : ResidualRep F) :
    ¬ IsLevelOneResidual 3 ρ := sorry

/-- The Tate–Serre base case (DP23, Theorem 1.1). -/
theorem not_isLevelOneResidual_of_le_three {p : ℕ} (hp : p = 2 ∨ p = 3) [CharP F p]
    (ρ : ResidualRep F) : ¬ IsLevelOneResidual p ρ := sorry

end Residual

/-- Irreducible finite subgroups of `SL₂(F̄₂)`: dihedral with 2-subgroups of order `≤ 2`,
or of order at least `60`. -/
theorem dihedral_or_SL2_of_irreducible_char_two
    (G : Subgroup (GL (Fin 2) (AlgebraicClosure (ZMod 2)))) [Finite G]
    (hdet : ∀ g ∈ G, Matrix.det (g : Matrix (Fin 2) (Fin 2) _) = 1)
    (hG : IsIrreducibleSubgroup G) :
    (∃ r : ℕ, Odd r ∧ 3 ≤ r ∧ Nonempty (G ≃* DihedralGroup r)) ∨ 60 ≤ Nat.card G := sorry

/-- Irreducible finite subgroups of `GL₂(F̄₃)` with `3 ∣ |G|`. -/
theorem twentyFour_dvd_card_of_irreducible_char_three
    (G : Subgroup (GL (Fin 2) (AlgebraicClosure (ZMod 3)))) [Finite G]
    (hG : IsIrreducibleSubgroup G) (h3 : 3 ∣ Nat.card G) :
    24 ∣ Nat.card G ∧ (padicValNat 3 (Nat.card G) = 1 ∨ 720 ≤ Nat.card G) := sorry

/-! ## Finite flat group schemes over `ℤ` (placeholders; owned by R07.1) -/

/-- The category of finite flat commutative group schemes over `ℤ` (Tau Ceti). -/
abbrev FFGroupScheme := TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat (CommRingCat.of ℤ)

/-- The order (rank) of a finite flat group scheme. -/
def order (G : FFGroupScheme) : ℕ := sorry

/-- `G` is killed by `n`. -/
def IsKilledBy (G : FFGroupScheme) (n : ℕ) : Prop := sorry

/-- No closed flat subgroup schemes other than `0` and `G`. -/
def IsSimpleGroupScheme (G : FFGroupScheme) : Prop := sorry

/-- Étale, constant and diagonalizable (Cartier dual constant) group schemes. -/
def IsEtaleGroupScheme (G : FFGroupScheme) : Prop := sorry
def IsConstantGroupScheme (G : FFGroupScheme) : Prop := sorry
def IsDiagonalizableGroupScheme (G : FFGroupScheme) : Prop := sorry

/-- The constant group scheme `ℤ/2ℤ` and the diagonalizable `μ₂` over `ℤ`. -/
def zModTwoScheme : FFGroupScheme := sorry
def muTwoScheme : FFGroupScheme := sorry

/-- `0 → M → G → C → 0` is exact, with `M` a closed flat subgroup scheme. -/
def IsShortExact (M G C : FFGroupScheme) : Prop := sorry

/-- Every extension `0 → B → E → A → 0` splits. -/
def Ext1Vanishes (A B : FFGroupScheme) : Prop := sorry

/-- The field `ℚ(G(ℚ̄))` generated by the points of `G`. -/
def torsionField (G : FFGroupScheme) : IntermediateField ℚ (AlgebraicClosure ℚ) := sorry

/-! ## R25.1 — the torsion-field bound -/

/-- Fontaine's bound over `ℤ`: `rd < p^{1 + 1/(p − 1)}` for the field of points of a group
scheme killed by `p`. -/
theorem rootDiscr_torsionField_lt (p : ℕ) [Fact p.Prime]
    (G : FFGroupScheme) (hG : IsKilledBy G p) :
    rootDiscr (torsionField G) < (p : ℝ) ^ ((1 : ℝ) + 1 / (p - 1)) := sorry

/-! ## R25.3 — Fontaine's theorem -/

section Fontaine

/-- R11.1: good reduction at every prime. -/
def HasGoodReductionEverywhere (A : TauCeti.AlgebraicGeometry.AbelianVariety ℚ) : Prop := sorry

theorem isConstant_of_etale_over_int (G : FFGroupScheme) (hG : IsEtaleGroupScheme G) :
    IsConstantGroupScheme G := sorry

theorem isPGroup_two_of_rootDiscr_lt_four (L : IntermediateField ℚ (AlgebraicClosure ℚ))
    [FiniteDimensional ℚ L] [IsGalois ℚ L]
    (hL : ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 2 → ¬ (ℓ : ℤ) ∣ NumberField.discr L)
    (hrd : NumberField.rootDiscr L < 4) : ∃ k : ℕ, finrank ℚ L = 2 ^ k := sorry

theorem simple_two_groupScheme_over_int (G : FFGroupScheme) (h2 : ∃ k, order G = 2 ^ k)
    (hG : IsSimpleGroupScheme G) : Nonempty (G ≅ zModTwoScheme) ∨ Nonempty (G ≅ muTwoScheme) :=
  sorry

theorem ext_muTwo_zModTwo_eq_zero : Ext1Vanishes muTwoScheme zModTwoScheme := sorry

theorem exists_diagonalizable_constant_filtration (G : FFGroupScheme)
    (h2 : ∃ k, order G = 2 ^ k) :
    ∃ (M C : FFGroupScheme), IsDiagonalizableGroupScheme M ∧ IsConstantGroupScheme C ∧
      IsShortExact M G C ∧ order M * order C = order G := sorry

/-- Unit check: `μ₂` and `ℤ/2ℤ` are different over `ℤ` (connected versus étale at `2`). -/
example : IsEmpty (muTwoScheme ≅ zModTwoScheme) := sorry

/-- A2/A3 placeholder: `A` and `B` are isogenous over `k`. -/
def IsIsogenous {k : Type*} [Field k] (A B : TauCeti.AlgebraicGeometry.AbelianVariety k) :
    Prop := sorry

/-- A6 placeholder: the number of `k`-rational points of `A`. -/
def numPoints {k : Type*} [Field k] (A : TauCeti.AlgebraicGeometry.AbelianVariety k) : ℕ :=
  sorry

theorem card_points_eq_of_isogeny {k : Type*} [Field k] [Fintype k]
    (A B : TauCeti.AlgebraicGeometry.AbelianVariety k) (h : IsIsogenous A B) :
    numPoints A = numPoints B := sorry

/-- Fontaine's theorem. -/
theorem dim_eq_zero_of_goodReduction_everywhere (A : TauCeti.AlgebraicGeometry.AbelianVariety ℚ)
    (hA : HasGoodReductionEverywhere A) : A.dim = 0 := sorry

end Fontaine

/-! ## R25.4 — Schoof's theorem -/

section Schoof

/-- Finite flat commutative group schemes over `ℤ[1/l]` (Tau Ceti). -/
abbrev FFGroupSchemeAway (l : ℕ) :=
  TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat (CommRingCat.of (Localization.Away (l : ℤ)))

/-- R07.1 placeholders over `ℤ[1/l]`. -/
def IsSimpleAway {l : ℕ} (G : FFGroupSchemeAway l) : Prop := sorry
def zModPAway (l p : ℕ) : FFGroupSchemeAway l := sorry
def muPAway (l p : ℕ) : FFGroupSchemeAway l := sorry
def Ext1VanishesAway {l : ℕ} (A B : FFGroupSchemeAway l) : Prop := sorry

/-- The category `D(p, l)`: `p`-group schemes over `ℤ[1/l]` on whose points every inertia
element above `l` satisfies `(σ − 1)² = 0` (the Galois condition is a placeholder for R01.2). -/
def SemistableCategory (p l : ℕ) (G : FFGroupSchemeAway l) : Prop := sorry

theorem SemistableCategory.zModP (p l : ℕ) : SemistableCategory p l (zModPAway l p) := sorry
theorem SemistableCategory.muP (p l : ℕ) : SemistableCategory p l (muPAway l p) := sorry

/-- R11.1/R11.3: good reduction outside `l` and semistable reduction at `l`. -/
def IsSemistableGoodOutside (l : ℕ) (A : TauCeti.AlgebraicGeometry.AbelianVariety ℚ) : Prop :=
  sorry

/-- Schoof's criterion (Proposition 3.1). -/
theorem no_semistable_of_simple_and_ext (l p : ℕ) (hlp : l ≠ p)
    (hsimple : ∀ G : FFGroupSchemeAway l, SemistableCategory p l G → IsSimpleAway G →
      Nonempty (G ≅ zModPAway l p) ∨ Nonempty (G ≅ muPAway l p))
    (hext : Ext1VanishesAway (muPAway l p) (zModPAway l p))
    (A : TauCeti.AlgebraicGeometry.AbelianVariety ℚ) (hA : IsSemistableGoodOutside l A) :
    A.dim = 0 := sorry

/-- Corollary 4.2 for `p ∈ {2, 3}`: the five pairs used. -/
theorem ext_muP_zModP_eq_zero (l p : ℕ)
    (h : (l, p) = (2, 3) ∨ (l, p) = (3, 2) ∨ (l, p) = (5, 2) ∨ (l, p) = (7, 3) ∨
      (l, p) = (13, 2)) :
    Ext1VanishesAway (muPAway l p) (zModPAway l p) := sorry

/-- The degree bounds of R25.1 used by Schoof's cases; row (a) as an example. -/
theorem finrank_le_of_rootDiscr_lt_of_isTotallyComplex (K : Type*) [Field K] [NumberField K]
    [IsTotallyComplex K] (h : rootDiscr K < 8.25) : finrank ℚ K ≤ 14 := sorry

/-- Unit check: `ℚ(i, √13)` has class number one (Minkowski bound ≈ 7.90). -/
example (K : Type*) [Field K] [NumberField K]
    [IsSplittingField ℚ K ((X ^ 2 + 1) * (X ^ 2 - 13))] : NumberField.classNumber K = 1 :=
  sorry

/-- Schoof's theorem (Theorem 1.1). -/
theorem no_semistable_abelianVariety_one_prime (l : ℕ) (hl : l ∈ ({2, 3, 5, 7, 13} : Finset ℕ))
    (A : TauCeti.AlgebraicGeometry.AbelianVariety ℚ) (hA : IsSemistableGoodOutside l A) :
    A.dim = 0 := sorry

end Schoof

/-! ## R25.5 — GL₂-type realisation and terminal cases -/

section Terminal

/-- A6 placeholder: the endomorphism algebra `End(A) ⊗ ℚ`. -/
def endZeroAlgebra (A : TauCeti.AlgebraicGeometry.AbelianVariety ℚ) : Type := sorry
instance (A : TauCeti.AlgebraicGeometry.AbelianVariety ℚ) : Ring (endZeroAlgebra A) := sorry

/-- An abelian variety over `ℚ` of `GL₂(K)`-type. -/
structure IsGL2Type (A : TauCeti.AlgebraicGeometry.AbelianVariety ℚ) (K : Type*) [Field K]
    [NumberField K] where
  toEnd : K →+* endZeroAlgebra A
  finrank_eq : Module.finrank ℚ K = A.dim

/-- R01.2/R24 placeholder: an odd, finitely ramified, weight-two `p`-adic representation. -/
def IsOddWeightTwo {E : Type*} [Field E] (p : ℕ) (ρ : Field.absoluteGaloisGroup ℚ →* GL (Fin 2) E) :
    Prop := sorry

/-- Placeholder: `ρ` is `V_λ(A) ⊗ ℚ̄_p` for some GL₂-type `A` over `ℚ`. -/
def ComesFromGL2Type {E : Type*} [Field E] (p : ℕ)
    (ρ : Field.absoluteGaloisGroup ℚ →* GL (Fin 2) E) : Prop := sorry

/-- Snowden's (A1) for a residual representation: absolutely irreducible over `ℚ(ζ_p)`. -/
def SatisfiesA1Residual {F : Type*} [Field F] [TopologicalSpace F] (ρ : ResidualRep F) : Prop :=
  sorry

/-- Snowden's (A1): the residual representation is absolutely irreducible over `ℚ(ζ_p)`. -/
def SatisfiesA1 {E : Type*} [Field E] (p : ℕ) (ρ : Field.absoluteGaloisGroup ℚ →* GL (Fin 2) E) :
    Prop := sorry

/-- Snowden's realisation (Proposition 9.4.1 over `ℚ`). -/
theorem comesFromGL2Type_of_weightTwo {E : Type*} [Field E] (p : ℕ) [Fact p.Prime]
    (ρ : Field.absoluteGaloisGroup ℚ →* GL (Fin 2) E) (hρ : IsOddWeightTwo p ρ)
    (hA1 : SatisfiesA1 p ρ) : ComesFromGL2Type p ρ := sorry

/-- R15.4 placeholder: Serre's weight, normalised by a twist to `2 ≤ k ≤ p + 1`. -/
def serreWeight {F : Type*} [Field F] [Fintype F] [TopologicalSpace F] (ρ : ResidualRep F) : ℕ :=
  sorry

variable {F : Type*} [Field F] [Fintype F] [TopologicalSpace F] [DiscreteTopology F]

/-- Wintenberger: level-one dihedral representations need `p ≡ 3 mod 4` and `h(ℚ(√−p)) > 1`;
the consequence used is that `(A1)` holds at `p ∈ {5, 7, 13}`. -/
theorem levelOne_dihedral_classification (p : ℕ) (hp : p ∈ ({5, 7, 13} : Finset ℕ)) [CharP F p]
    (ρ : ResidualRep F) (hρ : IsLevelOneResidual p ρ) : SatisfiesA1Residual ρ := sorry

/-- No level-one representation of Serre weight `2`. -/
theorem not_levelOne_weight_two (p : ℕ) [Fact p.Prime] [CharP F p] (ρ : ResidualRep F)
    (hρ : IsLevelOneResidual p ρ) : serreWeight ρ ≠ 2 := sorry

/-- No level-one representation of weight `p + 1` for `p ∈ {5, 7, 13}` (Schoof). -/
theorem not_levelOne_weight_succ_of_schoofPrime (p : ℕ) (hp : p ∈ ({5, 7, 13} : Finset ℕ))
    [CharP F p] (ρ : ResidualRep F) (hρ : IsLevelOneResidual p ρ) : serreWeight ρ ≠ p + 1 :=
  sorry

/-- Khare–Wintenberger: no level-one representation of weight at most `8` or `14`. -/
theorem not_levelOne_small_weight (p : ℕ) [Fact p.Prime] [CharP F p] (ρ : ResidualRep F)
    (hρ : IsLevelOneResidual p ρ) : 8 < serreWeight ρ ∧ serreWeight ρ ≠ 14 := sorry

open scoped MatrixGroups in
/-- Unit check: the terminal weights `2, 4, 6, 8` carry no level-one cusp forms
(Mathlib's `CuspForm.rank_eq_zero_of_weight_lt_twelve`). -/
example (k : ℤ) (hk : k < 12) : Module.rank ℂ (CuspForm 𝒮ℒ k) = 0 := sorry

end Terminal

/-! ## R25.6 — the base-case table -/

/-- One row of the base-case table. -/
structure BaseCaseRow where
  characteristic : Option ℕ
  weights : Set ℕ
  levelOne : Bool
  imageCondition : String
  coefficientCondition : String
  supplier : String
  consumer : String
  localCheck : String

/-- The nine rows (the degenerate branches are recorded in the roadmap document). -/
def baseCases : List BaseCaseRow := sorry

/-- The table has the nine rows listed in the roadmap document. -/
theorem baseCases_length : baseCases.length = 9 := sorry

/-- Every row names a supplier node of this roadmap or a supplier stage. -/
theorem baseCases_supplier_ne_empty : ∀ r ∈ baseCases, r.supplier ≠ "" := sorry

end TauCeti.SmallRamification
