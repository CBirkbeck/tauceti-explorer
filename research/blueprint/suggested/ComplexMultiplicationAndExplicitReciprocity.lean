/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/ComplexMultiplicationAndExplicitReciprocity.md is
 definitive. These statements suggest Lean forms so contributors and reviewers
converge on names and signatures. Nothing here is claimed implemented.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The executable fragments use the native CM-field, intermediate-field,
fractional-ideal/ClassGroup/Pic, scheme, Weierstrass, polynomial and
interval carriers. A signature marked GAP is a fragment: necessary missing supplier
conditions are stated explicitly in the comment, rather than hidden as an
uninterpreted Prop. The displayed binders alone need not imply a GAP statement;
elaboration checks its syntax/types, not the omitted mathematics. The full
mathematical statement is in the reader/packet.
Raw subgroup or value-set parameters stand for supplied arithmetic data, not
new private replacements for ray-class groups or modular-function fields.
Future signatures needing an absent geometric/realization carrier are in
comment blocks, with their supplier and omitted conditions identified.
Tests have the exact packet names in their docstrings and use `example`.
-/

import Mathlib.NumberTheory.NumberField.CMField
import Mathlib.FieldTheory.IntermediateField.Adjoin.Defs
import Mathlib.LinearAlgebra.Complex.Module
import Mathlib.LinearAlgebra.Trace
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.RingTheory.ClassGroup.Basic
import Mathlib.RingTheory.PicardGroup
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.Algebra.Polynomial.BigOperators
import Mathlib.Order.Interval.Basic
import Mathlib.Data.Int.ModEq
import Mathlib.Algebra.Order.Floor.Ring
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Point
import Mathlib.AlgebraicGeometry.Group.Abelian
import Mathlib.CategoryTheory.Monoidal.Cartesian.Grp
import Mathlib.GroupTheory.QuotientGroup.Basic

/- The shared build has no Tau Ceti End.Basic/Isogeny.Degree object files.
The future geometry blocks below require these individual imports:
import TauCeti.AlgebraicGeometry.AbelianVariety.End.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Degree
They are commented rather than introducing a replacement abelian variety. -/

noncomputable section
open scoped BigOperators nonZeroDivisors ComplexConjugate TensorProduct
open Polynomial CategoryTheory
open AlgebraicGeometry
open scoped MonoidalCategory

namespace TauCeti.CM

/-! CM.0. The embedding-partition definition works for finite étale CM algebras.
The finite-étale/product-of-CM-fields hypothesis is supplied in the reader;
field-specific primitive/reflex comparison statements are scoped separately. -/

variable {E : Type*} [CommRing E] [Algebra ℚ E]

/-- Complex conjugation on the target, not an assumed Galois automorphism of E. -/
def conjugateEmbedding (φ : E →ₐ[ℚ] ℂ) : E →ₐ[ℚ] ℂ :=
  (Complex.conjAe.restrictScalars ℚ).toAlgHom.comp φ

/-- Select exactly one embedding from each conjugate pair. -/
structure CMType (E : Type*) [CommRing E] [Algebra ℚ E] where
  embeddings : Finset (E →ₐ[ℚ] ℂ)
  conjugate_partition : ∀ φ, φ ∈ embeddings ↔ conjugateEmbedding φ ∉ embeddings

namespace CMType

/-- The complementary/conjugate type on the same embedded algebra. -/
def conjugate (Φ : CMType E) : CMType E := by sorry

lemma ext {Φ Ψ : CMType E} (h : Φ.embeddings = Ψ.embeddings) : Φ = Ψ := by sorry
lemma mem_conjugate_iff (Φ : CMType E) (φ : E →ₐ[ℚ] ℂ) :
    φ ∈ Φ.conjugate.embeddings ↔ φ ∉ Φ.embeddings := by sorry
lemma card [FiniteDimensional ℚ E] [IsReduced E] (Φ : CMType E) :
    2 * Φ.embeddings.card = Module.finrank ℚ E := by sorry
lemma conjugate_conjugate (Φ : CMType E) : Φ.conjugate.conjugate = Φ := by sorry

/-- Test datum: the embedded quadratic field Q(i), on the native field carrier. -/
def gaussianField : IntermediateField ℚ ℂ := IntermediateField.adjoin ℚ {Complex.I}
instance gaussian_numberField : NumberField gaussianField := by sorry
instance gaussian_isCMField : NumberField.IsCMField gaussianField := by sorry
def gaussianType : CMType gaussianField where
  embeddings := {gaussianField.val}
  conjugate_partition := by sorry

/-- Concrete nonprimitive quartic test data, on native intermediate fields. -/
def zeta8 : ℂ := Complex.exp (Complex.I * (Real.pi / 4))
def zeta8Field : IntermediateField ℚ ℂ := IntermediateField.adjoin ℚ {zeta8}
instance zeta8_numberField : NumberField zeta8Field := by sorry
instance zeta8_isCMField : NumberField.IsCMField zeta8Field := by sorry
def zeta8Cubing : zeta8Field →ₐ[ℚ] ℂ := by sorry
lemma zeta8Cubing_generator (hz : zeta8 ∈ zeta8Field) :
    zeta8Cubing ⟨zeta8, hz⟩ = zeta8 ^ 3 := by sorry
def zeta8InducedType : CMType zeta8Field := by
  classical
  exact { embeddings := {zeta8Field.val, zeta8Cubing}
          conjugate_partition := by sorry }
def zeta8QuadraticCore : IntermediateField ℚ ℂ :=
  IntermediateField.adjoin ℚ {zeta8 + zeta8 ^ 3}
lemma zeta8QuadraticCore_generator : zeta8 + zeta8 ^ 3 =
    (Real.sqrt 2 : ℂ) * Complex.I := by sorry

/-- Test TauCeti.CM.CMType.test_gaussian. -/
example : gaussianType.embeddings.card = 1 := by sorry
/-- Test TauCeti.CM.CMType.test_not_full. -/
example (Φ : CMType gaussianField) :
    ¬ (∀ φ : gaussianField →ₐ[ℚ] ℂ, φ ∈ Φ.embeddings) := by sorry
/-- Test TauCeti.CM.CMType.test_product: one choice from each factor. -/
example {F : Type*} [CommRing F] [Algebra ℚ F]
    (Φ : CMType E) (Ψ : CMType F) :
    ∃ Θ : CMType (E × F), Θ.embeddings.card = Φ.embeddings.card + Ψ.embeddings.card := by sorry

section Primitive
variable {K : Type*} [Field K] [NumberField K]

/-- Restriction of embeddings defines induction along an actual subfield. -/
def induced (F : IntermediateField ℚ K) (Φ₀ : CMType F) : CMType K := by sorry

/-- No proper CM subfield induces the type. CMType on F rules out real factors. -/
def IsPrimitive (Φ : CMType K) : Prop :=
  ∀ (F : IntermediateField ℚ K) (Φ₀ : CMType F), induced F Φ₀ = Φ → F = ⊤

lemma induced_mem (F : IntermediateField ℚ K) (Φ₀ : CMType F) (φ : K →ₐ[ℚ] ℂ) :
    φ ∈ (induced F Φ₀).embeddings ↔ φ.comp F.val ∈ Φ₀.embeddings := by sorry

/-- Restriction form of type induction, allowing actual towers of embeddings. -/
def inducedAlong {F L : Type*} [Field F] [NumberField F] [Field L] [NumberField L]
    (f : F →ₐ[ℚ] L) (Φ : CMType F) : CMType L := by sorry
lemma inducedAlong_mem {F L : Type*} [Field F] [NumberField F]
    [Field L] [NumberField L] (f : F →ₐ[ℚ] L) (Φ : CMType F)
    (φ : L →ₐ[ℚ] ℂ) :
    φ ∈ (inducedAlong f Φ).embeddings ↔ φ.comp f ∈ Φ.embeddings := by sorry
lemma induced_eq_inducedAlong (F : IntermediateField ℚ K) [NumberField F]
    (Φ₀ : CMType F) : induced F Φ₀ = inducedAlong F.val Φ₀ := by sorry
lemma induced_trans {F L : Type*} [Field F] [NumberField F]
    [Field L] [NumberField L] (f : F →ₐ[ℚ] L) (g : L →ₐ[ℚ] K) (Φ₀ : CMType F) :
    inducedAlong g (inducedAlong f Φ₀) = inducedAlong (g.comp f) Φ₀ := by sorry

/-- Uniqueness of the primitive core inside the native subfield lattice.
Existence is the right-stabilizer construction in the complete CM0 statement. -/
lemma primitive_core_unique (Φ : CMType K)
    (F₀ F₁ : IntermediateField ℚ K) [NumberField F₀] [NumberField F₁]
    (Φ₀ : CMType F₀) (Φ₁ : CMType F₁)
    (h₀ : Φ₀.IsPrimitive) (h₁ : Φ₁.IsPrimitive)
    (hind₀ : induced F₀ Φ₀ = Φ) (hind₁ : induced F₁ Φ₁ = Φ) : F₀ = F₁ := by sorry

/-- Test TauCeti.CM.CMType.test_quadratic_primitive. -/
example [NumberField.IsCMField K] (hdeg : Module.finrank ℚ K = 2)
    (Φ : CMType K) : Φ.IsPrimitive := by sorry
/-- Test TauCeti.CM.CMType.test_zeta8_induced: zeta8 and zeta8^3
restrict to the same embedding of Q(sqrt(-2)). -/
example : ¬ zeta8InducedType.IsPrimitive := by sorry
/-- Test TauCeti.CM.CMType.test_induced_card. -/
example (F : IntermediateField ℚ K) [FiniteDimensional ℚ F] (Φ₀ : CMType F) :
    (induced F Φ₀).embeddings.card = Module.finrank F K * Φ₀.embeddings.card := by sorry
end Primitive

/-- Trace of the selected embeddings. -/
def typeTrace (Φ : CMType E) (x : E) : ℂ := ∑ φ ∈ Φ.embeddings, φ x

/-- Native trace-generated intermediate field, compared with D3 in the full plan. -/
def reflexField (Φ : CMType E) : IntermediateField ℚ ℂ :=
  IntermediateField.adjoin ℚ (Set.range Φ.typeTrace)

lemma reflexField_le_iff (Φ : CMType E) (F : IntermediateField ℚ ℂ) :
    Φ.reflexField ≤ F ↔ ∀ x, Φ.typeTrace x ∈ F := by sorry

/-- Stabilizer on an actual normal ambient field (C). Finite Galois descent and
D3 comparison are the named CM0-reflex-comparison supplier refinement. -/
lemma reflexField_stabilizer (Φ : CMType E) (σ : ℂ ≃ₐ[ℚ] ℂ) :
    (∀ z ∈ Φ.reflexField, σ z = z) ↔ ∀ x, σ (Φ.typeTrace x) = Φ.typeTrace x := by sorry

/-- GAP CM0-reflex-comparison: the D3 carrier is unavailable. This states the
universal uniqueness which the eventual cocharacter comparison must satisfy. -/
lemma reflexField_generic (Φ : CMType E) (F : IntermediateField ℚ ℂ)
    (h : ∀ L : IntermediateField ℚ ℂ, F ≤ L ↔ ∀ x, Φ.typeTrace x ∈ L) :
    F = Φ.reflexField := by sorry

/-- Test TauCeti.CM.CMType.test_reflex_quadratic. -/
example : gaussianType.reflexField = gaussianField := by sorry
/-- Test TauCeti.CM.CMType.test_reflex_induced: the actual quartic
nonprimitive test and its quadratic primitive core have the same reflex field. -/
example : zeta8InducedType.reflexField = zeta8QuadraticCore := by sorry
/-- Test TauCeti.CM.CMType.test_reflex_not_Q. -/
example : Complex.I ∈ gaussianType.reflexField ∧ gaussianType.reflexField ≠ ⊥ := by sorry

