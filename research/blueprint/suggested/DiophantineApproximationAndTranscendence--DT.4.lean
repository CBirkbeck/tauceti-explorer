/-
Suggested Lean file for the roadmap "Diophantine approximation and transcendence"
(`DiophantineApproximationAndTranscendence`), layer DT.4 (effective applications), follow-up part.

This file is not the roadmap and is not exhaustive: the roadmap document
(`research/blueprint/readmes/DiophantineApproximationAndTranscendence--DT.4.md`) is definitive. The
statements below suggest Lean forms, so that contributors and reviewers converge on names and
signatures. Definitions have real bodies; every API lemma, unit test and named theorem is proved by
`sorry`; nothing here is an implementation claim. The file imports Mathlib (082e2d3) and the pinned Tau Ceti (f790474) declaration
`TauCeti.relDiscr` directly. Explicit source contracts whose dependency proofs have recorded gaps
remain honest theorem statements; the reader document identifies those gaps.

Results of the first part of DT.4 (Evertse's Chapter 5: unit equations, Thue equations over ℤ,
Győry's theorem for finitely generated groups) are cited by name in docstrings, not restated.
-/

import TauCeti.RingTheory.DedekindDomain.Discriminant.Basic
import Mathlib.Analysis.Polynomial.MahlerMeasure
import Mathlib.NumberTheory.Chebyshev
import Mathlib.NumberTheory.Height.NumberField
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.NumberField.DedekindZeta
import Mathlib.NumberTheory.NumberField.Discriminant.Basic
import Mathlib.NumberTheory.NumberField.ProductFormula
import Mathlib.NumberTheory.NumberField.Units.Regulator
import Mathlib.NumberTheory.Padics.HeightOneSpectrum
import Mathlib.RingTheory.DedekindDomain.Different
import Mathlib.RingTheory.DedekindDomain.SInteger
import Mathlib.RingTheory.Ideal.Norm.RelNorm
import Mathlib.RingTheory.Polynomial.ContentIdeal
import Mathlib.RingTheory.Polynomial.Resultant.Basic

set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

noncomputable section

open Polynomial NumberField IsDedekindDomain TauCeti
open scoped nonZeroDivisors

namespace DiophantineApproximation.EffectiveApplications

/-! ## Places, S-norms and polynomial heights -/

section SNorm

variable {K : Type*} [Field K] [NumberField K]

/-- The S-norm `N_S(x) = ∏_{w | ∞} w(x)^{mult w} · ∏_{𝔭 ∈ S} |x|_𝔭` (BEG §3.2; Bugeaud–Győry §5). -/
def sNorm (S : Finset (HeightOneSpectrum (𝓞 K))) (x : K) : ℝ :=
  (∏ w : InfinitePlace K, w x ^ w.mult) * ∏ v ∈ S, FinitePlace.mk v x

variable (S : Finset (HeightOneSpectrum (𝓞 K)))

theorem sNorm_mul (x y : K) : sNorm S (x * y) = sNorm S x * sNorm S y := sorry

theorem sNorm_one : sNorm S (1 : K) = 1 := sorry

/-- The product formula form: the S-norm is the inverse of the product over the primes outside `S`. -/
theorem sNorm_eq_inv_finprod_compl {x : K} (hx : x ≠ 0) :
    sNorm S x = (∏ᶠ (v : HeightOneSpectrum (𝓞 K)) (_ : v ∉ S), FinitePlace.mk v x)⁻¹ := sorry

theorem sNorm_empty (x : K) : sNorm (∅ : Finset (HeightOneSpectrum (𝓞 K))) x = |Algebra.norm ℚ x| :=
  sorry

theorem one_le_sNorm {x : K} (hx : x ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) (hx0 : x ≠ 0) :
    1 ≤ sNorm S x := sorry

theorem sNorm_eq_one_iff {x : K} (hx : x ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K)
    (hx0 : x ≠ 0) :
    sNorm S x = 1 ↔ ∃ u ∈ (S : Set (HeightOneSpectrum (𝓞 K))).unit K, (u : K) = x := sorry

/-- The part of `(x)` outside `S`: `N_S(x) = N((x)) / ∏_{𝔭 ∈ S} N𝔭^{ord_𝔭 x}`. -/
theorem sNorm_eq_absNorm_div {x : 𝓞 K} (hx : x ≠ 0) :
    sNorm S (x : K) = ((Ideal.span {x}).absNorm : ℝ) /
      ∏ p ∈ S, ((p.asIdeal.absNorm : ℝ) ^ multiplicity p.asIdeal (Ideal.span {x})) := sorry

theorem log_sNorm_le_logHeight {x : K} (hx : x ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) :
    Real.log (sNorm S x) ≤ Module.finrank ℚ K * absLogHeight₁ x := sorry

/-- Unit test `sNorm_empty_eq_absNorm` (compatibility): for `S = ∅` and an algebraic integer, the
S-norm is the absolute norm of the principal ideal. -/
example (x : 𝓞 K) (hx : x ≠ 0) :
    sNorm (∅ : Finset (HeightOneSpectrum (𝓞 K))) (x : K) = (Ideal.span {x}).absNorm := sorry

/-- Unit test `sNorm_empty_eq` (degenerate): `S = ∅` gives the absolute value of the field norm. -/
example (x : K) : sNorm (∅ : Finset (HeightOneSpectrum (𝓞 K))) x = |Algebra.norm ℚ x| :=
  sNorm_empty x

/-- Unit test `sNorm_gaussian_complex_weight` (non-example): the complex place counts twice; in a
quadratic field with `i² = -1`, `N_∅(1 + i) = 2`, not `√2`. -/
example (hK : Module.finrank ℚ K = 2) (i : K) (hi : i ^ 2 = -1) :
    sNorm (∅ : Finset (HeightOneSpectrum (𝓞 K))) (1 + i) = 2 := sorry

end SNorm

/-- The prime `(p)` of `𝓞 ℚ`, as a height-one prime. -/
def ratPrime (p : Nat.Primes) : HeightOneSpectrum (𝓞 ℚ) :=
  (Rat.HeightOneSpectrum.primesEquiv (R := 𝓞 ℚ)).symm p

/-- Unit test `sNorm_rat_two_twelve` (computation): `N_{{2}}(12) = 3` over `ℚ`. -/
example : sNorm {ratPrime ⟨2, Nat.prime_two⟩} (12 : ℚ) = 3 := sorry

/-- Unit test `sNorm_half_lt_one` (non-example): `N_∅(1/2) = 1/2 < 1`, so `1 ≤ N_S` needs an
S-integer. -/
example : sNorm (∅ : Finset (HeightOneSpectrum (𝓞 ℚ))) (1 / 2 : ℚ) = 1 / 2 := sorry

section PolynomialHeight

variable {K : Type*} [Field K] [NumberField K]

/-- `h(f)`: the absolute logarithmic height of the point `(1 : a₀ : ⋯ : aₙ)` (BEG §3.4). -/
def polyLogHeight (f : K[X]) : ℝ :=
  Height.logHeight (Fin.cons (1 : K) (fun i : Fin (f.natDegree + 1) => f.coeff i)) /
    Module.finrank ℚ K

/-- `ĥ(b, f)`: the absolute logarithmic height of `(1 : b : a₀ : ⋯ : aₙ)` (BEG (2.2), (4.6)). -/
def superellipticHeight (b : K) (f : K[X]) : ℝ :=
  Height.logHeight
      (Fin.cons (1 : K) (Fin.cons b (fun i : Fin (f.natDegree + 1) => f.coeff i))) /
    Module.finrank ℚ K

theorem polyLogHeight_nonneg (f : K[X]) : 0 ≤ polyLogHeight f := sorry

theorem polyLogHeight_map {L : Type*} [Field L] [NumberField L] [Algebra K L] (f : K[X]) :
    polyLogHeight (f.map (algebraMap K L)) = polyLogHeight f := sorry

theorem logHeight_coeff_le (f : K[X]) (i : ℕ) : absLogHeight₁ (f.coeff i) ≤ polyLogHeight f :=
  sorry

theorem polyLogHeight_le_superellipticHeight (b : K) (f : K[X]) :
    polyLogHeight f ≤ superellipticHeight b f ∧ absLogHeight₁ b ≤ superellipticHeight b f := sorry

theorem superellipticHeight_nonneg (b : K) (f : K[X]) :
    0 ≤ superellipticHeight b f := sorry

theorem superellipticHeight_map {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (b : K) (f : K[X]) :
    superellipticHeight (algebraMap K L b) (f.map (algebraMap K L)) =
      superellipticHeight b f := sorry

theorem superellipticHeight_zero (f : K[X]) :
    superellipticHeight (0 : K) f = polyLogHeight f := sorry

theorem polyLogHeight_X_sub_C (α : K) : polyLogHeight (X - C α) = absLogHeight₁ α := sorry

end PolynomialHeight

/-- The coefficient 1 and the separate b coordinate both contribute to the height. -/
example : superellipticHeight (2 : ℚ) X = Real.log 2 := sorry

/-- The finite place contributes even when the archimedean b coordinate is small. -/
example : superellipticHeight (1 / 2 : ℚ) X = Real.log 2 := sorry

/-- Zero b does not change the height; monomials have height zero. -/
example (n : ℕ) : superellipticHeight (0 : ℚ) (X ^ n) = 0 := sorry

theorem polyLogHeight_int (f : ℤ[X]) :
    polyLogHeight (f.map (Int.castRingHom ℚ)) =
      Real.log (max 1 ((Finset.range (f.natDegree + 1)).sup fun i => (f.coeff i).natAbs : ℕ)) :=
  sorry

/-- Unit test `polyLogHeight_X_sq_sub_two` (computation): `h(X² − 2) = log 2`. -/
example : polyLogHeight (X ^ 2 - C (2 : ℚ)) = Real.log 2 := sorry

/-- Unit test `polyLogHeight_X_sub_half` (computation): the `2`-adic place contributes,
`h(X − 1/2) = log 2`. -/
example : polyLogHeight (X - C (1 / 2 : ℚ)) = Real.log 2 := sorry

/-- Unit test `polyLogHeight_X_pow` (degenerate): `h(Xⁿ) = 0`. -/
example (n : ℕ) : polyLogHeight (X ^ n : ℚ[X]) = 0 := sorry

/-- Unit test `polyLogHeight_two_mul_X` (non-example): the coordinate `1` matters, `h(2X) = log 2`. -/
example : polyLogHeight (C (2 : ℚ) * X) = Real.log 2 := sorry

/-- Unit test `polyLogHeight_int_example` (compatibility): `h(3X² − 5) = log 5`. -/
example : polyLogHeight ((C (3 : ℤ) * X ^ 2 - C 5).map (Int.castRingHom ℚ)) = Real.log 5 := sorry

end DiophantineApproximation.EffectiveApplications

namespace DiophantineApproximation.EffectiveApplications

/-! ## S-units, S-regulators and class groups -/

section SUnits

variable {K : Type*} [Field K] [NumberField K]

/-- The places of `K`: infinite places and nonzero primes of `𝓞 K`. -/
abbrev Place (K : Type*) [Field K] [NumberField K] := InfinitePlace K ⊕ HeightOneSpectrum (𝓞 K)

/-- The normalised logarithmic absolute value `log |x|_v` (BEG (2.1)): `mult w · log w(x)` at an
infinite place and `log |x|_𝔭` (normalised by `N𝔭`) at a finite one. -/
def normLogAbs : Place K → K → ℝ
  | .inl w, x => (w.mult : ℝ) * Real.log (w x)
  | .inr p, x => Real.log (FinitePlace.mk p x)

/-- The `ℓ¹`-size of the S-logarithmic vector of `x`. -/
def sLogNorm (S : Finset (HeightOneSpectrum (𝓞 K))) (x : K) : ℝ :=
  (∑ w : InfinitePlace K, |normLogAbs (.inl w) x|) + ∑ p ∈ S, |normLogAbs (.inr p) x|

/-- `ε` is a fundamental system of S-units: S-units such that every S-unit is a root of unity
times a unique product of their powers. -/
def IsFundamentalSUnitSystem (S : Set (HeightOneSpectrum (𝓞 K))) {k : ℕ} (ε : Fin k → Kˣ) :
    Prop :=
  (∀ i, ε i ∈ S.unit K) ∧
    ∀ x ∈ S.unit K, ∃! e : Fin k → ℤ, ∃ ζ : Kˣ, (∃ n : ℕ, 0 < n ∧ ζ ^ n = 1) ∧
      x = ζ * ∏ i, ε i ^ e i

/-- The S-regulator of a family of S-units with respect to a choice of places:
`|det (log |ε_i|_{v_j})|` (Bugeaud–Győry §3; BEG (3.8)). -/
def sRegulatorOf {k : ℕ} (ε : Fin k → Kˣ) (v : Fin k → Place K) : ℝ :=
  |(Matrix.of fun i j => normLogAbs (v j) (ε i : K)).det|

variable (S : Finset (HeightOneSpectrum (𝓞 K)))

/-- The S-unit theorem: a fundamental system of S-units has `rank K + #S` elements. -/
theorem exists_isFundamentalSUnitSystem :
    ∃ ε : Fin (Units.rank K + S.card) → Kˣ,
      IsFundamentalSUnitSystem (S : Set (HeightOneSpectrum (𝓞 K))) ε := sorry

theorem card_eq_of_isFundamentalSUnitSystem {k : ℕ} {ε : Fin k → Kˣ}
    (hε : IsFundamentalSUnitSystem (S : Set (HeightOneSpectrum (𝓞 K))) ε) :
    k = Units.rank K + S.card := sorry

/-- Integrality: an element of absolute value at most `1` at every finite place is integral. -/
theorem isIntegral_of_forall_finitePlace_le_one {x : K} (h : ∀ v : FinitePlace K, v x ≤ 1) :
    IsIntegral ℤ x := sorry

/-- Kernel of the S-logarithmic map: an S-unit with trivial logarithmic vector is a root of unity. -/
theorem exists_pow_eq_one_of_normLogAbs_eq_zero {x : Kˣ}
    (hx : x ∈ (S : Set (HeightOneSpectrum (𝓞 K))).unit K)
    (h0 : ∀ w : InfinitePlace K, normLogAbs (.inl w) (x : K) = 0)
    (h1 : ∀ p ∈ S, normLogAbs (.inr p) (x : K) = 0) :
    ∃ n : ℕ, 0 < n ∧ x ^ n = 1 := sorry

/-- Discreteness of the S-logarithmic image. -/
theorem finite_setOf_sUnit_sLogNorm_le (B : ℝ) :
    {x : Kˣ | x ∈ (S : Set (HeightOneSpectrum (𝓞 K))).unit K ∧ sLogNorm S (x : K) ≤ B}.Finite :=
  sorry

theorem sRegulatorOf_eq_of_isFundamental {k : ℕ} {ε ε' : Fin k → Kˣ}
    (hε : IsFundamentalSUnitSystem (S : Set (HeightOneSpectrum (𝓞 K))) ε)
    (hε' : IsFundamentalSUnitSystem (S : Set (HeightOneSpectrum (𝓞 K))) ε')
    {v v' : Fin k → Place K} (hv : Function.Injective v) (hv' : Function.Injective v')
    (hvS : ∀ j p, v j = .inr p → p ∈ S) (hvS' : ∀ j p, v' j = .inr p → p ∈ S) :
    sRegulatorOf ε v = sRegulatorOf ε' v' := sorry

/-- `R_S = h_S · R_K · ∏_{𝔭 ∈ S} log N𝔭` with `h_S` the order of the subgroup of the class group
generated by the classes of the primes of `S`; stated here with `h_S` a divisor of `h_K`. -/
theorem sRegulatorOf_eq {k : ℕ} {ε : Fin k → Kˣ}
    (hε : IsFundamentalSUnitSystem (S : Set (HeightOneSpectrum (𝓞 K))) ε)
    {v : Fin k → Place K} (hv : Function.Injective v) (hvS : ∀ j p, v j = .inr p → p ∈ S) :
    ∃ hS : ℕ, 0 < hS ∧ hS ∣ classNumber K ∧
      sRegulatorOf ε v = hS * Units.regulator K * ∏ p ∈ S, Real.log (p.asIdeal.absNorm) := sorry

theorem sRegulatorOf_le {k : ℕ} {ε : Fin k → Kˣ}
    (hε : IsFundamentalSUnitSystem (S : Set (HeightOneSpectrum (𝓞 K))) ε)
    {v : Fin k → Place K} (hv : Function.Injective v) (hvS : ∀ j p, v j = .inr p → p ∈ S) :
    sRegulatorOf ε v ≤ classNumber K * Units.regulator K * ∏ p ∈ S, Real.log (p.asIdeal.absNorm) :=
  sorry

theorem sRegulatorOf_ge {k : ℕ} {ε : Fin k → Kˣ}
    (hε : IsFundamentalSUnitSystem (S : Set (HeightOneSpectrum (𝓞 K))) ε)
    {v : Fin k → Place K} (hv : Function.Injective v) (hvS : ∀ j p, v j = .inr p → p ∈ S) :
    Units.regulator K * ∏ p ∈ S, Real.log (p.asIdeal.absNorm) ≤ sRegulatorOf ε v := sorry

/-- Unit test `sRegulatorOf_pos` (characterisation). -/
theorem sRegulatorOf_pos {k : ℕ} {ε : Fin k → Kˣ}
    (hε : IsFundamentalSUnitSystem (S : Set (HeightOneSpectrum (𝓞 K))) ε)
    {v : Fin k → Place K} (hv : Function.Injective v) (hvS : ∀ j p, v j = .inr p → p ∈ S) :
    0 < sRegulatorOf ε v := sorry

/-- `sRegulatorOf_fundSystem` (compatibility, also a unit test): for `S = ∅` and Mathlib's
fundamental system, the S-regulator is Mathlib's regulator. -/
theorem sRegulatorOf_fundSystem (w' : InfinitePlace K) (e : {w // w ≠ w'} ≃ Fin (Units.rank K)) :
    sRegulatorOf (fun i => Units.map (algebraMap (𝓞 K) K).toMonoidHom (Units.fundSystem K i))
      (fun j => .inl (e.symm j).1) = Units.regulator K := sorry

/-- Unit test `sRegulatorOf_sq` (non-example): replacing a system by its squares multiplies the
determinant by `2^k`, so the fundamental-system hypothesis cannot be dropped. -/
example {k : ℕ} (ε : Fin k → Kˣ) (v : Fin k → Place K) :
    sRegulatorOf (fun i => ε i ^ 2) v = 2 ^ k * sRegulatorOf ε v := sorry

/-- Bugeaud–Győry Lemma 1: a fundamental system of S-units of controlled height. Here
`s = #(infinite places) + #S ≥ 2`, `R` is the S-regulator and `δ` a lower bound for `d·h`
off the roots of unity. -/
theorem exists_isFundamentalSUnitSystem_absLogHeight_le
    (hs : 2 ≤ Fintype.card (InfinitePlace K) + S.card) {δ : ℝ} (hδ : 0 < δ)
    (hδK : ∀ η : K, η ≠ 0 → (¬ ∃ n : ℕ, 0 < n ∧ η ^ n = 1) →
      δ / Module.finrank ℚ K ≤ absLogHeight₁ η)
    {k : ℕ} {ε₀ : Fin k → Kˣ}
    (hε₀ : IsFundamentalSUnitSystem (S : Set (HeightOneSpectrum (𝓞 K))) ε₀)
    {v : Fin k → Place K} (hv : Function.Injective v) (hvS : ∀ j p, v j = .inr p → p ∈ S) :
    let s : ℕ := Fintype.card (InfinitePlace K) + S.card
    let d : ℝ := Module.finrank ℚ K
    let c₄ : ℝ := ((s - 1).factorial : ℝ) ^ 2 / (2 ^ (s - 2) * d ^ (s - 1))
    ∃ ε : Fin k → Kˣ, IsFundamentalSUnitSystem (S : Set (HeightOneSpectrum (𝓞 K))) ε ∧
      (∏ i, absLogHeight₁ (ε i : K)) ≤ c₄ * sRegulatorOf ε₀ v ∧
      ∀ i, absLogHeight₁ (ε i : K) ≤ c₄ * (δ / d) ^ (2 - (s : ℤ)) * sRegulatorOf ε₀ v := sorry

/-- A representative of small height modulo `m`-th powers of S-units (Bugeaud–Győry Lemma 2; BEG
Lemma 3.8 with the constant of a given fundamental system). -/
theorem exists_sUnit_absLogHeight_mul_pow_le {k : ℕ} {η : Fin k → Kˣ}
    (hη : IsFundamentalSUnitSystem (S : Set (HeightOneSpectrum (𝓞 K))) η) {α : K}
    (hα : α ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) (hα0 : α ≠ 0) {m : ℕ} (hm : 0 < m) :
    ∃ ε ∈ (S : Set (HeightOneSpectrum (𝓞 K))).unit K,
      absLogHeight₁ (α * (ε : K) ^ m) ≤
        (Real.log (sNorm S α) + m * (∑ i, sLogNorm S (η i : K)) / 2) / Module.finrank ℚ K := sorry

/-- The exact BEG representative bound uses refined independent ordinary-unit heights;
its quantitative height-product input is recorded as a gap in the reader. -/
theorem exists_sUnit_absLogHeight_mul_pow_explicit_le {α : K}
    (hα : α ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) (hα0 : α ≠ 0)
    {m : ℕ} (hm : 0 < m) :
    ∃ ε ∈ (S : Set (HeightOneSpectrum (𝓞 K))).unit K,
      absLogHeight₁ (α * (ε : K) ^ m) ≤
        Real.log (sNorm S α) / Module.finrank ℚ K +
          m * (39 * (Module.finrank ℚ K : ℝ) ^ (Module.finrank ℚ K + 2) * Units.regulator K +
            (classNumber K : ℝ) / Module.finrank ℚ K *
              Real.log (∏ p ∈ S, (p.asIdeal.absNorm : ℝ))) := sorry

/-- Unit test `isFundamentalSUnitSystem_rat_prime` (characterisation): for `K = ℚ` and `S = {(p)}`,
`p` alone is a fundamental system of S-units. -/
example (p : Nat.Primes) :
    IsFundamentalSUnitSystem ({ratPrime p} : Set (HeightOneSpectrum (𝓞 ℚ)))
      ![Units.mk0 ((p : ℕ) : ℚ) (by exact_mod_cast p.2.ne_zero)] := sorry

end SUnits

/-- The empty system captures the torsion-only ordinary rational units. -/
example : IsFundamentalSUnitSystem (∅ : Set (HeightOneSpectrum (𝓞 ℚ)))
    (fun i : Fin 0 => Fin.elim0 i) := sorry

/-- A square generates a proper subgroup modulo torsion. -/
example (p : Nat.Primes) :
    ¬ IsFundamentalSUnitSystem ({ratPrime p} : Set (HeightOneSpectrum (𝓞 ℚ)))
      ![(Units.mk0 ((p : ℕ) : ℚ) (by exact_mod_cast p.2.ne_zero)) ^ 2] := sorry

/-- Unit test `sRegulatorOf_rat_prime` (computation): over `ℚ` with `S = {(p)}`, `R_S = log p`. -/
example (p : Nat.Primes) :
    sRegulatorOf ![Units.mk0 ((p : ℕ) : ℚ) (by exact_mod_cast p.2.ne_zero)]
      ![(Sum.inr (ratPrime p) : Place ℚ)] = Real.log p := sorry

/-- The determinant in rank zero is 1. -/
example (ε : Fin 0 → ℚˣ) (v : Fin 0 → Place ℚ) : sRegulatorOf ε v = 1 := sorry

section ClassGroup

variable (K : Type*) [Field K] [NumberField K]

/-- BEG Lemma 3.5 (Friedman): `R_K ≥ 0.2`. -/
theorem regulator_ge : (1 / 5 : ℝ) ≤ Units.regulator K := sorry

/-- BEG Lemma 3.5 (Louboutin, with the class number formula). -/
theorem classNumber_mul_regulator_le :
    (classNumber K : ℝ) * Units.regulator K ≤
      Real.sqrt |(discr K : ℝ)| * (max 1 (Real.log |(discr K : ℝ)|)) ^ (Module.finrank ℚ K - 1) :=
  sorry

/-- Every nonzero ideal raised to the class number is principal. -/
theorem isPrincipal_pow_classNumber (I : Ideal (𝓞 K)) (hI : I ≠ ⊥) :
    (I ^ classNumber K).IsPrincipal := sorry

/-- Finitely many representatives for the divisors of `n` up to `P`-units. -/
theorem exists_finset_divisor_representatives (P : Finset (HeightOneSpectrum (𝓞 K))) {n : 𝓞 K}
    (hn : n ≠ 0) :
    ∃ M : Finset K, ∀ β : 𝓞 K, β ≠ 0 →
      (∃ k : ℕ, Ideal.span {β} ∣ Ideal.span {n} * (∏ p ∈ P, p.asIdeal) ^ k) →
        ∃ μ ∈ M, μ ≠ 0 ∧ ∃ u ∈ (P : Set (HeightOneSpectrum (𝓞 K))).unit K, (β : K) = μ * u :=
  sorry

/-- Minkowski: every invertible fractional ideal `I` contains `ξ ≠ 0` with `(ξ) = B·I` for an
integral ideal `B` of norm at most `√|D_K|` (the S-integral version follows by localisation). -/
theorem exists_mem_spanSingleton_eq_mul (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    ∃ ξ ∈ (I : FractionalIdeal (𝓞 K)⁰ K), ξ ≠ 0 ∧ ∃ B : Ideal (𝓞 K),
      ((B.absNorm : ℕ) : ℝ) ≤ Real.sqrt |(discr K : ℝ)| ∧
        FractionalIdeal.spanSingleton (𝓞 K)⁰ ξ = (B : FractionalIdeal (𝓞 K)⁰ K) * I := sorry

end ClassGroup

end DiophantineApproximation.EffectiveApplications

namespace DiophantineApproximation.EffectiveApplications

/-! ## Gauss's lemma, heights of polynomials and discriminants -/

/-- Gauss's lemma for content ideals over a Dedekind domain (Mathlib has `≤`). -/
theorem contentIdeal_mul_eq {A : Type*} [CommRing A] [IsDedekindDomain A] (f g : A[X]) :
    (f * g).contentIdeal = f.contentIdeal * g.contentIdeal := sorry

section Heights

variable {K : Type*} [Field K] [NumberField K]

/-- BEG Lemma 3.6 (Bombieri–Gubler 1.6.13). -/
theorem abs_polyLogHeight_prod_sub_sum_le {n : ℕ} (α : Fin n → K) :
    |polyLogHeight (∏ i, (X - C (α i))) - ∑ i, absLogHeight₁ (α i)| ≤ n * Real.log 2 := sorry

/-- Nonmonic roots: the product formula removes the leading coefficient. -/
theorem sum_absLogHeight_roots_le {n : ℕ} (α : Fin n → K) {a : K} (ha : a ≠ 0) :
    (∑ i, absLogHeight₁ (α i)) ≤
      polyLogHeight (C a * ∏ i, (X - C (α i))) + n * Real.log 2 := sorry

/-- Evaluation needs the archimedean log(n+1) term. -/
theorem absLogHeight_eval_le (f : K[X]) (x : K) :
    absLogHeight₁ (f.eval x) ≤
      polyLogHeight f + f.natDegree * absLogHeight₁ x + Real.log (f.natDegree + 1) := sorry

/-- Loher–Masser in the form of Győry–Yu Proposition 1; the quantitative counting
and Blichfeldt input remain recorded gaps. -/
theorem independent_height_product_lower {n : ℕ} (hn : 0 < n) (α : Fin n → Kˣ)
    (hind : Function.Injective (fun e : Fin n → ℤ => ∏ i, α i ^ e i)) :
    let d : ℕ := Module.finrank ℚ K
    let c : ℝ := if d = 1 then 17 else 58 * (d : ℝ) ^ (n + 1) * Real.log d
    (Nat.card (Units.torsion K) : ℝ) ≤
      c * (n.factorial : ℝ) * Real.exp n / (n : ℝ) ^ n *
        ∏ i, absLogHeight₁ (α i : K) := sorry

/-- BEG Lemma 3.7 (i) at an infinite place. -/
theorem infinitePlace_discr_le (f : K[X]) {n : ℕ} (hn : f.natDegree = n) (hnpos : 1 ≤ n) (w : InfinitePlace K) :
    w f.discr ^ w.mult ≤
      ((n : ℝ) ^ (2 * n - 1) * (⨆ i : Fin (n + 1), w (f.coeff i)) ^ (2 * n - 2)) ^ w.mult := sorry

/-- BEG Lemma 3.7 (i) at a finite place. -/
theorem finitePlace_discr_le (f : K[X]) {n : ℕ} (hn : f.natDegree = n) (hnpos : 1 ≤ n) (v : FinitePlace K) :
    v f.discr ≤ (⨆ i : Fin (n + 1), v (f.coeff i)) ^ (2 * n - 2) := sorry

/-- BEG Lemma 3.7 (ii). -/
theorem absLogHeight_discr_le (f : K[X]) {n : ℕ} (hn : f.natDegree = n) (hnpos : 1 ≤ n) (hD : f.discr ≠ 0) :
    absLogHeight₁ f.discr ≤ (2 * n - 1) * Real.log n + (2 * n - 2) * polyLogHeight f := sorry

end Heights

/-- `lcm(1, …, m) ≤ m^{π(m)}`. -/
theorem lcmUpto_le_pow_primeCounting (m : ℕ) : Nat.lcmUpto m ≤ m ^ Nat.primeCounting m := sorry

/-- `lcm(1, …, m) ≤ 4^m` (Rosser–Schoenfeld; Tijdeman, Lemma T1). -/
theorem lcmUpto_le_four_pow (m : ℕ) : Nat.lcmUpto m ≤ 4 ^ m := sorry

/-- The weaker bound available from Mathlib's Chebyshev estimates. -/
theorem lcmUpto_le_sixteen_pow_mul (m : ℕ) (hm : 1 ≤ m) :
    (Nat.lcmUpto m : ℝ) ≤ 16 ^ m * (m : ℝ) ^ Real.sqrt m := sorry

/-- Unit test: `lcm(1, …, 10) = 2520`. -/
example : Nat.lcmUpto 10 = 2520 := sorry

section Discriminants

variable {K L : Type*} [Field K] [Field L] [NumberField K] [NumberField L] [Algebra K L]

/-- BEG Lemma 3.1: if `L = K(α)` and `f ∈ 𝓞_K[X]` is squarefree with `f(α) = 0`, then
`D(f) ∈ relDiscr(𝓞_K, 𝓞_L)` (the integral form of `d_{L/K} ⊇ [D(f)][f]^{-(2m-2)}`). -/
theorem discr_mem_relDiscr {α : L} (hα : IntermediateField.adjoin K {α} = ⊤) {f : (𝓞 K)[X]}
    (hf : Squarefree (f.map (algebraMap (𝓞 K) K)))
    (hfα : Polynomial.aeval α f = 0) :
    f.discr ∈ relDiscr (𝓞 K) (𝓞 L) := sorry

/-- BEG Lemma 3.2: `ord_𝔭(d_{L/K}) ≤ [L:K]·(1 + ord_𝔭(lcm(1, …, [L:K])))`. -/
theorem multiplicity_relDiscr_le (p : HeightOneSpectrum (𝓞 K)) :
    multiplicity p.asIdeal (relDiscr (𝓞 K) (𝓞 L)) ≤
      Module.finrank K L *
        (1 + multiplicity p.asIdeal (Ideal.span {((Nat.lcmUpto (Module.finrank K L) : ℕ) : 𝓞 K)})) :=
  sorry

/-- BEG Lemma 3.3 (ii): the discriminant of a compositum. -/
theorem relDiscr_compositum_le {M : Type*} [Field M] [NumberField M] [Algebra K M] [Algebra L M]
    [IsScalarTower K L M] (L₂ : IntermediateField K M)
    (htop : (IntermediateField.adjoin K (Set.range (algebraMap L M)) ⊔ L₂) = ⊤) :
    relDiscr (𝓞 K) (𝓞 L) ^ Module.finrank L M *
        relDiscr (𝓞 K) (𝓞 L₂) ^ Module.finrank L₂ M ≤ relDiscr (𝓞 K) (𝓞 M) := sorry

/-- BEG Lemma 3.4: `K(γ^{1/m})/K` is unramified at `𝔭 ∤ m` with `m ∣ ord_𝔭(γ)`. -/
theorem not_dvd_relDiscr_of_pow {m : ℕ} (hm : 1 ≤ m) {γ : K} (hγ : γ ≠ 0) {θ : L} (hθ : θ ^ m = algebraMap K L γ)
    (hθgen : IntermediateField.adjoin K {θ} = ⊤) (p : HeightOneSpectrum (𝓞 K))
    (hpm : (m : 𝓞 K) ∉ p.asIdeal)
    (hpγ : ∃ τ ε : K, τ ≠ 0 ∧ ε ≠ 0 ∧ γ = τ ^ m * ε ∧ FinitePlace.mk p ε = 1) :
    ¬ p.asIdeal ∣ relDiscr (𝓞 K) (𝓞 L) := sorry

/-- BEG Lemma 4.1 for one root: `|D_L| ≤ n^{(2n-1)d} e^{(2n-2)d h(f)} |D_K|^{[L:K]}` for
`L = K(α)`, `f(α) = 0`, `deg f = n`, `D(f) ≠ 0`. -/
theorem abs_discr_le_of_adjoin_root {α : L} (hα : IntermediateField.adjoin K {α} = ⊤) {f : K[X]}
    {n : ℕ} (hn : f.natDegree = n) (hD : f.discr ≠ 0) (hfα : Polynomial.aeval α f = 0) :
    |(discr L : ℝ)| ≤ (n : ℝ) ^ ((2 * n - 1) * Module.finrank ℚ K) *
      Real.exp ((2 * n - 2) * Module.finrank ℚ K * polyLogHeight f) *
        |(discr K : ℝ)| ^ Module.finrank K L := sorry

end Discriminants

/-! ## Linear forms in logarithms at an arbitrary place -/

/-- Voutier's bound `m(d)` (BEG Lemma 3.9). -/
def voutierBound (d : ℕ) : ℝ := if d = 1 then Real.log 2 else 2 / (d * Real.log (3 * d) ^ 3)

/-- BEG Lemma 3.9 (Voutier, Corollary 2). -/
theorem voutierBound_le_absLogHeight {K : Type*} [Field K] [NumberField K] {α : K} (hα : α ≠ 0)
    (hroot : ¬ ∃ n : ℕ, 0 < n ∧ α ^ n = 1) :
    voutierBound (minpoly ℚ α).natDegree ≤ absLogHeight₁ α := sorry

/-- Unit test (degenerate, the case used over `ℤ`): `h(q) ≥ log 2` for a rational `q ≠ 0, ±1`. -/
example (q : ℚ) (hq0 : q ≠ 0) (hq1 : q ≠ 1) (hq2 : q ≠ -1) : Real.log 2 ≤ absLogHeight₁ q := sorry

/-- Yu's p-adic bound read in an arbitrary number field `K ⊇ ℚ(α)`, for any number `n ≥ 1` of
logarithms (padding by `p` when `n = 1`); `C` depends on `[K:ℚ]`, `n`, `p`, `N𝔓` and the heights. -/
theorem exists_finitePlace_prod_pow_sub_one_ge {K : Type*} [Field K] [NumberField K]
    (P : HeightOneSpectrum (𝓞 K)) {n : ℕ} (hn : 1 ≤ n) (α : Fin n → K) (hα : ∀ i, α i ≠ 0) :
    ∃ C : ℝ, 0 < C ∧ ∀ b : Fin n → ℤ, ∏ i, α i ^ b i ≠ 1 →
      (Real.exp 1 * max 1 ((Finset.univ.sup fun i => (b i).natAbs : ℕ) : ℝ)) ^ (-C) ≤
        FinitePlace.mk P (∏ i, α i ^ b i - 1) := sorry

/-- BEG Proposition 3.10: Baker-type bound at any place `v`, with
`c₁(n, d) = 12 (16 e d)^{3n+2} (log* d)²` and `N(v) = 2` or `N𝔭`. -/
theorem normLogAbs_prod_pow_sub_one_ge {K : Type*} [Field K] [NumberField K] (v : Place K)
    {n : ℕ} (hn : 2 ≤ n) (α : Fin n → K) (hα : ∀ i, α i ≠ 0) (b : Fin n → ℤ)
    (hΛ : ∏ i, α i ^ b i ≠ 1) :
    let d : ℕ := Module.finrank ℚ K
    let Θ : ℝ := ∏ i, max (absLogHeight₁ (α i)) (voutierBound d)
    let B : ℝ := max 3 ((Finset.univ.sup fun i => (b i).natAbs : ℕ) : ℝ)
    let Nv : ℝ := Sum.elim (fun _ => 2) (fun p => (p.asIdeal.absNorm : ℝ)) v
    let c₁ : ℝ := 12 * (16 * Real.exp 1 * d) ^ (3 * n + 2) * (max 1 (Real.log d)) ^ 2
    normLogAbs v (∏ i, α i ^ b i - 1) > -(c₁ * (Nv / Real.log Nv) * Θ * Real.log B) := sorry

/-- Matveev's bound for positive rationals with the heights separated (replacing Tijdeman's
Theorem 2 and Baker's Theorem B). -/
theorem log_abs_linearForm_gt {n : ℕ} (hn : 1 ≤ n) (a : Fin n → ℚ) (ha : ∀ i, 0 < a i)
    (ha1 : ∀ i, a i ≠ 1) (b : Fin n → ℤ) {B : ℝ}
    (hB : ∀ i, |(b i : ℝ)| ≤ B) (hΛ : ∑ i, (b i : ℝ) * Real.log (a i) ≠ 0) :
    let A : Fin n → ℝ := fun i => max (Real.log (Height.mulHeight₁ (a i))) 0.16
    Real.log |∑ i, (b i : ℝ) * Real.log (a i)| >
      -((Real.exp 1 * n / 2) * 30 ^ (n + 3) * (n : ℝ) ^ (3.5 : ℝ) * (∏ i, A i) *
        Real.log (Real.exp 1 * B)) := sorry

end DiophantineApproximation.EffectiveApplications

namespace DiophantineApproximation.EffectiveApplications

/-! ## Thue and Pell equations over S-integers -/

section ThuePell

variable {K : Type*} [Field K] [NumberField K]

/-- The binary form `F(x, y) = Σ_{i ≤ n} aᵢ xⁱ y^{n-i}` attached to `f = Σ aᵢ Xⁱ` and `n`. -/
def binaryFormEval {R : Type*} [CommRing R] (f : R[X]) (n : ℕ) (x y : R) : R :=
  ∑ i ∈ Finset.range (n + 1), f.coeff i * x ^ i * y ^ (n - i)

/-- `R` is the S-regulator of `K`. -/
def IsSRegulator (S : Finset (HeightOneSpectrum (𝓞 K))) (R : ℝ) : Prop :=
  ∃ (k : ℕ) (ε : Fin k → Kˣ) (v : Fin k → Place K),
    IsFundamentalSUnitSystem (S : Set (HeightOneSpectrum (𝓞 K))) ε ∧ Function.Injective v ∧
      (∀ j p, v j = .inr p → p ∈ S) ∧ R = sRegulatorOf ε v

/-- `P_S = max N𝔭` (`1` if `S` is empty). -/
def maxNormS (S : Finset (HeightOneSpectrum (𝓞 K))) : ℝ :=
  max 1 (S.sup fun p => p.asIdeal.absNorm : ℕ)

/-- `Q_S = ∏ N𝔭`. -/
def prodNormS (S : Finset (HeightOneSpectrum (𝓞 K))) : ℝ :=
  ∏ p ∈ S, (p.asIdeal.absNorm : ℝ)

/-- `c₁(s, d) = s^{2s+4}·2^{7s+60}·d^{2s+d+2}` (BEG §3.6). -/
def thueConstant (s d : ℕ) : ℝ := (s : ℝ) ^ (2 * s + 4) * 2 ^ (7 * s + 60) * (d : ℝ) ^ (2 * s + d + 2)

variable (S : Finset (HeightOneSpectrum (𝓞 K)))

/-- Effective finiteness of Thue equations over the S-integers (split form, degree `n ≥ 3`,
nonzero discriminant); the solutions lie in an explicitly computable finite set. -/
theorem thue_sInteger_finite {f : K[X]} {n : ℕ} (hn : 3 ≤ n) (hdeg : f.natDegree = n)
    (hsplit : f.Splits) (hD : f.discr ≠ 0) {β : K} (hβ : β ≠ 0) :
    {p : K × K | p.1 ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K ∧
      p.2 ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K ∧ binaryFormEval f n p.1 p.2 = β}.Finite :=
  sorry

/-- BEG Proposition 3.11 (Győry–Yu, Corollary 3). -/
theorem thue_sInteger_absLogHeight_le {f : K[X]} {n : ℕ} (hn : 3 ≤ n) (hdeg : f.natDegree = n)
    (hsplit : f.Splits) (hD : f.discr ≠ 0) {β : K} (hβ : β ≠ 0) {A B R : ℝ}
    (hA : ∀ i, absLogHeight₁ (f.coeff i) ≤ A) (hB : absLogHeight₁ β ≤ B) (hR : IsSRegulator S R)
    {x y : K} (hx : x ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K)
    (hy : y ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) (hxy : binaryFormEval f n x y = β) :
    let s : ℕ := Fintype.card (InfinitePlace K) + S.card
    let d : ℕ := Module.finrank ℚ K
    max (absLogHeight₁ x) (absLogHeight₁ y) ≤
      thueConstant s d * (n : ℝ) ^ 6 * maxNormS S * R *
        (1 + max 1 (Real.log R) / max 1 (Real.log (maxNormS S))) *
        (Units.regulator K + classNumber K / d * Real.log (prodNormS S) + n * d * A + B) := sorry

/-- Effective finiteness of the system `γ₁x₁² − γ₂x₂² = β₁₂`, `γ₁x₁² − γ₃x₃² = β₁₃` over the
S-integers, when `β₁₂ ≠ β₁₃` and `γ₁/γ₂`, `γ₁/γ₃` are squares in `K`. -/
theorem pellSystem_sInteger_finite {γ₁ γ₂ γ₃ β₁₂ β₁₃ : K} (h₁ : γ₁ ≠ 0) (h₂ : γ₂ ≠ 0)
    (h₃ : γ₃ ≠ 0) (h₁₂ : β₁₂ ≠ 0) (h₁₃ : β₁₃ ≠ 0) (hne : β₁₂ ≠ β₁₃)
    (hsq₂ : IsSquare (γ₁ / γ₂)) (hsq₃ : IsSquare (γ₁ / γ₃)) :
    {x : Fin 3 → K | (∀ i, x i ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) ∧
      γ₁ * x 0 ^ 2 - γ₂ * x 1 ^ 2 = β₁₂ ∧ γ₁ * x 0 ^ 2 - γ₃ * x 2 ^ 2 = β₁₃}.Finite := sorry

/-- BEG Proposition 3.12 (Győry–Yu, Theorem 3). -/
theorem pellSystem_sInteger_absLogHeight_le {γ₁ γ₂ γ₃ β₁₂ β₁₃ : K} (h₁ : γ₁ ≠ 0) (h₂ : γ₂ ≠ 0)
    (h₃ : γ₃ ≠ 0) (h₁₂ : β₁₂ ≠ 0) (h₁₃ : β₁₃ ≠ 0) (hne : β₁₂ ≠ β₁₃)
    (hsq₂ : IsSquare (γ₁ / γ₂)) (hsq₃ : IsSquare (γ₁ / γ₃)) {A B R : ℝ}
    (hA : absLogHeight₁ γ₁ ≤ A ∧ absLogHeight₁ γ₂ ≤ A ∧ absLogHeight₁ γ₃ ≤ A)
    (hB : absLogHeight₁ β₁₂ ≤ B ∧ absLogHeight₁ β₁₃ ≤ B) (hR : IsSRegulator S R)
    {x : Fin 3 → K} (hx : ∀ i, x i ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K)
    (h12 : γ₁ * x 0 ^ 2 - γ₂ * x 1 ^ 2 = β₁₂) (h13 : γ₁ * x 0 ^ 2 - γ₃ * x 2 ^ 2 = β₁₃) (i : Fin 3) :
    let s : ℕ := Fintype.card (InfinitePlace K) + S.card
    let d : ℕ := Module.finrank ℚ K
    absLogHeight₁ (x i) ≤
      thueConstant s d * maxNormS S * R *
        (1 + max 1 (Real.log R) / max 1 (Real.log (maxNormS S))) *
        (Units.regulator K + classNumber K / d * Real.log (prodNormS S) + d * A + B) := sorry

/-- Unit test: over `ℤ` the Pell equation alone has infinitely many solutions, so the second
equation of the system is needed. -/
example : {p : ℤ × ℤ | p.2 ^ 2 - 2 * p.1 ^ 2 = 1}.Infinite := sorry

end ThuePell

/-! ## Superelliptic and hyperelliptic equations over S-integers (BEG §§2, 4) -/

section Superelliptic

variable {K : Type*} [Field K] [NumberField K] (S : Finset (HeightOneSpectrum (𝓞 K)))

/-- The primes of `𝓞_L` above a set of primes of `𝓞_K`. -/
def primesAbove (L : Type*) [Field L] [NumberField L] [Algebra K L] :
    Set (HeightOneSpectrum (𝓞 L)) :=
  {P | ∃ p ∈ S, P.asIdeal.comap (algebraMap (𝓞 K) (𝓞 L)) = p.asIdeal}

/-- The S-norm in an extension: `N_T(x) = N_S(x)^{[L:K]}` for `x ∈ K`, `T` the primes above `S`. -/
theorem sNorm_algebraMap (L : Type*) [Field L] [NumberField L] [Algebra K L]
    (T : Finset (HeightOneSpectrum (𝓞 L))) (hT : (T : Set (HeightOneSpectrum (𝓞 L))) = primesAbove S L)
    (x : K) : sNorm T (algebraMap K L x) = sNorm S x ^ Module.finrank K L := sorry

/-- BEG Lemma 4.2 (i), stated in the field `K = L_i` containing the root `α` and over its ring of
integers (`S = ∅`): `[a₀(x − α)] = 𝔆·𝔄^m` with `𝔆 ⊇ [a₀ b D(f)]^{m-1}`. -/
theorem superelliptic_ideal_power_decomposition {f : (𝓞 K)[X]} (hD : f.discr ≠ 0) {b : 𝓞 K}
    (hb : b ≠ 0) {m : ℕ} (hm : 2 ≤ m) {α : K} (hα : Polynomial.aeval α f = 0) {x y : 𝓞 K}
    (hy : y ≠ 0) (hxy : f.eval x = b * y ^ m) :
    ∃ (z : 𝓞 K) (C A : Ideal (𝓞 K)), (z : K) = (f.leadingCoeff : K) * ((x : K) - α) ∧
      Ideal.span {z} = C * A ^ m ∧ (Ideal.span {f.leadingCoeff * b * f.discr}) ^ (m - 1) ≤ C :=
  sorry

/-- `x − α = γ ξ^m` with `γ` from a finite set independent of the solution (effective form of BEG
Lemma 4.2 (ii)); `T` is the set of primes of `L` above `S`. -/
theorem exists_finset_superelliptic_power_decomposition (L : Type*) [Field L] [NumberField L]
    [Algebra K L] {f : K[X]} (hf : ∀ i, f.coeff i ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K)
    (hD : f.discr ≠ 0) {b : K} (hb : b ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K)
    (hb0 : b ≠ 0) {m : ℕ} (hm : 2 ≤ m) {α : L} (hα : Polynomial.aeval α f = 0) :
    ∃ Γ : Finset L, ∀ x y : K, x ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K →
      y ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K → y ≠ 0 → f.eval x = b * y ^ m →
        ∃ γ ∈ Γ, ∃ ξ ∈ (primesAbove S L).integer L, algebraMap K L x - α = γ * ξ ^ m := sorry

/-- BEG Lemma 4.2 (ii) with the explicit height bound for `γ`. -/
theorem superelliptic_power_decomposition_absLogHeight_le (L : Type*) [Field L] [NumberField L]
    [Algebra K L] {f : K[X]} {n : ℕ} (hn : f.natDegree = n) (hn2 : 2 ≤ n)
    (hf : ∀ i, f.coeff i ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K)
    (hD : f.discr ≠ 0) {b : K} (hb : b ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K)
    (hb0 : b ≠ 0) {m : ℕ} (hm : 2 ≤ m) {α : L} (hα : Polynomial.aeval α f = 0)
    (hL : IntermediateField.adjoin K {α} = ⊤) {x y : K}
    (hx : x ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K)
    (hy : y ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) (hy0 : y ≠ 0)
    (hxy : f.eval x = b * y ^ m) :
    let d : ℕ := Module.finrank ℚ K
    ∃ γ : L, ∃ ξ ∈ (primesAbove S L).integer L, algebraMap K L x - α = γ * ξ ^ m ∧
      absLogHeight₁ γ ≤ m * ((n : ℝ) ^ 3 * d) ^ (n * d) * Real.exp (2 * n * d * superellipticHeight b f) *
        |(discr K : ℝ)| ^ n * (80 * ((d : ℝ) * n) ^ (d * n + 2) + Real.log (prodNormS S) / d) := sorry

/-- Subtracting two decompositions gives a Thue equation of degree `m` (BEG (4.23)). -/
theorem superelliptic_thue_equation {L : Type*} [Field L] {x α₁ α₂ γ₁ γ₂ ξ₁ ξ₂ : L} {m : ℕ}
    (h₁ : x - α₁ = γ₁ * ξ₁ ^ m) (h₂ : x - α₂ = γ₂ * ξ₂ ^ m) :
    γ₁ * ξ₁ ^ m - γ₂ * ξ₂ ^ m = α₂ - α₁ := by
  rw [← h₁, ← h₂]; ring

/-- Subtracting three decompositions with `m = 2` gives a system of two Pell equations (BEG (4.30)). -/
theorem hyperelliptic_pell_system {L : Type*} [Field L] {x : L} {α γ ξ : Fin 3 → L}
    (h : ∀ i, x - α i = γ i * ξ i ^ 2) :
    γ 0 * ξ 0 ^ 2 - γ 1 * ξ 1 ^ 2 = α 1 - α 0 ∧ γ 0 * ξ 0 ^ 2 - γ 2 * ξ 2 ^ 2 = α 2 - α 0 := by
  refine ⟨?_, ?_⟩ <;> rw [← h, ← h] <;> ring

/-- Effective finiteness of `f(x) = b y^m` over the S-integers (Baker; Trelina, Brindza). -/
theorem superelliptic_sInteger_finite {f : K[X]} {n : ℕ} (hn : f.natDegree = n)
    (hf : ∀ i, f.coeff i ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) (hD : f.discr ≠ 0)
    {b : K} (hb : b ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) (hb0 : b ≠ 0) {m : ℕ}
    (hmn : (3 ≤ m ∧ 2 ≤ n) ∨ (m = 2 ∧ 3 ≤ n)) :
    {p : K × K | p.1 ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K ∧
      p.2 ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K ∧ f.eval p.1 = b * p.2 ^ m}.Finite :=
  sorry

/-- BEG Theorem 2.1. -/
theorem beg_superelliptic {f : K[X]} {n : ℕ} (hn : f.natDegree = n) (hn2 : 2 ≤ n)
    (hf : ∀ i, f.coeff i ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) (hD : f.discr ≠ 0)
    {b : K} (hb : b ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) (hb0 : b ≠ 0) {m : ℕ}
    (hm : 3 ≤ m) {x y : K} (hx : x ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K)
    (hy : y ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) (hxy : f.eval x = b * y ^ m) :
    let s : ℕ := Fintype.card (InfinitePlace K) + S.card
    let d : ℕ := Module.finrank ℚ K
    let bound : ℝ := (6 * n * s : ℝ) ^ (14 * m ^ 3 * n ^ 3 * s) * |(discr K : ℝ)| ^ (2 * m ^ 2 * n ^ 2) *
      prodNormS S ^ (3 * m ^ 2 * n ^ 2) * Real.exp (8 * m ^ 2 * n ^ 3 * d * superellipticHeight b f)
    absLogHeight₁ x ≤ bound ∧ absLogHeight₁ y ≤ bound := sorry

/-- BEG Theorem 2.2. -/
theorem beg_hyperelliptic {f : K[X]} {n : ℕ} (hn : f.natDegree = n) (hn3 : 3 ≤ n)
    (hf : ∀ i, f.coeff i ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) (hD : f.discr ≠ 0)
    {b : K} (hb : b ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) (hb0 : b ≠ 0)
    {x y : K} (hx : x ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K)
    (hy : y ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) (hxy : f.eval x = b * y ^ 2) :
    let s : ℕ := Fintype.card (InfinitePlace K) + S.card
    let d : ℕ := Module.finrank ℚ K
    let bound : ℝ := (4 * n * s : ℝ) ^ (2 ^ 12 * n ^ 4 * s) * |(discr K : ℝ)| ^ (8 * n ^ 3) *
      prodNormS S ^ (20 * n ^ 3) * Real.exp (50 * n ^ 4 * d * superellipticHeight b f)
    absLogHeight₁ x ≤ bound ∧ absLogHeight₁ y ≤ bound := sorry

/-- Unit test: the hyperelliptic hypothesis `n ≥ 3` is needed (`y² = 2x² + 1` over `ℤ`). -/
example : {p : ℤ × ℤ | p.2 ^ 2 = 2 * p.1 ^ 2 + 1}.Infinite := sorry

/-! ## Variable exponents (BEG §5) -/

/-- The large-place estimate of BEG (5.13)–(5.15), in the field `K` containing two distinct roots:
some place of `S` or at infinity makes `(x − α₁)/(x − α₂)` close to `1`. -/
theorem exists_place_normLogAbs_one_sub_le {f : K[X]} {n : ℕ} (hn : f.natDegree = n)
    {α₁ α₂ : K} (h₁ : f.eval α₁ = 0) (h₂ : f.eval α₂ = 0) (hne : α₁ ≠ α₂) {x : K}
    (hx : x ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) (hx₂ : x ≠ α₂)
    (hX : absLogHeight₁ (x - α₁) ≤ absLogHeight₁ (x - α₂))
    (hlarge : absLogHeight₁ α₂ < absLogHeight₁ (x - α₂)) :
    let t : ℕ := Fintype.card (InfinitePlace K) + S.card
    let dL : ℕ := Module.finrank ℚ K
    ∃ v : Place K, (∀ p, v = .inr p → p ∈ S) ∧
      normLogAbs v (1 - (x - α₁) / (x - α₂)) ≤
        (n + 1) * Sum.elim (fun w : InfinitePlace K => (w.mult : ℝ)) (fun _ => 0) v * Real.log 2 +
          dL * polyLogHeight f - absLogHeight₁ (x - α₂) * dL / t := sorry

/-- BEG Theorem 2.3 with the corrected constant (sourceIssues E701): if `f(x) = b y^m` has a
solution in S-integers with `y` neither `0` nor a root of unity, then
`m ≤ (10 n² s)^{46 n s} |D_K|^{8n} P_S^{n²} e^{15 n d ĥ}`. -/
theorem beg_schinzel_tijdeman {f : K[X]} {n : ℕ} (hn : f.natDegree = n) (hn2 : 2 ≤ n)
    (hf : ∀ i, f.coeff i ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) (hD : f.discr ≠ 0)
    {b : K} (hb : b ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) (hb0 : b ≠ 0) {m : ℕ}
    {x y : K} (hx : x ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K)
    (hy : y ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) (hy0 : y ≠ 0)
    (hyroot : ¬ ∃ k : ℕ, 0 < k ∧ y ^ k = 1) (hxy : f.eval x = b * y ^ m) :
    let s : ℕ := Fintype.card (InfinitePlace K) + S.card
    let d : ℕ := Module.finrank ℚ K
    (m : ℝ) ≤ (10 * n ^ 2 * s : ℝ) ^ (46 * n * s) * |(discr K : ℝ)| ^ (8 * n) *
      maxNormS S ^ (n ^ 2) * Real.exp (15 * n * d * superellipticHeight b f) := sorry

/-- The effective Schinzel–Tijdeman theorem over S-integers. -/
theorem schinzel_tijdeman_sInteger {f : K[X]} (hn2 : 2 ≤ f.natDegree)
    (hf : ∀ i, f.coeff i ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) (hD : f.discr ≠ 0)
    {b : K} (hb : b ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) (hb0 : b ≠ 0) :
    ∃ C : ℕ, ∀ (m : ℕ) (x y : K), x ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K →
      y ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K → y ≠ 0 →
        (¬ ∃ k : ℕ, 0 < k ∧ y ^ k = 1) → f.eval x = b * y ^ m → m ≤ C := sorry

end Superelliptic

/-! ## Catalan's equation (Tijdeman) -/

/-- Reduction to distinct prime exponents. -/
theorem catalan_prime_exponents {x y m n : ℕ} (hx : 2 ≤ x) (hy : 2 ≤ y) (hm : 2 ≤ m) (hn : 2 ≤ n)
    (h : (x : ℤ) ^ m - (y : ℤ) ^ n = 1) {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpm : p ∣ m)
    (hqn : q ∣ n) :
    ((x ^ (m / p) : ℕ) : ℤ) ^ p - ((y ^ (n / q) : ℕ) : ℤ) ^ q = 1 ∧ p ≠ q := sorry

/-- The cases with exponent `2`, through Schinzel–Tijdeman and Baker. -/
theorem catalan_exponent_two :
    ∃ C : ℕ, ∀ p q X Y : ℕ, p.Prime → q.Prime → p ≠ q → (p = 2 ∨ q = 2) → 2 ≤ X → 2 ≤ Y →
      (X : ℤ) ^ p - (Y : ℤ) ^ q = 1 → p ≤ C ∧ q ≤ C ∧ X ≤ C ∧ Y ≤ C := sorry

/-- Cassels-type factorisations for odd prime exponents. -/
theorem cassels_factorisation {p q x y : ℕ} (hp : p.Prime) (hq : q.Prime) (hp2 : p ≠ 2)
    (hq2 : q ≠ 2) (hpq : p ≠ q) (hx : 2 ≤ x) (hy : 2 ≤ y) (h : (x : ℤ) ^ p - (y : ℤ) ^ q = 1) :
    ∃ δ₁ δ₂ : ℤ, (δ₁ = -1 ∨ δ₁ = 0) ∧ (δ₂ = -1 ∨ δ₂ = 0) ∧ ∃ ρ σ : ℕ, 2 ≤ ρ ∧ 2 ≤ σ ∧
      (p : ℚ) ^ δ₁ * (ρ : ℚ) ^ q = x - 1 ∧ (q : ℚ) ^ δ₂ * (σ : ℚ) ^ p = y + 1 := sorry

/-- Tijdeman (14): the smaller exponent is at most `c₁ (log of the larger)³`. -/
theorem tijdeman_smaller_exponent :
    ∃ c₁ : ℝ, 0 < c₁ ∧ ∀ p q x y : ℕ, p.Prime → q.Prime → p ≠ 2 → q ≠ 2 → p ≠ q → 2 ≤ x → 2 ≤ y →
      (x : ℤ) ^ p - (y : ℤ) ^ q = 1 →
        (min p q : ℝ) ≤ c₁ * Real.log (max p q) ^ 3 := sorry

/-- Tijdeman: the larger exponent is bounded by an absolute constant. -/
theorem tijdeman_larger_exponent :
    ∃ C : ℕ, ∀ p q x y : ℕ, p.Prime → q.Prime → p ≠ 2 → q ≠ 2 → p ≠ q → 2 ≤ x → 2 ≤ y →
      (x : ℤ) ^ p - (y : ℤ) ^ q = 1 → max p q ≤ C := sorry

/-- Tijdeman's theorem: Catalan's equation has effectively bounded solutions. -/
theorem tijdeman_catalan_bounded :
    ∃ C : ℕ, ∀ x y m n : ℕ, 2 ≤ x → 2 ≤ y → 2 ≤ m → 2 ≤ n → (x : ℤ) ^ m - (y : ℤ) ^ n = 1 →
      m ≤ C ∧ n ≤ C ∧ x ≤ C ∧ y ≤ C := sorry

/-- Check: `3² − 2³ = 1`. -/
example : ((3 : ℕ) : ℤ) ^ 2 - ((2 : ℕ) : ℤ) ^ 3 = 1 := by norm_num

/-! ## A uniform bound for Thue equations -/

/-- For a primitive irreducible `F ∈ ℤ[X, Y]` with `a₀ ≠ 0` and a zero `θ` of `F(X, 1)` generating
`L`, the ideal `𝔞_θ = (1, θ)` has absolute norm `1/|a₀|`, and `(x − θ y) = 𝔟·𝔞_θ` with
`N𝔟 = |F(x, y)|`. -/
theorem primitive_binaryForm_ideal {L : Type*} [Field L] [NumberField L] {f : ℤ[X]}
    (hirr : Irreducible f) (hprim : f.IsPrimitive) {θ : L} (hθ : Polynomial.aeval θ f = 0)
    (hL : IntermediateField.adjoin ℚ {θ} = ⊤) :
    let 𝔞 : FractionalIdeal (𝓞 L)⁰ L :=
      FractionalIdeal.spanSingleton (𝓞 L)⁰ 1 ⊔ FractionalIdeal.spanSingleton (𝓞 L)⁰ θ
    FractionalIdeal.absNorm 𝔞 = 1 / |(f.leadingCoeff : ℚ)| ∧
      ∀ x y : ℤ, ∃ 𝔟 : Ideal (𝓞 L),
        FractionalIdeal.spanSingleton (𝓞 L)⁰ ((x : L) - θ * y) = (𝔟 : FractionalIdeal (𝓞 L)⁰ L) * 𝔞 ∧
          (𝔟.absNorm : ℤ) = |binaryFormEval f f.natDegree x y| := sorry

/-- The number of solutions of `F(x, y) = 1` is bounded in terms of the degree only. -/
theorem uniform_thue_bound (n : ℕ) (hn : 3 ≤ n) :
    ∃ N : ℕ, ∀ f : ℤ[X], f.natDegree = n → f.discr ≠ 0 →
      {p : ℤ × ℤ | binaryFormEval f n p.1 p.2 = 1}.Finite ∧
      {p : ℤ × ℤ | binaryFormEval f n p.1 p.2 = 1}.ncard ≤ N := sorry

/-- Cubic forms: an absolute bound (ArithmeticStatistics ST.1). -/
theorem uniform_cubic_thue_bound :
    ∃ N : ℕ, ∀ f : ℤ[X], f.natDegree = 3 → f.discr ≠ 0 →
      {p : ℤ × ℤ | binaryFormEval f 3 p.1 p.2 = 1}.Finite ∧
      {p : ℤ × ℤ | binaryFormEval f 3 p.1 p.2 = 1}.ncard ≤ N := uniform_thue_bound 3 le_rfl

/-- Check: `X³ − 2Y³ = 1` has the solutions `(1, 0)` and `(−1, −1)`. -/
example : binaryFormEval (X ^ 3 - C (2 : ℤ)) 3 1 0 = 1 ∧
    binaryFormEval (X ^ 3 - C (2 : ℤ)) 3 (-1) (-1) = 1 := sorry

end DiophantineApproximation.EffectiveApplications
