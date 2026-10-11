import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Category.ModuleCat.Limits
import Mathlib.Algebra.Category.ModuleCat.Biproducts
import Mathlib.Algebra.Category.ModuleCat.Monoidal.Symmetric
import Mathlib.Algebra.Homology.ShortComplex.Exact
import Mathlib.CategoryTheory.Linear.FunctorCategory
import Mathlib.CategoryTheory.Monoidal.NaturalTransformation
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.GroupTheory.Nilpotent
import Mathlib.LinearAlgebra.Dual.Lemmas
import Mathlib.LinearAlgebra.Finsupp.LSum
import Mathlib.RingTheory.Derivation.Basic
import Mathlib.RingTheory.TwoSidedIdeal.Operations
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Algebra.Polynomial.Derivative
import TauCeti.Algebra.AlgebraicGroup.Representation.Tannaka.Equivalence
import TauCeti.Algebra.Coalgebra.Comodule.Finite.ScalarExtension.Monoidal
import TauCeti.AlgebraicGeometry.AffineGroupScheme.Unipotent

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. All proof goals are admitted. Elaboration makes no implementation claim.

The categories of geometric connections, geometric rational local systems and isocrystals,
their period functors and schematic quotients have no native instantiation at this pin.
The packet records the full geometric statements and hypotheses. This file states their
categorical and affine-linear interfaces on actual native objects, and explicitly lists
the geometric signatures omitted at that boundary. No missing geometric condition is an
opaque proposition, and no comparison theorem is made a field of a fabricated structure.

In particular, an automorphism group below is the carrier of tensor points; it does not
prove affine representability. An abstract lower central quotient is an indexing prototype;
it does not replace an fpqc group-scheme quotient. Finite natural transformations are whole
vector spaces, not the tensor-path carrier. A single augmentation quotient is not a Hopf
quotient. Frobenius is not assumed to preserve the Hodge filtration.
-/

set_option autoImplicit false

namespace TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty.NC2

open CategoryTheory CategoryTheory.Limits
open scoped TensorProduct

universe u v w

section Length
variable {C : Type u} [Category.{v} C] [Abelian C] [HasFiniteBiproducts C]

/-- A trivial object is a finite biproduct of the specified tensor unit. -/
def IsTrivialObject (unit E : C) : Prop :=
  ∃ n : ℕ, Nonempty (E ≅ biproduct (fun _ : Fin n => unit))

/-- Index zero means one trivial graded layer. The zero object is included. -/
def IsUnipotentLength (unit : C) : ℕ → C → Prop
  | 0, E => IsTrivialObject unit E
  | n + 1, E => ∃ (T Q : C) (i : T ⟶ E) (p : E ⟶ Q) (h : i ≫ p = 0),
      IsTrivialObject unit T ∧ IsUnipotentLength unit n Q ∧
        Mono i ∧ Epi p ∧ (ShortComplex.mk i p h).Exact

namespace IsUnipotentLength
theorem trivial (unit E : C) :
    IsUnipotentLength unit 0 E ↔ IsTrivialObject unit E := by sorry

theorem mono (unit E : C) (n : ℕ) (h : IsUnipotentLength unit n E) :
    IsUnipotentLength unit (n + 1) E := by sorry

theorem extension (unit T E Q : C) (n : ℕ) (i : T ⟶ E) (p : E ⟶ Q)
    (h : i ≫ p = 0) (hT : IsTrivialObject unit T)
    (hQ : IsUnipotentLength unit n Q) [Mono i] [Epi p]
    (hex : (ShortComplex.mk i p h).Exact) : IsUnipotentLength unit (n + 1) E := by sorry

-- IsUnipotentLength.tensor: omitted geometric/rigid exact tensor instantiation.
-- Its full bound n+m and the required tensor exactness are specified in the packet.
end IsUnipotentLength

abbrev UnipotentCategory (unit : C) :=
  (show ObjectProperty C from fun E => ∃ n, IsUnipotentLength unit n E).FullSubcategory

-- test: length_zero_object
example (unit Z : C) (hZ : IsZero Z) : IsUnipotentLength unit 0 Z := by sorry
-- test: length_unit_sum
example (unit : C) :
    IsUnipotentLength unit 0 (biproduct (fun _ : Fin 2 => unit)) := by sorry
