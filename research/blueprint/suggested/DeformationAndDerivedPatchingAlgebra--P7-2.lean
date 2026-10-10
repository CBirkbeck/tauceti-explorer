/-
This file is not the roadmap and is not exhaustive. The reader document is
definitive. These statements suggest Lean forms so contributors and reviewers
can converge on names and signatures. Every `sorry` is a planning hole; nothing
here is claimed implemented. Pins: Mathlib 082e2d3, Tau Ceti f790474.

The Dependency namespace contains typing adapters for accepted P7 definitions
and the explicitly requested E1/DD.1 interfaces. Current upstream SR.0d owns
generic derived tensor/Hom; this file suggests their native module transport.
Strict module towers and discrete E/O adjoints belong to P7 under the tier order.
The Dependency namespace does not propose a
second implementation of those definitions. Refinement gaps are in the packet.
-/
import Mathlib.Algebra.Category.ModuleCat.AB
import Mathlib.Algebra.Category.ModuleCat.Monoidal.Closed
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.Algebra.Category.ModuleCat.Projective
import Mathlib.CategoryTheory.Monoidal.Closed.Braided
import Mathlib.Algebra.Homology.Monoidal
import Mathlib.Algebra.Homology.DerivedCategory.Linear
import Mathlib.Algebra.Homology.DerivedCategory.KProjective
import Mathlib.Algebra.Homology.DerivedCategory.HomologySequence
import Mathlib.Algebra.Homology.DerivedCategory.TStructure
import Mathlib.Algebra.Homology.HomotopyCategory.HomComplex
import Mathlib.Algebra.Homology.SpectralSequence.Basic
import Mathlib.CategoryTheory.Triangulated.Functor
import Mathlib.CategoryTheory.Monoidal.Tor
import Mathlib.CategoryTheory.Linear.Yoneda
import Mathlib.Algebra.Module.Injective
import Mathlib.RingTheory.LocalRing.Module
import Mathlib.RingTheory.AdicCompletion.AsTensorProduct
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.LinearAlgebra.Contraction
import Mathlib.RepresentationTheory.Invariants
import Mathlib.RepresentationTheory.Coinvariants
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.DirectSum.Module
import TauCeti.Algebra.Homology.LinearHomComplex.Basic
import TauCeti.Algebra.Homology.Monoidal.Braiding

noncomputable section
open CategoryTheory CategoryTheory.Limits CategoryTheory.MonoidalCategory CategoryTheory.Pretriangulated Opposite
open scoped ZeroObject TensorProduct
universe u
attribute [local instance] HasDerivedCategory.standard
namespace TauCeti.DerivedCoefficient
variable {R S A : Type u} [CommRing R] [CommRing S] [CommRing A]
abbrev Cpx (R : Type u) [CommRing R] := CochainComplex (ModuleCat.{u} R) ℤ
abbrev Der (R : Type u) [CommRing R] := DerivedCategory (ModuleCat.{u} R)
abbrev Q (C : Cpx R) : Der R := (DerivedCategory.Q : Cpx R ⥤ Der R).obj C
abbrev stalk (M : ModuleCat.{u} R) (i : ℤ) : Cpx R :=
  (HomologicalComplex.single (ModuleCat.{u} R) (ComplexShape.up ℤ) i).obj M
abbrev dstalk (M : ModuleCat.{u} R) (i : ℤ) : Der R :=
  (DerivedCategory.singleFunctor (ModuleCat.{u} R) i).obj M
abbrev H (i : ℤ) (X : Der R) : ModuleCat.{u} R :=
  (DerivedCategory.homologyFunctor (ModuleCat.{u} R) i).obj X
abbrev Hmap (i : ℤ) {X Y : Der R} (f : X ⟶ Y) :=
  (DerivedCategory.homologyFunctor (ModuleCat.{u} R) i).map f
abbrev extendC (f : R →+* S) : Cpx R ⥤ Cpx S :=
  (ModuleCat.extendScalars f).mapHomologicalComplex (ComplexShape.up ℤ)
namespace Dependency
-- The following two predicates spell out the already accepted P7 contracts.
def Bounds (C : Cpx R) (a b : ℤ) : Prop := C.IsStrictlyGE a ∧ C.IsStrictlyLE b
def FiniteProjective (C : Cpx R) : Prop :=
  ∀ i, Module.Finite R (C.X i) ∧ Module.Projective R (C.X i)
def FiniteFree (C : Cpx R) : Prop :=
  ∀ i, Module.Finite R (C.X i) ∧ Module.Free R (C.X i)
def IsPerfect (X : Der R) : Prop :=
  ∃ a b C, a ≤ b ∧ Bounds C a b ∧ FiniteProjective C ∧ Nonempty (Q C ≅ X)
def IsPseudoCoherent (X : Der R) : Prop :=
  ∃ b C, C.IsStrictlyLE b ∧ FiniteFree C ∧ Nonempty (Q C ≅ X)
def IsMinimal [IsLocalRing R] (C : Cpx R) : Prop :=
  ∀ i, LinearMap.range (C.d i (i + 1)).hom ≤
    IsLocalRing.maximalIdeal R • (⊤ : Submodule R (C.X (i + 1)))
-- Quotients remain actual modules; the displayed carrier fixes every element map.
abbrev quotient (I : Ideal R) (M : ModuleCat.{u} R) : ModuleCat.{u} R :=
  ModuleCat.of R (M ⧸ (I • (⊤ : Submodule R M)))
def quotientMap (I : Ideal R) (M : ModuleCat.{u} R) : M ⟶ quotient I M :=
  ModuleCat.ofHom (Submodule.mkQ _)
-- Requested DD.1 reflective completion functor and unit.
def derivedCompletion (I : Ideal R) : Der R ⥤ Der R := by sorry
def completionUnit (I : Ideal R) : 𝟭 (Der R) ⟶ derivedCompletion I := by sorry
-- Typing adapter for DD.1's localization-Hom criterion, not another owner.
def IsDerivedComplete (I : Ideal R) (X : Der R) : Prop :=
  ∀ f : R, f ∈ I → ∀ n : ℤ,
    Subsingleton (dstalk (ModuleCat.of R (Localization.Away f)) 0 ⟶ X⟦n⟧)
-- Native product formula for lim^1 of a module tower.
def oneMinusShift (T : ℕᵒᵖ ⥤ ModuleCat.{u} R) :
    ModuleCat.of R (∀ n : ℕ, T.obj (op n)) ⟶
      ModuleCat.of R (∀ n : ℕ, T.obj (op n)) := by sorry
def limOne (T : ℕᵒᵖ ⥤ ModuleCat.{u} R) : ModuleCat.{u} R := cokernel (oneMinusShift T)
-- Degree n of the signed finite-projective dual; the tail compares it to Tau.
def chainDual (C : Cpx R) : Cpx R := by sorry
def quotientComplex (I : Ideal R) (C : Cpx R) : Cpx R := by sorry
-- A finite decreasing filtration on a specified homology module.
structure FiniteFiltration (M : ModuleCat.{u} R) (lo hi : ℤ) where
  F : ℤ → Submodule R M
  decreasing : Antitone F
  exhaustive : ∀ p, p ≤ lo → F p = ⊤
  separated : ∀ p, hi < p → F p = ⊥
abbrev FiniteFiltration.graded {M : ModuleCat.{u} R} {lo hi : ℤ}
    (F : FiniteFiltration M lo hi) (p : ℤ) : ModuleCat.{u} R :=
  ModuleCat.of R (F.F p ⧸ (F.F (p + 1)).comap (F.F p).subtype)
-- Quotient-map adapters for the equivariant convergence comparison.
def FiniteFiltration.gradedMap {M : ModuleCat.{u} R} {lo hi : ℤ}
    (F : FiniteFiltration M lo hi) (f : M ⟶ M)
    (hf : ∀ p (x : M), x ∈ F.F p → f.hom x ∈ F.F p) (p : ℤ) :
    F.graded p ⟶ F.graded p := by sorry
lemma FiniteFiltration.gradedMap_mk {M : ModuleCat.{u} R} {lo hi : ℤ}
    (F : FiniteFiltration M lo hi) (f : M ⟶ M)
    (hf : ∀ p (x : M), x ∈ F.F p → f.hom x ∈ F.F p) (p : ℤ) (x : F.F p) :
    (F.gradedMap f hf p).hom
      ((Submodule.mkQ ((F.F (p + 1)).comap (F.F p).subtype)) x) =
        (Submodule.mkQ ((F.F (p + 1)).comap (F.F p).subtype))
          ⟨f.hom x.val, hf p x.val x.property⟩ := by sorry
-- Finite coefficient rings have their genuine quotient scalar structures.
@[instance_reducible] def quotientScalar (I : Ideal R) (M : ModuleCat.{u} R) :
    Module (R ⧸ I) (quotient I M) := by sorry
end Dependency
open Dependency
-- p7ii-kflat
 def IsKFlat (C : Cpx R) : Prop := ∀ E : Cpx R, E.Acyclic → (E ⊗ C).Acyclic
lemma IsKFlat.of_iso {C D : Cpx R} (e : C ≅ D) (h : IsKFlat C) : IsKFlat D := by sorry
lemma IsKFlat.tensor_acyclic {C : Cpx R} (h : IsKFlat C) (E : Cpx R)
    (he : E.Acyclic) : (E ⊗ C).Acyclic := by sorry
lemma IsKFlat.of_homotopyEquiv {C D : Cpx R} (e : HomotopyEquiv C D)
    (h : IsKFlat C) : IsKFlat D := by sorry
-- TauCeti.DerivedCoefficient.test_kflat_zero
example : IsKFlat (0 : Cpx R) := by sorry
-- TauCeti.DerivedCoefficient.test_kflat_free_stalk
example (M : ModuleCat.{u} R) [Module.Free R M] (n : ℤ) : IsKFlat (stalk M n) := by sorry
-- TauCeti.DerivedCoefficient.test_kflat_nonflat_stalk
example : ¬ IsKFlat (stalk (ModuleCat.of ℤ (ZMod 2)) 0) := by sorry
lemma kflat_stalk_flat (M : ModuleCat.{u} R) [Module.Flat R M] (n : ℤ) :
    IsKFlat (stalk M n) := by sorry
lemma kflat_cone {C D : Cpx R} (f : C ⟶ D) :
    (IsKFlat C ∧ IsKFlat D → IsKFlat (CochainComplex.mappingCone f)) ∧
    (IsKFlat C ∧ IsKFlat (CochainComplex.mappingCone f) → IsKFlat D) ∧
    (IsKFlat D ∧ IsKFlat (CochainComplex.mappingCone f) → IsKFlat C) := by sorry
lemma kflat_filtered_colimit {J : Type u} [Category J] [IsFiltered J]
    (F : J ⥤ Cpx R) [HasColimit F] (h : ∀ j, IsKFlat (F.obj j)) :
    IsKFlat (colimit F) := by sorry
lemma kflat_bounded_above_flat (C : Cpx R) (b : ℤ) [C.IsStrictlyLE b]
    [∀ i, Module.Flat R (C.X i)] : IsKFlat C := by sorry
lemma kflat_bounded_above_projective (C : Cpx R) (b : ℤ) [C.IsStrictlyLE b]
    [∀ i, Module.Projective R (C.X i)] : IsKFlat C := by sorry
lemma kflat_preserves_quasiiso {E F : Cpx R} (f : E ⟶ F) [QuasiIso f]
    (C : Cpx R) (h : IsKFlat C) : QuasiIso (f ⊗ₘ 𝟙 C) := by sorry
lemma kflat_quasiiso_arbitrary_factor {C D : Cpx R} (f : C ⟶ D) [QuasiIso f]
    (hc : IsKFlat C) (hd : IsKFlat D) (E : Cpx R) :
    QuasiIso (𝟙 E ⊗ₘ f) := by sorry
