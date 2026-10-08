/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/ComplexMultiplicationAndExplicitReciprocity.md is
definitive. These statements suggest Lean forms so contributors and reviewers
converge on names and signatures. Nothing here is claimed implemented.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The signature prototypes use the native CM-field, intermediate-field,
fractional-ideal/ClassGroup/Pic, scheme, Weierstrass, polynomial and
interval carriers. A signature marked GAP omits necessary missing supplier
conditions, stated explicitly in its comment rather than hidden as an
uninterpreted Prop. The displayed binders alone need not imply a GAP statement;
elaboration checks its syntax/types, not the omitted mathematics. The full
mathematical statement is in the reader/packet. All bodies are admitted; no
algorithm in this file is executable as a certified implementation.
Raw subgroup or value-set parameters stand for supplied arithmetic data, not
new private replacements for ray-class groups or modular-function fields.
Unavailable geometric and realization carriers are supplied as native schemes,
modules, morphisms and ring types, with the exact missing identifications stated
next to each signature. Their conclusions retain the complete target shape.
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
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic

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

/-- Milne 1.9: existence and uniqueness inside the actual subfield lattice. -/
lemma primitive_core_exists (Φ : CMType K) [NumberField.IsCMField K] :
    ∃ (F : IntermediateField ℚ K) (_ : NumberField F) (Φ₀ : CMType F),
      Φ₀.IsPrimitive ∧ induced F Φ₀ = Φ := by sorry
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

/-- Milne 1.16: fixing every trace is equivalent to permuting the actual
selected embeddings. Finite-Galois descent then gives D3's reflex stabilizer. -/
lemma reflexField_stabilizer (Φ : CMType E) (σ : ℂ ≃ₐ[ℚ] ℂ) :
    (∀ z ∈ Φ.reflexField, σ z = z) ↔
      ∀ φ, φ ∈ Φ.embeddings ↔ σ.toAlgHom.comp φ ∈ Φ.embeddings := by sorry

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
instance reflexField.numberField (Φ : CMType K) : NumberField Φ.reflexField := by sorry
instance reflexField.isCMField (Φ : CMType K) : NumberField.IsCMField Φ.reflexField := by sorry
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

/-- The double reflex is exactly the embedded primitive core, including its
CM type. F and Φ₀ are the unique core supplied by primitive_core_exists. -/
lemma doubleReflex_primitiveCore (Φ : CMType K) (ι : K →ₐ[ℚ] ℂ)
    (F : IntermediateField ℚ K) [NumberField F] (Φ₀ : CMType F)
    (hprimitive : Φ₀.IsPrimitive) (hinduced : induced F Φ₀ = Φ) :
    (Φ.reflexType ι).reflexField = (ι.comp F.val).fieldRange ∧
      ∀ (e : F ≃ₐ[ℚ] (Φ.reflexType ι).reflexField),
        (∀ x : F, ((e x : (Φ.reflexType ι).reflexField) : ℂ) = ι (x : K)) →
        Set.image (fun (φ : (Φ.reflexType ι).reflexField →ₐ[ℚ] ℂ) => φ.comp e.toAlgHom)
          (((Φ.reflexType ι).reflexType Φ.reflexField.val).embeddings : Set _) =
            (Φ₀.embeddings : Set _) := by sorry

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
/-- Multiplicativity and transport of every factor; change of embedding
on K is tracked in the inverse-coset reflex type, not suppressed. -/
lemma typeNorm_mul (Φ : CMType K) (ι : K →ₐ[ℚ] ℂ) (a b : Φ.reflexField) :
    (∏ φ ∈ (Φ.reflexType ι).embeddings, φ (a * b)) =
      (∏ φ ∈ (Φ.reflexType ι).embeddings, φ a) *
      (∏ φ ∈ (Φ.reflexType ι).embeddings, φ b) := by sorry
lemma typeNorm_transport (Φ : CMType K) (ι : K →ₐ[ℚ] ℂ)
    (gamma : ℂ ≃ₐ[ℚ] ℂ) (a : Φ.reflexField) :
    (∏ φ ∈ (Φ.reflexType ι).embeddings, gamma (φ a)) =
      gamma (∏ φ ∈ (Φ.reflexType ι).embeddings, φ a) := by sorry
/-- The induced and primitive-core norms agree in the ambient closure.
Their reflex fields are canonically the same trace-generated field; equality
of the embedded factor values avoids choosing a second reflex-field carrier. -/
lemma typeNorm_primitiveCore (Φ : CMType K) (ι : K →ₐ[ℚ] ℂ)
    (F : IntermediateField ℚ K) [NumberField F] [NumberField.IsCMField F]
    (Φ₀ : CMType F) (hinduced : induced F Φ₀ = Φ)
    (a : Φ.reflexField) (b : Φ₀.reflexField) (hab : (a : ℂ) = (b : ℂ)) :
    Φ.reflexField = Φ₀.reflexField ∧
      (∏ φ ∈ (Φ.reflexType ι).embeddings, φ a) =
      (∏ phi ∈ (Φ₀.reflexType (ι.comp F.val)).embeddings, phi b) := by sorry
end Reflex

/-- Image of the actual order tensor map in the selected étale factor. The
trace idempotent/quotient map and finite full-rank hypotheses are supplied by
CM0-reflex-order/GN11; they are omitted here, not replaced by abstract truth flags. -/
def reflexOrder {T Q : Type*} [CommRing T] [CommRing Q]
    (quotientMap : T →+* Q) : Subring Q := quotientMap.range
lemma reflexOrder_image {T Q : Type*} [CommRing T] [CommRing Q]
    (f : T →+* Q) (x : Q) : x ∈ reflexOrder f ↔ ∃ y, f y = x := by sorry
/-- GAP GN11: f is the selected tensor quotient, whose order image is full
rank. Rationalization identifies its entire fraction algebra with that selected
finite étale factor, even when f is not onto its integral closure. -/
lemma reflexOrder_fractionAlgebra {T Q : Type*} [CommRing T] [CommRing Q]
    [Algebra ℚ Q] (f : T →+* Q) :
    Nonempty ((ℚ ⊗[ℤ] reflexOrder f) ≃ₐ[ℚ] Q) := by sorry

/-- GN11 supplies the finite locally free O_E*-order reflexOrder f,
its relative trace and discriminant. On a free localization this is the ideal
of the Gram determinant of the actual trace pairing. Ostar is O_E*, and
relativeTrace is the selected étale factor's relative trace; these supplied
identifications are omitted. The ideal is not an absolute Z-discriminant. -/
lemma reflexOrder_discriminant {T Q Ostar : Type*}
    [CommRing T] [CommRing Q] [CommRing Ostar]
    (f : T →+* Q) [Algebra Ostar (reflexOrder f)]
    (n : ℕ) (basis : Module.Basis (Fin n) Ostar (reflexOrder f))
    (relativeTrace : reflexOrder f → Ostar)
    (relativeDiscriminant : Subring Q → Ideal Ostar) :
    relativeDiscriminant (reflexOrder f) =
      Ideal.span {Matrix.det (fun i j : Fin n => relativeTrace (basis i * basis j))} := by sorry

/-- GAP GN11: relativeDiscriminant is GN11's relative trace discriminant
of the specified suborder over O_E. In this quadratic selected factor the
left tensor factor supplies O_E, so this is the rank-one unit discriminant. -/
lemma reflexOrder_discriminant_quadratic
    (O : Subring (NumberField.RingOfIntegers gaussianField))
    (f : NumberField.RingOfIntegers gaussianField ⊗[ℤ] O →+*
      NumberField.RingOfIntegers gaussianField)
    (hleft : ∀ a, f (a ⊗ₜ[ℤ] (1 : O)) = a)
    (relativeDiscriminant : Subring (NumberField.RingOfIntegers gaussianField) →
      Ideal (NumberField.RingOfIntegers gaussianField)) :
    reflexOrder f = ⊤ ∧ relativeDiscriminant (reflexOrder f) = 1 := by sorry
/-- Test TauCeti.CM.CMType.test_reflex_order_quadratic. -/
example (O : Subring (NumberField.RingOfIntegers gaussianField))
    (f : NumberField.RingOfIntegers gaussianField ⊗[ℤ] O →+*
      NumberField.RingOfIntegers gaussianField)
    (hleft : ∀ a, f (a ⊗ₜ[ℤ] (1 : O)) = a) : reflexOrder f = ⊤ := by sorry
/-- Test TauCeti.CM.CMType.test_reflex_order_image. -/
example {T Q : Type*} [CommRing T] [CommRing Q] (f : T →+* Q) (a b : T) :
    f a * f b ∈ reflexOrder f := by sorry

/-- The input order Z+3Zi inside O_Q(i), specified by its embedded elements. -/
def gaussianOrderThreeIntegers : Subring (NumberField.RingOfIntegers gaussianField) where
  carrier := {x | ∃ a b : ℤ, ((x : gaussianField) : ℂ) = a + 3 * b * Complex.I}
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  mul_mem' := by sorry
  neg_mem' := by sorry
/-- Test TauCeti.CM.CMType.test_order_discriminant. The GN11 absolute and
relative discriminant operations are supplied, with their intrinsic definitions
omitted; both are applied to the actual order/image rather than free integers. -/
example
    (f : NumberField.RingOfIntegers gaussianField ⊗[ℤ] gaussianOrderThreeIntegers →+*
      NumberField.RingOfIntegers gaussianField)
    (hleft : ∀ a, f (a ⊗ₜ[ℤ] (1 : gaussianOrderThreeIntegers)) = a)
    (absoluteDiscriminant : Subring (NumberField.RingOfIntegers gaussianField) → ℤ)
    (relativeDiscriminant : Subring (NumberField.RingOfIntegers gaussianField) →
      Ideal (NumberField.RingOfIntegers gaussianField)) :
    absoluteDiscriminant gaussianOrderThreeIntegers = -36 ∧
      reflexOrder f = ⊤ ∧ relativeDiscriminant (reflexOrder f) = 1 := by sorry

end CMType

def quarticA : ℂ := Complex.I * Real.sqrt (3 + Real.sqrt 2)
def quarticB : ℂ := Complex.I * Real.sqrt (3 - Real.sqrt 2)
def quarticField : IntermediateField ℚ ℂ := IntermediateField.adjoin ℚ {quarticA}
instance quarticField.numberField : NumberField quarticField := by sorry
instance quarticField.isCMField : NumberField.IsCMField quarticField := by sorry
def quarticType : CMType quarticField := by sorry
/-- The actual real subfield, on Mathlib's native intermediate-field lattice. -/
def realSubfield : IntermediateField ℚ ℂ where
  carrier := {z | z.im = 0}
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry
  algebraMap_mem' := by sorry
/-- The D4 example includes the CM fields, primitivity and double reflex. -/
theorem nonGaloisQuarticExample :
    quarticA ^ 4 + 6 * quarticA ^ 2 + 7 = 0 ∧
    (quarticA + quarticB) ^ 4 + 12 * (quarticA + quarticB) ^ 2 + 8 = 0 ∧
    ¬ IsGalois ℚ quarticField ∧ quarticType.IsPrimitive ∧
    quarticType.reflexField = IntermediateField.adjoin ℚ {quarticA + quarticB} ∧
    quarticField ⊓ realSubfield = IntermediateField.adjoin ℚ {(Real.sqrt 2 : ℂ)} ∧
    quarticType.reflexField ⊓ realSubfield =
      IntermediateField.adjoin ℚ {(Real.sqrt 7 : ℂ)} ∧
    (quarticType.reflexType quarticField.val).reflexField = quarticField := by sorry

/-- Concrete order Z+3Zi on the native subring carrier, not a second order type. -/
def gaussianOrderThree : Subring CMType.gaussianField where
  carrier := {x | ∃ a b : ℤ, (x : ℂ) = a + 3 * b * Complex.I}
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  mul_mem' := by sorry
  neg_mem' := by sorry
instance gaussianOrderThree.algebra : Algebra gaussianOrderThree CMType.gaussianField :=
  gaussianOrderThree.subtype.toAlgebra
instance gaussianOrderThree.fractionRing : IsFractionRing gaussianOrderThree CMType.gaussianField := by sorry
instance gaussianOrderThree.finite : Module.Finite ℤ gaussianOrderThree := by sorry
instance gaussianField.quadratic : Fact (Module.finrank ℚ CMType.gaussianField = 2) := by sorry
instance gaussianOrderThree.classFinite : Fintype (ClassGroup gaussianOrderThree) := by sorry
/-- GAP GN11: conductor/discriminant/norm are the named order operations. -/
theorem nonmaximalGaussianExample
    (conductor : Subring CMType.gaussianField → Ideal (NumberField.RingOfIntegers CMType.gaussianField))
    (discriminant : Subring CMType.gaussianField → ℤ)
    (a : (FractionalIdeal gaussianOrderThree⁰ CMType.gaussianField)ˣ)
    (ha : (a.val : Submodule gaussianOrderThree CMType.gaussianField) =
      Submodule.span gaussianOrderThree {2, ⟨1 + 3 * Complex.I, by sorry⟩}) :
    discriminant gaussianOrderThree = -36 ∧
    conductor gaussianOrderThree = Ideal.span {(3 : NumberField.RingOfIntegers CMType.gaussianField)} ∧
    Nat.card gaussianOrderThreeˣ = 2 ∧
    Fintype.card (ClassGroup gaussianOrderThree) = 2 ∧
    Nat.card (ClassGroup (NumberField.RingOfIntegers CMType.gaussianField)) = 1 ∧
    Nat.card (gaussianOrderThree ⧸
      (Submodule.comap (Algebra.linearMap gaussianOrderThree CMType.gaussianField)
        (a.val : Submodule gaussianOrderThree CMType.gaussianField)).toAddSubgroup) = 2 ∧
    ClassGroup.mk CMType.gaussianField a ≠ 1 ∧
    (ClassGroup.mk CMType.gaussianField a) ^ 2 = 1 := by sorry

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
/-- EC1/A5 supplies the analytic O-linear complex-Lie realization and its
origin-preserving comparison with these native points. Those analytic/action
carrier identifications are omitted; this is the selected uniformization,
not an arbitrary abstract-group isomorphism. -/
def uniformization (ι : K →ₐ[ℚ] ℂ) (I : (FractionalIdeal R⁰ K)ˣ) :
    (idealLatticeCurve ι I).toAffine.Point ≃+ ℂ ⧸ idealLattice ι I := by sorry
