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

/-!
# Small ramification and the Tate–Serre base case — suggested declarations (first checkpoint)

This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. All proposed results are unproved prototypes at the pinned baseline
(Mathlib 082e2d3, Tau Ceti f790474); the file has not been compiled.

Layers covered: R25.1 (explicit discriminant bounds: the local root-discriminant exponent,
the 2-adic and 3-adic bounds, Minkowski thresholds, the Odlyzko–Poitou bound) and R25.2
(Tate's theorem, Serre's mod-3 theorem, the combined base case).

Objects imported from other roadmaps appear as placeholders named after their owners'
planned declarations:

* `differentExponent`, `ramificationIndex`, `inertiaSubgroup`, `wildInertiaSubgroup`,
  `principalUnits` — Tau Ceti LocalFieldsRamification, Layers 1, 3 and 4;
* `IsCompletionAbove` — Tau Ceti NumberFieldArithmetic, Layers 5–6;
* `IsAbsolutelyIrreducible`, `IsOdd`, `IsUnramifiedAt`, `wildInertiaImage` —
  ArithmeticGaloisRepresentations R01.1–R01.2;
* `IsIrreducibleSubgroup` — ArithmeticGaloisRepresentations R01.4 (Dickson).

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

/-- Local characters of order prime to `p` have inertia image of order dividing `p − 1`. -/
theorem orderOf_map_inertia_dvd_sub_one (p : ℕ) [Fact p.Prime] (E : Type*) [Field E]
    [Algebra ℚ_[p] E] [FiniteDimensional ℚ_[p] E] [IsGalois ℚ_[p] E]
    {F : Type*} [Field F] [Fintype F] [CharP F p] (ψ : (E ≃ₐ[ℚ_[p]] E) →* Fˣ)
    {σ : E ≃ₐ[ℚ_[p]] E} (hσ : σ ∈ inertiaSubgroup p E) : orderOf (ψ σ) ∣ p - 1 := sorry

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

end TauCeti.SmallRamification
