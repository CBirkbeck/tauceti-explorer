/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/BunGAndNewtonStrata.md is definitive. These statements
suggest Lean forms so that contributors and reviewers converge on names and
signatures. They claim no implementation; implementationStatus stays unchecked.
Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.
Individual Mathlib and TauCeti modules are imported at the recorded pins.
The expressible cores are a twisted group quotient, its point stabilizer, the
finite twisted product, an affine additive difference fibre and rational GL_n
slope data. A point group is not a represented algebraic group, and rational
slope data is not a relative bundle or a v-stack. The exact-name register at
this file's end identifies unavailable supplier carriers under gap G08.
The native exact tensor interface below checks categorical data and coherence
without claiming the missing analytic instantiation. Fundamental-group and
z-extension foundations are imported from existing upstream RG2.1.5; no
duplicate root-quotient theory is planned here.
All theorem and example proofs are sorry; elaboration checks types, not proofs.
-/
import Mathlib.Algebra.Group.Subgroup.Basic
import Mathlib.Algebra.Group.Equiv.Defs
import Mathlib.Data.Rat.BigOperators
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Fin.Tuple.Basic
import Mathlib.Topology.Defs.Filter
import Mathlib.CategoryTheory.Linear.LinearFunctor
import Mathlib.CategoryTheory.Monoidal.Braided.Basic
import Mathlib.CategoryTheory.Monoidal.NaturalTransformation
import TauCeti.CategoryTheory.Exact.Functor
import TauCeti.Algebra.AlgebraicGroup.Representation.Comodule.Monoidal


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
condition needs the slope protorus and is omitted under G08. -/
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
identification with B(T) is omitted under G08, without replacing the local field. -/
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

/-- Rank correction core; the algebraic split-rank interfaces are supplier work. -/
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
structures are specified inputs; actual analytic instantiation is still G08. -/
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

/-
Exact-name omission register (G08). These are comment contracts, not Lean
declarations. Independent review requires full signatures/API/example coverage
before acceptance; elaboration of restricted cores does not provide it.

BunGAndNewtonStrata:BG0/g-bundle
TauCeti.BunG.GBundle
Full definition contract: For a sousperfectoid E-space X and connected reductive G/E, a G-bundle is an exact E-linear tensor functor from finite rational representations Rep_E(G) to finite locally free bundles on X. Arrows are tensor natural isomorphisms. Exactness means preservation of bundle short exact sequences, not an arbitrary functor or abstract action of G(E).
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: typed-category-interface. Native exact E-linear symmetric tensor data and monoidal natural isomorphisms are elaborated over specified structured categories, with identity/composition coherence and six categorical controls. These restricted interfaces do not supply the actual analytic bundle or general-E isocrystal categories, the full named API, or the geometric reconstruction tests. Those obligations remain G08; no arbitrary geometry carrier or unspecified proposition is introduced.
TauCeti.BunG.GBundle.trivial — constructor: The standard fibre functor V↦V⊗_E O_X defines the trivial G-bundle.
TauCeti.BunG.GBundle.evaluate — projection: For each rational representation V, evaluate a G-bundle to a bundle of rank dim_E V; tensor and dual comparisons are natural.
TauCeti.BunG.GBundle.tensorIso — characterisation: An isomorphism consists of invertible natural maps preserving the unit and tensor constraints.
TauCeti.BunG.GBundle.pullback — functoriality: For f:Y→X, bundle pullback gives f* on G-bundles, with coherent identity and composition isomorphisms.
TauCeti.BunG.GBundle.tensorIso_ext — extensionality: Two tensor natural isomorphisms are equal if their components agree on every finite rational representation.
TauCeti.BunG.GBundle.testGL1 — example contract (compatibility): For G=G_m, evaluation at the standard character identifies G-bundles with line bundles.
TauCeti.BunG.GBundle.testTrivial — example contract (degenerate): For G=1 the G-bundle groupoid has one object up to a unique isomorphism.
TauCeti.BunG.GBundle.testNoFaithfulChoice — example contract (non-example): For GL_2 the standard and standard-plus-determinant faithful realizations recover isomorphic torsors; independent unrelated bundles do not define a tensor functor.

BunGAndNewtonStrata:BG0/g-torsors-three-descriptions
TauCeti.BunG.GTorsorsThreeDescriptions
Full theorem contract: For X sousperfectoid over E and reductive G/E, geometric étale-locally trivial G-torsors, étale sheaf G-torsors, and G-bundles are naturally equivalent categories. Hence their isomorphism classes identify with H¹_et(X,G). The scheme version is fpqc/fppf, with étale comparison for smooth G; do not transplant a scheme statement to an arbitrary adic space.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG0/structure-group-and-tensor-descent
TauCeti.BunG.StructureGroupAndTensorDescent
Full theorem contract: For a morphism f:G→H of connected reductive E-groups, extending a G-bundle is precomposition by restriction Rep(H)→Rep(G); it agrees with contracted product of torsors, commutes with base change and respects identity/composition. Tensor isomorphisms descend effectively for étale covers. Reconstruction by any faithful rational representation with its defining tensors gives the same torsor.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG0/g-isocrystals-and-B-of-G
TauCeti.BunG.GIsocrystal
Full definition contract: A G-isocrystal over L=breve E is an exact E-linear tensor functor Rep_E(G)→Isoc_E, with tensor isomorphisms as arrows. After trivializing its underlying L-fibre functor, Frobenius is bσ for b∈G(L). Steinberg triviality over L permits such a trivialization; it is a choice, not part of the definition.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: typed-category-interface. Native exact E-linear symmetric tensor data and monoidal natural isomorphisms are elaborated over specified structured categories, with identity/composition coherence and six categorical controls. These restricted interfaces do not supply the actual analytic bundle or general-E isocrystal categories, the full named API, or the geometric reconstruction tests. Those obligations remain G08; no arbitrary geometry carrier or unspecified proposition is introduced.
TauCeti.BunG.GIsocrystal.ofRepresentative — constructor: The object from b sends ρ to (Vρ⊗_E L,ρ(b)σ).
TauCeti.BunG.GIsocrystal.forget — projection: Forget Frobenius to the underlying L-fibre functor; retain its tensor constraints.
TauCeti.BunG.GIsocrystal.changeTrivialization — equivalence: A change g of trivialization identifies the representatives b and g b σ(g)^−1.
TauCeti.BunG.GIsocrystal.map — functoriality: A group morphism carries b to f(b) and agrees with precomposition of rational representations.
TauCeti.BunG.GIsocrystal.testGLn — example contract (compatibility): For GL_n with E=Q_p this agrees with finite-dimensional WittVector.Isocrystal over k=bar F_p, after fixing the coefficient identification.
TauCeti.BunG.GIsocrystal.testUnit — example contract (degenerate): b=1 gives standard Frobenius on each representation.
TauCeti.BunG.GIsocrystal.testTensorSlope — example contract (computation): For G_m representatives π^a and π^b, tensoring has slope a+b and duality has slope −a.

BunGAndNewtonStrata:BG0/sigma-conjugacy-quotient
TauCeti.BunG.SigmaClass
Full definition contract: B(G)=G(L)/~ where b~bprime iff bprime=g b σ(g)^−1 for some g∈G(L). Here σ is arithmetic q-Frobenius fixing E and its uniformizer. This orbit quotient is the set of isomorphism classes of G-isocrystals; the groupoid itself retains automorphisms.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: typed-pointwise-core. These declarations type only the explicitly restricted abstract-group or affine-fibre core. The general-E coefficient groups, represented reductive groups, and geometric signatures still depend on G08 suppliers; the register is not signature coverage.
TauCeti.BunG.SigmaClass.mk — constructor: Send b∈G(L) to its sigma class.
TauCeti.BunG.SigmaClass.mk_eq_iff — characterisation: Two representative classes are equal precisely when a sigma conjugator exists.
TauCeti.BunG.SigmaClass.map — functoriality: A σ-compatible group homomorphism gives B(G)→B(H), with identity and composition laws.
TauCeti.BunG.SigmaClass.lift — universal-property: Every function on G(L) invariant under twisted conjugation descends uniquely to B(G).
TauCeti.BunG.SigmaClass.testGL1 — example contract (computation): For split G_m, valuation gives B(G_m)≅Z.
TauCeti.BunG.SigmaClass.testIdentitySigma — example contract (compatibility): With σ the identity the orbit relation is ordinary conjugacy.
TauCeti.BunG.SigmaClass.testCommutative — example contract (non-example): For an abelian group the relation is multiplication by g/σ(g), not equality unless σ is trivial.

BunGAndNewtonStrata:BG0/sigma-centralizer-J-b
TauCeti.BunG.SigmaCentralizer
Full construction contract: For b∈G(L), J_b is the reductive E-group representing A↦{g∈G(A⊗_E L):g b=b σ(g)}. Its L-base change is the centralizer M_b of ν_b. It is an inner form of the corresponding Levi in the quasi-split inner form G*, and is an inner form of G* precisely when b is basic. Descent uses the semilinear action Ad(b)σ on M_b.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.SigmaCentralizer.points — characterisation: For every E-algebra A, membership is exactly g b=b σ(g).
TauCeti.BunG.SigmaCentralizer.baseChange — compatibility: J_b⊗_E L≅Z_(G_L)(ν_b), with the descended semilinear datum.
TauCeti.BunG.SigmaCentralizer.conjugate — equivalence: For bprime=g b σ(g)^−1, h↦g h g^−1 induces J_b≅J_bprime.
TauCeti.BunG.SigmaCentralizer.autIsocrystal — equivalence: J_b(E) is the tensor automorphism group of the G-isocrystal defined by b.
TauCeti.BunG.SigmaCentralizer.testTrivial — example contract (degenerate): J_1(E)=G(E).
TauCeti.BunG.SigmaCentralizer.testBasicGL2 — example contract (computation): For the simple GL_2 slope1/2 block, J_b(E)=A_(1/2)^×; two copies give GL_2(A_(1/2)). For the simple GL_3 slope1/3 block its division algebra has arithmetic invariant −1/3=2/3 mod Z, detecting the sign hidden by the half-slope case.
TauCeti.BunG.SigmaCentralizer.testNonbasic — example contract (non-example): For GL_2 slopes0,1, the algebraic J_b is G_m×G_m, while the bundle automorphism v-group also has a positive-slope kernel.