/-- EC1 identifies curveScheme with the actual origin/CM-action-preserving
algebraic realization. That adapter is omitted; the conclusion retains the
scheme isomorphism as well as its uniformized point-group comparison. -/
lemma homothety (ι : K →ₐ[ℚ] ℂ) (I : (FractionalIdeal R⁰ K)ˣ) (u : Kˣ)
    (curveScheme : WeierstrassCurve ℂ → Over (Spec (.of ℂ))) :
    Nonempty (curveScheme (idealLatticeCurve ι I) ≅
      curveScheme (idealLatticeCurve ι (toPrincipalIdeal R K u * I))) ∧
    Nonempty ((idealLatticeCurve ι I).toAffine.Point ≃+
      (idealLatticeCurve ι (toPrincipalIdeal R K u * I)).toAffine.Point) := by sorry
/-- GAP EC1/A5: geometricEnd W is precisely the pinned algebraic
AbelianVariety.End of EC1's scheme attached to W. The shared build lacks that
import and the comparison; this supplied family of ring types is not a new
endomorphism definition. Properness/holomorphic full faithfulness are omitted
conditions. The output is the algebraic End-ring equivalence, not multiplier
membership or arbitrary endomorphisms of the abstract point group. -/
lemma endomorphismRing (ι : K →ₐ[ℚ] ℂ) (I : (FractionalIdeal R⁰ K)ˣ)
    (geometricEnd : WeierstrassCurve ℂ → Type*)
    [Ring (geometricEnd (idealLatticeCurve ι I))] :
    Nonempty (geometricEnd (idealLatticeCurve ι I) ≃+* R) := by sorry

/-- ModularForms L0 supplies normalized modular j and its SL2(Z) invariance.
With the oriented-basis/uniformization adapter omitted, the actual pinned j
appears as the observable being compared. -/
lemma j (ι : K →ₐ[ℚ] ℂ) (I : (FractionalIdeal R⁰ K)ˣ)
    (ω₁ ω₂ : ℂ) (normalizedJ : ℂ → ℂ)
    (hbasis : idealLattice ι I = AddSubgroup.zmultiples ω₁ ⊔ AddSubgroup.zmultiples ω₂)
    (horientation : 0 < (ω₂ / ω₁).im) :
    (idealLatticeCurve ι I).j = normalizedJ (ω₂ / ω₁) := by sorry
/-- Test TauCeti.CM.idealLatticeCurve.test_gaussian. The actual curve of
Z[i] has j=1728; its algebraic End ring is Z[i], with four units. -/
example
    (geometricEnd : WeierstrassCurve ℂ → Type*)
    [Ring (geometricEnd (idealLatticeCurve CMType.gaussianField.val
      (1 : (FractionalIdeal (NumberField.RingOfIntegers CMType.gaussianField)⁰ CMType.gaussianField)ˣ)))] :
    let W := idealLatticeCurve CMType.gaussianField.val
      (1 : (FractionalIdeal (NumberField.RingOfIntegers CMType.gaussianField)⁰ CMType.gaussianField)ˣ)
    W.j = 1728 ∧ Nonempty (geometricEnd W ≃+* NumberField.RingOfIntegers CMType.gaussianField) ∧
      Nat.card (NumberField.RingOfIntegers CMType.gaussianField)ˣ = 4 := by sorry
/-- Test TauCeti.CM.idealLatticeCurve.test_nonmaximal. The constructor
uses Z+3Zi, and must not silently replace it by the maximal Gaussian order. -/
example (geometricEnd : WeierstrassCurve ℂ → Type*)
    [Ring (geometricEnd (idealLatticeCurve CMType.gaussianField.val
      (1 : (FractionalIdeal gaussianOrderThree⁰ CMType.gaussianField)ˣ)))] :
    Nonempty (geometricEnd (idealLatticeCurve CMType.gaussianField.val
      (1 : (FractionalIdeal gaussianOrderThree⁰ CMType.gaussianField)ˣ)) ≃+* gaussianOrderThree) ∧
    Nat.card (geometricEnd (idealLatticeCurve CMType.gaussianField.val
      (1 : (FractionalIdeal gaussianOrderThree⁰ CMType.gaussianField)ˣ)))ˣ = 2 ∧
    Complex.I ∉ idealLattice CMType.gaussianField.val
      (1 : (FractionalIdeal gaussianOrderThree⁰ CMType.gaussianField)ˣ) := by sorry
/-- Test TauCeti.CM.idealLatticeCurve.test_scale. -/
example (ι : K →ₐ[ℚ] ℂ) (I : (FractionalIdeal R⁰ K)ˣ) (u : Kˣ)
    (curveScheme : WeierstrassCurve ℂ → Over (Spec (.of ℂ))) :
    Nonempty (curveScheme (idealLatticeCurve ι I) ≅
      curveScheme (idealLatticeCurve ι (toPrincipalIdeal R K u * I))) ∧
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
/-- Test TauCeti.CM.idealAction.test_gaussian_prime: (2+i) gives the
constructor's five-element kernel even though it acts trivially on classes. -/
example (u : CMType.gaussianFieldˣ) (hu : ((u : CMType.gaussianField) : ℂ) = 2 + Complex.I)
    (h : idealLattice CMType.gaussianField.val
      (1 : (FractionalIdeal (NumberField.RingOfIntegers CMType.gaussianField)⁰ CMType.gaussianField)ˣ) ≤
      idealLattice CMType.gaussianField.val
        ((toPrincipalIdeal (NumberField.RingOfIntegers CMType.gaussianField) CMType.gaussianField u)⁻¹ * 1)) :
    Nat.card (quotientMap CMType.gaussianField.val
      (toPrincipalIdeal (NumberField.RingOfIntegers CMType.gaussianField) CMType.gaussianField u) 1 h).ker = 5 ∧
    (idealAction CMType.gaussianField.val
      (toPrincipalIdeal (NumberField.RingOfIntegers CMType.gaussianField) CMType.gaussianField u) 1).j = 1728 := by sorry
/-- Test TauCeti.CM.idealAction.test_inverse. -/
example (ι : K →ₐ[ℚ] ℂ) (a I : (FractionalIdeal R⁰ K)ˣ) :
    idealAction ι a (a * I) = idealLatticeCurve ι I := by sorry
/-- Test TauCeti.CM.idealAction.test_conductor: 3Z[i] is a lattice over
Z+3Zi but is not an invertible proper ideal, hence cannot be an action input. -/
example : ¬ ∃ a : (FractionalIdeal gaussianOrderThree⁰ CMType.gaussianField)ˣ,
    (a.val : Set CMType.gaussianField) =
      {x : CMType.gaussianField | ∃ m n : ℤ, (x : ℂ) = 3 * m + 3 * n * Complex.I} := by sorry

end idealAction

/-- GAP EC1/A5: objects is the subset of complex elliptic schemes with the
specified embedded O-action/type and full End O; cmIso is their O-linear
algebraic isomorphism setoid. Their concrete supplier identifications are
omitted. Classify those actual objects, with the inverse-ideal torsor law. -/
theorem idealAction.picardEquiv
    (objects : Set (Over (Spec (.of ℂ)))) (cmIso : Setoid objects)
    (classify : ClassGroup R → Quotient cmIso)
    (act : ClassGroup R → Quotient cmIso → Quotient cmIso) :
    Function.Bijective classify ∧
    (∀ a c, act a (classify c) = classify (a⁻¹ * c)) ∧
    (∀ x y, ∃! a, act a x = y) := by sorry
/-- GAP EC1/A5: automorphismGroup W is the group of algebraic
origin-preserving automorphisms of the actual elliptic scheme attached to W. -/
theorem idealLatticeCurve.automorphism_factors (ι : K →ₐ[ℚ] ℂ)
    (I : (FractionalIdeal R⁰ K)ˣ) (automorphismGroup : WeierstrassCurve ℂ → Type*)
    [Group (automorphismGroup (idealLatticeCurve ι I))] :
    Nonempty (automorphismGroup (idealLatticeCurve ι I) ≃* Rˣ) ∧
    Nat.card (automorphismGroup (idealLatticeCurve ι I)) =
      if (idealLatticeCurve ι I).j = 0 then 6
      else if (idealLatticeCurve ι I).j = 1728 then 4 else 2 := by sorry
/-- GAP GN3/GN11: formClasses and pointClasses are the native SL2(Z)
quotients of primitive positive forms and oriented CM upper-half-plane points
of discriminant D. formToClass is [a,b,c] ↦ [Za+Z(-b+sqrt D)/2]. Their
supplier maps and quotient identifications are omitted conditions, not a new
quadratic-form carrier. The full correspondence is bijective. -/
theorem quadraticFormsDictionary
    {Forms Points : Type*} (forms : Setoid Forms) (points : Setoid Points)
    (formToClass : Quotient forms → ClassGroup R)
    (formToPoint : Quotient forms → Quotient points)
    (a b c D : ℤ) (ha : 0 < a) (hD : D < 0) (hprimitive : IsCoprime a (Int.gcd b c))
    (hdisc : b ^ 2 - 4 * a * c = D) :
    Function.Bijective formToClass ∧ Function.Bijective formToPoint ∧
    let tau : ℂ := (-(b : ℂ) + Complex.I * Real.sqrt (-(D : ℝ))) / (2 * a)
    0 < tau.im ∧ (a : ℂ) * tau ^ 2 + b * tau + c = 0 := by sorry
/-- GAP EC1/A5: φ is exactly the algebraized lattice quotientMap, and degree
is the pinned TauCeti.Isogeny.degree of its transferred Weierstrass isogeny.
The equation/scheme adapter and O-linearity are omitted, not the degree. -/
theorem idealAction.degree_eq_norm (ι : K →ₐ[ℚ] ℂ)
    (a I : (FractionalIdeal R⁰ K)ˣ) (aIntegral : Ideal R)
    (ha : a.val = (aIntegral : FractionalIdeal R⁰ K))
    (h : idealLattice ι I ≤ idealLattice ι (a⁻¹ * I))
    (source target : Over (Spec (.of ℂ))) (φ : source ⟶ target)
    (degree : (source ⟶ target) → ℕ) :
    degree φ = Nat.card (R ⧸ aIntegral) ∧
    degree φ = Nat.card (idealAction.quotientMap ι a I h).ker := by sorry
end EllipticIdeals

/-- GAP EC1/EC5: A is the elliptic scheme of a rational CM equation,
Atwist is its actual quadratic twist by the quadratic character of its full
geometric CM field. The CM-action and twist descent identifications are
omitted. The conclusion constructs an actual nonzero rational isogeny;
finite surjectivity is retained, rather than merely equality of traces. -/
theorem rationalCMSelfTwist
    (A Atwist : Over (Spec (.of ℚ)))
    (degree : (A ⟶ Atwist) → ℕ) :
    ∃ φ : A ⟶ Atwist, IsFinite φ.left ∧ Function.Surjective φ.left.base ∧
      0 < degree φ := by sorry


/-! Serre's CM tensor construction, Kings–Sprang §1.2, p.9, (1.2.3). The unbundled
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
/-- Test TauCeti.CM.cmSerreTensor.test_torsion_excluded: the actual
constructor requires projective input. Z/2Z cannot supply that instance. -/
example : ¬ Module.Projective ℤ (ZMod 2) := by sorry

end cmSerreTensor

/-- GAP A0/A1/A6: source and target are the tensors by a⊂b,
φ their induced morphism, kernel and index their finite-flat scheme kernel
and lattice index, and degree the imported scheme degree. None is geometric
point cardinality in residue characteristic. These supplier identifications
are omitted, while the full finite-flat and degree conclusions remain. -/
theorem cmSerreTensor.ideal_kernel_degree
    (source target : Over S) (φ : source ⟶ target)
    (kernel : Over S) (idealTorsion : Over S)
    (degree : (source ⟶ target) → ℕ) (index : ℕ) :
    IsFinite φ.left ∧ Flat φ.left ∧ Function.Surjective φ.left.base ∧
      Nonempty (kernel ≅ idealTorsion) ∧ degree φ = index := by sorry
/-- GAP A4: LieA, omegaA, omegaDual and H are the actual CM Lie,
invariant-differential, dual-differential and covariant de Rham modules;
actions are the imported torus actions. Hminus/Hplus are its conjugate/selected
summands. The Hodge splitting and inverse differential action are explicit. -/
theorem cmHodgeEigenspaces {E : Type*} [Field E] [Algebra ℚ E]
    (Φ : CMType E) [DecidableEq (E →ₐ[ℚ] ℂ)]
    {LieA omegaA omegaDual H Hminus Hplus : Type*}
    [AddCommGroup LieA] [Module ℂ LieA] [AddCommGroup omegaA] [Module ℂ omegaA]
    [AddCommGroup omegaDual] [Module ℂ omegaDual] [AddCommGroup H] [Module ℂ H]
    [AddCommGroup Hminus] [Module ℂ Hminus] [AddCommGroup Hplus] [Module ℂ Hplus]
    (action : E →+* Module.End ℂ LieA)
    (differentialAction : Eˣ →* (omegaA ≃ₗ[ℂ] omegaA))
    (differentialComponent : (E →ₐ[ℚ] ℂ) → Submodule ℂ omegaA)
    (hodgeInclusion : omegaDual →ₗ[ℂ] H) (hodgeProjection : H →ₗ[ℂ] LieA) :
    (∀ φ, Module.finrank ℂ ↥(⨅ a : E,
      Module.End.eigenspace (action a) (φ a) : Submodule ℂ LieA) =
        if φ ∈ Φ.embeddings then 1 else 0) ∧
    Nonempty (H ≃ₗ[ℂ] Hminus × Hplus) ∧
    Nonempty (Hminus ≃ₗ[ℂ] omegaDual) ∧ Nonempty (Hplus ≃ₗ[ℂ] LieA) ∧
    (∃ e : H ≃ₗ[ℂ] omegaDual × LieA,
      (∀ w, e (hodgeInclusion w) = (w, 0)) ∧
      ∀ h, (e h).2 = hodgeProjection h) ∧
    (⨆ phi ∈ Φ.embeddings, differentialComponent phi) = ⊤ ∧
    (∀ φ ∈ Φ.embeddings, ∀ (a : Eˣ) (w : differentialComponent φ),
      differentialAction a (w : omegaA) = (φ (a : E))⁻¹ • (w : omegaA)) := by sorry
