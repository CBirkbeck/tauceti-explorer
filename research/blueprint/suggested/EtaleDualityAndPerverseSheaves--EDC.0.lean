/-
Suggested Lean forms for EtaleDualityAndPerverseSheaves, part EDC.0
(stages EDC.0, EDC.1, EDC.1:adjoint, EDC.1:biduality, EDC.2, EDC.2:trace-purity, EDC.2:pairings, EDC.3).

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/EtaleDualityAndPerverseSheaves--EDC.0.md` and the blueprint packet
`research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.0.json` are definitive; the
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every proof is `sorry`; nothing here is claimed to be formalised (every packet node has
implementationStatus "unchecked"). Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174,
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Only Mathlib is imported.

Names. Every `api` item of the packet is a declaration below under its packet name (namespace
`TauCeti.EtaleDuality`); every unit test is an `example` whose docstring begins "Test `<name>`".
Named theorems carry the packet node slug in their docstring.

Carriers. The étale derived category is Mathlib's: `EtaleDerived Λ X` is the `DerivedCategory` of
`Sheaf X.smallEtaleTopology (ModuleCat Λ)`, geometric stalks come from `Scheme.pointSmallEtale`, and
cycles are `AlgebraicGeometry.AlgebraicCycle`. The operations owned by CohomologicalPointCounting
(Tau Ceti pull request 196: f^*, Rf_*, Rf_!, RΓ, the Kummer sheaf μ_n) are not in the pinned
libraries; they are requested from SchemeAndStackFoundations SF.2. Section `Imported` gives them as
data stand-ins with `sorry` bodies and no properties, so that the signatures of this packet
typecheck; they are replaced by the upstream definitions. No missing condition is replaced by a
`Prop`-valued stand-in: declarations whose statement needs a predicate the libraries lack
(constructible sheaves, Weil sheaves and their Frobenius, the Picard group, vector bundles and
projective bundles, Chow groups, the EnhancedDerivedSheaves ∞-categories, projective space) are
listed in the comment blocks `Not typed here`, with the carrier they wait for.
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
import Mathlib.RingTheory.Trace.Defs
import Mathlib.LinearAlgebra.PerfectPairing.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.FieldTheory.IsSepClosed
import Mathlib.FieldTheory.Perfect
import Mathlib.FieldTheory.Finite.GaloisField

noncomputable section

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry

universe u

attribute [local instance] HasDerivedCategory.standard

set_option linter.unusedVariables false
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

section Imported

variable {Λ : Type u} [CommRing Λ]

/-- Stand-in for the exact pullback `f^*` (ConstructibleEtale). -/
def pullback {X S : Scheme.{u}} (f : X ⟶ S) : EtaleDerived Λ S ⥤ EtaleDerived Λ X := sorry

/-- Stand-in for `Rf_*` (ConstructibleEtale / EtaleBaseChange). -/
def pushforward {X S : Scheme.{u}} (f : X ⟶ S) : EtaleDerived Λ X ⥤ EtaleDerived Λ S := sorry

/-- Stand-in for the adjunction `f^* ⊣ Rf_*`. -/
def pullbackPushforwardAdjunction {X S : Scheme.{u}} (f : X ⟶ S) :
    pullback (Λ := Λ) f ⊣ pushforward f := sorry

/-- Stand-in for the compactly supported direct image `Rf_!` (CompactSupport). -/
def lowerShriek {X S : Scheme.{u}} (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f] :
    EtaleDerived Λ X ⥤ EtaleDerived Λ S := sorry

/-- Stand-in for proper base change `g^* Rf_! ≅ Rf'_! g'^*` (CompactSupport). -/
def lowerShriekBaseChange {X S X' S' : Scheme.{u}} {f : X ⟶ S} {g : S' ⟶ S} {f' : X' ⟶ S'}
    {g' : X' ⟶ X} (sq : IsPullback g' f' f g) [IsSeparated f] [LocallyOfFiniteType f]
    [IsSeparated f'] [LocallyOfFiniteType f'] :
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
    (a : X ⟶ Spec (CommRingCat.of Ω)) [IsSeparated a] [LocallyOfFiniteType a] (q : ℤ)
    (K : EtaleDerived Λ X) : ModuleCat.{u} Λ :=
  (DerivedCategory.homologyFunctor _ q).obj
    ((derivedGlobalSections _).obj ((lowerShriek a).obj K))

end Imported

/-! ## EDC.0 — constructible complexes (node `EDC.0/constructible-ctf-complexes`)

Not typed here: the predicate of a constructible étale sheaf is ConstructibleEtale's and is not in
the pinned libraries (requested from SchemeAndStackFoundations SF.2). Packet names waiting for it:
`IsConstructibleComplex`, `IsCtf`, `isConstructibleComplex_shift`,
`isConstructibleComplex_of_triangle`, `isConstructibleComplex_iff_stalk`, `IsCtf.tensor`,
`IsConstructibleComplex.pullback`, `IsConstructibleComplex.lowerShriek`; tests `isCtf_constant`,
`not_isCtf_reduction`, `not_isConstructible_infinite_skyscrapers`, `isConstructible_zero`. The
Tor-amplitude part of `not_isCtf_reduction` is typed below at the level of modules. -/

/-- Test `not_isCtf_reduction` (module shadow): `ℤ/ℓ` is not flat over `ℤ/ℓ²`, here `ℓ = 2`. -/
example : ¬ @Module.Flat (ZMod 4) (ZMod 2) _ _
    (Module.compHom (ZMod 2) (ZMod.castHom (by decide : 2 ∣ 4) (ZMod 2))) := sorry

/-! ## EDC.0 — Tate twists (node `EDC.0/tate-twist`) -/

section Tate

variable {Λ : Type u} [CommRing Λ]

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

/-! Not typed here (need Weil sheaves and Frobenius on stalks over `𝔽_q`):
`tateTwist_geomFrobenius` and the test `tateTwist_frobenius_eigenvalue`. -/

end Tate

/-! ## EDC.0 — derived tensor and internal Hom (node `EDC.0/derived-tensor-and-internal-hom`) -/

/-- Node `EDC.0/derived-tensor-and-internal-hom`: `⊗^L ⊣ RHom`. -/
theorem derivedTensor_internalHom_adjunction {Λ : Type u} [CommRing Λ] (X : Scheme.{u})
    (L : EtaleDerived Λ X) :
    Nonempty ((derivedTensor X).flip.obj L ⊣ (internalHom X).obj (Opposite.op L)) := sorry

/-! ## EDC.0 — cohomology with supports (node `EDC.0/cohomology-with-supports`) -/

section Supports

variable {Λ : Type u} [CommRing Λ] {Z X U : Scheme.{u}}

/-- `i^!` on sheaves: sections supported on `Z`. -/
def supportSections (i : Z ⟶ X) [IsClosedImmersion i] : EtaleSheaf Λ X ⥤ EtaleSheaf Λ Z := sorry

def supportAdjunction (i : Z ⟶ X) [IsClosedImmersion i] : sheafPushforward (Λ := Λ) i ⊣ supportSections i := sorry

/-- `Ri^!`. -/
def derivedSupport (i : Z ⟶ X) [IsClosedImmersion i] : EtaleDerived Λ X ⥤ EtaleDerived Λ Z := sorry

/-- The localization triangle `i_*Ri^!K → K → Rj_*j^*K → ` for the complementary open `j`. -/
def localizationTriangle (i : Z ⟶ X) [IsClosedImmersion i] (j : U ⟶ X) [IsOpenImmersion j] (K : EtaleDerived Λ X) :
    Pretriangulated.Triangle (EtaleDerived Λ X) := sorry

lemma localizationTriangle_distinguished (i : Z ⟶ X) [IsClosedImmersion i] (j : U ⟶ X) [IsOpenImmersion j]
    (hc : Set.range j.base = (Set.range i.base)ᶜ) (K : EtaleDerived Λ X) :
    localizationTriangle i j K ∈ distTriang (EtaleDerived Λ X) := sorry

/-- `H^q_Z(X, K)`. -/
def cohomologyWithSupports (i : Z ⟶ X) [IsClosedImmersion i] (q : ℤ) (K : EtaleDerived Λ X) : ModuleCat.{u} Λ :=
  cohomologyModule q ((derivedSupport i).obj K)

/-- Forgetting supports and restricting to the complement. -/
def forgetSupports (i : Z ⟶ X) [IsClosedImmersion i] (q : ℤ) (K : EtaleDerived Λ X) :
    cohomologyWithSupports i q K ⟶ cohomologyModule q K := sorry

def restrictToOpen (j : U ⟶ X) [IsOpenImmersion j] (q : ℤ) (K : EtaleDerived Λ X) :
    cohomologyModule q K ⟶ cohomologyModule q ((pullback j).obj K) := sorry

lemma cohomologyWithSupports_exact (i : Z ⟶ X) [IsClosedImmersion i] (j : U ⟶ X) [IsOpenImmersion j]
    (hc : Set.range j.base = (Set.range i.base)ᶜ) (q : ℤ) (K : EtaleDerived Λ X) :
    Function.Exact (forgetSupports i q K) (restrictToOpen j q K) := sorry

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

variable {Λ Λ' Λ'' : Type u} [CommRing Λ] [CommRing Λ'] [CommRing Λ''] {X S : Scheme.{u}}

def restrictScalars (φ : Λ →+* Λ') (X : Scheme.{u}) : EtaleDerived Λ' X ⥤ EtaleDerived Λ X :=
  sorry

def extendScalars (φ : Λ →+* Λ') (X : Scheme.{u}) : EtaleDerived Λ X ⥤ EtaleDerived Λ' X :=
  sorry

def extendRestrictAdjunction (φ : Λ →+* Λ') (X : Scheme.{u}) :
    extendScalars φ X ⊣ restrictScalars φ X := sorry

def restrictScalars_lowerShriek (φ : Λ →+* Λ') (f : X ⟶ S) [IsSeparated f]
    [LocallyOfFiniteType f] :
    restrictScalars φ X ⋙ lowerShriek f ≅ lowerShriek f ⋙ restrictScalars φ S := sorry

def extendScalars_lowerShriek (φ : Λ →+* Λ') (f : X ⟶ S) [IsSeparated f]
    [LocallyOfFiniteType f] :
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

/-! ## EDC.0 — the enhanced `Rf_!` (node `EDC.0/enhanced-compact-pushforward`)

Not typed here (need the EnhancedDerivedSheaves E1 stable ∞-categories): `enhancedLowerShriek`,
`enhancedLowerShriek_homotopy`, `enhancedLowerShriek_preservesColimits`,
`enhancedLowerShriek_comp`, `enhancedLowerShriek_baseChange`. The homotopy-level API and the
tests are stated against the imported `lowerShriek`. Test `not_lowerShriek_eq_pushforward` needs
`ℙ¹`, which the pinned Mathlib does not define. -/

section LowerShriek

variable {Λ : Type u} [CommRing Λ] {X S : Scheme.{u}}

/-- `lowerShriek_openImmersion`: `Rj_!` is extension by zero, left adjoint to `j^*`. -/
lemma lowerShriek_openImmersion (j : X ⟶ S) [IsOpenImmersion j] :
    Nonempty (lowerShriek (Λ := Λ) j ⊣ pullback j) := sorry

lemma lowerShriek_proper (f : X ⟶ S) [IsProper f] :
    Nonempty (lowerShriek (Λ := Λ) f ≅ pushforward f) := sorry

/-- Test `lowerShriek_openImmersion_stalk`. -/
example (j : X ⟶ S) [IsOpenImmersion j] (s : GeometricPoint S)
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
theorem lowerShriek_amplitude (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f] (d : ℕ)
    (hd : ∀ s : S, Order.krullDim (f.base ⁻¹' {s}) ≤ d) (F : EtaleSheaf Λ X) (q : ℤ)
    (hq : 2 * (d : ℤ) < q) :
    IsZero ((DerivedCategory.homologyFunctor _ q).obj
      ((lowerShriek f).obj ((DerivedCategory.singleFunctor _ 0).obj F))) := sorry

/-- Node `EDC.0/compact-pushforward-amplitude-and-colimits` (c): `Rf_!` commutes with direct sums
for torsion coefficients. -/
theorem lowerShriek_preservesCoproducts (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f]
    (n : ℕ) [NeZero n] (hΛ : (n : Λ) = 0) (ι : Type u) :
    PreservesColimitsOfShape (Discrete ι) (lowerShriek (Λ := Λ) f) := sorry

end LowerShriek

/-! ## EDC.1:adjoint — the exceptional inverse image (node `EDC.1:adjoint/exceptional-inverse-image`) -/

section UpperShriek

variable {Λ : Type u} [CommRing Λ] {X Y S : Scheme.{u}}

/-- `f^!`, the right adjoint of `Rf_!` (produced by EnhancedDerivedSheaves E3). -/
def upperShriek (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f] :
    EtaleDerived Λ S ⥤ EtaleDerived Λ X := sorry

def lowerShriekUpperShriekAdjunction (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f] :
    lowerShriek (Λ := Λ) f ⊣ upperShriek f := sorry

/-- `f^!` commutes with shifts. -/
instance upperShriek_commShift (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f] :
    (upperShriek (Λ := Λ) f).CommShift ℤ := sorry

instance upperShriek_isTriangulated (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f] :
    (upperShriek (Λ := Λ) f).IsTriangulated := sorry

lemma upperShriek_id : Nonempty (upperShriek (Λ := Λ) (𝟙 X) ≅ 𝟭 _) := sorry

lemma upperShriek_etale (f : X ⟶ S) [Etale f] [IsSeparated f] [LocallyOfFiniteType f] :
    Nonempty (upperShriek (Λ := Λ) f ≅ pullback f) := sorry

lemma upperShriek_closedImmersion (i : X ⟶ S) [IsClosedImmersion i] :
    Nonempty (upperShriek (Λ := Λ) i ≅ derivedSupport i) := sorry

/-- `upperShriek_amplitude`: fibres of dimension `≤ d` shift lower bounds by `2d`. -/
lemma upperShriek_amplitude (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f] (d : ℕ)
    (hd : ∀ s : S, Order.krullDim (f.base ⁻¹' {s}) ≤ d) (L : EtaleDerived Λ S) (k : ℤ)
    (hL : ∀ q ≤ k, IsZero ((DerivedCategory.homologyFunctor _ q).obj L)) :
    ∀ q ≤ k - 2 * d, IsZero ((DerivedCategory.homologyFunctor _ q).obj ((upperShriek f).obj L)) :=
  sorry

/-- `upperShriek_quasiFinite`: for quasi-finite `f`, `f^!` is the derived functor of a sheaf-level
right adjoint `f^!₀` of the exact `f_!`. -/
lemma upperShriek_quasiFinite (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f]
    [LocallyQuasiFinite f] :
    ∃ G : EtaleSheaf Λ S ⥤ EtaleSheaf Λ X, ∀ F : EtaleSheaf Λ S,
      ∀ q : ℤ, q < 0 → IsZero ((DerivedCategory.homologyFunctor _ q).obj
        ((upperShriek f).obj ((DerivedCategory.singleFunctor _ 0).obj F))) ∧
      Nonempty ((DerivedCategory.homologyFunctor _ 0).obj
        ((upperShriek f).obj ((DerivedCategory.singleFunctor _ 0).obj F)) ≅ G.obj F) := sorry

/-- Test `upperShriek_id_eq`. -/
example : Nonempty (upperShriek (Λ := Λ) (𝟙 X) ≅ 𝟭 (EtaleDerived Λ X)) := sorry

/-- Test `upperShriek_openImmersion`. -/
example (j : X ⟶ S) [IsOpenImmersion j] : Nonempty (upperShriek (Λ := Λ) j ≅ pullback j) := sorry

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
theorem upperShriek_comp (h : X ⟶ Y) (g : Y ⟶ S) [IsSeparated h] [LocallyOfFiniteType h]
    [IsSeparated g] [LocallyOfFiniteType g] [IsSeparated (h ≫ g)] [LocallyOfFiniteType (h ≫ g)] :
    Nonempty (upperShriek (Λ := Λ) g ⋙ upperShriek h ≅ upperShriek (h ≫ g)) := sorry

/-- Node `EDC.1:adjoint/sheafified-adjunction` (a):
`Rf_* RHom(L, f^!K) ≅ RHom(Rf_!L, K)`. -/
theorem sheafified_adjunction (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f]
    (n : ℕ) [NeZero n] (hΛ : (n : Λ) = 0) (L : EtaleDerived Λ X) (K : EtaleDerived Λ S) :
    Nonempty ((pushforward f).obj (((internalHom X).obj (Opposite.op L)).obj ((upperShriek f).obj K))
      ≅ ((internalHom S).obj (Opposite.op ((lowerShriek f).obj L))).obj K) := sorry

/-- Node `EDC.1:adjoint/local-cohomology-identification`. -/
theorem upperShriek_closedImmersion_eq_derivedSupport (i : X ⟶ S) [IsClosedImmersion i] :
    Nonempty (upperShriek (Λ := Λ) i ≅ derivedSupport i) := sorry

end UpperShriek

/-! ## EDC.1:adjoint — dualizing complex and Verdier dual -/

section Dualizing

variable {Λ : Type u} [CommRing Λ] {k : Type u} [Field k] {X V Z S : Scheme.{u}}

/-- `K_X = a^!Λ`. -/
def dualizingComplex (a : X ⟶ Spec (CommRingCat.of k)) [IsSeparated a] [LocallyOfFiniteType a] :
    EtaleDerived Λ X :=
  (upperShriek a).obj (EtaleDerived.constant _)

/-- `K_{X/S} = f^!Λ_S`. -/
def relativeDualizingComplex (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f] :
    EtaleDerived Λ X :=
  (upperShriek f).obj (EtaleDerived.constant _)

lemma dualizingComplex_spec :
    Nonempty (dualizingComplex (Λ := Λ) (𝟙 (Spec (CommRingCat.of k))) ≅ EtaleDerived.constant _) :=
  sorry

lemma dualizingComplex_etale (a : X ⟶ Spec (CommRingCat.of k)) [IsSeparated a]
    [LocallyOfFiniteType a] (u : V ⟶ X) [Etale u] [IsSeparated u] [LocallyOfFiniteType u]
    [IsSeparated (u ≫ a)] [LocallyOfFiniteType (u ≫ a)] :
    Nonempty ((pullback u).obj (dualizingComplex (Λ := Λ) a) ≅ dualizingComplex (u ≫ a)) := sorry

lemma dualizingComplex_closedImmersion (a : X ⟶ Spec (CommRingCat.of k)) [IsSeparated a]
    [LocallyOfFiniteType a] (i : Z ⟶ X) [IsClosedImmersion i] [IsSeparated (i ≫ a)]
    [LocallyOfFiniteType (i ≫ a)] :
    Nonempty ((upperShriek i).obj (dualizingComplex (Λ := Λ) a) ≅ dualizingComplex (i ≫ a)) :=
  sorry

lemma relativeDualizingComplex_comp {Y : Scheme.{u}} (h : X ⟶ Y) (g : Y ⟶ S) [IsSeparated h]
    [LocallyOfFiniteType h] [IsSeparated g] [LocallyOfFiniteType g] [IsSeparated (h ≫ g)]
    [LocallyOfFiniteType (h ≫ g)] :
    Nonempty (relativeDualizingComplex (Λ := Λ) (h ≫ g) ≅
      (upperShriek h).obj (relativeDualizingComplex g)) := sorry

/-- Test `dualizingComplex_point`. -/
example : Nonempty (dualizingComplex (Λ := Λ) (𝟙 (Spec (CommRingCat.of k))) ≅
    EtaleDerived.constant _) := sorry

/-- Test `dualizingComplex_finiteSeparable`. -/
example (L : Type u) [Field L] [Algebra k L] [FiniteDimensional k L] [Algebra.IsSeparable k L]
    [IsSeparated (Spec.map (CommRingCat.ofHom (algebraMap k L)))]
    [LocallyOfFiniteType (Spec.map (CommRingCat.ofHom (algebraMap k L)))] :
    Nonempty (dualizingComplex (Λ := Λ) (Spec.map (CommRingCat.ofHom (algebraMap k L))) ≅
      EtaleDerived.constant _) := sorry

/-- Test `dualizingComplex_curve`: a smooth curve over an algebraically closed field. -/
example [IsAlgClosed k] (n : ℕ) [NeZero n] (hΛ : (n : Λ) = 0) (a : X ⟶ Spec (CommRingCat.of k))
    [SmoothOfRelativeDimension 1 a] [IsSeparated a] [LocallyOfFiniteType a]
    (hX : IsUnit ((n : Γ(X, ⊤)))) :
    Nonempty (dualizingComplex (Λ := Λ) a ≅
      ((tateTwist n X hX hΛ 1).obj (EtaleDerived.constant X))⟦(2 : ℤ)⟧) := sorry

/-- Test `not_dualizingComplex_shift_of_constant`: on `Spec k ⊔ 𝔸¹_k` no single shift works. -/
example [IsAlgClosed k] [Nontrivial Λ] (n : ℕ) [NeZero n] (hΛ : (n : Λ) = 0)
    (a : X ⟶ Spec (CommRingCat.of k)) [IsSeparated a] [LocallyOfFiniteType a]
    (e : X ≅ Spec (CommRingCat.of k) ⨿ 𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of k)))
    (hX : IsUnit ((n : Γ(X, ⊤)))) :
    ∀ d : ℕ, ¬ Nonempty (dualizingComplex (Λ := Λ) a ≅
      ((tateTwist n X hX hΛ d).obj (EtaleDerived.constant X))⟦(2 * d : ℤ)⟧) := sorry

/-- `D_X = RHom(−, K_X)`. -/
def verdierDual (a : X ⟶ Spec (CommRingCat.of k)) [IsSeparated a] [LocallyOfFiniteType a] :
    (EtaleDerived Λ X)ᵒᵖ ⥤ EtaleDerived Λ X :=
  (internalHom X).flip.obj (dualizingComplex a)

variable (a : X ⟶ Spec (CommRingCat.of k)) [IsSeparated a] [LocallyOfFiniteType a]

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

lemma verdierDual_etale (u : V ⟶ X) [Etale u] [IsSeparated u] [LocallyOfFiniteType u]
    [IsSeparated (u ≫ a)] [LocallyOfFiniteType (u ≫ a)] (K : EtaleDerived Λ X) :
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
theorem verdierDual_lowerShriek {Y : Scheme.{u}} (b : Y ⟶ Spec (CommRingCat.of k)) [IsSeparated b]
    [LocallyOfFiniteType b] (f : X ⟶ Y) [IsSeparated f] [LocallyOfFiniteType f] (h : f ≫ b = a)
    (L : EtaleDerived Λ X) :
    Nonempty ((verdierDual b).obj (Opposite.op ((lowerShriek f).obj L)) ≅
      (pushforward f).obj ((verdierDual a).obj (Opposite.op L))) := sorry

/-- Node `EDC.1:adjoint/formal-duality-exchange` (b): `D_X f^* ≅ f^! D_Y`. -/
theorem verdierDual_pullback {Y : Scheme.{u}} (b : Y ⟶ Spec (CommRingCat.of k)) [IsSeparated b]
    [LocallyOfFiniteType b] (f : X ⟶ Y) [IsSeparated f] [LocallyOfFiniteType f] (h : f ≫ b = a)
    (K : EtaleDerived Λ Y) :
    Nonempty ((verdierDual a).obj (Opposite.op ((pullback f).obj K)) ≅
      (upperShriek f).obj ((verdierDual b).obj (Opposite.op K))) := sorry

end Dualizing

/-! ## EDC.1:adjoint — exchange maps (node `EDC.1:adjoint/base-change-exchange-maps`) -/

section Exchange

variable {Λ : Type u} [CommRing Λ] {X S X' S' : Scheme.{u}}
  (f : X ⟶ S) (g : S' ⟶ S) (f' : X' ⟶ S') (g' : X' ⟶ X) (sq : IsPullback g' f' f g)
  [IsSeparated f] [LocallyOfFiniteType f] [IsSeparated f'] [LocallyOfFiniteType f']

def upperShriekPushforwardIso :
    upperShriek (Λ := Λ) f' ⋙ pushforward g' ≅ pushforward g ⋙ upperShriek f := sorry

def upperShriekBaseChange : upperShriek (Λ := Λ) f ⋙ pullback g' ⟶ pullback g ⋙ upperShriek f' :=
  sorry

def upperShriekCobaseChange [IsSeparated g] [LocallyOfFiniteType g] [IsSeparated g']
    [LocallyOfFiniteType g'] :
    upperShriek g' ⋙ lowerShriek (Λ := Λ) f' ⟶ lowerShriek f ⋙ upperShriek g := sorry

lemma upperShriekBaseChange_etale [Etale g] : IsIso (upperShriekBaseChange (Λ := Λ) f g f' g') :=
  sorry

/-- `upperShriekBaseChange_paste`: the base-change map of a vertically pasted square is the
composite of the two base-change maps, up to the pseudofunctoriality of pullback. -/
lemma upperShriekBaseChange_paste {S'' X'' : Scheme.{u}} (h : S'' ⟶ S') (f'' : X'' ⟶ S'')
    (h' : X'' ⟶ X') [IsSeparated f''] [LocallyOfFiniteType f''] :
    ∃ (c₁ : pullback (Λ := Λ) g' ⋙ pullback h' ≅ pullback (h' ≫ g'))
      (c₂ : pullback (Λ := Λ) g ⋙ pullback h ≅ pullback (h ≫ g)),
      upperShriekBaseChange (Λ := Λ) f (h ≫ g) f'' (h' ≫ g') =
        Functor.whiskerLeft (upperShriek f) c₁.inv ≫
          Functor.whiskerRight (upperShriekBaseChange f g f' g') (pullback h') ≫
          Functor.whiskerLeft (pullback g) (upperShriekBaseChange f' h f'' h') ≫
          Functor.whiskerRight c₂.hom (upperShriek f'') := sorry

/-- Test `upperShriekBaseChange_id`. -/
example : IsIso (upperShriekBaseChange (Λ := Λ) f (𝟙 S) f (𝟙 X)) := sorry

/-- Test `upperShriekBaseChange_openImmersion`. -/
example [IsOpenImmersion g] : IsIso (upperShriekBaseChange (Λ := Λ) f g f' g') := sorry

/-- Test `not_upperShriekBaseChange_iso_closedPoint`. -/
example [Nontrivial Λ] (Ω : Type u) [Field Ω] [IsAlgClosed Ω]
    (o : Spec (CommRingCat.of Ω) ⟶ 𝔸(ULift.{u} (Fin 1); Spec (CommRingCat.of Ω)))
    [IsClosedImmersion o] :
    ¬ IsIso (upperShriekBaseChange (Λ := Λ) (𝟙 _) o (𝟙 _) o) := sorry

end Exchange

/-! ## EDC.2:trace-purity — traces -/

section Traces

variable {Λ : Type u} [CommRing Λ] {X Y S : Scheme.{u}}

/-- `Tr_f : f_! f^* F → F` for `f` separated, flat, of finite presentation and quasi-finite. -/
def finiteFlatTrace (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f] [Flat f]
    [LocallyQuasiFinite f] : pullback f ⋙ lowerShriek (Λ := Λ) f ⟶ 𝟭 _ := sorry

variable (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f] [Flat f] [LocallyQuasiFinite f]

lemma finiteFlatTrace_natural {K L : EtaleDerived Λ S} (φ : K ⟶ L) :
    (lowerShriek f).map ((pullback f).map φ) ≫ (finiteFlatTrace f).app L =
      (finiteFlatTrace f).app K ≫ φ :=
  (finiteFlatTrace f).naturality φ

/-- `finiteFlatTrace_baseChange` and `finiteFlatTrace_comp`: stated in the packet; typed with the
base-change isomorphism of `lowerShriek` once CompactSupport supplies it. -/
lemma finiteFlatTrace_comp (h : X ⟶ Y) (g : Y ⟶ S) [IsSeparated h] [LocallyOfFiniteType h] [Flat h]
    [LocallyQuasiFinite h] [IsSeparated g] [LocallyOfFiniteType g] [Flat g] [LocallyQuasiFinite g]
    [IsSeparated (h ≫ g)] [LocallyOfFiniteType (h ≫ g)] [Flat (h ≫ g)]
    [LocallyQuasiFinite (h ≫ g)] :
    ∃ c : pullback (h ≫ g) ⋙ lowerShriek (Λ := Λ) (h ≫ g) ≅
        pullback g ⋙ (pullback h ⋙ lowerShriek h) ⋙ lowerShriek g,
      finiteFlatTrace (h ≫ g) = c.hom ≫ Functor.whiskerLeft (pullback g)
        (Functor.whiskerRight (finiteFlatTrace h) (lowerShriek g)) ≫ finiteFlatTrace g := sorry

lemma finiteFlatTrace_baseChange {X' S' : Scheme.{u}} (g : S' ⟶ S) (f' : X' ⟶ S') (g' : X' ⟶ X)
    (sq : IsPullback g' f' f g) [IsSeparated f'] [LocallyOfFiniteType f'] [Flat f']
    [LocallyQuasiFinite f'] (K : EtaleDerived Λ S) :
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

/-! Not typed here: `finiteFlatTrace_stalk` (needs the multiplicities of geometric fibres, the
lengths of their local rings, connected to stalks of `lowerShriek`). -/

/-- Test `finiteFlatTrace_separable`. -/
example {k L : Type u} [Field k] [Field L] [Algebra k L] [FiniteDimensional k L]
    [Algebra.IsSeparable k L] [IsSeparated (Spec.map (CommRingCat.ofHom (algebraMap k L)))]
    [LocallyOfFiniteType (Spec.map (CommRingCat.ofHom (algebraMap k L)))]
    [Flat (Spec.map (CommRingCat.ofHom (algebraMap k L)))]
    [LocallyQuasiFinite (Spec.map (CommRingCat.ofHom (algebraMap k L)))]
    [IsProper (Spec.map (CommRingCat.ofHom (algebraMap k L)))] (K : EtaleDerived Λ _) :
    ((pullbackPushforwardAdjunction (Spec.map (CommRingCat.ofHom (algebraMap k L)))).unit.app K ≫
      (Classical.choice (lowerShriek_proper (Λ := Λ)
        (Spec.map (CommRingCat.ofHom (algebraMap k L))))).inv.app _ ≫
      (finiteFlatTrace (Λ := Λ) (Spec.map (CommRingCat.ofHom (algebraMap k L)))).app K) =
      (Module.finrank k L : ℤ) • 𝟙 K := sorry

/-- Test `finiteFlatTrace_id`. -/
example [IsSeparated (𝟙 S)] [LocallyOfFiniteType (𝟙 S)] [Flat (𝟙 S)] [LocallyQuasiFinite (𝟙 S)] :
    ∃ e : pullback (𝟙 S) ⋙ lowerShriek (Λ := Λ) (𝟙 S) ≅ 𝟭 _, finiteFlatTrace (𝟙 S) = e.hom :=
  sorry

/-! Tests `finiteFlatTrace_square_map` and `not_finiteFlatTrace_counit_ramified` need the squaring
map of `𝔸¹` and its stalk at the origin: stated in the packet; typed once
`AffineSpace.homOfVector` and geometric points of `𝔸¹` are connected to `lowerShriek`. -/

end Traces

/-! ## EDC.2:trace-purity — first Chern class, curve trace, affine-space trace, general trace

Not typed here (need the Picard group of a scheme, which the pinned Mathlib lacks, and is
requested from JacobianChallenge Layer A): `firstChernClass`, `firstChernClass_tensor`,
`firstChernClass_pullback`, `firstChernClass_pow`, `firstChernClass_divisor`,
`firstChernClass_changeN`; tests `firstChernClass_projectiveLine`, `firstChernClass_trivial`,
`not_firstChernClass_injective`, `firstChernClass_degree_curve`; and
`curveTrace_firstChernClass`. The traces themselves are typed below, as maps out of the top
cohomology sheaf of `Rf_!`. Tests mentioning `ℙ¹`, `ℙ^d` or a double line wait for projective
space and for explicit nonreduced curves: `curveTrace_projectiveLine`, `curveTrace_twoLines`,
`not_curveTrace_isIso_doubleLine`, `trace_projectiveSpace`, `trace_twoComponents`,
`not_trace_ignores_multiplicity`, `affineSpaceTrace_line`. -/

section GeneralTrace

variable {Λ : Type u} [CommRing Λ] {X Y S : Scheme.{u}}
  (n : ℕ) [NeZero n] (hΛ : (n : Λ) = 0)

/-- `R^q f_!` of a complex, as a sheaf. -/
def higherLowerShriek (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f] (q : ℤ)
    (K : EtaleDerived Λ X) : EtaleSheaf Λ S :=
  (DerivedCategory.homologyFunctor _ q).obj ((lowerShriek f).obj K)

/-- The general trace `Tr_f : R^{2d} f_! f^* F(d) → F` (SGA 4 XVIII 2.9). -/
def trace (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f] (d : ℕ)
    (hX : IsUnit ((n : Γ(X, ⊤)))) (F : EtaleSheaf Λ S) :
    higherLowerShriek f (2 * d) ((tateTwist n X hX hΛ d).obj
      ((pullback f).obj ((DerivedCategory.singleFunctor _ 0).obj F))) ⟶ F := sorry

/-- The derived trace `Tr_f : Rf_!(f^*K(d)[2d]) → K` (SGA 4 XVIII 2.13.2). -/
def derivedTrace (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f] (d : ℕ)
    (hX : IsUnit ((n : Γ(X, ⊤)))) :
    pullback f ⋙ tateTwist n X hX hΛ d ⋙ shiftFunctor _ (2 * d : ℤ) ⋙ lowerShriek (Λ := Λ) f ⟶
      𝟭 _ := sorry

/-- The curve trace (SGA 4 XVIII 1.1.6): the case `d = 1` for a flat compactifiable curve. -/
def curveTrace (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f] [Flat f]
    (hX : IsUnit ((n : Γ(X, ⊤)))) (F : EtaleSheaf Λ S) :
    higherLowerShriek f 2 ((tateTwist n X hX hΛ 1).obj
      ((pullback f).obj ((DerivedCategory.singleFunctor _ 0).obj F))) ⟶ F :=
  trace n hΛ f 1 hX F

/-- The affine-space trace isomorphism (SGA 4 XVIII 2.8.1). -/
def affineSpaceTrace (d : ℕ) (hX : IsUnit ((n : Γ(𝔸(ULift.{u} (Fin d); S), ⊤))))
    (F : EtaleSheaf Λ S) :
    higherLowerShriek (𝔸(ULift.{u} (Fin d); S) ↘ S) (2 * d) ((tateTwist n _ hX hΛ d).obj
      ((pullback (𝔸(ULift.{u} (Fin d); S) ↘ S)).obj ((DerivedCategory.singleFunctor _ 0).obj F))) ≅
      F := sorry

/-- Test `affineSpaceTrace_zero`. -/
example (hX : IsUnit ((n : Γ(𝔸(ULift.{u} (Fin 0); S), ⊤)))) (F : EtaleSheaf Λ S) :
    Nonempty (higherLowerShriek (𝔸(ULift.{u} (Fin 0); S) ↘ S) 0 ((tateTwist n _ hX hΛ 0).obj
      ((pullback (𝔸(ULift.{u} (Fin 0); S) ↘ S)).obj ((DerivedCategory.singleFunctor _ 0).obj F)))
      ≅ F) := sorry

/-- Test `not_affineSpaceTrace_lower_degree`. -/
example (Ω : Type u) [Field Ω] [IsAlgClosed Ω] (d : ℕ) (hd : 1 ≤ d) (q : ℤ) (hq : q ≠ 2 * d) :
    IsZero (higherLowerShriek (Λ := Λ)
      (𝔸(ULift.{u} (Fin d); Spec (CommRingCat.of Ω)) ↘ Spec (CommRingCat.of Ω)) q
      (EtaleDerived.constant _)) := sorry

variable (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f] (hX : IsUnit ((n : Γ(X, ⊤))))

lemma curveTrace_isIso [SmoothOfRelativeDimension 1 f]
    (hirr : ∀ s : S, IsIrreducible (f.base ⁻¹' {s})) [Flat f] (F : EtaleSheaf Λ S) :
    IsIso (curveTrace n hΛ f hX F) := sorry

/-- Test `curveTrace_empty`. -/
example [IsEmpty X] [Flat f] (F : EtaleSheaf Λ S) :
    IsZero (higherLowerShriek f 2 ((tateTwist n X hX hΛ 1).obj
      ((pullback f).obj ((DerivedCategory.singleFunctor _ 0).obj F)))) := sorry

/-! Not typed here (need the base-change and composition isomorphisms of the sheaves
`R^q f_!` from CompactSupport, the coordinate permutations and the product decomposition
`𝔸^{d+1} = 𝔸¹ ×_S 𝔸^d` as `S`-morphisms, the Künneth isomorphism, and multiplicities of geometric
fibres): `affineSpaceTrace_succ`, `affineSpaceTrace_perm`, `affineSpaceTrace_baseChange`,
`trace_baseChange`, `trace_comp`, `trace_finite`, `trace_affineLine`, `trace_kunneth`,
`trace_isIso_iff`, `curveTrace_baseChange`, `curveTrace_components`,
`curveTrace_quasiFiniteFlat`, and the tests `affineSpaceTrace_swap`, `trace_dimZero_separable`. -/

end GeneralTrace

/-! ## EDC.2:trace-purity — named theorems -/

section Purity

variable {Λ : Type u} [CommRing Λ] {X S : Scheme.{u}} (n : ℕ) [NeZero n] (hΛ : (n : Λ) = 0)

/-! Not typed here: the effacement statements of nodes `EDC.2:trace-purity/curve-effacement-lemma`
(SGA 4 XVIII 1.6.9) and `EDC.2:trace-purity/smooth-effacement` (2.14, 2.14.4). Their content is the
vanishing of the trace maps `R^i f'_{V!}Λ → R^i f_{V!}Λ` of étale neighbourhoods, which needs the
étale trace maps between the sheaves `R^i(−)_!` from CompactSupport; an existence statement for
the neighbourhoods alone would be vacuous. -/

