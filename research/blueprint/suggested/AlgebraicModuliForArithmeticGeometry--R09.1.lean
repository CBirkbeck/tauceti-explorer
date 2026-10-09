/-
This file is not the roadmap and is not exhaustive. The accompanying roadmap document is
definitive. These proposed Lean forms help contributors and reviewers converge on names and
signatures. Every admitted construction and proof is a planning target, not an implementation.

Supplier policy: ModularCurves 0G supplies finite locally free Grassmann schemes; StableReduction
Layer 2 supplies relative Proj, projective morphisms, ampleness, coherent cohomology and its base
change; AlgebraicVectorBundles supplies polynomial operations on sheaves. No such supplier
primitive is given a competing mathematical owner here. The application/extension signatures
below refer to these imports; SchemeAndStackFoundations SF.5 also owns the finite locally free
projective bundle, complete flags, absolute very ampleness, bigness and intersection calculus.
Native schemes, module sheaves, invertible sheaves, tensor
products, cohomology and the module Grassmannian are used directly.

Native finite-type, finite-presentation and locally-free sheaf predicates are available at the
pin. Constant rank, relative higher direct images and supplier comparison maps remain limited
as explicitly indicated below. No missing condition is
encoded by an unspecified proposition. The mathematical hypotheses are in the document.
-/

import Mathlib.AlgebraicGeometry.Modules.Tilde
import Mathlib.AlgebraicGeometry.Morphisms.Immersion
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.AlgebraicCycle.Basic
import Mathlib.RingTheory.Grassmannian
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.RingTheory.Polynomial.HilbertPoly
import Mathlib.RingTheory.Length
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.Algebra.Category.ModuleCat.Sheaf.LocallyFree
import TauCeti.AlgebraicGeometry.LineBundle.Basic
import TauCeti.AlgebraicGeometry.Modules.TensorProduct
import TauCeti.AlgebraicGeometry.Cohomology.EulerCharacteristic

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry Scheme.Modules
open TauCeti.AlgebraicGeometry TauCeti.AlgebraicGeometry.Scheme.Modules

open scoped TensorProduct ZeroObject

universe u
noncomputable section
namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.R09_1

/-- Data for the quotient universal property, using the pinned invertible-sheaf carrier.
This is the data of a point of the target, not a second Grassmann functor. -/
structure LineQuotient {S T : Scheme.{u}} (f : T ⟶ S) (E : S.Modules) where
  line : InvertibleSheaf T
  quotient : (Scheme.Modules.pullback f).obj E ⟶ line.obj
  surjective : Epi quotient

/-- Relative Proj of Sym E in the requested arbitrary-quasicoherent extension.
Projectivity and finite-presentation conclusions need the corresponding native sheaf
finiteness predicates and are not asserted by this carrier declaration. -/
def projectiveBundle (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent] : Scheme.{u} := by
  sorry

namespace projectiveBundle
variable (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent]
def projection : projectiveBundle S E ⟶ S := by sorry
def twistingSheaf (m : ℤ) : InvertibleSheaf (projectiveBundle S E) := by sorry
def universalQuotient :
    (Scheme.Modules.pullback (projection S E)).obj E ⟶ (twistingSheaf S E 1).obj := by sorry
theorem universalQuotient_epi : Epi (universalQuotient S E) := by sorry
def fromQuotient {T : Scheme.{u}} (f : T ⟶ S) (q : LineQuotient f E) :
    T ⟶ projectiveBundle S E := by sorry
theorem fromQuotient_over {T : Scheme.{u}} (f : T ⟶ S) (q : LineQuotient f E) :
    fromQuotient S E f q ≫ projection S E = f := by sorry
theorem quotient_characterisation {T : Scheme.{u}} (f : T ⟶ S) (q : LineQuotient f E)
    (g : T ⟶ projectiveBundle S E) (hg : g ≫ projection S E = f)
    (e : (Scheme.Modules.pullback g).obj (twistingSheaf S E 1).obj ≅ q.line.obj)
    (he : (Scheme.Modules.pullbackComp g (projection S E)).inv.app E ≫
      (Scheme.Modules.pullback g).map (universalQuotient S E) ≫ e.hom =
      (Scheme.Modules.pullbackCongr hg).hom.app E ≫ q.quotient) :
    g = fromQuotient S E f q := by sorry
def baseChange (T : Scheme.{u}) (f : T ⟶ S)
    [((Scheme.Modules.pullback f).obj E).IsQuasicoherent] :
    projectiveBundle T ((Scheme.Modules.pullback f).obj E) ≅
      Limits.pullback (projection S E) f := by sorry
def rankOne (L : InvertibleSheaf S) [L.obj.IsQuasicoherent] :
    projectiveBundle S L.obj ≅ S := by sorry
end projectiveBundle

abbrev projectiveSpace (S : Scheme.{u}) (n : ℕ) :=
  projectiveBundle S (SheafOfModules.free (R := S.ringCatSheaf) (ULift.{u} (Fin (n + 1))))

namespace ProjectiveBundleTests
-- ProjectiveBundleTests.rankOne
example (S : Scheme.{u}) (L : InvertibleSheaf S) [L.obj.IsQuasicoherent] :
    Nonempty (projectiveBundle S L.obj ≅ S) := by sorry
-- ProjectiveBundleTests.zero
example (S : Scheme.{u}) :
    Nonempty (projectiveBundle S (SheafOfModules.free (R := S.ringCatSheaf) PEmpty.{u+1}) ≅
      Scheme.empty) := by sorry
-- ProjectiveBundleTests.rankTwo
example (k : Type u) [CommRing k] :
    Nonempty ({g : Spec (.of k) ⟶ projectiveSpace (Spec (.of k)) 1 //
      g ≫ projectiveBundle.projection (Spec (.of k))
        (SheafOfModules.free (R := (Spec (.of k)).ringCatSheaf) (ULift.{u} (Fin 2))) =
          𝟙 (Spec (.of k))} ≃ Module.Grassmannian k (Fin 2 → k) 1) := by sorry
-- ProjectiveBundleTests.baseChange
example {S T : Scheme.{u}} (f : T ⟶ S) (E : S.Modules) [E.IsQuasicoherent]
    [((Scheme.Modules.pullback f).obj E).IsQuasicoherent] :
    Nonempty (projectiveBundle T ((Scheme.Modules.pullback f).obj E) ≅
      Limits.pullback (projectiveBundle.projection S E) f) := by sorry
end ProjectiveBundleTests

namespace projectiveBundle.twistingSheaf
variable (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent]
def zero : (projectiveBundle.twistingSheaf S E 0).obj ≅
    SheafOfModules.unit (projectiveBundle S E).ringCatSheaf := by sorry