section Reflex
variable {K : Type*} [Field K] [NumberField K] [NumberField.IsCMField K]

/-- GAP CM0-reflex-comparison: canonical finite-Galois inverse-coset choices.
The output is a type on the actual trace-defined subfield, not a fake reflex field. -/
def reflexType (Φ : CMType K) (ι : K →ₐ[ℚ] ℂ) : CMType Φ.reflexField := by sorry

/-- The inverse-coset law on the actual trace-generated reflex field.
The finite-normal-closure construction descends this ambient restriction law. -/
lemma reflexType_mem (Φ : CMType K) (ι : K →ₐ[ℚ] ℂ) (σ : ℂ ≃ₐ[ℚ] ℂ) :
    σ.toAlgHom.comp Φ.reflexField.val ∈ (Φ.reflexType ι).embeddings ↔
      σ.symm.toAlgHom.comp ι ∈ Φ.embeddings := by sorry

/-- GAP CM0-primitive-core: the normal-closure comparison is omitted. -/
lemma reflexType_primitive (Φ : CMType K) (ι : K →ₐ[ℚ] ℂ) (F : IntermediateField ℚ Φ.reflexField)
    (Φ₀ : CMType F)
    (h : ∀ φ : Φ.reflexField →ₐ[ℚ] ℂ,
      φ ∈ (Φ.reflexType ι).embeddings ↔ φ.comp F.val ∈ Φ₀.embeddings) : F = ⊤ := by sorry

/-- GAP CM0-primitive-core: final statement compares embedded pairs. The trace
field consequence of the double reflex is expressed on native subfields. -/
lemma doubleReflex_primitiveCore (Φ : CMType K) (ι : K →ₐ[ℚ] ℂ) :
    (Φ.reflexType ι).reflexField ≤ ι.fieldRange := by sorry

/-- For a primitive embedded pair the double reflex recovers its field.
The type-preserving pair isomorphism is the CM0-D3 adapter refinement. -/
lemma doubleReflex_eq_of_primitive (Φ : CMType K) (ι : K →ₐ[ℚ] ℂ)
    (h : Φ.IsPrimitive) : (Φ.reflexType ι).reflexField = ι.fieldRange := by sorry

/-- Test TauCeti.CM.CMType.test_reflex_type_quadratic: the selected Gaussian
type is its own reflex type, on the trace-defined copy of its reflex field. -/
example : (gaussianType.reflexType gaussianField.val).embeddings =
    {gaussianType.reflexField.val} := by sorry
/-- Test TauCeti.CM.CMType.test_double_reflex_induced: the actual quartic
induced type has quadratic double reflex, not the original quartic field. -/
example : (zeta8InducedType.reflexType zeta8Field.val).reflexField = zeta8QuadraticCore ∧
    Module.finrank ℚ (zeta8InducedType.reflexType zeta8Field.val).reflexField = 2 ∧
    (zeta8InducedType.reflexType zeta8Field.val).reflexField ≠ zeta8Field := by sorry
/-- Test TauCeti.CM.CMType.test_closure_independence: changing an extension
of the same reflex embedding cannot change inverse-coset membership. -/
example (Φ : CMType K) (ι : K →ₐ[ℚ] ℂ) (σ τ : ℂ ≃ₐ[ℚ] ℂ)
    (h : σ.toAlgHom.comp Φ.reflexField.val = τ.toAlgHom.comp Φ.reflexField.val) :
    (σ.symm.toAlgHom.comp ι ∈ Φ.embeddings ↔
      τ.symm.toAlgHom.comp ι ∈ Φ.embeddings) := by sorry

/-- Product over the reflex type is algebraic, lies in the selected copy of K,
and its product with its conjugate is the absolute reflex-field norm. V4 supplies
its idelic extension; this theorem is only the algebraic formula. -/
lemma typeNorm_identities (Φ : CMType K) (ι : K →ₐ[ℚ] ℂ)
    [NumberField Φ.reflexField] (a : Φ.reflexField) :
    let z := ∏ φ ∈ (Φ.reflexType ι).embeddings, φ a
    z ∈ ι.fieldRange ∧
      z * conj z = (Algebra.norm ℚ a : ℂ) := by sorry
end Reflex

/-- Image of the actual order tensor map in the selected étale factor. The
trace idempotent/quotient map and finite full-rank hypotheses are supplied by
CM0-reflex-order/GN11; they are omitted here, not replaced by abstract truth flags. -/
def reflexOrder {T Q : Type*} [CommRing T] [CommRing Q]
    (quotientMap : T →+* Q) : Subring Q := quotientMap.range
lemma reflexOrder_image {T Q : Type*} [CommRing T] [CommRing Q]
    (f : T →+* Q) (x : Q) : x ∈ reflexOrder f ↔ ∃ y, f y = x := by sorry
lemma reflexOrder_fractionAlgebra {T Q : Type*} [CommRing T] [CommRing Q]
    (f : T →+* Q) (hf : Function.Surjective f) : reflexOrder f = ⊤ := by sorry
/-- GAP GN11: dPhi is the relative discriminant ideal over the reflex integers
of the finite order image, using GN11's trace pairing. Its identification is an
omitted supplier condition. It is distinct from the absolute Z-discriminant of O.
In the quadratic case E*=E, the selected tensor factor contains O_E via a⊗1. -/
lemma reflexOrder_discriminant
    (O : Subring (NumberField.RingOfIntegers gaussianField))
    (f : NumberField.RingOfIntegers gaussianField ⊗[ℤ] O →+*
      NumberField.RingOfIntegers gaussianField)
    (hleft : ∀ a, f (a ⊗ₜ[ℤ] (1 : O)) = a)
    (dPhi : Ideal (NumberField.RingOfIntegers gaussianField)) :
    reflexOrder f = ⊤ ∧ dPhi = 1 := by sorry
/-- Test TauCeti.CM.CMType.test_reflex_order_quadratic: use the actual tensor
factor rather than an unrelated identity map on Z. -/
example (O : Subring (NumberField.RingOfIntegers gaussianField))
    (f : NumberField.RingOfIntegers gaussianField ⊗[ℤ] O →+*
      NumberField.RingOfIntegers gaussianField)
    (hleft : ∀ a, f (a ⊗ₜ[ℤ] (1 : O)) = a) : reflexOrder f = ⊤ := by sorry
/-- Test TauCeti.CM.CMType.test_reflex_order_image. -/
example {T Q : Type*} [CommRing T] [CommRing Q] (f : T →+* Q) (a b : T) :
    f a * f b ∈ reflexOrder f := by sorry
/-- Test TauCeti.CM.CMType.test_order_discriminant: O=Z+3Zi has absolute
discriminant -36, but its quadratic reflex image is O_E and dPhi is the unit
relative ideal. GAP GN11: identify O with this order and dPhi with its relative
trace discriminant; these missing conditions are not truth flags. -/
example (O : Subring (NumberField.RingOfIntegers gaussianField))
    (f : NumberField.RingOfIntegers gaussianField ⊗[ℤ] O →+*
      NumberField.RingOfIntegers gaussianField)
    (hleft : ∀ a, f (a ⊗ₜ[ℤ] (1 : O)) = a)
    (dPhi : Ideal (NumberField.RingOfIntegers gaussianField)) :
    reflexOrder f = ⊤ ∧ dPhi = 1 := by sorry

end CMType

/-- Explicit non-Galois quartic/reflex computation, polynomial part. GAP
CM0-quartic-fields: primitive/D4/fixed-field identifications remain in the reader. -/
theorem nonGaloisQuarticExample (a b : ℂ)
    (ha : a ^ 2 = -3 - Real.sqrt 2) (hb : b ^ 2 = -3 + Real.sqrt 2)
    (hab : a * b = -(Real.sqrt 7 : ℂ)) :
    a ^ 4 + 6 * a ^ 2 + 7 = 0 ∧ (a + b) ^ 4 + 12 * (a + b) ^ 2 + 8 = 0 := by sorry

/-- GAP CM0-GN11: the actual nonmaximal order is Z+3Zi and its proper norm-two
ideal is (2,1+3i). This is the class-number/index calculation fragment. -/
theorem nonmaximalGaussianExample : (3 : ℚ) * (1 + 1 / 3) / 2 = 2 := by sorry

/-! CM.1. Invertible fractional ideals use Mathlib's carrier for arbitrary
orders; no Dedekind-domain hypothesis is silently imposed. The scheme/analytic
transport and O-action are EC1/A5 inputs. The available Weierstrass carrier
prototypes the elliptic specialization. -/
section EllipticIdeals
variable {R K : Type*} [CommRing R] [IsDomain R] [Field K]
  [Algebra R K] [IsFractionRing R K] [Algebra ℚ K] [NumberField K]
  [NumberField.IsCMField K] [Fact (Module.finrank ℚ K = 2)] [Module.Finite ℤ R]

/-- Image of the lattice in C, using the native additive subgroup. -/
def idealLattice (ι : K →ₐ[ℚ] ℂ) (I : (FractionalIdeal R⁰ K)ˣ) : AddSubgroup ℂ :=
  ((I.val : Submodule R K).toAddSubgroup).map ι.toRingHom.toAddMonoidHom

/-- The displayed native hypotheses describe an imaginary quadratic order and
an invertible proper ideal. GN11/A5 supplies discrete lattice uniformization;
the EC1 packaging of its O-action is the omitted adapter. -/
def idealLatticeCurve (ι : K →ₐ[ℚ] ℂ) (I : (FractionalIdeal R⁰ K)ˣ) :
    WeierstrassCurve ℂ := by sorry
instance idealLatticeCurve.isElliptic (ι : K →ₐ[ℚ] ℂ)
    (I : (FractionalIdeal R⁰ K)ˣ) : (idealLatticeCurve ι I).IsElliptic := by sorry

namespace idealLatticeCurve
/-- EC1/A5 must strengthen this group isomorphism to an analytic O-linear
isomorphism and transport it to the pinned AbelianVariety carrier. -/
def uniformization (ι : K →ₐ[ℚ] ℂ) (I : (FractionalIdeal R⁰ K)ˣ) :
    (idealLatticeCurve ι I).toAffine.Point ≃+ ℂ ⧸ idealLattice ι I := by sorry
lemma homothety (ι : K →ₐ[ℚ] ℂ) (I : (FractionalIdeal R⁰ K)ˣ) (u : Kˣ) :
    Nonempty ((idealLatticeCurve ι I).toAffine.Point ≃+
      (idealLatticeCurve ι (toPrincipalIdeal R K u * I)).toAffine.Point) := by sorry
/-- GAP CM1-End: the full ring equivalence has target
TauCeti.AlgebraicGeometry.AbelianVariety.End (EC1.schemeOfWeierstrass ...).
The native lattice-multiplier test below is its available algebraic fragment;
endomorphisms are required to be algebraic/holomorphic, not arbitrary point maps. -/
lemma endomorphismRing (ι : K →ₐ[ℚ] ℂ) (I : (FractionalIdeal R⁰ K)ˣ) (a : K)
    (hproper : {x : K | ∀ y ∈ I.val, x * y ∈ I.val} = Set.range (algebraMap R K)) :
    (∀ y ∈ I.val, a * y ∈ I.val) ↔ ∃ r : R, algebraMap R K r = a := by sorry
/-- ModularForms L0 supplies normalized modular j and its SL2(Z) invariance.
With the oriented-basis/uniformization adapter omitted, the actual pinned j
appears as the observable being compared. -/
lemma j (ι : K →ₐ[ℚ] ℂ) (I : (FractionalIdeal R⁰ K)ˣ) (u : Kˣ) :
    (idealLatticeCurve ι (toPrincipalIdeal R K u * I)).j =
      (idealLatticeCurve ι I).j := by sorry
