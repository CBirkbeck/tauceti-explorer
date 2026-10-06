import Mathlib.AlgebraicGeometry.AffineSpace
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.FinitePresentation
import Mathlib.AlgebraicGeometry.Morphisms.OpenImmersion
import Mathlib.AlgebraicGeometry.Morphisms.SchemeTheoreticallyDominant
import Mathlib.AlgebraicGeometry.IdealSheaf.Subscheme
import Mathlib.AlgebraicGeometry.AffineTransitionLimit
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.CategoryTheory.Filtered.Basic
import Mathlib.CategoryTheory.Adjunction.Mates

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/AdicCoefficientsAndComparisons.md is definitive.
These signatures suggest Lean forms so contributors and reviewers can converge
on names and signatures. They claim no implementation; all proofs are placeholders.

Namespace prefixes below are suggested, not upstream library APIs. Native Scheme,
its proper/open/lfp predicates and its scheme-theoretic image are reused. In
particular, the ordinary compactification does not include a density hypothesis.

The inventory at the end records signatures that cannot be stated honestly at
this baseline. No fake enhanced category, coefficient-completeness predicate,
cycle-class field or scheme/diamond comparison is substituted for a missing type.
-/

noncomputable section
open CategoryTheory CategoryTheory.Limits AlgebraicGeometry
universe u
namespace TauCeti.AdicCoefficientsAndComparisons

/-! Native API names (relative to this file’s namespace).
Compactification.mk
Compactification.ambient
Compactification.open
Compactification.properMap
Compactification.iso
Compactification.image
FPCompactification.mk
FPCompactification.forget
FPCompactification.baseChange
FPCompactification.finitePresentation
Compactification.Hom.mk
Compactification.Hom.map
Compactification.Hom.ext
Compactification.Hom.strict_iff
Compactification.Hom.strict_comp
Compactification.Hom.strict_baseChange
Compactification.category
FPCompactification.inclusion
Compactification.baseChange
Compactification.isomorphism
-/

/-- L2/compactification, ordinary finite-type compactifications with no density condition. -/
structure Compactification {Y X : Scheme.{u}} (f : Y ⟶ X) where
  ambient : Scheme.{u}
  «open» : Y ⟶ ambient
  properMap : ambient ⟶ X
  openImmersion : IsOpenImmersion «open»
  quasiCompact : QuasiCompact «open»
  proper : IsProper properMap
  factorisation : «open» ≫ properMap = f

attribute [instance] Compactification.openImmersion Compactification.quasiCompact
  Compactification.proper

namespace Compactification
variable {Y X : Scheme.{u}} {f : Y ⟶ X}

-- Compactification.mk, .ambient, .open and .properMap are structure declarations.
def iso (C : Compactification f) {Z : Scheme.{u}} (e : C.ambient ≅ Z) :
    Compactification f := by sorry

lemma iso_ambient (C : Compactification f) {Z : Scheme.{u}} (e : C.ambient ≅ Z) :
    (C.iso e).ambient = Z := by sorry

def image (C : Compactification f) : Compactification f := by sorry

lemma image_ambient (C : Compactification f) :
    C.image.ambient = C.«open».image := by sorry

lemma image_dense (C : Compactification f) :
    IsSchemeTheoreticallyDominant C.image.«open» := by sorry

def ofProper (f : Y ⟶ X) [IsProper f] : Compactification f := by sorry

-- Compactification.proper: the same native proper map and identity open.
example (f : Y ⟶ X) [IsProper f] :
    ∃ e : (ofProper f).ambient ≅ Y, (ofProper f).«open» ≫ e.hom = 𝟙 Y := by sorry

-- Compactification.empty: allows arbitrary proper boundary, as well as empty.
example (f : Y ⟶ X) [IsEmpty Y] : Nonempty (Compactification f) := by sorry

/-- A compactification with an entire extra proper component. -/
def double (Y : Scheme.{u}) : Compactification (𝟙 Y) := by sorry

lemma double_ambient (Y : Scheme.{u}) :
    (double Y).ambient = coprod Y Y := by sorry

-- Compactification.extraComponent: a density condition would reject this object.
example (Y : Scheme.{u}) [Nonempty Y] :
    ¬ DenseRange (double Y).«open» := by sorry

-- Compactification.nonproper, concrete affine-line counterexample.
example (k : Type u) [Field k] :
    ¬ IsProper (AffineSpace (ULift.{u} (Fin 1)) (Spec (CommRingCat.of k)) ↘
      Spec (CommRingCat.of k)) := by sorry

-- General rejection criterion corresponding to that non-example.
example (f : Y ⟶ X) (h : ¬ IsProper f) (C : Compactification f)
    (e : C.ambient ≅ Y) (hj : C.«open» ≫ e.hom = 𝟙 Y) : False := by sorry

/-- L2/compactification-morphism: all arrows, including nonstrict ones. -/
structure Hom (C D : Compactification f) where
  map : C.ambient ⟶ D.ambient
  open_comm : C.«open» ≫ map = D.«open»
  base_comm : map ≫ D.properMap = C.properMap

-- Compactification.Hom.mk and .map are the constructor and projection.
instance category : Category (Compactification f) where
  Hom C D := Hom C D
  id C := by sorry
  comp a b := by sorry
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry

namespace Hom
variable {C D E : Compactification f}

lemma ext (a b : C ⟶ D) : a = b ↔ a.map = b.map := by sorry

/-- This is an actual predicate on native scheme maps, not an opaque Prop field. -/
def strict (g : C ⟶ D) : Prop :=
  g.map ⁻¹' Set.range D.«open» = Set.range C.«open»