BunGAndNewtonStrata:BG0/sigma-centralizer-conjugacy
TauCeti.BunG.SigmaCentralizerConjugacy
Full lemma contract: If bprime=g b σ(g)^−1 then conjugation h↦g h g^−1 induces an E-group isomorphism J_b≅J_bprime and identifies their tensor automorphism actions. The transport is compatible with products of changes of trivialization.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: typed-pointwise-core. These declarations type only the explicitly restricted abstract-group or affine-fibre core. The general-E coefficient groups, represented reductive groups, and geometric signatures still depend on G08 suppliers; the register is not signature coverage.

BunGAndNewtonStrata:BG0/decent-representative
TauCeti.BunG.DecentRepresentative
Full definition contract: For a positive integer r and b∈G(L), require rν_b to be integral and (bσ)^r=(rν_b)(π)σ^r in G(L)⋊<σ>. Equivalently b σ(b)⋯σ^(r−1)(b)=(rν_b)(π), exactly r factors. A decent representative admits finite unramified descent; the definition excludes r=0.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.DecentRepresentative.mk — constructor: Package b, r>0, integrality of rν_b and the r-factor equation.
TauCeti.BunG.DecentRepresentative.equation — projection: Expose the semilinear power equation with the chosen uniformizer.
TauCeti.BunG.DecentRepresentative.multiple — compatibility: A decent period r may be replaced by a positive multiple, with the matching integral slope.
TauCeti.BunG.DecentRepresentative.finiteDescent — data: Supply the unramified degree-r coefficient field and descended b and Newton map.
TauCeti.BunG.DecentRepresentative.testRankOne — example contract (computation): b=π^m has period1 and integral Newton point m.
TauCeti.BunG.DecentRepresentative.testUnit — example contract (degenerate): b=1 has period1 and zero Newton point.
TauCeti.BunG.DecentRepresentative.testPositivePeriod — example contract (non-example): The zero period is excluded, even though its empty-product equality is tautological.

BunGAndNewtonStrata:BG0/existence-of-decent-representative
TauCeti.BunG.ExistenceOfDecentRepresentative
Full theorem contract: Every class of B(G) has a decent representative for some sufficiently divisible positive r. In the mixed-characteristic GLX setting r can be enlarged so G is quasi-split over E_r and the representative has the chosen dominant Newton map.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG0/defect
TauCeti.BunG.Defect
Full definition contract: For the connected reductive local group G and its algebraic sigma-centralizer J_b, def_G(b)=rank_E G−rank_E J_b as an integer. The ranks are split ranks over E, not absolute ranks over L and not dimensions of topological point groups.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.Defect.value — data: Return rank_E G−rank_E J_b in Z.
TauCeti.BunG.Defect.conjugate — compatibility: Sigma conjugate representatives have equal defect.
TauCeti.BunG.Defect.product — simp: Defect is additive for products of groups and classes.
TauCeti.BunG.Defect.testUnit — example contract (degenerate): For split GL_n and b=1 the defect is0.
TauCeti.BunG.Defect.testHalf — example contract (computation): For split GL_2 and simple slope1/2, ranks2 and1 give defect1.
TauCeti.BunG.Defect.testSplitNonbasic — example contract (non-example): For split GL_2 slopes0,1, J_b is a split rank2 torus, so defect0 although b is nonbasic.

BunGAndNewtonStrata:BG0/pure-inner-twisting
TauCeti.BunG.PureInnerTwisting
Full theorem contract: For a group sheaf H on a site and an H-torsor T, put H_T=Aut_H(T). The bitorsor T induces an equivalence between H-torsors and H_T-torsors by S↦Isom_H(S,T), with the inverse contracted product. Applied on the curve, this is an equivalence of the actual torsor groupoids, not just of isomorphism classes.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG0/basic-inner-form-bundle-equivalence
TauCeti.BunG.BasicInnerFormBundleEquivalence
Full theorem contract: For basic b, the curve group Aut_G(E_b) is J_b×_E X. Pure inner twisting therefore gives Bun_G≃Bun_(J_b), compatible with perfectoid base change and carrying E_b to the trivial J_b-bundle.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG0/division-algebra-morita
TauCeti.BunG.DivisionAlgebraMorita
Full comparison contract: For a simple isocrystal D(a,h) of slope λ=a/h, gcd(a,h)=1 and h>0, set A_λ=End_Φ(D(a,h)). Under the arithmetic Frobenius/Brauer convention of VB0, A_λ≅D_{−λ} has invariant −λ mod Z, and J_b≅A_λ^×. The associated bundle is O(−λ); the natural End comparison identifies A_λ with its endomorphism algebra. Twisting gives an equivalence between rank-h vector bundles and locally free rank-one right (A_λ⊗_E O_X)-modules via E↦Hom(E_b,E), with right action by precomposition. Its inverse is M↦M⊗_(A_λ⊗O_X)E_b, where E_b is a left A_λ-module. For m copies the automorphism group is GL_m(A_λ). This is a Morita/torsor equivalence.
Hypotheses: The local field and arithmetic Frobenius conventions of VB0 apply; λ is the isocrystal slope, so the bundle slope is −λ. Right modules use Hom(E_b,E); the Hom(E,E_b) functor in FS Example III.4.4 uses left modules.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG1/levi-newton-formula
TauCeti.BunG.LeviNewtonFormula
Full theorem contract: For quasi-split G/Q_p and a rational standard Levi M, a basic class b_M with κ_M(b_M)=μ_M♯ has Newton point the corresponding element of (X_*(Z_M)⊗Q)^Γ. If μ_M and μ have the same image in π_1(G), its image in B(G) is acceptable for μ precisely when its G-dominant Newton point is bounded by μ◇. The M-dominant and G-dominant representatives can differ by a Weyl conjugation.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG1/minuscule-basic-levi-lift
TauCeti.BunG.MinusculeBasicLeviLift
Full theorem contract: For a connected reductive G/Q_p, a rational Levi M containing a maximal torus T, a G-minuscule μ∈X_*(T), and basic b_M whose image lies in B(G,{μ}), some w in the absolute Weyl group W(G,T) makes b_M∈B(M,{wμ}). For quasi-split G the proof first treats unramified models, then replaces the based-root averaging datum by an unramified datum; the general case transports the rational Levi to G*.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG1/torus-special-pair
TauCeti.BunG.TorusSpecial
Full definition contract: For T⊂G a maximal torus over Q_p, an acceptable pair ([b],{μ}) is T-special if there exists μ_T∈X_*(T) in {μ} such that the unique class of B(T) with κ_T=[μ_T] maps to [b]. For tori admissibility is determined by κ, and the Newton point is the Galois average of μ_T. This packages local specialness, not a global CM point.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.TorusSpecial.mk — constructor: Package μ_T, its conjugacy class and its torus-class image equation.
TauCeti.BunG.TorusSpecial.witness — projection: Recover μ_T and the B(T) class.
TauCeti.BunG.TorusSpecial.newton — compatibility: The mapped class has Newton orbit the image of average(μ_T).
TauCeti.BunG.TorusSpecial.ellipticBasic — constructor: For elliptic T a basic acceptable pair has a T-special witness.
TauCeti.BunG.TorusSpecial.testSplitGL1 — example contract (computation): For G=T=G_m, μ=m gives the class of p^m.
TauCeti.BunG.TorusSpecial.testZero — example contract (degenerate): The trivial class with μ=0 is T-special.
TauCeti.BunG.TorusSpecial.testSplitTorus — example contract (non-example): For GL_2, the basic slope1/2 class cannot come from an integral cocharacter of the split diagonal torus; the ellipticity hypothesis matters.

BunGAndNewtonStrata:BG1/elliptic-torus-basic-image
TauCeti.BunG.EllipticTorusBasicImage
Full theorem contract: If T⊂G is elliptic modulo Z(G), the image of B(T)→B(G) is exactly B(G)_basic. For every basic acceptable pair ([b],{μ}) and every μ_T∈X_*(T) in {μ}, the image of κ_T^−1([μ_T]) is [b]. Thus every such pair is T-special; this argument requires no minuscule hypothesis.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG1/transferred-torus-specialness
TauCeti.BunG.TransferredTorusSpecialness
Full theorem contract: Under a rational Newton witness, a G-minuscule acceptable pair and a rational transfer j:Tprime→M_[b] of a maximal torus of J_b, the pair is j(Tprime)-special. There is μ_Tprime in the prescribed geometric class whose Galois average equals the central morphism ν_(b,J). Such a transfer exists if G is quasi-split or Tprime is elliptic; geometric conjugacy alone is not a transfer.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG1/ordinary-class
TauCeti.BunG.Ordinary
Full definition contract: An acceptable class is μ-ordinary when its transferred dominant Newton point equals μ◇. Classification makes such a class unique if it exists. Its existence is guaranteed for quasi-split G; it is not automatic for a general inner form. For either characteristic, every B(G,{μ}) has a unique maximum, which need not satisfy ordinary equality.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.Ordinary.isOrdinary — relation: Acceptability and equality of transferred Newton with μ◇.
TauCeti.BunG.Ordinary.unique — characterisation: At most one acceptable class is ordinary.
TauCeti.BunG.Ordinary.quasiSplitExists — universal-property: Quasi-split G admits the ordinary class.
TauCeti.BunG.Ordinary.maximal — other: An ordinary class is the maximum of B(G,{μ}).
TauCeti.BunG.Ordinary.derivedIsogeny — compatibility: A morphism inducing an isogeny on derived groups preserves ordinary existence and membership for compatible μ.
TauCeti.BunG.Ordinary.testGL2 — example contract (computation): For split GL_2 μ=(1,0), slopes1,0 are ordinary and1/2,1/2 are not.
TauCeti.BunG.Ordinary.testTorus — example contract (degenerate): The unique acceptable torus class is ordinary.
TauCeti.BunG.Ordinary.testQuaternion — example contract (non-example): For G=D^× with invariant1/2 and geometric μ inverse=(0,−1), the acceptable set has its basic maximum but no ordinary member: after splitting/twisting the hypothetical slopes1/2,−1/2 each have multiplicity1, contrary to their denominator2.