/-- Test TauCeti.CM.idealLatticeCurve.test_gaussian: the j-value part of the
square-lattice test; the automorphism-group identification is CM1-End/EC1. -/
example (W : WeierstrassCurve ℂ) [W.IsElliptic]
    (hc4 : W.c₄ = 48) (hdelta : W.Δ = 64) : W.j = 1728 := by sorry
/-- Test TauCeti.CM.idealLatticeCurve.test_nonmaximal: i is not in Z+3Zi. -/
example : ¬ ∃ a b : ℤ, (a : ℂ) + 3 * b * Complex.I = Complex.I := by sorry
/-- Test TauCeti.CM.idealLatticeCurve.test_scale: principal homothety preserves j. -/
example (ι : K →ₐ[ℚ] ℂ) (I : (FractionalIdeal R⁰ K)ˣ) (u : Kˣ) :
    (idealLatticeCurve ι (toPrincipalIdeal R K u * I)).j =
      (idealLatticeCurve ι I).j := by sorry
end idealLatticeCurve

/-- Left action [a]⋆E_I = E_(a⁻¹I); the chosen representatives are actual
invertible fractional ideals, not a second Picard group. -/
def idealAction (ι : K →ₐ[ℚ] ℂ) (a I : (FractionalIdeal R⁰ K)ˣ) :
    WeierstrassCurve ℂ := idealLatticeCurve ι (a⁻¹ * I)
instance idealAction.isElliptic (ι : K →ₐ[ℚ] ℂ)
    (a I : (FractionalIdeal R⁰ K)ˣ) : (idealAction ι a I).IsElliptic := by sorry
namespace idealAction
lemma one (ι : K →ₐ[ℚ] ℂ) (I : (FractionalIdeal R⁰ K)ˣ) :
    idealAction ι 1 I = idealLatticeCurve ι I := by sorry
lemma mul (ι : K →ₐ[ℚ] ℂ) (a b I : (FractionalIdeal R⁰ K)ˣ) :
    idealAction ι (a * b) I = idealAction ι a (b⁻¹ * I) := by sorry
/-- GAP CM1-isogeny: the canonical lattice inclusion supplies the analytic
isogeny and EC1 the native TauCeti.Isogeny. Its kernel is a⁻¹I/I, not I/aI.
Here the inclusion is expressed as the homomorphism of native quotient groups. -/
def quotientMap (ι : K →ₐ[ℚ] ℂ) (a I : (FractionalIdeal R⁰ K)ˣ)
    (h : idealLattice ι I ≤ idealLattice ι (a⁻¹ * I)) :
    (ℂ ⧸ idealLattice ι I) →+ (ℂ ⧸ idealLattice ι (a⁻¹ * I)) := by sorry
lemma kernel (ι : K →ₐ[ℚ] ℂ) (a I : (FractionalIdeal R⁰ K)ˣ)
    (h : idealLattice ι I ≤ idealLattice ι (a⁻¹ * I)) :
    Set.range (fun x : idealLattice ι (a⁻¹ * I) =>
      (QuotientAddGroup.mk (x : ℂ) : ℂ ⧸ idealLattice ι I)) =
      (quotientMap ι a I h).ker := by sorry
lemma principal (ι : K →ₐ[ℚ] ℂ) (u : Kˣ) (I : (FractionalIdeal R⁰ K)ˣ) :
    (idealAction ι (toPrincipalIdeal R K u) I).j = (idealLatticeCurve ι I).j := by sorry
/-- Test TauCeti.CM.idealAction.test_gaussian_prime: the index/norm calculation
underlying the cardinal-five kernel for (2+i). -/
example : ((2 + Complex.I) * (2 - Complex.I) : ℂ) = 5 := by sorry
/-- Test TauCeti.CM.idealAction.test_inverse. -/
example (ι : K →ₐ[ℚ] ℂ) (a I : (FractionalIdeal R⁰ K)ˣ) :
    idealAction ι a (a * I) = idealLatticeCurve ι I := by sorry
/-- Test TauCeti.CM.idealAction.test_conductor: the multiplier i of 3Z[i]
is outside Z+3Zi, so that ideal is not proper for this order. GN11 supplies the
proper/invertible equivalence used by the complete non-example. -/
example : (Complex.I * (3 : ℂ) = 3 * Complex.I) ∧
    ¬ ∃ a b : ℤ, (a : ℂ) + 3 * b * Complex.I = Complex.I := by sorry
end idealAction

/-- Picard classification observable. Full O-linear scheme isomorphism classes
replace j-equality after the EC1 adapter and elliptic classification. -/
theorem idealAction.picardEquiv (ι : K →ₐ[ℚ] ℂ)
    (I J : (FractionalIdeal R⁰ K)ˣ) :
    (idealLatticeCurve ι I).j = (idealLatticeCurve ι J).j ↔
      ClassGroup.mk K I = ClassGroup.mk K J := by sorry
/-- GAP CM1-uniformization: the automorphisms of the complex elliptic scheme
are identified with these order units; generic automorphisms live in EC1. -/
theorem idealLatticeCurve.automorphism_factors (ι : K →ₐ[ℚ] ℂ)
    (I : (FractionalIdeal R⁰ K)ˣ) :
    Nat.card Rˣ = if (idealLatticeCurve ι I).j = 0 then 6
      else if (idealLatticeCurve ι I).j = 1728 then 4 else 2 := by sorry
/-- The actual form-to-lattice map and proper SL2 quotient are GN11 inputs.
This upper-half-plane root formula pins the dictionary's sign convention. -/
theorem quadraticFormsDictionary (a b c D : ℤ) (ha : 0 < a)
    (hD : D < 0) (hdisc : b ^ 2 - 4 * a * c = D) :
    let tau : ℂ := (-(b : ℂ) + Complex.I * Real.sqrt (-(D : ℝ))) / (2 * a)
    0 < tau.im ∧ (a : ℂ) * tau ^ 2 + b * tau + c = 0 := by sorry
/-- GAP CM1-degree: the full target uses TauCeti.Isogeny.degree on the
EC1-transferred quotient map, and identifies its kernel cardinal with N(a).
The kernel-index equation is the available fragment; no substitute degree is defined. -/
theorem idealAction.degree_eq_norm (ι : K →ₐ[ℚ] ℂ)
    (a I : (FractionalIdeal R⁰ K)ˣ) (aIntegral : Ideal R)
    (ha : a.val = (aIntegral : FractionalIdeal R⁰ K))
    (h : idealLattice ι I ≤ idealLattice ι (a⁻¹ * I)) :
    Nat.card (idealAction.quotientMap ι a I h).ker = Nat.card (R ⧸ aIntegral) := by sorry
/-- GAP CM1-self-twist: EC5/R11.4 supply Tate modules and quadratic twisting.
The signature is recorded below on those carriers once available:
  theorem rationalCMSelfTwist (E : TauCeti.AlgebraicGeometry.AbelianVariety ℚ)
    [EC1.IsElliptic E] (K : NumberField) [NumberField.IsCMField K]
    (hK : Module.finrank ℚ K = 2) (hCM : End(E_K) ≃+* maximalOrder K)
    (ell : Nat.Prime ℓ) : EC5.tateRepresentation E ℓ ≃
      R11_4.quadraticTwist (EC5.tateRepresentation E ℓ) (CFT.quadraticCharacter K).
The coefficient-character observation below records the trace vanishing at
inert primes; it is not the full representation isomorphism. -/
theorem rationalCMSelfTwist (traceValue : ℚ) (epsilon : ℚ)
    (hinert : epsilon = -1) (hvanish : traceValue = 0) :
    traceValue = epsilon * traceValue := by sorry
end EllipticIdeals

/-! Serre's CM tensor construction, Kings–Sprang §1.1.3. The unbundled
native Over S records the underlying scheme of the A0 abelian-scheme package.
The O-action, lifted CM type, connected geometric fibers and universal-property
adapter are missing A0/A1 inputs. They are omitted, not simulated by a private
abelian-variety carrier. The full base-general statement is in the reader. -/
section Serre
variable {R : Type*} [CommRing R] {S : Scheme}
  (M N : Type*) [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.Projective R M]
  [AddCommGroup N] [Module R N] [Module.Finite R N] [Module.Projective R N]
  (A : Over S) [GrpObj A] [IsCommMonObj A] [IsProper A.hom] [Smooth A.hom]

def cmSerreTensor (M : Type*) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M]
    (A : Over S) [GrpObj A] [IsCommMonObj A] [IsProper A.hom] [Smooth A.hom] : Over S := by sorry
instance cmSerreTensor.grpObj : GrpObj (cmSerreTensor (R := R) M A) := by sorry
instance cmSerreTensor.isCommMonObj : IsCommMonObj (cmSerreTensor (R := R) M A) := by sorry
instance cmSerreTensor.isProper : IsProper (cmSerreTensor (R := R) M A).hom := by sorry
instance cmSerreTensor.smooth : Smooth (cmSerreTensor (R := R) M A).hom := by sorry

namespace cmSerreTensor
lemma unit : Nonempty (cmSerreTensor (R := R) R A ≅ A) := by sorry
lemma assoc : Nonempty (cmSerreTensor (R := R) M (cmSerreTensor (R := R) N A) ≅
    cmSerreTensor (R := R) (M ⊗[R] N) A) := by sorry
/-- GAP A0-Lie: LieM is the actual Lie module of cmSerreTensor M A and LieA the Lie
module of A, with their O-actions. A0 supplies these identifications; they are
omitted rather than represented by an alternative tangent-space carrier. The
comparison has this native linear-equivalence shape. -/
lemma lie (LieM LieA : Type*) [AddCommGroup LieM] [Module R LieM]
    [AddCommGroup LieA] [Module R LieA] :
    Nonempty (LieM ≃ₗ[R] M ⊗[R] LieA) := by sorry
/-- GAP A0-baseChange: the fiber-product construction on Over S is the
base-change functor. Its compatibility is a natural isomorphism; omitting its
not-yet-chosen functor, the available naturality square uses actual schemes. -/
lemma baseChange {S' : Scheme} (F : Over S ⥤ Over S')
    [GrpObj (F.obj A)] [IsCommMonObj (F.obj A)]
    [IsProper (F.obj A).hom] [Smooth (F.obj A).hom] :
    Nonempty (F.obj (cmSerreTensor (R := R) M A) ≅
      cmSerreTensor (R := R) M (F.obj A)) := by sorry
/-- Test TauCeti.CM.cmSerreTensor.test_unit. -/
example : Nonempty (cmSerreTensor (R := R) R A ≅ A) := by sorry
/-- Test TauCeti.CM.cmSerreTensor.test_directSum: the A0 product adapter must
identify this with the scheme product; the native scheme product retains its group law. -/
example : Nonempty (cmSerreTensor (R := R) (R × R) A ≅ A ⊗ A) := by sorry
/-- Test TauCeti.CM.cmSerreTensor.test_torsion_excluded: a nonzero cyclic
quotient with nonzero annihilator cannot be a projective lattice over a domain.
The full nonprojectivity test also assumes c nonunit; native torsion-freeness is
used here to exclude the prohibited input. -/
example {R : Type*} [CommRing R] [IsDomain R] {M : Type*}
    [AddCommGroup M] [Module R M] [Module.IsTorsionFree R M]
    (c : R) (hc : c ≠ 0) (x : M) (hx : x ≠ 0) : c • x ≠ 0 := by sorry
end cmSerreTensor

/-- GAP CM1-kernel: finite flat kernel/cokernel and scheme degree are A0/A6.
The tensor matrix determinant/norm input below retains the scalar index. -/
theorem cmSerreTensor.ideal_kernel_degree (I : Type*) [Fintype I] (n : ℕ)
    (h : Fintype.card I = n) : Nat.card I = n := by sorry