/-- Node `EDC.2:trace-purity/smooth-purity` (SGA 4 XVIII 3.2.5): for `f` smooth of relative
dimension `d`, `f^!K ≅ f^*K(d)[2d]`, the adjoint of the derived trace. -/
theorem smooth_purity (f : X ⟶ S) (d : ℕ) [SmoothOfRelativeDimension d f] [IsSeparated f]
    [LocallyOfFiniteType f] (hX : IsUnit ((n : Γ(X, ⊤)))) :
    Nonempty (pullback f ⋙ tateTwist n X hX hΛ d ⋙ shiftFunctor _ (2 * d : ℤ) ≅
      upperShriek (Λ := Λ) f) := sorry

/-- Node `EDC.2:trace-purity/top-degree-compact-cohomology` (the vanishing above `2d`; the
identification of the top degree needs the irreducible components of `X`). -/
theorem top_degree_compact_cohomology {Ω : Type u} [Field Ω] [IsSepClosed Ω]
    (a : X ⟶ Spec (CommRingCat.of Ω)) [IsSeparated a] [LocallyOfFiniteType a] (d : ℕ)
    (hd : Order.krullDim X ≤ d) (q : ℤ) (hq : 2 * (d : ℤ) < q) (K : EtaleSheaf Λ X) :
    IsZero (compactCohomologyModule a q ((DerivedCategory.singleFunctor _ 0).obj K)) := sorry

