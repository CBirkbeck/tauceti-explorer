/-
This file is not the roadmap and is not exhaustive. The mathematical roadmap
in ../readmes/ExcursionOperatorsAndSpectralAction--ES0.md is definitive. These
statements suggest Lean names and signatures for contributors and reviewers.
All mathematical nodes retain implementationStatus = unchecked.

Pinned Mathlib already supplies CatCenter, its ring structure, evaluation,
naturality, and scalar map. They are imported, never redefined here.

The pins do not supply the enhanced stable Lambda-linear category, its
endomorphism spectrum, condensed action anima, stacky Perf, or animation
interfaces requested from E5/HS/LP. Full signatures depending on those types
are explicitly recorded below as OMITTED HIGHER SIGNATURES. Their exact
mathematical statements are copied into named comments from the packet. No
True conclusion, arbitrary Prop-valued structure field, or ordinary-category
alias is used to pretend that the missing enhanced construction exists.

This is a partial revision checkpoint. The declarations below express ordinary
observations and the generic pretriangulated support theorem. In particular,
ordinary quotient-action triviality is not a substitute for coherent enhanced
equivariant descent. The orbit
factorization uses actual functors and natural isomorphisms, while its higher
coherence remains an omitted condition. EllipticCentralizerFinite below is
only the finite-quotient part of ellipticity, not its semisimplicity condition.
-/

import Mathlib.CategoryTheory.Center.Linear
import Mathlib.CategoryTheory.Preadditive.AdditiveFunctor
import Mathlib.CategoryTheory.Linear.LinearFunctor
import Mathlib.RingTheory.Spectrum.Prime.Basic
import Mathlib.RingTheory.Spectrum.Prime.RingHom
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.GroupTheory.QuotientGroup.Defs
import Mathlib.CategoryTheory.Triangulated.Pretriangulated
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Algebra.DualNumber

open CategoryTheory
open scoped IsMulCommutative

namespace TauCetiBlueprint.Excursion

universe u v w

section Operators
variable {C : Type u} [Category.{v} C]

/-- The ordinary component of the enhanced creation–Weil–annihilation composite.
The input arrows are supplied by the actual Hecke/fusion construction. -/
def bunExcursionOperator (T : C ⥤ C) (creation : 𝟭 C ⟶ T)
    (weil : T ⟶ T) (annihilation : T ⟶ 𝟭 C) : CatCenter C :=
  creation ≫ weil ≫ annihilation

lemma bunExcursionOperator_app (T : C ⥤ C) (a : 𝟭 C ⟶ T)
    (g : T ⟶ T) (b : T ⟶ 𝟭 C) (X : C) :
    (bunExcursionOperator T a g b).app X = a.app X ≫ g.app X ≫ b.app X := by
  sorry

lemma bunExcursionOperator_naturality (T : C ⥤ C) (a : 𝟭 C ⟶ T)
    (g : T ⟶ T) (b : T ⟶ 𝟭 C) {X Y : C} (f : X ⟶ Y) :
    f ≫ (bunExcursionOperator T a g b).app Y =
      (bunExcursionOperator T a g b).app X ≫ f := by
  sorry

-- excursion_trivial_rep
example : bunExcursionOperator (𝟭 C) (𝟙 _) (𝟙 _) (𝟙 _) = 1 := by
  sorry

-- excursion_identity_tuple: no automatic identity assertion for beta alpha.
example (T : C ⥤ C) (a : 𝟭 C ⟶ T) (b : T ⟶ 𝟭 C) :
    bunExcursionOperator T a (𝟙 T) b = a ≫ b := by
  sorry

end Operators

section HeckeCenter
variable {C : Type u} [Category.{v} C] [Preadditive C]
variable {J : Type w} (T : J → C ⥤ C) [∀ j, (T j).Additive]

/-- Ordinary projection of the Hecke-compatible subalgebra; the packet also
requires coherent compatibility in the enhanced category. -/
def heckeCenter : Subring (CatCenter C) where
  carrier := {z | ∀ j X, z.app ((T j).obj X) = (T j).map (z.app X)}
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  mul_mem' := by sorry
  neg_mem' := by sorry

lemma heckeCenter_mem (z : CatCenter C) : z ∈ heckeCenter T ↔
    ∀ j X, z.app ((T j).obj X) = (T j).map (z.app X) := by
  sorry

lemma heckeCenter_inclusion : Function.Injective (heckeCenter T).subtype := by
  sorry

lemma heckeCenter_comp (z : CatCenter C) (F G : C ⥤ C)
    (hF : ∀ X, z.app (F.obj X) = F.map (z.app X))
    (hG : ∀ X, z.app (G.obj X) = G.map (z.app X)) :
    ∀ X, z.app ((F ⋙ G).obj X) = (F ⋙ G).map (z.app X) := by
  sorry

-- heckeCenter_identity
example : heckeCenter (fun _ : Unit => 𝟭 C) = ⊤ := by
  sorry

end HeckeCenter

section Scalars
variable (R : Type w) [CommRing R]
variable {C : Type u} [Category.{v} C] [Preadditive C] [Linear R C]

lemma heckeCenter_scalars {J : Type*} (T : J → C ⥤ C)
    [∀ j, (T j).Additive] [∀ j, Functor.Linear R (T j)] (r : R) :
    Linear.toCatCenter R C r ∈ heckeCenter T := by
  sorry

-- center_scalar_eval / heckeCenter_scalar
example (r : R) (X : C) : (Linear.toCatCenter R C r).app X = r • 𝟙 X := by
  sorry

end Scalars

section OrbitSupport
variable {D : Type u} [Category.{v} D]
variable {C : Type w} [Category C]
variable {P : Type*} (Piece : P → Type*) [∀ p, Category (Piece p)]
variable (restrict : ∀ p, D ⥤ Piece p) (orbit : C → D ⥤ C)

/-- Exact objectwise orbit factorization, viewed in ordinary categories.
Exactness of the functors and higher coherent equivalences require E5. -/
def compactlySupportedAction : Prop :=
  ∀ X, ∃ p, ∃ F : Piece p ⥤ C, Nonempty (restrict p ⋙ F ≅ orbit X)

lemma compactAction_factor :
    compactlySupportedAction Piece restrict orbit ↔
      ∀ X, ∃ p, ∃ F : Piece p ⥤ C, Nonempty (restrict p ⋙ F ≅ orbit X) := by
  sorry