BunGAndNewtonStrata:BG1/acceptable-unique-maximum
TauCeti.BunG.AcceptableUniqueMaximum
Full theorem contract: For a connected reductive group G over any nonarchimedean local field E with finite residue field, and a geometric conjugacy class {μ}, B(G,{μ}) has a unique maximum for the fixed-integral-κ Newton order. It is ordinary exactly when its Newton point equals μ◇. The general-field assertion is derived from the characteristic-independent root-datum theorem HN18 Theorem1.1(1) and the local straight-class/invariant comparison; it is not attributed to HN18 Theorem0.1 outside that theorem’s p-adic scope.
Hypotheses: G/E is connected reductive, E is a nonarchimedean local field of either characteristic, and {μ} is a geometric cocharacter conjugacy class. No quasi-split hypothesis.; Use the actual local affine root datum and Frobenius action from RG2.4. Retain the full integral κ fibre while removing central inertia torsion for the numerical root-datum calculation.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG1/straight-weyl-classification
TauCeti.BunG.StraightWeylClassification
Full theorem contract: For the local Iwahori–Weyl group with its specified Frobenius and parahoric root datum, the map from σ-straight σ-conjugacy classes of Weyl elements to B(G) is a bijection and preserves κ and dominant Newton points. For w, choose n killing the finite Weyl/Frobenius action and write wσ(w)⋯σ^(n−1)(w)=t_λ; ν_w=λ/n. The straightness criterion is length(w)=<2ρ_Σ,ν_w^dom>. Generic affine Weyl groups, lengths and Adm(μ) belong to RG2.4.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG1/ordinary-straight-translation
TauCeti.BunG.OrdinaryStraightTranslation
Full theorem contract: Every ordinary class has a representative lifting a σ-straight translation t_μprime with μprime in the relative Weyl orbit of the projected μ. Such a translation has μprime central in the rational Newton Levi. If μprime=w(μ) with μ the projection of an absolute dominant cocharacter μtilde, the compatible absolute lift w(μtilde) is central in that Levi. The absolute/relative projection and Frobenius are part of the supplied root datum.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG1/ordinary-derived-isogeny
TauCeti.BunG.OrdinaryDerivedIsogeny
Full theorem contract: If f:G→Gprime induces an isogeny of derived groups and sends μ to μprime, the ordinary class exists for (G,μ) iff it exists for (Gprime,μprime). For b∈B(G,{μ}), b is ordinary iff f(b) is ordinary. The proof compares the noncentral root data and restores the central equality from acceptability.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG1/ordinary-integral-conjugacy
TauCeti.BunG.OrdinaryIntegralConjugacy
Full theorem contract: In the KZ local setup with the specified connected parahoric model, if b is μ-ordinary and lies in the union of μ-admissible parahoric double cosets, b lies in the double coset of a σ-straight translation t_μprime for μprime in W_0μ. It is σ-conjugate to the chosen translation lift by an element of G(O_breveF). The claim is for elements satisfying the integral double-coset hypothesis, not every representative of the ordinary class.
Hypotheses: Use KZ §2.1: F a nonarchimedean local field, connected reductive G/F, a σ-stable alcove, its Iwahori model I, and a specified connected parahoric model G_script with subgroup W_J. Require b to lie in both the μ-admissible parahoric double-coset union and the ordinary class. Here G_script(O_breveF) is the parahoric subgroup, not the rational points of G.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG1/product-and-unramified-norm
TauCeti.BunG.ProductAndUnramifiedNorm
Full comparison contract: B(G1×G2)=B(G1)×B(G2), compatibly with ν,κ,defect and acceptable bounds. For E/F unramified of degree d and G=Res_(E/F)H, after decomposing G(breveF) into d factors, Nm(b)=b_0 σ(b_1)⋯σ^(d−1)(b_(d−1)) gives B(G,σ)≅B(H,σ_E). The bound on H is the sum of the component cocharacters, with the chosen factor identifications. J_b^G≅Res_(E/F)J_Nm(b)^H and the F/E split-rank defects agree.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG1/basic-levi-fibre-uniqueness
TauCeti.BunG.BasicLeviFibreUniqueness
Full theorem contract: For a basic G-class and a σ-stable standard Levi, its intersection with the Levi has at most one Levi σ-conjugacy class. For a nonbasic G-class the corresponding uniqueness assertion is false; the Levi-dominant Newton vector can be a Weyl conjugate of the G-dominant vector and Levi κ must be checked separately.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG0/families-of-g-isocrystals
TauCeti.BunG.GIsocrystalFamily
Full definition contract: For a perfect F_q-algebra R, put L_R=R((t)) in equal characteristic and L_R=W_(O_E)(R)[1/π] in mixed characteristic. A family is a G-torsor on Spec L_R with a Frobenius descent isomorphism. This is a groupoid-valued prestack on perfect schemes; it is distinct from the geometric groupoid G-Isoc and from Bun_G on perfectoid spaces.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.GIsocrystalFamily.pullback — functoriality: Perfect-algebra maps pull back the torsor and Frobenius isomorphism, coherently.
TauCeti.BunG.GIsocrystalFamily.ofLoopElement — constructor: A loop element b defines the trivial torsor with Frobenius bσ.
TauCeti.BunG.GIsocrystalFamily.geometricClass — projection: A geometric point defines its class in B(G).
TauCeti.BunG.GIsocrystalFamily.loopQuotient — equivalence: After v-stackification the moduli is LG/Ad_σ LG, using v-local triviality of the coefficient-ring torsor.
TauCeti.BunG.GIsocrystalFamily.testField — example contract (compatibility): For R=bar F_q the geometric classes recover B(G).
TauCeti.BunG.GIsocrystalFamily.testTrivial — example contract (degenerate): For G=1 the family groupoid is terminal.
TauCeti.BunG.GIsocrystalFamily.testAutomorphisms — example contract (non-example): For a nonbasic GL_2 class its family automorphisms are J_b(E), not the full positive-kernel bundle automorphisms.

BunGAndNewtonStrata:BG0/isocrystal-family-v-descent
TauCeti.BunG.IsocrystalFamilyVDescent
Full theorem contract: The G-isocrystal family prestack is a v-stack on perfect F_q-schemes. It has locally closed geometric-class strata indexed by B(G), each equivalent to [*/J_b(E)] for the locally profinite rational-point group. This is the family stack statement of FS I.2.1; the algebraic classifying stack [*/J_b] and the bundle stratum with its full automorphisms are different objects.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG1/family-kottwitz-local-constancy
TauCeti.BunG.FamilyKottwitzLocalConstancy
Full theorem contract: For an F_q-scheme S with a G-isocrystal family, the function s↦κ(E_s) in π_1(G)_Γ is locally constant. Perfectifying S preserves the relevant topology. Analytify the family to the curve and apply bundle κ-local-constancy; this establishes the routed FS III.2.8 assertion without assuming it in the family v-descent proof.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG1/abelianized-kottwitz-set
TauCeti.BunG.AbelianizedClass
Full definition contract: For E p-adic, B_ab(G)=H^1(W_E,[Gsc(L^sep)→G(L^sep)]) with the natural crossed-module action. The abelianization map comes from [1→G]→[Gsc→G]. A maximal torus complex [Tsc→T] and center complex [Zsc→Z] are homotopy-equivalent coefficient models, not replacements of G by an arbitrary abelian group.
Hypotheses: E is p-adic; L^sep denotes a separable algebraic closure of L=breve E (the overline of breve E in FS), with its natural W_E-action. Continuous Weil cohomology uses these discrete coefficient groups, not only L-rational points.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.AbelianizedClass.abelianize — functoriality: Send a sigma class to its crossed-module H^1 class.
TauCeti.BunG.AbelianizedClass.torusModel — equivalence: Replace the crossed module by [Tsc(L^sep)→T(L^sep)] for a maximal torus.
TauCeti.BunG.AbelianizedClass.centerModel — equivalence: Replace it by [Zsc(L^sep)→Z(L^sep)].
TauCeti.BunG.AbelianizedClass.map — functoriality: Reductive homomorphisms and compatible simply connected lifts induce the abelianized map.
TauCeti.BunG.AbelianizedClass.testTorus — example contract (compatibility): For a torus Gsc=1, B_ab(T)=B(T).
TauCeti.BunG.AbelianizedClass.testSLn — example contract (degenerate): For simply connected semisimple G the abelianized set is0.
TauCeti.BunG.AbelianizedClass.testPGLn — example contract (computation): For split PGL_n, B_ab(G)=Z/n, which cannot be recovered by rationalization.

BunGAndNewtonStrata:BG1/abelianization-identification
TauCeti.BunG.AbelianizationIdentification
Full theorem contract: For p-adic E there is a canonical B_ab(G)≅π_1(G)_Γ under which B(G)→B_ab(G) is κ. In a maximal-torus model this is coker(B(Tsc)→B(T)), using H^2(W_E,Tsc(L^sep))=0 and the torus Kottwitz descriptions.
Hypotheses: E is p-adic; L^sep denotes a separable algebraic closure of L=breve E (the overline of breve E in FS), with its natural W_E-action. Continuous Weil cohomology uses these discrete coefficient groups, not only L-rational points.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG2:uniformization/curve-etale-base-site
TauCeti.BunG.CurveEtaleBase
Full construction contract: For S∈Perf_k, define τ:(X_S)_et→S_et through (X_S)_et≅(X_S^diamond)_et≅(Div^1_S)_et and the projection Div^1×S→S. Equivalently τ* sends étale T/S to X_T/X_S. This is a site morphism; no geometric projection X_S→S is postulated.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.CurveEtaleBase.pullback — projection: On an étale T→S, τ* is X_T→X_S.
TauCeti.BunG.CurveEtaleBase.baseChange — compatibility: The square for Sprime→S commutes up to the natural site equivalence.
TauCeti.BunG.CurveEtaleBase.pushforward — universal-property: Use the induced adjoint sheaf pushforward and derived pushforward.
TauCeti.BunG.CurveEtaleBase.constantComparison — functoriality: The structural E-map induces RΓ_et(Spa E,F)→Rτ*(F|X_S).
TauCeti.BunG.CurveEtaleBase.testGeometric — example contract (compatibility): For geometric S, the comparison is the curve/local-field cohomology comparison.
TauCeti.BunG.CurveEtaleBase.testTrivialSheaf — example contract (degenerate): The zero finite sheaf has zero derived pushforward.
TauCeti.BunG.CurveEtaleBase.testCoproduct — example contract (compatibility): For T=S⊔S in S_et, τ*(T) is X_S⊔X_S over X_S, with the two inclusions preserved. This checks the actual inverse-image site functor.