def add (a b : ℤ) :
    Scheme.Modules.tensorProduct (projectiveBundle S E) (projectiveBundle.twistingSheaf S E a).obj
      (projectiveBundle.twistingSheaf S E b).obj ≅
      (projectiveBundle.twistingSheaf S E (a + b)).obj := by sorry
def pullback {T : Scheme.{u}} (f : T ⟶ S) [((Scheme.Modules.pullback f).obj E).IsQuasicoherent]
    (m : ℤ) :
    (Scheme.Modules.pullback (projectiveBundle.baseChange S E T f).hom).obj
      ((Scheme.Modules.pullback (Limits.pullback.fst
        (projectiveBundle.projection S E) f)).obj (projectiveBundle.twistingSheaf S E m).obj) ≅
      (projectiveBundle.twistingSheaf T ((Scheme.Modules.pullback f).obj E) m).obj := by sorry
end projectiveBundle.twistingSheaf

namespace TwistingSheafTests
-- TwistingSheafTests.zero
example (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent] :
    Nonempty ((projectiveBundle.twistingSheaf S E 0).obj ≅
      SheafOfModules.unit (projectiveBundle S E).ringCatSheaf) := by sorry
-- TwistingSheafTests.inverse
example (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent] :
    Nonempty (Scheme.Modules.tensorProduct (projectiveBundle S E) (projectiveBundle.twistingSheaf S E 1).obj
      (projectiveBundle.twistingSheaf S E (-1)).obj ≅
      SheafOfModules.unit (projectiveBundle S E).ringCatSheaf) := by sorry
-- TwistingSheafTests.rankOne
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
theorem zero_left (a b : ℤ) (i j : ℕ)
    (y : Cohomology (projectiveBundle.twistingSheaf S E b).obj j) :
    twistMultiplication S E a b i j 0 y = 0 := by sorry
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
example (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent]
    (y : Cohomology (projectiveBundle.twistingSheaf S E 0).obj 0) :
    twistMultiplication S E 0 0 0 0 0 y = 0 := by sorry
-- TwistMultiplicationTests.unit
example (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent]
    (x : Cohomology (projectiveBundle.twistingSheaf S E 1).obj 0)
    : twistMultiplication S E 1 0 0 0 x (twistMultiplication.unit S E) = x := by sorry
-- TwistMultiplicationTests.topBoundary
example (k : Type u) [Field k]
    (x : Cohomology (projectiveBundle.twistingSheaf (Spec (.of k))
      (SheafOfModules.free (R := (Spec (.of k)).ringCatSheaf) (ULift.{u} (Fin 2))) (-2)).obj 1)
    (y : Cohomology (projectiveBundle.twistingSheaf (Spec (.of k))
      (SheafOfModules.free (R := (Spec (.of k)).ringCatSheaf) (ULift.{u} (Fin 2))) 1).obj 0) :
    twistMultiplication _ _ (-2) 1 1 0 x y = 0 := by sorry
end TwistMultiplicationTests

/-- Quotient Grassmannian carrier. Its finite-type/finitely-presented structure results
require the native finiteness predicates on E. Constant quotient rank is a supplier limitation. -/
def coherentGrassmann (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent] (d : ℕ) :
    Scheme.{u} := by sorry
namespace coherentGrassmann
variable (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent] (d : ℕ)
def projection : coherentGrassmann S E d ⟶ S := by sorry
def universalQuotientSheaf : (coherentGrassmann S E d).Modules := by sorry
def universalQuotient : (Scheme.Modules.pullback (projection S E d)).obj E ⟶
    universalQuotientSheaf S E d := by sorry
theorem universalQuotient_epi : Epi (universalQuotient S E d) := by sorry
def fromQuotient {T : Scheme.{u}} (f : T ⟶ S) (Q : T.Modules)
    (q : (Scheme.Modules.pullback f).obj E ⟶ Q) [Epi q]
    [Q.IsLocallyFree] [Q.IsFinitePresentation] :
    T ⟶ coherentGrassmann S E d := by sorry
-- Constant quotient rank d is omitted; native finite presentation and local freeness are included.
def baseChange {T : Scheme.{u}} (f : T ⟶ S)
    [((Scheme.Modules.pullback f).obj E).IsQuasicoherent] :
    coherentGrassmann T ((Scheme.Modules.pullback f).obj E) d ≅
      Limits.pullback (projection S E d) f := by sorry
def rankOne : coherentGrassmann S E 1 ≅ projectiveBundle S E := by sorry
/-- Affine S-points, with the over-S condition included, match the pinned quotient convention. -/
def affinePoints (R : CommRingCat.{u}) (M : ModuleCat.{u} R) (d : ℕ) :
    {g : Spec R ⟶ coherentGrassmann (Spec R) (tilde M) d //
      g ≫ projection (Spec R) (tilde M) d = 𝟙 (Spec R)} ≃ Module.Grassmannian R M d := by sorry
end coherentGrassmann
namespace CoherentGrassmannTests
-- CoherentGrassmannTests.rankZero
example (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent] :
    Nonempty (coherentGrassmann S E 0 ≅ S) := by sorry
-- CoherentGrassmannTests.zeroPositive
example (S : Scheme.{u}) :
    Nonempty (coherentGrassmann S (SheafOfModules.free (R := S.ringCatSheaf) PEmpty.{u+1}) 1 ≅
      Scheme.empty) := by sorry
-- CoherentGrassmannTests.rankOne
example (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent] :
    Nonempty (coherentGrassmann S E 1 ≅ projectiveBundle S E) := by sorry
-- CoherentGrassmannTests.affinePoints
example (R : CommRingCat.{u}) (M : ModuleCat.{u} R) (d : ℕ) :
    Nonempty ({g : Spec R ⟶ coherentGrassmann (Spec R) (tilde M) d //
      g ≫ coherentGrassmann.projection (Spec R) (tilde M) d = 𝟙 (Spec R)} ≃
        Module.Grassmannian R M d) := by sorry
end CoherentGrassmannTests

/-- `W` is supplied as ∧ᵈ E by AlgebraicVectorBundles L0C; that identification is omitted. -/
def pluckerEmbedding (S : Scheme.{u}) (E W : S.Modules)
    [E.IsQuasicoherent] [W.IsQuasicoherent] (d : ℕ) :
    coherentGrassmann S E d ⟶ projectiveBundle S W := by sorry
namespace pluckerEmbedding
variable (S : Scheme.{u}) (E W : S.Modules) [E.IsQuasicoherent] [W.IsQuasicoherent]
theorem isClosedImmersion (d : ℕ) : IsClosedImmersion (pluckerEmbedding S E W d) := by sorry
def pullback_twist (d : ℕ) (detQ : InvertibleSheaf (coherentGrassmann S E d)) :
    (Scheme.Modules.pullback (pluckerEmbedding S E W d)).obj
      (projectiveBundle.twistingSheaf S W 1).obj ≅ detQ.obj := by sorry
