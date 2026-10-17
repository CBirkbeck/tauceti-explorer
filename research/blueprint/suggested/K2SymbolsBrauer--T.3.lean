import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.BigOperators.Group.List.Basic
import Mathlib.Algebra.Ring.Units
import Mathlib.Algebra.DirectSum.Basic
import Mathlib.Algebra.DualNumber
import Mathlib.Algebra.Field.ZMod
import Mathlib.Algebra.Group.Commutator
import Mathlib.Algebra.Module.Presentation.Basic
import Mathlib.Algebra.TrivSqZeroExt.Ideal
import Mathlib.Analysis.Complex.Basic
import Mathlib.Data.Finsupp.Basic
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.Normal.Defs
import Mathlib.GroupTheory.FreeAbelianGroup
import Mathlib.GroupTheory.PresentedGroup
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.PiTensorProduct.Basic
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.NumberTheory.Cyclotomic.PrimitiveRoots
import Mathlib.NumberTheory.LocalField.Basic
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.NumberTheory.Padics.HeightOneSpectrum
import Mathlib.NumberTheory.Padics.LocalField
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.RingTheory.DedekindDomain.AdicValuation
import Mathlib.RingTheory.DedekindDomain.SInteger
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Jacobson.Ideal
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.RingTheory.Norm.Defs
import Mathlib.RingTheory.RootsOfUnity.EnoughRootsOfUnity
import Mathlib.RingTheory.Valuation.ValuationSubring
import TauCeti.FieldTheory.FunctionField.Divisor.Eval
import TauCeti.FieldTheory.FunctionField.Divisor.Principal
import TauCeti.FieldTheory.FunctionField.Place.RatFunc.Basic
import TauCeti.FieldTheory.FunctionField.Place.Residue
import TauCeti.FieldTheory.GaloisCohomology.Kummer
import TauCeti.RepresentationTheory.Homological.ContCohomology.Cup.Product
import TauCeti.RingTheory.DedekindDomain.AdicValuation.ValuativeRel
import TauCeti.RingTheory.Valuation.Discrete.Order

/-!
# Suggested statements for K2SymbolsBrauer--T.3

FIX-RT-BP-K2SymbolsBrauer--T.3~3, Codex codex-HMufFk, 17 October 2026.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The README is the full roadmap, including all 68 targets, hypotheses, proof plans,
source locators, APIs and tests. Every implementation status remains unchecked.
This file follows WORKERS.md's current shape: light real-bodied definitions over
existing carriers, statements at the pins, and examples. It does not construct
Milnor K-theory, stable/relative Steinberg groups, Quillen K-theory, norm-residue
maps, or coefficient twists. Those interfaces are README targets, not sorry'd data.
The earlier stand-ins and all 25 sorry-bodied data definitions have been removed.

Native declarations below retain the guarded relative relation set, the elementary
tame-symbol formula and arbitrary valued-embedding comparison, and the unit-domain
conic criterion. The higher-degree residue comparison and full reciprocity theorem
need missing carriers and are stated precisely in the README. The final comments
index these omissions. A successful elaboration checks types, not sorry proofs.

Conventions: the uniformizer-last residue satisfies ∂{u,π}=ū and ∂{π,u}=ū⁻¹.
In degree two this is the roadmap tame symbol; the K-book's III.6.3 symbol is its
inverse. Higher residues have Π on the right; III.7.3's Π-left residue differs by
(-1)^(n-1). Transfer is normalized by -∂∞ = Σ Np∂p. Local reciprocity uses
arithmetic Frobenius, with the first input acting on a root of the second.

The remaining generic complete-DVR supplier mismatch is routed, under PROTOCOL §15,
to proposed LocalFieldsRamification Part II, DVR.0–DVR.3. Registration and supply
remain an explicit gap. Existing finite-residue Layer 3 is only a base/comparison
direction. No generic extension lattice or valuation toolkit is constructed here.
-/

noncomputable section

open scoped TensorProduct WithZero Polynomial IntermediateField

universe u v

namespace TauCeti.TameSymbol


variable {F : Type u} [Field F]

/-- The residue field `k_v` of a `ℤᵐ⁰`-valued valuation `v` (of its valuation subring). -/
abbrev ResidueField (v : Valuation F ℤᵐ⁰) : Type u := IsLocalRing.ResidueField v.valuationSubring