BunGAndNewtonStrata:BG2:uniformization/curve-torsion-cohomology
TauCeti.BunG.CurveTorsionCohomology
Full comparison contract: For p-adic E, S∈Perf_k and a locally constant finite abelian sheaf F on Spa(E)_et, Rτ*(F|X_S) is the constant complex RΓ_et(Spa E,F). For algebraically closed perfectoid C the comparison is an isomorphism in all degrees. Prime-to-p coefficients use Kummer and p coefficients use Artin–Schreier after tilting.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG2:uniformization/diagonalizable-curve-cohomology
TauCeti.BunG.DiagonalizableCurveCohomology
Full comparison contract: For p-adic E and diagonalizable D/E, the pro-étale sheaf associated to T/S↦H^1_et(X_T,D) is constant with value H^1(W_E,D(L^sep)). For algebraically closed perfectoid C, H^i(W_E,D(L^sep))≅H^i_et(X_C,D), 0≤i≤2. The natural map comes from the curve étale site to discrete W_E-sets. Use 1→D^0→D→π_0(D)→1 and retain all finite component contributions.
Hypotheses: E is p-adic; L^sep denotes a separable algebraic closure of L=breve E (the overline of breve E in FS), with its natural W_E-action. Continuous Weil cohomology uses these discrete coefficient groups, not only L-rational points.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG2:uniformization/crossed-module-curve-classes
TauCeti.BunG.CrossedModuleCurveClasses
Full theorem contract: For p-adic E, the pro-étale sheaf associated to T/S↦H^1_et(X_T,[Gsc→G]) is constant with value B_ab(G). The comparison identifies the curve abelianization of a bundle with its κ class.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG2:uniformization/bun-g-as-v-stack
TauCeti.BunG.Bun
Full construction contract: For S∈Perf_k, Bun_G(S) is the groupoid of G-bundles on X_S, with pullback along perfectoid maps. Effective v-descent for vector bundles and the rational tensor description make it a v-stack. On affinoid S the algebraic and adic curve descriptions agree by GAGA. The moduli keeps bundle isomorphisms, rather than quotienting them out.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.Bun.objects — projection: Evaluate to the G-bundle groupoid on X_S.
TauCeti.BunG.Bun.pullback — functoriality: For T→S, pullback is X_T←X_S bundle pullback, with coherent identities and compositions.
TauCeti.BunG.Bun.ofIsocrystal — constructor: An exact tensor G-isocrystal gives the constant bundle E_b on every X_S.
TauCeti.BunG.Bun.isomSheaf — projection: The diagonal fibre is the v-sheaf Isom of two G-bundles.
TauCeti.BunG.Bun.gaga — equivalence: For affinoid S compare algebraic and analytic curve torsor categories.
TauCeti.BunG.Bun.pullback_id — simp: Pullback of G-bundles along id_S is naturally tensor-isomorphic to the identity functor, with its unit coherence.
TauCeti.BunG.Bun.pullback_comp — compatibility: For U→T→S, pullback along the composite is naturally tensor-isomorphic to successive pullback, with the associativity coherence.
TauCeti.BunG.Bun.testGLn — example contract (compatibility): For GL_n, objects are rank-n vector bundles with all bundle isomorphisms.
TauCeti.BunG.Bun.testTrivial — example contract (degenerate): For G=1, Bun_G is the terminal v-stack.
TauCeti.BunG.Bun.testNonbasicHom — example contract (non-example): For GL_2 slopes0,1, bundle automorphisms include positive-slope sections, so the isocrystal-to-bundle functor is not fully faithful on the ungraded categories.

BunGAndNewtonStrata:BG2:uniformization/bun-g-smallness
TauCeti.BunG.BunGSmallness
Full theorem contract: Bun_G is a small v-stack. For an ω_1-cofiltered inverse system of affinoid perfectoids with limit S, Bun_G(S) is the filtered colimit of the groupoids Bun_G(S_i), and its Isom sheaves have the same limit property. Hence bundles and arrows descend to topologically countably generated coefficient algebras, giving a set-sized cover.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG2:uniformization/points-are-B-of-G
TauCeti.BunG.PointsAreBOfG
Full theorem contract: For complete algebraically closed nonarchimedean C/k, b↦E_b gives a bijection B(G)→Bun_G(C)/≅ and consequently B(G)≅|Bun_G|. The slope grading identifies isocrystals with HN-graded bundles; positive-slope H^1 vanishing splits the filtered tensor functor. It does not identify the ungraded groupoids or all their morphisms.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG2:uniformization/hn-sign-and-semicontinuity
TauCeti.BunG.HnSignAndSemicontinuity
Full theorem contract: For E_b, its bundle HN class is ν_b*=w_0(−ν_b) and c_1(E_b)=−κ(b). The HN class ν* on |Bun_G| is upper semicontinuous: specialization can increase the upper-concave HN polygon. Detect the reductive order on rational representations using RR96 Lemma2.2 and VB4 relative semicontinuity.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG2:uniformization/strictly-disconnected-torsors
TauCeti.BunG.StrictlyDisconnectedTorsors
Full theorem contract: Every pro-étale H-torsor on a strictly totally disconnected perfectoid S is trivial when H is a first-countable locally profinite group. Such torsors on arbitrary S are represented by perfectoid spaces as the inverse limit over compact open subgroups. First countability supplies the countable nested system used to choose compatible sections.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG2:uniformization/geometrically-trivial-locus
TauCeti.BunG.GeometricallyTrivialLocus
Full theorem contract: Bun_G^1 is open and [*/G(E)]→Bun_G^1 is an equivalence, where G(E) has its locally profinite topology and torsors are pro-étale. Prove openness before κ-local-constancy: on strictly disconnected bases the ν=0 locus yields E-local systems; their continuous fibre functor is a reductive torsor over C^0(π_0S,E), whose triviality is open by henselian local rings.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG2:uniformization/grassmannian-point-lifting
TauCeti.BunG.GrassmannianPointLifting
Full lemma contract: For strictly totally disconnected S=Spa(R,R+) over Spa(E) and s∈S, Gr_G(R)→Gr_G(K(s)) is surjective. Split G after a finite field extension embedded in R, use the Cartan decomposition, and lift G(B_dR^+(K(s))) through successive nilpotent thickenings by smoothness and Lie algebra surjectivity.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG2:uniformization/beauville-laszlo-surjectivity
TauCeti.BunG.BeauvilleLaszloSurjectivity
Full theorem contract: The modification map BL:Gr_G→Bun_G is a surjection of pro-étale stacks and hence of v-stacks. Over a geometric point and a chosen untilt, every G-bundle can be modified at its untilt point to a trivial bundle. Relatively, lift that modification on a strictly disconnected base and use the geometrically trivial open locus to trivialize it near the given point.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG2:uniformization/central-torus-grassmannian-surjectivity
TauCeti.BunG.CentralTorusGrassmannianSurjectivity
Full lemma contract: For a central extension Gtilde→G with torus kernel Z, Gr_Gtilde→Gr_G is surjective as a v-sheaf. After a splitting field, split maximal-torus cocharacters lift; on Schubert cells compare the unipotent factors and the central torus lattice. Generic Schubert geometry is imported from GS0.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG2:uniformization/central-torus-bundle-surjectivity
TauCeti.BunG.CentralTorusBundleSurjectivity
Full lemma contract: For a central extension Gtilde→G with torus kernel Z, Bun_Gtilde→Bun_G is a v-surjection. Bun_Z acts by central tensor product and Bun_G is its quotient stack; the action is a quasi-torsor before surjectivity is proved.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG2:uniformization/semicontinuity-and-local-constancy
TauCeti.BunG.SemicontinuityAndLocalConstancy
Full theorem contract: κ:|Bun_G|→π_1(G)_Γ is locally constant, with the discrete topology on its integral target. Together with HN semicontinuity this makes |Bun_G|→B(G) continuous for the Newton-order topology. The proof for every local E uses central-torus bundle surjectivity, z-extensions and induced tori; the crossed-module proof is a second proof for p-adic E.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG2:uniformization/grassmannian-kottwitz-sign
TauCeti.BunG.GrassmannianKottwitzSign
Full comparison contract: For split G, GS0’s decomposition Gr_G=∐_(α∈π_1G) Gr_G^α has each component a filtered union of proper Schubert closures with [μ]=α. On the modification map, κ(BL(x))=−α. For nonsplit G, use geometric π_1 with Galois descent and then its Γ-coinvariant image in Bun_G. A component decomposition alone does not prove uniformization or bundle connectedness.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG2:uniformization/newton-topology-homeomorphism
TauCeti.BunG.NewtonTopologyHomeomorphism
Full theorem contract: For every nonarchimedean local field E and connected reductive G/E, the geometric-class bijection |Bun_G|→B(G) is a homeomorphism for the topology whose closed subsets are upward closed in the fixed-κ Newton order. Equivalently, [b]≤[bprime] iff E_bprime lies in the closure of E_b. Mixed characteristic follows from Viehmann. In equal characteristic, combine the schematic closure theorem with the schematic/analytic topology comparison of Gleason–Ivanov–Zillinger; the comparison alone does not identify geometric specialization with the combinatorial order.
Hypotheses: E is a nonarchimedean local field of either characteristic, with finite residue field; G/E is connected reductive, with no quasi-split or unramified hypothesis.; Use GIZ26 arXiv v3: its §2 and Remark2.1 allow both characteristics. He16 §2.5 restricts the schematic closure discussion to equal characteristic; use Vie21 for the mixed-characteristic route.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG3/hn-graded-g-bundles
TauCeti.BunG.HNGraded
Full construction contract: Bun_G^(HN-split)(S) consists of exact rational tensor functors into Q-graded bundles on X_S with weight-λ piece everywhere semistable of bundle slope λ. For b, use the slope-reversed grading of E_b. Forgetting the grading lands in Bun_G. The graded automorphism group scheme is the constant curve group J_b×X_S.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.HNGraded.forget — functoriality: Forget grading to Bun_G.
TauCeti.BunG.HNGraded.ofClass — constructor: E_b has its canonical Q-grading from the isocrystal, with slope reversal.
TauCeti.BunG.HNGraded.automorphisms — characterisation: Aut of the graded object is J_b(E).
TauCeti.BunG.HNGraded.classifying — equivalence: Bun_G^(HN-split)≃∐_(b∈B(G))[*/J_b(E)].
TauCeti.BunG.HNGraded.testGL2 — example contract (computation): For O⊕O(1), graded automorphisms are E××E×.
TauCeti.BunG.HNGraded.testBasic — example contract (degenerate): For a basic object no positive grading-changing kernel occurs.
TauCeti.BunG.HNGraded.testUngraded — example contract (non-example): For O⊕O(1), ungraded automorphisms also contain BC(O(1)), which grading removes.