lemma strict_iff (g : C ⟶ D) :
    strict g ↔ g.map ⁻¹' Set.range D.«open» = Set.range C.«open» := by sorry

lemma strict_comp (g : C ⟶ D) (h : D ⟶ E)
    (hg : strict g) (hh : strict h) : strict (g ≫ h) := by sorry

-- Compactification.Hom.identity.
example (C : Compactification f) : strict (𝟙 C) := by sorry

-- Compactification.Hom.empty.
example [IsEmpty Y] (g : C ⟶ D) : strict g := by sorry

end Hom

def fold (Y : Scheme.{u}) : double Y ⟶ ofProper (𝟙 Y) := by sorry

-- Compactification.Hom.boundary: folding the extra component is nonstrict.
example (Y : Scheme.{u}) [Nonempty Y] : ¬ Hom.strict (fold Y) := by sorry

/-- Both ambient components go to the first component; the open stays fixed. -/
def collapse (Y : Scheme.{u}) : double Y ⟶ double Y := by sorry

-- Compactification.parallelMaps: the ordinary category retains distinct arrows.
example (Y : Scheme.{u}) [Nonempty Y] :
    collapse Y ≠ 𝟙 (double Y) := by sorry

-- Compactification.category_id.
example {C D : Compactification f} (g : C ⟶ D) :
    𝟙 C ≫ g = g ∧ g ≫ 𝟙 D = g := by sorry

-- Compactification.category_empty: additional proper ambients are retained.
example [IsEmpty Y] (Z : Scheme.{u}) (p : Z ⟶ X) [IsProper p] :
    ∃ C : Compactification f, Nonempty (C.ambient ≅ Z) := by sorry

lemma isomorphism {C D : Compactification f} (g : C ⟶ D) :
    IsIso g ↔ IsIso g.map := by sorry

/-- Native pullbacks, with no second scheme carrier. -/
def baseChange {X' : Scheme.{u}} (g : X' ⟶ X) :
    Compactification f ⥤ Compactification (pullback.snd f g) := by sorry

lemma baseChange_ambient {X' : Scheme.{u}} (g : X' ⟶ X) (C : Compactification f) :
    Nonempty (((baseChange g).obj C).ambient ≅ pullback C.properMap g) := by sorry

lemma Hom.strict_baseChange {C D : Compactification f} (h : C ⟶ D)
    {X' : Scheme.{u}} (g : X' ⟶ X) (hh : Hom.strict h) :
    Hom.strict ((baseChange g).map h) := by sorry

-- Compactification.Hom.baseChange.
example {C D : Compactification f} (h : C ⟶ D) {X' : Scheme.{u}}
    (g : X' ⟶ X) (hh : Hom.strict h) :
    ((baseChange g).map h).map ⁻¹'
      Set.range ((baseChange g).obj D).«open» =
      Set.range ((baseChange g).obj C).«open» := by sorry

end Compactification

/-- L2/fp-compactification: the native full subcategory, with proper giving qc/qs. -/
def fpProperty {Y X : Scheme.{u}} (f : Y ⟶ X) :
    ObjectProperty (Compactification f) :=
  fun C => LocallyOfFinitePresentation C.properMap

abbrev FPCompactification {Y X : Scheme.{u}} (f : Y ⟶ X) :=
  (fpProperty f).FullSubcategory

namespace FPCompactification
variable {Y X : Scheme.{u}} {f : Y ⟶ X}

def mk (C : Compactification f) (h : LocallyOfFinitePresentation C.properMap) :
    FPCompactification f := ⟨C, h⟩

def forget (C : FPCompactification f) : Compactification f := C.obj

lemma finitePresentation (C : FPCompactification f) :
    QuasiCompact C.obj.properMap ∧ QuasiSeparated C.obj.properMap ∧
      LocallyOfFinitePresentation C.obj.properMap := by sorry

def inclusion : FPCompactification f ⥤ Compactification f :=
  (fpProperty f).ι

def inclusion_fullyFaithful : (inclusion (f := f)).FullyFaithful := by sorry

def baseChange {X' : Scheme.{u}} (g : X' ⟶ X) :
    FPCompactification f ⥤ FPCompactification (pullback.snd f g) := by sorry

-- FPCompactification.proper.
example (f : Y ⟶ X) [IsProper f] [LocallyOfFinitePresentation f] :
    ∃ C : FPCompactification f, Nonempty (C.obj.ambient ≅ Y) := by sorry

-- FPCompactification.empty.
example (f : Y ⟶ X) [IsEmpty Y] : Nonempty (FPCompactification f) := by sorry

-- FPCompactification.basePoint: the proper/lfp assertions for the P¹ base change.
example (C : FPCompactification f) {X' : Scheme.{u}} (g : X' ⟶ X) :
    IsProper ((baseChange g).obj C).obj.properMap ∧
      LocallyOfFinitePresentation ((baseChange g).obj C).obj.properMap := by sorry

-- FPCompactification.rejectFiniteType: a non-fg quotient ideal blocks fp.
example {A : CommRingCat.{u}} (J : Ideal A) (hJ : ¬ J.FG) :
    ¬ LocallyOfFinitePresentation (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk J))) :=
  by sorry

-- Compactification.fpForget: the native full inclusion preserves composition.
example {C D E : FPCompactification f} (g : C ⟶ D) (h : D ⟶ E) :
    (inclusion.map (g ≫ h)).map = (inclusion.map g).map ≫ (inclusion.map h).map :=
  by sorry