-- test: length_nonsplit_extension
-- The general neutral-category nonsplit-extension test is omitted until its fibre
-- and Ext realization are native. The concrete Jordan obstruction appears below.

/-- Select the unipotent full subcategory of a supplied geometric ambient category. -/
abbrev UnipotentRealizations (unit : C) := UnipotentCategory unit

namespace UnipotentRealizations
abbrev etale (unit : C) := UnipotentRealizations unit
abbrev deRham (unit : C) := UnipotentRealizations unit
abbrev rigid (unit : C) := UnipotentRealizations unit

def fiber {k : Type w} [Field k] (unit : C) (ω : C ⥤ ModuleCat.{w} k) :
    UnipotentRealizations unit ⥤ ModuleCat.{w} k :=
  ObjectProperty.ι _ ⋙ ω

-- UnipotentRealizations.pullback: omitted geometric pullback/fibre identification.
-- The three abbreviations instantiate three different imported ambient categories;
-- they do not assert that those categories already exist or are equivalent.
end UnipotentRealizations

end Length

section RealizationUnitTest
open MonoidalCategory
variable {k : Type w} [Field k]
variable {C : Type u} [Category.{v} C] [MonoidalCategory C]

-- test: realization_unit
-- The fibre functor's strong monoidal unit comparison identifies the fibre with k.
example (ω : C ⥤ ModuleCat.{w} k) [ω.Monoidal] :
    Nonempty (ω.obj (𝟙_ C) ≅ ModuleCat.of k k) := by sorry
end RealizationUnitTest

section Universal
variable {k : Type w} [Field k]
variable {C : Type u} [Category.{v} C] [Abelian C] [HasFiniteBiproducts C]
variable (unit : C) (n : ℕ) (ω : C ⥤ ModuleCat.{w} k)

/-- The actual evaluation-bijection universal property, including the length condition. -/
def IsUniversalPointed (E : C) (e : ω.obj E) : Prop :=
  IsUnipotentLength unit n E ∧ ∀ (V : C), IsUnipotentLength unit n V →
    Function.Bijective (fun f : E ⟶ V => (ω.map f).hom e)

namespace IsUniversalPointed
noncomputable def lift {E : C} {e : ω.obj E}
    (h : IsUniversalPointed unit n ω E e) (V : C)
    (hV : IsUnipotentLength unit n V) (v : ω.obj V) : E ⟶ V := by sorry

theorem lift_eval {E : C} {e : ω.obj E}
    (h : IsUniversalPointed unit n ω E e) (V : C)
    (hV : IsUnipotentLength unit n V) (v : ω.obj V) :
    (ω.map (lift unit n ω h V hV v)).hom e = v := by sorry

theorem lift_unique {E : C} {e : ω.obj E}
    (h : IsUniversalPointed unit n ω E e) (V : C)
    (hV : IsUnipotentLength unit n V) (f g : E ⟶ V)
    (he : (ω.map f).hom e = (ω.map g).hom e) : f = g := by sorry

noncomputable def pointedIso {E F : C} {e : ω.obj E} {f : ω.obj F}
    (hE : IsUniversalPointed unit n ω E e)
    (hF : IsUniversalPointed unit n ω F f) : E ≅ F := by sorry
end IsUniversalPointed

-- test: universal_eval_unique
example {E V : C} {e : ω.obj E} (h : IsUniversalPointed unit n ω E e)
    (hV : IsUnipotentLength unit n V) (f g : E ⟶ V)
    (he : (ω.map f).hom e = (ω.map g).hom e) : f = g := by sorry

end Universal

section ConcreteUniversalTests
variable {k : Type u} [Field k]

-- test: universal_unit
example : IsUniversalPointed (ModuleCat.of k k) 0 (𝟭 (ModuleCat k))
    (ModuleCat.of k k) (1 : k) := by sorry

-- test: universal_extra_summand
example : ∃ f g : (k × k) →ₗ[k] k,
    f (1, 0) = 1 ∧ g (1, 0) = 1 ∧ f ≠ g := by sorry

-- test: realization_nontrivial_rank_one
example (a : k) (h : a ≠ 1) (n : ℕ) : (a - 1) ^ n ≠ 0 := by sorry

