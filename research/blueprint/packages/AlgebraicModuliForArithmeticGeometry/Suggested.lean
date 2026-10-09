import Mathlib
import TauCeti.AlgebraicGeometry.LineBundle.Class
import TauCeti.AlgebraicGeometry.Modules.TensorProduct
import TauCeti.AlgebraicGeometry.Cohomology.EulerCharacteristic
import TauCeti.CategoryTheory.Sites.SheafCohomology.LongExactSequence

/-!
# AlgebraicModuliForArithmeticGeometry: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures which
can already be stated against the Mathlib and Tau Ceti APIs. It is not an exhaustive list of
the results in any layer, and nothing here claims an implementation.

Design choices made explicit here: a gerbe is a predicate `IsGerbe F J` on Mathlib's `Cat`-valued
pseudofunctors extending `Pseudofunctor.IsStack`, never a record of classification conclusions; an
abelian banding is data with its conjugation and restriction compatibilities; coefficient sheaves
retain the displayed universes; the common-universe adapters are transported by the
`universeNormalizedGerbe` contract in the README when coefficients are independently sized; module descent is phrased on
Mathlib's `ModuleCat` descent data and compared with the tensor-overlap and comonad-coalgebra
presentations; the relative Picard sheaf is the fppf sheafification of `T ↦ Pic(X_T)`, and the
section-rigidified objects reuse Tau Ceti's `RigidifiedLineBundle`.
-/

open CategoryTheory Opposite Bicategory

universe v u' v' w h u uB uD uI vI fixture_u fixture_v conn_u conn_v chain_u chain_v chain_w t


namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

open CategoryTheory




/-! ## Layer 1: projective parameter spaces -/

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

/-- Hilbert--Serre uses lengths over Artinian coefficients and a genuine finite graded
polynomial module. Arbitrary unrelated sequences of finite modules do not satisfy it. -/
theorem exists_artinianHilbertPolynomial (A : Type u) [CommRing A] [IsArtinianRing A]
    (σ : Type u) [Fintype σ] (M : Type u) [AddCommGroup M] [Module A M]
    [Module (MvPolynomial σ A) M] [IsScalarTower A (MvPolynomial σ A) M]
    [Module.Finite (MvPolynomial σ A) M]
    (ℳ : ℕ → Submodule A M)
    [SetLike.GradedSMul (MvPolynomial.homogeneousSubmodule σ A) ℳ]
    [DirectSum.Decomposition ℳ] :
    (∀ n, Module.Finite A (ℳ n)) ∧
      ∃ (P : Polynomial ℚ) (N : ℕ), ∀ n, N ≤ n →
        P.eval (n : ℚ) = ((Module.length A (ℳ n)).toNat : ℚ) := by sorry

/-- `HilbertLengthChecks.dualNumbers`: the dual numbers have coefficient length two,
whereas their residue field has length one. -/
example (k : Type u) [Field k] :
    letI : Module (DualNumber k) k :=
      Module.compHom k (TrivSqZeroExt.fstHom k k k).toRingHom
    Module.length (DualNumber k) (DualNumber k) = 2 ∧
      Module.length (DualNumber k) k = 1 := by sorry

/-- `HilbertLengthChecks.field`: coefficients over a field have length one. -/
example (k : Type u) [Field k] : Module.length k k = 1 := by sorry

/-- `HilbertLengthChecks.zero`: the zero module has length zero, including over the zero ring. -/
example (A : Type u) [CommRing A] : Module.length A (Fin 0 → A) = 0 := by sorry

/-- `HilbertFunctionChecks.zero`: the zero vector space has dimension zero in every degree. -/
example (n : ℕ) : hilbertFunction ℚ (fun _ => Fin 0 → ℚ) n = 0 := by sorry

/-- `HilbertFunctionChecks.constant`: a rank-one graded piece has dimension one,
independently of its degree. -/
example (n : ℕ) : hilbertFunction ℚ (fun _ => Fin 1 → ℚ) n = 1 := by sorry

/-- `HilbertFunctionChecks.degreeTwo`: the binary degree-two monomials form a
three-dimensional piece, fixing dimension rather than the number of variables. -/
example : hilbertFunction ℚ (fun n => Fin (n + 1) → ℚ) 2 = 3 := by sorry

end ProjectiveParameterSpaces


namespace R09_1
open CategoryTheory CategoryTheory.Limits AlgebraicGeometry Scheme.Modules
open TauCeti.AlgebraicGeometry TauCeti.AlgebraicGeometry.Scheme.Modules
open scoped TensorProduct ZeroObject
noncomputable section
/-- Data for the quotient universal property, using the pinned invertible-sheaf carrier.
This is the data of a point of the target, not a second Grassmann functor. -/
structure LineQuotient {S T : Scheme.{u}} (f : T ⟶ S) (E : S.Modules) where
  /-- The invertible target line of the quotient on the test scheme. -/
  line : InvertibleSheaf T
  /-- The actual morphism from the pulled-back coefficient sheaf to that line. -/
  quotient : (Scheme.Modules.pullback f).obj E ⟶ line.obj
  /-- The quotient morphism is an epimorphism of module sheaves. -/
  surjective : Epi quotient

/-- Relative Proj of Sym E in the requested arbitrary-quasicoherent extension.
Projectivity and finite-presentation conclusions need the corresponding native sheaf
finiteness predicates and are not asserted by this carrier declaration. -/
def projectiveBundle (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent] : Scheme.{u} := by
  sorry

namespace projectiveBundle
variable (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent]
/-- `R09_1.projectiveBundle.projection`: The structure map π:P(E)→S. -/
def projection : projectiveBundle S E ⟶ S := by sorry
/-- The integer tensor power O(m) of the tautological quotient line on P(E), using the dual line for negative m. -/
def twistingSheaf (m : ℤ) : InvertibleSheaf (projectiveBundle S E) := by sorry
/-- `R09_1.projectiveBundle.universalQuotient`: The actual surjection π*E→O(1). -/
def universalQuotient :
    (Scheme.Modules.pullback (projection S E)).obj E ⟶ (twistingSheaf S E 1).obj := by sorry
/-- `R09_1.projectiveBundle.universalQuotient_epi`: The universal quotient is an epimorphism of native module sheaves. -/
theorem universalQuotient_epi : Epi (universalQuotient S E) := by sorry
/-- `R09_1.projectiveBundle.fromQuotient`: Construct the classifying map of an invertible quotient of f*E. -/
def fromQuotient {T : Scheme.{u}} (f : T ⟶ S) (q : LineQuotient f E) :
    T ⟶ projectiveBundle S E := by sorry
/-- `R09_1.projectiveBundle.fromQuotient_over`: The classifying map composed with the projection is f. -/
theorem fromQuotient_over {T : Scheme.{u}} (f : T ⟶ S) (q : LineQuotient f E) :
    fromQuotient S E f q ≫ projection S E = f := by sorry
/-- `R09_1.projectiveBundle.quotient_characterisation`: A map g over S is the classifying map of q exactly when pulling back the tautological quotient gives q up to an isomorphism of its line target. -/
theorem quotient_characterisation {T : Scheme.{u}} (f : T ⟶ S) (q : LineQuotient f E)
    (g : T ⟶ projectiveBundle S E) (hg : g ≫ projection S E = f)
    (e : (Scheme.Modules.pullback g).obj (twistingSheaf S E 1).obj ≅ q.line.obj)
    (he : (Scheme.Modules.pullbackComp g (projection S E)).inv.app E ≫
      (Scheme.Modules.pullback g).map (universalQuotient S E) ≫ e.hom =
      (Scheme.Modules.pullbackCongr hg).hom.app E ≫ q.quotient) :
    g = fromQuotient S E f q := by sorry
/-- `R09_1.projectiveBundle.baseChange`: P_T(f*E)≅P_S(E)×_S T, preserving the quotient. -/
def baseChange (T : Scheme.{u}) (f : T ⟶ S)
    [((Scheme.Modules.pullback f).obj E).IsQuasicoherent] :
    projectiveBundle T ((Scheme.Modules.pullback f).obj E) ≅
      Limits.pullback (projection S E) f := by sorry
/-- `R09_1.projectiveBundle.rankOne`: P_S(L)≅S for invertible L, with O(1) identified with L. -/
def rankOne (L : InvertibleSheaf S) [L.obj.IsQuasicoherent] :
    projectiveBundle S L.obj ≅ S := by sorry
end projectiveBundle

/-- The projective bundle of the free module of rank n+1; in particular P⁰ is the base scheme. -/
abbrev projectiveSpace (S : Scheme.{u}) (n : ℕ) :=
  projectiveBundle S (SheafOfModules.free (R := S.ringCatSheaf) (ULift.{u} (Fin (n + 1))))

namespace ProjectiveBundleTests
-- ProjectiveBundleTests.rankOne
/-- `ProjectiveBundleTests.rankOne`: For every invertible L, P(L)≅S; the O(1)=L comparison is additionally tested under TwistingSheafTests.rankOne. -/
example (S : Scheme.{u}) (L : InvertibleSheaf S) [L.obj.IsQuasicoherent] :
    Nonempty (projectiveBundle S L.obj ≅ S) := by sorry
-- ProjectiveBundleTests.zero
/-- `ProjectiveBundleTests.zero`: P(0)≅∅. -/
example (S : Scheme.{u}) :
    Nonempty (projectiveBundle S (SheafOfModules.free (R := S.ringCatSheaf) PEmpty.{u+1}) ≅
      Scheme.empty) := by sorry
-- ProjectiveBundleTests.rankTwo
/-- `ProjectiveBundleTests.rankTwo`: Over Spec R, points over the identity of P(O²) correspond to native rank-one quotient Grassmannian data for R². -/
example (k : Type u) [CommRing k] :
    Nonempty ({g : Spec (.of k) ⟶ projectiveSpace (Spec (.of k)) 1 //
      g ≫ projectiveBundle.projection (Spec (.of k))
        (SheafOfModules.free (R := (Spec (.of k)).ringCatSheaf) (ULift.{u} (Fin 2))) =
          𝟙 (Spec (.of k))} ≃ Module.Grassmannian k (Fin 2 → k) 1) := by sorry
-- ProjectiveBundleTests.baseChange
/-- `ProjectiveBundleTests.baseChange`: A nonflat base change also gives P(f*E)≅P(E)×_S T. -/
example {S T : Scheme.{u}} (f : T ⟶ S) (E : S.Modules) [E.IsQuasicoherent]
    [((Scheme.Modules.pullback f).obj E).IsQuasicoherent] :
    Nonempty (projectiveBundle T ((Scheme.Modules.pullback f).obj E) ≅
      Limits.pullback (projectiveBundle.projection S E) f) := by sorry
end ProjectiveBundleTests

namespace projectiveBundle.twistingSheaf
variable (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent]
/-- `R09_1.projectiveBundle.twistingSheaf.zero`: O(0)≅O. -/
def zero : (projectiveBundle.twistingSheaf S E 0).obj ≅
    SheafOfModules.unit (projectiveBundle S E).ringCatSheaf := by sorry
/-- `R09_1.projectiveBundle.twistingSheaf.add`: O(a)⊗O(b)≅O(a+b), with unit and associativity coherence. -/
def add (a b : ℤ) :
    Scheme.Modules.tensorProduct (projectiveBundle S E) (projectiveBundle.twistingSheaf S E a).obj
      (projectiveBundle.twistingSheaf S E b).obj ≅
      (projectiveBundle.twistingSheaf S E (a + b)).obj := by sorry
/-- `R09_1.projectiveBundle.twistingSheaf.pullback`: Every projective-bundle base-change isomorphism carries O(m) to O(m). -/
def pullback {T : Scheme.{u}} (f : T ⟶ S) [((Scheme.Modules.pullback f).obj E).IsQuasicoherent]
    (m : ℤ) :
    (Scheme.Modules.pullback (projectiveBundle.baseChange S E T f).hom).obj
      ((Scheme.Modules.pullback (Limits.pullback.fst
        (projectiveBundle.projection S E) f)).obj (projectiveBundle.twistingSheaf S E m).obj) ≅
      (projectiveBundle.twistingSheaf T ((Scheme.Modules.pullback f).obj E) m).obj := by sorry
end projectiveBundle.twistingSheaf

namespace TwistingSheafTests
-- TwistingSheafTests.zero
/-- `TwistingSheafTests.zero`: O(0) is the native structure-sheaf unit. -/
example (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent] :
    Nonempty ((projectiveBundle.twistingSheaf S E 0).obj ≅
      SheafOfModules.unit (projectiveBundle S E).ringCatSheaf) := by sorry
-- TwistingSheafTests.inverse
/-- `TwistingSheafTests.inverse`: O(1)⊗O(-1)≅O. -/
example (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent] :
    Nonempty (Scheme.Modules.tensorProduct (projectiveBundle S E) (projectiveBundle.twistingSheaf S E 1).obj
      (projectiveBundle.twistingSheaf S E (-1)).obj ≅
      SheafOfModules.unit (projectiveBundle S E).ringCatSheaf) := by sorry
-- TwistingSheafTests.rankOne
/-- `TwistingSheafTests.rankOne`: On P(L)≅S, O(1)≅L, rather than L inverse. -/
example (S : Scheme.{u}) (L : InvertibleSheaf S) [L.obj.IsQuasicoherent] :
    Nonempty ((Scheme.Modules.pullback (projectiveBundle.rankOne S L).inv).obj
      (projectiveBundle.twistingSheaf S L.obj 1).obj ≅ L.obj) := by sorry
end TwistingSheafTests


/-- Cup multiplication on twists; it is not a second definition of polynomial multiplication. -/
def twistMultiplication (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent]
    (a b : ℤ) (i j : ℕ) :
    Cohomology (projectiveBundle.twistingSheaf S E a).obj i →+
    Cohomology (projectiveBundle.twistingSheaf S E b).obj j →+
    Cohomology (projectiveBundle.twistingSheaf S E (a + b)).obj (i + j) := by sorry
namespace twistMultiplication
variable (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent]
/-- `R09_1.twistMultiplication.zero_left`: The cup map is zero when its first input is zero. -/
theorem zero_left (a b : ℤ) (i j : ℕ)
    (y : Cohomology (projectiveBundle.twistingSheaf S E b).obj j) :
    twistMultiplication S E a b i j 0 y = 0 := by sorry
/-- `R09_1.twistMultiplication.add_left`: The cup map is additive in each argument. -/
theorem add_left (a b : ℤ) (i j : ℕ)
    (x x' : Cohomology (projectiveBundle.twistingSheaf S E a).obj i)
    (y : Cohomology (projectiveBundle.twistingSheaf S E b).obj j) :
    twistMultiplication S E a b i j (x + x') y =
      twistMultiplication S E a b i j x y + twistMultiplication S E a b i j x' y := by sorry
/-- Tensor multiplication of sections through the canonical twisting-sheaf comparison. -/
def sectionProduct (a b : ℤ) :
    Γ((projectiveBundle.twistingSheaf S E a).obj, ⊤) →+
      Γ((projectiveBundle.twistingSheaf S E b).obj, ⊤) →+
      Γ((projectiveBundle.twistingSheaf S E (a + b)).obj, ⊤) := by sorry
/-- The actual structure-sheaf section 1 transported through O(0)≅O and H⁰≅Γ. -/
def unit : Cohomology (projectiveBundle.twistingSheaf S E 0).obj 0 :=
  (cohomologyZeroEquiv _).symm
    ((projectiveBundle.twistingSheaf.zero S E).inv.app ⊤
      (1 : Γ(projectiveBundle S E, ⊤)))
/-- The comparison uses the canonical product, rather than an arbitrary bilinear map. -/
theorem section_product (a b : ℤ)
    (x : Cohomology (projectiveBundle.twistingSheaf S E a).obj 0)
    (y : Cohomology (projectiveBundle.twistingSheaf S E b).obj 0) :
    cohomologyZeroEquiv _ (twistMultiplication S E a b 0 0 x y) =
      sectionProduct S E a b (cohomologyZeroEquiv _ x) (cohomologyZeroEquiv _ y) := by sorry
end twistMultiplication
namespace TwistMultiplicationTests
-- TwistMultiplicationTests.zero
/-- `TwistMultiplicationTests.zero`: Zero section times any class is zero. -/
example (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent]
    (y : Cohomology (projectiveBundle.twistingSheaf S E 0).obj 0) :
    twistMultiplication S E 0 0 0 0 0 y = 0 := by sorry
-- TwistMultiplicationTests.unit
/-- `TwistMultiplicationTests.unit`: The section 1 of O(0) acts as identity on H⁰(O(1)). -/
example (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent]
    (x : Cohomology (projectiveBundle.twistingSheaf S E 1).obj 0)
    : twistMultiplication S E 1 0 0 0 x (twistMultiplication.unit S E) = x := by sorry
-- TwistMultiplicationTests.topBoundary
/-- `TwistMultiplicationTests.topBoundary`: On P¹, H¹(O(-2)) times H⁰(O(1)) lands in zero H¹(O(-1)). -/
example (k : Type u) [Field k]
    (x : Cohomology (projectiveBundle.twistingSheaf (Spec (.of k))
      (SheafOfModules.free (R := (Spec (.of k)).ringCatSheaf) (ULift.{u} (Fin 2))) (-2)).obj 1)
    (y : Cohomology (projectiveBundle.twistingSheaf (Spec (.of k))
      (SheafOfModules.free (R := (Spec (.of k)).ringCatSheaf) (ULift.{u} (Fin 2))) 1).obj 0) :
    twistMultiplication _ _ (-2) 1 1 0 x y = 0 := by sorry
end TwistMultiplicationTests

/-- Relative very ampleness with the Stacks immersion convention, using supplied projective bundles.
In finite-presentation applications the coefficient sheaf can be chosen finite type. -/
def IsRelativelyVeryAmple {S X : Scheme.{u}} (f : X ⟶ S) (L : InvertibleSheaf X) : Prop :=
  ∃ (E : S.Modules) (_ : E.IsQuasicoherent) (i : X ⟶ projectiveBundle S E),
    IsImmersion i ∧ i ≫ projectiveBundle.projection S E = f ∧
      Nonempty ((Scheme.Modules.pullback i).obj (projectiveBundle.twistingSheaf S E 1).obj ≅ L.obj)
namespace IsRelativelyVeryAmple
variable {S X : Scheme.{u}} (f : X ⟶ S) (L : InvertibleSheaf X)
/-- `R09_1.IsRelativelyVeryAmple.of_embedding`: A specified immersion over S and pullback isomorphism witness relative very ampleness. -/
theorem of_embedding (E : S.Modules) [E.IsQuasicoherent]
    (i : X ⟶ projectiveBundle S E) [IsImmersion i]
    (hi : i ≫ projectiveBundle.projection S E = f)
    (e : (Scheme.Modules.pullback i).obj (projectiveBundle.twistingSheaf S E 1).obj ≅ L.obj) :
    IsRelativelyVeryAmple f L := by sorry
/-- Surjectivity of the actual counit of native pullback/pushforward. -/
theorem evaluation_epi [QuasiCompact f] [QuasiSeparated f]
    (h : IsRelativelyVeryAmple f L) :
    Epi ((Scheme.Modules.pullbackPushforwardAdjunction f).counit.app L.obj) := by sorry
/-- The line quotient is the actual evaluation map, not an arbitrary sheaf map. -/
def evaluationQuotient
    [Epi ((Scheme.Modules.pullbackPushforwardAdjunction f).counit.app L.obj)] :
    LineQuotient f ((Scheme.Modules.pushforward f).obj L.obj) where
  line := L
  quotient := (Scheme.Modules.pullbackPushforwardAdjunction f).counit.app L.obj
  surjective := inferInstance
/-- The canonical complete linear-system map. Quasi-coherence of the pushforward
is supplied by the coherent-sheaf owner under the quasi-compact/quasi-separated hypotheses. -/
def completeMap [((Scheme.Modules.pushforward f).obj L.obj).IsQuasicoherent]
    [Epi ((Scheme.Modules.pullbackPushforwardAdjunction f).counit.app L.obj)] :
    X ⟶ projectiveBundle S ((Scheme.Modules.pushforward f).obj L.obj) :=
  projectiveBundle.fromQuotient S _ f (evaluationQuotient f L)
/-- `R09_1.IsRelativelyVeryAmple.evaluation_criterion`: For quasi-compact quasi-separated f with quasi-coherent f_*L and epimorphic native evaluation, relative very ampleness is equivalent to the canonical completeMap being an immersion. -/
theorem evaluation_criterion [QuasiCompact f] [QuasiSeparated f]
    [((Scheme.Modules.pushforward f).obj L.obj).IsQuasicoherent]
    [Epi ((Scheme.Modules.pullbackPushforwardAdjunction f).counit.app L.obj)] :
    IsRelativelyVeryAmple f L ↔ IsImmersion (completeMap f L) := by sorry
/-- `R09_1.IsRelativelyVeryAmple.closed_of_proper`: A witnessing immersion is closed when f is proper. -/
theorem closed_of_proper [IsProper f] (E : S.Modules) [E.IsQuasicoherent]
    (i : X ⟶ projectiveBundle S E) [IsImmersion i]
    (hi : i ≫ projectiveBundle.projection S E = f) : IsClosedImmersion i := by sorry
end IsRelativelyVeryAmple
namespace VeryAmpleTests
-- VeryAmpleTests.projectiveSpace
/-- `VeryAmpleTests.projectiveSpace`: O(1) on every Pⁿ_S is relatively very ample. -/
example (S : Scheme.{u}) (n : ℕ) :
    IsRelativelyVeryAmple
      (projectiveBundle.projection S (SheafOfModules.free (R := S.ringCatSheaf)
        (ULift.{u} (Fin (n + 1)))))
      (projectiveBundle.twistingSheaf S (SheafOfModules.free (R := S.ringCatSheaf)
        (ULift.{u} (Fin (n + 1)))) 1) := by sorry
-- VeryAmpleTests.veronese
/-- `VeryAmpleTests.veronese`: O(2) on P¹_k is relatively very ample; the positive-power case differs from the globally generated trivial line. -/
example (k : Type u) [Field k] :
    IsRelativelyVeryAmple (projectiveBundle.projection (Spec (.of k))
      (SheafOfModules.free (R := (Spec (.of k)).ringCatSheaf) (ULift.{u} (Fin 2))))
      (projectiveBundle.twistingSheaf (Spec (.of k))
        (SheafOfModules.free (R := (Spec (.of k)).ringCatSheaf) (ULift.{u} (Fin 2))) 2) := by sorry
-- VeryAmpleTests.trivialNotVeryAmple
/-- `VeryAmpleTests.trivialNotVeryAmple`: O on P¹_k is globally generated but not very ample. -/
example (k : Type u) [Field k] :
    ¬ IsRelativelyVeryAmple (projectiveBundle.projection (Spec (.of k))
      (SheafOfModules.free (R := (Spec (.of k)).ringCatSheaf) (ULift.{u} (Fin 2))))
      (projectiveBundle.twistingSheaf (Spec (.of k))
        (SheafOfModules.free (R := (Spec (.of k)).ringCatSheaf) (ULift.{u} (Fin 2))) 0) := by sorry
end VeryAmpleTests

/-- The exponent basis is specified, including the rank-one projective-space exception. -/
def projectiveTwistBasis (n q : ℕ) (m : ℤ) : Type :=
  {e : Fin (n + 1) → ℤ // (∑ i, e i) = m ∧
    ((q = 0 ∧ (n = 0 ∨ ∀ i, 0 ≤ e i)) ∨ (0 < n ∧ q = n ∧ ∀ i, e i < 0))}
/-- Identify the new projective-bundle carrier with the imported SF.2 Laurent Čech computation; include the dimension-zero exception. -/
def projectiveBundle.projectiveSpaceCechComparison (A : Type u) [CommRing A] (n : ℕ) (m : ℤ) (q : ℕ) :
    Cohomology (projectiveBundle.twistingSheaf (Spec (.of A))
      (SheafOfModules.free (R := (Spec (.of A)).ringCatSheaf)
        (ULift.{u} (Fin (n + 1)))) m).obj q ≃+
      (projectiveTwistBasis n q m →₀ A) := by sorry
namespace ProjectiveTwistCohomologyTests
-- ProjectiveTwistCohomologyTests.pointNegative
/-- `ProjectiveTwistCohomologyTests.pointNegative`: H⁰(P⁰_A,O(-7)) is additively equivalent to A over every commutative ring A. -/
example (A : Type u) [CommRing A] :
    Nonempty (Cohomology (projectiveBundle.twistingSheaf (Spec (.of A))
      (SheafOfModules.free (R := (Spec (.of A)).ringCatSheaf)
        (ULift.{u} (Fin 1))) (-7)).obj 0 ≃+ A) := by sorry
-- ProjectiveTwistCohomologyTests.topLine
/-- `ProjectiveTwistCohomologyTests.topLine`: H¹(P¹_A,O(-2)) is additively equivalent to A. -/
example (A : Type u) [CommRing A] :
    Nonempty (Cohomology (projectiveBundle.twistingSheaf (Spec (.of A))
      (SheafOfModules.free (R := (Spec (.of A)).ringCatSheaf)
        (ULift.{u} (Fin 2))) (-2)).obj 1 ≃+ A) := by sorry
-- ProjectiveTwistCohomologyTests.lineBoundary
/-- `ProjectiveTwistCohomologyTests.lineBoundary`: H¹(P¹_A,O(-1)) is zero. -/
example (A : Type u) [CommRing A] :
    Subsingleton (Cohomology (projectiveBundle.twistingSheaf (Spec (.of A))
      (SheafOfModules.free (R := (Spec (.of A)).ringCatSheaf)
        (ULift.{u} (Fin 2))) (-1)).obj 1) := by sorry
end ProjectiveTwistCohomologyTests


/-- Regularity uses the actual twists of one sheaf on projective space. -/
def IsCMRegular (k : Type u) [Field k] (n : ℕ)
    (F : (projectiveSpace (Spec (.of k)) n).Modules) (m : ℤ) : Prop :=
  ∀ i : ℕ, 0 < i → Subsingleton (Cohomology
    (Scheme.Modules.tensorProduct _ F
      (projectiveBundle.twistingSheaf (Spec (.of k))
        (SheafOfModules.free (R := (Spec (.of k)).ringCatSheaf)
          (ULift.{u} (Fin (n + 1)))) (m - (i : ℤ))).obj) i)

/-- Mumford regularity is preserved by increasing the index for a finitely presented sheaf. -/
theorem IsCMRegular.monotone (k : Type u) [Field k] (n : ℕ)
    (F : (projectiveSpace (Spec (.of k)) n).Modules) [F.IsFinitePresentation]
    (m r : ℤ) (h : IsCMRegular k n F m) (hmr : m ≤ r) :
    IsCMRegular k n F r := by sorry

/-- On the projective line O(a) is m-regular exactly when a+m is nonnegative. -/
example (k : Type u) [Field k] (a m : ℤ) :
    IsCMRegular k 1 (projectiveBundle.twistingSheaf (Spec (.of k))
      (SheafOfModules.free (R := (Spec (.of k)).ringCatSheaf)
        (ULift.{u} (Fin 2))) a).obj m ↔ 0 ≤ a + m := by sorry

/-- The zero sheaf is regular at every index. -/
example (k : Type u) [Field k] (n : ℕ) (m : ℤ) :
    IsCMRegular k n (0 : (projectiveSpace (Spec (.of k)) n).Modules) m := by sorry

/-- On projective dimension zero there is no higher-cohomology constraint. -/
example (k : Type u) [Field k] (F : (projectiveSpace (Spec (.of k)) 0).Modules) (m : ℤ) :
    IsCMRegular k 0 F m := by sorry
/-- Finite cutoff from degrees <N to degrees ≤pN. Every matrix coefficient is 0 or 1;
the associated native R-linear map fixes coefficients and multiplies monomial exponents. -/
def coefficientFrobeniusCutoff (R : Type u) [CommRing R] (p N : ℕ) :
    (Fin N → R) →ₗ[R] (Fin (p * N + 1) → R) :=
  Matrix.mulVecLin (fun (i : Fin (p * N + 1)) (j : Fin N) =>
    if i.val = p * j.val then (1 : R) else 0)
/-- A coefficient t remains t, including when t^p differs from t. -/
theorem coefficientFrobeniusLattice (R : Type u) [CommRing R] (p N : ℕ)
    (j : Fin N) (t : R) :
    coefficientFrobeniusCutoff R p N (Pi.single j t) =
      fun i => if i.val = p * j.val then t else 0 := by sorry
namespace CoefficientFrobeniusTests
-- CoefficientFrobeniusTests.zero
/-- `CoefficientFrobeniusTests.zero`: The native coefficient-linear cutoff map carries the zero vector to zero. -/
example (R : Type u) [CommRing R] (p N : ℕ) :
    coefficientFrobeniusCutoff R p N 0 = 0 := by sorry
-- CoefficientFrobeniusTests.monomial
/-- `CoefficientFrobeniusTests.monomial`: A coefficient t at exponent j is carried unchanged to exponent pj in the larger target cutoff. -/
example (R : Type u) [CommRing R] (p N : ℕ) (j : Fin N)
    (i : Fin (p * N + 1)) (hi : i.val = p * j.val) (t : R) :
    coefficientFrobeniusCutoff R p N (Pi.single j t) i = t := by sorry
-- CoefficientFrobeniusTests.nonFixedCoefficient
/-- `CoefficientFrobeniusTests.nonFixedCoefficient`: In characteristic p with t^p≠t, the constant coefficient of the cutoff image is t and differs from t^p. -/
example (p : ℕ) (hp : p.Prime) (k : Type u) [Field k] [CharP k p]
    (t : k) (h : t ^ p ≠ t) :
    coefficientFrobeniusCutoff k p 1 (fun _ => t) 0 ≠ t ^ p := by sorry
end CoefficientFrobeniusTests


end
end R09_1


/-! ## Layer 2: Hom, Isom and coherent dévissage -/

namespace HomIsom

open AlgebraicGeometry

variable (k : Type u) [Field k]

/-- The closed point `Spec k → Spec k[ε]` of the dual numbers. It represents the degree-one Hilbert
functor of itself over `Spec k[ε]`; its universal family is the identity. -/
noncomputable def dualNumberPoint :
    Spec (CommRingCat.of k) ⟶ Spec (CommRingCat.of (DualNumber k)) :=
  Spec.map (CommRingCat.ofHom (TrivSqZeroExt.fstHom k k k).toRingHom)

/-- `HilbertTests.universalFlat`: the universal family of the degree-one Hilbert functor of the closed point is flat
(it is an identity). -/
example : Flat (𝟙 (Spec (CommRingCat.of k))) := inferInstance

/-- The parameter morphism `Spec k → Spec k[ε]` is not flat: flatness of the universal family does
not transfer to the parameter morphism. -/
theorem not_flat_dualNumberPoint : ¬ Flat (dualNumberPoint k) := sorry

/-- `HilbertTests.nonflatParameter`: the augmentation point is not flat over the dual numbers,
although its degree-one universal family is the flat identity. -/
example : ¬ Flat (dualNumberPoint k) := by sorry

/-- `HilbertTests.augmentation`: the closed-point map kills epsilon and preserves the unit,
so it differs from an isomorphism of the dual-number base. -/
example : (TrivSqZeroExt.fstHom k k k).toRingHom (DualNumber.eps : DualNumber k) = 0 ∧
    (TrivSqZeroExt.fstHom k k k).toRingHom (1 : DualNumber k) = 1 := by sorry


end HomIsom




/-! ## Layer 3: effective descent and finite-source restriction -/

open _root_.AlgebraicGeometry

-- Test: AffinePullbackTests.nonflat. The original mono becomes zero on a
-- nonzero sheaf after the nonflat base change Z → Z/2Z.
/-- `AffinePullbackTests.nonflat`: For Z→Z/2Z, the comparison exists without flatness. Multiplication by 2 on tilde(Z) is a monomorphism, whereas its pullback is the zero endomorphism of the nonzero sheaf tilde(Z/2Z) and is not a monomorphism. Thus tensor pullback is right exact and cannot be treated as exact. -/
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

/-- `QCohPseudofunctor.fibre`: The fibre at X is the full subcategory defined by baseline IsQuasicoherent. -/
theorem QCohPseudofunctor.fibre (X : Scheme.{u}) :
    QCohPseudofunctor.obj (.mk (op X)) =
      Cat.of (SheafOfModules.isQuasicoherent X.ringCatSheaf).FullSubcategory := by
  sorry

-- Test: QCohPseudoTests.infiniteModule. A particular infinite free module
-- is admitted, and its failure of finite generation is part of the check.
/-- `QCohPseudoTests.infiniteModule`: The direct sum of countably many copies of R on Spec R is admitted even though it is not finitely generated when R is a field. -/
example (K : Type u) [Field K] :
    (tilde (R := CommRingCat.of K) (ModuleCat.of K (ℕ →₀ K))).IsQuasicoherent ∧
      ¬ Module.Finite K (ℕ →₀ K) := by
  sorry

-- Test: QCohPseudoTests.nonInvertibleArrow. Test the sheaf-module
-- arrow; a failure of invertibility only in ModuleCat would be weaker.
/-- `QCohPseudoTests.nonInvertibleArrow`: Multiplication by 2 on O_SpecZ is a fibre morphism, and is not an isomorphism; the category is not truncated to its core. -/
example : ¬ IsIso ((tilde.functor (CommRingCat.of ℤ)).map
    (ModuleCat.ofHom (2 • LinearMap.id : ℤ →ₗ[ℤ] ℤ))) := by
  sorry



open TensorProduct

/-- Finite presentation of a module descends along a faithfully flat scalar extension. -/
theorem finite_presentation_of_faithfully_flat
    {R S M : Type u} [CommRing R] [CommRing S] [Algebra R S]
    [AddCommGroup M] [Module R M] [Module.FaithfullyFlat R S]
    [Module.FinitePresentation S (S ⊗[R] M)] :
    Module.FinitePresentation R M := by
  sorry


namespace ModuleDescentBridge

open CategoryTheory

variable {R S : Type uB} [CommRing R] [CommRing S] (f : R →+* S)

/-- The scalar-extension comonad is restriction followed by extension; its counit is the adjunction counit and its comultiplication is extension of the unit. -/
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

/-- The comonad comparison extends the underlying module, uses extension of the unit as coaction, and extends every module map. -/
theorem overlap_comparison_canonical {M M' : ModuleCat.{uB} R} (h : M ⟶ M') :
    (((Comonad.comparison (ModuleCat.extendRestrictScalarsAdj f)).obj M).A =
      (ModuleCat.extendScalars f).obj M) ∧
    (((Comonad.comparison (ModuleCat.extendRestrictScalarsAdj f)).obj M).a =
      (ModuleCat.extendScalars f).map
        ((ModuleCat.extendRestrictScalarsAdj f).unit.app M)) ∧
    (((Comonad.comparison (ModuleCat.extendRestrictScalarsAdj f)).map h).f =
      (ModuleCat.extendScalars f).map h) := by
  sorry

/-- `ModuleCoalgebraChecks.counit`: following the coaction by the scalar-extension counit recovers the original module element. -/
example (K : (ModuleCat.extendRestrictScalarsAdj f).toComonad.Coalgebra) :
    K.a ≫ (ModuleCat.extendRestrictScalarsAdj f).toComonad.ε.app K.A = 𝟙 K.A := by
  sorry

/-- `ModuleCoalgebraChecks.coassociativity`: the two ways of applying the coaction twice agree. -/
example (K : (ModuleCat.extendRestrictScalarsAdj f).toComonad.Coalgebra) :
    K.a ≫ (ModuleCat.extendRestrictScalarsAdj f).toComonad.δ.app K.A =
      K.a ≫ (ModuleCat.extendRestrictScalarsAdj f).toComonad.map K.a := by
  sorry

/-- `ModuleCoalgebraChecks.arrows`: every coalgebra morphism intertwines coactions, including noninvertible module maps. -/
example {K K' : (ModuleCat.extendRestrictScalarsAdj f).toComonad.Coalgebra}
    (h : K ⟶ K') :
    K.a ≫ (ModuleCat.extendRestrictScalarsAdj f).toComonad.map h.f =
      h.f ≫ K'.a := by
  sorry

/-- `ModuleCoalgebraChecks.identity`: the identity coalgebra morphism has the identity underlying module map. -/
example (K : (ModuleCat.extendRestrictScalarsAdj f).toComonad.Coalgebra) :
    (𝟙 K : K ⟶ K).f = 𝟙 K.A := by
  sorry

end ModuleDescentBridge

namespace ModuleDescentAllTests

open CategoryTheory Opposite


noncomputable section

-- Transport the pseudofunctor; this is not a second module category.
/-- The native module pseudofunctor, indexed by opposite affine arrows so that restriction is extension of scalars. -/
abbrev affineModulePullback :
    Pseudofunctor (LocallyDiscrete CommRingCat.{uD}ᵒᵖᵒᵖ) Cat :=
  (CategoryTheory.unopUnop CommRingCat.{uD}).toPseudofunctor.comp
    CommRingCat.moduleCatExtendScalarsPseudofunctor

variable {R A : Type uD} [CommRing R] [CommRing A]

/-- The category of native module descent data for the singleton affine arrow Spec A → Spec R. Morphisms are all compatible module maps. -/
abbrev NativeData (f : R →+* A) :=
  affineModulePullback.DescentData
    (fun (_ : PUnit) ↦ (CommRingCat.ofHom f).op)

-- The coalgebra carrier is retained.
/-- Coalgebras of the extension/restriction-of-scalars comonad on A-modules, including their coactions and all coalgebra morphisms. -/
abbrev NativeCoalgebra (f : R →+* A) :=
  (ModuleCat.extendRestrictScalarsAdj f).toComonad.Coalgebra

-- Projection helper to state the comparison's underlying-module compatibility.
/-- Forget the overlap isomorphisms of singleton affine descent data and retain its A-module and underlying module maps. -/
def forgetNativeData (f : R →+* A) : NativeData f ⥤ ModuleCat.{uD} A := by
  sorry

-- Construct via DescentData'.descentDataEquivalence and the
-- module-specific chosen-overlap adapter; no arbitrary coherence assumption.
/-- Identify native affine descent data with scalar-extension comonad coalgebras, using the tensor overlap isomorphism and its cocycle. -/
def nativeCoalgebraEquivalence (f : R →+* A) :
    NativeData f ≌ NativeCoalgebra f := by
  sorry

/-- The overlap-to-coalgebra equivalence preserves the underlying A-module through a natural isomorphism of forgetful functors. -/
def nativeCoalgebraEquivalenceForget (f : R →+* A) :
    (nativeCoalgebraEquivalence f).functor ⋙
      Comonad.forget (ModuleCat.extendRestrictScalarsAdj f).toComonad ≅
    forgetNativeData f := by
  sorry

/-- The canonical descent functor corresponds naturally to the comonad comparison functor, on objects and every module morphism. -/
def nativeCanonicalComparison (f : R →+* A) :
    affineModulePullback.toDescentData
        (fun (_ : PUnit) ↦ (CommRingCat.ofHom f).op) ⋙
      (nativeCoalgebraEquivalence f).functor ≅
    Comonad.comparison (ModuleCat.extendRestrictScalarsAdj f) := by
  sorry

-- This is the exact canonical-functor equivalence signature.
/-- For a faithfully flat ring map, the canonical native module descent functor is an equivalence of categories. -/
theorem nativeFaithfullyFlatDescent (f : R →+* A) (hf : f.FaithfullyFlat) :
    (affineModulePullback.toDescentData
      (fun (_ : PUnit) ↦ (CommRingCat.ofHom f).op)).IsEquivalence := by
  sorry

-- Object comparisons retain every module morphism.
/-- `ModuleNativeChecks.object`: the canonical native descent object corresponds to the canonical scalar-extension coalgebra. -/
example (f : R →+* A) (M : ModuleCat.{uD} R) :
    Nonempty (((nativeCoalgebraEquivalence f).functor.obj
      ((affineModulePullback.toDescentData
        (fun (_ : PUnit) ↦ (CommRingCat.ofHom f).op)).obj M)) ≅
      (Comonad.comparison (ModuleCat.extendRestrictScalarsAdj f)).obj M) := by
  sorry

/-- `ModuleNativeChecks.roundtrip`: converting an arbitrary native descent object to a coalgebra and back recovers that object up to isomorphism. -/
example (f : R →+* A) (D : NativeData f) :
    Nonempty ((nativeCoalgebraEquivalence f).inverse.obj
      ((nativeCoalgebraEquivalence f).functor.obj D) ≅ D) := by
  sorry

/-- `ModuleNativeChecks.arrows`: the canonical native descent functor extends every module map, including noninvertible maps. -/
example (f : R →+* A) {M N : ModuleCat.{uD} R} (h : M ⟶ N) :
    ((affineModulePullback.toDescentData
      (fun (_ : PUnit) ↦ (CommRingCat.ofHom f).op)).map h).hom PUnit.unit =
      (ModuleCat.extendScalars f).map h := by
  sorry

end

end ModuleDescentAllTests


open CategoryTheory CategoryTheory.Limits AlgebraicGeometry Opposite
noncomputable section
namespace ModuliDescent
/-- Presheaves of sets on the big scheme category, with scheme universes fixed throughout the finite-source constructions. -/
abbrev P := Scheme.{u}ᵒᵖ ⥤ Type u

variable {B Z X : P.{u}} (f : Z ⟶ B) (x : X ⟶ B)
    (hf : yoneda.relativelyRepresentable f)

/-- Relative morphisms, with the test scheme and its map to the base retained. -/
def relativeHom : P.{u} where
  obj T := Σ a : B.obj T,
    { b : X.obj (op (hf.pullback (yonedaEquiv.symm a))) //
      x.app (op (hf.pullback (yonedaEquiv.symm a))) b = yonedaEquiv (hf.fst (yonedaEquiv.symm a) ≫ f) }
  map := sorry
  map_id := sorry
  map_comp := sorry

/-- The projection sends (a,b) to a and is natural on schemes. -/
def relativeHomToBase : relativeHom f x hf ⟶ B where
  app T := TypeCat.ofHom fun s => s.1
  naturality := sorry

/-- Evaluation at T identifies points with precisely the pairs in the definition. -/
theorem relativeHom_points (T : Scheme.{u}) :
    Nonempty ((relativeHom f x hf).obj (op T) ≃
      Σ a : B.obj (op T),
        { b : X.obj (op (hf.pullback (yonedaEquiv.symm a))) //
          x.app (op (hf.pullback (yonedaEquiv.symm a))) b = yonedaEquiv (hf.fst (yonedaEquiv.symm a) ≫ f) }) := sorry

/-- For g:T′→T and the unique fibre map h:Z_T′→Z_T, restriction sends (a,b) to (a|T′,b∘h). Both maps to Z and to T must commute. -/
theorem relativeHom_map_points {T T' : Scheme.{u}} (g : T' ⟶ T)
    (a : B.obj (op T))
    (b : X.obj (op (hf.pullback (yonedaEquiv.symm a))))
    (hb : x.app _ b = yonedaEquiv (hf.fst (yonedaEquiv.symm a) ≫ f))
    (h : hf.pullback (yonedaEquiv.symm (B.map g.op a)) ⟶ hf.pullback (yonedaEquiv.symm a))
    (hh : yoneda.map h ≫ hf.fst (yonedaEquiv.symm a) = hf.fst (yonedaEquiv.symm (B.map g.op a)))
    (hs : h ≫ hf.snd (yonedaEquiv.symm a) = hf.snd (yonedaEquiv.symm (B.map g.op a)) ≫ g) :
    (relativeHom f x hf).map g.op ⟨a, ⟨b, hb⟩⟩ =
      ⟨B.map g.op a, ⟨X.map h.op b, by sorry⟩⟩ := sorry

/-- Two points coincide when their base points coincide and their maps b coincide after transport between the chosen fibres. -/
theorem relativeHom_ext (T : Scheme.{u})
    (s t : (relativeHom f x hf).obj (op T)) (ha : s.1 = t.1)
    (hb : HEq s.2.1 t.2.1) : s = t := sorry

/-- For any presheaf V with v:V→B, maps V→Mor_B(Z,X) over B are naturally equivalent to maps V×_B Z→X over B. In objects over B, relative Hom is right adjoint to V↦V×_B Z, with that product regarded over B. -/
def relativeHomHomEquiv {V : P.{u}} (v : V ⟶ B) :
    { c : V ⟶ relativeHom f x hf // c ≫ relativeHomToBase f x hf = v } ≃
      { b : pullback v f ⟶ X // b ≫ x = pullback.fst v f ≫ v } := sorry

/-- The universal-property equivalence evaluates to the morphism stored by a point. -/
theorem relativeHomHomEquiv_points (T : Scheme.{u}) (a : B.obj (op T))
    (b : X.obj (op (hf.pullback (yonedaEquiv.symm a))))
    (hb : x.app _ b = yonedaEquiv (hf.fst (yonedaEquiv.symm a) ≫ f)) :
    let v := yonedaEquiv.symm a
    let c := yonedaEquiv.symm
      (⟨a, ⟨b, hb⟩⟩ : (relativeHom f x hf).obj (op T))
    pullback.lift (yoneda.map (hf.snd v)) (hf.fst v) (hf.isPullback v).w.symm ≫
      ((relativeHomHomEquiv f x hf v) ⟨c, by sorry⟩).val =
        yonedaEquiv.symm b := sorry

/-- An actual target morphism over the relevant base induces postcomposition, retaining the base point. -/
def relativeHomMap {X' : P.{u}} (x' : X' ⟶ B) (m : X ⟶ X') (hm : m ≫ x' = x) :
    relativeHom f x hf ⟶ relativeHom f x' hf := sorry

/-- On a point (a,b), target postcomposition with m gives exactly (a,m∘b). -/
theorem relativeHomMap_points {X' : P.{u}} (x' : X' ⟶ B) (m : X ⟶ X') (hm : m ≫ x' = x)
    (T : Scheme.{u}) (a : B.obj (op T))
    (b : X.obj (op (hf.pullback (yonedaEquiv.symm a))))
    (hb : x.app _ b = yonedaEquiv (hf.fst (yonedaEquiv.symm a) ≫ f)) :
    (relativeHomMap f x hf x' m hm).app (op T) ⟨a, ⟨b, hb⟩⟩ =
      ⟨a, ⟨m.app _ b, by sorry⟩⟩ := sorry

/-- The map induced by the identity target morphism is the identity. -/
theorem relativeHomMap_id : relativeHomMap f x hf x (𝟙 X) (by simp) = 𝟙 _ := sorry

/-- The map induced by m followed by m′ equals the composite of their induced maps, with the given base triangles transported. -/
theorem relativeHomMap_comp {X' X'' : P.{u}} (x' : X' ⟶ B) (x'' : X'' ⟶ B)
    (m : X ⟶ X') (m' : X' ⟶ X'') (hm : m ≫ x' = x) (hm' : m' ≫ x'' = x') :
    relativeHomMap f x hf x'' (m ≫ m') (by rw [Category.assoc, hm', hm]) =
      relativeHomMap f x hf x' m hm ≫ relativeHomMap f x' hf x'' m' hm' := sorry

-- test: TauCeti.AlgebraicGeometry.ModuliDescent.relativeHom_identity
/-- `TauCeti.AlgebraicGeometry.ModuliDescent.relativeHom_identity`: For Z=B and f the identity, Mor_B(B,X) is canonically X over B. -/
example (x : X ⟶ B) (hf : yoneda.relativelyRepresentable (𝟙 B)) :
    ∃ e : relativeHom (𝟙 B) x hf ≅ X,
      e.hom ≫ x = relativeHomToBase (𝟙 B) x hf := sorry

-- test: TauCeti.AlgebraicGeometry.ModuliDescent.relativeHom_empty
/-- `TauCeti.AlgebraicGeometry.ModuliDescent.relativeHom_empty`: For Z the empty scheme presheaf, Mor_B(Z,X) is canonically B, even if X is empty. -/
example (B X : P.{u}) (f : yoneda.obj Scheme.empty.{u} ⟶ B) (x : X ⟶ B)
    (hf : yoneda.relativelyRepresentable f)
    (hX : Presheaf.IsSheaf Scheme.fppfTopology X) :
    ∃ e : relativeHom f x hf ≅ B, e.hom = relativeHomToBase f x hf := sorry

-- test: TauCeti.AlgebraicGeometry.ModuliDescent.relativeHom_split_two
/-- `TauCeti.AlgebraicGeometry.ModuliDescent.relativeHom_split_two`: For B a scheme and Z=B disjoint union B, Mor_B(Z,X) is canonically X×_B X; two independent maps are retained. -/
example (S : Scheme.{u}) (x : X ⟶ yoneda.obj S)
    (hf : yoneda.relativelyRepresentable
      (yoneda.map (coprod.desc (𝟙 S) (𝟙 S))))
    (hX : Presheaf.IsSheaf Scheme.fppfTopology X) :
    ∃ e : relativeHom (yoneda.map (coprod.desc (𝟙 S) (𝟙 S))) x hf ≅ pullback x x,
      e.hom ≫ pullback.fst x x ≫ x =
        relativeHomToBase (yoneda.map (coprod.desc (𝟙 S) (𝟙 S))) x hf := sorry

variable (z : X ⟶ Z)

/-- The presheaf of sections over the finite source after base change. Its points retain both the base point and the section over that point. -/
def weilRestriction : P.{u} where
  obj T := Σ a : B.obj T,
    { b : X.obj (op (hf.pullback (yonedaEquiv.symm a))) //
      z.app (op (hf.pullback (yonedaEquiv.symm a))) b = yonedaEquiv (hf.fst (yonedaEquiv.symm a)) }
  map := sorry
  map_id := sorry
  map_comp := sorry

/-- The structural map sends (a,b) to a. -/
def weilRestrictionToBase : weilRestriction f hf z ⟶ B where
  app T := TypeCat.ofHom fun s => s.1
  naturality := sorry

/-- Evaluation at T identifies sections with pairs whose map to Z is exactly pr_Z. -/
theorem weilRestriction_points (T : Scheme.{u}) :
    Nonempty ((weilRestriction f hf z).obj (op T) ≃
      Σ a : B.obj (op T),
        { b : X.obj (op (hf.pullback (yonedaEquiv.symm a))) //
          z.app (op (hf.pullback (yonedaEquiv.symm a))) b = yonedaEquiv (hf.fst (yonedaEquiv.symm a)) }) := sorry

/-- Along g:T′→T restriction precomposes b with the canonical fibre map, commuting both with Z and with the test base. -/
theorem weilRestriction_map_points {T T' : Scheme.{u}} (g : T' ⟶ T)
    (a : B.obj (op T)) (b : X.obj (op (hf.pullback (yonedaEquiv.symm a))))
    (hb : z.app _ b = yonedaEquiv (hf.fst (yonedaEquiv.symm a)))
    (h : hf.pullback (yonedaEquiv.symm (B.map g.op a)) ⟶ hf.pullback (yonedaEquiv.symm a))
    (hh : yoneda.map h ≫ hf.fst (yonedaEquiv.symm a) = hf.fst (yonedaEquiv.symm (B.map g.op a)))
    (hs : h ≫ hf.snd (yonedaEquiv.symm a) = hf.snd (yonedaEquiv.symm (B.map g.op a)) ≫ g) :
    (weilRestriction f hf z).map g.op ⟨a, ⟨b, hb⟩⟩ =
      ⟨B.map g.op a, ⟨X.map h.op b, by sorry⟩⟩ := sorry

/-- Equality of base points and of section morphisms after transport implies equality of points. -/
theorem weilRestriction_ext (T : Scheme.{u})
    (s t : (weilRestriction f hf z).obj (op T)) (ha : s.1 = t.1)
    (hb : HEq s.2.1 t.2.1) : s = t := sorry

/-- For any presheaf V→B, maps V→Res_{Z/B}(X) over B are naturally equivalent to maps V×_B Z→X over Z. -/
def weilRestrictionHomEquiv {V : P.{u}} (v : V ⟶ B) :
    { c : V ⟶ weilRestriction f hf z // c ≫ weilRestrictionToBase f hf z = v } ≃
      { b : pullback v f ⟶ X // b ≫ z = pullback.snd v f } := sorry

/-- The universal-property equivalence evaluates to the actual Z-section stored by a point. -/
theorem weilRestrictionHomEquiv_points (T : Scheme.{u}) (a : B.obj (op T))
    (b : X.obj (op (hf.pullback (yonedaEquiv.symm a))))
    (hb : z.app _ b = yonedaEquiv (hf.fst (yonedaEquiv.symm a))) :
    let v := yonedaEquiv.symm a
    let c := yonedaEquiv.symm
      (⟨a, ⟨b, hb⟩⟩ : (weilRestriction f hf z).obj (op T))
    pullback.lift (yoneda.map (hf.snd v)) (hf.fst v) (hf.isPullback v).w.symm ≫
      ((weilRestrictionHomEquiv f hf z v) ⟨c, by sorry⟩).val =
        yonedaEquiv.symm b := sorry

/-- An actual target morphism over the relevant base induces postcomposition, retaining the base point. -/
def weilRestrictionMap {X' : P.{u}} (z' : X' ⟶ Z) (m : X ⟶ X') (hm : m ≫ z' = z) :
    weilRestriction f hf z ⟶ weilRestriction f hf z' := sorry

/-- On a point (a,b), target postcomposition with m gives exactly (a,m∘b). -/
theorem weilRestrictionMap_points {X' : P.{u}} (z' : X' ⟶ Z) (m : X ⟶ X') (hm : m ≫ z' = z)
    (T : Scheme.{u}) (a : B.obj (op T))
    (b : X.obj (op (hf.pullback (yonedaEquiv.symm a))))
    (hb : z.app _ b = yonedaEquiv (hf.fst (yonedaEquiv.symm a))) :
    (weilRestrictionMap f hf z z' m hm).app (op T) ⟨a, ⟨b, hb⟩⟩ =
      ⟨a, ⟨m.app _ b, by sorry⟩⟩ := sorry

/-- The map induced by the identity target morphism is the identity. -/
theorem weilRestrictionMap_id : weilRestrictionMap f hf z z (𝟙 X) (by simp) = 𝟙 _ := sorry

/-- The map induced by m followed by m′ equals the composite of their induced maps, with the given base triangles transported. -/
theorem weilRestrictionMap_comp {X' X'' : P.{u}} (z' : X' ⟶ Z) (z'' : X'' ⟶ Z)
    (m : X ⟶ X') (m' : X' ⟶ X'') (hm : m ≫ z' = z) (hm' : m' ≫ z'' = z') :
    weilRestrictionMap f hf z z'' (m ≫ m') (by rw [Category.assoc, hm', hm]) =
      weilRestrictionMap f hf z z' m hm ≫ weilRestrictionMap f hf z' z'' m' hm' := sorry

-- test: TauCeti.AlgebraicGeometry.ModuliDescent.weilRestriction_identity
/-- `TauCeti.AlgebraicGeometry.ModuliDescent.weilRestriction_identity`: For f the identity of B, Res_{B/B}(X) is canonically X over B. -/
example (z : X ⟶ B) (hf : yoneda.relativelyRepresentable (𝟙 B)) :
    ∃ e : weilRestriction (𝟙 B) hf z ≅ X,
      e.hom ≫ z = weilRestrictionToBase (𝟙 B) hf z := sorry

-- test: TauCeti.AlgebraicGeometry.ModuliDescent.weilRestriction_terminal
/-- `TauCeti.AlgebraicGeometry.ModuliDescent.weilRestriction_terminal`: For X=Z with z the identity, Res_{Z/B}(Z) is canonically B over B. -/
example : ∃ e : weilRestriction f hf (𝟙 Z) ≅ B,
    e.hom = weilRestrictionToBase f hf (𝟙 Z) := sorry

-- test: TauCeti.AlgebraicGeometry.ModuliDescent.weilRestriction_empty
/-- `TauCeti.AlgebraicGeometry.ModuliDescent.weilRestriction_empty`: For Z=X empty, restriction is B, including nonempty B; it is not the empty functor. -/
example (B : P.{u}) (f : yoneda.obj Scheme.empty.{u} ⟶ B)
    (hf : yoneda.relativelyRepresentable f) :
    ∃ e : weilRestriction f hf (𝟙 (yoneda.obj Scheme.empty.{u})) ≅ B,
      e.hom = weilRestrictionToBase f hf (𝟙 (yoneda.obj Scheme.empty.{u})) := sorry

-- test: TauCeti.AlgebraicGeometry.ModuliDescent.weilRestriction_split_two
/-- `TauCeti.AlgebraicGeometry.ModuliDescent.weilRestriction_split_two`: For Z=B disjoint union B and X=X1 disjoint union X2 mapping componentwise to Z, restriction is X1×_B X2. It is a product, not a disjoint union. -/
example {S X₁ X₂ : Scheme.{u}} (x₁ : X₁ ⟶ S) (x₂ : X₂ ⟶ S)
    (hf : yoneda.relativelyRepresentable
      (yoneda.map (coprod.desc (𝟙 S) (𝟙 S)))) :
    ∃ e : weilRestriction (yoneda.map (coprod.desc (𝟙 S) (𝟙 S))) hf
        (yoneda.map (coprod.map x₁ x₂)) ≅ yoneda.obj (pullback x₁ x₂),
      e.hom ≫ yoneda.map (pullback.fst x₁ x₂ ≫ x₁) =
        weilRestrictionToBase (yoneda.map (coprod.desc (𝟙 S) (𝟙 S))) hf
          (yoneda.map (coprod.map x₁ x₂)) := sorry



/-- For algebraic-space presheaves and a finite locally free source of finite presentation, the relative Hom presheaf has an étale scheme atlas, represented diagonal and sheaf descent. -/
theorem relativeHom_algebraicity
    (hB : Presheaf.IsSheaf Scheme.fppfTopology B ∧
      yoneda.relativelyRepresentable (prod.lift (𝟙 B) (𝟙 B)) ∧
      ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ B),
        MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
        MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a)
    (hZ : Presheaf.IsSheaf Scheme.fppfTopology Z ∧
      yoneda.relativelyRepresentable (prod.lift (𝟙 Z) (𝟙 Z)) ∧
      ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ Z),
        MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
        MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a)
    (hX : Presheaf.IsSheaf Scheme.fppfTopology X ∧
      yoneda.relativelyRepresentable (prod.lift (𝟙 X) (𝟙 X)) ∧
      ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ X),
        MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
        MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a)
    (hfin : ∀ (T : Scheme.{u}) (a : yoneda.obj T ⟶ B),
      IsFinite (hf.snd a) ∧ Flat (hf.snd a) ∧ LocallyOfFinitePresentation (hf.snd a)) :
    let R := relativeHom f x hf
    Presheaf.IsSheaf Scheme.fppfTopology R ∧
      yoneda.relativelyRepresentable (prod.lift (𝟙 R) (𝟙 R)) ∧
      ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ R),
        MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
        MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a := sorry

/-- Restriction of scalars of an algebraic space along a finite locally free morphism of finite presentation is an algebraic space, expressed through its native sheaf, diagonal and atlas contracts. -/
theorem weilRestriction_algebraicity
    (hB : Presheaf.IsSheaf Scheme.fppfTopology B ∧
      yoneda.relativelyRepresentable (prod.lift (𝟙 B) (𝟙 B)) ∧
      ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ B),
        MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
        MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a)
    (hZ : Presheaf.IsSheaf Scheme.fppfTopology Z ∧
      yoneda.relativelyRepresentable (prod.lift (𝟙 Z) (𝟙 Z)) ∧
      ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ Z),
        MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
        MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a)
    (hX : Presheaf.IsSheaf Scheme.fppfTopology X ∧
      yoneda.relativelyRepresentable (prod.lift (𝟙 X) (𝟙 X)) ∧
      ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ X),
        MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
        MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a)
    (hfin : ∀ (T : Scheme.{u}) (a : yoneda.obj T ⟶ B),
      IsFinite (hf.snd a) ∧ Flat (hf.snd a) ∧ LocallyOfFinitePresentation (hf.snd a)) (z : X ⟶ Z) :
    let R := weilRestriction f hf z
    Presheaf.IsSheaf Scheme.fppfTopology R ∧
      yoneda.relativelyRepresentable (prod.lift (𝟙 R) (𝟙 R)) ∧
      ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ R),
        MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
        MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a := sorry

/-- Restriction of scalars preserves the fppf sheaf condition on the base, finite source and target. -/
theorem weilRestriction_isSheaf
    (hB : Presheaf.IsSheaf Scheme.fppfTopology B)
    (hZ : Presheaf.IsSheaf Scheme.fppfTopology Z)
    (hX : Presheaf.IsSheaf Scheme.fppfTopology X) :
    Presheaf.IsSheaf Scheme.fppfTopology (weilRestriction f hf z) := sorry

/-- Restriction of scalars commutes with arbitrary base change; its section map is precomposition by the specified pullback comparison and postcomposition by the target projection. -/
theorem weilRestriction_baseChange {B' : P.{u}} (v : B' ⟶ B)
    (hf' : yoneda.relativelyRepresentable (pullback.fst v f)) :
    ∃ e : weilRestriction (pullback.fst v f) hf' (pullback.fst (pullback.snd v f) z) ≅
        pullback v (weilRestrictionToBase f hf z),
      e.hom ≫ pullback.fst v (weilRestrictionToBase f hf z) =
        weilRestrictionToBase (pullback.fst v f) hf' (pullback.fst (pullback.snd v f) z) ∧
      (∀ (T : Scheme.{u}) (a : yoneda.obj T ⟶ B')
        (c : yoneda.obj T ⟶
          weilRestriction (pullback.fst v f) hf' (pullback.fst (pullback.snd v f) z))
        (hc : c ≫ weilRestrictionToBase (pullback.fst v f) hf'
          (pullback.fst (pullback.snd v f) z) = a)
        (k : pullback (a ≫ v) f ⟶ pullback a (pullback.fst v f))
        (hk₁ : k ≫ pullback.fst a (pullback.fst v f) = pullback.fst (a ≫ v) f)
        (hk₂ : k ≫ pullback.snd a (pullback.fst v f) ≫ pullback.snd v f =
          pullback.snd (a ≫ v) f),
        ((weilRestrictionHomEquiv f hf z (a ≫ v))
          ⟨c ≫ e.hom ≫ pullback.snd v (weilRestrictionToBase f hf z), by sorry⟩).val =
          k ≫ ((weilRestrictionHomEquiv (pullback.fst v f) hf'
            (pullback.fst (pullback.snd v f) z) a) ⟨c, hc⟩).val ≫
              pullback.snd (pullback.snd v f) z) := sorry

/-- The cartesian comparison includes the exact point formulas, so no arbitrary maps can satisfy
this target in place of postcomposition, the identity section and the inclusion. -/
theorem weilRestriction_cartesian :
    ∃ (q : relativeHom f (z ≫ f) hf ⟶ relativeHom f f hf)
      (e : B ⟶ relativeHom f f hf)
      (j : weilRestriction f hf z ⟶ relativeHom f (z ≫ f) hf),
      IsPullback j (weilRestrictionToBase f hf z) q e ∧
      (∀ (T : Scheme.{u}) (a : B.obj (op T))
        (b : X.obj (op (hf.pullback (yonedaEquiv.symm a))))
        (hb : (z ≫ f).app _ b = yonedaEquiv (hf.fst (yonedaEquiv.symm a) ≫ f)),
        q.app (op T) ⟨a, ⟨b, hb⟩⟩ =
          ⟨a, ⟨z.app _ b, by sorry⟩⟩) ∧
      (∀ (T : Scheme.{u}) (a : B.obj (op T)),
        e.app (op T) a = ⟨a, ⟨yonedaEquiv (hf.fst (yonedaEquiv.symm a)), by sorry⟩⟩) ∧
      (∀ (T : Scheme.{u}) (a : B.obj (op T))
        (b : X.obj (op (hf.pullback (yonedaEquiv.symm a))))
        (hb : z.app _ b = yonedaEquiv (hf.fst (yonedaEquiv.symm a))),
        j.app (op T) ⟨a, ⟨b, hb⟩⟩ = ⟨a, ⟨b, by sorry⟩⟩) := sorry

/-- Restriction of scalars of an étale algebraic space along a finite locally free source is étale; an étale-local section over the finite source can be obtained after an étale cover of the base. -/
theorem finiteSourceEtaleSections {U Z₀ : Scheme.{u}} (p : Z₀ ⟶ U)
    (hfin : IsFinite p) (hflat : Flat p) (hfp : LocallyOfFinitePresentation p)
    (hp : yoneda.relativelyRepresentable (yoneda.map p))
    (W : P.{u}) (w : W ⟶ yoneda.obj Z₀)
    (hW : Presheaf.IsSheaf Scheme.fppfTopology W ∧
      yoneda.relativelyRepresentable (prod.lift (𝟙 W) (𝟙 W)) ∧
      ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ W),
        MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
        MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a)
    (hw : ∃ (V : Scheme.{u}) (a : yoneda.obj V ⟶ W),
      MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
      MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a ∧
      MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) (a ≫ w)) :
    let R := weilRestriction (yoneda.map p) hp w
    Presheaf.IsSheaf Scheme.fppfTopology R ∧
      yoneda.relativelyRepresentable (prod.lift (𝟙 R) (𝟙 R)) ∧
      (∃ (V : Scheme.{u}) (a : yoneda.obj V ⟶ R),
        MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
        MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a ∧
        MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u})
          (a ≫ weilRestrictionToBase (yoneda.map p) hp w)) ∧
      (Presheaf.IsLocallySurjective Scheme.etaleTopology w →
        Presheaf.IsLocallySurjective Scheme.etaleTopology
          (weilRestrictionToBase (yoneda.map p) hp w)) := sorry




/- The comparison inputs below are concrete native evaluation and quotient universal properties.
They can be instantiated with the existing roadmap suppliers without inventing a local affine
restriction algebra, quotient definition or algebraic-space carrier. -/
/-- The representing affine restriction with its evaluation identifies with the native
Weil restriction by the stated universal property, retaining the map to the base. -/
theorem affineRestrictionComparison (Q : Scheme.{u}) (q : yoneda.obj Q ⟶ B)
    (evaluation : pullback q f ⟶ X) (hevaluation : evaluation ≫ z = pullback.snd q f)
    (hrepresenting : ∀ (T : Scheme.{u}) (v : yoneda.obj T ⟶ B)
      (b : pullback v f ⟶ X) (hb : b ≫ z = pullback.snd v f),
      ∃! c : { c : yoneda.obj T ⟶ yoneda.obj Q // c ≫ q = v },
        pullback.lift (pullback.fst v f ≫ c.val) (pullback.snd v f)
          (by rw [Category.assoc, c.property, pullback.condition]) ≫ evaluation = b) :
    IsIso ((weilRestrictionHomEquiv f hf z q).symm ⟨evaluation, hevaluation⟩).val := sorry

/-- Two fppf sheaf quotients of the same effective relation are uniquely isomorphic through the specified atlas maps. -/
theorem finiteQuotientComparison {R U Q : Scheme.{u}} (s t : R ⟶ U) (q : U ⟶ Q)
    (hkernel : IsPullback (yoneda.map s) (yoneda.map t) (yoneda.map q) (yoneda.map q))
    (hcover : Presheaf.IsLocallySurjective Scheme.fppfTopology (yoneda.map q))
    (F : P.{u}) (hF : Presheaf.IsSheaf Scheme.fppfTopology F)
    (qF : yoneda.obj U ⟶ F) (hrelation : yoneda.map s ≫ qF = yoneda.map t ≫ qF)
    (hquotient : ∀ (Y : P.{u}) (hY : Presheaf.IsSheaf Scheme.fppfTopology Y)
      (b : yoneda.obj U ⟶ Y) (hb : yoneda.map s ≫ b = yoneda.map t ≫ b),
      ∃! c : F ⟶ Y, qF ≫ c = b) :
    ∃! e : yoneda.obj Q ≅ F, yoneda.map q ≫ e.hom = qF := sorry

end ModuliDescent
end



variable {C : Type u} [Category.{v} C]

/-! ## Layer 4: gerbes, bands and profinite stages -/

/-- Mathlib's IsStack alone does not impose groupoid fibres. -/
class IsGerbe (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
    (J : GrothendieckTopology C) : Prop extends F.IsStack J where
  /-- Every arrow of every fibre category is invertible. -/
  isIso_hom : ∀ (U : C) {x y : F.obj (.mk (op U))} (f : x ⟶ y), IsIso f
  /-- A covering sieve supplies an object in each pulled-back fibre. -/
  locallyNonempty : ∀ U : C, ∃ R : Sieve U, R ∈ J U ∧
    ∀ ⦃V : C⦄ (f : V ⟶ U), R f → Nonempty (F.obj (.mk (op V)))
  /-- Any two objects become isomorphic along a covering sieve. -/
  locallyIsomorphic : ∀ (U : C) (x y : F.obj (.mk (op U))),
    ∃ R : Sieve U, R ∈ J U ∧ ∀ ⦃V : C⦄ (f : V ⟶ U), R f →
      Nonempty ((F.map f.op.toLoc).toFunctor.obj x ≅
        (F.map f.op.toLoc).toFunctor.obj y)

variable {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
    {J : GrothendieckTopology C}

-- IsGerbe.toIsStack, isIso_hom, locallyNonempty and locallyIsomorphic are projections.
/-- `IsGerbe.equivalence_iff`: A pseudonatural equivalence over C preserves and reflects IsGerbe. -/
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
  /-- The specified band identifies its sections with the automorphisms of each object. -/
  autEquiv : ∀ (U : C) (x : F.obj (.mk (op U))),
    Multiplicative (A.obj.obj (op U)) ≃* Aut x
  /-- The band identification commutes with restriction and the pseudofunctor comparison. -/
  pullback : ∀ {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op U)))
      (a : Multiplicative (A.obj.obj (op U))),
    (F.map f.op.toLoc).toFunctor.mapAut x (autEquiv U x a) =
      autEquiv V ((F.map f.op.toLoc).toFunctor.obj x)
        (Multiplicative.ofAdd ((A.obj.map f.op) (Multiplicative.toAdd a)))
  /-- Object isomorphisms conjugate the identified automorphisms without changing the band coefficient. -/
  conjugation : ∀ (U : C) {x y : F.obj (.mk (op U))} (e : x ≅ y)
      (a : Multiplicative (A.obj.obj (op U))),
    Aut.autMulEquivOfIso e (autEquiv U x a) = autEquiv U y a

variable {A : Sheaf J AddCommGrpCat.{w}} [IsGerbe F J]

/-- `AbelianBanding.ext`: Two bandings are equal if their sectionwise automorphism equivalences agree for every U,x,a. -/
@[ext]
theorem AbelianBanding.ext (b b' : AbelianBanding F J A)
    (h : ∀ U x a, b.autEquiv U x a = b'.autEquiv U x a) : b = b' := by
  sorry

/-- The specified abelian band identifies every fibre automorphism group with a commutative group. -/
theorem banded_aut_commute (b : AbelianBanding F J A) (U : C)
    (x : F.obj (.mk (op U))) (a a' : Aut x) : a * a' = a' * a := by
  sorry

-- BandingTests.zero.
/-- `BandingTests.zero`: If A(U) is trivial, an A-banding makes every Aut(x) trivial. -/
example (b : AbelianBanding F J A) (U : C)
    [Subsingleton (A.obj.obj (op U))] (x : F.obj (.mk (op U))) :
    ∀ a : Aut x, a = 1 := by
  sorry

-- BandingTests.conjugation: a chosen object isomorphism preserves the band.
/-- `BandingTests.conjugation`: Changing a local trivialization by an object isomorphism leaves the identified element of A unchanged. -/
example (b : AbelianBanding F J A) (U : C)
    {x y : F.obj (.mk (op U))} (e : x ≅ y)
    (a : Multiplicative (A.obj.obj (op U))) :
    Aut.autMulEquivOfIso e (b.autEquiv U x a) = b.autEquiv U y a := by
  sorry

-- BandingTests.nonabelian: S3 cannot satisfy this abelian-banding definition.
/-- `BandingTests.nonabelian`: The constant S3 automorphism group cannot have a fixed-sheaf banding satisfying conjugation compatibility with every automorphism. -/
example (U : C) (x : F.obj (.mk (op U)))
    (e : Aut x ≃* Equiv.Perm (Fin 3)) :
    ¬ Nonempty (AbelianBanding F J A) := by
  sorry

/-- When the source automorphism group is commutative, conjugation transport does not depend on the isomorphism chosen between the two objects. -/
theorem banding_iso_independent (U : C) {x y : F.obj (.mk (op U))}
    (hcomm : ∀ a a' : Aut x, a * a' = a' * a) (e e' : x ≅ y) :
    Aut.autMulEquivOfIso e = Aut.autMulEquivOfIso e' := by
  sorry

/-- An object over S is section data;
global neutrality below requires S to be terminal in the chosen site. -/
structure Neutralization (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}) (S : C) where
  /-- A chosen cartesian section of the gerbe pseudofunctor. -/
  obj : F.obj (.mk (op S))

/-- Neutrality means a global object in the fibre over the specified terminal object of the site; arbitrary sites use the topos terminal object in the general target. -/
def IsNeutral (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}) (S : C)
    (_hS : Limits.IsTerminal S) : Prop :=
  Nonempty (Neutralization F S)

/-- `Neutralization.isNeutral`: For a specified terminal object S, with its terminal-object witness retained, F is neutral iff F(S) is nonempty, equivalently iff its groupoid of neutralizations is nonempty. A section over an arbitrary nonterminal site object asserts only neutrality on its slice. -/
theorem Neutralization.isNeutral (S : C) (hS : Limits.IsTerminal S) :
    IsNeutral F S hS ↔ Nonempty (F.obj (.mk (op S))) := by
  sorry

/-- `Neutralization.pullback`: A neutralization restricts to a neutralization on every slice site. -/
def Neutralization.pullback {S V : C} (f : V ⟶ S)
    (x : Neutralization F S) : Neutralization F V :=
  ⟨(F.map f.op.toLoc).toFunctor.obj x.obj⟩

-- NeutralizationTests.automorphisms: choosing an object retains inertia.
/-- `NeutralizationTests.automorphisms`: A neutralization x has automorphism group A(S); a chosen point does not remove this group. -/
example (b : AbelianBanding F J A) (S : C) (x : Neutralization F S) :
    Nonempty (Multiplicative (A.obj.obj (op S)) ≃* Aut x.obj) := by
  sorry

variable [IsGerbe G J]

/-- A strong transformation preserves the two specified bandings exactly when its
component automorphism maps intertwine their coefficient equivalences. -/
class BandPreserving (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) : Prop where
  /-- The strong transformation carries each band automorphism to the same target-band coefficient. -/
  map_band : ∀ (U : C) (x : F.obj (.mk (op U)))
      (a : Multiplicative (A.obj.obj (op U))),
    (η.app (.mk (op U))).toFunctor.mapAut x (bF.autEquiv U x a) =
      bG.autEquiv U ((η.app (.mk (op U))).toFunctor.obj x) a

/-- `BandPreserving.id`: The identity transformation is band-preserving. -/
theorem BandPreserving.id (b : AbelianBanding F J A) :
    BandPreserving b b (Pseudofunctor.StrongTrans.id F) := by
  sorry

/-- `BandPreserving.comp`: Composites of band-preserving transformations preserve the same fixed band. -/
theorem BandPreserving.comp
    {H : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe H J]
    (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (bH : AbelianBanding H J A)
    (η : Pseudofunctor.StrongTrans F G) (θ : Pseudofunctor.StrongTrans G H)
    [BandPreserving bF bG η] [BandPreserving bG bH θ] :
    BandPreserving bF bH (Pseudofunctor.StrongTrans.vcomp η θ) := by
  sorry

-- BandMorphismTests.identity.
/-- `BandMorphismTests.identity`: The identity of BA preserves its canonical band. -/
example (b : AbelianBanding F J A) :
    BandPreserving b b (Pseudofunctor.StrongTrans.id F) := by
  sorry

/-- A morphism of gerbes preserving the specified common abelian band is fully faithful on every fibre. -/
theorem band_morphism_full_faithful
    (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] (U : C) :
    (η.app (.mk (op U))).toFunctor.Full ∧
      (η.app (.mk (op U))).toFunctor.Faithful := by
  sorry

/-- A morphism of gerbes preserving the specified common abelian band is essentially surjective on every fibre, by gluing local preimages. -/
theorem band_morphism_essential_surjective
    (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] (U : C) :
    (η.app (.mk (op U))).toFunctor.EssSurj := by
  sorry

/-- A morphism of gerbes preserving the specified common abelian band is an equivalence on every fibre. -/
theorem band_morphism_equivalence
    (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] (U : C) :
    (η.app (.mk (op U))).toFunctor.IsEquivalence := by
  sorry


namespace GerbeCohomology

open CategoryTheory.Abelian

variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
    [HasSheafify J AddCommGrpCat.{v}]
    [HasExt.{h} (Sheaf J AddCommGrpCat.{v})]
    {E : ShortComplex (Sheaf J AddCommGrpCat.{v})}

/-- In an exact quotient of an injective abelian sheaf, the connecting homomorphism from degree one of the quotient to degree two of the kernel is bijective. -/
theorem injective_boundary_bijective (hE : E.ShortExact)
    [Injective E.X₂] :
    Function.Bijective (TauCeti.CategoryTheory.Sheaf.H.δ hE 1 2 rfl) := by
  sorry

-- The two vanishings needed for this statement are Mathlib facts.
/-- The two vanishings needed for this statement are Mathlib facts.
 -/
example (I : Sheaf J AddCommGrpCat.{v}) [Injective I]
    (a : CategoryTheory.Sheaf.H I 1) : a = 0 := by
  sorry

/-- `GerbeCohomologyChecks.injective`: an injective abelian sheaf has zero higher cohomology, including degree two. -/
example (I : Sheaf J AddCommGrpCat.{v}) [Injective I]
    (a : CategoryTheory.Sheaf.H I 2) : a = 0 := by
  sorry

end GerbeCohomology



variable {I : Type uI} [Category.{vI} I]

/-- evaluated at one test object T.
The pseudo-diagram here is its diagram of fibre categories. In applications
I is a cofiltered poset and every fibre is a groupoid. This data construction
also makes sense for more general Cat-valued pseudo-diagrams. -/
structure GerbeLimitFamily (Φ : LocallyDiscrete I ⥤ᵖ Cat.{v', u'}) where
  /-- An object at every stage of the indexed groupoid diagram. -/
  component : ∀ i : I, Φ.obj (.mk i)
  /-- A specified transition isomorphism from each transported stage object. -/
  transition : ∀ {i j : I} (f : i ⟶ j),
    (Φ.map f.toLoc).toFunctor.obj (component i) ≅ component j
  /-- The identity transition agrees with the diagram unitor. -/
  transition_id : ∀ i : I,
    (transition (𝟙 i)).hom =
      (Φ.mapId (.mk i)).hom.toNatTrans.app (component i)
  /-- Two transitions agree with the composite after the diagram composition comparison. -/
  transition_comp : ∀ {i j k : I} (f : i ⟶ j) (g : j ⟶ k),
    (Φ.mapComp f.toLoc g.toLoc).hom.toNatTrans.app (component i) ≫
      (Φ.map g.toLoc).toFunctor.map (transition f).hom ≫
      (transition g).hom = (transition (f ≫ g)).hom

namespace GerbeLimitFamily

variable {Φ : LocallyDiscrete I ⥤ᵖ Cat.{v', u'}}

/-- Compatible component arrows; they are invertible when the fibres are
groupoids. This is the arrow data, before installing its category instance. -/
structure Hom (x y : GerbeLimitFamily Φ) where
  /-- An actual fibre arrow at every stage, rather than a mere isomorphism class. -/
  component : ∀ i : I, x.component i ⟶ y.component i
  /-- Each stage arrow commutes with the two families' transition isomorphisms. -/
  naturality : ∀ {i j : I} (f : i ⟶ j),
    (Φ.map f.toLoc).toFunctor.map (component i) ≫ (y.transition f).hom =
      (x.transition f).hom ≫ component j

/-- `GerbeLimitFamily.hom_ext`: Two compatible-family arrows are equal iff all their component arrows agree. -/
theorem hom_ext {x y : GerbeLimitFamily Φ} (f g : Hom x y)
    (h : ∀ i, f.component i = g.component i) : f = g := by
  sorry

-- an opaque category instance would lose the componentwise interface.
/-- `GerbeLimitFamily.category`: Compatible component arrows form a category with componentwise identity and composition; its Hom type is the displayed compatibility-square carrier. -/
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

/-- `GerbeLimitFamily.evaluation`: Evaluation at i is a functor to Φ(i), taking objects and arrows to their i-components. -/
def evaluation (i : I) : GerbeLimitFamily Φ ⥤ Φ.obj (.mk i) where
  obj x := x.component i
  map f := f.component i
  map_id := by sorry
  map_comp := by sorry

-- the category installed above: invertibility is proved in that category.
/-- `GerbeLimitFamily.isIso_of_components`: A compatible-family arrow is invertible when every component is invertible; its inverse is the componentwise inverse in the same category. -/
theorem isIso_of_components {x y : GerbeLimitFamily Φ} (f : x ⟶ y)
    (hf : ∀ i : I, IsIso (f.component i)) : IsIso f := by
  sorry

-- transformation between the two diagrams of fibre categories.
/-- `GerbeLimitFamily.pullback`: A supplied strong transformation η:Φ⇒Ψ between same-universe index diagrams induces a functor on compatible families, applying η at every component and using its naturality isomorphisms on transitions. Site restriction T′→T must first supply this strong transformation; constructing that geometric diagram and its coherence is a separate obligation. -/
noncomputable def pullback {Ψ : LocallyDiscrete I ⥤ᵖ Cat.{v', u'}}
    (η : Pseudofunctor.StrongTrans Φ Ψ) :
    GerbeLimitFamily Φ ⥤ GerbeLimitFamily Ψ := by
  sorry

/-- `GerbeLimitFamily.pullback_component`: The i-component of the family induced by η is exactly η_i(x_i). -/
theorem pullback_component {Ψ : LocallyDiscrete I ⥤ᵖ Cat.{v', u'}}
    (η : Pseudofunctor.StrongTrans Φ Ψ) (x : GerbeLimitFamily Φ) (i : I) :
    ((pullback η).obj x).component i =
      (η.app (.mk i)).toFunctor.obj (x.component i) := by
  sorry

-- Unit and composition coherence are equations, not uninstantiated flags.
/-- Unit and composition coherence are equations, not uninstantiated flags.
 -/
example (x : GerbeLimitFamily Φ) (i : I) :
    (x.transition (𝟙 i)).hom =
      (Φ.mapId (.mk i)).hom.toNatTrans.app (x.component i) := by
  sorry

/-- `GerbeLimitChecks.composition`: composition of compatible family maps is pointwise composition and retains its naturality equation. -/
example (x : GerbeLimitFamily Φ) {i j k : I} (f : i ⟶ j) (g : j ⟶ k) :
    (Φ.mapComp f.toLoc g.toLoc).hom.toNatTrans.app (x.component i) ≫
      (Φ.map g.toLoc).toFunctor.map (x.transition f).hom ≫
      (x.transition g).hom = (x.transition (f ≫ g)).hom := by
  sorry

end GerbeLimitFamily

namespace LimitFamilyTests

-- The singleton check uses an arbitrary pseudofunctor on the
-- one-object discrete index, including its possibly nontrivial unit data.
/-- The singleton check uses an arbitrary pseudofunctor on the one-object discrete index, including its possibly nontrivial unit data.
 -/
example (Φ : LocallyDiscrete (Discrete PUnit) ⥤ᵖ Cat.{v', u'}) :
    Nonempty (GerbeLimitFamily Φ ≌ Φ.obj (.mk (Discrete.mk PUnit.unit))) := by
  sorry

-- Retain the category of arrows of the constant groupoid, not just its
-- isomorphism-class set. IsCofiltered includes nonemptiness.
/-- Retain the category of arrows of the constant groupoid, not just its isomorphism-class set. IsCofiltered includes nonemptiness.
 -/
example [IsCofiltered I] (G : Type v') [Group G] :
    let Φ := ((Functor.const I).obj (Cat.of (SingleObj G))).toPseudofunctor'
    Nonempty (GerbeLimitFamily Φ ≌ SingleObj G) := by
  sorry

-- A concrete C3 calculation on the same compatible-family carrier.
-- The classifying-stack comparison is a separate geometric supplier input.
/-- A concrete C3 calculation on the same compatible-family carrier. The classifying-stack comparison is a separate geometric supplier input.
 -/
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
/-- Fibre fixture for the notTarget non-example.
 -/
example :
    let f := (1 : PUnit →* Multiplicative (ZMod 2)).toFunctor
    f.Faithful ∧ ¬ f.Full ∧
      Nat.card (SingleObj.star PUnit ⟶ SingleObj.star PUnit) = 1 ∧
      Nat.card (SingleObj.star (Multiplicative (ZMod 2)) ⟶
        SingleObj.star (Multiplicative (ZMod 2))) = 2 := by
  sorry

end CanonicalFactorTests




open CategoryTheory Opposite Bicategory

variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})

/-- The subgroup of slice-indexed units in fibre centres satisfying every restriction equation. -/
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

/-- Units in the monoid of pullback-compatible natural endomorphisms of the identity on every slice fibre. Invertibility makes these compatible central automorphism families. -/
abbrev IntrinsicBandSection (U : C) := ↥(intrinsicBandSectionSubgroup F U)

namespace IntrinsicBandSections

/-- Construct a section from a vertically compatible family of center units. -/
noncomputable def mk {U : C}
    (z : ∀ (V : C), (V ⟶ U) → (CatCenter (F.obj (.mk (op V))))ˣ)
    (hz : ∀ (V W : C) (f : V ⟶ U) (g : W ⟶ V)
      (x : F.obj (.mk (op V))),
      (F.map g.op.toLoc).toFunctor.map ((z V f).val.app x) =
        (z W (g ≫ f)).val.app ((F.map g.op.toLoc).toFunctor.obj x)) :
    IntrinsicBandSection F U := by sorry

/-- `IntrinsicBandSections.val`: A section specifies a unit of CatCenter(F(V)) for every arrow V→U. -/
def val {U : C} (s : IntrinsicBandSection F U) (V : C) (f : V ⟶ U) :
    (CatCenter (F.obj (.mk (op V))))ˣ := s.val V f

/-- `IntrinsicBandSections.val_mk`: For every V and f:V→U, the component of mk(z,hz) is z(V,f); the compatibility witness does not change this component. -/
theorem val_mk {U : C}
    (z : ∀ (V : C), (V ⟶ U) → (CatCenter (F.obj (.mk (op V))))ˣ)
    (hz : ∀ (V W : C) (f : V ⟶ U) (g : W ⟶ V)
      (x : F.obj (.mk (op V))),
      (F.map g.op.toLoc).toFunctor.map ((z V f).val.app x) =
        (z W (g ≫ f)).val.app ((F.map g.op.toLoc).toFunctor.obj x))
    (V : C) (f : V ⟶ U) : val F (mk F z hz) V f = z V f := by sorry

/-- `IntrinsicBandSections.val_one`: For every f:V→U, the component of the identity section is the identity unit of CatCenter(F(V)). -/
theorem val_one {U V : C} (f : V ⟶ U) :
    val F (1 : IntrinsicBandSection F U) V f = 1 := by sorry

/-- `IntrinsicBandSections.val_mul`: For s,t in ZF(U), val(s t,V,f)=val(s,V,f) val(t,V,f) with the pinned categorical-center multiplication. -/
theorem val_mul {U V : C} (s t : IntrinsicBandSection F U) (f : V ⟶ U) :
    val F (s * t) V f = val F s V f * val F t V f := by sorry

/-- `IntrinsicBandSections.val_inv`: For s in ZF(U), val(s inverse,V,f)=val(s,V,f) inverse. -/
theorem val_inv {U V : C} (s : IntrinsicBandSection F U) (f : V ⟶ U) :
    val F s⁻¹ V f = (val F s V f)⁻¹ := by sorry

/-- `IntrinsicBandSections.compatible`: The central family commutes with every pullback functor on every object. -/
theorem compatible {U : C} (s : IntrinsicBandSection F U)
    (V W : C) (f : V ⟶ U) (g : W ⟶ V) (x : F.obj (.mk (op V))) :
    (F.map g.op.toLoc).toFunctor.map ((val F s V f).val.app x) =
      (val F s W (g ≫ f)).val.app ((F.map g.op.toLoc).toFunctor.obj x) := by
  exact s.property V W f g x

/-- Compatible central sections are equal when all their evaluations agree. -/
@[ext] theorem ext {U : C} (s t : IntrinsicBandSection F U)
    (h : ∀ (V : C) (f : V ⟶ U) (x : F.obj (.mk (op V))),
      (val F s V f).val.app x = (val F t V f).val.app x) : s = t := by
  apply Subtype.ext
  funext V f
  apply Units.ext
  exact CatCenter.ext _ _ (h V f)

/-- Compatible central automorphism families form a commutative group: pointwise composition commutes by the identity-endomorphism interchange law. -/
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

/-- Restriction along V → U reindexes a compatible family by composing each slice arrow to V with that base arrow. -/
noncomputable def restrict {U V : C} (f : V ⟶ U) :
    IntrinsicBandSection F U →* IntrinsicBandSection F V where
  toFun s := ⟨fun W a ↦ s.val W (a ≫ f), by
    intro W X a g x
    simpa only [Category.assoc] using s.property W X (a ≫ f) g x⟩
  map_one' := by rfl
  map_mul' := by intros; rfl

/-- `IntrinsicBandSections.restrict_apply`: (r_f s)(W,a)=s(W,a≫f). -/
theorem restrict_apply {U V W : C} (f : V ⟶ U)
    (s : IntrinsicBandSection F U) (a : W ⟶ V) :
    val F (restrict F f s) W a = val F s W (a ≫ f) := rfl

/-- Restriction along the identity fixes every component of a compatible central section. -/
theorem restrict_id {U : C} (s : IntrinsicBandSection F U) :
    restrict F (𝟙 U) s = s := by
  apply ext
  intro V f x
  simp only [restrict_apply, Category.comp_id]

/-- The two successive restriction maps equal restriction along the composite base arrow. -/
theorem restrict_comp {U V W : C} (f : V ⟶ U) (g : W ⟶ V)
    (s : IntrinsicBandSection F U) :
    restrict F g (restrict F f s) = restrict F (g ≫ f) s := by
  apply ext
  intro X a x
  simp only [restrict_apply, Category.assoc]

/-- Evaluate a compatible central section at the given slice arrow and fibre object. -/
noncomputable def eval {U V : C} (a : V ⟶ U) (x : F.obj (.mk (op V))) :
    IntrinsicBandSection F U →* Aut x where
  toFun s := (Aut.unitsEndEquivAut (𝟭 (F.obj (.mk (op V)))) (val F s V a)).app x
  map_one' := by apply Iso.ext; rfl
  map_mul' := by intros; apply Iso.ext; rfl

/-- `IntrinsicBandSections.eval_mul`: Evaluation of a product is the product of evaluated automorphisms. -/
theorem eval_mul {U V : C} (a : V ⟶ U) (x : F.obj (.mk (op V)))
    (s t : IntrinsicBandSection F U) :
    eval F a x (s * t) = eval F a x s * eval F a x t := (eval F a x).map_mul s t

/-- `IntrinsicBandSections.eval_conjugation`: Transport through x≅y commutes with evaluation. -/
theorem eval_conjugation {U V : C} (a : V ⟶ U)
    {x y : F.obj (.mk (op V))} (e : x ≅ y) (s : IntrinsicBandSection F U) :
    Aut.autMulEquivOfIso e (eval F a x s) = eval F a y s := by
  apply Iso.ext
  change e.inv ≫ (val F s V a).val.app x ≫ e.hom = (val F s V a).val.app y
  rw [← CatCenter.naturality, e.inv_hom_id_assoc]

/-- `IntrinsicBandSections.eval_restrict`: mapAut F(g) of ev_(a,x)(s) equals ev_(g≫a,F(g)x)(s). -/
theorem eval_restrict {U V W : C} (a : V ⟶ U) (g : W ⟶ V)
    (x : F.obj (.mk (op V))) (s : IntrinsicBandSection F U) :
    (F.map g.op.toLoc).toFunctor.mapAut x (eval F a x s) =
      eval F (g ≫ a) ((F.map g.op.toLoc).toFunctor.obj x) s := by
  apply Iso.ext
  exact compatible F s V W a g x

/-- Evaluation of a compatible identity automorphism at an object is central in its automorphism group, by naturality with respect to every automorphism. -/
theorem eval_central {U V : C} (a : V ⟶ U) (x : F.obj (.mk (op V)))
    (s : IntrinsicBandSection F U) (b : Aut x) :
    eval F a x s * b = b * eval F a x s := by
  apply Iso.ext
  exact (val F s V a).val.naturality b.hom

/-- Evaluation after base restriction equals evaluation at the same composite slice arrow in the original compatible family. -/
theorem eval_reindex {U V W : C} (f : V ⟶ U) (a : W ⟶ V)
    (x : F.obj (.mk (op W))) (s : IntrinsicBandSection F U) :
    eval F a x (restrict F f s) = eval F (a ≫ f) x s := rfl

/-- The compatible centre-section functor used to assemble the intrinsic band sheaf. -/
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

/-- An isomorphism of two restricted-object descent data gives its actual component isomorphisms, without assuming that arbitrary descent objects are effective. -/
noncomputable def coverIso {U : C} (R : Sieve U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) :
    Aut ((F.toDescentData (fun k : R.arrows.category => k.obj.hom)).obj x) := by sorry

/-- `IntrinsicBandSections.coverIso_hom_apply`: The hom component at i is the hom of ev_(id V_i,F(i)x)(z_i). -/
theorem coverIso_hom_apply {U : C} (R : Sieve U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) (i : R.arrows.category) :
    (coverIso F R z hz x).hom.hom i =
      (eval F (𝟙 i.obj.left) ((F.map i.obj.hom.op.toLoc).toFunctor.obj x) (z i)).hom := by sorry

/-- `IntrinsicBandSections.coverIso_one`: The family of identity sections gives the identity automorphism of the canonical descent datum. -/
theorem coverIso_one {U : C} (R : Sieve U) (x : F.obj (.mk (op U))) :
    coverIso F R (fun _ => 1) (fun _ _ _ => map_one _) x = 1 := by sorry

/-- `IntrinsicBandSections.coverIso_inv`: The descent automorphism of the pointwise inverse matching family is the inverse of the original descent automorphism. -/
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

/-- `IntrinsicBandSections.coverAut_map_hom`: For each i in the covering sieve, F(i) sends the descended hom to the hom of ev_(id V_i,F(i)x)(z_i). -/
theorem coverAut_map_hom (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) (i : R.arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.map (coverAut F J R hR z hz x).hom =
      (eval F (𝟙 i.obj.left) ((F.map i.obj.hom.op.toLoc).toFunctor.obj x) (z i)).hom := by sorry

/-- `IntrinsicBandSections.coverAut_unique`: Any automorphism of x with exactly those pullback hom components equals the descended automorphism. -/
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

/-- `IntrinsicBandSections.coverAut_one`: Descending the identity matching family gives the identity automorphism of x. -/
theorem coverAut_one (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) (x : F.obj (.mk (op U))) :
    coverAut F J R hR (fun _ => 1) (fun _ _ _ => map_one _) x = 1 := by sorry

-- BandCoverTests.iso_one
/-- `BandCoverTests.iso_one`: For every sieve and x, the identity matching family yields the identity descent automorphism. -/
example {U : C} (R : Sieve U) (x : F.obj (.mk (op U))) :
    coverIso F R (fun _ => 1) (fun _ _ _ => map_one _) x = 1 := by sorry

-- BandCoverTests.iso_inverse_component
/-- `BandCoverTests.iso_inverse_component`: For every matching family and every i, the inverse arrow component equals the inverse of the prescribed local evaluated automorphism. -/
example {U : C} (R : Sieve U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) (i : R.arrows.category) :
    (coverIso F R z hz x).inv.hom i =
      (eval F (𝟙 i.obj.left) ((F.map i.obj.hom.op.toLoc).toFunctor.obj x) (z i)).inv := by sorry

-- BandCoverTests.iso_empty
/-- `BandCoverTests.iso_empty`: If the native arrow category of R is empty, its descent automorphism equals the identity, for any input family. No empty-cover assumption or object-descent conclusion is made. -/
example {U : C} (R : Sieve U) [IsEmpty R.arrows.category]
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) : coverIso F R z hz x = 1 := by sorry

-- BandCoverTests.aut_one
/-- `BandCoverTests.aut_one`: For every covering sieve, the identity central family descends to identity on x. -/
example (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) (x : F.obj (.mk (op U))) :
    coverAut F J R hR (fun _ => 1) (fun _ _ _ => map_one _) x = 1 := by sorry

-- BandCoverTests.aut_existing
/-- `BandCoverTests.aut_existing`: If z_i is the restriction of an existing s∈ZF(U), the descended automorphism equals ev_(id U,x)(s), rather than an unspecified isomorphic automorphism. -/
example (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (s : IntrinsicBandSection F U) (x : F.obj (.mk (op U))) :
    coverAut F J R hR (fun i => restrict F i.obj.hom s)
      (fun i j g => by rw [restrict_comp, Over.w g.hom]) x = eval F (𝟙 U) x s := by sorry

-- BandCoverTests.aut_trivial_inertia
/-- `BandCoverTests.aut_trivial_inertia`: If Aut(x) is subsingleton, every matching central family on a covering sieve descends to the identity on x. -/
example (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) [Subsingleton (Aut x)] :
    coverAut F J R hR z hz x = 1 := by sorry

/-- An automorphism glued from compatible local central automorphisms is natural with respect to every fibre arrow, by equality on the covering sieve. -/
theorem coverAut_naturality (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    {x y : F.obj (.mk (op U))} (f : x ⟶ y) :
    f ≫ (coverAut F J R hR z hz y).hom =
      (coverAut F J R hR z hz x).hom ≫ f := by sorry

/-- descend the inverse family with its matching proof. -/
theorem coverAut_inv (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) :
    coverAut F J R hR (fun i => (z i)⁻¹)
      (fun i j g => by rw [map_inv, hz]) x = (coverAut F J R hR z hz x)⁻¹ := by sorry

/-- Gluing compatible central automorphisms and their inverses gives a unit in the centre of the identity functor on the base fibre. -/
noncomputable def coverCenter (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i) :
    (CatCenter (F.obj (.mk (op U))))ˣ := by sorry

/-- `IntrinsicBandSections.coverCenter_app_hom`: The hom component at x is exactly coverAut(R,z,x).hom. -/
theorem coverCenter_app_hom (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) :
    (coverCenter F J R hR z hz).val.app x =
      (coverAut F J R hR z hz x).hom := by sorry

/-- `IntrinsicBandSections.coverCenter_app_inv`: The inverse component at x is exactly coverAut(R,z,x).inv. -/
theorem coverCenter_app_inv (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) :
    (coverCenter F J R hR z hz).inv.app x =
      (coverAut F J R hR z hz x).inv := by sorry

/-- `IntrinsicBandSections.coverCenter_map_hom`: For every covering arrow i and x over U, F(i) maps c_R(z).val.app(x) to z_i(V_i,id).val.app(F(i)(x)). -/
theorem coverCenter_map_hom (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) (i : R.arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.map ((coverCenter F J R hR z hz).val.app x) =
      (val F (z i) i.obj.left (𝟙 i.obj.left)).val.app
        ((F.map i.obj.hom.op.toLoc).toFunctor.obj x) := by sorry

/-- `IntrinsicBandSections.coverCenter_one`: The identity matching family gives the identity centre unit. -/
theorem coverCenter_one (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) :
    coverCenter F J R hR (fun _ => 1) (fun _ _ _ => map_one _) = 1 := by sorry

/-- `IntrinsicBandSections.coverCenter_inv`: The centre unit of the pointwise inverse matching family equals the inverse of the original centre unit. -/
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

/-- `IntrinsicBandSections.coverCenter_existing`: For z_i=r_i(s) with s∈ZF(U), c_R(z)=s(U,id), using the exact native reindexing triangle identities. -/
theorem coverCenter_existing (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) (s : IntrinsicBandSection F U) :
    coverCenter F J R hR (fun i => restrict F i.obj.hom s)
      (fun i j g => by rw [restrict_comp, Over.w g.hom]) = val F s U (𝟙 U) := by sorry

-- BandCenterCoverTests.center_one
/-- `BandCenterCoverTests.center_one`: On any covering sieve of a prestack, the identity local sections give the identity centre unit. -/
example (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) :
    coverCenter F J R hR (fun _ => 1) (fun _ _ _ => map_one _) = 1 := by sorry

-- BandCenterCoverTests.center_inverse
/-- `BandCenterCoverTests.center_inverse`: On any covering sieve, the actual centre unit constructed from inverse local sections is the inverse of the original unit. -/
example (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i) :
    coverCenter F J R hR (fun i => (z i)⁻¹)
      (fun i j g => by rw [map_inv, hz]) = (coverCenter F J R hR z hz)⁻¹ := by sorry

-- BandCenterCoverTests.center_existing
/-- `BandCenterCoverTests.center_existing`: The matching restrictions of an existing central section recover exactly its fibre-centre component at (U,id), retaining the section instead of replacing it by an unspecified class. -/
example (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) (s : IntrinsicBandSection F U) :
    coverCenter F J R hR (fun i => restrict F i.obj.hom s)
      (fun i j g => by rw [restrict_comp, Over.w g.hom]) = val F s U (𝟙 U) := by sorry

-- BandCenterCoverTests.center_empty_fibre
/-- `BandCenterCoverTests.center_empty_fibre`: If the actual fibre F(U) is empty, the descended centre unit is identity for any matching local family. The cover need not be empty, and no conclusion about all central sections on C/U follows. -/
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
/-- `IntrinsicBandSections.coverCenterAt_map_hom`: For h:X→V in R.pullback(a), F(h) maps c_(R,z,a)(x) to z_(h≫a)(X,id)(F(h)(x)). -/
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
/-- `IntrinsicBandSections.coverCenterAt_compatible`: For every g:W→V, F(g) maps c_(R,z,a)(x) to c_(R,z,g≫a)(F(g)(x)). -/
theorem coverCenterAt_compatible (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    {V W : C} (a : V ⟶ U) (g : W ⟶ V) (x : F.obj (.mk (op V))) :
    (F.map g.op.toLoc).toFunctor.map ((coverCenterAt F J R hR z hz a).val.app x) =
      (coverCenterAt F J R hR z hz (g ≫ a)).val.app
        ((F.map g.op.toLoc).toFunctor.obj x) := by sorry
/-- `IntrinsicBandSections.coverCenterAt_one`: The identity matching family gives the identity fibre-centre unit over every a. -/
theorem coverCenterAt_one (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) {V : C} (a : V ⟶ U) :
    coverCenterAt F J R hR (fun _ => 1) (fun _ _ _ => map_one _) a = 1 := by sorry
/-- `IntrinsicBandSections.coverCenterAt_inv`: The unit over a of the inverse matching family is the inverse of c_(R,z,a). -/
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
/-- `IntrinsicBandSections.glue_val`: At a:V→U the component of glue(R,z) is exactly c_(R,z,a). -/
theorem glue_val (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i) {V : C} (a : V ⟶ U) :
    val F (glue F J R hR z hz) V a = coverCenterAt F J R hR z hz a := by sorry
/-- `IntrinsicBandSections.glue_restrict`: For every i in R, r_i(glue(R,z))=z_i as actual compatible sections. -/
theorem glue_restrict (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i) (i : R.arrows.category) :
    restrict F i.obj.hom (glue F J R hR z hz) = z i := by sorry
/-- `IntrinsicBandSections.glue_one`: Gluing the identity matching family gives the identity section. -/
theorem glue_one (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) :
    glue F J R hR (fun _ => 1) (fun _ _ _ => map_one _) = 1 := by sorry
/-- `IntrinsicBandSections.glue_inv`: Gluing the inverse matching family gives glue(R,z)⁻¹. -/
theorem glue_inv (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i) :
    glue F J R hR (fun i => (z i)⁻¹) (fun i j g => by rw [map_inv, hz]) =
      (glue F J R hR z hz)⁻¹ := by sorry
/-- `IntrinsicBandSections.coverCenterAt_existing`: For the matching restrictions of s∈ZF(U), c_(R,r(s),a)=s(V,a). -/
theorem coverCenterAt_existing (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) (s : IntrinsicBandSection F U)
    {V : C} (a : V ⟶ U) :
    coverCenterAt F J R hR (fun i => restrict F i.obj.hom s)
      (fun i j g => by rw [restrict_comp, Over.w g.hom]) a = val F s V a := by sorry

/-- Compatible central automorphism families form a sheaf: glue component arrows and their inverses by the native Hom sheaves, then check naturality locally. -/
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

/-- `IntrinsicBandSections.glue_unique`: Any section s with r_i(s)=z_i for all i in R equals glue(R,z). -/
theorem glue_unique [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (s : IntrinsicBandSection F U)
    (hs : ∀ i : R.arrows.category, restrict F i.obj.hom s = z i) :
    s = glue F J R hR z hz := by sorry
/-- `IntrinsicBandSections.glue_existing`: Gluing the matching restrictions of an existing s∈ZF(U) gives s exactly. -/
theorem glue_existing [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U)
    (s : IntrinsicBandSection F U) :
    glue F J R hR (fun i => restrict F i.obj.hom s)
      (fun i j g => by rw [restrict_comp, Over.w g.hom]) = s := by sorry
-- BandCenterPullbackTests.one
/-- `BandCenterPullbackTests.one`: For every covering sieve and a:V→U, the identity local family gives c_(R,1,a)=1. -/
example [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U) {V : C} (a : V ⟶ U) :
    coverCenterAt F J R hR (fun _ => 1) (fun _ _ _ => map_one _) a = 1 := by sorry
-- BandCenterPullbackTests.inverse
/-- `BandCenterPullbackTests.inverse`: For every covering sieve and a:V→U, c_(R,z⁻¹,a)=c_(R,z,a)⁻¹, retaining the actual inverse component. -/
example [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j), restrict F g.hom.left (z j) = z i)
    {V : C} (a : V ⟶ U) :
    coverCenterAt F J R hR (fun i => (z i)⁻¹) (fun i j g => by rw [map_inv, hz]) a =
      (coverCenterAt F J R hR z hz a)⁻¹ := by sorry
-- BandCenterPullbackTests.existing
/-- `BandCenterPullbackTests.existing`: For an existing s∈ZF(U), descending its restrictions on the pullback cover along a recovers exactly s(V,a), not a conjugacy class. -/
example [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U)
    (s : IntrinsicBandSection F U) {V : C} (a : V ⟶ U) :
    coverCenterAt F J R hR (fun i => restrict F i.obj.hom s)
      (fun i j g => by rw [restrict_comp, Over.w g.hom]) a = val F s V a := by sorry
-- BandCenterGlueTests.one
/-- `BandCenterGlueTests.one`: For every covering sieve of a prestack, glue(R,1)=1 in ZF(U). -/
example [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U) :
    glue F J R hR (fun _ => 1) (fun _ _ _ => map_one _) = 1 := by sorry
-- BandCenterGlueTests.inverse
/-- `BandCenterGlueTests.inverse`: For every matching central family on a covering sieve, glue(R,z⁻¹)=glue(R,z)⁻¹. -/
example [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j), restrict F g.hom.left (z j) = z i) :
    glue F J R hR (fun i => (z i)⁻¹) (fun i j g => by rw [map_inv, hz]) =
      (glue F J R hR z hz)⁻¹ := by sorry
-- BandCenterGlueTests.existing
/-- `BandCenterGlueTests.existing`: For every s∈ZF(U), gluing its matching restrictions along any covering sieve recovers s, with all its slice components retained. -/
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
/-- For a gerbe, evaluation at one object is injective by local isomorphisms and Hom-sheaf descent. -/
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
/-- For a gerbe with commutative inertia, every automorphism at a chosen base object extends to a compatible central family, using local isomorphisms, conjugation and common refinement. -/
theorem eval_surjective (U : C) (x : F.obj (.mk (op U))) :
    Function.Surjective (eval F (𝟙 U) x) := by sorry

include hGerbe hComm in
/-- For an abelian-inertia gerbe, evaluation is a group equivalence from compatible central sections to the automorphisms of the chosen object. -/
noncomputable def evalEquiv (U : C) (x : F.obj (.mk (op U))) :
    IntrinsicBandSection F U ≃* Aut x :=
  MulEquiv.ofBijective (eval F (𝟙 U) x)
    ⟨eval_injective F J U x, eval_surjective F J hComm U x⟩

/-- Under the commutative-gerbe evaluation equivalence, a compatible central family maps to its automorphism at the selected slice object. -/
theorem evalEquiv_apply (U : C) (x : F.obj (.mk (op U)))
    (s : IntrinsicBandSection F U) :
    evalEquiv F J hComm U x s = eval F (𝟙 U) x s := rfl

include hComm in
/-- A gerbe with commutative inertia carries the banding by its intrinsic additive band sheaf, with evaluation equivalences and their restriction and conjugation equations. -/
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

/-- `IntrinsicBandSections.banding_apply`: At U,x,a the band automorphism is ev_(id,x)(a). -/
theorem banding_apply (U : C) (x : F.obj (.mk (op U)))
    (a : Multiplicative ((sheaf F J).obj.obj (op U))) :
    (banding F J hComm).autEquiv U x a = eval F (𝟙 U) x a.toAdd.toMul := rfl

variable {hComm}
variable (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)

/-- The specified band automorphisms commute with every fibre arrow, by the stored conjugation compatibility. -/
theorem coefficient_naturality (U : C) {x y : F.obj (.mk (op U))}
    (f : x ⟶ y) (a : Multiplicative (A.obj.obj (op U))) :
    f ≫ (b.autEquiv U y a).hom = (b.autEquiv U x a).hom ≫ f := by
  let : IsIso f := IsGerbe.isIso_hom (F := F) (J := J) U f
  have h := congrArg Iso.hom (b.conjugation U (asIso f) a)
  change inv f ≫ (b.autEquiv U x a).hom ≫ f = (b.autEquiv U y a).hom at h
  rw [← h]
  simp only [← Category.assoc, IsIso.hom_inv_id, Category.id_comp]

/-- The band homomorphism gives an invertible natural automorphism of the identity fibre functor at each coefficient. -/
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

/-- coefficientCenter_app has the explicit hypotheses and component equation stated below. -/
theorem coefficientCenter_app (U : C) (x : F.obj (.mk (op U)))
    (a : Multiplicative (A.obj.obj (op U))) :
    (Aut.unitsEndEquivAut (𝟭 (F.obj (.mk (op U))))
      (coefficientCenter F J A b U a)).app x = b.autEquiv U x a := by
  apply Iso.ext
  rfl

/-- `IntrinsicBandSections.coefficientCenter_inv`: z_b(U)(a inverse) is z_b(U)(a) inverse. -/
theorem coefficientCenter_inv (U : C) (a : Multiplicative (A.obj.obj (op U))) :
    coefficientCenter F J A b U a⁻¹ = (coefficientCenter F J A b U a)⁻¹ :=
  map_inv (coefficientCenter F J A b U) a

/-- the band pullback equation. -/
theorem coefficientCenter_restrict {U V : C} (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    (F.map f.op.toLoc).toFunctor.map ((coefficientCenter F J A b U a).val.app x) =
      (coefficientCenter F J A b V
        (Multiplicative.ofAdd (A.obj.map f.op a.toAdd))).val.app
          ((F.map f.op.toLoc).toFunctor.obj x) := by
  exact congrArg Iso.hom (b.pullback f x a)

/-- A band coefficient determines the compatible central family whose evaluations are exactly the specified band automorphisms after coefficient restriction. -/
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

/-- fromBanding_eval has the explicit hypotheses and component equation stated below. -/
theorem fromBanding_eval {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op V)))
    (a : Multiplicative (A.obj.obj (op U))) :
    eval F f x (fromBanding F J A b U a) =
      b.autEquiv V x (Multiplicative.ofAdd (A.obj.map f.op a.toAdd)) :=
  coefficientCenter_app F J A b V x _

/-- fromBanding_restrict has the explicit hypotheses and component equation stated below. -/
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

/-- A compatible central family equals the one induced by a band coefficient when all of its evaluations equal the specified band automorphisms of that coefficient. -/
theorem fromBanding_ext (U : C) (a : Multiplicative (A.obj.obj (op U)))
    (s : IntrinsicBandSection F U)
    (h : ∀ (V : C) (f : V ⟶ U) (x : F.obj (.mk (op V))),
      eval F f x s = b.autEquiv V x (Multiplicative.ofAdd (A.obj.map f.op a.toAdd))) :
    s = fromBanding F J A b U a := by
  apply ext
  intro V f x
  exact congrArg Iso.hom ((h V f x).trans (fromBanding_eval F J A b f x a).symm)

/-- The band-to-intrinsic-centre section maps commute with restriction and define a natural transformation of additive-group presheaves. -/
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

/-- `IntrinsicBandSections.fromBandingPresheaf_app`: Its component sends a to Additive(c_b(U)(Multiplicative(a))). -/
theorem fromBandingPresheaf_app (U : C) (a : A.obj.obj (op U)) :
    ((fromBandingPresheaf F J A b).app (op U) a).toMul =
      fromBanding F J A b U (Multiplicative.ofAdd a) := rfl

/-- `IntrinsicBandSections.fromBandingPresheaf_naturality`: The natural-transformation components commute with the coefficient restriction and the actual central-section reindexing map for every f:V→U. -/
theorem fromBandingPresheaf_naturality {U V : C} (f : V ⟶ U) :
    A.obj.map f.op ≫ (fromBandingPresheaf F J A b).app (op V) =
      (fromBandingPresheaf F J A b).app (op U) ≫ (presheaf F).map f.op :=
  (fromBandingPresheaf F J A b).naturality f.op

/-- Distinct bandings remain distinct when their automorphisms differ at some coefficient and object; the intrinsic-centre comparison takes no quotient by coefficient symmetries. -/
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

/-- Local gerbe objects prove local bijectivity;
the coefficient sheaf glues the inverse even when F(U) is empty. -/
theorem band_unique : ∃! e : A ≅ sheaf F J,
    ∀ (U : C) (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))),
      eval F (𝟙 U) x (((Sheaf.homEquiv e.hom).app (op U)) a.toAdd).toMul =
        b.autEquiv U x a := by sorry

-- BandCenterTests.centralImage: also applies to nonabelian fibre groups.
/-- `BandCenterTests.centralImage`: For an arbitrary fibre category, an evaluated section commutes with every automorphism b; for S3 coordinates the transposition(01) is excluded by testing commutation with(12). -/
example {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op V)))
    (s : IntrinsicBandSection F U) (b : Aut x) :
    eval F f x s * b = b * eval F f x s := eval_central F f x s b

-- BandEvaluationTests.reindexedArrow: restrictions use the composite arrow.
/-- `BandEvaluationTests.reindexedArrow`: Evaluate a section over W after reindexing along V→U, and obtain its original component at W→V→U, with no terminal-object or gerbe assumption. -/
example {U V W : C} (f : V ⟶ U) (a : W ⟶ V)
    (x : F.obj (.mk (op W))) (s : IntrinsicBandSection F U) :
    eval F a x (restrict F f s) = eval F (a ≫ f) x s := eval_reindex F f a x s

end IntrinsicBandSections

namespace IntrinsicBandTestsRT
open IntrinsicBandSections
variable (J : GrothendieckTopology C) [hGerbe : IsGerbe F J]
include hGerbe

-- BandEvaluationTests.generator, in fixed C3 coordinates.
/-- `BandEvaluationTests.generator`: For B(C3) evaluation sends its generator section to the nonidentity automorphism1. -/
example (hComm : ∀ (U : C) (x : F.obj (.mk (op U))) (a b : Aut x), a * b = b * a)
    (U : C) (x : F.obj (.mk (op U))) (e : Aut x ≃* Multiplicative (ZMod 3)) :
    ∃ s : IntrinsicBandSection F U,
      e (eval F (𝟙 U) x s) = Multiplicative.ofAdd (1 : ZMod 3) := by sorry

-- BandCenterTests.identity, conditional on the displayed trivial inertia.
/-- `BandCenterTests.identity`: For the terminal fibre groupoid, the group of compatible central sections is trivial. -/
example (U : C) (x : F.obj (.mk (op U))) (h : Subsingleton (Aut x)) :
    Subsingleton (IntrinsicBandSection F U) := by
  let := h
  exact (eval_injective F J U x).subsingleton

-- BandEvaluationTests.noncentral, with the transposition coordinate.
/-- `BandEvaluationTests.noncentral`: The transposition(01) of S3 fails the naturality equation with(12), so it cannot occur as the evaluation of a central section of B(S3). -/
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

/-- `IntrinsicBandChecks.composition`: restricting a compatible central family along two arrows agrees with restriction along their composite. -/
example {U V W : C} (f : V ⟶ U) (g : W ⟶ V) (s : IntrinsicBandSection F U) :
    restrict F g (restrict F f s) = restrict F (g ≫ f) s := by
  apply IntrinsicBandSections.ext
  intro X a x
  simp only [restrict_apply, Category.assoc]

/-- `IntrinsicBandChecks.conjugation`: evaluation at isomorphic objects is related by conjugation through the actual chosen isomorphism. -/
example {U V : C} (f : V ⟶ U) {x y : F.obj (.mk (op V))}
    (e e' : x ≅ y) (s : IntrinsicBandSection F U) :
    Aut.autMulEquivOfIso e (eval F f x s) =
      Aut.autMulEquivOfIso e' (eval F f x s) := by
  rw [eval_conjugation, eval_conjugation]

/-- `IntrinsicBandChecks.coefficient`: evaluation of a constant cyclic-three central family retains its nonidentity coefficient. -/
example (hComm : ∀ (U : C) (x : F.obj (.mk (op U))) (a b : Aut x), a * b = b * a)
    (U : C) (x : F.obj (.mk (op U))) (e : Aut x ≃* Multiplicative (ZMod 3)) :
    ¬ Subsingleton (IntrinsicBandSection F U) := by sorry

-- BandCenterTests.C3, in the chosen automorphism coordinate.
/-- `BandCenterTests.C3`: On the one-object point-site gerbe B(C3), there are three central sections, with evaluation recovering all of C3. -/
example (hComm : ∀ (U : C) (x : F.obj (.mk (op U))) (a b : Aut x), a * b = b * a)
    (U : C) (x : F.obj (.mk (op U))) (e : Aut x ≃* Multiplicative (ZMod 3)) :
    Nat.card (IntrinsicBandSection F U) = 3 := by sorry

-- BandCenterTests.S3: evaluation lands in the trivial center.
/-- `BandCenterTests.S3`: For B(S3) on a point, sections form the trivial center of S3, rather than all six automorphisms. Thus evaluation onto inertia fails without abelian inertia. -/
example (U : C) (x : F.obj (.mk (op U)))
    (e : Aut x ≃* Equiv.Perm (Fin 3)) :
    Nat.card (IntrinsicBandSection F U) = 1 := by sorry

-- BandRestrictionTests.id applies, in particular, to the nonzero C3 section.
/-- `BandRestrictionTests.id`: Restriction along identity fixes the nonzero generator of the C3 point band. -/
example (U : C) (s : IntrinsicBandSection F U) : restrict F (𝟙 U) s = s := by
  apply IntrinsicBandSections.ext
  intro V f x
  simp only [restrict_apply, Category.comp_id]

-- BandComparisonTests.inversion: distinct fixed-band coordinates stay distinct.
/-- `BandComparisonTests.inversion`: If the C3 banding is changed by a↦-a, c_b sends1 to2; these two coefficient identifications are distinct. They cannot be quotiented by Aut(C3). -/
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
/-- `BandCoefficientTests.generator`: Given x, a and a fixed Aut(x)≃C3 coordinate sending b(U,x)(a) to1, evaluation of z_b(U)(a) has coordinate1. -/
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
/-- `BandCoefficientTests.zero`: At every U, the zero additive coefficient maps to the identity central unit. -/
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    (U : C) : coefficientCenter F J A b U (Multiplicative.ofAdd 0) = 1 :=
  (coefficientCenter F J A b U).map_one

-- BandCoefficientTests.inversion: inverse is 2, rather than 1, in C3.
/-- `BandCoefficientTests.inversion`: In the same calibrated C3 coordinate, evaluation of z_b(U)(a inverse) is2. Sending it to1 would erase the inverse. -/
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
/-- `BandNaturalityTests.allArrows`: For any actual b, every fibre arrow f and coefficient a satisfy the displayed naturality equation; no object-equivalence choices occur. -/
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    (U : C) {x y : F.obj (.mk (op U))} (f : x ⟶ y)
    (a : Multiplicative (A.obj.obj (op U))) :
    f ≫ (b.autEquiv U y a).hom = (b.autEquiv U x a).hom ≫ f :=
  coefficient_naturality F J A b U f a

-- BandCoefficientRestrictionTests.mappedObject: evaluate at the pullback.
/-- `BandCoefficientRestrictionTests.mappedObject`: For an actual band coefficient, the mapped automorphism equals b(V,F(f)x)(a restricted to V), at the actual functor-image object. -/
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
/-- `BandComparisonPresheafTests.zero`: Every actual natural-transformation component sends zero to zero. -/
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    (U : C) : (fromBandingPresheaf F J A b).app (op U) 0 = 0 := by
  change fromBanding F J A b U 1 = 1
  exact (fromBanding F J A b U).map_one

-- BandComparisonPresheafTests.add: coefficient addition is section multiplication.
/-- `BandComparisonPresheafTests.add`: The component at a+a′, read as a central section, is the product of the sections c_b(U)(a) and c_b(U)(a′). -/
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    (U : C) (a a' : A.obj.obj (op U)) :
    ((fromBandingPresheaf F J A b).app (op U) (a + a')).toMul =
      fromBanding F J A b U (Multiplicative.ofAdd a) *
        fromBanding F J A b U (Multiplicative.ofAdd a') := by
  exact (fromBanding F J A b U).map_mul (Multiplicative.ofAdd a)
    (Multiplicative.ofAdd a')

-- BandComparisonPresheafTests.restriction: preserves the chosen base arrow.
/-- `BandComparisonPresheafTests.restriction`: Restricting the component at a along the displayed f:V→U is the component at the actual coefficient restriction along f. -/
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    {U V : C} (f : V ⟶ U) (a : A.obj.obj (op U)) :
    restrict F f (((fromBandingPresheaf F J A b).app (op U) a).toMul) =
      ((fromBandingPresheaf F J A b).app (op V) (A.obj.map f.op a)).toMul :=
  fromBanding_restrict F J A b f (Multiplicative.ofAdd a)

-- BandLocalityTests.cover: true covering-sieve joint injectivity.
/-- `BandLocalityTests.cover`: For a gerbe on an arbitrary site, equality of central-section restrictions on a covering sieve forces equality of the original sections; no terminal object or fibre products are needed. -/
example {U : C} (s t : IntrinsicBandSection F U)
    (R : Sieve U) (hR : R ∈ J U)
    (h : ∀ (V : C) (f : V ⟶ U), R f → restrict F f s = restrict F f t) :
    s = t := ext_of_cover F J s t R hR h

-- BandLocalityTests.nonabelian: no commutativity assumption occurs.
/-- `BandLocalityTests.nonabelian`: For any gerbe and an actual x over U, equality ev_(id,x)(s)=ev_(id,x)(t) implies s=t without assuming commutative inertia. For the B(S3) fixture this detects the trivial central-section group rather than asserting surjectivity onto S3. -/
example (U : C) (x : F.obj (.mk (op U))) (s t : IntrinsicBandSection F U)
    (h : eval F (𝟙 U) x s = eval F (𝟙 U) x t) : s = t :=
  eval_injective F J U x h

-- BandCoefficientDetectionTests.noGlobalChoice: no x over U is supplied.
/-- `BandCoefficientDetectionTests.noGlobalChoice`: For any actual A-banding b and any U, equality c_b(U)(a)=c_b(U)(a′) forces a=a′ without supplying x over U. In particular the theorem remains applicable to the nonneutral root-gerbe fixture once its carrier is supplied; no root-gerbe instance is claimed here. -/
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    (U : C) (a a' : Multiplicative (A.obj.obj (op U)))
    (h : fromBanding F J A b U a = fromBanding F J A b U a') : a = a' :=
  fromBanding_injective F J A b U h

-- BandLocalityTests.disconnected: only the finite coordinate consequence.
-- This is not an elaborated classifying-stack or point-site fixture.
/-- `BandLocalityTests.disconnected`: On the point site, the stack given by a disjoint union of two one-object C3 groupoids is not a gerbe: the objects in different components are not locally isomorphic. Its central-section group is C3×C3 of order9, and evaluation at the first object is projection to C3, not injective. The native pair projection proves this coordinate consequence, not a complete point-site fixture. -/
example : ¬ Function.Injective (fun z : ZMod 3 × ZMod 3 ↦ z.1) := by
  intro h
  have he : ((0, 0) : ZMod 3 × ZMod 3) = (0, 1) := h rfl
  have hn : (0 : ZMod 3) ≠ 1 := by decide
  exact hn (congrArg Prod.snd he)

-- BandLocalityTests.singleReduction: ring reduction is not injective.
-- This does not assert that this one arrow is a covering sieve.
/-- `BandLocalityTests.singleReduction`: In the inherited C4→C2→C2 restriction chain, the single reduction C4→C2 sends both0 and2 to0, so it is not injective. A single arbitrary arrow must not be treated as a covering-sieve equality test. The actual native ZMod.castHom reduction is used; no topology making that arrow a cover is asserted. -/
example : ¬ Function.Injective
    (ZMod.castHom (show 2 ∣ 4 from ⟨2, rfl⟩) (ZMod 2)) := by
  intro h
  have he := h (by decide :
    ZMod.castHom (show 2 ∣ 4 from ⟨2, rfl⟩) (ZMod 2) (0 : ZMod 4) =
      ZMod.castHom (show 2 ∣ 4 from ⟨2, rfl⟩) (ZMod 2) (2 : ZMod 4))
  exact (by decide : (0 : ZMod 4) ≠ 2) he

end IntrinsicBandTestsRT

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

/-- A functor maps conjugation through e to conjugation through its actual mapIso(e). -/
theorem map_conjugation (K : D ⥤ E) {x y : D} (e : x ≅ y) (a : Aut x) :
    K.mapAut y (Aut.autMulEquivOfIso e a) =
      Aut.autMulEquivOfIso (K.mapIso e) (K.mapAut x a) := by
  sorry

/-- On hom arrows the preceding functoriality equation is the exact map of e.inv followed by a.hom followed by e.hom. -/
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

/-- Restricting the hom along any i of R returns the prescribed local conjugation hom. -/
theorem conjugateCoverAut_map {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) (i : R.arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.map (conjugateCoverAut F hComm J R hR x y e a).hom =
      (Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a)).hom := by
  sorry

/-- The whole restricted automorphism is conj(e_i)(F(i)^*a), including its inverse. -/
theorem conjugateCoverAut_mapIso {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) (i : R.arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.mapAut y
        (conjugateCoverAut F hComm J R hR x y e a) =
      Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a) := by
  sorry

/-- Every b of Aut(y) with those restrictions equals the lifted automorphism. -/
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

/-- Changing all chosen local e_i on this same sieve R leaves the lifted automorphism unchanged. -/
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

/-- If a global d:x≅y exists, every chosen covering family gives the existing Mathlib conjugation through d. -/
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

/-- The i-th hom component is precisely conj(e_i)(F(i)^*a).hom. -/
theorem conjugateDescentIso_hom_apply (a : Aut x) (i : R.arrows.category) :
    (conjugateDescentIso F hComm R x y e a).hom.hom i =
      (Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a)).hom := by
  sorry

/-- The descent automorphism of a=1 is the identity of D_R(y). -/
theorem conjugateDescentIso_one : conjugateDescentIso F hComm R x y e 1 = 1 := by
  sorry

/-- The descent automorphism of a⁻¹ is the inverse of the descent automorphism of a. -/
theorem conjugateDescentIso_inv (a : Aut x) :
    conjugateDescentIso F hComm R x y e a⁻¹ = (conjugateDescentIso F hComm R x y e a)⁻¹ := by
  sorry

/-- Its value at a is the previously constructed conjugateCoverAut. -/
theorem conjugateCoverHom_apply (a : Aut x) :
    conjugateCoverHom F hComm J R hR x y e a = conjugateCoverAut F hComm J R hR x y e a := by
  sorry

/-- The homomorphism sends 1 to 1. -/
theorem conjugateCoverHom_one : conjugateCoverHom F hComm J R hR x y e 1 = 1 := by
  sorry

/-- It sends a*b to the product of its values, with the native Aut multiplication order. -/
theorem conjugateCoverHom_mul (a b : Aut x) :
    conjugateCoverHom F hComm J R hR x y e (a * b) =
      conjugateCoverHom F hComm J R hR x y e a * conjugateCoverHom F hComm J R hR x y e b := by
  sorry

/-- It sends a⁻¹ to the inverse of its value at a. -/
theorem conjugateCoverHom_inv (a : Aut x) :
    conjugateCoverHom F hComm J R hR x y e a⁻¹ = (conjugateCoverHom F hComm J R hR x y e a)⁻¹ := by
  sorry

-- GerbeConjugateDescentTests.local: the prescribed component is recovered.
/-- `GerbeConjugateDescentTests.local`: For every actual native arrow i of R, the hom component is conj(e_i)(F(i)^*a).hom. -/
example (a : Aut x) (i : R.arrows.category) :
    (conjugateDescentIso F hComm R x y e a).hom.hom i =
      (Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a)).hom := by
  sorry

-- GerbeConjugateDescentTests.identity: no spurious local arrow appears at the unit.
/-- `GerbeConjugateDescentTests.identity`: a=1 gives the identity descent automorphism. -/
example : conjugateDescentIso F hComm R x y e 1 = 1 := by
  sorry

-- GerbeConjugateDescentTests.inverse: the inverse descent arrow is retained.
/-- `GerbeConjugateDescentTests.inverse`: Replacing a by a⁻¹ gives the inverse native descent automorphism, including its actual component arrows. -/
example (a : Aut x) :
    conjugateDescentIso F hComm R x y e a⁻¹ = (conjugateDescentIso F hComm R x y e a)⁻¹ := by
  sorry

-- GerbeConjugateCoverTests.local: full faithfulness recovers the local automorphism.
/-- `GerbeConjugateCoverTests.local`: Every i-th restriction recovers the whole prescribed automorphism conj(e_i)(F(i)^*a). -/
example (a : Aut x) (i : R.arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.mapAut y (conjugateCoverAut F hComm J R hR x y e a) =
      Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a) := by
  sorry

-- GerbeConjugateCoverTests.unique: descent must reflect all components.
/-- `GerbeConjugateCoverTests.unique`: If every restriction of b∈Aut(y) is the prescribed conjugate, then b is the lifted automorphism. -/
example (a : Aut x) (b : Aut y)
    (hb : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.mapAut y b =
        Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a)) :
    b = conjugateCoverAut F hComm J R hR x y e a := by
  sorry

-- GerbeConjugateCoverTests.changeChoice: arbitrary local choices give the same result.
/-- `GerbeConjugateCoverTests.changeChoice`: Replacing e_i by arbitrary other local isomorphisms on the same covering sieve leaves the lift equal. -/
example (a : Aut x)
    (e' : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) :
    conjugateCoverAut F hComm J R hR x y e a = conjugateCoverAut F hComm J R hR x y e' a := by
  sorry

-- GerbeConjugateCoverTests.globalIso: compare with the Mathlib conjugation.
/-- `GerbeConjugateCoverTests.globalIso`: When d:x≅y is global, the lift is exactly Aut.autMulEquivOfIso(d)(a). -/
example (a : Aut x) (d : x ≅ y) :
    conjugateCoverAut F hComm J R hR x y e a = Aut.autMulEquivOfIso d a := by
  sorry

-- GerbeConjugateHomTests.identity: the group homomorphism preserves the unit.
/-- `GerbeConjugateHomTests.identity`: The homomorphism sends the identity automorphism to the identity. -/
example : conjugateCoverHom F hComm J R hR x y e 1 = 1 := by
  sorry

-- GerbeConjugateHomTests.product: multiplication order agrees with Aut.
/-- `GerbeConjugateHomTests.product`: For arbitrary a,b its value at a*b equals its value at a times its value at b. -/
example (a b : Aut x) :
    conjugateCoverHom F hComm J R hR x y e (a * b) =
      conjugateCoverHom F hComm J R hR x y e a * conjugateCoverHom F hComm J R hR x y e b := by
  sorry

-- GerbeConjugateHomTests.inverse: the inverse law belongs to the group homomorphism.
/-- `GerbeConjugateHomTests.inverse`: Its value at a⁻¹ is the actual inverse of its value at a. -/
example (a : Aut x) :
    conjugateCoverHom F hComm J R hR x y e a⁻¹ = (conjugateCoverHom F hComm J R hR x y e a)⁻¹ := by
  sorry

-- GerbeConjugateHomTests.equalObject: every choice of local x-to-x isomorphism fixes a.
/-- `GerbeConjugateHomTests.equalObject`: For y=x, every family of local x-to-x isomorphisms gives the identity map on Aut(x). -/
example (a : Aut x)
    (e₀ : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj x) :
    conjugateCoverHom F hComm J R hR x x e₀ a = a := by
  sorry

end GerbeAutTransport


namespace GerbeAutTransport
variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
variable (hComm : ∀ (V : C) (z : F.obj (.mk (op V))),
  ∀ a b : Aut z, a * b = b * a)
variable (J : GrothendieckTopology C) [F.IsPrestack J]
include hComm
/-- Conjugating descent automorphism data commutes with refinement of the covering family. -/
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

/-- Conjugation transport of a global automorphism, computed after descent to a cover and gluing, is independent of the chosen cover. -/
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

/-- Transport along the inverse descent isomorphism reverses conjugation of compatible local automorphisms. -/
theorem conjugateCoverAut_reverse {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) :
    conjugateCoverAut F hComm J R hR y x (fun i => (e i).symm)
      (conjugateCoverAut F hComm J R hR x y e a) = a := by
  sorry

/-- Conjugate compatible local automorphism families along an isomorphism of descent data, preserving restriction and the overlap equations. -/
noncomputable def conjugateCoverEquiv
    (hComm : ∀ (V : C) (z : F.obj (.mk (op V))), ∀ a b : Aut z, a * b = b * a)
    (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) : Aut x ≃* Aut y := by
  sorry

/-- The conjugation equivalence obtained from cover descent is independent of the cover used. -/
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

/-- Transport along a composite descent isomorphism is the composite of its two conjugation transports. -/
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

/-- The equivalence value at a is conjugateCoverAut for the same data. -/
theorem conjugateCoverEquiv_apply (a : Aut x) :
    conjugateCoverEquiv F hComm J R hR x y e a =
      conjugateCoverAut F hComm J R hR x y e a := by
  sorry

/-- Its inverse value at b is conjugateCoverAut for the inverse local isomorphisms. -/
theorem conjugateCoverEquiv_symm_apply (b : Aut y) :
    (conjugateCoverEquiv F hComm J R hR x y e).symm b =
      conjugateCoverAut F hComm J R hR y x (fun i => (e i).symm) b := by
  sorry

/-- Each actual covering restriction of its value is the prescribed local conjugate. -/
theorem conjugateCoverEquiv_mapIso (a : Aut x) (i : R.arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.mapAut y
      (conjugateCoverEquiv F hComm J R hR x y e a) =
      Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a) := by
  sorry

/-- If d:x≅y is global, the whole equivalence equals Mathlib Aut.autMulEquivOfIso d. -/
theorem conjugateCoverEquiv_of_iso (d : x ≅ y) :
    conjugateCoverEquiv F hComm J R hR x y e = Aut.autMulEquivOfIso d := by
  sorry

/-- The equivalence sends the identity automorphism to the identity. -/
theorem conjugateCoverEquiv_one : conjugateCoverEquiv F hComm J R hR x y e 1 = 1 := by
  sorry

/-- It preserves native Aut multiplication, in its existing composition order. -/
theorem conjugateCoverEquiv_mul (a b : Aut x) :
    conjugateCoverEquiv F hComm J R hR x y e (a * b) =
      conjugateCoverEquiv F hComm J R hR x y e a * conjugateCoverEquiv F hComm J R hR x y e b := by
  sorry

/-- It sends the inverse automorphism to the inverse of its value. -/
theorem conjugateCoverEquiv_inv (a : Aut x) :
    conjugateCoverEquiv F hComm J R hR x y e a⁻¹ =
      (conjugateCoverEquiv F hComm J R hR x y e a)⁻¹ := by
  sorry

-- GerbeCoverEquivTests.equalObject: arbitrary local automorphisms induce the identity equivalence.
/-- `GerbeCoverEquivTests.equalObject`: When y=x, arbitrary local x-to-x isomorphisms induce the native identity equivalence on Aut(x). -/
example (e₀ : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj x) :
    conjugateCoverEquiv F hComm J R hR x x e₀ = MulEquiv.refl (Aut x) := by
  sorry

-- GerbeCoverEquivTests.roundTrip: the inverse must recover arbitrary source automorphisms.
/-- `GerbeCoverEquivTests.roundTrip`: Transporting any source automorphism and then applying the inverse equivalence recovers that automorphism. -/
example (a : Aut x) :
    (conjugateCoverEquiv F hComm J R hR x y e).symm
      (conjugateCoverEquiv F hComm J R hR x y e a) = a := by
  sorry

-- GerbeCoverEquivTests.targetRoundTrip: no target automorphism may be lost.
/-- `GerbeCoverEquivTests.targetRoundTrip`: Applying the inverse to any target automorphism and then the forward equivalence recovers that target automorphism. -/
example (b : Aut y) :
    conjugateCoverEquiv F hComm J R hR x y e
      ((conjugateCoverEquiv F hComm J R hR x y e).symm b) = b := by
  sorry

-- GerbeCoverEquivTests.local: restrictions identify the equivalence with conjugation.
/-- `GerbeCoverEquivTests.local`: Every native covering restriction of the value is the prescribed local conjugation, as an actual isomorphism. -/
example (a : Aut x) (i : R.arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.mapAut y
      (conjugateCoverEquiv F hComm J R hR x y e a) =
      Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a) := by
  sorry

-- GerbeCoverEquivTests.globalIso: retain the labelled Mathlib conjugation map.
/-- `GerbeCoverEquivTests.globalIso`: Given a global isomorphism d, the equivalence is exactly the labelled native conjugation equivalence through d. -/
example (d : x ≅ y) : conjugateCoverEquiv F hComm J R hR x y e = Aut.autMulEquivOfIso d := by
  sorry

-- GerbeCoverEquivTests.changeCover: compare whole maps on unrelated covering sieves.
/-- `GerbeCoverEquivTests.changeCover`: Two unrelated actual covering sieves and arbitrary local choices give equal whole multiplicative equivalences. -/
example (S : Sieve U) (hS : S ∈ J U)
    (d : ∀ i : S.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) :
    conjugateCoverEquiv F hComm J R hR x y e = conjugateCoverEquiv F hComm J S hS x y d := by
  sorry

-- GerbeCoverEquivTests.product: multiplication is the Aut multiplication.
/-- `GerbeCoverEquivTests.product`: The value at a*b equals the product of the two values in the native Aut group. -/
example (a b : Aut x) : conjugateCoverEquiv F hComm J R hR x y e (a * b) =
    conjugateCoverEquiv F hComm J R hR x y e a * conjugateCoverEquiv F hComm J R hR x y e b := by
  sorry

end GerbeAutTransport

namespace GerbeAutTransport
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

end GerbeAutTransport

namespace IntrinsicBandSections
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
/-- Lₓ(1)=1. -/
theorem lift_one {U : C} (x : F.obj (.mk (op U))) :
    lift F J hComm x 1 = 1 := by sorry
/-- Lₓ(ab)=Lₓ(a)Lₓ(b), with native automorphism multiplication. -/
theorem lift_mul {U : C} (x : F.obj (.mk (op U))) (a b : Aut x) :
    lift F J hComm x (a * b) = lift F J hComm x a * lift F J hComm x b := by sorry
/-- Lₓ(a inverse) is Lₓ(a) inverse. -/
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
/-- If d:f*x≅y is global, evaluation of Lₓ(a) at f,y is native conjugation through d of f*a. -/
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
/-- Lₓ is injective: evaluation at the identity recovers a. -/
theorem lift_injective {U : C} (x : F.obj (.mk (op U))) :
    Function.Injective (lift F J hComm x) := by sorry
-- GerbeBandLiftTests.identity
/-- `GerbeBandLiftTests.identity`: Lₓ sends the identity automorphism to the unit section. -/
example {U : C} (x : F.obj (.mk (op U))) : lift F J hComm x 1 = 1 := by sorry
-- GerbeBandLiftTests.nontrivial
/-- `GerbeBandLiftTests.nontrivial`: If a is not the identity automorphism, Lₓ(a) is not the unit section; constant-unit transport fails. -/
example {U : C} (x : F.obj (.mk (op U))) (a : Aut x) (ha : a ≠ 1) :
    lift F J hComm x a ≠ 1 := by sorry
-- GerbeBandLiftTests.globalIso
/-- `GerbeBandLiftTests.globalIso`: Evaluation at f,y with a supplied isomorphism f*x≅y agrees with its labelled native conjugation of f*a. -/
example {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op U))) (a : Aut x)
    (y : F.obj (.mk (op V))) (d : (F.map f.op.toLoc).toFunctor.obj x ≅ y) :
    eval F f y (lift F J hComm x a) =
      Aut.autMulEquivOfIso d ((F.map f.op.toLoc).toFunctor.mapAut x a) := by sorry
-- GerbeBandLiftTests.restrictionChain
/-- `GerbeBandLiftTests.restrictionChain`: For W→V→U, twice restricting Lₓ(a) equals lifting the automorphism restricted along the composite arrow, on the composite pullback object. -/
example {U V W : C} (f : V ⟶ U) (g : W ⟶ V)
    (x : F.obj (.mk (op U))) (a : Aut x) :
    restrict F g (restrict F f (lift F J hComm x a)) =
      lift F J hComm ((F.map (g ≫ f).op.toLoc).toFunctor.obj x)
        ((F.map (g ≫ f).op.toLoc).toFunctor.mapAut x a) := by sorry
-- GerbeBandLiftTests.recovery
/-- `GerbeBandLiftTests.recovery`: Evaluation of the lifted automorphism at the identity object returns precisely that automorphism. -/
example {U : C} (x : F.obj (.mk (op U))) (a : Aut x) :
    eval F (𝟙 U) x (lift F J hComm x a) = a := by sorry
end IntrinsicBandSections

variable {C : Type u} [Category.{v} C]
namespace IntrinsicBandSections
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
variable (J : GrothendieckTopology C) [IsGerbe F J]
variable (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)

-- Recover a coefficient on any base carrying a gerbe object.
/-- Recover a coefficient on any base carrying a gerbe object.
 -/
theorem fromBanding_surjective_of_object (U : C) (x : F.obj (.mk (op U))) :
    Function.Surjective (fromBanding F J A b U) := by
  sorry

-- Local nonemptiness supplies these coefficients; no global object is chosen.
/-- Local nonemptiness supplies these coefficients; no global object is chosen.
 -/
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

/-- For every f∈R, c_b(V)(a_f)=r_f(z) as actual compatible-centre sections. -/
theorem localBandCoefficient_recovery {U V : C} (R : Sieve U)
    (objects : ∀ ⦃W : C⦄ (f : W ⟶ U), R f → F.obj (.mk (op W)))
    (z : IntrinsicBandSection F U) (f : V ⟶ U) (hf : R f) :
    fromBanding F J A b V (Multiplicative.ofAdd
      (localBandCoefficient F J A b R objects z f hf)) = restrict F f z := by
  sorry

/-- The constructed local coefficient family is compatible on every commutative test square g≫f=h≫k in the native presieve matching-family sense. No fibre products, cover condition or compatibility between the chosen objects is required. -/
theorem localBandCoefficient_compatible {U : C} (R : Sieve U)
    (objects : ∀ ⦃V : C⦄ (f : V ⟶ U), R f → F.obj (.mk (op V)))
    (z : IntrinsicBandSection F U) :
    (localBandCoefficient F J A b R objects z).Compatible := by
  sorry

/-- Every compatible central family in an abelian-banded gerbe is induced by a unique band section; this assertion records surjectivity of that map. -/
theorem fromBanding_surjective (U : C) :
    Function.Surjective (fromBanding F J A b U) := by
  sorry

end IntrinsicBandSections

namespace IntrinsicBandSections
variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
variable (J : GrothendieckTopology C) [IsGerbe F J]
variable (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)

/-- For every U construct the native group equivalence Multiplicative(A(U))≃*ZF(U) whose forward map is exactly c_b(U). Its inverse commutes with every base restriction and restricts to every chosen local coefficient family; local objects need not exist over U. -/
noncomputable def fromBandingEquiv (b : AbelianBanding F J A) (U : C) :
    Multiplicative (A.obj.obj (op U)) ≃* IntrinsicBandSection F U := by
  sorry

/-- The forward map is exactly c_b(U). -/
theorem fromBandingEquiv_apply (U : C) (a : Multiplicative (A.obj.obj (op U))) :
    fromBandingEquiv F J A b U a = fromBanding F J A b U a := by
  sorry

/-- The inverse after restricting the central section equals the coefficient restriction of its inverse. -/
theorem fromBandingEquiv_symm_restrict {U V : C} (f : V ⟶ U)
    (z : IntrinsicBandSection F U) :
    Multiplicative.ofAdd (A.obj.map f.op ((fromBandingEquiv F J A b U).symm z).toAdd) =
      (fromBandingEquiv F J A b V).symm (restrict F f z) := by
  sorry

-- All original choices of local objects give the same glued inverse.
/-- All original choices of local objects give the same glued inverse.
 -/
theorem fromBandingEquiv_symm_local {U V : C} (R : Sieve U)
    (objects : ∀ ⦃W : C⦄ (f : W ⟶ U), R f → F.obj (.mk (op W)))
    (z : IntrinsicBandSection F U) (f : V ⟶ U) (hf : R f) :
    A.obj.map f.op ((fromBandingEquiv F J A b U).symm z).toAdd =
      localBandCoefficient F J A b R objects z f hf := by
  sorry

-- LocalCoefficientTests.unit
/-- `LocalCoefficientTests.unit`: The local coefficient of the unit central section is zero on every arrow. -/
example {U V : C} (R : Sieve U)
    (objects : ∀ ⦃W : C⦄ (f : W ⟶ U), R f → F.obj (.mk (op W)))
    (f : V ⟶ U) (hf : R f) :
    localBandCoefficient F J A b R objects 1 f hf = 0 := by
  sorry

-- LocalCoefficientTests.existing
/-- `LocalCoefficientTests.existing`: On c_b(U)(a), the local coefficient at f is exactly a restricted along f. -/
example {U V : C} (R : Sieve U)
    (objects : ∀ ⦃W : C⦄ (f : W ⟶ U), R f → F.obj (.mk (op W)))
    (a : Multiplicative (A.obj.obj (op U))) (f : V ⟶ U) (hf : R f) :
    localBandCoefficient F J A b R objects (fromBanding F J A b U a) f hf =
      A.obj.map f.op a.toAdd := by
  sorry

-- LocalCoefficientTests.choiceIndependent
/-- `LocalCoefficientTests.choiceIndependent`: Two independently supplied local object families on the same sieve give the same local coefficients, even without chosen object isomorphisms. -/
example {U V : C} (R : Sieve U)
    (objects objects' : ∀ ⦃W : C⦄ (f : W ⟶ U), R f → F.obj (.mk (op W)))
    (z : IntrinsicBandSection F U) (f : V ⟶ U) (hf : R f) :
    localBandCoefficient F J A b R objects z f hf =
      localBandCoefficient F J A b R objects' z f hf := by
  sorry

-- BandInverseTests.unit
/-- `BandInverseTests.unit`: The inverse sends the unit section to the unit coefficient. -/
example (U : C) : (fromBandingEquiv F J A b U).symm 1 = 1 := by
  sorry

-- BandInverseTests.coefficientRoundTrip
/-- `BandInverseTests.coefficientRoundTrip`: The inverse of the actual c_b(U)(a) is exactly a. -/
example (U : C) (a : Multiplicative (A.obj.obj (op U))) :
    (fromBandingEquiv F J A b U).symm (fromBanding F J A b U a) = a := by
  sorry

-- BandInverseTests.sectionRoundTrip
/-- `BandInverseTests.sectionRoundTrip`: Applying actual c_b(U) to the inverse of any z returns z. -/
example (U : C) (z : IntrinsicBandSection F U) :
    fromBanding F J A b U ((fromBandingEquiv F J A b U).symm z) = z := by
  sorry

-- BandInverseTests.inverse
/-- `BandInverseTests.inverse`: The inverse respects inversion of arbitrary central sections. -/
example (U : C) (z : IntrinsicBandSection F U) :
    (fromBandingEquiv F J A b U).symm z⁻¹ = ((fromBandingEquiv F J A b U).symm z)⁻¹ := by
  sorry

-- BandInverseTests.restriction
/-- `BandInverseTests.restriction`: The inverse on every restricted section is the corresponding actual coefficient restriction. -/
example {U V : C} (f : V ⟶ U) (z : IntrinsicBandSection F U) :
    Multiplicative.ofAdd (A.obj.map f.op ((fromBandingEquiv F J A b U).symm z).toAdd) =
      (fromBandingEquiv F J A b V).symm (restrict F f z) := by
  sorry

-- BandInverseTests.nontrivial
/-- `BandInverseTests.nontrivial`: A nonidentity central section has a nonidentity inverse coefficient; a constant-unit inverse fails. -/
example (U : C) (z : IntrinsicBandSection F U) (hz : z ≠ 1) :
    (fromBandingEquiv F J A b U).symm z ≠ 1 := by
  sorry

end IntrinsicBandSections

namespace IntrinsicBandSections
open CategoryTheory Opposite Bicategory
variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
variable (J : GrothendieckTopology C) [IsGerbe F J]
variable (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)

/-- The actual coefficient transformation c_b extends to a natural isomorphism from the coefficient presheaf A to U↦Additive(ZF(U)). Its inverse component at U is the additive form of the proved inverse of c_b(U), and commutes with every restriction map. The band b is retained as data, not quotiented by coefficient automorphisms. -/
noncomputable def fromBandingPresheafIso
    (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
    (J : GrothendieckTopology C) [IsGerbe F J]
    (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A) :
    A.obj ≅ presheaf F := by sorry

/-- The forward natural transformation is exactly the existing fromBandingPresheaf. -/
theorem fromBandingPresheafIso_hom :
    (fromBandingPresheafIso F J A b).hom = fromBandingPresheaf F J A b := by sorry

/-- At U the forward component sends a to the additive form of c_b(U)(a). -/
theorem fromBandingPresheafIso_hom_app (U : C) (a : A.obj.obj (op U)) :
    (((fromBandingPresheafIso F J A b).hom.app (op U)) a).toMul =
      fromBanding F J A b U (Multiplicative.ofAdd a) := by sorry

/-- At U the inverse component sends z to the additive form of the inverse of the existing fromBandingEquiv. -/
theorem fromBandingPresheafIso_inv_app (U : C) (z : IntrinsicBandSection F U) :
    ((fromBandingPresheafIso F J A b).inv.app (op U)) (Additive.ofMul z) =
      ((fromBandingEquiv F J A b U).symm z).toAdd := by sorry

/-- Restricting the inverse coefficient of z along every f:V→U equals the inverse coefficient of the reindexed central section. -/
theorem fromBandingPresheafIso_inv_naturality {U V : C} (f : V ⟶ U)
    (z : IntrinsicBandSection F U) :
    A.obj.map f.op (((fromBandingPresheafIso F J A b).inv.app (op U)) (Additive.ofMul z)) =
      ((fromBandingPresheafIso F J A b).inv.app (op V)) (Additive.ofMul (restrict F f z)) := by sorry

variable (S : Sheaf J AddCommGrpCat.{max u v u' v'}) (hS : S.obj = presheaf F)

/-- For any existing sheaf S whose underlying presheaf is precisely U↦Additive(ZF(U)), lift the actual chosen-band presheaf isomorphism uniquely through the fully faithful sheaf inclusion to an isomorphism A≅S. In particular take the previously constructed intrinsic central-section sheaf. The equality identifying S with the precise presheaf is used only to transport carriers, never to assume the SF1 descended-slice comparison. -/
noncomputable def fromBandingSheafIso
    (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
    (J : GrothendieckTopology C) [IsGerbe F J]
    (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    (S : Sheaf J AddCommGrpCat.{max u v u' v'}) (hS : S.obj = presheaf F) :
    A ≅ S := by sorry

/-- After forgetting sheaf structure, the forward map is the actual presheaf isomorphism’s forward map followed by the target-carrier identification. -/
theorem fromBandingSheafIso_hom :
    (fromBandingSheafIso F J A b S hS).hom.hom =
      (fromBandingPresheafIso F J A b ≪≫ eqToIso hS.symm).hom := by sorry

/-- After forgetting sheaf structure, the inverse is the target-carrier identification followed by the actual inverse presheaf map. -/
theorem fromBandingSheafIso_inv :
    (fromBandingSheafIso F J A b S hS).inv.hom =
      (fromBandingPresheafIso F J A b ≪≫ eqToIso hS.symm).inv := by sorry

/-- Transporting the forward sheaf map back to the precise central-section presheaf recovers exactly fromBandingPresheaf. -/
theorem fromBandingSheafIso_hom_transport :
    (fromBandingSheafIso F J A b S hS).hom.hom ≫ eqToHom hS =
      fromBandingPresheaf F J A b := by sorry

/-- Transporting the inverse sheaf map to the precise central-section presheaf recovers exactly the inverse of fromBandingPresheafIso. -/
theorem fromBandingSheafIso_inv_transport :
    eqToHom hS.symm ≫ (fromBandingSheafIso F J A b S hS).inv.hom =
      (fromBandingPresheafIso F J A b).inv := by sorry

/-- The intrinsic-band sheaf comparison is the unique one whose local evaluations are the specified band automorphisms. -/
theorem fromBandingSheafIso_unique (e : A ≅ S)
    (he : ∀ (U V : C) (f : V ⟶ U) (x : F.obj (.mk (op V)))
      (a : A.obj.obj (op U)),
      eval F f x (((e.hom.hom ≫ eqToHom hS).app (op U)) a).toMul =
        b.autEquiv V x (Multiplicative.ofAdd (A.obj.map f.op a))) :
    e = fromBandingSheafIso F J A b S hS := by sorry

-- BandPresheafIsoTests.zero
/-- `BandPresheafIsoTests.zero`: The forward component at every U sends the zero coefficient to the zero central section. -/
example (U : C) :
    ((fromBandingPresheafIso F J A b).hom.app (op U)) 0 = 0 := by sorry

-- BandPresheafIsoTests.coefficientRoundTrip
/-- `BandPresheafIsoTests.coefficientRoundTrip`: The inverse component applied to the forward image of any coefficient a returns exactly a. -/
example (U : C) (a : A.obj.obj (op U)) :
    ((fromBandingPresheafIso F J A b).inv.app (op U))
      (((fromBandingPresheafIso F J A b).hom.app (op U)) a) = a := by sorry

-- BandPresheafIsoTests.sectionRoundTrip
/-- `BandPresheafIsoTests.sectionRoundTrip`: The forward component applied to the inverse of any central section z returns exactly z. -/
example (U : C) (z : IntrinsicBandSection F U) :
    ((fromBandingPresheafIso F J A b).hom.app (op U))
      (((fromBandingPresheafIso F J A b).inv.app (op U)) (Additive.ofMul z)) =
      Additive.ofMul z := by sorry

-- BandPresheafIsoTests.restriction
/-- `BandPresheafIsoTests.restriction`: The inverse commutes with every actual coefficient restriction, including nonidentity arrows. -/
example {U V : C} (f : V ⟶ U) (z : IntrinsicBandSection F U) :
    A.obj.map f.op (((fromBandingPresheafIso F J A b).inv.app (op U)) (Additive.ofMul z)) =
      ((fromBandingPresheafIso F J A b).inv.app (op V)) (Additive.ofMul (restrict F f z)) := by sorry

-- BandPresheafIsoTests.nonzero
/-- `BandPresheafIsoTests.nonzero`: Every nonzero coefficient has nonzero forward image; the constant-zero transformation cannot be this isomorphism. -/
example (U : C) (a : A.obj.obj (op U)) (ha : a ≠ 0) :
    ((fromBandingPresheafIso F J A b).hom.app (op U)) a ≠ 0 := by sorry

-- BandSheafIsoTests.forward
/-- `BandSheafIsoTests.forward`: Transporting the forward sheaf map back to the precise central-section presheaf recovers exactly fromBandingPresheaf. -/
example :
    (fromBandingSheafIso F J A b S hS).hom.hom ≫ eqToHom hS =
      fromBandingPresheaf F J A b := by sorry

-- BandSheafIsoTests.backward
/-- `BandSheafIsoTests.backward`: Transporting the inverse sheaf map to the precise central-section presheaf recovers exactly the inverse of fromBandingPresheafIso. -/
example :
    eqToHom hS.symm ≫ (fromBandingSheafIso F J A b S hS).inv.hom =
      (fromBandingPresheafIso F J A b).inv := by sorry

-- BandSheafIsoTests.coefficientRoundTrip
/-- `BandSheafIsoTests.coefficientRoundTrip`: The forward sheaf map followed by its inverse is the identity on A. -/
example :
    (fromBandingSheafIso F J A b S hS).hom ≫ (fromBandingSheafIso F J A b S hS).inv = 𝟙 A := by sorry

-- BandSheafIsoTests.sectionRoundTrip
/-- `BandSheafIsoTests.sectionRoundTrip`: The inverse sheaf map followed by its forward map is the identity on S. -/
example :
    (fromBandingSheafIso F J A b S hS).inv ≫ (fromBandingSheafIso F J A b S hS).hom = 𝟙 S := by sorry

-- BandSheafIsoTests.bandDeterminesComparison
/-- `BandSheafIsoTests.bandDeterminesComparison`: Any sheaf isomorphism with the prescribed evaluations at every base arrow and fibre object equals this fixed-band comparison; a different abstract coefficient isomorphism is not silently identified with it. -/
example (e : A ≅ S)
    (he : ∀ (U V : C) (f : V ⟶ U) (x : F.obj (.mk (op V)))
      (a : A.obj.obj (op U)),
      eval F f x (((e.hom.hom ≫ eqToHom hS).app (op U)) a).toMul =
        b.autEquiv V x (Multiplicative.ofAdd (A.obj.map f.op a))) :
    e = fromBandingSheafIso F J A b S hS := by sorry

end IntrinsicBandSections

namespace GerbeConjugationTests
local notation "s3Point" => SingleObj.star (Equiv.Perm (Fin 3))

-- GerbeConjugationTests.S3_value: the conjugate is a different transposition.
/-- GerbeConjugationTests.S3_value: the conjugate is a different transposition.
 -/
example :
    (Aut.autMulEquivOfIso
      (asIso (C := SingleObj (Equiv.Perm (Fin 3))) (X := s3Point) (Y := s3Point) (Equiv.swap (0 : Fin 3) 1 : s3Point ⟶ s3Point))
      (asIso (C := SingleObj (Equiv.Perm (Fin 3))) (X := s3Point) (Y := s3Point) (Equiv.swap (1 : Fin 3) 2 : s3Point ⟶ s3Point))).hom =
        (Equiv.swap (0 : Fin 3) 2 : s3Point ⟶ s3Point) := by
  sorry

-- GerbeConjugationTests.S3_distinct: commutativity cannot be removed.
/-- GerbeConjugationTests.S3_distinct: commutativity cannot be removed.
 -/
example :
    Aut.autMulEquivOfIso (Iso.refl s3Point) ≠
      Aut.autMulEquivOfIso
        (asIso (C := SingleObj (Equiv.Perm (Fin 3))) (X := s3Point) (Y := s3Point) (Equiv.swap (0 : Fin 3) 1 : s3Point ⟶ s3Point)) := by
  sorry

end GerbeConjugationTests

namespace BandFixtures
open CategoryTheory Opposite Bicategory
open IntrinsicBandSections
variable (C : Type u) [Category.{v} C]
variable (D : Type fixture_u) [Category.{fixture_v} D]

/-- The constant category-valued pseudofunctor, with identity restriction functors and their canonical coherence isomorphisms. -/
abbrev constantDiagram : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{fixture_v, fixture_u} :=
  ((Functor.const Cᵒᵖ).obj (Cat.of D)).toPseudofunctor'

/-- For the native constant Cat-valued pseudofunctor with fibre D, send z in the units of the categorical centre of D to the compatible central section with value z at every arrow V to U. This is actual centre-unit data, including its inverse. -/
noncomputable def constantSection (U : C) (z : (CatCenter D)ˣ) :
    IntrinsicBandSection (constantDiagram C D) U := by sorry

/-- At every f:V to U, the value of constantSection(U,z) is exactly z. -/
theorem constantSection_val (U V : C) (f : V ⟶ U) (z : (CatCenter D)ˣ) :
    val (constantDiagram C D) (constantSection C D U z) V f = z := by sorry

/-- For every U, the units of the categorical centre of D are multiplicatively equivalent to the compatible central sections of the native constant diagram over U. The inverse evaluates the whole centre unit at the identity arrow of U. -/
noncomputable def constantSectionsEquiv (U : C) :
    (CatCenter D)ˣ ≃* IntrinsicBandSection (constantDiagram C D) U := by sorry

/-- For every f:V to U, restricting the section corresponding to z over U gives the section corresponding to that same z over V. -/
theorem constantSectionsEquiv_restrict {U V : C} (f : V ⟶ U) (z : (CatCenter D)ˣ) :
    restrict (constantDiagram C D) f (constantSectionsEquiv C D U z) =
      constantSectionsEquiv C D V z := by sorry

variable (I : Type fixture_u) (G : Type fixture_v) [CommGroup G]

/-- A discrete family of one-object groupoids indexed by I; different indices have no arrows between them. -/
abbrev Fibre := Discrete I × SingleObj G

/-- For a commutative group G and type I, use the existing product category of the discrete category on I and the native one-object category of G. A profile a:I to G determines a natural endomorphism of its identity functor with component (identity,a(i)) at (i,star). -/
def componentCenter (a : I → G) : CatCenter (Fibre I G) := by sorry

/-- The profile centre has a unit whose value is componentCenter(a) and whose inverse is componentCenter(i maps to a(i) inverse). Both multiplication identities hold in the actual categorical centre. -/
def componentCenterUnit (a : I → G) : (CatCenter (Fibre I G))ˣ := by sorry

/-- The pointwise profile group I to G is multiplicatively equivalent to the units of the categorical centre of the discrete-component product groupoid. Its inverse reads the group component at each canonical object (i,star). -/
def componentCenterEquiv : (I → G) ≃* (CatCenter (Fibre I G))ˣ := by sorry

/-- For every base category C and U in C, the profile group I to G is multiplicatively equivalent to the actual compatible central sections of the constant diagram with fibre Discrete(I) times SingleObj(G). This retains every slice arrow, fibre object and inverse. -/
noncomputable def componentSectionsEquiv (U : C) :
    (I → G) ≃* IntrinsicBandSection (constantDiagram C (Fibre I G)) U := by sorry

/-- For every f:V to U and component i, the group component of actual evaluation of the section associated to a at (i,star) is a(i). -/
theorem componentSectionsEquiv_eval {U V : C} (f : V ⟶ U) (a : I → G) (i : I) :
    (eval (constantDiagram C (Fibre I G)) f (Discrete.mk i, SingleObj.star G)
      (componentSectionsEquiv C I G U a)).hom.2 = a i := by sorry

/-- For every f:V to U, restriction of the section associated to a over U equals the section associated to the same profile over V. -/
theorem componentSectionsEquiv_restrict {U V : C} (f : V ⟶ U) (a : I → G) :
    restrict (constantDiagram C (Fibre I G)) f (componentSectionsEquiv C I G U a) =
      componentSectionsEquiv C I G V a := by sorry

/-- Evaluation in a one-component constant groupoid identifies compatible central families with central elements of the group. -/
theorem component_eval_bijective [Subsingleton I] (U : C) (i : I) :
    Function.Bijective (eval (constantDiagram C (Fibre I G)) (𝟙 U)
      (Discrete.mk i, SingleObj.star G)) := by sorry

/-- If another inhabited discrete component has a nontrivial centre, evaluation at one component loses its central coordinate. -/
theorem component_eval_not_injective (U : C) (g : G) (hg : g ≠ 1) :
    ¬ Function.Injective (eval (constantDiagram C (Fibre Bool G)) (𝟙 U)
      (Discrete.mk false, SingleObj.star G)) := by sorry

/-- Objects in different discrete components of the fixture have no isomorphism between them. -/
theorem fibre_no_cross_iso :
    ¬ Nonempty (((Discrete.mk false, SingleObj.star G) : Fibre Bool G) ≅
      (Discrete.mk true, SingleObj.star G)) := by sorry

/-- A constant fibre with two distinct discrete components fails the local-isomorphism condition of a gerbe on the minimal point topology. -/
theorem constant_two_components_not_gerbe (U : C) :
    ¬ IsGerbe (constantDiagram C (Fibre Bool G)) (⊥ : GrothendieckTopology C) := by sorry

set_option backward.isDefEq.respectTransparency false in
/-- A constant category-valued pseudofunctor on the one-object site with minimal topology satisfies stack descent. -/
theorem point_isStack :
    (constantDiagram (Discrete PUnit) (Fibre I G)).IsStack ⊥ := by sorry

/-- An inhabited one-component constant groupoid on the minimal point site is a gerbe. -/
theorem point_connected_gerbe :
    IsGerbe (constantDiagram (Discrete PUnit) (Fibre PUnit G)) ⊥ := by sorry

-- BandPointTests.stack
/-- `BandPointTests.stack`: The two-component C3 point diagram satisfies the native stack predicate for the bottom topology. -/
example : (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 3)))).IsStack ⊥ := by sorry

-- BandPointTests.gerbe
/-- `BandPointTests.gerbe`: The connected C3 point diagram satisfies the native gerbe predicate for the bottom topology. -/
example : IsGerbe
    (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 3)))) ⊥ := by sorry

/-- Restriction of constantSection(U,z) along f:V to U is exactly constantSection(V,z). -/
theorem constantSection_restrict {U V : C} (f : V ⟶ U) (z : (CatCenter D)ˣ) :
    restrict (constantDiagram C D) f (constantSection C D U z) =
      constantSection C D V z := by sorry

/-- The forward map of constantSectionsEquiv(U) is exactly constantSection(U). -/
theorem constantSectionsEquiv_apply (U : C) (z : (CatCenter D)ˣ) :
    constantSectionsEquiv C D U z = constantSection C D U z := by sorry

/-- The inverse of constantSectionsEquiv(U) sends s to its actual centre-unit value at the identity arrow of U. -/
theorem constantSectionsEquiv_symm_apply (U : C)
    (s : IntrinsicBandSection (constantDiagram C D) U) :
    (constantSectionsEquiv C D U).symm s = val (constantDiagram C D) s U (𝟙 U) := by sorry

/-- At an arbitrary object x, componentCenter(a) is the pair of the identity discrete morphism and a at the actual component label of x. -/
theorem componentCenter_app (a : I → G) (x : Fibre I G) :
    (componentCenter I G a).app x = (𝟙 x.1, a x.1.as) := by sorry

/-- For every fibre morphism f:x to y, f followed by the centre component at y equals the centre component at x followed by f. -/
theorem componentCenter_naturality (a : I → G) {x y : Fibre I G} (f : x ⟶ y) :
    f ≫ (componentCenter I G a).app y = (componentCenter I G a).app x ≫ f := by sorry

/-- The value of componentCenterUnit(a) is exactly componentCenter(a). -/
theorem componentCenterUnit_val (a : I → G) :
    (componentCenterUnit I G a).val = componentCenter I G a := by sorry

/-- The inverse value of componentCenterUnit(a) is exactly componentCenter of the pointwise inverse profile. -/
theorem componentCenterUnit_inv (a : I → G) :
    (componentCenterUnit I G a).inv = componentCenter I G (fun i => (a i)⁻¹) := by sorry

/-- The forward map of componentCenterEquiv is exactly componentCenterUnit. -/
theorem componentCenterEquiv_apply (a : I → G) :
    componentCenterEquiv I G a = componentCenterUnit I G a := by sorry

/-- For any centre unit z and label i, the inverse profile at i is the group component of z at the actual canonical object (i,star). -/
theorem componentCenterEquiv_symm_apply (z : (CatCenter (Fibre I G))ˣ) (i : I) :
    (componentCenterEquiv I G).symm z i =
      (z.val.app (Discrete.mk i, SingleObj.star G)).2 := by sorry

/-- For any compatible section s over U and label i, its inverse profile coefficient is the group component of its centre-unit value at the identity arrow of U, evaluated at the canonical fibre object (i,star). -/
theorem componentSectionsEquiv_symm_apply (U : C)
    (s : IntrinsicBandSection (constantDiagram C (Fibre I G)) U) (i : I) :
    (componentSectionsEquiv C I G U).symm s i =
      ((val (constantDiagram C (Fibre I G)) s U (𝟙 U)).val.app
        (Discrete.mk i, SingleObj.star G)).2 := by sorry

-- BandPointTests.generator
/-- `BandPointTests.generator`: In the connected C3 point gerbe, evaluation of the profile with additive coefficient 1 has actual group hom component 1 in Z/3Z. -/
example : (eval
    (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 3))))
    (𝟙 (Discrete.mk PUnit.unit)) (Discrete.mk PUnit.unit, SingleObj.star _)
    (componentSectionsEquiv (Discrete PUnit) PUnit (Multiplicative (ZMod 3))
      (Discrete.mk PUnit.unit) (fun _ => Multiplicative.ofAdd (1 : ZMod 3)))).hom.2 =
        Multiplicative.ofAdd (1 : ZMod 3) := by sorry

-- GerbeTests.twoComponents: the constant discrete two-object stack on the
-- one-point site is a stack and fails the locally-isomorphic gerbe condition.
/-- `GerbeTests.twoComponents`: On the one-point site with only the maximal cover, the discrete groupoid on two objects is a stack but not a gerbe. -/
example : (constantDiagram (Discrete PUnit) (Discrete Bool)).IsStack ⊥ ∧
    ¬ IsGerbe (constantDiagram (Discrete PUnit) (Discrete Bool)) ⊥ := by sorry

-- BandPointTests.trivialDiscreteTwoObjects
/-- `BandPointTests.trivialDiscreteTwoObjects`: The two-component diagram with trivial inertia is a native stack on the point site and fails the native gerbe predicate. -/
example : (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 1)))).IsStack ⊥ ∧
    ¬ IsGerbe (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 1)))) ⊥ := by sorry

-- BandPointTests.disconnectedWitness
/-- `BandPointTests.disconnectedWitness`: In the two-component C3 point diagram there exists a nonidentity compatible section whose actual evaluation at the false component is the identity automorphism. -/
example : ∃ s : IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 3))))
      (Discrete.mk PUnit.unit), s ≠ 1 ∧
    eval (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Discrete.mk false, SingleObj.star _) s =
        Iso.refl ((Discrete.mk false, SingleObj.star _) : Fibre Bool (Multiplicative (ZMod 3))) := by sorry

-- ConstantCentreTests.one
/-- `ConstantCentreTests.one`: The identity centre unit gives the identity compatible section. -/
example (U : C) : constantSection C D U 1 = 1 := by sorry

-- ConstantCentreTests.multiply
/-- `ConstantCentreTests.multiply`: Multiplying the input centre units multiplies the actual compatible sections in the same order. -/
example (U : C) (z t : (CatCenter D)ˣ) :
    constantSection C D U (z * t) = constantSection C D U z * constantSection C D U t := by sorry

-- ConstantCentreTests.allArrows
/-- `ConstantCentreTests.allArrows`: Every slice arrow component is exactly the given full centre unit. -/
example (U V : C) (f : V ⟶ U) (z : (CatCenter D)ˣ) :
    val (constantDiagram C D) (constantSection C D U z) V f = z := by sorry

-- ConstantEquivTests.centreRoundTrip
/-- `ConstantEquivTests.centreRoundTrip`: The forward map followed by the actual inverse recovers every centre unit. -/
example (U : C) (z : (CatCenter D)ˣ) :
    (constantSectionsEquiv C D U).symm (constantSectionsEquiv C D U z) = z := by sorry

-- ConstantEquivTests.sectionRoundTrip
/-- `ConstantEquivTests.sectionRoundTrip`: The actual inverse followed by the forward map recovers every compatible section. -/
example (U : C) (s : IntrinsicBandSection (constantDiagram C D) U) :
    constantSectionsEquiv C D U ((constantSectionsEquiv C D U).symm s) = s := by sorry

-- ConstantEquivTests.restriction
/-- `ConstantEquivTests.restriction`: Every base-arrow restriction retains the same centre unit. -/
example {U V : C} (f : V ⟶ U) (z : (CatCenter D)ˣ) :
    restrict (constantDiagram C D) f (constantSectionsEquiv C D U z) =
      constantSectionsEquiv C D V z := by sorry

-- ComponentCentreTests.component
/-- `ComponentCentreTests.component`: At canonical object i the centre endomorphism is the actual pair (identity,a(i)). -/
example (a : I → G) (i : I) :
    (componentCenter I G a).app (Discrete.mk i, SingleObj.star G) = (𝟙 _, a i) := by sorry

-- ComponentCentreTests.unit
/-- `ComponentCentreTests.unit`: The constant identity profile has identity component at every canonical object. -/
example (i : I) : (componentCenter I G 1).app (Discrete.mk i, SingleObj.star G) = 𝟙 _ := by sorry

-- ComponentCentreTests.naturality
/-- `ComponentCentreTests.naturality`: Every actual fibre morphism commutes with the constructed centre components. -/
example (a : I → G) {x y : Fibre I G} (f : x ⟶ y) :
    f ≫ (componentCenter I G a).app y = (componentCenter I G a).app x ≫ f := by sorry

-- ComponentUnitTests.value
/-- `ComponentUnitTests.value`: The unit value is the actual profile centre. -/
example (a : I → G) : (componentCenterUnit I G a).val = componentCenter I G a := by sorry

-- ComponentUnitTests.inverse
/-- `ComponentUnitTests.inverse`: The unit inverse value uses pointwise group inverses. -/
example (a : I → G) : (componentCenterUnit I G a).inv =
    componentCenter I G (fun i => (a i)⁻¹) := by sorry

-- ComponentUnitTests.roundTrip
/-- `ComponentUnitTests.roundTrip`: Multiplying the actual value and inverse gives the identity categorical centre. -/
example (a : I → G) : (componentCenterUnit I G a).val *
    (componentCenterUnit I G a).inv = 1 := by sorry

-- ComponentEquivTests.coefficientRoundTrip
/-- `ComponentEquivTests.coefficientRoundTrip`: The actual inverse recovers every profile from its constructed centre unit. -/
example (a : I → G) : (componentCenterEquiv I G).symm (componentCenterEquiv I G a) = a := by sorry

-- ComponentEquivTests.centreRoundTrip
/-- `ComponentEquivTests.centreRoundTrip`: Reconstructing the profile of any actual centre unit recovers that unit. -/
example (z : (CatCenter (Fibre I G))ˣ) :
    componentCenterEquiv I G ((componentCenterEquiv I G).symm z) = z := by sorry

-- ComponentEquivTests.inertiaCoordinates
/-- `ComponentEquivTests.inertiaCoordinates`: At every canonical fibre object the actual centre-unit hom has group component a(i). -/
example (a : I → G) (i : I) :
    ((componentCenterEquiv I G a).val.app (Discrete.mk i, SingleObj.star G)).2 = a i := by sorry

-- ComponentSectionTests.evaluation
/-- `ComponentSectionTests.evaluation`: At every base arrow and canonical fibre object, actual band evaluation has group component a(i). -/
example {U V : C} (f : V ⟶ U) (a : I → G) (i : I) :
    (eval (constantDiagram C (Fibre I G)) f (Discrete.mk i, SingleObj.star G)
      (componentSectionsEquiv C I G U a)).hom.2 = a i := by sorry

-- ComponentSectionTests.restriction
/-- `ComponentSectionTests.restriction`: Every actual base-arrow restriction of a profile section retains the same profile. -/
example {U V : C} (f : V ⟶ U) (a : I → G) :
    restrict (constantDiagram C (Fibre I G)) f (componentSectionsEquiv C I G U a) =
      componentSectionsEquiv C I G V a := by sorry

-- ComponentSectionTests.roundTrip
/-- `ComponentSectionTests.roundTrip`: The actual inverse recovers the entire profile from its compatible section. -/
example (U : C) (a : I → G) :
    (componentSectionsEquiv C I G U).symm (componentSectionsEquiv C I G U a) = a := by sorry

-- BandPointTests.connected
/-- `BandPointTests.connected`: In the connected C3 point fixture, evaluation at the canonical object is bijective onto its actual automorphisms. -/
example : Function.Bijective
    (eval (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Discrete.mk PUnit.unit, SingleObj.star _)) := by sorry

-- BandPointTests.disconnected
/-- `BandPointTests.disconnected`: In the two-component C3 point fixture, evaluation at the false component is not injective. -/
example : ¬ Function.Injective
    (eval (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Discrete.mk false, SingleObj.star _)) := by sorry

-- BandPointTests.notGerbe
/-- `BandPointTests.notGerbe`: The two-component C3 point diagram fails the native gerbe predicate. -/
example : ¬ IsGerbe
    (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 3)))) ⊥ := by sorry

-- BandPointTests.connectedCardinality
/-- `BandPointTests.connectedCardinality`: The actual compatible-section type of the connected C3 point diagram has cardinality three. -/
example : Nat.card (IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 3))))
      (Discrete.mk PUnit.unit)) = 3 := by sorry

-- BandPointTests.disconnectedCardinality
/-- `BandPointTests.disconnectedCardinality`: The actual compatible-section type of the two-component C3 point diagram has cardinality nine. -/
example : Nat.card (IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 3))))
      (Discrete.mk PUnit.unit)) = 9 := by sorry

-- BandPointTests.terminalFibre
/-- `BandPointTests.terminalFibre`: The actual compatible-section type of the one-component trivial-inertia point diagram has cardinality one. -/
example : Nat.card (IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 1))))
      (Discrete.mk PUnit.unit)) = 1 := by sorry

end BandFixtures

namespace ConnectedBandFixtures

open CategoryTheory Opposite Bicategory BandFixtures IntrinsicBandSections

set_option backward.isDefEq.respectTransparency false

variable (C : Type u) [Category.{v} C]
variable (I : Type conn_u) (G : Type conn_v) [Group G]

/-- The product of the codiscrete groupoid on I with the one-object groupoid of G; all inhabited indices lie in one component. -/
abbrev ConnectedFibre := Codiscrete I × SingleObj G

/-- A central element of G acts at every object of the connected fixture, naturally across every codiscrete arrow. -/
def connectedCenter (a : Subgroup.center G) : CatCenter (ConnectedFibre I G) := by sorry

/-- An invertible central element gives a unit of the connected fixture identity-endomorphism monoid. -/
def connectedCenterUnit (a : Subgroup.center G) : (CatCenter (ConnectedFibre I G))ˣ := by sorry

/-- Choosing an index identifies identity-endomorphism units of the connected fixture with the centre of G. -/
def connectedCenterEquiv (i : I) :
    Subgroup.center G ≃* (CatCenter (ConnectedFibre I G))ˣ := by sorry

/-- On a connected fixture with a chosen index, compatible slice automorphisms are exactly central elements of G. -/
noncomputable def connectedSectionsEquiv (i : I) (U : C) :
    Subgroup.center G ≃* IntrinsicBandSection
      (constantDiagram C (ConnectedFibre I G)) U := by sorry

/-- For every f:V→U and every actual fibre object x, evaluation of the section corresponding to a has group component a. -/
theorem connectedSectionsEquiv_eval (i : I) {U V : C} (f : V ⟶ U)
    (a : Subgroup.center G) (x : ConnectedFibre I G) :
    (eval (constantDiagram C (ConnectedFibre I G)) f x
      (connectedSectionsEquiv C I G i U a)).hom.2 = a.val := by sorry

/-- Restriction along any f:V→U carries the section corresponding to a over U to the section corresponding to the same a over V. -/
theorem connectedSectionsEquiv_restrict (i : I) {U V : C} (f : V ⟶ U)
    (a : Subgroup.center G) :
    restrict (constantDiagram C (ConnectedFibre I G)) f
      (connectedSectionsEquiv C I G i U a) =
      connectedSectionsEquiv C I G i V a := by sorry

/-- Evaluation at any chosen object of the connected constant fixture determines the compatible central family. -/
theorem connected_eval_injective (i : I) (U : C) (x : ConnectedFibre I G) :
    Function.Injective (eval (constantDiagram C (ConnectedFibre I G)) (𝟙 U) x) := by sorry

/-- The image of evaluation on the connected groupoid is exactly the centre of its automorphism group. -/
theorem connected_eval_image (i : I) (U : C) (x : ConnectedFibre I G) (e : Aut x) :
    (∃ s, eval (constantDiagram C (ConnectedFibre I G)) (𝟙 U) x s = e) ↔
      e.hom.2 ∈ Subgroup.center G := by sorry

/-- The central element acts at the specified connected-fixture object, retaining its group coordinate. -/
def connectedAut (x : ConnectedFibre I G) (g : G) : Aut x := by sorry

/-- Evaluation onto the full automorphism group of the connected fixture is surjective exactly when that group is commutative. -/
theorem connected_eval_surjective_iff (i : I) (U : C) (x : ConnectedFibre I G) :
    Function.Surjective (eval (constantDiagram C (ConnectedFibre I G)) (𝟙 U) x) ↔
      Subgroup.center G = ⊤ := by sorry

/-- A chosen group element gives the isomorphism between two connected-fixture objects, along the unique codiscrete arrow. -/
def connectedIso (x y : ConnectedFibre I G) : x ≅ y := by sorry

set_option backward.isDefEq.respectTransparency false in
/-- The connected constant fixture is a stack on the minimal point topology. -/
theorem point_stack (D : Type*) [Category D] :
    (constantDiagram (Discrete PUnit) D).IsStack ⊥ := by sorry

/-- With a chosen index, the connected constant groupoid is a gerbe on the minimal point topology. -/
theorem connected_point_gerbe (i : I) :
    IsGerbe (constantDiagram (Discrete PUnit) (ConnectedFibre I G)) ⊥ := by sorry

-- ConnectedBandTests.twoObjectGerbe
/-- `ConnectedBandTests.twoObjectGerbe`: The constant diagram with fibre Codiscrete(Bool) times SingleObj(C3) is an actual native gerbe on the point site. -/
example : IsGerbe (constantDiagram (Discrete PUnit)
    (ConnectedFibre Bool (Multiplicative (ZMod 3)))) ⊥ := by sorry

-- ConnectedBandTests.distinctIsomorphic
/-- `ConnectedBandTests.distinctIsomorphic`: The objects labelled false and true in that fibre are unequal but are isomorphic. -/
example : let x : ConnectedFibre Bool (Multiplicative (ZMod 3)) :=
      (Codiscrete.mk false, SingleObj.star _)
    let y : ConnectedFibre Bool (Multiplicative (ZMod 3)) :=
      (Codiscrete.mk true, SingleObj.star _)
    x ≠ y ∧ Nonempty (x ≅ y) := by sorry

-- ConnectedBandTests.cardinality
/-- `ConnectedBandTests.cardinality`: The actual compatible-section type for that two-object C3 gerbe has exactly three elements. -/
example : Nat.card (IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (ConnectedFibre Bool (Multiplicative (ZMod 3))))
      (Discrete.mk PUnit.unit)) = 3 := by sorry

-- ConnectedBandTests.bijectiveEvaluation
/-- `ConnectedBandTests.bijectiveEvaluation`: Evaluation at every object of that two-object C3 fibre is bijective. -/
example (x : ConnectedFibre Bool (Multiplicative (ZMod 3))) :
    Function.Bijective (eval
      (constantDiagram (Discrete PUnit) (ConnectedFibre Bool (Multiplicative (ZMod 3))))
        (𝟙 (Discrete.mk PUnit.unit)) x) := by sorry

-- NonabelianBandTests.gerbe
/-- `NonabelianBandTests.gerbe`: The constant diagram with fibre Codiscrete(PUnit) times SingleObj(Perm(Fin 3)) is an actual native gerbe on the point site. -/
example : IsGerbe (constantDiagram (Discrete PUnit)
    (ConnectedFibre PUnit (Equiv.Perm (Fin 3)))) ⊥ := by sorry

-- NonabelianBandTests.oneSection
/-- `NonabelianBandTests.oneSection`: That S3 gerbe has exactly one actual compatible intrinsic-band section. -/
example : Nat.card (IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (ConnectedFibre PUnit (Equiv.Perm (Fin 3))))
      (Discrete.mk PUnit.unit)) = 1 := by sorry

-- NonabelianBandTests.notSurjective
/-- `NonabelianBandTests.notSurjective`: Evaluation of compatible sections into the actual automorphism group of the S3 object is not surjective. -/
example : ¬ Function.Surjective (eval
    (constantDiagram (Discrete PUnit) (ConnectedFibre PUnit (Equiv.Perm (Fin 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Codiscrete.mk PUnit.unit, SingleObj.star _)) := by sorry

/-- At every object x, connectedCenter(a) has component (identity,a). -/
theorem connectedCenter_app (a : Subgroup.center G) (x : ConnectedFibre I G) :
    (connectedCenter I G a).app x = (𝟙 x.1, a.val) := by sorry

/-- Every actual arrow f:x→y commutes with the indicated components in the naturality square. -/
theorem connectedCenter_naturality (a : Subgroup.center G)
    {x y : ConnectedFibre I G} (f : x ⟶ y) :
    f ≫ (connectedCenter I G a).app y = (connectedCenter I G a).app x ≫ f := by sorry

/-- The value of the centre unit for a is connectedCenter(a). -/
theorem connectedCenterUnit_val (a : Subgroup.center G) :
    (connectedCenterUnit I G a).val = connectedCenter I G a := by sorry

/-- The inverse value of the centre unit for a is connectedCenter(a inverse). -/
theorem connectedCenterUnit_inv (a : Subgroup.center G) :
    (connectedCenterUnit I G a).inv = connectedCenter I G a⁻¹ := by sorry

/-- The forward equivalence map at a is connectedCenterUnit(a). -/
theorem connectedCenterEquiv_apply (i : I) (a : Subgroup.center G) :
    connectedCenterEquiv I G i a = connectedCenterUnit I G a := by sorry

/-- The underlying group element of the inverse at z is the group component of z at (i,star). -/
theorem connectedCenterEquiv_symm_apply (i : I) (z : (CatCenter (ConnectedFibre I G))ˣ) :
    ((connectedCenterEquiv I G i).symm z).val =
      (z.val.app (Codiscrete.mk i, SingleObj.star G)).2 := by sorry

/-- The inverse central coefficient of s is the group component of its identity-arrow centre value at (i,star). -/
theorem connectedSectionsEquiv_symm_apply (i : I) (U : C)
    (s : IntrinsicBandSection (constantDiagram C (ConnectedFibre I G)) U) :
    ((connectedSectionsEquiv C I G i U).symm s).val =
      ((val (constantDiagram C (ConnectedFibre I G)) s U (𝟙 U)).val.app
        (Codiscrete.mk i, SingleObj.star G)).2 := by sorry

/-- The hom of connectedAut(x,g) is the actual product morphism (identity,g). -/
theorem connectedAut_hom (x : ConnectedFibre I G) (g : G) :
    (connectedAut I G x g).hom = (𝟙 x.1, g) := by sorry

/-- The inverse of connectedAut(x,g) is the actual product morphism (identity,g inverse). -/
theorem connectedAut_inv (x : ConnectedFibre I G) (g : G) :
    (connectedAut I G x g).inv = (𝟙 x.1, g⁻¹) := by sorry

/-- The first hom component of connectedIso(x,y) is the native codiscrete comparison isomorphism hom. -/
theorem connectedIso_fst (x y : ConnectedFibre I G) :
    (connectedIso I G x y).hom.1 = (Codiscrete.iso x.1 y.1).hom := by sorry

/-- The second hom component of connectedIso(x,y) is the native equality isomorphism hom between the SingleObj objects. -/
theorem connectedIso_snd (x y : ConnectedFibre I G) :
    (connectedIso I G x y).hom.2 = (eqToIso (Subsingleton.elim x.2 y.2)).hom := by sorry

-- ConnectedCenterTests.value
/-- `ConnectedCenterTests.value`: For every central coefficient a and object x, the group component of its natural endomorphism is a. -/
example (a : Subgroup.center G) (x : ConnectedFibre I G) :
    ((connectedCenter I G a).app x).2 = a.val := by sorry

-- ConnectedCenterTests.naturality
/-- `ConnectedCenterTests.naturality`: The constructed centre element satisfies naturality for arbitrary arrows, including arrows between distinct labels. -/
example (a : Subgroup.center G) {x y : ConnectedFibre I G} (f : x ⟶ y) :
    f ≫ (connectedCenter I G a).app y = (connectedCenter I G a).app x ≫ f := by sorry

-- ConnectedCenterTests.identity
/-- `ConnectedCenterTests.identity`: The identity central coefficient acts by the identity arrow at every object. -/
example (x : ConnectedFibre I G) : (connectedCenter I G 1).app x = 𝟙 x := by sorry

-- ConnectedUnitTests.value
/-- `ConnectedUnitTests.value`: The centre unit retains the constructed centre element as its value. -/
example (a : Subgroup.center G) :
    (connectedCenterUnit I G a).val = connectedCenter I G a := by sorry

-- ConnectedUnitTests.inverse
/-- `ConnectedUnitTests.inverse`: Its inverse value is obtained from the inverse central coefficient. -/
example (a : Subgroup.center G) :
    (connectedCenterUnit I G a).inv = connectedCenter I G a⁻¹ := by sorry

-- ConnectedUnitTests.roundTrip
/-- `ConnectedUnitTests.roundTrip`: The value times its inverse is the identity natural endomorphism. -/
example (a : Subgroup.center G) :
    (connectedCenterUnit I G a).val * (connectedCenterUnit I G a).inv = 1 := by sorry

-- ConnectedEquivTests.coefficientRoundTrip
/-- `ConnectedEquivTests.coefficientRoundTrip`: Forward then inverse of the centre equivalence recovers every central coefficient. -/
example (i : I) (a : Subgroup.center G) :
    (connectedCenterEquiv I G i).symm (connectedCenterEquiv I G i a) = a := by sorry

-- ConnectedEquivTests.centreRoundTrip
/-- `ConnectedEquivTests.centreRoundTrip`: Inverse then forward recovers every actual centre unit, not just those specified beforehand. -/
example (i : I) (z : (CatCenter (ConnectedFibre I G))ˣ) :
    connectedCenterEquiv I G i ((connectedCenterEquiv I G i).symm z) = z := by sorry

-- ConnectedEquivTests.everyObject
/-- `ConnectedEquivTests.everyObject`: The centre equivalence has the same specified coefficient at every actual object. -/
example (i : I) (a : Subgroup.center G) (x : ConnectedFibre I G) :
    ((connectedCenterEquiv I G i a).val.app x).2 = a.val := by sorry

-- ConnectedSectionTests.roundTrip
/-- `ConnectedSectionTests.roundTrip`: Inverse then forward recovers every actual compatible section on every slice arrow. -/
example (i : I) (U : C)
    (s : IntrinsicBandSection (constantDiagram C (ConnectedFibre I G)) U) :
    connectedSectionsEquiv C I G i U ((connectedSectionsEquiv C I G i U).symm s) = s := by sorry

-- ConnectedSectionTests.restriction
/-- `ConnectedSectionTests.restriction`: Restriction along an arbitrary base arrow preserves the specified central coefficient. -/
example (i : I) {U V : C} (f : V ⟶ U) (a : Subgroup.center G) :
    restrict (constantDiagram C (ConnectedFibre I G)) f
      (connectedSectionsEquiv C I G i U a) =
        connectedSectionsEquiv C I G i V a := by sorry

-- ConnectedSectionTests.generatorBothObjects
/-- `ConnectedSectionTests.generatorBothObjects`: The generator of C3 gives the same nonidentity evaluated group component at both distinct objects labelled false and true. -/
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
/-- `ConnectedAutTests.hom`: The actual automorphism associated to g has group hom component g. -/
example (x : ConnectedFibre I G) (g : G) : (connectedAut I G x g).hom.2 = g := by sorry

-- ConnectedAutTests.inverse
/-- `ConnectedAutTests.inverse`: Its actual inverse arrow has group component g inverse. -/
example (x : ConnectedFibre I G) (g : G) : (connectedAut I G x g).inv.2 = g⁻¹ := by sorry

-- ConnectedAutTests.multiplication
/-- `ConnectedAutTests.multiplication`: The actual automorphism for gh equals the product of the automorphisms for g and h, with the native composition convention. -/
example (x : ConnectedFibre I G) (g h : G) :
    connectedAut I G x (g * h) = connectedAut I G x g * connectedAut I G x h := by sorry

-- ConnectedIsoTests.projections
/-- `ConnectedIsoTests.projections`: Both comparison hom components equal those of the imported codiscrete and equality isomorphisms. -/
example (x y : ConnectedFibre I G) :
    (connectedIso I G x y).hom.1 = (Codiscrete.iso x.1 y.1).hom ∧
    (connectedIso I G x y).hom.2 = (eqToIso (Subsingleton.elim x.2 y.2)).hom := by sorry

-- ConnectedIsoTests.roundTrip
/-- `ConnectedIsoTests.roundTrip`: The comparison hom followed by its actual inverse equals the identity of its source. -/
example (x y : ConnectedFibre I G) :
    (connectedIso I G x y).hom ≫ (connectedIso I G x y).inv = 𝟙 x := by sorry

-- NonabelianBandTests.injective
/-- `NonabelianBandTests.injective`: Evaluation for the S3 gerbe is nevertheless injective. -/
example : Function.Injective (eval
    (constantDiagram (Discrete PUnit) (ConnectedFibre PUnit (Equiv.Perm (Fin 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Codiscrete.mk PUnit.unit, SingleObj.star _)) := by sorry

-- NonabelianBandTests.transpositionNotAttained
/-- `NonabelianBandTests.transpositionNotAttained`: The actual automorphism defined by the transposition (0 1) is not the evaluation of any compatible section of the S3 gerbe. -/
example : ¬ ∃ s, eval
    (constantDiagram (Discrete PUnit) (ConnectedFibre PUnit (Equiv.Perm (Fin 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Codiscrete.mk PUnit.unit, SingleObj.star _) s =
        connectedAut PUnit (Equiv.Perm (Fin 3))
          (Codiscrete.mk PUnit.unit, SingleObj.star _) (Equiv.swap 0 1) := by sorry

-- NonabelianBandTests.oneObject
/-- `NonabelianBandTests.oneObject`: The S3 fixture has a subsingleton actual object type, so its obstruction does not arise from disconnected objects. -/
example : Subsingleton (ConnectedFibre PUnit (Equiv.Perm (Fin 3))) := by sorry

-- ConnectedBandTests.emptyFibreStack
/-- `ConnectedBandTests.emptyFibreStack`: The constant empty category is still a stack on the point site; the stack proof does not assume local nonemptiness. -/
example : (constantDiagram (Discrete PUnit) (Discrete Empty)).IsStack ⊥ := by sorry

/-- The identity central coefficient defines the identity natural endomorphism. -/
theorem connectedCenter_one : connectedCenter I G 1 = 1 := by sorry

/-- The value of the constructed unit times its inverse value is the identity natural endomorphism. -/
theorem connectedCenterUnit_val_inv (a : Subgroup.center G) :
    (connectedCenterUnit I G a).val * (connectedCenterUnit I G a).inv = 1 := by sorry

/-- Applying the centre equivalence after its inverse recovers every actual centre unit. -/
theorem connectedCenterEquiv_apply_symm_apply (i : I) (z : (CatCenter (ConnectedFibre I G))ˣ) :
    connectedCenterEquiv I G i ((connectedCenterEquiv I G i).symm z) = z := by sorry

/-- The automorphism attached to gh is the product of those attached to g and h. -/
theorem connectedAut_mul (x : ConnectedFibre I G) (g h : G) :
    connectedAut I G x (g * h) = connectedAut I G x g * connectedAut I G x h := by sorry

/-- The comparison hom followed by its inverse is the identity of its source. -/
theorem connectedIso_hom_inv_id (x y : ConnectedFibre I G) :
    (connectedIso I G x y).hom ≫ (connectedIso I G x y).inv = 𝟙 x := by sorry

-- ConnectedEquivTests.emptyFibreCollapse: no coefficient recovery without a fibre object.
/-- `ConnectedEquivTests.emptyFibreCollapse`: For I empty and G the multiplicative group of Z/3Z, the distinct central coefficients given by additive 1 and additive 0 define the same categorical-centre unit. Hence the chosen member i is necessary for the asserted centre equivalence. -/
example : let a : Subgroup.center (Multiplicative (ZMod 3)) :=
      ⟨Multiplicative.ofAdd 1, by rw [CommGroup.center_eq_top]; trivial⟩
    a ≠ 1 ∧ connectedCenterUnit Empty (Multiplicative (ZMod 3)) a =
      connectedCenterUnit Empty (Multiplicative (ZMod 3)) 1 := by sorry

-- ConnectedBandTests.emptyFibreNotGerbe: stack descent does not imply local nonemptiness.
/-- `ConnectedBandTests.emptyFibreNotGerbe`: On the one-object point site with bottom topology, the constant diagram with fibre Codiscrete(empty) times SingleObj(C3) is a stack but is not a gerbe: its maximal covering sieve contains the identity arrow and its fibre has no object. -/
example : (constantDiagram (Discrete PUnit)
      (ConnectedFibre Empty (Multiplicative (ZMod 3)))).IsStack ⊥ ∧
    ¬ IsGerbe (constantDiagram (Discrete PUnit)
      (ConnectedFibre Empty (Multiplicative (ZMod 3)))) ⊥ := by sorry

end ConnectedBandFixtures

namespace RestrictionBandFixtures
open CategoryTheory Opposite Bicategory
open IntrinsicBandSections
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type chain_u} [Category.{chain_v} C]

/-- Turn a presheaf of commutative groups into a pseudofunctor of one-object groupoids, with restriction induced by the group maps. -/
abbrev groupDiagram (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{chain_w, 0} :=
  (P ⋙ forget₂ CommGrpCat GrpCat ⋙ forget₂ GrpCat MonCat ⋙ MonCat.toCat).toPseudofunctor'

/-- The pseudofunctor unit comparison of a group diagram has identity group coordinate. -/
theorem groupMapId_hom (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C)
    (x : SingleObj (P.obj (op U))) :
    ((groupDiagram P).mapId (.mk (op U))).hom.toNatTrans.app x =
      (1 : P.obj (op U)) := by sorry

/-- The group-diagram composition comparison has identity group coordinate. -/
theorem groupMapComp_hom (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    {U V W : C} (f : V ⟶ U) (g : W ⟶ V) (x : SingleObj (P.obj (op U))) :
    ((groupDiagram P).mapComp f.op.toLoc g.op.toLoc).hom.toNatTrans.app x =
      (1 : P.obj (op W)) := by sorry

/-- For a specified composite base arrow, the forward composition comparison has identity group coordinate. -/
theorem groupMapComp'_hom (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    {U V W : C} (f : V ⟶ U) (g : W ⟶ V) (fg : W ⟶ U) (h : g ≫ f = fg)
    (x : SingleObj (P.obj (op U))) :
    ((groupDiagram P).mapComp' f.op.toLoc g.op.toLoc fg.op.toLoc (by rw [← h]; rfl)).hom.toNatTrans.app x =
      (1 : P.obj (op W)) := by sorry

/-- For a specified composite base arrow, the inverse composition comparison has identity group coordinate. -/
theorem groupMapComp'_inv (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    {U V W : C} (f : V ⟶ U) (g : W ⟶ V) (fg : W ⟶ U) (h : g ≫ f = fg)
    (x : SingleObj (P.obj (op U))) :
    ((groupDiagram P).mapComp' f.op.toLoc g.op.toLoc fg.op.toLoc (by rw [← h]; rfl)).inv.toNatTrans.app x =
      (1 : P.obj (op W)) := by sorry

/-- The canonical descent datum of the unique group-diagram object has identity overlap coordinate. -/
theorem groupOfObj_hom (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    {ι : Type*} {U : C} {X : ι → C} (f : ∀ i, X i ⟶ U)
    (x : (groupDiagram P).obj (.mk (op U))) {Y : C} (q : Y ⟶ U) {i j : ι}
    (f₁ : Y ⟶ X i) (f₂ : Y ⟶ X j) (h₁ : f₁ ≫ f i = q) (h₂ : f₂ ≫ f j = q) :
    (Pseudofunctor.DescentData.ofObj (F := groupDiagram P) (f := f) x).hom q f₁ f₂ h₁ h₂ =
      (1 : P.obj (op Y)) := by sorry

/-- Pullback of a group-diagram arrow is the group-presheaf restriction map on its coordinate. -/
theorem groupPullHom (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    {U V W Y : C} {x : (groupDiagram P).obj (.mk (op U))}
    {y : (groupDiagram P).obj (.mk (op V))}
    (f : Y ⟶ U) (g : Y ⟶ V)
    (a : ((groupDiagram P).map f.op.toLoc).toFunctor.obj x ⟶
      ((groupDiagram P).map g.op.toLoc).toFunctor.obj y)
    (h : W ⟶ Y) (hf : W ⟶ U) (hg : W ⟶ V)
    (whf : h ≫ f = hf) (whg : h ≫ g = hg) :
    Pseudofunctor.LocallyDiscreteOpToCat.pullHom a h hf hg = (P.map h.op) a := by sorry

/-- At the unique object of a group-diagram fibre, a group element is its automorphism. -/
def groupIso (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C)
    (x y : (groupDiagram P).obj (.mk (op U))) (g : P.obj (op U)) : x ≅ y := by sorry

/-- A diagram of one-object commutative groupoids is a stack for the minimal topology. -/
theorem groupDiagram_stack (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    (groupDiagram P).IsStack (⊥ : GrothendieckTopology C) := by sorry

/-- The SingleObj diagram of every commutative-group-valued presheaf is a gerbe for the bottom topology, without a terminal-object hypothesis. -/
theorem groupDiagram_gerbe (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    IsGerbe (groupDiagram P) (⊥ : GrothendieckTopology C) := by sorry

variable {G : Type chain_w} [CommGroup G]

/-- In a one-object commutative groupoid, the identity natural endomorphism associated to a group element acts by that element. -/
def singleCenter (g : G) : CatCenter (SingleObj G) := by sorry

/-- A coefficient g of a commutative group gives a unit of the actual categorical centre, with inverse coefficient g inverse. -/
def singleCenterUnit (g : G) : (CatCenter (SingleObj G))ˣ := by sorry

/-- Evaluation of the central unit corresponding to g has actual component g. -/
theorem singleCenterUnit_app (g : G) (x : SingleObj G) :
    (singleCenterUnit g).val.app x = g := by sorry

/-- A coefficient g in P(U) gives the actual compatible intrinsic-band section whose centre coefficient at every f:V to U is P(f.op)(g). -/
noncomputable def groupSection (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    (U : C) (g : P.obj (op U)) : IntrinsicBandSection (groupDiagram P) U := by sorry

/-- Native evaluation of that compatible section at f:V to U has coefficient P(f.op)(g). -/
theorem groupSection_eval (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    {U V : C} (f : V ⟶ U) (g : P.obj (op U)) :
    (eval (groupDiagram P) f (SingleObj.star (P.obj (op V)))
      (groupSection P U g)).hom = (P.map f.op) g := by sorry

/-- For a commutative-group presheaf, compatible slice automorphism families are exactly sections of the group at the slice base. -/
noncomputable def groupSectionsEquiv (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C) :
    P.obj (op U) ≃* IntrinsicBandSection (groupDiagram P) U := by sorry

/-- Restriction along f:V to U sends the compatible section of g to the compatible section of P(f.op)(g). -/
theorem groupSectionsEquiv_restrict (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    {U V : C} (f : V ⟶ U) (g : P.obj (op U)) :
    restrict (groupDiagram P) f (groupSectionsEquiv P U g) =
      groupSectionsEquiv P V ((P.map f.op) g) := by sorry

variable {B : Type} [SmallCategory B]

/-- The sectionwise group-to-intrinsic-band equivalences commute with every restriction and define an isomorphism of presheaves. -/
noncomputable def groupSectionsPresheafIso (P : Bᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    P ⋙ CommGrpCat.toAddCommGrp ≅ IntrinsicBandSections.presheaf (groupDiagram P) := by sorry

/-- The intrinsic additive band sheaf of the one-object group diagram on the minimal Grothendieck topology. -/
noncomputable def groupBandSheaf (P : Bᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    Sheaf (⊥ : GrothendieckTopology B) AddCommGrpCat.{chain_w} :=
  ⟨IntrinsicBandSections.presheaf (groupDiagram P), Presheaf.isSheaf_bot _⟩

/-- The underlying presheaf of the bottom-topology band sheaf is the actual intrinsic-band presheaf. -/
theorem groupBandSheaf_obj (P : Bᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    (groupBandSheaf P).obj = IntrinsicBandSections.presheaf (groupDiagram P) := by sorry

/-- For a small base category B, the native bottom-topology coefficient sheaf is isomorphic to the native intrinsic-band sheaf, with both inverse laws. -/
noncomputable def groupBandSheafIso (P : Bᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    (⟨P ⋙ CommGrpCat.toAddCommGrp, Presheaf.isSheaf_bot _⟩ :
      Sheaf (⊥ : GrothendieckTopology B) AddCommGrpCat.{chain_w}) ≅ groupBandSheaf P := by sorry

/-- Reduction from the cyclic group of order four to the cyclic group of order two, as a homomorphism of commutative groups. -/
abbrev reduction : Multiplicative (ZMod 4) →* Multiplicative (ZMod 2) :=
  (ZMod.castHom (show 2 ∣ 4 by decide) (ZMod 2)).toAddMonoidHom.toMultiplicative

/-- The chain of commutative groups C₄ → C₂ → C₂, with reduction followed by identity. -/
abbrev chainGroups : Fin 3 ⥤ CommGrpCat :=
  ComposableArrows.mk₂ (CommGrpCat.ofHom reduction)
    (𝟙 (CommGrpCat.of (Multiplicative (ZMod 2))))

/-- The three-object chain category, taken oppositely so that presheaf restriction follows the displayed group chain. -/
abbrev ChainSite := (Fin 3)ᵒᵖ
/-- The commutative-group presheaf on the three-object chain whose restriction maps are reduction and identity. -/
abbrev chainPresheaf : ChainSiteᵒᵖ ⥤ CommGrpCat := unopUnop (Fin 3) ⋙ chainGroups
/-- The one-object groupoid pseudofunctor associated to the chain presheaf. -/
abbrev chainF := groupDiagram chainPresheaf
/-- The source object of the three-object chain, whose group of sections is C₄. -/
abbrev U₀ : ChainSite := op (0 : Fin 3)
/-- The middle object of the three-object chain, whose group of sections is C₂. -/
abbrev U₁ : ChainSite := op (1 : Fin 3)
/-- The final object of the three-object chain, whose group of sections is C₂. -/
abbrev U₂ : ChainSite := op (2 : Fin 3)
/-- The chain arrow inducing reduction C₄ → C₂ on presheaf sections. -/
abbrev f₀₁ : U₁ ⟶ U₀ := (homOfLE (show (0 : Fin 3) ≤ 1 by decide)).op
/-- The chain arrow inducing identity C₂ → C₂ on presheaf sections. -/
abbrev f₁₂ : U₂ ⟶ U₁ := (homOfLE (show (1 : Fin 3) ≤ 2 by decide)).op
/-- The composite chain arrow; its restriction is the composite of reduction and identity. -/
abbrev f₀₂ : U₂ ⟶ U₀ := (homOfLE (show (0 : Fin 3) ≤ 2 by decide)).op

/-- The generator of C₄ restricts to the generator of C₂ along the reduction arrow. -/
theorem chain_generator_restrict :
    restrict chainF f₀₁ (groupSectionsEquiv chainPresheaf U₀
      (Multiplicative.ofAdd (1 : ZMod 4))) =
      groupSectionsEquiv chainPresheaf U₁ (Multiplicative.ofAdd (1 : ZMod 2)) := by sorry

/-- Restriction of the C₄ generator along the composite chain arrow agrees with its two successive restrictions. -/
theorem chain_generator_comp :
    restrict chainF f₁₂ (restrict chainF f₀₁
      (groupSectionsEquiv chainPresheaf U₀ (Multiplicative.ofAdd (1 : ZMod 4)))) =
      restrict chainF f₀₂
        (groupSectionsEquiv chainPresheaf U₀ (Multiplicative.ofAdd (1 : ZMod 4))) := by sorry

/-- The element two in C₄ restricts to zero in C₂, witnessing the kernel of restriction. -/
theorem chain_two_killed :
    restrict chainF f₀₁ (groupSectionsEquiv chainPresheaf U₀
      (Multiplicative.ofAdd (2 : ZMod 4))) = 1 := by sorry

/-- Restriction from C₄ to C₂ in the chain fixture is not injective. -/
theorem chain_restrict_not_injective : ¬ Function.Injective (restrict chainF f₀₁) := by sorry

/-- The disjoint union of two three-object chains. This site has no terminal object. -/
abbrev TwoChainSite := (Fin 3 ⊕ Fin 3)ᵒᵖ
/-- The group presheaf with one copy of C₄ → C₂ → C₂ on each component of the terminal-free two-chain site. -/
abbrev twoChainPresheaf : TwoChainSiteᵒᵖ ⥤ CommGrpCat :=
  unopUnop (Fin 3 ⊕ Fin 3) ⋙ chainGroups.sum' chainGroups
/-- The gerbe on the minimal topology induced by the two-chain group presheaf; its band is computed without a terminal site object. -/
abbrev twoChainF := groupDiagram twoChainPresheaf

/-- The disjoint union of two nonempty chains has no terminal object. -/
theorem twoChains_no_terminal (U : TwoChainSite) : ¬ Nonempty (Limits.IsTerminal U) := by sorry

/-- On either component of the terminal-free two-chain site, intrinsic band sections agree with the corresponding group-presheaf sections. -/
theorem twoChains_sections_equiv (U : TwoChainSite) :
    Nonempty (twoChainPresheaf.obj (op U) ≃* IntrinsicBandSection twoChainF U) := by sorry

/-- The actual hom of the coefficient isomorphism is g. -/
theorem groupIso_hom (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C)
    (x y : (groupDiagram P).obj (.mk (op U))) (g : P.obj (op U)) :
    (groupIso P U x y g).hom = g := by sorry

/-- The actual inverse of the coefficient isomorphism has coefficient g inverse. -/
theorem groupIso_inv (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C)
    (x y : (groupDiagram P).obj (.mk (op U))) (g : P.obj (op U)) :
    (groupIso P U x y g).inv = g⁻¹ := by sorry

/-- The actual component of the central endomorphism corresponding to g is g. -/
theorem singleCenter_app (g : G) (x : SingleObj G) : (singleCenter g).app x = g := by sorry

/-- The coefficient-to-centre construction preserves multiplication. -/
theorem singleCenter_mul (g h : G) : singleCenter (g * h) = singleCenter g * singleCenter h := by sorry

/-- The coefficient-to-centre-unit construction preserves multiplication. -/
theorem singleCenterUnit_mul (g h : G) :
    singleCenterUnit (g * h) = singleCenterUnit g * singleCenterUnit h := by sorry

/-- The coefficient unit gives the unit compatible section. -/
theorem groupSection_one (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C) :
    groupSection P U 1 = 1 := by sorry

/-- The coefficient-to-compatible-section construction preserves multiplication. -/
theorem groupSection_mul (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C)
    (g h : P.obj (op U)) : groupSection P U (g * h) = groupSection P U g * groupSection P U h := by sorry

/-- The inverse coefficient is the actual centre-unit component at the identity slice arrow and native SingleObj object. -/
theorem groupSectionsEquiv_symm_apply (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C)
    (s : IntrinsicBandSection (groupDiagram P) U) :
    (groupSectionsEquiv P U).symm s =
      (val (groupDiagram P) s U (𝟙 U)).val.app (SingleObj.star (P.obj (op U))) := by sorry

/-- The presheaf isomorphism sends an additive coefficient to the additive tag of its actual compatible section. -/
theorem groupSectionsPresheafIso_hom_app (P : Bᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : Bᵒᵖ)
    (g : Additive (P.obj U)) :
    (groupSectionsPresheafIso P).hom.app U g = Additive.ofMul
      (groupSectionsEquiv P U.unop g.toMul) := by sorry

/-- The underlying natural transformation of the native sheaf isomorphism is the coefficient-to-band presheaf isomorphism. -/
theorem groupBandSheafIso_hom (P : Bᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    (groupBandSheafIso P).hom.hom = (groupSectionsPresheafIso P).hom := by sorry

/-- The cyclic-group chain diagram satisfies stack descent for the minimal topology. -/
theorem chain_stack : chainF.IsStack (⊥ : GrothendieckTopology ChainSite) := by sorry

/-- The cyclic-group chain diagram is a gerbe for the minimal topology. -/
theorem chain_gerbe : IsGerbe chainF (⊥ : GrothendieckTopology ChainSite) := by sorry

/-- The cyclic-group diagram on two disjoint chains satisfies stack descent without a terminal site object. -/
theorem twoChains_stack : twoChainF.IsStack (⊥ : GrothendieckTopology TwoChainSite) := by sorry

/-- The cyclic-group diagram on two disjoint chains is a gerbe without a terminal site object. -/
theorem twoChains_gerbe : IsGerbe twoChainF (⊥ : GrothendieckTopology TwoChainSite) := by sorry

/-- The intrinsic band at the source of the group chain has four sections. -/
theorem chain_source_card : Nat.card (IntrinsicBandSection chainF U₀) = 4 := by sorry

/-- The intrinsic band at the reduction target has two sections. -/
theorem chain_target_card : Nat.card (IntrinsicBandSection chainF U₁) = 2 := by sorry

end RestrictionBandFixtures

namespace RestrictionBandFixtures.RestrictionBandTests
open CategoryTheory Opposite Bicategory IntrinsicBandSections
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type chain_u} [Category.{chain_v} C]
variable (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C)

-- RestrictionBandTests.isoUnit
/-- `RestrictionBandTests.isoUnit`: The unit coefficient gives an isomorphism with the actual hom-inverse identity. -/
example (x y : (groupDiagram P).obj (.mk (op U))) :
    (groupIso P U x y 1).hom ≫ (groupIso P U x y 1).inv = 𝟙 x := by sorry

-- RestrictionBandTests.isoInverseQuarter
/-- `RestrictionBandTests.isoInverseQuarter`: The inverse of the C4 generator isomorphism has coefficient three. -/
example :
    (groupIso chainPresheaf U₀ (SingleObj.star (Multiplicative (ZMod 4))) (SingleObj.star (Multiplicative (ZMod 4)))
      (Multiplicative.ofAdd (1 : ZMod 4))).inv = Multiplicative.ofAdd (3 : ZMod 4) := by sorry

-- RestrictionBandTests.isoQuarterRoundTrip
/-- `RestrictionBandTests.isoQuarterRoundTrip`: The actual C4 generator hom followed by its inverse is the native identity. -/
example :
    (groupIso chainPresheaf U₀ (SingleObj.star (Multiplicative (ZMod 4))) (SingleObj.star (Multiplicative (ZMod 4)))
      (Multiplicative.ofAdd (1 : ZMod 4))).hom ≫
      (groupIso chainPresheaf U₀ (SingleObj.star (Multiplicative (ZMod 4))) (SingleObj.star (Multiplicative (ZMod 4)))
        (Multiplicative.ofAdd (1 : ZMod 4))).inv = 𝟙 (SingleObj.star (Multiplicative (ZMod 4))) := by sorry

-- RestrictionBandTests.centerNaturality
/-- `RestrictionBandTests.centerNaturality`: The C4 generator central transformation commutes with every actual fibre arrow. -/
example (a : Multiplicative (ZMod 4)) :
    (singleCenter (Multiplicative.ofAdd (1 : ZMod 4))).app (SingleObj.star (Multiplicative (ZMod 4))) ≫
        (a : SingleObj.star (Multiplicative (ZMod 4)) ⟶ SingleObj.star (Multiplicative (ZMod 4))) =
      (a : SingleObj.star (Multiplicative (ZMod 4)) ⟶ SingleObj.star (Multiplicative (ZMod 4))) ≫
        (singleCenter (Multiplicative.ofAdd (1 : ZMod 4))).app (SingleObj.star (Multiplicative (ZMod 4))) := by sorry

-- RestrictionBandTests.centerDoubleGenerator
/-- `RestrictionBandTests.centerDoubleGenerator`: Multiplying the two generator central transformations gives coefficient two. -/
example :
    singleCenter (Multiplicative.ofAdd (2 : ZMod 4)) =
      singleCenter (Multiplicative.ofAdd (1 : ZMod 4)) *
        singleCenter (Multiplicative.ofAdd (1 : ZMod 4)) := by sorry

-- RestrictionBandTests.centerUnitOrderFour
/-- `RestrictionBandTests.centerUnitOrderFour`: The actual central unit of the C4 generator has fourth power one. -/
example :
    (singleCenterUnit (Multiplicative.ofAdd (1 : ZMod 4))) ^ 4 = 1 := by sorry

-- RestrictionBandTests.unitInverseCoefficient
/-- `RestrictionBandTests.unitInverseCoefficient`: The inverse central unit of the C4 generator has actual component three. -/
example :
    (singleCenterUnit (Multiplicative.ofAdd (1 : ZMod 4))).inv.app (SingleObj.star (Multiplicative (ZMod 4))) =
      Multiplicative.ofAdd (3 : ZMod 4) := by sorry

-- RestrictionBandTests.unitDoubleGenerator
/-- `RestrictionBandTests.unitDoubleGenerator`: Multiplying two generator central units gives the central unit of coefficient two. -/
example :
    singleCenterUnit (Multiplicative.ofAdd (2 : ZMod 4)) =
      singleCenterUnit (Multiplicative.ofAdd (1 : ZMod 4)) *
        singleCenterUnit (Multiplicative.ofAdd (1 : ZMod 4)) := by sorry

-- RestrictionBandTests.sectionEvaluation
/-- `RestrictionBandTests.sectionEvaluation`: The source generator evaluates after restriction as the nonidentity C2 generator. -/
example :
    (eval chainF f₀₁ (SingleObj.star (Multiplicative (ZMod 2))) (groupSection chainPresheaf U₀
      (Multiplicative.ofAdd (1 : ZMod 4)))).hom = Multiplicative.ofAdd (1 : ZMod 2) := by sorry

-- RestrictionBandTests.sectionKilled
/-- `RestrictionBandTests.sectionKilled`: Restriction kills the compatible section of source coefficient two. -/
example : restrict chainF f₀₁ (groupSection chainPresheaf U₀
    (Multiplicative.ofAdd (2 : ZMod 4))) = 1 := by sorry

-- RestrictionBandTests.sectionComposition
/-- `RestrictionBandTests.sectionComposition`: The two successive chain restrictions equal restriction along the actual composite. -/
example :
    restrict chainF f₁₂ (restrict chainF f₀₁
      (groupSection chainPresheaf U₀ (Multiplicative.ofAdd (1 : ZMod 4)))) =
      restrict chainF f₀₂
        (groupSection chainPresheaf U₀ (Multiplicative.ofAdd (1 : ZMod 4))) := by sorry

-- RestrictionBandTests.equivalenceLeftRoundTrip
/-- `RestrictionBandTests.equivalenceLeftRoundTrip`: Inverse after forward recovers every coefficient in an arbitrary varying group presheaf. -/
example (g : P.obj (op U)) :
    (groupSectionsEquiv P U).symm (groupSectionsEquiv P U g) = g := by sorry

-- RestrictionBandTests.equivalenceRightRoundTrip
/-- `RestrictionBandTests.equivalenceRightRoundTrip`: Forward after inverse recovers every compatible section on every slice arrow. -/
example (s : IntrinsicBandSection (groupDiagram P) U) :
    groupSectionsEquiv P U ((groupSectionsEquiv P U).symm s) = s := by sorry

-- RestrictionBandTests.equivalenceDifferentCardinalities
/-- `RestrictionBandTests.equivalenceDifferentCardinalities`: The actual source and target compatible-section types have four and two elements respectively. -/
example :
    Nat.card (IntrinsicBandSection chainF U₀) = 4 ∧
      Nat.card (IntrinsicBandSection chainF U₁) = 2 := by sorry

variable {B : Type} [SmallCategory B] (Q : Bᵒᵖ ⥤ CommGrpCat.{chain_w})

-- RestrictionBandTests.presheafForward
/-- `RestrictionBandTests.presheafForward`: The native presheaf isomorphism has the specified coefficient-to-section map at every object. -/
example (V : Bᵒᵖ) (g : Additive (Q.obj V)) :
    (groupSectionsPresheafIso Q).hom.app V g =
      Additive.ofMul (groupSectionsEquiv Q V.unop g.toMul) := by sorry

-- RestrictionBandTests.presheafInverse
/-- `RestrictionBandTests.presheafInverse`: The forward and inverse components compose to the actual identity at every object. -/
example (V : Bᵒᵖ) :
    (groupSectionsPresheafIso Q).hom.app V ≫ (groupSectionsPresheafIso Q).inv.app V = 𝟙 _ := by sorry

-- RestrictionBandTests.presheafNaturality
/-- `RestrictionBandTests.presheafNaturality`: The presheaf isomorphism commutes with every actual restriction arrow. -/
example {V W : Bᵒᵖ} (f : V ⟶ W) :
    (Q ⋙ CommGrpCat.toAddCommGrp).map f ≫ (groupSectionsPresheafIso Q).hom.app W =
      (groupSectionsPresheafIso Q).hom.app V ≫
        (IntrinsicBandSections.presheaf (groupDiagram Q)).map f := by sorry

-- RestrictionBandTests.sheafNative
/-- `RestrictionBandTests.sheafNative`: The actual band presheaf satisfies the native bottom-topology sheaf predicate. -/
example : Presheaf.IsSheaf (⊥ : GrothendieckTopology B)
    (groupBandSheaf Q).obj := by sorry

-- RestrictionBandTests.sheafObject
/-- `RestrictionBandTests.sheafObject`: The sheaf wrapper retains the actual compatible-section presheaf as its object. -/
example : (groupBandSheaf Q).obj =
    IntrinsicBandSections.presheaf (groupDiagram Q) := by sorry

-- RestrictionBandTests.sheafRestrictionGenerator
/-- `RestrictionBandTests.sheafRestrictionGenerator`: The native additive band-sheaf restriction sends the C4 generator section to the C2 generator section. -/
example :
    (groupBandSheaf chainPresheaf).obj.map f₀₁.op
      (Additive.ofMul (groupSectionsEquiv chainPresheaf U₀ (Multiplicative.ofAdd (1 : ZMod 4)))) =
      Additive.ofMul (groupSectionsEquiv chainPresheaf U₁ (Multiplicative.ofAdd (1 : ZMod 2))) := by sorry

-- RestrictionBandTests.sheafIsoForwardInverse
/-- `RestrictionBandTests.sheafIsoForwardInverse`: The forward and inverse native sheaf morphisms compose to the coefficient-sheaf identity. -/
example :
    (groupBandSheafIso Q).hom ≫ (groupBandSheafIso Q).inv = 𝟙 _ := by sorry

-- RestrictionBandTests.sheafIsoInverseForward
/-- `RestrictionBandTests.sheafIsoInverseForward`: The inverse and forward native sheaf morphisms compose to the band-sheaf identity. -/
example :
    (groupBandSheafIso Q).inv ≫ (groupBandSheafIso Q).hom = 𝟙 _ := by sorry

-- RestrictionBandTests.sheafIsoGenerator
/-- `RestrictionBandTests.sheafIsoGenerator`: The native sheaf isomorphism sends the actual source generator to its compatible section. -/
example :
    (groupBandSheafIso chainPresheaf).hom.hom.app (op U₀)
      (Additive.ofMul (Multiplicative.ofAdd (1 : ZMod 4))) =
      Additive.ofMul (groupSection chainPresheaf U₀ (Multiplicative.ofAdd (1 : ZMod 4))) := by sorry

-- RestrictionBandTests.chainGerbe
/-- `RestrictionBandTests.chainGerbe`: The actual nonconstant chain diagram satisfies the gerbe contract. -/
example : IsGerbe chainF (⊥ : GrothendieckTopology ChainSite) := by sorry

-- RestrictionBandTests.restrictionNotInjective
/-- `RestrictionBandTests.restrictionNotInjective`: The actual compatible-section restriction is not injective. -/
example : ¬ Function.Injective (restrict chainF f₀₁) := by sorry

-- RestrictionBandTests.noTerminal
/-- `RestrictionBandTests.noTerminal`: No object of the actual two-chain site is terminal. -/
example (V : TwoChainSite) : ¬ Nonempty (Limits.IsTerminal V) := by sorry

-- RestrictionBandTests.terminalFreeGerbe
/-- `RestrictionBandTests.terminalFreeGerbe`: The actual two-chain varying diagram is a gerbe despite the absence of a terminal site object. -/
example : IsGerbe twoChainF (⊥ : GrothendieckTopology TwoChainSite) := by sorry

-- RestrictionBandTests.leftChainSourceCard
/-- `RestrictionBandTests.leftChainSourceCard`: The actual section type at the left C4 source has four elements. -/
example :
    Nat.card (IntrinsicBandSection twoChainF (op (Sum.inl (0 : Fin 3)))) = 4 := by sorry

-- RestrictionBandTests.rightChainTargetCard
/-- `RestrictionBandTests.rightChainTargetCard`: The actual section type at the right C2 target has two elements. -/
example :
    Nat.card (IntrinsicBandSection twoChainF (op (Sum.inr (1 : Fin 3)))) = 2 := by sorry

-- RestrictionBandTests.terminalFreeSheafIso
/-- `RestrictionBandTests.terminalFreeSheafIso`: The actual coefficient-to-band sheaf isomorphism exists on the terminal-free site. -/
example :
    Nonempty ((⟨twoChainPresheaf ⋙ CommGrpCat.toAddCommGrp, Presheaf.isSheaf_bot _⟩ :
      Sheaf (⊥ : GrothendieckTopology TwoChainSite) AddCommGrpCat) ≅
      groupBandSheaf twoChainPresheaf) := by sorry

end RestrictionBandFixtures.RestrictionBandTests


namespace BandedIsom
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

/-- act(p,1)=p; multiplicative one is additive zero. -/
theorem act_one (p : x ≅ y) : act F J A b p 1 = p := by
  sorry

/-- act(p,a*c)=act(act(p,c),a), retaining the native reversed-composition convention for automorphisms. -/
theorem act_mul (p : x ≅ y) (a c : Multiplicative (A.obj.obj (op U))) :
    act F J A b p (a * c) = act F J A b (act F J A b p c) a := by
  sorry

/-- The unique coefficient carrying p to q, computed using the inverse of p. -/
def difference (b : AbelianBanding F J A) (p q : x ≅ y) : Multiplicative (A.obj.obj (op U)) := by
  sorry

/-- act(p,difference(p,q))=q. -/
theorem act_difference (p q : x ≅ y) : act F J A b p (difference F J A b p q) = q := by
  sorry

/-- difference(p,act(p,a))=a. -/
theorem difference_act (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    difference F J A b p (act F J A b p a) = a := by
  sorry

/-- difference(p,p)=1. -/
theorem difference_self (p : x ≅ y) : difference F J A b p p = 1 := by
  sorry

/-- Postcomposition of p with b_y(a) equals precomposition with b_x(a), using the stored conjugation equation. -/
theorem act_precompose (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    act F J A b p a = b.autEquiv U x a ≪≫ p := by
  sorry

/-- The band action commutes with postcomposition by an isomorphism, through conjugation compatibility of the band. -/
theorem act_postcompose (p : x ≅ y) (q : y ≅ z)
    (a : Multiplicative (A.obj.obj (op U))) :
    act F J A b p a ≪≫ q = act F J A b (p ≪≫ q) a := by
  sorry

/-- Principal comparison exists even when the global section type is empty. -/
def principalEquiv (b : AbelianBanding F J A) (x y : F.obj (.mk (op U))) :
    ((x ≅ y) × Multiplicative (A.obj.obj (op U))) ≃ ((x ≅ y) × (x ≅ y)) := by
  sorry

/-- When an isomorphism x ≅ y exists, postcomposition by the specified abelian band makes its actual isomorphism set a torsor. -/
@[instance_reducible]
def isomTorsor (b : AbelianBanding F J A) (x y : F.obj (.mk (op U))) (h : Nonempty (x ≅ y)) :
    Torsor (Multiplicative (A.obj.obj (op U))) (x ≅ y) := by
  sorry

/-- An anchor trivializes the section torsor. -/
def coordinateEquiv (b : AbelianBanding F J A) (p : x ≅ y) :
    Multiplicative (A.obj.obj (op U)) ≃ (x ≅ y) := by
  sorry

/-- The identity band coefficient gives the chosen anchor isomorphism under torsor coordinates. -/
theorem coordinate_one (p : x ≅ y) : coordinateEquiv F J A b p 1 = p := by
  sorry

/-- The coordinates based at q send a to the coordinates based at p evaluated at a*difference(p,q). -/
theorem coordinate_change (p q : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    coordinateEquiv F J A b q a =
      coordinateEquiv F J A b p (a * difference F J A b p q) := by
  sorry

/-- The difference from p to r is the product of the differences from p to q and q to r, with the postcomposition convention. -/
theorem difference_cocycle (p q r : x ≅ y) :
    difference F J A b p r = difference F J A b q r * difference F J A b p q := by
  sorry

/-- Restricting an acted-on isomorphism restricts both the isomorphism and its band coefficient. -/
theorem restrict_act {V : C} (f : V ⟶ U) (p : x ≅ y)
    (a : Multiplicative (A.obj.obj (op U))) :
    (F.map f.op.toLoc).toFunctor.mapIso (act F J A b p a) =
      act F J A b ((F.map f.op.toLoc).toFunctor.mapIso p)
        (Multiplicative.ofAdd ((A.obj.map f.op) a.toAdd)) := by
  sorry

/-- The band difference of two restricted isomorphisms is the restriction of their original difference. -/
theorem restrict_difference {V : C} (f : V ⟶ U) (p q : x ≅ y) :
    difference F J A b ((F.map f.op.toLoc).toFunctor.mapIso p)
      ((F.map f.op.toLoc).toFunctor.mapIso q) =
        Multiplicative.ofAdd ((A.obj.map f.op) (difference F J A b p q).toAdd) := by
  sorry

/-- Isomorphism to the already built Hom type: the groupoid condition is essential. -/
noncomputable def homEquiv (J : GrothendieckTopology C) [IsGerbe F J] (x y : F.obj (.mk (op U))) : (x ≅ y) ≃ (x ⟶ y) := by
  sorry

/-- Act on actual arrows x → y by postcomposing with the automorphism supplied by the band at y. -/
def homAct (b : AbelianBanding F J A) (p : x ⟶ y) (a : Multiplicative (A.obj.obj (op U))) : x ⟶ y := by
  sorry

/-- Transport the isomorphism principal equivalence through the Hom-Isom equivalence to obtain Hom(x,y)×A(U) equivalent to Hom(x,y)×Hom(x,y). -/
noncomputable def homPrincipalEquiv (b : AbelianBanding F J A) (x y : F.obj (.mk (op U))) :
    ((x ⟶ y) × Multiplicative (A.obj.obj (op U))) ≃ ((x ⟶ y) × (x ⟶ y)) := by
  sorry

/-- The Hom comparison sends (p,a) to (p,p composed with b_y(a)), retaining the existing fibre arrow. -/
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

/-- The product of two copies of the native Hom presheaf on C/U. -/
def pairPresheaf (x y : F.obj (.mk (op U))) : (Over U)ᵒᵖ ⥤ Type v' := by
  sorry

/-- Product of the same Hom presheaf with the restricted coefficient presheaf. -/
def actionPresheaf (A : Sheaf J AddCommGrpCat.{v'}) (x y : F.obj (.mk (op U))) : (Over U)ᵒᵖ ⥤ Type v' := by
  sorry

/-- natural principal comparison, retaining all slice-arrow coherence. -/
noncomputable def principalPresheafIso (b : AbelianBanding F J A) (x y : F.obj (.mk (op U))) :
    actionPresheaf F J A x y ≅ pairPresheaf F x y := by
  sorry

/-- The product of two native Hom sheaves is a sheaf for J over U, by finite-product
descent in the existing sheaf category. -/
theorem pair_isSheaf (x y : F.obj (.mk (op U))) :
    Presheaf.IsSheaf (J.over U) (pairPresheaf F x y) := by
  sorry

/-- Transport the proved Hom-pair sheaf property through the actual principal presheaf isomorphism; the specified banding is retained as a parameter. -/
theorem action_isSheaf (b : AbelianBanding F J A) (x y : F.obj (.mk (op U))) :
    Presheaf.IsSheaf (J.over U) (actionPresheaf F J A x y) := by
  sorry

/-- Package the actual Hom-pair presheaf with its proved property in the existing Sheaf category on J over U. -/
noncomputable def pairSheaf (x y : F.obj (.mk (op U))) : Sheaf (J.over U) (Type v') := by
  sorry

/-- Package the actual Hom-times-band presheaf with its proved sheaf property in the same existing Sheaf category. -/
noncomputable def actionSheaf (b : AbelianBanding F J A) (x y : F.obj (.mk (op U))) : Sheaf (J.over U) (Type v') := by
  sorry

/-- sheaf principal comparison, on the already built sheaf carrier. -/
noncomputable def principalSheafIso (x y : F.obj (.mk (op U))) :
    actionSheaf F J A b x y ≅ pairSheaf F J x y := by
  sorry

/-- There is a J-covering sieve R on U such that every arrow f:V→U in R has a section of Hom(x restricted to V,y restricted to V). This is obtained from local isomorphism and does not assert a global section. -/
theorem hom_localNonempty (x y : F.obj (.mk (op U))) :
    ∃ R : Sieve U, R ∈ J U ∧ ∀ ⦃V : C⦄ (f : V ⟶ U), R f →
      Nonempty ((F.map f.op.toLoc).toFunctor.obj x ⟶ (F.map f.op.toLoc).toFunctor.obj y) := by
  sorry

/-- principalEquiv sends (p,a) exactly to (p,act(p,a)). -/
theorem principalEquiv_apply (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    principalEquiv F J A b x y (p,a) = (p, act F J A b p a) := by
  sorry

/-- The inverse principal comparison sends (p,q) exactly to (p,difference(p,q)). -/
theorem principalEquiv_symm_apply (p q : x ≅ y) :
    (principalEquiv F J A b x y).symm (p,q) = (p, difference F J A b p q) := by
  sorry

/-- coordinateEquiv(p)(a)=act(p,a). -/
theorem coordinate_apply (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    coordinateEquiv F J A b p a = act F J A b p a := by
  sorry

/-- The inverse coordinate map based at p sends q to difference(p,q). -/
theorem coordinate_symm_apply (p q : x ≅ y) :
    (coordinateEquiv F J A b p).symm q = difference F J A b p q := by
  sorry

/-- The underlying presheaf morphism of principalSheafIso is heterogeneously equal to the explicit principalPresheafIso morphism, retaining their different definitional carrier presentations. -/
theorem principalSheafIso_hom (x y : F.obj (.mk (op U))) :
    HEq (principalSheafIso F J A b x y).hom.hom (principalPresheafIso F J A b x y).hom := by
  sorry

end BandedIsom

namespace BandedIsom.Tests
open CategoryTheory Opposite Bicategory
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
variable (J : GrothendieckTopology C) [IsGerbe F J]
variable (A : Sheaf J AddCommGrpCat.{v'}) (b : AbelianBanding F J A)
variable {U : C} {x y z : F.obj (.mk (op U))}

-- BandedIsom.Tests.zeroAction
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.zeroAction`: The additive-zero coefficient fixes an arbitrary actual isomorphism. -/
example (p : x ≅ y) : act F J A b p 1 = p := by
  sorry

-- BandedIsom.Tests.actionOrder
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.actionOrder`: Two successive actions use the native automorphism multiplication order. -/
example (p : x ≅ y) (a c : Multiplicative (A.obj.obj (op U))) :
    act F J A b (act F J A b p c) a = act F J A b p (a*c) := by
  sorry

-- BandedIsom.Tests.precomposition
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.precomposition`: Postcomposition and precomposition use the same band coefficient. -/
example (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    act F J A b p a = b.autEquiv U x a ≪≫ p := by
  sorry

-- BandedIsom.Tests.composition
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.composition`: Composition with y to z preserves the same action coefficient. -/
example (p : x ≅ y) (q : y ≅ z) (a : Multiplicative (A.obj.obj (op U))) :
    act F J A b p a ≪≫ q = act F J A b (p ≪≫ q) a := by
  sorry

-- BandedIsom.Tests.uniqueCoefficient
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.uniqueCoefficient`: For actual p and q there is exactly one coefficient sending p to q. -/
example (p q : x ≅ y) :
    ∃! a : Multiplicative (A.obj.obj (op U)), act F J A b p a = q := by
  sorry

-- BandedIsom.Tests.differenceZero
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.differenceZero`: An actual isomorphism has zero self-difference. -/
example (p : x ≅ y) : difference F J A b p p = 1 := by
  sorry

-- BandedIsom.Tests.differenceRecovery
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.differenceRecovery`: The computed difference recovers the actual target isomorphism. -/
example (p q : x ≅ y) :
    act F J A b p (difference F J A b p q) = q := by
  sorry

-- BandedIsom.Tests.differenceCocycle
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.differenceCocycle`: Three actual isomorphisms satisfy the ordered difference cocycle. -/
example (p q r : x ≅ y) :
    difference F J A b p r = difference F J A b q r * difference F J A b p q := by
  sorry

-- BandedIsom.Tests.principalLeft
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.principalLeft`: The principal comparison followed by its inverse fixes every isomorphism-coefficient pair. -/
example (t : (x ≅ y) × Multiplicative (A.obj.obj (op U))) :
    (principalEquiv F J A b x y).symm (principalEquiv F J A b x y t) = t := by
  sorry

-- BandedIsom.Tests.principalRight
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.principalRight`: The inverse followed by the principal comparison fixes every pair of isomorphisms. -/
example (t : (x ≅ y) × (x ≅ y)) :
    principalEquiv F J A b x y ((principalEquiv F J A b x y).symm t) = t := by
  sorry

-- BandedIsom.Tests.principalWithoutAnchor
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.principalWithoutAnchor`: The principal equivalence exists without a Nonempty hypothesis on the global isomorphism type. -/
example (b : AbelianBanding F J A) :
    Nonempty (((x ≅ y) × Multiplicative (A.obj.obj (op U))) ≃ ((x ≅ y) × (x ≅ y))) := by
  sorry

omit [IsGerbe F J] in
-- BandedIsom.Tests.noPointCreated
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.noPointCreated`: If the actual global isomorphism type is empty, its product with coefficients remains empty. -/
example [IsEmpty (x ≅ y)] :
    IsEmpty ((x ≅ y) × Multiplicative (A.obj.obj (op U))) := by
  sorry

-- BandedIsom.Tests.torsorDivision
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.torsorDivision`: For actual p and q the native torsor division coefficient acts on q to give p. -/
example (p q : x ≅ y) :
    (letI := isomTorsor F J A b x y ⟨p⟩
     (p /ₛ q : Multiplicative (A.obj.obj (op U))) • q = p) := by
  sorry

-- BandedIsom.Tests.selfCoefficient
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.selfCoefficient`: For the identity anchor on x, the coordinate image of a is the actual band automorphism b_x(a). -/
example (a : Multiplicative (A.obj.obj (op U))) :
    coordinateEquiv F J A b (Iso.refl x) a = b.autEquiv U x a := by
  sorry

-- BandedIsom.Tests.selfZero
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.selfZero`: The identity anchor sends zero to the actual identity isomorphism. -/
example : coordinateEquiv F J A b (Iso.refl x) 1 = Iso.refl x := by
  sorry

-- BandedIsom.Tests.nonzeroMoves
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.nonzeroMoves`: Every nonzero coefficient moves every actual isomorphism; the action is not trivial. -/
example (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) (ha : a ≠ 1) :
    act F J A b p a ≠ p := by
  sorry

-- BandedIsom.Tests.zeroBandUnique
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.zeroBandUnique`: When the coefficient group at U is subsingleton, any two actual isomorphisms coincide. -/
example (b : AbelianBanding F J A) [Subsingleton (A.obj.obj (op U))] (p q : x ≅ y) : p = q := by
  sorry

-- BandedIsom.Tests.changedAnchor
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.changedAnchor`: The difference from p to q is the coordinate of q in the trivialization based at p. -/
example (p q : x ≅ y) :
    coordinateEquiv F J A b p (difference F J A b p q) = q := by
  sorry

-- BandedIsom.Tests.homUsesActualArrow
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.homUsesActualArrow`: The Hom-Isom equivalence sends p to its actual hom arrow. -/
example (p : x ≅ y) : homEquiv F J x y p = p.hom := by
  sorry

-- BandedIsom.Tests.homComparison
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.homComparison`: The Hom principal map is actual postcomposition, not a separately chosen arrow. -/
example (p : x ⟶ y) (a : Multiplicative (A.obj.obj (op U))) :
    homPrincipalEquiv F J A b x y (p,a) = (p,p ≫ (b.autEquiv U y a).hom) := by
  sorry

-- BandedIsom.Tests.restrictionAction
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.restrictionAction`: Restriction acts on both the isomorphism and its actual coefficient. -/
example {V : C} (f : V ⟶ U) (p : x ≅ y)
    (a : Multiplicative (A.obj.obj (op U))) :
    (F.map f.op.toLoc).toFunctor.mapIso (act F J A b p a) =
      act F J A b ((F.map f.op.toLoc).toFunctor.mapIso p)
        (Multiplicative.ofAdd ((A.obj.map f.op) a.toAdd)) := by
  sorry

-- BandedIsom.Tests.restrictionDifference
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.restrictionDifference`: Restriction carries the difference coefficient to the difference of the restricted arrows. -/
example {V : C} (f : V ⟶ U) (p q : x ≅ y) :
    difference F J A b ((F.map f.op.toLoc).toFunctor.mapIso p)
      ((F.map f.op.toLoc).toFunctor.mapIso q) =
        Multiplicative.ofAdd ((A.obj.map f.op) (difference F J A b p q).toAdd) := by
  sorry

-- BandedIsom.Tests.pairSheafNative
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.pairSheafNative`: The actual Hom-pair presheaf satisfies the native sheaf condition on J over U. -/
example : Presheaf.IsSheaf (J.over U) (pairPresheaf F x y) := by
  sorry

-- BandedIsom.Tests.actionSheafNative
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.actionSheafNative`: The actual Hom-times-band presheaf satisfies the native sheaf condition. -/
example (b : AbelianBanding F J A) :
    Presheaf.IsSheaf (J.over U) (actionPresheaf F J A x y) := by
  sorry

-- BandedIsom.Tests.sheafLeft
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.sheafLeft`: The principal native sheaf morphism followed by its inverse is the identity on the action sheaf. -/
example :
    (principalSheafIso F J A b x y).hom ≫ (principalSheafIso F J A b x y).inv =
      𝟙 (actionSheaf F J A b x y) := by
  sorry

-- BandedIsom.Tests.sheafRight
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.sheafRight`: Its inverse followed by the morphism is the identity on the pair sheaf. -/
example :
    (principalSheafIso F J A b x y).inv ≫ (principalSheafIso F J A b x y).hom =
      𝟙 (pairSheaf F J x y) := by
  sorry

-- BandedIsom.Tests.sheafUnderlying
/-- `TauCeti.AlgebraicGeometry.BandedIsom.Tests.sheafUnderlying`: The underlying presheaf morphism is the actual principal morphism, with explicit carrier transport. -/
example :
    HEq (principalSheafIso F J A b x y).hom.hom (principalPresheafIso F J A b x y).hom := by
  sorry

end BandedIsom.Tests


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

/-- A band-preserving morphism intertwines the band actions through its actual fibre functor. -/
theorem map_act (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    (η.app (.mk (op U))).toFunctor.mapIso (BandedIsom.act F J A bF p a) =
      BandedIsom.act G J A bG ((η.app (.mk (op U))).toFunctor.mapIso p) a := by
  sorry

/-- A band-preserving morphism retains the band difference of two source isomorphisms. -/
theorem map_difference (p q : x ≅ y) :
    BandedIsom.difference G J A bG ((η.app (.mk (op U))).toFunctor.mapIso p)
      ((η.app (.mk (op U))).toFunctor.mapIso q) = BandedIsom.difference F J A bF p q := by
  sorry

/-- The actual isomorphism map of a band-preserving gerbe morphism is injective. -/
theorem mapIso_injective : Function.Injective
    ((η.app (.mk (op U))).toFunctor.mapIso : (x ≅ y) → _) := by
  sorry

/-- Preservation of the specified abelian band makes the gerbe morphism faithful on every fibre. -/
theorem faithful (U : C) : (η.app (.mk (op U))).toFunctor.Faithful := by
  sorry

/-- An source anchor supplies a preimage; no global anchor is inferred. -/
def preimageIso (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) (p : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) : x ≅ y := by
  sorry

/-- mapIso(preimageIso(p,q))=q, by action compatibility and the target difference-action cancellation. This works for every target isomorphism once the actual source anchor is supplied. -/
theorem map_preimageIso (p : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) :
    (η.app (.mk (op U))).toFunctor.mapIso (preimageIso bF bG η p q) = q := by
  sorry

/-- preimageIso(p,mapIso(q))=q for actual p,q:x≅y, using unchanged difference coefficients and source action cancellation. -/
theorem preimageIso_map (p q : x ≅ y) :
    preimageIso bF bG η p ((η.app (.mk (op U))).toFunctor.mapIso q) = q := by
  sorry

/-- For any actual anchors p,p′ and target q, preimageIso(p,q)=preimageIso(p′,q). Both map to q, and mapIso is injective. No choice of a global anchor is made. -/
theorem preimageIso_anchor (p p' : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) :
    preimageIso bF bG η p q = preimageIso bF bG η p' q := by
  sorry

/-- An anchor x ≅ y and band preservation identify source and target isomorphism sets by the actual component functor. -/
def isomEquiv (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] (p : x ≅ y) : (x ≅ y) ≃
    ((η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) := by
  sorry

/-- isomEquiv(p)(q)=ηU.mapIso(q), as an equality of actual isomorphisms. -/
theorem isomEquiv_apply (p q : x ≅ y) :
    isomEquiv bF bG η p q = (η.app (.mk (op U))).toFunctor.mapIso q := by
  sorry

/-- isomEquiv(p) inverse applied to q equals preimageIso(p,q). -/
theorem isomEquiv_symm_apply (p : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) :
    (isomEquiv bF bG η p).symm q = preimageIso bF bG η p q := by
  sorry

/-- The native Equiv objects isomEquiv(p) and isomEquiv(p′) are equal, because their forward functions are the same actual fibre functor mapIso. -/
theorem isomEquiv_anchor (p p' : x ≅ y) : isomEquiv bF bG η p = isomEquiv bF bG η p' := by
  sorry

/-- preimageIso(p,actG(q,a))=actF(preimageIso(p,q),a), by mapIso injectivity, the inverse law and the forward action equation. -/
theorem preimageIso_act (p : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y)
    (a : Multiplicative (A.obj.obj (op U))) :
    preimageIso bF bG η p (BandedIsom.act G J A bG q a) =
      BandedIsom.act F J A bF (preimageIso bF bG η p q) a := by
  sorry

/-- Given a source isomorphism between the endpoints, preservation of the common band lifts every target arrow between their images. -/
theorem hom_surjective_of_anchor (p : x ≅ y) : Function.Surjective
    ((η.app (.mk (op U))).toFunctor.map : (x ⟶ y) → _) := by
  sorry

/-- The automorphism map, expressed through the fixed band's equivalences. -/
def autEquiv (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) (x : F.obj (.mk (op U))) : Aut x ≃*
    Aut ((η.app (.mk (op U))).toFunctor.obj x) := by
  sorry

/-- autEquiv(x)(a)=ηU.mapAut(x)(a) for every actual source automorphism, by its unique coefficient under bF and the stored band equation. -/
theorem autEquiv_apply (x : F.obj (.mk (op U))) (a : Aut x) :
    autEquiv bF bG η x a = (η.app (.mk (op U))).toFunctor.mapAut x a := by
  sorry

omit [BandPreserving bF bG η] in
/-- autEquiv(x)(bF(U,x)(a))=bG(U,ηU(x))(a). This formula follows from the two band equivalences even before invoking the map-preservation property. -/
theorem autEquiv_band (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    autEquiv bF bG η x (bF.autEquiv U x a) = bG.autEquiv U _ a := by
  sorry

omit [BandPreserving bF bG η] in
/-- autEquiv(x) inverse applied to bG(U,ηU(x))(a) equals bF(U,x)(a). -/
theorem autEquiv_symm_band (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    (autEquiv bF bG η x).symm (bG.autEquiv U _ a) = bF.autEquiv U x a := by
  sorry

omit bG [IsGerbe G J] [BandPreserving bF bG η] in
/-- For the identity StrongTrans, preimageIso(p,q)=q for every actual source anchor p and actual q, using the identity band-preservation proof and the source inverse law. -/
theorem preimageIso_id (p q : x ≅ y) :
    preimageIso bF bF (Pseudofunctor.StrongTrans.id F) p q = q := by
  sorry

/-- For band-preserving η:F→G and θ:G→H, preimageIso for θ∘η at p equals preimageIso for η at p applied to preimageIso for θ at ηU.mapIso(p). Composition uses the actual native StrongTrans and functor mapIso, with no surrogate transformation carrier. -/
theorem preimageIso_comp (bH : AbelianBanding H J A)
    (θ : Pseudofunctor.StrongTrans G H) [BandPreserving bG bH θ] (p : x ≅ y)
    (q : (θ.app (.mk (op U))).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (θ.app (.mk (op U))).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    preimageIso bF bH (Pseudofunctor.StrongTrans.vcomp η θ) p q =
      preimageIso bF bG η p
        (preimageIso bG bH θ ((η.app (.mk (op U))).toFunctor.mapIso p) q) := by
  sorry

/-- After choosing a local source isomorphism on the gerbe isomorphism cover, the actual target isomorphism map is an equivalence. -/
theorem locallyIsomEquiv (x y : F.obj (.mk (op U))) :
    ∃ R : Sieve U, R ∈ J U ∧ ∀ ⦃V : C⦄ (f : V ⟶ U), R f → Nonempty
      (((F.map f.op.toLoc).toFunctor.obj x ≅ (F.map f.op.toLoc).toFunctor.obj y) ≃
       ((η.app (.mk (op V))).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj x) ≅
        (η.app (.mk (op V))).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj y))) := by
  sorry

namespace Tests
-- BandedMorphism.Tests.inverseLeft
/-- `TauCeti.AlgebraicGeometry.BandedMorphism.Tests.inverseLeft`: Applying the anchored inverse to the actual mapped source isomorphism recovers that source isomorphism. -/
example (p q : x ≅ y) : preimageIso bF bG η p
    ((η.app (.mk (op U))).toFunctor.mapIso q) = q := by
  sorry

-- BandedMorphism.Tests.inverseRight
/-- `TauCeti.AlgebraicGeometry.BandedMorphism.Tests.inverseRight`: Mapping the anchored inverse of an arbitrary actual target isomorphism recovers that target isomorphism. -/
example (p : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) :
    (η.app (.mk (op U))).toFunctor.mapIso (preimageIso bF bG η p q) = q := by
  sorry

-- BandedMorphism.Tests.independentAnchor
/-- `TauCeti.AlgebraicGeometry.BandedMorphism.Tests.independentAnchor`: Two actual source anchors give the same preimage of every target isomorphism. -/
example (p p' : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) :
    preimageIso bF bG η p q = preimageIso bF bG η p' q := by
  sorry

-- BandedMorphism.Tests.equivLeft
/-- `TauCeti.AlgebraicGeometry.BandedMorphism.Tests.equivLeft`: The native Isom equivalence has its left inverse law on every actual source isomorphism. -/
example (p q : x ≅ y) :
    (isomEquiv bF bG η p).symm (isomEquiv bF bG η p q) = q := by
  sorry

-- BandedMorphism.Tests.equivRight
/-- `TauCeti.AlgebraicGeometry.BandedMorphism.Tests.equivRight`: The native Isom equivalence has its right inverse law on every actual target isomorphism. -/
example (p : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) :
    isomEquiv bF bG η p ((isomEquiv bF bG η p).symm q) = q := by
  sorry

-- BandedMorphism.Tests.equivUsesMap
/-- `TauCeti.AlgebraicGeometry.BandedMorphism.Tests.equivUsesMap`: The forward equivalence is the actual fibre functor mapIso, rather than an arbitrary bijection. -/
example (p q : x ≅ y) : isomEquiv bF bG η p q =
    (η.app (.mk (op U))).toFunctor.mapIso q := by
  sorry

omit [BandPreserving bF bG η] in
-- BandedMorphism.Tests.autLeft
/-- `TauCeti.AlgebraicGeometry.BandedMorphism.Tests.autLeft`: The native group equivalence has its left inverse law on every actual source automorphism. -/
example (x : F.obj (.mk (op U))) (a : Aut x) :
    (autEquiv bF bG η x).symm (autEquiv bF bG η x a) = a := by
  sorry

omit [BandPreserving bF bG η] in
-- BandedMorphism.Tests.autRight
/-- `TauCeti.AlgebraicGeometry.BandedMorphism.Tests.autRight`: The native group equivalence has its right inverse law on every actual target automorphism. -/
example (x : F.obj (.mk (op U))) (a : Aut ((η.app (.mk (op U))).toFunctor.obj x)) :
    autEquiv bF bG η x ((autEquiv bF bG η x).symm a) = a := by
  sorry

-- BandedMorphism.Tests.autUsesMap
/-- `TauCeti.AlgebraicGeometry.BandedMorphism.Tests.autUsesMap`: The forward group equivalence is the actual fibre functor mapAut. -/
example (x : F.obj (.mk (op U))) (a : Aut x) : autEquiv bF bG η x a =
    (η.app (.mk (op U))).toFunctor.mapAut x a := by
  sorry

-- BandedMorphism.Tests.nonzeroRetained
/-- `TauCeti.AlgebraicGeometry.BandedMorphism.Tests.nonzeroRetained`: A band coefficient other than multiplicative one cannot map to the identity automorphism. -/
example (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) (ha : a ≠ 1) :
    (η.app (.mk (op U))).toFunctor.mapAut x (bF.autEquiv U x a) ≠ 1 := by
  sorry

-- BandedMorphism.Tests.preservesAction
/-- `TauCeti.AlgebraicGeometry.BandedMorphism.Tests.preservesAction`: Mapping an acted isomorphism keeps exactly the same fixed-band coefficient. -/
example (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    (η.app (.mk (op U))).toFunctor.mapIso (BandedIsom.act F J A bF p a) =
      BandedIsom.act G J A bG ((η.app (.mk (op U))).toFunctor.mapIso p) a := by
  sorry

-- BandedMorphism.Tests.preservesDifference
/-- `TauCeti.AlgebraicGeometry.BandedMorphism.Tests.preservesDifference`: The source and target difference coefficients agree exactly. -/
example (p q : x ≅ y) :
    BandedIsom.difference G J A bG ((η.app (.mk (op U))).toFunctor.mapIso p)
      ((η.app (.mk (op U))).toFunctor.mapIso q) =
      BandedIsom.difference F J A bF p q := by
  sorry

-- BandedMorphism.Tests.separatesArrows
/-- `TauCeti.AlgebraicGeometry.BandedMorphism.Tests.separatesArrows`: Two actual fibre arrows with equal images are equal, without a global anchor assumption. -/
example (p q : x ⟶ y) (h : (η.app (.mk (op U))).toFunctor.map p =
    (η.app (.mk (op U))).toFunctor.map q) : p = q := by
  sorry

omit bF bG [IsGerbe F J] [IsGerbe G J] [BandPreserving bF bG η] in
-- BandedMorphism.Tests.emptySourceNotFilled
/-- `TauCeti.AlgebraicGeometry.BandedMorphism.Tests.emptySourceNotFilled`: An empty global source Isom type supplies no actual anchor for the surjectivity construction. -/
example (h : IsEmpty (x ≅ y)) :
    ¬ ∃ _p : x ≅ y, Function.Surjective
      ((η.app (.mk (op U))).toFunctor.mapIso : (x ≅ y) → _) := by
  sorry

omit [BandPreserving bF bG η] in
-- BandedMorphism.Tests.changedCoefficientRejected
/-- `TauCeti.AlgebraicGeometry.BandedMorphism.Tests.changedCoefficientRejected`: If the actual fibre map sends bF(a) to bG(a′) with a≠a′, that transformation cannot be band-preserving. This rejects inversion at a non-two-torsion coefficient. -/
example (x : F.obj (.mk (op U)))
    (a a' : Multiplicative (A.obj.obj (op U))) (h : a ≠ a')
    (bad : (η.app (.mk (op U))).toFunctor.mapAut x (bF.autEquiv U x a) = bG.autEquiv U _ a') :
    ¬ BandPreserving bF bG η := by
  sorry

end Tests

end BandedMorphism

namespace GerbeMorphismPullback
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

/-- The component agrees exactly with Cat.Hom.toNatIso(η.naturality(f)).app(x). -/
theorem comparison_native : comparison η f x =
    (Cat.Hom.toNatIso (η.naturality f.op.toLoc)).app x := by sorry

/-- The inverse comparison followed by its forward comparison is the identity arrow. -/
theorem comparison_inv_hom_id :
    (comparison η f x).inv ≫ (comparison η f x).hom = 𝟙 _ := by sorry

/-- Apply the component functor to a restricted isomorphism and conjugate both endpoints through the strong-transformation comparison. -/
def mapIso (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y) := by sorry

/-- On each slice, map an actual arrow by the component functor and transport its source and target through the strong-transformation comparison. -/
def homMap (p : (F.map f.op.toLoc).toFunctor.obj x ⟶
    (F.map f.op.toLoc).toFunctor.obj y) :
    (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ⟶
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y) := by sorry

/-- For actual local p:F(f)x≅F(f)y, the hom arrow of M_f(p) is exactly h_f(p.hom), including both strong-naturality comparison components. -/
theorem mapIso_hom (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    (mapIso η f x y p).hom = homMap η f x y p.hom := by sorry

/-- For any global actual arrow p:x→y, h_f(F(f).map(p))=G(f).map(ηU.map(p)). This is naturality of the native strong-naturality isomorphism at p; it does not prove compatibility along arbitrary deeper slice arrows. -/
theorem homMap_restrict (p : x ⟶ y) :
    homMap η f x y ((F.map f.op.toLoc).toFunctor.map p) =
      (G.map f.op.toLoc).toFunctor.map ((η.app (.mk (op U))).toFunctor.map p) := by sorry

/-- For every actual global p:x≅y, M_f(F(f).mapIso(p))=G(f).mapIso(ηU.mapIso(p)). The equality is between actual isomorphisms, not classes. -/
theorem mapIso_restrict (p : x ≅ y) :
    mapIso η f x y ((F.map f.op.toLoc).toFunctor.mapIso p) =
      (G.map f.op.toLoc).toFunctor.mapIso ((η.app (.mk (op U))).toFunctor.mapIso p) := by sorry

variable {J : GrothendieckTopology C} [IsGerbe F J] [IsGerbe G J]
variable {A : Sheaf J AddCommGrpCat.{v'}}
variable (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
variable [BandPreserving bF bG η]

/-- Conjugation by c_f(x) preserves the specified target-band coefficient. -/
theorem comparison_band (a : Multiplicative (A.obj.obj (op V))) :
    Aut.autMulEquivOfIso (comparison η f x)
      (bG.autEquiv V ((η.app (.mk (op V))).toFunctor.obj
        ((F.map f.op.toLoc).toFunctor.obj x)) a) =
      bG.autEquiv V ((G.map f.op.toLoc).toFunctor.obj
        ((η.app (.mk (op U))).toFunctor.obj x)) a := by sorry

include bF bG

/-- The strong-transformation map on restricted isomorphisms is injective under band preservation. -/
theorem mapIso_injective : Function.Injective (mapIso η f x y) := by sorry

/-- For fixed-band η, h_f is injective on the actual native Hom carrier for every f,x,y, without an anchor. -/
theorem homMap_injective : Function.Injective (homMap η f x y) := by sorry

/-- For fixed-band η, actual local p:F(f)x≅F(f)y and a∈A(V), M_f(actF(p,a))=actG(M_f(p),a). The coefficient is unchanged in A(V), even when c_f(y) is not an identity. -/
theorem mapIso_act (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) (a : Multiplicative (A.obj.obj (op V))) :
    mapIso η f x y (BandedIsom.act F J A bF p a) =
      BandedIsom.act G J A bG (mapIso η f x y p) a := by sorry

/-- The map on restricted isomorphisms retains their band difference. -/
theorem mapIso_difference (p q : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    BandedIsom.difference G J A bG (mapIso η f x y p) (mapIso η f x y q) =
      BandedIsom.difference F J A bF p q := by sorry

/-- A local source anchor is retained as explicit data. -/
def preimageIso (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    (F.map f.op.toLoc).toFunctor.obj x ≅ (F.map f.op.toLoc).toFunctor.obj y := by sorry

/-- For fixed-band η and an actual local anchor p, M_f(P_f(p,q))=q for every actual target q. -/
theorem map_preimageIso (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    mapIso η f x y (preimageIso η f x y bF bG p q) = q := by sorry

/-- For fixed-band η and actual local p,q, P_f(p,M_f(q))=q. -/
theorem preimageIso_map (p q : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    preimageIso η f x y bF bG p (mapIso η f x y q) = q := by sorry

/-- For actual local anchors p,p′ and any actual target q, P_f(p,q)=P_f(p′,q) when η preserves the fixed band. This compares supplied anchors and never chooses a global one. -/
theorem preimageIso_anchor (p p' : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    preimageIso η f x y bF bG p q = preimageIso η f x y bF bG p' q := by sorry

/-- The inverse isomorphism map intertwines the same band action, rather than its inverse coefficient. -/
theorem preimageIso_act (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y))
    (a : Multiplicative (A.obj.obj (op V))) :
    preimageIso η f x y bF bG p (BandedIsom.act G J A bG q a) =
      BandedIsom.act F J A bF (preimageIso η f x y bF bG p q) a := by sorry

/-- For actual global p:x≅y and actual target q:ηUx≅ηUy, P_f(F(f)p,G(f)q)=F(f)(BandedMorphism.preimageIso(p,q)). No global p is inferred from the gerbe axioms. -/
theorem preimageIso_restrict (p : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) :
    preimageIso η f x y bF bG ((F.map f.op.toLoc).toFunctor.mapIso p)
      ((G.map f.op.toLoc).toFunctor.mapIso q) =
      (F.map f.op.toLoc).toFunctor.mapIso (BandedMorphism.preimageIso bF bG η p q) := by sorry

/-- On a restricted fibre, band preservation gives the isomorphism-set equivalence whose forward map includes the strong-transformation comparison at both endpoints. -/
def isomEquiv (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    [BandPreserving bF bG η] (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    ((F.map f.op.toLoc).toFunctor.obj x ≅ (F.map f.op.toLoc).toFunctor.obj y) ≃
      ((G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
        (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) := by sorry

/-- E_f(p)(q)=M_f(q) for every actual local anchor p and local isomorphism q. -/
theorem isomEquiv_apply (p q : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    isomEquiv η f x y bF bG p q = mapIso η f x y q := by sorry

/-- E_f(p)⁻¹(q)=P_f(p,q) for every actual target isomorphism q. -/
theorem isomEquiv_symm_apply (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    (isomEquiv η f x y bF bG p).symm q = preimageIso η f x y bF bG p q := by sorry

/-- For any actual local anchors p,p′, E_f(p)=E_f(p′) as Equiv values, since both forward maps are exactly M_f. -/
theorem isomEquiv_anchor (p p' : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    isomEquiv η f x y bF bG p = isomEquiv η f x y bF bG p' := by sorry

/-- For fixed-band η and actual local p:F(f)x≅F(f)y, h_f is surjective on the actual Hom carrier. The target arrows are invertible by IsGerbe(G,J), so the transported Isom inverse provides their actual preimage hom arrows. -/
theorem homMap_surjective_of_anchor (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) : Function.Surjective (homMap η f x y) := by sorry

/-- The covering sieve comes from the gerbe, with no global anchor chosen. -/
theorem locallyIsomEquiv : ∃ R : Sieve U, R ∈ J U ∧ ∀ ⦃V : C⦄ (f : V ⟶ U), R f →
    Nonempty (((F.map f.op.toLoc).toFunctor.obj x ≅ (F.map f.op.toLoc).toFunctor.obj y) ≃
      ((G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
        (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y))) := by sorry

end GerbeMorphismPullback

namespace GerbeMorphismPullback.Tests
open CategoryTheory Opposite Bicategory
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
variable {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
variable (η : Pseudofunctor.StrongTrans F G)
variable {U V : C} (f : V ⟶ U) (x y : F.obj (.mk (op U)))

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.nativeComparison
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.nativeComparison`: The component agrees exactly with Cat.Hom.toNatIso(η.naturality(f)).app(x). -/
example : comparison η f x =
    (Cat.Hom.toNatIso (η.naturality f.op.toLoc)).app x := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.zeroComparison
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.zeroComparison`: The inverse comparison followed by its forward comparison is the identity arrow. -/
example :
    (comparison η f x).inv ≫ (comparison η f x).hom = 𝟙 _ := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.reflexiveImage
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.reflexiveImage`: The image of the actual identity isomorphism is the identity at G(f)(ηUx). -/
example : mapIso η f x x (Iso.refl _) = Iso.refl _ := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.actualHomImage
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.actualHomImage`: The hom arrow of the transported Isom image equals the transported Hom image. -/
example (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    (mapIso η f x y p).hom = homMap η f x y p.hom := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.globalIsoRestriction
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.globalIsoRestriction`: For global actual p:x≅y, M_f(F(f)p)=G(f)(ηU(p)). -/
example (p : x ≅ y) :
    mapIso η f x y ((F.map f.op.toLoc).toFunctor.mapIso p) =
      (G.map f.op.toLoc).toFunctor.mapIso ((η.app (.mk (op U))).toFunctor.mapIso p) := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.sliceHomCarrier
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.sliceHomCarrier`: On the point-site
cyclic group of order three, the transported Hom map preserves the nonidentity generator.
This computes an actual arrow and excludes a constant-identity Hom map. -/
example :
    let F := BandFixtures.constantDiagram (Discrete PUnit) (SingleObj (Multiplicative (ZMod 3)))
    let U : Discrete PUnit := Discrete.mk PUnit.unit
    let x : F.obj (.mk (op U)) := SingleObj.star (Multiplicative (ZMod 3))
    let a : x ⟶ x := Multiplicative.ofAdd (1 : ZMod 3)
    homMap (Pseudofunctor.StrongTrans.id F) (𝟙 U) x x a = a ∧ a ≠ 𝟙 x := by sorry

/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.identityHomImage`: The actual identity arrow maps to the actual target identity arrow. -/
example : homMap η f x x (𝟙 _) = 𝟙 _ := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.globalHomRestriction
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.globalHomRestriction`: For a global actual arrow p:x→y, h_f(F(f)p)=G(f)(ηU(p)). -/
example (p : x ⟶ y) :
    homMap η f x y ((F.map f.op.toLoc).toFunctor.map p) =
      (G.map f.op.toLoc).toFunctor.map ((η.app (.mk (op U))).toFunctor.map p) := by sorry

variable {J : GrothendieckTopology C} [IsGerbe F J] [IsGerbe G J]
variable {A : Sheaf J AddCommGrpCat.{v'}}
variable (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
variable [BandPreserving bF bG η]

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.comparisonBand
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.comparisonBand`: Conjugation by c_f(x) preserves the specified target-band coefficient. -/
example (a : Multiplicative (A.obj.obj (op V))) :
    Aut.autMulEquivOfIso (comparison η f x)
      (bG.autEquiv V ((η.app (.mk (op V))).toFunctor.obj
        ((F.map f.op.toLoc).toFunctor.obj x)) a) =
      bG.autEquiv V ((G.map f.op.toLoc).toFunctor.obj
        ((η.app (.mk (op U))).toFunctor.obj x)) a := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.targetRoundTrip
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.targetRoundTrip`: Mapping P_f(p,q) returns the supplied actual target q. -/
example (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    mapIso η f x y (preimageIso η f x y bF bG p q) = q := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.anchorRecovered
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.anchorRecovered`: P_f(p,M_f(p)) returns exactly the supplied anchor p. -/
example (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    preimageIso η f x y bF bG p (mapIso η f x y p) = p := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.differentAnchors
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.differentAnchors`: Any two actual local anchors yield the same inverse on every target q. -/
example (p p' : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    preimageIso η f x y bF bG p q = preimageIso η f x y bF bG p' q := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.forwardOrientation
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.forwardOrientation`: The forward map uses c_f(x) inverse, the actual component mapIso, and c_f(y) forward. -/
example (p q : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    isomEquiv η f x y bF bG p q = (comparison η f x).symm ≪≫
      ((η.app (.mk (op V))).toFunctor.mapIso q ≪≫ comparison η f y) := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.reverseOrientation
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.reverseOrientation`: The inverse transports q using c_f(x) forward and c_f(y) inverse before the component preimage. -/
example (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    (isomEquiv η f x y bF bG p).symm q =
      BandedMorphism.preimageIso bF bG η p
        (comparison η f x ≪≫ (q ≪≫ (comparison η f y).symm)) := by sorry

-- TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.actedImage
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.actedImage`: The equivalence retains every coefficient of the actual A(V) action. -/
example (p q : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) (a : Multiplicative (A.obj.obj (op V))) :
    isomEquiv η f x y bF bG p (BandedIsom.act F J A bF q a) =
      BandedIsom.act G J A bG (isomEquiv η f x y bF bG p q) a := by sorry

end GerbeMorphismPullback.Tests

namespace GerbeMorphismPullback
open CategoryTheory Opposite Bicategory
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
variable {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
variable (η : Pseudofunctor.StrongTrans F G)
variable {U V W : C} (f : V ⟶ U) (g : W ⟶ V) (x y : F.obj (.mk (op U)))

/-- The strong-transformation restriction comparison for a composite arrow equals the two successive comparisons with both pseudofunctor composition isomorphisms. -/
theorem comparison_comp : comparison η (g ≫ f) x =
    (η.app (.mk (op W))).toFunctor.mapIso
      ((Cat.Hom.toNatIso (F.mapComp' f.op.toLoc g.op.toLoc (g ≫ f).op.toLoc)).app x) ≪≫
    comparison η g ((F.map f.op.toLoc).toFunctor.obj x) ≪≫
    (G.map g.op.toLoc).toFunctor.mapIso (comparison η f x) ≪≫
    ((Cat.Hom.toNatIso (G.mapComp' f.op.toLoc g.op.toLoc (g ≫ f).op.toLoc)).app
      ((η.app (.mk (op U))).toFunctor.obj x)).symm := by
  sorry

/-- Mapping a slice arrow through a strong transformation commutes with deeper restriction and its specified composite base arrow. -/
theorem homMap_pullHom (h : W ⟶ U) (hh : g ≫ f = h)
    (p : (F.map f.op.toLoc).toFunctor.obj x ⟶ (F.map f.op.toLoc).toFunctor.obj y) :
    homMap η h x y (pullHom p g h h hh hh) =
      pullHom (homMap η f x y p) g h h hh hh := by
  sorry

/-- Apply a strong transformation to slice arrows, transporting both endpoints by its restriction comparison, to obtain a natural map of Hom presheaves. -/
def homPresheafMap : F.presheafHom x y ⟶
    G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
      ((η.app (.mk (op U))).toFunctor.obj y) := by
  sorry

/-- At every T∈C/U, the new Hom-presheaf component sends p to the existing homMap η T.hom x y p. -/
theorem homPresheafMap_app (T : Over U) (p : (F.presheafHom x y).obj (op T)) :
    (homPresheafMap η x y).app (op T) p = homMap η T.hom x y p := by
  sorry

/-- For a:T₂→T₁ in C/U and any local section p, applying the source restriction then the Hom-presheaf map equals applying the map then the target restriction. -/
theorem homPresheafMap_naturality {T₁ T₂ : Over U} (a : T₂ ⟶ T₁)
    (p : (F.presheafHom x y).obj (op T₁)) :
    (homPresheafMap η x y).app (op T₂) ((F.presheafHom x y).map a.op p) =
      (G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
        ((η.app (.mk (op U))).toFunctor.obj y)).map a.op
          ((homPresheafMap η x y).app (op T₁) p) := by
  sorry

/-- At the identity slice object, the Hom-presheaf component takes F.presheafHomObjHomEquiv(p) to G.presheafHomObjHomEquiv(ηU.map(p)). -/
theorem homPresheafMap_identity (p : x ⟶ y) :
    (homPresheafMap η x y).app (op (Over.mk (𝟙 U)))
      (F.presheafHomObjHomEquiv p) =
        G.presheafHomObjHomEquiv ((η.app (.mk (op U))).toFunctor.map p) := by
  sorry

variable (J : GrothendieckTopology C)

/-- For prestacks, the natural slice Hom map is a morphism between the native Hom sheaves. -/
def homSheafMap [F.IsPrestack J] [G.IsPrestack J] :
    F.sheafHom J x y ⟶ G.sheafHom J
      ((η.app (.mk (op U))).toFunctor.obj x) ((η.app (.mk (op U))).toFunctor.obj y) := by
  sorry

/-- The underlying natural transformation of homSheafMap is exactly homPresheafMap. -/
theorem homSheafMap_hom [F.IsPrestack J] [G.IsPrestack J] :
    (homSheafMap η x y J).hom = homPresheafMap η x y := by
  sorry

variable [IsGerbe F J] [IsGerbe G J]
variable {A : Sheaf J AddCommGrpCat.{v'}}
variable (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
variable [BandPreserving bF bG η]
include bF bG

/-- For a fixed-band gerbe morphism, every component of homPresheafMap is injective, with no anchor assumption. -/
theorem homPresheafMap_injective (T : Over U) :
    Function.Injective ((homPresheafMap η x y).app (op T)) := by
  sorry

/-- For every T∈C/U and target Hom section s over T, the native Presheaf.imageSieve of homPresheafMap and s belongs to (J.over U)(T). -/
theorem homPresheafMap_imageSieve (T : Over U)
    (s : (G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
      ((η.app (.mk (op U))).toFunctor.obj y)).obj (op T)) :
    Presheaf.imageSieve (homPresheafMap η x y) s ∈ (J.over U) T := by
  sorry

/-- The actual homSheafMap is Sheaf.IsLocallySurjective on J.over U. -/
theorem homSheafMap_locallySurjective : Sheaf.IsLocallySurjective (homSheafMap η x y J) := by
  sorry

/-- The actual homSheafMap is Sheaf.IsLocallyInjective on J.over U. -/
theorem homSheafMap_locallyInjective : Sheaf.IsLocallyInjective (homSheafMap η x y J) := by
  sorry

/-- The actual homSheafMap has the native IsIso property. -/
theorem homSheafMap_isIso : IsIso (homSheafMap η x y J) := by
  sorry

/-- For gerbes with the same preserved abelian band, the native slice Hom map is an isomorphism of sheaves, without a chosen global isomorphism of endpoints. -/
def homSheafIso (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    [BandPreserving bF bG η] :
    F.sheafHom J x y ≅ G.sheafHom J
      ((η.app (.mk (op U))).toFunctor.obj x) ((η.app (.mk (op U))).toFunctor.obj y) := by
  sorry

/-- The hom of homSheafIso is homSheafMap exactly. -/
theorem homSheafIso_hom : (homSheafIso η x y J bF bG).hom = homSheafMap η x y J := by
  sorry

/-- At T, whenever an actual source anchor p and target isomorphism q are supplied, the inverse Hom-sheaf component sends q.hom to the hom of the existing preimageIso η T.hom x y bF bG p q. -/
theorem homSheafIso_inverse_anchor (T : Over U)
    (p : (F.map T.hom.op.toLoc).toFunctor.obj x ≅ (F.map T.hom.op.toLoc).toFunctor.obj y)
    (q : (G.map T.hom.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map T.hom.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    (homSheafIso η x y J bF bG).inv.hom.app (op T) q.hom =
      (preimageIso η T.hom x y bF bG p q).hom := by
  sorry

/-- The inverse Hom-sheaf component commutes with the native restrictions along every arrow of C/U, for every target local section. -/
theorem homSheafIso_inverse_restrict {T₁ T₂ : Over U} (a : T₂ ⟶ T₁)
    (q : (G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
      ((η.app (.mk (op U))).toFunctor.obj y)).obj (op T₁)) :
    (F.presheafHom x y).map a.op ((homSheafIso η x y J bF bG).inv.hom.app (op T₁) q) =
      (homSheafIso η x y J bF bG).inv.hom.app (op T₂)
        ((G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
          ((η.app (.mk (op U))).toFunctor.obj y)).map a.op q) := by
  sorry

/-- For every x,y∈F(U), the actual function ηU.map:(x→y)→(ηUx→ηUy) is bijective, without a global anchor hypothesis. -/
theorem fibreHom_bijective : Function.Bijective
    ((η.app (.mk (op U))).toFunctor.map : (x ⟶ y) → _) := by
  sorry

end GerbeMorphismPullback

namespace BandedMorphism
open CategoryTheory Opposite Bicategory
variable {C : Type u} [Category.{v} C]
variable {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
variable {J : GrothendieckTopology C} [IsGerbe F J] [IsGerbe G J]
variable {A : Sheaf J AddCommGrpCat.{v'}}
/-- A band-preserving morphism of gerbes is full in each fibre, using local anchors and Hom-sheaf descent. -/
theorem full (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] (U : C) :
    (η.app (.mk (op U))).toFunctor.Full := by
  sorry
end BandedMorphism

namespace GerbeMorphismPullback.Tests
open CategoryTheory Opposite Bicategory
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
variable {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
variable (η : Pseudofunctor.StrongTrans F G)
variable {U V W : C} (x y : F.obj (.mk (op U)))

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.presheafIdentity
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.presheafIdentity`: The identity StrongTrans induces exactly the identity of the native Hom presheaf. -/
example : homPresheafMap (Pseudofunctor.StrongTrans.id F) x y = 𝟙 (F.presheafHom x y) := by
  sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.deeperArrow
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.deeperArrow`: For an arbitrary local p and composable f,g, h_(g∘f) of pullHom_F(p) equals pullHom_G(h_f(p)); p need not descend from a global arrow. -/
example (f : V ⟶ U) (g : W ⟶ V)
    (p : (F.map f.op.toLoc).toFunctor.obj x ⟶ (F.map f.op.toLoc).toFunctor.obj y) :
    homMap η (g ≫ f) x y (pullHom p g (g ≫ f) (g ≫ f)) =
      pullHom (homMap η f x y p) g (g ≫ f) (g ≫ f) := by
  sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.identitySlice
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.identitySlice`: At id U, the map agrees with the actual fibre functor through the two native presheafHomObjHomEquiv maps. -/
example (p : x ⟶ y) :
    (homPresheafMap η x y).app (op (Over.mk (𝟙 U))) (F.presheafHomObjHomEquiv p) =
      G.presheafHomObjHomEquiv ((η.app (.mk (op U))).toFunctor.map p) := by
  sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.pointNonzero
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.pointNonzero`: On the one-point constant SingleObj(Multiplicative(Z/2Z)) fixture, the identity transformation preserves the actual nonidentity arrow represented by additive 1. -/
example :
    let F := BandFixtures.constantDiagram (Discrete PUnit) (SingleObj (Multiplicative (ZMod 2)))
    let U : Discrete PUnit := Discrete.mk PUnit.unit
    let x : F.obj (.mk (op U)) := SingleObj.star (Multiplicative (ZMod 2))
    let a : (F.presheafHom x x).obj (op (Over.mk (𝟙 U))) := Multiplicative.ofAdd (1 : ZMod 2)
    (homPresheafMap (Pseudofunctor.StrongTrans.id F) x x).app (op (Over.mk (𝟙 U))) a = a := by
  sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.bandHypothesisNeeded
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.bandHypothesisNeeded`: The constant-unit monoid endomorphism of Multiplicative(Z/2Z) induces a one-object functor that is not Full. A morphism of underlying groupoids without the band condition need not have the claimed conclusion. -/
example : ¬ (1 : Multiplicative (ZMod 2) →* Multiplicative (ZMod 2)).toFunctor.Full := by
  sorry

variable (J : GrothendieckTopology C) [IsGerbe F J] [IsGerbe G J]
variable {A : Sheaf J AddCommGrpCat.{v'}}
variable (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
variable [BandPreserving bF bG η]

include bF bG

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.nativeSheafMap
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.nativeSheafMap`: Forgetting the new Hom-sheaf morphism gives exactly the constructed natural transformation between the existing native Hom presheaves. -/
example : (homSheafMap η x y J).hom = homPresheafMap η x y := by
  sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.separatesLocalArrows
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.separatesLocalArrows`: Two arbitrary local source arrows with equal images under the actual Hom-sheaf map are equal. -/
example (T : Over U) (p q : (F.presheafHom x y).obj (op T))
    (h : (homSheafMap η x y J).hom.app (op T) p =
      (homSheafMap η x y J).hom.app (op T) q) : p = q := by
  sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.noGlobalAnchor
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.noGlobalAnchor`: If the actual source Hom type x→y is empty, the target Hom type ηUx→ηUy is empty. The theorem does not smuggle in a global source anchor. -/
example (h : IsEmpty (x ⟶ y)) :
    IsEmpty ((η.app (.mk (op U))).toFunctor.obj x ⟶ (η.app (.mk (op U))).toFunctor.obj y) := by
  sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.inverseRoundtrip
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.inverseRoundtrip`: The inverse Hom-sheaf component applied after the forward component returns every actual local source arrow. -/
example (T : Over U) (p : (F.presheafHom x y).obj (op T)) :
    (homSheafIso η x y J bF bG).inv.hom.app (op T)
      ((homSheafMap η x y J).hom.app (op T) p) = p := by
  sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.forwardRoundtrip
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.forwardRoundtrip`: The forward component applied after the inverse returns every actual local target arrow. -/
example (T : Over U)
    (q : (G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
      ((η.app (.mk (op U))).toFunctor.obj y)).obj (op T)) :
    (homSheafMap η x y J).hom.app (op T)
      ((homSheafIso η x y J bF bG).inv.hom.app (op T) q) = q := by
  sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.arbitraryInverseRestriction
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.arbitraryInverseRestriction`: For every slice arrow and arbitrary target section, the inverse commutes with the actual native restriction, with no supplied global arrow or anchor. -/
example {T₁ T₂ : Over U} (a : T₂ ⟶ T₁)
    (q : (G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
      ((η.app (.mk (op U))).toFunctor.obj y)).obj (op T₁)) :
    (F.presheafHom x y).map a.op ((homSheafIso η x y J bF bG).inv.hom.app (op T₁) q) =
      (homSheafIso η x y J bF bG).inv.hom.app (op T₂)
        ((G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
          ((η.app (.mk (op U))).toFunctor.obj y)).map a.op q) := by
  sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismPullback.Tests.inverseBandCoordinate
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.inverseBandCoordinate`: On the identity slice, the inverse returns the source automorphism with precisely the supplied band coordinate a from the target automorphism with that coordinate. -/
example (a : Multiplicative (A.obj.obj (op U))) :
    (homSheafIso η x x J bF bG).inv.hom.app (op (Over.mk (𝟙 U)))
      (G.presheafHomObjHomEquiv (bG.autEquiv U ((η.app (.mk (op U))).toFunctor.obj x) a).hom) =
        F.presheafHomObjHomEquiv (bF.autEquiv U x a).hom := by
  sorry

end GerbeMorphismPullback.Tests

namespace GerbeMorphismDescent
open CategoryTheory Opposite Bicategory
open Pseudofunctor.LocallyDiscreteOpToCat
open GerbeMorphismPullback
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
variable {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
variable {J : GrothendieckTopology C} [hF : IsGerbe F J] [hG : IsGerbe G J]
variable {A : Sheaf J AddCommGrpCat.{v'}}

/-- A band-preserving morphism of gerbes is fully faithful in each fibre: recover arrows locally through the band and glue them by Hom-sheaf descent. -/
def componentFullyFaithful (bF : AbelianBanding F J A)
    (bG : AbelianBanding G J A) (η : Pseudofunctor.StrongTrans F G)
    [BandPreserving bF bG η] (U : C) :
    (η.app (.mk (op U))).toFunctor.FullyFaithful := by sorry

/-- Mapping componentFullyFaithful.preimage(p) by ηU gives p for every arrow between actual image objects. -/
theorem componentFullyFaithful_map_preimage (bF : AbelianBanding F J A)
    (bG : AbelianBanding G J A) (η : Pseudofunctor.StrongTrans F G)
    [BandPreserving bF bG η] (U : C) {x y : F.obj (.mk (op U))}
    (p : (η.app (.mk (op U))).toFunctor.obj x ⟶
      (η.app (.mk (op U))).toFunctor.obj y) :
    (η.app (.mk (op U))).toFunctor.map
      ((componentFullyFaithful bF bG η U).preimage p) = p := by sorry

/-- The sieve of arrows along which a target object is isomorphic to the image of a source object. -/
def localImageSieve (η : Pseudofunctor.StrongTrans F G) {U : C}
    (z : G.obj (.mk (op U))) : Sieve U := by sorry

/-- Membership f∈Lz is equivalent to existence of x in F(V) and Nonempty(ηV(x)≅G(f)z). -/
theorem localImageSieve_mem (η : Pseudofunctor.StrongTrans F G) {U V : C}
    (z : G.obj (.mk (op U))) (f : V ⟶ U) :
    localImageSieve η z f ↔ ∃ x : F.obj (.mk (op V)),
      Nonempty ((η.app (.mk (op V))).toFunctor.obj x ≅
        (G.map f.op.toLoc).toFunctor.obj z) := by sorry

/-- For two gerbes on the specified arbitrary site, Lz belongs to J(U); band preservation is not needed for this local existence step. -/
theorem localImageSieve_covering (η : Pseudofunctor.StrongTrans F G) {U : C}
    (z : G.obj (.mk (op U))) : localImageSieve η z ∈ J U := by sorry

/-- The identity of U belongs to Lz exactly when there is y in F(U) with an actual isomorphism ηU(y)≅z. -/
theorem localImageSieve_identity (η : Pseudofunctor.StrongTrans F G) {U : C}
    (z : G.obj (.mk (op U))) : localImageSieve η z (𝟙 U) ↔
      ∃ x : F.obj (.mk (op U)),
        Nonempty ((η.app (.mk (op U))).toFunctor.obj x ≅ z) := by sorry

variable {ι : Type t} {U : C} {X : ι → C}

/-- Transport the common target object between two local image identifications, including both pseudofunctor restriction comparisons. -/
def targetOverlapIso (η : Pseudofunctor.StrongTrans F G)
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    (η.app (.mk (op Y))).toFunctor.obj ((F.map a.op.toLoc).toFunctor.obj (x i)) ≅
      (η.app (.mk (op Y))).toFunctor.obj ((F.map b.op.toLoc).toFunctor.obj (x j)) := by sorry

/-- The target overlap is c_a(x_i), then G(a)(e_i), then the native ofObj(z) overlap, then G(b)(e_j) inverse, then c_b(x_j) inverse. -/
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

/-- For i=j and a=b the targetOverlapIso is the native identity isomorphism. -/
theorem targetOverlapIso_self (η : Pseudofunctor.StrongTrans F G)
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i : ι} (a : Y ⟶ X i) (ha : a ≫ f i = q) :
    targetOverlapIso η f x z e q a a ha ha = Iso.refl _ := by sorry

/-- For three local indices i,j,k and maps a,b,c over the same q, the i-to-j overlap followed by the j-to-k overlap equals the i-to-k overlap. -/
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

/-- Use full faithfulness to lift the target overlap isomorphism uniquely to the source fibre. -/
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

/-- ηY.mapIso of the lifted overlap equals the specified target overlap as an actual native isomorphism. -/
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

/-- The lifted overlap from a local object to itself along the same base arrow is the identity isomorphism. -/
theorem liftedOverlapIso_self (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i : ι} (a : Y ⟶ X i) (ha : a ≫ f i = q) :
    liftedOverlapIso bF bG η f x z e q a a ha ha = Iso.refl _ := by sorry

/-- The i-to-j lifted overlap followed by the j-to-k lifted overlap is the i-to-k lifted overlap on every common test object. -/
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

/-- For g:Y′→Y, q′=g≫q and specified ga=g≫a, gb=g≫b, native pullHom_F of the lifted overlap equals the lifted overlap at q′,ga,gb, with all base equalities retained. -/
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

/-- The object field of liftedDescentData at i is x_i. -/
theorem liftedDescentData_obj (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z) (i : ι) :
    (liftedDescentData bF bG η f x z e).obj i = x i := by sorry

/-- For every common test object and pair of indices, the hom field is the forward arrow of the specified liftedOverlapIso. -/
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

/-- The image of a global source gluing object is identified with the target locally by the gluing isomorphism and the strong-transformation comparison. -/
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

/-- The forward arrow of imageLocalIso at i is c_(f_i)(y) inverse, followed by η_i.map(r.hom.hom(i)), followed by e_i.hom. -/
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

/-- The imageLocalIso components satisfy the exact DescentData.isoMk comm equation between the target ofObj data of ηU y and z on every common test object. -/
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

/-- Glue the compatible local image isomorphisms over a covering sieve using the target Hom sheaf. -/
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

/-- Restricting globalImageIso.hom by G(f_i) gives imageLocalIso.hom at every chart i. -/
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

/-- Any p:ηU y≅z whose forward restrictions agree with all the imageLocalIso components equals globalImageIso. -/
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

/-- Every target object has a global source preimage up to isomorphism under a band-preserving gerbe morphism. -/
theorem global_preimage (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (U : C) (z : G.obj (.mk (op U))) :
    ∃ y : F.obj (.mk (op U)),
      Nonempty ((η.app (.mk (op U))).toFunctor.obj y ≅ z) := by sorry

/-- Each component functor of a band-preserving gerbe morphism is essentially surjective. -/
theorem componentEssSurj (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] (U : C) :
    (η.app (.mk (op U))).toFunctor.EssSurj := by sorry

/-- Each component functor of a band-preserving gerbe morphism is an equivalence. -/
theorem componentIsEquivalence (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] (U : C) :
    (η.app (.mk (op U))).toFunctor.IsEquivalence := by sorry

/-- The native inverse recovers every source arrow from its ηU image. -/
theorem componentFullyFaithful_preimage_map (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (U : C) {x y : F.obj (.mk (op U))} (p : x ⟶ y) :
    (componentFullyFaithful bF bG η U).preimage
      ((η.app (.mk (op U))).toFunctor.map p) = p := by sorry

/-- The inverse arrow is e_i inverse, then η_i applied to the inverse gluing component, then the forward strong comparison. -/
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

/-- Equality of images of any two actual source arrows reflects their equality. -/
theorem componentFullyFaithful_map_injective
    (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (U : C) {x y : F.obj (.mk (op U))} (p q : x ⟶ y)
    (hpq : (η.app (.mk (op U))).toFunctor.map p =
      (η.app (.mk (op U))).toFunctor.map q) : p = q := by sorry

/-- The actual native descent-data hom field commutes with every deeper pullHom, with all base equality witnesses retained. -/
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
/-- Restricting the inverse global image arrow gives the inverse local image arrow at every chart. -/
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
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.arrowRoundTrip`: Every arbitrary arrow between image objects is recovered by mapping the native preimage. -/
example (bF : AbelianBanding F J A)
    (bG : AbelianBanding G J A) (η : Pseudofunctor.StrongTrans F G)
    [BandPreserving bF bG η] (U : C) {x y : F.obj (.mk (op U))}
    (p : (η.app (.mk (op U))).toFunctor.obj x ⟶
      (η.app (.mk (op U))).toFunctor.obj y) :
    (η.app (.mk (op U))).toFunctor.map
      ((componentFullyFaithful bF bG η U).preimage p) = p := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.sourceRoundTrip
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.sourceRoundTrip`: For any source arrow p, preimage of ηU.map(p) is p; a constant inverse on Hom types fails this test. -/
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (U : C) {x y : F.obj (.mk (op U))} (p : x ⟶ y) :
    (componentFullyFaithful bF bG η U).preimage
      ((η.app (.mk (op U))).toFunctor.map p) = p := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.nonidentityAutomorphism
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.nonidentityAutomorphism`: A nonidentity source endomorphism remains nonidentity under ηU; forgetting a nontrivial stabilizer fails this test. -/
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (U : C) (x : F.obj (.mk (op U))) (p : x ⟶ x) (hp : p ≠ 𝟙 x) :
    (η.app (.mk (op U))).toFunctor.map p ≠ 𝟙 _ := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.membershipData
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.membershipData`: At every base arrow, membership retains both a source object and an actual target isomorphism. -/
example (η : Pseudofunctor.StrongTrans F G) {U V : C}
    (z : G.obj (.mk (op U))) (f : V ⟶ U) :
    localImageSieve η z f ↔ ∃ x : F.obj (.mk (op V)),
      Nonempty ((η.app (.mk (op V))).toFunctor.obj x ≅
        (G.map f.op.toLoc).toFunctor.obj z) := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.deeperImage
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.deeperImage`: A local-image arrow stays in the native sieve after every precomposition, including arrows not selected in the initial cover. -/
example (η : Pseudofunctor.StrongTrans F G) {U V W : C}
    (z : G.obj (.mk (op U))) (f : V ⟶ U) (g : W ⟶ V)
    (hf : localImageSieve η z f) : localImageSieve η z (g ≫ f) := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.identityImage
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.identityImage`: Membership of id U is a global object-and-isomorphism witness through G.mapId; being covering alone is not used. -/
example (η : Pseudofunctor.StrongTrans F G) {U : C}
    (z : G.obj (.mk (op U))) : localImageSieve η z (𝟙 U) ↔
      ∃ x : F.obj (.mk (op U)),
        Nonempty ((η.app (.mk (op U))).toFunctor.obj x ≅ z) := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.selfOverlap
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.selfOverlap`: For the same local index and base arrow, the complete five-factor target comparison cancels to the identity. -/
example (η : Pseudofunctor.StrongTrans F G)
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i : ι} (a : Y ⟶ X i) (ha : a ≫ f i = q) :
    targetOverlapIso η f x z e q a a ha ha = Iso.refl _ := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.tripleOverlap
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.tripleOverlap`: Three distinct local lifts over a common test object satisfy the ordered target cocycle. -/
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
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.reverseTargetOverlap`: Interchanging the two local lifts reverses the complete target overlap isomorphism. -/
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
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.liftedImage`: Mapping the chosen lifted isomorphism gives the entire target overlap with both comparisons present. -/
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
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.reflectedCocycle`: The lifted overlap satisfies the actual triple cocycle; lifting arrows independently without faithfulness fails this test. -/
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
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.reverseLiftedOverlap`: Interchanging source local indices gives the inverse lifted isomorphism, not another arbitrary preimage. -/
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
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.retainedLocalObject`: Every object field of the native descent datum is the supplied x_i, so discarding the local objects fails. -/
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z) (i : ι) :
    (liftedDescentData bF bG η f x z e).obj i = x i := by sorry

-- test: TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GerbeMorphismDescent.Tests.retainedLocalArrow
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.retainedLocalArrow`: Every overlap morphism is the specified lifted forward arrow, with all base equality witnesses retained. -/
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
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.varyingBaseDescent`: The lifted datum obeys native pullHom under an arbitrary deeper base arrow; a record with only the identity and triple-cocycle laws fails. -/
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
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.forwardGluingImage`: The local image starts with the inverse strong comparison, then the image of the forward gluing component, then e_i. -/
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
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.inverseGluingImage`: The inverse local image starts with e_i inverse, then η_i of the inverse gluing component, then the forward strong comparison. -/
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
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.nativeImageComm`: The chart image isomorphisms obey exactly the native target DescentData.isoMk comm equation on arbitrary common test objects. -/
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
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.globalRestriction`: The actual global forward arrow restricts to every prescribed chartwise image arrow. -/
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
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.uniquenessForLocalData`: A second isomorphism with exactly the same local forward arrows equals the reconstructed global image isomorphism. -/
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
/-- `TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.emptyCoverEffectivity`: When the empty family is explicitly covering, the native target stack still yields an actual isomorphism; the covering hypothesis is not dropped. -/
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

end GerbeMorphismDescent

namespace CoherentInverse

open scoped Pseudofunctor.StrongTrans

variable {C : Type u} [Category.{v} C]
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}

/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans G G) :=
  Pseudofunctor.StrongTrans.homCategory (F := G) (G := G)

/-- Assemble the chosen component inverse equivalences using the mates of the
strong naturality squares. Their identity and composition equations follow from
those of the original transformation and the equivalence triangle identities. -/
noncomputable def inverse (η : Pseudofunctor.StrongTrans F G)
    (hη : ∀ U : C, (η.app (.mk (op U))).toFunctor.IsEquivalence) :
    Pseudofunctor.StrongTrans G F := by sorry

/-- The assembled inverse has the actual chosen inverse functor as its component. -/
theorem inverse_app (η : Pseudofunctor.StrongTrans F G)
    (hη : ∀ U : C, (η.app (.mk (op U))).toFunctor.IsEquivalence) (U : C) :
    letI := hη U
    ((inverse η hη).app (.mk (op U))).toFunctor =
      (η.app (.mk (op U))).toFunctor.inv := by sorry

/-- The component unit isomorphisms form an invertible modification, with source
identity and target the original transformation followed by its inverse. -/
noncomputable def unitIso (η : Pseudofunctor.StrongTrans F G)
    (hη : ∀ U : C, (η.app (.mk (op U))).toFunctor.IsEquivalence) :
    letI := Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)
    Pseudofunctor.StrongTrans.id F ≅
      Pseudofunctor.StrongTrans.vcomp η (inverse η hη) := by sorry

/-- The component counits form an invertible modification from inverse followed
by the original transformation to the identity. -/
noncomputable def counitIso (η : Pseudofunctor.StrongTrans F G)
    (hη : ∀ U : C, (η.app (.mk (op U))).toFunctor.IsEquivalence) :
    letI := Pseudofunctor.StrongTrans.homCategory (F := G) (G := G)
    Pseudofunctor.StrongTrans.vcomp (inverse η hη) η ≅
      Pseudofunctor.StrongTrans.id G := by sorry

/-- On an object the modification unit is the chosen equivalence unit;
the object comparison is induced by inverse_app. -/
theorem unitIso_app (η : Pseudofunctor.StrongTrans F G)
    (hη : ∀ U : C, (η.app (.mk (op U))).toFunctor.IsEquivalence) (U : C)
    (x : F.obj (.mk (op U))) :
    letI := hη U
    let e := (η.app (.mk (op U))).toFunctor.asEquivalence
    let r : ((inverse η hη).app (.mk (op U))).toFunctor.obj
        ((η.app (.mk (op U))).toFunctor.obj x) ≅ e.inverse.obj (e.functor.obj x) :=
      eqToIso (congrArg
        (fun Q : G.obj (.mk (op U)) ⥤ F.obj (.mk (op U)) =>
          Q.obj ((η.app (.mk (op U))).toFunctor.obj x)) (inverse_app η hη U))
    ((unitIso η hη).hom.as.app (.mk (op U))).toNatTrans.app x ≫ r.hom =
      e.unitIso.hom.app x := by sorry

/-- The component counit is the chosen equivalence counit, after comparison
with the selected inverse component. -/
theorem counitIso_app (η : Pseudofunctor.StrongTrans F G)
    (hη : ∀ U : C, (η.app (.mk (op U))).toFunctor.IsEquivalence) (U : C)
    (y : G.obj (.mk (op U))) :
    letI := hη U
    let e := (η.app (.mk (op U))).toFunctor.asEquivalence
    let r : ((inverse η hη).app (.mk (op U))).toFunctor.obj y ≅ e.inverse.obj y :=
      eqToIso (congrArg
        (fun Q : G.obj (.mk (op U)) ⥤ F.obj (.mk (op U)) => Q.obj y)
        (inverse_app η hη U))
    ((counitIso η hη).hom.as.app (.mk (op U))).toNatTrans.app y =
      e.functor.map r.hom ≫ e.counitIso.hom.app y := by sorry

/-- The forward triangle cancels the assembled unit and counit on every
object of every fibre, retaining the original component functor. -/
theorem triangleForward (η : Pseudofunctor.StrongTrans F G)
    (hη : ∀ U : C, (η.app (.mk (op U))).toFunctor.IsEquivalence) (U : C)
    (x : F.obj (.mk (op U))) :
    (η.app (.mk (op U))).toFunctor.map
      (((unitIso η hη).hom.as.app (.mk (op U))).toNatTrans.app x) ≫
      ((counitIso η hη).hom.as.app (.mk (op U))).toNatTrans.app
        ((η.app (.mk (op U))).toFunctor.obj x) =
      𝟙 ((η.app (.mk (op U))).toFunctor.obj x) := by sorry

/-- The inverse triangle cancels the same modifications on every object
of the inverse component, rather than choosing new endpoint isomorphisms. -/
theorem triangleInverse (η : Pseudofunctor.StrongTrans F G)
    (hη : ∀ U : C, (η.app (.mk (op U))).toFunctor.IsEquivalence) (U : C)
    (y : G.obj (.mk (op U))) :
    ((unitIso η hη).hom.as.app (.mk (op U))).toNatTrans.app
      (((inverse η hη).app (.mk (op U))).toFunctor.obj y) ≫
      ((inverse η hη).app (.mk (op U))).toFunctor.map
        (((counitIso η hη).hom.as.app (.mk (op U))).toNatTrans.app y) =
      𝟙 (((inverse η hη).app (.mk (op U))).toFunctor.obj y) := by sorry

/-- `CoherentInverseChecks.identity`: for an identity diagram the inverse component returns each object,
up to the chosen equivalence unit. -/
example (U : C) (x : F.obj (.mk (op U))) :
    Nonempty (x ≅ ((inverse (Pseudofunctor.StrongTrans.id F)
      (fun V => by
        change (𝟭 (F.obj (.mk (op V)))).IsEquivalence
        infer_instance)).app (.mk (op U))).toFunctor.obj x) := by sorry

/-- `CoherentInverseChecks.object`: a nontrivial component equivalence is inverted as a functor, so the
unit recovers every object rather than merely a selected global object. -/
example (η : Pseudofunctor.StrongTrans F G)
    (hη : ∀ U : C, (η.app (.mk (op U))).toFunctor.IsEquivalence)
    (U : C) (x : F.obj (.mk (op U))) :
    Nonempty (x ≅ ((inverse η hη).app (.mk (op U))).toFunctor.obj
      ((η.app (.mk (op U))).toFunctor.obj x)) := by sorry

/-- `CoherentInverseChecks.restriction`: the inverse naturality square compares the two actual restriction
functors, including a nonidentity arrow of the base site. -/
example (η : Pseudofunctor.StrongTrans F G)
    (hη : ∀ U : C, (η.app (.mk (op U))).toFunctor.IsEquivalence)
    (U V : C) (f : V ⟶ U) :
    Nonempty (G.map f.op.toLoc ≫ (inverse η hη).app (.mk (op V)) ≅
      (inverse η hη).app (.mk (op U)) ≫ F.map f.op.toLoc) := by sorry

end CoherentInverse

namespace GerbeBandEquivalence

open scoped Pseudofunctor.StrongTrans
variable {C : Type u} [Category.{v} C]
    {J : GrothendieckTopology C}
    {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
    {A : Sheaf J AddCommGrpCat.{w}} [IsGerbe F J] [IsGerbe G J]
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)

/-- Transport of functors by a natural isomorphism preserves their specified band maps through conjugation compatibility. -/
theorem fibreNatIso_map_band (U : C)
    (P Q : F.obj (.mk (op U)) ⥤ G.obj (.mk (op U))) (e : P ≅ Q)
    (hP : ∀ (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))),
      P.mapAut x (bF.autEquiv U x a) = bG.autEquiv U (P.obj x) a)
    (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    Q.mapAut x (bF.autEquiv U x a) = bG.autEquiv U (Q.obj x) a := by
  sorry

/-- A strong transformation componentwise naturally isomorphic to a band-preserving transformation preserves the same band. -/
theorem of_fibreNatIso (η θ : Pseudofunctor.StrongTrans F G)
    [BandPreserving bF bG η]
    (e : ∀ U : C, (η.app (.mk (op U))).toFunctor ≅
      (θ.app (.mk (op U))).toFunctor) : BandPreserving bF bG θ := by
  sorry

/-- An invertible modification transports the band-preservation property. -/
theorem of_modificationIso (η θ : Pseudofunctor.StrongTrans F G)
    [BandPreserving bF bG η] (e : η ≅ θ) : BandPreserving bF bG θ := by
  sorry

/-- Naturally isomorphic strong transformations preserve the specified band simultaneously. -/
theorem modificationIso_iff (η θ : Pseudofunctor.StrongTrans F G)
    (e : η ≅ θ) : BandPreserving bF bG η ↔ BandPreserving bF bG θ := by
  sorry

/-- The inverse equivalence on a fibre preserves the common band, with its unit and counit comparisons. -/
theorem inverse_map_band (η : Pseudofunctor.StrongTrans F G)
    [BandPreserving bF bG η] (U : C)
    [(η.app (.mk (op U))).toFunctor.IsEquivalence]
    (y : G.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    (η.app (.mk (op U))).toFunctor.inv.mapAut y (bG.autEquiv U y a) =
      bF.autEquiv U ((η.app (.mk (op U))).toFunctor.inv.obj y) a := by
  sorry

omit [IsGerbe G J] in
/-- The unit of the fibre equivalence conjugates the source band automorphism to the same coefficient on its roundtrip image. -/
theorem unit_band (η : Pseudofunctor.StrongTrans F G) (U : C)
    [(η.app (.mk (op U))).toFunctor.IsEquivalence]
    (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    Aut.autMulEquivOfIso ((η.app (.mk (op U))).toFunctor.asEquivalence.unitIso.app x)
      (bF.autEquiv U x a) =
      bF.autEquiv U ((η.app (.mk (op U))).toFunctor.inv.obj
        ((η.app (.mk (op U))).toFunctor.obj x)) a := by
  sorry

omit [IsGerbe F J] in
/-- The counit of the fibre equivalence conjugates the roundtrip target band automorphism to the same coefficient at the target. -/
theorem counit_band (η : Pseudofunctor.StrongTrans F G) (U : C)
    [(η.app (.mk (op U))).toFunctor.IsEquivalence]
    (y : G.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    Aut.autMulEquivOfIso ((η.app (.mk (op U))).toFunctor.asEquivalence.counitIso.app y)
      (bG.autEquiv U ((η.app (.mk (op U))).toFunctor.obj
        ((η.app (.mk (op U))).toFunctor.inv.obj y)) a) =
      bG.autEquiv U y a := by
  sorry

/-- A coherent inverse strong transformation componentwise isomorphic to the fibre inverses preserves the common band. -/
theorem inverse_preserving (η : Pseudofunctor.StrongTrans F G)
    [BandPreserving bF bG η]
    (hη : ∀ U : C, (η.app (.mk (op U))).toFunctor.IsEquivalence)
    (σ : Pseudofunctor.StrongTrans G F)
    (e : ∀ U : C, letI := hη U
      (σ.app (.mk (op U))).toFunctor ≅ (η.app (.mk (op U))).toFunctor.inv) :
    BandPreserving bG bF σ := by
  sorry

end GerbeBandEquivalence

namespace GerbeBandEquivalenceTests
open scoped Pseudofunctor.StrongTrans
variable {C : Type u} [Category.{v} C]
    {J : GrothendieckTopology C}
    {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
    {A : Sheaf J AddCommGrpCat.{w}} [IsGerbe F J] [IsGerbe G J]
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]

-- test: GerbeBandEquivalenceTests.fibre_refl
/-- `GerbeBandEquivalenceTests.fibre_refl`: With P=Q=η_U and e the identity natural isomorphism, the transported mapAut equation is exactly the original fixed-band equation, for every actual coefficient a. -/
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
/-- `GerbeBandEquivalenceTests.modification_symm`: For an actual invertible native modification e:η≅θ, applying the invariance equivalence to e inverse gives BandPreserving θ if and only if BandPreserving η. -/
example (θ : Pseudofunctor.StrongTrans F G) (e : η ≅ θ) :
    BandPreserving bF bG θ ↔ BandPreserving bF bG η := by
  sorry

-- test: GerbeBandEquivalenceTests.inverse_coefficient
/-- `GerbeBandEquivalenceTests.inverse_coefficient`: For every actual y∈G(U) and actual a∈A(U), the chosen native component inverse sends bG(U,y)(a) to bF(U,η_U inverse(y))(a). This tests the coefficient, not only its automorphism order. -/
example (U : C) [(η.app (.mk (op U))).toFunctor.IsEquivalence]
    (y : G.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    (η.app (.mk (op U))).toFunctor.inv.mapAut y (bG.autEquiv U y a) =
      bF.autEquiv U ((η.app (.mk (op U))).toFunctor.inv.obj y) a := by
  sorry

-- test: GerbeBandEquivalenceTests.unit_coefficient
/-- `GerbeBandEquivalenceTests.unit_coefficient`: Conjugation along the actual native unit component sends the source coefficient at x to the same coefficient at η_U inverse(η_U x). -/
example (U : C) [(η.app (.mk (op U))).toFunctor.IsEquivalence]
    (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    Aut.autMulEquivOfIso ((η.app (.mk (op U))).toFunctor.asEquivalence.unitIso.app x)
      (bF.autEquiv U x a) =
      bF.autEquiv U ((η.app (.mk (op U))).toFunctor.inv.obj
        ((η.app (.mk (op U))).toFunctor.obj x)) a := by
  sorry

-- test: GerbeBandEquivalenceTests.counit_coefficient
/-- `GerbeBandEquivalenceTests.counit_coefficient`: Conjugation along the actual native counit component sends the coefficient at η_U(η_U inverse y) to the same coefficient at y. -/
example (U : C) [(η.app (.mk (op U))).toFunctor.IsEquivalence]
    (y : G.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    Aut.autMulEquivOfIso ((η.app (.mk (op U))).toFunctor.asEquivalence.counitIso.app y)
      (bG.autEquiv U ((η.app (.mk (op U))).toFunctor.obj
        ((η.app (.mk (op U))).toFunctor.inv.obj y)) a) =
      bG.autEquiv U y a := by
  sorry

-- test: GerbeBandEquivalenceTests.chosen_inverse
/-- `GerbeBandEquivalenceTests.chosen_inverse`: For a supplied native σ:G→F and supplied actual comparisons σ_U≅η_U inverse at every U, the resulting property is BandPreserving bG bF σ; the comparisons are data, not a claim of their existence. -/
example (hη : ∀ U : C, (η.app (.mk (op U))).toFunctor.IsEquivalence)
    (σ : Pseudofunctor.StrongTrans G F)
    (e : ∀ U : C, letI := hη U
      (σ.app (.mk (op U))).toFunctor ≅ (η.app (.mk (op U))).toFunctor.inv) :
    BandPreserving bG bF σ := by
  sorry

end GerbeBandEquivalenceTests

namespace BandedMorphism
open scoped Pseudofunctor.StrongTrans
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)

/-- The modification, with its inverse determined in the gerbe fibres. -/
noncomputable def modificationIso [IsGerbe G J]
    {η θ : Pseudofunctor.StrongTrans F G} (m : η ⟶ θ) : η ≅ θ := by
  sorry

/-- `BandedMorphism.modificationIso_hom`: For every m, M(m).hom=m as a native modification, including every component natural transformation. -/
theorem modificationIso_hom [IsGerbe G J]
    {η θ : Pseudofunctor.StrongTrans F G} (m : η ⟶ θ) :
    (modificationIso (J := J) m).hom = m := by
  sorry

/-- `BandedMorphism.modificationIso_inv_app`: For every actual test object U and source object x, the (U,x) component of M(m).inv equals the native inverse of m(U,x). -/
theorem modificationIso_inv_app [IsGerbe G J]
    {η θ : Pseudofunctor.StrongTrans F G} (m : η ⟶ θ)
    (U : C) (x : F.obj (.mk (op U))) :
    ((modificationIso (J := J) m).inv.as.app (.mk (op U))).toNatTrans.app x =
      letI := IsGerbe.isIso_hom (F := G) (J := J) U
        ((m.as.app (.mk (op U))).toNatTrans.app x)
      inv ((m.as.app (.mk (op U))).toNatTrans.app x) := by
  sorry

/-- `BandedMorphism.modificationIso_id`: For every η, M(idη) is the native identity isomorphism of η. -/
theorem modificationIso_id [IsGerbe G J]
    (η : Pseudofunctor.StrongTrans F G) :
    modificationIso (J := J) (𝟙 η) = Iso.refl η := by
  sorry

/-- `BandedMorphism.modificationIso_comp`: For composable native modifications m and n, M(m≫n)=M(m)≪≫M(n). The inverse thus uses reverse composition. -/
theorem modificationIso_comp [IsGerbe G J]
    {η θ σ : Pseudofunctor.StrongTrans F G} (m : η ⟶ θ) (n : θ ⟶ σ) :
    modificationIso (J := J) (m ≫ n) =
      modificationIso (J := J) m ≪≫ modificationIso (J := J) n := by
  sorry

variable {A : Sheaf J AddCommGrpCat.{w}} [IsGerbe F J] [IsGerbe G J]
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)

/-- `BandedMorphism.modification_iff`: For native m:η⇒θ between F→G and specified bands bF,bG, BandPreserving(bF,bG,η) if and only if BandPreserving(bF,bG,θ). No additional IsIso(m) assumption is required because G is a gerbe. -/
theorem modification_iff {η θ : Pseudofunctor.StrongTrans F G} (m : η ⟶ θ) :
    BandPreserving bF bG η ↔ BandPreserving bF bG θ := by
  sorry

/-- All modifications between strong transformations preserving the fixed band. -/
abbrev HomCategory :=
  (show ObjectProperty (Pseudofunctor.StrongTrans F G) from
    fun η => BandPreserving bF bG η).FullSubcategory

/-- `BandedMorphism.mk`: An actual band-preserving transformation with its specified band property is an object of the native fixed-band full subcategory. -/
def mk (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] :
    HomCategory bF bG := by
  sorry

/-- `BandedMorphism.homMk`: Every actual underlying modification between fixed-band objects packages as an arrow of the full subcategory. -/
def homMk {X Y : HomCategory bF bG} (m : X.obj ⟶ Y.obj) : X ⟶ Y := by
  sorry

/-- `BandedMorphism.forget`: The native inclusion functor forgets only the fixed-band object property and retains every modification. -/
def forget : HomCategory bF bG ⥤ Pseudofunctor.StrongTrans F G := by
  sorry

/-- `BandedMorphism.forget_fullyFaithful`: The native inclusion of the fixed-band full subcategory has the existing fully faithful data of ObjectProperty.fullyFaithfulι. -/
abbrev forget_fullyFaithful : (forget bF bG).FullyFaithful := by
  sorry

/-- `BandedMorphism.hom_ext`: For m,n:X⇒Y in the fixed-band category, equality of their underlying natural transformations at every U implies m=n. -/
theorem hom_ext {X Y : HomCategory bF bG} {m n : X ⟶ Y}
    (h : ∀ U : C, (m.hom.as.app (.mk (op U))).toNatTrans =
      (n.hom.as.app (.mk (op U))).toNatTrans) : m = n := by
  sorry

/-- Every modification between band-preserving gerbe morphisms is invertible; its inverse has the inverse arrow in every groupoid fibre. -/
noncomputable def homIso {X Y : HomCategory bF bG} (m : X ⟶ Y) : X ≅ Y := by
  sorry

/-- `BandedMorphism.homIso_hom`: For every m:X⇒Y, homIso(m).hom=m in the fixed-band category. -/
theorem homIso_hom {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (homIso bF bG m).hom = m := by
  sorry

/-- Every modification between band-preserving morphisms of gerbes is invertible. -/
theorem hom_isIso {X Y : HomCategory bF bG} (m : X ⟶ Y) : IsIso m := by
  sorry

/-- `BandedMorphism.homIso_inv_app`: For every m:X⇒Y, U and x, the underlying (U,x) component of homIso(m).inv is the native inverse of the component of m. -/
theorem homIso_inv_app {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (U : C) (x : F.obj (.mk (op U))) :
    (((homIso bF bG m).inv.hom.as.app (.mk (op U))).toNatTrans.app x) =
      letI := IsGerbe.isIso_hom (F := G) (J := J) U
        ((m.hom.as.app (.mk (op U))).toNatTrans.app x)
      inv ((m.hom.as.app (.mk (op U))).toNatTrans.app x) := by
  sorry

/-- `BandedMorphism.homIso_comp`: For m:X⇒Y and n:Y⇒Z, homIso(m≫n)=homIso(m)≪≫homIso(n). -/
theorem homIso_comp {X Y Z : HomCategory bF bG} (m : X ⟶ Y) (n : Y ⟶ Z) :
    homIso bF bG (m ≫ n) = homIso bF bG m ≪≫ homIso bF bG n := by
  sorry

/-- The category of band-preserving strong transformations is a groupoid with inverse given by pointwise inversion of modifications. -/
@[instance_reducible]
noncomputable def groupoid : Groupoid (HomCategory bF bG) :=
  Groupoid.ofIsIso (hom_isIso bF bG)

/-- `BandedMorphism.groupoid_inv`: For every m:X⇒Y, the native groupoid inverse is homIso(m).inv. -/
theorem groupoid_inv {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (groupoid bF bG).inv m = (homIso bF bG m).inv := by
  sorry

/-- `BandedMorphism.groupoid_comp_inv`: For m:X⇒Y, m≫groupoid.inv(m)=idX as an actual modification. -/
theorem groupoid_comp_inv {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    m ≫ (groupoid bF bG).inv m = 𝟙 X := by
  sorry

/-- `BandedMorphism.groupoid_inv_comp`: For m:X⇒Y, groupoid.inv(m)≫m=idY as an actual modification. -/
theorem groupoid_inv_comp {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (groupoid bF bG).inv m ≫ m = 𝟙 Y := by
  sorry

end BandedMorphism
namespace BandedMorphismTests
open BandedMorphism
open scoped Pseudofunctor.StrongTrans
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable [IsGerbe G J]

-- test: BandedMorphismTests.modification_forward
/-- `BandedMorphismTests.modification_forward`: The forward modification of M(m) is exactly the supplied native m. -/
example {η θ : Pseudofunctor.StrongTrans F G} (m : η ⟶ θ) :
    (modificationIso (J := J) m).hom = m := by
  sorry

-- test: BandedMorphismTests.modification_inverse_component
/-- `BandedMorphismTests.modification_inverse_component`: For each U,x the inverse component is the native inverse of m(U,x), with both endpoints retained. -/
example {η θ : Pseudofunctor.StrongTrans F G} (m : η ⟶ θ)
    (U : C) (x : F.obj (.mk (op U))) :
    ((modificationIso (J := J) m).inv.as.app (.mk (op U))).toNatTrans.app x =
      letI := IsGerbe.isIso_hom (F := G) (J := J) U
        ((m.as.app (.mk (op U))).toNatTrans.app x)
      inv ((m.as.app (.mk (op U))).toNatTrans.app x) := by
  sorry

-- test: BandedMorphismTests.modification_composition
/-- `BandedMorphismTests.modification_composition`: For actual composable m,n the constructed isomorphism of their composite is the composite of their constructed isomorphisms. -/
example {η θ σ : Pseudofunctor.StrongTrans F G} (m : η ⟶ θ) (n : θ ⟶ σ) :
    modificationIso (J := J) (m ≫ n) =
      modificationIso (J := J) m ≪≫ modificationIso (J := J) n := by
  sorry

variable {A : Sheaf J AddCommGrpCat.{w}} [IsGerbe F J]
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)

-- test: BandedMorphismTests.carrier_arrows
/-- `BandedMorphismTests.carrier_arrows`: Every native underlying modification m:X.obj⇒Y.obj lifts and is recovered exactly; no arrow is discarded. -/
example {X Y : HomCategory bF bG} (m : X.obj ⟶ Y.obj) :
    (homMk bF bG m).hom = m := by
  sorry

-- test: BandedMorphismTests.carrier_distinct_arrows
/-- `BandedMorphismTests.carrier_distinct_arrows`: If two actual fixed-band modifications m,n are distinct, their forgotten modifications remain distinct. Replacing the groupoid by isomorphism classes cannot satisfy this test. -/
example {X Y : HomCategory bF bG} (m n : X ⟶ Y) (h : m ≠ n) :
    (forget bF bG).map m ≠ (forget bF bG).map n := by
  sorry

-- test: BandedMorphismTests.carrier_band
/-- `BandedMorphismTests.carrier_band`: A supplied band-preserving native transformation η maps to a fixed-band object whose forgotten transformation is exactly η. -/
example (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] :
    (forget bF bG).obj (mk bF bG η) = η := by
  sorry

-- test: BandedMorphismTests.hom_forward
/-- `BandedMorphismTests.hom_forward`: Lifting an actual fixed-band modification to an isomorphism retains its exact forward arrow. -/
example {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (homIso bF bG m).hom = m := by
  sorry

-- test: BandedMorphismTests.hom_inverse_component
/-- `BandedMorphismTests.hom_inverse_component`: After forgetting the fixed-band inverse, each actual (U,x) component is the inverse of the original component. -/
example {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (U : C) (x : F.obj (.mk (op U))) :
    (((homIso bF bG m).inv.hom.as.app (.mk (op U))).toNatTrans.app x) =
      letI := IsGerbe.isIso_hom (F := G) (J := J) U
        ((m.hom.as.app (.mk (op U))).toNatTrans.app x)
      inv ((m.hom.as.app (.mk (op U))).toNatTrans.app x) := by
  sorry

-- test: BandedMorphismTests.hom_composition
/-- `BandedMorphismTests.hom_composition`: For actual fixed-band m,n the constructed isomorphism of the composite is their composite isomorphism. -/
example {X Y Z : HomCategory bF bG} (m : X ⟶ Y) (n : Y ⟶ Z) :
    homIso bF bG (m ≫ n) = homIso bF bG m ≪≫ homIso bF bG n := by
  sorry

-- test: BandedMorphismTests.groupoid_inverse
/-- `BandedMorphismTests.groupoid_inverse`: The chosen native groupoid inverse agrees with the inverse of the actual homIso construction. -/
example {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (groupoid bF bG).inv m = (homIso bF bG m).inv := by
  sorry

-- test: BandedMorphismTests.groupoid_right_inverse
/-- `BandedMorphismTests.groupoid_right_inverse`: A supplied native modification composed with its groupoid inverse equals the identity of its source object. -/
example {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    m ≫ (groupoid bF bG).inv m = 𝟙 X := by
  sorry

-- test: BandedMorphismTests.groupoid_left_inverse
/-- `BandedMorphismTests.groupoid_left_inverse`: Its groupoid inverse composed with the supplied native modification equals the identity of its target object. -/
example {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (groupoid bF bG).inv m ≫ m = 𝟙 Y := by
  sorry

end BandedMorphismTests

namespace BandedIsom
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  {J : GrothendieckTopology C} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U : C} {x y z : F.obj (.mk (op U))}

/-- The actual isomorphism set x ≅ y, possibly empty, with band action by postcomposition at y. -/
def fibreAction (x y : F.obj (.mk (op U))) :
    Action (Type v') (Multiplicative (A.obj.obj (op U))) where
  V := x ≅ y
  ρ :=
    { toFun := fun a => TypeCat.ofHom (fun p => p ≪≫ b.autEquiv U y a)
      map_one' := by
        sorry
      map_mul' := by
        sorry }

/-- For a in Multiplicative(A(U)) and p:x≅y, the underlying function rho(a) sends p to p followed by b_y(a). -/
theorem fibreAction_apply (a : Multiplicative (A.obj.obj (op U))) (p : x ≅ y) :
    End.asHom ((fibreAction b x y).ρ a) p = p ≪≫ b.autEquiv U y a := by
  sorry

/-- If Isom_F(U)(x,y) is empty, the carrier of fibreAction(b,x,y) is empty as well. -/
theorem fibreAction_empty (h : IsEmpty (x ≅ y)) : IsEmpty (fibreAction b x y).V := by
  sorry

/-- For q:y≅z, b_y(a) followed by q equals q followed by b_z(a); this is the existing band conjugation equation used by the bundled action API. -/
theorem band_commute (q : y ≅ z) (a : Multiplicative (A.obj.obj (op U))) :
    b.autEquiv U y a ≪≫ q = q ≪≫ b.autEquiv U z a := by
  sorry

/-- Postcomposition by y ≅ z gives an equivariant isomorphism of band actions on x ≅ y and x ≅ z. -/
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
/-- For q:y≅z and p:x≅y, the forward underlying function of postcomposeActionIso(b,q) is p followed by q. -/
theorem postcomposeActionIso_apply (q : y ≅ z) (p : x ≅ y) :
    (postcomposeActionIso b q).hom.hom p = p ≪≫ q := by
  sorry

/-- For q:y≅z and p:x≅z, the inverse underlying function is p followed by q inverse. -/
theorem postcomposeActionIso_inv_apply (q : y ≅ z) (p : x ≅ z) :
    (postcomposeActionIso b q).inv.hom p = p ≪≫ q.symm := by
  sorry

/-- Postcomposition by q followed by r equals the composition of postcomposeActionIso(b,q) and postcomposeActionIso(b,r), with the original source object x fixed. -/
theorem postcomposeActionIso_comp {t : F.obj (.mk (op U))} (q : y ≅ z) (r : z ≅ t) :
    postcomposeActionIso b (x := x) (q ≪≫ r) =
      postcomposeActionIso b q ≪≫ postcomposeActionIso b r := by
  sorry

end BandedIsom

namespace BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J]
  {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)

/-- At an object of a fibre, a modification between gerbe morphisms yields the isomorphism with its actual component arrow. -/
noncomputable def componentIso {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (U : C) (x : F.obj (.mk (op U))) :
    (X.obj.app (.mk (op U))).toFunctor.obj x ≅
      (Y.obj.app (.mk (op U))).toFunctor.obj x :=
  letI := IsGerbe.isIso_hom (F := G) (J := J) U
    ((m.hom.as.app (.mk (op U))).toNatTrans.app x)
  asIso ((m.hom.as.app (.mk (op U))).toNatTrans.app x)

/-- The forward arrow of componentIso(m,U,x) is exactly the component of the actual native modification m, with no quotient or replacement carrier. -/
theorem componentIso_hom {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (U : C) (x : F.obj (.mk (op U))) :
    (componentIso bF bG m U x).hom =
      (m.hom.as.app (.mk (op U))).toNatTrans.app x := by
  sorry

/-- The component isomorphism of the identity native modification at U,x is Iso.refl of X_U(x). -/
theorem componentIso_id (X : HomCategory bF bG) (U : C)
    (x : F.obj (.mk (op U))) :
    componentIso bF bG (𝟙 X) U x = Iso.refl _ := by
  sorry

/-- componentIso(m followed by n,U,x) equals componentIso(m,U,x) followed by componentIso(n,U,x). -/
theorem componentIso_comp {X Y Z : HomCategory bF bG} (m : X ⟶ Y) (n : Y ⟶ Z)
    (U : C) (x : F.obj (.mk (op U))) :
    componentIso bF bG (m ≫ n) U x =
      componentIso bF bG m U x ≪≫ componentIso bF bG n U x := by
  sorry

/-- Send a band-preserving morphism to the band action on isomorphisms from y to its image of x; modifications act by their component arrows. -/
noncomputable def fibreIsomActionFunctor (U : C) (x : F.obj (.mk (op U)))
    (y : G.obj (.mk (op U))) :
    HomCategory bF bG ⥤ Action (Type v') (Multiplicative (A.obj.obj (op U))) where
  obj X := BandedIsom.fibreAction bG y ((X.obj.app (.mk (op U))).toFunctor.obj x)
  map m := (BandedIsom.postcomposeActionIso bG (componentIso bF bG m U x)).hom
  map_id X := by
    sorry
  map_comp m n := by
    sorry
/-- The carrier of the action assigned to X is exactly Isom_G(U)(y,X_U(x)). -/
theorem fibreIsomActionFunctor_obj (U : C) (x : F.obj (.mk (op U)))
    (y : G.obj (.mk (op U))) (X : HomCategory bF bG) :
    ((fibreIsomActionFunctor bF bG U x y).obj X).V =
      (y ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) := by
  sorry

/-- On p:y≅X_U(x), the underlying function assigned to m:X→Y sends p to p followed by componentIso(m,U,x). -/
theorem fibreIsomActionFunctor_map_apply (U : C) (x : F.obj (.mk (op U)))
    (y : G.obj (.mk (op U))) {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (p : y ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    ((fibreIsomActionFunctor bF bG U x y).map m).hom p =
      p ≪≫ componentIso bF bG m U x := by
  sorry

/-- The component of the existing homIso(m) inverse is the inverse of componentIso(m,U,x). -/
theorem componentIso_inv {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (U : C) (x : F.obj (.mk (op U))) :
    componentIso bF bG (homIso bF bG m).inv U x =
      (componentIso bF bG m U x).symm := by
  sorry

/-- The action functor map of homIso(m) inverse is the inverse arrow of postcomposeActionIso(bG,componentIso(m,U,x)). -/
theorem fibreIsomActionFunctor_map_inverse (U : C) (x : F.obj (.mk (op U)))
    (y : G.obj (.mk (op U))) {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (fibreIsomActionFunctor bF bG U x y).map (homIso bF bG m).inv =
      (BandedIsom.postcomposeActionIso bG (x := y) (componentIso bF bG m U x)).inv := by
  sorry

end BandedMorphism

namespace BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U : C} {x x' x'' : F.obj (.mk (op U))}
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

/-- Transport p : x ≅ X(x) to e⁻¹ ∘ p ∘ X(e) at another object. Band preservation makes this independent of the chosen e. -/
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
/-- The forward underlying function is p ↦ e inverse followed by p followed by X_U(e). -/
theorem selfTransportActionIso_apply (X : HomCategory b b) (e : x ≅ x')
    (p : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    (selfTransportActionIso b X e).hom.hom p =
      e.symm ≪≫ p ≪≫ (X.obj.app (.mk (op U))).toFunctor.mapIso e := by
  sorry

/-- The inverse underlying function is p ↦ e followed by p followed by X_U(e inverse). -/
theorem selfTransportActionIso_inv_apply (X : HomCategory b b) (e : x ≅ x')
    (p : x' ≅ (X.obj.app (.mk (op U))).toFunctor.obj x') :
    (selfTransportActionIso b X e).inv.hom p =
      e ≪≫ p ≪≫ (X.obj.app (.mk (op U))).toFunctor.mapIso e.symm := by
  sorry

/-- Transport by Iso.refl(x) is the identity isomorphism of the native self-morphism action. -/
theorem selfTransportActionIso_id (X : HomCategory b b) :
    selfTransportActionIso b X (Iso.refl x) = Iso.refl _ := by
  sorry

/-- Transport along e:x≅x′ followed by f:x′≅x″ equals transport along e followed by transport along f. -/
theorem selfTransportActionIso_comp (X : HomCategory b b) (e : x ≅ x') (f : x' ≅ x'') :
    selfTransportActionIso b X (e ≪≫ f) =
      selfTransportActionIso b X e ≪≫ selfTransportActionIso b X f := by
  sorry

/-- The choice-independent self-Hom transport is natural in every modification of band-preserving endomorphisms. -/
noncomputable def selfTransportNatIso (e : x ≅ x') :
    fibreIsomActionFunctor b b U x x ≅ fibreIsomActionFunctor b b U x' x' :=
  NatIso.ofComponents (fun X => selfTransportActionIso b X e) (by
    sorry)

/-- At X, the natural isomorphism component is exactly selfTransportActionIso(X,e). -/
theorem selfTransportNatIso_app (e : x ≅ x') (X : HomCategory b b) :
    (selfTransportNatIso b e).app X = selfTransportActionIso b X e := by
  sorry

/-- For X in HomCategory(b,b) and any two actual isomorphisms e,f:x≅x′, selfTransportActionIso(X,e) equals selfTransportActionIso(X,f). No choice of a connecting arrow is retained. -/
theorem selfTransportActionIso_independent (X : HomCategory b b) (e f : x ≅ x') :
    selfTransportActionIso b X e = selfTransportActionIso b X f := by
  sorry

/-- For e,f:x≅x′, the resulting native natural isomorphisms of self-morphism action functors are equal. -/
theorem selfTransportNatIso_independent (e f : x ≅ x') :
    selfTransportNatIso b e = selfTransportNatIso b f := by
  sorry

/-- Natural transport along Iso.refl(x) is the identity natural isomorphism of the native action functor. -/
theorem selfTransportNatIso_id :
    selfTransportNatIso b (Iso.refl x) = Iso.refl _ := by
  sorry

/-- Natural transport along e followed by f equals the composition of the native natural transports along e and f. -/
theorem selfTransportNatIso_comp (e : x ≅ x') (f : x' ≅ x'') :
    selfTransportNatIso b (e ≪≫ f) = selfTransportNatIso b e ≪≫ selfTransportNatIso b f := by
  sorry

end BandedMorphism

namespace FibreActionTests
open CategoryTheory Opposite Bicategory BandedIsom BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable {U : C} {x y z t : F.obj (.mk (op U))}

-- test: FibreActionTests.actual_coefficient
/-- `TauCeti.AlgebraicGeometry.FibreActionTests.actual_coefficient`: On an actual p:x≅y, coefficient a acts by p followed by the prescribed b_y(a). -/
example (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    End.asHom ((fibreAction bF x y).ρ a) p = p ≪≫ bF.autEquiv U y a := by
  sorry

-- test: FibreActionTests.empty_sections
/-- `TauCeti.AlgebraicGeometry.FibreActionTests.empty_sections`: A supplied empty Isom section set is still the carrier of a valid bundled action and remains empty. -/
example (h : IsEmpty (x ≅ y)) : IsEmpty (fibreAction bF x y).V := by
  sorry

-- test: FibreActionTests.multiplication_order
/-- `TauCeti.AlgebraicGeometry.FibreActionTests.multiplication_order`: The coefficient action satisfies rho(ac)=rho(c) followed by rho(a), matching native End multiplication. -/
example (a c : Multiplicative (A.obj.obj (op U))) :
    (fibreAction bF x y).ρ (a * c) =
      (fibreAction bF x y).ρ c ≫ (fibreAction bF x y).ρ a := by
  sorry

-- test: FibreActionTests.postcompose_forward
/-- `TauCeti.AlgebraicGeometry.FibreActionTests.postcompose_forward`: The forward function on p is p followed by the supplied q. -/
example (q : y ≅ z) (p : x ≅ y) :
    (postcomposeActionIso bF q).hom.hom p = p ≪≫ q := by
  sorry

-- test: FibreActionTests.postcompose_roundtrip
/-- `TauCeti.AlgebraicGeometry.FibreActionTests.postcompose_roundtrip`: Forward postcomposition by q and inverse postcomposition by q inverse return the original p. -/
example (q : y ≅ z) (p : x ≅ y) :
    (postcomposeActionIso bF q).inv.hom ((postcomposeActionIso bF q).hom.hom p) = p := by
  sorry

-- test: FibreActionTests.postcompose_composition
/-- `TauCeti.AlgebraicGeometry.FibreActionTests.postcompose_composition`: Postcomposition by q followed by r equals composing the two native action isomorphisms. -/
example (q : y ≅ z) (r : z ≅ t) :
    postcomposeActionIso bF (x := x) (q ≪≫ r) =
      postcomposeActionIso bF q ≪≫ postcomposeActionIso bF r := by
  sorry

-- test: FibreActionTests.native_component
/-- `TauCeti.AlgebraicGeometry.FibreActionTests.native_component`: The forward fibre arrow is exactly the component of the given native modification. -/
example {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (componentIso bF bG m U x).hom =
      (m.hom.as.app (.mk (op U))).toNatTrans.app x := by
  sorry

-- test: FibreActionTests.native_component_inverse
/-- `TauCeti.AlgebraicGeometry.FibreActionTests.native_component_inverse`: Evaluation of the native modification inverse is the inverse of the evaluated component isomorphism. -/
example {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    componentIso bF bG (homIso bF bG m).inv U x =
      (componentIso bF bG m U x).symm := by
  sorry

-- test: FibreActionTests.native_component_composition
/-- `TauCeti.AlgebraicGeometry.FibreActionTests.native_component_composition`: Evaluation of actual vertical modification composition agrees with composition of fibre isomorphisms. -/
example {X Y Z : HomCategory bF bG} (m : X ⟶ Y) (n : Y ⟶ Z) :
    componentIso bF bG (m ≫ n) U x =
      componentIso bF bG m U x ≪≫ componentIso bF bG n U x := by
  sorry

-- test: FibreActionTests.functor_actual_carrier
/-- `TauCeti.AlgebraicGeometry.FibreActionTests.functor_actual_carrier`: The functor object has the actual carrier Isom_G(U)(y,X_U(x)). -/
example (y : G.obj (.mk (op U))) (X : HomCategory bF bG) :
    ((fibreIsomActionFunctor bF bG U x y).obj X).V =
      (y ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) := by
  sorry

-- test: FibreActionTests.functor_coefficient_naturality
/-- `TauCeti.AlgebraicGeometry.FibreActionTests.functor_coefficient_naturality`: Every native modification map commutes with each coefficient action, in the native Action.Hom equation. -/
example (y : G.obj (.mk (op U))) {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (a : Multiplicative (A.obj.obj (op U))) :
    ((fibreIsomActionFunctor bF bG U x y).obj X).ρ a ≫
        ((fibreIsomActionFunctor bF bG U x y).map m).hom =
      ((fibreIsomActionFunctor bF bG U x y).map m).hom ≫
        ((fibreIsomActionFunctor bF bG U x y).obj Y).ρ a := by
  sorry

-- test: FibreActionTests.functor_native_inverse
/-- `TauCeti.AlgebraicGeometry.FibreActionTests.functor_native_inverse`: The native inverse modification maps to the inverse of postcomposition by the evaluated component. -/
example (y : G.obj (.mk (op U))) {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (fibreIsomActionFunctor bF bG U x y).map (homIso bF bG m).inv =
      (postcomposeActionIso bG (x := y) (componentIso bF bG m U x)).inv := by
  sorry

end FibreActionTests

namespace SelfTransportTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U : C} {x y z : F.obj (.mk (op U))}
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

-- test: SelfTransportTests.actual_arrow_transport
/-- `TauCeti.AlgebraicGeometry.SelfTransportTests.actual_arrow_transport`: The forward function sends p to e inverse followed by p followed by X_U(e). -/
example (X : HomCategory b b) (e : x ≅ y)
    (p : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    (selfTransportActionIso b X e).hom.hom p =
      e.symm ≪≫ p ≪≫ (X.obj.app (.mk (op U))).toFunctor.mapIso e := by
  sorry

-- test: SelfTransportTests.no_chosen_arrow
/-- `TauCeti.AlgebraicGeometry.SelfTransportTests.no_chosen_arrow`: Two arbitrary connecting isomorphisms e,f give the same action isomorphism for an actual band-preserving X. -/
example (X : HomCategory b b) (e f : x ≅ y) :
    selfTransportActionIso b X e = selfTransportActionIso b X f := by
  sorry

-- test: SelfTransportTests.identity_transport
/-- `TauCeti.AlgebraicGeometry.SelfTransportTests.identity_transport`: Using Iso.refl(x) gives the native identity action isomorphism. -/
example (X : HomCategory b b) :
    selfTransportActionIso b X (Iso.refl x) = Iso.refl _ := by
  sorry

-- test: SelfTransportTests.modification_naturality
/-- `TauCeti.AlgebraicGeometry.SelfTransportTests.modification_naturality`: For every native modification m the action-functor maps commute with the natural transport components. -/
example (e : x ≅ y) {X Y : HomCategory b b} (m : X ⟶ Y) :
    (fibreIsomActionFunctor b b U x x).map m ≫ (selfTransportNatIso b e).hom.app Y =
      (selfTransportNatIso b e).hom.app X ≫ (fibreIsomActionFunctor b b U y y).map m := by
  sorry

-- test: SelfTransportTests.natural_composition
/-- `TauCeti.AlgebraicGeometry.SelfTransportTests.natural_composition`: Transport along e followed by f agrees as a native natural isomorphism with composing the two transports. -/
example (e : x ≅ y) (f : y ≅ z) :
    selfTransportNatIso b (e ≪≫ f) = selfTransportNatIso b e ≪≫ selfTransportNatIso b f := by
  sorry

-- test: SelfTransportTests.natural_independence
/-- `TauCeti.AlgebraicGeometry.SelfTransportTests.natural_independence`: Arbitrary e,f between the same objects produce equal native natural isomorphisms. -/
example (e f : x ≅ y) : selfTransportNatIso b e = selfTransportNatIso b f := by
  sorry

end SelfTransportTests

namespace BandedIsom
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  {J : GrothendieckTopology C} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U V W : C}

/-- Restriction of actual fibre isomorphisms is equivariant with respect to the band restriction homomorphism. -/
def restrictActionHom (f : V ⟶ U) (x y : F.obj (.mk (op U))) :
    fibreAction b x y ⟶
      (Action.res (Type v') (A.obj.map f.op).hom.toMultiplicative).obj
        (fibreAction b ((F.map f.op.toLoc).toFunctor.obj x)
          ((F.map f.op.toLoc).toFunctor.obj y)) where
  hom := TypeCat.ofHom ((F.map f.op.toLoc).toFunctor.mapIso)
  comm := by
    sorry

/-- The underlying function of restrictActionHom(b,f,x,y) sends p:x≅y to the actual mapped isomorphism F(f)(p). -/
theorem restrictActionHom_apply (f : V ⟶ U) (x y : F.obj (.mk (op U))) (p : x ≅ y) :
    (restrictActionHom b f x y).hom p = (F.map f.op.toLoc).toFunctor.mapIso p := by
  sorry

/-- For p:x≅y and q:y≅z, restriction of p followed by q equals the restriction of p followed by the restriction of q. -/
theorem restrictActionHom_postcompose (f : V ⟶ U) {x y z : F.obj (.mk (op U))}
    (p : x ≅ y) (q : y ≅ z) :
    (restrictActionHom b f x z).hom (p ≪≫ q) =
      (restrictActionHom b f x y).hom p ≪≫ (restrictActionHom b f y z).hom q := by
  sorry

/-- Restriction sends the actual identity isomorphism of x to the identity of F(f)x. -/
theorem restrictActionHom_refl (f : V ⟶ U) (x : F.obj (.mk (op U))) :
    (restrictActionHom b f x x).hom (Iso.refl x) = Iso.refl _ := by
  sorry

end BandedIsom

namespace BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J]
  {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable {U V W : C}

/-- Invert the strong-transformation comparison to identify the restriction of X(x) with X applied to the restriction of x. -/
def restrictionIso (X : HomCategory bF bG) (f : V ⟶ U) (x : F.obj (.mk (op U))) :
    (G.map f.op.toLoc).toFunctor.obj ((X.obj.app (.mk (op U))).toFunctor.obj x) ≅
      (X.obj.app (.mk (op V))).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj x) :=
  ((Cat.Hom.toNatIso (X.obj.naturality f.op.toLoc)).app x).symm

/-- Restrict an isomorphism and then apply the strong-transformation comparison, giving a semilinear map of band actions. -/
noncomputable def fibreIsomRestriction (X : HomCategory bF bG) (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    (fibreIsomActionFunctor bF bG U x y).obj X ⟶
      (Action.res (Type v') (A.obj.map f.op).hom.toMultiplicative).obj
        ((fibreIsomActionFunctor bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
          ((G.map f.op.toLoc).toFunctor.obj y)).obj X) :=
  BandedIsom.restrictActionHom bG f y _ ≫
    (Action.res (Type v') (A.obj.map f.op).hom.toMultiplicative).map
      (BandedIsom.postcomposeActionIso bG (restrictionIso bF bG X f x)).hom

/-- R(X,f,x,y)(p) is exactly G(f)(p) followed by c(X,f,x), on the original Isom carrier. -/
theorem fibreIsomRestriction_apply (X : HomCategory bF bG) (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U)))
    (p : y ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    (fibreIsomRestriction bF bG X f x y).hom p =
      (G.map f.op.toLoc).toFunctor.mapIso p ≪≫ restrictionIso bF bG X f x := by
  sorry

/-- For a native modification m:X→Y, G(f)(componentIso(m,U,x)) followed by c(Y,f,x) equals c(X,f,x) followed by componentIso(m,V,F(f)x). -/
theorem restrictionIso_modification {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (f : V ⟶ U) (x : F.obj (.mk (op U))) :
    (G.map f.op.toLoc).toFunctor.mapIso (componentIso bF bG m U x) ≪≫
      restrictionIso bF bG Y f x =
    restrictionIso bF bG X f x ≪≫
      componentIso bF bG m V ((F.map f.op.toLoc).toFunctor.obj x) := by
  sorry

/-- Semilinear restriction of fibre isomorphisms is natural in modifications of band-preserving morphisms. -/
noncomputable def fibreIsomRestrictionNatTrans (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    fibreIsomActionFunctor bF bG U x y ⟶
      fibreIsomActionFunctor bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
        ((G.map f.op.toLoc).toFunctor.obj y) ⋙
        Action.res (Type v') (A.obj.map f.op).hom.toMultiplicative where
  app X := fibreIsomRestriction bF bG X f x y
  naturality X Y m := by
    sorry

/-- The component of fibreIsomRestrictionNatTrans(f,x,y) at X is the native equivariant map R(X,f,x,y). -/
theorem fibreIsomRestrictionNatTrans_app (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) (X : HomCategory bF bG) :
    (fibreIsomRestrictionNatTrans bF bG f x y).app X =
      fibreIsomRestriction bF bG X f x y := by
  sorry

/-- For every m:X→Y, first applying the U-fibre action functor to m and then R(Y,f) equals R(X,f) followed by Action.res(A(f)) applied to the V-fibre action functor on m. This is equality of native Action.Hom arrows. -/
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

end BandedMorphism

namespace BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable {U V W : C}

/-- For e:x≅x′, G(f)(X(U)(e)) followed by c(X,f,x′) equals c(X,f,x) followed by X(V)(F(f)(e)). -/
theorem restrictionIso_naturality (X : HomCategory bF bG) (f : V ⟶ U)
    {x x' : F.obj (.mk (op U))} (e : x ≅ x') :
    (G.map f.op.toLoc).toFunctor.mapIso ((X.obj.app (.mk (op U))).toFunctor.mapIso e) ≪≫
      restrictionIso bF bG X f x' =
    restrictionIso bF bG X f x ≪≫
      (X.obj.app (.mk (op V))).toFunctor.mapIso ((F.map f.op.toLoc).toFunctor.mapIso e) := by
  sorry

/-- For f=id_U, c(X,f,x) equals the G.mapId component at X(U)x followed by X(U) applied to the inverse F.mapId component at x. Neither unit comparison is discarded. -/
theorem restrictionIso_id (X : HomCategory bF bG) (x : F.obj (.mk (op U))) :
    restrictionIso bF bG X (𝟙 U) x =
      (Cat.Hom.toNatIso (G.mapId (.mk (op U)))).app
        ((X.obj.app (.mk (op U))).toFunctor.obj x) ≪≫
      (X.obj.app (.mk (op U))).toFunctor.mapIso
        ((Cat.Hom.toNatIso (F.mapId (.mk (op U)))).app x).symm := by
  sorry

/-- For f:V→U and g:W→V, c(X,g≫f,x) is G.mapComp(f,g) at X(U)x, then G(g)(c(X,f,x)), then c(X,g,F(f)x), then X(W) of the inverse F.mapComp(f,g) at x. -/
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

/-- R(X,id_U,x,y)(p) equals the G.mapId component at y followed by p and then X(U) of the inverse F.mapId component at x. -/
theorem fibreIsomRestriction_id (X : HomCategory bF bG)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U)))
    (p : y ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    (fibreIsomRestriction bF bG X (𝟙 U) x y).hom p =
      (Cat.Hom.toNatIso (G.mapId (.mk (op U)))).app y ≪≫ p ≪≫
      (X.obj.app (.mk (op U))).toFunctor.mapIso
        ((Cat.Hom.toNatIso (F.mapId (.mk (op U)))).app x).symm := by
  sorry

/-- R(X,g≫f,x,y)(p) equals the G.mapComp(f,g) component at y, then R(X,g,F(f)x,G(f)y)(R(X,f,x,y)(p)), then X(W) of the inverse F.mapComp(f,g) component at x. -/
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

end BandedMorphism

namespace BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)
variable {U V : C}

/-- Choice-independent simultaneous self-Hom transport commutes with base restriction and the band restriction homomorphism. -/
theorem selfTransportActionIso_restriction (X : HomCategory b b) (f : V ⟶ U)
    {x x' : F.obj (.mk (op U))} (e : x ≅ x') :
    (selfTransportActionIso b X e).hom ≫ fibreIsomRestriction b b X f x' x' =
      fibreIsomRestriction b b X f x x ≫
        (Action.res (Type v') (A.obj.map f.op).hom.toMultiplicative).map
          (selfTransportActionIso b X ((F.map f.op.toLoc).toFunctor.mapIso e)).hom := by
  sorry

/-- The natural isomorphism selfTransportNatIso(e), followed by the restriction transformation at x′, equals the restriction transformation at x followed by the right whiskering of selfTransportNatIso(F(f)(e)) with Action.res(A(f)). -/
theorem selfTransportNatIso_restriction (f : V ⟶ U)
    {x x' : F.obj (.mk (op U))} (e : x ≅ x') :
    (selfTransportNatIso b e).hom ≫ fibreIsomRestrictionNatTrans b b f x' x' =
      fibreIsomRestrictionNatTrans b b f x x ≫
        Functor.whiskerRight (selfTransportNatIso b ((F.map f.op.toLoc).toFunctor.mapIso e)).hom
          (Action.res (Type v') (A.obj.map f.op).hom.toMultiplicative) := by
  sorry

end BandedMorphism

namespace RestrictionActionTests
open CategoryTheory Opposite Bicategory BandedIsom BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable {U V W : C} (f : V ⟶ U) (g : W ⟶ V)

-- test: RestrictionActionTests.empty_source
/-- `TauCeti.AlgebraicGeometry.RestrictionActionTests.empty_source`: An empty source Isom set still admits the constructed equivariant restriction arrow; the constructor requires no global section. -/
example (x y : F.obj (.mk (op U))) (h : IsEmpty (x ≅ y)) :
    IsEmpty (fibreAction bF x y).V ∧ Nonempty
      (fibreAction bF x y ⟶
        (Action.res (Type v') (A.obj.map f.op).hom.toMultiplicative).obj
          (fibreAction bF ((F.map f.op.toLoc).toFunctor.obj x)
            ((F.map f.op.toLoc).toFunctor.obj y))) := by
  sorry

-- test: RestrictionActionTests.band_coefficient
/-- `TauCeti.AlgebraicGeometry.RestrictionActionTests.band_coefficient`: Restriction of p followed by b_y(a) equals restricted p followed by the target band evaluated at the actual coefficient A(f)(a). -/
example (x y : F.obj (.mk (op U))) (p : x ≅ y)
    (a : Multiplicative (A.obj.obj (op U))) :
    (restrictActionHom bF f x y).hom (p ≪≫ bF.autEquiv U y a) =
      (restrictActionHom bF f x y).hom p ≪≫
        bF.autEquiv V ((F.map f.op.toLoc).toFunctor.obj y)
          ((A.obj.map f.op).hom.toMultiplicative a) := by
  sorry

-- test: RestrictionActionTests.restricted_unit
/-- `TauCeti.AlgebraicGeometry.RestrictionActionTests.restricted_unit`: Restricting the identity isomorphism gives the identity of the pulled-back object. -/
example (x : F.obj (.mk (op U))) :
    (restrictActionHom bF f x x).hom (Iso.refl x) = Iso.refl _ := by
  sorry

-- test: RestrictionActionTests.comparison_roundtrip
/-- `TauCeti.AlgebraicGeometry.RestrictionActionTests.comparison_roundtrip`: The inverse strong comparison followed by the original native comparison component is the identity. -/
example (X : HomCategory bF bG) (x : F.obj (.mk (op U))) :
    restrictionIso bF bG X f x ≪≫
      (Cat.Hom.toNatIso (X.obj.naturality f.op.toLoc)).app x = Iso.refl _ := by
  sorry

-- test: RestrictionActionTests.comparison_identity
/-- `TauCeti.AlgebraicGeometry.RestrictionActionTests.comparison_identity`: The identity-arrow comparison retains both G.mapId and the inverse F.mapId component. -/
example (X : HomCategory bF bG) (x : F.obj (.mk (op U))) :
    restrictionIso bF bG X (𝟙 U) x =
      (Cat.Hom.toNatIso (G.mapId (.mk (op U)))).app
        ((X.obj.app (.mk (op U))).toFunctor.obj x) ≪≫
      (X.obj.app (.mk (op U))).toFunctor.mapIso
        ((Cat.Hom.toNatIso (F.mapId (.mk (op U)))).app x).symm := by
  sorry

-- test: RestrictionActionTests.comparison_composition
/-- `TauCeti.AlgebraicGeometry.RestrictionActionTests.comparison_composition`: On two composable site arrows, the strong comparison includes G.mapComp, both intermediate comparisons and the inverse F.mapComp. -/
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
/-- `TauCeti.AlgebraicGeometry.RestrictionActionTests.actual_transport`: The constructed native Action.Hom sends p to G(f)(p) followed by the inverse strong comparison. -/
example (X : HomCategory bF bG) (x : F.obj (.mk (op U)))
    (y : G.obj (.mk (op U))) (p : y ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    (fibreIsomRestriction bF bG X f x y).hom p =
      (G.map f.op.toLoc).toFunctor.mapIso p ≪≫ restrictionIso bF bG X f x := by
  sorry

-- test: RestrictionActionTests.semilinear_transport
/-- `TauCeti.AlgebraicGeometry.RestrictionActionTests.semilinear_transport`: Transport of p acted on by a equals transported p acted on by A(f)(a), at the changed target X(V)(F(f)x). -/
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
/-- `TauCeti.AlgebraicGeometry.RestrictionActionTests.transport_identity`: Restricting along the identity uses the two endpoint identifications; it does not assert an ill-typed strict identity. -/
example (X : HomCategory bF bG) (x : F.obj (.mk (op U)))
    (y : G.obj (.mk (op U))) (p : y ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    (fibreIsomRestriction bF bG X (𝟙 U) x y).hom p =
      (Cat.Hom.toNatIso (G.mapId (.mk (op U)))).app y ≪≫ p ≪≫
      (X.obj.app (.mk (op U))).toFunctor.mapIso
        ((Cat.Hom.toNatIso (F.mapId (.mk (op U)))).app x).symm := by
  sorry

-- test: RestrictionActionTests.natural_component
/-- `TauCeti.AlgebraicGeometry.RestrictionActionTests.natural_component`: The component at X is the actual equivariant fibre restriction, with unchanged source Isom carrier. -/
example (X : HomCategory bF bG) (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    (fibreIsomRestrictionNatTrans bF bG f x y).app X =
      fibreIsomRestriction bF bG X f x y := by
  sorry

-- test: RestrictionActionTests.modification_square
/-- `TauCeti.AlgebraicGeometry.RestrictionActionTests.modification_square`: A native modification commutes with the restriction transformation as an equality of native equivariant maps. -/
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
/-- `TauCeti.AlgebraicGeometry.RestrictionActionTests.inverse_modification_square`: The same restriction square holds for the native inverse modification, with both component isomorphisms inverted. -/
example {X Y : HomCategory bF bG} (m : X ⟶ Y) (x : F.obj (.mk (op U))) :
    (G.map f.op.toLoc).toFunctor.mapIso (componentIso bF bG m U x).symm ≪≫
      restrictionIso bF bG X f x =
    restrictionIso bF bG Y f x ≪≫
      (componentIso bF bG m V ((F.map f.op.toLoc).toFunctor.obj x)).symm := by
  sorry

end RestrictionActionTests

namespace RestrictionActionTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)
variable {U V : C}

-- test: RestrictionActionTests.local_object_square
/-- `TauCeti.AlgebraicGeometry.RestrictionActionTests.local_object_square`: The complete natural-transformation square for changing a local object commutes after action restriction. -/
example (f : V ⟶ U) {x x' : F.obj (.mk (op U))} (e : x ≅ x') :
    (selfTransportNatIso b e).hom ≫ fibreIsomRestrictionNatTrans b b f x' x' =
      fibreIsomRestrictionNatTrans b b f x x ≫
        Functor.whiskerRight (selfTransportNatIso b ((F.map f.op.toLoc).toFunctor.mapIso e)).hom
          (Action.res (Type v') (A.obj.map f.op).hom.toMultiplicative) := by
  sorry

-- test: RestrictionActionTests.restricted_choice_independence
/-- `TauCeti.AlgebraicGeometry.RestrictionActionTests.restricted_choice_independence`: Two connecting local isomorphisms e,e′ give the same restricted equivariant self-transport map. -/
example (X : HomCategory b b) (f : V ⟶ U)
    {x x' : F.obj (.mk (op U))} (e e' : x ≅ x') :
    (Action.res (Type v') (A.obj.map f.op).hom.toMultiplicative).map
        (selfTransportActionIso b X ((F.map f.op.toLoc).toFunctor.mapIso e)).hom =
      (Action.res (Type v') (A.obj.map f.op).hom.toMultiplicative).map
        (selfTransportActionIso b X ((F.map f.op.toLoc).toFunctor.mapIso e')).hom := by
  sorry

end RestrictionActionTests

namespace BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable (U : C) (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U)))

/-- The native slice Hom sheaf from y to the image of x under the specified gerbe morphism. -/
def fibreHomSheaf (X : HomCategory bF bG) : Sheaf (J.over U) (Type v') :=
  G.sheafHom J y ((X.obj.app (.mk (op U))).toFunctor.obj x)

/-- Every section of the slice Hom sheaf is an actual isomorphism in the restricted groupoid fibre, and conversely. -/
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

/-- Postcompose slice arrows with the restricted component of a modification, giving a natural morphism of Hom sheaves. -/
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

/-- H(m)_t(p)=p followed by G(t)(m_U(x)), with p on the original Hom carrier. -/
theorem fibreHomSheafMap_apply {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (T : Over U) (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomSheafMap bF bG U x y m).hom.app (op T) p =
      p ≫ (G.map T.hom.op.toLoc).toFunctor.map
        ((m.hom.as.app (.mk (op U))).toNatTrans.app x) := by
  sorry

/-- The slice Hom sheaf varies functorially with a band-preserving gerbe morphism and every modification. -/
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

/-- The hom of sectionIsoEquiv(p) is exactly p. -/
theorem fibreHomSectionIsoEquiv_hom (X : HomCategory bF bG) (T : Over U)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomSectionIsoEquiv bF bG U x y X T p).hom = p := by
  sorry

/-- The image of X under fibreHomSheafFunctor is exactly G.sheafHom(J,y,X_U(x)). -/
theorem fibreHomSheafFunctor_obj (X : HomCategory bF bG) :
    (fibreHomSheafFunctor bF bG U x y).obj X =
      G.sheafHom J y ((X.obj.app (.mk (op U))).toFunctor.obj x) := by
  sorry

/-- The image of m is exactly the constructed sheaf map H(m). -/
theorem fibreHomSheafFunctor_map {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (fibreHomSheafFunctor bF bG U x y).map m =
      fibreHomSheafMap bF bG U x y m := by
  sorry

/-- A modification induces an isomorphism of slice Hom sheaves; its inverse is induced by the inverse modification. -/
noncomputable def fibreHomSheafMapIso {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    fibreHomSheaf bF bG U x y X ≅ fibreHomSheaf bF bG U x y Y :=
  (fibreHomSheafFunctor bF bG U x y).mapIso (homIso bF bG m)

/-- The hom of fibreHomSheafMapIso(m) is H(m). -/
theorem fibreHomSheafMapIso_hom {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (fibreHomSheafMapIso bF bG U x y m).hom =
      fibreHomSheafMap bF bG U x y m := by
  sorry

/-- The inverse of fibreHomSheafMapIso(m) is H(homIso(m).inv), an actual sheaf map. -/
theorem fibreHomSheafMapIso_inv {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (fibreHomSheafMapIso bF bG U x y m).inv =
      fibreHomSheafMap bF bG U x y (homIso bF bG m).inv := by
  sorry

/-- For every t:T→U there is a sieve R∈J(T) such that for every g:V→T in R the actual set H_X(g followed by t) is nonempty. This asserts local sections and does not assert a global section of H_X. -/
theorem fibreHomSheaf_locallyNonempty (X : HomCategory bF bG) (T : Over U) :
    ∃ R : Sieve T.left, R ∈ J T.left ∧
      ∀ ⦃V : C⦄ (g : V ⟶ T.left), R g →
        Nonempty ((fibreHomSheaf bF bG U x y X).obj.obj
          (op (Over.mk (g ≫ T.hom)))) := by
  sorry

/-- Sections of the slice Hom sheaf carry the action of the band at the slice domain by postcomposition. -/
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

/-- The native section action sends (a,p) to p followed by bG(a).hom at the pulled-back target object. -/
theorem fibreHomSectionAction_apply (X : HomCategory bF bG) (T : Over U)
    (a : Multiplicative (A.obj.obj (op T.left)))
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    ((fibreHomSectionAction bF bG U x y X T).ρ a).hom p = p ≫
      (bG.autEquiv T.left ((G.map T.hom.op.toLoc).toFunctor.obj
        ((X.obj.app (.mk (op U))).toFunctor.obj x)) a).hom := by
  sorry

/-- For any p,q∈H_X(t) there exists exactly one a∈Multiplicative A(T) with a acting on p equal to q. The assertion is conditional on the two given sections and allows H_X(t) itself to be empty. -/
theorem fibreHomSectionAction_freeTransitive (X : HomCategory bF bG) (T : Over U)
    (p q : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    ∃! a : Multiplicative (A.obj.obj (op T.left)),
      ((fibreHomSectionAction bF bG U x y X T).ρ a).hom p = q := by
  sorry

/-- For every t, a and p, H(m)_t(a acting on p)=a acting on H(m)_t(p). The same actual coefficient a is used at the two target objects. -/
theorem fibreHomSheafMap_equivariant {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (T : Over U) (a : Multiplicative (A.obj.obj (op T.left)))
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomSheafMap bF bG U x y m).hom.app (op T)
        (((fibreHomSectionAction bF bG U x y X T).ρ a).hom p) =
      ((fibreHomSectionAction bF bG U x y Y T).ρ a).hom
        ((fibreHomSheafMap bF bG U x y m).hom.app (op T) p) := by
  sorry

/-- For an Over-arrow f:t1→t2 with underlying g:T1→T2, restricting a acting on p∈H_X(t2) equals A(g)(a) acting on the restricted p∈H_X(t1). The restrictions are the native pullHom functions, including both flexible composition comparisons. -/
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

/-- Identify a Hom-sheaf section with an isomorphism to the image of the restricted source, using the strong-transformation comparison. -/
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

/-- The transport equivalence sends p to sectionIsoEquiv(p) followed by restrictionIso(X,t,x). -/
theorem fibreHomTransportIsoEquiv_apply (X : HomCategory bF bG) (T : Over U)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    fibreHomTransportIsoEquiv bF bG U x y X T p =
      fibreHomSectionIsoEquiv bF bG U x y X T p ≪≫
        restrictionIso bF bG X T.hom x := by
  sorry

/-- Converting H(m)_t(p) to the transported Y Isom equals the transported X Isom of p followed by componentIso(m,T,F(t)x). This identifies the sheaf functor maps with the preceding native fibre-Isom modification maps. -/
theorem fibreHomTransportIsoEquiv_modification {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (T : Over U) (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    fibreHomTransportIsoEquiv bF bG U x y Y T
        ((fibreHomSheafMap bF bG U x y m).hom.app (op T) p) =
      fibreHomTransportIsoEquiv bF bG U x y X T p ≪≫
        componentIso bF bG m T.left ((F.map T.hom.op.toLoc).toFunctor.obj x) := by
  sorry

/-- The underlying presheaf of H_X is exactly G.presheafHom(y,X_U(x)). -/
theorem fibreHomSheaf_obj (X : HomCategory bF bG) :
    (fibreHomSheaf bF bG U x y X).obj =
      G.presheafHom y ((X.obj.app (.mk (op U))).toFunctor.obj x) := by
  sorry

/-- H_X satisfies the actual Presheaf.IsSheaf condition for J.over U. -/
theorem fibreHomSheaf_isSheaf (X : HomCategory bF bG) :
    Presheaf.IsSheaf (J.over U) (fibreHomSheaf bF bG U x y X).obj := by
  sorry

/-- The inverse section/isomorphism conversion sends q to its actual hom arrow. -/
theorem fibreHomSectionIsoEquiv_symm_apply (X : HomCategory bF bG) (T : Over U)
    (q : (G.map T.hom.op.toLoc).toFunctor.obj y ≅
      (G.map T.hom.op.toLoc).toFunctor.obj ((X.obj.app (.mk (op U))).toFunctor.obj x)) :
    (fibreHomSectionIsoEquiv bF bG U x y X T).symm q = q.hom := by
  sorry

/-- Converting q.hom back to an isomorphism recovers q. -/
theorem fibreHomSectionIsoEquiv_apply_symm_apply (X : HomCategory bF bG) (T : Over U)
    (q : (G.map T.hom.op.toLoc).toFunctor.obj y ≅
      (G.map T.hom.op.toLoc).toFunctor.obj ((X.obj.app (.mk (op U))).toFunctor.obj x)) :
    fibreHomSectionIsoEquiv bF bG U x y X T
      ((fibreHomSectionIsoEquiv bF bG U x y X T).symm q) = q := by
  sorry

/-- H(identity X) is the identity sheaf arrow of H_X. -/
theorem fibreHomSheafMap_id (X : HomCategory bF bG) :
    fibreHomSheafMap bF bG U x y (𝟙 X) = 𝟙 (fibreHomSheaf bF bG U x y X) := by
  sorry

/-- The image of m followed by n is H(m) followed by H(n), in native Sheaf arrows. -/
theorem fibreHomSheafFunctor_map_comp {X Y Z : HomCategory bF bG}
    (m : X ⟶ Y) (n : Y ⟶ Z) :
    (fibreHomSheafFunctor bF bG U x y).map (m ≫ n) =
      (fibreHomSheafFunctor bF bG U x y).map m ≫
        (fibreHomSheafFunctor bF bG U x y).map n := by
  sorry

/-- The forward sheaf isomorphism of m followed by its inverse is the identity. -/
theorem fibreHomSheafMapIso_hom_inv_id {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (fibreHomSheafMapIso bF bG U x y m).hom ≫
      (fibreHomSheafMapIso bF bG U x y m).inv = 𝟙 _ := by
  sorry

/-- The inverse transported comparison sends q to the hom of q followed by the inverse strong restriction comparison. -/
theorem fibreHomTransportIsoEquiv_symm_apply (X : HomCategory bF bG) (T : Over U)
    (q : (G.map T.hom.op.toLoc).toFunctor.obj y ≅
      (X.obj.app (.mk (op T.left))).toFunctor.obj
        ((F.map T.hom.op.toLoc).toFunctor.obj x)) :
    (fibreHomTransportIsoEquiv bF bG U x y X T).symm q =
      (q ≪≫ (restrictionIso bF bG X T.hom x).symm).hom := by
  sorry

end BandedMorphism

namespace SheafAssemblyTests
open CategoryTheory Opposite Bicategory
open TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable (U : C) (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U)))
-- test: SheafAssemblyTests.actual_hom_sheaf
/-- `TauCeti.AlgebraicGeometry.SheafAssemblyTests.actual_hom_sheaf`: The underlying presheaf is exactly the existing G.presheafHom, rather than a wrapper assumed to satisfy descent. -/
example (X : HomCategory bF bG) :
    (fibreHomSheaf bF bG U x y X).obj =
      G.presheafHom y ((X.obj.app (.mk (op U))).toFunctor.obj x) := by
  sorry

-- test: SheafAssemblyTests.local_sections
/-- `TauCeti.AlgebraicGeometry.SheafAssemblyTests.local_sections`: Over every actual slice object there is a covering sieve with a section over each composite restriction. -/
example (X : HomCategory bF bG) (T : Over U) :
    ∃ R : Sieve T.left, R ∈ J T.left ∧
      ∀ ⦃V : C⦄ (g : V ⟶ T.left), R g →
        Nonempty ((fibreHomSheaf bF bG U x y X).obj.obj
          (op (Over.mk (g ≫ T.hom)))) := by
  sorry

-- test: SheafAssemblyTests.iso_roundtrip
/-- `TauCeti.AlgebraicGeometry.SheafAssemblyTests.iso_roundtrip`: Sending an actual Hom section to its isomorphism and back recovers the section. -/
example (X : HomCategory bF bG) (T : Over U)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomSectionIsoEquiv bF bG U x y X T).symm
      (fibreHomSectionIsoEquiv bF bG U x y X T p) = p := by
  sorry

-- test: SheafAssemblyTests.iso_inverse_roundtrip
/-- `TauCeti.AlgebraicGeometry.SheafAssemblyTests.iso_inverse_roundtrip`: The reverse Hom/isomorphism conversion recovers every actual isomorphism. -/
example (X : HomCategory bF bG) (T : Over U)
    (q : (G.map T.hom.op.toLoc).toFunctor.obj y ≅
      (G.map T.hom.op.toLoc).toFunctor.obj ((X.obj.app (.mk (op U))).toFunctor.obj x)) :
    fibreHomSectionIsoEquiv bF bG U x y X T
      ((fibreHomSectionIsoEquiv bF bG U x y X T).symm q) = q := by
  sorry

-- test: SheafAssemblyTests.actual_modification
/-- `TauCeti.AlgebraicGeometry.SheafAssemblyTests.actual_modification`: The sheaf map postcomposes p with the pulled-back actual component m_U(x). -/
example {X Y : HomCategory bF bG} (m : X ⟶ Y) (T : Over U)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomSheafMap bF bG U x y m).hom.app (op T) p =
      p ≫ (G.map T.hom.op.toLoc).toFunctor.map
        ((m.hom.as.app (.mk (op U))).toNatTrans.app x) := by
  sorry

-- test: SheafAssemblyTests.modification_restriction
/-- `TauCeti.AlgebraicGeometry.SheafAssemblyTests.modification_restriction`: The map on an actual modification commutes with every Over-site restriction as an equality of native Type arrows. -/
example {X Y : HomCategory bF bG} (m : X ⟶ Y)
    {T₁ T₂ : (Over U)ᵒᵖ} (f : T₁ ⟶ T₂) :
    (fibreHomSheaf bF bG U x y X).obj.map f ≫
      (fibreHomSheafMap bF bG U x y m).hom.app T₂ =
      (fibreHomSheafMap bF bG U x y m).hom.app T₁ ≫
        (fibreHomSheaf bF bG U x y Y).obj.map f := by
  sorry

-- test: SheafAssemblyTests.identity_functor
/-- `TauCeti.AlgebraicGeometry.SheafAssemblyTests.identity_functor`: The identity modification gives the identity of the actual sheaf. -/
example (X : HomCategory bF bG) :
    (fibreHomSheafFunctor bF bG U x y).map (𝟙 X) = 𝟙 _ := by
  sorry

-- test: SheafAssemblyTests.composed_modifications
/-- `TauCeti.AlgebraicGeometry.SheafAssemblyTests.composed_modifications`: Two native modifications give the composite of their two sheaf maps. -/
example {X Y Z : HomCategory bF bG} (m : X ⟶ Y) (n : Y ⟶ Z) :
    (fibreHomSheafFunctor bF bG U x y).map (m ≫ n) =
      (fibreHomSheafFunctor bF bG U x y).map m ≫
        (fibreHomSheafFunctor bF bG U x y).map n := by
  sorry

-- test: SheafAssemblyTests.functor_carrier
/-- `TauCeti.AlgebraicGeometry.SheafAssemblyTests.functor_carrier`: The functor object is the precise existing Hom sheaf. -/
example (X : HomCategory bF bG) :
    (fibreHomSheafFunctor bF bG U x y).obj X =
      G.sheafHom J y ((X.obj.app (.mk (op U))).toFunctor.obj x) := by
  sorry

-- test: SheafAssemblyTests.inverse_modification
/-- `TauCeti.AlgebraicGeometry.SheafAssemblyTests.inverse_modification`: The inverse sheaf map is obtained from the native inverse modification. -/
example {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (fibreHomSheafMapIso bF bG U x y m).inv =
      fibreHomSheafMap bF bG U x y (homIso bF bG m).inv := by
  sorry

-- test: SheafAssemblyTests.inverse_modification_roundtrip
/-- `TauCeti.AlgebraicGeometry.SheafAssemblyTests.inverse_modification_roundtrip`: The actual forward and inverse modification sheaf maps compose to the identity. -/
example {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (fibreHomSheafMapIso bF bG U x y m).hom ≫
      (fibreHomSheafMapIso bF bG U x y m).inv = 𝟙 _ := by
  sorry

-- test: SheafAssemblyTests.empty_sections_allowed
/-- `TauCeti.AlgebraicGeometry.SheafAssemblyTests.empty_sections_allowed`: A conditionally empty Hom section carrier still has the constructed band action, with no nonemptiness hypothesis. -/
example (X : HomCategory bF bG) (T : Over U)
    (h : IsEmpty ((fibreHomSheaf bF bG U x y X).obj.obj (op T))) :
    IsEmpty (fibreHomSectionAction bF bG U x y X T).V := by
  sorry

-- test: SheafAssemblyTests.unique_band_difference
/-- `TauCeti.AlgebraicGeometry.SheafAssemblyTests.unique_band_difference`: Any two actual sections have a unique band coefficient relating them. -/
example (X : HomCategory bF bG) (T : Over U)
    (p q : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    ∃! a : Multiplicative (A.obj.obj (op T.left)),
      ((fibreHomSectionAction bF bG U x y X T).ρ a).hom p = q := by
  sorry

-- test: SheafAssemblyTests.semilinear_restriction
/-- `TauCeti.AlgebraicGeometry.SheafAssemblyTests.semilinear_restriction`: The actual pullHom restriction transports the coefficient along A(g); both endpoint composition comparisons remain. -/
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
/-- `TauCeti.AlgebraicGeometry.SheafAssemblyTests.modification_equivariance`: The actual modification section map respects the band action at both target objects. -/
example {X Y : HomCategory bF bG} (m : X ⟶ Y) (T : Over U)
    (a : Multiplicative (A.obj.obj (op T.left)))
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomSheafMap bF bG U x y m).hom.app (op T)
        (((fibreHomSectionAction bF bG U x y X T).ρ a).hom p) =
      ((fibreHomSectionAction bF bG U x y Y T).ρ a).hom
        ((fibreHomSheafMap bF bG U x y m).hom.app (op T) p) := by
  sorry

-- test: SheafAssemblyTests.transport_roundtrip
/-- `TauCeti.AlgebraicGeometry.SheafAssemblyTests.transport_roundtrip`: The transported Hom/Isom comparison and its stated inverse recover a section. -/
example (X : HomCategory bF bG) (T : Over U)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomTransportIsoEquiv bF bG U x y X T).symm
      (fibreHomTransportIsoEquiv bF bG U x y X T p) = p := by
  sorry

-- test: SheafAssemblyTests.transport_modification
/-- `TauCeti.AlgebraicGeometry.SheafAssemblyTests.transport_modification`: The transported sheaf modification map agrees with the native modification component at the restricted source object. -/
example {X Y : HomCategory bF bG} (m : X ⟶ Y) (T : Over U)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    fibreHomTransportIsoEquiv bF bG U x y Y T
        ((fibreHomSheafMap bF bG U x y m).hom.app (op T) p) =
      fibreHomTransportIsoEquiv bF bG U x y X T p ≪≫
        componentIso bF bG m T.left ((F.map T.hom.op.toLoc).toFunctor.obj x) := by
  sorry

-- test: SheafAssemblyTests.actual_sheaf_property
/-- `TauCeti.AlgebraicGeometry.SheafAssemblyTests.actual_sheaf_property`: The constructed native carrier satisfies the actual Presheaf.IsSheaf condition on the Over topology. -/
example (X : HomCategory bF bG) :
    Presheaf.IsSheaf (J.over U) (fibreHomSheaf bF bG U x y X).obj := by
  sorry

-- test: SheafAssemblyTests.iso_actual_arrow
/-- `TauCeti.AlgebraicGeometry.SheafAssemblyTests.iso_actual_arrow`: The isomorphism conversion retains exactly the original section arrow. -/
example (X : HomCategory bF bG) (T : Over U)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomSectionIsoEquiv bF bG U x y X T p).hom = p := by
  sorry

-- test: SheafAssemblyTests.identity_section_map
/-- `TauCeti.AlgebraicGeometry.SheafAssemblyTests.identity_section_map`: The identity modification map fixes every section over every slice object. -/
example (X : HomCategory bF bG) (T : Over U)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomSheafMap bF bG U x y (𝟙 X)).hom.app (op T) p = p := by
  sorry

-- test: SheafAssemblyTests.forward_modification
/-- `TauCeti.AlgebraicGeometry.SheafAssemblyTests.forward_modification`: The isomorphism forward arrow is the actual modification sheaf map. -/
example {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (fibreHomSheafMapIso bF bG U x y m).hom =
      fibreHomSheafMap bF bG U x y m := by
  sorry

-- test: SheafAssemblyTests.inverse_transport_formula
/-- `TauCeti.AlgebraicGeometry.SheafAssemblyTests.inverse_transport_formula`: The inverse transported comparison is postcomposition by the inverse strong restriction comparison, followed by hom. -/
example (X : HomCategory bF bG) (T : Over U)
    (q : (G.map T.hom.op.toLoc).toFunctor.obj y ≅
      (X.obj.app (.mk (op T.left))).toFunctor.obj
        ((F.map T.hom.op.toLoc).toFunctor.obj x)) :
    (fibreHomTransportIsoEquiv bF bG U x y X T).symm q =
      (q ≪≫ (restrictionIso bF bG X T.hom x).symm).hom := by
  sorry

end SheafAssemblyTests

namespace BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U : C} {x x' x'' : F.obj (.mk (op U))}
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

/-- Conjugate both endpoints of self-Hom sections along x ≅ x′. The result is independent of that isomorphism. -/
def selfHomSheafTransport (X : HomCategory b b) (e : x ≅ x') :
    fibreHomSheaf b b U x x X ⟶ fibreHomSheaf b b U x' x' X where
  hom :=
    { app := fun T => TypeCat.ofHom (fun p =>
        (F.map T.unop.hom.op.toLoc).toFunctor.map e.inv ≫ p ≫
        (F.map T.unop.hom.op.toLoc).toFunctor.map
          ((X.obj.app (.mk (op U))).toFunctor.map e.hom))
      naturality := by sorry }

/-- T_e at t sends p to F(t)(e⁻¹) ≫ p ≫ F(t)(X_U(e)), with the original Hom section carrier retained. -/
theorem selfHomSheafTransport_apply (X : HomCategory b b) (e : x ≅ x')
    (T : Over U) (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    (selfHomSheafTransport b X e).hom.app (op T) p =
      (F.map T.hom.op.toLoc).toFunctor.map e.inv ≫ p ≫
      (F.map T.hom.op.toLoc).toFunctor.map
        ((X.obj.app (.mk (op U))).toFunctor.map e.hom) := by
  sorry

/-- For every X, T_id_x is the identity morphism of H_x(X). -/
theorem selfHomSheafTransport_id (X : HomCategory b b) :
    selfHomSheafTransport b X (Iso.refl x) = 𝟙 _ := by
  sorry

/-- For e:x≅x′ and f:x′≅x″, T_(e followed by f)=T_e followed by T_f as actual sheaf morphisms. -/
theorem selfHomSheafTransport_comp (X : HomCategory b b) (e : x ≅ x') (f : x' ≅ x'') :
    selfHomSheafTransport b X (e ≪≫ f) =
      selfHomSheafTransport b X e ≫ selfHomSheafTransport b X f := by
  sorry

/-- Choice-independent simultaneous endpoint transport is an isomorphism of self-Hom sheaves. -/
def selfHomSheafTransportIso (X : HomCategory b b) (e : x ≅ x') :
    fibreHomSheaf b b U x x X ≅ fibreHomSheaf b b U x' x' X where
  hom := selfHomSheafTransport b X e
  inv := selfHomSheafTransport b X e.symm
  hom_inv_id := by sorry
  inv_hom_id := by sorry

/-- The sectionwise simultaneous transport formula agrees with conjugation of the corresponding actual restricted isomorphism. -/
theorem selfHomSheafTransport_transport (X : HomCategory b b) (e : x ≅ x')
    (T : Over U) (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    fibreHomTransportIsoEquiv b b U x' x' X T
        ((selfHomSheafTransport b X e).hom.app (op T) p) =
      (selfTransportActionIso b X ((F.map T.hom.op.toLoc).toFunctor.mapIso e)).hom.hom
        (fibreHomTransportIsoEquiv b b U x x X T p) := by
  sorry

/-- For any two isomorphisms e,f:x≅x′, T_e=T_f as actual sheaf morphisms. No isomorphism is chosen globally, and existence of one is not asserted. -/
theorem selfHomSheafTransport_independent (X : HomCategory b b) (e f : x ≅ x') :
    selfHomSheafTransport b X e = selfHomSheafTransport b X f := by
  sorry

/-- For a∈Multiplicative A(T) and p∈H_x(X)(t), T_e(a acting on p)=a acting on T_e(p). The coefficient universe w is independent of the fibre-hom universe v′, and no section nonemptiness is assumed. -/
theorem selfHomSheafTransport_equivariant (X : HomCategory b b) (e : x ≅ x')
    (T : Over U) (a : Multiplicative (A.obj.obj (op T.left)))
    (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    (selfHomSheafTransport b X e).hom.app (op T)
        (((fibreHomSectionAction b b U x x X T).ρ a).hom p) =
      ((fibreHomSectionAction b b U x' x' X T).ρ a).hom
        ((selfHomSheafTransport b X e).hom.app (op T) p) := by
  sorry

/-- Simultaneous endpoint transport of self-Hom sheaves is a natural isomorphism in band-preserving endomorphisms. -/
noncomputable def selfHomSheafTransportNatIso (e : x ≅ x') :
    fibreHomSheafFunctor b b U x x ≅ fibreHomSheafFunctor b b U x' x' :=
  NatIso.ofComponents (fun X => selfHomSheafTransportIso b X e) (by sorry)

/-- The component at X of selfHomSheafTransportNatIso(e) is exactly selfHomSheafTransportIso(X,e). -/
theorem selfHomSheafTransportNatIso_app (e : x ≅ x') (X : HomCategory b b) :
    (selfHomSheafTransportNatIso b e).app X = selfHomSheafTransportIso b X e := by
  sorry

/-- For any e,f:x≅x′, the two natural isomorphisms of sheaf-valued functors are equal. -/
theorem selfHomSheafTransportNatIso_independent (e f : x ≅ x') :
    selfHomSheafTransportNatIso b e = selfHomSheafTransportNatIso b f := by
  sorry

/-- The natural isomorphism induced by id_x is the identity of the sheaf-valued functor. -/
theorem selfHomSheafTransportNatIso_id :
    selfHomSheafTransportNatIso b (Iso.refl x) = Iso.refl _ := by
  sorry

/-- The natural isomorphism induced by e followed by f is the composite of the natural isomorphisms induced by e and f. -/
theorem selfHomSheafTransportNatIso_comp (e : x ≅ x') (f : x' ≅ x'') :
    selfHomSheafTransportNatIso b (e ≪≫ f) =
      selfHomSheafTransportNatIso b e ≪≫ selfHomSheafTransportNatIso b f := by
  sorry

/-- The hom field of selfHomSheafTransportIso(X,e) is T_e. -/
theorem selfHomSheafTransportIso_hom (X : HomCategory b b) (e : x ≅ x') :
    (selfHomSheafTransportIso b X e).hom = selfHomSheafTransport b X e := by
  sorry

/-- The inv field of selfHomSheafTransportIso(X,e) is T_(e⁻¹). -/
theorem selfHomSheafTransportIso_inv (X : HomCategory b b) (e : x ≅ x') :
    (selfHomSheafTransportIso b X e).inv = selfHomSheafTransport b X e.symm := by
  sorry

/-- For e,f:x≅x′, selfHomSheafTransportIso(X,e)=selfHomSheafTransportIso(X,f). -/
theorem selfHomSheafTransportIso_independent (X : HomCategory b b) (e f : x ≅ x') :
    selfHomSheafTransportIso b X e = selfHomSheafTransportIso b X f := by
  sorry

/-- Objects of the fibre core map to self-Hom-sheaf functors; isomorphisms map to choice-independent transport, so parallel arrows have the same image. -/
noncomputable def selfHomSheafObjectFunctor (U : C) :
    Core (F.obj (.mk (op U))) ⥤ (HomCategory b b ⥤ Sheaf (J.over U) (Type v')) where
  obj x := fibreHomSheafFunctor b b U x.of x.of
  map e := (selfHomSheafTransportNatIso b e.iso).hom
  map_id x := by sorry
  map_comp e f := by sorry

/-- The value at a native core object x is exactly fibreHomSheafFunctor(b,b,U,x.of,x.of). -/
theorem selfHomSheafObjectFunctor_obj (U : C) (x : Core (F.obj (.mk (op U)))) :
    (selfHomSheafObjectFunctor b U).obj x = fibreHomSheafFunctor b b U x.of x.of := by
  sorry

/-- The image of a native core arrow e is exactly the hom of selfHomSheafTransportNatIso(e.iso). -/
theorem selfHomSheafObjectFunctor_map (U : C) {x y : Core (F.obj (.mk (op U)))}
    (e : x ⟶ y) :
    (selfHomSheafObjectFunctor b U).map e = (selfHomSheafTransportNatIso b e.iso).hom := by
  sorry

/-- For any parallel native core arrows e,f:x→y, selfHomSheafObjectFunctor(U).map(e)=selfHomSheafObjectFunctor(U).map(f). This gives uniqueness of the induced comparison, not faithfulness or global descent. -/
theorem selfHomSheafObjectFunctor_parallel (U : C) {x y : Core (F.obj (.mk (op U)))}
    (e f : x ⟶ y) :
    (selfHomSheafObjectFunctor b U).map e = (selfHomSheafObjectFunctor b U).map f := by
  sorry

end BandedMorphism

namespace BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U : C} {x x' x'' x3 : F.obj (.mk (op U))}
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

-- test: SheafTransportTests.automorphism_trivial
/-- `TauCeti.AlgebraicGeometry.SheafTransportTests.automorphism_trivial`: Transport around any supplied automorphism of x is the identity actual sheaf map; the isomorphism parameter cannot inject artificial monodromy. -/
example (X : HomCategory b b) (e : x ≅ x) :
    selfHomSheafTransport b X e = 𝟙 _ := by
  sorry

-- test: SheafTransportTests.modification_square
/-- `TauCeti.AlgebraicGeometry.SheafTransportTests.modification_square`: An actual modification commutes with the two actual local-object transport maps as a native sheaf square. -/
example (e : x ≅ x') {X Y : HomCategory b b} (m : X ⟶ Y) :
    fibreHomSheafMap b b U x x m ≫ selfHomSheafTransport b Y e =
      selfHomSheafTransport b X e ≫ fibreHomSheafMap b b U x' x' m := by
  sorry

-- test: SheafTransportTests.scalar_compatibility
/-- `TauCeti.AlgebraicGeometry.SheafTransportTests.scalar_compatibility`: Transport commutes with the same actual band coefficient on the two native section carriers. -/
example (X : HomCategory b b) (e : x ≅ x') (T : Over U)
    (a : Multiplicative (A.obj.obj (op T.left)))
    (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    (selfHomSheafTransport b X e).hom.app (op T)
        (((fibreHomSectionAction b b U x x X T).ρ a).hom p) =
      ((fibreHomSectionAction b b U x' x' X T).ρ a).hom
        ((selfHomSheafTransport b X e).hom.app (op T) p) := by
  sorry

-- test: SheafTransportTests.inverse_roundtrip
/-- `TauCeti.AlgebraicGeometry.SheafTransportTests.inverse_roundtrip`: The displayed forward sheaf map followed by its displayed inverse recovers every supplied native section. -/
example (X : HomCategory b b) (e : x ≅ x') (T : Over U)
    (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    (selfHomSheafTransportIso b X e).inv.hom.app (op T)
        ((selfHomSheafTransportIso b X e).hom.hom.app (op T) p) = p := by
  sorry

-- test: SheafTransportTests.empty_sections
/-- `TauCeti.AlgebraicGeometry.SheafTransportTests.empty_sections`: If the actual Hom section set at a slice object is empty for x, it is empty for x′; no artificial global section is introduced. -/
example (X : HomCategory b b) (e : x ≅ x') (T : Over U)
    [IsEmpty ((fibreHomSheaf b b U x x X).obj.obj (op T))] :
    IsEmpty ((fibreHomSheaf b b U x' x' X).obj.obj (op T)) := by
  sorry

-- test: SheafTransportTests.iso_choice_independence
/-- `TauCeti.AlgebraicGeometry.SheafTransportTests.iso_choice_independence`: Two supplied connecting isomorphisms induce equal native sheaf isomorphisms, including their inverse data. -/
example (X : HomCategory b b) (e f : x ≅ x') :
    selfHomSheafTransportIso b X e = selfHomSheafTransportIso b X f := by
  sorry

-- test: SheafTransportTests.inverse_modification
/-- `TauCeti.AlgebraicGeometry.SheafTransportTests.inverse_modification`: The natural transport square also holds for the actual inverse of any native modification. -/
example (e : x ≅ x') {X Y : HomCategory b b} (m : X ⟶ Y) :
    (fibreHomSheafMapIso b b U x x m).inv ≫ selfHomSheafTransport b X e =
      selfHomSheafTransport b Y e ≫ (fibreHomSheafMapIso b b U x' x' m).inv := by
  sorry

-- test: SheafTransportTests.three_objects
/-- `TauCeti.AlgebraicGeometry.SheafTransportTests.three_objects`: Three composable connecting isomorphisms obey the iterated natural-isomorphism cocycle equation. -/
example (e : x ≅ x') (f : x' ≅ x'') (g : x'' ≅ x3) :
    selfHomSheafTransportNatIso b ((e ≪≫ f) ≪≫ g) =
      (selfHomSheafTransportNatIso b e ≪≫ selfHomSheafTransportNatIso b f) ≪≫
        selfHomSheafTransportNatIso b g := by
  sorry

-- test: SheafTransportTests.actual_restriction
/-- `TauCeti.AlgebraicGeometry.SheafTransportTests.actual_restriction`: The actual section transport commutes with every supplied Over-arrow restriction on the native Hom sheaves. -/
example (X : HomCategory b b) (e : x ≅ x') {T V : Over U} (f : V ⟶ T)
    (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    (fibreHomSheaf b b U x' x' X).obj.map f.op
        ((selfHomSheafTransport b X e).hom.app (op T) p) =
      (selfHomSheafTransport b X e).hom.app (op V)
        ((fibreHomSheaf b b U x x X).obj.map f.op p) := by
  sorry

-- test: SheafTransportTests.nonfaithful_with_parallel_arrows
/-- `TauCeti.AlgebraicGeometry.SheafTransportTests.nonfaithful_with_parallel_arrows`: If two distinct parallel core arrows are supplied, the actual local-object functor is not faithful because their images agree. -/
example {a c : Core (F.obj (.mk (op U)))} (e f : a ⟶ c) (hne : e ≠ f) :
    ¬ (selfHomSheafObjectFunctor b U).Faithful := by
  sorry

-- test: SheafTransportTests.native_object
/-- `TauCeti.AlgebraicGeometry.SheafTransportTests.native_object`: Evaluating the object functor at x and X has exactly the native presheafHom carrier. -/
example (a : Core (F.obj (.mk (op U)))) (X : HomCategory b b) :
    (((selfHomSheafObjectFunctor b U).obj a).obj X).obj =
      F.presheafHom a.of ((X.obj.app (.mk (op U))).toFunctor.obj a.of) := by
  sorry

-- test: SheafTransportTests.native_composition
/-- `TauCeti.AlgebraicGeometry.SheafTransportTests.native_composition`: The functor image of a composite core arrow evaluates to the composite actual sheaf maps at every X. -/
example {a c d : Core (F.obj (.mk (op U)))} (e : a ⟶ c) (f : c ⟶ d)
    (X : HomCategory b b) :
    ((selfHomSheafObjectFunctor b U).map (e ≫ f)).app X =
      ((selfHomSheafObjectFunctor b U).map e).app X ≫
        ((selfHomSheafObjectFunctor b U).map f).app X := by
  sorry

end BandedMorphism

namespace BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable {U V : C}

/-- Pullback of the native slice Hom sheaf along a base arrow agrees with the Hom sheaf of the restricted endpoints, including pseudofunctor comparisons. -/
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

/-- At t:T→V, the forward map is the native Hom-presheaf base-change comparison followed by G(t) of the hom of c(X,f,x). -/
theorem fibreHomBaseChangeIso_apply (X : HomCategory bF bG) (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) (T : Over V)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op ((Over.map f).obj T))) :
    (fibreHomBaseChangeIso bF bG X f x y).hom.hom.app (op T) p =
      (G.overMapCompPresheafHomIso y
        ((X.obj.app (.mk (op U))).toFunctor.obj x) f).hom.app (op T) p ≫
        (G.map T.hom.op.toLoc).toFunctor.map (restrictionIso bF bG X f x).hom := by
  sorry

/-- At t:T→V, first postcompose by G(t) of c(X,f,x)⁻¹, then apply the inverse native Hom-presheaf base-change comparison. This is the actual inverse map on sections. -/
theorem fibreHomBaseChangeIso_inv_apply (X : HomCategory bF bG) (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) (T : Over V)
    (p : (fibreHomSheaf bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
      ((G.map f.op.toLoc).toFunctor.obj y) X).obj.obj (op T)) :
    (fibreHomBaseChangeIso bF bG X f x y).inv.hom.app (op T) p =
      (G.overMapCompPresheafHomIso y
        ((X.obj.app (.mk (op U))).toFunctor.obj x) f).inv.app (op T)
        (p ≫ (G.map T.hom.op.toLoc).toFunctor.map (restrictionIso bF bG X f x).inv) := by
  sorry

/-- Let k be the native flexible G.mapComp′(f,t,t≫f) natural isomorphism, directed from G(t≫f) to G(t)G(f). The forward section formula is k(y)⁻¹ followed by p, then k(X_U(x)), then G(t)(c(X,f,x)). Neither flexible comparison factor is removed. -/
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

/-- For any native modification m:X→Y, pull back H_U(m) and then apply the Y comparison; this equals applying the X comparison and then H_V(m) at the pulled-back local objects. Equality holds as actual sheaf arrows. -/
theorem fibreHomBaseChangeIso_modification {X Y : HomCategory bF bG} (m : X ⟶ Y)
    (f : V ⟶ U) (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    (J.overMapPullback (Type v') f).map (fibreHomSheafMap bF bG U x y m) ≫
        (fibreHomBaseChangeIso bF bG Y f x y).hom =
      (fibreHomBaseChangeIso bF bG X f x y).hom ≫
        fibreHomSheafMap bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
          ((G.map f.op.toLoc).toFunctor.obj y) m := by
  sorry

/-- The slice Hom base-change isomorphism is natural in every modification of band-preserving gerbe morphisms. -/
noncomputable def fibreHomBaseChangeNatIso (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    fibreHomSheafFunctor bF bG U x y ⋙ J.overMapPullback (Type v') f ≅
      fibreHomSheafFunctor bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
        ((G.map f.op.toLoc).toFunctor.obj y) :=
  NatIso.ofComponents (fun X => fibreHomBaseChangeIso bF bG X f x y)
    (fun m => fibreHomBaseChangeIso_modification bF bG m f x y)

/-- The component at X of fibreHomBaseChangeNatIso(f,x,y) is exactly fibreHomBaseChangeIso(X,f,x,y). -/
theorem fibreHomBaseChangeNatIso_app (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) (X : HomCategory bF bG) :
    (fibreHomBaseChangeNatIso bF bG f x y).app X =
      fibreHomBaseChangeIso bF bG X f x y := by
  sorry

/-- The forward component at X is exactly the hom of fibreHomBaseChangeIso(X,f,x,y). -/
theorem fibreHomBaseChangeNatIso_hom_app (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) (X : HomCategory bF bG) :
    (fibreHomBaseChangeNatIso bF bG f x y).hom.app X =
      (fibreHomBaseChangeIso bF bG X f x y).hom := by
  sorry

/-- The inverse component at X is exactly the inv of fibreHomBaseChangeIso(X,f,x,y). -/
theorem fibreHomBaseChangeNatIso_inv_app (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) (X : HomCategory bF bG) :
    (fibreHomBaseChangeNatIso bF bG f x y).inv.app X =
      (fibreHomBaseChangeIso bF bG X f x y).inv := by
  sorry

/-- For a∈Multiplicative A(T) and a supplied section p at t≫f, the forward comparison carries a acting on p to a acting on its image at t. Both section carriers lie over T, so the coefficient is the same actual element of A(T); no coefficient restriction along f is inserted into this comparison. -/
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

/-- The actual inverse section comparison is equivariant for the same coefficient a∈Multiplicative A(T), without a section nonemptiness hypothesis. -/
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

end BandedMorphism

namespace BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A) {U V : C}
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

/-- For F=G, bF=bG=b and a supplied isomorphism e:x≅x′ over U, pulling back the existing selfHomSheafTransport(X,e) then applying the comparison at x′ equals applying the comparison at x then selfHomSheafTransport(X,F(f)e). This is equality of actual sheaf maps on the slice over V. -/
theorem selfHomBaseChangeTransport_square (X : HomCategory b b) (f : V ⟶ U)
    {x x' : F.obj (.mk (op U))} (e : x ≅ x') :
    (J.overMapPullback (Type v') f).map (selfHomSheafTransport b X e) ≫
        (fibreHomBaseChangeIso b b X f x' x').hom =
      (fibreHomBaseChangeIso b b X f x x).hom ≫
        selfHomSheafTransport b X ((F.map f.op.toLoc).toFunctor.mapIso e) := by
  sorry

end BandedMorphism

namespace SheafBaseChangeTests
open CategoryTheory Opposite Bicategory
open TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable {U V : C} (f : V ⟶ U)
  (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U)))

-- test: SheafBaseChangeTests.inverse_roundtrip
/-- `TauCeti.AlgebraicGeometry.SheafBaseChangeTests.inverse_roundtrip`: The displayed forward comparison followed by its actual inverse recovers every supplied section, at arbitrary t:T→V. -/
example (X : HomCategory bF bG) (T : Over V)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op ((Over.map f).obj T))) :
    (fibreHomBaseChangeIso bF bG X f x y).inv.hom.app (op T)
        ((fibreHomBaseChangeIso bF bG X f x y).hom.hom.app (op T) p) = p := by
  sorry

-- test: SheafBaseChangeTests.empty_sections
/-- `TauCeti.AlgebraicGeometry.SheafBaseChangeTests.empty_sections`: If the actual Hom section set at t≫f is empty, its compared carrier at t is empty. The construction cannot create a global or local section. -/
example (X : HomCategory bF bG) (T : Over V)
    [hEmpty : IsEmpty ((fibreHomSheaf bF bG U x y X).obj.obj (op ((Over.map f).obj T)))] :
    IsEmpty ((fibreHomSheaf bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
      ((G.map f.op.toLoc).toFunctor.obj y) X).obj.obj (op T)) := by
  sorry

-- test: SheafBaseChangeTests.unit_coefficient
/-- `TauCeti.AlgebraicGeometry.SheafBaseChangeTests.unit_coefficient`: The identity coefficient acts trivially before comparison, and the resulting section is the comparison of the original supplied section. -/
example (X : HomCategory bF bG) (T : Over V)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op ((Over.map f).obj T))) :
    (fibreHomBaseChangeIso bF bG X f x y).hom.hom.app (op T)
      (((fibreHomSectionAction bF bG U x y X ((Over.map f).obj T)).ρ 1).hom p) =
        (fibreHomBaseChangeIso bF bG X f x y).hom.hom.app (op T) p := by
  sorry

-- test: SheafBaseChangeTests.deeper_slice
/-- `TauCeti.AlgebraicGeometry.SheafBaseChangeTests.deeper_slice`: Comparison commutes with restriction along every supplied Over-arrow g:W→T over V, using Over.map(f)(g) on the source and the actual pullHom restrictions. -/
example (X : HomCategory bF bG) {T W : Over V} (g : W ⟶ T)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op ((Over.map f).obj T))) :
    (fibreHomSheaf bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
        ((G.map f.op.toLoc).toFunctor.obj y) X).obj.map g.op
      ((fibreHomBaseChangeIso bF bG X f x y).hom.hom.app (op T) p) =
    (fibreHomBaseChangeIso bF bG X f x y).hom.hom.app (op W)
      ((fibreHomSheaf bF bG U x y X).obj.map ((Over.map f).map g).op p) := by
  sorry

-- test: SheafBaseChangeTests.inverse_modification
/-- `TauCeti.AlgebraicGeometry.SheafBaseChangeTests.inverse_modification`: The actual inverse native modification obeys the forward comparison naturality square; inverse arrows and their components remain part of the carrier. -/
example {X Y : HomCategory bF bG} (m : X ⟶ Y) :
    (J.overMapPullback (Type v') f).map
        (fibreHomSheafMap bF bG U x y (homIso bF bG m).inv) ≫
      (fibreHomBaseChangeIso bF bG X f x y).hom =
    (fibreHomBaseChangeIso bF bG Y f x y).hom ≫
      fibreHomSheafMap bF bG V ((F.map f.op.toLoc).toFunctor.obj x)
        ((G.map f.op.toLoc).toFunctor.obj y) (homIso bF bG m).inv := by
  sorry

-- test: SheafBaseChangeTests.composite_modifications
/-- `TauCeti.AlgebraicGeometry.SheafBaseChangeTests.composite_modifications`: Two composable native modifications commute with the restriction natural isomorphism after applying both genuine sheaf maps, on both sides of the comparison. -/
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

end SheafBaseChangeTests

namespace SheafBaseChangeTests
open CategoryTheory Opposite Bicategory
open TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A) {U V : C}
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

-- test: SheafBaseChangeTests.local_object_square
/-- `TauCeti.AlgebraicGeometry.SheafBaseChangeTests.local_object_square`: The natural-isomorphism components commute with the actual local-object transport along e and its pulled-back isomorphism F(f)e. -/
example (X : HomCategory b b) (f : V ⟶ U)
    {x x' : F.obj (.mk (op U))} (e : x ≅ x') :
    (J.overMapPullback (Type v') f).map (selfHomSheafTransport b X e) ≫
        (fibreHomBaseChangeNatIso b b f x' x').hom.app X =
      (fibreHomBaseChangeNatIso b b f x x).hom.app X ≫
        selfHomSheafTransport b X ((F.map f.op.toLoc).toFunctor.mapIso e) := by
  sorry

end SheafBaseChangeTests

namespace BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable {U V W : C}

/-- For arbitrary banded gerbes F,G, fixed-band strong transformation X:F→G, f:V→U, x∈F(U), y∈G(U), t:T→V and a supplied Hom-sheaf section p at t≫f, transporting the compared section to an isomorphism G(t)G(f)y≅X_T(F(t)F(f)x) gives c_G(f,t,y)⁻¹ followed by the transported original section, then X_T(c_F(f,t,x)). Here c_F and c_G are the actual native pseudofunctor composition isomorphisms; no endpoint factor is discarded. -/
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

end BandedMorphism

namespace BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)
variable {U V W : C}

/-- For F=G and bF=bG=b, the preceding actual fibre-isomorphism formula is exactly selfTransportActionIso(X,c_F(f,t,x)) applied to the transported section. The equality is in the actual self-Hom fibre carrier over T. -/
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

/-- For h,k:T→U with h=k, a supplied section at Over.mk(h), and any supplied isomorphism e:F(h)x≅F(k)x, transport after the native Hom-sheaf restriction along the actual Over.homMk(𝟙_T):Over.mk(k)→Over.mk(h) equals selfTransportActionIso(X,e) of the original transported section. The connecting isomorphism is arbitrary, not a selected equality proof or strictness axiom. -/
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

/-- For a fixed-band self transformation X:F→F and x∈F(U), fibreHomBaseChangeIso(X,𝟙_U,x,x) followed by selfHomSheafTransportIso(X,F.mapId_U(x)) equals the component at H_U(x,x;X) of the native overMapPullbackId natural isomorphism. This is equality of actual sheaf isomorphisms, with their real inverse maps. -/
theorem selfHomBaseChangeIso_id (X : HomCategory b b) (x : F.obj (.mk (op U))) :
    fibreHomBaseChangeIso b b X (𝟙 U) x x ≪≫
        selfHomSheafTransportIso b X ((Cat.Hom.toNatIso (F.mapId (.mk (op U)))).app x) =
      (J.overMapPullbackId (Type v') U).app (fibreHomSheaf b b U x x X) := by
  sorry

/-- In the self-gerbe section comparison, any supplied isomorphism e:F(t≫f)x≅F(t)F(f)x may replace the native composition isomorphism in the transported-section formula. This uses the fixed abelian band and actual band preservation; it does not identify the isomorphisms e themselves. -/
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
/-- For f:V→U and g:W→V, start from g⁎f⁎H_U(x,x;X). The component of native overMapPullbackComp(g,f), followed by comparison for g≫f and local-object transport along F.mapComp(f,g)(x), equals g⁎ of the comparison for f followed by comparison for g at F(f)x. Equality holds as actual sheaf isomorphisms, retaining the source slice comparison and the target gerbe comparison. -/
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

/-- On the actual category HomCategory(b,b), the identity restriction natural isomorphism followed by local-object transport along F.mapId(x) equals whiskering the native overMapPullbackId by the local Hom-sheaf functor and then its native right unitor. This retains every fixed-band strong transformation and modification. -/
theorem selfHomBaseChangeNatIso_id (x : F.obj (.mk (op U))) :
    fibreHomBaseChangeNatIso b b (𝟙 U) x x ≪≫
        selfHomSheafTransportNatIso b
          ((Cat.Hom.toNatIso (F.mapId (.mk (op U)))).app x) =
      Functor.isoWhiskerLeft (fibreHomSheafFunctor b b U x x)
          (J.overMapPullbackId (Type v') U) ≪≫
        (fibreHomSheafFunctor b b U x x).rightUnitor := by
  sorry

/-- The native functor associator, whiskered overMapPullbackComp(g,f), comparison for g≫f and target local-object transport compose to the same natural isomorphism as right-whiskering the comparison for f by g⁎ and then comparing along g at F(f)x. All functors have domain HomCategory(b,b); the equality is of native natural isomorphisms, not only of their isomorphism classes. -/
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

end BandedMorphism

namespace SheafCoherenceTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)
variable {U V W Z : C}

-- test: SheafCoherenceTests.unit_inverse
/-- `TauCeti.AlgebraicGeometry.SheafCoherenceTests.unit_inverse`: The corrected identity comparison has exactly the inverse of the native slice pullback identity component; inverse factors occur in reverse order. -/
example (X : HomCategory b b) (x : F.obj (.mk (op U))) :
    (selfHomSheafTransportIso b X ((Cat.Hom.toNatIso (F.mapId (.mk (op U)))).app x)).inv ≫
        (fibreHomBaseChangeIso b b X (𝟙 U) x x).inv =
      ((J.overMapPullbackId (Type v') U).app (fibreHomSheaf b b U x x X)).inv := by
  sorry

-- test: SheafCoherenceTests.composite_inverse
/-- `TauCeti.AlgebraicGeometry.SheafCoherenceTests.composite_inverse`: Both composite paths have equal actual inverse sheaf arrows, with the inverse Over comparison and inverse object transport in the correct order. -/
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
/-- `TauCeti.AlgebraicGeometry.SheafCoherenceTests.endpoint_choice`: Any supplied isomorphism F(g≫f)x≅F(g)F(f)x can replace the native target comparison in the complete sheaf composition law. -/
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
/-- `TauCeti.AlgebraicGeometry.SheafCoherenceTests.native_modification`: Every native modification commutes with the iterated restriction natural isomorphism on actual sheaf arrows. -/
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
/-- `TauCeti.AlgebraicGeometry.SheafCoherenceTests.coefficient_composite`: Two successive restriction comparisons preserve the same arbitrary coefficient a∈Multiplicative A(T); no incorrect restriction of a along f or g is inserted. -/
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
/-- `TauCeti.AlgebraicGeometry.SheafCoherenceTests.third_pullback`: The complete two-step coherence equality remains valid after applying the native sheaf pullback along a third arbitrary arrow. This checks stability under a third pullback, not a separately established full descent pentagon. -/
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

end SheafCoherenceTests

namespace BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable {U V : C} {x x' x'' : F.obj (.mk (op U))}
  {y y' y'' : G.obj (.mk (op U))}

/-- For specified source and target isomorphisms, transport a slice arrow by inverse target precomposition and image-source postcomposition. -/
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

/-- For every supplied section p at t:T→U, T_X(e,d)(p)=G(t)(d⁻¹)≫p≫G(t)(X_U(e)). Source and target endpoints are distinct explicit parameters; neither factor is erased. -/
theorem fibreHomEndpointTransport_apply (X : HomCategory bF bG) (e : x ≅ x') (d : y ≅ y')
    (T : Over U) (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomEndpointTransport bF bG X e d).hom.app (op T) p =
      (G.map T.hom.op.toLoc).toFunctor.map d.inv ≫ p ≫
      (G.map T.hom.op.toLoc).toFunctor.map
        ((X.obj.app (.mk (op U))).toFunctor.map e.hom) := by
  sorry

/-- T_X(id_x,id_y) is the identity morphism of the native sheaf H_U(x,y;X). -/
theorem fibreHomEndpointTransport_id (X : HomCategory bF bG) :
    fibreHomEndpointTransport bF bG X (Iso.refl x) (Iso.refl y) = 𝟙 _ := by
  sorry

/-- For composable e:x≅x′, e′:x′≅x″ and d:y≅y′, d′:y′≅y″, T_X(e≫e′,d≫d′)=T_X(e,d)≫T_X(e′,d′). The inverse source-endpoint factors compose in the reverse order. -/
theorem fibreHomEndpointTransport_comp (X : HomCategory bF bG)
    (e : x ≅ x') (e' : x' ≅ x'') (d : y ≅ y') (d' : y' ≅ y'') :
    fibreHomEndpointTransport bF bG X (e ≪≫ e') (d ≪≫ d') =
      fibreHomEndpointTransport bF bG X e d ≫ fibreHomEndpointTransport bF bG X e' d' := by
  sorry

/-- Transport along both specified endpoint isomorphisms is invertible, with inverse using both reversed endpoint isomorphisms. -/
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

/-- Under the existing section-to-fibre-Isom equivalence q=asIso(p)≫restrictionIso(X,t,x), transporting T_X(e,d)(p) gives G(t)(d)⁻¹≫q≫X_T(F(t)(e)). This equality retains the native strong-transformation restriction comparison. -/
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

/-- For every a∈Multiplicative A(T) and supplied section p, T_X(e,d)(a·p)=a·T_X(e,d)(p), using the actual section actions. Both sides are over T and use the same coefficient in A(T). -/
theorem fibreHomEndpointTransport_equivariant (X : HomCategory bF bG)
    (e : x ≅ x') (d : y ≅ y') (T : Over U)
    (a : Multiplicative (A.obj.obj (op T.left)))
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomEndpointTransport bF bG X e d).hom.app (op T)
        (((fibreHomSectionAction bF bG U x y X T).ρ a).hom p) =
      ((fibreHomSectionAction bF bG U x' y' X T).ρ a).hom
        ((fibreHomEndpointTransport bF bG X e d).hom.app (op T) p) := by
  sorry

/-- For each native modification m:X⇒Y, H(m) at (x,y), followed by T_Y(e,d), equals T_X(e,d) followed by H(m) at (x′,y′). The equality is of actual sheaf morphisms, not isomorphism classes. -/
theorem fibreHomEndpointTransport_modification {X Y : HomCategory bF bG}
    (m : X ⟶ Y) (e : x ≅ x') (d : y ≅ y') :
    fibreHomSheafMap bF bG U x y m ≫ fibreHomEndpointTransport bF bG Y e d =
      fibreHomEndpointTransport bF bG X e d ≫ fibreHomSheafMap bF bG U x' y' m := by
  sorry

/-- The two-endpoint transport isomorphism is natural in modifications. Its dependence on distinct endpoint choices is retained. -/
noncomputable def fibreHomEndpointTransportNatIso (e : x ≅ x') (d : y ≅ y') :
    fibreHomSheafFunctor bF bG U x y ≅ fibreHomSheafFunctor bF bG U x' y' :=
  NatIso.ofComponents (fun X => fibreHomEndpointTransportIso bF bG X e d)
    (fun m => fibreHomEndpointTransport_modification bF bG m e d)

/-- The component of fibreHomEndpointTransportNatIso(e,d) at X is exactly fibreHomEndpointTransportIso(X,e,d). -/
theorem fibreHomEndpointTransportNatIso_app (e : x ≅ x') (d : y ≅ y')
    (X : HomCategory bF bG) :
    (fibreHomEndpointTransportNatIso bF bG e d).app X =
      fibreHomEndpointTransportIso bF bG X e d := by
  sorry

/-- The endpoint natural isomorphism at (id_x,id_y) is the identity natural isomorphism of the actual Hom-sheaf functor. -/
theorem fibreHomEndpointTransportNatIso_id :
    fibreHomEndpointTransportNatIso bF bG (Iso.refl x) (Iso.refl y) = Iso.refl _ := by
  sorry

/-- Transport at the pair of composite endpoint isomorphisms equals the composite of the two endpoint natural isomorphisms, on the actual fixed-band modification category. -/
theorem fibreHomEndpointTransportNatIso_comp
    (e : x ≅ x') (e' : x' ≅ x'') (d : y ≅ y') (d' : y' ≅ y'') :
    fibreHomEndpointTransportNatIso bF bG (e ≪≫ e') (d ≪≫ d') =
      fibreHomEndpointTransportNatIso bF bG e d ≪≫
        fibreHomEndpointTransportNatIso bF bG e' d' := by
  sorry

/-- The hom of the native endpoint sheaf isomorphism is exactly T_X(e,d). -/
theorem fibreHomEndpointTransportIso_hom (X : HomCategory bF bG) (e : x ≅ x') (d : y ≅ y') :
    (fibreHomEndpointTransportIso bF bG X e d).hom =
      fibreHomEndpointTransport bF bG X e d := by
  sorry

/-- The inv of the native endpoint sheaf isomorphism is exactly T_X(e⁻¹,d⁻¹). -/
theorem fibreHomEndpointTransportIso_inv (X : HomCategory bF bG) (e : x ≅ x') (d : y ≅ y') :
    (fibreHomEndpointTransportIso bF bG X e d).inv =
      fibreHomEndpointTransport bF bG X e.symm d.symm := by
  sorry

/-- For f:V→U, pull back T_X(e,d) by the native slice-sheaf functor and then apply fibreHomBaseChangeIso at (x′,y′). This equals the comparison at (x,y), followed by T_X(F(f)e,G(f)d). The equality is of actual sheaf morphisms over V, retaining the native Over functor and both strong/pseudofunctor comparison maps. -/
theorem fibreHomEndpointBaseChange_square (X : HomCategory bF bG) (f : V ⟶ U)
    (e : x ≅ x') (d : y ≅ y') :
    (J.overMapPullback (Type v') f).map (fibreHomEndpointTransport bF bG X e d) ≫
        (fibreHomBaseChangeIso bF bG X f x' y').hom =
      (fibreHomBaseChangeIso bF bG X f x y).hom ≫
        fibreHomEndpointTransport bF bG X ((F.map f.op.toLoc).toFunctor.mapIso e)
          ((G.map f.op.toLoc).toFunctor.mapIso d) := by
  sorry

end BandedMorphism

namespace BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U : C} {x x' : F.obj (.mk (op U))}
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

/-- For F=G, bF=bG=b, y=x, y′=x′ and d=e, the new endpoint sheaf isomorphism is exactly the existing selfHomSheafTransportIso(X,e), with its actual forward and inverse maps. -/
theorem fibreHomEndpointTransportIso_self (X : HomCategory b b) (e : x ≅ x') :
    fibreHomEndpointTransportIso b b X e e = selfHomSheafTransportIso b X e := by
  sorry

end BandedMorphism

namespace EndpointTransportTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable {U V : C} {x x' x'' : F.obj (.mk (op U))}
  {y y' y'' : G.obj (.mk (op U))}

-- test: EndpointTransportTests.actual_endpoint_formula
/-- `TauCeti.AlgebraicGeometry.EndpointTransportTests.actual_endpoint_formula`: On every actual native Hom section, transport has exactly the inverse y-endpoint and forward X(x)-endpoint factors. -/
example (X : HomCategory bF bG) (e : x ≅ x') (d : y ≅ y') (T : Over U)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomEndpointTransport bF bG X e d).hom.app (op T) p =
      (G.map T.hom.op.toLoc).toFunctor.map d.inv ≫ p ≫
        (G.map T.hom.op.toLoc).toFunctor.map
          ((X.obj.app (.mk (op U))).toFunctor.map e.hom) := by
  sorry

-- test: EndpointTransportTests.arbitrary_slice_arrow
/-- `TauCeti.AlgebraicGeometry.EndpointTransportTests.arbitrary_slice_arrow`: The map commutes with restriction along every supplied native Over arrow, retaining the real presheaf maps. -/
example (X : HomCategory bF bG) (e : x ≅ x') (d : y ≅ y')
    {T W : Over U} (g : W ⟶ T) :
    (fibreHomSheaf bF bG U x y X).obj.map g.op ≫
        (fibreHomEndpointTransport bF bG X e d).hom.app (op W) =
      (fibreHomEndpointTransport bF bG X e d).hom.app (op T) ≫
        (fibreHomSheaf bF bG U x' y' X).obj.map g.op := by
  sorry

-- test: EndpointTransportTests.unbalanced_endpoint_is_not_identity
/-- `TauCeti.AlgebraicGeometry.EndpointTransportTests.unbalanced_endpoint_is_not_identity`: For a target-endpoint automorphism whose inverse remains nonidentity after the actual G(t) pullback, transport with identity x-endpoint changes every supplied Hom section. Independent endpoint choices cannot be suppressed as in the diagonal self-gerbe case. -/
example (X : HomCategory bF bG) (d : y ≅ y) (T : Over U)
    (h : (G.map T.hom.op.toLoc).toFunctor.map d.inv ≠ 𝟙 _)
    (p : (fibreHomSheaf bF bG U x y X).obj.obj (op T)) :
    (fibreHomEndpointTransport bF bG X (Iso.refl x) d).hom.app (op T) p ≠ p := by
  sorry

-- test: EndpointTransportTests.empty_sections_reflected
/-- `TauCeti.AlgebraicGeometry.EndpointTransportTests.empty_sections_reflected`: If the old actual section carrier is empty, the new one is empty by the explicit inverse; no section is selected or created. -/
example (X : HomCategory bF bG) (e : x ≅ x') (d : y ≅ y') (T : Over U)
    [IsEmpty ((fibreHomSheaf bF bG U x y X).obj.obj (op T))] :
    IsEmpty ((fibreHomSheaf bF bG U x' y' X).obj.obj (op T)) := by
  sorry

-- test: EndpointTransportTests.inverse_uses_both_reversed_endpoints
/-- `TauCeti.AlgebraicGeometry.EndpointTransportTests.inverse_uses_both_reversed_endpoints`: The inverse sends p to G(t)(d)≫p≫G(t)(X_U(e⁻¹)); both endpoint factors reverse. -/
example (X : HomCategory bF bG) (e : x ≅ x') (d : y ≅ y') (T : Over U)
    (p : (fibreHomSheaf bF bG U x' y' X).obj.obj (op T)) :
    (fibreHomEndpointTransportIso bF bG X e d).inv.hom.app (op T) p =
      (G.map T.hom.op.toLoc).toFunctor.map d.hom ≫ p ≫
        (G.map T.hom.op.toLoc).toFunctor.map
          ((X.obj.app (.mk (op U))).toFunctor.map e.inv) := by
  sorry

-- test: EndpointTransportTests.modifications_retained
/-- `TauCeti.AlgebraicGeometry.EndpointTransportTests.modifications_retained`: Every actual modification satisfies the native natural-transformation square for the endpoint comparison. -/
example {X Y : HomCategory bF bG} (m : X ⟶ Y) (e : x ≅ x') (d : y ≅ y') :
    (fibreHomSheafFunctor bF bG U x y).map m ≫
        (fibreHomEndpointTransportNatIso bF bG e d).hom.app Y =
      (fibreHomEndpointTransportNatIso bF bG e d).hom.app X ≫
        (fibreHomSheafFunctor bF bG U x' y').map m := by
  sorry

-- test: EndpointTransportTests.separate_endpoint_composition
/-- `TauCeti.AlgebraicGeometry.EndpointTransportTests.separate_endpoint_composition`: Independent composable source and target endpoint pairs satisfy the actual natural-isomorphism composition law. -/
example (e : x ≅ x') (e' : x' ≅ x'') (d : y ≅ y') (d' : y' ≅ y'') :
    fibreHomEndpointTransportNatIso bF bG (e ≪≫ e') (d ≪≫ d') =
      fibreHomEndpointTransportNatIso bF bG e d ≪≫
        fibreHomEndpointTransportNatIso bF bG e' d' := by
  sorry

-- test: EndpointTransportTests.native_base_restriction_square
/-- `TauCeti.AlgebraicGeometry.EndpointTransportTests.native_base_restriction_square`: The arbitrary native slice pullback square retains the separate F(f)e and G(f)d endpoint maps. -/
example (X : HomCategory bF bG) (f : V ⟶ U) (e : x ≅ x') (d : y ≅ y') :
    (J.overMapPullback (Type v') f).map (fibreHomEndpointTransport bF bG X e d) ≫
        (fibreHomBaseChangeIso bF bG X f x' y').hom =
      (fibreHomBaseChangeIso bF bG X f x y).hom ≫
        fibreHomEndpointTransport bF bG X ((F.map f.op.toLoc).toFunctor.mapIso e)
          ((G.map f.op.toLoc).toFunctor.mapIso d) := by
  sorry

end EndpointTransportTests

namespace EndpointTransportTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U : C} {x x' : F.obj (.mk (op U))}
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

-- test: EndpointTransportTests.diagonal_agrees_with_native_self_transport
/-- `TauCeti.AlgebraicGeometry.EndpointTransportTests.diagonal_agrees_with_native_self_transport`: On the diagonal F=G with e=d, the actual isomorphism agrees exactly with the earlier native selfHomSheafTransportIso. -/
example (X : HomCategory b b) (e : x ≅ x') :
    fibreHomEndpointTransportIso b b X e e = selfHomSheafTransportIso b X e := by
  sorry

end EndpointTransportTests

namespace BandedMorphism
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
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable {U V W : C}

/-- For X:F→G in HomCategory(bF,bG), x∈F(U), y∈G(U), compose fibreHomBaseChangeIso(X,𝟙_U,x,y) with endpoint transport along the distinct F.mapId(x) and G.mapId(y). This actual sheaf isomorphism equals the component of native overMapPullbackId at H_U(x,y;X). Neither endpoint comparison is suppressed. -/
theorem fibreHomBaseChangeIso_id (X : HomCategory bF bG)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    fibreHomBaseChangeIso bF bG X (𝟙 U) x y ≪≫
      fibreHomEndpointTransportIso bF bG X
        ((Cat.Hom.toNatIso (F.mapId (.mk (op U)))).app x)
        ((Cat.Hom.toNatIso (G.mapId (.mk (op U)))).app y) =
    (J.overMapPullbackId (Type v') U).app (fibreHomSheaf bF bG U x y X) := by
  sorry

/-- For f:V→U and g:W→V, start at g⁎f⁎H_U(x,y;X). The native overMapPullbackComp(g,f), followed by base comparison along g≫f and endpoint transport along F.mapComp(f,g)(x) and G.mapComp(f,g)(y), equals g⁎ of comparison along f followed by comparison along g at the pair F(f)x,G(f)y. This is equality of actual sheaf isomorphisms. -/
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

/-- The composite of the general base-change natural isomorphism at 𝟙_U and the endpoint natural isomorphism at F.mapId(x),G.mapId(y) equals left whiskering of native overMapPullbackId by H_U(x,y;−), followed by that functor’s right unitor. The domain is the actual HomCategory(bF,bG), with all native modifications. -/
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

/-- On HomCategory(bF,bG), retain the functor associator from (H_U⋙f⁎)⋙g⁎, then left-whiskered overMapPullbackComp(g,f), comparison along g≫f and endpoint natural transport along both pseudofunctor composition maps. This equals right whiskering of comparison along f by g⁎ followed by comparison along g at F(f)x,G(f)y. -/
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

/-- The inverse endpoint comparison at F.mapId(x),G.mapId(y), followed by the inverse base-change comparison at 𝟙_U, equals the inverse component of native overMapPullbackId. The order of the two actual maps is reversed. -/
theorem fibreHomBaseChangeIso_id_inv (X : HomCategory bF bG)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) :
    (fibreHomEndpointTransportIso bF bG X
        ((Cat.Hom.toNatIso (F.mapId (.mk (op U)))).app x)
        ((Cat.Hom.toNatIso (G.mapId (.mk (op U)))).app y)).inv ≫
      (fibreHomBaseChangeIso bF bG X (𝟙 U) x y).inv =
    ((J.overMapPullbackId (Type v') U).app (fibreHomSheaf bF bG U x y X)).inv := by
  sorry

/-- The inverse endpoint map at F.mapComp(f,g)(x),G.mapComp(f,g)(y), then inverse comparison along g≫f, then inverse native overMapPullbackComp(g,f), equals inverse comparison along g followed by g⁎ of inverse comparison along f. -/
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

end BandedMorphism

namespace GeneralBaseCoherenceTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
  [IsGerbe F J] [IsGerbe G J] {A : Sheaf J AddCommGrpCat.{w}}
  (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable {U V W Z : C}

-- test: GeneralBaseCoherenceTests.unit_inverse_order
/-- `TauCeti.AlgebraicGeometry.GeneralBaseCoherenceTests.unit_inverse_order`: For every actual section, the inverse endpoint map is applied before the inverse identity-base map, and their value equals the native Over identity inverse. -/
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
/-- `TauCeti.AlgebraicGeometry.GeneralBaseCoherenceTests.composition_inverse_round_trip`: The iterated forward map followed by the three reversed coherent factors is the identity actual sheaf map. -/
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
/-- `TauCeti.AlgebraicGeometry.GeneralBaseCoherenceTests.iterated_modifications`: Every actual modification commutes with the iterated natural comparison over f and g. -/
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
/-- `TauCeti.AlgebraicGeometry.GeneralBaseCoherenceTests.same_actual_coefficient`: Two successive comparisons preserve the same supplied a∈Multiplicative A(T), using the actual native section actions. -/
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
/-- `TauCeti.AlgebraicGeometry.GeneralBaseCoherenceTests.third_pullback_stability`: The complete two-arrow comparison equality remains equal after a third arbitrary native pullback; this check does not claim the full descent pentagon. -/
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
/-- `TauCeti.AlgebraicGeometry.GeneralBaseCoherenceTests.unbalanced_unit_endpoint`: After the correctly endpoint-adjusted identity-base comparison, an independently added target-endpoint automorphism that remains nonidentity under G(t) changes every supplied section. It cannot be erased from the general two-object formula. -/
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
/-- `TauCeti.AlgebraicGeometry.GeneralBaseCoherenceTests.empty_iterated_sections`: If the original section carrier over the twice-mapped Over object is empty, the twice-restricted carrier is empty by the actual inverse maps; no section is selected. -/
example (X : HomCategory bF bG) (f : V ⟶ U) (g : W ⟶ V)
    (x : F.obj (.mk (op U))) (y : G.obj (.mk (op U))) (T : Over W)
    [IsEmpty ((fibreHomSheaf bF bG U x y X).obj.obj
      (op ((Over.map f).obj ((Over.map g).obj T))))] :
    IsEmpty ((fibreHomSheaf bF bG W
      ((F.map g.op.toLoc).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj x))
      ((G.map g.op.toLoc).toFunctor.obj ((G.map f.op.toLoc).toFunctor.obj y)) X).obj.obj (op T)) := by
  sorry

end GeneralBaseCoherenceTests

namespace GeneralBaseCoherenceTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A) {U V W : C}
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)
-- test: GeneralBaseCoherenceTests.diagonal_composition
/-- `TauCeti.AlgebraicGeometry.GeneralBaseCoherenceTests.diagonal_composition`: Specializing F=G, bF=bG and y=x recovers exactly the existing selfHomSheafTransportIso composition equality. -/
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

end GeneralBaseCoherenceTests

namespace GerbeLocalCovers

variable {C : Type u} [Category.{v} C]
    (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
    {J : GrothendieckTopology C} {U V W T S : C}

/-- The sieve of arrows into U whose domain fibre has an object. -/
def objectCover (U : C) : Sieve U where
  arrows := fun {V} _ => Nonempty (F.obj (.mk (op V)))
  downward_closed := by
    rintro V W f ⟨x⟩ g
    exact ⟨(F.map g.op.toLoc).toFunctor.obj x⟩

/-- Membership of f:V→U in objectCover(F,U) is exactly Nonempty F(V), independently of f. -/
theorem objectCover_mem (f : V ⟶ U) :
    objectCover F U f ↔ Nonempty (F.obj (.mk (op V))) := by
  sorry

/-- For every f:V→U, the native pullback of objectCover(F,U) is exactly objectCover(F,V), as native sieves. -/
theorem objectCover_pullback (f : V ⟶ U) :
    (objectCover F U).pullback f = objectCover F V := by
  sorry

/-- If F is a gerbe on (C,J), objectCover(F,U) belongs to J(U). This assertion does not produce an object over U. -/
theorem objectCover_covering [IsGerbe F J] (U : C) : objectCover F U ∈ J U := by
  sorry

/-- For F a gerbe and any native covering sieve R on U, R∩objectCover(F,U) is J-covering. Each member has an actual nonempty source fibre. -/
theorem objectCover_refinement_covering [IsGerbe F J] (R : Sieve U) (hR : R ∈ J U) :
    R ⊓ objectCover F U ∈ J U := by
  sorry

/-- If F(U) is empty, the identity of U is not in objectCover(F,U). Even with IsGerbe F J, the covering conclusion cannot select a global object. -/
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

/-- An arrow f:V→U belongs to isomCover(F,x,y) exactly when the actual fibre isomorphism type F(f)x≅F(f)y is nonempty. -/
theorem isomCover_mem (x y : F.obj (.mk (op U))) (f : V ⟶ U) :
    isomCover F x y f ↔ Nonempty ((F.map f.op.toLoc).toFunctor.obj x ≅
      (F.map f.op.toLoc).toFunctor.obj y) := by
  sorry

/-- For a gerbe F and supplied x,y∈F(U), isomCover(F,x,y) is J-covering; a global isomorphism is not assumed. -/
theorem isomCover_covering [IsGerbe F J] (x y : F.obj (.mk (op U))) :
    isomCover F x y ∈ J U := by
  sorry

/-- The actual native sieves isomCover(F,x,y) and isomCover(F,y,x) are equal. -/
theorem isomCover_symm (x y : F.obj (.mk (op U))) :
    isomCover F x y = isomCover F y x := by
  sorry

/-- For every actual x∈F(U), isomCover(F,x,x) is the maximal native sieve, without a gerbe hypothesis. -/
theorem isomCover_refl (x : F.obj (.mk (op U))) : isomCover F x x = ⊤ := by
  sorry

/-- For f:V→U, the native pullback of isomCover(F,x,y) equals isomCover(F,F(f)x,F(f)y). The two directions transport supplied isomorphisms with both native F.mapComp(f,g) endpoint components; F need not be strict. -/
theorem isomCover_pullback (x y : F.obj (.mk (op U))) (f : V ⟶ U) :
    (isomCover F x y).pullback f =
      isomCover F ((F.map f.op.toLoc).toFunctor.obj x)
        ((F.map f.op.toLoc).toFunctor.obj y) := by
  sorry

/-- For a gerbe F, x,y∈F(U) and every covering sieve R on U, R∩isomCover(F,x,y) is covering. -/
theorem isomCover_refinement_covering [IsGerbe F J]
    (x y : F.obj (.mk (op U))) (R : Sieve U) (hR : R ∈ J U) :
    R ⊓ isomCover F x y ∈ J U := by
  sorry

/-- Compare two local objects on an arbitrary common refinement T. -/
def overlapCover (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W))) : Sieve T :=
  isomCover F ((F.map i.op.toLoc).toFunctor.obj x)
    ((F.map j.op.toLoc).toFunctor.obj y)

/-- Membership of q:S→T in overlapCover(F,i,j,x,y) is exactly nonemptiness of F(q)F(i)x≅F(q)F(j)y, in the actual fibre F(S). -/
theorem overlapCover_mem (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W))) (q : S ⟶ T) :
    overlapCover F i j x y q ↔
      Nonempty ((F.map q.op.toLoc).toFunctor.obj ((F.map i.op.toLoc).toFunctor.obj x) ≅
        (F.map q.op.toLoc).toFunctor.obj ((F.map j.op.toLoc).toFunctor.obj y)) := by
  sorry

/-- For a gerbe F, every overlapCover(F,i,j,x,y) is J-covering on T. The supplied local objects may belong to different source fibres. -/
theorem overlapCover_covering [IsGerbe F J] (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W))) :
    overlapCover F i j x y ∈ J T := by
  sorry

/-- Swapping i,x with j,y leaves the native overlap sieve equal. -/
theorem overlapCover_swap (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W))) :
    overlapCover F i j x y = overlapCover F j i y x := by
  sorry

/-- For a gerbe F and every q:S→T, the actual native pullback of overlapCover(F,i,j,x,y) is J-covering on S. -/
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

/-- The forward arrow of overlapIso is the hom of the i-side composition comparison, then the chosen iterated isomorphism hom, then the inverse arrow of the j-side comparison. -/
theorem overlapIso_hom (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W)))
    (q : S ⟶ T) (h : overlapCover F i j x y q) :
    (overlapIso F i j x y q h).hom =
      ((Cat.Hom.toNatIso (F.mapComp i.op.toLoc q.op.toLoc)).app x).hom ≫
        (Classical.choice h).hom ≫
          ((Cat.Hom.toNatIso (F.mapComp j.op.toLoc q.op.toLoc)).app y).inv := by
  sorry

/-- The inverse arrow of overlapIso is the hom of the j-side comparison, then the inverse of the chosen iterated isomorphism, then the inverse arrow of the i-side comparison. All factors occur in reversed order. -/
theorem overlapIso_inv (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W)))
    (q : S ⟶ T) (h : overlapCover F i j x y q) :
    (overlapIso F i j x y q h).inv =
      ((Cat.Hom.toNatIso (F.mapComp j.op.toLoc q.op.toLoc)).app y).hom ≫
        (Classical.choice h).inv ≫
          ((Cat.Hom.toNatIso (F.mapComp i.op.toLoc q.op.toLoc)).app x).inv := by
  sorry

/-- The actual overlapIso hom followed by its inverse equals the native identity of F(q≫i)x. -/
theorem overlapIso_hom_inv (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W)))
    (q : S ⟶ T) (h : overlapCover F i j x y q) :
    (overlapIso F i j x y q h).hom ≫ (overlapIso F i j x y q h).inv = 𝟙 _ := by
  sorry

/-- The actual overlapIso inverse followed by its hom equals the native identity of F(q≫j)y. -/
theorem overlapIso_inv_hom (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W)))
    (q : S ⟶ T) (h : overlapCover F i j x y q) :
    (overlapIso F i j x y q h).inv ≫ (overlapIso F i j x y q h).hom = 𝟙 _ := by
  sorry

end GerbeLocalCovers

namespace LocalCoverTests
open GerbeLocalCovers
variable {C : Type u} [Category.{v} C]
    (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
    {J : GrothendieckTopology C} {U V W T S R : C}

-- test: LocalCoverTests.object_refined_member
/-- `TauCeti.AlgebraicGeometry.LocalCoverTests.object_refined_member`: A member of the common refinement of an arbitrary covering sieve and objectCover supplies an actual object in its source fibre, and this refinement is covering. -/
example [IsGerbe F J] (D : Sieve U) (hD : D ∈ J U)
    (f : V ⟶ U) (h : (D ⊓ objectCover F U) f) :
    D ⊓ objectCover F U ∈ J U ∧ Nonempty (F.obj (.mk (op V))) := by
  sorry

-- test: LocalCoverTests.object_empty_global_fibre
/-- `TauCeti.AlgebraicGeometry.LocalCoverTests.object_empty_global_fibre`: With a gerbe and an explicitly empty fibre F(U), objectCover still covers U but its identity arrow is absent. This is a parameterized assertion, not a constructed nonneutral geometric fixture. -/
example [IsGerbe F J] [IsEmpty (F.obj (.mk (op U)))] :
    objectCover F U ∈ J U ∧ ¬ objectCover F U (𝟙 U) := by
  sorry

-- test: LocalCoverTests.object_iterated_restriction
/-- `TauCeti.AlgebraicGeometry.LocalCoverTests.object_iterated_restriction`: Pulling the actual canonical object sieve back along two arbitrary arrows equals the canonical object sieve at the final base. -/
example (f : V ⟶ U) (g : W ⟶ V) :
    ((objectCover F U).pullback f).pullback g = objectCover F W := by
  sorry

-- test: LocalCoverTests.constant_empty_objects
/-- `TauCeti.AlgebraicGeometry.LocalCoverTests.constant_empty_objects`: For the actual constant pseudofunctor with fibre Discrete PEmpty on Discrete PUnit, objectCover is the empty native sieve. No gerbe or covering hypothesis is asserted for this fixture. -/
example :
    let F := ((Functor.const (Discrete PUnit)ᵒᵖ).obj (Cat.of (Discrete PEmpty))).toPseudofunctor'
    objectCover F (Discrete.mk PUnit.unit) = ⊥ := by
  sorry

-- test: LocalCoverTests.constant_inhabited_objects
/-- `TauCeti.AlgebraicGeometry.LocalCoverTests.constant_inhabited_objects`: For the actual constant pseudofunctor with fibre Discrete Bool on Discrete PUnit, objectCover is maximal, using a concrete local object. -/
example :
    let F := ((Functor.const (Discrete PUnit)ᵒᵖ).obj (Cat.of (Discrete Bool))).toPseudofunctor'
    objectCover F (Discrete.mk PUnit.unit) = ⊤ := by
  sorry

-- test: LocalCoverTests.distinct_discrete_objects
/-- `TauCeti.AlgebraicGeometry.LocalCoverTests.distinct_discrete_objects`: For the actual constant Discrete Bool fibre, the isomorphism sieve between false and true is empty. A nonempty fibre does not imply local connectedness; this fixture is not claimed to be a gerbe. -/
example :
    let F := ((Functor.const (Discrete PUnit)ᵒᵖ).obj (Cat.of (Discrete Bool))).toPseudofunctor'
    isomCover F (U := Discrete.mk PUnit.unit) (Discrete.mk false) (Discrete.mk true) = ⊥ := by
  sorry

-- test: LocalCoverTests.equal_discrete_objects
/-- `TauCeti.AlgebraicGeometry.LocalCoverTests.equal_discrete_objects`: For the actual constant Discrete Bool fibre, the isomorphism sieve of false with itself is maximal. -/
example :
    let F := ((Functor.const (Discrete PUnit)ᵒᵖ).obj (Cat.of (Discrete Bool))).toPseudofunctor'
    isomCover F (U := Discrete.mk PUnit.unit) (Discrete.mk false) (Discrete.mk false) = ⊤ := by
  sorry

-- test: LocalCoverTests.isom_iterated_refinement
/-- `TauCeti.AlgebraicGeometry.LocalCoverTests.isom_iterated_refinement`: For a gerbe, the actual local-isomorphism cover remains covering after two arbitrary base restrictions. -/
example [IsGerbe F J] (x y : F.obj (.mk (op U)))
    (f : V ⟶ U) (g : W ⟶ V) :
    ((isomCover F x y).pullback f).pullback g ∈ J W := by
  sorry

-- test: LocalCoverTests.isom_native_comparison
/-- `TauCeti.AlgebraicGeometry.LocalCoverTests.isom_native_comparison`: A supplied isomorphism between iterated restrictions gives an actual isomorphism between direct composite restrictions, with both native composition comparisons retained. -/
example (x y : F.obj (.mk (op U))) (f : V ⟶ U) (g : W ⟶ V)
    (h : isomCover F ((F.map f.op.toLoc).toFunctor.obj x)
      ((F.map f.op.toLoc).toFunctor.obj y) g) :
    Nonempty ((F.map (g ≫ f).op.toLoc).toFunctor.obj x ≅
      (F.map (g ≫ f).op.toLoc).toFunctor.obj y) := by
  sorry

-- test: LocalCoverTests.isom_common_cover
/-- `TauCeti.AlgebraicGeometry.LocalCoverTests.isom_common_cover`: The common refinement of an arbitrary covering sieve and the actual local-isomorphism sieve is covering. -/
example [IsGerbe F J] (x y : F.obj (.mk (op U)))
    (D : Sieve U) (hD : D ∈ J U) : D ⊓ isomCover F x y ∈ J U := by
  sorry

-- test: LocalCoverTests.overlap_member_maximal_pullback
/-- `TauCeti.AlgebraicGeometry.LocalCoverTests.overlap_member_maximal_pullback`: Pulling the overlap sieve back along a member makes it maximal, by native sieve closure. -/
example (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W)))
    (q : S ⟶ T) (h : overlapCover F i j x y q) :
    (overlapCover F i j x y).pullback q = ⊤ := by
  sorry

-- test: LocalCoverTests.overlap_swap_refinement
/-- `TauCeti.AlgebraicGeometry.LocalCoverTests.overlap_swap_refinement`: After any further restriction, exchanging the local charts preserves the exact native overlap sieve. -/
example (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W))) (q : S ⟶ T) :
    (overlapCover F i j x y).pullback q = (overlapCover F j i y x).pullback q := by
  sorry

-- test: LocalCoverTests.overlap_further_cover
/-- `TauCeti.AlgebraicGeometry.LocalCoverTests.overlap_further_cover`: The common refinement of any cover on S and a restricted overlap cover is covering, without a fibre-product hypothesis. -/
example [IsGerbe F J] (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W)))
    (q : S ⟶ T) (D : Sieve S) (hD : D ∈ J S) :
    D ⊓ (overlapCover F i j x y).pullback q ∈ J S := by
  sorry

-- test: LocalCoverTests.overlap_direct_endpoints
/-- `TauCeti.AlgebraicGeometry.LocalCoverTests.overlap_direct_endpoints`: An overlap member supplies an actual isomorphism between direct F(q≫i)x and F(q≫j)y endpoints. -/
example (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W)))
    (q : S ⟶ T) (h : overlapCover F i j x y q) :
    Nonempty ((F.map (q ≫ i).op.toLoc).toFunctor.obj x ≅
      (F.map (q ≫ j).op.toLoc).toFunctor.obj y) := by
  sorry

-- test: LocalCoverTests.overlap_iso_round_trip
/-- `TauCeti.AlgebraicGeometry.LocalCoverTests.overlap_iso_round_trip`: Postcomposing any actual arrow into the source endpoint by the chosen overlap hom and its inverse returns that arrow. -/
example (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W)))
    (q : S ⟶ T) (h : overlapCover F i j x y q)
    (z : F.obj (.mk (op S))) (a : z ⟶ (F.map (q ≫ i).op.toLoc).toFunctor.obj x) :
    (a ≫ (overlapIso F i j x y q h).hom) ≫ (overlapIso F i j x y q h).inv = a := by
  sorry

-- test: LocalCoverTests.overlap_iso_inverse_round_trip
/-- `TauCeti.AlgebraicGeometry.LocalCoverTests.overlap_iso_inverse_round_trip`: Postcomposing any actual arrow into the target endpoint by the chosen overlap inverse and hom returns that arrow. -/
example (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W)))
    (q : S ⟶ T) (h : overlapCover F i j x y q)
    (z : F.obj (.mk (op S))) (a : z ⟶ (F.map (q ≫ j).op.toLoc).toFunctor.obj y) :
    (a ≫ (overlapIso F i j x y q h).inv) ≫ (overlapIso F i j x y q h).hom = a := by
  sorry

-- test: LocalCoverTests.overlap_iso_restriction
/-- `TauCeti.AlgebraicGeometry.LocalCoverTests.overlap_iso_restriction`: Every further native restriction of the actual chosen overlap isomorphism still satisfies the hom/inverse round-trip equation. -/
example (i : T ⟶ V) (j : T ⟶ W)
    (x : F.obj (.mk (op V))) (y : F.obj (.mk (op W)))
    (q : S ⟶ T) (h : overlapCover F i j x y q) (r : R ⟶ S) :
    ((F.map r.op.toLoc).toFunctor.mapIso (overlapIso F i j x y q h)).hom ≫
      ((F.map r.op.toLoc).toFunctor.mapIso (overlapIso F i j x y q h)).inv = 𝟙 _ := by
  sorry

-- test: LocalCoverTests.overlap_same_base_path
/-- `TauCeti.AlgebraicGeometry.LocalCoverTests.overlap_same_base_path`: If i≫f=j≫g describes an actual overlap over U, the two deeper paths (q≫i)≫f and (q≫j)≫g remain equal. This does not assert a descent cocycle for chosen isomorphisms. -/
example (f : V ⟶ U) (g : W ⟶ U) (i : T ⟶ V) (j : T ⟶ W)
    (hs : i ≫ f = j ≫ g) (q : S ⟶ T) : (q ≫ i) ≫ f = (q ≫ j) ≫ g := by
  sorry

end LocalCoverTests

namespace BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U V W T S : C}
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

/-- Compare two pulled-back self-Hom charts through a specified isomorphism of restricted source objects; simultaneous endpoint transport makes the comparison choice-independent. -/
noncomputable def selfHomChartTransition (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y) :
    fibreHomSheafFunctor b b U x x ⋙ J.overMapPullback (Type v') i ≅
      fibreHomSheafFunctor b b V y y ⋙ J.overMapPullback (Type v') j :=
  fibreHomBaseChangeNatIso b b i x x ≪≫ selfHomSheafTransportNatIso b e ≪≫
    (fibreHomBaseChangeNatIso b b j y y).symm

/-- At X∈HomCategory(b,b), the local-chart transition is the actual sheaf isomorphism BC_i(X,x,x), then diagonal selfHomSheafTransportIso(X,e), then BC_j(X,y,y) inverse. The target base-change factor is inverted. -/
theorem selfHomChartTransition_app (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y)
    (X : HomCategory b b) :
    (selfHomChartTransition b i j x y e).app X =
      fibreHomBaseChangeIso b b X i x x ≪≫ selfHomSheafTransportIso b X e ≪≫
        (fibreHomBaseChangeIso b b X j y y).symm := by
  sorry

/-- For every R→T, a∈Multiplicative A(R) and actual source section p over the composed R→T→U, the transition applied to a acting on p equals the same a acting on the transported section over R→T→V. The two actions are the existing native fibreHomSectionAction; the independent coefficient universe is retained. -/
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

/-- For any two actual isomorphisms e,d:F(i)x≅F(j)y, their chart-transition natural isomorphisms are equal. This does not assert e=d; independence uses the abelian fixed-band diagonal transport theorem. -/
theorem selfHomChartTransition_independent (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (e d : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y) :
    selfHomChartTransition b i j x y e = selfHomChartTransition b i j x y d := by
  sorry

/-- For any automorphism e of F(i)x, the chart transition from i,x to itself is the identity natural isomorphism, including when e is nonidentity. -/
theorem selfHomChartTransition_refl (i : T ⟶ U) (x : F.obj (.mk (op U)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map i.op.toLoc).toFunctor.obj x) :
    selfHomChartTransition b i i x x e = Iso.refl _ := by
  sorry

/-- For three charts i:T→U,j:T→V,k:T→W with objects x,y,z, choose arbitrary e:F(i)x≅F(j)y, d:F(j)y≅F(k)z and a:F(i)x≅F(k)z. The transition for e followed by the transition for d equals the transition for a as natural isomorphisms. No equation a=e followed by d is assumed. -/
theorem selfHomChartTransition_cocycle (i : T ⟶ U) (j : T ⟶ V) (k : T ⟶ W)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V))) (z : F.obj (.mk (op W)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y)
    (d : (F.map j.op.toLoc).toFunctor.obj y ≅ (F.map k.op.toLoc).toFunctor.obj z)
    (a : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map k.op.toLoc).toFunctor.obj z) :
    selfHomChartTransition b i j x y e ≪≫ selfHomChartTransition b j k y z d =
      selfHomChartTransition b i k x z a := by
  sorry

/-- For arbitrary forward e:F(i)x≅F(j)y and backward d:F(j)y≅F(i)x, the inverse natural isomorphism of the transition for e equals the transition for d, without assuming d is the inverse of e. -/
theorem selfHomChartTransition_symm (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y)
    (d : (F.map j.op.toLoc).toFunctor.obj y ≅ (F.map i.op.toLoc).toFunctor.obj x) :
    (selfHomChartTransition b i j x y e).symm = selfHomChartTransition b j i y x d := by
  sorry

/-- For m:X→Y in the native HomCategory(b,b), i⁎H_U(m) followed by the chart transition at Y equals the chart transition at X followed by j⁎H_V(m). These are equal native sheaf maps on C/T. -/
theorem selfHomChartTransition_naturality (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y)
    {X Y : HomCategory b b} (m : X ⟶ Y) :
    (J.overMapPullback (Type v') i).map (fibreHomSheafMap b b U x x m) ≫
        (selfHomChartTransition b i j x y e).hom.app Y =
      (selfHomChartTransition b i j x y e).hom.app X ≫
        (J.overMapPullback (Type v') j).map (fibreHomSheafMap b b V y y m) := by
  sorry

/-- On a slice where two gerbe objects become isomorphic, the self-Hom chart transition is obtained from that local isomorphism and both base-change comparisons. -/
noncomputable def selfHomOverlapTransition (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (q : S ⟶ T) (h : GerbeLocalCovers.overlapCover F i j x y q) :
    fibreHomSheafFunctor b b U x x ⋙ J.overMapPullback (Type v') (q ≫ i) ≅
      fibreHomSheafFunctor b b V y y ⋙ J.overMapPullback (Type v') (q ≫ j) :=
  selfHomChartTransition b (q ≫ i) (q ≫ j) x y
    (GerbeLocalCovers.overlapIso F i j x y q h)

/-- The chosen overlap transition equals the chart transition along q followed by i and q followed by j formed with any supplied direct isomorphism between those endpoints. The equality is of complete natural isomorphisms. -/
theorem selfHomOverlapTransition_eq (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (q : S ⟶ T) (h : GerbeLocalCovers.overlapCover F i j x y q)
    (e : (F.map (q ≫ i).op.toLoc).toFunctor.obj x ≅
      (F.map (q ≫ j).op.toLoc).toFunctor.obj y) :
    selfHomOverlapTransition b i j x y q h =
      selfHomChartTransition b (q ≫ i) (q ≫ j) x y e := by
  sorry

/-- For any membership q in the diagonal overlapCover(F,i,i,x,x), the resulting overlap transition is the identity natural isomorphism. Classical choice need not select the identity fibre automorphism. -/
theorem selfHomOverlapTransition_refl (i : T ⟶ U) (x : F.obj (.mk (op U)))
    (q : S ⟶ T) (h : GerbeLocalCovers.overlapCover F i i x x q) :
    selfHomOverlapTransition b i i x x q h = Iso.refl _ := by
  sorry

/-- If the same q:S→T belongs to all three actual pairwise overlap covers for i,x; j,y; k,z, the chosen xy transition followed by the chosen yz transition equals the independently chosen xz transition. The full natural-isomorphism equality retains all fixed-band transformations and modifications. -/
theorem selfHomOverlapTransition_cocycle (i : T ⟶ U) (j : T ⟶ V) (k : T ⟶ W)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V))) (z : F.obj (.mk (op W)))
    (q : S ⟶ T) (hxy : GerbeLocalCovers.overlapCover F i j x y q)
    (hyz : GerbeLocalCovers.overlapCover F j k y z q)
    (hxz : GerbeLocalCovers.overlapCover F i k x z q) :
    selfHomOverlapTransition b i j x y q hxy ≪≫
        selfHomOverlapTransition b j k y z q hyz =
      selfHomOverlapTransition b i k x z q hxz := by
  sorry

/-- If q belongs to the xy and yx overlap covers, the inverse of the chosen xy overlap transition equals the independently chosen yx overlap transition. -/
theorem selfHomOverlapTransition_symm (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (q : S ⟶ T) (hxy : GerbeLocalCovers.overlapCover F i j x y q)
    (hyx : GerbeLocalCovers.overlapCover F j i y x q) :
    (selfHomOverlapTransition b i j x y q hxy).symm =
      selfHomOverlapTransition b j i y x q hyx := by
  sorry

/-- For any supplied J-covering sieve D on T, its intersection with the xy, yz and xz overlap covers is J-covering. Every member therefore retains membership in D and supplies all three comparisons needed for the cocycle. No fibre products, finite-cover presentation or global gerbe object is required. -/
theorem selfHomOverlapTransition_common_cover (i : T ⟶ U) (j : T ⟶ V) (k : T ⟶ W)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V))) (z : F.obj (.mk (op W)))
    (D : Sieve T) (hD : D ∈ J T) :
    D ⊓ GerbeLocalCovers.overlapCover F i j x y ⊓
      GerbeLocalCovers.overlapCover F j k y z ⊓
        GerbeLocalCovers.overlapCover F i k x z ∈ J T := by
  sorry

end BandedMorphism

namespace ChartTransitionTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A) {U V W Z T S R : C}
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

-- test: ChartTransitionTests.nonidentity_loop
/-- `TauCeti.AlgebraicGeometry.ChartTransitionTests.nonidentity_loop`: For a supplied nonidentity automorphism of F(i)x, retain its nonidentity witness while its induced chart transition equals identity. This parameterized check does not assert the existence of such an automorphism on every gerbe. -/
example (i : T ⟶ U) (x : F.obj (.mk (op U)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map i.op.toLoc).toFunctor.obj x)
    (he : e ≠ Iso.refl _) :
    e ≠ Iso.refl _ ∧ selfHomChartTransition b i i x x e = Iso.refl _ := by
  sorry

-- test: ChartTransitionTests.independent_inverse
/-- `TauCeti.AlgebraicGeometry.ChartTransitionTests.independent_inverse`: An arbitrary independently chosen reverse transition composed after the forward transition gives the identity actual sheaf map at every X; no inverse relation between the chosen fibre isomorphisms is assumed. -/
example (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y)
    (d : (F.map j.op.toLoc).toFunctor.obj y ≅ (F.map i.op.toLoc).toFunctor.obj x)
    (X : HomCategory b b) :
    ((selfHomChartTransition b i j x y e).app X).hom ≫
      ((selfHomChartTransition b j i y x d).app X).hom = 𝟙 _ := by
  sorry

-- test: ChartTransitionTests.empty_sections
/-- `TauCeti.AlgebraicGeometry.ChartTransitionTests.empty_sections`: If the source sheaf has empty sections on R→T, the target section type is empty via the actual inverse transition; no global or local section is chosen. -/
example (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map j.op.toLoc).toFunctor.obj y)
    (X : HomCategory b b) (R : Over T)
    [IsEmpty (((J.overMapPullback (Type v') i).obj (fibreHomSheaf b b U x x X)).obj.obj (op R))] :
    IsEmpty (((J.overMapPullback (Type v') j).obj (fibreHomSheaf b b V y y X)).obj.obj (op R)) := by
  sorry

-- test: ChartTransitionTests.four_charts
/-- `TauCeti.AlgebraicGeometry.ChartTransitionTests.four_charts`: Three successive transitions among four charts at a common base equal the transition formed using any independently supplied direct isomorphism from the first restricted object to the fourth. -/
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
/-- `TauCeti.AlgebraicGeometry.ChartTransitionTests.covered_triple`: On the covering intersection of an arbitrary cover and three pairwise overlap covers, every member retains the arbitrary-cover membership and satisfies the actual chosen-transition cocycle. -/
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
/-- `TauCeti.AlgebraicGeometry.ChartTransitionTests.chosen_versus_supplied`: At each fixed-band self-transformation, the chosen overlap transition equals the explicit three-factor sheaf comparison formed with any supplied direct endpoint isomorphism. -/
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
/-- `TauCeti.AlgebraicGeometry.ChartTransitionTests.overlap_coefficient`: The chosen overlap transition carries the action of each actual coefficient section a on a source section to the action of exactly the same a on its image, including nontrivial and nonfaithful base restrictions. -/
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
/-- `TauCeti.AlgebraicGeometry.ChartTransitionTests.modifications_on_overlap`: The chosen overlap comparison commutes with the composite of two arbitrary native fixed-band modifications. Both pullback functors and all modification components remain in the equation. -/
example (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (q : S ⟶ T) (h : GerbeLocalCovers.overlapCover F i j x y q)
    {X Y Z : HomCategory b b} (m : X ⟶ Y) (n : Y ⟶ Z) :
    (J.overMapPullback (Type v') (q ≫ i)).map (fibreHomSheafMap b b U x x (m ≫ n)) ≫
        (selfHomOverlapTransition b i j x y q h).hom.app Z =
      (selfHomOverlapTransition b i j x y q h).hom.app X ≫
        (J.overMapPullback (Type v') (q ≫ j)).map (fibreHomSheafMap b b V y y (m ≫ n)) := by
  sorry

end ChartTransitionTests

namespace BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 800000
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U V W T S R : C}
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

/-- Simultaneous self-Hom transport commutes with the native slice base-change isomorphism. -/
theorem selfHomSheafTransportIso_baseChange (X : HomCategory b b) (q : S ⟶ T)
    {x y : F.obj (.mk (op T))} (e : x ≅ y) :
    (J.overMapPullback (Type v') q).mapIso (selfHomSheafTransportIso b X e) ≪≫
        fibreHomBaseChangeIso b b X q y y =
      fibreHomBaseChangeIso b b X q x x ≪≫
        selfHomSheafTransportIso b X ((F.map q.op.toLoc).toFunctor.mapIso e) := by
  sorry

/-- Pulling back a self-Hom chart transition agrees with the refined transition after the slice composition comparisons. -/
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

/-- Refining a self-Hom chart identifies iterated slice pullback with pullback along the composite base arrow. -/
noncomputable def selfHomChartRefinement (i : T ⟶ U) (q : S ⟶ T)
    (x : F.obj (.mk (op U))) :
    (fibreHomSheafFunctor b b U x x ⋙ J.overMapPullback (Type v') i) ⋙
        J.overMapPullback (Type v') q ≅
      fibreHomSheafFunctor b b U x x ⋙ J.overMapPullback (Type v') (q ≫ i) :=
  Functor.associator _ _ _ ≪≫ Functor.isoWhiskerLeft (fibreHomSheafFunctor b b U x x)
    (J.overMapPullbackComp (Type v') q i)

/-- At each X in HomCategory(b,b), the refinement isomorphism is exactly native overMapPullbackComp(q,i) evaluated at the actual fibreHomSheaf(b,b,U,x,x,X). -/
theorem selfHomChartRefinement_app (i : T ⟶ U) (q : S ⟶ T)
    (x : F.obj (.mk (op U))) (X : HomCategory b b) :
    (selfHomChartRefinement b i q x).app X =
      (J.overMapPullbackComp (Type v') q i).app (fibreHomSheaf b b U x x X) := by
  sorry

/-- The forward component at X of the Hom-sheaf refinement equals the hom of native overMapPullbackComp(q,i) at H_U(x,x;X), with its actual iterated and direct pullback endpoints. -/
theorem selfHomChartRefinement_hom (i : T ⟶ U) (q : S ⟶ T)
    (x : F.obj (.mk (op U))) (X : HomCategory b b) :
    (selfHomChartRefinement b i q x).hom.app X =
      ((J.overMapPullbackComp (Type v') q i).app (fibreHomSheaf b b U x x X)).hom := by
  sorry

/-- The inverse component at X of the Hom-sheaf refinement equals the inv of native overMapPullbackComp(q,i) at H_U(x,x;X), retaining the reversed endpoints. -/
theorem selfHomChartRefinement_inv (i : T ⟶ U) (q : S ⟶ T)
    (x : F.obj (.mk (op U))) (X : HomCategory b b) :
    (selfHomChartRefinement b i q x).inv.app X =
      ((J.overMapPullbackComp (Type v') q i).app (fibreHomSheaf b b U x x X)).inv := by
  sorry

/-- Whisker the chart transition for e by q⁎ and follow it by the j-chart refinement. The resulting natural isomorphism equals the i-chart refinement followed by the chart transition for any independently chosen d over S. This equality holds on the entire native category HomCategory(b,b), not merely on selected objects or isomorphism classes. -/
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

/-- The inverse j-chart refinement followed by the inverse whiskered chart transition equals the inverse deep chart transition followed by the inverse i-chart refinement, for the same arbitrary independent e and d. -/
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

/-- For any L∈C/S and actual section p of q⁎i⁎H_U(x,x;X) on L, applying the transition for e on Over.map(q)(L), then the j-refinement, equals applying the i-refinement then the transition for arbitrary d on L. No section existence, faithfulness of restrictions, or global object is assumed. -/
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

/-- Once an overlap isomorphism exists on a slice, its isomorphism sieve there is maximal. -/
theorem selfHomOverlapTransition_refined_cover (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (q : S ⟶ T) (h : GerbeLocalCovers.overlapCover F i j x y q) :
    GerbeLocalCovers.overlapCover F (q ≫ i) (q ≫ j) x y = ⊤ := by
  sorry

/-- Refining a locally chosen overlap transition agrees with the transition of refined charts, through the two native chart-refinement isomorphisms. -/
theorem selfHomOverlapTransition_refinement (i : T ⟶ U) (j : T ⟶ V)
    (x : F.obj (.mk (op U))) (y : F.obj (.mk (op V)))
    (q : S ⟶ T) (h : GerbeLocalCovers.overlapCover F i j x y q)
    (r : R ⟶ S) (hr : GerbeLocalCovers.overlapCover F (q ≫ i) (q ≫ j) x y r) :
    Functor.isoWhiskerRight (selfHomOverlapTransition b i j x y q h)
        (J.overMapPullback (Type v') r) ≪≫ selfHomChartRefinement b (q ≫ j) r y =
      selfHomChartRefinement b (q ≫ i) r x ≪≫
        selfHomOverlapTransition b (q ≫ i) (q ≫ j) x y r hr := by
  sorry

end BandedMorphism

namespace ChartRefinementTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U V W T S R : C}
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

-- test: ChartRefinementTests.native_inverse
/-- `TauCeti.AlgebraicGeometry.ChartRefinementTests.native_inverse`: The actual forward refinement followed by its inverse is identity, and the inverse component is exactly the native slice-pullback composition inverse. -/
example (i : T ⟶ U) (q : S ⟶ T) (x : F.obj (.mk (op U)))
    (X : HomCategory b b) :
    (selfHomChartRefinement b i q x).hom.app X ≫
        (selfHomChartRefinement b i q x).inv.app X = 𝟙 _ ∧
      (selfHomChartRefinement b i q x).inv.app X =
        ((J.overMapPullbackComp (Type v') q i).app (fibreHomSheaf b b U x x X)).inv := by
  sorry

-- test: ChartRefinementTests.empty_sections
/-- `TauCeti.AlgebraicGeometry.ChartRefinementTests.empty_sections`: Empty sections of the iterated pullback force empty sections of the direct pullback via the actual inverse refinement; no section is chosen. -/
example (i : T ⟶ U) (q : S ⟶ T) (x : F.obj (.mk (op U)))
    (X : HomCategory b b) (L : Over S)
    [IsEmpty (((J.overMapPullback (Type v') q).obj
      ((J.overMapPullback (Type v') i).obj (fibreHomSheaf b b U x x X))).obj.obj (op L))] :
    IsEmpty (((J.overMapPullback (Type v') (q ≫ i)).obj
      (fibreHomSheaf b b U x x X)).obj.obj (op L)) := by
  sorry

-- test: ChartRefinementTests.arbitrary_section
/-- `TauCeti.AlgebraicGeometry.ChartRefinementTests.arbitrary_section`: An arbitrary section on an arbitrary object of C/S satisfies the refinement square with an independently chosen deep overlap map. -/
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
/-- `TauCeti.AlgebraicGeometry.ChartRefinementTests.independent_choice`: Retain a supplied witness d≠a for two deep fibre isomorphisms, while their induced chart transitions agree and either gives the full refinement square. This conditional test does not construct distinct isomorphisms in every gerbe. -/
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
/-- `TauCeti.AlgebraicGeometry.ChartRefinementTests.covered_refinement`: Actual original overlap membership implies the next overlap sieve is maximal; for every r it supplies membership and the complete chosen-transition refinement square. -/
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
/-- `TauCeti.AlgebraicGeometry.ChartRefinementTests.natural_modifications`: The refinement commutes with the composite of two arbitrary native fixed-band modifications, retaining all three actual pullback maps. -/
example (i : T ⟶ U) (q : S ⟶ T) (x : F.obj (.mk (op U)))
    {X Y Z : HomCategory b b} (m : X ⟶ Y) (n : Y ⟶ Z) :
    (J.overMapPullback (Type v') q).map
        ((J.overMapPullback (Type v') i).map (fibreHomSheafMap b b U x x (m ≫ n))) ≫
        (selfHomChartRefinement b i q x).hom.app Z =
      (selfHomChartRefinement b i q x).hom.app X ≫
        (J.overMapPullback (Type v') (q ≫ i)).map (fibreHomSheafMap b b U x x (m ≫ n)) := by
  sorry

-- test: ChartRefinementTests.nonidentity_loop
/-- `TauCeti.AlgebraicGeometry.ChartRefinementTests.nonidentity_loop`: Retain a supplied nonidentity chart automorphism while its pulled-back transition followed by refinement equals refinement. Existence of nonidentity automorphisms on every gerbe is not claimed. -/
example (i : T ⟶ U) (x : F.obj (.mk (op U)))
    (e : (F.map i.op.toLoc).toFunctor.obj x ≅ (F.map i.op.toLoc).toFunctor.obj x)
    (he : e ≠ Iso.refl _) (q : S ⟶ T) :
    e ≠ Iso.refl _ ∧ Functor.isoWhiskerRight (selfHomChartTransition b i i x x e)
        (J.overMapPullback (Type v') q) ≪≫ selfHomChartRefinement b i q x =
      selfHomChartRefinement b i q x := by
  sorry

-- test: ChartRefinementTests.refined_cocycle
/-- `TauCeti.AlgebraicGeometry.ChartRefinementTests.refined_cocycle`: Pulling back the composite of two chart transitions and then refining the last chart equals refining the first chart and using an independently chosen direct deep transition. -/
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

end ChartRefinementTests

namespace BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

/-- Pairs (x,p : x ≅ X(x)) are identified exactly by simultaneous transport along a fibre isomorphism. Distinct p at fixed x remain distinct. -/
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

/-- The classes of arbitrary pairs (x,p) and (y,q) in the native quotient are equal if and only if some e:x≅y transports p to q. This is an existence statement and chooses no isomorphism. -/
theorem selfHomOrbit_mk_eq (U : C) (X : HomCategory b b)
    (p q : Σ x : F.obj (.mk (op U)), x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    Quotient.mk (selfHomOrbitSetoid b U X) p = Quotient.mk _ q ↔
      ∃ e : p.1 ≅ q.1, (selfTransportActionIso b X e).hom.hom p.2 = q.2 := by
  sorry

/-- For each actual x in F(U), the function p↦[(x,p)] from isomorphisms x≅X_U(x) to chart-pair classes is injective. No global object of the gerbe is required. -/
theorem selfHomOrbit_mk_injective (U : C) (X : HomCategory b b)
    (x : F.obj (.mk (op U))) :
    Function.Injective (fun p : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x =>
      Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,p⟩) := by
  sorry

/-- Restrict an orbit class by restricting its object and its actual self-Hom arrow through the strong-transformation comparison. -/
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

/-- Restriction of the class represented by (x,p) is exactly the class represented by (F(f)x,res_f(p)); the StrongTrans comparison in res_f is retained. -/
theorem selfHomOrbitRestrict_mk (X : HomCategory b b) {U V : C} (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (p : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    selfHomOrbitRestrict b X f (Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,p⟩) =
      Quotient.mk (selfHomOrbitSetoid b V X) ⟨(F.map f.op.toLoc).toFunctor.obj x,
        (fibreIsomRestriction b b X f x x).hom p⟩ := by
  sorry

/-- Restriction along the identity of U is the identity function on all chart-pair classes, even when the pseudofunctor identity comparison is not a definitional equality. -/
theorem selfHomOrbitRestrict_id (X : HomCategory b b) (U : C)
    (p : Quotient (selfHomOrbitSetoid b U X)) : selfHomOrbitRestrict b X (𝟙 U) p = p := by
  sorry

/-- For f:V→U and g:W→V, restriction along g followed by f equals restriction along f and then along g, on every chart-pair class. The equivalence witness is the actual component of F.mapComp. -/
theorem selfHomOrbitRestrict_comp (X : HomCategory b b) {U V W : C}
    (f : V ⟶ U) (g : W ⟶ V) (p : Quotient (selfHomOrbitSetoid b U X)) :
    selfHomOrbitRestrict b X (g ≫ f) p =
      selfHomOrbitRestrict b X g (selfHomOrbitRestrict b X f p) := by
  sorry

/-- Orbit classes of pairs (x,p : x ≅ X(x)) form a presheaf with restriction respecting the pseudofunctor unit and composition comparisons. -/
noncomputable def selfHomOrbitPresheaf (X : HomCategory b b) :
    Cᵒᵖ ⥤ Type (max u' v') where
  obj U := Quotient (selfHomOrbitSetoid b U.unop X)
  map f := TypeCat.ofHom (selfHomOrbitRestrict b X f.unop)
  map_id U := by ext p; exact selfHomOrbitRestrict_id b X U.unop p
  map_comp f g := by ext p; exact selfHomOrbitRestrict_comp b X f.unop g.unop p

/-- A modification acts on an orbit class by postcomposition with its component at the chosen source object. -/
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

/-- The map for m:X→Y sends the represented class (x,p) exactly to the class (x,p followed by componentIso(m,U,x)). -/
theorem selfHomOrbitMap_mk {X Y : HomCategory b b} (m : X ⟶ Y) (U : C)
    (x : F.obj (.mk (op U))) (p : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    selfHomOrbitMap b m U (Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,p⟩) =
      Quotient.mk (selfHomOrbitSetoid b U Y) ⟨x, p ≪≫ componentIso b b m U x⟩ := by
  sorry

/-- The quotient map induced by the identity modification of X fixes every class over every U. -/
theorem selfHomOrbitMap_id (X : HomCategory b b) (U : C)
    (p : Quotient (selfHomOrbitSetoid b U X)) : selfHomOrbitMap b (𝟙 X) U p = p := by
  sorry

/-- For m:X→Y and n:Y→Z, the quotient map for m followed by n equals the map for m then the map for n, on every class over U. -/
theorem selfHomOrbitMap_comp {X Y Z : HomCategory b b} (m : X ⟶ Y) (n : Y ⟶ Z)
    (U : C) (p : Quotient (selfHomOrbitSetoid b U X)) :
    selfHomOrbitMap b (m ≫ n) U p = selfHomOrbitMap b n U (selfHomOrbitMap b m U p) := by
  sorry

/-- For m:X→Y and f:V→U, restriction of the m-image of any class equals the m-image over V of its restriction from U. -/
theorem selfHomOrbitMap_restrict {X Y : HomCategory b b} (m : X ⟶ Y) {U V : C}
    (f : V ⟶ U) (p : Quotient (selfHomOrbitSetoid b U X)) :
    selfHomOrbitRestrict b Y f (selfHomOrbitMap b m U p) =
      selfHomOrbitMap b m V (selfHomOrbitRestrict b X f p) := by
  sorry

/-- The orbit presheaf varies functorially in band-preserving endomorphisms and every modification. -/
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

/-- After universe lift and sheafification, the orbit presheaves define the global self-Hom sheaf functor; sheafification may create global sections. -/
noncomputable def selfHomGlobalSheafFunctor :
    HomCategory b b ⥤ Sheaf J (Type (max u v u' v')) :=
  selfHomOrbitFunctor b ⋙
    (Functor.whiskeringRight Cᵒᵖ (Type (max u' v')) (Type (max u v u' v'))).obj
      uliftFunctor.{max u v, max u' v'} ⋙ presheafToSheaf J (Type (max u v u' v'))

/-- The global candidate at X is exactly the native sheafification of P_X postcomposed with ULift to Type(max(u,v,u′,v′)). -/
theorem selfHomGlobalSheafFunctor_obj (X : HomCategory b b) :
    (selfHomGlobalSheafFunctor b).obj X =
      (presheafToSheaf J (Type (max u v u' v'))).obj
        (selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v, max u' v'}) := by
  sorry

/-- For any m:X→Y, its global sheaf map followed by the map for the native inverse modification is the identity of the global sheaf at X. -/
theorem selfHomGlobalSheafFunctor_map_inverse {X Y : HomCategory b b} (m : X ⟶ Y) :
    (selfHomGlobalSheafFunctor b).map m ≫
        (selfHomGlobalSheafFunctor b).map (homIso b b m).inv = 𝟙 _ := by
  sorry

/-- The ULift-whiskered presheaf map induced by m followed by the sheafification unit at Y equals the unit at X followed by the underlying global sheaf map of m. -/
theorem selfHomGlobalSheafFunctor_unit_naturality {X Y : HomCategory b b} (m : X ⟶ Y) :
    Functor.whiskerRight ((selfHomOrbitFunctor b).map m) uliftFunctor.{max u v, max u' v'} ≫
        toSheafify J (selfHomOrbitPresheaf b Y ⋙ uliftFunctor.{max u v, max u' v'}) =
      toSheafify J (selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v, max u' v'}) ≫
        ((selfHomGlobalSheafFunctor b).map m).hom := by
  sorry

/-- For every e:x≅y in F(U), the class represented by (x,p) equals the class represented by (y,transport_e(p)). The witness is the supplied e itself. -/
theorem selfHomOrbit_mk_transport (U : C) (X : HomCategory b b)
    {x y : F.obj (.mk (op U))} (e : x ≅ y)
    (p : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,p⟩ =
      Quotient.mk (selfHomOrbitSetoid b U X) ⟨y,(selfTransportActionIso b X e).hom.hom p⟩ := by
  sorry

/-- Applying the map of m:X→Y and then its native inverse modification recovers every quotient section over U. -/
theorem selfHomOrbitMap_inverse {X Y : HomCategory b b} (m : X ⟶ Y)
    (U : C) (p : Quotient (selfHomOrbitSetoid b U X)) :
    selfHomOrbitMap b (homIso b b m).inv U (selfHomOrbitMap b m U p) = p := by
  sorry

/-- For any sheaf Q in the stated type universe, two sheaf morphisms from the global candidate at X to Q are equal if their underlying presheaf maps agree after precomposition with the actual sheafification unit of ULift(P_X). -/
theorem selfHomGlobalSheafFunctor_hom_ext (X : HomCategory b b)
    (Q : Sheaf J (Type (max u v u' v')))
    (f g : (selfHomGlobalSheafFunctor b).obj X ⟶ Q)
    (h : toSheafify J (selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v, max u' v'}) ≫ f.hom =
      toSheafify J (selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v, max u' v'}) ≫ g.hom) :
    f = g := by
  sorry

/-- For every target sheaf Q and presheaf morphism ULift(P_X)→Q, there exists a unique sheaf morphism from the global candidate at X to Q whose underlying map restricts to the given morphism along the actual sheafification unit. -/
theorem selfHomGlobalSheafFunctor_universal (X : HomCategory b b)
    (Q : Sheaf J (Type (max u v u' v')))
    (f : selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v, max u' v'} ⟶ Q.obj) :
    ∃! g : (selfHomGlobalSheafFunctor b).obj X ⟶ Q,
      toSheafify J (selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v, max u' v'}) ≫ g.hom = f := by
  sorry

end BandedMorphism

namespace GlobalHomTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
  {U V W : C}
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

-- test: GlobalHomTests.transport_chain
/-- `TauCeti.AlgebraicGeometry.GlobalHomTests.transport_chain`: Two consecutive actual transports give the same quotient class as the initial representative. -/
example (X : HomCategory b b) {x y z : F.obj (.mk (op U))}
    (e : x ≅ y) (d : y ≅ z) (p : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,p⟩ =
      Quotient.mk (selfHomOrbitSetoid b U X)
        ⟨z,(selfTransportActionIso b X d).hom.hom ((selfTransportActionIso b X e).hom.hom p)⟩ := by
  sorry

-- test: GlobalHomTests.unequal_arrows
/-- `TauCeti.AlgebraicGeometry.GlobalHomTests.unequal_arrows`: A supplied pair of distinct isomorphisms at the same chart remains distinct in the raw quotient; existence of such a pair on every gerbe is not asserted. -/
example (X : HomCategory b b) (x : F.obj (.mk (op U)))
    (p q : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) (h : p ≠ q) :
    Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,p⟩ ≠
      Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,q⟩ := by
  sorry

-- test: GlobalHomTests.empty_fibre
/-- `TauCeti.AlgebraicGeometry.GlobalHomTests.empty_fibre`: An empty fibre forces an empty raw presheaf section carrier. No emptiness of its sheafification is asserted. -/
example (X : HomCategory b b) [IsEmpty (F.obj (.mk (op U)))] :
    IsEmpty ((selfHomOrbitPresheaf b X).obj (op U)) := by
  sorry

-- test: GlobalHomTests.two_restrictions
/-- `TauCeti.AlgebraicGeometry.GlobalHomTests.two_restrictions`: The actual presheaf restriction through two arrows agrees with restriction along their composite on arbitrary quotient sections. -/
example (X : HomCategory b b) (f : V ⟶ U) (g : W ⟶ V)
    (p : (selfHomOrbitPresheaf b X).obj (op U)) :
    (selfHomOrbitPresheaf b X).map g.op ((selfHomOrbitPresheaf b X).map f.op p) =
      (selfHomOrbitPresheaf b X).map (g ≫ f).op p := by
  sorry

-- test: GlobalHomTests.change_representative
/-- `TauCeti.AlgebraicGeometry.GlobalHomTests.change_representative`: Restrict two representatives related by an arbitrary fibre isomorphism; their explicit restricted representatives define the same class. -/
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
/-- `TauCeti.AlgebraicGeometry.GlobalHomTests.identity_comparison`: The explicitly restricted pair over the identity gives the original class although its object is F(id)(x), retaining the actual pseudofunctor identity comparison. -/
example (X : HomCategory b b) (x : F.obj (.mk (op U)))
    (p : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x) :
    Quotient.mk (selfHomOrbitSetoid b U X)
        ⟨(F.map (𝟙 U).op.toLoc).toFunctor.obj x,
          (fibreIsomRestriction b b X (𝟙 U) x x).hom p⟩ =
      Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,p⟩ := by
  sorry

-- test: GlobalHomTests.inverse_modification
/-- `TauCeti.AlgebraicGeometry.GlobalHomTests.inverse_modification`: The actual orbit-presheaf natural transformation for a modification followed by its native inverse recovers each section. -/
example {X Y : HomCategory b b} (m : X ⟶ Y)
    (p : (selfHomOrbitPresheaf b X).obj (op U)) :
    ((selfHomOrbitFunctor b).map (homIso b b m).inv).app (op U)
        (((selfHomOrbitFunctor b).map m).app (op U) p) = p := by
  sorry

-- test: GlobalHomTests.modification_restriction
/-- `TauCeti.AlgebraicGeometry.GlobalHomTests.modification_restriction`: Two arbitrary modifications interleaved with two restrictions agree with the composite modification after composite restriction. -/
example {X Y Z : HomCategory b b} (m : X ⟶ Y) (n : Y ⟶ Z)
    (f : V ⟶ U) (g : W ⟶ V) (p : (selfHomOrbitPresheaf b X).obj (op U)) :
    selfHomOrbitRestrict b Z g
        (selfHomOrbitMap b n V (selfHomOrbitRestrict b Y f (selfHomOrbitMap b m U p))) =
      selfHomOrbitMap b (m ≫ n) W (selfHomOrbitRestrict b X (g ≫ f) p) := by
  sorry

-- test: GlobalHomTests.nonidentity_modification
/-- `TauCeti.AlgebraicGeometry.GlobalHomTests.nonidentity_modification`: If an actual modification changes a supplied fibre isomorphism by postcomposition, its raw quotient map changes that represented class; it is not silently collapsed to identity. -/
example (X : HomCategory b b) (m : X ⟶ X) (x : F.obj (.mk (op U)))
    (p : x ≅ (X.obj.app (.mk (op U))).toFunctor.obj x)
    (h : p ≪≫ componentIso b b m U x ≠ p) :
    selfHomOrbitMap b m U (Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,p⟩) ≠
      Quotient.mk (selfHomOrbitSetoid b U X) ⟨x,p⟩ := by
  sorry

-- test: GlobalHomTests.unit_restriction
/-- `TauCeti.AlgebraicGeometry.GlobalHomTests.unit_restriction`: On arbitrary raw quotient sections, the actual global sheaf restriction commutes with the ULift sheafification unit. -/
example (X : HomCategory b b) (f : V ⟶ U)
    (p : (selfHomOrbitPresheaf b X).obj (op U)) :
    ((selfHomGlobalSheafFunctor b).obj X).obj.map f.op
        ((toSheafify J (selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v, max u' v'})).app
          (op U) (ULift.up p)) =
      (toSheafify J (selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v, max u' v'})).app
        (op V) (ULift.up (selfHomOrbitRestrict b X f p)) := by
  sorry

-- test: GlobalHomTests.unit_modification
/-- `TauCeti.AlgebraicGeometry.GlobalHomTests.unit_modification`: The global sheaf map on the image of an explicit pair under the unit is the unit image of postcomposition by the actual modification component. -/
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
/-- `TauCeti.AlgebraicGeometry.GlobalHomTests.universal_target`: For an arbitrary sheaf target, every map out of the lifted orbit presheaf has a unique actual sheaf-morphism extension along the unit. -/
example (X : HomCategory b b) (Q : Sheaf J (Type (max u v u' v')))
    (f : selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v, max u' v'} ⟶ Q.obj) :
    ∃! g : (selfHomGlobalSheafFunctor b).obj X ⟶ Q,
      toSheafify J (selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v, max u' v'}) ≫ g.hom = f := by
  sorry

-- test: GlobalHomTests.generator_ext
/-- `TauCeti.AlgebraicGeometry.GlobalHomTests.generator_ext`: Agreement on the unit images of every represented pair at every U implies equality of actual sheaf morphisms to any target sheaf, by quotient induction and the native universal property. -/
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
/-- `TauCeti.AlgebraicGeometry.GlobalHomTests.global_inverse`: Apply the inverse global map and then the forward map to an arbitrary sheafified section; it returns the section, without assuming a representative or unit surjectivity. -/
example {X Y : HomCategory b b} (m : X ⟶ Y)
    (p : ((selfHomGlobalSheafFunctor b).obj Y).obj.obj (op U)) :
    (((selfHomGlobalSheafFunctor b).map m).hom.app (op U))
        ((((selfHomGlobalSheafFunctor b).map (homIso b b m).inv).hom.app (op U)) p) = p := by
  sorry

-- test: GlobalHomTests.global_composition
/-- `TauCeti.AlgebraicGeometry.GlobalHomTests.global_composition`: Composition holds as equality of actual presheaf natural transformations and of actual global sheaf morphisms. -/
example {X Y Z : HomCategory b b} (m : X ⟶ Y) (n : Y ⟶ Z) :
    (selfHomOrbitFunctor b).map (m ≫ n) =
      (selfHomOrbitFunctor b).map m ≫ (selfHomOrbitFunctor b).map n ∧
    (selfHomGlobalSheafFunctor b).map (m ≫ n) =
      (selfHomGlobalSheafFunctor b).map m ≫ (selfHomGlobalSheafFunctor b).map n := by
  sorry

end GlobalHomTests

namespace BandedMorphism
open CategoryTheory Opposite Bicategory
open scoped Pseudofunctor.StrongTrans
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

/-- The self-Hom section-to-isomorphism comparison commutes with deeper restriction after the pseudofunctor composite-endpoint transport. -/
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

/-- Send a slice Hom section to its orbit class at the restricted source object, preserving the strong-transformation endpoint comparison. -/
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

/-- At every T of Over U, the lifted chart-to-orbit component is injective. Equality is tested at the same pulled-back object, so no local or global choice of isomorphism is required. -/
theorem selfHomChartToOrbit_injective (X : HomCategory b b) (U : C)
    (x : F.obj (.mk (op U))) (T : Over U) :
    Function.Injective ((selfHomChartToOrbit b X U x).app (op T)) := by
  sorry

/-- For every actual chart x over U, the chart-to-orbit natural transformation is locally surjective for the native topology J.over U. This covers arbitrary quotient sections, and is not a claim of global surjectivity of the raw chart map. -/
theorem selfHomChartToOrbit_locallySurjective (X : HomCategory b b) (U : C)
    (x : F.obj (.mk (op U))) :
    Presheaf.IsLocallySurjective (J.over U) (selfHomChartToOrbit b X U x) := by
  sorry

/-- Compose the chart-to-orbit map with the sheafification unit, obtaining the native map to the restriction of the global self-Hom sheaf. -/
noncomputable def selfHomChartToGlobal (X : HomCategory b b) (U : C)
    (x : F.obj (.mk (op U))) :
    (sheafCompose (J.over U) uliftFunctor.{max u v u',v'}).obj
      (fibreHomSheaf b b U x x X) ⟶ ((selfHomGlobalSheafFunctor b).obj X).over U where
  hom := selfHomChartToOrbit b X U x ≫
    Functor.whiskerLeft (Over.forget U).op
      (toSheafify J (selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v,max u' v'}))

/-- Assuming the explicit native class J.WEqualsLocallyBijective(Type(max(u,v,u′,v′))), the local chart-to-global sheaf morphism is an isomorphism. The native instance supplies this assumption automatically when the fibre object and morphism universes are u and v. No unconditional larger-universe instance is asserted. -/
theorem selfHomChartToGlobal_isIso [J.WEqualsLocallyBijective (Type (max u v u' v'))]
    (X : HomCategory b b) (U : C)
    (x : F.obj (.mk (op U))) : IsIso (selfHomChartToGlobal b X U x) := by
  sorry

/-- With the stated sheafification and local-bijection comparison assumptions, each native self-Hom chart identifies with the slice restriction of the global sheaf. -/
noncomputable def selfHomChartGlobalIso [J.WEqualsLocallyBijective (Type (max u v u' v'))]
    (X : HomCategory b b) (U : C)
    (x : F.obj (.mk (op U))) :
    (sheafCompose (J.over U) uliftFunctor.{max u v u',v'}).obj
      (fibreHomSheaf b b U x x X) ≅ ((selfHomGlobalSheafFunctor b).obj X).over U := by
  letI := selfHomChartToGlobal_isIso b X U x
  exact asIso (selfHomChartToGlobal b X U x)

/-- The forward morphism of selfHomChartGlobalIso is exactly selfHomChartToGlobal, under the same explicit native local-bijectivity hypothesis. -/
theorem selfHomChartGlobalIso_hom [J.WEqualsLocallyBijective (Type (max u v u' v'))]
    (X : HomCategory b b) (U : C)
    (x : F.obj (.mk (op U))) :
    (selfHomChartGlobalIso b X U x).hom = selfHomChartToGlobal b X U x := by
  sorry

/-- At T→U the chart-to-orbit map sends ULift(p) to ULift of the class represented by the actual pulled-back object F(T→U)x and fibreHomTransportIsoEquiv(p). -/
theorem selfHomChartToOrbit_apply (X : HomCategory b b) (U : C)
    (x : F.obj (.mk (op U))) (T : Over U)
    (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    (selfHomChartToOrbit b X U x).app (op T) (ULift.up p) =
      ULift.up (Quotient.mk (selfHomOrbitSetoid b T.left X)
        ⟨(F.map T.hom.op.toLoc).toFunctor.obj x,
          fibreHomTransportIsoEquiv b b U x x X T p⟩) := by
  sorry

/-- Under the explicit native local-bijectivity hypothesis, the comparison isomorphism sends a lifted local section to the image of its specified orbit class under the actual global sheafification unit. -/
theorem selfHomChartGlobalIso_apply [J.WEqualsLocallyBijective (Type (max u v u' v'))]
    (X : HomCategory b b) (U : C)
    (x : F.obj (.mk (op U))) (T : Over U)
    (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    (selfHomChartGlobalIso b X U x).hom.hom.app (op T) (ULift.up p) =
      (toSheafify J (selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v,max u' v'})).app
        (op T.left) ((selfHomChartToOrbit b X U x).app (op T) (ULift.up p)) := by
  sorry

/-- For every native fixed-band modification m:X→Y, the square of local Hom-sheaf maps, chart-to-orbit maps and the actual global orbit-presheaf map commutes as equality of natural transformations. -/
theorem selfHomChartToOrbit_modification {X Y : HomCategory b b} (m : X ⟶ Y)
    (U : C) (x : F.obj (.mk (op U))) :
    Functor.whiskerRight (fibreHomSheafMap b b U x x m).hom uliftFunctor.{max u v u',v'} ≫
        selfHomChartToOrbit b Y U x =
      selfHomChartToOrbit b X U x ≫ Functor.whiskerLeft (Over.forget U).op
        (Functor.whiskerRight ((selfHomOrbitFunctor b).map m)
          uliftFunctor.{max u v,max u' v'}) := by
  sorry

/-- For every native modification, the local chart-to-global morphisms intertwine the lifted local Hom-sheaf map and the restriction of the actual global sheaf map. The equality holds without WEqualsLocallyBijective. -/
theorem selfHomChartToGlobal_modification {X Y : HomCategory b b} (m : X ⟶ Y)
    (U : C) (x : F.obj (.mk (op U))) :
    (sheafCompose (J.over U) uliftFunctor.{max u v u',v'}).map
        (fibreHomSheafMap b b U x x m) ≫ selfHomChartToGlobal b Y U x =
      selfHomChartToGlobal b X U x ≫
        (J.overPullback (Type (max u v u' v')) U).map ((selfHomGlobalSheafFunctor b).map m) := by
  sorry

/-- For every actual e:x≅y over U, mapping a local section after selfHomSheafTransport(e) into orbit classes equals mapping the original section from the x chart, at every T→U. -/
theorem selfHomChartToOrbit_transport (X : HomCategory b b) (U : C)
    {x y : F.obj (.mk (op U))} (e : x ≅ y) (T : Over U)
    (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    (selfHomChartToOrbit b X U y).app (op T)
        (ULift.up ((selfHomSheafTransport b X e).hom.app (op T) p)) =
      (selfHomChartToOrbit b X U x).app (op T) (ULift.up p) := by
  sorry

/-- For f:V→U and T→V, apply the actual fibreHomBaseChangeIso to a section of the original chart pulled back along Over.map f. Its image in the chart for F(f)x equals the original chart image at (Over.map f)(T). -/
theorem selfHomChartToOrbit_baseChange (X : HomCategory b b) {U V : C}
    (f : V ⟶ U) (x : F.obj (.mk (op U))) (T : Over V)
    (p : (fibreHomSheaf b b U x x X).obj.obj (op ((Over.map f).obj T))) :
    (selfHomChartToOrbit b X V ((F.map f.op.toLoc).toFunctor.obj x)).app (op T)
        (ULift.up ((fibreHomBaseChangeIso b b X f x x).hom.hom.app (op T) p)) =
      (selfHomChartToOrbit b X U x).app (op ((Over.map f).obj T)) (ULift.up p) := by
  sorry

/-- For every e:x≅y, the lifted local transport morphism followed by the y-chart global comparison equals the x-chart global comparison, as actual sheaf morphisms and without a sheafification local-bijectivity assumption. -/
theorem selfHomChartToGlobal_transport (X : HomCategory b b) (U : C)
    {x y : F.obj (.mk (op U))} (e : x ≅ y) :
    (sheafCompose (J.over U) uliftFunctor.{max u v u',v'}).map
        (selfHomSheafTransport b X e) ≫ selfHomChartToGlobal b X U y =
      selfHomChartToGlobal b X U x := by
  sorry

/-- For every f:V→U and T→V, the actual local base-change isomorphism followed by the new-chart global map agrees on each section with the original chart map at (Over.map f)(T). The global target component is exactly the same object T.left. -/
theorem selfHomChartToGlobal_baseChange (X : HomCategory b b) {U V : C}
    (f : V ⟶ U) (x : F.obj (.mk (op U))) (T : Over V)
    (p : (fibreHomSheaf b b U x x X).obj.obj (op ((Over.map f).obj T))) :
    (selfHomChartToGlobal b X V ((F.map f.op.toLoc).toFunctor.obj x)).hom.app (op T)
        (ULift.up ((fibreHomBaseChangeIso b b X f x x).hom.hom.app (op T) p)) =
      (selfHomChartToGlobal b X U x).hom.app (op ((Over.map f).obj T)) (ULift.up p) := by
  sorry

/-- Under the explicit native local-bijectivity hypothesis, applying the actual inverse comparison and then the forward comparison returns every section of the restricted global sheaf. A quotient representative for the section is not assumed. -/
theorem selfHomChartGlobalIso_inv_hom [J.WEqualsLocallyBijective (Type (max u v u' v'))]
    (X : HomCategory b b) (U : C) (x : F.obj (.mk (op U))) (T : Over U)
    (p : (((selfHomGlobalSheafFunctor b).obj X).over U).obj.obj (op T)) :
    (selfHomChartGlobalIso b X U x).hom.hom.app (op T)
      ((selfHomChartGlobalIso b X U x).inv.hom.app (op T) p) = p := by
  sorry

/-- Under the explicit native local-bijectivity hypothesis, the inverse comparison recovers each lifted local Hom section from its forward image. -/
theorem selfHomChartGlobalIso_hom_inv [J.WEqualsLocallyBijective (Type (max u v u' v'))]
    (X : HomCategory b b) (U : C) (x : F.obj (.mk (op U))) (T : Over U)
    (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    (selfHomChartGlobalIso b X U x).inv.hom.app (op T)
      ((selfHomChartGlobalIso b X U x).hom.hom.app (op T) (ULift.up p)) = ULift.up p := by
  sorry

end BandedMorphism

namespace ChartGlobalTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
  {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe F J]
  {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
/-- Strong transformations form the native category whose arrows are modifications;
identity and composition are pointwise on their component arrows. -/
local instance : Category (Pseudofunctor.StrongTrans F F) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := F)

-- test: ChartGlobalTests.raw_distinct
/-- `TauCeti.AlgebraicGeometry.ChartGlobalTests.raw_distinct`: Two supplied distinct sections of the same local Hom sheaf remain distinct in the raw orbit image; their existence on every chart is not asserted. -/
example (X : HomCategory b b) (U : C) (x : F.obj (.mk (op U))) (T : Over U)
    (p q : (fibreHomSheaf b b U x x X).obj.obj (op T)) (hpq : p ≠ q) :
    (selfHomChartToOrbit b X U x).app (op T) (ULift.up p) ≠
      (selfHomChartToOrbit b X U x).app (op T) (ULift.up q) := by
  sorry

-- test: ChartGlobalTests.cover_of_arbitrary_class
/-- `TauCeti.AlgebraicGeometry.ChartGlobalTests.cover_of_arbitrary_class`: For an arbitrary lifted quotient section over a slice object, the native image sieve of the chart map covers; no global representative on the chosen chart is assumed. -/
example (X : HomCategory b b) (U : C) (x : F.obj (.mk (op U))) (T : Over U)
    (q : ((Over.forget U).op ⋙ (selfHomOrbitPresheaf b X ⋙
      uliftFunctor.{max u v,max u' v'})).obj (op T)) :
    Presheaf.imageSieve (selfHomChartToOrbit b X U x) q ∈ (J.over U) T := by
  sorry

-- test: ChartGlobalTests.restriction_square
/-- `TauCeti.AlgebraicGeometry.ChartGlobalTests.restriction_square`: The explicit chart map commutes with restriction along every slice arrow, with the actual local Hom restriction and global orbit restriction. -/
example (X : HomCategory b b) (U : C) (x : F.obj (.mk (op U))) {T S : Over U}
    (f : S ⟶ T) (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    (selfHomChartToOrbit b X U x).app (op S)
      (ULift.up ((fibreHomSheaf b b U x x X).obj.map f.op p)) =
    ((selfHomOrbitPresheaf b X ⋙ uliftFunctor.{max u v,max u' v'}).map f.left.op)
      ((selfHomChartToOrbit b X U x).app (op T) (ULift.up p)) := by
  sorry

-- test: ChartGlobalTests.two_transports
/-- `TauCeti.AlgebraicGeometry.ChartGlobalTests.two_transports`: Two successive actual changes of chart object followed by the global comparison give the original global comparison as sheaf morphisms. -/
example (X : HomCategory b b) (U : C) {x y z : F.obj (.mk (op U))}
    (e : x ≅ y) (d : y ≅ z) :
    (sheafCompose (J.over U) uliftFunctor.{max u v u',v'}).map (selfHomSheafTransport b X e) ≫
      (sheafCompose (J.over U) uliftFunctor.{max u v u',v'}).map (selfHomSheafTransport b X d) ≫
        selfHomChartToGlobal b X U z = selfHomChartToGlobal b X U x := by
  sorry

-- test: ChartGlobalTests.transport_choice
/-- `TauCeti.AlgebraicGeometry.ChartGlobalTests.transport_choice`: Two different supplied chart-object isomorphisms give the same raw orbit image of a local section. -/
example (X : HomCategory b b) (U : C) {x y : F.obj (.mk (op U))}
    (e d : x ≅ y) (T : Over U) (p : (fibreHomSheaf b b U x x X).obj.obj (op T)) :
    (selfHomChartToOrbit b X U y).app (op T)
        (ULift.up ((selfHomSheafTransport b X e).hom.app (op T) p)) =
      (selfHomChartToOrbit b X U y).app (op T)
        (ULift.up ((selfHomSheafTransport b X d).hom.app (op T) p)) := by
  sorry

-- test: ChartGlobalTests.two_modifications
/-- `TauCeti.AlgebraicGeometry.ChartGlobalTests.two_modifications`: Two successive local modification maps followed by the global comparison equal the original comparison followed by the actual composite global modification. -/
example {X Y Z : HomCategory b b} (m : X ⟶ Y) (n : Y ⟶ Z)
    (U : C) (x : F.obj (.mk (op U))) :
    (sheafCompose (J.over U) uliftFunctor.{max u v u',v'}).map (fibreHomSheafMap b b U x x m) ≫
      (sheafCompose (J.over U) uliftFunctor.{max u v u',v'}).map (fibreHomSheafMap b b U x x n) ≫
        selfHomChartToGlobal b Z U x =
      selfHomChartToGlobal b X U x ≫
        (J.overPullback (Type (max u v u' v')) U).map ((selfHomGlobalSheafFunctor b).map (m ≫ n)) := by
  sorry

-- test: ChartGlobalTests.refined_base_change
/-- `TauCeti.AlgebraicGeometry.ChartGlobalTests.refined_base_change`: The global comparison respects local base change after an additional arbitrary slice restriction, retaining the native Over.map and fibreHomBaseChangeIso. -/
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
/-- `TauCeti.AlgebraicGeometry.ChartGlobalTests.arbitrary_global_section`: With the explicit native local-bijectivity class, every section of the restricted global sheaf has an actual local Hom-section preimage under the comparison, without assuming that the global section is represented in the raw quotient. -/
example (X : HomCategory b b) (U : C) (x : F.obj (.mk (op U))) (T : Over U)
    (q : (((selfHomGlobalSheafFunctor b).obj X).over U).obj.obj (op T)) :
    ∃ p : (fibreHomSheaf b b U x x X).obj.obj (op T),
      (selfHomChartToGlobal b X U x).hom.app (op T) (ULift.up p) = q := by
  sorry

-- test: ChartGlobalTests.distinct_after_sheafification
/-- `TauCeti.AlgebraicGeometry.ChartGlobalTests.distinct_after_sheafification`: Under the same explicit class, two supplied distinct sections on one chart remain distinct under the actual global sheaf comparison. No global injectivity of the raw sheafification unit is claimed. -/
example (X : HomCategory b b) (U : C) (x : F.obj (.mk (op U))) (T : Over U)
    (p q : (fibreHomSheaf b b U x x X).obj.obj (op T)) (hpq : p ≠ q) :
    (selfHomChartToGlobal b X U x).hom.app (op T) (ULift.up p) ≠
      (selfHomChartToGlobal b X U x).hom.app (op T) (ULift.up q) := by
  sorry

-- test: ChartGlobalTests.empty_local_carrier
/-- `TauCeti.AlgebraicGeometry.ChartGlobalTests.empty_local_carrier`: Under the same explicit class, an empty local Hom-section carrier forces an empty restricted global-sheaf section carrier at that slice object. The chart object itself is still supplied. -/
example (X : HomCategory b b) (U : C) (x : F.obj (.mk (op U))) (T : Over U)
    [h : IsEmpty ((fibreHomSheaf b b U x x X).obj.obj (op T))] :
    IsEmpty ((((selfHomGlobalSheafFunctor b).obj X).over U).obj.obj (op T)) := by
  sorry

end
end ChartGlobalTests

namespace ChartGlobalTests
open CategoryTheory Opposite Bicategory BandedMorphism
open scoped Pseudofunctor.StrongTrans
-- test: ChartGlobalTests.matched_universes
/-- `TauCeti.AlgebraicGeometry.ChartGlobalTests.matched_universes`: When F has the same fibre object and morphism universes as the base category, the native instance proves IsIso for the actual chart map with no WEqualsLocallyBijective hypothesis in the test statement; the coefficient universe stays independent. -/
example {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
    {F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v,u}} [IsGerbe F J]
    {A : Sheaf J AddCommGrpCat.{w}} (b : AbelianBanding F J A)
    (X : HomCategory b b) (U : C) (x : F.obj (.mk (op U))) :
    IsIso (selfHomChartToGlobal b X U x) := by
  sorry

end ChartGlobalTests

namespace IntrinsicBandExtraTests
open CategoryTheory Opposite Bicategory IntrinsicBandSections BandFixtures
open ConnectedBandFixtures

-- BandCenterTests.C3: a concrete point-site count and full inertia recovery.
/-- `BandCenterTests.C3`: On the one-object point-site gerbe B(C3), there are three central sections, with evaluation recovering all of C3. -/
example : Nat.card (IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 3))))
      (Discrete.mk PUnit.unit)) = 3 ∧
    Function.Bijective (eval
      (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Discrete.mk PUnit.unit, SingleObj.star _)) := by sorry

-- BandCenterTests.identity: an terminal groupoid, without an inertia hypothesis.
/-- `BandCenterTests.identity`: For the terminal fibre groupoid, the group of compatible central sections is trivial. -/
example : Subsingleton (IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 1))))
      (Discrete.mk PUnit.unit)) := by sorry

-- BandCenterTests.S3: central sections differ from the full six-element inertia.
/-- `BandCenterTests.S3`: For B(S3) on a point, sections form the trivial center of S3, rather than all six automorphisms. Thus evaluation onto inertia fails without abelian inertia. -/
example : Nat.card (IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (ConnectedFibre PUnit (Equiv.Perm (Fin 3))))
      (Discrete.mk PUnit.unit)) = 1 ∧
    ¬ Function.Surjective (eval
      (constantDiagram (Discrete PUnit) (ConnectedFibre PUnit (Equiv.Perm (Fin 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Codiscrete.mk PUnit.unit, SingleObj.star _)) := by sorry

-- BandEvaluationTests.generator: the generator is a specified section.
/-- `BandEvaluationTests.generator`: For B(C3) evaluation sends its generator section to the nonidentity automorphism1. -/
example : (eval
    (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 3))))
    (𝟙 (Discrete.mk PUnit.unit)) (Discrete.mk PUnit.unit, SingleObj.star _)
    (componentSectionsEquiv (Discrete PUnit) PUnit (Multiplicative (ZMod 3))
      (Discrete.mk PUnit.unit) (fun _ => Multiplicative.ofAdd (1 : ZMod 3)))).hom.2 =
      Multiplicative.ofAdd (1 : ZMod 3) := by sorry

-- BandEvaluationTests.changeObject: any connecting isomorphism in the two-object gerbe.
/-- `BandEvaluationTests.changeObject`: For a connected two-object C3 groupoid, changing the object through any isomorphism gives the same labelled C3 element. -/
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
/-- `BandEvaluationTests.noncentral`: The transposition(01) of S3 fails the naturality equation with(12), so it cannot occur as the evaluation of a central section of B(S3). -/
example (s : IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (ConnectedFibre PUnit (Equiv.Perm (Fin 3))))
      (Discrete.mk PUnit.unit)) :
    (eval (constantDiagram (Discrete PUnit) (ConnectedFibre PUnit (Equiv.Perm (Fin 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Codiscrete.mk PUnit.unit, SingleObj.star _) s).hom.2 ≠
      Equiv.swap (0 : Fin 3) 1 := by sorry

end IntrinsicBandExtraTests

namespace UniverseChecks

/-- `UniverseChecks.zero`: raising the coefficient universe preserves the zero group. -/
example : Subsingleton (ULift.{u} (Fin 1)) := by sorry

/-- `UniverseChecks.coefficient`: raising and lowering preserve the generator and its sum. -/
example : ((ULift.up (1 : ZMod 3) : ULift.{u} (ZMod 3)).down = 1) ∧
    ((ULift.up (1 : ZMod 3) : ULift.{u} (ZMod 3)) + ULift.up 1).down = 2 := by sorry

/-- `UniverseChecks.arrows`: the enlarged arrow category retains composition. -/
example (C : Type u) [Category.{v} C] (X Y Z : C) (f : X ⟶ Y) (g : Y ⟶ Z) :
    let l : C ⥤ ULiftHom.{w} C := ULiftHom.up
    (l.map f ≫ l.map g).down = f ≫ g := by sorry

end UniverseChecks

namespace ClassificationChecks

/-- `ClassificationChecks.positiveBoundary`: a two-term change of lifts retains the positive
boundary; reversing the torsor orientation negates the nonzero result. -/
example (a₀ a₁ a₂ : ℤ) :
    (2 + a₁ - a₀) + (3 + a₂ - a₁) - (1 + a₂ - a₀) = 4 ∧ (4 : ℤ) ≠ -4 := by sorry

/-- `ClassificationChecks.torsorLift`: no nonzero homomorphism from C₂ to the integers can lift
the generator of the regular C₂-torsor. -/
example (f : ZMod 2 →+ ℤ) : f = 0 := by sorry

end ClassificationChecks


open CategoryTheory


/-! ## Layer 5: rigidification and finite correspondences

The geometric stack contracts and their exact checks are listed in the closing omission block. -/

/-! ## Layer 6: G-rings and algebraic approximation -/

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

/-- `ApproximationTests.complete`: a complete Noetherian local ring matches every solution exactly. -/
example [IsNoetherianRing A] [IsAdicComplete (IsLocalRing.maximalIdeal A) A] :
    HasArtinApproximation A := by sorry

/-- `ApproximationTests.field`: the zero-adic completion of a field changes no solution. -/
example (K : Type u) [Field K] : HasArtinApproximation K := by sorry

end Approximation


noncomputable section

open CategoryTheory CategoryTheory.Limits
open scoped TensorProduct

/-! ## Layer 7: space Picard, Artin representability and arithmetic coefficients -/

namespace A0Extension


variable (F : CommRingCat.{u} ⥤ Type u)

/-- The affine set-valued RS* condition, on actual square-zero ring pullbacks. -/
def StrongInfinitesimalGluing : Prop :=
  ∀ {A B C : CommRingCat.{u}} (f : A ⟶ C) (g : B ⟶ C),
    Function.Surjective g.hom → RingHom.ker g.hom ^ 2 = ⊥ →
      IsIso (pullbackComparison F f g)

/-- `A0Extension.StrongInfinitesimalGluing.of_preservesLimits`: A functor preserving finite limits satisfies RS*. -/
theorem StrongInfinitesimalGluing.of_preservesLimits
    [PreservesFiniteLimits F] : StrongInfinitesimalGluing F := by
  sorry

/-- `A0Extension.StrongInfinitesimalGluing.comparison_bijective`: Each permitted ring pullback has a bijective canonical comparison. -/
theorem StrongInfinitesimalGluing.comparison_bijective
    (hF : StrongInfinitesimalGluing F)
    {A B C : CommRingCat.{u}} (f : A ⟶ C) (g : B ⟶ C)
    (hg : Function.Surjective g.hom) (hker : RingHom.ker g.hom ^ 2 = ⊥) :
    Function.Bijective (pullbackComparison F f g) := by
  sorry

/-- `A0Extension.StrongInfinitesimalGluing.transport`: A natural isomorphism of functors transports RS*. -/
theorem StrongInfinitesimalGluing.transport
    {G : CommRingCat.{u} ⥤ Type u} (e : F ≅ G)
    (hF : StrongInfinitesimalGluing F) : StrongInfinitesimalGluing G := by
  sorry

-- StrongGluingTests.forget
/-- `StrongGluingTests.forget`: The commutative-ring forgetful functor satisfies RS*. -/
example : StrongInfinitesimalGluing (forget CommRingCat.{u}) := by
  sorry

-- StrongGluingTests.terminal
/-- `StrongGluingTests.terminal`: The terminal constant functor satisfies RS*. -/
example : StrongInfinitesimalGluing
    ((Functor.const CommRingCat.{u}).obj (ULift.{u} PUnit)) := by
  sorry

-- StrongGluingTests.zeroKernel: identity is a permitted extension.
/-- `StrongGluingTests.zeroKernel`: For A→C←C with the second map the identity, the comparison is bijective. -/
example {A C : CommRingCat.{u}} (f : A ⟶ C)
    (hF : StrongInfinitesimalGluing F) :
    Function.Bijective (pullbackComparison F f (𝟙 C)) := by
  sorry

/-- Direct image of subsets is a concrete functor that fails RS*. -/
def StrongGluingTests.subsetImage : CommRingCat.{u} ⥤ Type u where
  obj R := Set R
  map f := TypeCat.ofHom (Set.image f)
  map_id := by sorry
  map_comp := by sorry

/-- `SubsetImageChecks.empty`: direct image sends the empty subset to the empty subset. -/
example {A B : CommRingCat.{u}} (f : A ⟶ B) :
    StrongGluingTests.subsetImage.map f (∅ : Set A) = (∅ : Set B) := by sorry

/-- `SubsetImageChecks.unit`: direct image of the singleton unit is the singleton unit,
including maps between distinct rings. -/
example {A B : CommRingCat.{u}} (f : A ⟶ B) :
    StrongGluingTests.subsetImage.map f ({1} : Set A) = ({1} : Set B) := by sorry

-- StrongGluingTests.subsetFailure: two distinct pullback subsets have equal projections.
/-- `StrongGluingTests.subsetFailure`: The functor R↦Set(R), with direct-image maps, fails RS*. For both maps Q[ε]/ε²→Q, the diagonal subset and the whole pullback have the same two projections but are distinct: (ε,0) is in the latter only. Thus the comparison is not injective even for a square-zero surjection. -/
example : ¬ StrongInfinitesimalGluing StrongGluingTests.subsetImage.{0} := by
  sorry

variable (R : Type u) [CommRing R] (I : Ideal R)

/-- Compatible points on all positive powers of an ideal, without truncation. -/
structure FormalPoint where
  /-- A point of the functor on every quotient by the positive power I^(n+1). -/
  value : ∀ n : ℕ, F.obj (CommRingCat.of (R ⧸ I ^ (n + 1)))
  /-- All quotient transition maps carry the higher component to the lower component. -/
  compatible : ∀ {m n : ℕ} (h : n ≤ m),
    F.map (CommRingCat.ofHom (Ideal.Quotient.factorPow I (Nat.add_le_add_right h 1)))
      (value m) = value n

/-- `A0Extension.FormalPoint.ofPoint`: Restrict an actual point to every positive quotient power. -/
def FormalPoint.ofPoint (x : F.obj (CommRingCat.of R)) : FormalPoint F R I where
  value n := F.map (CommRingCat.ofHom (Ideal.Quotient.mk (I ^ (n + 1)))) x
  compatible := by
    sorry

/-- `A0Extension.FormalPoint.ext`: Equality of every component implies equality of formal points. -/
theorem FormalPoint.ext {x y : FormalPoint F R I}
    (h : ∀ n, x.value n = y.value n) : x = y := by
  sorry

/-- `A0Extension.FormalPoint.ofPoint_value`: The n-th component is restriction along R→R/I^(n+1). -/
theorem FormalPoint.ofPoint_value (x : F.obj (CommRingCat.of R)) (n : ℕ) :
    (FormalPoint.ofPoint F R I x).value n =
      F.map (CommRingCat.ofHom (Ideal.Quotient.mk (I ^ (n + 1)))) x := by
  sorry

/-- `A0Extension.FormalPoint.transition`: Restriction from the m-th component to the n-th agrees for n≤m. -/
theorem FormalPoint.transition (x : FormalPoint F R I) {m n : ℕ} (h : n ≤ m) :
    F.map (CommRingCat.ofHom (Ideal.Quotient.factorPow I (Nat.add_le_add_right h 1)))
      (x.value m) = x.value n := by
  sorry

/-- `A0Extension.FormalPoint.map`: A natural transformation F→G sends a compatible family to the family of its component images. -/
def FormalPoint.map {G : CommRingCat.{u} ⥤ Type u} (η : F ⟶ G)
    (ξ : FormalPoint F R I) : FormalPoint G R I where
  value n := η.app _ (ξ.value n)
  compatible := by sorry

/-- `A0Extension.FormalPoint.map_value`: The n-th component of the image family is η at R/I^(n+1) applied to the original component. -/
theorem FormalPoint.map_value {G : CommRingCat.{u} ⥤ Type u} (η : F ⟶ G)
    (ξ : FormalPoint F R I) (n : ℕ) :
    (FormalPoint.map F R I η ξ).value n = η.app _ (ξ.value n) := by
  sorry

-- FormalPointTests.affineLine
/-- `FormalPointTests.affineLine`: For the ring forgetful functor the components are x modulo I^(n+1). -/
example (x : R) (n : ℕ) :
    (FormalPoint.ofPoint (forget CommRingCat.{u}) R I x).value n =
      Ideal.Quotient.mk (I ^ (n + 1)) x := by
  sorry

-- FormalPointTests.terminal
/-- `FormalPointTests.terminal`: The terminal functor has only one formal point. -/
example : Subsingleton
    (FormalPoint ((Functor.const CommRingCat.{u}).obj (ULift.{u} PUnit)) R I) := by
  sorry

-- FormalPointTests.allOrders: agreement at every order gives equality.
/-- `FormalPointTests.allOrders`: Agreement at every order forces equality of compatible families. -/
example (x y : FormalPoint F R I) (h : ∀ n, x.value n = y.value n) : x = y := by
  sorry

-- FormalPointTests.firstOrderInsufficient: the next quotient detects epsilon.
/-- `FormalPointTests.firstOrderInsufficient`: For R=Q[ε]/ε² and I=(ε), the points 0 and ε have the same reduction modulo I but different reductions modulo I²=0. Their formal points have equal value 0 and unequal value 1; first-order data alone cannot define FormalPoint. -/
example :
    let J : Ideal (TrivSqZeroExt ℚ ℚ) :=
      RingHom.ker (TrivSqZeroExt.fstHom ℚ ℚ ℚ).toRingHom
    let x := FormalPoint.ofPoint (forget CommRingCat.{0}) (TrivSqZeroExt ℚ ℚ) J 0
    let y := FormalPoint.ofPoint (forget CommRingCat.{0}) (TrivSqZeroExt ℚ ℚ) J
      (TrivSqZeroExt.inr (1 : ℚ))
    x.value 0 = y.value 0 ∧ x.value 1 ≠ y.value 1 := by
  sorry

/-- This affine effectivity predicate has an explicit restriction map. -/
def IsEffective : Prop := Function.Surjective (FormalPoint.ofPoint F R I)

/-- `A0Extension.IsEffective.iff_lift`: Every formal point is the restriction of an actual point. -/
theorem IsEffective.iff_lift : IsEffective F R I ↔
    ∀ ξ : FormalPoint F R I, ∃ x, FormalPoint.ofPoint F R I x = ξ := by
  sorry

/-- `A0Extension.IsEffective.lift`: Choose a realizing point from an effectivity proof. -/
def IsEffective.lift (h : IsEffective F R I) (ξ : FormalPoint F R I) :
    F.obj (CommRingCat.of R) := Classical.choose (h ξ)

/-- `A0Extension.IsEffective.lift_spec`: The chosen lift restricts to the specified whole formal family. -/
theorem IsEffective.lift_spec (h : IsEffective F R I) (ξ : FormalPoint F R I) :
    FormalPoint.ofPoint F R I (IsEffective.lift F R I h ξ) = ξ := by
  sorry

/-- `A0Extension.IsEffective.transport`: A natural isomorphism of functors transports effectivity at the same (R,I). -/
theorem IsEffective.transport {G : CommRingCat.{u} ⥤ Type u} (e : F ≅ G)
    (h : IsEffective F R I) : IsEffective G R I := by
  sorry

-- EffectivityTests.terminal
/-- `EffectivityTests.terminal`: The terminal functor is effective for any ideal. -/
example : IsEffective
    ((Functor.const CommRingCat.{u}).obj (ULift.{u} PUnit)) R I := by
  sorry

-- EffectivityTests.zeroIdeal
/-- `EffectivityTests.zeroIdeal`: For I=0, quotient powers are R and any functor is effective. -/
example : IsEffective F R (⊥ : Ideal R) := by
  sorry

-- EffectivityTests.topIdeal: for the affine-line functor all quotients are zero.
/-- `EffectivityTests.topIdeal`: The affine-line functor is effective at I=R because every quotient is the zero ring. -/
example : IsEffective (forget CommRingCat.{u}) R (⊤ : Ideal R) := by
  sorry

-- EffectivityTests.emptyScheme: formal points over zero quotients need not algebraize.
/-- `EffectivityTests.emptyScheme`: For F=Hom_CommRing(ZMod 1,−), R=Q and I=top, every quotient has its unique zero-ring point, giving a formal point, but F(Q) is empty. Thus IsEffective is false. A constant-true predicate would fail this test. -/
example : ¬ IsEffective
    (coyoneda.obj (Opposite.op (CommRingCat.of (ZMod 1)))) ℚ (⊤ : Ideal ℚ) := by
  sorry

variable (k : Type u) [Field k]

/-- The fibre over x of the dual-number restriction, not all dual-number points. -/
def TangentFiber (x : F.obj (CommRingCat.of k)) :=
  { y : F.obj (CommRingCat.of (TrivSqZeroExt k k)) //
    F.map (CommRingCat.ofHom (TrivSqZeroExt.fstHom k k k).toRingHom) y = x }

/-- `A0Extension.TangentFiber.zero`: The split lift is a tangent element over x. -/
def TangentFiber.zero (x : F.obj (CommRingCat.of k)) : TangentFiber F k x :=
  ⟨F.map (CommRingCat.ofHom (TrivSqZeroExt.inlHom k k)) x, by sorry⟩

/-- `A0Extension.TangentFiber.ext`: Two tangent elements with equal underlying lift are equal. -/
theorem TangentFiber.ext (x : F.obj (CommRingCat.of k))
    {y z : TangentFiber F k x} (h : y.val = z.val) : y = z := by
  sorry

/-- `A0Extension.TangentFiber.map`: A natural transformation induces a map between the corresponding tangent fibres. -/
def TangentFiber.map {G : CommRingCat.{u} ⥤ Type u}
    (η : F ⟶ G) (x : F.obj (CommRingCat.of k)) :
    TangentFiber F k x → TangentFiber G k (η.app _ x) :=
  fun y => ⟨η.app _ y.val, by sorry⟩

-- TangentTests.affineLine: a single epsilon coefficient, base point fixed.
/-- `TangentTests.affineLine`: The affine-line tangent fibre at x is equivalent to k via the ε coefficient. -/
example (x : k) : Nonempty (TangentFiber (forget CommRingCat.{u}) k x ≃ k) := by
  sorry

-- TangentTests.terminal
/-- `TangentTests.terminal`: The terminal functor has a one-element tangent fibre. -/
example (x : ULift.{u} PUnit) :
    Subsingleton (TangentFiber
      ((Functor.const CommRingCat.{u}).obj (ULift.{u} PUnit)) k x) := by
  sorry

-- TangentTests.zeroRestriction
/-- `TangentTests.zeroRestriction`: The split tangent element restricts to the specified residue point. -/
example (x : F.obj (CommRingCat.of k)) :
    F.map (CommRingCat.ofHom (TrivSqZeroExt.fstHom k k k).toRingHom)
      (TangentFiber.zero F k x).val = x := by
  sorry

-- TangentTests.twoElements: fixing the base point halves the four dual-number points.
/-- `TangentTests.twoElements`: For the affine-line functor over F₂ at 0, the tangent fibre has exactly two elements. Unframed dual-number points have four; an empty or trivial tangent has zero or one. -/
example : Nat.card (TangentFiber (forget CommRingCat.{0}) (ZMod 2) 0) = 2 := by
  sorry

variable (A B : Type u) [CommRing A] [CommRing B] [Algebra A B]
variable (IA : Ideal A) (JB : Ideal B)

/-- Linear functionals that descend modulo the indicated boundary ideals. -/
def BoundaryDualFunctional :=
  { ell : B →ₗ[A] A // ∀ b ∈ JB, ell b ∈ IA }

/-- `A0Extension.BoundaryDualFunctional.reduce`: Induce the functional B/J→A/I. -/
def BoundaryDualFunctional.reduce (ell : BoundaryDualFunctional A B IA JB) :
    (B ⧸ (JB.restrictScalars A)) →ₗ[A] (A ⧸ IA) :=
  (JB.restrictScalars A).liftQ ((Ideal.Quotient.mkₐ A IA).toLinearMap.comp ell.val)
    (by sorry)

/-- `A0Extension.BoundaryDualFunctional.reduce_mk`: On the class of b the reduction has value ℓ(b) modulo I. -/
theorem BoundaryDualFunctional.reduce_mk (ell : BoundaryDualFunctional A B IA JB) (b : B) :
    BoundaryDualFunctional.reduce A B IA JB ell ((JB.restrictScalars A).mkQ b) =
      Ideal.Quotient.mk IA (ell.val b) := by
  sorry

/-- `A0Extension.BoundaryDualFunctional.evaluate_one`: Evaluation at one commutes with the two quotient maps. -/
theorem BoundaryDualFunctional.evaluate_one (ell : BoundaryDualFunctional A B IA JB) :
    BoundaryDualFunctional.reduce A B IA JB ell ((JB.restrictScalars A).mkQ 1) =
      Ideal.Quotient.mk IA (ell.val 1) := by
  sorry

/-- `A0Extension.BoundaryDualFunctional.ext`: Equality of underlying linear maps implies equality of boundary functionals. -/
theorem BoundaryDualFunctional.ext {ell μ : BoundaryDualFunctional A B IA JB}
    (h : ell.val = μ.val) : ell = μ := by
  sorry

/-- `A0Extension.BoundaryDualFunctional.reduce_unique`: An A-linear map B/J→A/I with value ℓ(b) modulo I on every quotient class equals reduce(ℓ). -/
theorem BoundaryDualFunctional.reduce_unique (ell : BoundaryDualFunctional A B IA JB)
    (f : (B ⧸ (JB.restrictScalars A)) →ₗ[A] (A ⧸ IA))
    (hf : ∀ b : B, f ((JB.restrictScalars A).mkQ b) = Ideal.Quotient.mk IA (ell.val b)) :
    f = BoundaryDualFunctional.reduce A B IA JB ell := by
  sorry

/-- Multiplying an input by a ramified-boundary power makes it descend. -/
def BoundaryDualFunctional.mulInput (ell : B →ₗ[A] A) (n : ℕ) (c : B)
    (hn : 1 ≤ n) (hc : c ∈ JB ^ (n - 1))
    (hpow : JB ^ n ≤ IA.map (algebraMap A B)) : BoundaryDualFunctional A B IA JB :=
  ⟨{
    toFun := fun b => ell (c * b)
    map_add' := by sorry
    map_smul' := by sorry
  }, by sorry⟩

/-- `A0Extension.BoundaryDualFunctional.mulInput_apply`: The underlying map of mulInput applied to b is ℓ(cb). -/
theorem BoundaryDualFunctional.mulInput_apply (ell : B →ₗ[A] A) (n : ℕ) (c b : B)
    (hn : 1 ≤ n) (hc : c ∈ JB ^ (n - 1))
    (hpow : JB ^ n ≤ IA.map (algebraMap A B)) :
    (BoundaryDualFunctional.mulInput A B IA JB ell n c hn hc hpow).val b = ell (c * b) := by
  sorry

-- BoundaryTests.zeroFunctional
/-- `BoundaryTests.zeroFunctional`: The zero functional descends for every pair of ideals. -/
example : ∃ ell : BoundaryDualFunctional A B IA JB, ell.val = 0 := by
  sorry

-- BoundaryTests.identity
/-- `BoundaryTests.identity`: For B=A and J=I, the identity functional descends to the identity of A/I. -/
example : ∃ ell : BoundaryDualFunctional A A IA IA, ell.val = LinearMap.id := by
  sorry

-- BoundaryTests.dualNumbers: the epsilon coefficient cannot descend modulo epsilon.
/-- `BoundaryTests.dualNumbers`: For B=Q[ε]/ε², I=0 and J=(ε), the ε-coefficient functional is excluded because it sends ε to 1. Multiplying its input by ε gives the permitted constant-coefficient functional. -/
example :
    ¬ ∃ ell : BoundaryDualFunctional ℚ (TrivSqZeroExt ℚ ℚ) (⊥ : Ideal ℚ)
      (RingHom.ker (TrivSqZeroExt.fstHom ℚ ℚ ℚ).toRingHom),
      ell.val = TrivSqZeroExt.sndHom ℚ ℚ := by
  sorry

-- The permitted functional after multiplying the input by epsilon is the
-- constant coefficient. This strengthens the same discriminating test.
/-- The permitted functional after multiplying the input by epsilon is the constant coefficient. This strengthens the same discriminating test.
 -/
example :
    ∃ ell : BoundaryDualFunctional ℚ (TrivSqZeroExt ℚ ℚ) (⊥ : Ideal ℚ)
      (RingHom.ker (TrivSqZeroExt.fstHom ℚ ℚ ℚ).toRingHom),
      ell.val = (TrivSqZeroExt.fstHom ℚ ℚ ℚ).toLinearMap := by
  sorry

variable (K M : Type u) [CommRing K] [Algebra R K]
variable [AddCommGroup M] [Module R M]

/-- Fractional coefficients modulo the image of the original module. -/
abbrev KOCoefficients :=
  (K ⊗[R] M) ⧸ LinearMap.range (TensorProduct.mk R K M 1)

/-- `A0Extension.KOCoefficients.mk`: A fractional tensor determines a class modulo integral tensors. -/
def KOCoefficients.mk (z : K ⊗[R] M) : KOCoefficients R K M :=
  (LinearMap.range (TensorProduct.mk R K M 1)).mkQ z

/-- `A0Extension.KOCoefficients.integral_zero`: The class of 1⊗m is zero. -/
theorem KOCoefficients.integral_zero (m : M) :
    KOCoefficients.mk R K M (1 ⊗ₜ[R] m) = 0 := by
  sorry

/-- `A0Extension.KOCoefficients.mk_add`: The quotient class map is additive. -/
theorem KOCoefficients.mk_add (z w : K ⊗[R] M) :
    KOCoefficients.mk R K M (z + w) =
      KOCoefficients.mk R K M z + KOCoefficients.mk R K M w := by
  sorry

/-- `A0Extension.KOCoefficients.mk_surjective`: Every quotient class has a fractional-tensor representative. -/
theorem KOCoefficients.mk_surjective : Function.Surjective (KOCoefficients.mk R K M) := by
  sorry

/-- The quotient universal property with its actual integral-tensor relation. -/
def KOCoefficients.lift {N : Type u} [AddCommGroup N] [Module R N]
    (f : K ⊗[R] M →ₗ[R] N) (hf : ∀ m : M, f (1 ⊗ₜ[R] m) = 0) :
    KOCoefficients R K M →ₗ[R] N :=
  (LinearMap.range (TensorProduct.mk R K M 1)).liftQ f (by sorry)

/-- `A0Extension.KOCoefficients.lift_mk`: Evaluating the induced map on mk(z) gives the original linear map evaluated at z. -/
theorem KOCoefficients.lift_mk {N : Type u} [AddCommGroup N] [Module R N]
    (f : K ⊗[R] M →ₗ[R] N) (hf : ∀ m : M, f (1 ⊗ₜ[R] m) = 0) (z : K ⊗[R] M) :
    KOCoefficients.lift R K M f hf (KOCoefficients.mk R K M z) = f z := by
  sorry

/-- `A0Extension.KOCoefficients.hom_ext`: R-linear maps out of KOCoefficients agreeing on every mk(z) are equal. -/
theorem KOCoefficients.hom_ext {N : Type u} [AddCommGroup N] [Module R N]
    {f g : KOCoefficients R K M →ₗ[R] N}
    (h : ∀ z : K ⊗[R] M, f (KOCoefficients.mk R K M z) =
      g (KOCoefficients.mk R K M z)) : f = g := by
  sorry

/-- `A0Extension.KOCoefficients.map`: An R-linear map M→N induces a map of quotients by tensoring with id_K; integral tensors map to integral tensors. -/
def KOCoefficients.map {N : Type u} [AddCommGroup N] [Module R N] (f : M →ₗ[R] N) :
    KOCoefficients R K M →ₗ[R] KOCoefficients R K N :=
  KOCoefficients.lift R K M
    (((LinearMap.range (TensorProduct.mk R K N 1)).mkQ).comp
      (TensorProduct.map (LinearMap.id : K →ₗ[R] K) f)) (by sorry)

/-- `A0Extension.KOCoefficients.map_mk`: map(f)(mk(z))=mk((id_K⊗f)(z)). -/
theorem KOCoefficients.map_mk {N : Type u} [AddCommGroup N] [Module R N]
    (f : M →ₗ[R] N) (z : K ⊗[R] M) :
    KOCoefficients.map R K M f (KOCoefficients.mk R K M z) =
      KOCoefficients.mk R K N (TensorProduct.map (LinearMap.id : K →ₗ[R] K) f z) := by
  sorry

/-- `A0Extension.KOCoefficients.map_id`: The induced quotient map of the identity is the identity. -/
theorem KOCoefficients.map_id :
    KOCoefficients.map R K M (LinearMap.id : M →ₗ[R] M) = LinearMap.id := by
  sorry

/-- `A0Extension.KOCoefficients.map_comp`: The induced quotient map of g∘f is map(g)∘map(f). -/
theorem KOCoefficients.map_comp {N P : Type u}
    [AddCommGroup N] [Module R N] [AddCommGroup P] [Module R P]
    (f : M →ₗ[R] N) (g : N →ₗ[R] P) :
    KOCoefficients.map R K M (g.comp f) =
      (KOCoefficients.map R K N g).comp (KOCoefficients.map R K M f) := by
  sorry

-- KOTests.halfIntegralNonzero: the raw quotient is nontrivial.
/-- `KOTests.halfIntegralNonzero`: For O=Z, K=Q and M=Z, the class of (1/2)⊗1 is nonzero in KOCoefficients. This tests the general raw quotient construction; it makes no DVR claim about Z and rules out defining the quotient as zero. -/
example : KOCoefficients.mk ℤ ℚ ℤ ((1 / 2 : ℚ) ⊗ₜ[ℤ] (1 : ℤ)) ≠ 0 := by
  sorry

-- KOTests.baseField
/-- `KOTests.baseField`: For K=O every quotient coefficient is zero. -/
example (z : KOCoefficients R R M) : z = 0 := by
  sorry

-- KOTests.zeroModule
/-- `KOTests.zeroModule`: For M=0 the coefficient module is zero. -/
example [Subsingleton M] : Subsingleton (KOCoefficients R K M) := by
  sorry

-- KOTests.integralClass
/-- `KOTests.integralClass`: An integral tensor 1⊗m is zero in the quotient, although it need not be zero in K⊗M. -/
example (m : M) : KOCoefficients.mk R K M (1 ⊗ₜ[R] m) = 0 := by
  sorry

section ValuationAdapters

variable {F₀ E₀ L₀ : Type u} [Field F₀] [Field E₀] [Field L₀]
variable [Algebra F₀ E₀] [Algebra F₀ L₀]

/-- Native polynomial form; specializing to the minimal polynomial gives the
source's conjugate-coefficient adapter, with repeated roots retained. -/
theorem root_coefficient_descent
    (V : ValuationSubring F₀) (W : ValuationSubring L₀)
    (hW : W.comap (algebraMap F₀ L₀) = V)
    (p : Polynomial F₀) (hp : p.Monic)
    (hs : (p.map (algebraMap F₀ L₀)).Splits)
    (hr : ∀ z ∈ (p.map (algebraMap F₀ L₀)).roots, z ∈ W) :
    ∀ n : ℕ, p.coeff n ∈ V := by
  sorry

/-- The entire prolongation family is used, not one valuation per index. -/
theorem valuation_prolongation_integrality
    [FiniteDimensional F₀ E₀] {ι : Type u}
    (V : ι → ValuationSubring F₀) (B₀ : Subring F₀)
    [Algebra B₀ E₀] [IsScalarTower B₀ F₀ E₀]
    (hB : B₀ = ⨅ i, (V i).toSubring) (x : E₀) :
    x ∈ integralClosure B₀ E₀ ↔
      ∀ i (W : ValuationSubring E₀),
        W.comap (algebraMap F₀ E₀) = V i → x ∈ W := by
  sorry

end ValuationAdapters

end A0Extension



end

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

/-- `PicardPresheafChecks.identity`: the identity family retains the raw Picard group
of a test scheme, before the relative fppf sheafification kills base classes. -/
example (T : (Over B)ᵒᵖ) :
    Nonempty ((relativePicardPresheaf (𝟙 B)).obj T ≃
      TauCeti.AlgebraicGeometry.LineBundleClass T.unop.left) := by sorry

/-- `PicardPresheafChecks.field`: every line bundle on the spectrum of a field is trivial. -/
example (K : Type u) [Field K] :
    Subsingleton (TauCeti.AlgebraicGeometry.LineBundleClass
      (Spec (CommRingCat.of K))) := by sorry

/-- `PicardPresheafChecks.empty`: the empty scheme has exactly one line-bundle class. -/
example : Subsingleton (TauCeti.AlgebraicGeometry.LineBundleClass Scheme.empty.{u}) := by sorry

end RelativePicard


/-! ## Layer 8: framed deformation and completed local comparisons

The framed deformation groupoids, algebraization and completion comparisons use the
stack and formal-space contracts stated in Layer 8 of the roadmap. -/

/-! ## Layer 9: resolution and SNC compactification -/

namespace Resolution

variable {R : Type u} [CommRing R]

open scoped Classical in
/-- The order of an ideal at a prime: the largest `n` with `I R_𝔭 ⊆ 𝔭ⁿ R_𝔭`, as an extended natural
number. Vanishing implies order `⊤`; the converse needs Noetherianity, by Krull intersection. -/
noncomputable def idealOrderAt (I : Ideal R) (p : PrimeSpectrum R) : ℕ∞ :=
  ⨆ n : ℕ, if I.map (algebraMap R (Localization.AtPrime p.asIdeal)) ≤
    (IsLocalRing.maximalIdeal (Localization.AtPrime p.asIdeal)) ^ n then (n : ℕ∞) else 0

/-- `IdealOrderChecks.unit`: the unit ideal has order zero at every prime. -/
example (p : PrimeSpectrum R) : idealOrderAt (⊤ : Ideal R) p = 0 := by sorry

/-- `IdealOrderChecks.zero`: the zero ideal lies in every maximal-ideal power and has
infinite order at every prime. -/
example (p : PrimeSpectrum R) : idealOrderAt (⊥ : Ideal R) p = ⊤ := by sorry

/-- A marked ideal `(I, d)`: an ideal with a positive integer mark, the datum on which the
resolution algorithm acts. -/
structure MarkedIdeal (R : Type u) [CommRing R] where
  /-- The ideal whose localized order is compared with the mark. -/
  ideal : Ideal R
  /-- The integral order threshold retained with the ideal. -/
  mark : ℕ
  /-- The threshold is strictly positive, so no division by a zero mark occurs. -/
  mark_pos : 0 < mark

/-- The cosupport of a marked ideal: the primes at which the order of `I` is at least `d`. -/
def MarkedIdeal.cosupport (J : MarkedIdeal R) : Set (PrimeSpectrum R) :=
  {p | (J.mark : ℕ∞) ≤ idealOrderAt J.ideal p}

/-- The marked ideals `(I, d)` and `(Iᵏ, k d)` have the same cosupport: the first instance of the
equivalence of marked ideals on a regular ambient scheme. Regularity is essential: the square
of the maximal ideal of a dual-number ring vanishes although the ideal has order one. -/
theorem MarkedIdeal.cosupport_pow (J : MarkedIdeal R) (k : ℕ) (hk : 0 < k) :
    (∀ p : PrimeSpectrum R, IsRegularLocalRing (Localization.AtPrime p.asIdeal)) →
    (MarkedIdeal.mk (J.ideal ^ k) (k * J.mark) (Nat.mul_pos hk J.mark_pos)).cosupport =
      J.cosupport := sorry

/-- The sum of two positive-mark ideals has product mark and the sum of their
correspondingly powered ideals. Its cosupport is an intersection on a regular ambient ring. -/
def MarkedIdeal.markedSum (J K : MarkedIdeal R) : MarkedIdeal R :=
  ⟨J.ideal ^ K.mark ⊔ K.ideal ^ J.mark, J.mark * K.mark,
    Nat.mul_pos J.mark_pos K.mark_pos⟩

/-- The product marking clears both positive denominators in the marked sum. -/
theorem MarkedIdeal.markedSum_mark (J K : MarkedIdeal R) :
    (J.markedSum K).mark = J.mark * K.mark := sorry

/-- The powers in the sum have the opposite marking as exponent. -/
theorem MarkedIdeal.markedSum_ideal (J K : MarkedIdeal R) :
    (J.markedSum K).ideal = J.ideal ^ K.mark ⊔ K.ideal ^ J.mark := sorry

/-- Regular localizations give the intersection formula for marked-sum cosupports. -/
theorem MarkedIdeal.markedSum_cosupport
    (hreg : ∀ p : PrimeSpectrum R,
      IsRegularLocalRing (Localization.AtPrime p.asIdeal)) (J K : MarkedIdeal R) :
    (J.markedSum K).cosupport = J.cosupport ∩ K.cosupport := sorry

/-- `CompanionChecks.marks`: the two marks two give product mark four and
the powered ideals (y⁴,x⁶), rather than the unpowered sum. -/
example :
    let J := MarkedIdeal.mk
      (Ideal.span {MvPolynomial.X (1 : Fin 2) ^ 2} : Ideal (MvPolynomial (Fin 2) ℚ)) 2 (by decide)
    let K := MarkedIdeal.mk
      (Ideal.span {MvPolynomial.X (0 : Fin 2) ^ 3} : Ideal (MvPolynomial (Fin 2) ℚ)) 2 (by decide)
    (J.markedSum K).mark = 4 ∧
      (J.markedSum K).ideal =
        (Ideal.span {MvPolynomial.X (1 : Fin 2) ^ 4, MvPolynomial.X (0 : Fin 2) ^ 6} : Ideal (MvPolynomial (Fin 2) ℚ)) := sorry

/-- `CompanionChecks.unit`: the unit summand gives an empty cosupport, even if the other ideal is zero. -/
example :
    let J := MarkedIdeal.mk (⊤ : Ideal ℚ) 2 (by decide)
    let K := MarkedIdeal.mk (⊥ : Ideal ℚ) 3 (by decide)
    (J.markedSum K).ideal = ⊤ ∧ (J.markedSum K).cosupport = ∅ := sorry

/-- `CompanionChecks.zero`: two zero ideals retain full cosupport and multiply their marks. -/
example :
    let J := MarkedIdeal.mk (⊥ : Ideal ℚ) 1 (by decide)
    let K := MarkedIdeal.mk (⊥ : Ideal ℚ) 2 (by decide)
    (J.markedSum K).mark = 2 ∧ (J.markedSum K).cosupport = Set.univ := sorry

namespace RecursiveControls

/-- `ResidualChecks.fractional`: subtracting the exceptional order 3/4 from
the coefficient order one gives residual mark one and companion mark three. -/
example :
    (4 : ℚ) * (1 - 3 / 4) = 1 ∧ 4 * (1 - (1 - 3 / 4)) = 3 := sorry

/-- `HistoryChecks.birth`: the old block uses the earliest prefix year, so
the same two current labels can have old-block counts one and two. -/
example :
    ({1, 2} : Finset ℕ).filter (fun year => year ≤ 1) = {1} ∧
      (({1, 2} : Finset ℕ).filter (fun year => year ≤ 2)).card = 2 := sorry

/-- `DenominatorChecks.fixedPrefix`: the successive factorial certificates
clear 3/2 and 5/6, whereas the first certificate does not clear 1/3. -/
example :
    (Nat.factorial 2 : ℚ) * (3 / 2) = 3 ∧
      (Nat.factorial 3 : ℚ) * (5 / 6) = 5 ∧
      ¬ ∃ n : ℕ, (Nat.factorial 2 : ℚ) * (1 / 3) = n := sorry

/-- `SelectorChecks.minimal`: pivoting the minimal pair with exponents 3/4
lowers that pivot to 1/2 and the total multiplicity to 5/4. -/
example :
    (3 / 4 : ℚ) + 3 / 4 - 1 = 1 / 2 ∧
      (1 / 2 : ℚ) < 3 / 4 ∧ (1 / 2 : ℚ) + 3 / 4 = 5 / 4 := sorry

/-- A singleton of exponent one is minimal; adjoining exponent 1/4 is not
minimal because deletion of that second entry still meets the threshold. -/
example :
    (1 : ℚ) ≥ 1 ∧ (1 : ℚ) + 1 / 4 - 1 = 1 / 4 ∧
      ¬ ((1 : ℚ) + 1 / 4 - 1 < 1 / 4) := sorry

end RecursiveControls

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

/-- `DerivativeIdealChecks.zero`: derivatives of elements of the zero ideal give
the zero ideal. -/
example : derivativeIdeal (⊥ : Ideal (MvPolynomial Unit ℚ)) = ⊥ := by sorry

/-- `DerivativeIdealChecks.unit`: the derivative ideal includes the original ideal,
so the unit ideal remains the unit ideal. -/
example : derivativeIdeal (⊤ : Ideal (MvPolynomial Unit ℚ)) = ⊤ := by sorry

/-- `DerivativeIdealChecks.cubic`: in characteristic zero the derivative of x³ lowers
its order to two; the original cubic is retained in the generated ideal. -/
example : derivativeIdeal (Ideal.span
    {((MvPolynomial.X () : MvPolynomial Unit ℚ) ^ 3)}) =
      Ideal.span {((MvPolynomial.X () : MvPolynomial Unit ℚ) ^ 2)} := by sorry

/-- Existence of a hypersurface of maximal contact in characteristic zero: if `I` has order exactly
`d ≥ 1` at a prime `𝔭` of the polynomial ring, some element of the `(d-1)`-st derivative ideal has
order exactly `1` at `𝔭`. This fails in positive characteristic (`x^p` over `𝔽_p`). -/
theorem exists_maximalContact [CharZero k] [Finite σ] (I : Ideal (MvPolynomial σ k))
    (p : PrimeSpectrum (MvPolynomial σ k)) (d : ℕ) (hd : 0 < d) (hI : idealOrderAt I p = d) :
    ∃ f ∈ derivativeIdeal^[d - 1] I, idealOrderAt (Ideal.span {f}) p = 1 := sorry

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
    ∃ p : PrimeSpectrum R, idealOrderAt m p = 1 ∧ idealOrderAt (m ^ 2) p = ⊤ := sorry

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

/-- `MaxContactTests.characteristicTwoPower`: The ordinary derivative criterion has no order-one tangent direction for `(x²,2)`
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



namespace AnalyticChecks

/-- `AnalyticLocalChecks.inverse`: The native analytic inverse theorem includes the analytic structure
of the inverse of an open partial homeomorphism. No new inverse theorem is planned. -/
example (f : OpenPartialHomeomorph ℂ ℂ) (a : ℂ)
    (ha : a ∈ f.source) (hf : AnalyticAt ℂ f a)
    (i : ℂ ≃L[ℂ] ℂ) (hi : fderiv ℂ f a = (i : ℂ →L[ℂ] ℂ)) :
    AnalyticAt ℂ f.symm (f a) := by sorry

/-- `AnalyticLocalChecks.identity`: The identity is the one-dimensional unramified chart. -/
example : HasStrictFDerivAt (fun z : ℂ => z) (ContinuousLinearMap.id ℂ ℂ) 0 := by sorry

/-- `AnalyticLocalChecks.twoTerm`: The two-term coordinate `2z+z²` has linear coefficient two; the
inverse linear coefficient is one half, not two. -/
example : HasDerivAt (fun z : ℂ => 2 * z + z ^ 2) 2 0 ∧
    (2 : ℂ) * (1 / 2) = 1 ∧ (2 : ℂ) ≠ 1 / 2 := by sorry

/-- `AnalyticLocalChecks.branched`: The branched map `z²` has derivative zero at zero and cannot furnish
an étale or biholomorphic coordinate there. -/
example : HasDerivAt (fun z : ℂ => z ^ 2) 0 0 ∧
    ¬ Function.Injective (fun z : ℂ => z ^ 2) := by sorry

/-- `AnalyticLocalChecks.triangular`: A triangular two-variable coordinate change and its inverse retain
the sign of the nonlinear correction on both composites. -/
example (u v : ℂ) : ((u + v ^ 2) - v ^ 2, v) = (u, v) ∧
    ((u - v ^ 2) + v ^ 2, v) = (u, v) := by sorry

/-- `AnalyticLocalChecks.zeroDimension`: In dimension zero the empty coordinate product is a single point,
which is also the empty-boundary chart. -/
example : Subsingleton (Fin 0 → ℂ) := by sorry

/-- `AnalyticLocalChecks.oneBoundary`: A single SNC coordinate has punctured complement inside its disc,
while boundary count zero keeps the whole disc. -/
example (r : ℝ) :
    {z : ℂ | z ∈ Metric.ball 0 r ∧ z ≠ 0} = Metric.ball 0 r \ {0} ∧
      {z : ℂ | z ∈ Metric.ball 0 r ∧ ∀ i : Fin 0, (fun _ => z) i ≠ 0} =
        Metric.ball 0 r := by sorry

/-- `AnalyticLocalChecks.crossing`: Two crossing coordinate hyperplanes remove each axis; removing
only their intersection would incorrectly retain points on either axis. -/
example (x y : ℂ) :
    (x * y ≠ 0 ↔ x ≠ 0 ∧ y ≠ 0) ∧
      ((1 : ℂ) * 0 = 0 ∧ (1 : ℂ) ≠ 0) := by sorry

/-- `AnalyticLocalChecks.nilpotent`: The analytic structure of a nonreduced point keeps its nilpotent,
although the underlying reduced point space has only one point. -/
example : (DualNumber.eps : DualNumber ℂ) ^ 2 = 0 ∧
    (DualNumber.eps : DualNumber ℂ) ≠ 0 := by sorry

end AnalyticChecks

namespace LogDeRhamChecks

/-- `LogDeRhamChecks.two`: swapping two independent degree-one generators negates their
exterior product, fixing the sign used by the first-factor residue convention. -/
example (M : Type u) [AddCommGroup M] [Module ℤ M] (x y : M) :
    ExteriorAlgebra.ι ℤ y * ExteriorAlgebra.ι ℤ x =
      -(ExteriorAlgebra.ι ℤ x * ExteriorAlgebra.ι ℤ y) := by sorry

end LogDeRhamChecks




end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

/-
Additional README contract signatures and checks not typed in this representative file.
Names are relative to TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry and retain the
README hypotheses. The stated space, sheaf, analytic and resolution carriers determine their types.

Targets:
`BooleanCofiltered`; `CompletedLocalRing`; `ComplexAnalyticSpace`; `FamilyVersalAt`;
`FormalObject`; `FramedDeformation`; `InfinitesimalStabilizer`; `IntrinsicBandSections`;
`ModuleObstructionTheory`; `ParameterFormalExports`; `PicardStackSpaces`; `PicardZeroSheaf`;
`RaynaudNStar`; `SpaceAnalytification`; `TauCeti.ArithmeticModuli.DMNormalization.finite`;
`TauCeti.ArithmeticModuli.DMNormalization.stack`;
`TauCeti.ArithmeticModuli.DMSchematicClosure.stack`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.coarse_finite`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.composition`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.fpqc_descent`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup`;
`TauCeti.ArithmeticModuli.Rigidification.affine_gerbe`;
`TauCeti.ArithmeticModuli.Rigidification.base_change`;
`TauCeti.ArithmeticModuli.Rigidification.coarse`;
`TauCeti.ArithmeticModuli.Rigidification.geometry`;
`TauCeti.ArithmeticModuli.Rigidification.nested`;
`TauCeti.ArithmeticModuli.Rigidification.stabilizer_kernel`;
`TauCeti.ArithmeticModuli.Rigidification.stack`;
`TauCeti.ArithmeticModuli.Rigidification.universal`;
`TauCeti.ArithmeticModuli.Rigidification.vertical_kernel`;
`TauCeti.ArithmeticModuli.auxiliary_level_comparison`;
`TauCeti.ArithmeticModuli.finite_schematic_closure`;
`TauCeti.ArithmeticModuli.normalized_finite_correspondence`;
`TauCeti.ArithmeticModuli.tame_finite_flat_descent`; `abelianAutCommute`; `affineFactorExistence`;
`affineFpqcQuasicoherentDescent`; `affineKernelRigidification`; `affineModuleDescentEquivalence`;
`affineNormalQuotient`; `algebraicAdjointVanishing`; `algebraicMultiplierIdeal`;
`algebraicStackRestriction_equivalence`; `algebraisationVersalFormal`; `allSelfEquivalences`;
`amplePowersAndFixedTwists`; `analyticGermReduction`; `analyticPolydisc`;
`analyticRelationLocalChart`; `analytification_descent`; `arithmeticFormalComparison_transfer`;
`arithmetic_normalization_genericallyEtale`; `artinApproximationClassical`;
`artin_space_criterion`; `artin_stack_criterion`; `automorphismGroupScheme`;
`bandCenterBandUnique`; `bandCenterBanding`; `bandCenterCommute`; `bandCenterEvaluation`;
`bandCenterEvaluationCentral`; `bandCenterEvaluationCover`; `bandCenterEvaluationEquivalence`;
`bandCenterEvaluationInjective`; `bandCenterEvaluationReindex`; `bandCenterEvaluationSurjective`;
`bandCenterExt`; `bandCenterFixedBandDistinction`; `bandCenterFromBanding`;
`bandCenterFromBandingEvaluation`; `bandCenterFromBandingExt`; `bandCenterFromBandingInjective`;
`bandCenterFromBandingPresheaf`; `bandCenterFromBandingRestriction`; `bandCenterGluedComparison`;
`bandCenterRestrictComp`; `bandCenterRestrictId`; `bandCenterSeparated`; `bandCenterSheaf`;
`bandCoefficientCenter`; `bandCoefficientCenterEvaluation`; `bandCoefficientNaturality`;
`bandCoefficientRestriction`; `bigFamilyBirationalBounds`;
`booleanCofilteredPresentation.cofinalEquivalence`; `boundedDegreeHilbertPolynomials`;
`canonicalAffineFactorization`; `canonicalFactorizationUnique`; `canonicalOverlapFunctor`;
`cartierSeparation`; `cartier_duality_restriction`; `changeBand`; `chosenDescentToOverlap`;
`chosenOverlapEquivalence`; `chosenOverlapMorphisms`; `chosenOverlapRoundtrips`;
`chowOpenAndEmbedding`; `chowParameters`; `classChoiceIndependent`; `classCoefficientMap`;
`classOfGerbe`; `classSitePullback`; `classifyingAbelianGerbe`; `cmRegularity`;
`coactionTransitionCocycle`; `coactionTransitionInverses`; `coactionTransitionMaps`;
`coalgebraToOverlap`; `coefficientEquivalence`; `coefficientPresentation`; `coherentDevissage`;
`coherentGrassmannian`; `common_etale_neighbourhood`; `commutingQuotientExchange`;
`companionIdeal.maximalOrder`; `completeLocalSpaceRestriction_bijective`;
`completedAnalyticStalkComparison`; `completedAtlasPresentation_equivalence`;
`completedLocalRingProRepresents`; `complexSchemeAnalytification`; `complex_local_comparison`;
`componentSelector`; `controlledTransform`; `convergentGerm_noetherian`;
`convergentWeierstrassDivision`; `coverUnit_mono`; `cyclicCoverEigensummand`;
`deformationExamples`; `deformationFunctorOfPoint`; `deformationGroupoid`;
`descentEqualizerModuleCoordinates`; `devissageViaChow`; `effectiveHull_smoothChart`;
`effectiveVersal_algebraization`; `embeddedResolution`; `equivalenceInvariance`;
`exceptionalBirthBlocks`; `exceptionalHistory`; `familyHilbertPolynomials`; `familyRegularity`;
`familyVersalAt_completion_iff`; `fibre_betti_semicontinuity`; `finiteAffinoidInvariants`;
`finiteDegree`; `finiteEtaleGerbe`; `finiteEtaleImage`; `finiteLocallyFreeDescent`;
`finitePresentationModuleDescent`; `finiteQuotientPresentation`; `finiteStageHomEquivalence`;
`finite_picard_cartier_torsors`; `flagBundle`; `formalDivision`; `formalObject`;
`formalObjectsEffectiveAlgebraic`; `formal_object_approximation`; `fpqcQuasicoherentDescent`;
`fpqcQuasicoherentDescentEffective`; `fpqcQuasicoherentDescentFaithful`;
`fpqcQuasicoherentDescentFull`; `framedDeformation_twoFibre`; `framedTangent_exactSequence`;
`frobeniusStableLocus`; `fundamental_class_boundary`; `gRing_essentiallyFiniteType`;
`gerbeLimitFamily`; `globalCentres`; `gradedOrbitAffineNeighborhood`; `gradedPiecesFinite`;
`h2Classification`; `henselizationAlgebraicElements`; `hilbertDegreeOneAndNonFlatBase`;
`hilbertFunctorAsQuot`; `hilbertPolynomial`; `hilbertSamuel`; `hilbertSerre`;
`holomorphicStructure_coherent`; `homAndIsomSchemes`; `hsSemicoherence`; `hsStabilization`;
`incidenceLocus`; `infinitesimalStabilizer_linearization`; `initialDiagram`;
`injectiveBoundaryBijection`; `injectiveGerbeNeutral`; `integerTwists`; `intrinsicAbelianBand`;
`intrinsicBand.sliceComparison`; `invariantProperties`; `invariantWord`; `ko_cohomology_cofinite`;
`levelRemovalQuotient`; `liftingGerbe`; `liftingGerbe.isGerbe`; `liftingGerbe_class`;
`limitStackDescent`; `localIsomorphismResolution`; `locallyFull`; `locallyFullFinitePresentation`;
`locallyFullIsomEpi`; `locallyFullLimit`; `locallyFullRelative`; `logFrobeniusSplitting`;
`logHodgeDegeneration`; `lowest_degree_rank_stratum`; `markedIdeal`; `maximalContact`;
`moduleDescentCoaction`; `moduleOverlapDatum`; `monomialData`; `monomialDecrease`;
`monomialMultiplicity`; `nativeModuleCanonicalComparison`; `nativeModuleDescentCoalgebra`;
`nefMixedIntersectionBound`; `neutralSelfEquivalences`; `neutralizationEquivalence`;
`nonemptyAffineLimitGerbe`; `normalizedOrders`; `numericalVeryAmpleness`; `openness_of_versality`;
`ordersInvariant`; `overlapCoactionRoundtrips`; `overlapCoalgebraEquivalence`;
`overlapCoalgebraMorphisms`; `overlapDiagonal`; `overlapPullbackCoordinates`;
`overlapPullbackDiagonal`; `overlapPullbackTriple`; `overlapToChosenDescent`; `overlapToCoalgebra`;
`perfect_proper_pushforward`; `permissibleCentre`; `picardTorsionComponent`; `picardZeroCriterion`;
`picard_brauer_obstruction`; `picard_infinitesimal_lifting`; `picard_stack_algebraic`;
`picard_zero_criterion`; `plucker`; `polarisedIsomScheme`; `polynomial_approximation`;
`presentationCompletionVersal`; `preserveResolvedPoints`; `primeToPTwistedInertia`;
`principalization`; `profiniteEtaleGerbe`; `properSchemeGagaEquivalence`;
`properSchemeGagaPushforward`; `properSpaceCompletionEquivalence`;
`properSpaceNormalizationExcellent`; `proper_space_gaga`; `quasicoherentPseudofunctor`;
`quotIntoGrassmannian`; `quotientGerbeTransgression`; `quotientInertiaComponents`;
`r093AffineRestrictionComparison`; `r093CoherentPresentationDescent`; `r093EtaleSections`;
`r093FiniteModuliDescentComparison`; `r093FiniteQuotientComparison`;
`r093PolarizedDescentComparison`; `r093RelativeHom`; `r093RelativeHomAlgebraicity`;
`r093RestrictionAlgebraicity`; `r093RestrictionBaseChange`; `r093RestrictionCartesian`;
`r093RestrictionSheaf`; `r093WeilRestriction`; `ramified_divisor_trace`; `rankLocus`;
`rankOneGrassmannComparison`; `raynaud_degree_one_cohomologicallyFlat`; `recursiveInvariant`;
`regularCoordinates`; `relativeBundleCohomology`; `relativeComposition`; `relativeDescent`;
`relativeGerbe`; `relativePicardBaseChange`; `relativePicardKernel`; `relativePicardSheaf`;
`relativeProfiniteGerbeFiniteStages`; `relativePullback`; `relativeSerre`; `relativeVeryAmple`;
`relative_picard_algebraicSpace`; `relative_picard_separated`; `residualPresentation`;
`residualPresentation.normalizedOrder`; `resolutionCanonicalDegreeBound`;
`resolutionDenominatorCertificate`; `resolvedLocus`; `restriction_twoFibre_equivalence`;
`rigidLevelStructure`; `rigidification_gm_torsor`; `rigidifiedPicardSetoid`; `rootGerbe`;
`rootGerbeClass`; `rootO1Nonneutral`; `samuelJetIdeal`; `samuelPresentationIdentity`;
`samuelTransform`; `schemeFramedCompletionEquiv`; `schemeRelativeTangentEquiv`;
`sectionPicardSplit`; `sectionRigidifiedPicard`; `selfEquivalenceIsomTransport`;
`selfEquivalenceTorsor`; `semicoherentPresentation`; `separated_nonarch_analytification`;
`serreGeneration`; `single_degree_free_locus`; `sliceRestriction_preservesInjective`;
`smoothChart_versalHullComparison`; `smoothPolarizedBoundedness`; `sncBoundary`;
`sncCompactification`; `sncPolydiscChart`; `snc_exists_polydiscChart`;
`spaceFpqcQuasicoherentDescent`; `spaceFramedEtaleCompletionEquiv`; `spaceQuasicoherentModules`;
`stabiliserActionOnDeformations`; `stalkOrder`; `standardCertificate`; `termination`;
`testEquivalence`; `toposSiteGerbeComparison`; `torsorRepresentativeOfClass`;
`torsorTwistQuotientEquivalence`; `torsorTwistSpace`; `truncatedSectionModuleFinite`;
`twistedGroupActionQuotient`; `twistedInertiaAutomorphisms`; `twistedInertiaFiniteField`;
`twistedInertiaGenerator`; `uniformAdjointVeryAmpleness`; `uniformQuotientRegularity`;
`universal_functions`; `universeNormalizedGerbe`; `versalApproximation`; `zHatGerbe`;
`zHatNotAlgebraicFp`; `zHatNotFiniteType`

API:
`A0Extension.StrongGluingTests.subsetImage.map_comp`;
`A0Extension.StrongGluingTests.subsetImage.map_empty`;
`A0Extension.StrongGluingTests.subsetImage.map_unit`; `AffineGerbeFactorization.factorIso`;
`AffineGerbeFactorization.sourceMap`; `AffineGerbeFactorization.targetMap`;
`AffineKernelRigidification.factor`; `AffineKernelRigidification.homSheaf`;
`AffineKernelRigidification.neutral`; `Approximation.HasArtinApproximation.congruence`;
`Approximation.HasArtinApproximation.equations`;
`Approximation.HasArtinApproximation.finitePresentation`;
`Approximation.HasArtinApproximation.transport`; `AsSmall`; `AsSmall.equiv`;
`BandPreserving.modificationGroupoid`; `BerkovichAnalyticSpace`; `BerkovichAnalyticSpace.affinoid`;
`BerkovichAnalyticSpace.domain`; `BerkovichAnalyticSpace.fibreProduct`;
`BerkovichAnalyticSpace.glueDomains`; `BerkovichAnalyticSpace.refineAtlas`;
`BerkovichAnalyticSpace.rigidModel`; `ChosenModuleDescent.toOverlap`;
`ChosenModuleDescent.toOverlap_map`; `ChosenModuleDescent.toOverlap_transition`;
`ClassifyingGerbe.autIso`; `ClassifyingGerbe.band`; `ClassifyingGerbe.trivial`;
`Comonad.comparison`; `CompletedLocalRing.ext`; `CompletedLocalRing.isAdicComplete`;
`CompletedLocalRing.isNoetherianRing`; `CompletedLocalRing.jet`; `CompletedLocalRing.jet_ofStalk`;
`CompletedLocalRing.ofStalk`; `ComplexAnalyticSpace.closedSubspace`;
`ComplexAnalyticSpace.coherentStructure`; `ComplexAnalyticSpace.fibreProduct`;
`ComplexAnalyticSpace.glue`; `ComplexAnalyticSpace.openSubspace`; `DefGroupoid.changeOfField`;
`DefGroupoid.fibre`; `DefGroupoid.isDeformation_of_RS`; `DescentData`;
`FamilyVersalAt.completion_iff`; `FamilyVersalAt.finiteResidueExtension`;
`FamilyVersalAt.smallExtension_iff`; `FiniteAbelianQuotientPresentation.toFinite`;
`FiniteEtaleGerbe.autFiniteEtale`; `FiniteEtaleGerbe.baseChange`; `FiniteEtaleGerbe.presentation`;
`FiniteQuotientPresentation.equivalence`; `FiniteQuotientPresentation.genericFree`;
`FormalObject.IsEffective`; `FormalObject.IsVersal`; `FormalObject.evaluation`;
`FormalObject.hom_ext`; `FormalObject.isomorphism_iff`; `FormalObject.restrict`;
`FramedDeformation.arrow_criterion`; `FramedDeformation.reframe_frame`;
`FramedDeformation.reframe_object`; `Gerbe.changeBand`; `Gerbe.changeBand_comp`;
`Gerbe.changeBand_lift`; `Gerbe.class`; `Gerbe.class_changeNeutralization`;
`Gerbe.class_equivalence`; `Gerbe.isomTorsor`; `Gerbe.isomTorsor_action`;
`Gerbe.isomTorsor_pullback`; `Gerbe.ofH2`; `Gerbe.ofH2_equiv`; `Gerbe.ofH2_zero`;
`GerbeLimitFamily.evaluation_map`; `GerbeSampleAPI.classifyingNeutral`;
`GerbeSampleAPI.compatibleLimit`; `GerbeSampleAPI.derivedClassification`;
`GerbeSampleAPI.localNotNeutral`; `GerbeSampleAPI.neutralSelfEquivalences`;
`GerbeSampleAPI.profiniteNotFinitePresentation`; `GerbeSampleAPI.pullbackClass`;
`GerbeSampleAPI.rootClass`; `GerbeSelfEquivalence.torsor`; `GerbeSelfEquivalence.torsor_local`;
`GerbeSelfEquivalence.torsor_map`; `GerbeTransgression.component`;
`GerbeTransgression.conjugation`; `GerbeTransgression.pullback`; `GradedValuationSpace.basicOpen`;
`GradedValuationSpace.finiteExtensionMap`; `GradedValuationSpace.generalizationLift`;
`GradedValuationSpace.orbitFibre`; `GradedValuationSpace.patchTopology`; `HasSheafify`;
`HilbertFunctor.degree`; `HilbertFunctor.ofQuot`; `HilbertFunctor.pullback`;
`HilbertFunctor.toQuot`; `HolomorphicStructureSheaf.coordinate`;
`HolomorphicStructureSheaf.localRing`; `HolomorphicStructureSheaf.restrict`;
`HolomorphicStructureSheaf.stalkIso`; `HomIsom.dualNumberPoint.augmentation`;
`HomIsom.dualNumberPoint.closed`; `HomIsom.dualNumberPoint.nonflat`; `HomogenizationTests.cusp`;
`HomogenizationTests.markOne`; `HomogenizationTests.transverseDirections`;
`InfinitesimalStabilizer.faithful`; `InfinitesimalStabilizer.framedAut`;
`InfinitesimalStabilizer.mem_iff`; `IntrinsicBand.autIso`; `IntrinsicBand.pullback`;
`IntrinsicBand.unique`; `IsCMRegular.multiplication`; `IsCMRegular.vanish`; `IsEffective.all_iff`;
`IsEffective.iso_iff`; `IsEffective.ofRestriction`; `IsRelativeGerbe.isom_epi`;
`IsRelativeGerbe.localLift`; `IsRelativeGerbe.rectification_iff`; `LevelStructure.IsRigid`;
`LevelStructure.autAction`; `LevelStructure.torsor`; `LiftingGerbe.autIso`;
`LiftingGerbe.neutral_iff`; `LiftingGerbe.obj`; `LiftingGerbe.pullback`; `LineBundleClass`;
`LocallyFull.autFaithfullyFlat`; `LocallyFull.baseChange`; `LocallyFull.classifying_iff`;
`MarkedIdeal.homogenize`; `ModuleCat.extendRestrictScalarsAdj`; `ModuleCoaction.reverseTransition`;
`ModuleCoaction.reverseTransition_tmul`; `ModuleCoaction.toOverlap`;
`ModuleCoaction.toOverlap_module`; `ModuleCoaction.toOverlap_transition`;
`ModuleCoaction.transition`; `ModuleCoaction.transition_tmul`; `ModuleDescentCoalgebra.canonical`;
`ModuleDescentCoalgebra.coaction`; `ModuleDescentCoalgebra.equivalence`;
`ModuleObstructionTheory.baseChange`; `ModuleObstructionTheory.lifting_torsor`;
`ModuleObstructionTheory.mk`; `ModuleObstructionTheory.obstruction`;
`ModuleObstructionTheory.pushout`; `ModuleObstructionTheory.split`;
`ModuleObstructionTheory.zero_iff_lift`; `ModuleOverlapCanonical.forget`;
`ModuleOverlapCanonical.map`; `ModuleOverlapDatum.canonical`; `ModuleOverlapDatum.cocycle`;
`ModuleOverlapDatum.hom_ext`; `ModuleOverlapDatum.module`; `ModuleOverlapDatum.toChosen`;
`ModuleOverlapDatum.toChosen_hom`; `ModuleOverlapDatum.toChosen_map`;
`ModuleOverlapDatum.toCoalgebra`; `ModuleOverlapDatum.toCoalgebra_coaction`;
`ModuleOverlapDatum.toCoalgebra_module`; `ModuleOverlapDatum.transition`;
`OverlapPullbackCoordinates.left`; `OverlapPullbackCoordinates.map`;
`OverlapPullbackCoordinates.right`; `ParameterFormalExports.classify`;
`ParameterFormalExports.classify_natural`; `ParameterFormalExports.universal`;
`PicardStackSpaces.automorphism`; `PicardStackSpaces.descent`; `PicardStackSpaces.dual`;
`PicardStackSpaces.hom_equiv`; `PicardStackSpaces.ofLineBundle`; `PicardStackSpaces.pullback`;
`PicardStackSpaces.tensor`; `PicardStackSpaces.unit`; `PicardZeroSheaf.baseChange`;
`PicardZeroSheaf.ext`; `PicardZeroSheaf.fibre`; `PicardZeroSheaf.group`;
`PicardZeroSheaf.inclusion`; `PicardZeroSheaf.mem_iff`; `PicardZeroSheaf.mk`;
`ProfiniteEtaleGerbe.cofinal`; `ProfiniteEtaleGerbe.objectEquiv`; `ProfiniteEtaleGerbe.projection`;
`ProfiniteIntegersGerbe.aut`; `ProfiniteIntegersGerbe.finiteProjection`;
`ProfiniteIntegersGerbe.trivial`; `ProjectiveParameterSpaces.hilbertFunction.binaryDegree`;
`ProjectiveParameterSpaces.hilbertFunction.constant`;
`ProjectiveParameterSpaces.hilbertFunction.zero`; `Pseudofunctor`; `QCohPseudofunctor.affine`;
`QCohPseudofunctor.map`; `QCohPseudofunctor.map_forget`; `R09_1.coefficientFrobeniusCutoff.add`;
`R09_1.coefficientFrobeniusCutoff.monomial`; `R09_1.coefficientFrobeniusCutoff.smul`;
`R09_1.coefficientFrobeniusCutoff.zero`; `RaynaudNStar.functions`; `RaynaudNStar.genericNormal`;
`RaynaudNStar.mk`; `RaynaudNStar.noEmbedded`; `RaynaudNStar.ofIso`;
`RelativePicard.baseLineBundle`; `RelativePicard.ofLineBundle`; `RelativePicard.pullback`;
`RelativePicard.quotientSheaf`; `RelativePicard.relativePicardPresheaf.map`;
`RelativePicard.relativePicardPresheaf.map_comp`; `RelativePicard.relativePicardPresheaf.map_id`;
`Resolution.derivativeIdeal.contains`; `Resolution.derivativeIdeal.monomial`;
`Resolution.derivativeIdeal.unit`; `Resolution.derivativeIdeal.zero`;
`Resolution.idealOrderAt.cosupport`; `Resolution.idealOrderAt.unit`;
`Resolution.idealOrderAt.zero`; `RigidifiedPicard.hom`; `RigidifiedPicard.hom_ext`;
`RigidifiedPicard.lineBundle`; `RigidifiedPicard.mk`; `RigidifiedPicard.pullback`;
`RigidifiedPicard.trivial`; `RigidifiedPicard.trivialization`; `RootGerbe.band`; `RootGerbe.obj`;
`RootGerbe.pullback`; `SpaceAnalytification.chart`; `SpaceAnalytification.map`;
`SpaceAnalytification.map_comp`; `SpaceAnalytification.map_id`; `SpaceAnalytification.quotient`;
`SpaceAnalytification.scheme`; `SpaceInvertibleModule.chartDescent`;
`SpaceInvertibleModule.dualEvaluation`; `SpaceInvertibleModule.pullbackComp`;
`SpaceInvertibleModule.pullbackId`; `SpaceInvertibleModule.tensorPullback`; `SpaceQCoh.chart`;
`SpaceQCoh.schemeEquivalence`; `SpaceQCoh.transition`;
`TauCeti.ArithmeticModuli.DMNormalization.map`;
`TauCeti.ArithmeticModuli.DMNormalization.mapOfGeneric`;
`TauCeti.ArithmeticModuli.DMNormalization.normalIso`;
`TauCeti.ArithmeticModuli.DMNormalization.schemeComparison`;
`TauCeti.ArithmeticModuli.DMNormalization.smoothChart`;
`TauCeti.ArithmeticModuli.DMSchematicClosure.factor`;
`TauCeti.ArithmeticModuli.DMSchematicClosure.flatBaseChange`;
`TauCeti.ArithmeticModuli.DMSchematicClosure.minimal`;
`TauCeti.ArithmeticModuli.DMSchematicClosure.schemeComparison`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.Iso`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.apex`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.baseChange`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.compose`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.groupoid`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.identity`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.jointFinite`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.transpose`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.bottom`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.conjugation`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.ext`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.local_mem`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.restrict_mem`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.subgroup`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.top`;
`TauCeti.ArithmeticModuli.Rigidification.homSheaf`;
`TauCeti.ArithmeticModuli.Rigidification.isStack`;
`TauCeti.ArithmeticModuli.Rigidification.locallyObjects`;
`TauCeti.ArithmeticModuli.Rigidification.map`;
`TauCeti.ArithmeticModuli.Rigidification.quotientHom`; `TorsorTwist.mapTorsor`;
`TorsorTwist.quotient`; `TorsorTwist.trivial`; `TwistedInertia.fibre`;
`TwistedInertia.finiteStage`; `TwistedInertia.project`; `ULiftHom`; `affineGerbeFactor.baseChange`;
`affineGerbeFactor.faithful`; `affineGerbeFactor.locallyFull`; `affineGerbeFactor.universal`;
`affineNormalQuotient.baseChange`; `affineNormalQuotient.doubleQuotient`;
`affineNormalQuotient.faithfullyFlat`; `affineNormalQuotient.fpqcSheaf`;
`affineNormalQuotient.homEquiv`; `affineNormalQuotient.kernel`;
`algebraicMultiplierIdeal.localVanishing`; `algebraicMultiplierIdeal.monotone`;
`algebraicMultiplierIdeal.ofPrincipal`; `algebraicMultiplierIdeal.ofUnit`;
`algebraicMultiplierIdeal.resolutionIndependent`; `analyticGermReduction.domainEquiv`;
`analyticGermReduction.goodIffAffine`; `analyticGermReduction.inter`;
`analyticGermReduction.pullback`; `analyticGermReduction.separated`; `analyticGermReduction.union`;
`cartierSeparation_difference`; `cartierSeparation_disjoint`; `cartierSeparation_residual`;
`changeBand.band`; `changeBand.compose`; `changeBand.isGerbe`; `changeBand.map`;
`changeBand.mapModification`; `changeBand.slice`; `changeBand.unit`; `chowParameters.cycle`;
`chowParameters.cycle_fromCycle`; `chowParameters.fromCycle`; `chowParameters.support`;
`coefficientPresentation_commonMark`; `coefficientPresentation_cosupport`;
`coefficientPresentation_transform`; `coherentGrassmann.affinePoints`;
`coherentGrassmann.baseChange`; `coherentGrassmann.fromQuotient`; `coherentGrassmann.rankOne`;
`coherentGrassmann.universalQuotientSheaf`;
`completedAnalyticStalkComparison.coherentPullbackExact`;
`completedAnalyticStalkComparison.completionIso`; `completedAnalyticStalkComparison.flat`;
`completedAnalyticStalkComparison.localHom`; `complexSchemeAnalytification.closedSubspace`;
`complexSchemeAnalytification.etaleLocalIso`; `complexSchemeAnalytification.fibreProduct`;
`complexSchemeAnalytification.homEquiv`; `complexSchemeAnalytification.map`;
`complexSchemeAnalytification.mapComp`; `complexSchemeAnalytification.mapId`;
`complexSchemeAnalytification.openSubspace`; `complexSpaceAnalytification.atlasIndependence`;
`complexSpaceAnalytification.chart`; `complexSpaceAnalytification.etaleLocalIso`;
`complexSpaceAnalytification.fibreProduct`; `complexSpaceAnalytification.map`;
`complexSpaceAnalytification.mapComp`; `complexSpaceAnalytification.mapId`;
`complexSpaceAnalytification.separatedHausdorff`; `controlledTransform_factor`;
`controlledTransform_flatBaseChange`; `controlledTransform_identityCartier`;
`exceptionalBirthBlocks.disjoint`; `exceptionalBirthBlocks.firstBlock`;
`exceptionalBirthBlocks.nextBlock`; `exceptionalBirthBlocks.resetAtDrop`;
`exceptionalBirthBlocks.samePrefixLocality`; `exceptionalBirthBlocks.survivingTransform`;
`exceptionalHistory_birth`; `exceptionalHistory_disjoint`; `exceptionalHistory_stratum`;
`exceptionalOrder_divisibility`; `finiteFreeAnalyticQuotient.domain`;
`finiteFreeAnalyticQuotient.finiteEtale`; `finiteFreeAnalyticQuotient.good`;
`finiteFreeAnalyticQuotient.projection`; `finiteFreeAnalyticQuotient.relationIso`;
`finiteFreeAnalyticQuotient.strict`; `flagBundle.affinePoints`; `flagBundle.baseChange`;
`flagBundle.projection`; `flagBundle.toGrassmann`; `flagParameter_formalEquiv`;
`frobeniusStableLocus.equation`; `frobeniusStableLocus.graphEquation`;
`frobeniusStableLocus.inclusion`; `frobeniusStableLocus.isClosedImmersion`;
`frobeniusStableLocus.maximal`; `grassmannParameter_formalEquiv`; `hilbertParameter_formalEquiv`;
`hilbertPolynomial.add`; `hilbertPolynomial.eval_euler`; `hilbertPolynomial.twist`;
`hilbertSamuel_completion`; `hilbertSamuel_diagram`; `hilbertSamuel_order`;
`homParameter_formalEquiv`; `homogenize_equiv`; `homogenize_etaleGluing`;
`homogenize_tangentTransport`; `idealOrder_eq_iInf`; `idealOrder_span`;
`incidenceLocus.baseChange`; `incidenceLocus.fieldPoints`; `incidenceLocus.inclusion`;
`incidenceLocus.isClosedImmersion`; `incidenceLocus.projection`; `initialDiagram_monomial`;
`initialDiagram_upward`; `initialDiagram_vertices`; `invariantWord_compare`;
`invariantWord_prefix`; `invariantWord_terminal`; `isomParameter_formalEquiv`;
`logDeRhamComplex.d`; `logDeRhamComplex.d_sq`; `logDeRhamComplex.degree`;
`logDeRhamComplex.etalePullback`; `logDeRhamComplex.residue`; `markedIdeal_cosupport`;
`markedIdeal_rescale`; `maximumCentre_closed`; `maximumCentre_local`; `maximumCentre_localIso`;
`monomialCentre_minimal`; `monomialMass_denominator`; `monomialWeight_transform`;
`nonarchEtaleQuotient.descent`; `nonarchEtaleQuotient.good`; `nonarchEtaleQuotient.projection`;
`nonarchEtaleQuotient.relationIso`; `nonarchEtaleQuotient.separated`;
`nonarchEtaleQuotient.strict`; `normalizedOrder_commonMark`; `permissibleCentre_boundaryContained`;
`permissibleCentre_idealPower`; `permissibleCentre_snc_after`; `picardParameter_formalEquiv`;
`pluckerEmbedding.chartCoordinates`; `pluckerEmbedding.isClosedImmersion`; `pluckerEmbedding.over`;
`pluckerEmbedding.pullback_twist`; `presentationEquivalent_equivalence`;
`presentationEquivalent_strength`; `presentationEquivalent_transform`;
`projectiveParameter_formalEquiv`; `quotParameter_formalEquiv`; `rankLocus.baseChange`;
`rankLocus.factor_iff`; `rankLocus.minor_mem`; `residualOrder_nonnegative`;
`residualPresentation_normalized`; `residualPresentation_sstar`; `residualPresentation_stratum`;
`resolutionInvariant_equivalent`; `resolutionInvariant_first`; `resolutionInvariant_hypersurface`;
`resolvedLocus_open`; `resolvedLocus_restrict`; `resolvedLocus_subsetCriterion`;
`samuelCertificate_finiteCheck`; `samuelCertificate_generates`; `samuelCertificate_hilbert`;
`samuelJetIdeal_generatorIndependent`; `samuelJetIdeal_monotone`; `samuelJetIdeal_vanishing`;
`semicoherentPresentation_restrict`; `semicoherentPresentation_stratum`;
`semicoherentPresentation_transform`; `sncBoundary_coordinate`; `sncBoundary_empty`;
`sncBoundary_restrict`; `sncCompactification_boundary`; `sncCompactification_open`;
`sncCompactification_projective`; `sncPolydiscChart.boundary`; `sncPolydiscChart.complement`;
`sncPolydiscChart.etalePullback`; `sncPolydiscChart.permuteLabels`; `sncPolydiscChart.restrict`;
`spaceDQCoh.chartRestriction`; `spaceDQCoh.cohomologyComparison`; `spaceDQCoh.derivedPullback`;
`spaceDQCoh.derivedPushforward`; `spaceDQCoh.schemeEtaleEquivalence`; `spaceDQCoh.tensor`;
`spacePerfect.chartCharacterisation`; `spacePerfect.dual`; `spacePerfect.isLocal`;
`spacePerfect.pullback`; `spacePerfect.tensor`; `spacePerfect.torAmplitude`; `stalkIdeal_affine`;
`universeLift_preservesInjective`; `universeNormalizedGerbe.band`;
`universeNormalizedGerbe.cohomologyComparison`; `universeNormalizedGerbe.counit`;
`universeNormalizedGerbe.down`; `universeNormalizedGerbe.restriction`;
`universeNormalizedGerbe.torsorComparison`; `universeNormalizedGerbe.unit`;
`universeNormalizedGerbe.up`; `weightedPresentation_commonMark`

Checks:
`AffineKernelChecks.infinite`; `AffineKernelChecks.nonnormal`; `AffineKernelChecks.square`;
`AffineKernelChecks.trivial`; `AnalyticSpaceChecks.affine`; `AnalyticSpaceChecks.branch`;
`AnalyticSpaceChecks.doubledOrigin`; `AnalyticSpaceChecks.twoCharts`;
`AnalytificationTests.dualNumbers`; `AnalytificationTests.point`;
`AnalytificationTests.presentation`; `ApproximationTests.nonhenselian`; `ArtinChartChecks.framing`;
`ArtinChartChecks.nodePoint`; `ArtinChartChecks.paddedChart`; `ArtinChartChecks.pointHull`;
`BandComparisonTests.identity`; `BandComparisonTests.trivial`; `BandMorphismTests.inversion`;
`BandMorphismTests.modifications`; `BandRestrictionTests.chain`;
`BandRestrictionTests.independentFamilies`; `BandSheafTests.BC3`; `BandSheafTests.noTerminal`;
`BandSheafTests.rootNonneutral`; `BerkovichChecks.dual`; `BerkovichChecks.gauss`;
`BerkovichChecks.point`; `BerkovichChecks.refinement`; `BooleanChecks.parallel`;
`CanonicalFactorTests.identity`; `CanonicalFactorTests.kernel`; `CanonicalFactorTests.notTarget`;
`CanonicalOverlapTests.identity`; `CanonicalOverlapTests.nonfaithful`;
`CanonicalOverlapTests.scalarFactors`; `ChangeBandTests.BA`; `ChangeBandTests.identity`;
`ChangeBandTests.zero`; `ChosenOverlapTests.canonical`; `ChosenOverlapTests.noninvertible`;
`ChosenOverlapTests.zero`; `ChowTests.hyperplanes`; `ChowTests.multiplicity`;
`ChowTests.zeroDegree`; `ClassificationChecks.rootDegree`; `ClassificationChecks.zeroBand`;
`ClassifyingGerbeTests.inertia`; `ClassifyingGerbeTests.point`; `ClassifyingGerbeTests.zero`;
`CoactionTransitionTests.canonical`; `CoactionTransitionTests.decomposition`;
`CoactionTransitionTests.zeroModule`; `CoalgebraOverlapTests.factors`;
`CoalgebraOverlapTests.nonflat`; `CoalgebraOverlapTests.zero`;
`CoherentGrassmannTests.affinePoints`; `CoherentGrassmannTests.rankOne`;
`CoherentGrassmannTests.rankZero`; `CoherentGrassmannTests.zeroPositive`;
`CompletedAnalyticStalkChecks.dual`; `CompletedAnalyticStalkChecks.etale`;
`CompletedAnalyticStalkChecks.line`; `CompletedAnalyticStalkChecks.node`;
`CompletionTests.localResidue`; `CompletionTests.multiplication`; `CompletionTests.residueJet`;
`ComplexGagaChecks.extension`; `ComplexGagaChecks.nonproper`; `ComplexGagaChecks.point`;
`ComplexGagaChecks.projectiveLine`; `ComplexModelChecks.doubleOrigin`; `ComplexModelChecks.dual`;
`ComplexModelChecks.node`; `ComplexModelChecks.unit`; `DenominatorChecks.cusp`;
`DenominatorChecks.unitMark`; `EffectiveTests.empty`; `EffectiveTests.identity`;
`EffectiveTests.notFullyFaithful`; `FiniteAnalyticQuotientChecks.identity`;
`FiniteAnalyticQuotientChecks.notFree`; `FiniteAnalyticQuotientChecks.permutedCopies`;
`FiniteAnalyticQuotientChecks.residueTwo`; `FiniteGerbeTests.constant`; `FiniteGerbeTests.muP`;
`FiniteGerbeTests.trivial`; `FiniteQuotientTests.sign`; `FiniteQuotientTests.trivial`;
`FiniteQuotientTests.trivialAction`; `FlagTests.empty`; `FlagTests.nested`; `FlagTests.single`;
`FormalTests.automorphisms`; `FormalTests.compatibleArrows`; `FormalTests.point`;
`FramedTests.discrete`; `FramedTests.nontrivialFrame`; `FramedTests.residueIdentity`;
`FrobeniusTests.identityChart`; `FrobeniusTests.nonFixedCoefficient`;
`FrobeniusTests.zeroOperator`; `GerbeBandEquivalenceTests.fibre_family_refl`;
`GerbeBandEquivalenceTests.modification_refl`; `GerbeClassTests.BA`; `GerbeClassTests.banding`;
`GerbeClassTests.lift`; `GerbeSampleTests.classifyingNeutral`; `GerbeSampleTests.compatibleLimit`;
`GerbeSampleTests.derivedClassification`; `GerbeSampleTests.neutralSelfEquivalences`;
`GerbeSampleTests.profiniteNotFinitePresentation`; `GerbeSampleTests.pullbackClass`;
`GerbeSampleTests.rootClass`; `GerbeTests.classifying`; `GerbeTests.rootNotNeutral`;
`GermReductionChecks.affinoid`; `GermReductionChecks.laurent`; `GermReductionChecks.refine`;
`GradedValuationChecks.orbit`; `GradedValuationChecks.support`; `GradedValuationChecks.trivial`;
`H2RepresentativeTests.changeTorsor`; `H2RepresentativeTests.nonzero`;
`H2RepresentativeTests.zero`; `HilbertPolynomialTests.projectiveLine`;
`HilbertPolynomialTests.projectivePoint`; `HilbertPolynomialTests.zero`; `HistoryChecks.empty`;
`HistoryChecks.reset`; `HolomorphicSheafChecks.exponential`; `HolomorphicSheafChecks.local`;
`HolomorphicSheafChecks.point`; `IncidenceTests.impossible`; `IncidenceTests.lines`;
`IncidenceTests.zeroBound`; `IntrinsicBandChecks.disconnectedFailure`;
`IntrinsicBandChecks.nonconstantSlice`; `IntrinsicBandChecks.nonneutral`;
`IntrinsicBandChecks.restrictionChain`; `IntrinsicBandTests.BA`; `IntrinsicBandTests.trivial`;
`IntrinsicBandTests.unfixed`; `IsomTorsorTests.composition`; `IsomTorsorTests.emptySections`;
`IsomTorsorTests.self`; `KernelRigidificationTests.allKernel`;
`KernelRigidificationTests.notOrbitSet`; `KernelRigidificationTests.zeroKernel`;
`LiftingGerbeTests.surjectiveSheaf`; `LiftingGerbeTests.trivial`; `LiftingGerbeTests.zeroKernel`;
`LimitChecks.singleton`; `LimitChecks.twoCoordinates`; `LimitFamilyTests.classesInsufficient`;
`LimitFamilyTests.identityTower`; `LimitFamilyTests.singleton`; `LocallyFullTests.identity`;
`LocallyFullTests.square`; `LocallyFullTests.subgroup`; `LogDeRhamChecks.compact`;
`LogDeRhamChecks.empty`; `LogDeRhamChecks.one`; `ModuleCoalgebraTests.cocycle`;
`ModuleCoalgebraTests.identity`; `ModuleCoalgebraTests.product`; `ModuleOverlapTests.identity`;
`ModuleOverlapTests.infiniteFree`; `ModuleOverlapTests.noninvertibleMap`;
`ModuleOverlapTests.scalarTwo`; `MultiplierIdealChecks.crossing`;
`MultiplierIdealChecks.nonExample`; `MultiplierIdealChecks.principal`;
`MultiplierIdealChecks.unit`; `NeutralizationTests.BA`; `NeutralizationTests.root`;
`NonarchRelationChecks.closed`; `NonarchRelationChecks.identity`;
`NonarchRelationChecks.twoCopies`; `ObstructionTests.curveLineBundle`;
`ObstructionTests.doublePoint`; `ObstructionTests.split`; `ObstructionTests.zeroKernel`;
`OverlapChosenTests.identity`; `OverlapChosenTests.nonflat`; `OverlapChosenTests.zeroMap`;
`OverlapCoactionTests.canonical`; `OverlapCoactionTests.identity`;
`OverlapCoactionTests.noFlatness`; `OverlapPullbackTests.factors`; `OverlapPullbackTests.identity`;
`OverlapPullbackTests.zeroRing`; `ParameterTests.grassmannEndpoints`;
`ParameterTests.hilbertNonflatBase`; `ParameterTests.identityRepresentation`;
`ParameterTests.isomUnit`; `ParameterTests.picardAutomorphisms`; `ParameterTests.pullback`;
`ParameterTests.quotLengthOne`; `ParameterTests.universalElement`; `PicardSheafTests.baseChange`;
`PicardSheafTests.identity`; `PicardSheafTests.needSheafification`; `PicardStackTests.baseChange`;
`PicardStackTests.disjointPoints`; `PicardStackTests.point`; `PicardZeroChecks.elliptic`;
`PicardZeroChecks.fullStructure`; `PicardZeroChecks.nonreducedBase`; `PicardZeroChecks.point`;
`PicardZeroTests.curve`; `PicardZeroTests.nonreduced`; `PicardZeroTests.projectiveLine`;
`PluckerTests.rankOne`; `PluckerTests.rankZero`; `PluckerTests.twoPlanesFourSpace`;
`ProfiniteGerbeTests.finite`; `ProfiniteGerbeTests.identity`; `ProfiniteGerbeTests.zHat`;
`QCohPseudoTests.identity`; `RankLocusTests.fullRankBound`; `RankLocusTests.nilpotent`;
`RankLocusTests.oneByOne`; `RaynaudTests.embeddedPoint`; `RaynaudTests.nontrivialConstants`;
`RaynaudTests.regularPoint`; `RegularityTests.lineBundle`; `RegularityTests.structureSheaf`;
`RegularityTests.zero`; `RelativeGerbeTests.classifying`; `RelativeGerbeTests.identity`;
`RelativeGerbeTests.subgroup`; `RelativeResolutionChecks.contained`;
`RelativeResolutionChecks.reduced`; `RelativeResolutionChecks.sncVsSmooth`;
`RelativeResolutionChecks.transverse`; `ResidualChecks.zeroInfinity`; `RigidifiedPicardTests.P1`;
`RigidifiedPicardTests.automorphisms`; `RigidifiedPicardTests.identity`;
`RootGerbeTests.noSection`; `RootGerbeTests.one`; `RootGerbeTests.trivialLine`;
`SNCChartChecks.crossing`; `SNCChartChecks.empty`; `SNCChartChecks.one`;
`SNCChartChecks.singularAmbient`; `SNCChartChecks.triangular`;
`SchemeAnalytificationChecks.affineLine`; `SchemeAnalytificationChecks.branch`;
`SchemeAnalytificationChecks.dual`; `SchemeAnalytificationChecks.empty`; `SelectorChecks.empty`;
`SelectorChecks.singleton`; `SelfEquivalenceTorsorTests.identity`;
`SelfEquivalenceTorsorTests.neutral`; `SelfEquivalenceTorsorTests.nonNeutralRoot`;
`SpaceDerivedChecks.degree`; `SpaceDerivedChecks.dualNumberResidue`;
`SpaceDerivedChecks.nonflatPullback`; `SpaceDerivedChecks.zero`; `SpaceExistenceChecks.allLevels`;
`SpaceExistenceChecks.arrows`; `SpaceExistenceChecks.identity`; `SpaceExistenceChecks.support`;
`SpaceLineChecks.cocycle`; `SpaceLineChecks.nilpotents`; `SpaceLineChecks.point`;
`SpaceLineChecks.twoPoints`; `SpaceQCohTests.affine`; `SpaceQCohTests.identity`;
`SpaceQCohTests.infiniteModule`; `StabilizerTests.allKilled`; `StabilizerTests.frameKernel`;
`StabilizerTests.identity`; `SynchronizationChecks.kernel`;
`TauCeti.AlgebraicGeometry.ModuliDescent.relativeHom_empty`;
`TauCeti.AlgebraicGeometry.ModuliDescent.relativeHom_identity`;
`TauCeti.AlgebraicGeometry.ModuliDescent.relativeHom_split_two`;
`TauCeti.AlgebraicGeometry.ModuliDescent.weilRestriction_empty`;
`TauCeti.AlgebraicGeometry.ModuliDescent.weilRestriction_identity`;
`TauCeti.AlgebraicGeometry.ModuliDescent.weilRestriction_split_two`;
`TauCeti.AlgebraicGeometry.ModuliDescent.weilRestriction_terminal`;
`TauCeti.ArithmeticModuli.DMNormalization.test_nilpotents`;
`TauCeti.ArithmeticModuli.DMNormalization.test_node`;
`TauCeti.ArithmeticModuli.DMNormalization.test_normal_stack`;
`TauCeti.ArithmeticModuli.DMNormalization.test_scheme_comparison`;
`TauCeti.ArithmeticModuli.DMSchematicClosure.test_closed_point`;
`TauCeti.ArithmeticModuli.DMSchematicClosure.test_nilpotents`;
`TauCeti.ArithmeticModuli.DMSchematicClosure.test_nonflat`;
`TauCeti.ArithmeticModuli.DMSchematicClosure.test_scheme_comparison`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.test_double_point`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.test_empty`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.test_identity`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.test_two_legs`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.test_base_change`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.test_bottom`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.test_noncentral`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.test_not_closed_identity`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.test_not_normal`;
`TauCeti.ArithmeticModuli.Rigidification.test_cyclic_four`;
`TauCeti.ArithmeticModuli.Rigidification.test_mu_p`;
`TauCeti.ArithmeticModuli.Rigidification.test_sheaf_quotient`;
`TauCeti.ArithmeticModuli.Rigidification.test_trivial`; `TransgressionTests.identity`;
`TransgressionTests.modification`; `TransgressionTests.trivialEquivariance`; `TwistTests.arrows`;
`TwistTests.freeTorsor`; `TwistTests.trivial`; `TwistedInertiaTests.pGroup`;
`TwistedInertiaTests.space`; `TwistedInertiaTests.zeroHom`; `VersalTests.closedPoint`;
`VersalTests.excessParameter`; `VersalTests.identity`; `ZHatGerbeTests.compatibleArrows`;
`ZHatGerbeTests.finiteLevel`; `ZHatGerbeTests.notFinitePresentation`;
`cartier_identity_not_trivial`; `centre_contained_in_boundary`; `centre_outside_cosupport`;
`centre_tangent_to_boundary`; `certificate_coordinate_ideal`;
`certificate_division_not_initialDiagram`; `certificate_pure_power`; `certificate_wrong_order`;
`compactify_affine_line`; `compactify_preserves_smooth_open`; `compactify_two_torus`;
`contact_pure_power`; `cusp_coefficient_weights`; `cusp_controlled_chart`; `diagram_xy`;
`diagram_zero_and_unit`; `different_from_strict`; `empty_presentation_infinite`;
`exceptional_is_not_point_order`; `exceptional_pullback_not_division`;
`formal_only_is_insufficient`; `graded_lex_not_pure_lex`; `hilbertSamuel_double_point`;
`hilbertSamuel_nonrational_point`; `hilbertSamuel_smooth`; `history_changes_centre`;
`history_new_exceptional`; `history_year_zero`; `invariant_bm_example`; `invariant_cusp`;
`invariant_smooth_empty_boundary`; `jet_double_origin`; `jet_unit_ideal`; `jet_zero_ideal`;
`mark_changes_cosupport`; `marked_zero_and_unit`; `maximum_empty_unresolved`;
`maximum_incomparable_union`; `maximum_is_not_multiplicity`; `mixed_coefficient_weights`;
`monomial_nonminimal`; `monomial_residual_zero`; `monomial_single_axis`; `monomial_two_axes`;
`order_two_generators`; `order_unit_ideal`; `order_zero_ideal`; `rescaling_test_equivalence`;
`residual_monomial_terminal`; `residual_no_guard_above_one`; `residual_requires_guard`;
`resolved_empty_boundary`; `resolved_tangency`; `resolved_transverse_axes`;
`same_initial_cosupport_fails`; `semicoherent_common_open`; `semicoherent_hypersurface`;
`separate_coordinate_axes`; `separate_equal_divisors`; `separate_unequal_multiplicities`;
`snc_coordinate_axes`; `snc_self_intersection`; `snc_tangent_curves`; `weighted_common_mark`;
`word_history_tie`; `word_multiplicity_tie`; `word_terminal_zero_infinity`
-/

/-
Additional README contract signatures and checks not typed in this representative file.
Names are relative to TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry and retain the
README hypotheses. The stated space, sheaf, analytic and resolution carriers determine their types.

Targets:
`BooleanCofiltered`; `CompletedLocalRing`; `ComplexAnalyticSpace`; `FamilyVersalAt`;
`FormalObject`; `FramedDeformation`; `InfinitesimalStabilizer`; `IntrinsicBandSections`;
`ModuleObstructionTheory`; `ParameterFormalExports`; `PicardStackSpaces`; `PicardZeroSheaf`;
`RaynaudNStar`; `SpaceAnalytification`; `TauCeti.ArithmeticModuli.DMNormalization.finite`;
`TauCeti.ArithmeticModuli.DMNormalization.stack`;
`TauCeti.ArithmeticModuli.DMSchematicClosure.stack`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.coarse_finite`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.composition`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.fpqc_descent`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup`;
`TauCeti.ArithmeticModuli.Rigidification.affine_gerbe`;
`TauCeti.ArithmeticModuli.Rigidification.base_change`;
`TauCeti.ArithmeticModuli.Rigidification.coarse`;
`TauCeti.ArithmeticModuli.Rigidification.geometry`;
`TauCeti.ArithmeticModuli.Rigidification.nested`;
`TauCeti.ArithmeticModuli.Rigidification.stabilizer_kernel`;
`TauCeti.ArithmeticModuli.Rigidification.stack`;
`TauCeti.ArithmeticModuli.Rigidification.universal`;
`TauCeti.ArithmeticModuli.Rigidification.vertical_kernel`;
`TauCeti.ArithmeticModuli.auxiliary_level_comparison`;
`TauCeti.ArithmeticModuli.finite_schematic_closure`;
`TauCeti.ArithmeticModuli.normalized_finite_correspondence`;
`TauCeti.ArithmeticModuli.tame_finite_flat_descent`; `abelianAutCommute`; `affineFactorExistence`;
`affineFpqcQuasicoherentDescent`; `affineKernelRigidification`; `affineModuleDescentEquivalence`;
`affineNormalQuotient`; `algebraicAdjointVanishing`; `algebraicMultiplierIdeal`;
`algebraicStackRestriction_equivalence`; `algebraisationVersalFormal`; `allSelfEquivalences`;
`amplePowersAndFixedTwists`; `analyticGermReduction`; `analyticPolydisc`;
`analyticRelationLocalChart`; `analytification_descent`; `arithmeticFormalComparison_transfer`;
`arithmetic_normalization_genericallyEtale`; `artinApproximationClassical`;
`artin_space_criterion`; `artin_stack_criterion`; `automorphismGroupScheme`;
`bandCenterBandUnique`; `bandCenterBanding`; `bandCenterCommute`; `bandCenterEvaluation`;
`bandCenterEvaluationCentral`; `bandCenterEvaluationCover`; `bandCenterEvaluationEquivalence`;
`bandCenterEvaluationInjective`; `bandCenterEvaluationReindex`; `bandCenterEvaluationSurjective`;
`bandCenterExt`; `bandCenterFixedBandDistinction`; `bandCenterFromBanding`;
`bandCenterFromBandingEvaluation`; `bandCenterFromBandingExt`; `bandCenterFromBandingInjective`;
`bandCenterFromBandingPresheaf`; `bandCenterFromBandingRestriction`; `bandCenterGluedComparison`;
`bandCenterRestrictComp`; `bandCenterRestrictId`; `bandCenterSeparated`; `bandCenterSheaf`;
`bandCoefficientCenter`; `bandCoefficientCenterEvaluation`; `bandCoefficientNaturality`;
`bandCoefficientRestriction`; `bigFamilyBirationalBounds`;
`booleanCofilteredPresentation.cofinalEquivalence`; `boundedDegreeHilbertPolynomials`;
`canonicalAffineFactorization`; `canonicalFactorizationUnique`; `canonicalOverlapFunctor`;
`cartierSeparation`; `cartier_duality_restriction`; `changeBand`; `chosenDescentToOverlap`;
`chosenOverlapEquivalence`; `chosenOverlapMorphisms`; `chosenOverlapRoundtrips`;
`chowOpenAndEmbedding`; `chowParameters`; `classChoiceIndependent`; `classCoefficientMap`;
`classOfGerbe`; `classSitePullback`; `classifyingAbelianGerbe`; `cmRegularity`;
`coactionTransitionCocycle`; `coactionTransitionInverses`; `coactionTransitionMaps`;
`coalgebraToOverlap`; `coefficientEquivalence`; `coefficientPresentation`; `coherentDevissage`;
`coherentGrassmannian`; `common_etale_neighbourhood`; `commutingQuotientExchange`;
`companionIdeal.maximalOrder`; `completeLocalSpaceRestriction_bijective`;
`completedAnalyticStalkComparison`; `completedAtlasPresentation_equivalence`;
`completedLocalRingProRepresents`; `complexSchemeAnalytification`; `complex_local_comparison`;
`componentSelector`; `controlledTransform`; `convergentGerm_noetherian`;
`convergentWeierstrassDivision`; `coverUnit_mono`; `cyclicCoverEigensummand`;
`deformationExamples`; `deformationFunctorOfPoint`; `deformationGroupoid`;
`descentEqualizerModuleCoordinates`; `devissageViaChow`; `effectiveHull_smoothChart`;
`effectiveVersal_algebraization`; `embeddedResolution`; `equivalenceInvariance`;
`exceptionalBirthBlocks`; `exceptionalHistory`; `familyHilbertPolynomials`; `familyRegularity`;
`familyVersalAt_completion_iff`; `fibre_betti_semicontinuity`; `finiteAffinoidInvariants`;
`finiteDegree`; `finiteEtaleGerbe`; `finiteEtaleImage`; `finiteLocallyFreeDescent`;
`finitePresentationModuleDescent`; `finiteQuotientPresentation`; `finiteStageHomEquivalence`;
`finite_picard_cartier_torsors`; `flagBundle`; `formalDivision`; `formalObject`;
`formalObjectsEffectiveAlgebraic`; `formal_object_approximation`; `fpqcQuasicoherentDescent`;
`fpqcQuasicoherentDescentEffective`; `fpqcQuasicoherentDescentFaithful`;
`fpqcQuasicoherentDescentFull`; `framedDeformation_twoFibre`; `framedTangent_exactSequence`;
`frobeniusStableLocus`; `fundamental_class_boundary`; `gRing_essentiallyFiniteType`;
`gerbeLimitFamily`; `globalCentres`; `gradedOrbitAffineNeighborhood`; `gradedPiecesFinite`;
`h2Classification`; `henselizationAlgebraicElements`; `hilbertDegreeOneAndNonFlatBase`;
`hilbertFunctorAsQuot`; `hilbertPolynomial`; `hilbertSamuel`; `hilbertSerre`;
`holomorphicStructure_coherent`; `homAndIsomSchemes`; `hsSemicoherence`; `hsStabilization`;
`incidenceLocus`; `infinitesimalStabilizer_linearization`; `initialDiagram`;
`injectiveBoundaryBijection`; `injectiveGerbeNeutral`; `integerTwists`; `intrinsicAbelianBand`;
`intrinsicBand.sliceComparison`; `invariantProperties`; `invariantWord`; `ko_cohomology_cofinite`;
`levelRemovalQuotient`; `liftingGerbe`; `liftingGerbe.isGerbe`; `liftingGerbe_class`;
`limitStackDescent`; `localIsomorphismResolution`; `locallyFull`; `locallyFullFinitePresentation`;
`locallyFullIsomEpi`; `locallyFullLimit`; `locallyFullRelative`; `logFrobeniusSplitting`;
`logHodgeDegeneration`; `lowest_degree_rank_stratum`; `markedIdeal`; `maximalContact`;
`moduleDescentCoaction`; `moduleOverlapDatum`; `monomialData`; `monomialDecrease`;
`monomialMultiplicity`; `nativeModuleCanonicalComparison`; `nativeModuleDescentCoalgebra`;
`nefMixedIntersectionBound`; `neutralSelfEquivalences`; `neutralizationEquivalence`;
`nonemptyAffineLimitGerbe`; `normalizedOrders`; `numericalVeryAmpleness`; `openness_of_versality`;
`ordersInvariant`; `overlapCoactionRoundtrips`; `overlapCoalgebraEquivalence`;
`overlapCoalgebraMorphisms`; `overlapDiagonal`; `overlapPullbackCoordinates`;
`overlapPullbackDiagonal`; `overlapPullbackTriple`; `overlapToChosenDescent`; `overlapToCoalgebra`;
`perfect_proper_pushforward`; `permissibleCentre`; `picardTorsionComponent`; `picardZeroCriterion`;
`picard_brauer_obstruction`; `picard_infinitesimal_lifting`; `picard_stack_algebraic`;
`picard_zero_criterion`; `plucker`; `polarisedIsomScheme`; `polynomial_approximation`;
`presentationCompletionVersal`; `preserveResolvedPoints`; `primeToPTwistedInertia`;
`principalization`; `profiniteEtaleGerbe`; `properSchemeGagaEquivalence`;
`properSchemeGagaPushforward`; `properSpaceCompletionEquivalence`;
`properSpaceNormalizationExcellent`; `proper_space_gaga`; `quasicoherentPseudofunctor`;
`quotIntoGrassmannian`; `quotientGerbeTransgression`; `quotientInertiaComponents`;
`r093AffineRestrictionComparison`; `r093CoherentPresentationDescent`; `r093EtaleSections`;
`r093FiniteModuliDescentComparison`; `r093FiniteQuotientComparison`;
`r093PolarizedDescentComparison`; `r093RelativeHom`; `r093RelativeHomAlgebraicity`;
`r093RestrictionAlgebraicity`; `r093RestrictionBaseChange`; `r093RestrictionCartesian`;
`r093RestrictionSheaf`; `r093WeilRestriction`; `ramified_divisor_trace`; `rankLocus`;
`rankOneGrassmannComparison`; `raynaud_degree_one_cohomologicallyFlat`; `recursiveInvariant`;
`regularCoordinates`; `relativeBundleCohomology`; `relativeComposition`; `relativeDescent`;
`relativeGerbe`; `relativePicardBaseChange`; `relativePicardKernel`; `relativePicardSheaf`;
`relativeProfiniteGerbeFiniteStages`; `relativePullback`; `relativeSerre`; `relativeVeryAmple`;
`relative_picard_algebraicSpace`; `relative_picard_separated`; `residualPresentation`;
`residualPresentation.normalizedOrder`; `resolutionCanonicalDegreeBound`;
`resolutionDenominatorCertificate`; `resolvedLocus`; `restriction_twoFibre_equivalence`;
`rigidLevelStructure`; `rigidification_gm_torsor`; `rigidifiedPicardSetoid`; `rootGerbe`;
`rootGerbeClass`; `rootO1Nonneutral`; `samuelJetIdeal`; `samuelPresentationIdentity`;
`samuelTransform`; `schemeFramedCompletionEquiv`; `schemeRelativeTangentEquiv`;
`sectionPicardSplit`; `sectionRigidifiedPicard`; `selfEquivalenceIsomTransport`;
`selfEquivalenceTorsor`; `semicoherentPresentation`; `separated_nonarch_analytification`;
`serreGeneration`; `single_degree_free_locus`; `sliceRestriction_preservesInjective`;
`smoothChart_versalHullComparison`; `smoothPolarizedBoundedness`; `sncBoundary`;
`sncCompactification`; `sncPolydiscChart`; `snc_exists_polydiscChart`;
`spaceFpqcQuasicoherentDescent`; `spaceFramedEtaleCompletionEquiv`; `spaceQuasicoherentModules`;
`stabiliserActionOnDeformations`; `stalkOrder`; `standardCertificate`; `termination`;
`testEquivalence`; `toposSiteGerbeComparison`; `torsorRepresentativeOfClass`;
`torsorTwistQuotientEquivalence`; `torsorTwistSpace`; `truncatedSectionModuleFinite`;
`twistedGroupActionQuotient`; `twistedInertiaAutomorphisms`; `twistedInertiaFiniteField`;
`twistedInertiaGenerator`; `uniformAdjointVeryAmpleness`; `uniformQuotientRegularity`;
`universal_functions`; `universeNormalizedGerbe`; `versalApproximation`; `zHatGerbe`;
`zHatNotAlgebraicFp`; `zHatNotFiniteType`

API:
`A0Extension.StrongGluingTests.subsetImage.map_comp`;
`A0Extension.StrongGluingTests.subsetImage.map_empty`;
`A0Extension.StrongGluingTests.subsetImage.map_unit`; `AffineGerbeFactorization.factorIso`;
`AffineGerbeFactorization.sourceMap`; `AffineGerbeFactorization.targetMap`;
`AffineKernelRigidification.factor`; `AffineKernelRigidification.homSheaf`;
`AffineKernelRigidification.neutral`; `Approximation.HasArtinApproximation.congruence`;
`Approximation.HasArtinApproximation.equations`;
`Approximation.HasArtinApproximation.finitePresentation`;
`Approximation.HasArtinApproximation.transport`; `AsSmall`; `AsSmall.equiv`;
`BandPreserving.modificationGroupoid`; `BerkovichAnalyticSpace`; `BerkovichAnalyticSpace.affinoid`;
`BerkovichAnalyticSpace.domain`; `BerkovichAnalyticSpace.fibreProduct`;
`BerkovichAnalyticSpace.glueDomains`; `BerkovichAnalyticSpace.refineAtlas`;
`BerkovichAnalyticSpace.rigidModel`; `ChosenModuleDescent.toOverlap`;
`ChosenModuleDescent.toOverlap_map`; `ChosenModuleDescent.toOverlap_transition`;
`ClassifyingGerbe.autIso`; `ClassifyingGerbe.band`; `ClassifyingGerbe.trivial`;
`Comonad.comparison`; `CompletedLocalRing.ext`; `CompletedLocalRing.isAdicComplete`;
`CompletedLocalRing.isNoetherianRing`; `CompletedLocalRing.jet`; `CompletedLocalRing.jet_ofStalk`;
`CompletedLocalRing.ofStalk`; `ComplexAnalyticSpace.closedSubspace`;
`ComplexAnalyticSpace.coherentStructure`; `ComplexAnalyticSpace.fibreProduct`;
`ComplexAnalyticSpace.glue`; `ComplexAnalyticSpace.openSubspace`; `DefGroupoid.changeOfField`;
`DefGroupoid.fibre`; `DefGroupoid.isDeformation_of_RS`; `DescentData`;
`FamilyVersalAt.completion_iff`; `FamilyVersalAt.finiteResidueExtension`;
`FamilyVersalAt.smallExtension_iff`; `FiniteAbelianQuotientPresentation.toFinite`;
`FiniteEtaleGerbe.autFiniteEtale`; `FiniteEtaleGerbe.baseChange`; `FiniteEtaleGerbe.presentation`;
`FiniteQuotientPresentation.equivalence`; `FiniteQuotientPresentation.genericFree`;
`FormalObject.IsEffective`; `FormalObject.IsVersal`; `FormalObject.evaluation`;
`FormalObject.hom_ext`; `FormalObject.isomorphism_iff`; `FormalObject.restrict`;
`FramedDeformation.arrow_criterion`; `FramedDeformation.reframe_frame`;
`FramedDeformation.reframe_object`; `Gerbe.changeBand`; `Gerbe.changeBand_comp`;
`Gerbe.changeBand_lift`; `Gerbe.class`; `Gerbe.class_changeNeutralization`;
`Gerbe.class_equivalence`; `Gerbe.isomTorsor`; `Gerbe.isomTorsor_action`;
`Gerbe.isomTorsor_pullback`; `Gerbe.ofH2`; `Gerbe.ofH2_equiv`; `Gerbe.ofH2_zero`;
`GerbeLimitFamily.evaluation_map`; `GerbeSampleAPI.classifyingNeutral`;
`GerbeSampleAPI.compatibleLimit`; `GerbeSampleAPI.derivedClassification`;
`GerbeSampleAPI.localNotNeutral`; `GerbeSampleAPI.neutralSelfEquivalences`;
`GerbeSampleAPI.profiniteNotFinitePresentation`; `GerbeSampleAPI.pullbackClass`;
`GerbeSampleAPI.rootClass`; `GerbeSelfEquivalence.torsor`; `GerbeSelfEquivalence.torsor_local`;
`GerbeSelfEquivalence.torsor_map`; `GerbeTransgression.component`;
`GerbeTransgression.conjugation`; `GerbeTransgression.pullback`; `GradedValuationSpace.basicOpen`;
`GradedValuationSpace.finiteExtensionMap`; `GradedValuationSpace.generalizationLift`;
`GradedValuationSpace.orbitFibre`; `GradedValuationSpace.patchTopology`; `HasSheafify`;
`HilbertFunctor.degree`; `HilbertFunctor.ofQuot`; `HilbertFunctor.pullback`;
`HilbertFunctor.toQuot`; `HolomorphicStructureSheaf.coordinate`;
`HolomorphicStructureSheaf.localRing`; `HolomorphicStructureSheaf.restrict`;
`HolomorphicStructureSheaf.stalkIso`; `HomIsom.dualNumberPoint.augmentation`;
`HomIsom.dualNumberPoint.closed`; `HomIsom.dualNumberPoint.nonflat`; `HomogenizationTests.cusp`;
`HomogenizationTests.markOne`; `HomogenizationTests.transverseDirections`;
`InfinitesimalStabilizer.faithful`; `InfinitesimalStabilizer.framedAut`;
`InfinitesimalStabilizer.mem_iff`; `IntrinsicBand.autIso`; `IntrinsicBand.pullback`;
`IntrinsicBand.unique`; `IsCMRegular.multiplication`; `IsCMRegular.vanish`; `IsEffective.all_iff`;
`IsEffective.iso_iff`; `IsEffective.ofRestriction`; `IsRelativeGerbe.isom_epi`;
`IsRelativeGerbe.localLift`; `IsRelativeGerbe.rectification_iff`; `LevelStructure.IsRigid`;
`LevelStructure.autAction`; `LevelStructure.torsor`; `LiftingGerbe.autIso`;
`LiftingGerbe.neutral_iff`; `LiftingGerbe.obj`; `LiftingGerbe.pullback`; `LineBundleClass`;
`LocallyFull.autFaithfullyFlat`; `LocallyFull.baseChange`; `LocallyFull.classifying_iff`;
`MarkedIdeal.homogenize`; `ModuleCat.extendRestrictScalarsAdj`; `ModuleCoaction.reverseTransition`;
`ModuleCoaction.reverseTransition_tmul`; `ModuleCoaction.toOverlap`;
`ModuleCoaction.toOverlap_module`; `ModuleCoaction.toOverlap_transition`;
`ModuleCoaction.transition`; `ModuleCoaction.transition_tmul`; `ModuleDescentCoalgebra.canonical`;
`ModuleDescentCoalgebra.coaction`; `ModuleDescentCoalgebra.equivalence`;
`ModuleObstructionTheory.baseChange`; `ModuleObstructionTheory.lifting_torsor`;
`ModuleObstructionTheory.mk`; `ModuleObstructionTheory.obstruction`;
`ModuleObstructionTheory.pushout`; `ModuleObstructionTheory.split`;
`ModuleObstructionTheory.zero_iff_lift`; `ModuleOverlapCanonical.forget`;
`ModuleOverlapCanonical.map`; `ModuleOverlapDatum.canonical`; `ModuleOverlapDatum.cocycle`;
`ModuleOverlapDatum.hom_ext`; `ModuleOverlapDatum.module`; `ModuleOverlapDatum.toChosen`;
`ModuleOverlapDatum.toChosen_hom`; `ModuleOverlapDatum.toChosen_map`;
`ModuleOverlapDatum.toCoalgebra`; `ModuleOverlapDatum.toCoalgebra_coaction`;
`ModuleOverlapDatum.toCoalgebra_module`; `ModuleOverlapDatum.transition`;
`OverlapPullbackCoordinates.left`; `OverlapPullbackCoordinates.map`;
`OverlapPullbackCoordinates.right`; `ParameterFormalExports.classify`;
`ParameterFormalExports.classify_natural`; `ParameterFormalExports.universal`;
`PicardStackSpaces.automorphism`; `PicardStackSpaces.descent`; `PicardStackSpaces.dual`;
`PicardStackSpaces.hom_equiv`; `PicardStackSpaces.ofLineBundle`; `PicardStackSpaces.pullback`;
`PicardStackSpaces.tensor`; `PicardStackSpaces.unit`; `PicardZeroSheaf.baseChange`;
`PicardZeroSheaf.ext`; `PicardZeroSheaf.fibre`; `PicardZeroSheaf.group`;
`PicardZeroSheaf.inclusion`; `PicardZeroSheaf.mem_iff`; `PicardZeroSheaf.mk`;
`ProfiniteEtaleGerbe.cofinal`; `ProfiniteEtaleGerbe.objectEquiv`; `ProfiniteEtaleGerbe.projection`;
`ProfiniteIntegersGerbe.aut`; `ProfiniteIntegersGerbe.finiteProjection`;
`ProfiniteIntegersGerbe.trivial`; `ProjectiveParameterSpaces.hilbertFunction.binaryDegree`;
`ProjectiveParameterSpaces.hilbertFunction.constant`;
`ProjectiveParameterSpaces.hilbertFunction.zero`; `Pseudofunctor`; `QCohPseudofunctor.affine`;
`QCohPseudofunctor.map`; `QCohPseudofunctor.map_forget`; `R09_1.coefficientFrobeniusCutoff.add`;
`R09_1.coefficientFrobeniusCutoff.monomial`; `R09_1.coefficientFrobeniusCutoff.smul`;
`R09_1.coefficientFrobeniusCutoff.zero`; `RaynaudNStar.functions`; `RaynaudNStar.genericNormal`;
`RaynaudNStar.mk`; `RaynaudNStar.noEmbedded`; `RaynaudNStar.ofIso`;
`RelativePicard.baseLineBundle`; `RelativePicard.ofLineBundle`; `RelativePicard.pullback`;
`RelativePicard.quotientSheaf`; `RelativePicard.relativePicardPresheaf.map`;
`RelativePicard.relativePicardPresheaf.map_comp`; `RelativePicard.relativePicardPresheaf.map_id`;
`Resolution.derivativeIdeal.contains`; `Resolution.derivativeIdeal.monomial`;
`Resolution.derivativeIdeal.unit`; `Resolution.derivativeIdeal.zero`;
`Resolution.idealOrderAt.cosupport`; `Resolution.idealOrderAt.unit`;
`Resolution.idealOrderAt.zero`; `RigidifiedPicard.hom`; `RigidifiedPicard.hom_ext`;
`RigidifiedPicard.lineBundle`; `RigidifiedPicard.mk`; `RigidifiedPicard.pullback`;
`RigidifiedPicard.trivial`; `RigidifiedPicard.trivialization`; `RootGerbe.band`; `RootGerbe.obj`;
`RootGerbe.pullback`; `SpaceAnalytification.chart`; `SpaceAnalytification.map`;
`SpaceAnalytification.map_comp`; `SpaceAnalytification.map_id`; `SpaceAnalytification.quotient`;
`SpaceAnalytification.scheme`; `SpaceInvertibleModule.chartDescent`;
`SpaceInvertibleModule.dualEvaluation`; `SpaceInvertibleModule.pullbackComp`;
`SpaceInvertibleModule.pullbackId`; `SpaceInvertibleModule.tensorPullback`; `SpaceQCoh.chart`;
`SpaceQCoh.schemeEquivalence`; `SpaceQCoh.transition`;
`TauCeti.ArithmeticModuli.DMNormalization.map`;
`TauCeti.ArithmeticModuli.DMNormalization.mapOfGeneric`;
`TauCeti.ArithmeticModuli.DMNormalization.normalIso`;
`TauCeti.ArithmeticModuli.DMNormalization.schemeComparison`;
`TauCeti.ArithmeticModuli.DMNormalization.smoothChart`;
`TauCeti.ArithmeticModuli.DMSchematicClosure.factor`;
`TauCeti.ArithmeticModuli.DMSchematicClosure.flatBaseChange`;
`TauCeti.ArithmeticModuli.DMSchematicClosure.minimal`;
`TauCeti.ArithmeticModuli.DMSchematicClosure.schemeComparison`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.Iso`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.apex`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.baseChange`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.compose`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.groupoid`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.identity`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.jointFinite`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.transpose`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.bottom`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.conjugation`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.ext`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.local_mem`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.restrict_mem`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.subgroup`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.top`;
`TauCeti.ArithmeticModuli.Rigidification.homSheaf`;
`TauCeti.ArithmeticModuli.Rigidification.isStack`;
`TauCeti.ArithmeticModuli.Rigidification.locallyObjects`;
`TauCeti.ArithmeticModuli.Rigidification.map`;
`TauCeti.ArithmeticModuli.Rigidification.quotientHom`; `TorsorTwist.mapTorsor`;
`TorsorTwist.quotient`; `TorsorTwist.trivial`; `TwistedInertia.fibre`;
`TwistedInertia.finiteStage`; `TwistedInertia.project`; `ULiftHom`; `affineGerbeFactor.baseChange`;
`affineGerbeFactor.faithful`; `affineGerbeFactor.locallyFull`; `affineGerbeFactor.universal`;
`affineNormalQuotient.baseChange`; `affineNormalQuotient.doubleQuotient`;
`affineNormalQuotient.faithfullyFlat`; `affineNormalQuotient.fpqcSheaf`;
`affineNormalQuotient.homEquiv`; `affineNormalQuotient.kernel`;
`algebraicMultiplierIdeal.localVanishing`; `algebraicMultiplierIdeal.monotone`;
`algebraicMultiplierIdeal.ofPrincipal`; `algebraicMultiplierIdeal.ofUnit`;
`algebraicMultiplierIdeal.resolutionIndependent`; `analyticGermReduction.domainEquiv`;
`analyticGermReduction.goodIffAffine`; `analyticGermReduction.inter`;
`analyticGermReduction.pullback`; `analyticGermReduction.separated`; `analyticGermReduction.union`;
`cartierSeparation_difference`; `cartierSeparation_disjoint`; `cartierSeparation_residual`;
`changeBand.band`; `changeBand.compose`; `changeBand.isGerbe`; `changeBand.map`;
`changeBand.mapModification`; `changeBand.slice`; `changeBand.unit`; `chowParameters.cycle`;
`chowParameters.cycle_fromCycle`; `chowParameters.fromCycle`; `chowParameters.support`;
`coefficientPresentation_commonMark`; `coefficientPresentation_cosupport`;
`coefficientPresentation_transform`; `coherentGrassmann.affinePoints`;
`coherentGrassmann.baseChange`; `coherentGrassmann.fromQuotient`; `coherentGrassmann.rankOne`;
`coherentGrassmann.universalQuotientSheaf`;
`completedAnalyticStalkComparison.coherentPullbackExact`;
`completedAnalyticStalkComparison.completionIso`; `completedAnalyticStalkComparison.flat`;
`completedAnalyticStalkComparison.localHom`; `complexSchemeAnalytification.closedSubspace`;
`complexSchemeAnalytification.etaleLocalIso`; `complexSchemeAnalytification.fibreProduct`;
`complexSchemeAnalytification.homEquiv`; `complexSchemeAnalytification.map`;
`complexSchemeAnalytification.mapComp`; `complexSchemeAnalytification.mapId`;
`complexSchemeAnalytification.openSubspace`; `complexSpaceAnalytification.atlasIndependence`;
`complexSpaceAnalytification.chart`; `complexSpaceAnalytification.etaleLocalIso`;
`complexSpaceAnalytification.fibreProduct`; `complexSpaceAnalytification.map`;
`complexSpaceAnalytification.mapComp`; `complexSpaceAnalytification.mapId`;
`complexSpaceAnalytification.separatedHausdorff`; `controlledTransform_factor`;
`controlledTransform_flatBaseChange`; `controlledTransform_identityCartier`;
`exceptionalBirthBlocks.disjoint`; `exceptionalBirthBlocks.firstBlock`;
`exceptionalBirthBlocks.nextBlock`; `exceptionalBirthBlocks.resetAtDrop`;
`exceptionalBirthBlocks.samePrefixLocality`; `exceptionalBirthBlocks.survivingTransform`;
`exceptionalHistory_birth`; `exceptionalHistory_disjoint`; `exceptionalHistory_stratum`;
`exceptionalOrder_divisibility`; `finiteFreeAnalyticQuotient.domain`;
`finiteFreeAnalyticQuotient.finiteEtale`; `finiteFreeAnalyticQuotient.good`;
`finiteFreeAnalyticQuotient.projection`; `finiteFreeAnalyticQuotient.relationIso`;
`finiteFreeAnalyticQuotient.strict`; `flagBundle.affinePoints`; `flagBundle.baseChange`;
`flagBundle.projection`; `flagBundle.toGrassmann`; `flagParameter_formalEquiv`;
`frobeniusStableLocus.equation`; `frobeniusStableLocus.graphEquation`;
`frobeniusStableLocus.inclusion`; `frobeniusStableLocus.isClosedImmersion`;
`frobeniusStableLocus.maximal`; `grassmannParameter_formalEquiv`; `hilbertParameter_formalEquiv`;
`hilbertPolynomial.add`; `hilbertPolynomial.eval_euler`; `hilbertPolynomial.twist`;
`hilbertSamuel_completion`; `hilbertSamuel_diagram`; `hilbertSamuel_order`;
`homParameter_formalEquiv`; `homogenize_equiv`; `homogenize_etaleGluing`;
`homogenize_tangentTransport`; `idealOrder_eq_iInf`; `idealOrder_span`;
`incidenceLocus.baseChange`; `incidenceLocus.fieldPoints`; `incidenceLocus.inclusion`;
`incidenceLocus.isClosedImmersion`; `incidenceLocus.projection`; `initialDiagram_monomial`;
`initialDiagram_upward`; `initialDiagram_vertices`; `invariantWord_compare`;
`invariantWord_prefix`; `invariantWord_terminal`; `isomParameter_formalEquiv`;
`logDeRhamComplex.d`; `logDeRhamComplex.d_sq`; `logDeRhamComplex.degree`;
`logDeRhamComplex.etalePullback`; `logDeRhamComplex.residue`; `markedIdeal_cosupport`;
`markedIdeal_rescale`; `maximumCentre_closed`; `maximumCentre_local`; `maximumCentre_localIso`;
`monomialCentre_minimal`; `monomialMass_denominator`; `monomialWeight_transform`;
`nonarchEtaleQuotient.descent`; `nonarchEtaleQuotient.good`; `nonarchEtaleQuotient.projection`;
`nonarchEtaleQuotient.relationIso`; `nonarchEtaleQuotient.separated`;
`nonarchEtaleQuotient.strict`; `normalizedOrder_commonMark`; `permissibleCentre_boundaryContained`;
`permissibleCentre_idealPower`; `permissibleCentre_snc_after`; `picardParameter_formalEquiv`;
`pluckerEmbedding.chartCoordinates`; `pluckerEmbedding.isClosedImmersion`; `pluckerEmbedding.over`;
`pluckerEmbedding.pullback_twist`; `presentationEquivalent_equivalence`;
`presentationEquivalent_strength`; `presentationEquivalent_transform`;
`projectiveParameter_formalEquiv`; `quotParameter_formalEquiv`; `rankLocus.baseChange`;
`rankLocus.factor_iff`; `rankLocus.minor_mem`; `residualOrder_nonnegative`;
`residualPresentation_normalized`; `residualPresentation_sstar`; `residualPresentation_stratum`;
`resolutionInvariant_equivalent`; `resolutionInvariant_first`; `resolutionInvariant_hypersurface`;
`resolvedLocus_open`; `resolvedLocus_restrict`; `resolvedLocus_subsetCriterion`;
`samuelCertificate_finiteCheck`; `samuelCertificate_generates`; `samuelCertificate_hilbert`;
`samuelJetIdeal_generatorIndependent`; `samuelJetIdeal_monotone`; `samuelJetIdeal_vanishing`;
`semicoherentPresentation_restrict`; `semicoherentPresentation_stratum`;
`semicoherentPresentation_transform`; `sncBoundary_coordinate`; `sncBoundary_empty`;
`sncBoundary_restrict`; `sncCompactification_boundary`; `sncCompactification_open`;
`sncCompactification_projective`; `sncPolydiscChart.boundary`; `sncPolydiscChart.complement`;
`sncPolydiscChart.etalePullback`; `sncPolydiscChart.permuteLabels`; `sncPolydiscChart.restrict`;
`spaceDQCoh.chartRestriction`; `spaceDQCoh.cohomologyComparison`; `spaceDQCoh.derivedPullback`;
`spaceDQCoh.derivedPushforward`; `spaceDQCoh.schemeEtaleEquivalence`; `spaceDQCoh.tensor`;
`spacePerfect.chartCharacterisation`; `spacePerfect.dual`; `spacePerfect.isLocal`;
`spacePerfect.pullback`; `spacePerfect.tensor`; `spacePerfect.torAmplitude`; `stalkIdeal_affine`;
`universeLift_preservesInjective`; `universeNormalizedGerbe.band`;
`universeNormalizedGerbe.cohomologyComparison`; `universeNormalizedGerbe.counit`;
`universeNormalizedGerbe.down`; `universeNormalizedGerbe.restriction`;
`universeNormalizedGerbe.torsorComparison`; `universeNormalizedGerbe.unit`;
`universeNormalizedGerbe.up`; `weightedPresentation_commonMark`

Checks:
`AffineKernelChecks.infinite`; `AffineKernelChecks.nonnormal`; `AffineKernelChecks.square`;
`AffineKernelChecks.trivial`; `AnalyticSpaceChecks.affine`; `AnalyticSpaceChecks.branch`;
`AnalyticSpaceChecks.doubledOrigin`; `AnalyticSpaceChecks.twoCharts`;
`AnalytificationTests.dualNumbers`; `AnalytificationTests.point`;
`AnalytificationTests.presentation`; `ApproximationTests.nonhenselian`; `ArtinChartChecks.framing`;
`ArtinChartChecks.nodePoint`; `ArtinChartChecks.paddedChart`; `ArtinChartChecks.pointHull`;
`BandComparisonTests.identity`; `BandComparisonTests.trivial`; `BandMorphismTests.inversion`;
`BandMorphismTests.modifications`; `BandRestrictionTests.chain`;
`BandRestrictionTests.independentFamilies`; `BandSheafTests.BC3`; `BandSheafTests.noTerminal`;
`BandSheafTests.rootNonneutral`; `BerkovichChecks.dual`; `BerkovichChecks.gauss`;
`BerkovichChecks.point`; `BerkovichChecks.refinement`; `BooleanChecks.parallel`;
`CanonicalFactorTests.identity`; `CanonicalFactorTests.kernel`; `CanonicalFactorTests.notTarget`;
`CanonicalOverlapTests.identity`; `CanonicalOverlapTests.nonfaithful`;
`CanonicalOverlapTests.scalarFactors`; `ChangeBandTests.BA`; `ChangeBandTests.identity`;
`ChangeBandTests.zero`; `ChosenOverlapTests.canonical`; `ChosenOverlapTests.noninvertible`;
`ChosenOverlapTests.zero`; `ChowTests.hyperplanes`; `ChowTests.multiplicity`;
`ChowTests.zeroDegree`; `ClassificationChecks.rootDegree`; `ClassificationChecks.zeroBand`;
`ClassifyingGerbeTests.inertia`; `ClassifyingGerbeTests.point`; `ClassifyingGerbeTests.zero`;
`CoactionTransitionTests.canonical`; `CoactionTransitionTests.decomposition`;
`CoactionTransitionTests.zeroModule`; `CoalgebraOverlapTests.factors`;
`CoalgebraOverlapTests.nonflat`; `CoalgebraOverlapTests.zero`;
`CoherentGrassmannTests.affinePoints`; `CoherentGrassmannTests.rankOne`;
`CoherentGrassmannTests.rankZero`; `CoherentGrassmannTests.zeroPositive`;
`CompletedAnalyticStalkChecks.dual`; `CompletedAnalyticStalkChecks.etale`;
`CompletedAnalyticStalkChecks.line`; `CompletedAnalyticStalkChecks.node`;
`CompletionTests.localResidue`; `CompletionTests.multiplication`; `CompletionTests.residueJet`;
`ComplexGagaChecks.extension`; `ComplexGagaChecks.nonproper`; `ComplexGagaChecks.point`;
`ComplexGagaChecks.projectiveLine`; `ComplexModelChecks.doubleOrigin`; `ComplexModelChecks.dual`;
`ComplexModelChecks.node`; `ComplexModelChecks.unit`; `DenominatorChecks.cusp`;
`DenominatorChecks.unitMark`; `EffectiveTests.empty`; `EffectiveTests.identity`;
`EffectiveTests.notFullyFaithful`; `FiniteAnalyticQuotientChecks.identity`;
`FiniteAnalyticQuotientChecks.notFree`; `FiniteAnalyticQuotientChecks.permutedCopies`;
`FiniteAnalyticQuotientChecks.residueTwo`; `FiniteGerbeTests.constant`; `FiniteGerbeTests.muP`;
`FiniteGerbeTests.trivial`; `FiniteQuotientTests.sign`; `FiniteQuotientTests.trivial`;
`FiniteQuotientTests.trivialAction`; `FlagTests.empty`; `FlagTests.nested`; `FlagTests.single`;
`FormalTests.automorphisms`; `FormalTests.compatibleArrows`; `FormalTests.point`;
`FramedTests.discrete`; `FramedTests.nontrivialFrame`; `FramedTests.residueIdentity`;
`FrobeniusTests.identityChart`; `FrobeniusTests.nonFixedCoefficient`;
`FrobeniusTests.zeroOperator`; `GerbeBandEquivalenceTests.fibre_family_refl`;
`GerbeBandEquivalenceTests.modification_refl`; `GerbeClassTests.BA`; `GerbeClassTests.banding`;
`GerbeClassTests.lift`; `GerbeSampleTests.classifyingNeutral`; `GerbeSampleTests.compatibleLimit`;
`GerbeSampleTests.derivedClassification`; `GerbeSampleTests.neutralSelfEquivalences`;
`GerbeSampleTests.profiniteNotFinitePresentation`; `GerbeSampleTests.pullbackClass`;
`GerbeSampleTests.rootClass`; `GerbeTests.classifying`; `GerbeTests.rootNotNeutral`;
`GermReductionChecks.affinoid`; `GermReductionChecks.laurent`; `GermReductionChecks.refine`;
`GradedValuationChecks.orbit`; `GradedValuationChecks.support`; `GradedValuationChecks.trivial`;
`H2RepresentativeTests.changeTorsor`; `H2RepresentativeTests.nonzero`;
`H2RepresentativeTests.zero`; `HilbertPolynomialTests.projectiveLine`;
`HilbertPolynomialTests.projectivePoint`; `HilbertPolynomialTests.zero`; `HistoryChecks.empty`;
`HistoryChecks.reset`; `HolomorphicSheafChecks.exponential`; `HolomorphicSheafChecks.local`;
`HolomorphicSheafChecks.point`; `IncidenceTests.impossible`; `IncidenceTests.lines`;
`IncidenceTests.zeroBound`; `IntrinsicBandChecks.disconnectedFailure`;
`IntrinsicBandChecks.nonconstantSlice`; `IntrinsicBandChecks.nonneutral`;
`IntrinsicBandChecks.restrictionChain`; `IntrinsicBandTests.BA`; `IntrinsicBandTests.trivial`;
`IntrinsicBandTests.unfixed`; `IsomTorsorTests.composition`; `IsomTorsorTests.emptySections`;
`IsomTorsorTests.self`; `KernelRigidificationTests.allKernel`;
`KernelRigidificationTests.notOrbitSet`; `KernelRigidificationTests.zeroKernel`;
`LiftingGerbeTests.surjectiveSheaf`; `LiftingGerbeTests.trivial`; `LiftingGerbeTests.zeroKernel`;
`LimitChecks.singleton`; `LimitChecks.twoCoordinates`; `LimitFamilyTests.classesInsufficient`;
`LimitFamilyTests.identityTower`; `LimitFamilyTests.singleton`; `LocallyFullTests.identity`;
`LocallyFullTests.square`; `LocallyFullTests.subgroup`; `LogDeRhamChecks.compact`;
`LogDeRhamChecks.empty`; `LogDeRhamChecks.one`; `ModuleCoalgebraTests.cocycle`;
`ModuleCoalgebraTests.identity`; `ModuleCoalgebraTests.product`; `ModuleOverlapTests.identity`;
`ModuleOverlapTests.infiniteFree`; `ModuleOverlapTests.noninvertibleMap`;
`ModuleOverlapTests.scalarTwo`; `MultiplierIdealChecks.crossing`;
`MultiplierIdealChecks.nonExample`; `MultiplierIdealChecks.principal`;
`MultiplierIdealChecks.unit`; `NeutralizationTests.BA`; `NeutralizationTests.root`;
`NonarchRelationChecks.closed`; `NonarchRelationChecks.identity`;
`NonarchRelationChecks.twoCopies`; `ObstructionTests.curveLineBundle`;
`ObstructionTests.doublePoint`; `ObstructionTests.split`; `ObstructionTests.zeroKernel`;
`OverlapChosenTests.identity`; `OverlapChosenTests.nonflat`; `OverlapChosenTests.zeroMap`;
`OverlapCoactionTests.canonical`; `OverlapCoactionTests.identity`;
`OverlapCoactionTests.noFlatness`; `OverlapPullbackTests.factors`; `OverlapPullbackTests.identity`;
`OverlapPullbackTests.zeroRing`; `ParameterTests.grassmannEndpoints`;
`ParameterTests.hilbertNonflatBase`; `ParameterTests.identityRepresentation`;
`ParameterTests.isomUnit`; `ParameterTests.picardAutomorphisms`; `ParameterTests.pullback`;
`ParameterTests.quotLengthOne`; `ParameterTests.universalElement`; `PicardSheafTests.baseChange`;
`PicardSheafTests.identity`; `PicardSheafTests.needSheafification`; `PicardStackTests.baseChange`;
`PicardStackTests.disjointPoints`; `PicardStackTests.point`; `PicardZeroChecks.elliptic`;
`PicardZeroChecks.fullStructure`; `PicardZeroChecks.nonreducedBase`; `PicardZeroChecks.point`;
`PicardZeroTests.curve`; `PicardZeroTests.nonreduced`; `PicardZeroTests.projectiveLine`;
`PluckerTests.rankOne`; `PluckerTests.rankZero`; `PluckerTests.twoPlanesFourSpace`;
`ProfiniteGerbeTests.finite`; `ProfiniteGerbeTests.identity`; `ProfiniteGerbeTests.zHat`;
`QCohPseudoTests.identity`; `RankLocusTests.fullRankBound`; `RankLocusTests.nilpotent`;
`RankLocusTests.oneByOne`; `RaynaudTests.embeddedPoint`; `RaynaudTests.nontrivialConstants`;
`RaynaudTests.regularPoint`; `RegularityTests.lineBundle`; `RegularityTests.structureSheaf`;
`RegularityTests.zero`; `RelativeGerbeTests.classifying`; `RelativeGerbeTests.identity`;
`RelativeGerbeTests.subgroup`; `RelativeResolutionChecks.contained`;
`RelativeResolutionChecks.reduced`; `RelativeResolutionChecks.sncVsSmooth`;
`RelativeResolutionChecks.transverse`; `ResidualChecks.zeroInfinity`; `RigidifiedPicardTests.P1`;
`RigidifiedPicardTests.automorphisms`; `RigidifiedPicardTests.identity`;
`RootGerbeTests.noSection`; `RootGerbeTests.one`; `RootGerbeTests.trivialLine`;
`SNCChartChecks.crossing`; `SNCChartChecks.empty`; `SNCChartChecks.one`;
`SNCChartChecks.singularAmbient`; `SNCChartChecks.triangular`;
`SchemeAnalytificationChecks.affineLine`; `SchemeAnalytificationChecks.branch`;
`SchemeAnalytificationChecks.dual`; `SchemeAnalytificationChecks.empty`; `SelectorChecks.empty`;
`SelectorChecks.singleton`; `SelfEquivalenceTorsorTests.identity`;
`SelfEquivalenceTorsorTests.neutral`; `SelfEquivalenceTorsorTests.nonNeutralRoot`;
`SpaceDerivedChecks.degree`; `SpaceDerivedChecks.dualNumberResidue`;
`SpaceDerivedChecks.nonflatPullback`; `SpaceDerivedChecks.zero`; `SpaceExistenceChecks.allLevels`;
`SpaceExistenceChecks.arrows`; `SpaceExistenceChecks.identity`; `SpaceExistenceChecks.support`;
`SpaceLineChecks.cocycle`; `SpaceLineChecks.nilpotents`; `SpaceLineChecks.point`;
`SpaceLineChecks.twoPoints`; `SpaceQCohTests.affine`; `SpaceQCohTests.identity`;
`SpaceQCohTests.infiniteModule`; `StabilizerTests.allKilled`; `StabilizerTests.frameKernel`;
`StabilizerTests.identity`; `SynchronizationChecks.kernel`;
`TauCeti.AlgebraicGeometry.ModuliDescent.relativeHom_empty`;
`TauCeti.AlgebraicGeometry.ModuliDescent.relativeHom_identity`;
`TauCeti.AlgebraicGeometry.ModuliDescent.relativeHom_split_two`;
`TauCeti.AlgebraicGeometry.ModuliDescent.weilRestriction_empty`;
`TauCeti.AlgebraicGeometry.ModuliDescent.weilRestriction_identity`;
`TauCeti.AlgebraicGeometry.ModuliDescent.weilRestriction_split_two`;
`TauCeti.AlgebraicGeometry.ModuliDescent.weilRestriction_terminal`;
`TauCeti.ArithmeticModuli.DMNormalization.test_nilpotents`;
`TauCeti.ArithmeticModuli.DMNormalization.test_node`;
`TauCeti.ArithmeticModuli.DMNormalization.test_normal_stack`;
`TauCeti.ArithmeticModuli.DMNormalization.test_scheme_comparison`;
`TauCeti.ArithmeticModuli.DMSchematicClosure.test_closed_point`;
`TauCeti.ArithmeticModuli.DMSchematicClosure.test_nilpotents`;
`TauCeti.ArithmeticModuli.DMSchematicClosure.test_nonflat`;
`TauCeti.ArithmeticModuli.DMSchematicClosure.test_scheme_comparison`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.test_double_point`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.test_empty`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.test_identity`;
`TauCeti.ArithmeticModuli.FiniteCorrespondence.test_two_legs`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.test_base_change`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.test_bottom`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.test_noncentral`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.test_not_closed_identity`;
`TauCeti.ArithmeticModuli.NormalInertiaSubgroup.test_not_normal`;
`TauCeti.ArithmeticModuli.Rigidification.test_cyclic_four`;
`TauCeti.ArithmeticModuli.Rigidification.test_mu_p`;
`TauCeti.ArithmeticModuli.Rigidification.test_sheaf_quotient`;
`TauCeti.ArithmeticModuli.Rigidification.test_trivial`; `TransgressionTests.identity`;
`TransgressionTests.modification`; `TransgressionTests.trivialEquivariance`; `TwistTests.arrows`;
`TwistTests.freeTorsor`; `TwistTests.trivial`; `TwistedInertiaTests.pGroup`;
`TwistedInertiaTests.space`; `TwistedInertiaTests.zeroHom`; `VersalTests.closedPoint`;
`VersalTests.excessParameter`; `VersalTests.identity`; `ZHatGerbeTests.compatibleArrows`;
`ZHatGerbeTests.finiteLevel`; `ZHatGerbeTests.notFinitePresentation`;
`cartier_identity_not_trivial`; `centre_contained_in_boundary`; `centre_outside_cosupport`;
`centre_tangent_to_boundary`; `certificate_coordinate_ideal`;
`certificate_division_not_initialDiagram`; `certificate_pure_power`; `certificate_wrong_order`;
`compactify_affine_line`; `compactify_preserves_smooth_open`; `compactify_two_torus`;
`contact_pure_power`; `cusp_coefficient_weights`; `cusp_controlled_chart`; `diagram_xy`;
`diagram_zero_and_unit`; `different_from_strict`; `empty_presentation_infinite`;
`exceptional_is_not_point_order`; `exceptional_pullback_not_division`;
`formal_only_is_insufficient`; `graded_lex_not_pure_lex`; `hilbertSamuel_double_point`;
`hilbertSamuel_nonrational_point`; `hilbertSamuel_smooth`; `history_changes_centre`;
`history_new_exceptional`; `history_year_zero`; `invariant_bm_example`; `invariant_cusp`;
`invariant_smooth_empty_boundary`; `jet_double_origin`; `jet_unit_ideal`; `jet_zero_ideal`;
`mark_changes_cosupport`; `marked_zero_and_unit`; `maximum_empty_unresolved`;
`maximum_incomparable_union`; `maximum_is_not_multiplicity`; `mixed_coefficient_weights`;
`monomial_nonminimal`; `monomial_residual_zero`; `monomial_single_axis`; `monomial_two_axes`;
`order_two_generators`; `order_unit_ideal`; `order_zero_ideal`; `rescaling_test_equivalence`;
`residual_monomial_terminal`; `residual_no_guard_above_one`; `residual_requires_guard`;
`resolved_empty_boundary`; `resolved_tangency`; `resolved_transverse_axes`;
`same_initial_cosupport_fails`; `semicoherent_common_open`; `semicoherent_hypersurface`;
`separate_coordinate_axes`; `separate_equal_divisors`; `separate_unequal_multiplicities`;
`snc_coordinate_axes`; `snc_self_intersection`; `snc_tangent_curves`; `weighted_common_mark`;
`word_history_tie`; `word_multiplicity_tie`; `word_terminal_zero_infinity`
-/
