/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/BunGAndNewtonStrata.md is definitive. These statements
suggest Lean forms so that contributors and reviewers converge on names and
signatures. They claim no implementation; implementationStatus stays unchecked.
Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.
Individual Mathlib and TauCeti modules are imported at the recorded pins.

Every node of the packet has a typed declaration here under the name the packet gives it, and
every API item and unit test of the packet appears as a declaration or as a named `example`.
The first half keeps the native algebraic cores (twisted conjugacy, the representative groupoid,
the centralizer functor on coefficient algebras, the trivialized Frobenius tensor family with its
Tannakian reconstruction, integral Kottwitz descent, GL_n slope data and the slope protorus).

Objects owned by other roadmaps enter as named parameters, as in the accepted DiamondsAndVStacks
suggested file: `LocalDatum` (RG2.1.5 π₁ and κ̃, the RG2.4 based root datum, VB0 slope
morphisms), `ExactTensorCat` and `CurveSite` (D1–D2 perfectoid site, RF2/VB1 curve bundles and
the isocrystal-to-bundle functor, VB2/VB4 slopes), `StackGeometry` (D0/D3/D4/D5 stack operations
and predicates, VS0 Artin and cohomological smoothness), `SlopeFiltrations` (VB4),
`GrassmannianInterface` (GS0/RF4), `EtaleSites` (D2/D6/RF2, ET.0, C1) and the torsor interfaces
(R09.3/D3). Each field names its owner; BG plans none of them. Statements involving these fields
are asserted for the owners' instantiations. BG's own notions (B(G), N(G), κ, ν, μ♯, μ◇, basic
classes, the Newton order, B(G,{μ}), ordinary classes, decency, defect, G-bundles, G-isocrystals,
the points of Bun_G, the Newton topology, strata, HN-graded bundles, filtered automorphism groups,
full automorphism groups, charts and flag strata) have real bodies over these parameters wherever
their definition is not itself a stack-level construction; prestack-valued constructions
(`Bun.stack`, `BunContext.substack`, `HNGraded.stack`, `FullAutomorphism.stack`, the chart
stacks) are typed with admitted bodies, and their objects are described by API theorems.
All theorem and example proofs are sorry; elaboration checks types, not proofs.
-/
import Mathlib.Algebra.Group.Subgroup.Basic
import Mathlib.Algebra.Group.Equiv.Defs
import Mathlib.Data.Rat.BigOperators
import Mathlib.Data.ZMod.Basic
import Mathlib.RepresentationTheory.Coinvariants
import Mathlib.Data.Fin.Tuple.Basic
import Mathlib.Topology.Defs.Filter
import Mathlib.CategoryTheory.Linear.LinearFunctor
import Mathlib.CategoryTheory.Monoidal.Braided.Basic
import Mathlib.CategoryTheory.Monoidal.NaturalTransformation
import TauCeti.CategoryTheory.Exact.Functor
import TauCeti.Algebra.AlgebraicGroup.Representation.Comodule.Monoidal
import TauCeti.Algebra.AlgebraicGroup.Representation.Tannaka.Equivalence
import Mathlib.RingTheory.WittVector.Isocrystal
import Mathlib.CategoryTheory.Groupoid.Basic
import Mathlib.CategoryTheory.Endomorphism
import TauCeti.Algebra.AlgebraicGroup.MultiplicativeGroup.Basic
import TauCeti.Algebra.AlgebraicGroup.PointsFunctor
import TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Weight
import TauCeti.Algebra.Bialgebra.MonoidAlgebra.GroupLike
import Mathlib.Algebra.Category.CommHopfAlgCat
import Mathlib.RingTheory.TensorProduct.Maps
import Mathlib.CategoryTheory.Sites.Descent.IsStack
import Mathlib.CategoryTheory.Bicategory.Functor.Pseudofunctor
import Mathlib.CategoryTheory.Bicategory.FunctorBicategory.Pseudo
import Mathlib.Topology.Category.TopCat.Basic
import Mathlib.Topology.Connected.Clopen
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.Data.Finsupp.Basic
import Mathlib.Algebra.Group.End
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.Topology.Order.UpperLowerSetTopology
import Mathlib.Topology.Semicontinuity.Basic
import Mathlib.Topology.LocallyConstant.Basic
import Mathlib.Topology.KrullDimension
import Mathlib.Topology.Inseparable


noncomputable section
namespace TauCeti.BunG
universe u v w
section TwistedGroup
variable {G : Type u} [Group G]

/-- Actual pointwise twisted conjugation. -/
def twistedConjugate (sigma : G ≃* G) (g b : G) : G := g * b * (sigma g)⁻¹

def sigmaRelation (sigma : G ≃* G) (b c : G) : Prop :=
  ∃ g : G, c = twistedConjugate sigma g b

def sigmaSetoid (sigma : G ≃* G) : Setoid G where
  r := sigmaRelation sigma
  iseqv := by sorry

/-- Generic quotient core; the local coefficient group is a supplier input. -/
def SigmaClass (sigma : G ≃* G) := Quotient (sigmaSetoid sigma)
namespace SigmaClass

def mk (sigma : G ≃* G) (b : G) : SigmaClass sigma :=
  Quotient.mk (sigmaSetoid sigma) b

theorem mk_eq_iff (sigma : G ≃* G) (b c : G) :
    mk sigma b = mk sigma c ↔ ∃ g, c = g * b * (sigma g)⁻¹ := by sorry

def map {H : Type v} [Group H] (sigma : G ≃* G) (tau : H ≃* H)
    (f : G →* H) (h : ∀ g, f (sigma g) = tau (f g)) :
    SigmaClass sigma → SigmaClass tau :=
  Quotient.lift (fun b => mk tau (f b)) (by sorry)

theorem map_mk {H : Type v} [Group H] (sigma : G ≃* G) (tau : H ≃* H)
    (f : G →* H) (h : ∀ g, f (sigma g) = tau (f g)) (b : G) :
    map sigma tau f h (mk sigma b) = mk tau (f b) := by sorry

theorem map_id (sigma : G ≃* G) :
    map sigma sigma (MonoidHom.id G) (fun _ => rfl) = id := by sorry

theorem map_comp {H : Type v} [Group H] {K : Type w} [Group K]
    (sigma : G ≃* G) (tau : H ≃* H) (upsilon : K ≃* K)
    (f : G →* H) (g : H →* K)
    (hf : ∀ x, f (sigma x) = tau (f x))
    (hg : ∀ x, g (tau x) = upsilon (g x)) :
    map sigma upsilon (g.comp f) (fun x => by simp only [MonoidHom.comp_apply,
      hf, hg]) = map tau upsilon g hg ∘ map sigma tau f hf := by sorry

def lift {A : Type v} (sigma : G ≃* G) (f : G → A)
    (h : ∀ g b, f (g * b * (sigma g)⁻¹) = f b) : SigmaClass sigma → A :=
  Quotient.lift f (by sorry)

theorem lift_mk {A : Type v} (sigma : G ≃* G) (f : G → A)
    (h : ∀ g b, f (g * b * (sigma g)⁻¹) = f b) (b : G) :
    lift sigma f h (mk sigma b) = f b := by sorry

theorem lift_unique {A : Type v} (sigma : G ≃* G) (f : G → A)
    (h : ∀ g b, f (g * b * (sigma g)⁻¹) = f b)
    (F : SigmaClass sigma → A) (hF : ∀ b, F (mk sigma b) = f b) :
    F = lift sigma f h := by sorry

-- TauCeti.BunG.SigmaClass.testIdentitySigma
example (b c : G) : mk (MulEquiv.refl G) b = mk (MulEquiv.refl G) c ↔
    ∃ g, c = g * b * g⁻¹ := by sorry
-- TauCeti.BunG.SigmaClass.testCommutative: the pointwise core.
example {A : Type u} [CommGroup A] (sigma : A ≃* A) (b c : A) :
    mk sigma b = mk sigma c ↔ ∃ g, c = b * (g * (sigma g)⁻¹) := by sorry
example {A : Type u} [CommGroup A] (b c : A) :
    mk (MulEquiv.refl A) b = mk (MulEquiv.refl A) c ↔ b = c := by sorry
end SigmaClass

namespace SigmaCentralizer
/-- Point subgroup only, without an asserted group-scheme representation. -/
def points (sigma : G ≃* G) (b : G) : Subgroup G where
  carrier := {g | g * b = b * sigma g}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

theorem mem_points (sigma : G ≃* G) (b g : G) :
    g ∈ points sigma b ↔ g * b = b * sigma g := by sorry

theorem conjugate_points (sigma : G ≃* G) (b g h : G) :
    h ∈ points sigma b ↔
    g * h * g⁻¹ ∈ points sigma (twistedConjugate sigma g b) := by sorry

/-- Conjugacy transport of the actual point subgroups. The E-group-scheme
isomorphism still needs the descent and representability suppliers. -/
def conjugateEquiv (sigma : G ≃* G) (b g : G) :
    points sigma b ≃* points sigma (twistedConjugate sigma g b) where
  toFun h := ⟨g * h * g⁻¹, by sorry⟩
  invFun h := ⟨g⁻¹ * h * g, by sorry⟩
  left_inv := by sorry
  right_inv := by sorry
  map_mul' := by sorry

theorem conjugateEquiv_apply (sigma : G ≃* G) (b g : G) (h : points sigma b) :
    (conjugateEquiv sigma b g h : G) = g * h * g⁻¹ := by sorry

-- TauCeti.BunG.SigmaCentralizer.testTrivial: its fixed-point core.
example (sigma : G ≃* G) (g : G) :
    g ∈ points sigma 1 ↔ sigma g = g := by sorry
example : points (MulEquiv.refl G) (1 : G) = ⊤ := by sorry
end SigmaCentralizer

/-- Ordered product of exactly r Frobenius translates, not b^r. -/
def frobeniusNorm (sigma : G ≃* G) (b : G) : ℕ → G
  | 0 => 1
  | r + 1 => frobeniusNorm sigma b r * ((sigma : G → G)^[r]) b

/-- Positive-period equation core of decency. The actual Newton-integrality
condition is part of `DecentRepresentative` over the local datum below. -/
def decencyEquation (sigma : G ≃* G) (b a : G) (r : ℕ) : Prop :=
  0 < r ∧ frobeniusNorm sigma b r = a

theorem frobeniusNorm_one (sigma : G ≃* G) (b : G) :
    frobeniusNorm sigma b 1 = b := by sorry

theorem frobeniusNorm_two (sigma : G ≃* G) (b : G) :
    frobeniusNorm sigma b 2 = b * sigma b := by sorry

theorem frobeniusNorm_three (sigma : G ≃* G) (b : G) :
    frobeniusNorm sigma b 3 = b * sigma b * sigma (sigma b) := by sorry

theorem frobeniusNorm_add (sigma : G ≃* G) (b : G) (r s : ℕ) :
    frobeniusNorm sigma b (r + s) = frobeniusNorm sigma b r *
      ((sigma : G → G)^[r]) (frobeniusNorm sigma b s) := by sorry

theorem frobeniusNorm_twistedConjugate (sigma : G ≃* G) (b g : G) (r : ℕ) :
    frobeniusNorm sigma (twistedConjugate sigma g b) r =
      g * frobeniusNorm sigma b r * (((sigma : G → G)^[r]) g)⁻¹ := by sorry

/-- Iterating the stabilizer equation only gives the norm centralizer once
Frobenius has period r. No equality with the Newton Levi is asserted. -/
theorem centralizes_norm_of_period (sigma : G ≃* G) (b h : G) (r : ℕ)
    (hh : h ∈ SigmaCentralizer.points sigma b)
    (hr : ((sigma : G → G)^[r]) h = h) :
    h * frobeniusNorm sigma b r = frobeniusNorm sigma b r * h := by sorry

example (sigma : G ≃* G) (b g : G) :
    frobeniusNorm sigma (twistedConjugate sigma g b) 2 =
      g * (b * sigma b) * (sigma (sigma g))⁻¹ := by sorry

-- TauCeti.BunG.DecentRepresentative.testRankOne: one-factor equation core.
example (sigma : G ≃* G) (b : G) : decencyEquation sigma b b 1 := by sorry
-- TauCeti.BunG.DecentRepresentative.testUnit: group equation core.
example (sigma : G ≃* G) : decencyEquation sigma (1 : G) 1 1 := by sorry
-- TauCeti.BunG.DecentRepresentative.testPositivePeriod
example (sigma : G ≃* G) (b a : G) : ¬ decencyEquation sigma b a 0 := by sorry
end TwistedGroup

section DifferenceFibre
variable {A : Type u} [AddCommGroup A]
/-- An actual affine solution set, without an origin chosen. -/
def ComponentCoset (sigma : A ≃+ A) (difference : A) : Set A :=
  {x | sigma x - x = difference}
namespace ComponentCoset

theorem mem_iff (sigma : A ≃+ A) (difference x : A) :
    x ∈ ComponentCoset sigma difference ↔ sigma x - x = difference := by sorry

theorem nonempty (sigma : A ≃+ A) (difference : A) :
    (ComponentCoset sigma difference).Nonempty ↔
    difference ∈ Set.range (fun x => sigma x - x) := by sorry

theorem translate (sigma : A ≃+ A) (difference x y : A)
    (hx : x ∈ ComponentCoset sigma difference) (hy : sigma y = y) :
    x + y ∈ ComponentCoset sigma difference := by sorry

theorem difference_fixed (sigma : A ≃+ A) (difference x y : A)
    (hx : x ∈ ComponentCoset sigma difference)
    (hy : y ∈ ComponentCoset sigma difference) : sigma (y - x) = y - x := by sorry

/-- The additive kernel is an actual subgroup, retaining integral torsion. -/
def fixedSubgroup (sigma : A ≃+ A) : AddSubgroup A where
  carrier := {x | sigma x = x}
  zero_mem' := by sorry
  add_mem' := by sorry
  neg_mem' := by sorry

/-- A chosen solution trivializes the affine fibre; the fibre itself carries
no chosen origin. This is a set equivalence, not an additive-group structure. -/
def equivFixed (sigma : A ≃+ A) (difference x : A)
    (hx : x ∈ ComponentCoset sigma difference) :
    fixedSubgroup sigma ≃ ComponentCoset sigma difference where
  toFun y := ⟨x + y, by sorry⟩
  invFun y := ⟨y - x, by sorry⟩
  left_inv := by sorry
  right_inv := by sorry

theorem equivFixed_apply (sigma : A ≃+ A) (difference x : A)
    (hx : x ∈ ComponentCoset sigma difference) (y : fixedSubgroup sigma) :
    (equivFixed sigma difference x hx y : A) = x + y := by sorry

-- TauCeti.BunG.ComponentCoset.testIdentity
example : ComponentCoset (AddEquiv.refl ℤ) 0 = Set.univ := by sorry
example (difference : ℤ) (h : difference ≠ 0) :
    ComponentCoset (AddEquiv.refl ℤ) difference = ∅ := by sorry

def negation : ℤ ≃+ ℤ where
  toFun := fun x => -x
  invFun := fun x => -x
  left_inv := by sorry
  right_inv := by sorry
  map_add' := by sorry
-- TauCeti.BunG.ComponentCoset.testSign
example : ComponentCoset negation 2 = {(-1 : ℤ)} := by sorry
-- TauCeti.BunG.ComponentCoset.testParity
example : ComponentCoset negation 1 = ∅ := by sorry
end ComponentCoset
end DifferenceFibre

/-! Finite GL_n slope data, including the actual denominator multiplicities.
Integral total by itself would incorrectly allow single half-integral slopes.
The structure is numerical data, not a claimed realization functor. -/
structure GLnSlopeData (n : ℕ) where
  slopes : Fin n → ℚ
  descending : Antitone slopes
  kottwitz : ℤ
  total_eq : (∑ i, slopes i) = (kottwitz : ℚ)
  denominatorMultiplicity : ∀ i, (slopes i).den ∣
    (Finset.univ.filter (fun j => slopes j = slopes i)).card

namespace GLnSlopeData

def dominance {n : ℕ} (x y : GLnSlopeData n) : Prop :=
  x.kottwitz = y.kottwitz ∧ ∀ k : ℕ, k ≤ n →
    (∑ i : Fin n, if i.val < k then x.slopes i else 0) ≤
    (∑ i : Fin n, if i.val < k then y.slopes i else 0)

def basic {n : ℕ} (x : GLnSlopeData n) : Prop := ∀ i j, x.slopes i = x.slopes j

def acceptable {n : ℕ} (x mu : GLnSlopeData n) : Prop := dominance x mu

def ordinary {n : ℕ} (x mu : GLnSlopeData n) : Prop :=
  acceptable x mu ∧ x.slopes = mu.slopes

def half : GLnSlopeData 2 where
  slopes := fun _ => 1/2
  descending := by sorry
  kottwitz := 1
  total_eq := by sorry
  denominatorMultiplicity := by sorry

def split : GLnSlopeData 2 where
  slopes := fun i => if i = 0 then 1 else 0
  descending := by sorry
  kottwitz := 1
  total_eq := by sorry
  denominatorMultiplicity := by sorry

def zero (n : ℕ) : GLnSlopeData n where
  slopes := fun _ => 0
  descending := by sorry
  kottwitz := 0
  total_eq := by sorry
  denominatorMultiplicity := by sorry

theorem dominance_antisymm {n : ℕ} (x y : GLnSlopeData n)
    (hxy : dominance x y) (hyx : dominance y x) : x = y := by sorry
-- TauCeti.BunG.NewtonOrder.testGL2: finite-slope core.
example : dominance half split := by sorry
-- TauCeti.BunG.Basic.testGL2Half
example : basic half := by sorry
-- TauCeti.BunG.Basic.testNonbasic
example : ¬ basic split := by sorry
-- TauCeti.BunG.Acceptable.testGL2
example : acceptable half split ∧ acceptable split split := by sorry
-- TauCeti.BunG.Ordinary.testGL2
example : ordinary split split ∧ ¬ ordinary half split := by sorry
example : basic (zero 0) := by sorry
example : ¬ ∃ x : GLnSlopeData 1, x.slopes 0 = (1/2 : ℚ) := by sorry
end GLnSlopeData

/-! Invariant-value core of the quadratic norm-one torus example. The local
identification with B(T) is `TorusNormDescription` over the local datum below. -/
namespace TorsionExample

def newton (_ : ZMod 2) : ℚ := 0

def kottwitz (x : ZMod 2) : ZMod 2 := x

def le (x y : ZMod 2) : Prop := kottwitz x = kottwitz y ∧ newton x ≤ newton y
-- TauCeti.BunG.Invariants.testTorsion
example : newton 0 = newton 1 ∧ kottwitz 0 ≠ kottwitz 1 := by sorry
-- TauCeti.BunG.NewtonOrder.testTorsion
example : ¬ le 0 1 ∧ ¬ le 1 0 := by sorry
-- TauCeti.BunG.Acceptable.testTorsion
example : {x : ZMod 2 | kottwitz x = 1 ∧ newton x ≤ 0} = {1} := by sorry
-- Rational averaging core of the norm-one torus.
example (q : ℚ) : (q + (-q)) / 2 = 0 := by sorry
end TorsionExample

/-- Rank correction core; `Defect.value` below uses the local datum's split ranks. -/
def rankDefect (rankG rankJ : ℕ) : ℤ := (rankG : ℤ) - (rankJ : ℤ)
-- TauCeti.BunG.Defect.testUnit
example (n : ℕ) : rankDefect n n = 0 := by sorry
-- TauCeti.BunG.Defect.testHalf
example : rankDefect 2 1 = 1 := by sorry
-- TauCeti.BunG.Defect.testSplitNonbasic
example : rankDefect 2 2 = 0 := by sorry
-- The rank-one isocrystal-to-bundle sign core.
example (m : ℤ) : -((-m : ℤ)) = m := by sorry
-- Standard library specialization orientation: x generalizes to y.
example {X : Type u} [TopologicalSpace X] (x : X) : Specializes x x := by sorry
end TauCeti.BunG

/- Independent review: rational arithmetic checks for the division-algebra
sign correction. These are neither Brauer-group nor Morita signatures. -/
namespace TauCeti.BunG
example : (-(1 / 3 : ℚ)) + 1 = (2 / 3 : ℚ) := by sorry
example : ¬ ∃ z : ℤ, (-(1 / 3 : ℚ)) = (1 / 3 : ℚ) + (z : ℚ) := by sorry
example : ∃ z : ℤ, (-(1 / 2 : ℚ)) = (1 / 2 : ℚ) + (z : ℚ) := by sorry
end TauCeti.BunG

/- Native categorical consumer interface. Source categories and their exact
structures are specified inputs; `ExactTensorCat` and `CurveSite` below instantiate them. -/
noncomputable section
namespace TauCeti.BunG.TensorInterface
open CategoryTheory CategoryTheory.Limits MonoidalCategory
universe u₁ u₂ u₃ v₁ v₂ v₃
variable (E : Type*) [Field E]
variable (C : Type u₁) [Category.{v₁} C] [Preadditive C] [Linear E C]
  [MonoidalCategory C] [SymmetricCategory C] [HasZeroObject C] [HasBinaryBiproducts C]
variable (D : Type u₂) [Category.{v₂} D] [Preadditive D] [Linear E D]
  [MonoidalCategory D] [SymmetricCategory D] [HasZeroObject D] [HasBinaryBiproducts D]

/-- Consumer data over specified categories and specified Quillen exact structures.
This does not manufacture an analytic bundle category or its exact structure. -/
structure Data (sourceExact : TauCeti.ExactStructure C)
    (targetExact : TauCeti.ExactStructure D) where
  functor : C ⥤ D
  [additive : functor.Additive]
  [linear : functor.Linear E]
  [symmetricTensor : functor.Braided]
  exact : sourceExact.IsConflationExact targetExact functor

attribute [instance] Data.additive Data.linear Data.symmetricTensor

variable {E C D}
variable {EC : TauCeti.ExactStructure C} {ED : TauCeti.ExactStructure D}

/-- The arrows retain monoidal compatibility, in addition to natural invertibility. -/
structure Iso (F G : Data E C D EC ED) where
  iso : F.functor ≅ G.functor
  [monoidal : iso.hom.IsMonoidal]

attribute [instance] Iso.monoidal

namespace Data

def evaluate (F : Data E C D EC ED) (V : C) : D := F.functor.obj V

def unitIso (F : Data E C D EC ED) : 𝟙_ D ≅ F.evaluate (𝟙_ C) :=
  Functor.Monoidal.εIso F.functor

def tensorIso (F : Data E C D EC ED) (V W : C) :
    F.evaluate V ⊗ F.evaluate W ≅ F.evaluate (V ⊗ W) :=
  Functor.Monoidal.μIso F.functor V W

theorem map_conflation (F : Data E C D EC ED) (S : ShortComplex C)
    (hS : EC.Conflation S) : ED.Conflation (S.map F.functor) := by sorry

/-- The original exact structure is retained on both sides. -/
def identity (EC : TauCeti.ExactStructure C) : Data E C C EC EC where
  functor := 𝟭 C
  exact := by sorry

variable {K : Type u₃} [Category.{v₃} K] [Preadditive K] [Linear E K]
  [MonoidalCategory K] [SymmetricCategory K] [HasZeroObject K] [HasBinaryBiproducts K]
  {EK : TauCeti.ExactStructure K}

/-- Genuine postcomposition, used for the isocrystal-to-bundle functor,
forgetful functors and pullback once their owners supply these inputs. -/
def postcompose (F : Data E C D EC ED) (P : Data E D K ED EK) :
    Data E C K EC EK where
  functor := F.functor ⋙ P.functor
  exact := by sorry

theorem postcompose_evaluate (F : Data E C D EC ED) (P : Data E D K ED EK) (V : C) :
    (F.postcompose P).evaluate V = P.evaluate (F.evaluate V) := by sorry

def postcompose_identity (F : Data E C D EC ED) :
    Iso (F.postcompose (identity ED)) F := by sorry

def identity_postcompose (F : Data E C D EC ED) :
    Iso ((identity EC).postcompose F) F := by sorry

variable {T : Type*} [Category T] [Preadditive T] [Linear E T]
  [MonoidalCategory T] [SymmetricCategory T] [HasZeroObject T] [HasBinaryBiproducts T]
  {ET : TauCeti.ExactStructure T}

def postcompose_assoc (F : Data E C D EC ED) (P : Data E D K ED EK)
    (Q : Data E K T EK ET) :
    Iso ((F.postcompose P).postcompose Q) (F.postcompose (P.postcompose Q)) := by sorry

-- Unit, symmetry, exactness and tensor compatibility are typed conditions.
-- These category-level controls do not replace the roadmap's GL_1 and
-- analytic reconstruction examples, which need the actual supplier categories.
example (F : Data E C D EC ED) : IsIso (F.unitIso.hom) := by sorry
example (F : Data E C D EC ED) (V W : C) : IsIso ((F.tensorIso V W).hom) := by sorry
example (F : Data E C D EC ED) (S : ShortComplex C) (hS : EC.Conflation S) :
    ED.Conflation (S.map F.functor) := by sorry
example (F : Data E C D EC ED) (hunit : ¬ IsZero (𝟙_ D)) :
    ¬ IsZero (F.evaluate (𝟙_ C)) := by sorry
end Data

namespace Iso

def refl (F : Data E C D EC ED) : Iso F F := by sorry

def symm {F G : Data E C D EC ED} (α : Iso F G) : Iso G F := by sorry

def trans {F G H : Data E C D EC ED} (α : Iso F G) (β : Iso G H) : Iso F H := by sorry

theorem ext {F G : Data E C D EC ED} (α β : Iso F G)
    (h : ∀ V, α.iso.hom.app V = β.iso.hom.app V) : α = β := by sorry

example {F G : Data E C D EC ED} (α : Iso F G) (V : C) :
    α.iso.hom.app V ≫ α.iso.inv.app V = 𝟙 (F.evaluate V) := by sorry
example {F G : Data E C D EC ED} (α : Iso F G) (V W : C) :
    (F.tensorIso V W).hom ≫ α.iso.hom.app (V ⊗ W) =
      (α.iso.hom.app V ⊗ₘ α.iso.hom.app W) ≫ (G.tensorIso V W).hom := by sorry
end Iso
end TauCeti.BunG.TensorInterface


noncomputable section
open CategoryTheory WithConv
open scoped TensorProduct LaurentPolynomial
namespace TauCeti.BunG
variable (E H L : Type u) [Field E] [CommRing H] [HopfAlgebra E H]
  [CommRing L] [Algebra E L]

/-- The algebraic group of points is the native convolution group. -/
abbrev AffinePoints := WithConv (H →ₐ[E] L)

/-- Frobenius is postcomposition on actual algebraic-group points. -/
def pointsFrobenius (sigma : L ≃ₐ[E] L) :
    AffinePoints E H L ≃* AffinePoints E H L where
  toFun := TauCeti.AlgHom.mapValue sigma.toAlgHom
  invFun := TauCeti.AlgHom.mapValue sigma.symm.toAlgHom
  left_inv := by sorry
  right_inv := by sorry
  map_mul' := by sorry

theorem pointsFrobenius_apply (sigma : L ≃ₐ[E] L)
    (b : AffinePoints E H L) (h : H) :
    (pointsFrobenius E H L sigma b).ofConv h = sigma (b.ofConv h) := by sorry

/-- The coefficient Frobenius acts on units, including in the Witt specialization. -/
def unitFrobenius {K : Type u} [CommRing K] (sigma : K ≃+* K) : Kˣ ≃* Kˣ where
  toFun := Units.map sigma.toMonoidHom
  invFun := Units.map sigma.symm.toMonoidHom
  left_inv := by sorry
  right_inv := by sorry
  map_mul' := by sorry

theorem gmFrobenius_natural (sigma : L ≃ₐ[E] L)
    (b : AffinePoints E E[T;T⁻¹] L) :
    TauCeti.MultiplicativeGroup.pointsMulEquiv (R := E) (A := L)
      (pointsFrobenius E E[T;T⁻¹] L sigma b) =
    unitFrobenius sigma.toRingEquiv
      (TauCeti.MultiplicativeGroup.pointsMulEquiv (R := E) (A := L) b) := by sorry

section CentralizerFunctor
variable (sigma : L ≃ₐ[E] L) (b : AffinePoints E H L)

/-- The coefficient tensor algebra for the full sigma-centralizer functor. -/
abbrev PointCoefficients (A : CommAlgCat.{u} E) := A ⊗[E] L

/-- Frobenius fixes the variable E-algebra, acting only on L. -/
def coefficientFrobenius (A : CommAlgCat.{u} E) :
    PointCoefficients E L A ≃ₐ[E] PointCoefficients E L A :=
  Algebra.TensorProduct.congr (AlgEquiv.refl : A ≃ₐ[E] A) sigma

/-- The representative is sent into the right tensor factor. -/
def coefficientRepresentative (A : CommAlgCat.{u} E) :
    WithConv (H →ₐ[E] PointCoefficients E L A) :=
  TauCeti.AlgHom.mapValue Algebra.TensorProduct.includeRight b

/-- Exact point equation; it does not assert represented descent by itself. -/
def centralizerPoints (A : CommAlgCat.{u} E) :
    Subgroup (WithConv (H →ₐ[E] PointCoefficients E L A)) where
  carrier := {g | g * coefficientRepresentative E H L b A =
    coefficientRepresentative E H L b A *
      pointsFrobenius E H (PointCoefficients E L A)
        (coefficientFrobenius E L sigma A) g}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- Functoriality on all E-algebras retains the tensor coefficient algebra. -/
def centralizerMap {A B : CommAlgCat.{u} E} (f : A ⟶ B) :
    centralizerPoints E H L sigma b A →* centralizerPoints E H L sigma b B where
  toFun g := ⟨TauCeti.AlgHom.mapValue
    (Algebra.TensorProduct.map f.hom (AlgHom.id E L)) g.val, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry

