/-
This file is not the roadmap and is not exhaustive. The README is definitive.
These statements suggest Lean forms so contributors and reviewers can converge
on names and signatures. Proofs marked sorry are mathematical targets.

Ordinary differential forms use the existing Kähler and exterior-power APIs.
Derived statements use forgetful views in the existing ordinary derived category;
their comments specify the additional animated, filtered and coherent conditions.
Conditions requiring interfaces from neighbouring roadmaps are omitted explicitly,
with their names and mathematical contracts. They are never encoded by arbitrary
Prop fields or by assumed comparison conclusions.

The degree-one pullback test expresses the existing Tau Ceti semilinear Kähler
map through its defining Mathlib tower map and the algebra induced by f. No new
Kähler map is defined here. Enhanced tensor and scalar extension are imported
mathematical interfaces; the private declarations below suggest their forgetful
ordinary forms, without asserting their coherent laws.
-/
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.RingTheory.Kaehler.Polynomial
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.ExteriorAlgebra.Grading
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.Algebra.Homology.HomologicalComplex
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.Homology.DerivedCategory.HomologySequence
import Mathlib.CategoryTheory.Category.Preorder
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.Extension.Cotangent.Basic
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.RingTheory.DividedPowers.Basic
import Mathlib.RingTheory.DividedPowerAlgebra.Init
import Mathlib.RingTheory.WittVector.Basic
import Mathlib.RingTheory.Smooth.Basic
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.Flat.Basic
import Mathlib.RingTheory.Finiteness.Basic
import Mathlib.CategoryTheory.Sites.Grothendieck
import Mathlib.RingTheory.Flat.FaithfullyFlat.Basic
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.Algebra.Category.MonCat.Basic
import Mathlib.AlgebraicTopology.SimplicialObject.Basic
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.RingTheory.Regular.RegularSequence
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.Algebra.MvPolynomial.Basic

open CategoryTheory CategoryTheory.Limits CategoryTheory.Pretriangulated ExteriorAlgebra
open scoped TensorProduct
set_option linter.unusedVariables false

noncomputable section
namespace TauCeti.DeRham
universe u
variable (A B : Type u) [CommRing A] [CommRing B] [Algebra A B]

-- Notation for existing carriers; these introduce no new mathematical objects.
abbrev Forms (n : ℕ) := exteriorPower B n (KaehlerDifferential A B)
abbrev Symbols (n : ℕ) := (B × (Fin n → B)) →₀ A
abbrev sym (n : ℕ) (c : B) (v : Fin n → B) : Symbols A B n :=
  Finsupp.single (c, v) 1
abbrev elementary (n : ℕ) (c : B) (v : Fin n → B) : Forms A B n :=
  c • exteriorPower.ιMulti B n (fun i => KaehlerDifferential.D A B (v i))
abbrev wedge {m n : ℕ} (x : Forms A B m) (y : Forms A B n) : Forms A B (m+n) :=
  ⟨x.val * y.val, SetLike.mul_mem_graded x.property y.property⟩
abbrev zeroForm (b : B) : Forms A B 0 :=
  (exteriorPower.zeroEquiv B (KaehlerDifferential A B)).symm b

-- The six displayed relation families, as an explicit set in the free A-module.
-- Only additive and A-scalar closure in the coefficient is imposed.
def relationSet (n : ℕ) : Set (Symbols A B n) :=
  {x | (∃ c e v, x = sym A B n (c+e) v - sym A B n c v - sym A B n e v) ∨
    (∃ (a : A) (c : B) (v : Fin n → B), x = sym A B n (a • c) v - a • sym A B n c v) ∨
    (∃ c v i b e, x = sym A B n c (Function.update v i (b+e)) -
      sym A B n c (Function.update v i b) - sym A B n c (Function.update v i e)) ∨
    (∃ c v i b e, x = sym A B n c (Function.update v i (b*e)) -
      sym A B n (c*b) (Function.update v i e) -
      sym A B n (c*e) (Function.update v i b)) ∨
    (∃ (c : B) (v : Fin n → B) (i : Fin n) (a : A), x = sym A B n c (Function.update v i (algebraMap A B a))) ∨
    (∃ c v i j, i ≠ j ∧ v i = v j ∧ x = sym A B n c v)}

-- DerivedDeRhamCohomology:DD.2/symbol-relations
def symbolRelations (n : ℕ) : Submodule A (Symbols A B n) := by sorry
lemma symbolRelations_eq_span (n : ℕ) : symbolRelations A B n = Submodule.span A (relationSet A B n) := by sorry
lemma symbolRelations_coeff_add (n : ℕ) (c e : B) (v : Fin n → B) : sym A B n (c+e) v - sym A B n c v - sym A B n e v ∈ symbolRelations A B n := by sorry
lemma symbolRelations_slot_mul (n : ℕ) (c x y : B) (v : Fin n → B) (i : Fin n) : sym A B n c (Function.update v i (x*y)) - sym A B n (c*x) (Function.update v i y) - sym A B n (c*y) (Function.update v i x) ∈ symbolRelations A B n := by sorry
-- test_relations_degree_zero: The degree-zero relation [0;()] belongs to R₀.
example  : sym A B 0 0 Fin.elim0 ∈ symbolRelations A B 0 := by sorry
-- test_relations_constant_slot: A differential slot filled with an element from A is zero in the quotient.
example (c : B) (a : A) : sym A B 1 c (fun _ => algebraMap A B a) ∈ symbolRelations A B 1 := by sorry
-- test_relations_diagonal_char_two: Over F₂, the diagonal degree-two symbol is itself a relation, not merely twice that symbol.
example (x : Polynomial (ZMod 2)) : sym (ZMod 2) (Polynomial (ZMod 2)) 2 1 (fun _ => x) ∈ symbolRelations (ZMod 2) (Polynomial (ZMod 2)) 2 := by sorry

-- DerivedDeRhamCohomology:DD.2/symbol-map
def symbolMap (n : ℕ) : Symbols A B n →ₗ[A] Forms A B n := by sorry
lemma symbolMap_smul (n : ℕ) (a : A) (s : Symbols A B n) : symbolMap A B n (a • s) = a • symbolMap A B n s := by sorry
lemma symbolMap_single (n : ℕ) (c : B) (v : Fin n → B) : symbolMap A B n (sym A B n c v) = elementary A B n c v := by sorry
lemma symbolMap_add (n : ℕ) (x y : Symbols A B n) : symbolMap A B n (x+y) = symbolMap A B n x + symbolMap A B n y := by sorry
-- test_symbolMap_zero_degree: Evaluation in weight zero agrees with the existing zeroEquiv.
example (c : B) : (exteriorPower.zeroEquiv B (KaehlerDifferential A B)) (symbolMap A B 0 (sym A B 0 c Fin.elim0)) = c := by sorry
-- test_symbolMap_one_degree: Evaluation in weight one agrees with c times the universal derivation.
example (c x : B) : (exteriorPower.oneEquiv B (KaehlerDifferential A B)) (symbolMap A B 1 (sym A B 1 c (fun _ => x))) = c • KaehlerDifferential.D A B x := by sorry
-- test_symbolMap_repeated: The image of [c;x,x] is zero in every characteristic.
example (c x : B) : symbolMap A B 2 (sym A B 2 c (fun _ => x)) = 0 := by sorry

-- DerivedDeRhamCohomology:DD.2/symbol-map-surjective
lemma symbolMap_surjective (n : ℕ) : Function.Surjective (symbolMap A B n) := by sorry

-- DerivedDeRhamCohomology:DD.2/symbol-relations-kernel
lemma symbolRelations_ker (n : ℕ) : LinearMap.ker (symbolMap A B n) = symbolRelations A B n := by sorry

-- DerivedDeRhamCohomology:DD.2/free-symbol-differential
def freeDifferential (n : ℕ) : Symbols A B n →ₗ[A] Forms A B (n+1) := by sorry
lemma freeDifferential_smul (n : ℕ) (a : A) (s : Symbols A B n) : freeDifferential A B n (a • s) = a • freeDifferential A B n s := by sorry
lemma freeDifferential_add (n : ℕ) (s t : Symbols A B n) : freeDifferential A B n (s+t) = freeDifferential A B n s + freeDifferential A B n t := by sorry
lemma freeDifferential_single (n : ℕ) (c : B) (v : Fin n → B) : freeDifferential A B n (sym A B n c v) = exteriorPower.ιMulti B (n+1) (Fin.cons (KaehlerDifferential.D A B c) (fun i => KaehlerDifferential.D A B (v i))) := by sorry
-- test_freeDifferential_unit: Symbols with coefficient one have zero differential.
example (n : ℕ) (v : Fin n → B) : freeDifferential A B n (sym A B n 1 v) = 0 := by sorry
-- test_freeDifferential_zero_degree: In weight zero the free differential agrees with D after oneEquiv.
example (c : B) : (exteriorPower.oneEquiv B (KaehlerDifferential A B)) (freeDifferential A B 0 (sym A B 0 c Fin.elim0)) = KaehlerDifferential.D A B c := by sorry
-- test_freeDifferential_diagonal: δ₁([x;x])=Dx∧Dx=0.
example (x : B) : freeDifferential A B 1 (sym A B 1 x (fun _ => x)) = 0 := by sorry

-- DerivedDeRhamCohomology:DD.2/free-differential-relations
lemma freeDifferential_relations (n : ℕ) : symbolRelations A B n ≤ LinearMap.ker (freeDifferential A B n) := by sorry

-- DerivedDeRhamCohomology:DD.2/ordinary-differential
def d (n : ℕ) : Forms A B n →ₗ[A] Forms A B (n+1) := by sorry
-- test_d_two_variables: the sign and nonzero value in Z[X,Y].
example :
    let B := MvPolynomial (Fin 2) ℤ
    let x : B := MvPolynomial.X 0
    let y : B := MvPolynomial.X 1
    let dx := KaehlerDifferential.D ℤ B x
    let dy := KaehlerDifferential.D ℤ B y
    d ℤ B 1 (elementary ℤ B 1 x (fun _ => y)) =
      exteriorPower.ιMulti B 2 (Fin.cons dx (fun _ => dy)) ∧
      exteriorPower.ιMulti B 2 (Fin.cons dx (fun _ => dy)) ≠ 0 := by sorry
lemma d_add (n : ℕ) (x y : Forms A B n) : d A B n (x+y) = d A B n x + d A B n y := by sorry
lemma d_base_smul (n : ℕ) (a : A) (x : Forms A B n) : d A B n (a • x) = a • d A B n x := by sorry
lemma d_zero_degree (b : B) : (exteriorPower.oneEquiv B (KaehlerDifferential A B)) (d A B 0 (zeroForm A B b)) = KaehlerDifferential.D A B b := by sorry
-- test_d_base_constant: The differential of the image of a base-ring constant is zero.
example (a : A) : d A B 0 (zeroForm A B (algebraMap A B a)) = 0 := by sorry
-- test_d_polynomial_X: The differential of X in Z[X] over Z is nonzero, so the zero operator fails.
example  : d ℤ (Polynomial ℤ) 0 (zeroForm ℤ (Polynomial ℤ) Polynomial.X) ≠ 0 := by sorry
-- test_d_polynomial_X_char_two: The differential of X in F₂[X] over F₂ is still nonzero.
example  : d (ZMod 2) (Polynomial (ZMod 2)) 0 (zeroForm (ZMod 2) (Polynomial (ZMod 2)) Polynomial.X) ≠ 0 := by sorry

-- DerivedDeRhamCohomology:DD.2/differential-generator-formula
lemma d_elementary (n : ℕ) (c : B) (v : Fin n → B) : d A B n (elementary A B n c v) = exteriorPower.ιMulti B (n+1) (Fin.cons (KaehlerDifferential.D A B c) (fun i => KaehlerDifferential.D A B (v i))) := by sorry

-- DerivedDeRhamCohomology:DD.2/differential-uniqueness
lemma d_unique (n : ℕ) (f : Forms A B n →ₗ[A] Forms A B (n+1)) (h : ∀ c v, f (elementary A B n c v) = exteriorPower.ιMulti B (n+1) (Fin.cons (KaehlerDifferential.D A B c) (fun i => KaehlerDifferential.D A B (v i)))) : f = d A B n := by sorry

-- DerivedDeRhamCohomology:DD.2/differential-square-zero
lemma d_squared (n : ℕ) : (d A B (n+1)).comp (d A B n) = 0 := by sorry

-- DerivedDeRhamCohomology:DD.2/differential-graded-leibniz
lemma d_leibniz (m n : ℕ) (x : Forms A B m) (y : Forms A B n) :
    (d A B (m+n) (wedge A B x y)).val =
      (d A B m x).val * y.val + (-1 : B)^m • (x.val * (d A B n y).val) := by sorry

-- DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex
def complex : CochainComplex (ModuleCat A) ℕ :=
  CochainComplex.of (fun n => ModuleCat.of A (Forms A B n))
    (fun n => ModuleCat.ofHom (d A B n)) (by intro n; sorry)
lemma complex_X (n : ℕ) : (complex A B).X n = ModuleCat.of A (Forms A B n) := by sorry
lemma complex_d_apply (n : ℕ) (x : Forms A B n) : (complex A B).d n (n+1) x = d A B n x := by sorry
lemma complex_d_nonadjacent (i j : ℕ) (h : i+1 ≠ j) : (complex A B).d i j = 0 := by sorry
-- test_complex_degree_zero: The first arrow agrees with the universal derivation after the existing degree-one equivalence.
example (b : B) : (exteriorPower.oneEquiv B (KaehlerDifferential A B)) ((complex A B).d 0 1 (zeroForm A B b)) = KaehlerDifferential.D A B b := by sorry
-- test_complex_two_steps: The first two arrows compose to zero on each b.
example (b : B) : (complex A B).d 1 2 ((complex A B).d 0 1 (zeroForm A B b)) = 0 := by sorry
-- test_complex_base_ring: Over A→A the first differential is zero.
example  : (complex A A).d 0 1 = 0 := by sorry

variable {A B}
variable {C E : Type u} [CommRing C] [CommRing E] [Algebra A C] [Algebra A E]

-- DerivedDeRhamCohomology:DD.2/forms-pullback
def pullback (f : B →ₐ[A] C) (n : ℕ) : Forms A B n →ₛₗ[f.toRingHom] Forms A C n := by sorry
lemma pullback_add (f : B →ₐ[A] C) (n : ℕ) (x y : Forms A B n) : pullback f n (x+y) = pullback f n x + pullback f n y := by sorry
lemma pullback_smul (f : B →ₐ[A] C) (n : ℕ) (b : B) (x : Forms A B n) : pullback f n (b • x) = f b • pullback f n x := by sorry
lemma pullback_base_smul (f : B →ₐ[A] C) (n : ℕ) (a : A) (x : Forms A B n) : pullback f n (a • x) = a • pullback f n x := by sorry
-- test_pullback_zero_degree: Degree-zero pullback agrees with f under the existing zero equivalence.
example (f : B →ₐ[A] C) (b : B) : pullback f 0 (zeroForm A B b) = zeroForm A C (f b) := by sorry
-- test_pullback_one_degree: Degree-one pullback agrees with the pinned Kaehler mapSemilinear.
example (f : B →ₐ[A] C) (x : Forms A B 1) :
    letI : Algebra B C := f.toRingHom.toAlgebra
    letI : IsScalarTower A B C := IsScalarTower.of_algebraMap_eq' f.comp_algebraMap.symm
    (exteriorPower.oneEquiv C (KaehlerDifferential A C)) (pullback f 1 x) =
      KaehlerDifferential.map A A B C
        ((exteriorPower.oneEquiv B (KaehlerDifferential A B)) x) := by sorry
-- test_pullback_identity_two: The identity fixes an arbitrary degree-two form.
example (x : Forms A B 2) : pullback (AlgHom.id A B) 2 x = x := by sorry

-- DerivedDeRhamCohomology:DD.2/pullback-differential
lemma pullback_d (f : B →ₐ[A] C) (n : ℕ) (x : Forms A B n) : pullback f (n+1) (d A B n x) = d A C n (pullback f n x) := by sorry

-- DerivedDeRhamCohomology:DD.2/pullback-wedge
lemma pullback_wedge (f : B →ₐ[A] C) (m n : ℕ) (x : Forms A B m) (y : Forms A B n) : pullback f (m+n) (wedge A B x y) = wedge A C (pullback f m x) (pullback f n y) := by sorry

-- DerivedDeRhamCohomology:DD.2/pullback-identity
lemma pullback_id (n : ℕ) (x : Forms A B n) : pullback (AlgHom.id A B) n x = x := by sorry

-- DerivedDeRhamCohomology:DD.2/pullback-composition
lemma pullback_comp (f : B →ₐ[A] C) (g : C →ₐ[A] E) (n : ℕ) (x : Forms A B n) : pullback (g.comp f) n x = pullback g n (pullback f n x) := by sorry

-- DerivedDeRhamCohomology:DD.2/ordinary-complex-map
def complexMap (f : B →ₐ[A] C) : complex A B ⟶ complex A C := by sorry
lemma complexMap_apply (f : B →ₐ[A] C) (n : ℕ) (x : Forms A B n) : (complexMap f).f n x = pullback f n x := by sorry
lemma complexMap_id : complexMap (AlgHom.id A B) = 𝟙 (complex A B) := by sorry
lemma complexMap_comp (f : B →ₐ[A] C) (g : C →ₐ[A] E) : complexMap (g.comp f) = complexMap f ≫ complexMap g := by sorry
-- test_complexMap_constant: In degree zero, the complex map takes b to f(b).
example (f : B →ₐ[A] C) (b : B) : (complexMap f).f 0 (zeroForm A B b) = zeroForm A C (f b) := by sorry
-- test_complexMap_identity: The identity map of B induces the identity in degree one.
example (x : Forms A B 1) : (complexMap (AlgHom.id A B)).f 1 x = x := by sorry
-- test_complexMap_d: The degree-one image of db is d(fb).
example (f : B →ₐ[A] C) (b : B) : (complexMap f).f 1 (d A B 0 (zeroForm A B b)) = d A C 0 (zeroForm A C (f b)) := by sorry

-- DerivedDeRhamCohomology:DD.2/pullback-elementary
lemma pullback_elementary (f : B →ₐ[A] C) (n : ℕ) (c : B) (v : Fin n → B) : pullback f n (elementary A B n c v) = elementary A C n (f c) (fun i => f (v i)) := by sorry

-- DerivedDeRhamCohomology:DD.3/frobenius-linear-differential
lemma d_frobenius_smul (p : ℕ) [Fact p.Prime] [CharP A p] [CharP B p]
        (n : ℕ) (b : B) (x : Forms A B n) :
        d A B n (b^p • x) = b^p • d A B n x := by sorry

end TauCeti.DeRham

namespace TauCeti.DerivedDeRham
open scoped ZeroObject
local instance moduleDerived (R : Type) [CommRing R] :
    HasDerivedCategory.{1} (ModuleCat.{0} R) := HasDerivedCategory.standard _
abbrev D (R : Type) [CommRing R] := DerivedCategory (ModuleCat.{0} R)
abbrev mod0 (R : Type) [CommRing R] (M : ModuleCat.{0} R) : D R :=
  (DerivedCategory.singleFunctor (ModuleCat R) 0).obj M
abbrev H (R : Type) [CommRing R] (n : ℤ) (M : D R) : ModuleCat R :=
  (DerivedCategory.homologyFunctor (ModuleCat R) n).obj M
abbrev unit (R : Type) [CommRing R] : D R := mod0 R (ModuleCat.of R R)
abbrev Filtered (R : Type) [CommRing R] := OrderDual ℤ ⥤ D R
-- A forgetful augmented diagram, not the enhanced filtered category.
structure FilteredModel (R : Type) [CommRing R] where
  underlying : D R
  filtration : Filtered R
  toward : filtration ⟶ (Functor.const (OrderDual ℤ)).obj underlying
abbrev Dual (k : Type) [CommRing k] :=
  Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k)^2}
abbrev SquareZero2 (k : Type) [CommRing k] :=
  MvPolynomial (Fin 2) k ⧸ Ideal.span
    ({(MvPolynomial.X (0 : Fin 2))^2,
     MvPolynomial.X (0 : Fin 2) * MvPolynomial.X (1 : Fin 2),
     (MvPolynomial.X (1 : Fin 2))^2} : Set (MvPolynomial (Fin 2) k))
-- Forgetful views of EDS's derived tensor and extension of scalars. These are
-- fixed planned constructions, never operators supplied by an arbitrary caller.
-- They add no roadmap nodes and do not assert their enhanced coherences.
private def tensor (A : Type) [CommRing A] (M N : D A) : D A := by sorry
private def extend (A B : Type) [CommRing A] [CommRing B] [Algebra A B]
    (M : D A) : D B := by sorry
private def reduction (A : Type) [CommRing A] (I : Ideal A) (M : D A) : D (A ⧸ I) :=
  extend A (A ⧸ I) M
private def amplitude (A : Type) [CommRing A] (M : D A) (a b : ℤ) : Prop :=
  ∀ N : ModuleCat A, ∀ n : ℤ, n < a ∨ b < n →
    IsZero (H A n (tensor A M (mod0 A N)))
private def boundedTorsion (p : ℕ) (M : Type) [AddCommGroup M] : Prop :=
  ∃ c : ℕ, ∀ x : M, (∃ n : ℕ, p^n • x = 0) → p^c • x = 0
private abbrev pIdeal (A : Type) [CommRing A] (p : ℕ) := Ideal.span {(p : A)}

/- DerivedDeRhamCohomology:DD.0/cotangent-complex
For A→B in animated commutative rings construct the connective B-module L_(B/A). For ordinary rings and a cofibrant simplicial polynomial A-algebra resolution P•→B its underlying cochain complex is the normalized realization of Ω¹_(P•/A)⊗_(P•)B, with simplicial degree n placed in cohomological degree −n. Comparisons between free resolutions and naturality in commutative base squares are coherent. The full object retains all negative cohomology.
Typed boundary: Ordinary inputs, H0 and three cohomological tests only; resolution witnesses and coherent functoriality remain omitted.
-/
def cotangentComplex (A B : Type) [CommRing A] [CommRing B] [Algebra A B] : D B := by sorry
lemma cotangentH0 (A B : Type) [CommRing A] [CommRing B] [Algebra A B] :
    Nonempty (H B 0 (cotangentComplex A B) ≅ ModuleCat.of B (KaehlerDifferential A B)) := by sorry
-- test_cotangent_identity
example (A : Type) [CommRing A] : IsZero (cotangentComplex A A) := by sorry
-- test_cotangent_polynomial
example (A : Type) [CommRing A] : Nonempty
    (cotangentComplex A (Polynomial A) ≅ unit (Polynomial A)) := by sorry
-- test_cotangent_dual_numbers
example (k : Type) [Field k] (h2 : (2 : k) ≠ 0) :
    ¬ IsZero (H (Dual k) (-1) (cotangentComplex k (Dual k))) := by sorry

/- DerivedDeRhamCohomology:DD.0/cotangent-naive-comparison
For ordinary A→B, H⁰L_(B/A)≃Ω¹_(B/A). If P→B is a polynomial presentation with kernel J, τ≥−1L_(B/A) is represented by [J/J²→Ω¹_(P/A)⊗_P B] in degrees −1,0. Its H^−1 agrees with the pinned Algebra.H1Cotangent; the displayed two-term complex is not the full cotangent complex for an arbitrary quotient.
Typed boundary: H−1 only; the full truncation equivalence with an arbitrary polynomial presentation is omitted.
-/
lemma cotangentNaiveComparison (A B : Type) [CommRing A] [CommRing B] [Algebra A B] :
    Nonempty (H B (-1) (cotangentComplex A B) ≅ ModuleCat.of B (Algebra.H1Cotangent A B)) := by sorry

/- DerivedDeRhamCohomology:DD.0/smooth-cotangent
For a smooth finitely presented ordinary ring map A→B, L_(B/A)≃Ω¹_(B/A)[0], where Ω¹ is finite projective. For an étale map it vanishes. Polynomial rings on arbitrary sets have a free differential module in degree zero without a finiteness claim.
Typed boundary: The ordinary smooth algebra computation in the pinned derived category; enhanced functoriality is outside this view.
-/
lemma smoothCotangent (A B : Type) [CommRing A] [CommRing B] [Algebra A B]
    [Algebra.Smooth A B] : Nonempty
    (cotangentComplex A B ≅ mod0 B (ModuleCat.of B (KaehlerDifferential A B))) := by sorry

