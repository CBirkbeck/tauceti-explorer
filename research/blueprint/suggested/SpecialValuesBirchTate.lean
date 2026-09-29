/-
Copyright (c) 2026 Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.NumberTheory.NumberField.DedekindZeta
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.NumberTheory.NumberField.Discriminant.Defs
import Mathlib.NumberTheory.LSeries.HurwitzZetaValues
import Mathlib.NumberTheory.LSeries.DirichletContinuation
import Mathlib.NumberTheory.LSeries.Convolution
import Mathlib.NumberTheory.LegendreSymbol.QuadraticChar.Basic
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.NumberTheory.Cyclotomic.Basic
import Mathlib.Analysis.SpecialFunctions.Gamma.Deligne
import Mathlib.RingTheory.DedekindDomain.SInteger
import Mathlib.RingTheory.Ideal.Norm.AbsNorm
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.FieldTheory.Galois.Abelian
import Mathlib.RingTheory.Localization.Away.Basic
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Trivial
import TauCeti.NumberTheory.ArithmeticDirichletSeries.EulerProduct.Data
import TauCeti.NumberTheory.NumberField.Quadratic.RingOfIntegers

/-!
# Birch–Tate and arithmetic special values — suggested declarations (first checkpoint)

This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. All proposed results are unproved prototypes at the pinned baseline
(Mathlib 082e2d3, Tau Ceti f790474); the file has not been compiled.

Layers covered: B.1 (the formula), B.2 (sign and equivalent forms), B.3 (ℚ and ℚ(√5)),
B.4 (the odd-primary theorem), B.5 (totally real abelian fields, with the 2-primary part),
B.7 (S-integers and Euler factors), B.8 (the Lichtenbaum statements and their odd part in even weight).

Three objects are imported from other roadmaps and are not planned here. Until their owners
land they appear below as placeholders named after the owners' planned declarations:

* `dedekindZetaCont F`, `completedDedekindZetaCont F` — the continued and completed Dedekind
  zeta function (AutomorphicLFunctionsAndLocalFactors AL.1, requested);
* `K2 R` — classical `K₂` of a ring (K2SymbolsBrauer T.1/k2-definition);
* `wInvariant i F` — `w_i(F) = #H⁰(F, ℚ/ℤ(i))` (ArithmeticKTheory N.4/the-w-invariant).

The facts about them used below (continuation, functional equation, finiteness, `K₂(ℤ)`,
the tame-kernel sequence, `w₂(ℚ) = 24`) are proved by those owners.
-/

noncomputable section

open NumberField NumberField.InfinitePlace Complex IsDedekindDomain
open scoped Real

universe u

namespace TauCeti.BirchTate

/-! ## Imported objects (placeholders; owned elsewhere) -/

/-- AL.1 (requested): the Dedekind zeta function continued to `ℂ ∖ {1}`. -/
def dedekindZetaCont (F : Type*) [Field F] [NumberField F] : ℂ → ℂ := sorry

/-- AL.1 (requested): the completed zeta function
`Λ_F(s) = |d_F|^{s/2} Γ_ℝ(s)^{r₁} Γ_ℂ(s)^{r₂} ζ_F(s)`, holomorphic on `ℂ ∖ {0, 1}`. -/
def completedDedekindZetaCont (F : Type*) [Field F] [NumberField F] : ℂ → ℂ := sorry

/-- K2SymbolsBrauer T.1/k2-definition: classical `K₂` of a ring. -/
def K2 (R : Type u) [CommRing R] : Type u := sorry

/-- ArithmeticKTheory N.4/the-w-invariant: `w_i(F) = #H⁰(F, ℚ/ℤ(i))`. -/
def wInvariant (i : ℤ) (F : Type*) [Field F] : ℕ := sorry

section Imported
variable (F : Type*) [Field F] [NumberField F]

/-- AL.1: agreement with Mathlib's L-series on `Re s > 1`. -/
theorem dedekindZetaCont_eq (s : ℂ) (hs : 1 < s.re) :
    dedekindZetaCont F s = dedekindZeta F s := by sorry

/-- AL.1: the functional equation of the completed function. -/
theorem completedDedekindZetaCont_one_sub (s : ℂ) :
    completedDedekindZetaCont F (1 - s) = completedDedekindZetaCont F s := by sorry

/-- AL.1: the completed function on `Re s > 1`. -/
theorem completedDedekindZetaCont_eq (s : ℂ) (hs : 1 < s.re) :
    completedDedekindZetaCont F s = (|discr F| : ℂ) ^ (s / 2) * Gammaℝ s ^ nrRealPlaces F *
      Gammaℂ s ^ nrComplexPlaces F * dedekindZetaCont F s := by sorry

/-- ArithmeticKTheory N.3/finiteness-and-ranks-combined: `K₂(𝓞_F)` is finite. -/
theorem finite_K2_ringOfIntegers : Finite (K2 (𝓞 F)) := by sorry

/-- ArithmeticKTheory N.4/finiteness-of-the-w-invariant: `w₂(F) ≥ 1`. -/
theorem wInvariant_two_pos : 0 < wInvariant 2 F := by sorry