lemma kflat_basechange (f : R →+* S) (C : Cpx R) (h : IsKFlat C) :
    IsKFlat ((extendC f).obj C) := by sorry
lemma kflat_tensor {C D : Cpx R} (hc : IsKFlat C) (hd : IsKFlat D) :
    IsKFlat (C ⊗ D) := by sorry
-- Transport of current upstream SR.0d at the trivial group to native modules.
def derivedTensor : Der R ⥤ Der R ⥤ Der R := by sorry
abbrev dtensor (X Y : Der R) : Der R := (derivedTensor.obj X).obj Y
def derivedTensor_obj_obj (P T : Cpx R) (hp : IsKFlat P) (ht : IsKFlat T) :
    dtensor (Q P) (Q T) ≅ Q (P ⊗ T) := by sorry
lemma derivedTensor_map_id (X Y : Der R) :
    (derivedTensor.obj X).map (𝟙 Y) = 𝟙 (dtensor X Y) ∧
    (derivedTensor.map (𝟙 X)).app Y = 𝟙 (dtensor X Y) := by sorry
lemma derivedTensor_map_comp (X : Der R) {Y Z W : Der R} (f : Y ⟶ Z) (g : Z ⟶ W) :
    (derivedTensor.obj X).map (f ≫ g) =
      (derivedTensor.obj X).map f ≫ (derivedTensor.obj X).map g := by sorry
-- The curried map-comp equation in the first argument is already Functor.map_comp.
def derivedTensor_unit : derivedTensor.obj (dstalk (ModuleCat.of R R) 0) ≅ 𝟭 (Der R) := by sorry
def derivedTensor_braid (X Y : Der R) : dtensor X Y ≅ dtensor Y X := by sorry
-- TauCeti.DerivedCoefficient.test_tensor_zero
example (X : Der R) : IsZero (dtensor X (0 : Der R)) := by sorry
-- TauCeti.DerivedCoefficient.test_tensor_unit
example (X : Der R) : Nonempty (dtensor (dstalk (ModuleCat.of R R) 0) X ≅ X) := by sorry
-- TauCeti.DerivedCoefficient.test_tensor_torsion
example : let Z2 := dstalk (ModuleCat.of ℤ (ZMod 2)) 0
  Nonempty (H (-1) (dtensor Z2 Z2) ≅ ModuleCat.of ℤ (ZMod 2)) ∧
  Nonempty (H 0 (dtensor Z2 Z2) ≅ ModuleCat.of ℤ (ZMod 2)) ∧
  ∀ i : ℤ, i ≠ -1 → i ≠ 0 → IsZero (H i (dtensor Z2 Z2)) := by sorry
 def tensor_representative_comparison (E C : Cpx R) (h : IsKFlat C) :
    dtensor (Q E) (Q C) ≅ Q (E ⊗ C) := by sorry
-- Signed shift comparisons of the transported upstream tensor structure.
@[instance_reducible] def derivedTensorCommShift (Y : Der R) :
    (derivedTensor.obj Y).CommShift ℤ := by sorry
attribute [local instance] derivedTensorCommShift
lemma tensor_exact (Y : Der R) : (derivedTensor.obj Y).IsTriangulated := by sorry
-- Coherence is part of the upstream tensor structure; these are its comparisons.
def tensor_coherence (X Y Z : Der R) :
    dtensor (dtensor X Y) Z ≅ dtensor X (dtensor Y Z) := by sorry
 def derivedExtension (f : R →+* S) : Der R ⥤ Der S := by sorry
 def derivedExtension_model (f : R →+* S) (P : Cpx R) (h : IsKFlat P) :
    (derivedExtension f).obj (Q P) ≅ Q ((extendC f).obj P) := by sorry
 def derivedExtension_id : derivedExtension (RingHom.id R) ≅ 𝟭 (Der R) := by sorry
 def derivedExtension_comp (f : R →+* S) (g : S →+* A) :
    derivedExtension f ⋙ derivedExtension g ≅ derivedExtension (g.comp f) := by sorry
lemma derivedExtension_map_comp (f : R →+* S) {X Y Z : Der R} (u : X ⟶ Y) (v : Y ⟶ Z) :
    (derivedExtension f).map (u ≫ v) = (derivedExtension f).map u ≫ (derivedExtension f).map v := by sorry
-- TauCeti.DerivedCoefficient.test_extension_identity
example (X : Der R) : Nonempty ((derivedExtension (RingHom.id R)).obj X ≅ X) := by sorry
-- TauCeti.DerivedCoefficient.test_extension_flat
example [Algebra R S] [Module.Flat R S] (M : ModuleCat.{u} R) :
    Nonempty ((derivedExtension (algebraMap R S)).obj (dstalk M 0) ≅
      dstalk ((ModuleCat.extendScalars (algebraMap R S)).obj M) 0) := by sorry
-- TauCeti.DerivedCoefficient.test_extension_nonflat
example : let X : Der (ZMod 2) := (derivedExtension (Int.castRingHom (ZMod 2))).obj (dstalk (ModuleCat.of ℤ (ZMod 2)) 0);
  Nonempty (H (-1) X ≅ ModuleCat.of (ZMod 2) (ZMod 2)) ∧
  Nonempty (H 0 X ≅ ModuleCat.of (ZMod 2) (ZMod 2)) := by sorry
lemma extension_preserves_perfect (f : R →+* S) {X : Der R} (h : IsPerfect X) :
    IsPerfect ((derivedExtension f).obj X) := by sorry
lemma extension_preserves_pseudo (f : R →+* S) {X : Der R} (h : IsPseudoCoherent X) :
    IsPseudoCoherent ((derivedExtension f).obj X) := by sorry
 def tor_stalk_comparison (M N : ModuleCat.{u} R) (n : ℕ) :
    ((CategoryTheory.Tor (ModuleCat.{u} R) n).obj M).obj N ≅
      H (-(n : ℤ)) (dtensor (dstalk M 0) (dstalk N 0)) := by sorry
 def tor_balanced (n : ℕ) : CategoryTheory.Tor (ModuleCat.{u} R) n ≅
    CategoryTheory.Tor' (ModuleCat.{u} R) n := by sorry
 def tensor_cone_comparison (E : Cpx R) {C D : Cpx R} (f : C ⟶ D) :
    E ⊗ CochainComplex.mappingCone f ≅ CochainComplex.mappingCone (𝟙 E ⊗ₘ f) := by sorry
def HasTorAmplitude (X : Der R) (a b : ℤ) : Prop :=
  ∀ (M : ModuleCat.{u} R) (i : ℤ), i < a ∨ b < i → IsZero (H i (dtensor X (dstalk M 0)))
lemma HasTorAmplitude.of_iso {X Y : Der R} (e : X ≅ Y) {a b : ℤ}
    (h : HasTorAmplitude X a b) : HasTorAmplitude Y a b := by sorry
lemma HasTorAmplitude.mono {X : Der R} {a b a' b' : ℤ} (ha : a' ≤ a) (hb : b ≤ b')
    (h : HasTorAmplitude X a b) : HasTorAmplitude X a' b' := by sorry
lemma HasTorAmplitude.shift {X : Der R} {a b : ℤ} (h : HasTorAmplitude X a b) (n : ℤ) :
    HasTorAmplitude (X⟦n⟧) (a - n) (b - n) := by sorry
lemma HasTorAmplitude.cohomology {X : Der R} {a b : ℤ} (h : HasTorAmplitude X a b)
    (i : ℤ) (hi : i < a ∨ b < i) : IsZero (H i X) := by sorry
lemma HasTorAmplitude.finite (X : Der R) : (∃ a b, HasTorAmplitude X a b) ↔
    ∃ a b C, Bounds C a b ∧ (∀ i, Module.Flat R (C.X i)) ∧ Nonempty (Q C ≅ X) := by sorry
-- TauCeti.DerivedCoefficient.test_amplitude_zero
example (a b : ℤ) : HasTorAmplitude (0 : Der R) a b := by sorry
-- TauCeti.DerivedCoefficient.test_amplitude_free_stalk
example [Nontrivial R] (j a b : ℤ) :
    HasTorAmplitude (dstalk (ModuleCat.of R R) j) a b ↔ a ≤ j ∧ j ≤ b := by sorry
-- TauCeti.DerivedCoefficient.test_amplitude_torsion
example : HasTorAmplitude (dstalk (ModuleCat.of ℤ (ZMod 2)) 0) (-1) 0 ∧
    ¬ HasTorAmplitude (dstalk (ModuleCat.of ℤ (ZMod 2)) 0) 0 0 := by sorry
lemma tor_flat_criterion (M : ModuleCat.{u} R) : Module.Flat R M ↔
    ∀ N : ModuleCat.{u} R, IsZero (((CategoryTheory.Tor (ModuleCat.{u} R) 1).obj M).obj N) := by sorry
lemma amplitude_bounded_flat (C : Cpx R) (a b : ℤ) (hc : Bounds C a b)
    (hf : ∀ i, Module.Flat R (C.X i)) : HasTorAmplitude (Q C) a b := by sorry
lemma amplitude_bottom_syzygy (C : Cpx R) (a b d : ℤ) [C.IsStrictlyLE d]
    [∀ i, Module.Flat R (C.X i)] (h : HasTorAmplitude (Q C) a b) :
    Module.Flat R (cokernel (C.d (a - 1) a) : ModuleCat.{u} R) := by sorry
lemma amplitude_flat_representative (X : Der R) (a b : ℤ) (hab : a ≤ b) :
    HasTorAmplitude X a b ↔ ∃ C, Bounds C a b ∧
      (∀ i, Module.Flat R (C.X i)) ∧ Nonempty (Q C ≅ X) := by sorry
lemma amplitude_basechange (f : R →+* S) {X : Der R} {a b : ℤ}
    (h : HasTorAmplitude X a b) : HasTorAmplitude ((derivedExtension f).obj X) a b := by sorry
lemma amplitude_retract {X Y : Der R} (i : X ⟶ Y) (r : Y ⟶ X) (hir : i ≫ r = 𝟙 X)
    {a b : ℤ} (h : HasTorAmplitude Y a b) : HasTorAmplitude X a b := by sorry
lemma amplitude_triangle_middle (T : Triangle (Der R)) (ht : T ∈ distTriang (Der R))
    (a b : ℤ) (h1 : HasTorAmplitude T.obj₁ a b) (h3 : HasTorAmplitude T.obj₃ a b) :
    HasTorAmplitude T.obj₂ a b := by sorry
lemma amplitude_triangle_cone (T : Triangle (Der R)) (ht : T ∈ distTriang (Der R))
    (a b : ℤ) (h1 : HasTorAmplitude T.obj₁ (a + 1) (b + 1))
    (h2 : HasTorAmplitude T.obj₂ a b) : HasTorAmplitude T.obj₃ a b := by sorry
 def IsMPseudoCoherent (X : Der R) (m : ℤ) : Prop :=
  ∃ a b E, Bounds E a b ∧ FiniteFree E ∧ ∃ φ : Q E ⟶ X,
    (∀ i, m < i → IsIso (Hmap i φ)) ∧ Epi (Hmap m φ)
lemma IsMPseudoCoherent.mono {X : Der R} {n m : ℤ} (hnm : n ≤ m)
    (h : IsMPseudoCoherent X n) : IsMPseudoCoherent X m := by sorry
lemma IsMPseudoCoherent.of_iso {X Y : Der R} (e : X ≅ Y) {m : ℤ}
    (h : IsMPseudoCoherent X m) : IsMPseudoCoherent Y m := by sorry
lemma IsMPseudoCoherent.of_pseudo {X : Der R} (h : IsPseudoCoherent X) (m : ℤ) :
    IsMPseudoCoherent X m := by sorry