/- DerivedDeRhamCohomology:DD.0/cotangent-transitivity
For composable maps A→B→C of animated commutative rings there is a coherent natural fibre sequence L_(B/A)⊗^L_B C→L_(C/A)→L_(C/B)→(L_(B/A)⊗^L_B C)[1] in Mod_C.
Typed boundary: Existence of the distinguished ordinary triangle using fixed scalar extension; the chosen canonical arrows and enhanced naturality are omitted.
-/
lemma cotangentTransitivity (A B C : Type) [CommRing A] [CommRing B] [CommRing C]
    [Algebra A B] [Algebra B C] [Algebra A C] [IsScalarTower A B C] :
    ∃ T : Triangle (D C), T.obj₁ = extend B C (cotangentComplex A B) ∧
      T.obj₂ = cotangentComplex A C ∧ T.obj₃ = cotangentComplex B C ∧
      T ∈ distTriang (D C) := by sorry

/- DerivedDeRhamCohomology:DD.0/cotangent-base-change
For a derived pushout B′=B⊗^L_A A′, L_(B′/A′)≃L_(B/A)⊗^L_B B′ naturally. For ordinary ring squares this formula applies to the ordinary pushout only when Tor_i^A(B,A′)=0 for i>0. Without Tor independence the degree-zero pushout need not satisfy it.
Typed boundary: Ordinary tensor pushout with B flat over A, a sufficient Tor-independence condition; arbitrary animated pushouts and their coherent comparison are omitted.
-/
-- The ordinary pushout specialization has an explicit sufficient Tor-independence hypothesis.
lemma cotangentBaseChange (A B C : Type) [CommRing A] [CommRing B] [CommRing C]
    [Algebra A B] [Algebra A C] [Module.Flat A B] :
    letI : Algebra B (C ⊗[A] B) := (Algebra.TensorProduct.includeRight : B →ₐ[A] C ⊗[A] B).toRingHom.toAlgebra
    Nonempty (extend B (C ⊗[A] B) (cotangentComplex A B) ≅ cotangentComplex C (C ⊗[A] B)) := by sorry

/- DerivedDeRhamCohomology:DD.0/regular-quotient-cotangent
If J⊂P is generated by a finite regular sequence f₁,…,f_r and B=P/J, then L_(B/P)≃(J/J²)[1], with J/J² free on the classes of f_i. If P is smooth over A, L_(B/A) is the two-term complex [J/J²→Ω¹_(P/A)⊗_P B] with f_i↦df_i in degrees −1,0. Flatness of B over A is not needed for this computation.
Typed boundary: Relative quotient with the chosen regular sequence and its free conormal basis; the two-term smaller-base presentation is omitted.
-/
-- The relative regular quotient computation; the conormal basis uses the chosen sequence.
lemma regularQuotientCotangent (A : Type) [CommRing A] (xs : List A)
    (hx : RingTheory.Sequence.IsRegular A xs) : Nonempty
    (cotangentComplex A (A ⧸ Ideal.ofList xs) ≅
      (mod0 (A ⧸ Ideal.ofList xs)
        (ModuleCat.of (A ⧸ Ideal.ofList xs) (Fin xs.length → A ⧸ Ideal.ofList xs)))⟦(1 : ℤ)⟧) := by sorry

/- DerivedDeRhamCohomology:DD.0/nonregular-quotient-homology
For k=F_p and B=k[x,y]/(x²,xy,y²), L_(B/k) is unbounded in negative cohomological degrees. The polynomial-presentation complex [I/I²→B dx⊕B dy] computes only τ≥−1L; it cannot replace the full complex. The quotient has a flat Z/p² lift with the same equations and a compatible p-power Frobenius lift; derived Cartier then makes dR_(B/k) unbounded on the left. Classical crystalline cohomology, computed as sheaf cohomology in nonnegative degrees, cannot be equivalent to this object.
Typed boundary: Only the specified F_p square-zero quotient and its unbounded negative cotangent cohomology; the later de Rham/crystalline conclusions are omitted.
-/
lemma nonregularQuotientHomology (p : ℕ) [Fact p.Prime] :
    ∀ d : ℤ, ∃ n : ℤ, n < d ∧
      ¬ IsZero (H (SquareZero2 (ZMod p)) n
        (cotangentComplex (ZMod p) (SquareZero2 (ZMod p)))) := by sorry

/- DerivedDeRhamCohomology:DD.0/andre-quillen-homology
For an ordinary map A→B, a B-module N and n≥0 define D_n(B|A,N)=H^−n(L_(B/A)⊗^L_B N). Coefficients are derived-tensored, even if the cotangent module has a two-term presentation. Transitivity gives the homological long exact sequence.
Typed boundary: Discrete coefficients with fixed EDS tensor, H0 and the three concrete tests; coefficient functoriality and the long exact sequence are omitted.
-/
def andreQuillenHomology (A B : Type) [CommRing A] [CommRing B] [Algebra A B]
    (n : ℕ) (N : ModuleCat B) : ModuleCat B :=
  H B (-(n : ℤ)) (tensor B (cotangentComplex A B) (mod0 B N))
lemma andreQuillenZero (A B : Type) [CommRing A] [CommRing B] [Algebra A B]
    (N : ModuleCat B) : Nonempty
    (andreQuillenHomology A B 0 N ≅ ModuleCat.of B (KaehlerDifferential A B ⊗[B] N)) := by sorry
-- test_aq_polynomial
example (A : Type) [CommRing A] (N : ModuleCat (Polynomial A)) :
    Nonempty (andreQuillenHomology A (Polynomial A) 0 N ≅ N) ∧
      ∀ n, 0 < n → IsZero (andreQuillenHomology A (Polynomial A) n N) := by sorry
-- test_aq_regular_quotient
example (p : ℕ) [Fact p.Prime] :
    Nonempty (andreQuillenHomology ℤ (ZMod p) 1 (ModuleCat.of (ZMod p) (ZMod p)) ≅
      ModuleCat.of (ZMod p) (ZMod p)) ∧
    ∀ n, n ≠ 1 → IsZero (andreQuillenHomology ℤ (ZMod p) n (ModuleCat.of (ZMod p) (ZMod p))) := by sorry
-- test_aq_nonregular_local
example (k : Type) [Field k] (ρ : Dual k →ₐ[k] k)
    (hρ : ρ (Ideal.Quotient.mk _ Polynomial.X) = 0) :
    letI : Algebra (Dual k) k := ρ.toRingHom.toAlgebra
    Nonempty (andreQuillenHomology (Dual k) k 2 (ModuleCat.of k k) ≅ ModuleCat.of k k) := by sorry

/- DerivedDeRhamCohomology:DD.1/koszul-complex
For a commutative ring A, an A-module E and a linear map φ:E→A, construct the homological Koszul complex K_A(φ) with degree n term ∧ⁿ_A E and differential d(e₁∧…∧e_n)=Σ_j(−1)^(j−1)φ(e_j)e₁∧…∧ê_j∧…∧e_n. Its exterior multiplication is a differential graded A-algebra. For a finite sequence f₁,…,f_r take E=A^r, φ(e_i)=f_i; the equivalent cochain complex occupies [−r,0]. General E is allowed; perfectness is asserted only for finite projective E.
Typed boundary: Degree-one contraction, regular-sequence resolution, annihilation on homology and three tests; the full contraction, chosen dg maps/tensor and null-homotopies are omitted.
-/
def koszulComplex (A : Type) [CommRing A] (E : Type) [AddCommGroup E] [Module A E]
    (φ : E →ₗ[A] A) : CochainComplex (ModuleCat A) ℤ := by sorry
private def koszulTerm (A : Type) [CommRing A] (E : Type) [AddCommGroup E] [Module A E]
    (φ : E →ₗ[A] A) (n : ℕ) :
    (koszulComplex A E φ).X (-(n : ℤ)) ≅ ModuleCat.of A (exteriorPower A n E) := by sorry
-- Degree-one contraction, including its sign, rather than merely the term carrier.
lemma koszulDifferential (A : Type) [CommRing A] (E : Type) [AddCommGroup E] [Module A E]
    (φ : E →ₗ[A] A) (e : E) :
    (exteriorPower.zeroEquiv A E)
      ((koszulTerm A E φ 0).hom
        ((koszulComplex A E φ).d (-1) 0
          ((koszulTerm A E φ 1).inv ((exteriorPower.oneEquiv A E).symm e)))) = φ e := by sorry
lemma koszulRegular (A : Type) [CommRing A] (xs : List A)
    (hx : RingTheory.Sequence.IsRegular A xs) : Nonempty
    ((DerivedCategory.Q (C := ModuleCat A)).obj
      (koszulComplex A (Fin xs.length →₀ A) (Finsupp.linearCombination A xs.get)) ≅
      mod0 A (ModuleCat.of A (A ⧸ Ideal.ofList xs))) := by sorry
lemma koszulHomotopy (A : Type) [CommRing A] (E : Type) [AddCommGroup E] [Module A E]
    (φ : E →ₗ[A] A) (e : E) (n : ℤ)
    (x : H A n ((DerivedCategory.Q (C := ModuleCat A)).obj (koszulComplex A E φ))) :
    φ e • x = 0 := by sorry
-- test_koszul_empty
example (A : Type) [CommRing A] (φ : (Fin 0 → A) →ₗ[A] A) : Nonempty
    ((DerivedCategory.Q (C := ModuleCat A)).obj (koszulComplex A (Fin 0 → A) φ) ≅ unit A) := by sorry
-- test_koszul_one
example (p : ℕ) [Fact p.Prime] (φ : ℤ →ₗ[ℤ] ℤ) (hφ : φ 1 = p) :
    Nonempty (H ℤ 0 ((DerivedCategory.Q (C := ModuleCat ℤ)).obj (koszulComplex ℤ ℤ φ)) ≅
      ModuleCat.of ℤ (ZMod p)) ∧
    IsZero (H ℤ (-1) ((DerivedCategory.Q (C := ModuleCat ℤ)).obj (koszulComplex ℤ ℤ φ))) := by sorry
-- test_koszul_zero
example (A : Type) [CommRing A] : Nonempty
    (H A (-1) ((DerivedCategory.Q (C := ModuleCat A)).obj (koszulComplex A A 0)) ≅ ModuleCat.of A A) ∧
    Nonempty (H A 0 ((DerivedCategory.Q (C := ModuleCat A)).obj (koszulComplex A A 0)) ≅ ModuleCat.of A A) := by sorry

/- DerivedDeRhamCohomology:DD.1/derived-completeness
Let I=(f₁,…,f_r)⊂A be finitely generated. A complex M∈D(A) is derived I-complete if RHom_A(A[1/f_i],M)=0 for each i, equivalently Hom_D(A)(A[1/f_i][n],M)=0 for every integer n and i. This depends only on √I and is equivalent to each H^j(M) being a derived I-complete module. Completeness is a homotopical condition, not ordinary separatedness.
Typed boundary: Generator, radical and cohomology criteria and tests; enhanced limit closure is omitted, rather than replaced by shift stability.
-/
def derivedCompleteness (A : Type) [CommRing A] (I : Ideal A) (M : D A) : Prop :=
  ∀ f ∈ I, ∀ n : ℤ,
    Subsingleton ((mod0 A (ModuleCat.of A (Localization.Away f)))⟦n⟧ ⟶ M)
lemma isDerivedCompleteGenerators (A : Type) [CommRing A] (I : Ideal A) (M : D A)
    (s : Finset A) (hs : Ideal.span (s : Set A) = I) :
    derivedCompleteness A I M ↔ ∀ f ∈ s, ∀ n : ℤ,
      Subsingleton ((mod0 A (ModuleCat.of A (Localization.Away f)))⟦n⟧ ⟶ M) := by sorry
lemma isDerivedCompleteRadical (A : Type) [CommRing A] (I J : Ideal A)
    (hI : I.FG) (hJ : J.FG) (h : I.radical = J.radical) (M : D A) :
    derivedCompleteness A I M ↔ derivedCompleteness A J M := by sorry
lemma isDerivedCompleteCohomology (A : Type) [CommRing A] (I : Ideal A)
    (hI : I.FG) (M : D A) : derivedCompleteness A I M ↔
      ∀ j : ℤ, derivedCompleteness A I (mod0 A (H A j M)) := by sorry
-- test_complete_zero_ideal
example (A : Type) [CommRing A] (M : D A) : derivedCompleteness A ⊥ M := by sorry
-- test_complete_unit_ideal
example (A : Type) [CommRing A] (M : D A) : derivedCompleteness A ⊤ M ↔ IsZero M := by sorry
-- test_complete_zp
example (p : ℕ) [Fact p.Prime] :
    derivedCompleteness ℤ (pIdeal ℤ p) (mod0 ℤ (ModuleCat.of ℤ (PadicInt p))) ∧
    ¬ derivedCompleteness ℤ (pIdeal ℤ p) (mod0 ℤ (ModuleCat.of ℤ (Padic p))) := by sorry

/- DerivedDeRhamCohomology:DD.1/derived-completion
For finite-generated I⊂A construct Λ_I:D(A)→D_I-comp(A) left adjoint to the inclusion, with natural unit η_M:M→Λ_I M. For I=(f_i), put C_I=⊗_i[A→A[1/f_i]] in cochain degrees 0,1 and Λ_I M=RHom_A(C_I,M). This is exact, independent of generators, idempotent and preserves colimits formed in the complete category. Derived Nakayama: if M is complete and M⊗^L_A A/I=0 then M=0.
Typed boundary: Finite-ideal ordinary reflector, unit precomposition bijection, idempotence, Nakayama, completeness of the reflected object and tests. The complete-category colimit contract remains explicitly omitted.
-/
def derivedCompletion (A : Type) [CommRing A] (I : Ideal A) (M : D A) : D A := by sorry
-- A chosen natural unit, rather than the vacuous existence of a zero map.
def completionUnit (A : Type) [CommRing A] (I : Ideal A) (M : D A) :
    M ⟶ derivedCompletion A I M := by sorry
lemma completionAdjunction (A : Type) [CommRing A] (I : Ideal A) (hI : I.FG)
    (M N : D A) (hN : derivedCompleteness A I N) :
    Function.Bijective (fun f : derivedCompletion A I M ⟶ N => completionUnit A I M ≫ f) := by sorry
lemma completionIdempotent (A : Type) [CommRing A] (I : Ideal A) (hI : I.FG)
    (M : D A) : IsIso (completionUnit A I (derivedCompletion A I M)) := by sorry
lemma completeNakayama (A : Type) [CommRing A] (I : Ideal A) (hI : I.FG)
    (M : D A) (hM : derivedCompleteness A I M) (hred : IsZero (reduction A I M)) :
    IsZero M := by sorry
lemma completionComplete (A : Type) [CommRing A] (I : Ideal A) (hI : I.FG)
    (M : D A) : derivedCompleteness A I (derivedCompletion A I M) := by sorry
-- test_completion_z
example (p : ℕ) [Fact p.Prime] : Nonempty
    (derivedCompletion ℤ (pIdeal ℤ p) (unit ℤ) ≅ mod0 ℤ (ModuleCat.of ℤ (PadicInt p))) := by sorry
-- test_completion_inverted
example (A : Type) [CommRing A] (p : A) : IsZero
    (derivedCompletion A (Ideal.span {p}) (mod0 A (ModuleCat.of A (Localization.Away p)))) := by sorry
-- test_completion_torsion
example (A : Type) [CommRing A] (p : A) (m : ℕ) (hm : 0 < m) :
    IsIso (completionUnit A (Ideal.span {p})
      (mod0 A (ModuleCat.of A (A ⧸ Ideal.span {p^m})))) := by sorry

/- DerivedDeRhamCohomology:DD.1/complete-flatness
For finite I⊂A, an object M∈D(A) is I-completely flat when M⊗^L_A A/I is a flat A/I-module in degree zero, equivalently M⊗^L_A N is discrete for every I-power-torsion A-module N. It is I-completely faithfully flat if that reduction is faithfully flat. The predicate itself does not require M to be complete. Define finite I-complete Tor-amplitude [a,b] using the derived reduction and all discrete A/I-modules.
Typed boundary: Actual derived quotient and fixed tensor, flatness/Tor-amplitude criterion, completion and three named tests. The Z test includes failure of completeness, the Z_p test includes faithful flatness of reduction, and the F_p obstruction is typed over Z. Canonical complete base change is omitted.
-/
def completeFlatness (A : Type) [CommRing A] (I : Ideal A) (M : D A) : Prop :=
  (∀ n : ℤ, n ≠ 0 → IsZero (H (A ⧸ I) n (reduction A I M))) ∧
    Module.Flat (A ⧸ I) (H (A ⧸ I) 0 (reduction A I M))
lemma completeFlatReduction (A : Type) [CommRing A] (I : Ideal A) (M : D A) :
    completeFlatness A I M ↔ amplitude (A ⧸ I) (reduction A I M) 0 0 := by sorry
lemma completeFlatCompletion (A : Type) [CommRing A] (I : Ideal A) (hI : I.FG)
    (M : Type) [AddCommGroup M] [Module A M] [Module.Flat A M] :
    completeFlatness A I (derivedCompletion A I (mod0 A (ModuleCat.of A M))) := by sorry
lemma completeTorAmplitude (A : Type) [CommRing A] (I : Ideal A) (M : D A) (a b : ℤ)
    (h : amplitude (A ⧸ I) (reduction A I M) a b) :
    ∀ n : ℤ, n < a ∨ b < n → IsZero (H (A ⧸ I) n (reduction A I M)) := by sorry
-- test_complete_flat_z
example (p : ℕ) [Fact p.Prime] :
    completeFlatness ℤ (pIdeal ℤ p) (unit ℤ) ∧
    ¬ derivedCompleteness ℤ (pIdeal ℤ p) (unit ℤ) := by sorry
-- test_complete_flat_zp
example (p : ℕ) [Fact p.Prime] :
    completeFlatness ℤ (pIdeal ℤ p) (mod0 ℤ (ModuleCat.of ℤ (PadicInt p))) ∧
    Module.FaithfullyFlat (ℤ ⧸ pIdeal ℤ p)
      (H (ℤ ⧸ pIdeal ℤ p) 0
        (reduction ℤ (pIdeal ℤ p) (mod0 ℤ (ModuleCat.of ℤ (PadicInt p))))) := by sorry
-- test_complete_flat_fp_boundary
example (p : ℕ) [Fact p.Prime] :
    ¬ completeFlatness ℤ (pIdeal ℤ p) (mod0 ℤ (ModuleCat.of ℤ (ZMod p))) := by sorry

/- DerivedDeRhamCohomology:DD.1/bounded-torsion-criterion
Assume A has bounded p-power torsion. If M is derived p-complete and has p-complete Tor-amplitude [a,b], then M has ordinary cohomological amplitude [a,b]. Bounded p-power torsion in every cohomology group does not follow from this finite amplitude assumption. The bounded-torsion conclusion below is restricted to the p-completely flat case [a,b]=[0,0]. In particular derived p-complete, p-completely flat M is an ordinary p-adically complete bounded-torsion module with M/p^n flat over A/p^n and M[p^n]≃M⊗_A A[p^n]. Conversely an ordinary p-complete bounded-torsion module satisfying these flatness/torsion conditions is p-completely flat.
Typed boundary: Only BMS2 Lemma 4.6 ordinary cohomological amplitude, with bounded-torsion base, derived completeness and actual complete Tor-amplitude hypotheses. The stronger complete-flat bounded-torsion package is omitted.
-/
-- BMS2 Lemma 4.6 gives ordinary amplitude, not bounded torsion at finite amplitude.
lemma boundedTorsionCriterion (p : ℕ) [Fact p.Prime] (A : Type) [CommRing A]
    (hA : boundedTorsion p A) (M : D A) (hM : derivedCompleteness A (pIdeal A p) M)
    (a b : ℤ) (hamp : amplitude (A ⧸ pIdeal A p) (reduction A (pIdeal A p) M) a b) :
    ∀ n : ℤ, n < a ∨ b < n → IsZero (H A n M) := by sorry

/- DerivedDeRhamCohomology:DD.1/ordinary-flatness-from-complete-flatness
Let A be Noetherian, π∈A, and suppose A and an A-algebra B are π-torsion-free and classically π-adically complete. If A/π→B/π is flat, then A→B is flat; if it is faithfully flat, then A→B is faithfully flat. This is the Noetherian algebra criterion of Bhatt Proposition 5.1, not a general identification of complete flatness and ordinary flatness.
Typed boundary: The flatness conclusion for Noetherian A and π-torsion-free classically π-complete A and B, with actual derived reduction flatness; the faithful variant is omitted.
-/
lemma ordinaryFlatnessFromCompleteFlatness (A B : Type) [CommRing A] [CommRing B]
    [Algebra A B] [IsNoetherianRing A] (π : A)
    (hπA : IsSMulRegular A π) (hπB : IsSMulRegular B (algebraMap A B π))
    (hA : IsAdicComplete (Ideal.span {π}) A)
    (hB : IsAdicComplete (Ideal.span {π}) B)
    (hflat : completeFlatness A (Ideal.span {π}) (mod0 A (ModuleCat.of A B))) :
    Module.Flat A B := by sorry

/- DerivedDeRhamCohomology:DD.1/quotient-completeness
Let N be an A-module, f,g∈A. If N is classically f-adically complete and f acts injectively on N/gN, then N/gN is classically f-adically complete. Derived completeness of cokernels supplies the intermediate assertion; f-separatedness follows from injectivity and derived completeness. No unconditional claim that every quotient of a classically complete module is separated is made.
Typed boundary: Derived completeness of the actual cokernel N/gN only. The classical separatedness/completeness conclusion under injectivity of f on that quotient is omitted.
-/
lemma quotientCompleteness (A : Type) [CommRing A] (N : ModuleCat A) (f g : A)
    (h : derivedCompleteness A (Ideal.span {f}) (mod0 A N)) :
    derivedCompleteness A (Ideal.span {f})
      (mod0 A (ModuleCat.of A (N ⧸ LinearMap.range (g • (LinearMap.id : N →ₗ[A] N))))) := by sorry

/- DerivedDeRhamCohomology:DD.0/quasisyntomic-condition
Fix a prime p. A quasisyntomic ring A is an ordinary p-adically complete ring with bounded p-power torsion and L_(A/Z)⊗^L_A A/p of Tor-amplitude [−1,0]. A quasisyntomic map A→B between such objects is p-completely flat and L_(B/A)⊗^L_B B/p has Tor-amplitude [−1,0]; a cover is p-completely faithfully flat. The mod-p ring in this formula is the ordinary A/p while the module tensor is derived. Object and morphism conditions are distinct.
Typed boundary: Separate p-complete bounded-torsion objects, complete-flat relative maps, coefficient-tested cotangent amplitude, composition and three tests. Topology and faithfully flat covering criterion are omitted. The absolute ℤ view requires the usual completed ℤ-to-ℤ_p cotangent comparison.
-/
-- Object and relative-map conditions are separate. Reduction is derived over
-- the ordinary quotient ring; amplitude is tested against every discrete coefficient.
private def qsynRing (A : Type) [CommRing A] (p : ℕ) : Prop :=
  IsAdicComplete (pIdeal A p) A ∧ boundedTorsion p A ∧
    amplitude (A ⧸ pIdeal A p) (reduction A (pIdeal A p) (cotangentComplex ℤ A)) (-1) 0
def quasisyntomicCondition (A B : Type) [CommRing A] [CommRing B] [Algebra A B]
    (p : ℕ) [Fact p.Prime] : Prop :=
  qsynRing A p ∧ qsynRing B p ∧ completeFlatness A (pIdeal A p) (mod0 A (ModuleCat.of A B)) ∧
    amplitude (B ⧸ pIdeal B p) (reduction B (pIdeal B p) (cotangentComplex A B)) (-1) 0
lemma quasisyntomicComp (A B C : Type) [CommRing A] [CommRing B] [CommRing C]
    [Algebra A B] [Algebra B C] [Algebra A C] [IsScalarTower A B C] (p : ℕ) [Fact p.Prime]
    (hAB : quasisyntomicCondition A B p) (hBC : quasisyntomicCondition B C p) :
    quasisyntomicCondition A C p := by sorry
-- test_qsyn_zp
example (p : ℕ) [Fact p.Prime] : qsynRing (PadicInt p) p := by sorry
-- test_qsyn_fp_map_boundary
example (p : ℕ) [Fact p.Prime] : qsynRing (ZMod p) p ∧
    ¬ completeFlatness ℤ (pIdeal ℤ p) (mod0 ℤ (ModuleCat.of ℤ (ZMod p))) := by sorry
-- test_qsyn_smooth: require complete objects; a smooth uncompleted ring need not qualify.
example (p : ℕ) [Fact p.Prime] (A B : Type) [CommRing A] [CommRing B] [Algebra A B]
    [Algebra.Smooth A B] (hA : qsynRing A p)
    (hB : IsAdicComplete (pIdeal B p) B) (ht : boundedTorsion p B) :
    quasisyntomicCondition A B p := by sorry

