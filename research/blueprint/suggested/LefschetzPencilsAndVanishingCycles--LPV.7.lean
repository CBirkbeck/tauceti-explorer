/-
Suggested Lean forms for LPV.7.

This file is not the roadmap and is not exhaustive. The reviewed mathematical
plan research/blueprint/packets/LefschetzPencilsAndVanishingCycles--LPV.7.json
is definitive; its independent report is
research/blueprint/reviews/REV-LefschetzPencilsAndVanishingCycles--LPV.7.md.
The reader document awaits synchronization with this reviewed packet. These
forms let contributors and reviewers converge on names and signatures. All nodes have implementationStatus unchecked.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The executable prototypes use actual Mathlib schemes, proper/smooth morphisms,
generic points, derived categories, linear maps, invariants and spectral objects.
There is no pinned constructible étale category or realization of its filtered
nearby complex. Each geometric declaration below identifies its omitted inputs.
The module-valued conclusions are signature shadows, not unrestricted theorems
about arbitrary maps. No missing premise is represented by a Prop-valued label.
The arithmetic-model structure retains real scheme maps and complex isomorphisms;
its arithmetic purity and henselization identification await the owners.

Test names occur in the docstrings of the corresponding `example` declarations.
Proofs are intentionally `sorry`; elaboration certifies types and names only.
-/

import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.OpenImmersion
import Mathlib.AlgebraicGeometry.Properties
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.Algebra.Homology.SpectralObject.SpectralSequence
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.LinearAlgebra.Quotient.Defs
import Mathlib.LinearAlgebra.BilinearForm.Basic
import Mathlib.RepresentationTheory.Invariants
import Mathlib.Data.Fin.VecNotation
import Mathlib.CategoryTheory.Limits.Shapes.Pullback.IsPullback.Defs

noncomputable section

namespace TauCeti.LPV7

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry

attribute [local instance] HasDerivedCategory.standard

section Normalization

variable {Λ V E : Type*} [CommRing Λ]

/-- The vertices/edges and branch functions are supplied by StableReduction;
this only realizes the normalization boundary on coefficients. -/
def normalizationDifferential (tail head : E → V) :
    (V → Λ) →ₗ[Λ] (E → Λ) where
  toFun a e := a (tail e) - a (head e)
  map_add' := by sorry
  map_smul' := by sorry

lemma normalizationDifferential_apply (tail head : E → V) (a : V → Λ) (e : E) :
    normalizationDifferential tail head a e = a (tail e) - a (head e) := by sorry

lemma normalizationDifferential_constant (tail head : E → V) (a : Λ) :
    normalizationDifferential tail head (fun _ => a) = 0 := by sorry

lemma normalizationDifferential_reverse (tail head : E → V) :
    normalizationDifferential (Λ := Λ) head tail = -normalizationDifferential tail head :=
  by sorry

/-- Compare to existing kernel/range/quotient objects, rather than a new graph carrier. -/
lemma normalizationDifferential_ker (tail head : E → V) :
    (∀ a, a ∈ LinearMap.ker (normalizationDifferential (Λ := Λ) tail head) ↔
      ∀ e, a (tail e) = a (head e)) ∧
    Function.Surjective (LinearMap.range (normalizationDifferential (Λ := Λ) tail head)).mkQ ∧
    LinearMap.ker (LinearMap.range (normalizationDifferential (Λ := Λ) tail head)).mkQ =
      LinearMap.range (normalizationDifferential (Λ := Λ) tail head) :=
  by sorry

/-- Test `TauCeti.LPV7.normalization_tree_test`: one edge, including the quotient. -/
example :
    (∀ a : Fin 2 → ℚ,
      normalizationDifferential (fun _ : Fin 1 => (0 : Fin 2)) (fun _ => 1) a 0 =
        a 0 - a 1) ∧
    LinearMap.range (normalizationDifferential (Λ := ℚ)
      (fun _ : Fin 1 => (0 : Fin 2)) (fun _ => 1)) = ⊤ := by sorry

/-- Test `TauCeti.LPV7.normalization_loop_test`: the edge quotient retains its coordinate. -/
example : normalizationDifferential (Λ := ℚ)
    (fun _ : Fin 1 => (0 : Fin 1)) (fun _ => 0) = 0 ∧
    Nonempty (((Fin 1 → ℚ) ⧸ LinearMap.range
      (normalizationDifferential (Λ := ℚ)
        (fun _ : Fin 1 => (0 : Fin 1)) (fun _ => 0))) ≃ₗ[ℚ] ℚ) := by sorry

/-- Test `TauCeti.LPV7.normalization_parallel_test`: parallel edges are not collapsed. -/
example :
    (∀ a : Fin 2 → ℚ,
      normalizationDifferential (fun _ : Fin 2 => (0 : Fin 2)) (fun _ => 1) a =
        ![a 0 - a 1, a 0 - a 1]) ∧
    Nonempty (((Fin 2 → ℚ) ⧸ LinearMap.range
      (normalizationDifferential (Λ := ℚ)
        (fun _ : Fin 2 => (0 : Fin 2)) (fun _ => 1))) ≃ₗ[ℚ] ℚ) := by sorry

