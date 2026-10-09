/-
Suggested Lean forms for BP-SchemeAndStackFoundations--SF.4, layer SF.4 "Deformations, models and
birational geometry" of the roadmap "Scheme, stack, cohomology and intersection foundations".

This file is not the roadmap and is not exhaustive: the roadmap document
(research/blueprint/readmes/SchemeAndStackFoundations--SF.4.md) is definitive. The statements below
suggest Lean forms so that contributors and reviewers converge on names and signatures. Every proof is
`sorry`; nothing here is an implementation claim.

Conventions of this prototype.
* Schemes, morphism properties, ideal sheaves, subschemes and modules are Mathlib's
  (`AlgebraicGeometry.Scheme`, `IsClosedImmersion`, `Scheme.IdealSheafData`, `Scheme.Modules`).
* A formal scheme is prototyped by its system of thickenings `X 0 → X 1 → ⋯` (Stacks 0AIF);
  these are auxiliary `AdicSystem`s, with only level-preserving maps. General continuous
  maps require reindexing, and the topologically locally ringed-space comparison is an open gap.
  Mathlib has no
  sheaves of topological rings on spaces.
* Objects that need Tau Ceti StableReduction Layers 1–4 (nodal and stable families, blowups) or
  algebraic stacks (SchemeAndStackFoundations SF.1) are not typed here; their declarations are listed in
  comment blocks under the names the packet gives them, and no `Prop`-valued placeholder is used.
-/
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.AlgebraicGeometry.Morphisms.FormallyUnramified
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.AlgebraicGeometry.IdealSheaf.Subscheme
import Mathlib.AlgebraicGeometry.IdealSheaf.Functorial
import Mathlib.AlgebraicGeometry.Birational.Birational
import Mathlib.AlgebraicGeometry.FunctionField
import Mathlib.AlgebraicGeometry.Normalization
import Mathlib.AlgebraicGeometry.AffineSpace
import Mathlib.AlgebraicGeometry.ZariskisMainTheorem
import Mathlib.AlgebraicGeometry.Modules.Sheaf
import Mathlib.Algebra.Category.ModuleCat.Sheaf.Quasicoherent
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.RingTheory.Grassmannian
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.Smooth.Basic
import Mathlib.RingTheory.Etale.Basic
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.Algebra.Category.CommAlgCat.Basic
import Mathlib.Algebra.DualNumber
import Mathlib.CategoryTheory.Comma.Over.Basic
import Mathlib.FieldTheory.Separable
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.NumberTheory.Zsqrtd.GaussianInt
import Mathlib.AlgebraicGeometry.Limits
import Mathlib.RingTheory.Ideal.Height
import Mathlib.RingTheory.Ideal.Cotangent
import Mathlib.RingTheory.MvPowerSeries.Inverse
import Mathlib.Topology.KrullDimension
import Mathlib.Algebra.Module.SpanRank
import TauCeti.AlgebraicGeometry.Curves.StableReduction.Model.Basic
import TauCeti.AlgebraicGeometry.Fibers
import TauCeti.RingTheory.Derivation.DualNumber

noncomputable section

open _root_.CategoryTheory _root_.CategoryTheory.Limits

universe u

namespace AlgebraicGeometry

/-! ## SF.4a  Thickenings and formal smoothness of morphisms -/

/-- A thickening: a closed immersion that is surjective on points (Stacks 04EX). -/
class IsThickening {Z X : Scheme.{u}} (i : Z ⟶ X) : Prop extends IsClosedImmersion i, Surjective i

/-- A first-order thickening: a closed immersion whose ideal sheaf squares to zero (Stacks 04EX). -/
class IsFirstOrderThickening {Z X : Scheme.{u}} (i : Z ⟶ X) : Prop extends IsClosedImmersion i where
  ker_mul_self : i.ker * i.ker = ⊥

theorem IsFirstOrderThickening.isThickening {Z X : Scheme.{u}} (i : Z ⟶ X)
    [IsFirstOrderThickening i] : IsThickening i := by
  sorry

theorem isFirstOrderThickening_specMap_iff {B : CommRingCat.{u}} (J : Ideal B) :
    IsFirstOrderThickening (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk J))) ↔ J * J = ⊥ := by
  sorry

theorem IsFirstOrderThickening.pullback {Z X Y : Scheme.{u}} (i : Z ⟶ X) [IsFirstOrderThickening i]
    (g : Y ⟶ X) : IsFirstOrderThickening (pullback.snd i g) := by
  sorry

/-- The underlying homeomorphism of a thickening. -/
def IsThickening.homeomorph {Z X : Scheme.{u}} (i : Z ⟶ X) [IsThickening i] : Z ≃ₜ X :=
  sorry

/-- A thickening of order `n + 2` factors through a first-order thickening of a thickening of order
`n + 1` (the reduction to square-zero ideals). -/
theorem IsThickening.factor_firstOrder {Z X : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (n : ℕ)
    (h : i.ker ^ (n + 2) = ⊥) :
    ∃ (Z' : Scheme.{u}) (a : Z ⟶ Z') (b : Z' ⟶ X), a ≫ b = i ∧ IsClosedImmersion a ∧
      a.ker ^ (n + 1) = ⊥ ∧ IsFirstOrderThickening b := by
  sorry

-- AlgebraicGeometry.isFirstOrderThickening_dualNumber
example (k : Type u) [Field k] (B : CommRingCat.{u}) (e : B ≅ CommRingCat.of (DualNumber k))
    (J : Ideal B) (hJ : J = Ideal.span {e.inv DualNumber.eps}) :
    IsFirstOrderThickening (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk J))) := by
  sorry

-- AlgebraicGeometry.isFirstOrderThickening_id
example (X : Scheme.{u}) : IsFirstOrderThickening (𝟙 X) := by
  sorry

-- AlgebraicGeometry.not_isFirstOrderThickening_cube
example (k : Type u) [Field k] (B : CommRingCat.{u})
    (e : B ≅ CommRingCat.of (Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k) ^ 3}))
    (J : Ideal B) (hJ : J = Ideal.span {e.inv (Ideal.Quotient.mk _ Polynomial.X)}) :
    IsThickening (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk J))) ∧
      ¬ IsFirstOrderThickening (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk J))) := by
  sorry

-- AlgebraicGeometry.not_isThickening_origin
example (k : Type u) [Field k] :
    ¬ IsThickening (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk
      (Ideal.span {(Polynomial.X : Polynomial k)})))) := by
  sorry

/- Test AlgebraicGeometry.thickening_nil_not_nilpotent: the nil ideal in
   k[x_i : i ≥ 1]/(x_i^(i+2) : i ≥ 1) defines a thickening with no local
   uniform nilpotence exponent. This tests the general, non-Noetherian definition. -/