BunGAndNewtonStrata:BG3/hn-graded-classification
TauCeti.BunG.HnGradedClassification
Full theorem contract: The natural map ∐_b[*/J_b(E)]→Bun_G^(HN-split) is an equivalence. The graded fibre is locally isomorphic to E_b^gr and its Isom torsor is a J_b-bundle geometrically trivial at the chosen point; openness and locally profinite torsor triviality make it locally constant.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG3/filtered-automorphism-group-scheme
TauCeti.BunG.FilteredAutomorphism
Full construction contract: For a reductive G/K, scheme X/K and Q-filtered G-fibre functor E, let H=Aut_G(E), its inner group over X. For λ≥0, H^≥λ consists of automorphisms whose difference from1 raises every represented filtration by at least λ. H^≥0 is parabolic with unipotent radical H^>0; the groups are smooth, Lie H^≥λ=(ad E)^≥λ, and for λ>0 the quotient H^≥λ/H^>λ is the vector group (ad E)^≥λ/(ad E)^>λ.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.FilteredAutomorphism.raising_iff — characterisation: For every rational representation and λprime, (γ−1)E^≥λprime⊂E^≥(λprime+λ).
TauCeti.BunG.FilteredAutomorphism.parabolic — projection: H^≥0 is the filtration-preserving parabolic.
TauCeti.BunG.FilteredAutomorphism.unipotent — projection: H^>0 is its unipotent radical.
TauCeti.BunG.FilteredAutomorphism.graded — equivalence: For λ>0 the quotient is the stated additive vector group.
TauCeti.BunG.FilteredAutomorphism.pullback — functoriality: Scheme pullback commutes with H, its filtration and vector-group quotients.
TauCeti.BunG.FilteredAutomorphism.testGL2 — example contract (computation): For the two-step diagonal filtration the parabolic is triangular and the positive radical has one root line.
TauCeti.BunG.FilteredAutomorphism.testTrivialFiltration — example contract (degenerate): For the trivial filtration H^≥0=H and H^>0=1.
TauCeti.BunG.FilteredAutomorphism.testZeroWeight — example contract (non-example): At λ=0 the reductive Levi quotient is not generally an additive vector group.

BunGAndNewtonStrata:BG3/full-automorphism-v-group
TauCeti.BunG.FullAutomorphism
Full construction contract: For b, tildeJ_b(S)=Aut_(X_S)(E_b). Every automorphism preserves HN; its action on the associated graded gives a split exact sequence 1→tildeJ_b^>0→tildeJ_b→J_b(E)→1, with tildeJ_b=tildeJ_b^>0⋊J_b(E). For positive bundle slope λ the graded quotient is BC((ad E_b)^λ); it corresponds to the isocrystal slope −λ. The connected kernel is generally nonzero for nonbasic b.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.FullAutomorphism.projection — functoriality: Return the action on the HN graded object in J_b(E).
TauCeti.BunG.FullAutomorphism.section — functoriality: The isocrystal automorphism action splits the projection.
TauCeti.BunG.FullAutomorphism.kernel — characterisation: Kernel consists of strictly HN-raising automorphisms.
TauCeti.BunG.FullAutomorphism.graded — equivalence: For λ>0, the filtration quotient is BC of the bundle-slope λ adjoint piece.
TauCeti.BunG.FullAutomorphism.semidirect — equivalence: Identify tildeJ_b with its positive kernel semidirect J_b(E).
TauCeti.BunG.FullAutomorphism.testGL2 — example contract (computation): Aut(O⊕O(1)) consists of invertible triangular matrices with diagonal E× and upper entry BC(O(1)).
TauCeti.BunG.FullAutomorphism.testBasic — example contract (degenerate): For basic b all adjoint slopes are0, so the positive kernel is trivial.
TauCeti.BunG.FullAutomorphism.testAlgebraicJ — example contract (non-example): For the nonbasic example J_b(E)=E××E× alone misses the upper triangular sections.

BunGAndNewtonStrata:BG3/positive-automorphism-kernel
TauCeti.BunG.PositiveAutomorphismKernel
Full theorem contract: tildeJ_b^>0 is a successive extension of positive Banach–Colmez spaces, represented by a locally spatial diamond. For ℓ≠p it is cohomologically smooth of dimension sum_(λ>0) λ·rank((ad E_b)^λ)=<2ρ,ν_b>. Its connectedness identifies π_0 tildeJ_b=J_b(E). All dimensions use the isocrystal dominant ν_b with the slope reversal already incorporated.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG3/quasi-split-opposite-parabolic
TauCeti.BunG.QuasiSplitOppositeParabolic
Full comparison contract: For quasi-split G and a dominant rational ν_b, M_b=Z_G(ν_b), P_b^− is the parabolic with nonpositive ν_b weights. The curve group Q=E_(b_M)×^(M_b)P_b^− has tildeJ_b(S)=Q(X_S) and positive kernel Γ(X_S,R_uQ). The opposite sign reflects the slope-reversing isocrystal-to-bundle functor.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG3/semistable-locus-and-basic-strata
TauCeti.BunG.Semistable
Full construction contract: Bun_G^ss is the full substack where every geometric fibre has central Newton morphism. It is open; κ decomposes it into open and closed basic strata and Bun_G^ss≃∐_(b basic)[*/J_b(E)]. Each basic stratum is neutralized by its chosen E_b; the locally profinite topology on J_b(E) is retained.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.Semistable.mem_iff — characterisation: Every geometric Newton class is basic.
TauCeti.BunG.Semistable.openImmersion — data: The inclusion Bun_G^ss→Bun_G is open.
TauCeti.BunG.Semistable.basicDecomposition — equivalence: Decompose as the disjoint union of basic rational-point classifying stacks.
TauCeti.BunG.Semistable.component — projection: The κ index identifies the basic summand.
TauCeti.BunG.Semistable.testGL2Half — example contract (computation): The bundle of the basic slope1/2 block is semistable of bundle slope−1/2.
TauCeti.BunG.Semistable.testTorus — example contract (degenerate): For a torus Bun_T is entirely semistable.
TauCeti.BunG.Semistable.testUnstable — example contract (non-example): O⊕O(1) is not semistable.

BunGAndNewtonStrata:BG3/torus-picard-stack
TauCeti.BunG.TorusPicard
Full construction contract: For a torus T, Bun_T is a Picard stack fitting into 0→[*/T(E)]→Bun_T→X_*(T)_Γ→0. Every κ-fibre is a T(E)-banded gerbe neutralized by a choice of representative b of its class. A multiplicative splitting exists when a group section of T(L)→B(T) is chosen, for example when B(T) is torsion-free. It is not asserted canonically for a torus with torsion coinvariants.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.TorusPicard.tensor — structure: Contracted product adds the κ classes.
TauCeti.BunG.TorusPicard.kottwitz — functoriality: Bun_T→X_*(T)_Γ is a Picard-stack morphism.
TauCeti.BunG.TorusPicard.fibre — equivalence: A chosen b of κ=β neutralizes the fibre as [*/T(E)].
TauCeti.BunG.TorusPicard.splitOfSection — equivalence: A group section of T(L)→B(T) gives the Picard product decomposition.
TauCeti.BunG.TorusPicard.testGm — example contract (computation): Line bundles form ∐_(d∈Z)[*/E×], with tensor product adding degrees.
TauCeti.BunG.TorusPicard.testTrivial — example contract (degenerate): The trivial torus has the terminal Picard stack.
TauCeti.BunG.TorusPicard.testTorsion — example contract (non-example): For the norm-one torus, the two κ fibres do not by themselves specify a canonical multiplicative splitting.

BunGAndNewtonStrata:BG3/stratum-is-classifying-stack
TauCeti.BunG.StratumIsClassifyingStack
Full theorem contract: For every b, Bun_G^b is the locally closed full substack of bundles geometrically isomorphic to E_b and Bun_G^b≃[*/tildeJ_b]. The map to [*/J_b(E)] has the canonical section induced by the semidirect splitting. For basic b the kernel vanishes; for nonbasic b it must be retained.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG3/automorphism-torsor-reduction
TauCeti.BunG.AutomorphismTorsorReduction
Full lemma contract: Over affinoid perfectoid S, every tildeJ_b-torsor is induced from a J_b(E)-torsor and is representable in locally spatial diamonds; the reduction follows from H^1_v vanishing for the positive Banach–Colmez graded pieces. This is an existence of reduction, not a canonical equivalence of all torsor groupoids.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG3/stratum-dimension
TauCeti.BunG.StratumDimension
Full theorem contract: For ℓ≠p, Bun_G^b is a cohomologically smooth Artin v-stack of ℓ-dimension −<2ρ,ν_b>. The fibre over [*/J_b(E)] has the smooth cover * of relative dimension <2ρ,ν_b>; the rational-point classifying stack has dimension0.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG2:smooth-Artin/isom-sheaf-representability
TauCeti.BunG.IsomSheafRepresentability
Full theorem contract: For G-bundles E1,E2 over X_S, Isom_G(E1,E2) is a locally spatial diamond over S. For vector bundles the surjection locus and isomorphism locus are open subdiamonds of BC(E1∨⊗E2). For general reductive G, a Chevalley faithful representation with its stabilizer line presents Isom_G as finite closed compatibility conditions inside products of these linear Isom diamonds.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG2:smooth-Artin/bun-g-is-smooth-artin
TauCeti.BunG.BunGIsSmoothArtin
Full theorem contract: For ℓ≠p, Bun_G is an ℓ-cohomologically smooth Artin v-stack of ℓ-dimension0. The disjoint union over Galois cocharacter orbits of [G(E)\Gr_(G,μbar)] maps to Bun_G by a separated cohomologically smooth surjection. These are open Schubert cells, not their generally singular closures.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG2:smooth-Artin/connected-components
TauCeti.BunG.ConnectedComponents
Full theorem contract: κ induces π_0(Bun_G)≅π_1(G)_Γ. Every nonempty open substack contains a basic point: restrict to a finite T_0 Newton region, take an open point, and compare the whole-stack dimension0 with the stratum dimension −<2ρ,ν_b> to force central ν_b.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG4/filtered-bundle-chart
TauCeti.BunG.FilteredChart
Full construction contract: M(S) consists of G-bundles E on X_S with an increasing, separated and exhaustive Q-filtration on every rational representation, exact and tensor-compatible, whose weight-λ graded piece is semistable of bundle slope λ. This is opposite to the decreasing HN filtration. The associated graded map to Bun_G^(HN-split) decomposes M=∐_b M_b and gives q_b:M_b→[*/J_b(E)] and π_b:M_b→Bun_G.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.FilteredChart.graded — functoriality: q_b records the graded J_b(E)-torsor.
TauCeti.BunG.FilteredChart.forget — functoriality: π_b forgets the filtration.
TauCeti.BunG.FilteredChart.split — constructor: A graded object gives the split filtered chart section.
TauCeti.BunG.FilteredChart.pullback — functoriality: Pullback preserves filtration subbundles, exactness and graded slopes.
TauCeti.BunG.FilteredChart.gradedFraming — constructor: tildeM_b=M_b×_[*/J_b(E)]* is the chart with a graded trivialization.
TauCeti.BunG.FilteredChart.testGL2Extension — example contract (computation): For graded O and O(1), objects are 0→O→E→O(1)→0 and the framed chart is BC(O(−1)[1]).
TauCeti.BunG.FilteredChart.testBasic — example contract (degenerate): For basic b there is one slope and M_b=[*/J_b(E)].
TauCeti.BunG.FilteredChart.testOpposite — example contract (non-example): The HN filtration of O⊕O(1) begins with O(1); the chart extension filtration begins with O.

