import Mathlib
import TauCeti.AlgebraicGeometry.LineBundle.Class
import TauCeti.CategoryTheory.Sites.SheafCohomology.LongExactSequence

/-!
# Algebraic moduli and representability for arithmetic geometry: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures which
can already be stated against the Mathlib and Tau Ceti APIs. It is not an exhaustive list of
the results in any layer, and nothing here claims an implementation.

Design choices made explicit here: a gerbe is a predicate `IsGerbe F J` on Mathlib's `Cat`-valued
pseudofunctors extending `Pseudofunctor.IsStack`, never a record of classification conclusions; an
abelian banding is data with its conjugation and restriction compatibilities; coefficient sheaves
live in a universe independent of the base and fibre universes; module descent is phrased on
Mathlib's `ModuleCat` descent data and compared with the tensor-overlap and comonad-coalgebra
presentations; the relative Picard sheaf is the fppf sheafification of `T ↦ Pic(X_T)`, and the
section-rigidified objects reuse Tau Ceti's `RigidifiedLineBundle`.
-/

open CategoryTheory Opposite Bicategory

universe v u' v' w h

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

open CategoryTheory

universe u


/-! ## Layer R09.1: projective parameter spaces -/

namespace ProjectiveParameterSpaces

open Module Module.Grassmannian

variable (R : Type u) [CommRing R] (M : Type u) [AddCommGroup M] [Module R M]

/-- Grassmannians parametrise locally free *quotients*: the Grassmannian of rank-`0` quotients has
exactly one point, the zero quotient (`Gr(0, E) = X` in the README). -/
theorem grassmannian_zero_subsingleton : Subsingleton G(0, M; R) := sorry

/-- A free module of rank `r` has no locally free quotient of rank `k > r`
(`Gr(k, E) = ∅` for `k` above the rank). -/
theorem grassmannian_isEmpty_of_lt [Module.Free R M] [Module.Finite R M] [Nontrivial R] (k : ℕ)
    (hk : Module.finrank R M < k) : IsEmpty G(k, M; R) := sorry

/-- The Grassmannian of rank-`r` quotients of a free module of rank `r` over a nontrivial ring is a
single point, the identity quotient (`Gr(r, E) = X`). -/
theorem grassmannian_top_subsingleton [Module.Free R M] [Module.Finite R M] [Nontrivial R] :
    Subsingleton G(Module.finrank R M, M; R) := sorry

/-- The Hilbert function of a graded vector space with finite-dimensional pieces. -/
noncomputable def hilbertFunction (k : Type u) [Field k] (V : ℕ → Type u)
    [∀ n, AddCommGroup (V n)] [∀ n, Module k (V n)] [∀ n, Module.Finite k (V n)] : ℕ → ℕ :=
  fun n => Module.finrank k (V n)

/-- Hilbert–Serre: for a finitely generated graded module `M = ⊕ ℳ n` over the polynomial ring
`k[X_σ]` with its standard grading, the Hilbert function `n ↦ dim_k ℳ n` agrees for large `n` with
a rational polynomial of degree less than the number of variables. -/
theorem exists_hilbertPolynomial (k : Type u) [Field k] (σ : Type u) [Fintype σ]
    (M : Type u) [AddCommGroup M] [Module k M] [Module (MvPolynomial σ k) M]
    [IsScalarTower k (MvPolynomial σ k) M] [Module.Finite (MvPolynomial σ k) M]
    (ℳ : ℕ → Submodule k M) [SetLike.GradedSMul (MvPolynomial.homogeneousSubmodule σ k) ℳ]
    [DirectSum.Decomposition ℳ] :
    ∃ (P : Polynomial ℚ) (N : ℕ), P.natDegree ≤ Fintype.card σ - 1 ∧
      ∀ n, N ≤ n → P.eval (n : ℚ) = Module.finrank k (ℳ n) := sorry

/-- `PluckerTests.sign`: the minors of a quotient with rows `(1,0,a,b)` and `(0,1,c,d)`
satisfy the alternating Plücker relation, including in characteristic two. -/
example (K : Type u) [CommRing K] (a b c d : K) :
    (a * d - b * c) - c * (-b) + d * (-a) = 0 := sorry

end ProjectiveParameterSpaces

/-! ## Layer R09.2: Hom and Isom schemes, bounded families and dévissage -/

namespace HomIsom

open AlgebraicGeometry

variable (k : Type u) [Field k]

/-- The closed point `Spec k → Spec k[ε]` of the dual numbers. It represents the degree-one Hilbert
functor of itself over `Spec k[ε]`; its universal family is the identity. -/
noncomputable def dualNumberPoint :
    Spec (CommRingCat.of k) ⟶ Spec (CommRingCat.of (DualNumber k)) :=
  Spec.map (CommRingCat.ofHom (TrivSqZeroExt.fstHom k k k).toRingHom)

/-- The universal family of the degree-one Hilbert functor of the closed point is flat
(it is an identity). -/
example : Flat (𝟙 (Spec (CommRingCat.of k))) := inferInstance

/-- The parameter morphism `Spec k → Spec k[ε]` is not flat: flatness of the universal family does
not transfer to the parameter morphism. -/
theorem not_flat_dualNumberPoint : ¬ Flat (dualNumberPoint k) := sorry

end HomIsom

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

/-! ## Layer R09.3: quasi-coherent pullback and faithfully flat module descent -/

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

open _root_.AlgebraicGeometry

noncomputable def affine_pullback_tensor {R B : CommRingCat.{u}}
    (f : R ⟶ B) (M : ModuleCat.{u} R) :
    (Scheme.Modules.pullback (Spec.map f)).obj (tilde M) ≅
      tilde ((ModuleCat.extendScalars f.hom).obj M) := by
  sorry

-- API: affine_pullback_tensor.naturality. This compares sheaf maps.
theorem affine_pullback_tensor.naturality {R B : CommRingCat.{u}}
    (f : R ⟶ B) {M N : ModuleCat.{u} R} (h : M ⟶ N) :
    (Scheme.Modules.pullback (Spec.map f)).map ((tilde.functor R).map h) ≫
        (affine_pullback_tensor f N).hom =
      (affine_pullback_tensor f M).hom ≫
        (tilde.functor B).map ((ModuleCat.extendScalars f.hom).map h) := by
  sorry

-- Test: AffinePullbackTests.nonflat. The original mono becomes zero on a
-- nonzero sheaf after the nonflat base change Z → Z/2Z.
example :
    let f := CommRingCat.ofHom (Int.castRingHom (ZMod 2))
    let h := (tilde.functor (CommRingCat.of ℤ)).map
      (ModuleCat.ofHom (2 • LinearMap.id : ℤ →ₗ[ℤ] ℤ))
    Mono h ∧
      (Scheme.Modules.pullback (Spec.map f)).map h = 0 ∧
      ¬ Mono ((Scheme.Modules.pullback (Spec.map f)).map h) := by
  sorry

/-- Assemble quasi-coherent pullback and its identity and composition comparisons into
a pseudofunctor. The restricted pullback itself belongs to Tau Ceti's
`QuasicoherentSheaf.pullback`; this target supplies its bicategorical assembly. -/
noncomputable def QCohPseudofunctor : LocallyDiscrete Scheme.{u}ᵒᵖ ⥤ᵖ Cat := by
  sorry

theorem QCohPseudofunctor.fibre (X : Scheme.{u}) :
    QCohPseudofunctor.obj (.mk (op X)) =
      Cat.of (SheafOfModules.isQuasicoherent X.ringCatSheaf).FullSubcategory := by
  sorry

-- Test: QCohPseudoTests.infiniteModule. A particular infinite free module
-- is admitted, and its failure of finite generation is part of the check.
example (K : Type u) [Field K] :
    (tilde (R := CommRingCat.of K) (ModuleCat.of K (ℕ →₀ K))).IsQuasicoherent ∧
      ¬ Module.Finite K (ℕ →₀ K) := by
  sorry

-- Test: QCohPseudoTests.nonInvertibleArrow. Test the sheaf-module
-- arrow; a failure of invertibility only in ModuleCat would be weaker.
example : ¬ IsIso ((tilde.functor (CommRingCat.of ℤ)).map
    (ModuleCat.ofHom (2 • LinearMap.id : ℤ →ₗ[ℤ] ℤ))) := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

open TensorProduct

theorem finite_presentation_of_faithfully_flat
    {R S M : Type u} [CommRing R] [CommRing S] [Algebra R S]
    [AddCommGroup M] [Module R M] [Module.FaithfullyFlat R S]
    [Module.FinitePresentation S (S ⊗[R] M)] :
    Module.FinitePresentation R M := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.ModuleDescentBridge

open CategoryTheory
universe uB

variable {R S : Type uB} [CommRing R] [CommRing S] (f : R →+* S)

-- Partial prototype for tensor-comonad-coordinates.
-- Tensor instance transport and the full overlap-action signatures remain omitted.
theorem tensor_comonad_coordinates (N : ModuleCat.{uB} S) :
    (((ModuleCat.extendRestrictScalarsAdj f).toComonad : ModuleCat S ⥤ ModuleCat S) =
      ModuleCat.restrictScalars f ⋙ ModuleCat.extendScalars f) ∧
    ((ModuleCat.extendRestrictScalarsAdj f).toComonad.ε.app N =
      (ModuleCat.extendRestrictScalarsAdj f).counit.app N) ∧
    ((ModuleCat.extendRestrictScalarsAdj f).toComonad.δ.app N =
      (ModuleCat.extendScalars f).map
        ((ModuleCat.extendRestrictScalarsAdj f).unit.app
          ((ModuleCat.restrictScalars f).obj N))) := by
  sorry

-- Partial prototype for overlap-comparison-canonical.
-- This identifies the comparison fields, not a constructed overlap equivalence.
theorem overlap_comparison_canonical {M M' : ModuleCat.{uB} R} (h : M ⟶ M') :
    (((Comonad.comparison (ModuleCat.extendRestrictScalarsAdj f)).obj M).A =
      (ModuleCat.extendScalars f).obj M) ∧
    (((Comonad.comparison (ModuleCat.extendRestrictScalarsAdj f)).obj M).a =
      (ModuleCat.extendScalars f).map
        ((ModuleCat.extendRestrictScalarsAdj f).unit.app M)) ∧
    (((Comonad.comparison (ModuleCat.extendRestrictScalarsAdj f)).map h).f =
      (ModuleCat.extendScalars f).map h) := by
  sorry

-- Four smoke examples; none substitutes for the omitted overlap tests.
example (K : (ModuleCat.extendRestrictScalarsAdj f).toComonad.Coalgebra) :
    K.a ≫ (ModuleCat.extendRestrictScalarsAdj f).toComonad.ε.app K.A = 𝟙 K.A := by
  sorry

example (K : (ModuleCat.extendRestrictScalarsAdj f).toComonad.Coalgebra) :
    K.a ≫ (ModuleCat.extendRestrictScalarsAdj f).toComonad.δ.app K.A =
      K.a ≫ (ModuleCat.extendRestrictScalarsAdj f).toComonad.map K.a := by
  sorry

example {K K' : (ModuleCat.extendRestrictScalarsAdj f).toComonad.Coalgebra}
    (h : K ⟶ K') :
    K.a ≫ (ModuleCat.extendRestrictScalarsAdj f).toComonad.map h.f =
      h.f ≫ K'.a := by
  sorry

example (K : (ModuleCat.extendRestrictScalarsAdj f).toComonad.Coalgebra) :
    (𝟙 K : K ⟶ K).f = 𝟙 K.A := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.ModuleDescentBridge

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.ModuleDescentAllTests

open CategoryTheory Opposite

universe uD

noncomputable section

-- Transport the pseudofunctor; this is not a second module category.
abbrev affineModulePullback :
    Pseudofunctor (LocallyDiscrete CommRingCat.{uD}ᵒᵖᵒᵖ) Cat :=
  (CategoryTheory.unopUnop CommRingCat.{uD}).toPseudofunctor.comp
    CommRingCat.moduleCatExtendScalarsPseudofunctor

variable {R A : Type uD} [CommRing R] [CommRing A]

abbrev NativeData (f : R →+* A) :=
  affineModulePullback.DescentData
    (fun (_ : PUnit) ↦ (CommRingCat.ofHom f).op)

-- The coalgebra carrier is retained.
abbrev NativeCoalgebra (f : R →+* A) :=
  (ModuleCat.extendRestrictScalarsAdj f).toComonad.Coalgebra

-- Projection helper to state the comparison's underlying-module compatibility.
def forgetNativeData (f : R →+* A) : NativeData f ⥤ ModuleCat.{uD} A := by
  sorry

-- R09.3/native-module-descent-coalgebra
-- Construct via DescentData'.descentDataEquivalence and the
-- module-specific chosen-overlap adapter; no arbitrary coherence assumption.
def nativeCoalgebraEquivalence (f : R →+* A) :
    NativeData f ≌ NativeCoalgebra f := by
  sorry

def nativeCoalgebraEquivalenceForget (f : R →+* A) :
    (nativeCoalgebraEquivalence f).functor ⋙
      Comonad.forget (ModuleCat.extendRestrictScalarsAdj f).toComonad ≅
    forgetNativeData f := by
  sorry

-- R09.3/native-module-canonical-comparison
def nativeCanonicalComparison (f : R →+* A) :
    affineModulePullback.toDescentData
        (fun (_ : PUnit) ↦ (CommRingCat.ofHom f).op) ⋙
      (nativeCoalgebraEquivalence f).functor ≅
    Comonad.comparison (ModuleCat.extendRestrictScalarsAdj f) := by
  sorry

-- R09.3/affine-module-descent-equivalence
-- This is the exact canonical-functor equivalence signature.
theorem nativeFaithfullyFlatDescent (f : R →+* A) (hf : f.FaithfullyFlat) :
    (affineModulePullback.toDescentData
      (fun (_ : PUnit) ↦ (CommRingCat.ofHom f).op)).IsEquivalence := by
  sorry

-- Smoke examples use objects and keep all module morphisms.
example (f : R →+* A) (M : ModuleCat.{uD} R) :
    Nonempty (((nativeCoalgebraEquivalence f).functor.obj
      ((affineModulePullback.toDescentData
        (fun (_ : PUnit) ↦ (CommRingCat.ofHom f).op)).obj M)) ≅
      (Comonad.comparison (ModuleCat.extendRestrictScalarsAdj f)).obj M) := by
  sorry

example (f : R →+* A) (D : NativeData f) :
    Nonempty ((nativeCoalgebraEquivalence f).inverse.obj
      ((nativeCoalgebraEquivalence f).functor.obj D) ≅ D) := by
  sorry

example (f : R →+* A) {M N : ModuleCat.{uD} R} (h : M ⟶ N) :
    ((affineModulePullback.toDescentData
      (fun (_ : PUnit) ↦ (CommRingCat.ofHom f).op)).map h).hom PUnit.unit =
      (ModuleCat.extendScalars f).map h := by
  sorry

end

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.ModuleDescentAllTests

/-! ## Layer R09.4: gerbes, abelian bandings, neutralizations and classification -/

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

variable {C : Type u} [Category.{v} C]

/-- Mathlib's IsStack alone does not impose groupoid fibres. -/
class IsGerbe (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
    (J : GrothendieckTopology C) : Prop extends F.IsStack J where
  isIso_hom : ∀ (U : C) {x y : F.obj (.mk (op U))} (f : x ⟶ y), IsIso f
  locallyNonempty : ∀ U : C, ∃ R : Sieve U, R ∈ J U ∧
    ∀ ⦃V : C⦄ (f : V ⟶ U), R f → Nonempty (F.obj (.mk (op V)))
  locallyIsomorphic : ∀ (U : C) (x y : F.obj (.mk (op U))),
    ∃ R : Sieve U, R ∈ J U ∧ ∀ ⦃V : C⦄ (f : V ⟶ U), R f →
      Nonempty ((F.map f.op.toLoc).toFunctor.obj x ≅
        (F.map f.op.toLoc).toFunctor.obj y)

variable {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
    {J : GrothendieckTopology C}

-- IsGerbe.toIsStack, isIso_hom, locallyNonempty and locallyIsomorphic are projections.
theorem IsGerbe.equivalence_iff (η : Pseudofunctor.StrongTrans F G)
    (hη : ∀ U : C, (η.app (.mk (op U))).toFunctor.IsEquivalence) :
    IsGerbe F J ↔ IsGerbe G J := by
  sorry

-- GerbeTests.twoComponents is stated on the constant point-site
-- pseudofunctor below, after BandFixtures.constantDiagram is available.

/-- The two compatibility equations are
equations on the restriction and automorphism maps. -/
structure AbelianBanding (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
    (J : GrothendieckTopology C) (A : Sheaf J AddCommGrpCat.{w})
    [IsGerbe F J] where
  autEquiv : ∀ (U : C) (x : F.obj (.mk (op U))),
    Multiplicative (A.obj.obj (op U)) ≃* Aut x
  pullback : ∀ {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op U)))
      (a : Multiplicative (A.obj.obj (op U))),
    (F.map f.op.toLoc).toFunctor.mapAut x (autEquiv U x a) =
      autEquiv V ((F.map f.op.toLoc).toFunctor.obj x)
        (Multiplicative.ofAdd ((A.obj.map f.op) (Multiplicative.toAdd a)))
  conjugation : ∀ (U : C) {x y : F.obj (.mk (op U))} (e : x ≅ y)
      (a : Multiplicative (A.obj.obj (op U))),
    Aut.autMulEquivOfIso e (autEquiv U x a) = autEquiv U y a

variable {A : Sheaf J AddCommGrpCat.{w}} [IsGerbe F J]

@[ext]
theorem AbelianBanding.ext (b b' : AbelianBanding F J A)
    (h : ∀ U x a, b.autEquiv U x a = b'.autEquiv U x a) : b = b' := by
  sorry

theorem banded_aut_commute (b : AbelianBanding F J A) (U : C)
    (x : F.obj (.mk (op U))) (a a' : Aut x) : a * a' = a' * a := by
  sorry

-- BandingTests.zero.
example (b : AbelianBanding F J A) (U : C)
    [Subsingleton (A.obj.obj (op U))] (x : F.obj (.mk (op U))) :
    ∀ a : Aut x, a = 1 := by
  sorry

-- BandingTests.conjugation: a chosen object isomorphism preserves the band.
example (b : AbelianBanding F J A) (U : C)
    {x y : F.obj (.mk (op U))} (e : x ≅ y)
    (a : Multiplicative (A.obj.obj (op U))) :
    Aut.autMulEquivOfIso e (b.autEquiv U x a) = b.autEquiv U y a := by
  sorry

-- BandingTests.nonabelian: S3 cannot satisfy this abelian-banding definition.
example (U : C) (x : F.obj (.mk (op U)))
    (e : Aut x ≃* Equiv.Perm (Fin 3)) :
    ¬ Nonempty (AbelianBanding F J A) := by
  sorry

theorem banding_iso_independent (U : C) {x y : F.obj (.mk (op U))}
    (hcomm : ∀ a a' : Aut x, a * a' = a' * a) (e e' : x ≅ y) :
    Aut.autMulEquivOfIso e = Aut.autMulEquivOfIso e' := by
  sorry

/-- An object over S is section data;
global neutrality below requires S to be terminal in the chosen site. -/
structure Neutralization (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}) (S : C) where
  obj : F.obj (.mk (op S))

def IsNeutral (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}) (S : C)
    (_hS : Limits.IsTerminal S) : Prop :=
  Nonempty (Neutralization F S)

theorem Neutralization.isNeutral (S : C) (hS : Limits.IsTerminal S) :
    IsNeutral F S hS ↔ Nonempty (F.obj (.mk (op S))) := by
  sorry

def Neutralization.pullback {S V : C} (f : V ⟶ S)
    (x : Neutralization F S) : Neutralization F V :=
  ⟨(F.map f.op.toLoc).toFunctor.obj x.obj⟩

-- NeutralizationTests.automorphisms: choosing an object retains inertia.
example (b : AbelianBanding F J A) (S : C) (x : Neutralization F S) :
    Nonempty (Multiplicative (A.obj.obj (op S)) ≃* Aut x.obj) := by
  sorry

variable [IsGerbe G J]

/-- Use the StrongTrans. -/
class BandPreserving (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) : Prop where
  map_band : ∀ (U : C) (x : F.obj (.mk (op U)))
      (a : Multiplicative (A.obj.obj (op U))),
    (η.app (.mk (op U))).toFunctor.mapAut x (bF.autEquiv U x a) =
      bG.autEquiv U ((η.app (.mk (op U))).toFunctor.obj x) a

theorem BandPreserving.id (b : AbelianBanding F J A) :
    BandPreserving b b (Pseudofunctor.StrongTrans.id F) := by
  sorry

theorem BandPreserving.comp
    {H : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe H J]
    (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (bH : AbelianBanding H J A)
    (η : Pseudofunctor.StrongTrans F G) (θ : Pseudofunctor.StrongTrans G H)
    [BandPreserving bF bG η] [BandPreserving bG bH θ] :
    BandPreserving bF bH (Pseudofunctor.StrongTrans.vcomp η θ) := by
  sorry

-- BandMorphismTests.identity.
example (b : AbelianBanding F J A) :
    BandPreserving b b (Pseudofunctor.StrongTrans.id F) := by
  sorry

theorem band_morphism_full_faithful
    (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] (U : C) :
    (η.app (.mk (op U))).toFunctor.Full ∧
      (η.app (.mk (op U))).toFunctor.Faithful := by
  sorry

theorem band_morphism_essential_surjective
    (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] (U : C) :
    (η.app (.mk (op U))).toFunctor.EssSurj := by
  sorry

theorem band_morphism_equivalence
    (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] (U : C) :
    (η.app (.mk (op U))).toFunctor.IsEquivalence := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeCohomology

open CategoryTheory.Abelian

variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
    [HasSheafify J AddCommGrpCat.{v}]
    [HasExt.{h} (Sheaf J AddCommGrpCat.{v})]
    {E : ShortComplex (Sheaf J AddCommGrpCat.{v})}

theorem injective_boundary_bijective (hE : E.ShortExact)
    [Injective E.X₂] :
    Function.Bijective (TauCeti.CategoryTheory.Sheaf.H.δ hE 1 2 rfl) := by
  sorry

-- The two vanishings needed for this statement are Mathlib facts.
example (I : Sheaf J AddCommGrpCat.{v}) [Injective I]
    (a : CategoryTheory.Sheaf.H I 1) : a = 0 := by
  sorry

example (I : Sheaf J AddCommGrpCat.{v}) [Injective I]
    (a : CategoryTheory.Sheaf.H I 2) : a = 0 := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeCohomology

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

universe uI vI

variable {I : Type uI} [Category.{vI} I]

/-- evaluated at one test object T.
The pseudo-diagram here is its diagram of fibre categories. In applications
I is a cofiltered poset and every fibre is a groupoid. This data construction
also makes sense for more general Cat-valued pseudo-diagrams. -/
structure GerbeLimitFamily (Φ : LocallyDiscrete I ⥤ᵖ Cat.{v', u'}) where
  component : ∀ i : I, Φ.obj (.mk i)
  transition : ∀ {i j : I} (f : i ⟶ j),
    (Φ.map f.toLoc).toFunctor.obj (component i) ≅ component j
  transition_id : ∀ i : I,
    (transition (𝟙 i)).hom =
      (Φ.mapId (.mk i)).hom.toNatTrans.app (component i)
  transition_comp : ∀ {i j k : I} (f : i ⟶ j) (g : j ⟶ k),
    (Φ.mapComp f.toLoc g.toLoc).hom.toNatTrans.app (component i) ≫
      (Φ.map g.toLoc).toFunctor.map (transition f).hom ≫
      (transition g).hom = (transition (f ≫ g)).hom

namespace GerbeLimitFamily

variable {Φ : LocallyDiscrete I ⥤ᵖ Cat.{v', u'}}

/-- Compatible component arrows; they are invertible when the fibres are
groupoids. This is the arrow data, before installing its category instance. -/
structure Hom (x y : GerbeLimitFamily Φ) where
  component : ∀ i : I, x.component i ⟶ y.component i
  naturality : ∀ {i j : I} (f : i ⟶ j),
    (Φ.map f.toLoc).toFunctor.map (component i) ≫ (y.transition f).hom =
      (x.transition f).hom ≫ component j

theorem hom_ext {x y : GerbeLimitFamily Φ} (f g : Hom x y)
    (h : ∀ i, f.component i = g.component i) : f = g := by
  sorry

-- API: GerbeLimitFamily.category. Keep the compatible arrows as Hom;
-- an opaque category instance would lose the componentwise interface.
instance category : Category (GerbeLimitFamily Φ) where
  Hom := Hom
  id x :=
    { component := fun i => 𝟙 (x.component i)
      naturality := by sorry }
  comp f g :=
    { component := fun i => f.component i ≫ g.component i
      naturality := by sorry }
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry

-- API: GerbeLimitFamily.evaluation.
def evaluation (i : I) : GerbeLimitFamily Φ ⥤ Φ.obj (.mk i) where
  obj x := x.component i
  map f := f.component i
  map_id := by sorry
  map_comp := by sorry

-- API: GerbeLimitFamily.isIso_of_components. No groupoid instance replaces
-- the category installed above: invertibility is proved in that category.
theorem isIso_of_components {x y : GerbeLimitFamily Φ} (f : x ⟶ y)
    (hf : ∀ i : I, IsIso (f.component i)) : IsIso f := by
  sorry

-- API: GerbeLimitFamily.pullback. A site restriction supplies such a strong
-- transformation between the two diagrams of fibre categories.
noncomputable def pullback {Ψ : LocallyDiscrete I ⥤ᵖ Cat.{v', u'}}
    (η : Pseudofunctor.StrongTrans Φ Ψ) :
    GerbeLimitFamily Φ ⥤ GerbeLimitFamily Ψ := by
  sorry

theorem pullback_component {Ψ : LocallyDiscrete I ⥤ᵖ Cat.{v', u'}}
    (η : Pseudofunctor.StrongTrans Φ Ψ) (x : GerbeLimitFamily Φ) (i : I) :
    ((pullback η).obj x).component i =
      (η.app (.mk i)).toFunctor.obj (x.component i) := by
  sorry

-- Unit and composition coherence are equations, not uninstantiated flags.
example (x : GerbeLimitFamily Φ) (i : I) :
    (x.transition (𝟙 i)).hom =
      (Φ.mapId (.mk i)).hom.toNatTrans.app (x.component i) := by
  sorry

example (x : GerbeLimitFamily Φ) {i j k : I} (f : i ⟶ j) (g : j ⟶ k) :
    (Φ.mapComp f.toLoc g.toLoc).hom.toNatTrans.app (x.component i) ≫
      (Φ.map g.toLoc).toFunctor.map (x.transition f).hom ≫
      (x.transition g).hom = (x.transition (f ≫ g)).hom := by
  sorry

end GerbeLimitFamily

namespace LimitFamilyTests

-- The singleton check uses an arbitrary pseudofunctor on the
-- one-object discrete index, including its possibly nontrivial unit data.
example (Φ : LocallyDiscrete (Discrete PUnit) ⥤ᵖ Cat.{v', u'}) :
    Nonempty (GerbeLimitFamily Φ ≌ Φ.obj (.mk (Discrete.mk PUnit.unit))) := by
  sorry

-- Retain the category of arrows of the constant groupoid, not just its
-- isomorphism-class set. IsCofiltered includes nonemptiness.
example [IsCofiltered I] (G : Type v') [Group G] :
    let Φ := ((Functor.const I).obj (Cat.of (SingleObj G))).toPseudofunctor'
    Nonempty (GerbeLimitFamily Φ ≌ SingleObj G) := by
  sorry

-- A concrete C3 calculation on the same compatible-family carrier.
-- The classifying-stack comparison is a separate geometric supplier input.
example :
    let Φ := ((Functor.const (Discrete PUnit)).obj
      (Cat.of (SingleObj (Multiplicative (ZMod 3))))).toPseudofunctor'
    Nonempty (GerbeLimitFamily Φ) ∧
      Subsingleton (Skeleton (GerbeLimitFamily Φ)) ∧
      ∀ x : GerbeLimitFamily Φ, Nat.card (x ⟶ x) = 3 := by
  sorry

end LimitFamilyTests

namespace CanonicalFactorTests

-- Fibre fixture for the notTarget non-example.
example :
    let f := (1 : PUnit →* Multiplicative (ZMod 2)).toFunctor
    f.Faithful ∧ ¬ f.Full ∧
      Nat.card (SingleObj.star PUnit ⟶ SingleObj.star PUnit) = 1 ∧
      Nat.card (SingleObj.star (Multiplicative (ZMod 2)) ⟶
        SingleObj.star (Multiplicative (ZMod 2))) = 2 := by
  sorry

end CanonicalFactorTests

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

/-! ## Layer R09.4 (continued): the intrinsic band, conjugation transport and fixtures -/

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

open CategoryTheory Opposite Bicategory

variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})

/-- R09.4/band-center-sections: compatible units of centers. -/
noncomputable def intrinsicBandSectionSubgroup (U : C) :
    Subgroup (∀ (V : C), (V ⟶ U) → (CatCenter (F.obj (.mk (op V))))ˣ) where
  carrier := {z | ∀ (V W : C) (f : V ⟶ U) (g : W ⟶ V)
      (x : F.obj (.mk (op V))),
    (F.map g.op.toLoc).toFunctor.map ((z V f).val.app x) =
      (z W (g ≫ f)).val.app ((F.map g.op.toLoc).toFunctor.obj x)}
  one_mem' := by
    intro V W f g x
    exact (F.map g.op.toLoc).toFunctor.map_id x
  mul_mem' := by
    intro s t hs ht V W f g x
    change (F.map g.op.toLoc).toFunctor.map
      ((t V f).val.app x ≫ (s V f).val.app x) =
      (t W (g ≫ f)).val.app _ ≫ (s W (g ≫ f)).val.app _
    rw [Functor.map_comp, hs V W f g x, ht V W f g x]
  inv_mem' := by
    intro s hs V W f g x
    let e := (Aut.unitsEndEquivAut (𝟭 (F.obj (.mk (op V)))) (s V f)).app x
    let e' := (Aut.unitsEndEquivAut (𝟭 (F.obj (.mk (op W)))) (s W (g ≫ f))).app
      ((F.map g.op.toLoc).toFunctor.obj x)
    have h : (F.map g.op.toLoc).toFunctor.mapIso e = e' := by
      apply Iso.ext
      exact hs V W f g x
    exact congrArg Iso.inv h

abbrev IntrinsicBandSection (U : C) := ↥(intrinsicBandSectionSubgroup F U)

namespace IntrinsicBandSections

/-- Construct a section from an vertically compatible family of center units. -/
noncomputable def mk {U : C}
    (z : ∀ (V : C), (V ⟶ U) → (CatCenter (F.obj (.mk (op V))))ˣ)
    (hz : ∀ (V W : C) (f : V ⟶ U) (g : W ⟶ V)
      (x : F.obj (.mk (op V))),
      (F.map g.op.toLoc).toFunctor.map ((z V f).val.app x) =
        (z W (g ≫ f)).val.app ((F.map g.op.toLoc).toFunctor.obj x)) :
    IntrinsicBandSection F U := by sorry

def val {U : C} (s : IntrinsicBandSection F U) (V : C) (f : V ⟶ U) :
    (CatCenter (F.obj (.mk (op V))))ˣ := s.val V f

theorem val_mk {U : C}
    (z : ∀ (V : C), (V ⟶ U) → (CatCenter (F.obj (.mk (op V))))ˣ)
    (hz : ∀ (V W : C) (f : V ⟶ U) (g : W ⟶ V)
      (x : F.obj (.mk (op V))),
      (F.map g.op.toLoc).toFunctor.map ((z V f).val.app x) =
        (z W (g ≫ f)).val.app ((F.map g.op.toLoc).toFunctor.obj x))
    (V : C) (f : V ⟶ U) : val F (mk F z hz) V f = z V f := by sorry

theorem val_one {U V : C} (f : V ⟶ U) :
    val F (1 : IntrinsicBandSection F U) V f = 1 := by sorry

theorem val_mul {U V : C} (s t : IntrinsicBandSection F U) (f : V ⟶ U) :
    val F (s * t) V f = val F s V f * val F t V f := by sorry

theorem val_inv {U V : C} (s : IntrinsicBandSection F U) (f : V ⟶ U) :
    val F s⁻¹ V f = (val F s V f)⁻¹ := by sorry

theorem compatible {U : C} (s : IntrinsicBandSection F U)
    (V W : C) (f : V ⟶ U) (g : W ⟶ V) (x : F.obj (.mk (op V))) :
    (F.map g.op.toLoc).toFunctor.map ((val F s V f).val.app x) =
      (val F s W (g ≫ f)).val.app ((F.map g.op.toLoc).toFunctor.obj x) := by
  exact s.property V W f g x

/-- R09.4/band-center-ext. -/
@[ext] theorem ext {U : C} (s t : IntrinsicBandSection F U)
    (h : ∀ (V : C) (f : V ⟶ U) (x : F.obj (.mk (op V))),
      (val F s V f).val.app x = (val F t V f).val.app x) : s = t := by
  apply Subtype.ext
  funext V f
  apply Units.ext
  exact CatCenter.ext _ _ (h V f)

/-- R09.4/band-center-commute; subgroup operations come from groups. -/
noncomputable instance commGroup (U : C) : CommGroup (IntrinsicBandSection F U) :=
  { (inferInstance : Group (IntrinsicBandSection F U)) with
    mul_comm := by
      intro s t
      apply Subtype.ext
      funext V f
      change s.val V f * t.val V f = t.val V f * s.val V f
      apply Units.ext
      apply CatCenter.ext
      intro x
      change ((s.val V f).val * (t.val V f).val).app x =
        ((t.val V f).val * (s.val V f).val).app x
      rw [CatCenter.mul_app', CatCenter.mul_app] }

/-- R09.4/band-center-restrict: reindex the family, not the fibre functor. -/
noncomputable def restrict {U V : C} (f : V ⟶ U) :
    IntrinsicBandSection F U →* IntrinsicBandSection F V where
  toFun s := ⟨fun W a ↦ s.val W (a ≫ f), by
    intro W X a g x
    simpa only [Category.assoc] using s.property W X (a ≫ f) g x⟩
  map_one' := by rfl
  map_mul' := by intros; rfl

theorem restrict_apply {U V W : C} (f : V ⟶ U)
    (s : IntrinsicBandSection F U) (a : W ⟶ V) :
    val F (restrict F f s) W a = val F s W (a ≫ f) := rfl

/-- R09.4/band-center-restrict-id. -/
theorem restrict_id {U : C} (s : IntrinsicBandSection F U) :
    restrict F (𝟙 U) s = s := by
  apply ext
  intro V f x
  simp only [restrict_apply, Category.comp_id]

/-- R09.4/band-center-restrict-comp. -/
theorem restrict_comp {U V W : C} (f : V ⟶ U) (g : W ⟶ V)
    (s : IntrinsicBandSection F U) :
    restrict F g (restrict F f s) = restrict F (g ≫ f) s := by
  apply ext
  intro X a x
  simp only [restrict_apply, Category.assoc]

/-- R09.4/band-center-evaluation. -/
noncomputable def eval {U V : C} (a : V ⟶ U) (x : F.obj (.mk (op V))) :
    IntrinsicBandSection F U →* Aut x where
  toFun s := (Aut.unitsEndEquivAut (𝟭 (F.obj (.mk (op V)))) (val F s V a)).app x
  map_one' := by apply Iso.ext; rfl
  map_mul' := by intros; apply Iso.ext; rfl

theorem eval_mul {U V : C} (a : V ⟶ U) (x : F.obj (.mk (op V)))
    (s t : IntrinsicBandSection F U) :
    eval F a x (s * t) = eval F a x s * eval F a x t := (eval F a x).map_mul s t

theorem eval_conjugation {U V : C} (a : V ⟶ U)
    {x y : F.obj (.mk (op V))} (e : x ≅ y) (s : IntrinsicBandSection F U) :
    Aut.autMulEquivOfIso e (eval F a x s) = eval F a y s := by
  apply Iso.ext
  change e.inv ≫ (val F s V a).val.app x ≫ e.hom = (val F s V a).val.app y
  rw [← CatCenter.naturality, e.inv_hom_id_assoc]

theorem eval_restrict {U V W : C} (a : V ⟶ U) (g : W ⟶ V)
    (x : F.obj (.mk (op V))) (s : IntrinsicBandSection F U) :
    (F.map g.op.toLoc).toFunctor.mapAut x (eval F a x s) =
      eval F (g ≫ a) ((F.map g.op.toLoc).toFunctor.obj x) s := by
  apply Iso.ext
  exact compatible F s V W a g x

/-- R09.4/band-center-evaluation-central. No gerbe or abelian-inertia assumption. -/
theorem eval_central {U V : C} (a : V ⟶ U) (x : F.obj (.mk (op V)))
    (s : IntrinsicBandSection F U) (b : Aut x) :
    eval F a x s * b = b * eval F a x s := by
  apply Iso.ext
  exact (val F s V a).val.naturality b.hom

/-- R09.4/band-center-evaluation-reindex: the same arrow in two slice presentations. -/
theorem eval_reindex {U V W : C} (f : V ⟶ U) (a : W ⟶ V)
    (x : F.obj (.mk (op W))) (s : IntrinsicBandSection F U) :
    eval F a x (restrict F f s) = eval F (a ≫ f) x s := rfl

/-- Packaging used by R09.4/band-center-sheaf. -/
noncomputable def presheaf : Cᵒᵖ ⥤ AddCommGrpCat.{max u v u' v'} where
  obj U := AddCommGrpCat.of (Additive (IntrinsicBandSection F U.unop))
  map f := AddCommGrpCat.ofHom (MonoidHom.toAdditive (restrict F f.unop))
  map_id := by
    intro U
    apply AddCommGrpCat.ext
    intro s
    exact restrict_id F s
  map_comp := by
    intro U V W f g
    apply AddCommGrpCat.ext
    intro s
    exact (restrict_comp F f.unop g.unop s).symm

/-- Local central families commute with the descent transitions. -/
theorem coverTransition {U : C} (R : Sieve U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U)))
    {Y : C} (q : Y ⟶ U) {i j : R.arrows.category}
    (f : Y ⟶ i.obj.left) (g : Y ⟶ j.obj.left)
    (hf : f ≫ i.obj.hom = q) (hg : g ≫ j.obj.hom = q) :
    (F.map f.op.toLoc).toFunctor.map
        (eval F (𝟙 i.obj.left) ((F.map i.obj.hom.op.toLoc).toFunctor.obj x) (z i)).hom ≫
        ((F.toDescentData (fun k : R.arrows.category => k.obj.hom)).obj x).hom q f g hf hg =
      ((F.toDescentData (fun k : R.arrows.category => k.obj.hom)).obj x).hom q f g hf hg ≫
        (F.map g.op.toLoc).toFunctor.map
          (eval F (𝟙 j.obj.left) ((F.map j.obj.hom.op.toLoc).toFunctor.obj x) (z j)).hom := by sorry

/-- An descent isomorphism, without effectivity assumptions. -/
noncomputable def coverIso {U : C} (R : Sieve U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) :
    Aut ((F.toDescentData (fun k : R.arrows.category => k.obj.hom)).obj x) := by sorry

theorem coverIso_hom_apply {U : C} (R : Sieve U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) (i : R.arrows.category) :
    (coverIso F R z hz x).hom.hom i =
      (eval F (𝟙 i.obj.left) ((F.map i.obj.hom.op.toLoc).toFunctor.obj x) (z i)).hom := by sorry

theorem coverIso_one {U : C} (R : Sieve U) (x : F.obj (.mk (op U))) :
    coverIso F R (fun _ => 1) (fun _ _ _ => map_one _) x = 1 := by sorry

theorem coverIso_inv {U : C} (R : Sieve U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) :
    coverIso F R (fun i => (z i)⁻¹)
      (fun i j g => by rw [map_inv, hz]) x = (coverIso F R z hz x)⁻¹ := by sorry

/-- Descend both arrows and inverse using the fully faithful functor. -/
noncomputable def coverAut (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) : Aut x := by sorry

theorem coverAut_map_hom (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) (i : R.arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.map (coverAut F J R hR z hz x).hom =
      (eval F (𝟙 i.obj.left) ((F.map i.obj.hom.op.toLoc).toFunctor.obj x) (z i)).hom := by sorry

theorem coverAut_unique (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) (a : Aut x)
    (ha : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.map a.hom =
        (eval F (𝟙 i.obj.left) ((F.map i.obj.hom.op.toLoc).toFunctor.obj x) (z i)).hom) :
    a = coverAut F J R hR z hz x := by sorry

theorem coverAut_one (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) (x : F.obj (.mk (op U))) :
    coverAut F J R hR (fun _ => 1) (fun _ _ _ => map_one _) x = 1 := by sorry

-- BandCoverTests.iso_one
example {U : C} (R : Sieve U) (x : F.obj (.mk (op U))) :
    coverIso F R (fun _ => 1) (fun _ _ _ => map_one _) x = 1 := by sorry

-- BandCoverTests.iso_inverse_component
example {U : C} (R : Sieve U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) (i : R.arrows.category) :
    (coverIso F R z hz x).inv.hom i =
      (eval F (𝟙 i.obj.left) ((F.map i.obj.hom.op.toLoc).toFunctor.obj x) (z i)).inv := by sorry

-- BandCoverTests.iso_empty
example {U : C} (R : Sieve U) [IsEmpty R.arrows.category]
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) : coverIso F R z hz x = 1 := by sorry

-- BandCoverTests.aut_one
example (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) (x : F.obj (.mk (op U))) :
    coverAut F J R hR (fun _ => 1) (fun _ _ _ => map_one _) x = 1 := by sorry

-- BandCoverTests.aut_existing
example (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (s : IntrinsicBandSection F U) (x : F.obj (.mk (op U))) :
    coverAut F J R hR (fun i => restrict F i.obj.hom s)
      (fun i j g => by rw [restrict_comp, Over.w g.hom]) x = eval F (𝟙 U) x s := by sorry

-- BandCoverTests.aut_trivial_inertia
example (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) [Subsingleton (Aut x)] :
    coverAut F J R hR z hz x = 1 := by sorry

/-- R09.4/band-center-cover-naturality: compare every fibre morphism on the cover. -/
theorem coverAut_naturality (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    {x y : F.obj (.mk (op U))} (f : x ⟶ y) :
    f ≫ (coverAut F J R hR z hz y).hom =
      (coverAut F J R hR z hz x).hom ≫ f := by sorry

/-- R09.4/band-center-cover-inverse: descend the inverse family with its matching proof. -/
theorem coverAut_inv (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) :
    coverAut F J R hR (fun i => (z i)⁻¹)
      (fun i j g => by rw [map_inv, hz]) x = (coverAut F J R hR z hz x)⁻¹ := by sorry

/-- R09.4/band-center-cover-center: the unit of the centre of F(U). -/
noncomputable def coverCenter (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i) :
    (CatCenter (F.obj (.mk (op U))))ˣ := by sorry

theorem coverCenter_app_hom (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) :
    (coverCenter F J R hR z hz).val.app x =
      (coverAut F J R hR z hz x).hom := by sorry

theorem coverCenter_app_inv (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) :
    (coverCenter F J R hR z hz).inv.app x =
      (coverAut F J R hR z hz x).inv := by sorry

theorem coverCenter_map_hom (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) (i : R.arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.map ((coverCenter F J R hR z hz).val.app x) =
      (val F (z i) i.obj.left (𝟙 i.obj.left)).val.app
        ((F.map i.obj.hom.op.toLoc).toFunctor.obj x) := by sorry

theorem coverCenter_one (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) :
    coverCenter F J R hR (fun _ => 1) (fun _ _ _ => map_one _) = 1 := by sorry

theorem coverCenter_inv (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i) :
    coverCenter F J R hR (fun i => (z i)⁻¹)
      (fun i j g => by rw [map_inv, hz]) = (coverCenter F J R hR z hz)⁻¹ := by sorry

/-- Uniqueness requires local component agreement at every x, not one chosen object. -/
theorem coverCenter_unique (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (a : (CatCenter (F.obj (.mk (op U))))ˣ)
    (ha : ∀ (x : F.obj (.mk (op U))) (i : R.arrows.category),
      (F.map i.obj.hom.op.toLoc).toFunctor.map (a.val.app x) =
        (val F (z i) i.obj.left (𝟙 i.obj.left)).val.app
          ((F.map i.obj.hom.op.toLoc).toFunctor.obj x)) :
    a = coverCenter F J R hR z hz := by sorry

theorem coverCenter_existing (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) (s : IntrinsicBandSection F U) :
    coverCenter F J R hR (fun i => restrict F i.obj.hom s)
      (fun i j g => by rw [restrict_comp, Over.w g.hom]) = val F s U (𝟙 U) := by sorry

-- BandCenterCoverTests.center_one
example (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) :
    coverCenter F J R hR (fun _ => 1) (fun _ _ _ => map_one _) = 1 := by sorry

-- BandCenterCoverTests.center_inverse
example (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i) :
    coverCenter F J R hR (fun i => (z i)⁻¹)
      (fun i j g => by rw [map_inv, hz]) = (coverCenter F J R hR z hz)⁻¹ := by sorry

-- BandCenterCoverTests.center_existing
example (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) (s : IntrinsicBandSection F U) :
    coverCenter F J R hR (fun i => restrict F i.obj.hom s)
      (fun i j g => by rw [restrict_comp, Over.w g.hom]) = val F s U (𝟙 U) := by sorry

-- BandCenterCoverTests.center_empty_fibre
example (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) [IsEmpty (F.obj (.mk (op U)))]
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i) : coverCenter F J R hR z hz = 1 := by sorry

/-- Base-change index into the original sieve's arrow category. -/
abbrev pullbackArrow {U V : C} (R : Sieve U) (a : V ⟶ U)
    (i : (R.pullback a).arrows.category) : R.arrows.category :=
  ⟨Over.mk (i.obj.hom ≫ a), i.property⟩

/-- Compose fibre restrictions through the pseudofunctor constraint. -/
theorem center_map_comp {V W X : C} (g : W ⟶ V) (h : X ⟶ W)
    (x : F.obj (.mk (op V))) (c : x ⟶ x)
    (z : CatCenter (F.obj (.mk (op X))))
    (hc : (F.map (h ≫ g).op.toLoc).toFunctor.map c =
      z.app ((F.map (h ≫ g).op.toLoc).toFunctor.obj x)) :
    (F.map h.op.toLoc).toFunctor.map ((F.map g.op.toLoc).toFunctor.map c) =
      z.app ((F.map h.op.toLoc).toFunctor.obj ((F.map g.op.toLoc).toFunctor.obj x)) := by sorry
/-- Fibre-centre component over every arrow a into the covered object. -/
noncomputable def coverCenterAt (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    {V : C} (a : V ⟶ U) : (CatCenter (F.obj (.mk (op V))))ˣ := by sorry
theorem coverCenterAt_map_hom (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    {V : C} (a : V ⟶ U) (x : F.obj (.mk (op V)))
    (i : (R.pullback a).arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.map ((coverCenterAt F J R hR z hz a).val.app x) =
      (val F (z (pullbackArrow R a i)) i.obj.left (𝟙 i.obj.left)).val.app
        ((F.map i.obj.hom.op.toLoc).toFunctor.obj x) := by sorry
/-- Arbitrary base restriction is detected on the pulled-back covering sieve. -/
theorem centerFamily_congr {U X : C} (R : Sieve U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (q q' : X ⟶ U) (hq : R q) (hq' : R q') (e : q = q') :
    z ⟨Over.mk q, hq⟩ = z ⟨Over.mk q', hq'⟩ := by sorry
theorem coverCenterAt_compatible (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    {V W : C} (a : V ⟶ U) (g : W ⟶ V) (x : F.obj (.mk (op V))) :
    (F.map g.op.toLoc).toFunctor.map ((coverCenterAt F J R hR z hz a).val.app x) =
      (coverCenterAt F J R hR z hz (g ≫ a)).val.app
        ((F.map g.op.toLoc).toFunctor.obj x) := by sorry
theorem coverCenterAt_one (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) {V : C} (a : V ⟶ U) :
    coverCenterAt F J R hR (fun _ => 1) (fun _ _ _ => map_one _) a = 1 := by sorry
theorem coverCenterAt_inv (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    {V : C} (a : V ⟶ U) :
    coverCenterAt F J R hR (fun i => (z i)⁻¹)
      (fun i j g => by rw [map_inv, hz]) a = (coverCenterAt F J R hR z hz a)⁻¹ := by sorry
/-- Compare the pulled-back fibre-centre unit to an already covered local section. -/
theorem coverCenterAt_of_mem (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (i : R.arrows.category) {V : C} (a : V ⟶ i.obj.left) :
    coverCenterAt F J R hR z hz (a ≫ i.obj.hom) = val F (z i) V a := by sorry
/-- The simultaneous family is now a section of the subgroup. -/
noncomputable def glue (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i) : IntrinsicBandSection F U := by sorry
theorem glue_val (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i) {V : C} (a : V ⟶ U) :
    val F (glue F J R hR z hz) V a = coverCenterAt F J R hR z hz a := by sorry
theorem glue_restrict (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i) (i : R.arrows.category) :
    restrict F i.obj.hom (glue F J R hR z hz) = z i := by sorry
theorem glue_one (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) :
    glue F J R hR (fun _ => 1) (fun _ _ _ => map_one _) = 1 := by sorry
theorem glue_inv (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i) :
    glue F J R hR (fun i => (z i)⁻¹) (fun i j g => by rw [map_inv, hz]) =
      (glue F J R hR z hz)⁻¹ := by sorry
theorem coverCenterAt_existing (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) (s : IntrinsicBandSection F U)
    {V : C} (a : V ⟶ U) :
    coverCenterAt F J R hR (fun i => restrict F i.obj.hom s)
      (fun i j g => by rw [restrict_comp, Over.w g.hom]) a = val F s V a := by sorry

/-- R09.4/band-center-sheaf: glue hom AND inverse via Hom sheaves. -/
theorem isSheaf (J : GrothendieckTopology C) [F.IsPrestack J]
    (hIso : ∀ (U : C) {x y : F.obj (.mk (op U))} (f : x ⟶ y), IsIso f) :
    Presheaf.IsSheaf J (presheaf F) := by sorry

variable (J : GrothendieckTopology C)

/-- Specific descent of evaluations, using the fully faithful descent functor. -/
theorem eval_eq_of_cover [F.IsPrestack J] {U V : C} (a : V ⟶ U)
    (x : F.obj (.mk (op V))) (s t : IntrinsicBandSection F U)
    (R : Sieve V) (hR : R ∈ J V)
    (h : ∀ (W : C) (g : W ⟶ V), R g →
      eval F (g ≫ a) ((F.map g.op.toLoc).toFunctor.obj x) s =
        eval F (g ≫ a) ((F.map g.op.toLoc).toFunctor.obj x) t) :
    eval F a x s = eval F a x t := by
  apply Iso.ext
  apply (F.isPrestackFor' R hR).fullyFaithful.map_injective
  apply Pseudofunctor.DescentData.hom_ext
  intro i
  change (F.map i.obj.hom.op.toLoc).toFunctor.map (eval F a x s).hom =
    (F.map i.obj.hom.op.toLoc).toFunctor.map (eval F a x t).hom
  have he := h i.obj.left i.obj.hom i.property
  rw [← eval_restrict, ← eval_restrict] at he
  exact congrArg Iso.hom he

/-- Joint injectivity on a covering sieve, not on one arbitrary arrow. -/
theorem ext_of_cover [F.IsPrestack J] {U : C} (s t : IntrinsicBandSection F U)
    (R : Sieve U) (hR : R ∈ J U)
    (h : ∀ (V : C) (f : V ⟶ U), R f → restrict F f s = restrict F f t) :
    s = t := by
  apply ext
  intro V a x
  have he := eval_eq_of_cover F J a x s t (Sieve.pullback a R)
    (J.pullback_stable a hR) (by
      intro W g hg
      have he := congrArg (eval F (𝟙 W) ((F.map g.op.toLoc).toFunctor.obj x))
        (h W (g ≫ a) hg)
      simpa only [eval_reindex, Category.id_comp] using he)
  exact congrArg Iso.hom he

theorem glue_unique [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (s : IntrinsicBandSection F U)
    (hs : ∀ i : R.arrows.category, restrict F i.obj.hom s = z i) :
    s = glue F J R hR z hz := by sorry
theorem glue_existing [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U)
    (s : IntrinsicBandSection F U) :
    glue F J R hR (fun i => restrict F i.obj.hom s)
      (fun i j g => by rw [restrict_comp, Over.w g.hom]) = s := by sorry
-- BandCenterPullbackTests.one
example [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U) {V : C} (a : V ⟶ U) :
    coverCenterAt F J R hR (fun _ => 1) (fun _ _ _ => map_one _) a = 1 := by sorry
-- BandCenterPullbackTests.inverse
example [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j), restrict F g.hom.left (z j) = z i)
    {V : C} (a : V ⟶ U) :
    coverCenterAt F J R hR (fun i => (z i)⁻¹) (fun i j g => by rw [map_inv, hz]) a =
      (coverCenterAt F J R hR z hz a)⁻¹ := by sorry
-- BandCenterPullbackTests.existing
example [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U)
    (s : IntrinsicBandSection F U) {V : C} (a : V ⟶ U) :
    coverCenterAt F J R hR (fun i => restrict F i.obj.hom s)
      (fun i j g => by rw [restrict_comp, Over.w g.hom]) a = val F s V a := by sorry
-- BandCenterGlueTests.one
example [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U) :
    glue F J R hR (fun _ => 1) (fun _ _ _ => map_one _) = 1 := by sorry
-- BandCenterGlueTests.inverse
example [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j), restrict F g.hom.left (z j) = z i) :
    glue F J R hR (fun i => (z i)⁻¹) (fun i j g => by rw [map_inv, hz]) =
      (glue F J R hR z hz)⁻¹ := by sorry
-- BandCenterGlueTests.existing
example [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U)
    (s : IntrinsicBandSection F U) :
    glue F J R hR (fun i => restrict F i.obj.hom s)
      (fun i j g => by rw [restrict_comp, Over.w g.hom]) = s := by sorry
/-- Sheaf descent for all prestacks; no groupoid assumption is necessary. -/
theorem isSheaf_of_prestack [F.IsPrestack J] :
    Presheaf.IsSheaf J (presheaf F) := by sorry

variable [hGerbe : IsGerbe F J]

include hGerbe in
/-- Concrete sheaf packaging; proof source is the preceding Hom-descent leaf. -/
noncomputable def sheaf : Sheaf J AddCommGrpCat.{max u v u' v'} where
  obj := presheaf F
  property := isSheaf F J (IsGerbe.isIso_hom (F := F) (J := J))

include hGerbe in
/-- R09.4/band-center-evaluation-injective. -/
theorem eval_injective (U : C) (x : F.obj (.mk (op U))) :
    Function.Injective (eval F (𝟙 U) x) := by
  intro s t h
  apply ext
  intro V a y
  have hp : eval F a ((F.map a.op.toLoc).toFunctor.obj x) s =
      eval F a ((F.map a.op.toLoc).toFunctor.obj x) t := by
    have he := congrArg ((F.map a.op.toLoc).toFunctor.mapAut x) h
    simpa only [eval_restrict, Category.comp_id] using he
  obtain ⟨R, hR, hloc⟩ := IsGerbe.locallyIsomorphic (F := F) (J := J)
    V ((F.map a.op.toLoc).toFunctor.obj x) y
  have hy := eval_eq_of_cover F J a y s t R hR (by
    intro W g hg
    obtain ⟨e⟩ := hloc g hg
    have he := congrArg ((F.map g.op.toLoc).toFunctor.mapAut
      ((F.map a.op.toLoc).toFunctor.obj x)) hp
    rw [eval_restrict, eval_restrict] at he
    rw [← eval_conjugation F (g ≫ a) e s, ← eval_conjugation F (g ≫ a) e t]
    exact congrArg (Aut.autMulEquivOfIso e) he)
  exact congrArg Iso.hom hy

variable (hComm : ∀ (U : C) (x : F.obj (.mk (op U))) (a b : Aut x), a * b = b * a)

include hGerbe hComm in
/-- R09.4/band-center-evaluation-surjective: local conjugation and refinements. -/
theorem eval_surjective (U : C) (x : F.obj (.mk (op U))) :
    Function.Surjective (eval F (𝟙 U) x) := by sorry

include hGerbe hComm in
/-- R09.4/band-center-evaluation-equivalence. -/
noncomputable def evalEquiv (U : C) (x : F.obj (.mk (op U))) :
    IntrinsicBandSection F U ≃* Aut x :=
  MulEquiv.ofBijective (eval F (𝟙 U) x)
    ⟨eval_injective F J U x, eval_surjective F J hComm U x⟩

theorem evalEquiv_apply (U : C) (x : F.obj (.mk (op U)))
    (s : IntrinsicBandSection F U) :
    evalEquiv F J hComm U x s = eval F (𝟙 U) x s := rfl

include hComm in
/-- R09.4/band-center-banding: reuse the banding structure. -/
noncomputable def banding : AbelianBanding F J (sheaf F J) where
  autEquiv U x :=
    { toFun a := evalEquiv F J hComm U x a.toAdd.toMul
      invFun a := Multiplicative.ofAdd (Additive.ofMul ((evalEquiv F J hComm U x).symm a))
      left_inv a := (evalEquiv F J hComm U x).left_inv a.toAdd.toMul
      right_inv a := (evalEquiv F J hComm U x).right_inv a
      map_mul' a b := (evalEquiv F J hComm U x).map_mul a.toAdd.toMul b.toAdd.toMul }
  pullback := by
    intro U V f x a
    let s : IntrinsicBandSection F U := a.toAdd.toMul
    change (F.map f.op.toLoc).toFunctor.mapAut x (eval F (𝟙 U) x s) =
      eval F (𝟙 V) ((F.map f.op.toLoc).toFunctor.obj x) (restrict F f s)
    apply Iso.ext
    change (F.map f.op.toLoc).toFunctor.map ((val F s U (𝟙 U)).val.app x) =
      (val F (restrict F f s) V (𝟙 V)).val.app _
    rw [restrict_apply, Category.id_comp]
    simpa only [Category.comp_id] using compatible F s U V (𝟙 U) f x
  conjugation := by
    intro U x y e a
    exact eval_conjugation F (𝟙 U) e a.toAdd.toMul

theorem banding_apply (U : C) (x : F.obj (.mk (op U)))
    (a : Multiplicative ((sheaf F J).obj.obj (op U))) :
    (banding F J hComm).autEquiv U x a = eval F (𝟙 U) x a.toAdd.toMul := rfl

variable {hComm}
variable (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)

/-- R09.4/band-coefficient-naturality: conjugation covers every fibre arrow. -/
theorem coefficient_naturality (U : C) {x y : F.obj (.mk (op U))}
    (f : x ⟶ y) (a : Multiplicative (A.obj.obj (op U))) :
    f ≫ (b.autEquiv U y a).hom = (b.autEquiv U x a).hom ≫ f := by
  let : IsIso f := IsGerbe.isIso_hom (F := F) (J := J) U f
  have h := congrArg Iso.hom (b.conjugation U (asIso f) a)
  change inv f ≫ (b.autEquiv U x a).hom ≫ f = (b.autEquiv U y a).hom at h
  rw [← h]
  simp only [← Category.assoc, IsIso.hom_inv_id, Category.id_comp]

/-- R09.4/band-coefficient-center: a hom into units of CatCenter. -/
noncomputable def coefficientCenter (U : C) :
    Multiplicative (A.obj.obj (op U)) →* (CatCenter (F.obj (.mk (op U))))ˣ where
  toFun a := (Aut.unitsEndEquivAut (𝟭 (F.obj (.mk (op U))))).symm
    (NatIso.ofComponents (fun x ↦ b.autEquiv U x a)
      (fun f ↦ coefficient_naturality F J A b U f a))
  map_one' := by
    apply Units.ext
    apply CatCenter.ext
    intro x
    change (b.autEquiv U x 1).hom = (1 : Aut x).hom
    rw [map_one]
  map_mul' := by
    intro a a'
    apply Units.ext
    apply CatCenter.ext
    intro x
    change (b.autEquiv U x (a * a')).hom = (b.autEquiv U x a').hom ≫
      (b.autEquiv U x a).hom
    rw [map_mul]
    rfl

/-- R09.4/band-coefficient-center-evaluation. -/
theorem coefficientCenter_app (U : C) (x : F.obj (.mk (op U)))
    (a : Multiplicative (A.obj.obj (op U))) :
    (Aut.unitsEndEquivAut (𝟭 (F.obj (.mk (op U))))
      (coefficientCenter F J A b U a)).app x = b.autEquiv U x a := by
  apply Iso.ext
  rfl

theorem coefficientCenter_inv (U : C) (a : Multiplicative (A.obj.obj (op U))) :
    coefficientCenter F J A b U a⁻¹ = (coefficientCenter F J A b U a)⁻¹ :=
  map_inv (coefficientCenter F J A b U) a

/-- R09.4/band-coefficient-restriction: the band pullback equation. -/
theorem coefficientCenter_restrict {U V : C} (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    (F.map f.op.toLoc).toFunctor.map ((coefficientCenter F J A b U a).val.app x) =
      (coefficientCenter F J A b V
        (Multiplicative.ofAdd (A.obj.map f.op a.toAdd))).val.app
          ((F.map f.op.toLoc).toFunctor.obj x) := by
  exact congrArg Iso.hom (b.pullback f x a)

/-- R09.4/band-center-from-banding: its values are band automorphisms. -/
noncomputable def fromBanding (b : AbelianBanding F J A) (U : C) :
    Multiplicative (A.obj.obj (op U)) →* IntrinsicBandSection F U where
  toFun a := ⟨fun V f ↦ coefficientCenter F J A b V
    (Multiplicative.ofAdd (A.obj.map f.op a.toAdd)), by
      intro V W f g x
      rw [coefficientCenter_restrict]
      congr 3
      exact (congrArg (fun h ↦ h a.toAdd) (A.obj.map_comp f.op g.op)).symm⟩
  map_one' := by
    apply ext
    intro V f x
    change (b.autEquiv V x (Multiplicative.ofAdd (A.obj.map f.op 0))).hom =
      (1 : Aut x).hom
    rw [map_zero]
    exact congrArg Iso.hom (b.autEquiv V x).map_one
  map_mul' := by
    intro a a'
    apply ext
    intro V f x
    change (b.autEquiv V x (Multiplicative.ofAdd (A.obj.map f.op
      (a.toAdd + a'.toAdd)))).hom =
      (b.autEquiv V x (Multiplicative.ofAdd (A.obj.map f.op a'.toAdd))).hom ≫
      (b.autEquiv V x (Multiplicative.ofAdd (A.obj.map f.op a.toAdd))).hom
    rw [map_add]
    exact congrArg Iso.hom ((b.autEquiv V x).map_mul
      (Multiplicative.ofAdd (A.obj.map f.op a.toAdd))
      (Multiplicative.ofAdd (A.obj.map f.op a'.toAdd)))

/-- R09.4/band-center-from-banding-evaluation. -/
theorem fromBanding_eval {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op V)))
    (a : Multiplicative (A.obj.obj (op U))) :
    eval F f x (fromBanding F J A b U a) =
      b.autEquiv V x (Multiplicative.ofAdd (A.obj.map f.op a.toAdd)) :=
  coefficientCenter_app F J A b V x _

/-- R09.4/band-center-from-banding-restriction. -/
theorem fromBanding_restrict {U V : C} (f : V ⟶ U)
    (a : Multiplicative (A.obj.obj (op U))) :
    restrict F f (fromBanding F J A b U a) =
      fromBanding F J A b V (Multiplicative.ofAdd (A.obj.map f.op a.toAdd)) := by
  apply ext
  intro W g x
  change (b.autEquiv W x (Multiplicative.ofAdd (A.obj.map (g ≫ f).op a.toAdd))).hom =
    (b.autEquiv W x (Multiplicative.ofAdd (A.obj.map g.op (A.obj.map f.op a.toAdd)))).hom
  exact congrArg (fun z ↦ (b.autEquiv W x (Multiplicative.ofAdd z)).hom)
    (congrArg (fun h ↦ h a.toAdd) (A.obj.map_comp f.op g.op))

/-- Local nonemptiness detects the fixed-band coefficient, even if F(U) is empty. -/
theorem fromBanding_injective (U : C) :
    Function.Injective (fromBanding F J A b U) := by
  intro a a' he
  change a.toAdd = a'.toAdd
  have hs := (isSheaf_iff_isSheaf_of_type J _).1
    (Presheaf.isSheaf_comp_of_isSheaf J A.obj
      (forget AddCommGrpCat.{max u v u' v'}) A.property)
  obtain ⟨R, hR, hloc⟩ := IsGerbe.locallyNonempty (F := F) (J := J) U
  apply (hs.isSeparated R hR).ext
  intro V f hf
  obtain ⟨x⟩ := hloc f hf
  have hh := congrArg (eval F f x) he
  rw [fromBanding_eval, fromBanding_eval] at hh
  exact congrArg Multiplicative.toAdd ((b.autEquiv V x).injective hh)

/-- R09.4/band-center-from-banding-ext: determine the comparison section. -/
theorem fromBanding_ext (U : C) (a : Multiplicative (A.obj.obj (op U)))
    (s : IntrinsicBandSection F U)
    (h : ∀ (V : C) (f : V ⟶ U) (x : F.obj (.mk (op V))),
      eval F f x s = b.autEquiv V x (Multiplicative.ofAdd (A.obj.map f.op a.toAdd))) :
    s = fromBanding F J A b U a := by
  apply ext
  intro V f x
  exact congrArg Iso.hom ((h V f x).trans (fromBanding_eval F J A b f x a).symm)

/-- R09.4/band-center-from-banding-presheaf: a natural transformation. -/
noncomputable def fromBandingPresheaf : A.obj ⟶ presheaf F where
  app U := AddCommGrpCat.ofHom
    { toFun a := Additive.ofMul (fromBanding F J A b U.unop (Multiplicative.ofAdd a))
      map_zero' := (fromBanding F J A b U.unop).map_one
      map_add' a a' := (fromBanding F J A b U.unop).map_mul
        (Multiplicative.ofAdd a) (Multiplicative.ofAdd a') }
  naturality U V f := by
    apply AddCommGrpCat.ext
    intro a
    exact (fromBanding_restrict F J A b f.unop (Multiplicative.ofAdd a)).symm

theorem fromBandingPresheaf_app (U : C) (a : A.obj.obj (op U)) :
    ((fromBandingPresheaf F J A b).app (op U) a).toMul =
      fromBanding F J A b U (Multiplicative.ofAdd a) := rfl

theorem fromBandingPresheaf_naturality {U V : C} (f : V ⟶ U) :
    A.obj.map f.op ≫ (fromBandingPresheaf F J A b).app (op V) =
      (fromBandingPresheaf F J A b).app (op U) ≫ (presheaf F).map f.op :=
  (fromBandingPresheaf F J A b).naturality f.op

/-- R09.4/band-center-fixed-band-distinction: no quotient by coefficient symmetry. -/
theorem fromBanding_ne_of_aut_ne (b' : AbelianBanding F J A) (U : C)
    (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U)))
    (h : b.autEquiv U x a ≠ b'.autEquiv U x a) :
    fromBanding F J A b U a ≠ fromBanding F J A b' U a := by
  intro hs
  apply h
  have he := congrArg (eval F (𝟙 U) x) hs
  rw [fromBanding_eval, fromBanding_eval] at he
  rw [op_id, A.obj.map_id] at he
  exact he

/-- R09.4/band-center-band-unique. Local gerbe objects prove local bijectivity;
the coefficient sheaf glues the inverse even when F(U) is empty. -/
theorem band_unique : ∃! e : A ≅ sheaf F J,
    ∀ (U : C) (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))),
      eval F (𝟙 U) x (((Sheaf.homEquiv e.hom).app (op U)) a.toAdd).toMul =
        b.autEquiv U x a := by sorry

-- BandCenterTests.centralImage: also applies to nonabelian fibre groups.
example {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op V)))
    (s : IntrinsicBandSection F U) (b : Aut x) :
    eval F f x s * b = b * eval F f x s := eval_central F f x s b

-- BandEvaluationTests.reindexedArrow: restrictions use the composite arrow.
example {U V W : C} (f : V ⟶ U) (a : W ⟶ V)
    (x : F.obj (.mk (op W))) (s : IntrinsicBandSection F U) :
    eval F a x (restrict F f s) = eval F (a ≫ f) x s := eval_reindex F f a x s

end IntrinsicBandSections

namespace IntrinsicBandTestsRT
open IntrinsicBandSections
variable (J : GrothendieckTopology C) [hGerbe : IsGerbe F J]
include hGerbe

-- BandEvaluationTests.generator, in fixed C3 coordinates.
example (hComm : ∀ (U : C) (x : F.obj (.mk (op U))) (a b : Aut x), a * b = b * a)
    (U : C) (x : F.obj (.mk (op U))) (e : Aut x ≃* Multiplicative (ZMod 3)) :
    ∃ s : IntrinsicBandSection F U,
      e (eval F (𝟙 U) x s) = Multiplicative.ofAdd (1 : ZMod 3) := by sorry

-- BandCenterTests.identity, conditional on the displayed trivial inertia.
example (U : C) (x : F.obj (.mk (op U))) (h : Subsingleton (Aut x)) :
    Subsingleton (IntrinsicBandSection F U) := by
  let := h
  exact (eval_injective F J U x).subsingleton

-- BandEvaluationTests.noncentral, with the transposition coordinate.
example (U : C) (x : F.obj (.mk (op U)))
    (e : Aut x ≃* Equiv.Perm (Fin 3)) (s : IntrinsicBandSection F U) :
    e (eval F (𝟙 U) x s) ≠ Equiv.swap (0 : Fin 3) 1 := by
  intro h
  have hc := congrArg e (eval_central F (𝟙 U) x s
    (e.symm (Equiv.swap (1 : Fin 3) 2)))
  simp only [map_mul, MulEquiv.apply_symm_apply, h] at hc
  have hn : Equiv.swap (0 : Fin 3) 1 * Equiv.swap (1 : Fin 3) 2 ≠
      Equiv.swap (1 : Fin 3) 2 * Equiv.swap (0 : Fin 3) 1 := by decide
  exact hn hc

example {U V W : C} (f : V ⟶ U) (g : W ⟶ V) (s : IntrinsicBandSection F U) :
    restrict F g (restrict F f s) = restrict F (g ≫ f) s := by
  apply ext
  intro X a x
  simp only [restrict_apply, Category.assoc]

example {U V : C} (f : V ⟶ U) {x y : F.obj (.mk (op V))}
    (e e' : x ≅ y) (s : IntrinsicBandSection F U) :
    Aut.autMulEquivOfIso e (eval F f x s) =
      Aut.autMulEquivOfIso e' (eval F f x s) := by
  rw [eval_conjugation, eval_conjugation]

example (hComm : ∀ (U : C) (x : F.obj (.mk (op U))) (a b : Aut x), a * b = b * a)
    (U : C) (x : F.obj (.mk (op U))) (e : Aut x ≃* Multiplicative (ZMod 3)) :
    ¬ Subsingleton (IntrinsicBandSection F U) := by sorry

-- BandCenterTests.C3, in the chosen automorphism coordinate.
example (hComm : ∀ (U : C) (x : F.obj (.mk (op U))) (a b : Aut x), a * b = b * a)
    (U : C) (x : F.obj (.mk (op U))) (e : Aut x ≃* Multiplicative (ZMod 3)) :
    Nat.card (IntrinsicBandSection F U) = 3 := by sorry

-- BandCenterTests.S3: evaluation lands in the trivial center.
example (U : C) (x : F.obj (.mk (op U)))
    (e : Aut x ≃* Equiv.Perm (Fin 3)) :
    Nat.card (IntrinsicBandSection F U) = 1 := by sorry

-- BandRestrictionTests.id applies, in particular, to the nonzero C3 section.
example (U : C) (s : IntrinsicBandSection F U) : restrict F (𝟙 U) s = s := by
  apply ext
  intro V f x
  simp only [restrict_apply, Category.comp_id]

-- BandComparisonTests.inversion: distinct fixed-band coordinates stay distinct.
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b b' : AbelianBanding F J A)
    (U : C) (x : F.obj (.mk (op U)))
    (e : Multiplicative (A.obj.obj (op U)) ≃* Multiplicative (ZMod 3))
    (h : b'.autEquiv U x (e.symm (Multiplicative.ofAdd (1 : ZMod 3))) =
      b.autEquiv U x (e.symm (Multiplicative.ofAdd (2 : ZMod 3)))) :
    fromBanding F J A b U (e.symm (Multiplicative.ofAdd (1 : ZMod 3))) ≠
      fromBanding F J A b' U (e.symm (Multiplicative.ofAdd (1 : ZMod 3))) := by
  apply fromBanding_ne_of_aut_ne
  rw [h]
  intro he
  have hc := congrArg e ((b.autEquiv U x).injective he)
  simp only [MulEquiv.apply_symm_apply] at hc
  exact (by decide : Multiplicative.ofAdd (1 : ZMod 3) ≠
    Multiplicative.ofAdd (2 : ZMod 3)) hc

-- BandCoefficientTests.generator: chosen C3 coordinate, retaining the band.
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    (U : C) (x : F.obj (.mk (op U)))
    (a : Multiplicative (A.obj.obj (op U)))
    (e : Aut x ≃* Multiplicative (ZMod 3))
    (h : e (b.autEquiv U x a) = Multiplicative.ofAdd (1 : ZMod 3)) :
    e ((Aut.unitsEndEquivAut (𝟭 (F.obj (.mk (op U))))
      (coefficientCenter F J A b U a)).app x) = Multiplicative.ofAdd (1 : ZMod 3) := by
  rw [coefficientCenter_app]
  exact h

-- BandCoefficientTests.zero: zero coefficient is the identity at every object.
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    (U : C) : coefficientCenter F J A b U (Multiplicative.ofAdd 0) = 1 :=
  (coefficientCenter F J A b U).map_one

-- BandCoefficientTests.inversion: inverse is 2, rather than 1, in C3.
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    (U : C) (x : F.obj (.mk (op U)))
    (a : Multiplicative (A.obj.obj (op U)))
    (e : Aut x ≃* Multiplicative (ZMod 3))
    (h : e (b.autEquiv U x a) = Multiplicative.ofAdd (1 : ZMod 3)) :
    e ((Aut.unitsEndEquivAut (𝟭 (F.obj (.mk (op U))))
      (coefficientCenter F J A b U a⁻¹)).app x) = Multiplicative.ofAdd (2 : ZMod 3) := by
  rw [coefficientCenter_app, map_inv, map_inv, h]
  rfl

-- BandNaturalityTests.allArrows: no representative object or chosen arrow is used.
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    (U : C) {x y : F.obj (.mk (op U))} (f : x ⟶ y)
    (a : Multiplicative (A.obj.obj (op U))) :
    f ≫ (b.autEquiv U y a).hom = (b.autEquiv U x a).hom ≫ f :=
  coefficient_naturality F J A b U f a

-- BandCoefficientRestrictionTests.mappedObject: evaluate at the pullback.
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op U)))
    (a : Multiplicative (A.obj.obj (op U))) :
    (F.map f.op.toLoc).toFunctor.mapAut x
      ((Aut.unitsEndEquivAut (𝟭 (F.obj (.mk (op U))))
        (coefficientCenter F J A b U a)).app x) =
      b.autEquiv V ((F.map f.op.toLoc).toFunctor.obj x)
        (Multiplicative.ofAdd (A.obj.map f.op a.toAdd)) := by
  rw [coefficientCenter_app]
  exact b.pullback f x a

-- BandComparisonPresheafTests.zero: the natural-transformation component.
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    (U : C) : (fromBandingPresheaf F J A b).app (op U) 0 = 0 := by
  change fromBanding F J A b U 1 = 1
  exact (fromBanding F J A b U).map_one

-- BandComparisonPresheafTests.add: coefficient addition is section multiplication.
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    (U : C) (a a' : A.obj.obj (op U)) :
    ((fromBandingPresheaf F J A b).app (op U) (a + a')).toMul =
      fromBanding F J A b U (Multiplicative.ofAdd a) *
        fromBanding F J A b U (Multiplicative.ofAdd a') := by
  exact (fromBanding F J A b U).map_mul (Multiplicative.ofAdd a)
    (Multiplicative.ofAdd a')

-- BandComparisonPresheafTests.restriction: preserves the chosen base arrow.
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    {U V : C} (f : V ⟶ U) (a : A.obj.obj (op U)) :
    restrict F f (((fromBandingPresheaf F J A b).app (op U) a).toMul) =
      ((fromBandingPresheaf F J A b).app (op V) (A.obj.map f.op a)).toMul :=
  fromBanding_restrict F J A b f (Multiplicative.ofAdd a)

-- BandLocalityTests.cover: true covering-sieve joint injectivity.
example {U : C} (s t : IntrinsicBandSection F U)
    (R : Sieve U) (hR : R ∈ J U)
    (h : ∀ (V : C) (f : V ⟶ U), R f → restrict F f s = restrict F f t) :
    s = t := ext_of_cover F J s t R hR h

-- BandLocalityTests.nonabelian: no commutativity assumption occurs.
example (U : C) (x : F.obj (.mk (op U))) (s t : IntrinsicBandSection F U)
    (h : eval F (𝟙 U) x s = eval F (𝟙 U) x t) : s = t :=
  eval_injective F J U x h

-- BandCoefficientDetectionTests.noGlobalChoice: no x over U is supplied.
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    (U : C) (a a' : Multiplicative (A.obj.obj (op U)))
    (h : fromBanding F J A b U a = fromBanding F J A b U a') : a = a' :=
  fromBanding_injective F J A b U h

-- BandLocalityTests.disconnected: only the finite coordinate consequence.
-- This is not an elaborated classifying-stack or point-site fixture.
example : ¬ Function.Injective (fun z : ZMod 3 × ZMod 3 ↦ z.1) := by
  intro h
  have he : ((0, 0) : ZMod 3 × ZMod 3) = (0, 1) := h rfl
  have hn : (0 : ZMod 3) ≠ 1 := by decide
  exact hn (congrArg Prod.snd he)

-- BandLocalityTests.singleReduction: ring reduction is not injective.
-- This does not assert that this one arrow is a covering sieve.
example : ¬ Function.Injective
    (ZMod.castHom (show 2 ∣ 4 from ⟨2, rfl⟩) (ZMod 2)) := by
  intro h
  have he := h (by decide :
    ZMod.castHom (show 2 ∣ 4 from ⟨2, rfl⟩) (ZMod 2) (0 : ZMod 4) =
      ZMod.castHom (show 2 ∣ 4 from ⟨2, rfl⟩) (ZMod 2) (2 : ZMod 4))
  exact (by decide : (0 : ZMod 4) ≠ 2) he

end IntrinsicBandTestsRT
end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry
variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})

namespace GerbeAutTransport

set_option backward.isDefEq.respectTransparency false

open Pseudofunctor.LocallyDiscreteOpToCat

variable {D : Type*} [Category D]

/-- Abelian inertia makes conjugation independent of the chosen object isomorphism. -/
theorem conjugation_independent {x y : D}
    (hcomm : ∀ a b : Aut x, a * b = b * a) (e e' : x ≅ y) :
    Aut.autMulEquivOfIso e = Aut.autMulEquivOfIso e' := by
  sorry

/-- The overlap equation uses arbitrary comparison isomorphisms, not a coherent choice. -/
theorem conjugates_commute {x₁ x₂ y₁ y₂ : D}
    (hcomm : ∀ a b : Aut x₁, a * b = b * a)
    (e₁ : x₁ ≅ y₁) (e₂ : x₂ ≅ y₂) (c : x₁ ≅ x₂) (d : y₁ ≅ y₂)
    (a₁ : Aut x₁) (a₂ : Aut x₂)
    (ha : a₁.hom ≫ c.hom = c.hom ≫ a₂.hom) :
    (Aut.autMulEquivOfIso e₁ a₁).hom ≫ d.hom =
      d.hom ≫ (Aut.autMulEquivOfIso e₂ a₂).hom := by
  sorry

variable {E : Type*} [Category E]

theorem map_conjugation (K : D ⥤ E) {x y : D} (e : x ≅ y) (a : Aut x) :
    K.mapAut y (Aut.autMulEquivOfIso e a) =
      Aut.autMulEquivOfIso (K.mapIso e) (K.mapAut x a) := by
  sorry

theorem map_conjugation_hom (K : D ⥤ E) {x y : D} (e : x ≅ y) (a : Aut x) :
    (Aut.autMulEquivOfIso (K.mapIso e) (K.mapAut x a)).hom =
      K.map (Aut.autMulEquivOfIso e a).hom := by
  sorry

variable (hComm : ∀ (V : C) (z : F.obj (.mk (op V))),
  ∀ a b : Aut z, a * b = b * a)

include hComm

set_option backward.isDefEq.respectTransparency.types false in
/-- Conjugation on an arbitrary covering family is a descent automorphism. -/
noncomputable def conjugateDescentIso
    (hComm : ∀ (V : C) (z : F.obj (.mk (op V))), ∀ a b : Aut z, a * b = b * a)
    {U : C} (R : Sieve U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) :
    Aut ((F.toDescentData (fun i : R.arrows.category => i.obj.hom)).obj y) := by
  sorry

/-- Lift the specific local conjugates, using full faithfulness of morphism descent. -/
noncomputable def conjugateCoverAut
    (hComm : ∀ (V : C) (z : F.obj (.mk (op V))), ∀ a b : Aut z, a * b = b * a)
    (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) : Aut y := by
  sorry

variable (J : GrothendieckTopology C) [F.IsPrestack J]

theorem conjugateCoverAut_map {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) (i : R.arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.map (conjugateCoverAut F hComm J R hR x y e a).hom =
      (Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a)).hom := by
  sorry

theorem conjugateCoverAut_mapIso {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) (i : R.arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.mapAut y
        (conjugateCoverAut F hComm J R hR x y e a) =
      Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a) := by
  sorry

theorem conjugateCoverAut_unique {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) (b : Aut y)
    (hb : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.mapAut y b =
        Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a)) :
    b = conjugateCoverAut F hComm J R hR x y e a := by
  sorry

theorem conjugateCoverAut_independent {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e e' : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) :
    conjugateCoverAut F hComm J R hR x y e a =
      conjugateCoverAut F hComm J R hR x y e' a := by
  sorry

/-- The descended conjugation is a group homomorphism, with its multiplication law. -/
noncomputable def conjugateCoverHom
    (hComm : ∀ (V : C) (z : F.obj (.mk (op V))), ∀ a b : Aut z, a * b = b * a)
    (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) : Aut x →* Aut y := by
  sorry

theorem conjugateCoverAut_of_iso {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) (d : x ≅ y) :
    conjugateCoverAut F hComm J R hR x y e a = Aut.autMulEquivOfIso d a := by
  sorry

variable {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y)

theorem conjugateDescentIso_hom_apply (a : Aut x) (i : R.arrows.category) :
    (conjugateDescentIso F hComm R x y e a).hom.hom i =
      (Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a)).hom := by
  sorry

theorem conjugateDescentIso_one : conjugateDescentIso F hComm R x y e 1 = 1 := by
  sorry

theorem conjugateDescentIso_inv (a : Aut x) :
    conjugateDescentIso F hComm R x y e a⁻¹ = (conjugateDescentIso F hComm R x y e a)⁻¹ := by
  sorry

theorem conjugateCoverHom_apply (a : Aut x) :
    conjugateCoverHom F hComm J R hR x y e a = conjugateCoverAut F hComm J R hR x y e a := by
  sorry

theorem conjugateCoverHom_one : conjugateCoverHom F hComm J R hR x y e 1 = 1 := by
  sorry

theorem conjugateCoverHom_mul (a b : Aut x) :
    conjugateCoverHom F hComm J R hR x y e (a * b) =
      conjugateCoverHom F hComm J R hR x y e a * conjugateCoverHom F hComm J R hR x y e b := by
  sorry

theorem conjugateCoverHom_inv (a : Aut x) :
    conjugateCoverHom F hComm J R hR x y e a⁻¹ = (conjugateCoverHom F hComm J R hR x y e a)⁻¹ := by
  sorry

-- GerbeConjugateDescentTests.local: the prescribed component is recovered.
example (a : Aut x) (i : R.arrows.category) :
    (conjugateDescentIso F hComm R x y e a).hom.hom i =
      (Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a)).hom := by
  sorry

-- GerbeConjugateDescentTests.identity: no spurious local arrow appears at the unit.
example : conjugateDescentIso F hComm R x y e 1 = 1 := by
  sorry

-- GerbeConjugateDescentTests.inverse: the inverse descent arrow is retained.
example (a : Aut x) :
    conjugateDescentIso F hComm R x y e a⁻¹ = (conjugateDescentIso F hComm R x y e a)⁻¹ := by
  sorry

-- GerbeConjugateCoverTests.local: full faithfulness recovers the local automorphism.
example (a : Aut x) (i : R.arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.mapAut y (conjugateCoverAut F hComm J R hR x y e a) =
      Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a) := by
  sorry

-- GerbeConjugateCoverTests.unique: descent must reflect all components.
example (a : Aut x) (b : Aut y)
    (hb : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.mapAut y b =
        Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a)) :
    b = conjugateCoverAut F hComm J R hR x y e a := by
  sorry

-- GerbeConjugateCoverTests.changeChoice: arbitrary local choices give the same result.
example (a : Aut x)
    (e' : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) :
    conjugateCoverAut F hComm J R hR x y e a = conjugateCoverAut F hComm J R hR x y e' a := by
  sorry

-- GerbeConjugateCoverTests.globalIso: compare with the Mathlib conjugation.
example (a : Aut x) (d : x ≅ y) :
    conjugateCoverAut F hComm J R hR x y e a = Aut.autMulEquivOfIso d a := by
  sorry

-- GerbeConjugateHomTests.identity: the group homomorphism preserves the unit.
example : conjugateCoverHom F hComm J R hR x y e 1 = 1 := by
  sorry

-- GerbeConjugateHomTests.product: multiplication order agrees with Aut.
example (a b : Aut x) :
    conjugateCoverHom F hComm J R hR x y e (a * b) =
      conjugateCoverHom F hComm J R hR x y e a * conjugateCoverHom F hComm J R hR x y e b := by
  sorry

-- GerbeConjugateHomTests.inverse: the inverse law belongs to the group homomorphism.
example (a : Aut x) :
    conjugateCoverHom F hComm J R hR x y e a⁻¹ = (conjugateCoverHom F hComm J R hR x y e a)⁻¹ := by
  sorry

-- GerbeConjugateHomTests.equalObject: every choice of local x-to-x isomorphism fixes a.
example (a : Aut x)
    (e₀ : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj x) :
    conjugateCoverHom F hComm J R hR x x e₀ a = a := by
  sorry

end GerbeAutTransport

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeAutTransport
variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
variable (hComm : ∀ (V : C) (z : F.obj (.mk (op V))),
  ∀ a b : Aut z, a * b = b * a)
variable (J : GrothendieckTopology C) [F.IsPrestack J]
include hComm
theorem conjugateCoverAut_refinement {U : C} (R S : Sieve U)
    (hR : R ∈ J U) (hS : S ∈ J U) (hRS : R ≤ S)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y)
    (d : ∀ i : S.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) :
    conjugateCoverAut F hComm J R hR x y e a =
      conjugateCoverAut F hComm J S hS x y d a := by
  sorry

theorem conjugateCoverAut_cover_independent {U : C} (R S : Sieve U)
    (hR : R ∈ J U) (hS : S ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y)
    (d : ∀ i : S.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) :
    conjugateCoverAut F hComm J R hR x y e a =
      conjugateCoverAut F hComm J S hS x y d a := by
  sorry

theorem conjugateCoverAut_reverse {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) :
    conjugateCoverAut F hComm J R hR y x (fun i => (e i).symm)
      (conjugateCoverAut F hComm J R hR x y e a) = a := by
  sorry

noncomputable def conjugateCoverEquiv
    (hComm : ∀ (V : C) (z : F.obj (.mk (op V))), ∀ a b : Aut z, a * b = b * a)
    (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) : Aut x ≃* Aut y := by
  sorry

theorem conjugateCoverEquiv_cover_independent {U : C} (R S : Sieve U)
    (hR : R ∈ J U) (hS : S ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y)
    (d : ∀ i : S.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) :
    conjugateCoverEquiv F hComm J R hR x y e =
      conjugateCoverEquiv F hComm J S hS x y d := by
  sorry

theorem conjugateCoverAut_comp {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y z : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y)
    (d : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj y ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj z)
    (c : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj z) (a : Aut x) :
    conjugateCoverAut F hComm J R hR y z d
      (conjugateCoverAut F hComm J R hR x y e a) =
    conjugateCoverAut F hComm J R hR x z c a := by
  sorry

variable {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y)

theorem conjugateCoverEquiv_apply (a : Aut x) :
    conjugateCoverEquiv F hComm J R hR x y e a =
      conjugateCoverAut F hComm J R hR x y e a := by
  sorry

theorem conjugateCoverEquiv_symm_apply (b : Aut y) :
    (conjugateCoverEquiv F hComm J R hR x y e).symm b =
      conjugateCoverAut F hComm J R hR y x (fun i => (e i).symm) b := by
  sorry

theorem conjugateCoverEquiv_mapIso (a : Aut x) (i : R.arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.mapAut y
      (conjugateCoverEquiv F hComm J R hR x y e a) =
      Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a) := by
  sorry

theorem conjugateCoverEquiv_of_iso (d : x ≅ y) :
    conjugateCoverEquiv F hComm J R hR x y e = Aut.autMulEquivOfIso d := by
  sorry

theorem conjugateCoverEquiv_one : conjugateCoverEquiv F hComm J R hR x y e 1 = 1 := by
  sorry

theorem conjugateCoverEquiv_mul (a b : Aut x) :
    conjugateCoverEquiv F hComm J R hR x y e (a * b) =
      conjugateCoverEquiv F hComm J R hR x y e a * conjugateCoverEquiv F hComm J R hR x y e b := by
  sorry

theorem conjugateCoverEquiv_inv (a : Aut x) :
    conjugateCoverEquiv F hComm J R hR x y e a⁻¹ =
      (conjugateCoverEquiv F hComm J R hR x y e a)⁻¹ := by
  sorry

-- GerbeCoverEquivTests.equalObject: arbitrary local automorphisms induce the identity equivalence.
example (e₀ : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj x) :
    conjugateCoverEquiv F hComm J R hR x x e₀ = MulEquiv.refl (Aut x) := by
  sorry

-- GerbeCoverEquivTests.roundTrip: the inverse must recover arbitrary source automorphisms.
example (a : Aut x) :
    (conjugateCoverEquiv F hComm J R hR x y e).symm
      (conjugateCoverEquiv F hComm J R hR x y e a) = a := by
  sorry

-- GerbeCoverEquivTests.targetRoundTrip: no target automorphism may be lost.
example (b : Aut y) :
    conjugateCoverEquiv F hComm J R hR x y e
      ((conjugateCoverEquiv F hComm J R hR x y e).symm b) = b := by
  sorry

-- GerbeCoverEquivTests.local: restrictions identify the equivalence with conjugation.
example (a : Aut x) (i : R.arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.mapAut y
      (conjugateCoverEquiv F hComm J R hR x y e a) =
      Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a) := by
  sorry

-- GerbeCoverEquivTests.globalIso: retain the labelled Mathlib conjugation map.
example (d : x ≅ y) : conjugateCoverEquiv F hComm J R hR x y e = Aut.autMulEquivOfIso d := by
  sorry

-- GerbeCoverEquivTests.changeCover: compare whole maps on unrelated covering sieves.
example (S : Sieve U) (hS : S ∈ J U)
    (d : ∀ i : S.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) :
    conjugateCoverEquiv F hComm J R hR x y e = conjugateCoverEquiv F hComm J S hS x y d := by
  sorry

-- GerbeCoverEquivTests.product: multiplication is the Aut multiplication.
example (a b : Aut x) : conjugateCoverEquiv F hComm J R hR x y e (a * b) =
    conjugateCoverEquiv F hComm J R hR x y e a * conjugateCoverEquiv F hComm J R hR x y e b := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeAutTransport

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeAutTransport
open CategoryTheory Opposite Bicategory
open Pseudofunctor.LocallyDiscreteOpToCat
variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
variable (hComm : ∀ (V : C) (z : F.obj (.mk (op V))), ∀ a b : Aut z, a * b = b * a)
variable (J : GrothendieckTopology C) [F.IsPrestack J]
set_option backward.isDefEq.respectTransparency false

/-- conjugation transport is compatible with every base arrow and unrelated covers. -/
theorem conjugateCoverAut_baseChange {U V : C} (f : V ⟶ U)
    (R : Sieve U) (hR : R ∈ J U) (S : Sieve V) (hS : S ∈ J V)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y)
    (d : ∀ i : S.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj x) ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj y))
    (a : Aut x) :
    (F.map f.op.toLoc).toFunctor.mapAut y (conjugateCoverAut F hComm J R hR x y e a) =
      conjugateCoverAut F hComm J S hS
        ((F.map f.op.toLoc).toFunctor.obj x) ((F.map f.op.toLoc).toFunctor.obj y) d
        ((F.map f.op.toLoc).toFunctor.mapAut x a) := by sorry
/-- Descent respects independent source and target isomorphisms and independent covers. -/
theorem conjugateCoverAut_naturality
    {U : C} (R : Sieve U) (hR : R ∈ J U) (S : Sieve U) (hS : S ∈ J U)
    (x₁ x₂ y₁ y₂ : F.obj (.mk (op U)))
    (e₁ : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x₁ ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y₁)
    (e₂ : ∀ i : S.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x₂ ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y₂)
    (c : x₁ ≅ x₂) (d : y₁ ≅ y₂) (a₁ : Aut x₁) (a₂ : Aut x₂)
    (ha : a₁.hom ≫ c.hom = c.hom ≫ a₂.hom) :
    (conjugateCoverAut F hComm J R hR x₁ y₁ e₁ a₁).hom ≫ d.hom =
      d.hom ≫ (conjugateCoverAut F hComm J S hS x₂ y₂ e₂ a₂).hom := by sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeAutTransport

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.IntrinsicBandSections
open GerbeAutTransport Pseudofunctor.LocallyDiscreteOpToCat
variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
variable (J : GrothendieckTopology C) [IsGerbe F J]
variable (hComm : ∀ (V : C) (z : F.obj (.mk (op V))), ∀ a b : Aut z, a * b = b * a)
set_option backward.isDefEq.respectTransparency false

/-- Extend one automorphism to the simultaneous compatible-centre section. -/
noncomputable def lift (J : GrothendieckTopology C) [IsGerbe F J]
    (hComm : ∀ (V : C) (z : F.obj (.mk (op V))), ∀ a b : Aut z, a * b = b * a)
    {U : C} (x : F.obj (.mk (op U))) :
    Aut x →* IntrinsicBandSection F U := by sorry
/-- Evaluation at the identity recovers the chosen automorphism via the unit constraint. -/
theorem eval_lift {U : C} (x : F.obj (.mk (op U))) (a : Aut x) :
    eval F (𝟙 U) x (lift F J hComm x a) = a := by sorry
theorem lift_one {U : C} (x : F.obj (.mk (op U))) :
    lift F J hComm x 1 = 1 := by sorry
theorem lift_mul {U : C} (x : F.obj (.mk (op U))) (a b : Aut x) :
    lift F J hComm x (a * b) = lift F J hComm x a * lift F J hComm x b := by sorry
theorem lift_inv {U : C} (x : F.obj (.mk (op U))) (a : Aut x) :
    lift F J hComm x a⁻¹ = (lift F J hComm x a)⁻¹ := by sorry
/-- Recovery on any local isomorphism cover, independently of the construction's choices. -/
theorem lift_app {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op U)))
    (a : Aut x) (y : F.obj (.mk (op V)))
    (R : Sieve V) (hR : R ∈ J V)
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj x) ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) :
    eval F f y (lift F J hComm x a) =
      conjugateCoverAut F hComm J R hR ((F.map f.op.toLoc).toFunctor.obj x) y e
        ((F.map f.op.toLoc).toFunctor.mapAut x a) := by sorry
theorem lift_globalIso {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op U)))
    (a : Aut x) (y : F.obj (.mk (op V)))
    (d : (F.map f.op.toLoc).toFunctor.obj x ≅ y) :
    eval F f y (lift F J hComm x a) =
      Aut.autMulEquivOfIso d ((F.map f.op.toLoc).toFunctor.mapAut x a) := by sorry
/-- Restriction agrees with lifting the pulled automorphism, as whole sections. -/
theorem lift_restrict {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op U))) (a : Aut x) :
    restrict F f (lift F J hComm x a) =
      lift F J hComm ((F.map f.op.toLoc).toFunctor.obj x)
        ((F.map f.op.toLoc).toFunctor.mapAut x a) := by sorry
theorem lift_injective {U : C} (x : F.obj (.mk (op U))) :
    Function.Injective (lift F J hComm x) := by sorry
-- GerbeBandLiftTests.identity
example {U : C} (x : F.obj (.mk (op U))) : lift F J hComm x 1 = 1 := by sorry
-- GerbeBandLiftTests.nontrivial
example {U : C} (x : F.obj (.mk (op U))) (a : Aut x) (ha : a ≠ 1) :
    lift F J hComm x a ≠ 1 := by sorry
-- GerbeBandLiftTests.globalIso
example {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op U))) (a : Aut x)
    (y : F.obj (.mk (op V))) (d : (F.map f.op.toLoc).toFunctor.obj x ≅ y) :
    eval F f y (lift F J hComm x a) =
      Aut.autMulEquivOfIso d ((F.map f.op.toLoc).toFunctor.mapAut x a) := by sorry
-- GerbeBandLiftTests.restrictionChain
example {U V W : C} (f : V ⟶ U) (g : W ⟶ V)
    (x : F.obj (.mk (op U))) (a : Aut x) :
    restrict F g (restrict F f (lift F J hComm x a)) =
      lift F J hComm ((F.map (g ≫ f).op.toLoc).toFunctor.obj x)
        ((F.map (g ≫ f).op.toLoc).toFunctor.mapAut x a) := by sorry
-- GerbeBandLiftTests.recovery
example {U : C} (x : F.obj (.mk (op U))) (a : Aut x) :
    eval F (𝟙 U) x (lift F J hComm x a) = a := by sorry
end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.IntrinsicBandSections

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry
variable {C : Type u} [Category.{v} C]
namespace IntrinsicBandSections
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
variable (J : GrothendieckTopology C) [IsGerbe F J]
variable (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)

-- Recover a coefficient on any base carrying a gerbe object.
theorem fromBanding_surjective_of_object (U : C) (x : F.obj (.mk (op U))) :
    Function.Surjective (fromBanding F J A b U) := by
  sorry

-- Local nonemptiness supplies these coefficients; no global object is chosen.
noncomputable def localBandCoefficient (b : AbelianBanding F J A) {U : C} (R : Sieve U)
    (objects : ∀ ⦃V : C⦄ (f : V ⟶ U), R f → F.obj (.mk (op V)))
    (z : IntrinsicBandSection F U) :
    Presieve.FamilyOfElements (A.obj ⋙ forget AddCommGrpCat.{max u v u' v'}) R.arrows := by
  sorry

/-- The local coefficient is the inverse of the displayed, prescribed band map. -/
theorem localBandCoefficient_apply {U V : C} (R : Sieve U)
    (objects : ∀ ⦃W : C⦄ (f : W ⟶ U), R f → F.obj (.mk (op W)))
    (z : IntrinsicBandSection F U) (f : V ⟶ U) (hf : R f) :
    localBandCoefficient F J A b R objects z f hf =
      ((b.autEquiv V (objects f hf)).symm (eval F f (objects f hf) z)).toAdd := by
  sorry

theorem localBandCoefficient_recovery {U V : C} (R : Sieve U)
    (objects : ∀ ⦃W : C⦄ (f : W ⟶ U), R f → F.obj (.mk (op W)))
    (z : IntrinsicBandSection F U) (f : V ⟶ U) (hf : R f) :
    fromBanding F J A b V (Multiplicative.ofAdd
      (localBandCoefficient F J A b R objects z f hf)) = restrict F f z := by
  sorry

theorem localBandCoefficient_compatible {U : C} (R : Sieve U)
    (objects : ∀ ⦃V : C⦄ (f : V ⟶ U), R f → F.obj (.mk (op V)))
    (z : IntrinsicBandSection F U) :
    (localBandCoefficient F J A b R objects z).Compatible := by
  sorry

theorem fromBanding_surjective (U : C) :
    Function.Surjective (fromBanding F J A b U) := by
  sorry

end IntrinsicBandSections
end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.IntrinsicBandSections
variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
variable (J : GrothendieckTopology C) [IsGerbe F J]
variable (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)

noncomputable def fromBandingEquiv (b : AbelianBanding F J A) (U : C) :
    Multiplicative (A.obj.obj (op U)) ≃* IntrinsicBandSection F U := by
  sorry

theorem fromBandingEquiv_apply (U : C) (a : Multiplicative (A.obj.obj (op U))) :
    fromBandingEquiv F J A b U a = fromBanding F J A b U a := by
  sorry

theorem fromBandingEquiv_symm_restrict {U V : C} (f : V ⟶ U)
    (z : IntrinsicBandSection F U) :
    Multiplicative.ofAdd (A.obj.map f.op ((fromBandingEquiv F J A b U).symm z).toAdd) =
      (fromBandingEquiv F J A b V).symm (restrict F f z) := by
  sorry

-- All original choices of local objects give the same glued inverse.
theorem fromBandingEquiv_symm_local {U V : C} (R : Sieve U)
    (objects : ∀ ⦃W : C⦄ (f : W ⟶ U), R f → F.obj (.mk (op W)))
    (z : IntrinsicBandSection F U) (f : V ⟶ U) (hf : R f) :
    A.obj.map f.op ((fromBandingEquiv F J A b U).symm z).toAdd =
      localBandCoefficient F J A b R objects z f hf := by
  sorry

-- LocalCoefficientTests.unit
example {U V : C} (R : Sieve U)
    (objects : ∀ ⦃W : C⦄ (f : W ⟶ U), R f → F.obj (.mk (op W)))
    (f : V ⟶ U) (hf : R f) :
    localBandCoefficient F J A b R objects 1 f hf = 0 := by
  sorry

-- LocalCoefficientTests.existing
example {U V : C} (R : Sieve U)
    (objects : ∀ ⦃W : C⦄ (f : W ⟶ U), R f → F.obj (.mk (op W)))
    (a : Multiplicative (A.obj.obj (op U))) (f : V ⟶ U) (hf : R f) :
    localBandCoefficient F J A b R objects (fromBanding F J A b U a) f hf =
      A.obj.map f.op a.toAdd := by
  sorry

-- LocalCoefficientTests.choiceIndependent
example {U V : C} (R : Sieve U)
    (objects objects' : ∀ ⦃W : C⦄ (f : W ⟶ U), R f → F.obj (.mk (op W)))
    (z : IntrinsicBandSection F U) (f : V ⟶ U) (hf : R f) :
    localBandCoefficient F J A b R objects z f hf =
      localBandCoefficient F J A b R objects' z f hf := by
  sorry

-- BandInverseTests.unit
example (U : C) : (fromBandingEquiv F J A b U).symm 1 = 1 := by
  sorry

-- BandInverseTests.coefficientRoundTrip
example (U : C) (a : Multiplicative (A.obj.obj (op U))) :
    (fromBandingEquiv F J A b U).symm (fromBanding F J A b U a) = a := by
  sorry

-- BandInverseTests.sectionRoundTrip
example (U : C) (z : IntrinsicBandSection F U) :
    fromBanding F J A b U ((fromBandingEquiv F J A b U).symm z) = z := by
  sorry

-- BandInverseTests.inverse
example (U : C) (z : IntrinsicBandSection F U) :
    (fromBandingEquiv F J A b U).symm z⁻¹ = ((fromBandingEquiv F J A b U).symm z)⁻¹ := by
  sorry

-- BandInverseTests.restriction
example {U V : C} (f : V ⟶ U) (z : IntrinsicBandSection F U) :
    Multiplicative.ofAdd (A.obj.map f.op ((fromBandingEquiv F J A b U).symm z).toAdd) =
      (fromBandingEquiv F J A b V).symm (restrict F f z) := by
  sorry

-- BandInverseTests.nontrivial
example (U : C) (z : IntrinsicBandSection F U) (hz : z ≠ 1) :
    (fromBandingEquiv F J A b U).symm z ≠ 1 := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.IntrinsicBandSections

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.IntrinsicBandSections
open CategoryTheory Opposite Bicategory
variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
variable (J : GrothendieckTopology C) [IsGerbe F J]
variable (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)

noncomputable def fromBandingPresheafIso
    (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
    (J : GrothendieckTopology C) [IsGerbe F J]
    (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A) :
    A.obj ≅ presheaf F := by sorry

theorem fromBandingPresheafIso_hom :
    (fromBandingPresheafIso F J A b).hom = fromBandingPresheaf F J A b := by sorry

theorem fromBandingPresheafIso_hom_app (U : C) (a : A.obj.obj (op U)) :
    (((fromBandingPresheafIso F J A b).hom.app (op U)) a).toMul =
      fromBanding F J A b U (Multiplicative.ofAdd a) := by sorry

theorem fromBandingPresheafIso_inv_app (U : C) (z : IntrinsicBandSection F U) :
    ((fromBandingPresheafIso F J A b).inv.app (op U)) (Additive.ofMul z) =
      ((fromBandingEquiv F J A b U).symm z).toAdd := by sorry

theorem fromBandingPresheafIso_inv_naturality {U V : C} (f : V ⟶ U)
    (z : IntrinsicBandSection F U) :
    A.obj.map f.op (((fromBandingPresheafIso F J A b).inv.app (op U)) (Additive.ofMul z)) =
      ((fromBandingPresheafIso F J A b).inv.app (op V)) (Additive.ofMul (restrict F f z)) := by sorry

variable (S : Sheaf J AddCommGrpCat.{max u v u' v'}) (hS : S.obj = presheaf F)

noncomputable def fromBandingSheafIso
    (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
    (J : GrothendieckTopology C) [IsGerbe F J]
    (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    (S : Sheaf J AddCommGrpCat.{max u v u' v'}) (hS : S.obj = presheaf F) :
    A ≅ S := by sorry

theorem fromBandingSheafIso_hom :
    (fromBandingSheafIso F J A b S hS).hom.hom =
      (fromBandingPresheafIso F J A b ≪≫ eqToIso hS.symm).hom := by sorry

theorem fromBandingSheafIso_inv :
    (fromBandingSheafIso F J A b S hS).inv.hom =
      (fromBandingPresheafIso F J A b ≪≫ eqToIso hS.symm).inv := by sorry

theorem fromBandingSheafIso_hom_transport :
    (fromBandingSheafIso F J A b S hS).hom.hom ≫ eqToHom hS =
      fromBandingPresheaf F J A b := by sorry

theorem fromBandingSheafIso_inv_transport :
    eqToHom hS.symm ≫ (fromBandingSheafIso F J A b S hS).inv.hom =
      (fromBandingPresheafIso F J A b).inv := by sorry

theorem fromBandingSheafIso_unique (e : A ≅ S)
    (he : ∀ (U V : C) (f : V ⟶ U) (x : F.obj (.mk (op V)))
      (a : A.obj.obj (op U)),
      eval F f x (((e.hom.hom ≫ eqToHom hS).app (op U)) a).toMul =
        b.autEquiv V x (Multiplicative.ofAdd (A.obj.map f.op a))) :
    e = fromBandingSheafIso F J A b S hS := by sorry

-- BandPresheafIsoTests.zero
example (U : C) :
    ((fromBandingPresheafIso F J A b).hom.app (op U)) 0 = 0 := by sorry

-- BandPresheafIsoTests.coefficientRoundTrip
example (U : C) (a : A.obj.obj (op U)) :
    ((fromBandingPresheafIso F J A b).inv.app (op U))
      (((fromBandingPresheafIso F J A b).hom.app (op U)) a) = a := by sorry

-- BandPresheafIsoTests.sectionRoundTrip
example (U : C) (z : IntrinsicBandSection F U) :
    ((fromBandingPresheafIso F J A b).hom.app (op U))
      (((fromBandingPresheafIso F J A b).inv.app (op U)) (Additive.ofMul z)) =
      Additive.ofMul z := by sorry

-- BandPresheafIsoTests.restriction
example {U V : C} (f : V ⟶ U) (z : IntrinsicBandSection F U) :
    A.obj.map f.op (((fromBandingPresheafIso F J A b).inv.app (op U)) (Additive.ofMul z)) =
      ((fromBandingPresheafIso F J A b).inv.app (op V)) (Additive.ofMul (restrict F f z)) := by sorry

-- BandPresheafIsoTests.nonzero
example (U : C) (a : A.obj.obj (op U)) (ha : a ≠ 0) :
    ((fromBandingPresheafIso F J A b).hom.app (op U)) a ≠ 0 := by sorry

-- BandSheafIsoTests.forward
example :
    (fromBandingSheafIso F J A b S hS).hom.hom ≫ eqToHom hS =
      fromBandingPresheaf F J A b := by sorry

-- BandSheafIsoTests.backward
example :
    eqToHom hS.symm ≫ (fromBandingSheafIso F J A b S hS).inv.hom =
      (fromBandingPresheafIso F J A b).inv := by sorry

-- BandSheafIsoTests.coefficientRoundTrip
example :
    (fromBandingSheafIso F J A b S hS).hom ≫ (fromBandingSheafIso F J A b S hS).inv = 𝟙 A := by sorry

-- BandSheafIsoTests.sectionRoundTrip
example :
    (fromBandingSheafIso F J A b S hS).inv ≫ (fromBandingSheafIso F J A b S hS).hom = 𝟙 S := by sorry

-- BandSheafIsoTests.bandDeterminesComparison
example (e : A ≅ S)
    (he : ∀ (U V : C) (f : V ⟶ U) (x : F.obj (.mk (op V)))
      (a : A.obj.obj (op U)),
      eval F f x (((e.hom.hom ≫ eqToHom hS).app (op U)) a).toMul =
        b.autEquiv V x (Multiplicative.ofAdd (A.obj.map f.op a))) :
    e = fromBandingSheafIso F J A b S hS := by sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.IntrinsicBandSections

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeConjugationTests
local notation "s3Point" => SingleObj.star (Equiv.Perm (Fin 3))

-- GerbeConjugationTests.S3_value: the conjugate is a different transposition.
example :
    (Aut.autMulEquivOfIso
      (asIso (C := SingleObj (Equiv.Perm (Fin 3))) (X := s3Point) (Y := s3Point) (Equiv.swap (0 : Fin 3) 1 : s3Point ⟶ s3Point))
      (asIso (C := SingleObj (Equiv.Perm (Fin 3))) (X := s3Point) (Y := s3Point) (Equiv.swap (1 : Fin 3) 2 : s3Point ⟶ s3Point))).hom =
        (Equiv.swap (0 : Fin 3) 2 : s3Point ⟶ s3Point) := by
  sorry

-- GerbeConjugationTests.S3_distinct: commutativity cannot be removed.
example :
    Aut.autMulEquivOfIso (Iso.refl s3Point) ≠
      Aut.autMulEquivOfIso
        (asIso (C := SingleObj (Equiv.Perm (Fin 3))) (X := s3Point) (Y := s3Point) (Equiv.swap (0 : Fin 3) 1 : s3Point ⟶ s3Point)) := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeConjugationTests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandFixtures
open CategoryTheory Opposite Bicategory
open IntrinsicBandSections
universe fixture_u fixture_v
variable (C : Type u) [Category.{v} C]
variable (D : Type fixture_u) [Category.{fixture_v} D]

abbrev constantDiagram : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{fixture_v, fixture_u} :=
  ((Functor.const Cᵒᵖ).obj (Cat.of D)).toPseudofunctor'

noncomputable def constantSection (U : C) (z : (CatCenter D)ˣ) :
    IntrinsicBandSection (constantDiagram C D) U := by sorry

theorem constantSection_val (U V : C) (f : V ⟶ U) (z : (CatCenter D)ˣ) :
    val (constantDiagram C D) (constantSection C D U z) V f = z := by sorry

noncomputable def constantSectionsEquiv (U : C) :
    (CatCenter D)ˣ ≃* IntrinsicBandSection (constantDiagram C D) U := by sorry

theorem constantSectionsEquiv_restrict {U V : C} (f : V ⟶ U) (z : (CatCenter D)ˣ) :
    restrict (constantDiagram C D) f (constantSectionsEquiv C D U z) =
      constantSectionsEquiv C D V z := by sorry

variable (I : Type fixture_u) (G : Type fixture_v) [CommGroup G]

abbrev Fibre := Discrete I × SingleObj G

def componentCenter (a : I → G) : CatCenter (Fibre I G) := by sorry

def componentCenterUnit (a : I → G) : (CatCenter (Fibre I G))ˣ := by sorry

def componentCenterEquiv : (I → G) ≃* (CatCenter (Fibre I G))ˣ := by sorry

noncomputable def componentSectionsEquiv (U : C) :
    (I → G) ≃* IntrinsicBandSection (constantDiagram C (Fibre I G)) U := by sorry

theorem componentSectionsEquiv_eval {U V : C} (f : V ⟶ U) (a : I → G) (i : I) :
    (eval (constantDiagram C (Fibre I G)) f (Discrete.mk i, SingleObj.star G)
      (componentSectionsEquiv C I G U a)).hom.2 = a i := by sorry

theorem componentSectionsEquiv_restrict {U V : C} (f : V ⟶ U) (a : I → G) :
    restrict (constantDiagram C (Fibre I G)) f (componentSectionsEquiv C I G U a) =
      componentSectionsEquiv C I G V a := by sorry

theorem component_eval_bijective [Subsingleton I] (U : C) (i : I) :
    Function.Bijective (eval (constantDiagram C (Fibre I G)) (𝟙 U)
      (Discrete.mk i, SingleObj.star G)) := by sorry

theorem component_eval_not_injective (U : C) (g : G) (hg : g ≠ 1) :
    ¬ Function.Injective (eval (constantDiagram C (Fibre Bool G)) (𝟙 U)
      (Discrete.mk false, SingleObj.star G)) := by sorry

theorem fibre_no_cross_iso :
    ¬ Nonempty (((Discrete.mk false, SingleObj.star G) : Fibre Bool G) ≅
      (Discrete.mk true, SingleObj.star G)) := by sorry

theorem constant_two_components_not_gerbe (U : C) :
    ¬ IsGerbe (constantDiagram C (Fibre Bool G)) (⊥ : GrothendieckTopology C) := by sorry

set_option backward.isDefEq.respectTransparency false in
theorem point_isStack :
    (constantDiagram (Discrete PUnit) (Fibre I G)).IsStack ⊥ := by sorry

theorem point_connected_gerbe :
    IsGerbe (constantDiagram (Discrete PUnit) (Fibre PUnit G)) ⊥ := by sorry

-- BandPointTests.stack
example : (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 3)))).IsStack ⊥ := by sorry

-- BandPointTests.gerbe
example : IsGerbe
    (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 3)))) ⊥ := by sorry

theorem constantSection_restrict {U V : C} (f : V ⟶ U) (z : (CatCenter D)ˣ) :
    restrict (constantDiagram C D) f (constantSection C D U z) =
      constantSection C D V z := by sorry

theorem constantSectionsEquiv_apply (U : C) (z : (CatCenter D)ˣ) :
    constantSectionsEquiv C D U z = constantSection C D U z := by sorry

theorem constantSectionsEquiv_symm_apply (U : C)
    (s : IntrinsicBandSection (constantDiagram C D) U) :
    (constantSectionsEquiv C D U).symm s = val (constantDiagram C D) s U (𝟙 U) := by sorry

theorem componentCenter_app (a : I → G) (x : Fibre I G) :
    (componentCenter I G a).app x = (𝟙 x.1, a x.1.as) := by sorry

theorem componentCenter_naturality (a : I → G) {x y : Fibre I G} (f : x ⟶ y) :
    f ≫ (componentCenter I G a).app y = (componentCenter I G a).app x ≫ f := by sorry

theorem componentCenterUnit_val (a : I → G) :
    (componentCenterUnit I G a).val = componentCenter I G a := by sorry

theorem componentCenterUnit_inv (a : I → G) :
    (componentCenterUnit I G a).inv = componentCenter I G (fun i => (a i)⁻¹) := by sorry

theorem componentCenterEquiv_apply (a : I → G) :
    componentCenterEquiv I G a = componentCenterUnit I G a := by sorry

theorem componentCenterEquiv_symm_apply (z : (CatCenter (Fibre I G))ˣ) (i : I) :
    (componentCenterEquiv I G).symm z i =
      (z.val.app (Discrete.mk i, SingleObj.star G)).2 := by sorry

theorem componentSectionsEquiv_symm_apply (U : C)
    (s : IntrinsicBandSection (constantDiagram C (Fibre I G)) U) (i : I) :
    (componentSectionsEquiv C I G U).symm s i =
      ((val (constantDiagram C (Fibre I G)) s U (𝟙 U)).val.app
        (Discrete.mk i, SingleObj.star G)).2 := by sorry

-- BandPointTests.generator
example : (eval
    (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 3))))
    (𝟙 (Discrete.mk PUnit.unit)) (Discrete.mk PUnit.unit, SingleObj.star _)
    (componentSectionsEquiv (Discrete PUnit) PUnit (Multiplicative (ZMod 3))
      (Discrete.mk PUnit.unit) (fun _ => Multiplicative.ofAdd (1 : ZMod 3)))).hom.2 =
        Multiplicative.ofAdd (1 : ZMod 3) := by sorry

-- GerbeTests.twoComponents: the constant discrete two-object stack on the
-- one-point site is a stack and fails the locally-isomorphic gerbe condition.
example : (constantDiagram (Discrete PUnit) (Discrete Bool)).IsStack ⊥ ∧
    ¬ IsGerbe (constantDiagram (Discrete PUnit) (Discrete Bool)) ⊥ := by sorry

-- BandPointTests.trivialDiscreteTwoObjects
example : (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 1)))).IsStack ⊥ ∧
    ¬ IsGerbe (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 1)))) ⊥ := by sorry

-- BandPointTests.disconnectedWitness
example : ∃ s : IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 3))))
      (Discrete.mk PUnit.unit), s ≠ 1 ∧
    eval (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Discrete.mk false, SingleObj.star _) s =
        Iso.refl ((Discrete.mk false, SingleObj.star _) : Fibre Bool (Multiplicative (ZMod 3))) := by sorry

-- ConstantCentreTests.one
example (U : C) : constantSection C D U 1 = 1 := by sorry

-- ConstantCentreTests.multiply
example (U : C) (z t : (CatCenter D)ˣ) :
    constantSection C D U (z * t) = constantSection C D U z * constantSection C D U t := by sorry

-- ConstantCentreTests.allArrows
example (U V : C) (f : V ⟶ U) (z : (CatCenter D)ˣ) :
    val (constantDiagram C D) (constantSection C D U z) V f = z := by sorry

-- ConstantEquivTests.centreRoundTrip
example (U : C) (z : (CatCenter D)ˣ) :
    (constantSectionsEquiv C D U).symm (constantSectionsEquiv C D U z) = z := by sorry

-- ConstantEquivTests.sectionRoundTrip
example (U : C) (s : IntrinsicBandSection (constantDiagram C D) U) :
    constantSectionsEquiv C D U ((constantSectionsEquiv C D U).symm s) = s := by sorry

-- ConstantEquivTests.restriction
example {U V : C} (f : V ⟶ U) (z : (CatCenter D)ˣ) :
    restrict (constantDiagram C D) f (constantSectionsEquiv C D U z) =
      constantSectionsEquiv C D V z := by sorry

-- ComponentCentreTests.component
example (a : I → G) (i : I) :
    (componentCenter I G a).app (Discrete.mk i, SingleObj.star G) = (𝟙 _, a i) := by sorry

-- ComponentCentreTests.unit
example (i : I) : (componentCenter I G 1).app (Discrete.mk i, SingleObj.star G) = 𝟙 _ := by sorry

-- ComponentCentreTests.naturality
example (a : I → G) {x y : Fibre I G} (f : x ⟶ y) :
    f ≫ (componentCenter I G a).app y = (componentCenter I G a).app x ≫ f := by sorry

-- ComponentUnitTests.value
example (a : I → G) : (componentCenterUnit I G a).val = componentCenter I G a := by sorry

-- ComponentUnitTests.inverse
example (a : I → G) : (componentCenterUnit I G a).inv =
    componentCenter I G (fun i => (a i)⁻¹) := by sorry

-- ComponentUnitTests.roundTrip
example (a : I → G) : (componentCenterUnit I G a).val *
    (componentCenterUnit I G a).inv = 1 := by sorry

-- ComponentEquivTests.coefficientRoundTrip
example (a : I → G) : (componentCenterEquiv I G).symm (componentCenterEquiv I G a) = a := by sorry

-- ComponentEquivTests.centreRoundTrip
example (z : (CatCenter (Fibre I G))ˣ) :
    componentCenterEquiv I G ((componentCenterEquiv I G).symm z) = z := by sorry

-- ComponentEquivTests.inertiaCoordinates
example (a : I → G) (i : I) :
    ((componentCenterEquiv I G a).val.app (Discrete.mk i, SingleObj.star G)).2 = a i := by sorry

-- ComponentSectionTests.evaluation
example {U V : C} (f : V ⟶ U) (a : I → G) (i : I) :
    (eval (constantDiagram C (Fibre I G)) f (Discrete.mk i, SingleObj.star G)
      (componentSectionsEquiv C I G U a)).hom.2 = a i := by sorry

-- ComponentSectionTests.restriction
example {U V : C} (f : V ⟶ U) (a : I → G) :
    restrict (constantDiagram C (Fibre I G)) f (componentSectionsEquiv C I G U a) =
      componentSectionsEquiv C I G V a := by sorry

-- ComponentSectionTests.roundTrip
example (U : C) (a : I → G) :
    (componentSectionsEquiv C I G U).symm (componentSectionsEquiv C I G U a) = a := by sorry

-- BandPointTests.connected
example : Function.Bijective
    (eval (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Discrete.mk PUnit.unit, SingleObj.star _)) := by sorry

-- BandPointTests.disconnected
example : ¬ Function.Injective
    (eval (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Discrete.mk false, SingleObj.star _)) := by sorry

-- BandPointTests.notGerbe
example : ¬ IsGerbe
    (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 3)))) ⊥ := by sorry

-- BandPointTests.connectedCardinality
example : Nat.card (IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 3))))
      (Discrete.mk PUnit.unit)) = 3 := by sorry

-- BandPointTests.disconnectedCardinality
example : Nat.card (IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 3))))
      (Discrete.mk PUnit.unit)) = 9 := by sorry

-- BandPointTests.terminalFibre
example : Nat.card (IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 1))))
      (Discrete.mk PUnit.unit)) = 1 := by sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandFixtures

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.ConnectedBandFixtures

open CategoryTheory Opposite Bicategory BandFixtures IntrinsicBandSections

set_option backward.isDefEq.respectTransparency false

universe conn_u conn_v
variable (C : Type u) [Category.{v} C]
variable (I : Type conn_u) (G : Type conn_v) [Group G]

abbrev ConnectedFibre := Codiscrete I × SingleObj G

def connectedCenter (a : Subgroup.center G) : CatCenter (ConnectedFibre I G) := by sorry

def connectedCenterUnit (a : Subgroup.center G) : (CatCenter (ConnectedFibre I G))ˣ := by sorry

def connectedCenterEquiv (i : I) :
    Subgroup.center G ≃* (CatCenter (ConnectedFibre I G))ˣ := by sorry

noncomputable def connectedSectionsEquiv (i : I) (U : C) :
    Subgroup.center G ≃* IntrinsicBandSection
      (constantDiagram C (ConnectedFibre I G)) U := by sorry

theorem connectedSectionsEquiv_eval (i : I) {U V : C} (f : V ⟶ U)
    (a : Subgroup.center G) (x : ConnectedFibre I G) :
    (eval (constantDiagram C (ConnectedFibre I G)) f x
      (connectedSectionsEquiv C I G i U a)).hom.2 = a.val := by sorry

theorem connectedSectionsEquiv_restrict (i : I) {U V : C} (f : V ⟶ U)
    (a : Subgroup.center G) :
    restrict (constantDiagram C (ConnectedFibre I G)) f
      (connectedSectionsEquiv C I G i U a) =
      connectedSectionsEquiv C I G i V a := by sorry

theorem connected_eval_injective (i : I) (U : C) (x : ConnectedFibre I G) :
    Function.Injective (eval (constantDiagram C (ConnectedFibre I G)) (𝟙 U) x) := by sorry

theorem connected_eval_image (i : I) (U : C) (x : ConnectedFibre I G) (e : Aut x) :
    (∃ s, eval (constantDiagram C (ConnectedFibre I G)) (𝟙 U) x s = e) ↔
      e.hom.2 ∈ Subgroup.center G := by sorry

def connectedAut (x : ConnectedFibre I G) (g : G) : Aut x := by sorry

theorem connected_eval_surjective_iff (i : I) (U : C) (x : ConnectedFibre I G) :
    Function.Surjective (eval (constantDiagram C (ConnectedFibre I G)) (𝟙 U) x) ↔
      Subgroup.center G = ⊤ := by sorry

def connectedIso (x y : ConnectedFibre I G) : x ≅ y := by sorry

set_option backward.isDefEq.respectTransparency false in
theorem point_stack (D : Type*) [Category D] :
    (constantDiagram (Discrete PUnit) D).IsStack ⊥ := by sorry

theorem connected_point_gerbe (i : I) :
    IsGerbe (constantDiagram (Discrete PUnit) (ConnectedFibre I G)) ⊥ := by sorry

-- ConnectedBandTests.twoObjectGerbe
example : IsGerbe (constantDiagram (Discrete PUnit)
    (ConnectedFibre Bool (Multiplicative (ZMod 3)))) ⊥ := by sorry

-- ConnectedBandTests.distinctIsomorphic
example : let x : ConnectedFibre Bool (Multiplicative (ZMod 3)) :=
      (Codiscrete.mk false, SingleObj.star _)
    let y : ConnectedFibre Bool (Multiplicative (ZMod 3)) :=
      (Codiscrete.mk true, SingleObj.star _)
    x ≠ y ∧ Nonempty (x ≅ y) := by sorry

-- ConnectedBandTests.cardinality
example : Nat.card (IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (ConnectedFibre Bool (Multiplicative (ZMod 3))))
      (Discrete.mk PUnit.unit)) = 3 := by sorry

-- ConnectedBandTests.bijectiveEvaluation
example (x : ConnectedFibre Bool (Multiplicative (ZMod 3))) :
    Function.Bijective (eval
      (constantDiagram (Discrete PUnit) (ConnectedFibre Bool (Multiplicative (ZMod 3))))
        (𝟙 (Discrete.mk PUnit.unit)) x) := by sorry

-- NonabelianBandTests.gerbe
example : IsGerbe (constantDiagram (Discrete PUnit)
    (ConnectedFibre PUnit (Equiv.Perm (Fin 3)))) ⊥ := by sorry

-- NonabelianBandTests.oneSection
example : Nat.card (IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (ConnectedFibre PUnit (Equiv.Perm (Fin 3))))
      (Discrete.mk PUnit.unit)) = 1 := by sorry

-- NonabelianBandTests.notSurjective
example : ¬ Function.Surjective (eval
    (constantDiagram (Discrete PUnit) (ConnectedFibre PUnit (Equiv.Perm (Fin 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Codiscrete.mk PUnit.unit, SingleObj.star _)) := by sorry

theorem connectedCenter_app (a : Subgroup.center G) (x : ConnectedFibre I G) :
    (connectedCenter I G a).app x = (𝟙 x.1, a.val) := by sorry

theorem connectedCenter_naturality (a : Subgroup.center G)
    {x y : ConnectedFibre I G} (f : x ⟶ y) :
    f ≫ (connectedCenter I G a).app y = (connectedCenter I G a).app x ≫ f := by sorry

theorem connectedCenterUnit_val (a : Subgroup.center G) :
    (connectedCenterUnit I G a).val = connectedCenter I G a := by sorry

theorem connectedCenterUnit_inv (a : Subgroup.center G) :
    (connectedCenterUnit I G a).inv = connectedCenter I G a⁻¹ := by sorry

theorem connectedCenterEquiv_apply (i : I) (a : Subgroup.center G) :
    connectedCenterEquiv I G i a = connectedCenterUnit I G a := by sorry

theorem connectedCenterEquiv_symm_apply (i : I) (z : (CatCenter (ConnectedFibre I G))ˣ) :
    ((connectedCenterEquiv I G i).symm z).val =
      (z.val.app (Codiscrete.mk i, SingleObj.star G)).2 := by sorry

theorem connectedSectionsEquiv_symm_apply (i : I) (U : C)
    (s : IntrinsicBandSection (constantDiagram C (ConnectedFibre I G)) U) :
    ((connectedSectionsEquiv C I G i U).symm s).val =
      ((val (constantDiagram C (ConnectedFibre I G)) s U (𝟙 U)).val.app
        (Codiscrete.mk i, SingleObj.star G)).2 := by sorry

theorem connectedAut_hom (x : ConnectedFibre I G) (g : G) :
    (connectedAut I G x g).hom = (𝟙 x.1, g) := by sorry

theorem connectedAut_inv (x : ConnectedFibre I G) (g : G) :
    (connectedAut I G x g).inv = (𝟙 x.1, g⁻¹) := by sorry

theorem connectedIso_fst (x y : ConnectedFibre I G) :
    (connectedIso I G x y).hom.1 = (Codiscrete.iso x.1 y.1).hom := by sorry

theorem connectedIso_snd (x y : ConnectedFibre I G) :
    (connectedIso I G x y).hom.2 = (eqToIso (Subsingleton.elim x.2 y.2)).hom := by sorry

-- ConnectedCenterTests.value
example (a : Subgroup.center G) (x : ConnectedFibre I G) :
    ((connectedCenter I G a).app x).2 = a.val := by sorry

-- ConnectedCenterTests.naturality
example (a : Subgroup.center G) {x y : ConnectedFibre I G} (f : x ⟶ y) :
    f ≫ (connectedCenter I G a).app y = (connectedCenter I G a).app x ≫ f := by sorry

-- ConnectedCenterTests.identity
example (x : ConnectedFibre I G) : (connectedCenter I G 1).app x = 𝟙 x := by sorry

-- ConnectedUnitTests.value
example (a : Subgroup.center G) :
    (connectedCenterUnit I G a).val = connectedCenter I G a := by sorry

-- ConnectedUnitTests.inverse
example (a : Subgroup.center G) :
    (connectedCenterUnit I G a).inv = connectedCenter I G a⁻¹ := by sorry

-- ConnectedUnitTests.roundTrip
example (a : Subgroup.center G) :
    (connectedCenterUnit I G a).val * (connectedCenterUnit I G a).inv = 1 := by sorry

-- ConnectedEquivTests.coefficientRoundTrip
example (i : I) (a : Subgroup.center G) :
    (connectedCenterEquiv I G i).symm (connectedCenterEquiv I G i a) = a := by sorry

-- ConnectedEquivTests.centreRoundTrip
example (i : I) (z : (CatCenter (ConnectedFibre I G))ˣ) :
    connectedCenterEquiv I G i ((connectedCenterEquiv I G i).symm z) = z := by sorry

-- ConnectedEquivTests.everyObject
example (i : I) (a : Subgroup.center G) (x : ConnectedFibre I G) :
    ((connectedCenterEquiv I G i a).val.app x).2 = a.val := by sorry

-- ConnectedSectionTests.roundTrip
example (i : I) (U : C)
    (s : IntrinsicBandSection (constantDiagram C (ConnectedFibre I G)) U) :
    connectedSectionsEquiv C I G i U ((connectedSectionsEquiv C I G i U).symm s) = s := by sorry

-- ConnectedSectionTests.restriction
example (i : I) {U V : C} (f : V ⟶ U) (a : Subgroup.center G) :
    restrict (constantDiagram C (ConnectedFibre I G)) f
      (connectedSectionsEquiv C I G i U a) =
        connectedSectionsEquiv C I G i V a := by sorry

-- ConnectedSectionTests.generatorBothObjects
example : let a : Subgroup.center (Multiplicative (ZMod 3)) :=
      ⟨Multiplicative.ofAdd 1, by rw [CommGroup.center_eq_top]; trivial⟩
    let s := connectedSectionsEquiv (Discrete PUnit) Bool (Multiplicative (ZMod 3))
      false (Discrete.mk PUnit.unit) a
    (eval (constantDiagram (Discrete PUnit) (ConnectedFibre Bool (Multiplicative (ZMod 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Codiscrete.mk false, SingleObj.star _) s).hom.2 =
        Multiplicative.ofAdd (1 : ZMod 3) ∧
    (eval (constantDiagram (Discrete PUnit) (ConnectedFibre Bool (Multiplicative (ZMod 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Codiscrete.mk true, SingleObj.star _) s).hom.2 =
        Multiplicative.ofAdd (1 : ZMod 3) := by sorry

-- ConnectedAutTests.hom
example (x : ConnectedFibre I G) (g : G) : (connectedAut I G x g).hom.2 = g := by sorry

-- ConnectedAutTests.inverse
example (x : ConnectedFibre I G) (g : G) : (connectedAut I G x g).inv.2 = g⁻¹ := by sorry

-- ConnectedAutTests.multiplication
example (x : ConnectedFibre I G) (g h : G) :
    connectedAut I G x (g * h) = connectedAut I G x g * connectedAut I G x h := by sorry

-- ConnectedIsoTests.projections
example (x y : ConnectedFibre I G) :
    (connectedIso I G x y).hom.1 = (Codiscrete.iso x.1 y.1).hom ∧
    (connectedIso I G x y).hom.2 = (eqToIso (Subsingleton.elim x.2 y.2)).hom := by sorry

-- ConnectedIsoTests.roundTrip
example (x y : ConnectedFibre I G) :
    (connectedIso I G x y).hom ≫ (connectedIso I G x y).inv = 𝟙 x := by sorry

-- NonabelianBandTests.injective
example : Function.Injective (eval
    (constantDiagram (Discrete PUnit) (ConnectedFibre PUnit (Equiv.Perm (Fin 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Codiscrete.mk PUnit.unit, SingleObj.star _)) := by sorry

-- NonabelianBandTests.transpositionNotAttained
example : ¬ ∃ s, eval
    (constantDiagram (Discrete PUnit) (ConnectedFibre PUnit (Equiv.Perm (Fin 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Codiscrete.mk PUnit.unit, SingleObj.star _) s =
        connectedAut PUnit (Equiv.Perm (Fin 3))
          (Codiscrete.mk PUnit.unit, SingleObj.star _) (Equiv.swap 0 1) := by sorry

-- NonabelianBandTests.oneObject
example : Subsingleton (ConnectedFibre PUnit (Equiv.Perm (Fin 3))) := by sorry

-- ConnectedBandTests.emptyFibreStack
example : (constantDiagram (Discrete PUnit) (Discrete Empty)).IsStack ⊥ := by sorry

theorem connectedCenter_one : connectedCenter I G 1 = 1 := by sorry

theorem connectedCenterUnit_val_inv (a : Subgroup.center G) :
    (connectedCenterUnit I G a).val * (connectedCenterUnit I G a).inv = 1 := by sorry

theorem connectedCenterEquiv_apply_symm_apply (i : I) (z : (CatCenter (ConnectedFibre I G))ˣ) :
    connectedCenterEquiv I G i ((connectedCenterEquiv I G i).symm z) = z := by sorry

theorem connectedAut_mul (x : ConnectedFibre I G) (g h : G) :
    connectedAut I G x (g * h) = connectedAut I G x g * connectedAut I G x h := by sorry

theorem connectedIso_hom_inv_id (x y : ConnectedFibre I G) :
    (connectedIso I G x y).hom ≫ (connectedIso I G x y).inv = 𝟙 x := by sorry

-- ConnectedEquivTests.emptyFibreCollapse: no coefficient recovery without a fibre object.
example : let a : Subgroup.center (Multiplicative (ZMod 3)) :=
      ⟨Multiplicative.ofAdd 1, by rw [CommGroup.center_eq_top]; trivial⟩
    a ≠ 1 ∧ connectedCenterUnit Empty (Multiplicative (ZMod 3)) a =
      connectedCenterUnit Empty (Multiplicative (ZMod 3)) 1 := by sorry

-- ConnectedBandTests.emptyFibreNotGerbe: stack descent does not imply local nonemptiness.
example : (constantDiagram (Discrete PUnit)
      (ConnectedFibre Empty (Multiplicative (ZMod 3)))).IsStack ⊥ ∧
    ¬ IsGerbe (constantDiagram (Discrete PUnit)
      (ConnectedFibre Empty (Multiplicative (ZMod 3)))) ⊥ := by sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.ConnectedBandFixtures

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.RestrictionBandFixtures
open CategoryTheory Opposite Bicategory
open IntrinsicBandSections
universe chain_u chain_v chain_w
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type chain_u} [Category.{chain_v} C]

abbrev groupDiagram (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{chain_w, 0} :=
  (P ⋙ forget₂ CommGrpCat GrpCat ⋙ forget₂ GrpCat MonCat ⋙ MonCat.toCat).toPseudofunctor'

theorem groupMapId_hom (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C)
    (x : SingleObj (P.obj (op U))) :
    ((groupDiagram P).mapId (.mk (op U))).hom.toNatTrans.app x =
      (1 : P.obj (op U)) := by sorry

theorem groupMapComp_hom (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    {U V W : C} (f : V ⟶ U) (g : W ⟶ V) (x : SingleObj (P.obj (op U))) :
    ((groupDiagram P).mapComp f.op.toLoc g.op.toLoc).hom.toNatTrans.app x =
      (1 : P.obj (op W)) := by sorry

theorem groupMapComp'_hom (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    {U V W : C} (f : V ⟶ U) (g : W ⟶ V) (fg : W ⟶ U) (h : g ≫ f = fg)
    (x : SingleObj (P.obj (op U))) :
    ((groupDiagram P).mapComp' f.op.toLoc g.op.toLoc fg.op.toLoc (by rw [← h]; rfl)).hom.toNatTrans.app x =
      (1 : P.obj (op W)) := by sorry

theorem groupMapComp'_inv (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    {U V W : C} (f : V ⟶ U) (g : W ⟶ V) (fg : W ⟶ U) (h : g ≫ f = fg)
    (x : SingleObj (P.obj (op U))) :
    ((groupDiagram P).mapComp' f.op.toLoc g.op.toLoc fg.op.toLoc (by rw [← h]; rfl)).inv.toNatTrans.app x =
      (1 : P.obj (op W)) := by sorry

theorem groupOfObj_hom (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    {ι : Type*} {U : C} {X : ι → C} (f : ∀ i, X i ⟶ U)
    (x : (groupDiagram P).obj (.mk (op U))) {Y : C} (q : Y ⟶ U) {i j : ι}
    (f₁ : Y ⟶ X i) (f₂ : Y ⟶ X j) (h₁ : f₁ ≫ f i = q) (h₂ : f₂ ≫ f j = q) :
    (Pseudofunctor.DescentData.ofObj (F := groupDiagram P) (f := f) x).hom q f₁ f₂ h₁ h₂ =
      (1 : P.obj (op Y)) := by sorry

theorem groupPullHom (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    {U V W Y : C} {x : (groupDiagram P).obj (.mk (op U))}
    {y : (groupDiagram P).obj (.mk (op V))}
    (f : Y ⟶ U) (g : Y ⟶ V)
    (a : ((groupDiagram P).map f.op.toLoc).toFunctor.obj x ⟶
      ((groupDiagram P).map g.op.toLoc).toFunctor.obj y)
    (h : W ⟶ Y) (hf : W ⟶ U) (hg : W ⟶ V)
    (whf : h ≫ f = hf) (whg : h ≫ g = hg) :
    Pseudofunctor.LocallyDiscreteOpToCat.pullHom a h hf hg = (P.map h.op) a := by sorry

def groupIso (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C)
    (x y : (groupDiagram P).obj (.mk (op U))) (g : P.obj (op U)) : x ≅ y := by sorry

theorem groupDiagram_stack (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    (groupDiagram P).IsStack (⊥ : GrothendieckTopology C) := by sorry

theorem groupDiagram_gerbe (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    IsGerbe (groupDiagram P) (⊥ : GrothendieckTopology C) := by sorry

variable {G : Type chain_w} [CommGroup G]

def singleCenter (g : G) : CatCenter (SingleObj G) := by sorry

def singleCenterUnit (g : G) : (CatCenter (SingleObj G))ˣ := by sorry

theorem singleCenterUnit_app (g : G) (x : SingleObj G) :
    (singleCenterUnit g).val.app x = g := by sorry

noncomputable def groupSection (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    (U : C) (g : P.obj (op U)) : IntrinsicBandSection (groupDiagram P) U := by sorry

theorem groupSection_eval (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    {U V : C} (f : V ⟶ U) (g : P.obj (op U)) :
    (eval (groupDiagram P) f (SingleObj.star (P.obj (op V)))
      (groupSection P U g)).hom = (P.map f.op) g := by sorry

noncomputable def groupSectionsEquiv (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C) :
    P.obj (op U) ≃* IntrinsicBandSection (groupDiagram P) U := by sorry

theorem groupSectionsEquiv_restrict (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    {U V : C} (f : V ⟶ U) (g : P.obj (op U)) :
    restrict (groupDiagram P) f (groupSectionsEquiv P U g) =
      groupSectionsEquiv P V ((P.map f.op) g) := by sorry

variable {B : Type} [SmallCategory B]

noncomputable def groupSectionsPresheafIso (P : Bᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    P ⋙ CommGrpCat.toAddCommGrp ≅ IntrinsicBandSections.presheaf (groupDiagram P) := by sorry

noncomputable def groupBandSheaf (P : Bᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    Sheaf (⊥ : GrothendieckTopology B) AddCommGrpCat.{chain_w} :=
  ⟨IntrinsicBandSections.presheaf (groupDiagram P), Presheaf.isSheaf_bot _⟩

theorem groupBandSheaf_obj (P : Bᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    (groupBandSheaf P).obj = IntrinsicBandSections.presheaf (groupDiagram P) := by sorry

noncomputable def groupBandSheafIso (P : Bᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    (⟨P ⋙ CommGrpCat.toAddCommGrp, Presheaf.isSheaf_bot _⟩ :
      Sheaf (⊥ : GrothendieckTopology B) AddCommGrpCat.{chain_w}) ≅ groupBandSheaf P := by sorry

abbrev reduction : Multiplicative (ZMod 4) →* Multiplicative (ZMod 2) :=
  (ZMod.castHom (show 2 ∣ 4 by decide) (ZMod 2)).toAddMonoidHom.toMultiplicative

abbrev chainGroups : Fin 3 ⥤ CommGrpCat :=
  ComposableArrows.mk₂ (CommGrpCat.ofHom reduction)
    (𝟙 (CommGrpCat.of (Multiplicative (ZMod 2))))

abbrev ChainSite := (Fin 3)ᵒᵖ
abbrev chainPresheaf : ChainSiteᵒᵖ ⥤ CommGrpCat := unopUnop (Fin 3) ⋙ chainGroups
abbrev chainF := groupDiagram chainPresheaf
abbrev U₀ : ChainSite := op (0 : Fin 3)
abbrev U₁ : ChainSite := op (1 : Fin 3)
abbrev U₂ : ChainSite := op (2 : Fin 3)
abbrev f₀₁ : U₁ ⟶ U₀ := (homOfLE (show (0 : Fin 3) ≤ 1 by decide)).op
abbrev f₁₂ : U₂ ⟶ U₁ := (homOfLE (show (1 : Fin 3) ≤ 2 by decide)).op
abbrev f₀₂ : U₂ ⟶ U₀ := (homOfLE (show (0 : Fin 3) ≤ 2 by decide)).op

theorem chain_generator_restrict :
    restrict chainF f₀₁ (groupSectionsEquiv chainPresheaf U₀
      (Multiplicative.ofAdd (1 : ZMod 4))) =
      groupSectionsEquiv chainPresheaf U₁ (Multiplicative.ofAdd (1 : ZMod 2)) := by sorry

theorem chain_generator_comp :
    restrict chainF f₁₂ (restrict chainF f₀₁
      (groupSectionsEquiv chainPresheaf U₀ (Multiplicative.ofAdd (1 : ZMod 4)))) =
      restrict chainF f₀₂
        (groupSectionsEquiv chainPresheaf U₀ (Multiplicative.ofAdd (1 : ZMod 4))) := by sorry

theorem chain_two_killed :
    restrict chainF f₀₁ (groupSectionsEquiv chainPresheaf U₀
      (Multiplicative.ofAdd (2 : ZMod 4))) = 1 := by sorry

theorem chain_restrict_not_injective : ¬ Function.Injective (restrict chainF f₀₁) := by sorry

abbrev TwoChainSite := (Fin 3 ⊕ Fin 3)ᵒᵖ
abbrev twoChainPresheaf : TwoChainSiteᵒᵖ ⥤ CommGrpCat :=
  unopUnop (Fin 3 ⊕ Fin 3) ⋙ chainGroups.sum' chainGroups
abbrev twoChainF := groupDiagram twoChainPresheaf

theorem twoChains_no_terminal (U : TwoChainSite) : ¬ Nonempty (Limits.IsTerminal U) := by sorry

theorem twoChains_sections_equiv (U : TwoChainSite) :
    Nonempty (twoChainPresheaf.obj (op U) ≃* IntrinsicBandSection twoChainF U) := by sorry

theorem groupIso_hom (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C)
    (x y : (groupDiagram P).obj (.mk (op U))) (g : P.obj (op U)) :
    (groupIso P U x y g).hom = g := by sorry

theorem groupIso_inv (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C)
    (x y : (groupDiagram P).obj (.mk (op U))) (g : P.obj (op U)) :
    (groupIso P U x y g).inv = g⁻¹ := by sorry

theorem singleCenter_app (g : G) (x : SingleObj G) : (singleCenter g).app x = g := by sorry

theorem singleCenter_mul (g h : G) : singleCenter (g * h) = singleCenter g * singleCenter h := by sorry

theorem singleCenterUnit_mul (g h : G) :
    singleCenterUnit (g * h) = singleCenterUnit g * singleCenterUnit h := by sorry

theorem groupSection_one (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C) :
    groupSection P U 1 = 1 := by sorry

theorem groupSection_mul (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C)
    (g h : P.obj (op U)) : groupSection P U (g * h) = groupSection P U g * groupSection P U h := by sorry

theorem groupSectionsEquiv_symm_apply (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C)
    (s : IntrinsicBandSection (groupDiagram P) U) :
    (groupSectionsEquiv P U).symm s =
      (val (groupDiagram P) s U (𝟙 U)).val.app (SingleObj.star (P.obj (op U))) := by sorry

theorem groupSectionsPresheafIso_hom_app (P : Bᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : Bᵒᵖ)
    (g : Additive (P.obj U)) :
    (groupSectionsPresheafIso P).hom.app U g = Additive.ofMul
      (groupSectionsEquiv P U.unop g.toMul) := by sorry

theorem groupBandSheafIso_hom (P : Bᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    (groupBandSheafIso P).hom.hom = (groupSectionsPresheafIso P).hom := by sorry

theorem chain_stack : chainF.IsStack (⊥ : GrothendieckTopology ChainSite) := by sorry

theorem chain_gerbe : IsGerbe chainF (⊥ : GrothendieckTopology ChainSite) := by sorry

theorem twoChains_stack : twoChainF.IsStack (⊥ : GrothendieckTopology TwoChainSite) := by sorry

theorem twoChains_gerbe : IsGerbe twoChainF (⊥ : GrothendieckTopology TwoChainSite) := by sorry

theorem chain_source_card : Nat.card (IntrinsicBandSection chainF U₀) = 4 := by sorry

theorem chain_target_card : Nat.card (IntrinsicBandSection chainF U₁) = 2 := by sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.RestrictionBandFixtures

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.RestrictionBandFixtures.RestrictionBandTests
open CategoryTheory Opposite Bicategory IntrinsicBandSections
universe chain_u chain_v chain_w
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type chain_u} [Category.{chain_v} C]
variable (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C)

-- RestrictionBandTests.isoUnit
example (x y : (groupDiagram P).obj (.mk (op U))) :
    (groupIso P U x y 1).hom ≫ (groupIso P U x y 1).inv = 𝟙 x := by sorry

-- RestrictionBandTests.isoInverseQuarter
example :
    (groupIso chainPresheaf U₀ (SingleObj.star (Multiplicative (ZMod 4))) (SingleObj.star (Multiplicative (ZMod 4)))
      (Multiplicative.ofAdd (1 : ZMod 4))).inv = Multiplicative.ofAdd (3 : ZMod 4) := by sorry

-- RestrictionBandTests.isoQuarterRoundTrip
example :
    (groupIso chainPresheaf U₀ (SingleObj.star (Multiplicative (ZMod 4))) (SingleObj.star (Multiplicative (ZMod 4)))
      (Multiplicative.ofAdd (1 : ZMod 4))).hom ≫
      (groupIso chainPresheaf U₀ (SingleObj.star (Multiplicative (ZMod 4))) (SingleObj.star (Multiplicative (ZMod 4)))
        (Multiplicative.ofAdd (1 : ZMod 4))).inv = 𝟙 (SingleObj.star (Multiplicative (ZMod 4))) := by sorry

-- RestrictionBandTests.centerNaturality
example (a : Multiplicative (ZMod 4)) :
    (singleCenter (Multiplicative.ofAdd (1 : ZMod 4))).app (SingleObj.star (Multiplicative (ZMod 4))) ≫
        (a : SingleObj.star (Multiplicative (ZMod 4)) ⟶ SingleObj.star (Multiplicative (ZMod 4))) =
      (a : SingleObj.star (Multiplicative (ZMod 4)) ⟶ SingleObj.star (Multiplicative (ZMod 4))) ≫
        (singleCenter (Multiplicative.ofAdd (1 : ZMod 4))).app (SingleObj.star (Multiplicative (ZMod 4))) := by sorry

-- RestrictionBandTests.centerDoubleGenerator
example :
    singleCenter (Multiplicative.ofAdd (2 : ZMod 4)) =
      singleCenter (Multiplicative.ofAdd (1 : ZMod 4)) *
        singleCenter (Multiplicative.ofAdd (1 : ZMod 4)) := by sorry

-- RestrictionBandTests.centerUnitOrderFour
example :
    (singleCenterUnit (Multiplicative.ofAdd (1 : ZMod 4))) ^ 4 = 1 := by sorry

-- RestrictionBandTests.unitInverseCoefficient
example :
    (singleCenterUnit (Multiplicative.ofAdd (1 : ZMod 4))).inv.app (SingleObj.star (Multiplicative (ZMod 4))) =
      Multiplicative.ofAdd (3 : ZMod 4) := by sorry

-- RestrictionBandTests.unitDoubleGenerator
example :
    singleCenterUnit (Multiplicative.ofAdd (2 : ZMod 4)) =
      singleCenterUnit (Multiplicative.ofAdd (1 : ZMod 4)) *
        singleCenterUnit (Multiplicative.ofAdd (1 : ZMod 4)) := by sorry

-- RestrictionBandTests.sectionEvaluation
example :
    (eval chainF f₀₁ (SingleObj.star (Multiplicative (ZMod 2))) (groupSection chainPresheaf U₀
      (Multiplicative.ofAdd (1 : ZMod 4)))).hom = Multiplicative.ofAdd (1 : ZMod 2) := by sorry

-- RestrictionBandTests.sectionKilled
example : restrict chainF f₀₁ (groupSection chainPresheaf U₀
    (Multiplicative.ofAdd (2 : ZMod 4))) = 1 := by sorry

-- RestrictionBandTests.sectionComposition
example :
    restrict chainF f₁₂ (restrict chainF f₀₁
      (groupSection chainPresheaf U₀ (Multiplicative.ofAdd (1 : ZMod 4)))) =
      restrict chainF f₀₂
        (groupSection chainPresheaf U₀ (Multiplicative.ofAdd (1 : ZMod 4))) := by sorry

-- RestrictionBandTests.equivalenceLeftRoundTrip
example (g : P.obj (op U)) :
    (groupSectionsEquiv P U).symm (groupSectionsEquiv P U g) = g := by sorry

-- RestrictionBandTests.equivalenceRightRoundTrip
example (s : IntrinsicBandSection (groupDiagram P) U) :
    groupSectionsEquiv P U ((groupSectionsEquiv P U).symm s) = s := by sorry

-- RestrictionBandTests.equivalenceDifferentCardinalities
example :
    Nat.card (IntrinsicBandSection chainF U₀) = 4 ∧
      Nat.card (IntrinsicBandSection chainF U₁) = 2 := by sorry

variable {B : Type} [SmallCategory B] (Q : Bᵒᵖ ⥤ CommGrpCat.{chain_w})

-- RestrictionBandTests.presheafForward
example (V : Bᵒᵖ) (g : Additive (Q.obj V)) :
    (groupSectionsPresheafIso Q).hom.app V g =
      Additive.ofMul (groupSectionsEquiv Q V.unop g.toMul) := by sorry

-- RestrictionBandTests.presheafInverse
example (V : Bᵒᵖ) :
    (groupSectionsPresheafIso Q).hom.app V ≫ (groupSectionsPresheafIso Q).inv.app V = 𝟙 _ := by sorry

-- RestrictionBandTests.presheafNaturality
example {V W : Bᵒᵖ} (f : V ⟶ W) :
    (Q ⋙ CommGrpCat.toAddCommGrp).map f ≫ (groupSectionsPresheafIso Q).hom.app W =
      (groupSectionsPresheafIso Q).hom.app V ≫
        (IntrinsicBandSections.presheaf (groupDiagram Q)).map f := by sorry

-- RestrictionBandTests.sheafNative
example : Presheaf.IsSheaf (⊥ : GrothendieckTopology B)
    (groupBandSheaf Q).obj := by sorry

-- RestrictionBandTests.sheafObject
example : (groupBandSheaf Q).obj =
    IntrinsicBandSections.presheaf (groupDiagram Q) := by sorry

-- RestrictionBandTests.sheafRestrictionGenerator
example :
    (groupBandSheaf chainPresheaf).obj.map f₀₁.op
      (Additive.ofMul (groupSectionsEquiv chainPresheaf U₀ (Multiplicative.ofAdd (1 : ZMod 4)))) =
      Additive.ofMul (groupSectionsEquiv chainPresheaf U₁ (Multiplicative.ofAdd (1 : ZMod 2))) := by sorry

-- RestrictionBandTests.sheafIsoForwardInverse
example :
    (groupBandSheafIso Q).hom ≫ (groupBandSheafIso Q).inv = 𝟙 _ := by sorry

-- RestrictionBandTests.sheafIsoInverseForward
example :
    (groupBandSheafIso Q).inv ≫ (groupBandSheafIso Q).hom = 𝟙 _ := by sorry

-- RestrictionBandTests.sheafIsoGenerator
example :
    (groupBandSheafIso chainPresheaf).hom.hom.app (op U₀)
      (Additive.ofMul (Multiplicative.ofAdd (1 : ZMod 4))) =
      Additive.ofMul (groupSection chainPresheaf U₀ (Multiplicative.ofAdd (1 : ZMod 4))) := by sorry

-- RestrictionBandTests.chainGerbe
example : IsGerbe chainF (⊥ : GrothendieckTopology ChainSite) := by sorry

-- RestrictionBandTests.restrictionNotInjective
example : ¬ Function.Injective (restrict chainF f₀₁) := by sorry

-- RestrictionBandTests.noTerminal
example (V : TwoChainSite) : ¬ Nonempty (Limits.IsTerminal V) := by sorry

-- RestrictionBandTests.terminalFreeGerbe
example : IsGerbe twoChainF (⊥ : GrothendieckTopology TwoChainSite) := by sorry

-- RestrictionBandTests.leftChainSourceCard
example :
    Nat.card (IntrinsicBandSection twoChainF (op (Sum.inl (0 : Fin 3)))) = 4 := by sorry

-- RestrictionBandTests.rightChainTargetCard
example :
    Nat.card (IntrinsicBandSection twoChainF (op (Sum.inr (1 : Fin 3)))) = 2 := by sorry

-- RestrictionBandTests.terminalFreeSheafIso
example :
    Nonempty ((⟨twoChainPresheaf ⋙ CommGrpCat.toAddCommGrp, Presheaf.isSheaf_bot _⟩ :
      Sheaf (⊥ : GrothendieckTopology TwoChainSite) AddCommGrpCat) ≅
      groupBandSheaf twoChainPresheaf) := by sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.RestrictionBandFixtures.RestrictionBandTests

/-! ## Layer R09.4 (continued): Isom sheaves and the principal band action -/

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedIsom
open CategoryTheory Opposite Bicategory
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
variable (J : GrothendieckTopology C) [IsGerbe F J]
variable (A : Sheaf J AddCommGrpCat.{v'}) (b : AbelianBanding F J A)
variable {U : C} {x y z : F.obj (.mk (op U))}

/-- The action is defined without a global isomorphism or chosen neutralization. -/
def act (b : AbelianBanding F J A) (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) : x ≅ y := by
  sorry

theorem act_one (p : x ≅ y) : act F J A b p 1 = p := by
  sorry

theorem act_mul (p : x ≅ y) (a c : Multiplicative (A.obj.obj (op U))) :
    act F J A b p (a * c) = act F J A b (act F J A b p c) a := by
  sorry

/-- The unique coefficient carrying p to q, computed using the inverse of p. -/
def difference (b : AbelianBanding F J A) (p q : x ≅ y) : Multiplicative (A.obj.obj (op U)) := by
  sorry

theorem act_difference (p q : x ≅ y) : act F J A b p (difference F J A b p q) = q := by
  sorry

theorem difference_act (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    difference F J A b p (act F J A b p a) = a := by
  sorry

theorem difference_self (p : x ≅ y) : difference F J A b p p = 1 := by
  sorry

theorem act_precompose (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    act F J A b p a = b.autEquiv U x a ≪≫ p := by
  sorry

theorem act_postcompose (p : x ≅ y) (q : y ≅ z)
    (a : Multiplicative (A.obj.obj (op U))) :
    act F J A b p a ≪≫ q = act F J A b (p ≪≫ q) a := by
  sorry

/-- Principal comparison exists even when the global section type is empty. -/
def principalEquiv (b : AbelianBanding F J A) (x y : F.obj (.mk (op U))) :
    ((x ≅ y) × Multiplicative (A.obj.obj (op U))) ≃ ((x ≅ y) × (x ≅ y)) := by
  sorry

/-- torsor instance is offered only under explicit nonemptiness. -/
@[instance_reducible]
def isomTorsor (b : AbelianBanding F J A) (x y : F.obj (.mk (op U))) (h : Nonempty (x ≅ y)) :
    Torsor (Multiplicative (A.obj.obj (op U))) (x ≅ y) := by
  sorry

/-- An anchor trivializes the section torsor. -/
def coordinateEquiv (b : AbelianBanding F J A) (p : x ≅ y) :
    Multiplicative (A.obj.obj (op U)) ≃ (x ≅ y) := by
  sorry

theorem coordinate_one (p : x ≅ y) : coordinateEquiv F J A b p 1 = p := by
  sorry

theorem coordinate_change (p q : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    coordinateEquiv F J A b q a =
      coordinateEquiv F J A b p (a * difference F J A b p q) := by
  sorry

theorem difference_cocycle (p q r : x ≅ y) :
    difference F J A b p r = difference F J A b q r * difference F J A b p q := by
  sorry

theorem restrict_act {V : C} (f : V ⟶ U) (p : x ≅ y)
    (a : Multiplicative (A.obj.obj (op U))) :
    (F.map f.op.toLoc).toFunctor.mapIso (act F J A b p a) =
      act F J A b ((F.map f.op.toLoc).toFunctor.mapIso p)
        (Multiplicative.ofAdd ((A.obj.map f.op) a.toAdd)) := by
  sorry

theorem restrict_difference {V : C} (f : V ⟶ U) (p q : x ≅ y) :
    difference F J A b ((F.map f.op.toLoc).toFunctor.mapIso p)
      ((F.map f.op.toLoc).toFunctor.mapIso q) =
        Multiplicative.ofAdd ((A.obj.map f.op) (difference F J A b p q).toAdd) := by
  sorry

/-- Isomorphism to the already built Hom type: the groupoid condition is essential. -/
noncomputable def homEquiv (J : GrothendieckTopology C) [IsGerbe F J] (x y : F.obj (.mk (op U))) : (x ≅ y) ≃ (x ⟶ y) := by
  sorry

def homAct (b : AbelianBanding F J A) (p : x ⟶ y) (a : Multiplicative (A.obj.obj (op U))) : x ⟶ y := by
  sorry

noncomputable def homPrincipalEquiv (b : AbelianBanding F J A) (x y : F.obj (.mk (op U))) :
    ((x ⟶ y) × Multiplicative (A.obj.obj (op U))) ≃ ((x ⟶ y) × (x ⟶ y)) := by
  sorry

theorem homPrincipalEquiv_apply (p : x ⟶ y) (a : Multiplicative (A.obj.obj (op U))) :
    homPrincipalEquiv F J A b x y (p,a) = (p, homAct F J A b p a) := by
  sorry

/-- Hom restriction includes the pseudofunctor comparison isomorphisms. -/
theorem pullHom_act {V W : C} (f : V ⟶ U) (h : W ⟶ V) (hf : W ⟶ U)
    (hh : h ≫ f = hf)
    (p : (F.map f.op.toLoc).toFunctor.obj x ⟶ (F.map f.op.toLoc).toFunctor.obj y)
    (a : Multiplicative (A.obj.obj (op V))) :
    pullHom (homAct F J A b p a) h hf hf hh hh =
      homAct F J A b (pullHom p h hf hf hh hh)
        (Multiplicative.ofAdd ((A.obj.map h.op) a.toAdd)) := by
  sorry

/-- Pair presheaf underlying the Hom sheaf on C/U. -/
def pairPresheaf (x y : F.obj (.mk (op U))) : (Over U)ᵒᵖ ⥤ Type v' := by
  sorry

/-- Product of the same Hom presheaf with the restricted coefficient presheaf. -/
def actionPresheaf (A : Sheaf J AddCommGrpCat.{v'}) (x y : F.obj (.mk (op U))) : (Over U)ᵒᵖ ⥤ Type v' := by
  sorry

/-- natural principal comparison, retaining all slice-arrow coherence. -/
noncomputable def principalPresheafIso (b : AbelianBanding F J A) (x y : F.obj (.mk (op U))) :
    actionPresheaf F J A x y ≅ pairPresheaf F x y := by
  sorry

theorem pair_isSheaf (x y : F.obj (.mk (op U))) :
    Presheaf.IsSheaf (J.over U) (pairPresheaf F x y) := by
  sorry

theorem action_isSheaf (b : AbelianBanding F J A) (x y : F.obj (.mk (op U))) :
    Presheaf.IsSheaf (J.over U) (actionPresheaf F J A x y) := by
  sorry

noncomputable def pairSheaf (x y : F.obj (.mk (op U))) : Sheaf (J.over U) (Type v') := by
  sorry

noncomputable def actionSheaf (b : AbelianBanding F J A) (x y : F.obj (.mk (op U))) : Sheaf (J.over U) (Type v') := by
  sorry

/-- sheaf principal comparison, on the already built sheaf carrier. -/
noncomputable def principalSheafIso (x y : F.obj (.mk (op U))) :
    actionSheaf F J A b x y ≅ pairSheaf F J x y := by
  sorry

theorem hom_localNonempty (x y : F.obj (.mk (op U))) :
    ∃ R : Sieve U, R ∈ J U ∧ ∀ ⦃V : C⦄ (f : V ⟶ U), R f →
      Nonempty ((F.map f.op.toLoc).toFunctor.obj x ⟶ (F.map f.op.toLoc).toFunctor.obj y) := by
  sorry

theorem principalEquiv_apply (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    principalEquiv F J A b x y (p,a) = (p, act F J A b p a) := by
  sorry

theorem principalEquiv_symm_apply (p q : x ≅ y) :
    (principalEquiv F J A b x y).symm (p,q) = (p, difference F J A b p q) := by
  sorry

theorem coordinate_apply (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    coordinateEquiv F J A b p a = act F J A b p a := by
  sorry

theorem coordinate_symm_apply (p q : x ≅ y) :
    (coordinateEquiv F J A b p).symm q = difference F J A b p q := by
  sorry

theorem principalSheafIso_hom (x y : F.obj (.mk (op U))) :
    HEq (principalSheafIso F J A b x y).hom.hom (principalPresheafIso F J A b x y).hom := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedIsom

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedIsom.Tests
open CategoryTheory Opposite Bicategory
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
variable (J : GrothendieckTopology C) [IsGerbe F J]
variable (A : Sheaf J AddCommGrpCat.{v'}) (b : AbelianBanding F J A)
variable {U : C} {x y z : F.obj (.mk (op U))}

-- BandedIsom.Tests.zeroAction
example (p : x ≅ y) : act F J A b p 1 = p := by
  sorry

-- BandedIsom.Tests.actionOrder
example (p : x ≅ y) (a c : Multiplicative (A.obj.obj (op U))) :
    act F J A b (act F J A b p c) a = act F J A b p (a*c) := by
  sorry

-- BandedIsom.Tests.precomposition
example (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    act F J A b p a = b.autEquiv U x a ≪≫ p := by
  sorry

-- BandedIsom.Tests.composition
example (p : x ≅ y) (q : y ≅ z) (a : Multiplicative (A.obj.obj (op U))) :
    act F J A b p a ≪≫ q = act F J A b (p ≪≫ q) a := by
  sorry

-- BandedIsom.Tests.uniqueCoefficient
example (p q : x ≅ y) :
    ∃! a : Multiplicative (A.obj.obj (op U)), act F J A b p a = q := by
  sorry

-- BandedIsom.Tests.differenceZero
example (p : x ≅ y) : difference F J A b p p = 1 := by
  sorry

-- BandedIsom.Tests.differenceRecovery
example (p q : x ≅ y) :
    act F J A b p (difference F J A b p q) = q := by
  sorry

-- BandedIsom.Tests.differenceCocycle
example (p q r : x ≅ y) :
    difference F J A b p r = difference F J A b q r * difference F J A b p q := by
  sorry

-- BandedIsom.Tests.principalLeft
example (t : (x ≅ y) × Multiplicative (A.obj.obj (op U))) :
    (principalEquiv F J A b x y).symm (principalEquiv F J A b x y t) = t := by
  sorry

-- BandedIsom.Tests.principalRight
example (t : (x ≅ y) × (x ≅ y)) :
    principalEquiv F J A b x y ((principalEquiv F J A b x y).symm t) = t := by
  sorry

-- BandedIsom.Tests.principalWithoutAnchor
example (b : AbelianBanding F J A) :
    Nonempty (((x ≅ y) × Multiplicative (A.obj.obj (op U))) ≃ ((x ≅ y) × (x ≅ y))) := by
  sorry

omit [IsGerbe F J] in
-- BandedIsom.Tests.noPointCreated
example [IsEmpty (x ≅ y)] :
    IsEmpty ((x ≅ y) × Multiplicative (A.obj.obj (op U))) := by
  sorry

-- BandedIsom.Tests.torsorDivision
example (p q : x ≅ y) :
    (letI := isomTorsor F J A b x y ⟨p⟩
     (p /ₛ q : Multiplicative (A.obj.obj (op U))) • q = p) := by
  sorry

-- BandedIsom.Tests.selfCoefficient
example (a : Multiplicative (A.obj.obj (op U))) :
    coordinateEquiv F J A b (Iso.refl x) a = b.autEquiv U x a := by
  sorry

-- BandedIsom.Tests.selfZero
example : coordinateEquiv F J A b (Iso.refl x) 1 = Iso.refl x := by
  sorry

-- BandedIsom.Tests.nonzeroMoves
example (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) (ha : a ≠ 1) :
    act F J A b p a ≠ p := by
  sorry

-- BandedIsom.Tests.zeroBandUnique
example (b : AbelianBanding F J A) [Subsingleton (A.obj.obj (op U))] (p q : x ≅ y) : p = q := by
  sorry

-- BandedIsom.Tests.changedAnchor
example (p q : x ≅ y) :
    coordinateEquiv F J A b p (difference F J A b p q) = q := by
  sorry

-- BandedIsom.Tests.homUsesActualArrow
example (p : x ≅ y) : homEquiv F J x y p = p.hom := by
  sorry

-- BandedIsom.Tests.homComparison
example (p : x ⟶ y) (a : Multiplicative (A.obj.obj (op U))) :
    homPrincipalEquiv F J A b x y (p,a) = (p,p ≫ (b.autEquiv U y a).hom) := by
  sorry

-- BandedIsom.Tests.restrictionAction
example {V : C} (f : V ⟶ U) (p : x ≅ y)
    (a : Multiplicative (A.obj.obj (op U))) :
    (F.map f.op.toLoc).toFunctor.mapIso (act F J A b p a) =
      act F J A b ((F.map f.op.toLoc).toFunctor.mapIso p)
        (Multiplicative.ofAdd ((A.obj.map f.op) a.toAdd)) := by
  sorry

-- BandedIsom.Tests.restrictionDifference
example {V : C} (f : V ⟶ U) (p q : x ≅ y) :
    difference F J A b ((F.map f.op.toLoc).toFunctor.mapIso p)
      ((F.map f.op.toLoc).toFunctor.mapIso q) =
        Multiplicative.ofAdd ((A.obj.map f.op) (difference F J A b p q).toAdd) := by
  sorry

-- BandedIsom.Tests.pairSheafNative
example : Presheaf.IsSheaf (J.over U) (pairPresheaf F x y) := by
  sorry

-- BandedIsom.Tests.actionSheafNative
example (b : AbelianBanding F J A) :
    Presheaf.IsSheaf (J.over U) (actionPresheaf F J A x y) := by
  sorry

-- BandedIsom.Tests.sheafLeft
example :
    (principalSheafIso F J A b x y).hom ≫ (principalSheafIso F J A b x y).inv =
      𝟙 (actionSheaf F J A b x y) := by
  sorry

-- BandedIsom.Tests.sheafRight
example :
    (principalSheafIso F J A b x y).inv ≫ (principalSheafIso F J A b x y).hom =
      𝟙 (pairSheaf F J x y) := by
  sorry

-- BandedIsom.Tests.sheafUnderlying
example :
    HEq (principalSheafIso F J A b x y).hom.hom (principalPresheafIso F J A b x y).hom := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedIsom.Tests

/-! ## Layer R09.4 (continued): band-preserving morphisms, Hom sheaves, descent and the global Hom sheaf -/

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry
open CategoryTheory Opposite Bicategory
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
variable {F G H : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
variable {J : GrothendieckTopology C} [IsGerbe F J] [IsGerbe G J] [IsGerbe H J]
variable {A : Sheaf J AddCommGrpCat.{v'}}
namespace BandedMorphism
variable (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
variable (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
variable {U : C} {x y : F.obj (.mk (op U))}
include bF bG

theorem map_act (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    (η.app (.mk (op U))).toFunctor.mapIso (BandedIsom.act F J A bF p a) =
      BandedIsom.act G J A bG ((η.app (.mk (op U))).toFunctor.mapIso p) a := by
  sorry

theorem map_difference (p q : x ≅ y) :
    BandedIsom.difference G J A bG ((η.app (.mk (op U))).toFunctor.mapIso p)
      ((η.app (.mk (op U))).toFunctor.mapIso q) = BandedIsom.difference F J A bF p q := by
  sorry

theorem mapIso_injective : Function.Injective
    ((η.app (.mk (op U))).toFunctor.mapIso : (x ≅ y) → _) := by
  sorry

theorem faithful (U : C) : (η.app (.mk (op U))).toFunctor.Faithful := by
  sorry

/-- An source anchor supplies a preimage; no global anchor is inferred. -/
def preimageIso (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) (p : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) : x ≅ y := by
  sorry

theorem map_preimageIso (p : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) :
    (η.app (.mk (op U))).toFunctor.mapIso (preimageIso bF bG η p q) = q := by
  sorry

theorem preimageIso_map (p q : x ≅ y) :
    preimageIso bF bG η p ((η.app (.mk (op U))).toFunctor.mapIso q) = q := by
  sorry

theorem preimageIso_anchor (p p' : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) :
    preimageIso bF bG η p q = preimageIso bF bG η p' q := by
  sorry

def isomEquiv (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] (p : x ≅ y) : (x ≅ y) ≃
    ((η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) := by
  sorry

theorem isomEquiv_apply (p q : x ≅ y) :
    isomEquiv bF bG η p q = (η.app (.mk (op U))).toFunctor.mapIso q := by
  sorry

theorem isomEquiv_symm_apply (p : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) :
    (isomEquiv bF bG η p).symm q = preimageIso bF bG η p q := by
  sorry

theorem isomEquiv_anchor (p p' : x ≅ y) : isomEquiv bF bG η p = isomEquiv bF bG η p' := by
  sorry

theorem preimageIso_act (p : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y)
    (a : Multiplicative (A.obj.obj (op U))) :
    preimageIso bF bG η p (BandedIsom.act G J A bG q a) =
      BandedIsom.act F J A bF (preimageIso bF bG η p q) a := by
  sorry

theorem hom_surjective_of_anchor (p : x ≅ y) : Function.Surjective
    ((η.app (.mk (op U))).toFunctor.map : (x ⟶ y) → _) := by
  sorry

/-- The automorphism map, expressed through the fixed band's equivalences. -/
def autEquiv (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) (x : F.obj (.mk (op U))) : Aut x ≃*
    Aut ((η.app (.mk (op U))).toFunctor.obj x) := by
  sorry

theorem autEquiv_apply (x : F.obj (.mk (op U))) (a : Aut x) :
    autEquiv bF bG η x a = (η.app (.mk (op U))).toFunctor.mapAut x a := by
  sorry

omit [BandPreserving bF bG η] in
theorem autEquiv_band (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    autEquiv bF bG η x (bF.autEquiv U x a) = bG.autEquiv U _ a := by
  sorry

omit [BandPreserving bF bG η] in
theorem autEquiv_symm_band (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    (autEquiv bF bG η x).symm (bG.autEquiv U _ a) = bF.autEquiv U x a := by
  sorry

omit bG [IsGerbe G J] [BandPreserving bF bG η] in
theorem preimageIso_id (p q : x ≅ y) :
    preimageIso bF bF (Pseudofunctor.StrongTrans.id F) p q = q := by
  sorry

theorem preimageIso_comp (bH : AbelianBanding H J A)
    (θ : Pseudofunctor.StrongTrans G H) [BandPreserving bG bH θ] (p : x ≅ y)
    (q : (θ.app (.mk (op U))).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (θ.app (.mk (op U))).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    preimageIso bF bH (Pseudofunctor.StrongTrans.vcomp η θ) p q =
      preimageIso bF bG η p
        (preimageIso bG bH θ ((η.app (.mk (op U))).toFunctor.mapIso p) q) := by
  sorry

theorem locallyIsomEquiv (x y : F.obj (.mk (op U))) :
    ∃ R : Sieve U, R ∈ J U ∧ ∀ ⦃V : C⦄ (f : V ⟶ U), R f → Nonempty
      (((F.map f.op.toLoc).toFunctor.obj x ≅ (F.map f.op.toLoc).toFunctor.obj y) ≃
       ((η.app (.mk (op V))).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj x) ≅
        (η.app (.mk (op V))).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj y))) := by
  sorry

namespace Tests
-- BandedMorphism.Tests.inverseLeft
example (p q : x ≅ y) : preimageIso bF bG η p
    ((η.app (.mk (op U))).toFunctor.mapIso q) = q := by
  sorry

-- BandedMorphism.Tests.inverseRight
example (p : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) :
    (η.app (.mk (op U))).toFunctor.mapIso (preimageIso bF bG η p q) = q := by
  sorry

-- BandedMorphism.Tests.independentAnchor
example (p p' : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) :
    preimageIso bF bG η p q = preimageIso bF bG η p' q := by
  sorry

-- BandedMorphism.Tests.equivLeft
example (p q : x ≅ y) :
    (isomEquiv bF bG η p).symm (isomEquiv bF bG η p q) = q := by
  sorry

-- BandedMorphism.Tests.equivRight
example (p : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) :
    isomEquiv bF bG η p ((isomEquiv bF bG η p).symm q) = q := by
  sorry

-- BandedMorphism.Tests.equivUsesMap
example (p q : x ≅ y) : isomEquiv bF bG η p q =
    (η.app (.mk (op U))).toFunctor.mapIso q := by
  sorry

omit [BandPreserving bF bG η] in
-- BandedMorphism.Tests.autLeft
example (x : F.obj (.mk (op U))) (a : Aut x) :
    (autEquiv bF bG η x).symm (autEquiv bF bG η x a) = a := by
  sorry

omit [BandPreserving bF bG η] in
-- BandedMorphism.Tests.autRight
example (x : F.obj (.mk (op U))) (a : Aut ((η.app (.mk (op U))).toFunctor.obj x)) :
    autEquiv bF bG η x ((autEquiv bF bG η x).symm a) = a := by
  sorry

-- BandedMorphism.Tests.autUsesMap
example (x : F.obj (.mk (op U))) (a : Aut x) : autEquiv bF bG η x a =
    (η.app (.mk (op U))).toFunctor.mapAut x a := by
  sorry

-- BandedMorphism.Tests.nonzeroRetained
example (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) (ha : a ≠ 1) :
    (η.app (.mk (op U))).toFunctor.mapAut x (bF.autEquiv U x a) ≠ 1 := by
  sorry

-- BandedMorphism.Tests.preservesAction
example (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    (η.app (.mk (op U))).toFunctor.mapIso (BandedIsom.act F J A bF p a) =
      BandedIsom.act G J A bG ((η.app (.mk (op U))).toFunctor.mapIso p) a := by
  sorry

-- BandedMorphism.Tests.preservesDifference
example (p q : x ≅ y) :
    BandedIsom.difference G J A bG ((η.app (.mk (op U))).toFunctor.mapIso p)
      ((η.app (.mk (op U))).toFunctor.mapIso q) =
      BandedIsom.difference F J A bF p q := by
  sorry

-- BandedMorphism.Tests.separatesArrows
example (p q : x ⟶ y) (h : (η.app (.mk (op U))).toFunctor.map p =
    (η.app (.mk (op U))).toFunctor.map q) : p = q := by
  sorry

omit bF bG [IsGerbe F J] [IsGerbe G J] [BandPreserving bF bG η] in
-- BandedMorphism.Tests.emptySourceNotFilled
example (h : IsEmpty (x ≅ y)) :
    ¬ ∃ _p : x ≅ y, Function.Surjective
      ((η.app (.mk (op U))).toFunctor.mapIso : (x ≅ y) → _) := by
  sorry

omit [BandPreserving bF bG η] in
-- BandedMorphism.Tests.changedCoefficientRejected
example (x : F.obj (.mk (op U)))
    (a a' : Multiplicative (A.obj.obj (op U))) (h : a ≠ a')
    (bad : (η.app (.mk (op U))).toFunctor.mapAut x (bF.autEquiv U x a) = bG.autEquiv U _ a') :
    ¬ BandPreserving bF bG η := by
  sorry

end Tests

end BandedMorphism
end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback
open CategoryTheory Opposite Bicategory
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
variable {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
variable (η : Pseudofunctor.StrongTrans F G)
variable {U V : C} (f : V ⟶ U) (x y : F.obj (.mk (op U)))

/-- The component of the strong-naturality isomorphism. -/
def comparison :
    (η.app (.mk (op V))).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) := by sorry

theorem comparison_native : comparison η f x =
    (Cat.Hom.toNatIso (η.naturality f.op.toLoc)).app x := by sorry

theorem comparison_inv_hom_id :
    (comparison η f x).inv ≫ (comparison η f x).hom = 𝟙 _ := by sorry

/-- Use the Iso.isoCongr, retaining both comparison components. -/
def mapIso (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y) := by sorry

/-- Objectwise map on the Hom-presheaf carriers. -/
def homMap (p : (F.map f.op.toLoc).toFunctor.obj x ⟶
    (F.map f.op.toLoc).toFunctor.obj y) :
    (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ⟶
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y) := by sorry

theorem mapIso_hom (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    (mapIso η f x y p).hom = homMap η f x y p.hom := by sorry

theorem homMap_restrict (p : x ⟶ y) :
    homMap η f x y ((F.map f.op.toLoc).toFunctor.map p) =
      (G.map f.op.toLoc).toFunctor.map ((η.app (.mk (op U))).toFunctor.map p) := by sorry

theorem mapIso_restrict (p : x ≅ y) :
    mapIso η f x y ((F.map f.op.toLoc).toFunctor.mapIso p) =
      (G.map f.op.toLoc).toFunctor.mapIso ((η.app (.mk (op U))).toFunctor.mapIso p) := by sorry

variable {J : GrothendieckTopology C} [IsGerbe F J] [IsGerbe G J]
variable {A : Sheaf J AddCommGrpCat.{v'}}
variable (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
variable [BandPreserving bF bG η]

theorem comparison_band (a : Multiplicative (A.obj.obj (op V))) :
    Aut.autMulEquivOfIso (comparison η f x)
      (bG.autEquiv V ((η.app (.mk (op V))).toFunctor.obj
        ((F.map f.op.toLoc).toFunctor.obj x)) a) =
      bG.autEquiv V ((G.map f.op.toLoc).toFunctor.obj
        ((η.app (.mk (op U))).toFunctor.obj x)) a := by sorry

include bF bG

theorem mapIso_injective : Function.Injective (mapIso η f x y) := by sorry

theorem homMap_injective : Function.Injective (homMap η f x y) := by sorry

theorem mapIso_act (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) (a : Multiplicative (A.obj.obj (op V))) :
    mapIso η f x y (BandedIsom.act F J A bF p a) =
      BandedIsom.act G J A bG (mapIso η f x y p) a := by sorry

theorem mapIso_difference (p q : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    BandedIsom.difference G J A bG (mapIso η f x y p) (mapIso η f x y q) =
      BandedIsom.difference F J A bF p q := by sorry

/-- An local source anchor is retained as explicit data. -/
def preimageIso (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    (F.map f.op.toLoc).toFunctor.obj x ≅ (F.map f.op.toLoc).toFunctor.obj y := by sorry

theorem map_preimageIso (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    mapIso η f x y (preimageIso η f x y bF bG p q) = q := by sorry

theorem preimageIso_map (p q : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    preimageIso η f x y bF bG p (mapIso η f x y q) = q := by sorry

theorem preimageIso_anchor (p p' : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    preimageIso η f x y bF bG p q = preimageIso η f x y bF bG p' q := by sorry

theorem preimageIso_act (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y))
    (a : Multiplicative (A.obj.obj (op V))) :
    preimageIso η f x y bF bG p (BandedIsom.act G J A bG q a) =
      BandedIsom.act F J A bF (preimageIso η f x y bF bG p q) a := by sorry

theorem preimageIso_restrict (p : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) :
    preimageIso η f x y bF bG ((F.map f.op.toLoc).toFunctor.mapIso p)
      ((G.map f.op.toLoc).toFunctor.mapIso q) =
      (F.map f.op.toLoc).toFunctor.mapIso (BandedMorphism.preimageIso bF bG η p q) := by sorry

def isomEquiv (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    [BandPreserving bF bG η] (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    ((F.map f.op.toLoc).toFunctor.obj x ≅ (F.map f.op.toLoc).toFunctor.obj y) ≃
      ((G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
        (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) := by sorry

theorem isomEquiv_apply (p q : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    isomEquiv η f x y bF bG p q = mapIso η f x y q := by sorry

theorem isomEquiv_symm_apply (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    (isomEquiv η f x y bF bG p).symm q = preimageIso η f x y bF bG p q := by sorry

theorem isomEquiv_anchor (p p' : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    isomEquiv η f x y bF bG p = isomEquiv η f x y bF bG p' := by sorry

theorem homMap_surjective_of_anchor (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) : Function.Surjective (homMap η f x y) := by sorry

/-- The covering sieve comes from the gerbe, with no global anchor chosen. -/
theorem locallyIsomEquiv : ∃ R : Sieve U, R ∈ J U ∧ ∀ ⦃V : C⦄ (f : V ⟶ U), R f →
    Nonempty (((F.map f.op.toLoc).toFunctor.obj x ≅ (F.map f.op.toLoc).toFunctor.obj y) ≃
      ((G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
        (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y))) := by sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests
open CategoryTheory Opposite Bicategory
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
variable {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
variable (η : Pseudofunctor.StrongTrans F G)
variable {U V : C} (f : V ⟶ U) (x y : F.obj (.mk (op U)))

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.nativeComparison
example : comparison η f x =
    (Cat.Hom.toNatIso (η.naturality f.op.toLoc)).app x := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.zeroComparison
example :
    (comparison η f x).inv ≫ (comparison η f x).hom = 𝟙 _ := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.reflexiveImage
example : mapIso η f x x (Iso.refl _) = Iso.refl _ := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.actualHomImage
example (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    (mapIso η f x y p).hom = homMap η f x y p.hom := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.globalIsoRestriction
example (p : x ≅ y) :
    mapIso η f x y ((F.map f.op.toLoc).toFunctor.mapIso p) =
      (G.map f.op.toLoc).toFunctor.mapIso ((η.app (.mk (op U))).toFunctor.mapIso p) := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.sliceHomCarrier
example (T : (Over U)ᵒᵖ) (p : (F.presheafHom x y).obj T) :
    homMap η T.unop.hom x y p =
      (show (G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
        ((η.app (.mk (op U))).toFunctor.obj y)).obj T from
        homMap η T.unop.hom x y p) := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.identityHomImage
example : homMap η f x x (𝟙 _) = 𝟙 _ := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.globalHomRestriction
example (p : x ⟶ y) :
    homMap η f x y ((F.map f.op.toLoc).toFunctor.map p) =
      (G.map f.op.toLoc).toFunctor.map ((η.app (.mk (op U))).toFunctor.map p) := by sorry

variable {J : GrothendieckTopology C} [IsGerbe F J] [IsGerbe G J]
variable {A : Sheaf J AddCommGrpCat.{v'}}
variable (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
variable [BandPreserving bF bG η]

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.comparisonBand
example (a : Multiplicative (A.obj.obj (op V))) :
    Aut.autMulEquivOfIso (comparison η f x)
      (bG.autEquiv V ((η.app (.mk (op V))).toFunctor.obj
        ((F.map f.op.toLoc).toFunctor.obj x)) a) =
      bG.autEquiv V ((G.map f.op.toLoc).toFunctor.obj
        ((η.app (.mk (op U))).toFunctor.obj x)) a := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.targetRoundTrip
example (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    mapIso η f x y (preimageIso η f x y bF bG p q) = q := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.anchorRecovered
example (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    preimageIso η f x y bF bG p (mapIso η f x y p) = p := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.differentAnchors
example (p p' : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    preimageIso η f x y bF bG p q = preimageIso η f x y bF bG p' q := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.forwardOrientation
example (p q : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    isomEquiv η f x y bF bG p q = (comparison η f x).symm ≪≫
      ((η.app (.mk (op V))).toFunctor.mapIso q ≪≫ comparison η f y) := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.reverseOrientation
example (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    (isomEquiv η f x y bF bG p).symm q =
      BandedMorphism.preimageIso bF bG η p
        (comparison η f x ≪≫ (q ≪≫ (comparison η f y).symm)) := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.actedImage
example (p q : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) (a : Multiplicative (A.obj.obj (op V))) :
    isomEquiv η f x y bF bG p (BandedIsom.act F J A bF q a) =
      BandedIsom.act G J A bG (isomEquiv η f x y bF bG p q) a := by sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback
open CategoryTheory Opposite Bicategory
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
variable {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
variable (η : Pseudofunctor.StrongTrans F G)
variable {U V W : C} (f : V ⟶ U) (g : W ⟶ V) (x y : F.obj (.mk (op U)))

theorem comparison_comp : comparison η (g ≫ f) x =
    (η.app (.mk (op W))).toFunctor.mapIso
      ((Cat.Hom.toNatIso (F.mapComp' f.op.toLoc g.op.toLoc (g ≫ f).op.toLoc)).app x) ≪≫
    comparison η g ((F.map f.op.toLoc).toFunctor.obj x) ≪≫
    (G.map g.op.toLoc).toFunctor.mapIso (comparison η f x) ≪≫
    ((Cat.Hom.toNatIso (G.mapComp' f.op.toLoc g.op.toLoc (g ≫ f).op.toLoc)).app
      ((η.app (.mk (op U))).toFunctor.obj x)).symm := by
  sorry

theorem homMap_pullHom (h : W ⟶ U) (hh : g ≫ f = h)
    (p : (F.map f.op.toLoc).toFunctor.obj x ⟶ (F.map f.op.toLoc).toFunctor.obj y) :
    homMap η h x y (pullHom p g h h hh hh) =
      pullHom (homMap η f x y p) g h h hh hh := by
  sorry

def homPresheafMap : F.presheafHom x y ⟶
    G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
      ((η.app (.mk (op U))).toFunctor.obj y) := by
  sorry

theorem homPresheafMap_app (T : Over U) (p : (F.presheafHom x y).obj (op T)) :
    (homPresheafMap η x y).app (op T) p = homMap η T.hom x y p := by
  sorry

theorem homPresheafMap_naturality {T₁ T₂ : Over U} (a : T₂ ⟶ T₁)
    (p : (F.presheafHom x y).obj (op T₁)) :
    (homPresheafMap η x y).app (op T₂) ((F.presheafHom x y).map a.op p) =
      (G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
        ((η.app (.mk (op U))).toFunctor.obj y)).map a.op
          ((homPresheafMap η x y).app (op T₁) p) := by
  sorry

theorem homPresheafMap_identity (p : x ⟶ y) :
    (homPresheafMap η x y).app (op (Over.mk (𝟙 U)))
      (F.presheafHomObjHomEquiv p) =
        G.presheafHomObjHomEquiv ((η.app (.mk (op U))).toFunctor.map p) := by
  sorry

variable (J : GrothendieckTopology C)

def homSheafMap [F.IsPrestack J] [G.IsPrestack J] :
    F.sheafHom J x y ⟶ G.sheafHom J
      ((η.app (.mk (op U))).toFunctor.obj x) ((η.app (.mk (op U))).toFunctor.obj y) := by
  sorry

theorem homSheafMap_hom [F.IsPrestack J] [G.IsPrestack J] :
    (homSheafMap η x y J).hom = homPresheafMap η x y := by
  sorry

variable [IsGerbe F J] [IsGerbe G J]
variable {A : Sheaf J AddCommGrpCat.{v'}}
variable (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
variable [BandPreserving bF bG η]
include bF bG

theorem homPresheafMap_injective (T : Over U) :
    Function.Injective ((homPresheafMap η x y).app (op T)) := by
  sorry

theorem homPresheafMap_imageSieve (T : Over U)
    (s : (G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
      ((η.app (.mk (op U))).toFunctor.obj y)).obj (op T)) :
    Presheaf.imageSieve (homPresheafMap η x y) s ∈ (J.over U) T := by
  sorry

theorem homSheafMap_locallySurjective : Sheaf.IsLocallySurjective (homSheafMap η x y J) := by
  sorry

theorem homSheafMap_locallyInjective : Sheaf.IsLocallyInjective (homSheafMap η x y J) := by
  sorry

theorem homSheafMap_isIso : IsIso (homSheafMap η x y J) := by
  sorry

def homSheafIso (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    [BandPreserving bF bG η] :
    F.sheafHom J x y ≅ G.sheafHom J
      ((η.app (.mk (op U))).toFunctor.obj x) ((η.app (.mk (op U))).toFunctor.obj y) := by
  sorry

theorem homSheafIso_hom : (homSheafIso η x y J bF bG).hom = homSheafMap η x y J := by
  sorry

theorem homSheafIso_inverse_anchor (T : Over U)
    (p : (F.map T.hom.op.toLoc).toFunctor.obj x ≅ (F.map T.hom.op.toLoc).toFunctor.obj y)
    (q : (G.map T.hom.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map T.hom.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    (homSheafIso η x y J bF bG).inv.hom.app (op T) q.hom =
      (preimageIso η T.hom x y bF bG p q).hom := by
  sorry

theorem homSheafIso_inverse_restrict {T₁ T₂ : Over U} (a : T₂ ⟶ T₁)
    (q : (G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
      ((η.app (.mk (op U))).toFunctor.obj y)).obj (op T₁)) :
    (F.presheafHom x y).map a.op ((homSheafIso η x y J bF bG).inv.hom.app (op T₁) q) =
      (homSheafIso η x y J bF bG).inv.hom.app (op T₂)
        ((G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
          ((η.app (.mk (op U))).toFunctor.obj y)).map a.op q) := by
  sorry

theorem fibreHom_bijective : Function.Bijective
    ((η.app (.mk (op U))).toFunctor.map : (x ⟶ y) → _) := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open CategoryTheory Opposite Bicategory
variable {C : Type u} [Category.{v} C]
variable {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
variable {J : GrothendieckTopology C} [IsGerbe F J] [IsGerbe G J]
variable {A : Sheaf J AddCommGrpCat.{v'}}
theorem full (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] (U : C) :
    (η.app (.mk (op U))).toFunctor.Full := by
  sorry
end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests
open CategoryTheory Opposite Bicategory
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
variable {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
variable (η : Pseudofunctor.StrongTrans F G)
variable {U V W : C} (x y : F.obj (.mk (op U)))

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.presheafIdentity
example : homPresheafMap (Pseudofunctor.StrongTrans.id F) x y = 𝟙 (F.presheafHom x y) := by
  sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.deeperArrow
example (f : V ⟶ U) (g : W ⟶ V)
    (p : (F.map f.op.toLoc).toFunctor.obj x ⟶ (F.map f.op.toLoc).toFunctor.obj y) :
    homMap η (g ≫ f) x y (pullHom p g (g ≫ f) (g ≫ f)) =
      pullHom (homMap η f x y p) g (g ≫ f) (g ≫ f) := by
  sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.identitySlice
example (p : x ⟶ y) :
    (homPresheafMap η x y).app (op (Over.mk (𝟙 U))) (F.presheafHomObjHomEquiv p) =
      G.presheafHomObjHomEquiv ((η.app (.mk (op U))).toFunctor.map p) := by
  sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.pointNonzero
example :
    let F := BandFixtures.constantDiagram (Discrete PUnit) (SingleObj (Multiplicative (ZMod 2)))
    let U : Discrete PUnit := Discrete.mk PUnit.unit
    let x : F.obj (.mk (op U)) := SingleObj.star (Multiplicative (ZMod 2))
    let a : (F.presheafHom x x).obj (op (Over.mk (𝟙 U))) := Multiplicative.ofAdd (1 : ZMod 2)
    (homPresheafMap (Pseudofunctor.StrongTrans.id F) x x).app (op (Over.mk (𝟙 U))) a = a := by
  sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.bandHypothesisNeeded
example : ¬ (1 : Multiplicative (ZMod 2) →* Multiplicative (ZMod 2)).toFunctor.Full := by
  sorry

variable (J : GrothendieckTopology C) [IsGerbe F J] [IsGerbe G J]
variable {A : Sheaf J AddCommGrpCat.{v'}}
variable (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
variable [BandPreserving bF bG η]

include bF bG

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.nativeSheafMap
example : (homSheafMap η x y J).hom = homPresheafMap η x y := by
  sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.separatesLocalArrows
example (T : Over U) (p q : (F.presheafHom x y).obj (op T))
    (h : (homSheafMap η x y J).hom.app (op T) p =
      (homSheafMap η x y J).hom.app (op T) q) : p = q := by
  sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.noGlobalAnchor
example (h : IsEmpty (x ⟶ y)) :
    IsEmpty ((η.app (.mk (op U))).toFunctor.obj x ⟶ (η.app (.mk (op U))).toFunctor.obj y) := by
  sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.inverseRoundtrip
example (T : Over U) (p : (F.presheafHom x y).obj (op T)) :
    (homSheafIso η x y J bF bG).inv.hom.app (op T)
      ((homSheafMap η x y J).hom.app (op T) p) = p := by
  sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.forwardRoundtrip
example (T : Over U)
    (q : (G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
      ((η.app (.mk (op U))).toFunctor.obj y)).obj (op T)) :
    (homSheafMap η x y J).hom.app (op T)
      ((homSheafIso η x y J bF bG).inv.hom.app (op T) q) = q := by
  sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.arbitraryInverseRestriction
example {T₁ T₂ : Over U} (a : T₂ ⟶ T₁)
    (q : (G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
      ((η.app (.mk (op U))).toFunctor.obj y)).obj (op T₁)) :
    (F.presheafHom x y).map a.op ((homSheafIso η x y J bF bG).inv.hom.app (op T₁) q) =
      (homSheafIso η x y J bF bG).inv.hom.app (op T₂)
        ((G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
          ((η.app (.mk (op U))).toFunctor.obj y)).map a.op q) := by
  sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.inverseBandCoordinate
example (a : Multiplicative (A.obj.obj (op U))) :
    (homSheafIso η x x J bF bG).inv.hom.app (op (Over.mk (𝟙 U)))
      (G.presheafHomObjHomEquiv (bG.autEquiv U ((η.app (.mk (op U))).toFunctor.obj x) a).hom) =
        F.presheafHomObjHomEquiv (bF.autEquiv U x a).hom := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent
open CategoryTheory Opposite Bicategory
open Pseudofunctor.LocallyDiscreteOpToCat
open GerbeMorphismPullback
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
universe t
variable {C : Type u} [Category.{v} C]
variable {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
variable {J : GrothendieckTopology C} [hF : IsGerbe F J] [hG : IsGerbe G J]
variable {A : Sheaf J AddCommGrpCat.{v'}}

def componentFullyFaithful (bF : AbelianBanding F J A)
    (bG : AbelianBanding G J A) (η : Pseudofunctor.StrongTrans F G)
    [BandPreserving bF bG η] (U : C) :
    (η.app (.mk (op U))).toFunctor.FullyFaithful := by sorry

theorem componentFullyFaithful_map_preimage (bF : AbelianBanding F J A)
    (bG : AbelianBanding G J A) (η : Pseudofunctor.StrongTrans F G)
    [BandPreserving bF bG η] (U : C) {x y : F.obj (.mk (op U))}
    (p : (η.app (.mk (op U))).toFunctor.obj x ⟶
      (η.app (.mk (op U))).toFunctor.obj y) :
    (η.app (.mk (op U))).toFunctor.map
      ((componentFullyFaithful bF bG η U).preimage p) = p := by sorry

def localImageSieve (η : Pseudofunctor.StrongTrans F G) {U : C}
    (z : G.obj (.mk (op U))) : Sieve U := by sorry

theorem localImageSieve_mem (η : Pseudofunctor.StrongTrans F G) {U V : C}
    (z : G.obj (.mk (op U))) (f : V ⟶ U) :
    localImageSieve η z f ↔ ∃ x : F.obj (.mk (op V)),
      Nonempty ((η.app (.mk (op V))).toFunctor.obj x ≅
        (G.map f.op.toLoc).toFunctor.obj z) := by sorry

theorem localImageSieve_covering (η : Pseudofunctor.StrongTrans F G) {U : C}
    (z : G.obj (.mk (op U))) : localImageSieve η z ∈ J U := by sorry

theorem localImageSieve_identity (η : Pseudofunctor.StrongTrans F G) {U : C}
    (z : G.obj (.mk (op U))) : localImageSieve η z (𝟙 U) ↔
      ∃ x : F.obj (.mk (op U)),
        Nonempty ((η.app (.mk (op U))).toFunctor.obj x ≅ z) := by sorry

variable {ι : Type t} {U : C} {X : ι → C}

def targetOverlapIso (η : Pseudofunctor.StrongTrans F G)
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    (η.app (.mk (op Y))).toFunctor.obj ((F.map a.op.toLoc).toFunctor.obj (x i)) ≅
      (η.app (.mk (op Y))).toFunctor.obj ((F.map b.op.toLoc).toFunctor.obj (x j)) := by sorry

theorem targetOverlapIso_formula (η : Pseudofunctor.StrongTrans F G)
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    targetOverlapIso η f x z e q a b ha hb =
      comparison η a (x i) ≪≫ (G.map a.op.toLoc).toFunctor.mapIso (e i) ≪≫
      (Pseudofunctor.DescentData.ofObj (F := G) (f := f) z).iso q a b ha hb ≪≫
      ((G.map b.op.toLoc).toFunctor.mapIso (e j)).symm ≪≫
      (comparison η b (x j)).symm := by sorry

theorem targetOverlapIso_self (η : Pseudofunctor.StrongTrans F G)
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i : ι} (a : Y ⟶ X i) (ha : a ≫ f i = q) :
    targetOverlapIso η f x z e q a a ha ha = Iso.refl _ := by sorry

theorem targetOverlapIso_comp (η : Pseudofunctor.StrongTrans F G)
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j k : ι}
    (a : Y ⟶ X i) (b : Y ⟶ X j) (c : Y ⟶ X k)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) (hc : c ≫ f k = q) :
    targetOverlapIso η f x z e q a b ha hb ≪≫
      targetOverlapIso η f x z e q b c hb hc =
        targetOverlapIso η f x z e q a c ha hc := by sorry

def liftedOverlapIso (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    (F.map a.op.toLoc).toFunctor.obj (x i) ≅
      (F.map b.op.toLoc).toFunctor.obj (x j) := by sorry

theorem liftedOverlapIso_map (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    (η.app (.mk (op Y))).toFunctor.mapIso
      (liftedOverlapIso bF bG η f x z e q a b ha hb) =
        targetOverlapIso η f x z e q a b ha hb := by sorry

theorem liftedOverlapIso_self (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i : ι} (a : Y ⟶ X i) (ha : a ≫ f i = q) :
    liftedOverlapIso bF bG η f x z e q a a ha ha = Iso.refl _ := by sorry

theorem liftedOverlapIso_comp (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j k : ι}
    (a : Y ⟶ X i) (b : Y ⟶ X j) (c : Y ⟶ X k)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) (hc : c ≫ f k = q) :
    liftedOverlapIso bF bG η f x z e q a b ha hb ≪≫
      liftedOverlapIso bF bG η f x z e q b c hb hc =
        liftedOverlapIso bF bG η f x z e q a c ha hc := by sorry

theorem liftedOverlapIso_pullHom (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y Y' : C} (q : Y ⟶ U) (q' : Y' ⟶ U) (g : Y' ⟶ Y) (hq : g ≫ q = q')
    {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q)
    (ga : Y' ⟶ X i) (gb : Y' ⟶ X j)
    (hga : g ≫ a = ga) (hgb : g ≫ b = gb)
    (haa : ga ≫ f i = q') (hbb : gb ≫ f j = q') :
    pullHom (liftedOverlapIso bF bG η f x z e q a b ha hb).hom g ga gb hga hgb =
      (liftedOverlapIso bF bG η f x z e q' ga gb haa hbb).hom := by sorry

/-- The objects and overlap maps are specified data. Coherence is admitted. -/
def liftedDescentData (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z) : F.DescentData f where
  obj := x
  hom Y q i j a b ha hb := (liftedOverlapIso bF bG η f x z e q a b ha hb).hom
  pullHom_hom := by sorry
  hom_self := by sorry
  hom_comp := by sorry

theorem liftedDescentData_obj (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z) (i : ι) :
    (liftedDescentData bF bG η f x z e).obj i = x i := by sorry

theorem liftedDescentData_hom (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    (liftedDescentData bF bG η f x z e).hom q a b ha hb =
      (liftedOverlapIso bF bG η f x z e q a b ha hb).hom := by sorry

def imageLocalIso (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e) (i : ι) :
    (G.map (f i).op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z := by sorry

theorem imageLocalIso_hom (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e) (i : ι) :
    (imageLocalIso bF bG η f x z e y r i).hom =
      (comparison η (f i) y).inv ≫
      (η.app (.mk (op (X i)))).toFunctor.map (r.hom.hom i) ≫ (e i).hom := by sorry

theorem imageLocalIso_comm (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    (G.map a.op.toLoc).toFunctor.map (imageLocalIso bF bG η f x z e y r i).hom ≫
        (Pseudofunctor.DescentData.ofObj (F := G) (f := f) z).hom q a b ha hb =
      (Pseudofunctor.DescentData.ofObj (F := G) (f := f)
        ((η.app (.mk (op U))).toFunctor.obj y)).hom q a b ha hb ≫
        (G.map b.op.toLoc).toFunctor.map (imageLocalIso bF bG η f x z e y r j).hom := by sorry

def globalImageIso (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (hf : Sieve.ofArrows X f ∈ J U)
    (x : ∀ i, F.obj (.mk (op (X i)))) (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e) :
    (η.app (.mk (op U))).toFunctor.obj y ≅ z := by sorry

theorem globalImageIso_restrict (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (hf : Sieve.ofArrows X f ∈ J U)
    (x : ∀ i, F.obj (.mk (op (X i)))) (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e) (i : ι) :
    (G.map (f i).op.toLoc).toFunctor.map (globalImageIso bF bG η f hf x z e y r).hom =
      (imageLocalIso bF bG η f x z e y r i).hom := by sorry

theorem globalImageIso_unique (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (hf : Sieve.ofArrows X f ∈ J U)
    (x : ∀ i, F.obj (.mk (op (X i)))) (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e)
    (p : (η.app (.mk (op U))).toFunctor.obj y ≅ z)
    (hp : ∀ i, (G.map (f i).op.toLoc).toFunctor.map p.hom =
      (imageLocalIso bF bG η f x z e y r i).hom) :
    p = globalImageIso bF bG η f hf x z e y r := by sorry

theorem global_preimage (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (U : C) (z : G.obj (.mk (op U))) :
    ∃ y : F.obj (.mk (op U)),
      Nonempty ((η.app (.mk (op U))).toFunctor.obj y ≅ z) := by sorry

theorem componentEssSurj (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] (U : C) :
    (η.app (.mk (op U))).toFunctor.EssSurj := by sorry

theorem componentIsEquivalence (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] (U : C) :
    (η.app (.mk (op U))).toFunctor.IsEquivalence := by sorry

theorem componentFullyFaithful_preimage_map (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (U : C) {x y : F.obj (.mk (op U))} (p : x ⟶ y) :
    (componentFullyFaithful bF bG η U).preimage
      ((η.app (.mk (op U))).toFunctor.map p) = p := by sorry

theorem imageLocalIso_inv (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e) (i : ι) :
    (imageLocalIso bF bG η f x z e y r i).inv =
      (e i).inv ≫ (η.app (.mk (op (X i)))).toFunctor.map (r.inv.hom i) ≫
        (comparison η (f i) y).hom := by sorry

theorem componentFullyFaithful_map_injective
    (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (U : C) {x y : F.obj (.mk (op U))} (p q : x ⟶ y)
    (hpq : (η.app (.mk (op U))).toFunctor.map p =
      (η.app (.mk (op U))).toFunctor.map q) : p = q := by sorry

theorem liftedDescentData_pullHom (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y Y' : C} (q : Y ⟶ U) (q' : Y' ⟶ U) (g : Y' ⟶ Y) (hq : g ≫ q = q')
    {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q)
    (ga : Y' ⟶ X i) (gb : Y' ⟶ X j)
    (hga : g ≫ a = ga) (hgb : g ≫ b = gb)
    (haa : ga ≫ f i = q') (hbb : gb ≫ f j = q') :
    pullHom ((liftedDescentData bF bG η f x z e).hom q a b ha hb) g ga gb hga hgb =
      (liftedDescentData bF bG η f x z e).hom q' ga gb haa hbb := by sorry
theorem globalImageIso_inv_restrict (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (hf : Sieve.ofArrows X f ∈ J U)
    (x : ∀ i, F.obj (.mk (op (X i)))) (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e) (i : ι) :
    (G.map (f i).op.toLoc).toFunctor.map (globalImageIso bF bG η f hf x z e y r).inv =
      (imageLocalIso bF bG η f x z e y r i).inv := by sorry

namespace Tests

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.arrowRoundTrip
example (bF : AbelianBanding F J A)
    (bG : AbelianBanding G J A) (η : Pseudofunctor.StrongTrans F G)
    [BandPreserving bF bG η] (U : C) {x y : F.obj (.mk (op U))}
    (p : (η.app (.mk (op U))).toFunctor.obj x ⟶
      (η.app (.mk (op U))).toFunctor.obj y) :
    (η.app (.mk (op U))).toFunctor.map
      ((componentFullyFaithful bF bG η U).preimage p) = p := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.sourceRoundTrip
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (U : C) {x y : F.obj (.mk (op U))} (p : x ⟶ y) :
    (componentFullyFaithful bF bG η U).preimage
      ((η.app (.mk (op U))).toFunctor.map p) = p := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.nonidentityAutomorphism
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (U : C) (x : F.obj (.mk (op U))) (p : x ⟶ x) (hp : p ≠ 𝟙 x) :
    (η.app (.mk (op U))).toFunctor.map p ≠ 𝟙 _ := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.membershipData
example (η : Pseudofunctor.StrongTrans F G) {U V : C}
    (z : G.obj (.mk (op U))) (f : V ⟶ U) :
    localImageSieve η z f ↔ ∃ x : F.obj (.mk (op V)),
      Nonempty ((η.app (.mk (op V))).toFunctor.obj x ≅
        (G.map f.op.toLoc).toFunctor.obj z) := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.deeperImage
example (η : Pseudofunctor.StrongTrans F G) {U V W : C}
    (z : G.obj (.mk (op U))) (f : V ⟶ U) (g : W ⟶ V)
    (hf : localImageSieve η z f) : localImageSieve η z (g ≫ f) := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.identityImage
example (η : Pseudofunctor.StrongTrans F G) {U : C}
    (z : G.obj (.mk (op U))) : localImageSieve η z (𝟙 U) ↔
      ∃ x : F.obj (.mk (op U)),
        Nonempty ((η.app (.mk (op U))).toFunctor.obj x ≅ z) := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.selfOverlap
example (η : Pseudofunctor.StrongTrans F G)
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i : ι} (a : Y ⟶ X i) (ha : a ≫ f i = q) :
    targetOverlapIso η f x z e q a a ha ha = Iso.refl _ := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.tripleOverlap
example (η : Pseudofunctor.StrongTrans F G)
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j k : ι}
    (a : Y ⟶ X i) (b : Y ⟶ X j) (c : Y ⟶ X k)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) (hc : c ≫ f k = q) :
    targetOverlapIso η f x z e q a b ha hb ≪≫
      targetOverlapIso η f x z e q b c hb hc =
        targetOverlapIso η f x z e q a c ha hc := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.reverseTargetOverlap
example (η : Pseudofunctor.StrongTrans F G)
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    targetOverlapIso η f x z e q b a hb ha =
      (targetOverlapIso η f x z e q a b ha hb).symm := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.liftedImage
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    (η.app (.mk (op Y))).toFunctor.mapIso
      (liftedOverlapIso bF bG η f x z e q a b ha hb) =
        targetOverlapIso η f x z e q a b ha hb := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.reflectedCocycle
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j k : ι}
    (a : Y ⟶ X i) (b : Y ⟶ X j) (c : Y ⟶ X k)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) (hc : c ≫ f k = q) :
    liftedOverlapIso bF bG η f x z e q a b ha hb ≪≫
      liftedOverlapIso bF bG η f x z e q b c hb hc =
        liftedOverlapIso bF bG η f x z e q a c ha hc := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.reverseLiftedOverlap
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    liftedOverlapIso bF bG η f x z e q b a hb ha =
      (liftedOverlapIso bF bG η f x z e q a b ha hb).symm := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.retainedLocalObject
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z) (i : ι) :
    (liftedDescentData bF bG η f x z e).obj i = x i := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.retainedLocalArrow
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    (liftedDescentData bF bG η f x z e).hom q a b ha hb =
      (liftedOverlapIso bF bG η f x z e q a b ha hb).hom := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.varyingBaseDescent
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y Y' : C} (q : Y ⟶ U) (q' : Y' ⟶ U) (g : Y' ⟶ Y) (hq : g ≫ q = q')
    {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q)
    (ga : Y' ⟶ X i) (gb : Y' ⟶ X j)
    (hga : g ≫ a = ga) (hgb : g ≫ b = gb)
    (haa : ga ≫ f i = q') (hbb : gb ≫ f j = q') :
    pullHom ((liftedDescentData bF bG η f x z e).hom q a b ha hb) g ga gb hga hgb =
      (liftedDescentData bF bG η f x z e).hom q' ga gb haa hbb := by sorry
-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.forwardGluingImage
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e) (i : ι) :
    (imageLocalIso bF bG η f x z e y r i).hom =
      (comparison η (f i) y).inv ≫
      (η.app (.mk (op (X i)))).toFunctor.map (r.hom.hom i) ≫ (e i).hom := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.inverseGluingImage
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e) (i : ι) :
    (imageLocalIso bF bG η f x z e y r i).inv =
      (e i).inv ≫ (η.app (.mk (op (X i)))).toFunctor.map (r.inv.hom i) ≫
        (comparison η (f i) y).hom := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.nativeImageComm
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    (G.map a.op.toLoc).toFunctor.map (imageLocalIso bF bG η f x z e y r i).hom ≫
        (Pseudofunctor.DescentData.ofObj (F := G) (f := f) z).hom q a b ha hb =
      (Pseudofunctor.DescentData.ofObj (F := G) (f := f)
        ((η.app (.mk (op U))).toFunctor.obj y)).hom q a b ha hb ≫
        (G.map b.op.toLoc).toFunctor.map (imageLocalIso bF bG η f x z e y r j).hom := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.globalRestriction
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (hf : Sieve.ofArrows X f ∈ J U)
    (x : ∀ i, F.obj (.mk (op (X i)))) (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e) (i : ι) :
    (G.map (f i).op.toLoc).toFunctor.map (globalImageIso bF bG η f hf x z e y r).hom =
      (imageLocalIso bF bG η f x z e y r i).hom := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.uniquenessForLocalData
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (hf : Sieve.ofArrows X f ∈ J U)
    (x : ∀ i, F.obj (.mk (op (X i)))) (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e)
    (p : (η.app (.mk (op U))).toFunctor.obj y ≅ z)
    (hp : ∀ i, (G.map (f i).op.toLoc).toFunctor.map p.hom =
      (imageLocalIso bF bG η f x z e y r i).hom) :
    p = globalImageIso bF bG η f hf x z e y r := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.emptyCoverEffectivity
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    [IsEmpty ι]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (hf : Sieve.ofArrows X f ∈ J U)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e) :
    Nonempty ((η.app (.mk (op U))).toFunctor.obj y ≅ z) := by sorry

end Tests

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeBandEquivalence

open scoped Pseudofunctor.StrongTrans
variable {C : Type u} [Category.{v} C]
    {J : GrothendieckTopology C}
    {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
    {A : Sheaf J AddCommGrpCat.{w}} [IsGerbe F J] [IsGerbe G J]
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)

theorem fibreNatIso_map_band (U : C)
    (P Q : F.obj (.mk (op U)) ⥤ G.obj (.mk (op U))) (e : P ≅ Q)
    (hP : ∀ (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))),
      P.mapAut x (bF.autEquiv U x a) = bG.autEquiv U (P.obj x) a)
    (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    Q.mapAut x (bF.autEquiv U x a) = bG.autEquiv U (Q.obj x) a := by
  sorry

theorem of_fibreNatIso (η θ : Pseudofunctor.StrongTrans F G)
    [BandPreserving bF bG η]
    (e : ∀ U : C, (η.app (.mk (op U))).toFunctor ≅
      (θ.app (.mk (op U))).toFunctor) : BandPreserving bF bG θ := by
  sorry

theorem of_modificationIso (η θ : Pseudofunctor.StrongTrans F G)
    [BandPreserving bF bG η] (e : η ≅ θ) : BandPreserving bF bG θ := by
  sorry

theorem modificationIso_iff (η θ : Pseudofunctor.StrongTrans F G)
    (e : η ≅ θ) : BandPreserving bF bG η ↔ BandPreserving bF bG θ := by
  sorry

theorem inverse_map_band (η : Pseudofunctor.StrongTrans F G)
    [BandPreserving bF bG η] (U : C)
    [(η.app (.mk (op U))).toFunctor.IsEquivalence]
    (y : G.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    (η.app (.mk (op U))).toFunctor.inv.mapAut y (bG.autEquiv U y a) =
      bF.autEquiv U ((η.app (.mk (op U))).toFunctor.inv.obj y) a := by
  sorry

omit [IsGerbe G J] in
theorem unit_band (η : Pseudofunctor.StrongTrans F G) (U : C)
    [(η.app (.mk (op U))).toFunctor.IsEquivalence]
    (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    Aut.autMulEquivOfIso ((η.app (.mk (op U))).toFunctor.asEquivalence.unitIso.app x)
      (bF.autEquiv U x a) =
      bF.autEquiv U ((η.app (.mk (op U))).toFunctor.inv.obj
        ((η.app (.mk (op U))).toFunctor.obj x)) a := by
  sorry

omit [IsGerbe F J] in
theorem counit_band (η : Pseudofunctor.StrongTrans F G) (U : C)
    [(η.app (.mk (op U))).toFunctor.IsEquivalence]
    (y : G.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    Aut.autMulEquivOfIso ((η.app (.mk (op U))).toFunctor.asEquivalence.counitIso.app y)
      (bG.autEquiv U ((η.app (.mk (op U))).toFunctor.obj
        ((η.app (.mk (op U))).toFunctor.inv.obj y)) a) =
      bG.autEquiv U y a := by
  sorry

theorem inverse_preserving (η : Pseudofunctor.StrongTrans F G)
    [BandPreserving bF bG η]
    (hη : ∀ U : C, (η.app (.mk (op U))).toFunctor.IsEquivalence)
    (σ : Pseudofunctor.StrongTrans G F)
    (e : ∀ U : C, letI := hη U
      (σ.app (.mk (op U))).toFunctor ≅ (η.app (.mk (op U))).toFunctor.inv) :
    BandPreserving bG bF σ := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeBandEquivalence

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeBandEquivalenceTests
open scoped Pseudofunctor.StrongTrans
variable {C : Type u} [Category.{v} C]
    {J : GrothendieckTopology C}
    {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
    {A : Sheaf J AddCommGrpCat.{w}} [IsGerbe F J] [IsGerbe G J]
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]

-- test: GerbeBandEquivalenceTests.fibre_refl
example (U : C) (x : F.obj (.mk (op U)))
    (a : Multiplicative (A.obj.obj (op U))) :
    (η.app (.mk (op U))).toFunctor.mapAut x (bF.autEquiv U x a) =
      bG.autEquiv U ((η.app (.mk (op U))).toFunctor.obj x) a := by
  sorry

/-- The identity transformation preserves the chosen band without assuming that conclusion. -/
example : BandPreserving bF bF (Pseudofunctor.StrongTrans.id F) := by
  sorry

/-- A nonidentity coefficient remains nonidentity after a band-preserving transformation. -/
example (U : C) (x : F.obj (.mk (op U)))
    (a : Multiplicative (A.obj.obj (op U))) (ha : a ≠ 1) :
    (η.app (.mk (op U))).toFunctor.mapAut x (bF.autEquiv U x a) ≠ 1 := by
  sorry

-- test: GerbeBandEquivalenceTests.modification_symm
example (θ : Pseudofunctor.StrongTrans F G) (e : η ≅ θ) :
    BandPreserving bF bG θ ↔ BandPreserving bF bG η := by
  sorry

-- test: GerbeBandEquivalenceTests.inverse_coefficient
example (U : C) [(η.app (.mk (op U))).toFunctor.IsEquivalence]
    (y : G.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    (η.app (.mk (op U))).toFunctor.inv.mapAut y (bG.autEquiv U y a) =
      bF.autEquiv U ((η.app (.mk (op U))).toFunctor.inv.obj y) a := by
  sorry

-- test: GerbeBandEquivalenceTests.unit_coefficient
example (U : C) [(η.app (.mk (op U))).toFunctor.IsEquivalence]
    (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    Aut.autMulEquivOfIso ((η.app (.mk (op U))).toFunctor.asEquivalence.unitIso.app x)
      (bF.autEquiv U x a) =
      bF.autEquiv U ((η.app (.mk (op U))).toFunctor.inv.obj
        ((η.app (.mk (op U))).toFunctor.obj x)) a := by
  sorry

-- test: GerbeBandEquivalenceTests.counit_coefficient
example (U : C) [(η.app (.mk (op U))).toFunctor.IsEquivalence]
    (y : G.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    Aut.autMulEquivOfIso ((η.app (.mk (op U))).toFunctor.asEquivalence.counitIso.app y)
      (bG.autEquiv U ((η.app (.mk (op U))).toFunctor.obj
        ((η.app (.mk (op U))).toFunctor.inv.obj y)) a) =
      bG.autEquiv U y a := by
  sorry

-- test: GerbeBandEquivalenceTests.chosen_inverse
example (hη : ∀ U : C, (η.app (.mk (op U))).toFunctor.IsEquivalence)
    (σ : Pseudofunctor.StrongTrans G F)
    (e : ∀ U : C, letI := hη U
      (σ.app (.mk (op U))).toFunctor ≅ (η.app (.mk (op U))).toFunctor.inv) :
    BandPreserving bG bF σ := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeBandEquivalenceTests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open scoped Pseudofunctor.StrongTrans
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)

/-- The modification, with its inverse determined in the gerbe fibres. -/
noncomputable def modificationIso [IsGerbe G J]
    {η θ : Pseudofunctor.StrongTrans F G} (m : η ⟶ θ) : η ≅ θ := by
  sorry

theorem modificationIso_hom [IsGerbe G J]
    {η θ : Pseudofunctor.StrongTrans F G} (m : η ⟶ θ) :
    (modificationIso (J := J) m).hom = m := by
  sorry

theorem modificationIso_inv_app [IsGerbe G J]
    {η θ : Pseudofunctor.StrongTrans F G} (m : η ⟶ θ)
    (U : C) (x : F.obj (.mk (op U))) :
    ((modificationIso (J := J) m).inv.as.app (.mk (op U))).toNatTrans.app x =
      letI := IsGerbe.isIso_hom (F := G) (J := J) U
        ((m.as.app (.mk (op U))).toNatTrans.app x)
      inv ((m.as.app (.mk (op U))).toNatTrans.app x) := by
  sorry

theorem modificationIso_id [IsGerbe G J]
    (η : Pseudofunctor.StrongTrans F G) :
    modificationIso (J := J) (𝟙 η) = Iso.refl η := by
  sorry

theorem modificationIso_comp [IsGerbe G J]
    {η θ σ : Pseudofunctor.StrongTrans F G} (m : η ⟶ θ) (n : θ ⟶ σ) :
    modificationIso (J := J) (m ≫ n) =
      modificationIso (J := J) m ≪≫ modificationIso (J := J) n := by
  sorry

variable {A : Sheaf J AddCommGrpCat.{w}} [IsGerbe F J] [IsGerbe G J]
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)

theorem modification_iff {η θ : Pseudofunctor.StrongTrans F G} (m : η ⟶ θ) :
    BandPreserving bF bG η ↔ BandPreserving bF bG θ := by
  sorry

/-- All modifications between strong transformations preserving the fixed band. -/
abbrev HomCategory :=
  (show ObjectProperty (Pseudofunctor.StrongTrans F G) from
    fun η => BandPreserving bF bG η).FullSubcategory

def mk (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] :
    HomCategory bF bG := by
  sorry

def homMk {X Y : HomCategory bF bG} (m : X.obj ⟶ Y.obj) : X ⟶ Y := by
  sorry

def forget : HomCategory bF bG ⥤ Pseudofunctor.StrongTrans F G := by
  sorry

abbrev forget_fullyFaithful : (forget bF bG).FullyFaithful := by
  sorry

theorem hom_ext {X Y : HomCategory bF bG} {m n : X ⟶ Y}
    (h : ∀ U : C, (m.hom.as.app (.mk (op U))).toNatTrans =
      (n.hom.as.app (.mk (op U))).toNatTrans) : m = n := by
  sorry

noncomputable def homIso {X Y : HomCategory bF bG} (m : X ⟶ Y) : X ≅ Y := by
  sorry

theorem homIso_hom {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (homIso bF bG m).hom = m := by
  sorry

theorem hom_isIso {X Y : HomCategory bF bG} (m : X ⟶ Y) : IsIso m := by
  sorry

theorem homIso_inv_app {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (U : C) (x : F.obj (.mk (op U))) :
    (((homIso bF bG m).inv.hom.as.app (.mk (op U))).toNatTrans.app x) =
      letI := IsGerbe.isIso_hom (F := G) (J := J) U
        ((m.hom.as.app (.mk (op U))).toNatTrans.app x)
      inv ((m.hom.as.app (.mk (op U))).toNatTrans.app x) := by
  sorry

theorem homIso_comp {X Y Z : HomCategory bF bG} (m : X ⟶ Y) (n : Y ⟶ Z) :
    homIso bF bG (m ≫ n) = homIso bF bG m ≪≫ homIso bF bG n := by
  sorry

@[instance_reducible]
noncomputable def groupoid : Groupoid (HomCategory bF bG) :=
  Groupoid.ofIsIso (hom_isIso bF bG)

theorem groupoid_inv {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (groupoid bF bG).inv m = (homIso bF bG m).inv := by
  sorry

theorem groupoid_comp_inv {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    m ≫ (groupoid bF bG).inv m = 𝟙 X := by
  sorry

theorem groupoid_inv_comp {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (groupoid bF bG).inv m ≫ m = 𝟙 Y := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphismTests
open BandedMorphism
open scoped Pseudofunctor.StrongTrans
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable [IsGerbe G J]

-- test: BandedMorphismTests.modification_forward
example {η θ : Pseudofunctor.StrongTrans F G} (m : η ⟶ θ) :
    (modificationIso (J := J) m).hom = m := by
  sorry

-- test: BandedMorphismTests.modification_inverse_component
example {η θ : Pseudofunctor.StrongTrans F G} (m : η ⟶ θ)
    (U : C) (x : F.obj (.mk (op U))) :
    ((modificationIso (J := J) m).inv.as.app (.mk (op U))).toNatTrans.app x =
      letI := IsGerbe.isIso_hom (F := G) (J := J) U
        ((m.as.app (.mk (op U))).toNatTrans.app x)
      inv ((m.as.app (.mk (op U))).toNatTrans.app x) := by
  sorry

-- test: BandedMorphismTests.modification_composition
example {η θ σ : Pseudofunctor.StrongTrans F G} (m : η ⟶ θ) (n : θ ⟶ σ) :
    modificationIso (J := J) (m ≫ n) =
      modificationIso (J := J) m ≪≫ modificationIso (J := J) n := by
  sorry

variable {A : Sheaf J AddCommGrpCat.{w}} [IsGerbe F J]
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)

-- test: BandedMorphismTests.carrier_arrows
example {X Y : HomCategory bF bG} (m : X.obj ⟶ Y.obj) :
    (homMk bF bG m).hom = m := by
  sorry

-- test: BandedMorphismTests.carrier_distinct_arrows
example {X Y : HomCategory bF bG} (m n : X ⟶ Y) (h : m ≠ n) :
    (forget bF bG).map m ≠ (forget bF bG).map n := by
  sorry

-- test: BandedMorphismTests.carrier_band
example (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] :
    (forget bF bG).obj (mk bF bG η) = η := by
  sorry

-- test: BandedMorphismTests.hom_forward
example {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (homIso bF bG m).hom = m := by
  sorry

-- test: BandedMorphismTests.hom_inverse_component
example {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (U : C) (x : F.obj (.mk (op U))) :
    (((homIso bF bG m).inv.hom.as.app (.mk (op U))).toNatTrans.app x) =
      letI := IsGerbe.isIso_hom (F := G) (J := J) U
        ((m.hom.as.app (.mk (op U))).toNatTrans.app x)
      inv ((m.hom.as.app (.mk (op U))).toNatTrans.app x) := by
  sorry

-- test: BandedMorphismTests.hom_composition
example {X Y Z : HomCategory bF bG} (m : X ⟶ Y) (n : Y ⟶ Z) :
    homIso bF bG (m ≫ n) = homIso bF bG m ≪≫ homIso bF bG n := by
  sorry

-- test: BandedMorphismTests.groupoid_inverse
example {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (groupoid bF bG).inv m = (homIso bF bG m).inv := by
  sorry

-- test: BandedMorphismTests.groupoid_right_inverse
example {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    m ≫ (groupoid bF bG).inv m = 𝟙 X := by
  sorry

-- test: BandedMorphismTests.groupoid_left_inverse
example {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (groupoid bF bG).inv m ≫ m = 𝟙 Y := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphismTests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedIsom
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  {J : GrothendieckTopology C} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U : C} {x y z : F.obj (.mk (op U))}

def fibreAction (x y : F.obj (.mk (op U))) :
    Action (Type v') (Multiplicative (A.obj.obj (op U))) where
  V := x ≅ y
  ρ :=
    { toFun := fun a => TypeCat.ofHom (fun p => p ≪≫ b.autEquiv U y a)
      map_one' := by
        sorry
      map_mul' := by
        sorry }

theorem fibreAction_apply (a : Multiplicative (A.obj.obj (op U))) (p : x ≅ y) :
    End.asHom ((fibreAction b x y).ρ a) p = p ≪≫ b.autEquiv U y a := by
  sorry

theorem fibreAction_empty (h : IsEmpty (x ≅ y)) : IsEmpty (fibreAction b x y).V := by
  sorry

theorem band_commute (q : y ≅ z) (a : Multiplicative (A.obj.obj (op U))) :
    b.autEquiv U y a ≪≫ q = q ≪≫ b.autEquiv U z a := by
  sorry

def postcomposeActionIso (q : y ≅ z) : fibreAction b x y ≅ fibreAction b x z where
  hom :=
    { hom := TypeCat.ofHom (fun p => p ≪≫ q)
      comm := by
        sorry }
  inv :=
    { hom := TypeCat.ofHom (fun p => p ≪≫ q.symm)
      comm := by
        sorry }
  hom_inv_id := by
    sorry
  inv_hom_id := by
    sorry
theorem postcomposeActionIso_apply (q : y ≅ z) (p : x ≅ y) :
    (postcomposeActionIso b q).hom.hom p = p ≪≫ q := by
  sorry

theorem postcomposeActionIso_inv_apply (q : y ≅ z) (p : x ≅ z) :
    (postcomposeActionIso b q).inv.hom p = p ≪≫ q.symm := by
  sorry

theorem postcomposeActionIso_comp {t : F.obj (.mk (op U))} (q : y ≅ z) (r : z ≅ t) :
    postcomposeActionIso b (x := x) (q ≪≫ r) =
      postcomposeActionIso b q ≪≫ postcomposeActionIso b r := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedIsom

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J]
  {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)

noncomputable def componentIso {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (U : C) (x : F.obj (.mk (op U))) :
    (X.obj.app (.mk (op U))).toFunctor.obj x ≅
      (Y.obj.app (.mk (op U))).toFunctor.obj x :=
  letI := IsGerbe.isIso_hom (F := G) (J := J) U
    ((m.hom.as.app (.mk (op U))).toNatTrans.app x)
  asIso ((m.hom.as.app (.mk (op U))).toNatTrans.app x)

theorem componentIso_hom {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (U : C) (x : F.obj (.mk (op U))) :
    (componentIso bF bG m U x).hom =
      (m.hom.as.app (.mk (op U))).toNatTrans.app x := by
  sorry

theorem componentIso_id (X : HomCategory bF bG) (U : C)
    (x : F.obj (.mk (op U))) :
    componentIso bF bG (𝟙 X) U x = Iso.refl _ := by
  sorry

theorem componentIso_comp {X Y Z : HomCategory bF bG} (m : X ⟶ Y) (n : Y ⟶ Z)
    (U : C) (x : F.obj (.mk (op U))) :
    componentIso bF bG (m ≫ n) U x =
      componentIso bF bG m U x ≪≫ componentIso bF bG n U x := by
  sorry

noncomputable def fibreIsomActionFunctor (U : C) (x : F.obj (.mk (op U)))
    (y : G.obj (.mk (op U))) :
    HomCategory bF bG ⥤ Action (Type v') (Multiplicative (A.obj.obj (op U))) where
  obj X := BandedIsom.fibreAction bG y ((X.obj.app (.mk (op U))).toFunctor.obj x)
  map m := (BandedIsom.postcomposeActionIso bG (componentIso bF bG m U x)).hom
  map_id X := by
    sorry
  map_comp m n := by
    sorry
theorem fibreIsomActionFunctor_obj (U : C) (x : F.obj (.mk (op U)))
    (y : G.obj (.mk (op U))) (X : HomCategory bF bG) :
    ((fibreIsomActionFunctor bF bG U x y).obj X).V =
      (y ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) := by
  sorry

theorem fibreIsomActionFunctor_map_apply (U : C) (x : F.obj (.mk (op U)))
    (y : G.obj (.mk (op U))) {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (p : y ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    ((fibreIsomActionFunctor bF bG U x y).map m).hom p =
      p ≪≫ componentIso bF bG m U x := by
  sorry

theorem componentIso_inv {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (U : C) (x : F.obj (.mk (op U))) :
    componentIso bF bG (homIso bF bG m).inv U x =
      (componentIso bF bG m U x).symm := by
  sorry

theorem fibreIsomActionFunctor_map_inverse (U : C) (x : F.obj (.mk (op U)))
    (y : G.obj (.mk (op U))) {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (fibreIsomActionFunctor bF bG U x y).map (homIso bF bG m).inv =
      (BandedIsom.postcomposeActionIso bG (x := y) (componentIso bF bG m U x)).inv := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U : C} {x x' x'' : F.obj (.mk (op U))}
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

def selfTransportActionIso (X : HomCategory b b) (e : x ≅ x') :
    (fibreIsomActionFunctor b b U x x).obj X ≅
      (fibreIsomActionFunctor b b U x' x').obj X where
  hom :=
    { hom := TypeCat.ofHom (fun p =>
        e.symm ≪≫ p ≪≫ (X.obj.app (.mk (op U))).toFunctor.mapIso e)
      comm := by
        sorry }
  inv :=
    { hom := TypeCat.ofHom (fun p =>
        e ≪≫ p ≪≫ (X.obj.app (.mk (op U))).toFunctor.mapIso e.symm)
      comm := by
        sorry }
  hom_inv_id := by
    sorry
  inv_hom_id := by
    sorry
theorem selfTransportActionIso_apply (X : HomCategory b b) (e : x ≅ x')
    (p : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    (selfTransportActionIso b X e).hom.hom p =
      e.symm ≪≫ p ≪≫ (X.obj.app (.mk (op U))).toFunctor.mapIso e := by
  sorry

theorem selfTransportActionIso_inv_apply (X : HomCategory b b) (e : x ≅ x')
    (p : x' ≅ (X.obj.app (.mk (op U))).toFunctor.obj x') :
    (selfTransportActionIso b X e).inv.hom p =
      e ≪≫ p ≪≫ (X.obj.app (.mk (op U))).toFunctor.mapIso e.symm := by
  sorry

theorem selfTransportActionIso_id (X : HomCategory b b) :
    selfTransportActionIso b X (Iso.refl x) = Iso.refl _ := by
  sorry

theorem selfTransportActionIso_comp (X : HomCategory b b) (e : x ≅ x') (f : x' ≅ x'') :
    selfTransportActionIso b X (e ≪≫ f) =
      selfTransportActionIso b X e ≪≫ selfTransportActionIso b X f := by
  sorry

noncomputable def selfTransportNatIso (e : x ≅ x') :
    fibreIsomActionFunctor b b U x x ≅ fibreIsomActionFunctor b b U x' x' :=
  NatIso.ofComponents (fun X => selfTransportActionIso b X e) (by
    sorry)

theorem selfTransportNatIso_app (e : x ≅ x') (X : HomCategory b b) :
    (selfTransportNatIso b e).app X = selfTransportActionIso b X e := by
  sorry

theorem selfTransportActionIso_independent (X : HomCategory b b) (e f : x ≅ x') :
    selfTransportActionIso b X e = selfTransportActionIso b X f := by
  sorry

theorem selfTransportNatIso_independent (e f : x ≅ x') :
    selfTransportNatIso b e = selfTransportNatIso b f := by
  sorry

theorem selfTransportNatIso_id :
    selfTransportNatIso b (Iso.refl x) = Iso.refl _ := by
  sorry

theorem selfTransportNatIso_comp (e : x ≅ x') (f : x' ≅ x'') :
    selfTransportNatIso b (e ≪≫ f) = selfTransportNatIso b e ≪≫ selfTransportNatIso b f := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.FibreActionTests
open CategoryTheory Opposite Bicategory BandedIsom BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable {U : C} {x y z t : F.obj (.mk (op U))}

-- test: FibreActionTests.actual_coefficient
example (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    End.asHom ((fibreAction bF x y).ρ a) p = p ≪≫ bF.autEquiv U y a := by
  sorry

-- test: FibreActionTests.empty_sections
example (h : IsEmpty (x ≅ y)) : IsEmpty (fibreAction bF x y).V := by
  sorry

-- test: FibreActionTests.multiplication_order
example (a c : Multiplicative (A.obj.obj (op U))) :
    (fibreAction bF x y).ρ (a * c) =
      (fibreAction bF x y).ρ c ≫ (fibreAction bF x y).ρ a := by
  sorry

-- test: FibreActionTests.postcompose_forward
example (q : y ≅ z) (p : x ≅ y) :
    (postcomposeActionIso bF q).hom.hom p = p ≪≫ q := by
  sorry

-- test: FibreActionTests.postcompose_roundtrip
example (q : y ≅ z) (p : x ≅ y) :
    (postcomposeActionIso bF q).inv.hom ((postcomposeActionIso bF q).hom.hom p) = p := by
  sorry

-- test: FibreActionTests.postcompose_composition
example (q : y ≅ z) (r : z ≅ t) :
    postcomposeActionIso bF (x := x) (q ≪≫ r) =
      postcomposeActionIso bF q ≪≫ postcomposeActionIso bF r := by
  sorry

-- test: FibreActionTests.native_component
example {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (componentIso bF bG m U x).hom =
      (m.hom.as.app (.mk (op U))).toNatTrans.app x := by
  sorry

-- test: FibreActionTests.native_component_inverse
example {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    componentIso bF bG (homIso bF bG m).inv U x =
      (componentIso bF bG m U x).symm := by
  sorry

-- test: FibreActionTests.native_component_composition
example {X Y Z : HomCategory bF bG} (m : X ⟶ Y) (n : Y ⟶ Z) :
    componentIso bF bG (m ≫ n) U x =
      componentIso bF bG m U x ≪≫ componentIso bF bG n U x := by
  sorry

-- test: FibreActionTests.functor_actual_carrier
example (y : G.obj (.mk (op U))) (X : HomCategory bF bG) :
    ((fibreIsomActionFunctor bF bG U x y).obj X).V =
      (y ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) := by
  sorry

-- test: FibreActionTests.functor_coefficient_naturality
example (y : G.obj (.mk (op U))) {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (a : Multiplicative (A.obj.obj (op U))) :
    ((fibreIsomActionFunctor bF bG U x y).obj X).ρ a ≫
        ((fibreIsomActionFunctor bF bG U x y).map m).hom =
      ((fibreIsomActionFunctor bF bG U x y).map m).hom ≫
        ((fibreIsomActionFunctor bF bG U x y).obj Y).ρ a := by
  sorry

-- test: FibreActionTests.functor_native_inverse
example (y : G.obj (.mk (op U))) {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (fibreIsomActionFunctor bF bG U x y).map (homIso bF bG m).inv =
      (postcomposeActionIso bG (x := y) (componentIso bF bG m U x)).inv := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.FibreActionTests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.SelfTransportTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U : C} {x y z : F.obj (.mk (op U))}
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

-- test: SelfTransportTests.actual_arrow_transport
example (X : HomCategory b b) (e : x ≅ y)
    (p : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    (selfTransportActionIso b X e).hom.hom p =
      e.symm ≪≫ p ≪≫ (X.obj.app (.mk (op U))).toFunctor.mapIso e := by
  sorry

-- test: SelfTransportTests.no_chosen_arrow
example (X : HomCategory b b) (e f : x ≅ y) :
    selfTransportActionIso b X e = selfTransportActionIso b X f := by
  sorry

-- test: SelfTransportTests.identity_transport
example (X : HomCategory b b) :
    selfTransportActionIso b X (Iso.refl x) = Iso.refl _ := by
  sorry

-- test: SelfTransportTests.modification_naturality
example (e : x ≅ y) {X Y : HomCategory b b} (m : X ⟶ Y) :
    (fibreIsomActionFunctor b b U x x).map m ≫ (selfTransportNatIso b e).hom.app Y =
      (selfTransportNatIso b e).hom.app X ≫ (fibreIsomActionFunctor b b U y y).map m := by
  sorry

-- test: SelfTransportTests.natural_composition
example (e : x ≅ y) (f : y ≅ z) :
    selfTransportNatIso b (e ≪≫ f) = selfTransportNatIso b e ≪≫ selfTransportNatIso b f := by
  sorry

-- test: SelfTransportTests.natural_independence
example (e f : x ≅ y) : selfTransportNatIso b e = selfTransportNatIso b f := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.SelfTransportTests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedIsom
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  {J : GrothendieckTopology C} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U V W : C}

def restrictActionHom (f : V ⟶ U) (x y : F.obj (.mk (op U))) :
    fibreAction b x y ⟶
      (Action.res (Type v') (A.obj.map f.op).hom.toMultiplicative).obj
        (fibreAction b ((F.map f.op.toLoc).toFunctor.obj x)
          ((F.map f.op.toLoc).toFunctor.obj y)) where
  hom := TypeCat.ofHom ((F.map f.op.toLoc).toFunctor.mapIso)
  comm := by
    sorry

theorem restrictActionHom_apply (f : V ⟶ U) (x y : F.obj (.mk (op U))) (p : x ≅ y) :
    (restrictActionHom b f x y).hom p = (F.map f.op.toLoc).toFunctor.mapIso p := by
  sorry

theorem restrictActionHom_postcompose (f : V ⟶ U) {x y z : F.obj (.mk (op U))}
    (p : x ≅ y) (q : y ≅ z) :
    (restrictActionHom b f x z).hom (p ≪≫ q) =
      (restrictActionHom b f x y).hom p ≪≫ (restrictActionHom b f y z).hom q := by
  sorry

theorem restrictActionHom_refl (f : V ⟶ U) (x : F.obj (.mk (op U))) :
    (restrictActionHom b f x x).hom (Iso.refl x) = Iso.refl _ := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedIsom

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J]
  {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable {U V W : C}

def restrictionIso (X : HomCategory bF bG) (f : V ⟶ U) (x : F.obj (.mk (op U))) :
    (G.map f.op.toLoc).toFunctor.obj ((X.obj.app (.mk (op U))).toFunctor.obj x) ≅
      (X.obj.app (.mk (op V))).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj x) :=
  ((Cat.Hom.toNatIso (X.obj.naturality f.op.toLoc)).app x).symm

noncomputable def fibreIsomRestriction (X : HomCategory bF bG) (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    (fibreIsomActionFunctor bF bG U x y).obj X ⟶
      (Action.res (Type v') (A.obj.map f.op).hom.toMultiplicative).obj
        ((fibreIsomActionFunctor bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
          ((G.map f.op.toLoc).toFunctor.obj y)).obj X) :=
  BandedIsom.restrictActionHom bG f y _ ≫
    (Action.res (Type v') (A.obj.map f.op).hom.toMultiplicative).map
      (BandedIsom.postcomposeActionIso bG (restrictionIso bF bG X f x)).hom

theorem fibreIsomRestriction_apply (X : HomCategory bF bG) (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U)))
    (p : y ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    (fibreIsomRestriction bF bG X f x y).hom p =
      (G.map f.op.toLoc).toFunctor.mapIso p ≪≫ restrictionIso bF bG X f x := by
  sorry

theorem restrictionIso_modification {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (f : V ⟶ U) (x : F.obj (.mk (op U))) :
    (G.map f.op.toLoc).toFunctor.mapIso (componentIso bF bG m U x) ≪≫
      restrictionIso bF bG Y f x =
    restrictionIso bF bG X f x ≪≫
      componentIso bF bG m V ((F.map f.op.toLoc).toFunctor.obj x) := by
  sorry

noncomputable def fibreIsomRestrictionNatTrans (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    fibreIsomActionFunctor bF bG U x y ⟶
      fibreIsomActionFunctor bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
        ((G.map f.op.toLoc).toFunctor.obj y) ⋙
        Action.res (Type v') (A.obj.map f.op).hom.toMultiplicative where
  app X := fibreIsomRestriction bF bG X f x y
  naturality X Y m := by
    sorry

theorem fibreIsomRestrictionNatTrans_app (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) (X : HomCategory bF bG) :
    (fibreIsomRestrictionNatTrans bF bG f x y).app X =
      fibreIsomRestriction bF bG X f x y := by
  sorry

theorem fibreIsomRestrictionNatTrans_naturality (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U)))
    {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (fibreIsomActionFunctor bF bG U x y).map m ≫
        (fibreIsomRestrictionNatTrans bF bG f x y).app Y =
      (fibreIsomRestrictionNatTrans bF bG f x y).app X ≫
        (Action.res (Type v') (A.obj.map f.op).hom.toMultiplicative).map
          ((fibreIsomActionFunctor bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
            ((G.map f.op.toLoc).toFunctor.obj y)).map m) := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable {U V W : C}

theorem restrictionIso_naturality (X : HomCategory bF bG) (f : V ⟶ U)
    {x x' : F.obj (.mk (op U))} (e : x ≅ x') :
    (G.map f.op.toLoc).toFunctor.mapIso ((X.obj.app (.mk (op U))).toFunctor.mapIso e) ≪≫
      restrictionIso bF bG X f x' =
    restrictionIso bF bG X f x ≪≫
      (X.obj.app (.mk (op V))).toFunctor.mapIso ((F.map f.op.toLoc).toFunctor.mapIso e) := by
  sorry

theorem restrictionIso_id (X : HomCategory bF bG) (x : F.obj (.mk (op U))) :
    restrictionIso bF bG X (𝟙 U) x =
      (Cat.Hom.toNatIso (G.mapId (.mk (op U)))).app
        ((X.obj.app (.mk (op U))).toFunctor.obj x) ≪≫
      (X.obj.app (.mk (op U))).toFunctor.mapIso
        ((Cat.Hom.toNatIso (F.mapId (.mk (op U)))).app x).symm := by
  sorry

theorem restrictionIso_comp (X : HomCategory bF bG) (f : V ⟶ U) (g : W ⟶ V)
    (x : F.obj (.mk (op U))) :
    restrictionIso bF bG X (g ≫ f) x =
      (Cat.Hom.toNatIso (G.mapComp f.op.toLoc g.op.toLoc)).app
        ((X.obj.app (.mk (op U))).toFunctor.obj x) ≪≫
      (G.map g.op.toLoc).toFunctor.mapIso (restrictionIso bF bG X f x) ≪≫
      restrictionIso bF bG X g ((F.map f.op.toLoc).toFunctor.obj x) ≪≫
      (X.obj.app (.mk (op W))).toFunctor.mapIso
        ((Cat.Hom.toNatIso (F.mapComp f.op.toLoc g.op.toLoc)).app x).symm := by
  sorry

theorem fibreIsomRestriction_id (X : HomCategory bF bG)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U)))
    (p : y ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    (fibreIsomRestriction bF bG X (𝟙 U) x y).hom p =
      (Cat.Hom.toNatIso (G.mapId (.mk (op U)))).app y ≪≫ p ≪≫
      (X.obj.app (.mk (op U))).toFunctor.mapIso
        ((Cat.Hom.toNatIso (F.mapId (.mk (op U)))).app x).symm := by
  sorry

theorem fibreIsomRestriction_comp (X : HomCategory bF bG) (f : V ⟶ U) (g : W ⟶ V)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U)))
    (p : y ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    (fibreIsomRestriction bF bG X (g ≫ f) x y).hom p =
      (Cat.Hom.toNatIso (G.mapComp f.op.toLoc g.op.toLoc)).app y ≪≫
      (fibreIsomRestriction bF bG X g ((F.map f.op.toLoc).toFunctor.obj x)
        ((G.map f.op.toLoc).toFunctor.obj y)).hom
        ((fibreIsomRestriction bF bG X f x y).hom p) ≪≫
      (X.obj.app (.mk (op W))).toFunctor.mapIso
        ((Cat.Hom.toNatIso (F.mapComp f.op.toLoc g.op.toLoc)).app x).symm := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)
variable {U V : C}

theorem selfTransportActionIso_restriction (X : HomCategory b b) (f : V ⟶ U)
    {x x' : F.obj (.mk (op U))} (e : x ≅ x') :
    (selfTransportActionIso b X e).hom ≫ fibreIsomRestriction b b X f x' x' =
      fibreIsomRestriction b b X f x x ≫
        (Action.res (Type v') (A.obj.map f.op).hom.toMultiplicative).map
          (selfTransportActionIso b X ((F.map f.op.toLoc).toFunctor.mapIso e)).hom := by
  sorry

theorem selfTransportNatIso_restriction (f : V ⟶ U)
    {x x' : F.obj (.mk (op U))} (e : x ≅ x') :
    (selfTransportNatIso b e).hom ≫ fibreIsomRestrictionNatTrans b b f x' x' =
      fibreIsomRestrictionNatTrans b b f x x ≫
        Functor.whiskerRight (selfTransportNatIso b ((F.map f.op.toLoc).toFunctor.mapIso e)).hom
          (Action.res (Type v') (A.obj.map f.op).hom.toMultiplicative) := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.RestrictionActionTests
open CategoryTheory Opposite Bicategory BandedIsom BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable {U V W : C} (f : V ⟶ U) (g : W ⟶ V)

-- test: RestrictionActionTests.empty_source
example (x y : F.obj (.mk (op U))) (h : IsEmpty (x ≅ y)) :
    IsEmpty (fibreAction bF x y).V ∧ Nonempty
      (fibreAction bF x y ⟶
        (Action.res (Type v') (A.obj.map f.op).hom.toMultiplicative).obj
          (fibreAction bF ((F.map f.op.toLoc).toFunctor.obj x)
            ((F.map f.op.toLoc).toFunctor.obj y))) := by
  sorry

-- test: RestrictionActionTests.band_coefficient
example (x y : F.obj (.mk (op U))) (p : x ≅ y)
    (a : Multiplicative (A.obj.obj (op U))) :
    (restrictActionHom bF f x y).hom (p ≪≫ bF.autEquiv U y a) =
      (restrictActionHom bF f x y).hom p ≪≫
        bF.autEquiv V ((F.map f.op.toLoc).toFunctor.obj y)
          ((A.obj.map f.op).hom.toMultiplicative a) := by
  sorry

-- test: RestrictionActionTests.restricted_unit
example (x : F.obj (.mk (op U))) :
    (restrictActionHom bF f x x).hom (Iso.refl x) = Iso.refl _ := by
  sorry

-- test: RestrictionActionTests.comparison_roundtrip
example (X : HomCategory bF bG) (x : F.obj (.mk (op U))) :
    restrictionIso bF bG X f x ≪≫
      (Cat.Hom.toNatIso (X.obj.naturality f.op.toLoc)).app x = Iso.refl _ := by
  sorry

-- test: RestrictionActionTests.comparison_identity
example (X : HomCategory bF bG) (x : F.obj (.mk (op U))) :
    restrictionIso bF bG X (𝟙 U) x =
      (Cat.Hom.toNatIso (G.mapId (.mk (op U)))).app
        ((X.obj.app (.mk (op U))).toFunctor.obj x) ≪≫
      (X.obj.app (.mk (op U))).toFunctor.mapIso
        ((Cat.Hom.toNatIso (F.mapId (.mk (op U)))).app x).symm := by
  sorry

-- test: RestrictionActionTests.comparison_composition
example (X : HomCategory bF bG) (x : F.obj (.mk (op U))) :
    restrictionIso bF bG X (g ≫ f) x =
      (Cat.Hom.toNatIso (G.mapComp f.op.toLoc g.op.toLoc)).app
        ((X.obj.app (.mk (op U))).toFunctor.obj x) ≪≫
      (G.map g.op.toLoc).toFunctor.mapIso (restrictionIso bF bG X f x) ≪≫
      restrictionIso bF bG X g ((F.map f.op.toLoc).toFunctor.obj x) ≪≫
      (X.obj.app (.mk (op W))).toFunctor.mapIso
        ((Cat.Hom.toNatIso (F.mapComp f.op.toLoc g.op.toLoc)).app x).symm := by
  sorry

-- test: RestrictionActionTests.actual_transport
example (X : HomCategory bF bG) (x : F.obj (.mk (op U)))
    (y : G.obj (.mk (op U))) (p : y ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    (fibreIsomRestriction bF bG X f x y).hom p =
      (G.map f.op.toLoc).toFunctor.mapIso p ≪≫ restrictionIso bF bG X f x := by
  sorry

-- test: RestrictionActionTests.semilinear_transport
example (X : HomCategory bF bG) (x : F.obj (.mk (op U)))
    (y : G.obj (.mk (op U))) (p : y ≅ (X.obj.app (.mk (op U))).toFunctor.obj x)
    (a : Multiplicative (A.obj.obj (op U))) :
    (fibreIsomRestriction bF bG X f x y).hom
        (p ≪≫ bG.autEquiv U ((X.obj.app (.mk (op U))).toFunctor.obj x) a) =
      (fibreIsomRestriction bF bG X f x y).hom p ≪≫
        bG.autEquiv V ((X.obj.app (.mk (op V))).toFunctor.obj
          ((F.map f.op.toLoc).toFunctor.obj x))
            ((A.obj.map f.op).hom.toMultiplicative a) := by
  sorry

-- test: RestrictionActionTests.transport_identity
example (X : HomCategory bF bG) (x : F.obj (.mk (op U)))
    (y : G.obj (.mk (op U))) (p : y ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    (fibreIsomRestriction bF bG X (𝟙 U) x y).hom p =
      (Cat.Hom.toNatIso (G.mapId (.mk (op U)))).app y ≪≫ p ≪≫
      (X.obj.app (.mk (op U))).toFunctor.mapIso
        ((Cat.Hom.toNatIso (F.mapId (.mk (op U)))).app x).symm := by
  sorry

-- test: RestrictionActionTests.natural_component
example (X : HomCategory bF bG) (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    (fibreIsomRestrictionNatTrans bF bG f x y).app X =
      fibreIsomRestriction bF bG X f x y := by
  sorry

-- test: RestrictionActionTests.modification_square
example {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    (fibreIsomActionFunctor bF bG U x y).map m ≫
        (fibreIsomRestrictionNatTrans bF bG f x y).app Y =
      (fibreIsomRestrictionNatTrans bF bG f x y).app X ≫
        (Action.res (Type v') (A.obj.map f.op).hom.toMultiplicative).map
          ((fibreIsomActionFunctor bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
            ((G.map f.op.toLoc).toFunctor.obj y)).map m) := by
  sorry

-- test: RestrictionActionTests.inverse_modification_square
example {X Y : HomCategory bF bG} (m : X ⟶ Y) (x : F.obj (.mk (op U))) :
    (G.map f.op.toLoc).toFunctor.mapIso (componentIso bF bG m U x).symm ≪≫
      restrictionIso bF bG X f x =
    restrictionIso bF bG Y f x ≪≫
      (componentIso bF bG m V ((F.map f.op.toLoc).toFunctor.obj x)).symm := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.RestrictionActionTests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.RestrictionActionTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)
variable {U V : C}

-- test: RestrictionActionTests.local_object_square
example (f : V ⟶ U) {x x' : F.obj (.mk (op U))} (e : x ≅ x') :
    (selfTransportNatIso b e).hom ≫ fibreIsomRestrictionNatTrans b b f x' x' =
      fibreIsomRestrictionNatTrans b b f x x ≫
        Functor.whiskerRight (selfTransportNatIso b ((F.map f.op.toLoc).toFunctor.mapIso e)).hom
          (Action.res (Type v') (A.obj.map f.op).hom.toMultiplicative) := by
  sorry

-- test: RestrictionActionTests.restricted_choice_independence
example (X : HomCategory b b) (f : V ⟶ U)
    {x x' : F.obj (.mk (op U))} (e e' : x ≅ x') :
    (Action.res (Type v') (A.obj.map f.op).hom.toMultiplicative).map
        (selfTransportActionIso b X ((F.map f.op.toLoc).toFunctor.mapIso e)).hom =
      (Action.res (Type v') (A.obj.map f.op).hom.toMultiplicative).map
        (selfTransportActionIso b X ((F.map f.op.toLoc).toFunctor.mapIso e')).hom := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.RestrictionActionTests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable (U : C) (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U)))

def fibreHomSheaf (X : HomCategory bF bG) : Sheaf (J.over U) (Type v') :=
  G.sheafHom J y ((X.obj.app (.mk (op U))).toFunctor.obj x)

noncomputable def fibreHomSectionIsoEquiv (X : HomCategory bF bG) (T : Over U) :
    ((fibreHomSheaf bF bG U x y X).obj.obj (op T)) ≃
      ((G.map T.hom.op.toLoc).toFunctor.obj y ≅
        (G.map T.hom.op.toLoc).toFunctor.obj
          ((X.obj.app (.mk (op U))).toFunctor.obj x)) where
  toFun p := by
    letI := IsGerbe.isIso_hom (F := G) (J := J) T.left p
    exact asIso p
  invFun p := p.hom
  left_inv p := rfl
  right_inv p := by apply Iso.ext; rfl

def fibreHomSheafMap {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    fibreHomSheaf bF bG U x y X ⟶ fibreHomSheaf bF bG U x y Y where
  hom :=
    { app := fun T => TypeCat.ofHom (fun p => p ≫
        (G.map T.unop.hom.op.toLoc).toFunctor.map
          ((m.hom.as.app (.mk (op U))).toNatTrans.app x))
      naturality := by
        intro T₁ T₂ f
        ext p
        dsimp [fibreHomSheaf, Pseudofunctor.sheafHom, Pseudofunctor.presheafHom,
          pullHom]
        simp only [Functor.map_comp, Category.assoc]
        rw [G.mapComp'_inv_naturality] }

theorem fibreHomSheafMap_apply {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (T : Over U) (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomSheafMap bF bG U x y m).hom.app (op T) p =
      p ≫ (G.map T.hom.op.toLoc).toFunctor.map
        ((m.hom.as.app (.mk (op U))).toNatTrans.app x) := by
  sorry

def fibreHomSheafFunctor : HomCategory bF bG ⥤ Sheaf (J.over U) (Type v') where
  obj X := fibreHomSheaf bF bG U x y X
  map m := fibreHomSheafMap bF bG U x y m
  map_id X := by
    ext T p
    change p ≫ (G.map T.unop.hom.op.toLoc).toFunctor.map (𝟙 _) = p
    simp
  map_comp m n := by
    ext T p
    change p ≫ (G.map T.unop.hom.op.toLoc).toFunctor.map (_ ≫ _) =
      (p ≫ (G.map T.unop.hom.op.toLoc).toFunctor.map _) ≫
        (G.map T.unop.hom.op.toLoc).toFunctor.map _
    simp [Category.assoc]

theorem fibreHomSectionIsoEquiv_hom (X : HomCategory bF bG) (T : Over U)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomSectionIsoEquiv bF bG U x y X T p).hom = p := by
  sorry

theorem fibreHomSheafFunctor_obj (X : HomCategory bF bG) :
    (fibreHomSheafFunctor bF bG U x y).obj X =
      G.sheafHom J y ((X.obj.app (.mk (op U))).toFunctor.obj x) := by
  sorry

theorem fibreHomSheafFunctor_map {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (fibreHomSheafFunctor bF bG U x y).map m =
      fibreHomSheafMap bF bG U x y m := by
  sorry

noncomputable def fibreHomSheafMapIso {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    fibreHomSheaf bF bG U x y X ≅ fibreHomSheaf bF bG U x y Y :=
  (fibreHomSheafFunctor bF bG U x y).mapIso (homIso bF bG m)

theorem fibreHomSheafMapIso_hom {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (fibreHomSheafMapIso bF bG U x y m).hom =
      fibreHomSheafMap bF bG U x y m := by
  sorry

theorem fibreHomSheafMapIso_inv {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (fibreHomSheafMapIso bF bG U x y m).inv =
      fibreHomSheafMap bF bG U x y (homIso bF bG m).inv := by
  sorry

theorem fibreHomSheaf_locallyNonempty (X : HomCategory bF bG) (T : Over U) :
    ∃ R : Sieve T.left, R ∈ J T.left ∧
      ∀ ⦃V : C⦄ (g : V ⟶ T.left), R g →
        Nonempty ((fibreHomSheaf bF bG U x y X).obj.obj
          (op (Over.mk (g ≫ T.hom)))) := by
  sorry

noncomputable def fibreHomSectionAction (X : HomCategory bF bG) (T : Over U) :
    Action (Type v') (Multiplicative (A.obj.obj (op T.left))) where
  V := (fibreHomSheaf bF bG U x y X).obj.obj (op T)
  ρ :=
    { toFun := fun a => TypeCat.ofHom (fun p => p ≫
        (bG.autEquiv T.left ((G.map T.hom.op.toLoc).toFunctor.obj
          ((X.obj.app (.mk (op U))).toFunctor.obj x)) a).hom)
      map_one' := by
        change (TypeCat.ofHom _ : ((fibreHomSheaf bF bG U x y X).obj.obj (op T)) ⟶
          ((fibreHomSheaf bF bG U x y X).obj.obj (op T))) = 𝟙 _
        ext p
        change p ≫ (bG.autEquiv T.left _ 1).hom = p
        rw [map_one]
        exact Category.comp_id p
      map_mul' := by
        intro a c
        change (TypeCat.ofHom _ : ((fibreHomSheaf bF bG U x y X).obj.obj (op T)) ⟶
          ((fibreHomSheaf bF bG U x y X).obj.obj (op T))) = _ ≫ _
        ext p
        simp [Aut.Aut_mul_def, Category.assoc] }

theorem fibreHomSectionAction_apply (X : HomCategory bF bG) (T : Over U)
    (a : Multiplicative (A.obj.obj (op T.left)))
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    ((fibreHomSectionAction bF bG U x y X T).ρ a).hom p = p ≫
      (bG.autEquiv T.left ((G.map T.hom.op.toLoc).toFunctor.obj
        ((X.obj.app (.mk (op U))).toFunctor.obj x)) a).hom := by
  sorry

theorem fibreHomSectionAction_freeTransitive (X : HomCategory bF bG) (T : Over U)
    (p q : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    ∃! a : Multiplicative (A.obj.obj (op T.left)),
      ((fibreHomSectionAction bF bG U x y X T).ρ a).hom p = q := by
  sorry

theorem fibreHomSheafMap_equivariant {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (T : Over U) (a : Multiplicative (A.obj.obj (op T.left)))
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomSheafMap bF bG U x y m).hom.app (op T)
        (((fibreHomSectionAction bF bG U x y X T).ρ a).hom p) =
      ((fibreHomSectionAction bF bG U x y Y T).ρ a).hom
        ((fibreHomSheafMap bF bG U x y m).hom.app (op T) p) := by
  sorry

theorem fibreHomSectionAction_restriction (X : HomCategory bF bG)
    {T₁ T₂ : Over U} (f : T₁ ⟶ T₂)
    (a : Multiplicative (A.obj.obj (op T₂.left)))
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T₂)) :
    (fibreHomSheaf bF bG U x y X).obj.map f.op
        (((fibreHomSectionAction bF bG U x y X T₂).ρ a).hom p) =
      ((fibreHomSectionAction bF bG U x y X T₁).ρ
        ((A.obj.map f.left.op).hom.toMultiplicative a)).hom
          ((fibreHomSheaf bF bG U x y X).obj.map f.op p) := by
  sorry

noncomputable def fibreHomTransportIsoEquiv (X : HomCategory bF bG) (T : Over U) :
    ((fibreHomSheaf bF bG U x y X).obj.obj (op T)) ≃
      ((G.map T.hom.op.toLoc).toFunctor.obj y ≅
        (X.obj.app (.mk (op T.left))).toFunctor.obj
          ((F.map T.hom.op.toLoc).toFunctor.obj x)) where
  toFun p := fibreHomSectionIsoEquiv bF bG U x y X T p ≪≫
    restrictionIso bF bG X T.hom x
  invFun q := (q ≪≫ (restrictionIso bF bG X T.hom x).symm).hom
  left_inv p := by simp [fibreHomSectionIsoEquiv]
  right_inv q := by apply Iso.ext; simp [fibreHomSectionIsoEquiv]

theorem fibreHomTransportIsoEquiv_apply (X : HomCategory bF bG) (T : Over U)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    fibreHomTransportIsoEquiv bF bG U x y X T p =
      fibreHomSectionIsoEquiv bF bG U x y X T p ≪≫
        restrictionIso bF bG X T.hom x := by
  sorry

theorem fibreHomTransportIsoEquiv_modification {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (T : Over U) (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    fibreHomTransportIsoEquiv bF bG U x y Y T
        ((fibreHomSheafMap bF bG U x y m).hom.app (op T) p) =
      fibreHomTransportIsoEquiv bF bG U x y X T p ≪≫
        componentIso bF bG m T.left ((F.map T.hom.op.toLoc).toFunctor.obj x) := by
  sorry

theorem fibreHomSheaf_obj (X : HomCategory bF bG) :
    (fibreHomSheaf bF bG U x y X).obj =
      G.presheafHom y ((X.obj.app (.mk (op U))).toFunctor.obj x) := by
  sorry

theorem fibreHomSheaf_isSheaf (X : HomCategory bF bG) :
    Presheaf.IsSheaf (J.over U) (fibreHomSheaf bF bG U x y X).obj := by
  sorry

theorem fibreHomSectionIsoEquiv_symm_apply (X : HomCategory bF bG) (T : Over U)
    (q : (G.map T.hom.op.toLoc).toFunctor.obj y ≅
      (G.map T.hom.op.toLoc).toFunctor.obj ((X.obj.app (.mk (op U))).toFunctor.obj x)) :
    (fibreHomSectionIsoEquiv bF bG U x y X T).symm q = q.hom := by
  sorry

theorem fibreHomSectionIsoEquiv_apply_symm_apply (X : HomCategory bF bG) (T : Over U)
    (q : (G.map T.hom.op.toLoc).toFunctor.obj y ≅
      (G.map T.hom.op.toLoc).toFunctor.obj ((X.obj.app (.mk (op U))).toFunctor.obj x)) :
    fibreHomSectionIsoEquiv bF bG U x y X T
      ((fibreHomSectionIsoEquiv bF bG U x y X T).symm q) = q := by
  sorry

theorem fibreHomSheafMap_id (X : HomCategory bF bG) :
    fibreHomSheafMap bF bG U x y (𝟙 X) = 𝟙 (fibreHomSheaf bF bG U x y X) := by
  sorry

theorem fibreHomSheafFunctor_map_comp {X Y Z : HomCategory bF bG}
    (m : X ⟶ Y) (n : Y ⟶ Z) :
    (fibreHomSheafFunctor bF bG U x y).map (m ≫ n) =
      (fibreHomSheafFunctor bF bG U x y).map m ≫
        (fibreHomSheafFunctor bF bG U x y).map n := by
  sorry

theorem fibreHomSheafMapIso_hom_inv_id {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (fibreHomSheafMapIso bF bG U x y m).hom ≫
      (fibreHomSheafMapIso bF bG U x y m).inv = 𝟙 _ := by
  sorry

theorem fibreHomTransportIsoEquiv_symm_apply (X : HomCategory bF bG) (T : Over U)
    (q : (G.map T.hom.op.toLoc).toFunctor.obj y ≅
      (X.obj.app (.mk (op T.left))).toFunctor.obj
        ((F.map T.hom.op.toLoc).toFunctor.obj x)) :
    (fibreHomTransportIsoEquiv bF bG U x y X T).symm q =
      (q ≪≫ (restrictionIso bF bG X T.hom x).symm).hom := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.SheafAssemblyTests
open CategoryTheory Opposite Bicategory
open TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable (U : C) (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U)))
-- test: SheafAssemblyTests.actual_hom_sheaf
example (X : HomCategory bF bG) :
    (fibreHomSheaf bF bG U x y X).obj =
      G.presheafHom y ((X.obj.app (.mk (op U))).toFunctor.obj x) := by
  sorry

-- test: SheafAssemblyTests.local_sections
example (X : HomCategory bF bG) (T : Over U) :
    ∃ R : Sieve T.left, R ∈ J T.left ∧
      ∀ ⦃V : C⦄ (g : V ⟶ T.left), R g →
        Nonempty ((fibreHomSheaf bF bG U x y X).obj.obj
          (op (Over.mk (g ≫ T.hom)))) := by
  sorry

-- test: SheafAssemblyTests.iso_roundtrip
example (X : HomCategory bF bG) (T : Over U)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomSectionIsoEquiv bF bG U x y X T).symm
      (fibreHomSectionIsoEquiv bF bG U x y X T p) = p := by
  sorry

-- test: SheafAssemblyTests.iso_inverse_roundtrip
example (X : HomCategory bF bG) (T : Over U)
    (q : (G.map T.hom.op.toLoc).toFunctor.obj y ≅
      (G.map T.hom.op.toLoc).toFunctor.obj ((X.obj.app (.mk (op U))).toFunctor.obj x)) :
    fibreHomSectionIsoEquiv bF bG U x y X T
      ((fibreHomSectionIsoEquiv bF bG U x y X T).symm q) = q := by
  sorry

-- test: SheafAssemblyTests.actual_modification
example {X Y : HomCategory bF bG} (m : X ⟶ Y) (T : Over U)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomSheafMap bF bG U x y m).hom.app (op T) p =
      p ≫ (G.map T.hom.op.toLoc).toFunctor.map
        ((m.hom.as.app (.mk (op U))).toNatTrans.app x) := by
  sorry

-- test: SheafAssemblyTests.modification_restriction
example {X Y : HomCategory bF bG} (m : X ⟶ Y)
    {T₁ T₂ : (Over U)ᵒᵖ} (f : T₁ ⟶ T₂) :
    (fibreHomSheaf bF bG U x y X).obj.map f ≫
      (fibreHomSheafMap bF bG U x y m).hom.app T₂ =
      (fibreHomSheafMap bF bG U x y m).hom.app T₁ ≫
        (fibreHomSheaf bF bG U x y Y).obj.map f := by
  sorry

-- test: SheafAssemblyTests.identity_functor
example (X : HomCategory bF bG) :
    (fibreHomSheafFunctor bF bG U x y).map (𝟙 X) = 𝟙 _ := by
  sorry

-- test: SheafAssemblyTests.composed_modifications
example {X Y Z : HomCategory bF bG} (m : X ⟶ Y) (n : Y ⟶ Z) :
    (fibreHomSheafFunctor bF bG U x y).map (m ≫ n) =
      (fibreHomSheafFunctor bF bG U x y).map m ≫
        (fibreHomSheafFunctor bF bG U x y).map n := by
  sorry

-- test: SheafAssemblyTests.functor_carrier
example (X : HomCategory bF bG) :
    (fibreHomSheafFunctor bF bG U x y).obj X =
      G.sheafHom J y ((X.obj.app (.mk (op U))).toFunctor.obj x) := by
  sorry

-- test: SheafAssemblyTests.inverse_modification
example {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (fibreHomSheafMapIso bF bG U x y m).inv =
      fibreHomSheafMap bF bG U x y (homIso bF bG m).inv := by
  sorry

-- test: SheafAssemblyTests.inverse_modification_roundtrip
example {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (fibreHomSheafMapIso bF bG U x y m).hom ≫
      (fibreHomSheafMapIso bF bG U x y m).inv = 𝟙 _ := by
  sorry

-- test: SheafAssemblyTests.empty_sections_allowed
example (X : HomCategory bF bG) (T : Over U)
    (h : IsEmpty ((fibreHomSheaf bF bG U x y X).obj.obj (op T))) :
    IsEmpty (fibreHomSectionAction bF bG U x y X T).V := by
  sorry

-- test: SheafAssemblyTests.unique_band_difference
example (X : HomCategory bF bG) (T : Over U)
    (p q : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    ∃! a : Multiplicative (A.obj.obj (op T.left)),
      ((fibreHomSectionAction bF bG U x y X T).ρ a).hom p = q := by
  sorry

-- test: SheafAssemblyTests.semilinear_restriction
example (X : HomCategory bF bG) {T₁ T₂ : Over U} (f : T₁ ⟶ T₂)
    (a : Multiplicative (A.obj.obj (op T₂.left)))
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T₂)) :
    (fibreHomSheaf bF bG U x y X).obj.map f.op
        (((fibreHomSectionAction bF bG U x y X T₂).ρ a).hom p) =
      ((fibreHomSectionAction bF bG U x y X T₁).ρ
        ((A.obj.map f.left.op).hom.toMultiplicative a)).hom
          ((fibreHomSheaf bF bG U x y X).obj.map f.op p) := by
  sorry

-- test: SheafAssemblyTests.modification_equivariance
example {X Y : HomCategory bF bG} (m : X ⟶ Y) (T : Over U)
    (a : Multiplicative (A.obj.obj (op T.left)))
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomSheafMap bF bG U x y m).hom.app (op T)
        (((fibreHomSectionAction bF bG U x y X T).ρ a).hom p) =
      ((fibreHomSectionAction bF bG U x y Y T).ρ a).hom
        ((fibreHomSheafMap bF bG U x y m).hom.app (op T) p) := by
  sorry

-- test: SheafAssemblyTests.transport_roundtrip
example (X : HomCategory bF bG) (T : Over U)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomTransportIsoEquiv bF bG U x y X T).symm
      (fibreHomTransportIsoEquiv bF bG U x y X T p) = p := by
  sorry

-- test: SheafAssemblyTests.transport_modification
example {X Y : HomCategory bF bG} (m : X ⟶ Y) (T : Over U)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    fibreHomTransportIsoEquiv bF bG U x y Y T
        ((fibreHomSheafMap bF bG U x y m).hom.app (op T) p) =
      fibreHomTransportIsoEquiv bF bG U x y X T p ≪≫
        componentIso bF bG m T.left ((F.map T.hom.op.toLoc).toFunctor.obj x) := by
  sorry

-- test: SheafAssemblyTests.actual_sheaf_property
example (X : HomCategory bF bG) :
    Presheaf.IsSheaf (J.over U) (fibreHomSheaf bF bG U x y X).obj := by
  sorry

-- test: SheafAssemblyTests.iso_actual_arrow
example (X : HomCategory bF bG) (T : Over U)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomSectionIsoEquiv bF bG U x y X T p).hom = p := by
  sorry

-- test: SheafAssemblyTests.identity_section_map
example (X : HomCategory bF bG) (T : Over U)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomSheafMap bF bG U x y (𝟙 X)).hom.app (op T) p = p := by
  sorry

-- test: SheafAssemblyTests.forward_modification
example {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (fibreHomSheafMapIso bF bG U x y m).hom =
      fibreHomSheafMap bF bG U x y m := by
  sorry

-- test: SheafAssemblyTests.inverse_transport_formula
example (X : HomCategory bF bG) (T : Over U)
    (q : (G.map T.hom.op.toLoc).toFunctor.obj y ≅
      (X.obj.app (.mk (op T.left))).toFunctor.obj
        ((F.map T.hom.op.toLoc).toFunctor.obj x)) :
    (fibreHomTransportIsoEquiv bF bG U x y X T).symm q =
      (q ≪≫ (restrictionIso bF bG X T.hom x).symm).hom := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.SheafAssemblyTests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U : C} {x x' x'' : F.obj (.mk (op U))}
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

def selfHomSheafTransport (X : HomCategory b b) (e : x ≅ x') :
    fibreHomSheaf b b U x x X ⟶ fibreHomSheaf b b U x' x' X where
  hom :=
    { app := fun T => TypeCat.ofHom (fun p =>
        (F.map T.unop.hom.op.toLoc).toFunctor.map e.inv ≫ p ≫
        (F.map T.unop.hom.op.toLoc).toFunctor.map
          ((X.obj.app (.mk (op U))).toFunctor.map e.hom))
      naturality := by sorry }

theorem selfHomSheafTransport_apply (X : HomCategory b b) (e : x ≅ x')
    (T : Over U) (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    (selfHomSheafTransport b X e).hom.app (op T) p =
      (F.map T.hom.op.toLoc).toFunctor.map e.inv ≫ p ≫
      (F.map T.hom.op.toLoc).toFunctor.map
        ((X.obj.app (.mk (op U))).toFunctor.map e.hom) := by
  sorry

theorem selfHomSheafTransport_id (X : HomCategory b b) :
    selfHomSheafTransport b X (Iso.refl x) = 𝟙 _ := by
  sorry

theorem selfHomSheafTransport_comp (X : HomCategory b b) (e : x ≅ x') (f : x' ≅ x'') :
    selfHomSheafTransport b X (e ≪≫ f) =
      selfHomSheafTransport b X e ≫ selfHomSheafTransport b X f := by
  sorry

def selfHomSheafTransportIso (X : HomCategory b b) (e : x ≅ x') :
    fibreHomSheaf b b U x x X ≅ fibreHomSheaf b b U x' x' X where
  hom := selfHomSheafTransport b X e
  inv := selfHomSheafTransport b X e.symm
  hom_inv_id := by sorry
  inv_hom_id := by sorry

theorem selfHomSheafTransport_transport (X : HomCategory b b) (e : x ≅ x')
    (T : Over U) (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    fibreHomTransportIsoEquiv b b U x' x' X T
        ((selfHomSheafTransport b X e).hom.app (op T) p) =
      (selfTransportActionIso b X ((F.map T.hom.op.toLoc).toFunctor.mapIso e)).hom.hom
        (fibreHomTransportIsoEquiv b b U x x X T p) := by
  sorry

theorem selfHomSheafTransport_independent (X : HomCategory b b) (e f : x ≅ x') :
    selfHomSheafTransport b X e = selfHomSheafTransport b X f := by
  sorry

theorem selfHomSheafTransport_equivariant (X : HomCategory b b) (e : x ≅ x')
    (T : Over U) (a : Multiplicative (A.obj.obj (op T.left)))
    (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    (selfHomSheafTransport b X e).hom.app (op T)
        (((fibreHomSectionAction b b U x x X T).ρ a).hom p) =
      ((fibreHomSectionAction b b U x' x' X T).ρ a).hom
        ((selfHomSheafTransport b X e).hom.app (op T) p) := by
  sorry

noncomputable def selfHomSheafTransportNatIso (e : x ≅ x') :
    fibreHomSheafFunctor b b U x x ≅ fibreHomSheafFunctor b b U x' x' :=
  NatIso.ofComponents (fun X => selfHomSheafTransportIso b X e) (by sorry)

theorem selfHomSheafTransportNatIso_app (e : x ≅ x') (X : HomCategory b b) :
    (selfHomSheafTransportNatIso b e).app X = selfHomSheafTransportIso b X e := by
  sorry

theorem selfHomSheafTransportNatIso_independent (e f : x ≅ x') :
    selfHomSheafTransportNatIso b e = selfHomSheafTransportNatIso b f := by
  sorry

theorem selfHomSheafTransportNatIso_id :
    selfHomSheafTransportNatIso b (Iso.refl x) = Iso.refl _ := by
  sorry

theorem selfHomSheafTransportNatIso_comp (e : x ≅ x') (f : x' ≅ x'') :
    selfHomSheafTransportNatIso b (e ≪≫ f) =
      selfHomSheafTransportNatIso b e ≪≫ selfHomSheafTransportNatIso b f := by
  sorry

theorem selfHomSheafTransportIso_hom (X : HomCategory b b) (e : x ≅ x') :
    (selfHomSheafTransportIso b X e).hom = selfHomSheafTransport b X e := by
  sorry

theorem selfHomSheafTransportIso_inv (X : HomCategory b b) (e : x ≅ x') :
    (selfHomSheafTransportIso b X e).inv = selfHomSheafTransport b X e.symm := by
  sorry

theorem selfHomSheafTransportIso_independent (X : HomCategory b b) (e f : x ≅ x') :
    selfHomSheafTransportIso b X e = selfHomSheafTransportIso b X f := by
  sorry

noncomputable def selfHomSheafObjectFunctor (U : C) :
    Core (F.obj (.mk (op U))) ⥤ (HomCategory b b ⥤ Sheaf (J.over U) (Type v')) where
  obj x := fibreHomSheafFunctor b b U x.of x.of
  map e := (selfHomSheafTransportNatIso b e.iso).hom
  map_id x := by sorry
  map_comp e f := by sorry

theorem selfHomSheafObjectFunctor_obj (U : C) (x : Core (F.obj (.mk (op U)))) :
    (selfHomSheafObjectFunctor b U).obj x = fibreHomSheafFunctor b b U x.of x.of := by
  sorry

theorem selfHomSheafObjectFunctor_map (U : C) {x y : Core (F.obj (.mk (op U)))}
    (e : x ⟶ y) :
    (selfHomSheafObjectFunctor b U).map e = (selfHomSheafTransportNatIso b e.iso).hom := by
  sorry

theorem selfHomSheafObjectFunctor_parallel (U : C) {x y : Core (F.obj (.mk (op U)))}
    (e f : x ⟶ y) :
    (selfHomSheafObjectFunctor b U).map e = (selfHomSheafObjectFunctor b U).map f := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U : C} {x x' x'' x3 : F.obj (.mk (op U))}
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

-- test: SheafTransportTests.automorphism_trivial
example (X : HomCategory b b) (e : x ≅ x) :
    selfHomSheafTransport b X e = 𝟙 _ := by
  sorry

-- test: SheafTransportTests.modification_square
example (e : x ≅ x') {X Y : HomCategory b b} (m : X ⟶ Y) :
    fibreHomSheafMap b b U x x m ≫ selfHomSheafTransport b Y e =
      selfHomSheafTransport b X e ≫ fibreHomSheafMap b b U x' x' m := by
  sorry

-- test: SheafTransportTests.scalar_compatibility
example (X : HomCategory b b) (e : x ≅ x') (T : Over U)
    (a : Multiplicative (A.obj.obj (op T.left)))
    (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    (selfHomSheafTransport b X e).hom.app (op T)
        (((fibreHomSectionAction b b U x x X T).ρ a).hom p) =
      ((fibreHomSectionAction b b U x' x' X T).ρ a).hom
        ((selfHomSheafTransport b X e).hom.app (op T) p) := by
  sorry

-- test: SheafTransportTests.inverse_roundtrip
example (X : HomCategory b b) (e : x ≅ x') (T : Over U)
    (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    (selfHomSheafTransportIso b X e).inv.hom.app (op T)
        ((selfHomSheafTransportIso b X e).hom.hom.app (op T) p) = p := by
  sorry

-- test: SheafTransportTests.empty_sections
example (X : HomCategory b b) (e : x ≅ x') (T : Over U)
    [IsEmpty ((fibreHomSheaf b b U x x X).obj.obj (op T))] :
    IsEmpty ((fibreHomSheaf b b U x' x' X).obj.obj (op T)) := by
  sorry

-- test: SheafTransportTests.iso_choice_independence
example (X : HomCategory b b) (e f : x ≅ x') :
    selfHomSheafTransportIso b X e = selfHomSheafTransportIso b X f := by
  sorry

-- test: SheafTransportTests.inverse_modification
example (e : x ≅ x') {X Y : HomCategory b b} (m : X ⟶ Y) :
    (fibreHomSheafMapIso b b U x x m).inv ≫ selfHomSheafTransport b X e =
      selfHomSheafTransport b Y e ≫ (fibreHomSheafMapIso b b U x' x' m).inv := by
  sorry

-- test: SheafTransportTests.three_objects
example (e : x ≅ x') (f : x' ≅ x'') (g : x'' ≅ x3) :
    selfHomSheafTransportNatIso b ((e ≪≫ f) ≪≫ g) =
      (selfHomSheafTransportNatIso b e ≪≫ selfHomSheafTransportNatIso b f) ≪≫
        selfHomSheafTransportNatIso b g := by
  sorry

-- test: SheafTransportTests.actual_restriction
example (X : HomCategory b b) (e : x ≅ x') {T V : Over U} (f : V ⟶ T)
    (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    (fibreHomSheaf b b U x' x' X).obj.map f.op
        ((selfHomSheafTransport b X e).hom.app (op T) p) =
      (selfHomSheafTransport b X e).hom.app (op V)
        ((fibreHomSheaf b b U x x X).obj.map f.op p) := by
  sorry

-- test: SheafTransportTests.nonfaithful_with_parallel_arrows
example {a c : Core (F.obj (.mk (op U)))} (e f : a ⟶ c) (hne : e ≠ f) :
    ¬ (selfHomSheafObjectFunctor b U).Faithful := by
  sorry

-- test: SheafTransportTests.native_object
example (a : Core (F.obj (.mk (op U)))) (X : HomCategory b b) :
    (((selfHomSheafObjectFunctor b U).obj a).obj X).obj =
      F.presheafHom a.of ((X.obj.app (.mk (op U))).toFunctor.obj a.of) := by
  sorry

-- test: SheafTransportTests.native_composition
example {a c d : Core (F.obj (.mk (op U)))} (e : a ⟶ c) (f : c ⟶ d)
    (X : HomCategory b b) :
    ((selfHomSheafObjectFunctor b U).map (e ≫ f)).app X =
      ((selfHomSheafObjectFunctor b U).map e).app X ≫
        ((selfHomSheafObjectFunctor b U).map f).app X := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable {U V : C}

noncomputable def fibreHomBaseChangeIso (X : HomCategory bF bG) (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    (J.overMapPullback (Type v') f).obj (fibreHomSheaf bF bG U x y X) ≅
      fibreHomSheaf bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
        ((G.map f.op.toLoc).toFunctor.obj y) X := by
  let z := (X.obj.app (.mk (op U))).toFunctor.obj x
  let r := restrictionIso bF bG X f x
  let e := G.overMapCompPresheafHomIso y z f
  let d : G.presheafHom ((G.map f.op.toLoc).toFunctor.obj y)
      ((G.map f.op.toLoc).toFunctor.obj z) ≅
      G.presheafHom ((G.map f.op.toLoc).toFunctor.obj y)
        ((X.obj.app (.mk (op V))).toFunctor.obj
          ((F.map f.op.toLoc).toFunctor.obj x)) :=
    NatIso.ofComponents (fun T => Equiv.toIso
      (Iso.homToEquiv ((G.map T.unop.hom.op.toLoc).toFunctor.mapIso r))) (by sorry)
  exact
    { hom := { hom := (e ≪≫ d).hom }
      inv := { hom := (e ≪≫ d).inv }
      hom_inv_id := by sorry
      inv_hom_id := by sorry }

theorem fibreHomBaseChangeIso_apply (X : HomCategory bF bG) (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) (T : Over V)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op ((Over.map f).obj T))) :
    (fibreHomBaseChangeIso bF bG X f x y).hom.hom.app (op T) p =
      (G.overMapCompPresheafHomIso y
        ((X.obj.app (.mk (op U))).toFunctor.obj x) f).hom.app (op T) p ≫
        (G.map T.hom.op.toLoc).toFunctor.map (restrictionIso bF bG X f x).hom := by
  sorry

theorem fibreHomBaseChangeIso_inv_apply (X : HomCategory bF bG) (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) (T : Over V)
    (p : (fibreHomSheaf bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
      ((G.map f.op.toLoc).toFunctor.obj y) X).obj.obj (op T)) :
    (fibreHomBaseChangeIso bF bG X f x y).inv.hom.app (op T) p =
      (G.overMapCompPresheafHomIso y
        ((X.obj.app (.mk (op U))).toFunctor.obj x) f).inv.app (op T)
        (p ≫ (G.map T.hom.op.toLoc).toFunctor.map (restrictionIso bF bG X f x).inv) := by
  sorry

theorem fibreHomBaseChangeIso_formula (X : HomCategory bF bG) (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) (T : Over V)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op ((Over.map f).obj T))) :
    let c := Cat.Hom.toNatIso (G.mapComp' f.op.toLoc T.hom.op.toLoc
      ((Over.map f).obj T).hom.op.toLoc)
    (fibreHomBaseChangeIso bF bG X f x y).hom.hom.app (op T) p =
      (c.app y).inv ≫ p ≫
        (c.app ((X.obj.app (.mk (op U))).toFunctor.obj x)).hom ≫
        (G.map T.hom.op.toLoc).toFunctor.map (restrictionIso bF bG X f x).hom := by
  sorry

theorem fibreHomBaseChangeIso_modification {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (f : V ⟶ U) (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    (J.overMapPullback (Type v') f).map (fibreHomSheafMap bF bG U x y m) ≫
        (fibreHomBaseChangeIso bF bG Y f x y).hom =
      (fibreHomBaseChangeIso bF bG X f x y).hom ≫
        fibreHomSheafMap bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
          ((G.map f.op.toLoc).toFunctor.obj y) m := by
  sorry

noncomputable def fibreHomBaseChangeNatIso (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    fibreHomSheafFunctor bF bG U x y ⋙ J.overMapPullback (Type v') f ≅
      fibreHomSheafFunctor bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
        ((G.map f.op.toLoc).toFunctor.obj y) :=
  NatIso.ofComponents (fun X => fibreHomBaseChangeIso bF bG X f x y)
    (fun m => fibreHomBaseChangeIso_modification bF bG m f x y)

theorem fibreHomBaseChangeNatIso_app (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) (X : HomCategory bF bG) :
    (fibreHomBaseChangeNatIso bF bG f x y).app X =
      fibreHomBaseChangeIso bF bG X f x y := by
  sorry

theorem fibreHomBaseChangeNatIso_hom_app (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) (X : HomCategory bF bG) :
    (fibreHomBaseChangeNatIso bF bG f x y).hom.app X =
      (fibreHomBaseChangeIso bF bG X f x y).hom := by
  sorry

theorem fibreHomBaseChangeNatIso_inv_app (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) (X : HomCategory bF bG) :
    (fibreHomBaseChangeNatIso bF bG f x y).inv.app X =
      (fibreHomBaseChangeIso bF bG X f x y).inv := by
  sorry

theorem fibreHomBaseChangeIso_equivariant (X : HomCategory bF bG) (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) (T : Over V)
    (a : Multiplicative (A.obj.obj (op T.left)))
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op ((Over.map f).obj T))) :
    (fibreHomBaseChangeIso bF bG X f x y).hom.hom.app (op T)
        (((fibreHomSectionAction bF bG U x y X ((Over.map f).obj T)).ρ a).hom p) =
      ((fibreHomSectionAction bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
        ((G.map f.op.toLoc).toFunctor.obj y) X T).ρ a).hom
          ((fibreHomBaseChangeIso bF bG X f x y).hom.hom.app (op T) p) := by
  sorry

theorem fibreHomBaseChangeIso_inv_equivariant (X : HomCategory bF bG) (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) (T : Over V)
    (a : Multiplicative (A.obj.obj (op T.left)))
    (p : (fibreHomSheaf bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
      ((G.map f.op.toLoc).toFunctor.obj y) X).obj.obj (op T)) :
    (fibreHomBaseChangeIso bF bG X f x y).inv.hom.app (op T)
        (((fibreHomSectionAction bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
          ((G.map f.op.toLoc).toFunctor.obj y) X T).ρ a).hom p) =
      ((fibreHomSectionAction bF bG U x y X ((Over.map f).obj T)).ρ a).hom
        ((fibreHomBaseChangeIso bF bG X f x y).inv.hom.app (op T) p) := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A) {U V : C}
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

theorem selfHomBaseChangeTransport_square (X : HomCategory b b) (f : V ⟶ U)
    {x x' : F.obj (.mk (op U))} (e : x ≅ x') :
    (J.overMapPullback (Type v') f).map (selfHomSheafTransport b X e) ≫
        (fibreHomBaseChangeIso b b X f x' x').hom =
      (fibreHomBaseChangeIso b b X f x x).hom ≫
        selfHomSheafTransport b X ((F.map f.op.toLoc).toFunctor.mapIso e) := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.SheafBaseChangeTests
open CategoryTheory Opposite Bicategory
open TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable {U V : C} (f : V ⟶ U)
  (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U)))

-- test: SheafBaseChangeTests.inverse_roundtrip
example (X : HomCategory bF bG) (T : Over V)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op ((Over.map f).obj T))) :
    (fibreHomBaseChangeIso bF bG X f x y).inv.hom.app (op T)
        ((fibreHomBaseChangeIso bF bG X f x y).hom.hom.app (op T) p) = p := by
  sorry

-- test: SheafBaseChangeTests.empty_sections
example (X : HomCategory bF bG) (T : Over V)
    [hEmpty : IsEmpty ((fibreHomSheaf bF bG U x y X).obj.obj (op ((Over.map f).obj T)))] :
    IsEmpty ((fibreHomSheaf bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
      ((G.map f.op.toLoc).toFunctor.obj y) X).obj.obj (op T)) := by
  sorry

-- test: SheafBaseChangeTests.unit_coefficient
example (X : HomCategory bF bG) (T : Over V)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op ((Over.map f).obj T))) :
    (fibreHomBaseChangeIso bF bG X f x y).hom.hom.app (op T)
      (((fibreHomSectionAction bF bG U x y X ((Over.map f).obj T)).ρ 1).hom p) =
        (fibreHomBaseChangeIso bF bG X f x y).hom.hom.app (op T) p := by
  sorry

-- test: SheafBaseChangeTests.deeper_slice
example (X : HomCategory bF bG) {T W : Over V} (g : W ⟶ T)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op ((Over.map f).obj T))) :
    (fibreHomSheaf bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
        ((G.map f.op.toLoc).toFunctor.obj y) X).obj.map g.op
      ((fibreHomBaseChangeIso bF bG X f x y).hom.hom.app (op T) p) =
    (fibreHomBaseChangeIso bF bG X f x y).hom.hom.app (op W)
      ((fibreHomSheaf bF bG U x y X).obj.map ((Over.map f).map g).op p) := by
  sorry

-- test: SheafBaseChangeTests.inverse_modification
example {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (J.overMapPullback (Type v') f).map
        (fibreHomSheafMap bF bG U x y (homIso bF bG m).inv) ≫
      (fibreHomBaseChangeIso bF bG X f x y).hom =
    (fibreHomBaseChangeIso bF bG Y f x y).hom ≫
      fibreHomSheafMap bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
        ((G.map f.op.toLoc).toFunctor.obj y) (homIso bF bG m).inv := by
  sorry

-- test: SheafBaseChangeTests.composite_modifications
example {X Y Z : HomCategory bF bG} (m : X ⟶ Y) (n : Y ⟶ Z) :
    ((J.overMapPullback (Type v') f).map (fibreHomSheafMap bF bG U x y m) ≫
        (J.overMapPullback (Type v') f).map (fibreHomSheafMap bF bG U x y n)) ≫
      (fibreHomBaseChangeNatIso bF bG f x y).hom.app Z =
    (fibreHomBaseChangeNatIso bF bG f x y).hom.app X ≫
      (fibreHomSheafMap bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
        ((G.map f.op.toLoc).toFunctor.obj y) m ≫
       fibreHomSheafMap bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
        ((G.map f.op.toLoc).toFunctor.obj y) n) := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.SheafBaseChangeTests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.SheafBaseChangeTests
open CategoryTheory Opposite Bicategory
open TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A) {U V : C}
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

-- test: SheafBaseChangeTests.local_object_square
example (X : HomCategory b b) (f : V ⟶ U)
    {x x' : F.obj (.mk (op U))} (e : x ≅ x') :
    (J.overMapPullback (Type v') f).map (selfHomSheafTransport b X e) ≫
        (fibreHomBaseChangeNatIso b b f x' x').hom.app X =
      (fibreHomBaseChangeNatIso b b f x x).hom.app X ≫
        selfHomSheafTransport b X ((F.map f.op.toLoc).toFunctor.mapIso e) := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.SheafBaseChangeTests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable {U V W : C}

theorem fibreHomBaseChangeIso_transport (X : HomCategory bF bG) (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) (T : Over V)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op ((Over.map f).obj T))) :
    fibreHomTransportIsoEquiv bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
        ((G.map f.op.toLoc).toFunctor.obj y) X T
        ((fibreHomBaseChangeIso bF bG X f x y).hom.hom.app (op T) p) =
      ((Cat.Hom.toNatIso (G.mapComp f.op.toLoc T.hom.op.toLoc)).app y).symm ≪≫
        fibreHomTransportIsoEquiv bF bG U x y X ((Over.map f).obj T) p ≪≫
        (X.obj.app (.mk (op T.left))).toFunctor.mapIso
          ((Cat.Hom.toNatIso (F.mapComp f.op.toLoc T.hom.op.toLoc)).app x) := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)
variable {U V W : C}

theorem selfHomBaseChangeIso_transport (X : HomCategory b b) (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (T : Over V)
    (p : (fibreHomSheaf b b U x x X).obj.obj (op ((Over.map f).obj T))) :
    fibreHomTransportIsoEquiv b b V ((F.map f.op.toLoc).toFunctor.obj x)
        ((F.map f.op.toLoc).toFunctor.obj x) X T
        ((fibreHomBaseChangeIso b b X f x x).hom.hom.app (op T) p) =
      (selfTransportActionIso b X
        ((Cat.Hom.toNatIso (F.mapComp f.op.toLoc T.hom.op.toLoc)).app x)).hom.hom
        (fibreHomTransportIsoEquiv b b U x x X ((Over.map f).obj T) p) := by
  sorry

theorem selfHomTransport_over_eq (X : HomCategory b b) (x : F.obj (.mk (op U)))
    {T : C} (h k : T ⟶ U) (hk : h = k)
    (e : (F.map h.op.toLoc).toFunctor.obj x ≅ (F.map k.op.toLoc).toFunctor.obj x)
    (p : (fibreHomSheaf b b U x x X).obj.obj (op (Over.mk h))) :
    fibreHomTransportIsoEquiv b b U x x X (Over.mk k)
        ((fibreHomSheaf b b U x x X).obj.map
          (Over.homMk (𝟙 T) (by simpa using hk)).op p) =
      (selfTransportActionIso b X e).hom.hom
        (fibreHomTransportIsoEquiv b b U x x X (Over.mk h) p) := by
  sorry

theorem selfHomBaseChangeIso_id (X : HomCategory b b) (x : F.obj (.mk (op U))) :
    fibreHomBaseChangeIso b b X (𝟙 U) x x ≪≫
        selfHomSheafTransportIso b X ((Cat.Hom.toNatIso (F.mapId (.mk (op U)))).app x) =
      (J.overMapPullbackId (Type v') U).app (fibreHomSheaf b b U x x X) := by
  sorry

theorem selfHomBaseChangeIso_transport_choice (X : HomCategory b b) (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (T : Over V)
    (e : (F.map ((Over.map f).obj T).hom.op.toLoc).toFunctor.obj x ≅
      (F.map T.hom.op.toLoc).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj x))
    (p : (fibreHomSheaf b b U x x X).obj.obj (op ((Over.map f).obj T))) :
    fibreHomTransportIsoEquiv b b V ((F.map f.op.toLoc).toFunctor.obj x)
        ((F.map f.op.toLoc).toFunctor.obj x) X T
        ((fibreHomBaseChangeIso b b X f x x).hom.hom.app (op T) p) =
      (selfTransportActionIso b X e).hom.hom
        (fibreHomTransportIsoEquiv b b U x x X ((Over.map f).obj T) p) := by
  sorry

set_option maxHeartbeats 400000 in
theorem selfHomBaseChangeIso_comp (X : HomCategory b b) (f : V ⟶ U) (g : W ⟶ V)
    (x : F.obj (.mk (op U))) :
    (J.overMapPullbackComp (Type v') g f).app (fibreHomSheaf b b U x x X) ≪≫
        fibreHomBaseChangeIso b b X (g ≫ f) x x ≪≫
        selfHomSheafTransportIso b X
          ((Cat.Hom.toNatIso (F.mapComp f.op.toLoc g.op.toLoc)).app x) =
      (J.overMapPullback (Type v') g).mapIso (fibreHomBaseChangeIso b b X f x x) ≪≫
        fibreHomBaseChangeIso b b X g ((F.map f.op.toLoc).toFunctor.obj x)
          ((F.map f.op.toLoc).toFunctor.obj x) := by
  sorry

theorem selfHomBaseChangeNatIso_id (x : F.obj (.mk (op U))) :
    fibreHomBaseChangeNatIso b b (𝟙 U) x x ≪≫
        selfHomSheafTransportNatIso b
          ((Cat.Hom.toNatIso (F.mapId (.mk (op U)))).app x) =
      Functor.isoWhiskerLeft (fibreHomSheafFunctor b b U x x)
          (J.overMapPullbackId (Type v') U) ≪≫
        (fibreHomSheafFunctor b b U x x).rightUnitor := by
  sorry

theorem selfHomBaseChangeNatIso_comp (f : V ⟶ U) (g : W ⟶ V)
    (x : F.obj (.mk (op U))) :
    (Functor.associator (fibreHomSheafFunctor b b U x x)
        (J.overMapPullback (Type v') f) (J.overMapPullback (Type v') g)) ≪≫
        Functor.isoWhiskerLeft (fibreHomSheafFunctor b b U x x)
          (J.overMapPullbackComp (Type v') g f) ≪≫
        fibreHomBaseChangeNatIso b b (g ≫ f) x x ≪≫
        selfHomSheafTransportNatIso b
          ((Cat.Hom.toNatIso (F.mapComp f.op.toLoc g.op.toLoc)).app x) =
      Functor.isoWhiskerRight (fibreHomBaseChangeNatIso b b f x x)
          (J.overMapPullback (Type v') g) ≪≫
        fibreHomBaseChangeNatIso b b g ((F.map f.op.toLoc).toFunctor.obj x)
          ((F.map f.op.toLoc).toFunctor.obj x) := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.SheafCoherenceTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)
variable {U V W Z : C}

-- test: SheafCoherenceTests.unit_inverse
example (X : HomCategory b b) (x : F.obj (.mk (op U))) :
    (selfHomSheafTransportIso b X ((Cat.Hom.toNatIso (F.mapId (.mk (op U)))).app x)).inv ≫
        (fibreHomBaseChangeIso b b X (𝟙 U) x x).inv =
      ((J.overMapPullbackId (Type v') U).app (fibreHomSheaf b b U x x X)).inv := by
  sorry

-- test: SheafCoherenceTests.composite_inverse
example (X : HomCategory b b) (f : V ⟶ U) (g : W ⟶ V)
    (x : F.obj (.mk (op U))) :
    (selfHomSheafTransportIso b X
      ((Cat.Hom.toNatIso (F.mapComp f.op.toLoc g.op.toLoc)).app x)).inv ≫
        (fibreHomBaseChangeIso b b X (g ≫ f) x x).inv ≫
        ((J.overMapPullbackComp (Type v') g f).app (fibreHomSheaf b b U x x X)).inv =
      (fibreHomBaseChangeIso b b X g ((F.map f.op.toLoc).toFunctor.obj x)
          ((F.map f.op.toLoc).toFunctor.obj x)).inv ≫
        (J.overMapPullback (Type v') g).map (fibreHomBaseChangeIso b b X f x x).inv := by
  sorry

-- test: SheafCoherenceTests.endpoint_choice
example (X : HomCategory b b) (f : V ⟶ U) (g : W ⟶ V)
    (x : F.obj (.mk (op U)))
    (e : (F.map (g ≫ f).op.toLoc).toFunctor.obj x ≅
      (F.map g.op.toLoc).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj x)) :
    (J.overMapPullbackComp (Type v') g f).app (fibreHomSheaf b b U x x X) ≪≫
        fibreHomBaseChangeIso b b X (g ≫ f) x x ≪≫ selfHomSheafTransportIso b X e =
      (J.overMapPullback (Type v') g).mapIso (fibreHomBaseChangeIso b b X f x x) ≪≫
        fibreHomBaseChangeIso b b X g ((F.map f.op.toLoc).toFunctor.obj x)
          ((F.map f.op.toLoc).toFunctor.obj x) := by
  sorry

-- test: SheafCoherenceTests.native_modification
example (f : V ⟶ U) (g : W ⟶ V) (x : F.obj (.mk (op U)))
    {X Y : HomCategory b b} (m : X ⟶ Y) :
    (J.overMapPullback (Type v') g).map
        ((J.overMapPullback (Type v') f).map (fibreHomSheafMap b b U x x m)) ≫
        ((Functor.isoWhiskerRight (fibreHomBaseChangeNatIso b b f x x)
            (J.overMapPullback (Type v') g) ≪≫
          fibreHomBaseChangeNatIso b b g ((F.map f.op.toLoc).toFunctor.obj x)
            ((F.map f.op.toLoc).toFunctor.obj x)).hom.app Y) =
      ((Functor.isoWhiskerRight (fibreHomBaseChangeNatIso b b f x x)
            (J.overMapPullback (Type v') g) ≪≫
          fibreHomBaseChangeNatIso b b g ((F.map f.op.toLoc).toFunctor.obj x)
            ((F.map f.op.toLoc).toFunctor.obj x)).hom.app X) ≫
        fibreHomSheafMap b b W
          ((F.map g.op.toLoc).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj x))
          ((F.map g.op.toLoc).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj x)) m := by
  sorry

-- test: SheafCoherenceTests.coefficient_composite
example (X : HomCategory b b) (f : V ⟶ U) (g : W ⟶ V)
    (x : F.obj (.mk (op U))) (T : Over W)
    (a : Multiplicative (A.obj.obj (op T.left)))
    (p : (fibreHomSheaf b b U x x X).obj.obj
      (op ((Over.map f).obj ((Over.map g).obj T)))) :
    (fibreHomBaseChangeIso b b X g ((F.map f.op.toLoc).toFunctor.obj x)
        ((F.map f.op.toLoc).toFunctor.obj x)).hom.hom.app (op T)
      ((fibreHomBaseChangeIso b b X f x x).hom.hom.app (op ((Over.map g).obj T))
        (((fibreHomSectionAction b b U x x X
          ((Over.map f).obj ((Over.map g).obj T))).ρ a).hom p)) =
      ((fibreHomSectionAction b b W
        ((F.map g.op.toLoc).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj x))
        ((F.map g.op.toLoc).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj x)) X T).ρ a).hom
        ((fibreHomBaseChangeIso b b X g ((F.map f.op.toLoc).toFunctor.obj x)
            ((F.map f.op.toLoc).toFunctor.obj x)).hom.hom.app (op T)
          ((fibreHomBaseChangeIso b b X f x x).hom.hom.app (op ((Over.map g).obj T)) p)) := by
  sorry

-- test: SheafCoherenceTests.third_pullback
example (X : HomCategory b b) (f : V ⟶ U) (g : W ⟶ V) (h : Z ⟶ W)
    (x : F.obj (.mk (op U))) :
    (J.overMapPullback (Type v') h).mapIso
      ((J.overMapPullbackComp (Type v') g f).app (fibreHomSheaf b b U x x X) ≪≫
        fibreHomBaseChangeIso b b X (g ≫ f) x x ≪≫
        selfHomSheafTransportIso b X
          ((Cat.Hom.toNatIso (F.mapComp f.op.toLoc g.op.toLoc)).app x)) =
      (J.overMapPullback (Type v') h).mapIso
        ((J.overMapPullback (Type v') g).mapIso (fibreHomBaseChangeIso b b X f x x) ≪≫
          fibreHomBaseChangeIso b b X g ((F.map f.op.toLoc).toFunctor.obj x)
            ((F.map f.op.toLoc).toFunctor.obj x)) := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.SheafCoherenceTests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable {U V : C} {x x' x'' : F.obj (.mk (op U))}
  {y y' y'' : G.obj (.mk (op U))}

def fibreHomEndpointTransport (X : HomCategory bF bG) (e : x ≅ x') (d : y ≅ y') :
    fibreHomSheaf bF bG U x y X ⟶ fibreHomSheaf bF bG U x' y' X where
  hom :=
    { app := fun T => TypeCat.ofHom (fun p =>
        (G.map T.unop.hom.op.toLoc).toFunctor.map d.inv ≫ p ≫
        (G.map T.unop.hom.op.toLoc).toFunctor.map
          ((X.obj.app (.mk (op U))).toFunctor.map e.hom))
      naturality := by
        intro T₁ T₂ f
        ext p
        dsimp [fibreHomSheaf, Pseudofunctor.sheafHom, Pseudofunctor.presheafHom, pullHom]
        simp only [Functor.map_comp, Category.assoc]
        rw [G.mapComp'_inv_naturality]
        rw [← G.mapComp'_hom_naturality_assoc] }

theorem fibreHomEndpointTransport_apply (X : HomCategory bF bG) (e : x ≅ x') (d : y ≅ y')
    (T : Over U) (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomEndpointTransport bF bG X e d).hom.app (op T) p =
      (G.map T.hom.op.toLoc).toFunctor.map d.inv ≫ p ≫
      (G.map T.hom.op.toLoc).toFunctor.map
        ((X.obj.app (.mk (op U))).toFunctor.map e.hom) := by
  sorry

theorem fibreHomEndpointTransport_id (X : HomCategory bF bG) :
    fibreHomEndpointTransport bF bG X (Iso.refl x) (Iso.refl y) = 𝟙 _ := by
  sorry

theorem fibreHomEndpointTransport_comp (X : HomCategory bF bG)
    (e : x ≅ x') (e' : x' ≅ x'') (d : y ≅ y') (d' : y' ≅ y'') :
    fibreHomEndpointTransport bF bG X (e ≪≫ e') (d ≪≫ d') =
      fibreHomEndpointTransport bF bG X e d ≫ fibreHomEndpointTransport bF bG X e' d' := by
  sorry

def fibreHomEndpointTransportIso (X : HomCategory bF bG) (e : x ≅ x') (d : y ≅ y') :
    fibreHomSheaf bF bG U x y X ≅ fibreHomSheaf bF bG U x' y' X where
  hom := fibreHomEndpointTransport bF bG X e d
  inv := fibreHomEndpointTransport bF bG X e.symm d.symm
  hom_inv_id := by
    rw [← fibreHomEndpointTransport_comp]
    simpa using fibreHomEndpointTransport_id bF bG X
  inv_hom_id := by
    rw [← fibreHomEndpointTransport_comp]
    simpa using fibreHomEndpointTransport_id bF bG X

theorem fibreHomEndpointTransport_transport (X : HomCategory bF bG)
    (e : x ≅ x') (d : y ≅ y') (T : Over U)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    fibreHomTransportIsoEquiv bF bG U x' y' X T
        ((fibreHomEndpointTransport bF bG X e d).hom.app (op T) p) =
      ((G.map T.hom.op.toLoc).toFunctor.mapIso d).symm ≪≫
        fibreHomTransportIsoEquiv bF bG U x y X T p ≪≫
        (X.obj.app (.mk (op T.left))).toFunctor.mapIso
          ((F.map T.hom.op.toLoc).toFunctor.mapIso e) := by
  sorry

theorem fibreHomEndpointTransport_equivariant (X : HomCategory bF bG)
    (e : x ≅ x') (d : y ≅ y') (T : Over U)
    (a : Multiplicative (A.obj.obj (op T.left)))
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomEndpointTransport bF bG X e d).hom.app (op T)
        (((fibreHomSectionAction bF bG U x y X T).ρ a).hom p) =
      ((fibreHomSectionAction bF bG U x' y' X T).ρ a).hom
        ((fibreHomEndpointTransport bF bG X e d).hom.app (op T) p) := by
  sorry

theorem fibreHomEndpointTransport_modification {X Y : HomCategory bF bG}
    (m : X ⟶ Y) (e : x ≅ x') (d : y ≅ y') :
    fibreHomSheafMap bF bG U x y m ≫ fibreHomEndpointTransport bF bG Y e d =
      fibreHomEndpointTransport bF bG X e d ≫ fibreHomSheafMap bF bG U x' y' m := by
  sorry

noncomputable def fibreHomEndpointTransportNatIso (e : x ≅ x') (d : y ≅ y') :
    fibreHomSheafFunctor bF bG U x y ≅ fibreHomSheafFunctor bF bG U x' y' :=
  NatIso.ofComponents (fun X => fibreHomEndpointTransportIso bF bG X e d)
    (fun m => fibreHomEndpointTransport_modification bF bG m e d)

theorem fibreHomEndpointTransportNatIso_app (e : x ≅ x') (d : y ≅ y')
    (X : HomCategory bF bG) :
    (fibreHomEndpointTransportNatIso bF bG e d).app X =
      fibreHomEndpointTransportIso bF bG X e d := by
  sorry

theorem fibreHomEndpointTransportNatIso_id :
    fibreHomEndpointTransportNatIso bF bG (Iso.refl x) (Iso.refl y) = Iso.refl _ := by
  sorry

theorem fibreHomEndpointTransportNatIso_comp
    (e : x ≅ x') (e' : x' ≅ x'') (d : y ≅ y') (d' : y' ≅ y'') :
    fibreHomEndpointTransportNatIso bF bG (e ≪≫ e') (d ≪≫ d') =
      fibreHomEndpointTransportNatIso bF bG e d ≪≫
        fibreHomEndpointTransportNatIso bF bG e' d' := by
  sorry

theorem fibreHomEndpointTransportIso_hom (X : HomCategory bF bG) (e : x ≅ x') (d : y ≅ y') :
    (fibreHomEndpointTransportIso bF bG X e d).hom =
      fibreHomEndpointTransport bF bG X e d := by
  sorry

theorem fibreHomEndpointTransportIso_inv (X : HomCategory bF bG) (e : x ≅ x') (d : y ≅ y') :
    (fibreHomEndpointTransportIso bF bG X e d).inv =
      fibreHomEndpointTransport bF bG X e.symm d.symm := by
  sorry

theorem fibreHomEndpointBaseChange_square (X : HomCategory bF bG) (f : V ⟶ U)
    (e : x ≅ x') (d : y ≅ y') :
    (J.overMapPullback (Type v') f).map (fibreHomEndpointTransport bF bG X e d) ≫
        (fibreHomBaseChangeIso bF bG X f x' y').hom =
      (fibreHomBaseChangeIso bF bG X f x y).hom ≫
        fibreHomEndpointTransport bF bG X ((F.map f.op.toLoc).toFunctor.mapIso e)
          ((G.map f.op.toLoc).toFunctor.mapIso d) := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U : C} {x x' : F.obj (.mk (op U))}
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

theorem fibreHomEndpointTransportIso_self (X : HomCategory b b) (e : x ≅ x') :
    fibreHomEndpointTransportIso b b X e e = selfHomSheafTransportIso b X e := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.EndpointTransportTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable {U V : C} {x x' x'' : F.obj (.mk (op U))}
  {y y' y'' : G.obj (.mk (op U))}

-- test: EndpointTransportTests.actual_endpoint_formula
example (X : HomCategory bF bG) (e : x ≅ x') (d : y ≅ y') (T : Over U)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomEndpointTransport bF bG X e d).hom.app (op T) p =
      (G.map T.hom.op.toLoc).toFunctor.map d.inv ≫ p ≫
        (G.map T.hom.op.toLoc).toFunctor.map
          ((X.obj.app (.mk (op U))).toFunctor.map e.hom) := by
  sorry

-- test: EndpointTransportTests.arbitrary_slice_arrow
example (X : HomCategory bF bG) (e : x ≅ x') (d : y ≅ y')
    {T W : Over U} (g : W ⟶ T) :
    (fibreHomSheaf bF bG U x y X).obj.map g.op ≫
        (fibreHomEndpointTransport bF bG X e d).hom.app (op W) =
      (fibreHomEndpointTransport bF bG X e d).hom.app (op T) ≫
        (fibreHomSheaf bF bG U x' y' X).obj.map g.op := by
  sorry

-- test: EndpointTransportTests.unbalanced_endpoint_is_not_identity
example (X : HomCategory bF bG) (d : y ≅ y) (T : Over U)
    (h : (G.map T.hom.op.toLoc).toFunctor.map d.inv ≠ 𝟙 _)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomEndpointTransport bF bG X (Iso.refl x) d).hom.app (op T) p ≠ p := by
  sorry

-- test: EndpointTransportTests.empty_sections_reflected
example (X : HomCategory bF bG) (e : x ≅ x') (d : y ≅ y') (T : Over U)
    [IsEmpty ((fibreHomSheaf bF bG U x y X).obj.obj (op T))] :
    IsEmpty ((fibreHomSheaf bF bG U x' y' X).obj.obj (op T)) := by
  sorry

-- test: EndpointTransportTests.inverse_uses_both_reversed_endpoints
example (X : HomCategory bF bG) (e : x ≅ x') (d : y ≅ y') (T : Over U)
    (p : (fibreHomSheaf bF bG U x' y' X).obj.obj (op T)) :
    (fibreHomEndpointTransportIso bF bG X e d).inv.hom.app (op T) p =
      (G.map T.hom.op.toLoc).toFunctor.map d.hom ≫ p ≫
        (G.map T.hom.op.toLoc).toFunctor.map
          ((X.obj.app (.mk (op U))).toFunctor.map e.inv) := by
  sorry

-- test: EndpointTransportTests.modifications_retained
example {X Y : HomCategory bF bG} (m : X ⟶ Y) (e : x ≅ x') (d : y ≅ y') :
    (fibreHomSheafFunctor bF bG U x y).map m ≫
        (fibreHomEndpointTransportNatIso bF bG e d).hom.app Y =
      (fibreHomEndpointTransportNatIso bF bG e d).hom.app X ≫
        (fibreHomSheafFunctor bF bG U x' y').map m := by
  sorry

-- test: EndpointTransportTests.separate_endpoint_composition
example (e : x ≅ x') (e' : x' ≅ x'') (d : y ≅ y') (d' : y' ≅ y'') :
    fibreHomEndpointTransportNatIso bF bG (e ≪≫ e') (d ≪≫ d') =
      fibreHomEndpointTransportNatIso bF bG e d ≪≫
        fibreHomEndpointTransportNatIso bF bG e' d' := by
  sorry

-- test: EndpointTransportTests.native_base_restriction_square
example (X : HomCategory bF bG) (f : V ⟶ U) (e : x ≅ x') (d : y ≅ y') :
    (J.overMapPullback (Type v') f).map (fibreHomEndpointTransport bF bG X e d) ≫
        (fibreHomBaseChangeIso bF bG X f x' y').hom =
      (fibreHomBaseChangeIso bF bG X f x y).hom ≫
        fibreHomEndpointTransport bF bG X ((F.map f.op.toLoc).toFunctor.mapIso e)
          ((G.map f.op.toLoc).toFunctor.mapIso d) := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.EndpointTransportTests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.EndpointTransportTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U : C} {x x' : F.obj (.mk (op U))}
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

-- test: EndpointTransportTests.diagonal_agrees_with_native_self_transport
example (X : HomCategory b b) (e : x ≅ x') :
    fibreHomEndpointTransportIso b b X e e = selfHomSheafTransportIso b X e := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.EndpointTransportTests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 800000
set_option backward.defeqAttrib.useBackward true
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable {U V W : C}

theorem fibreHomBaseChangeIso_id (X : HomCategory bF bG)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    fibreHomBaseChangeIso bF bG X (𝟙 U) x y ≪≫
      fibreHomEndpointTransportIso bF bG X
        ((Cat.Hom.toNatIso (F.mapId (.mk (op U)))).app x)
        ((Cat.Hom.toNatIso (G.mapId (.mk (op U)))).app y) =
    (J.overMapPullbackId (Type v') U).app (fibreHomSheaf bF bG U x y X) := by
  sorry

theorem fibreHomBaseChangeIso_comp (X : HomCategory bF bG) (f : V ⟶ U) (g : W ⟶ V)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    (J.overMapPullbackComp (Type v') g f).app (fibreHomSheaf bF bG U x y X) ≪≫
      fibreHomBaseChangeIso bF bG X (g ≫ f) x y ≪≫
      fibreHomEndpointTransportIso bF bG X
        ((Cat.Hom.toNatIso (F.mapComp f.op.toLoc g.op.toLoc)).app x)
        ((Cat.Hom.toNatIso (G.mapComp f.op.toLoc g.op.toLoc)).app y) =
    (J.overMapPullback (Type v') g).mapIso (fibreHomBaseChangeIso bF bG X f x y) ≪≫
      fibreHomBaseChangeIso bF bG X g ((F.map f.op.toLoc).toFunctor.obj x)
        ((G.map f.op.toLoc).toFunctor.obj y) := by
  sorry

theorem fibreHomBaseChangeNatIso_id
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    fibreHomBaseChangeNatIso bF bG (𝟙 U) x y ≪≫
      fibreHomEndpointTransportNatIso bF bG
        ((Cat.Hom.toNatIso (F.mapId (.mk (op U)))).app x)
        ((Cat.Hom.toNatIso (G.mapId (.mk (op U)))).app y) =
    Functor.isoWhiskerLeft (fibreHomSheafFunctor bF bG U x y)
        (J.overMapPullbackId (Type v') U) ≪≫
      (fibreHomSheafFunctor bF bG U x y).rightUnitor := by
  sorry

theorem fibreHomBaseChangeNatIso_comp (f : V ⟶ U) (g : W ⟶ V)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    Functor.associator (fibreHomSheafFunctor bF bG U x y)
        (J.overMapPullback (Type v') f) (J.overMapPullback (Type v') g) ≪≫
      Functor.isoWhiskerLeft (fibreHomSheafFunctor bF bG U x y)
        (J.overMapPullbackComp (Type v') g f) ≪≫
      fibreHomBaseChangeNatIso bF bG (g ≫ f) x y ≪≫
      fibreHomEndpointTransportNatIso bF bG
        ((Cat.Hom.toNatIso (F.mapComp f.op.toLoc g.op.toLoc)).app x)
        ((Cat.Hom.toNatIso (G.mapComp f.op.toLoc g.op.toLoc)).app y) =
    Functor.isoWhiskerRight (fibreHomBaseChangeNatIso bF bG f x y)
        (J.overMapPullback (Type v') g) ≪≫
      fibreHomBaseChangeNatIso bF bG g ((F.map f.op.toLoc).toFunctor.obj x)
        ((G.map f.op.toLoc).toFunctor.obj y) := by
  sorry

theorem fibreHomBaseChangeIso_id_inv (X : HomCategory bF bG)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    (fibreHomEndpointTransportIso bF bG X
        ((Cat.Hom.toNatIso (F.mapId (.mk (op U)))).app x)
        ((Cat.Hom.toNatIso (G.mapId (.mk (op U)))).app y)).inv ≫
      (fibreHomBaseChangeIso bF bG X (𝟙 U) x y).inv =
    ((J.overMapPullbackId (Type v') U).app (fibreHomSheaf bF bG U x y X)).inv := by
  sorry

theorem fibreHomBaseChangeIso_comp_inv (X : HomCategory bF bG) (f : V ⟶ U) (g : W ⟶ V)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    (fibreHomEndpointTransportIso bF bG X
        ((Cat.Hom.toNatIso (F.mapComp f.op.toLoc g.op.toLoc)).app x)
        ((Cat.Hom.toNatIso (G.mapComp f.op.toLoc g.op.toLoc)).app y)).inv ≫
      (fibreHomBaseChangeIso bF bG X (g ≫ f) x y).inv ≫
      ((J.overMapPullbackComp (Type v') g f).app (fibreHomSheaf bF bG U x y X)).inv =
    (fibreHomBaseChangeIso bF bG X g ((F.map f.op.toLoc).toFunctor.obj x)
        ((G.map f.op.toLoc).toFunctor.obj y)).inv ≫
      (J.overMapPullback (Type v') g).map (fibreHomBaseChangeIso bF bG X f x y).inv := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GeneralBaseCoherenceTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable {U V W Z : C}

-- test: GeneralBaseCoherenceTests.unit_inverse_order
example (X : HomCategory bF bG) (x : F.obj (.mk (op U)))
    (y : G.obj (.mk (op U))) (T : Over U)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomBaseChangeIso bF bG X (𝟙 U) x y).inv.hom.app (op T)
      ((fibreHomEndpointTransportIso bF bG X
        ((Cat.Hom.toNatIso (F.mapId (.mk (op U)))).app x)
        ((Cat.Hom.toNatIso (G.mapId (.mk (op U)))).app y)).inv.hom.app (op T) p) =
    ((J.overMapPullbackId (Type v') U).app (fibreHomSheaf bF bG U x y X)).inv.hom.app
      (op T) p := by
  sorry

-- test: GeneralBaseCoherenceTests.composition_inverse_round_trip
example (X : HomCategory bF bG) (f : V ⟶ U) (g : W ⟶ V)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    ((J.overMapPullback (Type v') g).mapIso (fibreHomBaseChangeIso bF bG X f x y) ≪≫
      fibreHomBaseChangeIso bF bG X g ((F.map f.op.toLoc).toFunctor.obj x)
        ((G.map f.op.toLoc).toFunctor.obj y)).hom ≫
      (fibreHomEndpointTransportIso bF bG X
        ((Cat.Hom.toNatIso (F.mapComp f.op.toLoc g.op.toLoc)).app x)
        ((Cat.Hom.toNatIso (G.mapComp f.op.toLoc g.op.toLoc)).app y)).inv ≫
      (fibreHomBaseChangeIso bF bG X (g ≫ f) x y).inv ≫
      ((J.overMapPullbackComp (Type v') g f).app (fibreHomSheaf bF bG U x y X)).inv =
    𝟙 _ := by
  sorry

-- test: GeneralBaseCoherenceTests.iterated_modifications
example {X Y : HomCategory bF bG} (m : X ⟶ Y) (f : V ⟶ U) (g : W ⟶ V)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    ((fibreHomSheafFunctor bF bG U x y ⋙ J.overMapPullback (Type v') f) ⋙
      J.overMapPullback (Type v') g).map m ≫
      ((Functor.isoWhiskerRight (fibreHomBaseChangeNatIso bF bG f x y)
        (J.overMapPullback (Type v') g) ≪≫
        fibreHomBaseChangeNatIso bF bG g ((F.map f.op.toLoc).toFunctor.obj x)
          ((G.map f.op.toLoc).toFunctor.obj y)).hom.app Y) =
    ((Functor.isoWhiskerRight (fibreHomBaseChangeNatIso bF bG f x y)
        (J.overMapPullback (Type v') g) ≪≫
        fibreHomBaseChangeNatIso bF bG g ((F.map f.op.toLoc).toFunctor.obj x)
          ((G.map f.op.toLoc).toFunctor.obj y)).hom.app X) ≫
      (fibreHomSheafFunctor bF bG W
        ((F.map g.op.toLoc).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj x))
        ((G.map g.op.toLoc).toFunctor.obj ((G.map f.op.toLoc).toFunctor.obj y))).map m := by
  sorry

-- test: GeneralBaseCoherenceTests.same_actual_coefficient
example (X : HomCategory bF bG) (f : V ⟶ U) (g : W ⟶ V)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) (T : Over W)
    (a : Multiplicative (A.obj.obj (op T.left)))
    (p : (fibreHomSheaf bF bG U x y X).obj.obj
      (op ((Over.map f).obj ((Over.map g).obj T)))) :
    (fibreHomBaseChangeIso bF bG X g ((F.map f.op.toLoc).toFunctor.obj x)
      ((G.map f.op.toLoc).toFunctor.obj y)).hom.hom.app (op T)
      ((fibreHomBaseChangeIso bF bG X f x y).hom.hom.app (op ((Over.map g).obj T))
        (((fibreHomSectionAction bF bG U x y X
          ((Over.map f).obj ((Over.map g).obj T))).ρ a).hom p)) =
    ((fibreHomSectionAction bF bG W
      ((F.map g.op.toLoc).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj x))
      ((G.map g.op.toLoc).toFunctor.obj ((G.map f.op.toLoc).toFunctor.obj y)) X T).ρ a).hom
      ((fibreHomBaseChangeIso bF bG X g ((F.map f.op.toLoc).toFunctor.obj x)
        ((G.map f.op.toLoc).toFunctor.obj y)).hom.hom.app (op T)
        ((fibreHomBaseChangeIso bF bG X f x y).hom.hom.app (op ((Over.map g).obj T)) p)) := by
  sorry

-- test: GeneralBaseCoherenceTests.third_pullback_stability
example (X : HomCategory bF bG) (f : V ⟶ U) (g : W ⟶ V) (h : Z ⟶ W)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    (J.overMapPullback (Type v') h).mapIso
      ((J.overMapPullbackComp (Type v') g f).app (fibreHomSheaf bF bG U x y X) ≪≫
        fibreHomBaseChangeIso bF bG X (g ≫ f) x y ≪≫
        fibreHomEndpointTransportIso bF bG X
          ((Cat.Hom.toNatIso (F.mapComp f.op.toLoc g.op.toLoc)).app x)
          ((Cat.Hom.toNatIso (G.mapComp f.op.toLoc g.op.toLoc)).app y)) =
    (J.overMapPullback (Type v') h).mapIso
      ((J.overMapPullback (Type v') g).mapIso (fibreHomBaseChangeIso bF bG X f x y) ≪≫
        fibreHomBaseChangeIso bF bG X g ((F.map f.op.toLoc).toFunctor.obj x)
          ((G.map f.op.toLoc).toFunctor.obj y)) := by
  sorry

-- test: GeneralBaseCoherenceTests.unbalanced_unit_endpoint
example (X : HomCategory bF bG) (x : F.obj (.mk (op U)))
    (y : G.obj (.mk (op U))) (d : y ≅ y) (T : Over U)
    (h : (G.map T.hom.op.toLoc).toFunctor.map d.inv ≠ 𝟙 _)
    (p : ((J.overMapPullback (Type v') (𝟙 U)).obj
      (fibreHomSheaf bF bG U x y X)).obj.obj (op T)) :
    let q := ((fibreHomBaseChangeIso bF bG X (𝟙 U) x y ≪≫
      fibreHomEndpointTransportIso bF bG X
        ((Cat.Hom.toNatIso (F.mapId (.mk (op U)))).app x)
        ((Cat.Hom.toNatIso (G.mapId (.mk (op U)))).app y)).hom.hom.app (op T) p)
    (fibreHomEndpointTransport bF bG X (Iso.refl x) d).hom.app (op T) q ≠
      ((J.overMapPullbackId (Type v') U).app (fibreHomSheaf bF bG U x y X)).hom.hom.app
        (op T) p := by
  sorry

-- test: GeneralBaseCoherenceTests.empty_iterated_sections
example (X : HomCategory bF bG) (f : V ⟶ U) (g : W ⟶ V)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) (T : Over W)
    [IsEmpty ((fibreHomSheaf bF bG U x y X).obj.obj
      (op ((Over.map f).obj ((Over.map g).obj T))))] :
    IsEmpty ((fibreHomSheaf bF bG W
      ((F.map g.op.toLoc).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj x))
      ((G.map g.op.toLoc).toFunctor.obj ((G.map f.op.toLoc).toFunctor.obj y)) X).obj.obj (op T)) := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GeneralBaseCoherenceTests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GeneralBaseCoherenceTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A) {U V W : C}
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)
-- test: GeneralBaseCoherenceTests.diagonal_composition
example (X : HomCategory b b) (f : V ⟶ U) (g : W ⟶ V)
    (x : F.obj (.mk (op U))) :
    (J.overMapPullbackComp (Type v') g f).app (fibreHomSheaf b b U x x X) ≪≫
      fibreHomBaseChangeIso b b X (g ≫ f) x x ≪≫
      selfHomSheafTransportIso b X
        ((Cat.Hom.toNatIso (F.mapComp f.op.toLoc g.op.toLoc)).app x) =
    (J.overMapPullback (Type v') g).mapIso (fibreHomBaseChangeIso b b X f x x) ≪≫
      fibreHomBaseChangeIso b b X g ((F.map f.op.toLoc).toFunctor.obj x)
        ((F.map f.op.toLoc).toFunctor.obj x) := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GeneralBaseCoherenceTests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeLocalCovers

variable {C : Type u} [Category.{v} C]
    (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
    {J : GrothendieckTopology C} {U V W T S : C}

/-- The sieve of arrows into U whose domain fibre has an object. -/
def objectCover (U : C) : Sieve U where
  arrows := fun {V} _ => Nonempty (F.obj (.mk (op V)))
  downward_closed := by
    rintro V W f ⟨x⟩ g
    exact ⟨(F.map g.op.toLoc).toFunctor.obj x⟩

theorem objectCover_mem (f : V ⟶ U) :
    objectCover F U f ↔ Nonempty (F.obj (.mk (op V))) := by
  sorry

theorem objectCover_pullback (f : V ⟶ U) :
    (objectCover F U).pullback f = objectCover F V := by
  sorry

theorem objectCover_covering [IsGerbe F J] (U : C) : objectCover F U ∈ J U := by
  sorry

theorem objectCover_refinement_covering [IsGerbe F J] (R : Sieve U) (hR : R ∈ J U) :
    R ⊓ objectCover F U ∈ J U := by
  sorry

theorem objectCover_identity_empty [IsEmpty (F.obj (.mk (op U)))] :
    ¬ objectCover F U (𝟙 U) := by
  sorry

/-- The locally-isomorphic locus; mapComp transports direct restrictions. -/
def isomCover {U : C} (x y : F.obj (.mk (op U))) : Sieve U where
  arrows := fun {V} f => Nonempty ((F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
  downward_closed := by
    rintro V W f ⟨e⟩ g
    let c := Cat.Hom.toNatIso (F.mapComp f.op.toLoc g.op.toLoc)
    exact ⟨c.app x ≪≫ (F.map g.op.toLoc).toFunctor.mapIso e ≪≫ (c.app y).symm⟩

theorem isomCover_mem (x y : F.obj (.mk (op U))) (f : V ⟶ U) :
    isomCover F x y f ↔ Nonempty ((F.map f.op.toLoc).toFunctor.obj x ≅
      (F.map f.op.toLoc).toFunctor.obj y) := by
  sorry

theorem isomCover_covering [IsGerbe F J] (x y : F.obj (.mk (op U))) :
    isomCover F x y ∈ J U := by
  sorry

theorem isomCover_symm (x y : F.obj (.mk (op U))) :
    isomCover F x y = isomCover F y x := by
  sorry

theorem isomCover_refl (x : F.obj (.mk (op U))) : isomCover F x x = ⊤ := by
  sorry

theorem isomCover_pullback (x y : F.obj (.mk (op U))) (f : V ⟶ U) :
    (isomCover F x y).pullback f =
      isomCover F ((F.map f.op.toLoc).toFunctor.obj x)
        ((F.map f.op.toLoc).toFunctor.obj y) := by
  sorry

theorem isomCover_refinement_covering [IsGerbe F J]
    (x y : F.obj (.mk (op U))) (R : Sieve U) (hR : R ∈ J U) :
    R ⊓ isomCover F x y ∈ J U := by
  sorry

/-- Compare two local objects on an arbitrary common refinement T. -/
def overlapCover (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W))) : Sieve T :=
  isomCover F ((F.map i.op.toLoc).toFunctor.obj x)
    ((F.map j.op.toLoc).toFunctor.obj y)

theorem overlapCover_mem (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W))) (q : S ⟶ T) :
    overlapCover F i j x y q ↔
      Nonempty ((F.map q.op.toLoc).toFunctor.obj ((F.map i.op.toLoc).toFunctor.obj x) ≅
        (F.map q.op.toLoc).toFunctor.obj ((F.map j.op.toLoc).toFunctor.obj y)) := by
  sorry

theorem overlapCover_covering [IsGerbe F J] (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W))) :
    overlapCover F i j x y ∈ J T := by
  sorry

theorem overlapCover_swap (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W))) :
    overlapCover F i j x y = overlapCover F j i y x := by
  sorry

theorem overlapCover_pullback_covering [IsGerbe F J] (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W))) (q : S ⟶ T) :
    (overlapCover F i j x y).pullback q ∈ J S := by
  sorry

/-- Choose an overlap isomorphism, with both composition comparisons. -/
noncomputable def overlapIso (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W)))
    (q : S ⟶ T) (h : overlapCover F i j x y q) :
    (F.map (q ≫ i).op.toLoc).toFunctor.obj x ≅
      (F.map (q ≫ j).op.toLoc).toFunctor.obj y :=
  (Cat.Hom.toNatIso (F.mapComp i.op.toLoc q.op.toLoc)).app x ≪≫
    Classical.choice h ≪≫
      ((Cat.Hom.toNatIso (F.mapComp j.op.toLoc q.op.toLoc)).app y).symm

theorem overlapIso_hom (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W)))
    (q : S ⟶ T) (h : overlapCover F i j x y q) :
    (overlapIso F i j x y q h).hom =
      ((Cat.Hom.toNatIso (F.mapComp i.op.toLoc q.op.toLoc)).app x).hom ≫
        (Classical.choice h).hom ≫
          ((Cat.Hom.toNatIso (F.mapComp j.op.toLoc q.op.toLoc)).app y).inv := by
  sorry

theorem overlapIso_inv (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W)))
    (q : S ⟶ T) (h : overlapCover F i j x y q) :
    (overlapIso F i j x y q h).inv =
      ((Cat.Hom.toNatIso (F.mapComp j.op.toLoc q.op.toLoc)).app y).hom ≫
        (Classical.choice h).inv ≫
          ((Cat.Hom.toNatIso (F.mapComp i.op.toLoc q.op.toLoc)).app x).inv := by
  sorry

theorem overlapIso_hom_inv (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W)))
    (q : S ⟶ T) (h : overlapCover F i j x y q) :
    (overlapIso F i j x y q h).hom ≫ (overlapIso F i j x y q h).inv = 𝟙 _ := by
  sorry

theorem overlapIso_inv_hom (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W)))
    (q : S ⟶ T) (h : overlapCover F i j x y q) :
    (overlapIso F i j x y q h).inv ≫ (overlapIso F i j x y q h).hom = 𝟙 _ := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeLocalCovers

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.LocalCoverTests
open GerbeLocalCovers
variable {C : Type u} [Category.{v} C]
    (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
    {J : GrothendieckTopology C} {U V W T S R : C}

-- test: LocalCoverTests.object_refined_member
example [IsGerbe F J] (D : Sieve U) (hD : D ∈ J U)
    (f : V ⟶ U) (h : (D ⊓ objectCover F U) f) :
    D ⊓ objectCover F U ∈ J U ∧ Nonempty (F.obj (.mk (op V))) := by
  sorry

-- test: LocalCoverTests.object_empty_global_fibre
example [IsGerbe F J] [IsEmpty (F.obj (.mk (op U)))] :
    objectCover F U ∈ J U ∧ ¬ objectCover F U (𝟙 U) := by
  sorry

-- test: LocalCoverTests.object_iterated_restriction
example (f : V ⟶ U) (g : W ⟶ V) :
    ((objectCover F U).pullback f).pullback g = objectCover F W := by
  sorry

-- test: LocalCoverTests.constant_empty_objects
example :
    let F := ((Functor.const (Discrete PUnit)ᵒᵖ).obj (Cat.of (Discrete PEmpty))).toPseudofunctor'
    objectCover F (Discrete.mk PUnit.unit) = ⊥ := by
  sorry

-- test: LocalCoverTests.constant_inhabited_objects
example :
    let F := ((Functor.const (Discrete PUnit)ᵒᵖ).obj (Cat.of (Discrete Bool))).toPseudofunctor'
    objectCover F (Discrete.mk PUnit.unit) = ⊤ := by
  sorry

-- test: LocalCoverTests.distinct_discrete_objects
example :
    let F := ((Functor.const (Discrete PUnit)ᵒᵖ).obj (Cat.of (Discrete Bool))).toPseudofunctor'
    isomCover F (U := Discrete.mk PUnit.unit) (Discrete.mk false) (Discrete.mk true) = ⊥ := by
  sorry

-- test: LocalCoverTests.equal_discrete_objects
example :
    let F := ((Functor.const (Discrete PUnit)ᵒᵖ).obj (Cat.of (Discrete Bool))).toPseudofunctor'
    isomCover F (U := Discrete.mk PUnit.unit) (Discrete.mk false) (Discrete.mk false) = ⊤ := by
  sorry

-- test: LocalCoverTests.isom_iterated_refinement
example [IsGerbe F J] (x y : F.obj (.mk (op U)))
    (f : V ⟶ U) (g : W ⟶ V) :
    ((isomCover F x y).pullback f).pullback g ∈ J W := by
  sorry

-- test: LocalCoverTests.isom_native_comparison
example (x y : F.obj (.mk (op U))) (f : V ⟶ U) (g : W ⟶ V)
    (h : isomCover F ((F.map f.op.toLoc).toFunctor.obj x)
      ((F.map f.op.toLoc).toFunctor.obj y) g) :
    Nonempty ((F.map (g ≫ f).op.toLoc).toFunctor.obj x ≅
      (F.map (g ≫ f).op.toLoc).toFunctor.obj y) := by
  sorry

-- test: LocalCoverTests.isom_common_cover
example [IsGerbe F J] (x y : F.obj (.mk (op U)))
    (D : Sieve U) (hD : D ∈ J U) : D ⊓ isomCover F x y ∈ J U := by
  sorry

-- test: LocalCoverTests.overlap_member_maximal_pullback
example (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W)))
    (q : S ⟶ T) (h : overlapCover F i j x y q) :
    (overlapCover F i j x y).pullback q = ⊤ := by
  sorry

-- test: LocalCoverTests.overlap_swap_refinement
example (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W))) (q : S ⟶ T) :
    (overlapCover F i j x y).pullback q = (overlapCover F j i y x).pullback q := by
  sorry

-- test: LocalCoverTests.overlap_further_cover
example [IsGerbe F J] (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W)))
    (q : S ⟶ T) (D : Sieve S) (hD : D ∈ J S) :
    D ⊓ (overlapCover F i j x y).pullback q ∈ J S := by
  sorry

-- test: LocalCoverTests.overlap_direct_endpoints
example (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W)))
    (q : S ⟶ T) (h : overlapCover F i j x y q) :
    Nonempty ((F.map (q ≫ i).op.toLoc).toFunctor.obj x ≅
      (F.map (q ≫ j).op.toLoc).toFunctor.obj y) := by
  sorry

-- test: LocalCoverTests.overlap_iso_round_trip
example (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W)))
    (q : S ⟶ T) (h : overlapCover F i j x y q)
    (z : F.obj (.mk (op S))) (a : z ⟶ (F.map (q ≫ i).op.toLoc).toFunctor.obj x) :
    (a ≫ (overlapIso F i j x y q h).hom) ≫ (overlapIso F i j x y q h).inv = a := by
  sorry

-- test: LocalCoverTests.overlap_iso_inverse_round_trip
example (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W)))
    (q : S ⟶ T) (h : overlapCover F i j x y q)
    (z : F.obj (.mk (op S))) (a : z ⟶ (F.map (q ≫ j).op.toLoc).toFunctor.obj y) :
    (a ≫ (overlapIso F i j x y q h).inv) ≫ (overlapIso F i j x y q h).hom = a := by
  sorry

-- test: LocalCoverTests.overlap_iso_restriction
example (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W)))
    (q : S ⟶ T) (h : overlapCover F i j x y q) (r : R ⟶ S) :
    ((F.map r.op.toLoc).toFunctor.mapIso (overlapIso F i j x y q h)).hom ≫
      ((F.map r.op.toLoc).toFunctor.mapIso (overlapIso F i j x y q h)).inv = 𝟙 _ := by
  sorry

-- test: LocalCoverTests.overlap_same_base_path
example (f : V ⟶ U) (g : W ⟶ U) (i : T ⟶ V) (j : T ⟶ W)
    (hs : i ≫ f = j ≫ g) (q : S ⟶ T) : (q ≫ i) ≫ f = (q ≫ j) ≫ g := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.LocalCoverTests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U V W T S : C}
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

noncomputable def selfHomChartTransition (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y) :
    fibreHomSheafFunctor b b U x x ⋙ J.overMapPullback (Type v') i ≅
      fibreHomSheafFunctor b b V y y ⋙ J.overMapPullback (Type v') j :=
  fibreHomBaseChangeNatIso b b i x x ≪≫ selfHomSheafTransportNatIso b e ≪≫
    (fibreHomBaseChangeNatIso b b j y y).symm

theorem selfHomChartTransition_app (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y)
    (X : HomCategory b b) :
    (selfHomChartTransition b i j x y e).app X =
      fibreHomBaseChangeIso b b X i x x ≪≫ selfHomSheafTransportIso b X e ≪≫
        (fibreHomBaseChangeIso b b X j y y).symm := by
  sorry

theorem selfHomChartTransition_equivariant (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y)
    (X : HomCategory b b) (R : Over T) (a : Multiplicative (A.obj.obj (op R.left)))
    (p : (fibreHomSheaf b b U x x X).obj.obj (op ((Over.map i).obj R))) :
    ((selfHomChartTransition b i j x y e).app X).hom.hom.app (op R)
        (((fibreHomSectionAction b b U x x X ((Over.map i).obj R)).ρ a).hom p) =
      ((fibreHomSectionAction b b V y y X ((Over.map j).obj R)).ρ a).hom
        (((selfHomChartTransition b i j x y e).app X).hom.hom.app (op R) p) := by
  sorry

theorem selfHomChartTransition_independent (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (e d : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y) :
    selfHomChartTransition b i j x y e = selfHomChartTransition b i j x y d := by
  sorry

theorem selfHomChartTransition_refl (i : T ⟶ U) (x : F.obj (.mk (op U)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map i.op.toLoc).toFunctor.obj x) :
    selfHomChartTransition b i i x x e = Iso.refl _ := by
  sorry

theorem selfHomChartTransition_cocycle (i : T ⟶ U) (j : T ⟶ V) (k : T ⟶ W)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V))) (z : F.obj (.mk (op W)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y)
    (d : (F.map j.op.toLoc).toFunctor.obj y ≅ (F.map k.op.toLoc).toFunctor.obj z)
    (a : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map k.op.toLoc).toFunctor.obj z) :
    selfHomChartTransition b i j x y e ≪≫ selfHomChartTransition b j k y z d =
      selfHomChartTransition b i k x z a := by
  sorry

theorem selfHomChartTransition_symm (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y)
    (d : (F.map j.op.toLoc).toFunctor.obj y ≅ (F.map i.op.toLoc).toFunctor.obj x) :
    (selfHomChartTransition b i j x y e).symm = selfHomChartTransition b j i y x d := by
  sorry

theorem selfHomChartTransition_naturality (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y)
    {X Y : HomCategory b b} (m : X ⟶ Y) :
    (J.overMapPullback (Type v') i).map (fibreHomSheafMap b b U x x m) ≫
        (selfHomChartTransition b i j x y e).hom.app Y =
      (selfHomChartTransition b i j x y e).hom.app X ≫
        (J.overMapPullback (Type v') j).map (fibreHomSheafMap b b V y y m) := by
  sorry

noncomputable def selfHomOverlapTransition (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (q : S ⟶ T) (h : GerbeLocalCovers.overlapCover F i j x y q) :
    fibreHomSheafFunctor b b U x x ⋙ J.overMapPullback (Type v') (q ≫ i) ≅
      fibreHomSheafFunctor b b V y y ⋙ J.overMapPullback (Type v') (q ≫ j) :=
  selfHomChartTransition b (q ≫ i) (q ≫ j) x y
    (GerbeLocalCovers.overlapIso F i j x y q h)

theorem selfHomOverlapTransition_eq (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (q : S ⟶ T) (h : GerbeLocalCovers.overlapCover F i j x y q)
    (e : (F.map (q ≫ i).op.toLoc).toFunctor.obj x ≅
      (F.map (q ≫ j).op.toLoc).toFunctor.obj y) :
    selfHomOverlapTransition b i j x y q h =
      selfHomChartTransition b (q ≫ i) (q ≫ j) x y e := by
  sorry

theorem selfHomOverlapTransition_refl (i : T ⟶ U) (x : F.obj (.mk (op U)))
    (q : S ⟶ T) (h : GerbeLocalCovers.overlapCover F i i x x q) :
    selfHomOverlapTransition b i i x x q h = Iso.refl _ := by
  sorry

theorem selfHomOverlapTransition_cocycle (i : T ⟶ U) (j : T ⟶ V) (k : T ⟶ W)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V))) (z : F.obj (.mk (op W)))
    (q : S ⟶ T) (hxy : GerbeLocalCovers.overlapCover F i j x y q)
    (hyz : GerbeLocalCovers.overlapCover F j k y z q)
    (hxz : GerbeLocalCovers.overlapCover F i k x z q) :
    selfHomOverlapTransition b i j x y q hxy ≪≫
        selfHomOverlapTransition b j k y z q hyz =
      selfHomOverlapTransition b i k x z q hxz := by
  sorry

theorem selfHomOverlapTransition_symm (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (q : S ⟶ T) (hxy : GerbeLocalCovers.overlapCover F i j x y q)
    (hyx : GerbeLocalCovers.overlapCover F j i y x q) :
    (selfHomOverlapTransition b i j x y q hxy).symm =
      selfHomOverlapTransition b j i y x q hyx := by
  sorry

theorem selfHomOverlapTransition_common_cover (i : T ⟶ U) (j : T ⟶ V) (k : T ⟶ W)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V))) (z : F.obj (.mk (op W)))
    (D : Sieve T) (hD : D ∈ J T) :
    D ⊓ GerbeLocalCovers.overlapCover F i j x y ⊓
      GerbeLocalCovers.overlapCover F j k y z ⊓
        GerbeLocalCovers.overlapCover F i k x z ∈ J T := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.ChartTransitionTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A) {U V W Z T S R : C}
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

-- test: ChartTransitionTests.nonidentity_loop
example (i : T ⟶ U) (x : F.obj (.mk (op U)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map i.op.toLoc).toFunctor.obj x)
    (he : e ≠ Iso.refl _) :
    e ≠ Iso.refl _ ∧ selfHomChartTransition b i i x x e = Iso.refl _ := by
  sorry

-- test: ChartTransitionTests.independent_inverse
example (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y)
    (d : (F.map j.op.toLoc).toFunctor.obj y ≅ (F.map i.op.toLoc).toFunctor.obj x)
    (X : HomCategory b b) :
    ((selfHomChartTransition b i j x y e).app X).hom ≫
      ((selfHomChartTransition b j i y x d).app X).hom = 𝟙 _ := by
  sorry

-- test: ChartTransitionTests.empty_sections
example (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y)
    (X : HomCategory b b) (R : Over T)
    [IsEmpty (((J.overMapPullback (Type v') i).obj (fibreHomSheaf b b U x x X)).obj.obj (op R))] :
    IsEmpty (((J.overMapPullback (Type v') j).obj (fibreHomSheaf b b V y y X)).obj.obj (op R)) := by
  sorry

-- test: ChartTransitionTests.four_charts
example (i : T ⟶ U) (j : T ⟶ V) (k : T ⟶ W) (l : T ⟶ Z)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (z : F.obj (.mk (op W))) (t : F.obj (.mk (op Z)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y)
    (d : (F.map j.op.toLoc).toFunctor.obj y ≅ (F.map k.op.toLoc).toFunctor.obj z)
    (a : (F.map k.op.toLoc).toFunctor.obj z ≅ (F.map l.op.toLoc).toFunctor.obj t)
    (c : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map l.op.toLoc).toFunctor.obj t) :
    (selfHomChartTransition b i j x y e ≪≫ selfHomChartTransition b j k y z d) ≪≫
      selfHomChartTransition b k l z t a = selfHomChartTransition b i l x t c := by
  sorry

-- test: ChartTransitionTests.covered_triple
example (i : T ⟶ U) (j : T ⟶ V) (k : T ⟶ W)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V))) (z : F.obj (.mk (op W)))
    (D : Sieve T) (hD : D ∈ J T) (q : S ⟶ T)
    (h : (D ⊓ GerbeLocalCovers.overlapCover F i j x y ⊓
      GerbeLocalCovers.overlapCover F j k y z ⊓ GerbeLocalCovers.overlapCover F i k x z) q) :
    D q ∧ selfHomOverlapTransition b i j x y q h.1.1.2 ≪≫
      selfHomOverlapTransition b j k y z q h.1.2 =
        selfHomOverlapTransition b i k x z q h.2 ∧
      D ⊓ GerbeLocalCovers.overlapCover F i j x y ⊓
        GerbeLocalCovers.overlapCover F j k y z ⊓ GerbeLocalCovers.overlapCover F i k x z ∈ J T := by
  sorry

-- test: ChartTransitionTests.chosen_versus_supplied
example (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (q : S ⟶ T) (h : GerbeLocalCovers.overlapCover F i j x y q)
    (e : (F.map (q ≫ i).op.toLoc).toFunctor.obj x ≅ (F.map (q ≫ j).op.toLoc).toFunctor.obj y)
    (X : HomCategory b b) :
    (selfHomOverlapTransition b i j x y q h).app X =
      fibreHomBaseChangeIso b b X (q ≫ i) x x ≪≫ selfHomSheafTransportIso b X e ≪≫
        (fibreHomBaseChangeIso b b X (q ≫ j) y y).symm := by
  sorry

-- test: ChartTransitionTests.overlap_coefficient
example (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (q : S ⟶ T) (h : GerbeLocalCovers.overlapCover F i j x y q)
    (X : HomCategory b b) (R : Over S) (a : Multiplicative (A.obj.obj (op R.left)))
    (p : (fibreHomSheaf b b U x x X).obj.obj (op ((Over.map (q ≫ i)).obj R))) :
    ((selfHomOverlapTransition b i j x y q h).app X).hom.hom.app (op R)
        (((fibreHomSectionAction b b U x x X ((Over.map (q ≫ i)).obj R)).ρ a).hom p) =
      ((fibreHomSectionAction b b V y y X ((Over.map (q ≫ j)).obj R)).ρ a).hom
        (((selfHomOverlapTransition b i j x y q h).app X).hom.hom.app (op R) p) := by
  sorry

-- test: ChartTransitionTests.modifications_on_overlap
example (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (q : S ⟶ T) (h : GerbeLocalCovers.overlapCover F i j x y q)
    {X Y Z : HomCategory b b} (m : X ⟶ Y) (n : Y ⟶ Z) :
    (J.overMapPullback (Type v') (q ≫ i)).map (fibreHomSheafMap b b U x x (m ≫ n)) ≫
        (selfHomOverlapTransition b i j x y q h).hom.app Z =
      (selfHomOverlapTransition b i j x y q h).hom.app X ≫
        (J.overMapPullback (Type v') (q ≫ j)).map (fibreHomSheafMap b b V y y (m ≫ n)) := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.ChartTransitionTests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 800000
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U V W T S R : C}
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

theorem selfHomSheafTransportIso_baseChange (X : HomCategory b b) (q : S ⟶ T)
    {x y : F.obj (.mk (op T))} (e : x ≅ y) :
    (J.overMapPullback (Type v') q).mapIso (selfHomSheafTransportIso b X e) ≪≫
        fibreHomBaseChangeIso b b X q y y =
      fibreHomBaseChangeIso b b X q x x ≪≫
        selfHomSheafTransportIso b X ((F.map q.op.toLoc).toFunctor.mapIso e) := by
  sorry

theorem selfHomChartTransition_pullback (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y)
    (q : S ⟶ T)
    (d : (F.map (q ≫ i).op.toLoc).toFunctor.obj x ≅
      (F.map (q ≫ j).op.toLoc).toFunctor.obj y) (X : HomCategory b b) :
    (J.overMapPullback (Type v') q).mapIso ((selfHomChartTransition b i j x y e).app X) ≪≫
        (J.overMapPullbackComp (Type v') q j).app (fibreHomSheaf b b V y y X) =
      (J.overMapPullbackComp (Type v') q i).app (fibreHomSheaf b b U x x X) ≪≫
        (selfHomChartTransition b (q ≫ i) (q ≫ j) x y d).app X := by
  sorry

noncomputable def selfHomChartRefinement (i : T ⟶ U) (q : S ⟶ T)
    (x : F.obj (.mk (op U))) :
    (fibreHomSheafFunctor b b U x x ⋙ J.overMapPullback (Type v') i) ⋙
        J.overMapPullback (Type v') q ≅
      fibreHomSheafFunctor b b U x x ⋙ J.overMapPullback (Type v') (q ≫ i) :=
  Functor.associator _ _ _ ≪≫ Functor.isoWhiskerLeft (fibreHomSheafFunctor b b U x x)
    (J.overMapPullbackComp (Type v') q i)

theorem selfHomChartRefinement_app (i : T ⟶ U) (q : S ⟶ T)
    (x : F.obj (.mk (op U))) (X : HomCategory b b) :
    (selfHomChartRefinement b i q x).app X =
      (J.overMapPullbackComp (Type v') q i).app (fibreHomSheaf b b U x x X) := by
  sorry

theorem selfHomChartRefinement_hom (i : T ⟶ U) (q : S ⟶ T)
    (x : F.obj (.mk (op U))) (X : HomCategory b b) :
    (selfHomChartRefinement b i q x).hom.app X =
      ((J.overMapPullbackComp (Type v') q i).app (fibreHomSheaf b b U x x X)).hom := by
  sorry

theorem selfHomChartRefinement_inv (i : T ⟶ U) (q : S ⟶ T)
    (x : F.obj (.mk (op U))) (X : HomCategory b b) :
    (selfHomChartRefinement b i q x).inv.app X =
      ((J.overMapPullbackComp (Type v') q i).app (fibreHomSheaf b b U x x X)).inv := by
  sorry

theorem selfHomChartTransition_pullbackNatIso (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y)
    (q : S ⟶ T)
    (d : (F.map (q ≫ i).op.toLoc).toFunctor.obj x ≅
      (F.map (q ≫ j).op.toLoc).toFunctor.obj y) :
    Functor.isoWhiskerRight (selfHomChartTransition b i j x y e)
        (J.overMapPullback (Type v') q) ≪≫ selfHomChartRefinement b j q y =
      selfHomChartRefinement b i q x ≪≫ selfHomChartTransition b (q ≫ i) (q ≫ j) x y d := by
  sorry

theorem selfHomChartTransition_pullback_inverse (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y)
    (q : S ⟶ T)
    (d : (F.map (q ≫ i).op.toLoc).toFunctor.obj x ≅
      (F.map (q ≫ j).op.toLoc).toFunctor.obj y) :
    (selfHomChartRefinement b j q y).symm ≪≫
        (Functor.isoWhiskerRight (selfHomChartTransition b i j x y e)
          (J.overMapPullback (Type v') q)).symm =
      (selfHomChartTransition b (q ≫ i) (q ≫ j) x y d).symm ≪≫
        (selfHomChartRefinement b i q x).symm := by
  sorry

theorem selfHomChartTransition_pullback_section (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y)
    (q : S ⟶ T)
    (d : (F.map (q ≫ i).op.toLoc).toFunctor.obj x ≅
      (F.map (q ≫ j).op.toLoc).toFunctor.obj y)
    (X : HomCategory b b) (L : Over S)
    (p : (((J.overMapPullback (Type v') q).obj
      ((J.overMapPullback (Type v') i).obj (fibreHomSheaf b b U x x X))).obj.obj (op L))) :
    ((selfHomChartRefinement b j q y).hom.app X).hom.app (op L)
        (((selfHomChartTransition b i j x y e).hom.app X).hom.app
          (op ((Over.map q).obj L)) p) =
      ((selfHomChartTransition b (q ≫ i) (q ≫ j) x y d).hom.app X).hom.app (op L)
        (((selfHomChartRefinement b i q x).hom.app X).hom.app (op L) p) := by
  sorry

theorem selfHomOverlapTransition_refined_cover (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (q : S ⟶ T) (h : GerbeLocalCovers.overlapCover F i j x y q) :
    GerbeLocalCovers.overlapCover F (q ≫ i) (q ≫ j) x y = ⊤ := by
  sorry

theorem selfHomOverlapTransition_refinement (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (q : S ⟶ T) (h : GerbeLocalCovers.overlapCover F i j x y q)
    (r : R ⟶ S) (hr : GerbeLocalCovers.overlapCover F (q ≫ i) (q ≫ j) x y r) :
    Functor.isoWhiskerRight (selfHomOverlapTransition b i j x y q h)
        (J.overMapPullback (Type v') r) ≪≫ selfHomChartRefinement b (q ≫ j) r y =
      selfHomChartRefinement b (q ≫ i) r x ≪≫
        selfHomOverlapTransition b (q ≫ i) (q ≫ j) x y r hr := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.ChartRefinementTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U V W T S R : C}
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

-- test: ChartRefinementTests.native_inverse
example (i : T ⟶ U) (q : S ⟶ T) (x : F.obj (.mk (op U)))
    (X : HomCategory b b) :
    (selfHomChartRefinement b i q x).hom.app X ≫
        (selfHomChartRefinement b i q x).inv.app X = 𝟙 _ ∧
      (selfHomChartRefinement b i q x).inv.app X =
        ((J.overMapPullbackComp (Type v') q i).app (fibreHomSheaf b b U x x X)).inv := by
  sorry

-- test: ChartRefinementTests.empty_sections
example (i : T ⟶ U) (q : S ⟶ T) (x : F.obj (.mk (op U)))
    (X : HomCategory b b) (L : Over S)
    [IsEmpty (((J.overMapPullback (Type v') q).obj
      ((J.overMapPullback (Type v') i).obj (fibreHomSheaf b b U x x X))).obj.obj (op L))] :
    IsEmpty (((J.overMapPullback (Type v') (q ≫ i)).obj
      (fibreHomSheaf b b U x x X)).obj.obj (op L)) := by
  sorry

-- test: ChartRefinementTests.arbitrary_section
example (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y)
    (q : S ⟶ T)
    (d : (F.map (q ≫ i).op.toLoc).toFunctor.obj x ≅
      (F.map (q ≫ j).op.toLoc).toFunctor.obj y)
    (X : HomCategory b b) (L : Over S)
    (p : (((J.overMapPullback (Type v') q).obj
      ((J.overMapPullback (Type v') i).obj (fibreHomSheaf b b U x x X))).obj.obj (op L))) :
    ((selfHomChartRefinement b j q y).hom.app X).hom.app (op L)
        (((selfHomChartTransition b i j x y e).hom.app X).hom.app
          (op ((Over.map q).obj L)) p) =
      ((selfHomChartTransition b (q ≫ i) (q ≫ j) x y d).hom.app X).hom.app (op L)
        (((selfHomChartRefinement b i q x).hom.app X).hom.app (op L) p) := by
  sorry

-- test: ChartRefinementTests.independent_choice
example (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y)
    (q : S ⟶ T)
    (d a : (F.map (q ≫ i).op.toLoc).toFunctor.obj x ≅
      (F.map (q ≫ j).op.toLoc).toFunctor.obj y) (h : d ≠ a) :
    d ≠ a ∧ (Functor.isoWhiskerRight (selfHomChartTransition b i j x y e)
      (J.overMapPullback (Type v') q) ≪≫ selfHomChartRefinement b j q y =
        selfHomChartRefinement b i q x ≪≫ selfHomChartTransition b (q ≫ i) (q ≫ j) x y a) ∧
      selfHomChartTransition b (q ≫ i) (q ≫ j) x y d =
        selfHomChartTransition b (q ≫ i) (q ≫ j) x y a := by
  sorry

-- test: ChartRefinementTests.covered_refinement
example (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (q : S ⟶ T) (h : GerbeLocalCovers.overlapCover F i j x y q) (r : R ⟶ S) :
    GerbeLocalCovers.overlapCover F (q ≫ i) (q ≫ j) x y = ⊤ ∧
    ∃ hr : GerbeLocalCovers.overlapCover F (q ≫ i) (q ≫ j) x y r,
      Functor.isoWhiskerRight (selfHomOverlapTransition b i j x y q h)
          (J.overMapPullback (Type v') r) ≪≫ selfHomChartRefinement b (q ≫ j) r y =
        selfHomChartRefinement b (q ≫ i) r x ≪≫
          selfHomOverlapTransition b (q ≫ i) (q ≫ j) x y r hr := by
  sorry

-- test: ChartRefinementTests.natural_modifications
example (i : T ⟶ U) (q : S ⟶ T) (x : F.obj (.mk (op U)))
    {X Y Z : HomCategory b b} (m : X ⟶ Y) (n : Y ⟶ Z) :
    (J.overMapPullback (Type v') q).map
        ((J.overMapPullback (Type v') i).map (fibreHomSheafMap b b U x x (m ≫ n))) ≫
        (selfHomChartRefinement b i q x).hom.app Z =
      (selfHomChartRefinement b i q x).hom.app X ≫
        (J.overMapPullback (Type v') (q ≫ i)).map (fibreHomSheafMap b b U x x (m ≫ n)) := by
  sorry

-- test: ChartRefinementTests.nonidentity_loop
example (i : T ⟶ U) (x : F.obj (.mk (op U)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map i.op.toLoc).toFunctor.obj x)
    (he : e ≠ Iso.refl _) (q : S ⟶ T) :
    e ≠ Iso.refl _ ∧ Functor.isoWhiskerRight (selfHomChartTransition b i i x x e)
        (J.overMapPullback (Type v') q) ≪≫ selfHomChartRefinement b i q x =
      selfHomChartRefinement b i q x := by
  sorry

-- test: ChartRefinementTests.refined_cocycle
example (i : T ⟶ U) (j : T ⟶ V) (k : T ⟶ W)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V))) (z : F.obj (.mk (op W)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y)
    (d : (F.map j.op.toLoc).toFunctor.obj y ≅ (F.map k.op.toLoc).toFunctor.obj z)
    (q : S ⟶ T)
    (a : (F.map (q ≫ i).op.toLoc).toFunctor.obj x ≅
      (F.map (q ≫ k).op.toLoc).toFunctor.obj z) :
    Functor.isoWhiskerRight
        (selfHomChartTransition b i j x y e ≪≫ selfHomChartTransition b j k y z d)
        (J.overMapPullback (Type v') q) ≪≫ selfHomChartRefinement b k q z =
      selfHomChartRefinement b i q x ≪≫ selfHomChartTransition b (q ≫ i) (q ≫ k) x z a := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.ChartRefinementTests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

def selfHomOrbitSetoid (U : C) (X : HomCategory b b) :
    Setoid (Σ x : F.obj (.mk (op U)), x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) where
  r p q := ∃ e : p.1 ≅ q.1, (selfTransportActionIso b X e).hom.hom p.2 = q.2
  iseqv := by
    constructor
    · intro p
      refine ⟨Iso.refl p.1, ?_⟩
      rw [selfTransportActionIso_id]
      rfl
    · intro p q h
      obtain ⟨e, h⟩ := h
      refine ⟨e.symm, ?_⟩
      rw [← h]
      apply Iso.ext
      simp [selfTransportActionIso]
    · intro p q r h k
      obtain ⟨e, h⟩ := h
      obtain ⟨d, k⟩ := k
      refine ⟨e ≪≫ d, ?_⟩
      rw [selfTransportActionIso_comp]
      change (selfTransportActionIso b X d).hom.hom
        ((selfTransportActionIso b X e).hom.hom p.2) = r.2
      rw [h, k]

theorem selfHomOrbit_mk_eq (U : C) (X : HomCategory b b)
    (p q : Σ x : F.obj (.mk (op U)), x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    Quotient.mk (selfHomOrbitSetoid b U X) p = Quotient.mk _ q ↔
      ∃ e : p.1 ≅ q.1, (selfTransportActionIso b X e).hom.hom p.2 = q.2 := by
  sorry

theorem selfHomOrbit_mk_injective (U : C) (X : HomCategory b b)
    (x : F.obj (.mk (op U))) :
    Function.Injective (fun p : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x =>
      Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,p⟩) := by
  sorry

noncomputable def selfHomOrbitRestrict (X : HomCategory b b) {U V : C} (f : V ⟶ U) :
    Quotient (selfHomOrbitSetoid b U X) → Quotient (selfHomOrbitSetoid b V X) :=
  Quotient.map (fun p => ⟨(F.map f.op.toLoc).toFunctor.obj p.1,
    (fibreIsomRestriction b b X f p.1 p.1).hom p.2⟩) (by
      intro p q h
      obtain ⟨e, he⟩ := h
      refine ⟨(F.map f.op.toLoc).toFunctor.mapIso e, ?_⟩
      have k := congrArg (fun m => m.hom p.2) (selfTransportActionIso_restriction b X f e)
      change (fibreIsomRestriction b b X f q.1 q.1).hom
        ((selfTransportActionIso b X e).hom.hom p.2) =
        (selfTransportActionIso b X ((F.map f.op.toLoc).toFunctor.mapIso e)).hom.hom
          ((fibreIsomRestriction b b X f p.1 p.1).hom p.2) at k
      rw [he] at k
      exact k.symm)

theorem selfHomOrbitRestrict_mk (X : HomCategory b b) {U V : C} (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (p : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    selfHomOrbitRestrict b X f (Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,p⟩) =
      Quotient.mk (selfHomOrbitSetoid b V X) ⟨(F.map f.op.toLoc).toFunctor.obj x,
        (fibreIsomRestriction b b X f x x).hom p⟩ := by
  sorry

theorem selfHomOrbitRestrict_id (X : HomCategory b b) (U : C)
    (p : Quotient (selfHomOrbitSetoid b U X)) : selfHomOrbitRestrict b X (𝟙 U) p = p := by
  sorry

theorem selfHomOrbitRestrict_comp (X : HomCategory b b) {U V W : C}
    (f : V ⟶ U) (g : W ⟶ V) (p : Quotient (selfHomOrbitSetoid b U X)) :
    selfHomOrbitRestrict b X (g ≫ f) p =
      selfHomOrbitRestrict b X g (selfHomOrbitRestrict b X f p) := by
  sorry

noncomputable def selfHomOrbitPresheaf (X : HomCategory b b) :
    Cᵒᵖ ⥤ Type (max u' v') where
  obj U := Quotient (selfHomOrbitSetoid b U.unop X)
  map f := TypeCat.ofHom (selfHomOrbitRestrict b X f.unop)
  map_id U := by ext p; exact selfHomOrbitRestrict_id b X U.unop p
  map_comp f g := by ext p; exact selfHomOrbitRestrict_comp b X f.unop g.unop p

noncomputable def selfHomOrbitMap {X Y : HomCategory b b} (m : X ⟶ Y) (U : C) :
    Quotient (selfHomOrbitSetoid b U X) → Quotient (selfHomOrbitSetoid b U Y) :=
  Quotient.map (fun p => ⟨p.1, p.2 ≪≫ componentIso b b m U p.1⟩) (by
    intro p q h
    obtain ⟨e, he⟩ := h
    refine ⟨e, ?_⟩
    have k := congrArg (fun t => t.hom p.2) ((selfTransportNatIso b e).hom.naturality m)
    change (selfTransportActionIso b Y e).hom.hom (p.2 ≪≫ componentIso b b m U p.1) =
      (selfTransportActionIso b X e).hom.hom p.2 ≪≫ componentIso b b m U q.1 at k
    rw [he] at k
    exact k)

theorem selfHomOrbitMap_mk {X Y : HomCategory b b} (m : X ⟶ Y) (U : C)
    (x : F.obj (.mk (op U))) (p : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    selfHomOrbitMap b m U (Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,p⟩) =
      Quotient.mk (selfHomOrbitSetoid b U Y) ⟨x, p ≪≫ componentIso b b m U x⟩ := by
  sorry

theorem selfHomOrbitMap_id (X : HomCategory b b) (U : C)
    (p : Quotient (selfHomOrbitSetoid b U X)) : selfHomOrbitMap b (𝟙 X) U p = p := by
  sorry

theorem selfHomOrbitMap_comp {X Y Z : HomCategory b b} (m : X ⟶ Y) (n : Y ⟶ Z)
    (U : C) (p : Quotient (selfHomOrbitSetoid b U X)) :
    selfHomOrbitMap b (m ≫ n) U p = selfHomOrbitMap b n U (selfHomOrbitMap b m U p) := by
  sorry

theorem selfHomOrbitMap_restrict {X Y : HomCategory b b} (m : X ⟶ Y) {U V : C}
    (f : V ⟶ U) (p : Quotient (selfHomOrbitSetoid b U X)) :
    selfHomOrbitRestrict b Y f (selfHomOrbitMap b m U p) =
      selfHomOrbitMap b m V (selfHomOrbitRestrict b X f p) := by
  sorry

noncomputable def selfHomOrbitFunctor : HomCategory b b ⥤ (Cᵒᵖ ⥤ Type (max u' v')) where
  obj X := selfHomOrbitPresheaf b X
  map m :=
    { app := fun U => TypeCat.ofHom (selfHomOrbitMap b m U.unop)
      naturality := by
        intro U V f
        ext p
        exact (selfHomOrbitMap_restrict b m f.unop p).symm }
  map_id X := by
    ext U p
    exact selfHomOrbitMap_id b X U.unop p
  map_comp m n := by
    ext U p
    exact selfHomOrbitMap_comp b m n U.unop p

noncomputable def selfHomGlobalSheafFunctor :
    HomCategory b b ⥤ Sheaf J (Type (max u v u' v')) :=
  selfHomOrbitFunctor b ⋙
    (Functor.whiskeringRight Cᵒᵖ (Type (max u' v')) (Type (max u v u' v'))).obj
      uliftFunctor.{max u v, max u' v'} ⋙ presheafToSheaf J (Type (max u v u' v'))

theorem selfHomGlobalSheafFunctor_obj (X : HomCategory b b) :
    (selfHomGlobalSheafFunctor b).obj X =
      (presheafToSheaf J (Type (max u v u' v'))).obj
        (selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v, max u' v'}) := by
  sorry

theorem selfHomGlobalSheafFunctor_map_inverse {X Y : HomCategory b b} (m : X ⟶ Y) :
    (selfHomGlobalSheafFunctor b).map m ≫
        (selfHomGlobalSheafFunctor b).map (homIso b b m).inv = 𝟙 _ := by
  sorry

theorem selfHomGlobalSheafFunctor_unit_naturality {X Y : HomCategory b b} (m : X ⟶ Y) :
    Functor.whiskerRight ((selfHomOrbitFunctor b).map m) uliftFunctor.{max u v, max u' v'} ≫
        toSheafify J (selfHomOrbitPresheaf b Y ⋙ uliftFunctor.{max u v, max u' v'}) =
      toSheafify J (selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v, max u' v'}) ≫
        ((selfHomGlobalSheafFunctor b).map m).hom := by
  sorry

theorem selfHomOrbit_mk_transport (U : C) (X : HomCategory b b)
    {x y : F.obj (.mk (op U))} (e : x ≅ y)
    (p : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,p⟩ =
      Quotient.mk (selfHomOrbitSetoid b U X) ⟨y,(selfTransportActionIso b X e).hom.hom p⟩ := by
  sorry

theorem selfHomOrbitMap_inverse {X Y : HomCategory b b} (m : X ⟶ Y)
    (U : C) (p : Quotient (selfHomOrbitSetoid b U X)) :
    selfHomOrbitMap b (homIso b b m).inv U (selfHomOrbitMap b m U p) = p := by
  sorry

theorem selfHomGlobalSheafFunctor_hom_ext (X : HomCategory b b)
    (Q : Sheaf J (Type (max u v u' v')))
    (f g : (selfHomGlobalSheafFunctor b).obj X ⟶ Q)
    (h : toSheafify J (selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v, max u' v'}) ≫ f.hom =
      toSheafify J (selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v, max u' v'}) ≫ g.hom) :
    f = g := by
  sorry

theorem selfHomGlobalSheafFunctor_universal (X : HomCategory b b)
    (Q : Sheaf J (Type (max u v u' v')))
    (f : selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v, max u' v'} ⟶ Q.obj) :
    ∃! g : (selfHomGlobalSheafFunctor b).obj X ⟶ Q,
      toSheafify J (selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v, max u' v'}) ≫ g.hom = f := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GlobalHomTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U V W : C}
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

-- test: GlobalHomTests.transport_chain
example (X : HomCategory b b) {x y z : F.obj (.mk (op U))}
    (e : x ≅ y) (d : y ≅ z) (p : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,p⟩ =
      Quotient.mk (selfHomOrbitSetoid b U X)
        ⟨z,(selfTransportActionIso b X d).hom.hom ((selfTransportActionIso b X e).hom.hom p)⟩ := by
  sorry

-- test: GlobalHomTests.unequal_arrows
example (X : HomCategory b b) (x : F.obj (.mk (op U)))
    (p q : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) (h : p ≠ q) :
    Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,p⟩ ≠
      Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,q⟩ := by
  sorry

-- test: GlobalHomTests.empty_fibre
example (X : HomCategory b b) [IsEmpty (F.obj (.mk (op U)))] :
    IsEmpty ((selfHomOrbitPresheaf b X).obj (op U)) := by
  sorry

-- test: GlobalHomTests.two_restrictions
example (X : HomCategory b b) (f : V ⟶ U) (g : W ⟶ V)
    (p : (selfHomOrbitPresheaf b X).obj (op U)) :
    (selfHomOrbitPresheaf b X).map g.op ((selfHomOrbitPresheaf b X).map f.op p) =
      (selfHomOrbitPresheaf b X).map (g ≫ f).op p := by
  sorry

-- test: GlobalHomTests.change_representative
example (X : HomCategory b b) (f : V ⟶ U)
    {x y : F.obj (.mk (op U))} (e : x ≅ y)
    (p : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    Quotient.mk (selfHomOrbitSetoid b V X)
        ⟨(F.map f.op.toLoc).toFunctor.obj x, (fibreIsomRestriction b b X f x x).hom p⟩ =
      Quotient.mk (selfHomOrbitSetoid b V X)
        ⟨(F.map f.op.toLoc).toFunctor.obj y,
          (fibreIsomRestriction b b X f y y).hom ((selfTransportActionIso b X e).hom.hom p)⟩ := by
  sorry

-- test: GlobalHomTests.identity_comparison
example (X : HomCategory b b) (x : F.obj (.mk (op U)))
    (p : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    Quotient.mk (selfHomOrbitSetoid b U X)
        ⟨(F.map (𝟙 U).op.toLoc).toFunctor.obj x,
          (fibreIsomRestriction b b X (𝟙 U) x x).hom p⟩ =
      Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,p⟩ := by
  sorry

-- test: GlobalHomTests.inverse_modification
example {X Y : HomCategory b b} (m : X ⟶ Y)
    (p : (selfHomOrbitPresheaf b X).obj (op U)) :
    ((selfHomOrbitFunctor b).map (homIso b b m).inv).app (op U)
        (((selfHomOrbitFunctor b).map m).app (op U) p) = p := by
  sorry

-- test: GlobalHomTests.modification_restriction
example {X Y Z : HomCategory b b} (m : X ⟶ Y) (n : Y ⟶ Z)
    (f : V ⟶ U) (g : W ⟶ V) (p : (selfHomOrbitPresheaf b X).obj (op U)) :
    selfHomOrbitRestrict b Z g
        (selfHomOrbitMap b n V (selfHomOrbitRestrict b Y f (selfHomOrbitMap b m U p))) =
      selfHomOrbitMap b (m ≫ n) W (selfHomOrbitRestrict b X (g ≫ f) p) := by
  sorry

-- test: GlobalHomTests.nonidentity_modification
example (X : HomCategory b b) (m : X ⟶ X) (x : F.obj (.mk (op U)))
    (p : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x)
    (h : p ≪≫ componentIso b b m U x ≠ p) :
    selfHomOrbitMap b m U (Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,p⟩) ≠
      Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,p⟩ := by
  sorry

-- test: GlobalHomTests.unit_restriction
example (X : HomCategory b b) (f : V ⟶ U)
    (p : (selfHomOrbitPresheaf b X).obj (op U)) :
    ((selfHomGlobalSheafFunctor b).obj X).obj.map f.op
        ((toSheafify J (selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v, max u' v'})).app
          (op U) (ULift.up p)) =
      (toSheafify J (selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v, max u' v'})).app
        (op V) (ULift.up (selfHomOrbitRestrict b X f p)) := by
  sorry

-- test: GlobalHomTests.unit_modification
example {X Y : HomCategory b b} (m : X ⟶ Y)
    (x : F.obj (.mk (op U))) (p : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    (((selfHomGlobalSheafFunctor b).map m).hom.app (op U))
        ((toSheafify J (selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v, max u' v'})).app
          (op U) (ULift.up (Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,p⟩))) =
      (toSheafify J (selfHomOrbitPresheaf b Y ⋙ uliftFunctor.{max u v, max u' v'})).app
        (op U) (ULift.up (Quotient.mk (selfHomOrbitSetoid b U Y)
          ⟨x,p ≪≫ componentIso b b m U x⟩)) := by
  sorry

-- test: GlobalHomTests.universal_target
example (X : HomCategory b b) (Q : Sheaf J (Type (max u v u' v')))
    (f : selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v, max u' v'} ⟶ Q.obj) :
    ∃! g : (selfHomGlobalSheafFunctor b).obj X ⟶ Q,
      toSheafify J (selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v, max u' v'}) ≫ g.hom = f := by
  sorry

-- test: GlobalHomTests.generator_ext
example (X : HomCategory b b) (Q : Sheaf J (Type (max u v u' v')))
    (f g : (selfHomGlobalSheafFunctor b).obj X ⟶ Q)
    (h : ∀ (U : C) (x : F.obj (.mk (op U)))
      (p : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x),
      f.hom.app (op U) ((toSheafify J (selfHomOrbitPresheaf b X ⋙
        uliftFunctor.{max u v, max u' v'})).app (op U)
          (ULift.up (Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,p⟩))) =
      g.hom.app (op U) ((toSheafify J (selfHomOrbitPresheaf b X ⋙
        uliftFunctor.{max u v, max u' v'})).app (op U)
          (ULift.up (Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,p⟩)))) : f = g := by
  sorry

-- test: GlobalHomTests.global_inverse
example {X Y : HomCategory b b} (m : X ⟶ Y)
    (p : ((selfHomGlobalSheafFunctor b).obj Y).obj.obj (op U)) :
    (((selfHomGlobalSheafFunctor b).map m).hom.app (op U))
        ((((selfHomGlobalSheafFunctor b).map (homIso b b m).inv).hom.app (op U)) p) = p := by
  sorry

-- test: GlobalHomTests.global_composition
example {X Y Z : HomCategory b b} (m : X ⟶ Y) (n : Y ⟶ Z) :
    (selfHomOrbitFunctor b).map (m ≫ n) =
      (selfHomOrbitFunctor b).map m ≫ (selfHomOrbitFunctor b).map n ∧
    (selfHomGlobalSheafFunctor b).map (m ≫ n) =
      (selfHomGlobalSheafFunctor b).map m ≫ (selfHomGlobalSheafFunctor b).map n := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GlobalHomTests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

theorem selfHomTransport_pullHom (X : HomCategory b b) {U V W : C}
    (x : F.obj (.mk (op U))) (f : V ⟶ U) (g : W ⟶ V) (h : W ⟶ U)
    (w : g ≫ f = h) (p : (fibreHomSheaf b b U x x X).obj.obj (op (Over.mk f))) :
    fibreHomTransportIsoEquiv b b U x x X (Over.mk h) (pullHom p g h h w w) =
      (selfTransportActionIso b X
        ((Cat.Hom.toNatIso (F.mapComp' f.op.toLoc g.op.toLoc h.op.toLoc
          (by rw [← w]; rfl))).app x).symm).hom.hom
        ((fibreIsomRestriction b b X g _ _).hom
          (fibreHomTransportIsoEquiv b b U x x X (Over.mk f) p)) := by
  sorry

noncomputable def selfHomChartToOrbit (X : HomCategory b b) (U : C)
    (x : F.obj (.mk (op U))) :
    (fibreHomSheaf b b U x x X).obj ⋙ uliftFunctor.{max u v u',v'} ⟶
      (Over.forget U).op ⋙ (selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v,max u' v'}) where
  app T := TypeCat.ofHom (fun p => ULift.up (Quotient.mk (selfHomOrbitSetoid b T.unop.left X)
    ⟨(F.map T.unop.hom.op.toLoc).toFunctor.obj x,
      fibreHomTransportIsoEquiv b b U x x X T.unop p.down⟩))
  naturality := by
    intro T S f
    ext p
    apply ULift.ext
    change Quotient.mk (selfHomOrbitSetoid b S.unop.left X) ⟨_, fibreHomTransportIsoEquiv b b U x x X (Over.mk S.unop.hom)
      (pullHom p.down f.unop.left S.unop.hom S.unop.hom)⟩ = _
    rw [selfHomTransport_pullHom b X x T.unop.hom f.unop.left S.unop.hom (Over.w f.unop)]
    exact (selfHomOrbit_mk_transport b S.unop.left X _ _).symm

theorem selfHomChartToOrbit_injective (X : HomCategory b b) (U : C)
    (x : F.obj (.mk (op U))) (T : Over U) :
    Function.Injective ((selfHomChartToOrbit b X U x).app (op T)) := by
  sorry

theorem selfHomChartToOrbit_locallySurjective (X : HomCategory b b) (U : C)
    (x : F.obj (.mk (op U))) :
    Presheaf.IsLocallySurjective (J.over U) (selfHomChartToOrbit b X U x) := by
  sorry

noncomputable def selfHomChartToGlobal (X : HomCategory b b) (U : C)
    (x : F.obj (.mk (op U))) :
    (sheafCompose (J.over U) uliftFunctor.{max u v u',v'}).obj
      (fibreHomSheaf b b U x x X) ⟶ ((selfHomGlobalSheafFunctor b).obj X).over U where
  hom := selfHomChartToOrbit b X U x ≫
    Functor.whiskerLeft (Over.forget U).op
      (toSheafify J (selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v,max u' v'}))

theorem selfHomChartToGlobal_isIso [J.WEqualsLocallyBijective (Type (max u v u' v'))]
    (X : HomCategory b b) (U : C)
    (x : F.obj (.mk (op U))) : IsIso (selfHomChartToGlobal b X U x) := by
  sorry

noncomputable def selfHomChartGlobalIso [J.WEqualsLocallyBijective (Type (max u v u' v'))]
    (X : HomCategory b b) (U : C)
    (x : F.obj (.mk (op U))) :
    (sheafCompose (J.over U) uliftFunctor.{max u v u',v'}).obj
      (fibreHomSheaf b b U x x X) ≅ ((selfHomGlobalSheafFunctor b).obj X).over U := by
  letI := selfHomChartToGlobal_isIso b X U x
  exact asIso (selfHomChartToGlobal b X U x)

theorem selfHomChartGlobalIso_hom [J.WEqualsLocallyBijective (Type (max u v u' v'))]
    (X : HomCategory b b) (U : C)
    (x : F.obj (.mk (op U))) :
    (selfHomChartGlobalIso b X U x).hom = selfHomChartToGlobal b X U x := by
  sorry

theorem selfHomChartToOrbit_apply (X : HomCategory b b) (U : C)
    (x : F.obj (.mk (op U))) (T : Over U)
    (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    (selfHomChartToOrbit b X U x).app (op T) (ULift.up p) =
      ULift.up (Quotient.mk (selfHomOrbitSetoid b T.left X)
        ⟨(F.map T.hom.op.toLoc).toFunctor.obj x,
          fibreHomTransportIsoEquiv b b U x x X T p⟩) := by
  sorry

theorem selfHomChartGlobalIso_apply [J.WEqualsLocallyBijective (Type (max u v u' v'))]
    (X : HomCategory b b) (U : C)
    (x : F.obj (.mk (op U))) (T : Over U)
    (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    (selfHomChartGlobalIso b X U x).hom.hom.app (op T) (ULift.up p) =
      (toSheafify J (selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v,max u' v'})).app
        (op T.left) ((selfHomChartToOrbit b X U x).app (op T) (ULift.up p)) := by
  sorry

theorem selfHomChartToOrbit_modification {X Y : HomCategory b b} (m : X ⟶ Y)
    (U : C) (x : F.obj (.mk (op U))) :
    Functor.whiskerRight (fibreHomSheafMap b b U x x m).hom uliftFunctor.{max u v u',v'} ≫
        selfHomChartToOrbit b Y U x =
      selfHomChartToOrbit b X U x ≫ Functor.whiskerLeft (Over.forget U).op
        (Functor.whiskerRight ((selfHomOrbitFunctor b).map m)
          uliftFunctor.{max u v,max u' v'}) := by
  sorry

theorem selfHomChartToGlobal_modification {X Y : HomCategory b b} (m : X ⟶ Y)
    (U : C) (x : F.obj (.mk (op U))) :
    (sheafCompose (J.over U) uliftFunctor.{max u v u',v'}).map
        (fibreHomSheafMap b b U x x m) ≫ selfHomChartToGlobal b Y U x =
      selfHomChartToGlobal b X U x ≫
        (J.overPullback (Type (max u v u' v')) U).map ((selfHomGlobalSheafFunctor b).map m) := by
  sorry

theorem selfHomChartToOrbit_transport (X : HomCategory b b) (U : C)
    {x y : F.obj (.mk (op U))} (e : x ≅ y) (T : Over U)
    (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    (selfHomChartToOrbit b X U y).app (op T)
        (ULift.up ((selfHomSheafTransport b X e).hom.app (op T) p)) =
      (selfHomChartToOrbit b X U x).app (op T) (ULift.up p) := by
  sorry

theorem selfHomChartToOrbit_baseChange (X : HomCategory b b) {U V : C}
    (f : V ⟶ U) (x : F.obj (.mk (op U))) (T : Over V)
    (p : (fibreHomSheaf b b U x x X).obj.obj (op ((Over.map f).obj T))) :
    (selfHomChartToOrbit b X V ((F.map f.op.toLoc).toFunctor.obj x)).app (op T)
        (ULift.up ((fibreHomBaseChangeIso b b X f x x).hom.hom.app (op T) p)) =
      (selfHomChartToOrbit b X U x).app (op ((Over.map f).obj T)) (ULift.up p) := by
  sorry

theorem selfHomChartToGlobal_transport (X : HomCategory b b) (U : C)
    {x y : F.obj (.mk (op U))} (e : x ≅ y) :
    (sheafCompose (J.over U) uliftFunctor.{max u v u',v'}).map
        (selfHomSheafTransport b X e) ≫ selfHomChartToGlobal b X U y =
      selfHomChartToGlobal b X U x := by
  sorry

theorem selfHomChartToGlobal_baseChange (X : HomCategory b b) {U V : C}
    (f : V ⟶ U) (x : F.obj (.mk (op U))) (T : Over V)
    (p : (fibreHomSheaf b b U x x X).obj.obj (op ((Over.map f).obj T))) :
    (selfHomChartToGlobal b X V ((F.map f.op.toLoc).toFunctor.obj x)).hom.app (op T)
        (ULift.up ((fibreHomBaseChangeIso b b X f x x).hom.hom.app (op T) p)) =
      (selfHomChartToGlobal b X U x).hom.app (op ((Over.map f).obj T)) (ULift.up p) := by
  sorry

theorem selfHomChartGlobalIso_inv_hom [J.WEqualsLocallyBijective (Type (max u v u' v'))]
    (X : HomCategory b b) (U : C) (x : F.obj (.mk (op U))) (T : Over U)
    (p : (((selfHomGlobalSheafFunctor b).obj X).over U).obj.obj (op T)) :
    (selfHomChartGlobalIso b X U x).hom.hom.app (op T)
      ((selfHomChartGlobalIso b X U x).inv.hom.app (op T) p) = p := by
  sorry

theorem selfHomChartGlobalIso_hom_inv [J.WEqualsLocallyBijective (Type (max u v u' v'))]
    (X : HomCategory b b) (U : C) (x : F.obj (.mk (op U))) (T : Over U)
    (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    (selfHomChartGlobalIso b X U x).inv.hom.app (op T)
      ((selfHomChartGlobalIso b X U x).hom.hom.app (op T) (ULift.up p)) = ULift.up p := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.ChartGlobalTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

-- test: ChartGlobalTests.raw_distinct
example (X : HomCategory b b) (U : C) (x : F.obj (.mk (op U))) (T : Over U)
    (p q : (fibreHomSheaf b b U x x X).obj.obj (op T)) (hpq : p ≠ q) :
    (selfHomChartToOrbit b X U x).app (op T) (ULift.up p) ≠
      (selfHomChartToOrbit b X U x).app (op T) (ULift.up q) := by
  sorry

-- test: ChartGlobalTests.cover_of_arbitrary_class
example (X : HomCategory b b) (U : C) (x : F.obj (.mk (op U))) (T : Over U)
    (q : ((Over.forget U).op ⋙ (selfHomOrbitPresheaf b X ⋙
      uliftFunctor.{max u v,max u' v'})).obj (op T)) :
    Presheaf.imageSieve (selfHomChartToOrbit b X U x) q ∈ (J.over U) T := by
  sorry

-- test: ChartGlobalTests.restriction_square
example (X : HomCategory b b) (U : C) (x : F.obj (.mk (op U))) {T S : Over U}
    (f : S ⟶ T) (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    (selfHomChartToOrbit b X U x).app (op S)
      (ULift.up ((fibreHomSheaf b b U x x X).obj.map f.op p)) =
    ((selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v,max u' v'}).map f.left.op)
      ((selfHomChartToOrbit b X U x).app (op T) (ULift.up p)) := by
  sorry

-- test: ChartGlobalTests.two_transports
example (X : HomCategory b b) (U : C) {x y z : F.obj (.mk (op U))}
    (e : x ≅ y) (d : y ≅ z) :
    (sheafCompose (J.over U) uliftFunctor.{max u v u',v'}).map (selfHomSheafTransport b X e) ≫
      (sheafCompose (J.over U) uliftFunctor.{max u v u',v'}).map (selfHomSheafTransport b X d) ≫
        selfHomChartToGlobal b X U z = selfHomChartToGlobal b X U x := by
  sorry

-- test: ChartGlobalTests.transport_choice
example (X : HomCategory b b) (U : C) {x y : F.obj (.mk (op U))}
    (e d : x ≅ y) (T : Over U) (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    (selfHomChartToOrbit b X U y).app (op T)
        (ULift.up ((selfHomSheafTransport b X e).hom.app (op T) p)) =
      (selfHomChartToOrbit b X U y).app (op T)
        (ULift.up ((selfHomSheafTransport b X d).hom.app (op T) p)) := by
  sorry

-- test: ChartGlobalTests.two_modifications
example {X Y Z : HomCategory b b} (m : X ⟶ Y) (n : Y ⟶ Z)
    (U : C) (x : F.obj (.mk (op U))) :
    (sheafCompose (J.over U) uliftFunctor.{max u v u',v'}).map (fibreHomSheafMap b b U x x m) ≫
      (sheafCompose (J.over U) uliftFunctor.{max u v u',v'}).map (fibreHomSheafMap b b U x x n) ≫
        selfHomChartToGlobal b Z U x =
      selfHomChartToGlobal b X U x ≫
        (J.overPullback (Type (max u v u' v')) U).map ((selfHomGlobalSheafFunctor b).map (m ≫ n)) := by
  sorry

-- test: ChartGlobalTests.refined_base_change
example (X : HomCategory b b) {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op U)))
    {T S : Over V} (g : S ⟶ T)
    (p : (fibreHomSheaf b b U x x X).obj.obj (op ((Over.map f).obj T))) :
    (selfHomChartToGlobal b X V ((F.map f.op.toLoc).toFunctor.obj x)).hom.app (op S)
        (ULift.up ((fibreHomBaseChangeIso b b X f x x).hom.hom.app (op S)
          ((fibreHomSheaf b b U x x X).obj.map ((Over.map f).map g).op p))) =
      (selfHomChartToGlobal b X U x).hom.app (op ((Over.map f).obj S))
        (ULift.up ((fibreHomSheaf b b U x x X).obj.map ((Over.map f).map g).op p)) := by
  sorry

section
variable [J.WEqualsLocallyBijective (Type (max u v u' v'))]

-- test: ChartGlobalTests.arbitrary_global_section
example (X : HomCategory b b) (U : C) (x : F.obj (.mk (op U))) (T : Over U)
    (q : (((selfHomGlobalSheafFunctor b).obj X).over U).obj.obj (op T)) :
    ∃ p : (fibreHomSheaf b b U x x X).obj.obj (op T),
      (selfHomChartToGlobal b X U x).hom.app (op T) (ULift.up p) = q := by
  sorry

-- test: ChartGlobalTests.distinct_after_sheafification
example (X : HomCategory b b) (U : C) (x : F.obj (.mk (op U))) (T : Over U)
    (p q : (fibreHomSheaf b b U x x X).obj.obj (op T)) (hpq : p ≠ q) :
    (selfHomChartToGlobal b X U x).hom.app (op T) (ULift.up p) ≠
      (selfHomChartToGlobal b X U x).hom.app (op T) (ULift.up q) := by
  sorry

-- test: ChartGlobalTests.empty_local_carrier
example (X : HomCategory b b) (U : C) (x : F.obj (.mk (op U))) (T : Over U)
    [h : IsEmpty ((fibreHomSheaf b b U x x X).obj.obj (op T))] :
    IsEmpty ((((selfHomGlobalSheafFunctor b).obj X).over U).obj.obj (op T)) := by
  sorry

end
end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.ChartGlobalTests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.ChartGlobalTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
-- test: ChartGlobalTests.matched_universes
example {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
    {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v,u}} [IsGerbe F J]
    {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
    (X : HomCategory b b) (U : C) (x : F.obj (.mk (op U))) :
    IsIso (selfHomChartToGlobal b X U x) := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.ChartGlobalTests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.IntrinsicBandExtraTests
open CategoryTheory Opposite Bicategory IntrinsicBandSections BandFixtures
open ConnectedBandFixtures

-- BandCenterTests.C3: a concrete point-site count and full inertia recovery.
example : Nat.card (IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 3))))
      (Discrete.mk PUnit.unit)) = 3 ∧
    Function.Bijective (eval
      (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Discrete.mk PUnit.unit, SingleObj.star _)) := by sorry

-- BandCenterTests.identity: an terminal groupoid, without an inertia hypothesis.
example : Subsingleton (IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 1))))
      (Discrete.mk PUnit.unit)) := by sorry

-- BandCenterTests.S3: central sections differ from the full six-element inertia.
example : Nat.card (IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (ConnectedFibre PUnit (Equiv.Perm (Fin 3))))
      (Discrete.mk PUnit.unit)) = 1 ∧
    ¬ Function.Surjective (eval
      (constantDiagram (Discrete PUnit) (ConnectedFibre PUnit (Equiv.Perm (Fin 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Codiscrete.mk PUnit.unit, SingleObj.star _)) := by sorry

-- BandEvaluationTests.generator: the generator is a specified section.
example : (eval
    (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 3))))
    (𝟙 (Discrete.mk PUnit.unit)) (Discrete.mk PUnit.unit, SingleObj.star _)
    (componentSectionsEquiv (Discrete PUnit) PUnit (Multiplicative (ZMod 3))
      (Discrete.mk PUnit.unit) (fun _ => Multiplicative.ofAdd (1 : ZMod 3)))).hom.2 =
      Multiplicative.ofAdd (1 : ZMod 3) := by sorry

-- BandEvaluationTests.changeObject: any connecting isomorphism in the two-object gerbe.
example (s : IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (ConnectedFibre Bool (Multiplicative (ZMod 3))))
      (Discrete.mk PUnit.unit))
    (e : (Codiscrete.mk false, SingleObj.star (Multiplicative (ZMod 3))) ≅
      (Codiscrete.mk true, SingleObj.star (Multiplicative (ZMod 3)))) :
    Aut.autMulEquivOfIso e
      (eval (constantDiagram (Discrete PUnit) (ConnectedFibre Bool (Multiplicative (ZMod 3))))
        (𝟙 (Discrete.mk PUnit.unit)) (Codiscrete.mk false, SingleObj.star _) s) =
      eval (constantDiagram (Discrete PUnit) (ConnectedFibre Bool (Multiplicative (ZMod 3))))
        (𝟙 (Discrete.mk PUnit.unit)) (Codiscrete.mk true, SingleObj.star _) s ∧
    (eval (constantDiagram (Discrete PUnit) (ConnectedFibre Bool (Multiplicative (ZMod 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Codiscrete.mk false, SingleObj.star _) s).hom.2 =
    (eval (constantDiagram (Discrete PUnit) (ConnectedFibre Bool (Multiplicative (ZMod 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Codiscrete.mk true, SingleObj.star _) s).hom.2 := by sorry

-- BandEvaluationTests.noncentral: the transposition is excluded from evaluation.
example (s : IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (ConnectedFibre PUnit (Equiv.Perm (Fin 3))))
      (Discrete.mk PUnit.unit)) :
    (eval (constantDiagram (Discrete PUnit) (ConnectedFibre PUnit (Equiv.Perm (Fin 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Codiscrete.mk PUnit.unit, SingleObj.star _) s).hom.2 ≠
      Equiv.swap (0 : Fin 3) 1 := by sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.IntrinsicBandExtraTests

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

open CategoryTheory

/-! ## Layer R09.6a: Artin approximation -/

namespace Approximation

variable (A : Type u) [CommRing A] [IsLocalRing A]

/-- `A` has the Artin approximation property: every solution in the completion `Â` of a system of
polynomial equations over `A` (a map from a finitely presented `A`-algebra) is congruent modulo any
power of the maximal ideal to a solution in `A`. -/
def HasArtinApproximation : Prop :=
  ∀ (B : Type u) [CommRing B] [Algebra A B], Algebra.FinitePresentation A B →
    ∀ (φ : B →ₐ[A] AdicCompletion (IsLocalRing.maximalIdeal A) A) (n : ℕ),
      ∃ ψ : B →ₐ[A] A, ∀ b : B,
        φ b - algebraMap A (AdicCompletion (IsLocalRing.maximalIdeal A) A) (ψ b) ∈
          (Ideal.map (algebraMap A (AdicCompletion (IsLocalRing.maximalIdeal A) A))
            (IsLocalRing.maximalIdeal A)) ^ n

/-- A complete Noetherian local ring approximates its own solutions exactly: the degenerate case of
Artin approximation. -/
theorem hasArtinApproximation_of_isAdicComplete [IsNoetherianRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A] : HasArtinApproximation A := sorry

end Approximation

/-! ## Layer A0-extension: the relative Picard presheaf -/

namespace RelativePicard

open AlgebraicGeometry Limits

variable {X B : Scheme.{u}} (f : X ⟶ B)

/-- The relative Picard presheaf of `f : X → B` on schemes over `B`: a scheme `T → B` is sent to the
line-bundle classes of the base change `X_T = T ×_B X`. Its fppf sheafification is the relative
Picard sheaf `Pic_{X/B}`; the base here is a scheme, the README allows an algebraic space. -/
noncomputable def relativePicardPresheaf : (Over B)ᵒᵖ ⥤ Type (u + 1) where
  obj T := TauCeti.AlgebraicGeometry.LineBundleClass (pullback T.unop.hom f)
  map := sorry
  map_id := sorry
  map_comp := sorry

/-- The relative Picard presheaf of the identity `B → B` is the Picard presheaf of the base
(`X_T = T`); its fppf sheafification is zero, since every line bundle on `T` is Zariski-locally
trivial. -/
theorem relativePicardPresheaf_id_obj (T : (Over B)ᵒᵖ) :
    Nonempty ((relativePicardPresheaf (𝟙 B)).obj T ≃
      TauCeti.AlgebraicGeometry.LineBundleClass T.unop.left) := sorry

end RelativePicard

/-! ## Layer R09.7: marked ideals, order, maximal contact and resolution -/

namespace Resolution

variable {R : Type u} [CommRing R]

open scoped Classical in
/-- The order of an ideal at a prime: the largest `n` with `I R_𝔭 ⊆ 𝔭ⁿ R_𝔭`, as an extended natural
number. Vanishing implies order `⊤`; the converse needs Noetherianity, by Krull intersection. -/
noncomputable def _root_.Ideal.orderAt (I : Ideal R) (p : PrimeSpectrum R) : ℕ∞ :=
  ⨆ n : ℕ, if I.map (algebraMap R (Localization.AtPrime p.asIdeal)) ≤
    (IsLocalRing.maximalIdeal (Localization.AtPrime p.asIdeal)) ^ n then (n : ℕ∞) else 0

/-- A marked ideal `(I, d)`: an ideal with a positive integer mark, the datum on which the
resolution algorithm acts. -/
structure MarkedIdeal (R : Type u) [CommRing R] where
  ideal : Ideal R
  mark : ℕ
  mark_pos : 0 < mark

/-- The cosupport of a marked ideal: the primes at which the order of `I` is at least `d`. -/
def MarkedIdeal.cosupport (J : MarkedIdeal R) : Set (PrimeSpectrum R) :=
  {p | (J.mark : ℕ∞) ≤ J.ideal.orderAt p}

/-- The marked ideals `(I, d)` and `(Iᵏ, k d)` have the same cosupport: the first instance of the
equivalence of marked ideals on a regular ambient scheme. Regularity is essential: the square
of the maximal ideal of a dual-number ring vanishes although the ideal has order one. -/
theorem MarkedIdeal.cosupport_pow (J : MarkedIdeal R) (k : ℕ) (hk : 0 < k) :
    (∀ p : PrimeSpectrum R, IsRegularLocalRing (Localization.AtPrime p.asIdeal)) →
    (MarkedIdeal.mk (J.ideal ^ k) (k * J.mark) (Nat.mul_pos hk J.mark_pos)).cosupport =
      J.cosupport := sorry

/-- Upper semicontinuity of the order on a regular ring of finite type over a field of
characteristic zero (the affine charts of a smooth variety): the cosupport of a marked ideal is
closed. -/
theorem MarkedIdeal.isClosed_cosupport (k : Type u) [Field k] [CharZero k] [Algebra k R]
    [Algebra.FiniteType k R]
    (hreg : ∀ p : PrimeSpectrum R, IsRegularLocalRing (Localization.AtPrime p.asIdeal))
    (J : MarkedIdeal R) : IsClosed J.cosupport := sorry

/-- The cosupport of the unit marked ideal `(R, d)` is empty. -/
example (d : ℕ) (hd : 0 < d) : (MarkedIdeal.mk (⊤ : Ideal R) d hd).cosupport = ∅ := sorry

/-- The cosupport of `(0, d)` is everything. -/
example (d : ℕ) (hd : 0 < d) : (MarkedIdeal.mk (⊥ : Ideal R) d hd).cosupport = Set.univ := sorry

variable {k : Type u} [Field k] {σ : Type u}

/-- The derivative ideal `D(I) = I + (∂f/∂xᵢ : f ∈ I)` of an ideal of a polynomial ring. -/
noncomputable def derivativeIdeal (I : Ideal (MvPolynomial σ k)) : Ideal (MvPolynomial σ k) :=
  I ⊔ Ideal.span {g | ∃ f ∈ I, ∃ i : σ, g = MvPolynomial.pderiv i f}

/-- Existence of a hypersurface of maximal contact in characteristic zero: if `I` has order exactly
`d ≥ 1` at a prime `𝔭` of the polynomial ring, some element of the `(d-1)`-st derivative ideal has
order exactly `1` at `𝔭`. This fails in positive characteristic (`x^p` over `𝔽_p`). -/
theorem exists_maximalContact [CharZero k] [Finite σ] (I : Ideal (MvPolynomial σ k))
    (p : PrimeSpectrum (MvPolynomial σ k)) (d : ℕ) (hd : 0 < d) (hI : I.orderAt p = d) :
    ∃ f ∈ derivativeIdeal^[d - 1] I, (Ideal.span {f}).orderAt p = 1 := sorry

open AlgebraicGeometry in
/-- Resolution of singularities in characteristic zero: an integral scheme of finite type over a
field of characteristic zero admits a proper surjective morphism from a smooth scheme which is an
isomorphism over some dense open subscheme. Identification with the regular locus, the reducible
case, and embedded resolution with normal
crossings exceptional divisor is in the README. -/
theorem exists_resolution [CharZero k] (X : Scheme.{u}) (s : X ⟶ Spec (CommRingCat.of k))
    [LocallyOfFiniteType s] [QuasiCompact s] [IsSeparated s] [IsIntegral X] :
    ∃ (Y : Scheme.{u}) (π : Y ⟶ X), IsProper π ∧ Function.Surjective π.base ∧
      Smooth (π ≫ s) ∧ ∃ U : X.Opens, Dense (U : Set X) ∧ IsIso (π ∣_ U) := sorry

namespace NegativeControls

/-- `OrderTests.dualNumbers`: a nonregular local ring has order one for its maximal ideal
but infinite order for its square. This excludes arbitrary rings from `cosupport_pow`. -/
example (K : Type u) [Field K] :
    let R := DualNumber K
    let m := IsLocalRing.maximalIdeal R
    ∃ p : PrimeSpectrum R, m.orderAt p = 1 ∧ (m ^ 2).orderAt p = ⊤ := sorry

/-- The same dual-number example distinguishes the cosupports of `(m,2)` and `(m²,4)`;
the regularity hypothesis is not merely a condition needed for a proof technique. -/
example (K : Type u) [Field K] :
    let m := IsLocalRing.maximalIdeal (DualNumber K)
    (MarkedIdeal.mk (m ^ 2) 4 (by decide)).cosupport ≠
      (MarkedIdeal.mk m 2 (by decide)).cosupport := sorry

/-- `MaxContactTests.characteristicTwoCusp`: the derivative with respect to `y` is `y²`,
so the derivative ideal of the characteristic-two cusp is not its original ideal. -/
example :
    MvPolynomial.pderiv (1 : Fin 2)
      ((MvPolynomial.X (0 : Fin 2) : MvPolynomial (Fin 2) (ZMod 2)) ^ 2 +
        MvPolynomial.X (1 : Fin 2) ^ 3) = MvPolynomial.X (1 : Fin 2) ^ 2 := sorry

/-- The ordinary derivative criterion has no order-one tangent direction for `(x²,2)`
in characteristic two. -/
example :
    derivativeIdeal (Ideal.span
      {((MvPolynomial.X () : MvPolynomial Unit (ZMod 2)) ^ 2)}) =
      Ideal.span {((MvPolynomial.X () : MvPolynomial Unit (ZMod 2)) ^ 2)} := sorry

/-- `StabiliserTests.signQuotient`: every source deformation of the origin has square zero. -/
example (K : Type u) [Field K] (a : DualNumber K)
    (ha : TrivSqZeroExt.fst a = 0) : a ^ 2 = 0 := sorry

/-- The coarse coordinate `t = ε` is nonzero, so it cannot be the square of a source
deformation of the origin. -/
example (K : Type u) [Field K] :
    (DualNumber.eps : DualNumber K) ≠ 0 ∧
      ¬ ∃ a : DualNumber K, TrivSqZeroExt.fst a = 0 ∧ a ^ 2 = DualNumber.eps := sorry

/-- `DefExamples.nonsmoothGroup`: the `μ₂`-torsor `z² = 1+ε` in characteristic two has
no section over the dual-number ring, although its special fibre is trivial. -/
example : ¬ ∃ z : DualNumber (ZMod 2), z ^ 2 = 1 + DualNumber.eps := sorry

/-- `PicardStackTests.disconnected`: the scalar units on two F₃-points have four elements,
whereas the units on the base have two. -/
example : Nat.card ((ZMod 3)ˣ × (ZMod 3)ˣ) = 4 ∧ Nat.card (ZMod 3)ˣ = 2 := sorry

/-- `DefGroupoidTests.bg`: at the residue field the framed automorphism group is trivial,
even when the group of automorphisms of the unframed object is not. -/
example : (MonoidHom.id (ZMod 3)ˣ).ker = ⊥ ∧ Nat.card (ZMod 3)ˣ = 2 := sorry

/-- `RigidifyTests.gerbe`: the proper kernel of C₄ → C₂ has order two and the target
still has order two; a gerbe projection need not kill full inertia. -/
example :
    Nat.card ((ZMod.castHom (show 2 ∣ 4 from ⟨2, rfl⟩)
      (ZMod 2)).toAddMonoidHom.ker) = 2 ∧ Nat.card (ZMod 2) = 2 := sorry

/-- `LevelTests.unpolarizedProduct`: an integral unipotent automorphism fixes level three
but is nonidentity; polarization preservation cannot be omitted from abelian rigidity. -/
example :
    let U : Matrix (Fin 2) (Fin 2) ℤ :=
      fun i j => if i = j then 1 else if i = 0 ∧ j = 1 then 3 else 0
    U ≠ 1 ∧ Matrix.det U = 1 ∧ U.map (Int.castRingHom (ZMod 3)) = 1 := sorry

/-- `TwistedInertiaTests.frobeniusDirection`: on fifth roots over the binary field, arithmetic
Frobenius has exponent two and its inverse exponent three, so they differ at a generator. -/
example : (2 : ZMod 5) * 3 = 1 ∧ (2 : ZMod 5) ≠ 3 := sorry

/-- A map to the constant group of order three over the binary field must be trivial
if it intertwines the square Frobenius on the source and identity on the target. -/
example (α : ZMod 3 →+ ZMod 3) (h : ∀ x, α (2 * x) = α x) : α = 0 := sorry

/-- Over the four-element field the fourth-power Frobenius on third roots is identity;
every homomorphism to the constant group of order three is equivariant. -/
example (α : ZMod 3 →+ ZMod 3) (x : ZMod 3) : α (4 * x) = α x := sorry

end NegativeControls

end Resolution

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

/-!
Stated in `README.md` but not typed here: the projective bundle with its twists and their direct
images; the representability of the relative Grassmannian and flag schemes and their Plücker
embeddings; relative ampleness and very ampleness; Castelnuovo–Mumford regularity and boundedness;
the Hilbert functor, Hom and Isom schemes and coherent dévissage; relative gerbes, finite étale and
profinite étale gerbes, locally full morphisms and the canonical factorisation of affine gerbes;
torsor twists of quotient stacks and twisted inertia; inertia subgroup stacks, rigidification and
base change of coarse spaces; the Picard stack and its algebraicity; Artin's axioms and criterion;
deformation groupoids of a point of a stack and their comparison with completed local rings;
controlled transforms, maximal contact as a predicate, coefficient ideals, `MarkedIdeal.homogenize`,
`homogenize_tangentTransport`, `homogenize_etaleGluing`, the resolution invariant with companion
ideals and birth history, its component selector and auxiliary multiplicity,
global centres and termination; resolution of reducible varieties and preservation of the entire
smooth locus; and the strict normal crossings compactification with its polydisc
charts.
-/