lemma IsMPseudoCoherent.shift {X : Der R} {m : ℤ} (h : IsMPseudoCoherent X m) (n : ℤ) :
    IsMPseudoCoherent (X⟦n⟧) (m - n) := by sorry
-- TauCeti.DerivedCoefficient.test_mpseudo_zero
example (m : ℤ) : IsMPseudoCoherent (0 : Der R) m := by sorry
-- TauCeti.DerivedCoefficient.test_mpseudo_stalk_finite
example (M : ModuleCat.{u} R) : IsMPseudoCoherent (dstalk M 0) 0 ↔ Module.Finite R M := by sorry
-- TauCeti.DerivedCoefficient.test_mpseudo_stalk_presentation
example (M : ModuleCat.{u} R) : IsMPseudoCoherent (dstalk M 0) (-1) ↔
    Module.FinitePresentation R M := by sorry
lemma mpseudo_triangle_cone (T : Triangle (Der R)) (ht : T ∈ distTriang (Der R)) (m : ℤ)
    (h1 : IsMPseudoCoherent T.obj₁ (m + 1)) (h2 : IsMPseudoCoherent T.obj₂ m) :
    IsMPseudoCoherent T.obj₃ m := by sorry
lemma mpseudo_triangle_middle (T : Triangle (Der R)) (ht : T ∈ distTriang (Der R)) (m : ℤ)
    (h1 : IsMPseudoCoherent T.obj₁ m) (h3 : IsMPseudoCoherent T.obj₃ m) :
    IsMPseudoCoherent T.obj₂ m := by sorry
lemma mpseudo_top_finite {X : Der R} (m : ℤ) (h : IsMPseudoCoherent X m)
    (hz : ∀ i, m < i → IsZero (H i X)) : Module.Finite R (H m X) := by sorry
lemma mpseudo_all_orders_model (X : Der R) :
    (IsPseudoCoherent X ↔ ∀ m, IsMPseudoCoherent X m) ∧
    (∀ b, (∀ i, b < i → IsZero (H i X)) → IsPseudoCoherent X →
      ∃ C, C.IsStrictlyLE b ∧ FiniteFree C ∧ Nonempty (Q C ≅ X)) := by sorry
lemma pseudo_triangle (T : Triangle (Der R)) (ht : T ∈ distTriang (Der R)) :
    (IsPseudoCoherent T.obj₁ ∧ IsPseudoCoherent T.obj₂ → IsPseudoCoherent T.obj₃) ∧
    (IsPseudoCoherent T.obj₁ ∧ IsPseudoCoherent T.obj₃ → IsPseudoCoherent T.obj₂) ∧
    (IsPseudoCoherent T.obj₂ ∧ IsPseudoCoherent T.obj₃ → IsPseudoCoherent T.obj₁) := by sorry
lemma mpseudo_retract (X Y : Der R) (m : ℤ) (h : IsMPseudoCoherent (X ⊞ Y) m) :
    IsMPseudoCoherent X m ∧ IsMPseudoCoherent Y m := by sorry
lemma pseudo_retract (X Y : Der R) (h : IsPseudoCoherent (X ⊞ Y)) :
    IsPseudoCoherent X ∧ IsPseudoCoherent Y := by sorry
lemma finite_projective_interval (X : Der R) (a b : ℤ) (hab : a ≤ b)
    (hp : IsPseudoCoherent X) (ht : HasTorAmplitude X a b) :
    ∃ E, Bounds E a b ∧ FiniteProjective E ∧ Nonempty (Q E ≅ X) := by sorry
lemma perfect_pseudo_finite_tor (X : Der R) : IsPerfect X ↔
    IsPseudoCoherent X ∧ ∃ a b, a ≤ b ∧ HasTorAmplitude X a b := by sorry
lemma perfect_triangle (T : Triangle (Der R)) (ht : T ∈ distTriang (Der R)) :
    (IsPerfect T.obj₁ ∧ IsPerfect T.obj₂ → IsPerfect T.obj₃) ∧
    (IsPerfect T.obj₁ ∧ IsPerfect T.obj₃ → IsPerfect T.obj₂) ∧
    (IsPerfect T.obj₂ ∧ IsPerfect T.obj₃ → IsPerfect T.obj₁) := by sorry
lemma perfect_retract (X Y : Der R) (h : IsPerfect (X ⊞ Y)) :
    IsPerfect X ∧ IsPerfect Y := by sorry
lemma minimal_support_amplitude [IsLocalRing R] (X : Der R) (M : Cpx R) (b0 a b : ℤ)
    (hab : a ≤ b) (hp : IsPseudoCoherent X) (hb : M.IsStrictlyLE b0)
    (hf : FiniteFree M) (hm : IsMinimal M) (e : Q M ≅ X) :
    (HasTorAmplitude X a b ↔ ∀ i, i < a ∨ b < i →
      IsZero (H i ((derivedExtension (Ideal.Quotient.mk (IsLocalRing.maximalIdeal R))).obj X))) ∧
    (HasTorAmplitude X a b ↔ Bounds M a b) := by sorry
-- The exact Tor connecting map and tensor inclusion are actual module maps.
lemma tor_one_ideal_sequence (I : Ideal R) (M : ModuleCat.{u} R) :
    ∃ δ : (((CategoryTheory.Tor (ModuleCat.{u} R) 1).obj M).obj
      (ModuleCat.of R (R ⧸ I))) ⟶ M ⊗ ModuleCat.of R I,
    (ShortComplex.mk δ (𝟙 M ⊗ₘ ModuleCat.ofHom I.subtype) (by sorry)).Exact := by sorry
 def derivedHom : (Der R)ᵒᵖ ⥤ Der R ⥤ Der R := by sorry
abbrev dhom (X Y : Der R) : Der R := (derivedHom.obj (op X)).obj Y
 def derivedHom_cohomology (X Y : Der R) (n : ℤ) :
    H n (dhom X Y) ≃ₗ[R] (X ⟶ (Y⟦n⟧)) := by sorry
lemma derivedHom_map_id (X Y : Der R) :
    (derivedHom.obj (op X)).map (𝟙 Y) = 𝟙 (dhom X Y) ∧
    (derivedHom.map (𝟙 (op X))).app Y = 𝟙 (dhom X Y) := by sorry
lemma derivedHom_map_comp {X Y Z : Der R} (f : X ⟶ Y) (g : Y ⟶ Z) (W : Der R) :
    (derivedHom.map ((f ≫ g).op)).app W =
      (derivedHom.map g.op).app W ≫ (derivedHom.map f.op).app W := by sorry
 def derivedHom_unit : derivedHom.obj (op (dstalk (ModuleCat.of R R) 0)) ≅ 𝟭 (Der R) := by sorry
 def derivedHom_tensor_adjunction (X Y Z : Der R) :
    (dtensor X Y ⟶ Z) ≃ (X ⟶ dhom Y Z) := by sorry
-- TauCeti.DerivedCoefficient.test_hom_zero
example (Y : Der R) : IsZero (dhom (0 : Der R) Y) := by sorry
-- TauCeti.DerivedCoefficient.test_hom_unit
example (Y : Der R) : Nonempty (dhom (dstalk (ModuleCat.of R R) 0) Y ≅ Y) := by sorry
-- TauCeti.DerivedCoefficient.test_hom_torsion
example : let X := dhom (dstalk (ModuleCat.of ℤ (ZMod 2)) 0) (dstalk (ModuleCat.of ℤ ℤ) 0);
  Nonempty (H 1 X ≅ ModuleCat.of ℤ (ZMod 2)) ∧ IsZero (H 0 X) ∧
  ∀ i : ℤ, i ≠ 1 → IsZero (H i X) := by sorry
 def perfectDual (X : Der R) : Der R := dhom X (dstalk (ModuleCat.of R R) 0)
 def perfectDual_map {X Y : Der R} (f : X ⟶ Y) : perfectDual Y ⟶ perfectDual X :=
  (derivedHom.map f.op).app _
lemma perfectDual_map_comp {X Y Z : Der R} (f : X ⟶ Y) (g : Y ⟶ Z) :
    perfectDual_map (f ≫ g) = perfectDual_map g ≫ perfectDual_map f := by sorry
 def perfectDual_bidevaluation (X : Der R) (h : IsPerfect X) :
    X ≅ perfectDual (perfectDual X) := by sorry
lemma perfectDual_amplitude {X : Der R} (hp : IsPerfect X) {a b : ℤ}
    (hab : a ≤ b) (h : HasTorAmplitude X a b) :
    HasTorAmplitude (perfectDual X) (-b) (-a) := by sorry
-- TauCeti.DerivedCoefficient.test_dual_zero
example : IsZero (perfectDual (0 : Der R)) := by sorry
-- TauCeti.DerivedCoefficient.test_dual_stalk
example (M : ModuleCat.{u} R) [Module.Finite R M] [Module.Projective R M] (n : ℤ) :
    Nonempty (perfectDual (dstalk M n) ≅
      dstalk (ModuleCat.of R (Module.Dual R M)) (-n)) := by sorry
-- TauCeti.DerivedCoefficient.test_dual_torsion
example : let X := perfectDual (dstalk (ModuleCat.of ℤ (ZMod 2)) 0);
  Nonempty (H 1 X ≅ ModuleCat.of ℤ (ZMod 2)) ∧ IsZero (H 0 X) := by sorry
lemma dual_projective_support (P : Cpx R) (a b : ℤ) (hb : Bounds P a b)
    (hp : FiniteProjective P) : Bounds (chainDual P) (-b) (-a) ∧
      FiniteProjective (chainDual P) := by sorry
lemma perfect_dual_perfect {X : Der R} (h : IsPerfect X) : IsPerfect (perfectDual X) := by sorry
 def chain_bidual_sign (P : Cpx R) (a b : ℤ) (hb : Bounds P a b) (hp : FiniteProjective P) :
    P ≅ chainDual (chainDual P) := by sorry
-- Degreewise and signed differential contracts for the finite dual model.
 def chainDualTerm (C : Cpx R) (n : ℤ) : (chainDual C).X n ≅
    ModuleCat.of R (Module.Dual R (C.X (-n))) := by sorry
lemma chainDual_differential (C : Cpx R) (n : ℤ) :
    (chainDual C).d n (n + 1) ≫ (chainDualTerm C (n + 1)).hom =
      (chainDualTerm C n).hom ≫ ModuleCat.ofHom
        ((((Int.negOnePow (n + 1) : ℤ) : R)) • (C.d (-(n + 1)) (-n)).hom.dualMap) := by sorry
 def chainBidualTerm (C : Cpx R) (n : ℤ) : (chainDual (chainDual C)).X n ≅
    ModuleCat.of R (Module.Dual R (Module.Dual R (C.X n))) := by sorry
lemma chain_bidual_sign_component (P : Cpx R) (a b : ℤ) (hb : Bounds P a b)
    (hp : FiniteProjective P) (n : ℤ) (x : P.X n) (f : Module.Dual R (P.X n)) :
    (chainBidualTerm P n).hom.hom (((chain_bidual_sign P a b hb hp).hom.f n).hom x) f =
      ((Int.negOnePow n : ℤ) : R) * f x := by sorry
 def perfect_tensor_hom (X Y : Der R) (h : IsPerfect X) :
    dtensor Y (perfectDual X) ≅ dhom X Y := by sorry
 def dual_basechange (f : R →+* S) (X : Der R) (h : IsPerfect X) :
    (derivedExtension f).obj (perfectDual X) ≅ perfectDual ((derivedExtension f).obj X) := by sorry
 def perfect_hom_basechange (f : R →+* S) (X Y : Der R) (h : IsPerfect X) :
    (derivedExtension f).obj (dhom X Y) ≅
      dhom ((derivedExtension f).obj X) ((derivedExtension f).obj Y) := by sorry