/- DerivedDeRhamCohomology:DD.2/polynomial-resolution-derham
For a map of animated commutative rings A→B, define dR_(B/A) by the sifted-colimit extension of the polynomial ordinary de Rham functor: for a free resolution P•→B use |Ω•_(P•/A)| with direct sums along antidiagonals. This is a coherent E∞ A-algebra with a decreasing multiplicative Hodge filtration, natural in the base square and independent of a free resolution. No derived Hodge completeness is imposed; its completion is a separate reflection. The construction is not the ordinary smooth de Rham complex over every base.
Typed boundary: Canonical forgetful object and map, identity and rational Laurent collapse. Resolution independence, Hodge tails and weight-zero graded quotient are omitted.
-/
-- Forget the coherent algebra but retain its canonical augmented filtration.
def ofPolynomialResolution (A B : Type) [CommRing A] [CommRing B] [Algebra A B] :
    FilteredModel A := by sorry
def map (A B C : Type) [CommRing A] [CommRing B] [CommRing C]
    [Algebra A B] [Algebra A C] (f : B →ₐ[A] C) :
    (ofPolynomialResolution A B).filtration ⟶ (ofPolynomialResolution A C).filtration := by sorry
-- test_identity_algebra
example (A : Type) [CommRing A] : Nonempty
    ((ofPolynomialResolution A A).underlying ≅ unit A) := by sorry
-- test_rational_laurent_boundary: uncompleted side only; the ordinary dt/t calculation stays in the packet.
example : Nonempty ((ofPolynomialResolution ℚ (LaurentPolynomial ℚ)).underlying ≅ unit ℚ) := by sorry

/- DerivedDeRhamCohomology:DD.2/characteristic-zero-completion-boundary
For a map of Q-algebras A→B the direct-sum (uncompleted) derived de Rham complex satisfies dR_(B/A)≃A (Corollary 2.5). Hence the uncompleted theory cannot be identified with ordinary de Rham cohomology of smooth Q-algebras: for B=Q[t,t^{−1}] over Q the ordinary de Rham complex has the nonzero class dt/t in degree one while dR_(B/Q)≃Q (the source states exactly this example in Remark 3.12, p.8). Remark 2.6 identifies the Hodge-completed complex (product totalisation) as the variant whose Hodge-to-de Rham spectral sequence converges and which agrees with classical de Rham cohomology for smooth maps; that completed comparison is asserted there, not proved in the inspected range. Hodge completion and p-adic completion are distinct operations. In characteristic p the uncompleted smooth comparison dR_(B/A)≃Ω*_(B/A) for smooth maps of Z/p^n-algebras is a separate theorem (Corollary 3.10, p.8; statement and proof read in review R2, imported inputs unread), not a consequence of this node.
Typed boundary: Only uncompleted collapse for an actual tower of Q-algebras. The ordinary and Hodge-completed comparison interiors remain in the full contract and their recorded gap.
-/
lemma rationalCollapse (A B : Type) [CommRing A] [CommRing B] [Algebra A B]
    [Algebra ℚ A] [Algebra ℚ B] [IsScalarTower ℚ A B] :
    Nonempty ((ofPolynomialResolution A B).underlying ≅ unit A) := by sorry

/- DerivedDeRhamCohomology:DD.2/ordinary-base-change-kunneth
For an ordinary base square A→A′, B′=B⊗_A A′, the ordinary differential graded de Rham algebra satisfies Ω•_(B/A)⊗_A A′≃Ω•_(B′/A′), with its ordinary tensor and Hodge filtration. For polynomial A-algebras B,C, Ω•_(B⊗_A C/A)≃Ω•_(B/A)⊗_AΩ•_(C/A), including the signed differential and degree-sum filtration. In the polynomial case these complexes are termwise flat, so the derived tensor computes the same object. The ordinary formula does not justify replacing a derived algebra pushout by an ordinary pushout outside Tor independence.
Typed boundary: Only the degreewise differential-form base-change equivalence for the actual tensor-product algebra. Differential, filtration and the polynomial two-algebra Kunneth compatibility are omitted.
-/
-- The target is the actual tensor-product algebra, rather than an unrelated B′.
lemma ordinaryBaseChangeKunneth (A B C : Type) [CommRing A] [CommRing B] [CommRing C]
    [Algebra A B] [Algebra A C] (n : ℕ) : Nonempty
    ((C ⊗[A] TauCeti.DeRham.Forms A B n) ≃ₗ[C]
      TauCeti.DeRham.Forms C (C ⊗[A] B) n) := by sorry

/- DerivedDeRhamCohomology:DD.2/ordinary-de-rham-universal-property
For an ordinary A-algebra B, Ω•_(B/A) is initial among nonnegatively graded strictly graded-commutative differential graded A-algebras D with odd squares zero and an A-algebra map B→D⁰. The unique dg map sends b to its degree-zero image and db to its differential, hence b₀ db₁∧…∧db_n to f(b₀)d f(b₁)…d f(b_n). The odd-square condition is part of the target even in characteristic 2.
Typed boundary: Only uniqueness on the elementary generators in the underlying complex; the graded-algebra existence theorem is omitted.
-/
-- Forgetful uniqueness only; graded-algebra existence is explicitly omitted.
lemma ordinaryDeRhamUniversalProperty (A B : Type) [CommRing A] [CommRing B] [Algebra A B]
    (G : CochainComplex (ModuleCat A) ℕ) (f g : TauCeti.DeRham.complex A B ⟶ G)
    (h : ∀ n (c : B) (v : Fin n → B),
      f.f n (TauCeti.DeRham.elementary A B n c v) =
      g.f n (TauCeti.DeRham.elementary A B n c v)) : f = g := by sorry

/- DerivedDeRhamCohomology:DD.2/hodge-completed-derham
Define dR^hc_(B/A)=Rlim_i(dR_(B/A)/Fil_H^i), with its complete decreasing filtration as the DD.1 reflection of the Hodge-filtered object. The natural dR→dR^hc map is universal among maps to complete Hodge-filtered objects and leaves every graded piece L∧^i L_(B/A)[−i] unchanged. Hodge completion and p-completion are different operations.
Typed boundary: Canonical forgetful completed object, identity and rational Laurent H1 tests only; the reflector and complete dual-number test remain omitted.
-/
def hodgeCompletedDerham (A B : Type) [CommRing A] [CommRing B] [Algebra A B] :
    FilteredModel A := by sorry
-- test_hodge_complete_base
example (A : Type) [CommRing A] : Nonempty
    ((hodgeCompletedDerham A A).underlying ≅ unit A) := by sorry
-- test_hodge_complete_rational_laurent
example : Nonempty (H ℚ 1 (hodgeCompletedDerham ℚ (LaurentPolynomial ℚ)).underlying ≅
    ModuleCat.of ℚ ℚ) := by sorry

/- DerivedDeRhamCohomology:DD.2/p-completed-derham
For A→B define dR̂_(B/A)=Λ_(p)dR_(B/A)=Rlim_n(dR_(B/A)⊗^L_Z Z/p^n). Apply p-completion to every specified filtration term, and use completed tensor for its multiplication. A p-completed increasing conjugate diagram is not automatically exhaustive before a bounded-connectivity argument. For maps of p-completely flat bounded-torsion algebras the mod-p computation uses the ordinary reductions; general reductions are animated.
Typed boundary: Canonical forgetful completed object and identity test only; compatible finite reductions, base squares, completed tensor and other tests remain omitted.
-/
def pCompletedDerham (A B : Type) [CommRing A] [CommRing B] [Algebra A B] (p : ℕ) :
    FilteredModel A := by sorry
-- test_p_derham_identity
example (A : Type) [CommRing A] (p : ℕ) : Nonempty
    ((pCompletedDerham A A p).underlying ≅ derivedCompletion A (pIdeal A p) (unit A)) := by sorry

-- CR.2 supplies this particular crystalline value, with the canonical base PD structure.
-- This is its forgetful view, not a second construction of the crystalline site.
private def crystallineValue (p n : ℕ) (A B : Type) [CommRing A] [CommRing B]
    [Algebra A B] [Algebra (ZMod (p^n)) A] [Algebra (ZMod (p^n)) B]
    [IsScalarTower (ZMod (p^n)) A B] : FilteredModel A := by sorry

/- DerivedDeRhamCohomology:DD.4/crystalline-comparison-map
For an ordinary map A→B of Z/p^n-algebras, n≥1, construct Comp_(B/A):dR_(B/A)→RΓ((B/A)_crys,O_crys) as a natural map of Hodge-filtered E∞ A-algebras. The crystalline site has nilpotent PD thickenings compatible with the canonical divided powers on p. On a surjective free resolution P•→B, map Ω•_(P•/A) into Ω•_(P•/A)⊗_(P•)D_(P•)(ker(P•→B)) and use the PD Poincaré comparison. The target is classical crystalline cohomology of B (of π₀B for the separately specified animated extension).
Typed boundary: Canonical CR.2 value and comparison over Z/p^n, smooth isomorphism with endpoint flatness, identity and the fixed non-lci square-zero test. Sheaf, Hodge and naturality contracts remain omitted.
-/
def crystallineComparisonMap (p n : ℕ) [Fact p.Prime] (hn : 0 < n)
    (A B : Type) [CommRing A] [CommRing B] [Algebra A B]
    [Algebra (ZMod (p^n)) A] [Algebra (ZMod (p^n)) B]
    [IsScalarTower (ZMod (p^n)) A B] :
    (ofPolynomialResolution A B).filtration ⟶ (crystallineValue p n A B).filtration := by sorry
lemma crystallineComparisonSmooth (p n : ℕ) [Fact p.Prime] (hn : 0 < n)
    (A B : Type) [CommRing A] [CommRing B] [Algebra A B]
    [Algebra (ZMod (p^n)) A] [Algebra (ZMod (p^n)) B]
    [IsScalarTower (ZMod (p^n)) A B]
    [Module.Flat (ZMod (p^n)) A] [Module.Flat (ZMod (p^n)) B] [Algebra.Smooth A B] :
    IsIso (crystallineComparisonMap p n hn A B) := by sorry
-- test_crys_map_base
example (p : ℕ) [Fact p.Prime] :
    IsIso (crystallineComparisonMap p 1 (by omega) (ZMod (p^1)) (ZMod (p^1))) := by sorry
-- test_crys_map_nonlci: the fixed square-zero algebra, not all comparison maps.
example (p : ℕ) [Fact p.Prime] :
    ¬ IsIso (crystallineComparisonMap p 1 (by omega)
      (ZMod (p^1)) (SquareZero2 (ZMod (p^1)))) := by sorry

/- Full-contract omission inventory. These are mathematical names, not Lean
declarations. They deliberately omit unavailable conditions under PROTOCOL §13.
The complete statement, source route and tests remain in the packet and reader. -/

/-!
## Interfaces needing enhanced or neighbouring-roadmap carriers

The following names specify mathematical targets in the README. Their signatures
are omitted here because the stated carriers or coherent conditions cannot be
expressed by the imported ordinary views. Each group records its boundary once;
every omitted declaration, API item and test keeps its name and contract.
These comments introduce no axioms or Prop placeholders.
-/

/- DD.0: The full cotangent complex
Boundary: Ordinary inputs, H0 and three cohomological tests only; resolution witnesses and coherent functoriality remain omitted.
Required interface: Animated ring/module pairs and coherent square-zero mapping spaces require EDS E5/E1. Ordinary Hom sets do not recover higher homotopy.

OMITTED api: TauCeti.DerivedDeRham.cotangentMap
Every commutative square (A→B)→(A′→B′) gives L_(B/A)⊗^L_B B′→L_(B′/A′), with identity and composition coherences.

OMITTED api: TauCeti.DerivedDeRham.cotangentResolutionEquiv
Every free resolution gives the normalized differential model, naturally and coherently in comparison maps.
-/

/- DD.0: Derived derivations and square-zero extensions
Boundary: The independent intrinsic section space of the split square-zero extension must be constructed in the animated (prelog) slice, with its projection and base point. Mapping spaces are unavailable at the pin; defining this space as cotangent Hom would make the comparison circular. The whole space signature is omitted.
Required interface: The independent intrinsic section space of the split square-zero extension must be constructed in the animated (prelog) slice, with its projection and base point. Mapping spaces are unavailable at the pin; defining this space as cotangent Hom would make the comparison circular. The whole space signature is omitted.

OMITTED declaration: TauCeti.DerivedDeRham.derivedDerivations
For A→B animated and a connective B-module M, define Der_A(B,M) as Map_(CAlg_A/B)(B,B⊕M), the space of sections of the split square-zero A-algebra extension. The multiplication is (b,m)(b′,m′)=(bb′,bm′+b′m). This mapping space, including its higher homotopy, is the intrinsic derivation functor.

OMITTED api: TauCeti.DerivedDeRham.squareZero
B⊕M has projection to B and zero section, with square-zero augmentation ideal M.

OMITTED api: TauCeti.DerivedDeRham.derivationZero
The zero derivation is the canonical base point of Der_A(B,M).

OMITTED api: TauCeti.DerivedDeRham.derivationPostcompose
A B-linear map M→N induces Der_A(B,M)→Der_A(B,N), preserving the zero section.

OMITTED api: TauCeti.DerivedDeRham.derivationDiscrete
For ordinary B and an ordinary module M, π₀ Der_A(B,M) is the usual A-derivation set.

OMITTED test: TauCeti.DerivedDeRham.test_derivation_base
Der_A(A,M) is contractible.

OMITTED test: TauCeti.DerivedDeRham.test_derivation_coordinate
For B=A[t], Der_A(B,M) is the underlying anima of M via δ↦δ(t).

OMITTED test: TauCeti.DerivedDeRham.test_derivation_product_rule
For discrete M, a section sends t² to (t²,2tδ(t)); replacing the square-zero product by a product ring fails.
-/

/- DD.0: The cotangent universal property
Boundary: The independent intrinsic section space of the split square-zero extension must be constructed in the animated (prelog) slice, with its projection and base point. Mapping spaces are unavailable at the pin; defining this space as cotangent Hom would make the comparison circular. The whole space signature is omitted.
Required interface: The independent intrinsic section space of the split square-zero extension must be constructed in the animated (prelog) slice, with its projection and base point. Mapping spaces are unavailable at the pin; defining this space as cotangent Hom would make the comparison circular. The whole space signature is omitted.

OMITTED declaration: TauCeti.DerivedDeRham.derivationsCotangentComparison
For A→B animated and connective M there is a natural equivalence Map_(Mod_B)(L_(B/A),M)≃Der_A(B,M), compatible with base squares and module maps. This compares the independent square-zero characterization with the polynomial-resolution object, including higher homotopies.
-/

/- DD.0: Localization and filtered colimits of cotangent complexes
Boundary: Animated ring/module pairs and coherent square-zero mapping spaces require EDS E5/E1. Ordinary Hom sets do not recover higher homotopy.
Required interface: Animated ring/module pairs and coherent square-zero mapping spaces require EDS E5/E1. Ordinary Hom sets do not recover higher homotopy.

OMITTED declaration: TauCeti.DerivedDeRham.cotangentLocalizationColimits
For an ordinary ring B and multiplicative set S, L_(S⁻¹B/B)=0 and L_(S⁻¹B/A)≃L_(B/A)⊗^L_B S⁻¹B. Cotangent complexes commute with filtered colimits of animated A-algebras in the module-pair category: if B=colim_j B_j, L_(B/A)≃colim_j(L_(B_j/A)⊗^L_(B_j)B).
-/

/- DD.0: Derived exterior powers
Boundary: The general connective module-pair power functors require a primary construction and integral décalage proof (the existing powers gap). BL Appendix B supplies only cotangent-specialized exterior powers. No generic power on all D(B), arbitrary ordinary weight, or arbitrary base-change operator is retained.
Required interface: The general connective module-pair power functors require a primary construction and integral décalage proof (the existing powers gap). BL Appendix B supplies only cotangent-specialized exterior powers. No generic power on all D(B), arbitrary ordinary weight, or arbitrary base-change operator is retained.

OMITTED declaration: TauCeti.DerivedDeRham.derivedExteriorPowers
For an animated ring B and a connective B-module M define L∧^n_B(M), n≥0, by the sifted-colimit extension of the ordinary exterior power on finite free modules, computed using a simplicial projective module resolution. It is a connective B-module, with coherent base change and graded multiplication. Use derived operations; for a flat discrete M this agrees with the ordinary exterior power. The exterior operation imposes x∧x=0 even at 2.

OMITTED api: TauCeti.DerivedDeRham.exteriorPowerZero
L∧⁰_B(M)≃B naturally.

OMITTED api: TauCeti.DerivedDeRham.exteriorPowerOne
L∧¹_B(M)≃M.

OMITTED api: TauCeti.DerivedDeRham.exteriorPowerBaseChange
L∧ⁿ_B(M)⊗^L_B B′≃L∧ⁿ_(B′)(M⊗^L_B B′).

OMITTED api: TauCeti.DerivedDeRham.exteriorPowerFlat
For flat discrete M, L∧ⁿ_B(M) is the ordinary exterior power in degree zero.

OMITTED test: TauCeti.DerivedDeRham.test_derived-exterior-powers_zero_weight
L∧⁰_B(0)=B and L∧ⁿ_B(0)=0 for n>0.

OMITTED test: TauCeti.DerivedDeRham.test_derived-exterior-powers_rank_one
For the flat rank-one B-module Be, L∧²(Be)=0, including B=F₂.

OMITTED test: TauCeti.DerivedDeRham.test_derived-exterior-powers_integral_boundary
For flat M=B and n≥0, L∧ⁿ(M[1])≃Γⁿ(M)[n], so positive powers of a shifted line are nonzero.
-/

/- DD.0: Derived symmetric powers
Boundary: The general connective module-pair power functors require a primary construction and integral décalage proof (the existing powers gap). BL Appendix B supplies only cotangent-specialized exterior powers. No generic power on all D(B), arbitrary ordinary weight, or arbitrary base-change operator is retained.
Required interface: The general connective module-pair power functors require a primary construction and integral décalage proof (the existing powers gap). BL Appendix B supplies only cotangent-specialized exterior powers. No generic power on all D(B), arbitrary ordinary weight, or arbitrary base-change operator is retained.

OMITTED declaration: TauCeti.DerivedDeRham.derivedSymmetricPowers
For an animated ring B and a connective B-module M define LSym^n_B(M), n≥0, by the sifted-colimit extension of the ordinary symmetric power on finite free modules, computed using a simplicial projective module resolution. It is a connective B-module, with coherent base change and graded multiplication. Use derived operations; for a flat discrete M this agrees with the ordinary symmetric power.

OMITTED api: TauCeti.DerivedDeRham.symmetricPowerZero
LSym⁰_B(M)≃B naturally.

OMITTED api: TauCeti.DerivedDeRham.symmetricPowerOne
LSym¹_B(M)≃M.

OMITTED api: TauCeti.DerivedDeRham.symmetricPowerBaseChange
LSymⁿ_B(M)⊗^L_B B′≃LSymⁿ_(B′)(M⊗^L_B B′).

OMITTED api: TauCeti.DerivedDeRham.symmetricPowerFlat
For flat discrete M, LSymⁿ_B(M) is the ordinary symmetric power in degree zero.

OMITTED test: TauCeti.DerivedDeRham.test_derived-symmetric-powers_zero_weight
LSym⁰_B(0)=B and LSymⁿ_B(0)=0 for n>0.

OMITTED test: TauCeti.DerivedDeRham.test_derived-symmetric-powers_rank_one
For the flat rank-one Z-module Ze, LSym² is free of rank one on e²; its coefficient map is quadratic.

OMITTED test: TauCeti.DerivedDeRham.test_derived-symmetric-powers_integral_boundary
Over F₂, Sym²(F₂e) is generated by e², whereas the square of e in the divided power algebra is zero.
-/

/- DD.0: Derived divided powers
Boundary: The general connective module-pair power functors require a primary construction and integral décalage proof (the existing powers gap). BL Appendix B supplies only cotangent-specialized exterior powers. No generic power on all D(B), arbitrary ordinary weight, or arbitrary base-change operator is retained.
Required interface: The general connective module-pair power functors require a primary construction and integral décalage proof (the existing powers gap). BL Appendix B supplies only cotangent-specialized exterior powers. No generic power on all D(B), arbitrary ordinary weight, or arbitrary base-change operator is retained.

OMITTED declaration: TauCeti.DerivedDeRham.derivedDividedPowers
For an animated ring B and a connective B-module M define LΓ^n_B(M), n≥0, by the sifted-colimit extension of the ordinary divided power on finite free modules, computed using a simplicial projective module resolution. It is a connective B-module, with coherent base change and graded multiplication. Use derived operations; for a flat discrete M this agrees with the ordinary divided power.

OMITTED api: TauCeti.DerivedDeRham.dividedPowerZero
LΓ⁰_B(M)≃B naturally.

OMITTED api: TauCeti.DerivedDeRham.dividedPowerOne
LΓ¹_B(M)≃M.

OMITTED api: TauCeti.DerivedDeRham.dividedPowerBaseChange
LΓⁿ_B(M)⊗^L_B B′≃LΓⁿ_(B′)(M⊗^L_B B′).

OMITTED api: TauCeti.DerivedDeRham.dividedPowerFlat
For flat discrete M, LΓⁿ_B(M) is the ordinary divided power in degree zero.

OMITTED test: TauCeti.DerivedDeRham.test_derived-divided-powers_zero_weight
LΓ⁰_B(0)=B and LΓⁿ_B(0)=0 for n>0.

OMITTED test: TauCeti.DerivedDeRham.test_derived-divided-powers_rank_one
For the flat rank-one Z-module Ze, LΓ² is free of rank one on γ₂(e), and e·e=2γ₂(e).

OMITTED test: TauCeti.DerivedDeRham.test_derived-divided-powers_integral_boundary
Over F_p, γ_p(e) in Γ(F_pe) is nonzero although e^p=p!γ_p(e)=0.
-/

/- DD.0: Exterior powers of a triangle
Boundary: The general connective module-pair power functors require a primary construction and integral décalage proof (the existing powers gap). BL Appendix B supplies only cotangent-specialized exterior powers. No generic power on all D(B), arbitrary ordinary weight, or arbitrary base-change operator is retained.
Required interface: The general connective module-pair power functors require a primary construction and integral décalage proof (the existing powers gap). BL Appendix B supplies only cotangent-specialized exterior powers. No generic power on all D(B), arbitrary ordinary weight, or arbitrary base-change operator is retained.

OMITTED declaration: TauCeti.DerivedDeRham.powerTriangleFiltration
For a fibre sequence K→L→M of connective B-modules, L∧ⁿL has a natural finite filtration of length n+1 with graded pieces L∧^jK⊗^L_B L∧^(n−j)M, 0≤j≤n. For a flat discrete module N, L∧ⁿ(N[1])≃Γⁿ(N)[n]. The finite filtration is functorial and its multiplication is compatible with the weight grading.
-/

/- DD.0: The finite-presentation lci amplitude criterion
Boundary: The local lci/Cohen-factorization, regular-local/residue-field, Frobenius-finite restriction-of-scalars or chosen p-basis predicates in this node must be imported or built faithfully. The pinned naive cotangent object cannot express these full criteria. No theorem drops their Noetherian, local, finiteness, coefficient or basis hypotheses.
Required interface: The local lci/Cohen-factorization, regular-local/residue-field, Frobenius-finite restriction-of-scalars or chosen p-basis predicates in this node must be imported or built faithfully. The pinned naive cotangent object cannot express these full criteria. No theorem drops their Noetherian, local, finiteness, coefficient or basis hypotheses.

OMITTED declaration: TauCeti.DerivedDeRham.lciAmplitude
For a flat finitely presented map A→B of ordinary rings, A→B is locally complete intersection precisely when L_(B/A) is perfect of Tor-amplitude [−1,0]. A local regular-sequence presentation gives the two-term model. No unrestricted converse for arbitrary nonnoetherian, non-finitely-presented maps is asserted.
-/

/- DD.0: André–Quillen homology
Boundary: Discrete coefficients with fixed EDS tensor, H0 and the three concrete tests; coefficient functoriality and the long exact sequence are omitted.
Required interface: Animated ring/module pairs and coherent square-zero mapping spaces require EDS E5/E1. Ordinary Hom sets do not recover higher homotopy.

OMITTED api: TauCeti.DerivedDeRham.andreQuillenCoefficients
A B-linear coefficient map induces natural maps on D_n.

OMITTED api: TauCeti.DerivedDeRham.andreQuillenTransitivity
The cotangent transitivity triangle induces the exact sequence of D_n with the appropriate scalar extensions.
-/

/- DD.0: Avramov’s absolute complete-intersection criterion
Boundary: The local lci/Cohen-factorization, regular-local/residue-field, Frobenius-finite restriction-of-scalars or chosen p-basis predicates in this node must be imported or built faithfully. The pinned naive cotangent object cannot express these full criteria. No theorem drops their Noetherian, local, finiteness, coefficient or basis hypotheses.
Required interface: The local lci/Cohen-factorization, regular-local/residue-field, Frobenius-finite restriction-of-scalars or chosen p-basis predicates in this node must be imported or built faithfully. The pinned naive cotangent object cannot express these full criteria. No theorem drops their Noetherian, local, finiteness, coefficient or basis hypotheses.