end Purity

/-! ## EDC.1:biduality and EDC.2:pairings — named theorems -/

section Biduality

variable {Λ : Type u} [CommRing Λ] {k : Type u} [Field k] {X : Scheme.{u}}

/-- Node `EDC.1:biduality/self-injective-coefficients`: `ℤ/ℓⁿ` is self-injective. -/
theorem zmod_selfInjective (ℓ m : ℕ) [Fact ℓ.Prime] :
    Module.Injective (ZMod (ℓ ^ m)) (ZMod (ℓ ^ m)) := sorry

/-- Node `EDC.1:biduality/dualizing-complex-of-smooth-scheme`. -/
theorem dualizingComplex_smooth (n : ℕ) [NeZero n] (hΛ : (n : Λ) = 0) (a : X ⟶ Spec (CommRingCat.of k)) (d : ℕ)
    [SmoothOfRelativeDimension d a] [IsSeparated a] [LocallyOfFiniteType a]
    (hX : IsUnit ((n : Γ(X, ⊤)))) :
    Nonempty (dualizingComplex (Λ := Λ) a ≅
      ((tateTwist n X hX hΛ d).obj (EtaleDerived.constant X))⟦(2 * d : ℤ)⟧) := sorry

/-- Node `EDC.1:biduality/constructible-biduality`, for the constant sheaf on a smooth `X`
(the constructible statement waits for the constructibility predicate). -/
theorem verdierDualEval_isIso_constant (n : ℕ) [NeZero n] (hΛ : (n : Λ) = 0) (a : X ⟶ Spec (CommRingCat.of k))
    (d : ℕ) [SmoothOfRelativeDimension d a] [IsSeparated a] [LocallyOfFiniteType a] :
    IsIso (verdierDualEval (Λ := Λ) a (EtaleDerived.constant X)) := sorry