lemma perfect_tensor_perfect {X Y : Der R} (hx : IsPerfect X) (hy : IsPerfect Y) :
    IsPerfect (dtensor X Y) := by sorry
-- Countable generation is a countable spanning family, not finite generation.
lemma projective_countable_decomposition (P : ModuleCat.{u} R) [Module.Projective R P] :
    ∃ (ι : Type u) (M : ι → ModuleCat.{u} R),
      (∀ i, Module.Projective R (M i) ∧ ∃ s : Set (M i), s.Countable ∧
        Submodule.span R s = ⊤) ∧ Nonempty (P ≃ₗ[R] DirectSum ι (fun i => M i)) := by sorry
lemma local_free_summand [IsLocalRing R] (P : ModuleCat.{u} R) [Module.Projective R P] (x : P) :
    ∃ N K : Submodule R P, x ∈ N ∧ Module.Finite R N ∧ Module.Free R N ∧ IsCompl N K := by sorry
lemma countable_local_projective_free [IsLocalRing R] (P : ModuleCat.{u} R)
    [Module.Projective R P] (hc : ∃ s : Set P, s.Countable ∧ Submodule.span R s = ⊤) :
    Module.Free R P := by sorry
lemma local_projective_free [IsLocalRing R] (P : ModuleCat.{u} R) [Module.Projective R P] :
    Module.Free R P := by sorry
lemma nilpotent_residue_spanning (I : Ideal R) (hi : IsNilpotent I) (M : ModuleCat.{u} R)
    {ι : Type u} (v : ι → M)
    (hv : Submodule.span R (Set.range (fun i => (quotientMap I M).hom (v i))) = ⊤) :
    Submodule.span R (Set.range v) = ⊤ := by sorry
lemma nilpotent_flat_free [IsLocalRing R] (hi : IsNilpotent (IsLocalRing.maximalIdeal R))
    (M : ModuleCat.{u} R) [Module.Flat R M] {ι : Type u} :
    letI := quotientScalar (IsLocalRing.maximalIdeal R) M
    ∀ (b : Module.Basis ι (R ⧸ IsLocalRing.maximalIdeal R) (quotient (IsLocalRing.maximalIdeal R) M))
      (x : ι → M), (∀ i, (quotientMap (IsLocalRing.maximalIdeal R) M).hom (x i) = b i) →
      ∃ B : Module.Basis ι R M, ∀ i, B i = x i := by sorry
-- DVR quotient statements quantify over arbitrary residue bases and their lifts.
lemma dvr_lifts_span_quotients [IsDomain R] [IsDiscreteValuationRing R]
    (π : R) (hπ : Ideal.span {π} = IsLocalRing.maximalIdeal R) (P : ModuleCat.{u} R)
    {ι : Type u} (x : ι → P)
    (hx : Submodule.span R (Set.range (fun i => (quotientMap (Ideal.span {π}) P).hom (x i))) = ⊤)
    (n : ℕ) (hn : 1 ≤ n) :
    Submodule.span R (Set.range (fun i => (quotientMap (Ideal.span {π ^ n}) P).hom (x i))) = ⊤ := by sorry
lemma dvr_lifts_independent_quotients [IsDomain R] [IsDiscreteValuationRing R]
    (π : R) (hπ : Ideal.span {π} = IsLocalRing.maximalIdeal R) (P : ModuleCat.{u} R)
    (ht : Function.Injective (fun x : P => π • x)) {ι : Type u} (x : ι → P) :
    letI := quotientScalar (Ideal.span {π}) P
    ∀ (_ : LinearIndependent (R ⧸ Ideal.span {π})
      (fun i => (quotientMap (Ideal.span {π}) P).hom (x i))) (n : ℕ), 1 ≤ n →
      letI := quotientScalar (Ideal.span {π ^ n}) P
      LinearIndependent (R ⧸ Ideal.span {π ^ n})
        (fun i => (quotientMap (Ideal.span {π ^ n}) P).hom (x i)) := by sorry
lemma dvr_torsionfree_quotient_free [IsDomain R] [IsDiscreteValuationRing R]
    (π : R) (hπ : Ideal.span {π} = IsLocalRing.maximalIdeal R) (P : ModuleCat.{u} R)
    (ht : Function.Injective (fun x : P => π • x)) {ι : Type u} :
    letI := quotientScalar (Ideal.span {π}) P
    ∀ (b : Module.Basis ι (R ⧸ Ideal.span {π}) (quotient (Ideal.span {π}) P)) (x : ι → P),
      (∀ i, (quotientMap (Ideal.span {π}) P).hom (x i) = b i) →
      ∀ n : ℕ, 1 ≤ n → letI := quotientScalar (Ideal.span {π ^ n}) P
      ∃ B : Module.Basis ι (R ⧸ Ideal.span {π ^ n}) (quotient (Ideal.span {π ^ n}) P),
        ∀ i, B i = (quotientMap (Ideal.span {π ^ n}) P).hom (x i) := by sorry
-- For the finite-algebra criterion the quotient scalar actions are explicit
-- inputs, with the scalar-tower compatibility; these are genuine module data.
lemma finite_algebra_residue_free [IsDomain R] [IsDiscreteValuationRing R]
    [Algebra R S] [Module.Finite R S] [Module.Free R S]
    (π : R) (hπ : Ideal.span {π} = IsLocalRing.maximalIdeal R) (n : ℕ) (hn : 1 ≤ n)
    (M : ModuleCat.{u} S) [Module R M] [IsScalarTower R S M]
    [Module (R ⧸ Ideal.span {π ^ n}) M]
    [Module (S ⧸ Ideal.span {algebraMap R S (π ^ n)}) M]
    [IsScalarTower R (R ⧸ Ideal.span {π ^ n}) M]
    [IsScalarTower S (S ⧸ Ideal.span {algebraMap R S (π ^ n)}) M]
    (hkill : ∀ x : M, π ^ n • x = 0)
    [Module.Free (R ⧸ Ideal.span {π ^ n}) M] :
    letI := quotientScalar (Ideal.span {algebraMap R S π}) M
    Module.Free (S ⧸ Ideal.span {algebraMap R S π})
      (quotient (Ideal.span {algebraMap R S π}) M) →
    Module.Free (S ⧸ Ideal.span {algebraMap R S (π ^ n)}) M := by sorry
-- The native group algebra quotient is canonically (R/(π^n))[Δ].
lemma finite_group_coefficient_free [IsDomain R] [IsDiscreteValuationRing R]
    {Δ : Type u} [CommGroup Δ] [Fintype Δ] (π : R)
    (hπ : Ideal.span {π} = IsLocalRing.maximalIdeal R) (n : ℕ) (hn : 1 ≤ n)
    (M : ModuleCat (MonoidAlgebra R Δ)) [Module R M]
    [IsScalarTower R (MonoidAlgebra R Δ) M]
    [Module (R ⧸ Ideal.span {π ^ n}) M]
    [Module ((MonoidAlgebra R Δ) ⧸ Ideal.span {algebraMap R (MonoidAlgebra R Δ) (π ^ n)}) M]
    [IsScalarTower R (R ⧸ Ideal.span {π ^ n}) M]
    [IsScalarTower (MonoidAlgebra R Δ)
      ((MonoidAlgebra R Δ) ⧸ Ideal.span {algebraMap R (MonoidAlgebra R Δ) (π ^ n)}) M]
    (hkill : ∀ x : M, π ^ n • x = 0)
    [Module.Free (R ⧸ Ideal.span {π ^ n}) M] :
    letI := quotientScalar (Ideal.span {algebraMap R (MonoidAlgebra R Δ) π}) M
    Module.Free ((MonoidAlgebra R Δ) ⧸ Ideal.span {algebraMap R (MonoidAlgebra R Δ) π})
      (quotient (Ideal.span {algebraMap R (MonoidAlgebra R Δ) π}) M) →
    Module.Free ((MonoidAlgebra R Δ) ⧸ Ideal.span {algebraMap R (MonoidAlgebra R Δ) (π ^ n)}) M := by sorry
lemma noetherian_finite_cohomology_pseudo [IsNoetherianRing R] (X : Der R) :
    IsPseudoCoherent X ↔ (∀ i, Module.Finite R (H i X)) ∧
      ∃ b : ℤ, ∀ i, b < i → IsZero (H i X) := by sorry
lemma noetherian_perfect_criterion [IsNoetherianRing R] (X : Der R) :
    IsPerfect X ↔ (∀ i, Module.Finite R (H i X)) ∧
      (∃ a b, ∀ i, i < a ∨ b < i → IsZero (H i X)) ∧
      ∃ a b, HasTorAmplitude X a b := by sorry
lemma local_residue_perfect_criterion [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] (X : Der R)
    (hp : IsPseudoCoherent X)
    (hb : ∃ a b : ℤ, ∀ i : ℤ, i < a ∨ b < i →
      IsZero (H i ((derivedExtension (Ideal.Quotient.mk
        (IsLocalRing.maximalIdeal R))).obj X))) : IsPerfect X := by sorry
section CompleteFlat
variable [IsLocalRing R] [IsNoetherianRing R] [IsAdicComplete (IsLocalRing.maximalIdeal R) R]
 def IsCompleteFlatComplex (C : Cpx R) : Prop :=
  (∃ a b, Bounds C a b) ∧ ∀ i, Module.Flat R (C.X i) ∧
    IsAdicComplete (IsLocalRing.maximalIdeal R) (C.X i)
lemma IsCompleteFlatComplex.of_iso {C D : Cpx R} (e : C ≅ D)
    (h : IsCompleteFlatComplex C) : IsCompleteFlatComplex D := by sorry
lemma IsCompleteFlatComplex.cone {C D : Cpx R} (f : C ⟶ D)
    (hc : IsCompleteFlatComplex C) (hd : IsCompleteFlatComplex D) :
    IsCompleteFlatComplex (CochainComplex.mappingCone f) := by sorry
lemma IsCompleteFlatComplex.kflat {C : Cpx R} (h : IsCompleteFlatComplex C) : IsKFlat C := by sorry
-- TauCeti.DerivedCoefficient.test_complete_flat_zero
example : IsCompleteFlatComplex (0 : Cpx R) := by sorry
-- TauCeti.DerivedCoefficient.test_complete_flat_finite_free
example (C : Cpx R) (a b : ℤ) (hb : Bounds C a b) (hf : FiniteFree C) :
    IsCompleteFlatComplex C := by sorry
-- TauCeti.DerivedCoefficient.test_complete_flat_fraction_field
example {O : Type u} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] :
    ¬ IsCompleteFlatComplex (stalk (ModuleCat.of O (FractionRing O)) 0) := by sorry
-- PM:L0 Part II supplies the topological-basis input for this splitting.
structure CompleteFlatSplit (M N : ModuleCat.{u} R) (f : M ⟶ N) where
  M₁ : ModuleCat.{u} R
  M₂ : ModuleCat.{u} R
  N₁ : ModuleCat.{u} R
  N₂ : ModuleCat.{u} R
  m : M ≃ₗ[R] (M₁ × M₂)
  n : N ≃ₗ[R] (N₁ × N₂)
  u : M₁ ≃ₗ[R] N₁
  v : M₂ →ₗ[R] N₂
  formula : ∀ x : M, n (f.hom x) = (u (m x).1, v (m x).2)
  flat : Module.Flat R M₁ ∧ Module.Flat R M₂ ∧ Module.Flat R N₁ ∧ Module.Flat R N₂
  complete : IsAdicComplete (IsLocalRing.maximalIdeal R) M₁ ∧
    IsAdicComplete (IsLocalRing.maximalIdeal R) M₂ ∧
    IsAdicComplete (IsLocalRing.maximalIdeal R) N₁ ∧
    IsAdicComplete (IsLocalRing.maximalIdeal R) N₂
  small : ∀ x, v x ∈ IsLocalRing.maximalIdeal R • (⊤ : Submodule R N₂)
 def complete_flat_morphism_splitting (M N : ModuleCat.{u} R) (f : M ⟶ N)
    [Module.Flat R M] [Module.Flat R N]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) M]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) N] : CompleteFlatSplit M N f := by sorry
