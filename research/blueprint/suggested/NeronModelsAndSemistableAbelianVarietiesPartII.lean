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

import Mathlib.Algebra.Exact.Basic
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

namespace TauCeti.GenusOne.AffinePinching
variable {A B : Type u} [CommRing A] [CommRing B]

lemma commonIdealComparison_bijective_iff (f : A →+* B) (I : Ideal A)
    (himage : (I.map f : Set B) = f '' (I : Set A)) :
    Function.Bijective (commonIdealComparison f I).hom ↔ RingHom.ker f ⊓ I = ⊥ := by sorry

lemma conductorRing_map_comap (S : Subring B) :
    (S.conductor.comap S.subtype).map S.subtype = S.conductor := by sorry

lemma conductorRing_image_comap (S : Subring B) :
    S.subtype '' (S.conductor.comap S.subtype : Set S) = (S.conductor : Set B) := by sorry

end TauCeti.GenusOne.AffinePinching

namespace TauCeti.GenusOne.AffinePinching
variable {A B : Type u} [CommRing A] [CommRing B]

def commonIdealEquiv (f : A →+* B) (I : Ideal A)
    (himage : (I.map f : Set B) = f '' (I : Set A))
    (hker : RingHom.ker f ⊓ I = ⊥) :
    A ≃+* (CommRingCat.pullbackCone
      (CommRingCat.ofHom (Ideal.Quotient.mk (I.map f)))
      (CommRingCat.ofHom (Ideal.quotientMap (I.map f) f Ideal.le_comap_map))).pt := by sorry

lemma commonIdealEquiv_apply (f : A →+* B) (I : Ideal A)
    (himage : (I.map f : Set B) = f '' (I : Set A))
    (hker : RingHom.ker f ⊓ I = ⊥) (a : A) :
    commonIdealEquiv f I himage hker a = (commonIdealComparison f I).hom a := by sorry

lemma commonIdealEquiv_inverse_fst (f : A →+* B) (I : Ideal A)
    (himage : (I.map f : Set B) = f '' (I : Set A))
    (hker : RingHom.ker f ⊓ I = ⊥)
    (p : (CommRingCat.pullbackCone
      (CommRingCat.ofHom (Ideal.Quotient.mk (I.map f)))
      (CommRingCat.ofHom (Ideal.quotientMap (I.map f) f Ideal.le_comap_map))).pt) :
    f ((commonIdealEquiv f I himage hker).symm p) =
      (CommRingCat.pullbackCone
        (CommRingCat.ofHom (Ideal.Quotient.mk (I.map f)))
        (CommRingCat.ofHom (Ideal.quotientMap (I.map f) f Ideal.le_comap_map))).fst.hom p := by sorry

lemma commonIdealEquiv_inverse_snd (f : A →+* B) (I : Ideal A)
    (himage : (I.map f : Set B) = f '' (I : Set A))
    (hker : RingHom.ker f ⊓ I = ⊥)
    (p : (CommRingCat.pullbackCone
      (CommRingCat.ofHom (Ideal.Quotient.mk (I.map f)))
      (CommRingCat.ofHom (Ideal.quotientMap (I.map f) f Ideal.le_comap_map))).pt) :
    Ideal.Quotient.mk I ((commonIdealEquiv f I himage hker).symm p) =
      (CommRingCat.pullbackCone
        (CommRingCat.ofHom (Ideal.Quotient.mk (I.map f)))
        (CommRingCat.ofHom (Ideal.quotientMap (I.map f) f Ideal.le_comap_map))).snd.hom p := by sorry

lemma commonIdealEquiv_inverse_unique (f : A →+* B) (I : Ideal A)
    (himage : (I.map f : Set B) = f '' (I : Set A))
    (hker : RingHom.ker f ⊓ I = ⊥) (a : A)
    (p : (CommRingCat.pullbackCone
      (CommRingCat.ofHom (Ideal.Quotient.mk (I.map f)))
      (CommRingCat.ofHom (Ideal.quotientMap (I.map f) f Ideal.le_comap_map))).pt)
    (hf : f a = (CommRingCat.pullbackCone
      (CommRingCat.ofHom (Ideal.Quotient.mk (I.map f)))
      (CommRingCat.ofHom (Ideal.quotientMap (I.map f) f Ideal.le_comap_map))).fst.hom p)
    (hq : Ideal.Quotient.mk I a = (CommRingCat.pullbackCone
      (CommRingCat.ofHom (Ideal.Quotient.mk (I.map f)))
      (CommRingCat.ofHom (Ideal.quotientMap (I.map f) f Ideal.le_comap_map))).snd.hom p) :
    (commonIdealEquiv f I himage hker).symm p = a := by sorry

