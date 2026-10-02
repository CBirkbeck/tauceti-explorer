/-!
This file is not the roadmap and is not exhaustive. The companion roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers can converge
on names and signatures. Nothing here claims an implementation.

Pinned baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
TauCeti f790474821cf4256814db967cb154e7af3d0c369. NOT COMPILED: no existing build at
these commits was available. Every proof is a prototype `sorry`.

The packet is partial. Missing geometric conditions are explicitly omitted, never represented
by arbitrary proposition parameters or a definition of a proposition by `sorry`. The final
ledger names every API, example and layer theorem whose full signature needs supplier types.
The two partial data structures below are not substitutes for their mathematical definitions.
-/

import Mathlib.Algebra.Category.Ring.Constructions
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.AlgebraicGeometry.Limits
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.CategoryTheory.Limits.Shapes.Pullback.IsPullback.Defs
import Mathlib.RingTheory.Conductor
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass
import Mathlib.Algebra.Polynomial.Degree.Operations
import Mathlib.Data.ZMod.Basic
import Mathlib.AlgebraicGeometry.EllipticCurve.VariableChange
import Mathlib.GroupTheory.SpecificGroups.Cyclic
import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.Point.VariableChange
import Mathlib.Data.Fin.VecNotation
import TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.Basic
import TauCeti.AlgebraicGeometry.Curves.StableReduction.Model.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.PointCount

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry
open scoped Polynomial

universe u
noncomputable section

namespace Subring

/-- The largest ideal of B contained in the arbitrary subring A. -/
def conductor {B : Type u} [CommRing B] (A : Subring B) : Ideal B where
  carrier := {b | ∀ x : B, b * x ∈ A}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

lemma conductor_mem {B : Type u} [CommRing B] (A : Subring B) (b : B) :
    b ∈ A.conductor ↔ ∀ x : B, b * x ∈ A := by sorry

lemma conductor_le {B : Type u} [CommRing B] (A : Subring B) :
    (A.conductor : Set B) ⊆ A := by sorry

lemma conductor_greatest {B : Type u} [CommRing B] (A : Subring B) (I : Ideal B) :
    I ≤ A.conductor ↔ (I : Set B) ⊆ A := by sorry

lemma conductor_mono {B : Type u} [CommRing B] {A A' : Subring B} (h : A ≤ A') :
    A.conductor ≤ A'.conductor := by sorry

lemma conductor_adjoin (R B : Type u) [CommRing R] [CommRing B] [Algebra R B]
    (x : B) :
    (Algebra.adjoin R ({x} : Set B)).toSubring.conductor = _root_.conductor R x := by
  sorry

-- Subring.conductor_top
example {B : Type u} [CommRing B] : (⊤ : Subring B).conductor = ⊤ := by sorry

-- Subring.conductor_cusp
example (k : Type u) [Field k] :
    (Algebra.adjoin k ({Polynomial.X ^ 2, Polynomial.X ^ 3} : Set k[X])).toSubring.conductor =
      Ideal.span ({Polynomial.X ^ 2} : Set k[X]) := by sorry

-- Subring.conductor_node
example (k : Type u) [Field k] (h : (2 : k) ≠ 0) :
    (RingHom.eqLocus (Polynomial.evalRingHom (1 : k))
      (Polynomial.evalRingHom (-1 : k))).conductor =
      Ideal.span ({Polynomial.X ^ 2 - 1} : Set k[X]) := by sorry

-- Subring.conductor_quadratic_field: the stronger proper-field-extension test.
example (k E : Type u) [Field k] [Field E] [Algebra k E]
    (h : ¬ Function.Surjective (algebraMap k E)) :
    (algebraMap k E).range.conductor = ⊥ := by sorry

end Subring

namespace TauCeti.GenusOne.AffinePinching

variable {A B : Type u} [CommRing A] [CommRing B]

/-- NeronModelsAndSemistableAbelianVarietiesPartII:G.0/common-ideal-comparison: comparison into the existing ring pullback.
No image-ideal or injectivity hypothesis is required to construct the map. -/
def commonIdealComparison (f : A →+* B) (I : Ideal A) :
    CommRingCat.of A ⟶ (CommRingCat.pullbackCone
      (CommRingCat.ofHom (Ideal.Quotient.mk (I.map f)))
      (CommRingCat.ofHom (Ideal.quotientMap (I.map f) f Ideal.le_comap_map))).pt := by sorry

lemma commonIdealComparison_fst (f : A →+* B) (I : Ideal A) (a : A) :
    (CommRingCat.pullbackCone
      (CommRingCat.ofHom (Ideal.Quotient.mk (I.map f)))
      (CommRingCat.ofHom (Ideal.quotientMap (I.map f) f Ideal.le_comap_map))).fst.hom
        ((commonIdealComparison f I).hom a) = f a := by sorry

lemma commonIdealComparison_snd (f : A →+* B) (I : Ideal A) (a : A) :
    (CommRingCat.pullbackCone
      (CommRingCat.ofHom (Ideal.Quotient.mk (I.map f)))
      (CommRingCat.ofHom (Ideal.quotientMap (I.map f) f Ideal.le_comap_map))).snd.hom
        ((commonIdealComparison f I).hom a) = Ideal.Quotient.mk I a := by sorry

