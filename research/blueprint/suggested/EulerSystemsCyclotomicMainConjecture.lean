import Mathlib.NumberTheory.Cyclotomic.Gal
import Mathlib.Tactic.NormNum
import Mathlib.RingTheory.Coprime.Lemmas
import Mathlib.Data.ZMod.Basic
import Mathlib.NumberTheory.Cyclotomic.PrimitiveRoots
import Mathlib.RingTheory.Norm.Transitivity
import Mathlib.RingTheory.RootsOfUnity.Complex
import Mathlib.RingTheory.RootsOfUnity.CyclotomicUnits
import Mathlib.RepresentationTheory.Invariants
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic
import Mathlib.GroupTheory.Index
import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic
import Mathlib.NumberTheory.Zsqrtd.Basic

/-!
# Suggested declarations: Euler systems and the cyclotomic main conjecture, layer L0

This file is a prototype in the form of upstream's `Suggested.lean`. Every proof is `sorry`; the
statements elaborate against Mathlib at the pinned commit. The complete targets, with their
sources, API outlines and unit tests, are in the blueprint packet and the roadmap document.

Layer L0 builds the Euler system of cyclotomic units for `ℤ_p(1)` (Rubin, *Euler systems*,
Chapter III §2.1) and its `χ`-twist (§2.2, Definition 2.2 and equation (6)):

* the distribution relation for `1 - ζ`, over any tower `ℚ(μ_m) ⊆ ℚ(μ_{mℓ})` of cyclotomic
  fields, with the sign dictionary to Rubin's `ζ - 1` convention;
* the `p`-extended cyclotomic numbers `c̃_m = N_{ℚ(μ_{mp})/ℚ(μ_m)}(1 - ζ_{mp})` and their real
  norms, with the tower and auxiliary-prime relations;
* `χ`-components of modules over a finite abelian group, the twisted sums that give the
  `χ`-cyclotomic generators, and the Frobenius identity behind `c_ℚ = ξ^{1 - χ⁻¹(p)}`.

The tower of cyclotomic fields is requested from `IntegralIwasawaTheory:L0`. The stand-ins
`zeta`, `Qmu`, `QmuPlus` below exist only so that the signatures can be stated; the supplier's
declarations replace them. The Kummer classes use Tau Ceti's `TauCeti.kummerMap`; no Tau Ceti
build at the pinned commit was available, so those signatures are recorded as comments.
-/

noncomputable section

open Polynomial
open scoped TensorProduct

namespace TauCeti.CyclotomicEulerSystem

/-! ## The distribution relation over a cyclotomic step -/

section Distribution

variable {K L : Type*} [Field K] [Field L] [CharZero K] [CharZero L] [Algebra K L]
  {m ℓ : ℕ} [NeZero m] [Fact ℓ.Prime]
  [IsCyclotomicExtension {m} ℚ K] [IsCyclotomicExtension {m * ℓ} ℚ L]
  {ζ : L} {η : K}

/-- **`L0/minpoly-step-of-dvd`**: if `ℓ ∣ m`, the minimal polynomial of a primitive `mℓ`-th root
`ζ` over `ℚ(μ_m)` is `X^ℓ - ζ^ℓ`. -/
theorem minpoly_eq_X_pow_sub_of_dvd (hζ : IsPrimitiveRoot ζ (m * ℓ))
    (hη : algebraMap K L η = ζ ^ ℓ) (hdvd : ℓ ∣ m) :
    minpoly K ζ = X ^ ℓ - C η := sorry