/-- Node `EDC.1:biduality/relative-and-geometric-duality` (a):
`Ra_* D_X K ≅ RHom(Ra_! K, Λ)` in `D(k_ét, Λ)`. -/
theorem relative_duality (a : X ⟶ Spec (CommRingCat.of k)) [IsSeparated a]
    [LocallyOfFiniteType a] (K : EtaleDerived Λ X) :
    Nonempty ((pushforward a).obj ((verdierDual a).obj (Opposite.op K)) ≅
      ((internalHom _).obj (Opposite.op ((lowerShriek a).obj K))).obj (EtaleDerived.constant _)) :=
  sorry

/-! Not typed here: `EDC.1:biduality/duality-exchange-isomorphisms` and
`EDC.1:biduality/recollement-adjunctions` restrict to constructible complexes (wait for the
constructibility predicate); their unbounded parts are `verdierDual_lowerShriek`,
`verdierDual_pullback`, `localizationTriangle_distinguished` and `lowerShriek_openImmersion`. -/

end Biduality

section Pairings

variable {Λ : Type u} [CommRing Λ] {Ω : Type u} [Field Ω] [IsSepClosed Ω] {X : Scheme.{u}}
  (n : ℕ) [NeZero n] (hΛ : (n : Λ) = 0)

/-- The Poincaré duality pairing `H^i_c(X, Λ) × H^{2d−i}(X, Λ(d)) → Λ` (cup product and trace). -/
def poincarePairing (a : X ⟶ Spec (CommRingCat.of Ω)) [IsSeparated a] [LocallyOfFiniteType a]
    (d : ℕ) (hX : IsUnit ((n : Γ(X, ⊤)))) (i : ℤ) :
    compactCohomologyModule (Λ := Λ) a i (EtaleDerived.constant X) →ₗ[Λ]
      cohomologyModule (2 * d - i) ((tateTwist n X hX hΛ d).obj (EtaleDerived.constant X))
        →ₗ[Λ] Λ := sorry

