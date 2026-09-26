import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.PiTensorProduct.Basic
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.FieldTheory.Perfect
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.Data.ZMod.QuotientGroup
import TauCeti.RingTheory.Kaehler.MapSemilinear

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/MotivicEtaleKTheory--M.5d.md` is definitive.
These statements suggest Lean forms so contributors and reviewers converge on
names and signatures. They claim no implementation; every node is unchecked.

The Milnor tensor quotient below is an explicitly labelled stand-in for
K2SymbolsBrauer:T.2/milnor-k-theory, using consecutive Steinberg relations.
The ordinary forms are Mathlib exterior powers of its Kaehler differentials.
The differential, wedge product, field pullback and inverse Cartier are typed
stand-ins for DerivedDeRhamCohomology:DD.2/DD.3, not new owned constructions.
In characteristic p, absolute differentials over Z agree with those over F_p;
the DD.2 request includes this scalar-base comparison. Exact forms are an
ADDITIVE subgroup: quotienting by their F-linear span would be incorrect.
No arbitrary proposition substitutes for a missing mathematical carrier.

BGK injectivity/surjectivity, prime-power coefficients, coniveau towers,
comparison spectra and regulators are not asserted in this file; their exact
missing source/proof inputs are recorded in the packet and reader.
-/

noncomputable section
open scoped TensorProduct
universe u v w

namespace TauCeti.DifferentialSymbol

abbrev Forms (F : Type u) [Field F] (n : ℕ) :=
  ⋀[F]^n (KaehlerDifferential ℤ F)

abbrev Tensors (F : Type u) [Field F] (n : ℕ) :=
  ⨂[ℤ] _ : Fin n, Additive Fˣ

variable (F : Type u) [Field F]

/-- Imported T.2 presentation, not a new packet definition. -/
def milnorRelations (n : ℕ) : Submodule ℤ (Tensors F n) :=
  Submodule.span ℤ {z | ∃ (a : Fin n → Fˣ) (i j : Fin n),
    j.val = i.val + 1 ∧ (a i : F) + a j = 1 ∧
    z = PiTensorProduct.tprod ℤ (fun k ↦ Additive.ofMul (a k))}

abbrev Milnor (n : ℕ) := Tensors F n ⧸ milnorRelations F n

def symbol {n : ℕ} (a : Fin n → Fˣ) : Milnor F n :=
  Submodule.Quotient.mk (PiTensorProduct.tprod ℤ (fun k ↦ Additive.ofMul (a k)))

/-- Imported T.2 field map and product. -/
def milnorMap {E : Type v} [Field E] (f : F →ₐ[ℤ] E) (n : ℕ) :
    Milnor F n →+ Milnor E n := sorry

def milnorProduct (i j : ℕ) : Milnor F i →+ Milnor F j →+ Milnor F (i+j) := sorry

/-- Ordinary additive quotient by multiplication by p, not a K-spectrum with coefficients. -/
abbrev ModP (p n : ℕ) := Milnor F n ⧸ (nsmulAddMonoidHom (α := Milnor F n) p).range

def reduce (p n : ℕ) : Milnor F n →+ ModP F p n :=
  QuotientAddGroup.mk' _

/-- Imported DD.2 ordinary de Rham differential. -/
def deRham (n : ℕ) : Forms F n →+ Forms F (n+1) := sorry

/-- Imported DD.2 exact subgroup, degree zero zero. -/
def exactForms : (n : ℕ) → AddSubgroup (Forms F n)
  | 0 => ⊥
  | n+1 => (deRham F n).range

abbrev FormsQuotient (n : ℕ) := Forms F n ⧸ exactForms F n

def project (n : ℕ) : Forms F n →+ FormsQuotient F n := QuotientAddGroup.mk' _

/-- Imported DD.2 semilinear field pullback, not an F-linear map. -/
def formsMap {E : Type v} [Field E] (f : F →ₐ[ℤ] E) (n : ℕ) :
    Forms F n →ₛₗ[f.toRingHom] Forms E n := sorry

/-- Imported DD.2 wedge, with the displayed degree order. -/
def wedge (i j : ℕ) : Forms F i →ₗ[F] Forms F j →ₗ[F] Forms F (i+j) := sorry

/-- Imported DD.3 inverse Cartier with its Frobenius scalar convention. -/
def inverseCartier (p : ℕ) [Fact p.Prime] [CharP F p] (n : ℕ) : Forms F n →+ FormsQuotient F n := sorry

variable {F}

/-- M.5d/logarithmic-one-form. -/
def logOne : Additive Fˣ →+ KaehlerDifferential ℤ F := sorry

theorem logOne_apply (a : Fˣ) :
    logOne (Additive.ofMul a) = (a : F)⁻¹ • KaehlerDifferential.D ℤ F (a : F) := by sorry

theorem logOne_mul (a b : Fˣ) :
    logOne (Additive.ofMul (a*b)) = logOne (Additive.ofMul a) + logOne (Additive.ofMul b) := by sorry

theorem logOne_inv (a : Fˣ) :
    logOne (Additive.ofMul a⁻¹) = -logOne (Additive.ofMul a) := by sorry

theorem logOne_pow (a : Fˣ) (m : ℕ) :
    logOne (Additive.ofMul (a^m)) = m • logOne (Additive.ofMul a) := by sorry

-- logOne_test_one
example : logOne (F := F) (Additive.ofMul (1 : Fˣ)) = 0 := by sorry
-- logOne_test_nonzero
example (a : Fˣ) (h : KaehlerDifferential.D ℤ F (a : F) ≠ 0) :
    logOne (Additive.ofMul a) ≠ 0 := by sorry
-- logOne_test_inverse
example (a : Fˣ) :
    logOne (Additive.ofMul a⁻¹) + logOne (Additive.ofMul a) = 0 := by sorry

/-- M.5d/logarithmic-one-form-natural. -/
theorem logOne_natural {E : Type v} [Field E] (f : F →ₐ[ℤ] E) (a : Fˣ) :
    KaehlerDifferential.mapSemilinear f (logOne (Additive.ofMul a)) =
      logOne (Additive.ofMul (Units.map f.toMonoidHom a)) := by sorry

/-- M.5d/tensor-differential-symbol. -/
def tensorSymbol (n : ℕ) : Tensors F n →ₗ[ℤ] Forms F n := sorry

theorem tensorSymbol_pure (n : ℕ) (a : Fin n → Fˣ) :
    tensorSymbol n (PiTensorProduct.tprod ℤ (fun k ↦ Additive.ofMul (a k))) =
      exteriorPower.ιMulti F n (fun k ↦ logOne (Additive.ofMul (a k))) := by sorry

theorem tensorSymbol_unique (n : ℕ) (g : Tensors F n →ₗ[ℤ] Forms F n)
    (h : ∀ a : Fin n → Fˣ,
      g (PiTensorProduct.tprod ℤ (fun k ↦ Additive.ofMul (a k))) =
      exteriorPower.ιMulti F n (fun k ↦ logOne (Additive.ofMul (a k)))) :
    g = tensorSymbol n := by sorry

theorem tensorSymbol_update_mul (n : ℕ) (a : Fin n → Fˣ) (i : Fin n) (b c : Fˣ) :
    tensorSymbol n (PiTensorProduct.tprod ℤ (fun k ↦ Additive.ofMul ((Function.update a i (b*c)) k))) =
      tensorSymbol n (PiTensorProduct.tprod ℤ (fun k ↦ Additive.ofMul ((Function.update a i b) k))) +
      tensorSymbol n (PiTensorProduct.tprod ℤ (fun k ↦ Additive.ofMul ((Function.update a i c) k))) := by sorry

-- tensorSymbol_test_zero
example : exteriorPower.zeroEquiv F (KaehlerDifferential ℤ F)
    (tensorSymbol 0 (PiTensorProduct.tprod ℤ (fun i : Fin 0 ↦ Fin.elim0 i))) = 1 := by sorry
-- tensorSymbol_test_one
example (a : Fˣ) : exteriorPower.oneEquiv F (KaehlerDifferential ℤ F)
    (tensorSymbol 1 (PiTensorProduct.tprod ℤ (fun _ : Fin 1 ↦ Additive.ofMul a))) =
      logOne (Additive.ofMul a) := by sorry
-- tensorSymbol_test_repeated
example (a : Fˣ) : tensorSymbol 2
    (PiTensorProduct.tprod ℤ (fun _ : Fin 2 ↦ Additive.ofMul a)) = 0 := by sorry

/-- M.5d/steinberg-vanishing; distinct positions, including characteristic two. -/
theorem steinberg_vanish (n : ℕ) (a : Fin n → Fˣ) (i j : Fin n)
    (hij : i ≠ j) (ha : (a i : F) + a j = 1) :
    tensorSymbol n (PiTensorProduct.tprod ℤ (fun k ↦ Additive.ofMul (a k))) = 0 := by sorry

/-- M.5d/milnor-differential-symbol. -/
def differentialSymbol (n : ℕ) : Milnor F n →+ Forms F n := sorry

theorem differentialSymbol_symbol (n : ℕ) (a : Fin n → Fˣ) :
    differentialSymbol n (symbol F a) =
      exteriorPower.ιMulti F n (fun k ↦ logOne (Additive.ofMul (a k))) := by sorry

theorem differentialSymbol_quotient (n : ℕ) (x : Tensors F n) :
    differentialSymbol n (Submodule.Quotient.mk x) = tensorSymbol n x := by sorry

theorem differentialSymbol_unique (n : ℕ) (g : Milnor F n →+ Forms F n)
    (h : ∀ a : Fin n → Fˣ, g (symbol F a) =
      exteriorPower.ιMulti F n (fun k ↦ logOne (Additive.ofMul (a k)))) :
    g = differentialSymbol n := by sorry

-- differentialSymbol_test_zero
example : exteriorPower.zeroEquiv F (KaehlerDifferential ℤ F)
    (differentialSymbol 0 (symbol F ![])) = 1 := by sorry
-- differentialSymbol_test_one
example (a : Fˣ) : exteriorPower.oneEquiv F (KaehlerDifferential ℤ F)
    (differentialSymbol 1 (symbol F ![a])) = (a : F)⁻¹ • KaehlerDifferential.D ℤ F (a : F) := by sorry
-- differentialSymbol_test_repeated
example (a : Fˣ) : differentialSymbol 2 (symbol F ![a,a]) = 0 := by sorry

/-- M.5d/milnor-symbol-natural. -/
theorem differentialSymbol_natural {E : Type v} [Field E] (f : F →ₐ[ℤ] E)
    (n : ℕ) (x : Milnor F n) :
    formsMap F f n (differentialSymbol n x) = differentialSymbol n (milnorMap F f n x) := by sorry

/-- M.5d/milnor-symbol-product. -/
theorem differentialSymbol_product (i j : ℕ) (x : Milnor F i) (y : Milnor F j) :
    differentialSymbol (i+j) (milnorProduct F i j x y) =
      wedge F i j (differentialSymbol i x) (differentialSymbol j y) := by sorry

variable (p : ℕ) [hp : Fact p.Prime] [hchar : CharP F p]
include hp hchar

/-- M.5d/characteristic-annihilation. -/
theorem forms_p_smul (n : ℕ) (ω : Forms F n) : p • ω = 0 := by sorry

/-- M.5d/mod-p-differential-symbol. -/
def modPSymbol (p : ℕ) [Fact p.Prime] [CharP F p] (n : ℕ) : ModP F p n →+ Forms F n := sorry

theorem modPSymbol_reduce (n : ℕ) (x : Milnor F n) :
    modPSymbol p n (reduce F p n x) = differentialSymbol n x := by sorry

theorem modPSymbol_unique (n : ℕ) (g : ModP F p n →+ Forms F n)
    (h : ∀ x, g (reduce F p n x) = differentialSymbol n x) : g = modPSymbol p n := by sorry

theorem modPSymbol_symbol (n : ℕ) (a : Fin n → Fˣ) :
    modPSymbol p n (reduce F p n (symbol F a)) =
      exteriorPower.ιMulti F n (fun k ↦ logOne (Additive.ofMul (a k))) := by sorry

-- modPSymbol_test_zero
example : exteriorPower.zeroEquiv F (KaehlerDifferential ℤ F)
    (modPSymbol p 0 (reduce F p 0 (symbol F ![]))) = 1 := by sorry
-- modPSymbol_test_p_multiple
example (n : ℕ) (x : Milnor F n) : modPSymbol p n (reduce F p n (p • x)) = 0 := by sorry
-- modPSymbol_test_one
example (a : Fˣ) : exteriorPower.oneEquiv F (KaehlerDifferential ℤ F)
    (modPSymbol p 1 (reduce F p 1 (symbol F ![a]))) = logOne (Additive.ofMul a) := by sorry

/-- M.5d/artin-schreier-differential; opposite sign to BK's 1-C^{-1}, same kernel. -/
def artinSchreier (n : ℕ) : Forms F n →+ FormsQuotient F n :=
  inverseCartier F p n - project F n

theorem artinSchreier_apply (n : ℕ) (ω : Forms F n) :
    artinSchreier p n ω = inverseCartier F p n ω - project F n ω := by sorry

/-- M.5d/artin-schreier-logarithmic-formula: promoted from the API because fixedness uses it. -/
theorem artinSchreier_logarithmic (n : ℕ) (x : F) (a : Fin n → Fˣ) :
    artinSchreier p n (x • exteriorPower.ιMulti F n (fun k ↦ logOne (Additive.ofMul (a k)))) =
      project F n ((x^p-x) • exteriorPower.ιMulti F n (fun k ↦ logOne (Additive.ofMul (a k)))) := by sorry

theorem artinSchreier_add (n : ℕ) (x y : Forms F n) :
    artinSchreier p n (x+y) = artinSchreier p n x + artinSchreier p n y := by sorry

-- artinSchreier_test_zero
example : artinSchreier (F := F) p 0 0 = 0 := by sorry
-- artinSchreier_test_unit
example : artinSchreier p 0 ((exteriorPower.zeroEquiv F (KaehlerDifferential ℤ F)).symm 1) = 0 := by sorry
-- artinSchreier_test_not_zero_map
example (x : F) (h : x^p ≠ x) :
    artinSchreier p 0 ((exteriorPower.zeroEquiv F (KaehlerDifferential ℤ F)).symm x) ≠ 0 := by sorry

/-- M.5d/logarithmic-differential-group. -/
def logarithmicForms (n : ℕ) : AddSubgroup (Forms F n) := (artinSchreier p n).ker

theorem logarithmicForms_mem (n : ℕ) (ω : Forms F n) :
    ω ∈ logarithmicForms p n ↔ inverseCartier F p n ω = project F n ω := by sorry

def logarithmicFormsMap {E : Type v} [Field E] [CharP E p] (f : F →ₐ[ℤ] E) (n : ℕ) :
    logarithmicForms (F := F) p n →+ logarithmicForms (F := E) p n := sorry

theorem logarithmicFormsMap_coe {E : Type v} [Field E] [CharP E p]
    (f : F →ₐ[ℤ] E) (n : ℕ) (ω : logarithmicForms (F := F) p n) :
    (logarithmicFormsMap p f n ω : Forms E n) = formsMap F f n ω := by sorry

theorem logarithmicFormsMap_id (n : ℕ) (ω : logarithmicForms (F := F) p n) :
    logarithmicFormsMap p (AlgHom.id ℤ F) n ω = ω := by sorry

theorem logarithmicFormsMap_comp {E : Type v} [Field E] [CharP E p]
    {L : Type w} [Field L] [CharP L p] (f : F →ₐ[ℤ] E) (g : E →ₐ[ℤ] L)
    (n : ℕ) (ω : logarithmicForms (F := F) p n) :
    logarithmicFormsMap p (g.comp f) n ω = logarithmicFormsMap p g n (logarithmicFormsMap p f n ω) := by sorry

-- logarithmicForms_test_zero
example (n : ℕ) : (0 : Forms F n) ∈ logarithmicForms p n := by sorry
-- logarithmicForms_test_degree_zero
example (x : F) : (exteriorPower.zeroEquiv F (KaehlerDifferential ℤ F)).symm x ∈ logarithmicForms p 0 ↔ x^p = x := by sorry
-- logarithmicForms_test_not_F_submodule
example (x : F) (h : x^p ≠ x) :
    x • (exteriorPower.zeroEquiv F (KaehlerDifferential ℤ F)).symm 1 ∉ logarithmicForms p 0 := by sorry

/-- M.5d/differential-symbol-fixed. -/
theorem differentialSymbol_fixed (n : ℕ) (x : Milnor F n) :
    differentialSymbol n x ∈ logarithmicForms p n := by sorry

/-- M.5d/logarithmic-symbol. -/
def logarithmicSymbol (n : ℕ) : ModP F p n →+ logarithmicForms (F := F) p n := sorry

theorem logarithmicSymbol_coe (n : ℕ) (x : ModP F p n) :
    (logarithmicSymbol p n x : Forms F n) = modPSymbol p n x := by sorry

theorem logarithmicSymbol_unique (n : ℕ)
    (g : ModP F p n →+ logarithmicForms (F := F) p n)
    (h : ∀ x, (g x : Forms F n) = modPSymbol p n x) : g = logarithmicSymbol p n := by sorry

theorem logarithmicSymbol_symbol (n : ℕ) (a : Fin n → Fˣ) :
    (logarithmicSymbol p n (reduce F p n (symbol F a)) : Forms F n) =
      exteriorPower.ιMulti F n (fun k ↦ logOne (Additive.ofMul (a k))) := by sorry

-- logarithmicSymbol_test_zero
example : exteriorPower.zeroEquiv F (KaehlerDifferential ℤ F)
    (logarithmicSymbol p 0 (reduce F p 0 (symbol F ![]))) = 1 := by sorry
-- logarithmicSymbol_test_one
example (a : Fˣ) : exteriorPower.oneEquiv F (KaehlerDifferential ℤ F)
    (logarithmicSymbol p 1 (reduce F p 1 (symbol F ![a]))) = logOne (Additive.ofMul a) := by sorry
-- logarithmicSymbol_test_repeated
example (a : Fˣ) : logarithmicSymbol p 2 (reduce F p 2 (symbol F ![a,a])) = 0 := by sorry

/-- M.5d/weight-zero-comparison. -/
theorem logarithmicSymbol_zero_bijective : Function.Bijective (logarithmicSymbol (F := F) p 0) := by sorry

/-- M.5d/perfect-field-differentials. -/
theorem perfect_forms_zero (h : Function.Surjective (fun x : F ↦ x^p))
    (n : ℕ) (hn : 0 < n) (ω : Forms F n) : ω = 0 := by sorry

/-- M.5d/perfect-field-milnor-mod-p. -/
theorem perfect_modP_zero (h : Function.Surjective (fun x : F ↦ x^p))
    (n : ℕ) (hn : 0 < n) (x : ModP F p n) : x = 0 := by sorry

/-- M.5d/weight-one-injectivity. -/
theorem logarithmicSymbol_one_injective : Function.Injective (logarithmicSymbol (F := F) p 1) := by sorry

end TauCeti.DifferentialSymbol
