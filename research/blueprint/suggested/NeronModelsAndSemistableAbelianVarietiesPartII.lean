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
import TauCeti.AlgebraicGeometry.Modules.RationalFunctions
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

/- BEGIN NATIVE NORMALIZATION SECTION BRIDGE -/
/-! Native absolute-normalization section bridge for the specified quadratic curve.
General rational-function section equivalences are imported from pinned Tau Ceti. -/
namespace TauCeti.GenusOne.QuadraticPinch.Global
open CategoryTheory CategoryTheory.Limits AlgebraicGeometry TopologicalSpace
noncomputable section
set_option backward.isDefEq.respectTransparency false
set_option linter.style.haveILetI false
variable {k : Type u} [Field k]
local instance (a b : k) : IsIntegral (curve a b) := curve_isIntegral a b
local instance (a b : k) : IsIntegral (normalizationSource a b) := source_isIntegral a b
local instance (a b : k) : IsAffineHom
    ((curve a b).fromSpecStalk (genericPoint (curve a b))) := genericPointMorphism_isAffine a b
local instance (a b : k) (U : (curve a b).Opens) :
    Algebra Γ(curve a b, U)
      Γ(Spec (curve a b).functionField,
        (curve a b).fromSpecStalk (genericPoint (curve a b)) ⁻¹ᵁ U) :=
  (((curve a b).fromSpecStalk (genericPoint (curve a b))).app U).hom.toAlgebra