/-- Node `EDC.2:pairings/poincare-duality-torsion` (constant coefficients). -/
theorem poincare_duality (a : X ⟶ Spec (CommRingCat.of Ω)) [IsSeparated a] [LocallyOfFiniteType a]
    (d : ℕ) [SmoothOfRelativeDimension d a] (hX : IsUnit ((n : Γ(X, ⊤)))) (i : ℤ) :
    (poincarePairing n hΛ a d hX i).IsPerfPair := sorry

/-- Node `EDC.2:trace-purity/curve-h1-duality`: Poincaré duality on a smooth curve over an
algebraically closed field, proved from the Jacobian (constant coefficients shown). -/
theorem curve_h1_duality (a : X ⟶ Spec (CommRingCat.of Ω)) [IsSeparated a] [LocallyOfFiniteType a]
    [SmoothOfRelativeDimension 1 a] [IrreducibleSpace X] (hX : IsUnit ((n : Γ(X, ⊤)))) (r : ℤ) :
    (poincarePairing n hΛ a 1 hX r).IsPerfPair := sorry

/-! Not typed here (need Weil sheaves and Frobenius, lisse ℓ-adic sheaves, `j_*` of a lisse sheaf
on a curve, and the ℓ-adic realization of EllAdicRealization): the theorems of nodes
`cup-product-trace-pairing`, `galois-frobenius-equivariance`,
`adic-and-rational-poincare-duality`, `curve-poincare-duality-with-j-star-statement`,
`extreme-degree-cohomology`, `lisse-tensor-hom-duality-on-curves` and
`relative-duality-locally-constant`. -/