OMITTED declaration: TauCeti.DerivedDeRham.absoluteCompleteIntersection
For a Noetherian ring A, A is locally a complete-intersection ring (each completed local ring is a quotient of a regular local ring by a regular sequence) if and only if L_(A/Z) has Tor-amplitude [−1,0]. This is the absolute Noetherian criterion, without a finite-presentation hypothesis over Z. Local map versions use Cohen factorizations and D₂ with all coefficients.
-/

/- DD.0: André’s regularity criterion and the cotangent injection test
Boundary: The local lci/Cohen-factorization, regular-local/residue-field, Frobenius-finite restriction-of-scalars or chosen p-basis predicates in this node must be imported or built faithfully. The pinned naive cotangent object cannot express these full criteria. No theorem drops their Noetherian, local, finiteness, coefficient or basis hypotheses.
Required interface: The local lci/Cohen-factorization, regular-local/residue-field, Frobenius-finite restriction-of-scalars or chosen p-basis predicates in this node must be imported or built faithfully. The pinned naive cotangent object cannot express these full criteria. No theorem drops their Noetherian, local, finiteness, coefficient or basis hypotheses.

OMITTED declaration: TauCeti.DerivedDeRham.andreRegularity
For a Noetherian local ring (A,m,k), A is regular iff D₂(k|A,k)=0. If A is a complete-intersection local ring, this is equivalent to injectivity of H^−1(L_(A/Z)⊗^L_A k)→H^−1(L_(k/Z)). The injection reformulation retains the complete-intersection hypothesis; it is not a criterion obtained by truncating L_(A/Z) for arbitrary A.
-/

/- DD.0: F-finiteness and almost perfect cotangent complexes
Boundary: The local lci/Cohen-factorization, regular-local/residue-field, Frobenius-finite restriction-of-scalars or chosen p-basis predicates in this node must be imported or built faithfully. The pinned naive cotangent object cannot express these full criteria. No theorem drops their Noetherian, local, finiteness, coefficient or basis hypotheses.
Required interface: The local lci/Cohen-factorization, regular-local/residue-field, Frobenius-finite restriction-of-scalars or chosen p-basis predicates in this node must be imported or built faithfully. The pinned naive cotangent object cannot express these full criteria. No theorem drops their Noetherian, local, finiteness, coefficient or basis hypotheses.

OMITTED declaration: TauCeti.DerivedDeRham.fFiniteCotangent
For a Noetherian F_p-algebra S, Frobenius S→S is finite if and only if L_(S/F_p) is almost perfect. In particular each H^−nL_(S/F_p) is a finite S-module for F-finite S. Here almost perfect means bounded above with finitely generated homology (equivalently over a Noetherian ring a bounded-above resolution by finite projectives); it does not mean bounded or perfect.
-/

/- DD.0: p-bases and the dimension of differentials
Boundary: The local lci/Cohen-factorization, regular-local/residue-field, Frobenius-finite restriction-of-scalars or chosen p-basis predicates in this node must be imported or built faithfully. The pinned naive cotangent object cannot express these full criteria. No theorem drops their Noetherian, local, finiteness, coefficient or basis hypotheses.
Required interface: The local lci/Cohen-factorization, regular-local/residue-field, Frobenius-finite restriction-of-scalars or chosen p-basis predicates in this node must be imported or built faithfully. The pinned naive cotangent object cannot express these full criteria. No theorem drops their Noetherian, local, finiteness, coefficient or basis hypotheses.

OMITTED declaration: TauCeti.DerivedDeRham.pBasesDifferentials
For a field k of characteristic p with finite degree [k:k^p]=p^r, a p-basis b₁,…,b_r gives a basis db₁,…,db_r of Ω¹_(k/F_p), so dim_kΩ¹_(k/F_p)=r=log_p[k:k^p]. A p-basis means the p-monomials ∏b_i^e_i, 0≤e_i<p, form a k^p-basis; arbitrary transcendence bases are not substituted.
-/

/- DD.0: Cotangent obstruction theory for square-zero lifts
Boundary: The space of extensions with a specified ideal and its obstruction must be typed. Flat lifting assumes B flat over A and the additional ideal-identification/local-flatness theorem in the recorded gap; a zero cotangent morphism is not an obstruction classification.
Required interface: The space of extensions with a specified ideal and its obstruction must be typed. Flat lifting assumes B flat over A and the additional ideal-identification/local-flatness theorem in the recorded gap; a zero cotangent morphism is not an obstruction classification.

OMITTED declaration: TauCeti.DerivedDeRham.squareZeroDeformations
Let A′→A be a square-zero extension with ideal J and let B be a flat ordinary A-algebra. The obstruction to a flat lift B′ over A′ with B′⊗_(A′)A≃B is a natural class in Ext²_B(L_(B/A),J⊗_A B). When it vanishes, isomorphism classes of lifts form a torsor under Ext¹ and automorphisms under Ext⁰. For smooth B/A, finite projectivity of L in degree zero gives existence and uniqueness up to the stated automorphisms. Derived lift spaces use the full module-valued square-zero extension, not just the Ext set.
-/

/- DD.0: The quasisyntomic cotangent condition
Boundary: Separate p-complete bounded-torsion objects, complete-flat relative maps, coefficient-tested cotangent amplitude, composition and three tests. Topology and faithfully flat covering criterion are omitted. The absolute ℤ view requires the usual completed ℤ-to-ℤ_p cotangent comparison.
Required interface: Animated ring/module pairs and coherent square-zero mapping spaces require EDS E5/E1. Ordinary Hom sets do not recover higher homotopy.

OMITTED api: TauCeti.DerivedDeRham.quasisyntomicCover
A quasisyntomic map is a cover precisely when its mod-p map is faithfully flat.

OMITTED api: TauCeti.DerivedDeRham.quasisyntomicNoetherianLci
A p-complete Noetherian lci ring is a quasisyntomic object by Avramov’s criterion and bounded torsion.

OMITTED api: TauCeti.DerivedDeRham.quasisyntomicRelative
For a map between the specified QSyn objects, quasisyntomicity means both p-complete flatness and Tor-amplitude [-1,0] of the actual relative cotangent complex after derived reduction mod p. Object membership is a separate hypothesis; BMS2 Definition 4.10 and Lemma 4.16 govern maps and their composition/base change.
-/

/- DD.1: The Koszul complex
Boundary: Degree-one contraction, regular-sequence resolution, annihilation on homology and three tests; the full contraction, chosen dg maps/tensor and null-homotopies are omitted.
Required interface: The enhanced complete filtered category, its chosen cofibers, limits and Day tensor require EDS E1/E4; an arbitrary diagram or limit object cannot substitute for them.

OMITTED api: TauCeti.DerivedDeRham.koszulMap
A linear map ψ:E→E′ satisfying φ′ψ=φ induces a dg algebra map K(φ)→K(φ′).

OMITTED api: TauCeti.DerivedDeRham.koszulTensor
K(f₁,…,f_r)≃⊗_i K(f_i), using the cochain Koszul signs.
-/

/- DD.1: Derived ideal completeness
Boundary: Generator, radical and cohomology criteria and tests; enhanced limit closure is omitted, rather than replaced by shift stability.
Required interface: The enhanced complete filtered category, its chosen cofibers, limits and Day tensor require EDS E1/E4; an arbitrary diagram or limit object cannot substitute for them.

OMITTED api: TauCeti.DerivedDeRham.isDerivedCompleteLimits
Derived I-complete objects are closed under all limits and finite colimits in D(A).
-/

/- DD.1: The derived completion reflector
Boundary: Finite-ideal ordinary reflector, unit precomposition bijection, idempotence, Nakayama, completeness of the reflected object and tests. The complete-category colimit contract remains explicitly omitted.
Required interface: The colimit statement requires a diagram, its ambient colimit and the complete-subcategory universal property. This ordinary view types only completeness of Λ_I M as completionComplete.

OMITTED api: TauCeti.DerivedDeRham.completedColimit
The colimit of a diagram of complete objects is Λ_I of its colimit in D(A).
-/

/- DD.1: The derived Koszul completion tower
Boundary: The actual derived Koszul/ordinary-quotient diagram, comparison maps and homotopy limit must be supplied. Ordinary quotients require the stated regular, Noetherian or bounded-torsion hypotheses. Animated ring completion also needs the algebra structure; an arbitrary module or limit parameter is omitted.
Required interface: The actual derived Koszul/ordinary-quotient diagram, comparison maps and homotopy limit must be supplied. Ordinary quotients require the stated regular, Noetherian or bounded-torsion hypotheses. Animated ring completion also needs the algebra structure; an arbitrary module or limit parameter is omitted.

OMITTED declaration: TauCeti.DerivedDeRham.koszulCompletionTower
For M∈D(A), I=(f₁,…,f_r), Λ_I M≃Rlim_n(M⊗^L_A K_A(f₁^n,…,f_r^n)), with the quotient-direction transition induced by e_i↦f_i e_i and the identity in degree zero. These are derived Koszul quotients. Replacing them by ordinary A/I^n for an arbitrary ring is invalid.
-/

/- DD.1: When ordinary quotient towers compute completion
Boundary: The actual derived Koszul/ordinary-quotient diagram, comparison maps and homotopy limit must be supplied. Ordinary quotients require the stated regular, Noetherian or bounded-torsion hypotheses. Animated ring completion also needs the algebra structure; an arbitrary module or limit parameter is omitted.
Required interface: The actual derived Koszul/ordinary-quotient diagram, comparison maps and homotopy limit must be supplied. Ordinary quotients require the stated regular, Noetherian or bounded-torsion hypotheses. Animated ring completion also needs the algebra structure; an arbitrary module or limit parameter is omitted.

OMITTED declaration: TauCeti.DerivedDeRham.ordinaryQuotientCompletion
For finite I generated by a regular sequence, Λ_I M≃Rlim_n(M⊗^L_A A/I^n), using cofinal ideals (f₁^n,…,f_r^n). The same comparison holds for Noetherian A by Artin–Rees. For principal I=(f), it holds for every complex M if A has bounded f-power torsion. Without these hypotheses use the Koszul tower; a general weak-proregular model requires its separate pro-zero theorem.
-/

/- DD.1: Completion of animated rings
Boundary: The actual derived Koszul/ordinary-quotient diagram, comparison maps and homotopy limit must be supplied. Ordinary quotients require the stated regular, Noetherian or bounded-torsion hypotheses. Animated ring completion also needs the algebra structure; an arbitrary module or limit parameter is omitted.
Required interface: The actual derived Koszul/ordinary-quotient diagram, comparison maps and homotopy limit must be supplied. Ordinary quotients require the stated regular, Noetherian or bounded-torsion hypotheses. Animated ring completion also needs the algebra structure; an arbitrary module or limit parameter is omitted.

OMITTED declaration: TauCeti.DerivedDeRham.animatedRingCompletion
For an animated A-algebra B and finite I⊂π₀A, construct its derived I-completion as the inverse limit of animated Koszul quotients B⊗^L_(Z[x₁,…,x_r])Z[x₁,…,x_r]/(x₁^n,…,x_r^n), with x_i acting through f_i. Its underlying A-module is Λ_I B; the unit is a map of animated algebras, and the construction is a reflector onto complete animated algebras. Specialize to (p) and (p,d). Limits are taken in animated rings, not degree-zero rings.

OMITTED api: TauCeti.DerivedDeRham.ringCompletionUnit
B→Λ_I B is an animated algebra map with the module completion unit underneath.

OMITTED api: TauCeti.DerivedDeRham.ringCompletionUnderlying
The underlying module is the DD.1 derived completion, including negative cochain degrees.

OMITTED api: TauCeti.DerivedDeRham.ringCompletionMap
A map of animated algebras respecting the ideal induces the completed map.

OMITTED api: TauCeti.DerivedDeRham.ringCompletionIdempotent
Completing a complete animated algebra gives it back.

OMITTED test: TauCeti.DerivedDeRham.test_ring_completion_z
The p-completion of Z is the ordinary Z_p.

OMITTED test: TauCeti.DerivedDeRham.test_ring_completion_pd
The (p,d)-completion of Z[d] is Z_p[[d]], with both generators retained.

OMITTED test: TauCeti.DerivedDeRham.test_ring_completion_unit
Completion at the unit ideal is the zero ring.
-/

/- DD.1: Complete flatness and complete faithful flatness
Boundary: Actual derived quotient and fixed tensor, flatness/Tor-amplitude criterion, completion and three named tests. The Z test includes failure of completeness, the Z_p test includes faithful flatness of reduction, and the F_p obstruction is typed over Z. Canonical complete base change is omitted.
Required interface: The enhanced complete filtered category, its chosen cofibers, limits and Day tensor require EDS E1/E4; an arbitrary diagram or limit object cannot substitute for them.

OMITTED api: TauCeti.DerivedDeRham.completeFlatBaseChange
Derived base change followed by completion preserves complete flatness and complete faithful flatness.
-/

/- DD.1: Complete faithful-flat module descent
Boundary: A complete faithfully flat base map and its actual derived Čech diagram are necessary. The enhanced totalization and its augmentation have not been typed here; completeness alone cannot identify M with an arbitrary object.
Required interface: A complete faithfully flat base map and its actual derived Čech diagram are necessary. The enhanced totalization and its augmentation have not been typed here; completeness alone cannot identify M with an arbitrary object.

OMITTED declaration: TauCeti.DerivedDeRham.completeFlatDescent
Let A→B be a p-completely faithfully flat map of ordinary p-complete rings with bounded p-power torsion. For derived p-complete M, the augmentation M→Tot((M⊗^L_A B•)^∧_p) is an equivalence, where B• is the p-completed derived Čech nerve. Complete flatness and fixed finite p-complete Tor-amplitude are detected after this base change. These statements concern Čech descent; arbitrary hyperdescent is not inferred.
-/

/- DD.1: Elkik algebraization of completely smooth and étale algebras
Boundary: Formal smoothness/finite presentation, I-adic completeness, the actual algebra B and an isomorphism of its completion with the chosen smooth algebra must be present. Merely exhibiting the smooth algebra A ignores B and is omitted.
Required interface: Formal smoothness/finite presentation, I-adic completeness, the actual algebra B and an isomorphism of its completion with the chosen smooth algebra must be present. Merely exhibiting the smooth algebra A ignores B and is omitted.

OMITTED declaration: TauCeti.DerivedDeRham.completelySmoothAlgebraization
For an ordinary ring A, finite-generated I⊂A and a derived I-complete animated A-algebra R, if R⊗^L_A A/I is a discrete smooth (respectively étale) A/I-algebra, then R is the derived I-completion of a smooth (respectively étale) ordinary A-algebra R′. Conversely such completions are completely smooth (respectively étale). No Noetherian hypothesis is imposed in the derived deformation-theoretic proof of BS Footnote 6.
-/

/- DD.1: Coherent filtered modules
Boundary: Use the enhanced filtered category and its actual associated graded, completed Day tensor, Rees t-action, Beilinson truncations/connecting differential, heart Ext or bounded Postnikov diagram. The missing constructions are omitted: neither arbitrary operators nor P⇒P, zero differentials or shifts replace these contracts.
Required interface: Use the enhanced filtered category and its actual associated graded, completed Day tensor, Rees t-action, Beilinson truncations/connecting differential, heart Ext or bounded Postnikov diagram. The missing constructions are omitted: neither arbitrary operators nor P⇒P, zero differentials or shifts replace these contracts.

OMITTED declaration: TauCeti.DerivedDeRham.filteredModules
For a commutative ring A define DF(A)=Fun(Z^op,D(A)) in the stable enhanced category. A filtered object F has F^i→F^(i−1), underlying object colim_(i→−∞)F^i, and gr^iF=cofib(F^(i+1)→F^i). Filtration shifts satisfy (F{n})^i=F^(i+n). Increasing filtrations are reindexed explicitly. This is a category of coherent diagrams; a diagram in the ordinary triangulated derived category does not encode the same data.

OMITTED api: TauCeti.DerivedDeRham.filtrationAt
Evaluation F↦F^i is exact.

OMITTED api: TauCeti.DerivedDeRham.associatedGraded
gr^iF=cofib(F^(i+1)→F^i).

OMITTED api: TauCeti.DerivedDeRham.filteredShift
F{n} has i-th value F^(i+n) and shifts the graded pieces by the same convention.

OMITTED api: TauCeti.DerivedDeRham.filteredMapExt
A map of coherent filtered objects is an equivalence iff every evaluation is an equivalence.

OMITTED test: TauCeti.DerivedDeRham.test_filtered_step
For the step filtration F^i=M for i≤0 and 0 for i>0, gr⁰=M and all other graded pieces vanish.

OMITTED test: TauCeti.DerivedDeRham.test_filtered_constant
A nonzero constant filtration has every graded piece zero although its underlying object is nonzero.

OMITTED test: TauCeti.DerivedDeRham.test_filtered_shift
For the preceding step F, F{1} has its sole graded piece in index −1.
-/

/- DD.1: Completion of a filtered object
Boundary: Use the enhanced filtered category and its actual associated graded, completed Day tensor, Rees t-action, Beilinson truncations/connecting differential, heart Ext or bounded Postnikov diagram. The missing constructions are omitted: neither arbitrary operators nor P⇒P, zero differentials or shifts replace these contracts.
Required interface: Use the enhanced filtered category and its actual associated graded, completed Day tensor, Rees t-action, Beilinson truncations/connecting differential, heart Ext or bounded Postnikov diagram. The missing constructions are omitted: neither arbitrary operators nor P⇒P, zero differentials or shifts replace these contracts.

OMITTED declaration: TauCeti.DerivedDeRham.filteredCompletion
A coherent decreasing filtration F is complete when Rlim_(i→+∞)F^i=0. Its reflection is (F^∧)^i=cofib(Rlim_jF^j→F^i); its underlying object is Rlim_i(cofib(F^i→F)), where F=colim_(i→−∞)F^i. Completion leaves every gr^i unchanged and gr is conservative on complete filtrations. Colimits in complete filtered modules are formed by completing colimits in DF(A). Classical separatedness alone does not imply this completeness.

OMITTED api: TauCeti.DerivedDeRham.filteredCompletionUnit
F→F^∧ is universal among maps to complete filtered objects.

OMITTED api: TauCeti.DerivedDeRham.filteredCompletionGraded
gr^iF≃gr^i(F^∧) for every i.

OMITTED api: TauCeti.DerivedDeRham.filteredCompletionIdempotent
(F^∧)^∧≃F^∧.

OMITTED api: TauCeti.DerivedDeRham.gradedDetectsComplete
A map between complete filtered objects is an equivalence exactly when all its graded maps are equivalences.

OMITTED test: TauCeti.DerivedDeRham.test_filtered_complete_step
The step filtration of an object is already complete.

OMITTED test: TauCeti.DerivedDeRham.test_filtered_complete_constant
The completion of a nonzero constant filtration is zero.

OMITTED test: TauCeti.DerivedDeRham.test_filtered_separated_boundary
The t-adic filtration of k[t] is classically separated; its completed underlying object is k[[t]], so it is not derived complete as a filtered object.
-/

/- DD.1: The Rees description of filtered modules
Boundary: Use the enhanced filtered category and its actual associated graded, completed Day tensor, Rees t-action, Beilinson truncations/connecting differential, heart Ext or bounded Postnikov diagram. The missing constructions are omitted: neither arbitrary operators nor P⇒P, zero differentials or shifts replace these contracts.
Required interface: Use the enhanced filtered category and its actual associated graded, completed Day tensor, Rees t-action, Beilinson truncations/connecting differential, heart Ext or bounded Postnikov diagram. The missing constructions are omitted: neither arbitrary operators nor P⇒P, zero differentials or shifts replace these contracts.

OMITTED declaration: TauCeti.DerivedDeRham.reesDescription
For a coherent decreasing filtration F, define its Rees graded A[t]-module with grading-deg(t)=1 by degree −i term F^i and t-action the transition F^i→F^(i−1). This yields a symmetric monoidal equivalence DF(A)≃D_gr(A[t]). Derived quotient by t has degree −i term gr^iF, and inversion of t recovers the underlying object after forgetting weights. Filtered completeness corresponds to derived t-completeness in the graded category; it is not completeness of the ungraded direct sum.
-/

/- DD.1: Completed filtered tensor products
Boundary: Use the enhanced filtered category and its actual associated graded, completed Day tensor, Rees t-action, Beilinson truncations/connecting differential, heart Ext or bounded Postnikov diagram. The missing constructions are omitted: neither arbitrary operators nor P⇒P, zero differentials or shifts replace these contracts.
Required interface: Use the enhanced filtered category and its actual associated graded, completed Day tensor, Rees t-action, Beilinson truncations/connecting differential, heart Ext or bounded Postnikov diagram. The missing constructions are omitted: neither arbitrary operators nor P⇒P, zero differentials or shifts replace these contracts.

OMITTED declaration: TauCeti.DerivedDeRham.completedFilteredTensor
Define (F⊗_filG)^n=colim_(i+j≥n)(F^i⊗^L_A G^j) by Day convolution. On complete filtered objects use F⊗̂_filG=(F⊗_filG)^∧. These form a symmetric monoidal category; gr^n(F⊗̂_filG)≃⊕_(i+j=n)gr^iF⊗^L_A gr^jG. The tensor unit is the step filtration of A. Complete filtered algebras and their modules use this tensor, not levelwise tensor.

OMITTED api: TauCeti.DerivedDeRham.filteredTensorAt
The n-th term is the colimit over i+j≥n before completion.

OMITTED api: TauCeti.DerivedDeRham.filteredTensorGraded
The n-th graded piece is the direct sum of tensor products with i+j=n.

OMITTED api: TauCeti.DerivedDeRham.filteredTensorUnit
The step filtration of A is the tensor unit.

OMITTED api: TauCeti.DerivedDeRham.filteredTensorSteps
The tensor of steps in weights i,j is the step of the module tensor in weight i+j.

OMITTED test: TauCeti.DerivedDeRham.test_filtered_tensor_unit
Tensor with the step filtration of A returns F.

OMITTED test: TauCeti.DerivedDeRham.test_filtered_tensor_two_steps
Two filtrations with sole graded pieces A in weight 1 have tensor with sole graded piece A in weight 2.

OMITTED test: TauCeti.DerivedDeRham.test_filtered_tensor_derived
For step filtrations of F_p over Z_p, the tensor has the degree −1 Tor term of F_p⊗^L_ZpF_p, so ordinary module tensor is wrong.
-/

/- DD.1: The Beilinson t-structure
Boundary: Use the enhanced filtered category and its actual associated graded, completed Day tensor, Rees t-action, Beilinson truncations/connecting differential, heart Ext or bounded Postnikov diagram. The missing constructions are omitted: neither arbitrary operators nor P⇒P, zero differentials or shifts replace these contracts.
Required interface: Use the enhanced filtered category and its actual associated graded, completed Day tensor, Rees t-action, Beilinson truncations/connecting differential, heart Ext or bounded Postnikov diagram. The missing constructions are omitted: neither arbitrary operators nor P⇒P, zero differentials or shifts replace these contracts.

OMITTED declaration: TauCeti.DerivedDeRham.beilinsonTStructure
DF(A) has the Beilinson t-structure with DF≤0_Beil={F:gr^iF∈D≤i(A) for all i} and DF≥0_Beil={F:F^i∈D≥i(A) for all i}. On complete filtered objects the latter can equivalently be tested on gr^iF∈D≥i. These conventions use cohomological grading and decreasing filtrations.
-/

/- DD.1: The Beilinson heart is the category of complexes
Boundary: Use the enhanced filtered category and its actual associated graded, completed Day tensor, Rees t-action, Beilinson truncations/connecting differential, heart Ext or bounded Postnikov diagram. The missing constructions are omitted: neither arbitrary operators nor P⇒P, zero differentials or shifts replace these contracts.
Required interface: Use the enhanced filtered category and its actual associated graded, completed Day tensor, Rees t-action, Beilinson truncations/connecting differential, heart Ext or bounded Postnikov diagram. The missing constructions are omitted: neither arbitrary operators nor P⇒P, zero differentials or shifts replace these contracts.

OMITTED declaration: TauCeti.DerivedDeRham.beilinsonHeart
The Beilinson heart is equivalent to the abelian category Ch(A) of actual unbounded cochain complexes. A complex M• maps to its stupid filtration F^i=M≥i with gr^iF=M^i[−i]. Conversely H^i(gr^iF) are its terms, and the connecting maps of adjacent cofibres give a differential squaring to zero. Acyclic complexes can be nonzero in this heart.
-/