/-- **`L0/minpoly-step-of-not-dvd`**: if `ℓ ∤ m` and `ℓ ℓ' ≡ 1 (mod m)`, the minimal polynomial
of `ζ` over `ℚ(μ_m)` is `(X^ℓ - η)/(X - η^{ℓ'})`; `η^{ℓ'}` is the root of `X^ℓ - η` of order
`m`. -/
theorem minpoly_mul_X_sub_eq_of_not_dvd (hζ : IsPrimitiveRoot ζ (m * ℓ))
    (hη : algebraMap K L η = ζ ^ ℓ) (hndvd : ¬ ℓ ∣ m) {ℓ' : ℕ} (hℓ' : ℓ * ℓ' ≡ 1 [MOD m]) :
    minpoly K ζ * (X - C (η ^ ℓ')) = X ^ ℓ - C η := sorry

/-- **`L0/distribution-relation-of-dvd`**: `N_{ℚ(μ_{mℓ})/ℚ(μ_m)}(1 - ζ_{mℓ}) = 1 - ζ_m` when
`ℓ ∣ m`. -/
theorem norm_one_sub_of_dvd (hζ : IsPrimitiveRoot ζ (m * ℓ))
    (hη : algebraMap K L η = ζ ^ ℓ) (hdvd : ℓ ∣ m) :
    Algebra.norm K (1 - ζ) = 1 - η := sorry

/-- **`L0/distribution-relation-of-not-dvd`**: `N(1 - ζ_{mℓ}) · (1 - ζ_m^{ℓ'}) = 1 - ζ_m` when
`ℓ ∤ m`, that is `N(1 - ζ_{mℓ}) = (1 - ζ_m)^{1 - Fr_ℓ⁻¹}` for `m > 1`. -/
theorem norm_one_sub_mul_of_not_dvd (hζ : IsPrimitiveRoot ζ (m * ℓ))
    (hη : algebraMap K L η = ζ ^ ℓ) (hndvd : ¬ ℓ ∣ m) {ℓ' : ℕ} (hℓ' : ℓ * ℓ' ≡ 1 [MOD m]) :
    Algebra.norm K (1 - ζ) * (1 - η ^ ℓ') = 1 - η := sorry

/-- **`L0/distribution-relation-frobenius`**: the same relation with the arithmetic Frobenius
`Fr_ℓ ∈ Gal(ℚ(μ_m)/ℚ)`, `Fr_ℓ(ζ_m) = ζ_m^ℓ`, read through Mathlib's `autEquivPow`. -/
theorem norm_one_sub_mul_frobenius (hζ : IsPrimitiveRoot ζ (m * ℓ))
    (hη : algebraMap K L η = ζ ^ ℓ) (hcop : ℓ.Coprime m) :
    Algebra.norm K (1 - ζ) *
        ((IsCyclotomicExtension.autEquivPow K
            (cyclotomic.irreducible_rat (NeZero.pos m))).symm (ZMod.unitOfCoprime ℓ hcop)⁻¹
          (1 - η)) = 1 - η := sorry

/-- **`L0/distribution-relation-rubin-convention`**: the `ζ - 1` convention differs by the sign
`(-1)^{[ℚ(μ_{mℓ}) : ℚ(μ_m)]}`. With `[ℚ(μ_{mℓ}) : ℚ(μ_m)] = ℓ` or `ℓ - 1` this corrects Rubin's
(III.2): for `ℓ = 2` the first two cases carry a sign `-1`. -/
theorem norm_sub_one_eq_neg_one_pow_mul :
    Algebra.norm K (ζ - 1) = (-1) ^ Module.finrank K L * Algebra.norm K (1 - ζ) := sorry

end Distribution

/-- **`L0/distribution-relation-conductor-one`**: `N_{ℚ(μ_ℓ)/ℚ}(1 - ζ_ℓ) = ℓ` for every prime
`ℓ`, including `ℓ = 2`. -/
theorem norm_one_sub_of_prime {L : Type*} [Field L] [CharZero L] {ℓ : ℕ} [Fact ℓ.Prime]
    [IsCyclotomicExtension {ℓ} ℚ L] {ζ : L} (hζ : IsPrimitiveRoot ζ ℓ) :
    Algebra.norm ℚ (1 - ζ) = ℓ := sorry

/-! ## Interface requested from `IntegralIwasawaTheory:L0`

Stand-ins used only to state the signatures that follow. -/

/-- The compatible roots of unity `ζ_m = exp(2πi/m)`, so that `ζ_{mn}^n = ζ_m`. -/
def zeta (m : ℕ) : ℂ := Complex.exp (2 * Real.pi * Complex.I / m)

/-- `ℚ(μ_m) = ℚ(ζ_m) ⊆ ℂ`. -/
abbrev Qmu (m : ℕ) : IntermediateField ℚ ℂ := IntermediateField.adjoin ℚ {zeta m}

/-- `ℚ(μ_m)^+ = ℚ(ζ_m + ζ_m⁻¹) ⊆ ℂ`. -/
abbrev QmuPlus (m : ℕ) : IntermediateField ℚ ℂ :=
  IntermediateField.adjoin ℚ {zeta m + (zeta m)⁻¹}

/-- Supplier API: the tower inclusions `ℚ(μ_m) ⊆ ℚ(μ_n)` for `m ∣ n`. -/
theorem Qmu_mono {m n : ℕ} (h : m ∣ n) : Qmu m ≤ Qmu n := sorry

/-- Supplier API: `ℚ(μ_m)^+ ⊆ ℚ(μ_m)`. -/
theorem QmuPlus_le (m : ℕ) : QmuPlus m ≤ Qmu m := sorry

/-- The relative norm `N_{F/E}` of intermediate fields `E ≤ F` of `ℂ / ℚ`. -/
def relNorm {E F : IntermediateField ℚ ℂ} (h : E ≤ F) (x : F) : E :=
  Algebra.norm E (⟨x, (IntermediateField.mem_extendScalars h).2 x.2⟩ :
    IntermediateField.extendScalars h)

/-- `1 - ζ_m` as an element of `ℚ(μ_m)`. -/
def oneSubZeta (m : ℕ) : Qmu m :=
  1 - ⟨zeta m, IntermediateField.mem_adjoin_simple_self ℚ (zeta m)⟩

/-! ## The `p`-extended cyclotomic numbers (Rubin III.2.1) -/

variable (p : ℕ) [Fact p.Prime]

/-- **`L0/p-extended-cyclotomic-number`**: `c̃_m = N_{ℚ(μ_{mp})/ℚ(μ_m)}(1 - ζ_{mp}) ∈ ℚ(μ_m)ˣ`,
Rubin's `c̃_{m∞}` in the `1 - ζ` convention. -/
def pCycNumber (m : ℕ) : Qmu m :=
  relNorm (Qmu_mono (dvd_mul_right m p)) (oneSubZeta (m * p))

/-- API: if `p ∣ m` then `c̃_m = 1 - ζ_m` (Rubin, Remark III.2.1). -/
theorem pCycNumber_of_dvd {m : ℕ} (h : p ∣ m) : pCycNumber p m = oneSubZeta m := sorry

/-- API: `c̃_1 = p`. -/
theorem pCycNumber_one : (pCycNumber p 1 : ℂ) = p := sorry

/-- API: `c̃_m ≠ 0`. -/
theorem pCycNumber_ne_zero (m : ℕ) [NeZero m] : pCycNumber p m ≠ 0 := sorry

/-- API: Rubin's `c̃_{m∞} = N(ζ_{mp} - 1)` is `(-1)^{[ℚ(μ_{mp}) : ℚ(μ_m)]} c̃_m`. -/
theorem relNorm_zeta_sub_one_eq (m : ℕ) [NeZero m] :
    relNorm (Qmu_mono (dvd_mul_right m p)) (-oneSubZeta (m * p)) =
      (-1) ^ (Module.finrank ℚ (Qmu (m * p)) / Module.finrank ℚ (Qmu m)) * pCycNumber p m :=
  sorry

/-- **`L0/p-extended-tower-relation`**: `N_{ℚ(μ_{mp})/ℚ(μ_m)}(c̃_{mp}) = c̃_m`. -/
theorem relNorm_pCycNumber_mul_p (m : ℕ) [NeZero m] :
    relNorm (Qmu_mono (dvd_mul_right m p)) (pCycNumber p (m * p)) = pCycNumber p m := sorry

/-- **`L0/p-extended-auxiliary-relation`**: for a prime `ℓ ≠ p`,
`N_{ℚ(μ_{mℓ})/ℚ(μ_m)}(c̃_{mℓ}) = c̃_m^{1 - Fr_ℓ⁻¹}` if `ℓ ∤ m` and `= c̃_m` if `ℓ ∣ m`. The
first case is stated multiplied out, with `σ` any automorphism of `ℚ(μ_m)` acting as `Fr_ℓ⁻¹`. -/
theorem relNorm_pCycNumber_mul_prime (m ℓ : ℕ) [NeZero m] [Fact ℓ.Prime] (hℓp : ℓ ≠ p)
    (σ : Qmu m ≃ₐ[ℚ] Qmu m)
    (hσ : ∀ ℓ' : ℕ, ℓ * ℓ' ≡ 1 [MOD m] → (σ ⟨zeta m, IntermediateField.mem_adjoin_simple_self ℚ _⟩ :
      ℂ) = zeta m ^ ℓ') :
    relNorm (Qmu_mono (dvd_mul_right m ℓ)) (pCycNumber p (m * ℓ)) *
        (if ℓ ∣ m then 1 else σ (pCycNumber p m)) = pCycNumber p m := sorry

/-- **`L0/p-extended-nontorsion`**: `c̃_{p^k} = 1 - ζ_{p^k}` has infinite order for `k ≥ 1`, and
`c̃_1 = p` has infinite order; the family is not torsion, unlike `(ζ⁻¹ - 1)/(ζ - 1) = -ζ⁻¹`. -/
theorem not_isOfFinOrder_pCycNumber_pow (k : ℕ) :
    ¬ IsOfFinOrder (pCycNumber p (p ^ k)) := sorry

/-- **`L0/real-p-extended-number`**: `c̃_m^+ = N_{ℚ(μ_m)/ℚ(μ_m)^+}(c̃_m)`, Rubin's `c̃_m`. -/
def pCycNumberReal (m : ℕ) : QmuPlus m :=
  relNorm (QmuPlus_le m) (pCycNumber p m)

/-- API: `c̃_m^+ = c̃_m · \bar{c̃_m}` in `ℂ` for `m > 2`. -/
theorem pCycNumberReal_eq_mul_conj {m : ℕ} (hm : 2 < m) :
    (pCycNumberReal p m : ℂ) = (pCycNumber p m : ℂ) * starRingEnd ℂ (pCycNumber p m) := sorry

/-- API: for `m ≤ 2`, `ℚ(μ_m)^+ = ℚ(μ_m)` and `c̃_m^+ = c̃_m`. -/
theorem pCycNumberReal_of_le_two {m : ℕ} (hm : m ≤ 2) :
    (pCycNumberReal p m : ℂ) = (pCycNumber p m : ℂ) := sorry

/-- API: `c̃_m^+ ≠ 0`. -/
theorem pCycNumberReal_ne_zero (m : ℕ) [NeZero m] : pCycNumberReal p m ≠ 0 := sorry

/-- **`L0/real-relations`**: the tower and auxiliary relations for `c̃^+`; the tower case. -/
theorem relNorm_pCycNumberReal_mul_p (m : ℕ) [NeZero m] (h : QmuPlus m ≤ QmuPlus (m * p)) :
    relNorm h (pCycNumberReal p (m * p)) = pCycNumberReal p m := sorry

/-- **`L0/smoothed-unit-comparison`**: for `m ≥ 2` and `a` prime to `m`,
`(1 - ζ_m^a)/(1 - ζ_m) = σ_a(1 - ζ_m)/(1 - ζ_m)` is the unit `∑_{i < a} ζ_m^i`; if `p ∣ m` it is
`c̃_m^{σ_a - 1}`. -/
theorem one_sub_pow_div_one_sub_eq_geom_sum {m a : ℕ} (hm : 2 ≤ m) (ha : a.Coprime m) :
    (1 - zeta m ^ a) / (1 - zeta m) = ∑ i ∈ Finset.range a, zeta m ^ i := sorry

/-! ## `χ`-components and twisted sums -/

section Chi

variable {O M Δ : Type*} [CommRing O] [AddCommGroup M] [Module O M] [Group Δ]

/-- **`L0/chi-component`**: the `χ`-component `M^χ = {x | δ x = χ(δ) x}` of an `O[Δ]`-module
(Rubin, Definition I.6.2, applied to `B^ ⊗ O`). -/
def chiComponent (ρ : Representation O Δ M) (χ : Δ →* Oˣ) : Submodule O M where
  carrier := {x | ∀ δ, ρ δ x = (χ δ : O) • x}
  zero_mem' := fun δ => by simp
  add_mem' := fun {x y} hx hy δ => by simp [hx δ, hy δ, smul_add]
  smul_mem' := fun c x hx δ => by
    simp only [map_smul, hx δ]
    exact smul_comm c _ x

variable (ρ : Representation O Δ M) (χ : Δ →* Oˣ)

/-- API: membership. -/
theorem mem_chiComponent (x : M) : x ∈ chiComponent ρ χ ↔ ∀ δ, ρ δ x = (χ δ : O) • x :=
  Iff.rfl

/-- API: the `χ`-component is the module of invariants of the twist by `χ⁻¹` (Rubin's second
description `B^χ ≅ (B ⊗ O_{χ⁻¹})^Δ`), read inside `M`. -/
theorem mem_chiComponent_iff_twist (x : M) :
    x ∈ chiComponent ρ χ ↔ ∀ δ, ((χ δ)⁻¹ : Oˣ) • ρ δ x = x := sorry

/-- API: functoriality; an equivariant `O`-linear map sends `χ`-components into `χ`-components. -/
theorem chiComponent_map {N : Type*} [AddCommGroup N] [Module O N] (σ : Representation O Δ N)
    (f : M →ₗ[O] N) (hf : ∀ δ x, f (ρ δ x) = σ δ (f x)) :
    (chiComponent ρ χ).map f ≤ chiComponent σ χ := sorry

variable [Fintype Δ]

/-- API: exactness when `|Δ|` is invertible: an equivariant surjection maps `M^χ` onto `N^χ`. -/
theorem chiComponent_map_eq {N : Type*} [AddCommGroup N] [Module O N] (σ : Representation O Δ N)
    (hΔ : IsUnit (Fintype.card Δ : O)) (f : M →ₗ[O] N) (hf : ∀ δ x, f (ρ δ x) = σ δ (f x))
    (hsurj : Function.Surjective f) :
    (chiComponent ρ χ).map f = chiComponent σ χ := sorry

/-- **`L0/chi-sum`**: the twisted sum `∑_δ χ(δ)⁻¹ δ x`; for `M = Lˣ ⊗ O` written additively this
is `∏_δ (δ x)^{χ⁻¹(δ)}`. -/
def chiSum (x : M) : M := ∑ δ : Δ, ((χ δ)⁻¹ : Oˣ) • ρ δ x

/-- API: twisted sums lie in the `χ`-component. -/
theorem chiSum_mem (x : M) : chiSum ρ χ x ∈ chiComponent ρ χ := sorry

/-- API: `chiSum` is `O`-linear. -/
theorem chiSum_add (x y : M) : chiSum ρ χ (x + y) = chiSum ρ χ x + chiSum ρ χ y := sorry

/-- API: on the `χ`-component, `chiSum` is multiplication by `|Δ|`. -/
theorem chiSum_of_mem {x : M} (hx : x ∈ chiComponent ρ χ) :
    chiSum ρ χ x = (Fintype.card Δ : O) • x := sorry

/-- API: if `|Δ|` is invertible, `|Δ|⁻¹ chiSum` is an idempotent projection onto `M^χ`, and
`M^χ` is a direct summand (Rubin: taking `χ`-components is exact). -/
theorem chiSum_chiSum (hΔ : IsUnit (Fintype.card Δ : O)) (x : M) :
    chiSum ρ χ (chiSum ρ χ x) = (Fintype.card Δ : O) • chiSum ρ χ x := sorry

/-- **`L0/chi-sum-frobenius`**: if `v = u - ρ(φ⁻¹) u` then `chiSum v = (1 - χ(φ)⁻¹) chiSum u`.
This is the algebra behind Rubin's `c_ℚ = ξ_{L,χ}^{1 - χ⁻¹(p)}`. -/
theorem chiSum_sub_frobenius (φ : Δ) (u : M) :
    chiSum ρ χ (u - ρ φ⁻¹ u) = (1 - (((χ φ)⁻¹ : Oˣ) : O)) • chiSum ρ χ u := sorry

end Chi

/-- **`L0/one-sub-root-of-unity-unit`**: for a root of unity `ω ≠ 1` with `ω^n = 1` and `n`
invertible, `1 - ω` is a unit. Applied to `ω = χ⁻¹(p)` of order prime to `p` when `χ(p) ≠ 1`. -/
theorem isUnit_one_sub_of_pow_eq_one {O : Type*} [CommRing O] [IsDomain O] {ω : O} {n : ℕ}
    (hω : ω ^ n = 1) (hω1 : ω ≠ 1) (hn : IsUnit (n : O)) : IsUnit (1 - ω) := sorry

/-! ## `χ`-cyclotomic units (Rubin III.2.2, Definition 2.2 and equation (6))

`L ⊆ ℚ(μ_f)` is the field cut out by `χ`, a subfield of `ℂ` finite over `ℚ`; `Lˣ ⊗ O` is written
`O ⊗[ℤ] Additive Lˣ`. -/

section ChiUnits

variable {f : ℕ} (L : IntermediateField ℚ ℂ) [FiniteDimensional ℚ L] (hL : L ≤ Qmu f)
  (O : Type*) [CommRing O]

/-- Stand-in (supplier `IntegralIwasawaTheory:L0`): the Galois action on `O ⊗ Lˣ`. -/
def unitsTensorRep : Representation O (L ≃ₐ[ℚ] L) (O ⊗[ℤ] Additive Lˣ) := sorry

/-- Stand-in: `x ∈ Lˣ` from a nonzero `x ∈ L`. -/
def toUnits (x : L) (hx : x ≠ 0) : Additive Lˣ := Additive.ofMul (Units.mk0 x hx)

/-- **`L0/chi-cyclotomic-generator`**: Rubin's `ξ_{L,χ} = ∏_{δ ∈ Gal(ℚ(μ_f)/ℚ)}
(ζ_f^δ - 1)^{χ⁻¹(δ)}`, written as the twisted sum of `1 ⊗ u` for `u = N_{ℚ(μ_f)/L}(1 - ζ_f)`. -/
def xiChi (χ : (L ≃ₐ[ℚ] L) →* Oˣ) : O ⊗[ℤ] Additive Lˣ :=
  chiSum (unitsTensorRep L O) χ (1 ⊗ₜ toUnits L (relNorm hL (oneSubZeta f)) sorry)

/-- API: `ξ_{L,χ}` lies in the `χ`-component. -/
theorem xiChi_mem (χ : (L ≃ₐ[ℚ] L) →* Oˣ) :
    xiChi L hL O χ ∈ chiComponent (unitsTensorRep L O) χ := sorry

/-- API: the `ζ - 1` and `1 - ζ` conventions give the same `ξ` for `χ ≠ 1`, because
`∑_δ χ⁻¹(δ) = 0`. -/
theorem xiChi_neg (χ : (L ≃ₐ[ℚ] L) →* Oˣ) (hχ : χ ≠ 1) :
    chiSum (unitsTensorRep L O) χ (1 ⊗ₜ toUnits L (relNorm hL (-oneSubZeta f)) sorry) =
      xiChi L hL O χ := sorry

/-- API: `Δ` acts on `ξ_{L,χ}` through `χ`. -/
theorem xiChi_smul (χ : (L ≃ₐ[ℚ] L) →* Oˣ) (δ : L ≃ₐ[ℚ] L) :
    unitsTensorRep L O δ (xiChi L hL O χ) = (χ δ : O) • xiChi L hL O χ := sorry

/-- The inclusion `O ⊗ E_L → O ⊗ Lˣ` of the global units. -/
def unitsIncl [NumberField L] :
    O ⊗[ℤ] Additive (NumberField.RingOfIntegers L)ˣ →ₗ[ℤ] O ⊗[ℤ] Additive Lˣ :=
  LinearMap.lTensor O
    (Units.map (algebraMap (NumberField.RingOfIntegers L) L : _ →* L)).toAdditive.toIntLinearMap

/-- **`L0/chi-cyclotomic-generator-unit`**: for `χ ≠ 1`, `ξ_{L,χ}` lies in `O ⊗ E_L`. -/
theorem xiChi_mem_units [NumberField L] (χ : (L ≃ₐ[ℚ] L) →* Oˣ) (hχ : χ ≠ 1) :
    xiChi L hL O χ ∈ Set.range (unitsIncl L O) := sorry

/-- **`L0/chi-cyclotomic-units`**: `C_{L,χ}`, the `O[Δ]`-span of `ξ_{L,χ}`; since `Δ` acts on
`ξ` through `χ`, it is the `O`-span. -/
def chiCyclotomicUnits (χ : (L ≃ₐ[ℚ] L) →* Oˣ) : Submodule O (O ⊗[ℤ] Additive Lˣ) :=
  Submodule.span O {xiChi L hL O χ}

/-- API: the `O[Δ]`-span equals the `O`-span. -/
theorem chiCyclotomicUnits_eq_span (χ : (L ≃ₐ[ℚ] L) →* Oˣ) :
    Submodule.span O (Set.range fun δ => unitsTensorRep L O δ (xiChi L hL O χ)) =
      chiCyclotomicUnits L hL O χ := sorry

/-- API: `C_{L,χ} ⊆ (O ⊗ Lˣ)^χ`. -/
theorem chiCyclotomicUnits_le (χ : (L ≃ₐ[ℚ] L) →* Oˣ) :
    chiCyclotomicUnits L hL O χ ≤ chiComponent (unitsTensorRep L O) χ := sorry

/-- API: `C_{L,χ}` is stable under `Δ`. -/
theorem chiCyclotomicUnits_stable (χ : (L ≃ₐ[ℚ] L) →* Oˣ) (δ : L ≃ₐ[ℚ] L) {x}
    (hx : x ∈ chiCyclotomicUnits L hL O χ) :
    unitsTensorRep L O δ x ∈ chiCyclotomicUnits L hL O χ := sorry

variable (p : ℕ) [Fact p.Prime]

/-- The unit-level image of Rubin's `c_ℚ`: the twisted sum of `N_{ℚ(μ_{fp})/L}(1 - ζ_{fp})`
(Rubin III.2.2, (4)). -/
def cQUnit (hL' : L ≤ Qmu (f * p)) (χ : (L ≃ₐ[ℚ] L) →* Oˣ) : O ⊗[ℤ] Additive Lˣ :=
  chiSum (unitsTensorRep L O) χ (1 ⊗ₜ toUnits L (relNorm hL' (oneSubZeta (f * p))) sorry)

/-- **`L0/twisted-class-eq-xi-power`**: Rubin's (6), `c_ℚ = ξ_{L,χ}^{1 - χ⁻¹(p)}`, at the unit
level: for `p ∤ f`, with `φ` the Frobenius of `p` on `L`. -/
theorem cQUnit_eq (hL' : L ≤ Qmu (f * p)) (χ : (L ≃ₐ[ℚ] L) →* Oˣ) (hpf : ¬ p ∣ f)
    (σp : Qmu f ≃ₐ[ℚ] Qmu f)
    (hσp : (σp ⟨zeta f, IntermediateField.mem_adjoin_simple_self ℚ _⟩ : ℂ) = zeta f ^ p)
    (φ : L ≃ₐ[ℚ] L) (hφ : ∀ x : L, ((φ x : L) : ℂ) = (σp ⟨x, hL x.2⟩ : ℂ)) :
    cQUnit L O p hL' χ = (1 - (((χ φ)⁻¹ : Oˣ) : O)) • xiChi L hL O χ := sorry

/-- API of `L0/twisted-class-eq-xi-power`: the case `p ∣ f`, where `χ(p) = 0`. -/
theorem cQUnit_eq_of_dvd (hL' : L ≤ Qmu (f * p)) (χ : (L ≃ₐ[ℚ] L) →* Oˣ) (hpf : p ∣ f) :
    cQUnit L O p hL' χ = xiChi L hL O χ := sorry

/-- **`L0/twisted-class-generates`**: if `χ(p) ≠ 1` (and `ord χ` is prime to `p`, so invertible
in `O`), `c_ℚ` generates `C_{L,χ}`. -/
theorem span_cQUnit (hL' : L ≤ Qmu (f * p)) (χ : (L ≃ₐ[ℚ] L) →* Oˣ) [IsDomain O]
    (φ : L ≃ₐ[ℚ] L) (hχφ : ((χ φ : Oˣ) : O) ≠ 1)
    (hord : IsUnit (orderOf (χ φ) : O))
    (hc : cQUnit L O p hL' χ = (1 - (((χ φ)⁻¹ : Oˣ) : O)) • xiChi L hL O χ) :
    Submodule.span O {cQUnit L O p hL' χ} = chiCyclotomicUnits L hL O χ := sorry

end ChiUnits

/-! ## Kummer classes, the Euler system and the twisted class (signatures against Tau Ceti and
the requested suppliers)

Recorded as comments: no Tau Ceti build at the pinned commit was available, and the Euler-system
carrier (`EulerSystemsAndKolyvaginSystems:ES.2`), `H¹(F, ℤ_p(1))` (`SelmerIwasawaCohomology:L0`) and
the finite-index statement (`IntegralIwasawaTheory:L0`) are requested. `L0/qab-euler-hypotheses`,
`L0/cyclotomic-kummer-classes`, `L0/cyclotomic-euler-system` and `L0/twisted-class-formula` have
their signatures here.

```
/-- L0/cyclotomic-kummer-classes -/
def pCycKummerClass (N m : ℕ) :
    Multiplicative (TauCeti.ContCohomology.H1 (AbsoluteGaloisGroup (Qmu m))
      (TauCeti.KummerCoeff (Qmu m) (p ^ N))) :=
  TauCeti.kummerMap (Qmu m) (p ^ N) (isUnit_pow_p (Qmu m)) (Units.mk0 (pCycNumber p m) _)

theorem pCycKummerClass_eq_zero_iff : pCycKummerClass p N m = 1 ↔ ∃ y, y ^ p ^ N = pCycNumber p m
theorem pCycKummerClass_neg (hp : p ≠ 2) : kummerMap _ (p ^ N) _ (-x) = kummerMap _ (p ^ N) _ x
theorem pCycKummerClass_cor : cor (pCycKummerClass p N (m * ℓ)) = kummerMap _ _ _ (relNorm _ _)
theorem pCycKummerClass_galois : σ • pCycKummerClass p N m = kummerMap _ _ _ (σ (pCycNumber p m))
theorem pCycKummerClass_compatible : powMap (pCycKummerClass p (N + 1) m) = pCycKummerClass p N m

/-- L0/qab-euler-hypotheses (ES.2's predicates) -/
theorem qab_satisfies_hypotheses : EulerSystemHypotheses ℚᵃᵇ p (cyclotomicZpExtension p)

/-- L0/cyclotomic-euler-system (requests ES.2 and ProfiniteCohomology Layer 9) -/
theorem pCycKummerClass_isEulerSystem : IsEulerSystem (ℤ_p(1)) ℚᵃᵇ p pCycKummerClass

/-- L0/twisted-class-formula: Rubin (4), through SelmerIwasawaCohomology:L0's dictionary (3) -/
theorem twist_cQ_eq : restrictionKummer (twist χ⁻¹ pCycKummerClass).atQ = cQUnit L O p hL' χ

/-- API of L0/chi-cyclotomic-units: finite index (IntegralIwasawaTheory:L0's index formula) -/
theorem chiCyclotomicUnits_index_finite : (chiCyclotomicUnits L hL O χ).FiniteIndexIn (unitsChi L O χ)

/-- API of L0/chi-cyclotomic-generator: Rubin's product over `Gal(ℚ(μ_f)/ℚ)` -/
theorem xiChi_eq_prod : xiChi L hL O χ = ∑ δ : Gal(ℚ(μ_f)/ℚ), χ⁻¹(δ|_L) ⊗ δ (1 - ζ_f)
```
-/

/-! ## Unit tests -/

namespace SuggestedTest

/-- `ζ_1 = 1`. -/
example : zeta 1 = 1 := sorry

/-- `ζ_2 = -1`. -/
example : zeta 2 = -1 := sorry

/-- Compatibility: `ζ_6^2 = ζ_3`. -/
example : zeta 6 ^ 2 = zeta 3 := sorry

/-- A non-compatible choice: `(ζ_6^5)^2 ≠ ζ_3`. -/
example : (zeta 6 ^ 5) ^ 2 ≠ zeta 3 := sorry

/-- Rubin's sign at `ℓ = 2`: `N_{ℚ(i)/ℚ}(i - 1) = 2`, whereas `ζ_2 - 1 = -2`. -/
example : (relNorm (Qmu_mono (dvd_mul_right 2 2)) (-oneSubZeta (2 * 2)) : ℂ) = 2 := sorry

/-- `m = 1`: `c̃_1 = p` (here `p = 3`). -/
example [Fact (Nat.Prime 3)] : (pCycNumber 3 1 : ℂ) = 3 := sorry

/-- An individual `c̃_m` can be torsion: for `p = 5`, `c̃_3 = -ζ_3`. -/
example [Fact (Nat.Prime 5)] : (pCycNumber 5 3 : ℂ) = -zeta 3 := sorry

/-- `m = p`: `c̃_p = 1 - ζ_p` (here `p = 5`). -/
example [Fact (Nat.Prime 5)] : pCycNumber 5 5 = oneSubZeta 5 := sorry

/-- The RJW element is torsion: `(ζ⁻¹ - 1)/(ζ - 1) = -ζ⁻¹` for `ζ ≠ 1`. -/
example {F : Type*} [Field F] {ζ : F} (h : ζ ≠ 1) : (ζ⁻¹ - 1) / (ζ - 1) = -ζ⁻¹ := sorry

/-- Real norm at a degenerate level: `ℚ(μ_3)^+ = ℚ`, and `c̃_3^+ = 3` for `p = 3`. -/
example [Fact (Nat.Prime 3)] : (pCycNumberReal 3 3 : ℂ) = 3 := sorry

/-- `χ`-component of the trivial character: the invariants. -/
example {O M Δ : Type*} [CommRing O] [AddCommGroup M] [Module O M] [Group Δ] [Fintype Δ]
    (ρ : Representation O Δ M) (x : M) :
    x ∈ chiComponent ρ 1 ↔ x ∈ ρ.invariants := sorry

/-- Trivial action and nontrivial `χ` with `χ(δ) - 1` a nonzerodivisor: `M^χ = 0`. -/
example {O Δ : Type*} [CommRing O] [IsDomain O] [Group Δ] [Fintype Δ] (χ : Δ →* Oˣ)
    (δ : Δ) (hδ : (χ δ : O) ≠ 1) :
    chiComponent (Representation.trivial O Δ O) χ = ⊥ := sorry

/-- Trivial character on a trivial module: `chiSum x = |Δ| x`. -/
example {Δ : Type*} [Group Δ] [Fintype Δ] (x : ℤ) :
    chiSum (Representation.trivial ℤ Δ ℤ) 1 x = (Fintype.card Δ : ℤ) • x := sorry

/-- The trivial group: `chiSum` is the identity. -/
example : chiSum (Representation.trivial ℤ (Multiplicative (ZMod 1)) ℤ) 1 (5 : ℤ) = 5 := sorry

/-- The Frobenius identity with `φ = 1`: `chiSum 0 = (1 - χ(1)⁻¹) chiSum u = 0`. -/
example {O M Δ : Type*} [CommRing O] [AddCommGroup M] [Module O M] [Group Δ] [Fintype Δ]
    (ρ : Representation O Δ M) (χ : Δ →* Oˣ) (u : M) :
    chiSum ρ χ (u - ρ 1⁻¹ u) = 0 := sorry

/-- `1 - ω` for `ω = -1` and `n = 2` invertible (over `ℚ`): a unit. -/
example : IsUnit (1 - (-1 : ℚ)) := sorry

/-- `1 - ω` need not be a unit when `n` is not invertible: `1 - (-1) = 2` in `ℤ`. -/
example : ¬ IsUnit (1 - (-1 : ℤ)) := sorry

/-- `L1/cyclotomic-hypotheses-and-error-terms`: an even character (`χ(c) = 1`) is not congruent modulo `p` to the odd
cyclotomic character (`ε(c) = −1`) for `p > 2`, since `1 ≠ −1` in `𝔽_p`; this is what Lemma III.1.1(ii) needs. -/
example (p : ℕ) [Fact (2 < p)] : (1 : ZMod p) ≠ -1 := fun h => ZMod.neg_one_ne_one h.symm

/-- `L1/kolyvagin-class-group-divisibility`: over a DVR with residue field of size `q`, `|B| = q^{ℓ_O(B)}`, so
`ℓ(A) ≤ ℓ(E/C)` gives `|A| ∣ |E/C|`; the arithmetic of powers. -/
example (q a b : ℕ) (h : a ≤ b) : q ^ a ∣ q ^ b := pow_dvd_pow q h

/-- `L2/cyclotomic-iwasawa-divisibility`, the last step: if `a` is coprime to `J` and `a ∣ J² b`, then `a ∣ b`. -/
example {R : Type*} [CommRing R] (a b j : R) (h : IsCoprime a j) (hd : a ∣ j ^ 2 * b) : a ∣ b :=
  (h.pow_right (n := 2)).dvd_of_dvd_mul_left hd

/-- `L3/trivial-character-component`: `log_p(a)` has valuation exactly one for a topological generator of `ℤ_p^×`,
so `(1 − p⁻¹)·log_p(a)` is a unit; the valuation bookkeeping `−1 + 1 = 0`. -/
example : (-1 : ℤ) + 1 = 0 := by norm_num

/-- `L3/cyclotomic-main-conjecture`: cancelling a nonzero factor in a domain,
`char(E/C) · char(X) = char(U/C) · char(Y)` with `char(E/C) = char(Y) ≠ 0` gives `char(X) = char(U/C)`. -/
example {R : Type*} [CommRing R] [IsDomain R] (e x u : R) (he : e ≠ 0) (h : e * x = u * e) : x = u := by
  have : e * x = e * u := by rw [h, mul_comm]
  exact mul_left_cancel₀ he this

/-- `L4/greither-chi-parts`, test `chiPart.test_not_exact`: for `p = 2` and `Δ = ℤ/2`, the χ-part of the trivial module
`ℤ₂` is `ℤ₂/(1 + 1) = ℤ/2`, and the map to `ℤ₂[Δ]_χ ≅ ℤ₂` sends `1` to `1 + δ ↦ 1 + (−1) = 0`. -/
example : (1 : ℤ) + (-1) = 0 ∧ ¬ IsUnit (2 : ℤ) := ⟨by norm_num, by decide⟩

/-- `L4/greither-real-iwasawa-leopoldt`, the order of the part faithful on `Δ_p` (Solomon, Corollary II.1): if
`α : A → B` is onto and `β : B → A` is injective, then `|A / βα(A)| · |B| = |A|`. With `βα = N_C` this is
`|A′(F)_χ| = |A′(F)_{χ′}| / |A′(F₁)_{χ′}|`. -/
example {A B : Type*} [AddCommGroup A] [AddCommGroup B] (α : A →+ B) (β : B →+ A)
    (hα : Function.Surjective α) (hβ : Function.Injective β) :
    Nat.card (A ⧸ (β.comp α).range) * Nat.card B = Nat.card A := by
  have h : (β.comp α).range = β.range := by
    rw [AddMonoidHom.range_comp, AddMonoidHom.range_eq_top.mpr hα, ← AddMonoidHom.range_eq_map]
  rw [h, Nat.card_congr (AddMonoidHom.ofInjective hβ).toEquiv]
  exact AddSubgroup.index_mul_card (H := β.range)

/-- `L4/greither-real-iwasawa-leopoldt`: the norm element of the subgroup of order `p` of a cyclic group of order
`p^{k+1}` is `Φ_{p^{k+1}}(σ)`, so the part faithful on `Δ_p` is the quotient by `N_C`. -/
example {R : Type*} [CommRing R] {p k : ℕ} (hp : p.Prime) :
    Polynomial.cyclotomic (p ^ (k + 1)) R = ∑ i ∈ Finset.range p, (Polynomial.X ^ p ^ k) ^ i :=
  Polynomial.cyclotomic_prime_pow_eq_geom_sum hp

/-- `L4/greither-iwasawa-leopoldt-two`, source issue E4: for `F = ℚ(ζ₅)` and `χ(2) = i`,
`5·B_{1,χ⁻¹} = Σ_a a·χ⁻¹(a) = 1 − 2i + 3i − 4 = −3 + i`, of norm `10`. So `v₂(½B_{1,χ⁻¹}) = −1/2`, and the exponent
`d(χ) = 2` is needed for `2·|½B|₂^{d(χ)} = 1` to be an order. -/
example : (⟨1, 0⟩ + ⟨2, 0⟩ * ⟨0, -1⟩ + ⟨3, 0⟩ * ⟨0, 1⟩ + ⟨4, 0⟩ * ⟨-1, 0⟩ : ℤ√(-1)) = ⟨-3, 1⟩ ∧
    Zsqrtd.norm (⟨-3, 1⟩ : ℤ√(-1)) = 10 := by
  decide

/-- `L3/tate-twisted-selmer-formulation`: `Γ((s − n)/2)` has poles at `s = n − 2k` (`k ≥ 0`), so it has a pole at
`s = 1` exactly when `n` is odd and `n ≥ 1`; this is the corank `r_n` of the Selmer group of `ℚ_p(n)`. -/
example (n : ℤ) : (∃ k : ℕ, (1 : ℤ) = n - 2 * k) ↔ (Odd n ∧ 1 ≤ n) := by
  constructor
  · rintro ⟨k, hk⟩
    exact ⟨⟨k, by omega⟩, by omega⟩
  · rintro ⟨⟨m, hm⟩, h1⟩
    refine ⟨m.toNat, ?_⟩
    rw [Int.toNat_of_nonneg (by omega)]
    omega

end SuggestedTest

end TauCeti.CyclotomicEulerSystem