-- A genuine nilpotent operator for the rank-two unipotent extension test.
def jordan : (k × k) →ₗ[k] k × k where
  toFun z := (z.2, 0)
  map_add' := by sorry
  map_smul' := by sorry

-- test: realization_extension
-- test: length_nonsplit_extension (the local Jordan obstruction)
example : jordan (k := k) ≠ 0 ∧
    (jordan (k := k)).comp (jordan (k := k)) = 0 := by sorry

end ConcreteUniversalTests

section TensorPoints
variable {C : Type u} [Category.{v} C] [MonoidalCategory C]
variable {D : Type w} [Category D] [MonoidalCategory D]

/-- Point carrier only; neutral reconstruction supplies its affine representability. -/
abbrev UnipotentFundamentalGroup (F : LaxMonoidalFunctor C D) := Aut F

namespace UnipotentFundamentalGroup
theorem points (F : LaxMonoidalFunctor C D) :
    UnipotentFundamentalGroup F = Aut F := by sorry

def pullback {E : Type*} [Category E] (T : LaxMonoidalFunctor C D ⥤ E)
    (F : LaxMonoidalFunctor C D) : UnipotentFundamentalGroup F →* Aut (T.obj F) where
  toFun g := T.mapIso g
  map_one' := by sorry
  map_mul' := by sorry