/-- The residue `ū ∈ k_vˣ` of an element of the unit group of the valuation ring
(`ValuationSubring.unitGroupToResidueFieldUnits`). -/
abbrev res (v : Valuation F ℤᵐ⁰) (u : v.valuationSubring.unitGroup) : (ResidueField v)ˣ :=
  v.valuationSubring.unitGroupToResidueFieldUnits u

/-- `f^{ord g} g^{-ord f}` has order zero, so lies in the unit group of the valuation ring. -/
theorem zpow_ord_mul_zpow_neg_ord_mem_unitGroup (v : Valuation F ℤᵐ⁰) (f g : Fˣ) :
    f ^ v.ord (g : F) * g ^ (-v.ord (f : F)) ∈ v.valuationSubring.unitGroup := by
  sorry

/-- `K2SymbolsBrauer:T.3/tame-symbol`, the uniformizer-free formula. The product
inside `res` has order zero. Only its membership proof is deferred; the data is the
signed residue expression. Surjectivity is retained for the roadmap's DVR scope. -/
def tameSymbol (v : Valuation F ℤᵐ⁰) (_hv : Function.Surjective v) (f g : Fˣ) :
    (ResidueField v)ˣ :=
  (-1) ^ (v.ord (f : F) * v.ord (g : F)) *
    res v ⟨_, zpow_ord_mul_zpow_neg_ord_mem_unitGroup v f g⟩

variable (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v)

/-- The uniformiser-free form (`K2SymbolsBrauer:T.3/tame-symbol-uniformizer-independence`):
`∂_v{f, g} = (-1)^{ord f · ord g} · res(f^{ord g} g^{-ord f})`. -/
theorem tameSymbol_eq_residue (f g : Fˣ) :
    tameSymbol v hv f g = (-1) ^ (v.ord (f : F) * v.ord (g : F)) *
      res v ⟨_, zpow_ord_mul_zpow_neg_ord_mem_unitGroup v f g⟩ := by
  rfl

/-- The convention-pinning value `∂_v{u, t} = ū`. -/
@[simp]
theorem tameSymbol_unit_uniformizer (u : v.valuationSubring.unitGroup) (t : Fˣ)
    (ht : v.ord (t : F) = 1) : tameSymbol v hv u t = res v u := by
  sorry

/-- The convention-pinning value `∂_v{t, u} = ū⁻¹`. -/
@[simp]
theorem tameSymbol_uniformizer_unit (u : v.valuationSubring.unitGroup) (t : Fˣ)
    (ht : v.ord (t : F) = 1) : tameSymbol v hv t u = (res v u)⁻¹ := by
  sorry

@[simp]
theorem tameSymbol_of_ord_eq_zero (f g : Fˣ) (hf : v.ord (f : F) = 0) (hg : v.ord (g : F) = 0) :
    tameSymbol v hv f g = 1 := by
  sorry

theorem tameSymbol_swap (f g : Fˣ) : tameSymbol v hv g f = (tameSymbol v hv f g)⁻¹ := by
  sorry

theorem tameSymbol_self (f : Fˣ) : tameSymbol v hv f f = (-1) ^ v.ord (f : F) := by
  sorry

theorem tameSymbol_neg_self (f : Fˣ) : tameSymbol v hv f (-f) = 1 := by
  sorry

/-- The K-book's tame symbol of Lemma III.6.3, `∂_v({r, s}) = (-1)^{v(r)v(s)} (s^{v(r)}/r^{v(s)})‾`,
is `tameSymbol v s r`, the **inverse** of `tameSymbol v r s`. -/
theorem tameSymbol_kbook (r s : Fˣ) :
    (-1) ^ (v.ord (r : F) * v.ord (s : F)) *
        res v ⟨_, zpow_ord_mul_zpow_neg_ord_mem_unitGroup v s r⟩ = (tameSymbol v hv r s)⁻¹ := by
  sorry

/-- The DVR form: for an irreducible `ϖ` of the valuation ring `R = 𝒪_v` (a DVR,
`Valuation.valuationSubring_isDiscreteValuationRing_of_surjective`) and
`f = u_f ϖ^{n_f}`, `g = u_g ϖ^{n_g}` (`IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible`),
`∂_v{f, g} = (-1)^{n_f n_g} ū_f^{n_g} ū_g^{-n_f}`. -/
theorem tameSymbol_dvr (ϖ : v.valuationSubring) (hϖ : Irreducible ϖ) (f g : Fˣ) (nf ng : ℤ)
    (uf ug : v.valuationSubringˣ)
    (hf : (f : F) = ((uf : v.valuationSubring) : F) * (ϖ : F) ^ nf)
    (hg : (g : F) = ((ug : v.valuationSubring) : F) * (ϖ : F) ^ ng) :
    tameSymbol v hv f g = (-1) ^ (nf * ng) *
      Units.map (IsLocalRing.residue v.valuationSubring).toMonoidHom uf ^ ng *
      Units.map (IsLocalRing.residue v.valuationSubring).toMonoidHom ug ^ (-nf) := by
  sorry