/- DD.1: Ext groups in the category of complexes
Boundary: Use the enhanced filtered category and its actual associated graded, completed Day tensor, Rees t-action, Beilinson truncations/connecting differential, heart Ext or bounded Postnikov diagram. The missing constructions are omitted: neither arbitrary operators nor P⇒P, zero differentials or shifts replace these contracts.
Required interface: Use the enhanced filtered category and its actual associated graded, completed Day tensor, Rees t-action, Beilinson truncations/connecting differential, heart Ext or bounded Postnikov diagram. The missing constructions are omitted: neither arbitrary operators nor P⇒P, zero differentials or shifts replace these contracts.

OMITTED declaration: TauCeti.DerivedDeRham.complexHeartExt
For ordinary A-modules M,N regarded as cochain complexes in degree zero and integers i≥0,c, Ext^i_(Ch(A))(M,N[c])=0 if c>0, while for c≤0 it is naturally Ext^(i+c)_A(M,N). This is BMS2 Proposition 5.6; it is not an Ext computation in D(A) after quotienting acyclic complexes.
-/

/- DD.1: The weak Postnikov tower lemma
Boundary: Use the enhanced filtered category and its actual associated graded, completed Day tensor, Rees t-action, Beilinson truncations/connecting differential, heart Ext or bounded Postnikov diagram. The missing constructions are omitted: neither arbitrary operators nor P⇒P, zero differentials or shifts replace these contracts.
Required interface: Use the enhanced filtered category and its actual associated graded, completed Day tensor, Rees t-action, Beilinson truncations/connecting differential, heart Ext or bounded Postnikov diagram. The missing constructions are omitted: neither arbitrary operators nor P⇒P, zero differentials or shifts replace these contracts.

OMITTED declaration: TauCeti.DerivedDeRham.weakPostnikovTowers
Let S be connective and K∈D(S) have a weak Postnikov tower K_n with K≃Rlim_nK_n and fibre(K_n→K_(n−1)) n-connective in homological grading. For an exact t-exact functor F:D(S)→D(S′), the canonical map F(K)→Rlim_nF(K_n) is an equivalence. The uniform connectivity of the fibres is essential; t-exactness does not assert preservation of every inverse limit.
-/

/- DD.1: Valid exchanges of completion and derived operations
Boundary: Use the enhanced filtered category and its actual associated graded, completed Day tensor, Rees t-action, Beilinson truncations/connecting differential, heart Ext or bounded Postnikov diagram. The missing constructions are omitted: neither arbitrary operators nor P⇒P, zero differentials or shifts replace these contracts.
Required interface: Use the enhanced filtered category and its actual associated graded, completed Day tensor, Rees t-action, Beilinson truncations/connecting differential, heart Ext or bounded Postnikov diagram. The missing constructions are omitted: neither arbitrary operators nor P⇒P, zero differentials or shifts replace these contracts.

OMITTED declaration: TauCeti.DerivedDeRham.completionExchanges
Derived ideal and filtered completion are exact and commute with limits on complete objects through their reflector descriptions. A perfect A-complex P satisfies P⊗^L_A Λ_I M≃Λ_I(P⊗^L_A M). A filtered colimit in the complete category is completed after the raw colimit. For a uniformly cohomologically bounded-below cosimplicial diagram, filtered colimits commute with its totalization degreewise; the connectivity bound is necessary. The Milnor exact sequence 0→lim¹ H^(j−1)M_n→H^j(Rlim M_n)→lim H^jM_n→0 retains the derived-limit term.
-/

/- DD.2: De Rham cohomology from polynomial resolutions
Boundary: Canonical forgetful object and map, identity and rational Laurent collapse. Resolution independence, Hodge tails and weight-zero graded quotient are omitted.
Required interface: The coherent realization/filtered algebra or the formal scheme over its specified base requires the EDS/SF suppliers. No arbitrary resolution, target complex or base-change function is quantified.

OMITTED api: TauCeti.DerivedDeRham.resolutionEquiv
Two free simplicial resolutions of B give equivalent Hodge-filtered multiplicative objects; the comparison respects the augmentation and is coherent in maps of resolutions.

OMITTED api: TauCeti.DerivedDeRham.hodgeFiltration
The value Fil_H^i is the realization of the subcomplex of polynomial forms of degrees at least i, with decreasing transition maps and multiplication Fil_H^i⊗Fil_H^j→Fil_H^(i+j).

OMITTED test: TauCeti.DerivedDeRham.test_hodge_zero_quotient
For an ordinary A-algebra B, the degree-zero Hodge quotient gr_H^0 dR_(B/A) is B in degree zero.
-/

/- DD.2: Derived base change and Künneth
Boundary: The coherent realization/filtered algebra or the formal scheme over its specified base requires the EDS/SF suppliers. No arbitrary resolution, target complex or base-change function is quantified.
Required interface: The coherent realization/filtered algebra or the formal scheme over its specified base requires the EDS/SF suppliers. No arbitrary resolution, target complex or base-change function is quantified.

OMITTED declaration: TauCeti.DerivedDeRham.baseChangeKunneth
There are natural equivalences dR_(B⊗^L_A C/A)≃dR_(B/A)⊗^L_A dR_(C/A) and dR_(B/A)⊗^L_A C≃dR_(B⊗^L_A C/C). All tensor products, including the algebra pushout, are derived.
-/

/- DD.2: Hodge graded pieces of derived de Rham
Boundary: The coherent realization/filtered algebra or the formal scheme over its specified base requires the EDS/SF suppliers. No arbitrary resolution, target complex or base-change function is quantified.
Required interface: The coherent realization/filtered algebra or the formal scheme over its specified base requires the EDS/SF suppliers. No arbitrary resolution, target complex or base-change function is quantified.

OMITTED declaration: TauCeti.DerivedDeRham.hodgeGradedPieces
For A→B animated, gr_H^i dR_(B/A)≃L∧^i_B L_(B/A)[−i] naturally as B-modules for every i≥0. The degree-zero quotient is B. The differential of the filtered algebra induces the universal derivation in the first Hodge boundary; the full de Rham differential is formed before realization, not defined only on cotangent homology.
-/

/- DD.2: Hodge-completed derived de Rham
Boundary: Canonical forgetful completed object, identity and rational Laurent H1 tests only; the reflector and complete dual-number test remain omitted.
Required interface: The coherent realization/filtered algebra or the formal scheme over its specified base requires the EDS/SF suppliers. No arbitrary resolution, target complex or base-change function is quantified.

OMITTED api: TauCeti.DerivedDeRham.hodgeCompletionMap
The canonical filtered algebra map dR→dR^hc is the DD.1 reflection unit.

OMITTED api: TauCeti.DerivedDeRham.hodgeCompletionGraded
gr_H^i dR^hc≃L∧^i L_(B/A)[−i].

OMITTED api: TauCeti.DerivedDeRham.hodgeCompletionUniversal
Maps to complete Hodge-filtered algebras factor through dR^hc in the enhanced mapping space.

OMITTED api: TauCeti.DerivedDeRham.hodgeCompletionFunctorial
The unit and completion are coherent in commutative base squares, with completed base-change comparisons under the separate stated hypotheses.

OMITTED test: TauCeti.DerivedDeRham.test_hodge_complete_dual_numbers
For R=F_p[x]/x², the Hodge filtration on uncompleted dR_(R/F_p) need not be complete; a complete object is not obtained merely by claiming its filtration is separated.
-/

/- DD.2: p-completed derived de Rham
Boundary: Canonical forgetful completed object and identity test only; compatible finite reductions, base squares, completed tensor and other tests remain omitted.
Required interface: The coherent realization/filtered algebra or the formal scheme over its specified base requires the EDS/SF suppliers. No arbitrary resolution, target complex or base-change function is quantified.

OMITTED api: TauCeti.DerivedDeRham.pCompletedDeRhamMod
The reduction of dR̂ modulo p^n is the derived de Rham reduction, compatibly in n.

OMITTED api: TauCeti.DerivedDeRham.pCompletedDeRhamInputs
Completing A and B at p does not change the p-completed de Rham construction with the derived base-change conventions.

OMITTED api: TauCeti.DerivedDeRham.pCompletedDeRhamKunneth
The base-change/Künneth comparison uses p-completed derived tensor and animated pushouts.

OMITTED api: TauCeti.DerivedDeRham.pHodgeCompletionCommute
Applying p-completion and Hodge completion in either order gives the same specified quotient-limit object, since the relevant completion functors commute with limits.

OMITTED test: TauCeti.DerivedDeRham.test_p_derham_inverted
For Q_p→Q_p, p-completed de Rham is zero, while Hodge-completed de Rham is Q_p.

OMITTED test: TauCeti.DerivedDeRham.test_p_derham_fp_over_zp
For F_p/Z_p, dR̂ is the p-completed PD two-term model in DD.4, retaining the extra completed torsion summands in H⁰ and the actual two-term differential; it is not just Z_p.
-/

/- DD.2: The de Rham algebra of a completely smooth formal algebra
Boundary: The specified scheme/formal morphism to the base, its affine reductions, proper/smooth/finite-presentation hypotheses, actual derived square and lifting theorem must be supplied by SF/AlgebraicModuli/EDS. The polynomial one-form and affine-line nonfinite tests retain their concrete base and scheme; identity maps are excluded from those examples.
Required interface: The specified scheme/formal morphism to the base, its affine reductions, proper/smooth/finite-presentation hypotheses, actual derived square and lifting theorem must be supplied by SF/AlgebraicModuli/EDS. The polynomial one-form and affine-line nonfinite tests retain their concrete base and scheme; identity maps are excluded from those examples.

OMITTED declaration: TauCeti.DerivedDeRham.formalOrdinaryDerham
Let A be p-complete with bounded p-power torsion and B a p-completely smooth p-complete A-algebra. Define continuous differentials Ω̂¹_(B/A)=L̂_(B/A) in degree zero, finite projective over B; define Ω̂^n=∧^n_BΩ̂¹ and the continuous differential by d(b₀db₁∧…∧db_n)=db₀∧…∧db_n. These form the p-complete ordinary de Rham dg algebra. Its universal property is among termwise p-complete strictly graded-commutative A-dg algebras with odd squares zero, continuous differential and a continuous map B→D⁰.

OMITTED api: TauCeti.DerivedDeRham.continuousDerivation
The continuous derivation B→Ω̂¹ agrees with the completed polynomial universal derivation.

OMITTED api: TauCeti.DerivedDeRham.formalDeRhamUniversal
A continuous degree-zero map into the stated dg target extends uniquely by b₀db₁…db_n↦f(b₀)df(b₁)…df(b_n).

OMITTED api: TauCeti.DerivedDeRham.formalDeRhamMap
Continuous maps of completely smooth formal algebras induce the differential-algebra pullback.

OMITTED api: TauCeti.DerivedDeRham.formalDeRhamReduction
Modulo p^n this is the ordinary smooth de Rham algebra of the corresponding finite reduction.

OMITTED test: TauCeti.DerivedDeRham.test_formal_derham_base
For B=A, Ω̂¹=0 and the complex is A.

OMITTED test: TauCeti.DerivedDeRham.test_formal_derham_coordinate
For B=Z_p⟨t⟩, d(t)=dt generates the finite projective continuous differential module.

OMITTED test: TauCeti.DerivedDeRham.test_formal_derham_char_two_square
Over a 2-complete base, (dt)²=0 in the exterior dg algebra; mere graded commutativity is insufficient.
-/

/- DD.2: Smooth ordinary and completed de Rham comparisons
Boundary: The coherent realization/filtered algebra or the formal scheme over its specified base requires the EDS/SF suppliers. No arbitrary resolution, target complex or base-change function is quantified.
Required interface: The coherent realization/filtered algebra or the formal scheme over its specified base requires the EDS/SF suppliers. No arbitrary resolution, target complex or base-change function is quantified.

OMITTED declaration: TauCeti.DerivedDeRham.smoothDeRhamComparison
For a smooth map of Z/p^n-algebras with n≥1, uncompleted dR_(B/A)≃Ω•_(B/A). For smooth finitely presented Q-algebras, the Hodge-completed dR^hc_(B/A)≃Ω•_(B/A); the uncompleted dR_(B/A)≃A instead. For p-completely smooth bounded-torsion formal algebras, p-completed derived de Rham identifies with the continuous ordinary complex. Each equivalence preserves the indicated Hodge filtration and multiplication.
-/

/- DD.2: Derived de Rham transitivity filtrations
Boundary: The coherent realization/filtered algebra or the formal scheme over its specified base requires the EDS/SF suppliers. No arbitrary resolution, target complex or base-change function is quantified.
Required interface: The coherent realization/filtered algebra or the formal scheme over its specified base requires the EDS/SF suppliers. No arbitrary resolution, target complex or base-change function is quantified.

OMITTED declaration: TauCeti.DerivedDeRham.deRhamTransitivity
For A→B→C animated construct the base-forms filtration on dR_(C/A), whose weight-i graded term is dR_(C/B)⊗^L_B L∧^i_B L_(B/A)[−i]. Its boundary maps encode the Gauss–Manin connection; it does not canonically split. Separately, for composable F_p-algebras, Proposition 3.22 gives an increasing relative conjugate filtration with gr_n=dR_(B/A)⊗^L_(B^(1)) Frob_A^*(Res^C_B(L∧^n_C L_(C/B)[−n])), where Frob_A^* is extension along the base-change map B→B^(1), b↦b⊗1. This uses the Frobenius-descent connection. Finite Hodge quotients and specified completions retain the extension data; no unrestricted de Rham-with-coefficients theory is inferred from Remark 3.23. The relative cotangent exterior power is formed over C; only afterward is it regarded as a B-module for this Frobenius base change.
-/

/- DD.2: Derived de Rham on schemes and formal schemes
Boundary: The specified scheme/formal morphism to the base, its affine reductions, proper/smooth/finite-presentation hypotheses, actual derived square and lifting theorem must be supplied by SF/AlgebraicModuli/EDS. The polynomial one-form and affine-line nonfinite tests retain their concrete base and scheme; identity maps are excluded from those examples.
Required interface: The specified scheme/formal morphism to the base, its affine reductions, proper/smooth/finite-presentation hypotheses, actual derived square and lifting theorem must be supplied by SF/AlgebraicModuli/EDS. The polynomial one-form and affine-line nonfinite tests retain their concrete base and scheme; identity maps are excluded from those examples.

OMITTED declaration: TauCeti.DerivedDeRham.deRhamSheaves
For a qcqs scheme X over an ordinary ring A, sheafify each finite Hodge quotient of the affine functor B↦dR_(B/A), then form its Hodge-completed quotient limit. It has gr_H^i=RΓ(X,L∧^i L_(X/A))[−i]. The uncompleted functor can be sheafified separately; recovering its raw affine values requires the particular uncompleted descent theorem and is not asserted for arbitrary unbounded flat totalizations. For p-adic formal schemes use the specified p-complete affine charts, derived reductions and Hodge/p-completions. Global de Rham is an A-linear complex with cup products; its full differential is not O_X-linear, although Hodge graded pieces are O_X-modules.

OMITTED api: TauCeti.DerivedDeRham.schemeDeRhamAffine
On Spec B the Hodge-completed global object is dR^hc_(B/A). Recovery of the p-completed uncompleted affine object uses the precise DD.5 relative/big-slice hypotheses.

OMITTED api: TauCeti.DerivedDeRham.schemeDeRhamGraded
For Hodge-completed global de Rham, gr_H^i≃RΓ(X,L∧^iL_(X/A))[−i].

OMITTED api: TauCeti.DerivedDeRham.schemeDeRhamPullback
A morphism over A induces coherent pullback preserving cup products and the Hodge filtration.

OMITTED api: TauCeti.DerivedDeRham.formalDeRhamLimit
The p-completed formal object is the derived inverse limit of its finite reductions under the stated descent and bounded-torsion hypotheses.

OMITTED test: TauCeti.DerivedDeRham.test_scheme_derham_affine_base
For X=Spec A over A the object is A, with no positive Hodge pieces.

OMITTED test: TauCeti.DerivedDeRham.test_scheme_derham_affine_line
For X=Spec F_p[t], H¹ of ordinary smooth de Rham is F_p[t^p]·t^(p−1)dt.

OMITTED test: TauCeti.DerivedDeRham.test_scheme_derham_product_boundary
For X affine quasisyntomic of unbounded dimension, no finite-projective global-cohomology assertion follows from the sheaf construction.
-/

/- DD.2: Hodge pieces of a singular hypersurface
Boundary: The coherent realization/filtered algebra or the formal scheme over its specified base requires the EDS/SF suppliers. No arbitrary resolution, target complex or base-change function is quantified.
Required interface: The coherent realization/filtered algebra or the formal scheme over its specified base requires the EDS/SF suppliers. No arbitrary resolution, target complex or base-change function is quantified.

OMITTED declaration: TauCeti.DerivedDeRham.singularHypersurfaceHodge
For k=F_p and B=k[t]/(t²), the full cotangent complex is [B e --2t→ B dt] in degrees −1,0. Thus gr_H¹ dR_(B/k)=L_(B/k)[−1] has B e in degree zero and B dt in degree one. Its higher Hodge pieces are the derived exterior powers of this two-term complex, with divided powers of the degree −1 generator. For p=2 the displayed differential vanishes; replacing L by Ω¹ loses the nonzero degree-zero Hodge-weight-one term. This is a singular lci algebra, distinguished from the non-lci square-zero example.
-/

/- DD.3: The conjugate filtration
Boundary: The animated Frobenius pushout, chosen conjugate cofiber and canonical Cartier map require EDS E5/E1. A degree-zero tensor or arbitrary graded operation is not its model.
Required interface: The animated Frobenius pushout, chosen conjugate cofiber and canonical Cartier map require EDS E5/E1. A degree-zero tensor or arbitrary graded operation is not its model.

OMITTED declaration: TauCeti.DerivedDeRham.conjugateFiltration
Construct Fil_i^conj dR_(B/A)=|τ≤i Ω•_(P•/A)| for i≥0, with Fil_−1=0, natural increasing maps, and colim_i Fil_i^conj≃dR_(B/A). Its graded piece is |H^i(Ω•_(P•/A))|[−i]. The filtration is multiplicative and is B^(1)-linear over F_p via Cartier; an exhaustive direct-sum realization is not an unrestricted completed or global convergence assertion.

OMITTED api: TauCeti.DerivedDeRham.conjugateAt
The ith stage is |τ≤i Ω•_(P•/A)|, with the canonical maps from truncation.

OMITTED api: TauCeti.DerivedDeRham.conjugateInclusion
The map from stage i to stage j for i≤j is induced by cohomological truncation; the maps compose and are natural in A→B.

OMITTED api: TauCeti.DerivedDeRham.conjugateColimit
The filtered homotopy colimit over i≥0 of these stages is dR_(B/A). This is an uncompleted exhaustiveness assertion.

OMITTED test: TauCeti.DerivedDeRham.test_conjugate_identity
For A→A, stage zero is A and every successive positive graded piece is zero.

OMITTED test: TauCeti.DerivedDeRham.test_conjugate_weight_zero
The zeroth graded piece is |H⁰(Ω•_(P•/A))|, with no cohomological shift.

OMITTED test: TauCeti.DerivedDeRham.test_conjugate_rational
For Q→Q[t], every positive conjugate graded piece vanishes and stage zero is Q.
-/

/- DD.3: The derived Frobenius twist
Boundary: The animated Frobenius pushout, chosen conjugate cofiber and canonical Cartier map require EDS E5/E1. A degree-zero tensor or arbitrary graded operation is not its model.
Required interface: The animated Frobenius pushout, chosen conjugate cofiber and canonical Cartier map require EDS E5/E1. A degree-zero tensor or arbitrary graded operation is not its model.

OMITTED declaration: TauCeti.DerivedDeRham.frobeniusTwist
For A→B of F_p-algebras define B^(1)=B⊗^L_(A,Frob_A) A, together with the relative Frobenius B^(1)→B. The derived de Rham complex and its conjugate filtration are naturally B^(1)-linear.

OMITTED api: TauCeti.DerivedDeRham.relativeFrobenius
The canonical map B⊗^L_(A,Frob_A)A→B is induced at polynomial level by b⊗a↦bᵖf(a).

OMITTED api: TauCeti.DerivedDeRham.twistMap
A map B→C of A-algebras induces B^(1)→C^(1) and a commuting square with the two relative Frobenius maps.

OMITTED api: TauCeti.DerivedDeRham.twistUnderived
If Tor_i^A(B,Frob_*A)=0 for all i>0, the derived twist agrees with the ordinary tensor-product twist, compatibly with relative Frobenius.

OMITTED test: TauCeti.DerivedDeRham.test_twist_base
For B=A, B^(1)=A⊗^L_(A,Frob_A)A is canonically A and the relative Frobenius is the identity under this identification.

OMITTED test: TauCeti.DerivedDeRham.test_twist_polynomial
For B=F_p[t] over F_p, the derived twist is the ordinary polynomial algebra and relative Frobenius sends its coordinate t to tᵖ.

OMITTED test: TauCeti.DerivedDeRham.test_twist_no_underived_shortcut
Let A=F_p[ε]/ε² and B=F_p. For p≥2, Tor₁^A(B,Frob_*A) is nonzero (indeed isomorphic to Frob_*A as an A-module with ε acting by zero); therefore B^(1) has positive homotopy and cannot be replaced by its ordinary tensor product.
-/

/- DD.3: The polynomial Cartier map
Boundary: The animated Frobenius pushout, chosen conjugate cofiber and canonical Cartier map require EDS E5/E1. A degree-zero tensor or arbitrary graded operation is not its model.
Required interface: The animated Frobenius pushout, chosen conjugate cofiber and canonical Cartier map require EDS E5/E1. A degree-zero tensor or arbitrary graded operation is not its model.

OMITTED declaration: TauCeti.DerivedDeRham.polynomialCartier
For a free (polynomial) algebra F over an F_p-algebra A, construct the canonical isomorphism of F^(1)-modules C^{-1}:∧^k L_(F^(1)/A)≃H^k(Ω*_(F/A)) for every k, extending to a graded F^(1)-algebra isomorphism ⊕_k ∧^k L_(F^(1)/A)[−k]→⊕_k H^k(Ω*_(F/A))[−k] (for polynomial F^(1), ∧^k L_(F^(1)/A)=Ω^k_(F^(1)/A)). In one variable, applying the source recipe with the lift t↦t^p gives dt↦[t^{p−1}dt] in degree one; that formula is a consequence of the recipe and is not displayed in the source.
-/

/- DD.3: Derived Cartier graded pieces
Boundary: The animated Frobenius pushout, chosen conjugate cofiber and canonical Cartier map require EDS E5/E1. A degree-zero tensor or arbitrary graded operation is not its model.
Required interface: The animated Frobenius pushout, chosen conjugate cofiber and canonical Cartier map require EDS E5/E1. A degree-zero tensor or arbitrary graded operation is not its model.

OMITTED declaration: TauCeti.DerivedDeRham.conjugateGradedCartier
For every map A→B of F_p-algebras, gr^conj_i dR_(B/A)≃L∧^i L_(B^(1)/A)[−i], naturally as B^(1)-modules. The exterior power and Frobenius twist are derived.
-/

/- DD.3: The classical smooth Cartier isomorphism
Boundary: The animated Frobenius pushout, chosen conjugate cofiber and canonical Cartier map require EDS E5/E1. A degree-zero tensor or arbitrary graded operation is not its model.
Required interface: The animated Frobenius pushout, chosen conjugate cofiber and canonical Cartier map require EDS E5/E1. A degree-zero tensor or arbitrary graded operation is not its model.

OMITTED declaration: TauCeti.DerivedDeRham.smoothCartier
For any F_p-algebra A and a smooth A-algebra B, inverse Cartier gives ∧^i_(B^(1))Ω¹_(B^(1)/A)≃H^i(Ω•_(B/A)), as B^(1)-modules and graded algebras. The ordinary Frobenius twist suffices here because B/A is flat. Over an arbitrary characteristic-p field this is the relative Cartier theorem, including imperfect fields and the actual relative twist.
-/

/- DD.3: The conjugate spectral sequence and convergence
Boundary: The animated Frobenius pushout, chosen conjugate cofiber and canonical Cartier map require EDS E5/E1. A degree-zero tensor or arbitrary graded operation is not its model.
Required interface: The animated Frobenius pushout, chosen conjugate cofiber and canonical Cartier map require EDS E5/E1. A degree-zero tensor or arbitrary graded operation is not its model.

OMITTED declaration: TauCeti.DerivedDeRham.conjugateSpectralSequence
For A→B over F_p the increasing exhaustive filtration gives the exact-couple spectral sequence with E₁^(i,j)=H^(i+j)(L∧^i L_(B^(1)/A)[−i])=H^j(L∧^i L_(B^(1)/A)), abutting conditionally to H^(i+j)dR_(B/A). Strong convergence in a given degree is asserted when only finitely many filtration indices contribute there (for example a bounded smooth affine complex); alternatively state and prove the needed complete/lim¹ conditions. Global and completed variants retain their actual totalization and convergence hypotheses.