end FPCompactification

/-- L2/affine-transition-limit-existence: existing API assumes a given limit. -/
theorem affineTransitionLimit {I : Type u} [Category.{u} I] [IsCofiltered I]
    (D : I ⥤ Scheme.{u}) [∀ {i j} (g : i ⟶ j), IsAffineHom (D.map g)] :
    Nonempty (LimitCone D) := by sorry

/-- L2/nagata-factorisation-as-used-in-27-4, the non-fp finite-type range. -/
theorem nagata {Y X : Scheme.{u}} (f : Y ⟶ X) [CompactSpace X]
    [QuasiSeparatedSpace X] [IsSeparated f] [LocallyOfFiniteType f]
    [QuasiCompact f] : Nonempty (Compactification f) := by sorry

/-- L2/strict-from-dense: topological density suffices for strictness. -/
theorem strictFromDense {Y X : Scheme.{u}} {f : Y ⟶ X}
    {C D : Compactification f} (g : C ⟶ D) (hd : DenseRange C.«open») :
    Compactification.Hom.strict g := by sorry

/-- L2/compactification-cofiltered: includes parallel-arrow equalisation. -/
theorem compactificationCofiltered {Y X : Scheme.{u}} (f : Y ⟶ X)
    [CompactSpace X] [QuasiSeparatedSpace X] (h : Nonempty (Compactification f)) :
    IsCofiltered (Compactification f) := by sorry

/-- The equaliser test is explicit, including a strict refinement arrow. -/
example {Y X : Scheme.{u}} {f : Y ⟶ X} [CompactSpace X] [QuasiSeparatedSpace X]
    {C D : Compactification f} (a b : C ⟶ D) :
    ∃ (E : Compactification f) (g : E ⟶ C),
      Compactification.Hom.strict g ∧ g ≫ a = g ≫ b := by sorry

/-- L2/fp-strict-cofiltered, descended to a noetherian model before equalising. -/
theorem fpStrictCofiltered {Y X : Scheme.{u}} (f : Y ⟶ X) [CompactSpace X]
    [QuasiSeparatedSpace X] [IsSeparated f] [LocallyOfFinitePresentation f]
    [QuasiCompact f] [QuasiSeparated f] : IsCofiltered (FPCompactification f) :=
  by sorry

example {Y X : Scheme.{u}} {f : Y ⟶ X} [CompactSpace X] [QuasiSeparatedSpace X]
    [IsSeparated f] [LocallyOfFinitePresentation f] [QuasiCompact f] [QuasiSeparated f]
    {C D : FPCompactification f} (a b : C ⟶ D) :
    ∃ (E : FPCompactification f) (g : E ⟶ C),
      Compactification.Hom.strict (FPCompactification.inclusion.map g) ∧
      g ≫ a = g ≫ b := by sorry

/-- Ordinary categorical prototype of the 27.3(ii) adjoint identity.
It does not pretend that these abstract categories are enhanced sheaf categories. -/
def rightAdjointIdentity {CX CY DX DY : Type*}
    [Category CX] [Category CY] [Category DX] [Category DY]
    (cX : CX ⥤ DX) (cY : CY ⥤ DY) (rX : DX ⥤ CX) (rY : DY ⥤ CY)
    (pullS : CX ⥤ CY) (pushS : CY ⥤ CX)
    (pullD : DX ⥤ DY) (pushD : DY ⥤ DX)
    (adjX : cX ⊣ rX) (adjY : cY ⊣ rY)
    (adjS : pullS ⊣ pushS) (adjD : pullD ⊣ pushD)
    (commute : cX ⋙ pullD ≅ pullS ⋙ cY) :
    rY ⋙ pushS ≅ pushD ⋙ rX := by sorry

end TauCeti.AdicCoefficientsAndComparisons

/-! Unavailable-signature inventory (G-enhancement, G-support and supplier requests).
Every item below is mathematical planning text, not an elaborated declaration.
The corresponding category/site, sheaf tensor/completion, adic-space geometry,
coherent derived limit, blow-up or locally-free-sheaf carrier is not supplied
by the pinned imports. Protocol §13 requires leaving unstated conditions out.
For each definition, API and example, replace this inventory only after the
genuine supplier type can state its hypotheses. A commented name is not an
implementation or a compiled signature.

NODE AdicCoefficientsAndComparisons:L0/derived-I-complete-etale-category [definition]
Dét,adic(Y,Λ) is the full enhanced subcategory of D(Yv,Λ) on derived I-complete A whose derived
reduction A⊗ΛΛ/I is in the discrete étale subcategory. Derived completeness uses the imported
completion functor, not completeness of individual cohomology modules alone. The coefficient
unit is the completed constant coefficient object, not an unverified identification with the
discrete constant Λ-sheaf.
API AdicEtale.ofComplete [constructor]
From A, a derived-completeness witness and an étale-reduction witness, construct the
corresponding object.
API AdicEtale.forget [coercion]
Fully faithful inclusion into enhanced D(Yv,Λ).
API AdicEtale.mem_iff [characterisation]
Membership is precisely the conjunction of the two stated object properties.
API AdicEtale.reduce [functoriality]
For n≥1, derived reduction to Λ/Iⁿ lands in the discrete étale category.
API AdicEtale.ext [extensionality]
Two morphisms are equal iff their images in D(Yv,Λ) are equal.
API AdicEtale.discrete_zeroIdeal [compatibility]
For I=0 and Λ killed by an integer prime to p, identify with the supplied discrete category
through the same inclusion.
EXAMPLE AdicEtale.point
At a geometric point with Λ=Zℓ, I=(ℓ), the constant lattice Λ[0] is admitted and reduces to
Z/ℓⁿ.
EXAMPLE AdicEtale.torsion
The constant Z/ℓ complex is admitted: derived ℓ-completeness does not mean torsion freeness.
EXAMPLE AdicEtale.reject_inverted
The nonzero constant Qℓ object in ambient D(Yv,Zℓ) is not derived ℓ-complete; derived completion
sends it to zero.
EXAMPLE AdicEtale.empty
For Y empty the category has only the zero object up to equivalence.

