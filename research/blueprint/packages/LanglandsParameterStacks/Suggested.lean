/-
This file is not the roadmap and is not exhaustive. README.md is definitive;
these statements suggest Lean forms so that contributors and reviewers converge
on names and signatures. Proofs using `sorry` do not claim an implementation.

These include ordinary group, ring and split GL_n signatures, together with
an affine cocycle scheme and its free-cocycle invariant diagram, both built from
the imported Hopf group of points. The complete
condensed coefficient convention, algebraic regularity, scheme parabolics,
admissible complex enhancements, and stable infinity-category constructions
require the supplier interfaces specified in README.md. In particular,
LParameter is the ordinary continuous shadow, and WeilDeligneParameter is the
split GL_n shadow. Neither is the full parameter functor. No missing condition
is replaced by an unconstrained Prop field or a True-valued predicate.
-/
import Mathlib.GroupTheory.SemidirectProduct
import Mathlib.Algebra.Group.PUnit
import Mathlib.GroupTheory.FreeGroup.Basic
import Mathlib.GroupTheory.PresentedGroup
import Mathlib.GroupTheory.QuotientGroup.Defs
import Mathlib.GroupTheory.Subgroup.Center
import Mathlib.GroupTheory.Perm.Cycle.Factors
import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Group
import Mathlib.GroupTheory.Perm.Sign
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.Topology.Algebra.Group.Quotient
import Mathlib.Topology.Algebra.Group.Neighborhood
import Mathlib.Topology.Algebra.OpenSubgroup
import Mathlib.Topology.Instances.Rat
import Mathlib.Algebra.Algebra.Subalgebra.Basic
import Mathlib.Algebra.Algebra.Prod
import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.Algebra.Category.Ring.Colimits
import Mathlib.Algebra.Category.CommAlgCat.Basic
import Mathlib.AlgebraicGeometry.AffineScheme
import Mathlib.RingTheory.FinitePresentation
import Mathlib.RingTheory.Flat.Basic
import Mathlib.RingTheory.HopfAlgebra.MonoidAlgebra
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.Algebra.Polynomial.AlgebraMap
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.RingTheory.Nilpotent.Defs
import Mathlib.RepresentationTheory.Basic
import Mathlib.Algebra.Module.Projective
import Mathlib.RingTheory.TensorProduct.Finite
import Mathlib.CategoryTheory.Limits.Shapes.Terminal
import Mathlib.CategoryTheory.Limits.Shapes.BinaryProducts.BinaryFan
import Mathlib.CategoryTheory.Limits.Sifted
import Mathlib.Topology.Instances.Matrix
import TauCeti.GroupTheory.FixedSubgroup
import TauCeti.Algebra.AlgebraicGroup.PointsFunctor

open CategoryTheory CategoryTheory.Limits
open scoped BigOperators TensorProduct

namespace TauCeti.LanglandsParameterStacks
universe u v w z

section Crossed
variable {Γ : Type u} {H : Type v} [Group Γ] [Group H]

/-- LP0's group-theoretic definition; the action is a genuine automorphism action. -/
structure CrossedCocycle (α : Γ →* MulAut H) where
  toFun : Γ → H
  map_mul' : ∀ x y, toFun (x * y) = toFun x * α x (toFun y)

instance {α : Γ →* MulAut H} : CoeFun (CrossedCocycle α) (fun _ => Γ → H) :=
  ⟨CrossedCocycle.toFun⟩

namespace CrossedCocycle
variable {α : Γ →* MulAut H}
@[ext] theorem ext {c d : CrossedCocycle α} (h : ∀ x, c x = d x) : c = d := by
  sorry

theorem map_one (c : CrossedCocycle α) : c 1 = 1 := by sorry

theorem map_inv (c : CrossedCocycle α) (x : Γ) :
    c x⁻¹ = α x⁻¹ (c x)⁻¹ := by sorry

def unit (α : Γ →* MulAut H) : CrossedCocycle α where
  toFun := fun _ => 1
  map_mul' := by intro x y; simp