OMITTED api: TauCeti.DerivedDeRham.conjugateSpectralE1
E₁^(i,j)=H^j(L∧^iL_(B^(1)/A)).

OMITTED api: TauCeti.DerivedDeRham.conjugateSpectralFunctorial
Base-compatible algebra maps induce maps of exact couples and spectral sequences.

OMITTED api: TauCeti.DerivedDeRham.conjugateSpectralFiniteConvergence
Finite contribution in each total degree gives a separated exhaustive finite filtration on the abutment.

OMITTED api: TauCeti.DerivedDeRham.conjugateSpectralCompletion
Filtered reflection leaves the cofiber exact couple unchanged; the abutment still requires its own convergence check.

OMITTED test: TauCeti.DerivedDeRham.test_conjugate_spectral_base
For A→A, only E₁^(0,0)=A is nonzero.

OMITTED test: TauCeti.DerivedDeRham.test_conjugate_spectral_line
For F_p[t]/F_p, weights 0,1 compute the classical Cartier modules in total degrees 0,1.

OMITTED test: TauCeti.DerivedDeRham.test_conjugate_spectral_nonlci
For B=F_p[x,y]/(x,y)², uncompleted dR has unbounded negative cohomology; a first-quadrant bounded smooth convergence argument cannot apply.
-/

/- DD.3: Regular quotient divided-power calculations
Boundary: The animated Frobenius pushout, chosen conjugate cofiber and canonical Cartier map require EDS E5/E1. A degree-zero tensor or arbitrary graded operation is not its model.
Required interface: The animated Frobenius pushout, chosen conjugate cofiber and canonical Cartier map require EDS E5/E1. A degree-zero tensor or arbitrary graded operation is not its model.

OMITTED declaration: TauCeti.DerivedDeRham.regularQuotientDividedPowers
Let A→B=A/I be a regular-sequence quotient of F_p-algebras. Put B^(1)=B⊗^L_(A,Frob_A)A; in the Tor-independent case this is A/(f₁^p,…,f_r^p). Then L_(B^(1)/A)≃(I^(1)/(I^(1))²)[1], and gr_i^conj dR_(B/A)≃Γ^i_(B^(1))(I^(1)/(I^(1))²), in degree zero. Hence dR_(B/A) is discrete by exhaustive realization. The eventual identification with the classical PD envelope is owned only by DD.4.
-/

/- DD.3: The first conjugate extension and W₂ lifting
Boundary: The animated Frobenius pushout, chosen conjugate cofiber and canonical Cartier map require EDS E5/E1. A degree-zero tensor or arbitrary graded operation is not its model.
Required interface: The animated Frobenius pushout, chosen conjugate cofiber and canonical Cartier map require EDS E5/E1. A degree-zero tensor or arbitrary graded operation is not its model.

OMITTED declaration: TauCeti.DerivedDeRham.cartierExtensionObstruction
For A→B over F_p, the extension B^(1)→Fil₁^conj dR_(B/A)→L_(B^(1)/A)[−1] determines an Ext² obstruction class. Given a compatible W₂ lift of A, this is the obstruction to a compatible W₂ lift of the Frobenius-twisted B as in Bhatt Proposition 3.15. The first conjugate extension need not split; a canonical isomorphism of graded pieces does not supply a canonical splitting.
-/

/- DD.3: A splitting from compatible Frobenius lifts
Boundary: The animated Frobenius pushout, chosen conjugate cofiber and canonical Cartier map require EDS E5/E1. A degree-zero tensor or arbitrary graded operation is not its model.
Required interface: The animated Frobenius pushout, chosen conjugate cofiber and canonical Cartier map require EDS E5/E1. A degree-zero tensor or arbitrary graded operation is not its model.

OMITTED declaration: TauCeti.DerivedDeRham.frobeniusLiftSplitting
If a map A→B of F_p-algebras has compatible flat Z/p² lifts and compatible lifts of the absolute Frobenius on both rings, these choices produce a multiplicative splitting dR_(B/A)≃⊕_(i≥0)L∧^iL_(B^(1)/A)[−i] of the conjugate filtration. The chain-level splitting depends on the lift data; the cohomological Cartier map is canonical. Liftability and Frobenius compatibility are retained.
-/

/- DD.4: The derived de Rham to crystalline map
Boundary: Canonical CR.2 value and comparison over Z/p^n, smooth isomorphism with endpoint flatness, identity and the fixed non-lci square-zero test. Sheaf, Hodge and naturality contracts remain omitted.
Required interface: The CR.0/CR.2/CR.4 and period suppliers must provide the named model and canonical maps. No comparison to an arbitrary target or unrestricted QRSP assertion is retained.

OMITTED api: TauCeti.DerivedDeRham.crystallineComparisonNatural
A base-compatible square induces a commuting square of the specified comparison maps.

OMITTED api: TauCeti.DerivedDeRham.crystallineComparisonHodge
The map carries Hodge filtration to the crystalline PD filtration.

OMITTED api: TauCeti.DerivedDeRham.crystallineComparisonSheaf
Affine comparison maps glue over the common scheme site and preserve cup products.

OMITTED test: TauCeti.DerivedDeRham.test_crys_map_polynomial
For F_p→F_p[t], Comp identifies the ordinary complex with the crystalline PD de Rham model.
-/

/- DD.4: Regular quotients and classical PD envelopes
Boundary: The actual crystalline value and canonical comparison, nilpotent p-base, endpoint Z/p^n-flatness and regular local factorization/compatible PD presentations are required. The enhanced lci factorization predicate is not available; the full theorem is omitted, preserving DD.4 as its sole owner.
Required interface: The actual crystalline value and canonical comparison, nilpotent p-base, endpoint Z/p^n-flatness and regular local factorization/compatible PD presentations are required. The enhanced lci factorization predicate is not available; the full theorem is omitted, preserving DD.4 as its sole owner.

OMITTED declaration: TauCeti.DerivedDeRham.regularPdComparison
If A→B=A/I is a quotient of flat Z/p^n-algebras and I is generated locally by a finite regular sequence, Comp identifies dR_(B/A) with the ordinary PD envelope D_A(I), compatible with divided powers on p. The Hodge filtration becomes its PD filtration; modulo p the conjugate filtration becomes the explicit PD conjugate filtration. This Corollary 3.40 is owned here together with Theorem 3.27. CR.0 supplies only the explicit ordinary PD envelopes, derived tensor discreteness, flatness and reduction lemmas.
-/

/- DD.4: The lci crystalline comparison theorem
Boundary: The actual crystalline value and canonical comparison, nilpotent p-base, endpoint Z/p^n-flatness and regular local factorization/compatible PD presentations are required. The enhanced lci factorization predicate is not available; the full theorem is omitted, preserving DD.4 as its sole owner.
Required interface: The actual crystalline value and canonical comparison, nilpotent p-base, endpoint Z/p^n-flatness and regular local factorization/compatible PD presentations are required. The enhanced lci factorization predicate is not available; the full theorem is omitted, preserving DD.4 as its sole owner.

OMITTED declaration: TauCeti.DerivedDeRham.lciCrystallineComparison
For n≥1 and an lci morphism of flat Z/p^n-schemes f:X→S (finite-presentation/local regular-immersion convention), the natural Comp_f is an equivalence of Hodge-filtered E∞ algebras and is compatible with base change in its Tor-independent crystalline range, products and Frobenius. This is Bhatt Theorem 3.27; the general singular and nonflat cases remain outside its isomorphism assertion.
-/

/- DD.4: p-adic crystalline comparison by derived limits
Boundary: The CR.0/CR.2/CR.4 and period suppliers must provide the named model and canonical maps. No comparison to an arbitrary target or unrestricted QRSP assertion is retained.
Required interface: The CR.0/CR.2/CR.4 and period suppliers must provide the named model and canonical maps. No comparison to an arbitrary target or unrestricted QRSP assertion is retained.

OMITTED declaration: TauCeti.DerivedDeRham.pAdicCrystallineComparison
Let A→B be a map of p-complete bounded-torsion algebras whose derived reductions are ordinary flat Z/p^n-algebras and lci for every n, compatibly. Then Λ_p dR_(B/A)≃Rlim_n RΓ((B/p^n over A/p^n)_crys,O). The same assertion applies to compatible p-adic formal schemes with the analogous finite-level hypotheses. The filtration is the derived limit of the specified Hodge/PD filtration. Each limit and base-change map is derived; reduction of arbitrary rings to π₀ is not allowed.
-/

/- DD.4: Frobenius on nilpotent-p derived de Rham
Boundary: The CR.0/CR.2/CR.4 and period suppliers must provide the named model and canonical maps. No comparison to an arbitrary target or unrestricted QRSP assertion is retained.
Required interface: The CR.0/CR.2/CR.4 and period suppliers must provide the named model and canonical maps. No comparison to an arbitrary target or unrestricted QRSP assertion is retained.

OMITTED declaration: TauCeti.DerivedDeRham.deRhamFrobenius
For a Z/p^n-algebra B, polynomial crystalline Frobenius gives a natural endomorphism φ of dR_(B/(Z/p^n)), commuting with the crystalline comparison map. For p-completed algebras use the compatible finite reductions. On characteristic-p Cartier graded pieces record the actual Frobenius twist. This construction does not identify the Hodge filtration with the conjugate or Nygaard filtration.

OMITTED api: TauCeti.DerivedDeRham.deRhamFrobeniusNatural
Algebra maps over Z/p^n commute with φ.

OMITTED api: TauCeti.DerivedDeRham.deRhamFrobeniusCrystalline
Comp intertwines φ and crystalline Frobenius.

OMITTED api: TauCeti.DerivedDeRham.deRhamFrobeniusLimit
The finite φ maps induce the endomorphism of Λ_p dR.

OMITTED api: TauCeti.DerivedDeRham.deRhamFrobeniusDegreeZero
Modulo p, degree-zero polynomial functions map by b↦b^p.

OMITTED test: TauCeti.DerivedDeRham.test_derham_frob_base
On the base Z/p^n, the canonical Frobenius is the base identity.

OMITTED test: TauCeti.DerivedDeRham.test_derham_frob_coordinate
Modulo p on F_p[t], t maps to t^p and the differential of t^p is zero.

OMITTED test: TauCeti.DerivedDeRham.test_derham_frob_filtration_boundary
The Hodge and conjugate filtrations have opposite directions and are not equated by existence of φ.
-/

/- DD.4: The derived de Rham description of A_cris
Boundary: The CR.0/CR.2/CR.4 and period suppliers must provide the named model and canonical maps. No comparison to an arbitrary target or unrestricted QRSP assertion is retained.
Required interface: The CR.0/CR.2/CR.4 and period suppliers must provide the named model and canonical maps. No comparison to an arbitrary target or unrestricted QRSP assertion is retained.

OMITTED declaration: TauCeti.DerivedDeRham.acrisDerivedDescription
In Bhatt Notation 9.1, let W=W(k), K/Frac(W) finite, C=widehat(bar K), A_inf=W(O_C^♭) with θ:A_inf→O_C and regular kernel ξ supplied by AI.0. Then Λ_p dR_(O_barK/W)≃Λ_p dR_(O_C/W)≃Λ_p dR_(O_C/A_inf)≃widehat D_(A_inf)(ker θ)=A_cris. The Hodge filtration is the completed PD filtration, the map A_inf→A_cris is the PD structure map, and the equivalence preserves Frobenius and the G_K action. The integral perfectoid generalization keeps the regular θ-kernel and relatively perfect mod-p input.
-/

/- DD.4: The torsion boundary for F_p over Z_p
Boundary: The CR.0/CR.2/CR.4 and period suppliers must provide the named model and canonical maps. No comparison to an arbitrary target or unrestricted QRSP assertion is retained.
Required interface: The CR.0/CR.2/CR.4 and period suppliers must provide the named model and canonical maps. No comparison to an arbitrary target or unrestricted QRSP assertion is retained.

OMITTED declaration: TauCeti.DerivedDeRham.fpOverZpTorsion
The p-completed de Rham complex of F_p/Z_p is the derived completion of [Z_p⟨x⟩ --(x−p)→ Z_p⟨x⟩] in degrees −1,0. Its decompleted model is Z_p⊕⊕_(j>0) Z_p/j in degree zero; the completion of the torsion direct sum need not be torsion. In the factors Z_p/p^n the coordinates p^floor(n/2) tend p-adically to zero and have unbounded orders, hence define a nontorsion completed-sum element. This corrects Remark 8.7; the printed p^(n−1) coordinates are all killed by p. For a perfect F_p-algebra A₀, the Witt summand in Corollary 8.6 is W(A₀).
-/

/- DD.4: Hodge completion and B_dR⁺
Boundary: The CR.0/CR.2/CR.4 and period suppliers must provide the named model and canonical maps. No comparison to an arbitrary target or unrestricted QRSP assertion is retained.
Required interface: The CR.0/CR.2/CR.4 and period suppliers must provide the named model and canonical maps. No comparison to an arbitrary target or unrestricted QRSP assertion is retained.

OMITTED declaration: TauCeti.DerivedDeRham.rationalHodgePeriodComparison
For the same W,K,C as above, the rational Hodge completion of the p-completed derived de Rham period object, Rlim_i(((Λ_p dR_(O_barK/W))/Fil_H^i)[1/p]), identifies with the ker(θ)[1/p]-adic completion of A_inf[1/p], namely the shared B_dR⁺. Precisely use Rlim_i(((Λ_p dR)/Fil_H^i)[1/p]); inversion outside the limit is not identified with it. The natural map A_cris→B_dR⁺ preserves the filtration and G_K action; passage to B_dR and B_cris uses the period owner’s specified localization maps.
-/

/- DD.4: The conjugate filtration of a PD envelope
Boundary: The CR.0/CR.2/CR.4 and period suppliers must provide the named model and canonical maps. No comparison to an arbitrary target or unrestricted QRSP assertion is retained.
Required interface: The CR.0/CR.2/CR.4 and period suppliers must provide the named model and canonical maps. No comparison to an arbitrary target or unrestricted QRSP assertion is retained.

OMITTED declaration: TauCeti.DerivedDeRham.pdConjugateFiltration
For an F_p-algebra A, ideal I and ordinary PD envelope D_A(I), define Fil_n^conj as the A-submodule generated by products ∏ a_j^[l_j] with a_j∈I and Σl_j<(n+1)p, with Fil_(−1)=0. It is increasing, multiplicative and exhaustive; equivalently use products ∏a_j^[p k_j] with Σk_j≤n. There is a canonical surjective graded map Γ^*_(A/I)(I/I²)⊗_(A/I,Frob) A/φ(I)→gr_*^conj D_A(I), sending divided-power monomials to ∏((p k_j)!/(p^k_j k_j!))a_j^[p k_j]. Here φ(I) is the ideal generated by a^p for a∈I. These factors are p-adic units.

OMITTED api: TauCeti.DerivedDeRham.pdConjugateMembership
The two displayed generator descriptions define the same filtration level.

OMITTED api: TauCeti.DerivedDeRham.pdConjugateProduct
Fil_i·Fil_j⊆Fil_(i+j) and colim Fil_i=D_A(I).

OMITTED api: TauCeti.DerivedDeRham.pdConjugateGradedMap
The divided-power graded map has the displayed Frobenius base change and factorial factors.

OMITTED api: TauCeti.DerivedDeRham.pdConjugateNatural
Maps of F_p PD envelope problems preserve all levels and the graded map.

OMITTED test: TauCeti.DerivedDeRham.test_pd_conj_zero_ideal
For I=0 only weight zero survives, and D_A(0)=A.

OMITTED test: TauCeti.DerivedDeRham.test_pd_conj_coordinate
For A=F_p[x], I=(x), γ_(p k)(x) has conjugate weight k and γ_(p−1)(x) belongs to weight zero.

OMITTED test: TauCeti.DerivedDeRham.test_pd_conj_two_filtrations
γ_p(x) has conjugate weight 1 but PD/Hodge weight p; the two filtrations are different.
-/

/- DD.4: Quasiregular semiperfect derived de Rham and PD envelopes
Boundary: The CR.0/CR.2/CR.4 and period suppliers must provide the named model and canonical maps. No comparison to an arbitrary target or unrestricted QRSP assertion is retained.
Required interface: The CR.0/CR.2/CR.4 and period suppliers must provide the named model and canonical maps. No comparison to an arbitrary target or unrestricted QRSP assertion is retained.

OMITTED declaration: TauCeti.DerivedDeRham.qrspPdDerham
For every quasiregular semiperfect F_p-algebra S, put S^♭=lim_φ S and I=ker(S^♭→S). Then dR_(S/F_p)≃dR_(S/S^♭) is discrete and naturally identifies with D_(S^♭)(I)=A_crys(S)/p. The Hodge filtration is the PD filtration and the increasing conjugate filtration agrees with the PD conjugate filtration, with gr_*≃Γ^*_S(I/I²). No finite-generation or regular-sequence hypothesis on I is imposed. A_crys(S) is the imported completed PD envelope of W(S^♭)→S.
-/

/- DD.4: Derived de Rham–Witt with Nygaard filtration
Boundary: CR.4 must provide the classical smooth Witt functor and its left Kan extension. The QRSP theorem takes an actual QRSP object (including a perfectoid source) and its canonical completed Witt value. No unrestricted higher-cohomology assertion or negation is retained.
Required interface: CR.4 must provide the classical smooth Witt functor and its left Kan extension. The QRSP theorem takes an actual QRSP object (including a perfectoid source) and its canonical completed Witt value. No unrestricted higher-cohomology assertion or negation is retained.

OMITTED declaration: TauCeti.DerivedDeRham.derivedDeRhamWitt
Import the classical smooth F_p de Rham–Witt complex WΩ and its Nygaard filtration from the early CR.4 supplier. Define LWΩ on animated F_p-algebras by the common left Kan extension into p-complete filtered E∞ Z_p-algebras, using p-completed colimits. Extend the CR.4 divided Frobenius maps to obtain fiber sequences N^(≥i+1)LWΩ→N^(≥i)LWΩ --φ_i mod p→Fil_i^conj dR, and LWΩ/N^(≥i) --p→LWΩ/N^(≥i+1)→dR/Fil_H^(i+1). The source’s smooth WΩ and later derived comparison are different ownership steps.

OMITTED api: TauCeti.DerivedDeRham.derivedWittSmooth
On a smooth F_p-algebra, LWΩ is the imported classical WΩ with its Nygaard filtration.

OMITTED api: TauCeti.DerivedDeRham.derivedWittModP
LWΩ_S⊗^L_Zp F_p≃dR_(S/F_p).

OMITTED api: TauCeti.DerivedDeRham.derivedWittDividedFrobenius
φ_i:N^(≥i)LWΩ→LWΩ has the displayed modulo-p fiber sequence.

OMITTED api: TauCeti.DerivedDeRham.derivedWittHodgeQuotient
Multiplication by p on Nygaard quotients has cofiber dR/Fil_H^(i+1).

OMITTED test: TauCeti.DerivedDeRham.test_derived_witt_perfect
For perfect S, LWΩ_S=W(S), with Nygaard filtration p^iW(S).

OMITTED test: TauCeti.DerivedDeRham.test_derived_witt_fp
For S=F_p, LWΩ=Z_p and reduction is F_p.

OMITTED test: TauCeti.DerivedDeRham.test_derived_witt_singular_boundary
For non-lci S, mod-p dR can have negative cohomology, so LWΩ is not asserted discrete for every animated S.
-/

/- DD.4: Quasiregular semiperfect derived Witt control
Boundary: CR.4 must provide the classical smooth Witt functor and its left Kan extension. The QRSP theorem takes an actual QRSP object (including a perfectoid source) and its canonical completed Witt value. No unrestricted higher-cohomology assertion or negation is retained.
Required interface: CR.4 must provide the classical smooth Witt functor and its left Kan extension. The QRSP theorem takes an actual QRSP object (including a perfectoid source) and its canonical completed Witt value. No unrestricted higher-cohomology assertion or negation is retained.

OMITTED declaration: TauCeti.DerivedDeRham.qrspWittControl
For quasiregular semiperfect S over F_p, LWΩ_S is degree zero and p-torsion-free, N^(≥i)LWΩ_S is a degree-zero submodule, φ_i mod p on gr_N^i LWΩ injects into dR_(S/F_p) with image Fil_i^conj, and LWΩ_S→S is a PD thickening. The injectivity is on the Nygaard graded term; it is not an injectivity claim for φ_i mod p on the entire level N^(≥i).
-/

/- DD.4: The structure theorem for A_crys(S)
Boundary: The CR.0/CR.2/CR.4 and period suppliers must provide the named model and canonical maps. No comparison to an arbitrary target or unrestricted QRSP assertion is retained.
Required interface: The CR.0/CR.2/CR.4 and period suppliers must provide the named model and canonical maps. No comparison to an arbitrary target or unrestricted QRSP assertion is retained.

OMITTED declaration: TauCeti.DerivedDeRham.acrysStructure
For every quasiregular semiperfect F_p-algebra S, the imported A_crys(S) is p-torsion-free and has a natural φ-equivariant identification A_crys(S)≃LWΩ_S matching Nygaard filtrations. Its N^(≥i) is {x:φ(x)∈p^iA_crys}; the divided Frobenius gr_N^i→A_crys/p injects with conjugate image Fil_i^conj. The image of N^(≥i) modulo p is Fil_H^i dR. Nygaard completion modulo p is Hodge-completed dR, and φ mod p is x↦x^p. Nygaard completion and completion at the PD ideal are not identified; at p=2 the latter can collapse Z₂ to F₂.
-/

/- DD.4: The canonical crystalline Čech complex
Boundary: The CR.0/CR.2/CR.4 and period suppliers must provide the named model and canonical maps. No comparison to an arbitrary target or unrestricted QRSP assertion is retained.
Required interface: The CR.0/CR.2/CR.4 and period suppliers must provide the named model and canonical maps. No comparison to an arbitrary target or unrestricted QRSP assertion is retained.

OMITTED declaration: TauCeti.DerivedDeRham.regularFpCrystallineCech
For a regular F_p-algebra A in BMS2 Remark 8.15’s convention, let S=A_perf be its direct-limit perfection. The map A→S is a quasisyntomic cover and its completed Čech terms are quasiregular semiperfect. The canonical cochain complex A_crys(S)→A_crys(S⊗_A S)→… computes RΓ_crys(A/Z_p), through the unfolding of LWΩ on QSyn_(F_p). Regularity is essential for faithful flatness of perfection; this formula is not asserted for arbitrary singular A.
-/

/- DD.5: The quasisyntomic sites
Boundary: The actual QSyn/QRSP objects, complete-flat morphisms and covering diagrams must be used. Q0 supplies a chosen perfectoid source; no surjection from every ring or arbitrary totalization is asserted.
Required interface: The actual QSyn/QRSP objects, complete-flat morphisms and covering diagrams must be used. Q0 supplies a chosen perfectoid source; no surjection from every ring or arbitrary totalization is asserted.

OMITTED declaration: TauCeti.DerivedDeRham.quasisyntomicSite
Fix p. QSyn has p-complete bounded-p-torsion rings whose L_(A/Z_p) has p-complete Tor amplitude [−1,0]; its opposite has singleton covers given by the DD.0 quasisyntomic morphism condition with complete faithful flatness. Construct the big slices QSyn_R (all maps R→A with A∈QSyn) and the relative subsite qSyn_R (quasisyntomic R-algebras). Their completed fiber products for covers, composition and base-change stability define the site; the full ring category need not have every finite limit. These two relative categories are distinguished.

OMITTED api: TauCeti.DerivedDeRham.qSynCoverComposition
Identity covers and composites are covers.

OMITTED api: TauCeti.DerivedDeRham.qSynCoverBaseChange
The p-completed derived pushout of a cover is an ordinary bounded-torsion quasisyntomic cover under complete flatness.

OMITTED api: TauCeti.DerivedDeRham.qSynObjectCoverDescent
For a quasisyntomic cover A→B, A∈QSyn iff B∈QSyn.

OMITTED api: TauCeti.DerivedDeRham.qSynRelativeInclusion
qSyn_R embeds in QSyn_R; for R=Z_p or integral perfectoid R, the relative cotangent amplitude is automatically [−1,0] on the big slice.

OMITTED test: TauCeti.DerivedDeRham.test_qsyn_site_zp
Z_p lies in QSyn and its identity is a cover.

OMITTED test: TauCeti.DerivedDeRham.test_qsyn_site_smooth
The p-completion of a smooth algebra over an integral perfectoid ring is an object.

OMITTED test: TauCeti.DerivedDeRham.test_qsyn_site_nonlci
F_p[x,y]/(x,y)² is not an object because the full absolute cotangent complex has unbounded negative homology.
-/