/-- GAP A4: H1 is integral Betti homology; omegaBar carries the conjugate
complex scalar structure of omegaA. These are the supplied actual period and
CM differential pairings, not arbitrary bilinear maps. The maps land in the
appropriate products indexed by selected and conjugate embeddings. -/
theorem cmPeriodPairings {E : Type*} [CommRing E] [Algebra ℚ E]
    (Φ : CMType E)
    {H1 omegaA omegaBar omegaDual : Type*}
    [AddCommGroup H1] [AddCommGroup omegaA] [Module ℂ omegaA]
    [AddCommGroup omegaBar] [Module ℂ omegaBar]
    [AddCommGroup omegaDual] [Module ℂ omegaDual]
    (integration : omegaA →ₗ[ℂ] H1 →ₗ[ℤ] (Φ.embeddings → ℂ))
    (dualDifferential : omegaBar →ₗ[ℂ] omegaDual →ₗ[ℂ] (Φ.conjugate.embeddings → ℂ)) :
    Function.Injective integration ∧
    (∀ w, (∀ γ, integration w γ = 0) → w = 0) ∧
    (∀ w, (∀ v, dualDifferential w v = 0) → w = 0) ∧
    (∀ v, (∀ w, dualDifferential w v = 0) → v = 0) := by sorry

end Serre

/-! CM.2. Trace-form convention Eξ(x,y)=Tr(ξxȳ), Im φ(ξ)>0.
Thus Eξ(x,Jx)>0; Streng's oppositely signed convention is translated. -/
section Polarized
variable {E : Type*} [CommRing E] [Algebra ℚ E] [FiniteDimensional ℚ E]
/-- E is the supplied finite étale CM algebra (possibly a product), c its
canonical conjugation, and O the specified faithful order. GN3/GN11 supply
those identifications; they are omitted conditions, not field-only substitutes. -/
structure PolarizedCMLattice (O : Subring E) (c : E ≃ₐ[ℚ] E) (Φ : CMType E) where
  lattice : Submodule ℤ E
  finite : Module.Finite ℤ lattice
  orderStable : ∀ a : O, ∀ x ∈ lattice, (a : E) * x ∈ lattice
  fullRank : Submodule.span ℚ (lattice : Set E) = ⊤
  xi : Eˣ
  antiInvariant : c (xi : E) = -(xi : E)
  positive : ∀ φ ∈ Φ.embeddings, 0 < (φ (xi : E)).im
  integralTrace : ∀ x y : lattice,
    ∃ n : ℤ, Algebra.trace ℚ E ((xi : E) * (x : E) * c (y : E)) = (n : ℚ)

namespace PolarizedCMLattice
variable {O : Subring E} {c : E ≃ₐ[ℚ] E} {Φ : CMType E}
  (L : PolarizedCMLattice O c Φ)
attribute [instance] PolarizedCMLattice.finite
def form : L.lattice →ₗ[ℤ] L.lattice →ₗ[ℤ] ℤ := by sorry
lemma form_trace (x y : L.lattice) :
    (L.form x y : ℚ) = Algebra.trace ℚ E ((L.xi : E) * (x : E) * c (y : E)) := by sorry
lemma form_alternating (x : L.lattice) : L.form x x = 0 := by sorry
def traceDual (L : PolarizedCMLattice O c Φ) : Submodule ℤ E := by sorry
lemma mem_traceDual (x : E) : x ∈ L.traceDual ↔
    ∀ y : L.lattice, ∃ n : ℤ,
      Algebra.trace ℚ E ((L.xi : E) * x * c (y : E)) = (n : ℚ) := by sorry
def scale (L : PolarizedCMLattice O c Φ) (u : Eˣ) : PolarizedCMLattice O c Φ := by sorry
lemma scale_lattice (u : Eˣ) : (L.scale u).lattice =
    L.lattice.map (LinearMap.mulLeft ℤ (u : E)) := by sorry
lemma scale_xi (u : Eˣ) : ((L.scale u).xi : E) =
    (L.xi : E) * ((u⁻¹ : Eˣ) : E) * c ((u⁻¹ : Eˣ) : E) := by sorry
lemma principal_iff : Function.Bijective L.form ↔ L.lattice = L.traceDual := by sorry
/-- A2 identifies EndQ with actual rational geometric End, cmAction with
its E-action and rosati with the involution of the polarization from L.
Those supplier conditions are omitted. The conclusion is the End comparison. -/
lemma rosati {EndQ : Type*} [Ring EndQ]
    (cmAction : E →+* EndQ) (rosati : EndQ → EndQ) (a : E) :
    rosati (cmAction a) = cmAction (c a) := by sorry

/-- The following concrete constructors fix the Gaussian lattice and xi;
their membership proofs, integral pairing and positivity are construction work. -/
def gaussianI : CMType.gaussianField := ⟨Complex.I, by sorry⟩
def gaussianOrder : Subring CMType.gaussianField :=
  (algebraMap (NumberField.RingOfIntegers CMType.gaussianField) CMType.gaussianField).range
def gaussianConjugation : CMType.gaussianField ≃ₐ[ℚ] CMType.gaussianField :=
  (NumberField.IsCMField.complexConj CMType.gaussianField).restrictScalars ℚ
def gaussian : PolarizedCMLattice gaussianOrder gaussianConjugation CMType.gaussianType := by sorry
lemma gaussian_lattice : gaussian.lattice = Submodule.span ℤ {1, gaussianI} := by sorry
lemma gaussian_xi : (gaussian.xi : CMType.gaussianField) = gaussianI / 2 := by sorry
/-- The doubled lattice with the ORIGINAL xi is still a polarization,
but no longer the principal polarization carried by scale. -/
def gaussianUnadjustedDouble :
    PolarizedCMLattice gaussianOrder gaussianConjugation CMType.gaussianType := by sorry
lemma gaussianUnadjustedDouble_lattice : gaussianUnadjustedDouble.lattice =
    gaussian.lattice.map (LinearMap.mulLeft ℤ 2) := by sorry
lemma gaussianUnadjustedDouble_xi :
    (gaussianUnadjustedDouble.xi : CMType.gaussianField) = gaussianI / 2 := by sorry
/-- Test TauCeti.CM.PolarizedCMLattice.test_square. -/
example (one i : gaussian.lattice) (hone : (one : CMType.gaussianField) = 1)
    (hi : (i : CMType.gaussianField) = gaussianI) :
    gaussian.form one i = 1 ∧ Function.Bijective gaussian.form := by sorry
/-- Test TauCeti.CM.PolarizedCMLattice.test_negative: the wrong sign cannot
construct a positive Gaussian polarized lattice. -/
example : ¬ ∃ L : PolarizedCMLattice gaussianOrder gaussianConjugation CMType.gaussianType,
    (L.xi : CMType.gaussianField) = -gaussianI / 2 := by sorry
/-- Test TauCeti.CM.PolarizedCMLattice.test_scale: this tests scale itself,
including its changed lattice and parameter and the transported pairing. -/
example (two : CMType.gaussianFieldˣ) (htwo : (two : CMType.gaussianField) = 2)
    (one i : gaussian.lattice) (hone : (one : CMType.gaussianField) = 1)
    (hi : (i : CMType.gaussianField) = gaussianI)
    (x y : (gaussian.scale two).lattice)
    (hx : (x : CMType.gaussianField) = 2) (hy : (y : CMType.gaussianField) = 2 * gaussianI)
    (xb yb : gaussianUnadjustedDouble.lattice)
    (hxb : (xb : CMType.gaussianField) = 2)
    (hyb : (yb : CMType.gaussianField) = 2 * gaussianI) :
    (gaussian.scale two).lattice = gaussian.lattice.map (LinearMap.mulLeft ℤ 2) ∧
    ((gaussian.scale two).xi : CMType.gaussianField) = gaussianI / 8 ∧
    (gaussian.scale two).form x y = gaussian.form one i ∧
    gaussianUnadjustedDouble.form xb yb = 4 * gaussian.form one i := by sorry
end PolarizedCMLattice

/-- A1/A2/A5 supply objects (polarized E-action triples), their actual
isomorphism setoid, and algebraize. Their identifications are omitted.
The lattice setoid is the displayed E-unit homothety, not an arbitrary relation. -/
def polarizedHomothety (O : Subring E) (c : E ≃ₐ[ℚ] E) (Φ : CMType E) :
    Setoid (PolarizedCMLattice O c Φ) := by sorry
lemma polarizedHomothety_rel (O : Subring E) (c : E ≃ₐ[ℚ] E) (Φ : CMType E)
    (L M : PolarizedCMLattice O c Φ) :
    (polarizedHomothety O c Φ).r L M ↔ ∃ u : Eˣ, M = L.scale u := by sorry

theorem arbitraryCMClassification (O : Subring E) (c : E ≃ₐ[ℚ] E) (Φ : CMType E)
    (objects : Set (Over (Spec (.of ℂ)))) (iso : Setoid objects)
    (algebraize : Quotient (polarizedHomothety O c Φ) → Quotient iso) :
    Function.Bijective algebraize := by sorry
/-- The field/maximal-order unpolarized specialization has the Pic torsor,
ideal degree and primitive simplicity/End conclusions. A5/A6 supplies actual
simple objects and rational/integral End selectors; their identifications are
omitted rather than packaged as truth-valued placeholders. -/
theorem arbitraryCMClassification.field_specialization
    {K : Type*} [Field K] [NumberField K] [NumberField.IsCMField K]
    [Fintype (ClassGroup (NumberField.RingOfIntegers K))]
    (Φ : CMType K) (hprimitive : Φ.IsPrimitive)
    (objects simpleObjects : Set (Over (Spec (.of ℂ)))) (iso : Setoid objects)
    (classify : ClassGroup (NumberField.RingOfIntegers K) → Quotient iso)
    (act : ClassGroup (NumberField.RingOfIntegers K) → Quotient iso → Quotient iso)
    (A : objects) {End EndQ : Type*} [Ring End] [Ring EndQ] :
    Function.Bijective classify ∧
    (∀ a b, act a (classify b) = classify (a⁻¹ * b)) ∧
    (∀ x y, ∃! a, act a x = y) ∧
    Nat.card (Quotient iso) = Fintype.card (ClassGroup (NumberField.RingOfIntegers K)) ∧
    (A : Over (Spec (.of ℂ))) ∈ simpleObjects ∧
    Nonempty (EndQ ≃+* K) ∧ Nonempty (End ≃+* NumberField.RingOfIntegers K) := by sorry
/-- A5/A6 identifies A with a CM variety of FIELD type (K,Phi), source
and target with the ideal-lattice construction for an integral proper ideal a,
kernel with its actual scheme kernel and degree with the pinned isogeny degree.
These supplied identifications are omitted. This works in every CM dimension. -/
theorem arbitraryCMClassification.ideal_isogeny_degree
    {K : Type*} [Field K] [NumberField K] [NumberField.IsCMField K]
    (Φ : CMType K) (A B : Over (Spec (.of ℂ)))
    (phi : A ⟶ B) (kernel : Type*) [AddCommGroup kernel]
    (degree : (A ⟶ B) → ℕ)
    (a : Ideal (NumberField.RingOfIntegers K)) (ha : a ≠ ⊥) :
    IsFinite phi.left ∧ Function.Surjective phi.left.base ∧
      Nonempty (kernel ≃+ NumberField.RingOfIntegers K ⧸ a) ∧
      degree phi = Nat.card (NumberField.RingOfIntegers K ⧸ a) := by sorry
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
/-- Test TauCeti.CM.reflexIdealMap.test_quadratic: this is the actual
Gaussian type and proper ideal map, with its natural quadratic reflex embedding. -/
example (a : ((⊤ : Subgroup ((FractionalIdeal
    (NumberField.RingOfIntegers CMType.gaussianField)⁰ CMType.gaussianField)ˣ)))) :
    reflexIdealMap (R := NumberField.RingOfIntegers CMType.gaussianField)
      (K := CMType.gaussianField) CMType.gaussianType ⊤ a = a.val := by sorry
/-- Test TauCeti.CM.reflexIdealMap.test_one. -/
example : reflexIdealMap (R := R) (K := K) Φ G 1 = 1 := by sorry
/-- Test TauCeti.CM.reflexIdealMap.test_conductor_prime. GAP GN7/GN11:
primeToThree is the actual prime-to-conductor subgroup for Z+3Zi and u=3.
The omitted local-condition adapter must identify it; the test excludes that
principal ideal from the map's input carrier, rather than checking Nat.Coprime. -/
example (primeToThree : Subgroup ((FractionalIdeal
    (NumberField.RingOfIntegers CMType.gaussianField)⁰ CMType.gaussianField)ˣ))
    (u : CMType.gaussianFieldˣ) (hu : (u : CMType.gaussianField) = 3) :
    ¬ ∃ a : primeToThree, a.val = toPrincipalIdeal
      (NumberField.RingOfIntegers CMType.gaussianField) CMType.gaussianField u := by sorry

end reflexIdealMap
end ReflexIdeals

/-! The reciprocity comparison acts on the actual finite-adelic Tate
modules. Af, V and Vsigma are supplied native coefficient rings/modules;
V4/V5/EC5 identify them and the arithmetic Artin lift. Those unavailable
identifications are omitted conditions. They are not independent scalar tests. -/
theorem ideleTorsionDictionary
    {Af V Vsigma : Type*} [CommRing Af]
    [AddCommGroup V] [Module Af V] [AddCommGroup Vsigma] [Module Af Vsigma]
    (f : Afˣ) (sigmaTorsion : V → Vsigma) :
    ∃ alpha : V ≃ₗ[Af] Vsigma, ∀ x, alpha ((f : Af) • x) = sigmaTorsion x := by sorry
/-- V5 supplies sigmaTorsion, the comparison, the extended Weil pairings,
the transported integral lattice and cyclotomic unit. c is CM conjugation on Af.
Rhat is Zhat, embedded in Af; an Af-submodule would lose the integral lattice.
Their geometric and rational-representative identifications are omitted.
Both multipliers and the changed lattice/polarization are conclusions. -/
theorem polarizationReciprocityDictionary
    {Rhat Af V Vsigma : Type*} [CommRing Rhat] [CommRing Af] [Algebra ℚ Af]
    [Algebra Rhat Af] [AddCommGroup V] [Module Af V] [Module Rhat V]
    [IsScalarTower Rhat Af V] [AddCommGroup Vsigma] [Module Af Vsigma]
    (c : Af ≃ₐ[ℚ] Af) (f cyclotomic xi : Afˣ)
    (pair : V → V → Af) (sigmaPair : Vsigma → Vsigma → Af)
    (sigmaTorsion : V → Vsigma) (I sigmaI : Submodule Rhat V)
    (sigmaXi : Af) :
    ∃ alpha : V ≃ₗ[Af] Vsigma,
      (∀ x, alpha ((f : Af) • x) = sigmaTorsion x) ∧
      (∀ x y, sigmaPair (alpha x) (alpha y) =
        (cyclotomic : Af) * ((f⁻¹ : Afˣ) : Af) * c ((f⁻¹ : Afˣ) : Af) * pair x y) ∧
      (∀ x y, sigmaPair (sigmaTorsion x) (sigmaTorsion y) =
        (cyclotomic : Af) * pair x y) ∧
      sigmaI = I.map ((LinearMap.lsmul Af V (f : Af)).restrictScalars Rhat) ∧
      sigmaXi = (xi : Af) * (cyclotomic : Af) *
        ((f⁻¹ : Afˣ) : Af) * c ((f⁻¹ : Afˣ) : Af) := by sorry
