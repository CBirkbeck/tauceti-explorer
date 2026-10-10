/-
Suggested Lean forms for EtaleDualityAndPerverseSheaves, part EDC.0
(stages EDC.0, EDC.1, EDC.1:adjoint, EDC.1:biduality, EDC.2, EDC.2:trace-purity, EDC.2:pairings, EDC.3).

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/EtaleDualityAndPerverseSheaves--EDC.0.md` and the blueprint packet
`research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.0.json` are definitive; the
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every proof is `sorry`; nothing here is claimed to be formalised (every packet node has
implementationStatus "unchecked"). Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174,
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Imports use individual Mathlib modules
and the existing Tau Ceti line-bundle class module.

Coverage. Each packet API has a typed declaration and each unit test a named docstring on an
`example`. Imported data carriers stand for the supplying roadmap's definitions. They introduce
no substitute Prop fields. The genuine predicates below spell out compactifications, finite
stratifications, local constancy, boundedness and uniform Tor amplitude. Higher coherence and
stable infinity-category conditions use the E1/E3 carrier imports; ordinary triangulated
functors are used only for their homotopy-category comparisons. See the reader for the full
mathematical conditions and proof plans.
-/

import Mathlib.AlgebraicGeometry.Sites.AffineEtale
import Mathlib.AlgebraicGeometry.Sites.EtalePoint
import Mathlib.AlgebraicGeometry.AffineSpace
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Separated
import Mathlib.AlgebraicGeometry.Morphisms.FiniteType
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.AlgebraicGeometry.Morphisms.QuasiSeparated
import Mathlib.AlgebraicGeometry.Morphisms.QuasiFinite
import Mathlib.AlgebraicGeometry.Morphisms.FlatRank
import Mathlib.AlgebraicGeometry.AlgebraicCycle.Basic
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.Algebra.Homology.DerivedCategory.ExactFunctor
import Mathlib.Algebra.Homology.DerivedCategory.HomologySequence
import Mathlib.Algebra.Homology.DerivedCategory.Ext.Basic
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.CategoryTheory.Triangulated.Functor
import Mathlib.CategoryTheory.Sites.Point.Basic
import Mathlib.Algebra.Module.Injective
import Mathlib.RingTheory.RootsOfUnity.Basic
import Mathlib.LinearAlgebra.PerfectPairing.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.FieldTheory.IsSepClosed
import Mathlib.FieldTheory.Perfect
import Mathlib.RepresentationTheory.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.Algebra.DirectSum.Ring
import Lean.Elab.Tactic.Omega
import TauCeti.AlgebraicGeometry.LineBundle.Class
import Mathlib.AlgebraicGeometry.Noetherian
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.AlgebraicGeometry.Modules.Tilde
import Mathlib.Algebra.Category.ModuleCat.Sheaf.LocallyFree
import Mathlib.AlgebraicTopology.Quasicategory.Basic

noncomputable section

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry
open scoped ZeroObject

universe u

attribute [local instance] HasDerivedCategory.standard
local instance (α : Type*) : DecidableEq α := Classical.typeDecidableEq α
local instance (p : Prop) : Decidable p := Classical.propDecidable p

set_option linter.unusedVariables false
set_option linter.unusedSectionVars false
set_option linter.overlappingInstances false

namespace TauCeti.EtaleDuality

/-! ## EDC.0 — the étale derived category (node `EDC.0/etale-derived-category`) -/

section Carrier

variable (Λ : Type u) [CommRing Λ]

/-- `EtaleSheaf Λ X`: étale sheaves of `Λ`-modules on Mathlib's small étale site. -/
abbrev EtaleSheaf (X : Scheme.{u}) : Type (u + 1) :=
  Sheaf X.smallEtaleTopology (ModuleCat.{u} Λ)

/-- `EtaleDerived Λ X = D(X_ét, Λ)`, Mathlib's unbounded derived category. -/
abbrev EtaleDerived (X : Scheme.{u}) := DerivedCategory (EtaleSheaf Λ X)

example (X : Scheme.{u}) : Pretriangulated (EtaleDerived Λ X) := inferInstance

/-- A geometric point of `X`: a morphism from the spectrum of a separably closed field. -/
structure GeometricPoint (X : Scheme.{u}) where
  /-- the separably closed field -/
  Ω : Type u
  [field : Field Ω]
  [sepClosed : IsSepClosed Ω]
  /-- the point -/
  pt : Spec (CommRingCat.of Ω) ⟶ X

attribute [instance] GeometricPoint.field GeometricPoint.sepClosed

variable {Λ}

/-- `Λ_X`, the constant sheaf placed in degree 0. -/
def EtaleDerived.constant (X : Scheme.{u}) : EtaleDerived Λ X :=
  (DerivedCategory.singleFunctor _ 0).obj
    ((constantSheaf X.smallEtaleTopology (ModuleCat.{u} Λ)).obj (ModuleCat.of Λ Λ))

/-- The geometric stalk at `x`, the derived functor of the exact fibre functor of
`Scheme.pointSmallEtale`. -/
def EtaleDerived.stalk {X : Scheme.{u}} (x : GeometricPoint X) :
    EtaleDerived Λ X ⥤ DerivedCategory (ModuleCat.{u} Λ) := sorry

lemma EtaleDerived.isIso_iff_stalk {X : Scheme.{u}} {K L : EtaleDerived Λ X} (g : K ⟶ L) :
    IsIso g ↔ ∀ x : GeometricPoint X, IsIso ((EtaleDerived.stalk x).map g) := sorry

/-- `H^q(X, K) := Hom(Λ_X, K[q])`. -/
def EtaleDerived.cohomology {X : Scheme.{u}} (q : ℤ) (K : EtaleDerived Λ X) : Type _ :=
  EtaleDerived.constant (Λ := Λ) X ⟶ K⟦q⟧

instance {X : Scheme.{u}} (q : ℤ) (K : EtaleDerived Λ X) :
    AddCommGroup (EtaleDerived.cohomology q K) := by
  unfold EtaleDerived.cohomology; infer_instance

attribute [local instance] HasExt.standard in
/-- For a sheaf in degree 0, `H^q(X, F) ≅ Ext^q(Λ_X, F)`. -/
def EtaleDerived.cohomology_sheaf {X : Scheme.{u}} (q : ℕ) (F : EtaleSheaf Λ X) :
    EtaleDerived.cohomology (q : ℤ) ((DerivedCategory.singleFunctor _ 0).obj F) ≃+
      Abelian.Ext ((constantSheaf X.smallEtaleTopology (ModuleCat.{u} Λ)).obj
        (ModuleCat.of Λ Λ)) F q := sorry

/-- Over a separably closed field, global sections identify `D(Spec Ω, Λ)` with `D(Λ)`. -/
def EtaleDerived.equivModuleOfSepClosed (Ω : Type u) [Field Ω] [IsSepClosed Ω] :
    EtaleDerived Λ (Spec (CommRingCat.of Ω)) ≌ DerivedCategory (ModuleCat.{u} Λ) := sorry

/-- Global sections of an étale sheaf (evaluation at the terminal object `X → X`). -/
def globalSections (X : Scheme.{u}) : EtaleSheaf Λ X ⥤ ModuleCat.{u} Λ :=
  sheafToPresheaf _ _ ⋙ (evaluation _ _).obj (Opposite.op (Scheme.Etale.mk (𝟙 X)))

/-- Test `etaleDerived_isZero_of_isEmpty`. -/
example (X : Scheme.{u}) [IsEmpty X] (K : EtaleDerived Λ X) : IsZero K := sorry

/-- Test `etaleDerived_spec_sepClosed`. -/
example (Ω : Type u) [Field Ω] [IsSepClosed Ω] :
    Nonempty (EtaleDerived Λ (Spec (CommRingCat.of Ω)) ≌ DerivedCategory (ModuleCat.{u} Λ)) :=
  sorry

/-- Test `etaleDerived_stalk_conservative`. -/
example {X : Scheme.{u}} (K : EtaleDerived Λ X)
    (h : ∀ x : GeometricPoint X, IsZero ((EtaleDerived.stalk x).obj K)) : IsZero K := sorry

/-- Test `etaleDerived_globalSections_not_conservative`: over `𝔽_2` (here `GaloisField 2 1`),
with `Λ = ℤ/3`, a sheaf with no global sections need not be zero. -/
example : ∃ F : EtaleSheaf (ZMod 3) (Spec (CommRingCat.of (GaloisField 2 1))),
    ¬ IsZero F ∧ IsZero ((globalSections _).obj F) := sorry

end Carrier

/-! ## Imported operations (signature stand-ins; owners: CohomologicalPointCounting via SF.2,
EnhancedDerivedSheaves E1). -/

/-- Actual torsion-coefficient condition; no invertibility on a scheme is implicit here. -/
class TorsionCoefficients (Λ : Type u) [CommRing Λ] : Prop where
  killed : ∃ n : ℕ, n ≠ 0 ∧ (n : Λ) = 0

instance zmod_torsion (n : ℕ) [NeZero n] : TorsionCoefficients (ZMod n) := by sorry

/-- A finite-type compactification. The data are part of the imported Nagata contract. -/
structure Compactification {X S : Scheme.{u}} (f : X ⟶ S) where
  ambient : Scheme.{u}
  j : X ⟶ ambient
  p : ambient ⟶ S
  [openImmersion : IsOpenImmersion j]
  [proper : IsProper p]
  factorization : j ≫ p = f

/-- Compactifiability and the qcqs finite-type scope of this packet. -/
class Compactifiable {X S : Scheme.{u}} (f : X ⟶ S)
    : Prop extends IsSeparated f, LocallyOfFiniteType f, QuasiCompact f where
  compactBase : CompactSpace S
  separatedBase : QuasiSeparatedSpace S
  exists_compactification : Nonempty (Compactification f)

-- The base proofs are accessed explicitly; registering these projections would create
-- typeclass searches with an undetermined compactifiable morphism.

/-- Imported Nagata compactification theorem (CompactSupport); the condition is genuine. -/
instance compactifiable_of_finiteType {X S : Scheme.{u}} (f : X ⟶ S)
    [IsSeparated f] [LocallyOfFiniteType f] [QuasiCompact f]
    [CompactSpace S] [QuasiSeparatedSpace S] : Compactifiable f := by sorry

section Imported

variable {Λ : Type u} [CommRing Λ] [TorsionCoefficients Λ]

/-- Stand-in for the exact pullback `f^*` (ConstructibleEtale). -/
def pullback {X S : Scheme.{u}} (f : X ⟶ S) : EtaleDerived Λ S ⥤ EtaleDerived Λ X := sorry

/-- Stand-in for `Rf_*` (ConstructibleEtale / EtaleBaseChange). -/
def pushforward {X S : Scheme.{u}} (f : X ⟶ S) : EtaleDerived Λ X ⥤ EtaleDerived Λ S := sorry

/-- Stand-in for the adjunction `f^* ⊣ Rf_*`. -/
def pullbackPushforwardAdjunction {X S : Scheme.{u}} (f : X ⟶ S) :
    pullback (Λ := Λ) f ⊣ pushforward f := sorry

/-- Stand-in for the compactly supported direct image `Rf_!` (CompactSupport). -/
def lowerShriek {X S : Scheme.{u}} (f : X ⟶ S) [Compactifiable f] :
    EtaleDerived Λ X ⥤ EtaleDerived Λ S := sorry

/-- Stand-in for proper base change `g^* Rf_! ≅ Rf'_! g'^*` (CompactSupport). -/
def lowerShriekBaseChange {X S X' S' : Scheme.{u}} {f : X ⟶ S} {g : S' ⟶ S} {f' : X' ⟶ S'}
    {g' : X' ⟶ X} (sq : IsPullback g' f' f g) [Compactifiable f]
    [Compactifiable f'] :
    lowerShriek (Λ := Λ) f ⋙ pullback g ≅ pullback g' ⋙ lowerShriek f' := sorry

/-- Stand-in for the pseudofunctoriality of pullback along a commutative square. -/
def pullbackSquareIso {X S X' S' : Scheme.{u}} {f : X ⟶ S} {g : S' ⟶ S} {f' : X' ⟶ S'}
    {g' : X' ⟶ X} (h : g' ≫ f = f' ≫ g) :
    pullback (Λ := Λ) f ⋙ pullback g' ≅ pullback g ⋙ pullback f' := sorry

/-- Stand-in for the derived tensor product (EnhancedDerivedSheaves E1). -/
def derivedTensor (X : Scheme.{u}) : EtaleDerived Λ X ⥤ EtaleDerived Λ X ⥤ EtaleDerived Λ X :=
  sorry

/-- Stand-in for the derived internal Hom (EnhancedDerivedSheaves E1). -/
def internalHom (X : Scheme.{u}) :
    (EtaleDerived Λ X)ᵒᵖ ⥤ EtaleDerived Λ X ⥤ EtaleDerived Λ X := sorry

/-- Stand-in for `RΓ(X, −) : D(X, Λ) → D(Λ)`. -/
def derivedGlobalSections (X : Scheme.{u}) : EtaleDerived Λ X ⥤ DerivedCategory (ModuleCat.{u} Λ) :=
  sorry

/-- Stand-in for the exact `i_*` on sheaves for a closed immersion (ConstructibleEtale). -/
def sheafPushforward {Z X : Scheme.{u}} (i : Z ⟶ X) : EtaleSheaf Λ Z ⥤ EtaleSheaf Λ X := sorry

/-- `H^q(X, K)` as a `Λ`-module, through `RΓ`. -/
def cohomologyModule {X : Scheme.{u}} (q : ℤ) (K : EtaleDerived Λ X) : ModuleCat.{u} Λ :=
  (DerivedCategory.homologyFunctor _ q).obj ((derivedGlobalSections X).obj K)

/-- `H^q_c(X, K)` for `X` separated of finite type over `Spec Ω`, `Ω` separably closed. -/
def compactCohomologyModule {Ω : Type u} [Field Ω] [IsSepClosed Ω] {X : Scheme.{u}}
    (a : X ⟶ Spec (CommRingCat.of Ω)) [Compactifiable a] (q : ℤ)
    (K : EtaleDerived Λ X) : ModuleCat.{u} Λ :=
  (DerivedCategory.homologyFunctor _ q).obj
    ((derivedGlobalSections _).obj ((lowerShriek a).obj K))

end Imported

/-! ## EDC.0 — constructible complexes and uniform Tor amplitude -/

section Constructible
variable {Λ : Type u} [CommRing Λ] {X Y : Scheme.{u}}

/-- Imported exact sheaf pullback (ConstructibleEtale). -/
def sheafPullback (f : Y ⟶ X) : EtaleSheaf Λ X ⥤ EtaleSheaf Λ Y := sorry

/-- Finite local constancy is stated on an étale covering, not just stalkwise. -/
def IsLisseSheaf (F : EtaleSheaf Λ X) : Prop :=
  ∀ x : X, ∃ (U : Scheme.{u}) (j : U ⟶ X), Etale j ∧ x ∈ Set.range j.base ∧
    ∃ M : ModuleCat.{u} Λ, Module.Finite Λ M ∧ Nonempty
      ((sheafPullback j).obj F ≅ (constantSheaf U.smallEtaleTopology
        (ModuleCat.{u} Λ)).obj M)

/-- A locally closed immersion is a closed immersion into an open subscheme. -/
def LocallyClosedImmersion {Z : Scheme.{u}} (i : Z ⟶ X) : Prop :=
  ∃ V : X.Opens, ∃ c : Z ⟶ V.toScheme, IsClosedImmersion c ∧ c ≫ V.ι = i

/-- Imported constructible-sheaf predicate, displayed by its actual finite-stratum definition. -/
def IsConstructibleSheaf (F : EtaleSheaf Λ X) : Prop :=
  ∃ (r : ℕ) (Z : Fin r → Scheme.{u}) (i : ∀ a, Z a ⟶ X),
    (∀ a, LocallyClosedImmersion (i a)) ∧
    (∀ x : X, ∃! a, x ∈ Set.range (i a).base) ∧
    ∀ a, IsLisseSheaf ((sheafPullback (i a)).obj F)

/-- Boundedness uses actual homology vanishing. -/
def IsBoundedComplex (K : EtaleDerived Λ X) : Prop :=
  ∃ a b : ℤ, ∀ q, q < a ∨ b < q →
    IsZero ((DerivedCategory.homologyFunctor _ q).obj K)

/-- Constructible complexes: bounded, with constructible cohomology sheaves. -/
def IsConstructibleComplex (K : EtaleDerived Λ X) : Prop :=
  IsBoundedComplex K ∧ ∀ q : ℤ,
    IsConstructibleSheaf ((DerivedCategory.homologyFunctor _ q).obj K)

/-- E1's derived tensor product on module complexes, used in the Tor-amplitude condition. -/
def moduleDerivedTensor : DerivedCategory (ModuleCat.{u} Λ) ⥤
    DerivedCategory (ModuleCat.{u} Λ) ⥤ DerivedCategory (ModuleCat.{u} Λ) := sorry

/-- A uniform interval works for every stalk and every degree-zero coefficient module. -/
def IsCtf (K : EtaleDerived Λ X) : Prop := IsConstructibleComplex K ∧
  ∃ a b : ℤ, ∀ (x : GeometricPoint X) (M : ModuleCat.{u} Λ) (q : ℤ),
    q < a ∨ b < q → IsZero ((DerivedCategory.homologyFunctor _ q).obj
      (((moduleDerivedTensor.obj ((EtaleDerived.stalk x).obj K)).obj
        ((DerivedCategory.singleFunctor _ 0).obj M))))

lemma isConstructibleComplex_shift (K : EtaleDerived Λ X) (m : ℤ) :
    (IsConstructibleComplex K ↔ IsConstructibleComplex (K⟦m⟧)) ∧
      (IsCtf K ↔ IsCtf (K⟦m⟧)) := sorry

lemma isConstructibleComplex_of_triangle (T : Pretriangulated.Triangle (EtaleDerived Λ X))
    (hT : T ∈ distTriang _) :
    (IsConstructibleComplex T.obj₁ → IsConstructibleComplex T.obj₂ →
      IsConstructibleComplex T.obj₃) ∧
    (IsConstructibleComplex T.obj₂ → IsConstructibleComplex T.obj₃ →
      IsConstructibleComplex T.obj₁) ∧
    (IsConstructibleComplex T.obj₁ → IsConstructibleComplex T.obj₃ →
      IsConstructibleComplex T.obj₂) := sorry

/-- The finite common stratification, including local constancy, is essential. -/
lemma isConstructibleComplex_iff_stalk [IsNoetherian X] (K : EtaleDerived Λ X) :
    IsConstructibleComplex K ↔ IsBoundedComplex K ∧
      ∃ (r : ℕ) (Z : Fin r → Scheme.{u}) (i : ∀ a, Z a ⟶ X),
        (∀ a, LocallyClosedImmersion (i a)) ∧
        (∀ x : X, ∃! a, x ∈ Set.range (i a).base) ∧
        ∀ a q, IsLisseSheaf ((sheafPullback (i a)).obj
          ((DerivedCategory.homologyFunctor _ q).obj K)) := sorry

lemma IsCtf.tensor {K L : EtaleDerived Λ X} (hK : IsCtf K) :
    (IsCtf L → IsCtf (((derivedTensor X).obj K).obj L)) ∧
      (IsConstructibleComplex L →
        IsConstructibleComplex (((derivedTensor X).obj K).obj L)) := sorry

lemma IsConstructibleComplex.pullback (f : Y ⟶ X) {K : EtaleDerived Λ X} :
    (IsConstructibleComplex K → IsConstructibleComplex ((pullback f).obj K)) ∧
      (IsCtf K → IsCtf ((pullback f).obj K)) := sorry

lemma IsConstructibleComplex.lowerShriek [TorsionCoefficients Λ]
    (f : X ⟶ Y) [Compactifiable f] [IsNoetherian X] [IsNoetherian Y]
    [IsNoetherianRing Λ] {K : EtaleDerived Λ X} :
    (IsConstructibleComplex K → IsConstructibleComplex ((lowerShriek f).obj K)) ∧
      (IsCtf K → IsCtf ((lowerShriek f).obj K)) := sorry

/-- Test `isCtf_constant`. -/
example [IsNoetherian X] : IsCtf (EtaleDerived.constant (Λ := Λ) X) := sorry

/-- Test `not_isCtf_reduction`: the entire constant complex, not only module nonflatness. -/
example (Ω : Type) [Field Ω] [IsAlgClosed Ω] :
    letI : Module (ZMod 4) (ZMod 2) := Module.compHom (ZMod 2) (ZMod.castHom (by decide) (ZMod 2))
    let K := (DerivedCategory.singleFunctor _ 0).obj
      ((constantSheaf (Spec (CommRingCat.of Ω)).smallEtaleTopology (ModuleCat (ZMod 4))).obj
        (ModuleCat.of (ZMod 4) (ZMod 2)))
    IsConstructibleComplex K ∧ ¬ IsCtf K := sorry

/-- The actual infinite coproduct of point-supported sheaves. -/
def infiniteSkyscrapers {Ω : Type u} [Field Ω] (p : ℕ → (Spec (CommRingCat.of Ω) ⟶ X)) :
    EtaleSheaf Λ X := sorry

/-- Test `not_isConstructible_infinite_skyscrapers`. -/
example [Nontrivial Λ] (Ω : Type u) [Field Ω] [IsAlgClosed Ω]
    (p : ℕ → (Spec (CommRingCat.of Ω) ⟶ 𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of Ω))))
    (hp : ∀ a, IsClosedImmersion (p a))
    (hinj : ∀ a b, a ≠ b → Disjoint (Set.range (p a).base) (Set.range (p b).base)) :
    ¬ IsConstructibleSheaf (infiniteSkyscrapers (Λ := Λ) p) := sorry

/-- Test `isConstructible_zero`. -/
example : IsCtf (0 : EtaleDerived Λ X) ∧
    (IsEmpty X → ∀ K : EtaleDerived Λ X, IsCtf K) := sorry
end Constructible

/-! Actual fibres, local multiplicities and the dimension hypothesis used by traces. -/
def geometricFibre {X S : Scheme.{u}} (f : X ⟶ S) (s : GeometricPoint S) : Scheme.{u} :=
  CategoryTheory.Limits.pullback f s.pt

/-- SGA 4 XVIII (∗)d, written out rather than replaced by a new uninterpreted proposition. -/
class TraceDimension {X S : Scheme.{u}} (f : X ⟶ S) (d : ℕ) : Prop where
  flat_dense_part : ∃ (U : Scheme.{u}) (j : U ⟶ X), IsOpenImmersion j ∧
    Flat (j ≫ f) ∧ LocallyOfFinitePresentation (j ≫ f) ∧
    (∀ s : S, Order.krullDim {x : U // (j ≫ f).base x=s} ≤ d) ∧
    (∀ s : S, Order.krullDim {x : X // f.base x=s ∧ x ∉ Set.range j.base} < d)

/-- SGA XVIII 1.1.2: flat finitely presented curves have pure one-dimensional geometric
fibres; an empty fibre is allowed. This spells out the geometric hypothesis. -/
class FlatCurve {X S : Scheme.{u}} (f : X ⟶ S) : Prop extends
    Flat f, LocallyOfFinitePresentation f where
  pure_fibres : ∀ (s : GeometricPoint S) (Z : Set (geometricFibre f s)),
    Z ∈ irreducibleComponents (geometricFibre f s) → Order.krullDim Z=1

instance flatCurve_smooth {X S : Scheme.{u}} (f : X ⟶ S)
    [SmoothOfRelativeDimension 1 f] : FlatCurve f := sorry

instance traceDimension_smooth {X S : Scheme.{u}} (f : X ⟶ S) (d : ℕ)
    [SmoothOfRelativeDimension d f] : TraceDimension f d := sorry
instance traceDimension_affine (S : Scheme.{u}) (d : ℕ) :
    TraceDimension (𝔸(ULift.{u} (Fin d); S) ↘ S) d := sorry
instance traceDimension_finiteFlat {X S : Scheme.{u}} (f : X ⟶ S)
    [IsFinite f] [Flat f] [LocallyOfFinitePresentation f] : TraceDimension f 0 := sorry

/-- SF.5: length of the Artinian local ring at a generic point of a geometric fibre component. -/
def fibreMultiplicity {X S : Scheme.{u}} (f : X ⟶ S) (s : GeometricPoint S)
    (x : geometricFibre f s) : ℕ := sorry

/-- Exactly the top-dimensional irreducible components of the geometric fibre. -/
def topFibreComponents {X S : Scheme.{u}} (f : X ⟶ S) (s : GeometricPoint S) (d : ℕ) :
    Set (Set (geometricFibre f s)) :=
  {Z | Z ∈ irreducibleComponents (geometricFibre f s) ∧ Order.krullDim Z=d}

/-- SF.5's generic multiplicity of an irreducible fibre component (independent of its presentation). -/
def componentMultiplicity {X S : Scheme.{u}} (f : X ⟶ S) (s : GeometricPoint S)
    (Z : Set (geometricFibre f s)) : ℕ := sorry

def stalkCohomology {Λ : Type u} [CommRing Λ] {X : Scheme.{u}}
    (s : GeometricPoint X) (q : ℤ) (K : EtaleDerived Λ X) : ModuleCat.{u} Λ :=
  (DerivedCategory.homologyFunctor _ q).obj ((EtaleDerived.stalk s).obj K)

/-- SF.2 arithmetic descent: inverse of x↦x^q acts on a geometric stalk over Fq. -/
def geometricFrobeniusOnStalk {Λ : Type} [CommRing Λ] {p r : ℕ} [Fact p.Prime]
    (hr : r ≠ 0) (x : GeometricPoint (Spec (CommRingCat.of (GaloisField p r))))
    (q : ℤ) (K : EtaleDerived Λ (Spec (CommRingCat.of (GaloisField p r)))) :
    stalkCohomology x q K ≃ₗ[Λ] stalkCohomology x q K := sorry

/-! ## EDC.0 — Tate twists (node `EDC.0/tate-twist`) -/

section Tate

variable {Λ : Type u} [CommRing Λ] [TorsionCoefficients Λ]

/-- `Λ(1) = μ_n ⊗ Λ` on `X`, for `n` invertible on `X` and `nΛ = 0`. -/
def tateTwistSheaf (n : ℕ) [NeZero n] (X : Scheme.{u}) (hX : IsUnit ((n : Γ(X, ⊤))))
    (hΛ : (n : Λ) = 0) : EtaleSheaf Λ X := sorry

/-- `K ↦ K(i)`. -/
def tateTwist (n : ℕ) [NeZero n] (X : Scheme.{u}) (hX : IsUnit ((n : Γ(X, ⊤))))
    (hΛ : (n : Λ) = 0) (i : ℤ) : EtaleDerived Λ X ⥤ EtaleDerived Λ X := sorry

variable (n : ℕ) [NeZero n] (hΛ : (n : Λ) = 0)

def tateTwistZeroIso (X : Scheme.{u}) (hX : IsUnit ((n : Γ(X, ⊤)))) :
    tateTwist n X hX hΛ 0 ≅ 𝟭 _ := sorry

def tateTwistAddIso (X : Scheme.{u}) (hX : IsUnit ((n : Γ(X, ⊤)))) (i j : ℤ) :
    tateTwist n X hX hΛ i ⋙ tateTwist n X hX hΛ j ≅ tateTwist n X hX hΛ (i + j) := sorry

def tateTwist_pullback {X S : Scheme.{u}} (f : X ⟶ S) (hX : IsUnit ((n : Γ(X, ⊤))))
    (hS : IsUnit ((n : Γ(S, ⊤)))) (i : ℤ) :
    tateTwist n S hS hΛ i ⋙ pullback f ≅ pullback f ⋙ tateTwist n X hX hΛ i := sorry

def tateTwist_shift (X : Scheme.{u}) (hX : IsUnit ((n : Γ(X, ⊤)))) (i m : ℤ) :
    tateTwist n X hX hΛ i ⋙ shiftFunctor _ m ≅ shiftFunctor _ m ⋙ tateTwist n X hX hΛ i := sorry

lemma tateTwistSheaf_iso_of_sepClosed (Ω : Type u) [Field Ω] [IsSepClosed Ω]
    (hX : IsUnit ((n : Γ(Spec (CommRingCat.of Ω), ⊤)))) :
    Nonempty (tateTwistSheaf n _ hX hΛ ≅
      (constantSheaf _ (ModuleCat.{u} Λ)).obj (ModuleCat.of Λ Λ)) := sorry

/-- Test `tateTwist_sepClosed_trivial`. -/
example (Ω : Type u) [Field Ω] [IsSepClosed Ω] (hX : IsUnit ((n : Γ(Spec (CommRingCat.of Ω), ⊤)))) :
    Nonempty (tateTwistSheaf n _ hX hΛ ≅
      (constantSheaf _ (ModuleCat.{u} Λ)).obj (ModuleCat.of Λ Λ)) := sorry

/-- Test `tateTwist_zero`. -/
example (X : Scheme.{u}) (hX : IsUnit ((n : Γ(X, ⊤)))) :
    Nonempty (tateTwist n X hX hΛ 0 ≅ 𝟭 _) := sorry

/-- Test `not_tateTwist_trivial_F2`: over `𝔽_2` with `n = 3`, `Λ = ℤ/3`, `Λ(1) ≇ Λ`. -/
example (hX : IsUnit ((3 : ℕ) : Γ(Spec (CommRingCat.of (GaloisField 2 1)), ⊤))) :
    ¬ Nonempty (tateTwistSheaf (Λ := ZMod 3) 3 _ hX (by decide) ≅
      (constantSheaf _ (ModuleCat (ZMod 3))).obj (ModuleCat.of (ZMod 3) (ZMod 3))) := sorry

/-- Arithmetic descent acts on the twist by the inverse cyclotomic character. -/
lemma tateTwist_geomFrobenius {R : Type} [CommRing R] [TorsionCoefficients R]
    {p r : ℕ} [Fact p.Prime] (hr : r≠0) (N : ℕ) [NeZero N] (hR : (N : R)=0)
    (hX : IsUnit (N : Γ(Spec (CommRingCat.of (GaloisField p r)), ⊤))) (i : ℤ)
    (hq : IsUnit (p^r : R)) (x : GeometricPoint (Spec (CommRingCat.of (GaloisField p r))))
    (v : stalkCohomology x 0 ((tateTwist N _ hX hR i).obj (EtaleDerived.constant _))) :
    geometricFrobeniusOnStalk hr x 0 _ v=((hq.unit ^ (-i) : Rˣ) : R) • v := sorry

/-- Test `tateTwist_frobenius_eigenvalue`: F₂ geometric Frobenius is multiplication by 2 on Z/3(1). -/
example (hX : IsUnit (3 : Γ(Spec (CommRingCat.of (GaloisField 2 1)), ⊤)))
    (x : GeometricPoint (Spec (CommRingCat.of (GaloisField 2 1))))
    (v : stalkCohomology x 0 ((tateTwist (Λ := ZMod 3) 3 _ hX (by decide) 1).obj
      (EtaleDerived.constant _))) :
    geometricFrobeniusOnStalk (by decide : (1 : ℕ)≠0) x 0 _ v=(2 : ZMod 3) • v := sorry

end Tate

/-! ## EDC.0 — derived tensor and internal Hom (node `EDC.0/derived-tensor-and-internal-hom`) -/

/-- Node `EDC.0/derived-tensor-and-internal-hom`: `⊗^L ⊣ RHom`. -/
theorem derivedTensor_internalHom_adjunction {Λ : Type u} [CommRing Λ] [TorsionCoefficients Λ] (X : Scheme.{u})
    (L : EtaleDerived Λ X) :
    Nonempty ((derivedTensor X).flip.obj L ⊣ (internalHom X).obj (Opposite.op L)) := sorry

/-! ## EDC.0 — cohomology with supports (node `EDC.0/cohomology-with-supports`) -/

section Supports

variable {Λ : Type u} [CommRing Λ] [TorsionCoefficients Λ] {Z X U : Scheme.{u}}

/-- `i^!` on sheaves: sections supported on `Z`. -/
def supportSections (i : Z ⟶ X) [IsClosedImmersion i] : EtaleSheaf Λ X ⥤ EtaleSheaf Λ Z := sorry

def supportAdjunction (i : Z ⟶ X) [IsClosedImmersion i] : sheafPushforward (Λ := Λ) i ⊣ supportSections i := sorry

/-- `Ri^!`. -/
def derivedSupport (i : Z ⟶ X) [IsClosedImmersion i] : EtaleDerived Λ X ⥤ EtaleDerived Λ Z := sorry

/-- Closed-immersion derived adjunction, from exact i_* and its support right adjoint. -/
def derivedSupportAdjunction (i : Z ⟶ X) [IsClosedImmersion i] :
    pushforward (Λ := Λ) i ⊣ derivedSupport i := sorry

/-- The connecting map of the derived support/open restriction short exact sequence. -/
def localizationConnecting (i : Z ⟶ X) [IsClosedImmersion i]
    (j : U ⟶ X) [IsOpenImmersion j] [QuasiCompact j]
    (hc : Set.range j.base=(Set.range i.base)ᶜ) (K : EtaleDerived Λ X) :
    (pushforward j).obj ((pullback j).obj K) ⟶
      ((pushforward i).obj ((derivedSupport i).obj K))⟦(1 : ℤ)⟧ := sorry

/-- The vertices and the two adjunction maps are part of the definition. -/
def localizationTriangle (i : Z ⟶ X) [IsClosedImmersion i]
    (j : U ⟶ X) [IsOpenImmersion j] [QuasiCompact j]
    (hc : Set.range j.base=(Set.range i.base)ᶜ) (K : EtaleDerived Λ X) :
    Pretriangulated.Triangle (EtaleDerived Λ X) :=
  Pretriangulated.Triangle.mk ((derivedSupportAdjunction i).counit.app K)
    ((pullbackPushforwardAdjunction j).unit.app K) (localizationConnecting i j hc K)

lemma localizationTriangle_distinguished (i : Z ⟶ X) [IsClosedImmersion i] (j : U ⟶ X) [IsOpenImmersion j] [QuasiCompact j]
    (hc : Set.range j.base = (Set.range i.base)ᶜ) (K : EtaleDerived Λ X) :
    localizationTriangle i j hc K ∈ distTriang (EtaleDerived Λ X) := sorry

/-- `H^q_Z(X, K)`. -/
def cohomologyWithSupports (i : Z ⟶ X) [IsClosedImmersion i] (q : ℤ) (K : EtaleDerived Λ X) : ModuleCat.{u} Λ :=
  cohomologyModule q ((derivedSupport i).obj K)

/-- Forgetting supports and restricting to the complement. -/
def forgetSupports (i : Z ⟶ X) [IsClosedImmersion i] (q : ℤ) (K : EtaleDerived Λ X) :
    cohomologyWithSupports i q K ⟶ cohomologyModule q K := sorry

def restrictToOpen (j : U ⟶ X) [IsOpenImmersion j] [QuasiCompact j] (q : ℤ) (K : EtaleDerived Λ X) :
    cohomologyModule q K ⟶ cohomologyModule q ((pullback j).obj K) := sorry

def supportBoundary (i : Z ⟶ X) [IsClosedImmersion i]
    (j : U ⟶ X) [IsOpenImmersion j] [QuasiCompact j]
    (hc : Set.range j.base=(Set.range i.base)ᶜ) (q : ℤ) (K : EtaleDerived Λ X) :
    cohomologyModule q ((pullback j).obj K) ⟶ cohomologyWithSupports i (q+1) K := sorry

lemma cohomologyWithSupports_exact (i : Z ⟶ X) [IsClosedImmersion i]
    (j : U ⟶ X) [IsOpenImmersion j] [QuasiCompact j]
    (hc : Set.range j.base=(Set.range i.base)ᶜ) (q : ℤ) (K : EtaleDerived Λ X) :
    Function.Exact (forgetSupports i q K) (restrictToOpen j q K) ∧
    Function.Exact (restrictToOpen j q K) (supportBoundary i j hc q K) ∧
    Function.Exact (supportBoundary i j hc q K) (forgetSupports i (q+1) K) := sorry

lemma cohomologyWithSupports_excision (i : Z ⟶ X) [IsClosedImmersion i] {X' : Scheme.{u}} (φ : X' ⟶ X) [Etale φ] (i' : Z ⟶ X')
    [IsClosedImmersion i'] (hsq : IsPullback (𝟙 Z) i' i φ) (q : ℤ) (K : EtaleDerived Λ X) :
    Nonempty (cohomologyWithSupports i q K ≅ cohomologyWithSupports i' q ((pullback φ).obj K)) :=
  sorry

lemma derivedSupport_reduced (i : Z ⟶ X) [IsClosedImmersion i] {Z' : Scheme.{u}} (t : Z' ⟶ Z) [IsClosedImmersion t]
    [IsClosedImmersion (t ≫ i)] (ht : Function.Surjective t.base) :
    Nonempty (derivedSupport (Λ := Λ) (t ≫ i) ≅ derivedSupport i ⋙ pullback t) := sorry

/-- Test `cohomologyWithSupports_self`. -/
example (K : EtaleDerived Λ X) (q : ℤ) :
    Nonempty (cohomologyWithSupports (𝟙 X) q K ≅ cohomologyModule q K) := sorry

/-- Test `cohomologyWithSupports_empty`. -/
example (i : Z ⟶ X) [IsClosedImmersion i] [IsEmpty Z] (K : EtaleDerived Λ X) (q : ℤ) : IsZero (cohomologyWithSupports i q K) :=
  sorry

/-- Test `cohomologyWithSupports_origin_line`: the origin of `𝔸¹_Ω`, `Λ = ℤ/n`, twist `(1)`
appears through `tateTwist`; `H²_{0} ≅ Λ` and the other degrees vanish. -/
example (Ω : Type u) [Field Ω] [IsAlgClosed Ω] (n : ℕ) [NeZero n] (hΛ : (n : Λ) = 0)
    (o : Spec (CommRingCat.of Ω) ⟶ 𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of Ω)))
    [IsClosedImmersion o] (ho : o ≫ (𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of Ω)) ↘
      Spec (CommRingCat.of Ω)) = 𝟙 _)
    (hX : IsUnit ((n : Γ(𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of Ω)), ⊤)))) :
    Nonempty (cohomologyWithSupports o 2 ((tateTwist (Λ := Λ) n _ hX hΛ 1).obj
        (EtaleDerived.constant _)) ≅ ModuleCat.of Λ Λ) ∧
      ∀ q ≠ (2 : ℤ), IsZero (cohomologyWithSupports o q
        ((tateTwist (Λ := Λ) n _ hX hΛ 1).obj (EtaleDerived.constant _))) := sorry

/-- Test `not_cohomologyWithSupports_eq_cohomology_of_support`. -/
example [Nontrivial Λ] (Ω : Type u) [Field Ω] [IsAlgClosed Ω]
    (o : Spec (CommRingCat.of Ω) ⟶ 𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of Ω)))
    [IsClosedImmersion o] :
    IsZero (cohomologyWithSupports (Λ := Λ) o 0 (EtaleDerived.constant _)) ∧
      ¬ IsZero (cohomologyModule (Λ := Λ) 0
        (EtaleDerived.constant (Spec (CommRingCat.of Ω)))) := sorry

end Supports

/-! ## EDC.0 — change of coefficients (node `EDC.0/coefficient-change`) -/

section Coefficients

variable {Λ Λ' Λ'' : Type u} [CommRing Λ] [TorsionCoefficients Λ] [CommRing Λ'] [CommRing Λ''] {X S : Scheme.{u}}

def restrictScalars (φ : Λ →+* Λ') (X : Scheme.{u}) : EtaleDerived Λ' X ⥤ EtaleDerived Λ X :=
  sorry

def extendScalars (φ : Λ →+* Λ') (X : Scheme.{u}) : EtaleDerived Λ X ⥤ EtaleDerived Λ' X :=
  sorry

def extendRestrictAdjunction (φ : Λ →+* Λ') (X : Scheme.{u}) :
    extendScalars φ X ⊣ restrictScalars φ X := sorry

def restrictScalars_lowerShriek (φ : Λ →+* Λ') (f : X ⟶ S) [Compactifiable f] :
    restrictScalars φ X ⋙ lowerShriek f ≅ lowerShriek f ⋙ restrictScalars φ S := sorry

def extendScalars_lowerShriek (φ : Λ →+* Λ') (f : X ⟶ S) [Compactifiable f] :
    extendScalars φ X ⋙ lowerShriek f ≅ lowerShriek f ⋙ extendScalars φ S := sorry

def restrictScalars_derivedSupport (φ : Λ →+* Λ') {Z : Scheme.{u}} (i : Z ⟶ X)
    [IsClosedImmersion i] :
    restrictScalars φ X ⋙ derivedSupport i ≅ derivedSupport i ⋙ restrictScalars φ Z := sorry

def restrictScalars_comp (φ : Λ →+* Λ') (ψ : Λ' →+* Λ'') (X : Scheme.{u}) :
    restrictScalars (ψ.comp φ) X ≅ restrictScalars ψ X ⋙ restrictScalars φ X := sorry

/-- Test `extendScalars_id`. -/
example (X : Scheme.{u}) : Nonempty (extendScalars (RingHom.id Λ) X ≅ 𝟭 _) := sorry

/-- Test `extendScalars_reduction_unbounded` (`ℓ = 2`). -/
example (X : Scheme.{0}) [Nonempty X] (q : ℕ) :
    ¬ IsZero ((DerivedCategory.homologyFunctor _ (-(q : ℤ))).obj
      ((extendScalars (ZMod.castHom (by decide : 2 ∣ 4) (ZMod 2)) X).obj
        ((restrictScalars (ZMod.castHom (by decide : 2 ∣ 4) (ZMod 2)) X).obj
          (EtaleDerived.constant X)))) := sorry

/-- Test `restrictScalars_constant`. -/
example (φ : Λ →+* Λ') (X : Scheme.{u}) :
    Nonempty ((restrictScalars φ X).obj (EtaleDerived.constant X) ≅
      (DerivedCategory.singleFunctor _ 0).obj ((constantSheaf X.smallEtaleTopology
        (ModuleCat.{u} Λ)).obj ((ModuleCat.restrictScalars φ).obj (ModuleCat.of Λ' Λ')))) := sorry

/-- Test `not_extendScalars_underived_exact`: tensoring the injection `ℤ →·ℓ ℤ` with `ℤ/ℓ`
(`ℓ = 2`) is not injective. -/
example : ¬ Function.Injective
    (LinearMap.lTensor (ZMod 2) ((2 : ℤ) • LinearMap.id : ℤ →ₗ[ℤ] ℤ)) := sorry

end Coefficients

/-! ## EDC.0 — enhancement imports and the compactification construction
The E1/E3 definitions below are imported DATA, not additional EDC targets. The stable/presentable
conditions belong to E1. Colimits below are infinity-categorical colimits, represented in the
homotopy category; they are not ordinary colimits of a triangulated category.
-/
section Enhancement
variable {Λ : Type u} [CommRing Λ] [TorsionCoefficients Λ] {X Y S : Scheme.{u}}

/-- E1's simplicial localization of complexes at quasi-isomorphisms. -/
def enhancedDerived (Λ : Type u) [CommRing Λ] (X : Scheme.{u}) : SimplicialObject (Type (u + 2)) := sorry

/-- E3's enhanced functor, with its homotopy functor displayed for comparisons. -/
structure EnhancedFunctor (Λ : Type u) [CommRing Λ] (X S : Scheme.{u}) where
  map : enhancedDerived (Λ := Λ) X ⟶ enhancedDerived (Λ := Λ) S
  homotopy : EtaleDerived Λ X ⥤ EtaleDerived Λ S

/-- Imported E3 composition. -/
def EnhancedFunctor.comp (F : EnhancedFunctor (Λ := Λ) X Y)
    (G : EnhancedFunctor (Λ := Λ) Y S) : EnhancedFunctor (Λ := Λ) X S :=
  ⟨F.map ≫ G.map, F.homotopy ⋙ G.homotopy⟩

/-- E3's space of coherent natural equivalences, not merely a homotopy-category isomorphism. -/
def EnhancedNatIso (F G : EnhancedFunctor (Λ := Λ) X S) : Type (u + 2) := sorry

/-- E1's colimit vertex, viewed under its homotopy-category equivalence with D(X,Λ). -/
def enhancedColimitObj {J : SimplicialObject (Type (u + 2))}
    (D : J ⟶ enhancedDerived (Λ := Λ) X) : EtaleDerived Λ X := sorry

/-- The canonical comparison from the image of an enhanced colimit to the colimit of the image. -/
def enhancedColimitComparison (F : EnhancedFunctor (Λ := Λ) X S)
    {J : SimplicialObject (Type (u + 2))} (D : J ⟶ enhancedDerived (Λ := Λ) X) :
    F.homotopy.obj (enhancedColimitObj D) ⟶ enhancedColimitObj (D ≫ F.map) := sorry

/-- Imported enhanced exact pullback. -/
def enhancedPullback (g : Y ⟶ X) : EnhancedFunctor (Λ := Λ) X Y := sorry

/-- Coherent compactification descent, node `EDC.0/enhanced-compact-pushforward`. -/
def enhancedLowerShriek (f : X ⟶ S) [Compactifiable f] :
    EnhancedFunctor (Λ := Λ) X S := sorry

lemma enhancedLowerShriek_homotopy (f : X ⟶ S) [Compactifiable f] :
    Nonempty ((enhancedLowerShriek (Λ := Λ) f).homotopy ≅ lowerShriek f) := sorry

lemma enhancedLowerShriek_preservesColimits (f : X ⟶ S) [Compactifiable f]
    {J : SimplicialObject (Type (u + 2))} (D : J ⟶ enhancedDerived (Λ := Λ) X) :
    IsIso (enhancedColimitComparison (enhancedLowerShriek f) D) := sorry

lemma enhancedLowerShriek_comp (h : X ⟶ Y) (g : Y ⟶ S)
    [Compactifiable h] [Compactifiable g] [Compactifiable (h ≫ g)] :
    Nonempty (EnhancedNatIso (enhancedLowerShriek (Λ := Λ) (h ≫ g))
      ((enhancedLowerShriek h).comp (enhancedLowerShriek g))) := sorry

lemma enhancedLowerShriek_baseChange {X' S' : Scheme.{u}}
    {f : X ⟶ S} {g : S' ⟶ S} {f' : X' ⟶ S'} {g' : X' ⟶ X}
    (sq : IsPullback g' f' f g) [Compactifiable f] [Compactifiable f'] :
    Nonempty (EnhancedNatIso
      ((enhancedLowerShriek (Λ := Λ) f).comp (enhancedPullback g))
      ((enhancedPullback g').comp (enhancedLowerShriek f'))) := sorry
end Enhancement

section LowerShriek

variable {Λ : Type u} [CommRing Λ] [TorsionCoefficients Λ] {X S : Scheme.{u}} [CompactSpace X] [QuasiSeparatedSpace X] [CompactSpace S] [QuasiSeparatedSpace S]

/-- `lowerShriek_openImmersion`: `Rj_!` is extension by zero, left adjoint to `j^*`. -/
lemma lowerShriek_openImmersion (j : X ⟶ S) [IsOpenImmersion j] [QuasiCompact j] :
    Nonempty (lowerShriek (Λ := Λ) j ⊣ pullback j) := sorry

lemma lowerShriek_proper (f : X ⟶ S) [IsProper f] :
    Nonempty (lowerShriek (Λ := Λ) f ≅ pushforward f) := sorry

/-- Test `lowerShriek_openImmersion_stalk`. -/
example (j : X ⟶ S) [IsOpenImmersion j] [QuasiCompact j] (s : GeometricPoint S)
    (hs : ∀ y, s.pt.base y ∉ Set.range j.base) (K : EtaleDerived Λ X) :
    IsZero ((EtaleDerived.stalk s).obj ((lowerShriek j).obj K)) := sorry

/-- Test `lowerShriek_finiteEtale`. -/
example (f : X ⟶ S) [IsFinite f] [Etale f] (F : EtaleSheaf Λ X) (q : ℤ) (hq : q ≠ 0) :
    IsZero ((DerivedCategory.homologyFunctor _ q).obj
      ((lowerShriek f).obj ((DerivedCategory.singleFunctor _ 0).obj F))) := sorry

/-- Test `lowerShriek_affineLine`. -/
example (Ω : Type u) [Field Ω] [IsAlgClosed Ω] (n : ℕ) [NeZero n] (hΛ : (n : Λ) = 0)
    (hX : IsUnit ((n : Γ(𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of Ω)), ⊤)))) (q : ℤ) :
    (q = 2 → Nonempty ((DerivedCategory.homologyFunctor _ q).obj
      ((lowerShriek (𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of Ω)) ↘ Spec (CommRingCat.of Ω))).obj
        ((tateTwist (Λ := Λ) n _ hX hΛ 1).obj (EtaleDerived.constant _))) ≅
      (constantSheaf _ (ModuleCat.{u} Λ)).obj (ModuleCat.of Λ Λ))) ∧
    (q ≠ 2 → IsZero ((DerivedCategory.homologyFunctor _ q).obj
      ((lowerShriek (𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of Ω)) ↘ Spec (CommRingCat.of Ω))).obj
        ((tateTwist (Λ := Λ) n _ hX hΛ 1).obj (EtaleDerived.constant _))))) := sorry

/-- Node `EDC.0/compact-pushforward-amplitude-and-colimits` (a): `R^q f_! = 0` for `q > 2d`. -/
theorem lowerShriek_amplitude (f : X ⟶ S) [Compactifiable f] (d : ℕ)
    (hd : ∀ s : S, Order.krullDim (f.base ⁻¹' {s}) ≤ d) (F : EtaleSheaf Λ X) (q : ℤ)
    (hq : 2 * (d : ℤ) < q) :
    IsZero ((DerivedCategory.homologyFunctor _ q).obj
      ((lowerShriek f).obj ((DerivedCategory.singleFunctor _ 0).obj F))) := sorry

/-- Node `EDC.0/compact-pushforward-amplitude-and-colimits` (c): `Rf_!` commutes with direct sums
for torsion coefficients. -/
theorem lowerShriek_preservesCoproducts (f : X ⟶ S) [Compactifiable f]
    (n : ℕ) [NeZero n] (hΛ : (n : Λ) = 0) (ι : Type u) :
    PreservesColimitsOfShape (Discrete ι) (lowerShriek (Λ := Λ) f) := sorry

/-- SF.0 geometric fixture A¹ minus its rational origin. -/
def puncturedLine (k : Type u) [Field k] : Scheme.{u} := sorry
def puncturedLineInclusion (k : Type u) [Field k] :
    puncturedLine k ⟶ 𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of k)) := sorry
instance puncturedLine_open (k : Type u) [Field k] : IsOpenImmersion (puncturedLineInclusion k) := sorry
instance puncturedLine_qc (k : Type u) [Field k] : QuasiCompact (puncturedLineInclusion k) := sorry

/-- Test `not_lowerShriek_eq_pushforward`: j! has zero boundary stalk, Rj* has nonzero H⁰ there. -/
example [Nontrivial Λ] (k : Type u) [Field k] [IsSepClosed k] :
    ¬ Nonempty (lowerShriek (Λ := Λ) (puncturedLineInclusion k) ≅
      pushforward (puncturedLineInclusion k)) := sorry

end LowerShriek

/-! ## EDC.1:adjoint — the exceptional inverse image (node `EDC.1:adjoint/exceptional-inverse-image`) -/

section UpperShriek

variable {Λ : Type u} [CommRing Λ] [TorsionCoefficients Λ] {X Y S : Scheme.{u}} [CompactSpace X] [QuasiSeparatedSpace X] [CompactSpace Y] [QuasiSeparatedSpace Y] [CompactSpace S] [QuasiSeparatedSpace S]

/-- `f^!`, the right adjoint of `Rf_!` (produced by EnhancedDerivedSheaves E3). -/
def upperShriek (f : X ⟶ S) [Compactifiable f] :
    EtaleDerived Λ S ⥤ EtaleDerived Λ X := sorry

def lowerShriekUpperShriekAdjunction (f : X ⟶ S) [Compactifiable f] :
    lowerShriek (Λ := Λ) f ⊣ upperShriek f := sorry

/-- `f^!` commutes with shifts. -/
instance upperShriek_commShift (f : X ⟶ S) [Compactifiable f] :
    (upperShriek (Λ := Λ) f).CommShift ℤ := sorry

instance upperShriek_isTriangulated (f : X ⟶ S) [Compactifiable f] :
    (upperShriek (Λ := Λ) f).IsTriangulated := sorry

lemma upperShriek_id : Nonempty (upperShriek (Λ := Λ) (𝟙 X) ≅ 𝟭 _) := sorry

lemma upperShriek_etale (f : X ⟶ S) [Etale f] [Compactifiable f] :
    Nonempty (upperShriek (Λ := Λ) f ≅ pullback f) := sorry

lemma upperShriek_closedImmersion (i : X ⟶ S) [IsClosedImmersion i] :
    Nonempty (upperShriek (Λ := Λ) i ≅ derivedSupport i) := sorry

/-- `upperShriek_amplitude`: fibres of dimension `≤ d` shift lower bounds by `2d`. -/
lemma upperShriek_amplitude (f : X ⟶ S) [Compactifiable f] (d : ℕ)
    (hd : ∀ s : S, Order.krullDim (f.base ⁻¹' {s}) ≤ d) (L : EtaleDerived Λ S) (k : ℤ)
    (hL : ∀ q ≤ k, IsZero ((DerivedCategory.homologyFunctor _ q).obj L)) :
    ∀ q ≤ k - 2 * d, IsZero ((DerivedCategory.homologyFunctor _ q).obj ((upperShriek f).obj L)) :=
  sorry

/-- `upperShriek_quasiFinite`: for quasi-finite `f`, `f^!` is the derived functor of a sheaf-level
right adjoint `f^!₀` of the exact `f_!`. -/
lemma upperShriek_quasiFinite (f : X ⟶ S) [Compactifiable f]
    [LocallyQuasiFinite f] :
    ∃ G : EtaleSheaf Λ S ⥤ EtaleSheaf Λ X, ∀ F : EtaleSheaf Λ S,
      ∀ q : ℤ, q < 0 → IsZero ((DerivedCategory.homologyFunctor _ q).obj
        ((upperShriek f).obj ((DerivedCategory.singleFunctor _ 0).obj F))) ∧
      Nonempty ((DerivedCategory.homologyFunctor _ 0).obj
        ((upperShriek f).obj ((DerivedCategory.singleFunctor _ 0).obj F)) ≅ G.obj F) := sorry

/-- Test `upperShriek_id_eq`. -/
example : Nonempty (upperShriek (Λ := Λ) (𝟙 X) ≅ 𝟭 (EtaleDerived Λ X)) := sorry

/-- Test `upperShriek_openImmersion`. -/
example (j : X ⟶ S) [IsOpenImmersion j] [QuasiCompact j] : Nonempty (upperShriek (Λ := Λ) j ≅ pullback j) := sorry

/-- Test `upperShriek_point_line`: `i^!Λ ≅ Λ(−1)[−2]` for the origin of `𝔸¹_Ω`. -/
example (Ω : Type u) [Field Ω] [IsAlgClosed Ω] (n : ℕ) [NeZero n] (hΛ : (n : Λ) = 0)
    (o : Spec (CommRingCat.of Ω) ⟶ 𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of Ω)))
    [IsClosedImmersion o] (hX : IsUnit ((n : Γ(Spec (CommRingCat.of Ω), ⊤)))) :
    Nonempty ((upperShriek (Λ := Λ) o).obj (EtaleDerived.constant _) ≅
      ((tateTwist n _ hX hΛ (-1)).obj (EtaleDerived.constant _))⟦(-2 : ℤ)⟧) := sorry

/-- Test `not_upperShriek_eq_pullback_closed`. -/
example [Nontrivial Λ] (Ω : Type u) [Field Ω] [IsAlgClosed Ω]
    (o : Spec (CommRingCat.of Ω) ⟶ 𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of Ω)))
    [IsClosedImmersion o] :
    ¬ Nonempty ((upperShriek (Λ := Λ) o).obj (EtaleDerived.constant _) ≅
      (pullback o).obj (EtaleDerived.constant _)) := sorry

/-- Node `EDC.1:adjoint/upper-shriek-pseudofunctor`: `h^! g^! ≅ (gh)^!`. -/
theorem upperShriek_comp (h : X ⟶ Y) (g : Y ⟶ S) [Compactifiable h]
    [Compactifiable g] [Compactifiable (h ≫ g)] :
    Nonempty (upperShriek (Λ := Λ) g ⋙ upperShriek h ≅ upperShriek (h ≫ g)) := sorry

/-- Node `EDC.1:adjoint/sheafified-adjunction` (a):
`Rf_* RHom(L, f^!K) ≅ RHom(Rf_!L, K)`. -/
theorem sheafified_adjunction (f : X ⟶ S) [Compactifiable f]
    (n : ℕ) [NeZero n] (hΛ : (n : Λ) = 0) (L : EtaleDerived Λ X) (K : EtaleDerived Λ S) :
    Nonempty ((pushforward f).obj (((internalHom X).obj (Opposite.op L)).obj ((upperShriek f).obj K))
      ≅ ((internalHom S).obj (Opposite.op ((lowerShriek f).obj L))).obj K) := sorry

/-- Node `EDC.1:adjoint/local-cohomology-identification`. -/
theorem upperShriek_closedImmersion_eq_derivedSupport (i : X ⟶ S) [IsClosedImmersion i] :
    Nonempty (upperShriek (Λ := Λ) i ≅ derivedSupport i) := sorry

end UpperShriek

/-! ## EDC.1:adjoint — dualizing complex and Verdier dual -/

section Dualizing

variable {Λ : Type u} [CommRing Λ] [TorsionCoefficients Λ] {k : Type u} [Field k] {X V Z S : Scheme.{u}} [CompactSpace X] [QuasiSeparatedSpace X] [CompactSpace V] [QuasiSeparatedSpace V] [CompactSpace Z] [QuasiSeparatedSpace Z] [CompactSpace S] [QuasiSeparatedSpace S]

/-- `K_X = a^!Λ`. -/
def dualizingComplex (a : X ⟶ Spec (CommRingCat.of k)) [Compactifiable a] :
    EtaleDerived Λ X :=
  (upperShriek a).obj (EtaleDerived.constant _)

/-- `K_{X/S} = f^!Λ_S`. -/
def relativeDualizingComplex (f : X ⟶ S) [Compactifiable f] :
    EtaleDerived Λ X :=
  (upperShriek f).obj (EtaleDerived.constant _)

lemma dualizingComplex_spec :
    Nonempty (dualizingComplex (Λ := Λ) (𝟙 (Spec (CommRingCat.of k))) ≅ EtaleDerived.constant _) :=
  sorry

lemma dualizingComplex_etale (a : X ⟶ Spec (CommRingCat.of k)) [Compactifiable a] (u : V ⟶ X) [Etale u] [Compactifiable u]
    [Compactifiable (u ≫ a)] :
    Nonempty ((pullback u).obj (dualizingComplex (Λ := Λ) a) ≅ dualizingComplex (u ≫ a)) := sorry

lemma dualizingComplex_closedImmersion (a : X ⟶ Spec (CommRingCat.of k)) [Compactifiable a] (i : Z ⟶ X) [IsClosedImmersion i] [Compactifiable (i ≫ a)] :
    Nonempty ((upperShriek i).obj (dualizingComplex (Λ := Λ) a) ≅ dualizingComplex (i ≫ a)) :=
  sorry

lemma relativeDualizingComplex_comp {Y : Scheme.{u}} (h : X ⟶ Y) (g : Y ⟶ S) [Compactifiable h] [Compactifiable g] [Compactifiable (h ≫ g)] :
    Nonempty (relativeDualizingComplex (Λ := Λ) (h ≫ g) ≅
      (upperShriek h).obj (relativeDualizingComplex g)) := sorry

/-- Test `dualizingComplex_point`. -/
example : Nonempty (dualizingComplex (Λ := Λ) (𝟙 (Spec (CommRingCat.of k))) ≅
    EtaleDerived.constant _) := sorry

/-- Test `dualizingComplex_finiteSeparable`. -/
example (L : Type u) [Field L] [Algebra k L] [FiniteDimensional k L] [Algebra.IsSeparable k L]
    [Compactifiable (Spec.map (CommRingCat.ofHom (algebraMap k L)))] :
    Nonempty (dualizingComplex (Λ := Λ) (Spec.map (CommRingCat.ofHom (algebraMap k L))) ≅
      EtaleDerived.constant _) := sorry

/-- Test `dualizingComplex_curve`: a smooth curve over an algebraically closed field. -/
example [IsAlgClosed k] (n : ℕ) [NeZero n] (hΛ : (n : Λ) = 0) (a : X ⟶ Spec (CommRingCat.of k))
    [SmoothOfRelativeDimension 1 a] [Compactifiable a]
    (hX : IsUnit ((n : Γ(X, ⊤)))) :
    Nonempty (dualizingComplex (Λ := Λ) a ≅
      ((tateTwist n X hX hΛ 1).obj (EtaleDerived.constant X))⟦(2 : ℤ)⟧) := sorry

/-- Test `not_dualizingComplex_shift_of_constant`: on `Spec k ⊔ 𝔸¹_k` no single shift works. -/
example [IsAlgClosed k] [Nontrivial Λ] (n : ℕ) [NeZero n] (hΛ : (n : Λ) = 0)
    (a : X ⟶ Spec (CommRingCat.of k)) [Compactifiable a]
    (e : X ≅ Spec (CommRingCat.of k) ⨿ 𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of k)))
    (hX : IsUnit ((n : Γ(X, ⊤)))) :
    ∀ d : ℕ, ¬ Nonempty (dualizingComplex (Λ := Λ) a ≅
      ((tateTwist n X hX hΛ d).obj (EtaleDerived.constant X))⟦(2 * d : ℤ)⟧) := sorry

/-- `D_X = RHom(−, K_X)`. -/
def verdierDual (a : X ⟶ Spec (CommRingCat.of k)) [Compactifiable a] :
    (EtaleDerived Λ X)ᵒᵖ ⥤ EtaleDerived Λ X :=
  (internalHom X).flip.obj (dualizingComplex a)

variable (a : X ⟶ Spec (CommRingCat.of k)) [Compactifiable a]

lemma verdierDual_shift (K : EtaleDerived Λ X) (m : ℤ) :
    Nonempty ((verdierDual a).obj (Opposite.op (K⟦m⟧)) ≅ ((verdierDual a).obj (Opposite.op K))⟦-m⟧) :=
  sorry

lemma verdierDual_constant :
    Nonempty ((verdierDual (Λ := Λ) a).obj (Opposite.op (EtaleDerived.constant X)) ≅
      dualizingComplex a) := sorry

lemma verdierDual_tensor (K L : EtaleDerived Λ X) :
    Nonempty ((verdierDual a).obj (Opposite.op (((derivedTensor X).obj K).obj L)) ≅
      ((internalHom X).obj (Opposite.op K)).obj ((verdierDual a).obj (Opposite.op L))) := sorry

/-- `ev_K : K → D D K`. -/
def verdierDualEval (K : EtaleDerived Λ X) :
    K ⟶ (verdierDual a).obj (Opposite.op ((verdierDual a).obj (Opposite.op K))) := sorry

lemma verdierDual_etale (u : V ⟶ X) [Etale u] [Compactifiable u]
    [Compactifiable (u ≫ a)] (K : EtaleDerived Λ X) :
    Nonempty ((pullback u).obj ((verdierDual a).obj (Opposite.op K)) ≅
      (verdierDual (u ≫ a)).obj (Opposite.op ((pullback u).obj K))) := sorry

/-- Test `verdierDual_point`: over an algebraically closed field, `D(M) = Hom(M, ℤ/n)`. -/
example [IsAlgClosed k] [Module.Injective Λ Λ] (M : ModuleCat.{u} Λ) [Module.Finite Λ M] :
    Nonempty ((verdierDual (Λ := Λ) (𝟙 (Spec (CommRingCat.of k)))).obj
      (Opposite.op ((DerivedCategory.singleFunctor _ 0).obj
        ((constantSheaf _ (ModuleCat.{u} Λ)).obj M))) ≅
      (DerivedCategory.singleFunctor _ 0).obj ((constantSheaf _ (ModuleCat.{u} Λ)).obj
        (ModuleCat.of Λ (M →ₗ[Λ] Λ)))) := sorry

/-- Test `verdierDual_zero`. -/
example (K : EtaleDerived Λ X) (hK : IsZero K) :
    IsZero ((verdierDual a).obj (Opposite.op K)) := sorry

/-- Test `verdierDual_smoothCurve_constant`. -/
example [IsAlgClosed k] (n : ℕ) [NeZero n] (hΛ : (n : Λ) = 0) [SmoothOfRelativeDimension 1 a]
    (hX : IsUnit ((n : Γ(X, ⊤)))) :
    Nonempty ((verdierDual (Λ := Λ) a).obj (Opposite.op (EtaleDerived.constant X)) ≅
      ((tateTwist n X hX hΛ 1).obj (EtaleDerived.constant X))⟦(2 : ℤ)⟧) := sorry

/-- Test `not_verdierDual_eq_linearDual`. -/
example [IsAlgClosed k] [Nontrivial Λ] [SmoothOfRelativeDimension 1 a] [Nonempty X] :
    ¬ Nonempty ((verdierDual (Λ := Λ) a).obj (Opposite.op (EtaleDerived.constant X)) ≅
      ((internalHom X).obj (Opposite.op (EtaleDerived.constant X))).obj
        (EtaleDerived.constant X)) := sorry

/-- Node `EDC.1:adjoint/formal-duality-exchange` (a): `D_S Rf_! ≅ Rf_* D_X`. -/
theorem verdierDual_lowerShriek {Y : Scheme.{u}} (b : Y ⟶ Spec (CommRingCat.of k)) [Compactifiable b] (f : X ⟶ Y) [Compactifiable f] (h : f ≫ b = a)
    (L : EtaleDerived Λ X) :
    Nonempty ((verdierDual b).obj (Opposite.op ((lowerShriek f).obj L)) ≅
      (pushforward f).obj ((verdierDual a).obj (Opposite.op L))) := sorry

/-- Node `EDC.1:adjoint/formal-duality-exchange` (b): `D_X f^* ≅ f^! D_Y`. -/
theorem verdierDual_pullback {Y : Scheme.{u}} (b : Y ⟶ Spec (CommRingCat.of k)) [Compactifiable b] (f : X ⟶ Y) [Compactifiable f] (h : f ≫ b = a)
    (K : EtaleDerived Λ Y) :
    Nonempty ((verdierDual a).obj (Opposite.op ((pullback f).obj K)) ≅
      (upperShriek f).obj ((verdierDual b).obj (Opposite.op K))) := sorry

end Dualizing

/-! ## EDC.1:adjoint — exchange maps (node `EDC.1:adjoint/base-change-exchange-maps`) -/

section Exchange

variable {Λ : Type u} [CommRing Λ] [TorsionCoefficients Λ] {X S X' S' : Scheme.{u}}
  (f : X ⟶ S) (g : S' ⟶ S) (f' : X' ⟶ S') (g' : X' ⟶ X)
  [Compactifiable f] [Compactifiable f']

def upperShriekPushforwardIso (sq : IsPullback g' f' f g) :
    upperShriek (Λ := Λ) f' ⋙ pushforward g' ≅ pushforward g ⋙ upperShriek f := sorry

def upperShriekBaseChange (sq : IsPullback g' f' f g) : upperShriek (Λ := Λ) f ⋙ pullback g' ⟶ pullback g ⋙ upperShriek f' :=
  sorry

def upperShriekCobaseChange (sq : IsPullback g' f' f g) [Compactifiable g] [Compactifiable g'] :
    upperShriek g' ⋙ lowerShriek (Λ := Λ) f' ⟶ lowerShriek f ⋙ upperShriek g := sorry

lemma upperShriekBaseChange_etale (sq : IsPullback g' f' f g) [Etale g] :
    IsIso (upperShriekBaseChange (Λ := Λ) f g f' g' sq) :=
  sorry

/-- `upperShriekBaseChange_paste`: the base-change map of a vertically pasted square is the
composite of the two base-change maps, up to the pseudofunctoriality of pullback. -/
lemma upperShriekBaseChange_paste (sq : IsPullback g' f' f g) {S'' X'' : Scheme.{u}} (h : S'' ⟶ S') (f'' : X'' ⟶ S'')
    (h' : X'' ⟶ X') [Compactifiable f'']
    (sq₂ : IsPullback h' f'' f' h) (sq₃ : IsPullback (h' ≫ g') f'' f (h ≫ g)) :
    ∃ (c₁ : pullback (Λ := Λ) g' ⋙ pullback h' ≅ pullback (h' ≫ g'))
      (c₂ : pullback (Λ := Λ) g ⋙ pullback h ≅ pullback (h ≫ g)),
      upperShriekBaseChange (Λ := Λ) f (h ≫ g) f'' (h' ≫ g') sq₃ =
        Functor.whiskerLeft (upperShriek f) c₁.inv ≫
          Functor.whiskerRight (upperShriekBaseChange f g f' g' sq) (pullback h') ≫
          Functor.whiskerLeft (pullback g) (upperShriekBaseChange f' h f'' h' sq₂) ≫
          Functor.whiskerRight c₂.hom (upperShriek f'') := sorry

/-- Test `upperShriekBaseChange_id`. -/
example (sqId : IsPullback (𝟙 X) f f (𝟙 S)) :
    IsIso (upperShriekBaseChange (Λ := Λ) f (𝟙 S) f (𝟙 X) sqId) := sorry

/-- Test `upperShriekBaseChange_openImmersion`. -/
example (sq : IsPullback g' f' f g) [IsOpenImmersion g] :
    IsIso (upperShriekBaseChange (Λ := Λ) f g f' g' sq) := sorry

/-- Test `not_upperShriekBaseChange_iso_closedPoint`. -/
example [Nontrivial Λ] (Ω : Type u) [Field Ω] [IsAlgClosed Ω]
    (o : Spec (CommRingCat.of Ω) ⟶ 𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of Ω)))
    [IsClosedImmersion o] (n : ℕ) [NeZero n] (hΛ : (n : Λ) = 0)
    (hΩ : IsUnit (n : Ω)) (sq : IsPullback (𝟙 _) (𝟙 _) o o) :
    ¬ IsIso (upperShriekBaseChange (Λ := Λ) o o (𝟙 _) (𝟙 _) sq) := sorry

end Exchange

/-! ## EDC.2:trace-purity — traces -/

section Traces

variable {Λ : Type u} [CommRing Λ] [TorsionCoefficients Λ] {X Y S : Scheme.{u}} [CompactSpace X] [QuasiSeparatedSpace X] [CompactSpace Y] [QuasiSeparatedSpace Y] [CompactSpace S] [QuasiSeparatedSpace S]

/-- `Tr_f : f_! f^* F → F` for `f` separated, flat, of finite presentation and quasi-finite. -/
def finiteFlatTrace (f : X ⟶ S) [Compactifiable f] [Flat f] [LocallyOfFinitePresentation f]
    [LocallyQuasiFinite f] : pullback f ⋙ lowerShriek (Λ := Λ) f ⟶ 𝟭 _ := sorry

variable (f : X ⟶ S) [Compactifiable f] [Flat f] [LocallyOfFinitePresentation f] [LocallyQuasiFinite f]

lemma finiteFlatTrace_natural {K L : EtaleDerived Λ S} (φ : K ⟶ L) :
    (lowerShriek f).map ((pullback f).map φ) ≫ (finiteFlatTrace f).app L =
      (finiteFlatTrace f).app K ≫ φ :=
  (finiteFlatTrace f).naturality φ

/-- The composite trace uses the canonical compact-support composition comparison. -/
lemma finiteFlatTrace_comp (h : X ⟶ Y) (g : Y ⟶ S) [Compactifiable h] [Flat h]
    [LocallyQuasiFinite h] [LocallyOfFinitePresentation h] [Compactifiable g] [Flat g]
    [LocallyQuasiFinite g] [LocallyOfFinitePresentation g]
    [Compactifiable (h ≫ g)] [Flat (h ≫ g)] [LocallyOfFinitePresentation (h ≫ g)]
    [LocallyQuasiFinite (h ≫ g)] :
    ∃ c : pullback (h ≫ g) ⋙ lowerShriek (Λ := Λ) (h ≫ g) ≅
        pullback g ⋙ (pullback h ⋙ lowerShriek h) ⋙ lowerShriek g,
      finiteFlatTrace (h ≫ g) = c.hom ≫ Functor.whiskerLeft (pullback g)
        (Functor.whiskerRight (finiteFlatTrace h) (lowerShriek g)) ≫ finiteFlatTrace g := sorry

lemma finiteFlatTrace_baseChange {X' S' : Scheme.{u}} (g : S' ⟶ S) (f' : X' ⟶ S') (g' : X' ⟶ X)
    (sq : IsPullback g' f' f g) [Compactifiable f'] [Flat f']
    [LocallyOfFinitePresentation f'] [LocallyQuasiFinite f'] (K : EtaleDerived Λ S) :
    (pullback g).map ((finiteFlatTrace f).app K) =
      (lowerShriekBaseChange sq).hom.app ((pullback f).obj K) ≫
        (lowerShriek f').map ((pullbackSquareIso sq.w).hom.app K) ≫
          (finiteFlatTrace f').app ((pullback g).obj K) := sorry

/-- `finiteFlatTrace_unit`: for `f` finite locally free of constant rank `r`, the composite
`K → Rf_* f^* K = Rf_! f^* K → K` is multiplication by `r`. -/
lemma finiteFlatTrace_unit [IsFinite f] [IsProper f] (r : ℕ) (hr : ∀ s : S, f.finrank s = r)
    (K : EtaleDerived Λ S) :
    (pullbackPushforwardAdjunction f).unit.app K ≫
      (Classical.choice (lowerShriek_proper (Λ := Λ) f)).inv.app ((pullback f).obj K) ≫
        (finiteFlatTrace f).app K = (r : ℤ) • 𝟙 K := sorry

lemma finiteFlatTrace_etale [Etale f] :
    ∃ adj : lowerShriek (Λ := Λ) f ⊣ pullback f, finiteFlatTrace f = adj.counit := sorry

/-- CompactSupport's proper-fibre stalk decomposition, including scheme-theoretic multiplicities. -/
def finiteFibreStalkIso (F : EtaleSheaf Λ S) (s : GeometricPoint S) :
    stalkCohomology s 0 ((lowerShriek f).obj
      ((pullback f).obj ((DerivedCategory.singleFunctor _ 0).obj F))) ≅
    ModuleCat.of Λ (DirectSum (geometricFibre f s)
      (fun _ => stalkCohomology s 0 ((DerivedCategory.singleFunctor _ 0).obj F))) := sorry

def weightedFibreSum (F : EtaleSheaf Λ S) (s : GeometricPoint S) :
    (DirectSum (geometricFibre f s)
      (fun _ => stalkCohomology (Λ := Λ) s 0 ((DerivedCategory.singleFunctor _ 0).obj F))) →ₗ[Λ]
      stalkCohomology s 0 ((DerivedCategory.singleFunctor _ 0).obj F) := sorry

lemma weightedFibreSum_single (F : EtaleSheaf Λ S) (s : GeometricPoint S)
    (x : geometricFibre f s) (a : stalkCohomology (Λ := Λ) s 0
      ((DerivedCategory.singleFunctor _ 0).obj F)) :
    weightedFibreSum f F s (DirectSum.of _ x a)=fibreMultiplicity f s x • a := sorry

lemma finiteFlatTrace_stalk (F : EtaleSheaf Λ S) (s : GeometricPoint S) :
    (DerivedCategory.homologyFunctor _ 0).map ((EtaleDerived.stalk s).map
      ((finiteFlatTrace (Λ := Λ) f).app ((DerivedCategory.singleFunctor _ 0).obj F))) =
        (finiteFibreStalkIso f F s).hom ≫ ModuleCat.ofHom (weightedFibreSum f F s) := sorry

/-- SF.0 affine-line map induced by k[t]→k[t], t↦t². -/
def squareLineMap (k : Type u) [Field k] :
    𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of k)) ⟶
      𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of k)) := sorry
instance squareLine_finite (k : Type u) [Field k] : IsFinite (squareLineMap k) := sorry
instance squareLine_flat (k : Type u) [Field k] : Flat (squareLineMap k) := sorry
instance squareLine_quasiFinite (k : Type u) [Field k] : LocallyQuasiFinite (squareLineMap k) := sorry
instance squareLine_finitePresentation (k : Type u) [Field k] :
    LocallyOfFinitePresentation (squareLineMap k) := sorry

/-- The standard rational origin, viewed as a geometric point. -/
def originPoint (k : Type u) [Field k] [IsSepClosed k] :
    GeometricPoint (𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of k))) := sorry

/-- Test `finiteFlatTrace_square_map`: the unique point over zero has length two. -/
example (k : Type u) [Field k] [IsSepClosed k] (hchar : (2 : k) ≠ 0)
    (a : DirectSum (geometricFibre (squareLineMap k) (originPoint k))
      (fun _ => stalkCohomology (Λ := Λ) (originPoint k) 0 (EtaleDerived.constant _))) :
    weightedFibreSum (squareLineMap k)
      ((constantSheaf _ (ModuleCat.{u} Λ)).obj (ModuleCat.of Λ Λ)) (originPoint k) a =
        2 • (DirectSum.toModule Λ _ _ (fun _ => LinearMap.id)) a := sorry

/-- Test `not_finiteFlatTrace_counit_ramified`: the ramified map has f! distinct from f*. -/
example [Nontrivial Λ] (k : Type u) [Field k] [IsSepClosed k] (hchar : (2 : k) ≠ 0) :
    ¬ ∃ adj : lowerShriek (Λ := Λ) (squareLineMap k) ⊣ pullback (squareLineMap k),
      finiteFlatTrace (squareLineMap k)=adj.counit := sorry

/-- Test `finiteFlatTrace_separable`. -/
example {k L : Type u} [Field k] [Field L] [Algebra k L] [FiniteDimensional k L]
    [Algebra.IsSeparable k L] [Compactifiable (Spec.map (CommRingCat.ofHom (algebraMap k L)))]
    [Flat (Spec.map (CommRingCat.ofHom (algebraMap k L)))]
    [LocallyOfFinitePresentation (Spec.map (CommRingCat.ofHom (algebraMap k L)))]
    [LocallyQuasiFinite (Spec.map (CommRingCat.ofHom (algebraMap k L)))]
    [IsProper (Spec.map (CommRingCat.ofHom (algebraMap k L)))] (K : EtaleDerived Λ _) :
    ((pullbackPushforwardAdjunction (Spec.map (CommRingCat.ofHom (algebraMap k L)))).unit.app K ≫
      (Classical.choice (lowerShriek_proper (Λ := Λ)
        (Spec.map (CommRingCat.ofHom (algebraMap k L))))).inv.app _ ≫
      (finiteFlatTrace (Λ := Λ) (Spec.map (CommRingCat.ofHom (algebraMap k L)))).app K) =
      (Module.finrank k L : ℤ) • 𝟙 K := sorry

/-- Test `finiteFlatTrace_id`. -/
example [Compactifiable (𝟙 S)] [Flat (𝟙 S)] [LocallyOfFinitePresentation (𝟙 S)] [LocallyQuasiFinite (𝟙 S)] :
    ∃ e : pullback (𝟙 S) ⋙ lowerShriek (Λ := Λ) (𝟙 S) ≅ 𝟭 _, finiteFlatTrace (𝟙 S) = e.hom :=
  sorry

end Traces

/-! ## Imported geometric carriers for Chern classes and cycle classes
The invertible-sheaf carrier is pinned Tau Ceti. Finite locally free sheaves and their rank,
dual, pullback and direct sum are AlgebraicVectorBundles L0. Projective schemes, Cartier divisors,
Chow groups and normal bundles below are SF.5 imports. These are signature stand-ins, not new
EDC nodes. Coefficient compatibility always uses derived extension and the canonical twist.
-/
section GeometricImports
variable {Λ : Type u} [CommRing Λ] [TorsionCoefficients Λ]

/-- The actual existence of a modulus invertible on X; no invented condition is hidden here. -/
class CoefficientsOn (Λ : Type u) [CommRing Λ] (X : Scheme.{u}) : Prop where
  exists_modulus : ∃ n : ℕ, n ≠ 0 ∧ (n : Λ) = 0 ∧ IsUnit (n : Γ(X, ⊤))

def coefficientModulus (Λ : Type u) [CommRing Λ] (X : Scheme.{u}) [CoefficientsOn Λ X] : ℕ :=
  Classical.choose (CoefficientsOn.exists_modulus (Λ := Λ) (X := X))

instance coefficientModulus_neZero (X : Scheme.{u}) [CoefficientsOn Λ X] :
    NeZero (coefficientModulus Λ X) := ⟨(Classical.choose_spec
      (CoefficientsOn.exists_modulus (Λ := Λ) (X := X))).1⟩

lemma coefficientModulus_killed (X : Scheme.{u}) [CoefficientsOn Λ X] :
    (coefficientModulus Λ X : Λ) = 0 :=
  (Classical.choose_spec (CoefficientsOn.exists_modulus (Λ := Λ) (X := X))).2.1

lemma coefficientModulus_unit (X : Scheme.{u}) [CoefficientsOn Λ X] :
    IsUnit (coefficientModulus Λ X : Γ(X, ⊤)) :=
  (Classical.choose_spec (CoefficientsOn.exists_modulus (Λ := Λ) (X := X))).2.2

/-- Actual RΓ cohomology of the canonical twist; choice of a killing modulus is harmless. -/
def Coh (X : Scheme.{u}) [CoefficientsOn Λ X] (q m : ℤ) : ModuleCat.{u} Λ :=
  cohomologyModule q ((tateTwist (coefficientModulus Λ X) X
    (coefficientModulus_unit X) (coefficientModulus_killed X) m).obj
      (EtaleDerived.constant X))

/-- Canonical reindexing, needed when equal degree expressions are not definitionally equal. -/
def cohCast {X : Scheme.{u}} [CoefficientsOn Λ X] {q q' m m' : ℤ}
    (hq : q = q') (hm : m = m') : Coh (Λ := Λ) X q m ≅ Coh X q' m' := by
  subst q'; subst m'; exact Iso.refl _

/-- Derived cup product, supplied by E1 tensor and the coefficient-unit multiplication. -/
def cup {X : Scheme.{u}} [CoefficientsOn Λ X] {q r m t : ℤ} :
    Coh (Λ := Λ) X q m → Coh (Λ := Λ) X r t → Coh (Λ := Λ) X (q+r) (m+t) := sorry

def cohOne (X : Scheme.{u}) [CoefficientsOn Λ X] : Coh (Λ := Λ) X 0 0 := sorry

def cohPullback {X Y : Scheme.{u}} [CoefficientsOn Λ X] [CoefficientsOn Λ Y]
    (f : Y ⟶ X) (q m : ℤ) : Coh (Λ := Λ) X q m ⟶ Coh Y q m := sorry

/-- The even diagonal cohomology ring, with multiplication given by cup product. -/
def ChernRing (X : Scheme.{u}) [CoefficientsOn Λ X] : Type u :=
  DirectSum ℕ (fun r => Coh (Λ := Λ) X (2*r) r)
instance {X : Scheme.{u}} [CoefficientsOn Λ X] : CommRing (ChernRing (Λ := Λ) X) := sorry

def chernInclude {X : Scheme.{u}} [CoefficientsOn Λ X] (r : ℕ) :
    Coh (Λ := Λ) X (2*r) r →+ ChernRing (Λ := Λ) X := sorry

def chernRingPullback {X Y : Scheme.{u}} [CoefficientsOn Λ X] [CoefficientsOn Λ Y]
    (f : Y ⟶ X) : ChernRing (Λ := Λ) X →+* ChernRing (Λ := Λ) Y := sorry

lemma chernInclude_eq_of {X : Scheme.{u}} [CoefficientsOn Λ X] (r : ℕ)
    (x : Coh (Λ := Λ) X (2*r) r) :
    chernInclude r x=DirectSum.of (fun j : ℕ => Coh (Λ := Λ) X (2*j) j) r x := sorry

lemma chernInclude_mul {X : Scheme.{u}} [CoefficientsOn Λ X] (r s : ℕ)
    (x : Coh (Λ := Λ) X (2*r) r) (y : Coh (Λ := Λ) X (2*s) s) :
    chernInclude r x * chernInclude s y=chernInclude (r+s)
      ((cohCast (by omega) (by omega)).hom (cup x y)) := sorry

lemma chernInclude_one {X : Scheme.{u}} [CoefficientsOn Λ X] :
    chernInclude 0 (cohOne (Λ := Λ) X)=1 := sorry

/-- Picard classes use pinned Tau Ceti's existing isomorphism-class carrier. -/
abbrev Picard (X : Scheme.{u}) := Additive (TauCeti.AlgebraicGeometry.LineBundleClass X)
/-- The group structure extends the pinned tensor monoid; duals are the JacobianChallenge input. -/
instance (X : Scheme.{u}) : AddCommGroup (Picard X) := sorry

lemma picard_add_eq_tensor (X : Scheme.{u})
    (L M : TauCeti.AlgebraicGeometry.LineBundleClass X) :
    (Additive.ofMul (L*M) : Picard X)=Additive.ofMul L+Additive.ofMul M := sorry
lemma picard_zero_eq_trivial (X : Scheme.{u}) :
    (Additive.ofMul (1 : TauCeti.AlgebraicGeometry.LineBundleClass X) : Picard X)=0 := sorry

def lineClass {X : Scheme.{u}} (L : TauCeti.AlgebraicGeometry.InvertibleSheaf X) : Picard X :=
  Additive.ofMul (TauCeti.AlgebraicGeometry.LineBundleClass.mk L)

def picardPullback {X Y : Scheme.{u}} (f : Y ⟶ X) : Picard X →+ Picard Y := sorry

def lineDegree {k : Type u} [Field k] {X : Scheme.{u}} (a : X ⟶ Spec (CommRingCat.of k))
    [IsProper a] [SmoothOfRelativeDimension 1 a] : Picard X →+ ℤ := sorry

/-- Exactly the L0A finite-locally-free predicate from current upstream AlgebraicVectorBundles. -/
def isFiniteLocallyFree (X : Scheme.{u}) : ObjectProperty X.Modules :=
  fun E => E.IsLocallyFree ∧ E.IsFinitePresentation
abbrev FiniteLocallyFree (X : Scheme.{u}) := (isFiniteLocallyFree X).FullSubcategory

def bundleRank {X : Scheme.{u}} (E : FiniteLocallyFree X) : LocallyConstant X ℕ := sorry
abbrev Bundle (X : Scheme.{u}) (r : ℕ) :=
  {E : FiniteLocallyFree X // bundleRank E = LocallyConstant.const X r}

def bundlePullback {X Y : Scheme.{u}} (f : Y ⟶ X) {r : ℕ} : Bundle X r → Bundle Y r := sorry

def bundleDirectSum {X : Scheme.{u}} {r s : ℕ} : Bundle X r → Bundle X s → Bundle X (r+s) := sorry

def trivialBundle (X : Scheme.{u}) (r : ℕ) : Bundle X r := sorry

def lineBundle {X : Scheme.{u}} (L : TauCeti.AlgebraicGeometry.InvertibleSheaf X) : Bundle X 1 := sorry

/-- Lines convention P(E)=Proj Sym(E dual); SF.5's quotient projective bundle is applied to E dual. -/
def projectiveBundle {X : Scheme.{u}} {r : ℕ} (E : Bundle X r) : Scheme.{u} := sorry

def projectiveProjection {X : Scheme.{u}} {r : ℕ} (E : Bundle X r) : projectiveBundle E ⟶ X := sorry

def projectiveO1 {X : Scheme.{u}} {r : ℕ} (E : Bundle X r) :
    TauCeti.AlgebraicGeometry.InvertibleSheaf (projectiveBundle E) := sorry

instance projective_coefficients {X : Scheme.{u}} [CoefficientsOn Λ X] {r : ℕ} (E : Bundle X r) :
    CoefficientsOn Λ (projectiveBundle E) := sorry

/-- A smooth separated finite-type scheme, with its actual pure dimension and structural map. -/
structure SmoothModel (k : Type u) [Field k] where
  X : Scheme.{u}
  a : X ⟶ Spec (CommRingCat.of k)
  dimension : ℕ
  [smooth : SmoothOfRelativeDimension dimension a]
  [separated : IsSeparated a]
  [quasiCompact : QuasiCompact a]
attribute [instance] SmoothModel.smooth SmoothModel.separated SmoothModel.quasiCompact

/-- The geometric projective-space import, with the dimension stored in SmoothModel. -/
def projectiveModel (k : Type u) [Field k] (m : ℕ) : SmoothModel k := sorry
lemma projectiveModel_dimension (k : Type u) [Field k] (m : ℕ) :
    (projectiveModel k m).dimension = m := sorry

def projectiveHyperplaneBundle (k : Type u) [Field k] (m : ℕ) :
    TauCeti.AlgebraicGeometry.InvertibleSheaf (projectiveModel k m).X := sorry

def hyperplaneImmersion (k : Type u) [Field k] (m : ℕ) :
    (projectiveModel k m).X ⟶ (projectiveModel k (m+1)).X := sorry
instance hyperplane_closed (k : Type u) [Field k] (m : ℕ) :
    IsClosedImmersion (hyperplaneImmersion k m) := sorry

/-- SF.5 Cartier-divisor data; the line bundle O(D) is imported with it. -/
def CartierDivisor (X : Scheme.{u}) : Type (u+1) := sorry

def divisorLineBundle {X : Scheme.{u}} (D : CartierDivisor X) :
    TauCeti.AlgebraicGeometry.InvertibleSheaf X := sorry

def divisorClass {X : Scheme.{u}} [CoefficientsOn Λ X] (D : CartierDivisor X) :
    Coh (Λ := Λ) X 2 1 := sorry

/-- Coefficient change on twisted cohomology, from the derived coefficient-change node. -/
def changeCohomology {Λ' : Type u} [CommRing Λ'] [TorsionCoefficients Λ']
    {X : Scheme.{u}} [CoefficientsOn Λ X] [CoefficientsOn Λ' X]
    (φ : Λ →+* Λ') (q m : ℤ) : Coh (Λ := Λ) X q m →+ Coh (Λ := Λ') X q m := sorry
end GeometricImports

/-! ## EDC.2:trace-purity — first Chern class -/
section FirstChern
variable {Λ : Type u} [CommRing Λ] [TorsionCoefficients Λ] {X Y : Scheme.{u}}
  [CoefficientsOn Λ X] [CoefficientsOn Λ Y]

def firstChernClass : Picard X →+ Coh (Λ := Λ) X 2 1 := sorry
lemma firstChernClass_tensor (L M : Picard X) :
    firstChernClass (Λ := Λ) (L+M) = firstChernClass L + firstChernClass M := sorry
lemma firstChernClass_pullback (f : Y ⟶ X) (L : Picard X) :
    firstChernClass (Λ := Λ) (picardPullback f L) =
      cohPullback f 2 1 (firstChernClass L) := sorry
lemma firstChernClass_pow (L : Picard X) (r : ℤ) :
    firstChernClass (Λ := Λ) (r • L) = r • firstChernClass L := sorry
lemma firstChernClass_divisor (D : CartierDivisor X) :
    firstChernClass (Λ := Λ) (lineClass (divisorLineBundle D)) = divisorClass D := sorry
lemma firstChernClass_changeN {Λ' : Type u} [CommRing Λ'] [TorsionCoefficients Λ']
    [CoefficientsOn Λ' X] (φ : Λ →+* Λ') (L : Picard X) :
    changeCohomology φ 2 1 (firstChernClass (Λ := Λ) L) = firstChernClass (Λ := Λ') L := sorry

/-- Imported normalized trace on a smooth proper geometrically connected curve. -/
def curveCohomologyTrace {k : Type u} [Field k] [IsSepClosed k] (A : SmoothModel k)
    [IsProper A.a] (hd : A.dimension = 1) [CoefficientsOn Λ A.X] :
    Coh (Λ := Λ) A.X 2 1 ⟶ ModuleCat.of Λ Λ := sorry

/-- Test `firstChernClass_projectiveLine`. -/
example (k : Type u) [Field k] [IsSepClosed k] [CoefficientsOn Λ (projectiveModel k 1).X]
    [IsProper (projectiveModel k 1).a] (hd : (projectiveModel k 1).dimension = 1) :
    curveCohomologyTrace (Λ := Λ) (projectiveModel k 1) hd
      (firstChernClass (lineClass (projectiveHyperplaneBundle k 1))) = 1 := sorry
/-- Test `firstChernClass_trivial`. -/
example : firstChernClass (Λ := Λ) (lineClass (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X)) = 0 := sorry
/-- Test `not_firstChernClass_injective`: on P¹, the n-th power of O(1) is nontrivial but has c₁ zero. -/
example [Nontrivial Λ] (k : Type u) [Field k] [IsSepClosed k]
    [CoefficientsOn Λ (projectiveModel k 1).X] (n : ℕ) (hn : n ≠ 0) (hΛ : (n : Λ)=0) :
    let L := lineClass (projectiveHyperplaneBundle k 1)
    n • L ≠ 0 ∧ firstChernClass (Λ := Λ) (n • L) = 0 := sorry
/-- Test `firstChernClass_degree_curve`. -/
example {k : Type u} [Field k] [IsSepClosed k] (A : SmoothModel k)
    [IsProper A.a] [SmoothOfRelativeDimension 1 A.a] (hd : A.dimension=1)
    [CoefficientsOn Λ A.X] (L : Picard A.X) :
    curveCohomologyTrace (Λ := Λ) A hd (firstChernClass L) = (lineDegree A.a L : Λ) := sorry
end FirstChern

section GeneralTrace
variable {Λ : Type u} [CommRing Λ] [TorsionCoefficients Λ]
  {X Y S T : Scheme.{u}} [CompactSpace X] [QuasiSeparatedSpace X]
  [CompactSpace Y] [QuasiSeparatedSpace Y] [CompactSpace S] [QuasiSeparatedSpace S]
  [CompactSpace T] [QuasiSeparatedSpace T] (n : ℕ) [NeZero n] (hΛ : (n : Λ)=0)

def higherLowerShriek (f : X ⟶ S) [Compactifiable f] (q : ℤ)
    (K : EtaleDerived Λ X) : EtaleSheaf Λ S :=
  (DerivedCategory.homologyFunctor _ q).obj ((lowerShriek f).obj K)

def higherLowerShriekMap (f : X ⟶ S) [Compactifiable f] (q : ℤ)
    {K L : EtaleDerived Λ X} (φ : K ⟶ L) :
    higherLowerShriek f q K ⟶ higherLowerShriek f q L :=
  (DerivedCategory.homologyFunctor _ q).map ((lowerShriek f).map φ)

def traceSource (f : X ⟶ S) [Compactifiable f] (d : ℕ)
    (hX : IsUnit (n : Γ(X, ⊤))) (F : EtaleSheaf Λ S) : EtaleSheaf Λ S :=
  higherLowerShriek f (2*d) ((tateTwist n X hX hΛ d).obj
    ((pullback f).obj ((DerivedCategory.singleFunctor _ 0).obj F)))

/-- The actual (∗)d hypothesis is required, in addition to compactifiability. -/
def trace (f : X ⟶ S) [Compactifiable f] (d : ℕ) [TraceDimension f d]
    (hX : IsUnit (n : Γ(X, ⊤))) (F : EtaleSheaf Λ S) :
    traceSource n hΛ f d hX F ⟶ F := sorry

def derivedTraceFunctor (f : X ⟶ S) [Compactifiable f] (d : ℕ)
    (hX : IsUnit (n : Γ(X, ⊤))) : EtaleDerived Λ S ⥤ EtaleDerived Λ S :=
  pullback f ⋙ tateTwist n X hX hΛ d ⋙ shiftFunctor _ (2*d : ℤ) ⋙ lowerShriek f

def derivedTrace (f : X ⟶ S) [Compactifiable f] (d : ℕ) [TraceDimension f d]
    (hX : IsUnit (n : Γ(X, ⊤))) : derivedTraceFunctor n hΛ f d hX ⟶ 𝟭 _ := sorry

/-- Canonical CompactSupport base change, exact pullback, and twist identification. -/
def traceBaseChangeIso {X' S' : Scheme.{u}} (f : X ⟶ S) [Compactifiable f]
    (g : S' ⟶ S) (f' : X' ⟶ S') [Compactifiable f'] (g' : X' ⟶ X)
    (sq : IsPullback g' f' f g) (d : ℕ) (hX : IsUnit (n : Γ(X, ⊤)))
    (hX' : IsUnit (n : Γ(X', ⊤))) (F : EtaleSheaf Λ S) :
    (sheafPullback g).obj (traceSource n hΛ f d hX F) ≅
      traceSource n hΛ f' d hX' ((sheafPullback g).obj F) := sorry

lemma trace_baseChange {X' S' : Scheme.{u}} (f : X ⟶ S) [Compactifiable f]
    (g : S' ⟶ S) (f' : X' ⟶ S') [Compactifiable f'] (g' : X' ⟶ X)
    (sq : IsPullback g' f' f g) (d : ℕ) [TraceDimension f d] [TraceDimension f' d]
    (hX : IsUnit (n : Γ(X, ⊤))) (hX' : IsUnit (n : Γ(X', ⊤))) (F : EtaleSheaf Λ S) :
    (sheafPullback g).map (trace n hΛ f d hX F)=
      (traceBaseChangeIso n hΛ f g f' g' sq d hX hX' F).hom ≫
        trace n hΛ f' d hX' ((sheafPullback g).obj F) := sorry

/-- Assemble proper-pushforward composition, top-degree truncation and Tr_h.
This is the canonical iterated map, rather than an unspecified comparison isomorphism. -/
def iteratedTrace (f : Y ⟶ S) (h : X ⟶ Y) [Compactifiable f] [Compactifiable h]
    [Compactifiable (h ≫ f)] (d e : ℕ) [TraceDimension f d] [TraceDimension h e]
    (hY : IsUnit (n : Γ(Y, ⊤))) (hX : IsUnit (n : Γ(X, ⊤))) (F : EtaleSheaf Λ S) :
    traceSource n hΛ (h ≫ f) (d+e) hX F ⟶ traceSource n hΛ f d hY F := sorry

lemma trace_comp (f : Y ⟶ S) (h : X ⟶ Y) [Compactifiable f] [Compactifiable h]
    [Compactifiable (h ≫ f)] (d e : ℕ) [TraceDimension f d] [TraceDimension h e]
    [TraceDimension (h ≫ f) (d+e)] (hY : IsUnit (n : Γ(Y, ⊤)))
    (hX : IsUnit (n : Γ(X, ⊤))) (F : EtaleSheaf Λ S) :
    trace n hΛ (h ≫ f) (d+e) hX F =
      iteratedTrace n hΛ f h d e hY hX F ≫ trace n hΛ f d hY F := sorry

/-- Canonical cancellation of (0)[0]. -/
def derivedTraceZeroIso (f : X ⟶ S) [Compactifiable f] (hX : IsUnit (n : Γ(X, ⊤))) :
    pullback f ⋙ lowerShriek (Λ := Λ) f ≅ derivedTraceFunctor n hΛ f 0 hX := sorry

lemma trace_finite (f : X ⟶ S) [Compactifiable f] [IsFinite f] [IsProper f] [Flat f]
    [TraceDimension f 0] (hX : IsUnit (n : Γ(X, ⊤))) (r : ℕ)
    (hr : ∀ s, f.finrank s=r) (K : EtaleDerived Λ S) :
    (pullbackPushforwardAdjunction f).unit.app K ≫
      (Classical.choice (lowerShriek_proper (Λ := Λ) f)).inv.app ((pullback f).obj K) ≫
        (derivedTraceZeroIso n hΛ f hX).hom.app K ≫
          (derivedTrace n hΛ f 0 hX).app K=(r : ℤ) • 𝟙 K := sorry

/-- Curve trace: flatness and the actual pure one-dimensional fibres are explicit. -/
def curveTrace (f : X ⟶ S) [Compactifiable f] [FlatCurve f] [TraceDimension f 1]
    (hX : IsUnit (n : Γ(X, ⊤))) (F : EtaleSheaf Λ S) : traceSource n hΛ f 1 hX F ⟶ F :=
  trace n hΛ f 1 hX F

lemma curveTrace_baseChange {X' S' : Scheme.{u}} (f : X ⟶ S) [Compactifiable f] [FlatCurve f]
    [TraceDimension f 1] (g : S' ⟶ S) (f' : X' ⟶ S') [Compactifiable f'] [FlatCurve f']
    [TraceDimension f' 1] (g' : X' ⟶ X) (sq : IsPullback g' f' f g)
    (hX : IsUnit (n : Γ(X, ⊤))) (hX' : IsUnit (n : Γ(X', ⊤))) (F : EtaleSheaf Λ S) :
    (sheafPullback g).map (curveTrace n hΛ f hX F)=
      (traceBaseChangeIso n hΛ f g f' g' sq 1 hX hX' F).hom ≫
        curveTrace n hΛ f' hX' ((sheafPullback g).obj F) := sorry

/-- Exact Rq of the étale trace, with canonical compact-pushforward composition. -/
def compactEtaleTransition {U : Scheme.{u}} (f : X ⟶ S) [Compactifiable f]
    (j : U ⟶ X) [Etale j] [Compactifiable j] [Compactifiable (j ≫ f)]
    (q : ℤ) (K : EtaleDerived Λ X) :
    higherLowerShriek (j ≫ f) q ((pullback j).obj K) ⟶ higherLowerShriek f q K := sorry

lemma curveTrace_components (f : X ⟶ S) [Compactifiable f] [FlatCurve f] [TraceDimension f 1]
    {U : Scheme.{u}} (j : U ⟶ X) [IsOpenImmersion j] [Compactifiable j]
    [Compactifiable (j ≫ f)] [FlatCurve (j ≫ f)] [TraceDimension (j ≫ f) 1]
    (hX : IsUnit (n : Γ(X, ⊤))) (hU : IsUnit (n : Γ(U, ⊤))) (F : EtaleSheaf Λ S) :
    ∃ c : traceSource n hΛ (j ≫ f) 1 hU F ≅
      higherLowerShriek (j ≫ f) 2 ((pullback j).obj
        ((tateTwist n X hX hΛ 1).obj ((pullback f).obj ((DerivedCategory.singleFunctor _ 0).obj F)))),
      curveTrace n hΛ (j ≫ f) hU F = c.hom ≫
        compactEtaleTransition f j 2 _ ≫ curveTrace n hΛ f hX F := sorry

lemma curveTrace_quasiFiniteFlat (f : Y ⟶ S) (h : X ⟶ Y) [Compactifiable f]
    [Compactifiable h] [Compactifiable (h ≫ f)] [FlatCurve f] [Flat h] [FlatCurve (h ≫ f)]
    [LocallyQuasiFinite h] [TraceDimension f 1] [TraceDimension h 0]
    [TraceDimension (h ≫ f) 1] (hY : IsUnit (n : Γ(Y, ⊤)))
    (hX : IsUnit (n : Γ(X, ⊤))) (F : EtaleSheaf Λ S) :
    curveTrace n hΛ (h ≫ f) hX F =
      iteratedTrace n hΛ f h 1 0 hY hX F ≫ curveTrace n hΛ f hY F := sorry

lemma curveTrace_isIso (f : X ⟶ S) [Compactifiable f] [SmoothOfRelativeDimension 1 f] [FlatCurve f]
    (hirr : ∀ s : GeometricPoint S, IrreducibleSpace (geometricFibre f s))
    (hX : IsUnit (n : Γ(X, ⊤))) (F : EtaleSheaf Λ S) : IsIso (curveTrace n hΛ f hX F) := sorry

lemma curveTrace_firstChernClass {k : Type u} [Field k] [IsSepClosed k] (A : SmoothModel k)
    [IsProper A.a] [ConnectedSpace A.X] [SmoothOfRelativeDimension 1 A.a]
    (hd : A.dimension=1) [CoefficientsOn Λ A.X] (L : Picard A.X) :
    curveCohomologyTrace (Λ := Λ) A hd (firstChernClass L)=(lineDegree A.a L : Λ) := sorry

/-- The affine-space trace has a fixed normalized orientation. -/
def affineSpaceTrace (d : ℕ) (hX : IsUnit (n : Γ(𝔸(ULift.{u} (Fin d); S), ⊤)))
    (F : EtaleSheaf Λ S) : traceSource n hΛ (𝔸(ULift.{u} (Fin d); S) ↘ S) d hX F ≅ F := sorry

lemma trace_affineLine (hX : IsUnit (n : Γ(𝔸(ULift.{u} (Fin 1); S), ⊤)))
    (F : EtaleSheaf Λ S) :
    trace n hΛ (𝔸(ULift.{u} (Fin 1); S) ↘ S) 1 hX F=(affineSpaceTrace n hΛ 1 hX F).hom := sorry

/-- SF.0's coordinate permutation over S, and its induced action on top compact cohomology. -/
def affineCoordinatePermutation (d : ℕ) (σ : Equiv.Perm (Fin d)) :
    𝔸(ULift.{u} (Fin d); S) ≅ 𝔸(ULift.{u} (Fin d); S) := sorry

def affineTraceCoordinateAction (d : ℕ) (σ : Equiv.Perm (Fin d))
    (hX : IsUnit (n : Γ(𝔸(ULift.{u} (Fin d); S), ⊤))) (F : EtaleSheaf Λ S) :
    traceSource n hΛ (𝔸(ULift.{u} (Fin d); S) ↘ S) d hX F ≅
      traceSource n hΛ (𝔸(ULift.{u} (Fin d); S) ↘ S) d hX F := sorry

lemma affineSpaceTrace_perm (d : ℕ) (σ : Equiv.Perm (Fin d))
    (hX : IsUnit (n : Γ(𝔸(ULift.{u} (Fin d); S), ⊤))) (F : EtaleSheaf Λ S) :
    (affineTraceCoordinateAction n hΛ d σ hX F).hom ≫ (affineSpaceTrace n hΛ d hX F).hom=
      (affineSpaceTrace n hΛ d hX F).hom := sorry

/-- Canonical iteration through A^(d+1)≅A¹ over A^d, with the curve trace followed by Tr_A^d. -/
def affineIteratedTrace (d : ℕ) (hX : IsUnit (n : Γ(𝔸(ULift.{u} (Fin (d+1)); S), ⊤)))
    (F : EtaleSheaf Λ S) : traceSource n hΛ (𝔸(ULift.{u} (Fin (d+1)); S) ↘ S) (d+1) hX F ⟶ F := sorry
lemma affineSpaceTrace_succ (d : ℕ) (hX : IsUnit (n : Γ(𝔸(ULift.{u} (Fin (d+1)); S), ⊤)))
    (F : EtaleSheaf Λ S) : (affineSpaceTrace n hΛ (d+1) hX F).hom=affineIteratedTrace n hΛ d hX F := sorry

lemma affineSpaceTrace_baseChange {S' : Scheme.{u}} [CompactSpace S'] [QuasiSeparatedSpace S']
    (g : S' ⟶ S) (d : ℕ) (hX : IsUnit (n : Γ(𝔸(ULift.{u} (Fin d); S), ⊤)))
    (hX' : IsUnit (n : Γ(𝔸(ULift.{u} (Fin d); S'), ⊤))) (F : EtaleSheaf Λ S)
    (g' : 𝔸(ULift.{u} (Fin d); S') ⟶ 𝔸(ULift.{u} (Fin d); S))
    (sq : IsPullback g' (𝔸(ULift.{u} (Fin d); S') ↘ S') (𝔸(ULift.{u} (Fin d); S) ↘ S) g) :
    (sheafPullback g).map (affineSpaceTrace n hΛ d hX F).hom=
      (traceBaseChangeIso n hΛ _ g _ g' sq d hX hX' F).hom ≫
        (affineSpaceTrace n hΛ d hX' ((sheafPullback g).obj F)).hom := sorry

/-- Künneth on top compact cohomology, and external tensor of the two trace morphisms. -/
def exteriorSheafProduct (F : EtaleSheaf Λ S) (G : EtaleSheaf Λ T) :
    EtaleSheaf Λ (Limits.prod S T) := sorry

def traceKunnethComposite (f : X ⟶ S) (g : Y ⟶ T) [Compactifiable f] [Compactifiable g]
    [Compactifiable (Limits.prod.map f g)] (d e : ℕ) [TraceDimension f d] [TraceDimension g e]
    (hX : IsUnit (n : Γ(X, ⊤))) (hY : IsUnit (n : Γ(Y, ⊤)))
    (hXY : IsUnit (n : Γ(Limits.prod X Y, ⊤))) (F : EtaleSheaf Λ S) (G : EtaleSheaf Λ T) :
    traceSource n hΛ (Limits.prod.map f g) (d+e) hXY (exteriorSheafProduct F G) ⟶
      exteriorSheafProduct F G := sorry
lemma trace_kunneth (f : X ⟶ S) (g : Y ⟶ T) [Compactifiable f] [Compactifiable g]
    [Compactifiable (Limits.prod.map f g)] (d e : ℕ) [TraceDimension f d] [TraceDimension g e]
    [TraceDimension (Limits.prod.map f g) (d+e)] (hX : IsUnit (n : Γ(X, ⊤)))
    (hY : IsUnit (n : Γ(Y, ⊤))) (hXY : IsUnit (n : Γ(Limits.prod X Y, ⊤)))
    (F : EtaleSheaf Λ S) (G : EtaleSheaf Λ T) :
    trace n hΛ (Limits.prod.map f g) (d+e) hXY (exteriorSheafProduct F G)=
      traceKunnethComposite n hΛ f g d e hX hY hXY F G := sorry

lemma trace_isIso_iff {X S : Scheme} [CompactSpace X] [QuasiSeparatedSpace X]
    [CompactSpace S] [QuasiSeparatedSpace S] (f : X ⟶ S) [Compactifiable f] (d : ℕ) [TraceDimension f d]
    (hn : 2≤n) (hX : IsUnit (n : Γ(X, ⊤))) :
    IsIso (trace (Λ := ZMod n) n (by simp) f d hX
      ((constantSheaf _ (ModuleCat (ZMod n))).obj (ModuleCat.of (ZMod n) (ZMod n)))) ↔
      ∀ s : GeometricPoint S, ∃ Z : Set (geometricFibre f s),
        topFibreComponents f s d={Z} ∧ Nat.Coprime (componentMultiplicity f s Z) n := sorry

/-- Test `affineSpaceTrace_zero`. -/
example (hX : IsUnit (n : Γ(𝔸(ULift.{u} (Fin 0); S), ⊤))) (F : EtaleSheaf Λ S) :
    IsIso (affineSpaceTrace n hΛ 0 hX F).hom := sorry
/-- Test `not_affineSpaceTrace_lower_degree`. -/
example (Ω : Type u) [Field Ω] [IsAlgClosed Ω] (d : ℕ) (q : ℤ) (hq : q≠2*d) :
    IsZero (higherLowerShriek (Λ := Λ) (𝔸(ULift.{u} (Fin d); Spec (CommRingCat.of Ω)) ↘ Spec (CommRingCat.of Ω))
      q (EtaleDerived.constant _)) := sorry
/-- Test `affineSpaceTrace_swap`. -/
example (hX : IsUnit (n : Γ(𝔸(ULift.{u} (Fin 2); S), ⊤))) (F : EtaleSheaf Λ S) :
    (affineTraceCoordinateAction n hΛ 2 (Equiv.swap 0 1) hX F).hom ≫
      (affineSpaceTrace n hΛ 2 hX F).hom=(affineSpaceTrace n hΛ 2 hX F).hom := sorry
/-- Test `curveTrace_empty`. -/
example (f : X ⟶ S) [Compactifiable f] [FlatCurve f] [TraceDimension f 1] [IsEmpty X]
    (hX : IsUnit (n : Γ(X, ⊤))) (F : EtaleSheaf Λ S) : IsZero (traceSource n hΛ f 1 hX F) := sorry
/-- Test `trace_dimZero_separable`. -/
example {k L : Type u} [Field k] [Field L] [Algebra k L] [FiniteDimensional k L]
    [Algebra.IsSeparable k L] (f : Spec (CommRingCat.of L) ⟶ Spec (CommRingCat.of k))
    (hf : f=Spec.map (CommRingCat.ofHom (algebraMap k L))) [Compactifiable f] [IsProper f]
    [IsFinite f] [TraceDimension f 0] (hL : IsUnit (n : Γ(Spec (CommRingCat.of L), ⊤)))
    (K : EtaleDerived Λ (Spec (CommRingCat.of k))) :
    (pullbackPushforwardAdjunction f).unit.app K ≫
      (Classical.choice (lowerShriek_proper (Λ := Λ) f)).inv.app ((pullback f).obj K) ≫
        (derivedTraceZeroIso n hΛ f hL).hom.app K ≫ (derivedTrace n hΛ f 0 hL).app K=
          (Module.finrank k L : ℤ) • 𝟙 K := sorry
end GeneralTrace


/-! ## EDC.2:trace-purity — named theorems -/

/-! ## EDC.2 trace-purity: effacement of actual transition maps -/
section Purity
variable {Λ : Type u} [CommRing Λ] [TorsionCoefficients Λ] {X S : Scheme.{u}}
  [CompactSpace X] [QuasiSeparatedSpace X] [CompactSpace S] [QuasiSeparatedSpace S]
  (n : ℕ) [NeZero n] (hΛ : (n : Λ)=0)

/-- Actual étale neighbourhoods, their map over S, and the chosen lift of the geometric point. -/
structure EtaleTraceNeighbourhood (f : X ⟶ S) (d : ℕ) (x : GeometricPoint X) where
  V : Scheme.{u}
  U : Scheme.{u}
  v : V ⟶ S
  u : U ⟶ X
  f' : U ⟶ V
  commutes : u ≫ f=f' ≫ v
  [etale_v : Etale v]
  [etale_u : Etale u]
  [compact_v : Compactifiable v]
  [compact_u : Compactifiable u]
  [compact_f' : Compactifiable f']
  [smooth_f' : SmoothOfRelativeDimension d f']
  lift : Spec (CommRingCat.of x.Ω) ⟶ U
  lift_eq : lift ≫ u=x.pt
attribute [instance] EtaleTraceNeighbourhood.etale_v EtaleTraceNeighbourhood.etale_u
  EtaleTraceNeighbourhood.compact_v EtaleTraceNeighbourhood.compact_u
  EtaleTraceNeighbourhood.compact_f' EtaleTraceNeighbourhood.smooth_f'

/-- CompactSupport base change followed by the étale trace of U→X×_S V. -/
def neighbourhoodTransition (f : X ⟶ S) [Compactifiable f] (d : ℕ) (x : GeometricPoint X)
    (N : EtaleTraceNeighbourhood f d x) (K : EtaleDerived Λ X) :
    (lowerShriek N.f').obj ((pullback N.u).obj K) ⟶
      (pullback N.v).obj ((lowerShriek f).obj K) := sorry

/-- Canonical transition for Λ(d)[2d], using the pullback isomorphism of Tate twists. -/
def neighbourhoodTwistedTransition (f : X ⟶ S) [Compactifiable f] (d : ℕ)
    (x : GeometricPoint X) (N : EtaleTraceNeighbourhood f d x)
    (hX : IsUnit (n : Γ(X, ⊤))) (hU : IsUnit (n : Γ(N.U, ⊤))) :
    (derivedTraceFunctor n hΛ N.f' d hU).obj (EtaleDerived.constant N.V) ⟶
      (pullback N.v).obj ((lowerShriek f).obj
        (((tateTwist n X hX hΛ d).obj (EtaleDerived.constant X))⟦(2*d : ℤ)⟧)) := sorry

/-- Curve effacement includes the zero R¹ transition and normalized top trace. -/
theorem curve_effacement_lemma (f : X ⟶ S) [Compactifiable f]
    [SmoothOfRelativeDimension 1 f] (hX : IsUnit (n : Γ(X, ⊤))) (x : GeometricPoint X) :
    ∃ (N : EtaleTraceNeighbourhood f 1 x) (hU : IsUnit (n : Γ(N.U, ⊤))),
      IsZero (higherLowerShriek (Λ := Λ) N.f' 0 (EtaleDerived.constant N.U)) ∧
      (DerivedCategory.homologyFunctor _ 1).map
        (neighbourhoodTransition f 1 x N (EtaleDerived.constant (Λ := Λ) X))=0 ∧
      IsIso (trace n hΛ N.f' 1 hU
        ((constantSheaf _ (ModuleCat.{u} Λ)).obj (ModuleCat.of Λ Λ))) := sorry

/-- Smooth effacement, including the derived factorization of 2.14.4 through the trace. -/
theorem smooth_effacement (f : X ⟶ S) [Compactifiable f] (d : ℕ)
    [SmoothOfRelativeDimension d f] (hX : IsUnit (n : Γ(X, ⊤))) (x : GeometricPoint X) :
    ∃ (N : EtaleTraceNeighbourhood f d x) (hU : IsUnit (n : Γ(N.U, ⊤))),
      (∀ q : ℤ, q<2*d → (DerivedCategory.homologyFunctor _ q).map
        (neighbourhoodTransition f d x N (EtaleDerived.constant (Λ := Λ) X))=0) ∧
      IsIso (trace n hΛ N.f' d hU
        ((constantSheaf _ (ModuleCat.{u} Λ)).obj (ModuleCat.of Λ Λ))) ∧
      ∃ β : EtaleDerived.constant (Λ := Λ) N.V ⟶ (pullback N.v).obj
        ((lowerShriek f).obj (((tateTwist n X hX hΛ d).obj
          (EtaleDerived.constant X))⟦(2*d : ℤ)⟧)),
        neighbourhoodTwistedTransition n hΛ f d x N hX hU=
          (derivedTrace n hΛ N.f' d hU).app (EtaleDerived.constant N.V) ≫ β := sorry

/-- The purity comparison is the adjoint mate of the constructed derived trace. -/
def smoothPurityMap (f : X ⟶ S) [Compactifiable f] (d : ℕ)
    [SmoothOfRelativeDimension d f] (hX : IsUnit (n : Γ(X, ⊤))) :
    pullback f ⋙ tateTwist n X hX hΛ d ⋙ shiftFunctor _ (2*d : ℤ) ⟶ upperShriek (Λ := Λ) f := sorry

lemma smoothPurityMap_mate (f : X ⟶ S) [Compactifiable f] (d : ℕ)
    [SmoothOfRelativeDimension d f] (hX : IsUnit (n : Γ(X, ⊤))) :
    Functor.whiskerRight (smoothPurityMap n hΛ f d hX) (lowerShriek f) ≫
      (lowerShriekUpperShriekAdjunction f).counit=derivedTrace n hΛ f d hX := sorry

theorem smooth_purity (f : X ⟶ S) [Compactifiable f] (d : ℕ)
    [SmoothOfRelativeDimension d f] (hX : IsUnit (n : Γ(X, ⊤))) :
    IsIso (smoothPurityMap n hΛ f d hX) := sorry

theorem top_degree_compact_cohomology {Ω : Type u} [Field Ω] [IsSepClosed Ω]
    (a : X ⟶ Spec (CommRingCat.of Ω)) [Compactifiable a] (d : ℕ)
    (hd : Order.krullDim X ≤ d) (q : ℤ) (hq : 2*(d : ℤ)<q) (F : EtaleSheaf Λ X) :
    IsZero (compactCohomologyModule a q ((DerivedCategory.singleFunctor _ 0).obj F)) := sorry

/-- The component computation uses reduced topology; multiplicities enter the trace separately. -/
theorem top_degree_components {Ω : Type u} [Field Ω] [IsSepClosed Ω]
    (a : X ⟶ Spec (CommRingCat.of Ω)) [Compactifiable a] (d : ℕ)
    (hd : Order.krullDim X≤d) (hX : IsUnit (n : Γ(X, ⊤)))
    (s : GeometricPoint (Spec (CommRingCat.of Ω))) :
    Nonempty (compactCohomologyModule a (2*d)
      ((tateTwist (Λ := Λ) n X hX hΛ d).obj (EtaleDerived.constant X)) ≅
        ModuleCat.of Λ (DirectSum (topFibreComponents a s d) (fun _ => Λ))) := sorry
end Purity


/-! ## EDC.1:biduality and EDC.2:pairings — named theorems -/

/-! ## Constructible biduality, including the one-dimensional étale base
Regularity and dimension are actual predicates below. Mathlib has no excellence predicate at
this pin, so the reader's excellence hypothesis is omitted from these prototype signatures,
as PROTOCOL §13 requires, and must be restored when that predicate is available.
-/
section Biduality
variable {Λ : Type u} [CommRing Λ] [TorsionCoefficients Λ]
  {k : Type u} [Field k] {X Y Z U S : Scheme.{u}}
  [CompactSpace X] [QuasiSeparatedSpace X] [CompactSpace Y] [QuasiSeparatedSpace Y]
  [CompactSpace Z] [QuasiSeparatedSpace Z] [CompactSpace U] [QuasiSeparatedSpace U]
  [CompactSpace S] [QuasiSeparatedSpace S]

theorem zmod_selfInjective (ℓ m : ℕ) [Fact ℓ.Prime] :
    Module.Injective (ZMod (ℓ^m)) (ZMod (ℓ^m)) := sorry

/-- The coefficient theorem applies to every DVR, including ramified coefficient extensions. -/
theorem dvr_quotient_selfInjective (O : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    (m : ℕ) (hm : 0<m) :
    Module.Injective (O ⧸ (IsLocalRing.maximalIdeal O)^m)
      (O ⧸ (IsLocalRing.maximalIdeal O)^m) := sorry

def moduleDoubleDualEval (M : ModuleCat.{u} Λ) : M →ₗ[Λ] ((M →ₗ[Λ] Λ) →ₗ[Λ] Λ) := sorry
lemma moduleDoubleDualEval_bijective [IsNoetherianRing Λ] [Module.Injective Λ Λ]
    (M : ModuleCat.{u} Λ) [Module.Finite Λ M] : Function.Bijective (moduleDoubleDualEval M) := sorry

/-- Genuine local regularity and dimension bound, not coherent-sheaf duality. -/
class RegularCurveBase (S : Scheme.{u}) : Prop where
  [noetherian : IsLocallyNoetherian S]
  regular : ∀ s : S, IsRegularLocalRing (S.presheaf.stalk s)
  dimension : Order.krullDim S ≤ 1
attribute [instance] RegularCurveBase.noetherian

def baseVerdierDual (S : Scheme.{u}) : (EtaleDerived Λ S)ᵒᵖ ⥤ EtaleDerived Λ S :=
  (internalHom S).flip.obj (EtaleDerived.constant S)
def baseVerdierDualEval (S : Scheme.{u}) (K : EtaleDerived Λ S) :
    K ⟶ (baseVerdierDual S).obj (Opposite.op ((baseVerdierDual S).obj (Opposite.op K))) := sorry

theorem one_dimensional_dualizing_base [IsNoetherianRing Λ] [Module.Injective Λ Λ]
    [RegularCurveBase S] [CoefficientsOn Λ S] (K : EtaleDerived Λ S)
    (hK : IsConstructibleComplex K) :
    IsConstructibleComplex ((baseVerdierDual S).obj (Opposite.op K)) ∧
      IsIso (baseVerdierDualEval S K) := sorry

theorem regularBase_closedPoint_purity [RegularCurveBase S] [CoefficientsOn Λ S]
    (i : Spec (CommRingCat.of k) ⟶ S) [IsClosedImmersion i]
    (hc : ∀ x, Order.coheight (i.base x)=1) [CoefficientsOn Λ (Spec (CommRingCat.of k))] :
    Nonempty ((upperShriek (Λ := Λ) i).obj (EtaleDerived.constant S) ≅
      ((tateTwist (coefficientModulus Λ (Spec (CommRingCat.of k))) _
        (coefficientModulus_unit _) (coefficientModulus_killed _) (-1)).obj
          (EtaleDerived.constant _))⟦(-2 : ℤ)⟧) := sorry

/-- Relative duality uses a!Λ_S, with the base fixed before biduality. -/
def relativeVerdierDual (a : X ⟶ S) [Compactifiable a] :
    (EtaleDerived Λ X)ᵒᵖ ⥤ EtaleDerived Λ X :=
  (internalHom X).flip.obj (relativeDualizingComplex a)
def relativeVerdierDualEval (a : X ⟶ S) [Compactifiable a] (K : EtaleDerived Λ X) :
    K ⟶ (relativeVerdierDual a).obj
      (Opposite.op ((relativeVerdierDual a).obj (Opposite.op K))) := sorry

theorem constructible_biduality [IsNoetherianRing Λ] [Module.Injective Λ Λ]
    (a : X ⟶ Spec (CommRingCat.of k)) [Compactifiable a] [CoefficientsOn Λ X]
    (K : EtaleDerived Λ X) (hK : IsConstructibleComplex K) :
    IsConstructibleComplex ((verdierDual a).obj (Opposite.op K)) ∧
      IsIso (verdierDualEval a K) := sorry

theorem constructible_biduality_regularBase [IsNoetherianRing Λ] [Module.Injective Λ Λ]
    [RegularCurveBase S] [CoefficientsOn Λ S] [CoefficientsOn Λ X]
    (a : X ⟶ S) [Compactifiable a] (K : EtaleDerived Λ X) (hK : IsConstructibleComplex K) :
    IsConstructibleComplex ((relativeVerdierDual a).obj (Opposite.op K)) ∧
      IsIso (relativeVerdierDualEval a K) := sorry

theorem verdierDual_preservesCtf [IsNoetherianRing Λ]
    (a : X ⟶ Spec (CommRingCat.of k)) [Compactifiable a] [CoefficientsOn Λ X]
    (K : EtaleDerived Λ X) (hK : IsCtf K) :
    IsCtf ((verdierDual a).obj (Opposite.op K)) ∧ IsIso (verdierDualEval a K) := sorry

def constructibleObjects (X : Scheme.{u}) : ObjectProperty (EtaleDerived Λ X) := IsConstructibleComplex
abbrev ConstructibleDerived (Λ : Type u) [CommRing Λ] (X : Scheme.{u}) :=
  (constructibleObjects (Λ := Λ) X).FullSubcategory

def constructibleBidualityEquivalence [IsNoetherianRing Λ] [Module.Injective Λ Λ]
    (a : X ⟶ Spec (CommRingCat.of k)) [Compactifiable a] [CoefficientsOn Λ X] :
    (ConstructibleDerived Λ X)ᵒᵖ ≌ ConstructibleDerived Λ X := sorry

theorem dualizingComplex_smooth (n : ℕ) [NeZero n] (hΛ : (n : Λ)=0)
    (a : X ⟶ Spec (CommRingCat.of k)) (d : ℕ) [SmoothOfRelativeDimension d a]
    [Compactifiable a] (hX : IsUnit (n : Γ(X, ⊤))) :
    Nonempty (dualizingComplex (Λ := Λ) a ≅
      ((tateTwist n X hX hΛ d).obj (EtaleDerived.constant X))⟦(2*d : ℤ)⟧) := sorry

/-- Reverse exchange is stated only after constructible biduality. -/
theorem verdierDual_pushforward [IsNoetherianRing Λ] [Module.Injective Λ Λ]
    (a : X ⟶ Spec (CommRingCat.of k)) (b : Y ⟶ Spec (CommRingCat.of k))
    [Compactifiable a] [Compactifiable b] [CoefficientsOn Λ X] [CoefficientsOn Λ Y]
    (f : X ⟶ Y) [Compactifiable f] (hf : f ≫ b=a) (K : EtaleDerived Λ X)
    (hK : IsConstructibleComplex K) :
    Nonempty ((verdierDual b).obj (Opposite.op ((pushforward f).obj K)) ≅
      (lowerShriek f).obj ((verdierDual a).obj (Opposite.op K))) := sorry

theorem verdierDual_upperShriek [IsNoetherianRing Λ] [Module.Injective Λ Λ]
    (a : X ⟶ Spec (CommRingCat.of k)) (b : Y ⟶ Spec (CommRingCat.of k))
    [Compactifiable a] [Compactifiable b] [CoefficientsOn Λ X] [CoefficientsOn Λ Y]
    (f : X ⟶ Y) [Compactifiable f] (hf : f ≫ b=a) (K : EtaleDerived Λ Y)
    (hK : IsConstructibleComplex K) :
    Nonempty ((verdierDual a).obj (Opposite.op ((upperShriek f).obj K)) ≅
      (pullback f).obj ((verdierDual b).obj (Opposite.op K))) := sorry

theorem upperShriek_preservesConstructible [IsNoetherianRing Λ] [Module.Injective Λ Λ]
    (a : X ⟶ Spec (CommRingCat.of k)) (b : Y ⟶ Spec (CommRingCat.of k))
    [Compactifiable a] [Compactifiable b] [CoefficientsOn Λ X] [CoefficientsOn Λ Y]
    (f : X ⟶ Y) [Compactifiable f] (hf : f ≫ b=a) (K : EtaleDerived Λ Y)
    (hK : IsConstructibleComplex K) : IsConstructibleComplex ((upperShriek f).obj K) := sorry

/-- The four adjunctions and full faithfulness are actual categorical properties. -/
theorem recollement_adjunctions (i : Z ⟶ X) [IsClosedImmersion i]
    (j : U ⟶ X) [IsOpenImmersion j] [QuasiCompact j]
    (hc : Set.range j.base=(Set.range i.base)ᶜ) :
    Nonempty (pullback (Λ := Λ) i ⊣ pushforward i) ∧
    Nonempty (pushforward (Λ := Λ) i ⊣ upperShriek i) ∧
    Nonempty (lowerShriek (Λ := Λ) j ⊣ pullback j) ∧
    Nonempty (pullback (Λ := Λ) j ⊣ pushforward j) ∧
    (pushforward (Λ := Λ) i).Full ∧ (pushforward (Λ := Λ) i).Faithful ∧
    (lowerShriek (Λ := Λ) j).Full ∧ (lowerShriek (Λ := Λ) j).Faithful ∧
    (pushforward (Λ := Λ) j).Full ∧ (pushforward (Λ := Λ) j).Faithful := sorry

theorem recollement_orthogonality (i : Z ⟶ X) [IsClosedImmersion i]
    (j : U ⟶ X) [IsOpenImmersion j] [QuasiCompact j]
    (hc : Set.range j.base=(Set.range i.base)ᶜ) :
    (∀ K : EtaleDerived Λ Z, IsZero ((pullback j).obj ((pushforward i).obj K))) ∧
    (∀ K : EtaleDerived Λ U, IsZero ((pullback i).obj ((lowerShriek j).obj K))) ∧
    (∀ K : EtaleDerived Λ U, IsZero ((upperShriek i).obj ((pushforward j).obj K))) := sorry

/-- Connecting map for extension by zero and closed restriction. -/
def recollementConnecting (i : Z ⟶ X) [IsClosedImmersion i]
    (j : U ⟶ X) [IsOpenImmersion j] [QuasiCompact j]
    (hc : Set.range j.base=(Set.range i.base)ᶜ) (K : EtaleDerived Λ X) :
    (pushforward i).obj ((pullback i).obj K) ⟶
      ((lowerShriek j).obj ((pullback j).obj K))⟦(1 : ℤ)⟧ := sorry

def recollementFirstTriangle (i : Z ⟶ X) [IsClosedImmersion i]
    (j : U ⟶ X) [IsOpenImmersion j] [QuasiCompact j]
    (hc : Set.range j.base=(Set.range i.base)ᶜ) (K : EtaleDerived Λ X) :
    Pretriangulated.Triangle (EtaleDerived Λ X) :=
  Pretriangulated.Triangle.mk
    ((Classical.choice (lowerShriek_openImmersion j)).counit.app K)
    ((pullbackPushforwardAdjunction i).unit.app K) (recollementConnecting i j hc K)

theorem recollement_triangles (i : Z ⟶ X) [IsClosedImmersion i]
    (j : U ⟶ X) [IsOpenImmersion j] [QuasiCompact j]
    (hc : Set.range j.base=(Set.range i.base)ᶜ) (K : EtaleDerived Λ X) :
    recollementFirstTriangle i j hc K ∈ distTriang _ ∧
      localizationTriangle i j hc K ∈ distTriang _ := sorry

/-- Finiteness and biduality restrict all six recollement functors to Dᵇ_c. -/
theorem recollement_preservesConstructible [IsNoetherianRing Λ] [Module.Injective Λ Λ]
    (a : X ⟶ Spec (CommRingCat.of k)) [Compactifiable a] [CoefficientsOn Λ X]
    (i : Z ⟶ X) [IsClosedImmersion i] (j : U ⟶ X)
    [IsOpenImmersion j] [QuasiCompact j] (hc : Set.range j.base=(Set.range i.base)ᶜ) :
    (∀ K : EtaleDerived Λ X, IsConstructibleComplex K →
      IsConstructibleComplex ((pullback i).obj K) ∧
      IsConstructibleComplex ((upperShriek i).obj K) ∧
      IsConstructibleComplex ((pullback j).obj K)) ∧
    (∀ K : EtaleDerived Λ Z, IsConstructibleComplex K →
      IsConstructibleComplex ((pushforward i).obj K)) ∧
    (∀ K : EtaleDerived Λ U, IsConstructibleComplex K →
      IsConstructibleComplex ((lowerShriek j).obj K) ∧
      IsConstructibleComplex ((pushforward j).obj K)) := sorry

theorem relative_duality (a : X ⟶ Spec (CommRingCat.of k)) [Compactifiable a] (K : EtaleDerived Λ X) :
    Nonempty ((pushforward a).obj ((verdierDual a).obj (Opposite.op K)) ≅
      ((internalHom _).obj (Opposite.op ((lowerShriek a).obj K))).obj (EtaleDerived.constant _)) := sorry

/-- EDS.1 derived Hom over the coefficient ring itself. -/
def moduleInternalHom : (DerivedCategory (ModuleCat.{u} Λ))ᵒᵖ ⥤
    DerivedCategory (ModuleCat.{u} Λ) ⥤ DerivedCategory (ModuleCat.{u} Λ) := sorry

def derivedCompactGlobalSections [IsSepClosed k] (a : X ⟶ Spec (CommRingCat.of k))
    [Compactifiable a] : EtaleDerived Λ X ⥤ DerivedCategory (ModuleCat.{u} Λ) :=
  lowerShriek a ⋙ derivedGlobalSections _

theorem geometric_duality [IsSepClosed k] (a : X ⟶ Spec (CommRingCat.of k))
    [Compactifiable a] (K : EtaleDerived Λ X) :
    Nonempty ((derivedGlobalSections X).obj ((verdierDual a).obj (Opposite.op K)) ≅
      ((moduleInternalHom).obj (Opposite.op ((derivedCompactGlobalSections a).obj K))).obj
        ((DerivedCategory.singleFunctor _ 0).obj (ModuleCat.of Λ Λ))) := sorry

theorem geometric_duality_cohomology [IsSepClosed k] [Module.Injective Λ Λ]
    (a : X ⟶ Spec (CommRingCat.of k)) [Compactifiable a] (K : EtaleDerived Λ X)
    (hK : IsConstructibleComplex K) (q : ℤ) :
    Nonempty (cohomologyModule (-q) ((verdierDual a).obj (Opposite.op K)) ≅
      ModuleCat.of Λ ((compactCohomologyModule a q K) →ₗ[Λ] Λ)) := sorry
end Biduality




/-! ## EDC.3 — purity, supported classes, Gysin maps and cycle classes -/
section Cycles
variable {Λ : Type u} [CommRing Λ] [TorsionCoefficients Λ]
  {k : Type u} [Field k] [PerfectField k]

/-- The SF.5 codimension subgroup of Mathlib's native locally finite cycle carrier. -/
def codimensionCycleGroup (X : Scheme.{u}) (r : ℕ) : AddSubgroup (AlgebraicCycle X ℤ) where
  carrier := {a | ∀ x, a x ≠ 0 → Order.coheight x = r}
  zero_mem' := by sorry
  add_mem' := by sorry
  neg_mem' := by sorry
abbrev CodimensionCycles (X : Scheme.{u}) (r : ℕ) := codimensionCycleGroup X r

/-- Rational equivalence subgroup, imported from SF.5/chow-group. -/
def rationalEquivalence (X : Scheme.{u}) (r : ℕ) : AddSubgroup (CodimensionCycles X r) := sorry
abbrev Chow (X : Scheme.{u}) (r : ℕ) := CodimensionCycles X r ⧸ rationalEquivalence X r

def cycleSupport {X : Scheme.{u}} (a : AlgebraicCycle X ℤ) : Set X :=
  ⋃ x ∈ Function.support a, closure ({x} : Set X)

def ProperIntersection (A : SmoothModel k) {r s : ℕ}
    (a : CodimensionCycles A.X r) (b : CodimensionCycles A.X s) : Prop :=
  Order.krullDim {x : A.X // x ∈ cycleSupport a.val ∧ x ∈ cycleSupport b.val} + r + s ≤ A.dimension

/-- SF.5 imports on the genuine graded cycle groups. -/
def cycleFlatPullback (A B : SmoothModel k) (f : B.X ⟶ A.X) [Flat f]
    (h : f ≫ A.a = B.a) (r : ℕ) : CodimensionCycles A.X r →+ CodimensionCycles B.X r := sorry

def cycleProperPushforward (A B : SmoothModel k) (f : B.X ⟶ A.X) [IsProper f]
    (h : f ≫ A.a = B.a) (r t : ℕ)
    (ht : (t : ℤ) = r - ((B.dimension : ℤ)-A.dimension)) :
    CodimensionCycles B.X r →+ CodimensionCycles A.X t := sorry

def intersectionCycle (A : SmoothModel k) {r s : ℕ}
    (a : CodimensionCycles A.X r) (b : CodimensionCycles A.X s)
    (hp : ProperIntersection A a b) : CodimensionCycles A.X (r+s) := sorry

/-- The fundamental cycle of an integral closed subscheme, imported from SF.5. -/
def integralCycle (A : SmoothModel k) {Z : Scheme.{u}} (i : Z ⟶ A.X)
    [IsClosedImmersion i] [IsIntegral Z] (c : ℕ)
    (hc : Order.krullDim Z+c=A.dimension) : CodimensionCycles A.X c := sorry

def supportedCohomology {X Z : Scheme.{u}} [CoefficientsOn Λ X]
    (i : Z ⟶ X) [IsClosedImmersion i] (q m : ℤ) : ModuleCat.{u} Λ :=
  cohomologyWithSupports i q ((tateTwist (coefficientModulus Λ X) X
    (coefficientModulus_unit X) (coefficientModulus_killed X) m).obj (EtaleDerived.constant X))

def supportedForget {X Z : Scheme.{u}} [CoefficientsOn Λ X]
    (i : Z ⟶ X) [IsClosedImmersion i] (q m : ℤ) :
    supportedCohomology (Λ := Λ) i q m ⟶ Coh X q m := sorry

def supportedPullback {X Z Y W : Scheme.{u}} [CoefficientsOn Λ X] [CoefficientsOn Λ Y]
    (i : Z ⟶ X) (j : W ⟶ Y) [IsClosedImmersion i] [IsClosedImmersion j]
    (f : Y ⟶ X) (g : W ⟶ Z) (sq : IsPullback g j i f) (q m : ℤ) :
    supportedCohomology (Λ := Λ) i q m ⟶ supportedCohomology j q m := sorry

/-- Node `EDC.3/smooth-pair-purity`: actual smooth pair and codimension, not arbitrary i. -/
theorem smooth_pair_purity (A B : SmoothModel k) [CoefficientsOn Λ A.X]
    [CoefficientsOn Λ B.X] (i : B.X ⟶ A.X) [IsClosedImmersion i]
    (h : i ≫ A.a=B.a) (c : ℕ) (hc : A.dimension=B.dimension+c) (q m : ℤ) :
    Nonempty (supportedCohomology (Λ := Λ) i (q+2*c) (m+c) ≅ Coh B.X q m) := sorry

theorem smooth_pair_purity_derived (A B : SmoothModel k) [CoefficientsOn Λ A.X]
    [CoefficientsOn Λ B.X] (i : B.X ⟶ A.X) [IsClosedImmersion i] [Compactifiable i]
    (h : i ≫ A.a=B.a) (c : ℕ) (hc : A.dimension=B.dimension+c) :
    Nonempty ((upperShriek (Λ := Λ) i).obj (EtaleDerived.constant A.X) ≅
      ((tateTwist (coefficientModulus Λ B.X) B.X (coefficientModulus_unit _)
        (coefficientModulus_killed _) (-c)).obj (EtaleDerived.constant B.X))⟦(-2*c : ℤ)⟧) := sorry

/-- Node `EDC.3/semi-purity`, including the codimension bound and coefficients. -/
theorem semi_purity (A : SmoothModel k) [CoefficientsOn Λ A.X] {Z : Scheme.{u}}
    (i : Z ⟶ A.X) [IsClosedImmersion i] (c : ℕ)
    (hc : Order.krullDim Z+c ≤ A.dimension) (q m : ℤ) (hq : q<2*c) :
    IsZero (supportedCohomology (Λ := Λ) i q m) := sorry

/-- The full locally constant coefficient form of semi-purity. -/
theorem semi_purity_lisse (A : SmoothModel k) [CoefficientsOn Λ A.X] {Z : Scheme.{u}}
    (i : Z ⟶ A.X) [IsClosedImmersion i] (c : ℕ)
    (hc : Order.krullDim Z+c ≤ A.dimension) (F : EtaleSheaf Λ A.X)
    (hF : IsLisseSheaf F) (q : ℤ) (hq : q<2*c) :
    IsZero (cohomologyWithSupports i q ((DerivedCategory.singleFunctor _ 0).obj F)) := sorry

/-- Integral cycle, pure codimension c; singular Z is permitted over the perfect field. -/
def fundamentalClass (A : SmoothModel k) [CoefficientsOn Λ A.X] {Z : Scheme.{u}}
    (i : Z ⟶ A.X) [IsClosedImmersion i] [IsIntegral Z] (c : ℕ)
    (hc : Order.krullDim Z+c=A.dimension) : supportedCohomology (Λ := Λ) i (2*c) c := sorry

lemma fundamentalClass_restrict (A B : SmoothModel k) [CoefficientsOn Λ A.X]
    [CoefficientsOn Λ B.X] {Z W : Scheme.{u}} (i : Z ⟶ A.X) (j : W ⟶ B.X)
    [IsClosedImmersion i] [IsClosedImmersion j] [IsIntegral Z] [IsIntegral W]
    (f : B.X ⟶ A.X) [IsOpenImmersion f] (g : W ⟶ Z) (sq : IsPullback g j i f)
    (h : f ≫ A.a=B.a) (c : ℕ) (hc : Order.krullDim Z+c=A.dimension)
    (hc' : Order.krullDim W+c=B.dimension) :
    supportedPullback i j f g sq (2*c) c (fundamentalClass (Λ := Λ) A i c hc) =
      fundamentalClass B j c hc' := sorry

/-- Purity's canonical orientation, imported from the smooth-pair purity isomorphism. -/
def purityGenerator (A B : SmoothModel k) [CoefficientsOn Λ A.X] [CoefficientsOn Λ B.X]
    (i : B.X ⟶ A.X) [IsClosedImmersion i] (h : i ≫ A.a=B.a)
    (c : ℕ) (hc : A.dimension=B.dimension+c) :
    supportedCohomology (Λ := Λ) i (2*c) c := sorry

lemma fundamentalClass_smooth (A B : SmoothModel k) [CoefficientsOn Λ A.X]
    [CoefficientsOn Λ B.X] [IsIntegral B.X] (i : B.X ⟶ A.X) [IsClosedImmersion i]
    (h : i ≫ A.a=B.a) (c : ℕ) (hc : A.dimension=B.dimension+c)
    (hd : Order.krullDim B.X+c=A.dimension) :
    fundamentalClass (Λ := Λ) A i c hd=purityGenerator A B i h c hc := sorry

def integralCartierDivisor (A : SmoothModel k) {Z : Scheme.{u}} (i : Z ⟶ A.X)
    [IsClosedImmersion i] [IsIntegral Z] (hc : Order.krullDim Z+1=A.dimension) :
    CartierDivisor A.X := sorry

lemma fundamentalClass_divisor (A : SmoothModel k) [CoefficientsOn Λ A.X] {Z : Scheme.{u}}
    (i : Z ⟶ A.X) [IsClosedImmersion i] [IsIntegral Z] (hc : Order.krullDim Z+1=A.dimension) :
    supportedForget i 2 1 (fundamentalClass (Λ := Λ) A i 1 hc)=
      firstChernClass (lineClass (divisorLineBundle (integralCartierDivisor A i hc))) := sorry

lemma fundamentalClass_etale (A B : SmoothModel k) [CoefficientsOn Λ A.X]
    [CoefficientsOn Λ B.X] {Z W : Scheme.{u}} (i : Z ⟶ A.X) (j : W ⟶ B.X)
    [IsClosedImmersion i] [IsClosedImmersion j] [IsIntegral Z] [IsIntegral W]
    (f : B.X ⟶ A.X) [Etale f] (g : W ⟶ Z) (sq : IsPullback g j i f)
    (h : f ≫ A.a=B.a) (c : ℕ) (hc : Order.krullDim Z+c=A.dimension)
    (hc' : Order.krullDim W+c=B.dimension) :
    supportedPullback i j f g sq (2*c) c (fundamentalClass (Λ := Λ) A i c hc)=
      fundamentalClass B j c hc' := sorry

/-- Additive supported class, with a closed support that actually contains the cycle. -/
def fundamentalClassOfCycle (A : SmoothModel k) [CoefficientsOn Λ A.X] {Z : Scheme.{u}}
    (i : Z ⟶ A.X) [IsClosedImmersion i] (c : ℕ) (a : CodimensionCycles A.X c)
    (ha : cycleSupport a.val ⊆ Set.range i.base) : supportedCohomology (Λ := Λ) i (2*c) c := sorry

/-- Gysin for an actual smooth pair; c is its dimension difference. -/
def gysin (A B : SmoothModel k) [CoefficientsOn Λ A.X] [CoefficientsOn Λ B.X]
    (i : B.X ⟶ A.X) [IsClosedImmersion i] (h : i ≫ A.a=B.a)
    (c : ℕ) (hc : A.dimension=B.dimension+c) (q m : ℤ) :
    Coh (Λ := Λ) B.X q m ⟶ Coh A.X (q+2*c) (m+c) := sorry

/-- Proper pushforward with e=dim(Y)−dim(X), including actual smooth structural maps. -/
def properPushforward (A B : SmoothModel k) [CoefficientsOn Λ A.X] [CoefficientsOn Λ B.X]
    (f : B.X ⟶ A.X) [IsProper f] (h : f ≫ A.a=B.a) (q m : ℤ) :
    Coh (Λ := Λ) B.X q m ⟶
      Coh A.X (q-2*((B.dimension : ℤ)-A.dimension)) (m-((B.dimension : ℤ)-A.dimension)) := sorry

/-- Standard geometric trace on a proper smooth model over a separably closed field. -/
def cohomologyTrace [IsSepClosed k] (A : SmoothModel k) [IsProper A.a] [CoefficientsOn Λ A.X] :
    Coh (Λ := Λ) A.X (2*A.dimension) A.dimension ⟶ ModuleCat.of Λ Λ := sorry

lemma properPushforward_projection (A B : SmoothModel k) [CoefficientsOn Λ A.X]
    [CoefficientsOn Λ B.X] (f : B.X ⟶ A.X) [IsProper f] (h : f ≫ A.a=B.a)
    (q r m t : ℤ) (x : Coh (Λ := Λ) B.X q m) (y : Coh A.X r t) :
    properPushforward A B f h (q+r) (m+t) (cup x (cohPullback f r t y)) =
      (cohCast (by omega) (by omega)).hom (cup (properPushforward A B f h q m x) y) := sorry

lemma properPushforward_comp (A B C : SmoothModel k) [CoefficientsOn Λ A.X]
    [CoefficientsOn Λ B.X] [CoefficientsOn Λ C.X] (f : B.X ⟶ A.X) (g : C.X ⟶ B.X)
    [IsProper f] [IsProper g] [IsProper (g ≫ f)] (hf : f ≫ A.a=B.a) (hg : g ≫ B.a=C.a)
    (hgf : (g ≫ f) ≫ A.a=C.a) (q m : ℤ) (x : Coh (Λ := Λ) C.X q m) :
    properPushforward A C (g ≫ f) hgf q m x =
      (cohCast (by omega) (by omega)).hom
        (properPushforward A B f hf (q-2*((C.dimension : ℤ)-B.dimension))
          (m-((C.dimension : ℤ)-B.dimension)) (properPushforward B C g hg q m x)) := sorry

lemma gysin_one (A B : SmoothModel k) [CoefficientsOn Λ A.X] [CoefficientsOn Λ B.X]
    (i : B.X ⟶ A.X) [IsClosedImmersion i] (h : i ≫ A.a=B.a)
    (c : ℕ) (hc : A.dimension=B.dimension+c) :
    gysin (Λ := Λ) A B i h c hc 0 0 (cohOne B.X)=
      (cohCast (by omega) (by omega)).hom (supportedForget i (2*c) c (purityGenerator A B i h c hc)) := sorry

lemma trace_properPushforward [IsSepClosed k] (A B : SmoothModel k)
    [CoefficientsOn Λ A.X] [CoefficientsOn Λ B.X] [IsProper A.a] [IsProper B.a]
    (f : B.X ⟶ A.X) [IsProper f] (h : f ≫ A.a=B.a) (x : Coh (Λ := Λ) B.X (2*B.dimension) B.dimension) :
    cohomologyTrace A ((cohCast (by omega) (by omega)).hom
      (properPushforward A B f h (2*B.dimension) B.dimension x))=cohomologyTrace B x := sorry

/-- The sheaf trace's induced cohomology map, imported from the finite-flat trace node. -/
def finiteFlatCohomologyTrace (A B : SmoothModel k) [CoefficientsOn Λ A.X]
    [CoefficientsOn Λ B.X] (f : B.X ⟶ A.X) [IsFinite f] [Flat f]
    (h : f ≫ A.a=B.a) (q m : ℤ) : Coh (Λ := Λ) B.X q m ⟶ Coh A.X q m := sorry

lemma properPushforward_finiteFlat (A B : SmoothModel k) [CoefficientsOn Λ A.X]
    [CoefficientsOn Λ B.X] (f : B.X ⟶ A.X) [IsFinite f] [IsProper f] [Flat f]
    (h : f ≫ A.a=B.a) (hd : B.dimension=A.dimension) (q m : ℤ) (x : Coh (Λ := Λ) B.X q m) :
    (cohCast (by omega) (by omega)).hom (properPushforward A B f h q m x)=
      finiteFlatCohomologyTrace A B f h q m x := sorry

lemma gysin_baseChange (A B A' B' : SmoothModel k) [CoefficientsOn Λ A.X]
    [CoefficientsOn Λ B.X] [CoefficientsOn Λ A'.X] [CoefficientsOn Λ B'.X]
    (i : B.X ⟶ A.X) (i' : B'.X ⟶ A'.X) [IsClosedImmersion i] [IsClosedImmersion i']
    (g : A'.X ⟶ A.X) (g' : B'.X ⟶ B.X) (sq : IsPullback g' i' i g)
    (hi : i ≫ A.a=B.a) (hi' : i' ≫ A'.a=B'.a) (c : ℕ)
    (hc : A.dimension=B.dimension+c) (hc' : A'.dimension=B'.dimension+c)
    (q m : ℤ) (x : Coh (Λ := Λ) B.X q m) :
    cohPullback g (q+2*c) (m+c) (gysin A B i hi c hc q m x)=
      gysin A' B' i' hi' c hc' q m (cohPullback g' q m x) := sorry

lemma gysin_eq_properPushforward (A B : SmoothModel k) [CoefficientsOn Λ A.X]
    [CoefficientsOn Λ B.X] (i : B.X ⟶ A.X) [IsClosedImmersion i] [IsProper i]
    (h : i ≫ A.a=B.a) (c : ℕ) (hc : A.dimension=B.dimension+c) (q m : ℤ)
    (x : Coh (Λ := Λ) B.X q m) : gysin A B i h c hc q m x=
      (cohCast (by omega) (by omega)).hom (properPushforward A B i h q m x) := sorry

/-- Test `properPushforward_id`. -/
example (A : SmoothModel k) [CoefficientsOn Λ A.X] (q m : ℤ) (x : Coh (Λ := Λ) A.X q m) :
    (cohCast (by omega) (by omega)).hom (properPushforward A A (𝟙 _) (by simp) q m x)=x := sorry

/-- Node `EDC.3/gysin-sequence`: actual complementary open and the shifted support term. -/
def gysinBoundary (A B : SmoothModel k) [CoefficientsOn Λ A.X] [CoefficientsOn Λ B.X]
    {U : Scheme.{u}} [CoefficientsOn Λ U] (i : B.X ⟶ A.X) [IsClosedImmersion i]
    (j : U ⟶ A.X) [IsOpenImmersion j] (hcomp : Set.range j.base=(Set.range i.base)ᶜ)
    (h : i ≫ A.a=B.a) (c : ℕ) (hc : A.dimension=B.dimension+c) (q m : ℤ) :
    Coh (Λ := Λ) U q m ⟶ Coh B.X (q+1-2*c) (m-c) := sorry

theorem gysin_sequence (A B : SmoothModel k) [CoefficientsOn Λ A.X] [CoefficientsOn Λ B.X]
    {U : Scheme.{u}} [CoefficientsOn Λ U] (i : B.X ⟶ A.X) [IsClosedImmersion i]
    (j : U ⟶ A.X) [IsOpenImmersion j] (hcomp : Set.range j.base=(Set.range i.base)ᶜ)
    (h : i ≫ A.a=B.a) (c : ℕ) (hc : A.dimension=B.dimension+c) (q m : ℤ) :
    Function.Exact (cohPullback (Λ := Λ) j q m) (gysinBoundary A B i j hcomp h c hc q m) := sorry

def cupPower {X : Scheme.{u}} [CoefficientsOn Λ X] (x : Coh (Λ := Λ) X 2 1) (r : ℕ) :
    Coh (Λ := Λ) X (2*r) r := sorry


/-- Node `EDC.3/projective-bundle-freeness`, the complete cup-power comparison. -/
def projectiveBundleComparison {X : Scheme.{u}} [CoefficientsOn Λ X]
    (r : ℕ) (E : Bundle X (r+1)) (q m : ℤ) :
    ModuleCat.of Λ (DirectSum (Fin (r+1)) (fun j => Coh (Λ := Λ) X (q-2*j.val) (m-j.val))) ⟶
      Coh (projectiveBundle E) q m := sorry

lemma projectiveBundleComparison_single {X : Scheme.{u}} [CoefficientsOn Λ X]
    (r : ℕ) (E : Bundle X (r+1)) (q m : ℤ) (j : Fin (r+1))
    (x : Coh (Λ := Λ) X (q-2*j.val) (m-j.val)) :
    projectiveBundleComparison r E q m (DirectSum.of _ j x)=
      (cohCast (by omega) (by omega)).hom
        (cup (cohPullback (projectiveProjection E) (q-2*j.val) (m-j.val) x)
          (cupPower (firstChernClass (lineClass (projectiveO1 E))) j.val)) := sorry

theorem projective_bundle_freeness {X : Scheme.{u}} [CoefficientsOn Λ X]
    (r : ℕ) (E : Bundle X (r+1)) (q m : ℤ) :
    IsIso (projectiveBundleComparison (Λ := Λ) r E q m) := sorry

/-- EDC's cohomological Chern classes; the vector bundle is imported. -/
def chernClass {X : Scheme.{u}} [CoefficientsOn Λ X] {r : ℕ} (E : Bundle X r) (j : ℕ) :
    Coh (Λ := Λ) X (2*j) j := sorry

def totalChernClass {X : Scheme.{u}} [CoefficientsOn Λ X] {r : ℕ} (E : Bundle X r) :
    ChernRing (Λ := Λ) X := sorry

lemma chernClass_zero {X : Scheme.{u}} [CoefficientsOn Λ X] {r : ℕ} (E : Bundle X r) :
    chernClass (Λ := Λ) E 0=cohOne X := sorry
lemma totalChernClass_eq_sum {X : Scheme.{u}} [CoefficientsOn Λ X] {r : ℕ} (E : Bundle X r) :
    totalChernClass (Λ := Λ) E=∑ j : Fin (r+1), chernInclude j.val (chernClass E j.val) := sorry
lemma totalChernClass_isUnit {X : Scheme.{u}} [CompactSpace X] [CoefficientsOn Λ X]
    {r : ℕ} (E : Bundle X r) : IsUnit (totalChernClass (Λ := Λ) E) := sorry

lemma chernClass_pullback {X Y : Scheme.{u}} [CoefficientsOn Λ X] [CoefficientsOn Λ Y]
    (f : Y ⟶ X) {r : ℕ} (E : Bundle X r) (j : ℕ) :
    chernClass (Λ := Λ) (bundlePullback f E) j=cohPullback f (2*j) j (chernClass E j) := sorry

lemma chernClass_one_lineBundle {X : Scheme.{u}} [CoefficientsOn Λ X]
    (L : TauCeti.AlgebraicGeometry.InvertibleSheaf X) :
    chernClass (Λ := Λ) (lineBundle L) 1=firstChernClass (lineClass L) := sorry

lemma totalChernClass_whitney {X : Scheme.{u}} [CoefficientsOn Λ X] {r s t : ℕ}
    (E' : Bundle X r) (E : Bundle X s) (E'' : Bundle X t)
    (f : E'.val.obj ⟶ E.val.obj) (g : E.val.obj ⟶ E''.val.obj) [Mono f] [Epi g]
    (hz : f ≫ g=0) (he : (ShortComplex.mk f g hz).Exact) :
    totalChernClass (Λ := Λ) E=totalChernClass E' * totalChernClass E'' := sorry

lemma chernClass_eq_zero_of_rank_lt {X : Scheme.{u}} [CoefficientsOn Λ X]
    {r : ℕ} (E : Bundle X r) (j : ℕ) (hj : r<j) : chernClass (Λ := Λ) E j=0 := sorry

lemma chernClass_projectiveBundle_relation {X : Scheme.{u}} [CoefficientsOn Λ X]
    (r : ℕ) (E : Bundle X (r+1)) :
    let ξ := chernInclude 1 (firstChernClass (Λ := Λ) (lineClass (projectiveO1 E)))
    ∑ j : Fin (r+2), chernRingPullback (projectiveProjection E)
      (chernInclude j.val (chernClass E j.val))*ξ^(r+1-j.val)=0 := sorry

/-- Imported split bundle of the listed lines. -/
def splitBundle {X : Scheme.{u}} {r : ℕ} (L : Fin r → TauCeti.AlgebraicGeometry.InvertibleSheaf X) :
    Bundle X r := sorry

def tangentProjectiveBundle (k : Type u) [Field k] (m : ℕ) : Bundle (projectiveModel k m).X m := sorry

/-- Test `chernClass_tangent_projectiveSpace`. -/
example (m : ℕ) [CoefficientsOn Λ (projectiveModel k m).X] :
    totalChernClass (Λ := Λ) (tangentProjectiveBundle k m)=
      (1+chernInclude 1 (firstChernClass (lineClass (projectiveHyperplaneBundle k m))))^(m+1) := sorry
/-- Test `chernClass_trivial`. -/
example {X : Scheme.{u}} [CoefficientsOn Λ X] (r : ℕ) :
    totalChernClass (Λ := Λ) (trivialBundle X r)=1 := sorry
/-- Test `chernClass_sum_lines`. -/
example {X : Scheme.{u}} [CoefficientsOn Λ X] (r : ℕ)
    (L : Fin r → TauCeti.AlgebraicGeometry.InvertibleSheaf X) :
    totalChernClass (Λ := Λ) (splitBundle L)=
      ∏ j, (1+chernInclude 1 (firstChernClass (lineClass (L j)))) := sorry
/-- Test `not_chernClass_two_of_line`. -/
example {X : Scheme.{u}} [CoefficientsOn Λ X] (L : TauCeti.AlgebraicGeometry.InvertibleSheaf X) :
    chernClass (Λ := Λ) (lineBundle L) 2=0 := sorry

/-- The cycle-class map is on the genuine codimension subgroup, not all AlgebraicCycle. -/
def cycleClass (A : SmoothModel k) [CoefficientsOn Λ A.X] (r : ℕ) :
    CodimensionCycles A.X r →+ Coh (Λ := Λ) A.X (2*r) r := sorry

lemma cycleClass_rationalEquiv (A : SmoothModel k) [CoefficientsOn Λ A.X] (r : ℕ) :
    rationalEquivalence A.X r ≤ (cycleClass (Λ := Λ) A r).ker := sorry

def cartierCycle (A : SmoothModel k) (D : CartierDivisor A.X) : CodimensionCycles A.X 1 := sorry
lemma cycleClass_divisor (A : SmoothModel k) [CoefficientsOn Λ A.X] (D : CartierDivisor A.X) :
    cycleClass (Λ := Λ) A 1 (cartierCycle A D)=firstChernClass (lineClass (divisorLineBundle D)) := sorry

lemma cycleClass_pullback (A B : SmoothModel k) [CoefficientsOn Λ A.X] [CoefficientsOn Λ B.X]
    (f : B.X ⟶ A.X) [Flat f] (h : f ≫ A.a=B.a) (r : ℕ) (a : CodimensionCycles A.X r) :
    cycleClass (Λ := Λ) B r (cycleFlatPullback A B f h r a)=cohPullback f (2*r) r (cycleClass A r a) := sorry

lemma cycleClass_pushforward (A B : SmoothModel k) [CoefficientsOn Λ A.X] [CoefficientsOn Λ B.X]
    (f : B.X ⟶ A.X) [IsProper f] (h : f ≫ A.a=B.a) (r t : ℕ)
    (ht : (t : ℤ)=r-((B.dimension : ℤ)-A.dimension)) (a : CodimensionCycles B.X r) :
    cycleClass (Λ := Λ) A t (cycleProperPushforward A B f h r t ht a)=
      (cohCast (by omega) (by omega)).hom (properPushforward A B f h (2*r) r (cycleClass B r a)) := sorry

lemma cycleClass_intersection (A : SmoothModel k) [CoefficientsOn Λ A.X] {r s : ℕ}
    (a : CodimensionCycles A.X r) (b : CodimensionCycles A.X s) (hp : ProperIntersection A a b) :
    cycleClass (Λ := Λ) A (r+s) (intersectionCycle A a b hp)=
      (cohCast (by omega) (by omega)).hom (cup (cycleClass A r a) (cycleClass A s b)) := sorry

/-- A rational function and its divisor are SF.5 inputs, including singular integral generators. -/
def rationalFunction (X : Scheme.{u}) : Type (u+1) := sorry

def principalCycle (A : SmoothModel k) (f : rationalFunction A.X) : CodimensionCycles A.X 1 := sorry

def closedPointCycle [IsSepClosed k] (A : SmoothModel k) (x : Spec (CommRingCat.of k) ⟶ A.X)
    [IsClosedImmersion x] : CodimensionCycles A.X A.dimension := sorry

lemma trace_cycleClass_point [IsSepClosed k] (A : SmoothModel k) [CoefficientsOn Λ A.X]
    [IsProper A.a] (x : Spec (CommRingCat.of k) ⟶ A.X) [IsClosedImmersion x] :
    cohomologyTrace A (cycleClass (Λ := Λ) A A.dimension (closedPointCycle A x))=1 := sorry

/-- SF.0 geometric base change along Spec Ω → Spec k; actions require a descended model. -/
def geometricBaseChange {Ω : Type u} [Field Ω] [Algebra k Ω] (A : SmoothModel k) :
    SmoothModel Ω := sorry
lemma geometricBaseChange_scheme {Ω : Type u} [Field Ω] [Algebra k Ω] (A : SmoothModel k) :
    Nonempty ((geometricBaseChange (Ω := Ω) A).X ≅
      CategoryTheory.Limits.pullback A.a (Spec.map (CommRingCat.ofHom (algebraMap k Ω)))) := sorry

def cycleGaloisAction {Ω : Type u} [Field Ω] [Algebra k Ω] (σ : Ω ≃ₐ[k] Ω)
    (A : SmoothModel k) (r : ℕ) :
    CodimensionCycles (geometricBaseChange (Ω := Ω) A).X r ≃+
      CodimensionCycles (geometricBaseChange (Ω := Ω) A).X r := sorry

def cohomologyGaloisAction {Ω : Type u} [Field Ω] [Algebra k Ω] (σ : Ω ≃ₐ[k] Ω)
    (A : SmoothModel k) [CoefficientsOn Λ (geometricBaseChange (Ω := Ω) A).X] (q m : ℤ) :
    Coh (Λ := Λ) (geometricBaseChange (Ω := Ω) A).X q m ≃ₗ[Λ]
      Coh (Λ := Λ) (geometricBaseChange (Ω := Ω) A).X q m := sorry

lemma cycleClass_galois {Ω : Type u} [Field Ω] [PerfectField Ω] [Algebra k Ω]
    (σ : Ω ≃ₐ[k] Ω) (A : SmoothModel k)
    [CoefficientsOn Λ (geometricBaseChange (Ω := Ω) A).X] (r : ℕ)
    (a : CodimensionCycles (geometricBaseChange (Ω := Ω) A).X r) :
    cycleClass (Λ := Λ) (geometricBaseChange (Ω := Ω) A) r (cycleGaloisAction σ A r a)=
      cohomologyGaloisAction σ A (2*r) r
        (cycleClass (geometricBaseChange (Ω := Ω) A) r a) := sorry

/-- Normal bundle, owned by SF.5's deformation geometry. -/
def normalBundle (A B : SmoothModel k) (i : B.X ⟶ A.X) [IsClosedImmersion i]
    (h : i ≫ A.a=B.a) (c : ℕ) (hc : A.dimension=B.dimension+c) : Bundle B.X c := sorry

theorem self_intersection_formula (A B : SmoothModel k) [CoefficientsOn Λ A.X]
    [CoefficientsOn Λ B.X] (i : B.X ⟶ A.X) [IsClosedImmersion i]
    (h : i ≫ A.a=B.a) (c : ℕ) (hc : A.dimension=B.dimension+c) (q m : ℤ)
    (x : Coh (Λ := Λ) B.X q m) :
    cohPullback i (q+2*c) (m+c) (gysin A B i h c hc q m x)=
      (cohCast (by omega) (by omega)).hom (cup (chernClass (normalBundle A B i h c hc) c) x) := sorry

/-- Hyperplane powers in the even diagonal ring, independent of a cycle-map definition. -/
def hyperplaneClass (k : Type u) [Field k] (m : ℕ) [CoefficientsOn Λ (projectiveModel k m).X] :
    ChernRing (Λ := Λ) (projectiveModel k m).X :=
  chernInclude 1 (firstChernClass (lineClass (projectiveHyperplaneBundle k m)))

/-- The basis map is specified by actual hyperplane powers. -/
def projectiveBasisMap (m j : ℕ) [CoefficientsOn Λ (projectiveModel k m).X] :
    ModuleCat.of Λ Λ ⟶ Coh (Λ := Λ) (projectiveModel k m).X (2*j) j :=
  ModuleCat.ofHom (LinearMap.smulRight (LinearMap.id : Λ →ₗ[Λ] Λ)
    (cupPower (firstChernClass (lineClass (projectiveHyperplaneBundle k m))) j))

theorem projective_space_basis [IsSepClosed k] (m j : ℕ) (hj : j≤m)
    [CoefficientsOn Λ (projectiveModel k m).X] : IsIso (projectiveBasisMap (Λ := Λ) (k := k) m j) := sorry

theorem projective_space_cohomology [IsSepClosed k] (m : ℕ)
    [CoefficientsOn Λ (projectiveModel k m).X] (q t : ℤ)
    (hq : ¬ ∃ j : ℕ, j≤m ∧ q=2*j) : IsZero (Coh (Λ := Λ) (projectiveModel k m).X q t) := sorry

theorem projective_space_relation [IsSepClosed k] (m : ℕ)
    [CoefficientsOn Λ (projectiveModel k m).X] : (hyperplaneClass (Λ := Λ) k m)^(m+1)=0 := sorry

def projectiveCohomologyRingMap (m : ℕ) [CoefficientsOn Λ (projectiveModel k m).X] :
    (Polynomial Λ ⧸ Ideal.span {(Polynomial.X : Polynomial Λ)^(m+1)}) →+*
      ChernRing (Λ := Λ) (projectiveModel k m).X := sorry

theorem projective_space_ring [IsSepClosed k] (m : ℕ) [CoefficientsOn Λ (projectiveModel k m).X] :
    Function.Bijective (projectiveCohomologyRingMap (Λ := Λ) (k := k) m) ∧
      projectiveCohomologyRingMap (Λ := Λ) (k := k) m
        (Ideal.Quotient.mk _ Polynomial.X)=hyperplaneClass (Λ := Λ) k m := sorry

/-- SF.5 integral top intersection number of a line bundle. -/
def intersectionDegree (A : SmoothModel k) [IsProper A.a] (L : Picard A.X) : ℤ := sorry

theorem projective_degree_formula [IsSepClosed k] (A : SmoothModel k) [IsProper A.a]
    [CoefficientsOn Λ A.X] (L : Picard A.X) :
    cohomologyTrace A (cupPower (firstChernClass (Λ := Λ) L) A.dimension)=(intersectionDegree A L : Λ) := sorry

/-- Test `cycleClass_zero`. -/
example (A : SmoothModel k) [CoefficientsOn Λ A.X] (r : ℕ) : cycleClass (Λ := Λ) A r 0=0 := sorry
/-- Test `cycleClass_principal`. -/
example (A : SmoothModel k) [CoefficientsOn Λ A.X] (f : rationalFunction A.X) :
    cycleClass (Λ := Λ) A 1 (principalCycle A f)=0 := sorry

/-- Imported geometric linear-subspace cycle of codimension r. -/
def linearSubspaceCycle (k : Type u) [Field k] (m r : ℕ) (hr : r≤m) :
    CodimensionCycles (projectiveModel k m).X r := sorry

/-- Test `cycleClass_hyperplane`. -/
example [IsSepClosed k] (m r : ℕ) (hr : r≤m) [CoefficientsOn Λ (projectiveModel k m).X] :
    cycleClass (Λ := Λ) (projectiveModel k m) r (linearSubspaceCycle k m r hr)=
      cupPower (firstChernClass (lineClass (projectiveHyperplaneBundle k m))) r := sorry

/-- The integral degree of a zero-cycle, imported from SF.5. -/
def zeroCycleDegree (A : SmoothModel k) [IsProper A.a] :
    CodimensionCycles A.X A.dimension →+ ℤ := sorry

def cycleGradeCast {X : Scheme.{u}} {r s : ℕ} (h : r=s) :
    CodimensionCycles X r ≃+ CodimensionCycles X s := by subst s; exact AddEquiv.refl _

/-- Test `cycleClass_transverse_curves`: a finite étale fibre product gives multiplicity one. -/
example [IsSepClosed k] (A B C : SmoothModel k) [IsProper A.a]
    [CoefficientsOn Λ A.X] [IsIntegral B.X] [IsIntegral C.X]
    (hd : A.dimension=2) (i : B.X ⟶ A.X) (j : C.X ⟶ A.X)
    [IsClosedImmersion i] [IsClosedImmersion j]
    (hi : i ≫ A.a=B.a) (hj : j ≫ A.a=C.a)
    (hB : Order.krullDim B.X+1=A.dimension) (hC : Order.krullDim C.X+1=A.dimension)
    [IsFinite (CategoryTheory.Limits.pullback.fst i j ≫ B.a)] [Etale (CategoryTheory.Limits.pullback.fst i j ≫ B.a)] :
    cohomologyTrace A ((cohCast (by omega) (by omega)).hom
      (cup (cycleClass (Λ := Λ) A 1 (integralCycle A i 1 hB))
        (cycleClass A 1 (integralCycle A j 1 hC))))=(Nat.card (CategoryTheory.Limits.pullback i j : Scheme.{u}) : Λ) := sorry

/-- JacobianChallenge's genus of a smooth proper connected curve. -/
def curveGenus (A : SmoothModel k) [IsProper A.a] (hd : A.dimension=1) : ℕ := sorry

/-- Test `not_cycleClass_injective`: existence, not an assumed element of the kernel. -/
example [IsSepClosed k] (A : SmoothModel k) [IsProper A.a] [ConnectedSpace A.X]
    [CoefficientsOn Λ A.X] (hd : A.dimension=1) (hg : curveGenus A hd=1) :
    ∃ a : CodimensionCycles A.X 1,
      (QuotientAddGroup.mk' (rationalEquivalence A.X 1)) a ≠ 0 ∧
        zeroCycleDegree A (cycleGradeCast hd.symm a)=0 ∧ cycleClass (Λ := Λ) A 1 a=0 := sorry

/-- Geometry imports for the singular-divisor tests: the cubic y²z=x²(x+z). -/
def nodalCubic (k : Type u) [Field k] : Scheme.{u} := sorry
def nodalCubicImmersion (k : Type u) [Field k] : nodalCubic k ⟶ (projectiveModel k 2).X := sorry
instance nodalCubic_integral [CharZero k] : IsIntegral (nodalCubic k) := sorry
instance nodalCubic_closed : IsClosedImmersion (nodalCubicImmersion k) := sorry
lemma nodalCubic_codimension [CharZero k] :
    Order.krullDim (nodalCubic k)+1=(projectiveModel k 2).dimension := sorry

/-- Test `fundamentalClass_hyperplane`: the canonical supported orientation maps to c₁ O(1). -/
example [IsSepClosed k] (m : ℕ) [CoefficientsOn Λ (projectiveModel k m).X]
    [CoefficientsOn Λ (projectiveModel k (m+1)).X]
    (hi : hyperplaneImmersion k m ≫ (projectiveModel k (m+1)).a=(projectiveModel k m).a)
    (hd : (projectiveModel k (m+1)).dimension=(projectiveModel k m).dimension+1) :
    supportedForget (hyperplaneImmersion k m) 2 1
      (purityGenerator (Λ := Λ) (projectiveModel k (m+1)) (projectiveModel k m)
        (hyperplaneImmersion k m) hi 1 hd)=
      firstChernClass (lineClass (projectiveHyperplaneBundle k (m+1))) := sorry

/-- Test `fundamentalClass_nodalCubic`: singularity does not erase the degree-three divisor. -/
example [IsSepClosed k] [CharZero k] [CoefficientsOn Λ (projectiveModel k 2).X] :
    supportedForget (nodalCubicImmersion k) 2 1
      (fundamentalClass (Λ := Λ) (projectiveModel k 2) (nodalCubicImmersion k) 1
        (nodalCubic_codimension (k := k)))=
      3 • firstChernClass (lineClass (projectiveHyperplaneBundle k 2)) := sorry

/-- Test `fundamentalClass_whole`: the supported class of X in itself is the unit. -/
example (A : SmoothModel k) [CoefficientsOn Λ A.X] [IsIntegral A.X]
    (hd : Order.krullDim A.X+0=A.dimension) :
    supportedForget (𝟙 A.X) 0 0 (fundamentalClass (Λ := Λ) A (𝟙 _) 0 hd)=cohOne A.X := sorry

/-- SF.0 explicit crossing scheme Spec k[x,y]/(xy) and its rational origin. -/
def crossingScheme (k : Type u) [Field k] : Scheme.{u} := sorry
def crossingOrigin (k : Type u) [Field k] : Spec (CommRingCat.of k) ⟶ crossingScheme k := sorry
instance crossingOrigin_closed : IsClosedImmersion (crossingOrigin k) := sorry

/-- Test `not_fundamentalClass_purity_singular`: two local branches give two support classes. -/
example [IsSepClosed k] [Nontrivial Λ] [CoefficientsOn Λ (crossingScheme k)] :
    Nonempty (supportedCohomology (Λ := Λ) (crossingOrigin k) 2 1 ≅ ModuleCat.of Λ (Λ × Λ)) ∧
      ¬ Nonempty (supportedCohomology (Λ := Λ) (crossingOrigin k) 2 1 ≅ ModuleCat.of Λ Λ) := sorry

/-- Test `gysin_point_curve`: its canonical supported class has normalized trace one. -/
example [IsSepClosed k] (A : SmoothModel k) [IsProper A.a] [CoefficientsOn Λ A.X]
    (hd : A.dimension=1) (x : Spec (CommRingCat.of k) ⟶ A.X) [IsClosedImmersion x]
    (hx : Order.krullDim (Spec (CommRingCat.of k))+1=A.dimension) :
    cohomologyTrace A ((cohCast (by omega) (by omega)).hom
      (supportedForget x 2 1 (fundamentalClass (Λ := Λ) A x 1 hx)))=1 := sorry

/-- Test `gysin_hyperplane_powers`: i_* preserves hyperplane powers with the degree shift. -/
example [IsSepClosed k] (m r : ℕ) [CoefficientsOn Λ (projectiveModel k m).X]
    [CoefficientsOn Λ (projectiveModel k (m+1)).X]
    (hi : hyperplaneImmersion k m ≫ (projectiveModel k (m+1)).a=(projectiveModel k m).a)
    (hd : (projectiveModel k (m+1)).dimension=(projectiveModel k m).dimension+1) :
    gysin (Λ := Λ) (projectiveModel k (m+1)) (projectiveModel k m)
      (hyperplaneImmersion k m) hi 1 hd (2*r) r
      (cupPower (firstChernClass (lineClass (projectiveHyperplaneBundle k m))) r)=
        (cohCast (by omega) (by omega)).hom
          (cupPower (firstChernClass (lineClass (projectiveHyperplaneBundle k (m+1)))) (r+1)) := sorry

/-- Test `not_properPushforward_ring_hom`: a degree-two finite flat map multiplies the unit. -/
example [IsSepClosed k] [Nontrivial Λ] (A B : SmoothModel k)
    [CoefficientsOn Λ A.X] [CoefficientsOn Λ B.X] (f : B.X ⟶ A.X)
    [IsFinite f] [IsProper f] [Flat f] (h : f ≫ A.a=B.a) (hd : B.dimension=A.dimension)
    (hrank : ∀ x, f.finrank x=2) (hone : cohOne (Λ := Λ) A.X ≠ 0) :
    (cohCast (by omega) (by omega)).hom
      (properPushforward (Λ := Λ) A B f h 0 0 (cohOne B.X)) ≠ cohOne A.X := sorry

end Cycles


/-! ## EDC.2 pairings: finite, integral-adic, rational-adic and relative forms
Adic carriers are EllAdicRealization/EDC.6 imports: rational coefficients are lisse adic sheaves,
not discrete constant sheaves on the small étale site. The integral target retains Ext¹.
-/
section Pairings
variable {Λ : Type u} [CommRing Λ] [TorsionCoefficients Λ]
  {Ω : Type u} [Field Ω] [IsSepClosed Ω] {X U S : Scheme.{u}}
  [CompactSpace X] [QuasiSeparatedSpace X] [CompactSpace U] [QuasiSeparatedSpace U]
  [CompactSpace S] [QuasiSeparatedSpace S] (n : ℕ) [NeZero n] (hΛ : (n : Λ)=0)

/-- Degree-zero internal dual; self-injectivity makes it the exact dual on lisse finite modules. -/
def sheafDual {X : Scheme.{u}} (F : EtaleSheaf Λ X) : EtaleSheaf Λ X :=
  (DerivedCategory.homologyFunctor _ 0).obj
    (((internalHom X).obj (Opposite.op ((DerivedCategory.singleFunctor _ 0).obj F))).obj
      (EtaleDerived.constant X))

def twistedSheafComplex {X : Scheme.{u}} (hX : IsUnit (n : Γ(X, ⊤)))
    (F : EtaleSheaf Λ X) (m : ℤ) : EtaleDerived Λ X :=
  (tateTwist n X hX hΛ m).obj ((DerivedCategory.singleFunctor _ 0).obj F)

def poincarePairing (a : X ⟶ Spec (CommRingCat.of Ω)) [Compactifiable a]
    (d : ℕ) (hX : IsUnit (n : Γ(X, ⊤))) (i : ℤ) :
    compactCohomologyModule (Λ := Λ) a i (EtaleDerived.constant X) →ₗ[Λ]
      cohomologyModule (2*d-i) ((tateTwist n X hX hΛ d).obj (EtaleDerived.constant X)) →ₗ[Λ] Λ := sorry

def poincarePairingSheaf (a : X ⟶ Spec (CommRingCat.of Ω)) [Compactifiable a]
    (d : ℕ) (hX : IsUnit (n : Γ(X, ⊤))) (F : EtaleSheaf Λ X) (i : ℤ) :
    compactCohomologyModule a i ((DerivedCategory.singleFunctor _ 0).obj F) →ₗ[Λ]
      cohomologyModule (2*d-i) (twistedSheafComplex n hΛ hX (sheafDual F) d) →ₗ[Λ] Λ := sorry

theorem poincare_duality [IsNoetherianRing Λ] [Module.Injective Λ Λ]
    (a : X ⟶ Spec (CommRingCat.of Ω)) [Compactifiable a] (d : ℕ)
    [SmoothOfRelativeDimension d a] (hX : IsUnit (n : Γ(X, ⊤))) (i : ℤ) :
    (poincarePairing n hΛ a d hX i).IsPerfPair := sorry

theorem poincare_duality_lisse [IsNoetherianRing Λ] [Module.Injective Λ Λ]
    (a : X ⟶ Spec (CommRingCat.of Ω)) [Compactifiable a] (d : ℕ)
    [SmoothOfRelativeDimension d a] (hX : IsUnit (n : Γ(X, ⊤))) (F : EtaleSheaf Λ X)
    (hF : IsLisseSheaf F) (i : ℤ) : (poincarePairingSheaf n hΛ a d hX F i).IsPerfPair := sorry

/-- The trace on compact top-degree cohomology, induced by the derived trace. -/
def compactCohomologyTrace (a : X ⟶ Spec (CommRingCat.of Ω)) [Compactifiable a]
    (d : ℕ) [TraceDimension a d] (hX : IsUnit (n : Γ(X, ⊤))) :
    compactCohomologyModule (Λ := Λ) a (2*d)
      ((tateTwist n X hX hΛ d).obj (EtaleDerived.constant X)) ⟶ ModuleCat.of Λ Λ := sorry

/-- EDS.1 cup product followed by evaluation F⊗F∨→Λ, on compact cohomology. -/
def compactCupEvaluation (a : X ⟶ Spec (CommRingCat.of Ω)) [Compactifiable a]
    (d : ℕ) (hX : IsUnit (n : Γ(X, ⊤))) (F : EtaleSheaf Λ X) (i : ℤ) :
    compactCohomologyModule a i ((DerivedCategory.singleFunctor _ 0).obj F) →ₗ[Λ]
      cohomologyModule (2*d-i) (twistedSheafComplex n hΛ hX (sheafDual F) d) →ₗ[Λ]
        compactCohomologyModule a (2*d) ((tateTwist n X hX hΛ d).obj (EtaleDerived.constant X)) := sorry

theorem cup_product_trace_pairing [IsNoetherianRing Λ] [Module.Injective Λ Λ]
    (a : X ⟶ Spec (CommRingCat.of Ω)) [Compactifiable a] (d : ℕ)
    [SmoothOfRelativeDimension d a] (hX : IsUnit (n : Γ(X, ⊤)))
    (F : EtaleSheaf Λ X) (hF : IsLisseSheaf F) (i : ℤ)
    (x : compactCohomologyModule a i ((DerivedCategory.singleFunctor _ 0).obj F))
    (y : cohomologyModule (2*d-i) (twistedSheafComplex n hΛ hX (sheafDual F) d)) :
    poincarePairingSheaf n hΛ a d hX F i x y=
      compactCohomologyTrace n hΛ a d hX (compactCupEvaluation n hΛ a d hX F i x y) := sorry

/-- A chosen trivialization of Λ(d) on a geometric proper fibre identifies both factors. -/
def properMiddlePairing (a : X ⟶ Spec (CommRingCat.of Ω)) [Compactifiable a] [IsProper a]
    (d : ℕ) (hX : IsUnit (n : Γ(X, ⊤)))
    (e : (tateTwist n X hX hΛ d).obj (EtaleDerived.constant X) ≅ EtaleDerived.constant X) :
    cohomologyModule d (EtaleDerived.constant (Λ := Λ) X) →ₗ[Λ]
      cohomologyModule d (EtaleDerived.constant (Λ := Λ) X) →ₗ[Λ] Λ := sorry

theorem middle_pairing_alternating_of_two_unit (a : X ⟶ Spec (CommRingCat.of Ω))
    [Compactifiable a] [IsProper a] (d : ℕ) [SmoothOfRelativeDimension d a]
    (hd : Odd d) (h2 : IsUnit (2 : Λ)) (hX : IsUnit (n : Γ(X, ⊤)))
    (e : (tateTwist n X hX hΛ d).obj (EtaleDerived.constant X) ≅ EtaleDerived.constant X)
    (x : cohomologyModule d (EtaleDerived.constant (Λ := Λ) X)) :
    properMiddlePairing n hΛ a d hX e x x=0 := sorry

theorem curve_h1_duality [IsNoetherianRing Λ] [Module.Injective Λ Λ]
    (a : X ⟶ Spec (CommRingCat.of Ω)) [Compactifiable a] [SmoothOfRelativeDimension 1 a]
    [ConnectedSpace X] (hX : IsUnit (n : Γ(X, ⊤)))
    (F : EtaleSheaf Λ X) (hF : IsLisseSheaf F) (r : ℤ) :
    (poincarePairingSheaf n hΛ a 1 hX F r).IsPerfPair := sorry

/-- Alternation in dimension one uses the Weil pairing and holds also for 2-primary coefficients. -/
theorem curve_weil_alternation (a : X ⟶ Spec (CommRingCat.of Ω)) [Compactifiable a]
    [IsProper a] [SmoothOfRelativeDimension 1 a] [ConnectedSpace X]
    (hX : IsUnit (n : Γ(X, ⊤)))
    (e : (tateTwist n X hX hΛ 1).obj (EtaleDerived.constant X) ≅ EtaleDerived.constant X)
    (x : cohomologyModule 1 (EtaleDerived.constant (Λ := Λ) X)) :
    properMiddlePairing n hΛ a 1 hX e x x=0 := sorry

/-- The j_* here is underived, not Rj_*; density is an actual topological condition. -/
theorem curve_poincare_duality_j_star [IsNoetherianRing Λ] [Module.Injective Λ Λ]
    (a : X ⟶ Spec (CommRingCat.of Ω)) [Compactifiable a] [IsProper a]
    [SmoothOfRelativeDimension 1 a] [ConnectedSpace X] (j : U ⟶ X)
    [IsOpenImmersion j] [QuasiCompact j] (hdense : DenseRange j.base)
    (hX : IsUnit (n : Γ(X, ⊤))) (F : EtaleSheaf Λ U) (hF : IsLisseSheaf F) :
    Nonempty ((verdierDual a).obj
      (Opposite.op ((DerivedCategory.singleFunctor _ 0).obj ((sheafPushforward j).obj F))) ≅
        (twistedSheafComplex n hΛ hX ((sheafPushforward j).obj (sheafDual F)) 1)⟦(2 : ℤ)⟧) := sorry

/-- Monodromy is a genuine representation on the fibre. Its quotient is formed over Λ. -/
def etaleFundamentalGroup (X : Scheme.{u}) (x : GeometricPoint X) : Type u := sorry
instance (X : Scheme.{u}) (x : GeometricPoint X) : Group (etaleFundamentalGroup X x) := sorry

def lisseMonodromy (F : EtaleSheaf Λ X) (hF : IsLisseSheaf F) (x : GeometricPoint X) :
    Representation Λ (etaleFundamentalGroup X x)
      (stalkCohomology x 0 ((DerivedCategory.singleFunctor _ 0).obj F)) := sorry

def monodromyCoinvariants (F : EtaleSheaf Λ X) (hF : IsLisseSheaf F) (x : GeometricPoint X) :
    ModuleCat.{u} Λ :=
  ModuleCat.of Λ ((stalkCohomology x 0 ((DerivedCategory.singleFunctor _ 0).obj F)) ⧸
    Submodule.span Λ {v | ∃ g m, v=lisseMonodromy F hF x g m-m})

theorem extreme_degree_cohomology [IsNoetherianRing Λ] [Module.Injective Λ Λ]
    (a : X ⟶ Spec (CommRingCat.of Ω)) [Compactifiable a] (d : ℕ)
    [SmoothOfRelativeDimension d a] [ConnectedSpace X] (hX : IsUnit (n : Γ(X, ⊤)))
    (F : EtaleSheaf Λ X) (hF : IsLisseSheaf F) (x : GeometricPoint X) :
    Nonempty (compactCohomologyModule a (2*d) (twistedSheafComplex n hΛ hX F d) ≅
      monodromyCoinvariants F hF x) := sorry

theorem affine_compact_h0 (a : X ⟶ Spec (CommRingCat.of Ω)) [Compactifiable a]
    (d : ℕ) [SmoothOfRelativeDimension d a] [ConnectedSpace X] [IsAffine X]
    (hd : 0<d) (F : EtaleSheaf Λ X) (hF : IsLisseSheaf F) :
    IsZero (compactCohomologyModule a 0 ((DerivedCategory.singleFunctor _ 0).obj F)) := sorry

theorem rank_one_coinvariants_zero_of_unit (F : EtaleSheaf Λ X) (hF : IsLisseSheaf F)
    (x : GeometricPoint X) (e : stalkCohomology x 0 ((DerivedCategory.singleFunctor _ 0).obj F) ≅
      ModuleCat.of Λ Λ) (g : etaleFundamentalGroup X x) (χ : Λ)
    (hχ : ∀ v, e.hom (lisseMonodromy F hF x g v)=χ • e.hom v) (hu : IsUnit (χ-1)) :
    IsZero (monodromyCoinvariants F hF x) := sorry

/-- The sign-character example over Z/4 has coinvariants Z/4 modulo (2), not zero. -/
example : ¬ IsZero (ModuleCat.of (ZMod 4) ((ZMod 4) ⧸ Ideal.span {(2 : ZMod 4)})) := sorry

/-- Rq f_* as a sheaf, for the relative theorem. -/
def higherPushforward (f : X ⟶ S) (q : ℤ) (F : EtaleSheaf Λ X) : EtaleSheaf Λ S :=
  (DerivedCategory.homologyFunctor _ q).obj ((pushforward f).obj
    ((DerivedCategory.singleFunctor _ 0).obj F))

theorem relative_duality_locally_constant [IsNoetherianRing Λ] [Module.Injective Λ Λ]
    (f : X ⟶ S) [Compactifiable f] (d : ℕ) [SmoothOfRelativeDimension d f]
    (hS : IsUnit (n : Γ(S, ⊤))) (F : EtaleSheaf Λ X) (hF : IsLisseSheaf F)
    (hc : ∀ q : ℤ, IsLisseSheaf (higherLowerShriek f q
      ((DerivedCategory.singleFunctor _ 0).obj (sheafDual F)))) (q : ℤ) :
    Nonempty (higherPushforward f q F ≅ (DerivedCategory.homologyFunctor _ 0).obj
      (twistedSheafComplex n hΛ hS (sheafDual (higherLowerShriek f (2*d-q)
        ((DerivedCategory.singleFunctor _ 0).obj (sheafDual F)))) (-d))) := sorry
end Pairings

section GaloisPairings
variable {Λ : Type u} [CommRing Λ] [TorsionCoefficients Λ]
  {k Ω : Type u} [Field k] [PerfectField k] [Field Ω] [IsSepClosed Ω] [Algebra k Ω]

/-- SF.0's canonical projection of the geometric base change. -/
def geometricProjection (A : SmoothModel k) : (geometricBaseChange (Ω := Ω) A).X ⟶ A.X := sorry

def geometricSheaf (A : SmoothModel k) (F : EtaleSheaf Λ A.X) :
    EtaleSheaf Λ (geometricBaseChange (Ω := Ω) A).X := (sheafPullback (geometricProjection A)).obj F

def geometricSheafCohomology (A : SmoothModel k) (F : EtaleSheaf Λ A.X)
    [CoefficientsOn Λ (geometricBaseChange (Ω := Ω) A).X] (q m : ℤ) : ModuleCat.{u} Λ :=
  cohomologyModule q (twistedSheafComplex (coefficientModulus Λ (geometricBaseChange (Ω := Ω) A).X)
    (coefficientModulus_killed _) (coefficientModulus_unit _) (geometricSheaf A F) m)

def geometricSheafCompactCohomology (A : SmoothModel k) (F : EtaleSheaf Λ A.X)
    [Compactifiable (geometricBaseChange (Ω := Ω) A).a] (q : ℤ) : ModuleCat.{u} Λ :=
  compactCohomologyModule (geometricBaseChange (Ω := Ω) A).a q
    ((DerivedCategory.singleFunctor _ 0).obj (geometricSheaf A F))

def geometricSheafPairing (A : SmoothModel k) (F : EtaleSheaf Λ A.X)
    [CoefficientsOn Λ (geometricBaseChange (Ω := Ω) A).X]
    [Compactifiable (geometricBaseChange (Ω := Ω) A).a] (i : ℤ) :
    geometricSheafCompactCohomology (Ω := Ω) A F i →ₗ[Λ]
      geometricSheafCohomology (Ω := Ω) A (sheafDual F) (2*A.dimension-i) A.dimension →ₗ[Λ] Λ := sorry

def geometricCompactAction (σ : Ω ≃ₐ[k] Ω) (A : SmoothModel k) (F : EtaleSheaf Λ A.X)
    [Compactifiable (geometricBaseChange (Ω := Ω) A).a] (q : ℤ) :
    geometricSheafCompactCohomology (Ω := Ω) A F q ≃ₗ[Λ]
      geometricSheafCompactCohomology (Ω := Ω) A F q := sorry

def geometricCohomologyAction (σ : Ω ≃ₐ[k] Ω) (A : SmoothModel k) (F : EtaleSheaf Λ A.X)
    [CoefficientsOn Λ (geometricBaseChange (Ω := Ω) A).X] (q m : ℤ) :
    geometricSheafCohomology (Ω := Ω) A F q m ≃ₗ[Λ]
      geometricSheafCohomology (Ω := Ω) A F q m := sorry

theorem galois_frobenius_equivariance [IsNoetherianRing Λ] [Module.Injective Λ Λ]
    (σ : Ω ≃ₐ[k] Ω) (A : SmoothModel k) (F : EtaleSheaf Λ A.X) (hF : IsLisseSheaf F)
    [CoefficientsOn Λ (geometricBaseChange (Ω := Ω) A).X]
    [Compactifiable (geometricBaseChange (Ω := Ω) A).a] (i : ℤ)
    (x : geometricSheafCompactCohomology (Ω := Ω) A F i)
    (y : geometricSheafCohomology (Ω := Ω) A (sheafDual F) (2*A.dimension-i) A.dimension) :
    geometricSheafPairing A F i (geometricCompactAction σ A F i x)
      (geometricCohomologyAction σ A (sheafDual F) (2*A.dimension-i) A.dimension y)=
        geometricSheafPairing A F i x y := sorry

/-- Eigenvalue division is asserted only over a field. -/
theorem pairing_eigenvalues {E V W : Type u} [Field E] [AddCommGroup V] [Module E V]
    [AddCommGroup W] [Module E W] (B : V →ₗ[E] W →ₗ[E] E) (g : V ≃ₗ[E] V) (h : W ≃ₗ[E] W)
    (c α β : E) (hc : ∀ x y, B (g x) (h y)=c*B x y) (x : V) (y : W)
    (hx : g x=α • x) (hy : h y=β • y) (hb : B x y≠0) : α*β=c := sorry
end GaloisPairings

/-! Adic imports are typed data from the compatible-system realization supplier. -/
section AdicPairings
variable {O E Ω : Type u} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [Field E] [Field Ω] [IsSepClosed Ω]

def IntegralLisseSheaf (O : Type u) [CommRing O] (X : Scheme.{u}) : Type (u+1) := sorry
def integralDual {X : Scheme.{u}} : IntegralLisseSheaf O X → IntegralLisseSheaf O X := sorry
def integralTwist {X : Scheme.{u}} : IntegralLisseSheaf O X → ℤ → IntegralLisseSheaf O X := sorry

def integralRΓ (A : SmoothModel Ω) (F : IntegralLisseSheaf O A.X) :
    DerivedCategory (ModuleCat.{u} O) := sorry
def integralRcΓ (A : SmoothModel Ω) (F : IntegralLisseSheaf O A.X) :
    DerivedCategory (ModuleCat.{u} O) := sorry
def integralCohomology (A : SmoothModel Ω) (F : IntegralLisseSheaf O A.X) (q : ℤ) : ModuleCat.{u} O :=
  (DerivedCategory.homologyFunctor _ q).obj (integralRΓ A F)
def integralCompactCohomology (A : SmoothModel Ω) (F : IntegralLisseSheaf O A.X) (q : ℤ) : ModuleCat.{u} O :=
  (DerivedCategory.homologyFunctor _ q).obj (integralRcΓ A F)

/-- Integral ℓ-adic duality is derived, including torsion and its Ext¹ term. -/
theorem adic_poincare_duality (ℓ : ℕ) [Fact ℓ.Prime] [Algebra (PadicInt ℓ) O]
    [Module.Finite (PadicInt ℓ) O] (hℓ : (ℓ : Ω)≠0) (A : SmoothModel Ω)
    (F : IntegralLisseSheaf O A.X) :
    Nonempty ((integralRΓ A (integralTwist (integralDual F) A.dimension))⟦(2*A.dimension : ℤ)⟧ ≅
      ((moduleInternalHom).obj (Opposite.op (integralRcΓ A F))).obj
        ((DerivedCategory.singleFunctor _ 0).obj (ModuleCat.of O O))) := sorry

/-- EDS.1's Ext¹ over the DVR, as an O-module. -/
def moduleExtOne (M : ModuleCat.{u} O) : ModuleCat.{u} O := sorry

def adicUniversalCoefficientSequence (A : SmoothModel Ω) (F : IntegralLisseSheaf O A.X) (i : ℤ) :
    ShortComplex (ModuleCat.{u} O) := sorry

theorem adic_universal_coefficients (ℓ : ℕ) [Fact ℓ.Prime] [Algebra (PadicInt ℓ) O]
    [Module.Finite (PadicInt ℓ) O] (hℓ : (ℓ : Ω)≠0) (A : SmoothModel Ω)
    (F : IntegralLisseSheaf O A.X) (i : ℤ) :
    (adicUniversalCoefficientSequence A F i).ShortExact ∧
      (adicUniversalCoefficientSequence A F i).X₁=moduleExtOne (integralCompactCohomology A F (2*A.dimension-i+1)) ∧
      (adicUniversalCoefficientSequence A F i).X₂=integralCohomology A
        (integralTwist (integralDual F) A.dimension) i ∧
      (adicUniversalCoefficientSequence A F i).X₃=ModuleCat.of O
        ((integralCompactCohomology A F (2*A.dimension-i)) →ₗ[O] O) := sorry

/-- E/ℚℓ lisse sheaves, with cohomology defined by inverse limit followed by ⊗E. -/
def RationalLisseSheaf (E : Type u) [Field E] (X : Scheme.{u}) : Type (u+1) := sorry
instance (X : Scheme.{u}) : Category (RationalLisseSheaf E X) := sorry
instance (X : Scheme.{u}) : Preadditive (RationalLisseSheaf E X) := sorry
instance (X : Scheme.{u}) : Linear E (RationalLisseSheaf E X) := sorry

def rationalDual {X : Scheme.{u}} : RationalLisseSheaf E X → RationalLisseSheaf E X := sorry
def rationalTwist {X : Scheme.{u}} : RationalLisseSheaf E X → ℤ → RationalLisseSheaf E X := sorry
def rationalTensor {X : Scheme.{u}} : RationalLisseSheaf E X → RationalLisseSheaf E X → RationalLisseSheaf E X := sorry

def rationalCohomology (A : SmoothModel Ω) (F : RationalLisseSheaf E A.X) (q : ℤ) : ModuleCat.{u} E := sorry
def rationalCompactCohomology (A : SmoothModel Ω) (F : RationalLisseSheaf E A.X) (q : ℤ) : ModuleCat.{u} E := sorry

def rationalPoincarePairing (A : SmoothModel Ω) (F : RationalLisseSheaf E A.X) (i : ℤ) :
    rationalCompactCohomology A F i →ₗ[E]
      rationalCohomology A (rationalTwist (rationalDual F) A.dimension) (2*A.dimension-i) →ₗ[E] E := sorry

theorem rational_poincare_duality (ℓ : ℕ) [Fact ℓ.Prime] [Algebra (Padic ℓ) E]
    [FiniteDimensional (Padic ℓ) E] (hℓ : (ℓ : Ω)≠0) (A : SmoothModel Ω)
    (F : RationalLisseSheaf E A.X) (i : ℤ) :
    (rationalPoincarePairing A F i).IsPerfPair ∧
      FiniteDimensional E (rationalCompactCohomology A F i) ∧
      FiniteDimensional E (rationalCohomology A F i) := sorry

/-- Yu's H⁰ direction is Hom(F₂,F₁); H² has the opposite Hom direction before dualization. -/
theorem lisse_tensor_hom_duality_on_curves (ℓ : ℕ) [Fact ℓ.Prime] [Algebra (Padic ℓ) E]
    [FiniteDimensional (Padic ℓ) E] (hℓ : (ℓ : Ω)≠0) (A : SmoothModel Ω) [IsProper A.a]
    [ConnectedSpace A.X] (hd : A.dimension=1) (F₁ F₂ : RationalLisseSheaf E A.X) :
    Nonempty (rationalCohomology A (rationalTensor F₁ (rationalDual F₂)) 0 ≅ ModuleCat.of E (F₂ ⟶ F₁)) ∧
      Nonempty (rationalCohomology A (rationalTensor F₁ (rationalDual F₂)) 2 ≅
        ModuleCat.of E ((F₁ ⟶ F₂) →ₗ[E] E)) := sorry
end AdicPairings

/-! The remaining trace fixtures: genuine nilpotent thickenings, disjoint unions and point classes. -/
section TraceTests
variable {Λ : Type u} [CommRing Λ] [TorsionCoefficients Λ]
  {k : Type u} [Field k] [IsSepClosed k] [PerfectField k]

/-- Spec k[x₁,…,x_d,z]/(z^m), a concrete fixture rather than a new roadmap definition. -/
def thickenedAffineSpace (k : Type u) [Field k] (d m : ℕ) : Scheme.{u} :=
  Spec (CommRingCat.of (MvPolynomial (Fin (d+1)) k ⧸
    Ideal.span {(MvPolynomial.X (Fin.last d) : MvPolynomial (Fin (d+1)) k)^m}))
def thickenedAffineProjection (k : Type u) [Field k] (d m : ℕ) :
    thickenedAffineSpace k d m ⟶ Spec (CommRingCat.of k) :=
  Spec.map (CommRingCat.ofHom (algebraMap k _))
instance thickenedAffine_compact (k : Type u) [Field k] (d m : ℕ) :
    Compactifiable (thickenedAffineProjection k d m) := sorry
instance thickenedAffine_dimension (k : Type u) [Field k] (d m : ℕ) [NeZero m] :
    TraceDimension (thickenedAffineProjection k d m) d := sorry

/-- Canonical reduction followed by the normalized affine-space orientation. -/
def thickenedAffineCohomologyIso (d m : ℕ) [NeZero m]
    [CoefficientsOn Λ (thickenedAffineSpace k d m)] :
    compactCohomologyModule (thickenedAffineProjection k d m) (2*d)
      ((tateTwist (coefficientModulus Λ (thickenedAffineSpace k d m)) _
        (coefficientModulus_unit _) (coefficientModulus_killed _) d).obj (EtaleDerived.constant _)) ≅
      ModuleCat.of Λ Λ := sorry

/-- Test `not_curveTrace_isIso_doubleLine`: the étale topology sees the reduction but trace sees length 2. -/
example (k : Type) [Field k] [IsSepClosed k]
    (hX : IsUnit (2 : Γ(thickenedAffineSpace k 1 2, ⊤))) :
    ¬ IsIso (trace (Λ := ZMod 2) 2 (by decide) (thickenedAffineProjection k 1 2) 1 hX
      ((constantSheaf _ (ModuleCat (ZMod 2))).obj (ModuleCat.of (ZMod 2) (ZMod 2)))) := sorry

/-- Test `not_trace_ignores_multiplicity`: the double plane's trace is twice the normalized reduction map. -/
example [Nontrivial Λ] [CoefficientsOn Λ (thickenedAffineSpace k 2 2)] :
    compactCohomologyTrace (coefficientModulus Λ (thickenedAffineSpace k 2 2))
      (coefficientModulus_killed _) (thickenedAffineProjection k 2 2) 2 (coefficientModulus_unit _)=
        (2 : ℤ) • (thickenedAffineCohomologyIso (Λ := Λ) (k := k) 2 2).hom ∧
    compactCohomologyTrace (coefficientModulus Λ (thickenedAffineSpace k 2 2))
      (coefficientModulus_killed _) (thickenedAffineProjection k 2 2) 2 (coefficientModulus_unit _) ≠
        (thickenedAffineCohomologyIso (Λ := Λ) (k := k) 2 2).hom := sorry

/-- SF.0 disjoint-union fixture, with its two component inclusions fixed. -/
def twoAffineLines (k : Type u) [Field k] : Scheme.{u} :=
  𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of k)) ⨿ 𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of k))
def twoAffineLinesProjection (k : Type u) [Field k] : twoAffineLines k ⟶ Spec (CommRingCat.of k) :=
  coprod.desc (𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of k)) ↘ Spec (CommRingCat.of k))
    (𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of k)) ↘ Spec (CommRingCat.of k))
instance twoAffineLines_compact (k : Type u) [Field k] : Compactifiable (twoAffineLinesProjection k) := sorry
instance twoAffineLines_dimension (k : Type u) [Field k] : TraceDimension (twoAffineLinesProjection k) 1 := sorry

def twoAffineLinesCohomologyIso [CoefficientsOn Λ (twoAffineLines k)] :
    compactCohomologyModule (twoAffineLinesProjection k) 2
      ((tateTwist (coefficientModulus Λ (twoAffineLines k)) _
        (coefficientModulus_unit _) (coefficientModulus_killed _) 1).obj (EtaleDerived.constant _)) ≅
      ModuleCat.of Λ (Λ × Λ) := sorry

/-- Test `curveTrace_twoLines`: the component decomposition fixes both orientations. -/
example [CoefficientsOn Λ (twoAffineLines k)] (x y : Λ) :
    compactCohomologyTrace (coefficientModulus Λ (twoAffineLines k))
      (coefficientModulus_killed _) (twoAffineLinesProjection k) 1 (coefficientModulus_unit _)
        ((twoAffineLinesCohomologyIso (Λ := Λ) (k := k)).inv (x,y))=x+y := sorry

/-- Test `curveTrace_projectiveLine`. -/
example [CoefficientsOn Λ (projectiveModel k 1).X] [IsProper (projectiveModel k 1).a]
    (hd : (projectiveModel k 1).dimension=1) :
    cohomologyTrace (Λ := Λ) (projectiveModel k 1) ((cohCast (by omega) (by omega)).hom
      (firstChernClass (lineClass (projectiveHyperplaneBundle k 1))))=1 := sorry

/-- Test `trace_projectiveSpace`: normalizing the top generator works in every dimension. -/
example (d : ℕ) [CoefficientsOn Λ (projectiveModel k d).X] [IsProper (projectiveModel k d).a] :
    cohomologyTrace (Λ := Λ) (projectiveModel k d) ((cohCast
      (by rw [projectiveModel_dimension]) (by rw [projectiveModel_dimension])).hom
        (cupPower (firstChernClass (lineClass (projectiveHyperplaneBundle k d))) d))=1 := sorry

/-- Compactly supported Gysin of a rational point of A¹, via closed immersion purity and composition of !. -/
def compactAffinePointClass (n : ℕ) [NeZero n] (hΛ : (n : Λ)=0)
    (hX : IsUnit (n : Γ(𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of k)), ⊤)))
    (o : Spec (CommRingCat.of k) ⟶ 𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of k))) [IsClosedImmersion o] :
    compactCohomologyModule (𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of k)) ↘ Spec (CommRingCat.of k)) 2
      ((tateTwist n _ hX hΛ 1).obj (EtaleDerived.constant _)) := sorry

/-- Test `affineSpaceTrace_line`. -/
example (n : ℕ) [NeZero n] (hΛ : (n : Λ)=0)
    (hX : IsUnit (n : Γ(𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of k)), ⊤)))
    (o : Spec (CommRingCat.of k) ⟶ 𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of k))) [IsClosedImmersion o] :
    compactCohomologyTrace n hΛ (𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of k)) ↘ Spec (CommRingCat.of k))
      1 hX (compactAffinePointClass n hΛ hX o)=1 := sorry

/-- SF.0 proper disjoint-union fixture P¹ ⊔ P¹. -/
def twoProjectiveLines (k : Type u) [Field k] : SmoothModel k := sorry
lemma twoProjectiveLines_dimension : (twoProjectiveLines k).dimension=1 := sorry
lemma twoProjectiveLines_scheme : Nonempty ((twoProjectiveLines k).X ≅
    (projectiveModel k 1).X ⨿ (projectiveModel k 1).X) := sorry
instance twoProjectiveLines_proper : IsProper (twoProjectiveLines k).a := sorry

/-- Test `trace_twoComponents`: the sum map is onto but has nonzero kernel. -/
example [Nontrivial Λ] [CoefficientsOn Λ (twoProjectiveLines k).X] :
    Function.Surjective (cohomologyTrace (Λ := Λ) (twoProjectiveLines k)) ∧
      ¬ Function.Injective (cohomologyTrace (Λ := Λ) (twoProjectiveLines k)) := sorry
end TraceTests

end TauCeti.EtaleDuality