BunGAndNewtonStrata:BG4/quasi-split-parabolic-chart
TauCeti.BunG.QuasiSplitParabolicChart
Full comparison contract: For quasi-split G and a rational dominant Newton representative, let M_b=Z_G(ν_b) and P_b be its parabolic with nonnegative ν_b weights. Then M_b(chart)=Bun_(P_b)×_(Bun_(M_b))Bun_(M_b)^(b_M), with the Levi basic summand identified as [*/J_b(E)]. Use the source’s positive Newton parabolic; it is opposite to the curve-HN automorphism parabolic.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG4/chart-over-classifying-stack
TauCeti.BunG.ChartOverClassifyingStack
Full theorem contract: q_b:M_b→[*/J_b(E)] is partially proper, representable in locally spatial diamonds, and ℓ-cohomologically smooth of relative dimension <2ρ,ν_b> for ℓ≠p. After graded framing it is a successive torsor under negative Banach–Colmez v-sheaves, namely H^1 of the negative curve-slope pieces of the opposite unipotent group. The framed v-sheaf itself is not an absolute diamond; its punctured complement is locally spatial, and the representability assertion is relative.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG4/section-and-spatial-complement
TauCeti.BunG.SectionAndSpatialComplement
Full theorem contract: The split section [*/J_b(E)]→M_b is closed and is exactly the locus whose underlying bundle is geometrically E_b. Its framed preimage is the origin. The open complement tildeM_b°=tildeM_b minus {origin} is a spatial diamond. The unsplit extensions satisfy [bprime]≤[b] and can be strictly smaller.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG4/contracting-chart-action
TauCeti.BunG.ContractingChartAction
Full theorem contract: For sufficiently divisible N>0, the central Newton morphism in J_b gives U_π=ν_(b,J)^N(π)∈J_b(E). It contracts the framed extension tower to the origin. On tildeM_b° the Z-action has the source’s escaping property and tildeM_b°/U_π^Z→* is proper. This is ordinary properness, not merely partial properness.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG4/chart-jacobian-positivity
TauCeti.BunG.ChartJacobianPositivity
Full lemma contract: After S→Bun_G corresponds to E, the fibre M×_(Bun_G)S is the open subfunctor of sections of E×^GFl→X_S having semistable graded pieces of their specified slopes. Fl is the disjoint union of projective filtration varieties. Along these sections its tangent bundle has a finite filtration with semistable positive-slope quotients, so the section lies in VS1’s cohomologically smooth locus.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG4/chart-to-bun-g
TauCeti.BunG.ChartToBunG
Full theorem contract: π_b:M_b→Bun_G is separated, partially proper, representable in locally spatial diamonds and ℓ-cohomologically smooth of relative dimension <2ρ,ν_b>. Its open image is exactly the points whose corresponding bundles specialize to E_b; in the fixed-κ order this is {[bprime]:[bprime]≤[b]}. The charts cover Bun_G, since every b lies in its own chart image.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG4/gl2-extension-chart
TauCeti.BunG.Gl2ExtensionChart
Full application contract: For graded bundle O⊕O(1), tildeM_b=BC(O(−1)[1]) parametrizes framed extensions 0→O→E→O(1)→0. E is either split or the simple rank2 slope1/2 bundle. The fibres of π_b are open subspaces of (BC(E) minus {0})/E× of nowhere-vanishing sections giving the prescribed quotient.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG0/finite-frobenius-norm-centralizer
TauCeti.BunG.FiniteFrobeniusNormCentralizer
Full comparison contract: For the degree-r unramified extension K_0/Q_p, δ∈G(K_0), σ^r=id, and γ=δσ(δ)⋯σ^(r−1)(δ), the algebraic twisted centralizer functor defined by δσ(g)=gδ becomes Z_G(γ) after base change to K_0. Extending the coefficient field from degree r to degree rn defines I_(p,n); after extension to L its centralizer is Z_G(γ^n). The norm of δ^n is not substituted for this iterated twisted product. This finite-period comparison is distinct from the infinite-coefficient Newton Levi J_δ.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: typed-pointwise-core. These declarations type only the explicitly restricted abstract-group or affine-fibre core. The general-E coefficient groups, represented reductive groups, and geometric signatures still depend on G08 suppliers; the register is not signature coverage.

BunGAndNewtonStrata:BG2:uniformization/modification-newton-bound
TauCeti.BunG.ModificationNewtonBound
Full theorem contract: For G/Q_p and any geometric cocharacter class μ, a geometric point of Gr_(G,μ) modifying the trivial bundle determines b∈B(G,{μ^−1}). For GL_n the bundle Newton tuple is dominated by its relative-position tuple with matching total degree; translate through ν_bundle=w_0(−ν_isocrystal). The full κ equality is μ^−1♯.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG2:uniformization/minuscule-modification-image
TauCeti.BunG.MinusculeModificationImage
Full theorem contract: For minuscule μ over Q_p, the map from the flag variety Fℓ_(G,μ)≅Gr_(G,μ) to B(G,{μ^−1}) is surjective on geometric classes. This is stronger than the invariant containment for all μ and uses the Rapoport existence result recalled by CS17 Remark3.5.8.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG3/flag-newton-strata
TauCeti.BunG.FlagNewton
Full construction contract: For G/Q_p, minuscule μ and its reflex field E_μ, let Fℓ_(G,μ) be the adic/diamond flag variety and E(x) the modification of the trivial G-bundle at the untilt. Define Fℓ_(G,μ)^b as its fibre over Bun_G^b. The point map is independent of algebraically closed residue-field extension, is constant along rank-one generalization, and has image B(G,{μ^−1}).
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.FlagNewton.classAt — projection: Map a flag point to its bundle sigma class.
TauCeti.BunG.FlagNewton.stratum — constructor: Take the locally closed fibre over Bun_G^b.
TauCeti.BunG.FlagNewton.upperUnion — constructor: For b define the union over bprime≥b.
TauCeti.BunG.FlagNewton.acceptableImage — characterisation: The image equals B(G,{μ^−1}).
TauCeti.BunG.FlagNewton.baseChange — compatibility: Pullback along algebraically closed field extension preserves class and strata.
TauCeti.BunG.FlagNewton.testGL2 — example contract (computation): For split GL_2 μ=(1,0), the inverse-bound ordinary stratum has slopes0,−1 and the basic stratum slopes−1/2,−1/2.
TauCeti.BunG.FlagNewton.testCentral — example contract (degenerate): A central minuscule μ gives a zero-dimensional flag variety with its single acceptable class.
TauCeti.BunG.FlagNewton.testSign — example contract (non-example): Using B(G,{μ}) instead of B(G,{μ^−1}) gives the wrong κ for the same CS modification.

BunGAndNewtonStrata:BG3/flag-strata-semicontinuity
TauCeti.BunG.FlagStrataSemicontinuity
Full theorem contract: The flag Newton strata are locally closed and partially proper, their upper unions Fℓ^≥b are closed, and the basic stratum is open. The bundle HN polygon is upper semicontinuous under specialization, with κ fixed by μ^−1. CS17 Proposition3.5.7 prints lower semicontinuity; the retained E35 correction uses the upper-polygon and closed-upper-union convention.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG3/unitary-flag-stratum-dimension
TauCeti.BunG.UnitaryFlagStratumDimension
Full theorem contract: For the CS24 Section2.1 quasi-split unitary similitude datum on F^(2n) with its standard skew-hermitian form, self-dual O_F-lattice and signatures(n,n), at p unramified in F, let d=n²[F+:Q]. Its flag strata have Krull dimension d−d_b, where d_b=<2ρ,ν_b> is IG.0’s dimension of the corresponding Igusa variety. This is the specific unitary dimension statement of Theorem2.7.3, not a general dimension formula deduced solely from upper semicontinuity.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG3/unitary-ordinary-flag-locus
TauCeti.BunG.UnitaryOrdinaryFlagLocus
Full theorem contract: In the preceding unramified quasi-split CS24 unitary similitude datum, the reflex field is Q and the largest acceptable element is ordinary. Its flag stratum is Fℓ(Q_p), interpreted as the constant locally profinite rational-point diamond; hence its Krull dimension is0. The original Wedhorn and CGH comparison inputs are explicitly retained as source gaps.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG1/gl-minuscule-quasisplit-centralizer
TauCeti.BunG.GlMinusculeQuasisplitCentralizer
Full theorem contract: For GL_n over a p-adic field L and μ(t)=diag(t repeated n−q,1 repeated q), exactly one class in B(GL_n/L,{μ^−1}) has quasi-split J_b: the ordinary class diag(π^−1 repeated n−q,1 repeated q). The extension to the CS17 unramified restrictions of scalars uses the cocharacter supported at one noncentral embedding. No implication quasi-split J_b⇒ordinary is claimed for arbitrary reductive data.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG1/slope-protorus
TauCeti.BunG.SlopeProtorus
Full definition contract: Let D be the E-protorus with character group Q. A homomorphism D→G is a compatible rational cocharacter, not a single integral cocharacter. For each representation its weight grading records all rational isocrystal slopes.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.SlopeProtorus.weight — projection: Evaluate a rational weight in a representation.
TauCeti.BunG.SlopeProtorus.integralMultiple — constructor: Clear finitely many weight denominators for a finite representation.
TauCeti.BunG.SlopeProtorus.toTorus — equivalence: Hom(D,T) identifies with X_*(T)⊗Q.
TauCeti.BunG.SlopeProtorus.map — functoriality: Postcomposition sends D→G to D→H.
TauCeti.BunG.SlopeProtorus.testHalf — example contract (computation): The slope1/2 character becomes integral after multiplication by2.
TauCeti.BunG.SlopeProtorus.testZero — example contract (degenerate): Zero slope is the trivial homomorphism.
TauCeti.BunG.SlopeProtorus.testDenominator — example contract (non-example): The slope1/2 homomorphism cannot be replaced by an integral slope1 cocharacter.