def centralizerFunctor : CommAlgCat.{u} E ⥤ GrpCat.{u} where
  obj A := GrpCat.of (centralizerPoints E H L sigma b A)
  map f := GrpCat.ofHom (centralizerMap E H L sigma b f)
  map_id := by sorry
  map_comp := by sorry

theorem centralizerMap_apply {A B : CommAlgCat.{u} E} (f : A ⟶ B)
    (g : centralizerPoints E H L sigma b A) (h : H) :
    (centralizerMap E H L sigma b f g).val.ofConv h =
      Algebra.TensorProduct.map f.hom (AlgHom.id E L) (g.val.ofConv h) := by sorry

/-- A representative change conjugates the whole group-valued functor. -/
def centralizerConjugacy (g : AffinePoints E H L) :
    centralizerFunctor E H L sigma b ≅
      centralizerFunctor E H L sigma
        (g * b * (pointsFrobenius E H L sigma g)⁻¹) := by sorry

-- The variable algebra is A, not a single copy of E.
example (A : CommAlgCat.{u} E) (g : centralizerPoints E H L sigma b A) :
    g.val * coefficientRepresentative E H L b A =
      coefficientRepresentative E H L b A *
        pointsFrobenius E H (PointCoefficients E L A)
          (coefficientFrobenius E L sigma A) g.val := by sorry

-- For b=1 the point functor is the sigma-fixed subgroup.
example (A : CommAlgCat.{u} E)
    (g : WithConv (H →ₐ[E] PointCoefficients E L A)) :
    g ∈ centralizerPoints E H L sigma 1 A ↔
      pointsFrobenius E H (PointCoefficients E L A)
        (coefficientFrobenius E L sigma A) g = g := by sorry

-- An identity Frobenius would leave the entire coefficient point group fixed.
example (A : CommAlgCat.{u} E) :
    centralizerPoints E H L (AlgEquiv.refl) 1 A = ⊤ := by sorry
end CentralizerFunctor
end TauCeti.BunG

namespace TauCeti.BunG
open CategoryTheory

namespace SigmaClass
variable {G : Type u} [Group G] {H : Type v} [Group H]

/-- A Frobenius-compatible group equivalence descends to a quotient equivalence. -/
def equiv (sigma : G ≃* G) (tau : H ≃* H) (f : G ≃* H)
    (h : ∀ x, f (sigma x) = tau (f x)) : SigmaClass sigma ≃ SigmaClass tau where
  toFun := map sigma tau f.toMonoidHom h
  invFun := map tau sigma f.symm.toMonoidHom (by sorry)
  left_inv := by sorry
  right_inv := by sorry

theorem equiv_mk (sigma : G ≃* G) (tau : H ≃* H) (f : G ≃* H)
    (h : ∀ x, f (sigma x) = tau (f x)) (b : G) :
    equiv sigma tau f h (mk sigma b) = mk tau (f b) := by sorry

/-- Representative objects keep every conjugator, unlike the orbit set. -/
structure Representative (sigma : G ≃* G) where
  point : G