/-- Residue fields of equal valuation subrings (a real definition). -/
def residueFieldCongr {A B : ValuationSubring F} (h : A = B) :
    IsLocalRing.ResidueField A ≃+* IsLocalRing.ResidueField B := by
  subst h
  exact RingEquiv.refl _

/-- The valuation ring of a Tau Ceti place is the valuation subring of its valuation
(`TauCeti.Place.integers` is not an exposed definition, so this is stated rather than unfolded). -/
theorem valuationSubring_eq_integers {k : Type v} [Field k] [Algebra k F] (P : Place k F) :
    P.valuation.valuationSubring = P.integers := by
  ext x
  rw [Valuation.mem_valuationSubring_iff, Place.mem_integers_iff]

/-- At a place `P` of a function field, with `t` a uniformiser and `P.ord f = 0`,
`∂_P{f, t} = f(P)`, Tau Ceti's `TauCeti.Place.residueUnit`. -/
theorem tameSymbol_place {k : Type v} [Field k] [Algebra k F] (P : Place k F) (f t : Fˣ)
    (hf : P.ord (f : F) = 0) (ht : P.ord (t : F) = 1) :
    Units.map (residueFieldCongr (valuationSubring_eq_integers P)).toRingHom.toMonoidHom
      (tameSymbol P.valuation P.valuation_surjective f t) = P.residueUnit f hf := by
  sorry

/-- `K2SymbolsBrauer:T.3/tame-symbol-uniformizer-independence`: for **any** uniformiser `t` and
the unit parts `f = t^{ord f} u_f`, `g = t^{ord g} u_g` against it,
`∂_v{f, g} = (-1)^{ord f ord g} ū_f^{ord g} ū_g^{-ord f}`; the left side involves no uniformiser.
On `ℚ` at `5`, `t = 5` and `t = 10` both give `∂{10, 5} = 3`. -/
theorem tameSymbol_uniformizer_independence (t : Fˣ) (ht : v.ord (t : F) = 1) (f g : Fˣ)
    (uf ug : v.valuationSubring.unitGroup) (hf : f = t ^ v.ord (f : F) * uf)
    (hg : g = t ^ v.ord (g : F) * ug) :
    tameSymbol v hv f g =
      (-1) ^ (v.ord (f : F) * v.ord (g : F)) * res v uf ^ v.ord (g : F) *
        res v ug ^ (-v.ord (f : F)) := by
  sorry