lemma commonIdealComparison_unique (f : A →+* B) (I : Ideal A)
    (h : CommRingCat.of A ⟶ (CommRingCat.pullbackCone
      (CommRingCat.ofHom (Ideal.Quotient.mk (I.map f)))
      (CommRingCat.ofHom (Ideal.quotientMap (I.map f) f Ideal.le_comap_map))).pt)
    (hfst : h ≫ (CommRingCat.pullbackCone
      (CommRingCat.ofHom (Ideal.Quotient.mk (I.map f)))
      (CommRingCat.ofHom (Ideal.quotientMap (I.map f) f Ideal.le_comap_map))).fst =
        CommRingCat.ofHom f)
    (hsnd : h ≫ (CommRingCat.pullbackCone
      (CommRingCat.ofHom (Ideal.Quotient.mk (I.map f)))
      (CommRingCat.ofHom (Ideal.quotientMap (I.map f) f Ideal.le_comap_map))).snd =
        CommRingCat.ofHom (Ideal.Quotient.mk I)) :
    h = commonIdealComparison f I := by sorry

-- commonIdealComparison.test_identity
example (I : Ideal A) :
    Function.Bijective (commonIdealComparison (RingHom.id A) I).hom := by sorry

-- commonIdealComparison.test_zero_ideal
example (f : A →+* B) :
    Function.Bijective (commonIdealComparison f ⊥).hom := by sorry

-- commonIdealComparison.test_noninjective_kernel
example :
    let f := Int.castRingHom (ZMod 2)
    let c := commonIdealComparison f (RingHom.ker f)
    c.hom (2 : ℤ) = c.hom 0 ∧ (2 : ℤ) ≠ 0 := by sorry

-- commonIdealComparison.test_image_not_ideal
example :
    let f := (RingHom.id (ZMod 2)).prod (RingHom.id (ZMod 2))
    ¬ Function.Surjective (commonIdealComparison f ⊤).hom := by sorry

/-- NeronModelsAndSemistableAbelianVarietiesPartII:G.0/common-ideal-kernel: the obstruction is an actual kernel intersection. -/
lemma commonIdealComparison_kernel (f : A →+* B) (I : Ideal A) :
    RingHom.ker (commonIdealComparison f I).hom = RingHom.ker f ⊓ I := by sorry

/-- NeronModelsAndSemistableAbelianVarietiesPartII:G.0/common-ideal-pair-lifting: the image must already be an ideal. -/
lemma commonIdealComparison_surjective (f : A →+* B) (I : Ideal A)
    (himage : (I.map f : Set B) = f '' (I : Set A)) :
    Function.Surjective (commonIdealComparison f I).hom := by sorry

/-- NeronModelsAndSemistableAbelianVarietiesPartII:G.0/common-ideal-cartesian: Ferrand Lemma 1.3, including necessity. -/
theorem commonIdeal_isPullback_iff (f : A →+* B) (I : Ideal A)
    (himage : (I.map f : Set B) = f '' (I : Set A)) :
    IsPullback (CommRingCat.ofHom f) (CommRingCat.ofHom (Ideal.Quotient.mk I))
      (CommRingCat.ofHom (Ideal.Quotient.mk (I.map f)))
      (CommRingCat.ofHom (Ideal.quotientMap (I.map f) f Ideal.le_comap_map)) ↔
        RingHom.ker f ⊓ I = ⊥ := by sorry

/-- NeronModelsAndSemistableAbelianVarietiesPartII:G.0/conductor-ring-cartesian: no finiteness, reducedness or Noetherianity. -/
lemma conductorRing_isPullback (S : Subring B) :
    IsPullback (CommRingCat.ofHom S.subtype)
      (CommRingCat.ofHom (Ideal.Quotient.mk (S.conductor.comap S.subtype)))
      (CommRingCat.ofHom (Ideal.Quotient.mk S.conductor))
      (CommRingCat.ofHom (Ideal.quotientMap S.conductor S.subtype le_rfl)) := by sorry

end TauCeti.GenusOne.AffinePinching

namespace TauCeti.GenusOne

section GeometricSquare