-- `detQ` is the supplier determinant of the universal quotient; its identification is omitted.
theorem over (d : ℕ) : pluckerEmbedding S E W d ≫ projectiveBundle.projection S W =
    coherentGrassmann.projection S E d := by sorry
/-- Ordered minors of a two-row quotient matrix. Identification with the six homogeneous
coordinates of the global Plücker map uses the omitted supplier exterior-power comparison. -/
def chartCoordinates {R : Type u} [CommRing R] (A : Matrix (Fin 2) (Fin 4) R) : Fin 6 → R :=
  ![Matrix.det !![A 0 0, A 0 1; A 1 0, A 1 1],
    Matrix.det !![A 0 0, A 0 2; A 1 0, A 1 2],
    Matrix.det !![A 0 0, A 0 3; A 1 0, A 1 3],
    Matrix.det !![A 0 1, A 0 2; A 1 1, A 1 2],
    Matrix.det !![A 0 1, A 0 3; A 1 1, A 1 3],
    Matrix.det !![A 0 2, A 0 3; A 1 2, A 1 3]]

end pluckerEmbedding
namespace PluckerTests
-- PluckerTests.rankOne
example (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent] :
    pluckerEmbedding S E E 1 = (coherentGrassmann.rankOne S E).hom := by sorry
-- PluckerTests.twoPlanesFourSpace
example (R : Type u) [CommRing R] (a b c d : R) :
    let p := pluckerEmbedding.chartCoordinates !![1, 0, a, b; 0, 1, c, d]
    p = ![1, c, d, -a, -b, a * d - b * c] ∧
      p 0 * p 5 - p 1 * p 4 + p 2 * p 3 = 0 := by sorry
-- PluckerTests.rankZero
example (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent] :
    IsIso (pluckerEmbedding S E (SheafOfModules.unit S.ringCatSheaf) 0) := by sorry
end PluckerTests

/-- Quotient indices `n-aᵢ` correspond to increasing kernel ranks `aᵢ`.
Native local freeness and finite presentation are included. Fixed sheaf rank n is a supplier
limitation; the comparison below includes the native strictly increasing admissible list conditions. -/
def flagBundle (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent] [E.IsLocallyFree] [E.IsFinitePresentation]
    (n : ℕ) (ranks : List ℕ) : Scheme.{u} := by sorry
namespace flagBundle
variable (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent] [E.IsLocallyFree] [E.IsFinitePresentation] (n : ℕ) (ranks : List ℕ)
def projection : flagBundle S E n ranks ⟶ S := by sorry
def toGrassmann (i : Fin ranks.length) : flagBundle S E n ranks ⟶
    coherentGrassmann S E (n - ranks[i]) := by sorry
def baseChange {T : Scheme.{u}} (f : T ⟶ S)
    [((Scheme.Modules.pullback f).obj E).IsQuasicoherent]
    [((Scheme.Modules.pullback f).obj E).IsLocallyFree]
    [((Scheme.Modules.pullback f).obj E).IsFinitePresentation] :
    flagBundle T ((Scheme.Modules.pullback f).obj E) n ranks ≅
      Limits.pullback (projection S E n ranks) f := by sorry
/-- Over the free rank-n affine chart, points are actual nested quotient-kernel data.
The list conditions are native, so they are included in this comparison. -/
def affinePoints (R : CommRingCat.{u}) (n : ℕ) (ranks : List ℕ)
    (hr : ranks.Pairwise (· < ·)) (hb : ∀ a ∈ ranks, a ≤ n)
    [(tilde (R := R) (ModuleCat.of R (Fin n → R))).IsLocallyFree]
    [(tilde (R := R) (ModuleCat.of R (Fin n → R))).IsFinitePresentation] :
    {g : Spec R ⟶ flagBundle (Spec R) (tilde (ModuleCat.of R (Fin n → R))) n ranks //
      g ≫ projection (Spec R) (tilde (ModuleCat.of R (Fin n → R))) n ranks = 𝟙 (Spec R)} ≃
    {Q : ∀ i : Fin ranks.length, Module.Grassmannian R (Fin n → R) (n - ranks[i]) //
      ∀ i j : Fin ranks.length, i < j → (Q i).toSubmodule ≤ (Q j).toSubmodule} := by sorry
end flagBundle
namespace FlagTests
-- FlagTests.empty
example (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent] [E.IsLocallyFree] [E.IsFinitePresentation] (n : ℕ) :
    Nonempty (flagBundle S E n [] ≅ S) := by sorry
-- FlagTests.single
example (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent] [E.IsLocallyFree] [E.IsFinitePresentation] (a n : ℕ) (h : a ≤ n) :
    Nonempty (flagBundle S E n [a] ≅ coherentGrassmann S E (n - a)) := by sorry
-- FlagTests.nested
example (k : Type u) [Field k]
    [(tilde (R := CommRingCat.of k) (ModuleCat.of k (Fin 3 → k))).IsLocallyFree]
    [(tilde (R := CommRingCat.of k) (ModuleCat.of k (Fin 3 → k))).IsFinitePresentation]
    (U : Module.Grassmannian k (Fin 3 → k) 2)
    (V : Module.Grassmannian k (Fin 3 → k) 1) (h : ¬ U.toSubmodule ≤ V.toSubmodule) :
    ¬ ∃ g : {g : Spec (.of k) ⟶
        flagBundle (Spec (.of k)) (tilde (ModuleCat.of k (Fin 3 → k))) 3 [1, 2] //
      g ≫ flagBundle.projection (Spec (.of k))
        (tilde (ModuleCat.of k (Fin 3 → k))) 3 [1, 2] = 𝟙 (Spec (.of k))},
      ((flagBundle.affinePoints (.of k) 3 [1, 2] (by decide) (by decide)) g).val 0 = U ∧
      ((flagBundle.affinePoints (.of k) 3 [1, 2] (by decide) (by decide)) g).val 1 = V := by sorry
end FlagTests

/-- Relative very ampleness with the Stacks immersion convention, using supplied projective bundles.
In finite-presentation applications the coefficient sheaf can be chosen finite type. -/
def IsRelativelyVeryAmple {S X : Scheme.{u}} (f : X ⟶ S) (L : InvertibleSheaf X) : Prop :=
  ∃ (E : S.Modules) (_ : E.IsQuasicoherent) (i : X ⟶ projectiveBundle S E),
    IsImmersion i ∧ i ≫ projectiveBundle.projection S E = f ∧
      Nonempty ((Scheme.Modules.pullback i).obj (projectiveBundle.twistingSheaf S E 1).obj ≅ L.obj)
namespace IsRelativelyVeryAmple
variable {S X : Scheme.{u}} (f : X ⟶ S) (L : InvertibleSheaf X)
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
theorem evaluation_criterion [QuasiCompact f] [QuasiSeparated f]
    [((Scheme.Modules.pushforward f).obj L.obj).IsQuasicoherent]
    [Epi ((Scheme.Modules.pullbackPushforwardAdjunction f).counit.app L.obj)] :
    IsRelativelyVeryAmple f L ↔ IsImmersion (completeMap f L) := by sorry