/-- Formally smooth morphisms: extensions exist along affine first-order thickenings over the
base (Stacks 02H0). -/
class FormallySmooth {X S : Scheme.{u}} (f : X ⟶ S) : Prop where
  exists_lift : ∀ {T T' : Scheme.{u}} [IsAffine T'] (i : T ⟶ T') [IsFirstOrderThickening i]
    (g : T ⟶ X) (h : T' ⟶ S), g ≫ f = i ≫ h → ∃ l : T' ⟶ X, i ≫ l = g ∧ l ≫ f = h

/-- Formally étale morphisms: unique extensions along affine first-order thickenings (Stacks 02HG). -/
class FormallyEtale {X S : Scheme.{u}} (f : X ⟶ S) : Prop where
  existsUnique_lift : ∀ {T T' : Scheme.{u}} [IsAffine T'] (i : T ⟶ T') [IsFirstOrderThickening i]
    (g : T ⟶ X) (h : T' ⟶ S), g ≫ f = i ≫ h → ∃! l : T' ⟶ X, i ≫ l = g ∧ l ≫ f = h

theorem FormallySmooth.exists_lift' {X S : Scheme.{u}} (f : X ⟶ S) [FormallySmooth f]
    {T T' : Scheme.{u}} [IsAffine T'] (i : T ⟶ T') [IsFirstOrderThickening i]
    (g : T ⟶ X) (h : T' ⟶ S) (w : g ≫ f = i ≫ h) : ∃ l : T' ⟶ X, i ≫ l = g ∧ l ≫ f = h :=
  FormallySmooth.exists_lift i g h w

theorem formallySmooth_specMap_iff {R S : CommRingCat.{u}} (φ : R ⟶ S) :
    FormallySmooth (Spec.map φ) ↔ φ.hom.FormallySmooth := by
  sorry

theorem FormallySmooth.iff_affineLocally {X S : Scheme.{u}} (f : X ⟶ S) :
    FormallySmooth f ↔ ∀ (V : S.affineOpens) (U : X.affineOpens) (e : (U : X.Opens) ≤ f ⁻¹ᵁ V),
      (f.appLE V U e).hom.FormallySmooth := by
  sorry

instance FormallySmooth.comp {X Y Z : Scheme.{u}} (f : X ⟶ Y) (g : Y ⟶ Z) [FormallySmooth f]
    [FormallySmooth g] : FormallySmooth (f ≫ g) := by
  sorry

instance FormallySmooth.pullback {X Y S : Scheme.{u}} (f : X ⟶ S) (g : Y ⟶ S) [FormallySmooth g] :
    FormallySmooth (pullback.fst f g) := by
  sorry

instance FormallyEtale.of_isOpenImmersion {X S : Scheme.{u}} (f : X ⟶ S) [IsOpenImmersion f] :
    FormallyEtale f := by
  sorry

-- AlgebraicGeometry.formallySmooth_affineSpace
example (S : Scheme.{u}) (n : Type u) : FormallySmooth (𝔸(n; S) ↘ S) := by
  sorry

-- AlgebraicGeometry.formallyEtale_id
example (X : Scheme.{u}) : FormallyEtale (𝟙 X) := by
  sorry

-- AlgebraicGeometry.not_formallySmooth_closedPoint
example (k : Type u) [Field k] :
    ¬ FormallySmooth (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk
      (Ideal.span {(Polynomial.X : Polynomial k)})))) := by
  sorry

-- AlgebraicGeometry.formallyUnramified_iff_mathlib
example {X S : Scheme.{u}} (f : X ⟶ S) :
    FormallyEtale f ↔ FormallySmooth f ∧ AlgebraicGeometry.FormallyUnramified f := by
  sorry

/-- Infinitesimal lifting criterion (Stacks 02H6, 02HM). -/
theorem smooth_iff_formallySmooth {X S : Scheme.{u}} (f : X ⟶ S) [LocallyOfFinitePresentation f] :
    Smooth f ↔ FormallySmooth f := by
  sorry

theorem etale_iff_formallyEtale {X S : Scheme.{u}} (f : X ⟶ S) [LocallyOfFinitePresentation f] :
    Etale f ↔ FormallyEtale f := by
  sorry

/-- Torsor of lifts, affine part: a smooth morphism admits lifts along affine first-order
thickenings, and an étale one admits unique lifts. The sheaf-level torsor under
`Hom(a^*Ω_{X/S}, I)` and its class in `H¹` need the sheaf of differentials of Tau Ceti
StableReduction Layer 1 and are not typed here. -/
theorem Smooth.exists_lift {X S : Scheme.{u}} (f : X ⟶ S) [Smooth f]
    {T T' : Scheme.{u}} [IsAffine T'] (i : T ⟶ T') [IsFirstOrderThickening i]
    (g : T ⟶ X) (h : T' ⟶ S) (w : g ≫ f = i ≫ h) : ∃ l : T' ⟶ X, i ≫ l = g ∧ l ≫ f = h := by
  sorry

theorem Etale.existsUnique_lift {X S : Scheme.{u}} (f : X ⟶ S) [Etale f]
    {T T' : Scheme.{u}} [IsAffine T'] (i : T ⟶ T') [IsFirstOrderThickening i]
    (g : T ⟶ X) (h : T' ⟶ S) (w : g ≫ f = i ≫ h) : ∃! l : T' ⟶ X, i ≫ l = g ∧ l ≫ f = h := by
  sorry

end AlgebraicGeometry

/-! ## SF.4a  Formal deformation theory -/

namespace Deformation

variable (Λ : Type u) [CommRing Λ] (k : Type u) [Field k] [Algebra Λ k]

/-- Objects of `C_Λ`: Artinian local Λ-algebras `A` with a surjective augmentation `A → k`
(equivalently an identification of the residue field with `k`), Stacks 06GC. -/
def IsArtinLocalAug : ObjectProperty (Over (CommAlgCat.of Λ k)) := fun A =>
  IsArtinianRing A.left ∧ IsLocalRing A.left ∧ Function.Surjective A.hom.hom

/-- The category `C_Λ`; morphisms are Λ-algebra maps over `k`, automatically local. -/
abbrev ArtinLocalAlg := (IsArtinLocalAug Λ k).FullSubcategory

variable {Λ k}

instance (A : ArtinLocalAlg Λ k) : IsArtinianRing A.obj.left := A.property.1

instance (A : ArtinLocalAlg Λ k) : IsLocalRing A.obj.left := A.property.2.1

/-- The underlying algebra map of a morphism of `C_Λ`. -/
abbrev ArtinLocalAlg.toAlgHom {A B : ArtinLocalAlg Λ k} (f : A ⟶ B) :
    A.obj.left →ₐ[Λ] B.obj.left :=
  f.hom.left.hom

/-- `k` itself, terminal in `C_Λ`. -/
def ArtinLocalAlg.residue : ArtinLocalAlg Λ k :=
  ⟨Over.mk (𝟙 (CommAlgCat.of Λ k)), sorry⟩

/-- The augmentation as the morphism to the terminal object. -/
def ArtinLocalAlg.toResidue (A : ArtinLocalAlg Λ k) : A ⟶ ArtinLocalAlg.residue :=
  sorry

/-- The dual numbers `k[ε]` with augmentation `ε ↦ 0`. -/
def ArtinLocalAlg.dualNumbers : ArtinLocalAlg Λ k :=
  sorry

/-- Small extensions (Stacks 06GD): surjective with nonzero principal kernel killed by the maximal
ideal. -/
def IsSmallExtension {A' A : ArtinLocalAlg Λ k} (f : A' ⟶ A) : Prop :=
  Function.Surjective (ArtinLocalAlg.toAlgHom f) ∧
    ∃ t : A'.obj.left, t ≠ 0 ∧ RingHom.ker (ArtinLocalAlg.toAlgHom f).toRingHom = Ideal.span {t} ∧
      ∀ m ∈ IsLocalRing.maximalIdeal A'.obj.left, m * t = 0

theorem IsSmallExtension.surjective {A' A : ArtinLocalAlg Λ k} {f : A' ⟶ A}
    (h : IsSmallExtension f) : Function.Surjective (ArtinLocalAlg.toAlgHom f) :=
  h.1

/-- Fibre products along a surjection stay in `C_Λ` (Stacks 06GH). -/
def ArtinLocalAlg.pullback {A₁ A₂ A : ArtinLocalAlg Λ k} (f₁ : A₁ ⟶ A) (f₂ : A₂ ⟶ A)
    (hf₂ : Function.Surjective (ArtinLocalAlg.toAlgHom f₂)) : ArtinLocalAlg Λ k :=
  sorry

def ArtinLocalAlg.pullbackFst {A₁ A₂ A : ArtinLocalAlg Λ k} (f₁ : A₁ ⟶ A) (f₂ : A₂ ⟶ A)
    (hf₂ : Function.Surjective (ArtinLocalAlg.toAlgHom f₂)) :
    ArtinLocalAlg.pullback f₁ f₂ hf₂ ⟶ A₁ :=
  sorry

def ArtinLocalAlg.pullbackSnd {A₁ A₂ A : ArtinLocalAlg Λ k} (f₁ : A₁ ⟶ A) (f₂ : A₂ ⟶ A)
    (hf₂ : Function.Surjective (ArtinLocalAlg.toAlgHom f₂)) :
    ArtinLocalAlg.pullback f₁ f₂ hf₂ ⟶ A₂ :=
  sorry

theorem ArtinLocalAlg.isPullback {A₁ A₂ A : ArtinLocalAlg Λ k} (f₁ : A₁ ⟶ A) (f₂ : A₂ ⟶ A)
    (hf₂ : Function.Surjective (ArtinLocalAlg.toAlgHom f₂)) :
    IsPullback (ArtinLocalAlg.pullbackFst f₁ f₂ hf₂) (ArtinLocalAlg.pullbackSnd f₁ f₂ hf₂)
      f₁ f₂ := by
  sorry

theorem ArtinLocalAlg.toResidue_surjective (A : ArtinLocalAlg Λ k) :
    Function.Surjective (ArtinLocalAlg.toAlgHom A.toResidue) := by
  sorry

/-- The addition map `k[ε] ×_k k[ε] → k[ε]`, `(a + bε₁, a + cε₂) ↦ a + (b + c)ε`. -/
def ArtinLocalAlg.dualAdd :
    ArtinLocalAlg.pullback (ArtinLocalAlg.toResidue (Λ := Λ) (k := k) ArtinLocalAlg.dualNumbers)
      (ArtinLocalAlg.toResidue ArtinLocalAlg.dualNumbers)
      (ArtinLocalAlg.toResidue_surjective _) ⟶ ArtinLocalAlg.dualNumbers :=
  sorry

/-- Every surjection in `C_Λ` is a finite composite of small extensions (Stacks 06GE). -/
theorem factor_smallExtensions {A' A : ArtinLocalAlg Λ k} (f : A' ⟶ A)
    (hf : Function.Surjective (ArtinLocalAlg.toAlgHom f)) :
    ∃ (n : ℕ) (B : Fin (n + 1) → ArtinLocalAlg Λ k) (g : ∀ i : Fin n, B i.castSucc ⟶ B i.succ),
      (∀ i, IsSmallExtension (g i)) ∧ Nonempty (B 0 ≅ A') ∧ Nonempty (B (Fin.last n) ≅ A) := by
  sorry

/-- Complete Noetherian local Λ-algebras with residue field `k` (the category `Ĉ_Λ`, Stacks 06GW),
bundled with their augmentation. -/
structure CompleteLocalAlg (Λ : Type u) [CommRing Λ] (k : Type u) [Field k] [Algebra Λ k] where
  R : Type u
  [commRing : CommRing R]
  [algebra : Algebra Λ R]
  [isLocalRing : IsLocalRing R]
  [isNoetherianRing : IsNoetherianRing R]
  [complete : IsAdicComplete (IsLocalRing.maximalIdeal R) R]
  ρ : R →ₐ[Λ] k
  ρ_surjective : Function.Surjective ρ

attribute [instance] CompleteLocalAlg.commRing CompleteLocalAlg.algebra
  CompleteLocalAlg.isLocalRing CompleteLocalAlg.isNoetherianRing CompleteLocalAlg.complete

/-- An object of `Ĉ_Λ` is the limit of its Artinian quotients `R/m^n` (Stacks 06GW). -/
theorem CompleteLocalAlg.toPro (R : CompleteLocalAlg Λ k) :
    Function.Bijective (AdicCompletion.of (IsLocalRing.maximalIdeal R.R) R.R) := by
  sorry

-- Deformation.zmod_prime_pow_mem: Z/p^(n+1) is Artinian local (an object of C_{Z_p}).
example (p : ℕ) [Fact p.Prime] (n : ℕ) : IsArtinianRing (ZMod (p ^ (n + 1))) ∧
    IsLocalRing (ZMod (p ^ (n + 1))) := by
  sorry

-- Deformation.residue_terminal
example (A : ArtinLocalAlg Λ k) : Subsingleton (A ⟶ ArtinLocalAlg.residue) := by
  sorry

-- Deformation.not_mem_padicInt
example (p : ℕ) [Fact p.Prime] : ¬ IsArtinianRing ℤ_[p] := by
  sorry

-- Deformation.dualNumber_pullback: `k[ε] ×_k k[ε]` has a two-dimensional cotangent space.
example : Module.finrank
    (IsLocalRing.ResidueField (ArtinLocalAlg.pullback (Λ := Λ) (k := k)
      (ArtinLocalAlg.toResidue ArtinLocalAlg.dualNumbers)
      (ArtinLocalAlg.toResidue ArtinLocalAlg.dualNumbers)
      (ArtinLocalAlg.toResidue_surjective _)).obj.left)
    (IsLocalRing.CotangentSpace (ArtinLocalAlg.pullback (Λ := Λ) (k := k)
      (ArtinLocalAlg.toResidue ArtinLocalAlg.dualNumbers)
      (ArtinLocalAlg.toResidue ArtinLocalAlg.dualNumbers)
      (ArtinLocalAlg.toResidue_surjective _)).obj.left) = 2 := by
  sorry

/-- A predeformation functor: `F(k)` is a point (Stacks 06GS for functors). -/
structure PredeformationFunctor (Λ : Type u) [CommRing Λ] (k : Type u) [Field k] [Algebra Λ k] where
  F : ArtinLocalAlg Λ k ⥤ Type u
  unique : Unique (F.obj ArtinLocalAlg.residue)

namespace PredeformationFunctor

variable (D : PredeformationFunctor Λ k)

/-- The comparison map θ for a fibre product along a surjection. -/
def θ {A₁ A₂ A : ArtinLocalAlg Λ k} (f₁ : A₁ ⟶ A) (f₂ : A₂ ⟶ A)
    (hf₂ : Function.Surjective (ArtinLocalAlg.toAlgHom f₂)) :
    D.F.obj (ArtinLocalAlg.pullback f₁ f₂ hf₂) → {p : D.F.obj A₁ × D.F.obj A₂ //
      D.F.map f₁ p.1 = D.F.map f₂ p.2} :=
  fun x => ⟨(D.F.map (ArtinLocalAlg.pullbackFst f₁ f₂ hf₂) x,
    D.F.map (ArtinLocalAlg.pullbackSnd f₁ f₂ hf₂) x), sorry⟩

/-- Schlessinger's (H1). -/
def H1 : Prop :=
  ∀ {A₁ A₂ A : ArtinLocalAlg Λ k} (f₁ : A₁ ⟶ A) (f₂ : A₂ ⟶ A) (hs : IsSmallExtension f₂),
    Function.Surjective (D.θ f₁ f₂ hs.surjective)

/-- Schlessinger's (H2): bijectivity for `A = k`, `A₂ = k[ε]`. -/
def H2 : Prop :=
  ∀ {A₁ : ArtinLocalAlg Λ k} (f₁ : A₁ ⟶ ArtinLocalAlg.residue),
    Function.Bijective (D.θ f₁ (ArtinLocalAlg.toResidue ArtinLocalAlg.dualNumbers)
      (ArtinLocalAlg.toResidue_surjective _))

/-- Schlessinger's (H4): bijectivity along a small extension `A' → A` with `A₁ = A₂ = A'`. -/
def H4 : Prop :=
  ∀ {A' A : ArtinLocalAlg Λ k} (f : A' ⟶ A) (hs : IsSmallExtension f),
    Function.Bijective (D.θ f f hs.surjective)

/-- The tangent space `F(k[ε])`. -/
abbrev tangentSpace : Type u := D.F.obj ArtinLocalAlg.dualNumbers

/-- Under (H2) the tangent space is an abelian group (Stacks 06IH). -/
abbrev tangentSpace.addCommGroup (h : D.H2) : AddCommGroup D.tangentSpace :=
  sorry

/-- Under (H2) the tangent space is a `k`-vector space (Stacks 06IH). -/
abbrev tangentSpace.module (h : D.H2) :
    letI := tangentSpace.addCommGroup D h
    Module k D.tangentSpace :=
  sorry

/-- Schlessinger's (H3): finite-dimensional tangent space. -/
def H3 (h : D.H2) : Prop :=
  letI := tangentSpace.addCommGroup D h
  letI := tangentSpace.module D h
  FiniteDimensional k D.tangentSpace

/-- The sum of tangent vectors is computed by the addition map `k[ε] ×_k k[ε] → k[ε]`. -/
theorem tangentSpace.add_def (h : D.H2) (v w : D.tangentSpace)
    (x : D.F.obj (ArtinLocalAlg.pullback (ArtinLocalAlg.toResidue ArtinLocalAlg.dualNumbers)
      (ArtinLocalAlg.toResidue ArtinLocalAlg.dualNumbers) (ArtinLocalAlg.toResidue_surjective _)))
    (hx : (D.θ _ _ _ x).1 = (v, w)) :
    letI := tangentSpace.addCommGroup D h
    v + w = D.F.map ArtinLocalAlg.dualAdd x := by
  sorry

/-- Lifts along a small extension, when they exist, form a torsor under the tangent space
(Stacks 06JI, kernel one-dimensional). -/
theorem lifts_torsor (h2 : D.H2) (h4 : D.H4) {A' A : ArtinLocalAlg Λ k} (f : A' ⟶ A)
    (hs : IsSmallExtension f) (ξ : D.F.obj A) :
    letI := tangentSpace.addCommGroup D h2
    ∃ act : D.tangentSpace → {x // D.F.map f x = ξ} → {x // D.F.map f x = ξ},
      ∀ x y : {x // D.F.map f x = ξ}, ∃! v, act v x = y := by
  sorry

/-- Functoriality of tangent spaces. -/
def map (D' : PredeformationFunctor Λ k) (η : D.F ⟶ D'.F) : D.tangentSpace → D'.tangentSpace :=
  η.app _

end PredeformationFunctor

/-- The prorepresented functor `h_R = Hom_Λ(R, -)` restricted to `C_Λ`. -/
def prorep (R : CompleteLocalAlg Λ k) : PredeformationFunctor Λ k :=
  sorry

/-- Smooth morphisms of functors (Stacks 06HG). -/
def IsSmoothMorphism {D D' : PredeformationFunctor Λ k} (η : D.F ⟶ D'.F) : Prop :=
  ∀ {A' A : ArtinLocalAlg Λ k} (f : A' ⟶ A), Function.Surjective (ArtinLocalAlg.toAlgHom f) →
    ∀ (x : D.F.obj A) (y : D'.F.obj A'), D'.F.map f y = η.app A x →
      ∃ z : D.F.obj A', D.F.map f z = x ∧ η.app A' z = y

/-- A formal element of `D` over `R`: a natural transformation `h_R → F` (Stacks 06H3). -/
abbrev FormalElement (D : PredeformationFunctor Λ k) (R : CompleteLocalAlg Λ k) :=
  (prorep R).F ⟶ D.F

/-- Versal formal elements (Stacks 06HR). -/
def IsVersal {D : PredeformationFunctor Λ k} {R : CompleteLocalAlg Λ k} (ξ : FormalElement D R) :
    Prop :=
  IsSmoothMorphism ξ

/-- Hulls: versal with bijective tangent map. Ring-minimality in Stacks 06T4 is a
different notion without H2; use Schlessinger 06IX/06IY for the classical hull criterion. -/
def IsHull {D : PredeformationFunctor Λ k} {R : CompleteLocalAlg Λ k} (ξ : FormalElement D R) :
    Prop :=
  IsVersal ξ ∧ Function.Bijective (PredeformationFunctor.map (prorep R) D ξ)

/-- Prorepresentable functors (Stacks 06GX). -/
def IsProrepresentable (D : PredeformationFunctor Λ k) : Prop :=
  ∃ (R : CompleteLocalAlg Λ k) (ξ : FormalElement D R), IsIso ξ

theorem IsHull.unique {D : PredeformationFunctor Λ k} {R R' : CompleteLocalAlg Λ k}
    (ξ : FormalElement D R) (ξ' : FormalElement D R') (h : IsHull ξ) (h' : IsHull ξ') :
    Nonempty (R.R ≃ₐ[Λ] R'.R) := by
  sorry

theorem IsProrepresentable.isHull {D : PredeformationFunctor Λ k} (h : IsProrepresentable D) :
    ∃ (R : CompleteLocalAlg Λ k) (ξ : FormalElement D R), IsHull ξ := by
  sorry

theorem IsVersal.powerSeries [IsNoetherianRing Λ] [IsLocalRing Λ]
    [IsAdicComplete (IsLocalRing.maximalIdeal Λ) Λ]
    (hres : Function.Surjective (algebraMap Λ k)) {D : PredeformationFunctor Λ k}
    {R : CompleteLocalAlg Λ k} (h1 : D.H1) (h2 : D.H2)
    (ξ : FormalElement D R) (h : IsVersal ξ) :
    ∃ (R₀ : CompleteLocalAlg Λ k) (ξ₀ : FormalElement D R₀) (r : ℕ), IsHull ξ₀ ∧
      Nonempty (R.R ≃ₐ[Λ] MvPowerSeries (Fin r) R₀.R) := by
  sorry

/-- Schlessinger's theorem: hulls (Stacks 06IX, 06IY). -/
theorem schlessinger_hull [IsNoetherianRing Λ] [IsLocalRing Λ]
    [IsAdicComplete (IsLocalRing.maximalIdeal Λ) Λ]
    (hres : Function.Surjective (algebraMap Λ k)) (D : PredeformationFunctor Λ k) :
    (∃ (_ : D.H1) (h2 : D.H2), D.H3 h2) ↔
      ∃ (R : CompleteLocalAlg Λ k) (ξ : FormalElement D R), IsHull ξ := by
  sorry

/-- Schlessinger's theorem: prorepresentability (Stacks 06JM). -/
theorem schlessinger_prorepresentable [IsNoetherianRing Λ] [IsLocalRing Λ]
    [IsAdicComplete (IsLocalRing.maximalIdeal Λ) Λ]
    (hres : Function.Surjective (algebraMap Λ k)) (D : PredeformationFunctor Λ k) :
    (∃ (_ : D.H1) (h2 : D.H2), D.H3 h2 ∧ D.H4) ↔ IsProrepresentable D := by
  sorry

-- Deformation.prorep_tangent_powerSeries
example (R : CompleteLocalAlg Λ k) (n : ℕ) (e : R.R ≃ₐ[Λ] MvPowerSeries (Fin n) Λ) :
    Nonempty ((prorep R).tangentSpace ≃ (Fin n → k)) := by
  sorry

-- Deformation.point_functor: a functor with one-point values satisfies H1 and H4 and has a
-- one-point tangent space.
example (D : PredeformationFunctor Λ k) (h : ∀ A, Subsingleton (D.F.obj A))
    (hne : ∀ A, Nonempty (D.F.obj A)) :
    D.H1 ∧ D.H4 ∧ Subsingleton D.tangentSpace := by
  sorry

-- Deformation.not_H2_quotient: for char k ≠ 2, the quotient of h_{k[[t]]} by t ↦ −t satisfies H1
-- but not H2.
example (h2 : (2 : k) ≠ 0) : ∃ D : PredeformationFunctor Λ k, D.H1 ∧ ¬ D.H2 := by
  sorry

-- Deformation.tangent_eq_derivations: compare Tau Ceti's derivationToDualNumberEquivLift.
example (R : CompleteLocalAlg Λ k) :
    letI := R.ρ.toRingHom.toAlgebra
    Nonempty ((prorep R).tangentSpace ≃ Derivation Λ R.R k) := by
  sorry

-- Deformation.hull_prorep
example (R : CompleteLocalAlg Λ k) : IsHull (𝟙 (prorep R).F) := by
  sorry

-- Deformation.smooth_iff_powerSeries: h_R → h_Λ is smooth iff R is a power series ring over Λ.
example (R Λ' : CompleteLocalAlg Λ k) (eΛ : Λ'.R ≃ₐ[Λ] Λ) (η : (prorep R).F ⟶ (prorep Λ').F) :
    IsSmoothMorphism η ↔ ∃ n : ℕ, Nonempty (R.R ≃ₐ[Λ] MvPowerSeries (Fin n) Λ) := by
  sorry

-- Deformation.versal_not_hull: (k[[t, s]], t ↦ t) is versal but not a hull for h_{k[[t]]}.
example (R R₁ : CompleteLocalAlg Λ k) (e : R.R ≃ₐ[Λ] MvPowerSeries (Fin 2) Λ)
    (e₁ : R₁.R ≃ₐ[Λ] MvPowerSeries (Fin 1) Λ) (ξ : FormalElement (prorep R₁) R)
    (hv : IsVersal ξ) : ¬ IsHull ξ := by
  sorry

-- Deformation.versal_quotient_no_hull: the quotient functor of `not_H2_quotient` has a versal
-- element but no hull.
example (h2 : (2 : k) ≠ 0) : ∃ D : PredeformationFunctor Λ k,
    (∃ (R : CompleteLocalAlg Λ k) (ξ : FormalElement D R), IsVersal ξ) ∧
    ¬ ∃ (R : CompleteLocalAlg Λ k) (ξ : FormalElement D R), IsHull ξ := by
  sorry

/-- Auxiliary lift detector. This is weaker than the packet's obstruction theory:
it lacks tensor-valued classes and naturality for maps of kernels (Stacks 07YG).
It cannot justify the number-of-relations bound. -/
structure LiftDetector (D : PredeformationFunctor Λ k) where
  O : Type u
  [addCommGroup : AddCommGroup O]
  [module : Module k O]
  [finiteDimensional : FiniteDimensional k O]
  ob : ∀ {A' A : ArtinLocalAlg Λ k} (f : A' ⟶ A), IsSmallExtension f → D.F.obj A → O
  lift_iff : ∀ {A' A : ArtinLocalAlg Λ k} (f : A' ⟶ A) (hf : IsSmallExtension f) (ξ : D.F.obj A),
    ob f hf ξ = 0 ↔ ∃ x, D.F.map f x = ξ

attribute [instance] LiftDetector.addCommGroup LiftDetector.module
  LiftDetector.finiteDimensional

theorem LiftDetector.lift_iff' {D : PredeformationFunctor Λ k} (o : LiftDetector D)
    {A' A : ArtinLocalAlg Λ k} (f : A' ⟶ A) (hf : IsSmallExtension f) (ξ : D.F.obj A) :
    o.ob f hf ξ = 0 ↔ ∃ x, D.F.map f x = ξ :=
  o.lift_iff f hf ξ

/-- An unobstructed functor has the zero obstruction theory. -/
def LiftDetector.zero (D : PredeformationFunctor Λ k)
    (h : ∀ {A' A : ArtinLocalAlg Λ k} (f : A' ⟶ A), IsSmallExtension f →
      Function.Surjective (D.F.map f)) : LiftDetector D :=
  sorry

/- A hull `Λ[[t₁..t_d]]/J` with `d = dim T_F` has at most `dim O` minimal relations. -/
/- Deformation.ObstructionTheory.relations_le is deferred. A genuine natural
   O ⊗ I obstruction theory and a minimal hull presentation with d = dim T_F are required;
   the former typed formula allowed J=(t) presenting h_Λ with O=0. -/

/-- Obstruction theories pull back along smooth morphisms. -/
def LiftDetector.map {D D' : PredeformationFunctor Λ k} (η : D.F ⟶ D'.F)
    (hη : IsSmoothMorphism η) (o : LiftDetector D') : LiftDetector D :=
  sorry

-- Deformation.obstruction_powerSeries
example (R : CompleteLocalAlg Λ k) (n : ℕ) (e : R.R ≃ₐ[Λ] MvPowerSeries (Fin n) Λ) :
    ∃ o : LiftDetector (prorep R), Module.finrank k o.O = 0 := by
  sorry

-- Deformation.obstruction_hypersurface: h_{Λ[[t]]/(t²)} has a nonzero obstruction space.
example (R : CompleteLocalAlg Λ k)
    (e : R.R ≃ₐ[Λ] PowerSeries Λ ⧸ Ideal.span {(PowerSeries.X : PowerSeries Λ) ^ 2})
    (o : LiftDetector (prorep R)) : 0 < Module.finrank k o.O := by
  sorry

-- Deformation.not_unobstructed_hypersurface: h_{k[[x,y]]/(xy)} is not unobstructed.
example (R : CompleteLocalAlg Λ k)
    (e : R.R ≃ₐ[Λ] MvPowerSeries (Fin 2) Λ ⧸
      Ideal.span {(MvPowerSeries.X 0 * MvPowerSeries.X 1 : MvPowerSeries (Fin 2) Λ)}) :
    ¬ ∀ {A' A : ArtinLocalAlg Λ k} (f : A' ⟶ A), IsSmallExtension f →
      Function.Surjective ((prorep R).F.map f) := by
  sorry

/- Deformation.obstruction_H1_example: for the functor of lifts of a fixed morphism to a smooth
   target, H¹ of Hom(a^*Ω, O) is an obstruction space. It needs sheaf cohomology of O_X-modules
   (SchemeAndStackFoundations SF.2) and is stated in the packet only.

   Theorems of SF.4a recorded in the packet and not typed here (they need Ext groups of O_X-modules
   and the sheaf of differentials of Tau Ceti StableReduction Layer 1):
   * SF.4/algebra-deformation-classes  (Stacks 0GPT, 08S7, 08S5, 08S6, 0D14),
   * SF.4/deformations-of-smooth-schemes (Stacks 0DY7–0ET5, 0DZQ; H¹(T), H²(T), H¹(O), H²(O)),
   * SF.4/node-versal-deformation (hull Λ[[t]], universal family uv = t; DM69 (1.6)). -/

end Deformation

namespace AlgebraicGeometry

/-! ## SF.4b  Formal schemes, completion and algebraization -/

/-- An adic ring with finitely generated ideal of definition, complete and separated. -/
structure AdicRing where
  carrier : Type u
  [commRing : CommRing carrier]
  ideal : Ideal carrier
  fg : ideal.FG
  [complete : IsAdicComplete ideal carrier]

attribute [instance] AdicRing.commRing AdicRing.complete

/-- The level maps `X 0 → X n` of a system of thickenings. -/
def levelMap (X : ℕ → Scheme.{u}) (ι : ∀ n, X n ⟶ X (n + 1)) : ∀ n, X 0 ⟶ X n
  | 0 => 𝟙 _
  | n + 1 => levelMap X ι n ≫ ι n

/-- An auxiliary system with a chosen indexing of thickenings `X 0 ⊂ X 1 ⊂ ⋯` in which `X n` is cut
out in `X (n + 1)` by the `(n + 1)`-st power of the ideal of `X 0` (Stacks 0AIF). The
packet's definition is the topologically locally ringed space `colim X n`. -/
structure AdicSystem where
  X : ℕ → Scheme.{u}
  ι : ∀ n, X n ⟶ X (n + 1)
  isThickening : ∀ n, IsThickening (ι n)
  adic : ∀ n, (ι n).ker = (levelMap X ι (n + 1)).ker ^ (n + 1)

namespace AdicSystem

/-- The reductions `X n`. -/
abbrev reduction (𝔛 : AdicSystem.{u}) (n : ℕ) : Scheme.{u} := 𝔛.X n

/-- Level-preserving morphisms of systems. -/
structure Hom (𝔛 𝔜 : AdicSystem.{u}) where
  app : ∀ n, 𝔛.X n ⟶ 𝔜.X n
  comm : ∀ n, 𝔛.ι n ≫ app (n + 1) = app n ≫ 𝔜.ι n

/-- Adic morphisms: each level is the base change of the next. -/
def IsAdicHom {𝔛 𝔜 : AdicSystem.{u}} (f : Hom 𝔛 𝔜) : Prop :=
  ∀ n, IsPullback (𝔛.ι n) (f.app n) (f.app (n + 1)) (𝔜.ι n)

/-- A scheme as a formal scheme with the zero ideal of definition. -/
def ofScheme (X : Scheme.{u}) : AdicSystem.{u} where
  X _ := X
  ι _ := 𝟙 X
  isThickening _ := sorry
  adic _ := sorry

/-- Locally Noetherian formal schemes. -/
def IsLocallyNoetherian (𝔛 : AdicSystem.{u}) : Prop :=
  ∀ n, AlgebraicGeometry.IsLocallyNoetherian (𝔛.X n)

/-- Fibre products of adic morphisms, computed levelwise. -/
def pullback {𝔛 𝔜 𝔖 : AdicSystem.{u}} (f : Hom 𝔛 𝔖) (g : Hom 𝔜 𝔖) (hf : IsAdicHom f) :
    AdicSystem.{u} :=
  sorry

theorem pullback_X {𝔛 𝔜 𝔖 : AdicSystem.{u}} (f : Hom 𝔛 𝔖) (g : Hom 𝔜 𝔖) (hf : IsAdicHom f)
    (n : ℕ) : Nonempty ((pullback f g hf).X n ≅ Limits.pullback (f.app n) (g.app n)) := by
  sorry

/- AlgebraicGeometry.AdicSystem.adicEquivSystems: in this prototype a formal scheme is given by
   its system of reductions, so adic formal schemes over `SpfSystem A` are by definition compatible
   systems over `A/I^{n+1}`; the comparison with topologically locally ringed spaces needs sheaves of topological rings, which Mathlib does not provide, and is stated in
   the packet. -/

end AdicSystem

/-- `SpfSystem A` as the system `Spec (A/I^{n+1})` (Stacks 0AIF). -/
def SpfSystem (A : AdicRing.{u}) : AdicSystem.{u} where
  X n := Spec (CommRingCat.of (A.carrier ⧸ A.ideal ^ (n + 1)))
  ι n := Spec.map (CommRingCat.ofHom (Ideal.Quotient.factor
    (Ideal.pow_le_pow_right (by omega : n + 1 ≤ n + 2))))
  isThickening _ := sorry
  adic _ := sorry

namespace SpfSystem

/-- Global sections of `SpfSystem A` recover `A`: `A` is the limit of the `A/I^{n+1}`. -/
theorem globalSections (A : AdicRing.{u}) :
    Function.Bijective (AdicCompletion.of A.ideal A.carrier) := by
  sorry

/-- Strict level-preserving maps correspond to maps preserving the chosen ideals.
This auxiliary statement excludes general continuous maps that require reindexing. -/
theorem homEquiv (A B : AdicRing.{u}) :
    Nonempty (AdicSystem.Hom (SpfSystem B) (SpfSystem A) ≃
      {φ : A.carrier →+* B.carrier // A.ideal.map φ ≤ B.ideal}) := by
  sorry

/- AlgebraicGeometry.SpfSystem.basicOpen_sections: Γ(D(f), O_{SpfSystem A}) is the I-adic completion of A_f;
   it needs the structure sheaf of topological rings and is stated in the packet. -/

/-- The closed immersions `Spec (A/I^{n+1}) → SpfSystem A`. -/
abbrev reduction (A : AdicRing.{u}) (n : ℕ) : Scheme.{u} := (SpfSystem A).X n

/-- With the zero ideal of definition, `SpfSystem A` is `Spec A`. -/
theorem ofScheme (A : AdicRing.{u}) (h : A.ideal = ⊥) (n : ℕ) :
    Nonempty ((SpfSystem A).X n ≅ Spec (CommRingCat.of A.carrier)) := by
  sorry

/-- Functoriality in continuous ring maps. -/
def map {A B : AdicRing.{u}} (φ : A.carrier →+* B.carrier) (hφ : A.ideal.map φ ≤ B.ideal) :
    AdicSystem.Hom (SpfSystem B) (SpfSystem A) :=
  sorry

end SpfSystem

-- AlgebraicGeometry.SpfSystem.padicInt_points: SpfSystem Z_p has one point.
example (p : ℕ) [Fact p.Prime] (A : AdicRing.{0}) (e : A.carrier ≃+* ℤ_[p])
    (hI : A.ideal = Ideal.span {e.symm p}) : Subsingleton ((SpfSystem A).X 0) := by
  sorry

-- AlgebraicGeometry.SpfSystem.discrete_eq_spec
example (A : AdicRing.{u}) (h : A.ideal = ⊥) :
    Nonempty ((SpfSystem A).X 0 ≅ Spec (CommRingCat.of A.carrier)) := by
  sorry

-- AlgebraicGeometry.SpfSystem.not_spec_powerSeries: SpfSystem k[[t]] has one point, Spec k[[t]] two.
example (k : Type u) [Field k] (A : AdicRing.{u}) (e : A.carrier ≃+* PowerSeries k)
    (hI : A.ideal = Ideal.span {e.symm PowerSeries.X}) : Subsingleton ((SpfSystem A).X 0) := by
  sorry

example (k : Type u) [Field k] : ¬ Subsingleton (Spec (CommRingCat.of (PowerSeries k))) := by
  sorry

-- AlgebraicGeometry.SpfSystem.homEquiv_padic: the only ring endomorphism of Z_p is the identity.
example (p : ℕ) [Fact p.Prime] (φ : ℤ_[p] →+* ℤ_[p]) : φ = RingHom.id _ := by
  sorry

-- AlgebraicGeometry.AdicSystem.ofScheme_spf
example (A : AdicRing.{u}) (h : A.ideal = ⊥) (n : ℕ) :
    Nonempty ((SpfSystem A).X n ≅ (AdicSystem.ofScheme (Spec (CommRingCat.of A.carrier))).X n) := by
  sorry

-- AlgebraicGeometry.AdicSystem.padic_line: the reductions of the completion of 𝔸¹_{Z_p} along
-- p = 0 are 𝔸¹ over Z/p^{n+1}.
example (p : ℕ) [Fact p.Prime] (n : ℕ) (A : AdicRing.{0})
    (e : A.carrier ≃+* (PowerSeries ℤ_[p])) :
    Nonempty (Spec (CommRingCat.of (Polynomial (ZMod (p ^ (n + 1))))) ≅
      Spec (CommRingCat.of (Polynomial ℤ_[p] ⧸ Ideal.span {(p : Polynomial ℤ_[p]) ^ (n + 1)}))) := by
  sorry

-- AlgebraicGeometry.AdicSystem.not_adic_projection: SpfSystem k[[s,t]] → SpfSystem k[[s]] is not adic,
-- because (s) does not generate an ideal of definition of k[[s,t]].
example (k : Type u) [Field k] :
    Ideal.span {(MvPowerSeries.X 0 : MvPowerSeries (Fin 2) k)} ≠
      Ideal.span {MvPowerSeries.X 0, MvPowerSeries.X 1} := by
  sorry

-- AlgebraicGeometry.AdicSystem.locallyNoetherian_padic
example (A : AdicRing.{u}) [IsNoetherianRing A.carrier] :
    AdicSystem.IsLocallyNoetherian (SpfSystem A) := by
  sorry

/-- The formal completion `X/Z` along the closed subscheme cut out by `I`: the system of
infinitesimal neighbourhoods `V(I^{n+1})` (Stacks 0AIZ, 0AMC, 0GBA). -/
def Scheme.completionSystem (X : Scheme.{u}) (I : X.IdealSheafData) : AdicSystem.{u} where
  X n := (I ^ (n + 1)).subscheme
  ι n := Scheme.IdealSheafData.inclusion (sorry : I ^ (n + 2) ≤ I ^ (n + 1))
  isThickening _ := sorry
  adic _ := sorry

namespace Scheme.completionSystem

/-- The canonical maps from the reductions of `X/Z` to `X`. -/
def toScheme (X : Scheme.{u}) (I : X.IdealSheafData) (n : ℕ) :
    (Scheme.completionSystem X I).X n ⟶ X :=
  (I ^ (n + 1)).subschemeι

/-- Strict level-preserving functoriality under the displayed ideal containment.
Set-theoretic containment of centres only gives a genuine formal map after reindexing. -/
def map {X Y : Scheme.{u}} (f : X ⟶ Y) (I : X.IdealSheafData) (J : Y.IdealSheafData)
    (h : J ≤ I.map f) :
    AdicSystem.Hom (Scheme.completionSystem X I) (Scheme.completionSystem Y J) :=
  sorry

theorem reduction (X : Scheme.{u}) (I : X.IdealSheafData) (n : ℕ) :
    (Scheme.completionSystem X I).X n = (I ^ (n + 1)).subscheme :=
  rfl

/-- Over a locally Noetherian scheme the completion is locally Noetherian (flatness of `X/Z → X`
is recorded in the packet). -/
theorem flat (X : Scheme.{u}) [AlgebraicGeometry.IsLocallyNoetherian X] (I : X.IdealSheafData) :
    AdicSystem.IsLocallyNoetherian (Scheme.completionSystem X I) := by
  sorry

end Scheme.completionSystem

/- AlgebraicGeometry.Scheme.completionSystem_spec: for `X = Spec A` and `I` finitely generated,
   `X/V(I) ≅ SpfSystem Â` (Stacks 0GBA); it needs the ideal sheaf of an ideal on an affine scheme, which
   Mathlib builds only through `IdealSheafData.ofIdeals` with compatibility data; stated in the
   packet. -/

-- AlgebraicGeometry.completionSystem_affineLine_origin: the reductions of the completion of 𝔸¹_k
-- at the origin are Spec k[t]/(t^{n+1}) (the reductions of SpfSystem k[[t]]).
example (k : Type u) [Field k] (n : ℕ) :
    Nonempty (Spec (CommRingCat.of (PowerSeries k ⧸ Ideal.span {(PowerSeries.X : PowerSeries k) ^ (n + 1)})) ≅
      Spec (CommRingCat.of (Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k) ^ (n + 1)}))) := by
  sorry

-- AlgebraicGeometry.completionSystem_self
example (X : Scheme.{u}) (n : ℕ) : Nonempty ((Scheme.completionSystem X ⊥).X n ≅ X) := by
  sorry

-- AlgebraicGeometry.completionSystem_empty
example (X : Scheme.{u}) (n : ℕ) : IsEmpty ((Scheme.completionSystem X ⊤).X n) := by
  sorry

-- AlgebraicGeometry.completionSystem_ne_neighbourhood: k[[t]] is not Artinian.
example (k : Type u) [Field k] : ¬ IsArtinianRing (PowerSeries k) := by
  sorry

/-- Coherent formal modules (Stacks 0EHN): finitely presented modules on the reductions with
compatible restrictions. -/
structure Scheme.CoherentFormalModule (𝔛 : AdicSystem.{u}) where
  F : ∀ n, (𝔛.X n).Modules
  fp : ∀ n, (F n).IsFinitePresentation
  iso : ∀ n, (Scheme.Modules.pullback (𝔛.ι n)).obj (F (n + 1)) ≅ F n

/-- The completion of a finitely presented module (Stacks 0880). -/
def Scheme.completionFunctor (X : Scheme.{u}) (I : X.IdealSheafData)
    (M : X.Modules) (hM : M.IsFinitePresentation) :
    Scheme.CoherentFormalModule (Scheme.completionSystem X I) where
  F n := (Scheme.Modules.pullback (Scheme.completionSystem.toScheme X I n)).obj M
  fp _ := sorry
  iso _ := sorry

/- AlgebraicGeometry.Scheme.completionFunctor_exact (exactness of F ↦ (F/IⁿF)_n as a functor to
   inverse systems, Stacks 0881, via Artin–Rees; it is not levelwise exactness) and
   AlgebraicGeometry.Scheme.coherentFormalModuleEquivSpec (coherent formal modules on SpfSystem Â ≃ finite
   Â-modules, Stacks 087W) need the abelian category of coherent formal modules; stated in the
   packet. -/

/- AlgebraicGeometry.Scheme.coherentFormalModuleEquivFormal (coherent formal modules = coherent
   modules on the formal completion, Stacks 0EKN) and
   AlgebraicGeometry.Scheme.completionFunctor_obj_sections (sections of the completion are the
   completion of sections) need modules on topologically ringed spaces; stated in the packet. -/

-- AlgebraicGeometry.completion_structureSheaf_spec: for a complete Noetherian ring the map to
-- the completion is bijective.
example (A : Type u) [CommRing A] [IsNoetherianRing A] (I : Ideal A) [IsAdicComplete I A] :
    Function.Bijective (AdicCompletion.of I A) := by
  sorry

-- AlgebraicGeometry.completion_zero_ideal
example (A : Type u) [CommRing A] : Function.Bijective (AdicCompletion.of (⊥ : Ideal A) A) := by
  sorry

-- AlgebraicGeometry.completion_not_full_affineLine: k[x] → k[[x]] is not surjective, so
-- multiplication by 1/(1 − x) is not the completion of an endomorphism of O_{𝔸¹}.
example (k : Type u) [Field k] :
    ¬ Function.Surjective (Polynomial.coeToPowerSeries.ringHom : Polynomial k →+* PowerSeries k) := by
  sorry

-- AlgebraicGeometry.completion_torsion
example (p m : ℕ) [Fact p.Prime] :
    Function.Bijective (AdicCompletion.of (Ideal.span {(p : ℤ)}) (ZMod (p ^ m))) := by
  sorry

/- Theorems of SF.4b that need coherent cohomology Hⁱ(X, F) and higher direct images (Tau Ceti's
   `TauCeti.AlgebraicGeometry.Cohomology.Basic` is not compiled in this build, and coherence of
   Rⁱf_* is Tau Ceti StableReduction Layer 2):
   * SF.4/theorem-on-formal-functions  (Stacks 02OC): H^p(X,F)^ ≅ lim_n H^p(X, F/IⁿF);
   * SF.4/stein-factorization (Stacks 03H0, 0AY8);
   * SF.4/effective-formal-deformations-of-curves.
   The existence consequence is typed below; algebraization targets with absent supplier types
   are recorded as precise comments. -/

/-- Grothendieck's existence theorem (Stacks 088C): for `X` proper over a complete Noetherian
ring, every coherent formal module is the completion of a coherent module. -/
theorem grothendieck_existence (A : AdicRing.{u}) [IsNoetherianRing A.carrier] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of A.carrier)) [IsProper f] (I : X.IdealSheafData)
    (hI : I.support = (Set.range (Limits.pullback.fst f (Spec.map (CommRingCat.ofHom
      (Ideal.Quotient.mk A.ideal)))) : Set X))
    (𝓜 : Scheme.CoherentFormalModule (Scheme.completionSystem X I)) :
    ∃ (M : X.Modules) (hM : M.IsFinitePresentation),
      Nonempty (∀ n, (Scheme.completionFunctor X I M hM).F n ≅ 𝓜.F n) := by
  sorry

/- Algebraization of closed formal subschemes (Stacks 0899, 09ZT) is part of
   SF.4/algebraization-of-subschemes-and-morphisms and is stated in the packet. -/

/-- The closed immersion `Spec (A/I^{n+1}) → Spec A`. -/
abbrev quotMap (A : AdicRing.{u}) (n : ℕ) :
    Spec (CommRingCat.of (A.carrier ⧸ A.ideal ^ (n + 1))) ⟶ Spec (CommRingCat.of A.carrier) :=
  Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk (A.ideal ^ (n + 1))))

/- Algebraization of morphisms (Stacks 0A42): compatible maps of reductions of a proper scheme to
a separated finite-type scheme over a complete Noetherian ring come from a unique map. -/
/- AlgebraicGeometry.algebraize_hom (Stacks 0A42): the compatible system of
   maps X_n → Y_n over A/I^(n+1) algebraizes uniquely. Compatibility means that for every n
   the transition X_n → X_(n+1) followed by g_(n+1) equals g_n followed by
   Y_n → Y_(n+1). A family of unrelated maps g_n is insufficient; the coherent
   formal Hom construction has not yet been supplied. -/

/- Grothendieck's algebraization theorem (Stacks 089A): a compatible system of proper schemes over
`A/I^{n+1}` whose first member carries an ample line bundle lifting to all levels is the system of
reductions of a proper `A`-scheme. Ampleness is Tau Ceti StableReduction Layer 2's notion and is
recorded in the packet. The precise hypothesis is retained in the comment below. -/
/- AlgebraicGeometry.grothendieck_algebraization (Stacks 089A): an adic system
   proper over A/I^(n+1) with a compatible system of invertible modules whose first member
   is ample algebraizes to a proper A-scheme. Ampleness is an essential hypothesis,
   supplied by StableReduction Layer 2; the unconditional typed version is removed. -/

/-! ## SF.4c  Modifications, strict transforms, flattening, regularity -/

/-- Modifications: proper morphisms that are isomorphisms over a dense open with dense preimage
(Stacks 0AAZ; de Jong 2.17); source and target are integral. -/
class IsModification {S' S : Scheme.{u}} (f : S' ⟶ S) : Prop where
  integralSource : IsIntegral S'
  integralTarget : IsIntegral S
  isProper : IsProper f
  birational : ∃ U : S.Opens, Dense (U : Set S) ∧ Dense ((f ⁻¹ᵁ U : S'.Opens) : Set S') ∧
    IsIso (f ∣_ U)

attribute [instance] IsModification.integralSource IsModification.integralTarget

theorem IsModification.comp {S'' S' S : Scheme.{u}} (g : S'' ⟶ S') (f : S' ⟶ S)
    [IsModification g] [IsModification f] : IsModification (g ≫ f) := by
  sorry

theorem IsModification.toBirational {S' S : Scheme.{u}} (f : S' ⟶ S) [IsModification f] :
    Scheme.Birational S' S := by
  sorry

/-- The centre: the closed set over which `f` is not an isomorphism. -/
def IsModification.centre {S' S : Scheme.{u}} (f : S' ⟶ S) [IsModification f] : Set S :=
  {s | ∀ U : S.Opens, s ∈ U → ¬ IsIso (f ∣_ U)}

theorem IsModification.isIso_of_isFinite {S' S : Scheme.{u}} (f : S' ⟶ S) [IsIntegral S]
    [IsIntegral S'] [IsModification f] [IsFinite f]
    (hS : ∀ s : S, IsIntegrallyClosed (S.presheaf.stalk s)) : IsIso f := by
  sorry

/-- Alterations: proper dominant morphisms finite over a nonempty open (Stacks 0AB0; de Jong 2.20);
source and target are assumed integral and the target locally Noetherian where used. -/
class IsAlteration {S' S : Scheme.{u}} (f : S' ⟶ S) : Prop where
  isProper : IsProper f
  isDominant : IsDominant f
  generically_finite : ∃ U : S.Opens, (U : Set S).Nonempty ∧ IsFinite (f ∣_ U)

namespace IsAlteration

/-- The induced extension of function fields `K(S) → K(S')`. -/
def functionFieldMap {S' S : Scheme.{u}} (f : S' ⟶ S) [IsIntegral S] [IsIntegral S']
    [IsAlteration f] : S.functionField ⟶ S'.functionField :=
  sorry

/-- The generic degree `[K(S') : K(S)]`. -/
def genericDegree {S' S : Scheme.{u}} (f : S' ⟶ S) [IsIntegral S] [IsIntegral S']
    [IsAlteration f] : ℕ :=
  letI := (functionFieldMap f).hom.toAlgebra
  Module.finrank S.functionField S'.functionField

/-- Generically étale: the function-field extension is separable. -/
def IsGenericallyEtale {S' S : Scheme.{u}} (f : S' ⟶ S) [IsIntegral S] [IsIntegral S']
    [IsAlteration f] : Prop :=
  letI := (functionFieldMap f).hom.toAlgebra
  Algebra.IsSeparable S.functionField S'.functionField

theorem comp {S'' S' S : Scheme.{u}} (g : S'' ⟶ S') (f : S' ⟶ S) [IsAlteration g]
    [IsAlteration f] : IsAlteration (g ≫ f) := by
  sorry

theorem genericDegree_comp {S'' S' S : Scheme.{u}} [IsIntegral S''] [IsIntegral S'] [IsIntegral S]
    (g : S'' ⟶ S') (f : S' ⟶ S) [IsAlteration g] [IsAlteration f] [IsAlteration (g ≫ f)] :
    genericDegree (g ≫ f) = genericDegree g * genericDegree f := by
  sorry

theorem isModification_iff {S' S : Scheme.{u}} (f : S' ⟶ S) [IsIntegral S] [IsIntegral S']
    [IsAlteration f] : IsModification f ↔ genericDegree f = 1 := by
  sorry

/-- de Jong 5.4: finitely many alterations are dominated by a single alteration. -/
theorem exists_dominating {S : Scheme.{u}} [IsIntegral S] [IsNoetherian S]
    {ι : Type} [Finite ι] (T : ι → Scheme.{u}) [∀ i, IsIntegral (T i)]
    (g : ∀ i, T i ⟶ S) [∀ i, IsAlteration (g i)] :
    ∃ (T' : Scheme.{u}) (_ : IsIntegral T') (h : T' ⟶ S) (_ : IsAlteration h),
      ∀ i, ∃ a : T' ⟶ T i, a ≫ g i = h := by
  sorry

end IsAlteration

theorem IsModification.isAlteration {S' S : Scheme.{u}} (f : S' ⟶ S) [IsIntegral S]
    [IsIntegral S'] [IsModification f] : IsAlteration f := by
  sorry

theorem IsModification.functionField_equiv {S' S : Scheme.{u}} (f : S' ⟶ S) [IsIntegral S]
    [IsIntegral S'] [IsModification f] :
    letI := IsModification.isAlteration f
    IsIso (IsAlteration.functionFieldMap f) := by
  sorry

/-- Stacks 0DMN: a proper surjection onto an integral Noetherian scheme contains an alteration. -/
theorem IsAlteration.exists_of_surjective {X S : Scheme.{u}} (f : X ⟶ S) [IsProper f]
    [Surjective f] [IsIntegral S] [AlgebraicGeometry.IsLocallyNoetherian S] :
    ∃ (Z : X.IdealSheafData) (_ : IsIntegral Z.subscheme), IsAlteration (Z.subschemeι ≫ f) := by
  sorry

-- AlgebraicGeometry.isAlteration_frobenius / not_isModification_frobenius
example (p : ℕ) [Fact p.Prime] [IsIntegral (Spec (CommRingCat.of (Polynomial (ZMod p))))]
    (F : Spec (CommRingCat.of (Polynomial (ZMod p))) ⟶ Spec (CommRingCat.of (Polynomial (ZMod p))))
    (hF : F = Spec.map (CommRingCat.ofHom (frobenius (Polynomial (ZMod p)) p))) :
    ∃ _ : IsAlteration F, IsAlteration.genericDegree F = p ∧ ¬ IsModification F := by
  sorry

-- AlgebraicGeometry.isAlteration_gaussianIntegers
example [IsIntegral (Spec (CommRingCat.of GaussianInt))] [IsIntegral (Spec (CommRingCat.of ℤ))]
    (F : Spec (CommRingCat.of GaussianInt) ⟶ Spec (CommRingCat.of ℤ))
    (hF : F = Spec.map (CommRingCat.ofHom (algebraMap ℤ GaussianInt))) :
    ∃ _ : IsAlteration F, IsAlteration.genericDegree F = 2 ∧ IsAlteration.IsGenericallyEtale F := by
  sorry

-- AlgebraicGeometry.isAlteration_id / isModification_id
example (X : Scheme.{u}) [IsIntegral X] : IsAlteration (𝟙 X) ∧ IsModification (𝟙 X) := by
  sorry

-- AlgebraicGeometry.not_isAlteration_projectiveLine: P¹_k → Spec k is not generically finite
-- (projective space is Tau Ceti StableReduction Layer 2); typed shadow with the affine line.
example (k : Type u) [Field k] :
    ¬ IsAlteration (Spec.map (CommRingCat.ofHom (Polynomial.C : k →+* Polynomial k))) := by
  sorry

-- AlgebraicGeometry.isModification_isAlteration
example {S' S : Scheme.{u}} (f : S' ⟶ S) [IsIntegral S] [IsIntegral S'] [IsModification f] :
    ∃ _ : IsAlteration f, IsAlteration.genericDegree f = 1 := by
  sorry

-- AlgebraicGeometry.not_isModification_openImmersion
example (k : Type u) [Field k] :
    ¬ IsModification (Spec.map (CommRingCat.ofHom
      (algebraMap (Polynomial k) (Localization.Away (Polynomial.X : Polynomial k))))) := by
  sorry

-- AlgebraicGeometry.isModification_cusp_normalization: 𝔸¹ → V(y² − x³), t ↦ (t², t³).
example (k : Type u) [Field k]
    (φ : (MvPolynomial (Fin 2) k ⧸
      Ideal.span {(MvPolynomial.X 1 ^ 2 - MvPolynomial.X 0 ^ 3 : MvPolynomial (Fin 2) k)}) →+*
        Polynomial k)
    (hφ : ∀ i, φ (Ideal.Quotient.mk _ (MvPolynomial.X i)) = Polynomial.X ^ (i.val + 2)) :
    IsModification (Spec.map (CommRingCat.ofHom φ)) ∧ IsFinite (Spec.map (CommRingCat.ofHom φ)) := by
  sorry

/- AlgebraicGeometry.isModification_blowup_origin: the blowup of 𝔸² at the origin (Tau Ceti
   StableReduction Layer 4) is a modification with centre the origin; the blowup is not available
   in this build. -/

/-- Base strict transform of `X → S` along `S' → S` (de Jong 2.18): the ideal sheaf of the
quotient of the base change by torsion over the integral modified base. It equals the
scheme-theoretic closure over a dense flat open where the modification is an isomorphism. -/
def strictTransform {X S S' : Scheme.{u}} (f : X ⟶ S) (φ : S' ⟶ S) [IsModification φ] :
    (Limits.pullback f φ).IdealSheafData :=
  sorry

/-- Base strict transform of a module: quotient by torsion over the integral base.
For a blowup compare exceptional torsion only when the module is flat over the full complement
of its centre. -/
def strictTransformModule {X S S' : Scheme.{u}} (f : X ⟶ S) (φ : S' ⟶ S) [IsModification φ]
    (M : X.Modules) : (Limits.pullback f φ).Modules :=
  sorry

/-- The strict transform is the scheme-theoretic closure of the restriction over any dense open
over which `φ` is an isomorphism and `f` is flat (de Jong 2.18).
This typed consequence records only the support equality, not schematic equality. -/
theorem strictTransform_eq_closure {X S S' : Scheme.{u}} (f : X ⟶ S) (φ : S' ⟶ S)
    [IsModification φ] [IsNoetherian S] [IsNoetherian S'] [LocallyOfFiniteType f]
    (U : S.Opens) (hU : Dense (U : Set S)) (hflat : Flat (f ∣_ U))
    (hφ : IsIso (φ ∣_ U)) :
    (↑(strictTransform f φ).support : Set ↥(Limits.pullback f φ)) =
      closure {x : ↥(Limits.pullback f φ) | Limits.pullback.snd f φ x ∈ φ ⁻¹ᵁ U} := by
  sorry

/-- A closed subscheme of `X ×_S S'` flat over `S'` and equal to the base change over a dense open
is the strict transform (de Jong 2.18). -/
theorem strictTransform_unique_of_flat {X S S' : Scheme.{u}} (f : X ⟶ S) (φ : S' ⟶ S)
    [IsModification φ] [IsNoetherian S] [IsNoetherian S'] [LocallyOfFiniteType f]
    (Z : (Limits.pullback f φ).IdealSheafData)
    (hflat : Flat (Z.subschemeι ≫ Limits.pullback.snd f φ))
    (hgen : ∃ U : S'.Opens, Dense (U : Set S') ∧
      IsIso (Z.subschemeι ∣_ ((Limits.pullback.snd f φ) ⁻¹ᵁ U))) :
    Z = strictTransform f φ := by
  sorry

/- AlgebraicGeometry.strictTransform_comp (transitivity), strictTransform_eq_blowup (Stacks 080E),
   strictTransform_closedImmersion (conditional comparison with Tau Ceti StableReduction Layer
   4), and the tests strictTransform_line and strictTransform_centre_empty need its blowup.
   Agreement requires flatness over the full complement of the centre. For a vertical line
   in the affine plane the base-torsion transform is empty but the blowup transform is the line;
   the packet records both conventions explicitly. -/

-- AlgebraicGeometry.strictTransform_self
example {S S' : Scheme.{u}} (φ : S' ⟶ S) [IsModification φ] :
    strictTransform (𝟙 S) φ = ⊥ := by
  sorry

-- AlgebraicGeometry.strictTransformModule_torsion: the module k[t]/(t) is t-power torsion, so its
-- strict transform vanishes.
example (k : Type u) [Field k] : ∀ m : Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k)},
    (Polynomial.X : Polynomial k) • m = 0 := by
  sorry

/-- Generic flatness (Stacks 052A). -/
theorem generic_flatness {X S : Scheme.{u}} (f : X ⟶ S) [IsIntegral S] [LocallyOfFiniteType f]
    [QuasiCompact f] : ∃ U : S.Opens, Dense (U : Set S) ∧ Flat (f ∣_ U) := by
  sorry

/-- Raynaud–Gruson flattening, modification form over a Noetherian integral base (Stacks 0815,
081R; de Jong 2.19); the admissible blowup itself is Tau Ceti StableReduction Layer 4. -/
theorem flattening_by_modification {X S : Scheme.{u}} (f : X ⟶ S) [IsIntegral S] [IsNoetherian S]
    [IsProper f] (U : S.Opens) (hU : Dense (U : Set S)) (hf : Flat (f ∣_ U)) :
    ∃ (S' : Scheme.{u}) (_ : IsIntegral S') (φ : S' ⟶ S) (_ : IsModification φ),
      Flat ((strictTransform f φ).subschemeι ≫ Limits.pullback.snd f φ) := by
  sorry

/- SF.4/modification-domination (Stacks 081T) and SF.4/chow-lemma (Stacks 0200) assert that the
   dominating map is an admissible blowup, resp. that the source admits an immersion into P^n_S;
   both notions are Tau Ceti StableReduction Layers 2 and 4, so these theorems are stated in the
   packet only. -/

/-- Regular schemes: locally Noetherian with regular local rings. -/
class IsRegular (X : Scheme.{u}) : Prop where
  isLocallyNoetherian : AlgebraicGeometry.IsLocallyNoetherian X
  isRegularLocalRing : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x)

theorem isRegular_spec_iff (A : CommRingCat.{u}) : IsRegular (Spec A) ↔ IsRegularRing A := by
  sorry

theorem IsRegular.of_isOpenImmersion {U X : Scheme.{u}} (f : U ⟶ X) [IsOpenImmersion f]
    [IsRegular X] : IsRegular U := by
  sorry

theorem IsRegular.of_smooth {X S : Scheme.{u}} (f : X ⟶ S) [Smooth f] [IsRegular S] :
    IsRegular X := by
  sorry

theorem IsRegular.isNormal (X : Scheme.{u}) [IsRegular X] (x : X) :
    IsDomain (X.presheaf.stalk x) ∧ IsIntegrallyClosed (X.presheaf.stalk x) := by
  sorry

/-- The regular locus. -/
def regularLocus (X : Scheme.{u}) : Set X := {x | IsRegularLocalRing (X.presheaf.stalk x)}

theorem regularLocus_eq_smoothLocus {X : Scheme.{u}} (k : Type u) [Field k] [PerfectField k]
    (f : X ⟶ Spec (CommRingCat.of k)) [LocallyOfFinitePresentation f] :
    regularLocus X = (f.smoothLocus : Set X) := by
  sorry

-- AlgebraicGeometry.isRegular_affineSpace
example (k : Type u) [Field k] (n : ℕ) :
    IsRegular (Spec (CommRingCat.of (MvPolynomial (Fin n) k))) := by
  sorry

-- AlgebraicGeometry.isRegular_specInt
example : IsRegular (Spec (CommRingCat.of ℤ)) := by
  sorry

-- AlgebraicGeometry.not_isRegular_node
example (k : Type u) [Field k] :
    ¬ IsRegular (Spec (CommRingCat.of
      (MvPolynomial (Fin 2) k ⧸
        Ideal.span {(MvPolynomial.X 0 * MvPolynomial.X 1 : MvPolynomial (Fin 2) k)}))) := by
  sorry

-- AlgebraicGeometry.not_isRegular_dualNumbers
example (k : Type u) [Field k] : ¬ IsRegular (Spec (CommRingCat.of (DualNumber k))) := by
  sorry

-- AlgebraicGeometry.isRegular_empty
example : IsRegular (∅ : Scheme.{u}) := by
  sorry

/-- Strict normal crossings data: finitely many components (de Jong 2.4). -/
structure SNCData (X : Scheme.{u}) where
  ι : Type u
  [fintype : Fintype ι]
  comp : ι → X.IdealSheafData

attribute [instance] SNCData.fintype

/-- The partial intersection `D_J`, cut out by the sum of the component ideals. -/
def SNCData.stratum {X : Scheme.{u}} (C : SNCData X) (J : Finset C.ι) : X.IdealSheafData :=
  ⨆ j ∈ J, C.comp j

/-- The divisor `⋃ D_i`, cut out by the product of the component ideals. -/
def SNCData.divisor {X : Scheme.{u}} (C : SNCData X) : X.IdealSheafData :=
  ∏ i, C.comp i

/-- Regularity of every nonempty partial intersection, in the expected codimension. -/
def SNCData.IsTransverse {X : Scheme.{u}} (C : SNCData X) : Prop :=
  ∀ J : Finset C.ι, J.Nonempty →
    IsRegular (C.stratum J).subscheme ∧
    ∀ y : (C.stratum J).subscheme,
      ringKrullDim (X.presheaf.stalk ((C.stratum J).subschemeι y)) =
        ringKrullDim ((C.stratum J).subscheme.presheaf.stalk y) + (J.card : WithBot ℕ∞)

/-- `D` is a strict normal crossings divisor (de Jong 2.4). -/
def IsStrictNormalCrossings {X : Scheme.{u}} (D : X.IdealSheafData) : Prop :=
  ∃ C : SNCData X, D = C.divisor ∧
    (∀ x ∈ (D.support : Set X), IsRegularLocalRing (X.presheaf.stalk x)) ∧ C.IsTransverse

/-- Normal crossings: strict normal crossings after a surjective étale base change. -/
def IsNormalCrossings {X : Scheme.{u}} (D : X.IdealSheafData) : Prop :=
  ∃ (X' : Scheme.{u}) (e : X' ⟶ X), Etale e ∧ Surjective e ∧ IsStrictNormalCrossings (D.comap e)

theorem IsStrictNormalCrossings.isNormalCrossings {X : Scheme.{u}} {D : X.IdealSheafData}
    (h : IsStrictNormalCrossings D) : IsNormalCrossings D := by
  sorry

theorem IsStrictNormalCrossings.pullback_smooth {X Y : Scheme.{u}} (f : Y ⟶ X) [Smooth f]
    {D : X.IdealSheafData} (h : IsStrictNormalCrossings D) :
    IsStrictNormalCrossings (D.comap f) := by
  sorry

theorem IsStrictNormalCrossings.component {X : Scheme.{u}} {D : X.IdealSheafData}
    (h : IsStrictNormalCrossings D) :
    ∃ C : SNCData X, D = C.divisor ∧ ∀ i, IsRegular (C.comp i).subscheme := by
  sorry

/-- Local equation: at a point of `D` the ideal is generated by a product of part of a regular
system of parameters (stated as principality of the stalk ideal). -/
theorem IsStrictNormalCrossings.local_equation {X : Scheme.{u}} {D : X.IdealSheafData}
    (h : IsStrictNormalCrossings D) (x : X) (hx : x ∈ (D.support : Set X)) :
    ∃ t : X.presheaf.stalk x, ∀ U : X.affineOpens, ∀ hxU : x ∈ (U : X.Opens),
      Ideal.map (X.presheaf.germ U.1 x hxU).hom (D.ideal U) = Ideal.span {t} := by
  sorry

theorem IsStrictNormalCrossings.of_subset {X : Scheme.{u}} (C : SNCData X)
    (h : IsStrictNormalCrossings C.divisor) (J : Finset C.ι) :
    IsStrictNormalCrossings (∏ j ∈ J, C.comp j) := by
  sorry

/- Tests AlgebraicGeometry.snc_axes, nodalCubic_nc_not_snc and not_nc_threeLines are computations
   in 𝔸²_k with the ideal sheaves of xy, y² − x²(x + 1) and xy(x − y); stated in the packet. -/

-- AlgebraicGeometry.snc_empty
example (X : Scheme.{u}) [IsRegular X] : IsStrictNormalCrossings (⊤ : X.IdealSheafData) := by
  sorry

/- Resolution of curves by normalization (Stacks 0C45, 0BI4). -/
/- AlgebraicGeometry.resolution_of_curves (Stacks 0C45/0BI4): the finite
   absolute normalization of a reduced Noetherian curve is regular. For integral Y,
   construct Spec K(Y) → Y and normalize that morphism, not the identity Y → Y.
   Mathlib's relative normalization of the identity is Y itself; the required generic-point
   adapter and its absolute-normalization comparison are recorded as a packet gap. -/

/-- Serre's criterion for normality (Stacks 031S), the `(R₁)` half: a normal Noetherian domain is
regular in codimension one. The `(S₂)` half needs depth, which Mathlib does not define. -/
theorem serre_normality_R1 (A : Type u) [CommRing A] [IsNoetherianRing A] [IsDomain A]
    [IsIntegrallyClosed A] (p : Ideal A) [p.IsPrime] (hp : p.height ≤ 1) :
    IsRegularLocalRing (Localization.AtPrime p) := by
  sorry

/-! ## SF.4d  Grassmannians and moduli of stable pointed curves -/

/-- The Grassmannian scheme over `Spec ℤ` representing Mathlib's `Module.Grassmannian`. -/
def Grassmannian (r d : ℕ) : Scheme.{0} :=
  sorry

theorem Grassmannian.represents (r d : ℕ) (A : Type) [CommRing A] :
    Nonempty ((Spec (CommRingCat.of A) ⟶ Grassmannian r d) ≃
      Module.Grassmannian A (Fin r → A) d) := by
  sorry

/-- The standard affine charts. -/
def Grassmannian.chart (r d : ℕ) (I : Finset (Fin r)) (hI : I.card = d) :
    Spec (CommRingCat.of (MvPolynomial (Fin d × Fin (r - d)) ℤ)) ⟶ Grassmannian r d :=
  sorry

theorem Grassmannian.isProper (r d : ℕ) :
    IsProper (specZIsTerminal.from (Grassmannian r d)) ∧
      Smooth (specZIsTerminal.from (Grassmannian r d)) := by
  sorry

/- AlgebraicGeometry.Grassmannian.plucker (closed immersion into projective space) and
   AlgebraicGeometry.Grassmannian.relative (Gr(E, d) → S for a vector bundle E) need projective
   space and vector bundles over a base (Tau Ceti StableReduction Layer 2); stated in the packet. -/

-- Weak representability consequence of Grassmannian.rank_one; the projective-space
-- isomorphism test is stated in the packet.
example (A : Type) [CommRing A] (r : ℕ) :
    Nonempty ((Spec (CommRingCat.of A) ⟶ Grassmannian r 1) ≃
      Module.Grassmannian A (Fin r → A) 1) := by
  sorry

-- AlgebraicGeometry.Grassmannian.full
example (r : ℕ) : Nonempty (Grassmannian r r ≅ Spec (CommRingCat.of ℤ)) := by
  sorry

-- Weak smoothness consequence of Grassmannian.dimension; the dimension-4 assertion
-- still needs relative dimension and projective-space supplier types.
example : Smooth (specZIsTerminal.from (Grassmannian 4 2)) := by
  sorry

-- AlgebraicGeometry.Grassmannian.not_affine
example : ¬ IsAffine (Grassmannian 2 1) := by
  sorry

/- SF.4/hilbert-scheme (Nitsure, Theorems 5.1–5.3): representability of Quot^{Φ,L}_{E/X/S} and
   Hilb^{Φ,L}_{X/S} by projective S-schemes, Hom and Isom as open subschemes. Not typed: relative
   very ample line bundles and Hilbert polynomials are Tau Ceti StableReduction Layer 2.

   SF.4/stable-curve-stack and its API, under the packet's names:
     AlgebraicGeometry.StableCurves.Mbar           -- pseudofunctor S ↦ groupoid of stable n-pointed
                                                    --   genus-g families (StableReduction Layer 3)
     AlgebraicGeometry.StableCurves.Mbar.isStack   -- Pseudofunctor.IsStack for the fppf topology
     AlgebraicGeometry.StableCurves.Mbar.smooth    -- the open substack M_{g,n}
     AlgebraicGeometry.StableCurves.Mbar.pullback
     AlgebraicGeometry.StableCurves.Mbar.aut_finite
     AlgebraicGeometry.StableCurves.Mbar.forget
   Tests: StableCurves.Mbar_zero_three, StableCurves.Mbar_one_one_aut,
     StableCurves.not_stable_zero_two, StableCurves.not_stable_rational_tail,
     StableCurves.Mbar_smooth_open.
   They need the prestable and stable family predicates of Tau Ceti StableReduction Layer 3 and the
   algebraic stacks of SchemeAndStackFoundations SF.1, neither present in this build.

   Theorems SF.4/isom-stable-curves (DM 1.11), SF.4/stable-curve-stack-algebraic (DM 5.1–5.2,
   Stacks 0E9C), SF.4/stable-curve-stack-smooth (DM 1.6–1.9, 5.2), SF.4/level-structure-cover
   (Deligne 1985 §3, de Jong 2.24) and SF.4/stable-extension-after-alteration (de Jong 4.17,
   Deligne Lemme 1.6) are stated in the packet. Once Layer 3 exists the last has the shape

     theorem stable_extension_after_alteration {Y : Scheme} [IsIntegral Y] [IsNoetherian Y]
         (U : Y.Opens) (hU : Dense (U : Set Y)) (C : StablePointedFamily g n U) :
         ∃ (Y' : Scheme) (_ : IsIntegral Y') (ψ : Y' ⟶ Y) (_ : IsAlteration ψ)
           (C' : StablePointedFamily g n Y'), Nonempty (C'.restrict (ψ ⁻¹ᵁ U) ≅ C.pullback (ψ ∣_ U))
-/

/-! ## SF.4e  de Jong's alterations -/

/-- Component ideals locally generated by a non-zero-divisor (effective Cartier).
This is the local predicate needed in de Jong 2.16(c); StableReduction Layer 2
supplies the bundled effective Cartier divisor comparison. -/
def SNCData.HasCartierComponents {X : Scheme.{u}} (C : SNCData X) : Prop :=
  ∀ i, ∀ x ∈ ((C.comp i).support : Set X),
    ∃ (U : X.affineOpens) (_ : x ∈ (U : X.Opens)) (t : Γ(X, U)),
      (C.comp i).ideal U = Ideal.span {t} ∧ Function.Injective (fun a : Γ(X, U) => t * a)

namespace DeJong

/-- A trait: a complete discrete valuation ring (de Jong 2.12). -/
class IsTrait (R : Type u) [CommRing R] [IsDomain R] : Prop where
  isDVR : IsDiscreteValuationRing R
  complete : IsAdicComplete (IsLocalRing.maximalIdeal R) R

/-- The ramification index of a local extension of DVRs: the valuation of a uniformiser. -/
def TraitHom.ramificationIndex {R R' : Type u} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [CommRing R'] [IsDomain R'] [IsDiscreteValuationRing R']
    (φ : R →+* R') : ℕ :=
  sorry

/-- An `S`-variety over a trait: integral, separated, flat and of finite type (de Jong 2.15). -/
class IsSVariety {R : Type u} [CommRing R] {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of R)) :
    Prop where
  isIntegral : IsIntegral X
  isSeparated : IsSeparated f
  flat : Flat f
  locallyOfFiniteType : LocallyOfFiniteType f
  quasiCompact : QuasiCompact f

theorem isSVariety_iff_genericFiber_nonempty {R K : Type u} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [Field K] [Algebra R K] [IsFractionRing R K] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of R)) [IsIntegral X] [IsSeparated f] [LocallyOfFiniteType f]
    [QuasiCompact f] :
    IsSVariety f ↔ Nonempty (TauCeti.genericFiber R K f).left := by
  sorry

/-- Base change along a finite extension of traits: components of the base change dominating `X`
are `S'`-varieties mapping to `X` by alterations (de Jong 6.8). -/
theorem IsSVariety.baseChange_component {R R' : Type u} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [IsTrait R] [CommRing R'] [IsDomain R']
    [IsDiscreteValuationRing R'] [IsTrait R'] [Algebra R R'] [Module.Finite R R']
    [IsLocalHom (algebraMap R R')] (hinj : Function.Injective (algebraMap R R'))
    {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of R)) [IsSVariety f] :
    ∃ (Z : (Limits.pullback f (Spec.map (CommRingCat.ofHom (algebraMap R R')))).IdealSheafData)
      (_ : IsIntegral Z.subscheme),
      IsSVariety (Z.subschemeι ≫ Limits.pullback.snd f _) ∧
        IsAlteration (Z.subschemeι ≫ Limits.pullback.fst f _) := by
  sorry

/- AlgebraicGeometry.DeJong.finiteDVRExtension_of_trait: comparison with Tau Ceti's
   `FiniteDVRExtension`, whose module is not compiled in this build; stated in the packet. -/

/-- A proper `S`-variety with an identification of its generic fibre is a Tau Ceti model. -/
def IsSVariety.toModel {R K : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    [Field K] [Algebra R K] [IsFractionRing R K] {C : Scheme.{u}}
    (toK : C ⟶ Spec (CommRingCat.of K)) {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of R))
    [IsSVariety f] [IsProper f] (e : TauCeti.genericFiber R K f ≅ Over.mk toK) : TauCeti.Model R K C toK :=
  sorry

-- AlgebraicGeometry.DeJong.isTrait_padicInt
example (p : ℕ) [Fact p.Prime] : IsTrait ℤ_[p] := by
  sorry

-- AlgebraicGeometry.DeJong.not_isTrait_localization
example (p : ℕ) [Fact p.Prime] [(Ideal.span {(p : ℤ)}).IsPrime] :
    ¬ IsTrait (Localization.AtPrime (Ideal.span {(p : ℤ)})) := by
  sorry

-- AlgebraicGeometry.DeJong.ramification_sqrt: Z_p → Z_p[x]/(x² − p) has ramification index 2.
example (p : ℕ) [Fact p.Prime] (R' : Type) [CommRing R'] [IsDomain R'] [IsDiscreteValuationRing R']
    (e : R' ≃+* Polynomial ℤ_[p] ⧸ Ideal.span {Polynomial.X ^ 2 - Polynomial.C (p : ℤ_[p])})
    (φ : ℤ_[p] →+* R') (hφ : ∀ a, e (φ a) = Ideal.Quotient.mk _ (Polynomial.C a)) :
    TraitHom.ramificationIndex φ = 2 := by
  sorry

-- AlgebraicGeometry.DeJong.isSVariety_genericOnly: Spec Q_p is a Z_p-variety with empty special
-- fibre.
example (p : ℕ) [Fact p.Prime] :
    IsSVariety (Spec.map (CommRingCat.ofHom (algebraMap ℤ_[p] ℚ_[p]))) := by
  sorry

-- AlgebraicGeometry.DeJong.not_isSVariety_specialPoint
example (p : ℕ) [Fact p.Prime] :
    ¬ IsSVariety (Spec.map (CommRingCat.ofHom (PadicInt.toZMod (p := p)))) := by
  sorry

/-- Conditions (a)–(d) of de Jong 2.16 without integrality: smooth generic fibre, and the special
fibre is cut out by the product of effective Cartier components whose partial intersections are smooth over the
residue field of the expected codimension. -/
def SemistableConditions {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    (K : Type u) [Field K] [Algebra R K] [IsFractionRing R K] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of R)) : Prop :=
  Smooth (TauCeti.genericFiber R K f).hom ∧
    ∃ C : SNCData X, (TauCeti.specialFiberι R f).ker = C.divisor ∧ C.HasCartierComponents ∧ C.IsTransverse ∧
      ∀ J : Finset C.ι, J.Nonempty →
        ∃ g : (C.stratum J).subscheme ⟶ Spec (CommRingCat.of (IsLocalRing.ResidueField R)),
          Smooth g ∧ g ≫ Spec.map (CommRingCat.ofHom (algebraMap R (IsLocalRing.ResidueField R))) =
            (C.stratum J).subschemeι ≫ f

/-- Strictly semistable `S`-varieties (de Jong 2.16). -/
def IsStrictlySemistable {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    (K : Type u) [Field K] [Algebra R K] [IsFractionRing R K] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of R)) : Prop :=
  IsSVariety f ∧ SemistableConditions K f

theorem IsStrictlySemistable.isRegular {R : Type u} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] {K : Type u} [Field K] [Algebra R K] [IsFractionRing R K]
    {X : Scheme.{u}} {f : X ⟶ Spec (CommRingCat.of R)} (h : IsStrictlySemistable K f) :
    IsRegular X := by
  sorry

/-- With perfect residue field, strict semistability says the special fibre is an SNC divisor. -/
theorem IsStrictlySemistable.snc_specialFiber {R : Type u} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] {K : Type u} [Field K] [Algebra R K] [IsFractionRing R K]
    [PerfectField (IsLocalRing.ResidueField R)] {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of R))
    [IsSVariety f] (hgen : Smooth (TauCeti.genericFiber R K f).hom) :
    IsStrictlySemistable K f ↔ IsStrictNormalCrossings (TauCeti.specialFiberι R f).ker := by
  sorry

/-- Zariski-local model: near each point of the special fibre `X` is smooth over
`R[t₁, …, t_r]/(t₁ ⋯ t_r − π)` (de Jong 2.16). -/
theorem IsStrictlySemistable.smooth_over_model {R : Type u} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] {K : Type u} [Field K] [Algebra R K] [IsFractionRing R K]
    {X : Scheme.{u}} {f : X ⟶ Spec (CommRingCat.of R)} (h : IsStrictlySemistable K f) (π : R)
    (hπ : Irreducible π) (x : X) :
    ∃ (U : X.Opens) (_ : x ∈ U) (r : ℕ)
      (g : U.toScheme ⟶ Spec (CommRingCat.of (MvPolynomial (Fin r) R ⧸
        Ideal.span {(∏ i, MvPolynomial.X i) - MvPolynomial.C π}))), Smooth g := by
  sorry

/- AlgebraicGeometry.DeJong.IsStrictlySemistable.local_form (complete local rings
   B[[t₁..t_r]]/(t₁⋯t_r − π), B formally smooth over R) and
   AlgebraicGeometry.DeJong.IsStrictlySemistable.baseChange_etale (stability under finite
   unramified trait extensions) are stated in the packet. -/

-- AlgebraicGeometry.DeJong.strictlySemistable_xy
example (p : ℕ) [Fact p.Prime] (f : Spec (CommRingCat.of (MvPolynomial (Fin 2) ℤ_[p] ⧸
    Ideal.span {MvPolynomial.X 0 * MvPolynomial.X 1 - MvPolynomial.C (p : ℤ_[p])})) ⟶
      Spec (CommRingCat.of ℤ_[p]))
    (hf : f = Spec.map (CommRingCat.ofHom (algebraMap _ _))) :
    IsStrictlySemistable ℚ_[p] f := by
  sorry

-- AlgebraicGeometry.DeJong.strictlySemistable_smooth
example (p : ℕ) [Fact p.Prime] :
    IsStrictlySemistable ℚ_[p] (Spec.map (CommRingCat.ofHom (algebraMap ℤ_[p] (Polynomial ℤ_[p])))) := by
  sorry

-- AlgebraicGeometry.DeJong.not_strictlySemistable_xy_sq
example (p : ℕ) [Fact p.Prime] (f : Spec (CommRingCat.of (MvPolynomial (Fin 2) ℤ_[p] ⧸
    Ideal.span {MvPolynomial.X 0 * MvPolynomial.X 1 - MvPolynomial.C ((p : ℤ_[p]) ^ 2)})) ⟶
      Spec (CommRingCat.of ℤ_[p]))
    (hf : f = Spec.map (CommRingCat.ofHom (algebraMap _ _))) :
    ¬ IsStrictlySemistable ℚ_[p] f := by
  sorry

-- AlgebraicGeometry.DeJong.not_strictlySemistable_ramified
example (p : ℕ) [Fact p.Prime] (f : Spec (CommRingCat.of (Polynomial ℤ_[p] ⧸
    Ideal.span {Polynomial.X ^ 2 - Polynomial.C (p : ℤ_[p])})) ⟶ Spec (CommRingCat.of ℤ_[p]))
    (hf : f = Spec.map (CommRingCat.ofHom (algebraMap _ _))) :
    ¬ IsStrictlySemistable ℚ_[p] f := by
  sorry

/- AlgebraicGeometry.DeJong.strictlySemistable_ramified_basechange (xy − p becomes xy − ϖ² after
   ramified base change) is stated in the packet. -/

/-- Strict semistable pairs (de Jong 6.3): `X` strictly semistable, `X_s ∪ Z_h` an SNC divisor with
horizontal part `H`, and every horizontal stratum satisfying the semistable conditions. -/
def IsStrictSemistablePair {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    (K : Type u) [Field K] [Algebra R K] [IsFractionRing R K] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of R)) (H : SNCData X) : Prop :=
  IsStrictlySemistable K f ∧
    IsStrictNormalCrossings ((TauCeti.specialFiberι R f).ker * H.divisor) ∧
    ∀ J : Finset H.ι, J.Nonempty →
      Flat ((H.stratum J).subschemeι ≫ f) ∧
      SemistableConditions K ((H.stratum J).subschemeι ≫ f)

theorem IsStrictSemistablePair.of_strictlySemistable {R : Type u} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] {K : Type u} [Field K] [Algebra R K] [IsFractionRing R K]
    {X : Scheme.{u}} {f : X ⟶ Spec (CommRingCat.of R)} (h : IsStrictlySemistable K f) :
    IsStrictSemistablePair K f ⟨PEmpty, fun x => x.elim⟩ := by
  sorry

theorem IsStrictSemistablePair.horizontal {R : Type u} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] {K : Type u} [Field K] [Algebra R K] [IsFractionRing R K]
    {X : Scheme.{u}} {f : X ⟶ Spec (CommRingCat.of R)} {H : SNCData X}
    (h : IsStrictSemistablePair K f H) (i : H.ι) :
    Flat ((H.comp i).subschemeι ≫ f) := by
  sorry

theorem IsStrictSemistablePair.restrict {R : Type u} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] {K : Type u} [Field K] [Algebra R K] [IsFractionRing R K]
    {X : Scheme.{u}} {f : X ⟶ Spec (CommRingCat.of R)} {H : SNCData X}
    (h : IsStrictSemistablePair K f H) (U : X.Opens) [IsIntegral U.toScheme] :
    IsStrictSemistablePair K (U.ι ≫ f) ⟨H.ι, fun i => (H.comp i).comap U.ι⟩ := by
  sorry

/- AlgebraicGeometry.DeJong.IsStrictSemistablePair.local_form (complete local rings
   C[[t, s]]/(π − t₁⋯t_n)) and the tests AlgebraicGeometry.DeJong.pair_specialFiber,
   AlgebraicGeometry.DeJong.pair_with_horizontal and AlgebraicGeometry.DeJong.not_pair_diagonal
   (computations with Z_p[x, y, z]/(xy − p)) are stated in the packet. -/

/- Test AlgebraicGeometry.DeJong.not_pair_generic_cusp: over R=Q[[π]],
   X=Spec R[x,y] and H=V((πx−1)^2+π^2 y^3), H misses the special fibre
   but is cuspidal on the generic fibre. The pair (X,X_s ∪ H) fails SNC;
   special-fibre local forms alone do not imply the global pair predicate.
   See de Jong 6.4 p. 83 and the packet source issue E3. -/

/- Split semistable curves (SF.4/split-prestable-curve) need Tau Ceti StableReduction Layer 3's
   prestable families. Declarations: AlgebraicGeometry.DeJong.IsSplitPrestable,
   AlgebraicGeometry.DeJong.IsSplitPrestable.pullback,
   AlgebraicGeometry.DeJong.IsSplitPrestable.singularLocus_section,
   AlgebraicGeometry.DeJong.IsSplitPrestable.of_smooth,
   AlgebraicGeometry.DeJong.IsSplitPrestable.of_sections; tests AlgebraicGeometry.DeJong.split_twoLines,
   AlgebraicGeometry.DeJong.not_split_nodalCubic, AlgebraicGeometry.DeJong.split_after_extension,
   AlgebraicGeometry.DeJong.split_smooth. Theorems SF.4/node-local-structure,
   SF.4/nodal-family-resolution, SF.4/generic-projection, SF.4/curve-fibration,
   SF.4/three-point-divisor, SF.4/stable-model-domination, SF.4/curve-family-alteration,
   SF.4/nc-to-snc, SF.4/faltings-formal-smoothness, SF.4/bertini-smoothness are stated in the
   packet. -/

/-- de Jong's alteration theorem (de Jong 1996, Theorem 4.1): a regular projective `Xbar₁` with an
open `X₁` altering `X`, with SNC boundary containing the preimage of `Z`; generically étale over a
perfect field. Projectivity is recorded as properness here (projective morphisms are Tau Ceti
StableReduction Layer 2). -/
theorem alteration_theorem (k : Type u) [Field k] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of k)) [IsIntegral X] [IsSeparated f] [LocallyOfFiniteType f]
    [QuasiCompact f] (Z : X.IdealSheafData) (hZ : Z ≠ ⊥) :
    ∃ (X₁ : Scheme.{u}) (_ : IsIntegral X₁) (φ : X₁ ⟶ X) (_ : IsAlteration φ) (Xbar₁ : Scheme.{u})
      (j : X₁ ⟶ Xbar₁) (g : Xbar₁ ⟶ Spec (CommRingCat.of k)) (B : Xbar₁.IdealSheafData),
      IsOpenImmersion j ∧ IsProper g ∧ IsRegular Xbar₁ ∧ IsStrictNormalCrossings B ∧
      (B.support : Set Xbar₁) = (Set.range j)ᶜ ∪ j '' (φ ⁻¹' (Z.support : Set X)) ∧
      ((PerfectField k) → IsAlteration.IsGenericallyEtale φ) := by
  sorry

/-- A properness consequence of de Jong's semistable alteration theorem (6.5).
The packet retains projectivity and geometrically irreducible generic fibre; their supplier
notions are not typed here. The map over S and the entire boundary are recorded. -/
theorem semistable_alteration_theorem (R : Type u) [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [IsTrait R] {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of R))
    [IsSVariety f] (Z : X.IdealSheafData) (hZ : Z ≠ ⊥)
    (hclosed : Set.range (TauCeti.specialFiberι R f) ⊆ (Z.support : Set X)) :
    ∃ (R₁ K₁ : Type u) (_ : CommRing R₁) (_ : IsDomain R₁) (_ : IsDiscreteValuationRing R₁)
      (_ : IsTrait R₁) (_ : Algebra R R₁) (_ : Module.Finite R R₁)
      (_ : IsLocalHom (algebraMap R R₁)) (_ : Function.Injective (algebraMap R R₁))
      (_ : Field K₁)
      (_ : Algebra R₁ K₁) (_ : IsFractionRing R₁ K₁)
      (X₁ : Scheme.{u}) (_ : IsIntegral X₁) (φ : X₁ ⟶ X) (_ : IsAlteration φ) (Xbar₁ : Scheme.{u})
      (g : Xbar₁ ⟶ Spec (CommRingCat.of R₁)) (j : X₁ ⟶ Xbar₁) (H : SNCData Xbar₁),
        IsOpenImmersion j ∧ IsProper g ∧ IsStrictSemistablePair K₁ g H ∧
          (j ≫ g) ≫ Spec.map (CommRingCat.ofHom (algebraMap R R₁)) = φ ≫ f ∧
          (((TauCeti.specialFiberι R₁ g).ker * H.divisor).support : Set Xbar₁) =
            (Set.range j)ᶜ ∪ j '' (φ ⁻¹' (Z.support : Set X)) := by
  sorry

end DeJong

end AlgebraicGeometry