-- A diagonalized invertible differential block, with residual-zero complement.
structure DifferentialBlock (C : Cpx R) (i : ℤ) (J : ModuleCat.{u} R) where
  U : ModuleCat.{u} R
  V : ModuleCat.{u} R
  left : C.X i ≃ₗ[R] (J × U)
  right : C.X (i + 1) ≃ₗ[R] (J × V)
  v : U →ₗ[R] V
  equation : ∀ x, right ((C.d i (i + 1)).hom x) = ((left x).1, v (left x).2)
  small : ∀ x, v x ∈ IsLocalRing.maximalIdeal R • (⊤ : Submodule R V)
lemma complete_flat_disk_cancellation (C : Cpx R) (hc : IsCompleteFlatComplex C)
    (J : ModuleCat.{u} R) (i : ℤ) (block : DifferentialBlock C i J) :
    ∃ N : Cpx R, IsCompleteFlatComplex N ∧
      Nonempty (C ≅ N ⊞ CochainComplex.mappingCone (𝟙 (stalk J (i + 1)))) ∧
      LinearMap.range (N.d i (i + 1)).hom ≤
        IsLocalRing.maximalIdeal R • (⊤ : Submodule R (N.X (i + 1))) := by sorry
structure CompleteFlatMinimalData (C : Cpx R) (a b : ℤ) where
  N : Cpx R
  bounds : Bounds N a b
  completeFlat : IsCompleteFlatComplex N
  minimal : IsMinimal N
  i : N ⟶ C
  s : C ⟶ N
  retract : i ≫ s = 𝟙 N
  homotopy : Homotopy (s ≫ i) (𝟙 C)
 def completeFlatMinimalModel (C : Cpx R) (a b : ℤ) (hb : Bounds C a b)
    (hc : IsCompleteFlatComplex C) : CompleteFlatMinimalData C a b := by sorry
lemma completeFlatMinimalModel.retract (C : Cpx R) (a b : ℤ) (hb : Bounds C a b)
    (hc : IsCompleteFlatComplex C) :
    (completeFlatMinimalModel C a b hb hc).i ≫ (completeFlatMinimalModel C a b hb hc).s =
      𝟙 (completeFlatMinimalModel C a b hb hc).N := by sorry
 def completeFlatMinimalModel.homotopy (C : Cpx R) (a b : ℤ) (hb : Bounds C a b)
    (hc : IsCompleteFlatComplex C) : Homotopy
      ((completeFlatMinimalModel C a b hb hc).s ≫ (completeFlatMinimalModel C a b hb hc).i)
      (𝟙 C) := by sorry
 def completeFlatMinimalModel.residue (C : Cpx R) (a b : ℤ) (hb : Bounds C a b)
    (hc : IsCompleteFlatComplex C) (j : ℤ) :
    quotient (IsLocalRing.maximalIdeal R) ((completeFlatMinimalModel C a b hb hc).N.X j) ≅
      H j (Q (C ⊗ stalk (ModuleCat.of R (R ⧸ IsLocalRing.maximalIdeal R)) 0)) := by sorry
-- TauCeti.DerivedCoefficient.test_complete_minimal_zero
example (hb : Bounds (0 : Cpx R) 0 0) (hc : IsCompleteFlatComplex (0 : Cpx R)) :
    IsZero (completeFlatMinimalModel 0 0 0 hb hc).N := by sorry
-- TauCeti.DerivedCoefficient.test_complete_minimal_unit_disk
example (M : ModuleCat.{u} R) [Module.Flat R M]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) M] (i : ℤ)
    (hb : Bounds (CochainComplex.mappingCone (𝟙 (stalk M (i + 1)))) i (i + 1))
    (hc : IsCompleteFlatComplex (CochainComplex.mappingCone (𝟙 (stalk M (i + 1))))) :
    IsZero (completeFlatMinimalModel _ i (i + 1) hb hc).N := by sorry
-- A named two-term fixture with its actual multiplication map, not a cohomology list.
 def uniformizerComplex (π : R) : Cpx R :=
  CochainComplex.mappingCone
    ((HomologicalComplex.single (ModuleCat.{u} R) (ComplexShape.up ℤ) 0).map
      (ModuleCat.ofHom (π • (LinearMap.id : R →ₗ[R] R))))
-- TauCeti.DerivedCoefficient.test_complete_minimal_uniformizer
example {O : Type u} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] (π : O)
    (hπ : Ideal.span {π} = IsLocalRing.maximalIdeal O) :
    IsMinimal (uniformizerComplex π) ∧ ¬ IsZero ((uniformizerComplex π).X (-1)) ∧
      ¬ IsZero ((uniformizerComplex π).X 0) := by sorry
lemma complete_flat_residual_perfect (C : Cpx R) (a b : ℤ) (hb : Bounds C a b)
    (hc : IsCompleteFlatComplex C)
    (hf : ∀ i, Module.Finite R (H i (Q (C ⊗
      stalk (ModuleCat.of R (R ⧸ IsLocalRing.maximalIdeal R)) 0)))) :
    ∃ N, Bounds N a b ∧ FiniteFree N ∧ Nonempty (Q N ≅ Q C) := by sorry
lemma complete_flat_residual_acyclic (C : Cpx R) (hc : IsCompleteFlatComplex C)
    (hz : (C ⊗ stalk (ModuleCat.of R (R ⧸ IsLocalRing.maximalIdeal R)) 0).Acyclic) :
    Nonempty (Homotopy (𝟙 C) (0 : C ⟶ C)) := by sorry
lemma complete_flat_residual_quasiiso {C D : Cpx R} (f : C ⟶ D)
    (hc : IsCompleteFlatComplex C) (hd : IsCompleteFlatComplex D)
    [QuasiIso (f ⊗ₘ 𝟙 (stalk (ModuleCat.of R (R ⧸ IsLocalRing.maximalIdeal R)) 0))] :
    QuasiIso f := by sorry
 def complete_flat_transfer_composition (C : Cpx R) (a b : ℤ) (hb : Bounds C a b)
    (hc : IsCompleteFlatComplex C) (t u : End C) :
    let D := completeFlatMinimalModel C a b hb hc
    Homotopy ((D.i ≫ t ≫ D.s) ≫ (D.i ≫ u ≫ D.s)) (D.i ≫ t ≫ u ≫ D.s) := by sorry
end CompleteFlat
 def dual_degree_zero_cokernel (P : Cpx R) (l : ℤ) (hb : Bounds P 0 l)
    (hp : FiniteProjective P) : H 0 (perfectDual (Q P)) ≅
    (cokernel (ModuleCat.ofHom (P.d 0 1).hom.dualMap) : ModuleCat.{u} R) := by sorry
 def dual_degree_zero_field (F : Type u) [Field F] (f : R →+* F)
    (P : Cpx R) (l : ℤ) (hb : Bounds P 0 l) (hp : FiniteProjective P) :
    (ModuleCat.extendScalars f).obj (H 0 (perfectDual (Q P))) ≅
      ModuleCat.of F (Module.Dual F (H 0 ((derivedExtension f).obj (Q P)))) := by sorry
abbrev fractionQuotient (O : Type u) [CommRing O] [IsDomain O] : ModuleCat.{u} O :=
  ModuleCat.of O (FractionRing O ⧸ Submodule.span O ({1} : Set (FractionRing O)))
-- p7ii-dvr-quotient-injective: divisibility plus the native Baer criterion.
lemma dvr_quotient_injective (O : Type u) [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] : Module.Injective O (fractionQuotient O) := by sorry
-- p7ii-dvr-quotient-endomorphism: compatible scalar actions modulo π^n.
def dvr_quotient_endomorphism (O : Type u) [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O] :
    O ≃+* End (fractionQuotient O) := by sorry