def gauge (c : CrossedCocycle α) (h : H) : CrossedCocycle α where
  toFun := fun x => h * c x * (α x h)⁻¹
  map_mul' := by
    intro x y
    simp only [c.map_mul', map_mul, _root_.map_inv, MulAut.mul_apply]
    group

theorem gauge_one (c : CrossedCocycle α) : c.gauge 1 = c := by sorry

theorem gauge_mul (c : CrossedCocycle α) (h k : H) :
    (c.gauge k).gauge h = c.gauge (h * k) := by sorry

def restrict {Δ : Type w} [Group Δ] (c : CrossedCocycle α) (f : Δ →* Γ) :
    CrossedCocycle (α.comp f) where
  toFun := fun x => c (f x)
  map_mul' := by
    intro x y
    simpa only [map_mul, MonoidHom.comp_apply] using c.map_mul' (f x) (f y)

def map {K : Type w} [Group K] {β : Γ →* MulAut K}
    (c : CrossedCocycle α) (f : H →* K)
    (hf : ∀ x h, f (α x h) = β x (f h)) : CrossedCocycle β where
  toFun := fun x => f (c x)
  map_mul' := by sorry

def asSection (c : CrossedCocycle α) : Γ →* SemidirectProduct H Γ α where
  toFun := fun x => ⟨c x, x⟩
  map_one' := by sorry
  map_mul' := by sorry

abbrev Sections (α : Γ →* MulAut H) :=
  {s : Γ →* SemidirectProduct H Γ α //
    (SemidirectProduct.rightHom : SemidirectProduct H Γ α →* Γ).comp s =
      MonoidHom.id Γ}

def sectionEquiv (α : Γ →* MulAut H) : CrossedCocycle α ≃ Sections α := by sorry

theorem sectionEquiv_right (c : CrossedCocycle α) (x : Γ) :
    (((sectionEquiv α) c).val x).right = x := by sorry

theorem sectionEquiv_left (c : CrossedCocycle α) (x : Γ) :
    (((sectionEquiv α) c).val x).left = c x := by sorry

theorem restrict_comp {Δ : Type w} [Group Δ] {K : Type z} [Group K]
    (c : CrossedCocycle α) (f : Δ →* Γ) (g : K →* Δ) :
    (c.restrict f).restrict g = c.restrict (f.comp g) := by
  sorry

theorem restrict_id_apply (c : CrossedCocycle α) (x : Γ) :
    c.restrict (MonoidHom.id Γ) x = c x := by sorry

theorem restrict_gauge {Δ : Type w} [Group Δ] (c : CrossedCocycle α)
    (f : Δ →* Γ) (h : H) :
    (c.gauge h).restrict f = (c.restrict f).gauge h := by sorry

theorem map_id (c : CrossedCocycle α) :
    c.map (β := α) (MonoidHom.id H) (fun _ _ => rfl) = c := by sorry

theorem map_comp {K : Type w} [Group K] {L : Type z} [Group L]
    {β : Γ →* MulAut K} {χ : Γ →* MulAut L}
    (c : CrossedCocycle α) (f : H →* K) (g : K →* L)
    (hf : ∀ x h, f (α x h) = β x (f h))
    (hg : ∀ x k, g (β x k) = χ x (g k)) :
    (c.map f hf).map g hg =
      c.map (g.comp f) (fun x h =>
        (congrArg g (hf x h)).trans (hg x (f h))) := by sorry

theorem map_gauge {K : Type w} [Group K] {β : Γ →* MulAut K}
    (c : CrossedCocycle α) (f : H →* K)
    (hf : ∀ x h, f (α x h) = β x (f h)) (h : H) :
    (c.gauge h).map f hf = (c.map f hf).gauge (f h) := by sorry

def gaugeSetoid (α : Γ →* MulAut H) : Setoid (CrossedCocycle α) where
  r c d := ∃ h : H, d = c.gauge h
  iseqv := by sorry

def orbit (c : CrossedCocycle α) : Quotient (gaugeSetoid α) := Quotient.mk _ c

theorem orbit_gauge (c : CrossedCocycle α) (h : H) :
    (c.gauge h).orbit = c.orbit := by sorry

def restrictOrbit {Δ : Type w} [Group Δ] (f : Δ →* Γ) :
    Quotient (gaugeSetoid α) → Quotient (gaugeSetoid (α.comp f)) :=
  Quotient.map (fun c => c.restrict f) (by sorry)

theorem restrictOrbit_mk {Δ : Type w} [Group Δ] (f : Δ →* Γ)
    (c : CrossedCocycle α) : restrictOrbit f c.orbit = (c.restrict f).orbit := by sorry

-- cocycle_trivial_action
example : CrossedCocycle (1 : Γ →* MulAut H) ≃ (Γ →* H) := by sorry

-- cocycle_trivial_group
example (α : Unit →* MulAut H) : Subsingleton (CrossedCocycle α) := by sorry

-- cocycle_coboundary
example (α : Γ →* MulAut H) (h : H) (x : Γ) :
    ((unit α).gauge h) x = h * (α x h)⁻¹ := by sorry

/-- A fully concrete version of the C₂ acting by negation test. -/
def signAction : Multiplicative (ZMod 2) →* MulAut (Multiplicative ℤ) := by sorry

theorem signAction_generator (x : Multiplicative ℤ) :
    signAction (Multiplicative.ofAdd (1 : ZMod 2)) x =
      Multiplicative.ofAdd (-x.toAdd) := by sorry

def signCocycle : CrossedCocycle signAction := by sorry

theorem signCocycle_generator :
    signCocycle (Multiplicative.ofAdd (1 : ZMod 2)) = Multiplicative.ofAdd (1 : ℤ) := by
  sorry

-- cocycle_not_hom
example : ¬ ∃ f : Multiplicative (ZMod 2) →* Multiplicative ℤ,
    ∀ x, f x = signCocycle x := by sorry
end CrossedCocycle
end Crossed

section FreeCrossed
variable {I : Type u} {H : Type v} [Group H]

namespace CrossedCocycle
/-- Generator values extend by lifting into the genuine semidirect product. -/
noncomputable def fromGenerators (α : FreeGroup I →* MulAut H) (g : I → H) :
    CrossedCocycle α := by sorry

theorem fromGenerators_of (α : FreeGroup I →* MulAut H) (g : I → H) (i : I) :
    fromGenerators α g (FreeGroup.of i) = g i := by sorry

noncomputable def generatorEquiv (α : FreeGroup I →* MulAut H) :
    CrossedCocycle α ≃ (I → H) := by sorry

theorem generatorEquiv_apply (α : FreeGroup I →* MulAut H)
    (c : CrossedCocycle α) (i : I) :
    generatorEquiv α c i = c (FreeGroup.of i) := by sorry

theorem generatorEquiv_symm (α : FreeGroup I →* MulAut H) (g : I → H) :
    (generatorEquiv α).symm g = fromGenerators α g := by sorry
end CrossedCocycle
end FreeCrossed

/-! ## LP0.4: arithmetic-to-geometric degree conversion

ClassFieldTheory supplies the Weil group and its arithmetic degree; SR.6.1
supplies its finite-wild discretization. These formulas use an imported degree
map without constructing another Weil group. The integral Frobenius and
semidirect-product inversion interfaces belong to SR.6.1.
-/
namespace WeilConvention
variable {W : Type u} [Group W]

/-- The geometric degree is the negative of the arithmetic degree.
`Multiplicative ℤ` records additive integer degree as a group homomorphism. -/
def geometricDegree (arithmeticDegree : W →* Multiplicative ℤ) :
    W →* Multiplicative ℤ := arithmeticDegree⁻¹

theorem geometricDegree_apply (d : W →* Multiplicative ℤ) (w : W) :
    (geometricDegree d w).toAdd = -(d w).toAdd := by sorry

theorem geometricDegree_involutive (d : W →* Multiplicative ℤ) :
    geometricDegree (geometricDegree d) = d := by sorry

theorem geometricDegree_ker (d : W →* Multiplicative ℤ) :
    (geometricDegree d).ker = d.ker := by sorry

theorem geometricDegree_comp {V : Type v} [Group V]
    (d : W →* Multiplicative ℤ) (f : V →* W) :
    geometricDegree (d.comp f) = (geometricDegree d).comp f := by sorry

theorem geometricDegree_frobenius (d : W →* Multiplicative ℤ) (F : W)
    (hF : (d F).toAdd = 1) :
    (geometricDegree d F).toAdd = -1 ∧
      (geometricDegree d F⁻¹).toAdd = 1 := by sorry

/-- For a unit representing the residue cardinality, the scaling character is
q to the arithmetic degree, equivalently q to minus the geometric degree. -/
def tateCharacter {K : Type v} [CommRing K]
    (d : W →* Multiplicative ℤ) (q : Kˣ) : W →* Kˣ where
  toFun w := q ^ (d w).toAdd
  map_one' := by sorry
  map_mul' := by sorry

theorem tateCharacter_geometric {K : Type v} [CommRing K]
    (d : W →* Multiplicative ℤ) (q : Kˣ) (w : W) :
    tateCharacter d q w = q ^ (-(geometricDegree d w).toAdd) := by sorry

theorem tateCharacter_comp {V : Type w} [Group V]
    {K : Type v} [CommRing K] (d : W →* Multiplicative ℤ)
    (q : Kˣ) (f : V →* W) :
    tateCharacter (d.comp f) q = (tateCharacter d q).comp f := by sorry

-- degree_geometric_frobenius: an arithmetic generator has geometric degree -1.
example :
    (geometricDegree (MonoidHom.id (Multiplicative ℤ))
      (Multiplicative.ofAdd (1 : ℤ))).toAdd = -1 ∧
    (geometricDegree (MonoidHom.id (Multiplicative ℤ))
      (Multiplicative.ofAdd (-1 : ℤ))).toAdd = 1 := by sorry

-- degree_inertia: the conversion keeps the actual degree-zero subgroup.
example (d : W →* Multiplicative ℤ) (w : W) :
    w ∈ (geometricDegree d).ker ↔ w ∈ d.ker := by sorry

-- degree_zero: unramified degree zero is preserved, including the zero map.
example : geometricDegree (1 : W →* Multiplicative ℤ) = 1 := by sorry

-- tate_geometric_frobenius: q=3 gives q^{-1} at geometric Frobenius.
example :
    (tateCharacter (MonoidHom.id (Multiplicative ℤ))
      (Units.mk0 (3 : ℚ) (by norm_num)) (Multiplicative.ofAdd (-1 : ℤ)) : ℚ) =
      1 / 3 := by sorry

-- tate_arithmetic_frobenius: the arithmetic generator gives q.
example :
    (tateCharacter (MonoidHom.id (Multiplicative ℤ))
      (Units.mk0 (3 : ℚ) (by norm_num)) (Multiplicative.ofAdd (1 : ℤ)) : ℚ) =
      3 := by sorry

-- tate_inertia: all degree-zero elements act with scaling one.
example {K : Type v} [CommRing K] (d : W →* Multiplicative ℤ)
    (q : Kˣ) (w : W) (hw : w ∈ d.ker) : tateCharacter d q w = 1 := by sorry

-- tate_zero_degree: the entire character is trivial for the zero degree map.
example {K : Type v} [CommRing K] (q : Kˣ) :
    tateCharacter (1 : W →* Multiplicative ℤ) q = 1 := by sorry
end WeilConvention

/-! ## LP1.1: actual affine cocycle equations

The group model is imported: `WithConv (C →ₐ[R] B)` is the existing Hopf
functor of points. The action is an opposed group of units of bialgebra
endomorphisms, so it is algebraic and natural in B. The coordinate algebra
below is the existing coproduct of commutative algebras, divided by the
explicit relator ideal. No enhanced-stack or reductivity carrier is inferred
from this affine construction. -/
namespace IntegralCocycleScheme
noncomputable section
variable {R C : Type u} [CommRing R] [CommRing C] [HopfAlgebra R C]
variable {I : Type u} [Finite I]

/-- Points of the imported affine group, with convolution. -/
abbrev Points (B : Type u) [CommRing B] [Algebra R B] := WithConv (C →ₐ[R] B)

/-- Coordinate pullback reverses composition, hence the opposite group. -/
abbrev CoordinateAut := ((C →ₐc[R] C)ˣ)ᵐᵒᵖ

def pointAction {Γ : Type u} [Group Γ] (β : Γ →* CoordinateAut (R := R) (C := C))
    (B : Type u) [CommRing B] [Algebra R B] : Γ →* MulAut (Points (R := R) (C := C) B) := by
  sorry

theorem pointAction_apply {Γ : Type u} [Group Γ]
    (β : Γ →* CoordinateAut (R := R) (C := C))
    (B : Type u) [CommRing B] [Algebra R B] (γ : Γ) (f : Points (R := R) (C := C) B) :
    ((pointAction β B γ) f).ofConv =
      f.ofConv.comp (MulOpposite.unop (β γ)).val.toAlgHom := by sorry

theorem pointAction_natural {Γ : Type u} [Group Γ]
    (β : Γ →* CoordinateAut (R := R) (C := C))
    {B D : Type u} [CommRing B] [Algebra R B] [CommRing D] [Algebra R D]
    (f : B →ₐ[R] D) (γ : Γ) (x : Points (R := R) (C := C) B) :
    TauCeti.AlgHom.mapValue f (pointAction β B γ x) =
      pointAction β D γ (TauCeti.AlgHom.mapValue f x) := by sorry

/-- O(H^I), using Mathlib's coproduct rather than a second tensor convention. -/
abbrev tupleCoordinates (I : Type u) :=
  ∐ (fun _ : I => CommAlgCat.of R C)

def generatorPoint (i : I) : Points (R := R) (C := C) (tupleCoordinates (R := R) (C := C) I) :=
  WithConv.toConv (Sigma.ι (fun _ : I => CommAlgCat.of R C) i).hom

def evaluateTuple {B : Type u} [CommRing B] [Algebra R B]
    (g : I → Points (R := R) (C := C) B) :
    tupleCoordinates (R := R) (C := C) I →ₐ[R] B :=
  (Sigma.desc (fun i => CommAlgCat.ofHom (g i).ofConv)).hom

theorem evaluateTuple_generator {B : Type u} [CommRing B] [Algebra R B]
    (g : I → Points (R := R) (C := C) B) (i : I) (a : C) :
    evaluateTuple g ((generatorPoint (R := R) (C := C) i).ofConv a) =
      (g i).ofConv a := by sorry

variable (rels : Finset (FreeGroup I))
variable (β : PresentedGroup (rels : Set (FreeGroup I)) →*
  CoordinateAut (R := R) (C := C))

/-- Universal generator values extended with the specified crossed action. -/
def freeCocycle : CrossedCocycle
    ((pointAction β (tupleCoordinates (R := R) (C := C) I)).comp
      (PresentedGroup.mk (rels : Set (FreeGroup I)))) :=
  CrossedCocycle.fromGenerators _ (generatorPoint (R := R) (C := C))

/-- All coordinate equations c(r)=1; these retain the scheme's nilpotents. -/
def relatorIdeal : Ideal (tupleCoordinates (R := R) (C := C) I) :=
  Ideal.span {x | ∃ r ∈ rels, ∃ a : C,
    x = (freeCocycle rels β r).ofConv a -
      (1 : Points (R := R) (C := C) (tupleCoordinates (R := R) (C := C) I)).ofConv a}

abbrev coordinateRing :=
  tupleCoordinates (R := R) (C := C) I ⧸ relatorIdeal rels β

/-- The actual spectrum of an explicit quotient algebra. -/
def scheme : AlgebraicGeometry.Scheme :=
  AlgebraicGeometry.Spec (CommRingCat.of (coordinateRing rels β))

def universalCocycle :
    CrossedCocycle (pointAction β (coordinateRing rels β)) := by sorry

theorem universalCocycle_generator (i : I) (a : C) :
    (universalCocycle rels β (PresentedGroup.of i)).ofConv a =
      Ideal.Quotient.mk (relatorIdeal rels β)
        ((generatorPoint (R := R) (C := C) i).ofConv a) := by sorry

/-- Algebra-valued points of the explicit spectrum are crossed cocycles. -/
def pointsEquiv (B : Type u) [CommRing B] [Algebra R B] :
    (coordinateRing rels β →ₐ[R] B) ≃ CrossedCocycle (pointAction β B) := by sorry

theorem pointsEquiv_apply (B : Type u) [CommRing B] [Algebra R B]
    (f : coordinateRing rels β →ₐ[R] B)
    (w : PresentedGroup (rels : Set (FreeGroup I))) :
    pointsEquiv rels β B f w =
      TauCeti.AlgHom.mapValue f (universalCocycle rels β w) := by sorry

theorem pointsEquiv_natural {B D : Type u}
    [CommRing B] [Algebra R B] [CommRing D] [Algebra R D]
    (f : coordinateRing rels β →ₐ[R] B) (g : B →ₐ[R] D) :
    pointsEquiv rels β D (g.comp f) =
      (pointsEquiv rels β B f).map (TauCeti.AlgHom.mapValue g)
        (fun w x => pointAction_natural β g w x) := by sorry

/-- A finite algebra-generating set also suffices to impose the relators. -/
theorem relatorIdeal_generators (a : Finset C) (ha : Algebra.adjoin R (a : Set C) = ⊤) :
    relatorIdeal rels β = Ideal.span {x | ∃ r ∈ rels, ∃ t ∈ a,
      x = (freeCocycle rels β r).ofConv t -
        (1 : Points (R := R) (C := C)
          (tupleCoordinates (R := R) (C := C) I)).ofConv t} := by sorry

/-- Finite presentation follows from finite generators/relators and the
finite presentation of the imported group coordinate algebra. -/
theorem finitePresentation [Algebra.FinitePresentation R C] :
    Algebra.FinitePresentation R (coordinateRing rels β) := by sorry

theorem relatorIdeal_empty (β₀ : PresentedGroup ((∅ : Finset (FreeGroup I)) : Set (FreeGroup I)) →*
    CoordinateAut (R := R) (C := C)) :
    relatorIdeal (∅ : Finset (FreeGroup I)) β₀ = ⊥ := by sorry

/-- Coordinate pullback of the genuine twisted conjugation action. -/
def gaugeAction : coordinateRing rels β →ₐ[R] C ⊗[R] coordinateRing rels β :=
  let f : coordinateRing rels β →ₐ[R] C ⊗[R] coordinateRing rels β :=
    Algebra.TensorProduct.includeRight
  (pointsEquiv rels β _).symm
    (((universalCocycle rels β).map (TauCeti.AlgHom.mapValue f)
      (fun w x => pointAction_natural β f w x)).gauge
      (WithConv.toConv Algebra.TensorProduct.includeLeft))

/-- Evaluation at an H-point and a cocycle-scheme point. -/
def evaluateGauge {B : Type u} [CommRing B] [Algebra R B]
    (h : Points (R := R) (C := C) B) (f : coordinateRing rels β →ₐ[R] B) :
    C ⊗[R] coordinateRing rels β →ₐ[R] B :=
  Algebra.TensorProduct.lift h.ofConv f (fun _ _ => Commute.all _ _)

theorem gaugeAction_evaluate {B : Type u} [CommRing B] [Algebra R B]
    (h : Points (R := R) (C := C) B) (f : coordinateRing rels β →ₐ[R] B) :
    pointsEquiv rels β B ((evaluateGauge rels β h f).comp (gaugeAction rels β)) =
      (pointsEquiv rels β B f).gauge h := by sorry

theorem gaugeAction_counit :
    ((Algebra.TensorProduct.lid R (coordinateRing rels β)).toAlgHom.comp
      (Algebra.TensorProduct.map (Bialgebra.counitAlgHom R C)
        (AlgHom.id R (coordinateRing rels β)))).comp (gaugeAction rels β) =
      AlgHom.id R (coordinateRing rels β) := by sorry

theorem gaugeAction_coassoc :
    (Algebra.TensorProduct.assoc R R R C C (coordinateRing rels β)).toAlgHom.comp
      ((Algebra.TensorProduct.map (Bialgebra.comulAlgHom R C)
        (AlgHom.id R (coordinateRing rels β))).comp (gaugeAction rels β)) =
    (Algebra.TensorProduct.map (AlgHom.id R C) (gaugeAction rels β)).comp
      (gaugeAction rels β) := by sorry

/-- Honest scalar extension of the representing coordinate algebra. -/
def baseChange (S : Type u) [CommRing S] [Algebra R S] : AlgebraicGeometry.Scheme :=
  AlgebraicGeometry.Spec (CommRingCat.of (S ⊗[R] coordinateRing rels β))

def baseChangePointsEquiv (S B : Type u) [CommRing S] [Algebra R S]
    [CommRing B] [Algebra R B] [Algebra S B] [IsScalarTower R S B] :
    (S ⊗[R] coordinateRing rels β →ₐ[S] B) ≃ CrossedCocycle (pointAction β B) :=
  (AlgHom.liftEquiv R S (coordinateRing rels β) B).symm.trans (pointsEquiv rels β B)

theorem baseChangePointsEquiv_apply (S B : Type u) [CommRing S] [Algebra R S]
    [CommRing B] [Algebra R B] [Algebra S B] [IsScalarTower R S B]
    (f : S ⊗[R] coordinateRing rels β →ₐ[S] B)
    (w : PresentedGroup (rels : Set (FreeGroup I))) (a : C) :
    (baseChangePointsEquiv rels β S B f w).ofConv a =
      f (1 ⊗ₜ[R] (universalCocycle rels β w).ofConv a) := by sorry

/-- Independence of a finite presentation of the same abstract group.
This does not assert integral independence of a chosen dense Weil subgroup. -/
def presentationEquiv {J : Type u} [Finite J] (rels' : Finset (FreeGroup J))
    (e : PresentedGroup (rels : Set (FreeGroup I)) ≃*
      PresentedGroup (rels' : Set (FreeGroup J))) :
    coordinateRing rels β ≃ₐ[R] coordinateRing rels' (β.comp e.symm.toMonoidHom) := by
  sorry

theorem presentationEquiv_evaluate {J : Type u} [Finite J]
    (rels' : Finset (FreeGroup J))
    (e : PresentedGroup (rels : Set (FreeGroup I)) ≃*
      PresentedGroup (rels' : Set (FreeGroup J)))
    (B : Type u) [CommRing B] [Algebra R B]
    (f : coordinateRing rels' (β.comp e.symm.toMonoidHom) →ₐ[R] B)
    (w : PresentedGroup (rels : Set (FreeGroup I))) :
    pointsEquiv rels β B (f.comp (presentationEquiv rels β rels' e).toAlgHom) w =
      pointsEquiv rels' (β.comp e.symm.toMonoidHom) B f (e w) := by sorry

-- scheme_free_group
example (β₀ : PresentedGroup ((∅ : Finset (FreeGroup I)) : Set (FreeGroup I)) →*
    CoordinateAut (R := R) (C := C)) :
    Nonempty (coordinateRing (∅ : Finset (FreeGroup I)) β₀ ≃ₐ[R]
      tupleCoordinates (R := R) (C := C) I) := by sorry

-- scheme_trivial_group
example [IsEmpty I]
    (β₀ : PresentedGroup ((∅ : Finset (FreeGroup I)) : Set (FreeGroup I)) →*
      CoordinateAut (R := R) (C := C)) :
    Nonempty (coordinateRing (∅ : Finset (FreeGroup I)) β₀ ≃ₐ[R] R) := by sorry

end
end IntegralCocycleScheme

/-- LP1's scheme, with the finite presentation and algebraic action as explicit inputs. -/
noncomputable abbrev IntegralCocycleScheme {R C I : Type u}
    [CommRing R] [CommRing C] [HopfAlgebra R C] [Finite I]
    (rels : Finset (FreeGroup I))
    (β : PresentedGroup (rels : Set (FreeGroup I)) →*
      IntegralCocycleScheme.CoordinateAut (R := R) (C := C)) :=
  IntegralCocycleScheme.scheme rels β

namespace IntegralCocycleScheme
noncomputable section

/-- Relator for geometric Frobenius, with generator 0=σ and 1=τ. -/
def tameRelator (q : ℕ) : FreeGroup (Fin 2) :=
  (FreeGroup.of (0 : Fin 2))⁻¹ * FreeGroup.of (1 : Fin 2) *
    FreeGroup.of (0 : Fin 2) * (FreeGroup.of (1 : Fin 2) ^ q)⁻¹

abbrev tameRelations (q : ℕ) : Finset (FreeGroup (Fin 2)) := {tameRelator q}

variable (R : Type) [CommRing R]

/-- The two-coordinate torus divided by t^(q-1)-1, without reduction. -/
def tameTorusIdeal (q : ℕ) : Ideal (LaurentPolynomial R ⊗[R] LaurentPolynomial R) :=
  Ideal.span {((Algebra.TensorProduct.includeRight :
    LaurentPolynomial R →ₐ[R] LaurentPolynomial R ⊗[R] LaurentPolynomial R)
      (LaurentPolynomial.T 1)) ^ (q - 1) - 1}

abbrev tameTorusCoordinates (q : ℕ) :=
  (LaurentPolynomial R ⊗[R] LaurentPolynomial R) ⧸ tameTorusIdeal R q

abbrev tameTorusCocycleCoordinates (q : ℕ) :=
  coordinateRing (tameRelations q)
    (1 : PresentedGroup (tameRelations q : Set (FreeGroup (Fin 2))) →*
      CoordinateAut (R := R) (C := LaurentPolynomial R))

-- scheme_tame_torus
example (q : ℕ) (hq : 1 < q) :
    Nonempty (tameTorusCocycleCoordinates R q ≃ₐ[R] tameTorusCoordinates R q) := by sorry

-- scheme_gauge_trivial_torus
example (B : Type) [CommRing B] [Algebra R B]
    (c : CrossedCocycle (pointAction
      (1 : PresentedGroup (tameRelations 3 : Set (FreeGroup (Fin 2))) →*
        CoordinateAut (R := R) (C := LaurentPolynomial R)) B))
    (h : Points (R := R) (C := LaurentPolynomial R) B) : c.gauge h = c := by sorry

-- scheme_algebraic_inversion: action on points reverses coordinate pullback.
example {Γ : Type} [Group Γ]
    (β : Γ →* CoordinateAut (R := R) (C := LaurentPolynomial R)) (γ : Γ)
    (hγ : (MulOpposite.unop (β γ)).val.toAlgHom =
      (LaurentPolynomial.invert (R := R)).toAlgHom)
    (B : Type) [CommRing B] [Algebra R B]
    (h : Points (R := R) (C := LaurentPolynomial R) B) :
    pointAction β B γ h = h⁻¹ := by sorry

-- scheme_twisted_gauge: ordinary conjugation would incorrectly give 1.
example {Γ : Type} [Group Γ]
    (β : Γ →* CoordinateAut (R := R) (C := LaurentPolynomial R)) (γ : Γ)
    (hγ : (MulOpposite.unop (β γ)).val.toAlgHom =
      (LaurentPolynomial.invert (R := R)).toAlgHom)
    (B : Type) [CommRing B] [Algebra R B]
    (h : Points (R := R) (C := LaurentPolynomial R) B) :
    ((CrossedCocycle.unit (pointAction β B)).gauge h) γ = h ^ 2 := by sorry

/-- Universal tame generator in the characteristic-two q=3 fibre. -/
def tameTorusNilpotent : tameTorusCocycleCoordinates (ZMod 2) 3 :=
  (universalCocycle (tameRelations 3)
    (1 : PresentedGroup (tameRelations 3 : Set (FreeGroup (Fin 2))) →*
      CoordinateAut (R := ZMod 2) (C := LaurentPolynomial (ZMod 2)))
    (PresentedGroup.of (1 : Fin 2))).ofConv (LaurentPolynomial.T 1) - 1

-- scheme_tame_torus_nonreduced: reduction would make the first assertion false.
example : tameTorusNilpotent ≠ 0 ∧ tameTorusNilpotent ^ 2 = 0 := by sorry

end
end IntegralCocycleScheme

section Continuous
variable {Γ : Type u} {H : Type v} [Group Γ] [Group H]
  [TopologicalSpace Γ] [TopologicalSpace H]

/-- Continuous-group shadow; the condensed finite-type coefficient condition is omitted. -/
def LParameter (α : Γ →* MulAut H) := {c : CrossedCocycle α // Continuous c}

namespace LParameter
variable {α : Γ →* MulAut H}

@[ext] theorem ext {c d : LParameter α} (h : ∀ x, c.val x = d.val x) :
    c = d := by sorry
def asSection (c : LParameter α) : CrossedCocycle.Sections α :=
  (CrossedCocycle.sectionEquiv α) c.val

def restrictWild (c : LParameter α) (P : Subgroup Γ) :
    LParameter (α.comp P.subtype) :=
  ⟨c.val.restrict P.subtype, by sorry⟩

/-- The ordinary continuous version of the gauge API. The orbit maps of the
action must be continuous; this is explicit data, not an arbitrary Prop field. -/
def gauge [IsTopologicalGroup H] (c : LParameter α) (h : H)
    (hα : ∀ k : H, Continuous (fun x : Γ => α x k)) : LParameter α :=
  ⟨c.val.gauge h, by sorry⟩

theorem gauge_apply [IsTopologicalGroup H] (c : LParameter α) (h : H)
    (hα : ∀ k : H, Continuous (fun x : Γ => α x k)) (x : Γ) :
    (c.gauge h hα).val x = h * c.val x * (α x h)⁻¹ := by sorry

theorem gauge_one [IsTopologicalGroup H] (c : LParameter α)
    (hα : ∀ k : H, Continuous (fun x : Γ => α x k)) :
    c.gauge 1 hα = c := by sorry

theorem gauge_mul [IsTopologicalGroup H] (c : LParameter α) (h k : H)
    (hα : ∀ k : H, Continuous (fun x : Γ => α x k)) :
    (c.gauge k hα).gauge h hα = c.gauge (h * k) hα := by sorry

/-- Equivariant continuous coefficient transport in the ordinary version. -/
def map {K : Type w} [Group K] [TopologicalSpace K] {β : Γ →* MulAut K}
    (c : LParameter α) (f : H →* K) (hf : Continuous f)
    (heq : ∀ x h, f (α x h) = β x (f h)) : LParameter β :=
  ⟨c.val.map f heq, by sorry⟩

/-- Lifts with fixed projection, expressed using the actual semidirect product.
Continuity of the first coordinate is the ordinary condition stated here;
the condensed finite-type section condition remains in the README. -/
def asLift {Q : Type w} [Group Q] (β : Q →* MulAut H) (η : Γ →* Q) :
    LParameter (β.comp η) ≃
      {s : Γ →* SemidirectProduct H Q β //
        (SemidirectProduct.rightHom : SemidirectProduct H Q β →* Q).comp s = η ∧
          Continuous (fun x : Γ => (s x).left)} := by sorry

theorem asLift_left {Q : Type w} [Group Q] (β : Q →* MulAut H) (η : Γ →* Q)
    (c : LParameter (β.comp η)) (x : Γ) :
    ((asLift β η c).val x).left = c.val x := by sorry

theorem asLift_right {Q : Type w} [Group Q] (β : Q →* MulAut H) (η : Γ →* Q)
    (c : LParameter (β.comp η)) (x : Γ) :
    ((asLift β η c).val x).right = η x := by sorry

-- parameter_split_torus: multiplicative characters into any topological abelian group.
example (α : Γ →* MulAut H) (hα : α = 1) :
    LParameter α ≃ {χ : Γ →* H // Continuous χ} := by sorry

-- parameter_section
example (c : LParameter α) (x : Γ) :
    (c.asSection.val x).right = x ∧ (c.asSection.val x).left = c.val x := by sorry
end LParameter

/-- Open means open in the wild subgroup P, not in the full Weil group Γ. -/
def FiniteWildRamification {α : Γ →* MulAut H}
    (c : CrossedCocycle α) (P : Subgroup Γ) : Prop :=
  ∃ U : Subgroup P, IsOpen (U : Set P) ∧ ∀ x : P, x ∈ U → c x.val = 1

def FiniteWildPiece (α : Γ →* MulAut H) (P : Subgroup Γ) :=
  {c : LParameter α // ∀ x : Γ, x ∈ P → c.val x = 1}

namespace FiniteWildPiece
variable {α : Γ →* MulAut H} {P P' : Subgroup Γ}
def inflate (h : P' ≤ P) (c : FiniteWildPiece α P) : FiniteWildPiece α P' := by sorry

theorem inflate_val (h : P' ≤ P) (c : FiniteWildPiece α P) :
    (inflate h c).val = c.val := by sorry
end FiniteWildPiece

-- wild_piece_order
example {α : Γ →* MulAut H} {P P' : Subgroup Γ} (h : P' ≤ P)
    (c : FiniteWildPiece α P) : (c.inflate h).val = c.val := by sorry

-- wild_unramified: trivial cocycles lie in every supplied wild piece.
example (α : Γ →* MulAut H) (P : Subgroup Γ) :
    ∀ x : Γ, x ∈ P → CrossedCocycle.unit α x = 1 := by sorry
end Continuous

/-! ## LP0.3: finite-wild descent on the actual quotient group

The quotient is Mathlib's group quotient with its quotient topology. The
normal subgroup must kill the action as well as the cocycle. This is the
ordinary continuous part of the finite-wild parameter interface; the
relatively discrete condensed coefficient condition is a separate input.
-/
section FiniteWildQuotient
variable {Γ : Type u} {H : Type v} [Group Γ] [Group H]
variable (α : Γ →* MulAut H) (P : Subgroup Γ) [P.Normal]
variable (hα : P ≤ α.ker)

namespace CrossedCocycle
/-- Descend the actual action and the cocycle through the same normal kernel. -/
def descend (c : CrossedCocycle α) (hc : ∀ p : Γ, p ∈ P → c p = 1) :
    CrossedCocycle (QuotientGroup.lift P α hα) := by sorry

theorem descend_mk (c : CrossedCocycle α) (hc : ∀ p : Γ, p ∈ P → c p = 1)
    (γ : Γ) :
    descend α P hα c hc (QuotientGroup.mk γ) = c γ := by sorry

/-- Inflation is inverse to descent, not an arbitrary chosen extension. -/
def quotientEquiv :
    {c : CrossedCocycle α // ∀ p : Γ, p ∈ P → c p = 1} ≃
      CrossedCocycle (QuotientGroup.lift P α hα) := by sorry

theorem quotientEquiv_apply
    (c : {c : CrossedCocycle α // ∀ p : Γ, p ∈ P → c p = 1}) :
    quotientEquiv α P hα c = descend α P hα c.val c.property := by sorry

theorem quotientEquiv_symm_apply
    (d : CrossedCocycle (QuotientGroup.lift P α hα)) (γ : Γ) :
    ((quotientEquiv α P hα).symm d).val γ = d (QuotientGroup.mk γ) := by sorry

theorem descend_gauge (c : CrossedCocycle α)
    (hc : ∀ p : Γ, p ∈ P → c p = 1) (h : H)
    (hcg : ∀ p : Γ, p ∈ P → c.gauge h p = 1) :
    descend α P hα (c.gauge h) hcg = (descend α P hα c hc).gauge h := by sorry

include hα in
/-- The right-hand hypothesis follows from killing both c and the action on P. -/
theorem gauge_trivial_on (c : CrossedCocycle α)
    (hc : ∀ p : Γ, p ∈ P → c p = 1) (h : H) :
    ∀ p : Γ, p ∈ P → c.gauge h p = 1 := by sorry
end CrossedCocycle

variable [TopologicalSpace Γ] [TopologicalSpace H]

namespace LParameter
/-- Continuity descends along the quotient topology; no arbitrary topology is chosen. -/
def quotientEquiv : FiniteWildPiece α P ≃
    LParameter (QuotientGroup.lift P α hα) := by sorry

theorem quotientEquiv_apply (c : FiniteWildPiece α P) (γ : Γ) :
    (quotientEquiv α P hα c).val (QuotientGroup.mk γ) = c.val.val γ := by sorry

theorem quotientEquiv_symm_apply
    (d : LParameter (QuotientGroup.lift P α hα)) (γ : Γ) :
    ((quotientEquiv α P hα).symm d).val.val γ = d.val (QuotientGroup.mk γ) := by sorry

theorem quotientEquiv_gauge [IsTopologicalGroup H]
    (c : FiniteWildPiece α P) (h : H)
    (hact : ∀ k : H, Continuous (fun x : Γ => α x k))
    (hquot : ∀ k : H, Continuous
      (fun x : Γ ⧸ P => QuotientGroup.lift P α hα x k)) :
    quotientEquiv α P hα
      ⟨c.val.gauge h hact, CrossedCocycle.gauge_trivial_on α P hα
        c.val.val c.property h⟩ =
      (quotientEquiv α P hα c).gauge h hquot := by sorry
end LParameter

namespace FiniteWildPiece
/-- The canonical map Γ/P' → Γ/P for P' ≤ P, not a map in the reverse direction. -/
def cutoffMap (P' : Subgroup Γ) [P'.Normal] (h : P' ≤ P) : Γ ⧸ P' →* Γ ⧸ P :=
  QuotientGroup.lift P' (QuotientGroup.mk' P) (by sorry)

theorem cutoffMap_mk (P' : Subgroup Γ) [P'.Normal] (h : P' ≤ P) (γ : Γ) :
    cutoffMap P P' h (QuotientGroup.mk γ) = QuotientGroup.mk γ := by sorry

theorem quotient_inflate (P' : Subgroup Γ) [P'.Normal] (h : P' ≤ P)
    (hα' : P' ≤ α.ker) (c : FiniteWildPiece α P) (x : Γ ⧸ P') :
    (LParameter.quotientEquiv α P' hα' (inflate h c)).val x =
      (LParameter.quotientEquiv α P hα c).val (cutoffMap P P' h x) := by sorry

theorem inflate_injective {P' : Subgroup Γ} (h : P' ≤ P) :
    Function.Injective (inflate (α := α) h) := by sorry
end FiniteWildPiece

omit [P.Normal] in
/-- Compact wild inertia turns an open cocycle kernel into finite image.
The converse uses continuity and T1 separation of the finite image. -/
theorem finiteWild_iff_finite_range [IsTopologicalGroup Γ] [CompactSpace P] [T1Space H]
    (c : LParameter α) :
    FiniteWildRamification c.val P ↔ Set.Finite (Set.range (fun p : P => c.val p.val)) := by
  classical
  have h1 : c.val 1 = 1 := by
    have hm := c.val.map_mul' 1 1
    simp only [one_mul, map_one, MulAut.one_apply] at hm
    exact mul_left_cancel (hm.symm.trans (mul_one _).symm)
  constructor
  · rintro ⟨U, hU, hc⟩
    have : Finite (P ⧸ U) := U.quotient_finite_of_isOpen hU
    let f : P ⧸ U → H := Quotient.lift (fun p : P => c.val p.val) (by
      intro x y hxy
      have hu : x⁻¹ * y ∈ U := QuotientGroup.leftRel_apply.mp hxy
      have hmul := c.val.map_mul' x.val (x⁻¹ * y).val
      rw [hc _ hu, map_one, mul_one] at hmul
      simpa only [Subgroup.coe_mul, Subgroup.coe_inv, mul_inv_cancel_left] using hmul.symm)
    have hr : Set.range (fun p : P => c.val p.val) ⊆ Set.range f := by
      rintro _ ⟨p, rfl⟩
      exact ⟨QuotientGroup.mk p, rfl⟩
    exact (Set.finite_range f).subset hr
  · intro hr
    let U : Subgroup P :=
      { carrier := {p | c.val p.val = 1}
        one_mem' := h1
        mul_mem' := by
          intro x y hx hy
          change c.val (x.val * y.val) = 1
          rw [c.val.map_mul', hx, hy, map_one, mul_one]
        inv_mem' := by
          intro x hx
          change c.val x.val⁻¹ = 1
          have hm := c.val.map_mul' x.val x.val⁻¹
          rw [mul_inv_cancel, h1, hx, one_mul] at hm
          exact (α x.val).injective (by simpa only [map_one] using hm.symm) }
    refine ⟨U, ?_, fun _ hx => hx⟩
    have hclosed := (hr.sdiff (t := {1})).isClosed
    have hpre : (U : Set P) =
        (fun p : P => c.val p.val) ⁻¹' (Set.range (fun p : P => c.val p.val) \ {1})ᶜ := by
      ext p
      simp [U]
    rw [hpre]
    exact hclosed.isOpen_compl.preimage (c.property.comp continuous_subtype_val)

-- The trivial cutoff is an honest quotient by the identity subgroup.
example (hbot : (⊥ : Subgroup Γ) ≤ α.ker) (c : LParameter α) (γ : Γ) :
    (LParameter.quotientEquiv α ⊥ hbot
      ⟨c, by
        intro p hp
        have hp' : p = 1 := by simpa only [Subgroup.mem_bot] using hp
        simpa only [hp'] using c.val.map_one⟩).val (QuotientGroup.mk γ) =
        c.val γ := by sorry

-- Killing the whole source also kills its action, and leaves the unique unit cocycle.
example (htop : (⊤ : Subgroup Γ) ≤ α.ker) (c : FiniteWildPiece α ⊤)
    (x : Γ ⧸ (⊤ : Subgroup Γ)) :
    (LParameter.quotientEquiv α ⊤ htop c).val x = 1 := by sorry

-- Ordinary topological portion of wild_finite_image, including nondiscrete targets.
omit [P.Normal] in
example [IsTopologicalGroup Γ] [CompactSpace P] [T1Space H] (c : LParameter α) :
    FiniteWildRamification c.val P ↔ Set.Finite (Set.range (fun p : P => c.val p.val)) :=
  finiteWild_iff_finite_range α P c

-- A unit cocycle kills every subgroup, but cannot descend a nontrivial action.
example :
    (∀ x : Multiplicative (ZMod 2), CrossedCocycle.unit CrossedCocycle.signAction x = 1) ∧
    ¬ (⊤ : Subgroup (Multiplicative (ZMod 2))) ≤ CrossedCocycle.signAction.ker := by sorry
end FiniteWildQuotient

/-! The kernel of the L-group lift, rather than just the cocycle's identity
fibre, gives a cutoff normal in the whole source and kills the prescribed Q-map. -/
namespace NormalWildCutoff
variable {Γ : Type u} {H : Type v} {Q : Type w}
  [Group Γ] [Group H] [Group Q]
variable (β : Q →* MulAut H) (η : Γ →* Q)

/-- The concrete lift with the fixed Q-projection. -/
def lift (c : CrossedCocycle (β.comp η)) : Γ →* SemidirectProduct H Q β where
  toFun x := ⟨c x, η x⟩
  map_one' := by
    have hm := c.map_mul' 1 1
    simp only [one_mul, map_one, MulAut.one_apply] at hm
    have h1 : c 1 = 1 := mul_left_cancel (hm.symm.trans (mul_one _).symm)
    exact SemidirectProduct.ext h1 η.map_one
  map_mul' x y := SemidirectProduct.ext (c.map_mul' x y) (η.map_mul x y)

/-- A subgroup of Γ: normality will come from that of P and the lift's kernel. -/
def subgroup (P : Subgroup Γ) (c : CrossedCocycle (β.comp η)) : Subgroup Γ :=
  P ⊓ (lift β η c).ker

theorem mem_subgroup (P : Subgroup Γ) (c : CrossedCocycle (β.comp η)) (x : Γ) :
    x ∈ subgroup β η P c ↔ x ∈ P ∧ c x = 1 ∧ η x = 1 := by
  change (x ∈ P ∧ lift β η c x = 1) ↔ _
  constructor
  · rintro ⟨hp, hx⟩
    exact ⟨hp, congrArg SemidirectProduct.left hx, congrArg SemidirectProduct.right hx⟩
  · rintro ⟨hp, hc, hη⟩
    exact ⟨hp, SemidirectProduct.ext hc hη⟩

instance (P : Subgroup Γ) [P.Normal] (c : CrossedCocycle (β.comp η)) :
    (subgroup β η P c).Normal := by
  unfold subgroup
  infer_instance

theorem le_wild (P : Subgroup Γ) (c : CrossedCocycle (β.comp η)) :
    subgroup β η P c ≤ P := inf_le_left

theorem le_projection_kernel (P : Subgroup Γ) (c : CrossedCocycle (β.comp η)) :
    subgroup β η P c ≤ η.ker := by
  intro x hx
  exact ((mem_subgroup β η P c x).mp hx).2.2

theorem kills_cocycle (P : Subgroup Γ) (c : CrossedCocycle (β.comp η)) :
    ∀ x : Γ, x ∈ subgroup β η P c → c x = 1 := by
  intro x hx
  exact ((mem_subgroup β η P c x).mp hx).2.1

/-- The topology is relative to P. Neither P nor this subgroup is assumed
open in Γ, and no finiteness of the parameter's image outside P is used. -/
theorem isOpen [TopologicalSpace Γ] [TopologicalSpace H] [T1Space H]
    [TopologicalSpace Q] [DiscreteTopology Q] (P : Subgroup Γ)
    (c : LParameter (β.comp η))
    (hη : Continuous (fun p : P => η p.val))
    (hfin : Set.Finite (Set.range (fun p : P => c.val p.val))) :
    IsOpen (P.subtype ⁻¹' (subgroup β η P c.val : Set Γ)) := by
  have hclosed := (hfin.sdiff (t := {1})).isClosed
  have hpre : P.subtype ⁻¹' (subgroup β η P c.val : Set Γ) =
      (fun p : P => c.val p.val) ⁻¹'
        (Set.range (fun p : P => c.val p.val) \ {1})ᶜ ∩
      (fun p : P => η p.val) ⁻¹' {1} := by
    ext p
    simp [mem_subgroup]
  rw [hpre]
  exact (hclosed.isOpen_compl.preimage (c.property.comp continuous_subtype_val)).inter
    ((isOpen_discrete ({1} : Set Q)).preimage hη)

/-- Relative openness and full-source normality together provide an admissible
cutoff for the fixed-projection parameter problem. -/
theorem exists_cutoff [TopologicalSpace Γ] [TopologicalSpace H] [T1Space H]
    [TopologicalSpace Q] [DiscreteTopology Q] (P : Subgroup Γ) [P.Normal]
    (c : LParameter (β.comp η))
    (hη : Continuous (fun p : P => η p.val))
    (hfin : Set.Finite (Set.range (fun p : P => c.val p.val))) :
    ∃ U : Subgroup Γ, U.Normal ∧ U ≤ P ∧
      IsOpen (P.subtype ⁻¹' (U : Set Γ)) ∧ U ≤ η.ker ∧
      ∀ x : Γ, x ∈ U → c.val x = 1 :=
  ⟨subgroup β η P c.val, inferInstance, le_wild β η P c.val,
    isOpen β η P c hη hfin, le_projection_kernel β η P c.val,
    kills_cocycle β η P c.val⟩

/-- Containment of wild subgroups gives containment of their cutoffs. -/
theorem subgroup_mono {P P' : Subgroup Γ} (h : P' ≤ P)
    (c : CrossedCocycle (β.comp η)) :
    subgroup β η P' c ≤ subgroup β η P c := inf_le_inf_right _ h

/-- The cutoff can be refined inside a preassigned subgroup. Normality and
relative openness of that subgroup give the same properties for the refinement. -/
theorem subgroup_inf (P V : Subgroup Γ) (c : CrossedCocycle (β.comp η)) :
    subgroup β η (P ⊓ V) c = subgroup β η P c ⊓ V := by
  ext x
  simp only [mem_subgroup, Subgroup.mem_inf]
  constructor
  · rintro ⟨⟨hp, hv⟩, hc, hη⟩
    exact ⟨⟨hp, hc, hη⟩, hv⟩
  · rintro ⟨⟨hp, hc, hη⟩, hv⟩
    exact ⟨⟨hp, hv⟩, hc, hη⟩

/-- A cutoff of the fixed-projection lift is unchanged by changing its framing. -/
theorem subgroup_gauge (P : Subgroup Γ) (c : CrossedCocycle (β.comp η)) (h : H) :
    subgroup β η P (c.gauge h) = subgroup β η P c := by
  ext x
  rw [mem_subgroup, mem_subgroup]
  constructor
  · rintro ⟨hp, hc, hη⟩
    have hval : h * c x * h⁻¹ = 1 := by
      simpa [CrossedCocycle.gauge, hη] using hc
    have hcx : c x = 1 := by
      have := congrArg (fun y : H => h⁻¹ * y * h) hval
      simpa [mul_assoc] using this
    exact ⟨hp, hcx, hη⟩
  · rintro ⟨hp, hc, hη⟩
    exact ⟨hp, by simp [CrossedCocycle.gauge, hc, hη], hη⟩

/-- The chosen subgroup is the largest subgroup of P killing the lift. -/
theorem le_subgroup_iff (P V : Subgroup Γ) (c : CrossedCocycle (β.comp η)) :
    V ≤ subgroup β η P c ↔
      V ≤ P ∧ V ≤ η.ker ∧ ∀ x : Γ, x ∈ V → c x = 1 := by
  constructor
  · intro hv
    exact ⟨fun x hx => ((mem_subgroup β η P c x).mp (hv hx)).1,
      fun x hx => ((mem_subgroup β η P c x).mp (hv hx)).2.2,
      fun x hx => ((mem_subgroup β η P c x).mp (hv hx)).2.1⟩
  · rintro ⟨hp, hη, hc⟩ x hx
    exact (mem_subgroup β η P c x).mpr ⟨hp hx, hc x hx, hη hx⟩

/-- Restricting the source pulls back the cutoff, without requiring injectivity. -/
theorem subgroup_restrict {Δ : Type z} [Group Δ] (f : Δ →* Γ)
    (P : Subgroup Γ) (c : CrossedCocycle (β.comp η)) :
    subgroup β (η.comp f) (P.comap f) (c.restrict f) =
      (subgroup β η P c).comap f := by
  ext x
  simp only [mem_subgroup, Subgroup.mem_comap, CrossedCocycle.restrict,
    MonoidHom.comp_apply]

-- cutoff_gauge_twisted: gauge can change the cocycle's identity fibre;
-- the fixed-projection lift still has exactly the same cutoff.
example :
    let G := Equiv.Perm (Fin 3)
    let c := CrossedCocycle.unit (MulAut.conj : G →* MulAut G)
    let h := Equiv.swap (0 : Fin 3) 1
    let x := Equiv.swap (1 : Fin 3) 2
    c x = 1 ∧ c.gauge h x ≠ 1 ∧
      subgroup MulAut.conj (MonoidHom.id G) ⊤ (c.gauge h) =
        subgroup MulAut.conj (MonoidHom.id G) ⊤ c := by
  dsimp only
  refine ⟨rfl, ?_, subgroup_gauge _ _ _ _ _⟩
  change
    Equiv.swap (0 : Fin 3) 1 *
        ((MulAut.conj (Equiv.swap (1 : Fin 3) 2)) (Equiv.swap (0 : Fin 3) 1))⁻¹ ≠ 1
  decide

-- cutoff_nontrivial_kernel: a proper nonidentity kernel must be retained,
-- rather than selecting an arbitrary smaller subgroup that also kills c.
example :
    let G := Multiplicative (ZMod 4)
    let c : CrossedCocycle ((1 : Unit →* MulAut G).comp (1 : G →* Unit)) :=
      {toFun := fun x => x ^ 2
       map_mul' := by intro x y; simp [mul_pow]}
    Multiplicative.ofAdd (2 : ZMod 4) ∈
      subgroup (1 : Unit →* MulAut G) (1 : G →* Unit) ⊤ c ∧
    Multiplicative.ofAdd (1 : ZMod 4) ∉
      subgroup (1 : Unit →* MulAut G) (1 : G →* Unit) ⊤ c := by
  dsimp only
  simp only [mem_subgroup, Subgroup.mem_top, true_and]
  decide

-- cutoff_restrict_kernel: the inverse image of an identity cutoff can be
-- the entire new source when restriction kills the prescribed projection.
example :
    let f : Multiplicative ℤ →* Unit := 1
    let c := CrossedCocycle.unit (1 : Unit →* MulAut Unit)
    subgroup (1 : Unit →* MulAut Unit) ((MonoidHom.id Unit).comp f)
      ((⊥ : Subgroup Unit).comap f) (c.restrict f) = ⊤ := by
  dsimp only
  ext x
  simp [mem_subgroup, CrossedCocycle.restrict, CrossedCocycle.unit]


-- cutoff_fixed_projection: even a trivial action and unit cocycle cannot
-- discard a nontrivial prescribed Q-projection.
example (c : CrossedCocycle β) (hc : ∀ x : Q, c x = 1) (P : Subgroup Q) :
    subgroup β (MonoidHom.id Q) P c = ⊥ := by
  ext x
  simp only [mem_subgroup, hc, MonoidHom.id_apply, Subgroup.mem_bot, true_and]
  exact ⟨fun hx => hx.2, fun hx => by subst x; simp⟩

-- cutoff_cocycle_kernel: with trivial Q, the identity cocycle forces the
-- identity cutoff, rather than the entire wild subgroup.
example (P : Subgroup Γ) :
    subgroup (1 : Unit →* MulAut Γ) (1 : Γ →* Unit) P
      ({ toFun := id
         map_mul' := by intro x y; simp } :
        CrossedCocycle ((1 : Unit →* MulAut Γ).comp (1 : Γ →* Unit))) = ⊥ := by
  ext x
  simp only [mem_subgroup, id_eq, Subgroup.mem_bot]
  exact ⟨fun hx => hx.2.1, fun hx => by subst x; simp⟩

-- cutoff_retains_wild: trivial coefficients and projection leave exactly P,
-- including P=1; intersecting with the ambient wild subgroup is essential.
example (P : Subgroup Γ) :
    subgroup (1 : Unit →* MulAut Unit) (1 : Γ →* Unit) P
      ({ toFun := fun _ => 1
         map_mul' := by intro _ _; simp } :
        CrossedCocycle ((1 : Unit →* MulAut Unit).comp (1 : Γ →* Unit))) = P := by
  ext x
  simp [mem_subgroup]

end NormalWildCutoff

namespace LParameter
/-- Compact wild inertia converts finite wild ramification to the finite image
used by the canonical cutoff. The conclusion kills the prescribed projection,
including components that happen to act trivially on H. -/
theorem exists_normalWildCutoff {Γ : Type u} {H : Type v} {Q : Type w}
    [Group Γ] [Group H] [Group Q] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
    [TopologicalSpace H] [T1Space H] [TopologicalSpace Q] [DiscreteTopology Q]
    (β : Q →* MulAut H) (η : Γ →* Q) (P : Subgroup Γ) [P.Normal] [CompactSpace P]
    (c : LParameter (β.comp η))
    (hη : Continuous (fun p : P => η p.val))
    (hc : FiniteWildRamification c.val P) :
    ∃ U : Subgroup Γ, U.Normal ∧ U ≤ P ∧
      IsOpen (P.subtype ⁻¹' (U : Set Γ)) ∧ U ≤ η.ker ∧
      ∀ x : Γ, x ∈ U → c.val x = 1 :=
  NormalWildCutoff.exists_cutoff β η P c hη
    ((finiteWild_iff_finite_range (β.comp η) P c).mp hc)
end LParameter

namespace FiniteWildChecks
/-- Compactness cannot be dropped from the open-kernel implication. -/
theorem noncompact_counterexample :
    let G := Multiplicative ℤ
    letI : TopologicalSpace G := ⊥
    let c : LParameter (1 : G →* MulAut G) :=
      ⟨{toFun := id, map_mul' := by intros; rfl}, continuous_id⟩
    FiniteWildRamification c.val ⊤ ∧
      ¬ Set.Finite (Set.range (fun p : (⊤ : Subgroup G) => c.val p.val)) := by
  dsimp only
  let : TopologicalSpace (Multiplicative ℤ) := ⊥
  have : DiscreteTopology (Multiplicative ℤ) := discreteTopology_bot _
  constructor
  · refine ⟨⊥, isOpen_discrete _, ?_⟩
    intro x hx
    have hx1 : x = 1 := Subgroup.mem_bot.mp hx
    simp only [hx1, Subgroup.coe_one, id_eq]
  · have hr : Set.range (fun p : (⊤ : Subgroup (Multiplicative ℤ)) => p.val) = Set.univ := by
      ext x
      simp
    simpa only [id_eq, hr] using
      (Set.infinite_univ : (Set.univ : Set (Multiplicative ℤ)).Infinite).not_finite

/-- T1 separation cannot be dropped from the finite-image implication. -/
theorem indiscrete_counterexample :
    let G := Multiplicative (ZMod 2)
    letI : TopologicalSpace G := ⊤
    let c : LParameter (1 : G →* MulAut G) :=
      ⟨{toFun := id, map_mul' := by intros; rfl}, continuous_id⟩
    Set.Finite (Set.range (fun p : (⊤ : Subgroup G) => c.val p.val)) ∧
      ¬ FiniteWildRamification c.val ⊤ := by
  dsimp only
  let : TopologicalSpace (Multiplicative (ZMod 2)) := ⊤
  constructor
  · have : Finite (Multiplicative (ZMod 2)) := Finite.of_equiv (ZMod 2) Multiplicative.ofAdd
    exact Set.finite_range _
  · rintro ⟨U, hU, hu⟩
    have htop : U = ⊤ := by
      apply SetLike.coe_injective
      have ht : (inferInstance : TopologicalSpace (⊤ : Subgroup (Multiplicative (ZMod 2)))) = ⊤ := by
        exact induced_top
      change @IsOpen _ inferInstance (U : Set (⊤ : Subgroup (Multiplicative (ZMod 2)))) at hU
      rw [ht, TopologicalSpace.isOpen_top_iff] at hU
      rcases hU with hU | hU
      · have hempty := congrArg (fun s => (1 : (⊤ : Subgroup (Multiplicative (ZMod 2)))) ∈ s) hU
        simp at hempty
      · simpa using hU
    have hbad := hu ⟨Multiplicative.ofAdd (1 : ZMod 2), Subgroup.mem_top _⟩ (by simp [htop])
    change (1 : ZMod 2) = 0 at hbad
    exact one_ne_zero hbad
end FiniteWildChecks

/-! ## LP2c.4: the finite-coordinate open-kernel argument

BHKT Proposition 4.7(iii), pp.23–24, supplies the proof route; Quast
Theorem 3.7, Claim A, pp.13–14, supplies the disconnected anchor application.
The lemmas expose exactly the finite-coordinate separation input that the
reconstruction supplier must discharge. They do not assert reconstruction
from an arbitrary family of functions.
-/
namespace DiscreteWeilContinuity
variable {W : Type u} {J : Type v} [Group W] [Group J]
variable [TopologicalSpace W] [IsTopologicalGroup W]
variable (I : Subgroup W) (ρ : W →* J)
variable {A : Type w} [TopologicalSpace A] [DiscreteTopology A]
variable {n : ℕ} (f : Fin n → J → A)

/-- At the fixed anchor, the finite coordinate values distinguish ρ(i) from 1.
Each coordinate is an actual function evaluated on the same reconstructed lift. -/
theorem inertia_kernel_open
    (hcts : ∀ j, Continuous (fun i : I => f j (ρ i.val)))
    (hsep : ∀ i : I, (∀ j, f j (ρ i.val) = f j 1) → ρ i.val = 1) :
    IsOpen ((ρ.comp I.subtype).ker : Set I) := by sorry

/-- Compactness is used only for inertia, so no finite full-Weil image is claimed. -/
theorem finite_inertia_image [CompactSpace I]
    (hcts : ∀ j, Continuous (fun i : I => f j (ρ i.val)))
    (hsep : ∀ i : I, (∀ j, f j (ρ i.val) = f j 1) → ρ i.val = 1) :
    Set.Finite (Set.range (fun i : I => ρ i.val)) := by sorry

/-- Openness of inertia transports the identity-neighbourhood argument to W. -/
theorem continuous_lift [TopologicalSpace J] [DiscreteTopology J]
    (hI : IsOpen (I : Set W))
    (hcts : ∀ j, Continuous (fun i : I => f j (ρ i.val)))
    (hsep : ∀ i : I, (∀ j, f j (ρ i.val) = f j 1) → ρ i.val = 1) :
    Continuous ρ := by sorry

/-- Zero coordinates force triviality on inertia through the separation input. -/
example (f₀ : Fin 0 → J → A)
    (hsep : ∀ i : I, (∀ j, f₀ j (ρ i.val) = f₀ j 1) → ρ i.val = 1) :
    ρ.comp I.subtype = 1 := by sorry

-- The unit lift has a full open inertia kernel and finite singleton image.
example : IsOpen (((1 : W →* J).comp I.subtype).ker : Set I) ∧
    Set.Finite (Set.range (fun i : I => (1 : W →* J) i.val)) := by sorry

-- For any topology, a constant coordinate on C₂ fails to separate the identity.
example [TopologicalSpace (Multiplicative (ZMod 2))] :
    let fblind : Fin 1 → Multiplicative (ZMod 2) → ℤ := fun _ _ => 0
    (∀ j, Continuous (fun x : Multiplicative (ZMod 2) => fblind j x)) ∧
    ¬ (∀ x : Multiplicative (ZMod 2),
      (∀ j, fblind j x = fblind j 1) → x = 1) := by sorry

/-- A discrete degree model with Frobenius value 2. -/
def unramifiedPower : Multiplicative ℤ →* ℚˣ where
  toFun := fun z => (Units.mk0 (2 : ℚ) (by decide)) ^ z.toAdd
  map_one' := by sorry
  map_mul' := by sorry

example : unramifiedPower (Multiplicative.ofAdd (0 : ℤ)) = 1 := by sorry

example : unramifiedPower (Multiplicative.ofAdd (-1 : ℤ)) =
    (Units.mk0 (2 : ℚ) (by decide))⁻¹ := by sorry

example : unramifiedPower (Multiplicative.ofAdd (1 : ℤ)) =
    Units.mk0 (2 : ℚ) (by decide) := by sorry

-- Infinite Frobenius image is compatible with continuity and trivial inertia.
example : Continuous unramifiedPower ∧
    Set.range (fun i : (⊥ : Subgroup (Multiplicative ℤ)) => unramifiedPower i.val) = {1} ∧
    Set.Infinite (Set.range unramifiedPower) := by sorry
end DiscreteWeilContinuity

/-! ## LP0.6: wild restrictions with the prescribed projection

KSS §§1.20–1.21, pp.8–9. The ordinary carrier retains the projection of the
extending Weil homomorphism. Its conjugating group is the kernel of that
projection, identified with the dual group for a semidirect L-group.
Continuity, finite inertia image, Frobenius semisimplicity and the algebraic
SL₂(C) factor are still omitted, rather than represented by empty predicates.
-/
section Wild
variable {P : Type u} {W : Type v} {L : Type w} [Group P] [Group W] [Group L]

/-- Existence of an extending section is a property, not chosen extension data.
This is the ordinary restriction interface, not the full admissible carrier. -/
def WildInertialParameter (π : L →* W) (i : P →* W) :=
  {ρ : P →* L // ∃ φ : W →* L,
    π.comp φ = MonoidHom.id W ∧ φ.comp i = ρ}

namespace WildInertialParameter
variable {π : L →* W} {i : P →* W}

def ofLanglands (φ : W →* L) (hπ : π.comp φ = MonoidHom.id W) :
    WildInertialParameter π i :=
  ⟨φ.comp i, φ, hπ, rfl⟩

/-- A wild restriction projects to the specified wild inclusion. -/
theorem projection (ρ : WildInertialParameter π i) : π.comp ρ.val = i := by
  obtain ⟨φ, hπ, hρ⟩ := ρ.property
  rw [← hρ]
  ext p
  exact DFunLike.congr_fun hπ (i p)

theorem projection_apply (ρ : WildInertialParameter π i) (p : P) :
    π (ρ.val p) = i p := DFunLike.congr_fun (projection ρ) p

theorem ofLanglands_val (φ : W →* L) (hπ : π.comp φ = MonoidHom.id W) :
    (ofLanglands (i := i) φ hπ).val = φ.comp i := rfl

/-- Kernel conjugation preserves the extending section's fixed projection. -/
theorem conjugate_extension_projection (g : π.ker) (φ : W →* L)
    (hπ : π.comp φ = MonoidHom.id W) :
    π.comp ((MulAut.conj g.val).toMonoidHom.comp φ) = MonoidHom.id W := by
  have hg : π g.val = 1 := g.property
  ext w
  have hw : π (φ w) = w := DFunLike.congr_fun hπ w
  simp [MonoidHom.comp_apply, MulAut.conj_apply, hg, hw]

def conjugate (g : π.ker) (ρ : WildInertialParameter π i) :
    WildInertialParameter π i :=
  ⟨(MulAut.conj g.val).toMonoidHom.comp ρ.val, by
    obtain ⟨φ, hπ, hρ⟩ := ρ.property
    refine ⟨(MulAut.conj g.val).toMonoidHom.comp φ,
      conjugate_extension_projection g φ hπ, ?_⟩
    rw [MonoidHom.comp_assoc, hρ]⟩

theorem conjugate_val (g : π.ker) (ρ : WildInertialParameter π i) (p : P) :
    (conjugate g ρ).val p = g.val * ρ.val p * g.val⁻¹ := rfl

theorem conjugate_one (ρ : WildInertialParameter π i) : conjugate 1 ρ = ρ := by sorry

theorem conjugate_mul (g h : π.ker) (ρ : WildInertialParameter π i) :
    conjugate g (conjugate h ρ) = conjugate (g * h) ρ := by sorry

theorem conjugate_inverse (g : π.ker) (ρ : WildInertialParameter π i) :
    conjugate g⁻¹ (conjugate g ρ) = ρ := by sorry

theorem ofLanglands_conjugate (g : π.ker) (φ : W →* L)
    (hπ : π.comp φ = MonoidHom.id W) :
    conjugate g (ofLanglands (i := i) φ hπ) =
      ofLanglands (i := i) ((MulAut.conj g.val).toMonoidHom.comp φ)
        (conjugate_extension_projection g φ hπ) := by sorry

@[ext] theorem ext {ρ σ : WildInertialParameter π i} (h : ρ.val = σ.val) : ρ = σ :=
  Subtype.ext h

/-- The actual dual-group element of the projection kernel, not an arbitrary
L-group element. Mathlib identifies the entire kernel with the image of inl. -/
def dualElement {H : Type z} [Group H] (α : W →* MulAut H) (h : H) :
    (SemidirectProduct.rightHom : SemidirectProduct H W α →* W).ker :=
  ⟨SemidirectProduct.inl h, by simp⟩

theorem dualElement_val {H : Type z} [Group H] (α : W →* MulAut H) (h : H) :
    (dualElement α h).val = SemidirectProduct.inl h := rfl

/-- Dual conjugation of a framed lift is the crossed-cocycle gauge formula. -/
theorem conjugate_left {H : Type z} [Group H] (α : W →* MulAut H)
    (ρ : WildInertialParameter
      (SemidirectProduct.rightHom : SemidirectProduct H W α →* W) i)
    (h : H) (p : P) :
    ((conjugate (dualElement α h) ρ).val p).left =
      h * (ρ.val p).left * (α (i p) h)⁻¹ := by sorry

-- wild_inertial_trivial: the ordinary framed restriction is (1,p).
-- Admissibility of the extending complex parameter is still a supplier input.
example {H : Type z} [Group H] (α : W →* MulAut H) (J : Subgroup W) :
    (ofLanglands (i := J.subtype)
      (SemidirectProduct.inr : W →* SemidirectProduct H W α)
      SemidirectProduct.rightHom_comp_inr).val =
        SemidirectProduct.inr.comp J.subtype := rfl

-- wild_inertial_conjugate
example (g : π.ker) (φ ψ : W →* L)
    (hφ : π.comp φ = MonoidHom.id W) (hψ : π.comp ψ = MonoidHom.id W)
    (hconj : ∀ w, ψ w = g.val * φ w * g.val⁻¹) :
    conjugate g (ofLanglands (i := i) φ hφ) = ofLanglands (i := i) ψ hψ := by sorry

-- wild_inertial_forget
example (φ : W →* L) (hπ : π.comp φ = MonoidHom.id W) :
    (ofLanglands (i := i) φ hπ).val = φ.comp i := rfl

-- wild_inertial_extension_not_data
example (φ ψ : W →* L)
    (hφ : π.comp φ = MonoidHom.id W) (hψ : π.comp ψ = MonoidHom.id W)
    (h : φ.comp i = ψ.comp i) :
    ofLanglands (i := i) φ hφ = ofLanglands (i := i) ψ hψ := Subtype.ext h

-- A constant lift is excluded by the prescribed projection on nontrivial wild inertia.
example [Nontrivial P] (hi : Function.Injective i) :
    ¬ ∃ ρ : WildInertialParameter π i, ρ.val = 1 := by
  rintro ⟨ρ, hρ⟩
  obtain ⟨p, hp⟩ := exists_ne (1 : P)
  have hproj := projection_apply ρ p
  rw [hρ] at hproj
  have heq : i p = i 1 := by simpa using hproj.symm
  exact hp (hi heq)

-- Nonkernel conjugation can change the Weil projection: an explicit S₃ control.
example :
    let g : Equiv.Perm (Fin 3) := Equiv.swap 0 1
    let w : Equiv.Perm (Fin 3) := Equiv.swap 1 2
    g * w * g⁻¹ ≠ w := by decide

example :
    let g : Equiv.Perm (Fin 3) := Equiv.swap 0 1
    ¬ ∃ ρ : WildInertialParameter
      (MonoidHom.id (Equiv.Perm (Fin 3))) (MonoidHom.id (Equiv.Perm (Fin 3))),
      ∀ p, ρ.val p = g * p * g⁻¹ := by
  dsimp
  rintro ⟨ρ, hρ⟩
  have hproj := projection_apply ρ (Equiv.swap (1 : Fin 3) 2)
  rw [hρ] at hproj
  have hne :
      Equiv.swap (0 : Fin 3) 1 * Equiv.swap (1 : Fin 3) 2 *
        (Equiv.swap (0 : Fin 3) 1)⁻¹ ≠ Equiv.swap (1 : Fin 3) 2 := by decide
  exact hne hproj
end WildInertialParameter
end Wild

section TwistedCentralizer
variable {W : Type u} {L : Type v} [Group W] [Group L]
  (P : Subgroup W) [P.Normal] (π : L →* W) (ρ : P →* L)

def conjugateWild (w : W) (p : P) : P :=
  ⟨w⁻¹ * p.val * w, by sorry⟩

def twistedWildCentralizer : Subgroup L where
  carrier := {g | ∀ p : P, g * ρ (conjugateWild P (π g) p) * g⁻¹ = ρ p}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

namespace twistedWildCentralizer
theorem mem_iff (g : L) : g ∈ twistedWildCentralizer P π ρ ↔
    ∀ p : P, g * ρ (conjugateWild P (π g) p) * g⁻¹ = ρ p := by sorry

def projection : twistedWildCentralizer P π ρ →* W :=
  π.comp (twistedWildCentralizer P π ρ).subtype

theorem kernel (g : L) (hg : π g = 1) :
    g ∈ twistedWildCentralizer P π ρ ↔ ∀ p : P, g * ρ p = ρ p * g := by sorry
end twistedWildCentralizer

/-- Ordinary splitting using an actual extending group homomorphism. The inverse
maps c to (c phi(pi c)^-1, pi c); the action is conjugation by phi. -/
def twistedWildCentralizer.splitEquiv (φ : W →* L) (hπ : π.comp φ = MonoidHom.id W)
    (hρ : φ.comp P.subtype = ρ)
    (α : W →* MulAut ↥(Subgroup.centralizer (Set.range ρ) ⊓ π.ker))
    (hα : ∀ w c, (α w c).val = φ w * c.val * (φ w)⁻¹) :
    twistedWildCentralizer P π ρ ≃*
      SemidirectProduct ↥(Subgroup.centralizer (Set.range ρ) ⊓ π.ker) W α := by sorry

-- wild_centralizer_kernel
example (g : L) (hg : π g = 1) :
    g ∈ twistedWildCentralizer P π ρ ↔ ∀ p : P, g * ρ p = ρ p * g := by sorry
-- wild_centralizer_twist
example (φ : W →* L) (hπ : π.comp φ = MonoidHom.id W)
    (hρ : φ.comp P.subtype = ρ) (w : W)
    (hNoncomm : ∃ p : P, φ w * ρ p ≠ ρ p * φ w) :
    φ w ∈ twistedWildCentralizer P π ρ ∧
      φ w ∉ Subgroup.centralizer (Set.range ρ) := by sorry
end TwistedCentralizer

/-! ## LP0.7–LP0.8: the framed wild lift and its intrinsic enhancement quotient

These are the abstract-group forms of KSS §1.21, equation (1.1), p.8.
The actual complex dual group, admissibility, and the identity component of the
parameter centralizer remain inputs of RG2.5. The invariant dual centre below
is determined by the action; it is not an arbitrary denominator subgroup.
-/
namespace WildEnhancement
variable {H : Type u} {W : Type v} [Group H] [Group W]
variable (α : W →* MulAut H) (P : Subgroup W) [P.Normal]

abbrev LGroup := SemidirectProduct H W α

/-- The trivial dual component is (1,p), retaining the prescribed projection. -/
def standardWild : P →* LGroup α := SemidirectProduct.inr.comp P.subtype

theorem standardWild_projection :
    (SemidirectProduct.rightHom : LGroup α →* W).comp (standardWild α P) =
      P.subtype := by sorry

-- wild_centralizer_trivial: the source's framed lift, not the constant map.
example (hP : ∀ p : P, α p.val = 1) :
    twistedWildCentralizer P
      (SemidirectProduct.rightHom : LGroup α →* W) (standardWild α P) = ⊤ := by sorry

-- A constant map has the wrong wild projection when P is nontrivial.
example [Nontrivial P] :
    (SemidirectProduct.rightHom : LGroup α →* W).comp (1 : P →* LGroup α) ≠
      P.subtype := by sorry

/-- Z(H)^W, with invariance under the specified action. -/
def invariantDualCenter : Subgroup H where
  carrier := {h | h ∈ Subgroup.center H ∧ ∀ w : W, α w h = h}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

theorem invariantDualCenter_mem (h : H) : h ∈ invariantDualCenter α ↔
    h ∈ Subgroup.center H ∧ ∀ w : W, α w h = h := by sorry

variable (ρ : P →* LGroup α)

abbrev centralizer := twistedWildCentralizer P
  (SemidirectProduct.rightHom : LGroup α →* W) ρ

/-- z↦(z,1) lies in the centre of the intrinsic twisted centralizer. -/
def dualCenterEmbedding : invariantDualCenter α →*
    Subgroup.center (centralizer α P ρ) where
  toFun z := ⟨⟨SemidirectProduct.inl z.val, by sorry⟩, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry

theorem dualCenterEmbedding_val (z : invariantDualCenter α) :
    (dualCenterEmbedding α P ρ z).val.val = SemidirectProduct.inl z.val := by sorry

theorem dualCenterEmbedding_injective :
    Function.Injective (dualCenterEmbedding α P ρ) := by sorry

/-- The denominator is exactly the image of the invariant dual centre. -/
def denominator : Subgroup (Subgroup.center (centralizer α P ρ)) :=
  (dualCenterEmbedding α P ρ).range

instance denominator_normal : (denominator α P ρ).Normal := by sorry

theorem denominator_mem (z : Subgroup.center (centralizer α P ρ)) :
    z ∈ denominator α P ρ ↔ ∃ h : invariantDualCenter α,
      z.val.val = SemidirectProduct.inl h.val := by sorry

/-- The actual dual-group centralizer, viewed inside H rather than all of LGroup. -/
def dualCentralizer : Subgroup H :=
  (Subgroup.centralizer (Set.range ρ)).comap SemidirectProduct.inl

variable (φ : W →* LGroup α)

/-- Z(C_H(ρ)) fixed by conjugation with the extending Weil parameter. -/
def fixedCentralizerCenter : Subgroup (dualCentralizer α P ρ) where
  carrier := {h | h ∈ Subgroup.center (dualCentralizer α P ρ) ∧
    ∀ w : W, φ w * SemidirectProduct.inl h.val * (φ w)⁻¹ =
      SemidirectProduct.inl h.val}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- The invariant dual centre is contained in this fixed centre for every extension. -/
def dualCenterToFixed : invariantDualCenter α →*
    fixedCentralizerCenter α P ρ φ where
  toFun z := ⟨⟨z.val, by sorry⟩, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry

def fixedDenominator : Subgroup (fixedCentralizerCenter α P ρ φ) :=
  (dualCenterToFixed α P ρ φ).range

instance fixedDenominator_normal : (fixedDenominator α P ρ φ).Normal := by sorry

/-- Triviality of Z(W) is essential: only then does every numerator element
project to 1 and have an underlying element of H. -/
def centerEquiv
    (hφ : (SemidirectProduct.rightHom : LGroup α →* W).comp φ = MonoidHom.id W)
    (hρ : φ.comp P.subtype = ρ) (hW : Subgroup.center W = ⊥) :
    Subgroup.center (centralizer α P ρ) ≃*
      fixedCentralizerCenter α P ρ φ := by sorry

theorem centerEquiv_val
    (hφ : (SemidirectProduct.rightHom : LGroup α →* W).comp φ = MonoidHom.id W)
    (hρ : φ.comp P.subtype = ρ) (hW : Subgroup.center W = ⊥)
    (z : Subgroup.center (centralizer α P ρ)) :
    SemidirectProduct.inl ((centerEquiv α P ρ φ hφ hρ hW z).val.val) =
      z.val.val := by sorry

theorem centerEquiv_denominator
    (hφ : (SemidirectProduct.rightHom : LGroup α →* W).comp φ = MonoidHom.id W)
    (hρ : φ.comp P.subtype = ρ) (hW : Subgroup.center W = ⊥)
    (z : invariantDualCenter α) :
    centerEquiv α P ρ φ hφ hρ hW (dualCenterEmbedding α P ρ z) =
      dualCenterToFixed α P ρ φ z := by sorry

/-- Dual-group conjugation keeps the Weil projection. -/
def conjugateWild (h : H) : P →* LGroup α :=
  (MulAut.conj (SemidirectProduct.inl h : LGroup α)).toMonoidHom.comp ρ

def centralizerConjugateEquiv (h : H) : centralizer α P ρ ≃*
    centralizer α P (conjugateWild α P ρ h) := by sorry

theorem centralizerConjugateEquiv_val (h : H) (g : centralizer α P ρ) :
    (centralizerConjugateEquiv α P ρ h g).val =
      (SemidirectProduct.inl h : LGroup α) * g.val *
        (SemidirectProduct.inl h : LGroup α)⁻¹ := by sorry

def centerConjugateEquiv (h : H) :=
  Subgroup.centerCongr (centralizerConjugateEquiv α P ρ h)

theorem centerConjugateEquiv_denominator (h : H) (z : invariantDualCenter α) :
    centerConjugateEquiv α P ρ h (dualCenterEmbedding α P ρ z) =
      dualCenterEmbedding α P (conjugateWild α P ρ h) z := by sorry
end WildEnhancement

/-- S_ρ=Z(C_L(ρ))/Z(H)^W, using the intrinsic centre inclusion. -/
def wildEnhancementGroup {H : Type u} {W : Type v} [Group H] [Group W]
    (α : W →* MulAut H) (P : Subgroup W) [P.Normal]
    (ρ : P →* WildEnhancement.LGroup α) :=
  Subgroup.center (WildEnhancement.centralizer α P ρ) ⧸
    WildEnhancement.denominator α P ρ

namespace wildEnhancementGroup
variable {H : Type u} {W : Type v} [Group H] [Group W]
variable (α : W →* MulAut H) (P : Subgroup W) [P.Normal]
variable (ρ : P →* WildEnhancement.LGroup α)

instance : Group (wildEnhancementGroup α P ρ) :=
  inferInstanceAs (Group (Subgroup.center (WildEnhancement.centralizer α P ρ) ⧸
    WildEnhancement.denominator α P ρ))

def mk : Subgroup.center (WildEnhancement.centralizer α P ρ) →*
    wildEnhancementGroup α P ρ := QuotientGroup.mk' _

theorem mk_dualCenter (z : WildEnhancement.invariantDualCenter α) :
    mk α P ρ (WildEnhancement.dualCenterEmbedding α P ρ z) = 1 := by sorry

theorem mk_eq_one (z : Subgroup.center (WildEnhancement.centralizer α P ρ)) :
    mk α P ρ z = 1 ↔ ∃ h : WildEnhancement.invariantDualCenter α,
      z.val.val = SemidirectProduct.inl h.val := by sorry

def centerIdentification (φ : W →* WildEnhancement.LGroup α)
    (hφ : (SemidirectProduct.rightHom : WildEnhancement.LGroup α →* W).comp φ =
      MonoidHom.id W)
    (hρ : φ.comp P.subtype = ρ) (hW : Subgroup.center W = ⊥) :
    wildEnhancementGroup α P ρ ≃*
      WildEnhancement.fixedCentralizerCenter α P ρ φ ⧸
        WildEnhancement.fixedDenominator α P ρ φ := by sorry

theorem centerIdentification_mk (φ : W →* WildEnhancement.LGroup α)
    (hφ : (SemidirectProduct.rightHom : WildEnhancement.LGroup α →* W).comp φ =
      MonoidHom.id W)
    (hρ : φ.comp P.subtype = ρ) (hW : Subgroup.center W = ⊥)
    (z : Subgroup.center (WildEnhancement.centralizer α P ρ)) :
    centerIdentification α P ρ φ hφ hρ hW (mk α P ρ z) =
      QuotientGroup.mk' (WildEnhancement.fixedDenominator α P ρ φ)
        (WildEnhancement.centerEquiv α P ρ φ hφ hρ hW z) := by sorry

def conjugateEquiv (h : H) : wildEnhancementGroup α P ρ ≃*
    wildEnhancementGroup α P (WildEnhancement.conjugateWild α P ρ h) := by sorry

theorem conjugateEquiv_mk (h : H)
    (z : Subgroup.center (WildEnhancement.centralizer α P ρ)) :
    conjugateEquiv α P ρ h (mk α P ρ z) =
      mk α P (WildEnhancement.conjugateWild α P ρ h)
        (WildEnhancement.centerConjugateEquiv α P ρ h z) := by sorry

def transportRep {K : Type w} [CommRing K] {V : Type z}
    [AddCommGroup V] [Module K V] (h : H)
    (χ : Representation K (wildEnhancementGroup α P ρ) V) :
    Representation K
      (wildEnhancementGroup α P (WildEnhancement.conjugateWild α P ρ h)) V :=
  χ.comp (conjugateEquiv α P ρ h).symm.toMonoidHom

-- wild_enhancement_trivial_rho: requires the Weil centre to be trivial.
example (hP : ∀ p : P, α p.val = 1) (hW : Subgroup.center W = ⊥) :
    Subsingleton (wildEnhancementGroup α P (WildEnhancement.standardWild α P)) := by sorry

-- wild_enhancement_center_quotient: the inflated representation kills Z(H)^W.
example {K : Type w} [CommRing K] {V : Type z} [AddCommGroup V] [Module K V]
    (χ : Representation K (wildEnhancementGroup α P ρ) V)
    (c : WildEnhancement.invariantDualCenter α) :
    χ (mk α P ρ (WildEnhancement.dualCenterEmbedding α P ρ c)) = LinearMap.id := by sorry

-- wild_enhancement_conjugacy: transport agrees on every centre representative.
-- Naturality for the restriction from S_φ still needs its complex owner carrier.
example {K : Type w} [CommRing K] {V : Type z} [AddCommGroup V] [Module K V]
    (χ : Representation K (wildEnhancementGroup α P ρ) V)
    (h : H) (z : Subgroup.center (WildEnhancement.centralizer α P ρ)) :
    transportRep α P ρ h χ
      (mk α P (WildEnhancement.conjugateWild α P ρ h)
        (WildEnhancement.centerConjugateEquiv α P ρ h z)) =
          χ (mk α P ρ z) := by sorry

-- Trivial wild image alone does not justify triviality if the ambient centre is nontrivial.
example : ¬ Subsingleton (wildEnhancementGroup
    (1 : Multiplicative ℤ →* MulAut Unit) (⊥ : Subgroup (Multiplicative ℤ))
      (WildEnhancement.standardWild (1 : Multiplicative ℤ →* MulAut Unit) ⊥)) := by sorry
end wildEnhancementGroup

section Invariants
variable {R : Type u} {A : Type v} [CommRing R] [CommRing A] [Algebra R A]
  {B : Type w} [CommRing B] [Algebra R B]

/-- Equaliser of a supplied coaction and the canonical map a ↦ a ⊗ 1.
For the group-scheme instance B is A ⊗ O(H), δ is the coaction and ι is
the canonical map. Their geometric construction is supplied by RG/SF.1.
Invariants of the abstract group H(R) do not suffice over finite fields. -/
abbrev ParameterInvariantAlgebra (δ ι : A →ₐ[R] B) : Subalgebra R A :=
  AlgHom.equalizer δ ι

namespace ParameterInvariantAlgebra
variable (δ ι : A →ₐ[R] B)
def inclusion : ParameterInvariantAlgebra δ ι →ₐ[R] A :=
  (ParameterInvariantAlgebra δ ι).val

theorem mem_iff (a : A) : a ∈ ParameterInvariantAlgebra δ ι ↔ δ a = ι a := by sorry

def lift {C : Type z} [CommRing C] [Algebra R C]
    (f : C →ₐ[R] A) (hf : ∀ c, δ (f c) = ι (f c)) :
    C →ₐ[R] ParameterInvariantAlgebra δ ι := by sorry

theorem lift_comp {C : Type z} [CommRing C] [Algebra R C]
    (f : C →ₐ[R] A) (hf : ∀ c, δ (f c) = ι (f c)) :
    (inclusion δ ι).comp (lift δ ι f hf) = f := by sorry

theorem inclusion_injective : Function.Injective (inclusion δ ι) := by sorry

theorem lift_unique {C : Type z} [CommRing C] [Algebra R C]
    (f : C →ₐ[R] A) (hf : ∀ c, δ (f c) = ι (f c))
    (g : C →ₐ[R] ParameterInvariantAlgebra δ ι)
    (hg : (inclusion δ ι).comp g = f) : g = lift δ ι f hf := by sorry

/-- Restrict an equivariant coordinate map to the existing equalizers.
For an inflation map, `g` is the map on the action-coordinate algebra. -/
def map {A' B' : Type*} [CommRing A'] [CommRing B']
    [Algebra R A'] [Algebra R B'] (δ' ι' : A' →ₐ[R] B')
    (f : A →ₐ[R] A') (g : B →ₐ[R] B')
    (hδ : δ'.comp f = g.comp δ) (hι : ι'.comp f = g.comp ι) :
    ParameterInvariantAlgebra δ ι →ₐ[R] ParameterInvariantAlgebra δ' ι' :=
  lift δ' ι' (f.comp (inclusion δ ι)) (by sorry)

theorem map_val {A' B' : Type*} [CommRing A'] [CommRing B']
    [Algebra R A'] [Algebra R B'] (δ' ι' : A' →ₐ[R] B')
    (f : A →ₐ[R] A') (g : B →ₐ[R] B')
    (hδ : δ'.comp f = g.comp δ) (hι : ι'.comp f = g.comp ι)
    (a : ParameterInvariantAlgebra δ ι) :
    (map δ ι δ' ι' f g hδ hι a).val = f a.val := by sorry

theorem map_id :
    map δ ι δ ι (AlgHom.id R A) (AlgHom.id R B) (by ext; rfl) (by ext; rfl) =
      AlgHom.id R (ParameterInvariantAlgebra δ ι) := by sorry

theorem map_comp {A' B' A'' B'' : Type*}
    [CommRing A'] [CommRing B'] [CommRing A''] [CommRing B'']
    [Algebra R A'] [Algebra R B'] [Algebra R A''] [Algebra R B'']
    (δ' ι' : A' →ₐ[R] B') (δ'' ι'' : A'' →ₐ[R] B'')
    (f : A →ₐ[R] A') (g : B →ₐ[R] B')
    (f' : A' →ₐ[R] A'') (g' : B' →ₐ[R] B'')
    (hδ : δ'.comp f = g.comp δ) (hι : ι'.comp f = g.comp ι)
    (hδ' : δ''.comp f' = g'.comp δ') (hι' : ι''.comp f' = g'.comp ι') :
    (map δ' ι' δ'' ι'' f' g' hδ' hι').comp (map δ ι δ' ι' f g hδ hι) =
      map δ ι δ'' ι'' (f'.comp f) (g'.comp g) (by sorry) (by sorry) := by sorry

variable (S : Type*) [CommRing S] [Algebra R S]

/-- Scalar extension of a coordinate homomorphism, over the actual tensor algebra. -/
noncomputable def baseChangeHom (f : A →ₐ[R] B) :
    S ⊗[R] A →ₐ[S] S ⊗[R] B :=
  (AlgHom.liftEquiv R S A (S ⊗[R] B))
    ((Algebra.TensorProduct.includeRight : B →ₐ[R] S ⊗[R] B).comp f)

theorem baseChangeHom_tmul (f : A →ₐ[R] B) (s : S) (a : A) :
    baseChangeHom S f (s ⊗ₜ[R] a) = s ⊗ₜ[R] f a := by
  simp only [baseChangeHom, AlgHom.liftEquiv_tmul, AlgHom.comp_apply,
    Algebra.TensorProduct.includeRight_apply]
  rw [TensorProduct.smul_tmul', smul_eq_mul, mul_one]

/-- The canonical comparison exists for every scalar extension. Flatness is
needed for the bijectivity theorem, not for this map or its formula. -/
noncomputable def baseChangeMap :
    S ⊗[R] ParameterInvariantAlgebra δ ι →ₐ[S]
      ParameterInvariantAlgebra (baseChangeHom S δ) (baseChangeHom S ι) :=
  (baseChangeHom S (ParameterInvariantAlgebra δ ι).val).codRestrict _ (by
    intro z
    refine TensorProduct.induction_on z ?_ ?_ ?_
    · simp
    · intro s a
      change baseChangeHom S δ (baseChangeHom S (ParameterInvariantAlgebra δ ι).val
        (s ⊗ₜ[R] a)) = baseChangeHom S ι (baseChangeHom S (ParameterInvariantAlgebra δ ι).val
        (s ⊗ₜ[R] a))
      simp only [baseChangeHom_tmul, Subalgebra.val_apply]
      rw [a.property]
    · intro x y hx hy
      change baseChangeHom S δ (baseChangeHom S (ParameterInvariantAlgebra δ ι).val (x + y)) =
        baseChangeHom S ι (baseChangeHom S (ParameterInvariantAlgebra δ ι).val (x + y))
      simp only [map_add]
      exact congrArg₂ (· + ·) hx hy)

theorem baseChangeMap_tmul (s : S) (a : ParameterInvariantAlgebra δ ι) :
    (baseChangeMap δ ι S (s ⊗ₜ[R] a)).val = s ⊗ₜ[R] a.val := by
  change baseChangeHom S (ParameterInvariantAlgebra δ ι).val (s ⊗ₜ[R] a) = _
  exact baseChangeHom_tmul S _ s a

/-- Tensor exactness identifies the equalizer after flat scalar extension.
This does not need the good-prime generation theorem. -/
theorem baseChangeMap_bijective [Module.Flat R S] :
    Function.Bijective (baseChangeMap δ ι S) := by sorry

noncomputable def flatBaseChange [Module.Flat R S] :
    S ⊗[R] ParameterInvariantAlgebra δ ι ≃ₐ[S]
      ParameterInvariantAlgebra (baseChangeHom S δ) (baseChangeHom S ι) :=
  AlgEquiv.ofBijective (baseChangeMap δ ι S) (baseChangeMap_bijective δ ι S)

theorem flatBaseChange_tmul [Module.Flat R S]
    (s : S) (a : ParameterInvariantAlgebra δ ι) :
    (flatBaseChange δ ι S (s ⊗ₜ[R] a)).val = s ⊗ₜ[R] a.val := by sorry

-- flat_identity: R is flat over itself, with the same invariant coordinate.
example (a : ParameterInvariantAlgebra δ ι) :
    (flatBaseChange δ ι R (1 ⊗ₜ[R] a)).val = 1 ⊗ₜ[R] a.val := by sorry

-- flat_trivial_coaction: the full coordinate algebra remains the equalizer.
example (ι : A →ₐ[R] B) :
    ParameterInvariantAlgebra (baseChangeHom S ι) (baseChangeHom S ι) = ⊤ := by sorry

-- flat_nonflat_reduction: the C₂ sign action over ℤ becomes trivial mod 2.
-- This tests the general equalizer adapter, not connected-reductive GIT.
namespace NonflatReductionChecks

noncomputable def signAction : Polynomial ℤ →ₐ[ℤ] Polynomial ℤ :=
  Polynomial.aeval (-Polynomial.X)

lemma signAction_coeff_one (p : Polynomial ℤ) :
    (signAction p).coeff 1 = -p.coeff 1 := by
  have hx : (-Polynomial.X : Polynomial ℤ) = Polynomial.C (-1) * Polynomial.X := by simp
  change (Polynomial.aeval (-Polynomial.X) p).coeff 1 = _
  rw [hx, ← Polynomial.comp_eq_aeval, Polynomial.comp_C_mul_X_coeff]
  simp

lemma invariant_coeff_one
    (p : ParameterInvariantAlgebra signAction (AlgHom.id ℤ (Polynomial ℤ))) :
    p.val.coeff 1 = 0 := by
  have h := congrArg (fun q : Polynomial ℤ => q.coeff 1) p.property
  change (signAction p.val).coeff 1 = p.val.coeff 1 at h
  rw [signAction_coeff_one] at h
  omega

/-- The genuine coefficient-reduction map on the scalar-extended polynomial algebra. -/
noncomputable def reduce :
    ZMod 2 ⊗[ℤ] Polynomial ℤ →ₐ[ZMod 2] Polynomial (ZMod 2) :=
  (AlgHom.liftEquiv ℤ (ZMod 2) (Polynomial ℤ) (Polynomial (ZMod 2)))
    (Polynomial.mapAlgHom (Algebra.ofId ℤ (ZMod 2)))

lemma reduce_tmul (s : ZMod 2) (p : Polynomial ℤ) :
    reduce (s ⊗ₜ[ℤ] p) = s • p.map (Int.castRingHom (ZMod 2)) := rfl

/-- Every scalar-extended invariant still has zero coefficient of X. -/
lemma reduced_invariant_coeff_one
    (z : ZMod 2 ⊗[ℤ] ParameterInvariantAlgebra signAction (AlgHom.id ℤ (Polynomial ℤ))) :
    (reduce (baseChangeMap signAction (AlgHom.id ℤ (Polynomial ℤ)) (ZMod 2) z).val).coeff 1 =
      0 := by
  refine TensorProduct.induction_on z ?_ ?_ ?_
  · simp
  · intro s a
    rw [baseChangeMap_tmul, reduce_tmul]
    simp [invariant_coeff_one]
  · intro x y hx hy
    simp only [map_add, Subalgebra.coe_add, Polynomial.coeff_add, hx, hy, add_zero]

/-- X becomes invariant after reduction but is outside the canonical comparison's image. -/
theorem nonflat_reduction :
    let δ := baseChangeHom (ZMod 2) signAction
    let ι := baseChangeHom (ZMod 2) (AlgHom.id ℤ (Polynomial ℤ))
    let x : ZMod 2 ⊗[ℤ] Polynomial ℤ := 1 ⊗ₜ[ℤ] Polynomial.X
    x ∈ ParameterInvariantAlgebra δ ι ∧
      ¬ ∃ z : ZMod 2 ⊗[ℤ] ParameterInvariantAlgebra signAction
          (AlgHom.id ℤ (Polynomial ℤ)),
        (baseChangeMap signAction (AlgHom.id ℤ (Polynomial ℤ)) (ZMod 2) z).val = x := by
  dsimp only
  constructor
  · change baseChangeHom (ZMod 2) signAction (1 ⊗ₜ[ℤ] Polynomial.X) =
      baseChangeHom (ZMod 2) (AlgHom.id ℤ (Polynomial ℤ)) (1 ⊗ₜ[ℤ] Polynomial.X)
    rw [baseChangeHom_tmul, baseChangeHom_tmul]
    simp only [signAction, Polynomial.aeval_X, AlgHom.id_apply]
    rw [TensorProduct.tmul_neg, ← TensorProduct.neg_tmul, show -(1 : ZMod 2) = 1 from rfl]
  · rintro ⟨z, hz⟩
    have hc := reduced_invariant_coeff_one z
    rw [hz, reduce_tmul] at hc
    norm_num at hc

end NonflatReductionChecks

example :
    let τ : Polynomial ℤ →ₐ[ℤ] Polynomial ℤ := Polynomial.aeval (-Polynomial.X)
    let δ := baseChangeHom (ZMod 2) τ
    let ι := baseChangeHom (ZMod 2) (AlgHom.id ℤ (Polynomial ℤ))
    let x : ZMod 2 ⊗[ℤ] Polynomial ℤ := 1 ⊗ₜ[ℤ] Polynomial.X
    x ∈ ParameterInvariantAlgebra δ ι ∧
      ¬ ∃ z : ZMod 2 ⊗[ℤ] ParameterInvariantAlgebra τ (AlgHom.id ℤ (Polynomial ℤ)),
        (baseChangeMap τ (AlgHom.id ℤ (Polynomial ℤ)) (ZMod 2) z).val = x :=
  NonflatReductionChecks.nonflat_reduction
end ParameterInvariantAlgebra

-- coarse_trivial_group, and the torus case when its action is trivial.
example (ι : A →ₐ[R] B) : ParameterInvariantAlgebra ι ι = ⊤ := by sorry

-- coarse_affine_universal
example (δ ι : A →ₐ[R] B) {C : Type z} [CommRing C] [Algebra R C]
    (f : C →ₐ[R] A) (hf : ∀ c, δ (f c) = ι (f c)) :
    ∃! g : C →ₐ[R] ParameterInvariantAlgebra δ ι,
      (ParameterInvariantAlgebra.inclusion δ ι).comp g = f := by sorry
end Invariants

section CoarseGeometry
open AlgebraicGeometry
variable {R A B : Type u} [CommRing R] [CommRing A] [CommRing B]
  [Algebra R A] [Algebra R B] (δ ι : A →ₐ[R] B)

/-- The affine coarse quotient of one represented piece, using its supplied
scheme coaction. Finite generation and closed-orbit classification are separate. -/
noncomputable def ParameterCoarseQuotient : Scheme :=
  Spec (CommRingCat.of (ParameterInvariantAlgebra δ ι))

namespace ParameterCoarseQuotient
noncomputable def quotientMap :
    Spec (CommRingCat.of A) ⟶ ParameterCoarseQuotient δ ι :=
  Spec.map (CommRingCat.ofHom (ParameterInvariantAlgebra.inclusion δ ι).toRingHom)

noncomputable def lift {D : Type u} [CommRing D] [Algebra R D]
    (f : D →ₐ[R] A) (hf : ∀ x, δ (f x) = ι (f x)) :
    ParameterCoarseQuotient δ ι ⟶ Spec (CommRingCat.of D) :=
  Spec.map (CommRingCat.ofHom (ParameterInvariantAlgebra.lift δ ι f hf).toRingHom)

theorem quotientMap_lift {D : Type u} [CommRing D] [Algebra R D]
    (f : D →ₐ[R] A) (hf : ∀ x, δ (f x) = ι (f x)) :
    quotientMap δ ι ≫ lift δ ι f hf = Spec.map (CommRingCat.ofHom f.toRingHom) := by sorry

theorem lift_unique {D : Type u} [CommRing D] [Algebra R D]
    (f : D →ₐ[R] A) (hf : ∀ x, δ (f x) = ι (f x))
    (g : ParameterCoarseQuotient δ ι ⟶ Spec (CommRingCat.of D))
    (hg : quotientMap δ ι ≫ g = Spec.map (CommRingCat.ofHom f.toRingHom)) :
    g = lift δ ι f hf := by sorry

/-- Apply to the coordinate pullback of a finite-wild inclusion. The two
equivariance squares must be supplied by that inclusion's coaction theorem. -/
noncomputable def inflate {A' B' : Type u} [CommRing A'] [CommRing B']
    [Algebra R A'] [Algebra R B'] (δ' ι' : A' →ₐ[R] B')
    (f : A →ₐ[R] A') (g : B →ₐ[R] B')
    (hδ : δ'.comp f = g.comp δ) (hι : ι'.comp f = g.comp ι) :
    ParameterCoarseQuotient δ' ι' ⟶ ParameterCoarseQuotient δ ι :=
  Spec.map (CommRingCat.ofHom
    (ParameterInvariantAlgebra.map δ ι δ' ι' f g hδ hι).toRingHom)

theorem inflate_quotientMap {A' B' : Type u} [CommRing A'] [CommRing B']
    [Algebra R A'] [Algebra R B'] (δ' ι' : A' →ₐ[R] B')
    (f : A →ₐ[R] A') (g : B →ₐ[R] B')
    (hδ : δ'.comp f = g.comp δ) (hι : ι'.comp f = g.comp ι) :
    quotientMap δ' ι' ≫ inflate δ ι δ' ι' f g hδ hι =
      Spec.map (CommRingCat.ofHom f.toRingHom) ≫ quotientMap δ ι := by sorry

theorem inflate_id :
    inflate δ ι δ ι (AlgHom.id R A) (AlgHom.id R B) (by ext; rfl) (by ext; rfl) =
      𝟙 (ParameterCoarseQuotient δ ι) := by sorry

theorem inflate_comp {A' B' A'' B'' : Type u}
    [CommRing A'] [CommRing B'] [CommRing A''] [CommRing B'']
    [Algebra R A'] [Algebra R B'] [Algebra R A''] [Algebra R B'']
    (δ' ι' : A' →ₐ[R] B') (δ'' ι'' : A'' →ₐ[R] B'')
    (f : A →ₐ[R] A') (g : B →ₐ[R] B')
    (f' : A' →ₐ[R] A'') (g' : B' →ₐ[R] B'')
    (hδ : δ'.comp f = g.comp δ) (hι : ι'.comp f = g.comp ι)
    (hδ' : δ''.comp f' = g'.comp δ') (hι' : ι''.comp f' = g'.comp ι') :
    inflate δ' ι' δ'' ι'' f' g' hδ' hι' ≫ inflate δ ι δ' ι' f g hδ hι =
      inflate δ ι δ'' ι'' (f'.comp f) (g'.comp g) (by sorry) (by sorry) := by sorry

-- coarse_affine_universal: a scheme morphism has exactly one descended map.
example {D : Type u} [CommRing D] [Algebra R D]
    (f : D →ₐ[R] A) (hf : ∀ x, δ (f x) = ι (f x)) :
    ∃! g : ParameterCoarseQuotient δ ι ⟶ Spec (CommRingCat.of D),
      quotientMap δ ι ≫ g = Spec.map (CommRingCat.ofHom f.toRingHom) := by sorry

-- coarse_identity_coordinate: the universal invariant inclusion descends to identity.
example : lift δ ι (ParameterInvariantAlgebra.inclusion δ ι) (by
    intro x
    exact x.property) = 𝟙 (ParameterCoarseQuotient δ ι) := by sorry

-- coarse_trivial_group: an identity coaction makes the quotient map an isomorphism.
example (ι : A →ₐ[R] B) : IsIso (quotientMap ι ι) := by sorry
end ParameterCoarseQuotient
end CoarseGeometry

section ScalingCoaction
/-- O(A¹×G_m) is the Laurent polynomial ring over O(A¹). -/
abbrev ScalingRing := LaurentPolynomial (Polynomial (ZMod 2))

/-- The scaling coaction sends x to x·t. -/
noncomputable def scalingCoaction : Polynomial (ZMod 2) →ₐ[ZMod 2] ScalingRing :=
  Polynomial.aeval (LaurentPolynomial.C Polynomial.X * LaurentPolynomial.T 1)

/-- The canonical map sends x to x. -/
noncomputable def scalingUnit : Polynomial (ZMod 2) →ₐ[ZMod 2] ScalingRing :=
  Polynomial.aeval (LaurentPolynomial.C Polynomial.X)

-- coarse_scheme_invariants: the equalizer is precisely the constants.
example (f : Polynomial (ZMod 2)) :
    f ∈ ParameterInvariantAlgebra scalingCoaction scalingUnit ↔
      ∃ a : ZMod 2, f = Polynomial.C a := by sorry

example : (Polynomial.X : Polynomial (ZMod 2)) ∉
    ParameterInvariantAlgebra scalingCoaction scalingUnit := by sorry

-- Every F₂-rational scaling fixes every polynomial. This is a strictly larger algebra.
example (f : Polynomial (ZMod 2)) (u : (ZMod 2)ˣ) :
    Polynomial.eval₂ Polynomial.C (u.val • Polynomial.X) f = f := by sorry
end ScalingCoaction

/-! ## Coarse quotient test: a nonclosed SL₂ orbit

For Γ = ℤ with trivial action, framed cocycles are SL₂ itself. The concrete
coordinate algebra below is Q[a,b,c,d]/(ad-bc-1). Invariance is tested by the
universal conjugation coaction, rather than by invariance on rational points.
Fargues–Scholze §VIII.3.1, pp.285–287, identifies the coarse fibre with the
closed orbit; diag(t,t⁻¹) degenerates the upper unipotent to the identity.
-/
namespace CoarseSL2Checks
noncomputable section

abbrev Variables := Fin 2 × Fin 2
abbrev Polynomials := MvPolynomial Variables ℚ

def determinantRelation : Polynomials :=
  MvPolynomial.X (0, 0) * MvPolynomial.X (1, 1) -
    MvPolynomial.X (0, 1) * MvPolynomial.X (1, 0) - 1

def relations : Ideal Polynomials := Ideal.span {determinantRelation}
abbrev Coordinates := Polynomials ⧸ relations

def coordinate (i j : Fin 2) : Coordinates :=
  Ideal.Quotient.mkₐ ℚ relations (MvPolynomial.X (i, j))

def universal : Matrix (Fin 2) (Fin 2) Coordinates := coordinate

theorem universal_det : universal.det = 1 := by sorry

def universalLeft : Matrix (Fin 2) (Fin 2) (Coordinates ⊗[ℚ] Coordinates) :=
  fun i j =>
    (Algebra.TensorProduct.includeLeft :
      Coordinates →ₐ[ℚ] Coordinates ⊗[ℚ] Coordinates) (coordinate i j)

def universalRight : Matrix (Fin 2) (Fin 2) (Coordinates ⊗[ℚ] Coordinates) :=
  fun i j =>
    (Algebra.TensorProduct.includeRight :
      Coordinates →ₐ[ℚ] Coordinates ⊗[ℚ] Coordinates) (coordinate i j)

/-- The first factor is the conjugating element; the second is the parameter. -/
def conjugation : Coordinates →ₐ[ℚ] Coordinates ⊗[ℚ] Coordinates :=
  Ideal.Quotient.liftₐ relations
    (MvPolynomial.aeval (fun ij : Variables =>
      (universalLeft * universalRight * universalLeft.adjugate) ij.1 ij.2))
    (by sorry)

def projection : Coordinates →ₐ[ℚ] Coordinates ⊗[ℚ] Coordinates :=
  Algebra.TensorProduct.includeRight

theorem conjugation_coordinate (i j : Fin 2) :
    conjugation (coordinate i j) =
      (universalLeft * universalRight * universalLeft.adjugate) i j := by sorry

variable {K : Type u} [Field K] [Algebra ℚ K]

/-- Evaluation at a determinant-one matrix respects the coordinate relation. -/
def evaluate (g : Matrix.SpecialLinearGroup (Fin 2) K) : Coordinates →ₐ[ℚ] K :=
  Ideal.Quotient.liftₐ relations
    (MvPolynomial.aeval (fun ij : Variables => g ij.1 ij.2)) (by sorry)

theorem evaluate_coordinate (g : Matrix.SpecialLinearGroup (Fin 2) K) (i j : Fin 2) :
    evaluate g (coordinate i j) = g i j := by sorry

theorem conjugation_evaluate (h g : Matrix.SpecialLinearGroup (Fin 2) K)
    (f : Coordinates) :
    Algebra.TensorProduct.lift (evaluate h) (evaluate g)
      (fun _ _ => Commute.all _ _) (conjugation f) =
      evaluate (h * g * h⁻¹) f := by sorry

def unipotent : Matrix.SpecialLinearGroup (Fin 2) K :=
  ⟨!![1, 1; 0, 1], by sorry⟩

/-- Polynomial curve through the unipotent orbit, with identity at t = 0. -/
def degeneration : Coordinates →ₐ[ℚ] Polynomial K :=
  Ideal.Quotient.liftₐ relations
    (MvPolynomial.aeval (fun ij : Variables =>
      (!![1, Polynomial.X ^ 2; 0, 1] : Matrix (Fin 2) (Fin 2) (Polynomial K))
        ij.1 ij.2)) (by sorry)

-- coarse_not_orbit_set: equality on the entire algebraic invariant algebra,
-- and failure of conjugacy, over every characteristic-zero field.
example :
    (evaluate (unipotent (K := K))).comp
      (ParameterInvariantAlgebra.inclusion (R := ℚ) (A := Coordinates)
        (B := Coordinates ⊗[ℚ] Coordinates) conjugation projection) =
    (evaluate (1 : Matrix.SpecialLinearGroup (Fin 2) K)).comp
      (ParameterInvariantAlgebra.inclusion (R := ℚ) (A := Coordinates)
        (B := Coordinates ⊗[ℚ] Coordinates) conjugation projection) ∧
    ¬ ∃ h : Matrix.SpecialLinearGroup (Fin 2) K, h * unipotent * h⁻¹ = 1 := by
  sorry

-- Every invariant function is constant along the degeneration, including t = 0.
example (f : ParameterInvariantAlgebra (R := ℚ) (A := Coordinates)
    (B := Coordinates ⊗[ℚ] Coordinates) conjugation projection) :
    degeneration (K := K) f.val =
      Polynomial.C (evaluate (1 : Matrix.SpecialLinearGroup (Fin 2) K) f.val) := by
  sorry

def diagonal (t : Kˣ) : Matrix.SpecialLinearGroup (Fin 2) K :=
  ⟨!![(t : K), 0; 0, ((t⁻¹ : Kˣ) : K)], by sorry⟩

-- The two endpoints are the distinct framed parameters in one coarse fibre.
example :
    (Polynomial.eval₂AlgHom (AlgHom.id ℚ K) 0 (fun _ => Commute.all _ _)).comp
      (degeneration (K := K)) = evaluate (1 : Matrix.SpecialLinearGroup (Fin 2) K) ∧
    (Polynomial.eval₂AlgHom (AlgHom.id ℚ K) 1 (fun _ => Commute.all _ _)).comp
      (degeneration (K := K)) = evaluate (unipotent (K := K)) := by sorry

-- Off the origin the curve is the conjugation by diag(t,t⁻¹).
example (t : Kˣ) :
    diagonal t * unipotent * (diagonal t)⁻¹ =
      (⟨!![1, (t : K) ^ 2; 0, 1], by sorry⟩ :
        Matrix.SpecialLinearGroup (Fin 2) K) := by sorry

example (t : Kˣ) :
    (Polynomial.eval₂AlgHom (AlgHom.id ℚ K) (t : K)
      (fun _ => Commute.all _ _)).comp
      (degeneration (K := K)) =
    evaluate (⟨!![1, (t : K) ^ 2; 0, 1], by sorry⟩ :
      Matrix.SpecialLinearGroup (Fin 2) K) := by sorry

end
end CoarseSL2Checks

section Reducibility
variable {G : Type u} [Group G]

/-- Predicates for supplied parabolic/Levi families. Their geometric construction is RG's. -/
def IsGCompletelyReducible (parabolics : Set (Subgroup G))
    (levis : Subgroup G → Set (Subgroup G)) (H : Subgroup G) : Prop :=
  ∀ P ∈ parabolics, H ≤ P → ∃ L ∈ levis P, H ≤ L

def IsGIrreducible (parabolics : Set (Subgroup G)) (H : Subgroup G) : Prop :=
  ∀ P ∈ parabolics, H ≤ P → P = ⊤

theorem IsGIrreducible.completelyReducible
    (parabolics : Set (Subgroup G)) (levis : Subgroup G → Set (Subgroup G))
    (hTop : (⊤ : Subgroup G) ∈ levis ⊤) (H : Subgroup G)
    (h : IsGIrreducible parabolics H) : IsGCompletelyReducible parabolics levis H := by
  sorry

-- cr_trivial: a supplied Levi in each parabolic contains the trivial subgroup.
example (parabolics : Set (Subgroup G)) (levis : Subgroup G → Set (Subgroup G))
    (h : ∀ P ∈ parabolics, (levis P).Nonempty) :
    IsGCompletelyReducible parabolics levis ⊥ := by sorry

-- semisimple_torus: the geometric torus parabolic family is {top}.
example (H : Subgroup G) :
    IsGCompletelyReducible {⊤} (fun _ => {⊤}) H := by sorry
end Reducibility

/-! Concrete SL₂ tests of the supplied-family predicates. Over an algebraically
closed field the proper parabolics stabilize lines, and a Levi additionally
stabilizes a complementary line. These are explicit matrix/subspace fixtures,
not a replacement for the general scheme parabolic interface. -/
namespace ReducibilitySL2Checks
noncomputable section
variable (K : Type u) [Field K]

abbrev G := Matrix.SpecialLinearGroup (Fin 2) K
abbrev V := Fin 2 → K

def lineStabilizer (L : Submodule K (V K)) : Subgroup (G K) where
  carrier := {g | ∀ v, v ∈ L ↔ Matrix.SpecialLinearGroup.toLin' g v ∈ L}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

def firstLine : Submodule K (V K) :=
  Submodule.span K {Pi.single (0 : Fin 2) (1 : K)}

def secondLine : Submodule K (V K) :=
  Submodule.span K {Pi.single (1 : Fin 2) (1 : K)}

def borel : Subgroup (G K) := lineStabilizer K (firstLine K)
def torus : Subgroup (G K) :=
  lineStabilizer K (firstLine K) ⊓ lineStabilizer K (secondLine K)

def upperUnipotent : Subgroup (G K) where
  carrier := {g | ∃ x : K, (g : Matrix (Fin 2) (Fin 2) K) = !![1, x; 0, 1]}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

def parabolics : Set (Subgroup (G K)) :=
  {P | P = ⊤ ∨ ∃ L : Submodule K (V K),
    Module.finrank K L = 1 ∧ P = lineStabilizer K L}

def levis (P : Subgroup (G K)) : Set (Subgroup (G K)) :=
  {M | (P = ⊤ ∧ M = ⊤) ∨ ∃ L N : Submodule K (V K),
    Module.finrank K L = 1 ∧ IsCompl L N ∧ P = lineStabilizer K L ∧
      M = lineStabilizer K L ⊓ lineStabilizer K N}

-- Characteristic equations tie the fixtures to the intended matrix groups.
example (g : G K) : g ∈ borel K ↔ g 1 0 = 0 := by sorry
example (g : G K) : g ∈ torus K ↔ g 0 1 = 0 ∧ g 1 0 = 0 := by sorry
example : IsCompl (firstLine K) (secondLine K) := by sorry

-- cr_torus: quantify over every line stabilizer, not just the standard Borel.
example [IsAlgClosed K] :
    IsGCompletelyReducible (parabolics K) (levis K) (torus K) ∧
      ¬ IsGIrreducible (parabolics K) (torus K) := by sorry

-- cr_unipotent: the standard Borel witnesses failure, including every Levi.
example [IsAlgClosed K] :
    upperUnipotent K ≤ borel K ∧ borel K ∈ parabolics K ∧
      (∀ M ∈ levis K (borel K), ¬ upperUnipotent K ≤ M) ∧
      ¬ IsGCompletelyReducible (parabolics K) (levis K) (upperUnipotent K) := by
  sorry

-- This also tests the cyclic parameter image, without replacing it by U(K).
example [IsAlgClosed K] [Algebra ℚ K] :
    ¬ IsGCompletelyReducible (parabolics K) (levis K)
      (zpowersHom (G K) (CoarseSL2Checks.unipotent (K := K))).range := by sorry

end
end ReducibilitySL2Checks

/-! Simultaneous SL₂ conjugation in every tuple arity. This uses the
regular coordinate ring of SL₂^n, rather than arbitrary point functions;
the same one-parameter subgroup contracts every entry of a unipotent tuple. -/
namespace CoarseSL2TupleChecks
noncomputable section
abbrev Variables (n : ℕ) := Fin n × (Fin 2 × Fin 2)
abbrev Polynomials (n : ℕ) := MvPolynomial (Variables n) ℚ

def determinantRelation (n : ℕ) (k : Fin n) : Polynomials n :=
  MvPolynomial.X (k, 0, 0) * MvPolynomial.X (k, 1, 1) -
    MvPolynomial.X (k, 0, 1) * MvPolynomial.X (k, 1, 0) - 1

def relations (n : ℕ) : Ideal (Polynomials n) :=
  Ideal.span (Set.range (determinantRelation n))
abbrev Coordinates (n : ℕ) := Polynomials n ⧸ relations n

def coordinate (n : ℕ) (k : Fin n) (i j : Fin 2) : Coordinates n :=
  Ideal.Quotient.mkₐ ℚ (relations n) (MvPolynomial.X (k, i, j))

def conjugator (n : ℕ) :
    Matrix (Fin 2) (Fin 2) (CoarseSL2Checks.Coordinates ⊗[ℚ] Coordinates n) :=
  fun i j => (Algebra.TensorProduct.includeLeft : CoarseSL2Checks.Coordinates →ₐ[ℚ]
    CoarseSL2Checks.Coordinates ⊗[ℚ] Coordinates n) (CoarseSL2Checks.coordinate i j)

def parameter (n : ℕ) (k : Fin n) :
    Matrix (Fin 2) (Fin 2) (CoarseSL2Checks.Coordinates ⊗[ℚ] Coordinates n) :=
  fun i j => (Algebra.TensorProduct.includeRight : Coordinates n →ₐ[ℚ]
    CoarseSL2Checks.Coordinates ⊗[ℚ] Coordinates n) (coordinate n k i j)

def conjugation (n : ℕ) :
    Coordinates n →ₐ[ℚ] CoarseSL2Checks.Coordinates ⊗[ℚ] Coordinates n :=
  Ideal.Quotient.liftₐ (relations n)
    (MvPolynomial.aeval (fun v : Variables n =>
      (conjugator n * parameter n v.1 * (conjugator n).adjugate) v.2.1 v.2.2))
    (by sorry)

def projection (n : ℕ) :
    Coordinates n →ₐ[ℚ] CoarseSL2Checks.Coordinates ⊗[ℚ] Coordinates n :=
  Algebra.TensorProduct.includeRight

abbrev Invariants (n : ℕ) := ParameterInvariantAlgebra (R := ℚ) (A := Coordinates n)
  (B := CoarseSL2Checks.Coordinates ⊗[ℚ] Coordinates n) (conjugation n) (projection n)

variable {K : Type u} [Field K] [Algebra ℚ K]
def evaluate {n : ℕ} (g : Fin n → Matrix.SpecialLinearGroup (Fin 2) K) :
    Coordinates n →ₐ[ℚ] K :=
  Ideal.Quotient.liftₐ (relations n)
    (MvPolynomial.aeval (fun v : Variables n => g v.1 v.2.1 v.2.2)) (by sorry)

theorem evaluate_coordinate {n : ℕ}
    (g : Fin n → Matrix.SpecialLinearGroup (Fin 2) K) (k : Fin n) (i j : Fin 2) :
    evaluate g (coordinate n k i j) = g k i j := by sorry

theorem conjugation_evaluate {n : ℕ} (h : Matrix.SpecialLinearGroup (Fin 2) K)
    (g : Fin n → Matrix.SpecialLinearGroup (Fin 2) K) (f : Coordinates n) :
    Algebra.TensorProduct.lift (CoarseSL2Checks.evaluate h) (evaluate g)
      (fun _ _ => Commute.all _ _) (conjugation n f) =
      evaluate (fun i => h * g i * h⁻¹) f := by sorry

def rhoU : Multiplicative ℤ →* Matrix.SpecialLinearGroup (Fin 2) K :=
  zpowersHom _ CoarseSL2Checks.unipotent

def degeneration {n : ℕ} (γ : Fin n → Multiplicative ℤ) :
    Coordinates n →ₐ[ℚ] Polynomial K :=
  Ideal.Quotient.liftₐ (relations n)
    (MvPolynomial.aeval (fun v : Variables n =>
      (!![1, Polynomial.C ((γ v.1).toAdd : K) * Polynomial.X ^ 2; 0, 1] :
        Matrix (Fin 2) (Fin 2) (Polynomial K)) v.2.1 v.2.2)) (by sorry)

-- projected_unipotent: every arity and every tuple-invariant evaluation agree.
example (n : ℕ) (γ : Fin n → Multiplicative ℤ) (f : Invariants n) :
    evaluate (fun i => rhoU (K := K) (γ i)) f.val =
      evaluate (fun _ => (1 : Matrix.SpecialLinearGroup (Fin 2) K)) f.val := by sorry

-- The simultaneous degeneration proves the equality on regular invariants.
example (n : ℕ) (γ : Fin n → Multiplicative ℤ) (f : Invariants n) :
    degeneration (K := K) γ f.val =
      Polynomial.C (evaluate (fun _ => (1 : Matrix.SpecialLinearGroup (Fin 2) K))
        f.val) := by sorry

-- semisimple_unipotent: equal invariant values do not make the original lift CR.
example [IsAlgClosed K] :
    ¬ IsGCompletelyReducible (ReducibilitySL2Checks.parabolics K)
      (ReducibilitySL2Checks.levis K) (rhoU (K := K)).range ∧
    (∀ (n : ℕ) (γ : Fin n → Multiplicative ℤ) (f : Invariants n),
      evaluate (fun i => rhoU (K := K) (γ i)) f.val =
        evaluate (fun _ => (1 : Matrix.SpecialLinearGroup (Fin 2) K)) f.val) ∧
    ¬ ∃ h : Matrix.SpecialLinearGroup (Fin 2) K,
      ∀ γ, h * rhoU γ * h⁻¹ = 1 := by sorry

end
end CoarseSL2TupleChecks

section FreeIndex
variable (Γ : Type u) [Group Γ]

structure FreeCocycleIndex where
  rank : ℕ
  tuple : FreeGroup (Fin rank) →* Γ

namespace FreeCocycleIndex
structure Hom (a b : FreeCocycleIndex Γ) where
  word : FreeGroup (Fin a.rank) →* FreeGroup (Fin b.rank)
  comm : b.tuple.comp word = a.tuple

instance : SmallCategory (FreeCocycleIndex Γ) where
  Hom a b := ULift.{u} (Hom Γ a b)
  id a := ⟨⟨MonoidHom.id _, by sorry⟩⟩
  comp f g := ⟨⟨g.down.word.comp f.down.word, by sorry⟩⟩
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry

/-- Tuple constructor using the pinned free-group universal property. -/
def ofTuple (n : ℕ) (γ : Fin n → Γ) : FreeCocycleIndex Γ := ⟨n, FreeGroup.lift γ⟩

def coproduct (a b : FreeCocycleIndex Γ) : FreeCocycleIndex Γ :=
  ofTuple Γ (a.rank + b.rank)
    (Fin.addCases (fun i => a.tuple (FreeGroup.of i))
      (fun i => b.tuple (FreeGroup.of i)))

def inl (a b : FreeCocycleIndex Γ) : a ⟶ coproduct Γ a b :=
  ⟨⟨FreeGroup.map (Fin.castAdd b.rank), by sorry⟩⟩

def inr (a b : FreeCocycleIndex Γ) : b ⟶ coproduct Γ a b :=
  ⟨⟨FreeGroup.map (Fin.natAdd a.rank), by sorry⟩⟩

def desc {a b c : FreeCocycleIndex Γ} (f : a ⟶ c) (g : b ⟶ c) :
    coproduct Γ a b ⟶ c :=
  ⟨⟨FreeGroup.lift (Fin.addCases
    (fun i => f.down.word (FreeGroup.of i))
    (fun i => g.down.word (FreeGroup.of i))), by sorry⟩⟩

theorem inl_desc {a b c : FreeCocycleIndex Γ} (f : a ⟶ c) (g : b ⟶ c) :
    inl Γ a b ≫ desc Γ f g = f := by sorry

theorem inr_desc {a b c : FreeCocycleIndex Γ} (f : a ⟶ c) (g : b ⟶ c) :
    inr Γ a b ≫ desc Γ f g = g := by sorry

theorem desc_unique {a b c : FreeCocycleIndex Γ} (f : a ⟶ c) (g : b ⟶ c)
    (h : coproduct Γ a b ⟶ c)
    (hl : inl Γ a b ≫ h = f) (hr : inr Γ a b ≫ h = g) :
    h = desc Γ f g := by sorry

noncomputable def coproductIsColimit (a b : FreeCocycleIndex Γ) :
    IsColimit (BinaryCofan.mk (inl Γ a b) (inr Γ a b)) := by sorry

theorem sifted : IsSifted (FreeCocycleIndex Γ) := by sorry

theorem ofTuple_generator (n : ℕ) (γ : Fin n → Γ) (i : Fin n) :
    (ofTuple Γ n γ).tuple (FreeGroup.of i) = γ i := by sorry

def identityIndex (n : ℕ) : FreeCocycleIndex (FreeGroup (Fin n)) :=
  ⟨n, MonoidHom.id _⟩

noncomputable def identityIndex_terminal (n : ℕ) :
    IsTerminal (identityIndex n) := by sorry

-- index_zero
example : IsInitial (ofTuple Γ 0 (fun i => Fin.elim0 i)) := by sorry

-- index_coproduct
example (a b : FreeCocycleIndex Γ) : (coproduct Γ a b).rank = a.rank + b.rank := by sorry

-- The two inclusions preserve the actual tuple, not just its length.
example (a b : FreeCocycleIndex Γ) (i : Fin a.rank) :
    (coproduct Γ a b).tuple (FreeGroup.of (Fin.castAdd b.rank i)) =
      a.tuple (FreeGroup.of i) := by sorry

example (a b : FreeCocycleIndex Γ) (i : Fin b.rank) :
    (coproduct Γ a b).tuple (FreeGroup.of (Fin.natAdd a.rank i)) =
      b.tuple (FreeGroup.of i) := by sorry
end FreeCocycleIndex
end FreeIndex

/-! ## LP2: free cocycle coordinates and the actual invariant diagram

The coefficient algebra, group model and action are inputs, rather than an
arbitrary diagram of rings. All invariants below are equalizers of scheme
coactions, tested over every coefficient algebra. -/
namespace FreeCocycleIndex
noncomputable section
variable {R C Γ : Type} [CommRing R] [CommRing C] [HopfAlgebra R C] [Group Γ]
variable (β : Γ →* IntegralCocycleScheme.CoordinateAut (R := R) (C := C))

abbrev coordinates (a : FreeCocycleIndex Γ) :=
  IntegralCocycleScheme.tupleCoordinates (R := R) (C := C) (Fin a.rank)

/-- The action on a free tuple is pulled back along its actual map to Γ. -/
def universal (a : FreeCocycleIndex Γ) :
    CrossedCocycle (IntegralCocycleScheme.pointAction (β.comp a.tuple)
      (coordinates (R := R) (C := C) a)) :=
  CrossedCocycle.fromGenerators _ (IntegralCocycleScheme.generatorPoint (R := R) (C := C))

/-- H-points at each free generator identify the represented free cocycle. -/
def pointsEquiv (a : FreeCocycleIndex Γ) (B : Type) [CommRing B] [Algebra R B] :
    (coordinates (R := R) (C := C) a →ₐ[R] B) ≃
      CrossedCocycle (IntegralCocycleScheme.pointAction (β.comp a.tuple) B) := by sorry

theorem pointsEquiv_apply (a : FreeCocycleIndex Γ)
    (B : Type) [CommRing B] [Algebra R B]
    (f : coordinates (R := R) (C := C) a →ₐ[R] B) (w : FreeGroup (Fin a.rank)) :
    pointsEquiv β a B f w = TauCeti.AlgHom.mapValue f (universal β a w) := by sorry

/-- Twisted conjugation evaluated at the universal H-point. -/
def gaugeAction (a : FreeCocycleIndex Γ) :
    coordinates (R := R) (C := C) a →ₐ[R]
      C ⊗[R] coordinates (R := R) (C := C) a :=
  let f : coordinates (R := R) (C := C) a →ₐ[R]
      C ⊗[R] coordinates (R := R) (C := C) a := Algebra.TensorProduct.includeRight
  (pointsEquiv β a _).symm
    (((universal β a).map (TauCeti.AlgHom.mapValue f)
      (fun w x => IntegralCocycleScheme.pointAction_natural (β.comp a.tuple) f w x)).gauge
      (WithConv.toConv Algebra.TensorProduct.includeLeft))

def evaluateGauge (a : FreeCocycleIndex Γ)
    {B : Type} [CommRing B] [Algebra R B]
    (h : IntegralCocycleScheme.Points (R := R) (C := C) B)
    (f : coordinates (R := R) (C := C) a →ₐ[R] B) :
    C ⊗[R] coordinates (R := R) (C := C) a →ₐ[R] B :=
  Algebra.TensorProduct.lift h.ofConv f (fun _ _ => Commute.all _ _)

theorem gaugeAction_evaluate (a : FreeCocycleIndex Γ)
    {B : Type} [CommRing B] [Algebra R B]
    (h : IntegralCocycleScheme.Points (R := R) (C := C) B)
    (f : coordinates (R := R) (C := C) a →ₐ[R] B) :
    pointsEquiv β a B ((evaluateGauge a h f).comp (gaugeAction β a)) =
      (pointsEquiv β a B f).gauge h := by sorry

theorem gaugeAction_counit (a : FreeCocycleIndex Γ) :
    ((Algebra.TensorProduct.lid R (coordinates (R := R) (C := C) a)).toAlgHom.comp
      (Algebra.TensorProduct.map (Bialgebra.counitAlgHom R C)
        (AlgHom.id R (coordinates (R := R) (C := C) a)))).comp (gaugeAction β a) =
      AlgHom.id R (coordinates (R := R) (C := C) a) := by sorry

theorem gaugeAction_coassoc (a : FreeCocycleIndex Γ) :
    (Algebra.TensorProduct.assoc R R R C C (coordinates (R := R) (C := C) a)).toAlgHom.comp
      ((Algebra.TensorProduct.map (Bialgebra.comulAlgHom R C)
        (AlgHom.id R (coordinates (R := R) (C := C) a))).comp (gaugeAction β a)) =
    (Algebra.TensorProduct.map (AlgHom.id R C) (gaugeAction β a)).comp
      (gaugeAction β a) := by sorry

/-- A word F_a→F_b induces the ring map O(H^a)→O(H^b). -/
def wordPullback {a b : FreeCocycleIndex Γ} (f : a ⟶ b) :
    coordinates (R := R) (C := C) a →ₐ[R] coordinates (R := R) (C := C) b :=
  IntegralCocycleScheme.evaluateTuple
    (fun i => universal β b (f.down.word (FreeGroup.of i)))

theorem wordPullback_generator {a b : FreeCocycleIndex Γ} (f : a ⟶ b)
    (i : Fin a.rank) (x : C) :
    wordPullback β f ((IntegralCocycleScheme.generatorPoint (R := R) (C := C) i).ofConv x) =
      (universal β b (f.down.word (FreeGroup.of i))).ofConv x := by sorry

theorem wordPullback_id (a : FreeCocycleIndex Γ) :
    wordPullback β (𝟙 a) = AlgHom.id R (coordinates (R := R) (C := C) a) := by sorry

theorem wordPullback_comp {a b d : FreeCocycleIndex Γ} (f : a ⟶ b) (g : b ⟶ d) :
    wordPullback β (f ≫ g) = (wordPullback β g).comp (wordPullback β f) := by sorry

/-- Scheme equivariance, before passing to invariants; H(R)-points are insufficient. -/
theorem wordPullback_gauge {a b : FreeCocycleIndex Γ} (f : a ⟶ b) :
    (gaugeAction β b).comp (wordPullback β f) =
      (Algebra.TensorProduct.map (AlgHom.id R C) (wordPullback β f)).comp
        (gaugeAction β a) := by sorry

abbrev invariantCoordinates (a : FreeCocycleIndex Γ) :=
  ParameterInvariantAlgebra (gaugeAction β a) Algebra.TensorProduct.includeRight

def invariantPullback {a b : FreeCocycleIndex Γ} (f : a ⟶ b) :
    invariantCoordinates β a →ₐ[R] invariantCoordinates β b :=
  ParameterInvariantAlgebra.lift (gaugeAction β b) Algebra.TensorProduct.includeRight
    ((wordPullback β f).comp
      (ParameterInvariantAlgebra.inclusion (gaugeAction β a) Algebra.TensorProduct.includeRight))
    (by sorry)

theorem invariantPullback_val {a b : FreeCocycleIndex Γ} (f : a ⟶ b)
    (x : invariantCoordinates β a) :
    (invariantPullback β f x).val = wordPullback β f x.val := by sorry

/-- The actual free-cocycle invariant diagram in coefficient algebras. -/
def invariantCoordinateDiagram : FreeCocycleIndex Γ ⥤ CommAlgCat R where
  obj a := CommAlgCat.of R (invariantCoordinates β a)
  map f := CommAlgCat.ofHom (invariantPullback β f)
  map_id := by sorry
  map_comp := by sorry

/-- The uninvariant version, for the ordinary and derived free-resolution comparisons. -/
def coordinateDiagram : FreeCocycleIndex Γ ⥤ CommAlgCat R where
  obj a := CommAlgCat.of R (coordinates (R := R) (C := C) a)
  map f := CommAlgCat.ofHom (wordPullback β f)
  map_id := by sorry
  map_comp := by sorry

-- index_direction: the triangle's word is substituted into the universal cocycle.
example {a b : FreeCocycleIndex Γ} (f : a ⟶ b) (i : Fin a.rank) (x : C) :
    (coordinateDiagram β).map f
      ((IntegralCocycleScheme.generatorPoint (R := R) (C := C) i).ofConv x) =
        (universal β b (f.down.word (FreeGroup.of i))).ofConv x := by sorry

/-- An explicit word map whose images satisfy the indexing triangle. -/
def wordHom {a b : FreeCocycleIndex Γ}
    (v : Fin a.rank → FreeGroup (Fin b.rank))
    (hv : ∀ i, b.tuple (v i) = a.tuple (FreeGroup.of i)) : a ⟶ b :=
  ⟨⟨FreeGroup.lift v, by sorry⟩⟩

-- Crossed multiplication, including the pulled-back action in the second factor.
example (χ : FreeGroup (Fin 2) →*
    IntegralCocycleScheme.CoordinateAut (R := R) (C := C)) (x : C) :
    let b := identityIndex 2
    let a := ofTuple (FreeGroup (Fin 2)) 1
      (fun _ => FreeGroup.of (0 : Fin 2) * FreeGroup.of (1 : Fin 2))
    let f : a ⟶ b := wordHom
      (fun _ => FreeGroup.of (0 : Fin 2) * FreeGroup.of (1 : Fin 2)) (by sorry)
    wordPullback χ f
      ((IntegralCocycleScheme.generatorPoint (R := R) (C := C) (0 : Fin 1)).ofConv x) =
      ((universal χ b (FreeGroup.of (0 : Fin 2))) *
        IntegralCocycleScheme.pointAction (χ.comp b.tuple)
          (coordinates (R := R) (C := C) b) (FreeGroup.of (0 : Fin 2))
            (universal χ b (FreeGroup.of (1 : Fin 2)))).ofConv x := by sorry

-- Inversion must also use the inverse word's action.
example (χ : FreeGroup (Fin 1) →*
    IntegralCocycleScheme.CoordinateAut (R := R) (C := C)) (x : C) :
    let b := identityIndex 1
    let a := ofTuple (FreeGroup (Fin 1)) 1
      (fun _ => (FreeGroup.of (0 : Fin 1))⁻¹)
    let f : a ⟶ b := wordHom
      (fun _ => (FreeGroup.of (0 : Fin 1))⁻¹) (by sorry)
    wordPullback χ f
      ((IntegralCocycleScheme.generatorPoint (R := R) (C := C) (0 : Fin 1)).ofConv x) =
      (IntegralCocycleScheme.pointAction (χ.comp b.tuple)
        (coordinates (R := R) (C := C) b) (FreeGroup.of (0 : Fin 1))⁻¹
          (universal χ b (FreeGroup.of (0 : Fin 1)))⁻¹).ofConv x := by sorry

-- A split torus with trivial action has trivial gauge coaction over all test rings.
example (a : FreeCocycleIndex Γ) :
    gaugeAction (1 : Γ →*
      IntegralCocycleScheme.CoordinateAut (R := R) (C := LaurentPolynomial R)) a =
        Algebra.TensorProduct.includeRight := by sorry

-- Thus the scheme-invariant equalizer includes every coordinate, not just rational points.
example (a : FreeCocycleIndex Γ) :
    invariantCoordinates (1 : Γ →*
      IntegralCocycleScheme.CoordinateAut (R := R) (C := LaurentPolynomial R)) a = ⊤ := by sorry

/-- Reindex tuples along a group map; the action is required to be its pullback. -/
def mapGroup {Δ : Type} [Group Δ] (f : Γ →* Δ) :
    FreeCocycleIndex Γ ⥤ FreeCocycleIndex Δ where
  obj a := ⟨a.rank, f.comp a.tuple⟩
  map g := ⟨⟨g.down.word, by sorry⟩⟩
  map_id := by sorry
  map_comp := by sorry

/-- Coordinate transport is identity on generator functions and retains the action. -/
def invariantCoordinateTransport {Δ : Type} [Group Δ]
    (χ : Δ →* IntegralCocycleScheme.CoordinateAut (R := R) (C := C)) (f : Γ →* Δ) :
    invariantCoordinateDiagram (χ.comp f) ≅ mapGroup f ⋙ invariantCoordinateDiagram χ := by sorry

theorem invariantCoordinateTransport_val {Δ : Type} [Group Δ]
    (χ : Δ →* IntegralCocycleScheme.CoordinateAut (R := R) (C := C)) (f : Γ →* Δ)
    (a : FreeCocycleIndex Γ) (x : invariantCoordinates (χ.comp f) a) :
    ((invariantCoordinateTransport χ f).hom.app a x).val = x.val := by sorry

end
end FreeCocycleIndex

/-! The torus check uses the imported Hopf algebra of G_m and the actual
free-cocycle coaction. Its Γ-action is trivial; it does not identify fixed
functions under G_m(R) with scheme invariants. -/
namespace CoarseTorusChecks
noncomputable section
variable (R : Type) [CommRing R]
variable {Γ : Type} [Group Γ]

abbrev action : Γ →* IntegralCocycleScheme.CoordinateAut
    (R := R) (C := LaurentPolynomial R) := 1

-- coarse_torus: conjugation is trivial as an algebraic coaction on G_m^n.
example (a : FreeCocycleIndex Γ) :
    FreeCocycleIndex.gaugeAction (action R) a =
      (Algebra.TensorProduct.includeRight :
        FreeCocycleIndex.coordinates (R := R) (C := LaurentPolynomial R) a →ₐ[R]
          LaurentPolynomial R ⊗[R]
            FreeCocycleIndex.coordinates (R := R) (C := LaurentPolynomial R) a) := by
  sorry

-- The resulting affine quotient map itself is an isomorphism.
example (a : FreeCocycleIndex Γ) :
    IsIso (ParameterCoarseQuotient.quotientMap (R := R)
      (FreeCocycleIndex.gaugeAction (action R) a)
      Algebra.TensorProduct.includeRight) := by sorry

end
end CoarseTorusChecks

section Excursion
noncomputable section
variable {R C Γ : Type} [CommRing R] [CommRing C] [HopfAlgebra R C] [Group Γ]

/-- Exc(Γ,H), formed from scheme invariants in R-algebras, with the prescribed action. -/
def ExcursionAlgebra
    (β : Γ →* IntegralCocycleScheme.CoordinateAut (R := R) (C := C)) : CommAlgCat R :=
  colimit (FreeCocycleIndex.invariantCoordinateDiagram β)

namespace ExcursionAlgebra
variable (β : Γ →* IntegralCocycleScheme.CoordinateAut (R := R) (C := C))

def ofFree (a : FreeCocycleIndex Γ) :
    (FreeCocycleIndex.invariantCoordinateDiagram β).obj a ⟶ ExcursionAlgebra β :=
  colimit.ι (FreeCocycleIndex.invariantCoordinateDiagram β) a

def lift (s : Cocone (FreeCocycleIndex.invariantCoordinateDiagram β)) :
    ExcursionAlgebra β ⟶ s.pt := colimit.desc (FreeCocycleIndex.invariantCoordinateDiagram β) s

theorem ofFree_naturality {a b : FreeCocycleIndex Γ} (f : a ⟶ b) :
    (FreeCocycleIndex.invariantCoordinateDiagram β).map f ≫ ofFree β b = ofFree β a := by sorry

theorem lift_eval (s : Cocone (FreeCocycleIndex.invariantCoordinateDiagram β))
    (a : FreeCocycleIndex Γ) : ofFree β a ≫ lift β s = s.ι.app a := by sorry

theorem lift_unique (s : Cocone (FreeCocycleIndex.invariantCoordinateDiagram β))
    (f : ExcursionAlgebra β ⟶ s.pt)
    (hf : ∀ a, ofFree β a ≫ f = s.ι.app a) : f = lift β s := by sorry

@[ext] theorem hom_ext {A : CommAlgCat R} {f g : ExcursionAlgebra β ⟶ A}
    (h : ∀ a, ofFree β a ≫ f = ofFree β a ≫ g) : f = g := by sorry

/-- Postcomposition of tuples gives the covariant group transport of Exc. -/
def mapGroup {Δ : Type} [Group Δ]
    (χ : Δ →* IntegralCocycleScheme.CoordinateAut (R := R) (C := C)) (f : Γ →* Δ) :
    ExcursionAlgebra (χ.comp f) ⟶ ExcursionAlgebra χ :=
  colimit.desc (FreeCocycleIndex.invariantCoordinateDiagram (χ.comp f))
    { pt := ExcursionAlgebra χ
      ι :=
        { app := fun a => (FreeCocycleIndex.invariantCoordinateTransport χ f).hom.app a ≫
            ofFree χ ((FreeCocycleIndex.mapGroup f).obj a)
          naturality := by sorry } }

theorem mapGroup_ofFree {Δ : Type} [Group Δ]
    (χ : Δ →* IntegralCocycleScheme.CoordinateAut (R := R) (C := C)) (f : Γ →* Δ)
    (a : FreeCocycleIndex Γ) :
    ofFree (χ.comp f) a ≫ mapGroup χ f =
      (FreeCocycleIndex.invariantCoordinateTransport χ f).hom.app a ≫
        ofFree χ ((FreeCocycleIndex.mapGroup f).obj a) := by sorry

theorem mapGroup_id : mapGroup β (MonoidHom.id Γ) = 𝟙 (ExcursionAlgebra β) := by sorry

theorem mapGroup_comp {Δ Ω : Type} [Group Δ] [Group Ω]
    (χ : Ω →* IntegralCocycleScheme.CoordinateAut (R := R) (C := C))
    (f : Γ →* Δ) (g : Δ →* Ω) :
    mapGroup χ (g.comp f) = mapGroup (χ.comp g) f ≫ mapGroup χ g := by sorry

-- excursion_free_group: the actual invariant diagram, with its pulled-back action.
example (n : ℕ)
    (χ : FreeGroup (Fin n) →* IntegralCocycleScheme.CoordinateAut (R := R) (C := C)) :
    Nonempty (ExcursionAlgebra χ ≅
      (FreeCocycleIndex.invariantCoordinateDiagram χ).obj (FreeCocycleIndex.identityIndex n)) := by sorry

-- excursion_trivial_dual: the Hopf algebra R represents the trivial group.
example (χ : Γ →* IntegralCocycleScheme.CoordinateAut (R := R) (C := R)) :
    Nonempty (ExcursionAlgebra χ ≅ CommAlgCat.of R R) := by sorry

-- excursion_lift_eval
example (s : Cocone (FreeCocycleIndex.invariantCoordinateDiagram β)) (a : FreeCocycleIndex Γ) :
    ofFree β a ≫ lift β s = s.ι.app a := by sorry
end ExcursionAlgebra
end
end Excursion

/-! ## Canonical comparison to a represented cocycle scheme -/
namespace ExcursionAlgebra
noncomputable section
variable {R C I : Type} [CommRing R] [CommRing C] [HopfAlgebra R C] [Finite I]
variable (rels : Finset (FreeGroup I))
variable (β : PresentedGroup (rels : Set (FreeGroup I)) →*
  IntegralCocycleScheme.CoordinateAut (R := R) (C := C))

abbrev representedInvariants :=
  ParameterInvariantAlgebra (IntegralCocycleScheme.gaugeAction rels β)
    Algebra.TensorProduct.includeRight

/-- Restrict the represented universal cocycle to the chosen finite free tuple. -/
def evaluateFree (a : FreeCocycleIndex (PresentedGroup (rels : Set (FreeGroup I)))) :
    FreeCocycleIndex.coordinates (R := R) (C := C) a →ₐ[R]
      IntegralCocycleScheme.coordinateRing rels β :=
  IntegralCocycleScheme.evaluateTuple
    (fun i => IntegralCocycleScheme.universalCocycle rels β (a.tuple (FreeGroup.of i)))

theorem evaluateFree_generator
    (a : FreeCocycleIndex (PresentedGroup (rels : Set (FreeGroup I))))
    (i : Fin a.rank) (x : C) :
    evaluateFree rels β a
      ((IntegralCocycleScheme.generatorPoint (R := R) (C := C) i).ofConv x) =
      (IntegralCocycleScheme.universalCocycle rels β (a.tuple (FreeGroup.of i))).ofConv x := by sorry

theorem evaluateFree_gauge
    (a : FreeCocycleIndex (PresentedGroup (rels : Set (FreeGroup I)))) :
    (IntegralCocycleScheme.gaugeAction rels β).comp (evaluateFree rels β a) =
      (Algebra.TensorProduct.map (AlgHom.id R C) (evaluateFree rels β a)).comp
        (FreeCocycleIndex.gaugeAction β a) := by sorry

theorem evaluateFree_word
    {a b : FreeCocycleIndex (PresentedGroup (rels : Set (FreeGroup I)))} (f : a ⟶ b) :
    (evaluateFree rels β b).comp (FreeCocycleIndex.wordPullback β f) =
      evaluateFree rels β a := by sorry

/-- The ordinary free-coordinate diagram represents all compatible cocycle equations. -/
def rawComparisonCocone : Cocone (FreeCocycleIndex.coordinateDiagram β) where
  pt := CommAlgCat.of R (IntegralCocycleScheme.coordinateRing rels β)
  ι :=
    { app := fun a => CommAlgCat.ofHom (evaluateFree rels β a)
      naturality := by sorry }

def rawCompare : colimit (FreeCocycleIndex.coordinateDiagram β) ⟶
    CommAlgCat.of R (IntegralCocycleScheme.coordinateRing rels β) :=
  colimit.desc _ (rawComparisonCocone rels β)

/-- This is the ordinary algebra comparison, before invariants or derived enhancement. -/
theorem rawCompare_isIso : IsIso (rawCompare rels β) := by sorry

/-- Restriction descends to the scheme-invariant equalizers. -/
def evaluateInvariantFree
    (a : FreeCocycleIndex (PresentedGroup (rels : Set (FreeGroup I)))) :
    FreeCocycleIndex.invariantCoordinates β a →ₐ[R] representedInvariants rels β :=
  ParameterInvariantAlgebra.lift (IntegralCocycleScheme.gaugeAction rels β)
    Algebra.TensorProduct.includeRight
    ((evaluateFree rels β a).comp
      (ParameterInvariantAlgebra.inclusion (FreeCocycleIndex.gaugeAction β a)
        Algebra.TensorProduct.includeRight)) (by sorry)

theorem evaluateInvariantFree_val
    (a : FreeCocycleIndex (PresentedGroup (rels : Set (FreeGroup I))))
    (x : FreeCocycleIndex.invariantCoordinates β a) :
    (evaluateInvariantFree rels β a x).val = evaluateFree rels β a x.val := by sorry

/-- The universal cocycle makes these actual evaluation maps compatible. -/
def comparisonCocone : Cocone (FreeCocycleIndex.invariantCoordinateDiagram β) where
  pt := CommAlgCat.of R (representedInvariants rels β)
  ι :=
    { app := fun a => CommAlgCat.ofHom (evaluateInvariantFree rels β a)
      naturality := by sorry }

def compare : ExcursionAlgebra β ⟶ CommAlgCat.of R (representedInvariants rels β) :=
  lift β (comparisonCocone rels β)

/-- Its characteristic equation fixes the canonical map without a choice of a cone. -/
theorem compare_ofFree
    (a : FreeCocycleIndex (PresentedGroup (rels : Set (FreeGroup I)))) :
    ofFree β a ≫ compare rels β = CommAlgCat.ofHom (evaluateInvariantFree rels β a) := by sorry

theorem compare_eval
    (a : FreeCocycleIndex (PresentedGroup (rels : Set (FreeGroup I))))
    (x : FreeCocycleIndex.invariantCoordinates β a) :
    ((compare rels β).hom ((ofFree β a).hom x)).val = evaluateFree rels β a x.val := by sorry

-- Evaluate an actual represented cocycle through the canonical excursion comparison.
example (B : Type) [CommRing B] [Algebra R B]
    (c : CrossedCocycle (IntegralCocycleScheme.pointAction β B))
    (a : FreeCocycleIndex (PresentedGroup (rels : Set (FreeGroup I))))
    (x : FreeCocycleIndex.invariantCoordinates β a) :
    (IntegralCocycleScheme.pointsEquiv rels β B).symm c
      (((compare rels β).hom ((ofFree β a).hom x)).val) =
        IntegralCocycleScheme.evaluateTuple
          (fun i => c (a.tuple (FreeGroup.of i))) x.val := by sorry

end
end ExcursionAlgebra

section Pseudocharacters
variable {Γ : Type u} [Group Γ]

def orderedFiberProduct {m n : ℕ} (u : Fin m → Fin n) (γ : Fin m → Γ) : Fin n → Γ :=
  fun i => (((List.finRange m).filter (fun j => u j = i)).map γ).prod

variable {R : Type v} {A : Type w} [CommRing R] [CommRing A] [Algebra R A]
  (D : ℕ → Type v) [∀ n, CommRing (D n)] [∀ n, Algebra R (D n)]
  (reindex : ∀ {m n}, (Fin m → Fin n) → D m →ₐ[R] D n)
  (multiply : ∀ {m n}, (Fin m → Fin n) → D n →ₐ[R] D m)

/-- Ordinary tuple shadow of the imported IHG carrier. This is not a second
owner of reductive pseudocharacters. The identification D n = O((H⋊Q)^n)^H
and its genuine coordinate maps are absent supplier inputs. -/
structure InvariantTupleShadow where
  Θ : ∀ n, 0 < n → D n →ₐ[R] ((Fin n → Γ) → A)
  reindex_law : ∀ {m n} (hm : 0 < m) (hn : 0 < n)
    (u : Fin m → Fin n) (f : D m) (γ : Fin n → Γ),
    Θ n hn (reindex u f) γ = Θ m hm f (fun j => γ (u j))
  multiply_law : ∀ {m n} (hm : 0 < m) (hn : 0 < n)
    (u : Fin m → Fin n) (f : D n) (γ : Fin m → Γ),
    Θ m hm (multiply u f) γ = Θ n hn f (orderedFiberProduct u γ)

namespace InvariantTupleShadow
@[ext] theorem ext (c d : InvariantTupleShadow (Γ := Γ) (A := A) D reindex multiply)
    (h : ∀ n hn f γ, c.Θ n hn f γ = d.Θ n hn f γ) : c = d := by sorry

def map {B : Type w} [CommRing B] [Algebra R B]
    (c : InvariantTupleShadow (Γ := Γ) (A := A) D reindex multiply)
    (f : A →ₐ[R] B) : InvariantTupleShadow (Γ := Γ) (A := B) D reindex multiply := by
  sorry

def precomp {Γ' : Type u} [Group Γ']
    (c : InvariantTupleShadow (Γ := Γ) (A := A) D reindex multiply)
    (f : Γ' →* Γ) : InvariantTupleShadow (Γ := Γ') (A := A) D reindex multiply := by
  sorry

-- Additional ordinary tuple check; this is not the geometric pseudocharacter_trivial_group test.
example (c : InvariantTupleShadow (Γ := Unit) (A := A) D reindex multiply)
    (n : ℕ) (hn : 0 < n) (f : D n) (γ δ : Fin n → Unit) :
    c.Θ n hn f γ = c.Θ n hn f δ := by sorry

-- pseudochar_map
example (c : InvariantTupleShadow (Γ := Γ) (A := A) D reindex multiply) :
    c.map D reindex multiply (AlgHom.id R A) = c := by sorry

def IsContinuous [TopologicalSpace Γ] [TopologicalSpace A]
    (c : InvariantTupleShadow (Γ := Γ) (A := A) D reindex multiply) : Prop :=
  ∀ n hn f, Continuous (c.Θ n hn f)
end InvariantTupleShadow

variable {Q : Type z} [Group Q] [Fintype Q] [DecidableEq Q]
  (components : ∀ n, (Fin n → Q) → D n) (η : Γ →* Q)

/-- Prescribed-component fibre over a supplied invariant tuple diagram.
The idempotents must be the actual component idempotents at the geometric owner;
this prototype expresses their evaluation condition without fabricating that owner. -/
structure ProjectedPseudocharacter where
  underlying : InvariantTupleShadow (Γ := Γ) (A := A) D reindex multiply
  component_eval : ∀ n hn (q : Fin n → Q) (γ : Fin n → Γ),
    underlying.Θ n hn (components n q) γ =
      if (fun i => η (γ i)) = q then 1 else 0

namespace ProjectedPseudocharacter
@[ext] theorem ext
    (c d : ProjectedPseudocharacter (A := A) D reindex multiply components η)
    (h : c.underlying = d.underlying) : c = d := by sorry

def forget (c : ProjectedPseudocharacter (A := A) D reindex multiply components η) :=
  c.underlying

def map {B : Type w} [CommRing B] [Algebra R B]
    (c : ProjectedPseudocharacter (A := A) D reindex multiply components η)
    (f : A →ₐ[R] B) : ProjectedPseudocharacter (A := B) D reindex multiply components η := by
  sorry

def precomp {Γ' : Type u} [Group Γ']
    (c : ProjectedPseudocharacter (A := A) D reindex multiply components η)
    (f : Γ' →* Γ) :
    ProjectedPseudocharacter (A := A) D reindex multiply components (η.comp f) := by
  sorry

def IsContinuous [TopologicalSpace Γ] [TopologicalSpace A]
    (c : ProjectedPseudocharacter (A := A) D reindex multiply components η) : Prop :=
  c.underlying.IsContinuous D reindex multiply

-- Component-fibre regression, expressing the projection part of projected_trivial_group.
example (η₀ : Unit →* Q) (c : ProjectedPseudocharacter (Γ := Unit) (A := A)
    D reindex multiply components η₀) (n : ℕ) (hn : 0 < n) :
    c.underlying.Θ n hn (components n (fun _ => 1)) (fun _ => ()) = 1 := by sorry

-- projected_wrong_component: matching tuple families cannot belong to two different fibres.
example [Nontrivial A] {η' : Γ →* Q}
    (c : ProjectedPseudocharacter (A := A) D reindex multiply components η)
    (d : ProjectedPseudocharacter (A := A) D reindex multiply components η')
    (h : c.underlying = d.underlying) : η = η' := by sorry

-- Additional coefficient-fibre identity check.
example (c : ProjectedPseudocharacter (A := A) D reindex multiply components η) :
    c.map D reindex multiply components η (AlgHom.id R A) = c := by sorry
end ProjectedPseudocharacter
end Pseudocharacters

/-! Rank-one specialization with its actual Laurent coordinate algebra.
The character lattice of G_m^n is Z^n; conjugation is trivial. Reindexing
sums exponents over fibres, whereas ordered multiplication pulls exponents
back. This fixture does not define the general IHG pseudocharacter carrier. -/
namespace RankOneTupleChecks
noncomputable section
variable (R : Type u) [CommRing R]

abbrev Coordinates (n : ℕ) := AddMonoidAlgebra R (Fin n → ℤ)

def pushWeights {m n : ℕ} (u : Fin m → Fin n) :
    (Fin m → ℤ) →+ (Fin n → ℤ) where
  toFun a i := ∑ j : Fin m, if u j = i then a j else 0
  map_zero' := by sorry
  map_add' := by sorry

def pullWeights {m n : ℕ} (u : Fin m → Fin n) :
    (Fin n → ℤ) →+ (Fin m → ℤ) where
  toFun a j := a (u j)
  map_zero' := rfl
  map_add' _ _ := rfl

def reindex {m n : ℕ} (u : Fin m → Fin n) :
    Coordinates R m →ₐ[R] Coordinates R n :=
  AddMonoidAlgebra.mapDomainAlgHom R R (pushWeights u)

def multiply {m n : ℕ} (u : Fin m → Fin n) :
    Coordinates R n →ₐ[R] Coordinates R m :=
  AddMonoidAlgebra.mapDomainAlgHom R R (pullWeights u)

variable {Γ : Type v} [Group Γ] {A : Type w} [CommRing A] [Algebra R A]

def monomialEvaluation (χ : Γ →* Aˣ) (n : ℕ) :
    Multiplicative (Fin n → ℤ) →* ((Fin n → Γ) → A) where
  toFun a γ := ∏ i : Fin n, ((χ (γ i) ^ a.toAdd i : Aˣ) : A)
  map_one' := by sorry
  map_mul' := by sorry

def tupleEvaluation (χ : Γ →* Aˣ) (n : ℕ) :
    Coordinates R n →ₐ[R] ((Fin n → Γ) → A) :=
  AddMonoidAlgebra.lift R _ _ (monomialEvaluation χ n)

def shadow (χ : Γ →* Aˣ) :
    InvariantTupleShadow (Γ := Γ) (A := A) (Coordinates R)
      (reindex R) (multiply R) where
  Θ n _ := tupleEvaluation R χ n
  reindex_law := by sorry
  multiply_law := by sorry

def projected (χ : Γ →* Aˣ) :
    ProjectedPseudocharacter (A := A) (Coordinates R) (reindex R) (multiply R)
      (fun _ (_ : Fin _ → Unit) => 1) (1 : Γ →* Unit) where
  underlying := shadow R χ
  component_eval := by sorry

-- projected_rank_one: every Laurent monomial retains the character values.
example (χ : Γ →* Aˣ) (n : ℕ) (hn : 0 < n)
    (a : Fin n → ℤ) (r : R) (γ : Fin n → Γ) :
    (projected R χ).underlying.Θ n hn (AddMonoidAlgebra.single a r) γ =
      algebraMap R A r * ∏ i : Fin n, ((χ (γ i) ^ a i : Aˣ) : A) := by sorry

-- Positive and negative weights detect the unit and its inverse separately.
example (χ : Γ →* Aˣ) (γ : Γ) :
    (projected R χ).underlying.Θ 1 (by decide)
      (AddMonoidAlgebra.single (fun _ => 1) 1) (fun _ => γ) = (χ γ : A) ∧
    (projected R χ).underlying.Θ 1 (by decide)
      (AddMonoidAlgebra.single (fun _ => -1) 1) (fun _ => γ) = ((χ γ)⁻¹ : Aˣ) := by
  sorry

-- No two different rank-one characters produce the same tuple family.
example (χ ψ : Γ →* Aˣ) : projected R χ = projected R ψ ↔ χ = ψ := by sorry

def recoverCharacter
    (c : ProjectedPseudocharacter (Γ := Γ) (A := A) (Coordinates R)
      (reindex R) (multiply R) (fun _ (_ : Fin _ → Unit) => 1) (1 : Γ →* Unit)) :
    Γ →* Aˣ where
  toFun γ :=
    { val := c.underlying.Θ 1 (by decide)
        (AddMonoidAlgebra.single (fun _ => 1) 1) (fun _ => γ)
      inv := c.underlying.Θ 1 (by decide)
        (AddMonoidAlgebra.single (fun _ => -1) 1) (fun _ => γ)
      val_inv := by sorry
      inv_val := by sorry }
  map_one' := by sorry
  map_mul' := by sorry

def characterEquiv : (Γ →* Aˣ) ≃
    ProjectedPseudocharacter (Γ := Γ) (A := A) (Coordinates R)
      (reindex R) (multiply R) (fun _ (_ : Fin _ → Unit) => 1) (1 : Γ →* Unit) where
  toFun := projected R
  invFun := recoverCharacter R
  left_inv := by sorry
  right_inv := by sorry

example (χ : Γ →* Aˣ) : (characterEquiv R).symm (projected R χ) = χ := by sorry

end
end RankOneTupleChecks

/- Rational-point regression for LP2c.1. This fixture uses Mathlib's actual
semidirect product, with C₂ acting on ℚˣ by inversion. It checks the fixed
projection and H-conjugacy distinction in every tuple arity; it does not
supply the geometric invariant algebra or reconstruction theorem. -/
namespace IdentityComponentChecks
abbrev Q := Multiplicative (ZMod 2)

def invAut : MulAut ℚˣ where
  toFun := Inv.inv
  invFun := Inv.inv
  left_inv := inv_inv
  right_inv := inv_inv
  map_mul' a b := by simp [mul_comm]

def action : Q →* MulAut ℚˣ where
  toFun q := if q.toAdd = 0 then 1 else invAut
  map_one' := by simp
  map_mul' q r := by
    induction q using Multiplicative.rec with | ofAdd s =>
    induction r using Multiplicative.rec with | ofAdd t =>
    change (if s + t = 0 then (1 : MulAut ℚˣ) else invAut) =
      (if s = 0 then 1 else invAut) * (if t = 0 then 1 else invAut)
    fin_cases s <;> fin_cases t
    · rfl
    · rfl
    · rfl
    · change (1 : MulAut ℚˣ) = invAut * invAut
      apply MulEquiv.ext
      intro x
      simp [invAut]

abbrev J := SemidirectProduct ℚˣ Q action

def a : ℚˣ := Units.mk0 2 (by norm_num)
def b : ℚˣ := Units.mk0 (1 / 2) (by norm_num)
def switch : J := SemidirectProduct.inr (Multiplicative.ofAdd (1 : ZMod 2))

theorem inv_a : a⁻¹ = b := by
  apply Units.ext
  norm_num [a, b]

-- projected_identity_component_shadow: rational conjugation and coordinate values.
example (f : ℚˣ → ℚ) (hf : ∀ x : ℚˣ, f x⁻¹ = f x) :
    (∀ h : ℚˣ, h * a * h⁻¹ = a ∧ h * b * h⁻¹ = b) ∧
      (a : ℚ) ≠ (b : ℚ) ∧ f a = f b := by
  refine ⟨fun h => ⟨by simp, by simp⟩, ?_, ?_⟩
  · norm_num [a, b]
  · simpa only [inv_a] using (hf a).symm

def lift (x : ℚˣ) : Multiplicative ℤ →* J :=
  (SemidirectProduct.inl : ℚˣ →* J).comp (zpowersHom ℚˣ x)

theorem lift_projection (x : ℚˣ) (n : Multiplicative ℤ) : (lift x n).right = 1 := by
  rfl

theorem lift_one (x : ℚˣ) :
    lift x (Multiplicative.ofAdd (1 : ℤ)) = SemidirectProduct.inl x := by
  simp [lift, zpowersHom]

theorem h_conjugation (h x : ℚˣ) :
    (SemidirectProduct.inl h : J) * SemidirectProduct.inl x *
      (SemidirectProduct.inl h : J)⁻¹ = SemidirectProduct.inl x := by
  rw [← map_inv, ← map_mul, ← map_mul]
  congr 1
  simp

theorem switch_conjugation (x : ℚˣ) :
    switch * SemidirectProduct.inl x * switch⁻¹ =
      (SemidirectProduct.inl x⁻¹ : J) := by
  rw [switch, ← map_inv, ← SemidirectProduct.inl_aut]
  simp [action, invAut]

theorem lift_switch (n : Multiplicative ℤ) :
    switch * lift a n * switch⁻¹ = lift b n := by
  change switch * SemidirectProduct.inl (a ^ n.toAdd) * switch⁻¹ =
    SemidirectProduct.inl (b ^ n.toAdd)
  rw [switch_conjugation, ← inv_zpow, inv_a]

/-- Even at fixed trivial projection, these two lifts have distinct H-gauge classes. -/
theorem lifts_not_h_conjugate : ¬ ∃ h : ℚˣ, ∀ n : Multiplicative ℤ,
    (SemidirectProduct.inl h : J) * lift a n *
      (SemidirectProduct.inl h : J)⁻¹ = lift b n := by
  rintro ⟨h, hh⟩
  have hab := hh (Multiplicative.ofAdd (1 : ℤ))
  rw [lift_one, lift_one, h_conjugation] at hab
  have hab' := SemidirectProduct.inl_injective hab
  have hval := congrArg (fun x : ℚˣ => (x : ℚ)) hab'
  norm_num [a, b] at hval

/-- Every whole-J invariant tuple function, in every arity, identifies the two lifts. -/
theorem whole_group_invariants_equal (I : Type*) {B : Type*} (f : (I → J) → B)
    (hf : ∀ j : J, ∀ g : I → J, f (fun i => j * g i * j⁻¹) = f g)
    (n : I → Multiplicative ℤ) :
    f (fun i => lift a (n i)) = f (fun i => lift b (n i)) := by
  have heq : (fun i => switch * lift a (n i) * switch⁻¹) =
      (fun i => lift b (n i)) := funext (fun i => lift_switch (n i))
  have h := hf switch (fun i => lift a (n i))
  rw [heq] at h
  exact h.symm

/-- The rational-point value of the identity-component Laurent coordinate extended by zero. -/
def coordinate (g : J) : ℚ := if g.right = 1 then (g.left : ℚ) else 0

theorem coordinate_h_invariant (h : ℚˣ) (g : J) :
    coordinate ((SemidirectProduct.inl h : J) * g *
      (SemidirectProduct.inl h : J)⁻¹) = coordinate g := by
  by_cases hg : g.right = 1
  · simp [coordinate, hg]
  · simp [coordinate, hg]

example : coordinate (lift a (Multiplicative.ofAdd (1 : ℤ))) = 2 ∧
    coordinate (lift b (Multiplicative.ofAdd (1 : ℤ))) = 1 / 2 := by
  rw [lift_one, lift_one]
  norm_num [coordinate, a, b]

end IdentityComponentChecks

/- Regular-coordinate regression for LP2c.1. The two Laurent factors are the
coordinate rings of the components of G_m ⋊ C₂; the action target uses the
Laurent coordinates of H × J. This concrete fixture does not export a generic
pseudocharacter carrier or a reconstruction theorem. -/
namespace IdentityComponentCoordinateChecks

noncomputable section

variable (R : Type*) [CommRing R]

abbrev Coordinates := LaurentPolynomial R × LaurentPolynomial R
abbrev ActionCoordinates := AddMonoidAlgebra R (ℤ × ℤ) ×
  AddMonoidAlgebra R (ℤ × ℤ)

def unchanged : ℤ →+ ℤ × ℤ where
  toFun n := (0, n)
  map_zero' := rfl
  map_add' _ _ := rfl

def twisted : ℤ →+ ℤ × ℤ where
  toFun n := (2 * n, n)
  map_zero' := by simp
  map_add' _ _ := by simp [mul_add]

def reversed : ℤ →+ ℤ where
  toFun n := -n
  map_zero' := neg_zero
  map_add' := neg_add

/-- Pullback of H-conjugation on J = G_m ⋊ C₂: (x,0) ↦ (x,0), (x,1) ↦ (h²x,1). -/
def conjugation : Coordinates R →ₐ[R] ActionCoordinates R :=
  AlgHom.prodMap (AddMonoidAlgebra.mapDomainAlgHom R R unchanged)
    (AddMonoidAlgebra.mapDomainAlgHom R R twisted)

/-- Pullback of the projection H × J → J. -/
def projection : Coordinates R →ₐ[R] ActionCoordinates R :=
  AlgHom.prodMap (AddMonoidAlgebra.mapDomainAlgHom R R unchanged)
    (AddMonoidAlgebra.mapDomainAlgHom R R unchanged)

/-- Pullback of conjugation by (1,1) ∈ J, which inverts x on each component. -/
def switching : Coordinates R →ₐ[R] Coordinates R :=
  AlgHom.prodMap (AddMonoidAlgebra.mapDomainAlgHom R R reversed)
    (AddMonoidAlgebra.mapDomainAlgHom R R reversed)

def coordinate : Coordinates R := (LaurentPolynomial.T 1, 0)
def componentIdempotent : Coordinates R := (1, 0)

theorem conjugation_identity_monomial (n : ℤ) :
    conjugation R (LaurentPolynomial.T n, 0) =
      (AddMonoidAlgebra.single (0, n) 1, 0) := by
  change (AddMonoidAlgebra.mapDomain unchanged (AddMonoidAlgebra.single n 1),
    AddMonoidAlgebra.mapDomain twisted 0) = _
  simp only [AddMonoidAlgebra.mapDomain_single, AddMonoidAlgebra.mapDomain_zero]
  rfl

theorem conjugation_other_monomial (n : ℤ) :
    conjugation R (0, LaurentPolynomial.T n) =
      (0, AddMonoidAlgebra.single (2 * n, n) 1) := by
  change (AddMonoidAlgebra.mapDomain unchanged 0,
    AddMonoidAlgebra.mapDomain twisted (AddMonoidAlgebra.single n 1)) = _
  simp only [AddMonoidAlgebra.mapDomain_single, AddMonoidAlgebra.mapDomain_zero]
  rfl

theorem other_component_not_h_invariant [Nontrivial R] :
    (0, LaurentPolynomial.T 1) ∉
      AlgHom.equalizer (conjugation R) (projection R) := by
  intro h
  change conjugation R (0, LaurentPolynomial.T 1) =
    projection R (0, LaurentPolynomial.T 1) at h
  rw [conjugation_other_monomial] at h
  have hp : projection R (0, LaurentPolynomial.T 1) =
      (0, AddMonoidAlgebra.single (0, 1) 1) := by
    change (AddMonoidAlgebra.mapDomain unchanged 0,
      AddMonoidAlgebra.mapDomain unchanged (AddMonoidAlgebra.single 1 1)) = _
    simp only [AddMonoidAlgebra.mapDomain_zero, AddMonoidAlgebra.mapDomain_single]
    rfl
  rw [hp] at h
  have hc := congrArg (fun p : ActionCoordinates R => p.2.coeff (2, 1)) h
  simp at hc

theorem coordinate_h_invariant : coordinate R ∈
    AlgHom.equalizer (conjugation R) (projection R) := by
  change (AddMonoidAlgebra.mapDomain unchanged (AddMonoidAlgebra.single 1 1),
    AddMonoidAlgebra.mapDomain twisted 0) =
    (AddMonoidAlgebra.mapDomain unchanged (AddMonoidAlgebra.single 1 1),
    AddMonoidAlgebra.mapDomain unchanged 0)
  simp

theorem switching_coordinate : switching R (coordinate R) =
    (LaurentPolynomial.T (-1), 0) := by
  change (AddMonoidAlgebra.mapDomain reversed (AddMonoidAlgebra.single 1 1),
    AddMonoidAlgebra.mapDomain reversed 0) = _
  simp only [AddMonoidAlgebra.mapDomain_single, AddMonoidAlgebra.mapDomain_zero]
  rfl

theorem coordinate_not_switch_invariant [Nontrivial R] : coordinate R ∉
    AlgHom.equalizer (switching R) (AlgHom.id R (Coordinates R)) := by
  intro h
  change switching R (coordinate R) = coordinate R at h
  rw [switching_coordinate] at h
  have hc := congrArg (fun p : Coordinates R => p.1.coeff (1 : ℤ)) h
  simp [coordinate] at hc

theorem component_idempotent : componentIdempotent R * componentIdempotent R =
    componentIdempotent R := by
  simp [componentIdempotent]

theorem component_h_invariant : componentIdempotent R ∈
    AlgHom.equalizer (conjugation R) (projection R) := by
  change ((AddMonoidAlgebra.mapDomainAlgHom R R unchanged) 1,
    (AddMonoidAlgebra.mapDomainAlgHom R R twisted) 0) =
    ((AddMonoidAlgebra.mapDomainAlgHom R R unchanged) 1,
    (AddMonoidAlgebra.mapDomainAlgHom R R unchanged) 0)
  simp

theorem component_switch_invariant : componentIdempotent R ∈
    AlgHom.equalizer (switching R) (AlgHom.id R (Coordinates R)) := by
  change ((AddMonoidAlgebra.mapDomainAlgHom R R reversed) 1,
    (AddMonoidAlgebra.mapDomainAlgHom R R reversed) 0) = (1, 0)
  simp

/-- Selecting the identity component after taking switch invariants cannot recover x.
This is an algebraic obstruction over every nonzero coefficient ring, including
characteristic two; it does not depend on separating rational points. -/
theorem coordinate_not_projected_switch_invariant [Nontrivial R] :
    ¬ ∃ f : Coordinates R,
      f ∈ AlgHom.equalizer (switching R) (AlgHom.id R (Coordinates R)) ∧
      componentIdempotent R * f = coordinate R := by
  rintro ⟨f, hf, heq⟩
  have hm := (AlgHom.equalizer (switching R) (AlgHom.id R (Coordinates R))).mul_mem
    (component_switch_invariant R) hf
  rw [heq] at hm
  exact coordinate_not_switch_invariant R hm

/-- The component restriction from switch invariants misses the Laurent generator.
Whole-J invariants are a subalgebra of switch invariants, so their restriction
cannot surject either. -/
theorem identity_restriction_not_surjective [Nontrivial R] :
    ¬ Function.Surjective
      (fun f : AlgHom.equalizer (switching R) (AlgHom.id R (Coordinates R)) => f.val.1) := by
  intro hs
  obtain ⟨f, hf⟩ := hs (LaurentPolynomial.T (1 : ℤ))
  apply coordinate_not_projected_switch_invariant R
  refine ⟨f.val, f.property, ?_⟩
  apply Prod.ext <;> simp [componentIdempotent, coordinate, hf]

def evalIdentity (x : ℚˣ) : Coordinates ℚ →ₐ[ℚ] ℚ :=
  (AddMonoidAlgebra.lift ℚ ℚ ℤ
    ((Units.coeHom ℚ).comp (zpowersHom ℚˣ x))).comp (AlgHom.fst ℚ _ _)

theorem eval_coordinate (x : ℚˣ) : evalIdentity x (coordinate ℚ) = (x : ℚ) := by
  change AddMonoidAlgebra.lift ℚ ℚ ℤ
    ((Units.coeHom ℚ).comp (zpowersHom ℚˣ x)) (AddMonoidAlgebra.single 1 1) = _
  simp only [AddMonoidAlgebra.lift_single, one_smul, MonoidHom.comp_apply]
  change ↑(x ^ (1 : ℤ)) = (x : ℚ)
  simp

theorem eval_component (x : ℚˣ) : evalIdentity x (componentIdempotent ℚ) = 1 := by
  change AddMonoidAlgebra.lift ℚ ℚ ℤ
    ((Units.coeHom ℚ).comp (zpowersHom ℚˣ x)) 1 = 1
  exact map_one _

example : evalIdentity (Units.mk0 2 (by norm_num)) (coordinate ℚ) = 2 ∧
    evalIdentity (Units.mk0 (1 / 2) (by norm_num)) (coordinate ℚ) = 1 / 2 := by
  simp [eval_coordinate]

end
end IdentityComponentCoordinateChecks

section MatrixCoefficients
variable {R : Type u} [CommRing R] {I : Type v} [Fintype I]
  {Γ H G : Type w} [Group Γ] [Group H] [Group G]
  {V : Type z} [AddCommGroup V] [Module R V]
  [Module.Finite R V] [Module.Projective R V]

/-- The linear-algebra portion; the integral algebraic representation condition is omitted. -/
structure ExcursionDatum (ι : H →* G) [Fintype I]
    [Module.Finite R V] [Module.Projective R V] where
  representation : Representation R (I → G) V
  α : V
  β : V →ₗ[R] R
  α_fixed : ∀ h, representation (fun _ => ι h) α = α
  β_fixed : ∀ h, β.comp (representation (fun _ => ι h)) = β
  tuple : I → Γ

def ExcursionDatum.unit (ι : H →* G) :
    ExcursionDatum (R := R) (I := I) (Γ := Γ) (V := R) ι where
  representation := Representation.trivial R (I → G) R
  α := 1
  β := LinearMap.id
  α_fixed := by sorry
  β_fixed := by sorry
  tuple := fun _ => 1

namespace ExcursionDatum

/-- A constant matrix coefficient with an arbitrary tuple, using the unit representation. -/
def scalar (ι : H →* G) (a : R) (γ : I → Γ) :
    ExcursionDatum (R := R) (I := I) (Γ := Γ) (V := R) ι where
  representation := Representation.trivial R (I → G) R
  α := a
  β := LinearMap.id
  α_fixed := fun _ => rfl
  β_fixed := fun _ => rfl
  tuple := γ

/-- Pull the representation back along a map of finite sets and specify the new tuple.
The operator comparison requires the old tuple to be the pullback of the new one. -/
def reindex {J : Type v} [Fintype J] {ι : H →* G}
    (D : ExcursionDatum (R := R) (I := I) (Γ := Γ) (V := V) ι)
    (f : I → J) (γ : J → Γ) :
    ExcursionDatum (R := R) (I := J) (Γ := Γ) (V := V) ι where
  representation := D.representation.comp
    { toFun := fun g => g ∘ f
      map_one' := rfl
      map_mul' := fun _ _ => rfl }
  α := D.α
  β := D.β
  α_fixed := D.α_fixed
  β_fixed := D.β_fixed
  tuple := γ

omit [Group Γ] in
theorem reindex_tuple {J : Type v} [Fintype J] {ι : H →* G}
    (D : ExcursionDatum (R := R) (I := I) (Γ := Γ) (V := V) ι)
    (f : I → J) (γ : J → Γ) (hγ : D.tuple = γ ∘ f) :
    (D.reindex f γ).tuple ∘ f = D.tuple := hγ.symm

/-- External tensor product on the disjoint union, using Mathlib's tensor representation. -/
noncomputable def tensor {J : Type v} [Fintype J] {ι : H →* G}
    {W : Type z} [AddCommGroup W] [Module R W]
    [Module.Finite R W] [Module.Projective R W]
    (D : ExcursionDatum (R := R) (I := I) (Γ := Γ) (V := V) ι)
    (E : ExcursionDatum (R := R) (I := J) (Γ := Γ) (V := W) ι) :
    ExcursionDatum (R := R) (I := I ⊕ J) (Γ := Γ) (V := V ⊗[R] W) ι where
  representation := Representation.tprod
    (D.representation.comp
      { toFun := fun g => g ∘ Sum.inl
        map_one' := rfl
        map_mul' := fun _ _ => rfl })
    (E.representation.comp
      { toFun := fun g => g ∘ Sum.inr
        map_one' := rfl
        map_mul' := fun _ _ => rfl })
  α := D.α ⊗ₜ[R] E.α
  β := (TensorProduct.lid R R).toLinearMap.comp (TensorProduct.map D.β E.β)
  α_fixed := by
    intro h
    change D.representation (fun _ => ι h) D.α ⊗ₜ[R]
      E.representation (fun _ => ι h) E.α = D.α ⊗ₜ[R] E.α
    rw [D.α_fixed, E.α_fixed]
  β_fixed := by
    intro h
    ext x y
    change D.β (D.representation (fun _ => ι h) x) *
      E.β (E.representation (fun _ => ι h) y) = D.β x * E.β y
    have hD : D.β (D.representation (fun _ => ι h) x) = D.β x := by
      simpa only [LinearMap.comp_apply] using LinearMap.congr_fun (D.β_fixed h) x
    have hE : E.β (E.representation (fun _ => ι h) y) = E.β y := by
      simpa only [LinearMap.comp_apply] using LinearMap.congr_fun (E.β_fixed h) y
    rw [hD, hE]
  tuple := Sum.elim D.tuple E.tuple

omit [Group Γ] in
theorem tensor_tuple_left {J : Type v} [Fintype J] {ι : H →* G}
    {W : Type z} [AddCommGroup W] [Module R W]
    [Module.Finite R W] [Module.Projective R W]
    (D : ExcursionDatum (R := R) (I := I) (Γ := Γ) (V := V) ι)
    (E : ExcursionDatum (R := R) (I := J) (Γ := Γ) (V := W) ι) (i : I) :
    (D.tensor E).tuple (Sum.inl i) = D.tuple i := rfl

omit [Group Γ] in
theorem tensor_tuple_right {J : Type v} [Fintype J] {ι : H →* G}
    {W : Type z} [AddCommGroup W] [Module R W]
    [Module.Finite R W] [Module.Projective R W]
    (D : ExcursionDatum (R := R) (I := I) (Γ := Γ) (V := V) ι)
    (E : ExcursionDatum (R := R) (I := J) (Γ := Γ) (V := W) ι) (j : J) :
    (D.tensor E).tuple (Sum.inr j) = E.tuple j := rfl

end ExcursionDatum

def excursionMatrixCoefficient {ι : H →* G}
    (D : ExcursionDatum (R := R) (I := I) (Γ := Γ) (V := V) ι) (g : I → G) : R :=
  D.β (D.representation g D.α)

namespace excursionMatrixCoefficient
theorem eval {ι : H →* G}
    (D : ExcursionDatum (R := R) (I := I) (Γ := Γ) (V := V) ι) (g : I → G) :
    excursionMatrixCoefficient D g = D.β (D.representation g D.α) := by sorry

omit [Group Γ] in
theorem reindex {J : Type v} [Fintype J] {ι : H →* G}
    (D : ExcursionDatum (R := R) (I := I) (Γ := Γ) (V := V) ι)
    (f : I → J) (γ : J → Γ) (g : J → G) :
    excursionMatrixCoefficient (D.reindex f γ) g =
      excursionMatrixCoefficient D (g ∘ f) := rfl

omit [Group Γ] in
theorem tensor {J : Type v} [Fintype J] {ι : H →* G}
    {W : Type z} [AddCommGroup W] [Module R W]
    [Module.Finite R W] [Module.Projective R W]
    (D : ExcursionDatum (R := R) (I := I) (Γ := Γ) (V := V) ι)
    (E : ExcursionDatum (R := R) (I := J) (Γ := Γ) (V := W) ι)
    (g : I → G) (g' : J → G) :
    excursionMatrixCoefficient (D.tensor E) (Sum.elim g g') =
      excursionMatrixCoefficient D g * excursionMatrixCoefficient E g' := rfl
end excursionMatrixCoefficient

-- coefficient_unit (the categorical datum_unit requires the omitted Hecke carrier).
example (ι : H →* G) (g : I → G) :
    excursionMatrixCoefficient (ExcursionDatum.unit (R := R) (Γ := Γ) ι) g = 1 := by sorry

-- coefficient_zero
example {ι : H →* G}
    (D : ExcursionDatum (R := R) (I := I) (Γ := Γ) (V := V) ι)
    (h : D.α = 0) (g : I → G) : excursionMatrixCoefficient D g = 0 := by sorry

-- coefficient_product
example {J : Type v} [Fintype J] {ι : H →* G}
    {W : Type z} [AddCommGroup W] [Module R W]
    [Module.Finite R W] [Module.Projective R W]
    (D : ExcursionDatum (R := R) (I := I) (Γ := Γ) (V := V) ι)
    (E : ExcursionDatum (R := R) (I := J) (Γ := Γ) (V := W) ι)
    (g : I → G) (g' : J → G) :
    excursionMatrixCoefficient (D.tensor E) (Sum.elim g g') =
      excursionMatrixCoefficient D g * excursionMatrixCoefficient E g' := by
  exact excursionMatrixCoefficient.tensor D E g g'

-- The fold Fin 1 ⊕ Fin 1 → Fin 1 recovers multiplication of coefficients.
-- Comparing the excursion operators also requires D.tuple = E.tuple = γ.
example {ι : H →* G}
    {W : Type z} [AddCommGroup W] [Module R W]
    [Module.Finite R W] [Module.Projective R W]
    (D : ExcursionDatum (R := R) (I := Fin 1) (Γ := Γ) (V := V) ι)
    (E : ExcursionDatum (R := R) (I := Fin 1) (Γ := Γ) (V := W) ι)
    (γ : Fin 1 → Γ) (g : Fin 1 → G) :
    excursionMatrixCoefficient
      ((D.tensor E).reindex (Sum.elim id id) γ) g =
      excursionMatrixCoefficient D g * excursionMatrixCoefficient E g := by
  exact excursionMatrixCoefficient.tensor D E g g

-- coefficient_biinvariant
example {ι : H →* G}
    (D : ExcursionDatum (R := R) (I := I) (Γ := Γ) (V := V) ι)
    (g : I → G) (a b : H) :
    excursionMatrixCoefficient D (fun i => ι a * g i * ι b) =
    excursionMatrixCoefficient D g := by sorry

namespace MatrixCoefficientChecks

def left : ExcursionDatum (R := ℚ) (I := Fin 1) (Γ := Multiplicative ℤ)
    (V := ℚ) (1 : Unit →* Unit) :=
  ExcursionDatum.scalar 1 2 (fun _ => Multiplicative.ofAdd 2)

def right : ExcursionDatum (R := ℚ) (I := Fin 1) (Γ := Multiplicative ℤ)
    (V := ℚ) (1 : Unit →* Unit) :=
  ExcursionDatum.scalar 1 3 (fun _ => Multiplicative.ofAdd 3)

-- coefficient_product_normalization: multiplying 2 and 3 gives 6, whereas addition gives 5.
theorem coefficient_product_normalization :
    excursionMatrixCoefficient (left.tensor right) (fun _ => ()) = 6 := by
  norm_num [excursionMatrixCoefficient, ExcursionDatum.tensor,
    ExcursionDatum.scalar, left, right]

-- coefficient_tensor_tuple: neither leg can be silently replaced or exchanged.
theorem coefficient_tensor_tuple :
    (left.tensor right).tuple (Sum.inl 0) = Multiplicative.ofAdd (2 : ℤ) ∧
    (left.tensor right).tuple (Sum.inr 0) = Multiplicative.ofAdd (3 : ℤ) := by
  exact ⟨rfl, rfl⟩

-- coefficient_reindex_fold: use a common tuple before folding the two legs.
theorem coefficient_reindex_fold : excursionMatrixCoefficient
    (((left.reindex id (fun _ => Multiplicative.ofAdd (5 : ℤ))).tensor
      (right.reindex id (fun _ => Multiplicative.ofAdd (5 : ℤ)))).reindex (Sum.elim id id)
      (fun _ => Multiplicative.ofAdd (5 : ℤ))) (fun _ => ()) = 6 := by
  change excursionMatrixCoefficient (left.tensor right) (fun _ => ()) = 6
  norm_num [excursionMatrixCoefficient, ExcursionDatum.tensor,
    ExcursionDatum.scalar, left, right]

-- coefficient_fold_tuple: the old tuple is the pullback of the folded tuple.
theorem coefficient_fold_tuple :
    ((left.reindex id (fun _ => Multiplicative.ofAdd (5 : ℤ))).tensor
    (right.reindex id (fun _ => Multiplicative.ofAdd (5 : ℤ)))).tuple =
    (fun _ : Fin 1 => Multiplicative.ofAdd (5 : ℤ)) ∘ Sum.elim id id := by
  funext i
  cases i <;> rfl

end MatrixCoefficientChecks
end MatrixCoefficients

section Trace
variable {Γ : Type u} [Group Γ] {R : Type v} [CommRing R]

noncomputable def cycleWord {n : ℕ} (c : Equiv.Perm (Fin n))
    (γ : Fin n → Γ) (i : Fin n) : Γ :=
  ((List.range (orderOf c)).map (fun j => γ ((c ^ j) i))).prod

/-- Nontrivial cycle factors, together with the fixed one-cycles. -/
noncomputable def traceCycleValue {n : ℕ} (τ : Γ → R)
    (γ : Fin n → Γ) (σ : Equiv.Perm (Fin n)) : R := by
  classical
  exact (∏ c ∈ σ.cycleFactorsFinset,
    if h : c.support.Nonempty then τ (cycleWord c γ (c.support.min' h)) else 1) *
    ∏ i ∈ Finset.univ.filter (fun i => σ i = i), τ (γ i)

/-- Group-basis shadow of the imported IHG.0 linear pseudocharacter on R[Γ].
The full adapter requires that imported carrier as specified in README.md.
The linear extension below uses the actual Mathlib group algebra. -/
structure GroupTraceShadow (Γ : Type u) [Group Γ] (R : Type v) [CommRing R]
    (rank : ℕ) where
  toFun : Γ → R
  normalized : toFun 1 = rank
  central : ∀ x y, toFun (x * y) = toFun (y * x)
  alternating : ∀ γ : Fin (rank + 1) → Γ,
    ∑ σ : Equiv.Perm (Fin (rank + 1)),
      (((Equiv.Perm.sign σ : ℤˣ) : ℤ) : R) * traceCycleValue toFun γ σ = 0

instance {r : ℕ} : CoeFun (GroupTraceShadow Γ R r) (fun _ => Γ → R) :=
  ⟨GroupTraceShadow.toFun⟩

namespace GroupTraceShadow
noncomputable def cycleValue {r n : ℕ} (τ : GroupTraceShadow Γ R r)
    (γ : Fin n → Γ) (σ : Equiv.Perm (Fin n)) : R := traceCycleValue τ γ σ

noncomputable def ofRepresentation {n : ℕ} (ρ : Γ →* (Matrix (Fin n) (Fin n) R)ˣ) :
    GroupTraceShadow Γ R n where
  toFun := fun γ => Matrix.trace (ρ γ : Matrix (Fin n) (Fin n) R)
  normalized := by sorry
  central := by sorry
  alternating := by sorry

noncomputable def map {S : Type w} [CommRing S] {r : ℕ}
    (f : R →+* S) (τ : GroupTraceShadow Γ R r) : GroupTraceShadow Γ S r where
  toFun := fun γ => f (τ γ)
  normalized := by sorry
  central := by sorry
  alternating := by sorry

-- trace_rank_one
example (τ : GroupTraceShadow Γ R 1) (x y : Γ) : τ (x * y) = τ x * τ y := by sorry

-- trace_zero_rank
example (τ : GroupTraceShadow Γ R 0) : ∀ γ, τ γ = 0 := by sorry

-- trace_semisimple_sum
example (χ ψ : Γ →* R) : ∃ τ : GroupTraceShadow Γ R 2,
    ∀ γ, τ γ = χ γ + ψ γ := by sorry

-- trace_not_rank_one_constant
example : ¬ ∃ τ : GroupTraceShadow Γ ℚ 2, ∀ γ, τ γ = 1 := by sorry
end GroupTraceShadow

namespace GroupTraceAdapter
/-- The A-linear extension used in the full IHG adapter. -/
noncomputable def extendFunction (τ : Γ → R) : MonoidAlgebra R Γ →ₗ[R] R where
  toFun := fun x => x.coeff.sum (fun γ a => a * τ γ)
  map_add' x y := by
    simp only [MonoidAlgebra.coeff_add]
    exact Finsupp.sum_add_index' (fun _ => zero_mul _) (fun _ _ _ => add_mul _ _ _)
  map_smul' a x := by
    change (a • x.coeff).sum (fun γ b => b * τ γ) =
      a * x.coeff.sum (fun γ b => b * τ γ)
    rw [Finsupp.sum_smul_index' (fun _ => zero_mul _), Finsupp.mul_sum]
    simp only [smul_eq_mul, mul_assoc]

noncomputable def restrictFunction (T : MonoidAlgebra R Γ →ₗ[R] R) : Γ → R :=
  fun γ => T (MonoidAlgebra.of R Γ γ)

theorem extend_basis (τ : Γ → R) (γ : Γ) :
    extendFunction τ (MonoidAlgebra.of R Γ γ) = τ γ := by
  simp [extendFunction, MonoidAlgebra.of_apply]

theorem restrict_extend (τ : Γ → R) : restrictFunction (extendFunction τ) = τ := by
  funext γ
  exact extend_basis τ γ

theorem extend_restrict (T : MonoidAlgebra R Γ →ₗ[R] R) :
    extendFunction (restrictFunction T) = T := by
  apply LinearMap.ext
  intro x
  induction x using MonoidAlgebra.induction_on with
  | of γ => exact extend_basis (restrictFunction T) γ
  | add x y hx hy => simp only [map_add, hx, hy]
  | smul a x hx => simp only [map_smul, hx]

-- trace_linear_extension: this is the linear adapter, not a multiplicative map.
example (τ : Γ → R) (γ δ : Γ) :
    extendFunction τ (2 • MonoidAlgebra.of R Γ γ - MonoidAlgebra.of R Γ δ) =
      2 * τ γ - τ δ := by
  simp only [map_sub, two_nsmul, map_add, extend_basis, two_mul]

-- Normalization on the actual group-algebra unit.
example {r : ℕ} (τ : GroupTraceShadow Γ R r) : extendFunction τ 1 = r := by
  simpa only [map_one] using (extend_basis (τ : Γ → R) 1).trans τ.normalized

-- A linear extension of a general function need not preserve the algebra product.
-- The constant function two already detects this on the algebra unit: 2 ≠ 2².
-- trace_extension_not_multiplicative
example : extendFunction (fun _ : Unit => (2 : ℚ)) (1 * 1) ≠
    extendFunction (fun _ : Unit => (2 : ℚ)) 1 *
      extendFunction (fun _ : Unit => (2 : ℚ)) 1 := by
  have hu : extendFunction (fun _ : Unit => (2 : ℚ)) 1 = 2 := by
    simpa only [map_one] using extend_basis (fun _ : Unit => (2 : ℚ)) 1
  rw [one_mul, hu]
  norm_num
end GroupTraceAdapter
end Trace

section WeilDeligneGL
variable {W : Type u} [Group W] [TopologicalSpace W]
  {K : Type v} [Field K] [TopologicalSpace K] [DiscreteTopology K] (n : ℕ)

/-- Split GL_n prototype. The source's general dual group and finite-Q action
remain absent rather than being encoded by unverified fields. With geometric
degree, norm(σ) = q⁻¹ for σ⁻¹ τ σ = τ^q; arithmetic Frobenius has norm q. -/
structure WeilDeligneParameter (norm : W →* Kˣ) where
  cocycle : W →* (Matrix (Fin n) (Fin n) K)ˣ
  continuous : Continuous (fun w => (cocycle w : Matrix (Fin n) (Fin n) K))
  monodromy : Matrix (Fin n) (Fin n) K
  nilpotent : IsNilpotent monodromy
  scales : ∀ w, (cocycle w : Matrix (Fin n) (Fin n) K) * monodromy *
    ((cocycle w)⁻¹).val = (norm w : K) • monodromy

namespace WeilDeligneParameter
@[ext] theorem ext {norm : W →* Kˣ} {φ ψ : WeilDeligneParameter n norm}
    (hφ : φ.cocycle = ψ.cocycle) (hN : φ.monodromy = ψ.monodromy) :
    φ = ψ := by sorry

noncomputable def zeroMonodromy (norm : W →* Kˣ)
    (ρ : W →* (Matrix (Fin n) (Fin n) K)ˣ)
    (hρ : Continuous (fun w => (ρ w : Matrix (Fin n) (Fin n) K))) :
    WeilDeligneParameter n norm := by sorry

noncomputable def gauge (norm : W →* Kˣ) (φ : WeilDeligneParameter n norm)
    (g : (Matrix (Fin n) (Fin n) K)ˣ) : WeilDeligneParameter n norm := by sorry

theorem gauge_monodromy (norm : W →* Kˣ) (φ : WeilDeligneParameter n norm)
    (g : (Matrix (Fin n) (Fin n) K)ˣ) :
    (gauge n norm φ g).monodromy = g.val * φ.monodromy * (g⁻¹).val := by sorry

theorem gauge_cocycle (norm : W →* Kˣ) (φ : WeilDeligneParameter n norm)
    (g : (Matrix (Fin n) (Fin n) K)ˣ) (w : W) :
    (gauge n norm φ g).cocycle w = g * φ.cocycle w * g⁻¹ := by sorry

-- WD_gauge: the zero-monodromy portion of the full equality test.
example (norm : W →* Kˣ) (ρ : W →* (Matrix (Fin n) (Fin n) K)ˣ)
    (hρ : Continuous (fun w => (ρ w : Matrix (Fin n) (Fin n) K)))
    (g : (Matrix (Fin n) (Fin n) K)ˣ) :
    (gauge n norm (zeroMonodromy n norm ρ hρ) g).monodromy = 0 := by sorry

-- WD_unramified (the zero-monodromy construction works for every discrete continuous ρ).
example (norm : W →* Kˣ) (ρ : W →* (Matrix (Fin n) (Fin n) K)ˣ)
    (hρ : Continuous (fun w => (ρ w : Matrix (Fin n) (Fin n) K))) :
    (zeroMonodromy n norm ρ hρ).monodromy = 0 := by sorry

-- WD_torus, for GL_1.
example (norm : W →* Kˣ) (φ : WeilDeligneParameter 1 norm) : φ.monodromy = 0 := by sorry
end WeilDeligneParameter

-- WD_geometric_frobenius: the matrix computation fixing the scaling convention
-- for q = 3 and N = E₁₂. The full Weil-group/logarithm comparison remains omitted.
example :
    let N : Matrix (Fin 2) (Fin 2) ℚ := fun i j => if i = 0 ∧ j = 1 then 1 else 0
    let F := Matrix.diagonal (fun i : Fin 2 => if i = 0 then (1 / 3 : ℚ) else 1)
    let FInv := Matrix.diagonal (fun i : Fin 2 => if i = 0 then (3 : ℚ) else 1)
    F * N * FInv = (1 / 3 : ℚ) • N := by sorry
end WeilDeligneGL

section DualGL
/-- GL_n trace-pairing shadow of the dual nullcone, not a definition for every H. -/
def dualNilpotentCone (n : ℕ) (K : Type u) [Field K] :
    Set (Matrix (Fin n) (Fin n) K) := {N | IsNilpotent N}

def NilpotentSingularSupport {n : ℕ} {K : Type u} [Field K]
    (support : Set (Matrix (Fin n) (Fin n) K)) : Prop := support ⊆ dualNilpotentCone n K

example {n : ℕ} {K : Type u} [Field K] :
    NilpotentSingularSupport ({0} : Set (Matrix (Fin n) (Fin n) K)) := by sorry
end DualGL

section FixedGroupChecks
variable {G : Type u} [Group G]

-- Cyclic fixed-locus point-group compatibility, using the existing Tau Ceti carrier.
example (θ : G ≃* G) (g : G) :
    g ∈ TauCeti.fixedSubgroup θ.toMonoidHom ↔ θ g = g := by sorry

example : TauCeti.fixedSubgroup (MonoidHom.id G) = ⊤ := by sorry
end FixedGroupChecks

end TauCeti.LanglandsParameterStacks