NODE AdicCoefficientsAndComparisons:L0/adic-coefficient-limit [theorem]
Reduction induces an equivalence of PRESENTABLE STABLE enhanced categories Dét,adic(Y,Λ) ≃ limₙ
Dét(Y,Λ/Iⁿ), with coherent derived base-change identifications at consecutive levels. Its
homotopy category is the category in Definition 26.1.

NODE AdicCoefficientsAndComparisons:L0/completed-tensor-and-colimits [construction]
On Dét,adic(Y,Λ), A⊗̂B=CompI(A⊗ᴸΛB) and colimadic Aα=CompI(colimambient Aα). The unit is
CompI(Λconstant); internal RHom is the right adjoint of completed tensor. The inclusion
generally fails to preserve colimits.
API AdicEtale.tensor [structure]
Closed symmetric monoidal completed tensor with unit Λ.
API AdicEtale.colimit [universal-property]
Mapping out of the completed ambient colimit into a complete object satisfies the enhanced
colimit universal property.
API AdicEtale.tensor_reduce [compatibility]
Reduction of completed tensor is the derived tensor of reductions over Λ/Iⁿ.
API AdicEtale.internalHom [universal-property]
Map(A⊗̂B,C)≃Map(A,RHom(B,C)) in enhanced mapping spaces.
API AdicEtale.unit_tensor [simp]
CompI(Λconstant)⊗̂A≃A.
EXAMPLE AdicEtale.tensor_point
For Zℓ at a point, Z/ℓ⊗ᴸZℓ Z/ℓ has a nonzero Tor term in degree −1; it is not ordinary tensor
alone.
EXAMPLE AdicEtale.telescope
The completed colimit Zℓ --ℓ→ Zℓ --ℓ→ ... is zero, although its ambient colimit is Qℓ.
EXAMPLE AdicEtale.empty_colimit
The empty completed colimit is zero.
EXAMPLE AdicEtale.unit
Zℓ⊗̂Zℓ≃Zℓ at a point.

NODE AdicCoefficientsAndComparisons:L0/six-operations-for-adic-coefficients [construction]
For arbitrary f:Y′→Y, restriction gives f*, with right adjoint Rf*. For compactifiable f
representable in locally spatial diamonds and locally finite dim.trg, coherent levelwise Rf!
gives Rf!:Dét,adic(Y′,Λ)→Dét,adic(Y,Λ), with right adjoint f!. Tensor and internal Hom are those
of the preceding node. All six operations have the coefficient-change identifications of Remark
26.3.
API AdicSix.pullback [functoriality]
Coherent f* for all small v-stack maps, identity and composition.
API AdicSix.pushAdjunction [universal-property]
f* ⊣ Rf*.
API AdicSix.support [constructor]
Given geometric eligibility, coherent Rf! specialising to extension by zero for opens and Rf*
for proper maps.
API AdicSix.shriekAdjunction [universal-property]
Rf! ⊣ f!.
API AdicSix.reduce [compatibility]
All six operations agree after Λ/Iⁿ reduction with the supplied discrete operations; identify
the canonical comparison.
API AdicSix.baseChange [compatibility]
Base-change transformations and projection formulas are inherited by reduction, with their
original geometric hypotheses.
EXAMPLE AdicSix.identity
For idY, all four functors and all adjunction units/counits are identity up to the specified
coherent equivalence.
EXAMPLE AdicSix.empty_open
Extension by zero from the empty open is the zero functor.
EXAMPLE AdicSix.open_boundary
For j:U↪Y and a geometric point outside U, (j!Λ) has zero stalk; j* direct image need not.
EXAMPLE AdicSix.proper
For a finite proper disjoint union of two geometric points over one, Rf!Λ=Rf*Λ=Λ⊕Λ.

NODE AdicCoefficientsAndComparisons:L0/reduction-detects-equivalences [theorem]
For a map between derived I-complete objects, reduction modulo I is an equivalence iff the map
is an equivalence. For exact enhanced Λ-linear operations with the coherent scalar-change data
of the E4 supplier, perfect reduction and the filtration of Iⁿ identify all finite-level
operations, including right adjoints.

