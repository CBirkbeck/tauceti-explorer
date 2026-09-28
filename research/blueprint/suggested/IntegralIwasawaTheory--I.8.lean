import Mathlib.NumberTheory.Cyclotomic.Gal
import Mathlib.NumberTheory.Cyclotomic.PrimitiveRoots
import Mathlib.NumberTheory.NumberField.CMField
import Mathlib.RingTheory.Norm.Transitivity
import Mathlib.RingTheory.RootsOfUnity.Complex
import Mathlib.RingTheory.RootsOfUnity.CyclotomicUnits
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic
import Mathlib.Data.ZMod.Units

/-!
# Suggested declarations: arithmetic Iwasawa theory, layer L0 (global cyclotomic arithmetic)

This file is a prototype in the form of upstream's `Suggested.lean`. Every proof is `sorry`; the
statements elaborate against Mathlib at the pinned commit. The complete targets are in the
blueprint packet and the roadmap document.

Layer L0 builds the tower of cyclotomic fields `ℚ(μ_m) ⊆ ℂ` with compatible roots, its real
subfields and relative norms, and the cyclotomic units of `ℚ(μ_{p^n})` (Rodrigues Jacinto–Williams,
Definition 11.6, Lemma 12.18, Corollary 12.19), with the index formula `h_n⁺ = [V_n⁺ : D_n⁺]`
(Theorem 11.7).
-/

noncomputable section

open Polynomial

namespace TauCeti.CyclotomicTower

/-! ## The tower -/

/-- **`L0/compatible-cyclotomic-tower`**: the compatible roots `ζ_m = exp(2πi/m)`. -/
def zeta (m : ℕ) : ℂ := Complex.exp (2 * Real.pi * Complex.I / m)

/-- `ℚ(μ_m) = ℚ(ζ_m) ⊆ ℂ`. -/
abbrev Qmu (m : ℕ) : IntermediateField ℚ ℂ := IntermediateField.adjoin ℚ {zeta m}

/-- API: `ζ_m` is a primitive `m`-th root of unity. -/
theorem isPrimitiveRoot_zeta {m : ℕ} (hm : m ≠ 0) : IsPrimitiveRoot (zeta m) m :=
  Complex.isPrimitiveRoot_exp m hm

/-- API: compatibility `ζ_{mn}^n = ζ_m`. -/
theorem zeta_mul_pow (m n : ℕ) (hn : n ≠ 0) : zeta (m * n) ^ n = zeta m := sorry

/-- API: `ζ_m` is integral. -/
theorem isIntegral_zeta (m : ℕ) : IsIntegral ℚ (zeta m) := sorry

instance (m : ℕ) : FiniteDimensional ℚ (Qmu m) :=
  IntermediateField.adjoin.finiteDimensional (isIntegral_zeta m)

instance (m : ℕ) : NumberField (Qmu m) where

/-- API: `ℚ(μ_m)` is the `m`-th cyclotomic extension of `ℚ`. -/
instance isCyclotomicExtension_Qmu (m : ℕ) [NeZero m] : IsCyclotomicExtension {m} ℚ (Qmu m) :=
  sorry

/-- API: `ℚ(μ_m) ⊆ ℚ(μ_n)` for `m ∣ n`. -/
theorem Qmu_mono {m n : ℕ} (h : m ∣ n) : Qmu m ≤ Qmu n := sorry

/-- The relative norm `N_{F/E}` of intermediate fields `E ≤ F`. -/
def relNorm {E F : IntermediateField ℚ ℂ} (h : E ≤ F) (x : F) : E :=
  Algebra.norm E (⟨x, (IntermediateField.mem_extendScalars h).2 x.2⟩ :
    IntermediateField.extendScalars h)

/-- **`L0/tower-galois-compatibility`**: norms are transitive in the tower. -/
theorem relNorm_relNorm {E F G : IntermediateField ℚ ℂ} (hEF : E ≤ F) (hFG : F ≤ G) (x : G) :
    relNorm hEF (relNorm hFG x) = relNorm (hEF.trans hFG) x := sorry

/-- API of `L0/tower-galois-compatibility`: restriction `Gal(ℚ(μ_n)/ℚ) → Gal(ℚ(μ_m)/ℚ)` is reduction
`(ℤ/n)ˣ → (ℤ/m)ˣ` under `autEquivPow`, for `m ∣ n`. -/
theorem autEquivPow_restrict {m n : ℕ} [NeZero m] [NeZero n] (h : m ∣ n)
    (σ : Qmu n ≃ₐ[ℚ] Qmu n) (τ : Qmu m ≃ₐ[ℚ] Qmu m)
    (hστ : ∀ x : Qmu m, ((τ x : Qmu m) : ℂ) = (σ ⟨x, Qmu_mono h x.2⟩ : ℂ)) :
    ZMod.unitsMap h (IsCyclotomicExtension.autEquivPow (Qmu n)
        (cyclotomic.irreducible_rat (NeZero.pos n)) σ) =
      IsCyclotomicExtension.autEquivPow (Qmu m) (cyclotomic.irreducible_rat (NeZero.pos m)) τ :=
  sorry

