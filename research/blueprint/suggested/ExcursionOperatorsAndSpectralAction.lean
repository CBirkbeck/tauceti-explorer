/-
This file is not the roadmap and is not exhaustive. The mathematical roadmap
in ../readmes/ExcursionOperatorsAndSpectralAction.md is definitive. These
statements suggest Lean names and signatures for contributors and reviewers.
Every mathematical node retains implementationStatus = unchecked. The file
uses sorry and does not claim that the roadmap has been implemented.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Existing Mathlib APIs are
imported rather than redefined. The common namespace is
TauCeti.Blueprint.Excursion, with ES0, ES5 and ES7 subnamespaces; part-local
carrier models remain distinct. They are suggested forms, not interchangeable
implementations of the shared enhanced geometric objects.

ES0 expresses ordinary observations of the enhanced constructions. The pins
do not supply the stable Lambda-linear category, condensed action anima,
stacky Perf or animation interfaces. Its OMITTED HIGHER SIGNATURES register
states the mathematical targets whose complete Lean signatures are absent.
Ordinary CatCenter is a comparison target, and ordinary quotient-action
triviality is not coherent enhanced descent. EllipticCentralizerFinite states
only the finite-quotient condition, not semisimplicity.

ES5 uses actual condensed algebras for Schur irreducibility and the scalar
unit. Explicit imported reconstruction/evaluation maps give algebraic
global-point consequences. Animated enrichment, semisimplicity, the prescribed
Weil projection, parameter continuity and representation smoothness and
admissibility are omitted where their types are unavailable. ZEmbedding is
only the rational-point exact-sequence/central-lifting fragment; it omits
the reductive-scheme, induced-torus, connected-centre and H1 conditions.

ES7 attaches missing carriers to their genuine field/group/class/coefficient
parameters, and names their supplier in docstrings. Its omitted geometric
conditions remain explicit. Where the pins have the notion, use CatCenter,
Functor.FullyFaithful, IsNonarchimedeanLocalField, FDRep, Representation,
Matrix.GeneralLinearGroup, Algebra.IsCentral, Scheme and Module.Invertible.

The assembled reader includes all 113 node statements, 113 API statements
and 76 test statements from the packets. This file preserves the supplied
signature limitations; comments are not executable signatures or tests.
It does not repair the parts' outstanding section-13 coverage obligations.
-/

import Mathlib.CategoryTheory.Center.Linear
import Mathlib.CategoryTheory.Preadditive.AdditiveFunctor
import Mathlib.CategoryTheory.Linear.LinearFunctor
import Mathlib.RingTheory.Spectrum.Prime.Basic
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.GroupTheory.QuotientGroup.Defs
import Mathlib.Condensed.Basic
import Mathlib.Algebra.Category.AlgCat.Basic
import Mathlib.RepresentationTheory.Intertwining
import Mathlib.Algebra.Algebra.Hom
import Mathlib.Algebra.Algebra.Subalgebra.Basic
import Mathlib.CategoryTheory.Center.Basic
import Mathlib.CategoryTheory.Adjunction.Basic
import Mathlib.GroupTheory.Subgroup.Center
import Mathlib.CategoryTheory.Functor.FullyFaithful
import Mathlib.CategoryTheory.Preadditive.FunctorCategory
import Mathlib.NumberTheory.LocalField.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RepresentationTheory.FDRep
import Mathlib.Algebra.Central.Defs
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.LinearAlgebra.Coevaluation
import Mathlib.LinearAlgebra.Contraction
import Mathlib.LinearAlgebra.Trace
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.RepresentationTheory.Character
import Mathlib.RepresentationTheory.Semisimple
import Mathlib.CategoryTheory.Adjunction.Unique
import Mathlib.RingTheory.Adjoin.Basic
import Mathlib.RingTheory.Ideal.Quotient.Defs
import Mathlib.Algebra.Group.End
import Mathlib.Tactic.NormNum
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.Topology.Algebra.Module.ModuleTopology
import Mathlib.Topology.Instances.Matrix
import Mathlib.Topology.Algebra.Constructions
import Mathlib.Topology.Algebra.Group.Quotient
import Mathlib.MeasureTheory.Measure.Haar.Basic
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.Topology.LocallyConstant.Basic
import Mathlib.Algebra.DirectSum.Module
import Mathlib.Topology.Instances.AddCircle.Defs
import Mathlib.Algebra.BigOperators.Finprod
import Mathlib.GroupTheory.DoubleCoset
import Mathlib.Algebra.Central.Basic
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.AlgebraicGeometry.Restrict
import Mathlib.RingTheory.SimpleRing.Matrix
import Mathlib.RingTheory.SimpleRing.Basic
import Mathlib.Algebra.Central.Matrix
import Mathlib.RingTheory.PicardGroup
import Mathlib.RepresentationTheory.Induced
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.Topology.LocallyConstant.Algebra
import Mathlib.CategoryTheory.Comma.Over.Basic
import Mathlib.CategoryTheory.Abelian.Basic
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.NumberTheory.Cyclotomic.CyclotomicCharacter
import Mathlib.FieldTheory.RatFunc.AsPolynomial
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.LinearAlgebra.PerfectPairing.Basic
import Mathlib.RepresentationTheory.Invariants
import Mathlib.Data.PNat.Basic
import Mathlib.Algebra.Group.AddChar
import Mathlib.Algebra.Ring.Action.Group

/-! ## ES0: suggested forms for this part -/

open CategoryTheory
open scoped IsMulCommutative

namespace TauCeti.Blueprint.Excursion.ES0

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

-- centralSupport_free: faithful scalar action at the rank-one free object.
example (a : R →+* CatCenter C) (X : C)
    (h : Function.Injective ((centerEvaluation X).comp a)) :
    centralSupport a X = Set.univ := by
  sorry

lemma centralSupport_retract (a : R →+* CatCenter C) {X Y : C}
    (i : X ⟶ Y) (r : Y ⟶ X) (h : i ≫ r = 𝟙 X) :
    centralSupport a X ⊆ centralSupport a Y := by
  sorry

/-- Algebraic conclusion used after the enhanced exact-triangle factorization.
The product-ideal hypothesis is that factorization, not a replacement for it. -/
lemma support_exact_operations (I J K : Ideal R) (h : I * K ≤ J) :
    PrimeSpectrum.zeroLocus (J : Set R) ⊆
      PrimeSpectrum.zeroLocus (I : Set R) ∪ PrimeSpectrum.zeroLocus (K : Set R) := by
  sorry

end CentralSupport

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

end TauCeti.Blueprint.Excursion.ES0

namespace TauCeti.Blueprint.Excursion.ES0

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

-- centralSupport_nilpotent: the dual-number computation in a general form.
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

end TauCeti.Blueprint.Excursion.ES0

/-
FULL MATHEMATICAL SIGNATURE REGISTER

These names and full statements agree with the packet. A name with a declared
ordinary observation above still needs the higher conditions stated here.
All other higher signatures are explicitly OMITTED pending the supplier types.
Independent review REV-ExcursionOperatorsAndSpectralAction--ES0 records needs_changes:
this comment register is not the actual signatures required by PROTOCOL section 13.
See the review report for the complete declaration/API/example inventory.
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
Ordinary observation declared above; full enhanced conditions remain unavailable.
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

/-! ## ES5: suggested forms for this part -/

open CategoryTheory
namespace TauCeti.Blueprint.Excursion.ES5
universe u

section Schur
variable {L : Type u} [Field L]
variable {Scalar End End' : Condensed.{u} (AlgCat.{u} L)}

/-- The actual scalar unit, not an arbitrary isomorphism of abstract algebras. -/
def IsSchurIrreducible (scalarUnit : Scalar ⟶ End) : Prop := IsIso scalarUnit

namespace IsSchurIrreducible
noncomputable def scalarIso (s : Scalar ⟶ End) (h : IsSchurIrreducible s) :
    Scalar ≅ End := by sorry

theorem scalar_unique (s : Scalar ⟶ End) (h : IsSchurIrreducible s)
    (S : CompHaus.{u}ᵒᵖ) (e : End.obj.obj S) :
    ∃! a : Scalar.obj.obj S, (s.hom.app S).hom a = e := by sorry

theorem sections_bijective (s : Scalar ⟶ End) (h : IsSchurIrreducible s)
    (S : CompHaus.{u}ᵒᵖ) : Function.Bijective (s.hom.app S).hom := by sorry

theorem iso_invariant (s : Scalar ⟶ End) (e : End ≅ End') :
    IsSchurIrreducible (s ≫ e.hom) ↔ IsSchurIrreducible s := by sorry

theorem shift (s : Scalar ⟶ End) (s' : Scalar ⟶ End')
    (e : End ≅ End') (hunit : s' = s ≫ e.hom) (h : IsSchurIrreducible s) :
    IsSchurIrreducible s' := by sorry
end IsSchurIrreducible

-- schur_scalar_identity
example (Scalar : Condensed.{u} (AlgCat.{u} L)) :
    IsSchurIrreducible (𝟙 Scalar) := by sorry
-- schur_rejects_zero
example (s : Scalar ⟶ End) (S : CompHaus.{u}ᵒᵖ)
    (hscalar : (0 : Scalar.obj.obj S) ≠ 1) (hzero : (0 : End.obj.obj S) = 1) :
    ¬ IsSchurIrreducible s := by sorry
-- schur_requires_all_sections
example (s : Scalar ⟶ End) (S : CompHaus.{u}ᵒᵖ)
    (h : ¬ Function.Bijective (s.hom.app S).hom) : ¬ IsSchurIrreducible s := by sorry

/-- The relatively discrete endomorphism comparison is imported, with its unit. -/
theorem condensedSchurOfAdmissible (s : Scalar ⟶ End)
    (RelativeDiscreteEnd : Condensed.{u} (AlgCat.{u} L))
    (a : Scalar ≅ RelativeDiscreteEnd) (b : RelativeDiscreteEnd ≅ End)
    (hunit : s = a.hom ≫ b.hom) : IsSchurIrreducible s := by sorry
end Schur

section Character
variable {L : Type u} [Field L]
variable {Exc : Type u} [CommRing Exc] [Algebra L Exc]
variable {End : Type u} [Semiring End] [Algebra L End]
noncomputable def excursionCharacter (operators : Exc →ₐ[L] End)
    (scalar : End ≃ₐ[L] L) : Exc →ₐ[L] L := by sorry

namespace excursionCharacter
theorem apply (op : Exc →ₐ[L] End) (s : End ≃ₐ[L] L) (x : Exc) :
    excursionCharacter op s x = s (op x) := by sorry

theorem scalar_linear (op : Exc →ₐ[L] End) (s : End ≃ₐ[L] L) (a : L) :
    excursionCharacter op s (algebraMap L Exc a) = a := by sorry

noncomputable def family {Inv Tuple : Type u} [CommRing Inv] [Algebra L Inv]
    (universalEvaluation : Inv →ₐ[L] (Tuple → Exc))
    (op : Exc →ₐ[L] End) (s : End ≃ₐ[L] L) : Inv →ₐ[L] (Tuple → L) := by sorry

theorem pullback {I J T U : Type u}
    [CommRing I] [Algebra L I] [CommRing J] [Algebra L J]
    (a : I →ₐ[L] (T → Exc)) (b : J →ₐ[L] (U → Exc))
    (pull : I →ₐ[L] J) (reindex : U → T)
    (h : ∀ f t, b (pull f) t = a f (reindex t))
    (op : Exc →ₐ[L] End) (s : End ≃ₐ[L] L) (f : I) (t : U) :
    family b op s (pull f) t = family a op s f (reindex t) := by sorry

theorem multiplication {I J T U : Type u}
    [CommRing I] [Algebra L I] [CommRing J] [Algebra L J]
    (a : I →ₐ[L] (T → Exc)) (b : J →ₐ[L] (U → Exc))
    (mulPull : J →ₐ[L] I) (orderedMultiply : T → U)
    (h : ∀ f t, a (mulPull f) t = b f (orderedMultiply t))
    (op : Exc →ₐ[L] End) (s : End ≃ₐ[L] L) (f : J) (t : T) :
    family a op s (mulPull f) t = family b op s f (orderedMultiply t) := by sorry

theorem condensed {Scalar E Inv : Condensed.{u} (AlgCat.{u} L)}
    (s : Scalar ⟶ E) (hs : IsSchurIrreducible s) (op : Inv ⟶ E) :
    ∃! χ : Inv ⟶ Scalar, χ ≫ s = op := by sorry

theorem ext {D : Type u} (gen : D → Exc)
    (hgen : Algebra.adjoin L (Set.range gen) = ⊤)
    (χ ψ : Exc →ₐ[L] L) (h : ∀ d, χ (gen d) = ψ (gen d)) : χ = ψ := by sorry
end excursionCharacter

-- character_unit
example (op : Exc →ₐ[L] End) (s : End ≃ₐ[L] L) :
    excursionCharacter op s 1 = 1 := by sorry
-- character_inverse_pair
example (op : Exc →ₐ[L] End) (s : End ≃ₐ[L] L) (pair identityCoefficient : Exc)
    (h : pair = identityCoefficient) :
    excursionCharacter op s pair = excursionCharacter op s identityCoefficient := by sorry
-- character_detects_order: applies to coefficients which distinguish the words.
example (op : Exc →ₐ[L] End) (s : End ≃ₐ[L] L) (xy yx : Exc) (h : op xy ≠ op yx) :
    excursionCharacter op s xy ≠ excursionCharacter op s yx := by sorry
end Character

section Parameters
variable {L : Type u} [Field L]
variable {Exc : Type u} [CommRing Exc] [Algebra L Exc]
variable {W H : Type u} [Group W] [Group H]

theorem abstractSemisimpleParameter
    (classify : (Exc →ₐ[L] L) → (W →* H))
    (evaluate : (W →* H) → (Exc →ₐ[L] L))
    (h : ∀ χ, evaluate (classify χ) = χ) (χ : Exc →ₐ[L] L) :
    ∃ φ : W →* H, evaluate φ = χ := by sorry

theorem parameterOfSchurSheaf
    (classify : (Exc →ₐ[L] L) → (W →* H))
    (evaluate : (W →* H) → (Exc →ₐ[L] L))
    (h : ∀ χ, evaluate (classify χ) = χ) (χ : Exc →ₐ[L] L) (K : Subgroup H)
    (hseparate : ∀ φ ψ, evaluate φ = evaluate ψ →
      ∃ k : K, ∀ w, ψ w = (k : H) * φ w * (k : H)⁻¹) :
    ∃ φ : W →* H, evaluate φ = χ ∧ ∀ ψ, evaluate ψ = χ →
      ∃ k : K, ∀ w, ψ w = (k : H) * φ w * (k : H)⁻¹ := by sorry

variable {G V : Type u} [Group G] [AddCommGroup V] [Module L V]
noncomputable def parameterOfRepresentation (ρ : Representation L G V)
    (op : Exc →ₐ[L] ρ.IntertwiningMap ρ) (s : ρ.IntertwiningMap ρ ≃ₐ[L] L)
    (classify : (Exc →ₐ[L] L) → (W →* H)) : W →* H := by sorry

namespace parameterOfRepresentation
theorem eval (ρ : Representation L G V) (op : Exc →ₐ[L] ρ.IntertwiningMap ρ)
    (s : ρ.IntertwiningMap ρ ≃ₐ[L] L) (classify : (Exc →ₐ[L] L) → (W →* H))
    (evaluate : (W →* H) → (Exc →ₐ[L] L)) (h : ∀ χ, evaluate (classify χ) = χ) :
    evaluate (parameterOfRepresentation ρ op s classify) = excursionCharacter op s := by sorry

theorem defining_identity (ρ : Representation L G V)
    (op : Exc →ₐ[L] ρ.IntertwiningMap ρ) (s : ρ.IntertwiningMap ρ ≃ₐ[L] L) (x : Exc) :
    op x = algebraMap L (ρ.IntertwiningMap ρ) (excursionCharacter op s x) := by sorry

theorem embedding_independent (ρ : Representation L G V)
    (op op' : Exc →ₐ[L] ρ.IntertwiningMap ρ) (s : ρ.IntertwiningMap ρ ≃ₐ[L] L)
    (classify : (Exc →ₐ[L] L) → (W →* H)) (h : op = op') :
    parameterOfRepresentation ρ op s classify = parameterOfRepresentation ρ op' s classify := by sorry

theorem iso_invariant {E E' : Type u} [Semiring E] [Algebra L E]
    [Semiring E'] [Algebra L E'] (e : E ≃ₐ[L] E') (op : Exc →ₐ[L] E) (op' : Exc →ₐ[L] E')
    (s : E ≃ₐ[L] L) (s' : E' ≃ₐ[L] L) (hop : op' = e.toAlgHom.comp op)
    (hs : s'.toAlgHom.comp e.toAlgHom = s.toAlgHom) :
    excursionCharacter op s = excursionCharacter op' s' := by sorry

theorem at_basepoint (ρ : Representation L G V) (op : Exc →ₐ[L] ρ.IntertwiningMap ρ)
    (s : ρ.IntertwiningMap ρ ≃ₐ[L] L) (classify : (Exc →ₐ[L] L) → (W →* H)) :
    parameterOfRepresentation ρ op s classify = classify (excursionCharacter op s) := by sorry
end parameterOfRepresentation

-- representation_basepoint
example (ρ : Representation L G V) (op : Exc →ₐ[L] ρ.IntertwiningMap ρ)
    (s : ρ.IntertwiningMap ρ ≃ₐ[L] L) (classify : (Exc →ₐ[L] L) → (W →* H)) :
    parameterOfRepresentation ρ op s classify = classify (excursionCharacter op s) := by sorry
-- representation_same_centre
example (ρ : Representation L G V) (op op' : Exc →ₐ[L] ρ.IntertwiningMap ρ)
    (s : ρ.IntertwiningMap ρ ≃ₐ[L] L) (classify : (Exc →ₐ[L] L) → (W →* H)) (h : op = op') :
    parameterOfRepresentation ρ op s classify = parameterOfRepresentation ρ op' s classify := by sorry
-- representation_trivial_group
example (ρ : Representation L PUnit L) (op : Exc →ₐ[L] ρ.IntertwiningMap ρ)
    (s : ρ.IntertwiningMap ρ ≃ₐ[L] L) (classify : (Exc →ₐ[L] L) → (W →* PUnit))
    (w : W) : parameterOfRepresentation ρ op s classify w = 1 := by sorry
end Parameters

section CentreComparisons
variable {L : Type u} [Field L]
variable {S S' E E' : Type u} [CommRing S] [Algebra L S] [CommRing S'] [Algebra L S']
    [Semiring E] [Algebra L E] [Semiring E'] [Algebra L E']
theorem isogenies (dualPull : S' →ₐ[L] S) (action : S →ₐ[L] E)
    (action' : S' →ₐ[L] E') (pullEnd : E →ₐ[L] E')
    (kernelComparison : pullEnd.comp (action.comp dualPull) = action') (x : S') :
    pullEnd (action (dualPull x)) = action' x := by sorry
end CentreComparisons

section Transport
variable {L : Type u} [Field L]
variable {S S' : Type u} [CommRing S] [Algebra L S] [CommRing S'] [Algebra L S']
variable {W H H' : Type u} [Group W] [Group H] [Group H']
/-- Algebraic coefficient extension; the geometric base-change comparison and
the retained Schur condition which produce `hχ` remain omitted. -/
theorem invarianceAndCoefficientTransport
    {L' Exc' : Type u} [Field L'] [CommRing Exc'] [Algebra L' Exc']
    (coefficientMap : L →+* L') (extendExcursion : S →+* Exc')
    (χ : S →ₐ[L] L) (χ' : Exc' →ₐ[L'] L')
    (classify : (S →ₐ[L] L) → (W →* H))
    (classify' : (Exc' →ₐ[L'] L') → (W →* H')) (dual : H →* H')
    (hc : ∀ c c', c'.toRingHom.comp extendExcursion = coefficientMap.comp c.toRingHom →
      classify' c' = dual.comp (classify c))
    (hχ : χ'.toRingHom.comp extendExcursion = coefficientMap.comp χ.toRingHom) :
    classify' χ' = dual.comp (classify χ) := by sorry

theorem coefficientPolicyForFunctorialDiagrams (f : S' →ₐ[L] S)
    (χ : S →ₐ[L] L) (χ' : S' →ₐ[L] L) (h : χ' = χ.comp f) (x : S') :
    χ' x = χ (f x) := by sorry

theorem bernsteinZelevinskyDuals (chevalleyPull : S →ₐ[L] S)
    (χ χDual : S →ₐ[L] L) (h : χDual = χ.comp chevalleyPull)
    (classify : (S →ₐ[L] L) → (W →* H)) (θ : H →* H)
    (hc : ∀ c, classify (c.comp chevalleyPull) = θ.comp (classify c)) :
    classify χDual = θ.comp (classify χ) := by sorry

theorem smoothDuals (chevalleyPull : S →ₐ[L] S)
    (χ χDual : S →ₐ[L] L) (h : χDual = χ.comp chevalleyPull)
    (classify : (S →ₐ[L] L) → (W →* H)) (θ : H →* H)
    (hc : ∀ c, classify (c.comp chevalleyPull) = θ.comp (classify c)) :
    classify χDual = θ.comp (classify χ) := by sorry
end Transport

section ProductsAndRestriction
variable {W H₁ H₂ : Type u} [Group W] [Group H₁] [Group H₂]
theorem products (φ₁ : W →* H₁) (φ₂ : W →* H₂) (w : W) :
    (φ₁.prod φ₂) w = (φ₁ w, φ₂ w) := by sorry

theorem weilRestriction {W' : Type u} [Group W'] (embedding : W' →* W)
    (projection : H₁ →* H₂) (φ : W →* H₁) (w : W') :
    (projection.comp (φ.comp embedding)) w = projection (φ (embedding w)) := by sorry
end ProductsAndRestriction

section Tori
variable {L : Type u} [Field L]
variable {R S : Type u} [CommRing R] [Algebra L R] [CommRing S] [Algebra L S]
variable {B : Type u}
theorem toriSpectralCenter (reciprocityComparison : S →ₐ[L] R)
    (h : Function.Bijective reciprocityComparison) :
    ∃ e : S ≃ₐ[L] R, e.toAlgHom = reciprocityComparison := by sorry

/-- Equality on algebra generators propagates to the full algebra, including
nilpotents. The actual completed group-algebra/operator comparison is omitted. -/
theorem toriDiagonalEmbedding {D : Type u} (gen : D → R)
    (hgen : Algebra.adjoin L (Set.range gen) = ⊤) (diagonal : R →ₐ[L] (B → R))
    (hdiag : ∀ d b, diagonal (gen d) b = gen d) (r : R) :
    diagonal r = fun _ => r := by sorry

-- Scalar-valued characters alone cannot supply the generator identity above.
example (diagonal : R →ₐ[L] (B → R)) (x : R) (hx : x ≠ 0)
    (hnil : x * x = 0) (hdiag : ∀ r b, diagonal r b = r) (b : B) :
    diagonal x b ≠ 0 ∧ diagonal x b * diagonal x b = 0 := by sorry

theorem torusTwoLegCalculation {W A : Type u} [Group W] [CommGroup A]
    (recGeomInverse : W →* A) (χ : A →* Lˣ) (γ₁ γ₂ : W) :
    χ (recGeomInverse (γ₁ * γ₂⁻¹)) =
      χ (recGeomInverse γ₁) * (χ (recGeomInverse γ₂))⁻¹ := by sorry
end Tori

section Characters
variable {W H Z D : Type u} [Group W] [Group H] [Group Z] [CommGroup D]
theorem centralCharacters (centralDual : H →* Z) (φ : W →* H) (w : W) :
    (centralDual.comp φ) w = centralDual (φ w) := by sorry

theorem twisting (centralMap : D →* H) (hcentral : ∀ d, centralMap d ∈ Subgroup.center H)
    (φ : W →* H) (χ : W →* D) :
    ∃ φTwist : W →* H, ∀ w, φTwist w = φ w * centralMap (χ w) := by sorry
end Characters

section ZEmbeddings
variable (G Gz C : Type u) [Group G] [Group Gz] [CommGroup C]
/-- Rational-point fragment of the definition, with actual exactness conditions. -/
structure ZEmbedding where
  inclusion : G →* Gz
  quotient : Gz →* C
  inclusion_injective : Function.Injective inclusion
  quotient_surjective : Function.Surjective quotient
  exact : inclusion.range = quotient.ker
  centre_surjective : Function.Surjective (quotient.comp (Subgroup.center Gz).subtype)

variable {G Gz C}
namespace ZEmbedding
noncomputable def ofMaps (f : G →* Gz) (q : Gz →* C)
    (hf : Function.Injective f) (hq : Function.Surjective q) (he : f.range = q.ker)
    (hc : Function.Surjective (q.comp (Subgroup.center Gz).subtype)) :
    ZEmbedding G Gz C := by sorry

theorem quotient_inclusion (e : ZEmbedding G Gz C) (g : G) :
    e.quotient (e.inclusion g) = 1 := by sorry

theorem central_lift (e : ZEmbedding G Gz C) (c : C) :
    ∃ z : Subgroup.center Gz, e.quotient z = c := by sorry

theorem rational_factorization (e : ZEmbedding G Gz C) (x : Gz) :
    ∃ z : Subgroup.center Gz, ∃ g : G, (z : Gz) * e.inclusion g = x := by sorry

theorem extend_representation {L V : Type u} [Field L] [AddCommGroup V] [Module L V]
    (e : ZEmbedding G Gz C) (ρ : Representation L G V) (χ : Subgroup.center Gz →* Lˣ)
    (hc : ∀ (g : G) (z : Subgroup.center Gz),
      e.inclusion g = (z : Gz) → ρ g = (χ z : L) • 1) :
    ∃ ρz : Representation L Gz V,
      (∀ g, ρz (e.inclusion g) = ρ g) ∧ ∀ z : Subgroup.center Gz,
        ρz z = (χ z : L) • 1 := by sorry
end ZEmbedding

-- zembedding_identity
example (G : Type u) [Group G] : ∃ e : ZEmbedding G G PUnit,
    ∀ g, e.inclusion g = g := by sorry
-- zembedding_product
example (G C : Type u) [Group G] [CommGroup C] : ∃ e : ZEmbedding G (G × C) C,
    (∀ g, e.inclusion g = (g, 1)) ∧ ∀ x, e.quotient x = x.2 := by sorry
-- zembedding_requires_central_lifting
example (q : Gz →* C) (h : ¬ Function.Surjective (q.comp (Subgroup.center Gz).subtype)) :
    ¬ ∃ e : ZEmbedding G Gz C, e.quotient = q := by sorry

theorem zEmbeddingCentralCharacterComparison {L : Type u} [Field L]
    (e : ZEmbedding G Gz C) (χz ψz : Subgroup.center Gz →* Lˣ)
    (centreMap : Subgroup.center G →* Subgroup.center Gz)
    (hcentre : ∀ z : Subgroup.center G, (centreMap z : Gz) = e.inclusion z)
    (difference : C →* Lˣ)
    (h : ∀ z : Subgroup.center Gz, χz z = ψz z * difference (e.quotient z)) :
    χz.comp centreMap = ψz.comp centreMap := by sorry
end ZEmbeddings

section Embeddings
variable {C D : Type u} [Category C] [Category D]
/-- Naturality and the actual restriction retractions compare the two centre actions.
The enhanced adjunctions constructing these maps are imported geometric inputs. -/
theorem stratumCentreEmbeddingIndependence (left right : D ⥤ C)
    (restriction : C ⥤ D) (comparison : left ⟶ right)
    (leftRetraction : left ⋙ restriction ≅ 𝟭 D)
    (rightRetraction : right ⋙ restriction ≅ 𝟭 D)
    (h : ∀ X, restriction.map (comparison.app X) ≫ rightRetraction.hom.app X =
      leftRetraction.hom.app X) (z : CatCenter C) (X : D) :
    leftRetraction.inv.app X ≫ restriction.map (z.app (left.obj X)) ≫
      leftRetraction.hom.app X =
    rightRetraction.inv.app X ≫ restriction.map (z.app (right.obj X)) ≫
      rightRetraction.hom.app X := by sorry
end Embeddings
end TauCeti.Blueprint.Excursion.ES5

/-! ## ES7: suggested forms for this part -/

set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

open CategoryTheory

namespace TauCeti.Blueprint.Excursion.ES7

universe u

/-! ### Local fields, Weil groups and coefficients -/

section LocalField

variable (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]

/-- The cardinality `q` of the residue field of `E`. -/
def residueCard (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] : ℕ := sorry

/-- The Weil group `W_E` (supplied by `LanglandsParameterStacks:LP0`). -/
def WeilGroup (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] : Type u := sorry

instance : Group (WeilGroup E) := sorry
instance : TopologicalSpace (WeilGroup E) := sorry
instance : IsTopologicalGroup (WeilGroup E) := sorry

/-- The degree `|·| : W_E → W_E / I_E ≅ ℤ`, normalised by sending a geometric
Frobenius to `1` (FS, p. 334). -/
def WeilGroup.degree : WeilGroup E →* Multiplicative ℤ := sorry

/-- A chosen geometric Frobenius element. -/
def WeilGroup.geomFrob : WeilGroup E := sorry

/-- Geometric Frobenius has degree one. -/
lemma WeilGroup.degree_geomFrob :
    WeilGroup.degree E (WeilGroup.geomFrob E) = Multiplicative.ofAdd 1 := by
  sorry

/-- A connected reductive group over `E`, as an opaque carrier (owned by
`ReductiveGroupsPartII`). -/
def ReductiveGroup (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] : Type (u + 1) :=
  sorry

variable {E}

/-- The locally profinite group of rational points `G(E)`. -/
def ReductiveGroup.points (G : ReductiveGroup E) : Type u := sorry

instance (G : ReductiveGroup E) : Group G.points := sorry
instance (G : ReductiveGroup E) : TopologicalSpace G.points := sorry
instance (G : ReductiveGroup E) : IsTopologicalGroup G.points := sorry

variable (E) in
/-- The group `GL_n` over `E`. -/
def ReductiveGroup.GL (n : ℕ) : ReductiveGroup E := sorry

/-- `GL_n(E)` is the Mathlib group of invertible `n × n` matrices over `E`. -/
def ReductiveGroup.GL.pointsEquiv (n : ℕ) :
    (ReductiveGroup.GL E n).points ≃* Matrix.GeneralLinearGroup (Fin n) E := sorry

/-- The Kottwitz set `B(G)` (owned by `BunGAndNewtonStrata:BG1`). -/
def KottwitzSet (G : ReductiveGroup E) : Type u := sorry

instance (G : ReductiveGroup E) : One (KottwitzSet G) := sorry

/-- The `σ`-centralizer `G_b`, an inner form of a Levi subgroup of `G`
(`BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`). -/
def sigmaCentralizer (G : ReductiveGroup E) (b : KottwitzSet G) : ReductiveGroup E :=
  sorry

/-- The basic classes `B(G)_basic`, as their own carrier type. -/
def BasicKottwitzSet (G : ReductiveGroup E) : Type u := sorry

/-- A basic class is a class of `B(G)`. -/
def BasicKottwitzSet.val {G : ReductiveGroup E} : BasicKottwitzSet G → KottwitzSet G :=
  sorry

/-- A parabolic subgroup of `G` (owned by `ReductiveGroupsPartII`). -/
def ParabolicSubgroup (G : ReductiveGroup E) : Type u := sorry

/-- The Levi quotient `M` of a parabolic `P`. -/
def ParabolicSubgroup.levi {G : ReductiveGroup E} (P : ParabolicSubgroup G) :
    ReductiveGroup E := sorry

/-! Smooth representations (owned by `SmoothRepresentationsOfLocalGroups`). -/

/-- Isomorphism classes of irreducible smooth representations of `G(E)` over a field
`k` (`SmoothRepresentationsOfLocalGroups:SR.0`). -/
def IrrSmoothRep (G : ReductiveGroup E) (k : Type) [Field k] : Type u := sorry

/-- Isomorphism classes of irreducible supercuspidal representations, as a carrier
type with its map to `IrrSmoothRep` (`SmoothRepresentationsOfLocalGroups:SR.3`). -/
def SupercuspidalRep (G : ReductiveGroup E) (k : Type) [Field k] : Type u := sorry

/-- A supercuspidal representation is an irreducible smooth representation. -/
def SupercuspidalRep.toIrr {G : ReductiveGroup E} {k : Type} [Field k] :
    SupercuspidalRep G k → IrrSmoothRep G k := sorry

/-- The central character of an irreducible smooth representation (Schur's lemma). -/
def IrrSmoothRep.centralCharacter {n : ℕ} {k : Type} [Field k]
    (π : IrrSmoothRep (ReductiveGroup.GL E n) k) : Eˣ →* kˣ := sorry

end LocalField

/-! ### Coefficients

Coefficient rings are `Λ` with `[CommRing Λ]` and a chosen square root of `q`;
`ℓ ≠ p` and the invertibility of `p` are kept as explicit hypotheses where used. -/

section Coefficients

/-- A chosen square root of `q` in `Λ` (FS work over `ℤ_ℓ[√q]`-algebras). -/
structure SqrtQ (Λ : Type*) [CommRing Λ] (q : ℕ) where
  /-- The chosen square root. -/
  val : Λ
  sq : val ^ 2 = (q : Λ)

/-- `Q̄_ℓ`, the algebraic closure of `ℚ_ℓ`. -/
abbrev QlBar (ℓ : ℕ) [Fact ℓ.Prime] : Type := AlgebraicClosure ℚ_[ℓ]

end Coefficients

/-! ### Equal characteristic local fields -/

/-- The equal-characteristic local field `F_q((t))`, `q = p ^ n`. -/
abbrev EqCharLocalField (p n : ℕ) [Fact p.Prime] : Type :=
  LaurentSeries (GaloisField p n)

/-! ### Global function fields (owned by `FunctionFieldArithmetic:FA.2`) -/

section FunctionField

/-- Smooth projective geometrically connected curves over `F_q`. -/
def FFCurve (q : ℕ) : Type := sorry

variable {q : ℕ}

/-- The function field `F = F_q(X)`. -/
def FFCurve.functionField (X : FFCurve q) : Type := sorry

instance (X : FFCurve q) : Field X.functionField := sorry

/-- Closed points (places) of `X`. -/
def FFCurve.Place (X : FFCurve q) : Type := sorry

/-- The completion `F_x` at a place `x`. -/
def FFCurve.Place.completion {X : FFCurve q} (x : X.Place) : Type := sorry

instance {X : FFCurve q} (x : X.Place) : Field x.completion := sorry
instance {X : FFCurve q} (x : X.Place) : ValuativeRel x.completion := sorry
instance {X : FFCurve q} (x : X.Place) : TopologicalSpace x.completion := sorry
instance {X : FFCurve q} (x : X.Place) : IsNonarchimedeanLocalField x.completion := sorry
instance {X : FFCurve q} (x : X.Place) : Algebra X.functionField x.completion := sorry

/-- The degree `deg(x) = [κ(x) : F_q]` of a place; `x` is rational when it is `1`. -/
def FFCurve.Place.degree {X : FFCurve q} (x : X.Place) : ℕ := sorry

/-- The ring of adeles `A_F` (`FunctionFieldArithmetic:FA.2`). -/
def FFCurve.adeles (X : FFCurve q) : Type := sorry

instance (X : FFCurve q) : CommRing X.adeles := sorry
instance (X : FFCurve q) : TopologicalSpace X.adeles := sorry
instance (X : FFCurve q) : Algebra X.functionField X.adeles := sorry

end FunctionField

/-! ### Central division algebras over function fields and their automorphic
representations (adelic carriers owned by `AdelicAlgebraicGroups:AA.0/AA.1` and
`FunctionFieldArithmetic:FA.6`; the division-algebra specialisation is ES7's) -/

section DivisionAlgebra

variable {q : ℕ} (X : FFCurve q) (D : Type) [DivisionRing D] [Algebra X.functionField D]
  [Algebra.IsCentral X.functionField D] [FiniteDimensional X.functionField D]

/-- The adelic unit group `D^×(A_F)`. -/
def adelicUnits {q : ℕ} (X : FFCurve q) (D : Type) [DivisionRing D] [Algebra X.functionField D]
    [Algebra.IsCentral X.functionField D] [FiniteDimensional X.functionField D] : Type :=
  sorry

instance : Group (adelicUnits X D) := sorry
instance : TopologicalSpace (adelicUnits X D) := sorry
instance : IsTopologicalGroup (adelicUnits X D) := sorry

/-- The diagonal embedding `D^×(F) → D^×(A_F)`. -/
def diagonalUnits : Dˣ →* adelicUnits X D := sorry

/-- The local unit group `D_x^× = (D ⊗_F F_x)^×` as an inner form of `GL_d` over `F_x`. -/
def localUnitsGroup {q : ℕ} (X : FFCurve q) (D : Type) [DivisionRing D] [Algebra X.functionField D]
    [Algebra.IsCentral X.functionField D] [FiniteDimensional X.functionField D]
    (x : X.Place) : ReductiveGroup x.completion := sorry

/-- Irreducible automorphic representations of `D^×(A_F)` on which `ϖ_∞^ℤ` acts trivially,
for a chosen rational place `∞`, with coefficients in a field `k` of characteristic zero. -/
def AutomorphicRep {q : ℕ} (X : FFCurve q) (D : Type) [DivisionRing D] [Algebra X.functionField D]
    [Algebra.IsCentral X.functionField D] [FiniteDimensional X.functionField D]
    (infty : X.Place) (k : Type) [Field k] : Type := sorry

variable {X D}

/-- The automorphic multiplicity `m(Π)`. -/
def AutomorphicRep.multiplicity {infty : X.Place} {k : Type} [Field k]
    (A : AutomorphicRep X D infty k) : ℕ := sorry

/-- The local component `Π_x`, an irreducible smooth representation of `D_x^×`. -/
def AutomorphicRep.localComponent {infty : X.Place} {k : Type} [Field k]
    (A : AutomorphicRep X D infty k) (x : X.Place) : IrrSmoothRep (localUnitsGroup X D x) k :=
  sorry

end DivisionAlgebra

end TauCeti.Blueprint.Excursion.ES7

namespace TauCeti.Blueprint.Excursion.ES7

open CategoryTheory

/-! ### ES7:parabolic — restriction of centres along fully faithful functors

The algebraic core of `ES7:parabolic/stratum-maps`: a fully faithful additive functor
`F : A ⥤ B` between preadditive categories induces a ring map `CatCenter B →+* CatCenter A`,
`z ↦ (X ↦ F⁻¹(z_{F X}))`. This is a genuine definition (Mathlib `CatCenter`,
`Functor.FullyFaithful`); the ring-map identities are proof obligations. -/

section RestrictCentre

universe v₁ v₂ u₁ u₂

variable {A : Type u₁} [Category.{v₁} A] [Preadditive A]
  {B : Type u₂} [Category.{v₂} B] [Preadditive B]

/-- Restriction of the centre along a fully faithful additive functor: `z` acts on `X` by
the unique endomorphism of `X` whose image under `F` is `z_{F X}`. API item of
`ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`. -/
def restrictCentre (F : A ⥤ B) (hF : F.FullyFaithful) [F.Additive] :
    CatCenter B →+* CatCenter A where
  toFun z :=
    { app := fun X => hF.preimage (z.app (F.obj X))
      naturality := fun X Y f => hF.map_injective (by
        simp only [Functor.id_obj, Functor.id_map, Functor.map_comp,
          Functor.FullyFaithful.map_preimage]
        exact (z.naturality (F.map f))) }
  map_one' := by
    ext X
    exact hF.map_injective (by simp [CatCenter.app])
  map_mul' z w := by
    ext X
    exact hF.map_injective (by
      simp only [CatCenter.app, CatCenter.mul_app, Functor.map_comp,
        Functor.FullyFaithful.map_preimage])
  map_zero' := by
    ext X
    exact hF.map_injective (by simp [CatCenter.app])
  map_add' z w := by
    ext X
    exact hF.map_injective (by simp [CatCenter.app])

/-- Components of `restrictCentre`. API item of
`ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`. -/
@[simp]
lemma restrictCentre_app (F : A ⥤ B) (hF : F.FullyFaithful) [F.Additive] (z : CatCenter B)
    (X : A) : (restrictCentre F hF z).app X = hF.preimage (z.app (F.obj X)) :=
  rfl

/-- `F` carries the restricted action back to the original one. -/
lemma restrictCentre_map (F : A ⥤ B) (hF : F.FullyFaithful) [F.Additive] (z : CatCenter B)
    (X : A) : F.map ((restrictCentre F hF z).app X) = z.app (F.obj X) := by
  simp

/-- Restriction along isomorphic fully faithful functors gives the same ring map. -/
lemma restrictCentre_congr {F F' : A ⥤ B} (e : F ≅ F') (hF : F.FullyFaithful)
    (hF' : F'.FullyFaithful) [F.Additive] [F'.Additive] :
    restrictCentre F hF = restrictCentre F' hF' := by
  sorry

end RestrictCentre

/-! ### ES7:parabolic — carriers

Opaque carriers for the categories and centres used by `ES7:parabolic`. Each is attached to
its genuine parameters and names its owning layer. -/

section ParabolicCarriers

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]

/-- Coefficient data of FS IX.7: `Λ` is a `ℤ_ℓ`-algebra with a chosen square root of `q`,
and `ℓ ≠ p` (i.e. `ℓ ∤ q`). -/
structure ExcCoeff (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (ℓ : ℕ) [Fact ℓ.Prime] (Λ : Type) [CommRing Λ]
    [Algebra ℤ_[ℓ] Λ] where
  /-- The chosen square root of `q` in `Λ`. -/
  sqrtQ : SqrtQ Λ (residueCard E)
  /-- `ℓ` is different from the residue characteristic `p`. -/
  ell_not_dvd : ¬ ℓ ∣ residueCard E

variable {ℓ : ℕ} [Fact ℓ.Prime] {Λ : Type} [CommRing Λ] [Algebra ℤ_[ℓ] Λ]

/-- `√q` is a unit in a `ℤ_ℓ`-algebra when `ℓ ∤ q`. -/
lemma ExcCoeff.sqrtQ_isUnit (c : ExcCoeff E ℓ Λ) : IsUnit c.sqrtQ.val := by
  sorry

/-- The chosen `√q` as a unit of `Λ`. -/
noncomputable def ExcCoeff.sqrtQUnit (c : ExcCoeff E ℓ Λ) : Λˣ :=
  c.sqrtQ_isUnit.unit

/-- The derived category `D(G(E), Λ)` of smooth representations (owned by
`SmoothRepresentationsOfLocalGroups:SR.0`). Its `CatCenter` is the Bernstein centre
`Z(G(E), Λ) = lim_K Z(e_K H_Λ e_K)` by `SmoothRepresentationsOfLocalGroups:SR.1`. -/
def SmoothDerivedCat (G : ReductiveGroup E) (Λ : Type) [CommRing Λ] : Type (u + 1) := sorry

instance (G : ReductiveGroup E) (Λ : Type) [CommRing Λ] :
    Category.{u} (SmoothDerivedCat G Λ) := sorry
instance (G : ReductiveGroup E) (Λ : Type) [CommRing Λ] :
    Preadditive (SmoothDerivedCat G Λ) := sorry

/-- The Bernstein centre `Z(G(E), Λ)`, the centre of `D(G(E), Λ)`. -/
abbrev BernsteinCentre (G : ReductiveGroup E) (Λ : Type) [CommRing Λ] : Type (u + 1) :=
  CatCenter (SmoothDerivedCat G Λ)

/-- Base change `Z(G(E), Λ) → Z(G(E), Λ')` along `f : Λ →+* Λ'`, induced by base change of
the Hecke algebras `e_K H_Λ e_K` (owned by `SmoothRepresentationsOfLocalGroups:SR.1`). -/
def bernsteinBaseChange (G : ReductiveGroup E) {Λ Λ' : Type} [CommRing Λ] [CommRing Λ']
    (f : Λ →+* Λ') : BernsteinCentre G Λ →+* BernsteinCentre G Λ' := sorry

/-- The lisse category `D_lis(Bun_G, Λ)` (owned by `VStackSheavesAndLisseCategories:VS4`). -/
def LisseSheafCat (G : ReductiveGroup E) (Λ : Type) [CommRing Λ] : Type (u + 1) := sorry

instance (G : ReductiveGroup E) (Λ : Type) [CommRing Λ] :
    Category.{u} (LisseSheafCat G Λ) := sorry
instance (G : ReductiveGroup E) (Λ : Type) [CommRing Λ] :
    Preadditive (LisseSheafCat G Λ) := sorry

/-- The fully faithful embedding `D(G_b(E), Λ) ≃ D_lis(Bun_G^b, Λ) → D_lis(Bun_G, Λ)`, the
left adjoint to `i_b^*` of FS Proposition VII.7.2 (owned by
`VStackSheavesAndLisseCategories:VS4`; not an unrestricted `i_b!` on lisse categories). -/
def stratumEmbedding (G : ReductiveGroup E) (b : KottwitzSet G) (Λ : Type) [CommRing Λ] :
    SmoothDerivedCat (sigmaCentralizer G b) Λ ⥤ LisseSheafCat G Λ := sorry

/-- `stratumEmbedding` is fully faithful (VS4). -/
def stratumEmbedding.fullyFaithful (G : ReductiveGroup E) (b : KottwitzSet G) (Λ : Type)
    [CommRing Λ] : (stratumEmbedding G b Λ).FullyFaithful := sorry

instance (G : ReductiveGroup E) (b : KottwitzSet G) (Λ : Type) [CommRing Λ] :
    (stratumEmbedding G b Λ).Additive := sorry

/-- The restriction `i_b^* : D_lis(Bun_G, Λ) → D_lis(Bun_G^b, Λ) ≃ D(G_b(E), Λ)` (VS4). -/
def stratumRestriction (G : ReductiveGroup E) (b : KottwitzSet G) (Λ : Type) [CommRing Λ] :
    LisseSheafCat G Λ ⥤ SmoothDerivedCat (sigmaCentralizer G b) Λ := sorry

/-- The stratum embedding is left adjoint to `i_b^*` (VS4, FS Proposition VII.7.2). -/
def stratumAdjunction (G : ReductiveGroup E) (b : KottwitzSet G) (Λ : Type) [CommRing Λ] :
    stratumEmbedding G b Λ ⊣ stratumRestriction G b Λ := sorry

/-- The extension by zero `j_! : D(G(E), Λ) ≃ D_lis(Bun_G^1, Λ) → D_lis(Bun_G, Λ)` from the
open semistable stratum (VS4). -/
def trivialStratumEmbedding (G : ReductiveGroup E) (Λ : Type) [CommRing Λ] :
    SmoothDerivedCat G Λ ⥤ LisseSheafCat G Λ := sorry

/-- `j_!` is fully faithful (VS4). -/
def trivialStratumEmbedding.fullyFaithful (G : ReductiveGroup E) (Λ : Type) [CommRing Λ] :
    (trivialStratumEmbedding G Λ).FullyFaithful := sorry

instance (G : ReductiveGroup E) (Λ : Type) [CommRing Λ] :
    (trivialStratumEmbedding G Λ).Additive := sorry

/-- The equivalence `D(G_1(E), Λ) ≌ D(G(E), Λ)` induced by `G_1 = G`
(`BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`). -/
def sigmaCentralizerOneEquiv (G : ReductiveGroup E) (Λ : Type) [CommRing Λ] :
    SmoothDerivedCat (sigmaCentralizer G 1) Λ ≌ SmoothDerivedCat G Λ := sorry

instance (G : ReductiveGroup E) (Λ : Type) [CommRing Λ] :
    (sigmaCentralizerOneEquiv G Λ).functor.Additive := sorry

/-- At `b = 1` the stratum embedding is `j_!` (VS4). -/
def stratumEmbeddingOneIso (G : ReductiveGroup E) (Λ : Type) [CommRing Λ] :
    stratumEmbedding G 1 Λ ≅
      (sigmaCentralizerOneEquiv G Λ).functor ⋙ trivialStratumEmbedding G Λ := sorry

/-- The order `|π₀ Z(G)|` of the component group of the centre of `G` (owned by
`ReductiveGroupsPartII`). -/
def componentGroupOrder (G : ReductiveGroup E) : ℕ := sorry

/-- `Z(GL_n) = 𝔾_m` is connected. -/
lemma componentGroupOrder_GL (n : ℕ) : componentGroupOrder (ReductiveGroup.GL E n) = 1 := by
  sorry

variable (E) in
/-- The group `SL_n` over `E` (owned by `ReductiveGroupsPartII`). -/
def ReductiveGroup.SL (n : ℕ) : ReductiveGroup E := sorry

/-- In characteristic zero, `π₀ Z(SL_n) = μ_n` has order `n`. -/
lemma componentGroupOrder_SL [CharZero E] (n : ℕ) (hn : 0 < n) :
    componentGroupOrder (ReductiveGroup.SL E n) = n := by
  sorry

/-- The spectral Bernstein centre `Z^spec(G, Λ) = O(Z¹(W_E, Ĝ)_Λ)^Ĝ` (owned by
`ExcursionOperatorsAndSpectralAction:ES1:spectral-center` and `LanglandsParameterStacks:LP0`). -/
def SpectralCentre (G : ReductiveGroup E) (Λ : Type) [CommRing Λ] : Type := sorry

instance (G : ReductiveGroup E) (Λ : Type) [CommRing Λ] : CommRing (SpectralCentre G Λ) :=
  sorry

/-- The algebra of excursion operators `Exc(W_E, Ĝ)_Λ` (owned by
`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/excursion-algebra-without-the-coefficient-condition`). -/
def ExcursionAlgebra (G : ReductiveGroup E) (Λ : Type) [CommRing Λ] : Type := sorry

instance (G : ReductiveGroup E) (Λ : Type) [CommRing Λ] : CommRing (ExcursionAlgebra G Λ) :=
  sorry

/-- The canonical map from excursion operators to spectral functions (ES1). -/
def excursionToSpectral (G : ReductiveGroup E) (Λ : Type) [CommRing Λ] :
    ExcursionAlgebra G Λ →+* SpectralCentre G Λ := sorry

/-- The spectral-to-geometric centre map `Z^spec(G, Λ) → Z(D_lis(Bun_G, Λ))`, which requires
`|π₀ Z(G)|` invertible in `Λ` (owned by
`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`). -/
def spectralToGeometric (G : ReductiveGroup E) (c : ExcCoeff E ℓ Λ)
    (hZ : IsUnit (componentGroupOrder G : Λ)) :
    SpectralCentre G Λ →+* CatCenter (LisseSheafCat G Λ) := sorry

/-- The excursion action `Exc(W_E, Ĝ)_Λ → Z(D_lis(Bun_G, Λ))`, with no condition on
`|π₀ Z(G)|` (owned by
`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/excursion-algebra-without-the-coefficient-condition`). -/
def excursionToGeometric (G : ReductiveGroup E) (c : ExcCoeff E ℓ Λ) :
    ExcursionAlgebra G Λ →+* CatCenter (LisseSheafCat G Λ) := sorry

/-- Under the centre-order condition the excursion action factors through the spectral
centre (ES1). -/
lemma spectralToGeometric_comp_excursionToSpectral (G : ReductiveGroup E)
    (c : ExcCoeff E ℓ Λ) (hZ : IsUnit (componentGroupOrder G : Λ)) :
    (spectralToGeometric G c hZ).comp (excursionToSpectral G Λ) = excursionToGeometric G c := by
  sorry

end ParabolicCarriers

/-! ### ES7:parabolic/stratum-maps -/

section StratumMaps

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]
variable {ℓ : ℕ} [Fact ℓ.Prime] {Λ : Type} [CommRing Λ] [Algebra ℤ_[ℓ] Λ]

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`.
`Ψ_G : Z^spec(G, Λ) → Z(G(E), Λ)`, the spectral-to-geometric map followed by restriction of
the centre along `j_!` (FS Definition IX.7.1). Requires `|π₀ Z(G)|` invertible in `Λ`; the
excursion form without this condition is `PsiG.excursion`. -/
def PsiG (G : ReductiveGroup E) (c : ExcCoeff E ℓ Λ) (hZ : IsUnit (componentGroupOrder G : Λ)) :
    SpectralCentre G Λ →+* BernsteinCentre G Λ :=
  (restrictCentre (trivialStratumEmbedding G Λ)
    (trivialStratumEmbedding.fullyFaithful G Λ)).comp (spectralToGeometric G c hZ)

/-- `Ψ_G^b : Z^spec(G, Λ) → Z(G_b(E), Λ)`, the spectral-to-geometric map followed by
restriction of the centre along the fully faithful stratum embedding (FS Definition IX.7.1).
API item of `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`. -/
def PsiGb (G : ReductiveGroup E) (b : KottwitzSet G) (c : ExcCoeff E ℓ Λ)
    (hZ : IsUnit (componentGroupOrder G : Λ)) :
    SpectralCentre G Λ →+* BernsteinCentre (sigmaCentralizer G b) Λ :=
  (restrictCentre (stratumEmbedding G b Λ)
    (stratumEmbedding.fullyFaithful G b Λ)).comp (spectralToGeometric G c hZ)

/-- The excursion form of `Ψ_G`: restriction along `j_!` of the excursion action; no
condition on `|π₀ Z(G)|`. -/
def PsiG.excursion (G : ReductiveGroup E) (c : ExcCoeff E ℓ Λ) :
    ExcursionAlgebra G Λ →+* BernsteinCentre G Λ :=
  (restrictCentre (trivialStratumEmbedding G Λ)
    (trivialStratumEmbedding.fullyFaithful G Λ)).comp (excursionToGeometric G c)

/-- `PsiGb.excursion`: restriction of the excursion action to the `b`-stratum, defined even
when `ℓ` divides `|π₀ Z(G)|` (FS proof of IX.7.2). API item of
`ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`. -/
def PsiGb.excursion (G : ReductiveGroup E) (b : KottwitzSet G) (c : ExcCoeff E ℓ Λ) :
    ExcursionAlgebra G Λ →+* BernsteinCentre (sigmaCentralizer G b) Λ :=
  (restrictCentre (stratumEmbedding G b Λ)
    (stratumEmbedding.fullyFaithful G b Λ)).comp (excursionToGeometric G c)

/-- Under the centre-order condition, `PsiGb.excursion` is `Ψ_G^b` composed with the
canonical map from excursion operators to spectral functions. -/
lemma PsiGb.excursion_eq_comp (G : ReductiveGroup E) (b : KottwitzSet G)
    (c : ExcCoeff E ℓ Λ) (hZ : IsUnit (componentGroupOrder G : Λ)) :
    PsiGb.excursion G b c = (PsiGb G b c hZ).comp (excursionToSpectral G Λ) := by
  sorry

/-- `PsiGb.basepoint`: `Ψ_G^1 = Ψ_G`, after the identification `D(G_1(E), Λ) ≌ D(G(E), Λ)`.
API item of `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`. -/
lemma PsiGb.basepoint (G : ReductiveGroup E) (c : ExcCoeff E ℓ Λ)
    (hZ : IsUnit (componentGroupOrder G : Λ)) :
    PsiGb G 1 c hZ = (restrictCentre (sigmaCentralizerOneEquiv G Λ).functor
      (sigmaCentralizerOneEquiv G Λ).fullyFaithfulFunctor).comp (PsiG G c hZ) := by
  sorry

/-- `PsiGb.embedding_independent`: any fully faithful additive left adjoint of `i_b^*`
induces the same central action. API item of
`ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`. -/
lemma PsiGb.embedding_independent (G : ReductiveGroup E) (b : KottwitzSet G)
    (c : ExcCoeff E ℓ Λ) (hZ : IsUnit (componentGroupOrder G : Λ))
    (F : SmoothDerivedCat (sigmaCentralizer G b) Λ ⥤ LisseSheafCat G Λ)
    (hF : F.FullyFaithful) [F.Additive] (adj : F ⊣ stratumRestriction G b Λ) :
    (restrictCentre F hF).comp (spectralToGeometric G c hZ) = PsiGb G b c hZ := by
  sorry

-- PsiGb.basepoint_test: at b = 1, Ψ_G^b of any spectral function is Ψ_G of it.
example (G : ReductiveGroup E) (c : ExcCoeff E ℓ Λ) (hZ : IsUnit (componentGroupOrder G : Λ))
    (z : SpectralCentre G Λ) (X : SmoothDerivedCat (sigmaCentralizer G 1) Λ) :
    (sigmaCentralizerOneEquiv G Λ).functor.map ((PsiGb G 1 c hZ z).app X) =
      (PsiG G c hZ z).app ((sigmaCentralizerOneEquiv G Λ).functor.obj X) := by
  rw [PsiGb.basepoint, RingHom.comp_apply, restrictCentre_map]

-- PsiG.one_test: the spectral constant 1 acts as the identity on every object.
example (G : ReductiveGroup E) (c : ExcCoeff E ℓ Λ) (hZ : IsUnit (componentGroupOrder G : Λ))
    (X : SmoothDerivedCat G Λ) : (PsiG G c hZ 1).app X = 𝟙 X := by
  rw [map_one]
  rfl

-- PsiGb.excursion_test: for SL_ℓ (ℓ divides |π₀ Z| = ℓ) the excursion map is still central.
example [CharZero E] [Nontrivial Λ] [CharP Λ ℓ] (c : ExcCoeff E ℓ Λ)
    (b : KottwitzSet (ReductiveGroup.SL E ℓ)) (z : ExcursionAlgebra (ReductiveGroup.SL E ℓ) Λ)
    {X Y : SmoothDerivedCat (sigmaCentralizer (ReductiveGroup.SL E ℓ) b) Λ} (f : X ⟶ Y) :
    ¬ IsUnit (componentGroupOrder (ReductiveGroup.SL E ℓ) : Λ) ∧
      f ≫ (PsiGb.excursion _ b c z).app Y = (PsiGb.excursion _ b c z).app X ≫ f := by
  refine ⟨?_, (PsiGb.excursion _ b c z).naturality f⟩
  rw [componentGroupOrder_SL ℓ (Fact.out : ℓ.Prime).pos, CharP.cast_eq_zero]
  exact not_isUnit_zero

end StratumMaps

/-! ### ES7:parabolic/twisted-levi-inclusion — algebraic core

The pointwise formula `cφ(w) = t^{deg w} · j(φ(w))` for abstract groups. The lemmas carry the
hypotheses the cocycle identity needs (invariance and centrality of `t`, equivariance of
`j`), so none of them is a statement about arbitrary maps without its hypotheses. -/

section TwistedCocycles

variable {W M H : Type*} [Group W] [Group M] [Group H]

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion`.
The twisted inclusion of Levi cocycles on points: for the degree `deg : W → ℤ` (written
multiplicatively), the pinned inclusion `j : M →* H` and `t ∈ H`,
`cφ(w) = t^{deg w} · j(φ(w))` (FS §IX.7.1, p. 334). For the dual groups,
`t = (2ρ_Ĝ − 2ρ_M̂)(√q)` and this is `twistedLeviInclusion`. Continuity on finite-inertia
charts and the scheme structure of `Z¹(W_E, ·)` are not encoded. -/
def cocycleMap (degree : W →* Multiplicative ℤ) (j : M →* H) (t : H) (φ : W → M) : W → H :=
  fun w => t ^ (Multiplicative.toAdd (degree w)) * j (φ w)

namespace cocycleMap

/-- `cocycleMap.isCocycle`: if `j` is equivariant, `t` is invariant and centralizes `j(M)`,
then `cφ` is a cocycle: `cφ(wv) = cφ(w) · w(cφ(v))` and `cφ(1) = 1`. Invariance and
centrality are both needed. -/
lemma isCocycle (degree : W →* Multiplicative ℤ) (j : M →* H)
    (α : W →* MulAut H) (β : W →* MulAut M) (t : H) (φ : W → M)
    (equivariant : ∀ w m, j (β w m) = α w (j m))
    (invariant : ∀ w, α w t = t)
    (centralizes : ∀ m, t * j m = j m * t)
    (cocycle : ∀ w v, φ (w * v) = φ w * β w (φ v))
    (at_one : φ 1 = 1) :
    (∀ w v, cocycleMap degree j t φ (w * v) =
      cocycleMap degree j t φ w * α w (cocycleMap degree j t φ v)) ∧
    cocycleMap degree j t φ 1 = 1 := by
  refine ⟨fun w v => ?_, by simp [cocycleMap, at_one]⟩
  have hc : Commute (t ^ Multiplicative.toAdd (degree v)) (j (φ w)) :=
    (Commute.zpow_left (centralizes (φ w)) _)
  simp only [cocycleMap, map_mul, toAdd_mul, zpow_add, cocycle, equivariant, map_zpow,
    invariant]
  rw [mul_assoc, ← mul_assoc _ (j (φ w)), hc.eq]
  simp only [mul_assoc]

/-- `cocycleMap.degree_zero`: if `deg(w) = 0` then `cφ(w) = j(φ(w))`. -/
@[simp]
lemma degree_zero (degree : W →* Multiplicative ℤ) (j : M →* H)
    (t : H) (φ : W → M) (w : W) (h : degree w = 1) :
    cocycleMap degree j t φ w = j (φ w) := by
  simp [cocycleMap, h]

/-- `cocycleMap.basicCase`: if `t = 1` (the case `M̂ = Ĝ`) then `cφ = j ∘ φ`. -/
lemma basicCase (degree : W →* Multiplicative ℤ) (j : M →* H) (φ : W → M) :
    cocycleMap degree j 1 φ = fun w => j (φ w) := by
  funext w
  simp [cocycleMap]

/-- `cocycleMap.conjugation`: conjugating the cocycle `φ` by `m` (i.e.
`w ↦ m φ(w) w(m)⁻¹`) conjugates `cφ` by `j(m)`. Base change in the coefficients is
`cocycleMap.baseChange`. -/
lemma conjugation (degree : W →* Multiplicative ℤ) (j : M →* H)
    (α : W →* MulAut H) (β : W →* MulAut M) (t : H) (φ : W → M) (m : M)
    (equivariant : ∀ w x, j (β w x) = α w (j x))
    (centralizes : ∀ x, t * j x = j x * t) :
    cocycleMap degree j t (fun w => m * φ w * (β w m)⁻¹) =
      fun w => j m * cocycleMap degree j t φ w * (α w (j m))⁻¹ := by
  funext w
  have hc : Commute (t ^ Multiplicative.toAdd (degree w)) (j m) :=
    (Commute.zpow_left (centralizes m) _)
  simp only [cocycleMap, map_mul, map_inv, equivariant]
  rw [← mul_assoc, ← mul_assoc, hc.eq]
  simp only [mul_assoc]

/-- Base change: homomorphisms compatible with the inclusions carry `cφ` to the twisted
image of the transported cocycle, with the transported `t`. -/
lemma baseChange {M' H' : Type*} [Group M'] [Group H'] (degree : W →* Multiplicative ℤ)
    (j : M →* H) (j' : M' →* H') (fM : M →* M') (fH : H →* H') (t : H)
    (hj : ∀ m, fH (j m) = j' (fM m)) (φ : W → M) :
    (fun w => fH (cocycleMap degree j t φ w)) =
      cocycleMap degree j' (fH t) (fun w => fM (φ w)) := by
  funext w
  simp [cocycleMap, map_mul, map_zpow, hj]

end cocycleMap

end TwistedCocycles

/-! ### ES7:parabolic/twisted-levi-inclusion — dual groups -/

section DualGroups

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]

/-- Points `Ĝ(A)` of the Langlands dual group of `G` over a commutative ring `A`, with its
pinning (owned by `GeometricSatakeAndFusion:GS4:integral-dual-group` and
`ReductiveGroupsPartII:RG2.5`). -/
def DualGroupPoints (G : ReductiveGroup E) (A : Type) [CommRing A] : Type := sorry

instance (G : ReductiveGroup E) (A : Type) [CommRing A] : Group (DualGroupPoints G A) := sorry

/-- The usual pinned action of `W_E` on `Ĝ(A)`, through a finite quotient (RG2.5). -/
def dualWeilAction (G : ReductiveGroup E) (A : Type) [CommRing A] :
    WeilGroup E →* MulAut (DualGroupPoints G A) := sorry

/-- Functoriality of `Ĝ(A)` in the ring `A` (GS4). -/
def DualGroupPoints.map (G : ReductiveGroup E) {A A' : Type} [CommRing A] [CommRing A']
    (f : A →+* A') : DualGroupPoints G A →* DualGroupPoints G A' := sorry

variable (E) in
/-- The dual group of `GL_n` is `GL_n` (GS4). -/
def dualGLEquiv (n : ℕ) (A : Type) [CommRing A] :
    DualGroupPoints (ReductiveGroup.GL E n) A ≃* Matrix.GeneralLinearGroup (Fin n) A := sorry

/-- `GL_n` is split, so the pinned Weil action on its dual group is trivial. -/
lemma dualWeilAction_GL (n : ℕ) (A : Type) [CommRing A] (w : WeilGroup E) :
    dualWeilAction (ReductiveGroup.GL E n) A w = 1 := by
  sorry

/-- The pinned inclusion `j : M̂ = Ĝ_b ↪ Ĝ` of the dual Levi (`G_b` is an inner form of a
Levi `M` of `G`; GS4/RG2.5, `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`). -/
def dualLeviInclusion (G : ReductiveGroup E) (b : KottwitzSet G) (A : Type) [CommRing A] :
    DualGroupPoints (sigmaCentralizer G b) A →* DualGroupPoints G A := sorry

/-- The dual Levi inclusion is equivariant for the pinned Weil actions. -/
lemma dualLeviInclusion_equivariant (G : ReductiveGroup E) (b : KottwitzSet G) (A : Type)
    [CommRing A] (w : WeilGroup E) (m : DualGroupPoints (sigmaCentralizer G b) A) :
    dualLeviInclusion G b A (dualWeilAction (sigmaCentralizer G b) A w m) =
      dualWeilAction G A w (dualLeviInclusion G b A m) := by
  sorry

/-- `twistElement`: the value `(2ρ_Ĝ − 2ρ_M̂)(u) ∈ Ĝ(A)` of the cocharacter difference at a
unit `u ∈ Aˣ`; FS take `u = √q`. API item of
`ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion`. -/
def twistElement (G : ReductiveGroup E) (b : KottwitzSet G) {A : Type} [CommRing A]
    (u : Aˣ) : DualGroupPoints G A := sorry

/-- The cocharacter difference is Weil invariant, hence so is `t`. -/
lemma twistElement_invariant (G : ReductiveGroup E) (b : KottwitzSet G) {A : Type}
    [CommRing A] (u : Aˣ) (w : WeilGroup E) :
    dualWeilAction G A w (twistElement G b u) = twistElement G b u := by
  sorry

/-- The cocharacter difference is central in `M̂`, hence `t` centralizes `j(M̂)`. -/
lemma twistElement_central (G : ReductiveGroup E) (b : KottwitzSet G) {A : Type}
    [CommRing A] (u : Aˣ) (m : DualGroupPoints (sigmaCentralizer G b) A) :
    twistElement G b u * dualLeviInclusion G b A m =
      dualLeviInclusion G b A m * twistElement G b u := by
  sorry

/-- Acceptance of `ES7:parabolic/twisted-levi-inclusion`: for a basic stratum `M̂ = Ĝ`, so
`t = 1`. -/
lemma twistElement_basic (G : ReductiveGroup E) (b₀ : BasicKottwitzSet G) {A : Type}
    [CommRing A] (u : Aˣ) : twistElement G b₀.val u = 1 := by
  sorry

/-- A cocharacter takes the value `1` at `u = 1`. -/
lemma twistElement_one (G : ReductiveGroup E) (b : KottwitzSet G) (A : Type) [CommRing A] :
    twistElement G b (1 : Aˣ) = 1 := by
  sorry

variable (E) in
/-- The class of `O ⊕ O(1)` in `B(GL_2)`, whose `σ`-centralizer is the diagonal torus
(`BunGAndNewtonStrata:BG1`). -/
def GL2TorusClass : KottwitzSet (ReductiveGroup.GL E 2) := sorry

/-- Acceptance of `ES7:parabolic/twisted-levi-inclusion`: for the upper Borel of `GL_2`,
`t = 2ρ(u) = diag(u, u⁻¹)`; at `u = √q` this is `diag(√q, 1/√q)`. -/
lemma twistElement_GL2 {A : Type} [CommRing A] (u : Aˣ) :
    ((dualGLEquiv E 2 A (twistElement (ReductiveGroup.GL E 2) (GL2TorusClass E) u) :
      Matrix.GeneralLinearGroup (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) =
      !![(u : A), 0; 0, ((u⁻¹ : Aˣ) : A)] := by
  sorry

/-- `twistedLeviInclusion`: the Satake inclusion `Z¹(W_E, M̂) → Z¹(W_E, Ĝ)` on `A`-points,
`φ ↦ (w ↦ t^{deg w} j(φ(w)))` with `t = (2ρ_Ĝ − 2ρ_M̂)(u)` and `deg` sending geometric
Frobenius to `1`; FS use `u = √q`. -/
def twistedLeviInclusion (G : ReductiveGroup E) (b : KottwitzSet G) {A : Type} [CommRing A]
    (u : Aˣ) :
    (WeilGroup E → DualGroupPoints (sigmaCentralizer G b) A) → (WeilGroup E → DualGroupPoints G A) :=
  cocycleMap (WeilGroup.degree E) (dualLeviInclusion G b A) (twistElement G b u)

/-- The twisted inclusion carries cocycles for the pinned action of `M̂` to cocycles for the
pinned action of `Ĝ`. -/
lemma twistedLeviInclusion_isCocycle (G : ReductiveGroup E) (b : KottwitzSet G) {A : Type}
    [CommRing A] (u : Aˣ) (φ : WeilGroup E → DualGroupPoints (sigmaCentralizer G b) A)
    (hφ : ∀ w v, φ (w * v) = φ w * dualWeilAction (sigmaCentralizer G b) A w (φ v))
    (h1 : φ 1 = 1) :
    (∀ w v, twistedLeviInclusion G b u φ (w * v) =
      twistedLeviInclusion G b u φ w * dualWeilAction G A w (twistedLeviInclusion G b u φ v)) ∧
    twistedLeviInclusion G b u φ 1 = 1 :=
  cocycleMap.isCocycle _ _ _ _ _ _ (dualLeviInclusion_equivariant G b A)
    (twistElement_invariant G b u) (twistElement_central G b u) hφ h1

/-- The `Λ`-points of the parameter space `Z¹(W_E, Ĝ)`: continuous 1-cocycles for the
pinned action (owned by `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`). -/
def ParameterPoints (G : ReductiveGroup E) (Λ : Type) [CommRing Λ] : Type := sorry

/-- The underlying cocycle `W_E → Ĝ(Λ)` of a parameter point. -/
def ParameterPoints.cocycle {G : ReductiveGroup E} {Λ : Type} [CommRing Λ] :
    ParameterPoints G Λ → WeilGroup E → DualGroupPoints G Λ := sorry

/-- A parameter point is determined by its cocycle, which satisfies the cocycle identity. -/
lemma ParameterPoints.cocycle_spec {G : ReductiveGroup E} {Λ : Type} [CommRing Λ] :
    Function.Injective (ParameterPoints.cocycle (G := G) (Λ := Λ)) ∧
    ∀ (φ : ParameterPoints G Λ) (w v : WeilGroup E),
      φ.cocycle (w * v) = φ.cocycle w * dualWeilAction G Λ w (φ.cocycle v) := by
  sorry

/-- Evaluation of a spectral function at a `Λ`-point of `Z¹(W_E, Ĝ)` (LP0). -/
def spectralEval (G : ReductiveGroup E) {Λ : Type} [CommRing Λ] (f : SpectralCentre G Λ)
    (φ : ParameterPoints G Λ) : Λ := sorry

/-- The twisted inclusion on parameter points (continuity of `twistedLeviInclusion`). -/
def ParameterPoints.twistedInclusion (G : ReductiveGroup E) (b : KottwitzSet G) {Λ : Type}
    [CommRing Λ] (u : Λˣ) : ParameterPoints (sigmaCentralizer G b) Λ → ParameterPoints G Λ :=
  sorry

/-- `ParameterPoints.twistedInclusion` has cocycle `twistedLeviInclusion`. -/
lemma ParameterPoints.twistedInclusion_cocycle (G : ReductiveGroup E) (b : KottwitzSet G)
    {Λ : Type} [CommRing Λ] (u : Λˣ) (φ : ParameterPoints (sigmaCentralizer G b) Λ) :
    (ParameterPoints.twistedInclusion G b u φ).cocycle = twistedLeviInclusion G b u φ.cocycle := by
  sorry

/-- `twistedPullback`: the map `Z^spec(G, Λ) → Z^spec(G_b, Λ)` induced by the twisted
inclusion (FS §IX.7.1; here with `t = (2ρ_Ĝ − 2ρ_M̂)(u)`, FS take `u = √q`). -/
def twistedPullback (G : ReductiveGroup E) (b : KottwitzSet G) (Λ : Type) [CommRing Λ]
    (u : Λˣ) : SpectralCentre G Λ →+* SpectralCentre (sigmaCentralizer G b) Λ := sorry

/-- `twistedPullback` is pullback of invariant functions along `twistedLeviInclusion`. -/
lemma twistedPullback_eval (G : ReductiveGroup E) (b : KottwitzSet G) {Λ : Type} [CommRing Λ]
    (u : Λˣ) (f : SpectralCentre G Λ) (φ : ParameterPoints (sigmaCentralizer G b) Λ) :
    spectralEval _ (twistedPullback G b Λ u f) φ =
      spectralEval G f (ParameterPoints.twistedInclusion G b u φ) := by
  sorry

/-- The map of excursion algebras `Exc(W_E, Ĝ) → Exc(W_E, Ĝ_b)` restricting excursion data
along the twisted inclusion `M̂ ⋊ W_E → Ĝ ⋊ W_E` (ES1). -/
def twistedExcursionPullback (G : ReductiveGroup E) (b : KottwitzSet G) (Λ : Type)
    [CommRing Λ] (u : Λˣ) :
    ExcursionAlgebra G Λ →+* ExcursionAlgebra (sigmaCentralizer G b) Λ := sorry

-- cocycleMap.basic_test: for a basic stratum (M̂ = Ĝ) the map is the plain inclusion j ∘ φ.
example (G : ReductiveGroup E) (b₀ : BasicKottwitzSet G) {A : Type} [CommRing A] (u : Aˣ)
    (φ : WeilGroup E → DualGroupPoints (sigmaCentralizer G b₀.val) A) :
    twistedLeviInclusion G b₀.val u φ = fun w => dualLeviInclusion G b₀.val A (φ w) := by
  rw [twistedLeviInclusion, twistElement_basic]
  exact cocycleMap.basicCase _ _ _

-- cocycleMap.GL2_test: upper Borel of GL₂, trivial φ, geometric Frobenius ↦ diag(u, u⁻¹).
example {A : Type} [CommRing A] (u : Aˣ) :
    ((dualGLEquiv E 2 A (twistedLeviInclusion (ReductiveGroup.GL E 2) (GL2TorusClass E) u
      (fun _ => 1) (WeilGroup.geomFrob E)) : Matrix.GeneralLinearGroup (Fin 2) A) :
        Matrix (Fin 2) (Fin 2) A) = !![(u : A), 0; 0, ((u⁻¹ : Aˣ) : A)] := by
  simp [twistedLeviInclusion, cocycleMap, WeilGroup.degree_geomFrob, twistElement_GL2]

-- cocycleMap.inertia_test: on inertia (degree zero) the twisting factor is 1.
example (G : ReductiveGroup E) (b : KottwitzSet G) {A : Type} [CommRing A] (u : Aˣ)
    (φ : WeilGroup E → DualGroupPoints (sigmaCentralizer G b) A) (w : WeilGroup E)
    (hw : WeilGroup.degree E w = 1) :
    twistedLeviInclusion G b u φ w = dualLeviInclusion G b A (φ w) :=
  cocycleMap.degree_zero _ _ _ _ _ hw

-- cocycleMap.GL2_test: numerically, q = 9 and √q = 3 on the dual torus ℚˣ × ℚˣ.
example :
    let t : ℚˣ × ℚˣ :=
      (Units.mk0 (3 : ℚ) (by norm_num), Units.mk0 (1 / 3 : ℚ) (by norm_num))
    let out := cocycleMap (MonoidHom.id (Multiplicative ℤ))
      (MonoidHom.id (ℚˣ × ℚˣ)) t (fun _ => 1) (Multiplicative.ofAdd (1 : ℤ))
    ((out.1 : ℚ), (out.2 : ℚ)) = (3, 1 / 3) := by
  simp [cocycleMap]

end DualGroups

/-! ### ES7:parabolic — reductions, factorization and parabolic induction -/

section ParabolicTheorems

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]

/-- A square root of `q` in `Q̄_ℓ`. -/
noncomputable def qlBarSqrtQ (ℓ : ℕ) [Fact ℓ.Prime] (q : ℕ) : QlBar ℓ :=
  Classical.choose (IsAlgClosed.exists_pow_nat_eq (q : QlBar ℓ) two_pos)

/-- The coefficient ring `ℤ_ℓ[√q] ⊂ Q̄_ℓ` of FS IX.7. -/
noncomputable def integralSqrtQ (ℓ : ℕ) [Fact ℓ.Prime] (q : ℕ) : Subalgebra ℤ_[ℓ] (QlBar ℓ) :=
  Algebra.adjoin ℤ_[ℓ] {qlBarSqrtQ ℓ q}

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:parabolic/coefficient-reduction`.
`ℓ`-adic separatedness of the integral Bernstein centre: over `Λ = ℤ_ℓ[√q]` (with `ℓ ≠ p`),
an element of `Z(G(E), Λ) = lim_K Z(e_K H_Λ e_K)` whose image in `Z(G(E), Λ/ℓ^r)` vanishes
for every `r` is zero. Separatedness is asserted only for `ℤ_ℓ[√q]`. The reduction itself
(prove the triangle and the induction square over `ℤ_ℓ[√q]`, reduce modulo `ℓ^r`, extend
scalars from the universal action) needs base change of `Ψ` along `ℤ_ℓ[√q] → Λ`, which is not
stated here. -/
theorem coefficientReduction (G : ReductiveGroup E) (ℓ : ℕ) [Fact ℓ.Prime]
    (hℓ : ¬ ℓ ∣ residueCard E) (z : BernsteinCentre G (integralSqrtQ ℓ (residueCard E)))
    (hz : ∀ r : ℕ, bernsteinBaseChange G
      (Ideal.Quotient.mk (Ideal.span {((ℓ : integralSqrtQ ℓ (residueCard E))) ^ r})) z = 0) :
    z = 0 := by
  sorry

/-- The target `G ↪ G′` of a full z-embedding with torus quotient `C`, `H¹(E, C) = 1`,
`H¹(E, Z(G)) ≅ H¹(E, Z(G′))`, induced torus quotient and connected `Z(G′)`, for `E` of characteristic zero (Kaletha 2018 §5; owned by
`ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding`). -/
def zEmbeddingTarget [CharZero E] (G : ReductiveGroup E) : ReductiveGroup E := sorry

/-- The induced map `B(G) → B(G′)` (`BunGAndNewtonStrata:BG1`). -/
def zEmbeddingKottwitz [CharZero E] (G : ReductiveGroup E) :
    KottwitzSet G → KottwitzSet (zEmbeddingTarget G) := sorry

variable {ℓ : ℕ} [Fact ℓ.Prime] {Λ : Type} [CommRing Λ] [Algebra ℤ_[ℓ] Λ]

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction`.
(1) The basic case: for basic `b₀` the stratum map factors through the (untwisted, since
`t = 1`) Levi pullback, from the Hecke-equivariant identification `Bun_G ≃ Bun_{G_{b₀}}`;
(2) for E of characteristic zero and the z-embedding `G ↪ G′`, `B(G) → B(G′)` is injective and `Z(G′)` is connected. In equal characteristic no z-embedding exists when `Z(G)` is not smooth (packet source issue E2), so the carrier takes `[CharZero E]`.
Stated in the excursion form (no centre-order condition). Not stated: the fibre identity
`Bun_G ≃ Bun_{G′} ×_{Bun_C} {1}`, surjectivity `Z(G′)(E) → C(E)`, detection of the centre of
`G_b` by restrictions from `G′_{b′}`, and the choice of a basic `b₀` with `G_{b₀}` quasi-split
(no quasi-split carrier). -/
theorem basicCaseAndQuasisplitReduction (G : ReductiveGroup E) (c : ExcCoeff E ℓ Λ) :
    (∀ b₀ : BasicKottwitzSet G, PsiGb.excursion G b₀.val c =
      (PsiG.excursion (sigmaCentralizer G b₀.val) c).comp
        (twistedExcursionPullback G b₀.val Λ c.sqrtQUnit)) ∧
    (∀ [CharZero E], Function.Injective (zEmbeddingKottwitz G) ∧
      componentGroupOrder (zEmbeddingTarget G) = 1) := by
  sorry

/-- Cocharacters `μ` central in the Levi of the canonical parabolic `P_b` with dynamical
parabolic `P_b`, for quasi-split `G` with a fixed Borel (owned by `BunGAndNewtonStrata:BG1`
and `TauCeti.Cocharacter.parabolic`). -/
def AdaptedCocharacter (G : ReductiveGroup E) (b : KottwitzSet G) : Type u := sorry

/-- The class `b_N = b μ(π)^N` (FS proof of IX.7.2). -/
def unstableShift {G : ReductiveGroup E} (b : KottwitzSet G) (μ : AdaptedCocharacter G b)
    (N : ℕ) : KottwitzSet G := sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:parabolic/increasingly-unstable-sequence`.
For `b_N = b μ(π)^N`: `G_{b_N} = G_b`, and the stratum maps for `b` and `b_N` agree (as maps
into the same centre, hence the heterogeneous equality). Not stated (no Hecke-type carrier):
for each bounded Hecke type `V`, large `N` makes every self-modification of `E_{b_N}` of type
`V` preserve the Harder–Narasimhan reduction to `P_b`; `N` depends on `V`. -/
theorem increasinglyUnstableSequence (G : ReductiveGroup E) (b : KottwitzSet G)
    (μ : AdaptedCocharacter G b) (N : ℕ) (c : ExcCoeff E ℓ Λ) :
    sigmaCentralizer G (unstableShift b μ N) = sigmaCentralizer G b ∧
    HEq (PsiGb.excursion G (unstableShift b μ N) c) (PsiGb.excursion G b c) := by
  sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation`.
For every `b ∈ B(G)`, `Ψ_G^b = Ψ_{G_b} ∘ c_b^*` with `c_b` the twisted Levi inclusion
(FS Theorem IX.7.2): in the excursion form without condition, and in the spectral form
when `|π₀ Z(G)|` and `|π₀ Z(G_b)|` are invertible in `Λ`. -/
theorem constantTermComputation (G : ReductiveGroup E) (b : KottwitzSet G)
    (c : ExcCoeff E ℓ Λ) :
    PsiGb.excursion G b c = (PsiG.excursion (sigmaCentralizer G b) c).comp
        (twistedExcursionPullback G b Λ c.sqrtQUnit) ∧
    ∀ (hZ : IsUnit (componentGroupOrder G : Λ))
      (hZb : IsUnit (componentGroupOrder (sigmaCentralizer G b) : Λ)),
      PsiGb G b c hZ = (PsiG (sigmaCentralizer G b) c hZb).comp
        (twistedPullback G b Λ c.sqrtQUnit) := by
  sorry

/-! Parabolic induction carriers (owned by `SmoothRepresentationsOfLocalGroups:SR.2`,
`GeometricSatakeAndFusion:GS4:integral-dual-group`, `ReductiveGroupsPartII:RG2.5`). -/

/-- The pinned inclusion `M̂ ↪ Ĝ` for the Levi `M` of a parabolic `P`. -/
def parabolicDualLeviInclusion {G : ReductiveGroup E} (P : ParabolicSubgroup G) (A : Type)
    [CommRing A] : DualGroupPoints P.levi A →* DualGroupPoints G A := sorry

/-- `(2ρ_Ĝ − 2ρ_M̂)(u) ∈ Ĝ(A)` for the Levi of `P`. -/
def parabolicTwistElement {G : ReductiveGroup E} (P : ParabolicSubgroup G) {A : Type}
    [CommRing A] (u : Aˣ) : DualGroupPoints G A := sorry

/-- `leviPullback`: `Z^spec(G, Λ) → Z^spec(M, Λ)` along the twisted inclusion
`φ ↦ (w ↦ t^{deg w} j(φ w))`, `t = parabolicTwistElement P u`. -/
def leviPullback {G : ReductiveGroup E} (P : ParabolicSubgroup G) (Λ : Type) [CommRing Λ]
    (u : Λˣ) : SpectralCentre G Λ →+* SpectralCentre P.levi Λ := sorry

/-- The twisted Levi inclusion `Z¹(W_E, M̂) → Z¹(W_E, Ĝ)` on parameter points for the Levi
of `P`. -/
def ParameterPoints.leviInclusion {G : ReductiveGroup E} (P : ParabolicSubgroup G) {Λ : Type}
    [CommRing Λ] (u : Λˣ) : ParameterPoints P.levi Λ → ParameterPoints G Λ := sorry

/-- `ParameterPoints.leviInclusion` has cocycle `w ↦ t^{deg w} j(φ w)`. -/
lemma ParameterPoints.leviInclusion_cocycle {G : ReductiveGroup E} (P : ParabolicSubgroup G)
    {Λ : Type} [CommRing Λ] (u : Λˣ) (φ : ParameterPoints P.levi Λ) :
    (ParameterPoints.leviInclusion P u φ).cocycle =
      cocycleMap (WeilGroup.degree E) (parabolicDualLeviInclusion P Λ)
        (parabolicTwistElement P u) φ.cocycle := by
  sorry

/-- `leviPullback` is pullback of invariant functions along the twisted inclusion; at
`u = 1` it is the ordinary Levi pullback. -/
lemma leviPullback_eval {G : ReductiveGroup E} (P : ParabolicSubgroup G) {Λ : Type}
    [CommRing Λ] (u : Λˣ) (f : SpectralCentre G Λ) (φ : ParameterPoints P.levi Λ) :
    spectralEval _ (leviPullback P Λ u f) φ =
      spectralEval G f (ParameterPoints.leviInclusion P u φ) := by
  sorry

/-- The corresponding map of excursion algebras (ES1). -/
def leviExcursionPullback {G : ReductiveGroup E} (P : ParabolicSubgroup G) (Λ : Type)
    [CommRing Λ] (u : Λˣ) : ExcursionAlgebra G Λ →+* ExcursionAlgebra P.levi Λ := sorry

/-- Unnormalized parabolic induction `Ind_{P(E)}^{G(E)} : D(M(E), Λ) → D(G(E), Λ)` (SR.2). -/
def unnormalizedInduction {G : ReductiveGroup E} (P : ParabolicSubgroup G) (Λ : Type)
    [CommRing Λ] : SmoothDerivedCat P.levi Λ ⥤ SmoothDerivedCat G Λ := sorry

/-- The `ES5` semisimple parameter `φ_π : W_E → Ĝ(L)` of an irreducible smooth
`L`-representation, `L` algebraically closed (a cocycle, defined up to `Ĝ(L)`-conjugacy;
owned by `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`). -/
def semisimpleParameter (G : ReductiveGroup E) {L : Type} [Field L] [IsAlgClosed L]
    [Algebra ℤ_[ℓ] L] (c : ExcCoeff E ℓ L) (π : IrrSmoothRep G L) :
    WeilGroup E → DualGroupPoints G L := sorry

/-- Irreducible subquotients of `Ind_{P(E)}^{G(E)} σ`, as a carrier type with its map to
irreducible representations of `G(E)` (SR.2). -/
def InductionSubquotient {G : ReductiveGroup E} (P : ParabolicSubgroup G) (L : Type) [Field L]
    (σ : IrrSmoothRep P.levi L) : Type u := sorry

/-- An irreducible subquotient is an irreducible representation of `G(E)`. -/
def InductionSubquotient.toIrr {G : ReductiveGroup E} {P : ParabolicSubgroup G} {L : Type}
    [Field L] {σ : IrrSmoothRep P.levi L} : InductionSubquotient P L σ → IrrSmoothRep G L :=
  sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction`.
FS Corollary IX.7.3: the action of `z` on the unnormalized induction `Ind_P^G σ` is induced
by the action of the twisted Levi pullback of `z` on `σ`, in the excursion form (no
condition) and in the spectral form under the centre-order conditions. The parameter
consequence is `parabolicInduction_parameter`. The geometric normalization
`T_{μ⁻¹}(A)|Bun^1 = Ind σ (−d/2)[−d]` is a proof step, not stated. -/
theorem parabolicInduction {G : ReductiveGroup E} (P : ParabolicSubgroup G)
    (c : ExcCoeff E ℓ Λ) :
    (∀ (z : ExcursionAlgebra G Λ) (X : SmoothDerivedCat P.levi Λ),
      (PsiG.excursion G c z).app ((unnormalizedInduction P Λ).obj X) =
        (unnormalizedInduction P Λ).map
          ((PsiG.excursion P.levi c (leviExcursionPullback P Λ c.sqrtQUnit z)).app X)) ∧
    ∀ (hZ : IsUnit (componentGroupOrder G : Λ))
      (hZM : IsUnit (componentGroupOrder P.levi : Λ))
      (z : SpectralCentre G Λ) (X : SmoothDerivedCat P.levi Λ),
      (PsiG G c hZ z).app ((unnormalizedInduction P Λ).obj X) =
        (unnormalizedInduction P Λ).map
          ((PsiG P.levi c hZM (leviPullback P Λ c.sqrtQUnit z)).app X) := by
  sorry

/-- The parameter consequence of FS Corollary IX.7.3 (part of
`ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction`): over an
algebraically closed `L`, for irreducible `σ` and an irreducible subquotient `π'` of
`Ind_P^G σ`, `φ_{π'}` is `Ĝ(L)`-conjugate (as a cocycle) to `c_M φ_σ`. -/
theorem parabolicInduction_parameter {G : ReductiveGroup E} (P : ParabolicSubgroup G)
    {L : Type} [Field L] [IsAlgClosed L] [Algebra ℤ_[ℓ] L] (c : ExcCoeff E ℓ L)
    (σ : IrrSmoothRep P.levi L) (π' : InductionSubquotient P L σ) :
    ∃ g : DualGroupPoints G L, ∀ w : WeilGroup E,
      semisimpleParameter G c π'.toIrr w =
        g * cocycleMap (WeilGroup.degree E) (parabolicDualLeviInclusion P L)
          (parabolicTwistElement P c.sqrtQUnit) (semisimpleParameter P.levi c σ) w *
          (dualWeilAction G L w g)⁻¹ := by
  sorry

/-- Twist by `δ_P^{1/2}` on `D(M(E), Λ)`, where `δ_P(m) = |det(Ad(m)|Lie U_P)|_E` and
`δ_P^{1/2}` takes values in powers of `u = √q` (SR.2). -/
def modulusHalfTwist {G : ReductiveGroup E} (P : ParabolicSubgroup G) (Λ : Type) [CommRing Λ]
    (u : Λˣ) : SmoothDerivedCat P.levi Λ ⥤ SmoothDerivedCat P.levi Λ := sorry

/-- Normalized induction `i_P^G τ = Ind_P^G(δ_P^{1/2} τ)`. -/
def normalizedInduction {G : ReductiveGroup E} (P : ParabolicSubgroup G) (Λ : Type)
    [CommRing Λ] (u : Λˣ) : SmoothDerivedCat P.levi Λ ⥤ SmoothDerivedCat G Λ :=
  modulusHalfTwist P Λ u ⋙ unnormalizedInduction P Λ

/-- The parameter of the character `δ_P^{1/2}` of `M(E)` under geometric reciprocity (a
cocycle with values in `Z(M̂)(A)`; ES6 twisting). -/
def modulusHalfParameter {G : ReductiveGroup E} (P : ParabolicSubgroup G) {A : Type}
    [CommRing A] (u : Aˣ) : WeilGroup E → DualGroupPoints P.levi A := sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`.
(1) Under geometric reciprocity the twist by `δ_P^{1/2}` has cocycle `c⁻¹`,
`c(w) = (2ρ_Ĝ − 2ρ_M̂)(√q)^{deg w}`, so `c · φ_{δ_P^{1/2} τ} = j φ_τ`; (2) hence the centre acts
on normalized induction through the ORDINARY Levi pullback (`u = 1`), in the excursion form
and, under the centre-order conditions, in the spectral form. The geometric `(−d/2)[−d]` of
IX.7.3 is a Satake normalization, not a second modulus factor (see the numerical checks). -/
theorem normalisedInductionDictionary {G : ReductiveGroup E} (P : ParabolicSubgroup G)
    (c : ExcCoeff E ℓ Λ) :
    (∀ w : WeilGroup E, parabolicDualLeviInclusion P Λ (modulusHalfParameter P c.sqrtQUnit w) =
      (parabolicTwistElement P c.sqrtQUnit ^ Multiplicative.toAdd (WeilGroup.degree E w))⁻¹) ∧
    (∀ (z : ExcursionAlgebra G Λ) (X : SmoothDerivedCat P.levi Λ),
      (PsiG.excursion G c z).app ((normalizedInduction P Λ c.sqrtQUnit).obj X) =
        (normalizedInduction P Λ c.sqrtQUnit).map
          ((PsiG.excursion P.levi c (leviExcursionPullback P Λ 1 z)).app X)) ∧
    ∀ (hZ : IsUnit (componentGroupOrder G : Λ))
      (hZM : IsUnit (componentGroupOrder P.levi : Λ))
      (z : SpectralCentre G Λ) (X : SmoothDerivedCat P.levi Λ),
      (PsiG G c hZ z).app ((normalizedInduction P Λ c.sqrtQUnit).obj X) =
        (normalizedInduction P Λ c.sqrtQUnit).map
          ((PsiG P.levi c hZM (leviPullback P Λ 1 z)).app X) := by
  sorry

end ParabolicTheorems

/-! Numerical checks of the GL₂ normalisations (`q = 9`, `√q = 3`, upper Borel, geometric
Frobenius of degree one), on the dual torus `ℚˣ × ℚˣ`. -/

section NormalizationChecks

/-- The scalar by which geometric Frobenius acts on the half Tate twist `Λ(m/2)`, given
`u = √q`: `Λ(1)` has geometric Frobenius `q⁻¹`, so `Λ(m/2)` has `u^{-m}`. -/
def halfTateTwistFrob {Λ : Type} [CommRing Λ] (u : Λˣ) (m : ℤ) : Λˣ := u ^ (-m)

/-- The dual-torus value `2ρ(3) = diag(3, 1/3)` used below. -/
def gl2TwistQ : ℚˣ × ℚˣ := (Units.mk0 (3 : ℚ) (by norm_num), Units.mk0 (1 / 3 : ℚ) (by norm_num))

-- normalised-induction-dictionary acceptance: the unnormalized trivial principal series has
-- Frobenius diag(√q, 1/√q) = diag(3, 1/3).
example :
    let out := cocycleMap (MonoidHom.id (Multiplicative ℤ)) (MonoidHom.id (ℚˣ × ℚˣ)) gl2TwistQ
      (fun _ => 1) (Multiplicative.ofAdd (1 : ℤ))
    ((out.1 : ℚ), (out.2 : ℚ)) = (3, 1 / 3) := by
  simp [cocycleMap, gl2TwistQ]

-- normalised-induction-dictionary acceptance: δ_B^{1/2} has parameter t^{-deg}, so the
-- normalized trivial principal series has Frobenius c · φ_{δ^{1/2}} = diag(1, 1).
example :
    let out := cocycleMap (MonoidHom.id (Multiplicative ℤ)) (MonoidHom.id (ℚˣ × ℚˣ)) gl2TwistQ
      (fun w => gl2TwistQ⁻¹ ^ Multiplicative.toAdd w) (Multiplicative.ofAdd (1 : ℤ))
    ((out.1 : ℚ), (out.2 : ℚ)) = (1, 1) := by
  simp [cocycleMap]

-- normalised-induction-dictionary acceptance: δ_B(diag(ϖ, 1)) = |ϖ| = 1/9, whose square root
-- 1/3 is the first entry of t⁻¹ = diag(1/3, 3).
example : ((1 : ℚ) / 9) = (((gl2TwistQ⁻¹).1 : ℚ)) ^ 2 := by
  simp [gl2TwistQ]
  norm_num

-- normalised-induction-dictionary acceptance: the source shift (−d/2)[−d] with d = 1 gives the
-- Frobenius factor 3 = √q (the first entry of t); the reversed (+d/2)[+d] would give 1/3.
example :
    ((halfTateTwistFrob (Units.mk0 (3 : ℚ) (by norm_num)) (-1) : ℚˣ) : ℚ) = 3 ∧
      ((halfTateTwistFrob (Units.mk0 (3 : ℚ) (by norm_num)) 1 : ℚˣ) : ℚ) ≠ 3 := by
  simp [halfTateTwistFrob]
  norm_num

end NormalizationChecks

/-! ### ES7:GLn-comparison — linear algebra of the two-leg excursion

The two-operation package of the reviewed node: a finite-dimensional representation `ρ` of a
group `W` over a field `k`, creation `α = a · coev` and annihilation `β = b · ev`. -/

section TwoLeg

variable {k W V : Type*} [Field k] [Group W] [AddCommGroup V] [Module k V]
  [FiniteDimensional k V]

/-- The excursion scalar of the package `(ρ, a · coev, b · ev)` at `(γ₁, γ₂)`:
`b · ev ∘ (ρ(γ₁) ⊗ ρ^∨(γ₂)) ∘ (a · coev)`, with Mathlib's `coevaluation` and
`contractRight`. -/
noncomputable def twoLegExcursionScalar (ρ : Representation k W V) (a b : k) (γ₁ γ₂ : W) : k :=
  b * contractRight k V (TensorProduct.map (ρ γ₁) (ρ.dual γ₂) (a • coevaluation k V 1))

/-- `ev ∘ (ρ(γ₁) ⊗ ρ^∨(γ₂)) ∘ coev = tr ρ(γ₁ γ₂⁻¹)`: the dual action introduces `γ₂⁻¹`. -/
lemma twoLegTrace (ρ : Representation k W V) (γ₁ γ₂ : W) :
    contractRight k V (TensorProduct.map (ρ γ₁) (ρ.dual γ₂) (coevaluation k V 1)) =
      ρ.character (γ₁ * γ₂⁻¹) := by
  sorry

/-- In characteristic zero, `a · b · n = n` with `n ≠ 0` forces `a · b = 1`. -/
lemma twoLegScalar [CharZero k] (a b : k) (n : ℕ) (hn : n ≠ 0) (h : a * b * n = n) :
    a * b = 1 := by
  have hn' : (n : k) ≠ 0 := Nat.cast_ne_zero.mpr hn
  exact mul_right_cancel₀ hn' (by rw [h, one_mul])

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-leg-excursion-is-a-trace`.
For an abstract two-operation package over a field of characteristic zero (`ρ`
finite-dimensional of dimension `n > 0`, creation `a · coev`, annihilation `b · ev`) whose
identity-tuple excursion is `n`, the excursion scalar at `(γ₁, γ₂)` is `tr ρ(γ₁ γ₂⁻¹)`. Only
the product `a · b = 1` is determined. That the realized maps are scalar multiples of
`coev`/`ev` (Schur, `ρ` irreducible) is the input from either characteristic's
realization. -/
theorem twoLegExcursionIsATrace [CharZero k] (ρ : Representation k W V) (a b : k)
    (hpos : 0 < Module.finrank k V)
    (hid : twoLegExcursionScalar ρ a b 1 1 = Module.finrank k V) (γ₁ γ₂ : W) :
    twoLegExcursionScalar ρ a b γ₁ γ₂ = ρ.character (γ₁ * γ₂⁻¹) := by
  have key : ∀ g₁ g₂ : W, twoLegExcursionScalar ρ a b g₁ g₂ = a * b * ρ.character (g₁ * g₂⁻¹) := by
    intro g₁ g₂
    rw [twoLegExcursionScalar, LinearMap.map_smul, LinearMap.map_smul, smul_eq_mul, twoLegTrace]
    ring
  have hab : a * b = 1 := by
    rw [key, mul_inv_cancel, Representation.char_one] at hid
    exact twoLegScalar a b _ hpos.ne' hid
  rw [key, hab, one_mul]

-- two-leg-excursion-is-a-trace acceptance: at (γ, γ) the result is n.
example [CharZero k] (ρ : Representation k W V) (a b : k) (hpos : 0 < Module.finrank k V)
    (hid : twoLegExcursionScalar ρ a b 1 1 = Module.finrank k V) (γ : W) :
    twoLegExcursionScalar ρ a b γ γ = Module.finrank k V := by
  rw [twoLegExcursionIsATrace ρ a b hpos hid, mul_inv_cancel, Representation.char_one]

end TwoLeg

section TwoLegMatrix

variable {k n : Type*} [CommRing k] [Fintype n] [DecidableEq n]

/-- Coevaluation/evaluation in a basis: `∑_{i,j} A_{ij} B_{ji} = tr(A B)`, with `B` the
matrix of the dual (inverse) action. -/
lemma two_leg_trace_algebra (A B : Matrix n n k) :
    (∑ i, ∑ j, A i j * B j i) = Matrix.trace (A * B) := by
  simp [Matrix.trace, Matrix.mul_apply]

-- two-leg-excursion-is-a-trace acceptance: the identity tuple gives n = 2 (not 1).
example : Matrix.trace ((1 : Matrix (Fin 2) (Fin 2) ℚ) * 1) = 2 := by
  simp [Matrix.trace_one]

-- two-leg-excursion-is-a-trace acceptance: one-dimensional ρ = χ gives χ(γ₁)/χ(γ₂).
example (a b : ℚ) (hb : b ≠ 0) :
    Matrix.trace ((fun (_ _ : Fin 1) => a) * (fun (_ _ : Fin 1) => b⁻¹)) = a / b := by
  simp [Matrix.trace, Matrix.diag, div_eq_mul_inv]

-- two-leg-excursion-is-a-trace acceptance: traces do not see a nilpotent off-diagonal part.
example : Matrix.trace (fun i j : Fin 2 => if i = j then (1 : ℚ) else if i < j then 1 else 0) =
    Matrix.trace (1 : Matrix (Fin 2) (Fin 2) ℚ) := by
  simp [Matrix.trace, Matrix.diag]

-- two-leg-excursion-is-a-trace acceptance: no mod-ℓ cancellation when ℓ divides n
-- (in ZMod 2 with n = 2, a · b · n = n holds with a · b ≠ 1).
example : (0 : ZMod 2) * 0 * 2 = 2 ∧ (0 : ZMod 2) * 0 ≠ 1 := by
  decide

end TwoLegMatrix

/-! ### ES7:GLn-comparison/trace-determines-semisimplification -/

section TraceDetermines

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/trace-determines-semisimplification`.
Finite-dimensional semisimple representations of an arbitrary group `W` over a field of
characteristic zero with equal characters are isomorphic (no finiteness assumption on `W`;
continuity is inherited from the inputs and not encoded). -/
theorem traceDeterminesSemisimplification {k W V V' : Type*} [Field k] [CharZero k] [Group W]
    [AddCommGroup V] [Module k V] [FiniteDimensional k V]
    [AddCommGroup V'] [Module k V'] [FiniteDimensional k V']
    (ρ : Representation k W V) (ρ' : Representation k W V')
    (hρ : ρ.IsSemisimpleRepresentation) (hρ' : ρ'.IsSemisimpleRepresentation)
    (h : ρ.character = ρ'.character) : Nonempty (ρ.Equiv ρ') := by
  sorry

/-- The unipotent matrix `[[1, 1], [0, 1]]` as a unit of `End(ℚ²)`. -/
noncomputable def unipotentGen : (Module.End ℚ (Fin 2 → ℚ))ˣ where
  val := Matrix.toLin' !![1, 1; 0, 1]
  inv := Matrix.toLin' !![1, -1; 0, 1]
  val_inv := by sorry
  inv_val := by sorry

/-- The representation `n ↦ [[1, n], [0, 1]]` of `ℤ` on `ℚ²`: nontrivial unipotent part. -/
noncomputable def unipotentRep : Representation ℚ (Multiplicative ℤ) (Fin 2 → ℚ) :=
  (Units.coeHom _).comp (zpowersHom _ unipotentGen)

-- trace-determines-semisimplification acceptance: a representation with nontrivial
-- unipotent part has the traces of its semisimplification (here trivial) without being
-- isomorphic to it, so semisimplicity is needed and N is not determined.
example : unipotentRep.character =
      (Representation.trivial ℚ (Multiplicative ℤ) (Fin 2 → ℚ)).character ∧
    IsEmpty (unipotentRep.Equiv (Representation.trivial ℚ (Multiplicative ℤ) (Fin 2 → ℚ))) := by
  sorry

end TraceDetermines

/-! ### ES7:GLn-comparison — parameters for GL_n -/

section GLnParameters

open scoped TensorProduct

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]
variable {ℓ : ℕ} [Fact ℓ.Prime]

/-- The semisimple excursion parameter of an irreducible smooth `Q̄_ℓ`-representation `π` of
`GL_n(E)`, composed with the standard representation: an `n`-dimensional representation of
`W_E` (owned by
`ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`;
formed with the `√q` of `c`; continuity not encoded). -/
def excursionParameter (c : ExcCoeff E ℓ (QlBar ℓ)) {n : ℕ}
    (π : IrrSmoothRep (ReductiveGroup.GL E n) (QlBar ℓ)) : FDRep (QlBar ℓ) (WeilGroup E) :=
  sorry

/-- The Weil-group part of the classical Weil–Deligne parameter of `π` (owned by
`EndoscopicTransferAndUnitaryTraceComparison:ET.6` in characteristic zero and
`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/classical-local-correspondence`
(Laumon–Rapoport–Stuhler) in characteristic `p`). -/
def classicalParameter {n : ℕ} (π : IrrSmoothRep (ReductiveGroup.GL E n) (QlBar ℓ)) :
    FDRep (QlBar ℓ) (WeilGroup E) := sorry

/-- The semisimplification of a finite-dimensional representation (owned by
`ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`). -/
def semisimplification {k : Type} [Field k] {W : Type u} [Group W] (V : FDRep k W) :
    FDRep k W := sorry

/-- The semisimplification has the same character. -/
lemma semisimplification_character {k : Type} [Field k] {W : Type u} [Group W]
    (V : FDRep k W) : (semisimplification V).character = V.character := by
  sorry

/-- The semisimplification is semisimple. -/
lemma semisimplification_isSemisimple {k : Type} [Field k] {W : Type u} [Group W]
    (V : FDRep k W) :
    Representation.IsSemisimpleRepresentation (semisimplification V).ρ := by
  sorry

variable (E) in
/-- The basic class of `B(GL_n)` of the bundle `O(−1/n)`, whose `σ`-centralizer is `D^×` for
the division algebra of invariant `1/n` (`BunGAndNewtonStrata:BG1`). -/
def lubinTateClass (n : ℕ) : BasicKottwitzSet (ReductiveGroup.GL E n) := sorry

variable (E) in
/-- `D^×`, `D` the central division algebra over `E` of invariant `1/n`, as `G_b`. -/
abbrev divisionUnits (n : ℕ) : ReductiveGroup E :=
  sigmaCentralizer (ReductiveGroup.GL E n) (lubinTateClass E n).val

/-- The Jacquet–Langlands transfer `σ = JL(π)` of a supercuspidal `π`, a finite-dimensional
representation of `D^×` (owned by `EndoscopicTransferAndUnitaryTraceComparison:ET.6`). -/
def localJacquetLanglands {n : ℕ} (π : SupercuspidalRep (ReductiveGroup.GL E n) (QlBar ℓ)) :
    FDRep (QlBar ℓ) (divisionUnits E n).points := sorry

/-- The restriction to `Bun^b` of the two-leg Hecke composite `T_{std ⊠ std^∨}(B)`, `B` the
`b`-stratum sheaf of `σ = JL(π)`, as a `D^× × W_E × W_E`-representation via
`D_lis(Bun^b, Q̄_ℓ) ≃ D(D^×, Q̄_ℓ)` (owned by `HeckeStacksAndLocalShtukas:HS3`/`HS4` and
`EndoscopicTransferAndUnitaryTraceComparison:ET.6a`). -/
def twoLegHeckeStratum (c : ExcCoeff E ℓ (QlBar ℓ)) {n : ℕ}
    (π : SupercuspidalRep (ReductiveGroup.GL E n) (QlBar ℓ)) :
    FDRep (QlBar ℓ) ((divisionUnits E n).points × (WeilGroup E × WeilGroup E)) := sorry

/-- The outer tensor product `σ ⊠ ρ ⊠ ρ^∨` of `H × W × W`. -/
noncomputable def outerTripleTensor {k H W' S V : Type*} [Field k] [Group H] [Group W']
    [AddCommGroup S] [Module k S] [AddCommGroup V] [Module k V]
    (σ : Representation k H S) (ρ : Representation k W' V) :
    Representation k (H × (W' × W')) (S ⊗[k] (V ⊗[k] Module.Dual k V)) :=
  Representation.tprod (σ.comp (MonoidHom.fst H (W' × W')))
    (Representation.tprod (ρ.comp ((MonoidHom.fst W' W').comp (MonoidHom.snd H (W' × W'))))
      (ρ.dual.comp ((MonoidHom.snd W' W').comp (MonoidHom.snd H (W' × W')))))

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation`
(restricted to `E` of characteristic zero). For supercuspidal `π` over `Q̄_ℓ`, `σ = JL(π)`
and `b` the class of `O(−1/n)`, the two-leg Hecke composite restricted to `Bun^b` is
`σ ⊗ ρ_π ⊗ ρ_π^∨` as a `D^× × W_E × W_E`-representation, the two Weil factors acting on
`ρ_π` and its dual separately; `ρ_π` is the classical parameter. Not stated: the one-leg step
`T_std(B)|Bun^1 = π ⊗ ρ_π` (no carrier for the space of `π`), and the absorption of
`[n − 1]` and `((n − 1)/2)` into the Satake normalization. -/
theorem twoTowerRealisation [CharZero E] (c : ExcCoeff E ℓ (QlBar ℓ)) {n : ℕ} [NeZero n]
    (π : SupercuspidalRep (ReductiveGroup.GL E n) (QlBar ℓ)) :
    Nonempty (Representation.Equiv (twoLegHeckeStratum c π).ρ
      (outerTripleTensor (localJacquetLanglands π).ρ (classicalParameter π.toIrr).ρ)) := by
  sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/supercuspidal-agreement`
(restricted to `E` of characteristic zero): for supercuspidal `π` the excursion parameter is
the semisimplified classical parameter. -/
theorem supercuspidalAgreement [CharZero E] (c : ExcCoeff E ℓ (QlBar ℓ)) {n : ℕ}
    (π : SupercuspidalRep (ReductiveGroup.GL E n) (QlBar ℓ)) :
    Nonempty (excursionParameter c π.toIrr ≅ semisimplification (classicalParameter π.toIrr)) := by
  sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/all-irreducible-representations`
(restricted to `E` of characteristic zero): for every irreducible smooth
`Q̄_ℓ`-representation `π` of `GL_n(E)` the excursion parameter is the semisimplification of
the Weil part of the classical parameter. The monodromy operator `N` is not identified. -/
theorem allIrreducibleRepresentations [CharZero E] (c : ExcCoeff E ℓ (QlBar ℓ)) {n : ℕ}
    (π : IrrSmoothRep (ReductiveGroup.GL E n) (QlBar ℓ)) :
    Nonempty (excursionParameter c π ≅ semisimplification (classicalParameter π)) := by
  sorry

variable (E) in
/-- The trivial representation of `GL_n(E)` (SR.3). -/
def glTrivialRep (n : ℕ) (k : Type) [Field k] : IrrSmoothRep (ReductiveGroup.GL E n) k :=
  sorry

variable (E) in
/-- The Steinberg representation of `GL_n(E)` (SR.3). -/
def glSteinbergRep (n : ℕ) (k : Type) [Field k] : IrrSmoothRep (ReductiveGroup.GL E n) k :=
  sorry

-- all-irreducible-representations acceptance: the trivial and Steinberg representations
-- have the same semisimplified (diagonal) parameter, although their monodromy differs.
example (n : ℕ) :
    Nonempty (semisimplification (classicalParameter (glTrivialRep E n (QlBar ℓ))) ≅
      semisimplification (classicalParameter (glSteinbergRep E n (QlBar ℓ)))) := by
  sorry

end GLnParameters

/-! ### ES7 top layer and equal characteristic -/

section TopLayer

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]
variable {ℓ : ℕ} [Fact ℓ.Prime]

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/equal-characteristic-agreement`.
For `E` of characteristic `p > 0` and every irreducible smooth `Q̄_ℓ`-representation `π` of
`GL_n(E)`, the excursion parameter is the semisimplified classical (Laumon–Rapoport–Stuhler)
parameter. Proof inputs: the equal-characteristic Hecke-fibre package, the shared two-leg
trace theorem and the parabolic reduction. -/
theorem equalCharacteristicAgreement (p : ℕ) [Fact p.Prime] [CharP E p]
    (c : ExcCoeff E ℓ (QlBar ℓ)) {n : ℕ} (π : IrrSmoothRep (ReductiveGroup.GL E n) (QlBar ℓ)) :
    Nonempty (excursionParameter c π ≅ semisimplification (classicalParameter π)) := by
  sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7/agreement-for-every-local-field`.
FS Theorem IX.7.4 over every nonarchimedean local field `E` (`ℓ ≠ p` is part of `c`): the
excursion parameter of every irreducible smooth `Q̄_ℓ`-representation of `GL_n(E)` is the
semisimplified classical parameter. No integral or mod-`ℓ` statement and no recovery of
`N`. -/
theorem agreementForEveryLocalField (c : ExcCoeff E ℓ (QlBar ℓ)) {n : ℕ}
    (π : IrrSmoothRep (ReductiveGroup.GL E n) (QlBar ℓ)) :
    Nonempty (excursionParameter c π ≅ semisimplification (classicalParameter π)) := by
  sorry

/-- Base change `Z^spec(G, Λ) → Z^spec(G, Λ')` along `f : Λ →+* Λ'` (ES1/LP0). -/
def spectralBaseChange (G : ReductiveGroup E) {Λ Λ' : Type} [CommRing Λ] [CommRing Λ']
    (f : Λ →+* Λ') : SpectralCentre G Λ →+* SpectralCentre G Λ' := sorry

variable (E) in
/-- The classical map `Z^spec(GL_n, Q̄_ℓ) → Z(GL_n(E), Q̄_ℓ)`: a spectral function acts on
each irreducible `π` by its value at the classical parameter of `π` (owned by
`EndoscopicTransferAndUnitaryTraceComparison:ET.6`, the equal-characteristic classical
correspondence and `SmoothRepresentationsOfLocalGroups:SR.1`). -/
def classicalCentreMap (n : ℕ) (ℓ : ℕ) [Fact ℓ.Prime] :
    SpectralCentre (ReductiveGroup.GL E n) (QlBar ℓ) →+*
      BernsteinCentre (ReductiveGroup.GL E n) (QlBar ℓ) := sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7/classical-centre-agreement` (moved by the
review from `ES7:GLn-comparison`). For every `E`: (1) `Ψ_{GL_n}` over `Q̄_ℓ` is the classical map; (2) the integral
`Ψ_{GL_n}` over `ℤ_ℓ[√q]` refines it, i.e. it is a ring map to the integral Bernstein centre
whose base change to `Q̄_ℓ` is the classical map (Helm–Moss). This is not a full integral
or mod-`ℓ` Weil–Deligne correspondence. -/
theorem classicalCentreAgreement (n : ℕ) (c : ExcCoeff E ℓ (QlBar ℓ))
    (hZ : IsUnit (componentGroupOrder (ReductiveGroup.GL E n) : QlBar ℓ)) :
    PsiG (ReductiveGroup.GL E n) c hZ = classicalCentreMap E n ℓ ∧
    ∀ (cint : ExcCoeff E ℓ (integralSqrtQ ℓ (residueCard E)))
      (hZint : IsUnit (componentGroupOrder (ReductiveGroup.GL E n) :
        integralSqrtQ ℓ (residueCard E))),
      (bernsteinBaseChange (ReductiveGroup.GL E n)
          (integralSqrtQ ℓ (residueCard E)).val.toRingHom).comp
          (PsiG (ReductiveGroup.GL E n) cint hZint) =
        (classicalCentreMap E n ℓ).comp
          (spectralBaseChange (ReductiveGroup.GL E n)
            (integralSqrtQ ℓ (residueCard E)).val.toRingHom) := by
  sorry

end TopLayer

end TauCeti.Blueprint.Excursion.ES7


namespace TauCeti.Blueprint.Excursion.ES7

noncomputable section

open MeasureTheory
open scoped TensorProduct ValuativeRel NNReal

/-! ## Layer `function-field-automorphic`: maximal orders, compact quotients and the
simple trace comparison (LRS §§13–15, Hausberger §§1, 9–10) -/

/-! ### Orders in algebras over a valued field (`function-field-automorphic/maximal-orders`) -/

section Orders

/-- An `O`-order in a finite-dimensional `K`-algebra `A`: an `O`-subalgebra (so it contains `1`
and is closed under multiplication) which is a finitely generated `O`-module spanning `A` over
`K`, i.e. a finite `O`-lattice. -/
def IsOrder (O K A : Type*) [CommRing O] [Field K] [Ring A] [Algebra O K] [Algebra K A]
    [Algebra O A] [IsScalarTower O K A] (𝒪 : Subalgebra O A) : Prop :=
  Module.Finite O 𝒪 ∧ Submodule.span K (𝒪 : Set A) = ⊤

/-- A maximal order: an order maximal by inclusion among `O`-orders of `A`. -/
def IsMaximalOrder (O K A : Type*) [CommRing O] [Field K] [Ring A] [Algebra O K] [Algebra K A]
    [Algebra O A] [IsScalarTower O K A] (𝒪 : Subalgebra O A) : Prop :=
  IsOrder O K A 𝒪 ∧ ∀ 𝒪' : Subalgebra O A, IsOrder O K A 𝒪' → 𝒪 ≤ 𝒪' → 𝒪' = 𝒪

/-- The endomorphism order `End_O(L) = {M ∈ M_n(K) | M L ⊆ L}` of an `O`-submodule
`L ⊆ K^n`. -/
def latticeOrder (O K : Type*) [CommRing O] [Field K] [Algebra O K] (n : ℕ)
    (L : Submodule O (Fin n → K)) : Subalgebra O (Matrix (Fin n) (Fin n) K) where
  carrier := {M | ∀ v ∈ L, Matrix.mulVec M v ∈ L}
  mul_mem' := by sorry
  add_mem' := by sorry
  algebraMap_mem' := by sorry

/-- The standard lattice `O^n ⊆ K^n`. -/
def standardLattice (O K : Type*) [CommRing O] [Field K] [Algebra O K] (n : ℕ) :
    Submodule O (Fin n → K) :=
  Submodule.pi Set.univ fun _ => LinearMap.range (Algebra.linearMap O K)

end Orders

/-! ### The local division algebras `D_x = F_x ⊗_F D` and maximal-order data -/

section MaximalOrders

variable {q : ℕ} (X : FFCurve q) (D : Type) [DivisionRing D] [Algebra X.functionField D]
  [Algebra.IsCentral X.functionField D] [FiniteDimensional X.functionField D]

/-- The completed algebra `D_x = F_x ⊗_F D`, a central simple `F_x`-algebra. -/
abbrev localDivisionAlgebra {q : ℕ} (X : FFCurve q) (D : Type) [DivisionRing D]
    [Algebra X.functionField D] [Algebra.IsCentral X.functionField D]
    [FiniteDimensional X.functionField D] (x : X.Place) : Type :=
  x.completion ⊗[X.functionField] D

/-- `D_x` carries its natural (finite-dimensional vector space) topology over `F_x`. -/
instance (x : X.Place) : TopologicalSpace (localDivisionAlgebra X D x) :=
  moduleTopology x.completion _

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`.
Maximal-order data for `D`: at every closed place `x` a maximal `O_x`-order `𝒟_x ⊆ D_x`
(maximal by inclusion among `O_x`-orders, `O_x = 𝒪[F_x]`). No split-place condition is
imposed; `D`-elliptic consumers choose a rational `∞` at which `D` splits.

Omitted: the gluing of the `𝒟_x` into a coherent locally free `O_X`-algebra with generic fibre
`D` (Hausberger Definition 1.1); it needs coherent sheaves of algebras on the curve
(`SchemeAndStackFoundations:SF.0`, `SF.2/sheaf-algebra`), which have no carrier here. -/
structure DOrder {q : ℕ} (X : FFCurve q) (D : Type) [DivisionRing D]
    [Algebra X.functionField D] [Algebra.IsCentral X.functionField D]
    [FiniteDimensional X.functionField D] where
  /-- The completed local order `𝒟_x ⊆ D_x`. -/
  localOrder : ∀ x : X.Place, Subalgebra 𝒪[x.completion] (localDivisionAlgebra X D x)
  /-- Each `𝒟_x` is a maximal `O_x`-order. -/
  isMaximal : ∀ x : X.Place,
    IsMaximalOrder 𝒪[x.completion] x.completion (localDivisionAlgebra X D x) (localOrder x)

variable {X D}

/-- API `DOrder.local`: the completed local order `𝒟_x ⊆ D_x` (its unit group is
`DOrder.localUnits`). -/
def DOrder.local (𝒟 : DOrder X D) (x : X.Place) :
    Subalgebra 𝒪[x.completion] (localDivisionAlgebra X D x) :=
  𝒟.localOrder x

/-- The unit group `𝒟_x^× ⊆ D_x^×` of the local order (`DOrder.local`, unit-group part). -/
def DOrder.localUnits (𝒟 : DOrder X D) (x : X.Place) :
    Subgroup (localDivisionAlgebra X D x)ˣ :=
  (Units.map ((𝒟.local x).val : ↥(𝒟.local x) →* localDivisionAlgebra X D x)).range

/-- API `DOrder.ramification`: the set `R` of places where `D_x` is not split, i.e. not
isomorphic to a matrix algebra over `F_x`. (A split pole `∞` is chosen outside `R` in the
`D`-elliptic setup.) -/
def DOrder.ramification (𝒟 : DOrder X D) : Set X.Place :=
  {x | ∀ n : ℕ,
    IsEmpty (localDivisionAlgebra X D x ≃ₐ[x.completion] Matrix (Fin n) (Fin n) x.completion)}

/-- The ramification set `R` is finite. -/
theorem DOrder.ramification_finite (𝒟 : DOrder X D) : 𝒟.ramification.Finite := by
  sorry

/-- API `DOrder.split_equiv`: at `x ∉ R` the pair `(D_x, 𝒟_x)` is isomorphic to
`(M_d(F_x), M_d(O_x))`. -/
theorem DOrder.split_equiv (𝒟 : DOrder X D) {d : ℕ}
    (hd : Module.finrank X.functionField D = d ^ 2) (x : X.Place) (hx : x ∉ 𝒟.ramification) :
    ∃ e : localDivisionAlgebra X D x ≃ₐ[x.completion] Matrix (Fin d) (Fin d) x.completion,
      e '' (𝒟.local x : Set (localDivisionAlgebra X D x)) =
        {M | ∀ i j, M i j ∈ 𝒪[x.completion]} := by
  sorry

/-- API `DOrder.units_isCompactOpen`: each local unit group `𝒟_x^×` is a compact open subgroup
of `D_x^×`. -/
theorem DOrder.units_isCompactOpen (𝒟 : DOrder X D) (x : X.Place) :
    IsCompact (𝒟.localUnits x : Set (localDivisionAlgebra X D x)ˣ) ∧
      IsOpen (𝒟.localUnits x : Set (localDivisionAlgebra X D x)ˣ) := by
  sorry

-- DOrder.rank_one_test: for `D = F` every local maximal order `𝒟_x` is `O_x`
example (𝒟 : DOrder X X.functionField) (x : X.Place) : 𝒟.local x = ⊥ := by
  sorry

end MaximalOrders

section SplitLattices

variable (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

/-- API `DOrder.change_lattice`: replacing a split lattice `L ⊆ F_x^n` by `g L`
(`g ∈ GL_n(F_x)`) conjugates its endomorphism order by `g`. -/
theorem DOrder.change_lattice (n : ℕ) (L : Submodule 𝒪[K] (Fin n → K))
    (g : GL (Fin n) K) :
    (latticeOrder 𝒪[K] K n
        (L.map ((Matrix.mulVecLin (g : Matrix (Fin n) (Fin n) K)).restrictScalars 𝒪[K])) :
          Set (Matrix (Fin n) (Fin n) K)) =
      (fun M => (g : Matrix (Fin n) (Fin n) K) * M * ((g⁻¹ : GL (Fin n) K) :
        Matrix (Fin n) (Fin n) K)) '' (latticeOrder 𝒪[K] K n L : Set _) := by
  sorry

-- DOrder.matrix_test: the order of the standard lattice `O^n` is `M_n(O)`, units `GL_n(O)`
example (n : ℕ) :
    (latticeOrder 𝒪[K] K n (standardLattice 𝒪[K] K n) : Set (Matrix (Fin n) (Fin n) K)) =
        {M | ∀ i j, M i j ∈ 𝒪[K]} ∧
      Nonempty ((latticeOrder 𝒪[K] K n (standardLattice 𝒪[K] K n))ˣ ≃*
        GL (Fin n) 𝒪[K]) := by
  sorry

-- `diag(ϖ, 1, …, 1) ∈ M_n(O)` is invertible over the local field but is not a unit of `M_n(O)`.
-- DOrder.integral_nonunit_test: `diag(ϖ, 1, …, 1)` is a unit of `M_n(F_x)`, not of `M_n(O_x)`
example (n : ℕ) (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ) :
    IsUnit ((Matrix.diagonal (Function.update (1 : Fin (n + 1) → 𝒪[K]) 0 ϖ)).map
        (algebraMap 𝒪[K] K)) ∧
      ¬ IsUnit (Matrix.diagonal (Function.update (1 : Fin (n + 1) → 𝒪[K]) 0 ϖ)) := by
  sorry

end SplitLattices

/-! ### Compact quotient, discrete spectrum and the kernel trace formula -/

section CompactQuotient

variable {q : ℕ} (X : FFCurve q) (D : Type) [DivisionRing D] [Algebra X.functionField D]
  [Algebra.IsCentral X.functionField D] [FiniteDimensional X.functionField D]

/-- A uniformizer `ϖ_∞` of `F_∞`, viewed as a central element of `D^×(A_F)` (component `ϖ_∞` at
`∞`, `1` elsewhere); adelic carrier owned by `AdelicAlgebraicGroups:AA.1`. -/
def adelicUniformizer {q : ℕ} (X : FFCurve q) (D : Type) [DivisionRing D]
    [Algebra X.functionField D] [Algebra.IsCentral X.functionField D]
    [FiniteDimensional X.functionField D] (infty : X.Place) : adelicUnits X D :=
  sorry

/-- The degree lattice `ϖ_∞^ℤ ⊆ D^×(A_F)`. -/
def degreeLattice (infty : X.Place) : Subgroup (adelicUnits X D) :=
  Subgroup.zpowers (adelicUniformizer X D infty)

/-- `ϖ_∞` is central in `D^×(A_F)`. -/
theorem adelicUniformizer_mem_center (infty : X.Place) :
    adelicUniformizer X D infty ∈ Subgroup.center (adelicUnits X D) := by
  sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`.
For a central division algebra `D/F` (any `d`, also the inner form ramified at `∞`): the diagonal
`D^×(F)` is discrete in `D^×(A_F)`; `D^×(F)\D^×(A_F)` is compact modulo the centre `A_F^×`;
`D^×(F)\D^×(A_F)/ϖ_∞^ℤ` is compact; and at a compact open level `K` the double coset space
`D^×(F)\D^×(A_F)/Kϖ_∞^ℤ` is finite with finite stabilizers `D^×(F) ∩ g K ϖ_∞^ℤ g⁻¹`. Mathlib's
`G ⧸ H` is the left coset space; inversion identifies it with `H\G`. The whole adelic
quotient is not asserted finite. -/
theorem divisionQuotientCompactness (infty : X.Place) :
    DiscreteTopology (diagonalUnits X D).range ∧
      CompactSpace (adelicUnits X D ⧸
        ((diagonalUnits X D).range ⊔ Subgroup.center (adelicUnits X D))) ∧
      CompactSpace (adelicUnits X D ⧸ ((diagonalUnits X D).range ⊔ degreeLattice X D infty)) ∧
      ∀ K : Subgroup (adelicUnits X D), IsOpen (K : Set (adelicUnits X D)) →
        IsCompact (K : Set (adelicUnits X D)) →
        Finite (DoubleCoset.Quotient ((diagonalUnits X D).range : Set (adelicUnits X D))
          ((K ⊔ degreeLattice X D infty : Subgroup (adelicUnits X D)) : Set (adelicUnits X D))) ∧
        ∀ g : adelicUnits X D,
          {γ : Dˣ | g⁻¹ * diagonalUnits X D γ * g ∈ K ⊔ degreeLattice X D infty}.Finite := by
  sorry

-- acceptance (division-quotient-compactness): for `d = 1`, `F^×\A_F^×/ϖ_∞^ℤ` is compact
example (infty : X.Place) :
    CompactSpace (adelicUnits X X.functionField ⧸
      ((diagonalUnits X X.functionField).range ⊔ degreeLattice X X.functionField infty)) :=
  (divisionQuotientCompactness X X.functionField infty).2.2.1

/-- The adelic group `GL_d(A_F)` (`AdelicAlgebraicGroups:AA.1`). -/
def adelicGL {q : ℕ} (X : FFCurve q) (d : ℕ) : Type := sorry

instance (d : ℕ) : Group (adelicGL X d) := sorry
instance (d : ℕ) : TopologicalSpace (adelicGL X d) := sorry
instance (d : ℕ) : IsTopologicalGroup (adelicGL X d) := sorry

/-- The diagonal embedding `GL_d(F) → GL_d(A_F)`. -/
def diagonalGL (d : ℕ) : GL (Fin d) X.functionField →* adelicGL X d := sorry

/-- Acceptance check of node
`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`:
the analogous quotient `GL_d(F)\GL_d(A_F)` is not compact modulo the centre for `d > 1`. -/
theorem glQuotient_not_compact (d : ℕ) (hd : 1 < d) :
    ¬ CompactSpace (adelicGL X d ⧸
      ((diagonalGL X d).range ⊔ Subgroup.center (adelicGL X d))) := by
  sorry

end CompactQuotient

section DiscreteSpectrum

variable {q : ℕ} (X : FFCurve q) (D : Type) [DivisionRing D] [Algebra X.functionField D]
  [Algebra.IsCentral X.functionField D] [FiniteDimensional X.functionField D]

/-- The space of `K`-invariant automorphic forms on `D^×(F)\D^×(A_F)/ϖ_∞^ℤ` with values in `k`:
all functions `φ` with `φ(γ g a z) = φ(g)` for `γ ∈ D^×(F)`, `a ∈ K`, `z ∈ ϖ_∞^ℤ` (the quotient
is compact, so no growth or finiteness condition is needed). -/
def automorphicFormsLevel (infty : X.Place) (k : Type) [Field k]
    (K : Subgroup (adelicUnits X D)) : Submodule k (adelicUnits X D → k) where
  carrier := {φ | ∀ (γ : Dˣ) (g a z : adelicUnits X D), a ∈ K → z ∈ degreeLattice X D infty →
    φ (diagonalUnits X D γ * g * a * z) = φ g}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

variable {X D}

/-- The space `A^K` of `K`-fixed vectors of an automorphic representation `A`
(`AutomorphicSpectralTheory:AS.0`). -/
def AutomorphicRep.fixedVectors {infty : X.Place} {k : Type} [Field k]
    (A : AutomorphicRep X D infty k) (K : Subgroup (adelicUnits X D)) : Type := sorry

instance {infty : X.Place} {k : Type} [Field k] (A : AutomorphicRep X D infty k)
    (K : Subgroup (adelicUnits X D)) : AddCommGroup (A.fixedVectors K) := sorry

instance {infty : X.Place} {k : Type} [Field k] (A : AutomorphicRep X D infty k)
    (K : Subgroup (adelicUnits X D)) : Module k (A.fixedVectors K) := sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`.
At a compact open level `K`, over an algebraically closed field `k` of characteristic zero: the
space of `K`-invariant automorphic forms is finite dimensional, only finitely many automorphic
`A` have `A^K ≠ 0`, each `A^K` is finite dimensional, and the level-`K` automorphic space is
`⨁_A (A^K)^{m(A)}` (finite multiplicities). Summing over the whole tower of levels is not
asserted. Omitted: the Hilbert-sum decomposition of `L²` (no `L²` carrier for the adelic
quotient) and the factorisation `A = ⊗'_v A_v` with spherical vectors at almost all places
(no restricted tensor product carrier); the local components are `AutomorphicRep.localComponent`. -/
theorem discreteSpectrum (infty : X.Place) (k : Type) [Field k] [CharZero k] [IsAlgClosed k]
    (K : Subgroup (adelicUnits X D)) (hKo : IsOpen (K : Set (adelicUnits X D)))
    (hKc : IsCompact (K : Set (adelicUnits X D))) :
    FiniteDimensional k (automorphicFormsLevel X D infty k K) ∧
      {A : AutomorphicRep X D infty k | A.multiplicity ≠ 0 ∧ Nontrivial (A.fixedVectors K)}.Finite ∧
      (∀ A : AutomorphicRep X D infty k, FiniteDimensional k (A.fixedVectors K)) ∧
      Nonempty (automorphicFormsLevel X D infty k K ≃ₗ[k]
        DirectSum {A : AutomorphicRep X D infty k // Nontrivial (A.fixedVectors K)}
          fun A => Fin A.1.multiplicity → A.1.fixedVectors K) := by
  sorry

end DiscreteSpectrum

section KernelTrace

variable {q : ℕ} (X : FFCurve q) (D : Type) [DivisionRing D] [Algebra X.functionField D]
  [Algebra.IsCentral X.functionField D] [FiniteDimensional X.functionField D]

/-- Test functions on the central quotient `D^×(A_F)/ϖ_∞^ℤ`: locally constant, compactly
supported, `k`-valued. -/
structure DTestFunction {q : ℕ} (X : FFCurve q) (D : Type) [DivisionRing D]
    [Algebra X.functionField D] [Algebra.IsCentral X.functionField D]
    [FiniteDimensional X.functionField D] (infty : X.Place) (k : Type) [Field k] where
  /-- The underlying locally constant function. -/
  toFun : LocallyConstant (adelicUnits X D ⧸ degreeLattice X D infty) k
  hasCompactSupport : HasCompactSupport toFun

variable {X D}

/-- `f` is bi-invariant under the subgroup `K`. -/
def DTestFunction.IsBiinvariant {infty : X.Place} {k : Type} [Field k]
    (f : DTestFunction X D infty k) (K : Subgroup (adelicUnits X D)) : Prop :=
  ∀ g a b : adelicUnits X D, a ∈ K → b ∈ K →
    f.toFun (QuotientGroup.mk (a * g * b)) = f.toFun (QuotientGroup.mk g)

/-- The operator `A(f) = ∫ f(g) A(g) dg` restricted to `A^K` (`f` `K`-bi-invariant), for the
fixed Haar measure of `AdelicAlgebraicGroups:AA.0/restricted-haar-product`. -/
def AutomorphicRep.heckeAction {infty : X.Place} {k : Type} [Field k]
    (A : AutomorphicRep X D infty k) (K : Subgroup (adelicUnits X D))
    (f : DTestFunction X D infty k) : A.fixedVectors K →ₗ[k] A.fixedVectors K := sorry

/-- The trace of `A(f)` computed at level `K`: `tr(A(f) | A^K)`. -/
def AutomorphicRep.levelTrace {infty : X.Place} {k : Type} [Field k]
    (A : AutomorphicRep X D infty k) (K : Subgroup (adelicUnits X D))
    (f : DTestFunction X D infty k) : k :=
  LinearMap.trace k (A.fixedVectors K) (A.heckeAction K f)

/-- The trace `tr A(f)` of the finite-rank operator `A(f)`, independent of a level. -/
def AutomorphicRep.trace {infty : X.Place} {k : Type} [Field k]
    (A : AutomorphicRep X D infty k) (f : DTestFunction X D infty k) : k := sorry

/-- For `f` bi-invariant under a compact open `K`, `tr A(f)` is computed on `A^K`. -/
theorem AutomorphicRep.trace_eq_levelTrace {infty : X.Place} {k : Type} [Field k]
    (A : AutomorphicRep X D infty k) (K : Subgroup (adelicUnits X D))
    (hKo : IsOpen (K : Set (adelicUnits X D))) (hKc : IsCompact (K : Set (adelicUnits X D)))
    (f : DTestFunction X D infty k) (hf : f.IsBiinvariant K) :
    A.trace f = A.levelTrace K f := by
  sorry

variable (X D)

/-- The orbital integral `O_γ(f) = ∫_{D_γ^×(A)\D^×(A)} f(g⁻¹γg)` of a rational conjugacy class,
for the fixed Haar measures on `D^×(A_F)` and on the centralizers (`AA.0`). -/
def dOrbitalIntegral (infty : X.Place) (k : Type) [Field k] (γ : ConjClasses Dˣ)
    (f : DTestFunction X D infty k) : k := sorry

/-- The volume `vol(D_γ^×(F)\D_γ^×(A_F)/ϖ_∞^ℤ)` for the fixed centralizer Haar measure. -/
def dCentralizerVolume (infty : X.Place) (γ : ConjClasses Dˣ) : ℚ := sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kernel-trace-identity`.
For a locally constant compactly supported test function `f` on `D^×(A_F)/ϖ_∞^ℤ`, bi-invariant
under a compact open `K`, both sides are finite sums and
`Σ_A m(A) tr A(f) = Σ_[γ] vol(D_γ^×(F)\D_γ^×(A_F)/ϖ_∞^ℤ) O_γ(f)`, the sum running over rational
conjugacy classes of `D^×(F)`; all measures are the fixed compatible Haar measures. No sum over
the infinite tower of levels is used. -/
theorem kernelTraceIdentity (infty : X.Place) (k : Type) [Field k] [CharZero k] [IsAlgClosed k]
    (K : Subgroup (adelicUnits X D)) (hKo : IsOpen (K : Set (adelicUnits X D)))
    (hKc : IsCompact (K : Set (adelicUnits X D))) (f : DTestFunction X D infty k)
    (hf : f.IsBiinvariant K) :
    (Function.support fun A : AutomorphicRep X D infty k =>
        (A.multiplicity : k) * A.levelTrace K f).Finite ∧
      (Function.support fun γ : ConjClasses Dˣ => dOrbitalIntegral X D infty k γ f).Finite ∧
      ∑ᶠ A : AutomorphicRep X D infty k, (A.multiplicity : k) * A.levelTrace K f =
        ∑ᶠ γ : ConjClasses Dˣ,
          (dCentralizerVolume X D infty γ : k) * dOrbitalIntegral X D infty k γ f := by
  sorry

-- acceptance (kernel-trace-identity): the identity class contributes `vol · f(1)`
example (infty : X.Place) (k : Type) [Field k] (f : DTestFunction X D infty k) :
    dOrbitalIntegral X D infty k (ConjClasses.mk 1) f = f.toFun (QuotientGroup.mk 1) := by
  sorry

end KernelTrace

/-! ### Local harmonic analysis on `GL_d(K)` and its inner form (`K` a nonarchimedean local
field, any characteristic; at the split place `∞` take `K = F_∞`) -/

section LocalHarmonic

variable (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

/-- The normalizer `P_I ⊆ GL_d(K)` of the standard facet `F_I` of the Bruhat–Tits building, for
`I ⊆ Δ = Fin (d - 1)` (the facet has `|Δ ∖ I| + 1` vertices: `I = Δ` is the vertex fixed by
`GL_d(O_K)`, `I = ∅` the standard chamber). Owned by `ReductiveGroupsPartII:RG2.2/RG2.3`. -/
def facetNormalizer (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (d : ℕ) (I : Finset (Fin (d - 1))) :
    Subgroup (GL (Fin d) K) := sorry

/-- The parahoric subgroup `P_I⁰ ⊆ P_I` (pointwise stabilizer of the facet `F_I`, compact
open); owned by `ReductiveGroupsPartII:RG2.3`. -/
def parahoricSubgroup (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (d : ℕ) (I : Finset (Fin (d - 1))) :
    Subgroup (GL (Fin d) K) := sorry

/-- The orientation character `χ_I : P_I → {±1}`, the sign of the permutation of the vertices
of `F_I` (LRS §13.1); owned by `ReductiveGroupsPartII:RG2.2`. -/
def orientationCharacter (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (d : ℕ) (I : Finset (Fin (d - 1))) :
    facetNormalizer K d I →* ℤˣ := sorry

open Classical in
/-- Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function`.
The Euler–Poincaré function of `GL_d(K)` for the Haar measure `μ`:
`f(g) = Σ_{I ⊆ Δ} (-1)^{|Δ∖I|} χ_I(g) / ((|Δ∖I| + 1) vol_μ(P_I⁰))`, with `χ_I` extended by zero
outside the facet normalizer `P_I`. A finite alternating sum of oriented facet-normalizer
functions (not an arbitrary cusp projector); it is invariant under the centre and compactly
supported modulo the centre (`EulerPoincareFunction.central`, `.support`). -/
def EulerPoincareFunction (d : ℕ) [MeasurableSpace (GL (Fin d) K)]
    (μ : Measure (GL (Fin d) K)) : GL (Fin d) K → ℝ :=
  fun g => ∑ I : Finset (Fin (d - 1)),
    (-1 : ℝ) ^ (d - 1 - I.card) *
      (if h : g ∈ facetNormalizer K d I then ((orientationCharacter K d I ⟨g, h⟩ : ℤ) : ℝ)
        else 0) /
      ((((d - 1 - I.card : ℕ) : ℝ) + 1) *
        (μ (parahoricSubgroup K d I : Set (GL (Fin d) K))).toReal)

/-- API `EulerPoincareFunction.central`: translation by the centre `K^×` leaves `f` unchanged. -/
theorem EulerPoincareFunction.central (d : ℕ) [MeasurableSpace (GL (Fin d) K)]
    (μ : Measure (GL (Fin d) K)) (z : Kˣ) (g : GL (Fin d) K) :
    EulerPoincareFunction K d μ (Matrix.GeneralLinearGroup.scalar (Fin d) z * g) =
      EulerPoincareFunction K d μ g := by
  sorry

/-- API `EulerPoincareFunction.haar_rescale`: replacing `μ` by `a • μ` replaces `f` by
`a⁻¹ f`. -/
theorem EulerPoincareFunction.haar_rescale (d : ℕ) [MeasurableSpace (GL (Fin d) K)]
    (μ : Measure (GL (Fin d) K)) (a : ℝ≥0) (ha : a ≠ 0) :
    EulerPoincareFunction K d (a • μ) = (a : ℝ)⁻¹ • EulerPoincareFunction K d μ := by
  sorry

/-- API `EulerPoincareFunction.support`: the support is contained in the finite union of the
facet normalizers (each compact modulo the centre). -/
theorem EulerPoincareFunction.support (d : ℕ) [MeasurableSpace (GL (Fin d) K)]
    (μ : Measure (GL (Fin d) K)) :
    Function.support (EulerPoincareFunction K d μ) ⊆
      ⋃ I : Finset (Fin (d - 1)), (facetNormalizer K d I : Set (GL (Fin d) K)) := by
  sorry

/-- The support of the Euler–Poincaré function is compact modulo the centre. -/
theorem EulerPoincareFunction.isCompact_support_modCentre (d : ℕ)
    [MeasurableSpace (GL (Fin d) K)] (μ : Measure (GL (Fin d) K)) :
    IsCompact ((QuotientGroup.mk : GL (Fin d) K → GL (Fin d) K ⧸ Subgroup.center (GL (Fin d) K)) ''
      Function.support (EulerPoincareFunction K d μ)) := by
  sorry

/-- The trace `tr ρ(f)` of an irreducible smooth representation on a locally constant test
function, `ρ(f) = ∫ f(g) ρ(g) dμ(g)`: over `GL_d(K)` when `f` has compact support, and over
`GL_d(K)/ϖ^ℤ` (counting measure on `ϖ^ℤ`, `ϖ` a fixed uniformizer) when `f` is compactly
supported modulo the centre and `g ↦ f(g) ρ(g)` is `ϖ^ℤ`-invariant. Owned by
`SmoothRepresentationsOfLocalGroups:SR.1`. -/
def glTrace (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (d : ℕ) (ρ : IrrSmoothRep (ReductiveGroup.GL K d) ℂ)
    [MeasurableSpace (GL (Fin d) K)] (μ : Measure (GL (Fin d) K)) (f : GL (Fin d) K → ℂ) : ℂ :=
  sorry

/-- Isomorphism classes of irreducible unitary representations of `GL_d(K)` on which `ϖ^ℤ` acts
trivially, as a carrier type with its map to `IrrSmoothRep`
(`SmoothRepresentationsOfLocalGroups:SR.3`). -/
def UnitaryIrrRepModUniformizer (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (d : ℕ) : Type := sorry

/-- The underlying irreducible smooth representation. -/
def UnitaryIrrRepModUniformizer.toIrr {d : ℕ} :
    UnitaryIrrRepModUniformizer K d → IrrSmoothRep (ReductiveGroup.GL K d) ℂ := sorry

-- For `d = 1` the building is a point.
-- EulerPoincareFunction.rank_one_test: for `d = 1`, `f` is the constant `1 / vol(GL₁(O_K))`
example [MeasurableSpace (GL (Fin 1) K)] (μ : Measure (GL (Fin 1) K)) (g : GL (Fin 1) K) :
    EulerPoincareFunction K 1 μ g =
      1 / (μ (parahoricSubgroup K 1 ∅ : Set (GL (Fin 1) K))).toReal := by
  sorry

-- EulerPoincareFunction.haar_test: doubling `μ` halves `f` and leaves `tr π(f)` unchanged
example (d : ℕ) [MeasurableSpace (GL (Fin d) K)] [BorelSpace (GL (Fin d) K)]
    (μ : Measure (GL (Fin d) K)) [μ.IsHaarMeasure] (π : UnitaryIrrRepModUniformizer K d) :
    EulerPoincareFunction K d ((2 : ℝ≥0) • μ) = (1 / 2 : ℝ) • EulerPoincareFunction K d μ ∧
      glTrace K d π.toIrr ((2 : ℝ≥0) • μ)
          (fun g => (EulerPoincareFunction K d ((2 : ℝ≥0) • μ) g : ℂ)) =
        glTrace K d π.toIrr μ (fun g => (EulerPoincareFunction K d μ g : ℂ)) := by
  sorry

-- In the `GL₂` tree `w = (0 1; ϖ 0)` normalizes the standard edge `I = ∅`, swapping its vertices.
-- EulerPoincareFunction.orientation_test: the edge-flip `w` has orientation sign `-1`, not `+1`
example (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ) (w : GL (Fin 2) K)
    (hw : (w : Matrix (Fin 2) (Fin 2) K) = !![0, 1; (ϖ : K), 0]) :
    ∃ h : w ∈ facetNormalizer K 2 ∅, orientationCharacter K 2 ∅ ⟨w, h⟩ = -1 := by
  sorry

open Classical in
/-- Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-character-traces`.
For an irreducible unitary representation `π` of `GL_d(K)/ϖ^ℤ`, `tr π(f) = 1` if `π` is trivial,
`(-1)^{d-1}` if `π` is Steinberg, and `0` otherwise (in particular `0` when the central character
is nontrivial on `K^×/ϖ^ℤ`). The characteristic-`p` case uses the proof of LRS 13.2(ii), whose
blanket characteristic-zero hypothesis is not used there. -/
theorem eulerPoincareCharacterTraces (d : ℕ) (hd : 0 < d) [MeasurableSpace (GL (Fin d) K)]
    [BorelSpace (GL (Fin d) K)] (μ : Measure (GL (Fin d) K)) [μ.IsHaarMeasure]
    (π : UnitaryIrrRepModUniformizer K d) :
    glTrace K d π.toIrr μ (fun g => (EulerPoincareFunction K d μ g : ℂ)) =
      if π.toIrr = glTrivialRep K d ℂ then 1
      else if π.toIrr = glSteinbergRep K d ℂ then (-1) ^ (d - 1) else 0 := by
  sorry

-- acceptance (euler-poincare-character-traces): for `d = 2` the Steinberg trace is `-1`
example [MeasurableSpace (GL (Fin 2) K)] [BorelSpace (GL (Fin 2) K)]
    (μ : Measure (GL (Fin 2) K)) [μ.IsHaarMeasure] (π : UnitaryIrrRepModUniformizer K 2)
    (hπ : π.toIrr = glSteinbergRep K 2 ℂ) :
    glTrace K 2 π.toIrr μ (fun g => (EulerPoincareFunction K 2 μ g : ℂ)) = -1 := by
  sorry

/-- The central division algebra over `K` of Hasse invariant `1/d` (the inner form `D̄` of
`M_d(K)`; owned by `ReductiveGroupsPartII:RG2.5`). -/
def invDivisionAlgebra (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (d : ℕ) : Type := sorry

instance (d : ℕ) : DivisionRing (invDivisionAlgebra K d) := sorry
instance (d : ℕ) : Algebra K (invDivisionAlgebra K d) := sorry
instance (d : ℕ) : Algebra.IsCentral K (invDivisionAlgebra K d) := sorry
instance (d : ℕ) : FiniteDimensional K (invDivisionAlgebra K d) := sorry

/-- `D̄` carries its natural topology as a finite-dimensional `K`-vector space. -/
instance (d : ℕ) : TopologicalSpace (invDivisionAlgebra K d) := moduleTopology K _

/-- `dim_K D̄ = d²`. -/
theorem invDivisionAlgebra.finrank (d : ℕ) (hd : 0 < d) :
    Module.finrank K (invDivisionAlgebra K d) = d ^ 2 := by
  sorry

/-- The group `D̄^×` of units of the division algebra of invariant `1/d`, as a reductive group
over `K` (an inner form of `GL_d`). -/
def divisionUnitsGroup (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (d : ℕ) : ReductiveGroup K := sorry

/-- Its rational points are the units of `D̄`. -/
def divisionUnitsGroup.pointsEquiv (d : ℕ) :
    (divisionUnitsGroup K d).points ≃* (invDivisionAlgebra K d)ˣ := sorry

/-- Matched regular elliptic pairs: `g ∈ GL_d(K)` with irreducible separable characteristic
polynomial `P`, and `h ∈ D̄^×` with the same reduced characteristic polynomial, expressed as
`charpoly(left multiplication by h on D̄) = P^d`. -/
structure EllipticMatchingPair (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (d : ℕ) where
  /-- The elliptic element of `GL_d(K)`. -/
  g : GL (Fin d) K
  /-- The matching element of `D̄^×`. -/
  h : (invDivisionAlgebra K d)ˣ
  irreducible_charpoly : Irreducible (Matrix.charpoly (g : Matrix (Fin d) (Fin d) K))
  separable_charpoly : (Matrix.charpoly (g : Matrix (Fin d) (Fin d) K)).Separable
  charpoly_match : LinearMap.charpoly (LinearMap.mulLeft K (h : invDivisionAlgebra K d)) =
    Matrix.charpoly (g : Matrix (Fin d) (Fin d) K) ^ d

/-- The orbital integral `O_γ(f) = ∫_{G_γ\G} f(g⁻¹γg)` on `GL_d(K)` for the Haar measure `μ`
and the fixed (transferred) Haar measure on the centralizer (`AdelicAlgebraicGroups:AA.0`). -/
def glOrbitalIntegral (d : ℕ) [MeasurableSpace (GL (Fin d) K)] (μ : Measure (GL (Fin d) K))
    (γ : GL (Fin d) K) (f : GL (Fin d) K → ℝ) : ℝ := sorry

/-- The orbital integral on `D̄^×` for the Haar measure `μ'` and the transferred centralizer
measure. -/
def divisionOrbitalIntegral (d : ℕ) [MeasurableSpace (invDivisionAlgebra K d)ˣ]
    (μ' : Measure (invDivisionAlgebra K d)ˣ) (h : (invDivisionAlgebra K d)ˣ)
    (f : (invDivisionAlgebra K d)ˣ → ℝ) : ℝ := sorry

/-- The volume `vol(D̄^×/ϖ^ℤ)` for the Haar measure `μ'` (counting measure on `ϖ^ℤ`). -/
def divisionQuotientVolume (d : ℕ) [MeasurableSpace (invDivisionAlgebra K d)ˣ]
    (μ' : Measure (invDivisionAlgebra K d)ˣ) : ℝ := sorry

/-- The Kottwitz sign `ε(γ) = (-1)^{d/m - 1}`, `m = [K[γ] : K]`, of an elliptic semisimple
`γ ∈ GL_d(K)`: the sign `e` of its centralizer `GL_{d/m}(K[γ])` relative to the inner form
`D̄_γ̄^×` (centralizer of the transfer `γ̄`). It is `(-1)^{d-1}` at central `γ` and `1` at regular
elliptic `γ` (`m = d`). -/
def kottwitzSign (d : ℕ) (γ : GL (Fin d) K) : ℤ :=
  (-1) ^ (d / (minpoly K (γ : Matrix (Fin d) (Fin d) K)).natDegree - 1)

/-- At a matched regular elliptic pair the Kottwitz sign is `1` (the minimal polynomial is the
irreducible characteristic polynomial, of degree `d`). -/
theorem kottwitzSign_matchingPair (d : ℕ) (hd : 0 < d) (p : EllipticMatchingPair K d) :
    kottwitzSign K d p.g = 1 := by
  sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-orbital-integrals`.
`O_γ(f) = 0` for regular semisimple non-elliptic `γ ∈ GL_d(K)` (separable, reducible
characteristic polynomial); for matched regular elliptic `(γ, γ̄)`,
`O_γ(f) = ε(γ̄) O_γ̄(f̄)` with `f̄ = 1/vol(D̄^×/ϖ^ℤ)` constant, `ε` the Kottwitz sign
(`kottwitzSign`, which is `1` here by `kottwitzSign_matchingPair`; the sign `(-1)^{d-1}` of the
inner form enters the character identity, not these orbital integrals), for transferred
centralizer measures (LRS 13.2(i)). -/
theorem eulerPoincareOrbitalIntegrals (d : ℕ) (hd : 0 < d) [MeasurableSpace (GL (Fin d) K)]
    [BorelSpace (GL (Fin d) K)] (μ : Measure (GL (Fin d) K)) [μ.IsHaarMeasure]
    [MeasurableSpace (invDivisionAlgebra K d)ˣ] [BorelSpace (invDivisionAlgebra K d)ˣ]
    (μ' : Measure (invDivisionAlgebra K d)ˣ) [μ'.IsHaarMeasure] :
    (∀ γ : GL (Fin d) K, (Matrix.charpoly (γ : Matrix (Fin d) (Fin d) K)).Separable →
        ¬ Irreducible (Matrix.charpoly (γ : Matrix (Fin d) (Fin d) K)) →
        glOrbitalIntegral K d μ γ (EulerPoincareFunction K d μ) = 0) ∧
      ∀ p : EllipticMatchingPair K d,
        glOrbitalIntegral K d μ p.g (EulerPoincareFunction K d μ) =
          (kottwitzSign K d p.g : ℝ) *
            divisionOrbitalIntegral K d μ' p.h (fun _ => 1 / divisionQuotientVolume K d μ') := by
  sorry

/-- The local Jacquet–Langlands correspondence `π ↦ JL(π)` from supercuspidal representations of
`GL_d(K)` to representations of `D̄^×` (`D̄` of invariant `1/d`), as quoted in Hausberger 9.1
(Badulescu in equal characteristic). -/
def localJL (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (d : ℕ) (k : Type) [Field k] :
    SupercuspidalRep (ReductiveGroup.GL K d) k → IrrSmoothRep (divisionUnitsGroup K d) k :=
  sorry

/-- The Harish-Chandra character `Θ_π` of an irreducible smooth representation, a locally
constant function on the regular semisimple set (its values elsewhere carry no meaning);
owned by `SmoothRepresentationsOfLocalGroups:SR.3`. -/
def harishChandraCharacter {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (G : ReductiveGroup K) {k : Type} [Field k]
    (π : IrrSmoothRep G k) : G.points → k := sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/local-character-identity`.
(Moved here from the `equal-characteristic` layer.) For a nonarchimedean local field `K` of any
characteristic, a supercuspidal `π` of `GL_d(K)` and its local Jacquet–Langlands transfer
`JL(π)` to `D̄^×`, matched regular elliptic `g`, `h` satisfy
`Θ_π(g) = (-1)^{d-1} Θ_{JL(π)}(h)`. This is the elliptic identity only, not a nonelliptic
transfer formula; no number-field global trace theorem is used. -/
theorem localCharacterIdentity (d : ℕ) (hd : 0 < d) (k : Type) [Field k] [CharZero k]
    [IsAlgClosed k] (π : SupercuspidalRep (ReductiveGroup.GL K d) k)
    (p : EllipticMatchingPair K d) :
    harishChandraCharacter (ReductiveGroup.GL K d) π.toIrr
        ((ReductiveGroup.GL.pointsEquiv (E := K) d).symm p.g) =
      (-1) ^ (d - 1) * harishChandraCharacter (divisionUnitsGroup K d) (localJL K d k π)
        ((divisionUnitsGroup.pointsEquiv K d).symm p.h) := by
  sorry

-- acceptance (local-character-identity): for `d = 2` the elliptic character sign is `-1`
example (k : Type) [Field k] [CharZero k] [IsAlgClosed k]
    (π : SupercuspidalRep (ReductiveGroup.GL K 2) k) (p : EllipticMatchingPair K 2) :
    harishChandraCharacter (ReductiveGroup.GL K 2) π.toIrr
        ((ReductiveGroup.GL.pointsEquiv (E := K) 2).symm p.g) =
      -harishChandraCharacter (divisionUnitsGroup K 2) (localJL K 2 k π)
        ((divisionUnitsGroup.pointsEquiv K 2).symm p.h) := by
  rw [localCharacterIdentity K 2 (by norm_num) k π p]
  ring

end LocalHarmonic

/-! ### Local supercuspidal selectors (`function-field-automorphic/cuspidal-local-selector`) -/

section Selector

variable {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  {d : ℕ}

/-- The space `π^{K₀}` of `K₀`-fixed vectors of a supercuspidal representation over `ℂ`
(`SmoothRepresentationsOfLocalGroups:SR.1`). -/
def SupercuspidalRep.fixedVectors (π : SupercuspidalRep (ReductiveGroup.GL K d) ℂ)
    (K₀ : Subgroup (GL (Fin d) K)) : Type := sorry

instance (π : SupercuspidalRep (ReductiveGroup.GL K d) ℂ) (K₀ : Subgroup (GL (Fin d) K)) :
    AddCommGroup (π.fixedVectors K₀) := sorry

instance (π : SupercuspidalRep (ReductiveGroup.GL K d) ℂ) (K₀ : Subgroup (GL (Fin d) K)) :
    Module ℂ (π.fixedVectors K₀) := sorry

/-- The compressed action `v ↦ e_{K₀} π(g) v` on `π^{K₀}` (`e_{K₀}` the averaging projector). -/
def SupercuspidalRep.compressedAction (π : SupercuspidalRep (ReductiveGroup.GL K d) ℂ)
    (K₀ : Subgroup (GL (Fin d) K)) (g : GL (Fin d) K) :
    π.fixedVectors K₀ →ₗ[ℂ] π.fixedVectors K₀ := sorry

/-- The nonzero normalising scalar `c` of LRS 15.10 (from the equivariant map of `π` into the
compact induction; equal to the formal degree up to the volume of `K₀`). -/
def SupercuspidalRep.selectorScalar (π : SupercuspidalRep (ReductiveGroup.GL K d) ℂ)
    (K₀ : Subgroup (GL (Fin d) K)) : ℂ := sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/cuspidal-local-selector`.
API `CuspidalSelector`: for a supercuspidal `π` of `GL_d(K)` over `ℂ` (unitary central
character) and a compact open `K₀` with `π^{K₀} ≠ 0`, the normalised matrix-coefficient test
`f_π = c⁻¹ φ(π(1_{K₀}))` of LRS 15.10, i.e. `f_π(g) = c⁻¹ tr(e_{K₀} π(g⁻¹) | π^{K₀})`. It is
bi-`K₀`-invariant, transforms under the centre by the inverse central character, has compact
support modulo the centre, and is not the indicator of `K₀`. -/
def CuspidalSelector (π : SupercuspidalRep (ReductiveGroup.GL K d) ℂ)
    (K₀ : Subgroup (GL (Fin d) K)) : GL (Fin d) K → ℂ :=
  fun g => (π.selectorScalar K₀)⁻¹ * LinearMap.trace ℂ _ (π.compressedAction K₀ g⁻¹)

/-- API `CuspidalSelector.value_one`: `f_π(1) = c⁻¹ dim π^{K₀} ≠ 0` (for compact open `K₀`
with `π^{K₀} ≠ 0`). -/
theorem CuspidalSelector.value_one (π : SupercuspidalRep (ReductiveGroup.GL K d) ℂ)
    (K₀ : Subgroup (GL (Fin d) K)) (hK₀o : IsOpen (K₀ : Set (GL (Fin d) K)))
    (hK₀c : IsCompact (K₀ : Set (GL (Fin d) K))) (hne : Nontrivial (π.fixedVectors K₀)) :
    CuspidalSelector π K₀ 1 =
        (π.selectorScalar K₀)⁻¹ * (Module.finrank ℂ (π.fixedVectors K₀) : ℂ) ∧
      CuspidalSelector π K₀ 1 ≠ 0 := by
  sorry

/-- API `CuspidalSelector.trace`: `tr π(f_π) ≠ 0`, and `tr σ(f_π) = 0` for every supercuspidal
`σ ≇ π` with the same central character. -/
theorem CuspidalSelector.trace (π : SupercuspidalRep (ReductiveGroup.GL K d) ℂ)
    (K₀ : Subgroup (GL (Fin d) K)) (hK₀o : IsOpen (K₀ : Set (GL (Fin d) K)))
    (hK₀c : IsCompact (K₀ : Set (GL (Fin d) K))) (hne : Nontrivial (π.fixedVectors K₀))
    [MeasurableSpace (GL (Fin d) K)] [BorelSpace (GL (Fin d) K)]
    (μ : Measure (GL (Fin d) K)) [μ.IsHaarMeasure] :
    glTrace K d π.toIrr μ (CuspidalSelector π K₀) ≠ 0 ∧
      ∀ σ : SupercuspidalRep (ReductiveGroup.GL K d) ℂ, σ.toIrr ≠ π.toIrr →
        σ.toIrr.centralCharacter = π.toIrr.centralCharacter →
        glTrace K d σ.toIrr μ (CuspidalSelector π K₀) = 0 := by
  sorry

/-- API `CuspidalSelector.support`: `f_π` is bi-`K₀`-invariant and its support is compact
modulo the centre. -/
theorem CuspidalSelector.support (π : SupercuspidalRep (ReductiveGroup.GL K d) ℂ)
    (K₀ : Subgroup (GL (Fin d) K)) (hK₀o : IsOpen (K₀ : Set (GL (Fin d) K)))
    (hK₀c : IsCompact (K₀ : Set (GL (Fin d) K))) :
    (∀ (g : GL (Fin d) K) (a b : GL (Fin d) K), a ∈ K₀ → b ∈ K₀ →
        CuspidalSelector π K₀ (a * g * b) = CuspidalSelector π K₀ g) ∧
      IsCompact ((QuotientGroup.mk :
          GL (Fin d) K → GL (Fin d) K ⧸ Subgroup.center (GL (Fin d) K)) ''
        Function.support (CuspidalSelector π K₀)) := by
  sorry

-- CuspidalSelector.value_test: for `dim π^{K₀} = 1` and `c = 1`, `f_π(1) = 1`
example (π : SupercuspidalRep (ReductiveGroup.GL K d) ℂ) (K₀ : Subgroup (GL (Fin d) K))
    (h1 : Module.finrank ℂ (π.fixedVectors K₀) = 1) (hc : π.selectorScalar K₀ = 1) :
    CuspidalSelector π K₀ 1 = 1 := by
  sorry

-- CuspidalSelector.central_test: `f_π(z g) = ω_π(z)⁻¹ f_π(g)` (inverse central character)
example (π : SupercuspidalRep (ReductiveGroup.GL K d) ℂ) (K₀ : Subgroup (GL (Fin d) K))
    (z : Kˣ) (g : GL (Fin d) K) :
    CuspidalSelector π K₀ (Matrix.GeneralLinearGroup.scalar (Fin d) z * g) =
      ((π.toIrr.centralCharacter z : ℂˣ) : ℂ)⁻¹ * CuspidalSelector π K₀ g := by
  sorry

-- `1_{K₀}` acts nontrivially on every `σ` with `σ^{K₀} ≠ 0`.
-- CuspidalSelector.indicator_test: unlike `1_{K₀}`, `f_π` kills supercuspidals `σ ≇ π`
example (π σ : SupercuspidalRep (ReductiveGroup.GL K d) ℂ) (K₀ : Subgroup (GL (Fin d) K))
    (hK₀o : IsOpen (K₀ : Set (GL (Fin d) K))) (hK₀c : IsCompact (K₀ : Set (GL (Fin d) K)))
    (hπ : Nontrivial (π.fixedVectors K₀)) (hσ : Nontrivial (σ.fixedVectors K₀))
    (hne : σ.toIrr ≠ π.toIrr) (hω : σ.toIrr.centralCharacter = π.toIrr.centralCharacter)
    [MeasurableSpace (GL (Fin d) K)] [BorelSpace (GL (Fin d) K)]
    (μ : Measure (GL (Fin d) K)) [μ.IsHaarMeasure] :
    glTrace K d σ.toIrr μ (Set.indicator (K₀ : Set (GL (Fin d) K)) 1) ≠ 0 ∧
      glTrace K d σ.toIrr μ (CuspidalSelector π K₀) = 0 := by
  sorry

end Selector

/-! ### Global comparison with `GL_d`: simple trace formula, globalisation, transfer -/

section GlobalComparison

variable {q : ℕ} (X : FFCurve q)

/-- `ϖ_∞` as a central element of `GL_d(A_F)`. -/
def adelicGLUniformizer {q : ℕ} (X : FFCurve q) (d : ℕ) (infty : X.Place) : adelicGL X d :=
  sorry

/-- The degree lattice `ϖ_∞^ℤ ⊆ GL_d(A_F)`. -/
def glDegreeLattice (d : ℕ) (infty : X.Place) : Subgroup (adelicGL X d) :=
  Subgroup.zpowers (adelicGLUniformizer X d infty)

/-- Test functions on `GL_d(A_F)/ϖ_∞^ℤ`: locally constant, compactly supported. -/
structure GLTestFunction {q : ℕ} (X : FFCurve q) (d : ℕ) (infty : X.Place) (k : Type)
    [Field k] where
  /-- The underlying locally constant function. -/
  toFun : LocallyConstant (adelicGL X d ⧸ glDegreeLattice X d infty) k
  hasCompactSupport : HasCompactSupport toFun

/-- Cuspidal automorphic representations of `GL_d(A_F)` on which `ϖ_∞^ℤ` acts trivially, with
coefficients in `k` (`FunctionFieldArithmetic:FA.6`, `AutomorphicSpectralTheory:AS.0`). -/
def CuspidalAutomorphicRepGL {q : ℕ} (X : FFCurve q) (d : ℕ) (infty : X.Place) (k : Type)
    [Field k] : Type := sorry

variable {X}

/-- The multiplicity of a cuspidal automorphic representation in the cuspidal spectrum. -/
def CuspidalAutomorphicRepGL.multiplicity {d : ℕ} {infty : X.Place} {k : Type} [Field k]
    (Pi_ : CuspidalAutomorphicRepGL X d infty k) : ℕ := sorry

/-- The local component `Π̃_x`, an irreducible smooth representation of `GL_d(F_x)`. -/
def CuspidalAutomorphicRepGL.localComponent {d : ℕ} {infty : X.Place} {k : Type} [Field k]
    (Pi_ : CuspidalAutomorphicRepGL X d infty k) (x : X.Place) :
    IrrSmoothRep (ReductiveGroup.GL x.completion d) k := sorry

/-- The trace `tr Π̃(f)` of the finite-rank operator `Π̃(f)` (fixed Haar measure of `AA.0`). -/
def CuspidalAutomorphicRepGL.trace {d : ℕ} {infty : X.Place} {k : Type} [Field k]
    (Pi_ : CuspidalAutomorphicRepGL X d infty k) (f : GLTestFunction X d infty k) : k := sorry

variable (X)

/-- Matched factorizable test pairs `(f, f')` on `GL_d(A_F)` and `D^×(A_F)` of LRS 15.10, as a
carrier type: a supercuspidal selector (`CuspidalSelector`) at an auxiliary split place, an
elliptic-regular support condition at a further place, Euler–Poincaré functions at `∞`, matching
local functions at the ramified places of `D`, equal components elsewhere, and a common central
character. -/
def SimpleTraceTestPair {q : ℕ} (X : FFCurve q) (D : Type) [DivisionRing D]
    [Algebra X.functionField D] [Algebra.IsCentral X.functionField D]
    [FiniteDimensional X.functionField D] (d : ℕ) (infty : X.Place) (k : Type) [Field k] :
    Type := sorry

variable {X}

/-- The `GL_d` side `f` of a matched test pair. -/
def SimpleTraceTestPair.glTest {D : Type} [DivisionRing D] [Algebra X.functionField D]
    [Algebra.IsCentral X.functionField D] [FiniteDimensional X.functionField D] {d : ℕ}
    {infty : X.Place} {k : Type} [Field k] (p : SimpleTraceTestPair X D d infty k) :
    GLTestFunction X d infty k := sorry

/-- The `D^×` side `f'` of a matched test pair. -/
def SimpleTraceTestPair.dTest {D : Type} [DivisionRing D] [Algebra X.functionField D]
    [Algebra.IsCentral X.functionField D] [FiniteDimensional X.functionField D] {d : ℕ}
    {infty : X.Place} {k : Type} [Field k] (p : SimpleTraceTestPair X D d infty k) :
    DTestFunction X D infty k := sorry

variable (X)

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/simple-trace-comparison`.
For a matched factorizable test pair (supercuspidal selector at an auxiliary split place,
elliptic-regular support at a further place, Euler–Poincaré functions at `∞`, matching functions
at the ramified places), the cuspidal `GL_d` spectral side equals the `D^×` spectral side:
`Σ_Π̃ m(Π̃) tr Π̃(f) = Σ_A m(A) tr A(f')`, both sums finite. This is the selected identity of
LRS 15.10, not a general invariant trace formula or a general global Jacquet–Langlands
correspondence; the precise Deligne–Kazhdan/Henniart expansion is an open gap of the packet. -/
theorem simpleTraceComparison (D : Type) [DivisionRing D] [Algebra X.functionField D]
    [Algebra.IsCentral X.functionField D] [FiniteDimensional X.functionField D] (d : ℕ)
    (hd : Module.finrank X.functionField D = d ^ 2) (infty : X.Place) (hinf : infty.degree = 1)
    (k : Type) [Field k] [CharZero k] [IsAlgClosed k] (p : SimpleTraceTestPair X D d infty k) :
    (Function.support fun Pi_ : CuspidalAutomorphicRepGL X d infty k =>
        (Pi_.multiplicity : k) * Pi_.trace p.glTest).Finite ∧
      (Function.support fun A : AutomorphicRep X D infty k =>
        (A.multiplicity : k) * A.trace p.dTest).Finite ∧
      ∑ᶠ Pi_ : CuspidalAutomorphicRepGL X d infty k, (Pi_.multiplicity : k) * Pi_.trace p.glTest =
        ∑ᶠ A : AutomorphicRep X D infty k, (A.multiplicity : k) * A.trace p.dTest := by
  sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/globalisation`.
Let `o ≠ o'` be places, `∞` a rational place different from both, `x₂ ∉ {o, o', ∞}`, and `π` a
supercuspidal representation of `GL_d(F_o)` with finite-order central character. There is a
cuspidal automorphic `Π̃` of `GL_d(A_F)` with `Π̃_o ≅ π`, `Π̃_∞ ≅ St`, and `Π̃_{o'}`, `Π̃_{x₂}`
supercuspidal (LRS 15.10). Omitted: the compatible global choice of central character (no
global central-character carrier); the auxiliary elliptic place `x₃` enters only the proof. -/
theorem globalisation (d : ℕ) (hd : 0 < d) (k : Type) [Field k] [CharZero k] [IsAlgClosed k]
    (o o' x₂ infty : X.Place) (hinf : infty.degree = 1) (hoo' : o ≠ o') (hoinf : o ≠ infty)
    (ho'inf : o' ≠ infty) (hx₂ : x₂ ≠ o ∧ x₂ ≠ o' ∧ x₂ ≠ infty)
    (π : SupercuspidalRep (ReductiveGroup.GL o.completion d) k)
    (hπ : IsOfFinOrder π.toIrr.centralCharacter) :
    ∃ Pi_ : CuspidalAutomorphicRepGL X d infty k,
      Pi_.localComponent o = π.toIrr ∧
        Pi_.localComponent infty = glSteinbergRep infty.completion d k ∧
        (∃ σ : SupercuspidalRep (ReductiveGroup.GL o'.completion d) k,
          σ.toIrr = Pi_.localComponent o') ∧
        ∃ σ : SupercuspidalRep (ReductiveGroup.GL x₂.completion d) k,
          σ.toIrr = Pi_.localComponent x₂ := by
  sorry

variable (D : Type) [DivisionRing D] [Algebra X.functionField D]
  [Algebra.IsCentral X.functionField D] [FiniteDimensional X.functionField D]

/-- The Hasse invariant `inv_x(D) ∈ ℚ/ℤ` of `D_x` (`FunctionFieldArithmetic:FA.6`, local class
field theory). -/
def localInvariant {q : ℕ} (X : FFCurve q) (D : Type) [DivisionRing D]
    [Algebra X.functionField D] [Algebra.IsCentral X.functionField D]
    [FiniteDimensional X.functionField D] (x : X.Place) : AddCircle (1 : ℚ) := sorry

variable {X D}

/-- At a split place `x` (`inv_x(D) = 0`), transport of representations of `GL_d(F_x)` to
`D_x^×` along `D_x ≅ M_d(F_x)` (well defined up to inner automorphisms, hence on isomorphism
classes); only used at split places. -/
def splitTransport {d : ℕ} {k : Type} [Field k] (x : X.Place) :
    IrrSmoothRep (ReductiveGroup.GL x.completion d) k → IrrSmoothRep (localUnitsGroup X D x) k :=
  sorry

/-- The local Jacquet–Langlands correspondence at a place `x` where `D_x` is a division algebra
of dimension `d²` (any invariant of order `d`), from supercuspidal representations of
`GL_d(F_x)` to `D_x^×`. -/
def localJLAt {d : ℕ} {k : Type} [Field k] (x : X.Place) :
    SupercuspidalRep (ReductiveGroup.GL x.completion d) k →
      IrrSmoothRep (localUnitsGroup X D x) k := sorry

/-- `A` is the transfer of `Π̃`: `A_x = Π̃_x` at the split places `x ∉ {o, o'}` and
`A_x = JL(Π̃_x)` at `o` and `o'`. -/
def IsJLTransferOf {d : ℕ} {infty : X.Place} {k : Type} [Field k] (o o' : X.Place)
    (A : AutomorphicRep X D infty k) (Pi_ : CuspidalAutomorphicRepGL X d infty k)
    (σo : SupercuspidalRep (ReductiveGroup.GL o.completion d) k)
    (σo' : SupercuspidalRep (ReductiveGroup.GL o'.completion d) k) : Prop :=
  A.localComponent o = localJLAt o σo ∧ A.localComponent o' = localJLAt o' σo' ∧
    ∀ x : X.Place, x ≠ o → x ≠ o' → A.localComponent x = splitTransport x (Pi_.localComponent x)

variable (X D)

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/jacquet-langlands-transfer`.
Let `D` have invariants `1/d` at `o`, `-1/d` at `o'` and `0` elsewhere, and let `Π̃` be cuspidal
with supercuspidal components at `o`, `o'` and at an auxiliary place `v` OUTSIDE the ramified set
`{o, o'}` (Hausberger 10.4(2)). Then there is a unique automorphic `A` of `D^×(A_F)` with
`A_x = Π̃_x` at split places and `A_x = JL(Π̃_x)` at `o`, `o'`, and it has multiplicity one
(asserted only for this transfer image). -/
theorem jacquetLanglandsTransfer (d : ℕ) (hd : 0 < d)
    (hdim : Module.finrank X.functionField D = d ^ 2) (k : Type) [Field k] [CharZero k]
    [IsAlgClosed k] (o o' infty : X.Place) (hinf : infty.degree = 1) (hoo' : o ≠ o')
    (hoinf : o ≠ infty) (ho'inf : o' ≠ infty)
    (hinvo : localInvariant X D o = ((1 / d : ℚ) : AddCircle (1 : ℚ)))
    (hinvo' : localInvariant X D o' = ((-1 / d : ℚ) : AddCircle (1 : ℚ)))
    (hinv : ∀ x : X.Place, x ≠ o → x ≠ o' → localInvariant X D x = 0)
    (Pi_ : CuspidalAutomorphicRepGL X d infty k)
    (σo : SupercuspidalRep (ReductiveGroup.GL o.completion d) k)
    (hσo : σo.toIrr = Pi_.localComponent o)
    (σo' : SupercuspidalRep (ReductiveGroup.GL o'.completion d) k)
    (hσo' : σo'.toIrr = Pi_.localComponent o')
    (v : X.Place) (hv : v ≠ o ∧ v ≠ o')
    (σv : SupercuspidalRep (ReductiveGroup.GL v.completion d) k)
    (hσv : σv.toIrr = Pi_.localComponent v) :
    (∃! A : AutomorphicRep X D infty k, IsJLTransferOf o o' A Pi_ σo σo') ∧
      ∀ A : AutomorphicRep X D infty k, IsJLTransferOf o o' A Pi_ σo σo' →
        A.multiplicity = 1 := by
  sorry

end GlobalComparison

end

end TauCeti.Blueprint.Excursion.ES7


namespace TauCeti.Blueprint.Excursion.ES7

noncomputable section

/-! ### Equal characteristic, geometric half: D-elliptic sheaves

Carriers for the missing geometry. The curve `X` as an `F_q`-scheme, the category of locally
free right `𝒟`-modules on `X × S` (for the maximal-order sheaf `𝒟` fixed by
`function-field-automorphic/maximal-orders`), the Frobenius pullback `τ = (id_X × Frob_S)^*`,
the twist `− ⊗ O(∞ × S)` and the restriction to a level `I × S` are owned by
`SchemeAndStackFoundations:SF.0`/`SF.3` (sheaf algebras `SF.2/sheaf-algebra`) and
`AlgebraicModuliForArithmeticGeometry:R09.4`. They appear below as opaque carriers attached to
the genuine parameters `X`, `D`, `∞`, `S`. -/

section DEllipticGeometry

open AlgebraicGeometry
open scoped TensorProduct

variable {q : ℕ}

/-- The constant field `F_q` of the curve `X` (owned by `FunctionFieldArithmetic:FA.2`). -/
def FFCurve.constantField (X : FFCurve q) : Type := sorry

instance (X : FFCurve q) : Field X.constantField := sorry
instance (X : FFCurve q) : Fintype X.constantField := sorry

/-- The constant field has `q` elements. -/
lemma FFCurve.card_constantField (X : FFCurve q) : Fintype.card X.constantField = q := by
  sorry

/-- The category of schemes over `F_q` (Mathlib `Over (Spec F_q)`), the bases `S` of
D-elliptic sheaves. -/
abbrev FFCurve.BaseScheme (X : FFCurve q) : Type 1 :=
  Over (Spec (CommRingCat.of X.constantField))

/-- The curve `X` as an `F_q`-scheme (owned by `FunctionFieldArithmetic:FA.2` and
`SchemeAndStackFoundations:SF.0`). -/
def FFCurve.asScheme (X : FFCurve q) : X.BaseScheme := sorry

/-- The closed point of `X` underlying a place. -/
def FFCurve.Place.point {X : FFCurve q} (x : X.Place) : X.asScheme.left := sorry

/-- The open subscheme `X ∖ T` (the complement of the closure of the points of `T`; for a
finite set of places this is `X` minus those closed points). A genuine definition. -/
def FFCurve.awayFrom (X : FFCurve q) (T : Set X.Place) : X.asScheme.left.Opens :=
  ⟨(closure ((fun x : X.Place => x.point) '' T))ᶜ, isClosed_closure.isOpen_compl⟩

variable (X : FFCurve q) (D : Type) [Ring D] [Algebra X.functionField D]
  [Algebra.IsCentral X.functionField D] [IsSimpleRing D] [FiniteDimensional X.functionField D]

/-- The degree `d` of the central simple algebra `D`, `[D : F] = d²` (genuine definition). -/
noncomputable def divAlgDegree (X : FFCurve q) (D : Type) [Ring D] [Algebra X.functionField D] :
    ℕ :=
  Nat.sqrt (Module.finrank X.functionField D)

/-- `D` is split at `x`: `F_x ⊗_F D ≅ M_d(F_x)` as `F_x`-algebras (genuine definition). -/
def DEllIsSplitAt (X : FFCurve q) (D : Type) [Ring D] [Algebra X.functionField D]
    (x : X.Place) : Prop :=
  Nonempty ((x.completion ⊗[X.functionField] D) ≃ₐ[x.completion]
    Matrix (Fin (divAlgDegree X D)) (Fin (divAlgDegree X D)) x.completion)

/-- The ramification set `R = {x : D_x is not split}` (genuine definition). -/
def DEllRamification (X : FFCurve q) (D : Type) [Ring D] [Algebra X.functionField D] :
    Set X.Place :=
  {x | ¬ DEllIsSplitAt X D x}

/-- The Hasse invariant `inv_x(D) ∈ ℚ/ℤ` (`FunctionFieldArithmetic:FA.6`). -/
def hasseInvariant (X : FFCurve q) (D : Type) [Ring D] [Algebra X.functionField D]
    (x : X.Place) : AddCircle (1 : ℚ) := sorry

/-- The category of locally free right `𝒟_{X×S}`-modules on `X × S` (`𝒟` the maximal-order
sheaf of `function-field-automorphic/maximal-orders`; owned by `SchemeAndStackFoundations:SF.3`
with `SF.2/sheaf-algebra`). -/
def RightDModuleBundle (X : FFCurve q) (D : Type) [Ring D] [Algebra X.functionField D]
    (S : X.BaseScheme) : Type 1 := sorry

instance (S : X.BaseScheme) : Category.{0} (RightDModuleBundle X D S) := sorry

/-- The abelian category of quasi-coherent right `𝒟_{X×S}`-modules on `X × S`
(`SchemeAndStackFoundations:SF.3`). -/
def RightDModuleQCoh (X : FFCurve q) (D : Type) [Ring D] [Algebra X.functionField D]
    (S : X.BaseScheme) : Type 1 := sorry

instance (S : X.BaseScheme) : Category.{0} (RightDModuleQCoh X D S) := sorry
instance (S : X.BaseScheme) : Abelian (RightDModuleQCoh X D S) := sorry

/-- The underlying quasi-coherent module of a locally free one. -/
def RightDModuleBundle.toQCoh (S : X.BaseScheme) :
    RightDModuleBundle X D S ⥤ RightDModuleQCoh X D S := sorry

/-- The rank of a locally free right `𝒟`-module as an `O_{X×S}`-module. -/
def RightDModuleBundle.rank {S : X.BaseScheme} (E : RightDModuleBundle X D S) : ℕ := sorry

/-- The Frobenius pullback `τ = (id_X × Frob_S)^*`, `Frob_S` the absolute `q`-Frobenius of `S`.
-/
def RightDModuleBundle.frobeniusPullback (S : X.BaseScheme) :
    RightDModuleBundle X D S ⥤ RightDModuleBundle X D S := sorry

/-- The twist `E ↦ E(∞ × S) = E ⊗ O_X(∞)` by the divisor of a place `∞`. -/
def RightDModuleBundle.twistByInfinity (infty : X.Place) (S : X.BaseScheme) :
    RightDModuleBundle X D S ⥤ RightDModuleBundle X D S := sorry

/-- The canonical inclusion `E ⟶ E(∞ × S)`. -/
def RightDModuleBundle.twistInclusion (infty : X.Place) (S : X.BaseScheme) :
    𝟭 (RightDModuleBundle X D S) ⟶ RightDModuleBundle.twistByInfinity X D infty S := sorry

/-- `τ` commutes with the twist: `τ(E(∞)) ≅ (τE)(∞)` (the divisor `∞ × S` is `τ`-stable). -/
def RightDModuleBundle.frobTwistIso (infty : X.Place) (S : X.BaseScheme) :
    RightDModuleBundle.twistByInfinity X D infty S ⋙ RightDModuleBundle.frobeniusPullback X D S ≅
      RightDModuleBundle.frobeniusPullback X D S ⋙ RightDModuleBundle.twistByInfinity X D infty S :=
  sorry

/-- Pullback along `id_X × f` for a morphism `f : S' ⟶ S` of `F_q`-schemes. -/
def RightDModuleBundle.pullback {S S' : X.BaseScheme} (f : S' ⟶ S) :
    RightDModuleBundle X D S ⥤ RightDModuleBundle X D S' := sorry

/-- Pullback commutes with `τ` (the absolute Frobenius commutes with every morphism). -/
def RightDModuleBundle.pullbackFrobIso {S S' : X.BaseScheme} (f : S' ⟶ S) :
    RightDModuleBundle.frobeniusPullback X D S ⋙ RightDModuleBundle.pullback X D f ≅
      RightDModuleBundle.pullback X D f ⋙ RightDModuleBundle.frobeniusPullback X D S' := sorry

/-- Pullback commutes with the twist by `∞`. -/
def RightDModuleBundle.pullbackTwistIso (infty : X.Place) {S S' : X.BaseScheme} (f : S' ⟶ S) :
    RightDModuleBundle.twistByInfinity X D infty S ⋙ RightDModuleBundle.pullback X D f ≅
      RightDModuleBundle.pullback X D f ⋙ RightDModuleBundle.twistByInfinity X D infty S' := sorry

/-- The category of locally free right `𝒟`-modules on `(X ∖ {∞}) × S`. -/
def RightDModuleBundle.AwayFrom (X : FFCurve q) (D : Type) [Ring D] [Algebra X.functionField D]
    (infty : X.Place) (S : X.BaseScheme) : Type 1 := sorry

instance (infty : X.Place) (S : X.BaseScheme) :
    Category.{0} (RightDModuleBundle.AwayFrom X D infty S) := sorry

/-- Restriction to `(X ∖ {∞}) × S`. -/
def RightDModuleBundle.restrictAway (infty : X.Place) (S : X.BaseScheme) :
    RightDModuleBundle X D S ⥤ RightDModuleBundle.AwayFrom X D infty S := sorry

/-- The `d`-fold (more generally `n`-fold) composite `E_i ⟶ E_{i+n}` of a chain of maps. -/
def chainComp {C : Type*} [Category C] (E : ℤ → C) (j : ∀ i, E i ⟶ E (i + 1)) (i : ℤ) :
    (n : ℕ) → (E i ⟶ E (i + n))
  | 0 => eqToHom (by simp)
  | n + 1 => chainComp E j i n ≫ j (i + n) ≫ eqToHom (by push_cast; ring_nf)

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`.
A D-elliptic sheaf over an `F_q`-scheme `S` (Hausberger, Def. 1.1; LRS §2), with `D` central
simple of degree `d`, split at the rational place `∞`, and `R` its ramification set: a chain of
locally free right `𝒟`-modules `E_i` on `X × S` of `O`-rank `d²`, injections `j_i : E_i → E_{i+1}`
and `t_i : τE_i → E_{i+1}` (the node's indexing), commuting squares `τ(j_i) ≫ t_{i+1} = t_i ≫ j_{i+1}`,
periodicity `E_{i+d} ≅ E_i(∞ × S)` under which the `d`-fold composite of `j` is the canonical
inclusion and which is compatible with `j` and `t`, `j_i` an isomorphism away from `∞ × S`
(the support part of the pole condition), and a zero `z : S → X ∖ ({∞} ∪ R)` over `F_q`.
Omitted (need coherent-sheaf support, pushforward along graphs and Euler characteristics):
`E_i / j_{i−1}E_{i−1} = (Γ_∞)_* A_i`, `E_i / t_{i−1}(τE_{i−1}) = (Γ_z)_* B_i` with `A_i`, `B_i`
locally free of rank `d` (so the zero is only recorded as data), and the normalisation
`0 ≤ χ(E_0|X×s) < d`; the moduli functor below divides by the index shift instead. -/
structure DEllipticSheaf (infty : X.Place) (S : X.BaseScheme) where
  /-- The chain `E_i`. -/
  E : ℤ → RightDModuleBundle X D S
  rank_eq : ∀ i, (E i).rank = divAlgDegree X D ^ 2
  /-- The maps `j_i : E_i → E_{i+1}`. -/
  j : ∀ i, E i ⟶ E (i + 1)
  /-- The maps `t_i : τE_i → E_{i+1}`. -/
  t : ∀ i, (RightDModuleBundle.frobeniusPullback X D S).obj (E i) ⟶ E (i + 1)
  mono_j : ∀ i, Mono ((RightDModuleBundle.toQCoh X D S).map (j i))
  mono_t : ∀ i, Mono ((RightDModuleBundle.toQCoh X D S).map (t i))
  comm : ∀ i, (RightDModuleBundle.frobeniusPullback X D S).map (j i) ≫ t (i + 1) = t i ≫ j (i + 1)
  /-- The periodicity isomorphism `E_{i+d} ≅ E_i(∞ × S)`. -/
  period : ∀ i, E (i + divAlgDegree X D) ≅ (RightDModuleBundle.twistByInfinity X D infty S).obj (E i)
  period_chain : ∀ i, chainComp E j i (divAlgDegree X D) ≫ (period i).hom =
    (RightDModuleBundle.twistInclusion X D infty S).app (E i)
  period_j : ∀ i, j (i + divAlgDegree X D) ≫ eqToHom (by ring_nf) ≫ (period (i + 1)).hom =
    (period i).hom ≫ (RightDModuleBundle.twistByInfinity X D infty S).map (j i)
  period_t : ∀ i, (RightDModuleBundle.frobeniusPullback X D S).map (period i).hom ≫
      ((RightDModuleBundle.frobTwistIso X D infty S).app (E i)).hom ≫
      (RightDModuleBundle.twistByInfinity X D infty S).map (t i) =
    t (i + divAlgDegree X D) ≫ eqToHom (by ring_nf) ≫ (period (i + 1)).hom
  pole_away : ∀ i, IsIso ((RightDModuleBundle.restrictAway X D infty S).map (j i))
  /-- The zero `z : S → X ∖ ({∞} ∪ R)`. -/
  zero : S.left ⟶ (X.awayFrom ({infty} ∪ DEllRamification X D) : Scheme)
  zero_over : zero ≫ (X.awayFrom ({infty} ∪ DEllRamification X D)).ι ≫ X.asScheme.hom = S.hom


namespace DEllipticSheaf

variable {X D} {infty : X.Place} {S : X.BaseScheme}

/-- Morphisms of D-elliptic sheaves: `D`-linear chain maps commuting with `j` and `t`, with the
same zero. -/
@[ext]
structure Hom (E E' : DEllipticSheaf X D infty S) where
  /-- The components `E_i ⟶ E'_i`. -/
  f : ∀ i, E.E i ⟶ E'.E i
  comm_j : ∀ i, f i ≫ E'.j i = E.j i ≫ f (i + 1)
  comm_t : ∀ i, (RightDModuleBundle.frobeniusPullback X D S).map (f i) ≫ E'.t i =
    E.t i ≫ f (i + 1)
  zero_eq : E.zero = E'.zero

instance : Category (DEllipticSheaf X D infty S) where
  Hom := Hom
  id E := ⟨fun i => 𝟙 _, by simp, by simp, rfl⟩
  comp f g := ⟨fun i => f.f i ≫ g.f i, sorry, sorry, f.zero_eq.trans g.zero_eq⟩
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- API `DEllipticSheaf.ext`: an isomorphism of D-elliptic sheaves is exactly a family of
isomorphisms `E_i ≅ E'_i` commuting with `j` and `t` (and the zeros agree). -/
def ext (E E' : DEllipticSheaf X D infty S) :
    (E ≅ E') ≃ {e : ∀ i, E.E i ≅ E'.E i //
      (∀ i, (e i).hom ≫ E'.j i = E.j i ≫ (e (i + 1)).hom) ∧
      (∀ i, (RightDModuleBundle.frobeniusPullback X D S).map (e i).hom ≫ E'.t i =
        E.t i ≫ (e (i + 1)).hom) ∧ E.zero = E'.zero} := sorry

/-- API `DEllipticSheaf.pullback`: pullback along `S' ⟶ S`, transporting `τ`, `j`, `t`, the
zero and the periodicity data. -/
def pullback {S' : X.BaseScheme} (f : S' ⟶ S) (E : DEllipticSheaf X D infty S) :
    DEllipticSheaf X D infty S' where
  E i := (RightDModuleBundle.pullback X D f).obj (E.E i)
  rank_eq := sorry
  j i := (RightDModuleBundle.pullback X D f).map (E.j i)
  t i := ((RightDModuleBundle.pullbackFrobIso X D f).app (E.E i)).inv ≫
    (RightDModuleBundle.pullback X D f).map (E.t i)
  mono_j := sorry
  mono_t := sorry
  comm := sorry
  period i := (RightDModuleBundle.pullback X D f).mapIso (E.period i) ≪≫
    (RightDModuleBundle.pullbackTwistIso X D infty f).app (E.E i)
  period_chain := sorry
  period_j := sorry
  period_t := sorry
  pole_away := sorry
  zero := f.left ≫ E.zero
  zero_over := by rw [Category.assoc, E.zero_over]; exact Over.w f

/-- The zero of a pulled-back D-elliptic sheaf is the pulled-back zero. -/
lemma pullback_zero {S' : X.BaseScheme} (f : S' ⟶ S) (E : DEllipticSheaf X D infty S) :
    (E.pullback f).zero = f.left ≫ E.zero := rfl

/-- Index shift `E_i ↦ E_{i+k}` (the `ℤ`-action divided out by the normalisation). -/
def shift (k : ℤ) (E : DEllipticSheaf X D infty S) : DEllipticSheaf X D infty S where
  E i := E.E (i + k)
  rank_eq i := E.rank_eq _
  j i := E.j (i + k) ≫ eqToHom (by ring_nf)
  t i := E.t (i + k) ≫ eqToHom (by ring_nf)
  mono_j := sorry
  mono_t := sorry
  comm := sorry
  period i := eqToIso (by ring_nf) ≪≫ E.period (i + k)
  period_chain := sorry
  period_j := sorry
  period_t := sorry
  pole_away := sorry
  zero := E.zero
  zero_over := E.zero_over

/-- The set-theoretic image `z(S) ⊆ X` of the zero. -/
def zeroPoints (E : DEllipticSheaf X D infty S) : Set X.asScheme.left :=
  Set.range (fun s : S.left => (E.zero ≫ (X.awayFrom ({infty} ∪ DEllRamification X D)).ι).base s)

end DEllipticSheaf

/-- Drinfeld's elliptic sheaves of rank `d` with pole `∞` over `S` (owned by
`DrinfeldModulesAndTModules:DM.7`). -/
def DrinfeldEllipticSheaf (X : FFCurve q) (infty : X.Place) (d : ℕ) (S : X.BaseScheme) :
    Type 1 := sorry

instance (infty : X.Place) (d : ℕ) (S : X.BaseScheme) :
    Category.{0} (DrinfeldEllipticSheaf X infty d S) := sorry

/-- The zero `S → X ∖ {∞}` of a Drinfeld elliptic sheaf (`DM.7`). -/
def DrinfeldEllipticSheaf.zero {infty : X.Place} {d : ℕ} {S : X.BaseScheme}
    (E : DrinfeldEllipticSheaf X infty d S) : S.left ⟶ (X.awayFrom {infty} : Scheme) := sorry

/-- API `DEllipticSheaf.matrix_case`: for `D = M_d(F)` the idempotent Morita functor
`E ↦ e₁₁E` is an equivalence with the rank-`d` elliptic sheaves of `DM.7` (with `j`, `t` and the
zero). -/
def DEllipticSheaf.matrix_case (X : FFCurve q) (d : ℕ) [NeZero d] (infty : X.Place)
    (S : X.BaseScheme) :
    DEllipticSheaf X (Matrix (Fin d) (Fin d) X.functionField) infty S ≌
      DrinfeldEllipticSheaf X infty d S := sorry

-- DEllipticSheaf.rank_test: for d = 2 each E_i has O-rank 4.
example {infty : X.Place} {S : X.BaseScheme} (E : DEllipticSheaf X D infty S)
    (hd : divAlgDegree X D = 2) (i : ℤ) : (E.E i).rank = 4 := by
  rw [E.rank_eq i, hd]; rfl

-- DEllipticSheaf.frobenius_test: over S = Spec F_{q²}, τ is the pullback along id_X × σ with σ the q-Frobenius of F_{q²} over F_q (the curve factor is untouched).
example (L : Type) [Field L] [Fintype L] [Algebra X.constantField L]
    (hL : Fintype.card L = q ^ 2) :
    let SL : X.BaseScheme := Over.mk (Spec.map (CommRingCat.ofHom (algebraMap X.constantField L)))
    let σ : SL ⟶ SL := Over.homMk
      (Spec.map (CommRingCat.ofHom (FiniteField.frobeniusAlgHom X.constantField L).toRingHom))
      (by sorry)
    Nonempty (RightDModuleBundle.frobeniusPullback X D SL ≅ RightDModuleBundle.pullback X D σ) := by
  sorry

-- DEllipticSheaf.matrix_test: for D = M_d(F) the Morita functor keeps the zero.
example (d : ℕ) [NeZero d] {infty : X.Place} {S : X.BaseScheme}
    (E : DEllipticSheaf X (Matrix (Fin d) (Fin d) X.functionField) infty S) :
    ((DEllipticSheaf.matrix_case X d infty S).functor.obj E).zero ≫ (X.awayFrom {infty}).ι =
      E.zero ≫ (X.awayFrom ({infty} ∪
        DEllRamification X (Matrix (Fin d) (Fin d) X.functionField))).ι := by
  sorry

/-! #### Level structures -/

/-- The finite ring `𝒟_I = 𝒟 ⊗_{O_X} O_I` for a finite closed subscheme `I ⊂ X`, written as an
effective divisor `I : X.Place →₀ ℕ` (owned by `function-field-automorphic/maximal-orders`). -/
def DEllLevelAlgebra (X : FFCurve q) (D : Type) [Ring D] [Algebra X.functionField D]
    (I : X.Place →₀ ℕ) : Type := sorry

instance (I : X.Place →₀ ℕ) : Ring (DEllLevelAlgebra X D I) := sorry
instance (I : X.Place →₀ ℕ) : Fintype (DEllLevelAlgebra X D I) := sorry

/-- Locally free right `𝒟_I ⊗ O_S`-modules on `I × S` (`SchemeAndStackFoundations:SF.3`). -/
def DEllLevelModule (X : FFCurve q) (D : Type) [Ring D] [Algebra X.functionField D]
    (I : X.Place →₀ ℕ) (S : X.BaseScheme) : Type 1 := sorry

instance (I : X.Place →₀ ℕ) (S : X.BaseScheme) : Category.{0} (DEllLevelModule X D I S) := sorry

/-- The free module `𝒟_I ⊗ O_S`. -/
def DEllLevelModule.trivial (I : X.Place →₀ ℕ) (S : X.BaseScheme) : DEllLevelModule X D I S :=
  sorry

/-- The Frobenius pullback `τ = (id_I × Frob_S)^*` on `I × S`. -/
def DEllLevelModule.frob (I : X.Place →₀ ℕ) (S : X.BaseScheme) :
    DEllLevelModule X D I S ⥤ DEllLevelModule X D I S := sorry

/-- The canonical identification `τ(𝒟_I ⊗ O_S) ≅ 𝒟_I ⊗ O_S`. -/
def DEllLevelModule.trivialFrobIso (I : X.Place →₀ ℕ) (S : X.BaseScheme) :
    (DEllLevelModule.frob X D I S).obj (DEllLevelModule.trivial X D I S) ≅
      DEllLevelModule.trivial X D I S := sorry

/-- Left multiplication by units of `𝒟_I`: automorphisms of the free right module. -/
def DEllLevelModule.unitAut (I : X.Place →₀ ℕ) (S : X.BaseScheme) :
    (DEllLevelAlgebra X D I)ˣ →* Aut (DEllLevelModule.trivial X D I S) := sorry

/-- Restriction `E ↦ E|_{I × S}`. -/
def RightDModuleBundle.restrictLevel (I : X.Place →₀ ℕ) (S : X.BaseScheme) :
    RightDModuleBundle X D S ⥤ DEllLevelModule X D I S := sorry

/-- Restriction commutes with `τ`. -/
def RightDModuleBundle.restrictLevelFrobIso (I : X.Place →₀ ℕ) (S : X.BaseScheme) :
    RightDModuleBundle.frobeniusPullback X D S ⋙ RightDModuleBundle.restrictLevel X D I S ≅
      RightDModuleBundle.restrictLevel X D I S ⋙ DEllLevelModule.frob X D I S := sorry

/-- Reduction modulo `I ≤ I'`. -/
def DEllLevelModule.reduce {I I' : X.Place →₀ ℕ} (h : I ≤ I') (S : X.BaseScheme) :
    DEllLevelModule X D I' S ⥤ DEllLevelModule X D I S := sorry

/-- Reducing the restriction to `I'` gives the restriction to `I`. -/
def DEllLevelModule.reduceRestrictIso {I I' : X.Place →₀ ℕ} (h : I ≤ I') (S : X.BaseScheme) :
    RightDModuleBundle.restrictLevel X D I' S ⋙ DEllLevelModule.reduce X D h S ≅
      RightDModuleBundle.restrictLevel X D I S := sorry

/-- Reduction of the free module. -/
def DEllLevelModule.reduceTrivialIso {I I' : X.Place →₀ ℕ} (h : I ≤ I') (S : X.BaseScheme) :
    (DEllLevelModule.reduce X D h S).obj (DEllLevelModule.trivial X D I' S) ≅
      DEllLevelModule.trivial X D I S := sorry

/-- Base change along `S' ⟶ S` on `I × S`. -/
def DEllLevelModule.pullback (I : X.Place →₀ ℕ) {S S' : X.BaseScheme} (f : S' ⟶ S) :
    DEllLevelModule X D I S ⥤ DEllLevelModule X D I S' := sorry

/-- Base change commutes with restriction to `I`. -/
def DEllLevelModule.pullbackRestrictIso (I : X.Place →₀ ℕ) {S S' : X.BaseScheme} (f : S' ⟶ S) :
    RightDModuleBundle.restrictLevel X D I S ⋙ DEllLevelModule.pullback X D I f ≅
      RightDModuleBundle.pullback X D f ⋙ RightDModuleBundle.restrictLevel X D I S' := sorry

/-- Base change of the free module. -/
def DEllLevelModule.pullbackTrivialIso (I : X.Place →₀ ℕ) {S S' : X.BaseScheme} (f : S' ⟶ S) :
    (DEllLevelModule.pullback X D I f).obj (DEllLevelModule.trivial X D I S) ≅
      DEllLevelModule.trivial X D I S' := sorry

namespace DEllipticSheaf

variable {X D} {infty : X.Place} {S : X.BaseScheme}

/-- For `∞ ∉ I`, the restriction of `j_i` to `I × S` is an isomorphism (from `pole_away`). -/
lemma isIso_restrictLevel_j (E : DEllipticSheaf X D infty S) (I : X.Place →₀ ℕ)
    (hI : infty ∉ I.support) (i : ℤ) :
    IsIso ((RightDModuleBundle.restrictLevel X D I S).map (E.j i)) := by
  sorry

/-- The Frobenius `t_I : τE_I → E_I` on `E_I = E_0|_{I×S}`: restriction of `t_0` followed by the
inverse of the restriction of `j_0`. -/
def levelT (E : DEllipticSheaf X D infty S) (I : X.Place →₀ ℕ) (hI : infty ∉ I.support) :
    (DEllLevelModule.frob X D I S).obj ((RightDModuleBundle.restrictLevel X D I S).obj (E.E 0)) ⟶
      (RightDModuleBundle.restrictLevel X D I S).obj (E.E 0) :=
  haveI := E.isIso_restrictLevel_j I hI 0
  ((RightDModuleBundle.restrictLevelFrobIso X D I S).app (E.E 0)).inv ≫
    (RightDModuleBundle.restrictLevel X D I S).map (E.t 0) ≫
    inv ((RightDModuleBundle.restrictLevel X D I S).map (E.j 0))

end DEllipticSheaf

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/level-structure`.
A level-`I` structure on a D-elliptic sheaf (Hausberger §1.3): for a finite closed subscheme
`I ⊂ X ∖ {∞}` disjoint from `z(S)`, a right `𝒟_I`-linear trivialisation
`ι : 𝒟_I ⊗ O_S ≅ E_I` with `t_I ∘ τι = ι` under the canonical identification
`τ(𝒟_I ⊗ O_S) ≅ 𝒟_I ⊗ O_S` (a plain trivialisation is not enough). Nonemptiness of `I` is
imposed by the moduli problem (`DEllLevelIdeal`). -/
structure DEllipticLevel {infty : X.Place} {S : X.BaseScheme} (I : X.Place →₀ ℕ)
    (E : DEllipticSheaf X D infty S) where
  infty_not_mem : infty ∉ I.support
  zero_disjoint : Disjoint E.zeroPoints ((fun x : X.Place => x.point) '' (I.support : Set X.Place))
  /-- The trivialisation `ι : 𝒟_I ⊗ O_S ≅ E_I`. -/
  ι : DEllLevelModule.trivial X D I S ≅ (RightDModuleBundle.restrictLevel X D I S).obj (E.E 0)
  compat : (DEllLevelModule.frob X D I S).map ι.hom ≫ E.levelT I infty_not_mem =
    (DEllLevelModule.trivialFrobIso X D I S).hom ≫ ι.hom

namespace DEllipticLevel

variable {X D} {infty : X.Place} {S : X.BaseScheme} {E : DEllipticSheaf X D infty S}

/-- API `DEllipticLevel.restrict`: reduction of a level-`I'` structure to `I ≤ I'`. -/
def restrict {I I' : X.Place →₀ ℕ} (h : I ≤ I') (L : DEllipticLevel X D I' E) :
    DEllipticLevel X D I E where
  infty_not_mem := fun hm => L.infty_not_mem (Finsupp.support_mono h hm)
  zero_disjoint := L.zero_disjoint.mono_right
    (Set.image_mono (Finset.coe_subset.mpr (Finsupp.support_mono h)))
  ι := (DEllLevelModule.reduceTrivialIso X D h S).symm ≪≫
    (DEllLevelModule.reduce X D h S).mapIso L.ι ≪≫
    (DEllLevelModule.reduceRestrictIso X D h S).app (E.E 0)
  compat := sorry

/-- Restricting to the same level is the identity. -/
lemma restrict_refl {I : X.Place →₀ ℕ} (L : DEllipticLevel X D I E) :
    L.restrict le_rfl = L := by
  sorry

/-- API `DEllipticLevel.pullback`: base change along `S' ⟶ S` transports the trivialisation and
the Frobenius square. -/
def pullback {I : X.Place →₀ ℕ} {S' : X.BaseScheme} (f : S' ⟶ S) (L : DEllipticLevel X D I E) :
    DEllipticLevel X D I (E.pullback f) where
  infty_not_mem := L.infty_not_mem
  zero_disjoint := sorry
  ι := (DEllLevelModule.pullbackTrivialIso X D I f).symm ≪≫
    (DEllLevelModule.pullback X D I f).mapIso L.ι ≪≫
    (DEllLevelModule.pullbackRestrictIso X D I f).app (E.E 0)
  compat := sorry

/-- API `DEllipticLevel.unitAction`: the right action of `𝒟_I^×` on level-`I` structures by
precomposition `ι ↦ ι ∘ (u ·)`. A unit of `(𝒟_I ⊗ O_S)^×` preserves the Frobenius compatibility
exactly when it is `τ`-fixed, i.e. (for connected `S`) lies in the finite group `𝒟_I^×`; with
this group, forgetting the level is a Galois covering. -/
instance unitAction {I : X.Place →₀ ℕ} :
    MulAction (DEllLevelAlgebra X D I)ˣᵐᵒᵖ (DEllipticLevel X D I E) where
  smul u L := { L with
    ι := (DEllLevelModule.unitAut X D I S u.unop) ≪≫ L.ι
    compat := sorry }
  one_smul := sorry
  mul_smul := sorry

/-- Transport of a level structure along an isomorphism of D-elliptic sheaves. -/
def transport {I : X.Place →₀ ℕ} {E' : DEllipticSheaf X D infty S} (e : E ≅ E')
    (L : DEllipticLevel X D I E) : DEllipticLevel X D I E' where
  infty_not_mem := L.infty_not_mem
  zero_disjoint := sorry
  ι := L.ι ≪≫ (RightDModuleBundle.restrictLevel X D I S).mapIso
    ⟨e.hom.f 0, e.inv.f 0, sorry, sorry⟩
  compat := sorry

/-- Transport of a level structure to the shifted sheaf `E_{•+k}` (identifying `E_I` through the
`j`-maps, which are isomorphisms on `I × S`). -/
def shift {I : X.Place →₀ ℕ} (k : ℤ) (L : DEllipticLevel X D I E) :
    DEllipticLevel X D I (E.shift k) := sorry

end DEllipticLevel

-- DEllipticLevel.frobenius_test: in rank one over a field k ⊇ F_q, if t is q-semilinear and the trivialisation v is compatible (t v = v), then a • v is compatible iff a ^ q = a.
example (K : Type) [Field K] [Fintype K] (k : Type) [Field k] [Algebra K k]
    (V : Type) [AddCommGroup V] [Module k V]
    (t : V →ₛₗ[(FiniteField.frobeniusAlgHom K k).toRingHom] V) (v : V) (hv : v ≠ 0)
    (ht : t v = v) (a : k) :
    t (a • v) = a • v ↔ a ^ Fintype.card K = a := by
  rw [LinearMap.map_smulₛₗ, ht]
  change a ^ Fintype.card K • v = a • v ↔ _
  exact ⟨fun h => smul_left_injective k hv h, fun h => by rw [h]⟩

-- DEllipticLevel.nested_test: restricting from I'' to I agrees with the two successive restrictions.
example {infty : X.Place} {S : X.BaseScheme} {E : DEllipticSheaf X D infty S}
    {I I' I'' : X.Place →₀ ℕ} (h₁ : I ≤ I') (h₂ : I' ≤ I'') (L : DEllipticLevel X D I'' E) :
    (L.restrict h₂).restrict h₁ = L.restrict (h₁.trans h₂) := by
  sorry

-- DEllipticLevel.zero_test: a level structure forces t_I to be invertible on I × S, which fails where the zero meets I; hence the domain requires z(S) ∩ I = ∅.
example {infty : X.Place} {S : X.BaseScheme} {E : DEllipticSheaf X D infty S}
    {I : X.Place →₀ ℕ} (L : DEllipticLevel X D I E) : IsIso (E.levelT I L.infty_not_mem) := by
  have h : E.levelT I L.infty_not_mem =
      inv ((DEllLevelModule.frob X D I S).map L.ι.hom) ≫
        (DEllLevelModule.trivialFrobIso X D I S).hom ≫ L.ι.hom := by
    rw [← L.compat]; simp
  rw [h]; infer_instance

/-! #### Moduli of D-elliptic sheaves with level -/

/-- `X ∖ T` shrinks when `T` grows (genuine). -/
lemma FFCurve.awayFrom_antitone {T T' : Set X.Place} (h : T ⊆ T') :
    X.awayFrom T' ≤ X.awayFrom T := by
  intro x hx hx'
  exact hx (closure_mono (Set.image_mono h) hx')

/-- Levels for the moduli problem: nonempty finite closed subschemes `I ⊂ X ∖ {∞}`. -/
abbrev DEllLevelIdeal (X : FFCurve q) (infty : X.Place) : Type :=
  {I : X.Place →₀ ℕ // I ≠ 0 ∧ infty ∉ I.support}

/-- The base `U_I = X ∖ ({∞} ∪ I ∪ R)` of the level-`I` moduli scheme. -/
def DEllLevelIdeal.base {infty : X.Place} (I : DEllLevelIdeal X infty) : X.asScheme.left.Opens :=
  X.awayFrom ({infty} ∪ (I.1.support : Set X.Place) ∪ DEllRamification X D)

/-- `U_{I'} ⊆ U_I` for `I ≤ I'` (genuine). -/
lemma DEllLevelIdeal.base_antitone {infty : X.Place} {I I' : DEllLevelIdeal X infty}
    (h : I ≤ I') : I'.base X D ≤ I.base X D :=
  X.awayFrom_antitone (Set.union_subset_union_left _ (Set.union_subset_union_right _
    (Finset.coe_subset.mpr (Finsupp.support_mono (show I.1 ≤ I'.1 from h)))))

/-- A `U_I`-scheme regarded as an `F_q`-scheme. -/
abbrev DEllLevelIdeal.toBase {infty : X.Place} (I : DEllLevelIdeal X infty)
    (S : Over ((I.base X D : X.asScheme.left.Opens) : Scheme)) : X.BaseScheme :=
  Over.mk (S.hom ≫ (I.base X D).ι ≫ X.asScheme.hom)

/-- A morphism of `U_I`-schemes as a morphism of `F_q`-schemes. -/
def DEllLevelIdeal.toBaseHom {infty : X.Place} (I : DEllLevelIdeal X infty)
    {S S' : Over ((I.base X D : X.asScheme.left.Opens) : Scheme)} (f : S' ⟶ S) :
    I.toBase X D S' ⟶ I.toBase X D S :=
  Over.homMk f.left (by simp)

/-- A level-`I` D-elliptic sheaf over a `U_I`-scheme `S` whose zero is the structure morphism. -/
structure DEllLevelPoint {infty : X.Place} (I : DEllLevelIdeal X infty)
    (S : Over ((I.base X D : X.asScheme.left.Opens) : Scheme)) where
  /-- The D-elliptic sheaf. -/
  E : DEllipticSheaf X D infty (I.toBase X D S)
  zero_eq : E.zero ≫ (X.awayFrom ({infty} ∪ DEllRamification X D)).ι = S.hom ≫ (I.base X D).ι
  /-- The level structure. -/
  level : DEllipticLevel X D I.1 E

/-- Shift of a level point (the zero is unchanged). -/
def DEllLevelPoint.shift {infty : X.Place} {I : DEllLevelIdeal X infty}
    {S : Over ((I.base X D : X.asScheme.left.Opens) : Scheme)} (k : ℤ)
    (P : DEllLevelPoint X D I S) : DEllLevelPoint X D I S :=
  ⟨P.E.shift k, P.zero_eq, P.level.shift k⟩

/-- Two level points are identified when one is isomorphic to an index shift of the other,
compatibly with the levels (division by the index-shift action replaces the normalisation
`0 ≤ χ(E_0) < d`). -/
def DEllLevelPoint.Rel {infty : X.Place} {I : DEllLevelIdeal X infty}
    {S : Over ((I.base X D : X.asScheme.left.Opens) : Scheme)}
    (P P' : DEllLevelPoint X D I S) : Prop :=
  ∃ (k : ℤ) (e : P.E.shift k ≅ P'.E), (P.level.shift k).transport e = P'.level

/-- Isomorphism classes, modulo index shift, of level-`I` D-elliptic sheaves over `S`. -/
def DEllLevelClasses {infty : X.Place} (I : DEllLevelIdeal X infty)
    (S : Over ((I.base X D : X.asScheme.left.Opens) : Scheme)) : Type 1 :=
  Quot (DEllLevelPoint.Rel X D (I := I) (S := S))

/-- Pullback of classes along a morphism of `U_I`-schemes. -/
def DEllLevelClasses.pullback {infty : X.Place} {I : DEllLevelIdeal X infty}
    {S S' : Over ((I.base X D : X.asScheme.left.Opens) : Scheme)} (f : S' ⟶ S) :
    DEllLevelClasses X D I S → DEllLevelClasses X D I S' :=
  Quot.map (fun P => ⟨P.E.pullback (DEllLevelIdeal.toBaseHom X D I f),
      by sorry, P.level.pullback _⟩) (by sorry)

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`.
The scheme `E_{X,D,I}` over `U_I = X ∖ ({∞} ∪ I ∪ R)` representing level-`I` D-elliptic sheaves
(LRS Thms 4.1, 5.1; Hausberger Thm 6.1): smooth of pure relative dimension `d − 1`,
quasi-projective, projective when `D` is division; for a ramified place `o ∉ I` it extends
projectively over `U_I ∪ {o}` (Hausberger 6.4). Representing scheme owned by
`AlgebraicModuliForArithmeticGeometry:R09.2`/`R09.5`. Quasi-projectivity for general `D` is
named, not stated (no projective-space carrier over `U_I` beyond `DEllProjectiveSpace`). -/
def DEllipticModuli {infty : X.Place} (I : DEllLevelIdeal X infty) :
    Over ((I.base X D : X.asScheme.left.Opens) : Scheme) := sorry

/-- API `DEllipticModuli.points`: `S`-points over `U_I` are classes of level D-elliptic sheaves.
-/
def DEllipticModuli.points {infty : X.Place} (I : DEllLevelIdeal X infty)
    (S : Over ((I.base X D : X.asScheme.left.Opens) : Scheme)) :
    (S ⟶ DEllipticModuli X D I) ≃ DEllLevelClasses X D I S := sorry

/-- Functoriality of `DEllipticModuli.points` in `S`. -/
lemma DEllipticModuli.points_natural {infty : X.Place} (I : DEllLevelIdeal X infty)
    {S S' : Over ((I.base X D : X.asScheme.left.Opens) : Scheme)} (f : S' ⟶ S)
    (x : S ⟶ DEllipticModuli X D I) :
    DEllipticModuli.points X D I S' (f ≫ x) =
      DEllLevelClasses.pullback X D f (DEllipticModuli.points X D I S x) := by
  sorry

/-- API `DEllipticModuli.level_map`: for `I ≤ I'` the forgetful morphism `E_{I'} → E_I`, over the
inclusion `U_{I'} ⊆ U_I`. -/
def DEllipticModuli.level_map {infty : X.Place} {I I' : DEllLevelIdeal X infty} (h : I ≤ I') :
    (DEllipticModuli X D I').left ⟶ (DEllipticModuli X D I).left := sorry

lemma DEllipticModuli.level_map_comm {infty : X.Place} {I I' : DEllLevelIdeal X infty}
    (h : I ≤ I') :
    DEllipticModuli.level_map X D h ≫ (DEllipticModuli X D I).hom =
      (DEllipticModuli X D I').hom ≫ X.asScheme.left.homOfLE (DEllLevelIdeal.base_antitone X D h) := by
  sorry

lemma DEllipticModuli.level_map_id {infty : X.Place} (I : DEllLevelIdeal X infty) :
    DEllipticModuli.level_map X D (le_refl I) = 𝟙 _ := by
  sorry

lemma DEllipticModuli.level_map_comp {infty : X.Place} {I I' I'' : DEllLevelIdeal X infty}
    (h : I ≤ I') (h' : I' ≤ I'') :
    DEllipticModuli.level_map X D (h.trans h') =
      DEllipticModuli.level_map X D h' ≫ DEllipticModuli.level_map X D h := by
  sorry

/-- API `DEllipticModuli.dimension`: for `∞` rational and `D` split at `∞`, the structure (zero)
morphism `E_I → U_I` is smooth of relative dimension `d − 1`. -/
theorem DEllipticModuli.dimension {infty : X.Place} (I : DEllLevelIdeal X infty)
    (hinf : infty.degree = 1) (hsplit : DEllIsSplitAt X D infty) :
    SmoothOfRelativeDimension (divAlgDegree X D - 1) (DEllipticModuli X D I).hom := by
  sorry

/-- Projective space `ℙ^N_U` over a scheme `U` (owned by `SchemeAndStackFoundations:SF.0`). -/
def DEllProjectiveSpace (U : Scheme) (N : ℕ) : Over U := sorry

/-- The extension of `E_I` over `U_I ∪ {o}` for the distinguished ramified place `o`
(`inv_o(D) = 1/d`) with `o ∉ I` (Hausberger Thm 6.4, by special formal `O_D`-modules at `o`);
its signature requires `o ∉ I`. -/
def DEllipticModuli.extension {infty : X.Place} (I : DEllLevelIdeal X infty) (o : X.Place)
    (ho : o ∉ I.1.support) :
    Over ((X.awayFrom ({infty} ∪ (I.1.support : Set X.Place) ∪ (DEllRamification X D \ {o})) :
      X.asScheme.left.Opens) : Scheme) := sorry

/-- API `DEllipticModuli.projective`: for division `D`, `E_I → U_I` is projective (a closed
subscheme of some `ℙ^N_{U_I}`) and proper; for the distinguished place `o` (`inv_o(D) = 1/d`)
and `o ∉ I` the extension over `U_I ∪ {o}` is projective as well. -/
theorem DEllipticModuli.projective {infty : X.Place} (I : DEllLevelIdeal X infty)
    (hinf : infty.degree = 1) (hsplit : DEllIsSplitAt X D infty)
    (hdiv : ∀ a : D, a ≠ 0 → IsUnit a) :
    (∃ (N : ℕ) (i : DEllipticModuli X D I ⟶ DEllProjectiveSpace _ N), IsClosedImmersion i.left) ∧
      IsProper (DEllipticModuli X D I).hom ∧
      ∀ (o : X.Place) (ho : o ∉ I.1.support),
        hasseInvariant X D o = ((1 / (divAlgDegree X D : ℚ) : ℚ) : AddCircle (1 : ℚ)) →
        ∃ (N : ℕ) (i : DEllipticModuli.extension X D I o ho ⟶ DEllProjectiveSpace _ N),
          IsClosedImmersion i.left := by
  sorry

-- DEllipticModuli.rank_one_test: at d = 1 the zero morphism is smooth of relative dimension 0.
example {infty : X.Place} (I : DEllLevelIdeal X infty) (hinf : infty.degree = 1)
    (hsplit : DEllIsSplitAt X D infty) (hd : divAlgDegree X D = 1) :
    SmoothOfRelativeDimension 0 (DEllipticModuli X D I).hom := by
  have h := DEllipticModuli.dimension X D I hinf hsplit
  rw [hd] at h
  exact h

-- DEllipticModuli.shift_test: an index shift of a level D-elliptic sheaf defines the same point (dividing the unnormalised chain stack by the shift replaces the χ(E_0) ∈ [0, d) choice).
example {infty : X.Place} (I : DEllLevelIdeal X infty)
    (S : Over ((I.base X D : X.asScheme.left.Opens) : Scheme)) (P : DEllLevelPoint X D I S)
    (k : ℤ) :
    (DEllipticModuli.points X D I S).symm (Quot.mk _ (P.shift X D k)) =
      (DEllipticModuli.points X D I S).symm (Quot.mk _ P) := by
  sorry

-- DEllipticModuli.level_at_o_test: if o ∈ I, the closed point o is not in the base U_I, so a level including o is only used on the generic fibre (no extension over o is asserted).
example {infty : X.Place} (I : DEllLevelIdeal X infty) (o : X.Place) (ho : o ∈ I.1.support) :
    o.point ∉ I.base X D := by
  intro h
  exact h (subset_closure ⟨o, Or.inl (Or.inr (by simpa using ho)), rfl⟩)

/-! #### Frobenius and Hecke correspondences -/

/-- The finite-adelic unit group `D^×(A^∞)` (away from `∞`; owned by
`AdelicAlgebraicGroups:AA.0`/`AA.1`, function-field extension requested there). -/
def DEllAdelicUnits (X : FFCurve q) (D : Type) [Ring D] [Algebra X.functionField D]
    (infty : X.Place) : Type := sorry

instance (infty : X.Place) : Group (DEllAdelicUnits X D infty) := sorry
instance (infty : X.Place) : TopologicalSpace (DEllAdelicUnits X D infty) := sorry
instance (infty : X.Place) : IsTopologicalGroup (DEllAdelicUnits X D infty) := sorry

/-- The diagonal `D^×(F) → D^×(A^∞)`. -/
def DEllAdelicUnits.diag (infty : X.Place) : Dˣ →* DEllAdelicUnits X D infty := sorry

/-- The level subgroup `K_I = ker((𝒟 ⊗ Ô^∞)^× → 𝒟_I^×)`. -/
def DEllAdelicUnits.level (infty : X.Place) (I : X.Place →₀ ℕ) :
    Subgroup (DEllAdelicUnits X D infty) := sorry

/-- The right action of `g` on the tower: `E_{I'} → E_I`, `x ↦ x·g`, defined when
`g⁻¹ K_{I'} g ⊆ K_I`. -/
def DEllipticModuli.translate {infty : X.Place} (g : DEllAdelicUnits X D infty)
    (I I' : DEllLevelIdeal X infty)
    (hg : ∀ k ∈ DEllAdelicUnits.level X D infty I'.1, g⁻¹ * k * g ∈ DEllAdelicUnits.level X D infty I.1) :
    (DEllipticModuli X D I').left ⟶ (DEllipticModuli X D I).left := sorry

lemma DEllipticModuli.translate_one {infty : X.Place} (I : DEllLevelIdeal X infty)
    (h : ∀ k ∈ DEllAdelicUnits.level X D infty I.1,
      (1 : DEllAdelicUnits X D infty)⁻¹ * k * 1 ∈ DEllAdelicUnits.level X D infty I.1) :
    DEllipticModuli.translate X D 1 I I h = 𝟙 _ := by
  sorry

/-- A finite correspondence `E_I ← C → E_I`. -/
structure DEllCorrespondence {infty : X.Place} (I : DEllLevelIdeal X infty) where
  /-- The correspondence scheme. -/
  src : Scheme
  /-- The left (forgetful) leg. -/
  left : src ⟶ (DEllipticModuli X D I).left
  /-- The right (translation) leg. -/
  right : src ⟶ (DEllipticModuli X D I).left

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`.
The finite Hecke correspondence of `g ∈ D^×(A^∞)` at level `I`, through a refined level
`I' ≥ I` with `g⁻¹ K_{I'} g ⊆ K_I`: `E_I ← E_{I'} → E_I` (forget, translate by `g`).
Independence of the refinement and the trace normalisation (LRS 14.9) are stated on cohomology
below; the right tower action is not an automorphism of a fixed `E_I`. -/
def DEllipticHecke {infty : X.Place} (g : DEllAdelicUnits X D infty) (I I' : DEllLevelIdeal X infty)
    (hII' : I ≤ I')
    (hg : ∀ k ∈ DEllAdelicUnits.level X D infty I'.1, g⁻¹ * k * g ∈ DEllAdelicUnits.level X D infty I.1) :
    DEllCorrespondence X D I :=
  ⟨(DEllipticModuli X D I').left, DEllipticModuli.level_map X D hII',
    DEllipticModuli.translate X D g I I' hg⟩

/-- Finite-level cohomology `H^i(E_{I,F̄}, Q̄_ℓ)` (owned by `EtaleDualityAndPerverseSheaves:EDC.2`).
-/
def DEllipticModuli.cohomology (X : FFCurve q) (D : Type) [Ring D] [Algebra X.functionField D]
    [Algebra.IsCentral X.functionField D] [IsSimpleRing D] [FiniteDimensional X.functionField D]
    {infty : X.Place} (I : DEllLevelIdeal X infty) (ℓ : ℕ)
    [Fact ℓ.Prime] (i : ℕ) : Type := sorry

instance {infty : X.Place} (I : DEllLevelIdeal X infty) (ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) :
    AddCommGroup (DEllipticModuli.cohomology X D I ℓ i) := sorry
instance {infty : X.Place} (I : DEllLevelIdeal X infty) (ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) :
    Module (QlBar ℓ) (DEllipticModuli.cohomology X D I ℓ i) := sorry

/-- The action `c_{left,*} ∘ c_right^*` of a finite correspondence on cohomology
(`EtaleDualityAndPerverseSheaves:EDC.8`). -/
def DEllCorrespondence.action {infty : X.Place} {I : DEllLevelIdeal X infty}
    (c : DEllCorrespondence X D I) (ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) :
    DEllipticModuli.cohomology X D I ℓ i →ₗ[QlBar ℓ] DEllipticModuli.cohomology X D I ℓ i := sorry

/-- Geometric Frobenius at a good place `x ∈ U_I` on `H^i(E_{I,F̄}, Q̄_ℓ)`. -/
def DEllipticModuli.frobeniusAt {infty : X.Place} (I : DEllLevelIdeal X infty) (ℓ : ℕ)
    [Fact ℓ.Prime] (i : ℕ) (x : X.Place)
    (hx : x ∉ {infty} ∪ (I.1.support : Set X.Place) ∪ DEllRamification X D) :
    DEllipticModuli.cohomology X D I ℓ i →ₗ[QlBar ℓ] DEllipticModuli.cohomology X D I ℓ i := sorry

/-- API `DEllipticHecke.mul`: on the tower the translations compose as a right action,
`x·(gg') = (x·g)·g'`. -/
theorem DEllipticHecke.mul {infty : X.Place} (g g' : DEllAdelicUnits X D infty)
    (I I' I'' : DEllLevelIdeal X infty)
    (h₁ : ∀ k ∈ DEllAdelicUnits.level X D infty I''.1,
      g⁻¹ * k * g ∈ DEllAdelicUnits.level X D infty I'.1)
    (h₂ : ∀ k ∈ DEllAdelicUnits.level X D infty I'.1,
      g'⁻¹ * k * g' ∈ DEllAdelicUnits.level X D infty I.1)
    (h : ∀ k ∈ DEllAdelicUnits.level X D infty I''.1,
      (g * g')⁻¹ * k * (g * g') ∈ DEllAdelicUnits.level X D infty I.1) :
    DEllipticModuli.translate X D (g * g') I I'' h =
      DEllipticModuli.translate X D g I' I'' h₁ ≫ DEllipticModuli.translate X D g' I I' h₂ := by
  sorry

/-- API `DEllipticHecke.frobenius`: for division `D` (so `E_I` is proper smooth over `U_I`) and a
good place `x`, every Hecke correspondence commutes with geometric Frobenius at `x`. -/
theorem DEllipticHecke.frobenius {infty : X.Place} (hdiv : ∀ a : D, a ≠ 0 → IsUnit a)
    (g : DEllAdelicUnits X D infty) (I I' : DEllLevelIdeal X infty) (hII' : I ≤ I')
    (hg : ∀ k ∈ DEllAdelicUnits.level X D infty I'.1, g⁻¹ * k * g ∈ DEllAdelicUnits.level X D infty I.1)
    (ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) (x : X.Place)
    (hx : x ∉ {infty} ∪ (I.1.support : Set X.Place) ∪ DEllRamification X D) :
    (DEllipticHecke X D g I I' hII' hg).action X D ℓ i ∘ₗ DEllipticModuli.frobeniusAt X D I ℓ i x hx =
      DEllipticModuli.frobeniusAt X D I ℓ i x hx ∘ₗ (DEllipticHecke X D g I I' hII' hg).action X D ℓ i := by
  sorry

/-- API `DEllipticHecke.level`: the level transition maps commute with the translations. -/
theorem DEllipticHecke.level {infty : X.Place} (g : DEllAdelicUnits X D infty)
    (I I' J J' : DEllLevelIdeal X infty) (hIJ : I ≤ J) (hIJ' : I' ≤ J')
    (hgI : ∀ k ∈ DEllAdelicUnits.level X D infty I'.1, g⁻¹ * k * g ∈ DEllAdelicUnits.level X D infty I.1)
    (hgJ : ∀ k ∈ DEllAdelicUnits.level X D infty J'.1, g⁻¹ * k * g ∈ DEllAdelicUnits.level X D infty J.1) :
    DEllipticModuli.level_map X D hIJ' ≫ DEllipticModuli.translate X D g I I' hgI =
      DEllipticModuli.translate X D g J J' hgJ ≫ DEllipticModuli.level_map X D hIJ := by
  sorry

/-- The tower cohomology `H^i = colim_I H^i(E_{I,F̄}, Q̄_ℓ)` (`EDC.2`). -/
def DEllipticTowerCohomology (X : FFCurve q) (D : Type) [Ring D] [Algebra X.functionField D]
    (infty : X.Place) (ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) : Type := sorry

instance (infty : X.Place) (ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) :
    AddCommGroup (DEllipticTowerCohomology X D infty ℓ i) := sorry
instance (infty : X.Place) (ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) :
    Module (QlBar ℓ) (DEllipticTowerCohomology X D infty ℓ i) := sorry

/-- Pullback along the right translation by `g` on the tower cohomology. -/
def DEllipticTowerCohomology.pullbackBy (infty : X.Place) (ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ)
    (g : DEllAdelicUnits X D infty) :
    DEllipticTowerCohomology X D infty ℓ i →ₗ[QlBar ℓ] DEllipticTowerCohomology X D infty ℓ i :=
  sorry

/-- Pulling back along a right action gives a left action: `(x·gg')^* = (·g)^* ∘ (·g')^*`. -/
lemma DEllipticTowerCohomology.pullbackBy_mul (infty : X.Place) (ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ)
    (g g' : DEllAdelicUnits X D infty) :
    DEllipticTowerCohomology.pullbackBy X D infty ℓ i (g * g') =
      DEllipticTowerCohomology.pullbackBy X D infty ℓ i g * DEllipticTowerCohomology.pullbackBy X D infty ℓ i g' := by
  sorry

lemma DEllipticTowerCohomology.pullbackBy_one (infty : X.Place) (ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) :
    DEllipticTowerCohomology.pullbackBy X D infty ℓ i 1 = 1 := by
  sorry

/-- The left action of `D^×(A^∞)` on tower cohomology induced by the right tower action. -/
def DEllipticHecke.cohomologyRep (infty : X.Place) (ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) :
    Representation (QlBar ℓ) (DEllAdelicUnits X D infty) (DEllipticTowerCohomology X D infty ℓ i) where
  toFun := DEllipticTowerCohomology.pullbackBy X D infty ℓ i
  map_one' := DEllipticTowerCohomology.pullbackBy_one X D infty ℓ i
  map_mul' := DEllipticTowerCohomology.pullbackBy_mul X D infty ℓ i

-- DEllipticHecke.identity_test: the element 1 gives the identity correspondence at every level.
example {infty : X.Place} (I : DEllLevelIdeal X infty)
    (h : ∀ k ∈ DEllAdelicUnits.level X D infty I.1,
      (1 : DEllAdelicUnits X D infty)⁻¹ * k * 1 ∈ DEllAdelicUnits.level X D infty I.1) :
    (DEllipticHecke X D 1 I I le_rfl h).left = 𝟙 _ ∧ (DEllipticHecke X D 1 I I le_rfl h).right = 𝟙 _ :=
  ⟨DEllipticModuli.level_map_id X D I, DEllipticModuli.translate_one X D I h⟩

-- DEllipticHecke.level_test: if g does not normalise K_I, it acts only through a strictly refined level I' (a correspondence, not an automorphism of E_I).
example {infty : X.Place} (g : DEllAdelicUnits X D infty) (I : DEllLevelIdeal X infty)
    (hg : ¬ ∀ k ∈ DEllAdelicUnits.level X D infty I.1,
      g⁻¹ * k * g ∈ DEllAdelicUnits.level X D infty I.1) :
    ∃ I' : DEllLevelIdeal X infty, I ≤ I' ∧ I ≠ I' ∧
      ∀ k ∈ DEllAdelicUnits.level X D infty I'.1, g⁻¹ * k * g ∈ DEllAdelicUnits.level X D infty I.1 := by
  sorry

-- DEllipticHecke.right_left_test: the tower action is a right action while the induced cohomology action is a left action (product law of the representation).
example {infty : X.Place} (g g' : DEllAdelicUnits X D infty) (I I' I'' : DEllLevelIdeal X infty)
    (h₁ : ∀ k ∈ DEllAdelicUnits.level X D infty I''.1,
      g⁻¹ * k * g ∈ DEllAdelicUnits.level X D infty I'.1)
    (h₂ : ∀ k ∈ DEllAdelicUnits.level X D infty I'.1,
      g'⁻¹ * k * g' ∈ DEllAdelicUnits.level X D infty I.1)
    (h : ∀ k ∈ DEllAdelicUnits.level X D infty I''.1,
      (g * g')⁻¹ * k * (g * g') ∈ DEllAdelicUnits.level X D infty I.1)
    (ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) :
    DEllipticModuli.translate X D (g * g') I I'' h =
        DEllipticModuli.translate X D g I' I'' h₁ ≫ DEllipticModuli.translate X D g' I I' h₂ ∧
      DEllipticHecke.cohomologyRep X D infty ℓ i (g * g') =
        DEllipticHecke.cohomologyRep X D infty ℓ i g * DEllipticHecke.cohomologyRep X D infty ℓ i g' :=
  ⟨DEllipticHecke.mul X D g g' I I' I'' h₁ h₂ h, map_mul _ _ _⟩

end DEllipticGeometry


/-! ### Equal characteristic, local half: special formal modules and Drinfeld covers

`K` is a nonarchimedean local field (for this layer `F_q((t))`, e.g. `EqCharLocalField p n`).
Formal `O`-modules, formal schemes over `Spf Ô^nr` and rigid spaces are owned by
`HeckeStacksAndLocalShtukas:HS2` and `AlgebraicModuliForArithmeticGeometry:R09.6`; compact-support
cohomology of the Drinfeld covers by `EtaleDualityAndPerverseSheaves:EDC.2`. -/

section EqCharLocalGeometry

open scoped ValuativeRel TensorProduct

variable (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

/-- The central division algebra `D_K` over `K` of invariant `1/d` (local class field theory,
`FunctionFieldArithmetic:FA.6`). -/
def LocalInvDivAlg (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (d : ℕ) : Type := sorry

instance (d : ℕ) : DivisionRing (LocalInvDivAlg K d) := sorry
instance (d : ℕ) : Algebra K (LocalInvDivAlg K d) := sorry
instance (d : ℕ) : Algebra.IsCentral K (LocalInvDivAlg K d) := sorry
instance (d : ℕ) : FiniteDimensional K (LocalInvDivAlg K d) := sorry
instance (d : ℕ) : TopologicalSpace (LocalInvDivAlg K d) := sorry

/-- `[D_K : K] = d²`. -/
lemma LocalInvDivAlg.finrank (d : ℕ) : Module.finrank K (LocalInvDivAlg K d) = d ^ 2 := by
  sorry

/-- The reduced norm `Nrd : D_K^× → K^×`. -/
def LocalInvDivAlg.reducedNorm (d : ℕ) : (LocalInvDivAlg K d)ˣ →* Kˣ := sorry

/-- The maximal order `O_D` of `D_K`. -/
def LocalInvDivAlg.maxOrder (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (d : ℕ) : Type := sorry

instance (d : ℕ) : Ring (LocalInvDivAlg.maxOrder K d) := sorry
instance (d : ℕ) : Algebra 𝒪[K] (LocalInvDivAlg.maxOrder K d) := sorry

/-- The ring `O_d` of integers of the unramified extension of degree `d`. -/
def LocalInvDivAlg.unramifiedIntegers (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (d : ℕ) : Type := sorry

instance (d : ℕ) : CommRing (LocalInvDivAlg.unramifiedIntegers K d) := sorry
instance (d : ℕ) : Algebra 𝒪[K] (LocalInvDivAlg.unramifiedIntegers K d) := sorry

/-- The embedding `O_d ⊂ O_D`. -/
def LocalInvDivAlg.unramifiedEmbedding (d : ℕ) :
    LocalInvDivAlg.unramifiedIntegers K d →ₐ[𝒪[K]] LocalInvDivAlg.maxOrder K d := sorry

/-- Smooth formal `O`-modules over an `O`-algebra `B` (`HeckeStacksAndLocalShtukas:HS2`). -/
def FormalOModule (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (B : Type) [CommRing B] [Algebra 𝒪[K] B] : Type := sorry

variable {K}

/-- The endomorphism ring of a formal `O`-module. -/
def FormalOModule.End {B : Type} [CommRing B] [Algebra 𝒪[K] B] (H : FormalOModule K B) :
    Type := sorry

instance {B : Type} [CommRing B] [Algebra 𝒪[K] B] (H : FormalOModule K B) : Ring H.End := sorry

/-- The structural `O`-action. -/
def FormalOModule.oAction {B : Type} [CommRing B] [Algebra 𝒪[K] B] (H : FormalOModule K B) :
    𝒪[K] →+* H.End := sorry

/-- The tangent module `Lie H`, a `B`-module. -/
def FormalOModule.Lie {B : Type} [CommRing B] [Algebra 𝒪[K] B] (H : FormalOModule K B) :
    Type := sorry

instance {B : Type} [CommRing B] [Algebra 𝒪[K] B] (H : FormalOModule K B) :
    AddCommGroup H.Lie := sorry
instance {B : Type} [CommRing B] [Algebra 𝒪[K] B] (H : FormalOModule K B) :
    Module B H.Lie := sorry

/-- The `O`-height of a formal `O`-module. -/
def FormalOModule.height {B : Type} [CommRing B] [Algebra 𝒪[K] B] (H : FormalOModule K B) : ℕ :=
  sorry

/-- Base change of a formal `O`-module along `B → B'`. -/
def FormalOModule.baseChange {B B' : Type} [CommRing B] [Algebra 𝒪[K] B] [CommRing B']
    [Algebra 𝒪[K] B'] (f : B →ₐ[𝒪[K]] B') (H : FormalOModule K B) : FormalOModule K B' := sorry

/-- Base change on endomorphisms. -/
def FormalOModule.baseChangeEnd {B B' : Type} [CommRing B] [Algebra 𝒪[K] B] [CommRing B']
    [Algebra 𝒪[K] B'] (f : B →ₐ[𝒪[K]] B') (H : FormalOModule K B) :
    H.End →+* (H.baseChange f).End := sorry

/-- The `O_d ⊗_O B`-module structure on `Lie H` induced by an action `O_D → End H` (through
`O_d ⊂ O_D` and the Lie functor) together with the `B`-module structure. -/
abbrev FormalOModule.lieTensorModule {B : Type} [CommRing B] [Algebra 𝒪[K] B] (d : ℕ)
    (H : FormalOModule K B) (act : LocalInvDivAlg.maxOrder K d →+* H.End) :
    Module (LocalInvDivAlg.unramifiedIntegers K d ⊗[𝒪[K]] B) H.Lie := sorry

variable (K)

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-module`.
A special formal `O_D`-module over an `O`-algebra `B` (Hausberger Def. 3.1): a smooth formal
`O`-module `H` with an `O_D`-action extending the `O`-action such that `Lie H` is an invertible
`O_d ⊗_O B`-module (`Module.Invertible`). The nilpotence of the uniformiser on `B` is a
condition on the moduli problem (`SpecialDeformation`), and the height `d²` is imposed there. -/
structure SpecialFormalODModule (d : ℕ) (B : Type) [CommRing B] [Algebra 𝒪[K] B] where
  /-- The formal `O`-module. -/
  H : FormalOModule K B
  /-- The `O_D`-action. -/
  act : LocalInvDivAlg.maxOrder K d →+* H.End
  act_O : ∀ a : 𝒪[K], act (algebraMap 𝒪[K] (LocalInvDivAlg.maxOrder K d) a) = H.oAction a
  special : letI := FormalOModule.lieTensorModule d H act
    Module.Invertible (LocalInvDivAlg.unramifiedIntegers K d ⊗[𝒪[K]] B) H.Lie

namespace SpecialFormalODModule

variable {K} {d : ℕ} {B : Type} [CommRing B] [Algebra 𝒪[K] B]

/-- API `SpecialFormalODModule.lie`: the tangent module with its `O_d ⊗ B`-action. -/
abbrev lie (M : SpecialFormalODModule K d B) :
    Module (LocalInvDivAlg.unramifiedIntegers K d ⊗[𝒪[K]] B) M.H.Lie :=
  FormalOModule.lieTensorModule d M.H M.act

/-- API `SpecialFormalODModule.baseChange`: base change transports the action and the
invertibility of the tangent module. -/
def baseChange {B' : Type} [CommRing B'] [Algebra 𝒪[K] B'] (f : B →ₐ[𝒪[K]] B')
    (M : SpecialFormalODModule K d B) : SpecialFormalODModule K d B' where
  H := M.H.baseChange f
  act := (FormalOModule.baseChangeEnd f M.H).comp M.act
  act_O := sorry
  special := sorry

/-- The `σ`-eigenspace `{v : (a ⊗ 1)v = (1 ⊗ σ(a))v}` of `Lie H` for an embedding
`σ : O_d → B`. -/
def eigenspace (M : SpecialFormalODModule K d B)
    (σ : LocalInvDivAlg.unramifiedIntegers K d →ₐ[𝒪[K]] B) : Submodule B M.H.Lie where
  carrier := {v | letI := M.lie
    ∀ a : LocalInvDivAlg.unramifiedIntegers K d,
      (a ⊗ₜ[𝒪[K]] (1 : B)) • v = ((1 : LocalInvDivAlg.unramifiedIntegers K d) ⊗ₜ[𝒪[K]] σ a) • v}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- API `SpecialFormalODModule.dimension`: over a splitting field `B` (there are `d` embeddings
`O_d → B`) each tangent eigenspace has rank one and `Lie H` has rank `d`. -/
theorem dimension {B : Type} [Field B] [Algebra 𝒪[K] B] (M : SpecialFormalODModule K d B)
    (hsplit : Nat.card (LocalInvDivAlg.unramifiedIntegers K d →ₐ[𝒪[K]] B) = d) :
    (∀ σ, Module.finrank B (M.eigenspace σ) = 1) ∧ Module.finrank B M.H.Lie = d := by
  sorry

end SpecialFormalODModule

-- SpecialFormalODModule.rank_one_test: for d = 1 specialness is a one-dimensional tangent line.
example {B : Type} [Field B] [Algebra 𝒪[K] B] (M : SpecialFormalODModule K 1 B) :
    Module.finrank B M.H.Lie = 1 := by
  sorry

-- SpecialFormalODModule.eigenspaces_test: for d = 2 on a splitting base both eigenspaces have rank one.
example {B : Type} [Field B] [Algebra 𝒪[K] B] (M : SpecialFormalODModule K 2 B)
    (hsplit : Nat.card (LocalInvDivAlg.unramifiedIntegers K 2 →ₐ[𝒪[K]] B) = 2)
    (σ : LocalInvDivAlg.unramifiedIntegers K 2 →ₐ[𝒪[K]] B) :
    Module.finrank B (M.eigenspace σ) = 1 :=
  (M.dimension hsplit).1 σ

-- SpecialFormalODModule.dimension_only_test: B² with O₂ acting through a single embedding σ is two-dimensional but not an invertible O₂ ⊗ B-module.
example {B : Type} [Field B] [Algebra 𝒪[K] B]
    (σ : LocalInvDivAlg.unramifiedIntegers K 2 →ₐ[𝒪[K]] B) :
    letI : Module (LocalInvDivAlg.unramifiedIntegers K 2 ⊗[𝒪[K]] B) (Fin 2 → B) :=
      Module.compHom (Fin 2 → B)
        (Algebra.TensorProduct.lift σ (AlgHom.id 𝒪[K] B) (fun _ _ => Commute.all _ _)).toRingHom
    ¬ Module.Invertible (LocalInvDivAlg.unramifiedIntegers K 2 ⊗[𝒪[K]] B) (Fin 2 → B) := by
  sorry

/-- The completed maximal unramified extension `Ô^nr` of `O_K`. -/
def EqCharOnr (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : Type := sorry

instance : CommRing (EqCharOnr K) := sorry
instance : Algebra 𝒪[K] (EqCharOnr K) := sorry

/-- A chosen uniformiser of `O_K` (genuine: `IsDiscreteValuationRing.exists_irreducible`). -/
noncomputable def eqCharUniformizer : 𝒪[K] :=
  Classical.choose (IsDiscreteValuationRing.exists_irreducible 𝒪[K])

/-- Formal schemes over `Spf Ô^nr` (`AlgebraicModuliForArithmeticGeometry:R09.6`). -/
def EqCharFormalScheme (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : Type 1 := sorry

instance : Category.{0} (EqCharFormalScheme K) := sorry

/-- `B`-points `Hom(Spf B, Y)` of a formal scheme, for an `Ô^nr`-algebra `B`. -/
def EqCharFormalScheme.points {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (Y : EqCharFormalScheme K) (B : Type) [CommRing B]
    [Algebra (EqCharOnr K) B] : Type := sorry

/-- Functoriality of points in `B`. -/
def EqCharFormalScheme.pointsMap {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (Y : EqCharFormalScheme K) {B B' : Type} [CommRing B]
    [Algebra (EqCharOnr K) B] [CommRing B'] [Algebra (EqCharOnr K) B']
    (f : B →ₐ[EqCharOnr K] B') : Y.points B → Y.points B' := sorry

/-- Drinfeld's formal upper half space `Ω̂^d ⊗̂_O Ô^nr`. -/
def drinfeldUpperHalfSpace (d : ℕ) : EqCharFormalScheme K := sorry

/-- Isomorphism classes of pairs `(H, ρ)`: `H` a special formal `O_D`-module of height `d²`
over `B` and `ρ : Φ ⊗ B/ϖB → H ⊗ B/ϖB` an `O_D`-linear quasi-isogeny of height zero from the
fixed framing `Φ` over `F̄_q` (`HS2`). -/
def SpecialDeformation (d : ℕ) (B : Type) [CommRing B] [Algebra (EqCharOnr K) B] : Type := sorry

/-- Functoriality of the deformation functor. -/
def SpecialDeformation.map {d : ℕ} {B B' : Type} [CommRing B] [Algebra (EqCharOnr K) B]
    [CommRing B'] [Algebra (EqCharOnr K) B'] (f : B →ₐ[EqCharOnr K] B') :
    SpecialDeformation K d B → SpecialDeformation K d B' := sorry

/-- The quasi-endomorphism algebra `End⁰_{O_D}(Φ)` of the framing object. -/
def framingQuasiEnd (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (d : ℕ) : Type := sorry

instance (d : ℕ) : Ring (framingQuasiEnd K d) := sorry
instance (d : ℕ) : Algebra K (framingQuasiEnd K d) := sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules`.
`End⁰_{O_D}(Φ) ≅ M_d(K)`, and the functor of pairs `(H, ρ)` on `Ô^nr`-algebras with `ϖ`
nilpotent is represented by `Ω̂^d ⊗̂ Ô^nr` (Hausberger Thms 3.4, 7.2; Drinfeld, Genestier),
naturally in `B`. Omitted: uniqueness of the isogeny class of height-`d²` special modules over
`F̄_q` (needs the quasi-isogeny carrier) and the semilinear `GL_d(K)`/`D_K^×` actions of §7.3. -/
theorem specialFormalModules (d : ℕ) [NeZero d] :
    Nonempty (framingQuasiEnd K d ≃ₐ[K] Matrix (Fin d) (Fin d) K) ∧
    ∃ e : ∀ (B : Type) [CommRing B] [Algebra (EqCharOnr K) B],
        IsNilpotent (algebraMap (EqCharOnr K) B (algebraMap 𝒪[K] (EqCharOnr K)
          (eqCharUniformizer K))) →
        (SpecialDeformation K d B ≃ (drinfeldUpperHalfSpace K d).points B),
      ∀ (B B' : Type) [CommRing B] [Algebra (EqCharOnr K) B] [CommRing B']
        [Algebra (EqCharOnr K) B'] (f : B →ₐ[EqCharOnr K] B')
        (hB : IsNilpotent (algebraMap (EqCharOnr K) B (algebraMap 𝒪[K] (EqCharOnr K)
          (eqCharUniformizer K))))
        (hB' : IsNilpotent (algebraMap (EqCharOnr K) B' (algebraMap 𝒪[K] (EqCharOnr K)
          (eqCharUniformizer K))))
        (x : SpecialDeformation K d B),
          e B' hB' (SpecialDeformation.map K f x) =
            (drinfeldUpperHalfSpace K d).pointsMap f (e B hB x) := by
  sorry

/-! #### The fundamental local representation -/

/-- The triple group `GL_d(K) × D_K^× × W_K`. -/
abbrev EqCharTriple (d : ℕ) : Type :=
  Matrix.GeneralLinearGroup (Fin d) K × (LocalInvDivAlg K d)ˣ × WeilGroup K

/-- The valuation `K^× → Multiplicative ℤ` given by Mathlib's order isomorphism of the value
group with `ℤᵐ⁰` (genuine; a uniformiser goes to `ofAdd (-1)`, so this is the inverse of the
normalised valuation written multiplicatively; only kernels and equalities are used below). -/
noncomputable def localUnitValuation : Kˣ →* Multiplicative ℤ :=
  (WithZero.unitsWithZeroEquiv.toMonoidHom).comp
    ((Units.map (IsNonarchimedeanLocalField.valueGroupWithZeroIsoInt K).toMulEquiv.toMonoidHom).comp
      (Units.map (ValuativeRel.valuation K).toMonoidWithZeroHom.toMonoidHom))

/-- Local reciprocity `Cl : W_K → K^×` (owned by `LanglandsParameterStacks:LP0`). -/
def artinReciprocity : WeilGroup K →* Kˣ := sorry

/-- `Cl` sends geometric Frobenius to a uniformiser. -/
lemma artinReciprocity_geomFrob :
    ∃ ϖ : 𝒪[K], Irreducible ϖ ∧ ((artinReciprocity K (WeilGroup.geomFrob K) : Kˣ) : K) = ϖ := by
  sorry

/-- The homomorphism `(g, b, w) ↦ v(det g) + v(Nrd b) − v(Cl w)` (written multiplicatively). -/
noncomputable def componentDegree (d : ℕ) : EqCharTriple K d →* Multiplicative ℤ :=
  ((localUnitValuation K).comp (Matrix.GeneralLinearGroup.det.comp (MonoidHom.fst _ _))) *
    ((localUnitValuation K).comp ((LocalInvDivAlg.reducedNorm K d).comp
      ((MonoidHom.fst _ _).comp (MonoidHom.snd _ _)))) *
    ((localUnitValuation K).comp ((artinReciprocity K).comp
      ((MonoidHom.snd _ _).comp (MonoidHom.snd _ _))))⁻¹

/-- The component stabiliser
`P_d = {(g, b, w) : v(det g · Nrd b · Cl(w)⁻¹) = 0}` (genuine). -/
noncomputable def componentStabilizer (d : ℕ) : Subgroup (EqCharTriple K d) :=
  (componentDegree K d).ker

/-- `U_d^i = colim_n H_c^i((Res′Σ_n^d)_{K̄}, Q̄_ℓ)` (`EDC.2`, Drinfeld covers from `HS2`). -/
def drinfeldTowerCohomology (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (d ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) : Type := sorry

instance (d ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) : AddCommGroup (drinfeldTowerCohomology K d ℓ i) :=
  sorry
instance (d ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) :
    Module (QlBar ℓ) (drinfeldTowerCohomology K d ℓ i) := sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation`
(packet API `U`, renamed). The fundamental representation `U_d^{d−1}`: the degree-`(d−1)` level
colimit of compact-support cohomology of `Res′Σ_n^d = ⊔_{r∈ℤ} Σ_n^d ⊗_{K̂^nr, φ_q^r} K̂^nr` with
its Weil descent (not the ordinary restriction of scalars); `ℓ ≠ p`. Smoothness of the actions
and continuity of the Weil action on compact-open invariants are stated in
`localCohomologyFiniteness`. -/
def FundamentalLocalRepresentation (d ℓ : ℕ) [Fact ℓ.Prime] : Type :=
  drinfeldTowerCohomology K d ℓ (d - 1)

instance (d ℓ : ℕ) [Fact ℓ.Prime] : AddCommGroup (FundamentalLocalRepresentation K d ℓ) :=
  inferInstanceAs (AddCommGroup (drinfeldTowerCohomology K d ℓ (d - 1)))
instance (d ℓ : ℕ) [Fact ℓ.Prime] : Module (QlBar ℓ) (FundamentalLocalRepresentation K d ℓ) :=
  inferInstanceAs (Module (QlBar ℓ) (drinfeldTowerCohomology K d ℓ (d - 1)))

/-- API `FundamentalLocalRepresentation.threeActions`: the commuting `GL_d(K)`, `D_K^×` and `W_K`
actions on `U_d^i`, as one representation of the product group. -/
def FundamentalLocalRepresentation.threeActions (d ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) :
    Representation (QlBar ℓ) (EqCharTriple K d) (drinfeldTowerCohomology K d ℓ i) := sorry

/-- `colim_n H_c^i(Σ_n^d ⊗ K̄)` of one component, with its `P_d`-action. -/
def drinfeldComponentCohomology (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (d ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) : Type := sorry

instance (d ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) :
    AddCommGroup (drinfeldComponentCohomology K d ℓ i) := sorry
instance (d ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) :
    Module (QlBar ℓ) (drinfeldComponentCohomology K d ℓ i) := sorry

/-- The `P_d`-action on the cohomology of one component. -/
def drinfeldComponentRep (d ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) :
    Representation (QlBar ℓ) (componentStabilizer K d) (drinfeldComponentCohomology K d ℓ i) :=
  sorry

/-- API `FundamentalLocalRepresentation.compactInduction`: `U_d^i ≅ c-Ind_{P_d}^{GL_d × D^× × W}`
of the component cohomology (compact induction from the open subgroup `P_d` is Mathlib's
`Representation.ind`). -/
theorem FundamentalLocalRepresentation.compactInduction (d ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ)
    (hℓ : (ℓ : K) ≠ 0) :
    Nonempty ((FundamentalLocalRepresentation.threeActions K d ℓ i).Equiv
      (Representation.ind (componentStabilizer K d).subtype (drinfeldComponentRep K d ℓ i))) := by
  sorry

/-- The submodule spanned by `z·v − ξ(z)v` for `z ∈ K^×` central in `GL_d(K)`. -/
def centralRelations (d ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) (ξ : Kˣ →* (QlBar ℓ)ˣ) :
    Submodule (QlBar ℓ) (drinfeldTowerCohomology K d ℓ i) :=
  Submodule.span (QlBar ℓ) {x | ∃ (z : Kˣ) (v : drinfeldTowerCohomology K d ℓ i),
    x = FundamentalLocalRepresentation.threeActions K d ℓ i
        (MonoidHom.inl _ _ (Units.map (algebraMap K (Matrix (Fin d) (Fin d) K)).toMonoidHom z)) v -
      ((ξ z : (QlBar ℓ)ˣ) : QlBar ℓ) • v}

/-- API `FundamentalLocalRepresentation.centralQuotient`: `U_d^i(ξ)`, the largest quotient on
which the centre `K^× ⊂ GL_d(K)` acts by `ξ`, with the induced three actions (genuine quotient;
invariance of the relations uses that the centre commutes with the product group). -/
def FundamentalLocalRepresentation.centralQuotient (d ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ)
    (ξ : Kˣ →* (QlBar ℓ)ˣ) :
    Representation (QlBar ℓ) (EqCharTriple K d)
      (drinfeldTowerCohomology K d ℓ i ⧸ centralRelations K d ℓ i ξ) :=
  (FundamentalLocalRepresentation.threeActions K d ℓ i).quotient _ sorry

/-- `H_c^i((Res′Σ_n^d)_{K̄}, Q̄_ℓ)` at finite cover level `n`. -/
def drinfeldCoverCohomology (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (d ℓ : ℕ) [Fact ℓ.Prime] (n i : ℕ) : Type := sorry

instance (d ℓ : ℕ) [Fact ℓ.Prime] (n i : ℕ) : AddCommGroup (drinfeldCoverCohomology K d ℓ n i) :=
  sorry
instance (d ℓ : ℕ) [Fact ℓ.Prime] (n i : ℕ) :
    Module (QlBar ℓ) (drinfeldCoverCohomology K d ℓ n i) := sorry

/-- The `GL_d(K) × D_K^× × W_K`-action at finite level `n`. -/
def drinfeldCoverRep (d ℓ : ℕ) [Fact ℓ.Prime] (n i : ℕ) :
    Representation (QlBar ℓ) (EqCharTriple K d) (drinfeldCoverCohomology K d ℓ n i) := sorry

/-- Pullback along `Σ_m → Σ_n` for `n ≤ m`, equivariant for the three actions. -/
def drinfeldCoverTransition (d ℓ : ℕ) [Fact ℓ.Prime] {n m : ℕ} (h : n ≤ m) (i : ℕ) :
    (drinfeldCoverRep K d ℓ n i).IntertwiningMap (drinfeldCoverRep K d ℓ m i) := sorry

/-- API `FundamentalLocalRepresentation.level`: the map from finite level `n` into the colimit
`U_d^i`, commuting with the three actions. -/
def FundamentalLocalRepresentation.level (d ℓ : ℕ) [Fact ℓ.Prime] (n i : ℕ) :
    (drinfeldCoverRep K d ℓ n i).IntertwiningMap
      (FundamentalLocalRepresentation.threeActions K d ℓ i) := sorry

/-- The level maps form a direct system. -/
lemma FundamentalLocalRepresentation.level_transition (d ℓ : ℕ) [Fact ℓ.Prime] {n m : ℕ}
    (h : n ≤ m) (i : ℕ) :
    (FundamentalLocalRepresentation.level K d ℓ m i).comp (drinfeldCoverTransition K d ℓ h i) =
      FundamentalLocalRepresentation.level K d ℓ n i := by
  sorry

-- FundamentalLocalRepresentation.degree_test: for d = 2 the fundamental representation is the degree-1 cohomology.
example (ℓ : ℕ) [Fact ℓ.Prime] :
    FundamentalLocalRepresentation K 2 ℓ = drinfeldTowerCohomology K 2 ℓ 1 := rfl

-- FundamentalLocalRepresentation.stabilizer_test: (g, 1, w) with v(det g) = 1 = v(Cl w) lies in P_d, while (g, 1, 1) with v(det g) = 1 does not: det valuation alone is not the condition.
example (d : ℕ) (g : Matrix.GeneralLinearGroup (Fin d) K) (w : WeilGroup K)
    (hg : localUnitValuation K (Matrix.GeneralLinearGroup.det g) = Multiplicative.ofAdd 1)
    (hw : localUnitValuation K (artinReciprocity K w) = Multiplicative.ofAdd 1) :
    (g, (1 : (LocalInvDivAlg K d)ˣ), w) ∈ componentStabilizer K d ∧
      (g, (1 : (LocalInvDivAlg K d)ˣ), (1 : WeilGroup K)) ∉ componentStabilizer K d := by
  simp [componentStabilizer, componentDegree, hg, hw]

-- FundamentalLocalRepresentation.coproduct_test: U_d^i is the direct sum (finite component support) over all r ∈ ℤ of the component cohomology, not a product.
example (d ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) (hℓ : (ℓ : K) ≠ 0) :
    Nonempty (drinfeldTowerCohomology K d ℓ i ≃ₗ[QlBar ℓ]
      DirectSum ℤ (fun _ => drinfeldComponentCohomology K d ℓ i)) := by
  sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-cohomology-finiteness`.
For `ℓ ≠ p`, `0 ≤ j ≤ 2(d−1)` and finite cover level `n`, the `GL_d(K) × D_K^×`-action on
`H_c^j((Res′Σ_n^d)_{K̄}, Q̄_ℓ)` is smooth (every vector has an open stabiliser) and the space is
of finite type over the group algebra of `GL_d(K)` (Hausberger 10.6(i)). Omitted: continuity of
the Weil action on compact-open invariants (needs the `ℓ`-adic topology on these invariants).
Not claimed: `GL_d(K)`-admissibility of the tower quotient `U_d^i(ξ)` (Boyer/Faltings input of
Hausberger 9.4), which finite type does not give. -/
theorem localCohomologyFiniteness (d ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : K) ≠ 0) (n j : ℕ)
    (hj : j ≤ 2 * (d - 1)) :
    (∀ v : drinfeldCoverCohomology K d ℓ n j,
      ∃ U : Subgroup (Matrix.GeneralLinearGroup (Fin d) K × (LocalInvDivAlg K d)ˣ),
        IsOpen (U : Set (Matrix.GeneralLinearGroup (Fin d) K × (LocalInvDivAlg K d)ˣ)) ∧
        ∀ u ∈ U, drinfeldCoverRep K d ℓ n j (u.1, u.2, 1) v = v) ∧
    Module.Finite (MonoidAlgebra (QlBar ℓ) (Matrix.GeneralLinearGroup (Fin d) K))
      (Representation.asModule ((drinfeldCoverRep K d ℓ n j).comp (MonoidHom.inl _ _))) := by
  sorry

/-- A model (underlying space) of an irreducible smooth representation of `GL_n(K)`
(`SmoothRepresentationsOfLocalGroups:SR.0`). -/
def IrrSmoothRep.glModel {n : ℕ} {k : Type} [Field k]
    (π : IrrSmoothRep (ReductiveGroup.GL K n) k) : Type := sorry

instance {n : ℕ} {k : Type} [Field k] (π : IrrSmoothRep (ReductiveGroup.GL K n) k) :
    AddCommGroup (IrrSmoothRep.glModel K π) := sorry
instance {n : ℕ} {k : Type} [Field k] (π : IrrSmoothRep (ReductiveGroup.GL K n) k) :
    Module k (IrrSmoothRep.glModel K π) := sorry

/-- The `GL_n(K)`-action on the model. -/
def IrrSmoothRep.glModelRep {n : ℕ} {k : Type} [Field k]
    (π : IrrSmoothRep (ReductiveGroup.GL K n) k) :
    Representation k (Matrix.GeneralLinearGroup (Fin n) K) (IrrSmoothRep.glModel K π) := sorry

/-- `Ext^i` in the category of smooth representations of a locally profinite group
(`SmoothRepresentationsOfLocalGroups:SR.2`). -/
def smoothRepExt {G : Type} [Group G] [TopologicalSpace G] {k : Type} [Field k] {V W : Type}
    [AddCommGroup V] [Module k V] [AddCommGroup W] [Module k W] (ρ : Representation k G V)
    (σ : Representation k G W) (i : ℕ) : Type := sorry

instance {G : Type} [Group G] [TopologicalSpace G] {k : Type} [Field k] {V W : Type}
    [AddCommGroup V] [Module k V] [AddCommGroup W] [Module k W] (ρ : Representation k G V)
    (σ : Representation k G W) (i : ℕ) : AddCommGroup (smoothRepExt ρ σ i) := sorry
instance {G : Type} [Group G] [TopologicalSpace G] {k : Type} [Field k] {V W : Type}
    [AddCommGroup V] [Module k V] [AddCommGroup W] [Module k W] (ρ : Representation k G V)
    (σ : Representation k G W) (i : ℕ) : Module k (smoothRepExt ρ σ i) := sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hochschild-serre-and-degeneration`.
The local vanishing behind the cuspidal degeneration (Hausberger 10.14–10.17): for `π`
supercuspidal and `i > 0`, `Ext^i_{GL_d(K)}(H_c^j((Res′Σ_n^d)_{K̄}), π) = 0` (restrict to
`GL_d(K)^0 = {v(det g) = 0}`, where `π` is injective by compactness of matrix coefficients, and
use Frobenius reciprocity for the compact induction). Hence a selected transfer with
supercuspidal `π_o` has multiplicity zero in `E₂^{i,j}`, `i > 0`, and
`E₂^{0,j}[Π^{∞,o}] ≅ (H^j)^{ss}[Π^{∞,o}]` with its `D_o^×` and Weil actions; that isotypic
bookkeeping uses the carriers of `function-field-automorphic/selected-isotypic-cohomology` and is
not restated here. Not a full degeneration for arbitrary automorphic constituents. -/
theorem hochschildSerreAndDegeneration (d ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : K) ≠ 0) (n j i : ℕ)
    (hi : 0 < i) (π : SupercuspidalRep (ReductiveGroup.GL K d) (QlBar ℓ)) :
    Subsingleton (smoothRepExt ((drinfeldCoverRep K d ℓ n j).comp (MonoidHom.inl _ _))
      (IrrSmoothRep.glModelRep K π.toIrr) i) := by
  sorry

/-- The Jacquet–Langlands transfer `JL(π)` of a supercuspidal `π` to `D_K^×` (owned by
`equal-characteristic/local-character-identity`; merge with that part's carrier). -/
def eqCharJLSpace {d ℓ : ℕ} [Fact ℓ.Prime] (π : SupercuspidalRep (ReductiveGroup.GL K d) (QlBar ℓ)) :
    Type := sorry

instance {d ℓ : ℕ} [Fact ℓ.Prime] (π : SupercuspidalRep (ReductiveGroup.GL K d) (QlBar ℓ)) :
    AddCommGroup (eqCharJLSpace K π) := sorry
instance {d ℓ : ℕ} [Fact ℓ.Prime] (π : SupercuspidalRep (ReductiveGroup.GL K d) (QlBar ℓ)) :
    Module (QlBar ℓ) (eqCharJLSpace K π) := sorry

/-- The `D_K^×`-action on `JL(π)`. -/
def eqCharJLRep {d ℓ : ℕ} [Fact ℓ.Prime] (π : SupercuspidalRep (ReductiveGroup.GL K d) (QlBar ℓ)) :
    Representation (QlBar ℓ) (LocalInvDivAlg K d)ˣ (eqCharJLSpace K π) := sorry

/-- The `d`-dimensional Weil representation `σ_d(π)` of the classical correspondence (owned by
`equal-characteristic/classical-local-correspondence`; merge with that part's carrier). -/
def eqCharWeilParamSpace {d ℓ : ℕ} [Fact ℓ.Prime]
    (π : SupercuspidalRep (ReductiveGroup.GL K d) (QlBar ℓ)) : Type := sorry

instance {d ℓ : ℕ} [Fact ℓ.Prime] (π : SupercuspidalRep (ReductiveGroup.GL K d) (QlBar ℓ)) :
    AddCommGroup (eqCharWeilParamSpace K π) := sorry
instance {d ℓ : ℕ} [Fact ℓ.Prime] (π : SupercuspidalRep (ReductiveGroup.GL K d) (QlBar ℓ)) :
    Module (QlBar ℓ) (eqCharWeilParamSpace K π) := sorry

/-- The `W_K`-action `σ_d(π)`. -/
def eqCharWeilParamRep {d ℓ : ℕ} [Fact ℓ.Prime]
    (π : SupercuspidalRep (ReductiveGroup.GL K d) (QlBar ℓ)) :
    Representation (QlBar ℓ) (WeilGroup K) (eqCharWeilParamSpace K π) := sorry

/-- The unramified character `|·|^{(1−d)/2} ∘ Cl` of `W_K`: `w ↦ (√q)^{(d−1)·deg w}`
(geometric Frobenius has degree one and `Cl` sends it to a uniformiser). -/
noncomputable def unramifiedTwistChar (ℓ : ℕ) [Fact ℓ.Prime] (s : SqrtQ (QlBar ℓ) (residueCard K))
    (d : ℕ) : WeilGroup K →* (QlBar ℓ)ˣ :=
  (zpowersHom (QlBar ℓ)ˣ (Units.mk0 (s.val ^ (d - 1)) sorry)).comp (WeilGroup.degree K)

/-- Twist of a representation by a character (genuine). -/
def charTwistRep {k G V : Type} [CommRing k] [Group G] [AddCommGroup V] [Module k V]
    (ρ : Representation k G V) (χ : G →* kˣ) : Representation k G V where
  toFun g := ((χ g : kˣ) : k) • ρ g
  map_one' := by simp
  map_mul' g h := by
    ext v
    simp only [map_mul, Units.val_mul, Module.End.mul_apply, LinearMap.smul_apply, map_smul,
      mul_smul]
    exact smul_comm _ _ _

/-- The space `Hom_{GL_d(K)}(π, U_d^i(ξ))`. -/
abbrev drinfeldCarayolHom (d ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) (ξ : Kˣ →* (QlBar ℓ)ˣ)
    (π : IrrSmoothRep (ReductiveGroup.GL K d) (QlBar ℓ)) : Type :=
  (IrrSmoothRep.glModelRep K π).IntertwiningMap
    ((FundamentalLocalRepresentation.centralQuotient K d ℓ i ξ).comp (MonoidHom.inl _ _))

/-- The `D_K^× × W_K`-action on `Hom_{GL_d(K)}(π, U_d^i(ξ))` by postcomposition (the actions on
`U_d^i(ξ)` commute with `GL_d(K)`). -/
def drinfeldCarayolHomRep (d ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) (ξ : Kˣ →* (QlBar ℓ)ˣ)
    (π : IrrSmoothRep (ReductiveGroup.GL K d) (QlBar ℓ)) :
    Representation (QlBar ℓ) ((LocalInvDivAlg K d)ˣ × WeilGroup K)
      (drinfeldCarayolHom K d ℓ i ξ π) where
  toFun bw :=
    { toFun := fun f => ⟨FundamentalLocalRepresentation.centralQuotient K d ℓ i ξ
          (MonoidHom.inr _ _ bw) ∘ₗ f.toLinearMap, sorry⟩
      map_add' := sorry
      map_smul' := sorry }
  map_one' := sorry
  map_mul' := sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/drinfeld-carayol`.
For `ℓ ≠ p`, `ξ : K^× → Q̄_ℓ^×` of finite order and `π` supercuspidal of `GL_d(K)` with central
character `ξ`: `Hom_{GL_d(K)}(π, U_d^i(ξ)) = 0` for `i ≠ d − 1`, and
`Hom_{GL_d(K)}(π, U_d^{d−1}(ξ)) ≅ JL(π) ⊗ (σ_d(π) ⊗ |·|^{(1−d)/2})` as
`D_K^× × W_K`-representations (Hausberger Thm 9.5; finite-order range only, arbitrary central
characters need the twisting comparison). -/
theorem drinfeldCarayol (d ℓ : ℕ) [NeZero d] [Fact ℓ.Prime] (hℓ : (ℓ : K) ≠ 0)
    (s : SqrtQ (QlBar ℓ) (residueCard K)) (ξ : Kˣ →* (QlBar ℓ)ˣ) (hξ : IsOfFinOrder ξ)
    (π : SupercuspidalRep (ReductiveGroup.GL K d) (QlBar ℓ))
    (hπ : π.toIrr.centralCharacter = ξ) :
    (∀ i, i ≠ d - 1 → Subsingleton (drinfeldCarayolHom K d ℓ i ξ π.toIrr)) ∧
    Nonempty ((drinfeldCarayolHomRep K d ℓ (d - 1) ξ π.toIrr).Equiv
      (Representation.tprod ((eqCharJLRep K π).comp (MonoidHom.fst _ _))
        ((charTwistRep (eqCharWeilParamRep K π) (unramifiedTwistChar K ℓ s d)).comp
          (MonoidHom.snd _ _)))) := by
  sorry

/-- Compactly supported cohomology of the minuscule local-shtuka Hecke fibre for `GL_d` with
its `GL_d(K)`, `D_K^×` and Weil actions, Satake-normalised by `[d−1]` and `((d−1)/2)`
(owned by `HeckeStacksAndLocalShtukas:HS3`). -/
def localShtukaHeckeFibreCohomology (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (d ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) : Type := sorry

instance (d ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) :
    AddCommGroup (localShtukaHeckeFibreCohomology K d ℓ i) := sorry
instance (d ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) :
    Module (QlBar ℓ) (localShtukaHeckeFibreCohomology K d ℓ i) := sorry

/-- The three actions on the Hecke-fibre cohomology. -/
def localShtukaHeckeFibreRep (d ℓ : ℕ) [Fact ℓ.Prime] (i : ℕ) :
    Representation (QlBar ℓ) (EqCharTriple K d) (localShtukaHeckeFibreCohomology K d ℓ i) := sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hecke-fibre-transport`.
The equal-characteristic Drinfeld tower cohomology `U_d^i` is isomorphic, compatibly with all three
actions (not only as spaces), to the cohomology of the minuscule local-shtuka Hecke fibre for
`GL_d` (HS3); so Drinfeld–Carayol transports to the Hecke side. The dual-tower realisation and
the export as the two-operation package `σ ⊗ ρ_π ⊗ ρ_π^∨` of the `GLn-comparison` trace theorem
use that part's carriers and are not restated here (recorded transport refinement). -/
theorem heckeFibreTransport (d ℓ : ℕ) [NeZero d] [Fact ℓ.Prime] (hℓ : (ℓ : K) ≠ 0) (i : ℕ) :
    Nonempty ((FundamentalLocalRepresentation.threeActions K d ℓ i).Equiv
      (localShtukaHeckeFibreRep K d ℓ i)) := by
  sorry

end EqCharLocalGeometry


/-! ### D-elliptic uniformisation at a ramified place and the quotient spectral sequence -/

section DEllipticUniformisation

open AlgebraicGeometry

variable {q : ℕ}

/-- The level subgroup `K_I^{∞,o} ⊂ D^×(A^∞)`: trivial component at `o`, and the principal
congruence subgroup of level `I` away from `o`. -/
def DEllAdelicUnits.levelAwayFrom (X : FFCurve q) (D : Type) [Ring D] [Algebra X.functionField D]
    (infty o : X.Place) (I : X.Place →₀ ℕ) : Subgroup (DEllAdelicUnits X D infty) := sorry

/-- `Z_I = D̄^×(F) \ D̄^×(A^∞) / K_I^{∞,o}` (genuine double-coset space, Mathlib `DoubleCoset.Quotient`). -/
abbrev DEllUniformisationCosets (X : FFCurve q) (Dbar : Type) [Ring Dbar]
    [Algebra X.functionField Dbar] (infty o : X.Place) (I : X.Place →₀ ℕ) : Type :=
  DoubleCoset.Quotient (Set.range (DEllAdelicUnits.diag X Dbar infty))
    (DEllAdelicUnits.levelAwayFrom X Dbar infty o I : Set (DEllAdelicUnits X Dbar infty))

/-- The quotient topology on `Z_I` (genuine). -/
instance (X : FFCurve q) (Dbar : Type) [Ring Dbar] [Algebra X.functionField Dbar]
    (infty o : X.Place) (I : X.Place →₀ ℕ) :
    TopologicalSpace (DEllUniformisationCosets X Dbar infty o I) :=
  inferInstanceAs (TopologicalSpace (Quotient (DoubleCoset.setoid
    (Set.range (DEllAdelicUnits.diag X Dbar infty))
    (DEllAdelicUnits.levelAwayFrom X Dbar infty o I : Set (DEllAdelicUnits X Dbar infty)))))

/-- The action of `GL_d(F_o) ≅ D̄_o^×` on `Z_I` by right translation at `o` (`g · z = z g⁻¹`),
through the splitting `D̄ ⊗ F_o ≅ M_d(F_o)`. -/
abbrev DEllUniformisationCosets.glAction (X : FFCurve q) (Dbar : Type) [Ring Dbar]
    [Algebra X.functionField Dbar] (infty o : X.Place) (I : X.Place →₀ ℕ) (d : ℕ) :
    MulAction (Matrix.GeneralLinearGroup (Fin d) o.completion)
      (DEllUniformisationCosets X Dbar infty o I) := sorry

/-- The automorphic representation `A_{D̄}`: locally constant functions on `Z_I` with
`GL_d(F_o)` acting by right translation. -/
def DEllUniformisationCosets.automorphicRep (X : FFCurve q) (Dbar : Type) [Ring Dbar]
    [Algebra X.functionField Dbar] (infty o : X.Place) (I : X.Place →₀ ℕ) (d ℓ : ℕ)
    [Fact ℓ.Prime] :
    Representation (QlBar ℓ) (Matrix.GeneralLinearGroup (Fin d) o.completion)
      (LocallyConstant (DEllUniformisationCosets X Dbar infty o I) (QlBar ℓ)) := sorry

/-- The quotient `(Y × Z)/GL_d(K)` of a formal scheme with a `GL_d(K)`-action by the diagonal
action (`R09.6`). -/
def uniformisationQuotient {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (d : ℕ) (Y : EqCharFormalScheme K) (Z : Type)
    [MulAction (Matrix.GeneralLinearGroup (Fin d) K) Z] : EqCharFormalScheme K := sorry

/-- Rigid-analytic spaces over `K` (`AdicSpacesPartII`/`HS2`). -/
def EqCharRigidSpace (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : Type 1 := sorry

instance {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : Category.{0} (EqCharRigidSpace K) := sorry

/-- The Drinfeld cover `Res′Σ_n^d` of level `n` with its Weil descent to `K`. -/
def drinfeldCoverSpace (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (d n : ℕ) : EqCharRigidSpace K := sorry

/-- The analytic quotient `(Σ × Z)/GL_d(K)`. -/
def rigidUniformisationQuotient {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (d : ℕ) (Y : EqCharRigidSpace K) (Z : Type)
    [MulAction (Matrix.GeneralLinearGroup (Fin d) K) Z] : EqCharRigidSpace K := sorry

/-- The formal completion along the fibre at `o` of the extension of `E_I` over `U_I ∪ {o}`,
base changed to `Ô_o^nr` (Hausberger §8). -/
def DEllipticModuli.formalCompletionAt (X : FFCurve q) (D : Type) [Ring D]
    [Algebra X.functionField D] [Algebra.IsCentral X.functionField D] [IsSimpleRing D]
    [FiniteDimensional X.functionField D] {infty : X.Place} (I : DEllLevelIdeal X infty)
    (o : X.Place) (ho : o ∉ I.1.support) : EqCharFormalScheme o.completion := sorry

/-- The generic analytic fibre over `F_o` of the moduli with level `I` away from `o` and level
`n` at `o` (Hausberger 8.3, `Res′` descent). -/
def DEllipticModuli.analyticFibreAt (X : FFCurve q) (D : Type) [Ring D]
    [Algebra X.functionField D] [Algebra.IsCentral X.functionField D] [IsSimpleRing D]
    [FiniteDimensional X.functionField D] {infty : X.Place} (I : DEllLevelIdeal X infty)
    (o : X.Place) (n : ℕ) : EqCharRigidSpace o.completion := sorry

variable (X : FFCurve q) (D Dbar : Type) [DivisionRing D] [Algebra X.functionField D]
  [Algebra.IsCentral X.functionField D] [FiniteDimensional X.functionField D]
  [DivisionRing Dbar] [Algebra X.functionField Dbar] [Algebra.IsCentral X.functionField Dbar]
  [FiniteDimensional X.functionField Dbar]

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation`.
Let `inv_o(D) = 1/d`, `inv_{o'}(D) = −1/d`, `inv_∞(D) = 0`, and let `D̄` have `inv_o(D̄) = 0`,
`inv_∞(D̄) = 1/d` and the same invariants as `D` elsewhere (`D` and `D̄` split at different
places). For a level `I` away from `∞` and `o`, with `Z_I = D̄^×(F)\D̄^×(A^∞)/K_I^{∞,o}`, the
formal completion along `o` of the extended `E_I` is `((Ω̂^d ⊗̂ Ô_o^nr) × Z_I)/GL_d(F_o)`
(Hausberger 8.1), and at level `n` at `o` the generic analytic fibre is
`(Σ_n^d × Z_I)/GL_d(F_o)` (8.3, no formal model with `o`-level). Omitted: compatibility with level
restriction, the away-`o` Hecke action and `D_o^×` (needs the corresponding actions on the
carriers). -/
theorem uniformisation (infty o o' : X.Place) (d : ℕ) [NeZero d] (hd : divAlgDegree X D = d)
    (hdbar : divAlgDegree X Dbar = d) (hinf : infty.degree = 1) (hoinf : o ≠ infty)
    (ho'inf : o' ≠ infty) (hoo' : o ≠ o')
    (hDo : hasseInvariant X D o = ((1 / d : ℚ) : AddCircle (1 : ℚ)))
    (hDo' : hasseInvariant X D o' = ((-1 / d : ℚ) : AddCircle (1 : ℚ)))
    (hDinf : hasseInvariant X D infty = 0) (hDbaro : hasseInvariant X Dbar o = 0)
    (hDbarinf : hasseInvariant X Dbar infty = ((1 / d : ℚ) : AddCircle (1 : ℚ)))
    (hDbar : ∀ x, x ≠ o → x ≠ infty → hasseInvariant X Dbar x = hasseInvariant X D x)
    (I : DEllLevelIdeal X infty) (hoI : o ∉ I.1.support) :
    letI := DEllUniformisationCosets.glAction X Dbar infty o I.1 d
    Nonempty (DEllipticModuli.formalCompletionAt X D I o hoI ≅
        uniformisationQuotient d (drinfeldUpperHalfSpace o.completion d)
          (DEllUniformisationCosets X Dbar infty o I.1)) ∧
      ∀ n : ℕ, Nonempty (DEllipticModuli.analyticFibreAt X D I o n ≅
        rigidUniformisationQuotient d (drinfeldCoverSpace o.completion d n)
          (DEllUniformisationCosets X Dbar infty o I.1)) := by
  sorry

/-- A convergent first-quadrant spectral sequence of `k`-modules with the given `E₂` terms and
abutment (general derived Hochschild–Serre machinery, `ArithmeticGaloisDuality:R02.2`). -/
def ConvergentSpectralSequence (k : Type) [Field k] (E₂ : ℕ → ℕ → ModuleCat.{0} k)
    (H : ℕ → ModuleCat.{0} k) : Type := sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-hochschild-serre`.
With `D`, `D̄`, `o` as in `uniformisation`, `ℓ ≠ p`, and a level `I` with `n = I(o)` at `o`
and `I^o` away from `o`, there is a convergent spectral sequence
`E₂^{i,j} = Ext^i_{GL_d(F_o), sm}(H_c^{2(d−1)−j}((Res′Σ_n^d)_{K̄}, Q̄_ℓ)(d−1), A_{D̄}) ⇒
H^{i+j}(E_{I,K̄}, Q̄_ℓ)` (zero for `j > 2(d−1)`; Hausberger 10.6(ii), 10.7, A.12). The Tate twist
`(d−1)` only changes the Weil action. Omitted: compatibility with levels, the away-`o` action of
`D`, `D_o^×` and `W_K` (needs those actions on the carrier spectral sequence). -/
theorem geometricHochschildSerre (infty o o' : X.Place) (d : ℕ) [NeZero d]
    (hd : divAlgDegree X D = d) (hdbar : divAlgDegree X Dbar = d) (hinf : infty.degree = 1)
    (hoinf : o ≠ infty) (ho'inf : o' ≠ infty) (hoo' : o ≠ o')
    (hDo : hasseInvariant X D o = ((1 / d : ℚ) : AddCircle (1 : ℚ)))
    (hDo' : hasseInvariant X D o' = ((-1 / d : ℚ) : AddCircle (1 : ℚ)))
    (hDinf : hasseInvariant X D infty = 0) (hDbaro : hasseInvariant X Dbar o = 0)
    (hDbarinf : hasseInvariant X Dbar infty = ((1 / d : ℚ) : AddCircle (1 : ℚ)))
    (hDbar : ∀ x, x ≠ o → x ≠ infty → hasseInvariant X Dbar x = hasseInvariant X D x)
    (I : DEllLevelIdeal X infty) (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : X.functionField) ≠ 0) :
    Nonempty (ConvergentSpectralSequence (QlBar ℓ)
      (fun i j => if j ≤ 2 * (d - 1) then
          ModuleCat.of (QlBar ℓ) (smoothRepExt
            ((drinfeldCoverRep o.completion d ℓ (I.1 o) (2 * (d - 1) - j)).comp (MonoidHom.inl _ _))
            (DEllUniformisationCosets.automorphicRep X Dbar infty o (I.1.erase o) d ℓ) i)
        else ModuleCat.of (QlBar ℓ) PUnit.{1})
      (fun m => ModuleCat.of (QlBar ℓ) (DEllipticModuli.cohomology X D I ℓ m))) := by
  sorry

end DEllipticUniformisation

end

end TauCeti.Blueprint.Excursion.ES7


namespace TauCeti.Blueprint.Excursion.ES7

open scoped TensorProduct DirectSum

/-! ### L-factors as rational functions -/

noncomputable section LFactors

/-- `L(V, y)` for a local factor `L(V, T) = P(T)⁻¹` with inverse factor `P ∈ 1 + T·k[T]`:
substitute `y ∈ k(T)` for `T` in `P` and invert. With `y = T` this is `L(V, T)`; with
`y = c·T⁻¹` it is `L(V, c·T⁻¹)` (`WeilConjectures:WC.2` convention for local factors). -/
def lFactorAt {k : Type} [Field k] (P : Polynomial k) (y : RatFunc k) : RatFunc k :=
  (Polynomial.aeval y P)⁻¹

end LFactors

/-! ### Frobenius-semisimple Weil–Deligne representations and their graded versions
(carriers owned by `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation` and
`ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`) -/

noncomputable section WeilDeligne

variable (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K] (ℓ : ℕ) [Fact ℓ.Prime]

/-- Isomorphism classes of finite-dimensional Frobenius-semisimple Weil–Deligne representations
of `W_K` over `Q̄_ℓ` (owned by `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`
and `.../frobenius-semisimplification`). Addition is direct sum, `0` is the zero representation. -/
def WDRep (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ℓ : ℕ) [Fact ℓ.Prime] : Type u := sorry

instance : AddCommMonoid (WDRep K ℓ) := sorry

variable {K ℓ}

/-- The inverse local factor `L(W, T)⁻¹ = det(1 − Frob·T | (W^{I_K})_{N = 0}) ∈ 1 + T·Q̄_ℓ[T]`
(geometric Frobenius; `ArithmeticGaloisRepresentations:R01.2`). -/
def WDRep.invLFactor : WDRep K ℓ → Polynomial (QlBar ℓ) := sorry

/-- The contragredient `W^∨` of a Weil–Deligne representation. -/
def WDRep.dual : WDRep K ℓ → WDRep K ℓ := sorry

/-- The contragredient of the zero representation is zero. -/
lemma WDRep.dual_zero : WDRep.dual (0 : WDRep K ℓ) = 0 := by
  sorry

/-- The Tate twist `W(n) = W ⊗ χ_cyc^n`, `n ∈ ℤ` (so `W(−j)` is the twist used in Kaiser's
chains). -/
def WDRep.tateTwist (W : WDRep K ℓ) (n : ℤ) : WDRep K ℓ := sorry

variable (K ℓ) in
/-- The special representation `σ⁰(St_i)` of LRS 14.12(iii)/14.13: the unique
Frobenius-semisimple indecomposable `i`-dimensional representation whose inverse `L`-factor is
divisible by `1 − T` (an `i`-step monodromy chain with trivial top quotient). -/
def WDRep.special (i : ℕ+) : WDRep K ℓ := sorry

/-- Weil–Deligne representations that are pure of weight `w` in the sense of LRS 14.13
(weight–monodromy), as a carrier type with its map to `WDRep`
(`DeligneWeightsAndPurity:DWP.5`). -/
def PureWDRep (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ℓ : ℕ) [Fact ℓ.Prime] (w : ℕ) : Type u := sorry

/-- A pure representation is a Weil–Deligne representation. -/
def PureWDRep.toWDRep {w : ℕ} : PureWDRep K ℓ w → WDRep K ℓ := sorry

variable (K ℓ) in
/-- Graded Frobenius-semisimple Weil–Deligne representations `V^• = ⊕_n V^n` with finitely many
nonzero degrees: finitely supported functions from degrees to `WDRep` (the graded carrier of
`ArithmeticGaloisRepresentations:R01.2`, as used in LRS 14.13). -/
abbrev GradedWDRep : Type u := ℕ →₀ WDRep K ℓ

/-- The degreewise contragredient `(V^•)^∨`, with `(V^∨)^n = (V^n)^∨` (Kaiser's notation). -/
def GradedWDRep.dual (V : GradedWDRep K ℓ) : GradedWDRep K ℓ :=
  Finsupp.mapRange WDRep.dual WDRep.dual_zero V

/-- The graded local factor `L(V^•, y) = ∏_n L(V^n, y)`, evaluated at `y ∈ Q̄_ℓ(T)`. As LRS
stress after Corollary 14.11, this is a plain product over the degrees, NOT an alternating
product. -/
def GradedWDRep.lFactor (V : GradedWDRep K ℓ) (y : RatFunc (QlBar ℓ)) : RatFunc (QlBar ℓ) :=
  V.prod fun _ W => lFactorAt W.invLFactor y

variable (K ℓ) in
/-- Kaiser's chain `⊕_{j=0}^{s} σ⁰(St_{i_j})(−i_0 − ⋯ − i_{j−1})`, started at the running Tate
offset `j₀`: the term `σ⁰(St_i)(−j)` sits in degree `i + 2j − 1` (Kaiser, Lemma 14.14′). The
chain of the lemma is `kaiserChain K ℓ [i_0, …, i_s] 0`. -/
def kaiserChain : List ℕ+ → ℕ → GradedWDRep K ℓ
  | [], _ => 0
  | i :: rest, j =>
      Finsupp.single ((i : ℕ) + 2 * j - 1) ((WDRep.special K ℓ i).tateTwist (-(j : ℤ))) +
        kaiserChain rest (j + i)

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-graded-chain-lemma`.
Moved from `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kaiser-graded-chain-lemma`.
Kaiser's amended Lemma 14.14′. Let `d ≥ 1`, `m′ ∣ m`, and let `V^•` be a pure graded
Frobenius-semisimple representation of `W_K` (degree `n` pure of weight `n`, degrees
`0, …, 2d − 2`). Suppose `L(V^•, T)/L((V^•)^∨, q^{−1}T^{−1})` equals
`((1 − q^{−d}T^{−1})/(1 − T))^m` up to a nonzero Laurent monomial `c·T^e`, and every
`L(V^n, T)⁻¹` is an `m′`-th power in `1 + T·Q̄_ℓ[T]`. Then `V^•` has a direct summand
`⊕_{a ∈ A} W_a`, `W_a = [⊕_j σ⁰(St_{i_j})(−i_0 − ⋯ − i_{j−1})]^{m′}`, with positive `i_j`
summing to `d` and `m = |A|·m′` (here `A = Fin k`, chains `chains a`). Self-duality and
integrality are NOT hypotheses. Only a direct summand is asserted, not that the complement has
no zero-`L`-factor summands. Here `K` is any non-archimedean local field (the lemma is applied
with `K = F_∞`); `q = residueCard K`. -/
theorem kaiserGradedChainLemma (d m m' : ℕ) (hd : 1 ≤ d) (hm : m' ∣ m)
    (V : GradedWDRep K ℓ)
    (hpure : ∀ n, ∃ W : PureWDRep K ℓ n, W.toWDRep = V n)
    (hdeg : ∀ n, 2 * d - 2 < n → V n = 0)
    (hratio : ∃ (c : (QlBar ℓ)ˣ) (e : ℤ),
      V.lFactor RatFunc.X /
          V.dual.lFactor (RatFunc.C ((residueCard K : QlBar ℓ))⁻¹ * RatFunc.X⁻¹) =
        RatFunc.C (c : QlBar ℓ) * RatFunc.X ^ e *
          ((1 - RatFunc.C ((residueCard K : QlBar ℓ) ^ d)⁻¹ * RatFunc.X⁻¹) /
            (1 - RatFunc.X)) ^ m)
    (hpow : ∀ n, ∃ P : Polynomial (QlBar ℓ), P.coeff 0 = 1 ∧ (V n).invLFactor = P ^ m') :
    ∃ (k : ℕ) (chains : Fin k → List ℕ+) (V' : GradedWDRep K ℓ),
      m = k * m' ∧ (∀ a, ((chains a).map PNat.val).sum = d) ∧
        V = (∑ a, m' • kaiserChain K ℓ (chains a) 0) + V' := by
  sorry

-- acceptance kaiser-graded-chain-lemma: at d = 1 the chain is σ⁰(St₁) in degree 0.
example : kaiserChain K ℓ [1] 0 = Finsupp.single 0 (WDRep.special K ℓ 1) := by
  sorry

end WeilDeligne

/-! ### Trivial and Steinberg representations (carriers owned by
`SmoothRepresentationsOfLocalGroups:SR.0` and `SmoothRepresentationsOfLocalGroups:SR.3`) -/

noncomputable section LocalSpecialReps

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]

/-- The trivial representation `1_G` of `G(E)` as an irreducible smooth representation
(`SmoothRepresentationsOfLocalGroups:SR.0`). -/
def IrrSmoothRep.trivialRep (G : ReductiveGroup E) (k : Type) [Field k] : IrrSmoothRep G k :=
  sorry

/-- The Steinberg representation `St_G` of `G(E)` (`SmoothRepresentationsOfLocalGroups:SR.3`);
for `G = D_∞^× ≅ GL_d(F_∞)` it is `St_d`. -/
def IrrSmoothRep.steinberg (G : ReductiveGroup E) (k : Type) [Field k] : IrrSmoothRep G k :=
  sorry

end LocalSpecialReps

/-! ### Cohomology of the `D`-elliptic tower and its automorphic isotypes

Setting: `X : FFCurve q` with function field `F`, a central division algebra `D` over `F` of
degree `d` (`finrank F D = d²`), a rational place `∞` where `D` splits, levels `I` (effective
divisors, i.e. finite closed subschemes of `X ∖ {∞}`), `ℓ ≠ p` and coefficients `Q̄_ℓ`.
The moduli schemes `E_{I}` are `DEllipticModuli` (node
`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`); their Hecke
correspondences are `DEllipticHecke` (node `.../frobenius-hecke-correspondences`). The carriers
below are their `ℓ`-adic cohomology (`EtaleDualityAndPerverseSheaves:EDC.2`). -/

noncomputable section DEllipticCohomologySection

/-- The set `Bad` of places where `D` ramifies: those `x` for which `F_x ⊗_F D` is not
isomorphic to a matrix algebra over `F_x`. -/
def dRamifiedPlaces {q : ℕ} (X : FFCurve q) (D : Type) [DivisionRing D]
    [Algebra X.functionField D] [Algebra.IsCentral X.functionField D]
    [FiniteDimensional X.functionField D] : Set X.Place :=
  {x | ∀ n : ℕ, IsEmpty
    (x.completion ⊗[X.functionField] D ≃ₐ[x.completion] Matrix (Fin n) (Fin n) x.completion)}

/-- The unit group `D^×(A^∞)` of `D` over the finite adeles (restricted product over `x ≠ ∞`),
a locally profinite group (owned by `AdelicAlgebraicGroups:AA.0/restricted-haar-product` and
`AdelicAlgebraicGroups:AA.1`). -/
def adelicUnitsAwayFrom {q : ℕ} (X : FFCurve q) (D : Type) [DivisionRing D]
    [Algebra X.functionField D] [Algebra.IsCentral X.functionField D]
    [FiniteDimensional X.functionField D] (infty : X.Place) : Type := sorry

variable {q : ℕ} (X : FFCurve q) (D : Type) [DivisionRing D] [Algebra X.functionField D]
  [Algebra.IsCentral X.functionField D] [FiniteDimensional X.functionField D]
  (infty : X.Place) (ℓ : ℕ) [Fact ℓ.Prime]

instance : Group (adelicUnitsAwayFrom X D infty) := sorry
instance : TopologicalSpace (adelicUnitsAwayFrom X D infty) := sorry
instance : IsTopologicalGroup (adelicUnitsAwayFrom X D infty) := sorry

/-- The component `g ↦ g_x ∈ D_x^×` of a finite adelic unit at a place `x ≠ ∞`. -/
def adelicUnitsAwayFrom.component (x : X.Place) :
    adelicUnitsAwayFrom X D infty →* (localUnitsGroup X D x).points := sorry

/-- The level subgroup `K_I = ker(O_D^×(Ô) → (O_D ⊗ O_I)^×) ⊆ D^×(A^∞)` (compact open; from the
maximal order of node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`
and `DEllipticLevel`). -/
def dEllipticLevelSubgroup (I : X.Place →₀ ℕ) : Subgroup (adelicUnitsAwayFrom X D infty) :=
  sorry

/-- A chosen geometric Frobenius `Frob_x ∈ Gal(F̄/F)` at a place `x` (well defined up to
conjugation and inertia; owned by `FunctionFieldArithmetic:FA.4`). -/
def FFCurve.Place.geomFrobenius {X : FFCurve q} (x : X.Place) :
    Field.absoluteGaloisGroup X.functionField := sorry

/-- The `ℓ`-adic cyclotomic character `χ_ℓ : Gal(F̄/F) → Z_ℓ^× ⊆ Q̄_ℓ^×` (Mathlib's
`cyclotomicCharacter` on `F̄`); the Tate twist `M(n)` is `M ⊗ χ_ℓ^n`. -/
def ffCyclotomicCharacter :
    Field.absoluteGaloisGroup X.functionField →* (QlBar ℓ)ˣ :=
  (Units.map (algebraMap ℤ_[ℓ] (QlBar ℓ)).toMonoidHom).comp
    ((cyclotomicCharacter (AlgebraicClosure X.functionField) ℓ).comp
      (MulSemiringAction.toRingEquiv
        (AlgebraicClosure X.functionField ≃ₐ[X.functionField] AlgebraicClosure X.functionField)
        (AlgebraicClosure X.functionField)))

/-- The finite-level cohomology `H_I^i = H^i(E_{I, F̄}, Q̄_ℓ)` of the `D`-elliptic moduli scheme
`E_I = DEllipticModuli` at level `I` (proper and smooth of dimension `d − 1` over `F` since `D`
is division). Finite-dimensionality is a theorem (`globalCohomology`), not built in. -/
def dEllipticCohomology {q : ℕ} (X : FFCurve q) (D : Type) [DivisionRing D]
    [Algebra X.functionField D] [Algebra.IsCentral X.functionField D]
    [FiniteDimensional X.functionField D] (infty : X.Place) (ℓ : ℕ) [Fact ℓ.Prime]
    (I : X.Place →₀ ℕ) (i : ℕ) : Type := sorry

instance (I : X.Place →₀ ℕ) (i : ℕ) : AddCommGroup (dEllipticCohomology X D infty ℓ I i) := sorry
instance (I : X.Place →₀ ℕ) (i : ℕ) : Module (QlBar ℓ) (dEllipticCohomology X D infty ℓ I i) :=
  sorry

/-- The `Gal(F̄/F)`-action on `H_I^i` (transport of structure on `E_{I, F̄}`). -/
def dEllipticCohomology.galois (I : X.Place →₀ ℕ) (i : ℕ) :
    Representation (QlBar ℓ) (Field.absoluteGaloisGroup X.functionField)
      (dEllipticCohomology X D infty ℓ I i) := sorry

/-- The Hecke operator `T_g = [K_I g K_I]` on `H_I^i` induced by the correspondence
`DEllipticHecke g` through a refined level (pull back, then push forward). -/
def dEllipticCohomology.hecke (I : X.Place →₀ ℕ) (i : ℕ) (g : adelicUnitsAwayFrom X D infty) :
    Module.End (QlBar ℓ) (dEllipticCohomology X D infty ℓ I i) := sorry

/-- The tower cohomology `H^i = colim_I H_I^i` (not finite dimensional). -/
def dEllipticTowerCohomology {q : ℕ} (X : FFCurve q) (D : Type) [DivisionRing D]
    [Algebra X.functionField D] [Algebra.IsCentral X.functionField D]
    [FiniteDimensional X.functionField D] (infty : X.Place) (ℓ : ℕ) [Fact ℓ.Prime]
    (i : ℕ) : Type := sorry

instance (i : ℕ) : AddCommGroup (dEllipticTowerCohomology X D infty ℓ i) := sorry
instance (i : ℕ) : Module (QlBar ℓ) (dEllipticTowerCohomology X D infty ℓ i) := sorry

/-- The `Gal(F̄/F)`-action on the tower cohomology. -/
def dEllipticTowerCohomology.galois (i : ℕ) :
    Representation (QlBar ℓ) (Field.absoluteGaloisGroup X.functionField)
      (dEllipticTowerCohomology X D infty ℓ i) := sorry

/-- The left `D^×(A^∞)`-action on the tower cohomology induced by the right action on the tower
(with the inversion convention of `DEllipticHecke.right_left_test`). -/
def dEllipticTowerCohomology.adelic (i : ℕ) :
    Representation (QlBar ℓ) (adelicUnitsAwayFrom X D infty)
      (dEllipticTowerCohomology X D infty ℓ i) := sorry

/-- The structure map `H_I^i → H^i` into the colimit. -/
def dEllipticTowerCohomology.levelMap (I : X.Place →₀ ℕ) (i : ℕ) :
    dEllipticCohomology X D infty ℓ I i →ₗ[QlBar ℓ] dEllipticTowerCohomology X D infty ℓ i :=
  sorry

/-- The semisimplification of `H^i` as a smooth `D^×(A^∞) × Gal(F̄/F)`-representation (LRS
§14.2: Jordan–Hölder at each level, compatibly in the tower). -/
def dEllipticTowerSemisimplification {q : ℕ} (X : FFCurve q) (D : Type) [DivisionRing D]
    [Algebra X.functionField D] [Algebra.IsCentral X.functionField D]
    [FiniteDimensional X.functionField D] (infty : X.Place) (ℓ : ℕ) [Fact ℓ.Prime]
    (i : ℕ) : Type := sorry

instance (i : ℕ) : AddCommGroup (dEllipticTowerSemisimplification X D infty ℓ i) := sorry
instance (i : ℕ) : Module (QlBar ℓ) (dEllipticTowerSemisimplification X D infty ℓ i) := sorry

/-- The Galois action on the semisimplified tower cohomology. -/
def dEllipticTowerSemisimplification.galois (i : ℕ) :
    Representation (QlBar ℓ) (Field.absoluteGaloisGroup X.functionField)
      (dEllipticTowerSemisimplification X D infty ℓ i) := sorry

/-- The `D^×(A^∞)`-action on the semisimplified tower cohomology. -/
def dEllipticTowerSemisimplification.adelic (i : ℕ) :
    Representation (QlBar ℓ) (adelicUnitsAwayFrom X D infty)
      (dEllipticTowerSemisimplification X D infty ℓ i) := sorry

variable {X D infty}

/-! Automorphic carriers attached to `A : AutomorphicRep X D infty k` (owned by
`FunctionFieldArithmetic:FA.6` and node
`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`). -/

/-- The finite part `A^∞`, an irreducible admissible representation of `D^×(A^∞)` over `k`. -/
def AutomorphicRep.finitePart {k : Type} [Field k] (A : AutomorphicRep X D infty k) : Type :=
  sorry

instance {k : Type} [Field k] (A : AutomorphicRep X D infty k) : AddCommGroup A.finitePart :=
  sorry
instance {k : Type} [Field k] (A : AutomorphicRep X D infty k) : Module k A.finitePart := sorry

/-- The smooth `D^×(A^∞)`-action on `A^∞`. -/
def AutomorphicRep.finiteAction {k : Type} [Field k] (A : AutomorphicRep X D infty k) :
    Representation k (adelicUnitsAwayFrom X D infty) A.finitePart := sorry

/-- The Hecke operator `[K_I g K_I]` on the `K_I`-invariants `(A^∞)^{K_I}` (finite dimensional by
admissibility). -/
def AutomorphicRep.heckeOperator {k : Type} [Field k] (A : AutomorphicRep X D infty k)
    (I : X.Place →₀ ℕ) (g : adelicUnitsAwayFrom X D infty) :
    Module.End k (Representation.invariants
      (MonoidHom.comp A.finiteAction (dEllipticLevelSubgroup X D infty I).subtype)) :=
  sorry

/-- The contragredient automorphic representation `A^∨` (inverse central character). -/
def AutomorphicRep.contragredient {k : Type} [Field k] (A : AutomorphicRep X D infty k) :
    AutomorphicRep X D infty k := sorry

/-- The places where `A` is ramified: `A_x` has no nonzero vector fixed by the maximal compact
`O_{D_x}^×` (contains `dRamifiedPlaces`). -/
def AutomorphicRep.ramifiedPlaces {k : Type} [Field k] (A : AutomorphicRep X D infty k) :
    Set X.Place := sorry

/-- The Satake parameters `{z_1(A_x), …, z_d(A_x)}` of an unramified component at a split place
`x`, unitarily normalised with the chosen `√q` (so `tr A_x(f_{x,r}) = q_x^{r(d−1)/2} Σ_j z_j^r`
for the spherical function `f_{x,r}` of LRS 14.4–14.5). -/
def AutomorphicRep.satakeParameters {k : Type} [Field k] (A : AutomorphicRep X D infty k)
    (s : SqrtQ k q) (x : X.Place) : Multiset k := sorry

/-- The inverse Godement–Jacquet local factor `L_x(A, T)⁻¹ ∈ 1 + T·k[T]` of `A_x` (a
representation of `D_x^×`, an inner form of `GL_d(F_x)`). -/
def AutomorphicRep.localInvLFactor {k : Type} [Field k] (A : AutomorphicRep X D infty k)
    (x : X.Place) : Polynomial k := sorry

variable (X D infty) in
/-- The proven transfer image of LRS 15.10–15.11 / Hausberger 10.3: automorphic representations
of `D^×` obtained from a selected globalisation `Π̃` of node
`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/globalisation` by the
selected transfer of node `.../jacquet-langlands-transfer` (empty unless `D` has invariants
`+1/d` at `o`, `−1/d` at `o′` and `0` elsewhere), as a carrier type with its map to
`AutomorphicRep`. -/
def SelectedTransferImage {q : ℕ} (X : FFCurve q) (D : Type) [DivisionRing D]
    [Algebra X.functionField D] [Algebra.IsCentral X.functionField D]
    [FiniteDimensional X.functionField D] (infty : X.Place) (k : Type) [Field k] : Type :=
  sorry

/-- A member of the selected transfer image is an automorphic representation. -/
def SelectedTransferImage.rep {k : Type} [Field k] :
    SelectedTransferImage X D infty k → AutomorphicRep X D infty k := sorry

variable {ℓ}

/-- The isotypic multiplicity space `V_A^i` (LRS §14.2): the `A^∞`-isotypic part of the
semisimplified `H^i` is `A^∞ ⊗ V_A^i`, a finite-dimensional `Gal(F̄/F)`-representation. -/
def dEllipticIsotypic (A : AutomorphicRep X D infty (QlBar ℓ)) (i : ℕ) : Type := sorry

instance (A : AutomorphicRep X D infty (QlBar ℓ)) (i : ℕ) :
    AddCommGroup (dEllipticIsotypic A i) := sorry
instance (A : AutomorphicRep X D infty (QlBar ℓ)) (i : ℕ) :
    Module (QlBar ℓ) (dEllipticIsotypic A i) := sorry

/-- The Galois action on `V_A^i`. -/
def dEllipticIsotypic.galois (A : AutomorphicRep X D infty (QlBar ℓ)) (i : ℕ) :
    Representation (QlBar ℓ) (Field.absoluteGaloisGroup X.functionField)
      (dEllipticIsotypic A i) := sorry

/-- The graded local representation `(V_A^•)|_{W_{F_x}}` at a place `x`, as a graded
Frobenius-semisimple Weil–Deligne representation (Frobenius semisimplification of the
Grothendieck monodromy representation, degree `n` component `V_A^n`; LRS 14.13). -/
def dEllipticIsotypic.localGraded (A : AutomorphicRep X D infty (QlBar ℓ)) (x : X.Place) :
    GradedWDRep x.completion ℓ := sorry

end DEllipticCohomologySection

/-! ### Theorems on the global cohomology (layer `ES7:equal-characteristic`) -/

section DEllipticCohomologyTheorems

variable {q : ℕ} (X : FFCurve q) (D : Type) [DivisionRing D] [Algebra X.functionField D]
  [Algebra.IsCentral X.functionField D] [FiniteDimensional X.functionField D]
  (infty : X.Place) (ℓ : ℕ) [Fact ℓ.Prime]

open Classical in
/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/global-cohomology`.
Moved from `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/global-cohomology`.
For `D` division of degree `d`, `∞` rational with `D_∞` split, `ℓ ≠ p`, and every nonempty
level `I` away from `∞`:
* each `H_I^i = H^i(E_{I,F̄}, Q̄_ℓ)` is finite dimensional and vanishes for `i > 2(d − 1)`;
* `H_I^i → H^i = colim_I H_I^i` is injective with image
  the `K_I`-invariants (so the `K_I`-invariants of the tower are finite dimensional, while the
  tower itself is NOT asserted finite dimensional);
* the `D^×(A^∞)`- and Galois actions on `H^i` commute;
* the semisimplified `H^i` is `⊕_A A^∞ ⊗ V_A^i`, compatibly with both actions, each `V_A^i` is
  finite dimensional, and `V_A^i ≠ 0` forces `A_∞ ≅ 1` or `A_∞ ≅ St`.
Omitted (no carrier): continuity of the Galois actions and definability over a finite extension
of `Q_ℓ` (no topology on `QlBar ℓ` at the pinned Mathlib); "sufficiently small level" and the
hypotheses `ℓ ≠ p`, `deg ∞ = 1`, `D_∞` split are part of the `AutomorphicRep` setting. Single-degree
concentration and multiplicity one are NOT claimed here (see `selectedIsotypicCohomology`). -/
theorem globalCohomology (d : ℕ) (hd : Module.finrank X.functionField D = d ^ 2) :
    (∀ (I : X.Place →₀ ℕ) (i : ℕ), infty ∉ I.support → I ≠ 0 →
      FiniteDimensional (QlBar ℓ) (dEllipticCohomology X D infty ℓ I i) ∧
      (2 * (d - 1) < i → Subsingleton (dEllipticCohomology X D infty ℓ I i)) ∧
      Function.Injective (dEllipticTowerCohomology.levelMap X D infty ℓ I i) ∧
      LinearMap.range (dEllipticTowerCohomology.levelMap X D infty ℓ I i) =
        Representation.invariants (MonoidHom.comp (dEllipticTowerCohomology.adelic X D infty ℓ i)
          (dEllipticLevelSubgroup X D infty I).subtype)) ∧
    (∀ (i : ℕ) (σ : Field.absoluteGaloisGroup X.functionField) (g : adelicUnitsAwayFrom X D infty),
      dEllipticTowerCohomology.galois X D infty ℓ i σ ∘ₗ
          dEllipticTowerCohomology.adelic X D infty ℓ i g =
        dEllipticTowerCohomology.adelic X D infty ℓ i g ∘ₗ
          dEllipticTowerCohomology.galois X D infty ℓ i σ) ∧
    (∀ i : ℕ, ∃ e : dEllipticTowerSemisimplification X D infty ℓ i ≃ₗ[QlBar ℓ]
        ⨁ A : AutomorphicRep X D infty (QlBar ℓ), A.finitePart ⊗[QlBar ℓ] dEllipticIsotypic A i,
      (∀ (A : AutomorphicRep X D infty (QlBar ℓ)) (σ : Field.absoluteGaloisGroup X.functionField)
          (a : A.finitePart) (v : dEllipticIsotypic A i),
        e.symm (DirectSum.lof (QlBar ℓ) _
            (fun A : AutomorphicRep X D infty (QlBar ℓ) =>
              A.finitePart ⊗[QlBar ℓ] dEllipticIsotypic A i) A
            (a ⊗ₜ dEllipticIsotypic.galois A i σ v)) =
          dEllipticTowerSemisimplification.galois X D infty ℓ i σ
            (e.symm (DirectSum.lof (QlBar ℓ) _
              (fun A : AutomorphicRep X D infty (QlBar ℓ) =>
                A.finitePart ⊗[QlBar ℓ] dEllipticIsotypic A i) A (a ⊗ₜ v)))) ∧
      (∀ (A : AutomorphicRep X D infty (QlBar ℓ)) (g : adelicUnitsAwayFrom X D infty)
          (a : A.finitePart) (v : dEllipticIsotypic A i),
        e.symm (DirectSum.lof (QlBar ℓ) _
            (fun A : AutomorphicRep X D infty (QlBar ℓ) =>
              A.finitePart ⊗[QlBar ℓ] dEllipticIsotypic A i) A
            (A.finiteAction g a ⊗ₜ v)) =
          dEllipticTowerSemisimplification.adelic X D infty ℓ i g
            (e.symm (DirectSum.lof (QlBar ℓ) _
              (fun A : AutomorphicRep X D infty (QlBar ℓ) =>
                A.finitePart ⊗[QlBar ℓ] dEllipticIsotypic A i) A (a ⊗ₜ v))))) ∧
    (∀ (A : AutomorphicRep X D infty (QlBar ℓ)) (i : ℕ),
      FiniteDimensional (QlBar ℓ) (dEllipticIsotypic A i)) ∧
    (∀ (A : AutomorphicRep X D infty (QlBar ℓ)) (i : ℕ), Nontrivial (dEllipticIsotypic A i) →
      A.localComponent infty = IrrSmoothRep.trivialRep (localUnitsGroup X D infty) (QlBar ℓ) ∨
        A.localComponent infty = IrrSmoothRep.steinberg (localUnitsGroup X D infty) (QlBar ℓ)) := by
  sorry

open Classical in
/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-automorphic-trace`.
Moved from `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/geometric-automorphic-trace`.
LRS 13.6/13.7 and 14.9. Let `I ≠ 0` be a level away from `∞`, `o ∉ {∞} ∪ Bad ∪ supp I` a good place, `r ≥ 1`, and
`g ∈ D^×(A^∞)` with `g_o = 1` (the away-`o` Hecke test `1_{K_I g K_I}`). Then
`Σ_i (−1)^i tr(Frob_o^r ∘ T_g | H_I^i) = Σ_A ε(A_∞) m(A) q_o^{r(d−1)/2} Σ_j z_j(A_o)^r ·
tr(T_g | (A^∞)^{K_I})`, the sum over `A` with `A_∞ ∈ {1, St}`, where the Euler–Poincaré traces
give `ε(1) = 1` and `ε(St) = (−1)^{d−1}`; here `q_o^{1/2} = (√q)^{deg o}`. Second part: for a
Steinberg isotype, for almost all places `o` (outside a finite set, LRS 14.9(ii)), the alternating
Frobenius trace on `V_A^•` is `(−1)^{d−1} m(A) q_o^{r(d−1)/2} Σ_j z_j(A_o)^r`. This is an
alternating-trace statement only; no concentration in one degree is asserted. The Satake
parameters are only meaningful at unramified places; `A` without `K_I`-fixed vectors contribute
`0` through the Hecke trace. -/
theorem geometricAutomorphicTrace (d : ℕ) (hd : Module.finrank X.functionField D = d ^ 2)
    (hd1 : 1 ≤ d) (s : SqrtQ (QlBar ℓ) q) :
    (∀ (I : X.Place →₀ ℕ), infty ∉ I.support → I ≠ 0 →
      ∀ (o : X.Place), o ≠ infty → o ∉ I.support → o ∉ dRamifiedPlaces X D →
      ∀ (r : ℕ), 1 ≤ r → ∀ g : adelicUnitsAwayFrom X D infty,
        adelicUnitsAwayFrom.component X D infty o g = 1 →
        ∑ i ∈ Finset.range (2 * d - 1), (-1 : QlBar ℓ) ^ i *
            LinearMap.trace (QlBar ℓ) (dEllipticCohomology X D infty ℓ I i)
              (dEllipticCohomology.galois X D infty ℓ I i (o.geomFrobenius ^ r) ∘ₗ
                dEllipticCohomology.hecke X D infty ℓ I i g) =
          ∑ᶠ (A : AutomorphicRep X D infty (QlBar ℓ))
            (_ : A.localComponent infty =
                IrrSmoothRep.trivialRep (localUnitsGroup X D infty) (QlBar ℓ) ∨
              A.localComponent infty =
                IrrSmoothRep.steinberg (localUnitsGroup X D infty) (QlBar ℓ)),
            (if A.localComponent infty =
                IrrSmoothRep.steinberg (localUnitsGroup X D infty) (QlBar ℓ)
              then (-1 : QlBar ℓ) ^ (d - 1) else 1) *
              (A.multiplicity : QlBar ℓ) * s.val ^ (o.degree * r * (d - 1)) *
              ((A.satakeParameters s o).map (· ^ r)).sum *
              LinearMap.trace (QlBar ℓ) _ (A.heckeOperator I g)) ∧
    (∀ A : AutomorphicRep X D infty (QlBar ℓ),
      A.localComponent infty = IrrSmoothRep.steinberg (localUnitsGroup X D infty) (QlBar ℓ) →
      ∃ S : Set X.Place, S.Finite ∧ ∀ o : X.Place, o ∉ S → ∀ r : ℕ,
        ∑ i ∈ Finset.range (2 * d - 1), (-1 : QlBar ℓ) ^ i *
            LinearMap.trace (QlBar ℓ) (dEllipticIsotypic A i)
              (dEllipticIsotypic.galois A i (o.geomFrobenius ^ r)) =
          (-1 : QlBar ℓ) ^ (d - 1) * (A.multiplicity : QlBar ℓ) *
            s.val ^ (o.degree * r * (d - 1)) * ((A.satakeParameters s o).map (· ^ r)).sum) := by
  sorry

-- acceptance geometric-automorphic-trace: for d = 2 the alternating Steinberg sign is −1
-- (before the middle-degree sign `(−1)^{d−1}` of `H^{d−1}` cancels it).
example (s : SqrtQ (QlBar ℓ) q) (hd : Module.finrank X.functionField D = 2 ^ 2)
    (A : AutomorphicRep X D infty (QlBar ℓ))
    (hA : A.localComponent infty = IrrSmoothRep.steinberg (localUnitsGroup X D infty) (QlBar ℓ)) :
    ∃ S : Set X.Place, S.Finite ∧ ∀ o : X.Place, o ∉ S → ∀ r : ℕ,
      ∑ i ∈ Finset.range 3, (-1 : QlBar ℓ) ^ i *
          LinearMap.trace (QlBar ℓ) (dEllipticIsotypic A i)
            (dEllipticIsotypic.galois A i (o.geomFrobenius ^ r)) =
        -((A.multiplicity : QlBar ℓ) * s.val ^ (o.degree * r) *
          ((A.satakeParameters s o).map (· ^ r)).sum) := by
  sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/dual-isotypic-pairing`.
Moved from `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/dual-isotypic-pairing`.
At a finite proper level (`E_I` of dimension `d − 1`), Poincaré duality is a perfect Galois-equivariant pairing
`H_I^i × H_I^{2(d−1)−i} → Q̄_ℓ(−(d−1))` for which the adjoint of `T_g` is `T_{g⁻¹}`; on
isotypes it pairs `H^i[A]` with `H^{2(d−1)−i}[A^∨]`, i.e.
`(V_A^i)^∨ ≅ V_{A^∨}^{2(d−1)−i}(d−1)` as Galois representations, and `m(A^∨) = m(A)`. There is NO
identification with the same `A`-isotype unless a compatible self-duality is specified (the
error corrected by Kaiser). Omitted: the inverse central character of `A^∨` (no global central
character carrier). -/
theorem dualIsotypicPairing (d : ℕ) (hd : Module.finrank X.functionField D = d ^ 2)
    (hd1 : 1 ≤ d) :
    (∀ (I : X.Place →₀ ℕ), infty ∉ I.support → I ≠ 0 → ∀ i : ℕ, i ≤ 2 * (d - 1) →
      ∃ P : dEllipticCohomology X D infty ℓ I i →ₗ[QlBar ℓ]
          dEllipticCohomology X D infty ℓ I (2 * (d - 1) - i) →ₗ[QlBar ℓ] QlBar ℓ,
        P.IsPerfPair ∧
        (∀ (σ : Field.absoluteGaloisGroup X.functionField) x y,
          P (dEllipticCohomology.galois X D infty ℓ I i σ x)
              (dEllipticCohomology.galois X D infty ℓ I (2 * (d - 1) - i) σ y) =
            (((ffCyclotomicCharacter X ℓ σ)⁻¹ ^ (d - 1) : (QlBar ℓ)ˣ) : QlBar ℓ) * P x y) ∧
        (∀ (g : adelicUnitsAwayFrom X D infty) x y,
          P (dEllipticCohomology.hecke X D infty ℓ I i g x) y =
            P x (dEllipticCohomology.hecke X D infty ℓ I (2 * (d - 1) - i) g⁻¹ y))) ∧
    (∀ (A : AutomorphicRep X D infty (QlBar ℓ)) (i : ℕ), i ≤ 2 * (d - 1) →
      ∃ e : Module.Dual (QlBar ℓ) (dEllipticIsotypic A i) ≃ₗ[QlBar ℓ]
          dEllipticIsotypic A.contragredient (2 * (d - 1) - i),
        ∀ (σ : Field.absoluteGaloisGroup X.functionField) f,
          e ((dEllipticIsotypic.galois A i).dual σ f) =
            (((ffCyclotomicCharacter X ℓ σ) ^ (d - 1) : (QlBar ℓ)ˣ) : QlBar ℓ) •
              dEllipticIsotypic.galois A.contragredient (2 * (d - 1) - i) σ (e f)) ∧
    (∀ A : AutomorphicRep X D infty (QlBar ℓ), A.contragredient.multiplicity = A.multiplicity) := by
  sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-erratum`.
Moved from `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kaiser-erratum`.
LRS Corollary 14.11(iii) with Kaiser's correction: for `A` with `A_∞ ≅ St` and every place `x` there are `c ∈ Q̄_ℓ^×`, `n ∈ ℤ`
with
`L_x(V_A^•, T) / L_x((V_A^•)^∨, q_x^{−1}T^{−1}) =
  c·T^n · [L_x(A, q_x^{(d−1)/2}T) / L_x(A^∨, q_x^{−(d+1)/2}T^{−1})]^{m(A)}`,
where `L_x(V^•, T) = ∏_n L_x(V^n, T)` (not alternating), `q_x = q^{deg x}` and
`q_x^{1/2} = (√q)^{deg x}`. The published second factor `L_x(V^•, q_x^{−d}T^{−1})` is replaced
in both the dual AND the exponent; replacing only `V` by `V^∨` while keeping `q_x^{−d}` is not
the correction (see the `example` below). The isotypic duality used is `dualIsotypicPairing`. -/
theorem kaiserErratum (d : ℕ) (hd : Module.finrank X.functionField D = d ^ 2) (hd1 : 1 ≤ d)
    (s : SqrtQ (QlBar ℓ) q) (A : AutomorphicRep X D infty (QlBar ℓ))
    (hA : A.localComponent infty = IrrSmoothRep.steinberg (localUnitsGroup X D infty) (QlBar ℓ))
    (x : X.Place) :
    ∃ (c : (QlBar ℓ)ˣ) (n : ℤ),
      (dEllipticIsotypic.localGraded A x).lFactor RatFunc.X /
          (dEllipticIsotypic.localGraded A x).dual.lFactor
            (RatFunc.C ((q : QlBar ℓ) ^ x.degree)⁻¹ * RatFunc.X⁻¹) =
        RatFunc.C (c : QlBar ℓ) * RatFunc.X ^ n *
          (lFactorAt (A.localInvLFactor x) (RatFunc.C (s.val ^ (x.degree * (d - 1))) * RatFunc.X) /
            lFactorAt (A.contragredient.localInvLFactor x)
              (RatFunc.C (s.val ^ (x.degree * (d + 1)))⁻¹ * RatFunc.X⁻¹)) ^ A.multiplicity := by
  sorry

-- acceptance kaiser-erratum: keeping `q^{−d}` is not the correction. For `V = Q̄_ℓ` in degree 0
-- (inverse factor `1 − T`) and `d = 2`, the corrected factor `L(V^∨, q^{−1}T^{−1})` differs from
-- `L(V^∨, q^{−2}T^{−1})` as soon as `q > 1`.
example (qx : ℕ) (hq : 1 < qx) :
    lFactorAt (1 - Polynomial.X : Polynomial (QlBar ℓ))
        (RatFunc.C ((qx : QlBar ℓ))⁻¹ * RatFunc.X⁻¹) ≠
      lFactorAt (1 - Polynomial.X : Polynomial (QlBar ℓ))
        (RatFunc.C ((qx : QlBar ℓ) ^ 2)⁻¹ * RatFunc.X⁻¹) := by
  sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-graded-chain-proposition`.
Moved from `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kaiser-graded-chain-proposition`.
Kaiser's amended Proposition 14.17′: for `A` with `A_∞ ≅ St_d`, the Frobenius-semisimplified graded local
representation `(V_A^•)|_{W_{F_∞}}` is `[⊕_{j=0}^{s} σ⁰(St_{i_j})(−i_0 − ⋯ − i_{j−1})]^{m(A)}`
for positive `i_j` with `Σ i_j = d`, the `j`-th term in degree
`i_j + 2(i_0 + ⋯ + i_{j−1}) − 1`. This is a chain conclusion: a chain with several parts is NOT
identified with `St_d` in middle degree (that is `selectedIsotypicCohomology`, for the selected
image only). -/
theorem kaiserGradedChainProposition (d : ℕ) (hd : Module.finrank X.functionField D = d ^ 2)
    (hd1 : 1 ≤ d) (A : AutomorphicRep X D infty (QlBar ℓ))
    (hA : A.localComponent infty = IrrSmoothRep.steinberg (localUnitsGroup X D infty) (QlBar ℓ)) :
    ∃ c : List ℕ+, (c.map PNat.val).sum = d ∧
      dEllipticIsotypic.localGraded A infty =
        A.multiplicity • kaiserChain infty.completion ℓ c 0 := by
  sorry

/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/selected-isotypic-cohomology`.
Moved from `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/selected-isotypic-cohomology`.
LRS 15.12 with the remark after 14.12 and Hausberger 10.5. For `A` in the proven transfer image of LRS
15.10–15.11: `V_A^i = 0` for `i ≠ d − 1`, `dim V_A^{d−1} = d`, `m(A) = 1`, and at every good
place `o` (`o ≠ ∞`, `D` and `A` unramified at `o`) and `r ∈ ℤ`,
`tr(Frob_o^r | V_A^{d−1}) = q_o^{r(d−1)/2} Σ_j z_j(A_o)^r` (at split places `A_o = Π̃_o`). The
normalised `Σ(A) = V_A^{d−1}((d−1)/2)` is the selected global Galois representation (the
half Tate twist uses the chosen `√q`; not encoded). No concentration is asserted for arbitrary
division-algebra isotypes. -/
theorem selectedIsotypicCohomology (d : ℕ) (hd : Module.finrank X.functionField D = d ^ 2)
    (hd1 : 1 ≤ d) (s : SqrtQ (QlBar ℓ) q) (t : SelectedTransferImage X D infty (QlBar ℓ)) :
    (∀ i : ℕ, i ≠ d - 1 → Subsingleton (dEllipticIsotypic t.rep i)) ∧
    Module.finrank (QlBar ℓ) (dEllipticIsotypic t.rep (d - 1)) = d ∧
    t.rep.multiplicity = 1 ∧
    (∀ o : X.Place, o ≠ infty → o ∉ dRamifiedPlaces X D → o ∉ t.rep.ramifiedPlaces →
      ∀ r : ℤ,
        LinearMap.trace (QlBar ℓ) (dEllipticIsotypic t.rep (d - 1))
            (dEllipticIsotypic.galois t.rep (d - 1) (o.geomFrobenius ^ r)) =
          s.val ^ ((o.degree : ℤ) * r * ((d : ℤ) - 1)) *
            ((t.rep.satakeParameters s o).map (· ^ r)).sum) := by
  sorry

-- acceptance selected-isotypic-cohomology: for d = 1 the selected representation sits in
-- degree 0 = d − 1 and has dimension 1.
example (s : SqrtQ (QlBar ℓ) q) (t : SelectedTransferImage X D infty (QlBar ℓ))
    (hd : Module.finrank X.functionField D = 1 ^ 2) :
    Module.finrank (QlBar ℓ) (dEllipticIsotypic t.rep 0) = 1 := by
  sorry

end DEllipticCohomologyTheorems

/-! ### The equal-characteristic local correspondence of LRS §15 -/

noncomputable section LocalCorrespondence

variable (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K]

/-- Isomorphism classes of `d`-dimensional semisimple continuous representations of the Weil
group `W_K` over a field `k` (owned by `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`
and `ArithmeticGaloisRepresentations:R01.2`). -/
def WeilRep (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (k : Type) [Field k] (d : ℕ) : Type u := sorry

/-- Isomorphism classes of IRREDUCIBLE `d`-dimensional continuous representations of `W_K` over
`k`, as a carrier type with its map to `WeilRep`. -/
def IrrWeilRep (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (k : Type) [Field k] (d : ℕ) : Type u := sorry

/-- The local reciprocity map `W_K → W_K^{ab} ≅ K^×` of local class field theory, normalised so
that geometric Frobenius maps to a uniformiser (`FunctionFieldArithmetic:FA.5`; LRS's geometric
convention). Characters of `K^×` become characters of `W_K` by composing with it. -/
def localReciprocity : WeilGroup K →* Kˣ := sorry

variable {K} {k : Type} [Field k]

/-- An irreducible representation is a semisimple representation. -/
def IrrWeilRep.toWeilRep {d : ℕ} : IrrWeilRep K k d → WeilRep K k d := sorry

/-- The determinant character `det σ : W_K → k^×`. -/
def WeilRep.det {d : ℕ} : WeilRep K k d → (WeilGroup K →* kˣ) := sorry

/-- The contragredient `σ^∨`. -/
def WeilRep.dual {d : ℕ} : WeilRep K k d → WeilRep K k d := sorry

/-- The twist `σ ⊗ χ` by a character `χ : W_K → k^×`. -/
def WeilRep.twist {d : ℕ} (σ : WeilRep K k d) (χ : WeilGroup K →* kˣ) : WeilRep K k d := sorry

/-- The inverse Artin local factor `L(σ ⊗ σ′, T)⁻¹ ∈ 1 + T·k[T]` of a tensor product. -/
def WeilRep.pairInvLFactor {d d' : ℕ} (σ : WeilRep K k d) (σ' : WeilRep K k d') :
    Polynomial k := sorry

/-- The Langlands–Deligne local constant `ε(σ ⊗ σ′, ψ, T)`, a unit monomial in `k[T, T⁻¹]`. -/
def WeilRep.pairEpsilon {d d' : ℕ} (σ : WeilRep K k d) (σ' : WeilRep K k d')
    (ψ : AddChar K k) : LaurentPolynomial k := sorry

/-- The twist `π ⊗ (χ ∘ det)` of a supercuspidal representation of `GL_d(K)` by a character
`χ : K^× → k^×` (`SmoothRepresentationsOfLocalGroups:SR.3`). -/
def SupercuspidalRep.twistByDet {d : ℕ} (π : SupercuspidalRep (ReductiveGroup.GL K d) k)
    (χ : Kˣ →* kˣ) : SupercuspidalRep (ReductiveGroup.GL K d) k := sorry

/-- The contragredient `π^∨` of a supercuspidal representation. -/
def SupercuspidalRep.contragredient {d : ℕ} (π : SupercuspidalRep (ReductiveGroup.GL K d) k) :
    SupercuspidalRep (ReductiveGroup.GL K d) k := sorry

/-- The inverse Rankin–Selberg (Jacquet–Piatetski-Shapiro–Shalika) local factor
`L(π × π′, T)⁻¹ ∈ 1 + T·k[T]`. -/
def SupercuspidalRep.pairInvLFactor {d d' : ℕ} (π : SupercuspidalRep (ReductiveGroup.GL K d) k)
    (π' : SupercuspidalRep (ReductiveGroup.GL K d') k) : Polynomial k := sorry

/-- The Rankin–Selberg local constant `ε(π × π′, ψ, T)`, a unit monomial in `k[T, T⁻¹]`. -/
def SupercuspidalRep.pairEpsilon {d d' : ℕ} (π : SupercuspidalRep (ReductiveGroup.GL K d) k)
    (π' : SupercuspidalRep (ReductiveGroup.GL K d') k) (ψ : AddChar K k) :
    LaurentPolynomial k := sorry

variable (K) in
/-- The selected globalisation data of LRS 15.10–15.11 for a supercuspidal `π` of `GL_d(K)`:
a curve `X/F_q`, places `o, o′, ∞, x₂, x₃` with an identification `F_o ≅ K`, a cuspidal `Π̃` with
`Π̃_o ≅ π`, `Π̃_∞ ≅ St`, supercuspidal at `o′, x₂`, the division algebra `D` with invariants
`±1/d` at `o, o′`, and its selected transfer `Π` (nodes `.../globalisation` and
`.../jacquet-langlands-transfer`), as an opaque carrier type. -/
def SelectedGlobalisation (ℓ : ℕ) [Fact ℓ.Prime] {d : ℕ}
    (π : SupercuspidalRep (ReductiveGroup.GL K d) (QlBar ℓ)) : Type u := sorry

/-- The semisimple restriction `Σ(Π)|_{W_K}` (via `F_o ≅ K`) of the selected global Galois
representation `Σ(Π) = V_Π^{d−1}((d−1)/2)` of `selectedIsotypicCohomology`. -/
def SelectedGlobalisation.localRestriction {ℓ : ℕ} [Fact ℓ.Prime] {d : ℕ}
    {π : SupercuspidalRep (ReductiveGroup.GL K d) (QlBar ℓ)} (g : SelectedGlobalisation K ℓ π) :
    WeilRep K (QlBar ℓ) d := sorry

variable (K) in
/-- The LRS correspondence `π ↦ σ_d(π) = Σ(Π)|_{W_K}` from supercuspidal representations of
`GL_d(K)` with finite-order central character to irreducible `d`-dimensional continuous
representations of `W_K` with finite-order determinant (well defined by
`localCorrespondenceIndependence`; LRS 15.14, Hausberger 9.2). -/
def lrsCorrespondence (ℓ : ℕ) [Fact ℓ.Prime] (d : ℕ) :
    {π : SupercuspidalRep (ReductiveGroup.GL K d) (QlBar ℓ) //
        IsOfFinOrder π.toIrr.centralCharacter} →
      {σ : IrrWeilRep K (QlBar ℓ) d // IsOfFinOrder σ.toWeilRep.det} := sorry

variable (K) in
/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-correspondence-independence`.
LRS 15.13–15.14. Let `K` be a local field of characteristic `p`, `ℓ ≠ p`, and `π` a supercuspidal
representation of `GL_d(K)` with finite-order central character. The restrictions
`Σ(Π)|_{W_K}` from any two selected globalisations are isomorphic (independent of curve,
auxiliary places and transfer); their determinant is `ω_π ∘ rec`; globalisations of `π^∨` and of
finite-order twists `π ⊗ χ∘det` give the contragredient and the twist by `χ ∘ rec`; and for
`π′` of `GL_{d′}(K)` with finite-order central character the Rankin–Selberg `L`- and
`ε`-factors equal the Galois tensor-product factors, for every nontrivial locally constant
additive character `ψ` (geometric reciprocity). The local-constant uniqueness input (Henniart
4.1/4.4/4.5) is a retained source gap. -/
theorem localCorrespondenceIndependence (p : ℕ) [Fact p.Prime] [CharP K p] (ℓ : ℕ)
    [Fact ℓ.Prime] (hℓ : ℓ ≠ p) (d : ℕ) (hd : 1 ≤ d)
    (π : SupercuspidalRep (ReductiveGroup.GL K d) (QlBar ℓ))
    (hπ : IsOfFinOrder π.toIrr.centralCharacter) :
    (∀ g g' : SelectedGlobalisation K ℓ π, g.localRestriction = g'.localRestriction) ∧
    (∀ g : SelectedGlobalisation K ℓ π,
      g.localRestriction.det = π.toIrr.centralCharacter.comp (localReciprocity K)) ∧
    (∀ (g : SelectedGlobalisation K ℓ π) (h : SelectedGlobalisation K ℓ π.contragredient),
      h.localRestriction = g.localRestriction.dual) ∧
    (∀ χ : Kˣ →* (QlBar ℓ)ˣ, IsOfFinOrder χ → IsLocallyConstant χ →
      ∀ (g : SelectedGlobalisation K ℓ π) (h : SelectedGlobalisation K ℓ (π.twistByDet χ)),
        h.localRestriction = g.localRestriction.twist (χ.comp (localReciprocity K))) ∧
    (∀ (d' : ℕ), 1 ≤ d' → ∀ π' : SupercuspidalRep (ReductiveGroup.GL K d') (QlBar ℓ),
      IsOfFinOrder π'.toIrr.centralCharacter →
      ∀ (g : SelectedGlobalisation K ℓ π) (g' : SelectedGlobalisation K ℓ π'),
        g.localRestriction.pairInvLFactor g'.localRestriction = π.pairInvLFactor π' ∧
        ∀ ψ : AddChar K (QlBar ℓ), ψ ≠ 1 → IsLocallyConstant ⇑ψ →
          g.localRestriction.pairEpsilon g'.localRestriction ψ = π.pairEpsilon π' ψ) := by
  sorry

variable (K) in
/-- Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/classical-local-correspondence`.
LRS 15.14–15.20 and Hausberger 9.2. For a local field `K` of characteristic `p` and `ℓ ≠ p`, the
selected construction `σ_d = lrsCorrespondence` is a BIJECTION between supercuspidal
representations of `GL_d(K)` with finite-order central character and irreducible `d`-dimensional
continuous `W_K`-representations with finite-order determinant; it equals `Σ(Π)|_{W_K}` for every
selected globalisation, takes central characters to determinants (`det σ_d(π) = ω_π ∘ rec`), and
preserves finite-order twists, contragredients and Rankin–Selberg/tensor-product pair `L`- and
`ε`-factors. Surjectivity uses Henniart's numerical local Langlands theorem (LRS 15.17–15.20),
not the excursion parameter. Omitted: the extension to arbitrary central characters and all
irreducibles via the independently supplied twisting/segment classification. -/
theorem classicalLocalCorrespondence (p : ℕ) [Fact p.Prime] [CharP K p] (ℓ : ℕ) [Fact ℓ.Prime]
    (hℓ : ℓ ≠ p) (d : ℕ) (hd : 1 ≤ d) :
    Function.Bijective (lrsCorrespondence K ℓ d) ∧
    (∀ (π : {π : SupercuspidalRep (ReductiveGroup.GL K d) (QlBar ℓ) //
          IsOfFinOrder π.toIrr.centralCharacter})
        (g : SelectedGlobalisation K ℓ π.1),
      (lrsCorrespondence K ℓ d π).1.toWeilRep = g.localRestriction) ∧
    (∀ π : {π : SupercuspidalRep (ReductiveGroup.GL K d) (QlBar ℓ) //
          IsOfFinOrder π.toIrr.centralCharacter},
      (lrsCorrespondence K ℓ d π).1.toWeilRep.det =
        π.1.toIrr.centralCharacter.comp (localReciprocity K)) ∧
    (∀ (π : {π : SupercuspidalRep (ReductiveGroup.GL K d) (QlBar ℓ) //
          IsOfFinOrder π.toIrr.centralCharacter})
        (χ : Kˣ →* (QlBar ℓ)ˣ), IsOfFinOrder χ → IsLocallyConstant χ →
      ∀ h : IsOfFinOrder (π.1.twistByDet χ).toIrr.centralCharacter,
        (lrsCorrespondence K ℓ d ⟨π.1.twistByDet χ, h⟩).1.toWeilRep =
          (lrsCorrespondence K ℓ d π).1.toWeilRep.twist (χ.comp (localReciprocity K))) ∧
    (∀ (π : {π : SupercuspidalRep (ReductiveGroup.GL K d) (QlBar ℓ) //
          IsOfFinOrder π.toIrr.centralCharacter})
        (h : IsOfFinOrder π.1.contragredient.toIrr.centralCharacter),
      (lrsCorrespondence K ℓ d ⟨π.1.contragredient, h⟩).1.toWeilRep =
        (lrsCorrespondence K ℓ d π).1.toWeilRep.dual) ∧
    (∀ (d' : ℕ), 1 ≤ d' →
      ∀ (π : {π : SupercuspidalRep (ReductiveGroup.GL K d) (QlBar ℓ) //
            IsOfFinOrder π.toIrr.centralCharacter})
        (π' : {π' : SupercuspidalRep (ReductiveGroup.GL K d') (QlBar ℓ) //
            IsOfFinOrder π'.toIrr.centralCharacter}),
        (lrsCorrespondence K ℓ d π).1.toWeilRep.pairInvLFactor
            (lrsCorrespondence K ℓ d' π').1.toWeilRep = π.1.pairInvLFactor π'.1 ∧
        ∀ ψ : AddChar K (QlBar ℓ), ψ ≠ 1 → IsLocallyConstant ⇑ψ →
          (lrsCorrespondence K ℓ d π).1.toWeilRep.pairEpsilon
              (lrsCorrespondence K ℓ d' π').1.toWeilRep ψ = π.1.pairEpsilon π'.1 ψ) := by
  sorry

end LocalCorrespondence

end TauCeti.Blueprint.Excursion.ES7
