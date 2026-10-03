/-!
This file is not the roadmap and is not exhaustive. The companion roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers can converge
on names and signatures. Nothing here claims an implementation.

Pinned baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
TauCeti f790474821cf4256814db967cb154e7af3d0c369. The full combined file is NOT
COMPILED: required Tau Ceti artifacts are unavailable. An exact Mathlib-only affine
extraction is checked at the Mathlib pin; its warnings are inherited/new admitted planning declarations. The current
basis continuation stores actual prototype bodies in the immutable proof snapshot
linked in the handoff; all newly submitted bodies are admitted under PROTOCOL§13. Native proof bodies are planning prototypes, not implementation claims.

The packet is partial. Missing geometric conditions are explicitly omitted, never represented
by arbitrary proposition parameters or a definition of a proposition by `sorry`. The final
ledger names every API, example and layer theorem whose full signature needs supplier types.
The two partial data structures below are not substitutes for their mathematical definitions.
-/

import Mathlib.AlgebraicGeometry.Normalization
import Mathlib.AlgebraicGeometry.FunctionField
import Mathlib.RingTheory.LocalProperties.IntegrallyClosed
import Mathlib.AlgebraicGeometry.Stalk
import Mathlib.LinearAlgebra.Basis.Fin
import Mathlib.LinearAlgebra.FreeModule.Finite.Basic
import Mathlib.RingTheory.Flat.Basic
import Mathlib.LinearAlgebra.Dimension.StrongRankCondition
import Mathlib.AlgebraicGeometry.Birational.Birational
import Mathlib.RingTheory.IntegralClosure.IntegrallyClosed
import Mathlib.FieldTheory.RatFunc.Basic
import Mathlib.AlgebraicGeometry.EllipticCurve.Projective.Basic
import Mathlib.LinearAlgebra.Isomorphisms
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.Algebra.Module.Equiv.Basic
import Mathlib.Algebra.Algebra.Tower
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.FieldTheory.Finite.Extension
import Mathlib.FieldTheory.Finiteness
import Mathlib.Algebra.Polynomial.Degree.SmallDegree
import Mathlib.Algebra.Polynomial.SpecificDegree
import Mathlib.Algebra.Category.Ring.Constructions
import Mathlib.Algebra.QuadraticDiscriminant
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.AlgebraicGeometry.Limits
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.AlgebraicGeometry.Morphisms.OpenImmersion
import Mathlib.AlgebraicGeometry.Morphisms.QuasiSeparated
import Mathlib.AlgebraicGeometry.Morphisms.UniversallyClosed
import Mathlib.AlgebraicGeometry.Morphisms.UniversallyInjective
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.CategoryTheory.Limits.Shapes.Pullback.IsPullback.Defs
import Mathlib.RingTheory.Conductor
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.AlgebraicGeometry.IdealSheaf.Functorial
import Mathlib.AlgebraicGeometry.Morphisms.SchemeTheoreticallyDominant
import Mathlib.AlgebraicGeometry.Noetherian
import Mathlib.RingTheory.Flat.Localization
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass
import Mathlib.Algebra.Polynomial.Degree.Operations
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.Field.ZMod
import Mathlib.AlgebraicGeometry.EllipticCurve.VariableChange
import Mathlib.GroupTheory.SpecificGroups.Cyclic
import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.Point.VariableChange
import Mathlib.Data.Fin.VecNotation
import TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.Basic
import TauCeti.AlgebraicGeometry.Curves.StableReduction.Model.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.PointCount

import Mathlib.RingTheory.Finiteness.Subalgebra
import Mathlib.RingTheory.IntegralClosure.IntegrallyClosed
import Mathlib.RingTheory.Polynomial.IsIntegral
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.Algebra.MvPolynomial.Equiv
import Mathlib.Algebra.Polynomial.Degree.SmallDegree
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Algebra.Polynomial.RingDivision
import Mathlib.Algebra.Algebra.Subalgebra.Basic
import Mathlib.Tactic.Ring
import Mathlib.Tactic.NormNum
import Mathlib.Algebra.Polynomial.Basis
import Mathlib.LinearAlgebra.Basis.Prod
import Mathlib.Tactic.ComputeDegree
import Mathlib.Algebra.Polynomial.Degree.Lemmas
import Mathlib.Algebra.Polynomial.AlgebraMap
import Mathlib.Algebra.Algebra.Subalgebra.Lattice
import Mathlib.Tactic.LinearCombination
import Lean.Elab.Tactic.Omega

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry
open scoped Polynomial

universe u
noncomputable section

namespace Subring

/-- The largest ideal of B contained in the arbitrary subring A. -/
def conductor {B : Type u} [CommRing B] (A : Subring B) : Ideal B where
  carrier := {b | ∀ x : B, b * x ∈ A}
  zero_mem' := fun x => by
    rw [zero_mul]
    exact A.zero_mem
  add_mem' := fun ha hb x => by
    rw [add_mul]
    exact A.add_mem (ha x) (hb x)
  smul_mem' := fun r b hb x => by
    change (r * b) * x ∈ A
    rw [show r * b * x = b * (r * x) by ring]
    exact hb (r * x)

lemma conductor_mem {B : Type u} [CommRing B] (A : Subring B) (b : B) :
    b ∈ A.conductor ↔ ∀ x : B, b * x ∈ A := Iff.rfl

lemma conductor_le {B : Type u} [CommRing B] (A : Subring B) :
    (A.conductor : Set B) ⊆ A := fun _ hb => by simpa using hb 1

lemma conductor_greatest {B : Type u} [CommRing B] (A : Subring B) (I : Ideal B) :
    I ≤ A.conductor ↔ (I : Set B) ⊆ A := by
  constructor
  · intro h b hb
    exact conductor_le A (h hb)
  · intro h b hb x
    exact h (I.mul_mem_right x hb)

lemma conductor_mono {B : Type u} [CommRing B] {A A' : Subring B} (h : A ≤ A') :
    A.conductor ≤ A'.conductor := fun _ hb x => h (hb x)

lemma conductor_adjoin (R B : Type u) [CommRing R] [CommRing B] [Algebra R B]
    (x : B) :
    (Algebra.adjoin R ({x} : Set B)).toSubring.conductor = _root_.conductor R x := rfl

-- Subring.conductor_top
example {B : Type u} [CommRing B] : (⊤ : Subring B).conductor = ⊤ := by
  ext b
  simp [conductor]

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
    (algebraMap k E).range.conductor = ⊥ := by
  ext b
  change (∀ x : E, b * x ∈ (algebraMap k E).range) ↔ b = 0
  constructor
  · intro hb
    by_contra hne
    apply h
    intro y
    have hy := hb (b⁻¹ * y)
    simpa [← mul_assoc, hne] using hy
  · rintro rfl x
    simp

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

/-- Finite Ferrand pinching or the full Scheme case of Witaszek 2.17 and 2.25.
Representability is automatic in Scheme. The second alternative is not assumed finite. -/
lemma lift (h : GeometricPushout i g a b)
    (hdatum : (IsClosedImmersion i ∧ IsFinite g) ∨
      (QuasiCompact i ∧ QuasiSeparated i ∧
        UniversallyInjective g ∧ UniversallyClosed g ∧ Surjective g ∧
        UniversallyInjective a ∧ UniversallyClosed a ∧ Surjective a))
    {T : Scheme.{u}} (y : Y ⟶ T) (z : Z' ⟶ T) (hc : i ≫ y = g ≫ z) :
    ∃! m : P ⟶ T, a ≫ m = y ∧ b ≫ m = z := by sorry

/-- The actual three cartesian base changes and all maps of their induced square.
The first alternative is finite Ferrand pinching. The second is Witaszek's qcqs
universal-homeomorphism case; no finiteness is added to that alternative.
Universally closed, universally injective and surjective means universal
homeomorphism. Representability is automatic for the Scheme carrier.
Sources: Temkin--Tyomkin 3.2.4(ii), 6.3.2(i); Witaszek 2.17 and 2.23. -/
lemma flat_baseChange (h : GeometricPushout i g a b)
    (hdatum : (IsClosedImmersion i ∧ IsFinite g) ∨
      (QuasiCompact i ∧ QuasiSeparated i ∧
        UniversallyInjective g ∧ UniversallyClosed g ∧ Surjective g ∧
        UniversallyInjective a ∧ UniversallyClosed a ∧ Surjective a))
    {Z1 Y1 Z1' P1 : Scheme.{u}}
    (q : P1 ⟶ P) (hq : Flat q)
    (i1 : Z1 ⟶ Y1) (g1 : Z1 ⟶ Z1') (a1 : Y1 ⟶ P1) (b1 : Z1' ⟶ P1)
    (z : Z1 ⟶ Z) (y : Y1 ⟶ Y) (z' : Z1' ⟶ Z')
    (hc : i1 ≫ a1 = g1 ≫ b1)
    (hi : i1 ≫ y = z ≫ i) (hg : g1 ≫ z' = z ≫ g)
    (hY : IsPullback y a1 a q) (hZ' : IsPullback z' b1 b q)
    (hZ : IsPullback z (i1 ≫ a1) (i ≫ a) q) :
    GeometricPushout i1 g1 a1 b1 := by sorry

/-- Scheme specialization of Witaszek Definition 2.17. Under the retained qcqs
and universal-homeomorphism hypotheses the topological pushout condition is
a consequence, while the structure-sheaf pullback remains essential.
The right side is the actual section-ring condition on every open, not an
unconstrained predicate naming that condition. -/
lemma witaszek_iff (hc : i ≫ a = g ≫ b)
    [QuasiCompact i] [QuasiSeparated i]
    [UniversallyInjective g] [UniversallyClosed g] [Surjective g]
    [UniversallyInjective a] [UniversallyClosed a] [Surjective a] :
    GeometricPushout i g a b ↔
      ∀ U : P.Opens, IsPullback (a.app U) (b.app U)
        (i.appLE (a ⁻¹ᵁ U) ((i ≫ a) ⁻¹ᵁ U) (by sorry))
        (g.appLE (b ⁻¹ᵁ U) ((i ≫ a) ⁻¹ᵁ U) (by sorry)) := by sorry

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

-- Monomial witness for GeometricPushout.topological_not_geometric below.
example (k : Type u) [Field k] :
    Polynomial.X ^ 3 ∉
      Algebra.adjoin k ({Polynomial.X ^ 2, Polynomial.X ^ 5} : Set k[X]) := by sorry

-- GeometricPushout.topological_not_geometric: the full actual Scheme square.
-- Its section-ring pullback contains the compatible pair (X^3,0), missing from S.
example (k : Type u) [Field k] :
    let S : Subring k[X] :=
      (Algebra.adjoin k ({Polynomial.X ^ 2, Polynomial.X ^ 5} : Set k[X])).toSubring
    let I : Ideal k[X] := Ideal.span ({Polynomial.X ^ 2} : Set k[X])
    let p : k[X] →+* (k[X] ⧸ I) := Ideal.Quotient.mk I
    let q : k →+* (k[X] ⧸ I) := p.comp Polynomial.C
    let e : S →+* k := (Polynomial.evalRingHom (0 : k)).comp S.subtype
    let i := Spec.map (CommRingCat.ofHom p)
    let g := Spec.map (CommRingCat.ofHom q)
    let a := Spec.map (CommRingCat.ofHom S.subtype)
    let b := Spec.map (CommRingCat.ofHom e)
    IsPushout (Scheme.forgetToTop.map i) (Scheme.forgetToTop.map g)
        (Scheme.forgetToTop.map a) (Scheme.forgetToTop.map b) ∧
      (UniversallyInjective a ∧ UniversallyClosed a ∧ Surjective a) ∧
      (UniversallyInjective g ∧ UniversallyClosed g ∧ Surjective g) ∧
      ¬ GeometricPushout i g a b := by sorry

end GeometricPushout

namespace FerrandPushout

/-- Complements are actual open subschemes, specified by their open immersions
and image sets. The result is the unique scheme isomorphism commuting with
those immersions and a, not merely a bijection of the underlying complements.
Source: Temkin--Tyomkin 3.2.4(iii), 4.4.2(iii). -/
lemma complementIso (h : GeometricPushout i g a b)
    (hi : IsClosedImmersion i) (hg : IsFinite g)
    {U V : Scheme.{u}} (jU : U ⟶ Y) (jV : V ⟶ P)
    [IsOpenImmersion jU] [IsOpenImmersion jV]
    (hU : Set.range jU = (Set.range i)ᶜ)
    (hV : Set.range jV = (Set.range b)ᶜ) :
    ∃! e : U ≅ V, e.hom ≫ jV = jU ≫ a := by sorry

/-- The full affine conductor square in native Scheme and ring-map carriers.
No birational hypothesis is imposed. The finite, reduced and Noetherian
hypotheses match the geometric API, not the unconditional ring reconstruction.
Sources: Witaszek Definition 2.27; G.0/conductor-ring-cartesian and affine-existence. -/
lemma conductor {B : Type u} [CommRing B] [IsReduced B] [IsNoetherianRing B]
    (S : Subring B) [IsReduced S] [IsNoetherianRing S] (hfin : S.subtype.Finite) :
    GeometricPushout
      (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk S.conductor)))
      (Spec.map (CommRingCat.ofHom
        (Ideal.quotientMap S.conductor S.subtype le_rfl)))
      (Spec.map (CommRingCat.ofHom S.subtype))
      (Spec.map (CommRingCat.ofHom
        (Ideal.Quotient.mk (S.conductor.comap S.subtype)))) := by sorry

end FerrandPushout

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

The Scheme forms of GeometricPushout.lift, flat_baseChange, witaszek_iff,
FerrandPushout.complementIso and conductor, and the full topological_not_geometric test
now appear above. Their algebraic-space extensions remain in the SF.1/SF.3 boundary:
these Scheme forms do not replace small-etale-site statements or space-valued targets.

* GeometricPushout.nonsplit_node: the pinched proper curve, its normalization and conductor,
  the separable quadratic point and its two conjugate geometric branches.

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
* G.0/conductor-square: the affine form is FerrandPushout.conductor above; the native global
  ideal-sheaf, quotient-chart, cartesian, geometric/categorical and flat-recomputed forms
  now appear in the final continuation. Their elaboration and SF.0 dependencies are unchecked.
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
Historical receipt for this earlier block: NOT COMPILED at either pin. The current
check covers only the actual Subring and final QuadraticPinch affine namespaces.
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

/-!
Global Scheme conductor continuation, Codex codex-5ebb6f, 2 October 2026.
All signatures below are UNCOMPILED at the pins. They use native rings, modules,
IdealSheafData, quotient-chart isomorphisms and Scheme maps. The generic finite-module
flat-annihilator export and exact affine tensor/localization adapters remain SF.0 requests.
The stronger finite schematically dominant statement is derived, not a verbatim
attribution to Witaszek's reduced Noetherian finite-surjective definition.
-/
namespace TauCeti.GenusOne.FerrandPushout

open scoped TensorProduct

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.0/conductor-annihilator
lemma conductor_eq_annihilator {A B : Type u} [CommRing A] [CommRing B] [Algebra A B] :
    ((algebraMap A B).range.conductor).comap (algebraMap A B) =
      Module.annihilator A (B ⧸ Submodule.span A ({1} : Set B)) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.0/conductor-finite-flat-base-change
lemma conductor_flat_baseChange {A B F : Type u}
    [CommRing A] [CommRing B] [CommRing F] [Algebra A B] [Algebra A F]
    [Module.Finite A B] [Module.Flat A F] (hf : Function.Injective (algebraMap A B)) :
    let fF := (Algebra.TensorProduct.includeRight : F →ₐ[A] B ⊗[A] F).toRingHom
    Function.Injective fF ∧
      ((((algebraMap A B).range.conductor).comap (algebraMap A B)).map
        (algebraMap A F) = (fF.range.conductor).comap fF) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.0/conductor-finite-localization
lemma conductor_localization {A B L M : Type u}
    [CommRing A] [CommRing B] [CommRing L] [CommRing M]
    [Algebra A B] [Algebra A L] [Algebra B M]
    (S : Submonoid A) [IsLocalization S L]
    [IsLocalization (S.map (algebraMap A B)) M]
    [Module.Finite A B] (hf : Function.Injective (algebraMap A B)) :
    let fS : L →+* M := IsLocalization.map M (algebraMap A B) (by
      intro s hs
      exact ⟨s, hs, rfl⟩)
    ((((algebraMap A B).range.conductor).comap (algebraMap A B)).map
      (algebraMap A L)) = (fS.range.conductor).comap fS := by sorry

variable {Y P : Scheme.{u}}

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.0/conductor-ideal-sheaf
/-- Native largest-compatible-family construction. Its displayed chart formula below
requires the finite localization proof: ofIdeals alone does not supply that formula. -/
def conductorIdealSheaf (f : Y ⟶ P) [IsFinite f] [IsSchemeTheoreticallyDominant f] :
    P.IdealSheafData :=
  Scheme.IdealSheafData.ofIdeals
    (fun U => ((f.app U).hom.range.conductor).comap (f.app U).hom)

namespace ConductorIdealSheaf

lemma mem_affine (f : Y ⟶ P) [IsFinite f] [IsSchemeTheoreticallyDominant f]
    (U : P.affineOpens) (a : Γ(P, U)) :
    a ∈ (conductorIdealSheaf f).ideal U ↔
      ∀ b : Γ(Y, f ⁻¹ᵁ U), (f.app U).hom a * b ∈ (f.app U).hom.range := by sorry

lemma greatest (f : Y ⟶ P) [IsFinite f] [IsSchemeTheoreticallyDominant f]
    (K : P.IdealSheafData) :
    K ≤ conductorIdealSheaf f ↔
      ∀ (U : P.affineOpens) (a : Γ(P, U)), a ∈ K.ideal U →
        ∀ b : Γ(Y, f ⁻¹ᵁ U), (f.app U).hom a * b ∈ (f.app U).hom.range := by sorry

lemma affine_compat (f : Y ⟶ P) [IsFinite f] [IsSchemeTheoreticallyDominant f]
    [IsAffine P] :
    conductorIdealSheaf f =
      Scheme.IdealSheafData.ofIdealTop
        (f.appTop.hom.range.conductor.comap f.appTop.hom) := by sorry

-- ConductorIdealSheaf.test_identity
example (P : Scheme.{u}) :
    conductorIdealSheaf (𝟙 P) = ⊤ ∧
      IsEmpty (conductorIdealSheaf (𝟙 P)).subscheme := by sorry

-- ConductorIdealSheaf.test_cusp: retain the full conductor, not its radical in k[X].
example (k : Type u) [Field k] :
    let S := (Algebra.adjoin k ({Polynomial.X ^ 2, Polynomial.X ^ 3} : Set k[X])).toSubring
    let f := Spec.map (CommRingCat.ofHom S.subtype)
    letI : IsFinite f := by sorry
    letI : IsSchemeTheoreticallyDominant f := by sorry
    let U : (Spec (.of S)).affineOpens := ⟨⊤, isAffineOpen_top (Spec (.of S))⟩
    (conductorIdealSheaf f).ideal U =
      ((Ideal.span ({Polynomial.X ^ 2} : Set k[X])).comap S.subtype).comap
        (Scheme.ΓSpecIso (.of S)).hom.hom ∧
      S.conductor = Ideal.span ({Polynomial.X ^ 2} : Set k[X]) := by sorry

-- ConductorIdealSheaf.test_field_extension
example (k E : Type u) [Field k] [Field E] [Algebra k E] [Module.Finite k E]
    (hproper : ¬ Function.Surjective (algebraMap k E)) :
    let f := Spec.map (CommRingCat.ofHom (algebraMap k E))
    letI : IsFinite f := by sorry
    letI : IsSchemeTheoreticallyDominant f := by sorry
    conductorIdealSheaf f = ⊥ := by sorry

-- ConductorIdealSheaf.test_affine_compat
example (f : Y ⟶ P) [IsFinite f] [IsSchemeTheoreticallyDominant f] [IsAffine P] :
    (conductorIdealSheaf f).ideal ⟨⊤, isAffineOpen_top P⟩ =
      f.appTop.hom.range.conductor.comap f.appTop.hom := by sorry

end ConductorIdealSheaf

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.0/conductor-affine-quotients
lemma conductor_affine_quotients (f : Y ⟶ P)
    [IsFinite f] [IsSchemeTheoreticallyDominant f] (U : P.affineOpens) :
    let I := conductorIdealSheaf f
    let J := I.comap f
    let V : Y.affineOpens := ⟨f ⁻¹ᵁ U, U.2.preimage f⟩
    I.ideal U = (f.app U).hom.range.conductor.comap (f.app U).hom ∧
      J.ideal V = (f.app U).hom.range.conductor ∧
      I.subschemeι.app U =
        CommRingCat.ofHom (Ideal.Quotient.mk (I.ideal U)) ≫ (I.subschemeObjIso U).inv ∧
      J.subschemeι.app V =
        CommRingCat.ofHom (Ideal.Quotient.mk (J.ideal V)) ≫ (J.subschemeObjIso V).inv := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.0/conductor-induced-map
def conductorMap (f : Y ⟶ P) [IsFinite f] [IsSchemeTheoreticallyDominant f] :
    ((conductorIdealSheaf f).comap f).subscheme ⟶ (conductorIdealSheaf f).subscheme :=
  ((conductorIdealSheaf f).comapIso f).hom ≫
    pullback.snd f (conductorIdealSheaf f).subschemeι

lemma conductorMap_square (f : Y ⟶ P) [IsFinite f] [IsSchemeTheoreticallyDominant f] :
    ((conductorIdealSheaf f).comap f).subschemeι ≫ f =
      conductorMap f ≫ (conductorIdealSheaf f).subschemeι := by sorry

lemma conductorMap_isPullback (f : Y ⟶ P)
    [IsFinite f] [IsSchemeTheoreticallyDominant f] :
    IsPullback ((conductorIdealSheaf f).comap f).subschemeι (conductorMap f)
      f (conductorIdealSheaf f).subschemeι := by sorry

lemma conductorMap_isFinite (f : Y ⟶ P) [IsFinite f] [IsSchemeTheoreticallyDominant f] :
    IsFinite (conductorMap f) := by sorry

-- conductorMap.test_identity
example (P : Scheme.{u}) : IsIso (conductorMap (𝟙 P)) := by sorry

-- conductorMap.test_cusp: the overlap is a double point, although C is reduced.
example (k : Type u) [Field k] :
    let S := (Algebra.adjoin k ({Polynomial.X ^ 2, Polynomial.X ^ 3} : Set k[X])).toSubring
    let f := Spec.map (CommRingCat.ofHom S.subtype)
    letI : IsFinite f := by sorry
    letI : IsSchemeTheoreticallyDominant f := by sorry
    let I := conductorIdealSheaf f
    ¬ IsReduced (I.comap f).subscheme ∧ IsReduced I.subscheme := by sorry

-- conductorMap.test_field_extension: whole conductors do not make g an isomorphism.
example (k E : Type u) [Field k] [Field E] [Algebra k E] [Module.Finite k E]
    (hproper : ¬ Function.Surjective (algebraMap k E)) :
    let f := Spec.map (CommRingCat.ofHom (algebraMap k E))
    letI : IsFinite f := by sorry
    letI : IsSchemeTheoreticallyDominant f := by sorry
    let I := conductorIdealSheaf f
    IsIso I.subschemeι ∧ IsIso (I.comap f).subschemeι ∧ ¬ IsIso (conductorMap f) := by sorry

-- conductorMap.test_affine_map: transport the actual map through both native quotient charts.
example (f : Y ⟶ P) [IsFinite f] [IsSchemeTheoreticallyDominant f] (U : P.affineOpens) :
    let I := conductorIdealSheaf f
    let J := I.comap f
    let V : Y.affineOpens := ⟨f ⁻¹ᵁ U, U.2.preimage f⟩
    (I.subschemeObjIso U).inv ≫
        (conductorMap f).appLE (I.subschemeι ⁻¹ᵁ U) (J.subschemeι ⁻¹ᵁ V) (by sorry) ≫
        (J.subschemeObjIso V).hom =
      CommRingCat.ofHom (Ideal.quotientMap (J.ideal V) (f.app U).hom (by sorry)) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.0/conductor-scheme-geometric
theorem conductor_global_geometric (f : Y ⟶ P)
    [IsFinite f] [IsSchemeTheoreticallyDominant f] :
    GeometricPushout ((conductorIdealSheaf f).comap f).subschemeι (conductorMap f)
      f (conductorIdealSheaf f).subschemeι := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.0/conductor-scheme-pushout
theorem conductor_global_isPushout (f : Y ⟶ P)
    [IsFinite f] [IsSchemeTheoreticallyDominant f] :
    IsPushout ((conductorIdealSheaf f).comap f).subschemeι (conductorMap f)
      f (conductorIdealSheaf f).subschemeι := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.0/conductor-scheme-flat-comparison
theorem conductor_global_flat_comparison (f : Y ⟶ P)
    [IsFinite f] [IsSchemeTheoreticallyDominant f]
    {T : Scheme.{u}} (q : T ⟶ P) [Flat q] :
    conductorIdealSheaf (pullback.snd f q) = (conductorIdealSheaf f).comap q := by sorry

-- FerrandPushout.conductor_global: Witaszek's precise source hypotheses.
lemma conductor_global (f : Y ⟶ P) [IsFinite f] [Surjective f]
    [IsReduced Y] [IsReduced P] [IsNoetherian Y] [IsNoetherian P] :
    letI : IsSchemeTheoreticallyDominant f := IsSchemeTheoreticallyDominant.of_isDominant f
    GeometricPushout ((conductorIdealSheaf f).comap f).subschemeι (conductorMap f)
        f (conductorIdealSheaf f).subschemeι ∧
      IsPushout ((conductorIdealSheaf f).comap f).subschemeι (conductorMap f)
        f (conductorIdealSheaf f).subschemeι ∧
      IsPullback ((conductorIdealSheaf f).comap f).subschemeι (conductorMap f)
        f (conductorIdealSheaf f).subschemeι ∧
      ∀ (T : Scheme.{u}) (q : T ⟶ P) (hq : Flat q),
        letI : Flat q := hq
        conductorIdealSheaf (pullback.snd f q) = (conductorIdealSheaf f).comap q := by sorry

-- Boundary witness: the nonflat cusp quotient loses the native inclusion.
example (k : Type u) [Field k] :
    let S := (Algebra.adjoin k ({Polynomial.X ^ 2, Polynomial.X ^ 3} : Set k[X])).toSubring
    let u : S := ⟨Polynomial.X ^ 2, by sorry⟩
    let v : S := ⟨Polynomial.X ^ 3, by sorry⟩
    let I := Ideal.span ({u} : Set S)
    let K := Ideal.span ({Polynomial.X ^ 2} : Set k[X])
    let f : (S ⧸ I) →+* (k[X] ⧸ K) := Ideal.quotientMap K S.subtype (by sorry)
    Ideal.Quotient.mk I v ≠ 0 ∧ f (Ideal.Quotient.mk I v) = 0 ∧
      ¬ Function.Injective f := by sorry

end TauCeti.GenusOne.FerrandPushout

/-!
Quadratic pinching continuation, Codex codex-rtOQ9t, 2 October 2026.
The full combined file is uncompiled. The Mathlib-only affine extraction now compiles;
its exact scope and proof-axiom audit are recorded in the current handoff.
These are concrete native carrier forms; all implementation statuses remain unchecked.
The final ledger retains the exact geometric interfaces that cannot yet be stated.
-/
namespace TauCeti.GenusOne.QuadraticPinch

variable {k : Type u} [Field k]

-- node: G.1/quadratic-pinch-algebra
/-- The preimage of the constants in the native polynomial quotient. -/
def algebra (q : k[X]) : Subalgebra k k[X] :=
  (⊥ : Subalgebra k (AdjoinRoot q)).comap (AdjoinRoot.mkₐ q)

lemma mem_algebra (q f : k[X]) :
    f ∈ algebra q ↔ ∃ c : k, ∃ h : k[X], f = Polynomial.C c + q * h := by
  change AdjoinRoot.mkₐ q f ∈ (⊥ : Subalgebra k (AdjoinRoot q)) ↔ _
  rw [Algebra.mem_bot]
  constructor
  · rintro ⟨c, hc⟩
    have hdiv : q ∣ f - Polynomial.C c := AdjoinRoot.mk_eq_mk.mp hc.symm
    obtain ⟨h, hh⟩ := hdiv
    exact ⟨c, h, by rw [← hh]; ring⟩
  · rintro ⟨c, h, rfl⟩
    exact ⟨c, by simp⟩

lemma constants (q : k[X]) (c : k) : Polynomial.C c ∈ algebra q := by
  exact (mem_algebra q _).mpr ⟨c, 0, by simp⟩

-- node: G.1/quadratic-normal-form-exists
lemma exists_normal_form (a b : k) (h : k[X]) :
    let q : k[X] := Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b
    ∃ P Q : k[X], h = P.comp q + Polynomial.X * Q.comp q := by
  dsimp
  let q : k[X] := Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b
  change ∃ P Q : k[X], h = P.comp q + Polynomial.X * Q.comp q
  induction h using Polynomial.induction_on with
  | C c => exact ⟨Polynomial.C c, 0, by simp⟩
  | add f g hf hg =>
    obtain ⟨P, Q, hP⟩ := hf
    obtain ⟨R, S, hR⟩ := hg
    exact ⟨P + R, Q + S, by simp only [Polynomial.add_comp]; rw [hP, hR]; ring⟩
  | monomial n c ih =>
    obtain ⟨P, Q, hP⟩ := ih
    refine ⟨(Polynomial.X - Polynomial.C b) * Q,
      P - Polynomial.C a * Q, ?_⟩
    rw [pow_succ, ← mul_assoc, hP]
    simp only [Polynomial.mul_comp, Polynomial.sub_comp, Polynomial.X_comp,
      Polynomial.C_comp]
    dsimp [q]
    ring

-- node: G.1/quadratic-normal-form-degrees
lemma normal_form_degrees (q P Q : k[X]) (hd : q.natDegree = 2) (hQ : Q ≠ 0) :
    (P.comp q).natDegree = 2 * P.natDegree ∧
      (Polynomial.X * Q.comp q).natDegree = 2 * Q.natDegree + 1 := by
  have hn : Q.comp q ≠ 0 := by
    intro hz
    rcases Polynomial.comp_eq_zero_iff.mp hz with hz | ⟨_, hc⟩
    · exact hQ hz
    · have hh := congrArg Polynomial.natDegree hc
      simp [hd] at hh
  constructor
  · rw [Polynomial.natDegree_comp, hd, Nat.mul_comm]
  · rw [Polynomial.natDegree_X_mul hn, Polynomial.natDegree_comp, hd, Nat.mul_comm]

-- node: G.1/quadratic-normal-form-injective
lemma normal_form_injective (q : k[X]) (hd : q.natDegree = 2) :
    Function.Injective (fun z : k[X] × k[X] => z.1.comp q + Polynomial.X * z.2.comp q) := by
  have hzero (P Q : k[X]) (hz : P.comp q + Polynomial.X * Q.comp q = 0) :
      P = 0 ∧ Q = 0 := by
    have hQ : Q = 0 := by
      by_contra hne
      obtain ⟨hPdeg, hQdeg⟩ := normal_form_degrees q P Q hd hne
      have he : P.comp q = -(Polynomial.X * Q.comp q) := eq_neg_of_add_eq_zero_left hz
      have hh := congrArg Polynomial.natDegree he
      rw [Polynomial.natDegree_neg, hPdeg, hQdeg] at hh
      omega
    have hPcomp : P.comp q = 0 := by simpa [hQ] using hz
    have hP : P = 0 := by
      rcases Polynomial.comp_eq_zero_iff.mp hPcomp with hp | ⟨_, hc⟩
      · exact hp
      · have hh := congrArg Polynomial.natDegree hc
        simp [hd] at hh
    exact ⟨hP, hQ⟩
  intro z w he
  have hz : (z.1 - w.1).comp q + Polynomial.X * (z.2 - w.2).comp q = 0 := by
    simp only [Polynomial.sub_comp]
    linear_combination he
  obtain ⟨hP, hQ⟩ := hzero _ _ hz
  exact Prod.ext (sub_eq_zero.mp hP) (sub_eq_zero.mp hQ)

-- node: G.1/quadratic-pinch-normal-form-injective
lemma pinch_normal_form_injective (q : k[X]) (hd : q.natDegree = 2) :
    Function.Injective (fun z : k[X] × k[X] =>
      z.1.comp q + Polynomial.X * q * z.2.comp q) := by
  intro z w he
  have hn := normal_form_injective q hd (a₁ := (z.1, Polynomial.X * z.2))
    (a₂ := (w.1, Polynomial.X * w.2))
  have hp : (z.1, Polynomial.X * z.2) = (w.1, Polynomial.X * w.2) := by
    apply hn
    simpa only [Polynomial.mul_comp, Polynomial.X_comp, mul_assoc] using he
  have hP := congrArg (fun r : k[X] × k[X] => r.1) hp
  have hQ := congrArg (fun r : k[X] × k[X] => r.2) hp
  exact Prod.ext hP (mul_left_cancel₀ Polynomial.X_ne_zero hQ)

-- API: QuadraticPinch.pinch_spanning
lemma pinch_spanning (a b : k) (f : k[X]) :
    let q : k[X] := Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b
    f ∈ algebra q → ∃ P Q : k[X], f = P.comp q + Polynomial.X * q * Q.comp q := by
  dsimp
  let q : k[X] := Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b
  change f ∈ algebra q → ∃ P Q : k[X], f = P.comp q + Polynomial.X * q * Q.comp q
  intro hf
  obtain ⟨c, h, hh⟩ := (mem_algebra q f).mp hf
  obtain ⟨P, Q, hform⟩ := exists_normal_form a b h
  refine ⟨Polynomial.C c + Polynomial.X * P, Q, ?_⟩
  change h = P.comp q + Polynomial.X * Q.comp q at hform
  rw [hh, hform]
  simp only [Polynomial.add_comp, Polynomial.C_comp, Polynomial.mul_comp, Polynomial.X_comp]
  ring

-- test: QuadraticPinch.test_normal_form_char2
example (h : (ZMod 2)[X]) :
    let q : (ZMod 2)[X] := Polynomial.X ^ 2 + Polynomial.X + 1
    ∃ P Q : (ZMod 2)[X], h = P.comp q + Polynomial.X * Q.comp q := by
  simpa using exists_normal_form (1 : ZMod 2) 1 h

-- test: QuadraticPinch.test_normal_form_inseparable
example :
    Function.Injective (fun z : (ZMod 2)[X] × (ZMod 2)[X] =>
      z.1.comp (Polynomial.X ^ 2) + Polynomial.X * Polynomial.X ^ 2 *
        z.2.comp (Polynomial.X ^ 2)) := by
  apply pinch_normal_form_injective
  simp

-- test: QuadraticPinch.test_linear_not_injective
example :
    ¬ Function.Injective (fun z : k[X] × k[X] => z.1.comp Polynomial.X +
      Polynomial.X * z.2.comp Polynomial.X) := by
  intro hi
  have he : ((Polynomial.X : k[X]), (0 : k[X])) = (0, 1) := hi (by simp)
  have hx := congrArg (fun r : k[X] × k[X] => r.1.coeff 1) he
  simp at hx

-- node: G.1/quadratic-pinch-generation; API: QuadraticPinch.generation
lemma generation (a b : k) :
    let q : k[X] := Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b
    algebra q = Algebra.adjoin k ({q, Polynomial.X * q} : Set k[X]) := by
  dsimp
  let q : k[X] := Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b
  let S := Algebra.adjoin k ({q, Polynomial.X * q} : Set k[X])
  change algebra q = S
  have hq : q ∈ S := Algebra.subset_adjoin (by simp)
  have hXq : Polynomial.X * q ∈ S := Algebra.subset_adjoin (by simp)
  have hc (P : k[X]) : P.comp q ∈ S := by
    have hm := (Polynomial.aeval (⟨q, hq⟩ : S) P).property
    simpa only [Polynomial.aeval_subalgebra_coe, ← Polynomial.comp_eq_aeval] using hm
  apply le_antisymm
  · intro f hf
    obtain ⟨c, h, hh⟩ := (mem_algebra q f).mp hf
    obtain ⟨P, Q, hform⟩ := exists_normal_form a b h
    change h = P.comp q + Polynomial.X * Q.comp q at hform
    rw [hh, hform]
    have he : Polynomial.C c + q * (P.comp q + Polynomial.X * Q.comp q) =
        Polynomial.C c + (q * P.comp q + (Polynomial.X * q) * Q.comp q) := by ring
    rw [he]
    exact S.add_mem (S.algebraMap_mem c) (S.add_mem (S.mul_mem hq (hc P))
      (S.mul_mem hXq (hc Q)))
  · apply Algebra.adjoin_le
    intro f hf
    rcases Set.mem_insert_iff.mp hf with rfl | hf
    · exact (mem_algebra q q).mpr ⟨0, 1, by simp⟩
    · have he : f = Polynomial.X * q := Set.mem_singleton_iff.mp hf
      rw [he]
      exact (mem_algebra q _).mpr ⟨0, Polynomial.X, by simp [mul_comm]⟩

-- test: QuadraticPinch.test_cusp
example : algebra (Polynomial.X ^ 2 : k[X]) =
    Algebra.adjoin k ({Polynomial.X ^ 2, Polynomial.X ^ 3} : Set k[X]) := by
  simpa [pow_succ, mul_assoc] using (generation (0 : k) 0)

-- Quadratic coordinate/basis continuation.
lemma quadratic_natDegree (a b : k) :
    (Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b).natDegree = 2 := by sorry

-- node: G.1/quadratic-pinch-coordinate-map
def coordinateMap (a b : k) :
    (k[X] × k[X]) →ₗ[k]
      algebra (Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b) := by sorry

lemma coordinateMap_coe (a b : k) (z : k[X] × k[X]) :
    let q : k[X] := Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b
    (coordinateMap a b z : k[X]) = z.1.comp q + Polynomial.X * q * z.2.comp q := by sorry

lemma coordinateMap_bijective (a b : k) : Function.Bijective (coordinateMap a b) := by sorry

-- node: G.1/quadratic-pinch-coordinates
def coordinates (a b : k) :
    (k[X] × k[X]) ≃ₗ[k]
      algebra (Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b) := by sorry

lemma coordinates_coe (a b : k) (z : k[X] × k[X]) :
    let q : k[X] := Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b
    (coordinates a b z : k[X]) = z.1.comp q + Polynomial.X * q * z.2.comp q := by sorry

lemma coordinates_symm_normal_form (a b : k)
    (f : algebra (Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b)) :
    let q : k[X] := Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b
    (f : k[X]) = ((coordinates a b).symm f).1.comp q +
      Polynomial.X * q * ((coordinates a b).symm f).2.comp q := by sorry

lemma coordinates_unique (a b : k)
    (f : algebra (Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b))
    (z : k[X] × k[X]) :
    let q : k[X] := Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b
    (f : k[X]) = z.1.comp q + Polynomial.X * q * z.2.comp q ↔
      (coordinates a b).symm f = z := by sorry

-- node: G.1/quadratic-pinch-basis
def basis (a b : k) : Module.Basis (ℕ ⊕ ℕ) k
    (algebra (Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b)) := by sorry

lemma basis_inl (a b : k) (n : ℕ) :
    let q : k[X] := Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b
    (basis a b (Sum.inl n) : k[X]) = q ^ n := by sorry

lemma basis_inr (a b : k) (n : ℕ) :
    let q : k[X] := Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b
    (basis a b (Sum.inr n) : k[X]) = Polynomial.X * q ^ (n + 1) := by sorry

-- node: G.1/quadratic-pinch-basis-repr
lemma basis_repr (a b : k)
    (f : algebra (Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b))
    (n : ℕ) :
    (basis a b).repr f (Sum.inl n) = ((coordinates a b).symm f).1.coeff n ∧
    (basis a b).repr f (Sum.inr n) = ((coordinates a b).symm f).2.coeff n := by sorry

lemma basis_reconstruction (a b : k)
    (f : algebra (Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b)) :
    Finsupp.linearCombination k (basis a b) ((basis a b).repr f) = f := by sorry

lemma basis_degrees (a b : k) (n : ℕ) :
    (basis a b (Sum.inl n) : k[X]).natDegree = 2 * n ∧
    (basis a b (Sum.inr n) : k[X]).natDegree = 2 * (n + 1) + 1 := by sorry

-- test: QuadraticPinch.test_basis_cusp
example (n : ℕ) :
    (basis (0 : k) 0 (Sum.inl n) : k[X]) = Polynomial.X ^ (2 * n) ∧
    (basis (0 : k) 0 (Sum.inr n) : k[X]) = Polynomial.X ^ (2 * n + 3) := by sorry

-- test: QuadraticPinch.test_coordinates_inseparable
example (P Q : (ZMod 2)[X]) :
    (coordinates (0 : ZMod 2) 0).symm (coordinates 0 0 (P, Q)) = (P, Q) := by sorry

-- test: QuadraticPinch.test_basis_char2_cross_term
example :
    (basis (1 : ZMod 2) 1 (Sum.inl 1) : (ZMod 2)[X]).coeff 1 = 1 := by sorry

-- test: QuadraticPinch.test_basis_unit_zero
example :
    (basis (0 : k) 0 (Sum.inl 0) : k[X]) = 1 ∧
    (coordinates (0 : k) 0).symm 0 = (0, 0) := by sorry

-- test: QuadraticPinch.test_coordinates_not_multiplicative
example :
    (coordinates (0 : k) 0 ((0, 1) * (0, 1)) : k[X]) ≠
      (coordinates (0 : k) 0 (0, 1) : k[X]) * (coordinates (0 : k) 0 (0, 1) : k[X]) := by sorry

-- test: QuadraticPinch.test_map_zero
example (a b : k) : coordinateMap a b (0, 0) = 0 := by sorry

-- test: QuadraticPinch.test_map_char2_generators
example :
    (coordinateMap (1 : ZMod 2) 1 (Polynomial.X, 0) : (ZMod 2)[X]) =
      Polynomial.X ^ 2 + Polynomial.X + 1 ∧
    (coordinateMap (1 : ZMod 2) 1 (0, 1) : (ZMod 2)[X]) =
      Polynomial.X * (Polynomial.X ^ 2 + Polynomial.X + 1) := by sorry

-- test: QuadraticPinch.test_map_not_identity
example : (coordinateMap (0 : k) 0 (Polynomial.X, 0) : k[X]) ≠ Polynomial.X := by sorry

-- test: QuadraticPinch.test_basis_no_degree_one
example (a b : k) (i : ℕ ⊕ ℕ) : (basis a b i : k[X]).natDegree ≠ 1 := by sorry


-- test: QuadraticPinch.test_split
example (h : (2 : k) ≠ 0) (f : k[X]) :
    f ∈ algebra (Polynomial.X ^ 2 - 1) ↔ f.eval 1 = f.eval (-1) := by sorry

-- test: QuadraticPinch.test_f4
example :
    let q : (ZMod 2)[X] := Polynomial.X ^ 2 + Polynomial.X + 1
    Polynomial.X ∉ algebra q ∧ q ∈ algebra q ∧ Polynomial.X * q ∈ algebra q := by sorry

-- node: G.1/quadratic-pinch-relation
/-- U is coordinate0, V coordinate1; the cubic term is retained. -/
def relation (a b : k) : MvPolynomial (Fin 2) k :=
  MvPolynomial.X 1 ^ 2 + MvPolynomial.C a * MvPolynomial.X 0 * MvPolynomial.X 1 +
    MvPolynomial.C b * MvPolynomial.X 0 ^ 2 - MvPolynomial.X 0 ^ 3

lemma relation_eval (a b : k) :
    let q : k[X] := Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b
    MvPolynomial.aeval ![q, Polynomial.X * q] (relation a b) = 0 := by
  dsimp
  simp [relation]
  ring

lemma relation_quadratic (a b : k) :
    relation a b + MvPolynomial.X 0 ^ 3 =
      MvPolynomial.X 1 ^ 2 + MvPolynomial.C a * MvPolynomial.X 0 * MvPolynomial.X 1 +
        MvPolynomial.C b * MvPolynomial.X 0 ^ 2 := by unfold relation; ring

lemma relation_origin (a b : k) :
    MvPolynomial.aeval (![0,0] : Fin 2 → k) (relation a b) = 0 := by simp [relation]

-- test: QuadraticPinch.test_relation_cusp
example : relation (0 : k) 0 = MvPolynomial.X 1 ^ 2 - MvPolynomial.X 0 ^ 3 := by simp [relation]

-- test: QuadraticPinch.test_relation_char2
example : relation (1 : ZMod 2) 1 =
    MvPolynomial.X 1 ^ 2 + MvPolynomial.X 0 * MvPolynomial.X 1 +
      MvPolynomial.X 0 ^ 2 - MvPolynomial.X 0 ^ 3 := by simp [relation]

-- test: QuadraticPinch.test_relation_cubic
example : MvPolynomial.aeval (![1,0] : Fin 2 → k) (relation (0 : k) 0) = -1 := by simp [relation]

-- node: G.1/quadratic-constant-remainder
lemma constant_remainder (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (c : k) (h : k[X]) :
    (Polynomial.C c + q * h) %ₘ q = Polynomial.C c := by
  rw [Polynomial.add_modByMonic, Polynomial.self_mul_modByMonic hq, add_zero]
  apply (Polynomial.modByMonic_eq_self_iff hq).mpr
  apply Polynomial.degree_C_le.trans_lt
  rw [Polynomial.degree_eq_natDegree hq.ne_zero, hd]
  norm_num

-- node: G.1/quadratic-remainder-scalar
lemma remainder_scalar (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (f : algebra q) : f.val %ₘ q = Polynomial.C ((f.val %ₘ q).coeff 0) := by
  obtain ⟨c, h, hf⟩ := (mem_algebra q f.val).mp f.property
  rw [hf, constant_remainder q hq hd]
  simp

-- node: G.1/quadratic-scalar-unique
lemma scalar_unique (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    {f : k[X]} {c d : k} {h j : k[X]}
    (hc : f = Polynomial.C c + q * h) (hj : f = Polynomial.C d + q * j) : c = d := by
  have hmod := congrArg (fun p : k[X] => p %ₘ q) (hc.symm.trans hj)
  rw [constant_remainder q hq hd, constant_remainder q hq hd] at hmod
  exact Polynomial.C_injective hmod

-- node: G.1/quadratic-linear-remainder
lemma linear_remainder (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (c : k) : (Polynomial.C c * Polynomial.X) %ₘ q = Polynomial.C c * Polynomial.X := by
  by_cases hc : c = 0
  · simp [hc]
  · apply (Polynomial.modByMonic_eq_self_iff hq).mpr
    rw [Polynomial.degree_C_mul_X hc, Polynomial.degree_eq_natDegree hq.ne_zero, hd]
    norm_num

-- acceptance: the degree-two quotient has a genuine nonconstant root.
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    Polynomial.X ∉ algebra q := by
  intro hm
  let f : algebra q := ⟨Polynomial.X, hm⟩
  have h := remainder_scalar q hq hd f
  have hX : (Polynomial.X : k[X]) %ₘ q = Polynomial.X := by
    simpa using linear_remainder q hq hd 1
  change (Polynomial.X : k[X]) %ₘ q = _ at h
  rw [hX] at h
  have hc := congrArg (fun p : k[X] => p.coeff 1) h
  simp at hc

-- acceptance: the zero quotient polynomial leaves only constants.
example : Polynomial.X ∉ algebra (0 : k[X]) := by
  intro h
  obtain ⟨c, j, hj⟩ := (mem_algebra 0 Polynomial.X).mp h
  have hc := congrArg (fun p : k[X] => p.coeff 1) hj
  simp at hc

-- acceptance: degree one makes the pinch all polynomials; degree two is essential.
example : (Polynomial.X : k[X]) ∈ algebra Polynomial.X :=
  (mem_algebra Polynomial.X Polynomial.X).mpr ⟨0, 1, by simp⟩

-- acceptance: the unit ideal prevents scalar uniqueness and residue recovery.
example : (Polynomial.C (1 : k)) %ₘ (1 : k[X]) ≠ Polynomial.C 1 := by simp

-- node: G.1/quadratic-pinch-residue
/-- Compute the unique scalar remainder, with the actual ring-map laws. -/
def residue (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) : algebra q →ₐ[k] k where
  toFun f := (f.val %ₘ q).coeff 0
  map_zero' := by simp
  map_one' := by
    change ((1 : k[X]) %ₘ q).coeff 0 = 1
    have hc : (1 : k[X]) %ₘ q = 1 := by simpa using constant_remainder q hq hd 1 0
    simp [hc]
  map_add' f g := by
    change ((f.val + g.val) %ₘ q).coeff 0 = _
    rw [Polynomial.add_modByMonic, Polynomial.coeff_add]
  map_mul' f g := by
    change ((f.val * g.val) %ₘ q).coeff 0 = _
    rw [Polynomial.mul_modByMonic, remainder_scalar q hq hd f,
      remainder_scalar q hq hd g, ← Polynomial.C_mul]
    have hc := constant_remainder q hq hd
      ((f.val %ₘ q).coeff 0 * (g.val %ₘ q).coeff 0) 0
    simpa using congrArg (fun p : k[X] => p.coeff 0) hc
  commutes' c := by
    change ((Polynomial.C c) %ₘ q).coeff 0 = c
    have hc := constant_remainder q hq hd c 0
    simpa using congrArg (fun p : k[X] => p.coeff 0) hc

lemma residue_normal_form (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (f : algebra q) (c : k) (h : k[X]) (hf : f.val = Polynomial.C c + q * h) :
    residue q hq hd f = c := by
  change (f.val %ₘ q).coeff 0 = c
  rw [hf, constant_remainder q hq hd]
  simp

lemma residue_surjective (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    Function.Surjective (residue q hq hd) := fun c =>
  ⟨algebraMap k (algebra q) c, (residue q hq hd).commutes c⟩

lemma residue_kernel (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    RingHom.ker (residue q hq hd).toRingHom =
      (Ideal.span ({q} : Set k[X])).comap (algebra q).val.toRingHom := by
  ext f
  change ((f.val %ₘ q).coeff 0 = 0) ↔ f.val ∈ Ideal.span {q}
  rw [Ideal.mem_span_singleton]
  constructor
  · intro h
    apply (Polynomial.modByMonic_eq_zero_iff_dvd hq).mp
    rw [remainder_scalar q hq hd f, h, Polynomial.C_0]
  · intro h
    rw [(Polynomial.modByMonic_eq_zero_iff_dvd hq).mpr h]
    simp

-- test: QuadraticPinch.test_residue_constant
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    residue q hq hd (algebraMap k (algebra q) 1) = 1 := (residue q hq hd).commutes 1

-- test: QuadraticPinch.test_residue_q
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) (hmem : q ∈ algebra q) :
    residue q hq hd ⟨q,hmem⟩ = 0 :=
  residue_normal_form q hq hd _ 0 1 (by simp)

-- test: QuadraticPinch.test_residue_tq
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (hmem : Polynomial.X * q ∈ algebra q) :
    residue q hq hd ⟨Polynomial.X * q,hmem⟩ = 0 :=
  residue_normal_form q hq hd _ 0 Polynomial.X (by simp [mul_comm])

-- Full bivariate presentation continuation.
-- node: G.1/quadratic-pinch-v-chart
noncomputable def inV : MvPolynomial (Fin 2) k ≃ₐ[k] k[X][X] := by sorry

-- node: G.1/quadratic-pinch-v-chart-u
lemma inV_U : inV (k := k) (MvPolynomial.X 0) = Polynomial.C Polynomial.X := by sorry

-- node: G.1/quadratic-pinch-v-chart-v
lemma inV_V : inV (k := k) (MvPolynomial.X 1) = Polynomial.X := by sorry

-- node: G.1/quadratic-pinch-v-chart-relation
lemma inV_relation (a b : k) :
    inV (relation a b) = Polynomial.X ^ 2 +
      Polynomial.C (Polynomial.C a * Polynomial.X) * Polynomial.X +
      Polynomial.C (Polynomial.C b * Polynomial.X ^ 2 - Polynomial.X ^ 3) := by sorry

-- node: G.1/quadratic-pinch-substitution
noncomputable def substitution (a b : k) : MvPolynomial (Fin 2) k →ₐ[k] k[X] := by sorry

-- node: G.1/quadratic-pinch-substitution-relation
lemma substitution_relation (a b : k) : substitution a b (relation a b) = 0 := by sorry

-- node: G.1/quadratic-pinch-substitution-chart
lemma substitution_inV (a b : k) (f : MvPolynomial (Fin 2) k) :
    let q := Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b
    substitution a b f =
      Polynomial.eval₂ (Polynomial.aeval q).toRingHom (Polynomial.X * q) (inV f) := by sorry

-- node: G.1/quadratic-pinch-v-relation-monic
lemma inV_relation_monic (a b : k) : (inV (relation a b)).Monic := by sorry

-- node: G.1/quadratic-pinch-v-relation-degree
lemma inV_relation_natDegree (a b : k) : (inV (relation a b)).natDegree = 2 := by sorry

-- node: G.1/quadratic-pinch-v-remainder
lemma inV_remainder_normal_form (a b : k) (F : k[X][X]) :
    ∃ P Q : k[X], F %ₘ (inV (relation a b)) =
      Polynomial.C P + Polynomial.X * Polynomial.C Q := by sorry

-- node: G.1/quadratic-pinch-kernel-divisibility
lemma substitution_eq_zero_iff_dvd (a b : k) (f : MvPolynomial (Fin 2) k) :
    substitution a b f = 0 ↔ relation a b ∣ f := by sorry

-- node: G.1/quadratic-pinch-substitution-range
lemma substitution_range (a b : k) :
    (substitution a b).range =
      algebra (Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b) := by sorry

-- node: G.1/quadratic-pinch-substitution-kernel
lemma substitution_ker (a b : k) :
    RingHom.ker (substitution a b) = Ideal.span ({relation a b} : Set (MvPolynomial (Fin 2) k)) := by sorry

-- node: G.1/quadratic-pinch-substitution-to-algebra
noncomputable def substitutionToAlgebra (a b : k) :
    MvPolynomial (Fin 2) k →ₐ[k]
      algebra (Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b) := by sorry

-- node: G.1/quadratic-pinch-substitution-coercion
lemma substitutionToAlgebra_coe (a b : k) (f : MvPolynomial (Fin 2) k) :
    (substitutionToAlgebra a b f : k[X]) = substitution a b f := by sorry

-- node: G.1/quadratic-pinch-substitution-surjective
lemma substitutionToAlgebra_surjective (a b : k) :
    Function.Surjective (substitutionToAlgebra a b) := by sorry

-- node: G.1/quadratic-pinch-restricted-kernel
lemma substitutionToAlgebra_ker (a b : k) :
    RingHom.ker (substitutionToAlgebra a b) =
      Ideal.span ({relation a b} : Set (MvPolynomial (Fin 2) k)) := by sorry

-- node: G.1/quadratic-pinch-quotient-equivalence
noncomputable def presentationEquiv (a b : k) :
    (MvPolynomial (Fin 2) k ⧸ Ideal.span ({relation a b} : Set (MvPolynomial (Fin 2) k))) ≃ₐ[k]
      algebra (Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b) := by sorry

lemma presentationEquiv_mk (a b : k) (f : MvPolynomial (Fin 2) k) :
    (presentationEquiv a b (Ideal.Quotient.mk _ f) : k[X]) = substitution a b f := by sorry

lemma presentationEquiv_symm_substitution (a b : k) (f : MvPolynomial (Fin 2) k) :
    (presentationEquiv a b).symm (substitutionToAlgebra a b f) = Ideal.Quotient.mk _ f := by sorry

lemma presentationEquiv_generators (a b : k) :
    let q : k[X] := Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b
    (presentationEquiv a b (Ideal.Quotient.mk _ (MvPolynomial.X 0)) : k[X]) = q ∧
      (presentationEquiv a b (Ideal.Quotient.mk _ (MvPolynomial.X 1)) : k[X]) = Polynomial.X * q := by sorry

-- test: QuadraticPinch.inV.test_cusp
example : inV (relation (0 : k) 0) = Polynomial.X ^ 2 - Polynomial.C (Polynomial.X ^ 3) := by sorry

-- test: QuadraticPinch.inV.test_char2_cross_term
example : ((inV (relation (1 : ZMod 2) 1)).coeff 1).coeff 1 = 1 := by sorry

-- test: QuadraticPinch.inV.test_orientation
example : inV (k := k) (MvPolynomial.X 0) ≠ inV (MvPolynomial.X 1) := by sorry

-- test: QuadraticPinch.substitution.test_zero
example (a b : k) : substitution a b 0 = 0 := by sorry

-- test: QuadraticPinch.substitution.test_char2_generators
example :
    substitution (1 : ZMod 2) 1 (MvPolynomial.X 0) = Polynomial.X ^ 2 + Polynomial.X + 1 ∧
    substitution (1 : ZMod 2) 1 (MvPolynomial.X 1) =
      Polynomial.X * (Polynomial.X ^ 2 + Polynomial.X + 1) := by sorry

-- test: QuadraticPinch.substitution.test_cubic_essential
example : substitution (0 : k) 0 (MvPolynomial.X 1 ^ 2) ≠ 0 := by sorry

-- test: QuadraticPinch.substitutionToAlgebra.test_zero
example (a b : k) : substitutionToAlgebra a b 0 = 0 := by sorry

-- test: QuadraticPinch.substitutionToAlgebra.test_inseparable_cubic
example : (substitutionToAlgebra (0 : ZMod 2) 0 (MvPolynomial.X 1) : (ZMod 2)[X]) =
    Polynomial.X ^ 3 := by sorry

-- test: QuadraticPinch.substitutionToAlgebra.test_scalar
example (a b c : k) : (substitutionToAlgebra a b (MvPolynomial.C c) : k[X]) = Polynomial.C c := by sorry

-- test: QuadraticPinch.presentationEquiv.test_zero
example (a b : k) : presentationEquiv a b 0 = 0 := by sorry

-- test: QuadraticPinch.presentationEquiv.test_cusp_product
example :
    (presentationEquiv (0 : k) 0 (Ideal.Quotient.mk _ (MvPolynomial.X 1) ^ 2) : k[X]) =
      Polynomial.X ^ 6 := by sorry

-- test: QuadraticPinch.presentationEquiv.test_nonzero_unit_coordinate
example : (Ideal.Quotient.mk
    (Ideal.span ({relation (0 : k) 0} : Set (MvPolynomial (Fin 2) k))) (MvPolynomial.X 0)) ≠ 0 := by sorry

-- test: QuadraticPinch.presentationEquiv.test_char2_inseparable
example :
    (presentationEquiv (0 : ZMod 2) 0).symm
      (substitutionToAlgebra 0 0 (MvPolynomial.X 1 ^ 2)) =
      Ideal.Quotient.mk _ (MvPolynomial.X 0 ^ 3) := by sorry-- node: G.1/quadratic-pinch-presentation
/-- Canonical map, its image and its entire kernel, including inseparable quadratics. -/
lemma presentation (a b : k) :
    let q : k[X] := Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b
    let ψ : MvPolynomial (Fin 2) k →ₐ[k] k[X] :=
      MvPolynomial.aeval ![q, Polynomial.X * q]
    ψ.range = algebra q ∧
      RingHom.ker ψ.toRingHom = Ideal.span ({relation a b} : Set (MvPolynomial (Fin 2) k)) := by sorry

-- node: G.1/quadratic-pinch-conductor
lemma conductor (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    (algebra q).toSubring.conductor = Ideal.span ({q} : Set k[X]) := by
  ext f
  change (∀ x : k[X], f * x ∈ algebra q) ↔ f ∈ Ideal.span {q}
  rw [Ideal.mem_span_singleton]
  constructor
  · intro hf
    obtain ⟨c, h, hform⟩ := (mem_algebra q f).mp (by simpa using hf 1)
    obtain ⟨d, j, hj⟩ := (mem_algebra q (f * Polynomial.X)).mp (hf Polynomial.X)
    have hlin : (f * Polynomial.X) %ₘ q = Polynomial.C c * Polynomial.X := by
      rw [hform, add_mul,
        show q * h * Polynomial.X = q * (h * Polynomial.X) by ring,
        Polynomial.add_modByMonic, Polynomial.self_mul_modByMonic hq, add_zero,
        linear_remainder q hq hd]
    have hconst : (f * Polynomial.X) %ₘ q = Polynomial.C d := by
      rw [hj, constant_remainder q hq hd]
    have hc : c = 0 := by
      have hcoef := congrArg (fun p : k[X] => p.coeff 1) (hlin.symm.trans hconst)
      simpa using hcoef
    exact ⟨h, by simpa [hc] using hform⟩
  · rintro ⟨h, rfl⟩ x
    exact (mem_algebra q _).mpr ⟨0, h * x, by simp [mul_assoc]⟩

-- node: G.1/quadratic-pinch-normalization
-- This is the finite inclusion part. The localization/fraction-field and native
-- normalization comparison are named in the ledger below, not encoded by a new predicate.
lemma finite_normalization (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    (algebra q).val.toRingHom.Finite := by sorry


-- node: G.1/quadratic-point-proper-pushout
/-- Generic proper Scheme pinching at one closed field point. This does not
assert geometric genus or nodality without the P1/cohomology/branch exports. -/
theorem proper_point_pushout {E : Type u} [Field E] [Algebra k E] [Module.Finite k E]
    {Y : Scheme.{u}} (pY : Y ⟶ Spec (.of k)) [IsProper pY]
    (i : Spec (.of E) ⟶ Y) [IsClosedImmersion i]
    (hcompat : i ≫ pY = Spec.map (CommRingCat.ofHom (algebraMap k E))) :
    ∃ (C : Scheme.{u}) (ν : Y ⟶ C) (j : Spec (.of k) ⟶ C) (pC : C ⟶ Spec (.of k)),
      ν ≫ pC = pY ∧ j ≫ pC = 𝟙 _ ∧
      GeometricPushout i (Spec.map (CommRingCat.ofHom (algebraMap k E))) ν j ∧
      IsPushout i (Spec.map (CommRingCat.ofHom (algebraMap k E))) ν j ∧
      IsPullback i (Spec.map (CommRingCat.ofHom (algebraMap k E))) ν j ∧
      IsFinite ν ∧ Surjective ν ∧ IsClosedImmersion j ∧ IsProper pC := by sorry

end TauCeti.GenusOne.QuadraticPinch

/-!
## Exact quadratic-pinching signature omissions

These targets are mathematical nodes in the reader, with their proof outlines and
supplier requests. They have no invented Prop fields or opaque geometric predicates.

* QuadraticPinch.generation: the inherited adjoin equality is proved above. The
  native k-linear coordinates, actual Module.Basis, coefficient reconstruction and
  exact degree-family signatures now appear above, admitted under PROTOCOL§13.
  Their separately checked prototype uses the existing native subalgebra. A
  k[q]-module instance/freeness interface is not yet supplied.
* QuadraticPinch.presentation: the full range/kernel signature is above, admitted.
  Add native bivariate transport, monic division in V, and the canonical first-
  isomorphism/quotient map. Pinch normal-form injectivity certifies only that a
  chosen remainder has zero coefficients when its image vanishes.
* QuadraticPinch.finite_normalization: the native finite-inclusion signature is above,
  admitted.
  Native localization-at-q, specified finite module generation, shared fraction-field
  identification and the affine integral-closure comparison are separately checked below.
  Add SR.1's actual projective normalization comparison and its two chart maps.
* QuadraticPinch.tangent_branches: the native hypersurface and quadratic equation
  are above. Add the local cotangent and associated-graded maps, SR.1's actual
  node predicate/chart comparison and its finite-etale branch scheme; exclude
  inseparable q from the nodal conclusion, including characteristic2.
* QuadraticPinch.i1_genus: SF.3's scheme P1 and actual finite normalization,
  conductor exact sequence with quotient j_*(E/k), H0=k and H1≅E/k,
  geometric integrality and the two conjugate branch maps.
* QuadraticPinch.i2_genus: the disjoint scheme P1 union and the specified residue
  identifications, quotient j_*E and global map k²→E, (c1,c2)↦c1−c2;
  connectedness and SR.1's fixed-vertex/conjugate-edge comparison.
* QuadraticPinch.splitting: all four actual field-base-change arrows, the
  canonical E tensor K comparison and SR.1's normalization/branch diagrams.
* QuadraticPinch.extension_counts: the actual pinched Scheme Hom(Spec F_(q^n),C)
  equivalences, finite P1 counts, quadratic embedding parity and reduction map.
  For odd n counts are q^n+2 and2q^n+2; for even n they are q^n and2q^n.
* GeometricPushout.nonsplit_node: the earlier omitted proper-P1/node test still
  needs these exact P1 and branch exports. The generic proper-field-point
  existence theorem above supplies existence/properness only; it is not that test.
-/


/- BEGIN QUADRATIC POINT PARAMETRIZATION -/
namespace TauCeti.GenusOne.QuadraticPinch
noncomputable section
variable {k : Type*} [Field k]

lemma parameter_equation (a b t : k) :
    (⟨a, -b, 0, 0, 0⟩ : WeierstrassCurve k).toAffine.Equation
      (t ^ 2 + a * t + b) (t * (t ^ 2 + a * t + b)) := by sorry

lemma affine_zero_x (a b y : k)
    (h : (⟨a, -b, 0, 0, 0⟩ : WeierstrassCurve k).toAffine.Equation 0 y) : y = 0 := by sorry

lemma parameter_recovery (a b x y : k)
    (h : (⟨a, -b, 0, 0, 0⟩ : WeierstrassCurve k).toAffine.Equation x y)
    (hx : x ≠ 0) : (y / x) ^ 2 + a * (y / x) + b = x := by sorry

def affineParamEquiv (a b : k) :
    {p : k × k // (⟨a, -b, 0, 0, 0⟩ : WeierstrassCurve k).toAffine.Equation p.1 p.2} ≃
      Option {t : k // t ^ 2 + a * t + b ≠ 0} := by sorry

lemma affineParamEquiv_origin (a b : k) :
    affineParamEquiv a b ⟨(0,0), by
      rw [WeierstrassCurve.Affine.equation_iff]; simp⟩ = none := by sorry

lemma affineParamEquiv_symm_none (a b : k) :
    ((affineParamEquiv a b).symm none).1 = (0,0) := by sorry

lemma affineParamEquiv_symm_some (a b : k) (t : {t : k // t ^ 2 + a * t + b ≠ 0}) :
    ((affineParamEquiv a b).symm (some t)).1 =
      (t.1 ^ 2 + a * t.1 + b, t.1 * (t.1 ^ 2 + a * t.1 + b)) := by sorry

lemma affineParamEquiv_nonzero (a b : k)
    (p : {p : k × k // (⟨a, -b, 0, 0, 0⟩ : WeierstrassCurve k).toAffine.Equation p.1 p.2})
    (hx : p.1.1 ≠ 0) :
    Option.map Subtype.val (affineParamEquiv a b p) = some (p.1.2 / p.1.1) := by sorry

lemma affine_card_balance [Finite k] (a b : k) :
    Nat.card {p : k × k // (⟨a, -b, 0, 0, 0⟩ : WeierstrassCurve k).toAffine.Equation p.1 p.2} +
      Nat.card {t : k // t ^ 2 + a * t + b = 0} = Nat.card k + 1 := by sorry

lemma pointCount_balance [Finite k] (a b : k) :
    (⟨a, -b, 0, 0, 0⟩ : WeierstrassCurve k).pointCount +
      Nat.card {t : k // t ^ 2 + a * t + b = 0} = Nat.card k + 2 := by sorry

lemma frobeniusTrace_roots [Finite k] (a b : k) :
    (⟨a, -b, 0, 0, 0⟩ : WeierstrassCurve k).frobeniusTrace =
      (Nat.card {t : k // t ^ 2 + a * t + b = 0} : ℤ) - 1 := by sorry

end
end TauCeti.GenusOne.QuadraticPinch

namespace TauCeti.GenusOne.QuadraticPinch
noncomputable section
-- test: QuadraticPinch.affineParamEquiv.test_origin
example (a b : ℚ) : affineParamEquiv a b ⟨(0,0), by
    rw [WeierstrassCurve.Affine.equation_iff]; simp⟩ = none := by sorry

-- test: QuadraticPinch.affineParamEquiv.test_nonsplit
example : ((affineParamEquiv (1 : ZMod 2) 1).symm
    (some ⟨0, by decide⟩)).1 = (1,0) := by sorry

-- test: QuadraticPinch.affineParamEquiv.test_cusp
example : ((affineParamEquiv (0 : ZMod 2) 0).symm
    (some ⟨1, by decide⟩)).1 = (1,1) := by sorry

-- test: QuadraticPinch.pointCount_balance.test_three_forms
example :
    (⟨1, 0, 0, 0, 0⟩ : WeierstrassCurve (ZMod 2)).pointCount = 2 ∧
    (⟨1, 1, 0, 0, 0⟩ : WeierstrassCurve (ZMod 2)).pointCount = 4 ∧
    (⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve (ZMod 2)).pointCount = 3 := by sorry

-- test: QuadraticPinch.frobeniusTrace_roots.test_three_forms
example :
    (⟨1, 0, 0, 0, 0⟩ : WeierstrassCurve (ZMod 2)).frobeniusTrace = 1 ∧
    (⟨1, 1, 0, 0, 0⟩ : WeierstrassCurve (ZMod 2)).frobeniusTrace = -1 ∧
    (⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve (ZMod 2)).frobeniusTrace = 0 := by sorry

-- test: QuadraticPinch.affine_card_balance.test_distinct_double_root
example : Nat.card {t : ZMod 2 // t ^ 2 = 0} = 1 := by sorry

end
end TauCeti.GenusOne.QuadraticPinch
/- END QUADRATIC POINT PARAMETRIZATION -/

/- BEGIN QUADRATIC ROOT BRANCH COUNTS -/
namespace TauCeti.GenusOne.QuadraticPinch
noncomputable section
variable {k : Type*} [Field k]

open scoped Classical

lemma quadraticRootCount_branch [Finite k] (a b : k) (hd : discrim 1 a b ≠ 0) :
    Nat.card {t : k // t ^ 2 + a * t + b = 0} =
      if ∃ t : k, t ^ 2 + a * t + b = 0 then 2 else 0 := by
  sorry

lemma pointCount_branch [Finite k] (a b : k) (hd : discrim 1 a b ≠ 0) :
    (⟨a,-b,0,0,0⟩ : WeierstrassCurve k).pointCount =
      if ∃ t : k, t ^ 2 + a * t + b = 0 then Nat.card k else Nat.card k + 2 := by
  sorry

lemma frobeniusTrace_branch [Finite k] (a b : k) (hd : discrim 1 a b ≠ 0) :
    (⟨a,-b,0,0,0⟩ : WeierstrassCurve k).frobeniusTrace =
      if ∃ t : k, t ^ 2 + a * t + b = 0 then 1 else -1 := by
  sorry

lemma pointCount_field_map {l : Type*} [Field l] [Finite l]
    (f : k →+* l) (a b : k) (hd : discrim 1 a b ≠ 0) :
    (⟨f a,-f b,0,0,0⟩ : WeierstrassCurve l).pointCount =
      if ∃ t : l, t ^ 2 + f a * t + f b = 0 then Nat.card l else Nat.card l + 2 := by
  sorry

-- test: QuadraticPinch.quadraticRootCount_branch.test_binary_split
example : Nat.card {t : ZMod 2 // t ^ 2 + 1 * t + 0 = 0} = 2 := by
  sorry

-- test: QuadraticPinch.quadraticRootCount_branch.test_binary_nonsplit
example : Nat.card {t : ZMod 2 // t ^ 2 + 1 * t + 1 = 0} = 0 := by
  sorry

-- test: QuadraticPinch.pointCount_branch.test_odd_split
example : (⟨0,1,0,0,0⟩ : WeierstrassCurve (ZMod 3)).pointCount = 3 := by
  sorry

-- test: QuadraticPinch.frobeniusTrace_branch.test_odd_nonsplit
example : (⟨0,-1,0,0,0⟩ : WeierstrassCurve (ZMod 3)).frobeniusTrace = -1 := by
  sorry

-- test: QuadraticPinch.frobeniusTrace_branch.test_repeated_excluded
example : discrim (1 : ZMod 3) 1 1 = 0 ∧
    (⟨1,-1,0,0,0⟩ : WeierstrassCurve (ZMod 3)).frobeniusTrace = 0 := by
  sorry

-- test: QuadraticPinch.pointCount_field_map.test_identity
example [Finite k] (a b : k) (hd : discrim 1 a b ≠ 0) :
    (⟨a,-b,0,0,0⟩ : WeierstrassCurve k).pointCount =
      if ∃ t : k, t ^ 2 + a * t + b = 0 then Nat.card k else Nat.card k + 2 := by
  sorry

end
end TauCeti.GenusOne.QuadraticPinch
/- END QUADRATIC ROOT BRANCH COUNTS -/

/- BEGIN QUADRATIC EXTENSION PARITY -/
namespace TauCeti.GenusOne.QuadraticPinch
open Polynomial
variable {k l : Type*} [Field k] [Field l] [Algebra k l] [Finite l]

/-- Degree-two field factors acquire roots exactly in extensions of even degree. -/
lemma quadratic_root_iff_even (a b : k)
    (hi : Irreducible (X ^ 2 + C a * X + C b : k[X])) :
    (∃ t : l, t ^ 2 + algebraMap k l a * t + algebraMap k l b = 0) ↔
      2 ∣ Module.finrank k l := by
  sorry

lemma pointCount_extension_parity (a b : k)
    (hi : Irreducible (X ^ 2 + C a * X + C b : k[X])) (hd : discrim 1 a b ≠ 0) :
    (⟨algebraMap k l a, -algebraMap k l b, 0, 0, 0⟩ : WeierstrassCurve l).pointCount =
      if 2 ∣ Module.finrank k l then Nat.card l else Nat.card l + 2 := by
  sorry

lemma quadraticRootCount_extension_parity (a b : k)
    (hi : Irreducible (X ^ 2 + C a * X + C b : k[X])) (hd : discrim 1 a b ≠ 0) :
    Nat.card {t : l // t ^ 2 + algebraMap k l a * t + algebraMap k l b = 0} =
      if 2 ∣ Module.finrank k l then 2 else 0 := by
  sorry

lemma pointCount_extension_power (a b : k)
    (hi : Irreducible (X ^ 2 + C a * X + C b : k[X])) (hd : discrim 1 a b ≠ 0) :
    (⟨algebraMap k l a, -algebraMap k l b, 0, 0, 0⟩ : WeierstrassCurve l).pointCount =
      if 2 ∣ Module.finrank k l then Nat.card k ^ Module.finrank k l
      else Nat.card k ^ Module.finrank k l + 2 := by
  sorry

lemma frobeniusTrace_extension_parity (a b : k)
    (hi : Irreducible (X ^ 2 + C a * X + C b : k[X])) (hd : discrim 1 a b ≠ 0) :
    (⟨algebraMap k l a, -algebraMap k l b, 0, 0, 0⟩ : WeierstrassCurve l).frobeniusTrace =
      if 2 ∣ Module.finrank k l then 1 else -1 := by
  sorry

-- test: QuadraticPinch.pointCount_extension_power.test_binary_degree1
example : (⟨1,-1,0,0,0⟩ : WeierstrassCurve (FiniteField.Extension (ZMod 2) 2 1)).pointCount = 4 := by
  sorry

-- test: QuadraticPinch.pointCount_extension_power.test_binary_degree2
example : (⟨1,-1,0,0,0⟩ : WeierstrassCurve (FiniteField.Extension (ZMod 2) 2 2)).pointCount = 4 := by
  sorry

-- test: QuadraticPinch.pointCount_extension_power.test_binary_degree3
example : (⟨1,-1,0,0,0⟩ : WeierstrassCurve (FiniteField.Extension (ZMod 2) 2 3)).pointCount = 10 := by
  sorry

-- test: QuadraticPinch.quadratic_root_iff_even.test_binary_odd_no_root
example : ¬ ∃ t : FiniteField.Extension (ZMod 2) 2 3, t ^ 2 + 1 * t + 1 = 0 := by
  sorry

-- test: QuadraticPinch.quadraticRootCount_extension_parity.test_binary_even_two_roots
example : Nat.card {t : FiniteField.Extension (ZMod 2) 2 2 // t ^ 2 + 1 * t + 1 = 0} = 2 := by
  sorry

-- test: QuadraticPinch.pointCount_extension_power.test_odd_characteristic_even_degree
example : (⟨0,-1,0,0,0⟩ : WeierstrassCurve (FiniteField.Extension (ZMod 3) 3 2)).pointCount = 9 := by
  sorry

-- test: QuadraticPinch.frobeniusTrace_extension_parity.test_binary_even_trace
example : (⟨1,-1,0,0,0⟩ : WeierstrassCurve (FiniteField.Extension (ZMod 2) 2 2)).frobeniusTrace = 1 := by
  sorry

end TauCeti.GenusOne.QuadraticPinch
/- END QUADRATIC EXTENSION PARITY -/

/- BEGIN COMMON IDEAL LOCALIZATION -/
universe v w z
namespace TauCeti.GenusOne.AffinePinching
variable {A : Type u} {B : Type v} [CommRing A] [CommRing B]

-- node: G.0/common-ideal-kernel-annihilation
lemma commonIdeal_kill_kernel (f : A →+* B) (I : Ideal A)
    (hker : RingHom.ker f ⊓ I = ⊥) (t : A) (ht : t ∈ I)
    (a : A) (ha : f a = 0) : t * a = 0 := by sorry

-- node: G.0/common-ideal-away-bijective
lemma commonIdeal_away_bijective (At : Type w) (Bt : Type z)
    [CommRing At] [CommRing Bt] [Algebra A At] [Algebra B Bt]
    (f : A →+* B) (I : Ideal A)
    (himage : (I.map f : Set B) = f '' (I : Set A))
    (hker : RingHom.ker f ⊓ I = ⊥) (t : A) (ht : t ∈ I)
    [IsLocalization.Away t At] [IsLocalization.Away (f t) Bt] :
    Function.Bijective (IsLocalization.Away.map At Bt f t) := by sorry

-- node: G.0/common-ideal-away-equiv
noncomputable def commonIdealAwayEquiv (At : Type w) (Bt : Type z)
    [CommRing At] [CommRing Bt] [Algebra A At] [Algebra B Bt]
    (f : A →+* B) (I : Ideal A)
    (himage : (I.map f : Set B) = f '' (I : Set A))
    (hker : RingHom.ker f ⊓ I = ⊥) (t : A) (ht : t ∈ I)
    [IsLocalization.Away t At] [IsLocalization.Away (f t) Bt] : At ≃+* Bt := by sorry

section API
variable (At : Type w) (Bt : Type z)
    [CommRing At] [CommRing Bt] [Algebra A At] [Algebra B Bt]
    (f : A →+* B) (I : Ideal A)
    (himage : (I.map f : Set B) = f '' (I : Set A))
    (hker : RingHom.ker f ⊓ I = ⊥) (t : A) (ht : t ∈ I)
    [IsLocalization.Away t At] [IsLocalization.Away (f t) Bt]

lemma commonIdealAwayEquiv_apply (x : At) :
    commonIdealAwayEquiv At Bt f I himage hker t ht x =
      IsLocalization.Away.map At Bt f t x := by sorry

lemma commonIdealAwayEquiv_algebraMap (a : A) :
    commonIdealAwayEquiv At Bt f I himage hker t ht (algebraMap A At a) =
      algebraMap B Bt (f a) := by sorry

lemma commonIdealAwayEquiv_symm_algebraMap (a : A) :
    (commonIdealAwayEquiv At Bt f I himage hker t ht).symm (algebraMap B Bt (f a)) =
      algebraMap A At a := by sorry

-- node: G.0/common-ideal-away-inverse
lemma commonIdealAwayEquiv_symm_of_mul (a : A) (b : B) (ha : f a = f t * b) :
    (commonIdealAwayEquiv At Bt f I himage hker t ht).symm (algebraMap B Bt b) =
      IsLocalization.mk' At a ⟨t, Submonoid.mem_powers t⟩ := by sorry

end API
end TauCeti.GenusOne.AffinePinching

namespace TauCeti.GenusOne.AffinePinching
-- node: G.0/conductor-away-bijective
lemma conductor_away_bijective {B : Type v} [CommRing B] (S : Subring B)
    (St : Type w) (Bt : Type z) [CommRing St] [CommRing Bt]
    [Algebra S St] [Algebra B Bt] (t : S) (ht : (t : B) ∈ S.conductor)
    [IsLocalization.Away t St] [IsLocalization.Away (S.subtype t) Bt] :
    Function.Bijective (IsLocalization.Away.map St Bt S.subtype t) := by sorry
end TauCeti.GenusOne.AffinePinching

namespace TauCeti.GenusOne.QuadraticPinch
variable {k : Type u} [Field k]

-- node: G.1/quadratic-pinch-localization
lemma away_bijective (q : k[X])
    (At : Type w) (Bt : Type z) [CommRing At] [CommRing Bt]
    [Algebra (algebra q) At] [Algebra k[X] Bt]
    [IsLocalization.Away
      (⟨q, (mem_algebra q q).mpr ⟨0, 1, by simp⟩⟩ : algebra q) At]
    [IsLocalization.Away ((algebra q).toSubring.subtype
      (⟨q, (mem_algebra q q).mpr ⟨0, 1, by simp⟩⟩ : algebra q)) Bt] :
    Function.Bijective (IsLocalization.Away.map At Bt (algebra q).toSubring.subtype
      (⟨q, (mem_algebra q q).mpr ⟨0, 1, by simp⟩⟩ : algebra q)) := by sorry

end TauCeti.GenusOne.QuadraticPinch

namespace TauCeti.GenusOne.QuadraticPinch
variable {k : Type u} [Field k]

-- node: G.1/quadratic-pinch-localization-generator
lemma away_inverse_generator (q : k[X])
    (At : Type w) (Bt : Type z) [CommRing At] [CommRing Bt]
    [Algebra (algebra q) At] [Algebra k[X] Bt]
    [IsLocalization.Away
      (⟨q, (mem_algebra q q).mpr ⟨0, 1, by simp⟩⟩ : algebra q) At]
    [IsLocalization.Away ((algebra q).toSubring.subtype
      (⟨q, (mem_algebra q q).mpr ⟨0, 1, by simp⟩⟩ : algebra q)) Bt] :
    (RingEquiv.ofBijective
      (IsLocalization.Away.map At Bt (algebra q).toSubring.subtype
        (⟨q, (mem_algebra q q).mpr ⟨0, 1, by simp⟩⟩ : algebra q))
      (away_bijective q At Bt)).symm (algebraMap k[X] Bt Polynomial.X) =
      IsLocalization.mk' At
        (⟨q * Polynomial.X, (mem_algebra q _).mpr ⟨0, Polynomial.X, by simp⟩⟩ : algebra q)
        ⟨(⟨q, (mem_algebra q q).mpr ⟨0, 1, by simp⟩⟩ : algebra q),
          Submonoid.mem_powers _⟩ := by sorry
end TauCeti.GenusOne.QuadraticPinch

namespace TauCeti.GenusOne.AffinePinching
-- test: CommonIdealAwayEquiv.identity
example (t a : ℤ) :
    commonIdealAwayEquiv (Localization.Away t) (Localization.Away t)
      (RingHom.id ℤ) ⊤ (by ext; simp) (by simpa using (RingHom.injective_iff_ker_eq_bot (RingHom.id ℤ)).mp (fun _ _ h => h)) t (by simp)
      (algebraMap ℤ (Localization.Away t) a) =
      algebraMap ℤ (Localization.Away t) a := by sorry

-- test: CommonIdealAwayEquiv.inverse_fraction
example :
    (commonIdealAwayEquiv (Localization.Away (2 : ℤ)) (Localization.Away (2 : ℤ))
      (RingHom.id ℤ) ⊤ (by ext; simp) (by simpa using (RingHom.injective_iff_ker_eq_bot (RingHom.id _)).mp (fun _ _ h => h)) 2 (by simp)).symm
      (algebraMap ℤ (Localization.Away (2 : ℤ)) 3) =
      IsLocalization.mk' (M := Submonoid.powers (2 : ℤ)) (Localization.Away (2 : ℤ)) (6 : ℤ) ⟨2, Submonoid.mem_powers 2⟩ := by sorry

-- test: CommonIdealAwayEquiv.noninjective
example :
    ¬ Function.Injective (RingHom.fst ℤ ℤ) ∧
    Function.Bijective (IsLocalization.Away.map
      (Localization.Away ((1, 0) : ℤ × ℤ))
      (Localization.Away (RingHom.fst ℤ ℤ ((1, 0) : ℤ × ℤ)))
      (RingHom.fst ℤ ℤ) (1, 0)) := by sorry

-- test: CommonIdealAwayEquiv.nilpotent
example :
    Function.Bijective (IsLocalization.Away.map
      (Localization.Away (2 : ZMod 4)) (Localization.Away (2 : ZMod 4))
      (RingHom.id (ZMod 4)) 2) ∧ Subsingleton (Localization.Away (2 : ZMod 4)) := by sorry

-- test: CommonIdealAwayEquiv.kernel_condition_necessary
example : ¬ Function.Injective (IsLocalization.Away.map
    (Localization.Away (1 : ℤ × ℤ))
    (Localization.Away (RingHom.fst ℤ ℤ (1 : ℤ × ℤ)))
    (RingHom.fst ℤ ℤ) 1) := by sorry

-- test: CommonIdealAwayEquiv.image_condition_necessary
example : ¬ Function.Surjective (IsLocalization.Away.map
    (Localization.Away (1 : ℤ))
    (Localization.Away (((RingHom.id ℤ).prod (RingHom.id ℤ)) (1 : ℤ)))
    ((RingHom.id ℤ).prod (RingHom.id ℤ)) 1) := by sorry
end TauCeti.GenusOne.AffinePinching

namespace TauCeti.GenusOne.QuadraticPinch
-- test: QuadraticPinch.away_bijective.split
example (At : Type w) (Bt : Type z) [CommRing At] [CommRing Bt]
    [Algebra (algebra (Polynomial.X ^ 2 - 1 : (ℚ)[X])) At] [Algebra (ℚ)[X] Bt]
    [IsLocalization.Away (⟨(Polynomial.X ^ 2 - 1 : (ℚ)[X]), (mem_algebra (Polynomial.X ^ 2 - 1 : (ℚ)[X]) (Polynomial.X ^ 2 - 1 : (ℚ)[X])).mpr ⟨0, 1, by simp⟩⟩ : algebra (Polynomial.X ^ 2 - 1 : (ℚ)[X])) At]
    [IsLocalization.Away ((algebra (Polynomial.X ^ 2 - 1 : (ℚ)[X])).toSubring.subtype (⟨(Polynomial.X ^ 2 - 1 : (ℚ)[X]), (mem_algebra (Polynomial.X ^ 2 - 1 : (ℚ)[X]) (Polynomial.X ^ 2 - 1 : (ℚ)[X])).mpr ⟨0, 1, by simp⟩⟩ : algebra (Polynomial.X ^ 2 - 1 : (ℚ)[X]))) Bt] :
    Function.Bijective (IsLocalization.Away.map At Bt (algebra (Polynomial.X ^ 2 - 1 : (ℚ)[X])).toSubring.subtype (⟨(Polynomial.X ^ 2 - 1 : (ℚ)[X]), (mem_algebra (Polynomial.X ^ 2 - 1 : (ℚ)[X]) (Polynomial.X ^ 2 - 1 : (ℚ)[X])).mpr ⟨0, 1, by simp⟩⟩ : algebra (Polynomial.X ^ 2 - 1 : (ℚ)[X]))) := by sorry

-- test: QuadraticPinch.away_bijective.irreducible
example (At : Type w) (Bt : Type z) [CommRing At] [CommRing Bt]
    [Algebra (algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 2)[X])) At] [Algebra (ZMod 2)[X] Bt]
    [IsLocalization.Away (⟨(Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 2)[X]), (mem_algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 2)[X]) (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 2)[X])).mpr ⟨0, 1, by simp⟩⟩ : algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 2)[X])) At]
    [IsLocalization.Away ((algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 2)[X])).toSubring.subtype (⟨(Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 2)[X]), (mem_algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 2)[X]) (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 2)[X])).mpr ⟨0, 1, by simp⟩⟩ : algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 2)[X]))) Bt] :
    Function.Bijective (IsLocalization.Away.map At Bt (algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 2)[X])).toSubring.subtype (⟨(Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 2)[X]), (mem_algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 2)[X]) (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 2)[X])).mpr ⟨0, 1, by simp⟩⟩ : algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 2)[X]))) := by sorry

-- test: QuadraticPinch.away_bijective.cusp
example (At : Type w) (Bt : Type z) [CommRing At] [CommRing Bt]
    [Algebra (algebra (Polynomial.X ^ 2 : (ZMod 2)[X])) At] [Algebra (ZMod 2)[X] Bt]
    [IsLocalization.Away (⟨(Polynomial.X ^ 2 : (ZMod 2)[X]), (mem_algebra (Polynomial.X ^ 2 : (ZMod 2)[X]) (Polynomial.X ^ 2 : (ZMod 2)[X])).mpr ⟨0, 1, by simp⟩⟩ : algebra (Polynomial.X ^ 2 : (ZMod 2)[X])) At]
    [IsLocalization.Away ((algebra (Polynomial.X ^ 2 : (ZMod 2)[X])).toSubring.subtype (⟨(Polynomial.X ^ 2 : (ZMod 2)[X]), (mem_algebra (Polynomial.X ^ 2 : (ZMod 2)[X]) (Polynomial.X ^ 2 : (ZMod 2)[X])).mpr ⟨0, 1, by simp⟩⟩ : algebra (Polynomial.X ^ 2 : (ZMod 2)[X]))) Bt] :
    Function.Bijective (IsLocalization.Away.map At Bt (algebra (Polynomial.X ^ 2 : (ZMod 2)[X])).toSubring.subtype (⟨(Polynomial.X ^ 2 : (ZMod 2)[X]), (mem_algebra (Polynomial.X ^ 2 : (ZMod 2)[X]) (Polynomial.X ^ 2 : (ZMod 2)[X])).mpr ⟨0, 1, by simp⟩⟩ : algebra (Polynomial.X ^ 2 : (ZMod 2)[X]))) := by sorry

-- test: QuadraticPinch.away_bijective.zero
example (At : Type w) (Bt : Type z) [CommRing At] [CommRing Bt]
    [Algebra (algebra (0 : (ZMod 2)[X])) At] [Algebra (ZMod 2)[X] Bt]
    [IsLocalization.Away (⟨(0 : (ZMod 2)[X]), (mem_algebra (0 : (ZMod 2)[X]) (0 : (ZMod 2)[X])).mpr ⟨0, 1, by simp⟩⟩ : algebra (0 : (ZMod 2)[X])) At]
    [IsLocalization.Away ((algebra (0 : (ZMod 2)[X])).toSubring.subtype (⟨(0 : (ZMod 2)[X]), (mem_algebra (0 : (ZMod 2)[X]) (0 : (ZMod 2)[X])).mpr ⟨0, 1, by simp⟩⟩ : algebra (0 : (ZMod 2)[X]))) Bt] :
    Function.Bijective (IsLocalization.Away.map At Bt (algebra (0 : (ZMod 2)[X])).toSubring.subtype (⟨(0 : (ZMod 2)[X]), (mem_algebra (0 : (ZMod 2)[X]) (0 : (ZMod 2)[X])).mpr ⟨0, 1, by simp⟩⟩ : algebra (0 : (ZMod 2)[X]))) := by sorry

end TauCeti.GenusOne.QuadraticPinch
/- END COMMON IDEAL LOCALIZATION -/

/- BEGIN QUADRATIC AFFINE NORMALIZATION -/
namespace TauCeti.GenusOne.QuadraticPinch
variable {k : Type u} [Field k]
universe v

lemma normalization_remainder (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (f : k[X]) :
    f %ₘ q = Polynomial.C ((f %ₘ q).coeff 0) +
      Polynomial.C ((f %ₘ q).coeff 1) * Polynomial.X := by sorry

noncomputable def moduleCoefficients (q f : k[X]) : algebra q × algebra q := by sorry

lemma moduleCoefficients_fst (q f : k[X]) :
    ((moduleCoefficients q f).1 : k[X]) =
      Polynomial.C ((f %ₘ q).coeff 0) + q * (f /ₘ q) := by sorry

lemma moduleCoefficients_snd (q f : k[X]) :
    ((moduleCoefficients q f).2 : k[X]) = Polynomial.C ((f %ₘ q).coeff 1) := by sorry

lemma moduleCoefficients_reconstruct (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) (f : k[X]) :
    (moduleCoefficients q f).1 • (1 : k[X]) +
      (moduleCoefficients q f).2 • Polynomial.X = f := by sorry

lemma normalization_span (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    Submodule.span (algebra q) ({1, Polynomial.X} : Set k[X]) = ⊤ := by sorry

lemma normalization_module_finite (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    Module.Finite (algebra q) k[X] := by sorry

lemma normalization_spec_finite (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    AlgebraicGeometry.IsFinite (AlgebraicGeometry.Spec.map
      (CommRingCat.ofHom (algebra q).val.toRingHom)) := by sorry

lemma fraction_ring (q : k[X]) (hq : q ≠ 0)
    (K : Type v) [Field K] [Algebra k[X] K] [IsFractionRing k[X] K]
    :
    IsFractionRing (algebra q) K := by sorry

lemma integral_closure (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (K : Type v) [Field K] [Algebra k[X] K] [IsFractionRing k[X] K]
    :
    IsIntegralClosure k[X] (algebra q) K := by sorry

lemma integral_iff_polynomial (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (K : Type v) [Field K] [Algebra k[X] K] [IsFractionRing k[X] K] (z : K) :
    IsIntegral (algebra q) z ↔ ∃ f : k[X], algebraMap k[X] K f = z := by sorry

noncomputable def fractionEquiv (q : k[X]) (hq : q ≠ 0) :
    FractionRing (algebra q) ≃ₐ[algebra q] FractionRing k[X] := by sorry

lemma fractionEquiv_algebraMap (q : k[X]) (hq : q ≠ 0) (a : algebra q) :
    fractionEquiv q hq (algebraMap (algebra q) (FractionRing (algebra q)) a) =
      algebraMap k[X] (FractionRing k[X]) (a : k[X]) := by sorry

lemma fractionEquiv_symm_algebraMap (q : k[X]) (hq : q ≠ 0) (a : algebra q) :
    (fractionEquiv q hq).symm (algebraMap k[X] (FractionRing k[X]) (a : k[X])) =
      algebraMap (algebra q) (FractionRing (algebra q)) a := by sorry

lemma fractionEquiv_symm_X (q : k[X]) (hq : q ≠ 0) :
    (fractionEquiv q hq).symm (algebraMap k[X] (FractionRing k[X]) Polynomial.X) =
      algebraMap (algebra q) (FractionRing (algebra q))
        (⟨q * Polynomial.X, (mem_algebra q _).mpr ⟨0, Polynomial.X, by simp⟩⟩ : algebra q) /
      algebraMap (algebra q) (FractionRing (algebra q))
        (⟨q, (mem_algebra q _).mpr ⟨0, 1, by simp⟩⟩ : algebra q) := by sorry

lemma module_generator_map_not_injective (q : k[X]) (hq : q ≠ 0) :
    ¬ Function.Injective (fun z : algebra q × algebra q =>
      z.1 • (1 : k[X]) + z.2 • Polynomial.X) := by sorry

-- test: QuadraticPinch.moduleCoefficients.zero
example (q : k[X]) : moduleCoefficients q 0 = (0, 0) := by sorry

-- test: QuadraticPinch.moduleCoefficients.generator
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    moduleCoefficients q Polynomial.X = (0, 1) := by sorry

-- test: QuadraticPinch.moduleCoefficients.cusp
example :
    ((moduleCoefficients (Polynomial.X ^ 2 : (ZMod 2)[X])
      (Polynomial.X ^ 3)).1 : (ZMod 2)[X]) = Polynomial.X ^ 3 ∧
    ((moduleCoefficients (Polynomial.X ^ 2 : (ZMod 2)[X])
      (Polynomial.X ^ 3)).2 : (ZMod 2)[X]) = 0 := by sorry

-- test: QuadraticPinch.normalization.cusp_finite
example : (algebra (Polynomial.X ^ 2 : (ZMod 2)[X])).val.toRingHom.Finite := by sorry

-- test: QuadraticPinch.normalization.nonsplit_finite
example : (algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 2)[X])).val.toRingHom.Finite := by sorry

-- test: QuadraticPinch.normalization.not_basis
example (q : k[X]) (hq : q.Monic) (_hd : q.natDegree = 2) :
    ¬ Function.Injective (fun z : algebra q × algebra q =>
      z.1 • (1 : k[X]) + z.2 • Polynomial.X) := by sorry

-- test: QuadraticPinch.fractionEquiv.cusp
example (a : algebra (Polynomial.X ^ 2 : (ZMod 2)[X])) :
    fractionEquiv (Polynomial.X ^ 2 : (ZMod 2)[X]) (by simp)
      (algebraMap (algebra (Polynomial.X ^ 2 : (ZMod 2)[X])) _ a) =
        algebraMap (ZMod 2)[X] (FractionRing (ZMod 2)[X]) (a : (ZMod 2)[X]) := by sorry

-- test: QuadraticPinch.fractionEquiv.unit
example (a : algebra (1 : k[X])) :
    (fractionEquiv (1 : k[X]) one_ne_zero).symm
      (algebraMap k[X] (FractionRing k[X]) (a : k[X])) =
      algebraMap (algebra (1 : k[X])) (FractionRing (algebra (1 : k[X]))) a := by sorry

-- test: QuadraticPinch.fractionEquiv.fractions
example (q : k[X]) (hq : q ≠ 0) (a b : algebra q) :
    fractionEquiv q hq
      (algebraMap (algebra q) (FractionRing (algebra q)) a /
        algebraMap (algebra q) (FractionRing (algebra q)) b) =
      algebraMap k[X] (FractionRing k[X]) (a : k[X]) /
        algebraMap k[X] (FractionRing k[X]) (b : k[X]) := by sorry

-- test: QuadraticPinch.normalization.repeated_char3
example : (algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 3)[X])).val.toRingHom.Finite := by sorry

-- test: QuadraticPinch.normalization.integral_coordinate
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    IsIntegral (algebra q) (algebraMap k[X] (FractionRing k[X]) Polynomial.X) := by sorry

-- test: QuadraticPinch.normalization.zero_not_finite
example : ¬ (algebra (0 : k[X])).val.toRingHom.Finite := by sorry

end TauCeti.GenusOne.QuadraticPinch
/- END QUADRATIC AFFINE NORMALIZATION -/

/-!
Affine cokernel continuation, 2026-10-03. The actual native module actions are
specified below; the newly planned declarations and tests have admitted bodies.
Only the separate exact-header extraction is compiled. The full Tau Ceti-importing
file remains uncompiled; no global conductor/sheaf/cohomology closure is asserted.
-/

namespace TauCeti.GenusOne.QuadraticPinch

variable {k : Type u} [Field k]

-- Native quotient structure, made explicit because AdjoinRoot seals its polynomial action.
local instance polynomialQuotientAlgebra (q : k[X]) : Algebra k[X] (AdjoinRoot q) :=
  (AdjoinRoot.mk q).toAlgebra

local instance polynomialQuotientTower (q : k[X]) :
    IsScalarTower k k[X] (AdjoinRoot q) :=
  IsScalarTower.of_algebraMap_eq fun _ => rfl

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-cokernel-image-span
lemma normalization_image_span (q f : k[X]) :
    f ∈ Submodule.span (algebra q) ({1} : Set k[X]) ↔ f ∈ algebra q := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-cokernel-residue-image-span
lemma conductor_image_span (q : k[X]) (z : AdjoinRoot q) :
    z ∈ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q)) ↔
      z ∈ (⊥ : Subalgebra k (AdjoinRoot q)) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-cokernel-map
def residueCokernelMap (q : k[X]) :
    k[X] →ₗ[algebra q]
      AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q)) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-cokernel-map-apply
lemma residueCokernelMap_apply (q f : k[X]) :
    residueCokernelMap q f =
      (Submodule.Quotient.mk (AdjoinRoot.mk q f) :
        AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-cokernel-map-kernel
lemma residueCokernelMap_ker (q : k[X]) :
    LinearMap.ker (residueCokernelMap q) =
      Submodule.span (algebra q) ({1} : Set k[X]) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-cokernel-map-surjective
lemma residueCokernelMap_surjective (q : k[X]) :
    Function.Surjective (residueCokernelMap q) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-cokernel-equiv
noncomputable def residueCokernelEquiv (q : k[X]) :
    (k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) ≃ₗ[algebra q]
      AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q)) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-cokernel-equiv-apply
lemma residueCokernelEquiv_apply (q f : k[X]) :
    residueCokernelEquiv q (Submodule.Quotient.mk f) =
      (Submodule.Quotient.mk (AdjoinRoot.mk q f) :
        AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-cokernel-equiv-inverse
lemma residueCokernelEquiv_symm_apply (q f : k[X]) :
    (residueCokernelEquiv q).symm
      (Submodule.Quotient.mk (AdjoinRoot.mk q f)) =
        (Submodule.Quotient.mk f :
          k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-cokernel-residue-restrict-scalars
lemma conductor_span_restrictScalars (q : k[X]) :
    (Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))).restrictScalars k =
      (⊥ : Subalgebra k (AdjoinRoot q)).toSubmodule := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-cokernel-generator
lemma normalization_quotient_reconstruction (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) (f : k[X]) :
    (Submodule.Quotient.mk f :
      k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) =
        (moduleCoefficients q f).2 • Submodule.Quotient.mk Polynomial.X := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-cokernel-scalar-action
lemma normalization_quotient_scalar_action (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) (a : algebra q) (f : k[X]) :
    a • (Submodule.Quotient.mk f :
      k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) =
        residue q hq hd a • Submodule.Quotient.mk f := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-cokernel-generator-nonzero
lemma normalization_quotient_generator_ne_zero (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) :
    (Submodule.Quotient.mk Polynomial.X :
      k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) ≠ 0 := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-cokernel-annihilator-membership
lemma normalization_quotient_annihilator_mem (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) (a : algebra q) :
    a ∈ Module.annihilator (algebra q)
      (k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) ↔
        residue q hq hd a = 0 := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-cokernel-annihilator
lemma normalization_quotient_annihilator (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) :
    Module.annihilator (algebra q)
      (k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) =
        (Ideal.span ({q} : Set k[X])).comap (algebra q).val.toRingHom := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-cokernel-dimension
lemma normalization_quotient_finrank (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) :
    Module.finrank k (k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) = 1 := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-cokernel-residue-annihilator
lemma residueCokernelEquiv_annihilator (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) :
    Module.annihilator (algebra q)
      (AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))) =
        (Ideal.span ({q} : Set k[X])).comap (algebra q).val.toRingHom := by sorry

-- test: QuadraticPinch.residueCokernelMap.constant
example (q : k[X]) (c : k) : residueCokernelMap q (Polynomial.C c) = 0 := by sorry

-- test: QuadraticPinch.residueCokernelMap.multiple
example (q h : k[X]) : residueCokernelMap q (q * h) = 0 := by sorry

-- test: QuadraticPinch.residueCokernelMap.cusp_root
example : residueCokernelMap (Polynomial.X ^ 2 : (ZMod 2)[X]) Polynomial.X ≠ 0 := by sorry

-- test: QuadraticPinch.residueCokernelEquiv.representatives
example (q f : k[X]) :
    residueCokernelEquiv q (Submodule.Quotient.mk f) =
      (Submodule.Quotient.mk (AdjoinRoot.mk q f) :
        AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))) := by sorry

-- test: QuadraticPinch.residueCokernelEquiv.unit
example (f : k[X]) :
    residueCokernelEquiv (1 : k[X]) (Submodule.Quotient.mk f) = 0 := by sorry

-- test: QuadraticPinch.residueCokernelEquiv.zero
example (f : k[X]) :
    (residueCokernelEquiv (0 : k[X])).symm
      (Submodule.Quotient.mk (AdjoinRoot.mk 0 f)) =
        (Submodule.Quotient.mk f :
          k[X] ⧸ Submodule.span (algebra (0 : k[X])) ({1} : Set k[X])) := by sorry

-- test: QuadraticPinch.normalizationCokernel.cusp_dimension
example :
    Module.finrank (ZMod 2)
      ((ZMod 2)[X] ⧸ Submodule.span (algebra (Polynomial.X ^ 2 : (ZMod 2)[X]))
        ({1} : Set (ZMod 2)[X])) = 1 := by sorry

-- test: QuadraticPinch.normalizationCokernel.nonsplit_dimension
example :
    Module.finrank (ZMod 2)
      ((ZMod 2)[X] ⧸ Submodule.span
        (algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 2)[X]))
        ({1} : Set (ZMod 2)[X])) = 1 := by sorry

-- test: QuadraticPinch.residueCokernelEquiv.repeated_char3
example :
    Module.annihilator
      (algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 3)[X]))
      (AdjoinRoot (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 3)[X]) ⧸
        Submodule.span
          (algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 3)[X]))
          ({1} : Set (AdjoinRoot (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 3)[X])))) =
      (Ideal.span ({Polynomial.X ^ 2 + Polynomial.X + 1} : Set (ZMod 3)[X])).comap
        (algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 3)[X])).val.toRingHom := by sorry

-- test: QuadraticPinch.normalizationCokernel.unit_not_annihilator
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    (1 : algebra q) ∉ Module.annihilator (algebra q)
      (k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) := by sorry

-- test: QuadraticPinch.normalizationCokernel.conductor_action
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) (f : k[X]) :
    (⟨q, (mem_algebra q _).mpr ⟨0, 1, by simp⟩⟩ : algebra q) •
      (Submodule.Quotient.mk f :
        k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) = 0 := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-cokernel-residue-scalar-action
lemma residueCokernelEquiv_scalar_action (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) (a : algebra q) (z : AdjoinRoot q) :
    a • (Submodule.Quotient.mk z :
      AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))) =
        residue q hq hd a • Submodule.Quotient.mk z := by sorry

-- test: QuadraticPinch.residueCokernelEquiv.scalar_action
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (a : algebra q) (z : AdjoinRoot q) :
    a • (Submodule.Quotient.mk z :
      AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))) =
        residue q hq hd a • Submodule.Quotient.mk z := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-cokernel-normalization-restrict-scalars
lemma normalization_span_restrictScalars (q : k[X]) :
    (Submodule.span (algebra q) ({1} : Set k[X])).restrictScalars k =
      (algebra q).toSubmodule := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-cokernel-equiv-over-k
noncomputable def residueCokernelEquiv_over_k (q : k[X]) :
    (k[X] ⧸ (algebra q).toSubmodule) ≃ₗ[k]
      AdjoinRoot q ⧸ (⊥ : Subalgebra k (AdjoinRoot q)).toSubmodule := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-cokernel-equiv-over-k-apply
lemma residueCokernelEquiv_over_k_apply (q f : k[X]) :
    residueCokernelEquiv_over_k q (Submodule.Quotient.mk f) =
      (Submodule.Quotient.mk (AdjoinRoot.mk q f) :
        AdjoinRoot q ⧸ (⊥ : Subalgebra k (AdjoinRoot q)).toSubmodule) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-cokernel-equiv-over-k-inverse
lemma residueCokernelEquiv_over_k_symm_apply (q f : k[X]) :
    (residueCokernelEquiv_over_k q).symm
      (Submodule.Quotient.mk (AdjoinRoot.mk q f)) =
        (Submodule.Quotient.mk f : k[X] ⧸ (algebra q).toSubmodule) := by sorry

-- test: QuadraticPinch.residueCokernelEquiv_over_k.cusp
example (f : (ZMod 2)[X]) :
    residueCokernelEquiv_over_k (Polynomial.X ^ 2 : (ZMod 2)[X])
      (Submodule.Quotient.mk f) =
      (Submodule.Quotient.mk (AdjoinRoot.mk (Polynomial.X ^ 2) f) :
        AdjoinRoot (Polynomial.X ^ 2 : (ZMod 2)[X]) ⧸
          (⊥ : Subalgebra (ZMod 2) (AdjoinRoot (Polynomial.X ^ 2 : (ZMod 2)[X]))).toSubmodule) := by sorry

-- test: QuadraticPinch.residueCokernelEquiv_over_k.unit
example (f : k[X]) :
    residueCokernelEquiv_over_k (1 : k[X]) (Submodule.Quotient.mk f) = 0 := by sorry

-- test: QuadraticPinch.residueCokernelEquiv_over_k.zero
example (f : k[X]) :
    (residueCokernelEquiv_over_k (0 : k[X])).symm
      (Submodule.Quotient.mk (AdjoinRoot.mk 0 f)) =
        (Submodule.Quotient.mk f : k[X] ⧸ (algebra (0 : k[X])).toSubmodule) := by sorry

end TauCeti.GenusOne.QuadraticPinch


/-! Specialized reciprocal infinity chart. The actual native quotient carrier is retained; mathematical bodies and tests are admitted planning signatures. Projective gluing and sheaf/cohomology comparison remain required. -/

namespace TauCeti.GenusOne.QuadraticPinch.InfinityChart
variable {R : Type u} [CommRing R]

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-curve
def curve (a b : R) : WeierstrassCurve R := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-denominator
def denominator (a b : R) : R[X] := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-relation
def relation (a b : R) : R[X][X] := by sorry

abbrev Chart (a b : R) := AdjoinRoot (relation a b)

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-equation-chart
lemma equation_chart (a b u z : R) :
    (curve a b).toProjective.Equation ![u, 1, z] ↔
      z * (1 + a * u + b * u ^ 2) = u ^ 3 := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-bezout
lemma bezout (a b : R) :
    denominator a b * (1 - C a * X + C (a ^ 2 - b) * X ^ 2) =
      1 + X ^ 3 * (C (a ^ 3 - 2 * a * b) + C (b * (a ^ 2 - b)) * X) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-root-relation
lemma root_relation (a b : R) :
    algebraMap R[X] (Chart a b) (denominator a b) * AdjoinRoot.root (relation a b) =
      algebraMap R[X] (Chart a b) (X ^ 3) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-denominator-inverse
def denominatorInverse (a b : R) : Chart a b := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-mul-inverse
lemma mul_inverse (a b : R) :
    algebraMap R[X] (Chart a b) (denominator a b) * denominatorInverse a b = 1 := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-denominator-is-unit
lemma denominator_isUnit (a b : R) :
    IsUnit (algebraMap R[X] (Chart a b) (denominator a b)) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-to-localization
def toLocalization (a b : R) : Chart a b →ₐ[R[X]] Localization.Away (denominator a b) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-from-localization
def fromLocalization (a b : R) : Localization.Away (denominator a b) →ₐ[R[X]] Chart a b := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-to-localization-root
lemma toLocalization_root (a b : R) :
    toLocalization a b (AdjoinRoot.root (relation a b)) =
      algebraMap R[X] (Localization.Away (denominator a b)) (X ^ 3) *
        IsLocalization.Away.invSelf (denominator a b) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-to-from
lemma to_from (a b : R) :
    (toLocalization a b).comp (fromLocalization a b) = AlgHom.id R[X] _ := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-from-to
lemma from_to (a b : R) :
    (fromLocalization a b).comp (toLocalization a b) = AlgHom.id R[X] _ := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-equiv
def equiv (a b : R) : Chart a b ≃ₐ[R[X]] Localization.Away (denominator a b) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-equiv-base
lemma equiv_base (a b : R) (f : R[X]) :
    equiv a b (algebraMap R[X] (Chart a b) f) =
      algebraMap R[X] (Localization.Away (denominator a b)) f := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-equiv-root
lemma equiv_root (a b : R) :
    equiv a b (AdjoinRoot.root (relation a b)) =
      algebraMap R[X] (Localization.Away (denominator a b)) (X ^ 3) *
        IsLocalization.Away.invSelf (denominator a b) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-from-localization-inv
lemma fromLocalization_inv (a b : R) :
    fromLocalization a b (IsLocalization.Away.invSelf (denominator a b)) =
      denominatorInverse a b := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-equiv-inverse-base
lemma equiv_inverse_base (a b : R) (f : R[X]) :
    (equiv a b).symm (algebraMap R[X] (Localization.Away (denominator a b)) f) =
      algebraMap R[X] (Chart a b) f := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-equiv-inverse-inv
lemma equiv_inverse_inv (a b : R) :
    (equiv a b).symm (IsLocalization.Away.invSelf (denominator a b)) =
      denominatorInverse a b := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-localization
lemma localization (a b : R) :
    IsLocalization.Away (denominator a b) (Chart a b) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-spec-open-immersion
lemma spec_openImmersion (a b : R) :
    AlgebraicGeometry.IsOpenImmersion (AlgebraicGeometry.Spec.map
      (CommRingCat.ofHom (algebraMap R[X] (Chart a b)))) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-normalization-coordinates
def normalizationCoordinates (a b T U : R) : Fin 3 → R := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-normalization-homogeneous
lemma normalization_homogeneous (a b T U r : R) :
    normalizationCoordinates a b (r * T) (r * U) =
      r ^ 3 • normalizationCoordinates a b T U := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-normalization-nonzero
lemma normalization_nonzero {k : Type u} [Field k] (a b T U : k)
    (h : T ≠ 0 ∨ U ≠ 0) : normalizationCoordinates a b T U ≠ 0 := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-normalization-equation
lemma normalization_equation (a b T U : R) :
    (curve a b).toProjective.Equation (normalizationCoordinates a b T U) := by sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-infinity-infinity-nonsingular
lemma infinity_nonsingular {k : Type u} [Field k] (a b : k) :
    (curve a b).toProjective.Nonsingular ![0, 1, 0] := by sorry

-- test: InfinityChart.normalizationCoordinates.finite
example (a b t : R) : normalizationCoordinates a b t 1 =
    ![t ^ 2 + a * t + b, t * (t ^ 2 + a * t + b), 1] := by sorry

-- test: InfinityChart.normalizationCoordinates.infinity
example (a b : R) : normalizationCoordinates a b 1 0 = ![0, 1, 0] := by sorry

-- test: InfinityChart.normalizationCoordinates.nonzero_char2
example : normalizationCoordinates (0 : ZMod 2) 1 1 0 ≠ 0 := by sorry

-- test: InfinityChart.curve.origin
example (a b : R) : (curve a b).toProjective.Equation ![0, 0, 1] := by sorry

-- test: InfinityChart.curve.finite_normalization
example (a b t : R) : (curve a b).toProjective.Equation
    ![t ^ 2 + a * t + b, t * (t ^ 2 + a * t + b), 1] := by sorry

-- test: InfinityChart.curve.infinity_smooth
example (a b : ZMod 2) : (curve a b).toProjective.Nonsingular ![0, 1, 0] := by sorry

-- test: InfinityChart.denominator.constant
example (a b : R) : (denominator a b).coeff 0 = 1 := by sorry

-- test: InfinityChart.denominator.cusp
example : denominator (0 : R) 0 = 1 := by sorry

-- test: InfinityChart.denominator.base_change
example {S : Type*} [CommRing S] (f : R →+* S) (a b : R) :
    (denominator a b).map f = denominator (f a) (f b) := by sorry

-- test: InfinityChart.relation.leading
example (a b : R) : (relation a b).coeff 1 = denominator a b := by sorry

-- test: InfinityChart.relation.constant
example (a b : R) : (relation a b).coeff 0 = -(X ^ 3 : R[X]) := by sorry

-- test: InfinityChart.relation.cusp
example : relation (0 : R) 0 = X - C (X ^ 3 : R[X]) := by sorry

-- test: InfinityChart.denominatorInverse.cusp
example : denominatorInverse (0 : R) 0 = 1 := by sorry

-- test: InfinityChart.denominatorInverse.nonreduced
example : algebraMap (ZMod 4)[X] (Chart (2 : ZMod 4) 0) (1 + C 2 * X) *
    denominatorInverse (2 : ZMod 4) 0 = 1 := by sorry

-- test: InfinityChart.denominatorInverse.repeated_char2
example : algebraMap (ZMod 2)[X] (Chart (0 : ZMod 2) 1) (1 + X ^ 2) *
    denominatorInverse (0 : ZMod 2) 1 = 1 := by sorry

-- test: InfinityChart.toLocalization.base
example (a b : R) (f : R[X]) :
    toLocalization a b (algebraMap R[X] (Chart a b) f) =
      algebraMap R[X] (Localization.Away (denominator a b)) f := by sorry

-- test: InfinityChart.toLocalization.root
example (a b : R) :
    toLocalization a b (AdjoinRoot.root (relation a b)) =
      algebraMap R[X] (Localization.Away (denominator a b)) (X ^ 3) *
        IsLocalization.Away.invSelf (denominator a b) := by sorry

-- test: InfinityChart.toLocalization.cusp
example : toLocalization (0 : R) 0 (AdjoinRoot.root (relation (0 : R) 0)) =
    algebraMap R[X] (Localization.Away (denominator (0 : R) 0)) (X ^ 3) := by sorry

-- test: InfinityChart.fromLocalization.base
example (a b : R) (f : R[X]) :
    fromLocalization a b (algebraMap R[X] (Localization.Away (denominator a b)) f) =
      algebraMap R[X] (Chart a b) f := by sorry

-- test: InfinityChart.fromLocalization.inverse
example (a b : R) : fromLocalization a b
    (IsLocalization.Away.invSelf (denominator a b)) = denominatorInverse a b := by sorry

-- test: InfinityChart.fromLocalization.cusp
example : fromLocalization (0 : R) 0
    (IsLocalization.Away.invSelf (denominator (0 : R) 0)) = 1 := by sorry

-- test: InfinityChart.equiv.actual_forward
example (a b : R) : (equiv a b).toAlgHom = toLocalization a b := by sorry

-- test: InfinityChart.equiv.actual_inverse
example (a b : R) : (equiv a b).symm.toAlgHom = fromLocalization a b := by sorry

-- test: InfinityChart.equiv.coefficient
example (a b : R) (f : R[X]) :
    (equiv a b).symm (equiv a b (algebraMap R[X] (Chart a b) f)) =
      algebraMap R[X] (Chart a b) f := by sorry

end TauCeti.GenusOne.QuadraticPinch.InfinityChart

/- BEGIN QUADRATIC OVERLAP COMPARISON -/

namespace TauCeti.GenusOne.QuadraticPinch.Overlap

variable {R : Type u} [CommRing R]

def quadratic (c a b : R) : R[X] := by sorry

abbrev Ring (c a b : R) := Localization.Away (X * quadratic c a b)

def coordinate (c a b : R) : Ring c a b := by sorry

def inverseVariable (c a b : R) : Ring c a b := by sorry

lemma coordinate_mul_inverse (c a b : R) :
    coordinate c a b * inverseVariable c a b = 1 := by sorry

lemma inverse_isUnit (c a b : R) : IsUnit (inverseVariable c a b) := by sorry

lemma quadratic_isUnit (c a b : R) :
    IsUnit (algebraMap R[X] (Ring c a b) (quadratic c a b)) := by sorry

lemma reciprocal_quadratic (c a b : R) :
    aeval (inverseVariable b a c) (quadratic c a b) =
      inverseVariable b a c ^ 2 * algebraMap R[X] (Ring b a c) (quadratic b a c) := by sorry

lemma reciprocal_denominator_isUnit (c a b : R) :
    IsUnit (aeval (inverseVariable b a c) (X * quadratic c a b)) := by sorry

def reciprocal (c a b : R) : Ring c a b →ₐ[R] Ring b a c := by sorry

lemma reciprocal_algebraMap (c a b : R) (f : R[X]) :
    reciprocal c a b (algebraMap R[X] (Ring c a b) f) =
      aeval (inverseVariable b a c) f := by sorry

lemma reciprocal_coordinate (c a b : R) :
    reciprocal c a b (coordinate c a b) = inverseVariable b a c := by sorry

lemma reciprocal_inverse (c a b : R) :
    reciprocal c a b (inverseVariable c a b) = coordinate b a c := by sorry

lemma reciprocal_comp (c a b : R) :
    (reciprocal b a c).comp (reciprocal c a b) = AlgHom.id R (Ring c a b) := by sorry

def equiv (c a b : R) : Ring c a b ≃ₐ[R] Ring b a c := by sorry

end TauCeti.GenusOne.QuadraticPinch.Overlap
namespace TauCeti.GenusOne.QuadraticPinch.Overlap
variable {R : Type u} [CommRing R]

lemma equiv_coordinate (c a b : R) :
    equiv c a b (coordinate c a b) = inverseVariable b a c := by sorry

lemma equiv_inverse (c a b : R) :
    equiv c a b (inverseVariable c a b) = coordinate b a c := by sorry

lemma equiv_algebraMap (c a b : R) (f : R[X]) :
    equiv c a b (algebraMap R[X] (Ring c a b) f) =
      aeval (inverseVariable b a c) f := by sorry

lemma equiv_symm (c a b : R) : (equiv c a b).symm = equiv b a c := by sorry

lemma quadratic_monic (a b : R) : quadratic 1 a b = X ^ 2 + C a * X + C b := by sorry

lemma quadratic_reversed (a b : R) : quadratic b a 1 = InfinityChart.denominator a b := by sorry

lemma coordinate_isUnit (c a b : R) : IsUnit (coordinate c a b) := by sorry

lemma normalization_overlap (a b : R) :
    InfinityChart.normalizationCoordinates
      (algebraMap R (Ring 1 a b) a) (algebraMap R (Ring 1 a b) b)
      1 (inverseVariable 1 a b) =
    inverseVariable 1 a b ^ 3 • InfinityChart.normalizationCoordinates
      (algebraMap R (Ring 1 a b) a) (algebraMap R (Ring 1 a b) b)
      (coordinate 1 a b) 1 := by sorry

open CategoryTheory

def specIso (c a b : R) :
    AlgebraicGeometry.Spec (.of (Ring b a c)) ≅
      AlgebraicGeometry.Spec (.of (Ring c a b)) := by sorry

lemma specIso_hom (c a b : R) : (specIso c a b).hom =
    AlgebraicGeometry.Spec.map (CommRingCat.ofHom (equiv c a b).toRingHom) := by sorry

lemma specIso_inv (c a b : R) : (specIso c a b).inv =
    AlgebraicGeometry.Spec.map (CommRingCat.ofHom (equiv b a c).toRingHom) := by sorry

lemma specIso_hom_inv (c a b : R) :
    (specIso c a b).hom ≫ (specIso c a b).inv = 𝟙 _ := by sorry

section FinitePinch
variable {k : Type u} [Field k]

abbrev finiteDenominator (c a b : k) : (algebra (quadratic c a b)).toSubring :=
  ⟨X * quadratic c a b, by sorry⟩

lemma finiteDenominator_val (c a b : k) :
    (finiteDenominator c a b : k[X]) = X * quadratic c a b := by sorry

lemma finiteDenominator_conductor (c a b : k) :
    (finiteDenominator c a b : k[X]) ∈ (algebra (quadratic c a b)).toSubring.conductor := by sorry

lemma finite_localization (c a b : k) :
    IsLocalization.Away ((algebra (quadratic c a b)).toSubring.subtype
      (finiteDenominator c a b)) (Ring c a b) := by sorry

attribute [local instance] finite_localization

lemma finite_away_bijective (c a b : k) :
    Function.Bijective (IsLocalization.Away.map
      (Localization.Away (finiteDenominator c a b)) (Ring c a b)
      (algebra (quadratic c a b)).toSubring.subtype (finiteDenominator c a b)) := by sorry

def finiteEquiv (c a b : k) :
    Localization.Away (finiteDenominator c a b) ≃+* Ring c a b := by sorry

lemma finiteEquiv_apply (c a b : k) (x : Localization.Away (finiteDenominator c a b)) :
    finiteEquiv c a b x = IsLocalization.Away.map
      (Localization.Away (finiteDenominator c a b)) (Ring c a b)
      (algebra (quadratic c a b)).toSubring.subtype (finiteDenominator c a b) x := by sorry

lemma finiteEquiv_algebraMap (c a b : k) (f : (algebra (quadratic c a b)).toSubring) :
    finiteEquiv c a b (algebraMap _ _ f) = algebraMap k[X] (Ring c a b) (f : k[X]) := by sorry

lemma finiteEquiv_symm_algebraMap (c a b : k) (f : (algebra (quadratic c a b)).toSubring) :
    (finiteEquiv c a b).symm (algebraMap k[X] (Ring c a b) (f : k[X])) =
      algebraMap _ _ f := by sorry

end FinitePinch
end TauCeti.GenusOne.QuadraticPinch.Overlap
namespace TauCeti.GenusOne.QuadraticPinch.Overlap
variable {R : Type u} [CommRing R]

abbrev InfinityOpen (a b : R) := Localization.Away
  (algebraMap R[X] (InfinityChart.Chart a b) X)

lemma infinity_localization (a b : R) :
    IsLocalization.Away (X * quadratic b a 1) (InfinityOpen a b) := by sorry

attribute [local instance] infinity_localization

def infinityEquiv (a b : R) : InfinityOpen a b ≃ₐ[R[X]] Ring b a 1 := by sorry

lemma infinityEquiv_algebraMap (a b : R) (f : R[X]) :
    infinityEquiv a b (algebraMap R[X] (InfinityOpen a b) f) =
      algebraMap R[X] (Ring b a 1) f := by sorry

lemma infinityEquiv_symm_algebraMap (a b : R) (f : R[X]) :
    (infinityEquiv a b).symm (algebraMap R[X] (Ring b a 1) f) =
      algebraMap R[X] (InfinityOpen a b) f := by sorry

lemma infinityEquiv_roundtrip (a b : R) (x : InfinityOpen a b) :
    (infinityEquiv a b).symm (infinityEquiv a b x) = x := by sorry

lemma infinity_root_isUnit_iff (a b : R) {S : Type v} [CommRing S]
    (f : InfinityChart.Chart a b →+* S) :
    IsUnit (f (AdjoinRoot.root (InfinityChart.relation a b))) ↔
      IsUnit (f (algebraMap R[X] (InfinityChart.Chart a b) X)) := by sorry

lemma infinity_basicOpen_root (a b : R) :
    PrimeSpectrum.basicOpen (AdjoinRoot.root (InfinityChart.relation a b)) =
      PrimeSpectrum.basicOpen (algebraMap R[X] (InfinityChart.Chart a b) X) := by sorry

section FinitePinch
variable {k : Type u} [Field k]

def chartEquiv (a b : k) : Localization.Away (finiteDenominator 1 a b) ≃+* InfinityOpen a b := by sorry

lemma chartEquiv_algebraMap (a b : k) (f : (algebra (quadratic 1 a b)).toSubring) :
    chartEquiv a b (algebraMap _ _ f) =
      (infinityEquiv a b).symm (aeval (inverseVariable b a 1) (f : k[X])) := by sorry

lemma chartEquiv_roundtrip (a b : k) (x : Localization.Away (finiteDenominator 1 a b)) :
    (chartEquiv a b).symm (chartEquiv a b x) = x := by sorry

lemma chartEquiv_inverse_roundtrip (a b : k) (x : InfinityOpen a b) :
    chartEquiv a b ((chartEquiv a b).symm x) = x := by sorry

end FinitePinch
end TauCeti.GenusOne.QuadraticPinch.Overlap
namespace TauCeti.GenusOne.QuadraticPinch.Overlap
open CategoryTheory
variable {R : Type u} [CommRing R]

lemma quadratic_aeval (c a b x : R) : aeval x (quadratic c a b) = c * x ^ 2 + a * x + b := by sorry

lemma coordinate_algebraMap (c a b : R) :
    coordinate c a b = algebraMap R[X] (Ring c a b) X := by sorry

lemma inverseVariable_formula (c a b : R) :
    inverseVariable c a b = algebraMap R[X] (Ring c a b) (quadratic c a b) *
      IsLocalization.Away.invSelf (X * quadratic c a b) := by sorry

lemma infinityOpen_coordinate_isUnit (a b : R) :
    IsUnit (algebraMap (InfinityChart.Chart a b) (InfinityOpen a b)
      (algebraMap R[X] (InfinityChart.Chart a b) X)) := by sorry

-- test: Overlap.quadratic.zero
example : quadratic (0 : R) 0 0 = 0 := by sorry

-- test: Overlap.quadratic.nonreduced
example : aeval (2 : ZMod 4) (quadratic (2 : ZMod 4) 1 1) = 3 := by sorry

-- test: Overlap.quadratic.reversal_not_equal
example : quadratic (1 : ℤ) 0 2 ≠ quadratic 2 0 1 := by sorry

-- test: Overlap.Ring.zero_polynomial
example : (0 : Ring (0 : R) 0 0) = 1 := by sorry

-- test: Overlap.Ring.coordinate_unit_nonreduced
example : IsUnit (coordinate (2 : ZMod 4) 2 1) := by sorry

-- test: Overlap.Ring.quadratic_unit_nonsplit
example : IsUnit (algebraMap (ZMod 2)[X] (Ring (1 : ZMod 2) 1 1)
    (X ^ 2 + X + 1)) := by sorry

-- test: Overlap.coordinate.cusp
example : coordinate (1 : ZMod 2) 0 0 * inverseVariable 1 0 0 = 1 := by sorry

-- test: Overlap.coordinate.nonreduced
example : coordinate (2 : ZMod 4) 2 1 * inverseVariable 2 2 1 = 1 := by sorry

-- test: Overlap.coordinate.generator
example (c a b : R) : aeval (coordinate c a b) (X : R[X]) =
    algebraMap R[X] (Ring c a b) X := by sorry

-- test: Overlap.inverseVariable.left_inverse
example (c a b : R) : inverseVariable c a b * coordinate c a b = 1 := by sorry

-- test: Overlap.inverseVariable.unit_split
example : IsUnit (inverseVariable (1 : ℚ) 0 (-1)) := by sorry

-- test: Overlap.inverseVariable.zero_ring
example : inverseVariable (0 : ZMod 1) 0 0 = 1 := by sorry

-- test: Overlap.reciprocal.coefficient
example (c a b r : R) : reciprocal c a b (algebraMap R (Ring c a b) r) =
    algebraMap R (Ring b a c) r := by sorry

-- test: Overlap.reciprocal.general_quadratic
example (c a b : R) : reciprocal c a b (algebraMap R[X] (Ring c a b) (quadratic c a b)) =
    inverseVariable b a c ^ 2 * algebraMap R[X] (Ring b a c) (quadratic b a c) := by sorry

-- test: Overlap.reciprocal.twice
example (c a b : R) (x : Ring c a b) : reciprocal b a c (reciprocal c a b x) = x := by sorry

-- test: Overlap.equiv.cusp
example : equiv (1 : ZMod 2) 0 0 (coordinate 1 0 0) = inverseVariable 0 0 1 := by sorry

-- test: Overlap.equiv.nonsplit
example : equiv (1 : ZMod 2) 1 1 (inverseVariable 1 1 1) = coordinate 1 1 1 := by sorry

-- test: Overlap.equiv.nonreduced_roundtrip
example (x : Ring (2 : ZMod 4) 2 1) : equiv 1 2 2 (equiv 2 2 1 x) = x := by sorry

-- test: Overlap.specIso.cusp
example : (specIso (1 : ZMod 2) 0 0).hom ≫ (specIso 1 0 0).inv = 𝟙 _ := by sorry

-- test: Overlap.specIso.nonreduced
example : (specIso (2 : ZMod 4) 2 1).inv ≫ (specIso 2 2 1).hom = 𝟙 _ := by sorry

-- test: Overlap.specIso.actual_map
example (c a b : R) : (specIso c a b).hom =
    AlgebraicGeometry.Spec.map (CommRingCat.ofHom (reciprocal c a b).toRingHom) := by sorry

-- test: Overlap.finiteDenominator.cusp
example : (finiteDenominator (1 : ZMod 2) 0 0 : (ZMod 2)[X]) = X ^ 3 := by sorry

-- test: Overlap.finiteDenominator.split
example : (finiteDenominator (1 : ℚ) 0 (-1) : ℚ[X]) = X ^ 3 - X := by sorry

-- test: Overlap.finiteDenominator.zero
example : (finiteDenominator (0 : ℚ) 0 0 : ℚ[X]) = 0 := by sorry

-- test: Overlap.finiteEquiv.cusp
example : finiteEquiv (1 : ZMod 2) 0 0 (algebraMap _ _ (finiteDenominator (1 : ZMod 2) 0 0)) =
    algebraMap (ZMod 2)[X] (Ring (1 : ZMod 2) 0 0) (X ^ 3) := by sorry

-- test: Overlap.finiteEquiv.nonsplit
example (f : (algebra (quadratic (1 : ZMod 2) 1 1)).toSubring) :
    (finiteEquiv (1 : ZMod 2) 1 1).symm (algebraMap (ZMod 2)[X] (Ring (1 : ZMod 2) 1 1) (f : (ZMod 2)[X])) =
      algebraMap _ _ f := by sorry

-- test: Overlap.finiteEquiv.zero_roundtrip
example (x : Localization.Away (finiteDenominator (0 : ℚ) 0 0)) :
    (finiteEquiv (0 : ℚ) 0 0).symm (finiteEquiv 0 0 0 x) = x := by sorry

-- test: Overlap.InfinityOpen.root_cusp
example : PrimeSpectrum.basicOpen (AdjoinRoot.root (InfinityChart.relation (0 : ZMod 2) 0)) =
    PrimeSpectrum.basicOpen (algebraMap (ZMod 2)[X] (InfinityChart.Chart (0 : ZMod 2) 0) X) := by sorry

-- test: Overlap.InfinityOpen.root_nonreduced
example {S : Type v} [CommRing S] (f : InfinityChart.Chart (2 : ZMod 4) 1 →+* S) :
    IsUnit (f (AdjoinRoot.root (InfinityChart.relation (2 : ZMod 4) 1))) ↔
      IsUnit (f (algebraMap (ZMod 4)[X] (InfinityChart.Chart (2 : ZMod 4) 1) X)) := by sorry

-- test: Overlap.InfinityOpen.coordinate_nonsplit
example : IsUnit (algebraMap (InfinityChart.Chart (1 : ZMod 2) 1) (InfinityOpen (1 : ZMod 2) 1)
    (algebraMap (ZMod 2)[X] (InfinityChart.Chart (1 : ZMod 2) 1) X)) := by sorry

-- test: Overlap.infinityEquiv.polynomial
example (a b : R) : infinityEquiv a b (algebraMap R[X] (InfinityOpen a b) (X ^ 2 + C a)) =
    algebraMap R[X] (Ring b a 1) (X ^ 2 + C a) := by sorry

-- test: Overlap.infinityEquiv.inverse_coordinate
example (a b : R) : (infinityEquiv a b).symm (coordinate b a 1) =
    algebraMap R[X] (InfinityOpen a b) X := by sorry

-- test: Overlap.infinityEquiv.nonreduced
example (x : InfinityOpen (2 : ZMod 4) 1) :
    (infinityEquiv (2 : ZMod 4) 1).symm (infinityEquiv 2 1 x) = x := by sorry

-- test: Overlap.chartEquiv.cusp
example (x : Localization.Away (finiteDenominator (1 : ZMod 2) 0 0)) :
    (chartEquiv (0 : ZMod 2) 0).symm (chartEquiv 0 0 x) = x := by sorry

-- test: Overlap.chartEquiv.nonsplit
example (x : InfinityOpen (1 : ZMod 2) 1) :
    chartEquiv (1 : ZMod 2) 1 ((chartEquiv 1 1).symm x) = x := by sorry

-- test: Overlap.chartEquiv.split_formula
example (f : (algebra (quadratic (1 : ℚ) 0 (-1))).toSubring) :
    chartEquiv (0 : ℚ) (-1) (algebraMap _ _ f) =
      (infinityEquiv (0 : ℚ) (-1)).symm (aeval (inverseVariable (-1 : ℚ) 0 1) (f : ℚ[X])) := by sorry

-- test: Overlap.normalization_overlap.nonreduced
example : InfinityChart.normalizationCoordinates
    (algebraMap (ZMod 4) (Ring (1 : ZMod 4) 2 2) 2) (algebraMap (ZMod 4) (Ring (1 : ZMod 4) 2 2) 2)
    1 (inverseVariable (1 : ZMod 4) 2 2) = inverseVariable (1 : ZMod 4) 2 2 ^ 3 • InfinityChart.normalizationCoordinates
    (algebraMap (ZMod 4) (Ring (1 : ZMod 4) 2 2) 2) (algebraMap (ZMod 4) (Ring (1 : ZMod 4) 2 2) 2)
    (coordinate (1 : ZMod 4) 2 2) 1 := by sorry

end TauCeti.GenusOne.QuadraticPinch.Overlap
/- END QUADRATIC OVERLAP COMPARISON -/

/- BEGIN TWO CHART SCHEME GLUING -/
namespace TauCeti.GenusOne.QuadraticPinch.Global
open CategoryTheory CategoryTheory.Limits AlgebraicGeometry
open Overlap
variable {k : Type u} [Field k]

abbrev finiteChart (a b : k) : Scheme := Spec (.of (algebra (quadratic 1 a b)))
abbrev infinityChart (a b : k) : Scheme := Spec (.of (InfinityChart.Chart a b))
abbrev overlapChart (a b : k) : Scheme := Spec (.of (Ring 1 a b))

-- node: G.1/global-finite-open
/-- The specified finite principal open, expressed in normalized overlap coordinates. -/
def finiteOpen (a b : k) : overlapChart a b ⟶ finiteChart a b := by sorry

lemma finiteOpen_eq (a b : k) : finiteOpen a b =
    (Scheme.Spec.mapIso (finiteEquiv 1 a b).toCommRingCatIso.op).hom ≫
      Spec.map (CommRingCat.ofHom (algebraMap (algebra (quadratic 1 a b))
        (Localization.Away (finiteDenominator 1 a b)))) := by sorry

lemma finiteOpen_isOpenImmersion (a b : k) : IsOpenImmersion (finiteOpen a b) := by sorry

attribute [instance] finiteOpen_isOpenImmersion

lemma finiteOpen_range (a b : k) :
    (finiteOpen a b).opensRange = PrimeSpectrum.basicOpen (finiteDenominator 1 a b) := by sorry

-- node: G.1/global-infinity-open
def infinityOpen (a b : k) : overlapChart a b ⟶ infinityChart a b := by sorry

lemma infinityOpen_isOpenImmersion (a b : k) : IsOpenImmersion (infinityOpen a b) := by sorry

attribute [instance] infinityOpen_isOpenImmersion

lemma infinityOpen_range (a b : k) :
    (infinityOpen a b).opensRange = PrimeSpectrum.basicOpen
      (algebraMap k[X] (InfinityChart.Chart a b) X) := by sorry

-- node: G.1/global-curve
/-- The actual two-chart scheme, with the specified reciprocal transition. -/
def curve (a b : k) : Scheme := by sorry

abbrev finiteι (a b : k) : finiteChart a b ⟶ curve a b := by sorry

abbrev infinityι (a b : k) : infinityChart a b ⟶ curve a b := by sorry

lemma finiteι_isOpenImmersion (a b : k) : IsOpenImmersion (finiteι a b) := by sorry

lemma infinityι_isOpenImmersion (a b : k) : IsOpenImmersion (infinityι a b) := by sorry

attribute [instance] finiteι_isOpenImmersion infinityι_isOpenImmersion

lemma chart_condition (a b : k) :
    finiteOpen a b ≫ finiteι a b = infinityOpen a b ≫ infinityι a b := by sorry

lemma curve_hom_ext (a b : k) {Y : Scheme} (f g : curve a b ⟶ Y)
    (h₀ : finiteι a b ≫ f = finiteι a b ≫ g)
    (h₁ : infinityι a b ≫ f = infinityι a b ≫ g) : f = g := by sorry

lemma charts_cover (a b : k) (x : curve a b) :
    (∃ y : finiteChart a b, finiteι a b y = x) ∨
      (∃ y : infinityChart a b, infinityι a b y = x) := by sorry

lemma charts_intersection (a b : k) (x : finiteChart a b) (y : infinityChart a b) :
    finiteι a b x = infinityι a b y ↔
      ∃ z : overlapChart a b, finiteOpen a b z = x ∧ infinityOpen a b z = y := by sorry

lemma chart_preimage (a b : k) :
    finiteι a b ⁻¹ᵁ (infinityι a b).opensRange = (finiteOpen a b).opensRange := by sorry

lemma chart_isPullback (a b : k) :
    IsPullback (infinityOpen a b) (finiteOpen a b) (infinityι a b) (finiteι a b) := by sorry

-- node: G.1/global-curve-desc
def desc (a b : k) {Y : Scheme} (f : finiteChart a b ⟶ Y)
    (g : infinityChart a b ⟶ Y) (h : finiteOpen a b ≫ f = infinityOpen a b ≫ g) :
    curve a b ⟶ Y := by sorry

lemma finiteι_desc (a b : k) {Y : Scheme} (f : finiteChart a b ⟶ Y)
    (g : infinityChart a b ⟶ Y) (h : finiteOpen a b ≫ f = infinityOpen a b ≫ g) :
    finiteι a b ≫ desc a b f g h = f := by sorry

lemma infinityι_desc (a b : k) {Y : Scheme} (f : finiteChart a b ⟶ Y)
    (g : infinityChart a b ⟶ Y) (h : finiteOpen a b ≫ f = infinityOpen a b ≫ g) :
    infinityι a b ≫ desc a b f g h = g := by sorry

-- node: G.1/global-normalization-chart
def normalizationChart (a b : k) : Spec (.of k[X]) ⟶ finiteChart a b := by sorry

lemma normalizationChart_isFinite (a b : k) : AlgebraicGeometry.IsFinite (normalizationChart a b) := by sorry

-- node: G.1/global-normalization-open
def normalizationOpen (a b : k) : overlapChart a b ⟶ Spec (.of k[X]) := by sorry

lemma normalizationOpen_isOpenImmersion (a b : k) :
    IsOpenImmersion (normalizationOpen a b) := by sorry

attribute [instance] normalizationOpen_isOpenImmersion

lemma normalizationOpen_range (a b : k) :
    (normalizationOpen a b).opensRange = PrimeSpectrum.basicOpen (X * quadratic 1 a b) := by sorry

lemma normalizationChart_preimage (a b : k) :
    normalizationChart a b ⁻¹ᵁ (finiteOpen a b).opensRange =
      (normalizationOpen a b).opensRange := by sorry

lemma normalization_chart_condition (a b : k) :
    normalizationOpen a b ≫ normalizationChart a b = finiteOpen a b := by sorry

-- node: G.1/global-normalization-source
/-- Glued normalization charts, before their comparison with the native projective line. -/
def normalizationSource (a b : k) : Scheme := by sorry

abbrev sourceFiniteι (a b : k) : Spec (.of k[X]) ⟶ normalizationSource a b := by sorry

abbrev sourceInfinityι (a b : k) : infinityChart a b ⟶ normalizationSource a b := by sorry

lemma sourceFiniteι_isOpenImmersion (a b : k) : IsOpenImmersion (sourceFiniteι a b) := by sorry

lemma sourceInfinityι_isOpenImmersion (a b : k) : IsOpenImmersion (sourceInfinityι a b) := by sorry

attribute [instance] sourceFiniteι_isOpenImmersion sourceInfinityι_isOpenImmersion

lemma source_chart_condition (a b : k) :
    normalizationOpen a b ≫ sourceFiniteι a b = infinityOpen a b ≫ sourceInfinityι a b := by sorry

lemma source_hom_ext (a b : k) {Y : Scheme} (f g : normalizationSource a b ⟶ Y)
    (h₀ : sourceFiniteι a b ≫ f = sourceFiniteι a b ≫ g)
    (h₁ : sourceInfinityι a b ≫ f = sourceInfinityι a b ≫ g) : f = g := by sorry

lemma source_charts_cover (a b : k) (x : normalizationSource a b) :
    (∃ y : Spec (.of k[X]), sourceFiniteι a b y = x) ∨
      (∃ y : infinityChart a b, sourceInfinityι a b y = x) := by sorry

-- node: G.1/global-normalization-morphism
def normalization (a b : k) : normalizationSource a b ⟶ curve a b := by sorry

lemma normalization_finite_chart (a b : k) :
    sourceFiniteι a b ≫ normalization a b = normalizationChart a b ≫ finiteι a b := by sorry

lemma normalization_infinity_chart (a b : k) :
    sourceInfinityι a b ≫ normalization a b = infinityι a b := by sorry

lemma normalization_unique (a b : k) (f : normalizationSource a b ⟶ curve a b)
    (h₀ : sourceFiniteι a b ≫ f = normalizationChart a b ≫ finiteι a b)
    (h₁ : sourceInfinityι a b ≫ f = infinityι a b) : f = normalization a b := by sorry

lemma normalization_preimage_finite (a b : k) :
    normalization a b ⁻¹ᵁ (finiteι a b).opensRange = (sourceFiniteι a b).opensRange := by sorry

lemma normalization_preimage_infinity (a b : k) :
    normalization a b ⁻¹ᵁ (infinityι a b).opensRange = (sourceInfinityι a b).opensRange := by sorry

lemma normalization_finite_isPullback (a b : k) :
    IsPullback (normalizationChart a b) (sourceFiniteι a b) (finiteι a b) (normalization a b) := by sorry

lemma normalization_infinity_isPullback (a b : k) :
    IsPullback (𝟙 (infinityChart a b)) (sourceInfinityι a b) (infinityι a b) (normalization a b) := by sorry

-- node: G.1/global-open-cover
def openCover (a b : k) : (curve a b).OpenCover := by sorry

lemma openCover_index (a b : k) : (openCover a b).I₀ = Bool := by sorry

lemma openCover_finite (a b : k) :
    HEq ((openCover a b).f (cast (openCover_index a b).symm false)) (finiteι a b) := by sorry

lemma openCover_infinity (a b : k) :
    HEq ((openCover a b).f (cast (openCover_index a b).symm true)) (infinityι a b) := by sorry

set_option backward.isDefEq.respectTransparency.types false in
lemma normalization_isFinite (a b : k) : AlgebraicGeometry.IsFinite (normalization a b) := by sorry

lemma finiteOpen_to_base (a b : k) :
    finiteOpen a b ≫ Spec.map (CommRingCat.ofHom (algebraMap k (algebra (quadratic 1 a b)))) =
      Spec.map (CommRingCat.ofHom (algebraMap k (Ring 1 a b))) := by sorry

lemma infinityOpen_to_base (a b : k) :
    infinityOpen a b ≫ Spec.map (CommRingCat.ofHom (algebraMap k (InfinityChart.Chart a b))) =
      Spec.map (CommRingCat.ofHom (algebraMap k (Ring 1 a b))) := by sorry

-- node: G.1/global-structure-map
def structureMap (a b : k) : curve a b ⟶ Spec (.of k) := by sorry

lemma structureMap_finite (a b : k) :
    finiteι a b ≫ structureMap a b =
      Spec.map (CommRingCat.ofHom (algebraMap k (algebra (quadratic 1 a b)))) := by sorry

lemma structureMap_infinity (a b : k) :
    infinityι a b ≫ structureMap a b =
      Spec.map (CommRingCat.ofHom (algebraMap k (InfinityChart.Chart a b))) := by sorry

lemma normalization_to_base_finite (a b : k) :
    sourceFiniteι a b ≫ normalization a b ≫ structureMap a b =
      Spec.map (CommRingCat.ofHom (algebraMap k k[X])) := by sorry

lemma normalization_to_base_infinity (a b : k) :
    sourceInfinityι a b ≫ normalization a b ≫ structureMap a b =
      Spec.map (CommRingCat.ofHom (algebraMap k (InfinityChart.Chart a b))) := by sorry

-- node: G.1/global-infinity-transition
def infinityTransition (a b : k) : InfinityChart.Chart a b →+* Ring 1 a b := by sorry

lemma infinityOpen_spec (a b : k) :
    infinityOpen a b = Spec.map (CommRingCat.ofHom (infinityTransition a b)) := by sorry

lemma infinityTransition_coordinate (a b : k) :
    infinityTransition a b (algebraMap k[X] (InfinityChart.Chart a b) X) =
      inverseVariable 1 a b := by sorry

lemma infinityTransition_constants (a b r : k) :
    infinityTransition a b (algebraMap k (InfinityChart.Chart a b) r) =
      algebraMap k (Ring 1 a b) r := by sorry

lemma infinityTransition_root (a b : k) :
    infinityTransition a b (AdjoinRoot.root (InfinityChart.relation a b)) =
      IsLocalization.Away.invSelf (X * quadratic 1 a b) := by sorry

-- test: Global.finiteOpen.cusp_range
example : (finiteOpen (0 : ZMod 2) 0).opensRange = PrimeSpectrum.basicOpen (finiteDenominator 1 (0 : ZMod 2) 0) := by sorry

-- test: Global.finiteOpen.nonsplit_range
example : (finiteOpen (1 : ZMod 2) 1).opensRange = PrimeSpectrum.basicOpen (finiteDenominator 1 (1 : ZMod 2) 1) := by sorry

-- test: Global.finiteOpen.split_range
example : (finiteOpen (0 : ℚ) (-1)).opensRange = PrimeSpectrum.basicOpen (finiteDenominator 1 (0 : ℚ) (-1)) := by sorry

-- test: Global.infinityOpen.cusp_range
example : (infinityOpen (0 : ZMod 2) 0).opensRange = PrimeSpectrum.basicOpen (algebraMap (ZMod 2)[X] (InfinityChart.Chart 0 0) X) := by sorry

-- test: Global.infinityOpen.nonsplit_root_open
example : (infinityOpen (1 : ZMod 2) 1).opensRange = PrimeSpectrum.basicOpen (AdjoinRoot.root (InfinityChart.relation 1 1)) := by sorry

-- test: Global.infinityOpen.split_spec
example : infinityOpen (0 : ℚ) (-1) = Spec.map (CommRingCat.ofHom (infinityTransition 0 (-1))) := by sorry

-- test: Global.curve.cusp_gluing
example : finiteOpen (0 : ZMod 2) 0 ≫ finiteι 0 0 = infinityOpen 0 0 ≫ infinityι 0 0 := by sorry

-- test: Global.curve.nonsplit_cover
example (x : curve (1 : ZMod 2) 1) : (∃ y, finiteι (1 : ZMod 2) 1 y = x) ∨ (∃ y, infinityι (1 : ZMod 2) 1 y = x) := by sorry

-- test: Global.curve.split_intersection
example (x : finiteChart (0 : ℚ) (-1)) (y : infinityChart (0 : ℚ) (-1)) : finiteι 0 (-1) x = infinityι 0 (-1) y ↔ ∃ z, finiteOpen 0 (-1) z = x ∧ infinityOpen 0 (-1) z = y := by sorry

-- test: Global.desc.finite_restriction
example (a b : k) {Y : Scheme} (f : finiteChart a b ⟶ Y) (g : infinityChart a b ⟶ Y) (h : finiteOpen a b ≫ f = infinityOpen a b ≫ g) : finiteι a b ≫ desc a b f g h = f := by sorry

-- test: Global.desc.infinity_restriction
example (a b : k) {Y : Scheme} (f : finiteChart a b ⟶ Y) (g : infinityChart a b ⟶ Y) (h : finiteOpen a b ≫ f = infinityOpen a b ≫ g) : infinityι a b ≫ desc a b f g h = g := by sorry

-- test: Global.desc.identity
example (a b : k) : desc a b (finiteι a b) (infinityι a b) (chart_condition a b) = 𝟙 (curve a b) := by sorry

-- test: Global.normalizationChart.cusp_finite
example : AlgebraicGeometry.IsFinite (normalizationChart (0 : ZMod 2) 0) := by sorry

-- test: Global.normalizationChart.nonsplit_finite
example : AlgebraicGeometry.IsFinite (normalizationChart (1 : ZMod 2) 1) := by sorry

-- test: Global.normalizationChart.split_finite
example : AlgebraicGeometry.IsFinite (normalizationChart (0 : ℚ) (-1)) := by sorry

-- test: Global.normalizationOpen.cusp_range
example : (normalizationOpen (0 : ZMod 2) 0).opensRange = PrimeSpectrum.basicOpen (X ^ 3 : (ZMod 2)[X]) := by sorry

-- test: Global.normalizationOpen.nonsplit_preimage
example : normalizationChart (1 : ZMod 2) 1 ⁻¹ᵁ (finiteOpen 1 1).opensRange = (normalizationOpen 1 1).opensRange := by sorry

-- test: Global.normalizationOpen.split_compatibility
example : normalizationOpen (0 : ℚ) (-1) ≫ normalizationChart 0 (-1) = finiteOpen 0 (-1) := by sorry

-- test: Global.normalizationSource.cusp_cover
example (x : normalizationSource (0 : ZMod 2) 0) : (∃ y, sourceFiniteι (0 : ZMod 2) 0 y = x) ∨ (∃ y, sourceInfinityι (0 : ZMod 2) 0 y = x) := by sorry

-- test: Global.normalizationSource.nonsplit_gluing
example : normalizationOpen (1 : ZMod 2) 1 ≫ sourceFiniteι 1 1 = infinityOpen 1 1 ≫ sourceInfinityι 1 1 := by sorry

-- test: Global.normalizationSource.split_open
example : IsOpenImmersion (sourceFiniteι (0 : ℚ) (-1)) := by sorry

-- test: Global.normalization.cusp_finite
example : AlgebraicGeometry.IsFinite (normalization (0 : ZMod 2) 0) := by sorry

-- test: Global.normalization.nonsplit_finite
example : AlgebraicGeometry.IsFinite (normalization (1 : ZMod 2) 1) := by sorry

-- test: Global.normalization.split_infinity_pullback
example : IsPullback (𝟙 (infinityChart (0 : ℚ) (-1))) (sourceInfinityι 0 (-1)) (infinityι 0 (-1)) (normalization 0 (-1)) := by sorry

-- test: Global.openCover.finite_index
example (a b : k) : HEq ((openCover a b).f (cast (openCover_index a b).symm false)) (finiteι a b) := by sorry

-- test: Global.openCover.infinity_index
example (a b : k) : HEq ((openCover a b).f (cast (openCover_index a b).symm true)) (infinityι a b) := by sorry

-- test: Global.openCover.nonsplit_surjective
example (x : curve (1 : ZMod 2) 1) : ∃ i y, (openCover (1 : ZMod 2) 1).f i y = x := by sorry

-- test: Global.structureMap.finite_chart
example (a b : k) : finiteι a b ≫ structureMap a b = Spec.map (CommRingCat.ofHom (algebraMap k (algebra (quadratic 1 a b)))) := by sorry

-- test: Global.structureMap.infinity_chart
example (a b : k) : infinityι a b ≫ structureMap a b = Spec.map (CommRingCat.ofHom (algebraMap k (InfinityChart.Chart a b))) := by sorry

-- test: Global.structureMap.cusp_normalization
example : sourceFiniteι (0 : ZMod 2) 0 ≫ normalization 0 0 ≫ structureMap 0 0 = Spec.map (CommRingCat.ofHom (algebraMap (ZMod 2) (ZMod 2)[X])) := by sorry

-- test: Global.infinityTransition.cusp_reciprocal
example : infinityTransition (0 : ZMod 2) 0 (algebraMap (ZMod 2)[X] (InfinityChart.Chart 0 0) X) = inverseVariable 1 0 0 := by sorry

-- test: Global.infinityTransition.nonsplit_root
example : infinityTransition (1 : ZMod 2) 1 (AdjoinRoot.root (InfinityChart.relation 1 1)) = IsLocalization.Away.invSelf (X * quadratic (1 : ZMod 2) 1 1) := by sorry

-- test: Global.infinityTransition.split_constants
example (r : ℚ) : infinityTransition (0 : ℚ) (-1) (algebraMap ℚ (InfinityChart.Chart 0 (-1)) r) = algebraMap ℚ (Ring 1 0 (-1)) r := by sorry

end TauCeti.GenusOne.QuadraticPinch.Global
/- END TWO CHART SCHEME GLUING -/

/- BEGIN QUADRATIC NORMAL BIRATIONAL COMPARISON -/
namespace TauCeti.GenusOne.QuadraticPinch.Global
open CategoryTheory CategoryTheory.Limits AlgebraicGeometry Overlap
variable {k : Type u} [Field k]

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/normal-infinity-denominator-nonzero
lemma infinity_denominator_ne_zero (a b : k) : InfinityChart.denominator a b ≠ 0 := by
  sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/normal-infinity-domain
lemma infinity_isDomain (a b : k) : IsDomain (InfinityChart.Chart a b) := by
  sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/normal-overlap-domain
lemma overlap_isDomain (a b : k) : IsDomain (Ring (1 : k) a b) := by
  sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/normal-chart-surjective
lemma normalizationChart_surjective (a b : k) : Function.Surjective (normalizationChart a b) := by
  sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/normal-global-surjective
lemma normalization_surjective (a b : k) : Function.Surjective (normalization a b) := by
  sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/normal-finite-overlap-dense
lemma finiteOpen_dense (a b : k) : DenseRange (finiteOpen a b) := by
  sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/normal-source-overlap-dense
lemma normalizationOpen_dense (a b : k) : DenseRange (normalizationOpen a b) := by
  sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/normal-infinity-dense
lemma infinityι_dense (a b : k) : DenseRange (infinityι a b) := by
  sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/normal-source-infinity-dense
lemma sourceInfinityι_dense (a b : k) : DenseRange (sourceInfinityι a b) := by
  sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/normal-curve-integral
lemma curve_isIntegral (a b : k) : AlgebraicGeometry.IsIntegral (curve a b) := by
  sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/normal-source-integral
lemma source_isIntegral (a b : k) : AlgebraicGeometry.IsIntegral (normalizationSource a b) := by
  sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/normal-partial-iso
def normalizationPartialIso (a b : k) : (normalizationSource a b).PartialIso (curve a b) := by
  sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/normal-partial-iso-source
lemma normalizationPartialIso_source (a b : k) :
    (normalizationPartialIso a b).source = (sourceInfinityι a b).opensRange := by
  sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/normal-partial-iso-target
lemma normalizationPartialIso_target (a b : k) :
    (normalizationPartialIso a b).target = (infinityι a b).opensRange := by
  sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/normal-partial-iso-map
lemma normalizationPartialIso_map (a b : k) :
    (normalizationPartialIso a b).iso.hom ≫ (normalizationPartialIso a b).target.ι =
      (normalizationPartialIso a b).source.ι ≫ normalization a b := by
  sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/normal-partial-iso-over
lemma normalizationPartialIso_over (a b : k) :
    (normalizationPartialIso a b).IsOver (normalization a b ≫ structureMap a b) (structureMap a b) := by
  sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/normal-birational-over
lemma normalization_birationalOver (a b : k) :
    Scheme.BirationalOver (normalization a b ≫ structureMap a b) (structureMap a b) := by
  sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/normal-infinity-integrally-closed
lemma infinity_isIntegrallyClosed (a b : k) : IsIntegrallyClosed (InfinityChart.Chart a b) := by
  sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/normal-source-stalks
lemma source_stalk_isIntegrallyClosed (a b : k) (x : normalizationSource a b) :
    IsIntegrallyClosed ((normalizationSource a b).presheaf.stalk x) := by
  sorry

-- node: NeronModelsAndSemistableAbelianVarietiesPartII:G.1/normal-partial-iso-inverse
lemma normalizationPartialIso_inverse (a b : k) :
    (normalizationPartialIso a b).iso.inv ≫ (normalizationPartialIso a b).source.ι ≫ normalization a b =
      (normalizationPartialIso a b).target.ι := by
  sorry

-- test: Global.normalizationPartialIso.cusp_source
example :
    (normalizationPartialIso (0 : ZMod 2) 0).source = (sourceInfinityι 0 0).opensRange := by
  sorry

-- test: Global.normalizationPartialIso.split_target
example :
    (normalizationPartialIso (0 : ℚ) (-1)).target = (infinityι 0 (-1)).opensRange := by
  sorry

-- test: Global.normalizationPartialIso.nonsplit_inverse
example :
    (normalizationPartialIso (1 : ZMod 2) 1).iso.inv ≫
      (normalizationPartialIso (1 : ZMod 2) 1).source.ι ≫ normalization 1 1 =
      (normalizationPartialIso (1 : ZMod 2) 1).target.ι := by
  sorry

-- test: Global.normalizationPartialIso.over_coefficients
example (a b : k) :
    (normalizationPartialIso a b).IsOver (normalization a b ≫ structureMap a b) (structureMap a b) := by
  sorry

-- test: Global.normalization.inseparable_stalks
example (x : normalizationSource (0 : RatFunc (ZMod 2)) (-RatFunc.X)) :
    IsIntegrallyClosed ((normalizationSource (0 : RatFunc (ZMod 2)) (-RatFunc.X)).presheaf.stalk x) := by
  sorry

-- test: Global.normalization.nonsplit_surjective
example : Function.Surjective (normalization (1 : ZMod 2) 1) := by
  sorry

-- test: Global.normalization.cusp_integral
example : AlgebraicGeometry.IsIntegral (curve (0 : ZMod 2) 0) ∧
    AlgebraicGeometry.IsIntegral (normalizationSource (0 : ZMod 2) 0) := by
  sorry

end TauCeti.GenusOne.QuadraticPinch.Global
/- END QUADRATIC NORMAL BIRATIONAL COMPARISON -/

/- BEGIN QUADRATIC POLYNOMIAL MODULE -/

namespace TauCeti.GenusOne.QuadraticPinch
variable {k : Type u} [Field k]

def parameterHom (a b : k) : k[X] →ₐ[k] algebra ((X ^ 2 + C a * X + C b)) := by
  sorry


instance parameterAlgebra (a b : k) : Algebra k[X] (algebra ((X ^ 2 + C a * X + C b))) := by
  sorry


lemma parameterHom_coe (a b : k) (P : k[X]) :
    (parameterHom a b P : k[X]) = P.comp ((X ^ 2 + C a * X + C b)) := by
  sorry


lemma parameter_smul (a b : k) (P : k[X]) (f : algebra ((X ^ 2 + C a * X + C b))) :
    ((P • f : algebra (X ^ 2 + C a * X + C b)) : k[X]) = P.comp ((X ^ 2 + C a * X + C b)) * (f : k[X]) := by
  sorry


def polynomialCoordinates (a b : k) :
    (k[X] × k[X]) ≃ₗ[k[X]] algebra ((X ^ 2 + C a * X + C b)) := by
  sorry


lemma polynomialCoordinates_coe (a b : k) (z : k[X] × k[X]) :
    (polynomialCoordinates a b z : k[X]) =
      z.1.comp ((X ^ 2 + C a * X + C b)) + X * (X ^ 2 + C a * X + C b) * z.2.comp ((X ^ 2 + C a * X + C b)) := by
  sorry


lemma polynomialCoordinates_inverse (a b : k) (f : algebra ((X ^ 2 + C a * X + C b))) :
    (polynomialCoordinates a b).symm f = (coordinates a b).symm f := by
  sorry


def polynomialBasis (a b : k) :
    Module.Basis (Fin 2) k[X] (algebra ((X ^ 2 + C a * X + C b))) := by
  sorry


lemma polynomialBasis_zero (a b : k) : (polynomialBasis a b 0 : k[X]) = 1 := by
  sorry


lemma polynomialBasis_one (a b : k) :
    (polynomialBasis a b 1 : k[X]) = X * (X ^ 2 + C a * X + C b) := by
  sorry


lemma polynomialBasis_repr (a b : k) (f : algebra ((X ^ 2 + C a * X + C b))) :
    (polynomialBasis a b).repr f 0 = ((coordinates a b).symm f).1 ∧
      (polynomialBasis a b).repr f 1 = ((coordinates a b).symm f).2 := by
  sorry


lemma polynomialModule_free (a b : k) :
    Module.Free k[X] (algebra ((X ^ 2 + C a * X + C b))) := by
  sorry


lemma polynomialModule_finite (a b : k) :
    Module.Finite k[X] (algebra (X ^ 2 + C a * X + C b)) := by
  sorry


lemma polynomialModule_finrank (a b : k) :
    Module.finrank k[X] (algebra (X ^ 2 + C a * X + C b)) = 2 := by
  sorry


lemma polynomialModule_flat (a b : k) :
    Module.Flat k[X] (algebra (X ^ 2 + C a * X + C b)) := by
  sorry


lemma parameterHom_coordinates (a b : k) (P : k[X]) :
    parameterHom a b P = polynomialCoordinates a b (P, 0) := by
  sorry


lemma parameterHom_injective (a b : k) : Function.Injective (parameterHom a b) := by
  sorry


lemma polynomialCoordinates_smul (a b : k) (P : k[X]) (z : k[X] × k[X]) :
    polynomialCoordinates a b (P * z.1, P * z.2) =
      P • polynomialCoordinates a b z := by
  sorry


lemma polynomialCoordinates_reconstruction (a b : k)
    (f : algebra (X ^ 2 + C a * X + C b)) :
    ((coordinates a b).symm f).1 • polynomialBasis a b 0 +
      ((coordinates a b).symm f).2 • polynomialBasis a b 1 = f := by
  sorry


-- test: QuadraticPinch.test_parameter_X
example (a b : k) :
    (parameterHom a b X : k[X]) = X ^ 2 + C a * X + C b := by
  sorry


-- test: QuadraticPinch.test_parameter_cusp
example : (parameterHom (0 : k) 0 X : k[X]) = X ^ 2 := by
  sorry


-- test: QuadraticPinch.test_parameter_char2
example :
    (parameterHom (1 : ZMod 2) 1 X : (ZMod 2)[X]) = X ^ 2 + X + 1 := by
  sorry


-- test: QuadraticPinch.test_parameter_action
example (a b : k) (P : k[X])
    (f : algebra (X ^ 2 + C a * X + C b)) :
    ((P • f : algebra (X ^ 2 + C a * X + C b)) : k[X]) = P.comp (X ^ 2 + C a * X + C b) * (f : k[X]) := by
  sorry


-- test: QuadraticPinch.test_parameter_unit_action
example (a b : k) (P : k[X]) :
    P • (1 : algebra (X ^ 2 + C a * X + C b)) = parameterHom a b P := by
  sorry


-- test: QuadraticPinch.test_parameter_not_identity
example : (parameterHom (0 : k) 0 X : k[X]) ≠ X := by
  sorry


-- test: QuadraticPinch.test_polynomial_roundtrip
example (a b : k) (z : k[X] × k[X]) :
    (polynomialCoordinates a b).symm (polynomialCoordinates a b z) = z := by
  sorry


-- test: QuadraticPinch.test_polynomial_char2_scalar
example (P Q : (ZMod 2)[X]) :
    polynomialCoordinates (1 : ZMod 2) 1 (X * P, X * Q) =
      parameterHom (1 : ZMod 2) 1 X * polynomialCoordinates 1 1 (P, Q) := by
  sorry


-- test: QuadraticPinch.test_polynomial_not_multiplicative
example :
    (polynomialCoordinates (0 : k) 0 ((0, 1) * (0, 1)) : k[X]) ≠
      (polynomialCoordinates (0 : k) 0 (0, 1) : k[X]) *
      (polynomialCoordinates (0 : k) 0 (0, 1) : k[X]) := by
  sorry


-- test: QuadraticPinch.test_polynomial_basis_vectors
example (a b : k) :
    (polynomialBasis a b 0 : k[X]) = 1 ∧
      (polynomialBasis a b 1 : k[X]) = X * (X ^ 2 + C a * X + C b) := by
  sorry


-- test: QuadraticPinch.test_polynomial_basis_cusp
example :
    (polynomialBasis (0 : k) 0 1 : k[X]) = X ^ 3 ∧
      Module.finrank k[X] (algebra (X ^ 2 + C (0 : k) * X + C 0)) = 2 := by
  sorry


-- test: QuadraticPinch.test_polynomial_basis_repr
example (a b : k) :
    (polynomialBasis a b).repr (polynomialBasis a b 0) 0 = 1 ∧
      (polynomialBasis a b).repr (polynomialBasis a b 1) 0 = 0 ∧
      (polynomialBasis a b).repr (polynomialBasis a b 1) 1 = 1 := by
  sorry

end TauCeti.GenusOne.QuadraticPinch
/- END QUADRATIC POLYNOMIAL MODULE -/

/- BEGIN POLYNOMIAL MULTIPLICATION AND UNIVERSAL MAP -/
namespace TauCeti.GenusOne.QuadraticPinch
variable {k : Type u} [Field k]

def polynomialProduct (a b : k) (z w : k[X] × k[X]) : k[X] × k[X] := by sorry

lemma polynomialProduct_unit (a b : k) (z : k[X] × k[X]) :
    polynomialProduct a b (1, 0) z = z := by sorry

lemma polynomialCoordinates_mul (a b : k) (z w : k[X] × k[X]) :
    polynomialCoordinates a b (polynomialProduct a b z w) =
      polynomialCoordinates a b z * polynomialCoordinates a b w := by sorry

lemma polynomialCoordinates_inverse_mul (a b : k)
    (f g : algebra (X ^ 2 + C a * X + C b)) :
    (polynomialCoordinates a b).symm (f * g) = polynomialProduct a b
      ((polynomialCoordinates a b).symm f) ((polynomialCoordinates a b).symm g) := by sorry

lemma polynomialBasis_zero_eq_one (a b : k) :
    polynomialBasis a b 0 = (1 : algebra (X ^ 2 + C a * X + C b)) := by sorry

lemma polynomialBasis_square (a b : k) :
    polynomialBasis a b 1 ^ 2 =
      algebraMap k[X] (algebra (X ^ 2 + C a * X + C b)) (X ^ 3 - C b * X ^ 2) -
        algebraMap k[X] (algebra (X ^ 2 + C a * X + C b)) (C a * X) *
          polynomialBasis a b 1 := by sorry

variable {B : Type v} [CommRing B] [Algebra k[X] B]

def polynomialEvaluation (a b : k) (y : B) :
    algebra (X ^ 2 + C a * X + C b) →ₗ[k[X]] B := by sorry

lemma polynomialEvaluation_apply (a b : k) (y : B) (z : k[X] × k[X]) :
    polynomialEvaluation a b y (polynomialCoordinates a b z) =
      algebraMap k[X] B z.1 + algebraMap k[X] B z.2 * y := by sorry

lemma polynomialEvaluation_parameter (a b : k) (y : B) (P : k[X]) :
    polynomialEvaluation a b y (parameterHom a b P) = algebraMap k[X] B P := by sorry

lemma polynomialEvaluation_mul (a b : k) (y : B)
    (hy : y ^ 2 = algebraMap k[X] B (X ^ 3 - C b * X ^ 2) -
      algebraMap k[X] B (C a * X) * y)
    (f g : algebra (X ^ 2 + C a * X + C b)) :
    polynomialEvaluation a b y (f * g) =
      polynomialEvaluation a b y f * polynomialEvaluation a b y g := by sorry

def polynomialLift (a b : k) (y : B)
    (hy : y ^ 2 = algebraMap k[X] B (X ^ 3 - C b * X ^ 2) -
      algebraMap k[X] B (C a * X) * y) :
    algebra (X ^ 2 + C a * X + C b) →ₐ[k[X]] B := by sorry

lemma polynomialLift_apply (a b : k) (y : B)
    (hy : y ^ 2 = algebraMap k[X] B (X ^ 3 - C b * X ^ 2) -
      algebraMap k[X] B (C a * X) * y) (z : k[X] × k[X]) :
    polynomialLift a b y hy (polynomialCoordinates a b z) =
      algebraMap k[X] B z.1 + algebraMap k[X] B z.2 * y := by sorry

lemma polynomialLift_basis (a b : k) (y : B)
    (hy : y ^ 2 = algebraMap k[X] B (X ^ 3 - C b * X ^ 2) -
      algebraMap k[X] B (C a * X) * y) :
    polynomialLift a b y hy (polynomialBasis a b 1) = y := by sorry

lemma polynomialLift_unique (a b : k) (y : B)
    (hy : y ^ 2 = algebraMap k[X] B (X ^ 3 - C b * X ^ 2) -
      algebraMap k[X] B (C a * X) * y)
    (F : algebra (X ^ 2 + C a * X + C b) →ₐ[k[X]] B)
    (hF : F (polynomialBasis a b 1) = y) : F = polynomialLift a b y hy := by sorry

lemma polynomialHom_relation (a b : k)
    (F : algebra (X ^ 2 + C a * X + C b) →ₐ[k[X]] B) :
    F (polynomialBasis a b 1) ^ 2 =
      algebraMap k[X] B (X ^ 3 - C b * X ^ 2) -
        algebraMap k[X] B (C a * X) * F (polynomialBasis a b 1) := by sorry

def polynomialHomEquivRoots (a b : k) :
    (algebra (X ^ 2 + C a * X + C b) →ₐ[k[X]] B) ≃
      {y : B // y ^ 2 = algebraMap k[X] B (X ^ 3 - C b * X ^ 2) -
        algebraMap k[X] B (C a * X) * y} := by sorry

lemma polynomialHomEquivRoots_apply (a b : k)
    (F : algebra (X ^ 2 + C a * X + C b) →ₐ[k[X]] B) :
    (polynomialHomEquivRoots a b F).1 = F (polynomialBasis a b 1) := by sorry

lemma polynomialHomEquivRoots_symm_apply (a b : k)
    (y : {y : B // y ^ 2 = algebraMap k[X] B (X ^ 3 - C b * X ^ 2) -
      algebraMap k[X] B (C a * X) * y}) :
    (polynomialHomEquivRoots a b).symm y = polynomialLift a b y.1 y.2 := by sorry

lemma polynomialHomEquivRoots_parameter (a b : k)
    (y : {y : B // y ^ 2 = algebraMap k[X] B (X ^ 3 - C b * X ^ 2) -
      algebraMap k[X] B (C a * X) * y}) (P : k[X]) :
    (polynomialHomEquivRoots a b).symm y (parameterHom a b P) =
      algebraMap k[X] B P := by sorry

-- test: QuadraticPinch.test_product_cusp
example : polynomialProduct (0 : k) 0 (0, 1) (0, 1) = (X ^ 3, 0) := by sorry

-- test: QuadraticPinch.test_product_char2
example : polynomialProduct (1 : ZMod 2) 1 (0, 1) (0, 1) =
    (X ^ 3 - X ^ 2, -X) := by sorry

-- test: QuadraticPinch.test_product_unit
example (a b : k) (z : k[X] × k[X]) : polynomialProduct a b (1, 0) z = z := by sorry

-- test: QuadraticPinch.test_evaluation_parameter
example (a b : k) (y : B) (P : k[X]) :
    polynomialEvaluation a b y (parameterHom a b P) = algebraMap k[X] B P := by sorry

-- test: QuadraticPinch.test_evaluation_zero
example (a b : k) (y : B) : polynomialEvaluation a b y 0 = 0 := by sorry

-- test: QuadraticPinch.test_evaluation_second
example (a b : k) (y : B) : polynomialEvaluation a b y
    (polynomialCoordinates a b (0, 1)) = y := by sorry

-- test: QuadraticPinch.test_lift_self
example (a b : k) :
    polynomialLift (B := algebra (X ^ 2 + C a * X + C b))
      a b (polynomialBasis a b 1) (polynomialBasis_square a b) =
      AlgHom.id k[X] (algebra (X ^ 2 + C a * X + C b)) := by sorry

-- test: QuadraticPinch.test_lift_root
example (a b : k) (y : B)
    (hy : y ^ 2 = algebraMap k[X] B (X ^ 3 - C b * X ^ 2) -
      algebraMap k[X] B (C a * X) * y) :
    polynomialLift a b y hy (polynomialBasis a b 1) = y := by sorry

-- test: QuadraticPinch.test_lift_unique
example (a b : k) (y : B)
    (hy : y ^ 2 = algebraMap k[X] B (X ^ 3 - C b * X ^ 2) -
      algebraMap k[X] B (C a * X) * y)
    (F : algebra (X ^ 2 + C a * X + C b) →ₐ[k[X]] B)
    (hF : F (polynomialBasis a b 1) = y) : F = polynomialLift a b y hy := by sorry

-- test: QuadraticPinch.test_hom_roots_forward_inverse
example (a b : k)
    (y : {y : B // y ^ 2 = algebraMap k[X] B (X ^ 3 - C b * X ^ 2) -
      algebraMap k[X] B (C a * X) * y}) :
    polynomialHomEquivRoots a b ((polynomialHomEquivRoots a b).symm y) = y := by sorry

-- test: QuadraticPinch.test_hom_roots_inverse_forward
example (a b : k) (F : algebra (X ^ 2 + C a * X + C b) →ₐ[k[X]] B) :
    (polynomialHomEquivRoots a b).symm (polynomialHomEquivRoots a b F) = F := by sorry

-- test: QuadraticPinch.test_hom_roots_parameter
example (a b : k)
    (y : {y : B // y ^ 2 = algebraMap k[X] B (X ^ 3 - C b * X ^ 2) -
      algebraMap k[X] B (C a * X) * y}) (P : k[X]) :
    (polynomialHomEquivRoots a b).symm y (parameterHom a b P) =
      algebraMap k[X] B P := by sorry

end TauCeti.GenusOne.QuadraticPinch
/- END POLYNOMIAL MULTIPLICATION AND UNIVERSAL MAP -/

/- BEGIN SPECIFIED RELATIVE NORMALIZATION CONTINUATION -/
namespace TauCeti.GenusOne.QuadraticPinch.Global
open CategoryTheory CategoryTheory.Limits AlgebraicGeometry
noncomputable section
variable {k : Type u} [Field k]

lemma normalization_schemeTheoreticallyDominant (a b : k) :
    IsSchemeTheoreticallyDominant (normalization a b)  := by sorry

lemma normalization_kernel (a b : k) : (normalization a b).ker = ⊥  := by sorry

lemma normalization_sections_injective (a b : k) (U : (curve a b).Opens) :
    Function.Injective ((normalization a b).app U)  := by sorry

lemma normalization_flat_pullback_schemeTheoreticallyDominant
    (a b : k) {T : Scheme.{u}} (g : T ⟶ curve a b) [Flat g] :
    IsSchemeTheoreticallyDominant (pullback.snd (normalization a b) g)  := by sorry

lemma normalization_flat_pullback_kernel
    (a b : k) {T : Scheme.{u}} (g : T ⟶ curve a b) [Flat g] :
    (pullback.snd (normalization a b) g).ker = ⊥  := by sorry

/-- Relative integral factorization of the specified finite map, not the absolute
normalization of the curve in a generic-point function field. -/
def relativeNormalization (a b : k) : Scheme.{u}  := by sorry

def toRelativeNormalization (a b : k) : normalizationSource a b ⟶ relativeNormalization a b  := by sorry

def fromRelativeNormalization (a b : k) : relativeNormalization a b ⟶ curve a b  := by sorry

lemma toRelativeNormalization_isIso (a b : k) : IsIso (toRelativeNormalization a b)  := by sorry

/-- Comparison for the relative integral factorization of the existing map. -/
def relativeNormalizationIso (a b : k) : normalizationSource a b ≅ relativeNormalization a b  := by sorry

lemma relativeNormalization_factorization (a b : k) :
    toRelativeNormalization a b ≫ fromRelativeNormalization a b = normalization a b  := by sorry

lemma relativeNormalizationIso_hom (a b : k) :
    (relativeNormalizationIso a b).hom = toRelativeNormalization a b  := by sorry

lemma relativeNormalizationIso_inv_from (a b : k) :
    (relativeNormalizationIso a b).inv ≫ normalization a b = fromRelativeNormalization a b  := by sorry

/-- The actual affine section comparison to the integral closure inside ν_*O_N. -/
def relativeNormalizationSectionsIso (a b : k) (U : (curve a b).Opens)
    (hU : IsAffineOpen U) :
    (letI := ((normalization a b).app U).hom.toAlgebra
     Γ(relativeNormalization a b, fromRelativeNormalization a b ⁻¹ᵁ U) ≅
       CommRingCat.of (integralClosure Γ(curve a b, U)
         Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U)))  := by sorry

/-- The specified integral-factorization map from Mathlib relative normalization. -/
def relativeNormalizationDesc (a b : k) {T : Scheme.{u}}
    (f : normalizationSource a b ⟶ T) (g : T ⟶ curve a b) [IsIntegralHom g]
    (h : normalization a b = f ≫ g) : relativeNormalization a b ⟶ T  := by sorry

lemma toRelativeNormalization_desc (a b : k) {T : Scheme.{u}}
    (f : normalizationSource a b ⟶ T) (g : T ⟶ curve a b) [IsIntegralHom g]
    (h : normalization a b = f ≫ g) :
    toRelativeNormalization a b ≫ relativeNormalizationDesc a b f g h = f  := by sorry

lemma relativeNormalizationDesc_from (a b : k) {T : Scheme.{u}}
    (f : normalizationSource a b ⟶ T) (g : T ⟶ curve a b) [IsIntegralHom g]
    (h : normalization a b = f ≫ g) :
    relativeNormalizationDesc a b f g h ≫ g = fromRelativeNormalization a b  := by sorry

lemma relativeNormalizationDesc_eq (a b : k) {T : Scheme.{u}}
    (f : normalizationSource a b ⟶ T) (g : T ⟶ curve a b) [IsIntegralHom g]
    (h : normalization a b = f ≫ g) :
    relativeNormalizationDesc a b f g h = (relativeNormalizationIso a b).inv ≫ f  := by sorry

lemma relativeNormalizationDesc_unique (a b : k) {T : Scheme.{u}}
    (f : normalizationSource a b ⟶ T) (g : T ⟶ curve a b) [IsIntegralHom g]
    (h : normalization a b = f ≫ g) (j : relativeNormalization a b ⟶ T)
    (hj : toRelativeNormalization a b ≫ j = f) :
    j = relativeNormalizationDesc a b f g h  := by sorry

lemma relativeNormalizationSectionsIso_hom_inv (a b : k) (U : (curve a b).Opens)
    (hU : IsAffineOpen U) :
    (relativeNormalizationSectionsIso a b U hU).hom ≫
      (relativeNormalizationSectionsIso a b U hU).inv = 𝟙 _  := by sorry

lemma relativeNormalizationSectionsIso_inv_hom (a b : k) (U : (curve a b).Opens)
    (hU : IsAffineOpen U) :
    (relativeNormalizationSectionsIso a b U hU).inv ≫
      (relativeNormalizationSectionsIso a b U hU).hom = 𝟙 _  := by sorry

lemma relativeNormalizationSectionsIso_cancel (a b : k) (U : (curve a b).Opens)
    (hU : IsAffineOpen U)
    (f g : Γ(relativeNormalization a b, fromRelativeNormalization a b ⁻¹ᵁ U) ⟶
      Γ(relativeNormalization a b, fromRelativeNormalization a b ⁻¹ᵁ U)) :
    f ≫ (relativeNormalizationSectionsIso a b U hU).hom =
      g ≫ (relativeNormalizationSectionsIso a b U hU).hom ↔ f = g  := by sorry

end
end TauCeti.GenusOne.QuadraticPinch.Global

namespace TauCeti.GenusOne.QuadraticPinch
noncomputable section
variable {k : Type u} [Field k]

lemma quadratic_normalization_inclusion_not_surjective (a b : k) :
    ¬ Function.Surjective
      ((algebra (Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b)).val)  := by sorry

end
end TauCeti.GenusOne.QuadraticPinch

namespace TauCeti.GenusOne.QuadraticPinch.Global
open CategoryTheory CategoryTheory.Limits AlgebraicGeometry
noncomputable section
variable {k : Type u} [Field k]

-- test: QuadraticPinch.Global.test_relativeNormalization_cusp
example : toRelativeNormalization (0 : k) 0 ≫ fromRelativeNormalization 0 0 = normalization 0 0  := by sorry

-- test: QuadraticPinch.Global.test_relativeNormalization_char2
example : toRelativeNormalization (1 : ZMod 2) 1 ≫ fromRelativeNormalization 1 1 = normalization 1 1  := by sorry

-- test: QuadraticPinch.Global.test_relativeNormalization_iso
example (a b : k) : IsIso (toRelativeNormalization a b)  := by sorry

-- test: QuadraticPinch.Global.test_toRelativeNormalization_cusp
example : toRelativeNormalization (0 : k) 0 ≫ fromRelativeNormalization 0 0 = normalization 0 0  := by sorry

-- test: QuadraticPinch.Global.test_toRelativeNormalization_char2
example : toRelativeNormalization (1 : ZMod 2) 1 ≫ fromRelativeNormalization 1 1 = normalization 1 1  := by sorry

-- test: QuadraticPinch.Global.test_toRelativeNormalization_descent
example (a b : k) {T : Scheme.{u}} (f : normalizationSource a b ⟶ T) (g : T ⟶ curve a b) [IsIntegralHom g] (h : normalization a b = f ≫ g) : toRelativeNormalization a b ≫ relativeNormalizationDesc a b f g h = f  := by sorry

-- test: QuadraticPinch.Global.test_fromRelativeNormalization_cusp
example : toRelativeNormalization (0 : k) 0 ≫ fromRelativeNormalization 0 0 = normalization 0 0  := by sorry

-- test: QuadraticPinch.Global.test_fromRelativeNormalization_char2
example : toRelativeNormalization (1 : ZMod 2) 1 ≫ fromRelativeNormalization 1 1 = normalization 1 1  := by sorry

-- test: QuadraticPinch.Global.test_fromRelativeNormalization_inverse
example (a b : k) : (relativeNormalizationIso a b).inv ≫ normalization a b = fromRelativeNormalization a b  := by sorry

-- test: QuadraticPinch.Global.test_iso_forward
example (a b : k) : (relativeNormalizationIso a b).hom = toRelativeNormalization a b  := by sorry

-- test: QuadraticPinch.Global.test_iso_cusp_left
example : (relativeNormalizationIso (0 : k) 0).hom ≫ (relativeNormalizationIso 0 0).inv = 𝟙 _  := by sorry

-- test: QuadraticPinch.Global.test_iso_char2_right
example : (relativeNormalizationIso (1 : ZMod 2) 1).inv ≫ (relativeNormalizationIso 1 1).hom = 𝟙 _  := by sorry

-- test: QuadraticPinch.Global.test_sections_left
example (a b : k) (U : (curve a b).Opens) (hU : IsAffineOpen U) : (relativeNormalizationSectionsIso a b U hU).hom ≫ (relativeNormalizationSectionsIso a b U hU).inv = 𝟙 _  := by sorry

-- test: QuadraticPinch.Global.test_sections_cusp_right
example (U : (curve (0 : k) 0).Opens) (hU : IsAffineOpen U) : (relativeNormalizationSectionsIso (0 : k) 0 U hU).inv ≫ (relativeNormalizationSectionsIso 0 0 U hU).hom = 𝟙 _  := by sorry

-- test: QuadraticPinch.Global.test_sections_char2_right
example (U : (curve (1 : ZMod 2) 1).Opens) (hU : IsAffineOpen U) : (relativeNormalizationSectionsIso (1 : ZMod 2) 1 U hU).inv ≫ (relativeNormalizationSectionsIso 1 1 U hU).hom = 𝟙 _  := by sorry

-- test: QuadraticPinch.Global.test_desc_source
example (a b : k) {T : Scheme.{u}} (f : normalizationSource a b ⟶ T) (g : T ⟶ curve a b) [IsIntegralHom g] (h : normalization a b = f ≫ g) : toRelativeNormalization a b ≫ relativeNormalizationDesc a b f g h = f  := by sorry

-- test: QuadraticPinch.Global.test_desc_target
example (a b : k) {T : Scheme.{u}} (f : normalizationSource a b ⟶ T) (g : T ⟶ curve a b) [IsIntegralHom g] (h : normalization a b = f ≫ g) : relativeNormalizationDesc a b f g h ≫ g = fromRelativeNormalization a b  := by sorry

-- test: QuadraticPinch.Global.test_desc_unique
example (a b : k) {T : Scheme.{u}} (f : normalizationSource a b ⟶ T) (g : T ⟶ curve a b) [IsIntegralHom g] (h : normalization a b = f ≫ g) (j : relativeNormalization a b ⟶ T) (hj : toRelativeNormalization a b ≫ j = f) : j = relativeNormalizationDesc a b f g h  := by sorry

-- test: QuadraticPinch.Global.test_sections_cusp_injective
example (U : (curve (0 : k) 0).Opens) : Function.Injective ((normalization (0 : k) 0).app U)  := by sorry

-- test: QuadraticPinch.Global.test_flat_pullback_kernel
example (a b : k) {T : Scheme.{u}} (g : T ⟶ curve a b) [Flat g] : (pullback.snd (normalization a b) g).ker = ⊥  := by sorry

end
end TauCeti.GenusOne.QuadraticPinch.Global

namespace TauCeti.GenusOne.QuadraticPinch
noncomputable section
variable {k : Type u} [Field k]

-- test: QuadraticPinch.test_inclusion_cusp
example : ¬ Function.Surjective ((algebra (Polynomial.X ^ 2 : k[X])).val)  := by sorry

-- test: QuadraticPinch.test_inclusion_char2
example : ¬ Function.Surjective ((algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 2)[X])).val)  := by sorry

end
end TauCeti.GenusOne.QuadraticPinch
/- END SPECIFIED RELATIVE NORMALIZATION CONTINUATION -/

/- BEGIN GENERIC POINT FIELD COMPARISON -/
namespace TauCeti.GenusOne.QuadraticPinch.Global
open CategoryTheory CategoryTheory.Limits AlgebraicGeometry TopologicalSpace
noncomputable section
set_option backward.isDefEq.respectTransparency false
variable {k : Type u} [Field k]
local instance (a b : k) : IsIntegral (curve a b) := curve_isIntegral a b
local instance (a b : k) : IsIntegral (normalizationSource a b) := source_isIntegral a b

lemma normalization_genericPoint (a b : k) :
    normalization a b (genericPoint (normalizationSource a b)) = genericPoint (curve a b) := by sorry

lemma normalization_preimage_nonempty (a b : k) (U : (curve a b).Opens)
    [Nonempty U] : Nonempty (normalization a b ⁻¹ᵁ U) := by sorry

/-- The transported stalk map of the actual finite normalization morphism. -/
def normalizationFunctionFieldMap (a b : k) :
    (curve a b).functionField ⟶ (normalizationSource a b).functionField := by sorry

lemma normalizationFunctionFieldMap_stalk (a b : k) :
    normalizationFunctionFieldMap a b =
      ((curve a b).presheaf.stalkCongr (.of_eq (normalization_genericPoint a b))).inv ≫
        (normalization a b).stalkMap (genericPoint (normalizationSource a b)) := by sorry

lemma normalizationFunctionFieldMap_germ (a b : k) (U : (curve a b).Opens)
    [Nonempty U] :
    (curve a b).germToFunctionField U ≫ normalizationFunctionFieldMap a b =
      (normalization a b).app U ≫
        @Scheme.germToFunctionField (normalizationSource a b) _
          (normalization a b ⁻¹ᵁ U) (normalization_preimage_nonempty a b U) := by sorry

lemma normalizationFunctionFieldMap_isIso (a b : k) :
    IsIso (normalizationFunctionFieldMap a b) := by sorry

/-- The native field isomorphism induced by the common infinity chart. -/
def normalizationFunctionFieldIso (a b : k) :
    (curve a b).functionField ≅ (normalizationSource a b).functionField := by sorry

lemma normalizationFunctionFieldIso_hom (a b : k) :
    (normalizationFunctionFieldIso a b).hom = normalizationFunctionFieldMap a b := by sorry

lemma normalizationFunctionFieldIso_inv_hom (a b : k) :
    (normalizationFunctionFieldIso a b).inv ≫ normalizationFunctionFieldMap a b = 𝟙 _ := by sorry

lemma normalizationFunctionFieldIso_hom_inv (a b : k) :
    normalizationFunctionFieldMap a b ≫ (normalizationFunctionFieldIso a b).inv = 𝟙 _ := by sorry

lemma normalizationFunctionFieldIso_spec_triangle (a b : k) :
    Spec.map (normalizationFunctionFieldIso a b).inv ≫
      (normalizationSource a b).fromSpecStalk (genericPoint (normalizationSource a b)) ≫
        normalization a b = (curve a b).fromSpecStalk (genericPoint (curve a b)) := by sorry

lemma genericPointMorphism_isAffine (a b : k) :
    IsAffineHom ((curve a b).fromSpecStalk (genericPoint (curve a b))) := by sorry

local instance (a b : k) : IsAffineHom
    ((curve a b).fromSpecStalk (genericPoint (curve a b))) := genericPointMorphism_isAffine a b
local instance (a b : k) : IsIntegralHom (normalization a b) := by
  let := normalization_isFinite a b
  infer_instance

/-- Integral comparison from normalization in the actual generic-point field.
The comparison is not yet asserted to be an isomorphism. -/
def absoluteNormalizationComparison (a b : k) :
    ((curve a b).fromSpecStalk (genericPoint (curve a b))).normalization ⟶
      normalizationSource a b := by sorry

lemma absoluteNormalizationComparison_point_triangle (a b : k) :
    ((curve a b).fromSpecStalk (genericPoint (curve a b))).toNormalization ≫
      absoluteNormalizationComparison a b =
        Spec.map (normalizationFunctionFieldIso a b).inv ≫
          (normalizationSource a b).fromSpecStalk (genericPoint (normalizationSource a b)) := by sorry

lemma absoluteNormalizationComparison_from_triangle (a b : k) :
    absoluteNormalizationComparison a b ≫ normalization a b =
      ((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization := by sorry

lemma absoluteNormalizationComparison_integral (a b : k) :
    IsIntegralHom (absoluteNormalizationComparison a b) := by sorry

lemma absoluteNormalizationComparison_unique (a b : k)
    (d : ((curve a b).fromSpecStalk (genericPoint (curve a b))).normalization ⟶
      normalizationSource a b)
    (hpoint : ((curve a b).fromSpecStalk (genericPoint (curve a b))).toNormalization ≫ d =
      Spec.map (normalizationFunctionFieldIso a b).inv ≫
        (normalizationSource a b).fromSpecStalk (genericPoint (normalizationSource a b)))
    (hfrom : d ≫ normalization a b =
      ((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization) :
    d = absoluteNormalizationComparison a b := by sorry

-- test: QuadraticPinch.Global.test_functionFieldMap_cusp_zero
example : normalizationFunctionFieldMap (0 : k) 0 0 = 0 := by sorry

-- test: QuadraticPinch.Global.test_functionFieldMap_nonsplit_one
example : normalizationFunctionFieldMap (1 : ZMod 2) 1 1 = 1 := by sorry

-- test: QuadraticPinch.Global.test_functionFieldMap_nonzero
example (a b : k) (x : (curve a b).functionField) (hx : x ≠ 0) :
    normalizationFunctionFieldMap a b x ≠ 0 := by sorry

-- test: QuadraticPinch.Global.test_functionFieldIso_cusp_roundtrip
example (x : (curve (0 : k) 0).functionField) :
    (normalizationFunctionFieldIso (0 : k) 0).inv
      (normalizationFunctionFieldMap (0 : k) 0 x) = x := by sorry

-- test: QuadraticPinch.Global.test_functionFieldIso_char2_roundtrip
example (x : (normalizationSource (1 : ZMod 2) 1).functionField) :
    normalizationFunctionFieldMap (1 : ZMod 2) 1
      ((normalizationFunctionFieldIso (1 : ZMod 2) 1).inv x) = x := by sorry

-- test: QuadraticPinch.Global.test_functionFieldIso_affine_nonexample
example (a b : k) : IsIso (normalizationFunctionFieldMap a b) ∧
    ¬ Function.Surjective ((algebra (Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X +
      Polynomial.C b)).val) := by sorry

-- test: QuadraticPinch.Global.test_absoluteComparison_cusp
example : absoluteNormalizationComparison (0 : k) 0 ≫ normalization (0 : k) 0 =
    ((curve (0 : k) 0).fromSpecStalk (genericPoint (curve (0 : k) 0))).fromNormalization := by sorry

-- test: QuadraticPinch.Global.test_absoluteComparison_char2
example : ((curve (1 : ZMod 2) 1).fromSpecStalk
    (genericPoint (curve (1 : ZMod 2) 1))).toNormalization ≫
      absoluteNormalizationComparison (1 : ZMod 2) 1 =
        Spec.map (normalizationFunctionFieldIso (1 : ZMod 2) 1).inv ≫
          (normalizationSource (1 : ZMod 2) 1).fromSpecStalk
            (genericPoint (normalizationSource (1 : ZMod 2) 1)) := by sorry

-- test: QuadraticPinch.Global.test_absoluteComparison_integral
example (a b : k) : IsIntegralHom (absoluteNormalizationComparison a b) := by sorry

end
end TauCeti.GenusOne.QuadraticPinch.Global
/- END GENERIC POINT FIELD COMPARISON -/

/- BEGIN AFFINE ABSOLUTE CLOSURE -/
namespace TauCeti.GenusOne.QuadraticPinch.Global
open CategoryTheory CategoryTheory.Limits AlgebraicGeometry TopologicalSpace
noncomputable section
set_option backward.isDefEq.respectTransparency false
set_option linter.style.haveILetI false
variable {k : Type u} [Field k]
local instance (a b : k) : IsIntegral (curve a b) := curve_isIntegral a b
local instance (a b : k) : IsIntegral (normalizationSource a b) := source_isIntegral a b
local instance (a b : k) : AlgebraicGeometry.IsFinite (normalization a b) := normalization_isFinite a b

lemma source_affine_sections_integrallyClosed (a b : k)
    (V : (normalizationSource a b).Opens) (hV : IsAffineOpen V) [Nonempty V] :
    IsIntegrallyClosed Γ(normalizationSource a b, V) := by
  sorry

lemma normalization_preimage_sections_integrallyClosed (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U] :
    IsIntegrallyClosed Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U) := by
  sorry

/-- The coefficient map into the actual function field of the source. -/
def normalizationSectionsToField (a b : k) (U : (curve a b).Opens) [Nonempty U] :
    Γ(curve a b, U) ⟶ (normalizationSource a b).functionField := by
  sorry

lemma normalizationSectionsToField_germ (a b : k)
    (U : (curve a b).Opens) [Nonempty U] :
    normalizationSectionsToField a b U =
      (curve a b).germToFunctionField U ≫ normalizationFunctionFieldMap a b := by
  sorry

lemma normalizationSectionsToField_injective (a b : k)
    (U : (curve a b).Opens) [Nonempty U] :
    Function.Injective (normalizationSectionsToField a b U) := by
  sorry

lemma normalizationSectionsToField_restrict (a b : k)
    (U V : (curve a b).Opens) [Nonempty U] [Nonempty V] (h : V ≤ U) :
    (curve a b).presheaf.map (CategoryTheory.homOfLE h).op ≫
      normalizationSectionsToField a b V = normalizationSectionsToField a b U := by
  sorry

local instance (a b : k) (U : (curve a b).Opens) :
    Algebra Γ(curve a b, U) Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U) :=
  ((normalization a b).app U).hom.toAlgebra
local instance (a b : k) (U : (curve a b).Opens) [Nonempty U] :
    Algebra Γ(curve a b, U) (normalizationSource a b).functionField :=
  (normalizationSectionsToField a b U).hom.toAlgebra

lemma normalization_sections_integralClosure (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U] :
    letI := normalization_preimage_nonempty a b U
    letI := ((normalization a b).app U).hom.toAlgebra
    letI := (normalizationSectionsToField a b U).hom.toAlgebra
    IsIntegralClosure Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U)
      Γ(curve a b, U) (normalizationSource a b).functionField := by
  sorry

/-- The specified affine source sections are the integral closure inside K_N. -/
def normalizationSectionsClosureEquiv (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U] :
    letI := normalization_preimage_nonempty a b U
    letI := ((normalization a b).app U).hom.toAlgebra
    letI := (normalizationSectionsToField a b U).hom.toAlgebra
    Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U) ≃ₐ[Γ(curve a b, U)]
      integralClosure Γ(curve a b, U) (normalizationSource a b).functionField := by
  sorry

lemma normalizationSectionsClosureEquiv_val (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U]
    (s : Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U)) :
    (normalizationSectionsClosureEquiv a b U hU s).val =
      @Scheme.germToFunctionField (normalizationSource a b) _
        (normalization a b ⁻¹ᵁ U) (normalization_preimage_nonempty a b U) s := by
  sorry

/-- The actual function-field isomorphism respects every affine coefficient ring. -/
def normalizationFunctionFieldAlgEquiv (a b : k)
    (U : (curve a b).Opens) [Nonempty U] :
    letI := (normalizationSectionsToField a b U).hom.toAlgebra
    (curve a b).functionField ≃ₐ[Γ(curve a b, U)]
      (normalizationSource a b).functionField := by
  sorry

lemma normalizationFunctionFieldAlgEquiv_apply (a b : k)
    (U : (curve a b).Opens) [Nonempty U] (x : (curve a b).functionField) :
    normalizationFunctionFieldAlgEquiv a b U x = normalizationFunctionFieldMap a b x := by
  sorry

/-- The actual source sections identify the integral closure in the curve's own field. -/
def absoluteSectionsClosureEquiv (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U] :
    letI := ((normalization a b).app U).hom.toAlgebra
    Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U) ≃ₐ[Γ(curve a b, U)]
      integralClosure Γ(curve a b, U) (curve a b).functionField := by
  sorry

lemma absoluteSectionsClosureEquiv_val (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U]
    (s : Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U)) :
    (absoluteSectionsClosureEquiv a b U hU s).val =
      (normalizationFunctionFieldIso a b).inv
        (@Scheme.germToFunctionField (normalizationSource a b) _
          (normalization a b ⁻¹ᵁ U) (normalization_preimage_nonempty a b U) s) := by
  sorry

lemma absoluteSectionsClosureEquiv_coefficient (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U]
    (r : Γ(curve a b, U)) :
    absoluteSectionsClosureEquiv a b U hU ((normalization a b).app U r) =
      algebraMap Γ(curve a b, U)
        (integralClosure Γ(curve a b, U) (curve a b).functionField) r := by
  sorry

lemma absoluteSectionsClosureEquiv_restrict (a b : k)
    (U V : (curve a b).Opens) (hU : IsAffineOpen U) (hV : IsAffineOpen V)
    [Nonempty U] [Nonempty V] (h : V ≤ U)
    (s : Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U)) :
    (absoluteSectionsClosureEquiv a b V hV
      ((normalizationSource a b).presheaf.map
        (CategoryTheory.homOfLE ((normalization a b).preimage_mono h)).op s)).val =
      (absoluteSectionsClosureEquiv a b U hU s).val := by
  sorry

lemma absoluteSectionsClosureEquiv_inverse_val (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U]
    (z : integralClosure Γ(curve a b, U) (curve a b).functionField) :
    @Scheme.germToFunctionField (normalizationSource a b) _
      (normalization a b ⁻¹ᵁ U) (normalization_preimage_nonempty a b U)
      ((absoluteSectionsClosureEquiv a b U hU).symm z) =
        normalizationFunctionFieldMap a b z.val := by
  sorry

lemma absoluteSectionsClosureEquiv_inverse_restrict (a b : k)
    (U V : (curve a b).Opens) (hU : IsAffineOpen U) (hV : IsAffineOpen V)
    [Nonempty U] [Nonempty V] (h : V ≤ U)
    (zU : integralClosure Γ(curve a b, U) (curve a b).functionField)
    (zV : integralClosure Γ(curve a b, V) (curve a b).functionField)
    (hz : zU.val = zV.val) :
    (normalizationSource a b).presheaf.map
        (CategoryTheory.homOfLE ((normalization a b).preimage_mono h)).op
        ((absoluteSectionsClosureEquiv a b U hU).symm zU) =
      (absoluteSectionsClosureEquiv a b V hV).symm zV := by
  sorry

lemma normalizationSectionsClosureEquiv_coefficient (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U]
    (r : Γ(curve a b, U)) :
    letI := (normalizationSectionsToField a b U).hom.toAlgebra
    normalizationSectionsClosureEquiv a b U hU ((normalization a b).app U r) =
      algebraMap Γ(curve a b, U)
        (integralClosure Γ(curve a b, U) (normalizationSource a b).functionField) r := by
  sorry

lemma normalizationSectionsClosureEquiv_inverse_val (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U] :
    letI := (normalizationSectionsToField a b U).hom.toAlgebra
    ∀ z : integralClosure Γ(curve a b, U) (normalizationSource a b).functionField,
      @Scheme.germToFunctionField (normalizationSource a b) _
        (normalization a b ⁻¹ᵁ U) (normalization_preimage_nonempty a b U)
        ((normalizationSectionsClosureEquiv a b U hU).symm z) = z.val := by
  sorry

lemma normalizationFunctionFieldAlgEquiv_coefficient (a b : k)
    (U : (curve a b).Opens) [Nonempty U] (r : Γ(curve a b, U)) :
    normalizationFunctionFieldAlgEquiv a b U ((curve a b).germToFunctionField U r) =
      normalizationSectionsToField a b U r := by
  sorry

lemma normalizationFunctionFieldAlgEquiv_symm (a b : k)
    (U : (curve a b).Opens) [Nonempty U] (x : (normalizationSource a b).functionField) :
    (normalizationFunctionFieldAlgEquiv a b U).symm x =
      (normalizationFunctionFieldIso a b).inv x := by
  sorry

-- test: QuadraticPinch.Global.test_sectionsToField_cusp
example (U : (curve (0 : k) 0).Opens) [Nonempty U] (r : Γ(curve (0 : k) 0, U)) :
    normalizationSectionsToField (0 : k) 0 U r = normalizationFunctionFieldMap 0 0
      ((curve (0 : k) 0).germToFunctionField U r) := by
  sorry

-- test: QuadraticPinch.Global.test_sectionsToField_char2_nonzero
example (U : (curve (1 : ZMod 2) 1).Opens) [Nonempty U]
    (r : Γ(curve (1 : ZMod 2) 1, U)) (hr : r ≠ 0) :
    normalizationSectionsToField (1 : ZMod 2) 1 U r ≠ 0 := by
  sorry

-- test: QuadraticPinch.Global.test_sectionsToField_restrict
example (a b : k) (U V : (curve a b).Opens) [Nonempty U] [Nonempty V]
    (h : V ≤ U) (r : Γ(curve a b, U)) :
    normalizationSectionsToField a b V ((curve a b).presheaf.map (CategoryTheory.homOfLE h).op r) =
      normalizationSectionsToField a b U r := by
  sorry

-- test: QuadraticPinch.Global.test_sourceClosure_cusp_germ
example (U : (curve (0 : k) 0).Opens) (hU : IsAffineOpen U) [Nonempty U]
    (s : Γ(normalizationSource (0 : k) 0, normalization 0 0 ⁻¹ᵁ U)) :
    (normalizationSectionsClosureEquiv (0 : k) 0 U hU s).val =
      @Scheme.germToFunctionField (normalizationSource (0 : k) 0) _
        (normalization 0 0 ⁻¹ᵁ U) (normalization_preimage_nonempty 0 0 U) s := by
  sorry

-- test: QuadraticPinch.Global.test_sourceClosure_char2_coefficient
example (U : (curve (1 : ZMod 2) 1).Opens) (hU : IsAffineOpen U) [Nonempty U]
    (r : Γ(curve (1 : ZMod 2) 1, U)) :
    letI := (normalizationSectionsToField (1 : ZMod 2) 1 U).hom.toAlgebra
    normalizationSectionsClosureEquiv (1 : ZMod 2) 1 U hU ((normalization 1 1).app U r) =
      algebraMap Γ(curve (1 : ZMod 2) 1, U)
        (integralClosure Γ(curve (1 : ZMod 2) 1, U) (normalizationSource (1 : ZMod 2) 1).functionField) r := by
  sorry

-- test: QuadraticPinch.Global.test_sourceClosure_integral_element
example (a b : k) (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U] :
    letI := (normalizationSectionsToField a b U).hom.toAlgebra
    ∀ z : integralClosure Γ(curve a b, U) (normalizationSource a b).functionField,
      @Scheme.germToFunctionField (normalizationSource a b) _
        (normalization a b ⁻¹ᵁ U) (normalization_preimage_nonempty a b U)
        ((normalizationSectionsClosureEquiv a b U hU).symm z) = z.val := by
  sorry

-- test: QuadraticPinch.Global.test_fieldAlgebra_cusp_coefficient
example (U : (curve (0 : k) 0).Opens) [Nonempty U] (r : Γ(curve (0 : k) 0, U)) :
    normalizationFunctionFieldAlgEquiv (0 : k) 0 U ((curve (0 : k) 0).germToFunctionField U r) =
      normalizationSectionsToField (0 : k) 0 U r := by
  sorry

-- test: QuadraticPinch.Global.test_fieldAlgebra_char2_inverse
example (U : (curve (1 : ZMod 2) 1).Opens) [Nonempty U]
    (x : (normalizationSource (1 : ZMod 2) 1).functionField) :
    (normalizationFunctionFieldAlgEquiv (1 : ZMod 2) 1 U).symm x =
      (normalizationFunctionFieldIso (1 : ZMod 2) 1).inv x := by
  sorry

-- test: QuadraticPinch.Global.test_fieldAlgebra_affine_nonexample
example (a b : k) (U : (curve a b).Opens) [Nonempty U] :
    Function.Bijective (normalizationFunctionFieldAlgEquiv a b U) ∧
      ¬ Function.Surjective ((algebra (Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X +
        Polynomial.C b)).val) := by
  sorry

-- test: QuadraticPinch.Global.test_absoluteClosure_cusp_coefficient
example (U : (curve (0 : k) 0).Opens) (hU : IsAffineOpen U) [Nonempty U]
    (r : Γ(curve (0 : k) 0, U)) :
    absoluteSectionsClosureEquiv (0 : k) 0 U hU ((normalization 0 0).app U r) =
      algebraMap Γ(curve (0 : k) 0, U)
        (integralClosure Γ(curve (0 : k) 0, U) (curve (0 : k) 0).functionField) r := by
  sorry

-- test: QuadraticPinch.Global.test_absoluteClosure_char2_integral_element
example (U : (curve (1 : ZMod 2) 1).Opens) (hU : IsAffineOpen U) [Nonempty U]
    (z : integralClosure Γ(curve (1 : ZMod 2) 1, U) (curve (1 : ZMod 2) 1).functionField) :
    @Scheme.germToFunctionField (normalizationSource (1 : ZMod 2) 1) _
      (normalization 1 1 ⁻¹ᵁ U) (normalization_preimage_nonempty 1 1 U)
      ((absoluteSectionsClosureEquiv (1 : ZMod 2) 1 U hU).symm z) =
        normalizationFunctionFieldMap (1 : ZMod 2) 1 z.val := by
  sorry

-- test: QuadraticPinch.Global.test_absoluteClosure_overlap
example (a b : k) (U V : (curve a b).Opens) (hU : IsAffineOpen U) (hV : IsAffineOpen V)
    [Nonempty U] [Nonempty V] (h : V ≤ U)
    (zU : integralClosure Γ(curve a b, U) (curve a b).functionField)
    (zV : integralClosure Γ(curve a b, V) (curve a b).functionField) (hz : zU.val = zV.val) :
    (normalizationSource a b).presheaf.map
        (CategoryTheory.homOfLE ((normalization a b).preimage_mono h)).op
        ((absoluteSectionsClosureEquiv a b U hU).symm zU) =
      (absoluteSectionsClosureEquiv a b V hV).symm zV := by
  sorry

-- test: QuadraticPinch.Global.test_absoluteClosure_empty_open_excluded
example (a b : k) : ¬ Nonempty (⊥ : (curve a b).Opens) := by
  sorry

end
end TauCeti.GenusOne.QuadraticPinch.Global
/- END AFFINE ABSOLUTE CLOSURE -/

/- BEGIN ARCHIVED AFFINE ABSOLUTE CLOSURE PAYLOAD
{"Canonical.lean": {"data": "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"}, "IncomingCanonical.lean": {"data": "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"}, "IncomingNative.lean": {"data": "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"}, "IncomingSketch.lean": {"data": "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"}, "Native.lean": {"data": "eNrsvduSZMdxIPheX3Fka2vIbGQnqhrz1FCR090AqDICRKO7QbUEq0k7lXmy8qAy82SdzOzuKhBmJCjRAD7RNNJqZ83GKNNSJs1Kr6MZ7ti+cN75D1NfMJ+w4XH1iPCIc60GyKGJIrvyxMXDw8PDw6/5alOUu+TDdLdY5mcHB8UmWyePi+XVuljl6fJgXaynxWqz36VnyyzZZtNdXqwP9uv8RVZus2SfvEheHhys01W23aTTLHmW7h9lu3z8vWy93360zsYf79NZme7y6eN8PV0cHLxIy5yP9flFcj95drVhg3yRfPp+ni1nycXpwcHdu8m6mGX3k++Nj966VL3vbqD73XR5np2V6cFbrNWzRZZsyixfpedZUsyTHft7Wqy3u3S92yb5mv+wZp1fsHZ6Rcnlvtjl2Xo3Tu6+dTDL5okcMxlcMoAuPn1+OmT/+3R/pn6/4D8m948PkmRw8/N/cL8OHsw+K/L1k6LYJZfD4ZjhK93gX8eri5svf8G+HRwss9UqTVbZaoJmnZt52RQJ+/vmq680WJfJzc/+mv3y02QK7Ub8nwvZZcQaH6P9Gj9ird5kfe5Ak+Pk7IqNOF2ka4YiHyA5U41FcRgmbKzyZfLpA9FqDMs4K3anMAXgvdxPd0XJ/vrNf0nKfL0ri+Tml/80HSWL6c0v/xNf2iJlm7GY5S/YfGxhX/3fDIS7LvwMbgvWSXY5WV2MVxs20Hh7tVrxoYqzXco2mc2wYDMs2AzQEcbmn7NX6XSn5h8xRHDQb372C9b29B2A71wA5QE7Ssr5UgGMh2FjbPPVBj7JjTTkhohnwPcJiMhZl72ranfEDANME5fJZMiWW8p5D6mp10W5Spf5dQoHclJmK4aMWVZagCzg35fjD4t1PoU/Z/xPdiTezc7LLGOUc2/IVznwSfB/v/ny/2SAOMQ1GKgvQOfZfJ4cDpM3eZekquXRkFElavNco0BQxQr+Rt81nJNVMXt4xVcxWe4YbGxdA94xScTOLbJ35CDZGzAK25fz8kF5Tg7HWwM2k08Xs9Mk3UGvoQGDjZAg4E2/m69/lRwJoJNilZ2nrA+MkyafprPZhJ371Wmy3zLKwvMy4n0+ge+PJsV8Yha1zCbFms934HBZYEpsyftl9ggQl0+BXW0dToEo6b//rUVWnE398p9q7BvnE+zLW+LLSNBCiBL9IYD7iL7qzLD/8FGq5z8ajtDxYfOwroZBequfzLc7ilcOBgSmWLPh+Ei3PK5HnwRGYLPZwiJgbdezZmDdM2DVODCV85eZZr3hoy9AIo+/f/QjCL358d8nA4NXde4ja4Ue1pE/BlTJY8/PYLFeXiWfmrtnvF3tlxN2BEYBKhgFtmGU8J5wV+yXrBH7Nztfp/LOggNY5ueLHT+m7BJlF0GIhV4Cg2HYmosDgeBHjAgGZHfNKc2PmTC0bsyK5QYwXIgVjsUo+iyyfp8fjSx8fgH3drbTFHXz819p9KabDUOtGY1hZldsJvl8/gYc6QPFPOcSRYCSCgrTmDnVF5cZHzDCeAcXExhRoGXAXvAv7P/w7/uzbbaTuJI33HA47Nqd3BDRZzLP1/kua7szH4qJ35eDoI2REqJAPCBTNhXzCXL2SY6DLnFKYXR+LlfHtni8K+S8E71EObo1aNu1odWMXzDS2hVP2EX2J8VKLdeWV2LYlSsKnYxs2nEbpPyZT7+XsWt4V16NT7ZqT/xvT9mEYyaRK2b1iJ1/WNqjdDcu5myB4aUPh66UFp6az/Nhys+XujQH5AZJ9JhdLNOp4EAgOfg4YXLH37HLSezS99Wj6cVQPZq+f6pFckGH8AMDSw4La1G/8zEEEp0GmJi/7whm+fozNuv7+zVvPj5ZfwbPwBfmBHwI7x08gMGbOA0n26fTdJmWz4qXWTk2vRi39o+RBFNi3IZznOvJRVv+3NrAmdkxrMD2TXQTtQAGe5rvFvP98umH+6W3VCkBoyawhxMEZe6tWKySbzKgR3NbB1om8M1hjzSvvT7AD5eUCfbswQH/fy3fL84A7IaZbPeltWYYY8l4/mVqSYGsMxsS5Bc2bFCIYzJbip8T4p3DhzsLDHcWH+7MH67MGOFnvD+b7JK1+O5EfokRg0ChTw9spSNJs417np2aB/A1YyKIYmWTAUfZMHkr9O1sKAFnTETKFvofIKqwLYL/XWbzHVxRSv5jbdbZ5DorC8ESqklZ0tPl0NwFi2vx4JWsghER44aMxqfLgpFF1vK11yMTOZEQPZIA8TYRZnK/xiVa527RwyllhAGFHNNvJg6nuFH5ruXreVaysw5PkmnmoRx4AlIjfROYTwbXrP/3hx72rSVfa4XRXGuJfNIGvdG1szfHPoEpie/7miS9PR/n+hdAEvWaVVfce5f7/EX4ipPrCl5MN1//9ObLX3yqfzlNfCy5K7JvV76cgddrqFdnnVA2kYT4AQyFBXFiCOc65z0n+IYMLntgcXKtg7GQJiAPXLiDEMqGwNnU+9clAmIRAhT5HLRFHx8cfveu9rtsm6T06oF3dUEBOSkMamGixmJIJNTFoPOiIoHCQofUkfLPY95HIgL+eRrAKEYT3+t0aLF+ArHPK09SR/zhl2YHDMp+Qi116SgB48KF3dKSM2x6easf4OLQHEVB6JNKhIzBRIubL388CrKUkc8n8FclpyCSUwLLFK44IbOwGdoLLQTVGDHGJmB5j59n66xMd0U54ZMVOyxdV5Dzb/6FfIXM92u4ykIa0ePvyD2+JlRY7EdfS2X2UqqXhYgPUjIlc98duERdpUpltHQ3QtpyLlIgb0ah+g0HolLqr/6M0NCph/KhTd5eX6oBqd6Xmj5ayWcp7eBpcqph3nCDDrw+B9tF8bLuRjfY5gFMqDhb9fCNhma7IR/t87JYsR0wJoYzy0ZRY97BtdEbDxlizPuA8ZUzbjNlt/DufmJbW8e+Om8MZ/uAdV5tlplt8iS1uIdMTBRLcfjb47KYjbNXu+SP3/mOUTXyR7j6Vey6P+xpI4A1w6CgbqI2ItfnKKdhqUdDR/+xA4OQTdli+vFMTPLHbEr5T1vvgTqJ75Pn1p0mf2Tkj6xTDHzBgkdSLZgwGXqaz7Q+Y1HCNANaL83G2mbLOWffcOVwXrzTXWcvQouRNg+GhEOtFMGg5i/QFPqGsKboTBlsxSWs+kUzEpnutxtNHREDjL3uf5fAmRr8OXuQMiKRrwB32dDs7aGwJuGmtvWGt2JPrn+8lbnv+XMfOiSaebsKAFWBfI80yHLbuDLP0JuUWVTM6Y0r6TUZEpYToJzn7AX90uorBRJFWkguiZCApSDguy9f8oYIjIxXhfha6m5SkTtxzqBeIberKYtE3WWwV/N2s8x3jZbypr1/byZHzVYnjie1OuEZIc3baBK+T8rMjQFaZukM1OpAKRPtt6PImj+i+LUpgQMMwW9HwmGC/6NgjE/yviGe35/MmNF7mKn2Bu0mZ+k239a5iCaxm+j1y7GCimuI4Jfo/gkjxnpy2OzXeshXnj1S1VHVC50ttefEq6967glWjthPR9POfTpacKQuZM65CrzM6iJ2z45lALFHRhwkn/qINjCtG/eppF8VCgYo8NhGTXylSlRvVBdf6q/YCUUKp7N6WrcYkVVpjt4iqate77PWmjty1nDHM0/lp6wdlQqI4Jfat3eZbbJ0l80m00Vavt351nv723zrvf3abr23e7v1jEWgKEq21BSJJi0fYgG7RQuVpKOiDtlqlBFjgpQltvpFenzWxAl//cC96Ylq7GY3dHuo+V2cHKWSaa6leYvTHyKHMe6oy2V0eEnNlRsjUgiNEsc7d5Sw5xp3Taw0wSGAtS3FQOV2u6A7yicEYyCL9PQd16gWHMuy3agNtRqNd2W63oah1WSAD4zeo2TwBIa/GCa7BZPgDrL1rNpX/X/bgGdwkr7Ki9W2qrmyRzfshfauYU/tPdmwX8DtrSnc3ruw8wDg3dd9kO161n0Q5PTWCbvgvtVpAMv63XAk8oLrthrtu9UUFGyFbdjXtUm37W5fCi0XwOWcLn2xWNtlGFdE7jzW81anJvaY7D0u6AcimEdF8CTigDKSAFPXLGP8f7NkJ3iXnGXTdL/FIS/JNkuX2yTfbXEskEDC+GBZTNlf6pZCLT6WUz2gYoQsrw07YEa64VthLOBeuCtkp4PqObmXkzWj7wSlbk5qdttbqrA82rLLBLQNEzAuIAdz+7jzyCrtykxHKcWdlW33ZHBLmQeiYEBgMGPBpQjjTUAEXma7Yl0RZMTknkVqBxmlXNOdIulpjgQMFbkRcT8n3cmlVL5IkZgCU938H/81Scebsthk5e5KgIfkOhRIxP7DBl/MIVRCGeuqITi1o45mHAvODmlZHJRIDkEIy1iDLSMCwJT6qXbQ2O1tLjcNWviOhbkhKqgLOkQFbVxqco6zTV3XFnVRwNg97rBXK/SCmVKCJutQHAfRUNq1ExinQu+wA5x8FvBoOtHeeGu6UTtTO0RnyklWuXKG12iPoVd6EFjhyIn2e2T9YDEtjYzpAQ/dLLNtPtsz0e0iK9fZ0nExEkTP+ePNz/7q5su/RZ5jEuF415Obf/yvLQ+H4Pat+rIH6cXH3IlZqPFsrs3vC8dHneL4cLN8wHYxLbm6TPAJHzvKUdbn5gQmoZF2BjBrU9cTbLZ7wSVzNV5/yHWDoIhVXVD3pEbHmH+mFmgUbE2uMaN02OnYGTMZnC82xSiI/VFC4lJZVYXljGLxo+D1zIOcohhCPuQeorQp4ilqRKPL1ljYzuyZ0qJwTVT7s4BhtWeY4xlsnoH6ZAfosp0b1Y7vleqs0XNOlYp1wUBqk69USXBf1dfHcUAm5gv4aP7epYiUChwU6QE4FPoUabAmt5sP+v2slOPGyQNvwaWJwqJwXJsLKR18gPvMh78D/Am/1kLLHtDrtq01tVeIbVohzCEsqBuyKYFj4Q5C2yI7zaAaSX4sDDUGHcop1hNtuYTIxtyV+XQnrsQtcThb8hl34AtDSTUyPOwKPa11G1xr1kOK6JesAfnQUg9arHaKhvI1C+itooF2+4+ILB7/S09Pegqy1b+YLBdb/ixtEZJqPzTw7ZrOZqGLF15ZIyfy1v1unBK5qSlwFo8czLdGLfLviS1Kigw4Xi72zOKOYdzXV2Y/OAqnW1Fy/12jH7ZTXnROOSGzZAwWLrnS2UyGgYwUU4sRoU88HNk4JFU4LDEqGiXQRSFUMuvaTnbG/c1z73s0WUrrxWS5Owh5BlY4AQLHmKz3q+CO6f24u+VMTV9H8ueJ+LlDghBsK0/mYNMKZwlBX1F+BbVV9hNVakO43Gj7NvNhAL3sX+itz61L8xFFiyiaGog8iC2BjLv7dX65zySqxG8T8Vs7PH2umO8XyefTBJpdsH8tks/Uz5JzA/GHM/fAFJ9RLWayxWewA1P2debmUClmvm/xRk4OXHWjNgWA4PewtKstPlNhjmGsRjHOFRlsfsoO9wh5GPE2oW1ZciHBYzri575Yzn2Pxzje+0FWE8hfc3Y1mabbjCFxKvfl0BjyGalOT8WfLXhKiFs84vzrOZuxlUOxxU3S6TTbcC30fZ4zSwxyd/eyMKr2RbpN0uQ8W+9BV8TfUoISkhJEz64uARZab776mtAQSx3XSgZHzIngCNumv1jhAAgupbu8UAsPutnzoHs0RRNujINy2vDoVU10ZKKRK2aZ8POkmN3zU/WnAHNaccpNBpmFuu6h/5TcbyANs9PIPLLM2GRboa3TisAxcncIbhvyWnD2z+X+n7GN+ozi/of2meQKyzbr/yyOAOm3D6mYVukFWy1ghCebY4tZImxs31Ft4WDk2yTbbhm+ADrstUTuKrZ5OORz4IQJWZ9dDJBhPuSegutgks8ytoubMnvBZXJJ9OJ+WzPwk3Q9U++2BITqF1l5FVrNIynfDiWRImkXXOqslipLVvQKFhn95PQ8o98jrp/J1ALgFpYw65M0Sl7muwVvwe6YPVseWJTvQsa9Zfpyq5P6qVU150dW4r2/gnjji1P2Bny5yEpQLe2K9xmxcVMSLeWwNmAJhUP1BkaD+JnR2RuIaShegJDpDMegOkJ2CLhgvMbQBk2luFD4smbND1FglrigADwmAb/BFndOgShW+2ZyzoUyAs4JdV9FxHDeE6ZUs7MrrWL2Ow1nd6ISIjfASL7Ygi3ORQYfS6qRL0OXKwWwrjQMNN1A4rFzWmw+9C6YatbHui2m/EktQrTfQC8lhFbXVuPjdVp/gWyK9qDa6jPptTKZs//p58lCPDgHi7l+yYRlcUs1aQgGUOOm2AzsrEBik1eLjQtae99Evorp+HVCIp4uge3RVIQagOUVeWRaOgt2lLzuJhvAFBmr1RqEVrAt/MpzEptyzMTas9Jo8U7g6pO6ls8vbf2KytAaSvvkWXgcJuRv76F0buCf4bJH07PZVeIb/mNN87cRl6p1ESoabzJ7MZNvB80MIxwPXt4WOzs89eeGMRrNXCaLU80Ewh618ONEEYc6El2fEe4hHQQJ+GioLs0IHR/VBP+yPdyDBWS2E8lwv/KjEdwF8Qhw6AISs47UpHim8Xk+ZOusEY1mrWjXfklSwyGWZUmzdxqs0u3YfNHWCAPtaAMSAXeHZqiIK+OlOijtoot3spp4unkZkn/bGnoXwWlEMT8Pa+lSWkuHYoTglZa6qrrYTqXstlmwkU+RJSmipk/i35HilmiUqWQJcq6YOR3lJn3g+mW5GgvbRQXdF9jZh8hzfcf1hlNCQnpanReavQIXMILxIRPQ2gx9xB/3XMY2Oa/jZG8cOqXWqB3pR21P9hu4E5HzcC5KSVRpNon4Uwhd5h80TZ00TVEqS9frfJEvheNwtuqHvWqeyg6VjB1B82BCUmJiS5rTvpAUa8XWO5QKlh9kA01M6EvRk4tbmBdpnZM01AJbrRvNUtxnOOem8juFU8L1bhm3mBfLF5lIoqzQV5uF6Jyn1jKlT2DObeUA0rWkamKtutGEtQMdEO/6I0a9cxMZ3XTtcKdJFimuj9pE24Up3iZpIqt8L08gx7tDPeOspMW7JA3kBQ4ed31aKjA+z9dlur7oAdtqpIvWmFU6NpTiS4wJRwVCK+EdBCn+i7VQ/smsWo0PydBKz3190OGEWOfDOPp676SgBwf291W00OiESXqM9HOcXjRpRT3IXudJ7MtP7LbOZtB9DJ86IZnWPaQmh3foueh7AI6jr3hteyU9jT09JL5ExWnzXGyFlgM9MBxPx7i/rPbTMu7tjRbLrotdzhaJF4tcWQLLlCrF17S66OPBMyHV3mbItwNWX2Qoohzxq7J42MZDSoxf2LVhBhSSStZsGMWUkeYFquvy4wMqH5Ofi6ROCiC9IdEHidqgxar2fgh3yjLbsN/ZYDw+zsp+8XvjYYvi/OOepg1xZ+dYqYUuZH+L4M3L0bUIew420PRYiVa6eg7GmQjJRo5sNjK32Ih8Qy5G2gR62nA77PSE9RylcaKFxh7Th7fiMY2TE4RdpyPkjBzGD2M0be2fGkKw6Fm+ytZbiPm2U+M5ArHiZto6iXIfRZdYlV/JoBSdbCsBExapo5KJgrXXjGsaWzrz2q1gzKChSxq3ZsiMXnRyGX9I8Ba+TcmMRIEXw0GX3X3b2l1877UYBohP00mACPsB1CXEbnDjt5H9Mqoxln0YVPon/oQ66GXJgceXOGJVj9M/5JMKMV2Qu3i6CIytjuZfDi/OSP3V17eqbMMP8WaKr5FyBjOPNYTMxte9jjYSypcO5mhP4uqaFf/mx39/UFuy6h4u01j7bSdVjpgq+0GHbYyX8nJJ6aBpsfAWbNKhbBFR2/S13rX+tWNNrNXXhLW6XpzwNX6YYRNXQJsWVeaStMUAnw+xIe3AWp/3Bh94Cx/G7PTWqyXQtfFzX2b+1pqWR8t0u4XyeZw4Qb29E2lpVDq1ELpkUSXuPhTST6phhYZmcWCnhwg/83UaiIUKXpk2lPGs/ero6vJ7ep5ij9MAtV+Hi6H2Fsor3/mRAF6kNw8F6s4DD04rWHdeN2fABPzmJxex1AEBoHSagItgeoDm8ciViQFq7A6ZJICgGKefONkX/oVfvaN4KpgsyDS8nbd7tgG0QyT5EMXQodGqtqAizp2PHM+hIGiuWSoFRaivT9/bkHqHVG3oyErsrAIixFYkWXHiua0tmKwuyFhwikZY23h2FWs3WqR50Htyq9kekmpOVCufg0V1ddI6NLmV5ehOPvm5l2O9kr7r1tro6RB40w2Dp6LSnIRVOFQyCtW4QufiaA8DWx254q2NnjS1qqidbG5c0Vv4OmwslFHFxlSHTAyv0Wqi0N3CeKLx/XpsKBTuDwO4r0+ljrHkFnI7h8TE5imbvbQwDYfwbdydBxCo6z7MReMk0tE0Ut3GapOoN/zi7GMgQ6WtqYYSFjtRcsAJq58xlaGpj01ASuJmwwVz+XYeh2do7IUwLGVE13TjHekjwmf7G6m/Q+XdAP2Qbnt6q2cH6GdQ32Wpl2G70KPtJ9yyc9c7AKvv243QsJcbhdGwu5V4qDHAdqRJyyISCPb6WdvHJ2teDeDq0SItdyiF+xOcwv1RsVrxCi5PTkXW3um+fJGpAkxPwFnyT7M8KxnXSrfbR/zjExlnk46Su2ej5FD8h3sqwgizDFjxWlrzzDhPZBWRo+TN5FGSJneS5/xfZ/xf7GGk0gYvRQU/t6/s/igZ4BlSKMUEA9yFL6Iq48FBenZWZi8SvnQ80LH13tNTwSBKhZBd7sWRm5rOe1767YkW1gWSoBeTih+XhTwQ4/dk3+SPPt1zY9P1qZWb+w48Zt7ka9/zAr/wv/xNesz/8bb10HcRP0YzaSjz+dwJiePAjbxtsyAlPqPBGd28DcF0k+zVzgmF4RVCpQco/7c8XdNidQY7AotfKFSeZdfF3sK/LJhqbZ/Ayl2LJlgXeCnfVZsrcCTxCCgUNTRZT9n2bdYWKmbCEGdDMQYf2QzERyKVWAgg8czb7s/EP3hFTJn9QpqF5z9IOVJ4sQyldmLkNKEI98Cp88XPwECQJadcipbR+6306ZSqO+YPKw6C8wB3TG7Zi3R58+WXE2ISFJ9m/a76cEUpvL9RdJpqaMWtqzk4RonfOV6J3x95gZzqy3O6vY6MEy9SNp8VJOWxppM1E062NqfTCBSK+iiCa1Hs3QNbxUTu553YROqp35TMdWH3/XKS+0ttRZcE9mBE7NsGdOA3ExUaOAnwpKHsD8Z2Ckj5gg+O/KpOG/7jQIWp6NMpeIublAPNPcm3n0CeJXfVJ+rnJqt3FR5ibB5UlL3Kt7stIFnpkGg8jay9YD/oC3NXfADlRlTlWpoiZbojAPU0we3HD16mV8R+cRJGpLfM5zuVr94mwIEKoi7mJ6IO24FbU1FgqMa0hvXckaR7svW6jRkWnkK6U6q7VQNEWxlashat9SJZDMleTu0iEQgJ3DjknwvPk023VZhoioO7VIlIPOKxTOUji0HuRVFmnjphRE4mSQ8m1OVSRpxJQlpDSLcAhDgvi1WQFOvQnEWkDjelwMI06Q6m8wSZ8hicPt3Dap9WdeqxRGefL3ndOVzBOYPwdRDn25GLuNU5aXhSHIZEHnSx1PHYIGICW+wtfuCvnntpbqBwrUMSQgRJxATjXO7HxHG9dJaSCnDAui/Uz+sin403oKPZErgRjgAKagBhsit8qEnYJNzEiqqhtiubSIi19JQ7wfbU7KpMSPQEUpvZjZQiTKkZUYHnqC0b6+tY4k7l3zFOklzwyo3ESCGG2pDKAzaUieOAxxFnGAnmHmzcRoplCz9tiCAEZQtNqIdMpeDGls0ZZyZCXeiLG5xIml/cy3Nhti3mikFSJB04nwN10k0jOEHOMzd/ASXTsVzIzVJPkFlKLIxvVkxemndlhnO3WqyeGGV8mtuwk3wcAfy7xL6pK4o1wyzQasDG9ZZOn7uGoodCSkDW99+Tf2CINEMEfpguhcs+PJV72R1a1uzweBtaddGwQJnjp5v0hRcraTq1HrwPFODx4lQqFDQK6AmufTzi/vzYn1twFLnmSq6IuRMYN9o+leb1lDkx5sgd3EIcUq2H4hb+Gm6HUwiQSQaGGNwy8Oo4CJxYgs4wxuzJnf659edE1N4UPocTDy0KQF5dt9hk65PViq2RAlO+UvLp97Jile3Kq/HJ9iO7h9/kKRt3bMKhBkof/yjdsasfF5ejSAOHX0M2LPbvpXPAzAuhCjyoQmrjhniUcXHHCXRRpee3AiXPkk+UFPR+vk7ehlchtxkwUP7o009AW/VMhneBGusZ+/9PpDL8E642E6/2ZzUa8v99O5AZaFGsCjDCFXsEWIl3LLgOzphKmHMo/vcTQ+8lV8OBk3a0O8cC8moGAXmer2UtgpzrzkXSw9Awp7wNVjPb65OpbAI1efFeXKiYE2goszncfPVP7Bv/N+xU5VrIHBC6Zvxir2UByMC9yJJ75kHAN0lri/emDzgXfaLcuFTC0gIKQb/UaRdQ+507x5F9M4fWMIKpxEUm4ur5PBCYvFtAfJ0qwCCUorLMzCj5MN2V+StuhJu8SKXKxP2RO4TxdZmH4u6Q4zm+roHOB/4p/LzdT3XIISw0eaaQZhJULMbZMl+JNG+LNSR4Y//NZhu6P+0PhzTJKKuRe1BrWrUGVVQy7MN+Fd7GWpYtvpYm1i18wnJpM4XDBXuxh/SAsQMm8ubE8fcDNNYffSqi0A5Pa6MKgaKwZZJF1cKxoOePSnadl8lA/u93J0Ph34hQ3wRtqkqJNDhir0jL8jwO7edYFqvXPpGAz526OqKktoOitRzpf/TpDl0RO7geRux/2NXh/c6ui6NT2/wX5r3NV6NIx15PndUc8TTVBGX0DqO8Mrhp+x7KEBS+0A9NJD+DEyC1LwIqUEddTIeyh6C4ZSgi2YadE9O4KPPzfE2iso7xXbgkHJ02Z0dbJhsFWMiDORw6i3O9oVlX1SEQyxIUP7HQFaD/ymV2J/80JnuIqyhwfcgzWLFazUy3q6LYLdzdVGR1vzXnlLY4imfzt0UAOiTUEmnRMKm54i+u++GcUtT0tN7MOJDivu01cyggOHRqh7SYBZ6yEyGH6ck+fyrvszvYAejpqXzogrz+5p3k6dB/M3r4gFx4UGzBgn4OAa7sv8+GbXCktHQq2wK9M7ZXgkxz6wCCn6G2g4IobsINh+KfsmKX/tMr6heFNE5EFKiws3eFCtHoFl4LqDbVGZ8VRHLYl8qDTuykga8pRUodQYT8tWeGfwooSpLNG03OOEWZzfbTbIZAQO9sEZ/zb4bouT24p1jWvxnCk2kg3NjuCaeiOwcBVYjdzVtJah8KyXUtpw1rgCaLtFLl3Ist9J61UOvKlwuV/izhZdpyQotlWgMEl2nryTl3Iw6dp7CjjE+v154RsLBqtV299VqJHX/fTNhBG0g93DgMxXWq0cwkghPdSGOmKV7wCK4PXsCMeWobmJvZSsx8rS0mFsiBsVtsMOotbSg6WWgXEJWeNDyVExK4XRQvI8IVKVlZCYC4xWBlTAba3M0/5MhAEiJUV/ldm23RBpPXa2sIOllUsS5v1ZLVk0ISNUvYdBizSnS1R9RdjcNufNcpRWYNl2HxIMezkoL6tJVMxK0cY1GkESIxXqbljJZekT1kV0hXhGPqrpH2NYjFrzNpjBo8AxeamTwTdeeemhzqdc6fbyOr7Q/Rj2UPx+snk4M6wbNO2EfDiBPiGd9pBESTncZRV3SnQQRGuoxgx4Z0Gkr4L3dDCnZw6mubJOvoNBwS7PsCS/p1dhrOZlqdhnK5UI9wiezt3cbjzl+dFzjZFV1PS+Mob2IE7o7RwzCd8Updvz3Ahb1OehyuK3DLvsjbd53oNFxIZd3foNhzoMdRpVmkxxHVddRpSEp9frBf50J0vkYBp0/3Z8JWCuXAny2yhLU8Z7KWLGVezJOHYJ6HTI/ZLMnXohB4eZbvyrS8gmgD6J480HXAde6E5POHZFDqQyYuPRA5dnjXhyAd8iTEbCpV9HualmWe8Qyhn58lP0puvvpx8oq1ezjiriKveMWxB1Dnldu+VtnqDVVM9xVYzNFjUTRQdaOl38xYdTsQ3gF4gEWaLM68YXgrdxTZNRmwPq8gaSHrx10LeRlsNGbJwHYG1bF4IuxLL8p+5fKv/OOxiKqEH9hU0hcOg7M4U1+V5dvksQAg6+8HJB7m+8JHPxNwmawYvPQuvSOw3pP5fIzSdxkgwExRnyaEtI6nFQnh2Lebn/9MTAWoncDCOVqttMvsxyMhXGsSj4RZCzsgP0rQ1ARWP0DwGuBfYOAfnFor4c+VdTHL7iffGx++Ba/qYn2XH6e7Ikj/rs5NAOdcYQma8WMwuciXS12+Gd4vD6T5BrbmRJ+WB8oDCGo037cqNs8Ziv59csJo5ubn/wCu4zAI0Cf8YycKJqNkmvwT/GMuqukNeas7Tmk9o+sR32AUalJU9Nwqt8czY6t4AoDpDtiUTNiTePGKWpy8rfT0G8vDJCrhsYm5W45UQS94vRm55asY7lP2PL97lqs8Bz7aocFEN2Ckt1Pb/ZLh56H+61pgDhHAzqIA+Es65rGde4D/fAhfTbH0in3lKYvg6XwibXL6ADDKT954Q3SCnx4M+6CFTymnzJ1YAemvOU92Q75ep+b5Q4NEUvPJFsOQ+xAqfe6MLtUrzijz+gWGYMKQnAWs9sngKY8qY+MNPoZ/PdwN+fCytJtyb0tVsUdBXDe//CeTPlqxjtBZnDMscgSDZxgfSTjbVINq8ms0gfUMVaVc8dO547cB3zJFEiaPv/hl6ByXM5XhH34Swe78NpizNQzxRYRH9ylOVXRSKlIgzVP0q0kGnY6SCSpdLL9rdKc4Ybdm1qmqiRU7vOLt4aeIRfsFGJc1av5wfOsfXziON1//FNayEyQFIKhgpUbHWbrNhfmqasrOksCQPlJMbtlmIsXxg8cn5hL+w1bW3soD/17TR0LlSX3F91tJWOThCe8RCKKRIHCLFkA+PE4sUZCCClmupTDSDjKsvYXd5tKFr7CFnZf+LLb/ATXfKLTKOKaFnje0sEHDlREBKWYR5BrF8t3qqY2n1TdsFEdooaeVPFypEKuQB7fUfmnEU/kiwWKqvLD6xirKxuLs/eriDYFXdo3tZEJjHvQMV6sMfN7Ja683vMN1a5ixsB0YM8IoctIdF+wAIXsUzmPhLrgXJBn3nUE65zd4mgxRtVpKLUp8x7l12HeA71Q8xICpk9YO5/XV4KHmUJt8KYZkfV20xb6RAu86eJQ+tR6lMm1+8DbCnnfuTST4urp+nooG1m0kLoSn6kLgf8Fjl10LT80rOHpBPA1eEE/H2/3ZDsBsLbI/5RRrDYTjlMy1yaVbBLKsr6t7GucI+1o1Q6Pr1fyIr9mnOMhRkCn7ecy2asv+J13vcp1TV5c/Bw2MPNhi+jMokXvmIlg4bAiRmREyh33C7cEulDdf/8raGTO+lnbZf85GioLGlirkKQDAuMUI/lcVUFEQlwpkITHDqUINdBAcJdgb+PhLRyAnIo+526oYknjY8HIiSoixXlzwKoLIl7MC9YYnjPnLPNGYxF/s2J9zWRZZv+7ZW74WS2iQI+8jdsMs081B7fR4uhYXFNoikts9SqYq/ZOb5k5npeMDWt2PqcQAz1lXM90Uxd9NtdbbhYI/SZVJ3LM8m8/D5LkYSt6xP9Tyc3g8KiMWHnHgAivdhqKuD/QiFRNWy5xYroIYRCn9aXxMZUY5d11TMlWV6Thye3ipqlA6qtNQaKnnrDUxgUXSKiOzT1loVimpSKCHjogQTD11gHiJi5GRin1W1+wogN1T/rgWMOt9IaGOJ9OKEsYwnBFIro7xp9mLGU0eyYB9mqikRyJflS7/MM03JQw6CRxUcQlAsicf3Wes3ZSiYyXjkR34Ub8TOBr+kPIXfBvKuEa9Y7yJ/PYCvpHzoiwMXLh9oag7cGxUJyTmaaiEHJbOZk6yQ57+kGMLsmWJf/AEWX5yrCf2iqccIhmCEmyV8lZvEp4ydrszuQUvJLIHsaYQ78InrhxWxcZEljF08zjUWjKdpoFY+1CE6vB/vUll/SJWp9rzUhImqcHpO4GMBzhPpTkfVKa88PGOHxjqlNp+r5qqJA2NyKNq+OrA4ZdipjF/5gW+8ULDyY++A42E8O3xL9FyqPLMKgDCl57KZ3aamE2ol82MvNdMRrMoQnndtthG2dckaovVCGhNnmMbWvs04M2GGTj2HY1SwjyOHCbQQYqFOoszNydqHZJ7AmtyL0F4ItAsPCQTkKhFjNAHMSyk+PAFrnv/Loim3XHHHeKFWzeApkLrREpX5xGNaDqZTe21oIQ13qLuJAEqMkyNXgiVk4be1zu1IcWg0uhvlE/GwuVqQ5AD3jfJwURLfz+tvHX2yeyQdY9k2jLznr7gXSB98Ihj5pDwVDpzi7g2gsZGxAE6tRKrBfmzzK3m82cifxpxULw9cLdG7J6659zfFR+u45arXprN36Z1nqY460+USwqEtmCQB0mAE09xHh/LBa1q+ib8z57e4mj23HWvQAuS/m6/wG0s5nHSMwmdskXbAwSWVDofS1A1K0JGEiPhrKAUquVEb872kXz7kloJx7CBZDFvjjLjy54FpgEAIfQv6MNrxWE4043C3ZRg62sFoo9pn7g5FUUzN5MUGXoqi6/ovWw75xXi+PrZrOp5M4bfD0diNRBjHf6qM4cf+eR6hF+15Eed4ug1A4s3TX5zA0llEj6VwlhevMZ+EFpuUOEh3AqqtsbyCb3V5QbgPzgAF9rkEWt7XpRXzxYZ+29xSYKD7cm2INgtnW8sGbBb0XpXQqnbv1RFbiv7WEocovl0ka0yndmMQ2axtV1hjFS7AmU8Y03HxQanXGO/AOZdLqlWLAeEFseRBXNdPJVajQCL/T50uKwChKfRiwICLToAIuXASkDYen1ghOhCYObm63+mAU3+53/85X8QkizRD2aY5DPjZ/E+T14iKvQZmYTMjaRV3SLhybs4vk3BfMERqAsNeqKoqDfIrWmc0Bh7JkTWkV3KcWKXcnyuvYdQ8k6UAyydzeTtwtg44uQe2JMXWE1gUj7569NtuKwBl64Hs7Or/mTGvtRiSu6TVQetthkLpXUzBbijuGULmzfBr73eiZ3y0VsnaZmsty5jOowhDNQs1FMKXzMGU1D3io86ookDXyOMg8+z8oTnBJlyY+C2pnnHZrDsFO12ZX62Z9fDpxxdbIPEoKcUFh0Euz6qHoobGHQVLil3olrodeu/19nA2NhO9nvLAjgOWu9rTX/Qw0qDbYkv6LhjI59o9579ANZ71wA86a3n2vJor72JGsdFna1zRMApVzEEIncba4RAGe+OliyGg1CG3w2S9BzYLBQRj9IL+SitNX8YQ27REV55Gf124ZvjUO1hHFzubmkHn6Ds0jgyKPu+KjruY8fzgOuEooGHI8J7K4YV0kuOo9Z11iJm8t3gaDqQbk5YpvrmtUhSaFPPIMgObBfP8yjggMpETkRdS5+DoZdns3niZ/ve5EqHoZmTw2zd5zIvcji4EaknfV1Hpak/slwfKJkLIqYg4Z4ZkXufxJzy5RCf3vOqUbiA2EUp9EPwiDTf6OzYlUpksRlDOCzuRlP+uyHVnL0OWkHn73cswYlZodTSDbw5qDoTNvCEo24wcQQxfCBRvAVaZAnEgkMLCeSEt1dTFvv1jFGZtY5XBK1Ur8nfr1dwCb0S1BTqZ+W2eOUxBp7cwCjrEJQ6faHtgvkUuegHjqTJbGibt+dEUig6/4QqQmCKeqIxmjDCYcymN/emt+pLSk5C1aSQThvaaicTbQOE3FWxIr0CSuqoO9ugyeUunIeS+Fm4Ps3nIzHlKNmVe3bxr2cjpXaFVNd8N9mzcZZN8xk8j96WachVbB4EhRbg/ccm9+jiLN3mU6BNuv7L4zJfZaBqYVOvxrpxww3WxzA4XJO9drb6YwZvYNyDUHGP6juGvkyGPIDkV54D7K7YqIrGKk4L/NsCYAlVKzQI5vngupg40tyQaPDwXGbciYs+BkHk1zwcKTod3JMpAhgj2Y9HHC3C8XQUoyaeO37C6NaQsSbeRUuFGffrhPVYt/fFsO5L6gi/9bz7XnBiLK8eSaVnma7ZPS4VkEeEglY0IJg4bgUM3fht6mUQ12VMpj8KyfQIMaE3jzo64Zs3bLs7ssV/HWQqo+6DQyKkEcglwLRKmtEPg5Fnxzwl8Ord3o1e3UfWq3tgY1ctzsG5vtLp9vRtjiBWTltByENyh7v3NLgR8Nw4GADv9b69KMtNfau+eZRIElaqESnci19fUX6r3AXmFcoE/orXT6ky+SJLWcCcHvC7rvI5d1QkzlmERHSMFafETCF37lYO6S1c0j3ADa1OCIN0tZd041dj0ly+DHjimWEUvBOUNk/S7FhjgKc/QZkOkWO1zqR5aJI/+EQVGZrOwyyoHOc9Rjtp/X4ErPsYslQjRZZzXk7fkVd0DBDx3E+Xk3Wx42l1lvSK2Qs5ufmLX8Ga73Gp1Xy7x+sdOAVyAlI0r9eyEWPBTh5/J9mozOBD3stU1zCY5EL9gtgrIPqxLGqjChoj+MU+8aATs2N2dkkjfVWmn+URW95o4iaxj47zXWbhQOtREhO9IHSu4DUxIYmF8PawKOQeUIjtFC+JfjwOzGvoR0273SzzHTFpKJG2wM6RXTpDo0hwY3C/ORq6ZicfO34QhjMuQQ9msW6aUowmPA4c4TuEL8ihyVkecIKh0IjmJzctslkEFPf4752gAMeNkieh1Fk/LTu+ulg9lyG2XUqzE0gI7d1vmgUiJ1pij5xVjnkBby8pqgUlfQneoa5hO8ypMuinGjx+FELnwAsiE2zy/+Lptu9KKne89qkdcyflLK3ENSB8JJjE8UdDTK4Q3sl6LrMdxCFD3Syog+1Nadz16OSwAqGqalyF47xNDSVFM3Y4hwgg9RxTjfKujEIsyBoFUAQIp6G7PxGvRfuK9RD/5DgF43cQHSESw8fuZT6lDw9/YVjW/jquzViN+e77+/UH+UU25pf4BC7wgD8wvC88KGX+YZsbS+9mlxHbbmHyrnZxf6jEDc/plzpZYnriKiNAOKKd0KSsZcF2hEGI8WI9v7wMzDPQbJfeIuICT9RTGy4D+e4W94KlakYf6GepB5j0e3J3RvtDuZtDuFSJLfJcqlxnLQotanbyljQwuPjgc1kwyCVzRzgDwwFyCJsI/x1w6uIQzcLQyAzdYGOn+Ulv/nc+5yN83zw4PYWGt3uE25l7yO5jkW0ovaPfDj6NpQ9yDVjcExYCBt2P4i8LjrtKmOgEi/N0o0A5NKAcWnAE33Ohid+jWJzlxeIxOkdBVmPfqMocFbI3Z6BUMY6AZf4d8U5Ljt5piPn3aCYbVHd6L4Qqbwavg29UrPEOkQAh6o97PMRcNSimhpEhJDia19dSVVr0OaSxYjWRKMENDvn/WRcF/iw5Y63rAutmhOHBoffO9ierEJIh9zqGKGvvKd2QM7YwTR0kQeMatbs+BojLK2iiDZtnHb1Od0utPWAdo61V9asaRqRmC1qtKzGIHmQ1FQ0kYEdOzS7bhcf+euAqE6vpxhneW3dAD0q+uCxryphQWA2sJ28bV5ABinQaxl/uyvyDe4jXasBvhX634iWph67BB13kJGhWcsLfjoIr8Ff+3Ie9Dsu2F0AcaN9C454F0knEaUT6i1hCfNBJhSQlY+mxxY4G14svXvhGMYdt+vYx63qhzXSkgsqA7wsNPsKdQ+hZx5yL3jKUGWGBhNM3zlXAy4FV9pqakg5WCMVtvOZG59JxfXOv3bHC8suaGKiUWCTlX8nfaEs2SYtk8B/9sGsQVEddT55cx1+FbM/vDZu2PwhECPptfQWE26ZNzODrWN6A1HmrRlx/QQduwjY3sQs3K8Lg2aBa9ofFt+yKLqh2Azgk0RmMSfvCQQ5I7coFeXvSbRhKgdl9qM5FkfwxuwNlzmX3sTqTpZ8ooA+gVm2X1qYMktW3O0YsBW2nMTpvtEl90Plw8pwHnUdRnv7duVen00jeQS3HkurZbr1BTdxxhOYlqAgYOoziyft9jQMRn72NpcP/Oo046VCvyxnJjvzrNNZ7HXifF5DWxzhd2VdEGdpyRPzIay30UDFB3cbqsnMh5Ukvw/WD9YCeoesGOPq/rsPZ+ti2N5R+xHYeoDveKeVI96E8/UVnqYDrDLqLBD3QKeki25GwaH1tk8TZ31sWZwxBhGez8+f4g3yV77a+ZVj09cNT6yQUkWppFCMhks5wxx+TrSYcYjBU4+VYWVE9YsjjVo8nBbeaw6GsQEOrHMbRW+ccwXfFeu8CrnTZRRCO8nmezSQ2EqAF9lKBGoys3SjJXm3KbLsVRRiVYMn+UpoNs/NbXYtRDIVDfjnY1np4CN0v/9XaBB1dEjX0B2KvVcAHf12FgvFVoxfg4aPdA5xUBJyis0sLdrSkVKcQHlDpiajAGD8xkfb9kMrH6IqtyJfgokx6zCaBG36MigYFclNG4SKXqn0uwKlExadAvJcair9/T0XhNTCN6xh4PMNCJJvU31QpAPGbl1smkCBBxM7MhfKW2OR8+xGuJWvt+In7zSYByvwvCedUWLOycqJCrXEQtpt2hQKEALUU8UN0Bh8N1BgO7fYJb3scNvQGQ76oxDXW2kaS+YxhM8xkfE8h03q+ZfRtJbCh22PpUgb/89ZPAIQKhov1/WHCpnmg4tGCC+JI93rsyubxJhxOeTEJI5t1uEkuURED1yfHaBAdMhySUSmNjkkezJ4wEy4wuEHdoxIDhwQ5cFw84GodGCJo5qJ2oO4MxVa7S0efgEMqaWcsy0TUOWqaBzY4Z+iUBYWQZqulD9t0X7I3vxI1hCtgsntZ3OXidrLlEI+Sl/luwes7G2EEOfPxoNGcX2W61jOMG5CINvvtotjvfHbt770jCP7218SNb59+MbE+9XIuJgova83nyInOhD5riU5Z1lsivkh+++s2Nx4D0zrGUkzwWk+LJYjnY1gWE/zXdeAbJn+aLi8Y73rKOvC4haHPEezj3XQRCNuvaRm8AOqwkRBALCq8Xisilqv88p2DBpTgCeVp+ecE72hynOR+Lpd/TmyE2WSnJ9MwAHlOFio1uIbg8z/Tp/ILsIafQ6iOJmUg7D9TBStvvvyxPm5yTg5qcuz/eG46/QQdGacb8fM5P9Ls27m9IAU5hwJGtZC7ZdhlUoAbXqwXou+Vm69+mlz5TGNkr+AK3CUgq+I/qRtF9fPO/shdhOyrqNfUvc1HydUoWVzJAoDyGpChd8urd3PGS3fZjNHzBJzddhC/rMsCq0Sfdcn8Fci703SbbZNc8O3BJPmR+K8Jf4L85r/IAMCp/2ryKRDlye966sA91JQlVuO9bDsc3KPz7Q7lmPio5IyeodxZ1tVIJcRAjx1zG/P7WlZNXIDfr6xAdqWrOLvjq/30vpbWV5tS2daCdmfqsAJOsA5Zsl9JorMZh9yjV/6BukLuj0DB14S0PHI3/5r7Ct189Y8+14FPVy5j7uc60XVje2LrYu36XRs7bdnlBHj3fH5KFRmXlfbEAZ7D/382Sq7Z1r4ym69x8af5LHssONbTRbrhdMUOoLfYdMeGathRVrdnPT8T+Vuix5vDLlrM83fUvz57x5QL89ZgOnzmDuCiwuurR3VP+og6rP6PW8gXZI1q3Z2bMhO1IOmrU90fP/lvv/n1//jPP/FkCfvxEHuL28n+nhWbYlmc54xknoKGdAx9tlK3AbfRK3MMnLPIi0Zmu3FppxNRwg3QptfIgStOjVcY/eaWARyy/5/IW2ZAMR0B4RWvxbi4GutKmBZpXGu+Zm07qjKpm/t8AjFaK7UuxWyxEkL6buGI+XnohW+klOPvsFbXQ7lYJGgJLQSsz6OofPt4v1yepdMLj6ZO0Cf/kRxmR2pvPXGc52SwJMMxmn4i/4+EXv2qD4B4LAQfcXdn2XbK317wj4icR7+blKx3Hnzm/BmUnw1IDCFB1bh72oIlegaOObggfi68p9C3cSWewMuB5EpMWAOvPo1Wx+QFsYzx2H8lfRvXR0jm3grP7RWWeoUkeVq+LkKxwOnU9hX1TSjacCIznbcyRdS2MJBlPR5JjiGSB1ng+bGPJ7oZsTKifpPtAwSalYlYn6mv63g/nb6jEkc81oEU4w/5F4uVDtDnZZbOACUQ7o7LZPIa8NxD9mIoqqgf80IWov7VkJfaYP+Bm3xYDVBo9nW6ezc7L7Os9dQ1SEoriq2f62mLXSqrTVG0bYsmoyoVrbx8nO/+asK3Clc2fmBl17Wzs8iyIqSCoxLW8KICSlwa9JqmDwrwZuIZSCf28FjJKjyeRPVuCT+u10IjLswdghIqzQWQrBqzDKmzVI3JgJGLr2xEADHi5A35oBTkxvFkFNpieCChjFg266rScpFr4DdLAEXH7tWF1+iNRi/SjCByWXq2TRVtXsFctsW+nAoV+feW+2xmTyaf9kzqzeZFmYGOPC+hpvomLfMt+64154wTQmL9TVmoHPvLfJ1phbk16lM+J60+N5qxIIeI6NHFat6ntOnUfUtBRevW64NiQXLSRNFeE5qyEWJkrR0LL83U1w5OW6qwa4PcQCHv4rjNuk46K+dbrqyRjr5i/6oQYZNBB4bm00JI4KawW6HJl9DVU+WHDguh2CeAVm+FwCdHyU+uxR7ipAeFP96dgN4/sGrPCuAwuxG10Ea2AHKVt28RaHC2GhoGmtF4xErQ8vhXGAtajhqzGdAr/sZMB9WiyaooN4t8u/IFCIuxxzhBwHYtFBMhAdaxEfmKMEGhsl4y5TYRlR9Hrtn0lBa/5WtZdPd4dIBz2WgS/LnmOj2px1Hs2MBpr+4YeARXpAD07L208oUCQ6R9d9Nx1yKJ2pdEXTqpf2d4HgH+PNa7QLwK7fsRny9Yg8ptHqEhnZXB6fsTuq+zxaY3vRX6uTX3tEm+VEE+FWmjBiF/9mPY8AEKGC6itg0CPMq+IVPovsIWLurCF2Dw+wvbJdglJrgnMlPoLfQMGOyLYziRN7Gcv5LVxwhBZO69lgOZeV6Okgmb6mWVgeZaGWjUEGUG9e7CVxQb+LsTtTQD+uKlfPnSS6Bl3RHd/LSmQSjACvo2C1FvVc8qpAdIKg+9ZyoKnFy10Y3ObtwkSb6yXtv5rWWdJEF8fWe40VHEWxuiZX4+1UEXEu+1eyki2hU1VmuYju3jZ5vvTvV3eavY84O5Rk5UX+NnzxdRTXqTk8xJc6bFwmM83hO2Hc+BT435js3IMXm4ZnGKI3H5vRM7D7IFSWs1DcohoxCpP3Iu1oF3lBtYlyt4H6Gx90SVoArc4KomFni20oHv1zQM6Zt8I3sXXMgMl9JglVTKc1Hk6NtAoId8scGxvcu5Hn+lwZ+PHMXFfXbDaZmb83PRQpiiBMHyX8ari4/m/F/b5GFRLGV8CbsTf5TM0+U24zefYyL9ES/LBV98pEcGkAK539t94onz9+odxe8jjF6rPH7kubG4p5xDY5QkZBuAzDRxIdKuT3nyx+98x1EiamLW+8E+zbJX9q6YzeI7cwIPoWOOeZWt1h0kINn/yXuXycAdbs62Pd3u0DQSBpMbjmNhOCTdvMn5g/JJWwgAx8NhwEVbmFC22W5SbPhZhLP2Mi1n7Oi9m83fuxyXGZi1d8/g9bRJy2w9vRpDeditJLd8TTOVTgZ3W0+tQhvWxfpqVey3DMhtBqYXXWUzybfJfp2+SPMlj0ndLcpifw5WG/Yhe5Vvdzx14D5fzt6AHzYFI/CxGPpJtodl7LbJJl+vs5k0F4GZhwmnS6HOe0cMxf6TJsucraFkLGOWbpjcD1fPLllnL5OySGdgcl6lO3biwfTI5+D1TJM/Sbey6HXJ9qqEDf63YXyMP99/ocvIwOl+zpO7TuAYn8iB2G/g6KmC9hQi51A/6ZkMZRoiSUOKlB0ASXm/B+uZM+lQ16TzBh/rPjy95kT3lJeYJC+IspGzOA2w2fcxa50xNrsdg/3XbVnMsfUcdIVC9JABUXJByldUyOIn2z8HK99Fzrs+2D1Ly/MM/AQmiM0/BiRW4cjlNTqAEvwvJRsT8o7ch9hh2MhbD1wryaNhsxOBf1MSZlAl5Ajescw3VjHBBTv0hWoDIfoTNr3AoazJG/OsEUV5PVtPf0t2GFjFoimppvGynbX4AaO7AizvWZ2okNoeKdEweJNJscF4lntLwNsgYGJX4cNE9F9o7aStrAG0wWi5HtfuRmFT44jaBDLW1A65PqgEIhh6Wn+I1uGljYevQHo4wJwgmgo6ahuGXppNQ/tC4NlPU9mtcFsEN0kp0BMkOAF1upzycSHS34KddkNTCY4fwfCWosDgEF3n8YTLF6GEy2J0sbVWhVc6iTIfF/rolfCSGfYZQUVwyIeU0DTty+wuVKqAt5T+xa436kaxIV2hfChqf9ZBT2xVvj16OTG28cy/LUYkHzUmMoyV0HvE82G2UIkNun3dOxzvtl+3tptZEAdfMIRfch9QR1iXlfMcQU0+WeQ+hDBe2xrZ07qc2rb17LC27tRtSxDWKODnGPG4i+EuuPcNjKWvhS6aINVWKo1oaj+tSIVhIuythBjP9M+2JxcNu6yyYK4Yq4ySK6pw/WgyiMoifiafntJZbDnPrhINj+tJUQhLshDy/xJyXDPJy3Hw9XGHa46FdsbGdMNsHOqQ+rXIsKW/lhhXS4p5buEoJLyY7B1e5TU+exRh/Om32wp8lU0xFpUdqRo+rvx4C0gTol8zxIXlvCDqRKmXmlRWt0QMrm3YqCi0E4IA6oydXZ1UNJHfXqD6lzYVywaXPOAlEkbiy1Cy5zUumtEJD7oK8I6By5ZzJ3lRUXRVrUB0+xi5QdqANE/F43xBKc/VnjHgRN3JS18lWeNFl9Sj7QowzIsnRveCt/oJp0dJRpwQdUao5PGSwWAT9UDjYcj+61oi5m2EFKPSMl4TgYvQIxDIZmpRyYHrrwG3BaOJUQL/2BRgNP54FL8sTN1nBRxb5wzWssPrOMIbqx694rEoGkI7aMz/ejHkeJBWCLYbjIxHPG6MAwVky/44RYPsOJ5YdweF2pRhPE70nHyWt/Es16omnGl5FIDiVK+XERIUHY6ed5LhHCc7RfIS8fD8UMNCVchmFbyjAU6CqgFY4R8BebjRVsAeXXP86W1rzEGHGFWspbNRHO+IKlrN4W6n1jaoeYH6xCaxyXF5Q5HjdGxe3LzKkAh/8qsqilA1p1RQ+9R+bq22+8d+ZkGrEI0PrSoqFIfYLivUBWK3QFFziGuA61T46YhgM1JtcHOrfBtJEHZ6wlYk0aQ826Gu5Ufl06tcgyETYPc8dDa4llbEUlcM4SUwrce0v5xRqFjhacUqxRLhGWkVE3c3ylSdav6WVLWtvI3gj1dqH7heUhDR+XJvFzoPchXbjVqUPLcWcijbIAXZoSjn6oYxhWHSRCE8VayyZDKVn3vcZTQMyp/lVCQz4TO6KU6rRzZWQCv/kTDEAlzsO2tDbWWOds4+kVrJYw8Y5ZxAnCRL8leRa4hnWLLSKcnPgYxK6OsVWrPlCUwtHTSQyPa9K3Nn5Y1TSdxGGom6KTI8dTC9XpNt/9u74tpJMyh1Mr1qJojtWENipfeRASMehxPILCNrhg9wkjzLydhKGWiSP1gbhhTE3JMyn52als4yqbbesn01smCVMieGYZUNM28QolXME4HaEQI0zTE7g+fLUT2A1xNsvtDUCbaIEEWk7mglScm67na592j6AJPgwJhIvSroiXhR1FieJgzlJopWWbn9dHKII0/4ItDlNqL3SierqLdXSihYbdhvZ/kSMyQqRNQRqgIpHg6VyOVfmF55xjoyDBHNJqiMkGbIPAsuh9ACi5suwZbMCAnHz2pAdrl/TMZF1F2cpjFPjCS2xCEwP4CXUY57uR1ZLdFyjoS+IxAnXxd+Abzz9qjKq0Awo4qo/0pwul4wlXdLA97Yx41SeZk0gUdJ2FL6Ui521o7F/fqdHaNc/A+VSJ4Tv9lrOwxcQqSzHrU87WKpRGju7EwKWP07bHs+4nEIzZp6hzHi0k04ksfB1DSLshPUejwCu8yBYaIFuOqGObRQ5avF/U2EGDj8rUa0QTzOIBxh4CMC2/LH2HuC3LAaXjc9+tuQjkDUblqLsL0VyGXUcsTpz9WC9g6qXAjn7BafQIwrfq37jiVKxWKtU6hiahvv1fhYMCWYmeNHFFPnGV2UlKlNhV9f54VdRezltlI+UgZOqXWKuw7UXJClpaxYjs0AGuofj5uYGJypjoaB9fJ5a65UidjSV8AcuVJdnuFNNJI23kT2a2jzxA1aOn6nvIO0EOk2wa1UTg11C6bL2nENa9hZ1gIOfrsBLImk3RA4b2SXVbQo+en1n2SXnYdwc191HU+85TvtTnvURMsOdR+xw9pEaZ0OyP3tr7stoG3/UL2TrtD0M57z5uywN1rB2R4OKYR2GsGyYXRAidY3dRjDvKDajcJzkHcjuvZDOErndoP46qq+xtFv7x4GbM8vq3P99jRsB84Z0Vv2MOCkFw5CqLXaDWS/RbqMcdKR78e1af1A1ueo/WykkzSsMzydrgT7wdoDrVtKiR7Gc/QDPYwoEtT1MZKTtKTXIdW6e9yTrndtpRK05WtH6eM6dpeay46DdNlKX5vZC6I73eJ+PF8Pj5ROI2GdVvcROm0YqerrY89spVqfI3aD0tev9EAN3OmtJ3CQ5q7HIZWqq68RuY7wYJ2usi2kxKurkQL+oB1Tni0y9t/On+MPIOnw1jfAJR8JndDBC6X+/PwiuZ88u9pkyf6L5NP382w5Sy5O3RCXCQoqUCVOIqF7TghCcvP13wkdK7eGyGx72iH80Pb6h8QvGxgXlLnH30k24ynUgAEF7kK7OATnE07gh94C8u27xQpyxtmp49WPwRgPHDwDXutWO5ymRQZtCBuMo5tVk0Nt5WU2WRfrP2cIfDd/kW+LciuDMwZP92erYl3ks/GmeMnETNZ0vNqUyWCVrdw+kNBFbYRoFN0qO2RRKgarcMI1q7LcDeVt1WyR/nB9rHq7KF4mhLJbTCEJb14Wq+S7ExGjLmAHB36FnOfqX9LTxq0VZEqzOMWLxvokyACQb6TIUazGizFvWnv8/n7N1Tbjp+h7VfGn2tlwZJgHp6WTNeNLZbrkZqXIDDznzIlJnyMj8KwBxqr+C6MCnmc251F57Ae0TEZOkKgLimSxS07Zdsnw7dbIsfEiE8kFzLxeJrlQylA3ta9sR2Mcgc5zvdupI4mg/ev62eCb5yX1DdB0VYG2MITzWiKxlLE9Oy1P8i788oQsVOkStccRMTP3UqgKXcB7q7NsBqdX/g3W25mecsIrWz1m77CyzGb7ac4uW574lnH7YFWq+BqCdbUaLCWQpLWnFVmazNhSQpXT+ztL0iF4WbCjkgEjZ1x6y7mq7eLyxhuReqZDdmsoru2kMmfyyi5f74v9VvRlR/IMMgqqGcXzW2LBI1ORsxgBLZPJifVP4NNkZDGCFnVMK86YyfVbmczWOeD2Um3khyr4xOkhXrLHo4rq3MxtiYPKaWuTCH2CLEqhEts3opcQZ/i2kE2zVMjNqUeYuXJ9+Vfm0zQNidgAyRj9p4AlrpTcc2Bw4jA3xgrRT6D1ewHeFWg85PgzFrp+TgV5RT5gTBHmnx+tVflvRnGCJmBKGdpalgpeJlu5XNhZ+sBl0xPIwDIZCrnZDkU/wWvkxA6TWvkCBx5vF4uQ5Ct80XUVGTa3+qRSAHwSyRf8h2zBt5QtWFPLzVc/TvIR2+gnsM3ZLBl8Mn6e5DjVmknciVN34kyWqLeD/+E7fgbMQE9/f4i+isZNN5u49Qc7aekk+USLOoZ7cMHFPQxcmFGjT5xKXa04T7iE1zfKhwLZyenyDb3zpBhS+uZQAZmjDZ8Kgd2Ra7nlPxpzLeJlZ8YIlbugOVgtGer3n5E5W3L7jCx2Ivpna16FtccM2Dxdnmxt/W2Y4nEHxIRfLrISFijzht+vURGGZ7BkJ3Ji+oSPLGu842mpBaeoHtS0zunh8m0RAZN9/UgPKgIObr7+f8B52pvcako+5g3O1FrjlaYRjkW8g+hUs8pOID0hAkLiphkQslMU+/WmX9l5TmvMzVAMCXK583odKKFsI116mkYttKfzMCo2MhN2hsBYp/JGdFMoogeQRSXcTeO3vxavp2ieRb4IKjtjcGjI3S0y4cV3wa3eUWMbTrYf8U710lWCVOH95KRymzjp/aI5KG0ScjN7kuudnOUl/0e6/Ihar8TiQ6dVpwWygd0KYjYiR/E9YS3Q2xeJh4rTL68eMRkFLg/LTuN/7tmK5UMg7hds9oHyNK/ZfCUlF3bHLi/iWKpTWpfCY/g23JTZdpGl8zGfHRfJrZDu/c/etOgZIOpHJIMnDH4cn8NrLnyqTXRPTuEPbyD280AXC36iFhpYqmzkruwKS1SimAecu5NZli4ZX+Bx7NDiCsoVwR8mixtNm3awyk4MoIccmpK5dakOwbOBwRieNkvC8ohUXz5cIGiJRHwiCzZfPBzbJ1DMEMQAnvhR4p99eMbzoPLkef3pIwXajvW2mxfCVV3o0y2X0EjdI18UMKyrYY01BeAJh7u1BdKVapqAWXHXqdyPzaUOyE5XLXVUSRH1ZBEju7ipmaPX4IkAk8sU+WwiL8N4VLQZQ8TciQVILEK3Cfq5ClluhouIuHroZMDgp7xCVh6Pa69FBKEJPOLF4N9rrQblaiPl3kM/kVt0KXKQBkvRkYOSdvFy3G+VS3IikhFhVxGm2zVG6TwBQ9MBMdFHEKhW2gCD3GWS+wrl0zwDRy2EQu/jNyEKR9ar8mjEcxvk7Dm7SUvw3BLyj7VG/2tF7pAn6Q68HXT4LBwB+dsY0kw3lJDqjElKUFqPEBbqKlFDhfRTRwi5TtTy9fBTU7i7iIdkR6JO6o5cLs9jwOpDTTuXm8fj5qt/5FvWXFPtZwQRzxrPFDcejwg1+XjMnzC3HlcbeyZ0HFEJ7J2CbTuOEnX16cP/t+toridDX1FXHQZz1X09Bfx0GMs9M52Cc7oOE7hweh1MiZO9jimlul7HXLWNFYhd232cS1tt1ZmTuddnJwoM3cn9YlKJva0GdV8wHUaxnhTth/HE+fZD+XJt+7EIAbKHNXa9VXz5p0FYRHUsg1WiSHtZ3xWUeHfO/ucuL5erhGnxh8zCM4HvWKe4kLEJSjyWlTFEvAJ7yCP37uc8Zf+b+KdH7C1wx27jfBelHyDR1OPkYznuiGdifSxqG13aPcD7/WP1xTJfHNwOcFKV3w5C7s4324tcwQtZYwG11R8n7Dtoz1iHHyWPkilYuLUt2YJpOkoOwX+Nu98LndqPknQ2Exls58ninPXlSDUO1o9HyccM5MfSxXoxd74/GSVP2fcn6vu57UD3mC2QNfmY/c9TPbWsNYFgY0AI08w7Iof/YxhSlmJQgILOHBona7bGfFEJar4QXg8ZV82x7wML03ed/YJiBB+P5CP9sfs55V+T706U0R7A3BQv2YmeToW1CiIlpHFm8RjVFvYWCw1FkSb043Z/5v/4XPykgEIA6ZJO2gB3eapcHM9rHeQZYx9ZtrX0g/wIT+SXZHCJyBbOMxT1uByzp8S7vAUjY0h3xSvFfCwiSLSKQNH30G4Ohwb9ol5hdqwHPgV+/4/RL2+iqiLCKwgKcegzbkdT6Xiqa4EooZFG83JPzOySP5F06MS10Eyz//2R9BpdTBUNaKcNhgI5qtIJL+wKLWgWA/1C1UARG7iYCUehhUhUK9QiRWlyLlODSJpZzEbJD9KdIq3VaUWv57zWyGI9ShoNWoeuTCyJT1n6G9BWBV0JQtJ6hxPTFVx9rhWr/u9/q+PfrsdHQa56Pb6nKMqhGBGXZBM6jF7jDjk2BA8s4xiSyH31j2ykY4vsTD0l90vC/gFuwbsyZZuRyd8MR1s8ZmcRSvCw/7FiXOyDKs4pQ6MZQ8yZ4XUcJ3eDpwxGZpS/zs7BhATcWJ2DZTbfKeJOGtB2hpykSRpb85WhBRrq50hYZecpQt9jDqm1HIlJFUy2+FhXIrrGHaGTh/eap1/MKjjAhuAAmAdszC/NWQDFBNA1yi/Ej8WsgosxviSQjGpHsQPA7q2XY1GEjaRd1uYeb3Nv6CEycmWp20mWe2cXagqS9uoMFEtcQAFQMOFKeLlMwI8YGCL5xsgQwbKYQQnnZABjS7wLnA/93z4eBnnPBkTbKAfiLSavjQ/JHY1xo8sARyK3du0eewP9JRz6QXrz5U+4wxabckQwPlVxmLX7krd7SbR7KdvJCl6SnMjhksgQiJJE7Mhi7dUYqxKFpNRjBCp9rg1SHvuh0CVxJZTsLIiTqZlwvW73ZDeHWNm8AwALuOJkCq6Ly5svf2wDr3wxFNE+eHzCOL/9nBMkyV5t6zXIa5hO1Y/4JTV/LS+pObu9vlJpI0F8+tlfeW+XefTtcvkNvbD6hdxE3s8tpgaCPfvPQrI17q5j5pwPOaeyu8gnCRxb2Yt4MsM+A783LxX71eZDK4ZVjxGJhJoPX7hdYFpVD24h4Ts9SCoeZyP/BWL9FDnMRH0F50RIPYnhcuAjcs8kS114JR+sk4Dz2lbSFpDSkaM8QAM01iEI5iZ4FKUSsZPKLhogAWmhTI7cygsJI4NxNfynfz0NXFwNCXpz0XlHiy36GvPHcdMgRO5hicQKzEi5Y13sUE8bLb/5l3ZPBps6/Ae39YbAv7uX9yI/wNL3wEaLZOMjYUWUNdwZKzkcyVzDi5y7+gMyzG38qvZlJzOAwKWncMoP/KsK8ek8W2dCr/4OeV+Z7/KuMj947gG3czkZRnusjLaMMUEiaMgw/vmlJ41cfgGOfQyWC6tCzG3eRjAmL8bZAkDDx/FKn2oaAFgv+TVnzSBjROVEPuk8h37eXdd4mCm8kLUMYnijHsh66q749YhvkOwFmNPZzcbQsLjkV2HydJg8Bi+HYpOVu6uYlMi7QxywRA3o+IXOjXi/8cZaYlxp7rPMJul6l4O7nFCOiPM691Wate/51jd9hzubuLWt174rOYBgM6iewpTNTvwxBpdcb6fHcNUIvJrrx/ZrxhRo5fBmuBbyUy5SMLQmA/ZPnaac/zId8h/Nd5Aq4J/sBAwYHT6Wr5nE+vZcfPxYZK7Rgev2OWRSO1ID6o2XqgAIlYOdhisXUrVIDcBcvP7L+ZI9/2UP/eZ3SONSROQxagB+7mjakWKAl4NMjv1zCaFyEgwgX8ZPIO5BQYI0Kgtd+pgEZIIBwbMYFfynWqtnF76g7l0wOKEU/bouhcczFYc4xr41mAu6PUYu332b5tpSxWMU7t7bcIBvpENxHx2KB5heEip8/hZUFNsmMnZTOBzJq81kNTKaAM8FrvN14Sq2dfgHO0T7XSZ1e39UcW+bBd0Fiz0EsZmfPqSiibDQMISH0s2Xf/vphaKm8NY2Xp/l738bN+0ekSI/OuJ6qX0mxbGEkV4QI7lnUxhhOp4zMaU4sp8nu4KJqrxOJpdOmQTnXZl7kFAZAl7YODEf72munfAS4oxxvqGGfAXFdb5jQ8K+n76TpGfZ0um4ZV91z6kAR/X8QqebwLQFtzBWUrjy9e3KgwObznluDsN/GmjfLB6TfGoNO0oqpZCgBELj7CyPZtJ6aD5767vdE+VZnBxdZI1HHINpQDFPHV0tbj//MTO3zh8jPKPwGqrZsWjokaEW9yzJjpbQpHTmKNtErVVNQHNbLsU2ZDbKEBuCBVpUNjVRTrUuuDx4ozaL3zr8fVvJ3b/+6S1ydzboB/xBzgNNxsU8TryD0EHg5OEdlu23hr1suzEXfrZctslHpBYNBEH708g0B1H5q/E23jIS5whpAxelqqLeEGGTVrzwN0y4+72QxlkFCTlUNbLolp9fgXeRhYnaFpHD/LY3Q4z6mgl93o6wb3721+odFtgYGK/ulpyGb6AF4rL+VFiDKEaP7y16hBqObd8bi4OQpZtfVi/5BeWyh5fowvIugChI6i5YVNwD/MHCbwDxdMHyw4fFbL/Mxg/Fh5u/+Jvk5ufs///ib4bJhbT99cozgKlZmk0O0ofSQWvLgIL7c5ZEmwxFVT13S9Xx4+2ZcIEzCw3WPALtb275SAgEc5Hg6X41BhjWQ3RMLtnYa0du5H1GPqvBW8ORotLDWYJjNrHRc+piofwWYKG0seDxh38HkL0pFdm3hhrxEFOagDewKqDOCbpbZpvSQi788Ho4u7NvBsPDMQdibtFb5ZUJmv619qELj1ZWjnZPj2bUEJoZ8zRDkLvEwZpuYhkBblVMeT9fb/ebzVgYgh4h/5MLvH62VA8ZvBq55FzoozeSIIe5vVjtERk8g3Ge4TkxUttGHTOvozphvucjF38Czy/TaM2NUp13RLOBuIslaCqvAz6G4CMhfJ0uD7DDF+n6qC+DwGCMHYBhIegEqdlooL/whxwAV1HuGxOOrWGzCeN6VAGFpU0N0JHWYAZuIGcDB5ymhi5ReaOUNUZhe/32kOIDApuIpYv9AJwxBFDIjjlBP5ocjhLua8c6j8ALnaNdmHXkmOYPzurFcFwaS46qVNbosqGM6APP6q93wHpguwH8wDCtFlATVygFOI/l/5Jsxmkmeos7Tvw35B2rQzDgCTGZlsV2O9ll5coxeavNdqrkKrrh1bjxOpWNmIF7RN3U3jHj7SfFOqtH3+yttBNhpjScPmkfYqI8MlTs7cSF2YRDaTY/rE+rkkSl6a3G6O5DDL0eQGUq2EQDQgTHBUbWu3yzzKcp4b1Aw8SuM+EfcEc6Cgwx+6VeYair9CyQ7e/UbGeRhTy74AMHnI49QYTQJc4r/IvRBiHfIRLiB93EMqAvUKCBcC4KMAf+G/tTT3tqHC+McyCtYVRuEnN5AN6WukXQtkzW+5V4mCLBUv0JOnN+UVVstaIJsqi6r66W1IvdbyVpUm09pQDrd9CYGqGhYCfSXAZpf4I0yA1IDluxrRyHLnPRZuQaHljUQaemVKRZPc+dKtHmOfU+8fWzNbDInZBm2XoHtaGMbdRdijlgBOKMCGU7CfmHzwORdJitdeCCZ0sd6Q5HyvM7qnVhrAspYMOBJg7PIBcyklFq3Mdic04Iy4BTc7mpfKk6So7LU9xliokrA1vGhyHX7IF1+o4WSaFDWdXhnu5QK7tDr3GboBUCCWeVMfmAV5BBnIdvEjf0/uLTi1PzLBuo8yHk/ef8X1q941kbwfhB9yBMoxPbNOrZXQ9U5lcD9gMFl59HWixhUAm5ErwsVIgEUjwjFqSE3BVyUPXCw41dm8Njx+/aGzl5jMVp6QgZQSxmO3isPgyNejxuy6WXYT/MI3gUy2U9b37895Z9Lry4+ni4Y3m023ffgMLxnaQu3BqIib4cbba1QGxrYUEytLdX22keD+UB0xvwqLkJjv1R++h9Tui5dwVXHysWZhv7/eby64Fn3dcBUILDP05UZBdtxkxIaZlLJII0roeO0w+mG8qGVpeOkLOTTdiEoEkYEzDoj7nlQgVFhZH/pl4AlyToZlzGkIEwVQMeJxM6Co70lFc/KvDBgc64XpDUV9dGOqBp17Frep7hYUxVYMg4hccp3TX3WmZResV+wsKGPC2ICmS3Cpq0ZBZnhx88dA0yfCbbKPN+vgZxtuFNZqnI5/n62csC3mFS3uH2k/B6fETycfyalAN3KfDt0HqTO1eX3X4Ups7TEBDFmvCqo+A4QnDEqK53CG27QHsye+jp5Q8rdPs4Lj42zlGFVr+ONt+ML2htMqf8HSUdvg/fmpEw6gn5TaUOiFrVQRgkUTQxBJT46oAV5TtWz0qwwlCV6foiBJb6XBMu7AOK44ns0UDqm6blrB3Ay3QXRCJ8q41CK5EzTUGylIBd5oEWuSlhyhO9CanwOAlfa6CIPXQDkGzpxhItpMAX5RMqRolYBAooptz6UCSS9zZx4od4JD8NnQZnFMSg1FN5oi9X3s23OxCvw/efWcViGL+FIy+MkAwS2yshoI2SxzrCWCdVADkyKr2IF194UUr85bJudFENTJrBoyHfTTHebi0I37dv6rp4EZYe6n4k7ZthekfqpKf6bckN7Fyh6krZlNQwoq5x8fxH+tiQxui8GoPct+Zcv8hC2HSdaBhq5JFxnwLqPDBImNy404mUjnRAKkosalDwnJBNXAb03BJMiNVYyap9TkMEydLAgMGQS2mWhkdrFn04wnoGS+BxpwG9MLlaRyH73NPF6vU/twzTzeZPnWOHuEqLE9hJcxF++mG9xUHi6lzEvTQPLJAbxiKrlLALyDnOa0gNlEaq7qWnTrq3QfZN5ywDa75rkSUoY59bh4Eg8FOi3v20vtYZK52nNuD6mE3KYr+e7cp80+3NrMzAkWtpKJ0fD6rHsQzC1yHQhdFmO02XaRkxXgd0VI5BRaYQ4PF/5q6NH/k7gbGPuFFIWr0r6C4kWo0S50IiyXIUXiGm2kZJRk7Ja8Cg3bfYxqmjoc22chDHetuyXxtrbnizXIOSMTU1tOsKx95vjW2XpgBh63mRwdt5W09jcUh6M3RWb4g046Qyh5dOojQsdsUkem1CvKCXY0jqyJEy3kYLq/viVaOpZR06796AAwclc9peQTogN/hIn5jSpTQWHG1PpRaH3vkh1+3UVODQ9CCGOOw2hO/cU9Mo2SwrrR/i3nAAIptdhxFMMECzMWKJSdqMpPM6NeuMkmw060h4fTYcwfIv6NIXbohO/XVcWOtRtu17doLeD97qMJQIOGo4gAgRadEHvONa9itb9eNO+O06Yh1NqyHa8RksjbbtqjwP2s/cgkDt117TzpQU2McYbRYSswe2HuthizNDyWAdhwDPp24jtDhSpOa+8xjcqNLDKCC3dR5mme66HbfWVE+aB3oh+b7OcTdm6mpMu3XnQRHdRuD5AjsNkfaAB6Tk6zaQ5WDaZiRC79VxHKyE6jgU4QrfbUDrnd7LWK1Jknpa9u7tqScBTc5+urNVmi99paadLlCoJiG5DOTthRQzA/Gqv8stF3cSmQqS2+NEbl+ur1E94EGvvhzxTkJbgdoTJkQJKz8kdXSw/iq5vfCI23avrQBzV1UgO5zGTX6OGZNEXJX1kgaSDYVUqxED5p3I15d1DXoR1aoHHqltdZV6ZM5XskaF1q66Q4CGJpjbmaxlgTWxUWnP3jdlHTpvYB+qVO7PWa/zoeVjgLZXW2orvcmGNRqdu7rzWkZ6gugd0j6NeYCBKwnlhEVrNI9rGqRi9Oqq6GwFZgjW7eU+LeuBecSBOraz3UAYRk3HFpoF3tVuoS1GlD8MUcbcEOwx1ClX1rgG2azet1bTa1M972pVo9dPrwDFkEXBcDhTxMPGcSGozWlILuMOUYPTmJv2obppX7CbVtWRTx6eJp9aIQgPvdv3vRfpcu/mweU15R8qSq1yeVA5+LiL+EPlAm4lh5ubvM0uDT6sxYTghg+Scc0h4Fq/8nzPHYdyxoVxURtBA7L9SLshob+26xk3wiCn5xpe63PbxbvNipSHwLA7ctBQHEk4l6ow5vewa932DfvTV3XSLlOn/laKPYOTyLZRbSH8yfaRaM4/sYsGDQYQ6LTD0gJ5Wrmdj3kKqDooG8Y3s/ZAXPjFW+kP9tji6v1scn/bDLvIDenyH1VxBYaVSWcEn6HVENQRQ4TuV1VuEkG2JhJfUr+LMxYS/A0Ap9E16ouJWqfnfRpbn+eBA2IjRS0RfzDs2xncEc8FlWrpPGnEioRQsIA/roSYQJFZVPwh2hvhRlFeMyk8hlUlf3svKK/p3HpCeZ/PKfcHzuH2Z+ZscB+Aq9CjygyqcscxNIi308UoeTCbQWSh/DPipYJeL+S7TN+THngHZNGlu+1ZxUFbTnMuOA3DlSMJfZDPd98I4TURs34RFLPCFKTFEXipcHEEhdu74pD8N/rCxFtbhoHTv10UL+u6+B34zwZPByE0InoKNQ33cgm5ir+jcof74bISbr7j1q3+aZw5JYpg3wihdKLcJK/EceMJr1d7Bg8p6NlyQXMuPKHCCBtyXL144s4Eog/dlq+D9GtcyPxcKozf4m18kMRkCQHAdQCDbkbD1848aqDL8q85RgKIR5x1MS49laMxftxz8DihBB1De6cBtLpZS1+7NPB+DY9/my8r2KDn+zH08/gaSz1no13tDqT3nKPEo7VCP2CUueNQ6r5ZRjGtGnKkVJc6Zo8jyGwgZAbB/EbJ4v0ReSqIvQX+VWbLlIpSaYFxlVsviO2YUu1hY6WZTSnhWe3sdpbbp99JaQllqnGcfBVQzrO1uUKVtwkmi7gj2rBGPPr+SVHsCB/Qpvi++fqnEjuf8/OYvPVW63NYeRK/SF4ushKUxULUeV/WNwgifhSiNPj8vipB+gLGurJveXMA2WVxxUsT8DqJrLWYdkDzJ+gC1UHfh7hUIWZyFd35QvTl0+B0vQPy+kAzD8lDY/bQvbK7np1BiFY4zuCJfxyndDIg1wYZRTs5cAMRdaekKjqqs1b5RrhKYmRRc73E+/z1LpfI/lJj5bQgehBWIclkyjXGHmpOxQTjeGKljTS0OpV7CKuxGzMg/+dYos+Kog3bWOsBY1V0JKEhM38pkMQmqF2V9YPuPu8NPrBKU+mnCBm7H8t0FKqMUFVR0P2uqKzqLjaQQU/bVGILO1TZ9GonxEMTb0EGnLWcuirNigoCOq6ludRifUU5THb3bbPlnEo4SD1rBqD2qNQ4KF5l+zZYN1ZM/NLMTkpX+axpXgEpALjmYkpkmIibpBpNJWOm4a39tj80D5IkLPJwXVw1BqRH+TeJg2/Bo9DHJKIo3uZ99hSrwOcCxGIupMyL8iWk41BeyB52vwkJLSaM1hM0DNnFm3tx+Fe1Mad04RKDFF3ejjzuR+9SIjsX2GtgwIvgrU87kVv9D4IuEnRvIW7NE8a69heyYx8+2X35diNbUw/RDVKt1XEkISW0HsTIRz0MIY5rHwOZc9zDYF22C66zTp074sQIJt2GaBX7RiutugxieFM/o3TEbkgb1NOAhopre6qPv7csztLlQbHJ1skjxnXOi/Lq2SJj/+38Of4gX+WMx0sdej79Xlawycqrg3WxFhVvuR/eNhOBE5Uu8EJ1JEIt82v5fpsuslXGJ2RAT9Pl8updttB1uvaznp1sn8ZaWwP7tTdBF70vX2STfHuyZuss06W05/CvbPSKoTgMkFDZWcG+xEURx7Nsvc2egHUJF46Nwg7J7HIz/YRG1UVWrrOlnQPSB3TMmjGB4+bn/+Cuvj7iBVqkoZmeAu6WM/Y6ozdVUMSWzLA2+IRnXIetEKN9xChxqw0aRPY1CgR2ipJPhvEl5luZZRBtc59oYDCgFX5C4wKC2Sab/XJ5lk4vYtNJs4RC0+fPoKY2bz7+fP/FFyLD1jNGgP+aGOSx4wU5AM9P6x0RBQc4cJJUfv5aUEonGIzhTdB+Lyiqg4S6h6j25nJR+9xQU00Y9Cl7iz1PnvDrka0qV+xrnkLglOpXzJPdgrHjTTbN53k2S2QGzhWURF4XO/41PdsWSyakH9hzyr4CaznAwPMaQBW2Au6puTyWbEzGzcfJ3be4ta2UIP3AGgxzKLM9goMyNJ5UkhV12KyfhK1vVzypnN/q9rTYl1OhNQAaoaHnnTuBuit+4AM7L4tVNbhhkCyi7gggwOKAKLOs0BiFK3NrZx8+Eb+EtoC6faNginPBGcOJ5AsPtslATlON5KE4I4+YWMLEkC1QalFymi7rHRueFQUMyey4xOnbRUWQxL7+y7okFse7wFBajXG1jeSsE3vZrnAVGZet5J8j9AstnN2VK2y6/TX2eRKk3dBegfLGN/8Hd5ZPCl2OoyixzaHBudmDnkPcFACwoAPW1wSm4zuBbT/gOlODFkRirRj+RlK4KAAwrg3LZ7p8J5y7Z3C1THd7kKnnvOy6lAHBU1CdyF3BT5o+h9NlwYRn+GGbz7Lkt//f5M5Hkx/ED99TKVrahzAgU0oN9CecXz3gcMEHLjiKb+oARmRMIAZUgIRryn777wfBkz2q2KCbn/y33/z6f/znnwAUjEUolxAVv8TeYOw5kAwUlh5JJLEp9fpGrK9xGmVfAixoRNAPmn447OmMWj99dPYZbM7iE0MZRiRRq7prMyPIic+PyYfpbrHMzwzTtoaOk8a72XYakQ5NOtKYTPBsGJIiT/SzEVSn56eSuNzx1CHlx/e8+k5/dht7wFEBXv2Lqpt99u1EWq0rKUwF3BUQlm/lV+73IqpAeBA49z74VqG8Dkp5h9r3UM9UzYNB62I6u/xdxvNxXSHBzSA+mIL4vJxkm7yGoAMlv6S8ABc8v9zZJa8u+FFcMIgyltPqLfK8nb8l2zT4rJpzK/kCmlbxqs9gcLX78EcdCuhpW+MbuPisyyYieWwiSacPuaxS9oMpPmFChpDVGYZVLHyDngDrcfI//+Mv/0MyQa7nQl2LT4LRyFbiQMrHrxkHkhO0wIF46QRxYMT9BjgQdNoFBTgssTdZ+5f/epD0Kb2rjRI8ozHSJTDnrXrf/Oyvec2rc2fPJItYFWvuRZeBa1y1JV7ZhBrkO+pkAkKpT22xYD1d7rdCuNphw4r7ev7NvxhDwVPdTOd30f4n8bqywqPCKTRrfT8bDscv0qVb7gUS1xdnuzRfgz1oznjo/OaX/wkaLazhdCDEKlsx8K2Zbr76yna76ANaZaXSEXkqBck8VEAeImjnKF5OBWAs5iqwYj7elMUmK3fmJrJ37XJf7PJsvTPViSfrTHiE8u3ovixZifxKQojTxH9YrPOpAhVPtczSGTyneRl0TXCKRFL+6OfZTyDhCxdXU/YPXryA4RESoctFwHciV6+KWoEL9un+bCXiwT6WuBiveNUnkSPdIfJVep7xbMOn+tgCgdQ+rQe/E8bekD+VgEi4VdG6Kcf9Pajl107wcfXkIXcwXnu/8SMt8V9HYcr6dFqV40cfXJbtTR9f2xHPGb72fmu6Ntany9ryLV0+vbaRQIJarQavBWRomN91wgqu6/eCtGJvEMZRCQLz7b/9PRNrafZ6VVBVnIGZ1a0eSoO7+zt/FCIr+704DOH1BZ3W4Yl1q0al2DotW1dtRs3ujYgr+f1erHTVcC+aggyHZwJBsojMwqDqM6RVFZHGh9DM10sEtRK1QeZJgHl0bj2grdNhSCfc4wia+dqEoC6hDuTaj8xCdrUrWUCt0kat1FGhFKM9SnWmxmqIH06R9u5i3CAS7IwhcyVYqqcaPQ91nyCZ1FavqbGa4ok4BhaiHLLvji37lmmKsiPdpzvK1Fj1UAbixmTLpac/SF7NJS+Ovl1anmffSsG1ZzNfjBSNybMNCoPxj98wCmuZhxqahpqZhSpxjkIkRbfPksVnbe4Vk7u63t1yv44TN+qGXbnlqirdyTn/rylKU47EdQiqwpm4lSMxuT4KQukw/O3T4EfjJI0C33lg0gr7qKpelZO2FfAmsVBzI4IiOT3MJexilXra1D+MKakPPc26ruksUikITfHi0in2vqiPUedh2wKlb7pLOHIK0vaIbEvwaYhx3DeO9iMS7dQ66+xEbQV8s+gtyY1qR0n0Mbzkc30A6nHfPkatHxbT+2RdUENet+2GCogF7QYLCmm9wiYU8T1irt/RbGVbv2DCE6rnEZW+rMdh0buvx1FBnOyXjmatR4y/MfoeM7vse8RWYdI1t1xpkW5pdKlIaF/mtpbkcEvAC8eY12s6T54Vm2JZnMOF9hTmDMjc22w3KTb82QAXFKjDx/n23Wz+3iVbGDjP756V6ZqBXWbr6VUyT5fbrFJSXxZs2kQFWbp2WRWDgbSnwQjpmiMFHt98XKFJcgcmAz9l4OFjHnfoOv74j/KB3T4EBMiJdkt74dhXOV/zyMkrEZOd8nDIs4pa9qrPIyal74iAPVkKZu7C6/WDqIyBe1QkPFPdyM5yK5+tMi3qRiYiU+ItduvBk/P0IBB4Du/2k9UqK+E4onyq1O5sykw4sDBSzlab3VVNN79Pf6DafwJvZ/3XIBqhonfGeFu9GiWLV9Lb6ubHvzbD3vz4/7UaXrGGV7JhLGI/eQUvgowHLbFuoud3J6yniN+XLlQ+nFfgw5V84mB4caUx+MpEwOz4+S3KXTZL2DFaXvCQFxl6KAOnZLiuPdGqKDeLfLvSoS/WZ/UA5Ice8vZ4YWZoN+a4MSfP4Glx2sokQGgsRgbbRZbOx3wxj+A4JANIYwAu95HzLAjc8lel3P75qHw9NU83SawudiYC81Ge4mGUH17tWXg7KOgNDU5YYhwb51m5anV6PcqCkZ4V1gTJJ76pOY7bUACehaV/K1kdNWP4Aprggj9xhjOoYnfcQmcY0349L9jc8XWGgUaBmkqoGMu4yiSZIRbPRAmIDHzsE92pHMNtAbMJin8K4XcAXbY1LofozjAtAViRoXFSj4a8wHAZKOpHbVObX/vmhc9zI0ecyGa//TX6fu4xevTxFXysunn1Fc9jjLT72kBp/c15fDVEdS/kBaFaUyDSbhfWgAeq4kXs7hfRK076DAz1Gwbsc8Q+5gAxd3EJrEERIaIK1VCU31N1R/gsSBYKzcYH599Echsug4Nswo2v3Fpz7EAz4DvoDaQnE9zbbEsfDBPjQMwyZ6TCaO2VJy9GxFvlyl8pXMkSeFz/OH+lJTSjgqzHUIgUKkrQWIuwWZ6mI8m3hZIfWIfZfsqkj7MrkemjWK0YPIq8Ek5eNYQM6rhHhIyv/7KBkBEOGAzwHRw9mNblOdWMLZg0II4W5JNUfe3VvajpmKL68JA+X/RFbLwLDmqPLR16auPUiQ+rK4Bxb4maq22+DuNSVW8d8CKf7Njre31OpG+G2xZqMTXZHlIGso5KWaxg4KdCgq0rDmLRibJnWyc3NoVp51uHaq1Y3/hotW0mP/5mUGVuiZr8WQaGSMzIqra+iNdEyJNDihsaRtZPGiTgTazln6LLheoI/7DxNUES6UIkBrGhFr9ZC3Nq7tRiAiMzRD5DmMlnckh5EvH2fSjvMsb9hScWIXiKD+DHMWhDX4a6dWmhotRxX9x9CqKrJtN0m2058ZuXEfvym/+irq8FEil2xcZ5WtUmd/M04V4Ev7LKrYlgLDa60irjKmwb/eoRzVxdpHjejVfZagIZj1ab0g4Ze1zmqwxgZEhwkYn3dAhCzAZVbHu6PwP1B8NDsR5ny3zFQBmcbD8AJSIkOBlD2pdsJhcbHnc40udRkq6FtQkaRhV8k3kELHxybm0hla8Z1LoTULzm83nyyVjIaUOEBhxwJqPLrOxU1tYPjfgOu42PXY68BidACRNBJ4I0PhED3Jf7+w/W/kLVnFf2rrwSOice//k+VwPjlUMw4n6dLJjw+h3w4OLaLKUwY/8ZiT58V4RyS8IswBBg4yVbwJ8VDLdPHWw6m3YQVxbr03ngqVMandA4V6its+ZsYt0tcRkliGslN0p+xF3g7LnY8xap/5yEezzP3sEzIaqrQfItT+R3lYG8u824OnFXJGdskDWW9rUgr9L9WXYRlCTNEylbbYltbkeR1iF/PF+h2HIubprkgH+LxK5hSK9ZAZsjWOrc6uourNjMCaecsGDaEt9O3huEtyriwuq9TnLxrQh8duA8UnxUJ/pxVGRV+wIAhrelDhYDUTuUWrr+xnqZ9MIoCaThaYgHnfiN0BdijlwDI54CtqJPMOlsFcxufhpxkmYgz70WVqmSZIhb4X6PhziZaQLqdDRviXsu+IV5P5m9JuJXtDiDah01jmS9s8J1CyDHqaOCdnPMjYKV5O6ydX0tCEQtZDqxRjxI6MFqeU+7mjfuEm6V+7pfZZPUEUO60pdyxWwHwpo9zTbLfMeLW9SGwo7EgXjOo15ACZU+e+W++exX02ABDZg8//Xf8Wp9NTVhsoNDflzq50L/K1cxTmpheE5LlJx9oWjRlGCTNNaGTE5UjGRZ7NczRnTGExxjBYUAOLippd5E3cHniWJGEVJ8BQ4hrwhP55oqTORLLrbgXdb2g/wiG3PfEEBIMsA5PSUjgPcme2UmiyF72rVErQhiC+CW4qtuWBuJ7ibHR/Peii0iokhbIl7rwF04Xjf2RXpbbg8WeI9lvqijD/3qHyMpjbolM5LbFEppdMDLWdQ0tIyaxwCwXqBlqIVndX+hK8sJIal8ylq5CgLRRqoeKcGCqkUH0zogPR8kDd8Ck7qR0BR6nHiQQSCG1VqYWD25OLtbp4efc9c2fwMGws+rnoPVS9fdq4VRFyH19tcR1rpssHouhRhMiydTjQXoR9qkTQK5HoI18M70MZ7nwtPDoJ7Bp/8hhYHmNgYGd5/bGLdDcEiUG9zCkO2jOWpJKbcEcXvf/gZqx3YTRBXy7Yas0ujcxqAO+76dOSwR4Ham0FfHrYwurY2/R7EUqNcScFeOt7urZTaG18nJB1Aj4vcm5iIysIf08YmydQWsZBHLmNSvSiDkqwnFkgqQllePuBnXVbD+MPSUtdP8/NBNy/LDIfJV/uGpp1/W88WKZvxw6GTe9vuDUyPHpFr7ih0xNpp2FXjM5KfFY+N96tjTq6dnL7PHI7sgkjDZ8hez2V4uJqBN1ivkwTGLH2ohWPiYqt70kjIoLSmrrIkXLBoAO2uKYr/ydc0aPivg3+/J7irnU3AKaa7jA8I0EzZkZMR4JEptomqULYpweW9IRvUiW0gbc8DtXKO27qmCXhNY4FiNmEyGxll0Cslx8ykkrOXxKKx/YUWkWFXfdIE5PjntK6pC7p4V0ie/MlcXgWe31E2LWJXKYIJugQT9BBGQdO1g0InSiBIygcro5ohkY8eEO16XgI4qt0sdeiKQYFm4o5ggiok2RQeVmKYaRUOrqFblbp0GKprU0MSPpXe9Y9YitgMXHq1HSEz6YULndOdj74c18Gfdqjw/0g8ZPfwKlSugQqO4qseR8NiCP5p/8F6yGI6LDdLqVO7DD13Hapqe1V6FPBKpLaMcHU+FE+B5idTM5CJ5+Az7QxvDQxJWvPKtlL587tfljjlIGpQ2aww4ccKCq+jAv+lD6QBfVYjYrqbWs2RAV+IM3+KmR7PCc7pXc/zYAgyqKteOtkwpjbbbrMWfRphrg7dOWBMCMy+snC7T8lnxMitDxfi6YrMB8kCUlpYhuFCzyzd4PImGVy5gjB6LfQOtAp8GCA7zDgFTG/jT0juF2gm5bPEJfp00lvR13lQzxty+Lrfvlyn/G54VIjQLHetB3P2mQtxz5OtwdJYphKiqZIqZ1MKSlJ3JWI3M76P6mCQ1y4P9nnhl/S/J5doT9M3XP7358hefugfl1DjWR0ty/oH5fTuY33FdKQBxDVdlIZuMhbqCXHK3Bddd7iQq3OPjPnmBXSs7HnnRfSvqb7UsL0v68ZCMSm1EsuXOCfpN2jXcv6dg/+0fTuzvzom1pvlmD69o29e1wejQK7atGtz1A76ltWObZC+y8koJHFjlV0I0VnXINyOuJuJERHBoeaHH4sujF3bb+7gVnDKF0Oe1nKiDuu7kZb4TsYPQZL/Ltm8ARN+dJF9o20LZ0u0two0tbSNSzA3ZZJUx0YpAJrJOaXMyqXKWrfJQ1CQq+MOrWiH4r3QQvnOoXKGcCd7rXT6/CknmIqECAP/GNileSnW5F4P1OkX0ZgL3NygxB4/278yNS6l6o0LOUDhbV/k42zQtjiMoVJ37zg1k+Z2SDKNHIyQU1gxSMULgtyZp1BaFl8vCnI3W0kaS1hH9td4Pp7XICQsR/ZJVKcjKYhJuoFx83eFzn5QmfYQREkPCcS3BLXxjlVKRXQtoIQ/AZW+u2+gGNLbl0PgnHSj8hG9h289r5QU/TBY/pAMPsGSHbU9mKwM2KJJY9PHlVZQXQ26n2g4dJtSIdRE2qSp+TZmf2oh7NTClDFgHfSDroLaDtQjDnQz5u6YG0cvKd7dwmV3zBK7tD/v9b49LgS6B/f+3dy25bcNAdJ9TaGkDRpBus+wVCmtXBA1iQAUCJGBTw9Eqy56zJ4n4kTQUSc2HpGMgWdsaieRw+ObDNzS7o0FF029BiT6Om3tPpe0FnqNpoIxBEOC987/RHWMjLLo2zsad/hHy3R6noi3i0eon4CH7zREk8rMdreRNMrsLzJzGb/uv7oXLOgj6fd5GclJaVEqLS+n0pu73DgT1rbv0hIRv6pwesySezu+3jPNGH4/jg+2igJH6NNwH9skff+9fXp8P14Nyu71BAyZ2KK0+Awfd6nZNct/uxrqBxM9N1/+kx8A/BppmBrgYsP6s8JYal1RrVRtkxIsvbg0EUGYF//97a2gogjanu4tKgAD7xVniCVwsIIONYvbp279UACH4GBqKmJtCpcsT4yFQvv3xA6FrVoYc/9zgtZzAWBBq6hRa1bmMViHbOz55Zo3E4WOqtbqVRN50TJkXfwLxZU7PxTES791+Xm+4uKJB05+TehRUbIP+vgqNo98YBoTEleqk5hllYl7ZJ+QtTFPIrUlZiGbc8CoEjB54e2AEK/hP2YXYdPovaoX9I1iXZSdhhTCBKGTK5gJi2xk4nwTkT6LiON65m1t17GA9rDymW8t4PfFGWLQsMp5F9T3E2Qy9N6bRHZOWqMVcCc7pHM5KEACj5MMTvYFlBSR+V/LsMpJ52GkstfhYHEtZ82SKSa4aIuC5mUYkWltj0QAkyW96LrB1HIC9tHIybynSdT1wnL7poZIcp3BMBB8qfEhEzaOoygJx59jpXWYQxiHdHQbc5ukMeh/gy9u6KG+LpDjQp57cKxo1ksPKelnsMYJamrLQNVGlBI4CDiglneg+Og6nGHcKrUVXkik21tytVx4+zWMKo7hOoSHneVFR6jDyhJt3WTN4Esw0heNLcuvw++/4rcM173MiCKtKEYaRhDG85ftxkNaqnoc1DIJZvhWSQZ2YfVqv9fJB6iYElFREAl9NASPw/zj9ovKZolC8MYFUJVw1Z9hSuKMcVl0FDTHIlqBUK5L+XUhNZYK1GWOhCGP3iJngCFLmJ4UXQgD8IOfzJ8jay1ToaRD1+OuZFWn4BKnQrzQoWQtTmcvh9VpQJ1RMoyO228jhNJx4D4eHKJ/fcLbPPXFNI5DoTfGRh8CmUHR3D0sKY4N/p2Hah1epl9czMfcReUiK0vjVfMsC7peXWIp8LxnMrSB7CuMWWMXUxZ6Cnw13dyWx+sgqTcQ3wuhacm16M48QrtwUY6ViFaRCt6C89LxNQsVJFaUX3OV1pp8Vyqq2i8oOIx29uHoHl8j9WA=="}, "NewAdmitted.lean": {"data": "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"}, "NewAudits.lean": {"data": "eNq11MFuwjAMBuA7T4HEve8wocGRTeMemWA6T47T2Um17umhiJ2Guqkk1xw+O79lrzolSUv4ohhsuYe8xkTNFiXbTrB5zXBUSORfSPx7s+V4AG4sZvXo4HQiQWfoE0Uxd4GwVWAe1hwNj4vVHFyiBmD6hhF1nSIFaOtWebvZ+7gh5Aqia1FDBZbkY3zpsYKtaEnJpxJT/DW8cXRZS7Z9E58/M/WVWNcDF6A3Wa72NeYnbku1fNd10HU8zNPhYJFzwnIRT4nz051UfcTLmfKEkirojy3JJE3SoxpWiuVHL7jldeL/u8TDQf1ji8p+434NG0JYnAFX3OYV"}, "NewComplete.lean": {"data": "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"}, "NewNative.lean": {"data": "eNrtW89u20Yav+spvltEwJmiVwNGt0iTwNi08a4tXQKDGNNDcdYkR5mhZEtBgKYFFttbgT5ALj3soucWKPa2D9B3qJ6k3wz/U6Q0lJTExSZBDEuc+f7/+c03TEwjpqbUY3BBZ49YwslTFs/U85iRv83otaQJ98547AXkaSiuaDgQUxbDI5qwiZCLi4Dhz8ZH8oxHPFHweThhV5Jy7ykTEUtw3YWYilBMuEfDc81zEIvYE9F0ltCrkIFiXsJFPFAsccVU/wpX1Lu5pfKacPUF8x+/JBKlxWUXksYotmSxtwCfhopVd4U8TpgkKlmEjAR0zk6fseQ0Wzenkht2r27gGC4WUwaz1/DiCWfhNdxcDkKB4gGPVUJjNMuQwhWuu3Hwx6k6RcITic+H3kzOGeBDfHAC5pPLy+f4wJZSLGREQ76kWvZzMZNeSVeZjz0IrxmdnKonPOYJazAqWNS+RU7Zas1nELIoorkQ1Pd5zNzMS8rlmUjh4lEoFLsu5RgA/hmO8fdO5chzjCPlwDAYG3N8bojrL2HswIuvRMyiabKA8SUcG3KlxQp+v/3QRf5IE0Hdrha4l06n4aJlPxG+ayyZ6x7RO47UcAuqJgWcgQvBGX4MWQJ3KOaZ5BE71/EnZ5EF+9Xbf58dITGfydPMWau3/0GCOiYr7sVH4U3FyYWG2qBoIeJLEWm+cOdUdrerxF7O+Dz1AFWnStQIEMPqSzpFSg7B3Iv+zuMJ5i8uvBD698fZdnZHvWQTCxiWBDUbF0luoJjFUj3appKhxSc9gmqkg6rMvTKMRs0wGlXDaLRjGK2lDKze/Pd/v/7+8xtNP48wHR9rmVToFudC6O2jwrS2WaV3uVpBklME1xkMPnn4ELDegicYUvA4ixOI0K+4X0CCD5DHDKuEP4sNZfBNgRO+eZgyJ/Dwk8E18+uSn2eiXIi0Jpblpcv6LXZGoxbrjrStVm9/2VANcilTjscnSKOlXBFMZRjB6rufDI+/nHsBixiZMBmhsDUS3VXVNXvb6Nd8O7TyptMa1w0LulpAy0BuMeVG5xgp4CTXqUKwzSrGdnWCtQW6MBgx1x3QXJcqlRqBqEUUWVmCx//Q38zZ7ubIBSGnJa3tJiqTVd7Ci63euizSdLjVWg4JREQKzXQNnKZKbXFHxRqWgYToJ5FcS9W03tjCfrWuOgxwxxjj4UdjnEEzfDDgVcCoT3RRGTYQHir83H/2GAKHiGmRjxahOoYTm3jOfaV4NAURY/ve7rIjWP3z+wKKEqqU8LQbPRFPJHxaOrRNSU1AWxcrLf4ddCOsrkBNDZihr/Xqt0+P0anYWQzT4EtExrm/4C0Z1qnFHvW7PSkbwrdihLXOqPviTLJDI4NQHxF6dPFyh713arv626cOYHI77BxbWdLu4eYC/vSy3C5228tqKWBG051jclB5IW6ZXFO7tMZe1uxhPA2laSqkbqjs5QOQfljKmylAKofFQwudpqo+KpRylOcQl/u+Q7AEt3qqsi7FZcGoejrpjfTT0h+MKjT8ertUTyQ1n/WxwkXr8Wpad1p+YAP3Gvga0mObm1fSEnDr+QNHMI0CG94Zls6nFwoo5qTG2LmC4GWJirT4NYO/ul9tBt5ZYj9OT1n/l1Vu94Beffft6pvvXzQT5TLLFL5ePD8Wv3tY/E5sUUClajRHFtkSko4rWlXeT2Fbdd2N4L6a7u5cTwQPlPLpdoWrdlazOBlsL1S5I0A5RGuRn0n3O6Uf6pwO6mPG/nkytsbmwyZvuvZQbQPjsEQSjQndw3RCx5WIhJwGXEWQ3XYoYHMmFzngqI78JCKhdjRRyzQMrj5wYgNw2LGhV5nUI2tLw961H+8kp2TGwK82TX30rNvw75x1wy1PAiO+XjJLmHqgJfrMhdfF3YIsov8LpP6M3+i5UTyRLmoFw0claS2jy+4SjcVJPljaPm2sDOYcZNbWf1oDxE1vS3YIk+FdY1Ej8FuGme0hmtaHu+akqHVQeacNq6tQM6maoByBd5xwf9GFzM33RvgHCsRtNi4vMoteKRGiJ98nRO8HuD8gYu5M7T9Nx20b9W4EOQ5J9A10SzZuiOk0HfVAtdHv8vTcFGX3FhluTI0uUGhTX3k8L0HgvijycDiyvEnwAhpPWE9ddkHSRo/Oe4tmlFxahVMVRBw2rGQaVrUikUeLXbB05z1Ip4ihEiR2gWMr4NbdsWQ2yLYSOsUDutmX7XajA3rf5bTbv/UFCkPJ8u7nvdaCMQTjPBG6kV317ql0ZccdVGuwFOkbiVhA4Jh7KuU0ilCv0tVyJ7WtXrddP+0C9ywslV9gDQ5hrJzIhMUMQ/RM8DjprrJYZh1zrrEIeqyDTCr2DprZElftk+zH9+eVgjw/LOuOBhWwLOsiWODmZS2kzQE+mOvPWyFI5fTeX8asjeWwiJjDhqsfpueOS6AJClK8tGXZWusX8BkTfRsczCsX+XsftJr8Xb0D2WdZYGxafxfCKhfuVyNYjvZLpIzKeCuV8XYqgU7q5SgDQcuxMXD7RPKdd4+SUr+YHzk9+o1uj/nGceMFRtvd1TxId57PrpLFlBEM7iw37IBJqspY90CMreAIOvP2KH9voOMxBMtL+xn4h4Gmew64esD69wpvbeeSctNbG9aId7tz3wUCOIwHV//6GuxQhJ1Nj+7VBUilfvVxcQEuGpAhnWIuC/CwNt6xBRA7CGOHIorGH3S/ntg+Au1ff+qD0E1Vxnr+Odz+LmelWFi8Uye3vtXZnFZtSe924xkf7Tw+tq1Wx7tM3vRMud/8qTJfZvG1/mf732T+ALOnneY="}, "NewTests.lean": {"data": "eNqtWMuO3EQU3fdX3KVNEmtmliMNIgwJGikhgUlbCARWtae6bWJXOWV71N0rsoNs8wFhAQIktiwQu3wA/0B/CbeqbLcf1W7bzCxannLVfZx76tR1zR48gIym2Tl8npMbQbLQfx4yP3A+jfiCRI5856XUz0LO0hf8cUijG8/P02RG1yROIgrWHM7B8nNxi88n+PzShhPbeZZQltrw9Wec0TjJNjD/BiyBr/952558H+a2DeczwD/GRUyicEukw+um3/0KmIOAi+bkxzlTs9XUpyTBWSfKJIDVDW9FRYxm62ukUQzjAhd9gi+ehC+p43O2Et4yZ2Bd8jj+ImSrS5I5AY89us68cLl04gSsvqg96UoGo7IUs9kkxAMizjzG2ZYKbob+FJ+/espv4MyGUyP+Co1WDRqrdCGsQE4RsPvxJ0RqUF0aVlRx1GIEExYbXI8B+xlIGAO4+BDQQT9kIftOjmCAp8qeFTiZICwFKyaJJzEAz3bSTRzb9jRABQ6K0M/2WBJYaHYgqu4eVxw2k3n/j1sgG+AqFzP/GWFs4YxWBrNcBuJWnFX+Eww3oATJhry2kIF0xcXmRUDxV5Lx2fLJIwhshyeSwhcF7Y96kYW6e76X0BYuXAxsOO95Lnx6GfE0F1TpjNo+A8XGCuTrq/ThchkyKgdlJbpbINWlaWahPNdFqfFabeDd67/f//Xvn69rlTRDUSTw6FUe3jZUCwNMbeeWRFWRPrr2AxpToyD1R2iDV9hoh9EOtvXaQzqFMVlRKSgaGS1PkGo6HM3JkxmcVBlNqq1SNJ9TrJUfUpaNUbWhhT6qdbqIEc2upFZZo1TOltvCyfjDaEUXghze2E02tLUSU7Fa5TuVqZIk0SdSyRSi/cijrSenPSVChjIhSFS471t0gGkt8Jd1ctqldhwnS63IhZ5jzpMEoUzJoxHuGXZAvY3afZwyo8igtM3EgN0P38MWPR1EvzgKzJCriBs435+qE9LUYYWQ8Y9SCJ3w3twA4dP6H8z1SQ1bpDJslfgNJE7IbqlIqVKb0tgw2iwlLkVZ9DFyVGnutnVtFAgD6R4FY5rSQSd6szvuQmwMqbE5taKLKRArNS/q9f/607VcM0GOTOfxgSp0hFzxc13B3GPkKuWdQDBtXDwUcOVLy+B6AtJE6ZfalxrlERpoULsyRufjsGy5h0Co1QDF7tcCsvd/7E1d56KyZRWnFljPebRhPA4xqy/hWziDe1AbukSTH0Bjzr1KbBrzFrZqoIovtd2734bH6yzKJLWqviox95rqhxWI8lQ+MY5H0D4dNLN79/uwqpFFyqM8azaz41VoWqtj0qcyoCFNqtVtKId2JHXXQ5qR+nwDDOamoy8Xg6QN7zc6VSuE7VDfcXe9am/TYGrZzF6Nqjj+I6Npteojuo3quC5C6Z5dXcv0U7LbKdc6iYpa/ZdALSO19qOXQvXOo2pZt9MoxNFURJJRNw1m0liB2x51NZgHbyaatxIF0+aD+tNaVE1SFVbco1bcPisYmaT8dq4/h2HrFrJu+q6udcf1u5C9vhy4E7G6ba+yoGkZc8bl7YTDa5b6Sdnuaed7Kh5f6ELglgvdESzs3qhgCPiL7qWhYCIxFUc8jjTy6BpPvBt6YyDpuTzbK0ZZuze/mClb3vUJ5ITg8mBey7OyvPxbI+zoSmSb2X9MM2jB"}, "Sketch.lean": {"data": "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"}, "compilation-summary.json": {"data": "eNqFlE1v2zAMhu/9FUauWwN9UKSU3VYMOwwbhrXAzpREtUJdp4idrkDR/z45bdJt/djxJenX0vvQvjvqusXAU72Rxaq7a6rpqV7NamGUwWOtjpU902qlzApoCRiMx3eqabV4/zA/rrebtHvi285p2QsPh+YFG4dzEzDn4LQlHTxbbbKgKkWiDVknbZzWXsDoYDSLCdAmIxUlApxKJkt7R77h2nPs5XP92HwJHutyW6em1aPs6yBj02DIHyb46rrfVXWgvd0212kuWbd3+sWboQ7n4x9unK/qONb18PN5b5S0HvJcWagVwJLM/qjXwpc/Tk+/PBy03dFYfGzlyufDepxqGk8PEXkAZIghMzlLTtBHCsaWJEGYCzmWokx2OSEX8C0sq8mogkSKLahF876fX7AYL2VKF/9l6lfWLqnV9KtMT3dOrzDFIEEpYZ8RAwaLkLIu2VEQDypRJsTomYwFYxUlcBCjypkcNqJGvcZUv83UeP0CU6PxX6ZGPUcKAd+A+tT9C2uLSesXsaJv10b1FtagA5fgvMuuBcBBFWdtQxk5G7ReSWaJlGbmgkxaSGEpQRPP2YJ/wlq2fX/Cw3qoifsnuml9dV17ya1SuB/lGcTDM69yLMQWI3uTG1NGA20FsfEUp037CIvXbAs4o7RKnnVpQyk5juw8FNw7boTH9TA7frrlNHVfebroa+yu69DVsTtgXnbfNzKmTY2SuzPenshUu0JBAc1rnQq0g3kNOQakFLUDIS42q2QxdLyZamn2zXAjHcdRhulD13al5T6cH/zitva5S8V6REPS8kS23lDS7Ip4BcGHkgMw5LY6Xa7tb7QZl7u0j+6PfgPn9Vkw"}, "native.diag": {"data": "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"}, "sketch.diag": {"data": "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"}}
END ARCHIVED AFFINE ABSOLUTE CLOSURE PAYLOAD -/