/-- `K2SymbolsBrauer:T.3/tame-symbol-steinberg`: bimultiplicativity in the first entry. -/
theorem tameSymbol_mul_left (f f' g : Fˣ) :
    tameSymbol v hv (f * f') g = tameSymbol v hv f g * tameSymbol v hv f' g := by
  sorry

/-- `K2SymbolsBrauer:T.3/tame-symbol-steinberg`: bimultiplicativity in the second entry. -/
theorem tameSymbol_mul_right (f g g' : Fˣ) :
    tameSymbol v hv f (g * g') = tameSymbol v hv f g * tameSymbol v hv f g' := by
  sorry

/-- `K2SymbolsBrauer:T.3/tame-symbol-steinberg`: the Steinberg relation `∂_v{r, 1 - r} = 1` for
`r ≠ 0, 1`, by the source's four exhaustive cases. -/
theorem tameSymbol_steinberg (r : Fˣ) (hr : (r : F) ≠ 1) :
    tameSymbol v hv r (Units.mk0 (1 - (r : F)) (sub_ne_zero.mpr hr.symm)) = 1 := by
  sorry

section Extension

variable {E : Type v} [Field E] [Algebra F E]

/-- The inclusion of valuation rings `𝒪_v → 𝒪_w` for `w` over `v`, i.e.
`ord_w (r) = e · ord_v (r)` on `F` (a real definition; the membership is the order condition). -/
def valuationSubringMap (w : Valuation E ℤᵐ⁰) (e : ℕ)
    (hvw : ∀ r : F, w.ord (algebraMap F E r) = e * v.ord r) :
    v.valuationSubring →+* w.valuationSubring :=
  ((algebraMap F E).comp v.valuationSubring.subtype).codRestrict w.valuationSubring
    (fun _ => by sorry)

/-- The residue field extension `k_v → k_w` for a positive-index valued embedding.
The restricted valuation-ring map is local only when `e > 0`; no finiteness is used. -/
def residueFieldMap (w : Valuation E ℤᵐ⁰) (e : ℕ) (he : 0 < e)
    (hvw : ∀ r : F, w.ord (algebraMap F E r) = e * v.ord r) :
    ResidueField v →+* ResidueField w :=
  haveI : IsLocalHom (valuationSubringMap v w e hvw) := by
    -- For a nonzero ring element, ord_w(f(r)) = e * ord_v(r).
    -- Positivity he makes positive orders equivalent, so nonunits map to nonunits.
    -- Zero maps to zero. Use the local-hom criterion for these valuation rings.
    sorry
  IsLocalRing.ResidueField.map (valuationSubringMap v w e hvw)

/-- `K2SymbolsBrauer:T.3/ramification-formula`: for any field embedding `F → E` and normalised valuations
with positive ramification index `e ≥ 1`, `∂_w{r₁, r₂} = (∂_v{r₁, r₂})^e` in `k_wˣ` for `r₁, r₂ ∈ Fˣ`.
(With all `e_i = 1` the diagonal `k_vˣ → ∏ k_{w_i}ˣ` carries `∂_v` to `(∂_{w_i})_i`.) -/
theorem ramification_formula (w : Valuation E ℤᵐ⁰)
    (hw : Function.Surjective w) (e : ℕ) (he : 0 < e)
    (hvw : ∀ r : F, w.ord (algebraMap F E r) = e * v.ord r) (r₁ r₂ : Fˣ) :
    tameSymbol w hw (Units.map (algebraMap F E).toMonoidHom r₁)
        (Units.map (algebraMap F E).toMonoidHom r₂) =
      Units.map (residueFieldMap v w e he hvw).toMonoidHom (tameSymbol v hv r₁ r₂) ^ e := by
  sorry

-- test TauCeti.TameSymbol.residueFieldMap_residue (compatibility)
example (w : Valuation E ℤᵐ⁰) (e : ℕ) (he : 0 < e)
    (hvw : ∀ r : F, w.ord (algebraMap F E r) = e * v.ord r)
    (a : v.valuationSubring) :
    residueFieldMap v w e he hvw (IsLocalRing.residue v.valuationSubring a) =
      IsLocalRing.residue w.valuationSubring (valuationSubringMap v w e hvw a) := by
  sorry

-- test TauCeti.TameSymbol.residueFieldMap_requires_positive (non-example)
-- The u-adic valuation on ℚ(u) supplies htriv. 5 is a nonunit at v but a unit at w.
example [Fact (Nat.Prime 5)] (w : Valuation (RatFunc ℚ) ℤᵐ⁰)
    (htriv : ∀ r : ℚ, w.ord (algebraMap ℚ (RatFunc ℚ) r) = 0) :
    ¬ IsLocalHom (valuationSubringMap (Rat.padicValuation 5) w 0
      (by intro r; simpa using htriv r)) := by
  sorry

end Extension

section Tests

variable [Fact (Nat.Prime 5)]

/-- A nonzero rational as a unit (test notation). -/
local notation "⟪" q "⟫" => Units.mk0 (q : ℚ) (by norm_num)

-- test tameSymbol_rat_five (computation)
example (φ : ResidueField (Rat.padicValuation 5) →+* ZMod 5) :
    φ (tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) ⟪2⟫ ⟪5⟫) = 2 ∧
      φ (tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) ⟪5⟫ ⟪2⟫) = 3 := by
  sorry

-- test tameSymbol_rat_five_sign (computation)
example (φ : ResidueField (Rat.padicValuation 5) →+* ZMod 5) :
    φ (tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) ⟪5⟫ ⟪5⟫) = 4 ∧
      φ (tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) ⟪10⟫ ⟪5⟫) = 3 := by
  sorry

-- test tameSymbol_units (degenerate)
example :
    tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) ⟪2⟫ ⟪3⟫ = 1 ∧
      ∀ f : ℚˣ, tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) f 1 = 1 := by
  sorry