BunGAndNewtonStrata:BG1/algebraic-fundamental-group
TauCeti.BunG.AlgebraicPiOne
Full definition contract: Use the integral algebraic fundamental group already supplied by upstream ReductiveGroups Part II RG2.1.5: π_1(G)=X_*(T)/ZΦ∨ with its Γ_E-action. BG’s notation AlgebraicPiOne is an import alias for this object, not a second coroot-quotient construction. Use its integral inertia and full Galois coinvariants, preserving torsion; import Weyl invariance, functorial maps and their Galois compatibility. Independence of a maximal-torus choice and canonical inner-twist transport require the specific comparison refinement stated in the supplier request.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: imported-upstream-signatures. The upstream suggested file defines the quotient from actual AbsoluteRootData and supplies its Galois action, inertia coinvariants and maps. BG does not restate those definitions. The pinned shared build does not expose this roadmap module as an import; the BG alias and canonical inner-twist comparison signatures remain omitted. This is an import of existing work, not a missing fundamental-group plan.
TauCeti.BunG.AlgebraicPiOne.ofCocharacter — constructor: Reuse the upstream RG2.1.5 operation: Take the class of an integral cocharacter.
TauCeti.BunG.AlgebraicPiOne.coinvariants — structure: Reuse the upstream RG2.1.5 operation: Form Γ- or I-coinvariants with the specified action.
TauCeti.BunG.AlgebraicPiOne.map — functoriality: Reuse the upstream RG2.1.5 operation: A reductive group morphism induces the canonical homomorphism on π_1.
TauCeti.BunG.AlgebraicPiOne.innerInvariant — equivalence: Use canonical Γ-module transport under inner twisting after importing the RG2.1 maximal-torus/inner-twist comparison refinement; existing fixed-datum signatures do not yet assert this comparison.
TauCeti.BunG.AlgebraicPiOne.testGLn — example contract (computation): For GL_n with n≥1, reuse the upstream identification π_1≅Z by the sum of diagonal cocharacters; GL_0 instead has π_1=0.
TauCeti.BunG.AlgebraicPiOne.testSLn — example contract (degenerate): For SL_n the coroot quotient is0.
TauCeti.BunG.AlgebraicPiOne.testNormOne — example contract (non-example): The unramified quadratic norm-one torus has Γ-coinvariants Z/2; its rationalization loses its nonzero class.

BunGAndNewtonStrata:BG1/newton-orbit-space
TauCeti.BunG.NewtonSpace
Full definition contract: N(G) is the Γ_E-fixed set of G(bar E)-conjugacy classes of D→G. For a quasi-split inner form G*, choose a rational Borel and torus and identify it with Γ-fixed dominant rational cocharacters. Define ν≤νprime when νprime−ν is a nonnegative rational combination of positive coroots in the chosen chamber; the central projection is consequently equal.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.NewtonSpace.dominant — characterisation: Choose the unique dominant representative in G*.
TauCeti.BunG.NewtonSpace.le — relation: Positive-coroot dominance with equal central projection.
TauCeti.BunG.NewtonSpace.delta — projection: Project to (π_1(G)⊗Q)^Γ.
TauCeti.BunG.NewtonSpace.transfer — equivalence: An inner twisting transports Newton orbit classes, independently of its representative.
TauCeti.BunG.NewtonSpace.testGL2 — example contract (computation): (1/2,1/2)≤(1,0), with equal total1.
TauCeti.BunG.NewtonSpace.testTorus — example contract (degenerate): For a torus dominance is equality.
TauCeti.BunG.NewtonSpace.testCentral — example contract (non-example): For G_m, 0 and1 are incomparable despite the usual rational-number inequality.

BunGAndNewtonStrata:BG1/galois-average
TauCeti.BunG.HodgeInvariants
Full construction contract: For a geometric conjugacy class {μ}, choose its dominant representative μ* in a quasi-split inner form. Put μ♯=[μ*] in π_1(G)_Γ and μ◇=|Γ·μ*|^−1 sum over the finite orbit. The latter is dominant and Γ-fixed. Rational averaging gives (π_1(G)⊗Q)_Γ≅(π_1(G)⊗Q)^Γ and δ(μ◇)=average(μ♯⊗1); it is not an integral averaging isomorphism.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.HodgeInvariants.sharp — projection: Return the full integral Γ-coinvariant class.
TauCeti.BunG.HodgeInvariants.diamond — projection: Return the rational dominant orbit average.
TauCeti.BunG.HodgeInvariants.average_eq — compatibility: The rational projection of sharp is delta of diamond.
TauCeti.BunG.HodgeInvariants.baseChange — functoriality: Restrict the Γ action and use the corresponding orbit average; ramified degree normalizations must be explicit.
TauCeti.BunG.HodgeInvariants.testSplitGL2 — example contract (computation): For split GL_2 and μ=(1,0), μ◇=(1,0) and μ♯=1.
TauCeti.BunG.HodgeInvariants.testUnit — example contract (degenerate): The zero cocharacter has both invariants0.
TauCeti.BunG.HodgeInvariants.testTorsion — example contract (non-example): For the quadratic norm-one torus μ=1 has μ◇=0 and nonzero μ♯ in Z/2.

BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps
TauCeti.BunG.Invariants
Full construction contract: There are functorial maps ν:B(G)→N(G) and κ:B(G)→π_1(G)_Γ. The Newton morphism is the slope grading in every rational representation. The representative homomorphism tildeκ:G(L)→π_1(G)_I is the torus valuation map extended through a z-extension; composing with Frobenius coinvariants gives κ. Their rational images agree: δ(ν_b)=average(κ(b)⊗1).
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.Invariants.newton — projection: Evaluate the Newton class or its chosen dominant representative.
TauCeti.BunG.Invariants.kottwitz — projection: Evaluate κ in integral Γ-coinvariants.
TauCeti.BunG.Invariants.representativeKottwitz — projection: Evaluate tildeκ in inertia coinvariants before the σ quotient.
TauCeti.BunG.Invariants.map — functoriality: Group morphisms commute with κ and with the induced conjugacy-class Newton map.
TauCeti.BunG.Invariants.rationalCompatibility — compatibility: The δ/average square commutes; it does not recover torsion κ from ν.
TauCeti.BunG.Invariants.testGL1 — example contract (computation): b=π^m has ν=m and κ=m.
TauCeti.BunG.Invariants.testSign — example contract (compatibility): Its associated line bundle is O(−m), so degree is −κ.
TauCeti.BunG.Invariants.testTorsion — example contract (non-example): The two norm-one torus classes have equal Newton0 and distinct κ in Z/2.

BunGAndNewtonStrata:BG1/classification-by-two-invariants
TauCeti.BunG.ClassificationByTwoInvariants
Full theorem contract: The map (ν,κ):B(G)→N(G)×π_1(G)_Γ is injective. For basic classes, κ restricts to a bijection B(G)_basic≅π_1(G)_Γ; their Newton point is the central rational representative determined by κ⊗1. Injectivity of ν alone is false.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG1/basic-class
TauCeti.BunG.Basic
Full definition contract: A class is basic when its Newton morphism factors through Z(G), equivalently every adjoint representation slope is0. This definition applies to all connected reductive inner forms, independently of a rational representative choice.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.Basic.adjoint_iff — characterisation: Basic iff the adjoint isocrystal has slope0.
TauCeti.BunG.Basic.ofKottwitz — constructor: Construct the unique basic class with a given integral κ.
TauCeti.BunG.Basic.newton — projection: Its central rational slope is determined by κ⊗1.
TauCeti.BunG.Basic.innerTransport — equivalence: Corresponding basic classes for inner forms have the same integral κ and transferred Newton point.
TauCeti.BunG.Basic.testGL2Half — example contract (computation): The simple GL_2 slope1/2 class is basic.
TauCeti.BunG.Basic.testTorus — example contract (degenerate): Every torus class is basic.
TauCeti.BunG.Basic.testNonbasic — example contract (non-example): GL_2 with slopes1,0 is not basic.

BunGAndNewtonStrata:BG1/partial-order-on-B-of-G
TauCeti.BunG.NewtonOrder
Full definition contract: Define [b]≤[c] iff κ(b)=κ(c) and ν_b≤ν_c in the coroot order on N(G). Classification by both invariants makes this a partial order. The ν-only relation in KMPS is a preorder across all of B(G), and becomes a partial order on each κ fibre.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.NewtonOrder.le_iff — characterisation: Expose the κ equality and Newton dominance.
TauCeti.BunG.NewtonOrder.partialOrder — data: Reflexive, transitive and antisymmetric relation on B(G).
TauCeti.BunG.NewtonOrder.basic_minimal — other: The basic class with κ=α lies below every class of κ=α.
TauCeti.BunG.NewtonOrder.representationCriterion — characterisation: With κ fixed, dominance is equivalent to the Newton-polygon inequalities on every rational representation.
TauCeti.BunG.NewtonOrder.testGL2 — example contract (computation): Basic slopes1/2,1/2 are below slopes1,0 in κ=1.
TauCeti.BunG.NewtonOrder.testDifferentKappa — example contract (non-example): GL_1 classes0 and1 are incomparable.
TauCeti.BunG.NewtonOrder.testTorsion — example contract (non-example): Distinct norm-one torus κ classes are incomparable although ν is0 for both.