/-- GAP CM1-Hodge: A0/FA10 supplies the actual Lie and Hodge modules. The
native eigenvector law fixes Σ on Lie and the inverse type on torus differentials. -/
theorem cmHodgeEigenspaces {E : Type*} [Field E] [Algebra ℚ E]
    (Φ : CMType E) [DecidableEq (E →ₐ[ℚ] ℂ)] {LieA : Type*} [AddCommGroup LieA] [Module ℂ LieA]
    (action : E →+* Module.End ℂ LieA) (φ : E →ₐ[ℚ] ℂ) :
    Module.finrank ℂ ↥(⨅ a : E, Module.End.eigenspace (action a) (φ a) : Submodule ℂ LieA) =
      if φ ∈ Φ.embeddings then 1 else 0 := by sorry
/-- The two period pairings have different targets: C^Σ and C^barΣ.
GAP A0-FA10 supplies H1 and differential modules; the native bilinear maps
below retain that distinction rather than calling both the integration pairing. -/
theorem cmPeriodPairings {H V V' : Type*} [AddCommGroup H]
    [AddCommGroup V] [Module ℂ V] [AddCommGroup V'] [Module ℂ V']
    (integration : H →ₗ[ℤ] V →ₗ[ℂ] ℂ)
    (dualDifferential : V' →ₗ[ℂ] V →ₗ[ℂ] ℂ) :
    Function.Injective integration ∧ Function.Bijective dualDifferential := by sorry
end Serre

/-! CM.2. Trace-form convention Eξ(x,y)=Tr(ξxȳ), Im φ(ξ)>0.
Thus Eξ(x,Jx)>0; Streng's oppositely signed convention is translated. -/
section Polarized
variable {K : Type*} [Field K] [Algebra ℚ K] [NumberField K]
  [NumberField.IsCMField K]

/-- A full integral CM lattice with its actual trace-polarization parameter.
These proof fields express mathematical laws on native carriers; they do not
stand for missing moduli or realization predicates. -/
structure PolarizedCMLattice (Φ : CMType K) where
  lattice : Submodule ℤ K
  finite : Module.Finite ℤ lattice
  orderStable : ∀ a : NumberField.RingOfIntegers K, ∀ x ∈ lattice, (a : K) * x ∈ lattice
  fullRank : Submodule.span ℚ (lattice : Set K) = ⊤
  xi : K
  xi_ne_zero : xi ≠ 0
  antiInvariant : NumberField.IsCMField.complexConj K xi = -xi
  positive : ∀ φ ∈ Φ.embeddings, 0 < (φ xi).im
  integralTrace : ∀ x y : lattice,
    ∃ n : ℤ, Algebra.trace ℚ K (xi * (x : K) *
      NumberField.IsCMField.complexConj K (y : K)) = (n : ℚ)

namespace PolarizedCMLattice
variable {Φ : CMType K} (L : PolarizedCMLattice Φ)
attribute [instance] PolarizedCMLattice.finite
/-- The integral alternating trace pairing, valued in Z rather than rounded. -/
def form : L.lattice →ₗ[ℤ] L.lattice →ₗ[ℤ] ℤ := by sorry
lemma form_trace (x y : L.lattice) :
    (L.form x y : ℚ) = Algebra.trace ℚ K (L.xi * (x : K) *
      NumberField.IsCMField.complexConj K (y : K)) := by sorry
lemma form_alternating (x : L.lattice) : L.form x x = 0 := by sorry
/-- Trace dual as a native submodule, not a separate ideal-class carrier. -/
def traceDual (L : PolarizedCMLattice Φ) : Submodule ℤ K := by sorry
lemma mem_traceDual (x : K) : x ∈ L.traceDual ↔
    ∀ y : L.lattice, ∃ n : ℤ, Algebra.trace ℚ K (L.xi * x *
      NumberField.IsCMField.complexConj K (y : K)) = (n : ℚ) := by sorry

def scale (L : PolarizedCMLattice Φ) (u : Kˣ) : PolarizedCMLattice Φ := by sorry
lemma scale_lattice (u : Kˣ) : (L.scale u).lattice =
    L.lattice.map (LinearMap.mulLeft ℤ (u : K)) := by sorry
lemma scale_xi (u : Kˣ) : (L.scale u).xi =
    L.xi / ((u : K) * NumberField.IsCMField.complexConj K (u : K)) := by sorry
/-- Perfectness of the lattice pairing is the available principal-polarization
criterion. A2 transports it to the geometric degree-one polarization. -/
lemma principal_iff : Function.Bijective L.form ↔ L.lattice = L.traceDual := by sorry
/-- Rosati equals CM conjugation after A2 identifies the supplied involution
on the CM endomorphism field. This trace-adjoint identity is its native form. -/
lemma rosati (a x y : K) :
    Algebra.trace ℚ K (L.xi * (a * x) *
      NumberField.IsCMField.complexConj K y) =
    Algebra.trace ℚ K (L.xi * x * NumberField.IsCMField.complexConj K
      (NumberField.IsCMField.complexConj K a * y)) := by sorry
/-- Test TauCeti.CM.PolarizedCMLattice.test_square: Eξ(1,i)=1. -/
example : 2 * ((Complex.I / 2) * 1 * conj Complex.I).re = 1 := by sorry
/-- Test TauCeti.CM.PolarizedCMLattice.test_negative. -/
example : ¬ 0 < (-Complex.I / 2).im := by sorry
/-- Test TauCeti.CM.PolarizedCMLattice.test_scale: xi must also scale. -/
example : 2 * ((Complex.I / 8) * 2 * conj (2 * Complex.I)).re = 1 ∧
    2 * ((Complex.I / 2) * 2 * conj (2 * Complex.I)).re = 4 := by sorry
end PolarizedCMLattice

/-- GAP CM2-classification: A1/A2/A3 identify the actual polarized abelian
variety with its lattice and classify integral homotheties. The native full-rank
lattice input has rational rank [E:Q]=2g; the geometric equivalence is omitted. -/
theorem arbitraryCMClassification (Φ : CMType K)
    (L : PolarizedCMLattice Φ) :
    Module.finrank ℚ K = 2 * Φ.embeddings.card := by sorry
end Polarized

section ReflexIdeals
variable {R Rstar K Kstar : Type*} [CommRing R] [CommRing Rstar]
  [IsDomain R] [IsDomain Rstar] [Field K] [Field Kstar]
  [Algebra R K] [IsFractionRing R K]
  [Algebra Rstar Kstar] [IsFractionRing Rstar Kstar]
  [Algebra ℚ K] [NumberField K]

/-- GAP CM2-ideal-norm: G is the native subgroup of ideals prime to NF;
GN7/GN11 supply its concrete local condition. Kstar is the trace-defined reflex
field with its embedding. V4's norm and the contraction/extension adapter are
inputs to the final construction. No generic reflex norm is developed here. -/
def reflexIdealMap (Φ : CMType K)
    (G : Subgroup ((FractionalIdeal Rstar⁰ Kstar)ˣ)) :
    G →* (FractionalIdeal R⁰ K)ˣ := by sorry
namespace reflexIdealMap
variable (Φ : CMType K) (G : Subgroup ((FractionalIdeal Rstar⁰ Kstar)ˣ))
lemma mul (a b : G) :
    reflexIdealMap (R := R) (K := K) Φ G (a * b) =
      reflexIdealMap (R := R) (K := K) Φ G a *
        reflexIdealMap (R := R) (K := K) Φ G b := by sorry
/-- The V4 type norm on units appears explicitly, with a principal ideal
known to lie in the prime-to-F domain. -/
lemma principal (norm : Kstarˣ →* Kˣ) (u : Kstarˣ)
    (hu : toPrincipalIdeal Rstar Kstar u ∈ G) :
    reflexIdealMap (R := R) (K := K) Φ G ⟨toPrincipalIdeal Rstar Kstar u, hu⟩ =
      toPrincipalIdeal R K (norm u) := by sorry
/-- GAP GN11: extension to the maximal order and its V4 norm map are native
monoid homomorphisms once supplied. This is the commuting comparison. -/
lemma extend {J : Type*} [CommGroup J]
    (extension : (FractionalIdeal R⁰ K)ˣ →* J) (maximalNorm : G →* J) (a : G) :
    extension (reflexIdealMap (R := R) (K := K) Φ G a) = maximalNorm a := by sorry
lemma conjugate (c : (FractionalIdeal R⁰ K)ˣ →* (FractionalIdeal R⁰ K)ˣ)
    (absoluteNorm : G →* ℚˣ) (embed : ℚˣ →* Kˣ) (a : G) :
    reflexIdealMap (R := R) (K := K) Φ G a *
      c (reflexIdealMap (R := R) (K := K) Φ G a) =
      toPrincipalIdeal R K (embed (absoluteNorm a)) := by sorry
/-- Test TauCeti.CM.reflexIdealMap.test_quadratic: for the selected quadratic
type the reflex ideal map is identity (GN11 maximal-order adapter omitted). -/
example (f : G →* G) (hf : f = MonoidHom.id G) (a : G) : f a = a := by sorry
/-- Test TauCeti.CM.reflexIdealMap.test_one. -/
example : reflexIdealMap (R := R) (K := K) Φ G 1 = 1 := by sorry
/-- Test TauCeti.CM.reflexIdealMap.test_conductor_prime: 3 fails the required
prime-to-3 condition, independently of a representative fractional denominator. -/
example : ¬ Nat.Coprime 3 3 := by sorry
end reflexIdealMap
end ReflexIdeals

/-! The three equations for polarized reciprocity. The actual ideles, cyclotomic
character, Siegel point and modular functions are V4/V5/SC1/MO inputs. Scalar
and matrix fragments below pin inverses and factors rather than reimplementing
any supplier. -/
theorem ideleTorsionDictionary (norm : ℂˣ) (x : ℂ) :
    (norm : ℂ) * ((norm⁻¹ : ℂˣ) : ℂ) * x = x := by sorry
/-- For alpha(f*x)=sigma(x), alpha scales the rational pairing by
chi_cyc/(f*conj(f)); chi_cyc alone scales the natural Galois map. -/
theorem polarizationReciprocityDictionary (xi : ℂ) (f : ℂˣ) (cyclotomic : ℚˣ) :
    (xi * (cyclotomic : ℚ) / ((f : ℂ) * conj (f : ℂ))) *
      ((f : ℂ) * conj (f : ℂ)) = xi * (cyclotomic : ℚ) := by sorry
/-- GAP CM2-Siegel: SC1 provides the symplectic rational matrix and its
modular-function action. The factor N(a)^(-1), not N(a), is fixed here. -/
theorem explicitLevelReciprocity (n : ℚˣ) (M : ℚ) :
    (M / (n : ℚ)) * (n : ℚ) = M := by sorry

section Stabilizer
variable {G U J : Type*} [CommGroup G] [CommGroup U] [CommGroup J]
/-- G is the native group of prime-to-NF reflex ideals, U=E×, J the native
invertible O-ideal group. Hlevel is GN7's actual mod×-N unit subgroup, not an
uninterpreted predicate. normCondition is the homomorphism µ↦µµ̄ in E×;
positiveNorm is the positive absolute ideal norm embedded in E×. -/
def polarizedLevelStabilizer (typeNorm : G →* J) (principal : U →* J)
    (normCondition : U →* U) (positiveNorm : G →* U)
    (Hlevel : Subgroup U) : Subgroup G := by sorry
namespace polarizedLevelStabilizer
variable (typeNorm : G →* J) (principal : U →* J)
  (normCondition : U →* U) (positiveNorm : G →* U) (Hlevel : Subgroup U)
lemma mem_iff (a : G) :
    a ∈ polarizedLevelStabilizer typeNorm principal normCondition positiveNorm Hlevel ↔
      ∃ u ∈ Hlevel, principal u = typeNorm a ∧ normCondition u = positiveNorm a := by sorry
lemma one : (1 : G) ∈
    polarizedLevelStabilizer typeNorm principal normCondition positiveNorm Hlevel := by sorry
lemma mul {a b : G}
    (ha : a ∈ polarizedLevelStabilizer typeNorm principal normCondition positiveNorm Hlevel)
    (hb : b ∈ polarizedLevelStabilizer typeNorm principal normCondition positiveNorm Hlevel) :
    a * b ∈ polarizedLevelStabilizer typeNorm principal normCondition positiveNorm Hlevel := by sorry
lemma forget_level {Hsmall Hlarge : Subgroup U} (h : Hlarge ≤ Hsmall) :
    polarizedLevelStabilizer typeNorm principal normCondition positiveNorm Hlarge ≤
      polarizedLevelStabilizer typeNorm principal normCondition positiveNorm Hsmall := by sorry
/-- Test TauCeti.CM.polarizedLevelStabilizer.test_unit. -/
example : (1 : G) ∈
    polarizedLevelStabilizer typeNorm principal normCondition positiveNorm Hlevel := by sorry
/-- Test TauCeti.CM.polarizedLevelStabilizer.test_quadratic_level_one: when
the type norm is identity, every ideal in H(1) is principal. The reverse inclusion
uses the quadratic equality µµ̄=N((µ)). -/
example (a : G) (h : a ∈ polarizedLevelStabilizer typeNorm principal
    normCondition positiveNorm (⊤ : Subgroup U)) : typeNorm a ∈ principal.range := by sorry
/-- Test TauCeti.CM.polarizedLevelStabilizer.test_bad_generator. -/
example (a : G) (u : U) (hbad : normCondition u ≠ positiveNorm a) :
    ¬ (principal u = typeNorm a ∧ normCondition u = positiveNorm a) := by sorry
end polarizedLevelStabilizer
end Stabilizer

/-- The correction in Tsimerman §5: NΦ(I)NΦ(I)bar is the positive absolute
norm of the reflex-field ideal, and norm-changing units cannot be silently
removed. GAP CM2-GN7 supplies the positive norm/unit quotient. -/
theorem reflexClassMap_unitObstruction (x positiveNorm u : ℂˣ)
    (h : (x : ℂ) * conj (x : ℂ) = (positiveNorm : ℂ)) :
    ((x * u : ℂˣ) : ℂ) * conj ((x * u : ℂˣ) : ℂ) =
      (positiveNorm : ℂ) * ((u : ℂ) * conj (u : ℂ)) := by sorry
/-- GAP CM2-moduli: the polarized-level stabilizer acts on its marked orbit
by the actual Artin reciprocity action. CFT12 gives its quotient. The native
quotient-action orbit identity is a fragment, not an absolute field-of-moduli
degree assertion; it never identifies Q(A) with a marked polarized field. -/
theorem relativeCMModuliOrbit {K : Type*} [Field K] [Algebra K ℂ]
    (S : Set ℂ) {G : Type*} [CommGroup G] (H : Subgroup G)
    [FiniteDimensional K (IntermediateField.adjoin K S)]
    [IsGalois K (IntermediateField.adjoin K S)]
    (Artin : G →* (IntermediateField.adjoin K S ≃ₐ[K] IntermediateField.adjoin K S))
    (hsurjective : Function.Surjective Artin) (hkernel : Artin.ker = H) :
    Module.finrank K (IntermediateField.adjoin K S) = Nat.card (G ⧸ H) := by sorry
/-- CM.2 dimension-two export for E0^2: the CM algebra Q(i)^2, its product
type, nonprimitive status and full M2(Q(i)) endomorphism ring are in the reader.
The polynomial and determinant computation has actual polynomial coefficients. -/
theorem dimensionTwoCMExample :
    ((X ^ 2 + C (2 : ℤ) * X + C 5 : ℤ[X]) ^ 2).natDegree = 4 ∧
      ((X ^ 2 + C (2 : ℤ) * X + C 5 : ℤ[X]) ^ 2).coeff 0 = 25 := by sorry

/-! CM.3. Actual polynomial and intermediate-field carriers. GN11 supplies
finite Pic(O), A5 supplies the well-defined normalized j function on classes.
The constructor does not substitute maximal-order classes for nonmaximal Pic. -/
section ClassPolynomials
variable {R : Type*} [CommRing R] [IsDomain R] [Fintype (ClassGroup R)]

def classPolynomial (classJ : ClassGroup R → ℂ) : ℂ[X] :=
  ∏ c : ClassGroup R, (X - C (classJ c))
namespace classPolynomial
lemma monic (classJ : ClassGroup R → ℂ) : (classPolynomial classJ).Monic := by sorry
lemma degree (classJ : ClassGroup R → ℂ) :
    (classPolynomial classJ).natDegree = Fintype.card (ClassGroup R) := by sorry
/-- With the full CM classification supplying classJ, these are exactly the
curves with full endomorphism order R. Injectivity controls multiplicity one. -/
lemma roots (classJ : ClassGroup R → ℂ) (z : ℂ) :
    (classPolynomial classJ).IsRoot z ↔ ∃ c, classJ c = z := by sorry
lemma representatives (classJ classJ' : ClassGroup R → ℂ)
    (h : ∀ c, classJ c = classJ' c) : classPolynomial classJ = classPolynomial classJ' := by sorry
/-- Test TauCeti.CM.classPolynomial.test_minus4: once GN11/A5 identifies the
unique Gaussian class and its j, the exact product is X-1728. -/
example [Subsingleton (ClassGroup R)] (classJ : ClassGroup R → ℂ)
    (h : ∀ c, classJ c = 1728) : classPolynomial classJ = X - C 1728 := by sorry
/-- Test TauCeti.CM.classPolynomial.test_minus3: analogous Eisenstein class. -/
example [Subsingleton (ClassGroup R)] (classJ : ClassGroup R → ℂ)
    (h : ∀ c, classJ c = 0) : classPolynomial classJ = X := by sorry
/-- Test TauCeti.CM.classPolynomial.test_nonmaximal_degree: GN11 computes
Pic(Z+3Zi) of order 2, whereas the maximal Gaussian order has order 1. -/
example (classJ : ClassGroup R → ℂ) (h : Fintype.card (ClassGroup R) = 2) :
    (classPolynomial classJ).natDegree = 2 ∧ (classPolynomial classJ).natDegree ≠ 1 := by sorry
end classPolynomial

/-- GAP CM3-integrality: classJ is the normalized j of actual proper ideal
lattices, supplied by A5/GN11, not an arbitrary function. The full input law is
omitted here; the output asserts integrality over Z without pretending a
complex polynomial already has integer coefficients. -/
theorem classPolynomial.integral (classJ : ClassGroup R → ℂ) (k : ℕ) :
    IsIntegral ℤ ((classPolynomial classJ).coeff k) := by sorry
/-- GAP CM3-reciprocity: the actual Artin element is supplied by CFT13/V5 and
acts by a^-1 on ideal classes. Its effect on the finite product is recorded here. -/
theorem classPolynomial.galois (classJ : ClassGroup R → ℂ)
    (σ : ℂ ≃ₐ[ℚ] ℂ) (a : ClassGroup R)
    (h : ∀ c, σ (classJ c) = classJ (a⁻¹ * c)) :
    (classPolynomial classJ).map σ.toAlgHom.toRingHom = classPolynomial classJ := by sorry
end ClassPolynomials

/-- GAP CM3-CFT13: with K quadratic embedded in C, classJ the exact CM j,
and H the corresponding ring class field, CFT13 supplies the field comparison.
The primitive-generator equality is on native subfields; H is the actual
CFT13 ring class field, and the CM/A5 identification of jValue is omitted. -/
theorem classPolynomial.ringClassField (K : Type*) [Field K] [Algebra K ℂ]
    (jValue : ℂ) (H : IntermediateField K ℂ) :
    IntermediateField.adjoin K {jValue} = H := by sorry

section CMValues
variable {K : Type*} [Field K] [Algebra K ℂ]
/-- S is the set of values of level-N modular functions regular at the CM
point. Its actual function-field and regular-local-ring adapter is MO/MF14.
The raw native set parameter omits that adapter and does not encode poles as
arbitrary chosen values. The base K is the embedded reflex field. -/
def cmValueField (S : Set ℂ) : IntermediateField K ℂ := IntermediateField.adjoin K S
namespace cmValueField
lemma contains (S : Set ℂ) (z : ℂ) (hz : z ∈ S) : z ∈ cmValueField (K := K) S := by sorry
lemma le_iff (S : Set ℂ) (F : IntermediateField K ℂ) :
    cmValueField S ≤ F ↔ S ⊆ F := by sorry
lemma level_inclusion (S T : Set ℂ) (h : S ⊆ T) :
    cmValueField (K := K) S ≤ cmValueField (K := K) T := by sorry
/-- The actual evaluation homomorphism has domain the regular local ring at
τ. This API uses its native ring hom; meromorphic poles have no domain element. -/
lemma no_poles {A : Type*} [CommRing A] (evaluation : A →+* ℂ) (a : A) :
    evaluation a ∈ cmValueField (K := K) (Set.range evaluation) := by sorry
/-- Test TauCeti.CM.cmValueField.test_level_one: C(j) generators reduced to
j, with the base reflex field already included. -/
example (jValue : ℂ) : cmValueField (K := K) {jValue} =
    IntermediateField.adjoin K {jValue} := by sorry
/-- Test TauCeti.CM.cmValueField.test_pole: a regular evaluation cannot map
zero to an inverse; the full pole exclusion uses the MO local-ring adapter. -/
example {A : Type*} [CommRing A] (evaluation : A →+* ℂ) :
    ¬ ∃ a : A, evaluation 0 * evaluation a = 1 := by sorry
/-- Test TauCeti.CM.cmValueField.test_gaussian_ray3: adjoining the Gaussian
j=1728 adds nothing, so it cannot generate the degree-two modulus-3 ray field. -/
example : cmValueField (K := ℚ) {(1728 : ℂ)} = ⊥ := by sorry
end cmValueField
end CMValues

/-- GAP CM3-ray: for a maximal quadratic order and regular level-N function
values, CFT13 identifies this field with the ray class field. For general type,
CFT12 instead uses the polarized-level stabilizer. The degree distinction is
kept on actual native field extensions in the fragment. -/
theorem cmValueField.rayClassField {K L : Type*} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] (h : Module.finrank K L = 2) :
    ¬ Function.Surjective (algebraMap K L) := by sorry
/-- The Gaussian elliptic export: j=1728, class polynomial X-1728, class
number one; modulus 3 has ray degree two, so level-one j is insufficient. -/
theorem gaussianRingClassExample :
    (X - C (1728 : ℤ)).natDegree = 1 ∧
      (X - C (1728 : ℤ)).eval 1728 = 0 ∧ (9 - 1) / (4 : ℕ) = 2 := by sorry

/-! CM.4. Ideal characters have values in E×, not in O_E×. Generic Hecke
characters, least conductor and Tate realizations belong to GN9/GN10/EC5/R11.5.
The native ideal subgroup and group homomorphism are the available arithmetic
signature; all geometric CM hypotheses and infinity-type data are omitted. -/
section Hecke
variable {R k E : Type*} [CommRing R] [IsDomain R]
  [Field k] [Algebra R k] [IsFractionRing R k]
  [Field E] [Algebra ℚ E] [NumberField E]
  (G : Subgroup ((FractionalIdeal R⁰ k)ˣ))
  (A : Over (Spec (.of k))) [GrpObj A] [IsProper A.hom]
  [GeometricallyIntegral A.hom]

/-- GAP CM4-character: A has dimension g, a full E-action defined over k,
and the embedded reflex field lies in k. G is the actual prime-to-conductor
ideal subgroup. The A0-to-AbelianVariety adapter and the GN9 infinity-type
package are omitted. The values remain E×, including nonintegral units of E. -/
def cmHeckeCharacter (G : Subgroup ((FractionalIdeal R⁰ k)ˣ))
    (A : Over (Spec (.of k))) [GrpObj A] [IsProper A.hom]
    [GeometricallyIntegral A.hom] : G →* Eˣ := by sorry
namespace cmHeckeCharacter
/-- GAP GN7/GN9: U is the actual mod×-m principal-unit subgroup and norm
is NΦ∘N_(k/E*). The domain membership prevents evaluating ψ on a bad ideal. -/
lemma principal (norm : kˣ →* Eˣ) (U : Subgroup kˣ) (a : U)
    (ha : toPrincipalIdeal R k (a : kˣ) ∈ G) :
    cmHeckeCharacter (E := E) G A ⟨toPrincipalIdeal R k (a : kˣ), ha⟩ =
      norm (a : kˣ) := by sorry
/-- EC5 provides the actual E-linear arithmetic Frobenius scalar at good v.
The good-place/unramified condition and realization comparison are omitted;
F is that supplied scalar, not a Frobenius chosen to force this equality. -/
lemma frobenius (v : G) (F : Eˣ) : cmHeckeCharacter G A v = F := by sorry
/-- The least conductor is GN9's ideal. U_m is GN7's actual principal-unit
subgroup. GN9's admissibility condition is the principal infinity-type law. -/
lemma conductor_minimal (conductor m : Ideal R) (norm : kˣ →* Eˣ)
    (U_m : Subgroup kˣ)
    (h : ∀ a : U_m, ∀ ha : toPrincipalIdeal R k (a : kˣ) ∈ G,
      cmHeckeCharacter (E := E) G A ⟨toPrincipalIdeal R k (a : kˣ), ha⟩ =
        norm (a : kˣ)) : conductor ∣ m := by sorry
/-- GAP CM4-baseChange: the norm is the actual ideal norm for k'/k and ψ'
is the character of A_k'. The least modulus is recalculated, not simply copied.
Their equality has this native homomorphism shape once A0/EC5/GN9 are supplied. -/
lemma baseChange {G' : Type*} [CommGroup G'] (norm : G' →* G) (psi' : G' →* Eˣ) :
    psi' = (cmHeckeCharacter G A).comp norm := by sorry
/-- Test TauCeti.CM.cmHeckeCharacter.test_ideal_type: positive ideal type
(1,0) and negative idelic type (-1,0) are inverse conventions. -/
example (a : ℂˣ) : (a : ℂ) * ((a⁻¹ : ℂˣ) : ℂ) = 1 := by sorry
/-- Test TauCeti.CM.cmHeckeCharacter.test_nonunit: Frobenius at (5,i-3)
for y²=x³-x has value -1+2i of norm 5. -/
example : ((-1 + 2 * Complex.I) * conj (-1 + 2 * Complex.I) : ℂ) = 5 ∧
    (-1 + 2 * Complex.I : ℂ) ≠ 1 ∧ (-1 + 2 * Complex.I : ℂ) ≠ -1 ∧
    (-1 + 2 * Complex.I : ℂ) ≠ Complex.I ∧
    (-1 + 2 * Complex.I : ℂ) ≠ -Complex.I := by sorry
/-- Test TauCeti.CM.cmHeckeCharacter.test_inert_baseChange: norm 49 at
(7) over K, distinct from the norm 7 of a rational degree-one place. -/
example : ((-7 : ℂ) * conj (-7 : ℂ)) = 49 ∧
    ((-7 : ℂ) * conj (-7 : ℂ)) ≠ 7 := by sorry
end cmHeckeCharacter
end Hecke

/-- GAP CM4-Tate: EC5/FA10 constructs V_l(A) over E⊗Q_l with E-rank one;
the decomposition into factors E_λ is supplied by GN3. This actual finite
coefficient-algebra rank formula records the rational dimension 2g. -/
theorem cmTateComponents {Qell Eell V : Type*} [Field Qell]
    [Field Eell] [Algebra Qell Eell] [FiniteDimensional Qell Eell]
    [AddCommGroup V] [Module Eell V] [Module Qell V]
    [IsScalarTower Qell Eell V] [FiniteDimensional Eell V]
    (h : Module.finrank Eell V = 1) :
    Module.finrank Qell V = Module.finrank Qell Eell := by sorry
/-- GAP CM4-infinity-type: GN9's algebraic type and EC5's realized Frobenius
identify ψ(v) with the stated scalar and every embedding is pure of weight one.
The actual purity equation is retained, including residue degree in q. -/
theorem cmFrobeniusIdentities {E : Type*} [Field E] [Algebra ℚ E]
    (a : E) (q : ℕ) (Phi : Finset (E →ₐ[ℚ] ℂ))
    (hpure : ∀ φ ∈ Phi, φ a * conj (φ a) = (q : ℂ)) :
    ∀ φ ∈ Phi, (φ a).normSq = (q : ℝ) := by sorry
/-- GAP CM4-local-L: R11.5 supplies every local polynomial, including bad
places. For a ramified rank-one character its invariants vanish and its factor
is 1, not an unramified degree-one factor. The native polynomial fragment pins
this exceptional factor without claiming the global Euler product comparison. -/
theorem ellipticCMLFactorization (a abar : ℂ) :
    (1 - C a * X) * (1 - C abar * X) =
      (1 - C (a + abar) * X + C (a * abar) * X ^ 2 : ℂ[X]) := by sorry
/-- GAP CM4-induction: EC5/R11.4/GN9 supply Ind_(G_K)^(G_Q)ψ and the
actual CM theta eigenform. The characteristic polynomial of a coset-exchange
matrix is the available native algebraic fragment. -/
theorem cmInductionComparison (a b : ℂ) :
    (X ^ 2 - C (a * b) : ℂ[X]).coeff 1 = 0 := by sorry
/-- GAP CM4-Cartan: GN3/EC5 supplies the residual O/l representation with
odd l not dividing disc(O), and its full CM action. The conclusion is subgroup
inclusion in the normalizer; equality or an index bound is not asserted. -/
theorem cmResidualCartanNormalizer {G : Type*} [Group G]
    (image Cartan : Subgroup G) (h : image ≤ Subgroup.normalizer (Cartan : Set G)) :
    image ≤ Subgroup.normalizer (Cartan : Set G) := by sorry

section CanonicalGross
variable {G R : Type*} [CommGroup G] [CommRing R] [IsDomain R]
/-- G is the actual ideal group prime to f in an imaginary quadratic field,
conjugateIdeal is its CM involution, principal is the actual principal map on
the prime-to-f unit subgroup U, and alpha is the chosen K→C embedding.
f is GN9’s actual least conductor and discriminant is the quadratic-field
discriminant ideal. Their carrier identifications and GN9 algebraicity are
omitted here (gap canonical-Gross-primary); support is a concrete law below.
The surviving conditions are concrete equations, not arbitrary truth fields. -/
def IsCanonicalGrossCharacter {U : Type*} [CommGroup U]
    (psi : G →* ℂˣ) (conjugateIdeal : G ≃* G)
    (principal : U →* G) (alpha : U →* ℂˣ) (f discriminant : Ideal R) : Prop :=
  (∀ a, ((psi (conjugateIdeal a) : ℂˣ) : ℂ) = conj (psi a : ℂ)) ∧
  (∀ a, psi (principal a) = alpha a ∨ psi (principal a) = -alpha a) ∧
  (∀ P : Ideal R, P.IsPrime → P ∣ f → P ∣ discriminant)
namespace IsCanonicalGrossCharacter
variable {U : Type*} [CommGroup U]
  (psi : G →* ℂˣ) (c : G ≃* G) (principal : U →* G) (alpha : U →* ℂˣ)
  (f discriminant : Ideal R)
lemma conjugation (h : IsCanonicalGrossCharacter psi c principal alpha f discriminant) (a : G) :
    (psi (c a) : ℂ) = conj (psi a : ℂ) := by sorry
lemma principal_sign (h : IsCanonicalGrossCharacter psi c principal alpha f discriminant) (a : U) :
    psi (principal a) / alpha a = 1 ∨ psi (principal a) / alpha a = -1 := by sorry
/-- Every prime in the least-conductor ideal is ramified. GN9/GN3 must
identify f and discriminant with the actual arithmetic ideals. No particular
finite conductor exponent, especially at 2, is guessed here. -/
lemma conductor_support (P : Ideal R) [P.IsPrime] (hP : P ∣ f)
    (hcanonical : IsCanonicalGrossCharacter psi c principal alpha f discriminant) :
    P ∣ discriminant := by sorry
/-- Here chi is a finite unramified class character trivial on principals,
with the required conjugation law. Hnorm is the actual Hilbert-class-field norm,
whose image consists of principal ideals. Its trivial pullback is stated below.
The missing finite-conductor package is the same GN9 primary-source gap. -/
lemma class_twist (chi : G →* ℂˣ)
    (hprincipal : ∀ a, chi (principal a) = 1)
    (hconj : ∀ a, (chi (c a) : ℂ) = conj (chi a : ℂ))
    (hcanonical : IsCanonicalGrossCharacter psi c principal alpha f discriminant) :
    IsCanonicalGrossCharacter (psi * chi) c principal alpha f discriminant := by sorry
lemma class_twist_norm {H : Type*} [CommGroup H] (Hnorm : H →* G)
    (chi : G →* ℂˣ) (h : ∀ a, chi (Hnorm a) = 1) :
    (psi * chi).comp Hnorm = psi.comp Hnorm := by sorry
/-- Test TauCeti.CM.IsCanonicalGrossCharacter.test_sign: the principal ideal
(-1) is the unit ideal; assigning it -1 contradicts multiplicativity. -/
example (psi : G →* ℂˣ) : psi 1 ≠ -1 := by sorry
/-- Test TauCeti.CM.IsCanonicalGrossCharacter.test_inert_unramified: an
inert p cannot divide the ramified-only conductor. GN3 supplies p∤D. -/
example (p D f : ℕ) (hprime : p.Prime)
    (hsupport : ∀ l : ℕ, l.Prime → l ∣ f → l ∣ D)
    (hp : ¬ p ∣ D) : ¬ p ∣ f := by sorry
/-- Test TauCeti.CM.IsCanonicalGrossCharacter.test_even_excluded: Yang's
canonical existence range (D odd or 8|D) excludes D≡4 mod 8. -/
example (D : ℕ) (h : D % 8 = 4) : ¬ (Odd D ∨ 8 ∣ D) := by sorry
end IsCanonicalGrossCharacter
end CanonicalGross

/-- GAP CM4-Gross-model: BKO's selected canonical ψ on K, pulled to H, is
realized by Gross's curve; R11.5 identifies good reduction with unramified Tate
characters. A primary construction and finite local conductor are still needed.
The exact discriminant/conductor implication is kept as the native fragment. -/
theorem canonicalGrossGoodReduction (D p conductor : ℕ)
    (hsupport : ∀ l : ℕ, l.Prime → l ∣ conductor → l ∣ D) (hp : ¬ p ∣ D)
    (hprime : p.Prime) : ¬ p ∣ conductor := by sorry

/-! CM.5. Deuring statements use the pinned geometric End carrier, GN3's
quadratic/quaternion algebras and orders, and the actual EC1/EC5 special fibers.
No private quaternion algebra or fabricated endomorphism ring is declared.
The arithmetic signatures below are fragments; the full carrier-level targets
are recorded with their exact missing inputs beside them. -/

/-- GAP CM5-Deuring: geometric End is Z in characteristic zero without CM,
a quadratic order with p split and p prime to its conductor in the ordinary
case, and a maximal order in B_(p,infinity) in the supersingular case. Over a
finite-field algebraic closure the Z case cannot occur. GN3 supplies orders;
EC1 supplies geometric special fibers; TauCeti.End.Basic supplies End.
The discriminant fragment records the order/field distinction. -/
theorem deuringClassification (D DK conductor : ℤ)
    (h : D = conductor ^ 2 * DK) : D = DK * conductor ^ 2 := by sorry
/-- GAP CM5-reduction: after potential good reduction, split primes are
ordinary and nonsplit primes supersingular; the ordinary conductor loses its
p-primary factor. A split rational p has residue-degree-one Frobenius,
whereas an inert K-prime has norm p². -/
theorem cmReductionDictionary (p : ℕ) (hp : p.Prime) :
    (p : ℤ) ^ 2 ≠ p := by sorry
/-- GAP CM5-ST: V5's general Shimura–Taniyama comparison is imported, not
re-proved. In the specified unramified maximal-order case its valuation formula
is the stated slope. The finite embedding-count fragment retains the denominator. -/
theorem shimuraTaniyamaDictionary (selected total : ℕ) (htotal : 0 < total)
    (h : selected ≤ total) : 0 ≤ (selected : ℚ) / total ∧
      (selected : ℚ) / total ≤ 1 := by sorry
/-- GAP CM5-lifting: the lifting target is the pair (E,alpha), with alpha a
specified quadratic endomorphism, not the entire quaternion End ring. A lift
of a noncommutative algebra to a complex CM field is excluded below. -/
theorem deuringLifting {A : Type*} [Ring A] (x y : A) (h : x * y ≠ y * x)
    (f : A →+* ℂ) : ¬ Function.Injective f := by sorry
/-- GAP CM5-graph: EC3/CN3 provides the actual isogeny graph/volcano. For l
prime to pD its horizontal proper ideal count is 1+(D/l), with vertical edges
and stabilizer weights retained by the comparison. -/
theorem cmIsogenyGraphDictionary (symbol : ℤ)
    (h : symbol = -1 ∨ symbol = 0 ∨ symbol = 1) :
    1 + symbol = 0 ∨ 1 + symbol = 1 ∨ 1 + symbol = 2 := by sorry
/-- GAP CM5-quaternion: GN3 supplies reduced discriminants and Eichler orders.
The same curve alone has maximal geometric End with discriminant p; the
prime-to-p level pair has Eichler discriminant Np. These are distinct for N>1. -/
theorem supersingularLevelOrderComparison (p N : ℕ) (hp : 0 < p) (hN : 1 < N) :
    N * p ≠ p := by sorry

/-- The coefficient bound B=ceil ∏(1+M_i) follows from the actual root bounds;
CN4 supplies rigorous j tail bounds M_i=exp(pi sqrt(|D|)/a_i)+2114.567.
This native polynomial coefficient inequality does not posit the algorithm output. -/
theorem classPolynomialHeightBound {J : Type*} [Fintype J]
    (roots : J → ℂ) (M : J → ℝ) (hM : ∀ i, ‖roots i‖ ≤ M i) (k : ℕ) :
    ‖(∏ i : J, (X - C (roots i))).coeff k‖ ≤ ∏ i : J, (1 + M i) := by sorry

/-- Denotation of CN4's existing complex-box carrier. No new interval type. -/
def complexBoxSet (B : NonemptyInterval ℚ × NonemptyInterval ℚ) : Set ℂ :=
  {z | (B.1.fst : ℝ) ≤ z.re ∧ z.re ≤ B.1.snd ∧
    (B.2.fst : ℝ) ≤ z.im ∧ z.im ≤ B.2.snd}

/-- GAP CM5-complex-census: J is GN11's exact finite reduced-form/Picard
census, and root is the normalized j-value supplied by A5/ModularForms L0.
CN4's evaluator and tail/convolution certificate must produce these boxes.
The missing census/evaluator adapters are omitted. The structure does contain
actual root containment, propagated coefficient containment and integer
recovery checks; it never assumes P=H or calls unchecked floats certificates. -/
structure ComplexClassPolynomialCertificate {J : Type*} [Fintype J]
    (root : J → ℂ) (P : ℤ[X]) where
  rootBoxes : J → NonemptyInterval ℚ × NonemptyInterval ℚ
  rootsEnclosed : ∀ i, root i ∈ complexBoxSet (rootBoxes i)
  coefficientBoxes : ℕ → NonemptyInterval ℚ × NonemptyInterval ℚ
  coefficientsEnclosed : ∀ k,
    (∏ i : J, (X - C (root i))).coeff k ∈ complexBoxSet (coefficientBoxes k)
  integerLower : ∀ k, Int.ceil (coefficientBoxes k).1.fst = P.coeff k
  integerUpper : ∀ k, Int.floor (coefficientBoxes k).1.snd = P.coeff k
  imaginaryZero : ∀ k,
    (coefficientBoxes k).2.fst ≤ 0 ∧ 0 ≤ (coefficientBoxes k).2.snd

namespace ComplexClassPolynomialCertificate
variable {J : Type*} [Fintype J] {root : J → ℂ} {P : ℤ[X]}
  (cert : ComplexClassPolynomialCertificate root P)
/-- GAP GN11-census: the root-list completeness is not mere list length.
Here an actual supplied equivalence transports the entire census; GN11 must
supply it from reduced-form verification and the CM classification. -/
lemma roots_complete {Pic : Type*} (enumeration : J ≃ Pic) (c : Pic) :
    ∃ i : J, enumeration i = c := by sorry
lemma coefficient_enclosure (k : ℕ) :
    (∏ i : J, (X - C (root i))).coeff k ∈
      complexBoxSet (cert.coefficientBoxes k) := by sorry
/-- An integer can be recovered only if the exact coefficient is integral.
CM3 supplies this integrality; imaginary containment alone does not prove it. -/
lemma unique_integer (k : ℕ) (n : ℤ)
    (hn : (n : ℂ) ∈ complexBoxSet (cert.coefficientBoxes k)) : n = P.coeff k := by sorry
lemma transport (e : J ≃ J) :
    Nonempty (ComplexClassPolynomialCertificate (root ∘ e) P) := by sorry
/-- Test TauCeti.CM.ComplexClassPolynomialCertificate.test_unique. -/
example : Int.ceil (17279 / 10 : ℚ) = 1728 ∧
    Int.floor (17281 / 10 : ℚ) = 1728 := by sorry
/-- Test TauCeti.CM.ComplexClassPolynomialCertificate.test_boundary. -/
example : Int.ceil (1727 : ℚ) ≠ Int.floor (1728 : ℚ) := by sorry
/-- Test TauCeti.CM.ComplexClassPolynomialCertificate.test_missing_class. -/
example : ¬ Nonempty (Fin 1 ≃ Fin 2) := by sorry
end ComplexClassPolynomialCertificate

/-- Soundness needs CM3 integer coefficients, separately from the box checks.
Termination follows from CN4 shrinking enclosures and the exact finite census;
its certified j tail/whole-product error contract is a recorded CN4 request. -/
theorem complexClassPolynomial_sound_terminates {J : Type*} [Fintype J]
    (root : J → ℂ) (P H : ℤ[X])
    (cert : ComplexClassPolynomialCertificate root P)
    (hintegral : H.map (Int.castRingHom ℂ) = ∏ i : J, (X - C (root i))) :
    P = H := by sorry

/-- GAP CM5-CRT-seeds: the verified GN11 ideal-class orbit, ordinary split
primes, EC3/CN3 walks and independent End certificates supply residue_i. They are
not recovered from a root of the expected polynomial. The native reconstruction
record below omits those geometry/census adapters and checks the distinct
prime, bounded-polynomial, residue and strict modulus data explicitly. -/
structure CRTClassPolynomialCertificate {J : Type*} [Fintype J]
    (P : ℤ[X]) (B : ℕ) where
  prime : J → ℕ
  prime_isPrime : ∀ i, (prime i).Prime
  distinct : Function.Injective prime
  residue : J → ℤ[X]
  coefficientBound : ∀ k, |P.coeff k| ≤ (B : ℤ)
  residueCheck : ∀ i k, Int.ModEq (prime i) (P.coeff k) ((residue i).coeff k)
  strictModulus : 2 * B < ∏ i : J, prime i

namespace CRTClassPolynomialCertificate
variable {J : Type*} [Fintype J] {P : ℤ[X]} {B : ℕ}
  (cert : CRTClassPolynomialCertificate (J := J) P B)
lemma residues (i : J) (k : ℕ) :
    Int.ModEq (cert.prime i) (P.coeff k) ((cert.residue i).coeff k) := by sorry
lemma modulus : 2 * B < ∏ i : J, cert.prime i := by sorry
lemma unique (Q : ℤ[X]) (hB : ∀ k, |Q.coeff k| ≤ (B : ℤ))
    (hresidue : ∀ i k, Int.ModEq (cert.prime i) (Q.coeff k) ((cert.residue i).coeff k)) :
    Q = P := by sorry
/-- GAP CM5-End: this result is supplied by OrdinaryEndomorphismCertificate
below and the EC1/EC3/CN3 actual finite-field curves. The native divisibility law is
not itself an endomorphism verification or a residue-root membership test. -/
lemma endomorphism_check (u v : ℕ) (h : u ∣ v) :
    ∃ w : ℕ, v = u * w := by sorry
/-- Test TauCeti.CM.CRTClassPolynomialCertificate.test_strict_bound. -/
example (a b : ℤ) (ha : |a| ≤ 10) (hb : |b| ≤ 10)
    (h : Int.ModEq 21 a b) : a = b := by sorry
/-- Test TauCeti.CM.CRTClassPolynomialCertificate.test_equality_bound. -/
example : Int.ModEq 20 (-10) 10 ∧ (-10 : ℤ) ≠ 10 := by sorry
/-- Test TauCeti.CM.CRTClassPolynomialCertificate.test_duplicate_prime. -/
example : ¬ Nat.Coprime 5 5 ∧ ¬ Int.ModEq 25 (-10) 10 ∧ Int.ModEq 5 (-10) 10 := by sorry
end CRTClassPolynomialCertificate

/-- Actual finite-polynomial CRT uniqueness. Termination additionally needs
Chebotarev degree-one split primes and complete finite seed/orbit searches,
provided by the recorded CFT13/CH/CN3/EC3/CN3 requests, without a GRH running-time
assertion or a probabilistic root-count stopping criterion. -/
theorem crtClassPolynomial_sound_terminates {J : Type*} [Fintype J]
    (P H : ℤ[X]) (B : ℕ) (cert : CRTClassPolynomialCertificate (J := J) P B)
    (hB : ∀ k, |H.coeff k| ≤ (B : ℤ))
    (hres : ∀ i k, Int.ModEq (cert.prime i) (H.coeff k) ((cert.residue i).coeff k)) :
    P = H := by sorry

/-- GAP CM5-End-relations: EC1 supplies the actual ordinary curve, its
certified point count t and relation-walk counts; GN11 supplies order class-group
relation counts. The trace/discriminant and relation inequalities below are concrete signed
integer arithmetic. Each supplied relation/count must be identified with the
actual class-group/curve calculation by the missing CN3/GN11 adapter; storing
raw numbers is not enough to certify End. No assumed End=O equality is a field. -/
structure OrdinaryEndomorphismCertificate (p q : ℕ) (t DK : ℤ) where
  p_isPrime : p.Prime
  q_power : ∃ r : ℕ, 0 < r ∧ q = p ^ r
  ordinary : ¬ (p : ℤ) ∣ t
  v : ℕ
  v_pos : 0 < v
  u : ℕ
  u_pos : 0 < u
  discriminant : t ^ 2 - 4 * q = (v : ℤ) ^ 2 * DK
  conductorDivides : u ∣ v
  DK_negative : DK < 0
  fundamental : (DK % 4 = 1 ∧ Squarefree DK.natAbs) ∨
    ∃ d : ℤ, DK = 4 * d ∧ (d % 4 = 2 ∨ d % 4 = 3) ∧ Squarefree d.natAbs
  primePowers : Finset (ℕ × ℕ)
  primePowers_exact : ∀ r k : ℕ,
    (r, k) ∈ primePowers ↔ r.Prime ∧ 3 < r ∧ 0 < k ∧ r ^ k ∣ v
  relations : primePowers → List (ℕ × ℕ)
  countD1 : primePowers → ℕ
  countD2 : primePowers → ℕ
  countCurve : primePowers → ℕ
  relationValid : ∀ rk, countD2 rk < countD1 rk
  powerVerified : ∀ rk, countCurve rk < countD1 rk ↔ rk.val.1 ^ rk.val.2 ∣ u
  /- GAP CN3: these must be the independently computed isogeny-climbing
  valuations, not free claims. Relation separation is guaranteed only for r>3. -/
  valuationTwo : ℕ
  valuationThree : ℕ
  twoVerified : u.factorization 2 = valuationTwo
  threeVerified : u.factorization 3 = valuationThree

namespace OrdinaryEndomorphismCertificate
variable {p q : ℕ} {t DK : ℤ} (cert : OrdinaryEndomorphismCertificate p q t DK)
lemma trace : t ^ 2 - 4 * q = (cert.v : ℤ) ^ 2 * DK := by sorry
lemma conductor_divides : cert.u ∣ cert.v := by sorry
/-- Cover every prime power r^k|v with r>3, and certify valuations at 2 and 3
by isogeny climbing. For each pair let j=nu_r(v)-k+1,
D1=(v/r^j)^2 DK and D2=r^(2k) DK (Endo v2 Corollary 4).
GAP CN3/GN11: arrays must be the actual signed relation counts in these orders
and on the curve; exponent signs are enumerated by the count routine. -/
lemma valid_relations :
    (∀ rk : cert.primePowers, cert.countD2 rk < cert.countD1 rk) ∧
    cert.u.factorization 2 = cert.valuationTwo ∧
    cert.u.factorization 3 = cert.valuationThree := by sorry
/-- GAP CM5-End-verify: full verifier evaluates trace/factorization, relation
validity and curve counts. This native partial verifier has the record-return shape but omits the
relation/curve computation adapters and their input data. Its unproved body
is not a computation or a soundness assertion; the result is an Option. -/
def verify (p q : ℕ) (t DK : ℤ) (v u : ℕ) :
    Option (OrdinaryEndomorphismCertificate p q t DK) := by sorry
/-- Test TauCeti.CM.OrdinaryEndomorphismCertificate.test_maximal. -/
example (h : cert.v = 1) : cert.u = 1 := by sorry
/-- Test TauCeti.CM.OrdinaryEndomorphismCertificate.test_supersingular. -/
example (h : (p : ℤ) ∣ t) : ¬ Nonempty (OrdinaryEndomorphismCertificate p q t DK) := by sorry
/-- Test TauCeti.CM.OrdinaryEndomorphismCertificate.test_forged_relation. -/
example (rk : cert.primePowers) (h : cert.countD1 rk ≤ cert.countD2 rk) :
    False := by sorry
/-- Test TauCeti.CM.OrdinaryEndomorphismCertificate.test_prime_powers:
v=25,u=5 requires two different tests, accepting 5|u and rejecting 25|u.
A prime-only certificate cannot distinguish these conductor valuations. -/
example (hv : cert.v = 25) (hu : cert.u = 5) :
    ∃ rk1 rk2 : cert.primePowers,
      rk1.val = (5, 1) ∧ rk2.val = (5, 2) ∧
      cert.countCurve rk1 < cert.countD1 rk1 ∧
      ¬ cert.countCurve rk2 < cert.countD1 rk2 := by sorry
end OrdinaryEndomorphismCertificate

/-- GAP CM5-End-soundness: the full relation-list verifier is equivalent to
End(E)=O_(u²DK), under independently valid Bisson–Sutherland relations; the
unconditional claim is verification, not heuristic generation complexity.
The native discrimination arithmetic below is the available fragment. -/
theorem ordinaryEndomorphism_verify_iff {p q : ℕ} {t DK : ℤ}
    (cert : OrdinaryEndomorphismCertificate p q t DK) :
    ∃ w : ℕ, cert.v = cert.u * w := by sorry

/-! CM.5 total algorithms return polynomial/certificate pairs. Their actual
GN11 discriminant/order input, CN4 shrinking evaluator or CN3 complete finite
prime/curve search and EC3/CN3 walk interfaces are recorded gaps/requests. The
native constructors below give signatures for the certificate return, not
implemented algorithms or unchecked-oracle acceptance. -/

def complexClassPolynomial {J : Type*} [Fintype J] (root : J → ℂ)
    (integralCoefficients : ∀ k : ℕ, ∃ n : ℤ,
      (∏ i : J, (X - C (root i))).coeff k = (n : ℂ)) :
    {P : ℤ[X] // Nonempty (ComplexClassPolynomialCertificate root P)} := by sorry
namespace complexClassPolynomial
lemma certificate {J : Type*} [Fintype J] (root : J → ℂ)
    (integralCoefficients : ∀ k : ℕ, ∃ n : ℤ,
      (∏ i : J, (X - C (root i))).coeff k = (n : ℂ)) :
    Nonempty (ComplexClassPolynomialCertificate root
      (complexClassPolynomial root integralCoefficients).val) := by sorry
lemma correct {J : Type*} [Fintype J] (root : J → ℂ)
    (integralCoefficients : ∀ k : ℕ, ∃ n : ℤ,
      (∏ i : J, (X - C (root i))).coeff k = (n : ℂ)) (H : ℤ[X])
    (h : H.map (Int.castRingHom ℂ) = ∏ i : J, (X - C (root i))) :
    (complexClassPolynomial root integralCoefficients).val = H := by sorry
lemma precision_independent {J : Type*} [Fintype J] (root : J → ℂ) (P Q : ℤ[X])
    (cP : ComplexClassPolynomialCertificate root P)
    (cQ : ComplexClassPolynomialCertificate root Q)
    (h : ∃ H : ℤ[X], H.map (Int.castRingHom ℂ) = ∏ i : J, (X - C (root i))) : P = Q := by sorry
/-- Test TauCeti.CM.complexClassPolynomial.test_minus4: a unique Gaussian
root, with actual order enumeration supplied separately. -/
example (hIntegral : ∀ k : ℕ, ∃ n : ℤ,
    (∏ _i : Fin 1, (X - C (1728 : ℂ))).coeff k = (n : ℂ)) :
    (complexClassPolynomial (fun _ : Fin 1 => (1728 : ℂ)) hIntegral).val = X - C 1728 := by sorry
/-- Test TauCeti.CM.complexClassPolynomial.test_minus3. -/
example (hIntegral : ∀ k : ℕ, ∃ n : ℤ,
    (∏ _i : Fin 1, (X - C (0 : ℂ))).coeff k = (n : ℂ)) :
    (complexClassPolynomial (fun _ : Fin 1 => (0 : ℂ)) hIntegral).val = X := by sorry
/-- Test TauCeti.CM.complexClassPolynomial.test_unvalidated_oracle: a
nonintegral constant root cannot supply the required integer recovery checks. -/
example : ¬ ∃ P : ℤ[X], Nonempty
    (ComplexClassPolynomialCertificate (fun _ : Fin 1 => (1 / 2 : ℂ)) P) := by sorry
end complexClassPolynomial

/-- GAP CM5-CRT-search: residue is the verified complete CM-root product at
admissible primes. CN3 supplies prime selection, curve/order/orbit checks; its
actual admissible-prime subtype is omitted here. This native residue-only
return shape uses an infinite set of certified primes with coherent bounded
integer coefficients, and never asks for the exact target polynomial as input. -/
def crtClassPolynomial (B : ℕ) (admissible : Set ℕ)
    (hinfinite : admissible.Infinite) (hprime : ∀ p ∈ admissible, p.Prime)
    (residue : ℕ → ℤ[X])
    (hcoherent : ∃ H : ℤ[X], (∀ k, |H.coeff k| ≤ (B : ℤ)) ∧
      ∀ p ∈ admissible, ∀ k, Int.ModEq p (H.coeff k) ((residue p).coeff k)) :
    Σ J : Type, Σ _ : Fintype J,
      {r : Σ P : ℤ[X], CRTClassPolynomialCertificate (J := J) P B //
        ∀ i, r.2.prime i ∈ admissible ∧ r.2.residue i = residue (r.2.prime i)} := by sorry
namespace crtClassPolynomial
/-- Certificate projection retains exact prime/residue provenance. The
endomorphism/orbit completion is precisely CM5-CRT-seeds. -/
lemma certificate (B : ℕ) (admissible : Set ℕ)
    (hinfinite : admissible.Infinite) (hprime : ∀ p ∈ admissible, p.Prime)
    (residue : ℕ → ℤ[X])
    (hcoherent : ∃ H : ℤ[X], (∀ k, |H.coeff k| ≤ (B : ℤ)) ∧
      ∀ p ∈ admissible, ∀ k, Int.ModEq p (H.coeff k) ((residue p).coeff k)) :
    let r := crtClassPolynomial B admissible hinfinite hprime residue hcoherent
    letI := r.2.1
    Nonempty (CRTClassPolynomialCertificate (J := r.1) r.2.2.val.1 B) := by sorry
/-- Verified geometric orbits establish equality of the computed residues
with H_D modulo each prime; coefficient uniqueness then proves correctness. -/
lemma correct {J : Type*} [Fintype J] (P H : ℤ[X]) (B : ℕ)
    (c : CRTClassPolynomialCertificate (J := J) P B)
    (hB : ∀ k, |H.coeff k| ≤ (B : ℤ))
    (hres : ∀ i k, Int.ModEq (c.prime i) (H.coeff k) ((c.residue i).coeff k)) : P = H := by sorry
lemma prime_choice_independent {J K : Type*} [Fintype J] [Fintype K]
    (P Q H : ℤ[X]) (B : ℕ)
    (cP : CRTClassPolynomialCertificate (J := J) P B)
    (cQ : CRTClassPolynomialCertificate (J := K) Q B)
    (hB : ∀ k, |H.coeff k| ≤ (B : ℤ))
    (hP : ∀ i k, Int.ModEq (cP.prime i) (H.coeff k) ((cP.residue i).coeff k))
    (hQ : ∀ i k, Int.ModEq (cQ.prime i) (H.coeff k) ((cQ.residue i).coeff k)) : P = Q := by sorry
/-- Test TauCeti.CM.crtClassPolynomial.test_minus4: uniqueness at an actual
Gaussian class-polynomial target, for any valid verified residues. -/
example {J : Type*} [Fintype J] (P : ℤ[X]) (B : ℕ)
    (c : CRTClassPolynomialCertificate (J := J) P B)
    (hB : ∀ k, |(X - C (1728 : ℤ)).coeff k| ≤ (B : ℤ))
    (hres : ∀ i k, Int.ModEq (c.prime i) ((X - C (1728 : ℤ)).coeff k)
      ((c.residue i).coeff k)) : P = X - C 1728 := by sorry
/-- Test TauCeti.CM.crtClassPolynomial.test_supersingular_rejected: p=7 is
inert in Q(i), so no norm-7 Gaussian Frobenius/ordinary split seed exists. -/
example : ¬ ∃ a b : ℤ, a ^ 2 + b ^ 2 = 7 := by sorry
/-- Test TauCeti.CM.crtClassPolynomial.test_order_separate: residue membership
is polynomial data, not an independently verified endomorphism order. Here two
orders have different discriminants even when the same root-value is considered. -/
example : (-36 : ℤ) ≠ -4 ∧ (X - C (1728 : ℤ)).IsRoot 1728 := by sorry
end crtClassPolynomial

end TauCeti.CM