-- test tameSymbol_not_kbook (non-example)
/- `tameSymbol 5 2 = 3`, while the K-book's formula at `(r, s) = (5, 2)` gives `2`. -/
example (φ : ResidueField (Rat.padicValuation 5) →+* ZMod 5) :
    φ (tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) ⟪5⟫ ⟪2⟫) = 3 ∧
      φ ((-1) ^ ((Rat.padicValuation 5).ord 5 * (Rat.padicValuation 5).ord 2) *
        res (Rat.padicValuation 5)
          ⟨_, zpow_ord_mul_zpow_neg_ord_mem_unitGroup (Rat.padicValuation 5) ⟪2⟫ ⟪5⟫⟩ :
            (ResidueField (Rat.padicValuation 5))ˣ) = 2 := by
  sorry

end Tests

-- test tameSymbol_ratFunc (compatibility)
/- At the place `t - b` of `k(t)`, `∂{a, t - b} = a` for `a ∈ kˣ` (read in `k` through the residue
field of the place); the K-book's Weil reciprocity (6.5.3) uses the inverse `a⁻¹`. -/
example {k : Type u} [Field k] (b : k) (a : kˣ) :
    residueFieldCongr (valuationSubring_eq_integers
        (Place.adicOfIrreducible (Polynomial.irreducible_X_sub_C b)))
      (tameSymbol (Place.adicOfIrreducible (Polynomial.irreducible_X_sub_C b)).valuation
        (Place.adicOfIrreducible (Polynomial.irreducible_X_sub_C b)).valuation_surjective
        (Units.map (algebraMap k (RatFunc k)).toMonoidHom a)
        (Units.mk0 (algebraMap (Polynomial k) (RatFunc k) (Polynomial.X - Polynomial.C b))
          (RatFunc.algebraMap_ne_zero (Polynomial.X_sub_C_ne_zero b))) : _) =
      algebraMap k (Place.adicOfIrreducible (Polynomial.irreducible_X_sub_C b)).ResidueField a := by
  sorry

-- Infinite constant-field extension control for the degree-two comparison.
-- No FiniteDimensional instance is assumed: ℚ(u)/ℚ has infinite degree.
example [Fact (Nat.Prime 5)] (w : Valuation (RatFunc ℚ) ℤᵐ⁰)
    (hw : Function.Surjective w)
    (hvw : ∀ r : ℚ, w.ord (algebraMap ℚ (RatFunc ℚ) r) = (Rat.padicValuation 5).ord r)
    (f g : ℚˣ) :
    tameSymbol w hw (Units.map (algebraMap ℚ (RatFunc ℚ)).toMonoidHom f)
        (Units.map (algebraMap ℚ (RatFunc ℚ)).toMonoidHom g) =
      Units.map (residueFieldMap (Rat.padicValuation 5) w 1 (by decide)
        (by intro r; simpa using hvw r)).toMonoidHom
          (tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) f g) := by
  simpa using ramification_formula (Rat.padicValuation 5)
    (Rat.surjective_padicValuation 5) w hw 1 (by decide)
    (by intro r; simpa using hvw r) f g

-- For a trivial restriction, all nonzero constants have order zero.
-- This uses no e=0 residue-field map, which need not exist.
example {E : Type v} [Field E] [Algebra F E]
    (w : Valuation E ℤᵐ⁰) (hw : Function.Surjective w)
    (htriv : ∀ a : F, w.ord (algebraMap F E a) = 0) (f g : Fˣ) :
    tameSymbol w hw (Units.map (algebraMap F E).toMonoidHom f)
      (Units.map (algebraMap F E).toMonoidHom g) = 1 := by
  apply tameSymbol_of_ord_eq_zero
  · exact htriv f
  · exact htriv g

end TauCeti.TameSymbol

/-! ## Native relative-relation guard (T.6)

The relation set is expressible over Mathlib's free abelian group. Its future
quotient-to-relative-K₂ map is a README target: on a radical ideal, (r,s) maps to
⟨r,s⟩ when s∈I, and to ⟨s,r⟩⁻¹ otherwise. Descent checks D1/D2 and D3 with the
explicit entry-in-I witness. There is no all-entries-outside-I D3 case.
-/

namespace TauCeti.K2

section RelativePresentation

variable {R : Type u} [CommRing R] (I : Ideal R)