def commonIdealDifference (f : A →+* B) (I : Ideal A) : (B × (A ⧸ I)) →+ B ⧸ I.map f := by sorry

lemma commonIdealDifference_apply (f : A →+* B) (I : Ideal A) (b : B) (c : A ⧸ I) :
    commonIdealDifference f I (b, c) = Ideal.Quotient.mk (I.map f) b -
      Ideal.quotientMap (I.map f) f Ideal.le_comap_map c := by sorry

lemma commonIdealDifference_surjective (f : A →+* B) (I : Ideal A) :
    Function.Surjective (commonIdealDifference f I) := by sorry

lemma commonIdeal_exact (f : A →+* B) (I : Ideal A)
    (himage : (I.map f : Set B) = f '' (I : Set A)) :
    Function.Exact (f.prod (Ideal.Quotient.mk I)) (commonIdealDifference f I) := by sorry

lemma commonIdealDiagonal_injective_iff (f : A →+* B) (I : Ideal A) :
    Function.Injective (f.prod (Ideal.Quotient.mk I)) ↔ RingHom.ker f ⊓ I = ⊥ := by sorry

end TauCeti.GenusOne.AffinePinching

namespace TauCeti.GenusOne.AffinePinching
variable {A B : Type u} [CommRing A] [CommRing B]

lemma commonIdealComparison_surjective_iff (f : A →+* B) (I : Ideal A) :
    Function.Surjective (commonIdealComparison f I).hom ↔
      (I.map f : Set B) = f '' (I : Set A) := by sorry

lemma commonIdeal_exact_iff (f : A →+* B) (I : Ideal A) :
    Function.Exact (f.prod (Ideal.Quotient.mk I)) (commonIdealDifference f I) ↔
      (I.map f : Set B) = f '' (I : Set A) := by sorry

end TauCeti.GenusOne.AffinePinching

namespace TauCeti.GenusOne.FerrandPushout
lemma conductor_comap_algEquiv {A B C : Type u} [CommRing A] [CommRing B] [CommRing C]
    [Algebra A B] [Algebra A C] (e : B ≃ₐ[A] C) :
    ((algebraMap A B).range.conductor).comap (algebraMap A B) =
      ((algebraMap A C).range.conductor).comap (algebraMap A C) := by sorry

end TauCeti.GenusOne.FerrandPushout

namespace TauCeti.GenusOne.AffinePinching
variable {A B : Type u} [CommRing A] [CommRing B]

-- test: AffinePinching.commonIdealEquiv.test_noninjective_zero_inverse
example (a : ℤ) :
    let f := Int.castRingHom (ZMod 2)
    let hImage : ((⊥ : Ideal ℤ).map f : Set (ZMod 2)) = f '' ((⊥ : Ideal ℤ) : Set ℤ) := by ext b; simp
    let hKernel : RingHom.ker f ⊓ (⊥ : Ideal ℤ) = ⊥ := by simp
    (commonIdealEquiv f ⊥ hImage hKernel).symm ((commonIdealComparison f ⊥).hom a) = a := by sorry

-- test: AffinePinching.commonIdealEquiv.test_identity_inverse
example (I : Ideal A) (a : A) :
    let hImage : (I.map (RingHom.id A) : Set A) = (RingHom.id A) '' (I : Set A) := by simp
    let hKernel : RingHom.ker (RingHom.id A) ⊓ I = ⊥ := by
      rw [(RingHom.injective_iff_ker_eq_bot _).mp Function.injective_id, bot_inf_eq]
    (commonIdealEquiv (RingHom.id A) I hImage hKernel).symm
      ((commonIdealComparison (RingHom.id A) I).hom a) = a := by sorry

-- test: AffinePinching.commonIdealEquiv.test_distinct_representatives
example :
    let I : Ideal ℤ := Ideal.span {2}
    let hImage : (I.map (RingHom.id ℤ) : Set ℤ) = (RingHom.id ℤ) '' (I : Set ℤ) := by simp
    let hKernel : RingHom.ker (RingHom.id ℤ) ⊓ I = ⊥ := by
      rw [(RingHom.injective_iff_ker_eq_bot _).mp Function.injective_id, bot_inf_eq]
    let p : (Ideal.Quotient.mk (I.map (RingHom.id ℤ))).pullback
        (Ideal.quotientMap (I.map (RingHom.id ℤ)) (RingHom.id ℤ) Ideal.le_comap_map) :=
      ⟨(7, Ideal.Quotient.mk I 3), by
        change Ideal.Quotient.mk (I.map (RingHom.id ℤ)) 7 = Ideal.Quotient.mk (I.map (RingHom.id ℤ)) 3
        rw [Ideal.Quotient.eq, Ideal.map_id]
        norm_num [I, Ideal.mem_span_singleton]⟩
    (commonIdealEquiv (RingHom.id ℤ) I hImage hKernel).symm p = 7 ∧
      (commonIdealEquiv (RingHom.id ℤ) I hImage hKernel).symm p ≠ 3 := by sorry

