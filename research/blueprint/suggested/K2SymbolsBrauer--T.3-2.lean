import TauCeti.RingTheory.Valuation.Discrete.Order
import Mathlib.RingTheory.Valuation.ValuationSubring

/-!
# T.3: native valuation realization and residue comparisons

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The companion reader gives the full T.3 targets, their existing owners, sources,
APIs and discriminating tests. The definitions here are light realizations over
native carriers. `unitPart` chooses from the pinned decomposition theorem;
`tame` realizes the existing T.3/tame-symbol owner, with no new symbol quotient.
Neither definition has an admitted data body.

The Milnor groups, their graded residue algebra, and Quillen K-groups are absent
at the pins. Their comparison squares, finite-support homomorphisms and transfer
laws are mathematical targets in the reader, rather than Lean stand-ins.
All proofs below remain unchecked. Elaboration checks the signatures only.
-/

noncomputable section
open scoped WithZero

namespace TauCeti.T3Native

variable {F : Type*} [Field F]

abbrev ResidueField (v : Valuation F ℤᵐ⁰) :=
  IsLocalRing.ResidueField v.valuationSubring

/-- The existing map on the units of the valuation ring. -/
abbrev residueUnits (v : Valuation F ℤᵐ⁰) :
    v.valuationSubringˣ →* (ResidueField v)ˣ :=
  Units.map (IsLocalRing.residue v.valuationSubring).toMonoidHom

/-- The native unit factor in `f = π ^ ord(f) * u`, using the pinned theorem. -/
def unitPart (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v)
    (π : Fˣ) (hπ : v.ord (π : F) = 1) (f : Fˣ) : v.valuationSubringˣ := by
  letI := v.nontrivial_valueGroup_of_surjective hv
  exact Classical.choose (v.exists_eq_zpow_mul_unit_of_surjective hv
    ((v.isUniformizer_iff_ord_eq_one_of_surjective hv).mpr hπ) f.ne_zero)

variable (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v)
    (π : Fˣ) (hπ : v.ord (π : F) = 1)

/-- The milestone identifies the chosen native unit with the explicit quotient. -/
theorem unitPart_coe (f : Fˣ) :
    ((unitPart v hv π hπ f : v.valuationSubring) : F) =
      (f : F) * (π : F) ^ (-v.ord (f : F)) := by
  sorry

/-- This is the existing tame symbol, expressed using native ring units. -/
def tame (f g : Fˣ) : (ResidueField v)ˣ :=
  (-1) ^ (v.ord (f : F) * v.ord (g : F)) *
    residueUnits v (unitPart v hv π hπ f) ^ v.ord (g : F) *
    residueUnits v (unitPart v hv π hπ g) ^ (-v.ord (f : F))

/-- A carrier-level version of the uniformizer-free formula. The input is an
actual native ring unit with the indicated field value. -/
theorem tame_eq_residue (f g : Fˣ) (z : v.valuationSubringˣ)
    (hz : ((z : v.valuationSubring) : F) =
      (f : F) ^ v.ord (g : F) * (g : F) ^ (-v.ord (f : F))) :
    tame v hv π hπ f g =
      (-1) ^ (v.ord (f : F) * v.ord (g : F)) * residueUnits v z := by
  sorry

/-- Independence holds before descending to a symbol quotient. -/
theorem tame_uniformizer_independent (π' : Fˣ) (hπ' : v.ord (π' : F) = 1)
    (f g : Fˣ) : tame v hv π hπ f g = tame v hv π' hπ' f g := by
  sorry

/-- The bilinear Steinberg-pairing milestone, on two nonzero field inputs. -/
theorem tame_bilinear_steinberg :
    (∀ f₁ f₂ g, tame v hv π hπ (f₁ * f₂) g =
      tame v hv π hπ f₁ g * tame v hv π hπ f₂ g) ∧
    (∀ f g₁ g₂, tame v hv π hπ f (g₁ * g₂) =
      tame v hv π hπ f g₁ * tame v hv π hπ f g₂) ∧
    (∀ f g : Fˣ, (f : F) + (g : F) = 1 → tame v hv π hπ f g = 1) := by
  sorry

/-- Ramification belongs to pullback, and does not require a finite extension. -/
theorem tame_restriction {E : Type*} [Field E] (ι : F →+* E)
    (w : Valuation E ℤᵐ⁰) (hw : Function.Surjective w)
    (ϖ : Eˣ) (hϖ : w.ord (ϖ : E) = 1)
    (κ : ResidueField v →+* ResidueField w) (e : ℕ) (he : 0 < e)
    (hord : ∀ f : Fˣ, w.ord (ι (f : F)) = (e : ℤ) * v.ord (f : F))
    (hres : ∀ u : v.valuationSubringˣ, ∀ z : w.valuationSubringˣ,
      ((z : w.valuationSubring) : E) = ι ((u : v.valuationSubring) : F) →
        Units.map κ.toMonoidHom (residueUnits v u) = residueUnits w z)
    (f g : Fˣ) :
    tame w hw ϖ hϖ (Units.map ι.toMonoidHom f) (Units.map ι.toMonoidHom g) =
      (Units.map κ.toMonoidHom (tame v hv π hπ f g)) ^ e := by
  sorry

-- Tests for the unit factor: normalization, negative order and a genuine unit.
example : unitPart v hv π hπ π = 1 := by sorry

example : unitPart v hv π hπ (π ^ (-2 : ℤ)) = 1 := by sorry

example (u : v.valuationSubringˣ) :
    ((unitPart v hv π hπ
      (Units.map v.valuationSubring.subtype.toMonoidHom u) : v.valuationSubring) : F) =
      ((u : v.valuationSubring) : F) := by
  sorry

-- Tests distinguish inversion, loss of the sign, and a false alternating law.
example (u : v.valuationSubringˣ) :
    tame v hv π hπ (Units.map v.valuationSubring.subtype.toMonoidHom u) π =
      residueUnits v u := by
  sorry

example (u : v.valuationSubringˣ) :
    tame v hv π hπ π (Units.map v.valuationSubring.subtype.toMonoidHom u) =
      (residueUnits v u)⁻¹ := by
  sorry

example : tame v hv π hπ π π = -1 := by sorry

example (f : Fˣ) : tame v hv π hπ f (-f) = 1 := by sorry

end TauCeti.T3Native