lemma compactAction_refine (p p' : P) (F : Piece p ⥤ C)
    (r : Piece p' ⥤ Piece p) (e : restrict p' ⋙ r ≅ restrict p) (X : C)
    (h : restrict p ⋙ F ≅ orbit X) :
    Nonempty (restrict p' ⋙ (r ⋙ F) ≅ orbit X) := by
  sorry

-- compactAction_single_piece: actual quantifier order, forall X exists p.
example (p : P) (F : C → Piece p ⥤ C)
    (e : ∀ X, restrict p ⋙ F X ≅ orbit X) :
    compactlySupportedAction Piece restrict orbit := by
  sorry

end OrbitSupport

section Evaluation
variable {D R P : Type*} [Category D] [Category R] [Category P]

/-- Ordinary observation of pulling back a representation bundle along a
supplied universal-evaluation map. Stacky Perf and finite-leg coherence are
not reconstructed in this file. -/
def universalHeckeFamily (evaluation : D ⥤ R) (bundle : R ⥤ P) : D ⥤ P :=
  evaluation ⋙ bundle

lemma universalHecke_eval (evaluation : D ⥤ R) (bundle : R ⥤ P) (X : D) :
    (universalHeckeFamily evaluation bundle).obj X = bundle.obj (evaluation.obj X) := by
  sorry

noncomputable def universalHecke_pullback {D' : Type*} [Category D'] (f : D' ⥤ D)
    (evaluation : D ⥤ R) (bundle : R ⥤ P) :
    f ⋙ universalHeckeFamily evaluation bundle ≅
      universalHeckeFamily (f ⋙ evaluation) bundle := by
  sorry

-- universalHecke_point: pullback along identity does not alter the bundle.
example (bundle : R ⥤ P) : universalHeckeFamily (𝟭 R) bundle ≅ bundle := by
  sorry

end Evaluation

section WildActions
variable {C : Type*} [Category C]
variable {W : Type*} [Group W] {J : Type*}
variable (T : J → C ⥤ C) (rho : ∀ j X, W →* End ((T j).obj X))

/-- The ordinary triviality observation of finite-wild descent. The full
finiteWildCategory signature uses enhanced quotient-equivariant objects. -/
def finiteWildObservation (P : Subgroup W) (X : C) : Prop :=
  ∀ j g, g ∈ P → rho j X g = 1

lemma finiteWild_mem (P : Subgroup W) (X : C) :
    finiteWildObservation T rho P X ↔ ∀ j g, g ∈ P → rho j X g = 1 := by
  sorry

lemma finiteWild_inclusion (P' P : Subgroup W) (h : P' ≤ P) (X : C)
    (hX : finiteWildObservation T rho P X) :
    finiteWildObservation T rho P' X := by
  sorry

lemma finiteWild_refine_comp (P'' P' P : Subgroup W)
    (h1 : P'' ≤ P') (h2 : P' ≤ P) (X : C)
    (hX : finiteWildObservation T rho P X) :
    finiteWildObservation T rho P'' X := by
  sorry

end WildActions

section Stratum
variable {M C : Type*} [Category M] [Category C]

/-- The ordinary image of the supplied compact-induced Whittaker module under
its specified extension-by-zero functor. SR owns the datum and induction. -/
def whittakerSheaf (j : M ⥤ C) (inducedWhittaker : M) : C :=
  j.obj inducedWhittaker

noncomputable def whittakerSheaf_restrict (j : M ⥤ C) (r : C ⥤ M)
    (e : j ⋙ r ≅ 𝟭 M) (W : M) : r.obj (whittakerSheaf j W) ≅ W := by
  sorry

noncomputable def whittakerSheaf_datum_iso (j : M ⥤ C) {W W' : M} (e : W ≅ W') :
    whittakerSheaf j W ≅ whittakerSheaf j W' := by
  sorry

-- whittakerSheaf_stratum
example (j : M ⥤ C) (r : C ⥤ M) (e : j ⋙ r ≅ 𝟭 M) (W : M) :
    r.obj (whittakerSheaf j W) ≅ W := by
  sorry

end Stratum

section CentralSupport
variable {R : Type w} [CommRing R]
variable {C : Type u} [Category.{v} C] [Preadditive C]

/-- Evaluation of the imported ordinary center, with its existing ring laws. -/
def centerEvaluation (X : C) : CatCenter C →+* End X where
  toFun z := z.app X
  map_one' := by sorry
  map_mul' := by sorry
  map_zero' := by sorry
  map_add' := by sorry

/-- Kernel of the actual evaluated central ring action. -/
def centralAnnihilator (a : R →+* CatCenter C) (X : C) : Ideal R :=
  RingHom.ker ((centerEvaluation X).comp a)

/-- Reduced central support in Spec R, distinct from stack singular support. -/
def centralSupport (a : R →+* CatCenter C) (X : C) : Set (PrimeSpectrum R) :=
  PrimeSpectrum.zeroLocus (centralAnnihilator a X : Set R)

lemma centralAnnihilator_mem (a : R →+* CatCenter C) (X : C) (r : R) :
    r ∈ centralAnnihilator a X ↔ (a r).app X = 0 := by
  sorry

lemma centralSupport_mem (a : R →+* CatCenter C) (X : C) (x : PrimeSpectrum R) :
    x ∈ centralSupport a X ↔ centralAnnihilator a X ≤ x.asIdeal := by
  sorry

lemma centralSupport_iso (a : R →+* CatCenter C) {X Y : C} (e : X ≅ Y) :
    centralSupport a X = centralSupport a Y := by
  sorry

-- centralSupport_zero: a zero object is expressed by id_X=0 in a preadditive category.
example (a : R →+* CatCenter C) (X : C) (h : 𝟙 X = 0) :
    centralSupport a X = ∅ := by
  sorry

-- The faithful-action support criterion.
example (a : R →+* CatCenter C) (X : C)
    (h : Function.Injective ((centerEvaluation X).comp a)) :
    centralSupport a X = Set.univ := by
  sorry

lemma centralSupport_retract (a : R →+* CatCenter C) {X Y : C}
    (i : X ⟶ Y) (r : Y ⟶ X) (h : i ≫ r = 𝟙 X) :
    centralSupport a X ⊆ centralSupport a Y := by
  sorry

/-- The zero-locus step, separate from the distinguished-triangle theorem below. -/
lemma support_of_annihilator_product (I J K : Ideal R) (h : I * K ≤ J) :
    PrimeSpectrum.zeroLocus (J : Set R) ⊆
      PrimeSpectrum.zeroLocus (I : Set R) ∪ PrimeSpectrum.zeroLocus (K : Set R) := by
  sorry

end CentralSupport

section ExactSupport
open CategoryTheory.Limits CategoryTheory.Pretriangulated
variable {R : Type w} [CommRing R]
variable {C : Type u} [Category.{v} C] [Preadditive C]

lemma centralAnnihilator_biprod (a : R →+* CatCenter C) (X Y : C)
    [HasBinaryBiproduct X Y] :
    centralAnnihilator a (X ⊞ Y) = centralAnnihilator a X ⊓ centralAnnihilator a Y := by
  sorry

lemma centralSupport_biprod (a : R →+* CatCenter C) (X Y : C)
    [HasBinaryBiproduct X Y] :
    centralSupport a (X ⊞ Y) = centralSupport a X ∪ centralSupport a Y := by
  sorry

variable [HasZeroObject C] [HasShift C ℤ]
variable [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C]

/-- A scalar killed on the first vertex factors through the third vertex.
This uses Hom exactness of a distinguished triangle, not an assumed ideal inclusion. -/
lemma centralAnnihilator_triangle_factor (a : R →+* CatCenter C)
    (T : Triangle C) (hT : T ∈ distTriang C) (f : R)
    (hf : f ∈ centralAnnihilator a T.obj₁) :
    ∃ g : T.obj₃ ⟶ T.obj₂, (a f).app T.obj₂ = T.mor₂ ≫ g := by
  sorry

lemma centralAnnihilator_triangle_mul (a : R →+* CatCenter C)
    (T : Triangle C) (hT : T ∈ distTriang C) :
    centralAnnihilator a T.obj₁ * centralAnnihilator a T.obj₃ ≤
      centralAnnihilator a T.obj₂ := by
  sorry

lemma centralSupport_shift (a : R →+* CatCenter C)
    (hshift : ∀ (r : R) (X : C) (n : ℤ),
      (a r).app (X⟦n⟧) = (shiftFunctor C n).map ((a r).app X))
    (X : C) (n : ℤ) : centralSupport a (X⟦n⟧) = centralSupport a X := by
  sorry

/-- The complete exact-operation statement on the homotopy-category input.
The central action and its suspension compatibility are actual mathematical data.
Its application to D_lis still requires the E5/HS enhanced comparison. -/
lemma support_exact_operations (a : R →+* CatCenter C)
    (hshift : ∀ (r : R) (X : C) (n : ℤ),
      (a r).app (X⟦n⟧) = (shiftFunctor C n).map ((a r).app X))
    [HasBinaryBiproducts C] :
    (∀ (X : C) (n : ℤ), centralSupport a (X⟦n⟧) = centralSupport a X) ∧
    (∀ X Y : C, centralSupport a (X ⊞ Y) = centralSupport a X ∪ centralSupport a Y) ∧
    (∀ (X Y : C) (i : X ⟶ Y) (r : Y ⟶ X), i ≫ r = 𝟙 X →
      centralSupport a X ⊆ centralSupport a Y) ∧
    (∀ (T : Triangle C), T ∈ distTriang C →
      centralSupport a T.obj₂ ⊆ centralSupport a T.obj₁ ∪ centralSupport a T.obj₃) ∧
    (∀ (T : Triangle C), T ∈ distTriang C →
      centralSupport a T.obj₁ ⊆ centralSupport a T.obj₂ ∪ centralSupport a T.obj₃) ∧
    (∀ (T : Triangle C), T ∈ distTriang C →
      centralSupport a T.obj₃ ⊆ centralSupport a T.obj₁ ∪ centralSupport a T.obj₂) := by
  sorry

-- support_triangle_zero_ends: distinguishes triangle support from a mere ideal lemma.
example (a : R →+* CatCenter C) (T : Triangle C) (hT : T ∈ distTriang C)
    (h₁ : 𝟙 T.obj₁ = 0) (h₃ : 𝟙 T.obj₃ = 0) :
    centralSupport a T.obj₂ = ∅ := by
  sorry

end ExactSupport

section SupportComparisons
variable {R S : Type*} [CommRing R] [CommRing S]
variable {C D : Type*} [Category C] [Category D] [Preadditive C] [Preadditive D]

/-- The compatible-action containment does not need flatness.
The stronger endomorphism tensor comparison remains a supplier-dependent signature. -/
lemma centralSupport_map (a : R →+* CatCenter C) (b : S →+* CatCenter D)
    (φ : R →+* S) (F : C ⥤ D) [F.Additive]
    (h : ∀ r X, (b (φ r)).app (F.obj X) = F.map ((a r).app X)) (X : C) :
    centralSupport b (F.obj X) ⊆ (PrimeSpectrum.comap φ) ⁻¹' centralSupport a X := by
  sorry

/-- The ring-theoretic half of localization; this does not construct a telescope. -/
lemma centralSupport_subset_principal_iff (a : R →+* CatCenter C) (X : C) (f : R) :
    centralSupport a X ⊆ PrimeSpectrum.zeroLocus ({f} : Set R) ↔
      ∃ n : ℕ, (a (f ^ n)).app X = 0 := by
  sorry

end SupportComparisons

section ModuleSupportExamples
variable (R : Type u) [CommRing R]

-- centralSupport_free: the concrete rank-one scalar module computation.
example : centralAnnihilator (Linear.toCatCenter R (ModuleCat R)) (ModuleCat.of R R) = ⊥ ∧
    centralSupport (Linear.toCatCenter R (ModuleCat R)) (ModuleCat.of R R) = Set.univ := by
  sorry

variable (k : Type u) [Field k]

-- centralSupport_nilpotent: degree-zero observation of k compact in Perf(k).
-- The scalar category is ModuleCat k; k is not asserted to be perfect over k[ε].
example :
    let a : DualNumber k →+* CatCenter (ModuleCat k) :=
      (Linear.toCatCenter k (ModuleCat k)).comp (TrivSqZeroExt.fstHom k k k).toRingHom
    centralAnnihilator a (ModuleCat.of k k) = Ideal.span ({DualNumber.eps} : Set (DualNumber k)) ∧
      centralSupport a (ModuleCat.of k k) = Set.univ := by
  sorry

end ModuleSupportExamples

section EllipticObservation
variable {H : Type*} [Group H] (S : Subgroup H) (Z : Subgroup S) [Z.Normal]

/-- Only the finite-quotient condition on the supplied centralizer points.
The omitted ellipticParameter signature must ALSO impose LP semisimplicity
and use the algebraic centralizer scheme of the actual twisted parameter. -/
def EllipticCentralizerFinite : Prop := Finite (S ⧸ Z)

-- ellipticParameter_torus: quotienting a group by itself leaves a finite quotient.
example : Finite (S ⧸ (⊤ : Subgroup S)) := by
  sorry

end EllipticObservation

end TauCetiBlueprint.Excursion

namespace TauCetiBlueprint.Excursion

section AdditionalCenterObservations
variable {C : Type*} [Category C] [Preadditive C]
variable {Z : Type*} [CommRing Z]

/-- Observable evaluation after the supplied enhanced-to-homotopy comparison.
It does not construct that comparison or assert it is an isomorphism. -/
def enhancedCenter_eval (comparison : Z →+* CatCenter C) (X : C) : Z →+* End X :=
  (centerEvaluation X).comp comparison

lemma enhancedCenter_naturality (comparison : Z →+* CatCenter C) (z : Z)
    {X Y : C} (f : X ⟶ Y) :
    f ≫ (enhancedCenter_eval comparison Y) z =
      (enhancedCenter_eval comparison X) z ≫ f := by
  sorry

lemma enhancedCenter_scalars {R : Type*} [CommRing R] [Linear R C]
    (comparison : Z →+* CatCenter C) (scalar : R →+* Z)
    (h : comparison.comp scalar = Linear.toCatCenter R C) (r : R) (X : C) :
    enhancedCenter_eval comparison X (scalar r) = r • 𝟙 X := by
  sorry

lemma centralSupport_idempotent {R : Type*} [CommRing R]
    (a : R →+* CatCenter C) (e : R) (he : e * e = e) (X Y : C)
    (hX : (a e).app X = 𝟙 X) (hY : (a e).app Y = 0) :
    centralSupport a X ⊆ PrimeSpectrum.zeroLocus ({1-e} : Set R) ∧
      centralSupport a Y ⊆ PrimeSpectrum.zeroLocus ({e} : Set R) := by
  sorry

-- Support of a prescribed principal square-zero annihilator.
example {R : Type*} [CommRing R] (a : R →+* CatCenter C)
    (X : C) (epsilon : R) (h : epsilon ^ 2 = 0)
    (hAnn : centralAnnihilator a X = Ideal.span ({epsilon} : Set R)) :
    centralSupport a X = Set.univ := by
  sorry

-- heckeCenter_product_switch: the coordinate calculation for the supplied
-- center k × k of Perf(k) × Perf(k). The full Perf identification awaits LP.
example {k : Type*} (x : k × k) : (x.2, x.1) = x ↔ x.1 = x.2 := by
  sorry

end AdditionalCenterObservations

end TauCetiBlueprint.Excursion

/-
FULL MATHEMATICAL SIGNATURE REGISTER

These names and full statements agree with the packet. A name with a declared
ordinary observation above still needs the higher conditions stated here.
All other higher signatures are explicitly OMITTED pending the supplier types.
Independent review REV-ExcursionOperatorsAndSpectralAction--ES0 records needs_changes:
this comment register is not the actual signatures required by PROTOCOL section 13.
The updated executable inventory and exact omissions are in the packet and revision handoff.
The generic support theorem now uses actual triangles and shift compatibility;
its application to the enhanced D_lis action still needs E5/HS supplier types.
The register is not a family of assumed propositions or formalized proofs.

ExcursionOperatorsAndSpectralAction:ES0/bernstein-center-of-a-category
Proposed declaration: enhancedCenter
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
For a Lambda-linear stable infinity-category C, define Z_enh(C) = pi_0
Map_Fun^ex_Lambda(C,C)(id_C,id_C), with addition from stability and multiplication from composition.
Its E_2 structure makes pi_0 a commutative Lambda-algebra. When C is condensed enriched, retain the
induced condensed endomorphism algebra. For D_lis use its given condensed enhancement and identify
the center of compact objects with that of Ind(C) through the colimit-preserving extension.
API enhancedCenter_eval (projection): Each object X has a Lambda-algebra map Z_enh(C) -> pi_0
End_C(X).
Ordinary observation declared above.
API enhancedCenter_scalars (structure): The scalar lambda evaluates to lambda times id_X at every X.
Ordinary observation declared above.
API enhancedCenter_ind (equivalence): Restriction from colimit-preserving natural endomorphisms on
Ind(C) to C is an equivalence of mapping objects, hence of degree-zero centers.
OMITTED HIGHER API SIGNATURE pending the supplier types.
API enhancedCenter_naturality (relation): For u:X->Y, u composed with z_X equals z_Y composed with
u, with the coherent enhanced naturality inherited from z.
Ordinary observation declared above.
Example center_scalar_eval (computation): For lambda in Lambda, evaluation of its scalar central
class on X is lambda id_X.
An ordinary observation is present above; the full supplier-dependent test remains as specified
here.
Example center_zero_category (degenerate): For the zero stable category the enhanced center is the
zero ring.
OMITTED HIGHER EXAMPLE SIGNATURE pending the supplier types.
Example center_module_category (characterisation): For C = Perf(A), A an ordinary commutative
Lambda-algebra, Z_enh(C) identifies with A through multiplication, and evaluation at A is that
identification.
OMITTED HIGHER EXAMPLE SIGNATURE pending the supplier types.

ExcursionOperatorsAndSpectralAction:ES0/enhanced-to-homotopy-center
Proposed declaration: enhanced_to_homotopy_center
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
Evaluation of an enhanced central class on objects induces a natural Lambda-algebra map Z_enh(C) ->
CatCenter(hC). It commutes with scalar maps and evaluation. No injectivity or surjectivity is
asserted for general stable C.

ExcursionOperatorsAndSpectralAction:ES0/excursion-datum-and-operator
Proposed declaration: bunExcursionOperator
Ordinary observation declared above; full enhanced conditions remain unavailable.
Apply the imported LP2 excursion-datum construction to the HS1/HS4 coherent Hecke family. For
D=(I,V,alpha,beta,gamma), with alpha:1->V restricted to diagonal H and beta:V restricted to diagonal
H->1, define S_D(A)=T_beta(A) composed with gamma acting on T_V(A) composed with T_alpha(A), using
fusion and T_1 = id. It is a coherent natural endomorphism of the identity on the relevant
finite-wild compact category.
API bunExcursionOperator_app (projection): The component on A is T_alpha(A), then gamma, then
T_beta(A), with the specified unit identifications.
Ordinary observation declared above.
API bunExcursionOperator_naturality (relation): For u:A->B, u followed by S_D(B) equals S_D(A)
followed by u.
Ordinary observation declared above.
API bunExcursionOperator_function (characterisation): Data with the same invariant function and Weil
tuple induce the same operator, by the imported LP2 independence theorem.
OMITTED HIGHER API SIGNATURE pending the supplier types.
API bunExcursionOperator_fusion (compatibility): Pulling legs together along a map I->J agrees with
HS4 fusion and the LP2 reindexing relation.
OMITTED HIGHER API SIGNATURE pending the supplier types.
Example excursion_trivial_rep (degenerate): For V=1 and alpha=beta=id, S_D=id for every Weil tuple.
An ordinary observation is present above; the full supplier-dependent test remains as specified
here.
Example excursion_identity_tuple (computation): If all gamma_i=1 then S_D=T_(beta alpha); in
particular a duality coevaluation/evaluation pair gives dim(V) id, rather than automatically id.
An ordinary observation is present above; the full supplier-dependent test remains as specified
here.
Example excursion_two_leg_trace (computation): For H=GL_n, V=std external tensor std-dual and its
usual creation/annihilation maps, evaluation on a parameter phi gives tr(phi(gamma_1)
phi(gamma_2)^(-1)).
OMITTED HIGHER EXAMPLE SIGNATURE pending the supplier types.
Example excursion_nonsplit (compatibility): On a nonsplit torus, the one-cocycle equation is
phi(uv)=phi(u) u(phi(v)); the construction uses twisted, rather than ordinary, conjugation.
OMITTED HIGHER EXAMPLE SIGNATURE pending the supplier types.

ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center
Proposed declaration: excursion_algebra_to_bernstein_center
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
For a finite-wild compact Hecke category D^P, the LP2 algebra Exc(W,H) tensor Lambda maps naturally
to Z_enh(D^P) by f_D,gamma |-> [S_D]. Its projection to CatCenter(hD^P) is the imported VIII.4.1
map. Coherent HS4 comparisons between enhanced natural transformations give equal classes in pi_0,
where the excursion algebra relations hold; no Perf action or good-prime hypothesis is needed.

ExcursionOperatorsAndSpectralAction:ES0/continuity-of-excursion-evaluations
Proposed declaration: continuity_of_excursion_evaluations
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
For every compact A and each fixed finite-leg invariant coefficient, the map (W_E/P)^I -> pi_0
End(A) given by the creation–Weil–annihilation operator is a map of condensed sets, whenever P is
the uniform cutoff of A. Evaluation along a Schur scalar identification is therefore continuous. The
full excursion algebra need not be canonically independent of discretization at bad primes.

ExcursionOperatorsAndSpectralAction:ES0/discretisation-of-the-weil-group
Proposed declaration: discretisation_of_the_weil_group
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
Two choices of tame discretization yield canonically identified cocycle schemes by restriction and
unique continuous extension. Their excursion evaluations on flat relatively discrete targets agree
through the ell-torsion-free quotient of Exc, which is independent of discretization. At good primes
(ell not dividing |pi_1(H)_tors|) or after inverting ell, Exc itself identifies with the invariant
algebra, so the corresponding comparison is an isomorphism. At other primes full-algebra
independence is not asserted; condensed operator evaluation and component idempotents remain
intrinsic.

ExcursionOperatorsAndSpectralAction:ES0:classical-center/map-to-the-classical-bernstein-center
Proposed declaration: map_to_the_classical_bernstein_center
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
For the fully faithful stratum embedding j_!:D(G(E),Lambda)->D_lis(Bun_G,Lambda), restrict an
enhanced central class to its essential image and transport it back to the enhanced derived smooth
category. Evaluation on degree-zero smooth representations gives a Lambda-algebra map to the
ordinary abelian Bernstein center Z(Sm_Lambda(G(E))). This last step uses t-exactness of the
identity transformation and SR.1’s abelian center; no general center-of-homotopy-category
isomorphism is used.

ExcursionOperatorsAndSpectralAction:ES0:classical-center/complex-block-comparison
Proposed declaration: complex_block_comparison
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
Choose an abstract field isomorphism iota:Qbar_ell ≃ C and transport smooth algebraic
representations by scalar extension along iota. This gives an equivalence of ordinary smooth
representation categories and hence an isomorphism of their CatCenter rings. Composing the Qbar_ell
excursion/center action with it gives SR.3’s complex blockwise action. The comparison depends on
iota; it does not transport the condensed Weil topology or provide an ell-independent block map.

ExcursionOperatorsAndSpectralAction:ES1/spectral-and-geometric-centers
Proposed declaration: heckeCenter
Ordinary observation declared above; full enhanced conditions remain unavailable.
Write Z_spec = Gamma([Z^1(W_E,H)_Lambda/H],O) and Z_geom = Z_enh(D_lis(Bun_G,Lambda)), using LP’s
function ring and ES0’s enhanced center. Define Z_geom,Hecke as the subalgebra of z such that z_(T_V
A)=T_V(z_A) for every finite I,V,A. The general geometric center need not satisfy this stronger
condition.
API heckeCenter_mem (characterisation): z lies in the Hecke-compatible subalgebra iff every T_V
carries z_A to z_(T_V A).
Ordinary observation declared above.
API heckeCenter_inclusion (coercion): The inclusion Z_geom,Hecke -> Z_geom is an injective
Lambda-algebra map.
Ordinary observation declared above.
API heckeCenter_scalars (structure): Every Lambda scalar lies in Z_geom,Hecke.
Ordinary observation declared above.
API heckeCenter_comp (relation): Compatibility with two functors implies compatibility with their
composite.
Ordinary observation declared above.
Example heckeCenter_identity (degenerate): For the family consisting only of the identity, the
compatible subalgebra is the whole center.
An ordinary observation is present above; the full supplier-dependent test remains as specified
here.
Example heckeCenter_product_switch (non-example): For C=Perf(k)×Perf(k) and the switching functor,
Z_geom=k×k while Z_geom,Hecke is the diagonal copy of k.
An ordinary observation is present above; the full supplier-dependent test remains as specified
here.
Example heckeCenter_scalar (computation): A scalar lambda has the same lambda id action before and
after every Lambda-linear T_V.
An ordinary observation is present above; the full supplier-dependent test remains as specified
here.

ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup
Proposed declaration: uniform_wild_subgroup
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
For every compact A in D_lis(Bun_G,Lambda), there is an open normal subgroup P of wild inertia,
contained in the kernel of W_E->Q, such that for every finite set I and every V in Rep((H semidirect
Q)^I), T_V(A) descends to an object equivariant for (W_E/P)^I. The subgroup depends on A and works
simultaneously for all I,V.

ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/component-decomposition
Proposed declaration: component_decomposition
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
For D^P consisting of compact A with the uniform P-Hecke cutoff, the enhanced excursion map and
LP2’s universal homeomorphism identify component idempotents. Splitting them gives D^P = direct
sum_c D^c over pi_0 Z^1(W_E/P,H)_Lambda. Taking the union over P gives the direct sum decomposition
of D_lis^omega by parameter components; its Ind-category is the product of the Ind(D^c). Every
compact has finitely many nonzero components. A Schur object has exactly one nonzero component.

ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/center-on-finite-wild-pieces
Proposed declaration: center_on_finite_wild_pieces
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
If P′⊂P are eligible wild subgroups, the inclusion D^P⊂D^P′ intertwines the excursion evaluation
maps through restriction of the universal parameter and the dense discretizations. In the
coefficient range of the invariant-ring comparison it also intertwines the spectral function
actions. The component summands consequently glue independently of choices. Every compact is
evaluated on some D^P; no common P for all Ind objects is required.

ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map
Proposed declaration: spectral_to_geometric_center_map
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
Assume |pi_0 Z(G)| is invertible in Lambda. There is a natural Lambda-algebra map Z_spec ->
Z_geom,Hecke -> Z_geom, compatible with component decomposition. On each compact A it factors
through functions on one sufficiently small finite-wild piece. This is IX.5.2, obtained from the
excursion map and the invariant-coordinate comparison. General Psi_G^b composites are imported from
ES7:parabolic rather than constructed again here.

ExcursionOperatorsAndSpectralAction:ES1:spectral-center/center-change-of-data
Proposed declaration: center_change_of_data
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
For an extension Lambda->Lambda′ in the eligible IX.5.2 range, the scalar-extended excursion
evaluation agrees with evaluation of the same coefficient after derived scalar extension of A and
the HS kernels. Therefore the two Z_spec actions agree via the LP coefficient map. A refinement of
the finite quotient Q inducing the same pinned W_E action yields the same diagram. Finite-wild
transition squares are those of ES1:finite-ramification. This asserts commutativity, not that
tensoring with Lambda′ commutes with all invariant rings.

ExcursionOperatorsAndSpectralAction:ES1:spectral-center/excursion-algebra-without-the-coefficient-condition
Proposed declaration: excursion_algebra_without_the_coefficient_condition
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
Without |pi_0 Z(G)| invertible, retain the enhanced excursion action on each D^P and its compatible
component idempotents. No Z_spec -> Z_geom map is asserted by this route. These operators suffice
for the characteristic-ell Schur parameter theorem of ES5 and for its operator-level compatibility
diagrams.

ExcursionOperatorsAndSpectralAction:ES2/compactly-supported-actions
Proposed declaration: compactlySupportedAction
Ordinary observation declared above; full enhanced conditions remain unavailable.
An action of Perf(Z/H) on a small stable category C is compactly supported if for each X in C, its
orbit functor M |-> Act_M(X) factors, up to coherent equivalence, through restriction
Perf(Z/H)->Perf(Z^1(W_E/P,H)/H) for some eligible P depending on X. This is a property of the action
and its orbit functors, not a choice of one subgroup for the entire category.
API compactAction_factor (characterisation): For each X there exist P, an exact orbit functor from
Perf(Z^P/H) and an equivalence of its composite with the original orbit functor.
Ordinary observation declared above.
API compactAction_refine (functoriality): A factorization through P induces one through every
smaller eligible P′ by restriction to the open-and-closed P piece.
Ordinary observation declared above.
API compactAction_finite_sum (compatibility): Finitely many compactly supported orbit functors have
a common refined cutoff; in an exact action the direct sum orbit functor has that cutoff.
OMITTED HIGHER API SIGNATURE pending the supplier types.
Example compactAction_zero (degenerate): The zero object orbit functor factors through every
eligible piece.
OMITTED HIGHER EXAMPLE SIGNATURE pending the supplier types.
Example compactAction_single_piece (characterisation): An action obtained by restriction from a
single finite-wild piece has compactly supported orbit functors for all objects.
An ordinary observation is present above; the full supplier-dependent test remains as specified
here.
Example compactAction_unbounded_family (non-example): For the direct sum of categories Perf(k),
indexed by parameters with unbounded wild conductor, finite-support objects have cutoffs but no one
cutoff works for every object; its Ind product also has objects with no cutoff.
OMITTED HIGHER EXAMPLE SIGNATURE pending the supplier types.

ExcursionOperatorsAndSpectralAction:ES2/universal-parameter-hecke-family
Proposed declaration: universalHeckeFamily
Ordinary observation declared above; full enhanced conditions remain unavailable.
For H reductive over a characteristic-zero field L with finite Q action, and an anima S->BQ,
evaluation S×Map_(BQ)(S,B(H semidirect Q))->B(H semidirect Q) produces, functorially in finite I, an
exact Rep_L(Q^I)-linear monoidal functor Rep_L((H semidirect Q)^I)->Perf(Map_(BQ)(S,B(H semidirect
Q)))^(S^I). Composition with an action yields its coherent Hecke family.
API universalHecke_eval (projection): At (s,rho), the representation bundle is V evaluated on
rho(s).
Ordinary observation declared above.
API universalHecke_unit (simp): The trivial representation produces the monoidal unit family.
OMITTED HIGHER API SIGNATURE pending the supplier types.
API universalHecke_fusion (compatibility): The universal evaluation families intertwine tensoring
legs along every finite-set map.
OMITTED HIGHER API SIGNATURE pending the supplier types.
API universalHecke_pullback (functoriality): For S′->S over BQ the families agree under restriction
of the universal parameter.
Ordinary observation declared above.
Example universalHecke_empty (degenerate): The empty-leg family is the tensor unit.
OMITTED HIGHER EXAMPLE SIGNATURE pending the supplier types.
Example universalHecke_point (compatibility): For Q=1 and S a point, the family is the tautological
representation bundle on BH.
An ordinary observation is present above; the full supplier-dependent test remains as specified
here.
Example universalHecke_free_loop (computation): For S=BF_1 with generator mapping to sigma in Q, the
family on [H/H]_sigma has generator action h sigma on the representation, with twisted conjugation.
OMITTED HIGHER EXAMPLE SIGNATURE pending the supplier types.

ExcursionOperatorsAndSpectralAction:ES2/universal-action-theorem
Proposed declaration: universal_action_theorem
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
For H reductive over a characteristic-zero field L with finite Q action, S any anima over BQ and C
small idempotent-complete stable L-linear, the anima of L-linear actions of Perf(Map_(BQ)(S,B(H
semidirect Q))) on C is equivalent to the anima of coherent finite-set exact Rep_L(Q^I)-linear
monoidal families Rep_L((H semidirect Q)^I)->End_L(C)^(S^I). The forward map is universal
evaluation; both composites are equivalent to the identity as maps of anima.

ExcursionOperatorsAndSpectralAction:ES2/mapping-stack-commutes-with-sifted-colimits
Proposed declaration: mapping_stack_commutes_with_sifted_colimits
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
For the rational H,Q hypotheses, F(S)=Perf(Map_(BQ)(S,B(H semidirect Q))) preserves sifted colimits
as a functor to L-linear small idempotent-complete stable infinity-categories, and preserves all
colimits as a functor to symmetric monoidal such categories.

ExcursionOperatorsAndSpectralAction:ES2/pushout-of-affine-quotients
Proposed declaration: pushout_of_affine_quotients
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
Let G be a pro-reductive affine group over a characteristic-zero field L acting on affine derived
L-schemes X_0,X_1,X_2, with G-equivariant maps X_1->X_0<-X_2. The natural symmetric monoidal
comparison Perf(X_1/G) tensor_(Perf(X_0/G)) Perf(X_2/G) -> Perf((X_1 times^derived_(X_0) X_2)/G) is
an equivalence. The tensor product is the pushout in L-linear symmetric monoidal small stable
idempotent-complete infinity-categories.

ExcursionOperatorsAndSpectralAction:ES2/spectral-action-rational
Proposed declaration: spectral_action_rational
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
For any field L over Q_ell(sqrt(q)), the coherent HS4 Hecke family gives a natural compactly
supported L-linear action of Perf([Z^1(W_E,H)_L/H]) on D_lis(Bun_G,L)^omega, uniquely characterized
as coherent data by its restriction along the universal representation families being the HS Hecke
action.

ExcursionOperatorsAndSpectralAction:ES2/degree-zero-center-agreement
Proposed declaration: degree_zero_center_agreement
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
In the rational coefficient range, the map from degree-zero functions on the parameter stack to
Z_enh(D_lis) induced by the spectral action equals the IX.5.2 spectral-center map. Pulling
representation bundles along universal evaluation recovers exactly the normalized Satake/Hecke
operations, including the chosen square root of q.

ExcursionOperatorsAndSpectralAction:ES3/sifted-colimit-approximation
Proposed declaration: perfApprox
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
Over a discrete valuation ring R and a split reductive H/R with finite Q action, let F^natural be
the sifted-colimit-preserving extension to anima/BQ of the restriction S |-> Perf(Map_(BQ)(S,B(H
semidirect Q))) on finite sets with Q-torsors. There is a canonical comparison
kappa_S:F^natural(S)->F(S). This is a categorical approximation, not an asserted new mapping scheme,
and need not equal F(S) integrally.
API perfApprox_finite (equivalence): For S a finite Q-torsor set, kappa_S is the prescribed
identification with F(S).
OMITTED HIGHER API SIGNATURE pending the supplier types.
API perfApprox_compare (projection): kappa is a natural symmetric monoidal comparison to actual
mapping-stack Perf.
OMITTED HIGHER API SIGNATURE pending the supplier types.
API perfApprox_lift (universal-property): For a sifted-colimit-preserving target functor,
transformations out of F^natural are uniquely determined as anima by their restriction to finite
Q-torsor sets.
OMITTED HIGHER API SIGNATURE pending the supplier types.
API perfApprox_evaluation (compatibility): Universal representation evaluation extends by animation
and recovers its finite-set version.
OMITTED HIGHER API SIGNATURE pending the supplier types.
Example perfApprox_empty (degenerate): At the empty anima, F^natural is Perf(R), the monoidal unit
category.
OMITTED HIGHER EXAMPLE SIGNATURE pending the supplier types.
Example perfApprox_point (compatibility): For Q=1 and S a point, kappa identifies F^natural(S) with
Perf(BH).
OMITTED HIGHER EXAMPLE SIGNATURE pending the supplier types.
Example perfApprox_rational (characterisation): After the valid characteristic-zero scalar
extension, the approximation agrees with actual mapping-stack Perf by X.1.2.
OMITTED HIGHER EXAMPLE SIGNATURE pending the supplier types.

ExcursionOperatorsAndSpectralAction:ES3/integral-universal-action
Proposed declaration: integral_universal_action
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
For the DVR H,Q,S hypotheses of F^natural and C small stable idempotent-complete R-linear, the anima
of R-linear F^natural(S)-actions on C is equivalent to the anima of coherent finite-set exact
Rep_R(Q^I)-linear monoidal families Rep_R((H semidirect Q)^I)->End_R(C)^(S^I). Evaluation is defined
on finite sets and then animated. No good-prime hypothesis is needed for this approximation theorem.

ExcursionOperatorsAndSpectralAction:ES3/approximation-commutes-with-colimits
Proposed declaration: approximation_commutes_with_colimits
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
F^natural preserves all colimits from anima/BQ to R-linear symmetric monoidal small stable
idempotent-complete infinity-categories. In addition to its defining sifted-colimit property, the
required finite coproduct comparison is Perf(BH^S1) tensor_Perf(R) Perf(BH^S2) ≃ Perf(BH^(S1
disjoint union S2)).

ExcursionOperatorsAndSpectralAction:ES3/free-group-case
Proposed declaration: free_group_case
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
For S=BF_n->BQ with generator images sigma_1,...,sigma_n, kappa_S is fully faithful with image the
thick idempotent-complete stable subcategory generated by Rep_R(H). The actual mapping quotient is
[H^n/H] with h acting by (g_i |-> h g_i sigma_i(h)^(-1)); F^natural(BF_n) identifies with compact
modules over O(H^n) in IndPerf(BH) with that twisted action. No assertion that this image is all
actual Perf is made without the generation input named in its prerequisites.

ExcursionOperatorsAndSpectralAction:ES3/discrete-group-presentation
Proposed declaration: discrete_group_presentation
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
For a discrete group Gamma->Q, present BGamma as the sifted colimit of BF_n over homomorphisms
F_n->Gamma in anima/BQ. Then F^natural(BGamma) is the category of compact modules over
colim_(n,F_n->Gamma) O(H^n) in IndPerf(BH), with the generator twists induced by Gamma->Q.

ExcursionOperatorsAndSpectralAction:ES3/discrete-integral-spectral-action
Proposed declaration: discrete_integral_spectral_action
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
Let Lambda be the integers of a finite extension of Q_ell(sqrt(q)), and ell not divide
|pi_1(H)_tors|. For the discrete tame W with its pinned map to Q, kappa_BW identifies F^natural(BW)
with Perf([Z^1(W,H)_Lambda/H]). Consequently its action anima is equivalent to the coherent
finite-set Hecke-data anima of X.0.2.

ExcursionOperatorsAndSpectralAction:ES3/integral-spectral-action
Proposed declaration: integral_spectral_action
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
Under the X.0.1 coefficient hypotheses (Lambda the integers of a finite extension of Q_ell(sqrt(q)),
ell != p and ell not dividing |pi_1(H)_tors|), the anima of compactly supported
Perf([Z^1(W_E,H)_Lambda/H])-actions on a small idempotent-complete stable Lambda-linear C is
equivalent to its coherent continuous Weil-equivariant finite-set Hecke-data anima. Applied to HS4
on C=D_lis(Bun_G,Lambda)^omega, it constructs the integral spectral action. The rational variant
holds for all ell != p.

ExcursionOperatorsAndSpectralAction:ES3/action-change-of-data
Proposed declaration: action_change_of_data
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
For the integral action, extension of DVR coefficient rings satisfying X.0.1, refinement of the
finite pinned quotient, and shrinking finite-wild cutoffs induce the corresponding comparison
functors. Whenever the LP stack/Perf base-change and HS kernel comparison functors are supplied, the
two actions are coherently equivalent because their universal representation families coincide.
These comparisons satisfy identity, composition and pairwise commutation. The induced degree-zero
function action agrees with IX.5.2 in its eligible center range.

ExcursionOperatorsAndSpectralAction:ES3/derived-reduction-and-rationalization
Proposed declaration: derived_reduction_and_rationalization
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
Let the integral action be given. For a coefficient map Lambda->B and the supplied relative
tensor-product category C_B and pullback functor Perf(Z_Lambda/H)->Perf(Z_B/H), when the stacky Perf
scalar-extension comparison is an equivalence, tensoring the action constructs a B-linear action on
C_B that induces the scalar-extended HS family. This includes rationalization and, with the supplied
derived reduction/Perf comparisons, B=Lambda/ell. It does not assert X.0.1 anew for arbitrary B or
identify C_B with the geometric D_lis(Bun_G,B) without its supplier comparison.

ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/finite-wild-Hecke-category
Proposed declaration: finiteWildCategory
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
For eligible P, define D^P as the full subcategory of compact D_lis objects A such that every
T_V(A), for every finite I and V, belongs to the fully faithful image of quotient-equivariant
objects for (W_E/P)^I. The image condition uses the enhanced equivariant functor category, including
its homotopies. If P′⊂P then D^P⊂D^P′.
API finiteWild_mem (characterisation): Membership means simultaneous descent of all I,V Hecke images
through (W_E/P)^I.
Ordinary observation declared above.
API finiteWild_inclusion (functoriality): For P′⊂P the full inclusion D^P->D^P′ is exact and fully
faithful.
Ordinary observation declared above.
API finiteWild_stable (structure): D^P is closed under zero, shifts, cofibers and retracts.
OMITTED HIGHER API SIGNATURE pending the supplier types.
API finiteWild_refine_comp (relation): The inclusions for P″⊂P′⊂P compose to the inclusion for P″⊂P.
Ordinary observation declared above.
Example finiteWild_zero (degenerate): The zero compact object lies in D^P for every eligible P.
OMITTED HIGHER EXAMPLE SIGNATURE pending the supplier types.
Example finiteWild_tensor_generator (characterisation): Trivial P action on the single-leg tensor
generator implies membership in D^P by the IX.5.1 tensor/exterior-tensor argument.
OMITTED HIGHER EXAMPLE SIGNATURE pending the supplier types.
Example finiteWild_regular_action (non-example): For a nontrivial finite wild quotient F acting on
its regular representation over coefficients with p invertible, an element of P with nontrivial
image in F does not act trivially; such an equivariant orbit does not descend through W_E/P.
OMITTED HIGHER EXAMPLE SIGNATURE pending the supplier types.

ExcursionOperatorsAndSpectralAction:ES2/whittaker-sheaf
Proposed declaration: whittakerSheaf
Ordinary observation declared above; full enhanced conditions remain unavailable.
For G quasisplit with a specified Whittaker datum (B,U,psi) imported from SR, define W_psi=j_!
[c-Ind_(U(E))^(G(E)) psi] in D_lis(Bun_G,Lambda), supported on the open trivial stratum Bun_G^1.
Compact induction means support compact modulo the closed unipotent subgroup, not induction from a
compact open subgroup. The construction alone does not assert compactness of W_psi or categorical
LLC.
API whittakerSheaf_restrict (projection): Restriction to Bun_G^1 is c-Ind_U(E)^G(E) psi via the
smooth-stratum equivalence.
Ordinary observation declared above.
API whittakerSheaf_support (characterisation): Its restriction to the complement of the trivial
stratum is zero.
OMITTED HIGHER API SIGNATURE pending the supplier types.
API whittakerSheaf_datum_iso (functoriality): An isomorphism of the imported Whittaker data inducing
the SR compact-induction intertwiner yields the corresponding sheaf isomorphism.
Ordinary observation declared above.
API whittakerSheaf_ind_action (compatibility): The colimit-preserving extension of an eligible
compact spectral action acts on W_psi; no compactness assertion is needed.
OMITTED HIGHER API SIGNATURE pending the supplier types.
Example whittakerSheaf_torus (computation): For a torus U=1 and psi=1, W_psi is extension by zero of
the regular compactly supported smooth function representation c-Ind_1^T(E) Lambda, not the
one-dimensional trivial representation.
OMITTED HIGHER EXAMPLE SIGNATURE pending the supplier types.
Example whittakerSheaf_trivial_group (degenerate): For G=1, W_psi is the constant rank-one Lambda
object on its unique stratum.
OMITTED HIGHER EXAMPLE SIGNATURE pending the supplier types.
Example whittakerSheaf_stratum (compatibility): Applying j^* to W_psi returns exactly the SR compact
induction, including its right-translation convention.
An ordinary observation is present above; the full supplier-dependent test remains as specified
here.

ExcursionOperatorsAndSpectralAction:ES4/finite-wild-central-support
Proposed declaration: centralSupport
Ordinary observation declared above; full enhanced conditions remain unavailable.
For a compact A with eligible cutoff P in the invariant-coordinate range, let
R_P=Gamma([Z^1(W_E/P,H)_Lambda/H],O) act through the center. Define Ann_P(A)={f in R_P : f_A=0 in
pi_0 End(A)} and Supp_P(A)=V(Ann_P(A)) in Spec R_P. This is reduced support on the affine invariant
quotient, not support in the full derived stack and not nilpotent singular support. A smaller cutoff
compares these supports by the open-and-closed parameter embedding and the compatible center action.
API centralAnnihilator_mem (characterisation): f belongs to Ann_P(A) iff the central endomorphism
f_A is zero.
Ordinary observation declared above.
API centralSupport_mem (characterisation): x belongs to Supp_P(A) iff Ann_P(A) is contained in the
prime ideal x.
Ordinary observation declared above.
API centralSupport_iso (functoriality): Isomorphic objects have the same annihilator ideal and
support.
Ordinary observation declared above.
API centralSupport_idempotent (compatibility): For an idempotent e, support of the e-summand lies in
the clopen locus where e=1, and support of the (1-e)-summand lies where e=0.
Ordinary observation declared above.
Example centralSupport_zero (degenerate): The zero object has annihilator R_P and empty support.
An ordinary observation is present above; the full supplier-dependent test remains as specified
here.
Example centralSupport_free (computation): For C=Perf(R_P) with its scalar action, the rank-one
module R_P has annihilator zero and support all Spec R_P.
An ordinary observation is present above; the full supplier-dependent test remains as specified
here.
Example centralSupport_nilpotent (computation): For R=k[epsilon]/(epsilon^2), take C=Perf(k) with its R-linear action through R->k and A=k, which is
compact in C. Then Ann_R(A)=(epsilon) but Supp_R(A)=Spec R as an underlying set; the support does
not retain the nilpotent thickening. Do not take k to be a perfect R-module.
An ordinary observation is present above; the full supplier-dependent test remains as specified
here.

ExcursionOperatorsAndSpectralAction:ES4/support-exact-operations
Proposed declaration: support_exact_operations
The full generic pretriangulated statement is declared above;
its D_lis enhanced instantiation remains pending.
For the fixed central R_P action, support is invariant under isomorphism and shifts, support of a
finite direct sum is the union, and a retract has support contained in that of its source. For an
exact triangle A->B->C->A[1], Supp(B)⊂Supp(A) union Supp(C), and the cyclic variants hold.
Algebraically Ann(A) Ann(C)⊂Ann(B), rather than an assertion that Ann(A) intersect Ann(C)
annihilates B.

ExcursionOperatorsAndSpectralAction:ES4/support-coefficient-change
Proposed declaration: support_coefficient_change
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
Given compatible central actions for a ring map R->S and an exact scalar-extension functor A |->
A_S, the ideal Ann_R(A)S annihilates A_S, hence Supp_S(A_S) is contained in the inverse image of
Supp_R(A). If S is flat over R and the natural degree-zero endomorphism base-change map End(A)
tensor_R S -> End(A_S) is an isomorphism carrying id_A to id_(A_S), then Ann_S(A_S)=Ann_R(A)S and
the support containment is equality. In the derived nonflat case only the compatible-action
containment is asserted.

ExcursionOperatorsAndSpectralAction:ES4/central-localization
Proposed declaration: central_localization
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
For a small idempotent-complete stable R-linear action category C and f in R, localize Ind(C) at the
telescope of multiplication by f and take compact objects, with the necessary idempotent completion.
A compact A maps to zero iff f^n id_A=0 for some n, equivalently Supp_R(A)⊂V(f). The localized
center action sends f to an invertible transformation. For idempotent e the localization is the
e-summand already supplied by component decomposition. This does not identify arbitrary closed
substacks with a category of sheaves on them.

ExcursionOperatorsAndSpectralAction:ES4/duality-and-the-chevalley-involution
Proposed declaration: duality_and_the_chevalley_involution
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
In the eligible center range, Bernstein–Zelevinsky duality induces D_geom on the enhanced geometric
center. The pinned Chevalley involution induces D_spec on the spectral center. The square D_geom
composed with Z_spec->Z_geom equals Z_spec->Z_geom composed with D_spec commutes. The inner
correction by rho-hat(-1) in VI.12.1 disappears on the conjugation quotient. This proves the center
diagram; general smooth-dual parameter compatibility imports the ES7 parabolic return.

ExcursionOperatorsAndSpectralAction:ES4/local-shtuka-excursion-compatibility
Proposed declaration: local_shtuka_excursion_compatibility
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
For HS3’s local-shtuka complex identified as i_b^* T_V(j_! c-Ind_K^G(E) Lambda), with the stated
normalization and K pro-p for compactness, transport the ES0 excursion operators through that
comparison. At each level they commute with the smooth G_b(E) action, and under the tower’s Hecke
transition correspondences they commute with the G(E) action on the tower colimit. Their products
commute with each other by the excursion algebra, and their Weil action retains the HS3 continuity.
No assertion of one finite-wild cutoff for the noncompact tower colimit is made.

ExcursionOperatorsAndSpectralAction:ES4/elliptic-parameters-and-components
Proposed declaration: ellipticParameter
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
For an algebraically closed characteristic-zero coefficient field L, a continuous parameter phi with
the prescribed pinned Weil projection is elliptic if it is semisimple and S_phi/Z(H)^Gamma is
finite, where S_phi is the H-centralizer of the full twisted parameter. The centralizer is a group
scheme; quotienting the centralizer by the fixed center removes the central stabilizer from the
finiteness test. Unramified central twists still vary the parameter in its connected component. The
connected-component assertion is a separate theorem.
API ellipticParameter_iff (characterisation): Ellipticity means semisimplicity and finiteness of the
specified centralizer quotient.
OMITTED HIGHER API SIGNATURE pending the supplier types.
API ellipticParameter_conjugate (functoriality): Conjugation of phi identifies its centralizer
quotient and preserves ellipticity.
OMITTED HIGHER API SIGNATURE pending the supplier types.
API ellipticParameter_central_twist (compatibility): An eligible unramified central twist has the
same centralizer and preserves ellipticity.
OMITTED HIGHER API SIGNATURE pending the supplier types.
Example ellipticParameter_torus (computation): For a torus with its pinned Weil action,
S_phi=H^Gamma, so every semisimple parameter has trivial centralizer quotient and is elliptic.
An ordinary observation is present above; the full supplier-dependent test remains as specified
here.
Example ellipticParameter_GL2_trivial (non-example): For split GL_2 and the trivial two-dimensional
parameter, S_phi/Z(H)=PGL_2 is positive dimensional, so the parameter is not elliptic.
OMITTED HIGHER EXAMPLE SIGNATURE pending the supplier types.
Example ellipticParameter_GLn_irreducible (characterisation): For split GL_n over L, an irreducible
Weil representation has scalar centralizer and is elliptic; a semisimple reducible representation
has a positive-dimensional centralizer modulo scalars.
OMITTED HIGHER EXAMPLE SIGNATURE pending the supplier types.

ExcursionOperatorsAndSpectralAction:ES4/elliptic-parameter-component
Proposed declaration: elliptic_parameter_component
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
For elliptic phi over Qbar_ell, its unramified central twists form the connected component C_phi of
the parameter stack. The associated clopen idempotent in the excursion/invariant coordinate ring
defines the summand D_lis^(C_phi), on which that idempotent acts as identity. If Z(H)^Gamma is
finite then C_phi=BS_phi as a stack, not an ordinary point with trivial stabilizer.

ExcursionOperatorsAndSpectralAction:ES4/basic-decomposition-of-an-elliptic-component
Proposed declaration: basic_decomposition_of_an_elliptic_component
OMITTED HIGHER SIGNATURE: the exact types are not supplied at the pins.
For elliptic phi and A in D_lis^(C_phi), restriction to any nonbasic b is zero. Hence its compact
category decomposes over basic b; its smooth representations lie in supercuspidal Bernstein
components. If Z(H)^Gamma is finite, the component category is the direct sum of copies of
Perf(Qbar_ell), indexed by basic b and supercuspidal pi of G_b(E) with parameter phi. This proved
structural description does not establish the conjectural bijection with irreducible S_phi
representations.

-/