/-- SC1/V8 supply the actual Siegel periods, symplectic row-basis comparison,
its similitude character and reduction at N; FN is their level-N function
field. regular is the local ring at tau, evaluation includes the coefficient
field action and act is its matrix action. Primitive/principal hypotheses and
these carrier identifications are omitted supplier conditions. The conclusion
retains the inverse matrix and the complete special-value equation. -/
theorem explicitLevelReciprocity
    {FN : Type*} [Field FN] (g N : ℕ) [NeZero N]
    (tau tau' : Matrix (Fin g) (Fin g) ℂ)
    (M : Matrix (Fin (2*g)) (Fin (2*g)) ℚ)
    (Mmod U : Matrix (Fin (2*g)) (Fin (2*g)) (ZMod N))
    (multiplier : Matrix (Fin (2*g)) (Fin (2*g)) ℚ → ℚ)
    (norm : ℚˣ) (regular : Subring FN) (f : regular)
    (evaluate : FN → Matrix (Fin g) (Fin g) ℂ → ℂ)
    (act : Matrix (Fin (2*g)) (Fin (2*g)) (ZMod N) → FN → FN)
    (Artin : ℂ ≃ₐ[ℚ] ℂ) :
    multiplier M = ((norm⁻¹ : ℚˣ) : ℚ) ∧
    Mmod * U = 1 ∧ U * Mmod = 1 ∧
    Artin (evaluate (f : FN) tau) = evaluate (act U f) tau' := by sorry

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
/-- Test TauCeti.CM.polarizedLevelStabilizer.test_quadratic_level_one.
The quadratic identity below is the native principal-norm compatibility,
with typeNorm identified as the identity ideal map. -/
example (hnorm : ∀ a u, principal u = typeNorm a → normCondition u = positiveNorm a)
    (a : G) : a ∈ polarizedLevelStabilizer typeNorm principal
      normCondition positiveNorm (⊤ : Subgroup U) ↔ typeNorm a ∈ principal.range := by sorry
/-- Test TauCeti.CM.polarizedLevelStabilizer.test_bad_generator: rejecting a
single bad generator is insufficient if a unit could correct it. This test
rejects membership only when EVERY principal level generator has wrong norm. -/
example (a : G)
    (hbad : ∀ u ∈ Hlevel, principal u = typeNorm a → normCondition u ≠ positiveNorm a) :
    a ∉ polarizedLevelStabilizer typeNorm principal normCondition positiveNorm Hlevel := by sorry

end polarizedLevelStabilizer
end Stabilizer

/-- GN7/GN11 identify C and D with reflex/original class groups, H with
the level-one polarized stabilizer modulo principal ideals, U with totally
positive real units and norms with norms of CM units. Their identifications
are omitted. This states the actual class-map obstruction, its injection,
exponent and cardinal bound; it does not infer removal of arbitrary units. -/
theorem reflexClassMap_unitObstruction
    {C D U : Type*} [CommGroup C] [CommGroup D] [CommGroup U]
    (r : C →* D) (H : Subgroup C) (norms : Subgroup U) (g : ℕ) :
    H ≤ r.ker ∧
    Nonempty ((r.ker ⧸ H.comap r.ker.subtype) ↪ (U ⧸ norms)) ∧
    (∀ x : U ⧸ norms, x ^ 2 = 1) ∧ Nat.card (U ⧸ norms) ≤ 2 ^ g := by sorry
/-- GAP CM2-moduli: the polarized-level stabilizer acts on its marked orbit
by the actual Artin reciprocity action. CFT12 gives its quotient. The native
quotient-action orbit identity uses Orbit as the actual marked orbit and
orbitMap as its canonical Artin orbit map. These supplier identifications
are omitted. The conclusion concerns the relative field and marked orbit. -/
theorem relativeCMModuliOrbit {K : Type*} [Field K] [Algebra K ℂ]
    (S : Set ℂ) {G : Type*} [CommGroup G] (H : Subgroup G)
    [FiniteDimensional K (IntermediateField.adjoin K S)]
    [IsGalois K (IntermediateField.adjoin K S)]
    {Orbit : Type*} [MulAction G Orbit] (point : Orbit)
    (orbitMap : G ⧸ H → Orbit)
    (Artin : G →* (IntermediateField.adjoin K S ≃ₐ[K] IntermediateField.adjoin K S)) :
    Function.Surjective Artin ∧ Artin.ker = H ∧
    Function.Bijective orbitMap ∧
    (∀ g, orbitMap (QuotientGroup.mk' H g) = g • point) ∧
    Module.finrank K (IntermediateField.adjoin K S) = Nat.card (G ⧸ H) := by sorry
/-- A0/A2/A6/EC5 supply the actual product A=E0×E0, its product
polarization, full End, Tate/torsion representations and ideal-isogeny degree.
Their identifications are omitted; π is the actual Frobenius at (5,i-3).
All observables are attached to that product, not an isolated polynomial. -/
theorem dimensionTwoCMExample
    (A : Over (Spec (.of CMType.gaussianField)))
    {End V : Type*} [Ring End] [AddCommGroup V] [Module ℂ V]
    (rhoFrob : V →ₗ[ℂ] V) (characteristicPolynomial : (V →ₗ[ℂ] V) → ℤ[X])
    (idealIsogeny : A ⟶ A) (degree : (A ⟶ A) → ℕ)
    (torsionFrob : (Fin 2 → Fin 2 → ZMod 3) → (Fin 2 → Fin 2 → ZMod 3))
    (weilMultiplier : ZMod 3) :
    Nonempty (End ≃+* Matrix (Fin 2) (Fin 2) CMType.gaussianField) ∧
    characteristicPolynomial rhoFrob = (X ^ 2 + C 2 * X + C 5) ^ 2 ∧
    degree idealIsogeny = 25 ∧ weilMultiplier = 2 ∧
    (∀ x k, torsionFrob x k 0 = -x k 0 - 2 * x k 1 ∧
      torsionFrob x k 1 = 2 * x k 0 - x k 1) := by sorry

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
lemma roots (classJ : ClassGroup R → ℂ) (hinjective : Function.Injective classJ)
    (z : ℂ) :
    ((classPolynomial classJ).IsRoot z ↔ ∃ c, classJ c = z) ∧
    (classPolynomial classJ).Separable := by sorry
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
omitted here. Integer coefficient descent is an output, as are integrality
of every singular value, separability and the order-specific class number. -/
theorem classPolynomial.integral (classJ : ClassGroup R → ℂ) :
    (∀ c, IsIntegral ℤ (classJ c)) ∧
    ∃ P : ℤ[X], P.map (Int.castRingHom ℂ) = classPolynomial classJ ∧
      P.Monic ∧ (classPolynomial classJ).Separable ∧
      P.natDegree = Fintype.card (ClassGroup R) := by sorry
/-- GAP CM3-reciprocity: the actual Artin element is supplied by CFT13/V5 and
acts by a^-1 on ideal classes. classJ uses the identity class as its origin;
Artin supplies extensions to C of the ring-class automorphisms, whose
identification is omitted. All root-action conclusions remain explicit. -/
theorem classPolynomial.galois (classJ : ClassGroup R → ℂ)
    (Artin : ClassGroup R → (ℂ ≃ₐ[ℚ] ℂ)) :
    (∀ a c, Artin a (classJ c) = classJ (a⁻¹ * c)) ∧
    (∀ c, star (classJ c) = classJ (c⁻¹)) ∧
    (∀ a c, Artin a (classJ c) = classJ c ↔ a = 1) ∧
    (∀ a, (classPolynomial classJ).map (Artin a).toAlgHom.toRingHom =
      classPolynomial classJ) := by sorry
end ClassPolynomials

/-- GAP CM3-CFT13: with K quadratic embedded in C, classJ the exact CM j,
and H the corresponding ring class field, CFT13 supplies the field comparison.
The primitive-generator equality is on native subfields; H is the actual
CFT13 ring class field. classJ, P and H have their actual order/class-polynomial
identifications as omitted supplier conditions; the field, degree and
splitting/irreducibility conclusions are retained. -/
theorem classPolynomial.ringClassField (K : Type*) [Field K] [Algebra K ℂ]
    {R : Type*} [CommRing R] [IsDomain R] [Fintype (ClassGroup R)]
    (classJ : ClassGroup R → ℂ) (c : ClassGroup R) (P : K[X])
    (H : IntermediateField K ℂ) [FiniteDimensional K H] :
    IntermediateField.adjoin K {classJ c} = H ∧
    IntermediateField.adjoin K (Set.range classJ) = H ∧
    Module.finrank K H = Fintype.card (ClassGroup R) ∧
    Irreducible P ∧ (P.map (algebraMap K H)).Splits := by sorry

section CMValues
variable {K FN Point : Type*} [Field K] [Algebra K ℂ] [Field FN]
/-- MO/MF14/V8 supply the actual modular-function field FN, CM point tau,
and its regular local ring regular tau. Evaluation is defined on that ring,
so its ENTIRE range, rather than a chosen function's value, is adjoined.
The unavailable moduli/regularity identifications are omitted conditions. -/
def cmValueField (tau : Point) (regular : Point → Subring FN)
    (evaluation : ∀ tau, regular tau →+* ℂ) : IntermediateField K ℂ :=
  IntermediateField.adjoin K (Set.range (evaluation tau))
namespace cmValueField
variable (tau : Point) (regular : Point → Subring FN)
  (evaluation : ∀ tau, regular tau →+* ℂ)
lemma contains (f : regular tau) : evaluation tau f ∈
    cmValueField (K := K) tau regular evaluation := by sorry
lemma le_iff (F : IntermediateField K ℂ) :
    cmValueField tau regular evaluation ≤ F ↔
      ∀ f : regular tau, evaluation tau f ∈ F := by sorry
/-- The supplied embedding is the natural level-N to level-M function-field
embedding (N|M), with regular local rings/evaluation respected. -/
lemma level_inclusion {FM : Type*} [Field FM]
    (regularM : Point → Subring FM) (evaluationM : ∀ tau, regularM tau →+* ℂ)
    (levelMap : regular tau →+* regularM tau)
    (h : (evaluationM tau).comp levelMap = evaluation tau) :
    cmValueField (K := K) tau regular evaluation ≤ cmValueField tau regularM evaluationM := by sorry
lemma no_poles (f : FN) (hpole : f ∉ regular tau) :
    ¬ ∃ admitted : regular tau, (admitted : FN) = f := by sorry
/-- Test TauCeti.CM.cmValueField.test_level_one: the actual level-one regular
ring has j as a generator over the reflex field. Its supplier identification
with the elliptic level-one local ring is omitted, not the equality. -/
example (j : regular tau)
    (hgenerate : ∀ f : regular tau,
      evaluation tau f ∈ IntermediateField.adjoin K {evaluation tau j}) :
    cmValueField (K := K) tau regular evaluation =
      IntermediateField.adjoin K {evaluation tau j} := by sorry
/-- Test TauCeti.CM.cmValueField.test_pole: a quotient with nonzero numerator
value and zero denominator value cannot be admitted by this local evaluator. -/
example (numerator denominator : regular tau)
    (hn : evaluation tau numerator ≠ 0) (hd : evaluation tau denominator = 0)
    (hden : (denominator : FN) ≠ 0) :
    (numerator : FN) / (denominator : FN) ∉ regular tau ∧
    ¬ ∃ admitted : regular tau,
      (admitted : FN) = (numerator : FN) / (denominator : FN) := by sorry
/-- Test TauCeti.CM.cmValueField.test_gaussian_ray3. GAP CFT13/V8: tau is
Gaussian, regular/evaluation are level 3 and ray3 is the actual modulus-3 ray
class field. Their identifications are omitted. This compares that actual
value field and ray extension with the insufficient level-one Gaussian j. -/
example (ray3 : IntermediateField CMType.gaussianField ℂ)
    [FiniteDimensional CMType.gaussianField ray3] :
    cmValueField (K := CMType.gaussianField) tau regular evaluation = ray3 ∧
    Module.finrank CMType.gaussianField ray3 = 2 ∧
    IntermediateField.adjoin CMType.gaussianField {(1728 : ℂ)} = ⊥ ∧
    IntermediateField.adjoin CMType.gaussianField {(1728 : ℂ)} < ray3 := by sorry
end cmValueField
end CMValues

/-- GAP CFT12/V8: G is the prime-to-NF reflex ideal group, H the actual
polarized-level stabilizer, rayField the modulus-NF ray field, and Artin the
restriction to M_N of action. Their arithmetic/moduli identifications are
omitted. The general conclusion retains containment, the exact Artin quotient
and the finite-family generation criterion. -/
theorem cmValueField.rayClassField {K FN Point : Type*}
    [Field K] [Algebra K ℂ] [Field FN]
    (tau : Point) (regular : Point → Subring FN)
    (evaluation : ∀ tau, regular tau →+* ℂ) (rayField : IntermediateField K ℂ)
    {G : Type*} [CommGroup G] (H : Subgroup G)
    (action : G →* (ℂ ≃ₐ[K] ℂ))
    (Artin : G →* (cmValueField (K := K) tau regular evaluation ≃ₐ[K]
      cmValueField (K := K) tau regular evaluation)) (family : Finset (regular tau)) :
    cmValueField (K := K) tau regular evaluation ≤ rayField ∧
    Function.Surjective Artin ∧ Artin.ker = H ∧
    Nonempty ((G ⧸ H) ≃* (cmValueField (K := K) tau regular evaluation ≃ₐ[K]
      cmValueField (K := K) tau regular evaluation)) ∧
    (IntermediateField.adjoin K (evaluation tau '' (family : Set (regular tau))) =
      cmValueField (K := K) tau regular evaluation ↔
        ∀ g, (∀ f ∈ family, action g (evaluation tau f) = evaluation tau f) ↔ g ∈ H) := by sorry
/-- Maximal quadratic specialization: CFT13 identifies rayField as the
modulus-N ray field, and the type norm and polarized norm condition simplify
H(N) to the ray principal subgroup. These identifications are omitted. -/
theorem cmValueField.rayClassField_quadratic {K FN Point : Type*}
    [Field K] [Algebra K ℂ] [Field FN]
    (tau : Point) (regular : Point → Subring FN)
    (evaluation : ∀ tau, regular tau →+* ℂ) (rayField : IntermediateField K ℂ) :
    cmValueField tau regular evaluation = rayField := by sorry
/-- Complete Gaussian example uses the lattice-to-curve constructor, actual
proper classes, all level-3 values and the actual modulus-3 extension.
GN11/A5/MO/CFT13 supply their identifications, omitted here. primeFiveMap
is the ideal isogeny of (2+i) on the constructed Gaussian curve; its degree
function and Artin root action are the actual EC1/CFT13 data. -/
theorem gaussianRingClassExample {FN Point : Type*} [Field FN]
    [Fintype (ClassGroup (NumberField.RingOfIntegers CMType.gaussianField))]
    (classJ : ClassGroup (NumberField.RingOfIntegers CMType.gaussianField) → ℂ)
    (tau : Point) (regular : Point → Subring FN)
    (evaluation : ∀ tau, regular tau →+* ℂ)
    (ray3 : IntermediateField CMType.gaussianField ℂ)
    (A : Over (Spec (.of CMType.gaussianField)))
    (primeFiveMap : A ⟶ A) (degree : (A ⟶ A) → ℕ)
    (Artin : ClassGroup (NumberField.RingOfIntegers CMType.gaussianField) →
      (ℂ ≃ₐ[ℚ] ℂ))
    [FiniteDimensional CMType.gaussianField ray3] :
    (idealLatticeCurve CMType.gaussianField.val
      (1 : (FractionalIdeal (NumberField.RingOfIntegers CMType.gaussianField)⁰ CMType.gaussianField)ˣ)).j = 1728 ∧
    classPolynomial classJ = X - C 1728 ∧
    Fintype.card (ClassGroup (NumberField.RingOfIntegers CMType.gaussianField)) = 1 ∧
    Nat.card (NumberField.RingOfIntegers CMType.gaussianField)ˣ = 4 ∧
    degree primeFiveMap = 5 ∧
    (∀ a, Artin a (1728 : ℂ) = 1728) ∧
    IntermediateField.adjoin CMType.gaussianField {(1728 : ℂ)} = ⊥ ∧
    cmValueField (K := CMType.gaussianField) tau regular evaluation = ray3 ∧
    Module.finrank CMType.gaussianField ray3 = 2 ∧
    IntermediateField.adjoin CMType.gaussianField {(1728 : ℂ)} < ray3 := by sorry

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
    (U_conductor U_m : Subgroup kˣ)
    (h : ∀ a : U_m, ∀ ha : toPrincipalIdeal R k (a : kˣ) ∈ G,
      cmHeckeCharacter (E := E) G A ⟨toPrincipalIdeal R k (a : kˣ), ha⟩ =
        norm (a : kˣ)) :
    (∀ a : U_conductor, ∀ ha : toPrincipalIdeal R k (a : kˣ) ∈ G,
      cmHeckeCharacter (E := E) G A ⟨toPrincipalIdeal R k (a : kˣ), ha⟩ =
        norm (a : kˣ)) ∧ conductor ∣ m := by sorry
/-- GAP CM4-baseChange: the norm is the actual ideal norm for k'/k and ψ'
is the character of A_k'. The least modulus is recalculated, not simply copied.
Their equality has this native homomorphism shape once A0/EC5/GN9 are supplied. -/
lemma baseChange {G' : Type*} [CommGroup G'] (norm : G' →* G) (psi' : G' →* Eˣ) :
    psi' = (cmHeckeCharacter G A).comp norm := by sorry
/-- Test TauCeti.CM.cmHeckeCharacter.test_ideal_type: ideal and idelic
components of this constructed character are compared, not arbitrary units.
GN9 identifies ideleComponent with its actual local avatar (omitted condition). -/
example (a : kˣ) (ha : toPrincipalIdeal R k a ∈ G) (embedding : E →ₐ[ℚ] ℂ)
    (ideleComponent : kˣ →* ℂˣ) :
    embedding (cmHeckeCharacter (E := E) G A ⟨toPrincipalIdeal R k a, ha⟩ : E) *
      (ideleComponent a : ℂ) = 1 := by sorry
/-- Test TauCeti.CM.cmHeckeCharacter.test_nonunit. GAP EC1/EC5/GN9:
A is the base change of y²=x³-x to Q(i), E is its specified CM field,
embedding is the standard Gaussian embedding and v=(5,i-3). The omitted
identifications bind the actual constructor and place. -/
example (embedding : E →ₐ[ℚ] ℂ) (v : G) :
    embedding (cmHeckeCharacter (E := E) G A v : E) = -1 + 2 * Complex.I ∧
    ¬ IsIntegral ℤ
      ((cmHeckeCharacter (E := E) G A v : E)⁻¹) := by sorry
/-- Test TauCeti.CM.cmHeckeCharacter.test_inert_baseChange. The same actual
curve and embedding, with v=(7) over Q(i), have residue norm 49, not 7.
These model/place identifications are the omitted EC5/GN9 adapter. -/
example (embedding : E →ₐ[ℚ] ℂ) (v : G) :
    embedding (cmHeckeCharacter (E := E) G A v : E) = -7 ∧
    (embedding (cmHeckeCharacter (E := E) G A v : E)).normSq = 49 := by sorry

end cmHeckeCharacter
end Hecke

/-- EC5/FA10/GN3 supply Eell=E⊗Qell (a PRODUCT coefficient algebra),
V=Vell(A), Emb the full embedding census and rho its scalar extension.
GN9 supplies the actual avatars. The unavailable carrier/continuity
identifications are omitted. The conclusion includes the representation
comparison, not just its dimension. -/
theorem cmTateComponents
    {Qell Eell Qbar V Emb G : Type*}
    [Field Qell] [CommRing Eell] [Algebra Qell Eell] [FiniteDimensional Qell Eell]
    [Field Qbar] [Algebra Qell Qbar] [Fintype Emb] [Group G]
    [AddCommGroup V] [Module Eell V] [Module Qell V] [IsScalarTower Qell Eell V]
    (rho : G →* ((Qbar ⊗[Qell] V) ≃ₗ[Qbar] (Qbar ⊗[Qell] V)))
    (avatar : Emb → G →* Qbarˣ) :
    Nonempty (V ≃ₗ[Eell] Eell) ∧
    Module.finrank Qell V = Module.finrank Qell Eell ∧
    ∃ split : (Qbar ⊗[Qell] V) ≃ₗ[Qbar] (Emb → Qbar),
      ∀ g x i, split (rho g x) i = (avatar i g : Qbar) * split x i := by sorry
/-- EC5/GN9 supply the actual good-place Frobenius, full embedding census,
characteristic polynomial and component algebraic infinity exponents.
All supplier identifications/good-place conditions are omitted; purity is a
conclusion about cmHeckeCharacter, not an assumed equation. -/
theorem cmFrobeniusIdentities
    {R k E Qbar : Type*} [CommRing R] [IsDomain R]
    [Field k] [Algebra R k] [IsFractionRing R k]
    [Field E] [Algebra ℚ E] [NumberField E]
    [Field Qbar] [Algebra ℚ Qbar] [Fintype (E →ₐ[ℚ] Qbar)]
    (G : Subgroup ((FractionalIdeal R⁰ k)ˣ))
    (A : Over (Spec (.of k))) [GrpObj A] [IsProper A.hom] [GeometricallyIntegral A.hom]
    (c : E ≃ₐ[ℚ] E) (v : G) (q : ℕ) (pi : E)
    (tatePolynomial : Qbar[X]) (Phi : CMType E)
    (reflexNorm : kˣ →* Eˣ)
    (ideleInfinityComponent : (E →ₐ[ℚ] ℂ) → kˣ → ℂ) :
    pi = (cmHeckeCharacter (E := E) G A v : E) ∧
    pi * c pi = q ∧
    (∀ tau : E →ₐ[ℚ] ℂ, ‖tau pi‖ = Real.sqrt q) ∧
    tatePolynomial = ∏ tau : E →ₐ[ℚ] Qbar, (X - C (tau pi)) ∧
    (∀ tau a, ideleInfinityComponent tau a * tau (reflexNorm a : E) = 1) := by sorry
/-- R11.5 supplies every local determinant on inertia invariants and its
H1-dual/geometric versus Tate/arithmetic comparison; GN9 supplies rank-one
factors, conductors and the actual L-functions. finiteInertia is the actual
CM finite inertia image, not assumed factorization. Their carrier
identifications are omitted. Bad factors and their exponents are conclusions. -/
theorem ellipticCMLFactorization
    {R Place : Type*} [CommRing R] [IsDomain R]
    (Pcurve Ppsi Pconjugate : Place → ℂ[X])
    (unramified : Set Place) (frobenius : Place → ℂ)
    (Lcurve Lpsi Lconjugate : ℂ → ℂ)
    (exponentCurve exponentPsi exponentConjugate : Place → ℕ)
    (conductorCurve conductorPsi : Ideal R) :
    (∀ v, Pcurve v = Ppsi v * Pconjugate v) ∧
    (∀ v ∈ unramified, Ppsi v = 1 - C (frobenius v) * X) ∧
    (∀ v ∉ unramified, Ppsi v = 1) ∧
    (∀ s, 3/2 < s.re → Lcurve s = Lpsi s * Lconjugate s) ∧
    (∀ v, exponentCurve v = exponentPsi v + exponentConjugate v ∧
      exponentPsi v = exponentConjugate v) ∧
    conductorCurve = conductorPsi ^ 2 := by sorry
/-- EC5/R11.4/GN9/AGR01.5 identify V with the actual rational CM Tate
module, Vind with the actual induced character module and Vtheta with the
weight-two CM newform module. These identifications (including restriction
and self-twist) are omitted supplier conditions. We state actual intertwiners. -/
theorem cmInductionComparison
    {F G V Vind Vtheta : Type*} [Field F] [Group G]
    [AddCommGroup V] [Module F V] [AddCommGroup Vind] [Module F Vind]
    [AddCommGroup Vtheta] [Module F Vtheta]
    (rho : G →* (V ≃ₗ[F] V)) (induced : G →* (Vind ≃ₗ[F] Vind))
    (theta : G →* (Vtheta ≃ₗ[F] Vtheta)) (chiK : G →* Fˣ) :
    (∃ e : V ≃ₗ[F] Vind, ∀ g x, e (rho g x) = induced g (e x)) ∧
    (∃ e : V ≃ₗ[F] Vtheta, ∀ g x, e (rho g x) = theta g (e x)) ∧
    (∃ e : V ≃ₗ[F] V, ∀ g x, e (rho g x) = (chiK g : F) • rho g (e x)) := by sorry
/-- EC5/GN3 identifies F=Fell, T=O/ell O and V=A[ell], free rank one over T;
Cartan is its multiplication-unit subgroup and chiK is the actual CM quadratic
character. Oddness/unramified-order, rank-one and carrier identifications are
omitted. The concrete semilinearity input is weaker than the conclusion. -/
theorem cmResidualCartanNormalizer
    {F T V G : Type*} [Field F] [CommRing T] [Algebra F T]
    [AddCommGroup V] [Module T V] [Module F V] [IsScalarTower F T V]
    [Group G] [DecidableEq F] (rho : G →* (V ≃ₗ[F] V))
    (c : T ≃ₐ[F] T) (chiK : G →* Fˣ)
    (Cartan : Subgroup (V ≃ₗ[F] V))
    (trace : (V ≃ₗ[F] V) → F)
    (hcompatible : ∀ g a x, rho g (a • x) =
      (if chiK g = 1 then a else c a) • rho g x) :
    rho.range ≤ Subgroup.normalizer (Cartan : Set (V ≃ₗ[F] V)) ∧
    (∀ g, chiK g = 1 → rho g ∈ Cartan) ∧
    (∀ g, rho g ∉ Cartan → trace (rho g) = 0) ∧
    (∀ g, rho g ∉ Cartan → ∃ a : Fˣ,
      ∀ x, rho g (rho g x) = (a : F) • x) := by sorry

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
/-- Test TauCeti.CM.IsCanonicalGrossCharacter.test_inert_unramified:
apply the canonical predicate itself to the actual inert prime, rather than
an unrelated natural-number support condition. GN3 identifies P (omitted). -/
example (hcanonical : IsCanonicalGrossCharacter psi c principal alpha f discriminant)
    (P : Ideal R) [P.IsPrime] (hunramified : ¬ P ∣ discriminant) : ¬ P ∣ f := by sorry
/-- Test TauCeti.CM.IsCanonicalGrossCharacter.test_even_excluded: Gaussian
D=4 has unit i, whose principal ideal is 1; the canonical principal-sign law
would force 1=±i. u, alpha and principal are the actual Gaussian unit/input
maps, identified by the omitted GN3/GN9 adapter. -/
example (u : U) (hu : principal u = 1) (halpha : (alpha u : ℂ) = Complex.I) :
    ¬ IsCanonicalGrossCharacter psi c principal alpha f discriminant := by sorry

end IsCanonicalGrossCharacter
end CanonicalGross

/-- GN9/BKO identify psi with an actual canonical character, psiH with
its Hilbert-field pullback, and A with the corresponding Gross curve. R is
the local integer DVR at any H-prime above the specified inert p≥5, p∤hK.
R11.5 supplies genericFiber and the reduction model interface. Odd fundamental
discriminant, field/place, conductor, CM-realization and base-change
identifications are omitted supplier conditions. The conclusion constructs a
proper smooth model, hence gives good reduction at every such place. -/
theorem canonicalGrossGoodReduction
    {G GH U R : Type*} [CommGroup G] [CommGroup GH] [CommGroup U] [CommRing R]
    {H : Type*} [Field H]
    (A : Over (Spec (.of H))) (genericFiber : Over (Spec (.of R)) → Over (Spec (.of H)))
    (psi : G →* ℂˣ) (psiH : GH →* ℂˣ) (normHK : GH →* G)
    (conjugateIdeal : G ≃* G)
    (principal : U →* G) (alpha : U →* ℂˣ) (f discriminant : Ideal R)
    (hcanonical : IsCanonicalGrossCharacter psi conjugateIdeal principal alpha f discriminant) :
    psiH = psi.comp normHK ∧
    (∀ a, (psi (conjugateIdeal a) : ℂ) = conj (psi a : ℂ)) ∧
    ∃ model : Over (Spec (.of R)), IsProper model.hom ∧ Smooth model.hom ∧
      Nonempty (genericFiber model ≅ A) := by sorry

/-! CM.5 imports actual geometric End, ordinary/supersingular special
fibers, quaternion orders and graph carriers from EC1/EC3/A6/GN3/CN3.
The following unbundled native parameters retain those carriers' mathematical
conclusions. Their precise supplier identifications are omitted conditions.
No arithmetic identity substitutes for the geometric theorem. -/

/-- Q indexes ALL imaginary-quadratic orders with p split and conductor
prime to p; B is B_(p,infinity); maximalOrders is its integral maximal-order
subset. Their GN3 identifications and the geometric End/supersingular
identifications are omitted. The theorem covers all p>0, including 2 and 3. -/
theorem deuringClassification
    {k Q B : Type*} [Field k] [Ring B] (p : ℕ) [CharP k p] (hp : p.Prime)
    (W : WeierstrassCurve k)
    (geometricEnd : WeierstrassCurve k → Type*) [∀ W, Ring (geometricEnd W)]
    (quadraticField : Q → Type*) [∀ q, Field (quadraticField q)]
    (quadraticOrder : ∀ q, Subring (quadraticField q))
    (maximalOrders : Set (Subring B)) (supersingular : Set (WeierstrassCurve k)) :
    (Nonempty (geometricEnd W ≃+* ℤ) ∨
      (∃ q, Nonempty (geometricEnd W ≃+* quadraticOrder q)) ∨
      (∃ O ∈ maximalOrders, Nonempty (geometricEnd W ≃+* O))) ∧
    (W ∈ supersingular ↔ ∃ O ∈ maximalOrders, Nonempty (geometricEnd W ≃+* O)) ∧
    (Finite k → ¬ Nonempty (geometricEnd W ≃+* ℤ)) := by sorry
/-- Deuring §8 realizes every conjugacy type over an algebraic closure;
maximalOrders and geometricEnd have the same supplied identifications. -/
theorem deuringClassification.realization
    {k B : Type*} [Field k] [IsAlgClosed k] [Ring B]
    (p : ℕ) [CharP k p] (hp : p.Prime)
    (geometricEnd : WeierstrassCurve k → Type*) [∀ W, Ring (geometricEnd W)]
    (maximalOrders : Set (Subring B)) (supersingular : Set (WeierstrassCurve k)) :
    ∀ O ∈ maximalOrders, ∃ W ∈ supersingular, Nonempty (geometricEnd W ≃+* O) := by sorry
/-- Wred is the actual potential-good special fiber of the full CM curve,
O its full order and reduction its ring map. EC1/R11.5/GN3 identify all these
parameters, ordinary/supersingular, splitPrimes, f and reducedConductor;
those conditions are omitted. The quaternion order is geometric, not End_k. -/
theorem cmReductionDictionary
    {k fq End B : Type*} [Field k] [Field fq] [Ring End] [Ring B]
    (p f : ℕ) [CharP fq p] (hp : p.Prime)
    (W : WeierstrassCurve k) (Wred : WeierstrassCurve fq)
    {O : Type*} [CommRing O] (reduction : O →+* End)
    (ordinary supersingular : Set (WeierstrassCurve fq)) (splitPrimes : Set ℕ)
    (reducedConductor : ℕ) (maximalOrder : Subring B) :
    Function.Injective reduction ∧
    (Wred ∈ ordinary ↔ p ∈ splitPrimes) ∧
    (Wred ∈ supersingular ↔ p ∉ splitPrimes) ∧
    (Wred ∈ ordinary → reducedConductor = f / p ^ f.factorization p) ∧
    (Wred ∈ supersingular → Nonempty (End ≃+* maximalOrder)) := by sorry
/-- R11.5 supplies the local extension and generic-fiber functor. A is the
base change of the actual CM curve to that extension. Integrality of its CM j
is supplied by CM.3; the field/local-place and base-change adapters are omitted. -/
theorem cmReductionDictionary.potentialGoodReduction
    {R L : Type*} [CommRing R] [Field L]
    (A : Over (Spec (.of L))) (genericFiber : Over (Spec (.of R)) → Over (Spec (.of L))) :
    ∃ model : Over (Spec (.of R)), IsProper model.hom ∧ Smooth model.hom ∧
      Nonempty (genericFiber model ≅ A) := by sorry
/-- V5 supplies actual Frobenius and the clean unramified/maximal-order
hypotheses. GN3/GN8 identify H_v and the transported selected embeddings,
local valuations, local ideal norms and the reflex ideal norm. They are
omitted conditions. The actual slope/ideal equalities are conclusions. -/
theorem shimuraTaniyamaDictionary
    {Emb Places Ideals E : Type*} [Fintype Emb] [DecidableEq Emb] [CommMonoid Ideals] [CommRing E]
    (Phi : Finset Emb) (Hv : Places → Finset Emb)
    (slope : Places → ℚ) (ord : Places → E → ℤ) (pi q : E)
    (principal : E → Ideals) (localNorm : Emb → Ideals) (reflexNorm : Ideals) :
    principal pi = ∏ phi ∈ Phi, localNorm phi ∧ principal pi = reflexNorm ∧
    ∀ v, 0 < (Hv v).card →
      slope v = (ord v pi : ℚ) / ord v q ∧
      slope v = ((Phi ∩ Hv v).card : ℚ) / (Hv v).card := by sorry
/-- Lift a SPECIFIED nonzero endomorphism, with an integral good model
and, in the nonscalar case, imaginary-quadratic rational End. EC1/R11.5
identify curveScheme, integerScalar, rationalEnd and the specialization maps
with their actual scheme operations; A6 supplies the rational End ring and
CM comparison. Those supplier identifications are omitted conditions.
The good integral model, residue identification and reduction of the specified
pair are existential conclusions; no full quaternion-ring lift is asserted. -/
theorem deuringLifting
    {fq : Type} [Field fq] [Fintype fq]
    (A : Over (Spec (.of fq))) (alpha : A ⟶ A)
    (integerScalar : ∀ {k : Type} [Field k] (B : Over (Spec (.of k))), ℤ → (B ⟶ B))
    (hnonzero : alpha ≠ integerScalar A 0)
    (curveScheme : ∀ {L : Type} [Field L], WeierstrassCurve L → Over (Spec (.of L)))
    (rationalEnd : ∀ {L : Type} [Field L], Over (Spec (.of L)) → Type)
    (specialize : ∀ {L : Type} [Field L] [NumberField L],
      Ideal (NumberField.RingOfIntegers L) → Over (Spec (.of L)) → Over (Spec (.of fq)))
    (specializeEnd : ∀ {L : Type} [Field L] [NumberField L]
      (P : Ideal (NumberField.RingOfIntegers L)) (Astar : Over (Spec (.of L))),
      (Astar ⟶ Astar) → (specialize P Astar ⟶ specialize P Astar)) :
    ∃ (L : Type) (fieldL : Field L), letI := fieldL
      ∃ (numberFieldL : NumberField L), letI := numberFieldL
        ∃ (P : Ideal (NumberField.RingOfIntegers L)) (_ : P.IsMaximal)
          (Astar : Over (Spec (.of L))) (alphaStar : Astar ⟶ Astar),
          (∃ Wstar : WeierstrassCurve (NumberField.RingOfIntegers L),
            Wstar.Δ ∉ P ∧ Nonempty (Astar ≅ curveScheme (Wstar.baseChange L))) ∧
          Nonempty ((NumberField.RingOfIntegers L ⧸ P) ≃+* fq) ∧
          (∃ e : specialize P Astar ≅ A,
            specializeEnd P Astar alphaStar ≫ e.hom = e.hom ≫ alpha) ∧
          ((∀ n : ℤ, alpha ≠ integerScalar A n) →
            ∃ (K : Type) (fieldK : Field K), letI := fieldK
              ∃ (numberFieldK : NumberField K) (_ : NumberField.IsCMField K)
                (ringEnd : Ring (rationalEnd Astar)), letI := ringEnd
                  Module.finrank ℚ K = 2 ∧ Nonempty (rationalEnd Astar ≃+* K)) := by sorry
/-- EC3/CN3 supply the actual ordinary volcano edges and endpoints; GN11
supplies the full endomorphism conductors and the norm-l proper ideals.
Those identifications and l≠p are omitted. j records the special j
class of the corresponding characteristic-zero CM lift, so its exceptional
unit cases label the geometric ordinary automorphism weights. The horizontal
ideal bijection and three order changes are conclusions. -/
theorem cmIsogenyGraphDictionary
    {R K Vertices Edges : Type*} [CommRing R] [IsDomain R]
    [Field K] [Algebra R K] [IsFractionRing R K]
    (source target : Edges → Vertices) (conductor : Vertices → ℕ)
    (horizontal : Set Edges) (normEll : Set ((FractionalIdeal R⁰ K)ˣ))
    (ell : ℕ) (symbol : ℤ) (vertex : Vertices)
    (j : Vertices → ℂ) (automorphismWeight : Vertices → ℕ) :
    Nonempty ({e : horizontal // source e = vertex} ≃ normEll) ∧
    (Nat.card {e : horizontal // source e = vertex} : ℤ) = 1 + symbol ∧
    (∀ e, conductor (target e) = conductor (source e) ∨
      ell * conductor (target e) = conductor (source e) ∨
      conductor (target e) = ell * conductor (source e)) ∧
    (∀ v, automorphismWeight v = if j v = 0 then 6 else if j v = 1728 then 4 else 2) := by sorry
/-- GN3/A6 identify B=B_(p,infinity), Ocurve with full geometric End(A)
and Olevel with endomorphisms preserving the actual cyclic prime-to-p level
subgroup. GZ III §7's Eichler hypotheses, optimal CM embedding, and the
reduced-discriminant function are omitted supplier conditions. -/
theorem supersingularLevelOrderComparison
    {B EndCurve EndPair : Type*} [Ring B] [Ring EndCurve] [Ring EndPair]
    (p N : ℕ) (Ocurve Olevel : Subring B)
    (maximalOrders eichlerOrders : Set (Subring B))
    (reducedDiscriminant : Subring B → ℕ) :
    Nonempty (EndCurve ≃+* Ocurve) ∧ Ocurve ∈ maximalOrders ∧
    reducedDiscriminant Ocurve = p ∧
    Nonempty (EndPair ≃+* Olevel) ∧ Olevel ∈ eichlerOrders ∧
    reducedDiscriminant Olevel = N * p := by sorry

/-- The coefficient bound B=ceil ∏(1+M_i) follows from the actual root bounds;
CN4 supplies rigorous j tail bounds M_i=exp(pi sqrt(|D|)/a_i)+2114.567.
This native polynomial coefficient inequality does not posit the algorithm output. -/
theorem classPolynomialHeightBound {J : Type*} [Fintype J]
    (roots : J → ℂ) (M : J → ℝ) (hM : ∀ i, ‖roots i‖ ≤ M i) (k : ℕ) :
    ‖(∏ i : J, (X - C (roots i))).coeff k‖ ≤ ∏ i : J, (1 + M i) := by sorry
/-- The analytic part of the same height target. D<0 and (a,b,c) is the
actual reduced primitive positive form of discriminant D, with a>0; j is
the normalized modular j supplier. These unavailable form/evaluator
identifications are omitted, while the exact constant and coefficient
ceiling remain conclusions. No GRH input is used. -/
theorem classPolynomialHeightBound.cm {J : Type*} [Fintype J]
    (D : ℤ) (hD : D < 0) (a : J → ℕ) (ha : ∀ i, 0 < a i)
    (b : J → ℤ) (j : ℂ → ℂ) (k : ℕ) :
    let tau := fun i => ((-(b i : ℂ)) + Complex.I * (Real.sqrt |(D : ℝ)| : ℂ)) /
      (2 * (a i : ℂ))
    let M := fun i => Real.exp (Real.pi * Real.sqrt |(D : ℝ)| / (a i : ℝ)) +
      (2114567 : ℝ) / 1000
    (∀ i, ‖j (tau i)‖ ≤ M i) ∧
    ‖(∏ i : J, (X - C (j (tau i)))).coeff k‖ ≤
      (Int.ceil (∏ i : J, (1 + M i)) : ℝ) := by sorry

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
  /- GN11/A5 identifies this actual embedded quadratic order and its normalized
  classValue. The certificate binds the entire root census intrinsically. -/
  order : Subring ℂ
  census : J ≃ ClassGroup order
  classValue : ClassGroup order → ℂ
  rootClassValue : ∀ i, root i = classValue (census i)
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
/-- Every actual proper ideal class appears, through this certificate's
own complete census; a bijection with an unrelated finite type is insufficient. -/
lemma roots_complete (c : ClassGroup cert.order) :
    ∃ i : J, cert.census i = c ∧ root i = cert.classValue c := by sorry

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
example (hlo : (cert.coefficientBoxes 0).1.fst = -17281 / 10)
    (hhi : (cert.coefficientBoxes 0).1.snd = -17279 / 10) : P.coeff 0 = -1728 := by sorry
/-- Test TauCeti.CM.ComplexClassPolynomialCertificate.test_boundary:
this two-integer interval cannot occur in an accepted certificate. -/
example : ¬ ∃ cert : ComplexClassPolynomialCertificate root P,
    (cert.coefficientBoxes 0).1.fst = -1728 ∧
    (cert.coefficientBoxes 0).1.snd = -1727 := by sorry
/-- Test TauCeti.CM.ComplexClassPolynomialCertificate.test_missing_class:
a singleton list cannot certify the TWO proper classes of Z+3Zi.
This tests the certificate's own order/census, not Fin1 versus Fin2 alone. -/
example (root : Fin 1 → ℂ) (P : ℤ[X]) :
    ¬ ∃ cert : ComplexClassPolynomialCertificate root P,
      Nonempty (cert.order ≃+* gaussianOrderThree) := by sorry

end ComplexClassPolynomialCertificate

/-- CN4 supplies outward root/product boxes at increasing precision and
convergence of their widths. These are checked containment/width conditions,
not an assertion of eventual algorithm success. The algorithm's runAt
identification with CN4 unique-integer recovery is an omitted supplier
condition. Soundness, a finite successful precision, and the quantitative
whole-product error bound are conclusions. -/
theorem complexClassPolynomial_sound_terminates {J : Type*} [Fintype J]
    (root : J → ℂ) (P H : ℤ[X])
    (cert : ComplexClassPolynomialCertificate root P)
    (hintegral : H.map (Int.castRingHom ℂ) = ∏ i : J, (X - C (root i)))
    (coefficientOracle : ℕ → ℕ → NonemptyInterval ℚ × NonemptyInterval ℚ)
    (henclose : ∀ n k, (∏ i : J, (X - C (root i))).coeff k ∈
      complexBoxSet (coefficientOracle n k))
    (hshrink : ∀ eps : ℚ, 0 < eps → ∃ N, ∀ n ≥ N, ∀ k ≤ Fintype.card J,
      (coefficientOracle n k).1.snd - (coefficientOracle n k).1.fst < eps)
    (runAt : ℕ → Option ℤ[X])
    (M delta : ℝ) (centers : J → ℂ)
    (hM : ∀ i, ‖root i‖ ≤ M) (hdelta : 0 ≤ delta ∧ delta ≤ 1)
    (herror : ∀ i, ‖centers i - root i‖ ≤ delta) :
    P = H ∧
    (∃ n, runAt n = some H ∧
      ∀ k ≤ Fintype.card J,
        Int.ceil (coefficientOracle n k).1.fst = Int.floor (coefficientOracle n k).1.snd) ∧
    (∀ k, ‖(∏ i : J, (X - C (centers i))).coeff k -
      (∏ i : J, (X - C (root i))).coeff k‖ ≤
        Fintype.card J * delta * (1 + M + delta) ^ (Fintype.card J - 1)) ∧
    (0 < Fintype.card J → 0 ≤ M →
      delta < 1 / (4 * Fintype.card J * (2 + M) ^ (Fintype.card J - 1)) →
      ∀ k, ‖(∏ i : J, (X - C (centers i))).coeff k -
        (∏ i : J, (X - C (root i))).coeff k‖ < 1 / 4) := by sorry

/-- The discriminants tested for EVERY prime power, Endo v2 Corollary 4. -/
def ordinaryRelationD1 (v : ℕ) (DK : ℤ) (rk : ℕ × ℕ) : ℤ :=
  ((v / rk.1 ^ (v.factorization rk.1 - rk.2 + 1) : ℕ) : ℤ) ^ 2 * DK
def ordinaryRelationD2 (DK : ℤ) (rk : ℕ × ℕ) : ℤ := (rk.1 : ℤ) ^ (2 * rk.2) * DK

/-- classCount is GN11's exact signed relation count in the order of
specified discriminant; curveCount and climb are CN3's independently
certified isogeny-walk and small-prime climbing computations on W.
splitPrimes is GN3's splitting set for DK. Their exact algorithm/carrier
identifications are omitted supplier conditions. They are IMMUTABLE inputs,
so the record cannot replace computed counts with claimed numbers. -/
structure OrdinaryEndomorphismCertificate {fq : Type*} [Field fq]
    (W : WeierstrassCurve fq) (p q : ℕ) (t DK : ℤ)
    (classCount : ℤ → List (ℕ × ℕ) → ℕ)
    (curveCount : WeierstrassCurve fq → List (ℕ × ℕ) → ℕ)
    (climb : WeierstrassCurve fq → ℕ → ℕ) (splitPrimes : Set ℕ) where
  elliptic : W.IsElliptic
  p_isPrime : p.Prime
  characteristic : CharP fq p
  q_power : ∃ r : ℕ, 0 < r ∧ q = p ^ r
  fieldCard : Nat.card fq = q
  traceCount : t = (q : ℤ) + 1 - Nat.card W.toAffine.Point
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
  relationPrimes : ∀ rk, ∀ le ∈ relations rk,
    le.1.Prime ∧ le.1 ∈ splitPrimes ∧ Nat.Coprime le.1 (v * p)
  relationValid : ∀ rk : primePowers,
    classCount (ordinaryRelationD2 DK rk) (relations rk) <
      classCount (ordinaryRelationD1 v DK rk) (relations rk)
  powerVerified : ∀ rk : primePowers,
    curveCount W (relations rk) < classCount (ordinaryRelationD1 v DK rk) (relations rk) ↔
      rk.val.1 ^ rk.val.2 ∣ u
  twoVerified : u.factorization 2 = climb W 2
  threeVerified : u.factorization 3 = climb W 3

namespace OrdinaryEndomorphismCertificate
variable {fq : Type*} [Field fq] {W : WeierstrassCurve fq} {p q : ℕ} {t DK : ℤ}
  {classCount : ℤ → List (ℕ × ℕ) → ℕ}
  {curveCount : WeierstrassCurve fq → List (ℕ × ℕ) → ℕ}
  {climb : WeierstrassCurve fq → ℕ → ℕ} {splitPrimes : Set ℕ}
  (cert : OrdinaryEndomorphismCertificate W p q t DK classCount curveCount climb splitPrimes)
def countD1 (rk : cert.primePowers) : ℕ :=
  classCount (ordinaryRelationD1 cert.v DK rk) (cert.relations rk)
def countD2 (rk : cert.primePowers) : ℕ :=
  classCount (ordinaryRelationD2 DK rk) (cert.relations rk)
def countCurve (rk : cert.primePowers) : ℕ := curveCount W (cert.relations rk)
def valuationTwo (_cert : OrdinaryEndomorphismCertificate W p q t DK classCount curveCount climb splitPrimes) : ℕ := climb W 2
def valuationThree (_cert : OrdinaryEndomorphismCertificate W p q t DK classCount curveCount climb splitPrimes) : ℕ := climb W 3
lemma trace : t ^ 2 - 4 * q = (cert.v : ℤ) ^ 2 * DK := by sorry
lemma conductor_divides : cert.u ∣ cert.v := by sorry
lemma valid_relations :
    (∀ rk : cert.primePowers, cert.countD2 rk < cert.countD1 rk) ∧
    cert.u.factorization 2 = cert.valuationTwo ∧
    cert.u.factorization 3 = cert.valuationThree := by sorry
/-- The verifier takes raw tables and claimed v,u, and evaluates the
intrinsically bound class/curve counts and climbing computations. Acceptance
returns a checked record for W; no End=O assertion is an input proof field. -/
def verify {fq : Type*} [Field fq] (W : WeierstrassCurve fq)
    (p q : ℕ) (t DK : ℤ) (v u : ℕ)
    (tests : Finset (ℕ × ℕ)) (relations : tests → List (ℕ × ℕ))
    (classCount : ℤ → List (ℕ × ℕ) → ℕ)
    (curveCount : WeierstrassCurve fq → List (ℕ × ℕ) → ℕ)
    (climb : WeierstrassCurve fq → ℕ → ℕ) (splitPrimes : Set ℕ) :
    Option {cert : OrdinaryEndomorphismCertificate W p q t DK classCount curveCount climb splitPrimes //
      cert.v = v ∧ cert.u = u ∧ cert.primePowers = tests ∧ HEq cert.relations relations} := by sorry
/-- Test TauCeti.CM.OrdinaryEndomorphismCertificate.test_maximal. -/
example (h : cert.v = 1) : cert.u = 1 := by sorry
/-- Test TauCeti.CM.OrdinaryEndomorphismCertificate.test_supersingular. -/
example (h : (p : ℤ) ∣ t) : ¬ Nonempty
    (OrdinaryEndomorphismCertificate W p q t DK classCount curveCount climb splitPrimes) := by sorry
/-- Test TauCeti.CM.OrdinaryEndomorphismCertificate.test_forged_relation:
the computed class counts, rather than freely stored numbers, fail separation. -/
example (rk : cert.primePowers) (h : cert.countD1 rk ≤ cert.countD2 rk) : False := by sorry
/-- Test TauCeti.CM.OrdinaryEndomorphismCertificate.test_prime_powers:
v=25,u=5 accepts 5|u and rejects 25|u, using the actual supplied curve counts. -/
example (hv : cert.v = 25) (hu : cert.u = 5) :
    ∃ rk1 rk2 : cert.primePowers,
      rk1.val = (5, 1) ∧ rk2.val = (5, 2) ∧
      cert.countCurve rk1 < cert.countD1 rk1 ∧
      ¬ cert.countCurve rk2 < cert.countD1 rk2 := by sorry
end OrdinaryEndomorphismCertificate

/-- Under independently valid separating relations and checked trace/DK/v,
CN3/GN11 identify these count/climbing functions with the actual computations;
EC1/A6/GN11 identify EndGeom with geometric End(W) and O with the order of
conductor u and fundamental discriminant DK. These identifications and
their exact geometric/order/count identifications are omitted. The complete verifier
conclusion is order equality, not just u|v. -/
theorem ordinaryEndomorphism_verify_iff
    {fq K EndGeom : Type*} [Field fq] [Field K] [Ring EndGeom]
    (W : WeierstrassCurve fq) (p q : ℕ) (t DK : ℤ) (v u : ℕ)
    (tests : Finset (ℕ × ℕ)) (relations : tests → List (ℕ × ℕ))
    (classCount : ℤ → List (ℕ × ℕ) → ℕ)
    (curveCount : WeierstrassCurve fq → List (ℕ × ℕ) → ℕ)
    (climb : WeierstrassCurve fq → ℕ → ℕ) (splitPrimes : Set ℕ)
    (O : Subring K) (hp : p.Prime) [CharP fq p]
    (hq : ∃ r : ℕ, 0 < r ∧ q = p ^ r) (hcard : Nat.card fq = q)
    (htrace : t = (q : ℤ) + 1 - Nat.card W.toAffine.Point)
    (hordinary : ¬ (p : ℤ) ∣ t) (hv : 0 < v) (hu : 0 < u) (huv : u ∣ v)
    (hdisc : t ^ 2 - 4 * q = (v : ℤ) ^ 2 * DK) (hnegative : DK < 0)
    (hfundamental : (DK % 4 = 1 ∧ Squarefree DK.natAbs) ∨
      ∃ d : ℤ, DK = 4 * d ∧ (d % 4 = 2 ∨ d % 4 = 3) ∧ Squarefree d.natAbs)
    (htests : ∀ r k : ℕ, (r, k) ∈ tests ↔ r.Prime ∧ 3 < r ∧ 0 < k ∧ r ^ k ∣ v)
    (hprimes : ∀ rk, ∀ le ∈ relations rk,
      le.1.Prime ∧ le.1 ∈ splitPrimes ∧ Nat.Coprime le.1 (v * p))
    (hseparating : ∀ rk : tests,
      classCount (ordinaryRelationD2 DK rk) (relations rk) <
      classCount (ordinaryRelationD1 v DK rk) (relations rk)) :
    (OrdinaryEndomorphismCertificate.verify W p q t DK v u tests relations
      classCount curveCount climb splitPrimes).isSome = true ↔
      Nonempty (EndGeom ≃+* O) := by sorry

/-- The CM-specific checked data at a rational ordinary split prime.
GN11 supplies order and its proper-class census; CN3/EC3 supply the actual
class action, trace, signed relation counts and climbing routines; GN3 supplies
splitPrimes and DK,u for this order. Their supplier identifications (including
admissible splitting) are omitted conditions. Every orbit curve has a separate
intrinsically computed End certificate. The residue is the FULL root product. -/
structure CMPrimeCertificate (p : ℕ) [Fact p.Prime]
    (residue : ℤ[X]) (order : Subring ℂ) (DK : ℤ) (u : ℕ) where
  h : ℕ
  h_pos : 0 < h
  census : Fin h ≃ ClassGroup order
  orbit : Fin h → WeierstrassCurve (ZMod p)
  orbitElliptic : ∀ c, (orbit c).IsElliptic
  seedIndex : Fin h
  classAction : ClassGroup order → WeierstrassCurve (ZMod p) → WeierstrassCurve (ZMod p)
  orbitAction : ∀ c, orbit c = classAction (census c) (orbit seedIndex)
  trace : Fin h → ℤ
  classCount : ℤ → List (ℕ × ℕ) → ℕ
  curveCount : WeierstrassCurve (ZMod p) → List (ℕ × ℕ) → ℕ
  climb : WeierstrassCurve (ZMod p) → ℕ → ℕ
  splitPrimes : Set ℕ
  orderCertificates : ∀ c, OrdinaryEndomorphismCertificate (orbit c) p p (trace c) DK
    classCount curveCount climb splitPrimes
  claimedConductor : ∀ c, (orderCertificates c).u = u
  distinctRoots : Function.Injective (fun c => letI := orbitElliptic c; (orbit c).j)
  residueComputed : residue.map (Int.castRingHom (ZMod p)) =
    ∏ c : Fin h, (letI := orbitElliptic c; X - C (orbit c).j)

/-- The full CRT record binds prime/order/orbit provenance as well as exact
integer reconstruction. DK and conductor are the GN11 invariants of order;
their arithmetic identification is an omitted supplier condition. -/
structure CRTClassPolynomialCertificate {J : Type*} [Fintype J]
    (P : ℤ[X]) (B : ℕ) where
  order : Subring ℂ
  DK : ℤ
  conductor : ℕ
  prime : J → ℕ
  prime_isPrime : ∀ i, (prime i).Prime
  distinct : Function.Injective prime
  residue : J → ℤ[X]
  primeData : ∀ i, letI : Fact (prime i).Prime := ⟨prime_isPrime i⟩
    CMPrimeCertificate (prime i) (residue i) order DK conductor
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
/-- Independently verify the actual curve/order data used for this residue.
CM5-End-verify supplies the geometric End interpretation of the returned
record; it is not obtained by testing membership in the expected polynomial. -/
lemma endomorphism_check (i : J) :
    letI : Fact (cert.prime i).Prime := ⟨cert.prime_isPrime i⟩
    let data := cert.primeData i
    ∀ c : Fin data.h,
      (OrdinaryEndomorphismCertificate.verify (data.orbit c) (cert.prime i) (cert.prime i)
        (data.trace c) cert.DK (data.orderCertificates c).v cert.conductor
        (data.orderCertificates c).primePowers (data.orderCertificates c).relations
        data.classCount data.curveCount data.climb data.splitPrimes).isSome = true := by sorry
/-- Test TauCeti.CM.CRTClassPolynomialCertificate.test_strict_bound:
actual accepted CRT data with B=10 has a unique bounded reconstruction. -/
example (P Q : ℤ[X]) (c : CRTClassPolynomialCertificate (J := J) P 10)
    (hB : ∀ k, |Q.coeff k| ≤ 10)
    (hres : ∀ i k, Int.ModEq (c.prime i) (Q.coeff k) ((c.residue i).coeff k)) : Q = P := by sorry
/-- Test TauCeti.CM.CRTClassPolynomialCertificate.test_equality_bound:
M=2B cannot be accepted, even if the boundary residues happen to agree. -/
example : ¬ ∃ cert : CRTClassPolynomialCertificate (J := J) P B,
    (∏ i : J, cert.prime i) = 2 * B := by sorry
/-- Test TauCeti.CM.CRTClassPolynomialCertificate.test_duplicate_prime:
a repeated prime fails the actual certificate's distinctness check. -/
example (P : ℤ[X]) (B : ℕ) :
    ¬ ∃ cert : CRTClassPolynomialCertificate (J := Fin 2) P B,
      cert.prime 0 = 5 ∧ cert.prime 1 = 5 := by sorry

end CRTClassPolynomialCertificate

/-- CH/CFT13 supplies the infinite admissible split-prime set. CN3 supplies
finite exhaustive seed/order/orbit searches: primeData n is their checked
output after searching at prime n; runAt is the actual finite-prefix CRT
routine. Their supplier identifications and exhaustive-search completeness
are omitted conditions, not a GRH/runtime hypothesis or eventual-success input.
The conclusion gives finite termination with independent order checks and
strict product modulus, as well as exact reconstruction. -/
theorem crtClassPolynomial_sound_terminates {J : Type*} [Fintype J]
    (P H : ℤ[X]) (B : ℕ) (cert : CRTClassPolynomialCertificate (J := J) P B)
    (hB : ∀ k, |H.coeff k| ≤ (B : ℤ))
    (hres : ∀ i k, Int.ModEq (cert.prime i) (H.coeff k) ((cert.residue i).coeff k))
    (order : Subring ℂ) (DK : ℤ) (u : ℕ)
    (admissible : Set ℕ) (hinfinite : admissible.Infinite)
    (hprime : ∀ p ∈ admissible, p.Prime) (residue : ℕ → ℤ[X])
    (primeData : ∀ p, ∀ hp : p ∈ admissible,
      letI : Fact p.Prime := ⟨hprime p hp⟩
      CMPrimeCertificate p (residue p) order DK u)
    (runAt : ℕ → Option ℤ[X]) :
    P = H ∧ ∃ N : ℕ, ∃ primes : Finset ℕ,
      (∀ p ∈ primes, p ∈ admissible ∧ p ≤ N) ∧
      2 * B < ∏ p ∈ primes, p ∧ runAt N = some H ∧
      ∀ p, ∀ hp : p ∈ admissible, p ∈ primes →
        letI : Fact p.Prime := ⟨hprime p hp⟩
        let data := primeData p hp
        ∀ c : Fin data.h, (data.orderCertificates c).u = u := by sorry

/-! CM.5 total algorithms return polynomial/certificate pairs. Their actual
GN11 discriminant/order input, CN4 shrinking evaluator or CN3 complete finite
prime/curve search and EC3/CN3 walk interfaces are recorded gaps/requests. The
native constructors below give signatures for the certificate return, not
implemented algorithms or unchecked-oracle acceptance. -/

/-- GN11/A5 supplies order, its complete proper-class census and classJ.
CN4 supplies these actual validated root/product oracle functions, their
q-tail containment and shrinking widths. Its outward-convolution and
integer-recovery identifications are omitted supplier conditions. The output
includes an actual finite precision and a certificate for the supplied order. -/
def complexClassPolynomial {J : Type*} [Fintype J]
    (order : Subring ℂ) (census : J ≃ ClassGroup order)
    (classJ : ClassGroup order → ℂ)
    (rootOracle : ℕ → J → NonemptyInterval ℚ × NonemptyInterval ℚ)
    (coefficientOracle : ℕ → ℕ → NonemptyInterval ℚ × NonemptyInterval ℚ)
    (hroot : ∀ n i, classJ (census i) ∈ complexBoxSet (rootOracle n i))
    (hproduct : ∀ n k, (∏ i : J, (X - C (classJ (census i)))).coeff k ∈
      complexBoxSet (coefficientOracle n k))
    (hshrink : ∀ eps : ℚ, 0 < eps → ∃ N, ∀ n ≥ N, ∀ k ≤ Fintype.card J,
      (coefficientOracle n k).1.snd - (coefficientOracle n k).1.fst < eps)
    (integralCoefficients : ∀ k : ℕ, ∃ z : ℤ,
      (∏ i : J, (X - C (classJ (census i)))).coeff k = (z : ℂ)) :
    Σ n : ℕ, {r : Σ P : ℤ[X], ComplexClassPolynomialCertificate (classJ ∘ census) P //
      r.2.order = order ∧ r.2.rootBoxes = rootOracle n ∧
      r.2.coefficientBoxes = coefficientOracle n} := by sorry
namespace complexClassPolynomial
variable {J : Type*} [Fintype J]
    (order : Subring ℂ) (census : J ≃ ClassGroup order)
    (classJ : ClassGroup order → ℂ)
    (rootOracle : ℕ → J → NonemptyInterval ℚ × NonemptyInterval ℚ)
    (coefficientOracle : ℕ → ℕ → NonemptyInterval ℚ × NonemptyInterval ℚ)
    (hroot : ∀ n i, classJ (census i) ∈ complexBoxSet (rootOracle n i))
    (hproduct : ∀ n k, (∏ i : J, (X - C (classJ (census i)))).coeff k ∈
      complexBoxSet (coefficientOracle n k))
    (hshrink : ∀ eps : ℚ, 0 < eps → ∃ N, ∀ n ≥ N, ∀ k ≤ Fintype.card J,
      (coefficientOracle n k).1.snd - (coefficientOracle n k).1.fst < eps)
    (integralCoefficients : ∀ k : ℕ, ∃ z : ℤ,
      (∏ i : J, (X - C (classJ (census i)))).coeff k = (z : ℂ))
lemma certificate :
    let r := complexClassPolynomial order census classJ rootOracle coefficientOracle
      hroot hproduct hshrink integralCoefficients
    Nonempty (ComplexClassPolynomialCertificate (classJ ∘ census) r.2.val.1) ∧
    r.2.val.2.order = order := by sorry
lemma correct (H : ℤ[X])
    (h : H.map (Int.castRingHom ℂ) = ∏ i : J, (X - C (classJ (census i)))) :
    (complexClassPolynomial order census classJ rootOracle coefficientOracle
      hroot hproduct hshrink integralCoefficients).2.val.1 = H := by sorry
include integralCoefficients in
lemma precision_independent (P Q : ℤ[X])
    (cP : ComplexClassPolynomialCertificate (classJ ∘ census) P)
    (cQ : ComplexClassPolynomialCertificate (classJ ∘ census) Q) : P = Q := by sorry
/-- Test TauCeti.CM.complexClassPolynomial.test_minus4. GN11/A5 identifies
order with the Gaussian maximal order, census with its single proper class
and classJ with the constructed Gaussian curve's j (omitted conditions). -/
example (hclass : ∀ i, classJ (census i) = 1728) (hcard : Fintype.card J = 1) :
    (complexClassPolynomial order census classJ rootOracle coefficientOracle
      hroot hproduct hshrink integralCoefficients).2.val.1 = X - C 1728 := by sorry
/-- Test TauCeti.CM.complexClassPolynomial.test_minus3: the same actual
constructor with the Eisenstein singleton proper-class input. -/
example (hclass : ∀ i, classJ (census i) = 0) (hcard : Fintype.card J = 1) :
    (complexClassPolynomial order census classJ rootOracle coefficientOracle
      hroot hproduct hshrink integralCoefficients).2.val.1 = X := by sorry
/-- Test TauCeti.CM.complexClassPolynomial.test_unvalidated_oracle:
an integral Gaussian root with an invalid box is rejected. Integrality is
not the failed condition; the certificate's root containment is. -/
example (hclass : ∀ i, classJ (census i) = 1728) (i : J)
    (hbad : (rootOracle 0 i).1.snd < 1728) :
    ¬ ∃ (P : ℤ[X]) (cert : ComplexClassPolynomialCertificate (classJ ∘ census) P),
      cert.rootBoxes = rootOracle 0 := by sorry
end complexClassPolynomial

/-- GAP CM5-CRT-search: GN11 supplies the actual quadratic order and
DK,u, and CH/CFT13 its infinite admissible split-prime set. CN3 supplies the
complete finite seed/order/orbit search whose checked outputs are primeData.
These carrier/algorithm identifications and search completeness are omitted
supplier conditions. The return binds the specified order and all checked
prime/orbit data; it never takes the exact target polynomial as an input. -/
def crtClassPolynomial (order : Subring ℂ) (DK : ℤ) (u B : ℕ)
    (admissible : Set ℕ) (hinfinite : admissible.Infinite)
    (hprime : ∀ p ∈ admissible, p.Prime) (residue : ℕ → ℤ[X])
    (primeData : ∀ p, ∀ hp : p ∈ admissible,
      letI : Fact p.Prime := ⟨hprime p hp⟩
      CMPrimeCertificate p (residue p) order DK u)
    (hcoherent : ∃ H : ℤ[X], (∀ k, |H.coeff k| ≤ (B : ℤ)) ∧
      ∀ p ∈ admissible, ∀ k, Int.ModEq p (H.coeff k) ((residue p).coeff k)) :
    Σ J : Type, Σ _ : Fintype J,
      {r : Σ P : ℤ[X], CRTClassPolynomialCertificate (J := J) P B //
        r.2.order = order ∧ r.2.DK = DK ∧ r.2.conductor = u ∧
        ∀ i, r.2.prime i ∈ admissible ∧ r.2.residue i = residue (r.2.prime i)} := by sorry
namespace crtClassPolynomial
variable (order : Subring ℂ) (DK : ℤ) (u B : ℕ)
    (admissible : Set ℕ) (hinfinite : admissible.Infinite)
    (hprime : ∀ p ∈ admissible, p.Prime) (residue : ℕ → ℤ[X])
    (primeData : ∀ p, ∀ hp : p ∈ admissible,
      letI : Fact p.Prime := ⟨hprime p hp⟩
      CMPrimeCertificate p (residue p) order DK u)
    (hcoherent : ∃ H : ℤ[X], (∀ k, |H.coeff k| ≤ (B : ℤ)) ∧
      ∀ p ∈ admissible, ∀ k, Int.ModEq p (H.coeff k) ((residue p).coeff k))
/-- The constructor's actual returned record contains independent End
checks for every orbit curve, in addition to prime/residue provenance. -/
lemma certificate :
    let r := crtClassPolynomial order DK u B admissible hinfinite hprime residue primeData hcoherent
    letI := r.2.1
    Nonempty (CRTClassPolynomialCertificate (J := r.1) r.2.2.val.1 B) ∧
      r.2.2.val.2.order = order ∧ r.2.2.val.2.conductor = u := by sorry
lemma correct (H : ℤ[X]) (hB : ∀ k, |H.coeff k| ≤ (B : ℤ))
    (hres : ∀ p ∈ admissible, ∀ k, Int.ModEq p (H.coeff k) ((residue p).coeff k)) :
    (crtClassPolynomial order DK u B admissible hinfinite hprime residue primeData hcoherent).2.2.val.1 = H := by sorry
lemma prime_choice_independent
    (admissible' : Set ℕ) (hinfinite' : admissible'.Infinite)
    (hprime' : ∀ p ∈ admissible', p.Prime) (residue' : ℕ → ℤ[X])
    (primeData' : ∀ p, ∀ hp : p ∈ admissible',
      letI : Fact p.Prime := ⟨hprime' p hp⟩
      CMPrimeCertificate p (residue' p) order DK u)
    (hcoherent' : ∃ H : ℤ[X], (∀ k, |H.coeff k| ≤ (B : ℤ)) ∧
      ∀ p ∈ admissible', ∀ k, Int.ModEq p (H.coeff k) ((residue' p).coeff k))
    (H : ℤ[X]) (hB : ∀ k, |H.coeff k| ≤ (B : ℤ))
    (hres : ∀ p ∈ admissible, ∀ k, Int.ModEq p (H.coeff k) ((residue p).coeff k))
    (hres' : ∀ p ∈ admissible', ∀ k, Int.ModEq p (H.coeff k) ((residue' p).coeff k)) :
    (crtClassPolynomial order DK u B admissible hinfinite hprime residue primeData hcoherent).2.2.val.1 =
    (crtClassPolynomial order DK u B admissible' hinfinite' hprime' residue' primeData' hcoherent').2.2.val.1 := by sorry
/-- Test TauCeti.CM.crtClassPolynomial.test_minus4: test the actual
constructor with independently checked Gaussian residue/orbit data. -/
example (hB : ∀ k, |(X - C (1728 : ℤ)).coeff k| ≤ (B : ℤ))
    (hres : ∀ p ∈ admissible, ∀ k, Int.ModEq p ((X - C (1728 : ℤ)).coeff k)
      ((residue p).coeff k)) :
    (crtClassPolynomial order DK u B admissible hinfinite hprime residue primeData hcoherent).2.2.val.1 =
      X - C 1728 := by sorry
end crtClassPolynomial
namespace crtClassPolynomial
/-- Test TauCeti.CM.crtClassPolynomial.test_supersingular_rejected:
the actual Gaussian seed y²=x³-x over F7 has trace zero. No extension F_(7^r)
can turn a supersingular seed into an ordinary one; for any such seed, the
p-divisible trace makes the independent verifier return none. EC3 identifies
this with supersingularity and supplies the trace (omitted conditions). -/
example {fq : Type*} [Field fq] (W : WeierstrassCurve fq) (q : ℕ)
    (t DK : ℤ) (v u : ℕ) (ht : (7 : ℤ) ∣ t)
    (tests : Finset (ℕ × ℕ)) (relations : tests → List (ℕ × ℕ))
    (classCount : ℤ → List (ℕ × ℕ) → ℕ)
    (curveCount : WeierstrassCurve fq → List (ℕ × ℕ) → ℕ)
    (climb : WeierstrassCurve fq → ℕ → ℕ) (splitPrimes : Set ℕ) :
    OrdinaryEndomorphismCertificate.verify W 7 q t DK v u tests relations
      classCount curveCount climb splitPrimes = none := by sorry
/-- Test TauCeti.CM.crtClassPolynomial.test_order_separate: even if W.j
is a root of the proposed residue, an independently computed nonseparating
relation prevents admission. This exercises the actual verifier on W. -/
example (p : ℕ) [Fact p.Prime] (W : WeierstrassCurve (ZMod p)) [W.IsElliptic]
    (H : ℤ[X]) (hroot : (H.map (Int.castRingHom (ZMod p))).IsRoot W.j)
    (t DK : ℤ) (v u : ℕ) (tests : Finset (ℕ × ℕ))
    (relations : tests → List (ℕ × ℕ)) (rk : tests)
    (classCount : ℤ → List (ℕ × ℕ) → ℕ)
    (curveCount : WeierstrassCurve (ZMod p) → List (ℕ × ℕ) → ℕ)
    (climb : WeierstrassCurve (ZMod p) → ℕ → ℕ) (splitPrimes : Set ℕ)
    (hbad : classCount (ordinaryRelationD1 v DK rk) (relations rk) ≤
      classCount (ordinaryRelationD2 DK rk) (relations rk)) :
    OrdinaryEndomorphismCertificate.verify W p p t DK v u tests relations
      classCount curveCount climb splitPrimes = none := by sorry
end crtClassPolynomial

end TauCeti.CM