end Normalization

section Specialization

variable {F I A V W : Type*} [Field F] [Group I]
  [AddCommGroup A] [Module F A] [AddCommGroup V] [Module F V]
  [AddCommGroup W] [Module F W]

/-- The geometric specialization and its fixed-image proof are supplied by LPV.0
and continuous ℓ-adic realization by R02.1; the codomain is the existing invariants. -/
def invariantSpecialization (ρ : Representation F I V) (sp : A →ₗ[F] V)
    (hfixed : ∀ a g, ρ g (sp a) = sp a) : A →ₗ[F] ρ.invariants :=
  sp.codRestrict ρ.invariants (fun a => (Representation.mem_invariants ρ (sp a)).mpr
    (hfixed a))

lemma invariantSpecialization_coe (ρ : Representation F I V) (sp : A →ₗ[F] V)
    (hfixed : ∀ a g, ρ g (sp a) = sp a) :
    ρ.invariants.subtype.comp (invariantSpecialization ρ sp hfixed) = sp := by sorry

lemma invariantSpecialization_range (ρ : Representation F I V) (sp : A →ₗ[F] V)
    (hfixed : ∀ a g, ρ g (sp a) = sp a) :
    Function.Surjective (invariantSpecialization ρ sp hfixed) ↔
      LinearMap.range sp = ρ.invariants := by sorry

lemma invariantSpecialization_unique (ρ : Representation F I V) (sp : A →ₗ[F] V)
    (hfixed : ∀ a g, ρ g (sp a) = sp a) (u : A →ₗ[F] ρ.invariants)
    (hu : ρ.invariants.subtype.comp u = sp) :
    u = invariantSpecialization ρ sp hfixed := by sorry

lemma invariantSpecialization_natural (ρ : Representation F I V) (σ : Representation F I W)
    (sp : A →ₗ[F] V) (sq : A →ₗ[F] W)
    (hp : ∀ a g, ρ g (sp a) = sp a) (hq : ∀ a g, σ g (sq a) = sq a)
    (v : V →ₗ[F] W) (hinv : ∀ x ∈ ρ.invariants, v x ∈ σ.invariants)
    (hcomm : v.comp sp = sq) :
    (v.domRestrict ρ.invariants |>.codRestrict σ.invariants
      (fun x => hinv x x.property)).comp (invariantSpecialization ρ sp hp) =
      invariantSpecialization σ sq hq := by sorry

/-- Test `TauCeti.LPV7.invariant_sp_identity_test`. -/
example (hfixed : ∀ a g : ℚ, (Representation.trivial ℚ (Multiplicative ℚ) ℚ)
    (Multiplicative.ofAdd g) a = a) :
    Function.Surjective (invariantSpecialization
      (Representation.trivial ℚ (Multiplicative ℚ) ℚ) LinearMap.id
      (fun a g => hfixed a (Multiplicative.toAdd g))) := by sorry

/-- Test `TauCeti.LPV7.invariant_sp_zero_test`: fixed image does not imply surjectivity. -/
example : ¬Function.Surjective (invariantSpecialization
    (Representation.trivial ℚ (Multiplicative ℚ) ℚ) (0 : ℚ →ₗ[ℚ] ℚ)
    (by sorry)) := by sorry

