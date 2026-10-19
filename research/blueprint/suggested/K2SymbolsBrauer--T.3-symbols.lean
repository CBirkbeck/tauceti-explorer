import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.RingTheory.Valuation.ValuationSubring
import TauCeti.FieldTheory.FunctionField.Place.Residue
import TauCeti.RingTheory.Valuation.Discrete.Order

/-!
# Classical residue map: suggested signatures

This file is not the roadmap and is not exhaustive. The accompanying roadmap
document is definitive. These statements suggest Lean forms so contributors and
reviewers can converge on names and signatures. Proof holes claim no implementation.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174,
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The four canonical T.3 targets (tame-symbol, uniformizer-independence, steinberg,
and hom) retain their existing node ids. Their elementary interfaces are repeated
here for standalone elaboration, not as additional roadmap constructions.
The new unitPart API uses the existing valuation-subring unit group.
No Milnor group, classical K₂ carrier or Matsumoto equivalence is introduced here.
Their existing owners and the full homomorphism API are specified in the reader.

The convention is ∂{u,π}=ū and ∂{π,u}=ū⁻¹. Weibel III.6.3 uses the inverse.
Orders of zero have a junk value in the pinned API; every symbol input is a unit.
All definitions below have real bodies over carriers at the pins.
-/

noncomputable section

open scoped WithZero

universe u

namespace TauCeti.TameSymbol

variable {F : Type u} [Field F]

abbrev ResidueField (v : Valuation F ℤᵐ⁰) := IsLocalRing.ResidueField v.valuationSubring

abbrev res (v : Valuation F ℤᵐ⁰) := v.valuationSubring.unitGroupToResidueFieldUnits

/-- The canonical unit part against an order-one parameter, as a unit of the
valuation subring. The membership proof uses only pinned valuation arithmetic. -/
def unitPart (v : Valuation F ℤᵐ⁰) (t : Fˣ) (ht : v.ord (t : F) = 1) (f : Fˣ) :
    v.valuationSubring.unitGroup :=
  ⟨f * t ^ (-v.ord (f : F)), by
    apply (Valuation.mem_unitGroup_iff F v _).mpr
    have hz : v.ord ((f * t ^ (-v.ord (f : F)) : Fˣ) : F) = 0 := by
      simp only [Units.val_mul, Units.val_zpow_eq_zpow_val]
      rw [v.ord_mul (Units.ne_zero f) (zpow_ne_zero _ (Units.ne_zero t)), v.ord_zpow, ht]
      ring
    rw [v.valuation_eq_exp_neg_ord (Units.ne_zero _), hz]
    simp⟩

variable (v : Valuation F ℤᵐ⁰) (t : Fˣ) (ht : v.ord (t : F) = 1)

theorem coe_unitPart (f : Fˣ) :
    (unitPart v t ht f : Fˣ) = f * t ^ (-v.ord (f : F)) := rfl

theorem unitPart_decomposition (f : Fˣ) :
    f = t ^ v.ord (f : F) * (unitPart v t ht f : Fˣ) := by
  sorry

theorem unitPart_eq_iff (f : Fˣ) (w : v.valuationSubring.unitGroup) :
    unitPart v t ht f = w ↔ f = t ^ v.ord (f : F) * (w : Fˣ) := by
  sorry

@[simp] theorem unitPart_one : unitPart v t ht 1 = 1 := by
  sorry

@[simp] theorem unitPart_uniformizer : unitPart v t ht t = 1 := by
  sorry

@[simp] theorem unitPart_of_unit (w : v.valuationSubring.unitGroup) :
    unitPart v t ht (w : Fˣ) = w := by
  sorry

theorem unitPart_mul (f g : Fˣ) :
    unitPart v t ht (f * g) = unitPart v t ht f * unitPart v t ht g := by
  sorry

theorem unitPart_inv (f : Fˣ) : unitPart v t ht f⁻¹ = (unitPart v t ht f)⁻¹ := by
  sorry

theorem unitPart_zpow (f : Fˣ) (n : ℤ) :
    unitPart v t ht (f ^ n) = unitPart v t ht f ^ n := by
  sorry