NODE AdicCoefficientsAndComparisons:L0/rational-constructible-coefficients [construction]
For ℓ≠p, define the rational lattice category as the scalar localisation Dcons(X,Zℓ)[1/ℓ]:
objects are integral constructible complexes, with Hom tensored with Qℓ, and coherent
localisation of composition. Over topologically noetherian schemes in BS §6.8 this is equivalent
to the supplied constructible Qℓ category. No equivalence with arbitrary Qℓ sheaves on a general
v-stack is asserted.
API RationalLattice.localise [constructor]
Integral constructible complexes map into the rational lattice category.
API RationalLattice.hom [characterisation]
Hom(A,B)=Homint(A,B)⊗Zℓ Qℓ with localised composition.
API RationalLattice.invert [simp]
Multiplication by ℓ on each localised object is invertible.
API RationalLattice.universal [universal-property]
Λ-linear enhanced functors inverting ℓ factor through the scalar localisation.
API RationalLattice.schemeComparison [equivalence]
Under BS §6.8 hypotheses compare with constructible Qℓ complexes; the integral lattice realises
this functor.
EXAMPLE RationalLattice.point
At a geometric point, the localised rank-one lattice has endomorphism ring Qℓ, not zero.
EXAMPLE RationalLattice.torsion
An integral constructible complex killed by a power of ℓ becomes zero.
EXAMPLE RationalLattice.zero
The zero integral complex remains zero.
EXAMPLE RationalLattice.isogeny
Multiplication by ℓ on the rank-one lattice becomes an isomorphism.

NODE AdicCoefficientsAndComparisons:L1/char-p-scheme-diamond-and-comparison-functor [construction]
For a characteristic-p scheme X, construct X◇ as the v-sheaf of maps from perfectoid S to the
adic avatar of X. On Spec R use the discrete pair (R,R⁺), R⁺ the integral closure of Fp in R;
glue along scheme opens. It factors through perfection. This construction makes no local finite-
type hypothesis.
API SchemeDiamond.charP [constructor]
Functor from characteristic-p schemes to small v-sheaves.
API SchemeDiamond.charP_points [characterisation]
On perfectoid S, sections are precisely adic maps S→Xad with the stated plus ring.
API SchemeDiamond.charP_open [compatibility]
Scheme open immersion induces the corresponding open v-sheaf immersion.
API SchemeDiamond.charP_perfection [equivalence]
Xperf◇≃X◇, naturally in X.
API SchemeDiamond.charP_functor [functoriality]
Identity and composition with coherent gluing.
API SchemeDiamond.charP_spa [compatibility]
Affine chart uses native TauCeti.ValuationSpectrum.spa for the discrete pair (R,R⁺).
EXAMPLE SchemeDiamond.Fp
Spec Fp maps to Spd(Fp,Fp).
EXAMPLE SchemeDiamond.plusRing
For a perfect field k extending Fp, the chart uses k⁺=integral closure of Fp; it must not
silently use k.
EXAMPLE SchemeDiamond.empty
The empty scheme gives the empty v-sheaf.
EXAMPLE SchemeDiamond.frobenius
Frobenius induces an isomorphism on X◇ even if X was not perfect.

NODE AdicCoefficientsAndComparisons:L1/scheme-adic-category [definition]
Dét,adic(X,Λ) is the full enhanced subcategory of D(Xproét,Λ) consisting of derived I-complete A
for which A⊗ᴸΛΛ/I belongs to the LEFT-COMPLETED étale essential image D̂(Xét,Λ/I). Equivalently,
the reduction has classical étale cohomology sheaves. Replace D̂ by ordinary D only under a
verified left-completeness hypothesis.
API SchemeAdic.ofComplete [constructor]
Embed a derived-complete pro-étale complex with classical étale reduction cohomology.
API SchemeAdic.forget [coercion]
Fully faithful inclusion into enhanced D(Xproét,Λ).
API SchemeAdic.reduce [functoriality]
Reduction to Λ/Iⁿ belongs to the left-completed étale category.
API SchemeAdic.boundedBelow [compatibility]
Bounded-below étale complexes agree with their pro-étale pullbacks under BS 5.2.6.
API SchemeAdic.leftComplete [equivalence]
If the étale derived category is left complete, use ordinary étale complexes in the reduction
condition.
API SchemeAdic.ext [extensionality]
Equality of morphisms is detected by the pro-étale inclusion.
EXAMPLE SchemeAdic.geometricPoint
At an algebraically closed point with Zℓ, the constant lattice belongs and its reductions are
the classical étale constants.
EXAMPLE SchemeAdic.zeroIdeal
For I=0 and prime-to-p torsion Λ, the category is the left-completed étale essential image, not
all pro-étale complexes.
EXAMPLE SchemeAdic.reject_inverted
The ambient nonzero Qℓ constant is excluded for Λ=Zℓ,I=(ℓ).
EXAMPLE SchemeAdic.empty
Over the empty scheme all objects are zero.

NODE AdicCoefficientsAndComparisons:L1/comparison-pullback [construction]
The natural morphism cX:X◇v→Xét for discrete coefficients, and cX:X◇v→Xproét for adic
coefficients, induces derived pullback cX*. In the adic case use completed pullback into
Dét,adic(X◇,Λ); its source is the scheme adic category. The same construction for O-schemes uses
the mixed-characteristic diamond below.
API SchemeComparison.pullback [constructor]
Derived cX* on the specified source category.
API SchemeComparison.reduce [compatibility]
cX* commutes with Λ/Iⁿ reduction by the canonical coherent map.
API SchemeComparison.stalk [characterisation]
At a geometric perfectoid point, identify pullback with the corresponding scheme geometric
stalk.
API SchemeComparison.unit [simp]
cX* of the coefficient unit is the coefficient unit.
API SchemeComparison.colimit [functoriality]
Preserves the completed enhanced colimits, yielding a right adjoint.
EXAMPLE SchemeComparison.point
At a geometric point finite torsion constants pull back to the same coefficient complex.
EXAMPLE SchemeComparison.zero
cX*0=0.
EXAMPLE SchemeComparison.openSupport
The pullback of a sheaf extended by zero from a scheme open has zero stalks outside the
corresponding diamond open.
EXAMPLE SchemeComparison.adic
The pulled-back Zℓ lattice has reductions Z/ℓⁿ; the operation uses derived completion.