/-- **`L0/real-subfield`**: `ℚ(μ_m)⁺ = ℚ(ζ_m + ζ_m⁻¹)`. -/
abbrev QmuPlus (m : ℕ) : IntermediateField ℚ ℂ := IntermediateField.adjoin ℚ {zeta m + (zeta m)⁻¹}

/-- API: `ℚ(μ_m)⁺ ⊆ ℚ(μ_m)`. -/
theorem QmuPlus_le (m : ℕ) : QmuPlus m ≤ Qmu m := sorry

/-- API: `ℚ(μ_m)⁺` is the fixed field of complex conjugation on `ℚ(μ_m)`. -/
theorem mem_QmuPlus_iff {m : ℕ} (x : Qmu m) :
    (x : ℂ) ∈ QmuPlus m ↔ starRingEnd ℂ (x : ℂ) = x := sorry

/-- API: `[ℚ(μ_m) : ℚ(μ_m)⁺] = 2` for `m > 2`. -/
theorem finrank_QmuPlus {m : ℕ} (hm : 2 < m) :
    2 * Module.finrank ℚ (QmuPlus m) = Module.finrank ℚ (Qmu m) := sorry

/-! ## Cyclotomic units of `ℚ(μ_{p^n})` -/

variable (p : ℕ) [Fact p.Prime] (n : ℕ)

/-- `ζ_{p^n}` as an element of `ℚ(μ_{p^n})`. -/
def xi : Qmu (p ^ n) := ⟨zeta (p ^ n), IntermediateField.mem_adjoin_simple_self ℚ _⟩

/-- The units of the ring of integers of `ℚ(μ_{p^n})`, inside `ℚ(μ_{p^n})ˣ`. -/
def integralUnits : Subgroup (Qmu (p ^ n))ˣ :=
  (Units.map (algebraMap (NumberField.RingOfIntegers (Qmu (p ^ n))) (Qmu (p ^ n))).toMonoidHom).range

/-- **`L0/cyclotomic-unit-group`**: `D_n = 𝓞ˣ ∩ ⟨±ζ, ζ^a - 1 : 1 ≤ a < p^n⟩` (RJW Definition 11.6). -/
def cyclotomicUnits : Subgroup (Qmu (p ^ n))ˣ :=
  Subgroup.closure ({-1, Units.mk0 (xi p n) sorry} ∪
    {u | ∃ a : ℕ, 1 ≤ a ∧ a < p ^ n ∧ (u : Qmu (p ^ n)) = xi p n ^ a - 1}) ⊓ integralUnits p n