/-- The generators of the relative presentation: pairs with an entry in `I`. -/
abbrev RelDSGen (I : Ideal R) := {p : R × R // p.1 ∈ I ∨ p.2 ∈ I}

/-- The relations (D1)–(D3) among the relative generators (whenever `r`, `s` or `t` lies in `I`,
every symbol involved is a generator). -/
def relDSRel : Set (FreeAbelianGroup (RelDSGen I)) :=
  {z | ∃ (r s : R) (h : r ∈ I ∨ s ∈ I) (h' : s ∈ I ∨ r ∈ I),
      z = FreeAbelianGroup.of ⟨(r, s), h⟩ + FreeAbelianGroup.of ⟨(s, r), h'⟩} ∪
  {z | ∃ (r s t : R) (hs : r ∈ I ∨ s ∈ I) (ht : r ∈ I ∨ t ∈ I)
      (hst : r ∈ I ∨ s + t - r * s * t ∈ I),
      z = FreeAbelianGroup.of ⟨(r, s), hs⟩ + FreeAbelianGroup.of ⟨(r, t), ht⟩ -
        FreeAbelianGroup.of ⟨(r, s + t - r * s * t), hst⟩} ∪
  {z | ∃ (r s t : R) (hI3 : r ∈ I ∨ s ∈ I ∨ t ∈ I),
      z = FreeAbelianGroup.of ⟨(r, s * t), by
        rcases hI3 with hr | hs | ht
        · exact Or.inl hr
        · exact Or.inr (I.mul_mem_right t hs)
        · exact Or.inr (I.mul_mem_left s ht)⟩ -
      FreeAbelianGroup.of ⟨(r * s, t), by
        rcases hI3 with hr | hs | ht
        · exact Or.inl (I.mul_mem_right s hr)
        · exact Or.inl (I.mul_mem_left r hs)
        · exact Or.inr ht⟩ -
      FreeAbelianGroup.of ⟨(t * r, s), by
        rcases hI3 with hr | hs | ht
        · exact Or.inl (I.mul_mem_left t hr)
        · exact Or.inr hs
        · exact Or.inl (I.mul_mem_right r ht)⟩}

-- test TauCeti.K2.relative_D3_guard (non-example)
-- This actual iterated dual-number ring is F_3[x,y]/(x²,y²), not a free carrier.
example :
    let R := DualNumber (DualNumber (ZMod 3))
    let x : R := TrivSqZeroExt.inl (DualNumber.eps : DualNumber (ZMod 3))
    let y : R := DualNumber.eps
    let I : Ideal R := Ideal.span {x * y}
    I ^ 2 = ⊥ ∧ I ≤ Ideal.jacobson ⊥ ∧
      ¬ (x ∈ I ∨ y ∈ I ∨ x + y ∈ I) ∧
      (x ∈ I ∨ y * (x + y) ∈ I) ∧
      (x * y ∈ I ∨ x + y ∈ I) ∧
      ((x + y) * x ∈ I ∨ y ∈ I) := by
  sorry

-- test TauCeti.K2.relative_D3_detector (computation)
-- Ex. III.5.14(a) and relative_square_zero_kaehler give δ⟨i,a⟩ = i⊗da.
-- The following signature identifies the actual tensor target and the three images.
example :
    let R := DualNumber (DualNumber (ZMod 3))
    let x : R := TrivSqZeroExt.inl (DualNumber.eps : DualNumber (ZMod 3))
    let y : R := DualNumber.eps
    let I : Ideal R := Ideal.span {x * y}
    let z : I := ⟨x * y, by exact Ideal.subset_span (by simp)⟩
    letI : CommRing R := inferInstance
    letI : I.IsTwoSided := inferInstance
    letI : CommRing (R ⧸ I) := inferInstance
    letI : Module R Ω[(R ⧸ I)⁄ℤ] := Module.compHom _ (Ideal.Quotient.mk I)
    ∃ coord : (I ⊗[R] Ω[(R ⧸ I)⁄ℤ]) ≃+ (ZMod 3 × ZMod 3),
      coord (-(z ⊗ₜ KaehlerDifferential.D ℤ (R ⧸ I) (Ideal.Quotient.mk I x))) = (2, 0) ∧
      coord (z ⊗ₜ KaehlerDifferential.D ℤ (R ⧸ I) (Ideal.Quotient.mk I (x + y))) = (1, 1) ∧
      coord (z ⊗ₜ KaehlerDifferential.D ℤ (R ⧸ I) (Ideal.Quotient.mk I y)) = (0, 1) ∧
      coord (-(z ⊗ₜ KaehlerDifferential.D ℤ (R ⧸ I) (Ideal.Quotient.mk I x)) -
        (z ⊗ₜ KaehlerDifferential.D ℤ (R ⧸ I) (Ideal.Quotient.mk I (x + y))) -
        (z ⊗ₜ KaehlerDifferential.D ℤ (R ⧸ I) (Ideal.Quotient.mk I y))) = (1, 1) ∧
      ((1, 1) : ZMod 3 × ZMod 3) ≠ 0 := by
  sorry

end RelativePresentation

end TauCeti.K2

/-! ## Native conic and real-factor controls (T.7) -/

namespace TauCeti.NormResidueSymbol

open Classical in
/-- The source's conic symbol `c_F(r, s) ∈ {±1}` (`K2SymbolsBrauer:T.7/hilbert-symbol-steinberg`):
`+1` exactly when `r x² + s y² = 1` has a solution in `F` (a real definition). -/
def conicSymbol (F : Type u) [Field F] (r s : F) : ℤˣ :=
  if ∃ x y : F, r * x ^ 2 + s * y ^ 2 = 1 then 1 else -1

/-- The real comparison has unit inputs. The total conic function at zero is
outside this Hilbert-symbol domain. -/
theorem conicSymbol_real (r s : ℝˣ) :
    conicSymbol ℝ r s = -1 ↔ (r : ℝ) < 0 ∧ (s : ℝ) < 0 := by
  sorry

example : conicSymbol ℝ 0 0 = -1 ∧ ¬ ((0 : ℝ) < 0 ∧ (0 : ℝ) < 0) := by
  norm_num [conicSymbol]

-- The global real factor is `if m = 2 then conicSymbol ℝ r s else 1`.
-- For m>2 the primitive-root hypothesis excludes real embeddings.
theorem primitiveRoot_real_order_le_two (m : ℕ) [NeZero m] {ζ : ℝ}
    (hζ : IsPrimitiveRoot ζ m) : m ≤ 2 := by
  sorry

example (r s : ℝˣ) : (if (1 : ℕ) = 2 then conicSymbol ℝ r s else 1) = 1 := by
  norm_num

example (r s : ℝˣ) :
    (if (2 : ℕ) = 2 then conicSymbol ℝ r s else 1) = -1 ↔ (r : ℝ) < 0 ∧ (s : ℝ) < 0 := by
  simpa using conicSymbol_real r s

-- Complete m=1 product on ℚ at a=b=-1. Every finite local value in μ₁ is
-- necessarily 1, so this statement quantifies over all possible local factors.
-- Constructing normResidueSymbol and stating reciprocity for m>1 remain README targets.
open IsDedekindDomain NumberField in
example (c : HeightOneSpectrum (𝓞 ℚ) → rootsOfUnity 1 ℚ) :
    (Function.mulSupport c).Finite ∧
      (∏ᶠ v, ((c v : rootsOfUnity 1 ℚ) : ℚˣ)) *
        ∏ᶠ _w : {w : InfinitePlace ℚ // w.IsReal},
          Units.map (Int.castRingHom ℚ).toMonoidHom
            (if (1 : ℕ) = 2 then conicSymbol ℝ (-1) (-1) else 1) = 1 := by
  have hc : c = fun _ => 1 := funext fun _ => Subsingleton.elim _ _
  subst c
  simp [Function.mulSupport]

-- Quadratic real/dyadic cancellation is a separate computation, not the m=1 law.
example :
    conicSymbol ℝ (-1) (-1) = -1 ∧ conicSymbol ℚ_[2] (-1) (-1) = -1 ∧
      conicSymbol ℝ (-1) (-1) * conicSymbol ℚ_[2] (-1) (-1) = 1 := by
  sorry

example {F : Type u} [Field F] (r s : F) :
    conicSymbol F 1 s = 1 ∧ conicSymbol F r (1 - r) = 1 := by
  sorry

end TauCeti.NormResidueSymbol

section CompleteDVRSupportControls

-- s²=t: multiplication by s has determinant −t, not t.
example (t : ℚ) : Matrix.det !![0, t; 1, 0] = -t := by
  simp [Matrix.det_fin_two]

-- α²+tα+a=0, including characteristic two: N(α)=a.
example {R : Type*} [CommRing R] (a t : R) :
    Matrix.det !![0, -a; 1, -t] = a := by
  simp [Matrix.det_fin_two]

-- A base scalar has determinant u²: N(t)=t² and N(2)=4 in degree two.
example {R : Type*} [CommRing R] (u : R) :
    Matrix.det !![u, 0; 0, u] = u ^ 2 := by
  simp [Matrix.det_fin_two, pow_two]

end CompleteDVRSupportControls

/-! ## Targets whose carriers or constructions are not at the pins

All items below are fully specified in the README and packet, with hypotheses,
locators, proof plans, APIs and worked tests. Omitting a Lean declaration does not
remove or weaken its target. In particular:

* Uniformizer-last higher Milnor residue equals the tame symbol in degree two;
  the K-book tame symbol is its inverse. The 5-adic {2,5} value is 2, not 3.
* Higher ramification is for arbitrary field embeddings, surjective normalized
  valuations and e>0, without FiniteDimensional. Trivial restrictions use units
  residue zero. Infinite constant extensions and completions stay in scope.
* Milnor/Quillen transfer base change keeps Artinian component lengths and
  G-theory dévissage. K.3 uses the ring boundary and K.7 uses the RIGHT action.
* Curve normalization remains AlgebraicCurves Layer 2's mixed-extension contract.
  Milnor's integer argument retains the auxiliary rank-two relation and non-strict
  Case 7. These constructions are not redeveloped here.
* Local comparison has exponent -1; étale Chern comparison has -h. The README's
  Q₇ cubic example distinguishes the inverse. m=1 is not assigned a quadratic sign.

The proposed Part II supplies finite extensions of complete DVR fields with
arbitrary residue: DVR.0 normalized valuations/completeness; DVR.1 finite free
integral closure and degree ef; DVR.2 determinant norm/valuation/reduction;
DVR.3 separable generic base-change component lengths. Reuse pinned spectralNorm,
the native DVR graded-piece equivalence and finite-flat rank formula, and current
Tau Ceti's post-pin norm_quotient_mk when packaging. Proposed IDs are conditional,
not registered imports. The packet's supportPlan gives exact tests and owner links.

Index of README targets; entries marked native have the indicated elementary
part stated above. K-group, transfer, cohomological and presentation conclusions
still need their owners' carriers and constructions.
-/

-- K2SymbolsBrauer:T.3/tame-symbol: native elementary part above; full target in README.
-- K2SymbolsBrauer:T.3/tame-symbol-uniformizer-independence: native elementary part above; full target in README.
-- K2SymbolsBrauer:T.3/tame-symbol-steinberg: native elementary part above; full target in README.
-- K2SymbolsBrauer:T.3/ramification-formula: native elementary part above; full target in README.
-- K2SymbolsBrauer:T.3/finite-support: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.3/higher-milnor-residues: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.3/rigidity: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.3/transfer-and-norm-residue: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.3/localization-boundary: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.3/dedekind-localization-boundary: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.3/quillen-transfer-norm-residue: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.3/milnor-quillen-transfer-comparison: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.3/tame-symbol-hom: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.3/serre-residue-algebra: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.3/serre-map-steinberg: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.3/serre-map-kernel: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.3/milnor-residue-product-formula: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.3/specialisation-change-of-uniformiser: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.3/higher-ramification-formula: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/bass-tate-sequence: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/milnor-transfer-transitivity: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/weil-reciprocity: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/valuation-comparison: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/milnor-projection-formula: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/restriction-transfer-degree: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/leading-coefficient-splitting: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/degree-reduction: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/residue-section: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/filtration-quotients: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/simple-transfer: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/transfer-low-degrees: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/projective-line-reciprocity: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/weil-reciprocity-symbol-form: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/disjoint-support-reciprocity: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/prime-to-p-closure: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/transfer-base-change: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/p-closed-generation: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/kato-prime-degree: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/kato-complete-residue: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/constant-extension-residue: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/kato-commuting-square: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.5/unramified-subgroup: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.5/tame-kernel-sequence: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.5/relative-s-integer-sequence: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.5/real-sign-symbol: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.5/k2-of-the-integers: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.5/k2-of-the-rationals: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.6/dennis-stein-symbol: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.6/dennis-stein-presentation: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.6/relative-square-zero: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.6/dennis-stein-relations: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.6/relative-steinberg-group: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.6/relative-presentation: native elementary part above; full target in README.
-- K2SymbolsBrauer:T.7/symbol-formula: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.7/classical-local-symbols: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.7/twisted-roots-of-unity: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.7/hilbert-symbol-steinberg: native elementary part above; full target in README.
-- K2SymbolsBrauer:T.7/brauer-valued-symbol: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.7/local-comparison: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.7/global-reciprocity: native elementary part above; full target in README.
-- K2SymbolsBrauer:T.7/chern-class-agreement: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/complete-norm-residue: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.4/prime-degree-residue-on-generated-symbols: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.5/integer-steinberg-word-model: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.5/silvester-word-reduction: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.5/integer-kernel-in-monomial-subgroup: full target in README; no additional declaration here.
-- K2SymbolsBrauer:T.5/integer-kernel-upper-generation: full target in README; no additional declaration here.