NODE AdicCoefficientsAndComparisons:L1/mixed-characteristic-scheme-diamond [construction]
Fix a complete DVR O with perfect residue field k of characteristic p. For X locally of finite
type over O, X◇(S) consists of an untilt S♯ over Spa(O,O) and an O-linear locally ringed-space
map S♯→X. This gives a diamond over Spd O, naturally in X. For Spec k it gives Spd(k,k), which
differs from the characteristic-p convention when k⁺≠k.
API SchemeDiamond.overDVR [constructor]
Functor from locally finite-type O-schemes to diamonds over Spd O.
API SchemeDiamond.overDVR_points [characterisation]
Sections are the untilt/mapping pairs in the statement.
API SchemeDiamond.overDVR_functor [functoriality]
Composition, identity and gluing along opens.
API SchemeDiamond.overDVR_closedFibre [compatibility]
The residue point is Spd(k,k).
API SchemeDiamond.overDVR_generic [compatibility]
Generic fibre agrees with the analytic generic-fibre diamond where that avatar exists.
API SchemeDiamond.overDVR_empty [simp]
Empty scheme maps to empty diamond.
EXAMPLE SchemeDiamond.residue
Spec k gives Spd(k,k), retaining k as the plus ring.
EXAMPLE SchemeDiamond.base
Spec O gives Spd(O,O), with structural morphism identity.
EXAMPLE SchemeDiamond.emptyDVR
Empty O-scheme gives empty diamond.
EXAMPLE SchemeDiamond.nonagreement
For perfect k with elements transcendental over Fp, k⁺ is a proper subring: the two residue-
point conventions cannot be asserted equal.

NODE AdicCoefficientsAndComparisons:L3/full-faithfulness-27-2 [theorem]
For any characteristic-p scheme X and regular adic coefficients as in L0 (or discrete Λ killed
by an integer prime to p), cX*:Dét(X,Λ)→Dét(X◇,Λ) is fully faithful, with right adjoint RcX*.
The scheme category is left-completed in the unbounded discrete case.

NODE AdicCoefficientsAndComparisons:L3/rf-shriek-comparison-27-4 [theorem]
For separated finite-type f:Y→X of qcqs characteristic-p schemes, or the perfection of such a
map, f◇ is compactifiable, representable in locally spatial diamonds, and locally finite in
dim.trg. The canonical map cX*Rf!→Rf◇!cY* is an equivalence. Its right-adjoint mate is
f!RcX*≃RcY*(f◇)!.

NODE AdicCoefficientsAndComparisons:L4/proper-support-comparison-27-5 [theorem]
For separated f:Y→X between schemes finite type over a complete DVR O with perfect residue
characteristic p, f◇ has the support eligibility of L0 and cX*Rf!≃Rf◇!cY*. Consequently
f!RcX*≃RcY*(f◇)!. No full faithfulness on arbitrary nonconstructible mixed-characteristic
complexes is asserted.

NODE AdicCoefficientsAndComparisons:L5/normal-crossing-local-comparison [theorem]
Let X be smooth over a perfect field of residue characteristic p, or a characteristic-zero
generic field, D a strict normal-crossing divisor with smooth strata and j:X\D↪X. For finite
prime-to-p coefficients Λ, the canonical comparison for Rj* is an equivalence after passage to
the L4 analytic test space. In a strict henselian chart with r boundary parameters, the tame
constant-coefficient calculation is the exterior algebra on r Kummer generators Λ(−1) in degree
1; compare generators and residues, not just ranks.

NODE AdicCoefficientsAndComparisons:L6/constructible-direct-image-comparison-27-6 [theorem]
For separated f:Y→X between schemes finite type over O, and a finite ring Λ killed by an integer
prime to p, the canonical map cX*Rf*A→Rf◇*cY*A is an equivalence for A in Dᵇc(Yét,Λ).
Constructible means bounded with finite locally constant cohomology on a finite constructible
stratification.

NODE AdicCoefficientsAndComparisons:L6/constructible-full-faithfulness-27-7 [theorem]
For X locally of finite type over O and finite Λ killed by an integer prime to p, the adjunction
unit A→RcX*cX*A is an equivalence for A∈Dᵇc(Xét,Λ). Thus cX* is fully faithful on this
subcategory. The prime-to-p restriction is explicit even though 27.7 abbreviates its coefficient
hypothesis to finite Λ.

NODE AdicCoefficientsAndComparisons:L2/noetherian-approximation [theorem]
Every qcqs scheme S is a directed inverse limit of schemes Si finite type over Z with affine
transitions, with affine projections S→Si. The presentation can be chosen with affine S→Si0;
finitely many finite-presentation objects and morphisms descend after increasing the index.

NODE AdicCoefficientsAndComparisons:L2/fp-relative-diagram-descent [theorem]
For a directed affine-transition inverse system of qcqs Si with limit S, the category of
finitely presented S-schemes is the filtered categorical colimit of the categories of finitely
presented Si-schemes. Objects descend, maps descend, and equality of descended maps holds at a
sufficiently large index. Finite diagrams and fp modules descend in the same sense.

NODE AdicCoefficientsAndComparisons:L2/compactification-property-descent [theorem]
In the relative fp descent situation, a descended open immersion becomes an open immersion at
some index; a descended finite-type morphism that is proper at the limit becomes proper at some
index. Applied to a compactification diagram, both properties and its commuting triangle hold at
a common stage.