/- DD.5: Quasiregular semiperfectoid rings
Boundary: A QRSP ring includes QSyn, semiperfect reduction and an existing chosen integral perfectoid source from Q0. The cover is the specific completed root construction with its augmentation. The full source predicate and root construction are unavailable; surjections from arbitrary rings are omitted.
Required interface: A QRSP ring includes QSyn, semiperfect reduction and an existing chosen integral perfectoid source from Q0. The cover is the specific completed root construction with its augmentation. The full source predicate and root construction are unavailable; surjections from arbitrary rings are omitted.

OMITTED declaration: TauCeti.DerivedDeRham.quasiregularSemiperfectoidRings
A quasiregular semiperfectoid ring S is a QSyn object admitting a map from an integral perfectoid ring R and having surjective Frobenius on S/p. Equivalently it is a quotient of an integral perfectoid ring by a p-completely quasiregular ideal, with bounded p-torsion and relative cotangent in degree −1. QRSPerfd carries the induced cover topology. In characteristic p these are exactly quasiregular semiperfect F_p-algebras: S^♭=lim_φ S→S is surjective and L_(S/F_p)≃L_(S/S^♭)≃(I/I²)[1] with I/I² flat, I=ker(S^♭→S). Quasiregularity here need not mean a finite regular sequence.

OMITTED api: TauCeti.DerivedDeRham.qrspPerfectoidQuotient
The quotient characterization uses a p-completely quasiregular ideal and an integral perfectoid source.

OMITTED api: TauCeti.DerivedDeRham.qrspCotangentDegree
For S and any integral perfectoid R→S, Λ_p L_(S/R) is a shifted complete-flat module.

OMITTED api: TauCeti.DerivedDeRham.qrspCharacteristicP
In characteristic p, QRSPerfd equals quasiregular semiperfect F_p-algebras with flat I/I².

OMITTED api: TauCeti.DerivedDeRham.qrspPerfectoidExample
Every integral perfectoid ring is a QRSPerfd object.

OMITTED test: TauCeti.DerivedDeRham.test_qrsp_perfect_fp
Every perfect F_p-algebra is quasiregular semiperfect, with I=0.

OMITTED test: TauCeti.DerivedDeRham.test_qrsp_root_quotient
F_p[t^(1/p^∞)]/(t) is quasiregular semiperfect, with its nonzero conormal module in degree −1.

OMITTED test: TauCeti.DerivedDeRham.test_qrsp_zp_boundary
Z_p meets the QSyn and semiperfect-reduction conditions but admits no map from an integral perfectoid ring, so is excluded.
-/

/- DD.5: Compatible-root quasisyntomic covers
Boundary: A QRSP ring includes QSyn, semiperfect reduction and an existing chosen integral perfectoid source from Q0. The cover is the specific completed root construction with its augmentation. The full source predicate and root construction are unavailable; surjections from arbitrary rings are omitted.
Required interface: A QRSP ring includes QSyn, semiperfect reduction and an existing chosen integral perfectoid source from Q0. The cover is the specific completed root construction with its augmentation. The full source predicate and root construction are unavailable; surjections from arbitrary rings are omitted.

OMITTED declaration: TauCeti.DerivedDeRham.elementarySemiperfectoidCovers
For A∈QSyn, choose a surjective free p-complete polynomial algebra F→A. Adjoin compatible p-power roots of p and all polynomial coordinates to obtain the integral perfectoid F_∞. Put S=Λ_p(A⊗^L_F F_∞). Then A→S is a quasisyntomic cover and S∈QRSPerfd. Its mod-p module is free faithfully flat over A/p, and L_(S/p over A/p)[−1] is free. The cover is elementary; it does not use Q3’s absolutely-integrally-closed extension theorem.

OMITTED api: TauCeti.DerivedDeRham.rootCoverFaithfullyFlat
S/p is free faithfully flat over A/p.

OMITTED api: TauCeti.DerivedDeRham.rootCoverCotangent
L_(S/p over A/p)[−1] is a free S/p-module.

OMITTED api: TauCeti.DerivedDeRham.rootCoverPerfectoidSource
The cover comes with an integral perfectoid surjection F_∞→S.

OMITTED api: TauCeti.DerivedDeRham.rootCoverFunctorialRefinement
Maps between choices of generators produce a common refinement of the resulting covers.

OMITTED test: TauCeti.DerivedDeRham.test_root_cover_zp
For A=Z_p, adjoining all compatible roots of p and completing gives a perfectoid cover.

OMITTED test: TauCeti.DerivedDeRham.test_root_cover_coordinate
For A=Z_p⟨t⟩, roots of p and t give the stated free mod-p module and shifted free relative cotangent.

OMITTED test: TauCeti.DerivedDeRham.test_root_cover_finite_roots
Adjoining only t^(1/p) leaves elements without p-power roots in the next stage and does not establish semiperfectness.
-/

/- DD.5: Refinement and Čech stability of QRSP covers
Boundary: The actual QSyn/QRSP objects, complete-flat morphisms and covering diagrams must be used. Q0 supplies a chosen perfectoid source; no surjection from every ring or arbitrary totalization is asserted.
Required interface: The actual QSyn/QRSP objects, complete-flat morphisms and covering diagrams must be used. Q0 supplies a chosen perfectoid source; no surjection from every ring or arbitrary totalization is asserted.

OMITTED declaration: TauCeti.DerivedDeRham.qrspRefinement
Completed base change of a QSyn cover with QRSP target by a QRSP object is QRSP; each term of the completed Čech nerve of A→S with S∈QRSPerfd is QRSP. Any two such covers admit a common QRSP refinement by applying the elementary cover to their completed fiber product. Relative and big-slice variants retain the same statement. This establishes the basis condition needed for unfolding.
-/

/- DD.5: Sheaves and unfolding from the QRSP basis
Boundary: The actual QSyn/QRSP objects, complete-flat morphisms and covering diagrams must be used. Q0 supplies a chosen perfectoid source; no surjection from every ring or arbitrary totalization is asserted.
Required interface: The actual QSyn/QRSP objects, complete-flat morphisms and covering diagrams must be used. Q0 supplies a chosen perfectoid source; no surjection from every ring or arbitrary totalization is asserted.

OMITTED declaration: TauCeti.DerivedDeRham.qrspUnfolding
For a presentable enhanced target category C, restriction gives Shv_C(QSyn^op)≃Shv_C(QRSPerfd^op). Its inverse sends F to the unfolding F^unf(A)=Tot(F(S•)) for any QRSP cover A→S; this is independent of the cover by common refinement. The same applies to the specified relative and big-slice sites. In a complete filtered module target, evaluation and graded pieces commute with unfolding; the underlying object commutes for nonnegative filtrations that are constant below zero.
-/

/- DD.5: Descent of completed cotangent powers
Boundary: The actual QSyn/QRSP objects, complete-flat morphisms and covering diagrams must be used. Q0 supplies a chosen perfectoid source; no surjection from every ring or arbitrary totalization is asserted.
Required interface: The actual QSyn/QRSP objects, complete-flat morphisms and covering diagrams must be used. Q0 supplies a chosen perfectoid source; no surjection from every ring or arbitrary totalization is asserted.

OMITTED declaration: TauCeti.DerivedDeRham.completedCotangentDescent
For a fixed ordinary base R and a p-completely faithfully flat map A→B between bounded-torsion p-complete rings, the completed cotangent exterior-power functor A↦Λ_p L∧^i_A L_(A/R) satisfies Čech descent: its value at A is Tot of the values at the completed Čech terms. Finite Hodge quotients inherit descent by finite exact extensions. The mod-p proof keeps the derived reductions and the completed base ring; no freeness of the cotangent complex is assumed.
-/

/- DD.5: Descent of Hodge quotients and completion
Boundary: The actual QSyn/QRSP objects, complete-flat morphisms and covering diagrams must be used. Q0 supplies a chosen perfectoid source; no surjection from every ring or arbitrary totalization is asserted.
Required interface: The actual QSyn/QRSP objects, complete-flat morphisms and covering diagrams must be used. Q0 supplies a chosen perfectoid source; no surjection from every ring or arbitrary totalization is asserted.

OMITTED declaration: TauCeti.DerivedDeRham.filteredDeRhamDescent
The functors A↦dR_(A/R)/Fil_H^m for finite m, their p-completions, and the complete Hodge-filtered object dR^hc_(A/R) satisfy their flat or p-completely flat Čech descent assertions. For Hodge completion, Tot commutes with the quotient inverse limit because both are limits. Graded conservativity is used only in the complete filtered category. There is no assertion here that uncompleted derived de Rham commutes with every unbounded totalization.
-/

/- DD.5: Descent of p-completed uncompleted de Rham
Boundary: The actual QSyn/QRSP objects, complete-flat morphisms and covering diagrams must be used. Q0 supplies a chosen perfectoid source; no surjection from every ring or arbitrary totalization is asserted.
Required interface: The actual QSyn/QRSP objects, complete-flat morphisms and covering diagrams must be used. Q0 supplies a chosen perfectoid source; no surjection from every ring or arbitrary totalization is asserted.

OMITTED declaration: TauCeti.DerivedDeRham.uncompletedPDeRhamDescent
For a fixed R∈QSyn, Λ_p dR_(−/R) is a sheaf on the relative site qSyn_R. If R=Z_p or R is integral perfectoid, it is also a sheaf on the big slice QSyn_R. Modulo p, its increasing exhaustive conjugate filtration has sheaf stages uniformly in D^(≥−1); hence filtered colimits commute with the Čech totalization in the required bounded-below category. The same conclusion holds in BL Variant E.17’s p-quasisyntomic range. The uniform bound and relative-site restriction are explicit.
-/

/- DD.5: Relative Tor-amplitude estimates
Boundary: The actual QSyn/QRSP objects, complete-flat morphisms and covering diagrams must be used. Q0 supplies a chosen perfectoid source; no surjection from every ring or arbitrary totalization is asserted.
Required interface: The actual QSyn/QRSP objects, complete-flat morphisms and covering diagrams must be used. Q0 supplies a chosen perfectoid source; no surjection from every ring or arbitrary totalization is asserted.

OMITTED declaration: TauCeti.DerivedDeRham.relativeTorAmplitude
For a quasisyntomic R-algebra A, Λ_p L_(A/R) has p-complete Tor amplitude [−1,0]; thus Λ_p L∧^i L_(A/R) has amplitude [−i,0], its Hodge/conjugate shift [−i] has [0,i] before the additional derived Z/p tensor bound, and each finite quotient has a specified finite amplitude bound. For a quasismooth map the completed L is a p-completely flat module in degree zero; ordinary flatness requires an additional criterion, such as the Noetherian complete-flatness theorem in DD.1. For relative QRSP algebras the shifted cotangent and divided-power terms are complete-flat in degree zero. These are Tor-amplitude assertions, not finite-projectivity assertions without finiteness.
-/

/- DD.5: Proper smooth de Rham perfectness
Boundary: The specified scheme/formal morphism to the base, its affine reductions, proper/smooth/finite-presentation hypotheses, actual derived square and lifting theorem must be supplied by SF/AlgebraicModuli/EDS. The polynomial one-form and affine-line nonfinite tests retain their concrete base and scheme; identity maps are excluded from those examples.
Required interface: The specified scheme/formal morphism to the base, its affine reductions, proper/smooth/finite-presentation hypotheses, actual derived square and lifting theorem must be supplied by SF/AlgebraicModuli/EDS. The polynomial one-form and affine-line nonfinite tests retain their concrete base and scheme; identity maps are excluded from those examples.

OMITTED declaration: TauCeti.DerivedDeRham.properSmoothCohomologicalControl
Let A be p-complete with bounded p-torsion and X a proper p-completely smooth formal A-scheme of finite presentation, with compatible proper smooth ordinary reductions X_n/A_n of bounded relative dimension d. Then the p-completed continuous de Rham global object is a perfect derived p-complete A-complex. Each RΓ(X_n,Ω^i_(X_n/A_n)) is perfect by the shared proper-flat coherent-cohomology theorem, its Hodge quotient is a finite extension of these pieces, and Ω^i=0 for i>d. No degeneration or finite-projective individual H^j is asserted. The same finite-filtration argument applies to an ordinary proper smooth finite-presentation A-scheme with its smooth ordinary/Hodge-completed comparison in the appropriate characteristic.
-/

/- DD.5: Completed base change and cup products
Boundary: The specified scheme/formal morphism to the base, its affine reductions, proper/smooth/finite-presentation hypotheses, actual derived square and lifting theorem must be supplied by SF/AlgebraicModuli/EDS. The polynomial one-form and affine-line nonfinite tests retain their concrete base and scheme; identity maps are excluded from those examples.
Required interface: The specified scheme/formal morphism to the base, its affine reductions, proper/smooth/finite-presentation hypotheses, actual derived square and lifting theorem must be supplied by SF/AlgebraicModuli/EDS. The polynomial one-form and affine-line nonfinite tests retain their concrete base and scheme; identity maps are excluded from those examples.

OMITTED declaration: TauCeti.DerivedDeRham.completedBaseChangeCupProducts
Under the proper smooth finite-presentation hypotheses of the preceding node, a bounded-torsion p-complete base map A→A′ gives a natural equivalence RΓ_dR(X/A) completed-tensor^L_A A′≃RΓ_dR(X completed-base-change A′/A′), compatibly with Hodge filtrations and cup products. All completed tensor and reductions are derived. For general QSyn algebras the affine base-change/Künneth and descent products remain available, but neither proper global perfectness nor a finite-projective cohomology conclusion follows.
-/

/- DD.5: The proj-quasisyntomic variant over O_C
Boundary: The actual QSyn/QRSP objects, complete-flat morphisms and covering diagrams must be used. Q0 supplies a chosen perfectoid source; no surjection from every ring or arbitrary totalization is asserted.
Required interface: The actual QSyn/QRSP objects, complete-flat morphisms and covering diagrams must be used. Q0 supplies a chosen perfectoid source; no surjection from every ring or arbitrary totalization is asserted.

OMITTED declaration: TauCeti.DerivedDeRham.projQuasisyntomicSite
For O_C with C a characteristic-zero perfectoid field, a map A→B of p-complete p-torsion-free O_C-algebras is proj-quasisyntomic if B/p is a projective A/p-module and L_(B/p over A/p) has projective amplitude [−1,0]; it is a cover if B/p is also faithfully flat. Form the relative proj-qSyn_(O_C) and proj-qrsPerfd_(O_C) sites. They have completed base-change/composition stability, compatible-root basis covers and the sheaf-unfolding equivalence. Projective amplitude is stronger than Tor amplitude and does not imply finite generation.

OMITTED api: TauCeti.DerivedDeRham.projQSynCover
A cover has projective faithfully flat reduction and projective cotangent amplitude [−1,0].

OMITTED api: TauCeti.DerivedDeRham.projQSynSmooth
The p-completion of a smooth O_C-algebra is in the relative projective site.

OMITTED api: TauCeti.DerivedDeRham.projQSynRootBasis
Every such object admits a compatible-root cover by proj-QRSP objects.

OMITTED api: TauCeti.DerivedDeRham.projQSynUnfolding
Restriction to the proj-QRSP basis is a sheaf equivalence in presentable targets.

OMITTED test: TauCeti.DerivedDeRham.test_proj_qsyn_identity
O_C→O_C has rank-one projective reduction and zero relative cotangent.

OMITTED test: TauCeti.DerivedDeRham.test_proj_qsyn_smooth
O_C⟨t⟩ has the free coordinate differential module and qualifies.

OMITTED test: TauCeti.DerivedDeRham.test_proj_qsyn_torsion
An O_C-algebra with nonzero p-torsion is excluded even if its reduction happens to be projective.
-/

/- DD.5: From quasisyntomic sheaves to formal étale sites
Boundary: The specified scheme/formal morphism to the base, its affine reductions, proper/smooth/finite-presentation hypotheses, actual derived square and lifting theorem must be supplied by SF/AlgebraicModuli/EDS. The polynomial one-form and affine-line nonfinite tests retain their concrete base and scheme; identity maps are excluded from those examples.
Required interface: The specified scheme/formal morphism to the base, its affine reductions, proper/smooth/finite-presentation hypotheses, actual derived square and lifting theorem must be supplied by SF/AlgebraicModuli/EDS. The polynomial one-form and affine-line nonfinite tests retain their concrete base and scheme; identity maps are excluded from those examples.

OMITTED declaration: TauCeti.DerivedDeRham.formalEtaleRealization
For a p-complete formal scheme X with QSyn affine charts, a C-valued sheaf F on QSyn defines a sheaf F_X on X_ét by F_X(U)=lim_(Spf A⊆U)F(A), the limit over affine formal opens. Smooth/étale maps of such charts are quasisyntomic maps. A completely faithfully flat map, or a jointly covering family with that faithful cover property, supplies quasisyntomic descent, so the local values glue; an arbitrary individual open immersion is not a cover. The construction is natural in X and retains the coefficient category and any complete filtration carried by F; a small site is used only after chart hypotheses are checked.

OMITTED api: TauCeti.DerivedDeRham.formalEtaleAffine
On Spf A the restricted sheaf recovers F(A).

OMITTED api: TauCeti.DerivedDeRham.formalEtaleCoverDescent
An étale affine-chart cover gives the enhanced Čech descent equivalence.

OMITTED api: TauCeti.DerivedDeRham.formalEtalePullback
Compatible morphisms of formal schemes induce the specified sheaf pullback maps.

OMITTED api: TauCeti.DerivedDeRham.formalEtaleFiltered
For complete filtered targets, evaluation and graded pieces commute with the chart-limit construction.

OMITTED test: TauCeti.DerivedDeRham.test_formal_etale_affine
For X=Spf Z_p and its identity chart, the value is F(Z_p).

OMITTED test: TauCeti.DerivedDeRham.test_formal_etale_smooth_chart
Smooth p-complete polynomial charts over an integral perfectoid base satisfy the required QSyn hypothesis.

OMITTED test: TauCeti.DerivedDeRham.test_formal_etale_bad_chart
A chart with unbounded p-torsion is not accepted as a QSyn chart without additional construction.
-/

/- DD.6: Free prelog resolutions and animation
Boundary: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.
Required interface: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.

OMITTED declaration: TauCeti.DerivedDeRham.freePrelogResolutions
For a prelog base (A,M), import its ring/monoid carrier from the early CR.5 prefix and use free objects (A[T₀,N^(T₁)],M⊕N^(T₁)) with finite generator sets. Finite free objects are the compact projective generators for animation. The free/forgetful cotriple on the underlying generator sets gives a canonical surjective simplicial resolution of (B,N), whose termwise free ring and monoid generator sets may be infinite. Its realization recovers the prelog object, and comparison maps between projective resolutions are coherent homotopy equivalences. Apply the EDS nonabelian animation universal property to this prelog-specific compact-projective subcategory.

OMITTED api: TauCeti.DerivedDeRham.freePrelogUniversal
A base prelog map from the free object is uniquely determined by its ordinary ring generators and compatible monoid generators.

OMITTED api: TauCeti.DerivedDeRham.prelogResolutionAugmentation
The canonical resolution has a surjective augmentation on ring and monoid in every simplicial degree.

OMITTED api: TauCeti.DerivedDeRham.prelogResolutionComparison
Projective resolutions compare coherently after realization.

OMITTED api: TauCeti.DerivedDeRham.prelogAnimationExtend
A sifted-colimit preserving enhanced prelog functor is determined on the finite free objects.

OMITTED test: TauCeti.DerivedDeRham.test_prelog_free_empty
With both generator sets empty the free object is (A,M).

OMITTED test: TauCeti.DerivedDeRham.test_prelog_free_two_generators
One ordinary t and one monoid x give (A[t,x],M⊕N), with x the image of the monoid generator.

OMITTED test: TauCeti.DerivedDeRham.test_prelog_free_no_identification
The monoid generator x is not freely mapped independently of its ring image; forgetting this compatibility gives the wrong adjunction.
-/

/- DD.6: Derived logarithmic derivations
Boundary: The independent intrinsic section space of the split square-zero extension must be constructed in the animated (prelog) slice, with its projection and base point. Mapping spaces are unavailable at the pin; defining this space as cotangent Hom would make the comparison circular. The whole space signature is omitted.
Required interface: The independent intrinsic section space of the split square-zero extension must be constructed in the animated (prelog) slice, with its projection and base point. Mapping spaces are unavailable at the pin; defining this space as cotangent Hom would make the comparison circular. The whole space signature is omitted.

OMITTED declaration: TauCeti.DerivedDeRham.logDerivedDerivations
For a map (A,M)→(B,N) and a connective animated B-module P, define the derived log derivation space as the space of base-compatible sections of (B⊕P,N⊕P)→(B,N). The ring is the split square-zero extension, the monoid operation is (n,u)(n′,u′)=(nn′,u+u′), and its structure sends (n,u) to (α(n),α(n)u). For discrete modules the sections are a ring derivation D:B→P and additive log derivative δ:N→P satisfying D(α(n))=α(n)δ(n), with both zero on the base.

OMITTED api: TauCeti.DerivedDeRham.logDerivationsDiscrete
π₀ for a discrete module is the compatible pair (D,δ) satisfying Dα=αδ.

OMITTED api: TauCeti.DerivedDeRham.logDerivationsModuleMap
A B-linear P→P′ induces the coherent map of section spaces.

OMITTED api: TauCeti.DerivedDeRham.logDerivationsFree
For finite free prelog generators the sections are freely specified by ordinary D(t) and logarithmic δ(x).

OMITTED api: TauCeti.DerivedDeRham.logDerivationsRepresented
The Gabber cotangent represents this functor by Map_B(L_log,P).

OMITTED test: TauCeti.DerivedDeRham.test_log_derivations_identity
For the identity prelog map, the section space is contractible.

OMITTED test: TauCeti.DerivedDeRham.test_log_derivations_coordinate
For (A,0)→(A[x],N), a log derivation has D(x)=xδ(1).

OMITTED test: TauCeti.DerivedDeRham.test_log_derivations_log_point
For (k,0)→(k,N→0), discrete derivations have D=0 and arbitrary δ(1)∈P; the representing derived object still has an additional negative cotangent term.
-/

/- DD.6: The Gabber logarithmic cotangent complex
Boundary: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.
Required interface: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.

OMITTED declaration: TauCeti.DerivedDeRham.gabberLogCotangent
For an animated prelog map (A,M)→(B,N), define L_log by realizing Ω¹_log of the common free prelog resolution and derived-extending its module coefficients to B. It represents the independently defined log derivation space, is natural and resolution-independent, and has the universal ring derivation d and monoid map d log. For ordinary rings H⁰ is the imported ordinary logarithmic differential module, with dα(n)=α(n)d log n. This is Gabber’s complex; Olsson’s complex is identified only in the proved integral morphism range, not for all log smooth maps.

OMITTED api: TauCeti.DerivedDeRham.logCotangentUniversal
Map_B(L_log,P)≃Der_log((B,N)/(A,M),P).

OMITTED api: TauCeti.DerivedDeRham.logCotangentH0
For ordinary inputs H⁰L_log≃Ω¹_log with the displayed d/d log relation.

OMITTED api: TauCeti.DerivedDeRham.logCotangentOrdinaryMap
There is a natural map L_(B/A)→L_log, an equivalence when the monoid map is an isomorphism.

OMITTED api: TauCeti.DerivedDeRham.logCotangentNaturality
Base-compatible prelog squares give coherent maps of the complexes and the universal d/d log.

OMITTED test: TauCeti.DerivedDeRham.test_log_cotangent_identity
An identity prelog map has zero cotangent complex.

OMITTED test: TauCeti.DerivedDeRham.test_log_cotangent_free
For (A,0)→(A[t,x],N), L_log is free in degree zero on dt and d log x, with dx=x d log x.

OMITTED test: TauCeti.DerivedDeRham.test_log_cotangent_nonintegral
KY Remark 2.13 with P generated by (2,0),(0,2),(1,1) inside N² and char(k)≠2 is log étale but has unbounded Gabber cotangent homology.
-/

/- DD.6: Log cotangent transitivity, base change and invariance
Boundary: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.
Required interface: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.

OMITTED declaration: TauCeti.DerivedDeRham.logCotangentFunctoriality
For composable animated prelog maps R→S→T, L_log(S/R)⊗^L_S T→L_log(T/R)→L_log(T/S) is a canonical fiber sequence. A homotopy pushout of prelog rings gives the corresponding derived cotangent base-change equivalence, and filtered colimits commute with L_log. Passage to the associated log structure preserves the Gabber cotangent complex in the source’s established log-equivalence range; a map inducing an isomorphism of associated log rings has relative cotangent zero. For an integral morphism of integral prelog rings that is log smooth after logification, L_log≃Ω¹_log. The derived pushout is replaced by the ordinary one only under the homological log-flat condition.
-/