end Imported

/-! ## B.1 The Birch–Tate formula -/

section Formula
variable (F : Type*) [Field F] [NumberField F]

/-- B.1/birch-tate-formula: `ζ_F(−1) = (−1)^{[F:ℚ]} #K₂(𝓞_F) / w₂(F)`. The Birch–Tate
conjecture is `∀ F, IsTotallyReal F → BirchTateFormula F`. -/
def BirchTateFormula : Prop :=
  dedekindZetaCont F (-1) =
    (-1 : ℂ) ^ Module.finrank ℚ F * (Nat.card (K2 (𝓞 F)) : ℂ) / (wInvariant 2 F : ℂ)

theorem birchTateFormula_iff_mul :
    BirchTateFormula F ↔ (wInvariant 2 F : ℂ) * dedekindZetaCont F (-1) =
      (-1 : ℂ) ^ Module.finrank ℚ F * (Nat.card (K2 (𝓞 F)) : ℂ) := by sorry

theorem BirchTateFormula.zeta_ne_zero {F : Type*} [Field F] [NumberField F]
    (h : BirchTateFormula F) : dedekindZetaCont F (-1) ≠ 0 := by sorry

/-- Also B.2/denominator-consequence. -/
theorem BirchTateFormula.w2_mul_zeta_eq_intCast {F : Type*} [Field F] [NumberField F]
    (h : BirchTateFormula F) : (wInvariant 2 F : ℂ) * dedekindZetaCont F (-1) =
      (((-1 : ℤ) ^ Module.finrank ℚ F * Nat.card (K2 (𝓞 F)) : ℤ) : ℂ) := by sorry

/-- Unit test: the formula for `ℚ` from its three values. -/
theorem birchTateFormula_rat_of_values (hζ : dedekindZetaCont ℚ (-1) = -1 / 12)
    (hK : Nat.card (K2 (𝓞 ℚ)) = 2) (hw : wInvariant 2 ℚ = 24) : BirchTateFormula ℚ := by sorry

/-- Unit test: the twist matters; `w₁(ℚ) = 2` in place of `w₂(ℚ)` fails. -/
theorem not_birchTateFormula_rat_twist_one (hζ : dedekindZetaCont ℚ (-1) = -1 / 12)
    (hK : Nat.card (K2 (𝓞 ℚ)) = 2) (hw : wInvariant 1 ℚ = 2) :
    dedekindZetaCont ℚ (-1) ≠
      (-1 : ℂ) ^ Module.finrank ℚ ℚ * (Nat.card (K2 (𝓞 ℚ)) : ℂ) / (wInvariant 1 ℚ : ℂ) := by
  sorry

/-- Unit test: the sign matters. -/
theorem not_birchTateFormula_rat_unsigned (hζ : dedekindZetaCont ℚ (-1) = -1 / 12)
    (hK : Nat.card (K2 (𝓞 ℚ)) = 2) (hw : wInvariant 2 ℚ = 24) :
    dedekindZetaCont ℚ (-1) ≠ (Nat.card (K2 (𝓞 ℚ)) : ℂ) / (wInvariant 2 ℚ : ℂ) := by sorry

/-- Unit test: `K₂` of the field `ℚ` is infinite, so `Nat.card` is `0`; the ring of integers
is required. -/
theorem not_birchTateFormula_rat_field (hζ : dedekindZetaCont ℚ (-1) = -1 / 12)
    (hinf : Infinite (K2 ℚ)) (hw : wInvariant 2 ℚ = 24) :
    dedekindZetaCont ℚ (-1) ≠
      (-1 : ℂ) ^ Module.finrank ℚ ℚ * (Nat.card (K2 ℚ) : ℂ) / (wInvariant 2 ℚ : ℂ) := by sorry

/-- Unit test: a vanishing zeta value (a field with a complex place, e.g. `ℚ(i)`) fails. -/
theorem not_birchTateFormula_of_zeta_eq_zero (hζ : dedekindZetaCont F (-1) = 0) :
    ¬ BirchTateFormula F := by sorry

end Formula

/-! ## B.2 Sign, rationality and equivalent formulations -/

/-- B.2/gamma-factor-values. -/
theorem gammaℝ_neg_one : Gammaℝ (-1) = -2 * π ∧ Gammaℝ 2 = 1 / π := by sorry

/-- B.2/dedekind-zeta-real-positive. -/
theorem one_le_dedekindZeta_ofReal (F : Type*) [Field F] [NumberField F] {σ : ℝ} (hσ : 1 < σ) :
    ∃ x : ℝ, 1 ≤ x ∧ dedekindZeta F σ = x := by sorry

section Sign
variable (F : Type*) [Field F] [NumberField F]

/-- B.2/zeta-via-reciprocal-gamma. Lean's `(Gammaℝ s)⁻¹` is the entire reciprocal: at a pole
of `Γ_ℝ` the totalised `Gammaℝ s` is `0` and its inverse is `0`, the value of `1/Γ_ℝ` there. -/
theorem dedekindZeta_eq_inv_gamma_mul_completed (s : ℂ) (h0 : s ≠ 0) (h1 : s ≠ 1) :
    dedekindZetaCont F s = (|discr F| : ℂ) ^ (-s / 2) * (Gammaℝ s)⁻¹ ^ nrRealPlaces F *
      (Gammaℂ s)⁻¹ ^ nrComplexPlaces F * completedDedekindZetaCont F s := by sorry