BunGAndNewtonStrata:BG1/representation-detects-dominance
TauCeti.BunG.RepresentationDetectsDominance
Full theorem contract: For Γ-invariant rational cocharacter classes, ν≤νprime iff for every rational representation the descending slope tuples have the corresponding positive-coroot majorization; totals agree. Basic classes are minimal among the classes with the same rational central projection. Passing to B(G) additionally requires equality of integral κ.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG1/admissible-pair
TauCeti.BunG.Acceptable
Full definition contract: For a geometric cocharacter class {μ}, set B(G,{μ})={ [b] : κ(b)=μ♯ and N_ξ(ν_b)≤μ◇ }. ξ is an inner twisting to the quasi-split form used for the dominant average. Both conditions are required. Acceptable describes the local invariant set; it does not assert existence of a period point or weak admissibility.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.Acceptable.mem_iff — characterisation: Membership is full κ equality and Newton bound.
TauCeti.BunG.Acceptable.basic — constructor: The unique basic class of κ=μ♯ lies in B(G,{μ}).
TauCeti.BunG.Acceptable.finite — other: The acceptable subset is finite.
TauCeti.BunG.Acceptable.torus_iff — simp: For T, membership is κ_T(b)=μ♯; the Newton equality follows.
TauCeti.BunG.Acceptable.product — equivalence: Acceptable sets for a product factor with the component bounds.
TauCeti.BunG.Acceptable.testGL2 — example contract (computation): For split GL_2 and μ=(1,0), basic slopes1/2,1/2 and ordinary slopes1,0 occur.
TauCeti.BunG.Acceptable.testZero — example contract (degenerate): B(G,{0}) contains exactly its basic class with κ=0.
TauCeti.BunG.Acceptable.testTorsion — example contract (non-example): For the quadratic norm-one torus μ=1, only κ=1 mod2 is allowed, though both Newton points equal μ◇=0.

BunGAndNewtonStrata:BG1/admissible-finiteness-and-basic
TauCeti.BunG.AdmissibleFinitenessAndBasic
Full theorem contract: B(G,{μ}) is finite and has exactly one basic member, characterized by κ=μ♯. That member is its minimum for the Newton order. For μ=0 it is the only member. For tori the whole acceptable set is this singleton.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG1/rational-newton-witness
TauCeti.BunG.RationalNewtonWitness
Full definition contract: A rational-Newton witness for [b] is a Q_p-rational homomorphism ν_G([b]):D→G in the G(L)-conjugacy class of ν_b, with a specified conjugator. It exists when G is quasi-split or [b] is basic; the KMPS constructions that require it retain this hypothesis for general inner forms.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.RationalNewtonWitness.quasiSplit — constructor: Build the unique B-dominant rational representative for quasi-split G.
TauCeti.BunG.RationalNewtonWitness.basic — constructor: A basic class has a central rational representative.
TauCeti.BunG.RationalNewtonWitness.levi — projection: Return Z_G(ν_G([b])) as an E-defined Levi.
TauCeti.BunG.RationalNewtonWitness.centralOnJ — projection: Transport the central Newton morphism to J_b, retaining the inner identification.
TauCeti.BunG.RationalNewtonWitness.testSplitGL2 — example contract (computation): The slope1,0 map has the diagonal rational representative.
TauCeti.BunG.RationalNewtonWitness.testBasic — example contract (degenerate): A basic witness centralizes all of G.
TauCeti.BunG.RationalNewtonWitness.testInnerForm — example contract (non-example): An anisotropic inner form need not realize a noncentral geometric Newton orbit rationally.

BunGAndNewtonStrata:BG1/torus-norm-description
TauCeti.BunG.TorusNormDescription
Full theorem contract: For a torus T/E, κ:B(T)≅X_*(T)_Γ and ν of the class κ^−1([λ]) is the rational Γ-average of λ. Kottwitz’s finite splitting-field norm construction gives a representative after choosing the splitting extension, the unramified coefficient field and the valuation normalization of its uniformizer; these choices do not change the resulting class.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG1/rational-kottwitz-surjectivity
TauCeti.BunG.RationalKottwitzSurjectivity
Full theorem contract: The restriction tildeκ:G(E)→(π_1(G)_I)^σ is surjective for connected reductive G over the nonarchimedean local field E. Its target is Frobenius invariants in inertia coinvariants, not π_1(G)_Γ. For the unramified Q_p model in Kisin17 Lemma4.6.4, J_b(Q_p)→π_1(G)^Γ is surjective for every b; the basic tame vH24 case also follows by inner-form compatibility and the rational quotient map.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG1/component-kottwitz-coset
TauCeti.BunG.ComponentCoset
Full construction contract: For b∈G(L) and a bound μ with compatible full κ, let c_(b,μ)={x∈π_1(G)_I:(σ−1)x=tildeκ(μ(π))−tildeκ(b)}. Compatibility in π_1(G)_Γ makes this a nonempty affine coset under (π_1(G)_I)^σ. This is an affine set of components, with no distinguished origin before a choice.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: typed-pointwise-core. These declarations type only the explicitly restricted abstract-group or affine-fibre core. The general-E coefficient groups, represented reductive groups, and geometric signatures still depend on G08 suppliers; the register is not signature coverage.
TauCeti.BunG.ComponentCoset.mem_iff — characterisation: A component x solves the stated difference equation.
TauCeti.BunG.ComponentCoset.nonempty — universal-property: The Γ-coinvariant compatibility is equivalent to nonemptiness.
TauCeti.BunG.ComponentCoset.translate — structure: Invariant classes act freely and transitively on the fibre.
TauCeti.BunG.ComponentCoset.liftZExtension — other: A z-extension and lifted b,μ give a surjective map of affine component cosets.
TauCeti.BunG.ComponentCoset.testIdentity — example contract (degenerate): For σ=id a nonempty coset requires difference0 and equals the entire lattice.
TauCeti.BunG.ComponentCoset.testSign — example contract (computation): On Z with σ=−id, the equation −2x=2 has unique solution x=−1.
TauCeti.BunG.ComponentCoset.testParity — example contract (non-example): On the same lattice difference1 has no solution; its full coinvariant compatibility fails.

BunGAndNewtonStrata:BG1/z-extension-bounded-lifting
TauCeti.BunG.ZExtensionBoundedLifting
Full theorem contract: For a z-extension 1→Z→Gtilde→G→1 with induced torus Z, every cocharacter class μ lifts after choosing maximal tori. Given b∈B(G,{μ}) and a chosen lift μtilde, there is btilde∈B(Gtilde,{μtilde}) above b; the induced map of component cosets is surjective. Projection to the adjoint group gives B(G,{μ})≅B(Gad,{μad}) with the fixed central invariant.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG1/connected-center-basic-inner-forms
TauCeti.BunG.ConnectedCenterBasicInnerForms
Full theorem contract: If Z(G) is a connected torus, B(G)_basic→B(Gad)_basic≅H^1(E,Gad) is surjective. The map sends a basic class to the inner form J_b. The assertion does not assume this surjectivity for groups with disconnected center.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG0/central-newton-on-J
TauCeti.BunG.CentralNewtonOnJ
Full construction contract: For every b∈G(L), the slope morphism ν_b, viewed in the center of its geometric centralizer, descends through the defining Frobenius descent datum to an E-rational central morphism ν_(b,J):D→J_b. No rational representative of ν_b inside G is needed. For a positive multiple N clearing its denominators, Nν_(b,J) is an integral cocharacter and U_π=(Nν_(b,J))(π) belongs to J_b(E).
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
TauCeti.BunG.CentralNewtonOnJ.morphism — data: Return the E-defined central D→J_b morphism.
TauCeti.BunG.CentralNewtonOnJ.integralMultiple — constructor: For sufficiently divisible N>0 obtain an integral central cocharacter.
TauCeti.BunG.CentralNewtonOnJ.transport — compatibility: Sigma conjugacy transports ν_(b,J) through the centralizer isomorphism.
TauCeti.BunG.CentralNewtonOnJ.testBasicHalf — example contract (computation): For a simple GL_2 slope1/2 block, 2ν_(b,J) is the central scalar cocharacter of D_(1/2)^×.
TauCeti.BunG.CentralNewtonOnJ.testUnit — example contract (degenerate): For b=1 the morphism is zero and U_π=1.
TauCeti.BunG.CentralNewtonOnJ.testNonbasic — example contract (non-example): For GL_2 slopes1,0 it is central in J_b=G_m×G_m, while its image in GL_2 is noncentral.

BunGAndNewtonStrata:BG1/general-levi-newton-comparison
TauCeti.BunG.GeneralLeviNewtonComparison
Full theorem contract: Let M_J be a σ-stable standard Levi of a quasi-split based local group G and let b_M∈M_J(L) map to b∈B(G). Its M_J-dominant Newton point ν_M is Weyl-conjugate to ν_G and ν_G−ν_M is a nonnegative rational sum of simple G-coroots. If κ_M(b_M)=κ_M(t^λσ(η)) in the situation of He §6.2, then λ◇−ν_M belongs to the rational span of the J-coroots. This comparison does not require b or b_M to be basic.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.

BunGAndNewtonStrata:BG2:uniformization/de-rham-quotient-group-class
TauCeti.BunG.DeRhamQuotientGroupClass
Full comparison contract: In Liu–Zhu Corollary4.9, the tensor functor has domain Rep_(Q_p)(G^c), where G^c=G/Z_G^s. At a classical point embedded into C_p, its de Rham comparison defines compatible B_dR^+ lattices. The Fargues tensor modification construction therefore gives a class in B(G^c_(Q_p)). Producing a class in B(G_(Q_p)) requires a chosen compatible lift or additional G-level tensor data. No canonical lift is claimed.
Hypotheses: Global conventions in the reader apply; additional restrictions are stated in the contract.
Formulation: full-signature-omitted. The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores.
-/