/- DD.6: Homological logarithmic flatness
Boundary: KY Definition 2.44 requires the specific derived ring/monoid pushouts for all compatible base changes, not an arbitrary function into D(B). Composition/base change use actual hlf maps. Remark 2.46 gives a specified nonintegral monoid inclusion which is Kato-log-flat but not hlf; universal positive/negative assertions are removed.
Required interface: KY Definition 2.44 requires the specific derived ring/monoid pushouts for all compatible base changes, not an arbitrary function into D(B). Composition/base change use actual hlf maps. Remark 2.46 gives a specified nonintegral monoid inclusion which is Kato-log-flat but not hlf; universal positive/negative assertions are removed.

OMITTED declaration: TauCeti.DerivedDeRham.homologicalLogFlatness
A prelog map R→S is homologically log flat (hlf) if every prelog base map R→S′ makes the derived pushout S′⊔^L_R S equivalent to its ordinary pushout. It is hlf faithfully flat if additionally the underlying ring map is faithfully flat. Equivalently require ordinary ring flatness and the monoid homotopy-pushout flatness of Bhatt Definition 4.8. This is different from Kato log flatness in both directions. Coverings define the hlf topology on prelog algebras.

OMITTED api: TauCeti.DerivedDeRham.hlfUnderlyingCriteria
Hlf iff ring-flat and monoid homotopy-pushout-flat.

OMITTED api: TauCeti.DerivedDeRham.hlfPushoutOrdinary
Every base change has the displayed derived-to-ordinary pushout equivalence.

OMITTED api: TauCeti.DerivedDeRham.hlfCompositionBaseChange
Hlf and hlf faithful-flat maps are stable under composition and base change.

OMITTED api: TauCeti.DerivedDeRham.hlfIntegralSufficient
An underlying flat ring map with injective integral map of integral monoids is hlf.

OMITTED test: TauCeti.DerivedDeRham.test_hlf_strict_flat
A strict map with flat underlying ring is hlf.

OMITTED test: TauCeti.DerivedDeRham.test_hlf_diagonal
The diagonal (k,N→0)→(k,N²→0) is hlf but not Kato log flat.

OMITTED test: TauCeti.DerivedDeRham.test_hlf_nonintegral_kato
For P generated by (2,0),(0,2),(1,1) in Q=N², (k[P],P)→(k[Q],Q) is Kato log flat but not hlf.
-/

/- DD.6: Logarithmic derived de Rham
Boundary: The CR.5 compatible prelog category, strictness/integrality/Cartier predicates, hlf derived pushouts and EDS animation are required. Separate unrelated ring and monoid factors do not form a chart.
Required interface: The CR.5 compatible prelog category, strictness/integrality/Cartier predicates, hlf derived pushouts and EDS animation are required. Separate unrelated ring and monoid factors do not form a chart.

OMITTED declaration: TauCeti.DerivedDeRham.logDerivedDeRham
For an animated prelog map (A,M)→(B,N), realize the ordinary log de Rham dg algebra of the common free prelog resolution with direct sums along antidiagonals. This gives an E∞ A-algebra dR_log with universal ordinary d and closed d log:N→dR_log[1]. It has a decreasing multiplicative Hodge filtration with gr_H^i≃L∧^i_B L_log[−i], an increasing exhaustive conjugate filtration, a separate Hodge completion and the DD.1 p-completion. Strict maps with identical monoids recover ordinary derived de Rham. The derived algebra is A-linear; its full differential is generally not B-linear.

OMITTED api: TauCeti.DerivedDeRham.logDeRhamHodgeGraded
gr_H^i dR_log≃L∧^i L_log[−i].

OMITTED api: TauCeti.DerivedDeRham.logDeRhamDLog
The additive monoid map d log is closed and lands in dR_log[1].

OMITTED api: TauCeti.DerivedDeRham.logDeRhamStrict
For identical base and target monoids, dR_log is ordinary derived de Rham.

OMITTED api: TauCeti.DerivedDeRham.logDeRhamCompletions
Hodge and p-completion are separate functors with their specified universal maps and quotient towers.

OMITTED test: TauCeti.DerivedDeRham.test_log_derham_identity
An identity prelog map gives the base ring with no positive Hodge pieces.

OMITTED test: TauCeti.DerivedDeRham.test_log_derham_free_coordinate
For (F_p,0)→(F_p[x],N), d(x)=x d log x and d(d log x)=0.

OMITTED test: TauCeti.DerivedDeRham.test_log_derham_rational_logification
Bhatt Example 6.15: strict Q→Q[x,x⁻¹] gives uncompleted dR=Q, while logifying the units adds a degree-one conjugate class.
-/

/- DD.6: Log de Rham base change and Künneth
Boundary: The CR.5 compatible prelog category, strictness/integrality/Cartier predicates, hlf derived pushouts and EDS animation are required. Separate unrelated ring and monoid factors do not form a chart.
Required interface: The CR.5 compatible prelog category, strictness/integrality/Cartier predicates, hlf derived pushouts and EDS animation are required. Separate unrelated ring and monoid factors do not form a chart.

OMITTED declaration: TauCeti.DerivedDeRham.logDeRhamBaseChange
For a homotopy pushout of prelog A-algebras S₁,S₂ with result S, dR_log(S₁/A)⊗^L_A S₂≃dR_log(S/S₂), and dR_log(S₁/A)⊗^L_A dR_log(S₂/A)≃dR_log(S/A), compatibly with the Hodge filtrations and multiplication. The p-completed versions use completed derived tensor. The first tensor is over the base ring A; dR_log(S₁/A) is not generally an S₁-module, so the additional S₁-relative tensor printed in KY Theorem 2.11 is not used.
-/

/- DD.6: Derived logarithmic Cartier theory
Boundary: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.
Required interface: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.

OMITTED declaration: TauCeti.DerivedDeRham.logCartier
For a map (A,M)→(B,N) of prelog F_p-algebras, define the Frobenius of the base by p on M and Frobenius on A and form the homotopy prelog pushout (B,N)^(1). The relative Frobenius maps it to (B,N). The increasing conjugate filtration of dR_log is linear over its twisted underlying ring and gr_i^conj≃L∧^i L_log((B,N)^(1)/(A,M))[−i]. On free ordinary coordinates y, inverse Cartier sends dy to [y^(p−1)dy]; on free log coordinates x it sends d log x to [d log x]. All twists are derived unless the ring and monoid flatness criteria are proved.
-/

/- DD.6: The boundary of logification invariance
Boundary: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.
Required interface: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.

OMITTED declaration: TauCeti.DerivedDeRham.logificationBoundaries
For maps of integral prelog Z/p^n-algebras, n≥1, passage to associated log structures preserves uncompleted log derived de Rham with its specified Hodge and conjugate filtrations. The proof uses the derived logarithmic Cartier pieces modulo p and finite p-devissage. The p-completed statement follows under the corresponding integral and compatible derived-reduction hypotheses. No characteristic-zero uncompleted invariance is asserted: Bhatt Example 6.15 is a required counterexample. Cotangent logification invariance and this de Rham assertion have different ranges.
-/

/- DD.6: Integral log smooth Cartier-type comparison
Boundary: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.
Required interface: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.

OMITTED declaration: TauCeti.DerivedDeRham.logSmoothCartierComparison
For a map of integral prelog F_p-algebras that is integral and log smooth of Cartier type after associated logification, Gabber L_log is the ordinary log differential module and derived log de Rham agrees with the ordinary log complex. Nilpotent-p extensions retain flatness and finite devissage hypotheses. Cartier type is the source’s condition on the relative Frobenius exactness and twist; it is not inferred from fs log smoothness alone.
-/

/- DD.6: The log crystalline comparison map
Boundary: CR.5 must supply actual log crystalline values and exactification data. Strictness identifies the log comparison with ordinary Comp, rather than making Comp invertible. The positive example is a strict regular quotient; Bhatt Example 7.23 is the specified non-Cartier chart. Their hypotheses do not overlap; all arbitrary-target assertions are removed.
Required interface: CR.5 must supply actual log crystalline values and exactification data. Strictness identifies the log comparison with ordinary Comp, rather than making Comp invertible. The positive example is a strict regular quotient; Bhatt Example 7.23 is the specified non-Cartier chart. Their hypotheses do not overlap; all arbitrary-target assertions are removed.

OMITTED declaration: TauCeti.DerivedDeRham.logCrystallineComparisonMap
For a prelog Z/p^n-map f:(A,M)→(B,N), use the standard free prelog resolution P•→(B,N). For every effective epimorphism P_i→(B,N), first exactify it, then form the ordinary strict PD envelope compatible with p. The natural map Ω•_log(P•/(A,M))→Ω•_log(P•/(A,M))⊗_(P•,Alg)D_log(P•→(B,N)) yields Comp_log:dR_log(f)→RΓ(f_log-crys,O_crys) via the imported log PD Poincaré equivalence. It is natural, multiplicative and respects Hodge/PD filtrations. Strictification is performed before taking the PD envelope.

OMITTED api: TauCeti.DerivedDeRham.logCrystallineComparisonNatural
Prelog base squares induce the commuting comparison-map squares.

OMITTED api: TauCeti.DerivedDeRham.logCrystallineComparisonFiltered
Hodge terms map to the log crystalline PD filtration.

OMITTED api: TauCeti.DerivedDeRham.logCrystallineComparisonStrict
For strict maps with fixed log structure the map is the ordinary Comp.

OMITTED api: TauCeti.DerivedDeRham.logCrystallineComparisonExactification
The target model uses the exactification followed by the strict PD envelope, functorially.

OMITTED test: TauCeti.DerivedDeRham.test_log_crys_identity
For an identity log map, Comp is the base identity.

OMITTED test: TauCeti.DerivedDeRham.test_log_crys_strict_regular
A strict regular quotient in the nilpotent-p flat range agrees with the DD.4 PD comparison.

OMITTED test: TauCeti.DerivedDeRham.test_log_crys_noncartier
Bhatt Example 7.23 has a comparison map but its relative Frobenius-twisted source and ordinary crystalline target differ.
-/

/- DD.6: The corrected logarithmic lci condition
Boundary: The condition is a factorization of the input prelog map through a log-smooth Cartier-type map and a strict quotient whose kernel in the intermediate ring is generated by a regular sequence. Retain endpoint Z/p^n-flatness and compatible filtered presentations. The CR.5 predicates and presentation data are missing, so no stand-in ideal in B or universal local-filtered assertion is retained.
Required interface: The condition is a factorization of the input prelog map through a log-smooth Cartier-type map and a strict quotient whose kernel in the intermediate ring is generated by a regular sequence. Retain endpoint Z/p^n-flatness and compatible filtered presentations. The CR.5 predicates and presentation data are missing, so no stand-in ideal in B or universal local-filtered assertion is retained.

OMITTED declaration: TauCeti.DerivedDeRham.correctedLogLciCondition
For n≥1, call a prelog Z/p^n-map corrected G-lci when its underlying source and target are Z/p^n-flat and it admits, locally or compatibly as an inductive limit, a factorization a followed by b: a is log smooth and of Cartier type modulo p (or an inductive limit of such maps), and b is strict with underlying surjection whose kernel is generated by a regular sequence. For an inductive factorization require the corresponding filtered regular-sequence presentations and compatibility of the comparison construction. Strict effective epimorphism alone, as printed in Bhatt Definition 7.20, is insufficient.

OMITTED api: TauCeti.DerivedDeRham.correctedGLciFactorization
The condition returns the chosen factorization with its regular quotient and modulo-p Cartier witnesses.

OMITTED api: TauCeti.DerivedDeRham.correctedGLciStrictRegular
A strict regular quotient of flat Z/p^n-algebras is in the condition, with identity first factor.

OMITTED api: TauCeti.DerivedDeRham.correctedGLciLocalFiltered
Local regular presentations and the specified compatible filtered colimit factorizations retain the comparison criterion.

OMITTED api: TauCeti.DerivedDeRham.correctedGLciExample721
All three source examples are supplied with the appropriate finite or filtered regular quotient presentation.

OMITTED test: TauCeti.DerivedDeRham.test_corrected_glci_identity
The identity map has empty regular sequence and Cartier-type first factor.

OMITTED test: TauCeti.DerivedDeRham.test_corrected_glci_hypersurface
The strict quotient F_p[t]→F_p by the regular element t qualifies.

OMITTED test: TauCeti.DerivedDeRham.test_corrected_glci_square_zero
F_p→F_p[x,y]→F_p[x,y]/(x,y)² with trivial logs satisfies the printed condition but fails this corrected regular quotient condition.
-/

/- DD.6: The corrected log crystalline comparison theorem
Boundary: The condition is a factorization of the input prelog map through a log-smooth Cartier-type map and a strict quotient whose kernel in the intermediate ring is generated by a regular sequence. Retain endpoint Z/p^n-flatness and compatible filtered presentations. The CR.5 predicates and presentation data are missing, so no stand-in ideal in B or universal local-filtered assertion is retained.
Required interface: The condition is a factorization of the input prelog map through a log-smooth Cartier-type map and a strict quotient whose kernel in the intermediate ring is generated by a regular sequence. Retain endpoint Z/p^n-flatness and compatible filtered presentations. The CR.5 predicates and presentation data are missing, so no stand-in ideal in B or universal local-filtered assertion is retained.

OMITTED declaration: TauCeti.DerivedDeRham.logLciCrystallineComparison
For a corrected G-lci prelog Z/p^n-map, Comp_log is an equivalence of Hodge-filtered E∞ algebras. Its compatible p-adic version uses derived limits of flat finite reductions with the same corrected factorization. The proof combines integral Cartier-type log smooth comparison for a with the DD.4 regular quotient comparison for b and the logarithmic relative conjugate filtration. This is the valid scope of Bhatt Theorem 7.22 after repairing Definition 7.20. Neither arbitrary strict surjections nor every fs log smooth map are included.
-/

/- DD.6: Log quasisyntomic sites and QRSP bases
Boundary: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.
Required interface: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.

OMITTED declaration: TauCeti.DerivedDeRham.logQuasisyntomicSites
A log-quasisyntomic prelog ring (R,P) has R p-complete with bounded p-torsion and Gabber L_log((R,P)/Z_p) of p-complete Tor amplitude [−1,0]; P need not be integral in KY Definition 3.2. A map A→B between bounded-torsion p-complete prelog rings is p-completely homologically log flat when B⊗^L_A A/p≃B/p is discrete and A/p→B/p is hlf. It is log-quasisyntomic when additionally L_log(B/A)⊗^L_B B/p has Tor amplitude [−1,0], and a cover when the mod-p map is hlf faithfully flat. These covers define QSyn_prelog and the relative qSyn_(R,P) of log-quasisyntomic maps. For a perfectoid prelog base, the big slice has the analogous amplitude/descent package. Integral monoids are an additional restriction of the later log-smooth/prismatic applications, not built into the general site definition.

OMITTED api: TauCeti.DerivedDeRham.logQSynCover
A cover retains complete faithful-flatness, completed hlf and relative log cotangent amplitude [−1,0].

OMITTED api: TauCeti.DerivedDeRham.logQSynBaseChange
The completed homotopy prelog base change preserves the stated covers.

OMITTED api: TauCeti.DerivedDeRham.logQSynQrspBasis
The separate compatible-root construction gives general prelog QRSP basis objects; integrality of an output is checked separately when an application needs it.

OMITTED api: TauCeti.DerivedDeRham.logQSynUnfolding
Restriction to the KY general prelog QRSP basis and enhanced totalization are inverse sheaf constructions.

OMITTED test: TauCeti.DerivedDeRham.test_log_qsyn_strict
With identical monoids and the strict conventions, the ordinary QSyn condition is recovered.

OMITTED test: TauCeti.DerivedDeRham.test_log_qsyn_semistable
The p-complete integral semistable chart is log quasisyntomic over its logarithmic O_K base.

OMITTED test: TauCeti.DerivedDeRham.test_log_qsyn_hlf_boundary
A Kato log-flat map that is not hlf fails the log QSyn cover condition, even if its ring reduction is flat.
-/

/- DD.6: Log cotangent powers and completed de Rham descent
Boundary: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.
Required interface: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.

OMITTED declaration: TauCeti.DerivedDeRham.logPowerDeRhamDescent
For a fixed prelog base, derived exterior powers of the Gabber log cotangent satisfy hlf faithfully-flat Čech descent. Finite Hodge quotients of log derived de Rham inherit descent; the Hodge-completed object descends by its quotient limit. In the log-quasisyntomic range, p-completed uncompleted log de Rham descends using the uniformly bounded-below conjugate filtration. The completion and totalization exchanges retain their boundedness hypotheses and the actual prelog homotopy Čech nerve.
-/

/- DD.6: The log point and its full cotangent complex
Boundary: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.
Required interface: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.

OMITTED declaration: TauCeti.DerivedDeRham.logPointExample
For a field k, the standard log point is (k,N) with every positive monoid element sent to 0. Over the trivial prelog base (k,0), its Gabber complex is [k --0→ k] in cohomological degrees −1,0: factor through the free log line (k[t],N), then the strict regular quotient t=0, whose conormal maps to t d log t=0. H⁰ is k·d log 1 and H^(−1) is k; the log point over this trivial base is not assigned the integral log-smooth degree-zero theorem. Over itself the relative complex is zero and derived de Rham is k. Over F_p its Hodge/conjugate powers retain both cotangent degrees and the actual derived twist.
-/

/- DD.6: The semistable chart with its actual monoid map
Boundary: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.
Required interface: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.

OMITTED declaration: TauCeti.DerivedDeRham.semistableChartExample
Let O_K be a complete mixed-characteristic DVR with uniformizer π and perfect residue field. For 1≤r≤d, B=O_K[x₁,…,x_d]/(x₁…x_r−π), or its p-adic completion, carries the chart N^r→B, e_i↦x_i. The base chart is N→O_K, 1↦π, and the monoid map sends 1↦e₁+…+e_r. This is an integral log smooth Cartier-type chart; its relative Gabber cotangent is the finite free module on d log x₁,…,d log x_r, dx_(r+1),…,dx_d modulo Σd log x_i=0, in degree zero and rank d−1. For the completed chart use continuous completed differentials. The log de Rham Hodge and conjugate pieces, finite reductions and crystalline comparison retain this base chart; the unrelated trivial log base has a different cotangent complex.
-/

/- DD.6: Logarithmic period d log and the Tate map
Boundary: The canonical Tate module, A_inf/PD period model, compatible unit and convergent PD logarithm must come from the AInf/representation suppliers. The formula concerns that logarithm, not an arbitrary function; convergence, first graded map and equivariance cannot be tested on unrelated module maps.
Required interface: The canonical Tate module, A_inf/PD period model, compatible unit and convergent PD logarithm must come from the AInf/representation suppliers. The formula concerns that logarithm, not an arbitrary function; convergence, first graded map and equivariance cannot be tested on unrelated module maps.

OMITTED declaration: TauCeti.DerivedDeRham.logPeriodDlog
In the W,K,C period setup, the canonical uniquely divisible log structure on O_barK gives Λ_p L_(O_barK/W)≃Λ_p L_log((O_barK,can)/W) and Λ_p dR_log≃A_cris. Completing d log:μ_(p^∞)→dR_log[1] yields β:Z_p(1)→Fil_H¹ A_cris, G_K-equivariantly. Under the shared period identification β sends a compatible root-of-unity system ε to log([ε]); the logarithm converges in the imported completed PD ring. Z_p(1), the Galois action, and Tate’s period invariant theorem are imported from their arithmetic/period owners.

OMITTED api: TauCeti.DerivedDeRham.logPeriodOrdinaryComparison
The completed canonical log and ordinary period de Rham objects agree in this uniquely divisible setup.

OMITTED api: TauCeti.DerivedDeRham.periodDLogTate
β:Z_p(1)→Fil_H¹ A_cris is G_K-equivariant.

OMITTED api: TauCeti.DerivedDeRham.periodDLogFormula
β(ε)=log([ε]) in the shared completed PD period ring.

OMITTED api: TauCeti.DerivedDeRham.periodDLogFirstGraded
The first Hodge graded map agrees with the completed d log cotangent/conormal class.

OMITTED test: TauCeti.DerivedDeRham.test_period_dlog_identity
The identity compatible root-of-unity system maps to log(1)=0.

OMITTED test: TauCeti.DerivedDeRham.test_period_dlog_roots
For compatible ε, β(ε^a)=aβ(ε) and G_K acts through the Tate twist.

OMITTED test: TauCeti.DerivedDeRham.test_period_dlog_logarithm_domain
An arbitrary A_inf unit whose image is not 1 under θ is not assigned this Fil_H¹ PD logarithm by the construction.
-/

/- DD.6: Log quasiregular semiperfectoid objects
Boundary: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.
Required interface: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.

OMITTED declaration: TauCeti.DerivedDeRham.logQuasiregularSemiperfectoid
For a p-complete prelog ring (S,P), let P^♭=lim_(×p)P and P× be its units. It is log semiperfectoid in KY Definition 3.11 if (1) S admits a map from an integral perfectoid ring, (2) Frobenius on S/p is surjective, and (3) P^♭→P/P× is surjective. It is log quasiregular semiperfectoid if also (S,P) is log quasisyntomic. Integrality of P is a separately stated additional hypothesis, and is not imposed by this definition. The tilt-surjectivity clause is stronger than p-divisibility of P/P× and weaker than p-divisibility of P; these are not interchanged. Such objects have Λ_p L_log((S,P)/Z_p)[−1] complete-flat. Equivalently, with the log-semiperfect assumptions, require this shifted relative cotangent criterion for a perfectoid ring source equipped with trivial prelog structure.

OMITTED api: TauCeti.DerivedDeRham.logQrspTiltCondition
P^♭→P/P× is surjective, with the ring perfectoid-source and semiperfectness conditions.

OMITTED api: TauCeti.DerivedDeRham.logQrspCotangent
Under log semiperfectness, the shifted relative log cotangent is complete-flat exactly in the log QRSP range.

OMITTED api: TauCeti.DerivedDeRham.logQrspPerfectoidSource
The stated completed source prelog ring surjects on rings and modulo monoid units.

OMITTED api: TauCeti.DerivedDeRham.logQrspDivisibilityRelations
P p-divisible implies tilt-surjectivity, which implies P/P× p-divisible; for sharp monoids the three conditions agree.

OMITTED test: TauCeti.DerivedDeRham.test_log_qrsp_trivial
For trivial monoids the condition reduces to the ordinary QRSP ring condition.

OMITTED test: TauCeti.DerivedDeRham.test_log_qrsp_divisible
If S is ordinary QRSP and P is uniquely p-divisible, then (S,P) is log QRSP by KY Example 3.15(1).

OMITTED test: TauCeti.DerivedDeRham.test_log_qrsp_missing_ring_source
(Z_p,0) has semiperfect reduction and the tilt condition, but lacks a perfectoid ring map and is excluded.
-/

/- DD.6: Compatible-root covers of prelog rings
Boundary: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.
Required interface: The compatible prelog structure map and commuting ring/monoid square must be constructed in CR.5 before animation. Finite free compact-projective generators differ from potentially infinite cotriple terms. Actual strict/chart/hlf/QRSP hypotheses, canonical root diagrams and the specified log point or semistable coordinates are required; arbitrary functors, charts and targets are omitted.

OMITTED declaration: TauCeti.DerivedDeRham.logCompatibleRootCovers
For (R,P)∈QSyn_prelog, choose ring generators Z_p[X_i]→R and monoid generators N^(J)→P. Use the free p-complete prelog source (Z_p⟨X_i,Y_j⟩,N^(J)), with e_j↦Y_j, and its compatible-root cover (O_C⟨X_i^(1/p^∞),Y_j^(1/p^∞)⟩,N[1/p]^(J)) over an integral perfectoid O_C. The p-completed homotopy prelog base change to (R,P) gives a log QSyn cover by log QRSP objects, and its target monoid is p-divisible. The target need not be integral. All completed Čech terms remain log QRSP; restriction to this basis is an equivalence of sheaf categories in any presentable enhanced target.

OMITTED api: TauCeti.DerivedDeRham.logRootCover
The displayed completed two-sort pushout gives a log QSyn cover with log QRSP target.

OMITTED api: TauCeti.DerivedDeRham.logRootCoverMonoid
The target monoid is p-divisible and satisfies the tilt-surjectivity condition.

OMITTED api: TauCeti.DerivedDeRham.logRootCoverCech
Every completed Čech term is log QRSP.

OMITTED api: TauCeti.DerivedDeRham.logRootCoverUnfolding
General prelog log QRSP basis sheaves unfold by the corresponding Čech totalization, independently of the cover.

OMITTED test: TauCeti.DerivedDeRham.test_log_root_cover_trivial
With no monoid generators, the construction specializes to the ordinary ring compatible-root cover.

OMITTED test: TauCeti.DerivedDeRham.test_log_root_cover_coordinate
A free monoid coordinate x acquires compatible monoid roots and matching ring roots x^(1/p^n).

OMITTED test: TauCeti.DerivedDeRham.test_log_root_cover_finite
One finite root stage does not make the monoid p-divisible or the ring reduction semiperfect.
-/

end TauCeti.DerivedDeRham