lemma dvr_quotient_endomorphism_apply (O : Type u) [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (a : O) (x : fractionQuotient O) :
    (dvr_quotient_endomorphism O a).hom x = a • x := by sorry
-- p7ii-quotient-dual: an actual specialization of native linear Yoneda.
def quotientDualFunctor (O : Type u) [CommRing O] [IsDomain O] :
    (ModuleCat.{u} O)ᵒᵖ ⥤ ModuleCat.{u} O :=
  (CategoryTheory.linearYoneda O (ModuleCat.{u} O)).obj (fractionQuotient O)
abbrev quotientDual (O : Type u) [CommRing O] [IsDomain O] (M : ModuleCat.{u} O) :=
  (quotientDualFunctor O).obj (op M)
lemma quotientDual_map (O : Type u) [CommRing O] [IsDomain O]
    {M N : ModuleCat.{u} O} (f : M ⟶ N) (g : N ⟶ fractionQuotient O) :
    ((quotientDualFunctor O).map f.op).hom g = f ≫ g := by sorry
lemma quotientDual_map_comp (O : Type u) [CommRing O] [IsDomain O]
    {M N P : ModuleCat.{u} O} (f : M ⟶ N) (g : N ⟶ P) :
    (quotientDualFunctor O).map (f ≫ g).op =
      (quotientDualFunctor O).map g.op ≫ (quotientDualFunctor O).map f.op := by sorry
lemma quotientDual_exact (O : Type u) [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] (s : ShortComplex (ModuleCat.{u} O))
    (hs : s.ShortExact) :
    ∃ h : (quotientDualFunctor O).map s.g.op ≫ (quotientDualFunctor O).map s.f.op = 0,
      (ShortComplex.mk ((quotientDualFunctor O).map s.g.op)
        ((quotientDualFunctor O).map s.f.op) h).ShortExact := by sorry
def quotientDual_evaluate (O : Type u) [CommRing O] [IsDomain O] :
    quotientDual O (ModuleCat.of O O) ≅ fractionQuotient O := by sorry
-- TauCeti.DerivedCoefficient.test_quotient_dual_zero
example (O : Type u) [CommRing O] [IsDomain O] :
    IsZero (quotientDual O (0 : ModuleCat.{u} O)) := by sorry
-- TauCeti.DerivedCoefficient.test_quotient_dual_residue
example (O : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] :
    Nonempty (quotientDual O (ModuleCat.of O (O ⧸ IsLocalRing.maximalIdeal O)) ≅
      ModuleCat.of O (O ⧸ IsLocalRing.maximalIdeal O)) := by sorry
-- TauCeti.DerivedCoefficient.test_quotient_dual_fraction
example (O : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] :
    Nonempty (quotientDual O (fractionQuotient O) ≅ ModuleCat.of O O) := by sorry
-- p7ii-finite-free-quotient-dual
def finite_free_quotient_dual (O : Type u) [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (M : ModuleCat.{u} O) [Module.Free O M] [Module.Finite O M] :
    quotientDual O (M ⊗ fractionQuotient O) ≅ ModuleCat.of O (Module.Dual O M) := by sorry
-- The retained node id p7ii-dvr-pontryagin-adjoint now states only E/O-linear duality.
def dvr_quotient_adjoint (O : Type u) [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (M N : ModuleCat.{u} O) [Module.Free O M] [Module.Finite O M]
    [Module.Free O N] [Module.Finite O N] (φ : M ⟶ N) :
    quotientDual O (kernel (φ ⊗ₘ 𝟙 (fractionQuotient O))) ≅
      (cokernel (ModuleCat.ofHom φ.hom.dualMap) : ModuleCat.{u} O) := by sorry
 def dual_degree_zero_dvr (O : Type u) [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    [Algebra O R] (f : R →+* O) (hf : f.comp (algebraMap O R) = RingHom.id O)
    (P : Cpx R) (l : ℤ) (hb : Bounds P 0 l) (hp : FiniteProjective P) :
    (ModuleCat.extendScalars f).obj (H 0 (perfectDual (Q P))) ≅
      quotientDual O
        (H 0 (Q (((extendC f).obj P) ⊗ stalk (fractionQuotient O) 0))) := by sorry
lemma finite_module_complete [IsNoetherianRing R] (I : Ideal R) [IsAdicComplete I R]
    (M : ModuleCat.{u} R) [Module.Finite R M] : IsAdicComplete I M := by sorry
 def coefficientQuotientTower (C : Cpx R) (I : Ideal R) : ℕᵒᵖ ⥤ Cpx R := by sorry
 def coefficientQuotientTower_projection (C : Cpx R) (I : Ideal R) :
    (Functor.const ℕᵒᵖ).obj C ⟶ coefficientQuotientTower C I := by sorry
-- These coordinate isomorphisms specify the level and every quotient element.
 def quotientTowerTerm (C : Cpx R) (I : Ideal R) (n : ℕ) (j : ℤ) :
    ((coefficientQuotientTower C I).obj (op n)).X j ≅ quotient (I ^ (n + 1)) (C.X j) := by sorry
lemma coefficientQuotientTower_transition (C : Cpx R) (I : Ideal R)
    (n m : ℕ) (h : n ≤ m) (j : ℤ) (x : C.X j) :
    (quotientTowerTerm C I n j).hom.hom
      (((coefficientQuotientTower C I).map (homOfLE h).op).f j |>
        (fun f => f.hom ((quotientTowerTerm C I m j).inv.hom
          ((quotientMap (I ^ (m + 1)) (C.X j)).hom x)))) =
      (quotientMap (I ^ (n + 1)) (C.X j)).hom x := by sorry
lemma coefficientQuotientTower_surjective (C : Cpx R) (I : Ideal R)
    (n m : ℕ) (h : n ≤ m) (j : ℤ) :
    Function.Surjective (((coefficientQuotientTower C I).map (homOfLE h).op).f j).hom := by sorry
 def coefficientQuotientTower_map (I : Ideal R) : Cpx R ⥤ (ℕᵒᵖ ⥤ Cpx R) := by sorry
lemma quotientTowerMap_obj (I : Ideal R) (C : Cpx R) :
    (coefficientQuotientTower_map I).obj C = coefficientQuotientTower C I := by sorry
-- TauCeti.DerivedCoefficient.test_quotient_tower_zero
example (I : Ideal R) : IsZero (coefficientQuotientTower (0 : Cpx R) I) := by sorry
-- TauCeti.DerivedCoefficient.test_quotient_tower_stalk
example (I : Ideal R) (n : ℕ) : Nonempty
    ((coefficientQuotientTower (stalk (ModuleCat.of R R) 0) I).obj (op n) ≅
      stalk (ModuleCat.of R (R ⧸ I ^ (n + 1))) 0) := by sorry
-- TauCeti.DerivedCoefficient.test_quotient_tower_nonflat
example : let C := stalk (ModuleCat.of ℤ (ZMod 2)) 0;
    IsZero (H (-1) (Q ((coefficientQuotientTower C (Ideal.span {(2 : ℤ)})).obj (op 0)))) ∧
    ¬ IsZero (H (-1) ((derivedExtension (Int.castRingHom (ZMod 2))).obj (Q C))) := by sorry
-- The level has its genuine quotient-ring structure through extendC; the
-- native restriction of scalars compares it with the common R-valued tower.
 def quotient_tower_derived_comparison (C : Cpx R) (I : Ideal R) (h : IsKFlat C) (n : ℕ) :
    (derivedExtension (Ideal.Quotient.mk (I ^ (n + 1)))).obj (Q C) ≅
      Q ((extendC (Ideal.Quotient.mk (I ^ (n + 1)))).obj C) := by sorry
abbrev restrictedQuotientTerm (C : Cpx R) (I : Ideal R) (n : ℕ) : Cpx R :=
  ((ModuleCat.restrictScalars (Ideal.Quotient.mk (I ^ (n + 1)))).mapHomologicalComplex
    (ComplexShape.up ℤ)).obj ((extendC (Ideal.Quotient.mk (I ^ (n + 1)))).obj C)
def quotientTowerRestrictedTerm (C : Cpx R) (I : Ideal R) (n : ℕ) :
    restrictedQuotientTerm C I n ≅ (coefficientQuotientTower C I).obj (op n) := by sorry
lemma quotientTowerRestrictedTerm_generator (C : Cpx R) (I : Ideal R) (n : ℕ)
    (j : ℤ) (x : C.X j) :
    ((quotientTowerRestrictedTerm C I n).hom.f j).hom
      ((1 : R ⧸ I ^ (n + 1)) ⊗ₜ[R] x) =
        (quotientTowerTerm C I n j).inv.hom ((quotientMap (I ^ (n + 1)) (C.X j)).hom x) := by sorry
def quotient_tower_common_R_comparison (C : Cpx R) (I : Ideal R) (n : ℕ) :
    Q (restrictedQuotientTerm C I n) ≅ Q ((coefficientQuotientTower C I).obj (op n)) :=
  (DerivedCategory.Q : Cpx R ⥤ Der R).mapIso (quotientTowerRestrictedTerm C I n)
 def quotient_tower_homotopy {C D : Cpx R} (f g : C ⟶ D) (h : Homotopy f g)
    (I : Ideal R) (n : ℕ) :
    Homotopy (((coefficientQuotientTower_map I).map f).app (op n))
      (((coefficientQuotientTower_map I).map g).app (op n)) := by sorry
 def coefficient_complex_limit [IsNoetherianRing R] (I : Ideal R) [IsAdicComplete I R]
    (C : Cpx R) (a b : ℤ) (hb : Bounds C a b) (hf : ∀ i, Module.Finite R (C.X i)) :
    C ≅ limit (coefficientQuotientTower C I) := by sorry
-- p7ii-derived-inverse-limit: strict towers retain the coherence for cone maps.
abbrev towerProduct (C : ℕᵒᵖ ⥤ Cpx R) : Cpx R := ∏ᶜ fun n : ℕ => C.obj (op n)
def towerOneMinusShift (C : ℕᵒᵖ ⥤ Cpx R) : towerProduct C ⟶ towerProduct C := by sorry
lemma towerOneMinusShift_coordinate (C : ℕᵒᵖ ⥤ Cpx R) (n : ℕ) :
    towerOneMinusShift C ≫ Pi.π (fun k : ℕ => C.obj (op k)) n =
      Pi.π (fun k : ℕ => C.obj (op k)) n -
        Pi.π (fun k : ℕ => C.obj (op k)) (n + 1) ≫
          C.map (homOfLE (Nat.le_succ n)).op := by sorry
def derivedInverseLimit : (ℕᵒᵖ ⥤ Cpx R) ⥤ Der R := by sorry
def derivedInverseLimit_model (C : ℕᵒᵖ ⥤ Cpx R) :
    derivedInverseLimit.obj C ≅ Q ((CochainComplex.mappingCone
      (towerOneMinusShift C))⟦(-1 : ℤ)⟧) := by sorry
lemma derivedInverseLimit_map_id (C : ℕᵒᵖ ⥤ Cpx R) :
    derivedInverseLimit.map (𝟙 C) = 𝟙 (derivedInverseLimit.obj C) := by sorry
lemma derivedInverseLimit_map_comp {C D E : ℕᵒᵖ ⥤ Cpx R} (f : C ⟶ D) (g : D ⟶ E) :
    derivedInverseLimit.map (f ≫ g) = derivedInverseLimit.map f ≫ derivedInverseLimit.map g := by sorry
lemma derivedInverseLimit_quasiiso {C D : ℕᵒᵖ ⥤ Cpx R} (f : C ⟶ D)
    (hf : ∀ n : ℕ, QuasiIso (f.app (op n))) : IsIso (derivedInverseLimit.map f) := by sorry
-- TauCeti.DerivedCoefficient.test_derived_limit_zero
example : IsZero (derivedInverseLimit.obj (0 : ℕᵒᵖ ⥤ Cpx R)) := by sorry
-- TauCeti.DerivedCoefficient.test_derived_limit_constant
example (C : Cpx R) :
    Nonempty (derivedInverseLimit.obj ((Functor.const ℕᵒᵖ).obj C) ≅ Q C) := by sorry
-- TauCeti.DerivedCoefficient.test_derived_limit_zero_transitions
example (C : ℕᵒᵖ ⥤ Cpx R)
    (hz : ∀ n m : ℕ, ∀ h : n ≤ m, n < m → C.map (homOfLE h).op = 0) :
    IsZero (derivedInverseLimit.obj C) := by sorry
 def surjective_tower_derived_limit (C : ℕᵒᵖ ⥤ Cpx R)
    (hs : ∀ n m (h : n ≤ m) j, Function.Surjective ((C.map (homOfLE h).op).f j).hom) :
    Q (limit C) ≅ derivedInverseLimit.obj C := by sorry
abbrev homologyTower (C : ℕᵒᵖ ⥤ Cpx R) (j : ℤ) : ℕᵒᵖ ⥤ ModuleCat.{u} R :=
  C ⋙ (DerivedCategory.Q : Cpx R ⥤ Der R) ⋙ DerivedCategory.homologyFunctor (ModuleCat.{u} R) j
 lemma module_tower_milnor (C : ℕᵒᵖ ⥤ Cpx R)
    (hs : ∀ n m (h : n ≤ m) j, Function.Surjective ((C.map (homOfLE h).op).f j).hom)
    (j : ℤ) : ∃ s : ShortComplex (ModuleCat.{u} R), s.ShortExact ∧
      Nonempty (s.X₁ ≅ limOne (homologyTower C (j - 1))) ∧
      Nonempty (s.X₂ ≅ H j (Q (limit C))) ∧
      Nonempty (s.X₃ ≅ limit (homologyTower C j)) := by sorry
lemma finite_length_cohomology_ml (T : ℕᵒᵖ ⥤ ModuleCat.{u} R)
    (hf : ∀ n, IsNoetherian R (T.obj (op n)) ∧ IsArtinian R (T.obj (op n))) :
    (∀ n : ℕ, ∃ m : ℕ, ∃ hnm : n ≤ m, ∀ k : ℕ, ∀ hmk : m ≤ k,
      LinearMap.range (T.map (homOfLE (hnm.trans hmk)).op).hom =
        LinearMap.range (T.map (homOfLE hnm).op).hom) ∧
    IsZero (limOne T) := by sorry
 def perfect_coefficient_cohomology_limit [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] (C : Cpx R) (a b : ℤ)
    (hb : Bounds C a b) (hp : FiniteProjective C) (j : ℤ) :
    H j (Q C) ≅ limit (homologyTower (coefficientQuotientTower C (IsLocalRing.maximalIdeal R)) j) := by sorry
lemma perfect_coefficient_limOne_zero [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] (C : Cpx R) (a b : ℤ)
    (hb : Bounds C a b) (hp : FiniteProjective C) (j : ℤ) :
    IsZero (limOne (homologyTower (coefficientQuotientTower C (IsLocalRing.maximalIdeal R)) j)) := by sorry
 def perfect_derived_completion_comparison [IsNoetherianRing R] (I : Ideal R)
    (X : Der R) (hp : IsPerfect X) (C : Cpx R) (a b : ℤ) (hb : Bounds C a b)
    (hpc : FiniteProjective C) (e : Q C ≅ X) :
    (derivedCompletion I).obj X ≅ derivedInverseLimit.obj (coefficientQuotientTower C I) := by sorry
lemma perfect_completion_unit_isIso [IsNoetherianRing R] (I : Ideal R)
    [IsAdicComplete I R] (X : Der R) (hp : IsPerfect X) :
    IsIso ((completionUnit I).app X) := by sorry
lemma complete_pseudo_derived_complete [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] (X : Der R) (hp : IsPseudoCoherent X) :
    IsDerivedComplete (IsLocalRing.maximalIdeal R) X := by sorry
lemma complete_pseudo_derived_nakayama [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] (X : Der R) (hp : IsPseudoCoherent X)
    (h : IsZero ((derivedExtension (Ideal.Quotient.mk (IsLocalRing.maximalIdeal R))).obj X)) :
    IsZero X := by sorry
lemma complete_pseudo_derived_nakayama_map [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] {X Y : Der R}
    (hx : IsPseudoCoherent X) (hy : IsPseudoCoherent Y) (f : X ⟶ Y)
    (hf : IsIso ((derivedExtension (Ideal.Quotient.mk
      (IsLocalRing.maximalIdeal R))).map f)) : IsIso f := by sorry
 def strictTowerLimitMap (C D : ℕᵒᵖ ⥤ Cpx R) (f : C ⟶ D) : limit C ⟶ limit D :=
  lim.map f
structure StrictTowerAction (T : Type u) [Ring T] (C : ℕᵒᵖ ⥤ Cpx R) where
  action : ∀ n : ℕ, T →+* End (C.obj (op n))
  commutes : ∀ (n m : ℕ) (h : n ≤ m) (t : T),
    action m t ≫ C.map (homOfLE h).op = C.map (homOfLE h).op ≫ action n t
lemma StrictTowerAction.ext {T : Type u} [Ring T] {C : ℕᵒᵖ ⥤ Cpx R}
    (a b : StrictTowerAction T C) (h : ∀ n t, a.action n t = b.action n t) : a = b := by sorry
 def StrictTowerAction.restrict {T U : Type u} [Ring T] [Ring U]
    {C : ℕᵒᵖ ⥤ Cpx R} (a : StrictTowerAction T C) (f : U →+* T) :
    StrictTowerAction U C := by sorry
 def StrictTowerAction.quotient {T : Type u} [Ring T] (C : Cpx R)
    (a : T →+* End C) (I : Ideal R) : StrictTowerAction T (coefficientQuotientTower C I) := by sorry
 def StrictTowerAction.limit {T : Type u} [Ring T] {C : ℕᵒᵖ ⥤ Cpx R}
    (a : StrictTowerAction T C) : T →+* End (limit C) := by sorry
lemma towerActionLimit_projection {T : Type u} [Ring T] {C : ℕᵒᵖ ⥤ Cpx R}
    (a : StrictTowerAction T C) (n : ℕ) (t : T) :
    a.limit t ≫ limit.π C (op n) = limit.π C (op n) ≫ a.action n t := by sorry
-- TauCeti.DerivedCoefficient.test_action_zero_complex
example (T : Type u) [Ring T] :
    Unique (StrictTowerAction T ((Functor.const ℕᵒᵖ).obj (0 : Cpx R))) := by sorry
-- TauCeti.DerivedCoefficient.test_action_scalar_quotients
example (C : Cpx R) (I : Ideal R) : ∃ a : StrictTowerAction R (coefficientQuotientTower C I),
    ∀ n (r : R) j, (a.action n r).f j = r • 𝟙 _ := by sorry
-- TauCeti.DerivedCoefficient.test_action_incompatible_levels
example : ¬ ∃ a : StrictTowerAction (Polynomial ℚ)
    ((Functor.const ℕᵒᵖ).obj (stalk (ModuleCat.of ℚ ℚ) 0)),
    a.action 0 Polynomial.X = 0 ∧ a.action 1 Polynomial.X = 𝟙 _ := by sorry
-- Naturality equips all three terms of the Milnor sequence with T-actions.
-- The middle action and every coordinate of the right action are prescribed.
-- The canonical product-cokernel description of the left action is in the reader.
lemma strict_action_limit_milnor {T : Type u} [Ring T] (C : ℕᵒᵖ ⥤ Cpx R)
    (a : StrictTowerAction T C)
    (hs : ∀ n m (h : n ≤ m) j, Function.Surjective ((C.map (homOfLE h).op).f j).hom) :
    ∀ j : ℤ, ∃ s : ShortComplex (ModuleCat.{u} R), s.ShortExact ∧
      ∃ (_ : s.X₁ ≅ limOne (homologyTower C (j - 1)))
        (e₂ : s.X₂ ≅ H j (Q (limit C)))
        (e₃ : s.X₃ ≅ limit (homologyTower C j))
        (a₁ : T →+* End s.X₁) (a₂ : T →+* End s.X₂) (a₃ : T →+* End s.X₃),
      (∀ t, a₁ t ≫ s.f = s.f ≫ a₂ t) ∧
      (∀ t, a₂ t ≫ s.g = s.g ≫ a₃ t) ∧
      (∀ t, a₂ t ≫ e₂.hom = e₂.hom ≫
        Hmap j ((DerivedCategory.Q : Cpx R ⥤ Der R).map (a.limit t))) ∧
      ∀ t n, a₃ t ≫ e₃.hom ≫ limit.π (homologyTower C j) (op n) =
        e₃.hom ≫ limit.π (homologyTower C j) (op n) ≫
          Hmap j ((DerivedCategory.Q : Cpx R ⥤ Der R).map (a.action n t)) := by sorry
-- Every homotopy component commutes with the tower transitions.
 def homotopy_system_limit {C D : ℕᵒᵖ ⥤ Cpx R} (f g : C ⟶ D)
    (h : ∀ n : ℕ, Homotopy (f.app (op n)) (g.app (op n)))
    (hc : ∀ n m (hnm : n ≤ m) i j,
      (C.map (homOfLE hnm).op).f i ≫ (h n).hom i j =
        (h m).hom i j ≫ (D.map (homOfLE hnm).op).f j) :
    Homotopy (strictTowerLimitMap C D f) (strictTowerLimitMap C D g) := by sorry
lemma tensor_finite_diagonals (C P : Cpx R) (b : ℤ) [C.IsStrictlyLE b] [P.IsStrictlyLE 0]
    (n : ℤ) :
    Set.Finite {pq : ℤ × ℤ | pq.1 + pq.2 = n ∧ ¬ IsZero (C.X pq.2 ⊗ P.X pq.1)} ∧
    ∀ p q, p + q = n → ¬ IsZero (C.X q ⊗ P.X p) → n - b ≤ p ∧ p ≤ 0 ∧ n ≤ q ∧ q ≤ b := by sorry
 def coefficientSpectralSequence (C : Cpx R) (B : ModuleCat.{u} R) (b : ℤ)
    (hC : C.IsStrictlyLE b) : E₂CohomologicalSpectralSequence (ModuleCat.{u} R) := by sorry
 def coefficientSpectralSequence_E2 (C : Cpx R) (B : ModuleCat.{u} R) (b : ℤ)
    (hC : C.IsStrictlyLE b) (p q : ℤ) (hp : p ≤ 0) :
    ((coefficientSpectralSequence C B b hC).page 2).X (p, q) ≅
      ((CategoryTheory.Tor (ModuleCat.{u} R) (-p).toNat).obj (H q (Q C))).obj B := by sorry
lemma coefficientSpectralSequence_E2_zero (C : Cpx R) (B : ModuleCat.{u} R) (b : ℤ)
    (hC : C.IsStrictlyLE b) (p q : ℤ) (hz : 0 < p ∨ b < q) :
    IsZero (((coefficientSpectralSequence C B b hC).page 2).X (p, q)) := by sorry
 def coefficientSpectralSequence_map {C D : Cpx R} {B B' : ModuleCat.{u} R}
    (f : C ⟶ D) (g : B ⟶ B') (b : ℤ) (hC : C.IsStrictlyLE b) (hD : D.IsStrictlyLE b) :
    coefficientSpectralSequence C B b hC ⟶ coefficientSpectralSequence D B' b hD := by sorry
lemma coefficientSpectralSequence_map_id (C : Cpx R) (B : ModuleCat.{u} R) (b : ℤ)
    (hC : C.IsStrictlyLE b) : coefficientSpectralSequence_map (𝟙 C) (𝟙 B) b hC hC = 𝟙 _ := by sorry
lemma coefficientSpectralSequence_map_comp {C D E : Cpx R} {B B' B'' : ModuleCat.{u} R}
    (f : C ⟶ D) (f' : D ⟶ E) (g : B ⟶ B') (g' : B' ⟶ B'') (b : ℤ)
    (hC : C.IsStrictlyLE b) (hD : D.IsStrictlyLE b) (hE : E.IsStrictlyLE b) :
    coefficientSpectralSequence_map (f ≫ f') (g ≫ g') b hC hE =
      coefficientSpectralSequence_map f g b hC hD ≫
        coefficientSpectralSequence_map f' g' b hD hE := by sorry
lemma coefficientSpectralSequence_map_add {C D : Cpx R} (f g : C ⟶ D)
    (B : ModuleCat.{u} R) (b : ℤ) (hC : C.IsStrictlyLE b) (hD : D.IsStrictlyLE b)
    (r : ℤ) (hr : 2 ≤ r) :
    (coefficientSpectralSequence_map (f + g) (𝟙 B) b hC hD).hom r hr =
      (coefficientSpectralSequence_map f (𝟙 B) b hC hD).hom r hr +
        (coefficientSpectralSequence_map g (𝟙 B) b hC hD).hom r hr := by sorry
lemma coefficientSpectralSequence_coefficient_map_add (C : Cpx R)
    {B B' : ModuleCat.{u} R} (f g : B ⟶ B') (b : ℤ) (hC : C.IsStrictlyLE b)
    (r : ℤ) (hr : 2 ≤ r) :
    (coefficientSpectralSequence_map (𝟙 C) (f + g) b hC hC).hom r hr =
      (coefficientSpectralSequence_map (𝟙 C) f b hC hC).hom r hr +
        (coefficientSpectralSequence_map (𝟙 C) g b hC hC).hom r hr := by sorry
-- TauCeti.DerivedCoefficient.test_spectral_free_stalk
example (B : ModuleCat.{u} R) (hc : (stalk (ModuleCat.of R R) 0).IsStrictlyLE 0) :
    let E := coefficientSpectralSequence (stalk (ModuleCat.of R R) 0) B 0 hc;
    (∀ (r : ℤ) (hr : 2 ≤ r), Nonempty ((E.page r hr).X (0, 0) ≅ B) ∧
      ∀ p q : ℤ, (p, q) ≠ (0, 0) → IsZero ((E.page r hr).X (p, q))) ∧
    Nonempty (H 0 (dtensor (dstalk (ModuleCat.of R R) 0) (dstalk B 0)) ≅ B) ∧
    ∀ i : ℤ, i ≠ 0 → IsZero (H i (dtensor (dstalk (ModuleCat.of R R) 0) (dstalk B 0))) := by sorry
-- TauCeti.DerivedCoefficient.test_spectral_torsion_stalk
example (hc : (stalk (ModuleCat.of ℤ (ZMod 2)) 0).IsStrictlyLE 0) :
    let E := coefficientSpectralSequence (stalk (ModuleCat.of ℤ (ZMod 2)) 0)
      (ModuleCat.of ℤ (ZMod 2)) 0 hc;
    (∀ (r : ℤ) (hr : 2 ≤ r),
      Nonempty ((E.page r hr).X (-1, 0) ≅ ModuleCat.of ℤ (ZMod 2)) ∧
      Nonempty ((E.page r hr).X (0, 0) ≅ ModuleCat.of ℤ (ZMod 2)) ∧
      ∀ p q : ℤ, (p, q) ≠ (-1, 0) → (p, q) ≠ (0, 0) → IsZero ((E.page r hr).X (p, q))) ∧
    Nonempty (H (-1) (dtensor (dstalk (ModuleCat.of ℤ (ZMod 2)) 0)
      (dstalk (ModuleCat.of ℤ (ZMod 2)) 0)) ≅ ModuleCat.of ℤ (ZMod 2)) ∧
    Nonempty (H 0 (dtensor (dstalk (ModuleCat.of ℤ (ZMod 2)) 0)
      (dstalk (ModuleCat.of ℤ (ZMod 2)) 0)) ≅ ModuleCat.of ℤ (ZMod 2)) ∧
    ∀ i : ℤ, i ≠ -1 → i ≠ 0 → IsZero (H i (dtensor (dstalk (ModuleCat.of ℤ (ZMod 2)) 0)
      (dstalk (ModuleCat.of ℤ (ZMod 2)) 0))) := by sorry
-- TauCeti.DerivedCoefficient.test_spectral_uniformizer_complex
example (hc : (uniformizerComplex (2 : ℤ)).IsStrictlyLE 0) :
    let E := coefficientSpectralSequence (uniformizerComplex (2 : ℤ)) (ModuleCat.of ℤ (ZMod 2)) 0 hc;
    Nonempty ((E.page 2).X (-1, 0) ≅ ModuleCat.of ℤ (ZMod 2)) ∧
    Nonempty ((E.page 2).X (0, 0) ≅ ModuleCat.of ℤ (ZMod 2)) ∧
    (∀ p q : ℤ, (p, q) ≠ (-1, 0) → (p, q) ≠ (0, 0) → IsZero ((E.page 2).X (p, q))) ∧
    Nonempty (H (-1) (dtensor (Q (uniformizerComplex (2 : ℤ)))
      (dstalk (ModuleCat.of ℤ (ZMod 2)) 0)) ≅ ModuleCat.of ℤ (ZMod 2)) ∧
    Nonempty (H 0 (dtensor (Q (uniformizerComplex (2 : ℤ)))
      (dstalk (ModuleCat.of ℤ (ZMod 2)) 0)) ≅ ModuleCat.of ℤ (ZMod 2)) ∧
    ∀ i : ℤ, i ≠ -1 → i ≠ 0 → IsZero (H i (dtensor (Q (uniformizerComplex (2 : ℤ)))
      (dstalk (ModuleCat.of ℤ (ZMod 2)) 0))) := by sorry
lemma coefficient_spectral_convergence (C : Cpx R) (B : ModuleCat.{u} R) (b : ℤ)
    (hC : C.IsStrictlyLE b) (n : ℤ) :
    ∃ F : FiniteFiltration (H n (dtensor (Q C) (dstalk B 0))) (n - b) 0,
      ∀ (p r : ℤ) (hr : 2 ≤ r), max 2 (b - n + 2) ≤ r →
        Nonempty (F.graded p ≅ ((coefficientSpectralSequence C B b hC).page r hr).X (p, n - p)) := by sorry
 def coefficient_spectral_flat (C : Cpx R) (B : ModuleCat.{u} R) [Module.Flat R B]
    (b : ℤ) (hC : C.IsStrictlyLE b) (n : ℤ) :
    H n (dtensor (Q C) (dstalk B 0)) ≅ H n (Q C) ⊗ B := by sorry
-- An action on each native page is obtained by functoriality in C. Filtration
-- equivariance is the convergence/naturality refinement gap, not an assumed field.
lemma coefficient_spectral_actions {T : Type u} [Ring T] (C : Cpx R) (a : T →+* End C)
    (B : ModuleCat.{u} R) (b : ℤ) (hC : C.IsStrictlyLE b) (t u : T) :
    coefficientSpectralSequence_map (a (t * u)) (𝟙 B) b hC hC =
      coefficientSpectralSequence_map (a u) (𝟙 B) b hC hC ≫
      coefficientSpectralSequence_map (a t) (𝟙 B) b hC hC := by sorry
def coefficient_spectral_page_action {T : Type u} [Ring T] (C : Cpx R)
    (a : T →+* End C) (B : ModuleCat.{u} R) (b : ℤ) (hC : C.IsStrictlyLE b)
    (r : ℤ) (hr : 2 ≤ r) :
    T →+* End ((coefficientSpectralSequence C B b hC).page r hr) := by sorry
lemma coefficient_spectral_page_action_apply {T : Type u} [Ring T] (C : Cpx R)
    (a : T →+* End C) (B : ModuleCat.{u} R) (b : ℤ) (hC : C.IsStrictlyLE b)
    (r : ℤ) (hr : 2 ≤ r) (t : T) :
    coefficient_spectral_page_action C a B b hC r hr t =
      (coefficientSpectralSequence_map (a t) (𝟙 B) b hC hC).hom r hr := by sorry
lemma coefficient_spectral_filtration_action {T : Type u} [Ring T] (C : Cpx R)
    (a : T →+* End C) (B : ModuleCat.{u} R) (b : ℤ) (hC : C.IsStrictlyLE b) (n : ℤ) :
    ∃ F : FiniteFiltration (H n (dtensor (Q C) (dstalk B 0))) (n - b) 0,
      (∀ (p r : ℤ) (hr : 2 ≤ r), max 2 (b - n + 2) ≤ r →
        Nonempty (F.graded p ≅ ((coefficientSpectralSequence C B b hC).page r hr).X (p, n - p))) ∧
      ∀ (t : T) (p : ℤ) (x : H n (dtensor (Q C) (dstalk B 0))), x ∈ F.F p →
        (Hmap n ((derivedTensor.map ((DerivedCategory.Q : Cpx R ⥤ Der R).map
          (a t))).app (dstalk B 0))).hom x ∈ F.F p := by sorry
lemma coefficient_spectral_action_naturality {T : Type u} [Ring T] {C D : Cpx R}
    (a : T →+* End C) (a' : T →+* End D) (f : C ⟶ D)
    (hf : ∀ t, a t ≫ f = f ≫ a' t) (B : ModuleCat.{u} R)
    (b : ℤ) (hC : C.IsStrictlyLE b) (hD : D.IsStrictlyLE b) (t : T) :
    coefficientSpectralSequence_map (a t) (𝟙 B) b hC hC ≫
      coefficientSpectralSequence_map f (𝟙 B) b hC hD =
        coefficientSpectralSequence_map f (𝟙 B) b hC hD ≫
          coefficientSpectralSequence_map (a' t) (𝟙 B) b hD hD := by sorry
lemma coefficient_spectral_graded_equivariance {T : Type u} [Ring T] (C : Cpx R)
    (a : T →+* End C) (B : ModuleCat.{u} R) (b : ℤ) (hC : C.IsStrictlyLE b) (n : ℤ) :
    let action := fun t : T => Hmap n
      ((derivedTensor.map ((DerivedCategory.Q : Cpx R ⥤ Der R).map (a t))).app
        (dstalk B 0))
    ∃ (F : FiniteFiltration (H n (dtensor (Q C) (dstalk B 0))) (n - b) 0)
      (hstable : ∀ (t : T) (p : ℤ) (x : H n (dtensor (Q C) (dstalk B 0))),
        x ∈ F.F p → (action t).hom x ∈ F.F p),
      ∀ (p r : ℤ) (hr : 2 ≤ r), max 2 (b - n + 2) ≤ r →
        ∃ e : F.graded p ≅ ((coefficientSpectralSequence C B b hC).page r hr).X (p, n - p),
          ∀ t : T, F.gradedMap (action t) (hstable t) p ≫ e.hom =
            e.hom ≫ (coefficient_spectral_page_action C a B b hC r hr t).f (p, n - p) := by sorry
section GroupCoefficients
variable {G : Type u} [Group G] [Fintype G] (V : ModuleCat.{u} R)
variable (ρ : Representation R G V) (K : Subgroup G) [Fintype K]
lemma projective_group_invariants_norm
    [Module.Finite (MonoidAlgebra R G) ρ.asModule]
    [Module.Projective (MonoidAlgebra R G) ρ.asModule] :
    (Representation.invariants (ρ.comp K.subtype)) = LinearMap.range (∑ h : K, ρ h.val) := by sorry
lemma projective_group_coset_trace
    [Module.Finite (MonoidAlgebra R G) ρ.asModule]
    [Module.Projective (MonoidAlgebra R G) ρ.asModule]
    [Fintype (G ⧸ K)] (r : G ⧸ K → G)
    (hr : ∀ c, QuotientGroup.mk (r c) = c) :
    (∀ y : ρ.invariants, ∃ x : (Representation.invariants (ρ.comp K.subtype)),
      ∑ c, ρ (r c) x.val = y.val) ∧
    (∀ (r' : G ⧸ K → G), (∀ c, QuotientGroup.mk (r' c) = c) →
      ∀ x : (Representation.invariants (ρ.comp K.subtype)), ∑ c, ρ (r c) x.val = ∑ c, ρ (r' c) x.val) := by sorry
-- Scalar extension of a representation is the native tensor scalar extension
-- on its underlying module and group operators, specified by this actual data.
 def coefficientRepresentation [Algebra R S] (σ : Representation R G V) :
    Representation S G (S ⊗[R] V) := by sorry
lemma coefficientRepresentation_apply [Algebra R S] (g : G) (s : S) (v : V) :
    coefficientRepresentation V ρ g (s ⊗ₜ[R] v) = s ⊗ₜ[R] ρ g v := by sorry
 def projective_group_invariants_basechange [Algebra R S]
    [Module.Finite (MonoidAlgebra R G) ρ.asModule]
    [Module.Projective (MonoidAlgebra R G) ρ.asModule] :
    (S ⊗[R] (Representation.invariants (ρ.comp K.subtype))) ≃ₗ[S]
      (Representation.invariants ((coefficientRepresentation (S := S) V ρ).comp K.subtype)) := by sorry
 def coinvariant_dual_invariant :
    Module.Dual R (Representation.Coinvariants (ρ.comp K.subtype)) ≃ₗ[R]
      (Representation.invariants (Representation.dual (ρ.comp K.subtype))) := by sorry
 def projective_dual_coinvariant
    [Module.Finite (MonoidAlgebra R G) ρ.asModule]
    [Module.Projective (MonoidAlgebra R G) ρ.asModule] :
    Representation.Coinvariants (Representation.dual (ρ.comp K.subtype)) ≃ₗ[R]
      Module.Dual R ((Representation.invariants (ρ.comp K.subtype))) := by sorry
end GroupCoefficients
-- TAU_NATIVE_TAIL: the following signatures use Tau's linear Hom complex.
 def hom_projective_comparison (P E : Cpx R) (b : ℤ) [P.IsStrictlyLE b]
    [∀ i, Module.Projective R (P.X i)] :
    dhom (Q P) (Q E) ≅ Q (TauCeti.linearHomComplex R P E) := by sorry
 def perfectDual_model (P : Cpx R) (a b : ℤ) (hb : Bounds P a b) (hp : FiniteProjective P) :
    perfectDual (Q P) ≅ Q (TauCeti.linearHomComplex R P (stalk (ModuleCat.of R R) 0)) := by sorry
 def chainDual_native (P : Cpx R) :
    chainDual P ≅ TauCeti.linearHomComplex R P (stalk (ModuleCat.of R R) 0) := by sorry
 def chain_tensor_hom (P E : Cpx R) (a b : ℤ) (hb : Bounds P a b) (hp : FiniteProjective P) :
    E ⊗ TauCeti.linearHomComplex R P (stalk (ModuleCat.of R R) 0) ≅
      TauCeti.linearHomComplex R P E := by sorry
-- The precise degree-n evaluation is (-1)^n times module evaluation;
-- its component formula is a required chain-bidual-sign acceptance check.
-- The tensor braid is the pinned TauCeti.koszulBraiding, not a new symmetry.
end TauCeti.DerivedCoefficient