NODE AdicCoefficientsAndComparisons:L2/finite-type-fp-factorisation [theorem]
If f:Y→X is finite type, X qcqs, there is a closed immersion Y→Y′ and a finitely presented Y′→X.
If f is separated, Y′→X can be chosen separated. This is the missing bridge from finite type to
the fp limit machinery.

NODE AdicCoefficientsAndComparisons:L2/fp-compactification-limit [theorem]
For a directed inverse system of qcqs Yi with affine transitions and a least base index 0, and
separated finitely presented X0→Y0, the natural functor colimᵢ Compfp(X0×Y0 Yi/Yi)→Compfp(X0×Y0
Y/Y) is an equivalence. It sends strict arrows to strict arrows, and a strict arrow at the limit
is strict after increasing the index.

NODE AdicCoefficientsAndComparisons:L2/cartier-boundary-cofinal [theorem]
Over a noetherian affine base S, for separated finite-type Y→S, compactifications whose
complement supports an effective Cartier divisor form an initial full subcategory of Comp(f).
Refinements to arbitrary compactifications may be chosen strict. The empty boundary is permitted
as the empty effective Cartier divisor.

NODE AdicCoefficientsAndComparisons:L2/vector-bundle-extension-cofinal [theorem]
Under BP §2.1.1 hypotheses, for finite locally free F on Y, compactifications to which F extends
as finite locally free form an initial full subcategory. Strict refinements exist to each
compactification. Rank is locally constant and may differ on different open-and-closed rank
pieces.

NODE AdicCoefficientsAndComparisons:L2/etale-cohomology-continuity [theorem]
Let Xi be a directed inverse system of qcqs schemes with affine transitions and limit X. For a
compatible system of abelian étale sheaves Fi with transition maps, set F=colimᵢ πi⁻¹Fi. Then
colimᵢ Hqét(Xi,Fi)≅Hqét(X,F) for every q≥0. A sheaf descended from a fixed stage is a special
case. For the system Gm,Xi, the sheaf colimit is Gm,X by its finite-presentation representing
scheme; the inverse-image maps πi⁻¹Gm,Xi→Gm,X need NOT be individually isomorphisms.

NODE AdicCoefficientsAndComparisons:L2/constructible-Hom-continuity [theorem]
For a small filtered affine-transition system of qcqs schemes Xα with limit X and a Noetherian
ring Λ, let Fα0∈D−c(Xα0,Λ), Gα0∈D+(Xα0,Λ). Then colimα Hom(Fα,Gα)→Hom(F,G) is an isomorphism,
likewise after shifts. The lemma itself imposes no invertibility or noetherianity on the
schemes.

NODE AdicCoefficientsAndComparisons:L2/constructible-derived-continuity [theorem]
For a small filtered affine-transition system of qcqs schemes Xα with limit X and a Noetherian
ring Λ, the natural functor 2-colimα Dᵇc(Xα,Λ)→Dᵇc(X,Λ) is an equivalence. Bounded constructible
complexes, maps and finite diagrams descend, and equality is eventual. No invertibility
assumption is in the lemma; no enhanced unbounded equivalence is asserted.

NODE AdicCoefficientsAndComparisons:L2/scheme-support-extension [construction]
Extend the EXISTING scheme étale proper-support carrier to separated finite-type maps between
qcqs schemes: for a compactification f=p∘j, Rf!=Rp*j!. On the supplied enhanced left-completed
torsion category with n invertible, use coherent compactification independence; regular adic
coefficients use the enhanced inverse limit. Provide the composition, arbitrary base-change and
projection-formula identifications with the classical noetherian formalism. Perfections in
characteristic p use universal-homeomorphism invariance.
API SchemeSupport.extend [constructor]
On the supplied category, extend the existing support functor to the stated qcqs maps.
API SchemeSupport.compactification [characterisation]
Rf!≃Rp*j! for each compactification, compatibly with refinements.
API SchemeSupport.open [simp]
For an open j, Rj! is the supplied extension by zero.
API SchemeSupport.proper [compatibility]
For proper f, Rf! agrees with the supplied Rf*.
API SchemeSupport.compose [functoriality]
R(g∘f)!≃Rg!Rf!, with identity and associativity coherence.
API SchemeSupport.baseChange [compatibility]
For a cartesian square the canonical pullback/support exchange is an equivalence with
coefficient and scheme hypotheses retained.
API SchemeSupport.projection [compatibility]
Rf!(A⊗f*B)≃Rf!A⊗B in the supplied tensor formalism.
API SchemeSupport.adic [compatibility]
Derived reduction identifies the adic support functor with each finite-level support functor.
EXAMPLE SchemeSupport.properPoint
For a finite two-point scheme over a geometric point, support pushforward equals direct image
and sends constants to Λ⊕Λ.
EXAMPLE SchemeSupport.openBoundary
For A¹\{0}↪A¹, extension by zero has zero stalk at 0.
EXAMPLE SchemeSupport.empty
The empty source induces the zero support functor.
EXAMPLE SchemeSupport.refinement
For two compactifications linked by a strict refinement, the two Rp*j! constructions agree by
the canonical proper-base-change map, not an arbitrary isomorphism.

NODE AdicCoefficientsAndComparisons:L1/plus-convention-comparison [theorem]
For a perfect field k over Fp with k⁺ the integral closure of Fp, the inclusion k⁺⊂k gives a
natural map Spd(k,k)→Spd(k,k⁺) between the mixed-characteristic residue avatar and the
characteristic-p scheme avatar. In the finite algebraic extension case k=k⁺ it is the identity.
It is not asserted to be an isomorphism for general k.