theorem closed_of_proper [IsProper f] (E : S.Modules) [E.IsQuasicoherent]
    (i : X ⟶ projectiveBundle S E) [IsImmersion i]
    (hi : i ≫ projectiveBundle.projection S E = f) : IsClosedImmersion i := by sorry
end IsRelativelyVeryAmple
namespace VeryAmpleTests
-- VeryAmpleTests.projectiveSpace
example (S : Scheme.{u}) (n : ℕ) :
    IsRelativelyVeryAmple
      (projectiveBundle.projection S (SheafOfModules.free (R := S.ringCatSheaf)
        (ULift.{u} (Fin (n + 1)))))
      (projectiveBundle.twistingSheaf S (SheafOfModules.free (R := S.ringCatSheaf)
        (ULift.{u} (Fin (n + 1)))) 1) := by sorry
-- VeryAmpleTests.veronese
example (k : Type u) [Field k] :
    IsRelativelyVeryAmple (projectiveBundle.projection (Spec (.of k))
      (SheafOfModules.free (R := (Spec (.of k)).ringCatSheaf) (ULift.{u} (Fin 2))))
      (projectiveBundle.twistingSheaf (Spec (.of k))
        (SheafOfModules.free (R := (Spec (.of k)).ringCatSheaf) (ULift.{u} (Fin 2))) 2) := by sorry
-- VeryAmpleTests.trivialNotVeryAmple
example (k : Type u) [Field k] :
    ¬ IsRelativelyVeryAmple (projectiveBundle.projection (Spec (.of k))
      (SheafOfModules.free (R := (Spec (.of k)).ringCatSheaf) (ULift.{u} (Fin 2))))
      (projectiveBundle.twistingSheaf (Spec (.of k))
        (SheafOfModules.free (R := (Spec (.of k)).ringCatSheaf) (ULift.{u} (Fin 2))) 0) := by sorry
end VeryAmpleTests

/-- The Euler-characteristic polynomial, rather than the Hilbert series conversion already
in Mathlib. Coherence, properness and ampleness are omitted supplier hypotheses. -/
def hilbertPolynomial (k : Type u) [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))]
    (L : InvertibleSheaf X) (F : X.Modules) : Polynomial ℚ := by sorry
namespace hilbertPolynomial
variable (k : Type u) [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))]
variable (L : InvertibleSheaf X) (F : X.Modules)
theorem eval_euler [IsProper (X ↘ Spec (.of k))] [F.IsFinitePresentation] (m : ℤ) (Lm : InvertibleSheaf X) (c : ℕ)
    (hf : ∀ i < c, FiniteDimensional k
      (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
        (Scheme.Modules.tensorProduct X F Lm.obj) i))
    (hv : ∀ i, c ≤ i → Subsingleton
      (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
        (Scheme.Modules.tensorProduct X F Lm.obj) i))
    -- Lm = L^m is omitted; finiteness and vanishing are included to avoid junk finrank.
    : (hilbertPolynomial k X L F).eval (m : ℚ) =
      (Scheme.Modules.eulerCharBelow k X (Scheme.Modules.tensorProduct X F Lm.obj) c : ℚ) := by sorry
theorem add [IsProper (X ↘ Spec (.of k))] (Q : ShortComplex X.Modules)
    [Q.X₁.IsFinitePresentation] [Q.X₂.IsFinitePresentation] [Q.X₃.IsFinitePresentation]
    (hQ : Q.ShortExact) :
    hilbertPolynomial k X L Q.X₂ =
      hilbertPolynomial k X L Q.X₁ + hilbertPolynomial k X L Q.X₃ := by sorry
theorem twist [IsProper (X ↘ Spec (.of k))] [F.IsFinitePresentation] (a : ℤ) (La : InvertibleSheaf X)
    -- La = L^a is omitted.
    : hilbertPolynomial k X L (Scheme.Modules.tensorProduct X F La.obj) =
      (hilbertPolynomial k X L F).comp (Polynomial.X + Polynomial.C (a : ℚ)) := by sorry
end hilbertPolynomial
namespace HilbertPolynomialTests
-- HilbertPolynomialTests.zero
example (k : Type u) [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))]
    (L : InvertibleSheaf X) : hilbertPolynomial k X L (0 : X.Modules) = 0 := by sorry
-- HilbertPolynomialTests.projectiveLine
example (k : Type u) [Field k] (a : ℤ)
    [ (projectiveSpace (Spec (.of k)) 1).Over (Spec (.of k)) ]
    (hOver : (projectiveSpace (Spec (.of k)) 1 ↘ Spec (.of k)) =
      projectiveBundle.projection (Spec (.of k))
        (SheafOfModules.free (R := (Spec (.of k)).ringCatSheaf) (ULift.{u} (Fin 2)))) :
    hilbertPolynomial k (projectiveSpace (Spec (.of k)) 1)
      (projectiveBundle.twistingSheaf (Spec (.of k))
        (SheafOfModules.free (R := (Spec (.of k)).ringCatSheaf) (ULift.{u} (Fin 2))) 1)
      (projectiveBundle.twistingSheaf (Spec (.of k))
        (SheafOfModules.free (R := (Spec (.of k)).ringCatSheaf) (ULift.{u} (Fin 2))) a).obj =
        Polynomial.X + Polynomial.C ((a : ℚ) + 1) := by sorry
-- HilbertPolynomialTests.projectivePoint
example (k : Type u) [Field k] [ (Spec (.of k)).Over (Spec (.of k)) ]
    (hOver : (Spec (.of k) ↘ Spec (.of k)) = 𝟙 (Spec (.of k))) :
    hilbertPolynomial k (Spec (.of k)) (InvertibleSheaf.trivial _) (SheafOfModules.unit _) = 1 := by sorry
end HilbertPolynomialTests

/-- Vanishing is stated with the pinned cohomology carrier. Projective-space and the identification of Ftw m with F(m) are omitted supplier conditions. Native finite presentation is included in its API. -/
def IsCMRegular (X : Scheme.{u}) (Ftw : ℤ → X.Modules) (m : ℤ) : Prop :=
  ∀ i : ℕ, 0 < i → Subsingleton
    (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology (Ftw (m - (i : ℤ))) i)
namespace IsCMRegular
variable (X : Scheme.{u}) (Ftw : ℤ → X.Modules)
theorem monotone [∀ r, (Ftw r).IsFinitePresentation] (m r : ℤ) (h : IsCMRegular X Ftw m) (hmr : m ≤ r) :
    IsCMRegular X Ftw r := by sorry