variable {Z Y Z' P : Scheme.{u}}
variable (i : Z ⟶ Y) (g : Z ⟶ Z') (a : Y ⟶ P) (b : Z' ⟶ P)

/-- General geometric square, before finite pinching or Witaszek restrictions. -/
structure GeometricPushout : Prop where
  commutes : i ≫ a = g ≫ b
  topology : IsPushout (Scheme.forgetToTop.map i) (Scheme.forgetToTop.map g)
    (Scheme.forgetToTop.map a) (Scheme.forgetToTop.map b)
  sections (U : P.Opens) : IsPullback (a.app U) (b.app U)
    (i.appLE (a ⁻¹ᵁ U) ((i ≫ a) ⁻¹ᵁ U) (by sorry))
    (g.appLE (b ⁻¹ᵁ U) ((i ≫ a) ⁻¹ᵁ U) (by sorry))

-- The two proof holes in section restriction inequalities use the actual commutative square.
-- This condition expresses the structure-sheaf equality on every open, not just global sections.

namespace GeometricPushout

lemma of_affine {B C A' : CommRingCat.{u}} (p : B ⟶ C) (q : A' ⟶ C)
    (hp : Function.Surjective p.hom) (hq : q.hom.Finite) :
    GeometricPushout (Spec.map p) (Spec.map q)
      (Spec.map (CommRingCat.pullbackCone p q).fst)
      (Spec.map (CommRingCat.pullbackCone p q).snd) := by sorry

lemma lift (h : GeometricPushout i g a b)
    (hi : IsClosedImmersion i) (hg : IsFinite g)
    {T : Scheme.{u}} (y : Y ⟶ T) (z : Z' ⟶ T) (hc : i ≫ y = g ≫ z) :
    ∃! m : P ⟶ T, a ≫ m = y ∧ b ≫ m = z := by sorry

-- GeometricPushout.node: the affine ring in the split-node example.
example (k : Type u) [Field k] (h : (2 : k) ≠ 0) :
    RingHom.eqLocus (Polynomial.evalRingHom (1 : k))
      (Polynomial.evalRingHom (-1 : k)) =
      (Algebra.adjoin k ({Polynomial.X ^ 2 - 1,
        Polynomial.X * (Polynomial.X ^ 2 - 1)} : Set k[X])).toSubring := by sorry

-- GeometricPushout.cusp: the affine ring in the infinitesimal-pinch example.
example (k : Type u) [Field k] :
    ((Algebra.adjoin k ({Polynomial.X ^ 2, Polynomial.X ^ 3} : Set k[X])).toSubring :
      Set k[X]) = {f | f.coeff 1 = 0} := by sorry

-- GeometricPushout.identity: includes the sheaf condition through the general predicate.
example (h : GeometricPushout i g a b) [IsClosedImmersion i] [IsFinite g] [IsIso g] :
    IsIso a := by sorry

-- GeometricPushout.topological_not_geometric: the missing ring section is made explicit.
-- The signature asserting failure of the associated geometric square is in the omission ledger.
example (k : Type u) [Field k] :
    Polynomial.X ^ 3 ∉
      Algebra.adjoin k ({Polynomial.X ^ 2, Polynomial.X ^ 5} : Set k[X]) := by sorry

end GeometricPushout

/-- Affine Ferrand existence in the actual Scheme carrier: G.0/affine-existence.
The universal property is in schemes; extension to algebraic-space targets is a separate
omitted contract below, not a consequence of the Spec notation alone. -/
theorem ferrand_affine_existence {B C A' : CommRingCat.{u}}
    (p : B ⟶ C) (q : A' ⟶ C)
    (hp : Function.Surjective p.hom) (hq : q.hom.Finite) :
    let a := Spec.map (CommRingCat.pullbackCone p q).fst
    let b := Spec.map (CommRingCat.pullbackCone p q).snd
    GeometricPushout (Spec.map p) (Spec.map q) a b ∧
      IsPushout (Spec.map p) (Spec.map q) a b ∧
      IsPullback (Spec.map p) (Spec.map q) a b ∧
      IsFinite a ∧ IsClosedImmersion b := by sorry

/-- Scheme existence has the finite-fiber affine-neighborhood hypothesis. -/
theorem ferrand_global_existence (hi : IsClosedImmersion i) (hg : IsFinite g)
    (hneighborhood : ∀ z' : Z', ∃ U : Y.Opens, IsAffineOpen U ∧
      ∀ z : Z, g z = z' → i z ∈ U) :
    ∃ (Q : Scheme.{u}) (y : Y ⟶ Q) (z' : Z' ⟶ Q),
      GeometricPushout i g y z' ∧ IsFinite y ∧ IsClosedImmersion z' ∧
      IsPullback i g y z' := by sorry

end GeometricSquare

/-- Partial baseline data form only. Omitted: dimensions2/1, geometric integrality,
contraction, generic regular genus1, relative minimality, and distinguished Jacobian section.
No theorem about a genus-one fiber may use this partial data form as the full definition. -/
structure GenusOneFibration (k : Type u) [Field k] where
  total : Scheme.{u}
  base : Scheme.{u}
  totalToK : total ⟶ Spec (.of k)
  baseToK : base ⟶ Spec (.of k)
  f : total ⟶ base
  overK : f ≫ baseToK = totalToK
  properTotal : IsProper totalToK
  properBase : IsProper baseToK
  smoothTotal : Smooth totalToK
  smoothBase : Smooth baseToK
  proper : IsProper f
  flat : Flat f

namespace GenusOneFibration

/-- The actual schematic fiber data of this partial morphism form. -/
def fiber {k : Type u} [Field k] (F : GenusOneFibration k)
    {l : Type u} [Field l] (b : Spec (.of l) ⟶ F.base) : Scheme.{u} :=
  pullback F.f b

end GenusOneFibration

/-- Partial divisor data form. Omitted: connected support, fiber-type zero pairings and
canonical-type pairings on a smooth proper surface. Those conditions need actual intersections.
The scheme Weil-divisor carrier is imported; it is not redefined as an abstract coefficient list. -/
structure FiberTypeDivisor (S : Scheme.{u}) where
  divisor : TauCeti.AlgebraicGeometry.SchemeWeilDivisor S
  nonzero : divisor ≠ 0
  effective : ∀ x, 0 ≤ divisor x

-- HasGeometricKodairaFiber and DegenerateFiber: no false definition is introduced here.
-- Their full signatures and every API/test name are in the precise omission ledger below.

/-- The existing Weierstrass carrier with the five actual global coefficient bounds. -/
structure BoundedWeierstrass (k : Type u) [CommRing k] where
  toCurve : WeierstrassCurve k[X]
  bound1 : toCurve.a₁.natDegree ≤ 1
  bound2 : toCurve.a₂.natDegree ≤ 2
  bound3 : toCurve.a₃.natDegree ≤ 3
  bound4 : toCurve.a₄.natDegree ≤ 4
  bound6 : toCurve.a₆.natDegree ≤ 6

/-- Weight-i reversal, including trailing zeros rather than reversing at the actual degree. -/
def reverseWeight {k : Type u} [CommRing k] (i : ℕ) (p : k[X]) : k[X] :=
  ∑ n ∈ Finset.range (i + 1), Polynomial.C (p.coeff n) * Polynomial.X ^ (i - n)

namespace BoundedWeierstrass

variable {k : Type u} [CommRing k]

def chart (W : BoundedWeierstrass k) : BoundedWeierstrass k where
  toCurve := ⟨reverseWeight 1 W.toCurve.a₁, reverseWeight 2 W.toCurve.a₂,
    reverseWeight 3 W.toCurve.a₃, reverseWeight 4 W.toCurve.a₄,
    reverseWeight 6 W.toCurve.a₆⟩
  bound1 := by sorry
  bound2 := by sorry
  bound3 := by sorry
  bound4 := by sorry
  bound6 := by sorry

lemma chart_chart (W : BoundedWeierstrass k) : W.chart.chart = W := by sorry

lemma ext {W V : BoundedWeierstrass k}
    (h1 : W.toCurve.a₁ = V.toCurve.a₁) (h2 : W.toCurve.a₂ = V.toCurve.a₂)
    (h3 : W.toCurve.a₃ = V.toCurve.a₃) (h4 : W.toCurve.a₄ = V.toCurve.a₄)
    (h6 : W.toCurve.a₆ = V.toCurve.a₆) : W = V := by sorry

lemma discriminant_chart (W : BoundedWeierstrass k) :
    W.chart.toCurve.Δ = reverseWeight 12 W.toCurve.Δ := by sorry

-- BoundedWeierstrass.constant_term
example : reverseWeight (k := k) 1 1 = Polynomial.X := by sorry

-- BoundedWeierstrass.top_degree
example : reverseWeight (k := k) 6 (Polynomial.X ^ 6) = 1 := by sorry

-- BoundedWeierstrass.zero: bounds allow this tuple; its discriminant does not certify ellipticity.
example : ∃ W : BoundedWeierstrass k,
    W.toCurve = (⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve k[X]) ∧ W.toCurve.Δ = 0 := by sorry

-- BoundedWeierstrass.involution
example (i : ℕ) (p : k[X]) (h : p.natDegree ≤ i) :
    reverseWeight i (reverseWeight i p) = p := by sorry

end BoundedWeierstrass

open Polynomial in
def rawCandidates : Fin 14 → WeierstrassCurve (ZMod 2)[X] :=
  ![⟨X, X, X ^ 2, X ^ 4, X ^ 5 + X ^ 6⟩,
    ⟨X, 0, 0, X ^ 3, X ^ 5 + X ^ 6⟩,
    ⟨X, 0, 0, X ^ 3, 0⟩,
    ⟨X, X ^ 2, 0, X ^ 3, 0⟩,
    ⟨X, 0, 0, 0, X ^ 5⟩,
    ⟨X, X ^ 2, 0, 0, X ^ 5⟩,
    ⟨X, X, 0, X ^ 4, 0⟩,
    ⟨X, X, X, X, 0⟩,
    ⟨0, X, X ^ 2, 0, 0⟩,
    ⟨0, 0, X ^ 2, X ^ 3, 0⟩,
    ⟨0, 0, X ^ 2, 0, 0⟩,
    ⟨X, 1, X ^ 3, 0, 0⟩,
    ⟨X, X, X ^ 3, 0, 0⟩,
    ⟨X, X ^ 2, X ^ 2, 0, 0⟩]

def CandidateEquation (i : Fin 14) : BoundedWeierstrass (ZMod 2) where
  toCurve := rawCandidates i
  bound1 := by sorry
  bound2 := by sorry
  bound3 := by sorry
  bound4 := by sorry
  bound6 := by sorry

namespace CandidateEquation

lemma coefficients (i : Fin 14) : (CandidateEquation i).toCurve = rawCandidates i := by sorry

lemma bounded (i : Fin 14) :
    (CandidateEquation i).toCurve.a₁.natDegree ≤ 1 ∧
    (CandidateEquation i).toCurve.a₂.natDegree ≤ 2 ∧
    (CandidateEquation i).toCurve.a₃.natDegree ≤ 3 ∧
    (CandidateEquation i).toCurve.a₄.natDegree ≤ 4 ∧
    (CandidateEquation i).toCurve.a₆.natDegree ≤ 6 := by sorry

lemma ne {i j : Fin 14} (h : i ≠ j) :
    (CandidateEquation i).toCurve ≠ (CandidateEquation j).toCurve := by sorry

lemma chart (i : Fin 14) :
    (CandidateEquation i).chart.toCurve =
      ⟨reverseWeight 1 (rawCandidates i).a₁, reverseWeight 2 (rawCandidates i).a₂,
        reverseWeight 3 (rawCandidates i).a₃, reverseWeight 4 (rawCandidates i).a₄,
        reverseWeight 6 (rawCandidates i).a₆⟩ := by sorry

-- CandidateEquation.model12 (indices start at zero).
example : (CandidateEquation 11).toCurve =
    ⟨Polynomial.X, 1, Polynomial.X ^ 3, 0, 0⟩ ∧
    (CandidateEquation 11).toCurve.Δ = Polynomial.X ^ 10 := by sorry

-- CandidateEquation.model13
example : (CandidateEquation 12).toCurve =
    ⟨Polynomial.X, Polynomial.X, Polynomial.X ^ 3, 0, 0⟩ ∧
    (CandidateEquation 12).toCurve.Δ = Polynomial.X ^ 11 := by sorry

-- CandidateEquation.model14
example : (CandidateEquation 13).toCurve =
    ⟨Polynomial.X, Polynomial.X ^ 2, Polynomial.X ^ 2, 0, 0⟩ ∧
    (CandidateEquation 13).toCurve.Δ = Polynomial.X ^ 8 *
      (Polynomial.X ^ 2 + Polynomial.X + 1) := by sorry

-- CandidateEquation.missing_from_print: the specific printed first eight tuples.
example (i : Fin 8) (j : Fin 14) (h : 11 ≤ j.val) :
    (CandidateEquation ⟨i.val, by sorry⟩).toCurve ≠ (CandidateEquation j).toCurve := by sorry

end CandidateEquation

-- An invariant part of the a2-normalization target, stated in the actual existing carrier.
open Polynomial in
theorem a2_normalization_coefficients (W : BoundedWeierstrass (ZMod 2)) :
    let r := W.toCurve.a₂
    let V : WeierstrassCurve (ZMod 2)[X] :=
      ⟨W.toCurve.a₁, 0, W.toCurve.a₃ + W.toCurve.a₁ * r,
        W.toCurve.a₄ + r ^ 2,
        W.toCurve.a₆ + r * W.toCurve.a₄ + r ^ 2 * W.toCurve.a₂ + r ^ 3⟩
    V.a₁.natDegree ≤ 1 ∧ V.a₂.natDegree ≤ 2 ∧ V.a₃.natDegree ≤ 3 ∧
      V.a₄.natDegree ≤ 4 ∧ V.a₆.natDegree ≤ 6 := by sorry

end TauCeti.GenusOne

/-!
## Exact omissions needing owner exports

This ledger is part of the partial-signature gap, not a claim that commented declarations
elaborate. It records each missing full form by its packet name. No `True` surrogate theorem,
invented opaque predicate, or unconstrained proposition field replaces the missing conditions.

* GeometricPushout.flat_baseChange: the four actual scheme pullbacks, their induced maps and
  qcqs flat pushforward comparison; retain the Ferrand or complete Witaszek hypotheses.
* GeometricPushout.witaszek_iff: the actual qcqs and representable universal-homeomorphism
  predicate from SF.1, and Witaszek's sheaf square. General squares are not all radicial.
* FerrandPushout.complementIso: the actual open-subscheme complements and induced isomorphism.
* FerrandPushout.conductor: conductor quotient diagrams of reduced Noetherian finite inclusions,
  with the exact quotient/subring ring maps and their Spec comparison.
* GeometricPushout.nonsplit_node: the pinched proper curve, its normalization and conductor,
  the separable quadratic point and its two conjugate geometric branches.
* GeometricPushout.topological_not_geometric: the full universal-homeomorphism square for
  k[t²,t⁵] and V(t²)→Spec k fails the section-ring pullback. The missing t³ test appears above.

* GenusOneFibration: dimension2/1, geometric integrality, the contraction, actual generic-fiber
  regularity and coherent genus, relative minimality and the Jacobian's zero-section are omitted
  from the partial data form. The full mathematical definition is in G.1 of the reader.
* GenusOneFibration.toModel: localization at a closed point, its actual excellent DVR and chosen
  function-field fiber identification in TauCeti.Model; no second Model is defined.
* GenusOneFibration.fiber: the data signature above is an actual scheme pullback; specialize its
  point morphism to the residue-field point and restore the full genus-one definition.
* GenusOneFibration.baseChange: the base-changed schemes and generic cohomology/minimality
  qualifications after a field extension.
* GenusOneFibration.isElliptic_iff: smoothness of the actual generic fiber over k(B).
* GenusOneFibration.product: the scheme product E×P¹→P¹ with the genuine elliptic-curve carrier,
  genus1 cohomology and full fibration predicates.
* GenusOneFibration.quasielliptic: a regular nonsmooth generic genus-one curve is quasielliptic
  and fails the smooth generic-fiber predicate, in characteristic2.
* GenusOneFibration.localization: localization retains the nonreduced schematic multiple fiber.

* FiberTypeDivisor: the partial divisor data form omits connected support and the geometric
  intersection zero conditions, and hence is not yet the fiber/canonical-type predicate.
* FiberTypeDivisor.mul: positive multiplication with the actual intersection and support laws.
* FiberTypeDivisor.ind: gcd coefficients, quotient coefficients and m·D_ind=D.
* FiberTypeDivisor.red: the effective support divisor, all coefficients1, with its subscheme.
* FiberTypeDivisor.numericalType: the existing StableReduction numerical type, residue weights.
* FiberTypeDivisor.smooth: smooth genus-one fiber has gcd1 and indecomposable divisor=reduction.
* FiberTypeDivisor.double: double smooth fiber has gcd2, while D_ind=D_red differs from D.
* FiberTypeDivisor.star: central coefficient2 in I₀*; gcd1 and D_ind≠D_red.
* FiberTypeDivisor.exceptional: connected negative-definite divisor fails the fiber-type test.

* HasGeometricKodairaFiber: the imported equation-side ReductionSymbol with the actual divisor
  components, normalizations, null roots and incidence schemes; no second enum is introduced.
* HasGeometricKodairaFiber.components: n,n+5,7,8,9 components in the respective symbols.
* HasGeometricKodairaFiber.multiplicative: singular multiplicative exactly I_n,n≥1.
* HasGeometricKodairaFiber.baseChange: the actual geometric symbol after residue-field extension.
* HasGeometricKodairaFiber.tate: perfect-residue minimal equation to regular-resolution comparison.
* HasGeometricKodairaFiber.two_components: I₂'s two nodes versus III's single length2 tangency.
* HasGeometricKodairaFiber.triangle: I₃'s three nodes versus IV's single triple meeting.
* HasGeometricKodairaFiber.smooth: I₀ smooth, neither singular multiplicative nor additive.

* DegenerateFiber: the full gcd/indecomposable-divisor predicate for elliptic and quasielliptic
  fibrations; no reduction-only substitute is defined.
* DegenerateFiber.multiple: every multiple fiber is degenerate.
* DegenerateFiber.elliptic_iff: multiple or singular indecomposable divisor.
* DegenerateFiber.quasielliptic_iff: multiple or reducible indecomposable divisor.
* DegenerateFiber.simple_smooth: simple smooth elliptic fiber is not degenerate.
* DegenerateFiber.double_smooth: double smooth fiber is degenerate despite smooth reduction.
* DegenerateFiber.simple_cusp: simple irreducible quasielliptic cusp is not degenerate.

## Layer theorem signatures requiring those missing geometric conditions

The following packet theorem targets are stated exactly in the reader. They cannot yet be
given full Lean forms without the omitted supplier objects and hypotheses. The global Ferrand
scheme-existence signature appears above; these names locate all remaining named targets.

* G.0/affine-existence: ferrand_affine_existence above is now the full actual Scheme form;
  universality against algebraic-space targets remains in the new space ledger below.
* G.0/conductor-square: the canonical conductor pullback and geometric quotient comparison.
* G.1/canonical-type-classification: full geometric Kodaira incidence, not just the root graph.
* G.1/five-f2-classes: actual pointed elliptic-curve isomorphism classes, not coefficient equality.
* G.2/transverse-divisor: regular horizontal DVR Cartier divisor, intersection Spec k, length m.
* G.2/multiple-fiber-isogeny: genuine good-reduction elliptic schemes and regular torsor models,
  with henselization and Raynaud (N)* hypotheses retained.
* G.2/llr-kodaira-comparison: algebraically closed residue field, actual period and symbol mT.
* G.3/rational-canonical: relative/absolute dualizing sheaves and the section intersection −1.
* G.3/even-complement: geometric Picard realization in the existing IntegralLattice carrier.
* G.3/relative-cubic-contraction: actual evaluation map and normal cubic, contracting vertical
  components; relative very ampleness belongs to the contracted cubic, not the regular surface.
* G.3/quasielliptic-characteristic: regular nonsmooth generic fiber, allowed symbols and genuine
  Picard/section-group comparison in characteristic2 or3.
* G.4/picard-point-count: resolved smooth geometrically rational surface of Picard rank10,
  actual rational points, geometric Frobenius and cycle-class comparison.
* G.4/additive-graph-rigidity: full component/incidence descent with source conditions(ii),(iii),(v).
* G.4/picard-constancy-criterion: all five hypotheses plus the actual fiber point sum25.
* G.4/large-fiber: constant Picard, at most one semistable-or-smooth-supersingular rational fiber.
* G.6/completeness: every normalized tuple has a mathematical rejection or equivalence witness,
  every candidate has a regular-model certificate, and surviving classes are pairwise distinct.
* G.6/nonzero-j-classification: conditional on that completeness certificate, eleven classes.
* G.6/zero-j-classification: conditional on that completeness certificate, three classes.

BoundedWeierstrass.toCurve is the actual projection above. All bounded-equation and candidate
API names and examples have actual signatures. The model certificate lemma contracts, Lang
configuration inputs and remaining source lemmas are reader targets with explicit proof gaps;
they are not claimed to follow from the polynomial prototypes.
-/

/-!
## Finite algebraic-space pinching: exact continuation omissions

No AlgebraicSpace carrier or pinching/descent export was found in the pinned Mathlib or
TauCeti algebraic-geometry source trees and declaration index. Do not invent one, substitute
Scheme for it, or encode the missing geometric conditions as arbitrary proposition fields.
The full mathematical forms are in the packet/reader, with the SF.1/SF.3 request closure.

The following names are OMITTED signatures, not declarations or compilable examples:
* FerrandPushout.pinching_etale_cover: For algebraic spaces over a scheme S, with i:Z→Y closed and g:Z→Z′ finite, there are indexed affine schemes Zα,Yα,Z′α, étale covers of Y and Z′, and specified cartesian identifications Zα=Z×Y Yα=Z×Z′ Z′α. Thus the datum has a componentwise cartesian affine étale covering. Neither Noetherian nor quasi-separated hypotheses are required.
* FerrandPushout.affine_space_hom_injective: Let p:B→C be surjective, q:A′→C finite, A=B×C A′, and P=Spec A. For any algebraic S-space T, restriction HomS(P,T)→HomS(Spec B,T)×HomS(Spec C,T)HomS(Spec A′,T) is injective.
* FerrandPushout.affine_space_hom_surjective: For the affine datum and P of affine-space-hom-injective and every algebraic S-space T, each compatible pair of maps Spec B→T and Spec A′→T extends to a map P→T.
* FerrandPushout.etale_relation: Suppose D1⇉D0 is an étale equivalence relation of finite pinching data, every componentwise square is cartesian, and D0,D1 admit compatible open affine coverings. Their schematic pushouts P1⇉P0 form an étale equivalence relation.
* FerrandPushout.overlap_isScheme: Let D0 be the disjoint union of the compatible affine étale charts of a finite pinching datum D and put D1=D0×D D0 componentwise. Then D1 admits a compatible open affine covering, so its pinching pushout P1 is a scheme. These opens are cartesian in all three components.
* FerrandPushout.exists_algebraicSpace: For algebraic spaces Y,Z,Z′ over a scheme S, a closed immersion i:Z→Y and a finite morphism g:Z→Z′ have a categorical pushout P=Y⊔Z Z′ in algebraic S-spaces, with affine canonical maps Y→P and Z′→P. No Noetherian, quasi-separated, reduced, radicial or scheme affine-neighborhood hypothesis is imposed.
* FerrandPushout.space_isPullback: For the effective finite pinching pushout P, the canonical square Z→Y, Z→Z′, Y→P, Z′→P is cartesian in algebraic spaces, including nonreduced Z.
* FerrandPushout.space_geometric: The effective finite pinching square satisfies the general GeometricPushout predicate: the underlying topological space is the quotient pushout and, on the small étale site of P, O_P≅a_*O_Y×c_*O_Z b_*O_Z′, where c=ai=bg. In particular every affine étale U→P gives the corresponding pullback of section rings on its three inverse images.
* FerrandPushout.space_isFinite: For the effective finite pinching P of algebraic-space-existence, the canonical map a:Y→P is finite.
* FerrandPushout.space_closed_complement: For the effective finite pinching P, b:Z′→P is a closed immersion and the induced Y∖Z→P∖b(Z′) is an isomorphism of open algebraic spaces.
* FerrandPushout.space_flat_baseChange: For an effective finite pinching P and any flat algebraic-space morphism F→P, the canonical comparison from the pinching pushout of the three pullbacks to F is an isomorphism. In particular these pullbacks realize the same geometric square; no arbitrary nonflat compatibility is asserted.
* FerrandPushout.isScheme_iff: For a finite pinching datum whose three components Y,Z,Z′ are schemes, its algebraic-space pushout P is a scheme if and only if for every point z′∈Z′ the finite set i(g⁻¹(z′)) lies in an affine open of Y. Under this condition the canonical scheme pushout agrees with P, including universality against algebraic-space targets.
* FerrandPushout.affine_space_compat: For surjective B→C and finite A′→C, the algebraic-space pushout is canonically Spec(B×_C A′), and the Hom comparison is bijective for every algebraic-space target.
* FerrandPushout.no_affine_neighbourhood: If a k-scheme Y has two distinct closed k-points with no common affine open, pinching their disjoint union to Spec k produces an algebraic space which is not a scheme.

FerrandPushout.exists_algebraicSpace and FerrandPushout.isScheme_iff are also the two new
reserved-key API items. They share their single packet declarations, not duplicate theorems.
The two test contracts above remain omissions, not Scheme-only substitutes for space tests.
GeometricPushout above is the actual Scheme specialization; the general algebraic-space
extension must use its small étale structure sheaf, not only Zariski-open section rings.
The affine theorem above closes the old affine-signature omission only. This file remains
NOT COMPILED at either pin, with every proof a prototype.
-/


/- The finite F₂ continuation below has native types for all twelve added nodes.
No arbitrary genus-one scheme presentation or geometric ordinarity predicate is
asserted by these signatures. The pre-existing omission ledger remains binding.
This continuation was not compiled: there is no existing build at both pins. -/
namespace TauCeti.GenusOne

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-models
/-- The source E_(i+1) in native coefficient order (1,2,3,4,6). -/
def F2Model : Fin 5 → WeierstrassCurve (ZMod 2) :=
  ![⟨0,1,1,0,1⟩, ⟨1,1,0,1,0⟩, ⟨0,0,1,0,0⟩,
    ⟨1,0,0,1,0⟩, ⟨0,1,1,0,0⟩]

theorem F2Model.coefficients :
    F2Model 0 = ⟨0,1,1,0,1⟩ ∧ F2Model 1 = ⟨1,1,0,1,0⟩ ∧
    F2Model 2 = ⟨0,0,1,0,0⟩ ∧ F2Model 3 = ⟨1,0,0,1,0⟩ ∧
    F2Model 4 = ⟨0,1,1,0,0⟩ := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-discriminant
theorem f2_discriminant (W : WeierstrassCurve (ZMod 2)) :
    W.Δ = if W.a₁ = 0 then W.a₃ else W.a₆ + W.a₄ + W.a₃ * (W.a₄ + W.a₂) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-smooth-split
theorem f2_smooth_split (W : WeierstrassCurve (ZMod 2)) :
    W.Δ = 1 ↔ (W.a₁ = 0 ∧ W.a₃ = 1) ∨
      (W.a₁ = 1 ∧ W.a₆ = 1 + W.a₄ + W.a₃ * (W.a₄ + W.a₂)) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-change-formula
theorem f2_change_formula (W : WeierstrassCurve (ZMod 2))
    (C : WeierstrassCurve.VariableChange (ZMod 2)) :
    C.u = 1 ∧ (C • W).a₁ = W.a₁ ∧
    (C • W).a₂ = W.a₂ + C.s * W.a₁ + C.r + C.s ∧
    (C • W).a₃ = W.a₃ + C.r * W.a₁ ∧
    (C • W).a₄ = W.a₄ + C.s * W.a₃ + (C.t + C.r * C.s) * W.a₁ + C.r ∧
    (C • W).a₆ = W.a₆ + C.r * W.a₄ + C.r * W.a₂ + C.r +
      C.t * W.a₃ + C.t + C.r * C.t * W.a₁ := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-discriminants
theorem F2Model.discriminant (i : Fin 5) : (F2Model i).Δ = 1 := by sorry

instance F2Model.isElliptic (i : Fin 5) : (F2Model i).IsElliptic := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-counts
theorem F2Model.pointCount (i : Fin 5) : (F2Model i).pointCount = i.val + 1 := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-j
theorem F2Model.j (i : Fin 5) :
    (F2Model i).j = (![0,1,0,1,0] : Fin 5 → ZMod 2) i := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-orbit-witnesses
theorem F2Model.orbit_witnesses (W : WeierstrassCurve (ZMod 2)) (hW : W.Δ = 1) :
    ∃ (i : Fin 5) (C : WeierstrassCurve.VariableChange (ZMod 2)),
      C • W = F2Model i := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-orbit-disjoint
theorem F2Model.orbits_disjoint (i j : Fin 5) :
    (∃ C : WeierstrassCurve.VariableChange (ZMod 2), C • F2Model i = F2Model j) ↔
      i = j := by sorry

theorem F2Model.injective {i j : Fin 5} : F2Model i = F2Model j ↔ i = j := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-count-classifier
theorem f2_count_classifier (W V : WeierstrassCurve (ZMod 2))
    (hW : W.Δ = 1) (hV : V.Δ = 1) :
    W.pointCount = V.pointCount ↔
      ∃ C : WeierstrassCurve.VariableChange (ZMod 2), C • W = V := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-e4-double
theorem f2_e4_double
    (hP : (F2Model 3).toAffine.Nonsingular (1 : ZMod 2) 0)
    (hQ : (F2Model 3).toAffine.Nonsingular (0 : ZMod 2) 0) :
    let P := WeierstrassCurve.Affine.Point.some 1 0 hP
    let Q := WeierstrassCurve.Affine.Point.some 0 0 hQ
    P + P = Q ∧ Q ≠ 0 ∧ Q + Q = 0 := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-point-groups
theorem F2Model.point_group (i : Fin 5) :
    Nonempty ((F2Model i).toAffine.Point ≃+ ZMod (i.val + 1)) := by sorry

-- test: F2Model.test_three
example : F2Model 2 = (⟨0,0,1,0,0⟩ : WeierstrassCurve (ZMod 2)) := by sorry

-- test: F2Model.test_one_point
example : (¬ ∃ x y : ZMod 2, (F2Model 0).toAffine.Equation x y) ∧
    (F2Model 0).pointCount = 1 := by sorry

-- test: F2Model.test_same_j_distinct
example : (F2Model 0).j = 0 ∧ (F2Model 4).j = 0 ∧
    (F2Model 0).pointCount = 1 ∧ (F2Model 4).pointCount = 5 := by sorry

-- test: F2Model.test_singular_count
example :
    (⟨0,0,0,0,0⟩ : WeierstrassCurve (ZMod 2)).Δ = 0 ∧
    (⟨0,0,0,0,0⟩ : WeierstrassCurve (ZMod 2)).pointCount = 3 ∧
    (⟨0,0,0,0,0⟩ : WeierstrassCurve (ZMod 2)).pointCount = (F2Model 2).pointCount := by sorry

end TauCeti.GenusOne