NODE AdicCoefficientsAndComparisons:L3/commutation-and-adjoints-27-1-27-3 [theorem]
The scheme comparison cX* is symmetric monoidal for the discrete derived tensor and for the adic
completed derived tensor. For every characteristic-p scheme map f:Y→X the canonical natural
transformation (f◇)*cX*≃cY*f* is an equivalence. The mixed-characteristic version satisfies the
same identities in its finite-type/local finite-type construction range.

NODE AdicCoefficientsAndComparisons:L3/internal-Hom-right-adjoint [theorem]
For A∈Dét(X,Λ) and B∈Dét(X◇,Λ), RcX* RHom(cX*A,B)≃RHom(A,RcX*B), naturally in both variables.
The right adjoint exists for cX* in both comparison constructions; the full-faithfulness theorem
is needed only in characteristic p.

NODE AdicCoefficientsAndComparisons:L3/pushforward-right-adjoint [theorem]
For scheme f:Y→X in either comparison range, Rf*RcY*≃RcX*Rf◇*, as the right-adjoint mate of
(f◇)*cX*≃cY*f*. This is not the direct-image comparison cX*Rf*≃Rf◇*cY*.

NODE AdicCoefficientsAndComparisons:L4/analytic-test-space [construction]
For O as in L1, give O[[x]] the (π,x)-adic topology, set T=D(x)⊂Spa(O[[x]],O[[x]]), and use the
structural T→Spa(O,O). T is analytic. Its diamond is surjective and ℓ-cohomologically smooth
over Spd O for ℓ≠p; hence pullback along T◇ is conservative and remains so after base change.
For X locally finite type over O, (X×Spec O T)◇≃X◇×Spd O T◇.
API DVRTestSpace.mk [constructor]
Construct T with its (π,x)-adic charts and map to Spa(O,O).
API DVRTestSpace.analytic [characterisation]
The local rings on D(x) have x invertible as a topologically nilpotent unit, hence the space is
analytic.
API DVRTestSpace.diamondCover [structure]
Surjective ℓ-cohomologically smooth T◇→Spd O with the supplier proof, ℓ≠p.
API DVRTestSpace.conservative [universal-property]
After any base change, pullback detects isomorphisms in the specified étale derived category.
API DVRTestSpace.fibreProduct [compatibility]
Identify the diamond of relative analytification with X◇×Spd O T◇, naturally in X.
EXAMPLE DVRTestSpace.base
For X=Spec O the fibre-product identification returns T◇ itself.
EXAMPLE DVRTestSpace.special
Over a residue perfectoid field choose a nonzero topologically nilpotent value for x; the cover
has a point above the special fibre.
EXAMPLE DVRTestSpace.generic
Over a generic untilt field take both π and x topologically nilpotent with x nonzero; a generic-
fibre lift exists.
EXAMPLE DVRTestSpace.zeroExcluded
The point with x=0 lies outside T, even though it lies in the ambient formal Spa.

NODE AdicCoefficientsAndComparisons:L5/alteration-hypercover-descent [theorem]
For finite prime-to-p Λ, form a proper hypercover of a finite-type scheme pair by recursively
applying the SF.4 alterations to matching objects. The pullback of étale complexes is an
enhanced cohomological descent equivalence to cartesian complexes on that proper hypercover. The
same descent is compatible with scheme/diamond comparison and detects the comparison on the
augmentation. An alteration degree divisible by ℓ is allowed.

NODE AdicCoefficientsAndComparisons:L5/semistable-boundary-induction [theorem]
For a proper strictly semistable O-model after a permitted finite trait extension, the
comparison for j:Xη↪X with constant finite prime-to-p coefficients is an equivalence. Use smooth
local charts and dimension induction to reduce its cone to finitely many closed-fibre points,
then use proper pushforward to the trait.

NODE AdicCoefficientsAndComparisons:L6/trait-open-comparison [theorem]
For j:Spec K↪Spec O, finite prime-to-p Λ and a finite continuous GK-module M, the comparison
cO*Rj*M→Rj◇*cK*M is an equivalence. At a geometric closed point sbar its two stalks identify
canonically with RΓ(IK,M), IK=Gal(Ksep/Ksh), with the residual Gk action; at geometric generic
points both give M. These identifications intertwine the comparison, transition maps and twists.

NODE AdicCoefficientsAndComparisons:L2/coefficient-and-unbounded-extension [theorem]
The qcqs support extension admits larger discrete coefficient rings killed by n prime to p,
bounded-below and enhanced left-completed unbounded complexes, and regular adic coefficients,
compatibly with the original finite noetherian construction. This statement requires a locally
uniform finite relative cohomological bound for proper models and coherent perfect scalar
change; it does not assume every module over the coefficient ring is finite.

Native signature refinements, not checked Lean declarations:
The native theorem signatures are fragments: affineTransitionLimit states existence but not its affine projections/open restriction/qcqs consequences; compactificationCofiltered and fpStrictCofiltered omit initiality/dense-subcategory and binary strict-refinement signatures. Compactification.baseChange is typed, while its identity/composition coherence and the cartesian reformulation of strictness remain named mathematical obligations in the packet.

FPCompactification.basePoint: the included generic base-change example verifies
properness and finite presentation only. The concrete P¹/A¹ chart over an
extended base field needs the supplied projective-space model.
RightAdjointIdentity above is an ordinary categorical prototype of 27.3(ii);
its genuine sheaf-category specialisation remains in the inventory.
-/