instance (sigma : G ≃* G) : Groupoid (Representative sigma) where
  Hom a b := {g : G // b.point = twistedConjugate sigma g a.point}
  id a := ⟨1, by sorry⟩
  comp f g := ⟨g.val * f.val, by sorry⟩
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry
  inv f := ⟨f.val⁻¹, by sorry⟩
  inv_comp := by sorry
  comp_inv := by sorry

abbrev representativeGroupoid (sigma : G ≃* G) := Representative sigma

/-- Nonemptiness of a Hom is the quotient equality; a Hom need not be unique. -/
theorem representative_hom_iff (sigma : G ≃* G) (b c : Representative sigma) :
    Nonempty (b ⟶ c) ↔ mk sigma b.point = mk sigma c.point := by sorry

theorem representative_comp (sigma : G ≃* G) {a b c : Representative sigma}
    (f : a ⟶ b) (g : b ⟶ c) : (f ≫ g).val = g.val * f.val := by sorry

/-- Mathlib's Aut multiplication reverses categorical composition, giving the
usual stabilizer group rather than its opposite. -/
def representativeAut (sigma : G ≃* G) (b : Representative sigma) :
    Aut b ≃* SigmaCentralizer.points sigma b.point where
  toFun f := ⟨f.hom.val, by sorry⟩
  invFun g := ⟨⟨g.val, by sorry⟩, ⟨g.val⁻¹, by sorry⟩, by sorry, by sorry⟩
  left_inv := by sorry
  right_inv := by sorry
  map_mul' := by sorry

-- TauCeti.BunG.SigmaClass.testRepresentativeHom: quotient equality preserves existence, not chosen arrows.
example (sigma : G ≃* G) (b c : Representative sigma) :
    mk sigma b.point = mk sigma c.point ↔ Nonempty (b ⟶ c) := by sorry
-- TauCeti.BunG.SigmaClass.testRepresentativeComposition: composition uses the later conjugator on the left.
example (sigma : G ≃* G) {a b c : Representative sigma}
    (f : a ⟶ b) (g : b ⟶ c) : (f ≫ g).val = g.val * f.val := by sorry
-- TauCeti.BunG.SigmaClass.testRepresentativeAutomorphisms: equal orbits do not remove the entire stabilizer.
example (b : Representative (MulEquiv.refl G)) (hb : b.point = 1) :
    Nonempty (Aut b ≃* G) := by sorry

variable (E A L : Type u) [Field E] [CommRing A] [HopfAlgebra E A]
  [CommRing L] [Algebra E L]

/-- Instantiate the quotient at the coordinate Hopf algebra's native point group. -/
abbrev affinePoints (sigma : L ≃ₐ[E] L) :=
  SigmaClass (pointsFrobenius E A L sigma)

/-- Laurent-polynomial points identify the split torus quotient with the unit quotient. -/
def gmEquiv (sigma : L ≃ₐ[E] L) :
    affinePoints E E[T;T⁻¹] L sigma ≃
      SigmaClass (unitFrobenius sigma.toRingEquiv) :=
  equiv _ _ (TauCeti.MultiplicativeGroup.pointsMulEquiv (R := E) (A := L))
    (gmFrobenius_natural E L sigma)

-- TauCeti.BunG.SigmaClass.testGmNativePoints: this uses the actual Hopf algebra of G_m.
example (sigma : L ≃ₐ[E] L) (b : AffinePoints E E[T;T⁻¹] L) :
    gmEquiv E L sigma (mk (pointsFrobenius E E[T;T⁻¹] L sigma) b) =
      mk (unitFrobenius sigma.toRingEquiv)
        (TauCeti.MultiplicativeGroup.pointsMulEquiv (R := E) (A := L) b) := by sorry
end SigmaClass

namespace SigmaCentralizer
variable (E H L : Type u) [Field E] [CommRing H] [HopfAlgebra E H]
  [CommRing L] [Algebra E L]

def functorOfPoints (sigma : L ≃ₐ[E] L) (b : AffinePoints E H L) :
    CommAlgCat.{u} E ⥤ GrpCat.{u} := centralizerFunctor E H L sigma b

def naturalConjugacy (sigma : L ≃ₐ[E] L) (b g : AffinePoints E H L) :
    functorOfPoints E H L sigma b ≅ functorOfPoints E H L sigma
      (twistedConjugate (pointsFrobenius E H L sigma) g b) :=
  centralizerConjugacy E H L sigma b g

/-- The natural transport is conjugation by the representative in the right
coefficient factor; the same g acts on both sides. -/
theorem naturalConjugacy_apply (sigma : L ≃ₐ[E] L) (b g : AffinePoints E H L)
    (A : CommAlgCat.{u} E) (h : centralizerPoints E H L sigma b A) :
    (((naturalConjugacy E H L sigma b g).hom.app A) h).val =
      coefficientRepresentative E H L g A * h.val *
        (coefficientRepresentative E H L g A)⁻¹ := by sorry

-- TauCeti.BunG.SigmaCentralizer.testCoefficientNaturality: coefficients change by f tensor id_L.
example (sigma : L ≃ₐ[E] L) (b : AffinePoints E H L)
    {A B : CommAlgCat.{u} E} (f : A ⟶ B)
    (g : centralizerPoints E H L sigma b A) (h : H) :
    (centralizerMap E H L sigma b f g).val.ofConv h =
      Algebra.TensorProduct.map f.hom (AlgHom.id E L) (g.val.ofConv h) := by sorry

-- TauCeti.BunG.SigmaCentralizer.testFixedGroup: for b=1 the functor keeps the variable coefficient algebra.
example (sigma : L ≃ₐ[E] L) (A : CommAlgCat.{u} E)
    (g : WithConv (H →ₐ[E] PointCoefficients E L A)) :
    g ∈ centralizerPoints E H L sigma 1 A ↔
      pointsFrobenius E H (PointCoefficients E L A)
        (coefficientFrobenius E L sigma A) g = g := by sorry

-- TauCeti.BunG.SigmaCentralizer.testIdentityFrobenius: this is a control, not arithmetic fixed-field descent.
example (A : CommAlgCat.{u} E) :
    centralizerPoints E H L (AlgEquiv.refl) 1 A = ⊤ := by sorry
end SigmaCentralizer

namespace SigmaClass
variable (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [IsAlgClosed k] [CharP k p]

abbrev WittField := FractionRing (WittVector p k)
abbrev wittSigma := unitFrobenius (WittVector.FractionRing.frobenius p k)

def pUnit : (WittField p k)ˣ :=
  Units.mk0 (p : WittField p k) (WittVector.FractionRing.p_nonzero p k)

/-- Concrete rank-one computation at the pinned Witt carrier. The existence
route uses the pinned Frobenius-solution theorem; uniqueness uses normalized
valuation. General E remains the local-field supplier's separate contract. -/
def wittGmSlopeEquiv : SigmaClass (wittSigma p k) ≃ ℤ := by sorry

theorem wittGmSlopeEquiv_uniformizer (m : ℤ) :
    wittGmSlopeEquiv p k (mk (wittSigma p k) (pUnit p k ^ m)) = m := by sorry

-- TauCeti.BunG.SigmaClass.testWittGL1: the quotient, Frobenius and normalization are all concrete.
example (m : ℤ) : wittGmSlopeEquiv p k
    (mk (wittSigma p k) (pUnit p k ^ m)) = m := by sorry
-- TauCeti.BunG.SigmaClass.testWittGL1Unit: the trivial rank-one object has slope zero.
example : wittGmSlopeEquiv p k (mk (wittSigma p k) 1) = 0 := by sorry
-- TauCeti.BunG.SigmaClass.testWittGL1Distinct: a unit and the uniformizer have different classes.
example : mk (wittSigma p k) 1 ≠ mk (wittSigma p k) (pUnit p k) := by sorry
end SigmaClass
end TauCeti.BunG

namespace TauCeti.BunG
open CategoryTheory
open scoped TensorProduct

/-- Coordinate Hopf algebra of the diagonalizable protorus with character group Q.
It is not bundled as finite type. -/
abbrev SlopeProtorus (E : Type u) [Field E] : CommHopfAlgCat.{max u 0} E :=
  CommHopfAlgCat.of E (MonoidAlgebra E (Multiplicative ℚ))

namespace SlopeProtorus
variable (E : Type u) [Field E]

abbrev Morphism (H : Type v) [CommRing H] [HopfAlgebra E H] :=
  H →ₐc[E] MonoidAlgebra E (Multiplicative ℚ)

variable {H : Type v} [CommRing H] [HopfAlgebra E H]
  (V : Type w) [AddCommGroup V] [Module E V] [Comodule E H V]

/-- Rational weights of a representation restricted along D -> G. -/
def weight (nu : Morphism E H) (q : ℚ) : Submodule E V :=
  TauCeti.DiagonalizableGroup.weightSpace V
    (nu : H →ₗc[E] MonoidAlgebra E (Multiplicative ℚ)) (Multiplicative.ofAdd q)

theorem mem_weight (nu : Morphism E H) (q : ℚ) (v : V) :
    v ∈ weight E V nu q ↔
      TensorProduct.map LinearMap.id
        (nu : H →ₗc[E] MonoidAlgebra E (Multiplicative ℚ)).toLinearMap
        (Comodule.coact (R := E) (C := H) (M := V) v) =
      v ⊗ₜ[E] MonoidAlgebra.single (Multiplicative.ofAdd q) (1 : E) := by sorry

theorem finite_weights [Module.Finite E V] (nu : Morphism E H) :
    {q : ℚ | weight E V nu q ≠ ⊥}.Finite := by sorry

/-- A common positive multiple clearing all weights of a finite representation. -/
def integralMultiple [Module.Finite E V] (nu : Morphism E H) :
    {n : ℕ // 0 < n ∧ ∀ q : ℚ, weight E V nu q ≠ ⊥ →
      ∃ m : ℤ, (n : ℚ) * q = (m : ℚ)} := by sorry

/-- Coordinate-side postcomposition. If f represents G -> K, its coordinates
go from O(K) to O(G), so the composite is nu.comp f. -/
def map {K : Type*} [CommRing K] [HopfAlgebra E K]
    (f : K →ₐc[E] H) (nu : Morphism E H) : Morphism E K := nu.comp f

theorem map_apply {K : Type*} [CommRing K] [HopfAlgebra E K]
    (f : K →ₐc[E] H) (nu : Morphism E H) (x : K) :
    map E f nu x = nu (f x) := by sorry

/-- Over a splitting field, maps D -> D(M) are homomorphisms of character
groups M -> Q. For a finite free M this is the rational cocharacter space. -/
def toTorus (M : Type v) [AddCommGroup M] :
    (MonoidAlgebra E (Multiplicative M) →ₐc[E]
      MonoidAlgebra E (Multiplicative ℚ)) ≃ (M →+ ℚ) := by sorry

theorem toTorus_generator (M : Type v) [AddCommGroup M]
    (nu : MonoidAlgebra E (Multiplicative M) →ₐc[E]
      MonoidAlgebra E (Multiplicative ℚ)) (m : M) :
    nu (MonoidAlgebra.single (Multiplicative.ofAdd m) (1 : E)) =
      MonoidAlgebra.single (Multiplicative.ofAdd (toTorus E M nu m)) (1 : E) := by sorry

/-- The map D -> G_m of rational slope q, in the group-algebra presentation. -/
def toMultiplicativeGroup (q : ℚ) :
    MonoidAlgebra E (Multiplicative ℤ) →ₐc[E]
      MonoidAlgebra E (Multiplicative ℚ) :=
  (toTorus E ℤ).symm
    { toFun := fun n => (n : ℚ) * q
      map_zero' := by sorry
      map_add' := by sorry }

-- TauCeti.BunG.SlopeProtorus.testHalf: clearing the denominator uses the actual
-- coordinate image of the generator, rather than only a rational equality.
example :
    (toMultiplicativeGroup E (1 / 2))
      (MonoidAlgebra.single (Multiplicative.ofAdd (2 : ℤ)) (1 : E)) =
    MonoidAlgebra.single (Multiplicative.ofAdd (1 : ℚ)) (1 : E) := by sorry

-- TauCeti.BunG.SlopeProtorus.testZero: zero is the trivial group map.
example (n : ℤ) :
    toMultiplicativeGroup E 0
      (MonoidAlgebra.single (Multiplicative.ofAdd n) (1 : E)) = 1 := by sorry

-- TauCeti.BunG.SlopeProtorus.testDenominator: a half-slope map differs from
-- every integral-slope map, including the slope-one map.
example (n : ℤ) :
    toMultiplicativeGroup E (1 / 2) ≠ toMultiplicativeGroup E (n : ℚ) := by sorry
end SlopeProtorus
end TauCeti.BunG

noncomputable section
open CategoryTheory WithConv
open scoped TensorProduct
namespace TauCeti.BunG.RepresentativeTensor
universe u
variable (E H L : Type u) [Field E] [CommRing H] [HopfAlgebra E H]
  [Field L] [Algebra E L]
variable (sigma : L ≃ₐ[E] L)

instance sigmaInvPair : RingHomInvPair sigma.toRingEquiv.toRingHom
    sigma.symm.toRingEquiv.toRingHom := RingHomInvPair.of_ringEquiv sigma.toRingEquiv
instance sigmaInvPairSymm : RingHomInvPair sigma.symm.toRingEquiv.toRingHom
    sigma.toRingEquiv.toRingHom := RingHomInvPair.of_ringEquiv sigma.symm.toRingEquiv

abbrev Value (M : FGComoduleCat.{u,u,u} E H) := L ⊗[E] M

/-- Coefficient Frobenius on the native scalar extension, fixing the representation factor. -/
def coefficientSigma (M : FGComoduleCat.{u,u,u} E H) :
    Value E H L M ≃ₛₗ[sigma.toRingEquiv.toRingHom] Value E H L M where
  toFun := TensorProduct.map sigma.toLinearMap LinearMap.id
  invFun := TensorProduct.map sigma.symm.toLinearMap LinearMap.id
  map_add' := by sorry
  map_smul' := by sorry
  left_inv := by sorry
  right_inv := by sorry

theorem coefficientSigma_tmul (M : FGComoduleCat.{u,u,u} E H) (a : L) (m : M) :
    coefficientSigma E H L sigma M (a ⊗ₜ[E] m) = sigma a ⊗ₜ[E] m := by sorry

/-- The actual Frobenius rho(b) sigma on each finite rational representation. -/
def frobenius (b : WithConv (H →ₐ[E] L)) (M : FGComoduleCat.{u,u,u} E H) :
    Value E H L M ≃ₛₗ[sigma.toRingEquiv.toRingHom] Value E H L M :=
  (coefficientSigma E H L sigma M).trans (Comodule.pointsAction M b)

theorem frobenius_apply (b : WithConv (H →ₐ[E] L))
    (M : FGComoduleCat.{u,u,u} E H) (x : Value E H L M) :
    frobenius E H L sigma b M x =
      Comodule.pointsAction M b (coefficientSigma E H L sigma M x) := by sorry

def tensorCombine (M N : FGComoduleCat.{u,u,u} E H)
    (x : Value E H L M) (y : Value E H L N) :
    Value E H L (FGComoduleCat.tensor E H M N) :=
  (TensorProduct.AlgebraTensorModule.distribBaseChange E L M N).symm (x ⊗ₜ[L] y)

/-- Frobenius descent data on the fixed native scalar-extension fibre functor.
All fields are explicit semilinearity, naturality and tensor equations.
This is the trivialized presentation, not the untrivialized isocrystal category. -/
structure Data where
  component : ∀ M : FGComoduleCat.{u,u,u} E H,
    Value E H L M ≃ₛₗ[sigma.toRingEquiv.toRingHom] Value E H L M
  naturality : ∀ {M N : FGComoduleCat.{u,u,u} E H} (f : M ⟶ N) (x : Value E H L M),
    component N (f.hom.toLinearMap.baseChange L x) =
      f.hom.toLinearMap.baseChange L (component M x)
  unit : ∀ a : L, component (FGComoduleCat.tensorUnit E H) (a ⊗ₜ[E] (1 : E)) =
    sigma a ⊗ₜ[E] (1 : E)
  tensor : ∀ (M N : FGComoduleCat.{u,u,u} E H) (x : Value E H L M)
      (y : Value E H L N),
    component (FGComoduleCat.tensor E H M N) (tensorCombine E H L M N x y) =
      tensorCombine E H L M N (component M x) (component N y)

def ofRepresentative (b : WithConv (H →ₐ[E] L)) : Data E H L sigma where
  component := frobenius E H L sigma b
  naturality := by sorry
  unit := by sorry
  tensor := by sorry

/-- Linearize a semilinear tensor family by composing with inverse coefficient Frobenius. -/
def linearized (F : Data E H L sigma) :
    Aut (FGComoduleCat.scalarExtensionMonoidalFunctor E H L) := by sorry

theorem linearized_component (F : Data E H L sigma)
    (M : FGComoduleCat.{u,u,u} E H) (x : Value E H L M) :
    Tannaka.scalarExtensionComponent E H L (linearized E H L sigma F) M x =
      F.component M ((coefficientSigma E H L sigma M).symm x) := by sorry

/-- Tannakian reconstruction now gives a point without defining another linear category. -/
def reconstructedPoint (F : Data E H L sigma) : WithConv (H →ₐ[E] L) :=
  (Tannaka.fgPointTensorIsoEquiv E H L).symm (linearized E H L sigma F)

def equivalence : WithConv (H →ₐ[E] L) ≃ Data E H L sigma where
  toFun := ofRepresentative E H L sigma
  invFun := reconstructedPoint E H L sigma
  left_inv := by sorry
  right_inv := by sorry

-- TauCeti.BunG.RepresentativeTensor.testSemilinearity
-- Semilinearity is an equation with sigma, rather than ordinary L-linearity.
example (b : WithConv (H →ₐ[E] L)) (M : FGComoduleCat.{u,u,u} E H)
    (a : L) (x : Value E H L M) :
    (ofRepresentative E H L sigma b).component M (a • x) =
      sigma a • (ofRepresentative E H L sigma b).component M x := by sorry
-- TauCeti.BunG.RepresentativeTensor.testCoefficientUnit
-- The unit representative has actual coefficient Frobenius.
example (M : FGComoduleCat.{u,u,u} E H) (a : L) (m : M) :
    (ofRepresentative E H L sigma 1).component M (a ⊗ₜ[E] m) =
      sigma a ⊗ₜ[E] m := by sorry
-- TauCeti.BunG.RepresentativeTensor.testTensorFamily
-- The tensor equation tests a cross-representation constraint.
example (F : Data E H L sigma) (M N : FGComoduleCat.{u,u,u} E H)
    (x : Value E H L M) (y : Value E H L N) :
    F.component (FGComoduleCat.tensor E H M N) (tensorCombine E H L M N x y) =
      tensorCombine E H L M N (F.component M x) (F.component N y) := by sorry

/-- Arrows are genuine tensor automorphisms of the fixed fibre functor,
with the explicit Frobenius intertwining equation. -/
structure Iso (F G : Data E H L sigma) where
  tensorIso : Aut (FGComoduleCat.scalarExtensionMonoidalFunctor E H L)
  intertwines : ∀ (M : FGComoduleCat.{u,u,u} E H) (x : Value E H L M),
    Tannaka.scalarExtensionComponent E H L tensorIso M (F.component M x) =
      G.component M (Tannaka.scalarExtensionComponent E H L tensorIso M x)

/-- Every Frobenius-compatible tensor arrow reconstructs the actual conjugator. -/
def conjugatorEquiv (b c : WithConv (H →ₐ[E] L)) :
    {g : WithConv (H →ₐ[E] L) //
      c = g * b * (TauCeti.AlgHom.mapValue sigma.toAlgHom g)⁻¹} ≃
      Iso E H L sigma (ofRepresentative E H L sigma b) (ofRepresentative E H L sigma c) where
  toFun g := ⟨Tannaka.fgPointTensorIsoEquiv E H L g.val, by sorry⟩
  invFun eta := ⟨(Tannaka.fgPointTensorIsoEquiv E H L).symm eta.tensorIso, by sorry⟩
  left_inv := by sorry
  right_inv := by sorry

def changeTrivialization (b g : WithConv (H →ₐ[E] L)) :
    Iso E H L sigma (ofRepresentative E H L sigma b)
      (ofRepresentative E H L sigma
        (g * b * (TauCeti.AlgHom.mapValue sigma.toAlgHom g)⁻¹)) :=
  conjugatorEquiv E H L sigma b _ ⟨g, rfl⟩

theorem changeTrivialization_component (b g : WithConv (H →ₐ[E] L))
    (M : FGComoduleCat.{u,u,u} E H) (x : Value E H L M) :
    Tannaka.scalarExtensionComponent E H L
      (changeTrivialization E H L sigma b g).tensorIso M x =
        Comodule.pointsAction M g x := by sorry

/-- The categorical composition order agrees with h*g on conjugators. -/
def isoComp {F G K : Data E H L sigma}
    (f : Iso E H L sigma F G) (g : Iso E H L sigma G K) :
    Iso E H L sigma F K where
  tensorIso := g.tensorIso * f.tensorIso
  intertwines := by sorry

def isoRefl (F : Data E H L sigma) : Iso E H L sigma F F :=
  ⟨1, by sorry⟩

def isoInv {F G : Data E H L sigma} (f : Iso E H L sigma F G) :
    Iso E H L sigma G F := ⟨f.tensorIso⁻¹, by sorry⟩

instance dataGroupoid : Groupoid (Data E H L sigma) where
  Hom := Iso E H L sigma
  id := isoRefl E H L sigma
  comp := isoComp E H L sigma
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry
  inv := isoInv E H L sigma
  inv_comp := by sorry
  comp_inv := by sorry

-- TauCeti.BunG.RepresentativeTensor.testNotLinear
-- Nontrivial coefficient Frobenius cannot be replaced by an L-linear map,
-- already on the actual tensor-unit representation.
example (F : Data E H L sigma) (a : L) (ha : sigma a ≠ a) :
    ¬ ∃ f : Value E H L (FGComoduleCat.tensorUnit E H) →ₗ[L]
      Value E H L (FGComoduleCat.tensorUnit E H),
      ∀ x, f x = F.component (FGComoduleCat.tensorUnit E H) x := by sorry

-- TauCeti.BunG.RepresentativeTensor.testIntertwiner
-- A twisted conjugator produces the actual tensor intertwiner, not just
-- an equality of quotient classes.
example (b g : WithConv (H →ₐ[E] L)) (M : FGComoduleCat.{u,u,u} E H)
    (x : Value E H L M) :
    Comodule.pointsAction M g ((ofRepresentative E H L sigma b).component M x) =
      (ofRepresentative E H L sigma
        (g * b * (TauCeti.AlgHom.mapValue sigma.toAlgHom g)⁻¹)).component M
          (Comodule.pointsAction M g x) := by sorry

-- TauCeti.BunG.RepresentativeTensor.testArrowComposition
-- Composition acts on every representation as h after g.
example {b c d : WithConv (H →ₐ[E] L)}
    (g : {g : WithConv (H →ₐ[E] L) //
      c = g * b * (TauCeti.AlgHom.mapValue sigma.toAlgHom g)⁻¹})
    (h : {h : WithConv (H →ₐ[E] L) //
      d = h * c * (TauCeti.AlgHom.mapValue sigma.toAlgHom h)⁻¹})
    (M : FGComoduleCat.{u,u,u} E H) (x : Value E H L M) :
    Tannaka.scalarExtensionComponent E H L
      (isoComp E H L sigma (conjugatorEquiv E H L sigma b c g)
        (conjugatorEquiv E H L sigma c d h)).tensorIso M x =
      Comodule.pointsAction M (h.val * g.val) x := by sorry

-- TauCeti.BunG.RepresentativeTensor.testReconstruction
-- The inverse of reconstruction recovers every component of the whole
-- semilinear family, including its tensor coherence data.
example (F : Data E H L sigma) :
    ofRepresentative E H L sigma (reconstructedPoint E H L sigma F) = F := by sorry

/-- Send each representative and its actual twisted conjugator to tensor descent data. -/
def representativeFunctor :
    SigmaClass.Representative (pointsFrobenius E H L sigma) ⥤ Data E H L sigma where
  obj b := ofRepresentative E H L sigma b.point
  map {b c} g := conjugatorEquiv E H L sigma b.point c.point g
  map_id := by sorry
  map_comp := by sorry

/-- Reconstruct both the coefficient point and each Frobenius-compatible tensor arrow. -/
def reconstructionFunctor :
    Data E H L sigma ⥤ SigmaClass.Representative (pointsFrobenius E H L sigma) where
  obj F := ⟨reconstructedPoint E H L sigma F⟩
  map := by sorry
  map_id := by sorry
  map_comp := by sorry

def categoryEquivalence :
    SigmaClass.Representative (pointsFrobenius E H L sigma) ≌ Data E H L sigma where
  functor := representativeFunctor E H L sigma
  inverse := reconstructionFunctor E H L sigma
  unitIso := by sorry
  counitIso := by sorry
  functor_unitIso_comp := by sorry

/-- Tensor automorphisms of rho(b)sigma retain the full sigma-stabilizer group. -/
def tensorAut (b : WithConv (H →ₐ[E] L)) :
    Aut (ofRepresentative E H L sigma b) ≃*
      SigmaCentralizer.points (pointsFrobenius E H L sigma) b where
  toFun eta := ⟨(Tannaka.fgPointTensorIsoEquiv E H L).symm eta.hom.tensorIso, by sorry⟩
  invFun := by sorry
  left_inv := by sorry
  right_inv := by sorry
  map_mul' := by sorry

theorem tensorAut_component (b : WithConv (H →ₐ[E] L))
    (eta : Aut (ofRepresentative E H L sigma b))
    (M : FGComoduleCat.{u,u,u} E H) (x : Value E H L M) :
    Tannaka.scalarExtensionComponent E H L eta.hom.tensorIso M x =
      Comodule.pointsAction M (tensorAut E H L sigma b eta).val x := by sorry

-- TauCeti.BunG.RepresentativeTensor.testRepresentativeFamily
-- Native representative comparison retains the full tensor family on objects.
example (b : SigmaClass.Representative (pointsFrobenius E H L sigma))
    (M : FGComoduleCat.{u,u,u} E H) (x : Value E H L M) :
    ((categoryEquivalence E H L sigma).functor.obj b).component M x =
      Comodule.pointsAction M b.point (coefficientSigma E H L sigma M x) := by sorry

-- TauCeti.BunG.RepresentativeTensor.testTensorStabilizer
-- An automorphism reconstructs an element of the actual fixed-point equation.
example (b : WithConv (H →ₐ[E] L)) (eta : Aut (ofRepresentative E H L sigma b)) :
    (tensorAut E H L sigma b eta).val * b =
      b * pointsFrobenius E H L sigma (tensorAut E H L sigma b eta).val := by sorry

-- TauCeti.BunG.RepresentativeTensor.testTensorIdentitySigma
-- Identity Frobenius at the unit keeps every tensor automorphism of the fibre functor.
example : Nonempty (Aut (ofRepresentative E H L (AlgEquiv.refl) 1) ≃*
    WithConv (H →ₐ[E] L)) := by sorry

end TauCeti.BunG.RepresentativeTensor

namespace TauCeti.BunG.KottwitzDescent
universe u v w
variable {G : Type u} [Group G] {A : Type v} [AddCommGroup A]

/-- The integer Frobenius powers act on the actual integral abelian group. -/
def cyclicRepresentation (tau : A ≃+ A) : Representation ℤ (Multiplicative ℤ) A where
  toFun n := (tau.toIntLinearEquiv ^ n.toAdd).toLinearMap
  map_one' := by sorry
  map_mul' := by sorry

theorem cyclicRepresentation_generator (tau : A ≃+ A) (a : A) :
    cyclicRepresentation tau (Multiplicative.ofAdd 1) a = tau a := by sorry

/-- Mathlib's integral coinvariants; tensoring with Q is not part of this quotient. -/
abbrev Target (tau : A ≃+ A) := Representation.Coinvariants (cyclicRepresentation tau)

/-- The single integral relation induced by arithmetic Frobenius. -/
def relationMap (tau : A ≃+ A) : A →ₗ[ℤ] A :=
  tau.toIntLinearEquiv.toLinearMap - LinearMap.id

/-- All cyclic-action relations are generated by tau minus the identity. -/
theorem ker_eq_range (tau : A ≃+ A) :
    Representation.Coinvariants.ker (cyclicRepresentation tau) =
      LinearMap.range (relationMap tau) := by sorry

/-- The representative homomorphism is supplied by upstream RG2.1.5.
Only its explicit Frobenius equivariance is retained as consumer data. -/
structure Data (sigma : G ≃* G) (tau : A ≃+ A) where
  representative : G →* Multiplicative A
  frobenius : ∀ g, (representative (sigma g)).toAdd = tau (representative g).toAdd

variable (sigma : G ≃* G) (tau : A ≃+ A)

def representativeClass (d : Data sigma tau) (b : G) : Target tau :=
  Representation.Coinvariants.mk (cyclicRepresentation tau) (d.representative b).toAdd

theorem representative_twisted (d : Data sigma tau) (g b : G) :
    (d.representative (twistedConjugate sigma g b)).toAdd =
      (d.representative b).toAdd + (d.representative g).toAdd -
        tau (d.representative g).toAdd := by sorry

theorem representativeClass_twisted (d : Data sigma tau) (g b : G) :
    representativeClass sigma tau d (twistedConjugate sigma g b) =
      representativeClass sigma tau d b := by sorry

/-- Descend the supplied homomorphism to sigma classes, keeping all integral torsion. -/
def classKottwitz (d : Data sigma tau) : SigmaClass sigma → Target tau :=
  SigmaClass.lift sigma (representativeClass sigma tau d) (by sorry)

theorem classKottwitz_mk (d : Data sigma tau) (b : G) :
    classKottwitz sigma tau d (SigmaClass.mk sigma b) =
      Representation.Coinvariants.mk (cyclicRepresentation tau)
        (d.representative b).toAdd := by sorry

theorem classKottwitz_unique (d : Data sigma tau) (f : SigmaClass sigma → Target tau)
    (hf : ∀ b, f (SigmaClass.mk sigma b) = representativeClass sigma tau d b) :
    f = classKottwitz sigma tau d := by sorry

theorem classKottwitz_surjective (d : Data sigma tau)
    (hd : Function.Surjective d.representative) :
    Function.Surjective (classKottwitz sigma tau d) := by sorry

/-- Every map commuting with Frobenius is an actual native intertwining map. -/
def intertwiner {B : Type w} [AddCommGroup B] (upsilon : B ≃+ B)
    (q : A →ₗ[ℤ] B) (hq : ∀ a, q (tau a) = upsilon (q a)) :
    Representation.IntertwiningMap (cyclicRepresentation tau) (cyclicRepresentation upsilon) where
  toLinearMap := q
  isIntertwining' := by sorry

/-- Naturality uses native maps on integral coinvariants. -/
theorem classKottwitz_natural {H : Type w} [Group H] {B : Type v} [AddCommGroup B]
    (eta : H ≃* H) (upsilon : B ≃+ B) (d : Data sigma tau) (e : Data eta upsilon)
    (f : G →* H) (hf : ∀ g, f (sigma g) = eta (f g))
    (q : A →ₗ[ℤ] B) (hq : ∀ a, q (tau a) = upsilon (q a))
    (hk : ∀ g, q (d.representative g).toAdd = (e.representative (f g)).toAdd)
    (b : SigmaClass sigma) :
    classKottwitz eta upsilon e (SigmaClass.map sigma eta f hf b) =
      Representation.Coinvariants.map (cyclicRepresentation tau) (cyclicRepresentation upsilon)
        (intertwiner tau upsilon q hq) (classKottwitz sigma tau d b) := by sorry

/-- Split abelian representative control: kappa is the identity homomorphism. -/
def identityData : Data (AddEquiv.toMultiplicative tau) tau where
  representative := MonoidHom.id _
  frobenius := by sorry

/-- For an abelian point group the entire twisted quotient is the integral cokernel. -/
def abelianEquiv : SigmaClass (AddEquiv.toMultiplicative tau) ≃ Target tau where
  toFun := classKottwitz (AddEquiv.toMultiplicative tau) tau (identityData tau)
  invFun := by sorry
  left_inv := by sorry
  right_inv := by sorry

theorem abelianEquiv_mk (a : A) :
    abelianEquiv tau (SigmaClass.mk (AddEquiv.toMultiplicative tau) (Multiplicative.ofAdd a)) =
      Representation.Coinvariants.mk (cyclicRepresentation tau) a := by sorry

/-- Identity Frobenius imposes no relation on the integral target. -/
def identityFrobeniusEquiv : Target (AddEquiv.refl A) ≃ₗ[ℤ] A := by sorry

theorem identityFrobeniusEquiv_mk (a : A) :
    identityFrobeniusEquiv
      (Representation.Coinvariants.mk (cyclicRepresentation (AddEquiv.refl A)) a) = a := by sorry

/-- The sign-action cokernel is Z/2, rather than its zero rationalization. -/
def signCoinvariantsEquiv : Target (ComponentCoset.negation) ≃+ ZMod 2 := by sorry

theorem signCoinvariantsEquiv_mk (n : ℤ) :
    signCoinvariantsEquiv
      (Representation.Coinvariants.mk (cyclicRepresentation ComponentCoset.negation) n) =
        (n : ZMod 2) := by sorry

-- TauCeti.BunG.KottwitzDescent.testIdentityTarget
example (a : A) :
    identityFrobeniusEquiv
      (abelianEquiv (AddEquiv.refl A)
        (SigmaClass.mk (AddEquiv.toMultiplicative (AddEquiv.refl A))
          (Multiplicative.ofAdd a))) = a := by sorry

-- TauCeti.BunG.KottwitzDescent.testUnit
example (d : Data sigma tau) :
    classKottwitz sigma tau d (SigmaClass.mk sigma 1) = 0 := by sorry

-- TauCeti.BunG.KottwitzDescent.testTwistedInvariant
example (d : Data sigma tau) (g b : G) :
    classKottwitz sigma tau d (SigmaClass.mk sigma (g * b * (sigma g)⁻¹)) =
      classKottwitz sigma tau d (SigmaClass.mk sigma b) := by sorry

-- TauCeti.BunG.KottwitzDescent.testSignParity
example (n : ℤ) :
    signCoinvariantsEquiv
      (abelianEquiv ComponentCoset.negation
        (SigmaClass.mk (AddEquiv.toMultiplicative ComponentCoset.negation)
          (Multiplicative.ofAdd n))) = (n : ZMod 2) := by sorry

-- TauCeti.BunG.KottwitzDescent.testSignDistinct
example :
    SigmaClass.mk (AddEquiv.toMultiplicative ComponentCoset.negation)
      (Multiplicative.ofAdd (0 : ℤ)) ≠
    SigmaClass.mk (AddEquiv.toMultiplicative ComponentCoset.negation)
      (Multiplicative.ofAdd (1 : ℤ)) := by sorry

-- TauCeti.BunG.KottwitzDescent.testSignTwo
example :
    SigmaClass.mk (AddEquiv.toMultiplicative ComponentCoset.negation)
      (Multiplicative.ofAdd (2 : ℤ)) =
    SigmaClass.mk (AddEquiv.toMultiplicative ComponentCoset.negation)
      (Multiplicative.ofAdd (0 : ℤ)) := by sorry

-- TauCeti.BunG.KottwitzDescent.testSignNotFixed
-- Confusing coinvariants with fixed points drops the nonzero order-two class.
example :
    Representation.Coinvariants.mk (cyclicRepresentation ComponentCoset.negation) (1 : ℤ) ≠ 0 ∧
      ∀ n : ℤ, ComponentCoset.negation n = n → n = 0 := by sorry

end TauCeti.BunG.KottwitzDescent

namespace TauCeti.BunG.FamilyDescentControls

-- Restricted controls for HK22 v5 Lemma2.9/Theorem2.11, proof pp.8–9.
-- Native submodules and coordinate functions are used here. They are not
-- replacements for coefficient-DVR families or the geometric orbit map.
variable {R K : Type u} [CommRing R] [Field K] [Algebra R K]

/-- A stable over-lattice of the standard rank-two lattice contains the
    off-diagonal Frobenius coefficient. -/
theorem shear_forces_coefficient (σ : K ≃+* K) (a : K)
    (M : Submodule R (Fin 2 → K))
    (he₂ : ![0, 1] ∈ M)
    (hstable : ∀ x ∈ M, ![σ (x 0) + a * σ (x 1), σ (x 1)] ∈ M) :
    ![a, 0] ∈ M := by sorry

/-- If the proposed scaled lattice bound makes the shear coefficient
    nonintegral, no stable over-lattice with that bound exists. The general
    coefficient map is explicit; no valuation conclusion is assumed proved. -/
theorem shear_violates_bound (σ : K ≃+* K) (a scale : K)
    (hnonintegral : scale * a ∉ Set.range (algebraMap R K)) :
    ¬ ∃ M : Submodule R (Fin 2 → K),
      ![0, 1] ∈ M ∧
      (∀ x ∈ M, ![σ (x 0) + a * σ (x 1), σ (x 1)] ∈ M) ∧
      (∀ x ∈ M, scale * x 0 ∈ Set.range (algebraMap R K)) := by sorry

/-- The displayed ambient map has inverse (x,y) ↦ (x/2,x/4+y)
    and sends (1,1) to (2,1/2), but is not diag(t,t⁻¹) for any t.
    This detects group membership; it is not a counterexample to the
    existence of a smaller-group lift or to the source theorem. -/
theorem ambient_lift_not_tensor_lift :
    (fun x : Fin 2 → ℚ => ![2 * x 0, -(x 0) / 2 + x 1]) ![1, 1] = ![2, 1 / 2] ∧
    Function.Bijective (fun x : Fin 2 → ℚ => ![2 * x 0, -(x 0) / 2 + x 1]) ∧
    ∀ t : ℚˣ,
      (fun x : Fin 2 → ℚ => ![2 * x 0, -(x 0) / 2 + x 1]) ≠
      (fun x : Fin 2 → ℚ => ![(t : ℚ) * x 0, ((t⁻¹ : ℚˣ) : ℚ) * x 1]) := by sorry

end TauCeti.BunG.FamilyDescentControls

/-! ## Local invariant datum (BG0/BG1)

Supplier interface for one connected reductive `G` over a nonarchimedean local field `E`, with
`L = Ĕ`. Each field is named after its owner and is instantiated there; BG plans none of them.
* `Pt`, `frob`: the coefficient point group `G(L)` with arithmetic Frobenius; at the pins this is
  `AffinePoints E H L` with `pointsFrobenius` (Tau Ceti ReductiveGroups, layer 1).
* `Pi`, `piFrob`, `kappaTilde`: `π₁(G)_I`, its Frobenius and the representative Kottwitz
  homomorphism `κ̃` of upstream ReductiveGroupsPartII RG2.1.5 (`KottwitzMap.kottwitz`).
* `Cochar`, `RatCochar`, `Simple`, `simpleCoroot`, `simpleRoot`, `twoRho`, `Gal`, `galAct`,
  `dominantRat`, `dominantCochar`, `centralProj`: the based root datum of the quasi-split inner
  form with its finite Galois action and dominant chamber (RG2.1/RG2.4).
* `newtonRep`: the slope morphism of a representative, read from VB0's Dieudonné–Manin
  decomposition on every rational representation (BG1 `Invariants` descends it).
* `jRank`, `rank`: split ranks of `G` and of the represented `J_b` (G02 representability).
* `borel`, `newtonLevi`: a Borel `B(L)` (Tau Ceti layer 7) and the Newton Levi `Z_G(ν_b)(L)`
  (RG2.4 Levi of the slope morphism).
BG's own notions below (`NewtonSpace`, `Invariants`, `Basic`, `NewtonOrder`, `Acceptable`,
`Ordinary`, `Defect`, `DecentRepresentative`, …) have real bodies over these fields. -/
namespace TauCeti.BunG
universe u

structure LocalDatum where
  E : Type u
  [field : Field E]
  Pt : Type u
  [group : Group Pt]
  frob : Pt ≃* Pt
  Pi : Type u
  [piGroup : AddCommGroup Pi]
  piFrob : Pi ≃+ Pi
  kappaTilde : KottwitzDescent.Data frob piFrob
  Cochar : Type u
  [cocharGroup : AddCommGroup Cochar]
  RatCochar : Type u
  [ratGroup : AddCommGroup RatCochar]
  [ratModule : Module ℚ RatCochar]
  rational : Cochar →+ RatCochar
  piClass : Cochar →+ Pi
  Simple : Type u
  [simpleFintype : Fintype Simple]
  simpleCoroot : Simple → RatCochar
  simpleRoot : Simple → Module.Dual ℚ RatCochar
  roots : Set (Module.Dual ℚ RatCochar)
  twoRho : Module.Dual ℚ RatCochar
  Gal : Type u
  [galGroup : Group Gal]
  [galFintype : Fintype Gal]
  galAct : Gal →* (RatCochar ≃ₗ[ℚ] RatCochar)
  galCochar : Gal →* Module.End ℤ Cochar
  dominantRat : RatCochar → RatCochar
  dominantCochar : Cochar → Cochar
  PiRat : Type u
  [piRatGroup : AddCommGroup PiRat]
  [piRatModule : Module ℚ PiRat]
  centralProj : RatCochar →ₗ[ℚ] PiRat
  piAverage : KottwitzDescent.Target piFrob →+ PiRat
  atUniformizer : Cochar → Pt
  newtonRep : Pt → RatCochar
  newtonRep_twisted : ∀ g b, newtonRep (twistedConjugate frob g b) = newtonRep b
  rank : ℕ
  jRank : Pt → ℕ
  borel : Subgroup Pt
  newtonLevi : Pt → Subgroup Pt

namespace LocalDatum
attribute [instance] field group piGroup cocharGroup ratGroup ratModule simpleFintype galGroup
  galFintype piRatGroup piRatModule
variable (D : LocalDatum.{u})

/-- `B(G)`, the σ-conjugacy classes of `G(L)`. -/
abbrev BofG := SigmaClass D.frob

def Dominant (ν : D.RatCochar) : Prop := ∀ i, 0 ≤ D.simpleRoot i ν
def GalFixed (ν : D.RatCochar) : Prop := ∀ γ, D.galAct γ ν = ν
def Central (ν : D.RatCochar) : Prop := ∀ i, D.simpleRoot i ν = 0
/-- The closed cone of nonnegative rational combinations of simple coroots. -/
def corootCone : Set D.RatCochar :=
  {v | ∃ c : D.Simple → ℚ, (∀ i, 0 ≤ c i) ∧ v = ∑ i, c i • D.simpleCoroot i}
/-- A torus datum has no roots. -/
def IsTorus : Prop := IsEmpty D.Simple
/-- `G(E)`: the Frobenius-fixed coefficient points. -/
def rationalPoints : Subgroup D.Pt where
  carrier := {g | D.frob g = g}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry
end LocalDatum

/-- A morphism of local data: a Frobenius-equivariant point map with compatible `π₁` and
cocharacter maps (RG2.1.5 functoriality). -/
structure LocalDatum.Hom (D D' : LocalDatum.{u}) where
  pt : D.Pt →* D'.Pt
  pt_frob : ∀ g, pt (D.frob g) = D'.frob (pt g)
  pi : D.Pi →ₗ[ℤ] D'.Pi
  pi_frob : ∀ a, pi (D.piFrob a) = D'.piFrob (pi a)
  pi_kappa : ∀ g, pi (D.kappaTilde.representative g).toAdd =
    (D'.kappaTilde.representative (pt g)).toAdd
  rat : D.RatCochar →ₗ[ℚ] D'.RatCochar
  cochar : D.Cochar →+ D'.Cochar
  rat_cochar : ∀ lam, rat (D.rational lam) = D'.rational (cochar lam)
  newton_compat : ∀ b, D'.newtonRep (pt b) = D'.dominantRat (rat (D.newtonRep b))

/-- The identity morphism (requires dominance of representative slopes). -/
def LocalDatum.Hom.id (D : LocalDatum.{u}) (hdom : ∀ b, D.dominantRat (D.newtonRep b) = D.newtonRep b) :
    LocalDatum.Hom D D where
  pt := MonoidHom.id _
  pt_frob := fun _ => rfl
  pi := LinearMap.id
  pi_frob := fun _ => rfl
  pi_kappa := fun _ => rfl
  rat := LinearMap.id
  cochar := AddMonoidHom.id _
  rat_cochar := fun _ => rfl
  newton_compat := fun b => (hdom b).symm

/-- Minuscule: every root pairs with `μ` in `{-1, 0, 1}`. -/
def IsMinuscule (D : LocalDatum.{u}) (μ : D.Cochar) : Prop :=
  ∀ α ∈ D.roots, α (D.rational μ) ∈ ({-1, 0, 1} : Set ℚ)

/-! ### BG1/newton-orbit-space -/
/-- `N(G)`: Γ-fixed dominant rational cocharacters of the quasi-split inner form. -/
def NewtonSpace (D : LocalDatum.{u}) := {ν : D.RatCochar // D.Dominant ν ∧ D.GalFixed ν}

namespace NewtonSpace
variable {D : LocalDatum.{u}}
/-- The dominant representative of a Γ-fixed rational cocharacter class. -/
def dominant (D : LocalDatum.{u}) (ν : D.RatCochar) (hν : D.GalFixed (D.dominantRat ν))
    (hd : D.Dominant (D.dominantRat ν)) : NewtonSpace D := ⟨D.dominantRat ν, hd, hν⟩
/-- Positive-coroot dominance; the central projection is then equal. -/
def le (ν ν' : NewtonSpace D) : Prop := ν'.1 - ν.1 ∈ D.corootCone
/-- `δ : N(G) → (π₁(G) ⊗ ℚ)^Γ`. -/
def delta (ν : NewtonSpace D) : D.PiRat := D.centralProj ν.1
theorem le_delta {ν ν' : NewtonSpace D} (h : le ν ν') : delta ν = delta ν' := by sorry

/-- An inner twisting `ξ : G → G'` identifies the quasi-split based root data. -/
structure InnerTwisting (D D' : LocalDatum.{u}) where
  rat : D.RatCochar ≃ₗ[ℚ] D'.RatCochar
  simple : D.Simple ≃ D'.Simple
  coroot : ∀ i, rat (D.simpleCoroot i) = D'.simpleCoroot (simple i)
  root : ∀ i v, D'.simpleRoot (simple i) (rat v) = D.simpleRoot i v
  gal : ∀ (γ : D.Gal) , ∃ γ' : D'.Gal, ∀ v, rat (D.galAct γ v) = D'.galAct γ' (rat v)

def transfer {D' : LocalDatum.{u}} (ξ : InnerTwisting D D') : NewtonSpace D ≃ NewtonSpace D' :=
  by sorry
theorem transfer_le {D' : LocalDatum.{u}} (ξ : InnerTwisting D D') (ν ν' : NewtonSpace D) :
    le (transfer ξ ν) (transfer ξ ν') ↔ le ν ν' := by sorry
end NewtonSpace

/-- Split `GL₂` controls: rational cocharacters `ℚ²`, one simple coroot `e₁ - e₂`. -/
def gl2Cone : Set (Fin 2 → ℚ) := {v | ∃ c : ℚ, 0 ≤ c ∧ v = c • ![1, -1]}
-- TauCeti.BunG.NewtonSpace.testGL2: in `GL₂`, `(1,0) - (1/2,1/2) = (1/2)(e₁ - e₂)`.
example (D : LocalDatum.{u}) (i : D.Simple) (ν ν' : NewtonSpace D)
    (h : ν'.1 - ν.1 = (1/2 : ℚ) • D.simpleCoroot i) :
    NewtonSpace.le ν ν' ∧ NewtonSpace.delta ν = NewtonSpace.delta ν' := by sorry
example : (![1, 0] - ![1/2, 1/2] : Fin 2 → ℚ) ∈ gl2Cone := by sorry
-- TauCeti.BunG.NewtonSpace.testTorus
example (D : LocalDatum.{u}) (hT : D.IsTorus) (ν ν' : NewtonSpace D) :
    NewtonSpace.le ν ν' ↔ ν = ν' := by sorry
-- TauCeti.BunG.NewtonSpace.testCentral: for `G_m`, `0` and `1` are incomparable.
example (D : LocalDatum.{u}) (hT : D.IsTorus) (ν ν' : NewtonSpace D) (h : ν ≠ ν') :
    ¬ NewtonSpace.le ν ν' := by sorry

/-! ### BG1/algebraic-fundamental-group (import alias of upstream RG2.1.5) -/
/-- Alias: `π₁(G)_I` with its Frobenius, supplied by upstream RG2.1.5. -/
abbrev AlgebraicPiOne (D : LocalDatum.{u}) := D.Pi
namespace AlgebraicPiOne
def ofCocharacter (D : LocalDatum.{u}) (lam : D.Cochar) : AlgebraicPiOne D := D.piClass lam
/-- Full Γ-coinvariants `π₁(G)_Γ`, integral. -/
abbrev coinvariants (D : LocalDatum.{u}) := KottwitzDescent.Target D.piFrob
def map {D D' : LocalDatum.{u}} (f : LocalDatum.Hom D D') : AlgebraicPiOne D →ₗ[ℤ] AlgebraicPiOne D' :=
  f.pi
/-- Canonical transport of `π₁(G)_Γ` along an inner twisting (RG2.1 comparison refinement). -/
def innerInvariant {D D' : LocalDatum.{u}} (ξ : NewtonSpace.InnerTwisting D D') :
    coinvariants D ≃+ coinvariants D' := by sorry
end AlgebraicPiOne
-- TauCeti.BunG.AlgebraicPiOne.testGLn: split `GL_n`, `n ≥ 1`: `π₁ = ℤ` by the coordinate sum,
-- and trivial Frobenius leaves the coinvariants equal to `π₁`.
example (n : ℕ) (hn : 1 ≤ n) :
    Function.Surjective (fun v : Fin n → ℤ => ∑ i, v i) := by sorry
example (D : LocalDatum.{u}) (hτ : D.piFrob = AddEquiv.refl _) (e : AlgebraicPiOne D ≃+ ℤ) :
    Nonempty (AlgebraicPiOne.coinvariants D ≃+ ℤ) := by sorry
-- TauCeti.BunG.AlgebraicPiOne.testSLn
example (D : LocalDatum.{u}) (h : Subsingleton (AlgebraicPiOne D)) :
    Subsingleton (AlgebraicPiOne.coinvariants D) := by sorry
-- TauCeti.BunG.AlgebraicPiOne.testNormOne
example : Nonempty (KottwitzDescent.Target ComponentCoset.negation ≃+ ZMod 2) ∧
    ((1 : ZMod 2) ≠ 0) := ⟨⟨KottwitzDescent.signCoinvariantsEquiv⟩, by decide⟩

/-! ### BG1/galois-average -/
namespace HodgeInvariants
variable (D : LocalDatum.{u})
/-- `μ♯`: the full integral class of the dominant representative in `π₁(G)_Γ`. -/
def sharp (μ : D.Cochar) : KottwitzDescent.Target D.piFrob :=
  Representation.Coinvariants.mk _ (D.piClass (D.dominantCochar μ))
/-- `μ◇`: the rational Γ-average of the dominant representative. -/
def diamond (μ : D.Cochar) : D.RatCochar :=
  (Fintype.card D.Gal : ℚ)⁻¹ • ∑ γ : D.Gal, D.galAct γ (D.rational (D.dominantCochar μ))
theorem average_eq (μ : D.Cochar) :
    D.piAverage (sharp D μ) = D.centralProj (diamond D μ) := by sorry
theorem diamond_dominant (μ : D.Cochar) : D.Dominant (diamond D μ) := by sorry
theorem diamond_galFixed (μ : D.Cochar) : D.GalFixed (diamond D μ) := by sorry
/-- Restriction of the Galois action along a finite extension: the average is taken over the
smaller group, with explicit degree normalisation. -/
theorem baseChange (H : Subgroup D.Gal) [Fintype H] (μ : D.Cochar) :
    (Fintype.card H : ℚ)⁻¹ • ∑ γ : H, D.galAct γ (D.rational (D.dominantCochar μ)) =
      diamond D μ ∨ ∃ γ : D.Gal, D.galAct γ (D.rational (D.dominantCochar μ)) ≠
        D.rational (D.dominantCochar μ) := by sorry
end HodgeInvariants
-- TauCeti.BunG.HodgeInvariants.testSplitGL2: trivial Galois action, μ = (1,0).
example (D : LocalDatum.{u}) (hΓ : ∀ γ : D.Gal, D.galAct γ = 1) (μ : D.Cochar) :
    HodgeInvariants.diamond D μ = D.rational (D.dominantCochar μ) := by sorry
-- TauCeti.BunG.HodgeInvariants.testUnit
example (D : LocalDatum.{u}) (h0 : D.dominantCochar 0 = 0) :
    HodgeInvariants.sharp D 0 = 0 ∧ HodgeInvariants.diamond D 0 = 0 := by sorry
-- TauCeti.BunG.HodgeInvariants.testTorsion: norm-one torus, sign Frobenius on `π₁ = ℤ`.
example (D : LocalDatum.{u}) (hT : D.IsTorus) (e : D.Pi ≃+ ℤ)
    (he : ∀ a, e (D.piFrob a) = -e a) (μ : D.Cochar)
    (h1 : e (D.piClass (D.dominantCochar μ)) = 1) (hav : HodgeInvariants.diamond D μ = 0) :
    HodgeInvariants.sharp D μ ≠ 0 := by sorry

/-- `(μ♯, μ◇)`. -/
def HodgeInvariants (D : LocalDatum.{u}) (μ : D.Cochar) :
    KottwitzDescent.Target D.piFrob × D.RatCochar :=
  (HodgeInvariants.sharp D μ, HodgeInvariants.diamond D μ)

/-! ### BG1/newton-and-kottwitz-maps -/
namespace Invariants
variable (D : LocalDatum.{u})
def representativeKottwitz (b : D.Pt) : D.Pi := (D.kappaTilde.representative b).toAdd
def kottwitz : D.BofG → KottwitzDescent.Target D.piFrob :=
  KottwitzDescent.classKottwitz D.frob D.piFrob D.kappaTilde
/-- The Newton map, descended from the representative slope morphism. -/
def newtonRat : D.BofG → D.RatCochar :=
  SigmaClass.lift D.frob D.newtonRep (fun g b => D.newtonRep_twisted g b)
def newton (hdom : ∀ b, D.Dominant (D.newtonRep b)) (hgal : ∀ b, D.GalFixed (D.newtonRep b)) :
    D.BofG → NewtonSpace D :=
  fun x => ⟨newtonRat D x, by sorry, by sorry⟩
theorem newtonRat_mk (b : D.Pt) : newtonRat D (SigmaClass.mk D.frob b) = D.newtonRep b := by sorry
theorem kottwitz_mk (b : D.Pt) : kottwitz D (SigmaClass.mk D.frob b) =
    Representation.Coinvariants.mk _ (representativeKottwitz D b) := by sorry
/-- Functoriality of both invariants along a morphism of local data. -/
theorem map {D' : LocalDatum.{u}} (f : LocalDatum.Hom D D') (b : D.Pt) :
    kottwitz D' (SigmaClass.mk D'.frob (f.pt b)) =
      Representation.Coinvariants.map _ _ (KottwitzDescent.intertwiner D.piFrob D'.piFrob f.pi
        f.pi_frob) (kottwitz D (SigmaClass.mk D.frob b)) ∧
    newtonRat D' (SigmaClass.mk D'.frob (f.pt b)) =
      D'.dominantRat (f.rat (newtonRat D (SigmaClass.mk D.frob b))) := by sorry
/-- `δ(ν_b) = average(κ(b) ⊗ 1)`. -/
theorem rationalCompatibility (x : D.BofG) :
    D.centralProj (newtonRat D x) = D.piAverage (kottwitz D x) := by sorry
end Invariants
-- TauCeti.BunG.Invariants.testGL1: `G_m` with `κ̃ = v`, `b = π^m`.
example (D : LocalDatum.{u}) (hT : D.IsTorus) (m : D.Cochar) (b : D.Pt)
    (hb : b = D.atUniformizer m) (hκ : Invariants.representativeKottwitz D b = D.piClass m)
    (hν : D.newtonRep b = D.rational m) :
    Invariants.newtonRat D (SigmaClass.mk D.frob b) = D.rational m ∧
      Invariants.kottwitz D (SigmaClass.mk D.frob b) =
        Representation.Coinvariants.mk _ (D.piClass m) := by sorry
-- TauCeti.BunG.Invariants.testTorsion: the two norm-one torus classes.
example (D : LocalDatum.{u}) (e : D.Pi ≃+ ℤ) (he : ∀ a, e (D.piFrob a) = -e a)
    (x y : D.BofG) (hx : Invariants.kottwitz D x = Representation.Coinvariants.mk _ (e.symm 0))
    (hy : Invariants.kottwitz D y = Representation.Coinvariants.mk _ (e.symm 1))
    (hν : Invariants.newtonRat D x = Invariants.newtonRat D y) : x ≠ y := by sorry

/-- `(ν, κ) : B(G) → N(G) × π₁(G)_Γ`. -/
def Invariants (D : LocalDatum.{u}) (x : D.BofG) : D.RatCochar × KottwitzDescent.Target D.piFrob :=
  (Invariants.newtonRat D x, Invariants.kottwitz D x)

-- TauCeti.BunG.SigmaClass.testGL1: split `G_m` (Witt specialization: `SigmaClass.wittGmSlopeEquiv`).
example (D : LocalDatum.{u}) (hT : D.IsTorus) (e : D.Pi ≃+ ℤ) (hτ : D.piFrob = AddEquiv.refl _)
    (hκ : Function.Bijective (Invariants.kottwitz D)) : Nonempty (D.BofG ≃ ℤ) := by sorry

/-! ### BG1/classification-by-two-invariants -/
theorem ClassificationByTwoInvariants (D : LocalDatum.{u}) :
    Function.Injective (fun x : D.BofG => (Invariants.newtonRat D x, Invariants.kottwitz D x)) ∧
    Function.Bijective (fun x : {x : D.BofG // D.Central (Invariants.newtonRat D x)} =>
      Invariants.kottwitz D x.1) := by sorry

/-! ### BG1/basic-class -/
def Basic (D : LocalDatum.{u}) (x : D.BofG) : Prop := D.Central (Invariants.newtonRat D x)
namespace Basic
variable (D : LocalDatum.{u})
/-- Basic iff every adjoint slope vanishes: no simple root pairs nontrivially. -/
theorem adjoint_iff (x : D.BofG) :
    Basic D x ↔ ∀ i, D.simpleRoot i (Invariants.newtonRat D x) = 0 := Iff.rfl
def ofKottwitz (α : KottwitzDescent.Target D.piFrob) : {x : D.BofG // Basic D x} := by sorry
theorem ofKottwitz_kottwitz (α : KottwitzDescent.Target D.piFrob) :
    Invariants.kottwitz D (ofKottwitz D α).1 = α := by sorry
theorem newton (x : D.BofG) (hx : Basic D x) :
    D.centralProj (Invariants.newtonRat D x) = D.piAverage (Invariants.kottwitz D x) := by sorry
theorem innerTransport {D' : LocalDatum.{u}} (ξ : NewtonSpace.InnerTwisting D D')
    (x : D.BofG) (hx : Basic D x) :
    ∃ y : D'.BofG, Basic D' y ∧
      Invariants.kottwitz D' y = AlgebraicPiOne.innerInvariant ξ (Invariants.kottwitz D x) ∧
      Invariants.newtonRat D' y = ξ.rat (Invariants.newtonRat D x) := by sorry
end Basic
-- TauCeti.BunG.Basic.testGL2Half: the central slope `(1/2,1/2)` pairs to zero with `e₁ - e₂`.
example (D : LocalDatum.{u}) (x : D.BofG)
    (h : ∀ i, D.simpleRoot i (Invariants.newtonRat D x) = 0) : Basic D x := by sorry
-- TauCeti.BunG.Basic.testTorus
example (D : LocalDatum.{u}) (hT : D.IsTorus) (x : D.BofG) : Basic D x := by sorry
-- TauCeti.BunG.Basic.testNonbasic: slopes `(1,0)` pair to `1` with `e₁ - e₂`.
example (D : LocalDatum.{u}) (x : D.BofG) (i : D.Simple)
    (h : D.simpleRoot i (Invariants.newtonRat D x) = 1) : ¬ Basic D x := by sorry

/-! ### BG1/representation-detects-dominance -/
/-- The rational representations of the quasi-split form with the descending slopes of a
rational cocharacter on each (Tau Ceti ReductiveGroups layer 1; highest-weight detection G02). -/
structure RepresentationWeights (D : LocalDatum.{u}) where
  Rep : Type u
  weights : Rep → D.RatCochar → List ℚ
  sorted : ∀ V ν, (weights V ν).Pairwise (· ≥ ·)
  conj : ∀ V ν, weights V (D.dominantRat ν) = weights V ν

/-- RR96 Lemma 2.2 (characteristic zero); the equal-characteristic case is the G02 request. -/
theorem RepresentationDetectsDominance (D : LocalDatum.{u}) [CharZero D.E]
    (R : RepresentationWeights D) (ν ν' : NewtonSpace D) :
    NewtonSpace.le ν ν' ↔ ∀ V k, ((R.weights V ν.1).take k).sum ≤
      ((R.weights V ν'.1).take k).sum ∧ (R.weights V ν.1).sum = (R.weights V ν'.1).sum := by sorry

/-! ### BG1/partial-order-on-B-of-G -/
def NewtonOrder (D : LocalDatum.{u}) (x y : D.BofG) : Prop :=
  Invariants.kottwitz D x = Invariants.kottwitz D y ∧
    Invariants.newtonRat D y - Invariants.newtonRat D x ∈ D.corootCone
namespace NewtonOrder
variable (D : LocalDatum.{u})
theorem le_iff (x y : D.BofG) : NewtonOrder D x y ↔
    Invariants.kottwitz D x = Invariants.kottwitz D y ∧
      Invariants.newtonRat D y - Invariants.newtonRat D x ∈ D.corootCone := Iff.rfl
/-- With `κ` fixed the relation is a partial order (classification by both invariants). -/
@[reducible] def partialOrder : PartialOrder D.BofG where
  le := NewtonOrder D
  le_refl := by sorry
  le_trans := by sorry
  le_antisymm := by sorry
theorem basic_minimal (x y : D.BofG) (hx : Basic D x)
    (hκ : Invariants.kottwitz D x = Invariants.kottwitz D y) : NewtonOrder D x y := by sorry
/-- Representation criterion: with `κ` fixed, dominance is tested on the descending slope
polygons of all rational representations (`weights` = the slopes of `ν` on a representation). -/
theorem representationCriterion [CharZero D.E] (R : RepresentationWeights D)
    (x y : D.BofG) (hκ : Invariants.kottwitz D x = Invariants.kottwitz D y) :
    NewtonOrder D x y ↔ ∀ V k, ((R.weights V (Invariants.newtonRat D x)).take k).sum ≤
      ((R.weights V (Invariants.newtonRat D y)).take k).sum := by sorry
end NewtonOrder
-- TauCeti.BunG.NewtonOrder.testGL2
example (D : LocalDatum.{u}) (x y : D.BofG) (i : D.Simple)
    (hκ : Invariants.kottwitz D x = Invariants.kottwitz D y)
    (h : Invariants.newtonRat D y - Invariants.newtonRat D x = (1/2 : ℚ) • D.simpleCoroot i) :
    NewtonOrder D x y := by sorry
-- TauCeti.BunG.NewtonOrder.testDifferentKappa: `GL₁` classes `0,1` have distinct `κ`.
example (D : LocalDatum.{u}) (x y : D.BofG)
    (h : Invariants.kottwitz D x ≠ Invariants.kottwitz D y) : ¬ NewtonOrder D x y := by sorry
-- TauCeti.BunG.NewtonOrder.testTorsion: equal Newton points, distinct `κ`.
example (D : LocalDatum.{u}) (x y : D.BofG)
    (hν : Invariants.newtonRat D x = Invariants.newtonRat D y)
    (hκ : Invariants.kottwitz D x ≠ Invariants.kottwitz D y) :
    ¬ NewtonOrder D x y ∧ ¬ NewtonOrder D y x := by sorry

/-! ### BG1/admissible-pair -/
def Acceptable (D : LocalDatum.{u}) (μ : D.Cochar) (x : D.BofG) : Prop :=
  Invariants.kottwitz D x = HodgeInvariants.sharp D μ ∧
    HodgeInvariants.diamond D μ - Invariants.newtonRat D x ∈ D.corootCone
namespace Acceptable
variable (D : LocalDatum.{u})
theorem mem_iff (μ : D.Cochar) (x : D.BofG) : Acceptable D μ x ↔
    Invariants.kottwitz D x = HodgeInvariants.sharp D μ ∧
      HodgeInvariants.diamond D μ - Invariants.newtonRat D x ∈ D.corootCone := Iff.rfl
theorem basic (μ : D.Cochar) :
    Acceptable D μ (Basic.ofKottwitz D (HodgeInvariants.sharp D μ)).1 := by sorry
theorem finite (μ : D.Cochar) : {x : D.BofG | Acceptable D μ x}.Finite := by sorry
theorem torus_iff (hT : D.IsTorus) (μ : D.Cochar) (x : D.BofG) :
    Acceptable D μ x ↔ Invariants.kottwitz D x = HodgeInvariants.sharp D μ := by sorry
theorem product {D₁ D₂ D₁₂ : LocalDatum.{u}} (p₁ : LocalDatum.Hom D₁₂ D₁)
    (p₂ : LocalDatum.Hom D₁₂ D₂) (hprod : Function.Bijective
      (fun g => (p₁.pt g, p₂.pt g))) (μ : D₁₂.Cochar) (μ₁ : D₁.Cochar) (μ₂ : D₂.Cochar)
    (x : D₁₂.BofG) :
    Acceptable D₁₂ μ x ↔ Acceptable D₁ μ₁ (SigmaClass.map _ _ p₁.pt p₁.pt_frob x) ∧
      Acceptable D₂ μ₂ (SigmaClass.map _ _ p₂.pt p₂.pt_frob x) := by sorry
end Acceptable
-- TauCeti.BunG.Acceptable.testGL2: basic `(1/2,1/2)` and ordinary `(1,0)` lie below `μ◇ = (1,0)`.
example (D : LocalDatum.{u}) (μ : D.Cochar) (x y : D.BofG) (i : D.Simple)
    (hx : Invariants.kottwitz D x = HodgeInvariants.sharp D μ)
    (hy : Invariants.kottwitz D y = HodgeInvariants.sharp D μ)
    (hxν : HodgeInvariants.diamond D μ - Invariants.newtonRat D x = (1/2 : ℚ) • D.simpleCoroot i)
    (hyν : Invariants.newtonRat D y = HodgeInvariants.diamond D μ) :
    Acceptable D μ x ∧ Acceptable D μ y := by sorry
-- TauCeti.BunG.Acceptable.testZero
example (D : LocalDatum.{u}) (h0 : D.dominantCochar 0 = 0) (x : D.BofG) :
    Acceptable D 0 x ↔ x = (Basic.ofKottwitz D 0).1 := by sorry
-- TauCeti.BunG.Acceptable.testTorsion
example (D : LocalDatum.{u}) (hT : D.IsTorus) (μ : D.Cochar) (x : D.BofG)
    (hx : Invariants.kottwitz D x ≠ HodgeInvariants.sharp D μ) : ¬ Acceptable D μ x := by sorry

/-! ### BG1/admissible-finiteness-and-basic -/
theorem AdmissibleFinitenessAndBasic (D : LocalDatum.{u}) (μ : D.Cochar) :
    {x : D.BofG | Acceptable D μ x}.Finite ∧
    (∃! x : D.BofG, Acceptable D μ x ∧ Basic D x) ∧
    (∀ x y, Acceptable D μ x → Basic D x → Acceptable D μ y → NewtonOrder D x y) ∧
    (D.IsTorus → ∀ x y, Acceptable D μ x → Acceptable D μ y → x = y) := by sorry

/-! ### BG1/ordinary-class and the unique maximum -/
def Ordinary (D : LocalDatum.{u}) (μ : D.Cochar) (x : D.BofG) : Prop :=
  Acceptable D μ x ∧ Invariants.newtonRat D x = HodgeInvariants.diamond D μ
/-- Quasi-split: some `G(L)`-conjugate of the chosen Borel `B(L)` is Frobenius stable (RG2.4). -/
def IsQuasiSplit (D : LocalDatum.{u}) : Prop :=
  ∃ g : D.Pt, ∀ h ∈ D.borel, D.frob (g * h * g⁻¹) ∈ (D.borel.map (MulAut.conj g).toMonoidHom)
namespace Ordinary
variable (D : LocalDatum.{u})
theorem isOrdinary (μ : D.Cochar) (x : D.BofG) : Ordinary D μ x ↔
    Acceptable D μ x ∧ Invariants.newtonRat D x = HodgeInvariants.diamond D μ := Iff.rfl
theorem unique (μ : D.Cochar) (x y : D.BofG) (hx : Ordinary D μ x) (hy : Ordinary D μ y) :
    x = y := by sorry
theorem quasiSplitExists (hqs : IsQuasiSplit D) (μ : D.Cochar) : ∃ x, Ordinary D μ x := by sorry
theorem maximal (μ : D.Cochar) (x y : D.BofG) (hx : Ordinary D μ x) (hy : Acceptable D μ y) :
    NewtonOrder D y x := by sorry
theorem derivedIsogeny {D' : LocalDatum.{u}} (f : LocalDatum.Hom D D')
    (hder : ∃ e : D.Simple ≃ D'.Simple, ∀ i, f.rat (D.simpleCoroot i) = D'.simpleCoroot (e i))
    (μ : D.Cochar) (μ' : D'.Cochar) (hμ : f.cochar μ = μ')
    (x : D.BofG) (hx : Acceptable D μ x) :
    Ordinary D μ x ↔ Ordinary D' μ' (SigmaClass.map _ _ f.pt f.pt_frob x) := by sorry
end Ordinary
-- TauCeti.BunG.Ordinary.testGL2: `(1,0)` attains `μ◇`, `(1/2,1/2)` does not.
example (D : LocalDatum.{u}) (μ : D.Cochar) (x y : D.BofG) (i : D.Simple)
    (hx : Acceptable D μ x) (hxν : Invariants.newtonRat D x = HodgeInvariants.diamond D μ)
    (hyν : HodgeInvariants.diamond D μ - Invariants.newtonRat D y = (1/2 : ℚ) • D.simpleCoroot i)
    (hi : D.simpleCoroot i ≠ 0) : Ordinary D μ x ∧ ¬ Ordinary D μ y := by sorry
-- TauCeti.BunG.Ordinary.testTorus
example (D : LocalDatum.{u}) (hT : D.IsTorus) (μ : D.Cochar) (x : D.BofG)
    (hx : Acceptable D μ x) : Ordinary D μ x := by sorry
-- TauCeti.BunG.Ordinary.testQuaternion: after splitting, slopes `1/2, -1/2` with multiplicity
-- one violate the Dieudonné–Manin denominator condition of the native GL slope data.
example : ¬ ∃ x : GLnSlopeData 2, x.slopes 0 = 1/2 ∧ x.slopes 1 = -1/2 := by sorry

theorem AcceptableUniqueMaximum (D : LocalDatum.{u}) (μ : D.Cochar) :
    ∃ x, Acceptable D μ x ∧ (∀ y, Acceptable D μ y → NewtonOrder D y x) ∧
      (Ordinary D μ x ↔ Invariants.newtonRat D x = HodgeInvariants.diamond D μ) := by sorry

/-! ### BG1/rational-newton-witness -/
/-- An `E`-rational slope morphism in the class of `ν_b`, with its conjugator. The rational
cocharacter `ν` lives in a Frobenius-stable torus of `G` (RG2.4); `g` conjugates it to `ν_b`. -/
structure RationalNewtonWitness (D : LocalDatum.{u}) (b : D.Pt) where
  ν : D.RatCochar
  conjugator : D.Pt
  conj : D.dominantRat ν = D.newtonRep b
  rationalFixed : D.GalFixed ν
namespace RationalNewtonWitness
variable (D : LocalDatum.{u})
def quasiSplit (hqs : IsQuasiSplit D) (b : D.Pt) : RationalNewtonWitness D b := by sorry
def basic (b : D.Pt) (hb : Basic D (SigmaClass.mk D.frob b)) : RationalNewtonWitness D b := by sorry
/-- The Levi `Z_G(ν)`: the simple roots vanishing on the rational representative. -/
def levi {b : D.Pt} (w : RationalNewtonWitness D b) : Set D.Simple := {i | D.simpleRoot i w.ν = 0}
/-- The central morphism transported to `J_b`. -/
def centralOnJ {b : D.Pt} (w : RationalNewtonWitness D b) : D.RatCochar := w.ν
end RationalNewtonWitness
-- TauCeti.BunG.RationalNewtonWitness.testSplitGL2: `(1,0)` is already dominant and rational.
example (D : LocalDatum.{u}) (b : D.Pt) (hgal : D.GalFixed (D.newtonRep b))
    (hdom : D.dominantRat (D.newtonRep b) = D.newtonRep b) :
    Nonempty (RationalNewtonWitness D b) := by sorry
-- TauCeti.BunG.RationalNewtonWitness.testBasic
example (D : LocalDatum.{u}) (b : D.Pt) (w : RationalNewtonWitness D b) (hw : D.Central w.ν) :
    w.levi = Set.univ := by sorry
-- TauCeti.BunG.RationalNewtonWitness.testInnerForm: an anisotropic inner form has no rational
-- noncentral representative; Galois invariance of the orbit alone does not supply one.
example (D : LocalDatum.{u}) (hanis : ∀ ν, D.GalFixed ν → D.Central ν) (b : D.Pt)
    (hb : ¬ D.Central (D.newtonRep b)) (hdom : ∀ ν, D.Central ν → D.dominantRat ν = ν) :
    IsEmpty (RationalNewtonWitness D b) := by sorry

/-! ### BG0/central-newton-on-J -/
namespace CentralNewtonOnJ
variable (D : LocalDatum.{u})
/-- The descended central rational morphism `ν_{b,J}`: the representative slope vector, which is
central in `J_b` and needs no rational representative in `G`. -/
def morphism (b : D.Pt) : D.RatCochar := D.newtonRep b
def integralMultiple (b : D.Pt) : {N : ℕ // 0 < N ∧ ∃ lam : D.Cochar,
    D.rational lam = (N : ℚ) • morphism D b} := by sorry
/-- `U_π = (N ν_{b,J})(π) ∈ J_b(E)`. -/
def uniformizerElement (b : D.Pt) : D.Pt := D.atUniformizer (integralMultiple D b).2.2.choose
theorem uniformizerElement_mem (b : D.Pt) :
    uniformizerElement D b ∈ SigmaCentralizer.points D.frob b := by sorry
theorem transport (g b : D.Pt) :
    morphism D (twistedConjugate D.frob g b) = morphism D b := D.newtonRep_twisted g b
end CentralNewtonOnJ
-- TauCeti.BunG.CentralNewtonOnJ.testBasicHalf: twice the half slope is the central scalar.
example (D : LocalDatum.{u}) (b : D.Pt) (c : D.Cochar)
    (hb : D.newtonRep b = (1/2 : ℚ) • D.rational c) (hc : D.Central (D.rational c)) :
    (2 : ℚ) • CentralNewtonOnJ.morphism D b = D.rational c := by sorry
-- TauCeti.BunG.CentralNewtonOnJ.testUnit
example (D : LocalDatum.{u}) (h1 : D.newtonRep 1 = 0) : CentralNewtonOnJ.morphism D 1 = 0 := h1
-- TauCeti.BunG.CentralNewtonOnJ.testNonbasic: `(1,0)` is noncentral in `GL₂`.
example (D : LocalDatum.{u}) (b : D.Pt) (i : D.Simple)
    (h : D.simpleRoot i (D.newtonRep b) ≠ 0) : ¬ D.Central (CentralNewtonOnJ.morphism D b) := by
  sorry

/-- `ν_{b,J}`. -/
def CentralNewtonOnJ (D : LocalDatum.{u}) (b : D.Pt) : D.RatCochar := CentralNewtonOnJ.morphism D b

/-! ### BG0/sigma-centralizer-J-b over the local datum -/
/-- `J_b(E)`: the σ-stabilizer `{g ∈ G(L) | g b = b σ(g)}`. -/
abbrev SigmaCentralizer (D : LocalDatum.{u}) (b : D.Pt) : Subgroup D.Pt :=
  SigmaCentralizer.points D.frob b
/-- `J_b ⊗ L ≅ M_b = Z_G(ν_b)` with descent datum `Ad(b)σ`: `J_b(E)` lies in `M_b(L)`, `Ad(b)σ`
preserves `M_b(L)`, and `J_b(E)` is its fixed group. -/
theorem SigmaCentralizer.baseChange (D : LocalDatum.{u}) (b : D.Pt) :
    SigmaCentralizer D b ≤ D.newtonLevi b ∧
      (∀ g ∈ D.newtonLevi b, b * D.frob g * b⁻¹ ∈ D.newtonLevi b) ∧
      ∀ g ∈ D.newtonLevi b, (g ∈ SigmaCentralizer D b ↔ b * D.frob g * b⁻¹ = g) := by sorry
/-- `h ↦ g h g⁻¹ : J_b ≅ J_{g b σ(g)⁻¹}`. -/
def SigmaCentralizer.conjugate (D : LocalDatum.{u}) (b g : D.Pt) :
    SigmaCentralizer D b ≃* SigmaCentralizer D (twistedConjugate D.frob g b) :=
  SigmaCentralizer.conjugateEquiv D.frob b g
/-- BG0/sigma-centralizer-conjugacy. -/
theorem SigmaCentralizerConjugacy (D : LocalDatum.{u}) (b g h : D.Pt) :
    h ∈ SigmaCentralizer D b ↔ g * h * g⁻¹ ∈ SigmaCentralizer D (twistedConjugate D.frob g b) :=
  SigmaCentralizer.conjugate_points D.frob b g h

/-! ### BG0/decent-representative and its existence -/
structure DecentRepresentative (D : LocalDatum.{u}) (b : D.Pt) where
  r : ℕ
  r_pos : 0 < r
  slope : D.Cochar
  slope_eq : D.rational slope = (r : ℚ) • D.newtonRep b
  equation : frobeniusNorm D.frob b r = D.atUniformizer slope
namespace DecentRepresentative
variable {D : LocalDatum.{u}} {b : D.Pt}
theorem equation' (d : DecentRepresentative D b) :
    frobeniusNorm D.frob b d.r = D.atUniformizer d.slope := d.equation
def multiple (d : DecentRepresentative D b) (k : ℕ) (hk : 0 < k)
    (hmul : ∀ lam, D.atUniformizer ((k : ℤ) • lam) = frobeniusNorm D.frob (D.atUniformizer lam) k) :
    DecentRepresentative D b := by sorry
/-- Finite unramified descent: a decent `b` lies in `G(E_r)`, the points fixed by `σ^r`. -/
theorem finiteDescent (d : DecentRepresentative D b) :
    ((D.frob : D.Pt → D.Pt)^[d.r]) b = b := by sorry
end DecentRepresentative
-- TauCeti.BunG.DecentRepresentative.testRankOne
example (D : LocalDatum.{u}) (m : D.Cochar) (hν : D.newtonRep (D.atUniformizer m) = D.rational m) :
    Nonempty (DecentRepresentative D (D.atUniformizer m)) := by sorry
-- TauCeti.BunG.DecentRepresentative.testUnit
example (D : LocalDatum.{u}) (h1 : D.newtonRep 1 = 0) (h0 : D.atUniformizer 0 = 1) :
    Nonempty (DecentRepresentative D 1) := by sorry
-- TauCeti.BunG.DecentRepresentative.testPositivePeriod
example (D : LocalDatum.{u}) (b : D.Pt) (d : DecentRepresentative D b) : d.r ≠ 0 := by sorry

theorem ExistenceOfDecentRepresentative (D : LocalDatum.{u}) (x : D.BofG) :
    ∃ b, SigmaClass.mk D.frob b = x ∧ Nonempty (DecentRepresentative D b) := by sorry

/-! ### BG0/defect -/
namespace Defect
variable (D : LocalDatum.{u})
def value (b : D.Pt) : ℤ := (D.rank : ℤ) - D.jRank b
theorem conjugate (hJ : ∀ g b, D.jRank (twistedConjugate D.frob g b) = D.jRank b) (g b : D.Pt) :
    value D (twistedConjugate D.frob g b) = value D b := by sorry
theorem product {D₁ D₂ D₁₂ : LocalDatum.{u}} (hr : D₁₂.rank = D₁.rank + D₂.rank)
    (b : D₁₂.Pt) (b₁ : D₁.Pt) (b₂ : D₂.Pt) (hj : D₁₂.jRank b = D₁.jRank b₁ + D₂.jRank b₂) :
    value D₁₂ b = value D₁ b₁ + value D₂ b₂ := by sorry
end Defect
-- TauCeti.BunG.Defect.testUnit: split `GL_n`, `b = 1`, `J_1 = GL_n`.
example (D : LocalDatum.{u}) (h : D.jRank 1 = D.rank) : Defect.value D 1 = 0 := by sorry
-- TauCeti.BunG.Defect.testHalf: ranks `2` and `1`.
example (D : LocalDatum.{u}) (b : D.Pt) (h2 : D.rank = 2) (h1 : D.jRank b = 1) :
    Defect.value D b = 1 := by sorry
-- TauCeti.BunG.Defect.testSplitNonbasic: `J_b` a split rank-two torus.
example (D : LocalDatum.{u}) (b : D.Pt) (h2 : D.rank = 2) (hJ : D.jRank b = 2)
    (hb : ¬ Basic D (SigmaClass.mk D.frob b)) : Defect.value D b = 0 := by sorry

def Defect (D : LocalDatum.{u}) (b : D.Pt) : ℤ := Defect.value D b

/-! ### BG1/torus-norm-description -/
theorem TorusNormDescription (D : LocalDatum.{u}) (hT : D.IsTorus) :
    Function.Bijective (Invariants.kottwitz D) ∧
    ∀ (lam : D.Cochar) (x : D.BofG), Invariants.kottwitz D x =
      Representation.Coinvariants.mk _ (D.piClass lam) →
      Invariants.newtonRat D x =
        (Fintype.card D.Gal : ℚ)⁻¹ • ∑ γ : D.Gal, D.galAct γ (D.rational lam) := by sorry

/-! ### BG1/torus-special-pair, elliptic tori and transfer -/
/-- A maximal torus `j : T → G` is elliptic modulo the centre: its Γ-fixed rational
cocharacters are central in `G`. -/
def IsElliptic {T D : LocalDatum.{u}} (j : LocalDatum.Hom T D) : Prop :=
  ∀ ν, T.GalFixed ν → D.Central (j.rat ν)
structure TorusSpecial {T D : LocalDatum.{u}} (j : LocalDatum.Hom T D) (μ : D.Cochar)
    (x : D.BofG) where
  μT : T.Cochar
  inClass : D.dominantCochar (j.cochar μT) = D.dominantCochar μ
  classT : T.BofG
  classT_kottwitz : Invariants.kottwitz T classT = Representation.Coinvariants.mk _ (T.piClass μT)
  image : SigmaClass.map _ _ j.pt j.pt_frob classT = x
namespace TorusSpecial
variable {T D : LocalDatum.{u}} (j : LocalDatum.Hom T D)
def mk' (μ : D.Cochar) (x : D.BofG) (μT : T.Cochar)
    (hμ : D.dominantCochar (j.cochar μT) = D.dominantCochar μ) (c : T.BofG)
    (hc : Invariants.kottwitz T c = Representation.Coinvariants.mk _ (T.piClass μT))
    (hx : SigmaClass.map _ _ j.pt j.pt_frob c = x) : TorusSpecial j μ x :=
  ⟨μT, hμ, c, hc, hx⟩
def witness {μ : D.Cochar} {x : D.BofG} (w : TorusSpecial j μ x) : T.Cochar × T.BofG :=
  (w.μT, w.classT)
theorem newton (hT : T.IsTorus) {μ : D.Cochar} {x : D.BofG} (w : TorusSpecial j μ x) :
    Invariants.newtonRat D x = D.dominantRat (j.rat
      ((Fintype.card T.Gal : ℚ)⁻¹ • ∑ γ : T.Gal, T.galAct γ (T.rational w.μT))) := by sorry
def ellipticBasic (hT : T.IsTorus) (he : IsElliptic j) (μ : D.Cochar) (x : D.BofG)
    (hx : Acceptable D μ x) (hb : Basic D x) : TorusSpecial j μ x := by sorry
end TorusSpecial
-- TauCeti.BunG.TorusSpecial.testSplitGL1: `G = T = G_m`, `μ = m` gives the class of `p^m`.
example (D : LocalDatum.{u}) (hT : D.IsTorus)
    (hdom : ∀ b, D.dominantRat (D.newtonRep b) = D.newtonRep b) (hdomc : ∀ c, D.dominantCochar c = c)
    (m : D.Cochar)
    (hκ : Invariants.representativeKottwitz D (D.atUniformizer m) = D.piClass m) :
    Nonempty (TorusSpecial (LocalDatum.Hom.id D hdom) m
      (SigmaClass.mk D.frob (D.atUniformizer m))) := by sorry
-- TauCeti.BunG.TorusSpecial.testZero
example {T D : LocalDatum.{u}} (j : LocalDatum.Hom T D) (h0 : D.dominantCochar 0 = 0) :
    Nonempty (TorusSpecial j 0 (SigmaClass.mk D.frob 1)) := by sorry
-- TauCeti.BunG.TorusSpecial.testSplitTorus: a split torus only produces Newton points of integral
-- cocharacters, so the basic slope `1/2` class of `GL₂` has no witness.
example {T D : LocalDatum.{u}} (j : LocalDatum.Hom T D) (hT : T.IsTorus)
    (hsplit : ∀ γ, T.galAct γ = 1) (μ : D.Cochar) (x : D.BofG)
    (hx : ∀ μT : T.Cochar, D.dominantRat (j.rat (T.rational μT)) ≠ Invariants.newtonRat D x) :
    IsEmpty (TorusSpecial j μ x) := by sorry

theorem EllipticTorusBasicImage {T D : LocalDatum.{u}} (j : LocalDatum.Hom T D)
    (hT : T.IsTorus) (he : IsElliptic j) :
    Set.range (SigmaClass.map _ _ j.pt j.pt_frob) = {x | Basic D x} := by sorry

theorem TransferredTorusSpecialness {T D : LocalDatum.{u}} (j : LocalDatum.Hom T D)
    (hT : T.IsTorus) (μ : D.Cochar) (b : D.Pt) (w : RationalNewtonWitness D b)
    (hacc : Acceptable D μ (SigmaClass.mk D.frob b))
    (htransfer : IsQuasiSplit D ∨ IsElliptic j) :
    ∃ s : TorusSpecial j μ (SigmaClass.mk D.frob b),
      j.rat ((Fintype.card T.Gal : ℚ)⁻¹ • ∑ γ : T.Gal, T.galAct γ (T.rational s.μT)) = w.ν := by
  sorry

/-! ### Levi data (RG2.4 standard Levi of the quasi-split form) -/
structure StandardLevi (D : LocalDatum.{u}) where
  J : Set D.Simple
  M : LocalDatum.{u}
  incl : LocalDatum.Hom M D
  simpleEquiv : M.Simple ≃ J
  coroot : ∀ i, incl.rat (M.simpleCoroot i) = D.simpleCoroot (simpleEquiv i)
  frobStable : ∀ g, g ∈ Set.range incl.pt → D.frob g ∈ Set.range incl.pt

theorem LeviNewtonFormula (D : LocalDatum.{u}) (hqs : IsQuasiSplit D) (L : StandardLevi D)
    (μ : D.Cochar) (μM : L.M.Cochar) (xM : L.M.BofG) (hb : Basic L.M xM)
    (hκ : Invariants.kottwitz L.M xM = HodgeInvariants.sharp L.M μM)
    (hπ : L.incl.pi (L.M.piClass μM) = D.piClass μ) :
    Acceptable D μ (SigmaClass.map _ _ L.incl.pt L.incl.pt_frob xM) ↔
      HodgeInvariants.diamond D μ -
        D.dominantRat (L.incl.rat (Invariants.newtonRat L.M xM)) ∈ D.corootCone := by sorry

theorem MinusculeBasicLeviLift (D : LocalDatum.{u}) (L : StandardLevi D) (μ : D.Cochar)
    (hmin : IsMinuscule D μ)
    (xM : L.M.BofG) (hb : Basic L.M xM)
    (hacc : Acceptable D μ (SigmaClass.map _ _ L.incl.pt L.incl.pt_frob xM)) :
    ∃ μM : L.M.Cochar, D.dominantCochar (L.incl.cochar μM) = D.dominantCochar μ ∧
      Acceptable L.M μM xM := by sorry

theorem BasicLeviFibreUniqueness (D : LocalDatum.{u}) (L : StandardLevi D) (x : D.BofG)
    (hx : Basic D x) :
    {y : L.M.BofG | SigmaClass.map _ _ L.incl.pt L.incl.pt_frob y = x}.Subsingleton := by sorry

theorem GeneralLeviNewtonComparison (D : LocalDatum.{u}) (hqs : IsQuasiSplit D)
    (L : StandardLevi D) (xM : L.M.BofG) :
    Invariants.newtonRat D (SigmaClass.map _ _ L.incl.pt L.incl.pt_frob xM) -
      L.incl.rat (Invariants.newtonRat L.M xM) ∈ D.corootCone := by sorry

/-! ### Iwahori–Weyl data (RG2.4) and the straight classification -/
structure IwahoriWeylDatum (D : LocalDatum.{u}) where
  W : Type u
  [group : Group W]
  frobW : W ≃* W
  length : W → ℕ
  lift : W →* D.Pt
  lift_frob : ∀ w, lift (frobW w) = D.frob (lift w)
  translation : Multiplicative D.Cochar →* W
  newtonW : W → D.RatCochar
attribute [instance] IwahoriWeylDatum.group
/-- σ-straight: `ℓ(w) = ⟨2ρ, ν_w⟩`. -/
def IwahoriWeylDatum.IsStraight {D : LocalDatum.{u}} (I : IwahoriWeylDatum D) (w : I.W) : Prop :=
  (I.length w : ℚ) = D.twoRho (I.newtonW w)

theorem StraightWeylClassification (D : LocalDatum.{u}) (I : IwahoriWeylDatum D) :
    Function.Bijective (fun c : {c : SigmaClass I.frobW // ∃ w, I.IsStraight w ∧
        c = SigmaClass.mk I.frobW w} => SigmaClass.map _ _ I.lift I.lift_frob c.1) ∧
    ∀ w, I.IsStraight w → Invariants.newtonRat D (SigmaClass.mk D.frob (I.lift w)) =
      D.dominantRat (I.newtonW w) := by sorry

theorem OrdinaryStraightTranslation (D : LocalDatum.{u}) (I : IwahoriWeylDatum D)
    (μ : D.Cochar) (x : D.BofG) (hx : Ordinary D μ x) :
    ∃ μ' : D.Cochar, D.dominantCochar μ' = D.dominantCochar μ ∧
      I.IsStraight (I.translation (Multiplicative.ofAdd μ')) ∧
      SigmaClass.mk D.frob (I.lift (I.translation (Multiplicative.ofAdd μ'))) = x ∧
      ∀ i, D.simpleRoot i (Invariants.newtonRat D x) = 0 → D.simpleRoot i (D.rational μ') = 0 :=
  by sorry

theorem OrdinaryDerivedIsogeny (D D' : LocalDatum.{u}) (f : LocalDatum.Hom D D')
    (hder : ∃ e : D.Simple ≃ D'.Simple, ∀ i, f.rat (D.simpleCoroot i) = D'.simpleCoroot (e i))
    (μ : D.Cochar) (μ' : D'.Cochar) (hμ : f.cochar μ = μ') :
    ((∃ x, Ordinary D μ x) ↔ ∃ y, Ordinary D' μ' y) ∧
    ∀ x, Acceptable D μ x → (Ordinary D μ x ↔ Ordinary D' μ' (SigmaClass.map _ _ f.pt f.pt_frob x)) :=
  by sorry

/-- A parahoric subgroup `𝒢(O_L) ⊂ G(L)`, Frobenius stable (RG2.3), with its admissible union. -/
structure ParahoricDatum (D : LocalDatum.{u}) where
  K : Subgroup D.Pt
  frobStable : ∀ k ∈ K, D.frob k ∈ K
  admissible : D.Cochar → Set D.Pt

theorem OrdinaryIntegralConjugacy (D : LocalDatum.{u}) (I : IwahoriWeylDatum D)
    (P : ParahoricDatum D) (μ : D.Cochar) (b : D.Pt) (hadm : b ∈ P.admissible μ)
    (hord : Ordinary D μ (SigmaClass.mk D.frob b)) :
    ∃ μ' : D.Cochar, ∃ k ∈ P.K, D.dominantCochar μ' = D.dominantCochar μ ∧
      I.IsStraight (I.translation (Multiplicative.ofAdd μ')) ∧
      twistedConjugate D.frob k b = I.lift (I.translation (Multiplicative.ofAdd μ')) := by sorry

/-! ### BG1/product-and-unramified-norm -/
/-- The norm for `G(F̆) = ∏_{i<d} H(F̆)` with Frobenius `(b₀,…,b_{d-1}) ↦ (b₁,…,b_{d-1},σ_E b₀)`:
`Nm(b) = b₀ b₁ ⋯ b_{d-1}`. Identifying the factors through `σ^i` instead gives the source's
`b₀ σ(b₁) ⋯ σ^{d-1}(b_{d-1})`. -/
def unramifiedNorm (H : LocalDatum.{u}) (d : ℕ) (b : Fin d → H.Pt) : H.Pt :=
  ((List.finRange d).map b).prod

theorem ProductAndUnramifiedNorm {D₁ D₂ D₁₂ : LocalDatum.{u}} (p₁ : LocalDatum.Hom D₁₂ D₁)
    (p₂ : LocalDatum.Hom D₁₂ D₂) (hprod : Function.Bijective (fun g => (p₁.pt g, p₂.pt g)))
    (hrank : D₁₂.rank = D₁.rank + D₂.rank)
    (H Res : LocalDatum.{u}) (d : ℕ) (hd : 0 < d) (factors : Res.Pt ≃* (Fin d → H.Pt))
    (hfrob : ∀ g (i : Fin d), factors (Res.frob g) i =
      if h : i.val + 1 < d then factors g ⟨i.val + 1, h⟩ else H.frob (factors g ⟨0, hd⟩)) :
    Function.Bijective (fun x : D₁₂.BofG => (SigmaClass.map _ _ p₁.pt p₁.pt_frob x,
      SigmaClass.map _ _ p₂.pt p₂.pt_frob x)) ∧
    (∀ b, D₁₂.jRank b = D₁.jRank (p₁.pt b) + D₂.jRank (p₂.pt b) →
      Defect.value D₁₂ b = Defect.value D₁ (p₁.pt b) + Defect.value D₂ (p₂.pt b)) ∧
    ∃ e : Res.BofG ≃ H.BofG, ∀ b, e (SigmaClass.mk Res.frob b) =
      SigmaClass.mk H.frob (unramifiedNorm H d (factors b)) ∧
      Defect.value Res b = Defect.value H (unramifiedNorm H d (factors b)) := by sorry

/-! ### BG1/abelianized-kottwitz-set and its identification -/
/-- The crossed-module coefficients `[G_sc(L^sep) → G(L^sep)]` with the Weil action, and the
discrete Weil `H¹` (ET.0 owner). -/
structure CrossedModuleCohomology (D : LocalDatum.{u}) where
  H1 : Type u
  [group : AddCommGroup H1]
  abelianize : D.BofG → H1
  torusModel : H1 ≃+ H1
  centerModel : H1 ≃+ H1
attribute [instance] CrossedModuleCohomology.group
abbrev AbelianizedClass {D : LocalDatum.{u}} (C : CrossedModuleCohomology D) := C.H1
namespace AbelianizedClass
variable {D : LocalDatum.{u}} (C : CrossedModuleCohomology D)
def abelianize : D.BofG → AbelianizedClass C := C.abelianize
def torusModel : AbelianizedClass C ≃+ AbelianizedClass C := C.torusModel
def centerModel : AbelianizedClass C ≃+ AbelianizedClass C := C.centerModel
def map {D' : LocalDatum.{u}} (C' : CrossedModuleCohomology D') (f : LocalDatum.Hom D D') :
    AbelianizedClass C →+ AbelianizedClass C' := by sorry
end AbelianizedClass
-- TauCeti.BunG.AbelianizedClass.testTorus
example (D : LocalDatum.{u}) (C : CrossedModuleCohomology D) (hT : D.IsTorus) :
    Function.Bijective (AbelianizedClass.abelianize C) := by sorry
-- TauCeti.BunG.AbelianizedClass.testSLn
example (D : LocalDatum.{u}) (C : CrossedModuleCohomology D) (hsc : Subsingleton D.Pi) :
    Subsingleton (AbelianizedClass C) := by sorry
-- TauCeti.BunG.AbelianizedClass.testPGLn: `B_ab(PGL_n) = ℤ/n`, nonzero torsion.
example (D : LocalDatum.{u}) (C : CrossedModuleCohomology D) (n : ℕ) (hn : 1 < n)
    (e : AbelianizedClass C ≃+ ZMod n) :
    Nontrivial (AbelianizedClass C) ∧ ∀ a : AbelianizedClass C, n • a = 0 := by sorry

theorem AbelianizationIdentification (D : LocalDatum.{u}) (C : CrossedModuleCohomology D) :
    ∃ e : AbelianizedClass C ≃+ KottwitzDescent.Target D.piFrob,
      ∀ x, e (AbelianizedClass.abelianize C x) = Invariants.kottwitz D x := by sorry

/-! ### BG1/rational-kottwitz-surjectivity, z-extensions, connected centre -/
theorem RationalKottwitzSurjectivity (D : LocalDatum.{u}) [CharZero D.E] :
    Function.Surjective (fun g : D.rationalPoints =>
      (⟨(D.kappaTilde.representative g.1).toAdd, by sorry⟩ :
        {a : D.Pi // D.piFrob a = a})) := by sorry

/-- A z-extension `G̃ → G` with induced central torus kernel (upstream RG2.1.5 `IsZExtension`). -/
structure ZExtension (D : LocalDatum.{u}) where
  Dt : LocalDatum.{u}
  proj : LocalDatum.Hom Dt D
  surj : Function.Surjective proj.pt
  kernelTorus : LocalDatum.{u}
  kernelIncl : LocalDatum.Hom kernelTorus Dt
  kernel_isTorus : kernelTorus.IsTorus
  kernel_eq : Set.range kernelIncl.pt = proj.pt.ker
  /-- Induced torus: its cocharacters are a permutation Galois module. -/
  kernel_induced : ∃ (B : Type u) (perm : kernelTorus.Gal →* Equiv.Perm B)
    (e : (B →₀ ℤ) ≃+ kernelTorus.Cochar),
    ∀ γ f, kernelTorus.galCochar γ (e f) = e (Finsupp.mapDomain (perm γ) f)

theorem ComponentCoset.liftZExtension (D : LocalDatum.{u}) (Z : ZExtension D) (bt : Z.Dt.Pt)
    (μt : Z.Dt.Cochar) (d : Z.Dt.Pi) [CharZero D.E] :
    Set.SurjOn Z.proj.pi (ComponentCoset Z.Dt.piFrob d)
      (ComponentCoset D.piFrob (Z.proj.pi d)) := by sorry

theorem ZExtensionBoundedLifting (D : LocalDatum.{u}) (Z : ZExtension D) (μ : D.Cochar)
    (μt : Z.Dt.Cochar) (hμ : Z.proj.cochar μt = μ) (x : D.BofG) (hx : Acceptable D μ x)
    [CharZero D.E] :
    ∃ xt : Z.Dt.BofG, Acceptable Z.Dt μt xt ∧
      SigmaClass.map _ _ Z.proj.pt Z.proj.pt_frob xt = x := by sorry

/-- With connected centre, `B(G)_basic → B(G_ad)_basic ≅ H¹(E, G_ad)` is surjective; the
second identification is `b ↦ J_b` (ET.0 owner). -/
theorem ConnectedCenterBasicInnerForms (D Dad Zc : LocalDatum.{u}) (ad : LocalDatum.Hom D Dad)
    (z : LocalDatum.Hom Zc D) (hZ : Zc.IsTorus)
    (hcentre : Set.range z.pt = (Subgroup.center D.Pt : Set D.Pt)) :
    ∀ y : Dad.BofG, Basic Dad y → ∃ x : D.BofG, Basic D x ∧
      SigmaClass.map _ _ ad.pt ad.pt_frob x = y := by sorry

/-! ### BG1/gl-minuscule-quasisplit-centralizer -/
/-- For `GL_n` and `μ = (1^{n-q}, 0^q)`, the class of `diag(π^{-1}, …, 1, …)` is the unique class
of `B(GL_n, {μ⁻¹})` with quasi-split `J_b`; the GL slope data is the native `GLnSlopeData`. -/
theorem GlMinusculeQuasisplitCentralizer (D : LocalDatum.{u}) (n : ℕ)
    (hGL : ∃ (L : Type u) (_ : Field L), Nonempty (D.Pt ≃* Matrix.GeneralLinearGroup (Fin n) L))
    [CharZero D.E] (μ : D.Cochar) (hμ : IsMinuscule D μ)
    (Jd : D.BofG → LocalDatum.{u})
    (hJd : ∀ b, Nonempty ((Jd (SigmaClass.mk D.frob b)).rationalPoints ≃* SigmaCentralizer D b)) :
    (∀ x, Acceptable D (-μ) x → (IsQuasiSplit (Jd x) ↔ Ordinary D (-μ) x)) ∧
      ∃ x, Ordinary D (-μ) x := by sorry

/-! ### BG0/finite-frobenius-norm-centralizer: full form over the local datum -/
theorem FiniteFrobeniusNormCentralizer (D : LocalDatum.{u}) (r n : ℕ) (δ : D.Pt)
    (hper : ∀ g, ((D.frob : D.Pt → D.Pt)^[r]) g = g) (h : D.Pt)
    (hh : h ∈ SigmaCentralizer.points D.frob δ) :
    h * frobeniusNorm D.frob δ r = frobeniusNorm D.frob δ r * h ∧
      h * frobeniusNorm D.frob δ (r * n) = frobeniusNorm D.frob δ (r * n) * h := by sorry
end TauCeti.BunG

/-! ## Owner interfaces for the geometric layers (BG0, BG2, BG3, BG4)

The perfectoid site, the relative curve, its bundle categories and the v-stack predicates are
their owners' objects. As in the accepted DiamondsAndVStacks suggested file, they enter as named
parameters, gathered in `CurveSite` and `StackGeometry`; each field names its owner. Bundles on
`X_S` are VB1's exact `E`-linear symmetric tensor categories; v-stacks are Mathlib pseudofunctors
`LocallyDiscrete Perfᵒᵖ ⥤ᵖ Cat` with Mathlib's `IsStack` (D0). BG's own objects (`GBundle`,
`GIsocrystal`, `Bun`, the strata, `HNGraded`, `FullAutomorphism`, the charts) are defined or
stated on top of them. -/
noncomputable section
namespace TauCeti.BunG
open CategoryTheory CategoryTheory.Limits MonoidalCategory Bicategory
open scoped Pseudofunctor.StrongTrans
universe u

/-- A small exact `E`-linear symmetric tensor category. Owner instantiations: Tau Ceti
`FGPointRepresentationCat` (finite rational representations), VB0's finite isocrystals with
their exported exact tensor structure, VB1's vector bundles on a relative curve `X_S`. -/
structure ExactTensorCat (E : Type u) [Field E] where
  carrier : Type u
  [cat : Category.{u} carrier]
  [preadd : Preadditive carrier]
  [lin : Linear E carrier]
  [mon : MonoidalCategory carrier]
  [symm : SymmetricCategory carrier]
  [zero : HasZeroObject carrier]
  [biprod : HasBinaryBiproducts carrier]
  exact : TauCeti.ExactStructure carrier

namespace ExactTensorCat
attribute [instance] cat preadd lin mon symm zero biprod
end ExactTensorCat

variable {E : Type u} [Field E]

/-- Exact `E`-linear symmetric tensor functors `A → B`, with monoidal natural isomorphisms. -/
abbrev TensorFunctors (A B : ExactTensorCat E) : Type u :=
  TensorInterface.Data E A.carrier B.carrier A.exact B.exact

instance (A B : ExactTensorCat E) : Groupoid (TensorFunctors A B) where
  Hom F G := TensorInterface.Iso F G
  id F := TensorInterface.Iso.refl F
  comp f g := TensorInterface.Iso.trans f g
  inv f := TensorInterface.Iso.symm f
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry
  inv_comp := by sorry
  comp_inv := by sorry

/-- Owner interface for the curve side. `Perf`, `vTop`, `proetTop`, `sp` and `GeomPoint` are
DiamondsAndVStacks D1–D2 (perfectoid spaces over `F_q`, the v- and pro-étale topologies, the
underlying space, geometric points `Spa C`); `bundles`, `pullback`, `structureSheaf`, `isoc` and
`ofIsocrystal` are VB1 over RelativeFarguesFontaine RF2 (bundles on `X_S`, pullback along
`X_T → X_S`, `V ↦ V ⊗ O_{X_S}`, VB0's isocrystals and the isocrystal-to-bundle functor);
`isocRank`, `isocSlope`, `brauerInv` are VB0's rank, slope of an isoclinic isocrystal and the
arithmetic invariant of its endomorphism algebra;
`slopes` is the VB2/VB4 Harder–Narasimhan slope multiset at a geometric point. -/
structure CurveSite (E : Type u) [Field E] where
  Perf : Type u
  [cat : Category.{u} Perf]
  vTop : GrothendieckTopology Perf
  proetTop : GrothendieckTopology Perf
  sp : Perf ⥤ TopCat.{u}
  GeomPoint : Type u
  geomPt : GeomPoint → Perf
  IsStrictlyTotallyDisconnected : Perf → Prop
  IsAffinoid : Perf → Prop
  bundles : Perf → ExactTensorCat E
  pullback : ∀ {S T : Perf}, (T ⟶ S) → TensorFunctors (bundles S) (bundles T)
  pullbackId : ∀ S, pullback (𝟙 S) ≅ TensorInterface.Data.identity (bundles S).exact
  pullbackComp : ∀ {S T U : Perf} (f : T ⟶ S) (g : U ⟶ T),
    pullback (g ≫ f) ≅ (pullback f).postcompose (pullback g)
  vect : ExactTensorCat E
  structureSheaf : ∀ S, TensorFunctors vect (bundles S)
  isoc : ExactTensorCat E
  ofIsocrystal : ∀ S, TensorFunctors isoc (bundles S)
  isocRank : isoc.carrier → ℕ
  isocSlope : isoc.carrier → ℚ
  brauerInv : isoc.carrier → ℚ
  rank : ∀ S, (bundles S).carrier → ℕ
  degree : ∀ S, (bundles S).carrier → ℤ
  slopes : ∀ (x : GeomPoint), (bundles (geomPt x)).carrier → List ℚ

namespace CurveSite
attribute [instance] cat
end CurveSite

/-- Prestacks of groupoids on `Perf` (DiamondsAndVStacks D0 uses the same Mathlib carrier). -/
abbrev Prestack (X : CurveSite E) := LocallyDiscrete X.Perfᵒᵖ ⥤ᵖ Cat.{u, u}

end TauCeti.BunG

noncomputable section
namespace TauCeti.BunG
open CategoryTheory CategoryTheory.Limits MonoidalCategory Bicategory
open scoped Pseudofunctor.StrongTrans
universe u
variable {E : Type u} [Field E]

/-- Owner interface for v-stack geometry over a curve site. `terminal`, `classifying`,
`groupClassifying`, `coproduct`, `fibreProduct` are DiamondsAndVStacks D0/D3 (the point,
`[∗/H]` for a locally profinite `H`, `[∗/𝒢]` for a group v-sheaf, disjoint unions and
2-fibre products); `IsSmall`, `IsLocallySpatialDiamond`, `space` are D4; the morphism properties
are D3/D5 (immersions, separated, partially proper, proper, v-surjective, representable in locally
spatial diamonds); `IsArtin` and `CohSmooth` (ℓ-cohomologically smooth of ℓ-dimension `d`, ℓ ≠ p)
are VStackSheavesAndLisseCategories VS0; `coproductDesc`, `fibreSnd`, `spaceMap` and
`quotientByEndo` (quotient by a `ℤ`-action) are D0/D4. -/
structure StackGeometry (X : CurveSite E) where
  terminal : Prestack X
  classifying : ∀ (H : Type u) [Group H] [TopologicalSpace H], Prestack X
  groupClassifying : Prestack X → Prestack X
  coproduct : ∀ {ι : Type u}, (ι → Prestack X) → Prestack X
  fibreProduct : ∀ {F G H : Prestack X}, (F ⟶ H) → (G ⟶ H) → Prestack X
  IsSmall : Prestack X → Prop
  IsLocallySpatialDiamond : Prestack X → Prop
  IsArtin : Prestack X → Prop
  space : Prestack X → TopCat.{u}
  OpenImmersion : ∀ {F G : Prestack X}, (F ⟶ G) → Prop
  ClosedImmersion : ∀ {F G : Prestack X}, (F ⟶ G) → Prop
  LocallyClosedImmersion : ∀ {F G : Prestack X}, (F ⟶ G) → Prop
  Separated : ∀ {F G : Prestack X}, (F ⟶ G) → Prop
  PartiallyProper : ∀ {F G : Prestack X}, (F ⟶ G) → Prop
  Proper : ∀ {F G : Prestack X}, (F ⟶ G) → Prop
  VSurjective : ∀ {F G : Prestack X}, (F ⟶ G) → Prop
  ReprLSD : ∀ {F G : Prestack X}, (F ⟶ G) → Prop
  CohSmooth : ∀ {F G : Prestack X}, (F ⟶ G) → ℤ → Prop
  IsSpatialDiamond : Prestack X → Prop
  toTerminal : ∀ F : Prestack X, F ⟶ terminal
  coproductDesc : ∀ {ι : Type u} (F : ι → Prestack X) {G : Prestack X}, (∀ i, F i ⟶ G) →
    (coproduct F ⟶ G)
  fibreSnd : ∀ {F G H : Prestack X} (f : F ⟶ H) (g : G ⟶ H), fibreProduct f g ⟶ G
  spaceMap : ∀ {F G : Prestack X}, (F ⟶ G) → (space F → space G)
  quotientByEndo : ∀ F : Prestack X, (F ⟶ F) → Prestack X
  basePoint : ∀ (H : Type u) [Group H] [TopologicalSpace H], terminal ⟶ classifying H

variable (X : CurveSite E) (Rep : ExactTensorCat E)

/-! ### BG0/g-bundle -/
/-- `G`-bundles on `X_S`: exact `E`-linear tensor functors `Rep_E(G) → Bun(X_S)` (FS III.1). -/
abbrev GBundle (S : X.Perf) := TensorFunctors Rep (X.bundles S)
namespace GBundle
variable {X Rep}
/-- The trivial bundle: the fibre functor followed by `V ↦ V ⊗ O_{X_S}`. -/
def trivial (fibre : TensorFunctors Rep X.vect) (S : X.Perf) : GBundle X Rep S :=
  fibre.postcompose (X.structureSheaf S)
def evaluate {S : X.Perf} (F : GBundle X Rep S) (V : Rep.carrier) : (X.bundles S).carrier :=
  TensorInterface.Data.evaluate F V
def tensorIso {S : X.Perf} {F G : GBundle X Rep S} (α : F ⟶ G) : TensorInterface.Iso F G := α
def pullback {S T : X.Perf} (f : T ⟶ S) : GBundle X Rep S ⥤ GBundle X Rep T where
  obj F := F.postcompose (X.pullback f)
  map α := by sorry
  map_id := by sorry
  map_comp := by sorry
theorem pullback_obj {S T : X.Perf} (f : T ⟶ S) (F : GBundle X Rep S) (V : Rep.carrier) :
    ((pullback f).obj F).evaluate V = (X.pullback f).evaluate (F.evaluate V) := by sorry
theorem tensorIso_ext {S : X.Perf} {F G : GBundle X Rep S} (α β : F ⟶ G)
    (h : ∀ V, (tensorIso α).iso.hom.app V = (tensorIso β).iso.hom.app V) : α = β := by sorry
theorem evaluate_rank {S : X.Perf} (F : GBundle X Rep S) (fibre : TensorFunctors Rep X.vect)
    (dimE : X.vect.carrier → ℕ) (hrk : ∀ W, X.rank S ((X.structureSheaf S).evaluate W) = dimE W)
    (V : Rep.carrier) : X.rank S (F.evaluate V) = dimE (fibre.evaluate V) := by sorry
end GBundle
open scoped ZeroObject in
-- TauCeti.BunG.GBundle.testGL1: for `G_m` (Rep generated by the tensor powers `pow n` of the
-- standard character), evaluation at `pow 1` lands in line bundles and detects isomorphism.
example (S : X.Perf) (pow : ℤ → Rep.carrier)
    (hpow : ∀ m n, Nonempty (pow (m + n) ≅ pow m ⊗ pow n))
    (hgen : ∀ V : Rep.carrier, ∃ l : List ℤ, Nonempty (V ≅ (l.map pow).foldr (· ⊞ ·) 0))
    (fibre : TensorFunctors Rep X.vect) (dimE : X.vect.carrier → ℕ)
    (hdim : dimE (fibre.evaluate (pow 1)) = 1)
    (hrk : ∀ W, X.rank S ((X.structureSheaf S).evaluate W) = dimE W) (F G : GBundle X Rep S) :
    X.rank S (GBundle.evaluate F (pow 1)) = 1 ∧
      (Nonempty (F ≅ G) ↔ Nonempty (GBundle.evaluate F (pow 1) ≅ GBundle.evaluate G (pow 1))) := by
  sorry
open scoped ZeroObject in
-- TauCeti.BunG.GBundle.testTrivial: `G = 1`, every representation is a sum of units.
example (S : X.Perf)
    (hgen : ∀ V : Rep.carrier, ∃ n : ℕ,
      Nonempty (V ≅ (List.replicate n (𝟙_ Rep.carrier)).foldr (· ⊞ ·) 0))
    (F G : GBundle X Rep S) : Nonempty (F ≅ G) ∧ Subsingleton (F ⟶ G) := by sorry
-- TauCeti.BunG.GBundle.testNoFaithfulChoice: the value on `std ⊞ det` is determined by the values
-- on `std` and `det`, and the tensor constraint is part of the data; unrelated bundles on the
-- objects of `Rep` do not form a `G`-bundle.
example (S : X.Perf) (F : GBundle X Rep S) (std det : Rep.carrier) :
    Nonempty (GBundle.evaluate F (std ⊞ det) ≅ GBundle.evaluate F std ⊞ GBundle.evaluate F det) ∧
      Nonempty (GBundle.evaluate F (std ⊗ det) ≅ GBundle.evaluate F std ⊗ GBundle.evaluate F det)
  := by sorry

/-! ### BG0/g-isocrystals-and-B-of-G (untrivialized form over VB0's isocrystal category) -/
/-- `G`-isocrystals: exact tensor functors `Rep_E(G) → Isoc_E`. -/
abbrev GIsocrystal := TensorFunctors Rep X.isoc
/-- Owner interface realizing a representative `b ∈ G(L)` as the isocrystal `ρ ↦ (Vρ ⊗ L, ρ(b)σ)`
(Tau Ceti representation action, VB0 isocrystal category; the native trivialized form is
`RepresentativeTensor.ofRepresentative`). -/
structure IsocrystalRealization (D : LocalDatum.{u}) where
  ofPoint : D.Pt → GIsocrystal X Rep
  conj : ∀ g b, ofPoint b ≅ ofPoint (twistedConjugate D.frob g b)
  underlying : ExactTensorCat E
  forget : TensorFunctors X.isoc underlying
/-- `J_b(E)` is the tensor automorphism group of the `G`-isocrystal of `b`. -/
theorem SigmaCentralizer.autIsocrystal {D : LocalDatum.{u}} (R : IsocrystalRealization X Rep D)
    (b : D.Pt) : Nonempty (Aut (R.ofPoint b) ≃* SigmaCentralizer D b) := by sorry

namespace GIsocrystal
variable {X Rep} {D : LocalDatum.{u}} (R : IsocrystalRealization X Rep D)
def ofRepresentative (b : D.Pt) : GIsocrystal X Rep := R.ofPoint b
def forget (F : GIsocrystal X Rep) : TensorFunctors Rep R.underlying := F.postcompose R.forget
def changeTrivialization (g b : D.Pt) :
    ofRepresentative R b ≅ ofRepresentative R (twistedConjugate D.frob g b) := R.conj g b
def map {Rep' : ExactTensorCat E} (res : TensorFunctors Rep' Rep) (F : GIsocrystal X Rep) :
    GIsocrystal X Rep' := res.postcompose F
theorem iso_iff (b c : D.Pt) (hfull : ∀ b c, Nonempty (R.ofPoint b ≅ R.ofPoint c) →
      ∃ g, c = twistedConjugate D.frob g b) :
    Nonempty (ofRepresentative R b ≅ ofRepresentative R c) ↔
      SigmaClass.mk D.frob b = SigmaClass.mk D.frob c := by sorry
end GIsocrystal
-- TauCeti.BunG.GIsocrystal.testGLn: for `GL_n` over `ℚ_p` the standard representation gives an
-- `n`-dimensional isocrystal for every `b` (VB0 compares these with Mathlib's
-- `WittVector.Isocrystal` over `FractionRing (WittVector p k)`).
example (D : LocalDatum.{u}) (R : IsocrystalRealization X Rep D) (std : Rep.carrier) (n : ℕ)
    (h1 : X.isocRank ((R.ofPoint 1).evaluate std) = n) (b : D.Pt) :
    X.isocRank ((GIsocrystal.ofRepresentative R b).evaluate std) = n := by sorry
-- TauCeti.BunG.GIsocrystal.testUnit: `b = 1` gives the unit Frobenius `1 ⊗ σ`.
example (D : LocalDatum.{u}) (R : IsocrystalRealization X Rep D) (unitIsoc : GIsocrystal X Rep)
    (h1 : R.ofPoint 1 = unitIsoc) : GIsocrystal.ofRepresentative R 1 = unitIsoc := by sorry
-- TauCeti.BunG.GIsocrystal.testTensorSlope: for `G_m`, `π^a ⊗ π^b` has slope `a + b`, the dual
-- of `π^a` slope `-a` (VB0 `tensor-and-dual-slopes`).
example (D : LocalDatum.{u}) (hT : D.IsTorus) (a b : D.Cochar)
    (hmul : D.atUniformizer (a + b) = D.atUniformizer a * D.atUniformizer b)
    (hν : ∀ c, D.newtonRep (D.atUniformizer c) = D.rational c) :
    D.newtonRep (D.atUniformizer a * D.atUniformizer b) = D.rational a + D.rational b ∧
      D.newtonRep (D.atUniformizer (-a)) = -D.rational a := by sorry

/-! ### BG0/g-torsors-three-descriptions and structure-group descent -/
/-- Owner interface for torsors on `X_S` (AlgebraicModuliForArithmeticGeometry R09.3, D3): the
groupoids of geometric étale-locally trivial torsors and of étale sheaf torsors, and `H¹_et`. -/
structure TorsorDescriptions where
  geometric : X.Perf → Type u
  [geomGpd : ∀ S, Groupoid.{u} (geometric S)]
  sheaf : X.Perf → Type u
  [sheafGpd : ∀ S, Groupoid.{u} (sheaf S)]
  H1 : X.Perf → Type u
attribute [instance] TorsorDescriptions.geomGpd TorsorDescriptions.sheafGpd

theorem GTorsorsThreeDescriptions (T : TorsorDescriptions X) (S : X.Perf) :
    Nonempty (T.geometric S ≌ T.sheaf S) ∧ Nonempty (T.sheaf S ≌ GBundle X Rep S) ∧
      Nonempty (Quotient (isIsomorphicSetoid (GBundle X Rep S)) ≃ T.H1 S) := by sorry

/-- Extension of structure group along `G → H`: precomposition with restriction `Rep(H) → Rep(G)`. -/
def GBundle.extend {Rep' : ExactTensorCat E} (res : TensorFunctors Rep' Rep) (S : X.Perf) :
    GBundle X Rep S ⥤ GBundle X Rep' S where
  obj F := res.postcompose F
  map α := by sorry
  map_id := by sorry
  map_comp := by sorry

theorem StructureGroupAndTensorDescent {Rep' Rep'' : ExactTensorCat E}
    (res : TensorFunctors Rep' Rep) (res' : TensorFunctors Rep'' Rep') {S T : X.Perf}
    (f : T ⟶ S) :
    Nonempty (GBundle.extend X Rep res S ⋙ GBundle.pullback f ≅
      GBundle.pullback f ⋙ GBundle.extend X Rep res T) ∧
    Nonempty (GBundle.extend X Rep (res'.postcompose res) S ≅
      GBundle.extend X Rep res S ⋙ GBundle.extend X Rep' res' S) := by sorry

/-! ### BG2:uniformization/bun-g-as-v-stack -/

namespace Bun
variable {X Rep}
/-- `Bun_G(S)`: the groupoid of `G`-bundles on `X_S`, keeping all isomorphisms. -/
abbrev objects (S : X.Perf) := GBundle X Rep S
def pullback {S T : X.Perf} (f : T ⟶ S) : objects (Rep := Rep) S ⥤ objects (Rep := Rep) T :=
  GBundle.pullback f
def pullback_id (S : X.Perf) : pullback (Rep := Rep) (𝟙 S) ≅ 𝟭 _ := by sorry
def pullback_comp {S T U : X.Perf} (f : T ⟶ S) (g : U ⟶ T) :
    pullback (Rep := Rep) (g ≫ f) ≅ pullback f ⋙ pullback g := by sorry
variable (X Rep)
/-- The prestack `S ↦ Bun_G(S)`; its object and arrow components are `objects` and `pullback`,
with coherence `pullback_id`, `pullback_comp`. -/
def stack (X : CurveSite E) (Rep : ExactTensorCat E) : Prestack X := by sorry
theorem stack_obj (S : X.Perf) :
    (stack X Rep).obj ⟨Opposite.op S⟩ = Cat.of (objects (X := X) (Rep := Rep) S) := by sorry
theorem isStack : (stack X Rep).IsStack X.vTop := by sorry
variable {X Rep}
/-- The constant bundle `E_b` of a `G`-isocrystal on every `X_S`. -/
def ofIsocrystal (F : GIsocrystal X Rep) (S : X.Perf) : objects (Rep := Rep) S :=
  F.postcompose (X.ofIsocrystal S)
/-- The diagonal fibre: `T ↦ Isom(f^*E₁, f^*E₂)` over `S`. -/
def isomSheaf {S : X.Perf} (E₁ E₂ : objects (Rep := Rep) S) :
    (Over S)ᵒᵖ ⥤ Type u where
  obj T := (pullback T.unop.hom).obj E₁ ⟶ (pullback T.unop.hom).obj E₂
  map φ := by sorry
  map_id := by sorry
  map_comp := by sorry
/-- GAGA on affinoid `S`: VB2's analytification `an` of algebraic curve bundles, an equivalence
there (`gaga-equivalence`), induces the equivalence on `G`-bundles. -/
def gaga (alg : X.Perf → ExactTensorCat E) (an : ∀ S, TensorFunctors (alg S) (X.bundles S))
    (S : X.Perf) (hS : X.IsAffinoid S) (hVB : (an S).functor.IsEquivalence) :
    TensorFunctors Rep (alg S) ≌ objects (Rep := Rep) S := by sorry
end Bun
/-- `Bun_G` as a prestack on `Perf`. -/
abbrev Bun (X : CurveSite E) (Rep : ExactTensorCat E) : Prestack X := Bun.stack X Rep

-- TauCeti.BunG.Bun.testGLn: for `GL_n`, objects are rank-`n` bundles with all isomorphisms.
example (S : X.Perf) (std : Rep.carrier) (n : ℕ) (fibre : TensorFunctors Rep X.vect)
    (dimE : X.vect.carrier → ℕ) (hstd : dimE (fibre.evaluate std) = n)
    (hrk : ∀ W, X.rank S ((X.structureSheaf S).evaluate W) = dimE W)
    (F : Bun.objects (X := X) (Rep := Rep) S) : X.rank S (GBundle.evaluate F std) = n := by sorry
-- TauCeti.BunG.Bun.testTrivial: for `G = 1` every `Bun_G(S)` is equivalent to the point.
example (hunit : ∀ V : Rep.carrier, Nonempty (V ≅ 𝟙_ Rep.carrier)) (S : X.Perf) :
    ∀ F G : Bun.objects (X := X) (Rep := Rep) S, Nonempty (F ≅ G) ∧ Subsingleton (F ⟶ G) := by
  sorry
-- TauCeti.BunG.Bun.testNonbasicHom: for `GL₂` slopes `0,1` the isocrystals of slopes `0` and `-1`
-- have no nonzero maps while `O → O(1)` has nonzero sections, so the constant-bundle functor is
-- not full on the ungraded categories.
example (S : X.Perf) (V W : X.isoc.carrier) (hiso : ∀ f : V ⟶ W, f = 0)
    (hbun : ∃ g : (X.ofIsocrystal S).evaluate V ⟶ (X.ofIsocrystal S).evaluate W, g ≠ 0) :
    ¬ (X.ofIsocrystal S).functor.Full := by sorry
-- TauCeti.BunG.Invariants.testSign: the line bundle of `π^m` has degree `-m` (`c₁(E_b) = -κ(b)`).
example (D : LocalDatum.{u}) (R : IsocrystalRealization X Rep D) (S : X.Perf) (χ : Rep.carrier)
    (e : D.Pi ≃+ ℤ) (m : D.Cochar) :
    X.degree S (GBundle.evaluate
      (Bun.ofIsocrystal (GIsocrystal.ofRepresentative R (D.atUniformizer m)) S) χ) =
        -e (D.piClass m) := by sorry
end TauCeti.BunG

noncomputable section
namespace TauCeti.BunG
open CategoryTheory CategoryTheory.Limits MonoidalCategory Bicategory
open scoped Pseudofunctor.StrongTrans
universe u
variable {E : Type u} [Field E]

/-- Owner interface for graded and filtered bundles (VB4): `ℚ`-graded and increasingly
`ℚ`-filtered bundles on `X_S` with their tensor structures, the forgetful functors, the
associated graded, the split filtration, the VB4 condition that each weight-`λ` piece is
semistable of slope `λ`, and the slope-reversed grading of `E_b`. -/
structure SlopeFiltrations (X : CurveSite E) where
  graded : X.Perf → ExactTensorCat E
  filtered : X.Perf → ExactTensorCat E
  forgetGrading : ∀ S, TensorFunctors (graded S) (X.bundles S)
  forgetFiltration : ∀ S, TensorFunctors (filtered S) (X.bundles S)
  assocGraded : ∀ S, TensorFunctors (filtered S) (graded S)
  splitFiltration : ∀ S, TensorFunctors (graded S) (filtered S)
  SemistablePieces : ∀ S, (graded S).carrier → Prop
  gradedOfIsocrystal : ∀ S, TensorFunctors X.isoc (graded S)
  filtrationSlopes : ∀ S, (filtered S).carrier → List ℚ

/-- Prestack morphisms that are objectwise equivalences of groupoids. -/
def IsObjectwiseEquiv {X : CurveSite E} {F G : Prestack X} (f : F ⟶ G) : Prop :=
  ∀ S : X.Perf, (f.app ⟨Opposite.op S⟩).toFunctor.IsEquivalence

/-- Owner interface for the affine Grassmannian and Beauville–Laszlo map (GS0, RF4): points of
`Gr_G` over `S`, restriction, open Schubert cells `Gr_μ`, the residue-field points of `S` (D1),
the modification map on points and as a prestack map, the component in `π₁(G)`, the quotients
`[G(E)\Gr_μ]` with their maps to `Bun_G`, and the flag variety's underlying space with its
geometric points (`Fℓ_{G,μ} ≅ Gr_μ` for minuscule `μ`). -/
structure GrassmannianInterface (X : CurveSite E) (SG : StackGeometry X) (Rep : ExactTensorCat E)
    (D : LocalDatum.{u}) where
  points : X.Perf → Type u
  restrict : ∀ {S T : X.Perf}, (T ⟶ S) → points S → points T
  schubertCell : D.Cochar → ∀ S, Set (points S)
  residuePoint : ∀ S, X.sp.obj S → X.Perf
  residueMap : ∀ S (s : X.sp.obj S), residuePoint S s ⟶ S
  blPoint : ∀ S, points S → Bun.objects (X := X) (Rep := Rep) S
  gr : Prestack X
  bl : gr ⟶ Bun.stack X Rep
  component : ∀ S, points S → D.Pi
  openCellQuotient : D.Cochar → Prestack X
  openCellToBun : ∀ μ, openCellQuotient μ ⟶ Bun.stack X Rep
  flagSpace : D.Cochar → TopCat.{u}
  flagPoint : ∀ μ (x : X.GeomPoint), schubertCell μ (X.geomPt x) → flagSpace μ
  flagPoint_surj : ∀ μ (p : flagSpace μ), ∃ x y, flagPoint μ x y = p

/-- The data of the geometric layers over a curve site: `Rep_E(G)`, the local datum, the
isocrystal realization, slope filtrations, `J_b(E)` and `G(E)` with their locally profinite
topologies (BG0 `SigmaCentralizer`; topology from D3). -/
structure BunContext (X : CurveSite E) where
  Rep : ExactTensorCat E
  D : LocalDatum.{u}
  R : IsocrystalRealization X Rep D
  Fl : SlopeFiltrations X
  J : D.Pt → Type u
  [jGroup : ∀ b, Group (J b)]
  [jTop : ∀ b, TopologicalSpace (J b)]
  jPoints : ∀ b, J b ≃* ↥(SigmaCentralizer.points D.frob b)
  Grat : Type u
  [gGroup : Group Grat]
  [gTop : TopologicalSpace Grat]
  gPoints : Grat ≃* ↥D.rationalPoints
  /-- Descending slopes of a rational cocharacter on a representation (Tau Ceti layer 1). -/
  weights : Rep.carrier → D.RatCochar → List ℚ
  /-- Sections over `X_S` of the parabolic group with the given roots, twisted by `E_{b_M}`. -/
  parabolicSections : Set (Module.Dual ℚ D.RatCochar) → X.Perf → Type u
  [parabolicGroup : ∀ P S, Group (parabolicSections P S)]
  /-- VB3: `BC((ad E_b)^λ)` over `S` (for `λ < 0` the `H¹` space `BC((ad E_b)^λ[1])`). -/
  bcAdjoint : D.Pt → X.Perf → ℚ → Type u
attribute [instance] BunContext.parabolicGroup
attribute [instance] BunContext.jGroup BunContext.jTop BunContext.gGroup BunContext.gTop

namespace BunContext
variable {X : CurveSite E} (C : BunContext X)
abbrev Bun := Bun.stack X C.Rep
abbrev Obj (S : X.Perf) := Bun.objects (X := X) (Rep := C.Rep) S
/-- Isomorphism classes of `G`-bundles on `X_C` for a geometric point. -/
abbrev PointClasses (x : X.GeomPoint) := Quotient (isIsomorphicSetoid (C.Obj (X.geomPt x)))
/-- `b ↦ [E_b]`, descended to `B(G)` along `IsocrystalRealization.conj`. -/
def classToPoint (x : X.GeomPoint) : C.D.BofG → C.PointClasses x :=
  SigmaClass.lift C.D.frob
    (fun b => Quotient.mk _ (Bun.ofIsocrystal (C.R.ofPoint b) (X.geomPt x))) (by sorry)
end BunContext

/-! ### BG2:uniformization/points-are-B-of-G -/
theorem PointsAreBOfG {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X) :
    (∀ x, Function.Bijective (C.classToPoint x)) ∧ Nonempty (SG.space C.Bun ≃ C.D.BofG) := by
  sorry

namespace BunContext
variable {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X)
/-- The geometric class of a bundle at a geometric point (inverse of `classToPoint`). -/
def geomClass (x : X.GeomPoint) (F : C.Obj (X.geomPt x)) : C.D.BofG :=
  Function.surjInv ((PointsAreBOfG SG C).1 x).2 (Quotient.mk _ F)
/-- `|Bun_G| ≃ B(G)`. -/
def spaceEquiv : SG.space C.Bun ≃ C.D.BofG := (PointsAreBOfG SG C).2.some
/-- The Newton topology on `B(G)`: the open sets are the lower sets of the Newton order. -/
@[reducible] def newtonTopology : TopologicalSpace C.D.BofG :=
  @Topology.lowerSet C.D.BofG (NewtonOrder.partialOrder C.D).toPreorder
/-- `S`-points all of whose geometric fibres have classes in `P`. -/
def ObjWithClasses (P : C.D.BofG → Prop) (S : X.Perf) : Type u :=
  {F : C.Obj S // ∀ (x : X.GeomPoint) (f : X.geomPt x ⟶ S),
    P (geomClass SG C x ((Bun.pullback f).obj F))}
/-- The full sub-prestack with these `S`-points (D3 sub-prestack). -/
def substack (SG : StackGeometry X) (C : BunContext X) (P : C.D.BofG → Prop) : Prestack X := by
  sorry
def substackIncl (SG : StackGeometry X) (C : BunContext X) (P : C.D.BofG → Prop) :
    substack SG C P ⟶ C.Bun := by sorry
theorem substack_obj (P : C.D.BofG → Prop) (S : X.Perf) :
    Nonempty (((substack SG C P).obj ⟨Opposite.op S⟩ : Type u) ≃ ObjWithClasses SG C P S) := by
  sorry
end BunContext

/-! ### BG2:uniformization/hn-sign-and-semicontinuity -/
theorem HnSignAndSemicontinuity {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X)
    (V det : C.Rep.carrier) :
    (∀ (x : X.GeomPoint) (b : C.D.Pt), X.slopes x
      (GBundle.evaluate (Bun.ofIsocrystal (C.R.ofPoint b) (X.geomPt x)) V) =
        ((C.weights V (C.D.newtonRep b)).map Neg.neg).reverse) ∧
    (∀ (x : X.GeomPoint) (b : C.D.Pt), (X.degree (X.geomPt x)
      (GBundle.evaluate (Bun.ofIsocrystal (C.R.ofPoint b) (X.geomPt x)) det) : ℚ) =
        -(C.weights det (C.D.newtonRep b)).sum) ∧
    ∀ k : ℕ, UpperSemicontinuous (fun p : SG.space C.Bun =>
      ((((C.weights V (Invariants.newtonRat C.D (C.spaceEquiv SG p))).map Neg.neg).reverse).take
        k).sum) := by sorry

/-! ### BG2:uniformization/strictly-disconnected-torsors -/
/-- Owner interface for pro-étale torsors under locally profinite groups (D3). -/
structure LocallyProfiniteTorsors (X : CurveSite E) where
  Tors : ∀ (H : Type u) [Group H] [TopologicalSpace H], X.Perf → Type u
  [gpd : ∀ (H : Type u) [Group H] [TopologicalSpace H] S, Groupoid.{u} (Tors H S)]
  trivial : ∀ (H : Type u) [Group H] [TopologicalSpace H] S, Tors H S
  representing : ∀ (H : Type u) [Group H] [TopologicalSpace H] S, Tors H S → X.Perf
attribute [instance] LocallyProfiniteTorsors.gpd

theorem StrictlyDisconnectedTorsors {X : CurveSite E} (T : LocallyProfiniteTorsors X)
    (H : Type u) [Group H] [TopologicalSpace H] [IsTopologicalGroup H] [T2Space H]
    [TotallyDisconnectedSpace H] [LocallyCompactSpace H] [FirstCountableTopology H]
    (S : X.Perf) :
    (X.IsStrictlyTotallyDisconnected S → ∀ P : T.Tors H S, Nonempty (P ≅ T.trivial H S)) ∧
      ∀ P : T.Tors H S, Nonempty (T.representing H S P ⟶ S) := by sorry

/-! ### BG2:uniformization/geometrically-trivial-locus -/
theorem GeometricallyTrivialLocus {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X) :
    SG.OpenImmersion (BunContext.substackIncl SG C (· = SigmaClass.mk C.D.frob 1)) ∧
    ∃ f : SG.classifying C.Grat ⟶ BunContext.substack SG C (· = SigmaClass.mk C.D.frob 1),
      IsObjectwiseEquiv f := by sorry

/-! ### BG2:uniformization/grassmannian-point-lifting and Beauville–Laszlo -/
theorem GrassmannianPointLifting {X : CurveSite E} {SG : StackGeometry X} {C : BunContext X}
    (Gr : GrassmannianInterface X SG C.Rep C.D) (S : X.Perf)
    (hS : X.IsStrictlyTotallyDisconnected S) (s : X.sp.obj S) :
    Function.Surjective (Gr.restrict (Gr.residueMap S s)) := by sorry

theorem BeauvilleLaszloSurjectivity {X : CurveSite E} {SG : StackGeometry X} {C : BunContext X}
    (Gr : GrassmannianInterface X SG C.Rep C.D) :
    SG.VSurjective Gr.bl ∧ ∀ (x : X.GeomPoint) (F : C.Obj (X.geomPt x)),
      ∃ y : Gr.points (X.geomPt x), Nonempty (Gr.blPoint _ y ≅ F) := by sorry

/-- A central extension `G̃ → G` with torus kernel (not necessarily induced). -/
structure CentralTorusExtension (D : LocalDatum.{u}) where
  Dt : LocalDatum.{u}
  proj : LocalDatum.Hom Dt D
  surj : Function.Surjective proj.pt
  kernelTorus : LocalDatum.{u}
  kernelIncl : LocalDatum.Hom kernelTorus Dt
  kernel_isTorus : kernelTorus.IsTorus
  kernel_eq : Set.range kernelIncl.pt = proj.pt.ker
  kernel_central : ∀ z, kernelIncl.pt z ∈ Subgroup.center Dt.Pt

/-- The map of affine Grassmannians induced by a group morphism (GS0 functoriality). -/
def GrassmannianInterface.mapOf {X : CurveSite E} {SG : StackGeometry X} {C Ct : BunContext X}
    (Gr : GrassmannianInterface X SG C.Rep C.D) (Grt : GrassmannianInterface X SG Ct.Rep Ct.D)
    (f : LocalDatum.Hom Ct.D C.D) : Grt.gr ⟶ Gr.gr := by sorry
def GrassmannianInterface.pointMap {X : CurveSite E} {SG : StackGeometry X} {C Cc : BunContext X}
    (Gr : GrassmannianInterface X SG C.Rep C.D) (Grc : GrassmannianInterface X SG Cc.Rep Cc.D)
    (f : LocalDatum.Hom C.D Cc.D) (S : X.Perf) : Gr.points S → Grc.points S := by sorry

theorem CentralTorusGrassmannianSurjectivity {X : CurveSite E} {SG : StackGeometry X}
    {C Ct : BunContext X} (Z : CentralTorusExtension C.D) (hZ : Z.Dt = Ct.D)
    (Gr : GrassmannianInterface X SG C.Rep C.D) (Grt : GrassmannianInterface X SG Ct.Rep Ct.D)
    (proj : LocalDatum.Hom Ct.D C.D) (hproj : HEq proj Z.proj) :
    SG.VSurjective (GrassmannianInterface.mapOf Gr Grt proj) := by sorry

/-- The prestack map of extension of structure group. -/
def Bun.extendMap (X : CurveSite E) {Rep Rep' : ExactTensorCat E} (res : TensorFunctors Rep' Rep) :
    Bun.stack X Rep ⟶ Bun.stack X Rep' := by sorry

/-- A central torus extension together with restriction `Rep(G) → Rep(G̃)` along it (Tau Ceti
layer 1). -/
structure CentralTorusExtensionData {X : CurveSite E} (C Ct : BunContext X) where
  Z : CentralTorusExtension C.D
  hZ : Z.Dt = Ct.D
  restriction : TensorFunctors C.Rep Ct.Rep

theorem CentralTorusBundleSurjectivity {X : CurveSite E} (SG : StackGeometry X)
    {C Ct : BunContext X} (Z : CentralTorusExtensionData C Ct) :
    SG.VSurjective (Bun.extendMap X Z.restriction) := by sorry

/-! ### BG2:uniformization/semicontinuity-and-local-constancy and the Newton topology -/
theorem SemicontinuityAndLocalConstancy {X : CurveSite E} (SG : StackGeometry X)
    (C : BunContext X) :
    IsLocallyConstant (fun p => Invariants.kottwitz C.D (C.spaceEquiv SG p)) ∧
      @Continuous _ _ _ (C.newtonTopology) (C.spaceEquiv SG) := by sorry

theorem GrassmannianKottwitzSign {X : CurveSite E} {SG : StackGeometry X} {C : BunContext X}
    (Gr : GrassmannianInterface X SG C.Rep C.D) (x : X.GeomPoint)
    (y : Gr.points (X.geomPt x)) :
    Invariants.kottwitz C.D (C.geomClass SG x (Gr.blPoint _ y)) =
      -Representation.Coinvariants.mk _ (Gr.component _ y) := by sorry

theorem NewtonTopologyHomeomorphism {X : CurveSite E} (SG : StackGeometry X)
    (C : BunContext X) :
    @Continuous _ _ _ (C.newtonTopology) (C.spaceEquiv SG) ∧
      @Continuous _ _ (C.newtonTopology) _ (C.spaceEquiv SG).symm ∧
    ∀ c c' : C.D.BofG, NewtonOrder C.D c c' ↔
      (C.spaceEquiv SG).symm c ⤳ (C.spaceEquiv SG).symm c' := by sorry

/-! ### BG2:uniformization/modification-newton-bound, minuscule image -/
theorem ModificationNewtonBound {X : CurveSite E} {SG : StackGeometry X} {C : BunContext X}
    (Gr : GrassmannianInterface X SG C.Rep C.D) [CharZero C.D.E] (μ : C.D.Cochar)
    (x : X.GeomPoint) (y : Gr.points (X.geomPt x)) (hy : y ∈ Gr.schubertCell μ _) :
    Acceptable C.D (-μ) (C.geomClass SG x (Gr.blPoint _ y)) := by sorry


theorem MinusculeModificationImage {X : CurveSite E} {SG : StackGeometry X} {C : BunContext X}
    (Gr : GrassmannianInterface X SG C.Rep C.D) [CharZero C.D.E] (μ : C.D.Cochar)
    (hμ : IsMinuscule C.D μ) (c : C.D.BofG) (hc : Acceptable C.D (-μ) c) :
    ∃ (x : X.GeomPoint) (y : Gr.points (X.geomPt x)), y ∈ Gr.schubertCell μ _ ∧
      C.geomClass SG x (Gr.blPoint _ y) = c := by sorry

/-! ### BG2:uniformization/de-rham-quotient-group-class -/
/-- The `B(G^c)` class of a de Rham lattice: the class of its Beauville–Laszlo modification. -/
def DeRhamQuotientGroupClass {X : CurveSite E} {SG : StackGeometry X} {Cc : BunContext X}
    (Grc : GrassmannianInterface X SG Cc.Rep Cc.D) (x : X.GeomPoint)
    (lattice : Grc.points (X.geomPt x)) : Cc.D.BofG :=
  Cc.geomClass SG x (Grc.blPoint _ lattice)
/-- A `G`-level lift exists only with lifted tensor data: a lifted lattice gives a class mapping to
the `G^c` class; no canonical lift is asserted. -/
theorem DeRhamQuotientGroupClass.lift {X : CurveSite E} {SG : StackGeometry X}
    {C Cc : BunContext X} (q : LocalDatum.Hom C.D Cc.D)
    (Gr : GrassmannianInterface X SG C.Rep C.D) (Grc : GrassmannianInterface X SG Cc.Rep Cc.D)
    (x : X.GeomPoint) (lattice : Gr.points (X.geomPt x)) :
    SigmaClass.map _ _ q.pt q.pt_frob (C.geomClass SG x (Gr.blPoint _ lattice)) =
      DeRhamQuotientGroupClass Grc x (GrassmannianInterface.pointMap Gr Grc q _ lattice) := by
  sorry

/-! ### BG2:uniformization: curve étale site and cohomology comparisons -/
/-- Owner interface for étale sites (D2, D6, RF2): `S_et`, `(X_S)_et`, `(Div¹_S)_et`, the
identification `(X_S)_et ≅ (Div¹_S)_et`, pullback along `Div¹ × S → S`, and étale cohomology
of the curve and of `Spa E` (or discrete Weil cohomology) with the constant-map comparison. -/
structure EtaleSites (X : CurveSite E) where
  et : X.Perf → Type u
  [etCat : ∀ S, Category.{u} (et S)]
  [etCoprod : ∀ S, HasBinaryCoproducts (et S)]
  curveEt : X.Perf → Type u
  [curveCat : ∀ S, Category.{u} (curveEt S)]
  [curveCoprod : ∀ S, HasBinaryCoproducts (curveEt S)]
  divEt : X.Perf → Type u
  [divCat : ∀ S, Category.{u} (divEt S)]
  curveToDiv : ∀ S, curveEt S ≌ divEt S
  projPullback : ∀ S, et S ⥤ divEt S
  baseChange : ∀ {S S' : X.Perf}, (S' ⟶ S) → et S ⥤ et S'
  curveBaseChange : ∀ {S S' : X.Perf}, (S' ⟶ S) → curveEt S ⥤ curveEt S'
  Coeff : Type u
  curveCoh : X.GeomPoint → ℕ → Coeff → Type u
  [curveCohGrp : ∀ x i Λ, AddCommGroup (curveCoh x i Λ)]
  baseCoh : ℕ → Coeff → Type u
  [baseCohGrp : ∀ i Λ, AddCommGroup (baseCoh i Λ)]
  comparison : ∀ x i Λ, baseCoh i Λ →+ curveCoh x i Λ
  Diag : Type u
  diagCurveCoh : X.GeomPoint → ℕ → Diag → Type u
  [diagCurveGrp : ∀ x i Dg, AddCommGroup (diagCurveCoh x i Dg)]
  weilCoh : ℕ → Diag → Type u
  [weilGrp : ∀ i Dg, AddCommGroup (weilCoh i Dg)]
  diagComparison : ∀ x i Dg, weilCoh i Dg →+ diagCurveCoh x i Dg
attribute [instance] EtaleSites.diagCurveGrp EtaleSites.weilGrp
attribute [instance] EtaleSites.etCat EtaleSites.etCoprod EtaleSites.curveCat
  EtaleSites.curveCoprod EtaleSites.divCat EtaleSites.curveCohGrp EtaleSites.baseCohGrp

namespace CurveEtaleBase
variable {X : CurveSite E} (Et : EtaleSites X)
/-- `τ^* : S_et → (X_S)_et`, `T ↦ X_T`, through `(X_S)_et ≅ (Div¹_S)_et`. -/
def pullback (S : X.Perf) : Et.et S ⥤ Et.curveEt S := Et.projPullback S ⋙ (Et.curveToDiv S).inverse
def baseChange {S S' : X.Perf} (f : S' ⟶ S) :
    pullback Et S ⋙ Et.curveBaseChange f ≅ Et.baseChange f ⋙ pullback Et S' := by sorry
/-- The induced functor on presheaves of abelian groups (`τ_*`), by precomposition. -/
def pushforward (S : X.Perf) : ((Et.curveEt S)ᵒᵖ ⥤ AddCommGrpCat.{u}) ⥤ ((Et.et S)ᵒᵖ ⥤ AddCommGrpCat.{u}) :=
  (Functor.whiskeringLeft _ _ _).obj (pullback Et S).op
def constantComparison (x : X.GeomPoint) (i : ℕ) (Λ : Et.Coeff) :
    Et.baseCoh i Λ →+ Et.curveCoh x i Λ := Et.comparison x i Λ
end CurveEtaleBase
-- TauCeti.BunG.CurveEtaleBase.testGeometric
example {X : CurveSite E} (Et : EtaleSites X) [CharZero E] (x : X.GeomPoint) (i : ℕ)
    (Λ : Et.Coeff) : Function.Bijective (CurveEtaleBase.constantComparison Et x i Λ) := by sorry
-- TauCeti.BunG.CurveEtaleBase.testTrivialSheaf
example {X : CurveSite E} (Et : EtaleSites X) (S : X.Perf)
    (F : (Et.curveEt S)ᵒᵖ ⥤ AddCommGrpCat.{u}) (hF : ∀ U, IsZero (F.obj U)) (V : (Et.et S)ᵒᵖ) :
    IsZero (((CurveEtaleBase.pushforward Et S).obj F).obj V) := by sorry
-- TauCeti.BunG.CurveEtaleBase.testCoproduct
example {X : CurveSite E} (Et : EtaleSites X) (S : X.Perf) (A B : Et.et S) :
    Nonempty ((CurveEtaleBase.pullback Et S).obj (A ⨿ B) ≅
      (CurveEtaleBase.pullback Et S).obj A ⨿ (CurveEtaleBase.pullback Et S).obj B) := by sorry

def CurveEtaleBase {X : CurveSite E} (Et : EtaleSites X) (S : X.Perf) : Et.et S ⥤ Et.curveEt S :=
  CurveEtaleBase.pullback Et S

theorem CurveTorsionCohomology {X : CurveSite E} (Et : EtaleSites X) [CharZero E]
    (x : X.GeomPoint) (i : ℕ) (Λ : Et.Coeff) :
    Function.Bijective (CurveEtaleBase.constantComparison Et x i Λ) := by sorry

theorem DiagonalizableCurveCohomology {X : CurveSite E} (Et : EtaleSites X) [CharZero E]
    (x : X.GeomPoint) (i : ℕ) (hi : i ≤ 2) (Dg : Et.Diag) :
    Function.Bijective (Et.diagComparison x i Dg) := by sorry

/-- The curve abelianization `H¹_et(X_C, [G_sc → G])` of a bundle (ET.0 with C1). -/
structure CurveCrossedModule {X : CurveSite E} (C : BunContext X) (Cm : CrossedModuleCohomology C.D) where
  curveAb : ∀ x : X.GeomPoint, C.Obj (X.geomPt x) → Cm.H1

theorem CrossedModuleCurveClasses {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X)
    (Cm : CrossedModuleCohomology C.D) (K : CurveCrossedModule C Cm) [CharZero C.D.E]
    (x : X.GeomPoint) (F : C.Obj (X.geomPt x)) :
    K.curveAb x F = AbelianizedClass.abelianize Cm (C.geomClass SG x F) := by sorry

/-! ### BG2:uniformization/bun-g-smallness -/
theorem BunGSmallness {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X)
    {I : Type u} [SmallCategory I] [IsCofiltered I]
    (hω₁ : ∀ s : Set I, s.Countable → ∃ i, ∀ j ∈ s, Nonempty (i ⟶ j))
    (Sd : I ⥤ X.Perf) (hS : ∀ i, X.IsAffinoid (Sd.obj i)) (c : Cone Sd) (hc : IsLimit c) :
    SG.IsSmall C.Bun ∧
    (∀ F : C.Obj c.pt, ∃ (i : I) (Fi : C.Obj (Sd.obj i)),
      Nonempty ((Bun.pullback (c.π.app i)).obj Fi ≅ F)) ∧
    ∀ (i : I) (F G : C.Obj (Sd.obj i)),
      Nonempty ((Bun.pullback (c.π.app i)).obj F ≅ (Bun.pullback (c.π.app i)).obj G) →
        ∃ (j : I) (g : j ⟶ i),
          Nonempty ((Bun.pullback (Sd.map g)).obj F ≅ (Bun.pullback (Sd.map g)).obj G) := by sorry
end TauCeti.BunG

noncomputable section
namespace TauCeti.BunG
open CategoryTheory CategoryTheory.Limits MonoidalCategory Bicategory
open scoped Pseudofunctor.StrongTrans
universe u
variable {E : Type u} [Field E]

/-! ### BG0/pure-inner-twisting and the basic inner form -/
/-- Owner interface for torsors under group sheaves (AlgebraicModuli R09.3, D3): torsor groupoids,
the trivial torsor, `H_T = Aut_H(T)`, `S ↦ Isom_H(S, T)` and the contracted product. -/
structure GroupSheafTorsors (X : CurveSite E) where
  GroupSheaf : Type u
  Tors : GroupSheaf → X.Perf → Type u
  [gpd : ∀ H S, Groupoid.{u} (Tors H S)]
  trivial : ∀ H S, Tors H S
  autGroup : ∀ H S, Tors H S → GroupSheaf
  isomTo : ∀ H S (T : Tors H S), Tors H S ⥤ Tors (autGroup H S T) S
  contract : ∀ H S (T : Tors H S), Tors (autGroup H S T) S ⥤ Tors H S
attribute [instance] GroupSheafTorsors.gpd

theorem PureInnerTwisting {X : CurveSite E} (T : GroupSheafTorsors X) (H : T.GroupSheaf)
    (S : X.Perf) (P : T.Tors H S) :
    Nonempty (T.isomTo H S P ⋙ T.contract H S P ≅ 𝟭 _) ∧
      Nonempty (T.contract H S P ⋙ T.isomTo H S P ≅ 𝟭 _) ∧
      Nonempty ((T.isomTo H S P).obj P ≅ T.trivial _ S) := by sorry

theorem BasicInnerFormBundleEquivalence {X : CurveSite E} (C CJ : BunContext X) (b : C.D.Pt)
    (hb : Basic C.D (SigmaClass.mk C.D.frob b)) (ξ : NewtonSpace.InnerTwisting C.D CJ.D)
    (hJ : CJ.Grat ≃* C.J b)
    (fibreJ : TensorFunctors CJ.Rep X.vect) :
    ∃ e : ∀ S, C.Obj S ≌ CJ.Obj S,
      (∀ S, Nonempty ((e S).functor.obj (Bun.ofIsocrystal (C.R.ofPoint b) S) ≅
        GBundle.trivial fibreJ S)) ∧
      ∀ {S T : X.Perf} (f : T ⟶ S),
        Nonempty ((e S).functor ⋙ Bun.pullback f ≅ Bun.pullback f ⋙ (e T).functor) := by sorry

/-! ### BG0/division-algebra-morita -/
/-- `Hom(E_b, ℰ)` as a right `End(E_b)`-module by precomposition (Mathlib
`Preadditive.moduleEndLeft`). -/
def homModule {X : CurveSite E} (S : X.Perf) (Eb ℰ : (X.bundles S).carrier) :
    ModuleCat.{u} (End Eb)ᵐᵒᵖ := ModuleCat.of _ (Eb ⟶ ℰ)

theorem DivisionAlgebraMorita {X : CurveSite E} (C : BunContext X) (x : X.GeomPoint)
    (b : C.D.Pt) (std : C.Rep.carrier) (a : ℤ) (h : ℕ) (hh : 0 < h) (hcop : Int.gcd a h = 1)
    (hslope : X.isocSlope ((C.R.ofPoint b).evaluate std) = (a : ℚ) / h)
    (hsimple : X.isocRank ((C.R.ofPoint b).evaluate std) = h) :
    X.brauerInv ((C.R.ofPoint b).evaluate std) = Int.fract (-((a : ℚ) / h)) ∧
    Nonempty (C.J b ≃* (End ((C.R.ofPoint b).evaluate std))ˣ) ∧
    Function.Bijective (fun φ : End ((C.R.ofPoint b).evaluate std) =>
      (X.ofIsocrystal (X.geomPt x)).functor.map φ) ∧
    ∀ ℰ₁ ℰ₂ : (X.bundles (X.geomPt x)).carrier,
      X.slopes x ℰ₁ = List.replicate (X.rank _ ℰ₁) (-((a : ℚ) / h)) →
      X.slopes x ℰ₂ = List.replicate (X.rank _ ℰ₂) (-((a : ℚ) / h)) →
      Nonempty ((ℰ₁ ≅ ℰ₂) ≃ (homModule (X.geomPt x)
        ((X.ofIsocrystal _).evaluate ((C.R.ofPoint b).evaluate std)) ℰ₁ ≅
        homModule (X.geomPt x) ((X.ofIsocrystal _).evaluate ((C.R.ofPoint b).evaluate std)) ℰ₂))
  := by sorry

/-! ### BG0/families-of-g-isocrystals and BG1/family-kottwitz-local-constancy -/
/-- Owner interface for isocrystals over perfect `F_q`-algebras (VB0 relative form, D2/D3):
perfect schemes with the v-topology, isocrystals over `L_R` (`W_{O_E}(R)[1/π]` or `R((t))`), their
pullbacks, the loop group `LG(R) = G(L_R)` with Frobenius and the realization `b ↦ (·, bσ)`, the
geometric point `Spec F̄_q` with `LG(F̄_q) = G(L)`, underlying spaces and residue points. -/
structure IsocrystalFamilies (Rep : ExactTensorCat E) (D : LocalDatum.{u}) where
  PerfSch : Type u
  [cat : Category.{u} PerfSch]
  vTop : GrothendieckTopology PerfSch
  isoc : PerfSch → ExactTensorCat E
  pullback : ∀ {R R' : PerfSch}, (R' ⟶ R) → TensorFunctors (isoc R) (isoc R')
  loop : PerfSch → Type u
  [loopGroup : ∀ R, Group (loop R)]
  ofLoop : ∀ R, loop R → TensorFunctors Rep (isoc R)
  geomPoint : PerfSch
  geomLoop : loop geomPoint ≃* D.Pt
  space : PerfSch → TopCat.{u}
  residue : ∀ R, space R → (geomPoint ⟶ R)
attribute [instance] IsocrystalFamilies.cat IsocrystalFamilies.loopGroup

namespace GIsocrystalFamily
variable {Rep : ExactTensorCat E} {D : LocalDatum.{u}} (F : IsocrystalFamilies Rep D)
/-- `G`-isocrystal families over `R` (Tannakian form of a `G`-torsor on `Spec L_R` with Frobenius). -/
abbrev Obj (R : F.PerfSch) := TensorFunctors Rep (F.isoc R)
def pullback {R R' : F.PerfSch} (f : R' ⟶ R) (P : Obj F R) : Obj F R' :=
  P.postcompose (F.pullback f)
def ofLoopElement (R : F.PerfSch) (b : F.loop R) : Obj F R := F.ofLoop R b
/-- The class of a loop element at the geometric point. -/
def geometricClass (b : F.loop F.geomPoint) : D.BofG := SigmaClass.mk D.frob (F.geomLoop b)
theorem geometric_bijective :
    Function.Bijective (SigmaClass.lift D.frob
      (fun b => (Quotient.mk (isIsomorphicSetoid (Obj F F.geomPoint))
        (ofLoopElement F _ (F.geomLoop.symm b)))) (by sorry)) := by sorry
/-- The class of a family at a point of `|Spec R|`. -/
def classAt {R : F.PerfSch} (P : Obj F R) (p : F.space R) : D.BofG :=
  Function.surjInv (geometric_bijective F).2 (Quotient.mk _ (pullback F (F.residue R p) P))
/-- v-locally every family is `(·, bσ)` for a loop element: the v-stackification is
`LG / Ad_σ LG`. -/
theorem loopQuotient (R : F.PerfSch) (P : Obj F R) :
    ∃ (R' : F.PerfSch) (f : R' ⟶ R) (b : F.loop R'),
      Sieve.generate (Presieve.singleton f) ∈ F.vTop R ∧
        Nonempty (pullback F f P ≅ ofLoopElement F R' b) := by sorry
end GIsocrystalFamily
abbrev GIsocrystalFamily {Rep : ExactTensorCat E} {D : LocalDatum.{u}}
    (F : IsocrystalFamilies Rep D) (R : F.PerfSch) := GIsocrystalFamily.Obj F R
-- TauCeti.BunG.GIsocrystalFamily.testField
example {Rep : ExactTensorCat E} {D : LocalDatum.{u}} (F : IsocrystalFamilies Rep D) :
    Function.Surjective (GIsocrystalFamily.geometricClass F) := by sorry
-- TauCeti.BunG.GIsocrystalFamily.testTrivial: `G = 1`.
example {Rep : ExactTensorCat E} {D : LocalDatum.{u}} (F : IsocrystalFamilies Rep D)
    (hunit : ∀ V : Rep.carrier, Nonempty (V ≅ 𝟙_ Rep.carrier)) (R : F.PerfSch)
    (P Q : GIsocrystalFamily.Obj F R) : Nonempty (P ≅ Q) ∧ Subsingleton (P ⟶ Q) := by sorry
-- TauCeti.BunG.GIsocrystalFamily.testAutomorphisms: family automorphisms of `b` are `J_b(E)`,
-- without the positive Banach–Colmez kernel of the bundle.
example {X : CurveSite E} (C : BunContext X) (F : IsocrystalFamilies C.Rep C.D)
    (b : F.loop F.geomPoint) :
    Nonempty (Aut (GIsocrystalFamily.ofLoopElement F _ b) ≃* C.J (F.geomLoop b)) := by sorry

/-- The prestack of `G`-isocrystal families on perfect schemes. -/
def GIsocrystalFamily.stack {Rep : ExactTensorCat E} {D : LocalDatum.{u}}
    (F : IsocrystalFamilies Rep D) : LocallyDiscrete F.PerfSchᵒᵖ ⥤ᵖ Cat.{u, u} := by sorry

theorem IsocrystalFamilyVDescent {Rep : ExactTensorCat E} {D : LocalDatum.{u}}
    (F : IsocrystalFamilies Rep D) (J : D.Pt → Type u) [∀ b, Group (J b)]
    (hJ : ∀ b, J b ≃* ↥(SigmaCentralizer.points D.frob b)) :
    (GIsocrystalFamily.stack F).IsStack F.vTop ∧
    (∀ (R : F.PerfSch) (P : GIsocrystalFamily.Obj F R) (c : D.BofG),
      IsLocallyClosed {p | GIsocrystalFamily.classAt F P p = c}) ∧
    ∀ b : F.loop F.geomPoint,
      Nonempty (Aut (GIsocrystalFamily.ofLoopElement F _ b) ≃* J (F.geomLoop b)) := by sorry

theorem FamilyKottwitzLocalConstancy {Rep : ExactTensorCat E} {D : LocalDatum.{u}}
    (F : IsocrystalFamilies Rep D) (R : F.PerfSch) (P : GIsocrystalFamily.Obj F R) :
    IsLocallyConstant (fun p => Invariants.kottwitz D (GIsocrystalFamily.classAt F P p)) := by
  sorry

/-! ### BG2:smooth-Artin -/
namespace BunContext
variable {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X)
/-- The diagonal `Bun_G → Bun_G × Bun_G` (D0 2-fibre product over the point). -/
def diagonal : C.Bun ⟶ SG.fibreProduct (SG.toTerminal C.Bun) (SG.toTerminal C.Bun) := by sorry
end BunContext

theorem IsomSheafRepresentability {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X) :
    SG.ReprLSD (C.diagonal SG) := by sorry

theorem BunGIsSmoothArtin {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X)
    (Gr : GrassmannianInterface X SG C.Rep C.D) :
    SG.IsArtin C.Bun ∧ SG.CohSmooth (SG.toTerminal C.Bun) 0 ∧
    (let chart := SG.coproductDesc (fun μ : {μ : C.D.Cochar // C.D.dominantCochar μ = μ} =>
        Gr.openCellQuotient μ.1) (fun μ => Gr.openCellToBun μ.1)
     SG.Separated chart ∧ SG.VSurjective chart) ∧
    ∀ μ : C.D.Cochar, C.D.dominantCochar μ = μ → ∃ d : ℤ,
      (d : ℚ) = C.D.twoRho (C.D.rational μ) ∧ SG.CohSmooth (Gr.openCellToBun μ) d := by sorry

theorem ConnectedComponents {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X) :
    (∃ e : _root_.ConnectedComponents (SG.space C.Bun) ≃ KottwitzDescent.Target C.D.piFrob,
      ∀ p, e (_root_.ConnectedComponents.mk p) = Invariants.kottwitz C.D (C.spaceEquiv SG p)) ∧
    ∀ U : Set (SG.space C.Bun), IsOpen U → U.Nonempty →
      ∃ p ∈ U, Basic C.D (C.spaceEquiv SG p) := by sorry

/-! ### BG3/hn-graded-g-bundles and their classification -/
namespace HNGraded
variable {X : CurveSite E} (C : BunContext X)
/-- HN-split `G`-bundles: tensor functors into `ℚ`-graded bundles with semistable pieces. -/
abbrev Obj (S : X.Perf) := ObjectProperty.FullSubcategory
  (fun P : TensorFunctors C.Rep (C.Fl.graded S) =>
    ∀ V, C.Fl.SemistablePieces S (TensorInterface.Data.evaluate P V))
def forget (S : X.Perf) : Obj C S ⥤ C.Obj S where
  obj P := P.obj.postcompose (C.Fl.forgetGrading S)
  map φ := by sorry
  map_id := by sorry
  map_comp := by sorry
def ofClass (b : C.D.Pt) (S : X.Perf) : Obj C S :=
  ⟨(C.R.ofPoint b).postcompose (C.Fl.gradedOfIsocrystal S), by sorry⟩
def automorphisms (b : C.D.Pt) (x : X.GeomPoint) :
    Aut (ofClass C b (X.geomPt x)) ≃* C.J b := by sorry
/-- The HN-split prestack `S ↦ Obj C S`. -/
def stack (C : BunContext X) : Prestack X := by sorry
theorem classifying (SG : StackGeometry X) :
    ∃ f : SG.coproduct (fun c : C.D.BofG => SG.classifying (C.J (Quotient.out c))) ⟶ stack C,
      IsObjectwiseEquiv f := by sorry
end HNGraded
abbrev HNGraded {X : CurveSite E} (C : BunContext X) (S : X.Perf) := HNGraded.Obj C S
-- TauCeti.BunG.HNGraded.testGL2: for `O ⊕ O(1)`, graded automorphisms are `E^× × E^×`.
example {X : CurveSite E} (C : BunContext X) (b : C.D.Pt) (x : X.GeomPoint)
    (e : C.J b ≃* (C.D.E)ˣ × (C.D.E)ˣ) :
    Nonempty (Aut (HNGraded.ofClass C b (X.geomPt x)) ≃* (C.D.E)ˣ × (C.D.E)ˣ) := by sorry
-- TauCeti.BunG.HNGraded.testBasic: for basic `b` forgetting the grading is bijective on
-- automorphisms (no positive kernel).
example {X : CurveSite E} (C : BunContext X) (b : C.D.Pt) (x : X.GeomPoint)
    (hb : Basic C.D (SigmaClass.mk C.D.frob b)) :
    Function.Bijective ((HNGraded.forget C (X.geomPt x)).mapAut (HNGraded.ofClass C b _)) := by
  sorry
-- TauCeti.BunG.HNGraded.testUngraded: for nonbasic `b` the ungraded automorphisms are larger.
example {X : CurveSite E} (C : BunContext X) (b : C.D.Pt) (x : X.GeomPoint)
    (hb : ¬ Basic C.D (SigmaClass.mk C.D.frob b)) :
    ¬ Function.Surjective ((HNGraded.forget C (X.geomPt x)).mapAut (HNGraded.ofClass C b _)) := by
  sorry

theorem HnGradedClassification {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X) :
    (∃ f : SG.coproduct (fun c : C.D.BofG => SG.classifying (C.J (Quotient.out c))) ⟶
      HNGraded.stack C, IsObjectwiseEquiv f) ∧
    ∀ (x : X.GeomPoint) (P : HNGraded.Obj C (X.geomPt x)),
      ∃ b, Nonempty (P ≅ HNGraded.ofClass C b _) := by sorry

/-! ### BG3/filtered-automorphism-group-scheme (affine chart, functor-of-points form) -/
/-- A `ℚ`-filtered fibre functor over a coefficient ring `A`: modules `M V`, decreasing
filtrations, and the group of tensor automorphisms `H(A) = Aut_G(E)(A)` (Tau Ceti layer 1). -/
structure FilteredFibreFunctor (A : Type u) [CommRing A] (Rep : Type u) where
  M : Rep → Type u
  [grp : ∀ V, AddCommGroup (M V)]
  [mod : ∀ V, Module A (M V)]
  fil : ∀ V, ℚ → Submodule A (M V)
  fil_antitone : ∀ V, Antitone (fil V)
  aut : Subgroup (∀ V, M V ≃ₗ[A] M V)
attribute [instance] FilteredFibreFunctor.grp FilteredFibreFunctor.mod

namespace FilteredAutomorphism
variable {A : Type u} [CommRing A] {Rep : Type u} (ω : FilteredFibreFunctor A Rep)
/-- `H^{≥λ}`: automorphisms with `(γ - 1) Fil^{λ'} ⊆ Fil^{λ'+λ}`. -/
def raising (lam : ℚ) : Subgroup (∀ V, ω.M V ≃ₗ[A] ω.M V) where
  carrier := {γ | γ ∈ ω.aut ∧ ∀ V lam', ∀ v ∈ ω.fil V lam', γ V v - v ∈ ω.fil V (lam' + lam)}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry
/-- `H^{>λ}`: automorphisms raising every filtration by more than `λ`. -/
def strictlyRaising (lam : ℚ) : Subgroup (∀ V, ω.M V ≃ₗ[A] ω.M V) where
  carrier := {γ | γ ∈ ω.aut ∧ ∀ V lam', ∀ v ∈ ω.fil V lam', ∃ ε > 0,
    γ V v - v ∈ ω.fil V (lam' + lam + ε)}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry
theorem raising_iff (lam : ℚ) (γ : ∀ V, ω.M V ≃ₗ[A] ω.M V) : γ ∈ raising ω lam ↔
    γ ∈ ω.aut ∧ ∀ V lam', ∀ v ∈ ω.fil V lam', γ V v - v ∈ ω.fil V (lam' + lam) := Iff.rfl
/-- `H^{≥0}` is the parabolic preserving the filtration. -/
def parabolic : Subgroup (∀ V, ω.M V ≃ₗ[A] ω.M V) := raising ω 0
/-- `H^{>0}` is its unipotent radical. -/
def unipotent : Subgroup (∀ V, ω.M V ≃ₗ[A] ω.M V) := strictlyRaising ω 0
theorem unipotent_normal : ∀ g ∈ parabolic ω, ∀ h ∈ unipotent ω, g * h * g⁻¹ ∈ unipotent ω := by
  sorry
/-- For `λ > 0` the quotient `H^{≥λ}/H^{>λ}` is commutative (the vector group
`(ad E)^{≥λ}/(ad E)^{>λ}`). -/
theorem graded (lam : ℚ) (hlam : 0 < lam) : ∀ g ∈ raising ω lam, ∀ h ∈ raising ω lam,
    g * h * g⁻¹ * h⁻¹ ∈ strictlyRaising ω lam := by sorry
/-- Base change along `A → B` carries `H^{≥λ}` into `H^{≥λ}`. -/
theorem pullback {B : Type u} [CommRing B] (ω' : FilteredFibreFunctor B Rep)
    (φ : (∀ V, ω.M V ≃ₗ[A] ω.M V) →* (∀ V, ω'.M V ≃ₗ[B] ω'.M V))
    (hφ : ∀ γ ∈ ω.aut, φ γ ∈ ω'.aut) (bc : ∀ V, ω.M V →+ ω'.M V)
    (hbc : ∀ V lam, ω'.fil V lam = Submodule.span B (bc V '' (ω.fil V lam : Set (ω.M V))))
    (hφbc : ∀ γ V v, φ γ V (bc V v) = bc V (γ V v)) (lam : ℚ) :
    ∀ γ ∈ raising ω lam, φ γ ∈ raising ω' lam := by sorry
/-- On a local chart the filtration splits into weight submodules (a rational cocharacter after
étale trivialization); no global splitting is asserted. -/
theorem localSplit [IsLocalRing A] (hproj : ∀ V, Module.Projective A (ω.M V)) :
    ∃ gr : ∀ V, ℚ → Submodule A (ω.M V), ∀ V, iSupIndep (gr V) ∧
      ∀ lam, ω.fil V lam = ⨆ (μ : ℚ) (_ : lam ≤ μ), gr V μ := by sorry
end FilteredAutomorphism
-- TauCeti.BunG.FilteredAutomorphism.testGL2: the two-step filtration with weights `0, 1` on a line
-- `ℓ ⊂ M`: the positive radical is `H^{≥1}`.
example {A : Type u} [CommRing A] {Rep : Type u} (ω : FilteredFibreFunctor A Rep)
    (ℓ : ∀ V, Submodule A (ω.M V))
    (hfil : ∀ V lam, ω.fil V lam = if lam ≤ 0 then ⊤ else if lam ≤ 1 then ℓ V else ⊥) :
    FilteredAutomorphism.unipotent ω = FilteredAutomorphism.raising ω 1 := by sorry
-- TauCeti.BunG.FilteredAutomorphism.testRationalJump: weights `0` and `3/2` on a line
-- `ℓ ⊂ M`: `H^{≥1} = H^{≥3/2}`, and `H^{≥2}` is trivial.
example {A : Type u} [CommRing A] {Rep : Type u} (ω : FilteredFibreFunctor A Rep)
    (ℓ : ∀ V, Submodule A (ω.M V))
    (hfil : ∀ V lam, ω.fil V lam = if lam ≤ 0 then ⊤ else if lam ≤ 3/2 then ℓ V else ⊥) :
    FilteredAutomorphism.raising ω 1 = FilteredAutomorphism.raising ω (3/2) ∧
      ∀ γ ∈ FilteredAutomorphism.raising ω 2, γ = 1 := by sorry
-- TauCeti.BunG.FilteredAutomorphism.testTrivialFiltration
example {A : Type u} [CommRing A] {Rep : Type u} (ω : FilteredFibreFunctor A Rep)
    (hfil : ∀ V lam, ω.fil V lam = if lam ≤ 0 then ⊤ else ⊥) :
    FilteredAutomorphism.parabolic ω = ω.aut ∧ FilteredAutomorphism.unipotent ω = ⊥ := by sorry
-- TauCeti.BunG.FilteredAutomorphism.testZeroWeight: at `λ = 0` the quotient is the Levi, which is
-- not commutative for `GL₂` with the trivial filtration.
example : ∃ ω : FilteredFibreFunctor ℚ PUnit.{1}, ¬ ∀ g ∈ FilteredAutomorphism.raising ω 0,
    ∀ h ∈ FilteredAutomorphism.raising ω 0,
      g * h * g⁻¹ * h⁻¹ ∈ FilteredAutomorphism.strictlyRaising ω 0 := by sorry

-- TauCeti.BunG.FilteredAutomorphism.testNonAffine: on `P¹` the Euler sequence
-- `0 → O(-1) → O² → O(1) → 0` (owner: quasi-coherent bundles on `P¹`) has no global splitting,
-- since every map `O(1) → O` vanishes; it splits on affine opens.
example (B : Type u) [Category.{u} B] [Preadditive B] [HasBinaryBiproducts B] (O : ℤ → B)
    (euler : ShortComplex B) (h₂ : euler.X₂ = (O 0 ⊞ O 0)) (h₃ : euler.X₃ = O 1)
    (hHom : ∀ f : O 1 ⟶ O 0, f = 0) (hnz : ¬ IsZero (O 1)) : IsEmpty euler.Splitting := by sorry
abbrev FilteredAutomorphism {A : Type u} [CommRing A] {Rep : Type u}
    (ω : FilteredFibreFunctor A Rep) (lam : ℚ) := FilteredAutomorphism.raising ω lam

/-! ### BG3/full-automorphism-v-group and the positive kernel -/
namespace FullAutomorphism
variable {X : CurveSite E} (C : BunContext X)
/-- `J̃_b(S) = Aut(E_b over X_S)`. -/
abbrev group (b : C.D.Pt) (S : X.Perf) := Aut (Bun.ofIsocrystal (C.R.ofPoint b) S)
/-- Action on the HN graded object, valued in `J_b(E)` at a geometric point. -/
def projection (b : C.D.Pt) (x : X.GeomPoint) : group C b (X.geomPt x) →* C.J b := by sorry
/-- The isocrystal automorphisms split the projection. -/
def «section» (b : C.D.Pt) (x : X.GeomPoint) : C.J b →* group C b (X.geomPt x) := by sorry
theorem section_projection (b : C.D.Pt) (x : X.GeomPoint) (g : C.J b) :
    projection C b x («section» C b x g) = g := by sorry
theorem kernel (b : C.D.Pt) (x : X.GeomPoint) :
    (projection C b x).ker = ⊥ ↔ Basic C.D (SigmaClass.mk C.D.frob b) := by sorry
/-- For each positive bundle slope `λ` the `λ`-graded quotient of the kernel is `BC((ad E_b)^λ)`. -/
theorem graded (b : C.D.Pt) (x : X.GeomPoint) (lam : ℚ) (hlam : 0 < lam) :
    ∃ K₁ K₂ : Subgroup (group C b (X.geomPt x)), K₂ ≤ K₁ ∧ K₁ ≤ (projection C b x).ker ∧
      Nonempty ((↥K₁ ⧸ K₂.subgroupOf K₁) ≃ C.bcAdjoint b (X.geomPt x) lam) := by sorry
theorem semidirect (b : C.D.Pt) (x : X.GeomPoint) :
    ∀ γ : group C b (X.geomPt x), ∃ k ∈ (projection C b x).ker, ∃ g : C.J b,
      γ = k * «section» C b x g := by sorry
/-- The full automorphism group v-sheaf and its positive kernel (D0 group objects). -/
def stack (b : C.D.Pt) : Prestack X := by sorry
def kernelStack (b : C.D.Pt) : Prestack X := by sorry
end FullAutomorphism
-- TauCeti.BunG.FullAutomorphism.testGL2: `Aut(O ⊕ O(1))` is triangular: the projection to
-- `E^× × E^×` is onto with nontrivial kernel `BC(O(1))`.
example {X : CurveSite E} (C : BunContext X) (b : C.D.Pt) (x : X.GeomPoint)
    (hb : ¬ Basic C.D (SigmaClass.mk C.D.frob b)) :
    Function.Surjective (FullAutomorphism.projection C b x) ∧
      ¬ Function.Injective (FullAutomorphism.projection C b x) := by sorry
-- TauCeti.BunG.FullAutomorphism.testBasic
example {X : CurveSite E} (C : BunContext X) (b : C.D.Pt) (x : X.GeomPoint)
    (hb : Basic C.D (SigmaClass.mk C.D.frob b)) :
    Function.Injective (FullAutomorphism.projection C b x) := by sorry
-- TauCeti.BunG.FullAutomorphism.testAlgebraicJ: `J_b(E)` alone misses the upper-triangular sections.
example {X : CurveSite E} (C : BunContext X) (b : C.D.Pt) (x : X.GeomPoint)
    (hb : ¬ Basic C.D (SigmaClass.mk C.D.frob b)) :
    ¬ Function.Surjective (FullAutomorphism.«section» C b x) := by sorry

abbrev FullAutomorphism {X : CurveSite E} (C : BunContext X) (b : C.D.Pt) (S : X.Perf) :=
  FullAutomorphism.group C b S
-- TauCeti.BunG.SigmaCentralizer.testNonbasic: for `GL₂` slopes `0,1` the algebraic `J_b(E)` misses
-- the positive kernel of the bundle automorphism group.
example {X : CurveSite E} (C : BunContext X) (b : C.D.Pt) (x : X.GeomPoint)
    (hb : ¬ Basic C.D (SigmaClass.mk C.D.frob b)) :
    ¬ Function.Injective (FullAutomorphism.projection C b x) := by sorry
-- TauCeti.BunG.SigmaCentralizer.testBasicGL2: simple slope `1/2` gives the quaternion units, simple
-- slope `1/3` an algebra of invariant `-1/3 = 2/3`.
example {X : CurveSite E} (C : BunContext X) (x : X.GeomPoint) (b : C.D.Pt) (std : C.Rep.carrier)
    (h3 : X.isocSlope ((C.R.ofPoint b).evaluate std) = 1 / 3)
    (hr : X.isocRank ((C.R.ofPoint b).evaluate std) = 3) :
    X.brauerInv ((C.R.ofPoint b).evaluate std) = 2 / 3 ∧
      Nonempty (C.J b ≃* (End ((C.R.ofPoint b).evaluate std))ˣ) := by sorry

theorem PositiveAutomorphismKernel {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X)
    (b : C.D.Pt) :
    SG.IsLocallySpatialDiamond (FullAutomorphism.kernelStack C b) ∧
    (∃ d : ℤ, (d : ℚ) = C.D.twoRho (C.D.newtonRep b) ∧
      SG.CohSmooth (SG.toTerminal (FullAutomorphism.kernelStack C b)) d) ∧
    Nonempty (_root_.ConnectedComponents (SG.space (FullAutomorphism.stack C b)) ≃ C.J b) := by sorry

/-- The opposite parabolic of a rational Newton witness: roots with `α(ν) ≤ 0`. -/
def oppositeParabolicRoots {D : LocalDatum.{u}} {b : D.Pt} (w : RationalNewtonWitness D b) :
    Set (Module.Dual ℚ D.RatCochar) := {α | α ∈ D.roots ∧ α w.ν ≤ 0}

theorem QuasiSplitOppositeParabolic {X : CurveSite E} (C : BunContext X) (b : C.D.Pt)
    (hqs : IsQuasiSplit C.D) (w : RationalNewtonWitness C.D b) (S : X.Perf) :
    Nonempty (FullAutomorphism.group C b S ≃* C.parabolicSections (oppositeParabolicRoots w) S) :=
  by sorry

/-! ### BG3/semistable-locus-and-basic-strata -/
namespace Semistable
variable {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X)
def IsSemistable {S : X.Perf} (F : C.Obj S) : Prop :=
  ∀ (x : X.GeomPoint) (f : X.geomPt x ⟶ S), Basic C.D (C.geomClass SG x ((Bun.pullback f).obj F))
theorem mem_iff {S : X.Perf} (F : C.Obj S) : IsSemistable SG C F ↔
    ∀ x (f : X.geomPt x ⟶ S), Basic C.D (C.geomClass SG x ((Bun.pullback f).obj F)) := Iff.rfl
theorem openImmersion : SG.OpenImmersion (BunContext.substackIncl SG C (Basic C.D)) := by sorry
theorem basicDecomposition :
    ∃ f : SG.coproduct (fun c : {c : C.D.BofG // Basic C.D c} =>
      SG.classifying (C.J (Quotient.out c.1))) ⟶ BunContext.substack SG C (Basic C.D),
      IsObjectwiseEquiv f := by sorry
def component (x : X.GeomPoint) (F : C.Obj (X.geomPt x)) : KottwitzDescent.Target C.D.piFrob :=
  Invariants.kottwitz C.D (C.geomClass SG x F)
end Semistable
-- TauCeti.BunG.Semistable.testGL2Half
example {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X) (b : C.D.Pt)
    (hb : Basic C.D (SigmaClass.mk C.D.frob b)) (S : X.Perf) :
    Semistable.IsSemistable SG C (Bun.ofIsocrystal (C.R.ofPoint b) S) := by sorry
-- TauCeti.BunG.Semistable.testTorus
example {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X) (hT : C.D.IsTorus)
    (S : X.Perf) (F : C.Obj S) : Semistable.IsSemistable SG C F := by sorry
-- TauCeti.BunG.Semistable.testUnstable
example {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X) (b : C.D.Pt)
    (hb : ¬ Basic C.D (SigmaClass.mk C.D.frob b)) (x : X.GeomPoint) :
    ¬ Semistable.IsSemistable SG C (Bun.ofIsocrystal (C.R.ofPoint b) (X.geomPt x)) := by sorry

abbrev Semistable {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X) : Prestack X :=
  BunContext.substack SG C (Basic C.D)

/-! ### BG3/torus-picard-stack -/
namespace TorusPicard
variable {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X)
/-- Contracted product of torus bundles. -/
def tensor {S : X.Perf} (F G : C.Obj S) : C.Obj S := by sorry
theorem kottwitz (hT : C.D.IsTorus) (x : X.GeomPoint) (F G : C.Obj (X.geomPt x)) :
    Invariants.kottwitz C.D (C.geomClass SG x (tensor C F G)) =
      Invariants.kottwitz C.D (C.geomClass SG x F) +
        Invariants.kottwitz C.D (C.geomClass SG x G) := by sorry
theorem fibre (hT : C.D.IsTorus) (β : KottwitzDescent.Target C.D.piFrob) :
    ∃ f : SG.classifying C.Grat ⟶
      BunContext.substack SG C (fun c => Invariants.kottwitz C.D c = β), IsObjectwiseEquiv f := by
  sorry
theorem splitOfSection (hT : C.D.IsTorus)
    (s : Multiplicative (KottwitzDescent.Target C.D.piFrob) →* C.D.Pt)
    (hs : ∀ β, Invariants.kottwitz C.D (SigmaClass.mk C.D.frob (s β)) = β.toAdd) :
    ∃ f : SG.coproduct (fun _ : KottwitzDescent.Target C.D.piFrob => SG.classifying C.Grat) ⟶
      C.Bun, IsObjectwiseEquiv f := by sorry
end TorusPicard
/-- `Bun_T` with its Picard structure. -/
abbrev TorusPicard {X : CurveSite E} (C : BunContext X) (_hT : C.D.IsTorus) : Prestack X := C.Bun
-- TauCeti.BunG.TorusPicard.testGm: line bundles: `κ` is additive under tensor product.
example {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X) (hT : C.D.IsTorus)
    (e : C.D.Pi ≃+ ℤ) (x : X.GeomPoint) (F G : C.Obj (X.geomPt x)) :
    Invariants.kottwitz C.D (C.geomClass SG x (TorusPicard.tensor C F G)) =
      Invariants.kottwitz C.D (C.geomClass SG x F) +
        Invariants.kottwitz C.D (C.geomClass SG x G) := by sorry
-- TauCeti.BunG.TorusPicard.testTrivial
example {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X)
    (hunit : ∀ V : C.Rep.carrier, Nonempty (V ≅ 𝟙_ C.Rep.carrier)) (S : X.Perf) (F G : C.Obj S) :
    Nonempty (F ≅ G) := by sorry
-- TauCeti.BunG.TorusPicard.testTorsion: for the norm-one torus no group section exists through
-- `T(L)` when `T(L) → B(T)` has torsion cokernel classes not lifting multiplicatively.
example {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X) (hT : C.D.IsTorus)
    (e : C.D.Pi ≃+ ℤ) (he : ∀ a, e (C.D.piFrob a) = -e a)
    (hnolift : ∀ t : C.D.Pt, t * t = 1 → Invariants.kottwitz C.D (SigmaClass.mk C.D.frob t) = 0) :
    IsEmpty {s : Multiplicative (KottwitzDescent.Target C.D.piFrob) →* C.D.Pt //
      ∀ β, Invariants.kottwitz C.D (SigmaClass.mk C.D.frob (s β)) = β.toAdd} := by sorry

/-! ### BG3: strata, reduction and dimension -/
theorem StratumIsClassifyingStack {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X)
    (b : C.D.Pt) :
    SG.LocallyClosedImmersion
      (BunContext.substackIncl SG C (· = SigmaClass.mk C.D.frob b)) ∧
    ∃ f : SG.groupClassifying (FullAutomorphism.stack C b) ⟶
      BunContext.substack SG C (· = SigmaClass.mk C.D.frob b), IsObjectwiseEquiv f := by sorry

theorem AutomorphismTorsorReduction {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X)
    (b : C.D.Pt) (S : X.Perf) (hS : X.IsAffinoid S)
    (F : C.ObjWithClasses SG (· = SigmaClass.mk C.D.frob b) S) :
    ∃ P : HNGraded.Obj C S, Nonempty ((HNGraded.forget C S).obj P ≅ F.1) := by sorry

theorem StratumDimension {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X)
    (b : C.D.Pt) :
    SG.IsArtin (BunContext.substack SG C (· = SigmaClass.mk C.D.frob b)) ∧
    ∃ d : ℤ, (d : ℚ) = -C.D.twoRho (C.D.newtonRep b) ∧
      SG.CohSmooth (SG.toTerminal (BunContext.substack SG C (· = SigmaClass.mk C.D.frob b))) d :=
  by sorry

/-! ### BG3: Newton strata of minuscule flag varieties -/
namespace FlagNewton
variable {X : CurveSite E} {SG : StackGeometry X} {C : BunContext X}
  (Gr : GrassmannianInterface X SG C.Rep C.D)
def classAt {x : X.GeomPoint} (y : Gr.points (X.geomPt x)) : C.D.BofG :=
  C.geomClass SG x (Gr.blPoint _ y)
def stratum (μ : C.D.Cochar) (c : C.D.BofG) (x : X.GeomPoint) : Set (Gr.points (X.geomPt x)) :=
  {y | y ∈ Gr.schubertCell μ _ ∧ classAt Gr y = c}
def upperUnion (μ : C.D.Cochar) (c : C.D.BofG) (x : X.GeomPoint) : Set (Gr.points (X.geomPt x)) :=
  {y | y ∈ Gr.schubertCell μ _ ∧ NewtonOrder C.D c (classAt Gr y)}
/-- The class map on the underlying space of `Fℓ_{G,μ}`. -/
def classOnSpace (μ : C.D.Cochar) (p : Gr.flagSpace μ) : C.D.BofG :=
  classAt Gr (Classical.choose (Classical.choose_spec (Gr.flagPoint_surj μ p))).1
theorem acceptableImage [CharZero C.D.E] (μ : C.D.Cochar) (hμ : IsMinuscule C.D μ) :
    {c | ∃ (x : X.GeomPoint) (y : Gr.points (X.geomPt x)), y ∈ Gr.schubertCell μ _ ∧
      classAt Gr y = c} = {c | Acceptable C.D (-μ) c} := by sorry
theorem baseChange {x x' : X.GeomPoint} (f : X.geomPt x' ⟶ X.geomPt x)
    (y : Gr.points (X.geomPt x)) : classAt Gr (Gr.restrict f y) = classAt Gr y := by sorry
end FlagNewton
-- TauCeti.BunG.FlagNewton.testGL2: for `GL₂`, `μ = (1,0)`: exactly the ordinary and the basic class.
example {X : CurveSite E} {SG : StackGeometry X} {C : BunContext X}
    (Gr : GrassmannianInterface X SG C.Rep C.D) [CharZero C.D.E] (μ : C.D.Cochar)
    (hμ : IsMinuscule C.D μ)
    (htwo : ∀ c, Acceptable C.D (-μ) c → Ordinary C.D (-μ) c ∨ Basic C.D c) (x : X.GeomPoint)
    (y : Gr.points (X.geomPt x)) (hy : y ∈ Gr.schubertCell μ _) :
    Ordinary C.D (-μ) (FlagNewton.classAt Gr y) ∨ Basic C.D (FlagNewton.classAt Gr y) := by sorry
-- TauCeti.BunG.FlagNewton.testCentral
example {X : CurveSite E} {SG : StackGeometry X} {C : BunContext X}
    (Gr : GrassmannianInterface X SG C.Rep C.D) [CharZero C.D.E] (μ : C.D.Cochar)
    (hcent : C.D.Central (C.D.rational μ)) (x x' : X.GeomPoint) (y : Gr.points (X.geomPt x))
    (y' : Gr.points (X.geomPt x')) (hy : y ∈ Gr.schubertCell μ _)
    (hy' : y' ∈ Gr.schubertCell μ _) : FlagNewton.classAt Gr y = FlagNewton.classAt Gr y' := by
  sorry
-- TauCeti.BunG.FlagNewton.testSign
example {X : CurveSite E} {SG : StackGeometry X} {C : BunContext X}
    (Gr : GrassmannianInterface X SG C.Rep C.D) [CharZero C.D.E] (μ : C.D.Cochar)
    (hsharp : HodgeInvariants.sharp C.D μ ≠ HodgeInvariants.sharp C.D (-μ)) (x : X.GeomPoint)
    (y : Gr.points (X.geomPt x)) (hy : y ∈ Gr.schubertCell μ _) :
    ¬ Acceptable C.D μ (FlagNewton.classAt Gr y) := by sorry

def FlagNewton {X : CurveSite E} {SG : StackGeometry X} {C : BunContext X}
    (Gr : GrassmannianInterface X SG C.Rep C.D) (μ : C.D.Cochar) (c : C.D.BofG)
    (x : X.GeomPoint) : Set (Gr.points (X.geomPt x)) := FlagNewton.stratum Gr μ c x

theorem FlagStrataSemicontinuity {X : CurveSite E} {SG : StackGeometry X} {C : BunContext X}
    (Gr : GrassmannianInterface X SG C.Rep C.D) [CharZero C.D.E] (μ : C.D.Cochar)
    (hμ : IsMinuscule C.D μ) (c : C.D.BofG) :
    IsClosed {p | NewtonOrder C.D c (FlagNewton.classOnSpace Gr μ p)} ∧
    IsOpen {p | Basic C.D (FlagNewton.classOnSpace Gr μ p)} ∧
    IsLocallyClosed {p | FlagNewton.classOnSpace Gr μ p = c} := by sorry

/-- The CS24 §2.1 datum: the quasi-split unitary similitude group of `F^{2n}` with its standard
skew-hermitian form, signature `(n,n)`, `p` unramified in `F`, `[F⁺ : ℚ] = fieldDegree` (IG.0). -/
structure CS24UnitaryDatum (D : LocalDatum.{u}) where
  n : ℕ
  fieldDegree : ℕ
  GU : Type u
  [guGroup : Group GU]
  ident : D.Pt ≃* GU
  μ : D.Cochar
  minuscule : IsMinuscule D μ
  quasiSplit : IsQuasiSplit D

theorem UnitaryFlagStratumDimension {X : CurveSite E} {SG : StackGeometry X} {C : BunContext X}
    (Gr : GrassmannianInterface X SG C.Rep C.D) [CharZero C.D.E] (U : CS24UnitaryDatum C.D)
    (c : C.D.BofG) (hc : Acceptable C.D (-U.μ) c) :
    ∃ db : ℕ, (db : ℚ) = C.D.twoRho (Invariants.newtonRat C.D c) ∧
      topologicalKrullDim {p // FlagNewton.classOnSpace Gr U.μ p = c} =
        ((U.n ^ 2 * U.fieldDegree - db : ℕ) : WithBot ℕ∞) := by sorry

theorem UnitaryOrdinaryFlagLocus {X : CurveSite E} {SG : StackGeometry X} {C : BunContext X}
    (Gr : GrassmannianInterface X SG C.Rep C.D) [CharZero C.D.E] (U : CS24UnitaryDatum C.D) :
    ∃ c, Ordinary C.D (-U.μ) c ∧ (∀ c', Acceptable C.D (-U.μ) c' → NewtonOrder C.D c' c) ∧
      topologicalKrullDim {p // FlagNewton.classOnSpace Gr U.μ p = c} = 0 := by sorry

/-! ### BG4: filtered charts -/
namespace FilteredChart
variable {X : CurveSite E} (C : BunContext X)
/-- `M(S)`: `G`-bundles with an increasing `ℚ`-filtration whose graded pieces are semistable of
their weights (opposite to the HN filtration). -/
abbrev Obj (S : X.Perf) := ObjectProperty.FullSubcategory
  (fun P : TensorFunctors C.Rep (C.Fl.filtered S) =>
    ∀ V, C.Fl.SemistablePieces S
      (TensorInterface.Data.evaluate (P.postcompose (C.Fl.assocGraded S)) V))
def graded (S : X.Perf) : Obj C S ⥤ HNGraded.Obj C S where
  obj P := ⟨P.obj.postcompose (C.Fl.assocGraded S), P.property⟩
  map φ := by sorry
  map_id := by sorry
  map_comp := by sorry
def forget (S : X.Perf) : Obj C S ⥤ C.Obj S where
  obj P := P.obj.postcompose (C.Fl.forgetFiltration S)
  map φ := by sorry
  map_id := by sorry
  map_comp := by sorry
def split (S : X.Perf) : HNGraded.Obj C S ⥤ Obj C S where
  obj P := ⟨P.obj.postcompose (C.Fl.splitFiltration S), by sorry⟩
  map φ := by sorry
  map_id := by sorry
  map_comp := by sorry
def pullback {S T : X.Perf} (f : T ⟶ S) : Obj C S ⥤ Obj C T := by sorry
/-- The chart `M_b`, its maps `q_b` and `π_b`, the split section, and the graded framing
`M̃_b = M_b ×_{[∗/J_b(E)]} ∗` with its punctured complement. -/
def chartStack (b : C.D.Pt) : Prestack X := by sorry
def qChart (SG : StackGeometry X) (b : C.D.Pt) : chartStack C b ⟶ SG.classifying (C.J b) := by
  sorry
def piChart (b : C.D.Pt) : chartStack C b ⟶ C.Bun := by sorry
def chartSection (SG : StackGeometry X) (b : C.D.Pt) : SG.classifying (C.J b) ⟶ chartStack C b :=
  by sorry
def gradedFraming (SG : StackGeometry X) (b : C.D.Pt) : Prestack X :=
  SG.fibreProduct (qChart C SG b) (SG.basePoint (C.J b))
def puncturedFraming (b : C.D.Pt) : Prestack X := by sorry
/-- The action of `U_π = (N ν_{b,J})(π) ∈ J_b(E)` on the punctured framed chart. -/
def uAction (b : C.D.Pt) : puncturedFraming C b ⟶ puncturedFraming C b := by sorry
end FilteredChart
-- TauCeti.BunG.FilteredChart.testGL2Extension: for graded `O` and `O(1)` the framed chart is
-- `Ext¹(O(1), O) = BC(O(-1)[1])`.
example {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X) (b : C.D.Pt) (S : X.Perf) :
    Nonempty (((FilteredChart.gradedFraming C SG b).obj ⟨Opposite.op S⟩ : Type u) ≃
      C.bcAdjoint b S (-1)) := by sorry
-- TauCeti.BunG.FilteredChart.testBasic
example {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X) (b : C.D.Pt)
    (hb : Basic C.D (SigmaClass.mk C.D.frob b)) : IsObjectwiseEquiv (FilteredChart.qChart C SG b) :=
  by sorry
-- TauCeti.BunG.FilteredChart.testOpposite: chart weights increase along the filtration, while HN
-- slopes decrease.
example {X : CurveSite E} (C : BunContext X) (x : X.GeomPoint)
    (P : FilteredChart.Obj C (X.geomPt x)) (V : C.Rep.carrier) :
    (C.Fl.filtrationSlopes _ (TensorInterface.Data.evaluate P.obj V)).Pairwise (· ≤ ·) ∧
      (X.slopes x (GBundle.evaluate ((FilteredChart.forget C _).obj P) V)).Pairwise (· ≥ ·) := by
  sorry

abbrev FilteredChart {X : CurveSite E} (C : BunContext X) (S : X.Perf) := FilteredChart.Obj C S

theorem QuasiSplitParabolicChart {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X)
    (b : C.D.Pt) (hqs : IsQuasiSplit C.D) (w : RationalNewtonWitness C.D b)
    (CP CM : BunContext X) (resPM : TensorFunctors CM.Rep CP.Rep) (bM : CM.D.Pt)
    (iM : LocalDatum.Hom CM.D C.D) (hLevi : ∀ α ∈ C.D.roots, α w.ν = 0 → ∃ β ∈ CM.D.roots,
      ∀ v, β v = α (iM.rat v)) (hbM : Basic CM.D (SigmaClass.mk CM.D.frob bM))
    (himg : SigmaClass.map _ _ iM.pt iM.pt_frob (SigmaClass.mk CM.D.frob bM) =
      SigmaClass.mk C.D.frob b) :
    ∃ f : SG.fibreProduct (Bun.extendMap X resPM)
        (BunContext.substackIncl SG CM (· = SigmaClass.mk CM.D.frob bM)) ⟶
      FilteredChart.chartStack C b, IsObjectwiseEquiv f := by sorry

theorem ChartOverClassifyingStack {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X)
    (b : C.D.Pt) :
    SG.PartiallyProper (FilteredChart.qChart C SG b) ∧ SG.ReprLSD (FilteredChart.qChart C SG b) ∧
    (∃ d : ℤ, (d : ℚ) = C.D.twoRho (C.D.newtonRep b) ∧
      SG.CohSmooth (FilteredChart.qChart C SG b) d) ∧
    (¬ Basic C.D (SigmaClass.mk C.D.frob b) →
      ¬ SG.IsLocallySpatialDiamond (FilteredChart.gradedFraming C SG b) ∧
        SG.ReprLSD (SG.toTerminal (FilteredChart.gradedFraming C SG b))) := by sorry

theorem SectionAndSpatialComplement {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X)
    (b : C.D.Pt) :
    SG.ClosedImmersion (FilteredChart.chartSection C SG b) ∧
    SG.IsSpatialDiamond (FilteredChart.puncturedFraming C b) ∧
    ∀ (x : X.GeomPoint) (P : FilteredChart.Obj C (X.geomPt x)),
      Nonempty (((FilteredChart.graded C _).obj P) ≅ HNGraded.ofClass C b _) →
      NewtonOrder C.D (C.geomClass SG x ((FilteredChart.forget C _).obj P))
        (SigmaClass.mk C.D.frob b) := by sorry

theorem ContractingChartAction {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X)
    (b : C.D.Pt) :
    SG.Proper (SG.toTerminal (SG.quotientByEndo (FilteredChart.puncturedFraming C b)
      (FilteredChart.uAction C b))) := by sorry

theorem ChartJacobianPositivity {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X)
    (b : C.D.Pt) (Sstk : Prestack X) (s : Sstk ⟶ C.Bun) :
    ∃ d : ℤ, (d : ℚ) = C.D.twoRho (C.D.newtonRep b) ∧
      SG.CohSmooth (SG.fibreSnd (FilteredChart.piChart C b) s) d := by sorry

theorem ChartToBunG {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X) (b : C.D.Pt) :
    SG.Separated (FilteredChart.piChart C b) ∧ SG.PartiallyProper (FilteredChart.piChart C b) ∧
    SG.ReprLSD (FilteredChart.piChart C b) ∧
    (∃ d : ℤ, (d : ℚ) = C.D.twoRho (C.D.newtonRep b) ∧
      SG.CohSmooth (FilteredChart.piChart C b) d) ∧
    Set.range (C.spaceEquiv SG ∘ SG.spaceMap (FilteredChart.piChart C b)) =
      {c | NewtonOrder C.D c (SigmaClass.mk C.D.frob b)} := by sorry

theorem Gl2ExtensionChart {X : CurveSite E} (SG : StackGeometry X) (C : BunContext X)
    (b : C.D.Pt)
    (htwo : ∀ c, NewtonOrder C.D c (SigmaClass.mk C.D.frob b) → c = SigmaClass.mk C.D.frob b ∨
      Basic C.D c)
    (x : X.GeomPoint) (P : FilteredChart.Obj C (X.geomPt x))
    (hP : Nonempty (((FilteredChart.graded C _).obj P) ≅ HNGraded.ofClass C b _)) :
    C.geomClass SG x ((FilteredChart.forget C _).obj P) = SigmaClass.mk C.D.frob b ∨
      C.geomClass SG x ((FilteredChart.forget C _).obj P) =
        (Basic.ofKottwitz C.D (Invariants.kottwitz C.D (SigmaClass.mk C.D.frob b))).1 := by sorry
end TauCeti.BunG

/-
Owner interfaces and admitted constructions.

The parameters gathered in `LocalDatum`, `ExactTensorCat`, `CurveSite`, `StackGeometry`,
`SlopeFiltrations`, `GrassmannianInterface`, `EtaleSites`, `LocallyProfiniteTorsors`,
`GroupSheafTorsors`, `IsocrystalFamilies`, `CrossedModuleCohomology`, `CurveCrossedModule` and
`BunContext` are the owners' objects (gap G08 records their instantiation at the pins); the
packet's requests name each owner stage. The prestack-valued constructions `Bun.stack`,
`BunContext.substack`/`substackIncl`, `BunContext.diagonal`, `Bun.extendMap`, `HNGraded.stack`,
`FullAutomorphism.stack`/`kernelStack`, `GIsocrystalFamily.stack`, the `FilteredChart` stacks and
maps, and `GrassmannianInterface.mapOf`/`pointMap` are typed with admitted bodies, because their
bodies are D0 stackification or D3 sub-prestack constructions; their objects are described by
`Bun.stack_obj`, `BunContext.substack_obj` and the S-point types `BunContext.ObjWithClasses`,
`HNGraded.Obj` and `FilteredChart.Obj`, which have real bodies.
-/