theorem map_comp {E : Type*} [Category E] {E' : Type*} [Category E']
    (T : LaxMonoidalFunctor C D ⥤ E) (S : E ⥤ E')
    (F : LaxMonoidalFunctor C D) (g : UnipotentFundamentalGroup F) :
    (T ⋙ S).mapIso g = S.mapIso (T.mapIso g) := by sorry
end UnipotentFundamentalGroup

/-- Genuine monoidal natural isomorphisms, rather than all natural transformations. -/
abbrev TensorPath (F G : LaxMonoidalFunctor C D) := F ≅ G

namespace TensorPath
def identity (F : LaxMonoidalFunctor C D) : TensorPath F F := Iso.refl F

def rightMul {F G : LaxMonoidalFunctor C D} (p : TensorPath F G) (g : Aut F) :
    TensorPath F G := g ≪≫ p

def comp {F G H : LaxMonoidalFunctor C D} (q : TensorPath G H) (p : TensorPath F G) :
    TensorPath F H := p ≪≫ q

def inverse {F G : LaxMonoidalFunctor C D} (p : TensorPath F G) : TensorPath G F := p.symm

def conjugate {F G : LaxMonoidalFunctor C D} (p : TensorPath F G) : Aut F ≃* Aut G where
  toFun g := p.symm ≪≫ g ≪≫ p
  invFun g := p ≪≫ g ≪≫ p.symm
  left_inv := by sorry
  right_inv := by sorry
  map_mul' := by sorry

theorem ext {F G : LaxMonoidalFunctor C D} {p q : TensorPath F G}
    (h : ∀ E : C, p.hom.hom.app E = q.hom.hom.app E) : p = q := by sorry

-- test: path_identity_comp
example {F G : LaxMonoidalFunctor C D} (p : TensorPath F G) :
    comp (identity G) p = p ∧ comp p (identity F) = p := by sorry
-- test: path_right_action_free
example {F G : LaxMonoidalFunctor C D} (p : TensorPath F G) (g : Aut F)
    (h : rightMul p g = p) : g = 1 := by sorry
-- test: path_comp_order
example {F G H : LaxMonoidalFunctor C D} (p : TensorPath F G) (q : TensorPath G H)
    (E : C) : (comp q p).hom.hom.app E = p.hom.hom.app E ≫ q.hom.hom.app E := by sorry

end TensorPath
end TensorPoints

section FixedHopf
variable (k H A : Type u) [Field k] [CommRing H] [HopfAlgebra k H]
variable [CommRing A] [Algebra k A]

namespace UnipotentFundamentalGroup
noncomputable def fixedHopf : WithConv (H →ₐ[k] A) ≃*
    UnipotentFundamentalGroup (TauCeti.FGComoduleCat.scalarExtensionMonoidalFunctor k H A) :=
  TauCeti.Tannaka.fgPointTensorIsoEquiv k H A
end UnipotentFundamentalGroup

-- test: group_fixed_hopf
example : Nonempty (WithConv (H →ₐ[k] A) ≃*
    UnipotentFundamentalGroup (TauCeti.FGComoduleCat.scalarExtensionMonoidalFunctor k H A)) := by sorry

end FixedHopf

section TensorUnitTests
variable {k : Type u} [Field k]

-- The unit object test is on actual monoidal natural transformations of ModuleCat.
-- test: group_trivial_category
example (p : Aut (LaxMonoidalFunctor.of (𝟭 (ModuleCat k)))) : p = 1 := by sorry

-- test: group_unit_constraint
example [CharZero k] : ¬ ∃ p : Aut (LaxMonoidalFunctor.of (𝟭 (ModuleCat k))),
    p.hom.hom.app (ModuleCat.of k k) = 2 • (𝟙 (ModuleCat.of k k)) := by sorry

end TensorUnitTests

section Depth
variable {G : Type u} [Group G]

/-- Abstract indexing prototype of Gamma_(n+1); the geometric version uses closed schemes. -/
abbrev UnipotentDepth (n : ℕ) := (⊤ : Subgroup G).lowerCentralSeries n

namespace UnipotentDepth
def quotient (n : ℕ) : G →* G ⧸ (UnipotentDepth (G := G) n) := QuotientGroup.mk' _

def transition (m n : ℕ) (hmn : m ≤ n) :
    (G ⧸ UnipotentDepth (G := G) n) →* (G ⧸ UnipotentDepth (G := G) m) := by sorry

theorem nativeIndex (n : ℕ) :
    UnipotentDepth (G := G) (n + 1) =
      ⁅UnipotentDepth (G := G) n, (⊤ : Subgroup G)⁆ := by sorry

-- UnipotentDepth.pathQuotient: omitted fpqc geometric torsor quotient signature.
-- test: depth_zero
example : Subsingleton (G ⧸ UnipotentDepth (G := G) 0) := by sorry
-- test: depth_index
example : UnipotentDepth (G := G) 1 = commutator G := by sorry

end UnipotentDepth

-- test: depth_one_abelian
example {H : Type u} [CommGroup H] : UnipotentDepth (G := H) 1 = ⊥ := by sorry
end Depth

section LengthAlgebra
variable {k A : Type u} [Field k] [Ring A] [Algebra k A]

-- A finite power of a two-sided augmentation ideal; this helper is not a new
-- proposed general ideal API. It keeps the noncommutative quotient honest.
private noncomputable def augmentationPower (I : TwoSidedIdeal A) : ℕ → TwoSidedIdeal A
  | 0 => ⊤
  | n + 1 => TwoSidedIdeal.span
      {x | ∃ a b : A, a ∈ I ∧ b ∈ augmentationPower I n ∧ a * b = x}

/-- Actual associative finite augmentation quotient. Completion belongs to the full contract. -/
noncomputable abbrev UnipotentLengthAlgebra (ε : A →ₐ[k] k) (n : ℕ) :=
  (augmentationPower (TwoSidedIdeal.ker ε) (n + 1)).ringCon.Quotient

namespace UnipotentLengthAlgebra
noncomputable def augmentation (ε : A →ₐ[k] k) (n : ℕ) :
    UnipotentLengthAlgebra ε n →+* k := by sorry

noncomputable def transition (ε : A →ₐ[k] k) (n : ℕ) :
    UnipotentLengthAlgebra ε (n + 1) →+* UnipotentLengthAlgebra ε n := by sorry

-- UnipotentLengthAlgebra.graded: omitted finite geometric tensor-grade quotient.
-- UnipotentLengthAlgebra.coordinate: omitted ind-coordinate Hopf identification.
-- UnipotentLengthAlgebra.regularObject: omitted representation-to-geometric-object instantiation.

-- test: length_algebra_zero
example (ε : A →ₐ[k] k) : Nonempty (UnipotentLengthAlgebra ε 0 ≃+* k) := by sorry
end UnipotentLengthAlgebra
end LengthAlgebra

section PrimitiveTests
variable {k : Type u} [Field k]

-- test: length_algebra_ga
example : Nonempty (UnipotentLengthAlgebra (Polynomial.aeval (0 : k)) 1 ≃+*
    TrivSqZeroExt k k) := by sorry

-- test: length_algebra_not_hopf
example [CharZero k] :
    let T : TrivSqZeroExt k k := TrivSqZeroExt.inr (1 : k)
    T ^ 2 = 0 ∧
      ((T ⊗ₜ[k] (1 : TrivSqZeroExt k k)) + ((1 : TrivSqZeroExt k k) ⊗ₜ[k] T)) ^ 2 ≠ 0 := by sorry

end PrimitiveTests

section FinitePaths
variable {k : Type w} [Field k] {C : Type u} [Category.{v} C]
variable (ω ν ξ : C ⥤ ModuleCat.{w} k)

/-- In the geometric instance C here is the full length-n subcategory, not a tensor closure. -/
abbrev FinitePathModule := ω ⟶ ν

namespace FinitePathModule
def eval (E : C) (e : ω.obj E) : FinitePathModule ω ν →ₗ[k] ν.obj E where
  toFun α := (α.app E).hom e
  map_add' := by sorry
  map_smul' := by sorry

noncomputable def evalEquiv (E : C) (e : ω.obj E)
    (h : Function.Bijective (eval ω ν E e)) : FinitePathModule ω ν ≃ₗ[k] ν.obj E :=
  LinearEquiv.ofBijective (eval ω ν E e) h

def comp (q : FinitePathModule ν ξ) (p : FinitePathModule ω ν) :
    FinitePathModule ω ξ := p ≫ q

def rightMul (p : FinitePathModule ω ν) (a : FinitePathModule ω ω) :
    FinitePathModule ω ν := a ≫ p

-- FinitePathModule.reverseDual: omitted geometric rigid-dual fibre identifications.
-- The full contract reverses endpoints and composition, not a transpose at the same object.

-- test: finite_path_zero
example (E : C) (e : ω.obj E) : eval ω ν E e 0 = 0 := by sorry
-- test: finite_path_comp_order
example (p : FinitePathModule ω ν) (q : FinitePathModule ν ξ) (E : C) :
    (comp ω ν ξ q p).app E = p.app E ≫ q.app E := by sorry
end FinitePathModule
end FinitePaths

section FinitePathUnitTest
variable {k : Type u} [Field k]
-- test: finite_path_not_tensor
example : ¬ ∃ p : Aut (LaxMonoidalFunctor.of (𝟭 (ModuleCat k))), p.hom.hom = 0 := by sorry
end FinitePathUnitTest

section AffineWords
variable {k : Type u} [Field k] {ι : Type v}

/-- Finite word indices for the affine universal connection, not another shuffle algebra. -/
abbrev BoundedWord (ι : Type v) (n : ℕ) := {w : List ι // w.length ≤ n}
abbrev WordModule (k : Type u) [Field k] (ι : Type v) (n : ℕ) := BoundedWord ι n →₀ k

noncomputable def prepend (n : ℕ) (i : ι) : WordModule k ι n →ₗ[k] WordModule k ι n :=
  Finsupp.linearCombination k (fun w =>
    if h : (i :: w.val).length ≤ n then Finsupp.single ⟨i :: w.val, h⟩ 1 else 0)

/-- The coefficient matrices of d minus sum_i T_i omega_i; the sheaf connection is omitted. -/
noncomputable def AffineUniversalConnection (n : ℕ) (i : ι) :
    WordModule k ι n →ₗ[k] WordModule k ι n := -(prepend (k := k) n i)

namespace AffineUniversalConnection
noncomputable def empty (n : ℕ) : WordModule k ι n := Finsupp.single ⟨[], by simp⟩ 1

theorem nabla (n : ℕ) (i : ι) :
    AffineUniversalConnection (k := k) n i = -(prepend (k := k) n i) := by sorry

-- AffineUniversalConnection.truncate: omitted sheaf connection; truncation of indices
-- discards degrees above the destination, rather than retaining an overflow generator.
-- AffineUniversalConnection.rightMul: omitted horizontal right-multiplication signature.
-- AffineUniversalConnection.rank: omitted finite-dimensional geometric rank instance;
-- the full rank is sum_{j=0}^n m^j for m cohomology generators.

-- test: affine_length_zero
example (i : ι) : AffineUniversalConnection (k := k) 0 i = 0 := by sorry
-- test: affine_one_generator
example (i : ι) :
    prepend (k := k) 1 i (empty (k := k) (ι := ι) 1) =
      Finsupp.single ⟨[i], by simp⟩ 1 ∧
    prepend (k := k) 1 i (Finsupp.single ⟨[i], by simp⟩ 1) = 0 := by sorry
-- test: affine_order_noncommuting
example (i j : ι) (h : i ≠ j) :
    prepend (k := k) 2 i (Finsupp.single ⟨[j], by simp⟩ 1) ≠
      Finsupp.single ⟨[j, i], by simp⟩ 1 := by sorry

end AffineUniversalConnection
end AffineWords

section AffineDerivation
variable {k A Ω : Type u} [Field k] [CommRing A] [Algebra k A]
variable [AddCommGroup Ω] [Module A Ω] [Module k Ω] [IsScalarTower k A Ω]
variable (d : Derivation k A Ω)
-- The scalar part of the actual connection is an existing derivation, not a
-- function with an assumed opaque Leibniz condition.
example (a b : A) : d (a * b) = a • d b + b • d a := by sorry
end AffineDerivation

section Filtration
variable {k V : Type u} [Field k] [AddCommGroup V] [Module k V]

/-- Endpoint Hodge flag data; no geometric uniqueness theorem is a field. -/
structure FilteredPathFiber where
  filtration : ℤ → Submodule k V
  antitone : Antitone filtration
  bounded : ∃ a b : ℤ, filtration a = ⊤ ∧ filtration b = ⊥

namespace FilteredPathFiber
-- FilteredPathFiber.graded: omitted augmentation grade / subbundle instantiation.
-- FilteredPathFiber.unit: omitted universal pointer at the basepoint, not a pointer
-- invented at every endpoint of a nontrivial torsor.

def dual (F : FilteredPathFiber (k := k) (V := V)) :
    FilteredPathFiber (k := k) (V := Module.Dual k V) where
  filtration i := (F.filtration (1 - i)).dualAnnihilator
  antitone := by sorry
  bounded := by sorry

def truncate (F : FilteredPathFiber (k := k) (V := V)) (W : Submodule k V) :
    FilteredPathFiber (k := k) (V := V ⧸ W) where
  filtration i := (F.filtration i).map W.mkQ
  antitone := by sorry
  bounded := by sorry

-- test: filtered_augmentation_quotient
example (F : FilteredPathFiber (k := k) (V := V)) (W : Submodule k V) (i : ℤ) :
    (truncate F W).filtration i = (F.filtration i).map W.mkQ := by sorry

end FilteredPathFiber

def degreeFlag (k : Type u) [Field k] (d : ℤ) : FilteredPathFiber (k := k) (V := k) where
  filtration i := if i ≤ d then ⊤ else ⊥
  antitone := by sorry
  bounded := by sorry

-- test: filtered_unit
example : (degreeFlag k 0).filtration 0 = ⊤ ∧ (degreeFlag k 0).filtration 1 = ⊥ := by sorry
-- test: filtered_dual_index
example : ((degreeFlag k 1).dual).filtration (-1) = ⊤ ∧
    ((degreeFlag k 1).dual).filtration 0 = ⊥ := by sorry

end Filtration

section Horizontal
variable {k M N E F H : Type u} [Field k]
variable [AddCommGroup M] [Module k M] [AddCommGroup N] [Module k N]
variable [AddCommGroup E] [Module k E] [AddCommGroup F] [Module k F]
variable [AddCommGroup H] [Module k H]

/-- On actual disc sections, horizontal vectors are the kernel of the connection. -/
abbrev RigidHorizontalFiber (conn : M →ₗ[k] N) := LinearMap.ker conn

namespace RigidHorizontalFiber
abbrev horizontal (conn : M →ₗ[k] N) := RigidHorizontalFiber conn

noncomputable def eval (conn : M →ₗ[k] N) (e : M →ₗ[k] E)
    (h : Function.Bijective (e.comp (LinearMap.ker conn).subtype)) :
    RigidHorizontalFiber conn ≃ₗ[k] E :=
  LinearEquiv.ofBijective (e.comp (LinearMap.ker conn).subtype) h

def transport (eb : M ≃ₗ[k] E) (ex : M ≃ₗ[k] F) : E ≃ₗ[k] F := eb.symm.trans ex

theorem transport_comp (eb : M ≃ₗ[k] E) (ex : M ≃ₗ[k] F) (ey : M ≃ₗ[k] H) :
    (transport eb ex).trans (transport ex ey) = transport eb ey := by sorry

-- RigidHorizontalFiber.tensor: omitted tensor-natural evaluation for actual isocrystals.
-- The bijectivity input above is the native linear consequence of the geometric theorem,
-- not a definition of a category of supposed geometric objects.

-- test: rigid_same_endpoint
example (eb : M ≃ₗ[k] E) : transport eb eb = LinearEquiv.refl k E := by sorry

end RigidHorizontalFiber

-- Additional finite linear consequence: composition of nilpotent transports.
example (T : M →ₗ[k] M) (h : T.comp T = 0) (x y z : k) :
    (LinearMap.id + (z - y) • T).comp (LinearMap.id + (y - x) • T) =
      LinearMap.id + (z - x) • T := by sorry

end Horizontal

section HorizontalPolynomialTests
variable {k : Type u} [Field k] [CharZero k]

-- test: rigid_unit
-- A polynomial model of (O,d) has precisely constant horizontal sections. A zero
-- operator on all sections would wrongly make every nonconstant polynomial horizontal.
example (p : Polynomial k) (x : k) :
    Polynomial.derivative p = 0 ↔ p = Polynomial.C (p.eval x) := by sorry

-- test: rigid_nilpotent_transport
-- For N(a,b)=(b,0), the solution of d s=N s dt with initial value (a,b) at x
-- is (a+(t-x)b,b). This checks the sign against the differential equation itself.
example (a b x y : k) :
    let s₁ := Polynomial.C a + (Polynomial.X - Polynomial.C x) * Polynomial.C b
    let s₂ := Polynomial.C b
    Polynomial.derivative s₁ = s₂ ∧ Polynomial.derivative s₂ = 0 ∧
      (s₁.eval x, s₂.eval x) = (a, b) ∧
      (s₁.eval y, s₂.eval y) = (a + (y - x) * b, b) := by sorry

end HorizontalPolynomialTests

section Frobenius
variable {k M N : Type u} [Field k]
variable [AddCommGroup M] [Module k M] [AddCommGroup N] [Module k N]

/-- Native linear conjugation component of the geometric endpoint Frobenius operator. -/
def PathFrobenius (φ : M ≃ₗ[k] M) (τ : M ≃ₗ[k] N) : N ≃ₗ[k] N :=
  τ.symm.trans (φ.trans τ)

namespace PathFrobenius
def fixedLift (φ : M ≃ₗ[k] M) := φ
def transport (φ : M ≃ₗ[k] M) (τ : M ≃ₗ[k] N) := PathFrobenius φ τ

theorem changeLift (φ : M ≃ₗ[k] M) (τ : M ≃ₗ[k] N) (v : M) :
    PathFrobenius φ τ (τ v) = τ (φ v) := by sorry

-- PathFrobenius.comp: omitted geometric path / source algebra Frobenius compatibility.
-- PathFrobenius.truncate: omitted geometric length-transition compatibility.

-- test: frobenius_fixed_lifts
example (φ : M ≃ₗ[k] M) : PathFrobenius φ (LinearEquiv.refl k M) = φ := by sorry
-- The linear conjugation formula; the endpoint-sensitive test follows below.
example (φ : M ≃ₗ[k] M) (τ : M ≃ₗ[k] N) (v : N) :
    PathFrobenius φ τ v = τ (φ (τ.symm v)) := by sorry
-- test: frobenius_conjugation_fixed
example (φ : M ≃ₗ[k] M) (τ : M ≃ₗ[k] N) (v : M) (h : φ v = v) :
    PathFrobenius φ τ (τ v) = τ v := by sorry

end PathFrobenius
end Frobenius

section TwoSidedTransportTest
variable {k B B₀ X X₀ : Type u} [Field k]
variable [AddCommGroup B] [Module k B] [AddCommGroup B₀] [Module k B₀]
variable [AddCommGroup X] [Module k X] [AddCommGroup X₀] [Module k X₀]

-- test: frobenius_two_sided
-- tb transports b to b₀; tx transports x₀ to x. Both endpoint maps are needed:
-- tau(g)=tx ∘ g ∘ tb. This is the finite Hom-space component of equation (41).
example (tb : B ≃ₗ[k] B₀) (tx : X₀ ≃ₗ[k] X)
    (φ : (B₀ →ₗ[k] X₀) ≃ₗ[k] (B₀ →ₗ[k] X₀))
    (g : B₀ →ₗ[k] X₀) (v : B) :
    PathFrobenius φ (tb.symm.arrowCongr tx) ((tb.symm.arrowCongr tx) g) v =
      tx (φ g (tb v)) := by sorry

end TwoSidedTransportTest

section FixedPath
variable {P : Type u}

/-- Choose the unique fixed path after the geometric Lang theorem proves existence. -/
noncomputable def CanonicalFrobeniusPath (φ : P → P) (h : ∃! p, φ p = p) : P :=
  h.choose

namespace CanonicalFrobeniusPath
theorem fixed (φ : P → P) (h : ∃! p, φ p = p) :
    φ (CanonicalFrobeniusPath φ h) = CanonicalFrobeniusPath φ h := by sorry

theorem unique (φ : P → P) (h : ∃! p, φ p = p) (p : P) (hp : φ p = p) :
    p = CanonicalFrobeniusPath φ h := by sorry

-- CanonicalFrobeniusPath.comp: omitted geometric endpoint composition under weights.
-- CanonicalFrobeniusPath.sameDisc: omitted rigid comparison and analytic local transport.
-- CanonicalFrobeniusPath.power: omitted geometric Frobenius-power weight argument;
-- unique fixed points for an arbitrary self-map do not imply this power statement.

-- test: canonical_equal_endpoint
-- At equal endpoints the path torsor is the tensor automorphism group, and its
-- identity is fixed by every group endomorphism. Uniqueness selects that identity.
example {G : Type u} [Group G] (φ : G →* G) (h : ∃! g, φ g = g) :
    CanonicalFrobeniusPath φ h = 1 := by sorry
-- test: canonical_additive
example (c : ℚ) : (∃! z : ℚ, 2 * z + c = z) ∧
    ∀ h : ∃! z : ℚ, 2 * z + c = z,
      CanonicalFrobeniusPath (fun z : ℚ => 2 * z + c) h = -c := by sorry
-- test: canonical_identity_fails
example : ¬ ∃! z : ℚ, (id z) = z := by sorry

end CanonicalFrobeniusPath
end FixedPath

/-!
Omitted geometric theorem signatures, with their exact statements and proof inputs in the
packet and reader. These names reserve the library interface; they are not axioms or opaque
propositions in this file:

* unipotent_invariant_criterion: neutral geometric category, nonzero objects only.
* etale_galois_completion: continuous geometric completion and arithmetic path action.
* universal_length_object: realization of the finite regular module as a geometric object.
* affine_universal_property: horizontal maps determined by a vector in the base fibre.
* affine_composition: word multiplication f2*f1, not f1*f2.
* proper_maximal_quotient: maximal no-pole quotient on the proper curve.
* filtered_extension_hypercohomology: actual logarithmic filtered Hom complex and its H1.
* hadian_hodge_filtration: proper/logarithmic extension, quotient grades, pointer normalization.
* rigid_frobenius_equivalence: the CLS tensor autoequivalence, with coefficient semilinearity.
* universal_frobenius_normalization: horizontal pointed universal isomorphism Phi_n.
* nonabelian_berthelot_ogus: actual algebraic/rigid tensor equivalence and endpoint evaluation.
* frobenius_lang_isomorphism: scheme Lang isomorphism under the all-grade weight hypothesis.
* word_path_transport: imported local L1 coefficients plus the global fixed-path bridge.
* crystalline_path_coordinates: Olsson ind-crystalline coordinate Hopf/coaction comparison.
* finite_path_crystalline_comparison: finite dual length pieces and strict filtered comparison.
* depth_one_jacobian: proper Jacobian Tate/de Rham realization and Kummer path compatibility.
* unipotent_loses_finite_covers: the G_m power cover and the additive Q_p point obstruction.

The native examples above test categorical/linear consequences. The full geometric tests
are the reader's acceptance criteria; the omissions and supplier requests remain recorded
as gaps. In particular this compilation is not a compilation of a fabricated replacement
for the nonlinear comparison theorem.
-/

end TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty.NC2