/-- A concrete shear representation, used only to pin the invariant-space test. -/
def shearRepresentation : Representation ℚ (Multiplicative ℚ) (ℚ × ℚ) where
  toFun t :=
    { toFun := fun x => (x.1 + Multiplicative.toAdd t * x.2, x.2)
      map_add' := by sorry
      map_smul' := by sorry }
  map_one' := by sorry
  map_mul' := by sorry

def firstCoordinateInjection : ℚ →ₗ[ℚ] (ℚ × ℚ) where
  toFun a := (a,0)
  map_add' := by sorry
  map_smul' := by sorry

/-- Test `TauCeti.LPV7.invariant_sp_unipotent_test`: the fixed line and the rejected identity. -/
example (hfixed : ∀ a g, shearRepresentation g (firstCoordinateInjection a) =
    firstCoordinateInjection a) :
    Function.Surjective (invariantSpecialization shearRepresentation
      firstCoordinateInjection hfixed) ∧
    ¬(∀ (x : ℚ × ℚ) g, shearRepresentation g x = x) := by sorry

end Specialization

/- The proper arithmetic model and its realization maps use existing scheme types.
`B` is intended to be Spec ℤ[1/ℓ], `P` the geometric Spec k and `p` its point.
The constructible complex and pullback are represented only by their underlying
module-derived shadows. Their étale interpretation, arithmetic purity and the
henselization identification are omitted; G-suggested-premises records their
precise supplier contracts. Finite type is encoded by local finite type and
quasi-compactness. Integral, smooth-relative-dimension-one, proper, generic-point
and Cartesian-square conditions below ARE actual
existing predicates, not missing mathematical conditions disguised as fields.
-/

/-- Absolute arithmetic model, before the pencil produces a curve/section model.
The proper geometric fibre is an actual categorical pullback. Arithmetic purity
and the association of the derived pullback with the scheme map are omitted. -/
structure GeometricGenericPureModel (B P X : Scheme) (p : P)
    (structuralMap : X ⟶ P) (K : DerivedCategory (ModuleCat.{0} ℚ)) where
  A0 : Scheme
  integral : IsIntegral A0
  arithmeticMap : A0 ⟶ B
  locallyFiniteType : LocallyOfFiniteType arithmeticMap
  quasiCompact : QuasiCompact arithmeticMap
  point : P ⟶ A0
  generic : IsGenericPoint (point p) Set.univ
  X0 : Scheme
  familyMap : X0 ⟶ A0
  proper : IsProper familyMap
  familyRealization : X ⟶ X0
  familySquare : IsPullback familyRealization structuralMap familyMap point
  K0 : DerivedCategory (ModuleCat.{0} ℚ)
  weight : ℤ
  pullback : DerivedCategory (ModuleCat.{0} ℚ) ⥤ DerivedCategory (ModuleCat.{0} ℚ)
  complexRealization : pullback.obj K0 ≅ K

namespace GeometricGenericPureModel

variable {B P X : Scheme} {p : P} {structuralMap : X ⟶ P}
  {K : DerivedCategory (ModuleCat.{0} ℚ)}

def base (M : GeometricGenericPureModel B P X p structuralMap K) : Scheme := M.A0

def family (M : GeometricGenericPureModel B P X p structuralMap K) : Scheme := M.X0

def realization (M : GeometricGenericPureModel B P X p structuralMap K) :
    M.pullback.obj M.K0 ≅ K := M.complexRealization

def transport (M : GeometricGenericPureModel B P X p structuralMap K)
    {X' : Scheme} (x : X' ≅ X) {K' : DerivedCategory (ModuleCat.{0} ℚ)}
    (k : K ≅ K') : GeometricGenericPureModel B P X' p (x.hom ≫ structuralMap) K' :=
  by sorry

/-- Constructor `GeometricGenericPureModel.mk` uses all displayed fields; geometric premises
remain omitted exactly as documented above. Extensionality retains every data field. -/
lemma ext (M N : GeometricGenericPureModel B P X p structuralMap K)
    (h_A0 : M.A0 = N.A0)
    (h_arithmeticMap : HEq M.arithmeticMap N.arithmeticMap)
    (h_point : HEq M.point N.point)
    (h_X0 : M.X0 = N.X0)
    (h_familyMap : HEq M.familyMap N.familyMap)
    (h_familyRealization : HEq M.familyRealization N.familyRealization)
    (h_K0 : M.K0 = N.K0)
    (h_weight : M.weight = N.weight)
    (h_pullback : M.pullback = N.pullback)
    (h_complexRealization : HEq M.complexRealization N.complexRealization) :
    M = N := by sorry

end GeometricGenericPureModel

/-- Test `TauCeti.LPV7.generic_model_constant_test`: the realization of an
actual descended constant model; its constancy and purity await EDC.0/DWP.8. -/
example {B P X : Scheme} {p : P} {structuralMap : X ⟶ P}
    (K : DerivedCategory (ModuleCat.{0} ℚ))
    (M : GeometricGenericPureModel B P X p structuralMap K)
    (hK : M.K0 = K) (hpb : M.pullback = 𝟭 _) :
    Nonempty (M.pullback.obj M.K0 ≅ K) ∧ M.pullback.obj M.K0 = K := by sorry

/-- Test `TauCeti.LPV7.generic_model_shift_twist_test`: the same scheme model
with actual shifted/twisted complex and weight w+a−2b. Purity laws are omitted. -/
example {B P X : Scheme} {p : P} {structuralMap : X ⟶ P}
    {K : DerivedCategory (ModuleCat.{0} ℚ)}
    (M : GeometricGenericPureModel B P X p structuralMap K)
    (twist : ℤ → DerivedCategory (ModuleCat.{0} ℚ) ⥤ DerivedCategory (ModuleCat.{0} ℚ))
    (a b : ℤ) : ∃ M' : GeometricGenericPureModel B P X p structuralMap
      ((shiftFunctor (DerivedCategory (ModuleCat.{0} ℚ)) a).obj ((twist b).obj K)),
      M'.A0 = M.A0 ∧ M'.weight = M.weight + a - 2*b := by sorry

/-- Test `TauCeti.LPV7.generic_model_closed_point_test`: a proper closed
parameter subset cannot contain the geometric generic point. -/
example {B P X : Scheme} {p : P} {structuralMap : X ⟶ P}
    {K : DerivedCategory (ModuleCat.{0} ℚ)}
    (M : GeometricGenericPureModel B P X p structuralMap K)
    (Z : Set M.A0) (hclosed : IsClosed Z) (hproper : Z ≠ Set.univ)
    (hfactor : M.point p ∈ Z) : False := by sorry

structure PotentiallyPureModel (B P X S : Scheme) (p : P)
    (f : X ⟶ S) (K : DerivedCategory (ModuleCat.{0} ℚ)) where
  A0 : Scheme
  integral : IsIntegral A0
  arithmeticMap : A0 ⟶ B
  locallyFiniteType : LocallyOfFiniteType arithmeticMap
  quasiCompact : QuasiCompact arithmeticMap
  point : P ⟶ A0
  generic : IsGenericPoint (point p) Set.univ
  S0 : Scheme
  curve : S0 ⟶ A0
  smooth : SmoothOfRelativeDimension 1 curve
  curveSection : A0 ⟶ S0
  section_eq : curveSection ≫ curve = 𝟙 A0
  X0 : Scheme
  familyMap : X0 ⟶ S0
  proper : IsProper familyMap
  traitRealization : S ⟶ S0
  familyRealization : X ⟶ X0
  familySquare : IsPullback familyRealization f familyMap traitRealization
  K0 : DerivedCategory (ModuleCat.{0} ℚ)
  weight : ℤ
  pullback : DerivedCategory (ModuleCat.{0} ℚ) ⥤ DerivedCategory (ModuleCat.{0} ℚ)
  complexRealization : pullback.obj K0 ≅ K

namespace PotentiallyPureModel

variable {B P X S : Scheme} {p : P} {f : X ⟶ S}
  {K : DerivedCategory (ModuleCat.{0} ℚ)}

def base (M : PotentiallyPureModel B P X S p f K) : Scheme := M.A0

def family (M : PotentiallyPureModel B P X S p f K) : Scheme × Scheme := (M.S0,M.X0)

def realization (M : PotentiallyPureModel B P X S p f K) :
    M.pullback.obj M.K0 ≅ K := M.complexRealization

/-- Restrict the entire model to the supplied open, not just the integer weight.
The geometric pullback/purity preservation interface is omitted (EDC.0/DWP.8). -/
def shrink (M : PotentiallyPureModel B P X S p f K) (U : Scheme)
    (j : U ⟶ M.A0) [IsOpenImmersion j] (pointU : P ⟶ U)
    (hpoint : pointU ≫ j = M.point) : PotentiallyPureModel B P X S p f K := by sorry

def transport (M : PotentiallyPureModel B P X S p f K)
    {X' S' : Scheme} (x : X' ≅ X) (s : S' ≅ S) (f' : X' ⟶ S')
    (hcomm : f' ≫ s.hom = x.hom ≫ f) {K' : DerivedCategory (ModuleCat.{0} ℚ)}
    (k : K ≅ K') : PotentiallyPureModel B P X' S' p f' K' := by sorry

/-- Constructor `PotentiallyPureModel.mk` uses all displayed fields; geometric premises
remain omitted exactly as documented above. Extensionality retains every data field. -/
lemma ext (M N : PotentiallyPureModel B P X S p f K)
    (h_A0 : M.A0 = N.A0)
    (h_arithmeticMap : HEq M.arithmeticMap N.arithmeticMap)
    (h_point : HEq M.point N.point)
    (h_S0 : M.S0 = N.S0)
    (h_curve : HEq M.curve N.curve)
    (h_curveSection : HEq M.curveSection N.curveSection)
    (h_X0 : M.X0 = N.X0)
    (h_familyMap : HEq M.familyMap N.familyMap)
    (h_traitRealization : HEq M.traitRealization N.traitRealization)
    (h_familyRealization : HEq M.familyRealization N.familyRealization)
    (h_K0 : M.K0 = N.K0)
    (h_weight : M.weight = N.weight)
    (h_pullback : M.pullback = N.pullback)
    (h_complexRealization : HEq M.complexRealization N.complexRealization) :
    M = N := by sorry

end PotentiallyPureModel

/-- Test `TauCeti.LPV7.potential_model_constant_test`: underlying realization
of a descended constant family; constancy and purity await EDC.0/DWP.8. -/
example {B P X S : Scheme} {p : P} {f : X ⟶ S}
    (K : DerivedCategory (ModuleCat.{0} ℚ)) (M : PotentiallyPureModel B P X S p f K)
    (hK : M.K0 = K) (hpb : M.pullback = 𝟭 _) :
    Nonempty (M.pullback.obj M.K0 ≅ K) ∧ M.pullback.obj M.K0 = K := by sorry

/-- Test `TauCeti.LPV7.potential_model_shift_twist_test`: the same model geometry
has weight w+a−2b; the actual Tate/shift functors and purity witness are omitted. -/
example {B P X S : Scheme} {p : P} {f : X ⟶ S}
    {K : DerivedCategory (ModuleCat.{0} ℚ)} (M : PotentiallyPureModel B P X S p f K)
    (twist : ℤ → DerivedCategory (ModuleCat.{0} ℚ) ⥤ DerivedCategory (ModuleCat.{0} ℚ))
    (a b : ℤ) : ∃ M' : PotentiallyPureModel B P X S p f
      ((shiftFunctor (DerivedCategory (ModuleCat.{0} ℚ)) a).obj ((twist b).obj K)),
      M'.A0 = M.A0 ∧ M'.weight = M.weight + a - 2*b := by sorry

/-- Test `TauCeti.LPV7.potential_model_closed_point_test`: genericity excludes
factoring the parameter point through a proper closed subset. -/
example {B P X S : Scheme} {p : P} {f : X ⟶ S}
    {K : DerivedCategory (ModuleCat.{0} ℚ)} (M : PotentiallyPureModel B P X S p f K)
    (Z : Set M.A0) (hclosed : IsClosed Z) (hproper : Z ≠ Set.univ)
    (hfactor : M.point p ∈ Z) : False := by sorry

section SpectralSequence

open CategoryTheory.Abelian

variable (G : SpectralObject (ModuleCat.{0} ℚ) ℤ)
  (data : SpectralObject.SpectralSequenceDataCore ℤ
    (fun r => ComplexShape.up' (⟨r,1-r⟩ : ℤ × ℤ)) 1)
  [G.HasSpectralSequence data]

/-- The caller must supply the spectral object of the filtered nearby complex
and its indexing data. G-filtered-realization records that missing bridge.
The output is the existing Mathlib spectral sequence. -/
def weightSpectralSequence (G : SpectralObject (ModuleCat.{0} ℚ) ℤ)
    (data : SpectralObject.SpectralSequenceDataCore ℤ
      (fun r => ComplexShape.up' (⟨r,1-r⟩ : ℤ × ℤ)) 1)
    [G.HasSpectralSequence data] : CohomologicalSpectralSequence (ModuleCat.{0} ℚ) 1 :=
  G.spectralSequence data

/-- Finite dependent product of stratum cohomology (finite sums agree for modules).
H(r,q,t) is the supplied H^q of the (r+1)-fold stratum with Tate twist t. -/
def weightE1 (H : ℤ → ℤ → ℤ → ModuleCat.{0} ℚ) (d p q : ℤ) : ModuleCat.{0} ℚ :=
  ModuleCat.of ℚ (∀ i : {i : ℤ // max 0 (-p) ≤ i ∧ p + 2*i ≤ d},
    H (p + 2*i.val) (q - 2*i.val) (-i.val))

/-- Omitted: G is the geometric filtered-nearby spectral object, H its stratum
cohomology and d its relative dimension. An arbitrary G has no such comparison. -/
def weightSpectralSequence_e1 (H : ℤ → ℤ → ℤ → ModuleCat.{0} ℚ) (d p q : ℤ) :
    ((weightSpectralSequence G data).page 1).X (p,q) ≅ weightE1 H d p q := by sorry

def weightSpectralSequence_e2 (p q : ℤ) :
    ((weightSpectralSequence G data).page 1).homology (p,q) ≅
      ((weightSpectralSequence G data).page 2).X (p,q) := by sorry

/-- Omitted: the actual proper geometric abutment and its induced filtration;
boundedness/convergence and proper base change are EDC.0/LPV.0 inputs.
Omitted: the relative-dimension column bound -d ≤ p ≤ d. It ensures
page 2*d+2 is stabilized, without an E2-degeneration assumption.
The filtration index is -p (not p); m=p+q. -/
def weightSpectralSequence_abutment
    (Hgeneric : ℤ → ModuleCat.{0} ℚ)
    (M : ∀ m : ℤ, ℤ → Submodule ℚ (Hgeneric m))
    (d : ℕ) (p q : ℤ) :
    ((weightSpectralSequence G data).page (2*d+2)).X (p,q) ≅
      ModuleCat.of ℚ ((M (p+q) (-p)) ⧸
        ((M (p+q) (-p-1)).comap (M (p+q) (-p)).subtype)) := by sorry

/-- Omitted: the signed component permutation and its filtered geometric map. -/
def weightSpectralSequence_reindex
    (G' : SpectralObject (ModuleCat.{0} ℚ) ℤ) [G'.HasSpectralSequence data] :
    weightSpectralSequence G data ≅ weightSpectralSequence G' data := by sorry

/-- Test `TauCeti.LPV7.weight_ss_smooth_test`: stratum realization omitted;
the exact E1 sparsity is the intended test, including all integer indices. -/
example (H : ℤ → ℤ → ℤ → ModuleCat.{0} ℚ) :
    (∀ q, Nonempty (((weightSpectralSequence G data).page 1).X (0,q) ≅ H 0 q 0)) ∧
    (∀ p q, p ≠ 0 → IsZero (((weightSpectralSequence G data).page 1).X (p,q))) := by sorry

/-- Test `TauCeti.LPV7.weight_ss_curve_test`: the H arguments include the twists.
Restriction/Gysin identification is a geometric premise omitted here. -/
example (H : ℤ → ℤ → ℤ → ModuleCat.{0} ℚ) :
    Nonempty (((weightSpectralSequence G data).page 1).X (-1,2) ≅ H 1 0 (-1)) ∧
    Nonempty (((weightSpectralSequence G data).page 1).X (0,1) ≅ H 0 1 0) ∧
    Nonempty (((weightSpectralSequence G data).page 1).X (1,0) ≅ H 1 0 0) := by sorry

/-- Test `TauCeti.LPV7.weight_ss_nonproper_test`: the target is nearby
hypercohomology, not generic cohomology. The uv=π realization and column
bound [-d,d] are omitted; the bound ensures stabilization by page 2*d+2. -/
example (Hnearby : ℤ → ModuleCat.{0} ℚ)
    (M : ∀ m : ℤ, ℤ → Submodule ℚ (Hnearby m)) (d : ℕ) (p q : ℤ) :
    Nonempty (((weightSpectralSequence G data).page (2*d+2)).X (p,q) ≅
      ModuleCat.of ℚ ((M (p+q) (-p)) ⧸
        ((M (p+q) (-p-1)).comap (M (p+q) (-p)).subtype))) := by sorry

end SpectralSequence

/-! Named theorem forms. The comments tie each module signature to its geometric
statement. In addition to the explicitly displayed algebraic premises, the
realizations and geometric hypotheses named there must be supplied. They are
omitted here because the pinned libraries do not express them. -/

section CurveTheorems

variable {F A V E C T M Md B : Type*} [Field F]
  [AddCommGroup A] [Module F A] [AddCommGroup V] [Module F V]
  [AddCommGroup E] [Module F E] [AddCommGroup C] [Module F C]
  [AddCommGroup T] [Module F T] [AddCommGroup M] [Module F M]
  [AddCommGroup Md] [Module F Md] [AddCommGroup B] [Module F B]

/-- Omitted: diag/diff are the constant-sheaf normalization stalk maps on a
proper geometric nodal curve, not arbitrary maps of vector spaces. -/
theorem normalizationEtaleResolution (diag : A →ₗ[F] V) (diff : V →ₗ[F] E) :
    Function.Injective diag ∧ LinearMap.range diag = LinearMap.ker diff ∧
      Function.Surjective diff := by sorry

/-- Omitted: the proper nodal uv=a family, its coefficient realization and
nearby stalks. nodeResidue is the R¹Φ(1) branch-dual comparison. -/
theorem nodalNearbyCycleSheaves (R : ℕ → ModuleCat F)
    (branchesDual : ModuleCat F) :
    Nonempty (R 0 ≅ ModuleCat.of F F) ∧ Nonempty (R 1 ≅ branchesDual) ∧
      (∀ q, 1 < q → IsZero (R q)) := by sorry

/-- Omitted: local variation and dual branch/Tate coordinates at uv=π^n.
The sign is negative and thickness n is positive. -/
theorem nodeResidueVariationSign (n : ℕ) (hn : 0 < n) (variation : F →ₗ[F] F) :
    variation = -(n : F) • LinearMap.id := by sorry

/-- Omitted: these are the five geometric specialization arrows of the packet,
with E=⊕Λ′(-1), C=component H² and T=generic H². -/
theorem curveSpecializationSequence (sp : A →ₗ[F] V) (res : V →ₗ[F] E)
    (boundary : E →ₗ[F] C) (trace : C →ₗ[F] T) :
    Function.Injective sp ∧ LinearMap.range sp = LinearMap.ker res ∧
    LinearMap.range res = LinearMap.ker boundary ∧
    LinearMap.range boundary = LinearMap.ker trace ∧ Function.Surjective trace := by sorry

/-- Omitted: graph injection, special-fibre H¹ and component H¹ realization.
No splitting is part of this statement. -/
theorem curveNormalizationCohomology (graph : M →ₗ[F] A) (components : A →ₗ[F] B) :
    Function.Injective graph ∧ LinearMap.range graph = LinearMap.ker components ∧
      Function.Surjective components := by sorry

/-- Rational linear consequence of the negative graph-pairing factorization.
Omitted: identification of the displayed composite with geometric twisted N.
The positive integral valuation pairing is imported from R11.4. -/
theorem curveMonodromyFactorization [FiniteDimensional F V] [FiniteDimensional F M]
    (c : V →ₗ[F] M) (u : M →ₗ[F] Md) (c' : Md →ₗ[F] V)
    (hcc : c.comp c' = 0) (hc : Function.Surjective c)
    (hu : Function.Bijective u) (hc' : Function.Injective c') :
    (c'.comp (u.comp c)).comp (c'.comp (u.comp c)) = 0 ∧
    Module.finrank F (LinearMap.range (c'.comp (u.comp c))) = Module.finrank F M := by sorry

/-- Omitted: curve specialization identifies its image with ker N; the
unipotent action and nonzero tame character displayed below are genuine inputs. -/
theorem curveInertiaInvariants {I : Type*} [Group I]
    (ρ : Representation F I V) (N : V →ₗ[F] V) (t : I → F)
    (hact : ∀ g x, ρ g x = x + t g • N x) (ht : ∃ g, t g ≠ 0)
    (sp : A →ₗ[F] V) (hsp : LinearMap.range sp = LinearMap.ker N) :
    ρ.invariants = LinearMap.ker N ∧ LinearMap.range sp = ρ.invariants := by sorry

/-- Omitted: the geometric identification of the three quotients with graph
H¹, component H¹ and graph H₁(-1). This checks the actual N²=0 filtration core. -/
theorem curveMonodromyFiltration (N : V →ₗ[F] V) (hN : N.comp N = 0) :
    LinearMap.range N ≤ LinearMap.ker N ∧
    Nonempty ((V ⧸ LinearMap.ker N) ≃ₗ[F] LinearMap.range N) := by sorry

/-- Omitted: regular projective semistable curve, principal polarization and
Kummer realization. V=H¹(1), T=VℓJac, M=graph H¹(1), B=component Tate modules. -/
def jacobianTateRealization : V ≃ₗ[F] T := by sorry

/-- Omitted: the two pairings are the Illusie residue form and the polarized
positive valuation pairing in compatible graph coordinates. -/
theorem curveJacobianPairing (uMinus uPlus : LinearMap.BilinForm F M) :
    uMinus = -uPlus := by sorry

/-- Omitted: a ramified trait extension and compatible tame/Tate coordinates.
For an original thickness n, the e*n unit-edge subdivision comparison
is supplied by StableReduction (e edges only when n=1). -/
theorem curveChoiceBaseChange (e : ℕ) (Nold Nnew : V →ₗ[F] V) :
    Nnew = (e : F) • Nold := by sorry

/-- Algebraic acceptance calculation; existence of the proper I₂ model remains
the geometric test G-geometric-tests. The smooth/bridge cases have zero N. -/
theorem smoothAndSplitCycleExamples :
    (let N : (ℚ × ℚ) →ₗ[ℚ] (ℚ × ℚ) :=
      { toFun := fun x => (-2*x.2,0)
        map_add' := by sorry
        map_smul' := by sorry }
    N.comp N = 0 ∧ N ≠ 0 ∧ ∀ x, N x = (-2*x.2,0)) := by sorry

/-- Omitted: strict-semistable trait charts and Kummer stalk realization.
The exterior algebra carrier and Tate twist are provided by the owners;
the branch rank is a-1, and higher q>a-1 is zero. -/
theorem sncNearbyCycleDescription (a : ℕ) (ha : 0 < a) (R : ℕ → ModuleCat F) :
    ∀ q, a ≤ q → IsZero (R q) := by sorry

/-- Omitted: the actual shifted-perverse RΨ and its LPV.1 monodromy filtration.
The displayed derived objects stand for gr_r and the finite sum of stratum
pushforwards a_{p+q,*}Qℓ(-p)[-p-q] with p-q=r. -/
def sncGradedNearbyComplex (graded strata : DerivedCategory (ModuleCat.{0} ℚ)) :
    graded ≅ strata := by sorry

/-- With actual stratum maps omitted, the signed differential satisfies the
following linear relation. Source sign convention is restriction + Gysin. -/
theorem weightSpectralSequenceDifferential (restriction gysin : V →ₗ[F] V)
    (hr : restriction.comp restriction = 0) (hg : gysin.comp gysin = 0)
    (hmixed : restriction.comp gysin + gysin.comp restriction = 0) :
    (restriction + gysin).comp (restriction + gysin) = 0 := by sorry

/-- Omitted: proper curve spectral-object realization and stabilized-page
identifications. Degree positions force E₂=E∞; geometric N is the same
negative graph composite after the residue signs are transported. -/
theorem spectralMonodromyCurveComparison (N : V →ₗ[F] V)
    (c : V →ₗ[F] M) (u : M →ₗ[F] Md) (c' : Md →ₗ[F] V) :
    N = c'.comp (u.comp c) := by sorry

end CurveTheorems

section InvariantTheorems

variable {F I A V W U : Type*} [Field F] [Group I]
  [AddCommGroup A] [Module F A] [AddCommGroup V] [Module F V]
  [AddCommGroup W] [Module F W] [AddCommGroup U] [Module F U]

/-- Omitted: arithmetic finite-presentation descent and tame-cover comparison
of WeilII1.11.3. The identification must preserve the full representation image. -/
theorem arithmeticSpreading {J : Type*} [Group J] (ρ : Representation F I V)
    (ρ' : Representation F J V) : Set.range ρ = Set.range ρ' := by sorry

/-- Omitted: continuous inertia cohomology and the trait's generic fibre.
The maps stand for coinvariants(-1)→generic trait H^i→fibre invariants
for bounded constructible rational K, with no total-space smoothness premise. -/
theorem continuousWangSequence (left : W →ₗ[F] V) (right : V →ₗ[F] U) :
    Function.Injective left ∧ LinearMap.range left = LinearMap.ker right ∧
      Function.Surjective right := by sorry

/-- Omitted: the actual localization/Wang square and support-duality exchange.
This is its commuting-map signature, retaining the two distinct paths. -/
theorem localizationDualityCross (sp : A →ₗ[F] V) (obs : V →ₗ[F] W)
    (support : A →ₗ[F] U) (comparison : U →ₗ[F] W) :
    obs.comp sp = comparison.comp support := by sorry

/-- Omitted: the finite-field Frobenius realization, weight filtration and the
local1.8.8 estimate. Bounds are displayed as integers, never free purity flags. -/
theorem invariantSupportWeightBounds (i : ℤ)
    (invariantWeight supportWeight : ℤ) :
    invariantWeight ≤ i ∧ i+1 ≤ supportWeight := by sorry

/-- Omitted: S=hensel(k[T]_(T)), algebraically closed k, X essentially smooth/k,
smooth generic fibre, actual H^i realization and the weight cross. -/
theorem localInvariantCycles {X S : Scheme} (f : X ⟶ S) [IsProper f]
    (ρ : Representation F I V) (sp : A →ₗ[F] V)
    (hfixed : ∀ a g, ρ g (sp a) = sp a) :
    Function.Surjective (invariantSpecialization ρ sp hfixed) := by sorry

/-- Omitted: proper smooth-total-space projectively factored disk family,
Betti cohomology and the geometric MHS cross (G-complex-mhs). -/
theorem complexLocalInvariantCycles [Module ℚ V] [Module ℚ A]
    (ρ : Representation ℚ I V) (sp : A →ₗ[ℚ] V)
    (hfixed : ∀ a g, ρ g (sp a) = sp a) :
    Function.Surjective (invariantSpecialization ρ sp hfixed) := by sorry

/-- Omitted: sufficiently general incidence line, its actual constructible
pullback, generic local acyclicity and arithmetic purity. The absolute model
is input; the curve/section model and normalized duality iso are output. -/
theorem potentialPurityIncidencePullback {B P X : Scheme} {p : P}
    (structuralMap : X ⟶ P) (K : DerivedCategory (ModuleCat.{0} ℚ))
    (M : GeometricGenericPureModel B P X p structuralMap K)
    (Xp S : Scheme) (f : Xp ⟶ S) [IsProper f]
    (pulledK dualPulled pulledDual : DerivedCategory (ModuleCat.{0} ℚ)) :
    Nonempty (PotentiallyPureModel B P Xp S p f pulledK) ∧
      Nonempty (dualPulled ≅ pulledDual) := by sorry

/-- Omitted: geometric constructible realization/purity of K and the equicharacteristic
trait. M keeps the model schemes/maps; it does not yet certify arithmetic purity. -/
theorem pureComplexLocalInvariantCycles {B P X S : Scheme} {p : P}
    (f : X ⟶ S) [IsProper f] (K : DerivedCategory (ModuleCat.{0} ℚ))
    (M : PotentiallyPureModel B P X S p f K)
    (ρ : Representation F I V) (sp : A →ₗ[F] V)
    (hfixed : ∀ a g, ρ g (sp a) = sp a) :
    Function.Surjective (invariantSpecialization ρ sp hfixed) := by sorry

/-- Omitted: X projective, actual support dimensions of DK[-2n-2] and compact
cohomology of the affine hyperplane complement. The exact numerical bound is kept. -/
theorem dualSupportAffineVanishing (n : ℤ)
    (dualSupportDimension : ℤ → WithBot ℤ)
    (hbound : ∀ j, dualSupportDimension j ≤ (n+1-j : ℤ))
    (Hcompact : ℤ → ModuleCat F) : ∀ i, i ≤ n → IsZero (Hcompact i) := by sorry

/-- Omitted: X projective, arbitrary hyperplane section, K constructible and
the actual dual support realization. Smoothness/purity are not additional premises. -/
theorem supportBoundWeakLefschetz (n : ℤ)
    (dualSupportDimension : ℤ → WithBot ℤ)
    (hbound : ∀ j, dualSupportDimension j ≤ (n+1-j : ℤ))
    (Hx Hy : ℤ → ModuleCat F) (restriction : ∀ i, Hx i →ₗ[F] Hy i) :
    (∀ i, i < n → Function.Bijective (restriction i)) ∧
      Function.Injective (restriction n) := by sorry

/-- Omitted: actual P¹ relative hypercohomology, finite support below degree0
and the local detection map of WeilII4.3.6–8. No orthogonal splitting is imported. -/
theorem pencilRelativeObstruction (detect : V →ₗ[F] W) :
    Function.Injective detect := by sorry

/-- Omitted: general-pencil axis/cone geometry and6.2.11 support bound;
ambient and pencilSection are the two actual restrictions to every fibre. -/
theorem pencilImageEquality (ambient : A →ₗ[F] V) (pencilSection : W →ₗ[F] V) :
    LinearMap.range ambient = LinearMap.range pencilSection := by sorry

/-- Omitted: the incidence fundamental groups and sufficiently general line
giving the map q. Surjectivity is the imported generic-line theorem, not an
assumption that their dimensions agree. -/
theorem generalPencilMonodromy {J : Type*} [Group J]
    (ρ : Representation F I V) (q : J →* I) (hq : Function.Surjective q) :
    Set.range (ρ.comp q) = Set.range ρ := by sorry

/-- Omitted: projective incidence and cohomology realization, K potentially pure
with its full arithmetic witness, the support bound and sufficiently general u.
This exports to DWP.9 and uses no hard-Lefschetz premise. -/
theorem globalInvariantCycles {B P X : Scheme} {p : P}
    (structuralMap : X ⟶ P) (K : DerivedCategory (ModuleCat.{0} ℚ))
    (M : GeometricGenericPureModel B P X p structuralMap K) (n : ℤ)
    (dualSupportDimension : ℤ → WithBot ℤ)
    (hbound : ∀ j, dualSupportDimension j ≤ (n+1-j : ℤ))
    (ρ : Representation F I V) (restriction : A →ₗ[F] V)
    (hfixed : ∀ a g, ρ g (restriction a) = restriction a) :
    Function.Bijective (invariantSpecialization ρ restriction hfixed) := by sorry

end InvariantTheorems

end TauCeti.LPV7