theorem unitPart_change (t' : Fˣ) (ht' : v.ord (t' : F) = 1)
    (ε : v.valuationSubring.unitGroup) (hchange : t' = t * (ε : Fˣ)) (f : Fˣ) :
    unitPart v t' ht' f = unitPart v t ht f * ε ^ (-v.ord (f : F)) := by
  sorry

-- unitPart_identity: a degenerate case which rejects a nontrivial constant unit part.
example : unitPart v t ht 1 = 1 := by
  sorry

-- unitPart_unit_compatibility: this is equality in the existing subgroup, not a new carrier.
example (w : v.valuationSubringˣ) :
    unitPart v t ht (v.valuationSubring.unitGroupMulEquiv.symm w : Fˣ) =
      v.valuationSubring.unitGroupMulEquiv.symm w := by
  sorry

-- unitPart_negative_power: negative orders must not be replaced by natAbs.
example : (unitPart v t ht (t ^ (-2 : ℤ)) : Fˣ) = 1 := by
  sorry

/-- The existing uniformizer-free tame-symbol input lies in the unit subgroup. -/
theorem zpow_ord_mul_zpow_neg_ord_mem_unitGroup (f g : Fˣ) :
    f ^ v.ord (g : F) * g ^ (-v.ord (f : F)) ∈ v.valuationSubring.unitGroup := by
  sorry

/-- Native form of the inherited tame-symbol target. -/
def tameSymbol (v : Valuation F ℤᵐ⁰) (_hv : Function.Surjective v) (f g : Fˣ) :
    (ResidueField v)ˣ :=
  (-1) ^ (v.ord (f : F) * v.ord (g : F)) *
    res v ⟨_, zpow_ord_mul_zpow_neg_ord_mem_unitGroup v f g⟩

variable (hv : Function.Surjective v)

theorem tameSymbol_eq_residue (f g : Fˣ) :
    tameSymbol v hv f g = (-1) ^ (v.ord (f : F) * v.ord (g : F)) *
      res v ⟨_, zpow_ord_mul_zpow_neg_ord_mem_unitGroup v f g⟩ := rfl

theorem tameSymbol_unitParts (f g : Fˣ) :
    tameSymbol v hv f g = (-1) ^ (v.ord (f : F) * v.ord (g : F)) *
      res v (unitPart v t ht f) ^ v.ord (g : F) *
      res v (unitPart v t ht g) ^ (-v.ord (f : F)) := by
  sorry

theorem tameSymbol_uniformizer_independence (t' : Fˣ) (ht' : v.ord (t' : F) = 1)
    (f g : Fˣ) :
    (-1 : (ResidueField v)ˣ) ^ (v.ord (f : F) * v.ord (g : F)) *
      res v (unitPart v t ht f) ^ v.ord (g : F) *
      res v (unitPart v t ht g) ^ (-v.ord (f : F)) =
    (-1 : (ResidueField v)ˣ) ^ (v.ord (f : F) * v.ord (g : F)) *
      res v (unitPart v t' ht' f) ^ v.ord (g : F) *
      res v (unitPart v t' ht' g) ^ (-v.ord (f : F)) := by
  sorry

@[simp] theorem tameSymbol_unit_uniformizer (w : v.valuationSubring.unitGroup) :
    tameSymbol v hv w t = res v w := by
  sorry

@[simp] theorem tameSymbol_uniformizer_unit (w : v.valuationSubring.unitGroup) :
    tameSymbol v hv t w = (res v w)⁻¹ := by
  sorry

theorem tameSymbol_of_ord_eq_zero (f g : Fˣ)
    (hf : v.ord (f : F) = 0) (hg : v.ord (g : F) = 0) : tameSymbol v hv f g = 1 := by
  sorry

theorem tameSymbol_swap (f g : Fˣ) : tameSymbol v hv g f = (tameSymbol v hv f g)⁻¹ := by
  sorry

theorem tameSymbol_self (f : Fˣ) : tameSymbol v hv f f = (-1) ^ v.ord (f : F) := by
  sorry

theorem tameSymbol_neg_self (f : Fˣ) : tameSymbol v hv f (-f) = 1 := by
  sorry

theorem tameSymbol_mul_left (f f' g : Fˣ) :
    tameSymbol v hv (f * f') g = tameSymbol v hv f g * tameSymbol v hv f' g := by
  sorry

theorem tameSymbol_mul_right (f g g' : Fˣ) :
    tameSymbol v hv f (g * g') = tameSymbol v hv f g * tameSymbol v hv f g' := by
  sorry

theorem tameSymbol_steinberg (r : Fˣ) (hr : (r : F) ≠ 1) :
    tameSymbol v hv r (Units.mk0 (1 - (r : F)) (sub_ne_zero.mpr hr.symm)) = 1 := by
  sorry

/-- New uniqueness target: any bilinear Steinberg pairing with these values is
the tame symbol. This quantifies over actual functions on the pinned unit group. -/
theorem tameSymbol_unique (c : Fˣ → Fˣ → (ResidueField v)ˣ)
    (hleft : ∀ a b d, c (a * b) d = c a d * c b d)
    (hright : ∀ a b d, c a (b * d) = c a b * c a d)
    (hsteinberg : ∀ a : Fˣ, ∀ ha : (a : F) ≠ 1,
      c a (Units.mk0 (1 - (a : F)) (sub_ne_zero.mpr ha.symm)) = 1)
    (hunits : ∀ a b : v.valuationSubring.unitGroup, c a b = 1)
    (hnormal : ∀ a : v.valuationSubring.unitGroup, c a t = res v a) :
    c = tameSymbol v hv := by
  sorry

section RationalTests

local instance : Fact (Nat.Prime 5) := ⟨by decide⟩
local notation "v₅" => Rat.padicValuation 5
local notation "s₅" => tameSymbol v₅ (Rat.surjective_padicValuation 5)
local notation "⟪" q "⟫" => Units.mk0 (q : ℚ) (by norm_num)

private theorem five_order_one : (v₅).ord (5 : ℚ) = 1 := by
  sorry

-- unitPart_five_values: a unit, a positive order and a pole with a nontrivial unit part.
example :
    (unitPart v₅ ⟪5⟫ five_order_one ⟪2⟫ : ℚˣ) = ⟪2⟫ ∧
    (unitPart v₅ ⟪5⟫ five_order_one ⟪10⟫ : ℚˣ) = ⟪2⟫ ∧
    (unitPart v₅ ⟪5⟫ five_order_one ⟪2 / 5⟫ : ℚˣ) = ⟪2⟫ := by
  sorry

-- unitPart_change_five: changing 5 to 10 changes the unit part of 5 to 1/2.
example : ∃ h10 : (v₅).ord (10 : ℚ) = 1,
    (unitPart v₅ ⟪10⟫ h10 ⟪5⟫ : ℚˣ) = ⟪1 / 2⟫ := by
  sorry

-- The inherited construction's computations, stated in its actual residue field.
example : (s₅ ⟪2⟫ ⟪5⟫ : ResidueField v₅) = 2 ∧
    (s₅ ⟪5⟫ ⟪2⟫ : ResidueField v₅) = 3 := by
  sorry

example : (s₅ ⟪5⟫ ⟪5⟫ : ResidueField v₅) = 4 ∧
    (s₅ ⟪10⟫ ⟪5⟫ : ResidueField v₅) = 3 ∧
    (s₅ ⟪2⟫ ⟪3⟫ : ResidueField v₅) = 1 := by
  sorry

-- The unsigned pairing fails on this Steinberg pair, whose two orders are negative.
example : s₅ ⟪1 / 5⟫ ⟪4 / 5⟫ = 1 ∧
    (res v₅ ⟨_, zpow_ord_mul_zpow_neg_ord_mem_unitGroup v₅ ⟪1 / 5⟫ ⟪4 / 5⟫⟩ :
      ResidueField v₅) = 4 ∧ (4 : ResidueField v₅) ≠ 1 := by
  sorry

-- The inverse convention differs, so normalizations distinguish the two maps.
example : (s₅ ⟪5⟫ ⟪2⟫ : ResidueField v₅) ≠
    (s₅ ⟪2⟫ ⟪5⟫ : ResidueField v₅) := by
  sorry

end RationalTests

-- Characteristic two keeps the definition but identifies its sign with one.
example [Fact (Nat.Prime 2)] :
    tameSymbol (Rat.padicValuation 2) (Rat.surjective_padicValuation 2)
      (Units.mk0 (2 : ℚ) (by norm_num)) (Units.mk0 (2 : ℚ) (by norm_num)) = 1 := by
  sorry

/-!
README targets requiring unimplemented carriers:

* K2SymbolsBrauer:T.3/tame-symbol-hom: descend to K₂ᴹ and transport to classical
  K₂ through K2SymbolsBrauer:T.2/matsumoto. Give evaluation, extensionality,
  surjectivity, unit-symbol vanishing and the inverse K-book comparison.
* The homomorphism corollary of tameSymbol_unique uses those SAME carriers and
  states uniqueness from unit-unit vanishing and ∂{u,π}=ū.
* The existing DVR/Place compatibility interfaces are not new definitions here:
  unitGroupMulEquiv and the equality of valuation subrings transport the formula.
  Their full statements and worked examples are retained in the reader.

Localization connecting maps, finite support, higher residues, transfers and
reciprocity belong to their existing owners, not this classical-stage supplement.
-/

end TauCeti.TameSymbol