end Pairings

/-! ## EDC.3 — Gysin maps and cycle classes -/

section Cycles

variable {Λ : Type u} [CommRing Λ] {k : Type u} [Field k] {X Z Y : Scheme.{u}}
  (n : ℕ) [NeZero n] (hΛ : (n : Λ) = 0)

/-- Node `EDC.3/smooth-pair-purity`: `i^!Λ ≅ Λ(−c)[−2c]` for a smooth pair of codimension `c`. -/
theorem smooth_pair_purity (aX : X ⟶ Spec (CommRingCat.of k)) (aZ : Z ⟶ Spec (CommRingCat.of k))
    [Smooth aX] [Smooth aZ] (i : Z ⟶ X) [IsClosedImmersion i] (h : i ≫ aX = aZ) (c : ℕ)
    (hc : Order.krullDim X = Order.krullDim Z + c) (hZ : IsUnit ((n : Γ(Z, ⊤)))) :
    Nonempty ((upperShriek (Λ := Λ) i).obj (EtaleDerived.constant X) ≅
      ((tateTwist n Z hZ hΛ (-c)).obj (EtaleDerived.constant Z))⟦(-2 * c : ℤ)⟧) := sorry

/-- Node `EDC.3/semi-purity`. -/
theorem semi_purity [PerfectField k] (aX : X ⟶ Spec (CommRingCat.of k)) [Smooth aX] (i : Z ⟶ X)
    [IsClosedImmersion i] (c : ℕ) (hc : Order.krullDim Z + c ≤ Order.krullDim X)
    (q : ℤ) (hq : q < 2 * c) :
    IsZero (cohomologyWithSupports (Λ := Λ) i q (EtaleDerived.constant X)) := sorry