theorem vanish [∀ r, (Ftw r).IsFinitePresentation] (m r : ℤ) (i : ℕ) (h : IsCMRegular X Ftw m) (hi : 0 < i)
    (hr : m - (i : ℤ) ≤ r) :
    Subsingleton (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology (Ftw r) i) := by sorry
theorem multiplication [∀ r, (Ftw r).IsFinitePresentation] (m r : ℤ) (h : IsCMRegular X Ftw m) (hr : m ≤ r)
    (V : Type u) [AddCommGroup V]
    (μ : TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology (Ftw r) 0 ⊗[ℤ] V →+
      TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology (Ftw (r + 1)) 0)
    -- V = H⁰(O(1)); μ is section multiplication, omitted identifications.
    : Function.Surjective μ := by sorry
end IsCMRegular
namespace RegularityTests
-- RegularityTests.structureSheaf
example (k : Type u) [Field k] (n : ℕ) :
    IsCMRegular (projectiveSpace (Spec (.of k)) n)
      (fun m => (projectiveBundle.twistingSheaf (Spec (.of k))
        (SheafOfModules.free (R := (Spec (.of k)).ringCatSheaf)
          (ULift.{u} (Fin (n + 1)))) m).obj) 0 := by sorry
-- RegularityTests.lineBundle
example (k : Type u) [Field k] (a m : ℤ) :
    IsCMRegular (projectiveSpace (Spec (.of k)) 1)
      (fun r => (projectiveBundle.twistingSheaf (Spec (.of k))
        (SheafOfModules.free (R := (Spec (.of k)).ringCatSheaf)
          (ULift.{u} (Fin 2))) (a + r)).obj) m ↔ 0 ≤ a + m := by sorry
-- RegularityTests.zero
example (X : Scheme.{u}) (m : ℤ) : IsCMRegular X (fun _ => (0 : X.Modules)) m := by sorry
end RegularityTests

/-- A matrix chart for the determinantal closed scheme. Coordinates glue independently of bases. -/
def rankLocus {R : Type u} [CommRing R] {a b : ℕ} (A : Matrix (Fin a) (Fin b) R)
    (r : ℕ) : Ideal R := by sorry
namespace rankLocus
variable {R : Type u} [CommRing R] {a b : ℕ} (A : Matrix (Fin a) (Fin b) R)
theorem minor_mem (r : ℕ) (rows : Fin (r + 1) ↪ Fin a) (cols : Fin (r + 1) ↪ Fin b) :
    Matrix.det (A.submatrix rows cols) ∈ rankLocus A r := by sorry
theorem factor_iff (r : ℕ) {T : Type u} [CommRing T] (f : R →+* T) :
    rankLocus A r ≤ RingHom.ker f ↔
      ∀ (rows : Fin (r + 1) ↪ Fin a) (cols : Fin (r + 1) ↪ Fin b),
        Matrix.det ((A.map f).submatrix rows cols) = 0 := by sorry
theorem baseChange (r : ℕ) {T : Type u} [CommRing T] (f : R →+* T) :
    Ideal.map f (rankLocus A r) = rankLocus (A.map f) r := by sorry
end rankLocus
namespace RankLocusTests
-- RankLocusTests.oneByOne
example {R : Type u} [CommRing R] (t : R) :
    rankLocus (!![t] : Matrix (Fin 1) (Fin 1) R) 0 = Ideal.span {t} := by sorry
-- RankLocusTests.fullRankBound
example {R : Type u} [CommRing R] {a b : ℕ} (A : Matrix (Fin a) (Fin b) R) :
    rankLocus A (min a b) = ⊥ := by sorry
-- RankLocusTests.nilpotent
example {R : Type u} [CommRing R] (ε : R) (hne : ε ≠ 0) (hsq : ε * ε = 0) :
    rankLocus (!![ε] : Matrix (Fin 1) (Fin 1) R) 0 ≠ ⊥ := by sorry
end RankLocusTests

/-- On finite locally free E, the locus rank(U → E/W) ≤ a-k. Fixed rank n and the universal-subobject comparisons remain supplier limitations;
native local freeness and finite presentation of E are included. -/
def incidenceLocus (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent] [E.IsLocallyFree] [E.IsFinitePresentation]
    (n a b k : ℕ) : Scheme.{u} := by sorry
namespace incidenceLocus
variable (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent] [E.IsLocallyFree] [E.IsFinitePresentation] (n a b k : ℕ)
def inclusion : incidenceLocus S E n a b k ⟶
    Limits.pullback (coherentGrassmann.projection S E (n - a))
      (coherentGrassmann.projection S E (n - b)) := by sorry
-- The ambient scheme is the relative product over S.
theorem isClosedImmersion : IsClosedImmersion (inclusion S E n a b k) := by sorry
def projection : incidenceLocus S E n a b k ⟶ S :=
  inclusion S E n a b k ≫
    Limits.pullback.fst (coherentGrassmann.projection S E (n - a))
      (coherentGrassmann.projection S E (n - b)) ≫ coherentGrassmann.projection S E (n - a)
def baseChange {T : Scheme.{u}} (f : T ⟶ S)
    [((Scheme.Modules.pullback f).obj E).IsQuasicoherent]
    [((Scheme.Modules.pullback f).obj E).IsLocallyFree]
    [((Scheme.Modules.pullback f).obj E).IsFinitePresentation] :
    incidenceLocus T ((Scheme.Modules.pullback f).obj E) n a b k ≅
      Limits.pullback (projection S E n a b k) f := by sorry
/-- Field points of the incidence scheme, using actual quotient kernels. -/
def fieldPoints (K : Type u) [Field K] (n a b r : ℕ) (ha : a ≤ n) (hb : b ≤ n)
    [(tilde (R := CommRingCat.of K) (ModuleCat.of K (Fin n → K))).IsLocallyFree]
    [(tilde (R := CommRingCat.of K) (ModuleCat.of K (Fin n → K))).IsFinitePresentation] :
    {g : Spec (.of K) ⟶
      incidenceLocus (Spec (.of K)) (tilde (ModuleCat.of K (Fin n → K))) n a b r //
      g ≫ projection (Spec (.of K)) (tilde (ModuleCat.of K (Fin n → K))) n a b r =
        𝟙 (Spec (.of K))} ≃
    {Q : Module.Grassmannian K (Fin n → K) (n - a) ×
        Module.Grassmannian K (Fin n → K) (n - b) //
      r ≤ Module.finrank K ↥(Q.1.toSubmodule ⊓ Q.2.toSubmodule)} := by sorry
end incidenceLocus
namespace IncidenceTests
-- IncidenceTests.zeroBound
example (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent] [E.IsLocallyFree] [E.IsFinitePresentation] (n a b : ℕ) :
    IsIso (incidenceLocus.inclusion S E n a b 0) := by sorry
