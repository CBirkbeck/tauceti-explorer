import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.PiTensorProduct.Basic
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.FieldTheory.Perfect
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.Data.ZMod.QuotientGroup
import Mathlib.Data.ENat.Basic
import Mathlib.LinearAlgebra.Complex.Module
import Mathlib.GroupTheory.Torsion
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.LinearAlgebra.Dual.Defs

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/MotivicEtaleKTheory--M.5d.md` is definitive.
These statements suggest Lean forms so contributors and reviewers converge on
names and signatures. They claim no implementation; every node is unchecked.

The Milnor tensor quotient below is an explicitly labelled stand-in for
K2SymbolsBrauer:T.2/milnor-k-theory, using consecutive Steinberg relations.
The ordinary forms are Mathlib exterior powers of its Kaehler differentials.
The pinned Tau Ceti KaehlerDifferential.mapSemilinear API was read, but its
module is not compiled in the shared build. The naturality signature therefore
accepts its genuine semilinear-map type as a supplier parameter, without
redefining the existing map. The differential, wedge product, field pullback
and inverse Cartier are typed
stand-ins for DerivedDeRhamCohomology:DD.2/DD.3, not new owned constructions.
In characteristic p, absolute differentials over Z agree with those over F_p;
the DD.2 request includes this scalar-base comparison. Exact forms are an
ADDITIVE subgroup: quotienting by their F-linear span would be incorrect.
No arbitrary proposition substitutes for a missing mathematical carrier.

The later sections give the M.5d–M.8 named-theorem, construction, API and
test signatures. Their genuine spectrum, cohomology, Witt and realization
carriers are supplier parameters until those roadmaps are implemented.
Conditions not currently expressible are omitted, as PROTOCOL §13 requires;
all mathematical hypotheses in the packet/reader remain binding. These
parametric prototypes prove neither the theorems nor supplier existence.
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
theorem logOne_natural {E : Type v} [Field E] (f : F →ₐ[ℤ] E)
    (differentialPullback : KaehlerDifferential ℤ F →ₛₗ[f.toRingHom] KaehlerDifferential ℤ E)
    (a : Fˣ) :
    differentialPullback (logOne (Additive.ofMul a)) =
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
def logarithmicForms (n : ℕ) : AddSubgroup (Forms F n) := (artinSchreier (F := F) p n).ker

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

namespace TauCeti.MotivicEtale
open TauCeti.DifferentialSymbol

/-! The higher sections are typed interfaces to the genuine supplier carriers.
Smoothness, admissible sheaf sites, coherent stable diagram maps, the actual
realization functors and their source hypotheses are omitted where they cannot
currently be expressed. No arbitrary proposition field replaces these conditions.
The packet/reader, including every scheme and coefficient restriction, is binding.
-/

section DifferentialComparison
variable {F : Type u} [Field F] (p : ℕ) [Fact p.Prime] [CharP F p]

/-- M.5d/bloch-gabber-kato; independent of the motivic norm-residue proof. -/
theorem bloch_gabber_kato (q : ℕ) :
    Function.Bijective (logarithmicSymbol (F := F) p q) := by sorry

variable (W : ℕ → ℕ → Type v) [∀ r q, AddCommGroup (W r q)]
/-- CR.4 supplies W r q = H⁰_et(F,W_r Ω^q_log), Teichmüller wedges and maps. -/
def wittSymbol (r q : ℕ) : ModP F (p ^ r) q →+ W r q := sorry

theorem wittSymbol_symbol (r q : ℕ) (a : Fin q → Fˣ)
    (teichLogWedge : (Fin q → Fˣ) → W r q) :
    wittSymbol p W r q (reduce F (p ^ r) q (symbol F a)) = teichLogWedge a := by sorry

theorem wittSymbol_restrict (r q : ℕ) (hr : 2 ≤ r)
    (R : W r q →+ W (r-1) q)
    (ρ : ModP F (p ^ r) q →+ ModP F (p ^ (r-1)) q) :
    R.comp (wittSymbol p W r q) = (wittSymbol p W (r-1) q).comp ρ := by sorry

theorem wittSymbol_insert (r q : ℕ) (hr : 2 ≤ r)
    (i : ModP F (p ^ 1) q →+ ModP F (p ^ r) q) (j : W 1 q →+ W r q) :
    (wittSymbol p W r q).comp i = j.comp (wittSymbol (F := F) p W 1 q) := by sorry

-- wittSymbol_test_zero
example (r : ℕ) (hr : 1 ≤ r) (e : W r 0 ≃+ ZMod (p ^ r)) :
    e (wittSymbol p W r 0 (reduce F (p ^ r) 0 (symbol F ![]))) = 1 := by sorry
-- wittSymbol_test_perfect
example (r q : ℕ) (hr : 1 ≤ r) (hq : 0 < q)
    (hperfect : Function.Surjective (fun x : F ↦ x ^ p)) :
    (∀ x : ModP F (p ^ r) q, x = 0) ∧ (∀ x : W r q, x = 0) := by sorry
-- wittSymbol_test_teichmuller: under W₂(F₃)≃Z/9, [2]=8 and [1]=1.
example : (8 : ZMod 9) + 8 = 7 ∧ (7 : ZMod 9) ≠ 1 := by sorry

/-- H.6's additive coefficient quotient, for the general abelian-group row. -/
abbrev coefficientGroup (A : Type u) [AddCommGroup A] (m : ℕ) :=
  A ⧸ (nsmulAddMonoidHom (α := A) m).range

/-- Canonical i([a])=[p^(r-1)a], ρ reduction and its Tor lift come from H.6.
Their coefficient-resolution identity is omitted from the supplier parameters. -/
theorem milnor_coefficient_row {A : Type u} [AddCommGroup A]
    (p r : ℕ) [Fact p.Prime] (hr : 2 ≤ r)
    (i : coefficientGroup A p →+ coefficientGroup A (p ^ r))
    (ρ : coefficientGroup A (p ^ r) →+ coefficientGroup A (p ^ (r-1)))
    (torReduction : (nsmulAddMonoidHom (α := A) (p ^ r)).ker →+
      (nsmulAddMonoidHom (α := A) (p ^ (r-1))).ker) :
    i.range = ρ.ker ∧ Function.Surjective ρ ∧
    i.ker = ((nsmulAddMonoidHom (α := A) (p ^ (r-1))).ker).map
      (QuotientAddGroup.mk' ((nsmulAddMonoidHom (α := A) p).range)) ∧
    (∀ x, (torReduction x : A) = p • (x : A)) := by sorry

theorem prime_power_bgk (r q : ℕ) (hr : 1 ≤ r) :
    Function.Bijective (wittSymbol (F := F) p W r q) := by sorry

theorem milnor_torsion_divisible (q : ℕ) (x : Milnor F q)
    (hx : ∃ m : ℕ, (p ^ m) • x = 0) :
    ∃ y : Milnor F q, p • y = x ∧ ∃ m : ℕ, (p ^ m) • y = 0 := by sorry
end DifferentialComparison

section FieldCoefficientComparisons
/- M.4 supplies the cycle-complex and étale-truncation carriers. The precise
norm-residue/semilocal transfer hypotheses are omitted in this prototype. -/
variable (Motivic Etale : ℕ → ℤ → Type u)
    [∀ j a, AddCommGroup (Motivic j a)] [∀ j a, AddCommGroup (Etale j a)]
variable (cycleMap : ∀ j a, Motivic j a →+ Etale j a)

theorem mod_prime_motivic_comparison (j : ℕ) (a : ℤ) (ha : a ≤ j) :
    Function.Bijective (cycleMap j a) := by sorry

theorem prime_power_norm_residue {F : Type v} [Field F] (ℓ r j : ℕ)
    [Fact ℓ.Prime] (hr : 1 ≤ r) (galoisSymbol : ModP F (ℓ ^ r) j →+ Etale j j) :
    Function.Bijective galoisSymbol := by sorry

/-- Actual filtered-field colimits and comparison maps come from M.1/T.2/DD/CR.4. -/
theorem filtered_colimit_comparisons {A B : Type u} [AddCommGroup A] [AddCommGroup B]
    (comparison : A →+ B) : Function.Bijective comparison := by sorry

theorem inseparable_and_characteristic_reductions {F E : Type v} [Field F] [Field E]
    (p m q : ℕ) [Fact p.Prime] [CharP F p] [CharP E p] (hm : m.Coprime p)
    (restriction : ModP F m q →+ ModP E m q) : Function.Bijective restriction := by sorry
end FieldCoefficientComparisons

section Supports
variable {Point : Type u} {Face : Type v}
/-- Closedness and face codimension are actual geometric supplier data. -/
def admissibleSupports (closed : Set (Set Point))
    (codim : Set Point → Face → WithTop ℕ) (p : ℕ) : Set (Set Point) :=
  {W | W ∈ closed ∧ ∀ f, (p : WithTop ℕ) ≤ codim W f}

theorem admissibleSupports_iff (closed : Set (Set Point))
    (codim : Set Point → Face → WithTop ℕ) (p : ℕ) (W : Set Point) :
    W ∈ admissibleSupports closed codim p ↔
      W ∈ closed ∧ ∀ f, (p : WithTop ℕ) ≤ codim W f := by sorry

theorem admissibleSupports_union (closed : Set (Set Point))
    (codim : Set Point → Face → WithTop ℕ) (p : ℕ) (W V : Set Point)
    (hW : W ∈ admissibleSupports closed codim p)
    (hV : V ∈ admissibleSupports closed codim p) :
    W ∪ V ∈ admissibleSupports closed codim p := by sorry

theorem admissibleSupports_face (closed : Set (Set Point))
    (codim : Set Point → Face → WithTop ℕ) (p : ℕ) (W : Set Point)
    (hW : W ∈ admissibleSupports closed codim p) (f : Face) :
    (p : WithTop ℕ) ≤ codim W f := by sorry

-- admissibleSupports_test_empty: empty codimension is infinity.
example (closed : Set (Set Point)) (codim : Set Point → Face → WithTop ℕ)
    (he : (∅ : Set Point) ∈ closed) (hc : ∀ f, codim ∅ f = ⊤) (p : ℕ) :
    (∅ : Set Point) ∈ admissibleSupports closed codim p := by sorry
-- admissibleSupports_test_zero
example (closed : Set (Set Point)) (codim : Set Point → Face → WithTop ℕ) :
    admissibleSupports closed codim 0 = closed := by sorry
-- admissibleSupports_test_face: proper whole-simplex codimension alone fails.
example (closed : Set (Set Point)) (codim : Set Point → Fin 2 → WithTop ℕ)
    (W : Set Point) (hwhole : codim W 0 = 1) (hvertex : codim W 1 = 0) :
    W ∉ admissibleSupports closed codim 1 := by sorry
end Supports

section Coniveau
variable {Spectrum : Type v} {Support : Type u}
variable (supports : ℕ → ℕ → Set Support) (Ksupport : ℕ → Support → Spectrum)
    (hocolim : {I : Type u} → (I → Spectrum) → Spectrum)
    (realize : (ℕ → Spectrum) → Spectrum)
/-- M.6a: construct the tower before its page. Stable diagram coherence is omitted. -/
def coniveauTower (p : ℕ) : Spectrum :=
  realize (fun r ↦ hocolim (fun W : {w // w ∈ supports p r} ↦ Ksupport r W.1))

theorem coniveauTower_level (p : ℕ) :
    coniveauTower supports Ksupport hocolim realize p =
      realize (fun r ↦ hocolim (fun W : {w // w ∈ supports p r} ↦ Ksupport r W.1)) := by sorry

variable (Hom : Spectrum → Spectrum → Type w)
    (Iso : Spectrum → Spectrum → Type w) (zero : Spectrum)
    (π : ℤ → Spectrum → Type u) [∀ m E, AddCommGroup (π m E)]
/-- The support inclusions supply the transition maps. -/
def coniveauTransition (p : ℕ) :
    Hom (coniveauTower supports Ksupport hocolim realize (p+1))
      (coniveauTower supports Ksupport hocolim realize p) := sorry

theorem coniveauTower_transition (p : ℕ)
    (supportInclusion : Hom (coniveauTower supports Ksupport hocolim realize (p+1))
      (coniveauTower supports Ksupport hocolim realize p)) :
    coniveauTransition supports Ksupport hocolim realize Hom p = supportInclusion := by sorry

theorem coniveauTower_pullback (p : ℕ)
    (supportsY : ℕ → ℕ → Set Support) :
    Nonempty (Hom (coniveauTower supports Ksupport hocolim realize p)
      (coniveauTower supportsY Ksupport hocolim realize p)) := by sorry

-- coniveauTower_test_zero
example (KX : Spectrum) :
    Nonempty (Iso (coniveauTower supports Ksupport hocolim realize 0) KX) := by sorry
-- coniveauTower_test_dimension
example (d m p : ℕ) (hp : d+m < p)
    (x : π m (coniveauTower supports Ksupport hocolim realize p)) : x = 0 := by sorry
-- coniveauTower_test_field_layer: degree-zero layer for a field is HZ.
example (layerZero HZ : Spectrum) : Nonempty (Iso layerZero HZ) := by sorry

theorem moving_and_excision (movedTower ordinaryTower : ℕ → Spectrum) (p : ℕ) :
    Nonempty (Iso (movedTower p) (ordinaryTower p)) := by sorry

theorem k_theory_well_connected (semilocalSupport : Spectrum) (m : ℤ) (hm : m < 0)
    (x : π m semilocalSupport) : x = 0 := by sorry

theorem coniveau_cycle_layer (layer : ℕ → Spectrum) (cycleEM : ℕ → Spectrum) (p : ℕ) :
    Nonempty (Iso (layer p) (cycleEM p)) := by sorry

/-- Filtered equivalence, not equality of spectral-sequence pages. -/
theorem global_model_comparison (HC FS : ℕ → Spectrum) :
    Nonempty (∀ p, Iso (HC p) (FS p)) := by sorry
end Coniveau

section MotivicPages
variable {Spectrum Couple Sequence : Type u}
variable (π : ℤ → Spectrum → Type v) [∀ m E, AddCommGroup (π m E)]
    (D E : Couple → ℕ → ℤ → Type v)
    [∀ c p m, AddCommGroup (D c p m)] [∀ c p m, AddCommGroup (E c p m)]
/-- H.6 exact-couple functor instantiated on the already constructed tower. -/
def motivicCouple (tower : ℕ → Spectrum) (coupleFunctor : (ℕ → Spectrum) → Couple) :
    Couple := coupleFunctor tower

theorem motivicCouple_D (tower : ℕ → Spectrum) (coupleFunctor : (ℕ → Spectrum) → Couple)
    (p : ℕ) (m : ℤ) :
    Nonempty (D (motivicCouple tower coupleFunctor) p m ≃+ π m (tower p)) := by sorry

theorem motivicCouple_E (tower layer : ℕ → Spectrum)
    (coupleFunctor : (ℕ → Spectrum) → Couple) (p : ℕ) (m : ℤ) :
    Nonempty (E (motivicCouple tower coupleFunctor) p m ≃+ π m (layer p)) := by sorry

theorem motivicCouple_differential (c : Couple) (s p : ℕ) (m : ℤ) :
    Nonempty (E c p m →+ E c (p+s) (m-1)) := by sorry

-- motivicCouple_test_indices: a=p-m,b=-p; raw s becomes page r=s+1.
example (m p s : ℤ) :
    (p+s-(m-1), -(p+s)) = ((p-m)+(s+1), (-p)-(s+1)+1) := by sorry
-- motivicCouple_test_boundary
example (c : Couple) (p : ℕ) (m : ℤ)
    (j : D c p m →+ E c p m) (k : E c p m →+ D c (p+1) (m-1)) :
    k.comp j = 0 := by sorry
-- motivicCouple_test_zero_weight
example (weightZero : Type v) [AddCommGroup weightZero] :
    Nonempty (weightZero ≃+ ℤ) := by sorry

/-- Same sequence assembled from the same couple; generic machinery is imported. -/
def motivicSequence (c : Couple) (sequenceFunctor : Couple → Sequence) : Sequence :=
  sequenceFunctor c

variable (Page : Sequence → ℕ → ℤ → ℤ → Type v)
    [∀ s r a b, AddCommGroup (Page s r a b)]
    (HM : ℤ → ℤ → Type v) [∀ a j, AddCommGroup (HM a j)]
    (K : ℤ → Type v) [∀ m, AddCommGroup (K m)]

theorem motivicSequence_pageTwo (c : Couple) (f : Couple → Sequence) (a b : ℤ) :
    Nonempty (Page (motivicSequence c f) 2 a b ≃+ HM (a-b) (-b)) := by sorry

theorem motivicSequence_abutment (c : Couple) (f : Couple → Sequence) (a b : ℤ)
    (gradedK : ℤ → ℤ → Type v) [∀ m p, AddCommGroup (gradedK m p)]
    (pageInfinity : ℤ → ℤ → Type v) [∀ a b, AddCommGroup (pageInfinity a b)] :
    Nonempty (pageInfinity a b ≃+ gradedK (-a-b) (-b)) := by sorry

theorem motivicSequence_pullback (Xseq Yseq : Sequence)
    (pullback : ∀ r a b, Page Xseq r a b →+ Page Yseq r a b) :
    Nonempty (Page Xseq 2 0 (-1) →+ Page Yseq 2 0 (-1)) := by sorry

-- motivicSequence_test_field_diagonal
example {F : Type u} [Field F] (j : ℕ) : Nonempty (HM j j ≃+ Milnor F j) := by sorry
-- motivicSequence_test_weight_zero
example : Nonempty (HM 0 0 ≃+ ℤ) := by sorry
-- motivicSequence_test_finite_field: q=3,j=1 has K₁=Z/2.
example : Nonempty (K 1 ≃+ ZMod 2) := by sorry

theorem motivic_strong_convergence (tower : ℕ → Spectrum) (d m p : ℕ)
    (hp : d+m < p) (x : π m (tower p)) : x = 0 := by sorry

theorem filtered_motivic_products (tower : ℕ → Spectrum)
    (Smash : Spectrum → Spectrum → Spectrum) (Hom : Spectrum → Spectrum → Type v)
    (p q : ℕ) : Nonempty (Hom (Smash (tower p) (tower q)) (tower (p+q))) := by sorry

theorem filtered_adams_operations (s : Sequence) (k j : ℕ) (a : ℤ)
    (ψ : Page s 2 a (-(j : ℤ)) →+ Page s 2 a (-(j : ℤ)))
    (x : Page s 2 a (-(j : ℤ))) : ψ x = (k ^ j) • x := by sorry

theorem rational_motivic_degeneration (s : Sequence) (r : ℕ) (hr : 2 ≤ r)
    [∀ a b, Module ℚ (Page s r a b)]
    (dr : ∀ a b, Page s r a b →+ Page s r (a+r) (b-r+1)) (a b : ℤ) :
    dr a b = 0 := by sorry

variable (Kweight : ℕ → ℕ → Type v) [∀ m j, AddCommGroup (Kweight m j)]
    [∀ m j, Module ℚ (Kweight m j)] (HMQ : ℤ → ℕ → Type v)
    [∀ a j, AddCommGroup (HMQ a j)] [∀ a j, Module ℚ (HMQ a j)]

theorem rational_weight_comparison (m j : ℕ) :
    Nonempty (Kweight m j ≃ₗ[ℚ] HMQ (2*(j : ℤ)-m) j) := by sorry
end MotivicPages

section EtaleComparison
variable {Spectrum Sheaf Site : Type u}
    (derivedSections : Site → Sheaf → Spectrum)
/-- Hypercomplete periodic finite-coefficient K sheaf, supplied by H.3/H.5/H.6. -/
def etaleK (site : Site) (periodicKSheaf : Sheaf) : Spectrum :=
  derivedSections site periodicKSheaf

variable (Hom Iso : Spectrum → Spectrum → Type v)
    (π : ℤ → Spectrum → Type w) [∀ n S, AddCommGroup (π n S)]

theorem etaleK_compare (site : Site) (periodicKSheaf : Sheaf) (ordinaryK : Spectrum) :
    Nonempty (Hom ordinaryK (etaleK derivedSections site periodicKSheaf)) := by sorry

theorem etaleK_hyperdescent (site : Site) (periodicKSheaf : Sheaf)
    (hypercoverLimit : Spectrum) :
    Nonempty (Iso (etaleK derivedSections site periodicKSheaf) hypercoverLimit) := by sorry

theorem etaleK_coefficients (site : Site) (Kr Ks : Sheaf)
    (ordinaryR ordinaryS : Spectrum)
    (cR : Hom ordinaryR (etaleK derivedSections site Kr))
    (cS : Hom ordinaryS (etaleK derivedSections site Ks))
    (redK : Hom ordinaryR ordinaryS)
    (redEt : Hom (etaleK derivedSections site Kr) (etaleK derivedSections site Ks))
    (comp : {A B C : Spectrum} → Hom B C → Hom A B → Hom A C) :
    comp redEt cR = comp cS redK := by sorry

-- etaleK_test_separable_closed: geometric trivialization of every finite Tate twist.
example (site : Site) (KS : Sheaf) (ℓ r : ℕ) (j : ℤ) :
    Nonempty (π (2*j) (etaleK derivedSections site KS) ≃+ ZMod (ℓ^r)) ∧
    (∀ x : π (2*j+1) (etaleK derivedSections site KS), x = 0) := by sorry
-- etaleK_test_rank
example (site : Site) (KS : Sheaf) (ℓ r : ℕ)
    (e : π 0 (etaleK derivedSections site KS) ≃+ ZMod (ℓ^r))
    (unitClass : π 0 (etaleK derivedSections site KS)) : e unitClass = 1 := by sorry
-- etaleK_test_periodic: negative even groups must survive periodicization.
example (site : Site) (KS : Sheaf) (ℓ r : ℕ) :
    Nonempty (π (-2) (etaleK derivedSections site KS) ≃+ ZMod (ℓ^r)) := by sorry

theorem bott_etale_descent (bottInverted periodicEtale : Spectrum) :
    Nonempty (Iso bottInverted periodicEtale) := by sorry
end EtaleComparison

section ArithmeticComparison
/- These carriers are genuine finite/adic K and continuous-cohomology groups;
field cd bounds, Thomason's hypothesis, regularity and admitted coefficient primes
are supplied in the packet and omitted from these parametric signatures. -/
variable (K Ket : ℤ → Type u) [∀ n, AddCommGroup (K n)] [∀ n, AddCommGroup (Ket n)]
    (comparison : ∀ n, K n →+ Ket n)

theorem beilinson_lichtenbaum (j : ℕ) (a : ℤ) (ha : a ≤ j)
    {HM HE : Type v} [AddCommGroup HM] [AddCommGroup HE] (cycleMap : HM →+ HE) :
    Function.Bijective cycleMap := by sorry

theorem dedekind_motivic_comparison (j : ℕ) (a : ℤ) (ha : a ≤ j)
    {HM HE : Type v} [AddCommGroup HM] [AddCommGroup HE] (cycleMap : HM →+ HE) :
    Function.Bijective cycleMap := by sorry

theorem quillen_lichtenbaum_field_range (d : ℕ) (n : ℤ) (hn : 0 ≤ n) :
    ((d : ℤ)-1 ≤ n → Function.Bijective (comparison n)) ∧
    (n = (d : ℤ)-2 → Function.Injective (comparison n)) := by sorry

theorem s_integer_comparison_range :
    (∀ n : ℤ, 1 ≤ n → Function.Bijective (comparison n)) ∧
    Function.Injective (comparison 0) := by sorry

variable (H : ℕ → ℕ → Type v) [∀ a j, AddCommGroup (H a j)]

theorem arithmetic_adic_degrees (j : ℕ) (hj : 2 ≤ j) :
    Nonempty (K (2*(j : ℤ)-1) ≃+ H 1 j) ∧
    Nonempty (K (2*(j : ℤ)-2) ≃+ H 2 j) := by sorry

theorem etale_adams_weights (j a : ℕ) (ψ : H 1 j →+ H 1 j) (x : H 1 j) :
    ψ x = (a ^ j) • x := by sorry

theorem etale_k_transfer {KY KX HY HX : Type w}
    [AddCommGroup KY] [AddCommGroup KX] [AddCommGroup HY] [AddCommGroup HX]
    (transfer : KY →+ KX) (corestriction : HY →+ HX)
    (regY : KY →+ HY) (regX : KX →+ HX) :
    regX.comp transfer = corestriction.comp regY := by sorry

/-- K here is localized away from 2, and Q^s/Q^s_- each supply this duality. -/
theorem number_ring_duality_sign (n : ℕ) (hn : 2 ≤ n)
    (dualityOdd : K (2*(n : ℤ)-1) →+ K (2*(n : ℤ)-1))
    (dualityEven : K (2*(n : ℤ)-2) →+ K (2*(n : ℤ)-2)) :
    (∀ x, dualityOdd x = ((-1 : ℤ)^n) • x) ∧
    (∀ x, dualityEven x = ((-1 : ℤ)^n) • x) := by sorry

theorem suslin_real_comparison (m n : ℕ) (hm : 1 ≤ m) (hn : 1 ≤ n)
    (BOmod : ℕ → Type v) [∀ a, AddCommGroup (BOmod a)] :
    Nonempty (K n ≃+ BOmod n) := by sorry

/-- The real mod-2 sequence has the differential pattern specified in the reader. -/
theorem real_mod_two_sequence (page : ℕ → ℤ → ℤ → Type v)
    [∀ r a b, AddCommGroup (page r a b)] (a b : ℤ) (hab : b ≤ a) (ha : a ≤ 0) :
    Nonempty (page 2 a b ≃+ ZMod 2) ∧ Nonempty (K 2 ≃+ ZMod 4) := by sorry

/-- K is finite-coefficient Q₂/Z₂ K here; H is continuous cohomology. The n=0
slot is separate. This preserves the unsplit 8k+5 short exact sequence. -/
theorem dyadic_s_integer_extensions (r₁ : ℕ) (hr : 1 ≤ r₁) (k : ℕ)
    (w : ℕ → ℕ) (Htilde : ℕ → Type v) [∀ j, AddCommGroup (Htilde j)] :
    Nonempty (K (8*(k : ℤ)+1) ≃+ H 1 (4*k+1)) ∧
    Nonempty (K (8*(k : ℤ)+2) ≃+ ZMod 2) ∧
    Nonempty (K (8*(k : ℤ)+3) ≃+ H 1 (4*k+2)) ∧
    Nonempty (K (8*(k : ℤ)+4) ≃+ (ZMod (2*w (4*k+2)) × (Fin (r₁-1) → ZMod 2))) ∧
    (∀ x : K (8*(k : ℤ)+6), x = 0) ∧
    Nonempty (K (8*(k : ℤ)+7) ≃+ Htilde (4*k+4)) ∧
    (0 < k → Nonempty (K (8*(k : ℤ)) ≃+ ZMod (w (4*k)))) ∧
    (∃ i : (Fin (r₁-1) → ZMod 2) →+ K (8*(k : ℤ)+5),
      ∃ q : K (8*(k : ℤ)+5) →+ H 1 (4*k+3),
        Function.Injective i ∧ i.range = q.ker ∧ Function.Surjective q) := by sorry
end ArithmeticComparison

section RealCorrection
variable {Spectrum : Type u} (Hom : Spectrum → Spectrum → Type v)
    (fiber : {A B : Spectrum} → Hom A B → Spectrum)
/-- Actual fibre of the map to the direct sum over real places. -/
def realCorrection {A B : Spectrum} (α : Hom A B) : Spectrum := fiber α

theorem realCorrection_triangle {A B : Spectrum} (α : Hom A B) :
    Nonempty (Hom (realCorrection Hom fiber α) A) := by sorry

theorem realCorrection_pageMap {HM HR : Type w} [AddCommGroup HM] [AddCommGroup HR]
    (actualPageMap α : HM →+ HR) : actualPageMap = α := by sorry

theorem realCorrection_kernel {HM HR : Type w} [AddCommGroup HM] [AddCommGroup HR]
    (α₁ : HM →+ HR) (Htilde : AddSubgroup HM) : Htilde = α₁.ker := by sorry

-- realCorrection_test_imaginary: the fibre of a map to zero is the source.
example (Iso : Spectrum → Spectrum → Type v) (A zero : Spectrum) (α : Hom A zero) :
    Nonempty (Iso (realCorrection Hom fiber α) A) := by sorry
-- realCorrection_test_real_higher
example {HM HR : Type w} [AddCommGroup HM] [AddCommGroup HR]
    (s : ℕ) (hs : 3 ≤ s) (αs : HM →+ HR) : Function.Bijective αs := by sorry
-- realCorrection_test_extension: an exact nonsplit Z/4 model distinguishes splitting.
example : ¬ Nonempty (ZMod 4 ≃+ (ZMod 2 × ZMod 2)) := by sorry
end RealCorrection

section ChernMaps
variable (K : ℕ → Type u) [∀ n, AddCommGroup (K n)]
    (H : ℤ → ℕ → Type v) [∀ a j, AddCommGroup (H a j)]
/-- Positive higher Chern class, defined by universal equivariant Chern classes. -/
def finiteChern (i n : ℕ) : K n →+ H (2*(i : ℤ)-n) i := sorry

theorem finiteChern_natural (i n : ℕ)
    (KY : ℕ → Type u) [∀ m, AddCommGroup (KY m)]
    (HY : ℤ → ℕ → Type v) [∀ a j, AddCommGroup (HY a j)]
    (pullK : K n →+ KY n) (pullH : H (2*(i : ℤ)-n) i →+ HY (2*(i : ℤ)-n) i) :
    (finiteChern KY HY i n).comp pullK = pullH.comp (finiteChern K H i n) := by sorry

theorem finiteChern_bockstein {Det : Type w} [AddCommGroup Det]
    (detBoundary : K 2 →+ Det) (kummer : Det →+ H 0 1) :
    finiteChern K H 1 2 = kummer.comp detBoundary := by sorry

theorem finiteChern_milnor (i : ℕ) (hi : 1 ≤ i) {F : Type w} [Field F]
    (milnorToK : Milnor F i →+ K i)
    (cupKummer : (Fin i → Fˣ) → H (2*(i : ℤ)-i) i) (a : Fin i → Fˣ) :
    finiteChern K H i i (milnorToK (symbol F a)) =
      (((-1 : ℤ)^(i-1)) * (Nat.factorial (i-1) : ℤ)) • cupKummer a := by sorry

-- finiteChern_test_unit
example {Units : Type w} [AddCommGroup Units] (det : K 1 →+ Units)
    (kummer : Units →+ H 1 1) (x : K 1) :
    finiteChern K H 1 1 x = kummer (det x) := by sorry
-- finiteChern_test_bott
example {IntegralK₂ : Type w} [AddCommGroup IntegralK₂]
    (integralReduction : IntegralK₂ →+ K 2) (β : K 2) (ζ : H 0 1) :
    finiteChern K H 1 2 β = ζ ∧
      ∀ x, finiteChern K H 1 2 (integralReduction x) = 0 := by sorry
-- finiteChern_test_factorial
example {F : Type w} [Field F] (milnorToK : Milnor F 2 →+ K 2)
    (cupKummer : (Fin 2 → Fˣ) → H 2 2) (a : Fin 2 → Fˣ) :
    finiteChern K H 2 2 (milnorToK (symbol F a)) = -cupKummer a := by sorry
end ChernMaps

section MotivicCharacter
variable (K : ℕ → Type u) [∀ n, AddCommGroup (K n)] [∀ n, Module ℚ (K n)]
    (H : ℤ → ℕ → Type v) [∀ a j, AddCommGroup (H a j)] [∀ a j, Module ℚ (H a j)]
/-- Rational total character; K₀ uses Newton polynomials rather than additive c_i. -/
def motivicChern (i n : ℕ) : K n →ₗ[ℚ] H (2*(i : ℤ)-n) i := sorry

theorem motivicChern_positive (i n : ℕ) (hi : 1 ≤ i) (hn : 1 ≤ n)
    (rationalChern : K n →+ H (2*(i : ℤ)-n) i) (x : K n) :
    (Nat.factorial (i-1) : ℚ) • motivicChern K H i n x =
      ((-1 : ℚ)^(i-1)) • rationalChern x := by sorry

theorem motivicChern_product (m n i : ℕ) (x : K m) (y : K n)
    (prodK : K m → K n → K (m+n))
    (cup : ∀ (a b : ℕ), H (2*(a : ℤ)-m) a → H (2*(b : ℤ)-n) b →
      H (2*(i : ℤ)-(m+n)) i) :
    motivicChern K H i (m+n) (prodK x y) =
      ∑ a ∈ Finset.range (i+1), cup a (i-a)
        (motivicChern K H a m x) (motivicChern K H (i-a) n y) := by sorry

theorem motivicChern_weight (m j i : ℕ) (x : K m)
    (weightComparison : K m →ₗ[ℚ] H (2*(j : ℤ)-m) j) :
    motivicChern K H j m x = weightComparison x ∧
      (i ≠ j → motivicChern K H i m x = 0) := by sorry

-- motivicChern_test_rank
example (rank : K 0 →ₗ[ℚ] H 0 0) : motivicChern K H 0 0 = rank := by sorry
-- motivicChern_test_line: the cup power includes the weight/degree shift.
example (i : ℕ) (lineBundle : K 0) (c₁power : H (2*(i : ℤ)-(0 : ℕ)) i) :
    (Nat.factorial i : ℚ) • motivicChern K H i 0 lineBundle = c₁power := by sorry
-- motivicChern_test_milnor
example {F : Type w} [Field F] (i : ℕ) (hi : 1 ≤ i)
    (milnorToK : Milnor F i →+ K i)
    (cycleSymbol : Milnor F i →+ H (2*(i : ℤ)-i) i) (x : Milnor F i) :
    motivicChern K H i i (milnorToK x) = cycleSymbol x := by sorry

theorem supported_cycle_character {KS HE : Type w} [AddCommGroup KS] [AddCommGroup HE]
    (cl : KS →+ HE) (cycleToK : KS) (refinedCycleClass : HE) :
    cl cycleToK = refinedCycleClass := by sorry
end MotivicCharacter

section DeligneRegulator
variable (K : ℕ → Type u) [∀ n, AddCommGroup (K n)] [∀ n, Module ℚ (K n)]
    (HD : ℤ → ℕ → Type v) [∀ a j, AddCommGroup (HD a j)] [∀ a j, Module ℚ (HD a j)]
/-- Realization of the normalized motivic character into genuine Deligne cohomology. -/
def deligneRegulator (j m : ℕ) : K m →ₗ[ℚ] HD (2*(j : ℤ)-m) j := sorry

theorem deligneRegulator_natural (j m : ℕ)
    (KY : ℕ → Type u) [∀ n, AddCommGroup (KY n)] [∀ n, Module ℚ (KY n)]
    (HDY : ℤ → ℕ → Type v) [∀ a j, AddCommGroup (HDY a j)] [∀ a j, Module ℚ (HDY a j)]
    (pullK : K m →ₗ[ℚ] KY m)
    (pullHD : HD (2*(j : ℤ)-m) j →ₗ[ℚ] HDY (2*(j : ℤ)-m) j) :
    (deligneRegulator KY HDY j m).comp pullK =
      pullHD.comp (deligneRegulator K HD j m) := by sorry

theorem deligneRegulator_product (m n i : ℕ) (x : K m) (y : K n)
    (prodK : K m → K n → K (m+n))
    (cup : ∀ (a b : ℕ), HD (2*(a : ℤ)-m) a → HD (2*(b : ℤ)-n) b →
      HD (2*(i : ℤ)-(m+n)) i) :
    deligneRegulator K HD i (m+n) (prodK x y) =
      ∑ a ∈ Finset.range (i+1), cup a (i-a)
        (deligneRegulator K HD a m x) (deligneRegulator K HD (i-a) n y) := by sorry

theorem deligneRegulator_real (j : ℕ) (conjugation : HD 0 j →+ HD 0 j)
    (tateLattice : ℤ →+ HD 0 j) (n : ℤ) :
    conjugation (tateLattice n) = tateLattice (((-1 : ℤ)^j)*n) := by sorry

-- deligneRegulator_test_point: τ denotes the genuine (2πi)^j generator.
example {D : Type w} [AddCommGroup D] (τ : ℂ) :
    Nonempty (D ≃+ (ℂ ⧸ Submodule.span ℝ {τ})) := by sorry
-- deligneRegulator_test_integral_point: the integral quotient is a different carrier.
example {D : Type w} [AddCommGroup D] (τ : ℂ) :
    Nonempty (D ≃+ (ℂ ⧸ AddSubgroup.zmultiples τ)) := by sorry
-- deligneRegulator_test_line
example {KD DB HB : Type w} [AddCommGroup KD] [AddCommGroup DB] [AddCommGroup HB]
    (integralChern : KD →+ DB) (betti : DB →+ HB) (topologicalChern : KD →+ HB)
    (lineBundle : KD) : betti (integralChern lineBundle) = topologicalChern lineBundle := by sorry

theorem number_field_deligne_normalization (j : ℕ) (hj : 2 ≤ j)
    {V : Type w} [AddCommGroup V] [Module ℝ V] [Module ℚ V]
    (earlyRegulator : K (2*j-1) →ₗ[ℚ] V)
    (normalizedUniversalClass : K (2*j-1) →ₗ[ℚ] V) :
    earlyRegulator = normalizedUniversalClass := by sorry

theorem chern_functoriality {KY KX HY HX : Type w}
    [AddCommGroup KY] [AddCommGroup KX] [AddCommGroup HY] [AddCommGroup HX]
    (finiteEtaleTransfer : KY →+ KX) (trace : HY →+ HX)
    (regY : KY →+ HY) (regX : KX →+ HX) :
    regX.comp finiteEtaleTransfer = trace.comp regY := by sorry
end DeligneRegulator

section IntegralStructures
variable {Model Generic : Type u} [AddCommGroup Model] [AddCommGroup Generic]
/-- Actual image subgroup, not an arbitrary rational subspace. -/
def integralStructures (restriction : Model →+ Generic) : AddSubgroup Generic :=
  restriction.range

abbrev integralLattice (restriction : Model →+ Generic) :=
  (integralStructures restriction) ⧸ AddCommGroup.torsion (integralStructures restriction)

/-- Rational scalar-extension image supplied by the motivic coefficient comparison. -/
def integralRationalPart {GenericQ : Type v} [AddCommGroup GenericQ] [Module ℚ GenericQ]
    (restrictionQ : (ℚ ⊗[ℤ] Model) →ₗ[ℚ] GenericQ) : Submodule ℚ GenericQ :=
  restrictionQ.range

theorem integralStructures_image (restriction : Model →+ Generic)
    {GenericQ : Type v} [AddCommGroup GenericQ] [Module ℚ GenericQ]
    (restrictionQ : (ℚ ⊗[ℤ] Model) →ₗ[ℚ] GenericQ) :
    integralStructures restriction = restriction.range ∧
    integralRationalPart restrictionQ = restrictionQ.range := by sorry

theorem integralStructures_torsion (restriction : Model →+ Generic) :
    (QuotientAddGroup.mk' (AddCommGroup.torsion (integralStructures restriction))).ker =
      AddCommGroup.torsion (integralStructures restriction) := by sorry

theorem integralStructures_lattice (restriction : Model →+ Generic)
    (r : ℕ) : Nonempty (integralLattice restriction ≃+ (Fin r → ℤ)) := by sorry

-- integralStructures_test_torsion
example (m : ℕ) (hm : 1 < m) :
    (∀ x : (ZMod m ⧸ AddCommGroup.torsion (ZMod m)), x = 0) ∧
    (∀ x : ℚ ⊗[ℤ] ZMod m, x = 0) := by sorry
-- integralStructures_test_free
example (r : ℕ) :
    Nonempty (((Fin r → ℤ) ⧸ AddCommGroup.torsion (Fin r → ℤ)) ≃+ (Fin r → ℤ)) ∧
    Nonempty ((ℚ ⊗[ℤ] (Fin r → ℤ)) ≃ₗ[ℚ] (Fin r → ℚ)) := by sorry
-- integralStructures_test_index: same rational span, different integral images.
example : (AddSubgroup.zmultiples (1 : ℚ)) ≠ AddSubgroup.zmultiples (2 : ℚ) ∧
    Submodule.span ℚ {(1 : ℚ)} = Submodule.span ℚ {(2 : ℚ)} := by sorry
end IntegralStructures

section RealizationDictionary
/-- Cohomological geometric-Frobenius convention; q is nonzero and unramified. -/
theorem tate_elliptic_realization_dictionary (q : ℚ) (hq : q ≠ 0) (a : ℚ) (j : ℕ)
    (tateEuler ellipticEuler : ℚ → ℚ) :
    (∀ T, tateEuler T = 1-q^(-(j : ℤ))*T) ∧
    (∀ T, ellipticEuler T = 1-a*q^(-(j : ℤ))*T+q^(1-2*(j : ℤ))*T^2) := by sorry
end RealizationDictionary

section NormFamilies
variable (K : ℕ → Type u) [∀ n, AddCommGroup (K n)]
    (transition : ∀ n, K (n+1) →+ K n)
/-- transition = norm after coefficient reduction, with genuine K norm variance. -/
def normFamilies : AddSubgroup (∀ n, K n) where
  carrier := {x | ∀ n, transition n (x (n+1)) = x n}
  zero_mem' := by sorry
  add_mem' := by sorry
  neg_mem' := by sorry

theorem normFamilies_projection (x : normFamilies K transition) (n : ℕ) :
    transition n (x.1 (n+1)) = x.1 n := by sorry

theorem normFamilies_regulator (H : ℕ → Type v) [∀ n, AddCommGroup (H n)]
    (corestriction : ∀ n, H (n+1) →+ H n) (reg : ∀ n, K n →+ H n)
    (x : normFamilies K transition) (n : ℕ) :
    corestriction n (reg (n+1) (x.1 (n+1))) = reg n (x.1 n) := by sorry

theorem normFamilies_soule (i n : ℕ) (hi : 1 ≤ i)
    (unitBottPower : K n) (norm : K n →+ K n)
    (soule : normFamilies K transition) : soule.1 n = norm unitBottPower := by sorry

-- normFamilies_test_constant
example {A : Type v} [AddCommGroup A] :
    Nonempty (normFamilies (fun _ ↦ A) (fun _ ↦ AddMonoidHom.id A) ≃+ A) := by sorry
-- normFamilies_test_degree
example : 2*1-1 = (1 : ℕ) ∧ 2*2-1 = (3 : ℕ) := by sorry
-- normFamilies_test_transfer: actual transition compatibility, not restriction.
example (H : ℕ → Type v) [∀ n, AddCommGroup (H n)]
    (corestriction : ∀ n, H (n+1) →+ H n) (reg : ∀ n, K n →+ H n) (n : ℕ) :
    (reg n).comp (transition n) = (corestriction n).comp (reg (n+1)) := by sorry

theorem euler_factor_regulator_compatibility (H : ℕ → Type v) [∀ n, AddCommGroup (H n)]
    (corestriction : ∀ n, H (n+1) →+ H n) (reg : ∀ n, K n →+ H n)
    (P_K : K 0 →+ K 0) (P_H : H 0 →+ H 0) (x₁ : K 1) (x₀ : K 0)
    (hnorm : transition 0 x₁ = P_K x₀)
    (htransfer : (reg 0).comp (transition 0) = (corestriction 0).comp (reg 1))
    (hpoly : (reg 0).comp P_K = P_H.comp (reg 0)) :
    corestriction 0 (reg 1 x₁) = P_H (reg 0 x₀) := by sorry
end NormFamilies

section FundamentalLines
variable {Cpx : Type u} {R : Type v} [CommRing R]
    (detInv : Cpx → Type w) [∀ C, AddCommGroup (detInv C)] [∀ C, Module R (detInv C)]
/-- Inverse determinant of the supplied perfect compact-support complex. -/
abbrev fundamentalLine (C : Cpx) := detInv C

theorem fundamentalLine_baseChange (C : Cpx)
    (S : Type v) [CommRing S] [Algebra R S]
    (baseChangedLine : Type w) [AddCommGroup baseChangedLine] [Module S baseChangedLine] :
    Nonempty ((S ⊗[R] fundamentalLine detInv C) ≃ₗ[S] baseChangedLine) := by sorry

theorem fundamentalLine_triangle (A B C : Cpx) :
    Nonempty (fundamentalLine detInv B ≃ₗ[R]
      (fundamentalLine detInv A ⊗[R] fundamentalLine detInv C)) := by sorry

theorem fundamentalLine_basis (C : Cpx) (z : fundamentalLine detInv C)
    (multiply : R →ₗ[R] fundamentalLine detInv C) (hm : ∀ a, multiply a = a • z) :
    Function.Bijective multiply ↔
      ∃ e : R ≃ₗ[R] fundamentalLine detInv C, ∀ a, e a = a • z := by sorry

-- fundamentalLine_test_zero
example (zeroComplex : Cpx) : Nonempty (fundamentalLine detInv zeroComplex ≃ₗ[R] R) := by sorry
-- fundamentalLine_test_shift
example (C shiftedC : Cpx) :
    Nonempty (fundamentalLine detInv shiftedC ≃ₗ[R] Module.Dual R (fundamentalLine detInv C)) := by sorry
-- fundamentalLine_test_nonunit: p has become invertible over the fraction field only.
example (p : ℕ) [Fact p.Prime] :
    IsUnit (p : ℚ_[p]) ∧ ¬ IsUnit (p : ℤ_[p]) := by sorry

theorem selmer_regulator_factorization {K Global Selmer : Type u}
    [AddCommGroup K] [AddCommGroup Global] [AddCommGroup Selmer]
    (reg : K →+ Global) (selmerInclusion : Selmer →+ Global) :
    ∃ selmerReg : K →+ Selmer, selmerInclusion.comp selmerReg = reg := by sorry

theorem regulator_determinant_comparison (C : Cpx)
    (Q : Type v) [Field Q] [Algebra R Q]
    (periodLine : Type w) [AddCommGroup periodLine] [Module Q periodLine] :
    Nonempty ((Q ⊗[R] fundamentalLine detInv C) ≃ₗ[Q] periodLine) := by sorry
end FundamentalLines

end TauCeti.MotivicEtale