/-- The fundamental class with supports `s_{Z/X} ∈ H^{2c}_Z(X, Λ(c))`. -/
def fundamentalClass [PerfectField k] (aX : X ⟶ Spec (CommRingCat.of k)) [Smooth aX]
    (i : Z ⟶ X) [IsClosedImmersion i] [IrreducibleSpace Z] (c : ℕ) (hX : IsUnit ((n : Γ(X, ⊤)))) :
    cohomologyWithSupports i (2 * c) ((tateTwist (Λ := Λ) n X hX hΛ c).obj
      (EtaleDerived.constant X)) := sorry

/-- The étale cohomology class of a codimension-`c` cycle. -/
def cycleClass [PerfectField k] (aX : X ⟶ Spec (CommRingCat.of k)) [Smooth aX] (c : ℕ)
    (hX : IsUnit ((n : Γ(X, ⊤)))) :
    AlgebraicCycle X ℤ →+ cohomologyModule (Λ := Λ) (2 * c)
      ((tateTwist n X hX hΛ c).obj (EtaleDerived.constant X)) := sorry

/-- `cycleClass_zero` (test): the zero cycle has class zero. -/
example [PerfectField k] (aX : X ⟶ Spec (CommRingCat.of k)) [Smooth aX] (c : ℕ)
    (hX : IsUnit ((n : Γ(X, ⊤)))) : cycleClass n hΛ aX c hX 0 = 0 := map_zero _