/-- B.2/zeta-minus-one-sign, the explicit value. -/
theorem dedekindZetaCont_neg_one_eq [IsTotallyReal F] :
    dedekindZetaCont F (-1) = (-1 : ℂ) ^ Module.finrank ℚ F * (|discr F| : ℂ) ^ (3 / 2 : ℂ) *
      dedekindZeta F 2 / (2 * π ^ 2) ^ Module.finrank ℚ F := by sorry

/-- B.2/zeta-minus-one-sign. -/
theorem neg_one_pow_mul_dedekindZeta_neg_one_pos [IsTotallyReal F] :
    ∃ x : ℝ, 0 < x ∧ (-1 : ℂ) ^ Module.finrank ℚ F * dedekindZetaCont F (-1) = x := by sorry

/-- B.2/formula-fails-with-complex-place. -/
theorem not_birchTateFormula_of_nrComplexPlaces_pos (h : 0 < nrComplexPlaces F) :
    dedekindZetaCont F (-1) = 0 ∧ ¬ BirchTateFormula F := by sorry

/-- B.2/birch-tate-iff-absolute-value. -/
theorem birchTateFormula_iff_abs [IsTotallyReal F] :
    BirchTateFormula F ↔
      ‖dedekindZetaCont F (-1)‖ = (Nat.card (K2 (𝓞 F)) : ℝ) / wInvariant 2 F := by sorry

/-- B.2/birch-tate-iff-valuations: given the rational value (rationality is requested from
AutomorphicPadicLFunctions L3). -/
theorem birchTateFormula_iff_padicValRat [IsTotallyReal F] (q : ℚ)
    (hq : dedekindZetaCont F (-1) = q) :
    BirchTateFormula F ↔ ∀ ℓ : ℕ, ℓ.Prime →
      (padicValNat ℓ (Nat.card (K2 (𝓞 F))) : ℤ) = padicValNat ℓ (wInvariant 2 F) +
        padicValRat ℓ |q| := by sorry

end Sign

/-- B.2/positive-rational-from-valuations. -/
theorem rat_eq_iff_forall_padicValRat_eq {q r : ℚ} (hq : 0 < q) (hr : 0 < r) :
    q = r ↔ ∀ p : ℕ, p.Prime → padicValRat p q = padicValRat p r := by sorry

example : ¬ ((-1 : ℚ) = 1) ∧ ∀ p : ℕ, p.Prime → padicValRat p (-1) = padicValRat p 1 := by
  sorry

/-! ## B.3 The rationals and `ℚ(√5)` -/

/-- B.3/dedekind-zeta-of-the-rationals. -/
theorem dedekindZeta_rat_eq_riemannZeta (s : ℂ) (hs : s ≠ 1) :
    dedekindZetaCont ℚ s = riemannZeta s := by sorry

/-- B.3/zeta-of-the-rationals-at-minus-one. -/
theorem dedekindZeta_rat_neg_one : dedekindZetaCont ℚ (-1) = -1 / 12 := by sorry