-- IncidenceTests.lines
example (k : Type u) [Field k]
    [(tilde (R := CommRingCat.of k) (ModuleCat.of k (Fin 2 → k))).IsLocallyFree]
    [(tilde (R := CommRingCat.of k) (ModuleCat.of k (Fin 2 → k))).IsFinitePresentation] (U W : Module.Grassmannian k (Fin 2 → k) 1) :
    (∃ g : {g : Spec (.of k) ⟶
        incidenceLocus (Spec (.of k)) (tilde (ModuleCat.of k (Fin 2 → k))) 2 1 1 1 //
      g ≫ incidenceLocus.projection (Spec (.of k))
        (tilde (ModuleCat.of k (Fin 2 → k))) 2 1 1 1 = 𝟙 (Spec (.of k))},
      ((incidenceLocus.fieldPoints k 2 1 1 1 (by decide) (by decide)) g).val = (U, W)) ↔
        U = W := by sorry
-- IncidenceTests.impossible
example (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent] [E.IsLocallyFree] [E.IsFinitePresentation] (n a b k : ℕ)
    (h : min a b < k) : Nonempty (incidenceLocus S E n a b k ≅ Scheme.empty) := by sorry
end IncidenceTests

/-- F must be the absolute Frobenius of a characteristic-p scheme, a missing supplier API.
Its actual source matters: F⁎U → E → Q, rather than an O-linear E → E invariant locus. -/
def frobeniusStableLocus (X : Scheme.{u}) (E U Q : X.Modules)
    [U.IsQuasicoherent] [U.IsFiniteType] [Q.IsLocallyFree] [Q.IsFinitePresentation]
    (i : U ⟶ E) (q : E ⟶ Q)
    (F : X ⟶ X) (Φ : (Scheme.Modules.pullback F).obj E ⟶ E) : Scheme.{u} := by sorry
namespace frobeniusStableLocus
variable (X : Scheme.{u}) (E U Q : X.Modules)
    [U.IsQuasicoherent] [U.IsFiniteType] [Q.IsLocallyFree] [Q.IsFinitePresentation]
    (i : U ⟶ E) (q : E ⟶ Q)
variable (F : X ⟶ X) (Φ : (Scheme.Modules.pullback F).obj E ⟶ E)
def inclusion : frobeniusStableLocus X E U Q i q F Φ ⟶ X := by sorry
theorem isClosedImmersion : IsClosedImmersion (inclusion X E U Q i q F Φ) := by sorry
theorem equation :
    (Scheme.Modules.pullback (inclusion X E U Q i q F Φ)).map
      ((Scheme.Modules.pullback F).map i ≫ Φ ≫ q) = 0 := by sorry
theorem maximal {T : Scheme.{u}} (g : T ⟶ X)
    (h : (Scheme.Modules.pullback g).map ((Scheme.Modules.pullback F).map i ≫ Φ ≫ q) = 0) :
    ∃! j : T ⟶ frobeniusStableLocus X E U Q i q F Φ,
      j ≫ inclusion X E U Q i q F Φ = g := by sorry
/-- Quotient (-t,1) applied to [[a,b],[c,d]] times the Frobenius-pulled generator (1,t^p).
Its identification with the global zero-map scheme is omitted with the chart trivializations. -/
def graphEquation {R : Type u} [CommRing R] (p : ℕ) (a b c d t : R) : R :=
  c + d * t ^ p - t * (a + b * t ^ p)

end frobeniusStableLocus
namespace FrobeniusTests
-- FrobeniusTests.zeroOperator
example (X : Scheme.{u}) (E U Q : X.Modules)
    [U.IsQuasicoherent] [U.IsFiniteType] [Q.IsLocallyFree] [Q.IsFinitePresentation]
    (i : U ⟶ E) (q : E ⟶ Q) (F : X ⟶ X) :
    IsIso (frobeniusStableLocus.inclusion X E U Q i q F 0) := by sorry
-- FrobeniusTests.identityChart
example (p : ℕ) (hp : p.Prime) (k : Type u) [Field k] [CharP k p] (t : k) :
    (t ^ p = t) ↔ frobeniusStableLocus.graphEquation p 1 0 0 1 t = 0 := by sorry
-- FrobeniusTests.nonFixedCoefficient
example (p : ℕ) (hp : p.Prime) (k : Type u) [Field k] [CharP k p] (t : k) (h : t ^ p ≠ t) :
    frobeniusStableLocus.graphEquation p 1 0 0 1 t ≠ 0 := by sorry
end FrobeniusTests


/-- Reduced projective coefficient locus of Chow forms. Purity, degree and the identification
with the multihomogeneous coefficient locus are mathematical conditions in the document;
the pin has cycles but no Chow-form interface. This is a parameter scheme, not an arbitrary-base
cycle functor or a flat universal subscheme. -/
def chowParameters (k : Type u) [Field k] (n r D : ℕ) : Scheme.{u} := by sorry
namespace chowParameters
variable (k : Type u) [Field k] (n r D : ℕ)
def cycle (z : Spec (.of k) ⟶ chowParameters k n r D) :
    AlgebraicCycle (projectiveSpace (Spec (.of k)) n) ℕ := by sorry
/-- Conditions omitted here: k algebraically closed of characteristic zero; c effective pure
r-dimensional and of degree D; n,r admissible. These are essential, not universal claims
about unrestricted native cycles. -/
def fromCycle (c : AlgebraicCycle (projectiveSpace (Spec (.of k)) n) ℕ) :
    Spec (.of k) ⟶ chowParameters k n r D := by sorry
theorem cycle_fromCycle (c : AlgebraicCycle (projectiveSpace (Spec (.of k)) n) ℕ) :
    cycle k n r D (fromCycle k n r D c) = c := by sorry
/-- Universal support with its actual closed inclusion. Fibrewise support-set equality and the
relative product over k require the supplier structure morphisms, omitted from this signature.
Using the absolute product here gives the same closed inclusion after including the relative
product; it does not assert an absolute-product moduli property. -/
def support (k : Type u) [Field k] (n r D : ℕ) : Scheme.{u} := by sorry
def supportInclusion : support k n r D ⟶
    Limits.prod (chowParameters k n r D) (projectiveSpace (Spec (.of k)) n) := by sorry
theorem support_isClosedImmersion : IsClosedImmersion (supportInclusion k n r D) := by sorry
end chowParameters
namespace ChowTests
-- ChowTests.zeroDegree
example (k : Type u) [Field k] (n r : ℕ) :
    Nonempty (chowParameters k n r 0 ≅ Spec (.of k)) := by sorry
-- ChowTests.hyperplanes
example (k : Type u) [Field k] (n : ℕ) (hn : 0 < n) :
    -- The free coordinate space is identified with the dual, omitted here.
    Nonempty (chowParameters k n (n - 1) 1 ≅ projectiveSpace (Spec (.of k)) n) := by sorry