local instance (a b : k) (U : (curve a b).Opens) :
    Algebra Γ(curve a b, U)
      Γ(((curve a b).fromSpecStalk (genericPoint (curve a b))).normalization,
        ((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization ⁻¹ᵁ U) :=
  (((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization.app U).hom.toAlgebra
local instance (a b : k) (U : (curve a b).Opens) :
    Algebra Γ(curve a b, U) Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U) :=
  ((normalization a b).app U).hom.toAlgebra

def normalizationGenericSectionsAlgEquiv (a b : k)
    (U : (curve a b).Opens) [Nonempty U] :
    Γ(Spec (curve a b).functionField,
        (curve a b).fromSpecStalk (genericPoint (curve a b)) ⁻¹ᵁ U) ≃ₐ[Γ(curve a b, U)]
      (curve a b).functionField := by
  sorry

lemma normalizationGenericSectionsAlgEquiv_coefficient (a b : k)
    (U : (curve a b).Opens) [Nonempty U] (r : Γ(curve a b, U)) :
    normalizationGenericSectionsAlgEquiv a b U
      (((curve a b).fromSpecStalk (genericPoint (curve a b))).app U r) =
      (curve a b).germToFunctionField U r := by
  sorry

lemma normalizationGenericSectionsAlgEquiv_restrict (a b : k)
    (U V : (curve a b).Opens) [Nonempty U] [Nonempty V] (h : V ≤ U)
    (s : Γ(Spec (curve a b).functionField,
      (curve a b).fromSpecStalk (genericPoint (curve a b)) ⁻¹ᵁ U)) :
    normalizationGenericSectionsAlgEquiv a b V
      ((Spec (curve a b).functionField).presheaf.map
        (homOfLE (((curve a b).fromSpecStalk
          (genericPoint (curve a b))).preimage_mono h)).op s) =
      normalizationGenericSectionsAlgEquiv a b U s := by
  sorry

lemma normalizationGenericSectionsAlgEquiv_inverse_coefficient (a b : k)
    (U : (curve a b).Opens) [Nonempty U] (r : Γ(curve a b, U)) :
    (normalizationGenericSectionsAlgEquiv a b U).symm
      ((curve a b).germToFunctionField U r) =
      ((curve a b).fromSpecStalk (genericPoint (curve a b))).app U r := by
  sorry

def absoluteNormalizationSectionsClosureEquiv (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U] :
    Γ(((curve a b).fromSpecStalk (genericPoint (curve a b))).normalization,
        ((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization ⁻¹ᵁ U)
      ≃ₐ[Γ(curve a b, U)] integralClosure Γ(curve a b, U) (curve a b).functionField := by
  sorry

lemma absoluteNormalizationSectionsClosureEquiv_coefficient (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U] (r : Γ(curve a b, U)) :
    absoluteNormalizationSectionsClosureEquiv a b U hU
      (((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization.app U r) =
      algebraMap Γ(curve a b, U)
        (integralClosure Γ(curve a b, U) (curve a b).functionField) r := by
  sorry

lemma absoluteNormalizationSectionsClosureEquiv_val (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U]
    (s : Γ(((curve a b).fromSpecStalk (genericPoint (curve a b))).normalization,
      ((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization ⁻¹ᵁ U)) :
    (absoluteNormalizationSectionsClosureEquiv a b U hU s).val =
      normalizationGenericSectionsAlgEquiv a b U
        (((((curve a b).fromSpecStalk (genericPoint (curve a b))).normalizationObjIso hU).hom s).val) := by
  sorry

lemma absoluteNormalizationSectionsClosureEquiv_inverse_val (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U]
    (z : integralClosure Γ(curve a b, U) (curve a b).functionField) :
    normalizationGenericSectionsAlgEquiv a b U
      (((((curve a b).fromSpecStalk (genericPoint (curve a b))).normalizationObjIso hU).hom
        ((absoluteNormalizationSectionsClosureEquiv a b U hU).symm z)).val) = z.val := by
  sorry

def absoluteNormalizationSourceSectionsEquiv (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U] :
    Γ(((curve a b).fromSpecStalk (genericPoint (curve a b))).normalization,
        ((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization ⁻¹ᵁ U)
      ≃ₐ[Γ(curve a b, U)] Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U) := by
  sorry

lemma absoluteNormalizationSourceSectionsEquiv_coefficient (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U] (r : Γ(curve a b, U)) :
    absoluteNormalizationSourceSectionsEquiv a b U hU
      (((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization.app U r) =
      (normalization a b).app U r := by
  sorry

lemma absoluteNormalizationSourceSectionsEquiv_closure (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U]
    (s : Γ(((curve a b).fromSpecStalk (genericPoint (curve a b))).normalization,
      ((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization ⁻¹ᵁ U)) :
    absoluteSectionsClosureEquiv a b U hU
      (absoluteNormalizationSourceSectionsEquiv a b U hU s) =
      absoluteNormalizationSectionsClosureEquiv a b U hU s := by
  sorry

lemma absoluteNormalizationSourceSectionsEquiv_inverse_closure (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U]
    (s : Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U)) :
    absoluteNormalizationSectionsClosureEquiv a b U hU
      ((absoluteNormalizationSourceSectionsEquiv a b U hU).symm s) =
      absoluteSectionsClosureEquiv a b U hU s := by
  sorry

-- test: QuadraticPinch.Global.test_genericSections_cusp_coefficient
example (U : (curve (0 : k) 0).Opens) [Nonempty U] (r : Γ(curve (0 : k) 0, U)) :
    normalizationGenericSectionsAlgEquiv (0 : k) 0 U
      (((curve (0 : k) 0).fromSpecStalk (genericPoint (curve (0 : k) 0))).app U r) =
      (curve (0 : k) 0).germToFunctionField U r := by
  sorry

-- test: QuadraticPinch.Global.test_genericSections_char2_restriction
example (U V : (curve (1 : ZMod 2) 1).Opens) [Nonempty U] [Nonempty V] (h : V ≤ U)
    (s : Γ(Spec (curve (1 : ZMod 2) 1).functionField,
      (curve (1 : ZMod 2) 1).fromSpecStalk (genericPoint (curve (1 : ZMod 2) 1)) ⁻¹ᵁ U)) :
    normalizationGenericSectionsAlgEquiv (1 : ZMod 2) 1 V
      ((Spec (curve (1 : ZMod 2) 1).functionField).presheaf.map
        (homOfLE (((curve (1 : ZMod 2) 1).fromSpecStalk
          (genericPoint (curve (1 : ZMod 2) 1))).preimage_mono h)).op s) =
      normalizationGenericSectionsAlgEquiv (1 : ZMod 2) 1 U s := by
  sorry

-- test: QuadraticPinch.Global.test_genericSections_empty_excluded
example (a b : k) : ¬ Nonempty (⊥ : (curve a b).Opens) := by
  sorry

-- test: QuadraticPinch.Global.test_nativeClosure_cusp_coefficient
example (U : (curve (0 : k) 0).Opens) (hU : IsAffineOpen U) [Nonempty U]
    (r : Γ(curve (0 : k) 0, U)) :
    absoluteNormalizationSectionsClosureEquiv (0 : k) 0 U hU
      (((curve (0 : k) 0).fromSpecStalk
        (genericPoint (curve (0 : k) 0))).fromNormalization.app U r) =
      algebraMap Γ(curve (0 : k) 0, U)
        (integralClosure Γ(curve (0 : k) 0, U) (curve (0 : k) 0).functionField) r := by
  sorry

-- test: QuadraticPinch.Global.test_nativeClosure_char2_integral_element
example (U : (curve (1 : ZMod 2) 1).Opens) (hU : IsAffineOpen U) [Nonempty U]
    (z : integralClosure Γ(curve (1 : ZMod 2) 1, U) (curve (1 : ZMod 2) 1).functionField) :
    normalizationGenericSectionsAlgEquiv (1 : ZMod 2) 1 U
      (((((curve (1 : ZMod 2) 1).fromSpecStalk
        (genericPoint (curve (1 : ZMod 2) 1))).normalizationObjIso hU).hom
        ((absoluteNormalizationSectionsClosureEquiv (1 : ZMod 2) 1 U hU).symm z)).val) =
      z.val := by
  sorry

-- test: QuadraticPinch.Global.test_nativeClosure_affine_inclusion_nonexample
example (a b : k) (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U] :
    Function.Bijective (absoluteNormalizationSectionsClosureEquiv a b U hU) ∧
      ¬ Function.Surjective ((algebra (Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X +
        Polynomial.C b)).val) := by
  sorry

-- test: QuadraticPinch.Global.test_normalizationSource_cusp_coefficient
example (U : (curve (0 : k) 0).Opens) (hU : IsAffineOpen U) [Nonempty U]
    (r : Γ(curve (0 : k) 0, U)) :
    absoluteNormalizationSourceSectionsEquiv (0 : k) 0 U hU
      (((curve (0 : k) 0).fromSpecStalk
        (genericPoint (curve (0 : k) 0))).fromNormalization.app U r) =
      (normalization 0 0).app U r := by
  sorry

-- test: QuadraticPinch.Global.test_normalizationSource_char2_closure
example (U : (curve (1 : ZMod 2) 1).Opens) (hU : IsAffineOpen U) [Nonempty U]
    (s : Γ(normalizationSource (1 : ZMod 2) 1, normalization 1 1 ⁻¹ᵁ U)) :
    absoluteNormalizationSectionsClosureEquiv (1 : ZMod 2) 1 U hU
      ((absoluteNormalizationSourceSectionsEquiv (1 : ZMod 2) 1 U hU).symm s) =
      absoluteSectionsClosureEquiv (1 : ZMod 2) 1 U hU s := by
  sorry

-- test: QuadraticPinch.Global.test_normalizationSource_affine_inclusion_nonexample
example (a b : k) (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U] :
    Function.Bijective (absoluteNormalizationSourceSectionsEquiv a b U hU) ∧
      ¬ Function.Surjective ((algebra (Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X +
        Polynomial.C b)).val) := by
  sorry

end
end TauCeti.GenusOne.QuadraticPinch.Global

/- END NATIVE NORMALIZATION SECTION BRIDGE -/

/-! Actual native-normalization restriction and scheme comparison. -/
namespace TauCeti.GenusOne.QuadraticPinch.Global
open CategoryTheory CategoryTheory.Limits AlgebraicGeometry TopologicalSpace
noncomputable section
set_option backward.isDefEq.respectTransparency false
set_option linter.style.haveILetI false
variable {k : Type u} [Field k]
local instance (a b : k) : IsIntegral (curve a b) := curve_isIntegral a b
local instance (a b : k) : IsIntegral (normalizationSource a b) := source_isIntegral a b
local instance (a b : k) : IsAffineHom
    ((curve a b).fromSpecStalk (genericPoint (curve a b))) := genericPointMorphism_isAffine a b
local instance (a b : k) (U : (curve a b).Opens) :
    Algebra Γ(curve a b, U)
      Γ(Spec (curve a b).functionField,
        (curve a b).fromSpecStalk (genericPoint (curve a b)) ⁻¹ᵁ U) :=
  (((curve a b).fromSpecStalk (genericPoint (curve a b))).app U).hom.toAlgebra
local instance (a b : k) (U : (curve a b).Opens) :
    Algebra Γ(curve a b, U)
      Γ(((curve a b).fromSpecStalk (genericPoint (curve a b))).normalization,
        ((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization ⁻¹ᵁ U) :=
  (((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization.app U).hom.toAlgebra
local instance (a b : k) (U : (curve a b).Opens) :
    Algebra Γ(curve a b, U) Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U) :=
  ((normalization a b).app U).hom.toAlgebra

lemma absoluteNormalizationSectionsClosureEquiv_generic_value (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U]
    (s : Γ(((curve a b).fromSpecStalk (genericPoint (curve a b))).normalization,
      ((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization ⁻¹ᵁ U)) :
    (absoluteNormalizationSectionsClosureEquiv a b U hU s).val =
      normalizationGenericSectionsAlgEquiv a b U
        ((((curve a b).fromSpecStalk (genericPoint (curve a b))).toNormalization.appLE
          _ _ (by simp [← Scheme.Hom.comp_preimage])) s) := by sorry

lemma absoluteNormalizationSectionsClosureEquiv_restrict (a b : k)
    (U V : (curve a b).Opens) (hU : IsAffineOpen U) (hV : IsAffineOpen V)
    [Nonempty U] [Nonempty V] (h : V ≤ U)
    (s : Γ(((curve a b).fromSpecStalk (genericPoint (curve a b))).normalization,
      ((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization ⁻¹ᵁ U)) :
    (absoluteNormalizationSectionsClosureEquiv a b V hV
      (((curve a b).fromSpecStalk (genericPoint (curve a b))).normalization.presheaf.map
        (homOfLE (((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization.preimage_mono h)).op s)).val =
      (absoluteNormalizationSectionsClosureEquiv a b U hU s).val := by sorry

lemma absoluteNormalizationSourceSectionsEquiv_restrict (a b : k)
    (U V : (curve a b).Opens) (hU : IsAffineOpen U) (hV : IsAffineOpen V)
    [Nonempty U] [Nonempty V] (h : V ≤ U)
    (s : Γ(((curve a b).fromSpecStalk (genericPoint (curve a b))).normalization,
      ((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization ⁻¹ᵁ U)) :
    absoluteNormalizationSourceSectionsEquiv a b V hV
      (((curve a b).fromSpecStalk (genericPoint (curve a b))).normalization.presheaf.map
        (homOfLE (((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization.preimage_mono h)).op s) =
      (normalizationSource a b).presheaf.map
        (homOfLE ((normalization a b).preimage_mono h)).op
        (absoluteNormalizationSourceSectionsEquiv a b U hU s) := by sorry

def absoluteNormalizationComparisonSections (a b : k) (U : (curve a b).Opens) :
    Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U) ⟶
      Γ(((curve a b).fromSpecStalk (genericPoint (curve a b))).normalization,
        ((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization ⁻¹ᵁ U) :=
  (absoluteNormalizationComparison a b).appLE _ _ (by sorry)

lemma absoluteNormalizationComparisonSections_generic_app (a b : k)
    (U : (curve a b).Opens) :
    absoluteNormalizationComparisonSections a b U ≫
      (((curve a b).fromSpecStalk (genericPoint (curve a b))).toNormalization.appLE
        _ _ (by simp [← Scheme.Hom.comp_preimage])) =
      (Spec.map (normalizationFunctionFieldIso a b).inv ≫
        (normalizationSource a b).fromSpecStalk (genericPoint (normalizationSource a b))).appLE
        (normalization a b ⁻¹ᵁ U)
        ((curve a b).fromSpecStalk (genericPoint (curve a b)) ⁻¹ᵁ U)
        (by rw [← Scheme.Hom.comp_preimage, Category.assoc, normalizationFunctionFieldIso_spec_triangle]) := by sorry

lemma absoluteNormalizationComparisonSections_generic_value (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U]
    (s : Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U)) :
    (absoluteNormalizationSectionsClosureEquiv a b U hU
      (absoluteNormalizationComparisonSections a b U s)).val =
      normalizationGenericSectionsAlgEquiv a b U
        ((Spec.map (normalizationFunctionFieldIso a b).inv ≫
          (normalizationSource a b).fromSpecStalk (genericPoint (normalizationSource a b))).appLE
          (normalization a b ⁻¹ᵁ U)
          ((curve a b).fromSpecStalk (genericPoint (curve a b)) ⁻¹ᵁ U)
          (by rw [← Scheme.Hom.comp_preimage, Category.assoc, normalizationFunctionFieldIso_spec_triangle]) s) := by sorry

lemma genericPointLiftSections_value (a b : k)
    (U : (curve a b).Opens) [Nonempty U]
    (s : Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U)) :
    normalizationGenericSectionsAlgEquiv a b U
      ((Spec.map (normalizationFunctionFieldIso a b).inv ≫
        (normalizationSource a b).fromSpecStalk (genericPoint (normalizationSource a b))).appLE
        (normalization a b ⁻¹ᵁ U)
        ((curve a b).fromSpecStalk (genericPoint (curve a b)) ⁻¹ᵁ U)
        (by rw [← Scheme.Hom.comp_preimage, Category.assoc,
          normalizationFunctionFieldIso_spec_triangle]) s) =
      (normalizationFunctionFieldIso a b).inv
        (@Scheme.germToFunctionField (normalizationSource a b) _
          (normalization a b ⁻¹ᵁ U) (normalization_preimage_nonempty a b U) s) := by sorry

lemma absoluteNormalizationComparisonSections_closure (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U]
    (s : Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U)) :
    absoluteNormalizationSectionsClosureEquiv a b U hU
      (absoluteNormalizationComparisonSections a b U s) = absoluteSectionsClosureEquiv a b U hU s := by sorry

lemma absoluteNormalizationComparisonSections_eq_inverse (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U]
    (s : Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U)) :
    absoluteNormalizationComparisonSections a b U s =
      (absoluteNormalizationSourceSectionsEquiv a b U hU).symm s := by sorry

lemma absoluteNormalizationComparisonSections_coefficient (a b : k)
    (U : (curve a b).Opens) (r : Γ(curve a b, U)) :
    absoluteNormalizationComparisonSections a b U ((normalization a b).app U r) =
      (((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization.app U r) := by sorry

lemma absoluteNormalizationComparisonSections_restrict (a b : k)
    (U V : (curve a b).Opens) (h : V ≤ U) :
    (normalizationSource a b).presheaf.map (homOfLE ((normalization a b).preimage_mono h)).op ≫
      absoluteNormalizationComparisonSections a b V =
    absoluteNormalizationComparisonSections a b U ≫
      ((curve a b).fromSpecStalk (genericPoint (curve a b))).normalization.presheaf.map
        (homOfLE (((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization.preimage_mono h)).op := by sorry

lemma absoluteNormalizationComparisonSections_bijective_nonempty (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U] :
    Function.Bijective (absoluteNormalizationComparisonSections a b U) := by sorry

lemma absoluteNormalizationComparisonSections_bijective_empty (a b : k) :
    Function.Bijective (absoluteNormalizationComparisonSections a b ⊥) := by sorry

lemma absoluteNormalizationComparisonSections_bijective (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) :
    Function.Bijective (absoluteNormalizationComparisonSections a b U) := by sorry

lemma absoluteNormalizationComparison_affine_app_isIso (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) :
    IsIso ((absoluteNormalizationComparison a b).app (normalization a b ⁻¹ᵁ U)) := by sorry

lemma absoluteNormalizationComparison_isIso (a b : k) :
    IsIso (absoluteNormalizationComparison a b) := by sorry

def absoluteNormalizationIso (a b : k) :
    ((curve a b).fromSpecStalk (genericPoint (curve a b))).normalization ≅
      normalizationSource a b := by
  letI : IsIso (absoluteNormalizationComparison a b) := by sorry
  exact asIso (absoluteNormalizationComparison a b)

lemma absoluteNormalizationIso_hom (a b : k) :
    (absoluteNormalizationIso a b).hom = absoluteNormalizationComparison a b := by sorry

lemma absoluteNormalizationIso_hom_inv (a b : k) :
    (absoluteNormalizationIso a b).hom ≫ (absoluteNormalizationIso a b).inv = 𝟙 _ := by sorry

lemma absoluteNormalizationIso_inv_hom (a b : k) :
    (absoluteNormalizationIso a b).inv ≫ (absoluteNormalizationIso a b).hom = 𝟙 _ := by sorry

lemma absoluteNormalizationIso_inv_from (a b : k) :
    (absoluteNormalizationIso a b).inv ≫
      ((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization =
        normalization a b := by sorry

lemma absoluteNormalizationIso_point_inv (a b : k) :
    (Spec.map (normalizationFunctionFieldIso a b).inv ≫
      (normalizationSource a b).fromSpecStalk (genericPoint (normalizationSource a b))) ≫
        (absoluteNormalizationIso a b).inv =
      ((curve a b).fromSpecStalk (genericPoint (curve a b))).toNormalization := by sorry

lemma absoluteNormalizationComparisonSections_bijective_all (a b : k)
    (U : (curve a b).Opens) :
    Function.Bijective (absoluteNormalizationComparisonSections a b U) := by sorry

def absoluteNormalizationComparisonSectionsAlgEquiv (a b : k)
    (U : (curve a b).Opens) :
    Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U) ≃ₐ[Γ(curve a b, U)]
      Γ(((curve a b).fromSpecStalk (genericPoint (curve a b))).normalization,
        ((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization ⁻¹ᵁ U) :=
  { RingEquiv.ofBijective (absoluteNormalizationComparisonSections a b U).hom
      (absoluteNormalizationComparisonSections_bijective_all a b U) with
    commutes' := by sorry }

lemma absoluteNormalizationComparisonSectionsAlgEquiv_apply (a b : k)
    (U : (curve a b).Opens)
    (s : Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U)) :
    absoluteNormalizationComparisonSectionsAlgEquiv a b U s =
      absoluteNormalizationComparisonSections a b U s := by sorry

lemma absoluteNormalizationComparisonSectionsAlgEquiv_symm_apply (a b : k)
    (U : (curve a b).Opens)
    (s : Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U)) :
    (absoluteNormalizationComparisonSectionsAlgEquiv a b U).symm
      (absoluteNormalizationComparisonSections a b U s) = s := by sorry

lemma absoluteNormalizationComparisonSectionsAlgEquiv_apply_symm (a b : k)
    (U : (curve a b).Opens)
    (s : Γ(((curve a b).fromSpecStalk (genericPoint (curve a b))).normalization,
      ((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization ⁻¹ᵁ U)) :
    absoluteNormalizationComparisonSections a b U
      ((absoluteNormalizationComparisonSectionsAlgEquiv a b U).symm s) = s := by sorry

lemma absoluteNormalizationComparisonSectionsAlgEquiv_inverse_coefficient (a b : k)
    (U : (curve a b).Opens) (r : Γ(curve a b, U)) :
    (absoluteNormalizationComparisonSectionsAlgEquiv a b U).symm
      (((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization.app U r) =
        (normalization a b).app U r := by sorry

lemma absoluteNormalizationComparisonSectionsAlgEquiv_restrict (a b : k)
    (U V : (curve a b).Opens) (h : V ≤ U)
    (s : Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U)) :
    absoluteNormalizationComparisonSectionsAlgEquiv a b V
      ((normalizationSource a b).presheaf.map
        (homOfLE ((normalization a b).preimage_mono h)).op s) =
      ((curve a b).fromSpecStalk (genericPoint (curve a b))).normalization.presheaf.map
        (homOfLE (((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization.preimage_mono h)).op
        (absoluteNormalizationComparisonSectionsAlgEquiv a b U s) := by sorry

lemma absoluteNormalizationComparisonSectionsAlgEquiv_inverse_restrict (a b : k)
    (U V : (curve a b).Opens) (h : V ≤ U)
    (s : Γ(((curve a b).fromSpecStalk (genericPoint (curve a b))).normalization,
      ((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization ⁻¹ᵁ U)) :
    (absoluteNormalizationComparisonSectionsAlgEquiv a b V).symm
      (((curve a b).fromSpecStalk (genericPoint (curve a b))).normalization.presheaf.map
        (homOfLE (((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization.preimage_mono h)).op s) =
      (normalizationSource a b).presheaf.map
        (homOfLE ((normalization a b).preimage_mono h)).op
        ((absoluteNormalizationComparisonSectionsAlgEquiv a b U).symm s) := by sorry

lemma absoluteNormalizationComparisonSectionsAlgEquiv_eq_source_symm (a b : k)
    (U : (curve a b).Opens) (hU : IsAffineOpen U) [Nonempty U] :
    absoluteNormalizationComparisonSectionsAlgEquiv a b U =
      (absoluteNormalizationSourceSectionsEquiv a b U hU).symm := by sorry


-- test: QuadraticPinch.Global.test_comparisonSections_cusp_coefficient
example (U : (curve (0 : k) 0).Opens) (r : Γ(curve (0 : k) 0, U)) :
    absoluteNormalizationComparisonSections (0 : k) 0 U ((normalization 0 0).app U r) =
      ((curve (0 : k) 0).fromSpecStalk
        (genericPoint (curve (0 : k) 0))).fromNormalization.app U r := by sorry


-- test: QuadraticPinch.Global.test_comparisonSections_char2_inverse
example (U : (curve (1 : ZMod 2) 1).Opens) (hU : IsAffineOpen U) [Nonempty U]
    (s : Γ(normalizationSource (1 : ZMod 2) 1, normalization 1 1 ⁻¹ᵁ U)) :
    absoluteNormalizationComparisonSections (1 : ZMod 2) 1 U s =
      (absoluteNormalizationSourceSectionsEquiv (1 : ZMod 2) 1 U hU).symm s := by sorry


-- test: QuadraticPinch.Global.test_comparisonSections_empty
example (a b : k) :
    Function.Bijective (absoluteNormalizationComparisonSections a b ⊥) := by sorry


-- test: QuadraticPinch.Global.test_absoluteNormalizationIso_cusp_from
example : (absoluteNormalizationIso (0 : k) 0).hom ≫ normalization (0 : k) 0 =
    ((curve (0 : k) 0).fromSpecStalk
      (genericPoint (curve (0 : k) 0))).fromNormalization := by sorry


-- test: QuadraticPinch.Global.test_absoluteNormalizationIso_char2_point
example : (Spec.map (normalizationFunctionFieldIso (1 : ZMod 2) 1).inv ≫
    (normalizationSource (1 : ZMod 2) 1).fromSpecStalk
      (genericPoint (normalizationSource (1 : ZMod 2) 1))) ≫
      (absoluteNormalizationIso (1 : ZMod 2) 1).inv =
    ((curve (1 : ZMod 2) 1).fromSpecStalk
      (genericPoint (curve (1 : ZMod 2) 1))).toNormalization := by sorry


-- test: QuadraticPinch.Global.test_absoluteNormalizationIso_pinch_nonexample
example (a b : k) : IsIso (absoluteNormalizationComparison a b) ∧
    ¬ Function.Surjective ((algebra (Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X +
      Polynomial.C b)).val) := by sorry


-- test: QuadraticPinch.Global.test_comparisonAlgEquiv_cusp_inverse_coefficient
example (U : (curve (0 : k) 0).Opens) (r : Γ(curve (0 : k) 0, U)) :
    (absoluteNormalizationComparisonSectionsAlgEquiv (0 : k) 0 U).symm
      (((curve (0 : k) 0).fromSpecStalk
        (genericPoint (curve (0 : k) 0))).fromNormalization.app U r) =
      (normalization (0 : k) 0).app U r := by sorry


-- test: QuadraticPinch.Global.test_comparisonAlgEquiv_char2_restrict
example (U V : (curve (1 : ZMod 2) 1).Opens) (h : V ≤ U)
    (s : Γ(normalizationSource (1 : ZMod 2) 1, normalization 1 1 ⁻¹ᵁ U)) :
    absoluteNormalizationComparisonSectionsAlgEquiv (1 : ZMod 2) 1 V
      ((normalizationSource (1 : ZMod 2) 1).presheaf.map
        (homOfLE ((normalization (1 : ZMod 2) 1).preimage_mono h)).op s) =
      ((curve (1 : ZMod 2) 1).fromSpecStalk
        (genericPoint (curve (1 : ZMod 2) 1))).normalization.presheaf.map
        (homOfLE (((curve (1 : ZMod 2) 1).fromSpecStalk
          (genericPoint (curve (1 : ZMod 2) 1))).fromNormalization.preimage_mono h)).op
        (absoluteNormalizationComparisonSectionsAlgEquiv (1 : ZMod 2) 1 U s) := by sorry


-- test: QuadraticPinch.Global.test_comparisonAlgEquiv_empty_nonexample
example (a b : k) :
    Function.Bijective (absoluteNormalizationComparisonSectionsAlgEquiv a b ⊥) ∧
      ¬ Nonempty (⊥ : (curve a b).Opens) := by sorry

end
end TauCeti.GenusOne.QuadraticPinch.Global

/- BEGIN ARCHIVED ABSOLUTE NORMALIZATION PAYLOAD
{"Native.lean":{"sha256":"b42050c75989ad0daa7fd8625d152402080f7aad0a6f08f1897478c1c76b67a1","data":"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"},"Sketch.lean":{"sha256":"c105f0f702861c54763a94f6ec173dc4d8dd3f2e087f805df72dec9b35824570","data":"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"},"Canonical.lean":{"sha256":"1bee45c4b88052bc72e4609e744855c0321eaf89cbdc5bab4b45ab746e9d28df","data":"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"},"IncomingNative.lean":{"sha256":"b3a84f647a14df17ddc6d39e63909f072700624654f72ef0608f1ad6580fb7b2","data":"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"},"IncomingSketch.lean":{"sha256":"67a9c8cf27ee90f69a12ab92dddee3c925a3088fc2c4e5529292349e569cdca7","data":"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"},"IncomingCanonical.lean":{"sha256":"d51959cce071d24033ff778174ffa350d8cbb4bdc3e2941c17bc25ec6777879d","data":"eNrsvV2TG9eRKPiOX3EcExsEKAAEmpRsN6O90WySdo8ossVuUaIYPZgCUGgUG0ChqwCSTY0iPJJGK/lp1jOz2rmxE74x61nPjeuXvRF7505s7Iv87vsbbv+C+QmbH+ez6lSh0B+07HH4g42qU+dk5smTmSdPnswbre/VDsZRKkbRJBTw7yxeiMU4FEkcDKfBXASzoXocvhoHy3QRvQjb4gCaDOLpPJhF8Uw3HsaD5TScLeCL2jAcRbNIt05DkS6CRYivU5Euj47CdCEehMFMjOJkCo9i6HC2SKL+chEnKQ2chC+i8GUIvwbQDl6/CJOjsAYjzoJpyG3S6GgWLJZJmLbFw3gxjmZHYhwmAN4kiKbYRkTT+YQGDhYAbbtW24tms3Ao+kEaTqJZuCneCxbjSdQXnR9shBvDm98Pf9Dv3Hrn5q1uZzDsv31zI+x2u4PhrZvDt4N33ul+/9bt2kGw3AkXkRh9/4edW9+/9YON7mB0a+Ptd37QvTXs//Cd7w/63bdvhd8PRjeHncHNd37IJBstJxOkWz/C8RXNHz46qO08em9v98G9u5uA9MkySuA1DCFojCBZRKNgAHQLAK/lLHgRRJOgPwHKbs9gWuCVwqAVzyanIhgB7cNa+GqRwDucIRhlMA4Hx9BtwBOsUJ5Hs9sigr5fBskMiMeDRDOgYbQIhzdm4UsBsxst4IeYT4IZNhLDEMibED1TyQ3LJAES14CoOBhMZTRbUgOY+DjB2RoslsFEzJN4ES9O56Hox8MInkczAiiaTpcLxApbxCORzoJ5Oo4XNZgihFs2G8Okx6PRbREAKQE4QDdd9iV8skfEQMO8nA3DROw9fnTwaOfRg29/1b0JjBIgY8qBrI80fhrItEm877KQ5C3gJMR8HgBdkefhL5ipYNIW70Vpit0chfE0BJ4eIEGGEZGLBgpfzSfRIFoA9DHDCeOEwN4w/XMgFowUDmt9mMqkH8EsJqcI0jxOqQ8cCBbAAldGnIhAqMUGrwChwGkLnfx5GifJ6Z9LHoxmwaQ2CYdHMBqvIxz4VGzv7TaRmxBVWlqT4BSaANFh+qbi5ThOJQfrNQcwh0NcznNAB9sixdpElcXLWNFDDINFAFyQLAe0UEU/nMQviQ5IW5g+kCqL5QLegCzAAaNETIE/Q/i/aIAdaPyg99aNWg3mI04017e3J0dhPwmiwY+Z4KfthyBUgkn0muZLNZeL1tP8vXi4nADoj6l9MLm/nNHCSVePpJrej8LJMNv8MXDBARLwtP0gBkz2YGJCIAoMtQtTfJQAF5/uTICyw9Uj7S+CyXG22QNY6UEiG7fv4Opr349m5c3uJ2HIKGNbWOf04aAE+vuTYOFv5PZ8N4JVkqKY3V8k8ezocTA73lG8vxrFO1EiZ8D6swQsRUQkIbDWSqLSJMlvYa5x7vxY5UG7N5lEc2DHnWUCOg0m8nk4IPVWgSq7aTyNkzko2mla3vL9ZQzcMatEa546TXGk2YpZ3B2G0Oo9EKwF+MqF0L4HOuhFKWX0vwcxaOgyOksO+3EwiaPUu0o8re+9WjBWq9vOwrQQnb14cjoDCQtY3wXGCMP2PoiFCf9d4aP9eTiIRtGg/IMdMGyOiKWA1G1gd5Z1JfID5jkYIn8P7kbpIImmIJRBea4WAaDFp+Hqdg+gx0UF4fWe4so2r5fd6RSUSqWlaj7laVjrC5Am67R/NA9n5wINyJxG+yHqy0UVEWu+/GAGaztJ15HP3o93Z1JOrPM9q4l1vtifxmD8Zr9QjKlUEHFFe38coJreA1XeB9sFpJP+8244SkvkB0pyYOw4WaXnpOJtb78MTqsKWBJO++MwGLFOjZMoL/tLaUCLg8AIyW6YnN6Nq66sh3G4QJs3mK3SgjaCJW0PQH7FCcwkUqyiZNbSHxheWtfrKqYPQzDEQP4E6wjF4uHugunW/hi0QrkyIKlM7daF90kANAerfwcM+6PcIvlxEi/nkkRKFtMzEFing4kBqNi0c4fbpq0RkCACKpePTaiDbGs/CQews6xoSQL9J3ejFxHMvWRIl3LFXxKAKVp5ANLjcMgaBDVyOKnaR8ZIQSx34iXwfxlTay3a3l/2A+7zEm0u61OL83ZT9V1VWXJfbmbxfck328PngPZjEIeFNs4LCw6ydC7VfHC7f1Eow+zeEX7immL9pv81k+RfkwdIpkHbRyb5CjdHD5fTCnDRfqLKlgPlXMFoO/F0Dpu7yjaXpPSDcDoNqsgw+Qis2jUo9yBYAGxhAciM4Q45apx1jw4rWGSBbvloGh4FtRqo65lwta3wKl+RW7P8bTqAf4bCoFWrLdmICMWyNotnA6Ii+UfSkNZBrUa793kwCAVgluB81260WrTLnwQJedgi1CvoFLhDPpmAHE/SlWJ8Cyl/LrbbAnbXsNsmfwVpevHJHbEpDtBfs/xUPAOaTJGzxJ1DUd+GN3JkcacBP0iLwVAv0QNXE2IQJAn6BTa3xCd98Rfi7KufilfQ7k5T9MV1+PPsq6/E9qfQ8nWYxL1pOL2GbUfLGbzb+pHon8IrIZKX4hk3WE4O6Qk7vbbb6jN4GAyHTgfjQIz7uW6oVbYX+amowzevGvAPfNeAFim0dPpMAOxMpwPSHaKeAD79hkFKj5iO45eC3tLLLfqXmsNQ/VOB1LPBgf7l21ptgmvAzAUBWX0+6n0kNcwL9d5nuNpmZs++/NuCGUF8d0ejdjKa5IEADlyDJ2jsuj0svA8X+O7sZ1/yUEjaHiJOZBUpLLZALMmDBg+7eRBAQMDiAvZegxi7hj8VWLvi7Otf5khCLbMg0mwP1M4ODGAhvv0XWEiLJBZj4gprCh1abQM/wetG/gvxyp52GLct+a2XREfjBUwGfpZngngWlyD+ybbYvmbj/ikCsAlwELLXFPIO2vTGniNrUojbx2pV5MAJSN+K+mNhQGpYID0+dOF7JiWggA+Y7+uvbD6tK2ktO34s6p+8+lRPSaO9iCVqFrxbopeAxu9Zjx4jX28JYmEQirlveot4XlPuzmJybor62c9+6fCSMy69lPwRvloI5ANkYPFMtzosAGCwTA0E9WObemRPi+PDApocA00sDfiR+DOx0RSZJzcV0Y6ffXRYRDfqXvDCaIMumXl6dvphZAV5lAvwmoHFugovYsn6BvzfMayyr/+j6Oj5R8r/JJ62wxMw/5apqFvwhGBOyfei3qWvGxKFwmYt2a6xLt6iJbrr4n6i/Dq9EaK6SYo2JVco6ME57etb9KoVKheXQFHWtil2z0sz+dc9aw1BU7mGkJ7f/loobzTYOol0PIh6oC0k/KChKZ153k5QlWW4+59y3K00nlId92zV4e+zQYIV5LvolIhRFqH90x4dBIL6noX0JJjPJ6diTH9zU1a94wCQG58igKg0+2d/+f9++68AySmzBKuRZ2df/rVAuQob4njQxE4PlW455eET7hQkhZTI+GWtFs6Gxq4yppbafP04nC3TRzO1pdyLZoMxNX0hd5Uoif1iZdsViWy1PQRTZkabvXR7NtwPp1FK5t52P5xEwQz3qiEeHOwFyWJ3d/PH7c4NsAlBGbTIxmvRcWwC+87ZpjB/I8FiYsLwFXSIA5IUmyuPT+1hLKJpcBS2pKmYwCfMOdECqH46j+FrPNOD/+qzyUVsZpF6nwZzy3ZEsGhp7RhA6iNWQl/+/K3rGYW8rThSEQVM5zbYrND6F/9V1O2nCu6dWDKHcN/HI1rzGXfK9Ji0K/DkqGEERuF3J/I7ZGL9nRhJaTEJgUHhWQ/+h1JlvnDlglKQHiL0RmCzlBOiHuBbvUS/47gDPu1xPJW9Qr91/+TD9w1sKIIGCAE8oqxMshSW4R8SyQCfc5AsD+HuOkSEveTJMiyno9Ejv6fLUGGAi2wTLNazr//z78MC0sZIVv5hpyOFFC6D3xekENYypDzA7GqrZAzcXrgichaYt2UbDaoe6LPZAnSYMaw8GkfbS3cibS4V6C9ll0ZD/FwuzjXgIV8FKVkDUWY9rgvTCA20tQGZxTOl4sPecZjMQgMRQzABi3dETgCYnUGQLrQxjS5+sdHQrQbYqgg4TTIYRHHygKAly//si1+iaOMnHTAff2U9pz3BWtONRgzgtsjQOIORPY0KGxAeCfzhfUVfFxnWxbPyS8+sXIaVx9PF24q4r8+Z0TiDPYwMseJGaPqh/5DBRuOsTEPIb6pYafasrlJeW05rpMzfZFfxZZBlHkRJaxKN0MDdlOFkwA5g+IN8DSZJGAxPRT+kaECSPavIkVqzXEFp8mibWjYaDxJaO9euGafSdiO3zKtw1O4V8dMAnoN1H8Cm4X6YJBj2RY530W3fbAIHDSbLIe4XZuEgTFOQpkQ5FRNmQduL9ClyLxqNroxq5rDap65AKdWr6pvvhLLEjbHWlL6lYu3BLzzvcl/fwh2gPfOzWIz0IWATdnnQLhziD9wOmpNxNf0ZFyCCbU2/qO/7fMDlE7ffTpd9DB9cc1r2jbuiTWS1elpziq2u1pxk60szPKicXjKaNDJeI/QqrHQhFHsbajUp0MWPVWzp/skySELb7/CxeCo+vib2cBr4CPqT5aefmgb1CN58TFb9U1gwR/rXx9fkbuop/dyTZwjQF/9k3gNYwgTWsYluTQmEJkjYEcgFyUwYWkz4IBN9GC2C9HV4DMyV4icychiYSceFGoz2luk4XqIRj4Ew5jQpxhDhMIXnEdnBAayOI/oLXUeLeB5P4qNTlDOp6qIuCQBwHYWLg/ggntOCjBqFr46keCp4HRR/SU5+OT+pqH+ACFDsUtqQQKkFELSD+Vx8gPSVf/GYEf56cA8ngbxZ/+P/+UtqVZcIN9zHiq0kv9aP1Of9dT+vyXNDCtulsOhxPOHgbMVw1szB4xCmfBKhiBHLNOTzRLY+eJo4wpoZo829c1w4h4JiBDR0mMLn0kPKTNBKMQBIyN5PBbak6GQ8JeVY7Oeo048mcR/GUsRu22smy0dqaxyPehwZj+7+HT4lsdc3LhJRn+NhBPH7DpDoBLXYNflTqi1s4VPec1TReHyIH53gDxlboURgjsHrGNNCrDNvWD9OtPjRjwq3fAKb4zZy7W9gl9bIKxaGWBsD9hpeqBsMzP4CNgYhHi3rtb3R7n6fIsc32htvt2uPVSh70I9oMtFIXS5iiupGzpLLiBgPZhJ4A2w1sFlnzDzy3kmQpsspXZegyFCjgNDeY4dFjrARyIWA1yPO2DBYLKdkaKSZOEeUJLDv2E0l3kewRL76Z0VKCh8kO2ywkC3diEJ+qBW4L+4PJRR8l4snlM8t/jla3VdQ0FeQ7SuQIuGTA1cJiPqpFu8HwHOvjXjHn+OBFq6nWri+Vvx79tXn3xNIxz3+oInjQgM0808Jgr7+/TrPWgdGRizGSYgMJE0QuoojDxb4Wg/e7gAeTpG/+EJANCOrRIsUvsuQkH3v8MzIz8EOm0EzxbXXUnEyOElVuAXYxLBwQx2vTVx+2zWRiJGHQ/aDL8aBA0K7Zk2PGND8NMXSehaZ6cQLTGbSpmEAekM3rTmAtEX5epJXJ8zipNCLdm0/XiZgu2+Kg3B6HM1arYPTGP8QN9sb7Vv1KGo0xTtt+FGPGrf9a/mmtehGk2DRw+nakcdAf1x/pevv46542hUfd8Ec62bsMUIRdQW8UeYW6Q4MM1VKoB7hZx9zi6ddNNesB9AvWmz45KnsBJv0uck19YR7em1915CCoKutwNfXrG/AEJRTRwKhy+ZDF0UC/93v6k2caXBK6x7/QvNqjHalbA6dq1fKvBo/dW2iU+w/ALTh1cfX3HfwOaDU1zQZf5x5T2RiGBvCWDsnhZoXmgNoMCKSKiuo5BJKMeBUxx86mu6uuXCFC6UNLDHku1JgJskoK5IquIKKJIs6W5M2kLRf6cLTXIJp7KUI+qIzNzCNwtkAjO2XY7w/6LOelK4HWKYASyrQ0JrR1TQSmxxekkZDkpeW6SbNKdogWmN7jLBgBgKTjwAZWxBNQwAdljAYYvg5yUXdhyVBXkoispvA0jiWOc/z/Mxd/4fygbX6+fD7mX/dHzov1KqHp/aaL+sh8PYQuD0Eh4U8xkLQ2uLjkbm1K2hW2RNcwr7gYnuDnBM2i2gbAz7Y6ybta+IfGWWYzkFXtbCJulzYPn9wyFXFhujjiiqRNhgX0tSEdd5ed4bSrRtFoTiraYtBQoW0jWZslKTRFJ2gaOlUJrI8Lb3c0CLZq7BiZrbEJyPxF2LUHsQhLHjUIZ1PV+OtTm82pRNSbRRJwBnRBIZkvDwa07sj6ZfQosiiQamVIp557JJDfKqsEvqxm8b4l3Jn4c8gh8h7MdMJxRzZimiX5bCzZD0dWRhXCt2NrTh52VkB+fK1pP95ZvXt8mCn6khsmq2iVCxKoxp3wC6mAbDVjVZaMk6Z55siWRYRXQsPYBdQ/+jPbjY7YLJO5RXrUULew2oEw1Mg2zmJiAKea6z9FUSzloIe0Di+5XBrRNvpTtDnQJ+zQ73Of//qv4ndhunRcXDrT9GiPC74bo5O07mN047+Dj3z+/K7Yzo6K5KiHRai3Jd2gOqOIvzY75Vgl+rc4Hm0qu2JaRusaptxKuM3/VXfyLaX4UE8txfR2ofUL7oNWdlX9e2R3de3vy62d3L+7rxDzjjr5DZdv0H7Gy2+iUwVQrkcWIjwRYllPyW6gfWU8o0wTPxwKr0E1CZSUpztbz5mSsOFTFUBm+jlZKFMXxkaw53CQ2vnT45MlBMgy8e1BSVAMH2zn4LNYXgWYuIN0ecje94ucPewMZicskGt0VLb8uJdOW7Lb7Vv4bYc/nbPK2UvqIAqbb8j2i3lNJzao1mbb96zfiCeZL1Gz9Fs/UBvFp9jgyfqVIAs6N3UuaUrnn9w6Hn4RIWrfsBijuNDoTGYBXXzO2r8j//6fyjwn7hNn7hN+9TU9lCFDOrXfyWeNEVI56Zo4dKHzz+QWw2vd4pVFttZ5kiHtRbaXNLJJLUZpajBozRctdLfklJAZV/nLsgEUOI1IpgEnYkDqK7P26g/6xqqtT2cBouBsnGUoUDpOlS6HtqLsUkEY5JuS8KBdRHd8gP5N7Eb378tyk4JmduJNC0KJcVNqO80sCSWHtjhscSVfxlsVSgsy0z3/ND6bN/32T7uGAAw/EpJ/BWe93JfebUjwkaFToweWPfUsErv9lnnOYBZ4yDVc4jpE9x8jqldr5pP9I0zxxqUS2aT+C7HWuSp0K4TGTrPTk88lGIdcFtYUfRgjqvLdS1WLgu8Bbdgfy0oAHYb1GTGHc43hZ4FsrmlX8P2sSgZjjTFt+wHCibxLHTCIEaMrzxd6hm0i8+ZmNGv8KxphYHkPUKqYiV5z5HWPN1ir4i2JWxbq/oXOtig6idSyQXS4ZxVh/1CP6CZz3HANgNL7tYo6oeJEoqzMDoa9+NkHMdDS+p7GYVPLy1GWVtH18fOeJvkWmIX7rUmqkHyMz01fiZemvgTdaMmC32GXzXBZHiNTtpraPKDBfGa7nN8YGlWUX/fMQsa9mHS+9qFfE3+Vi4Sr3VySgPZnv/TgnnhdvmJ170Um5sqMgLnck/molJJ3zgpFeaeE5gzrS0esVTYFEOVUCfduNFtWho3khfWo8Vps6aEB7RrsucBWiTh0XISJPh7mXZRs0/YYpgCjlP+khTpkO9iLKN0DILoT4NB3Ecdq4L10IZQPBP0kWYB99nCVcdsNw1O5cm7yTxmIaU4FS0akz4rF3HBUSX3oz4bLEXbZxWCsQAhOHGYAB7S4V3mGTU8iN+F5/wN8gTJ0TqGlB835HfchHrwtBg5n2MreBiDRsCPRuwqlp1s6SGhCSuLAwksMA39zre4w5DrBrIzuvqL+VRUD5xdxf6e38vv5WvzNfdu9zxCbPBYR57ujNyAhcw05M5LSd3xMR9NPs0zaSdr8vXGBRlA38bhDz45to0y42m9T9uHLBccy43AJP/R5JBjgsxMTRo0O/fbiH/DYQT2rWjPzv32SPTVGvWirFbpkDNoGH621iesvBmsEzwKXs7xVn6TcWyR/YRR1uQq4lyGoJsGAQY8D4IJN9DvUJXLeVQTli6TUTCgiATc61lJ+zDRnZoMO65WZruTu0dM/tFSsKvL79LsBzt6iJkWVVgDWP24LLFbjt3FaF6+PRyCrB6gZSYmICcya/Y+4oqTIrOMSHPZkspqsSpANksShvB3VtISsQ9fAsGIjpu6D/LC4yXA0UhaIKxyXjUxcvvrX+qGr8hX+JMg1VL43XgIJA/us7KEub8bsqd2EdIzjj8MJkBwK48hmXkLyp4DJEKMZBQR7vLdLIS8E9dJDG/QzXBcXTKVJQnCOeyHIoxXIcchDCAzIEp/q15w+pqclUhHTyX6AaQB8EKvTRmKZE8biOzZMBvedgcfhkO7X1fa6q2SI3AplQs0s77jR+jKQymK3XZJUHLWl+Dss79sA2U4jwZNTle123DbfZZpt6Ha3XTbfZ5pd1O1u+W2+yLT7pZq947b7stMu3eY/h+iSbNoRZj4lax+OwIZDxon+AdyZioSzA+JJ67BTDbHdzK5qZyZIWcSUZKQm4U8SkYi2rSn8MizL/6uwQa69IZbzuKzr/5XMSPzCGyXVHsi4Lu3RLfhuIh3oA958jHD7BAZby980oIXtjLIs4kd2lkEdI1vXo5Bfor6h7ityHPbcaPgeZ7btkCk/7NLr674sG2zWDNDzw33/Wds/rltbrptPs/2cct9/4Wvj3fcNl+e/eI/WavAsgUNy+cf3vQ9vOV7+I73kh3SuVeB2h+2qRH/P9goH/p6w4vVn3xIPjdfP3KvOO5Sf/YUQIdPnAe4W9jINvss2+wztYW4mW36ebbp59jjrWyzL7LNvlA9vpNt+mW26ZdEFnzqI8XQyoZYgb40qqKxGuS3fwu9Z3jXZk54nz3aynffJucZQgG6fmouE2U6rtPBCIDSpYNNZ3VXGGQRz3sspFaP8E7uaPkdPFztVhkHReam1EoYWhe/ZMtxsYQhOf2zTXkxjEM2UgaYrHZ0KkKZVwxvAFig4qawaHqacnKUTNkSdZApHbAX9H9h6RYpNjprcCdty3MfzINrNHsRT5ZkUuozQZ9AJ8/5PKOIIsVU7iREop59MEfiz/ObT5/4pkMJM3mg1FgfBS93wHKJhgEHtYMyEd1btP3O0UTdR9M66HvPgJofNQX+lw8m8Z9b/M/boIiIQ4DCPA/cmOlOZ8VrNOxkXsrxiht07A7eLvy6qIF+c8sztvqv86Jj06GTf9lxiHSzrEEnP2bXfOYHqPilGdR0LXW1nvp7JzJPOrEpM0GBplZc4FPYLjdFb1AnGtslh5O5la6N4zSLZz1PiahhiY0MYj610WdSZXqW6QBKevfaytrdtPLTnPlc/dOcRV3905yRXf3TnN3tIybej4jEc01JmT8qoj3g80p0paaeFs9NiyKrqvocOlpfB3B57NZ6hoMaBfart91nJtIra8t623tsWm+7L4r6fcff/ktSlhn1l6NLe4pXAsHcqUfwZgBfgxEDRIV9EdoADVt5e6ja7TYyBAVy2lYHCcNs2JFR5iWMaHXNyjzTS7dTGbubK5DYWIlE8a/q+GyswKdbGZ9bK/C5uRY+3iiljWo43SzH6QfiuiegkqMc33Ib40a4CgE4iquHUVy9OSZikhmzZK5fQc/o8g/e9OAVQlZr2nbNO5QYP8DIBEt6kNzqdknUPW+/CCYlAgVoGmGTpgYZiHVugYaWoEcZ4hEpXp6j/TzY2ei5VYeMwUZrZhetkIeXTa6bM8wcoWo3lb7n4TEy9RHCRs/puueq4w/LjQ37RJEyA7q7S/3uic+Wz9mtkn+zvgTgzsxO9K3sZve6SIzMzOxH3wLIkMv977+k99cLPsq++Ey+uMmeBQH71yIzgV95zQB+VazmZbdeZc6vVihr30VidKN9r/YnfyLuUU5J5etk9zXd4ns5CxO8exkni7TGpZ+kI1QeJCh2lIcKLVPr5SiY6zNyrH+jIvynU6pW49QEqoWToB+ji7ctdhcUi5LA1jMMBmMTuYlOXDqrAqRwCyoL6aA5ibWcxJ8fJMvwz9Epn8RHeLNA8nOzBiuIx4znAQZv6YjfJt5TzF5MMLVwKPEeltiZBAMZUKygMb5+WdZHHv5ydSogSi78Fa8fNrP3oZrO9YZmzY2SaLvBW+i21lEXfDCoz+yKI4TRvV2bYQGd+TwMEjwglEW2oiQXAaHDI1J5GUTJkf377e4N+L+bbDwHyelmjaKNXMSHsTysIJKJFNNft8JFMAmBMxZOUS+MlMIxWyBFl3g3joMvgJzXfVcGZnQxoGfuDlD4upww4McBrscmMYYrF12q4SaI7vVhcAe6SHUGRjHH9OdcwQw6wZvN8NnzJbGSFXAN8wPjKjgzx1LWcXDJabAMVbZOhNXZAB8Mc6RATagDYry8x2jgPg6ApMNd73mx5gp1SHwtJVOupa5l4xmHjGjBM0YMh7bWr32CpiPcCmorydCaH7e7Sghg3hTULR7CgMSk9BObYmIlaUdDM5CXHpn+PINaaw3CyQQRvvvkMVMAD9pmCLgMcuHkmPLUki8BjHBp861zLfFobLqWKW900gPEQJ6q+YEe8YET4sZFqbR0o1XkptGRh3rq+PK2uRAWIlJ4skkcps9dZabFJEyj4TKUmBguxAv0mB5Br3FzpG+d0HvhNgKGgcffLb4vO1SxUDSGikQAzoqnlA7hhuElgJju1SuCwiejBR7KScGohYUfiChV5QVQtm3Ks1NOEzKyjRMFBE8inteL4/qdhr/XOVfIkHafJDk/E/d+883et/969uXP4f/N4RuSDSM4lFOyRaJCWUIoETj+wiIC0YYVjj7k1koj9QN2gnfN1BibQCQV3YGyi4+NFaJmIhkUYCPna0xPjgAE0UReY3G+l4FElhYDTsftLdAT3oOhN9jww2ivvcxK5HuIPBxArIJMTSTBdDlZRGg/0+gk/rJny5uuKMkeypPcSfMH8lpmaWlZE86pOZ/SG5XLum/MoYLseT4NF/KkFUC6kT3DNzd88kBjFu1NwTofRSmjqWSI5iLPYb68j804TIKXqbd72FlviqPB0HFqNYUK7XR9Xdjj9Nt/uduDr7buevtLQpkm2JytKxgkxZt0Hd7ut9tkRCIqpikj4r29z5ZTZLFggg833UywmVIjQrelQn5NJcjES9p3+anBnLxpcbQTpYQRc0CrLqth2GKgBRSnpKkldluJrnXiG2AYL6Ex6GH6V43j9L6hLsNKMvcwRe0QZBQWSCSN6Kc8+kY2xSBEve3QdwMX4O7ZZz+9fttAT53DPpC69/aH6m3OMdh2mMosPCKt3pJSXmNuCQQrgoWzQUP/RUEUKsEZx5RQrhTSnHShV8/m/um0H09y/C6H5nQ6c5goYl7HwsLfKCoxo3oqJ26AqngQmrhbo3lhxqduuEa7BPi2GXZTzJqzt95ufr/5g+YPLXCUiQrsN1cLgpBJSzu2F/oLYBg060leuy843/7kVOz2YPizr/+pW9prVvNqFadzHzGdWZO6qt/Rp4UjoAUN8ipMcPW31JqTWlvPLhoXUgFhG3nEZWV6Lh/jZdyzCQ+8/dk1tonRAE8FeiCXqdjd3YXHSLkJhqLPjhbjDTDkAfvZ4LR8BPRoHOFChb4/x74pxYfb+xPTObRH3TMNQxRFpV0rEYMLUq5/rJYaUQBI0SzPsDDqcMgViHE15aKOjBk2GN5wRZOO4TK32vEap1LntCayCl4bFrw4tFDjkrymyGnGRs2ApbgY6MgBTa6W5o/VF77vQ8dE01/HFqX8YtjXmYNjvkfCke5mVu8ypVK6Pa026KeS6prAGlk0BcoRZr2gO/SpCYdo8Gc6p60rN3G0TwG0fAlbwholBm+HQAKb+YBGj8wDp5iuFbvGOdU5YwIGHU5LagezZ2IU4wk+3Zllj4nqVV13wC2h9BoqYadFKm3ocCt4ikW1laXVD2tHsFBmvCCsstyoPjD+mPKNynsTutxv3MfrCKwizG0l3mjKqDjp/6ix3jDXO+ydF7kxUt6B3RbshODCxGjQYsg+KiPyXlAqymCa9S547o9sFt/K0Fu9GcVBeG8qI/a3YVXrCyi0FT9Ci3pReM1EpduQxMbS2dzAjTW8nrloxffLnEv+ZF0DhDn3kbowZIilLqUxwdHQpsSedFHeWKUtOi1rmpRLlivjxoArVZHlR/uUSYCKiEtOofMdWYHCQrXTSaJIxaSdat/KEaUcgMqs3r/f7sCimIczNCRUwe3lTJYlZ6p0M4Z+azAJYDWo/eqm2jarlSHVhLFPrAxxXMUefh0lwXys+sfAzdZogzvG23CqKnnM5wyZPaVzHZQ/4SHsaE+VrI7H2LgB1uQspSM9pUc29d5xDGR+jRfcJ+QC2cGtFcZzK0Pf2Y5QjPVxUypiMVUDKBnM+8YWfAmy5nRTb4yP4njY0nLNSFXbUaAAAmZCRUcnUSnunclghK0YXpOwPG6Pg9NZsByK+sPGdTtzjUp3o2CbTJLWMU+LU5JCrxkrLZbeYJC5pJ1mYApFMV+HlMbV9IC7v3lD3atsaUbZ1F6zG0Gf7CIQ8Tghr1FY4DJ4IVFmP6FKYGjR+eyrn3fVAKB1Zy3jpt20uG0PhksQaLPJlstA76hUTUNZXs6czkjoJaTAXX3kMeMx1IyIF+ulxUf3xAFuNs4FfdM0bkYY7gWGZw1o1Rvr7rZxI5IFQYdk5KVB+YOR79JPpXrCq3Dct7pOqphDxcNL8B1t13IdFJsl7hFi0yYHnoVqUrW/ClkWEGDq3lA5IY6wyqdbyCTrEgET5CaDduvGnL5u0TIGui5x5shMfoEDKnDkTBIL6hu6Ekn0YakZDmbH3Q4uBjkpui31n9pu4PtJ3A9n0ZLRGZwOJlJqZUxzBFLZoy0SSa0kOoqGlOKExJqewRtmuwW2Cm5PeVGmdIPXMgcoeRvfFa+/aGRIIQMYB6etQRIhzXgVTjh23VrB88nSSQIlnVHktkyXU8zkyB1TTcGWdKGq+EhJsyZ6fqcxyF3c+6c6H3EL9RuRvwVmA0dpE5dokkrvEw7xzg1eeJxlT1nAam+KSh9PfmnXH7hO7CTU1+4TlMcRrCIioMzCgnPJvQ3UqazsRu2pSADKeEfphJPZ+V6AbMYDIhb/pLbwDslLvE3A97gGCwW/vDjRep7TXPb9bMpbw2dnGlt36HCCckiNqXq/lK5l6kXVc80blrqj3JgWX8xlyXtUCHzktA3cJEOvWnqfSstAEbm2vbcrbTm+EEzCKOXSTcrNrm1hthxzMyH0DXMSV7D8HsBWE2/gjaKjZaIkMdgqSrUpU1GuGPqeZ44NYG2x0boKX+G2MVrIxLdHwTy9jWdhp/QFaXs87+R0j2x8W+cs5sQdPl/EaLYAWVs39FmsuneaMRpVXspNUzRQG1Hm5LaGVwH1tZ19+lLdRsH9qezkhhIUfLQrXgaYeGg502ED0BAPQ2WdU/i0Jk9SLLikUDtVZFsAozBFraNd2uq9aou7fDDIJ7G46JvWHrdmrGgRLehQFlYjpgCzj1x9Oxy6DKXrkubObuV1q/wpFu9W7Ps+tDW6wfPdNG4wc+6JGy+8KTSQdYyzmyvJttDlo/d2Dw7u3bU4tSn3eObEG3HERRdNaAesOH0T/YSuEa/mrEfHqL0Bno9sivuxdXjL24aUj04CdSqyr5y+mx+fffnzp8qIIjVKjz4+++l/0Vkl0DuibkDBjIUqe4O2Aj/+7f/dfAr/w6/gH/Gb/4TwCIKHTnSeUtf4WspCnW7FZIVwT+io062Pf/PNU/GU/yCQeARc3VLTcD5QFsBa7ZFAtfJNMLQ2VJTF9aF0/JgkEOTrIduklerUgJaC43XPlcva+fmQ+0MieW8cT3s6P+sm7IRBKmzeAdruYPkIk6sVdlab24AWvVEk396685tvdsS2ptjeFpnw222e3tmpNcX7Ug4cNJ3M2j+Jp/v1veZBA3qmv6mHO/DgN9+Y3zvw2/yiAQ8a7ISVAFZB1KDD/GdtQHmGCAdkBbm75vN9+LTl5rBl1erFjUI+slm8oEdK7su4AaYHvEdUyNAT8p4OyVoNyBbew8cevHgdsdGL+nAfT0+Al+52z/6Xr+925KGuZCTbOFCfIDzZnPV4yNVUNoPDoiodTGpvpumAoNO82xXBcBotbIwpMEsnlWE2TtU22RzHyZSfqdhDsPc68hp3KeAeYuAAk2Dei1KWwczDQIU+C1+wWJ6TabecWVmKLHAz6w7dBiQNAh+JgEfuEu6gfIHeW3c7v/nmLo7mkIyQnQlFHLXqS+gDyiTmmCA1mMqIuteV2TxM7vCU++CFbommGZm70t7R2yMfA+H2Le0FjpotEMlPmx+TxMzLZh33EJn0DVJSU+4cRT/tULCENttDwnbEaIS3np797G8/JiHKOGVWWSrVgiKh2hjzEnuKp+dakOMPiq0y0rOZFZ06IRH8EQwjjHgg97FMelSa7cLOcZSnM0seUynESB1z9JllMk0GGWSjsZPLkAjcFIqSTUa4qbF11qlLP0U9q8qNOSf/uBB+K83hQSnoEsIU+DwdRTLeTCWpzGXF0EcNm9m8YXZiYJar0jDXR86KSABrk7cAMlRLLWOK1cINblM86u2dff1XQe/6o97T33wzwH8/Fn36h+hHV0vEYCuItvqgbndnfP4/oF2bFPSOiPiAyIzuY5WyMcGTOzTp7LSOMLquJKHu31NcFq1PtCOTVJZtSkt4h63pKpzDisu1uo1/OMtO5GzZfKpYRhYbKIKDV3rP9hNVAKgp+ps2X3okhvJTqWz3T8+++t+Qt/fg334dP25IfWa7JgFRlqIZ3i6EPxO1KGXdrJSaJMTAhKE0FtndjAblPi8/l7iWG8dsnLIrXKoi5gfFNqT+7+dRzjImnxqYr9hJJ9NjYyqAbLEaOqQzOw2AlPBSeskk2IdtMh6ze0ipVCwfjBEFC3TkSzrZyWoio0tITKishqQgs5tFJQVt5SeiEU0KHTDC33RESQuUnTevkdW++opGMFmLMBGiiOpHlO25jm0aDTGJuNaLsbuJn3ATYHKbO/VbMsJYhcpJOXREW0dSS3u2gF3nOGWVBctTxYS3iiiwsU7HGIyvMtOZKYsoS2pCogPkRFO0DtZ8j835honOxbxrtlsyVTkfX4TWDPhx8qA0i9UBlVSpS9Kpm2IXTa7jlqTsU8499TLWLiclO47Z6SmpPYtlUTZ7HpuGHzlLZsYIhCXGRw0y8C7kKEhXmGCIDZjyqiiLMsBqtSrGFFGvZPlwms9Jyo5pCksIX9aw2kXyIhy2jkPK7AFLI5ym8vQyHQccSxklKqZAHofa23K5UV9yYIAOIZd+BByIsoVo35I8HJSx0toNw90wvNkDfU7xLKcZOoO+c8pdHznms+C5VQZuO0ZChotqJtkdFTbE9E8UAeaoep1wRB4BIuQE8sfIssdRi/Oo2rqYqSE5xko8hVGVyGUMdzzRGSDN6a3Op8JZtOhGwQhjseRhaO0nEUa9Si/tIIzmC1mqJML7AAkdJPcnMVqDDx8diJ1H7+3tPrh3F/3JcqcPzMuewcEywWjpGp0ZakcFomaTVSaOlBIAnryvIsKpwJpCU99ald662o2WlZUT9Nhnn7k+OTq9pWUoT1zJ1UfI0D7jZThBI57qwlDYC6XxMirGhMbpKFeu5qL81kZFxQlISw4TNxEoWAFCKiOZ7zYNc85TaN7Sp1HZXDfqfLofkW3WrqmaXAZJdBzy+Sa6smRkYiJPy805V38ZITNgphvMnhTJWm5ldetaLcGx/muXLuzeGG2wfz7VaXqki/Jerx691W1YuVntg1kgI5Yo7TY3mjebt5rvNHQqmPsbHC/Od8XeLr9zb1247zS78B/4f7zojfeY5M9mRz3o8M+mcxWcHriturrVYU1f1JJgtZ0QUlktVELcEVsiAwhdGVLvu/zehkvfOVJtNlQfBlSnj5uqj05xH7dcODq+66kXmW87H4XJn7jRc/JU0NW1wnkzCULoMiNYSB+qtCkdZOsZ//5chJh76kN1U+xDdTtMvr0OwziPPmtcKqbqeAyvw9iY8vMePV8P0y6WHJFQM7acTENmeOk6NZZ0q65p9SX9rESKy6UFX2looesLzHqbGvymJ9+sooe85elp034icymp+lUZEu60l5oW0MHZT/9RfNhQJJK0Mldorfefqfd4f3CnndK1QmqOPxP50Pvp5+rTz2Xb66UjfaGaf+GOhF/Xd9oL3Qm8a2TB8Pb4perxSxeAL9yfnylUJO/gWNdtyO2hF2bky+QQ0gOOdEhz4tOVEep28NuUbELJr6ih1ooDXcSH5qHuy1x6Kelp1zS6fFwpmiGPJFn9O/iuBDCrEQhAvN+MN7OvAMjnOfieu2Ax01mgPceMQN971lGK6tBRxkr1RpcKa4zGWEvGBIR5mtL7nn6/UurWx9RAcpKTKtfCfT05pO4wy/UJHWuiXQEt1E7QT4q0p3eKdZMSxEwnYroOck2JlcHIYPfcroWNL5676GYBNCdQVrYSqsbi7Z1UoqfbiyosXFs6IiNMHJWF73rmHbLTkwpqK8NUXADhSYbJPnTX9hP7p11w7HwT5EnQdkFChbdaHJptUyi81ZMPGfE9W3xRMgpOW91+CHtwFTlEtb2UfOgomr1f6dOO86mV2GCPEhtkqSS72EPStlPYnYHs7Ijxnv7s/YqfdfCz97loE6bKAPK+z+UsObOq/Pst+J8vzdlFCM8hcRROV6BEehxrlxfXQLpwOodNaN0W3JqyhB/A//lbTNO6VjAeqxA9I3pptvFXj/yhVu4Te3tSz+5Pyq3f1YMBKj3C1k628u2vaYW8EqeaL5qGizoWrjrjB7Q1dXDsps5y7FYBCf3Svec95dCzAbP6fa4NeP30lvV0FRzZD53Xb1cCU64elmcGSqkCeJ46VeZJZfHTYK/1sQP5zcvoRNNlw3lRMc3Gj/mGgypmoUPzbX8KyFMY4JXA2KdXrbfDfv+dURMY/BG0xCjLjc7GO+3atpvNmB1N6N384KHtDpOnJsoBukx17D858ZoYObechGmzRvU99tH9d5fCGNxbAPY5Csd3SRzwwFje3tCRu1TogDuu0b2AYDaLxhH8FatEIiq0b7DQLsRwBuS74WYGGAZzjLlWvlW6ECBjsFQW7QUIOHRUqZOKgQ7wmpyKYSwtep1zgi/2JECBocpM8iJM+vDFtBYsFknUX6qrc1a1Z3XCawUQSTStUwT7Qn6pY6udrYPC3tUB/AOMQ3TY49vsF5Hk9nURawKytXd64UnPnp9PtoW/GM/2YaYyjwwxFNv4S5WGlO5nLFYDzxuc5tgqgSMLxWTb6Vxs7xHbtG2ItkX9DtWf21/2mau4Dh48/6SrSt/duTyvgk04VbUDudhKoJAjYrbENVHxvqEj17sqpqX+cT9LWOvXfVl4VtJIBolyK/UMDySxJZY3suvAmOJtWdLbJs3oPhXtU0UNHV5sy6KajymhFnSNm66zz/76GSAD8/Ozb/CP+6j/ZJE/9v3lAYBBrAJz9XPzTAOrtpgCRc7b+5hqtT66X9TX6P5VsostxHKs4kg44pMH4r1zcMoD+8d7kjWKWOeB9euOaq2KZk3jWRwNxTaVzXpgg7cPH6pSbc6L+n7bOyUaEA+Pno8jEcYHsqTke1S30oGEwHgvL0/q/VO1L8Q75iIV41Q+YLUDJgCovzFm0BlNMG9b7RLZ0X33oMHcuF/IjfsuM5rc7U9xl+FUgL8kTrVu/NEByUO2Cui+RrpomVi71iiYRnj9yq4MR6VYwQidT4JTjO0lE0H5WckWqcnoWbv4kZtshCLnN0U8Issj5RpZJo003Rg95ZsJsmd9FKPRMEYLkFfXFdprWHV4R1T+jSl4QFsZaRzcVbbBSNfGbbtGEB/iSOK7r9oKbOaa0RJLJG39CPhnJAtxU32tItaxGzmZ/HfymKlUp9NwKo/9L4QrA8wVxQNd4CltYJ3wTfHbv6nvNQEwtQQDKllQ9xF81GgTE2FtKKdaeZ/7edrEcjumPnjTRRu6vk7Vtr4SHpr5cr0eJWFAJ+8XR/9dQt+dUoXyu5Q5z4txBtHVVGxKAr5rkernWmVdJbFkgAiv44tT7JmqBib21GrxU0jZcaWr5iC29Dbhg4VsPQtGyUeriSdFaB4Q3oWqeuAm6+depuxNMSb1f/uHX/w9EmsLTJtfOuXE7rF/o+yrRltn2KkOLmcM4Mux5o65leyPLs/gnXEMsaU8RJSXfr1C1lvicsu3G029fmnlXbtK3SiTNtxqUcqgvs+okl3d1JvaB4itZSqLlcDENmE/aMrc9RbxPPOZSui5SgTqguD16pW6G7mqmfwgVwn6t3+DMFHtXoUNLhaqUqsZ064Nuk698OoMStepejqgyGa7e17Gk3/ds4zPY/rlWof4TNWuVFXQvv21t4albVjBZ66puIoBcx9fLR8WCEiQJ/9UneaOHDcUv4ix45Hl5dxduFT20HemOH9NOe5JfuyzfS7J/8EhaMqnleY2ZZLMuoFLYaUC16GyzzgwvLqL6HuJrpv8KW12FOWclMlPPcLMNh/A9mhvtOdJyGXMR0qI7RpxJUoNVZ+daomaP5X9PFnVj603jUr87b/yJ5p1hKhUSrmu4Yd1j4Uc61anj/rPUUACHNHshQNrdtwna4+r8VXj/mlu3Cc87hX4FGRYP1YMdzc/79EMXXjXUy9a/JLzbFsGxylqbls8tVXdIslGDVVnneBQgfhYHBjk5MphfvuvtewyBor05A2aN0uY3/4r8YUxf51J4qqjFRDyVriwkYusIsYXFVCMpF0WeS186y6Kqpj46JLwlJhcwjTqb7IQ5xar/b7yDgL6J8PMXZZqH1BhDDb7KVia72HyfQ2ZlEwmRA4mmFPraCx28K08jvij4Z83/FcoVjArd9PH8jSnvuuVcVRSWrXZLdnJ5ecyYyFv4i2eiXXQp5OjT4PjUBxlLyj90aK+8ATzatx1RTPNKK3S3QLhDS2INfJLuZKckOYj9LwpKJUXnXFaNwxwzMU4oSVM8e/yFNZkAKZL0+3LsfC/i7Znia0mDQB3I8K0R4PtwT3nY5wu4yhzbDH71RM6A+BZa7hjeK03NEWU9i60CtV0kYw3VmHGUDbjXskhk8yLaBJlqwgds53hxH5WAYhLshZyl5R+VzbDpVJS3ucrpiOaXRLfy7O6/oAISMfj5oJjMSHpmNy6CXlRcnLJ+QP3iEzUT1B3atlJZ+InZW7rembvcULndaUTc5IjZ1HeTYn7ph1PoiqLyytJViLUnGdCJkUt0weWNjfuemXAPD20f+3RLyuM5Wn2wZ5lNlbU0aVNQIDC+jEfXKEcqboQbGf+dwCAy9x+rQ8BHWQdZHY17gqqj/EnL6OGqZclGYSfIx+MT/S7K1tld2TlIZWlb1MVq+Cr+JhNWdtU5hqqtLYogoWTq38ndk5LbCBtqHx3VlE5/cWL4i9u+r8ga885DVgquPa1uS7ezbUqPTOwdwgYRoLRWbsNGaVRp6r3+OjdhunWNp3eNVtCy1hizZjzvu2KF1bA88jnoIMmDSdKVDi7HSv0aHWgZi44D+M23zcFotSt+OKQzWTx6P0fLvIhmwfmSG/apzpjdOkZ9vNYfYzvznIopUy5x7fG5Zk/bCpl3lfKqSw/SG/X8ESQQ1oogpBTK2FsRSt4FeHR8XIYLWRCMyypZuoCyrvRYgyfxKMRQZhy/jfAbgCiXK8clT+QcubdpsvLkcpjwuEcGGG55Oy+FKtppWk+0Fmf9aViU2eGQXdrZFFy1VRmpbQzjssU5aviK93b23Y8zbEd2qhWu2UNYQC8rgbWosluyT2uvkes9zY6ERanNTVJvJlmVppHxfw6gkX2yYJWHsNhKFagN/XHuvxhnQ6M3Lf1bRJEjzFZ9Yk+SLSewrI4++yv4Z0TPmJGHZlxa6w2MLhANTihqy8Y5z7Adk36cyw/adIpliUfdqDVW/DNdWyC6wtzC3McZB4gOVIFpAiGHlZAe6m9HW1EAzbQh5S+WEYkUWmSb/8FQ5ox1AtE46ApxgMlBSlR1ngYoewExL76PwGEVhZ+gNuBFcNip8ft6Rw6aqenU45mjPt0OA8jjGGEsbzAjH3XnMgyHJ/EMYJ+9uVfQ9vD2xRyzUDlgFVRaLluUFjBSsNXxjSU7GYxT53mCZkog5c7q2p2eIS6zRMnotcAdBM5bscdumCBcJ5dunvLKQTUyZrM6MHv6QYuRsb0Gcj6OMN8qEkULghjeaXYHYqGyZSOdd739Z26PbxuI7l2jFxLtWRgsEzt2eviffVG0WiIyNeuBji5Os4HIRXGUonax2JJiVGttvplT9augg/+QiAzbP3I8JbLJ9kJxy+CIVppR2I8EuMj+DazAvaa4n0AeU8tglHm/eMmZrgbP1bvj1zexjtN0AQvMO3roTkzxzMLNgCCNoy4fGAtjfewS2ct/YXA+FUSszPAMRqvBDUa17iGNilWeO+WJs7Ihj7eh35fmb172dcBvRX/c0+tXgRzHr/spcsBkBUX/3Q56QVpGuNC3+MNmh9ZbIjIOqYkGEr5hx/xIwWUBRBTi14QB4tnJ/yLLM8qC3lI9WPVSraWcE++QcFj2BbX8xBFq1V7dgsvy/EFO3lbTd//VPzdcJvjorGL15oA8YJVkP/+feuJvrFcU/J/hrCotcX2pGqgYoTHr5lQgwDtGGtc/AoVAibTxtRDpBZey7IHr4EDgYd6tsoB+c6MDiSQvcIjBmQs3a9HyXbirFsD/XggkecJHA8P8S7PeOxVei8dFtKdSJ4ZD5sY26tYa3q44quPetASqNUUa3Vaha/07VsPZ5mbubZS8/PVZtHFAgrDfa1E9W++4X9B6L1udwul6uv2huKoDMdQwcG6y+ivybG+UodsGYYXdHNT3dbcctiOx+FV4r4R8EePM0zBZITymWV+7MFahIl4H/6RUs23UHmdAhlNHzxmaOOxJVqFqwx7Bs6fhUe9eNRDaazWwSQcLRRzizV4WwFSyIIzwsxC0HA/EWEaHgUW+fYIUgcdfRsWlk8A6+f9Q6klJbjyQ/woR/eKq59HZQkw90gAWwbMzZP1RYBPCFhqlBTi+zwqSzGQS0xkycW4Q4cFAHrrZbvbKORdaLNBbTYaOUKWqCylnVjHTECh0q1P3ODyvpBAsRlXwks2AS2xHvyHJoaRwutGbdjtijr2LenONG/kn73fWLF7K5NA1KL3xuSQnNEyaXRSIJG8UzvLLnsD/Qku+rrKpILz3/QIPpU9gPK0YLuXnnYvZTsecy7ZydudKOnC4qSAbnaMZ5qtgoqmkLR6jEGl17Uhyp6ztmgqEo9KSGAt8MrUQrjaZxvyswyzwrh1BAulYm+A6WAmWHrQAX4WEt9qpt3e293MZJrjTP+YrXKG1SgcPlUP7Z3U6I3spPLOgZ/n9i6j0r3Lye9oh3W5kOuFSJsdI9R4B6/9AZl99ahBksr9RG5JcNnKrzxbZpzncc3eqeS8LhlouVu1GZFEqLjxRe2Cw0qPy3gs4UPRXr45a+Z3IM6jksWMneudCWcSyKwICrCwpRyGSmwYBz46E9Rlfc9KsF6t5i1kpW7GeWB1sLYPgYUbyyifS8ROS9KFqa5OhGjGydcxEYqbXqFMIdnEAKlm/8yrp3qWVg0Pv2XJeV2bLVqN5fsxyoBVQYkelkRcQRlpd8zihfWlSxb/gcDqLYPLHfkNt7OHsJ9nlfc4qtnWd90lixTjTc43wydGqE47TcrfA7ZSxEclQAyjjV9VVnacHxL7Giua0oJ/tcJ8khVJKc2sT1+Z9+qWnn5g6amrVE5G0G4JzzHdSc4aOfFcf7libaQPEs8BoJHjNqb7mgdOpFv7K3cEPO0NFz05UJ51PjpxncWs69buZsAhseoIQ8tG3ZGz1aVbHzbjB1i7kPKxABnGJ5yLZb8h9hptDlxcnJZZifR5L9WHCKBSQva5efZv1FhbjFMtfSZhL5gtIunkh00ar9dR3qVZWc+fW9NfQGd7tLaz2/ed19RXD9Gwbkvk+qifkN9O95F1I5w0sr4EPBNRR+AEb3hobWj3yaQAsmKCARNbSk8GDXpo3qNVgX/CCqgDH+41VBCE/e4jfvl+g97C5PKcu+uwJ7OJZSZeugJgJdKxE6rcZKE9ACPe/SejCWz/5Rd6z59hjRN9tILyPONptxwDOFGZwzVelxiHK8HgxOWLeGYgsTwqip4rz3g6rtgxLvhn2qunTn6K9S7GW1g5qPT5Yk5mKgnBvHTxaIqMhWU53HN7w7qtkTqsjzq8ATPH+oOY82cvwhv9IM1kuFZBWVo39ownIKvj6hdWF1nHtj9sz6erDRLWZSH1iEJWs8DahkKD87l88+xYcVDxdK6Nk//GhwUbSm57Y5u1ya7Whqi7dEIwXhueXcNjsxpPU/nBmg1jmt4xr3MwNc7FC2mGEdKVbPD1578bNki/M0yQXhkLpD20M/wH4zKXSKkgXZvkV0yzkUWjepaCDYqcQMPIEM+/gyJjpPjzqrRdzqKTZXjVFOVe3zBzjs7HjCZjSRF1sb81BAupRxIprChtKSYvId3hF2df/J04+xn874u/a4jjmp0X6ZIYO88MBBNYahNbjODRLwFxpRPE5MBR6/vLaRthmDWsSTuBvmdlMCffAZgTF+Ycb/0ZQvaWdEmswzGtJJwnDsL44M2s1AwtDdaNNgExcmZspRxDP8rM5BIt7C1Z2duG7q2QLTBm0yTeekO64j5sdZbzeZvdajvWad6xjS+glkMeMR4Vo6MjSAo5vXwd5YI+fBPhY+bch4qP3ypMvOvb8DAWzranAAG91SgQB5nZqhMyjSw2uV6SCr0ATjcbayBla1CfX7mec4Q3TN4Qy6x0M2UzlzstMKU1ZsZ6n32b9Nf6xEf3f2+QxGnaW4TJNJtdWBLOda3rOeg2Mpgox2hJBuZiWMDeWNCZXgEQeR7o2LPXNdOdI+SxoWFHOoI7551U9IvDvngRcUmzvHPcPzysb3Y/X5d+aAP72df/0WdWWJ9Kx7Vsf71iu+r4wQ7XpbxtiOS3c5J+vkzp5WMwu0kfQpykxZSjHXaG7VwXSyfLfNq3VuFYyscrviEVQVePc32VzvjIr+rLCUaHMNm8CZs5qA0HeGikmcyFZt3lOYulwsFU7h5GofT1jpm6aauRyKM8EKaMnCiHhGs0uaeVGzy8DIysl8fi5+eoReWYvvxbMWqT+xxll/yz3lprvka3Mux8wVNT5+HZV1/bJ+9f/UoeC7jPvEcQmYj1SmamKnBO9zQ+oOKcmuNgTTyxfnZvy/sv/WggUIdwUg302OMVHHlHQ5d6d7Y4LwzAoo6lD2DVHfNFDfsdINOVlHIesxmWadnJP+rKnXLm477vY+YJz+ObyvhSqPSYSd7IuZwDD5/zfO+Z57DrUNQ1pcmqtMPO1KEce6ZVOxM0kEFP80QOR3uI7JxIYpkc5Fcwj+vMJfP8cjbC6pkK8Nt+jOMkOoryR60e4lPhJF0yaYNCYVAGFhA/R/JySaIByhwJmEWkBf6Wn8B+Dr4gME6oiA2NqzS3alXnfcUkr7E2L0pmkF0WZv4J75ZOuLEzMQS4WwKQT+qqe0gtvvA3DJPMBaWefuEGU9KBdfs9rJtcFFsp7ZyC60J1/92zhvifzj773+l0PH+5i6RJJuSYzhLj4Z1TgsW9dBFORj06RNTvxRiEF36CVuehPj22gTGN8byZ+sBCxWM+/tOfWF9I82SnNwnblDimN1nkAZWtMA7bBAgDzTieEOPxER70Kfdmy2nhjOn5aKWDYBIkWpbIxz1+fM7Zsn0ReNYLJglyoX9OME+2eas2YR1zrpc7dB8VHLpjN3TwPrIjBugodNT08eIJHhgzxXRkkY9aTIwWu5QlqfiZdjOfh06fKGvvU/HJQGCzY/hrTOXI6LHM2zTIHwU7vF4fP/e1GMoWz2kbBG+HmVsNwKP5oKG50v5bP4K/5aQgELQBZc4U4+cNSdliqpZSnKIVYHwTPWtHDZrgZWpTNC3sk8oJHRkBdkkiZzMnY65nYruKRM11z46lxrc5KJiA5hXnpcPhCDK4f3BoRyesJVOKpMUOya+PYMSmWFuWZKRJMBiEcypyyfkWuJMW1kLX2RawyjWFfy2pVHY8U5wgErxSa7ZAa06MSs5fvLXIxNlNayY3gdMokzMBcJ1yBAavDGySk4WSdylviQycynCHjt3z8sRHmRsUKho0x69qoK6J91oxSo/WkxJ2Hx2qnyowq3yVWwGBdjzgwDvfFLauZ9q62D4JYTBZUF1fTG5bdknhtJk4x+z8ZaX/c5io5z7p33HXJMXCnAf/5+UEYGYXWJ0C0/alqqgW1oWfTCxqpLdVW1wYWKs+xWLtCJ3tCPHOqr3rzbAPpgCw0XZeZyngDzLyzSn6LgVnMJsn4QvKeiyZnvUbplehbBJJmEbDJeePeBEmp0XY7LBZfdyQTMq/fK6cHWFbmys39jQ87et34ul8uQgVAqiFJcx6JTU5LstKvocbJ4yIEZPgZWpt7xmr9eWRe58ASyAdH4pj8RKr3sNkLeL7wGx0COK3cqCN8l5es8nAj4HPrllCQ8kCi5iZ7tCRbAX7oYLJNba925YUKlbWWLWyZt0+IwWF4IEFfI2uhXtAHMlijkdklHng7Pn0VYkZTl/ikGp0UGkrRr++5uiukd8s0QDqtnVhi6Nc6Cnp4EN3crZKqK6LCHj5Bh22R36zuZNTMKtFH3xGtwwx1g/WVHrN2ilZZHUNHB9dB9URhCHOD6rer9DCdWNoLmPL4tlwcs0qno1iW1y5mFigaIZB0mQTohTMLBNxnV2LSwurDOE57StvbtgMSqSqcY4GfF0EVI2TALZuEROWUu7ztmI1MbASmigcjsNkFk7OC78sOtc+Rts/N7AuSmcKdTjZrk68hTksfHDWrF5MIhVOaZcRQvnp7SiPPb5GZW8ND6PLyeeHFOULL0yorzfdjTGXVvsi1N3l3vDFUO4dtDAskXi483bEWecwPzb2sdbIiRibLBgrHV7MHGpJXHQbkV2k9UIG7jaU0izh425F8E/OD3d9jIHsm9mTkSKE6CoFfkK1OcibWxNemam+6EGjrnW1oxpGi/OjJD0cjFb5+U8JltkP10fa6aGej39nUtzHlG39iHKILSj7V6qTnrlR4qVW7AsupFujjTEasZSQDA3RaPak+GCJgnHZwAQCywOaiidicsjWUgpaGKiHmaFxQMx7uEXKLuubbmQVXekR7OrRX1ijP1k1erfh3T6vNaA+CDTj+o7y5I2PJ/kTkPz5lyfPTmbnE+Q8RNdXXh3M9tH3Xahs5S5CrBN7h9e3FtGCahp7WM9+XeWY09rurMeK9kDZCbLfeWfKBZOiOQoPrdaFhRelBxDiDPeivZ8omVPUyzo+zeE88gVx4EEPJm/I36k7sY0ez72sOiI4aqy1vhTVW1MU75711aMXztzV80uswerhfEOzh8U3tvdSjn/8896weZHzOzMEyoAqyHd3X+pH6wwrm4TgvnSZeKD1zTtI5dLL2Dvi/TXQYsu7NYxeRGnUjyYYueNZEllrbq3l4eNnTIsERrFzNs/5Gc8rWazi3K5YYfM8e/ElC5Qs9qspfmVXX6qjxHPjw4l2OhmMnF1QDrtsXUCb8GoDVC+YxnMjsIh1BtVyBXQQq5ImZdEMPm303Zkt2PAlA79q0+hlbzmtXjt1P5l4FZlwUs8SOycaxp1QiojtdchMmdedUIhGY604rxQTBS/CYfHaMCCutUgyMCkp8EbWjDpdaWHdbFDg4WwQehaMvf24hy3zQq1otWCO7nNj0jA7kTdzLTCHaA8r8a21avK0Itsxnz+8R4ZQ5XVUBCDd7Cswqc8Nr4qjLxEBRq5nkKoGtoltfkORgetMTH576t6pshKFXqDXbqP01lOlgFqw3LyX4l2Lzom5Kt/s7eSWVtVbHQaUwrsSop4xNd2IuIa+F3GOCxJ6+DiJ1IRkCVLifsCzQmqT9w1UGt5eKQxH4T2B3ErvVL8hkB9mxVUBVzJkovZXeGFWXgpYp/Pum7gP4CEPhiz29Jm4xREu8OZmgC8gs2En710HCC001+AJV9CekzkyA1s3rHJRnAVS3r1Z5V0YvuseWelxYdBl2KBDNRMxVUy4eibyeVAgbXWs5ioYc6J+xZz6VcMa81kwIIr63jyJMeF69mKQx1IznF1NKTG/u7lTctP6zoUwAAuT9vR0k83ckLB5MgdrLX9+ltdvFSxKn25fY3EXzQlJ4eL8eEUTk7m5qKwKP1d3CsVTdtuwwpzJafXSTYINOsfDBDN0pXGFyabAWjBcmwTjdqgyDMjaJBS8U2pyBaQhHrpbBDKJbTg6Jm8oviHDEHv971+t4X72Rd2XXTWh9v/9K+Xlca8iyc7s3SE0tU6O38xGUBfEypaCO++Rp32KrWtQWTXaM3gVpMfLnnRj3bBXVg7V6/Arc3RHB96Xe9hdkJHNSq7mTcpWz8Q9jdGwzXQ1LIk0PMH9W+aAhzuGnpynVijMJMKb4fkP140d1qm9EEu+gjBdTkwdtnQcv5TVdzI9bHFelXEOApmFrenL7HaBWxFWbbiC8FYnFgrneB0KDfMkeb4qWMaOihvkkr0rQMJR5WjROs6rExZPADSsig2ay/CjTLr2pp2X3uSvlgycLQ2k6wKJV7VqOd1wrl9lkrlxOrSyOj52qvToNasXqnYVpRjHuuACXlhvUpfQE6A8FlyubBIP9Gc3RrJKWYtqYZMe4npYPLY1grAKgWLNMSzopWuTyUph/XASv2xSyexwhuXVhohaIGbhS1RQQ7zOHqr8bAxizx3kEoSmE/qjSmznrgB76YrV21t8L0WXmUW9/WPcJGI5Oa7OzbUXTXG5YEHhxgOsYIhl4pCS1Feb52QYhykSpQZTGyZ2+TSMv08FSHUAJ8CDHIqGxQqXSNW97o1BPI6n8SQ+Or0B6GEQc/gKq1Wz6leVWxmuHo3Zk4CLT+7lq6dVrkT+ydNsldb5U13SFGuMi3o7HpGufLab7jFd5k9lGXO8im0a3WvQV0+p6Q4RaXc6DRPiy0hVPif2QgETYfln6EusWczcPqur72RLZP72/9Pg78DP5w6Exw39Yo5f7uTRVMIS+iHwdgA8gBHvRD83T/7tH37x92A3GvMkVzo1EvU1sYIRn3uLoF5KV7Kc6SX0JVkICQREsQ4S5JP83D+XzxX77FSo95gtFoj1Hv/kT8Q9ErUZEYlrM42OQGIsQWCBXkpx2LQmKycuguQoBKMbpdk0gLU0DagaLskGXR4wCQMnTD1KuF6jgClAvUlB9zVMwDOJqFjiyRL2NSnJ2lNWWbMYOsOQfSzpC7iyiKB1H88DjIo3EkGLybRdq10vzt/MtwKiGdYBxn5lck4YneVIhGWL4xf4pg//EDh465CLHR7Li1l2OramCsC384KhwgZVGg3oKkkmvREirrScvGM0CqbR5NRQPaXyl8F8joMRJGh/TKMFwrwk9b/3+NHBo51HD779VfdmG/o7IBrzdmcR4k0VrkyJ+CxiqkK6VJViKTcvTrPEy+QWbott6Ov42clha0r44BaK7lOAzgv5toQuXonUUmUr5UwO23nq23sspj8VCKXtyQ0ZD2v4DdNSuAgjdttDpWGtKDUyTVCsNwWHZPDZPorHmXjSJLVMKRD0/nEUJemihbdwUtAPyRzUzPSGvvIDq7gtCGZhFVQR6s4e8scAFFEEfChvA1HxzoA2DLBGZyZqni6K0YUiixFSvD0xs/avL4JZlI6RZ3NE86n5TbvwJjdoGVPFQ0K8jGsR8SF/aVsyrWDRAts2BSGGaA2VBSQn3ywcaDOGFQ8NHNMHSUlpUEaUc4e5m6+lcEVXZJajBEiJan5JRVcde8jDsGQOqUnff9zuXkvVGgNeVuKx2MqSTgG8nkSBTzivPhIvkAFB87OFEKYOecewYBIAmPgcuzRZF1BYkPEoCAMpKBDYhbITAR7ZO31Ltimy7LAFtED7DkFqusjR5eZhaETZDYbeg5qc+3ARwBxJA4erXt+GtY3Oj5BumlnOD5g3UEhcRnpIACrGsf0lOCJAA8IR5MNgw0O0qNsj6wvsgPvtm9dSOS4YXYwpz5PkImeOmjWrYrYq5otiH4QLqwm9EJ/3rtfv3ThuNMVPOlvH1PFPumdf/xU8w17cOrrIXbg0FePRvMez58sjlBGSOgUsEG0obOjCZ5SiNlhYOC1nNk+bZaKua2XZHybVxuIefSqr26ORcPztfzn78uf3mqI+6DYHG42zL/+vQffsq58PNm4zeWYhHvrrW2mSQ0bRK+CdFyB8wlc3NHIt3D5Y/OFBkBLzoKjfpGt8o3iZmDmC9Yt5C8OWSr2fJPFLwGBBOs9IzXtiEc7AuhDvZplRgufMs7K4h1EAUzP1kT18hR1Shod4CXJx077IRjYIkFhuF8COIhtL3O/VT/5s1mju4C7Uih8AgCW7wXxxf017tU774ZCYGwGXfAJLTCpjlPnQ3300KlDHyB5oZcNwb21g+w366zYWhhZ4iVCQjXOqGqkmiGnWcm0DEWkSerx1IvUbJGT0xFKhy60T7FtIAKCDV8D6m5BICMMhKe1UVZGWKy27r8E96pGz4WIJzdszMjhgUdNiU/sfklxKc6emwQ3+npgQ1dxtgZcoWdeTxkMIqTw1GpLizr0f7z4U73+wfffx9sHujth7tPvwQOxtP95+797B492P4eGjh2KtYtZuSEga0lx5KlxfdwpcS5cuiDCYAtjYKUHNjt2FEz+Ct3qaotWnmrD4X67K8GEIEwOmGkjsnWWCJh+6E7dJl7XvGcFPfSykExj9vgv4F5NFLtAXlX/hjf5gFcnhhq8YyFMr7yVl0boInKIjTvFk5TR/BJQllbr1ylC8umQ4oD/VF3pTX+lqqaJ+Km6IVw2LXuoJUA3AfuWCTVXFqfM9BN0fG/QJObUoY7G4ceOCoM/bXfjfxqcYGSTn/dGc3nxCDIUj5Kab8fu0eM4N9EW5jXJYUtjoL/653ml2Gk3XQZjFpC2RUPyPsayHt9U9aYHl9GZhJeBkGu+ZJ6q07oNQxvHgF412lzM6dhrVhwKr3IkaRBKvpnMlmOrU96JBcOkV3O7afcIv6LVJf1wveNuoho48cszmskXWvBL+tNcXPIOnTkVi5lnyU+wv+7gbbHOSNB+bzSk+jKYCu9qABUldlgmxQZAMe2Dl4FYRZTL7xQ5zfIMVdbHtFa1SdQHFDFPCPVu4RrdM2+N8nlwpJ1GF7qBhUAXFdVAxPV8c9A0f6GD298NZtEwPwLAPe5ilJL0s4N2+zaqqjgEmpvxlA3M95nxY1fxYFzUpio7ds+tCh3qBrM4GX5x98R8oX0IliX1J8no9uJUN6kTG5fWoGxxnAgRYdPLRC4AwhE3QMATIGlLGd5tVk/b6wcvEEvpAK4pd0KB1i0CrGsqVX+MM3GKMmYTQEZTLisvDdlatFBW05Kx2vJKjc91yR91zdnTL6ahzfogqxk75RMrl0yorXOzcwGvTK9dZq3sBouV666zD/Y6qZLoNyR07gD/iJUbMIUmtBeHKUwbDCFWpCs4pQWH/du/h3Sq7N99W7/GjRwfizuPthzs/ETuPPnh4sP8m9nmwOZ2JdAD/DMXOBCYIvRS1bP2qx0BEuZ55q+zVenw+ChMwSKIpEDFQVmXeYFmpjqX+i0Z0mEbNm/7GuAXHbJXhBLb15rS+0Oi4CAKs0UGhd/A/lUyRtTGx7BBCyWeXZPHLiJE3gmOBxVIZzy6jp9KIlkwZ+V4wVbj4ZJJj4smhxlMmzuH02Bj79dZ1MWmsizvsiputkSjHf7JqjicG95HGfuSd50lmnie+eS6Sg4VLVKY1j2ZBctrLWizlUhAtdwa4oyTiJcPjMaKqgtRVIHWqgpRb/NIAHQ5zdGH91S2detZdNwsU/mpwvGvVgOSzLwmqVlWwfAr64rAl4TzEU5eePBQZWgCqFWWs3pt4jaDLF3YdS+P8WJxnvrXkkJH02SoDfyha4NwWit/o8Jkn9z46uPdwH+0XsGd2D56uZ5yQmWFi8xyzZOIxTGzpbqKFXFlPcVF3TWJRjnoaBQO6mRYMYLeThIJ36eTun5ziYbY+MElFPOIjCI4csEKZTeFO/Jzur1PDjAdqjFFGuwmdgESITV3FMnMA80f0V9/U51b8k1cSTnTLRHNE5nFfJ4aS/LRB199luARYxLBgj6nlKp1qjo3kUc5FUau2ajJYNkUri+GqrUOh5i0kxTm0baH5++bJ5urFiWMzV+eZT6tTqrIlbdEifhkm/2446BjQyDdSRZQzwtrXtLId//u8SIu3B+VkLtwWVFD3GY50TE6W8d2MWbXaIGF9Q9qofU/1rx0YgEw370O6Csg3Lh/yjTcD+c3LhzxnfXc7a29QXNXuwM12eNZ19O2vte22GsCmf+NygW1UVhg4ECMKPTCC2INYuK1azRKlW66Ny+IPJLAbH8UYyFxN6259ytCCncjNPKf/8Jw7ogqTgO2uZq163Lj5fcD6ewCfZW92ADuP3nsPXu3evbf9QDx4tLP9wPJjLmfRC8AkFC/ES/G6bD/AxzJ7Mibasv+3rSsCn9xRP17AXkDFgIvtQ+vHHbfATOcGZl6MZy1KTK4SUwWzWTSOnKRx3IyukPWOo8lEZ49Fb9G29BbdARW5izqVspxvKzWLN/s2nXt+sI372d+IXZiDs5/9kzxc30b9in8s+Aqb/DpQrwIqvxGwCY+trvOPwqt+GdyCl8FpS1eD96CFDexy8dsLRc6XMP4d/es1Q2YReOFQeGFturb5pfp5B98aL9sKunFkLt4IptPykbwneIdrvl67xh/ho+3GZdD62W76wArIbW8DQaAFYeB7BTgsGoRvJgfRHUNEz3eEDBD3DpaMWDTWmj8KtvOk6bHmEYeQR3V/nMHqM4gzcvb154jLwp0SeRYitvd2jeD5I20r07aWlzWaR3sykfQrmgC1jfBys1oxu0KiTtgsBED6ytyBX7XcsmFsZaCZXYuSwucDz757hFMugkY24x++wulHqgWNyiBSpFYhnPU1AVXhWV6YvCAzNmtJMLxHBCp/JVYx3fw1+g+3oXdcPTgiJdi/bHTtTGwuO02PrzHCYJQtmhi+BePF0ZAulZN9moqFvM/t3gJD2eG1rjKGzRo2UIbOMpq/SM3L11klX2Ay3TkU9X2UHnx5HwjPFN4vFHrWx/tZgcfiQ0m5fW7gCD2WO/tK7tCvO1ykZt9kDiiVQ/uFcmgfU8zQratza+t9YiKnI3uKLzqzGRM7f+huXYA9Plxxq9q+U6QCAzOWnb6izLO6XWVWt8tn1c5k7yg1utKum3sIrELVKJF89q75SWGNId4KuaMW80fdn5RCzuclgXAxW/DNQLj+/dTfBd+2dFIzm4Ol6jAZz/7IyW+Ak+tIJg4RjEeam3VVkwvz9CVAq4DJyLkThqLhUfRyLjNpQErVvgtuJoVIszRJhtuyGBE9BMaqXpAoJjeK8BsqvayhclFpkLdP2CW24zHL2rmz9DoZkhyEXGJm1z26v+F/qrhCbXeiIfd+9rNfUoKe8NWCI3sbuXw95htVJJQ8vcd0k6nXjxe5Xjk7D+Zx6cF/xpjEZQzLaGHVOVFMargQPixAyL9DKGlfEPbop72Uo+r+cDZAtCrh6xtywhrlb9/YRPSKpmHDTIObbW01cS0kb5ZKiPp7OAdmqcllVpVIov6OYn9Y3RsFu4uN3O6ifKrx3qiiXGaav/21MVJ2dS1cTc5RuiCSMEQyCGcNq0ZR2KfBMFy4wdjirROHSTztPSAVdJJjNQcL/qSxFv2iyTxehLNstsXLIcSGine6VcIdqoFnFdX1xxsNmbOkr9OarR5xDTqwtxurYg0jLn4RDsI0DZJT94TLx1FldPHB2PVxRmW+6HpZws8Q3bVoQO6DNUhgZ6I/Jw1KkK9nxSmWIx/m9ZLVl+ys6ofdK93kFkbmOzZc2w1mvFwDv+7Jh92lM7cv/kODIx6cDYB6XroJIPNwZc8Zw25l+wqwVjMMq+FcZftRAaKcyf97T5xL2uL/O6Vdtas5rgCITHzSGxMDnrznbsLrrGAwr84jG1YOt3JSV/ZwLiTPO/HVyHc+GVMB6qor598f2a9Mev1xVi40K+eRi85N3asWiFcp/dac3ZVTeUnzdmkS67wL4feDLlcmUv7QyXaeNe/Wm7jcNd+5zEXeWTENnRzdO+ckdOfcC7VTlcV+h8hc1ur6/cB17bNJGYtaGmPqu4y2ff/+7sN74uGjx+85bS/vqNNEtqr4HScxn5U7/nzFzE0ZRmaOUUEK+3pdvVF1tTqNgtLQuZbdhrdCgJqgfBAiZyrdsbOsAnYWqFb9i998Y/3whDvl++qh687tT/qzPONSIYZuWSmbItpwCYORuMFvKsKWAreuBdtGUUUi7zxUA8JKblzMVjIS0JuKPsdWJaQ9++k/smuR2yueKkEYv8iUi/BWDHRXClcJOV9SfTpCoXtC3It1xl7/pOuey7pVSLbocGolcNx7Tya9PCeUbgJ7G8h80XM/hcLBBUGQWj4ayJyZp22dDb2ef6fyrKspL862nqtm4E/Zpg4iexRslsdBXjJjlnxXR6w1lMB9Nxul8S7Fgt2X3ZLpI59TH4x0poFN+Hd9UKoMtz2VP/l8ovsS4d+VEO1IgKhNdTzwJHVulQ/6HaAj6q/h+3cbOZQcNF5TaR+8PTXSFYCywRzvUoHv16t0lGI1eahdxGrK5ipiEFmcVj85FHnsShg9H2BcCAgFwFojS33voEH1Z+pOHLAl6YqQKIoyYC7K4SNBsao0leGWi0xeE8F6HsOiMJ5yUL0oVqVPRTw/WslIF0THH6a0NkJvIIRJ3Lgc4MqhKY+fK7SWTOQgJvXozfAC5ywfFeufwoLTbYw1eV1s2m79SOL12mMzwcO8WVTRNZC3szLugRPL7vYaZR1OCis65x/RhGl6hl3HAPECmDEWEdbu+WF1UxsWm+erfDfK6snVSuYNh1sXNV8TVeezueSxN/JjV8yF51iTRCZpTdrXUKs76lZXr6oGiM7Wvg4wFfz4lwcfpqdMo7QK7/fKmP87JlkcVZU5ZwjW8pn7bJXVLtiSgMk1jih6tnXjqiPLlZlRRw4cQRayc1APy9wWUK+by+uTIZSZzngW9mR2+sLwxQubQjZABVraalIcclpKD/WrbNFYhmG/mu1bximrLLwbXhap9nX/3Pazd9TiD/t+w7uaoNKp1zBlws0Ly9GblyxHzbY6Xw36nNZEwTbyHKb2OfChGhKoHHJ6C+S865I/rkrJcyVmKPJyU8U5DtwTg1jmMRjEs0U0W8oCUxudjXda3U6rc5Ormch6MLIgk6xIJVcyll6pmXI8VDLqNpc3Cl9OTsV8Esxm8GIYDiYBV7DigjpIy5Try+mCav14GGERrkdc0ssUpeIUbK0x1bLDiHE5c1gMBbf40SQcMqxU0QyIJZBaLVAkcYJVd2ojaCKrgqViOVMf3cbidrIskL5peCOFgUZW7UqhfD5Y0ItqYGIdLyRm9TODSvejZGEwXbmI3bkwclNMAXUsMjMBa3EBdB4EyzQU21Q2D/O8AK2CSUpVqSyvDpOpXeNiWKqEnNVCFQzXJ332xsFx49StsWibVRP2M6w4Tvd85Ee11WMecOavk4zbeTfdhw+DhF8fF4/uNGzHI8vj0AtPBN8D2PoRFrW1bp89hBU6A1EWTtLt2XA/nEYpOYi2gXejYPYEpgnmMUz3gmSxu7vpXlZTK6ZF4cAtdCx7vbIcLay81/nzGrrbWuqfdj3Sprh1wbnJJaMny2rl0TR3iV0UtaBGmzUzV4Tz6zVwdifbTlnIvdTPfvZPfD850Okds99cJXXQ+43uREmlHfk84+livIl7qZT8N5bDUKJjwyzOfvXfzkmfK8a1RWkaJAPkcVZZHPJ87qEPNtL1KQy2SiSgFMkKFTFS/V0eya6eZvxnMdGOfaLvAVU1hdeUnaPuo58xOteRH1eNbapvOxRjnFo3IrKIe69N+NG/SlSKEuxkIMkdH8gtHK/1yjwpt1t0mvD7KRyIXmXiwUnzslJAqD1dgWAYNf7wRQdT1E2T4qUpH7EUEbbup6zrP6hMQ9uVUjQ3Fp2V0lt3IbwJgwb+xaKQi1ZKpmOaM2sQzp5qxfZl6lnq52OddrbjY8PRq20aDtuS+6+rJFY2/4Jr26rdSS9TTvuSgk5W8df5eMti4PIYFf/wxYFQl0x6ZsuWvJpdSn5u2gsuQv3M6WtuNgL2LV/1nMjVyUfZAGpQMhWjN8P6LVk4sHwOzJGi9NCebx5KWd/lvQtRnHyrV0o/nTwTKDjFkr9JOo7m5US0vunBN5fDypp/Yb8oY6yscWw6KQF8TpLqvamPjbfeHLkr0/giLHqVlLRENN29lt98cuK2a4Nt7jrpXRfqldJ7GE05vW45tVVi8otT2qQ4Py9VswXJrsiwynOifyvwJvnwsgz+q+JM73lCftfbJjMrsNJQ2JQbyKqhfm9L3QkvHqwRGOCBY7qcLKL5xDmhGVv+Yj8EGGo0vtjAFJaQyajuc76tOl123vuVYRWQ+DQzCefwHJY7Oe2dM80/zH1uddK4B9+VqGEdeJeQ5UIT5kZIVdsy2yd1a++dO1eyd7ZAqrCJXn1mqRDmVWY0nBstldFHalkpethhFaXArwrdMMSyONOJ7fBptDWw1JFFV4KpAf8iYUqXSIQi0eUNCijQrbWLoHTTQckWMufoBilecxLb5Sl/OYBmqX8xuG0rwrUhKvTlcoCKwCBjo3YpKJ/HTPEvLhT8FP5gc88F4zlIM9jR9199faX7kItIUJNp2c2ttzbqefV00bjos5/+Y62yGjrvXqPzRvYaPieZ30l+BS6yogPuUlfZa03by9+TrOM8e30BpeEQ89ycbeqa/AET9TKZ3pE0RecX+VuTl3aGIY3fkpOLbJrfN3BCwcdk8YswaR1XPK/tYevecdmxbQEm+oj2uPBo9rt0emPTZvXZLFNlvSNaRco3t4Ndk76NN0fgCke1ksTnOLHVhL7Sg1uxegGcW2tIDDIXCUa54PqVvFb1cswlMWRuuEYhh670Otl7Ft9Br67UVl+j18Zlz9D6Phs9NVfuulEwnsODo4F8M44cz1qyRy6eskr51zF4W+AF/AiVfTiEaRlE80QG2lLI+anAPf3CF7mtw4oHQQKCLsFw5iRcBNEMA6GnwWIcTnEw+IIjsa1A7SCx4rQpqBuD5tPoCPpeAt3bYi+JVeTW0WSJb/HrfCg1aGoQsynY4xyODf9Qse0hldCuHlHd3pUI7yC+Vnj1Yzu8Wic/enx4WXpAEbo1wPKLFAg64EKMfGXlccNXpfHxVagkDcowRFExo+02AmT9dsB6nLuafsmAJKEsnMhmGP/IgZCDIuj3k/CFoKm0W285glb3Bw0alw46sCHb2LSApEJXD8lTJkFb0sW8x6byFE0wwgTr2yyD9j35rfjesyXtzl8fOqHM11FyvkXFlpfwb5/+JVWzRX/cvNKZ6oev46VCk3/YlCcobTYKCECAuOUUiIZPON1rv0HPGH6JI6LHF1/hS9n2JrTdoPKVVL2L+qCeTUfUU+Nq+RQYyjCrNN6wpq+PZ2uZq1q0iurMrDjtop4hFCJgaZAkz72+q2P5bvl675uSHNqWzUiQXX7srGIN5ZUCN11OMgY2PFGVgC48Qx4UA6p4331zFE9bZHcxctabXpR+AC9yOO6qx+vgerUctIjdqmPIPYvYTk1XwDl0K+KvnyH8h8KTrS83ZVeJxSiJp3k88GkhJlVAdnB8M4smMx8k6iSDudPSY7mU4bDM1OHberksKxFmFUhkxNx1bV/7MhvCqt8PJ6M3zBZATOQBTb8e/srRrJ4nGh3QYDWaLAex9Me7dbLeAlGqd/XMvYh1Dpt42lvEeSy8sEo8PBi+aSz4dgYuy5DP5v1ShZMzfTekCruK+oHWX/QAM0fY6ot2so+tnSzjR0uvTNCPLrryRm8AeUv8MPJeqWNh/O9X2OR0EBo/1qJ1hDe8ylHRt4D9eWILETT0LTCPrp5jpH2XXzaqdNmq5VPX3ORJs7XO8qhmpo/eIE0MQ7gk8XFDngy/P5zgqWM7KbDDagWL2LN47Vm7SugxIUIrnoewgKdToJdBgtJ14ptd9SKHii8d5yP3i4tk5fSxcOOKtwjuGaZJ9ZGSNs/EUuiXTJkD8YFS8vejGebQ+vLnV+xNc8FF1yXe84iX/tNW672BOLFntBBBEs8JbEUPGvzvB2bRJZww7Kf/WP45keeN0aLsUox8V5Dfwp7MYxVxgQ1lHO7ZV/8M71TOvdU4X9lVlgLMlSPQi7p6meXYiv7B+ipsr3Z1WhjPsIDgchIkOlssv+pZr0onmGPRy/F+aPX1vWccuNQ5LDgdcrz87SJCtTPpdgiWhZIbpeRdiK5cc997tpABc+ibXKBLtgn/XMfqtJnnDQD6ghAr0rowV4G4S8kbL4tyctmSg3vDiq8vlsodVUZyowGwIDRlofQuGMQT7TiJjqKZF/Mq3nRMW1l5AnhE5o+eg1QBt6yE4OqYhWHViy6dwv5nnCWTIv3mlawwy2by3DuxJyprXak0+iWxySVDOfk53fOrDg95vo5xr4C8PTsy0uGTfSnArtsnhPuHcieBFsZb18V+I29R53DGCz+YetoBeITZB+H/+41K4Kr9bXsSBkNMVuUlt7MLVsUBMiP7rPLSEctn2DckzkKLN9Fm17XWkO5Mm/MWa5o/okOmc4yS36mUcJY+17gIg6lhQIxSqcJwaA2Wyzt5q2FZ3nY9Xkp52KXTsA0+/bpeK9h6uZ9dBGbnGsBGGdwbDtyOApBwy5O/YqhdrVEVatftSKvZw6s5D4DPif2GPWkVsHFutP3h+eErUCCzOLPHRnphlmCuG2n818Xe7qHoyNWHS9bbVpk7/W66N+yjqoSROnz1qQcfFqwl13UzVXUwVQI5w1L5Ezw122vC6vBZRelFDrg2R2H1RnHyMkiGflVrueoohSJ6bLZ8MmDtYcumMOshtMf2Mmn10Qcmv0qVJZH3VVY+AznXAqgQbpcJMPOVEnv05N7jB9t7WINsb/vx7r5MsVo9hu0RzM0kmNcqha+hr0xv3/Hid2lglwyp4rzFdtst36nYR2B0mL4HMsKKYtv01i87JPY8yLMFfiSZ7onCqtqXKheTGrDnRHvYXdCEW5ANZHhSdtyBP6JDOTek71zGVDgwqkALb4/eKhOafN4Oy6M3DEVgbWTnwTuaifzsFfAE68LwBeZBzmLRh3YDz1B6KXk/oI3tdeGHPt+lfFIOvC/mpZhu5dj4mLiRZ04raLaQL1XcxqEwyK3AxDaarW5zos4aflAg32x2sBV8KfqjFfAVLeQCoLKrC7WenyvKhy1ev/kxCxbblr3Uq4zJIQu5AevWiEw0GdyQhSQT2uBOSI6fZDRCISvJgIRiVqqijJSmWF+3VFEt9pFiKZ8wrpfBIs755aqRLsQYYa7eVtnydMa9wpUZ6jSOGdapWxBIY2hLQlWIotE9U7x86Rh5RiJ2pTZU98LtON5+ebdgSiBmw4KeETDc1Be6HCoo+1I1nGe1lZURY+b//FFxJb+4p6qEkgNdBiBolL3tN3QMdI4turau9b7UZ39vGFibzvJdxnTCs2uxA++P4uT0YBzGSgriyfZuGntWsv+0WtTb8cixHfCe5V+pG5YrvymxjSQoeDKbXVsKSrm6sMVWCZDk3/Udpjtr1BS4LIOGQjRKocEWF4BGqrRq0ADmeYhYS3podPb1f/ZDK/7tH37x99m4vzTkC/dczKJazWS1X+GDmrv2xltBSFmuzLWqnKVnylpzfYCzX/yzxyJsakDPfvGfdFm/7Ki9F7Z1aM408+DpNrLulmdIbyHB3Ig6ecR5xqW0+FVIY3JUFEPVc0NtctCsqK1eNrqsN67ETQFa6IgrNLmCxSKJ+kuQUM/cEhOHPvAzmAUAa69vaqjncFuj0LpCwkOManjl8upUoFxZ3znLlJvec+1TjeoacKMR+9b1FRt3azR1z9kas/7KHzJfgg47Sy0cuLtXaGj8XkwJgLqKTh6r9FhapZWAKCaTre978B+6hJsrguR4HkalJV4tsHMFXi8Eez0HfGF5VD+4Xhcg4ZzfaNlK6Xe/8ZJaT5l5GOfn3n/McXJNeLYlrplouT0/atSyoTzrx1G6Ko1s/YYZk2BeS0x7QVGOQ351Lxfhnx3ODfTXZmSBp8/q1eHb4n2gC4l/N5gnQdlxjIGxYEvogplbYyXe8xywhYHPDhAlwHpQWw1yEi9nQ5h2B9hXnslbDXie/K9Qfr0qA4KuFsh9JNY3t6DQIR/ihRvzIQWQyJ5iONfUOBrE9UWOPIeS/pAHGWJr3f21+lhnKTdKkcdypAMksP+GxV4STUPcRSyS5bStG6+JhWaYwu7WQegStg10RIF9OhLjuFHV2Oja9k1Oxvg8Fnowz+IsU3/dIvVngV+kt5VZUrzOix1QXVdTlqOUW8FrWW5dx3Kru4gpUDPoFi9rCyx1VFMIXpGAydLWD5MPhjdrK/jcKtUdt8ZPJ/lAGcpSd/LTV77zHvjjOrwxIYuvKBVBuauuwJdacCy3JUrdqB+VnM0pRsbD8+lyEniGKzryW++MTQe9/P/tPU1vHNlxd/6KzikzMjnLkW8CCESkKHkQiqTFj2izWAyGw55hW8MZqnuoJWUsYMdxsM7JSA4GcvHFgQM41xgwglyc+/6H6JfkfX/W++ruoUbrxR5WnO5+r6pevXr19aq8+QBQgMknk4k0Blyc4bCgW2raJzPk/Us8SkQon/FjT2Cp19xRfb4yO2fbU93HHhDOlKN8q6a2KWuk/d7HEm0HqI7hmpD6rkczUpgUp+rPYHxwGaMP//g7jNFjktIsnz1Gv/UDE2L+ov1fZatLtd/uNg8LKYTzpZJo4ypMxGqsAkQEnOUa5R5jykVMJsUJn4tUTAZmciUKUjz7eqI4u/XBow+kFG2QESUuZmaPiqU6E+bHR4BbfdubLAnMB9LYQ1tg1sfk96RZZfMlkTajOY25hLcCIoiw3Cpw5MF5pK4FkYFJb5ZPlnYukQYZLIkfQQdCP3F2wocuJrSSTehG/jeSOLgVZjFzMrKHSzUR28ZNprP2u5GcJYPMcHIUpQ2/OBZIE9AXs4SWXM/LKOOhoxyo5JU41jsxkQHIa4EjYG3lmvhwXH5VjGE+Juqk5nzOzLQBO2EA1CCt+VlmnC7Gctn+QJVgeiSOHRUmpbYjjiU6KSDDgYn7cLSSnbgaRP34iZkQlcq7pLugNXBOMQD7RIiyEBeVp1HEZtEqk9wiimVSHAh0Ubp7Al3OScGjQ05tIkum0KZ+TH8n8cm0qVnaJ3aGw9u2tRiolTXjDD1awFqmo7VMQBzQ3CJGmc0dVmosdWZzX7imVk4U+pc261bwRLVnNlRraOJtOfG2Nut21Gz7kMTRokKW3DG8DxELASXeB7RBIs/8ufYQIpYUczpbLN0zFHawPrAdqBEarl3aNjY04cWbaiSw+IxyzGh81IUJoL3CsFdf2Cb/Rcle1UQlTsWhwYKNnZHadSLJgTFeSW0ZIRPZGBsqRRhCF5D/Tg+02/tsmL3NHdH6gDE+ae3aWhjGGNeCRi3Fro00M0Eg+saNND2epj/dMJ0lYYYwhn8dYVIoftoe4A/oaHZTnUhTR8ni6/pNPu4FVr9IQoC7X+VqwddJnO5pI02z74TXxvN1EqTAxrP9wybPgrEo4yUwLBWtjEqvs1EJPV6C24eu7WU3JJftcI+W4ArA9qFrE9TYIJbv3TgoNTe8PGxTIaN9vJhrOFInUP0C/liMPBCJyhcfltE/DERo0CsSKq5AMDUvtEnBfFfY9kjII4XEv6XvEMMFreXjbur7G46kWPtd294136mTJvsQ6HVA3yR/qV8/+/+zrWz/8Fn4Bpq4q3b6d0fZ3o+evjrNTvZ+tP9yP3txcDY4fIFfig9SvZgtLtDZBcSojD97B8V1saxsQ5J+ayfGxOSCakXBSWD3ZHyVX5MmKkpSsDvi2uXjFSqXhEd0hU/EeGzHRQ6nJFyrxctxUZ4pIfAWxZcUDkMruEVK+GNjvZgU+SWjRnaDxBWyu5Eswe9tZvkdbkOKU/OLuciAR3/x9Hel2hapsC/zAtVkIwK2hg9JffjtH7VF8Cb+kWBX/lYbUZmIOH5Z4yFCHuFcIC4R1dLoc2+C4nTAro3FjXDSMMnr9U9o4Xknd8imDikh7m43QIjCrNmmUMWq56aTyZ1IZWa6QjMBsJS4+oldn8mYtYf5qXpF3t1xW1LOFAq4RJXC3qLOFGFwNdsrjhP17evgRS30mrQIRXQ+m53J5lsI7R3HUlhzRy0GEPh9k5ZyAy0TbWvB5Q9rIbL8akH7ImQV2byb2VfF8ipbahJKcQguEaJVQXYSFzpakwxDTFrXlimXffsnQJroTCFKIIHDcLoaA9mc5BlK3U7f/qnOxkazhzIFUgdWEEuSGMA8bhC0RBxyP6FYGpApucdKYuYfMhVxoshZyZt/yHQcwJQTvCLkqkp+p56wP/1ccM/XWGOe4sCsWD28lp/zEoMf/uFngnPYRAQ+XOHA/HEqP/q5wiXGZ8DPU8Kd6NnUmcdUIfohoWbmLckKXqLP5ze/yO5tZt/Uwb3HlhK+9vEfXAjw7yze3jQhZt+6IS3mS6x2j43FJgAbYKFfwUl11mAT39nUu1c8UBiD94Dw3zQZ7D0xEz9883ubr/CjeydqQ6QqFdcjQALrvPDz//7zn/7vv35ubTNdKvsOUCcERXV8O5tdjMZvLBgGyiP7MLKUBEsG+KSNU9BvXebVmHX8qMaePQaLX77Ppk6p+nmXFvqEhIRLMkhzXN/UXsG8jvBbIoYAif/AQusKC6HAqbCOWAES0MJrGuY/oyowqbJi1wO2jSthUrGrb3FGij0q2os0wVMbHiq/zF8DIIvbajqqQv/Vfo5Tgk3sQ5iG9GAmeYznNmCRWkZwbjeQDtUYBiXSWNETNvtxN8f3/EcFzATKoeGzq/hpHcYqeL89pJWBU5DN6sBgx5QGiWxdLW7LMbUcXsxukT2gPWbKxWZ2kU8WZY5Nh6JU2wEKg4K1K7yRDQVnxTwXdoQ26gmZM9aqoBA+h2wLSKpAM7ksDTr0IMXeiBqe3drWAE8zFQykXVvARKDOJINkqySAWAgoHfgGW8ImkusUhDB10zPSeHGxAmDKAJDyU9vxyDBrQAT0IQapJo5Kf4el40DRsnuMjbgJYZVk/YAoQTZQWMJdL8qbq6K6tuWQtjt8q+l1MugCnl1ZH5saEMHZsdY6UJSNXQeWaaYHARJXzXwgAbwDARU2/vW5b+fF29vcvGcVReno/RNJqITtZLlp7Hni0OfaCGMKv2QD9RHYhAUOhyQlRMAl2g+nQOY3r8EzJQk6toMibW6Xdg+eoIax3bHQ7Cbsp0gASR5ox/a1dF3nr+0iCIEJyUDSyIbIdCL38J97hoTXa9EfiTcAEojPEfqX+Z0+iBybDDTAW3Yn210sZv6hHLviR/tvs4456ATBOqqWymQMEpmvMhnNqrzbjfDfqmM4NkBdIJAtQ2DwunqrfDlc3JDFxDyCC8z2iupZPtl/izupY5PoFLvikZKdz8f3PVyvoqL4IeEEc2Ujq9hJKSUetVxoLbx8fuTYAN8bbwBYpmokjKfGa8O3/Fw4gTpkAhTOIHTbOEE7v0I8OMb93bdwOjmp8sV/0S89m+53RYmDjQ1lGNfmtXxn2twynJy1xiQhQJ1bHHCItQGsZ+2DZwvjRxdxo9XHlnBxXz6HwXaSOkHJfOhl8Ma8ZUBUi3yfip91+9pbi0Lu4qBYqshGDMmkHT85AGCdtffsd7WCog5I9JETI9qumsVBCmkw0kYorIVbmQqkB8ISvAKgC+OsjIRTLe0RBLBeZY+EG/B9X+MHmjXWk4c6SX2lbl771gv11xr5q/UzUswc/lgQebKrH0w93bUJmGbibCSYETAaSagNSSlH8sNYaMn94HrrST+1VjwleX/be4UDAlvyAL7KQYI1TvBrcULsvuxnafSmUGORr91cNsktc5rT5T7PnPZDRfuYkeWfzm71m9TO7a77Weidag34bfaOom1tO+/BaZCIFaVWrJbIztKSzI3IXIpK2oWRwy59kOJVNdsIfDkCVAqnmoGhg6vlxBo7E0jFsDavSmHCA0ZSBvuV5GXQjAwt/YI9dmRgKE/v/cjieDFvyofs1GVZjO2WfEkR71VEu9Pj9yCesj7Z+mJaL6YP4HqZz5dAW0ui1ooRTe+Z5acyIzmsWBH1gKlJUz6AbIcelUlGs9DkmH+ScgEAIcRRY0BS1AcAkJagSFEQrBCcQ0sAUiNqqQq8h6B2VTwRQrFe3NvtbJMKrAqcGNC3tAUAY/OlRLD5kXd9g367KGbqrnySOQgslQNHpsA2Vx3sUyEePhqqoUsPnMlgiN/cdOLYNaP6ulYBnNN2rB78JBkdwSeW0gMQ22ASOwbdJ5WDNInd195UEHBX4/CAS2E19NtQ+kD9zd5U9jYQu21I3AbCVih1TA24YREdjez+MI9Bdijiw4sddQrgNx2V7ZjFE5EJrqeRAAV4rq8yzuIGS4bPWgcsKvbihkywW3VbshymOKMDC6gCiygFZtPGnOA3PBdlGTSq57OnphKAhIpwtq/Gze4FW084AAGPcr2vyNvrBpyIOrjZ+JPAeWX7srndq+FF7ePo+298fL00SZRrQVr/TFUTt3wAL4Pqz9bxquW02XHU8UsFXHPpBMA2rqqnOWt2UtyndvmYVLy4isec13KHlPy4cC8NfLUd/epaEnpmlEYbAfIBc2WLd9JvOLM7xuyCs+faMtSH8/Do1cunB9nuAP95dIj+qd+HfsirzvG3nEW86DAvF3PEBvmsejq/PMmvC7Sc6MunF/msGM0x7yOY8+oYrcNg8ASHl6iEkOElpdXWFmJ2UlnKqA+udlqc50P8iifmZPbuwvVQ2b7byKyIVxsYLK5HIiNByYx5Rn43sk/5j86gS/uAsmx8HU72YwhMWS0APVgRfOSI3FIUDmdmu3xHA1d0vjlRnntvPLQKP0858CJQH/ZVgc3v7HPuQMZ6bme8kJ81iJ/hX6hZD1//bhVKqnKAUNoXMfzA+q6GrEgyKNBqN6N8YIKa+ypoCoJp5a37gfVkz7crI8iNPxxcmJbolFMv2RbVgP0czPuSL5qO2NXQV4OWZZrXAtedgt468DfolwIzcbWwk8WP6UNS90LNfnTB11M/WCnNFbD5dR5ASkhwhpV1/wa4taWAT01s+lF0iu/KUFyOymm+DKBIX0pEkX20481xXi1yOGXPj9m1nsMXgRYaV5bJjSBAD2EN33mDeQK/DydzrZZWxAXtJ5aZ8RxBrUF1RD6KS03DPj3rp/bRvihKAgdTaUEtS75zBGHN6vfsGm+tFZriWObnx+x+azxbVPmlbWIMxCt75A1Di7cfP6DZwU5B9PrsTaWfgeQ3P/gxN68gBN1HES42dZWPJj0yuwiTrGxn8pYD/s0p2ognSzNRebuRdIqTcVIm2jRzRw/kKNT/xs5l4cTyI2qVhHSfvdtGVLUmkNQnxY7WFCiVbDXw+Ny2U9lqgijcgWZDixCYhiteYaAQA5if+jiKRP5SB2zMXCQQonSmqCB/+8c69TzBtQLZUUhikDZRTEzGBZNfjZbYbyC80Zj52G+9191k8RgzZpT4jIljAoGlKC8IGMSMnZ2IH2GP+WOoppFoBm8/fPN7R8+BkMUGhoElCunO5ng/MuR7Pj46+Pzw6OUAvfzy6NnZwT55MdrjHNfhEPM3ok5e0sCO1E5IdvyHf/oX3An1zZeZiLuptZ6zR6TX0p5M2ZfU2uBX8eUUT/kYtl3NkvGDs9jT0ONbRQOLGlVTOZa9h6mQ0XDG7x0rXdaPezivJQFPA4BhdX07g6cnmXcxKFIw0Ze4Aq32kROoePgfWd2YFWQIS4ii4kqFW1tUkxX739/wqha4Z+5vvnhDeuamMwsjIjSzuZzvOXOKufmygnDT2l2CPuzwe9/rh+iE+4g9clEc/fN973FNVgGxtBXNRHZxos9TIrDSM3Y88vPB7qgqbA5AgvJ2how1+vB5Mcdis+k+1ue0Y0kdEyr8bFvh/37kyIs5oH5Ag/eVwX0cETdtmd+UbayxgK/bI0NOSNS+41rgbq8vDsbAOH3/OI+DiFK+GE7KPHfxzHP8rDVW4RPCFxL5lPSpMWndnSunLEfzN645+ePISXeyeOLORksnpvhZMzz10xQ6BKxTFThUdzK3SO4cbwIqFjR/MffG5QbysQlCmgD2nNuuI8eHHjkh+psZ/cdjpb81OdW9h1UC1GVOcjSwnaNd9ZTdx8M8wNQNn+jQIFYF7w+4SPFJDNfnfXnNQUFXmAqGbo1/HEo967XbirR48bUmwwEy1AXCbC6mq9PbFKptYP66812NysemU0GfVE/9eQ03MxNtUusCMnLdNZH7pgYLNtJ4nZqaR9+NxJZ0CY1AmSFC0SArESH0IXOkHpi4DbF1TSaGK3EOzuvEWcV+hvqHNVHXeV8Tj4jEZHtfG16yiYbVeDQbKdcDjrMfW7c5PFLezObDqiE60/D/fiyFvX9rPnKMTbplosF+3K2NI2YFdKAti5tZMR7p7hwf/SV3dDrbm9iRg/YP+UdX5RZbkXQMQsfgXz6q+V1dKlwQnfsdUhAWpcfrGLYp/LpzbRshDQ/9sIFBlyTsG2fODxUkYvVTPhpHYduhpabhgQ2NpMVgtgm8Tl3WIznKvIFXr8sazTcaog8ZnxE+Q9tZCDv+hIdQfXx2cDo4PhjsEa9i9hQNc3Y4ON9/dYIfPj1OSlGNdBgK7I9LxEXjpS7sv7LFvfY3VI3CGpKctzGHiA0MUb77xLZ4Lw8J13yqJm2o/yAqIa0fhgcNpZwIHsX/kefpV/GY8KZ6GkZcG5sm6GPBI3qCvpp2NUNPQVyYBkHXVDfipWnXTwHpMBrmb0H3DizmdyIVtYjJq7e3ozJu3j6ZBSrfEme4d3hzYGy8PKI6fTfbEj2HaozIfpCntBt2jRZSbOyCjUh3v8y+0Nz8u5Yo2X83mt2a5U5J0YFdTsQA/DRUwR3Qu/7VktMNRzc3s3tg0giRowBNC78GNFbHWu9iPwHCAvodN6q/j8ZFKJsQPpa/xoeHZZEYVzMYgMfRoBnClQLFqp3iP+7pdgDm8DM68L5k4+y+jtTzEYbLO0uWW69ONGFuPTYKHui74aCYLD8KtVK22q/jthrGxbXJHgKjiH1MyE2X5eojbWJCpQsjyvLg6x5BEk3j3YlCy66v/MC7/3l47xsszWHDXz73oU880Zr6o1POSx3s3JYNtHU9rQbMbBHd8PoUjt1khUKntXtWj5xDBCBtGfEVSCDAnIr/h1/9gkH7U8Jh2Wef1easIG99HVxbiZop/5ouccdFQjzBc+yv34ldED/cWO+GgccEbk7lEI1jEGbWwb1jFyJi3POYZRzSgBb1sDgDCSsR6MNKm3PSY8eNYNCBw6xyI9gBeAJM/x373w6jyaa7uIZ3Xj3oAU1sOGP12SkR+aqQ9djMtl7XAQU7JiK93MnOCS8AOaDmQ4A8oLofCy+5MuwG9YkPNuqXqzVthSOjlzUnDmUUcZe4uxwdBN0M60NVPps4vZ+mEUC065Dhwje57oHShH7H4aqg1c/YAMhIRxzQKy6TsgfiMddKJHzKem4YVar0flRk10v59ZIMtzIqyeE7WZS404CVPv9R1Q+futWJOZxTWUjSg7tyGV0ghlqNHmkHYSFVkyiadfDynGHffWUrISiUGOuRQaKT4/29wfPB/rPs1f4B+uJ8n+WgD/6efr93dHg6ODyjfzxwJZON+WKOczZuybWtjJejDcafwLoN5MogmRABPcaXKZ6R+iLzJdDy5sT3NlDWIdxX4E1ezvOZ57o1ZRz0GuLfD//87xFDMnpUYOpb5wzoiVMJ6x9Ii4PAQUZddhaDHk40FGXlfMRmNrsoOXsqSs72fnr79de0tOyp0T8LLS5OVpx+GbdAHI5ehXYQtFzTdJTo+rUCfQx8TkbAzS1fEW/QO9xAh91TmYxw6gIfYzEhbSxxHe5iUuSXrBBIdj262URILsnT0UW1mN0u8w19fvYthb7A8EzzeV4W462bBZoumzDOQWOi7SZ6YpYMpENnTzpJpsx29iwXr4ID+FqtwdPjp/Zck3JxHZ7NPaLeRA/iIwc2+KasUXFhQH9xoQ/IFrz+e7JnKTrwyXqVcSyR3xXVEgfbECv4186E1En9X/0ymvqUOuDbQx1cUyJ7CERLSzvXFOhAmAYZvt17pV96orvYSTYiOfEnO164kyBACt4QI5kKBr9dDHVA9BPNZrtTLDXGy1vEXKMJEiniRFab6C4XhNEEG+Ir77cl/qEqLvPs2/8ZPjoaHvp574QdbDoPOk40Zoackd30lMBFigKdCQrN8uUAY+M54fBy9ZYLpoFQBe3bf+04GXszQDxRcvkM+5t/yb3Feo1EfLeYUmmPEQlNKfDbRN/KADt64tiBm74Gh2f4XgS8kvJ04FBs6XsQF+cgLPdytLyaFRdSxuiXMr1L+czoHm8cmDL31yfdT7uug1Ve1cQK9vRLxgzmeJzhZbV5v3g/TRLrl+uJY5TgdC+a3mMgWljhb01JtVYUicGYfJAoIUM0yd9+yhTZiT1oUlnFCvuuCWk6PwlLCX724FdDG+0neHBOcfxHDNWjSamcmMR7glejhZMzeDrjKc6yK3qAqlUoEr7EsLLGGsN6GGPlSFfRHgJjo+5GIq2aYTzGN+ZnTRBWM55a03R++8eNrE3dSXTipBVyUknMgJnW+hq3H6Lt5i2vXEqJh4S86kbeLlHUeWi2eB7PbnEjBXLVA65eSuj05/+EyneI3FzhOj4Wfs8e9yIrP1G3qfaO8fyi2+29G8269ci68Uk4IF3ebVbUhDi5YTPYiJ07/SIigu63fmmRdruae5wzPgJcI+TuhNduNuIGmvYdsSsStQU0LokJVfJPd8bEwOCyGtZ2pZ0Ar/da+6yzfA4FlG3vbXtaZpQRuhrjLIZYzgVZX7b0gLzejOkG3Bm9xrrcw/j1YhBA8tITWH7Stic0FiRSDGyWT9R2Gm5QBMN2Zf1Y58ukEKHHLokGkdwgLovpVSSQZnk/XhvS+QXp0OaxJ2IgFXFEjZjhUKLDkKpjNrZlMCahS5vJaIujoqpwTGOEpbjUbMeIL7fFN22tMsSUGt4GEzZHXpe7qRToi28aUgBrAmbx0u+1AU4Yo17qGhFmVR7baNI4s/Q+MmmifJSJ/smavsl0wSuSViKF75OYpBXlMzB1JUpfg/I+YtY+kPvRLO9j7dxO3gw+6XUy7AnYy+T1L7G8O9BrFAuEYSHUgOIHplOrb1SBaeTVYml8ydl4MpHvxf7h/itSFGJweJqhMQ6efcweZKeLm8VsMcWZWSd4TgeXVTnu/0o2AN4Y2MToFdWzfLL/tlfmOES9JF3jbkZlPh/f036dQd6c4f53mSgsCxfTNxuZWF1ocGWCyJF8fV3sfjF4YDDjjGVaHZNEK9M/a58EHf19FxA4+1Z/09W+HIKJd5weogXMr2+W95FBhy8O+ftnWPaJvzrebAU4VWFJWGBRLvPLjJatxrkJLKWJZaSwFDd99OtFeXNVVNciR0F7zEUA4ZuXUCsSBbWJ+jIR8u4WBfq7IRKbYNAa4v71t0DXegCocOv1vvcW82mZdXqLCYlHe9iPdhw1glwZmLNKRib0i2XIZJJM8/K6FuNZ64hHOl1oEyDrwnKl+AnsyiPSSPU3TDmAZnRLjKFSVCOwVzqhnUpM5hrUtvIUeR16/GuQTI5NPKe5QyRtNCuqBd+bSLpe3o7RzkafkMzTxfU1Qpa3XchIW8GIDQyB7NnAv/rlajawM13QD7niKQvzYTJAdoA8HijQ0whvD26a1yGYkbIQK/PsziluLOrDhxWR4RIpHfMpcBlP9kCOJycoSTQWRIYsHviEHgaxklUVQJDtqO0I3xTyPVCAqC+/ZDsZyQ3qHAJEB31AqhvWAcGEwaeWiak2rMMwaTo/itHaIcHZ0wl0li/xv42ofcXqUNPyWEgYkh7xdCIqU4U6qSTfkrw7fa5irmpJRi4/SeHfOKVSlw9SVOSOwD2Ca1RVOdG6lovsAg0yVwW3kMn8JoHmLVBy1C2pU2tJ9FYgSq6Jy90CcG0A0iEhi3uj1wR8udBdLnKPhiinKh2N5MxKZE0NAuOZ3PSNIUeg/VW9FcJv6mtUA7cC6AdqNPChzVPCWNairZlJSVn2EmvKD7LheLIZlS1PWtwt2aVY4EZ7oO0dwDEmYvdJdvlAzMn56hLfdI3YMukeUNMgIA5brT7Dk5ApLQJeCaUZvDCIzlPIuokHQw89KbVXm8LiqlZxZ1im2rfYGY9fuKPd7OPVXPZBQ9AHPGoOVOK+A33vBvRRVoPyOdqAoKLrYZc77K66awNRGuZ0YAr29TICnyDyKfwm9n2AYEDUvzUy0JtaxCdACeBLfYuw7Xnt46YudChRlHe+ANNFk0nBRaNyRBrBiKDiqiU5OSJNvG4QsHnCIl6+HdZC6uJsxD46jjC/Bi1FCYRY/6yRemtI53RN15EvE1J6w6iLz8OagEmQVhbN6nHosS3T9cnEWCILToUjTDIa9fT588HhfvZ09+To4Ox0P9s7ODo5e7X/3QpDKV/N8IKVvWp5P8t7V6N3+eAAXzr9zoSrPAND/TOZ88Lh9vC4OvT+0uzsUupcuPpMU3l17jrZ9ay1czOP6byrRA3Ov3T3XfXdwj232jZ4w2nRSCUl3wHBj0Q0IsJzEkPu21ea9pLQHMJpoQXntKIRoj4F7UAMuvZ5AtjpggVMgtmIAOrmder0sJ13MQ0YjSCVd/UAYL3o0+RHYUi2FM9KRxGoNJOKJ5TFE8a9WwNYJLmR5q92nuCwnkdAq0kEkot1jsj6O+WuIBRlJUqLcTpdLa6PJgf72RXuHK7oJ0Gsz81oEMwWJmVcstpfEoiX3rc2TRNpsZElVF1IBhzgLicW8dt+I4tiSAP4UIUmvdBDyzKeV7iICghrX6TVxBBfpdNHP4qUghf1eEveM627zOBBJoti8AondAS+kBkuhumrb/K3Sm0TkEgMc1Iw7i+UDeoLFNI9+tdfmKv+JeOGUDmVFZz96nIO341mrS0p/byit7Nrln4B/XUgI/LLFVlFvC1C02iaw9JSBkvl2q+GfrllZ5cw863K8nc5MgjZtlYV1rKYTyPySxAHp2xaz/asuW18ySzebdEe14MEgSu/x5Al5CwPeVzFklD2vYtKnrkL8JIp8WmjzMm9S+zLcnl/XWWLr8zCeNw785DyP02af0Rx7ORokBV9pFxb2etdf5fYjQxuSjG7NrmGVbfG2qnSuN01LOkaamxnZhv4V8a9l7ISrOXrrOHWqb8fullZg6zJ9i9MVdBhZqfauu3lB91O59nVORx3Uw8+1V6XC+Sw20EWEDvgejFfINOe2PZV19jHSbs/fYV52e/2hR9uVNGEX+lyNRNL7YgkWcEmZi1Y6W6lhVdMeP59w/Vbr536/qzZ4rNRzoOjnIdHucKM+P6M7qrs/TmLBW/49drVbG85UhovnXUTBAKWX/zD87qG6Mc5UBvaNwlW6oMeynHWk/OIDq/WKqR4O0vy4ZufZXEnQRyRNtfKraDs53jeUw4In9iPMJvTN6luPPu2YrTN3AnHkpQdFRGMKGvTgzYSqetFiN2lwRQ2nUBsue9STTPbzZByQ55HsLR8Jf/1eA9viJedHGJFW5VyJWXQq7KdbRsZrgp4Tp5qgzwkxc9KxgzXMgmca/pXlGqdK/xK6UnctIholj0p1STOZphzhRGu1pMa3pQlcUWIM166wIHLTs3oaENhE0VLIhyYcKf5sJhJG9UASvIeKfvRLoxWz3+v1xdq7MWXaLsPXQPY8KFLKhkBvvwaa0b2vXJ+Nq9jVEMipGhYpiyop/8ChZQsVZgUBItShW2cIrRi+6NaudQtbFwO4jBHGgZc4PF79fnTU5+jktyZnoYJTQV4UBa0qy85AoOKEE7RhKIOPF0la0w0IkGt+pN1NKdm1yliFHFbeKbp5OD9isYkjLlYUSctbreA0+J8Roq4lbHSexnemxlplBQp76oWlr6J653l0Pb2h2l17apja0KxR646dcxpq74fvp5VtrIUTDS4Ttf2NCzv0QgpGo6LK61EHoxRXUEIfIcw6awk1SsjgxBgoczUeIQxSO1D1uSLBTorZqObJIvzLyBM8X2IojlrkVUe4ns+w/xuPLu9zOFC0+hsk3XEcIlEOJ1ZB6jeZSfPBSZ5y+kQKtF3sr9H/r/7avDsBfngs62/yg5p9SOO+Za+nryP3kVZXE5z0dRRZqOK7h4006i38QLfS0MMV5IBcO82fsWCj5Xj9RrN8vk4p2mrxTUroUauq98U83lOqJIRsnx/Neu7dzVrLWrh1Lt1IPO7MYxu+bspJV6dykbAbYV6RRraudAQS5M2CnoolGuraEpr1LSGfhD6PtxNFzvV+AUlBj9zmycbP+TOCeUfp6V5xtDl4YKnroWRdygaCg3VZowIxjag2aruw2kBjzima8pyyUslcwL9ALoUc6mJO0HfcJYN0BbdkTgIewG93GeHUhKYgSedrHIjdeJxofYEVCgp6DZttvlMEjoL2j1EAv8ncbSzwV1Cf2Vp/4cfJe0tLof8MDoA0vDIcGhG65SLfvjx7sm1uXlWsXWsNPbD2jfzkpUUwnNtEOjo4ic4qsIb8lRwFCCVJ9Y9lb2OUtg+tQH/3mF67JWtmCMC6z4BiTnEp/j+AHQdgK2VV/HtIXst1ub4A9jk4U4/T2Z4U/K2XLvhkzy5oqIKZiQhmj1UO6jOEdlwhYVNtMqVbnYBroHCmbwa7LwA1iRxGWJiQlP9SP0oaT1OJ5yM/5sCrEG5R5f3J5wy1Ap9aXlU5hLCkRaFwOdJeUB1XEPeIL7hJfKWa4yrUlnbd2RE02E3kj8jIdajFFuVMrIsZyt+JisjoZW9TeO97Yd6Y2ChbWjWLu/oMDHFO1YObfi5xlt+9tPNaTIW+TuR0VRrv9q2aJyUiZQxbVuqvgQobrSygWvnNem8wbI4ZavIWvmc0fYtlOVZw5D/5PI9AaV3XWUv5ORYA9HryTltbUHotRrKcasQj747UYZw9GZd1jg8bcGSbhe5pVOsiQRd4KnaWr61FWU+E3OtJFlqj2WWKxiZBvj/hdJlXQ=="},"PinnedRationalSections.lean":{"sha256":"7305fb34d8837599bade1b6b74ea9963fcc5bbb1bc993a5891f784b9cb5f1966","data":"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"},"NewNative.lean":{"sha256":"a5b3dbcae78a642daedde736fedc3d4de40fc60a0680a4de1d95f34a2c8ddeb8","data":"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"},"NewComplete.lean":{"sha256":"a020b8fe0d11ff3963b50d87633e42f30f865d7d80b9075dd4907c5cfaf88385","data":"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"},"NewTests.lean":{"sha256":"0918bcf3fd4843aaa963171e07cd6b5dc51d6ed45d7d839b659b8b98f5290599","data":"eNrFV81u00AQvucp5mjTNGp7jIRQqVpUCVpQlApRFWvjbuKl9q67a4eGW2/AlQfoBQQIrhwQtz4A70CehNl1bMeJQxxHQHux9md25vtmvpk0Njchoipqw5OYnEsSMfcx467XeuCLHvFbes9xRRASyZTgHepGTHDluLEKcZ32+8xllEcNekWC0KdgdaENlhvLIX5v4feFDVt26zikXNlgSVz5+W52vwld24Z2A/CP9JTw44geCRkQn70i+sG9OQ/yy9AFy+LTp3ENnyRhiFvShrvGLuCpObf6UgSdkLqdiPgXk2N4cEA5lYiEYDyaD8ZO7hUcTF+Dtn6tYgzTAGqftYFGoy4jHpE7DuNDKhUtp2Mbv589EuewY8N2zomnzxyqXXSFU72IbMDpkeA0CKMRdM8MMJZKqCsg3RGxdGctN6HIxjb+j69/3H7/9e26DtEF44iRyhkttZE4ld7fv4zZcN6I17VbahQEaG0lyuhlirGJSxsCVZs0g3BOFoFekmQJQgcxN+da99kLfUNzWBU1bWr89oO9WnS99KHEM22lWmylDxwqkQiFLpcsyvaCIPD0dGl6IoDxmy8zuZRXfZIDFWu6RkUjcNAb4X35Ek4XhodeNpeha8J3IskIH/j0bF1ATZ2HOpBpSHXErYCEUCzQNIUOGPXPDcIzIoDJrGFOwFxe25XgrWAGVSB9Ff6UDyXezhC/unulFzEFIjGbAIsqR/NgGNBaoHVgTU5DfdThqLgJoWWKgAptEFmSbLpkEdvXH03st19zEenEMlMRi/gD2pMErMfCH3ERMPTxKTyHHdiAqaU9NHcHCmc2JqAWTvUQviHxJ2ozvvm0rCSYCQZ9bRpzlyloTiF3EF7Xj5X+4iJyVB4B3hzffF5Vd3f9gWkHiSpNdPzvjDFVhTp1aXqeSTpTNrX8g7FlakhaoLd2rQknA7wE67oTT06iUUKJuxh0gbqTCkMPLp+gBr1HuP/rfJMnQHFEOcn4r6LKIcLgUdLXLSBPCOxOx/2H+3PzccltFpABdQLBBXiYKSIEVTI5VxDbynJbcGlpACt5UNmH+YIogyL3Z01OuxrUWvWTZvlk6DwBb/WpMzNmZrsl7WbdATSDIBtE055kulL268LCvbxadfNKSzSbv6j+XaKbSu23W9lc24R7jm4caBYTQwpt9ipZQBAQ3yvMABFSiWP5b3FOFoQ="},"NewAdmitted.lean":{"sha256":"8e2cc053fc117d211eb1f39bdcf9df05a43fe10ff4b0ba695e8fbff004f3eb58","data":"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"},"NewAudits.lean":{"sha256":"8b437670b8e5b91f71d01b103465b87699987f4e4ea7e5a9e3f24ff7d7d1e466","data":"eNq9lsFOwzAMQO98xaTd+w+oQhMSgiF2j9LgbkZJnMVJRfl6km6UA4gLSU7NoX0vru04W+fRho18RzK8OcjYQ8BuBzbyk4XuOcpXLwOqPVp16naaBqk7OTDpGOCRvJEaP9ILZF9A5Qf3mjh6uDtHnMQRLHhUYpI6ws22rswDhyQLJT0UvYIvWzVNT8ZJj/wdWFX4mhbpXBvRP/J/RewpffqAY1jZpWvql+2rS3nVlcBZoJ3Ac+1gCMYRFYKtW7ptGkQM+JaXEwhLFowLcytfS1kVjZCpECzk9hfI90x1LKXRxWniRKY8MXdzYWoiVthrpo6+ONblk7rwT/izH6XWVVW3+rhM/iaS3JR6bqPi2ZiWvkW1WNv4rmO12eRbxU0m4I8w21rTtYWX2/EloZ86Z78m"},"native.diag":{"sha256":"98b0236144b15cd1a73ebd78dfa36b9ce9930d483ad00e688141578c31a08f92","data":"eNrNXetu2zgW/t08hTDAYjrAINO0TYvmXze9bIBJm+llsIvFQqBl2uaEIhWSSpu+2b7EPtOSutiSLVsKIn5UfiSOLOn7zuHh4eHhLYpaP0Yawut/ck3n9eeForT8pFdEueuzfLH4LSHJyl0nt4RxMuP06JKmZ61Xnjw93fzz8lnzi8bnF5vPpy8bn58eff5GsvYbnzUejJ40rx/9/IXk59Sw4/dU5PqjoMd/5GSuiGHJFRPJ6pjwJZ0p8nM0pxkVcx1JEZHvTKb6LPp3pmRGv5tfo3NOtGYJ4cfJSrKE/hr9kUtzrGUu5v/pB0lpGkOAEim0IcJovzBCqpRw9sNekSJWNCVMzKnyrEQ5zzk9l3SxYAmj3oXcxYsX2sAxtZjDMRUtDEnlSY+8R7vgRw8xJZ0RgTTdUvZ4wQQz1C9wiRG38JGi6owmGEEVSUq/wMTSLxQThi4V4XHCpc4VBaGxxSLOJL8TMmWEY7T59iZnt0Cour26JBkSVd+l6WDoh3ufDvB/IrxtvKSC2qtSxSnJrFMwMRN/UcvllmI9LkvJkgL8rm1Q5rY5sQKjEBXVbJ7bhu2aKkG5d0PexYtJlvE7OOq170isA9N6X5D5boED/GIXYoCibTrIfvCHK3pTY11dtTGhDQhZYj7bNxKlsV7qxj7qQtNmZNobP3kjYaMoRcR1CEuPiRBsZbvWtlx8429CnD8qyV8j+rC7sF/kN7BLq+paYeoxCWBrIapcpw7kLVXxdQDll8AYV3eIAM7h7vE2wBrfzyBOaRqIxSZkFjT+QZUMxAPqFSrLjEvDhFTDwbHcWHilnuOF/QMB9AvCmaDWPEBJ0coYc8Fucu/FVUlU1QBMJhulyAtR5MbuzldEmeMkVz3Wf+9XzqkLakS/Gx9XEkU5INXYxix+IwHpTV466aQf+eE+uY09oz9kDpVWSemqBb5cGyZ8IWx0pClW1WnOYzYE2JvYMdNf7RdYsY38XSYDxwzGxl4omYZDb0seO8NHE4idBpDW5vBiI8Hu03cOrQMwnhFsPS5R+41o/PJsWbH1YFgjLuWuHOcArfvFh4vPB7uvcQu+GHC1LxYXaWolhzvPVvf1XEo1d20Y1eOGte1O8kqm0vXTZa4DCmt7lAKRIDhEoQ5JsRxY9Z/TgGZimff20x7O4KOt15xkxzf1Zb+VrIb75H12QY2UrOsOBq/ylH8SxdwMOrSQ8eAwezzbWTcOA8LrsSRe2ysUVdGE2Xfa98QDK8x4Wm5g4/s0uyTgCsfNK+kAH+pFvIBDes2dQqcZBhTQh2lBxehWoRVFIyFRE8HaqG7YDd0OpFKgopcNqKJFic7hzTyy1WvHxrK8ivKDriN2oSVG0grM9YSwgL39ag8S4kDLictvUGMoe2Hj2764ZTy73QVfT8nCUohxKZQtYPKN3MUzBppa2AZ/i4soGoCIiYWdsPDYuIkOnvZdU6iTJx8tGKpvXyVoOHBQZRscaNktyAAl3MYPZGZtEso9bRSDwxdDH1XY59awwPFnxL7O1TXISN465HWZUaDJb/ACmFoDHG5nDew6nwfnsOlXEXqLSjE1OlUhnEsrW1xMo8s5QVfuolrfs3f5cBbvuZzZh8tQAjDtqMJjzUEXCGLVZcYBlir1HxjtwMX0Bo3I9EfkMO0uAUXEkkItF1awLf8QRtEtCjhV988hHdeU//dfaIGC4GrZAttOMAJFUFUkfpj/7EvTcov8nn0pBtFJqa2Yt77nebcB3ZJ+GzwlONUWxZkpWqyCBkIyfZVzPiPJNQR0TnWC9Q8wxIZLgGG253LBgsBdWGtH7wbsITKa+2sxgAUtO6iBnP8ujwHhix/083s4Lj8M4ns1hX44fJa5SjBuWxdQ75ChXQl5gQ3w2nIGqmjbkgelEcjQK3Bk2NeUFxn9ATfh6vRk1egmZLVaJ4F1Sj4cBcSS1U7gug0btBmaJ+HXHOqCCMKiMsOhXQPftgjn4RZnnMOczhotdsuZv4MxETv/dQg6xLq91HJwP6WRzDUSsLKtK7WJBC63YMoV9T4ttAMQacwt3KDeuirekM1WTQGshxrui+39alwatFW53KxHKOpGWODSgUMcBu0s7ZMCYtLIFnprnQxo26FtCky/kW4LFOQ4Mxa0I9GE20+y09HB4RvxgzU5TQOlOQdg+xhaw4m8k+hBSlyOqzF9UW0kjcyxgFFbpnVlazQjvHcNhp/KvEGP9YD0rXcShqglNYFJpP4nqPUw6O93e/LtM6aKD4R/xFFotOZ1PeR351z2LvwaO71rgzh+HY7FPmsArTevWBiqTZzkOhvkEUZyiQWozjgzg1zAmKhuN4gCOICai0RQMvjUlnHBmW3cM6KKibGF5UPR12qHh5MbA2eQVp9+Z9po3E6eDSAbwS0VpRoHOPCkhgfvg+1+x8GA3Q7UwvseK9Wmvt5TOpt1AbYv/6awGN/7l9Y5G+8Z0haUc7VIuIGLM8cD1TAgpCp1uTZtsAMd43iHDTZiLNYt/tIACOslOQZGIWAUzUA4ww/WGAcR0m674C+lhqp/+N6PYY2EOSSjIZd/P7VGi3Wac9TxH+con98JCdBqJyyoi7YB/7t/x7wFNmAYZWxEKSgW0L/f3iBeVqdYeg9qdyEBA/FdoP3HL42PyomB+nSU82uionqYnZ4vUNsCPlOsSM1sGlTPx01uobmUEBZwRdRTKCIBBLBbkLnbUCMAbnFs6JwK432KXQm8rj1D93UYG7awpkHHz4xVTzfYTtnWQRmWcftWRC53m0HZbbqlbgMwHQYc5T+2cZHR1JWS896Dz0eHK5xIiNYvUKNb7xDTCz96V6fofcT0Bt8n0Dc5UTDMt7eE54DUehciYhe7Ttx144gzqgY6sC79zhYGiYUt0QJxhkxMFIiIPPgG0nW4MMd4tTCLHbo+SWl0EFDMWar7wHGnue5jAPNQ3RNbkxVN6ZcVlco+m7j5P2+KCc4izCpAxLmm3YooN/3QQ1Mevpbg2eofZ9Wyt8mVTpvdkLIajUjpGG/ph+FLdcebPSM/BUR3B4Z9mp70bs4gbAJvZ+kHho8XxPW8sYWxTxH9+8v7p2C7cANOR/TL43PlxgPbxpvejYC8V885jsJeFQQ3h4JE3waSAApDOhKwijHspAYcHec3AO6rMeVva7+BhOe6PCYwwNTcXvUkRCSwMKutmmI2pr1DskAB53pfDCEFTbMwK63f5aIojXeM8vllmIUy2xzK2euTYLKkKp0EEWRAup/JRDgAA8LDPEDefahOgA3fYS7FccBGMSKWHNXWNP35pVTZimmrEP16sWACxYHMtOS5abd35zLNiGIa1o/qYRFnTkXo4ukjVR4FPy1Ow9YTwehAA+1qCSUpqk8zgxh+KeUmcpoUrTqu/SILPzgBCsHCl20eQfPO22QU1dbPJGGC/h2Ldfaaq6CKqSgMODYIxwNx9mBvKPOaL4MppZMIZjRvqzkKaCaHKAAt5CCNxnLvKdABe7eDXOp5TxMpqfVBXQEbgImYUD8nfNkNcH+BFdVNqv/0bj9s3pcd3rr0QjZWe6iELq99tEI6gH2c6voWrjn5MJHYcDCfKesqQJv3YYI+vZtbkVqoGYY3rV06k7GsLmrQDuNgWmv/NQF6XbZfpYed7efTYxcoau8t1Snw2mRAa27TYrM2Lds5nygzpNE3x2HcRPM1meA1r0NBE/BWHazoDXjzusHqmkaz2MFsmo5qs2MUepLH/QlOmt1ERuCq0TDr6KETMnrHKUNzCQ8PnIZxiAJwBsZeGthJKQdpAKfI7uVRznYIXC4HPS/hfFrcwKnEe7IKMgg2lBtuzd1DlIfMWd+X4MQSoQeYTjPm3FHkxGnazk69XfvDjfKRBUqJmEczysQyMiyl87PoJ/dX5iY6efrkScTJNY2ouI04JSL69Pbq99f/+u1DMU/92F366ejRV01V8XD0WLsNk+b6l7Po1cnxy9OjR5/vtKHpzrf2y2dHj66oFUSYSC6i86uvkVkxHf0lZ9FSGnvL6enfjh695STTdB49/mb9fmQ7oMn1L9XbVmdpeqat6Cpyf+1bn5ydvjp+ZV/82pYlWdJIr4iyDxurjUizH/ah69mdocW9m7tyUd03J4YcuE8bklwf+N5IQ3jH95e2ZNI8jaxpFXvyRJru0Hn5/NnzZy+fbl526ObinX9ZuR8raq1CucK7+O3jL1HmnlyQnBtd3sVEeVfCCUvdbSRauEXGW7c+e3V6evL86NGf1haFIeousgVVau0bM8mK2ntePD85saq9ELcHbnr+9PSlLfRvttAKAu8Yt3orbYCJLDe7l62llddPTqz4n20BW4FTqrUlqK30whSPbH9hZaLWBufll2wpCNe2NnB7TVVXr4pCK1RXa+75k1cvrFF9Z8aVpskLOv8HTckN1w=="},"sketch.diag":{"sha256":"b351a89fbac9e4acae654b24c68b286ca3f11f3fef547c940cf92c3361c9a54e","data":"eNq9nW2P3LYRgD/f/gohQBEbCM7i8H2/BYZbBKgRp26KFkVx0e1y72RrpY2kPfvy60vd2bCdM5yAD7z5kvOunp3hcEQOhxypqj75bx7mpnv/j+OUtu//3o0p3f81XTfj8vnlcbd7smk218vnzU3Tds1ll1bP0379yU8qsR/+4fXHX3z0t/vwt/Uf/S2rl2+aw6e/qD8Cq/rjz1ff/rM5Pk1ze/631B+nH/t0/tOx2Y7N3G5etP3m+rzprtLl2HxbbdMh9dupGvqqedsO+2ld/fcwDof0dv6ueto109Rumu58cz20m/Rd9dNxmM+n4dhv//fHQvZpf3ESQZuhn+amn6evK6Yfxn3Ttb/lT4b+Ykz7pu23afzKRhy2xy49HdJu127a9NUb+VDexW6aTy5z6rcnlzmmO0caj5s/aO/qofAVcaXp0PSndN37tl/s2r6d09cVfC/j4hP5p2zqdEib0zR0bDb340LbX31dUW0/p6ux6S423TAdx3Qiae1ud3EYutt+2LdNdxprPvv12N6cUNT7+ep5czil1Ol2v//Tovno8xnh/z7FaHtxlfqUPx3Gi31zyIPCfNH2r1LW5SbBNv/j2Yu/f/+fJy9fpzmL61LTryXEtVtXb5qxz7fkOv/+pmvGu2Fhiemm6pdpGMfbXz7LRgGsW5tCVtd1sVxdW8CW20orWatQDLtywaIA68tZXS7XOA3Y8k4y3pSzoQZsef+aCORGv64LWZtvwnJWA9aVs/kmLGeBXAHtlVjOaqCzAb5hgZ1t+ZhjnSmX68vvI5vHjeLB3fpQLjhowALHAgOHq1U5q1Rx1OCUBqwFbPmE5EQDtvxGchrYWQOdtQNsLNfZgPYa0F5Tfu87qwBryttrQR+5GrAWsOAe9KB/PbgHQUDpAuhfEIw6EIy6COwcy3X2IJD1tQFs+RzqFdBZacACnQXoDAJoL+VBsNdAZw101kTn8rjOGwEs0NkCO1tbzjoFWCDXg/Z6MObktUYxG4CtQrnOMY8bppg1gHWALY/rIkicRRB7RxB7R1MDtnxdFo0FcstjwmgFsEBnG8pt5cqTm9GVx7ERJFYiSMhGD/wZ5GQiiNtjAH4Vpdw3QPwcY/l9pOpaCBzWvhhWCkhWhsAewCAjlOHy4UPVmhgMTC4ZJh5midrWAYPZACQ7cmM4Ym1HrO3JjREUsHYgN0YgtyRIemQYWDsPJQQ2BAa+rUAGIsOOwBHAIgS2BA4A1kRtTdTWRG1D1DZEbUPUtorARG1LfNsRazuitiPW9sTaIJGSYQ/gQNQORO1A1I41gYnaEfi2gNMmGQYGE3DeJMNgohOQbM+wITC4n4XMVaKJwQy4JcWVpygzDCJ9AYkZJV4R2II2e6J2IGrnAbBc7RDLEw4SFYHB6kaiJTBYoGiS3tE1WMVqVRPYEBj49nJa15TDlkgm/awNUJvkhjQ49aO0ASOJNkRtQ6xtNYFBDlDnic6Xw0JgckuSfJj2ZCTxpKvILKmDgH4OxNokmaZJMk1HonYEahtQkpJhTWAQ0BhQ0aIM2UExZIo1CmQfjZCuEqK2gLnKkO0Xoy2BiZMY4tsGzFXGkn4mU6yxZCRxpJ8dWAIvlVPlsBcCWwKDhIMhmThDMnGGZOIMycSZqAlMPIyk8WwtBLYEBh5mlSKwITDwMEsSiKTeLcOOwMTDSPbRkp0yS3bKLEldWkM8zBAPs8TDLPEwSzyMbLNZss1mSbrWektgEAGSGsUMg1DKRmIwkjS1JGnqyHLQ1cBgjqzoSI2kIkWSypFFmSN5T0fWVQ4cms4wkkzabIm1HRj0HTln4DyRTHb7XRACE8kRRAaeHC7zZBhaKtQADHJDnowkpFhMkYov5Y0mMBgMSPGV8qAaWC3lV8XTjSehlCdpeU/OuHoSDXmyhRzIYBAUOB4RFJjoghC1wQMUVCCRQSD7koEsygJZVwULVrHBEckkdRlI9jF4IplM7oFM7iGCrYiYFyixHAZ3VVRCYLBTFoVIBuWgaqnpLFdbE8mGtNmQfibbL5HU3URHJDsimRwVIAWLilQdZphIBrsJUoMNgQx7AIMCFqlBZj3DxGBaEZgYDGSZpbakn0G6VmpHrO3LawczXH5XSQ0OyGbYAhic3slw+QAoSymcKYcNkQy6SoGMa4YDaLMQa4OkqShNrA2SphkGt6SypKvAQx9EOdJmB8ZtBZKmQuqrhNRXCamvElJfleEAYFAiJQIeYyakykmEREOiiGQyDC21RgA2BPYABrmhDJcvgTMcAWwVgcFcJeAZDhkGk7s40lWOeJgDkYGQwFXA028yDGZJIbEnKZESDZLjQqqcRJPwkZQLiQYnlkSDE0sZNgQG040GJ5ZEg8x6hh2BwRJYgxNLGbYEJh7miYeRwFWTwFUH4mGBeFggHhaIh0XiYRF4mKkRDNzTgH1JITUoGQaRAalByTCY6EgZSYZB1EvKSISUkWSYGMyCpZEhsacBDwbIMFGbhI+GvAjLkDdhkbfhCHkdTobBuG3Jst8qMHqS8oIME8mgQkCsAZO7JQlESxKI1oHlIHmrTobBAGjJJogFhcTi6vKHIYgDZx/FiQDJJJm2HIQulwzOGQh5DUqGSZsdgckGH3nNRoaB2p5sdnlQ8y1ewIrOC1iUkRc5iCeDvgdPIhRvSZvJzrcHtcAZBjGJJ6tYT7ZfAgniAijz1DV4V1eGA3gdqiHvUgWrG107DdrsyetjPTEYOL+t61g+xWoFHsSVYfLeW1CPoRUYt/VyzqAcBk+QzXAEsCWwI7B3AA7EYOCRBFrA6VpN9mK1GALb8u1ULeBleFo8eZ00OO+pyfMAM0wkg9gzw2AAZC/RBhlXrTVpM4kMtCH9bMBEpy0xmCUGs6SfQYZGazIYaE8M5klXBWLtSAwGXnejydPaNHngmjZkGDK6JjCIwwzYsM9jgSIwCGgM2PnWxhO1PbE2icNM/JMJh7Onw37f9NvqMuULq7ndp+26+mb5/3CcKyV1XXXN61Sl/qZafrt6KO6b1dnPUxrv4OrRlDZDv50erytfnxtZnb28nea0f/CtOldqdfYijZvUz9Wwq56++Lmar9upejVcVlfDnC9R+i+rs2ddc5jStnr0pum6atMNm9eP3/3a9Xq/X09TNYzV8v/lV9e1nAe9Ovv+Jo3NVaqm62bM8JzeztXU/pah15e3c1qurT9cdezfXbdt5uYL101zs3n9he/nYW66z3z/vHnb7o/7akxTu13aO6UH6vja2boOH37sSxff/ear3O5HY/r12I5L5/3w5MfH1WEhd82xm6f7q9r+/qrsAO1+uaypdmOzT7+7VOqQQ6vV2b+G7tjPzXhb5Y66t9qbNvd0ytfktUF0q7Mf+psvXCR5fZs7/U3utDsF/tp22W73PtD2h+P88OPsafefK8nNf5k7ODd4n6YpKzjl1vfzHfL7L3KbUnuz+OvyZXvVN92UPb3Ln43vPn1x12l3pntvuTxy5zY8e9vOS2/Oxzt1/g9mu7xz"},"compilation-summary.json":{"sha256":"ccf8ffe3cacfe77ac9ed16ec0e7e26f7b9e0b1e916346e5e2ca708062ee4f2cf","data":"eNqdlEuPGzcMx+/7KQRf2zX0fri3Bm0PRXvILtAzRVFrYccaY2acJgjy3UvbazvNJinQm0hRfPx/nPl4J8Sqw9Le0WojPrLF9tJ2R2ulpfb3St5L86j0RqqNsmuXjPT6Byk3Uq5+PMfPW9DOH19kq6WTGFyKCYosAKGW6LUrymkrtYyyBuAb8FXGqmIKNkRUGHz2AdQlI7yDNkAe6Lf2M+d1+sVP79vCtrwUHg8Tnlr98zTCeiDolxxD6zQfH6sUrs9htx9OXq3cpdahtOXoMte4v2HqrT/Nn5WCsmvz3Mb+1+u7mXDs5ehZyY1L62QuPewJnt8+PPx+miJYY024jFIaPPVxXhrOD1f9UsxSG6+szcphURAM5RJiqWB8TkiJ5S82GpZQko9RWeVYQKOA5Ux6xbk/HQus5mdacPufTPXGpHUIzjnzLaaopKuMTeroFTobvIFkqydUwRS0JZZiqiYZQ43SlRp0IUzZuKitC/J/M304jfBVpsZJ8xWmxn7JVMvXSJ0L34F6u/0Mq2Kl1vEbWKV3UsbvYWUtFMRUM2AiCwjknc3aoo+ZVUUwValqKlWWF5OVyCzR8CJgAmfphrUehuEN9LE3hOFGF8fdvg1U2FNhmOmVltc3/5LzBlllIuvQ5sgIdcagyXqZKFgbnUNptCKoMWEu6DJkm62DHKynVDSv55eAbJL6NSBz/egmgnnsx8q/vAdcxH6iGaeWqYhHOIg3tDRRQ5I22KgVVst98rKXnHxA/jYsBaimSDQ+icv0AqalVU4384kE5Jn68pNYtny+LJ+YxnG51ciHNhTRZoHVRO91oKSCBxN1QAWuUpSW/2W1JAu2aOUFdI7nCqc8b/m3M3YYfj10PJ7mawvHnOcG1uKRG8jjoRdu8Q9YtkPLAreEz7NoHYdDoVOPvG3zYccxdJak9c7G9FLivr7UEGeqHIU07c/zfRBlFJ0bYhfX//CS76j7Qrdp224/Tot4mmC/XZ+W6u7T3T+NNKoy"},"guard-inputs.json":{"sha256":"0ed0cc3f6e2518d2c4efb199bdcfe9041871dd378c5576bc4acf38b24089a543","data":"eNqtVstyG1UQ3ecrVF6H+L4fsEqMEygwTtlOsUz17Yc0RJ4RM1IKk8q/0yO/KDshgWIzJV1d9elzuvv0fHiyWBw0mPjg28VBMsLeBAvM0RXHPgcTHYsxqQaTyFtbE0s+eDr/a7Nr6w5h2w39i/8WoOt7pgvYHfG2Ox92I/L5ClxMcyggL8kFjdSwsi9EmKInQ4kSGkZCmp8ADnKy1ent5qIVNJpECfEaYuI145bp9R7qxUBX9wjBBcbooFZTTETvLBYSXzNJyFE0GjvnkGxOBI71oot62DLVKujq5xDOoF/u1TjbawPrl7se50/TYtqTXDS9tZBxuFx022kxbLhfEOMaRri+tl2Nw265WowPAxz/vuveP100lmHkz/z8Fjab9dV3i6FfX2kkvca06wn67WLXd+95nPjvaItu0hubNSDTs2tKy0Fv9dDjzOKDnujZyBPDiKvDtt7xZuz67eGvp2c/HZ+dP7ukmay03DIYyFJq9VklAu/Aql6SEVITn1KtNhuPaLWaWjcRZqYSioCRPfSngV6fnV6cHp3+fINESetN1rkI1QpDw8KRSb8XR7Zq0BhMc3MxE2IiC5g5hZjFuOKBHiHxHxvoJ9XiIVIKTEEKBy+ukIfEAfQRIxhCsKaBbc6EMnd2DXNaNpIzpgmHHKz/B05vXp9fnB0/P3n76s2P3x/f4BlTmg/immZODbUZCcj4VG0rTaFtEs+ptBIykbEcCrUqOXhHxnDCA4X7uC9h1+Nw2fXL+wLennyzAXzH2+nZb9PQz6DZBWzoi+FSGriiEdlWZHaVSyzWFi0l1FYxA7qYjaWWGIP3JYNlc0vyDmBkoEuebjl5KC56E4WxqlLKSsfWIlVvfE6Nvc8xJe+b9gYVUUq21kCoQpQA+XH4QcPD5p5ABGoUUnDJaB8Ii3aCgEMJUbmAKTZEyV5RxebQvPaPa04rpAPtcraPEFbQ0yByQ6CpCInVbIBATFH/YiimpZJDqs06YSOo1lFKNDFgpuhDcjWLxGpifKzPtFsueVLLeLZm2DOgaGusiGyyJReM9yI5F81WdIqiyoKthaaaaFGCRZubVoIxZb2VK93X/dpgXnZr/gGmFU/39b+x2cPn6yW3ETp8xcMlb8erw5OBdmueDh/Z1V1+/4sXaw4nsF2tu/aJHJ6LdD2f44ov+Q7WxRCVpjZaaj6G0kwVFRYyFBvRWSKvZ5GKt9r8zvCcFuckWhNHDr4MezKMm1U3XU43CdxBR+bswInG04oHtTGXo9c5tDrmqYgJtUJ2JarXaHoVosTm0+xDhYnKv4HW5dnhHXIqHo26ZgxqWg1MBeWIlDxVbXTdSCA6fXMHW6nVaROHaFUbCBx02X4F6QcqZ+U266Zjw7lF0WZMvjqNZ5ITo0Zro6m6K0G7uaWoM9Awm6zWQzpaXwO4hfW7e4JQuKmXig4IzOZMytUHRxECAVdshWrhwgo8+1rIRithm5Zd0X1+iHcEW14O49XFivV5eDT0OPKWb48PjzfdydAPd/hSnbLz3quFam1ngWNhA6AA4mzVl4KKkqyPmHWqdS2KsdVbINEZT+kh/sWwGdbDUmmqqx6e6jI/mvfnHR77gOJ1UivHxjoxuh1a1V2oIqaUxRHGqoqz7i6fIWEuoL6PTnLT9yf8sr6/DOMlrLs/9/N7h6tNw1LQG0m+6P7K2qE2AeuGEsQQg3a4tKpLjGKDqBOr48M1Jom6XULZm8qTj0/+AjzpB9k="},"counts.json":{"sha256":"f91886a2bf46b7c9a9a5279f19988e2c957dd70a1c8b8f6f8d374e10266323c0","data":"eNpd0DESwiAQBdA+p8hQp5EkRu0sbdULYFh1RwKRhbFwvLtAwMLyv/mzLPuu6pppI4HYru67ron5gVrG/A4hxNFMs7BIRgfbNgU1OetHh4mHVXYJV9SYdTVkVTBNIkDHS8/dwViYgvF1kE96+CIIFGoI2vbrRFa89jNGaHmBM5CL+7U8d+Dp0YL8K2Ytbb7ZJJ+V0LDI9lcsnTbJTcz0W59Z4x0czSvSsMwg4+0IByKfDrf8ioUrORTq5MQt8VB9qi9Gxl6d"},"source-reading-receipt.json":{"sha256":"8e0106b52baa3eb88d5821405a54afab1ccf6b213cbc7083842e8abfbcd8b40d","data":"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"},"baseline-new.json":{"sha256":"669d4268f14f320926c78f8fb4aede8d04ed0e7738f567e266d3e5caef1ad147","data":"eNrtmF9z1DYQwN/5FJo8k8SWLdmmT2kGCjMEOoSndjo3K2l1J2JbxrJD004/Rb9XP1NXto8LhBACdEhnmMmfO3u1Wu1vd6XVr/cY+5N+Gdvr0e49YHsDjBoH9+AljMf0/+CoXqPqwemf0Dc49BcHp3qDDR6sscXe6Z+9a4dVg83e/VnPmWvNpGiDvt89brwZa4wvFs2HVzQfnkwy4fAFDM63UD8aWx0/hYMaod1q6np/7gyGSdcGWUvS58gWe1gXDWK1w8Bcy/Ac+wvW+habbrhgvsOWecugZa7v0YzaqRpZmJe0nYG+6TOcVnHsDf7OdPy7L1ApaVmPYBitjp42XY0D0pMaz4FmDQMMpIg+QWsYNMpNn0MYafa4EAbDNLTrMejeKSRNs8NZR9b6lvGEy/002U+yH1jwY6+RnT4+4kIyMJmVPAdEpSvMSmO0FJlJjDRSJ6iNNvEvAIdCphUnacVFanUiE1vm4mCPVvfX/SvEGxg2tVMPrpJ2p2O3Amtdi8/JcWGFr1eD7z6Z9Mms+QOkjyalSyRdB/eortk8+8QtTOAWVuR8Isvc8G2gLT67GRoXueACs6yUKhN5qZLK8qqAAspUaJ4ak9EzYcosRal5ghEqFtJyi9xw+Axo4Unwq8b33caF5gWGgbJiWDlrV/Mr6K4QrLFp4Db8Thb1YSF5LcNHvo/JtmDcWsUmeLvnA/RrHCbK95kLfidnJ8/3yyqIBr1m+Hp051BHTIN/X94NgQWcZRvo7nh8CMSCA7cEvaxknnLBC5FVqUpzKWVpk7yqoOClQJFTDFUgrFCZRIGmRGPK28fHk/AL9C6cuadeQ300vJx8fxDjw1OIxJT/amm+C5MfITh9faYvEbBfR5t2YUIyHfZUt69CJ8qXoiIsETWXBdeumYXG1RdTAO2CK9zxaJBlphMulMgLlAqSCqg4aCMzUwkwyDlYiVpyxVNbVbyAKhcpFRXIMc8T8RnVYinBj31zQHXh6cMVpcwXV4cb6vqLS9lMP9FZixvADpFiNCQij2/mL0R8EmugrkliEY9I7zjRghI6VnTLORZKWCNSmVWcgCWS28SkPBVJxXOERAglhU1KpYukMKoyZZp/GVFiuZr89w2ILllnfV37N+QxdbGgpDyGemZL9r1P9lKyfid7U67GFX8Y8GfU6hsQx5M26IHYXd5d5yNZtMMHR66HdY908H7jhs1bJsubCT4NCbTDt7oeTazS7zl/ehGibpra2/A9BK4PgbsH35KI72PbtST1ksxk5OT9bZGPNn8n+2Gy//x92qGOx3Rqa8ceajdc/NfV+9nbmbbn7W1LXXsF9f4WOcm3g7NOT+05lfZ+3qHnwIh2/w8O3N+MrO19E310OkB99lWasEnTp+TscjWyP1+NhDhsd8a+nNDbDB42vR/XcwlfY99MIJagCLSGoR+bJTq24+/80RpKVBlIay0dpVPQhk7ZWc6NgNwAVlqVpiqxRAoAbpIkLxLqy1JFnTpFQVbcxP2YbF/7/uJlLL4XB8e+1T2tbvt4actjl6Xcq+iyc7x13X53jsP35zh82LkT3/qPN+Pk+HkY08s49mbjA8Z8pmptx5rZeO9GsrTEmkwNl1vs8G6DfqUx266Oqskdjwhbccr7LMuMSaj3js2WKDEBIOSWp1WOutJWppnQhS5LjcYmaZWlYGxZllLeFBEvfedrv6ZyWZ92oJE673iLdhw71Lh737rRWhRS4uMQDne6PlYBCPbg2tGPIfrINbDGsFyATneh8zUaoW/efXTH2WGWa5sVRVGhUCiNVBZVJauKSrWUheVGi4rqOhoiVoDURQmZAc1tobIi11908mrJW7Rd/jFtg8/Vq5jYG9+sKAm+uKY/u6z7o2R3Z+Vl016K/XKl9o6Rb4u8rn0Ye3zbXM9DBv/sg9J3fzdPtEFb6iyxMistLwsrVCoBheFW61zkWHCrqkSBEQqEVBQYEishrSiMyZfrs3u/3fsXR9Akjw=="},"new-nodes.json":{"sha256":"8cd104447df7b76cfb395ee4bd041a94891aed82967d3d1895d89bdadd6669e6","data":"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"},"new-ids.json":{"sha256":"120fd28ba4746f1a8351e4b5f74fd99abeb27135274fb3fc0c2907c23a5fb1cd","data":"eNrN2EFrgzAUAOB7f0XpednYtbdSxihspVDYVaJ97TJiYpModGP/fYmaWFjRardEKLRY9X0vMT6fX5PpdIZjyWmuYM1Fiin5xIpwtoXEfMkl5TIX8HTMSREdgIEgSVRgmsNsPp2tQXD2yndA5YLttpASqXBMYREDJZi9YUFAEZAbLNRqNX++f3yw0VDC00z/LzlDbhs7JyBZG1BSIRAYBaoVqFLc9UtBgFT6YBVM7wAtcJ6LBCzfu7uM3vCvZi/dqS39/7Fne1hwL6G7pHGWBdG6q9kABsk9LcY2+9lKrDdtOGHqheyV4/4108bOTCREdajG1XVnuDCa9SINM442eC8xHCPCChAyEBqOyMbvN9Ic9nuSEGAq0GifAXrJ/d2DL7EH3YGjmHyYnwVEjDNIM3UKo3cO5BwD8xhFErdkENh+lTrCeokwMGUxInIluVd0FdyURESk/vDrzP6hnTovoE5C9M5TLwxkAnVSTN3yxjFFqoOk9/A3QjrYFaNkSHvh01RGa0eVj1r+Jq96smufvtZKgSkNXScMoY9+QQ9lvxfGjemhavcGmU2xoKfAclQhBvnlKU3HkYSR3JJJeWiZzyimo8xnWCZ1ixG+a2hSqkmD+wiXW9h+okloUGfxa4bGko2dntuy0t119SJsFKtI99r2tZzRTL4nPxUyRq8="}}
END ARCHIVED ABSOLUTE NORMALIZATION PAYLOAD -/