-- test: AffinePinching.commonIdealDifference.test_identity_exact
example (I : Ideal A) :
    Function.Exact ((RingHom.id A).prod (Ideal.Quotient.mk I))
      (commonIdealDifference (RingHom.id A) I) := by sorry

-- test: AffinePinching.commonIdealDifference.test_noninjective_exact
example :
    let f := Int.castRingHom (ZMod 2)
    Function.Exact (f.prod (Ideal.Quotient.mk (RingHom.ker f)))
      (commonIdealDifference f (RingHom.ker f)) ∧
      ¬ Function.Injective (f.prod (Ideal.Quotient.mk (RingHom.ker f))) := by sorry

-- test: AffinePinching.commonIdealDifference.test_diagonal_failure
example :
    let f := (RingHom.id (ZMod 2)).prod (RingHom.id (ZMod 2))
    Function.Surjective (commonIdealDifference f ⊤) ∧
      ¬ Function.Exact (f.prod (Ideal.Quotient.mk ⊤)) (commonIdealDifference f ⊤) := by sorry

-- test: AffinePinching.commonIdealDifference.test_minus_sign
example :
    commonIdealDifference (RingHom.id ℤ) ⊥ (0, Ideal.Quotient.mk ⊥ 1) =
      -Ideal.Quotient.mk ((⊥ : Ideal ℤ).map (RingHom.id ℤ)) 1 := by sorry

end TauCeti.GenusOne.AffinePinching

namespace TauCeti.GenusOne.FerrandPushout
-- test: FerrandPushout.conductor_eq_annihilator.test_noninjective_surjection
example :
    Module.annihilator ℤ ((ZMod 2) ⧸ Submodule.span ℤ ({1} : Set (ZMod 2))) = ⊤ ∧
      RingHom.ker (algebraMap ℤ (ZMod 2)) ≠ ⊥ := by sorry

-- test: FerrandPushout.conductor_eq_annihilator.test_identity_nonreduced
example :
    ((algebraMap (ZMod 4) (ZMod 4)).range.conductor).comap (algebraMap (ZMod 4) (ZMod 4)) = ⊤ ∧
      (2 : ZMod 4) ^ 2 = 0 ∧ (2 : ZMod 4) ≠ 0 := by sorry

end TauCeti.GenusOne.FerrandPushout

open AlgebraicGeometry
namespace TauCeti.GenusOne.QuadraticPinch.Global
noncomputable section
set_option backward.isDefEq.respectTransparency false
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


lemma normalization_sections_conductor_annihilator (a b : k) (U : (curve a b).Opens) :
    (((normalization a b).app U).hom.range.conductor).comap ((normalization a b).app U).hom =
      Module.annihilator Γ(curve a b, U)
        (Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U) ⧸
          Submodule.span Γ(curve a b, U) ({1} : Set Γ(normalizationSource a b, normalization a b ⁻¹ᵁ U))) := by sorry

lemma absoluteNormalization_sections_conductor (a b : k) (U : (curve a b).Opens) :
    (((normalization a b).app U).hom.range.conductor).comap ((normalization a b).app U).hom =
      ((((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization.app U).hom.range.conductor).comap
        (((curve a b).fromSpecStalk (genericPoint (curve a b))).fromNormalization.app U).hom := by sorry

-- test: QuadraticPinch.Global.conductor.test_cusp_comparison
example (U : (curve (0 : k) 0).Opens) :
    (((normalization (0 : k) 0).app U).hom.range.conductor).comap ((normalization (0 : k) 0).app U).hom =
      ((((curve (0 : k) 0).fromSpecStalk (genericPoint (curve (0 : k) 0))).fromNormalization.app U).hom.range.conductor).comap
        (((curve (0 : k) 0).fromSpecStalk (genericPoint (curve (0 : k) 0))).fromNormalization.app U).hom := by sorry

-- test: QuadraticPinch.Global.conductor.test_empty_comparison
example :
    (((normalization (1 : ZMod 2) 1).app ⊥).hom.range.conductor).comap
      ((normalization (1 : ZMod 2) 1).app ⊥).hom =
      ((((curve (1 : ZMod 2) 1).fromSpecStalk (genericPoint (curve (1 : ZMod 2) 1))).fromNormalization.app ⊥).hom.range.conductor).comap
        (((curve (1 : ZMod 2) 1).fromSpecStalk (genericPoint (curve (1 : ZMod 2) 1))).fromNormalization.app ⊥).hom := by sorry

end
end TauCeti.GenusOne.QuadraticPinch.Global