-- ChowTests.multiplicity
example (k : Type u) [Field k] (n : ℕ) (hn : 0 < n)
    (H : AlgebraicCycle (projectiveSpace (Spec (.of k)) n) ℕ) :
    -- H is the cycle of a hyperplane, an omitted degree/purity identification.
    chowParameters.cycle k n (n - 1) 2
      (chowParameters.fromCycle k n (n - 1) 2 (H + H)) = H + H := by sorry
end ChowTests

/- Named theorem interfaces. Relative higher direct images, coherent sheaves, graded-module
compatibility, intersection numbers and sheaf ranks have supplier APIs outside the pin. Each
omission is identified below and in the document; no unspecified proposition is substituted. -/
def rankOneGrassmannComparison (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent] :
    projectiveBundle S E ≅ coherentGrassmann S E 1 := by sorry

/-- The exponent basis is specified, including the rank-one projective-space exception. -/
def projectiveTwistBasis (n q : ℕ) (m : ℤ) : Type :=
  {e : Fin (n + 1) → ℤ // (∑ i, e i) = m ∧
    ((q = 0 ∧ (n = 0 ∨ ∀ i, 0 ≤ e i)) ∨ (0 < n ∧ q = n ∧ ∀ i, e i < 0))}
/-- All-degree additive Čech comparison with the actual Laurent-exponent basis. -/
def projectiveSpaceTwistCohomology (A : Type u) [CommRing A] (n : ℕ) (m : ℤ) (q : ℕ) :
    Cohomology (projectiveBundle.twistingSheaf (Spec (.of A))
      (SheafOfModules.free (R := (Spec (.of A)).ringCatSheaf)
        (ULift.{u} (Fin (n + 1)))) m).obj q ≃+
      (projectiveTwistBasis n q m →₀ A) := by sorry
namespace ProjectiveTwistCohomologyTests
-- ProjectiveTwistCohomologyTests.pointNegative
example (A : Type u) [CommRing A] :
    Nonempty (Cohomology (projectiveBundle.twistingSheaf (Spec (.of A))
      (SheafOfModules.free (R := (Spec (.of A)).ringCatSheaf)
        (ULift.{u} (Fin 1))) (-7)).obj 0 ≃+ A) := by sorry
-- ProjectiveTwistCohomologyTests.topLine
example (A : Type u) [CommRing A] :
    Nonempty (Cohomology (projectiveBundle.twistingSheaf (Spec (.of A))
      (SheafOfModules.free (R := (Spec (.of A)).ringCatSheaf)
        (ULift.{u} (Fin 2))) (-2)).obj 1 ≃+ A) := by sorry
-- ProjectiveTwistCohomologyTests.lineBoundary
example (A : Type u) [CommRing A] :
    Subsingleton (Cohomology (projectiveBundle.twistingSheaf (Spec (.of A))
      (SheafOfModules.free (R := (Spec (.of A)).ringCatSheaf)
        (ULift.{u} (Fin 2))) (-1)).obj 1) := by sorry
end ProjectiveTwistCohomologyTests

/-- On rank-one E=L the relative formula reduces to the actual pullback along P(L)≅S.
The higher-direct-image signatures for rank n+1, with their determinant dual, are omitted:
no Rⁱπ_* or sheaf symmetric-power API is available at the pin. -/
def relativeBundleCohomology (S : Scheme.{u}) (L Lm : InvertibleSheaf S)
    [L.obj.IsQuasicoherent] (m : ℤ) :
    -- Lm is L^m, an omitted tensor-power identification.
    (Scheme.Modules.pullback (projectiveBundle.rankOne S L).inv).obj
      (projectiveBundle.twistingSheaf S L.obj m).obj ≅ Lm.obj := by sorry

/-- Native properness and finite presentation are included. Ampleness of L is a supplier limitation.
The sequence Ftw m is F tensor L^m, also an omitted identification. -/
theorem absoluteSerre (k : Type u) [Field k] (X : Scheme.{u})
    [X.Over (Spec (.of k))] [IsProper (X ↘ Spec (.of k))] (F : X.Modules)
    [F.IsFinitePresentation] (Ftw : ℤ → X.Modules) :
    (∀ q : ℕ, FiniteDimensional k (Cohomology F q)) ∧
    ∃ m₀ : ℤ, ∀ m ≥ m₀, ∀ q : ℕ, 0 < q → Subsingleton (Cohomology (Ftw m) q) := by sorry

/-- This affine-base form checks the native cohomology types. Relative Rⁱf_*, coherent
pushforward and the evaluation map in the general-base target need the supplier's interfaces.
Native affine-base Noetherianity, properness and finite presentation are included;
relative ampleness and the twist-family identification remain supplier limitations. -/
theorem relativeSerre (A : Type u) [CommRing A] [IsNoetherianRing A] (X : Scheme.{u})
    (f : X ⟶ Spec (.of A)) [IsProper f] (Ftw : ℤ → X.Modules)
    [∀ m, (Ftw m).IsFinitePresentation] :
    ∃ m₀ : ℤ, ∀ m ≥ m₀, ∀ q : ℕ, 0 < q → Subsingleton (Cohomology (Ftw m) q) := by sorry

theorem grassmannSmoothness (S : Scheme.{u}) (E : S.Modules) [E.IsQuasicoherent]
    [E.IsLocallyFree] [E.IsFinitePresentation]
    (n d : ℕ) (hd : d ≤ n) :
    -- E is locally free of rank n, omitted supplier hypothesis.
    SmoothOfRelativeDimension (d * (n - d)) (coherentGrassmann.projection S E d) := by sorry

/-- Tensor-power identification Apow m = A^m and relative ampleness of A are omitted.
The native proper hypothesis covers the fixed-twist consequence. -/
theorem amplePowersAndFixedTwists {S X : Scheme.{u}} (f : X ⟶ S) [IsProper f]
    (B : InvertibleSheaf X) (Apow : ℤ → InvertibleSheaf X)
    (BApow : ℤ → InvertibleSheaf X) :
    -- S Noetherian; BApow m = B tensor Apow m, omitted supplier identifications.
    ∃ m₀ : ℤ, ∀ m ≥ m₀, IsRelativelyVeryAmple f (Apow m) ∧
      IsRelativelyVeryAmple f (BApow m) := by sorry

/-- M d are the graded pieces of a finite graded module over a finite standard graded
Noetherian A-algebra; the graded decomposition and finite-generation conditions are omitted.
Native module finiteness remains the conclusion, rather than a new private graded carrier. -/
theorem gradedPiecesFinite (A : Type u) [CommRing A] (M : ℤ → Type u)
    [∀ d, AddCommGroup (M d)] [∀ d, Module A (M d)] :
    ∀ d, Module.Finite A (M d) := by sorry