/-- B.3/k2-of-the-rationals-ring-of-integers (through `𝓞 ℚ ≃+* ℤ` and T.5's `K₂(ℤ) ≅ ℤ/2`). -/
theorem natCard_K2_ringOfIntegers_rat : Nat.card (K2 (𝓞 ℚ)) = 2 := by sorry

/-- B.3/birch-tate-for-the-rationals. -/
theorem birchTateFormula_rat : BirchTateFormula ℚ := by sorry

section SqrtFive
open Polynomial

instance fact_prime_five : Fact (Nat.Prime 5) := ⟨by norm_num⟩

/-- The quadratic character mod 5, `χ₅(n) = (n/5)`, as a Dirichlet character. -/
abbrev chiFive : DirichletCharacter ℂ 5 := (quadraticChar (ZMod 5)).ringHomComp (Int.castRingHom ℂ)

variable (K : Type*) [Field K] [NumberField K] {θ : 𝓞 K}
  (hmin : minpoly ℤ θ = X ^ 2 - C 5) (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)
include hmin hgen

/-- B.3/sqrt-five-ideal-count. -/
theorem dedekindZetaCoeff_sqrtFive_eq_convolution (n : ℕ) (hn : n ≠ 0) :
    (dedekindZetaCoeff K n : ℂ) = ∑ d ∈ n.divisors, chiFive d := by sorry

/-- B.3/sqrt-five-zeta-factorisation. -/
theorem dedekindZeta_sqrtFive_eq_mul_LFunction (s : ℂ) (hs : s ≠ 1) :
    dedekindZetaCont K s = riemannZeta s * DirichletCharacter.LFunction chiFive s := by sorry

/-- B.3/sqrt-five-zeta-at-minus-one. -/
theorem dedekindZeta_sqrtFive_neg_one :
    DirichletCharacter.LFunction chiFive (-1) = -2 / 5 ∧ dedekindZetaCont K (-1) = 1 / 30 := by
  sorry

/-- B.3/sqrt-five-w2. -/
theorem wInvariant_two_sqrtFive : wInvariant 2 K = 120 := by sorry

/-- B.3/sqrt-five-birch-tate-check, from the certified order requested from T.5. -/
theorem birchTateFormula_sqrtFive (hK : Nat.card (K2 (𝓞 K)) = 4) : BirchTateFormula K := by sorry

end SqrtFive

/-! ## B.7 S-integers and Euler factors -/

/-- B.7/s-modified-dedekind-zeta: `ζ_{F,S}(s) = ζ_F(s) ∏_{v ∈ S} (1 − Nv^{−s})`. -/
def sModifiedZeta (F : Type*) [Field F] [NumberField F]
    (S : Finset (HeightOneSpectrum (𝓞 F))) (s : ℂ) : ℂ :=
  dedekindZetaCont F s * ∏ v ∈ S, (1 - ((Ideal.absNorm v.asIdeal : ℕ) : ℂ) ^ (-s))

section SIntegers
variable {F : Type*} [Field F] [NumberField F]

@[simp] theorem sModifiedZeta_empty : sModifiedZeta F ∅ = dedekindZetaCont F := by sorry

theorem sModifiedZeta_insert (S : Finset (HeightOneSpectrum (𝓞 F))) {v : HeightOneSpectrum (𝓞 F)}
    (hv : v ∉ S) (s : ℂ) : sModifiedZeta F (insert v S) s =
      sModifiedZeta F S s * (1 - ((Ideal.absNorm v.asIdeal : ℕ) : ℂ) ^ (-s)) := by sorry

/-- On `Re s > 1`: the L-series of the ideal count restricted to ideals prime to `S`
(Tau Ceti's `EulerProductData.restrictAway` of the trivial data). -/
theorem sModifiedZeta_eq_LSeries_restrictAway (S : Finset (HeightOneSpectrum (𝓞 F))) (s : ℂ)
    (hs : 1 < s.re) : sModifiedZeta F S s =
      LSeries (fun n ↦ (Nat.card {I : Ideal (𝓞 F) // Ideal.absNorm I = n ∧
        ∀ v ∈ S, ¬ (I ≤ v.asIdeal)} : ℂ)) s := by sorry

/-- B.7/euler-factors-at-minus-one. -/
theorem sModifiedZeta_neg_one (S : Finset (HeightOneSpectrum (𝓞 F))) :
    sModifiedZeta F S (-1) = (-1 : ℂ) ^ S.card * dedekindZetaCont F (-1) *
      ∏ v ∈ S, ((Ideal.absNorm v.asIdeal : ℕ) - 1 : ℂ) := by sorry

/-- Unit test: the empty set. -/
example : sModifiedZeta ℚ ∅ (-1) = -1 / 12 := by sorry

/-- Unit tests at `2` and `3` over `ℚ` (the heights-one primes `(2)` and `(3)` of `𝓞 ℚ`). -/
theorem sModifiedZeta_rat_two_neg_one (v : HeightOneSpectrum (𝓞 ℚ))
    (hv : Ideal.absNorm v.asIdeal = 2) : sModifiedZeta ℚ {v} (-1) = 1 / 12 := by sorry

theorem sModifiedZeta_rat_three_neg_one (v : HeightOneSpectrum (𝓞 ℚ))
    (hv : Ideal.absNorm v.asIdeal = 3) :
    sModifiedZeta ℚ {v} (-1) = 1 / 6 ∧ dedekindZetaCont ℚ (-1) / (1 - 3) ≠ 1 / 6 := by sorry

theorem sModifiedZeta_rat_eq_LSeries (v : HeightOneSpectrum (𝓞 ℚ))
    (hv : Ideal.absNorm v.asIdeal = 2) (s : ℂ) (hs : 1 < s.re) :
    sModifiedZeta ℚ {v} s = (1 - 2 ^ (-s)) * riemannZeta s := by sorry

theorem sModifiedZeta_empty_eq (s : ℂ) : sModifiedZeta F ∅ s = dedekindZetaCont F s := by sorry

/-- B.7/k2-order-of-s-integers. -/
theorem natCard_K2_sInteger (S : Finset (HeightOneSpectrum (𝓞 F))) :
    Nat.card (K2 ((S : Set (HeightOneSpectrum (𝓞 F))).integer F)) =
      Nat.card (K2 (𝓞 F)) * ∏ v ∈ S, (Ideal.absNorm v.asIdeal - 1) := by sorry

/-- B.7/birch-tate-for-s-integers. -/
theorem birchTateFormula_iff_sInteger (S : Finset (HeightOneSpectrum (𝓞 F))) :
    BirchTateFormula F ↔ sModifiedZeta F S (-1) =
      (-1 : ℂ) ^ (Module.finrank ℚ F + S.card) *
        (Nat.card (K2 ((S : Set (HeightOneSpectrum (𝓞 F))).integer F)) : ℂ) /
          (wInvariant 2 F : ℂ) := by sorry

end SIntegers

/-! ## B.4 The odd-primary theorem (Wiles; Kolster, Park City notes, Theorem 3.3) -/

/-- `H²_ét(𝓞_F[1/ℓ], ℤ_ℓ(2))`, a finite group (ArithmeticKTheory N.6). -/
def etaleH2 (F : Type*) [Field F] [NumberField F] (ℓ : ℕ) : Type := sorry

/-- `H¹_ét(𝓞_F[1/ℓ], ℤ_ℓ(2))` (ArithmeticKTheory N.6). -/
def etaleH1 (F : Type*) [Field F] [NumberField F] (ℓ : ℕ) : Type := sorry

section OddPrimary
variable (F : Type*) [Field F] [NumberField F] (ℓ : ℕ)

/-- B.4/k2-ell-part-unchanged-by-inverting-ell. -/
theorem padicValNat_card_K2_localization [Fact ℓ.Prime] :
    padicValNat ℓ (Nat.card (K2 (Localization.Away (ℓ : 𝓞 F)))) =
      padicValNat ℓ (Nat.card (K2 (𝓞 F))) := by sorry

/-- B.4/k2-ell-part-as-etale-cohomology (Tate), in valuation form. -/
theorem K2_tensor_padic_equiv_etale [Fact ℓ.Prime] (hℓ : ℓ ≠ 2) :
    padicValNat ℓ (Nat.card (K2 (𝓞 F))) = padicValNat ℓ (Nat.card (etaleH2 F ℓ)) := by sorry

/-- B.4/w2-ell-part-as-etale-cohomology: for totally real `F`, `H¹_ét(𝓞_F[1/ℓ], ℤ_ℓ(2)) ≅ W₂(F)_ℓ`. -/
theorem card_etaleH1_torsion_eq_wInvariant [Fact ℓ.Prime] (hℓ : ℓ ≠ 2) [IsTotallyReal F] :
    Nat.card (etaleH1 F ℓ) = ℓ ^ padicValNat ℓ (wInvariant 2 F) := by sorry

/-- B.4/etale-euler-characteristic-and-zeta (Kolster, Theorem 3.3 at `χ = 1`, `n = 2`). -/
theorem padicValRat_zeta_neg_one_eq_etale [Fact ℓ.Prime] (hℓ : ℓ ≠ 2) [IsTotallyReal F] (q : ℚ)
    (hq : dedekindZetaCont F (-1) = q) :
    padicValRat ℓ |q| =
      (padicValNat ℓ (Nat.card (etaleH2 F ℓ)) : ℤ) - padicValNat ℓ (wInvariant 2 F) := by sorry

/-- B.4/odd-primary-birch-tate (Wiles). -/
theorem padicValNat_card_K2_odd [Fact ℓ.Prime] (hℓ : ℓ ≠ 2) [IsTotallyReal F] (q : ℚ)
    (hq : dedekindZetaCont F (-1) = q) :
    (padicValNat ℓ (Nat.card (K2 (𝓞 F))) : ℤ) =
      padicValNat ℓ (wInvariant 2 F) + padicValRat ℓ |q| := by sorry

end OddPrimary

/-- B.4, checked arithmetic: for `v ∣ ℓ` the norm `Nv = ℓ^f` gives `ℓ ∤ Nv − 1`, so inverting `ℓ` does not change
the `ℓ`-part of `#K₂` (B.7's factor `∏ (Nv − 1)`). -/
example (ℓ f : ℕ) (hℓ : 2 ≤ ℓ) (hf : 1 ≤ f) : ¬ ℓ ∣ ℓ ^ f - 1 := by
  intro h
  have h1 : ℓ ∣ ℓ ^ f := dvd_pow_self ℓ (by omega)
  have h2 : 1 ≤ ℓ ^ f := Nat.one_le_pow _ _ (by omega)
  have : ℓ ∣ ℓ ^ f - (ℓ ^ f - 1) := Nat.dvd_sub h1 h
  rw [Nat.sub_sub_self h2] at this
  exact absurd (Nat.le_of_dvd one_pos this) (by omega)

/-- B.4 acceptance: `ℚ(√5)`, `w₂ = 120`, `ζ(−1) = 1/30`, so `120 · (1/30) = 4` has no odd part. -/
example : (120 : ℚ) * (1 / 30) = 4 := by norm_num

/-! ## B.8 Lichtenbaum formulas (Kolster, Park City notes, Conjectures 3.6–3.7, Theorem 3.3) -/

/-- `H²(𝓞_F, ℤ(n)) = ∏_p H²_ét(𝓞_F[1/p], ℤ_p(n))`, a finite group (ArithmeticKTheory N.6). -/
def etaleH2Model (F : Type*) [Field F] [NumberField F] (n : ℕ) : Type := sorry

/-- `h_n(F) = #H²(𝓞_F, ℤ(n))`. -/
def hInvariant (F : Type*) [Field F] [NumberField F] (n : ℕ) : ℕ := Nat.card (etaleH2Model F n)

/-- `H¹(𝓞_F, ℤ(n))`, with `H¹ ⊗ ℤ_p ≅ H¹_ét(𝓞_F[1/p], ℤ_p(n))`. -/
def etaleH1Model (F : Type*) [Field F] [NumberField F] (n : ℕ) : Type := sorry

/-- BorelRegulators R.5: the leading coefficient `ζ*_F(1 − n)`. -/
def zetaLeadingCoeff (F : Type*) [Field F] [NumberField F] (n : ℕ) : ℝ := sorry

/-- BorelRegulators R.4: Borel's regulator covolume `R_n^B(F)` (`= 1` in rank zero). -/
def borelRegulator (F : Type*) [Field F] [NumberField F] (n : ℕ) : ℝ := sorry

/-- The ratio `ζ*_F(1 − n)/R_n^B(F)`, rational by Borel's theorem (R.5). -/
def borelRatio (F : Type*) [Field F] [NumberField F] (n : ℕ) : ℚ := sorry

/-- `#K_i(𝓞_F)` and `#K_i(𝓞_F)_tors` for the higher K-groups (ArithmeticKTheory N.3, N.5). -/
def cardK (F : Type*) [Field F] [NumberField F] (i : ℕ) : ℕ := sorry
def cardKTorsion (F : Type*) [Field F] [NumberField F] (i : ℕ) : ℕ := sorry

/-- B.8/lichtenbaum-formula-statements: Conjecture 3.6 away from 2. -/
def LichtenbaumFormulaOddPart (F : Type*) [Field F] [NumberField F] (n : ℕ) : Prop :=
  ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 2 →
    padicValRat ℓ (borelRatio F n) =
      (padicValNat ℓ (cardK F (2 * n - 2)) : ℤ) - padicValNat ℓ (cardKTorsion F (2 * n - 1))

/-- The ℤ-rank and torsion order of `H¹(𝓞_F, ℤ(n))`. -/
def etaleH1ModelRank (F : Type*) [Field F] [NumberField F] (n : ℕ) : ℕ := sorry
def etaleH1ModelTorsionCard (F : Type*) [Field F] [NumberField F] (n : ℕ) : ℕ := sorry

/-- B.8/lichtenbaum-formula-statements: Conjecture 3.7 (motivic), with `R_n^M` from BorelRegulators. -/
def MotivicLichtenbaumFormula (F : Type*) [Field F] [NumberField F] (n : ℕ) (motivicRegulator : ℝ) : Prop :=
  |zetaLeadingCoeff F n| = (hInvariant F n : ℝ) / etaleH1ModelTorsionCard F n * motivicRegulator

section Lichtenbaum
variable (F : Type*) [Field F] [NumberField F]

/-- B.8/odd-primary-even-weight-euler-characteristic (Kolster, Theorem 3.3, Corollary 3.4). -/
theorem padicValRat_zeta_one_sub_eq_etale [IsTotallyReal F] (n : ℕ) (hn : 2 ≤ n) (he : Even n)
    (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 2) (q : ℚ) (hq : dedekindZetaCont F (1 - n) = q) :
    padicValRat ℓ |q| =
      (padicValNat ℓ (hInvariant F n) : ℤ) - padicValNat ℓ (wInvariant n F) := by sorry

/-- B.8/odd-primary-lichtenbaum-totally-real. -/
theorem lichtenbaumFormulaOddPart_of_isTotallyReal [IsTotallyReal F] (n : ℕ) (hn : 2 ≤ n)
    (he : Even n) : LichtenbaumFormulaOddPart F n := by sorry

/-- `rank H¹(𝓞_F, ℤ(n)) = r₁ + r₂` for odd `n`, `r₂` for even `n` (Kolster p. 11 prints them interchanged, E6). -/
theorem rank_etaleH1Model (n : ℕ) (hn : 2 ≤ n) :
    etaleH1ModelRank F n = if Odd n then nrRealPlaces F + nrComplexPlaces F else nrComplexPlaces F := by sorry

/-- `#H¹(𝓞_F, ℤ(n))_tors = w_n(F)`. -/
theorem card_torsion_etaleH1Model (n : ℕ) (hn : 2 ≤ n) :
    etaleH1ModelTorsionCard F n = wInvariant n F := by sorry

/-- `h₂(F) = #K₂(𝓞_F)` (Tate). -/
theorem hInvariant_two : hInvariant F 2 = Nat.card (K2 (𝓞 F)) := by sorry

/-- For totally real `F`, the odd part of Lichtenbaum at `n = 2` is the odd part of Birch–Tate. -/
theorem lichtenbaumFormulaOddPart_two_iff [IsTotallyReal F] (q : ℚ) (hq : dedekindZetaCont F (-1) = q) :
    LichtenbaumFormulaOddPart F 2 ↔ ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 2 →
      (padicValNat ℓ (Nat.card (K2 (𝓞 F))) : ℤ) = padicValNat ℓ (wInvariant 2 F) + padicValRat ℓ |q| := by
  sorry

end Lichtenbaum

/-- Unit tests for B.8 (values from Tate, Lee–Szczarba and N.4). -/
theorem hInvariant_two_rat (h : Nat.card (K2 (𝓞 ℚ)) = 2) : hInvariant ℚ 2 = 2 := by sorry
theorem rank_etaleH1Model_rat_two : etaleH1ModelRank ℚ 2 = 0 := by sorry
theorem card_torsion_etaleH1Model_rat_two (hw : wInvariant 2 ℚ = 24) :
    etaleH1ModelTorsionCard ℚ 2 = 24 ∧ etaleH1ModelTorsionCard ℚ 2 ≠ 48 := by sorry
theorem lichtenbaumFormulaOddPart_rat_two (hK2 : cardK ℚ 2 = 2) (hK3 : cardKTorsion ℚ 3 = 48)
    (hr : borelRatio ℚ 2 = -1 / 12) : LichtenbaumFormulaOddPart ℚ 2 := by sorry
theorem not_lichtenbaum_rat_two_at_two : (2 : ℚ) / 48 ≠ |(-1 : ℚ) / 12| := by sorry
theorem motivicLichtenbaumFormula_rat_two (hz : zetaLeadingCoeff ℚ 2 = -1 / 12) (hh : hInvariant ℚ 2 = 2)
    (ht : etaleH1ModelTorsionCard ℚ 2 = 24) : MotivicLichtenbaumFormula ℚ 2 1 := by sorry
theorem lichtenbaumFormulaOddPart_rat_four (hK7 : cardKTorsion ℚ 7 = 240) (hr : borelRatio ℚ 4 = 1 / 120)
    (h : LichtenbaumFormulaOddPart ℚ 4) (ℓ : ℕ) (hℓ : ℓ.Prime) (h2 : ℓ ≠ 2) :
    padicValNat ℓ (cardK ℚ 6) = 0 := by sorry

/-- B.8 test: for `ℚ` and `n = 2` the K-theoretic formula fails at `2` (`2/48 ≠ 1/12`), while the motivic one
holds with `#H¹_tors = w₂(ℚ) = 24` (`2/24 = 1/12`). -/
example : (2 : ℚ) / 48 ≠ 1 / 12 ∧ (2 : ℚ) / 24 = 1 / 12 := by norm_num

/-- B.8 test: for `ℚ` and `n = 4`, `w₄(ℚ) · ζ(−3) = 240 · (1/120) = 2`, so the odd part of `#K₆(ℤ)` is `1`. -/
example : (240 : ℚ) * (1 / 120) = 2 := by norm_num

/-! ## B.5 Totally real abelian fields: the 2-primary part (Kolster 1989, Greither 1992) -/

section TwoPrimary
variable (F : Type*) [Field F] [NumberField F]

/-- B.5/federer-main-conjecture: the pair `(e, u)` of Kolster's tower. Here `F₀ = F(√−1)`,
`e = max {a | ζ_{2^a} ∈ F₀}`, `F_n = F(ζ_{2^{n+e}})`, and `γ₀(ζ) = ζ^u` on `μ_{2^∞}`. -/
def kolsterTower (F : Type*) [Field F] [NumberField F] : ℕ × ℤ_[2] := sorry

/-- The Pontryagin dual `Ǎ_∞⁻` of `A_∞⁻ = lim→ ker(A₂(F_n) → A₂(F_n⁺))` (IntegralIwasawaTheory I.2). -/
def minusClassModule (F : Type*) [Field F] [NumberField F] : Type := sorry

/-- `f_F`: the characteristic power series of `Ǎ_∞⁻` over `ℤ₂⟦T⟧`, `T = γ₀ − 1`. -/
def minusCharSeries (F : Type*) [Field F] [NumberField F] : PowerSeries ℤ_[2] := sorry

/-- `G_F` with `L₂(χ₀, s) = G_F(u^s − 1)/(u^s − u)` (AutomorphicPadicLFunctions L3). -/
def twoAdicZetaSeries (F : Type*) [Field F] [NumberField F] : PowerSeries ℤ_[2] := sorry

/-- Federer's main conjecture at 2 (Kolster, Conjecture 3). -/
def FedererMainConjecture (F : Type*) [Field F] [NumberField F] : Prop :=
  Ideal.span {twoAdicZetaSeries F} =
    Ideal.span {(2 : PowerSeries ℤ_[2]) ^ Module.finrank ℚ F * minusCharSeries F}

/-- `(𝒯 ⊗_{ℤ₂} A_∞⁻)^Γ`, a finite group. -/
def twistedMinusInvariants (F : Type*) [Field F] [NumberField F] : Type := sorry

/-- Evaluation `g ↦ g(u⁻¹ − 1)`, convergent because `u⁻¹ − 1 ∈ 4ℤ₂`. -/
def kolsterEval (F : Type*) [Field F] [NumberField F] : PowerSeries ℤ_[2] →+* ℤ_[2] := sorry

/-- B.5/tame-kernel-two-part-via-iwasawa (Kolster, Theorem 1), in valuation form. -/
theorem card_K2_two_part_eq [IsTotallyReal F] :
    padicValNat 2 (Nat.card (K2 (𝓞 F))) =
      Module.finrank ℚ F + padicValNat 2 (Nat.card (twistedMinusInvariants F)) := by sorry

/-- B.5/minus-module-coinvariant-order (Kolster, Lemma 2). -/
theorem card_twistedMinusInvariants [IsTotallyReal F] :
    padicValNat 2 (Nat.card (twistedMinusInvariants F)) =
      (kolsterEval F (minusCharSeries F)).valuation := by sorry

/-- B.5/federer-implies-two-primary-birch-tate (Kolster, Theorem 5). -/
theorem padicValNat_two_card_K2_of_federer [IsTotallyReal F] (q : ℚ)
    (hq : dedekindZetaCont F (-1) = q) (h : FedererMainConjecture F) :
    (padicValNat 2 (Nat.card (K2 (𝓞 F))) : ℤ) =
      padicValNat 2 (wInvariant 2 F) + padicValRat 2 |q| := by sorry

/-- B.5/federer-conjecture-for-abelian-fields (from Greither's main conjecture). -/
theorem federerMainConjecture_of_isAbelianGalois [IsTotallyReal F] [IsAbelianGalois ℚ F] :
    FedererMainConjecture F := by sorry

/-- B.5/two-part-birch-tate-abelian. -/
theorem padicValNat_two_card_K2_of_isAbelianGalois [IsTotallyReal F] [IsAbelianGalois ℚ F]
    (q : ℚ) (hq : dedekindZetaCont F (-1) = q) :
    (padicValNat 2 (Nat.card (K2 (𝓞 F))) : ℤ) =
      padicValNat 2 (wInvariant 2 F) + padicValRat 2 |q| := by sorry

/-- B.5/birch-tate-for-real-abelian-fields. -/
theorem birchTateFormula_of_isAbelianGalois [IsTotallyReal F] [IsAbelianGalois ℚ F] :
    BirchTateFormula F := by sorry

end TwoPrimary

/-- Unit test: for `ℚ`, `v₂(G(u⁻¹ − 1)) = 1 = [ℚ:ℚ]`; with `u = 5`, `(1/12)(1/5 − 5) = −2/5`. -/
theorem twoAdicZetaSeries_rat_valuation :
    (kolsterEval ℚ (twoAdicZetaSeries ℚ)).valuation = 1 := by sorry

/-- Unit test: for `ℚ(√2)`, `v₂(G(u⁻¹ − 1)) = 2 = [F:ℚ]`, from `ζ_F(−1) = 1/12` and `e = 3`. -/
theorem twoAdicZetaSeries_sqrtTwo_valuation (F : Type*) [Field F] [NumberField F]
    (hF : Module.finrank ℚ F = 2) (h2 : ∃ x : F, x ^ 2 = 2) :
    (kolsterEval F (twoAdicZetaSeries F)).valuation = 2 := by sorry

/-- Unit test: without the factor `2^{[F:ℚ]}` the conjecture fails for `ℚ`: `(G_ℚ) = (2) ≠ (1) = (f_ℚ)`. -/
theorem not_federerMainConjecture_unnormalised_rat :
    Ideal.span {twoAdicZetaSeries ℚ} ≠ Ideal.span {minusCharSeries ℚ} := by sorry

/-- B.5, checked arithmetic: `1 − u² = −2^{e+1}·ε·(1 + 2^{e−1}ε)` for `u = 1 + 2^e ε` (here `e = k + 1`),
so `u⁻¹ − u ~ 2^{e+1}` when `ε` is odd and `e ≥ 2`. -/
example (k : ℕ) (ε : ℤ) : 1 - (1 + 2 ^ (k + 1) * ε) ^ 2 = -(2 ^ (k + 2)) * ε * (1 + 2 ^ k * ε) := by
  ring

/-- The cofactor `1 + 2^{e−1} ε` is odd once `e ≥ 2`. -/
example (k : ℕ) (hk : 1 ≤ k) (ε : ℤ) : Odd (1 + 2 ^ k * ε) :=
  ((Int.even_pow.mpr ⟨even_two, by omega⟩).mul_right ε).one_add

/-- The `ℚ(√2)` values: `B_{2,χ₈} = 2`, so `ζ_{ℚ(√2)}(−1) = (−1/12)(−B_{2,χ₈}/2) = 1/12`, and for `ℚ` with
`u = 5`: `ζ_{ℚ,2}(−1)(u⁻¹ − u) = (1/12)(1/5 − 5) = −2/5`. -/
example : (8 : ℚ) * ((1 + 49 - 9 - 25) / 64 - (1 + 7 - 3 - 5) / 8) = 2 ∧
    (-1 / 12 : ℚ) * (-(2 : ℚ) / 2) = 1 / 12 ∧ (1 / 12 : ℚ) * (1 / 5 - 5) = -2 / 5 := by
  norm_num

/-- The pole factors: `(x − u)(−x − u) = −(x² − u²)`, the case `2^b = 2` of `∏_ρ(ζ_ρ x − u′) = ±(x^{2^b} − u′^{2^b})`. -/
example (x u : ℚ) : (x - u) * (-x - u) = -(x ^ 2 - u ^ 2) := by ring

end TauCeti.BirchTate