/-- Gysin map `i_* : H^q(Z, Λ(m)) → H^{q+2c}(X, Λ(m+c))`. -/
def gysin (aX : X ⟶ Spec (CommRingCat.of k)) [Smooth aX] (i : Z ⟶ X) [IsClosedImmersion i]
    (c : ℕ) (q m : ℤ) (hX : IsUnit ((n : Γ(X, ⊤)))) (hZ : IsUnit ((n : Γ(Z, ⊤)))) :
    cohomologyModule (Λ := Λ) q ((tateTwist n Z hZ hΛ m).obj (EtaleDerived.constant Z)) ⟶
      cohomologyModule (q + 2 * c) ((tateTwist n X hX hΛ (m + c)).obj
        (EtaleDerived.constant X)) := sorry

/-- Proper pushforward `f_* : H^q(Y, Λ(m)) → H^{q−2e}(X, Λ(m−e))`, `e = dim Y − dim X`. -/
def properPushforward (f : Y ⟶ X) [IsProper f] (e q m : ℤ) (hX : IsUnit ((n : Γ(X, ⊤))))
    (hY : IsUnit ((n : Γ(Y, ⊤)))) :
    cohomologyModule (Λ := Λ) q ((tateTwist n Y hY hΛ m).obj (EtaleDerived.constant Y)) ⟶
      cohomologyModule (q - 2 * e) ((tateTwist n X hX hΛ (m - e)).obj
        (EtaleDerived.constant X)) := sorry

/-- Test `properPushforward_id`. -/
example (q m : ℤ) (hX : IsUnit ((n : Γ(X, ⊤)))) :
    properPushforward (Λ := Λ) n hΛ (𝟙 X) 0 q m hX hX = eqToHom (by simp) := sorry

/-! Not typed here. Names waiting for carriers:
* cup products on `cohomologyModule` (the ring structure is not yet defined there):
  `properPushforward_projection`, `trace_properPushforward`, `properPushforward_finiteFlat`,
  `gysin_baseChange`, `gysin_eq_properPushforward`, `gysin_one`, `properPushforward_comp`
  (its statement needs the iso `H^{q−2e−2e'} = H^{q−2(e+e')}`), tests `gysin_point_curve`,
  `gysin_hyperplane_powers`, `not_properPushforward_ring_hom`;
* `fundamentalClass_restrict`, `fundamentalClass_smooth`, `fundamentalClass_divisor`,
  `fundamentalClass_etale`, `fundamentalClassOfCycle`, tests `fundamentalClass_hyperplane`,
  `fundamentalClass_nodalCubic`, `fundamentalClass_whole`, `not_fundamentalClass_purity_singular`
  (need Cartier divisors, `ℙ^n`, and the singular cone as explicit schemes);
* vector bundles and projective bundles (SchemeAndStackFoundations SF.0): `chernClass`,
  `totalChernClass`, `chernClass_pullback`, `chernClass_one_lineBundle`,
  `totalChernClass_whitney`, `chernClass_eq_zero_of_rank_lt`,
  `chernClass_projectiveBundle_relation`, tests `chernClass_tangent_projectiveSpace`,
  `chernClass_trivial`, `chernClass_sum_lines`, `not_chernClass_two_of_line`;
* Chow groups and intersection products (SchemeAndStackFoundations SF.5):
  `cycleClass_rationalEquiv`, `cycleClass_divisor`, `cycleClass_pullback`,
  `cycleClass_pushforward`, `cycleClass_intersection`, `trace_cycleClass_point`,
  `cycleClass_galois`, tests `cycleClass_hyperplane`, `cycleClass_transverse_curves`,
  `cycleClass_principal`, `not_cycleClass_injective`;
* the named theorems of `gysin-sequence`, `projective-bundle-freeness`,
  `self-intersection-formula` and `projective-space-cohomology`. -/

end Cycles

end TauCeti.EtaleDuality