/-- Artinian coefficients and finite pieces are native; the finite standard graded-module
identification remains omitted. The series identity uses the imported Hilbert-series API. -/
theorem hilbertSerre (A : Type u) [CommRing A] [IsArtinianRing A] (M : ℤ → Type u)
    [∀ d, AddCommGroup (M d)] [∀ d, Module A (M d)] [∀ d, Module.Finite A (M d)] :
    ∃ P : Polynomial ℚ, ∃ d₀ : ℤ, ∀ d ≥ d₀,
      P.eval (d : ℚ) = ((Module.length A (M d)).toNat : ℚ) := by sorry

/-- Xs,Ls,Fs are the geometric fibres of one fixed projective Noetherian family.
That fibre identification, coherence and relative very ampleness are omitted conditions.
Flatness yields local constancy; its general-base signature needs the supplier fibre API. -/
theorem familyHilbertPolynomials (ι : Type u) (k : ι → Type u)
    [∀ s, Field (k s)] (Xs : ι → Scheme.{u}) [∀ s, (Xs s).Over (Spec (.of (k s)))]
    (Ls : ∀ s, InvertibleSheaf (Xs s)) (Fs : ∀ s, (Xs s).Modules) :
    Set.Finite {P : Polynomial ℚ | ∃ s, P = hilbertPolynomial (k s) (Xs s) (Ls s) (Fs s)} := by sorry

/-- Ftw are twists of coherent quotients of one fixed E; each quotient has the displayed
polynomial P. Fixed quotient data, finite generation, and that polynomial constraint are
omitted supplier conditions. This is not a claim for all sheaves of a fixed polynomial. -/
theorem uniformQuotientRegularity (k : Type u) [Field k] (n : ℕ) (P : Polynomial ℚ)
    (ι : Type u) (Ftw : ι → ℤ → (projectiveSpace (Spec (.of k)) n).Modules) :
    ∃ m₀ : ℤ, ∀ j, IsCMRegular (projectiveSpace (Spec (.of k)) n) (Ftw j) m₀ := by sorry

/-- Ftw s are fibre twists of a single coherent flat sheaf in a Noetherian family.
Coherence, flatness and fibre identifications are omitted. The Rⁱ and pushforward/base-change
consequences require the supplier APIs and are specified in the document. -/
theorem familyRegularity (ι : Type u) (k : ι → Type u) [∀ s, Field (k s)] (n : ℕ)
    (Ftw : ∀ s, ℤ → (projectiveSpace (Spec (.of (k s))) n).Modules) :
    ∃ m₀ : ℤ, ∀ s, IsCMRegular (projectiveSpace (Spec (.of (k s))) n) (Ftw s) m₀ := by sorry

/-- Xs are reduced pure-r closed subschemes of one fixed projective complex ambient scheme.
The closed inclusions, purity, reducedness, and degree ≤D conditions are omitted. The relative
arbitrary-characteristic extension has a separately recorded source proof gap. -/
theorem boundedDegreeHilbertPolynomials (k : Type u) [Field k] (n r D : ℕ)
    (ι : Type u) (Xs : ι → Scheme.{u}) [∀ s, (Xs s).Over (Spec (.of k))]
    (Ls : ∀ s, InvertibleSheaf (Xs s)) :
    Set.Finite {P : Polynomial ℚ | ∃ s,
      P = hilbertPolynomial k (Xs s) (Ls s) (SheafOfModules.unit (Xs s).ringCatSheaf)} := by sorry

/-- The support-meets-open Chow locus: openness, rather than an all-components predicate.
The identification of the boundary inclusion with the Chow support locus is omitted because
no scheme-valued universal-cycle API is pinned. -/
theorem chowOpenAndEmbedding {C B : Scheme.{u}} (i : B ⟶ C) [IsClosedImmersion i] :
    -- C is the Chow parameter scheme, B its boundary-support closed coefficient locus.
    IsOpen (Set.range i.base)ᶜ := by sorry

/-- Uniform over varieties of fixed d,L^d=v,K.L^(d-1)=w. Smooth/projective, canonical bundle,
intersection-number constraints and Lpow m=L^m are omitted. The corrected algebraic proof is
an explicit source gap; the document is definitive about those constraints. -/
theorem numericalVeryAmpleness (k : Type u) [Field k] (d v : ℕ) (w : ℤ) :
    ∃ m₀ : ℤ, ∀ (X : Scheme.{u}) (f : X ⟶ Spec (.of k))
      (Lpow : ℤ → InvertibleSheaf X), ∀ m ≥ m₀, IsRelativelyVeryAmple f (Lpow m) := by sorry

/-- The embedded-variety consequence of the numerical theorem. Xs are smooth complex 2n-folds with K trivial and ample L satisfying L^(2n)=r.
Ls are their uniformly chosen embedding powers L^m; those numerical constraints and the
tensor-power identification are omitted. Hilbert-functor representability itself belongs to R09.2. -/
theorem smoothPolarizedBoundedness (k : Type u) [Field k] (n r : ℕ) (ι : Type u)
    (Xs : ι → Scheme.{u}) [∀ s, (Xs s).Over (Spec (.of k))]
    (Ls : ∀ s, InvertibleSheaf (Xs s)) :
    Set.Finite {P : Polynomial ℚ | ∃ s,
      P = hilbertPolynomial k (Xs s) (Ls s) (SheafOfModules.unit (Xs s).ringCatSheaf)} := by sorry

/-- The image birationality and degree conclusions need rational-map and image-family supplier
interfaces and are omitted. Here Ftw s are the L_s^m twists of O in one fixed flat projective
complex family with fibrewise big L, also omitted mathematical conditions. -/
theorem bigFamilyBirationalBounds (ι : Type u) (k : ι → Type u) [∀ s, Field (k s)]
    (Xs : ι → Scheme.{u}) [∀ s, (Xs s).Over (Spec (.of (k s)))]
    (Ftw : ∀ s, ℤ → (Xs s).Modules) :
    ∃ a N : ℕ, 0 < a ∧ ∀ s, Module.finrank (k s) (Cohomology (Ftw s a) 0) ≤ N := by sorry

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
example (R : Type u) [CommRing R] (p N : ℕ) :
    coefficientFrobeniusCutoff R p N 0 = 0 := by sorry
-- CoefficientFrobeniusTests.monomial
example (R : Type u) [CommRing R] (p N : ℕ) (j : Fin N)
    (i : Fin (p * N + 1)) (hi : i.val = p * j.val) (t : R) :
    coefficientFrobeniusCutoff R p N (Pi.single j t) i = t := by sorry
-- CoefficientFrobeniusTests.nonFixedCoefficient
example (p : ℕ) (hp : p.Prime) (k : Type u) [Field k] [CharP k p]
    (t : k) (h : t ^ p ≠ t) :
    coefficientFrobeniusCutoff k p 1 (fun _ => t) 0 ≠ t ^ p := by sorry
end CoefficientFrobeniusTests

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.R09_1