/-- `D_n⁺ = D_n ∩ ℚ(μ_{p^n})⁺`. -/
def realCyclotomicUnits : Subgroup (Qmu (p ^ n))ˣ :=
  { carrier := {u | u ∈ cyclotomicUnits p n ∧ ((u : Qmu (p ^ n)) : ℂ) ∈ QmuPlus (p ^ n)}
    mul_mem' := sorry
    one_mem' := sorry
    inv_mem' := sorry }

/-- API: `D_n ⊆ 𝓞ˣ`. -/
theorem cyclotomicUnits_le : cyclotomicUnits p n ≤ integralUnits p n := inf_le_right

/-- API: `D_n` is stable under `Gal(ℚ(μ_{p^n})/ℚ)`. -/
theorem cyclotomicUnits_galois (σ : Qmu (p ^ n) ≃ₐ[ℚ] Qmu (p ^ n)) {u : (Qmu (p ^ n))ˣ}
    (hu : u ∈ cyclotomicUnits p n) : Units.map σ.toMonoidHom u ∈ cyclotomicUnits p n := sorry

/-- **`L0/smoothed-cyclotomic-unit`**: `c_n(a) = (ζ^a - 1)/(ζ - 1) = ∑_{i<a} ζ^i`. -/
def cUnit (a : ℕ) : Qmu (p ^ n) := ∑ i ∈ Finset.range a, xi p n ^ i

/-- API: `c_n(a)` is a unit of `𝓞` for `a` prime to `p` (`n ≥ 1`). -/
theorem isUnit_cUnit (hn : 1 ≤ n) {a : ℕ} (ha : a.Coprime p) : IsUnit (cUnit p n a) := sorry

/-- API: the real unit `γ_{n,a} = ζ^{(1-a)/2} c_n(a)` (with `ζ^{1/2}` the square root in `μ_{p^n}`,
`p` odd) is fixed by complex conjugation. -/
theorem gamma_real (hp : p ≠ 2) (a : ℕ) (half : ℕ) (hhalf : 2 * half ≡ 1 [MOD p ^ n]) :
    starRingEnd ℂ (((xi p n) ^ (half * (p ^ n + 1 - a % p ^ n)) * cUnit p n a : Qmu (p ^ n)) : ℂ) =
      (((xi p n) ^ (half * (p ^ n + 1 - a % p ^ n)) * cUnit p n a : Qmu (p ^ n)) : ℂ) := sorry

/-- **`L0/prime-to-p-reduction`**: `ζ^{b p^m} - 1 = ∏_{j < p^m} (ζ^{b + j p^{n-m}} - 1)` for `p` odd. -/
theorem pow_sub_one_eq_prod (hp : p ≠ 2) {m b : ℕ} (hm : m ≤ n) :
    xi p n ^ (b * p ^ m) - 1 = ∏ j ∈ Finset.range (p ^ m), (xi p n ^ (b + j * p ^ (n - m)) - 1) :=
  sorry

/-- **`L0/valuation-balance`**: the elements `ζ^a - 1` with `p ∤ a` are associated to `ζ - 1`, so a
unit `±ζ^d ∏ (ζ^a - 1)^{e_a}` has `∑ e_a = 0`. -/
theorem associated_pow_sub_one (hn : 1 ≤ n) {a : ℕ} (ha : a.Coprime p) :
    Associated (xi p n ^ a - 1) (xi p n - 1) := sorry

/-- **`L0/cyclotomic-unit-generators`**: `D_n = ⟨ζ⟩ · D_n⁺` (RJW Lemma 12.18(ii)). -/
theorem cyclotomicUnits_eq_sup (hp : p ≠ 2) (hn : 1 ≤ n) :
    cyclotomicUnits p n =
      Subgroup.zpowers (Units.mk0 (xi p n) sorry) ⊔ realCyclotomicUnits p n := sorry

/-- **`L0/unit-index-real-full`**: `[V_n : D_n] = [V_n⁺ : D_n⁺]`, from Hasse's unit index `Q = 1`. -/
theorem index_eq_index_real (hp : p ≠ 2) (hn : 1 ≤ n) :
    ((cyclotomicUnits p n).subgroupOf (integralUnits p n)).index =
      ((realCyclotomicUnits p n).subgroupOf
        (integralUnits p n ⊓ realCyclotomicUnits p n ⊔ realCyclotomicUnits p n)).index := sorry

/-- API: Hasse's unit index of `ℚ(μ_{p^n})` is `1` (Mathlib's `IsCMField.indexRealUnits`). -/
theorem indexRealUnits_eq_one (hp : p ≠ 2) (hn : 1 ≤ n) [NumberField.IsCMField (Qmu (p ^ n))] :
    NumberField.IsCMField.indexRealUnits (Qmu (p ^ n)) = 1 := sorry

/-! ## Unit tests -/

namespace SuggestedTest

/-- `ℚ(μ_1) = ℚ`. -/
example : Module.finrank ℚ (Qmu 1) = 1 := sorry

/-- `ℚ(μ_4) = ℚ(i)` has degree `2`. -/
example : Module.finrank ℚ (Qmu 4) = 2 := sorry

/-- `ℚ(μ_3) = ℚ(μ_6)`. -/
example : Qmu 3 = Qmu 6 := sorry

/-- `ℚ(μ_6) ⊆ ℚ(μ_3)` although `6 ∤ 3`. -/
example : Qmu 6 ≤ Qmu 3 := sorry

/-- `ℚ(μ_5)⁺ = ℚ(√5)` has degree `2`. -/
example : Module.finrank ℚ (QmuPlus 5) = 2 := sorry

/-- `c_1(2) = 1 + ζ_3 = -ζ_3²` in `ℚ(μ_3)`: the smoothed unit at `p = 3, n = 1`. -/
example [Fact (Nat.Prime 3)] : ((cUnit 3 1 2 : Qmu (3 ^ 1)) : ℂ) = -(zeta 3) ^ 2 := sorry

/-- For `p = 3, n = 1`, `D_1⁺ = {±1}` (the real subfield is `ℚ`). -/
example [Fact (Nat.Prime 3)] : Nat.card (realCyclotomicUnits 3 1) = 2 := sorry

/-- For `p = 5, n = 1`, `γ_{1,2} = -ε` with `ε = (1 + √5)/2` (so `[V⁺ : D⁺] = 1 = h(ℚ(√5))`). -/
example [Fact (Nat.Prime 5)] :
    (((xi 5 1) ^ 3 * cUnit 5 1 2 : Qmu (5 ^ 1)) : ℂ) = -((1 + Real.sqrt 5) / 2 : ℝ) := sorry

end SuggestedTest

end TauCeti.CyclotomicTower
